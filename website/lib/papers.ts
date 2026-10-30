import * as fs from 'fs';
import * as path from 'path';
import { renderMath } from './render-math';

export type Paper = {
  slug: string;
  title: string;
  subtitle: string;
  part: string;
  volume: number;
  abstract: string;
  abstractFull: string;
  pages: number;
  hasCode: boolean;
  category: string;
  date: string;
};

export type Heading = { id: string; text: string; level: number };

const CONTENT_DIR = path.join(process.cwd(), 'content');

export function getPapers(): Paper[] {
  const raw = fs.readFileSync(path.join(CONTENT_DIR, 'manifest.json'), 'utf8');
  return JSON.parse(raw) as Paper[];
}

export function getPaper(slug: string): Paper | undefined {
  return getPapers().find((p) => p.slug === slug);
}

function extractHeadings(html: string): Heading[] {
  const headings: Heading[] = [];
  const re = /<h([2-4])[^>]*id="([^"]+)"[^>]*>([\s\S]*?)<\/h\1>/g;
  let m: RegExpExecArray | null;
  while ((m = re.exec(html)) !== null) {
    const text = m[3].replace(/<[^>]+>/g, '').trim();
    if (!text) continue;
    headings.push({ id: m[2], text, level: parseInt(m[1], 10) });
  }
  return headings;
}

export function getPaperHTML(slug: string): { html: string; headings: Heading[] } {
  const file = path.join(CONTENT_DIR, 'papers', `${slug}.html`);
  const raw = fs.readFileSync(file, 'utf8');
  const html = renderMath(raw);
  return { html, headings: extractHeadings(html) };
}

function linkifyCitations(html: string): string {
  // rewrite [N] citation markers in text nodes (never inside tags) to source anchors
  return html
    .split(/(<(?:[^>"']|"[^"]*"|'[^']*')*>)/)
    .map((piece) => {
      if (piece.startsWith('<')) return piece;
      return piece.replace(/\[(\d{1,3})\]/g, '<a class="citation" href="#src-$1">[$1]</a>');
    })
    .join('');
}

function sourcesSection(): string {
  const file = path.join(CONTENT_DIR, 'periodic-table-sources.md');
  if (!fs.existsSync(file)) return '';
  const entries = fs.readFileSync(file, 'utf8')
    .split('\n')
    .map((l) => l.trim())
    .filter((l) => /^\[\d+\]/.test(l));
  const items = entries.map((line) => {
    const m = line.match(/^\[(\d+)\]\s*([\s\S]*)$/);
    if (!m) return '';
    const body = m[2].replace(/(https?:\/\/\S+)/g, '<a href="$1">$1</a>');
    return `<p class="bibitem" id="src-${m[1]}"><span class="bib-num">[${m[1]}]</span> ${body}</p>`;
  });
  return `<section class="paper-sources"><h2 id="sources">Sources</h2>${items.join('\n')}</section>`;
}

export async function getPeriodicTable(): Promise<{ html: string; headings: Heading[] }> {
  const md = fs.readFileSync(path.join(CONTENT_DIR, 'periodic-table.md'), 'utf8');
  const { marked } = await import('marked');
  const rawHtml = await marked.parse(md, { async: true, gfm: true });
  const DOMPurify = (await import('isomorphic-dompurify')).default;
  const clean = DOMPurify.sanitize(rawHtml, {
    ADD_TAGS: ['span', 'table', 'thead', 'tbody', 'tr', 'th', 'td', 'caption'],
    ADD_ATTR: ['class', 'id'],
  });
  const html = renderMath(linkifyCitations(clean)) + sourcesSection();
  return { html, headings: extractHeadings(html) };
}
