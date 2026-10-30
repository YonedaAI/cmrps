import katex from 'katex';
import { getMacros } from './macros';

const HTML_ESCAPES: Record<string, string> = {
  '&amp;': '&',
  '&lt;': '<',
  '&gt;': '>',
  '&quot;': '"',
  '&#39;': "'",
  '&nbsp;': ' ',
};

function unescapeHtml(s: string): string {
  return s.replace(/&(amp|lt|gt|quot|#39|nbsp);/g, (m) => HTML_ESCAPES[m] ?? m);
}

function renderOne(tex: string, displayMode: boolean): string {
  return katex.renderToString(unescapeHtml(tex).trim(), {
    displayMode,
    throwOnError: false,
    trust: true,
    macros: getMacros(),
    strict: false,
  });
}

type Piece = { text: string; tag: boolean };

function splitTextAndTags(html: string): Piece[] {
  const pieces: Piece[] = [];
  const tagRe = /<(?:[^>"']|"[^"]*"|'[^']*')*>/g;
  let last = 0;
  let m: RegExpExecArray | null;
  while ((m = tagRe.exec(html)) !== null) {
    if (m.index > last) pieces.push({ text: html.slice(last, m.index), tag: false });
    pieces.push({ text: m[0], tag: true });
    last = m.index + m[0].length;
  }
  if (last < html.length) pieces.push({ text: html.slice(last), tag: false });
  return pieces;
}

/** Scan one text run and replace every math delimiter with KaTeX markup. */
function renderTextRun(text: string): string {
  let out = '';
  let i = 0;
  const n = text.length;

  const startsWith = (s: string) => text.startsWith(s, i);

  while (i < n) {
    let tex: string | null = null;
    let displayMode = false;
    let end = -1;

    if (startsWith('\\[')) {
      end = text.indexOf('\\]', i + 2);
      if (end >= 0) {
        tex = text.slice(i + 2, end);
        end += 2;
        displayMode = true;
      }
    } else if (startsWith('$$')) {
      end = text.indexOf('$$', i + 2);
      if (end >= 0) {
        tex = text.slice(i + 2, end);
        end += 2;
        displayMode = true;
      }
    } else if (startsWith('\\(')) {
      end = text.indexOf('\\)', i + 2);
      if (end >= 0) {
        tex = text.slice(i + 2, end);
        end += 2;
      }
    } else if (text[i] === '$' && text[i + 1] !== '$') {
      const close = text.indexOf('$', i + 1);
      // require non-empty body with no blank line (avoids currency false positives)
      if (close > i + 1) {
        const body = text.slice(i + 1, close);
        if (!body.includes('\n')) {
          tex = body;
          end = close + 1;
        }
      }
    }

    if (tex !== null && end > 0) {
      const rendered = renderOne(tex, displayMode);
      out += displayMode
        ? `<span class="math-display-rendered">${rendered}</span>`
        : rendered;
      i = end;
    } else {
      out += text[i];
      i += 1;
    }
  }
  return out;
}

/**
 * Build-time math pre-rendering. Math is replaced only in TEXT nodes — tag
 * attributes (e.g. href values containing '$') are never touched, and inline
 * and display math get distinct classes so CSS cannot force inline math onto
 * separate lines. Handles \(...\), \[...\], $$...$$, $...$ and the pandoc
 * math spans, whose delimiters sit in text nodes.
 */
export function renderMath(html: string): string {
  return splitTextAndTags(html)
    .map((p) => (p.tag ? p.text : renderTextRun(p.text)))
    .join('');
}
