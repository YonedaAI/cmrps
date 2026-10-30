---
reviewer: codex (OpenAI) gpt-6.1-sol
type: website
round: 2
date: 2026-10-30T14:23:23Z
---
Reading additional input from stdin...
OpenAI Codex v0.166.0
--------
workdir: /Users/mlong/Documents/Development/classification-physical-systems
model: gpt-6.1-sol
provider: openai
approval: never
sandbox: read-only
reasoning effort: medium
reasoning summaries: none
session id: 01a18d31-a6be-7b43-8484-59ef19c4fdb0
--------
user
Read ONLY the website/ source (do not explore other directories). This is round 2 after fixes. Round 1 issues were: (1) $...$ regex corrupting href attributes in render-math.ts — fixed by text-node-only rendering; (2) comma-separated reference links with nonexistent fragment targets — fixed by emitting one anchor per label; (3) periodic-table citations without a published bibliography — fixed by a Sources section with linkified [N] citations; (4) inline math forced onto separate lines — fixed with separate inline/display handling; (5) sticky header covering anchor destinations — fixed with scroll-padding/scroll-margin offsets; (6) process/verification narration in public copy — replaced. Review again for: broken KaTeX math (raw TeX leaking into HTML), horizontal overflow at 375px width, nav collisions on small screens, missing OG/Twitter meta tags, missing run-level summary pages (e.g. a periodic-table page when the run has one), dead links, and any process/reviewer language in public copy. List issues with file:line references and concrete fixes. End with VERDICT: PASS or VERDICT: NEEDS_FIX.
warning: Under-development features enabled: chronicle. Under-development features are incomplete and may behave unpredictably. To suppress this warning, set `suppress_unstable_features_warning = true` in /Users/mlong/.codex/config.toml.
warning: clamping SessionEnd hook timeout to 3s in /Users/mlong/.codex/plugins/cache/openai-codex/codex/1.0.6/hooks/hooks.json
hook: SessionStart
hook: SessionStart
hook: SessionStart
hook: SessionStart
hook: SessionStart
hook: SessionStart
hook: SessionStart Completed
hook: SessionStart Completed
hook: SessionStart Completed
hook: SessionStart Completed
hook: SessionStart Completed
hook: SessionStart Completed
codex
I’ll review only `website/`, checking the fixes and the remaining math, mobile layout, metadata, navigation, and public-copy risks.
exec
/usr/local/bin/zsh -lc 'rg --files website' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
website/tailwind.config.ts
website/postcss.config.mjs
website/package-lock.json
website/theme.json
website/tsconfig.json
website/README.md
website/package.json
website/next.config.mjs
website/lib/render-math.ts
website/lib/papers.ts
website/lib/macros.ts
website/content/periodic-table.md
website/content/periodic-table-sources.md
website/content/manifest.json
website/components/TableOfContents.tsx
website/components/PaperContent.tsx
website/app/globals.css
website/app/page.tsx
website/app/periodic-table/page.tsx
website/app/fonts/GeistVF.woff
website/app/fonts/GeistMonoVF.woff
website/public/og/vol-03-irreducibility-decomposition.png
website/app/layout.tsx
website/public/og/vol-06-quantum-systems.png
website/public/og/vol-11-completeness-obstructions.png
website/public/og/vol-12-principia-physica.png
website/public/og/vol-01-foundations.png
website/public/og/vol-09-gravity-information-geometry.png
website/public/og/synthesis.png
website/public/og/og-image.png
website/public/og/vol-02-structural-families.png
website/public/og/og-default.png
website/content/papers/vol-06-quantum-systems.html
website/content/papers/vol-03-irreducibility-decomposition.html
website/content/papers/vol-01-foundations.html
website/public/og/vol-05-classical-systems.png
website/content/papers/vol-04-yoneda-classification.html
website/content/papers/vol-10-observational-equivalence.html
website/app/favicon.ico
website/public/og/vol-10-observational-equivalence.png
website/public/og/vol-04-yoneda-classification.png
website/public/og/vol-07-gauge-qft.png
website/public/og/vol-08-spacetime-reconstruction.png
website/content/papers/synthesis.html
website/content/papers/vol-08-spacetime-reconstruction.html
website/content/papers/vol-02-structural-families.html
website/content/papers/vol-11-completeness-obstructions.html
website/content/papers/vol-05-classical-systems.html
website/content/papers/vol-07-gauge-qft.html
website/content/papers/vol-12-principia-physica.html
website/content/papers/vol-09-gravity-information-geometry.html
website/public/pdf/synthesis.pdf
website/public/pdf/vol-11-completeness-obstructions.pdf
website/public/pdf/vol-06-quantum-systems.pdf
website/public/pdf/vol-12-principia-physica.pdf
website/public/pdf/vol-01-foundations.pdf
website/public/pdf/vol-03-irreducibility-decomposition.pdf
website/public/pdf/vol-05-classical-systems.pdf
website/public/pdf/vol-04-yoneda-classification.pdf
website/public/pdf/vol-08-spacetime-reconstruction.pdf
website/public/pdf/vol-07-gauge-qft.pdf
website/public/pdf/vol-10-observational-equivalence.pdf
website/public/pdf/vol-09-gravity-information-geometry.pdf
website/public/pdf/vol-02-structural-families.pdf
website/app/papers/[slug]/page.tsx

exec
/usr/local/bin/zsh -lc 'nl -ba website/lib/render-math.ts; nl -ba website/lib/papers.ts; nl -ba website/components/PaperContent.tsx; nl -ba website/components/TableOfContents.tsx' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
     1	import katex from 'katex';
     2	import { getMacros } from './macros';
     3	
     4	const HTML_ESCAPES: Record<string, string> = {
     5	  '&amp;': '&',
     6	  '&lt;': '<',
     7	  '&gt;': '>',
     8	  '&quot;': '"',
     9	  '&#39;': "'",
    10	  '&nbsp;': ' ',
    11	};
    12	
    13	function unescapeHtml(s: string): string {
    14	  return s.replace(/&(amp|lt|gt|quot|#39|nbsp);/g, (m) => HTML_ESCAPES[m] ?? m);
    15	}
    16	
    17	function renderOne(tex: string, displayMode: boolean): string {
    18	  return katex.renderToString(unescapeHtml(tex).trim(), {
    19	    displayMode,
    20	    throwOnError: false,
    21	    trust: true,
    22	    macros: getMacros(),
    23	    strict: false,
    24	  });
    25	}
    26	
    27	type Piece = { text: string; tag: boolean };
    28	
    29	function splitTextAndTags(html: string): Piece[] {
    30	  const pieces: Piece[] = [];
    31	  const tagRe = /<(?:[^>"']|"[^"]*"|'[^']*')*>/g;
    32	  let last = 0;
    33	  let m: RegExpExecArray | null;
    34	  while ((m = tagRe.exec(html)) !== null) {
    35	    if (m.index > last) pieces.push({ text: html.slice(last, m.index), tag: false });
    36	    pieces.push({ text: m[0], tag: true });
    37	    last = m.index + m[0].length;
    38	  }
    39	  if (last < html.length) pieces.push({ text: html.slice(last), tag: false });
    40	  return pieces;
    41	}
    42	
    43	/** Scan one text run and replace every math delimiter with KaTeX markup. */
    44	function renderTextRun(text: string): string {
    45	  let out = '';
    46	  let i = 0;
    47	  const n = text.length;
    48	
    49	  const startsWith = (s: string) => text.startsWith(s, i);
    50	
    51	  while (i < n) {
    52	    let tex: string | null = null;
    53	    let displayMode = false;
    54	    let end = -1;
    55	
    56	    if (startsWith('\\[')) {
    57	      end = text.indexOf('\\]', i + 2);
    58	      if (end >= 0) {
    59	        tex = text.slice(i + 2, end);
    60	        end += 2;
    61	        displayMode = true;
    62	      }
    63	    } else if (startsWith('$$')) {
    64	      end = text.indexOf('$$', i + 2);
    65	      if (end >= 0) {
    66	        tex = text.slice(i + 2, end);
    67	        end += 2;
    68	        displayMode = true;
    69	      }
    70	    } else if (startsWith('\\(')) {
    71	      end = text.indexOf('\\)', i + 2);
    72	      if (end >= 0) {
    73	        tex = text.slice(i + 2, end);
    74	        end += 2;
    75	      }
    76	    } else if (text[i] === '$' && text[i + 1] !== '$') {
    77	      const close = text.indexOf('$', i + 1);
    78	      // require non-empty body with no blank line (avoids currency false positives)
    79	      if (close > i + 1) {
    80	        const body = text.slice(i + 1, close);
    81	        if (!body.includes('\n')) {
    82	          tex = body;
    83	          end = close + 1;
    84	        }
    85	      }
    86	    }
    87	
    88	    if (tex !== null && end > 0) {
    89	      const rendered = renderOne(tex, displayMode);
    90	      out += displayMode
    91	        ? `<span class="math-display-rendered">${rendered}</span>`
    92	        : rendered;
    93	      i = end;
    94	    } else {
    95	      out += text[i];
    96	      i += 1;
    97	    }
    98	  }
    99	  return out;
   100	}
   101	
   102	/**
   103	 * Build-time math pre-rendering. Math is replaced only in TEXT nodes — tag
   104	 * attributes (e.g. href values containing '$') are never touched, and inline
   105	 * and display math get distinct classes so CSS cannot force inline math onto
   106	 * separate lines. Handles \(...\), \[...\], $$...$$, $...$ and the pandoc
   107	 * math spans, whose delimiters sit in text nodes.
   108	 */
   109	export function renderMath(html: string): string {
   110	  return splitTextAndTags(html)
   111	    .map((p) => (p.tag ? p.text : renderTextRun(p.text)))
   112	    .join('');
   113	}
     1	import * as fs from 'fs';
     2	import * as path from 'path';
     3	import { renderMath } from './render-math';
     4	
     5	export type Paper = {
     6	  slug: string;
     7	  title: string;
     8	  subtitle: string;
     9	  part: string;
    10	  volume: number;
    11	  abstract: string;
    12	  abstractFull: string;
    13	  pages: number;
    14	  hasCode: boolean;
    15	  category: string;
    16	  date: string;
    17	};
    18	
    19	export type Heading = { id: string; text: string; level: number };
    20	
    21	const CONTENT_DIR = path.join(process.cwd(), 'content');
    22	
    23	export function getPapers(): Paper[] {
    24	  const raw = fs.readFileSync(path.join(CONTENT_DIR, 'manifest.json'), 'utf8');
    25	  return JSON.parse(raw) as Paper[];
    26	}
    27	
    28	export function getPaper(slug: string): Paper | undefined {
    29	  return getPapers().find((p) => p.slug === slug);
    30	}
    31	
    32	function extractHeadings(html: string): Heading[] {
    33	  const headings: Heading[] = [];
    34	  const re = /<h([2-4])[^>]*id="([^"]+)"[^>]*>([\s\S]*?)<\/h\1>/g;
    35	  let m: RegExpExecArray | null;
    36	  while ((m = re.exec(html)) !== null) {
    37	    const text = m[3].replace(/<[^>]+>/g, '').trim();
    38	    if (!text) continue;
    39	    headings.push({ id: m[2], text, level: parseInt(m[1], 10) });
    40	  }
    41	  return headings;
    42	}
    43	
    44	export function getPaperHTML(slug: string): { html: string; headings: Heading[] } {
    45	  const file = path.join(CONTENT_DIR, 'papers', `${slug}.html`);
    46	  const raw = fs.readFileSync(file, 'utf8');
    47	  const html = renderMath(raw);
    48	  return { html, headings: extractHeadings(html) };
    49	}
    50	
    51	function linkifyCitations(html: string): string {
    52	  // rewrite [N] citation markers in text nodes (never inside tags) to source anchors
    53	  return html
    54	    .split(/(<(?:[^>"']|"[^"]*"|'[^']*')*>)/)
    55	    .map((piece) => {
    56	      if (piece.startsWith('<')) return piece;
    57	      return piece.replace(/\[(\d{1,3})\]/g, '<a class="citation" href="#src-$1">[$1]</a>');
    58	    })
    59	    .join('');
    60	}
    61	
    62	function sourcesSection(): string {
    63	  const file = path.join(CONTENT_DIR, 'periodic-table-sources.md');
    64	  if (!fs.existsSync(file)) return '';
    65	  const entries = fs.readFileSync(file, 'utf8')
    66	    .split('\n')
    67	    .map((l) => l.trim())
    68	    .filter((l) => /^\[\d+\]/.test(l));
    69	  const items = entries.map((line) => {
    70	    const m = line.match(/^\[(\d+)\]\s*([\s\S]*)$/);
    71	    if (!m) return '';
    72	    const body = m[2].replace(/(https?:\/\/\S+)/g, '<a href="$1">$1</a>');
    73	    return `<p class="bibitem" id="src-${m[1]}"><span class="bib-num">[${m[1]}]</span> ${body}</p>`;
    74	  });
    75	  return `<section class="paper-sources"><h2 id="sources">Sources</h2>${items.join('\n')}</section>`;
    76	}
    77	
    78	export async function getPeriodicTable(): Promise<{ html: string; headings: Heading[] }> {
    79	  const md = fs.readFileSync(path.join(CONTENT_DIR, 'periodic-table.md'), 'utf8');
    80	  const { marked } = await import('marked');
    81	  const rawHtml = await marked.parse(md, { async: true, gfm: true });
    82	  const DOMPurify = (await import('isomorphic-dompurify')).default;
    83	  const clean = DOMPurify.sanitize(rawHtml, {
    84	    ADD_TAGS: ['span', 'table', 'thead', 'tbody', 'tr', 'th', 'td', 'caption'],
    85	    ADD_ATTR: ['class', 'id'],
    86	  });
    87	  const html = renderMath(linkifyCitations(clean)) + sourcesSection();
    88	  return { html, headings: extractHeadings(html) };
    89	}
     1	'use client';
     2	import { useCallback } from 'react';
     3	
     4	/**
     5	 * Injects build-time pre-rendered paper HTML directly into the DOM, bypassing
     6	 * React reconciliation (which would mangle KaTeX spans on hydration). The HTML
     7	 * is our own pandoc output pre-rendered with KaTeX at build time — not
     8	 * user-supplied content.
     9	 */
    10	export function PaperContent({ html }: { html: string }) {
    11	  const contentRef = useCallback((node: HTMLDivElement | null) => {
    12	    if (node) {
    13	      node.innerHTML = html;
    14	    }
    15	  }, [html]);
    16	
    17	  return <div ref={contentRef} className="paper-content" />;
    18	}
     1	'use client';
     2	import { useState, useEffect } from 'react';
     3	
     4	export function TableOfContents({
     5	  headings,
     6	}: {
     7	  headings: { id: string; text: string; level: number }[];
     8	}) {
     9	  const [activeId, setActiveId] = useState('');
    10	  const [open, setOpen] = useState(false);
    11	
    12	  useEffect(() => {
    13	    const onScroll = () => {
    14	      const scrollY = window.scrollY + 120;
    15	      let current = '';
    16	      for (const { id } of headings) {
    17	        const el = document.getElementById(id);
    18	        if (el && el.offsetTop <= scrollY) {
    19	          current = id;
    20	        }
    21	      }
    22	      setActiveId(current);
    23	    };
    24	    window.addEventListener('scroll', onScroll, { passive: true });
    25	    onScroll();
    26	    return () => window.removeEventListener('scroll', onScroll);
    27	  }, [headings]);
    28	
    29	  return (
    30	    <div className="toc-wrap">
    31	      <button
    32	        type="button"
    33	        className="toc-toggle"
    34	        onClick={() => setOpen((v) => !v)}
    35	        aria-expanded={open}
    36	      >
    37	        Contents {open ? '▾' : '▸'}
    38	      </button>
    39	      <nav className={`toc ${open ? 'toc-open' : ''}`}>
    40	        {headings.map(({ id, text, level }) => (
    41	          <a
    42	            key={id}
    43	            href={`#${id}`}
    44	            className={`toc-item toc-level-${level} ${activeId === id ? 'toc-active' : ''}`}
    45	            onClick={() => setOpen(false)}
    46	          >
    47	            {text}
    48	          </a>
    49	        ))}
    50	      </nav>
    51	    </div>
    52	  );
    53	}

exec
/usr/local/bin/zsh -lc "nl -ba website/app/globals.css; nl -ba website/app/layout.tsx; nl -ba website/app/page.tsx; nl -ba website/app/periodic-table/page.tsx; nl -ba 'website/app/papers/[slug]/page.tsx'; cat website/package.json; cat website/content/manifest.json" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
     1	@tailwind base;
     2	@tailwind components;
     3	@tailwind utilities;
     4	
     5	:root {
     6	  --bg: #070a16;
     7	  --surface: #0e1428;
     8	  --surface-hover: #16203d;
     9	  --accent: #6d8cff;
    10	  --accent-hover: #8aa4ff;
    11	  --accent-glow: rgba(109, 140, 255, 0.16);
    12	  --accent-secondary: #22d3ee;
    13	  --text: #e8ecf8;
    14	  --text-muted: #9aa7c7;
    15	  --text-dim: #5c6a8c;
    16	  --border: #1e2a4a;
    17	  --code-bg: #0b1122;
    18	  --success: #34d399;
    19	  --warning: #fbbf24;
    20	  --font-heading: var(--font-spectral), Georgia, 'Times New Roman', serif;
    21	  --font-body: var(--font-inter), system-ui, -apple-system, sans-serif;
    22	}
    23	
    24	* {
    25	  box-sizing: border-box;
    26	}
    27	
    28	html {
    29	  scroll-behavior: smooth;
    30	  scroll-padding-top: 130px;
    31	  -webkit-text-size-adjust: 100%;
    32	}
    33	
    34	@media (min-width: 1024px) {
    35	  html {
    36	    scroll-padding-top: 84px;
    37	  }
    38	}
    39	
    40	.paper-content h2,
    41	.paper-content h3,
    42	.paper-content h4,
    43	.md-content h2,
    44	.md-content h3 {
    45	  scroll-margin-top: 110px;
    46	}
    47	
    48	body {
    49	  background: var(--bg);
    50	  color: var(--text);
    51	  font-family: var(--font-body);
    52	  line-height: 1.65;
    53	  margin: 0;
    54	  overflow-x: hidden;
    55	}
    56	
    57	a {
    58	  color: var(--accent);
    59	  text-decoration: none;
    60	}
    61	a:hover {
    62	  color: var(--accent-hover);
    63	}
    64	
    65	h1, h2, h3, h4, h5 {
    66	  font-family: var(--font-heading);
    67	  color: var(--text);
    68	  line-height: 1.25;
    69	  overflow-wrap: break-word;
    70	}
    71	
    72	/* ---------- header / nav ---------- */
    73	
    74	.site-header {
    75	  position: sticky;
    76	  top: 0;
    77	  z-index: 50;
    78	  background: rgba(7, 10, 22, 0.92);
    79	  backdrop-filter: blur(10px);
    80	  border-bottom: 1px solid var(--border);
    81	}
    82	
    83	.site-header-inner {
    84	  max-width: 1120px;
    85	  margin: 0 auto;
    86	  padding: 0.75rem 1rem;
    87	  display: flex;
    88	  flex-wrap: wrap;
    89	  align-items: center;
    90	  gap: 0.5rem 1.25rem;
    91	}
    92	
    93	.site-title {
    94	  font-family: var(--font-heading);
    95	  font-weight: 700;
    96	  font-size: 1.05rem;
    97	  letter-spacing: 0.04em;
    98	  color: var(--text);
    99	  display: flex;
   100	  align-items: center;
   101	  gap: 0.55rem;
   102	  min-width: 0;
   103	  flex: 1 1 auto;
   104	}
   105	
   106	.site-title .mark {
   107	  color: var(--accent-secondary);
   108	  font-family: var(--font-body);
   109	  font-size: 0.72rem;
   110	  font-weight: 600;
   111	  letter-spacing: 0.18em;
   112	  border: 1px solid var(--border);
   113	  border-radius: 4px;
   114	  padding: 0.15rem 0.4rem;
   115	  white-space: nowrap;
   116	}
   117	
   118	.site-nav {
   119	  display: flex;
   120	  flex-wrap: wrap;
   121	  gap: 0.35rem 1rem;
   122	  font-size: 0.88rem;
   123	}
   124	
   125	.site-nav a {
   126	  color: var(--text-muted);
   127	  padding: 0.25rem 0;
   128	  border-bottom: 2px solid transparent;
   129	}
   130	.site-nav a:hover {
   131	  color: var(--text);
   132	  border-bottom-color: var(--accent);
   133	}
   134	
   135	/* ---------- hero ---------- */
   136	
   137	.hero {
   138	  position: relative;
   139	  padding: 3rem 1rem 2.25rem;
   140	  overflow: hidden;
   141	  border-bottom: 1px solid var(--border);
   142	}
   143	
   144	@media (min-width: 768px) {
   145	  .hero {
   146	    padding: 5.5rem 1.5rem 4.5rem;
   147	  }
   148	}
   149	
   150	.hero-bg {
   151	  position: absolute;
   152	  inset: 0;
   153	  pointer-events: none;
   154	  background:
   155	    radial-gradient(900px 380px at 82% -10%, rgba(109, 140, 255, 0.18), transparent 65%),
   156	    radial-gradient(700px 320px at 8% 110%, rgba(34, 211, 238, 0.12), transparent 60%);
   157	}
   158	
   159	.hero-grid-lines {
   160	  position: absolute;
   161	  inset: 0;
   162	  pointer-events: none;
   163	  opacity: 0.5;
   164	  background-image:
   165	    linear-gradient(var(--border) 1px, transparent 1px),
   166	    linear-gradient(90deg, var(--border) 1px, transparent 1px);
   167	  background-size: 72px 72px;
   168	  mask-image: radial-gradient(ellipse 90% 80% at 50% 0%, black 20%, transparent 78%);
   169	  -webkit-mask-image: radial-gradient(ellipse 90% 80% at 50% 0%, black 20%, transparent 78%);
   170	}
   171	
   172	.hero-inner {
   173	  position: relative;
   174	  max-width: 1120px;
   175	  margin: 0 auto;
   176	}
   177	
   178	.hero-kicker {
   179	  color: var(--accent-secondary);
   180	  font-size: 0.78rem;
   181	  font-weight: 600;
   182	  letter-spacing: 0.22em;
   183	  text-transform: uppercase;
   184	  margin: 0 0 1rem;
   185	}
   186	
   187	.hero h1 {
   188	  font-size: clamp(1.9rem, 5.4vw, 3.4rem);
   189	  margin: 0 0 1rem;
   190	  max-width: 20em;
   191	}
   192	
   193	.hero h1 .em {
   194	  color: var(--accent);
   195	  font-style: italic;
   196	}
   197	
   198	.hero-sub {
   199	  color: var(--text-muted);
   200	  font-size: clamp(1rem, 2.2vw, 1.18rem);
   201	  max-width: 46em;
   202	  margin: 0 0 1.5rem;
   203	}
   204	
   205	.hero-meta {
   206	  display: flex;
   207	  flex-wrap: wrap;
   208	  gap: 0.6rem 1.4rem;
   209	  color: var(--text-dim);
   210	  font-size: 0.85rem;
   211	}
   212	
   213	.hero-meta b {
   214	  color: var(--text);
   215	  font-weight: 600;
   216	}
   217	
   218	.hero-actions {
   219	  display: flex;
   220	  flex-wrap: wrap;
   221	  gap: 0.75rem;
   222	  margin-top: 1.75rem;
   223	}
   224	
   225	/* ---------- buttons ---------- */
   226	
   227	.btn {
   228	  display: inline-flex;
   229	  align-items: center;
   230	  gap: 0.45rem;
   231	  padding: 0.65rem 1.15rem;
   232	  border-radius: 8px;
   233	  font-size: 0.92rem;
   234	  font-weight: 600;
   235	  border: 1px solid transparent;
   236	  transition: all 0.18s ease;
   237	}
   238	
   239	.btn-primary {
   240	  background: var(--accent);
   241	  color: #071022;
   242	}
   243	.btn-primary:hover {
   244	  background: var(--accent-hover);
   245	  color: #071022;
   246	  box-shadow: 0 6px 24px var(--accent-glow);
   247	}
   248	
   249	.btn-ghost {
   250	  border-color: var(--border);
   251	  color: var(--text);
   252	  background: transparent;
   253	}
   254	.btn-ghost:hover {
   255	  border-color: var(--accent);
   256	  color: var(--accent-hover);
   257	}
   258	
   259	/* ---------- section shells ---------- */
   260	
   261	.section {
   262	  max-width: 1120px;
   263	  margin: 0 auto;
   264	  padding: 2.75rem 1rem;
   265	}
   266	
   267	@media (min-width: 768px) {
   268	  .section {
   269	    padding: 4rem 1.5rem;
   270	  }
   271	}
   272	
   273	.section-head {
   274	  display: flex;
   275	  flex-wrap: wrap;
   276	  align-items: baseline;
   277	  justify-content: space-between;
   278	  gap: 0.75rem;
   279	  margin-bottom: 1.75rem;
   280	}
   281	
   282	.section-head h2 {
   283	  font-size: clamp(1.45rem, 3.2vw, 2.1rem);
   284	  margin: 0;
   285	}
   286	
   287	.section-head .hint {
   288	  color: var(--text-dim);
   289	  font-size: 0.85rem;
   290	}
   291	
   292	/* ---------- paper cards ---------- */
   293	
   294	.paper-grid {
   295	  display: grid;
   296	  grid-template-columns: 1fr;
   297	  gap: 1.15rem;
   298	}
   299	
   300	@media (min-width: 640px) {
   301	  .paper-grid {
   302	    grid-template-columns: repeat(2, 1fr);
   303	  }
   304	}
   305	
   306	@media (min-width: 1024px) {
   307	  .paper-grid {
   308	    grid-template-columns: repeat(3, 1fr);
   309	  }
   310	}
   311	
   312	.paper-card {
   313	  position: relative;
   314	  display: flex;
   315	  flex-direction: column;
   316	  background: var(--surface);
   317	  border: 1px solid var(--border);
   318	  border-radius: 12px;
   319	  padding: 1.25rem 1.25rem 1.15rem;
   320	  min-height: 100%;
   321	  transition: transform 0.18s ease, border-color 0.18s ease, box-shadow 0.18s ease;
   322	  overflow: hidden;
   323	}
   324	
   325	.paper-card::before {
   326	  content: '';
   327	  position: absolute;
   328	  top: 0;
   329	  left: 0;
   330	  right: 0;
   331	  height: 3px;
   332	  background: linear-gradient(90deg, var(--accent), var(--accent-secondary));
   333	  opacity: 0.75;
   334	}
   335	
   336	.paper-card:hover {
   337	  transform: translateY(-3px);
   338	  border-color: var(--accent);
   339	  box-shadow: 0 14px 36px rgba(0, 0, 0, 0.35), 0 0 0 1px var(--accent-glow);
   340	}
   341	
   342	.card-part {
   343	  display: flex;
   344	  justify-content: space-between;
   345	  align-items: center;
   346	  gap: 0.5rem;
   347	  margin-bottom: 0.75rem;
   348	  font-size: 0.75rem;
   349	  letter-spacing: 0.12em;
   350	  text-transform: uppercase;
   351	  color: var(--accent-secondary);
   352	  font-weight: 600;
   353	}
   354	
   355	.card-part .cat {
   356	  color: var(--text-dim);
   357	  letter-spacing: 0.06em;
   358	  text-transform: none;
   359	  font-family: ui-monospace, monospace;
   360	}
   361	
   362	.paper-card h3 {
   363	  font-size: 1.13rem;
   364	  margin: 0 0 0.55rem;
   365	}
   366	
   367	.paper-card h3 a {
   368	  color: var(--text);
   369	}
   370	.paper-card:hover h3 a {
   371	  color: var(--accent-hover);
   372	}
   373	
   374	.card-sub {
   375	  color: var(--text-dim);
   376	  font-size: 0.8rem;
   377	  margin: 0 0 0.75rem;
   378	}
   379	
   380	.card-abstract {
   381	  color: var(--text-muted);
   382	  font-size: 0.88rem;
   383	  margin: 0 0 1.15rem;
   384	  flex: 1;
   385	}
   386	
   387	.card-foot {
   388	  display: flex;
   389	  flex-wrap: wrap;
   390	  align-items: center;
   391	  gap: 0.55rem 0.9rem;
   392	  border-top: 1px solid var(--border);
   393	  padding-top: 0.85rem;
   394	  font-size: 0.82rem;
   395	  color: var(--text-dim);
   396	}
   397	
   398	.card-foot .read {
   399	  color: var(--accent);
   400	  font-weight: 600;
   401	}
   402	
   403	.card-foot .pdf-link {
   404	  color: var(--text-muted);
   405	  border: 1px solid var(--border);
   406	  border-radius: 6px;
   407	  padding: 0.18rem 0.55rem;
   408	}
   409	.card-foot .pdf-link:hover {
   410	  color: var(--accent-hover);
   411	  border-color: var(--accent);
   412	}
   413	
   414	/* ---------- paper page ---------- */
   415	
   416	.paper-layout {
   417	  max-width: 1120px;
   418	  margin: 0 auto;
   419	  padding: 1.5rem 1rem 4rem;
   420	  display: grid;
   421	  grid-template-columns: 1fr;
   422	  gap: 2rem;
   423	}
   424	
   425	.paper-layout > * {
   426	  min-width: 0;
   427	}
   428	
   429	@media (min-width: 1024px) {
   430	  .paper-layout {
   431	    grid-template-columns: minmax(0, 1fr) 240px;
   432	    padding: 2.5rem 1.5rem 5rem;
   433	    gap: 3rem;
   434	  }
   435	}
   436	
   437	.paper-header {
   438	  margin-bottom: 1.75rem;
   439	}
   440	
   441	.paper-header .kicker {
   442	  color: var(--accent-secondary);
   443	  font-size: 0.76rem;
   444	  font-weight: 600;
   445	  letter-spacing: 0.2em;
   446	  text-transform: uppercase;
   447	  margin: 0 0 0.75rem;
   448	}
   449	
   450	.paper-header h1 {
   451	  font-size: clamp(1.65rem, 4.5vw, 2.55rem);
   452	  margin: 0 0 0.75rem;
   453	}
   454	
   455	.paper-header .sub {
   456	  color: var(--text-muted);
   457	  font-size: 1.02rem;
   458	  margin: 0 0 1rem;
   459	}
   460	
   461	.paper-meta {
   462	  display: flex;
   463	  flex-wrap: wrap;
   464	  gap: 0.45rem 1.15rem;
   465	  color: var(--text-dim);
   466	  font-size: 0.83rem;
   467	}
   468	
   469	.paper-meta b {
   470	  color: var(--text-muted);
   471	  font-weight: 600;
   472	}
   473	
   474	.pdf-btn {
   475	  position: fixed;
   476	  right: 1rem;
   477	  bottom: 1rem;
   478	  z-index: 40;
   479	  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.45);
   480	}
   481	
   482	@media (min-width: 1024px) {
   483	  .pdf-btn-fixed {
   484	    display: none;
   485	  }
   486	}
   487	
   488	.paper-abstract {
   489	  border: 1px solid var(--border);
   490	  border-left: 3px solid var(--accent);
   491	  background: var(--surface);
   492	  border-radius: 10px;
   493	  padding: 1.15rem 1.25rem;
   494	  margin: 1.5rem 0 2.25rem;
   495	}
   496	
   497	.paper-abstract h2 {
   498	  font-size: 1.05rem;
   499	  margin: 0 0 0.65rem;
   500	  color: var(--accent-hover);
   501	  font-family: var(--font-body);
   502	  letter-spacing: 0.08em;
   503	  text-transform: uppercase;
   504	}
   505	
   506	.paper-abstract p {
   507	  margin: 0 0 0.75rem;
   508	  color: var(--text-muted);
   509	  font-size: 0.96rem;
   510	}
   511	.paper-abstract p:last-child {
   512	  margin-bottom: 0;
   513	}
   514	
   515	/* ---------- paper content typography + math ---------- */
   516	
   517	.paper-content {
   518	  min-width: 0;
   519	  max-width: 100%;
   520	  overflow-wrap: break-word;
   521	  word-break: normal;
   522	  font-size: 1.02rem;
   523	  color: var(--text);
   524	}
   525	
   526	.paper-content .katex-display {
   527	  max-width: 100%;
   528	}
   529	
   530	.paper-content h1,
   531	.paper-content h2,
   532	.paper-content h3,
   533	.paper-content h4 {
   534	  max-width: 100%;
   535	}
   536	
   537	.paper-content h2 {
   538	  font-size: clamp(1.35rem, 3.2vw, 1.85rem);
   539	  margin: 2.75rem 0 1rem;
   540	  padding-top: 0.5rem;
   541	  border-top: 1px solid var(--border);
   542	}
   543	
   544	.paper-content h3 {
   545	  font-size: clamp(1.12rem, 2.6vw, 1.38rem);
   546	  margin: 2.1rem 0 0.85rem;
   547	}
   548	
   549	.paper-content h4 {
   550	  font-size: 1.05rem;
   551	  margin: 1.6rem 0 0.7rem;
   552	  color: var(--text-muted);
   553	}
   554	
   555	.paper-content p {
   556	  margin: 0 0 1.05rem;
   557	}
   558	
   559	.paper-content ul,
   560	.paper-content ol {
   561	  margin: 0 0 1.15rem;
   562	  padding-left: 1.4rem;
   563	}
   564	
   565	.paper-content li {
   566	  margin-bottom: 0.45rem;
   567	}
   568	
   569	.paper-content blockquote {
   570	  margin: 1.25rem 0;
   571	  padding: 0.15rem 0 0.15rem 1.1rem;
   572	  border-left: 3px solid var(--border);
   573	  color: var(--text-muted);
   574	}
   575	
   576	.paper-content code {
   577	  font-family: ui-monospace, 'SFMono-Regular', Menlo, monospace;
   578	  font-size: 0.88em;
   579	  background: var(--code-bg);
   580	  border: 1px solid var(--border);
   581	  border-radius: 4px;
   582	  padding: 0.08em 0.35em;
   583	}
   584	
   585	.paper-content pre {
   586	  background: var(--code-bg);
   587	  border: 1px solid var(--border);
   588	  border-radius: 8px;
   589	  padding: 0.95rem 1.05rem;
   590	  overflow-x: auto;
   591	  max-width: 100%;
   592	  margin: 0 0 1.25rem;
   593	}
   594	
   595	.paper-content pre code {
   596	  background: none;
   597	  border: none;
   598	  padding: 0;
   599	  font-size: 0.82rem;
   600	  line-height: 1.55;
   601	}
   602	
   603	/* theorem-style blocks */
   604	.paper-content .definition,
   605	.paper-content .theorem,
   606	.paper-content .proposition,
   607	.paper-content .lemma,
   608	.paper-content .corollary,
   609	.paper-content .conjecture,
   610	.paper-content .example,
   611	.paper-content .remark,
   612	.paper-content .proof {
   613	  border: 1px solid var(--border);
   614	  border-radius: 10px;
   615	  padding: 1rem 1.15rem;
   616	  margin: 1.35rem 0;
   617	  background: rgba(14, 20, 40, 0.55);
   618	}
   619	
   620	.paper-content .definition {
   621	  border-left: 3px solid var(--accent);
   622	}
   623	.paper-content .theorem,
   624	.paper-content .proposition {
   625	  border-left: 3px solid var(--accent-secondary);
   626	}
   627	.paper-content .lemma,
   628	.paper-content .corollary {
   629	  border-left: 3px solid #7dd3fc;
   630	}
   631	.paper-content .conjecture {
   632	  border-left: 3px solid var(--warning);
   633	}
   634	.paper-content .remark,
   635	.paper-content .example {
   636	  border-left: 3px solid var(--border);
   637	}
   638	.paper-content .proof {
   639	  background: transparent;
   640	  border-style: dashed;
   641	}
   642	
   643	.paper-content .definition p,
   644	.paper-content .theorem p,
   645	.paper-content .proposition p,
   646	.paper-content .lemma p,
   647	.paper-content .corollary p,
   648	.paper-content .conjecture p {
   649	  margin-bottom: 0.65rem;
   650	}
   651	.paper-content .definition p:last-child,
   652	.paper-content .theorem p:last-child,
   653	.paper-content .proposition p:last-child {
   654	  margin-bottom: 0;
   655	}
   656	
   657	/* tables */
   658	.paper-content table {
   659	  display: block;
   660	  width: 100%;
   661	  max-width: 100%;
   662	  overflow-x: auto;
   663	  border-collapse: collapse;
   664	  margin: 1.5rem 0;
   665	  font-size: 0.86rem;
   666	}
   667	
   668	.paper-content caption {
   669	  caption-side: top;
   670	  text-align: left;
   671	  color: var(--text-muted);
   672	  font-size: 0.85rem;
   673	  padding: 0 0 0.65rem;
   674	  line-height: 1.5;
   675	}
   676	
   677	.paper-content caption .tbl-num {
   678	  color: var(--accent-secondary);
   679	  font-weight: 600;
   680	  margin-right: 0.35rem;
   681	}
   682	
   683	.paper-content th,
   684	.paper-content td {
   685	  border: 1px solid var(--border);
   686	  padding: 0.55rem 0.75rem;
   687	  text-align: left;
   688	  vertical-align: top;
   689	  min-width: 5.5rem;
   690	}
   691	
   692	.paper-content th {
   693	  background: var(--surface-hover);
   694	  color: var(--text);
   695	  font-weight: 600;
   696	}
   697	
   698	.paper-content tr:nth-child(even) td {
   699	  background: rgba(14, 20, 40, 0.4);
   700	}
   701	
   702	/* math — inline stays inline; display blocks scroll horizontally */
   703	.paper-content .math-display-rendered,
   704	.paper-content .math.display {
   705	  display: block;
   706	  overflow-x: auto;
   707	  overflow-y: hidden;
   708	  max-width: 100%;
   709	  padding: 0.35rem 0;
   710	}
   711	
   712	.paper-content .math-inline-rendered,
   713	.paper-content .math.inline {
   714	  display: inline;
   715	  max-width: 100%;
   716	}
   717	
   718	.paper-content .katex-display {
   719	  margin: 0.55rem 0;
   720	  overflow-x: auto;
   721	  overflow-y: hidden;
   722	}
   723	
   724	.paper-content .katex {
   725	  font-size: 1.06em;
   726	}
   727	
   728	.paper-content .math-display-rendered .katex-display > .katex {
   729	  text-align: left;
   730	}
   731	
   732	.paper-content .katex-error {
   733	  color: var(--warning);
   734	  font-family: ui-monospace, monospace;
   735	  font-size: 0.85em;
   736	}
   737	
   738	/* inline citations + bibliography */
   739	.paper-content a.citation {
   740	  color: var(--accent-secondary);
   741	  font-size: 0.85em;
   742	  white-space: nowrap;
   743	}
   744	
   745	.paper-content .thebibliography {
   746	  font-size: 0.88rem;
   747	  color: var(--text-muted);
   748	}
   749	
   750	.paper-content .bibitem {
   751	  margin: 0 0 0.85rem;
   752	  padding-left: 2.2rem;
   753	  text-indent: -2.2rem;
   754	}
   755	
   756	.paper-content .bibitem .bib-num {
   757	  color: var(--accent-secondary);
   758	  margin-right: 0.45rem;
   759	  font-weight: 600;
   760	}
   761	
   762	/* ---------- TOC ---------- */
   763	
   764	.toc-wrap {
   765	  min-width: 0;
   766	}
   767	
   768	.toc-toggle {
   769	  width: 100%;
   770	  text-align: left;
   771	  background: var(--surface);
   772	  color: var(--text);
   773	  border: 1px solid var(--border);
   774	  border-radius: 8px;
   775	  padding: 0.65rem 0.95rem;
   776	  font-size: 0.88rem;
   777	  font-weight: 600;
   778	  cursor: pointer;
   779	}
   780	
   781	@media (min-width: 1024px) {
   782	  .toc-toggle {
   783	    display: none;
   784	  }
   785	}
   786	
   787	.toc {
   788	  display: none;
   789	  flex-direction: column;
   790	  gap: 0.15rem;
   791	  margin-top: 0.65rem;
   792	}
   793	
   794	.toc-open {
   795	  display: flex;
   796	}
   797	
   798	@media (min-width: 1024px) {
   799	  .toc {
   800	    display: flex;
   801	    position: sticky;
   802	    top: 5.25rem;
   803	    max-height: calc(100vh - 7rem);
   804	    overflow-y: auto;
   805	    margin-top: 0;
   806	  }
   807	}
   808	
   809	.toc-item {
   810	  color: var(--text-muted);
   811	  font-size: 0.83rem;
   812	  line-height: 1.45;
   813	  padding: 0.32rem 0.65rem;
   814	  border-left: 2px solid transparent;
   815	  border-radius: 0 6px 6px 0;
   816	}
   817	
   818	.toc-item:hover {
   819	  color: var(--text);
   820	  background: var(--surface);
   821	}
   822	
   823	.toc-level-3 {
   824	  padding-left: 1.35rem;
   825	  font-size: 0.8rem;
   826	}
   827	.toc-level-4 {
   828	  padding-left: 2.05rem;
   829	  font-size: 0.78rem;
   830	  color: var(--text-dim);
   831	}
   832	
   833	.toc-active {
   834	  color: var(--accent-hover);
   835	  border-left-color: var(--accent);
   836	  background: var(--accent-glow);
   837	}
   838	
   839	/* ---------- prev / next ---------- */
   840	
   841	.paper-nav {
   842	  display: grid;
   843	  grid-template-columns: 1fr;
   844	  gap: 1rem;
   845	  margin-top: 3.5rem;
   846	  padding-top: 1.75rem;
   847	  border-top: 1px solid var(--border);
   848	}
   849	
   850	@media (min-width: 640px) {
   851	  .paper-nav {
   852	    grid-template-columns: 1fr 1fr;
   853	  }
   854	}
   855	
   856	.paper-nav .nav-link {
   857	  display: block;
   858	  border: 1px solid var(--border);
   859	  border-radius: 10px;
   860	  padding: 1rem 1.15rem;
   861	  color: var(--text);
   862	  transition: border-color 0.18s ease;
   863	}
   864	
   865	.paper-nav .nav-link:hover {
   866	  border-color: var(--accent);
   867	  color: var(--text);
   868	}
   869	
   870	.paper-nav .dir {
   871	  color: var(--text-dim);
   872	  font-size: 0.75rem;
   873	  letter-spacing: 0.16em;
   874	  text-transform: uppercase;
   875	  margin-bottom: 0.35rem;
   876	}
   877	
   878	.paper-nav .nav-title {
   879	  font-family: var(--font-heading);
   880	  font-size: 1rem;
   881	}
   882	
   883	.paper-nav .next {
   884	  text-align: left;
   885	}
   886	
   887	@media (min-width: 640px) {
   888	  .paper-nav .next {
   889	    text-align: right;
   890	  }
   891	}
   892	
   893	/* ---------- periodic table page ---------- */
   894	
   895	.md-content {
   896	  min-width: 0;
   897	  overflow-wrap: break-word;
   898	  font-size: 0.97rem;
   899	}
   900	
   901	.md-content h2 {
   902	  font-size: clamp(1.35rem, 3vw, 1.8rem);
   903	  margin: 2.75rem 0 1rem;
   904	  padding-top: 0.5rem;
   905	  border-top: 1px solid var(--border);
   906	}
   907	
   908	.md-content h3 {
   909	  font-size: clamp(1.1rem, 2.4vw, 1.35rem);
   910	  margin: 2.1rem 0 0.85rem;
   911	}
   912	
   913	.md-content p {
   914	  margin: 0 0 1.05rem;
   915	  color: var(--text-muted);
   916	}
   917	
   918	.md-content strong {
   919	  color: var(--text);
   920	}
   921	
   922	.md-content table {
   923	  display: block;
   924	  width: 100%;
   925	  max-width: 100%;
   926	  overflow-x: auto;
   927	  border-collapse: collapse;
   928	  margin: 1.35rem 0;
   929	  font-size: 0.82rem;
   930	}
   931	
   932	.md-content th,
   933	.md-content td {
   934	  border: 1px solid var(--border);
   935	  padding: 0.55rem 0.75rem;
   936	  text-align: left;
   937	  vertical-align: top;
   938	  min-width: 5.5rem;
   939	}
   940	
   941	.md-content th {
   942	  background: var(--surface-hover);
   943	  color: var(--text);
   944	}
   945	
   946	.md-content tr:nth-child(even) td {
   947	  background: rgba(14, 20, 40, 0.4);
   948	}
   949	
   950	.md-content hr {
   951	  border: none;
   952	  border-top: 1px solid var(--border);
   953	  margin: 2.25rem 0;
   954	}
   955	
   956	.status-proven { color: var(--success); font-weight: 600; }
   957	.status-claimed { color: var(--warning); font-weight: 600; }
   958	.status-open { color: var(--accent); font-weight: 600; }
   959	.status-impossible { color: #f87171; font-weight: 600; }
   960	
   961	/* ---------- footer ---------- */
   962	
   963	.site-footer {
   964	  border-top: 1px solid var(--border);
   965	  margin-top: 2rem;
   966	  background: rgba(14, 20, 40, 0.4);
   967	}
   968	
   969	.site-footer-inner {
   970	  max-width: 1120px;
   971	  margin: 0 auto;
   972	  padding: 2.25rem 1rem;
   973	  display: grid;
   974	  gap: 1.25rem;
   975	  color: var(--text-dim);
   976	  font-size: 0.85rem;
   977	}
   978	
   979	@media (min-width: 768px) {
   980	  .site-footer-inner {
   981	    grid-template-columns: 2fr 1fr 1fr;
   982	    padding: 2.75rem 1.5rem;
   983	  }
   984	}
   985	
   986	.site-footer h3 {
   987	  font-family: var(--font-body);
   988	  font-size: 0.78rem;
   989	  letter-spacing: 0.18em;
   990	  text-transform: uppercase;
   991	  color: var(--text-muted);
   992	  margin: 0 0 0.65rem;
   993	}
   994	
   995	.site-footer p {
   996	  margin: 0 0 0.55rem;
   997	  max-width: 42em;
   998	}
   999	
  1000	.site-footer a {
  1001	  color: var(--text-muted);
  1002	}
  1003	.site-footer a:hover {
  1004	  color: var(--accent-hover);
  1005	}
  1006	
  1007	.site-footer ul {
  1008	  list-style: none;
  1009	  margin: 0;
  1010	  padding: 0;
  1011	}
  1012	
  1013	.site-footer li {
  1014	  margin-bottom: 0.45rem;
  1015	}
     1	import type { Metadata } from 'next';
     2	import { Inter, Spectral } from 'next/font/google';
     3	import 'katex/dist/katex.min.css';
     4	import './globals.css';
     5	
     6	const inter = Inter({ subsets: ['latin'], variable: '--font-inter', display: 'swap' });
     7	const spectral = Spectral({
     8	  subsets: ['latin'],
     9	  weight: ['400', '600', '700'],
    10	  variable: '--font-spectral',
    11	  display: 'swap',
    12	});
    13	
    14	const siteUrl = process.env.VERCEL_PROJECT_PRODUCTION_URL
    15	  ? `https://${process.env.VERCEL_PROJECT_PRODUCTION_URL}`
    16	  : process.env.NEXT_PUBLIC_SITE_URL || 'http://localhost:3000';
    17	
    18	const SITE_NAME = 'CMRPS';
    19	
    20	export const metadata: Metadata = {
    21	  metadataBase: new URL(siteUrl),
    22	  title: { default: 'CMRPS — Classification of Mathematical Representations of Physical Systems', template: '%s | CMRPS' },
    23	  description:
    24	    'A twelve-volume research series on the structural classification of mathematical representations of physical systems, with a structural synthesis. Matthew Long / The YonedaAI Collaboration.',
    25	  openGraph: {
    26	    type: 'website',
    27	    siteName: SITE_NAME,
    28	    images: [{ url: '/og/og-default.png', width: 1200, height: 630 }],
    29	  },
    30	  twitter: {
    31	    card: 'summary_large_image',
    32	    images: ['/og/og-default.png'],
    33	  },
    34	};
    35	
    36	export default function RootLayout({
    37	  children,
    38	}: Readonly<{
    39	  children: React.ReactNode;
    40	}>) {
    41	  return (
    42	    <html lang="en">
    43	      <body className={`${inter.variable} ${spectral.variable}`}>
    44	        <header className="site-header">
    45	          <div className="site-header-inner">
    46	            <a className="site-title" href="/">
    47	              <span className="mark">CMRPS</span>
    48	              <span>The Classification of Mathematical Representations of Physical Systems</span>
    49	            </a>
    50	            <nav className="site-nav">
    51	              <a href="/#papers">Papers</a>
    52	              <a href="/periodic-table/">Periodic Table</a>
    53	              <a href="/#series">Series</a>
    54	            </nav>
    55	          </div>
    56	        </header>
    57	        <main>{children}</main>
    58	        <footer className="site-footer">
    59	          <div className="site-footer-inner">
    60	            <div>
    61	              <h3>CMRPS</h3>
    62	              <p>
    63	                The Classification of Mathematical Representations of Physical Systems —
    64	                a twelve-volume series with a structural synthesis. All results are stated
    65	                relative to the admissibility axioms and preservation laws fixed in the
    66	                series.
    67	              </p>
    68	              <p>
    69	                Matthew Long / The YonedaAI Collaboration · YonedaAI Research Collective ·
    70	                Chicago, Illinois, USA
    71	              </p>
    72	            </div>
    73	            <div>
    74	              <h3>Read</h3>
    75	              <ul>
    76	                <li><a href="/#papers">All papers</a></li>
    77	                <li><a href="/periodic-table/">Periodic table</a></li>
    78	                <li><a href="/papers/synthesis/">Structural synthesis</a></li>
    79	              </ul>
    80	            </div>
    81	            <div>
    82	              <h3>Series</h3>
    83	              <ul>
    84	                <li><a href="/pdf/synthesis.pdf">Synthesis PDF</a></li>
    85	                <li><a href="/pdf/vol-12-principia-physica.pdf">Principia Physica PDF</a></li>
    86	                <li><a href="/pdf/vol-01-foundations.pdf">Foundations PDF</a></li>
    87	              </ul>
    88	            </div>
    89	          </div>
    90	        </footer>
    91	      </body>
    92	    </html>
    93	  );
    94	}
     1	import type { Metadata } from 'next';
     2	import { getPapers } from '../lib/papers';
     3	
     4	export const metadata: Metadata = {
     5	  openGraph: {
     6	    images: [{ url: '/og/og-default.png', width: 1200, height: 630 }],
     7	  },
     8	  twitter: {
     9	    card: 'summary_large_image',
    10	    images: ['/og/og-default.png'],
    11	  },
    12	};
    13	
    14	export default function HomePage() {
    15	  const papers = getPapers();
    16	  const totalPages = papers.reduce((n, p) => n + p.pages, 0);
    17	
    18	  return (
    19	    <>
    20	      <section className="hero">
    21	        <div className="hero-bg" />
    22	        <div className="hero-grid-lines" />
    23	        <div className="hero-inner">
    24	          <p className="hero-kicker">A research series in structural mathematics</p>
    25	          <h1>
    26	            The Classification of Mathematical Representations of{' '}
    27	            <span className="em">Physical Systems</span>
    28	          </h1>
    29	          <p className="hero-sub">
    30	            A representation is recorded as a five-part tuple of state space, observables,
    31	            dynamics, symmetries, and composition rules. The series fixes a morphism
    32	            vocabulary with explicit preservation laws, classifies restricted classes in
    33	            full, and states the structural classification conjecture with its five proof
    34	            obligations. Twelve volumes, one synthesis.
    35	          </p>
    36	          <div className="hero-meta">
    37	            <span><b>{papers.length}</b> papers</span>
    38	            <span><b>{totalPages}</b> pages</span>
    39	            <span>Matthew Long · The YonedaAI Collaboration</span>
    40	            <span>October 2026</span>
    41	          </div>
    42	          <div className="hero-actions">
    43	            <a className="btn btn-primary" href="#papers">Read the papers</a>
    44	            <a className="btn btn-ghost" href="/periodic-table/">Periodic table</a>
    45	          </div>
    46	        </div>
    47	      </section>
    48	
    49	      <section className="section" id="papers">
    50	        <div className="section-head">
    51	          <h2>Papers</h2>
    52	          <span className="hint">Twelve volumes and a structural synthesis</span>
    53	        </div>
    54	        <div className="paper-grid">
    55	          {papers.map((p) => (
    56	            <article className="paper-card" key={p.slug}>
    57	              <div className="card-part">
    58	                <span>{p.part}</span>
    59	                <span className="cat">{p.category}</span>
    60	              </div>
    61	              <h3>
    62	                <a href={`/papers/${p.slug}/`}>{p.title}</a>
    63	              </h3>
    64	              {p.subtitle ? <p className="card-sub">{p.subtitle}</p> : null}
    65	              <p className="card-abstract">{p.abstract.slice(0, 150)}…</p>
    66	              <div className="card-foot">
    67	                <a className="read" href={`/papers/${p.slug}/`}>Read →</a>
    68	                <a className="pdf-link" href={`/pdf/${p.slug}.pdf`}>PDF</a>
    69	                <span>{p.pages} pp</span>
    70	              </div>
    71	            </article>
    72	          ))}
    73	        </div>
    74	      </section>
    75	
    76	      <section className="section" id="series">
    77	        <div className="section-head">
    78	          <h2>Program</h2>
    79	        </div>
    80	        <div className="paper-grid">
    81	          <article className="paper-card">
    82	            <div className="card-part">
    83	              <span>Registry</span>
    84	              <span className="cat">PROVEN · CLAIMED · OPEN · IMPOSSIBLE</span>
    85	            </div>
    86	            <h3>
    87	              <a href="/periodic-table/">The Periodic Table of Mathematical Physics</a>
    88	            </h3>
    89	            <p className="card-abstract">
    90	              The classification chart of the program: ten candidate structural families
    91	              with their defining invariants, exceptional structures, proven
    92	              reconstruction relationships, and the claim status of every row.
    93	            </p>
    94	            <div className="card-foot">
    95	              <a className="read" href="/periodic-table/">Open the table →</a>
    96	            </div>
    97	          </article>
    98	          <article className="paper-card">
    99	            <div className="card-part">
   100	              <span>Synthesis</span>
   101	              <span className="cat">math-ph</span>
   102	            </div>
   103	            <h3>
   104	              <a href="/papers/synthesis/">Structural Synthesis</a>
   105	            </h3>
   106	            <p className="card-abstract">
   107	              The structural picture formed by the twelve parts: the registered results,
   108	              the dependency structure among the volumes, and the obligations the
   109	              classification conjecture still carries.
   110	            </p>
   111	            <div className="card-foot">
   112	              <a className="read" href="/papers/synthesis/">Read →</a>
   113	              <a className="pdf-link" href="/pdf/synthesis.pdf">PDF</a>
   114	            </div>
   115	          </article>
   116	          <article className="paper-card">
   117	            <div className="card-part">
   118	              <span>Method</span>
   119	              <span className="cat">admissibility</span>
   120	            </div>
   121	            <h3>
   122	              <a href="/papers/vol-01-foundations/">Foundations of Structural Classification</a>
   123	            </h3>
   124	            <p className="card-abstract">
   125	              The definitional root of the series: the system record schema, five morphism
   126	              kinds with preservation laws, admissibility conditions, and three restricted
   127	              classifications proved in full.
   128	            </p>
   129	            <div className="card-foot">
   130	              <a className="read" href="/papers/vol-01-foundations/">Read →</a>
   131	              <a className="pdf-link" href="/pdf/vol-01-foundations.pdf">PDF</a>
   132	            </div>
   133	          </article>
   134	        </div>
   135	      </section>
   136	    </>
   137	  );
   138	}
     1	import type { Metadata } from 'next';
     2	import { getPeriodicTable } from '../../lib/papers';
     3	import { PaperContent } from '../../components/PaperContent';
     4	
     5	const title = 'The Periodic Table of Mathematical Physics';
     6	
     7	export const metadata: Metadata = {
     8	  title,
     9	  description:
    10	    'The classification chart of the CMRPS program: structural families and their defining invariants, exceptional structures, proven reconstruction relationships, and the claim status of every row (PROVEN, CLAIMED, OPEN, IMPOSSIBLE).',
    11	  openGraph: {
    12	    title,
    13	    type: 'article',
    14	    url: '/periodic-table/',
    15	    images: [{ url: '/og/synthesis.png', width: 1200, height: 630 }],
    16	  },
    17	  twitter: {
    18	    card: 'summary_large_image',
    19	    title,
    20	    images: ['/og/synthesis.png'],
    21	  },
    22	};
    23	
    24	export default async function PeriodicTablePage() {
    25	  const { html } = await getPeriodicTable();
    26	
    27	  return (
    28	    <div className="paper-layout">
    29	      <article>
    30	        <header className="paper-header">
    31	          <p className="kicker">Program registry · CMRPS</p>
    32	          <h1>{title}</h1>
    33	          <p className="sub">
    34	            A research framework for classification, not a completed classification.
    35	            Completeness is a theorem to investigate; the central conjecture it serves
    36	            remains a conjecture.
    37	          </p>
    38	          <div className="paper-meta">
    39	            <span><b>Matthew Long</b> · The YonedaAI Collaboration</span>
    40	            <span>Status date 29 October 2026</span>
    41	          </div>
    42	        </header>
    43	
    44	        <PaperContent html={html} />
    45	      </article>
    46	    </div>
    47	  );
    48	}
     1	import type { Metadata } from 'next';
     2	import { getPapers, getPaper, getPaperHTML } from '../../../lib/papers';
     3	import { PaperContent } from '../../../components/PaperContent';
     4	import { TableOfContents } from '../../../components/TableOfContents';
     5	
     6	export function generateStaticParams() {
     7	  return getPapers().map((p) => ({ slug: p.slug }));
     8	}
     9	
    10	export async function generateMetadata({
    11	  params,
    12	}: {
    13	  params: { slug: string };
    14	}): Promise<Metadata> {
    15	  const paper = getPaper(params.slug);
    16	  if (!paper) return {};
    17	  return {
    18	    title: paper.title,
    19	    description: paper.abstract,
    20	    openGraph: {
    21	      title: paper.title,
    22	      description: paper.abstract,
    23	      type: 'article',
    24	      url: `/papers/${paper.slug}/`,
    25	      images: [{ url: `/og/${paper.slug}.png`, width: 1200, height: 630 }],
    26	    },
    27	    twitter: {
    28	      card: 'summary_large_image',
    29	      title: paper.title,
    30	      description: paper.abstract,
    31	      images: [`/og/${paper.slug}.png`],
    32	    },
    33	  };
    34	}
    35	
    36	export default function PaperPage({ params }: { params: { slug: string } }) {
    37	  const paper = getPaper(params.slug);
    38	  if (!paper) {
    39	    return (
    40	      <section className="section">
    41	        <h2>Paper not found</h2>
    42	      </section>
    43	    );
    44	  }
    45	
    46	  const { html, headings } = getPaperHTML(paper.slug);
    47	  const papers = getPapers();
    48	  const idx = papers.findIndex((p) => p.slug === paper.slug);
    49	  const prev = idx > 0 ? papers[idx - 1] : undefined;
    50	  const next = idx >= 0 && idx < papers.length - 1 ? papers[idx + 1] : undefined;
    51	
    52	  return (
    53	    <>
    54	      <div className="paper-layout">
    55	        <article>
    56	          <header className="paper-header">
    57	            <p className="kicker">{paper.part} · {paper.category}</p>
    58	            <h1>{paper.title}</h1>
    59	            {paper.subtitle ? <p className="sub">{paper.subtitle}</p> : null}
    60	            <div className="paper-meta">
    61	              <span><b>Matthew Long</b> · The YonedaAI Collaboration</span>
    62	              <span>{paper.date}</span>
    63	              <span>{paper.pages} pages</span>
    64	            </div>
    65	            <a className="btn btn-primary" href={`/pdf/${paper.slug}.pdf`}>
    66	              Download PDF
    67	            </a>
    68	          </header>
    69	
    70	          <PaperContent html={html} />
    71	
    72	          <nav className="paper-nav">
    73	            {prev ? (
    74	              <a className="nav-link prev" href={`/papers/${prev.slug}/`}>
    75	                <div className="dir">← Previous · {prev.part}</div>
    76	                <div className="nav-title">{prev.title}</div>
    77	              </a>
    78	            ) : (
    79	              <span />
    80	            )}
    81	            {next ? (
    82	              <a className="nav-link next" href={`/papers/${next.slug}/`}>
    83	                <div className="dir">Next · {next.part} →</div>
    84	                <div className="nav-title">{next.title}</div>
    85	              </a>
    86	            ) : (
    87	              <span />
    88	            )}
    89	          </nav>
    90	        </article>
    91	
    92	        <aside>
    93	          <TableOfContents headings={headings} />
    94	        </aside>
    95	      </div>
    96	
    97	      <a className="btn btn-primary pdf-btn pdf-btn-fixed" href={`/pdf/${paper.slug}.pdf`}>
    98	        PDF
    99	      </a>
   100	    </>
   101	  );
   102	}
{
  "name": "website",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint"
  },
  "dependencies": {
    "isomorphic-dompurify": "^4.6.0",
    "katex": "^0.19.1",
    "marked": "^18.1.2",
    "next": "14.2.35",
    "react": "^18",
    "react-dom": "^18"
  },
  "devDependencies": {
    "@types/katex": "^0.16.8",
    "@types/marked": "^5.0.2",
    "@types/node": "^20",
    "@types/react": "^18",
    "@types/react-dom": "^18",
    "postcss": "^8",
    "tailwindcss": "^3.4.1",
    "typescript": "^5"
  }
}
[
  {
    "slug": "vol-01-foundations",
    "title": "Foundations of Structural Classification",
    "subtitle": "Part 1 of The Classification of Mathematical Representations of Physical Systems",
    "part": "Part 1",
    "volume": 1,
    "abstract": "The classification of mathematical representations of physical systems is a structural problem before it is a physical one, and this paper establishes the foundations that the problem requires. A representation is recorded as a five-part tuple of state space, observables, dynamics, symmetries, and c",
    "abstractFull": "The classification of mathematical representations of physical systems is a structural problem before it is a physical one, and this paper establishes the foundations that the problem requires. A representation is recorded as a five-part tuple of state space, observables, dynamics, symmetries, and composition rules. Morphisms are admitted in five named kinds, each with an explicit preservation law, and admissibility is fixed by six stated conditions that single out admissible records and admissible class specifications. Several results give the framework content. An explicit counterexample shows that the composite of an embedding and a coarse-graining satisfies no listed preservation law: the five morphism kinds are closed under self-composition and not across kinds, and the vocabulary resolves into kind-relative categories. Three restricted classes are then classified in full: finite classical systems under disjoint union are classified by cardinality with one-point systems as the unique irreducibles, finite dynamical systems decompose uniquely into connected components, and finite symmetric systems are classified by orbit type. Irreducibility is characterized relative to the composition rule; a two-qubit example identifies the additional factorization data that decomposition requires. The structural classification conjecture is stated with its five proof obligations as the theorem targets of the program. All results are stated relative to the admissibility axioms and the preservation laws fixed in the paper, in the standard axiom-relative form.",
    "pages": 21,
    "hasCode": true,
    "category": "math.CT",
    "date": "October 2026"
  },
  {
    "slug": "vol-02-structural-families",
    "title": "Fundamental Structural Families of Mathematical Physics",
    "subtitle": "Part 2 of The Classification of Mathematical Representations of Physical Systems",
    "part": "Part 2",
    "volume": 2,
    "abstract": "This paper develops the family-level taxonomy that a classification of mathematical representations of physical systems requires. Ten structural families organize mathematical structures capable of representing physical systems: symplectic and Poisson structures, Hilbert spaces and operator algebras",
    "abstractFull": "This paper develops the family-level taxonomy that a classification of mathematical representations of physical systems requires. Ten structural families organize mathematical structures capable of representing physical systems: symplectic and Poisson structures, Hilbert spaces and operator algebras, smooth manifolds and geometric structures, principal bundles and connections, probability and measure-theoretic structures, topological and higher-categorical structures, dynamical systems and operator semigroups, tensor categories and compositional structures, discrete combinatorial structures, and derived and homotopical structures. Each family is presented with its defining invariant, its classified islands, and its recorded obstructions. Four results govern how the taxonomy may be used. A sharpness criterion shows that a family admits a classification of a prescribed shape only when its classifying invariant takes values in a set of matching cardinality or geometric structure. A globality proposition shows that no local invariant classifies inside the symplectic family. A non-closure proposition shows that a class of objects irreducible under direct sum is not itself closed under direct sum. An independence proposition shows that two families may each carry a classifying invariant and still fail to be logically independent. The ten families are candidates for an organizing taxonomy and not a completed classification, and no completeness claim is made for them.",
    "pages": 24,
    "hasCode": true,
    "category": "math.CT",
    "date": "October 2026"
  },
  {
    "slug": "vol-03-irreducibility-decomposition",
    "title": "Irreducibility and Decomposition",
    "subtitle": "Part 3 of The Classification of Mathematical Representations of Physical Systems",
    "part": "Part 3",
    "volume": 3,
    "abstract": "Structural classification of physical systems requires a precise account of irreducibility: the objects counted as basic, the constructions that assemble systems from them, and the uniqueness, or absence of uniqueness, of the resulting decomposition. This paper develops that account within a categor",
    "abstractFull": "Structural classification of physical systems requires a precise account of irreducibility: the objects counted as basic, the constructions that assemble systems from them, and the uniqueness, or absence of uniqueness, of the resulting decomposition. This paper develops that account within a categorical schema of physical systems whose composition data determine what irreducibility means. The central positive result is the complete decomposition theory of unital finite-dimensional complex C*-algebras: every such algebra is a finite direct sum of matrix algebras, the multiset of matrix sizes classifies it up to *-isomorphism, and unital *-homomorphisms between decomposed algebras are classified exactly by multiplicity matrices with explicit arithmetic constraints. The paper then maps the limits of this pattern. Kraus rank is an invariant of the Stinespring normal form and not an isomorphism invariant of channels. Interacting systems admit no unique decomposition outside restricted subclasses. Wild representation categories forbid finite-dimensional parameterization of their indecomposables. Reconstruction theorems recover objects from probes under stated hypotheses, and those hypotheses carry the content. Computational evidence in an executable taxonomy layer and in enumeration experiments is recorded as evidence and never as proof. The results support decomposition theorems only in restricted, tame regimes.",
    "pages": 20,
    "hasCode": true,
    "category": "math-ph",
    "date": "October 2026"
  },
  {
    "slug": "vol-04-yoneda-classification",
    "title": "The Yoneda Classification Principle",
    "subtitle": "Part 4 of The Classification of Mathematical Representations of Physical Systems",
    "part": "Part 4",
    "volume": 4,
    "abstract": "The Yoneda embedding sends each object of a category to the functor it represents through its relationships with all other objects. This paper develops the relational characterization of mathematical representations of physical systems that the embedding supplies, and it states precisely what the em",
    "abstractFull": "The Yoneda embedding sends each object of a category to the functor it represents through its relationships with all other objects. This paper develops the relational characterization of mathematical representations of physical systems that the embedding supplies, and it states precisely what the embedding does not supply. The Yoneda lemma determines an object up to isomorphism by its relational profile, and the embedding is fully faithful on any locally small category of representations once the admissible morphisms are fixed. Concrete representability results for quantum supermaps show that in settings with channel-state duality the relational content is not merely formal, and the classical reconstruction theorems of Gelfand, Stone, and Doplicher and Roberts recover objects from categories of probes. Against these results stands a governing constraint: Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem. A non-implication theorem makes the third denial precise, because full faithfulness holds in categories where isomorphism classes admit no finite-variety parametrization, so representability cannot be the source of a classification theorem. The paper separates established mathematics from conjectural physical interpretation throughout and records the open problem of unifying the supermap line with the reconstruction pattern.",
    "pages": 20,
    "hasCode": true,
    "category": "math.CT",
    "date": "October 2026"
  },
  {
    "slug": "vol-05-classical-systems",
    "title": "Classification of Classical Physical Systems",
    "subtitle": "Part 5 of The Classification of Mathematical Representations of Physical Systems",
    "part": "Part 5",
    "volume": 5,
    "abstract": "This paper classifies restricted classes of classical physical systems: symplectic and Poisson systems and classical statistical systems. The central structural fact is an inversion of the Riemannian situation. Darboux\u2019s theorem removes every local symplectic invariant, so the classification content",
    "abstractFull": "This paper classifies restricted classes of classical physical systems: symplectic and Poisson systems and classical statistical systems. The central structural fact is an inversion of the Riemannian situation. Darboux\u2019s theorem removes every local symplectic invariant, so the classification content of Hamiltonian mechanics is global and topological. On the Poisson side, Weinstein\u2019s splitting theorem replaces local rigidity by a rank stratification into symplectic leaves and transverse data, and coadjoint orbits tie the homogeneous case to the Dynkin classification of simple Lie algebras and the highest-weight classification of their finite-dimensional representations. On the statistical side, Chentsov\u2019s theorem singles out the Fisher metric as the unique metric monotone under stochastic maps, while the quantum analogue is parametric rather than unique. The results include one complete local classification theorem, one rank normal form, one uniqueness theorem, and two restricted global classification theorems, each stated with hypotheses and proof or proof reference. The limitation that matters most is scope: no global classification theorem for closed symplectic manifolds is claimed or available, decomposition uniqueness is open outside restricted subclasses, and the deformation-quantization bridge to quantum theory remains conjectural. Computational experiments exhibit the local normal forms and supply executable models; they are evidence, not proofs.",
    "pages": 20,
    "hasCode": true,
    "category": "math.SG",
    "date": "October 2026"
  },
  {
    "slug": "vol-06-quantum-systems",
    "title": "Classification of Quantum Physical Systems",
    "subtitle": "Part VI of The Classification of Mathematical Representations of Physical Systems",
    "part": "Part 6",
    "volume": 6,
    "abstract": "Quantum physical systems admit a complete structural classification only in restricted regimes, and this paper records where those regimes begin and end. Finite-dimensional observable algebras are classified by one combinatorial invariant, the dimension vector of the block decomposition. Amenable op",
    "abstractFull": "Quantum physical systems admit a complete structural classification only in restricted regimes, and this paper records where those regimes begin and end. Finite-dimensional observable algebras are classified by one combinatorial invariant, the dimension vector of the block decomposition. Amenable operator-algebraic models are classified by Murray-von Neumann type together with Connes invariants. Completely positive maps admit a canonical normal form through minimal Stinespring dilations, unique up to unitary equivalence, and the Kraus rank of that normal form is not an isomorphism invariant of channels. Beyond the amenable class no finite answer is possible: uncountably many pairwise non-isomorphic separable factors exist, so no finite list of factor types can be exhaustive. On the categorical side, the Doplicher-Roberts reconstruction theorem and Deligne\u2019s theorem classify superselection and symmetric tensor categories under explicit hypotheses, and the Etingof-Gelaki examples show that any equivalence forgetting the symmetric structure fails to recover its group. Quantum monotone metrics form a parametric family rather than a unique choice. The paper separates classified islands from proved impossibilities and open problems, and reports executable models of the finite-dimensional taxonomy as computational evidence only.",
    "pages": 20,
    "hasCode": true,
    "category": "math-ph",
    "date": "October 2026"
  },
  {
    "slug": "vol-07-gauge-qft",
    "title": "Gauge Structures and Quantum Field Theories",
    "subtitle": "Part 7 of The Classification of Mathematical Representations of Physical Systems",
    "part": "Part 7",
    "volume": 7,
    "abstract": "We develop the classification of gauge structures and quantum field theories within the CMRPS program. The subject divides into two territories of unequal evidential standing. The established territory contains the KillingCartan classification of semisimple Lie algebras, the highest-weight classific",
    "abstractFull": "We develop the classification of gauge structures and quantum field theories within the CMRPS program. The subject divides into two territories of unequal evidential standing. The established territory contains the KillingCartan classification of semisimple Lie algebras, the highest-weight classification of their finite-dimensional representations, the classification of principal -bundles by homotopy classes of maps into the classifying space , characteristic classes as pullbacks of universal classes, and anomalies as cohomological obstructions that gate quantization. The restricted territory contains functorial topological field theories under the Atiyah axioms and the DoplicherRoberts reconstruction of superselection sectors under the HaagKastler framework. Beyond these islands the evidence is claimed rather than proved. The cobordism hypothesis classifies extended topological field theories by fully dualizable objects, yet the 2009 writeup is an informal proof sketch. The October 2026 four-dimensional quantum chromodynamics claim stands at existence claimed with manuscript and formalization withheld and verification pending, and the YangMills mass gap remains open. We present the classification results with their hypotheses and keep proved, claimed, and open statements apart throughout.",
    "pages": 20,
    "hasCode": true,
    "category": "math-ph",
    "date": "October 2026"
  },
  {
    "slug": "vol-08-spacetime-reconstruction",
    "title": "Classification and Reconstruction of Spacetime",
    "subtitle": "Part 8 of The Classification of Mathematical Representations of Physical Systems",
    "part": "Part 8",
    "volume": 8,
    "abstract": "This paper classifies and reconstructs spacetime and separates what is proved from what is proposed. Four results are complete within their stated hypotheses: connected holonomy groups of Lorentzian manifolds in signature are classified and realized by explicit metrics; the causal ladder of spacetim",
    "abstractFull": "This paper classifies and reconstructs spacetime and separates what is proved from what is proposed. Four results are complete within their stated hypotheses: connected holonomy groups of Lorentzian manifolds in signature are classified and realized by explicit metrics; the causal ladder of spacetimes is complete as a hierarchy of causality conditions; closed 3-manifolds decompose into exactly eight Thurston geometries; and for two, three, and four boundary regions the holographic entropy cone is cut out by strong subadditivity together with monogamy of mutual information. Against these islands, the homeomorphism problem for closed 4-manifolds is algorithmically undecidable, so finite classification tables exist only in tame regimes. Reconstruction recovers a target geometry from relational probe data: the chronological order determines the topology and the conformal class of a distinguishing spacetime, and entanglement-wedge reconstruction recovers bulk operators from boundary subregions in a quantum-information setting. The Ryu-Takayanagi formula remains a proposal, with exact agreement in AdS/2D CFT and for spherical regions in higher dimensions, HaPPY codes realize it in toy models only, and entanglement-induced geometry is an argument. Two boundary statements delimit the subject: monogamy of mutual information is independent of strong subadditivity over entropic vectors, and the ladder depends on how its rungs are translated to discrete orders.",
    "pages": 21,
    "hasCode": true,
    "category": "gr-qc",
    "date": "October 2026"
  },
  {
    "slug": "vol-09-gravity-information-geometry",
    "title": "Gravity, Information, and Geometric Correspondence",
    "subtitle": "Part 9 of The Classification of Mathematical Representations of Physical Systems",
    "part": "Part 9",
    "volume": 9,
    "abstract": "This paper examines the relationship between information geometry and gravity from the viewpoint of classification: which geometric structures on state spaces are established mathematics, and which proposed correspondences remain conjectural. Six results are established in finite dimensions. The Fis",
    "abstractFull": "This paper examines the relationship between information geometry and gravity from the viewpoint of classification: which geometric structures on state spaces are established mathematics, and which proposed correspondences remain conjectural. Six results are established in finite dimensions. The Fisher family is unique up to a positive constant among metric families on the probability simplices that are monotone under stochastic maps, and monotonicity is proved directly. On quantum state spaces uniqueness fails: monotone metrics form the Petz family of operator monotone functions, and the symmetric logarithmic derivative and Wigner-Yanase metrics are not proportional on qubit states. Every metric of the family restricts to the Fisher metric on commuting states, so uniqueness holds exactly on the commutative locus. The symmetric logarithmic derivative metric makes the open qubit state space an open hemisphere of the round three-sphere of radius one. Thermodynamic Ruppeiner geometry of the ideal gas is flat, and a van der Waals model has nonzero scalar curvature away from the critical region. Entanglement-wedge reconstruction and the holographic entropy cone for at most five regions are theorems; the entropy formula and the emergence of spacetime from entanglement are proposals, and the correspondence between gravity and information geometry is proposed, not proved.",
    "pages": 21,
    "hasCode": true,
    "category": "math-ph",
    "date": "October 2026"
  },
  {
    "slug": "vol-10-observational-equivalence",
    "title": "Observational Equivalence and Physical Distinguishability",
    "subtitle": "Part 10 of The Classification of Mathematical Representations of Physical Systems",
    "part": "Part 10",
    "volume": 10,
    "abstract": "The classification problem of mathematical representations of physical systems is a quotient: classify objects of a category of systems up to an equivalence relation. The quotient is unusable until the relation is chosen, and the choice is decisive. This paper develops the observational side of that",
    "abstractFull": "The classification problem of mathematical representations of physical systems is a quotient: classify objects of a category of systems up to an equivalence relation. The quotient is unusable until the relation is chosen, and the choice is decisive. This paper develops the observational side of that choice. It separates three relations: mathematical equivalence, given by isomorphism of the component data of a representation; physical equivalence, an open choice constrained by what the identifying morphism preserves; and observational equivalence, induced by a functor from systems to observation records. Observation functors are defined, their induced relations are proved to be equivalence relations with classes given by record isomorphism classes, and their interaction with coarse-graining is proved monotone in one direction only. Distinguishability is treated through monotone metrics: the Fisher metric is the unique classical choice up to constant, while the quantum case admits a parametric family indexed by operator monotone functions. An explicit two-dimensional computation shows the resulting quadratic forms differ on non-commuting directions, so quantum metric distinguishability is not canonical. The plain tensor-category criterion for physical equivalence fails outright: equivalence of representation categories without the symmetric structure does not recover the group, and every proposed relation must name the layers of structure it preserves. A counterexample search records which candidate criteria fail and why, and the empirical layer of the three-layer architecture is instantiated as a functor and left open where the sources leave it open.",
    "pages": 20,
    "hasCode": true,
    "category": "math.CT",
    "date": "October 2026"
  },
  {
    "slug": "vol-11-completeness-obstructions",
    "title": "Completeness and Obstructions",
    "subtitle": "Part 11 of The Classification of Mathematical Representations of Physical Systems",
    "part": "Part 11",
    "volume": 11,
    "abstract": "This paper determines what can be established about the completeness of a classification of mathematical representations of physical systems. Seven proved obstruction theorems are compiled as a register: there are uncountably many separable type factors; tensor-category equivalence without symmetric",
    "abstractFull": "This paper determines what can be established about the completeness of a classification of mathematical representations of physical systems. Seven proved obstruction theorems are compiled as a register: there are uncountably many separable type factors; tensor-category equivalence without symmetric structure does not determine the group; every Markov property of finitely presentable groups is algorithmically undecidable; wild representation categories admit no parametrization by a finite-dimensional variety; homeomorphism of a specific closed four-manifold is unrecognizable; isomorphism of separable von Neumann algebras admits no classification by countable invariants; and the tame-wild dichotomy bounds algorithmic tractability. From these results a classification program is defined as a triple of complete invariant, parameter space, and recognition procedure, and each surveyed domain of mathematical physics is assigned to one of seven regimes. A transport theorem shows that wild embeddings and invariant obstructions propagate along fully faithful functors, so such obstructions travel with any fully faithful re-presentation of a domain. Counterexamples refute three natural completions of the universal classification conjecture. The conjecture itself is examined obligation by obligation and is never used as a lemma. Completeness holds in restricted tame regimes and is provably unattainable elsewhere without further restrictions.",
    "pages": 21,
    "hasCode": true,
    "category": "math.CT",
    "date": "October 2026"
  },
  {
    "slug": "vol-12-principia-physica",
    "title": "Principia Physica",
    "subtitle": "Volume 12 of The Classification of Mathematical Representations of Physical Systems",
    "part": "Part 12",
    "volume": 12,
    "abstract": "This paper assembles the registered results of the Classification of Mathematical Representations of Physical Systems into the three-layer architecture of Principia Physica: mathematical classification, physical realization, and empirical selection. The assembly keeps the three layers apart and sepa",
    "abstractFull": "This paper assembles the registered results of the Classification of Mathematical Representations of Physical Systems into the three-layer architecture of Principia Physica: mathematical classification, physical realization, and empirical selection. The assembly keeps the three layers apart and separates proved statements from conjectural ones. Twenty background classification theorems and seven obstruction theorems are organized into seven classification regimes; a finite case analysis of the twenty-eight domains of the program comparison spine, with one boundary case, shows that fifteen carry a classification theorem with a finite or explicitly parameterized invariant, one is complete but unparameterized, one is a complete obstruction classification, seven remain open or claimed, three are impossible in the stated generality, one is undecidable, and one is decidable but unclassified. Eight reconstruction theorems recover objects from probes, each under hypotheses that cannot be dropped. The empirical layer admits no unique monotone metric in the quantum case, and no record validates the physical layer: the announced four-dimensional existence result carries the status existence claimed; manuscript and formalization withheld; verification pending, and the mass gap problem remains open. The structural classification statement enters only as a declared hypothesis, and a conditional reduction records what its five proof obligations would deliver. No record in the series carries a completed computer-checked proof.",
    "pages": 21,
    "hasCode": true,
    "category": "math-ph",
    "date": "October 2026"
  },
  {
    "slug": "synthesis",
    "title": "Structural Synthesis",
    "subtitle": "Synthesis of The Classification of Mathematical Representations of Physical Systems",
    "part": "Synthesis",
    "volume": 13,
    "abstract": "This paper states the structural picture formed by the twelve parts of the Classification of Mathematical Representations of Physical Systems, a program asking whether mathematical representations of physical systems admit a structural classification analogous to the Classification of Finite Simple ",
    "abstractFull": "This paper states the structural picture formed by the twelve parts of the Classification of Mathematical Representations of Physical Systems, a program asking whether mathematical representations of physical systems admit a structural classification analogous to the Classification of Finite Simple Groups. One ontology of forty-two definitions, one dependency graph, and one equivalence discipline run through the series. Three kinds of result organize its classification content. Complete invariants appear wherever the invariant is finite or explicitly parameterized: dimension vectors for finite-dimensional -algebras, Dynkin and Satake diagrams for semisimple Lie theory, classifying spaces for principal bundles, and the Murray-von Neumann and Connes data for amenable factors. Reconstruction theorems recover objects from probes under hypotheses that cannot be dropped. Seven obstruction theorems bound the scope of any classification, from uncountably many type factors to algorithmic unrecognizability in dimension four. Every equivalence in the series declares the structure it preserves, and equivalences that forget the symmetric layer fail in a proved counterexample. The structural classification conjecture is stated as the program\u2019s theorem target with its five proof obligations. The cross-volume consistency report records that the twelve parts share definitions, dependency discipline, and claim vocabulary without conflict.",
    "pages": 23,
    "hasCode": false,
    "category": "math-ph",
    "date": "October 2026"
  }
]
exec
/usr/local/bin/zsh -lc "cat website/app/layout.tsx; cat 'website/app/papers/[slug]/page.tsx'; cat website/app/periodic-table/page.tsx; cat website/app/page.tsx; cat website/package.json; cat website/lib/macros.ts" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
import type { Metadata } from 'next';
import { Inter, Spectral } from 'next/font/google';
import 'katex/dist/katex.min.css';
import './globals.css';

const inter = Inter({ subsets: ['latin'], variable: '--font-inter', display: 'swap' });
const spectral = Spectral({
  subsets: ['latin'],
  weight: ['400', '600', '700'],
  variable: '--font-spectral',
  display: 'swap',
});

const siteUrl = process.env.VERCEL_PROJECT_PRODUCTION_URL
  ? `https://${process.env.VERCEL_PROJECT_PRODUCTION_URL}`
  : process.env.NEXT_PUBLIC_SITE_URL || 'http://localhost:3000';

const SITE_NAME = 'CMRPS';

export const metadata: Metadata = {
  metadataBase: new URL(siteUrl),
  title: { default: 'CMRPS — Classification of Mathematical Representations of Physical Systems', template: '%s | CMRPS' },
  description:
    'A twelve-volume research series on the structural classification of mathematical representations of physical systems, with a structural synthesis. Matthew Long / The YonedaAI Collaboration.',
  openGraph: {
    type: 'website',
    siteName: SITE_NAME,
    images: [{ url: '/og/og-default.png', width: 1200, height: 630 }],
  },
  twitter: {
    card: 'summary_large_image',
    images: ['/og/og-default.png'],
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={`${inter.variable} ${spectral.variable}`}>
        <header className="site-header">
          <div className="site-header-inner">
            <a className="site-title" href="/">
              <span className="mark">CMRPS</span>
              <span>The Classification of Mathematical Representations of Physical Systems</span>
            </a>
            <nav className="site-nav">
              <a href="/#papers">Papers</a>
              <a href="/periodic-table/">Periodic Table</a>
              <a href="/#series">Series</a>
            </nav>
          </div>
        </header>
        <main>{children}</main>
        <footer className="site-footer">
          <div className="site-footer-inner">
            <div>
              <h3>CMRPS</h3>
              <p>
                The Classification of Mathematical Representations of Physical Systems —
                a twelve-volume series with a structural synthesis. All results are stated
                relative to the admissibility axioms and preservation laws fixed in the
                series.
              </p>
              <p>
                Matthew Long / The YonedaAI Collaboration · YonedaAI Research Collective ·
                Chicago, Illinois, USA
              </p>
            </div>
            <div>
              <h3>Read</h3>
              <ul>
                <li><a href="/#papers">All papers</a></li>
                <li><a href="/periodic-table/">Periodic table</a></li>
                <li><a href="/papers/synthesis/">Structural synthesis</a></li>
              </ul>
            </div>
            <div>
              <h3>Series</h3>
              <ul>
                <li><a href="/pdf/synthesis.pdf">Synthesis PDF</a></li>
                <li><a href="/pdf/vol-12-principia-physica.pdf">Principia Physica PDF</a></li>
                <li><a href="/pdf/vol-01-foundations.pdf">Foundations PDF</a></li>
              </ul>
            </div>
          </div>
        </footer>
      </body>
    </html>
  );
}
import type { Metadata } from 'next';
import { getPapers, getPaper, getPaperHTML } from '../../../lib/papers';
import { PaperContent } from '../../../components/PaperContent';
import { TableOfContents } from '../../../components/TableOfContents';

export function generateStaticParams() {
  return getPapers().map((p) => ({ slug: p.slug }));
}

export async function generateMetadata({
  params,
}: {
  params: { slug: string };
}): Promise<Metadata> {
  const paper = getPaper(params.slug);
  if (!paper) return {};
  return {
    title: paper.title,
    description: paper.abstract,
    openGraph: {
      title: paper.title,
      description: paper.abstract,
      type: 'article',
      url: `/papers/${paper.slug}/`,
      images: [{ url: `/og/${paper.slug}.png`, width: 1200, height: 630 }],
    },
    twitter: {
      card: 'summary_large_image',
      title: paper.title,
      description: paper.abstract,
      images: [`/og/${paper.slug}.png`],
    },
  };
}

export default function PaperPage({ params }: { params: { slug: string } }) {
  const paper = getPaper(params.slug);
  if (!paper) {
    return (
      <section className="section">
        <h2>Paper not found</h2>
      </section>
    );
  }

  const { html, headings } = getPaperHTML(paper.slug);
  const papers = getPapers();
  const idx = papers.findIndex((p) => p.slug === paper.slug);
  const prev = idx > 0 ? papers[idx - 1] : undefined;
  const next = idx >= 0 && idx < papers.length - 1 ? papers[idx + 1] : undefined;

  return (
    <>
      <div className="paper-layout">
        <article>
          <header className="paper-header">
            <p className="kicker">{paper.part} · {paper.category}</p>
            <h1>{paper.title}</h1>
            {paper.subtitle ? <p className="sub">{paper.subtitle}</p> : null}
            <div className="paper-meta">
              <span><b>Matthew Long</b> · The YonedaAI Collaboration</span>
              <span>{paper.date}</span>
              <span>{paper.pages} pages</span>
            </div>
            <a className="btn btn-primary" href={`/pdf/${paper.slug}.pdf`}>
              Download PDF
            </a>
          </header>

          <PaperContent html={html} />

          <nav className="paper-nav">
            {prev ? (
              <a className="nav-link prev" href={`/papers/${prev.slug}/`}>
                <div className="dir">← Previous · {prev.part}</div>
                <div className="nav-title">{prev.title}</div>
              </a>
            ) : (
              <span />
            )}
            {next ? (
              <a className="nav-link next" href={`/papers/${next.slug}/`}>
                <div className="dir">Next · {next.part} →</div>
                <div className="nav-title">{next.title}</div>
              </a>
            ) : (
              <span />
            )}
          </nav>
        </article>

        <aside>
          <TableOfContents headings={headings} />
        </aside>
      </div>

      <a className="btn btn-primary pdf-btn pdf-btn-fixed" href={`/pdf/${paper.slug}.pdf`}>
        PDF
      </a>
    </>
  );
}
import type { Metadata } from 'next';
import { getPeriodicTable } from '../../lib/papers';
import { PaperContent } from '../../components/PaperContent';

const title = 'The Periodic Table of Mathematical Physics';

export const metadata: Metadata = {
  title,
  description:
    'The classification chart of the CMRPS program: structural families and their defining invariants, exceptional structures, proven reconstruction relationships, and the claim status of every row (PROVEN, CLAIMED, OPEN, IMPOSSIBLE).',
  openGraph: {
    title,
    type: 'article',
    url: '/periodic-table/',
    images: [{ url: '/og/synthesis.png', width: 1200, height: 630 }],
  },
  twitter: {
    card: 'summary_large_image',
    title,
    images: ['/og/synthesis.png'],
  },
};

export default async function PeriodicTablePage() {
  const { html } = await getPeriodicTable();

  return (
    <div className="paper-layout">
      <article>
        <header className="paper-header">
          <p className="kicker">Program registry · CMRPS</p>
          <h1>{title}</h1>
          <p className="sub">
            A research framework for classification, not a completed classification.
            Completeness is a theorem to investigate; the central conjecture it serves
            remains a conjecture.
          </p>
          <div className="paper-meta">
            <span><b>Matthew Long</b> · The YonedaAI Collaboration</span>
            <span>Status date 29 October 2026</span>
          </div>
        </header>

        <PaperContent html={html} />
      </article>
    </div>
  );
}
import type { Metadata } from 'next';
import { getPapers } from '../lib/papers';

export const metadata: Metadata = {
  openGraph: {
    images: [{ url: '/og/og-default.png', width: 1200, height: 630 }],
  },
  twitter: {
    card: 'summary_large_image',
    images: ['/og/og-default.png'],
  },
};

export default function HomePage() {
  const papers = getPapers();
  const totalPages = papers.reduce((n, p) => n + p.pages, 0);

  return (
    <>
      <section className="hero">
        <div className="hero-bg" />
        <div className="hero-grid-lines" />
        <div className="hero-inner">
          <p className="hero-kicker">A research series in structural mathematics</p>
          <h1>
            The Classification of Mathematical Representations of{' '}
            <span className="em">Physical Systems</span>
          </h1>
          <p className="hero-sub">
            A representation is recorded as a five-part tuple of state space, observables,
            dynamics, symmetries, and composition rules. The series fixes a morphism
            vocabulary with explicit preservation laws, classifies restricted classes in
            full, and states the structural classification conjecture with its five proof
            obligations. Twelve volumes, one synthesis.
          </p>
          <div className="hero-meta">
            <span><b>{papers.length}</b> papers</span>
            <span><b>{totalPages}</b> pages</span>
            <span>Matthew Long · The YonedaAI Collaboration</span>
            <span>October 2026</span>
          </div>
          <div className="hero-actions">
            <a className="btn btn-primary" href="#papers">Read the papers</a>
            <a className="btn btn-ghost" href="/periodic-table/">Periodic table</a>
          </div>
        </div>
      </section>

      <section className="section" id="papers">
        <div className="section-head">
          <h2>Papers</h2>
          <span className="hint">Twelve volumes and a structural synthesis</span>
        </div>
        <div className="paper-grid">
          {papers.map((p) => (
            <article className="paper-card" key={p.slug}>
              <div className="card-part">
                <span>{p.part}</span>
                <span className="cat">{p.category}</span>
              </div>
              <h3>
                <a href={`/papers/${p.slug}/`}>{p.title}</a>
              </h3>
              {p.subtitle ? <p className="card-sub">{p.subtitle}</p> : null}
              <p className="card-abstract">{p.abstract.slice(0, 150)}…</p>
              <div className="card-foot">
                <a className="read" href={`/papers/${p.slug}/`}>Read →</a>
                <a className="pdf-link" href={`/pdf/${p.slug}.pdf`}>PDF</a>
                <span>{p.pages} pp</span>
              </div>
            </article>
          ))}
        </div>
      </section>

      <section className="section" id="series">
        <div className="section-head">
          <h2>Program</h2>
        </div>
        <div className="paper-grid">
          <article className="paper-card">
            <div className="card-part">
              <span>Registry</span>
              <span className="cat">PROVEN · CLAIMED · OPEN · IMPOSSIBLE</span>
            </div>
            <h3>
              <a href="/periodic-table/">The Periodic Table of Mathematical Physics</a>
            </h3>
            <p className="card-abstract">
              The classification chart of the program: ten candidate structural families
              with their defining invariants, exceptional structures, proven
              reconstruction relationships, and the claim status of every row.
            </p>
            <div className="card-foot">
              <a className="read" href="/periodic-table/">Open the table →</a>
            </div>
          </article>
          <article className="paper-card">
            <div className="card-part">
              <span>Synthesis</span>
              <span className="cat">math-ph</span>
            </div>
            <h3>
              <a href="/papers/synthesis/">Structural Synthesis</a>
            </h3>
            <p className="card-abstract">
              The structural picture formed by the twelve parts: the registered results,
              the dependency structure among the volumes, and the obligations the
              classification conjecture still carries.
            </p>
            <div className="card-foot">
              <a className="read" href="/papers/synthesis/">Read →</a>
              <a className="pdf-link" href="/pdf/synthesis.pdf">PDF</a>
            </div>
          </article>
          <article className="paper-card">
            <div className="card-part">
              <span>Method</span>
              <span className="cat">admissibility</span>
            </div>
            <h3>
              <a href="/papers/vol-01-foundations/">Foundations of Structural Classification</a>
            </h3>
            <p className="card-abstract">
              The definitional root of the series: the system record schema, five morphism
              kinds with preservation laws, admissibility conditions, and three restricted
              classifications proved in full.
            </p>
            <div className="card-foot">
              <a className="read" href="/papers/vol-01-foundations/">Read →</a>
              <a className="pdf-link" href="/pdf/vol-01-foundations.pdf">PDF</a>
            </div>
          </article>
        </div>
      </section>
    </>
  );
}
{
  "name": "website",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint"
  },
  "dependencies": {
    "isomorphic-dompurify": "^4.6.0",
    "katex": "^0.19.1",
    "marked": "^18.1.2",
    "next": "14.2.35",
    "react": "^18",
    "react-dom": "^18"
  },
  "devDependencies": {
    "@types/katex": "^0.16.8",
    "@types/marked": "^5.0.2",
    "@types/node": "^20",
    "@types/react": "^18",
    "@types/react-dom": "^18",
    "postcss": "^8",
    "tailwindcss": "^3.4.1",
    "typescript": "^5"
  }
}
import * as fs from 'fs';
import * as path from 'path';

export type MacroMap = Record<string, string>;

export const BASE_MACROS: MacroMap = {
  '\\slashed': '\\not{#1}',
  '\\bra': '\\langle #1 \\vert',
  '\\ket': '\\vert #1 \\rangle',
  '\\braket': '\\langle #1 \\vert #2 \\rangle',
  '\\Hom': '\\operatorname{Hom}',
  '\\Tr': '\\operatorname{Tr}',
  '\\Lan': '\\operatorname{Lan}',
  '\\Ran': '\\operatorname{Ran}',
  '\\End': '\\operatorname{End}',
  '\\Nat': '\\operatorname{Nat}',
  '\\Sp': '\\operatorname{Sp}',
  '\\id': '\\operatorname{id}',
  '\\im': '\\operatorname{im}',
  '\\coker': '\\operatorname{coker}',
  '\\rank': '\\operatorname{rank}',
  '\\diag': '\\operatorname{diag}',
  '\\supp': '\\operatorname{supp}',
  '\\Arg': '\\operatorname{Arg}',
  '\\Res': '\\operatorname{Res}',
  '\\ad': '\\operatorname{ad}',
};

/**
 * Auto-extract \newcommand / \renewcommand / \DeclareMathOperator definitions
 * from the LaTeX preambles of the series papers. Papers define 50-70 custom
 * commands between them; missing any produces red error text on the site.
 */
export function extractMacros(texDir: string): MacroMap {
  const macros: MacroMap = { ...BASE_MACROS };
  if (!fs.existsSync(texDir)) return macros;

  const newCmd = /\\(?:newcommand|renewcommand)\s*\{?(\\[a-zA-Z]+)\}?\s*(?:\[(\d)\])?\s*\{/g;
  const declOp = /\\DeclareMathOperator\*?\s*\{?(\\[a-zA-Z]+)\}?\s*\{([^{}]*)\}/g;

  for (const file of fs.readdirSync(texDir)) {
    if (!file.endsWith('.tex')) continue;
    const src = fs.readFileSync(path.join(texDir, file), 'utf8');
    // only scan the preamble — the body can contain usage, not definitions
    const preamble = src.includes('\\begin{document}')
      ? src.slice(0, src.indexOf('\\begin{document}'))
      : src;

    let m: RegExpExecArray | null;
    while ((m = newCmd.exec(preamble)) !== null) {
      const name = m[1];
      const arity = m[2] ? parseInt(m[2], 10) : 0;
      const body = extractBraceGroup(preamble, newCmd.lastIndex - 1);
      if (body === null) continue;
      let replacement = body;
      for (let i = 1; i <= arity; i++) {
        replacement = replacement.replace(
          new RegExp(`#${i}`, 'g'),
          `{#${i}}`,
        );
      }
      macros[name] = replacement;
    }
    while ((m = declOp.exec(preamble)) !== null) {
      macros[m[1]] = `\\operatorname{${m[2]}}`;
    }
  }
  return macros;
}

function extractBraceGroup(src: string, openIdx: number): string | null {
  if (src[openIdx] !== '{') return null;
  let depth = 0;
  for (let i = openIdx; i < src.length; i++) {
    const c = src[i];
    if (c === '\\') {
      i++;
      continue;
    }
    if (c === '{') depth++;
    else if (c === '}') {
      depth--;
      if (depth === 0) return src.slice(openIdx + 1, i);
    }
  }
  return null;
}

let cached: MacroMap | null = null;

export function getMacros(): MacroMap {
  if (cached) return cached;
  const candidates = [
    path.join(process.cwd(), '..', 'papers', 'latex'),
    path.join(process.cwd(), 'content', 'tex'),
  ];
  for (const dir of candidates) {
    if (fs.existsSync(dir)) {
      cached = extractMacros(dir);
      return cached;
    }
  }
  cached = { ...BASE_MACROS };
  return cached;
}

exec
/usr/local/bin/zsh -lc "nl -ba website/app/globals.css | sed -n '390,850p'; nl -ba website/content/periodic-table.md | head -100; nl -ba website/content/periodic-table-sources.md | head -35" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   390	  align-items: center;
   391	  gap: 0.55rem 0.9rem;
   392	  border-top: 1px solid var(--border);
   393	  padding-top: 0.85rem;
   394	  font-size: 0.82rem;
   395	  color: var(--text-dim);
   396	}
   397	
   398	.card-foot .read {
   399	  color: var(--accent);
   400	  font-weight: 600;
   401	}
   402	
   403	.card-foot .pdf-link {
   404	  color: var(--text-muted);
   405	  border: 1px solid var(--border);
   406	  border-radius: 6px;
   407	  padding: 0.18rem 0.55rem;
   408	}
   409	.card-foot .pdf-link:hover {
   410	  color: var(--accent-hover);
   411	  border-color: var(--accent);
   412	}
   413	
   414	/* ---------- paper page ---------- */
   415	
   416	.paper-layout {
   417	  max-width: 1120px;
   418	  margin: 0 auto;
   419	  padding: 1.5rem 1rem 4rem;
   420	  display: grid;
   421	  grid-template-columns: 1fr;
   422	  gap: 2rem;
   423	}
   424	
   425	.paper-layout > * {
   426	  min-width: 0;
   427	}
   428	
   429	@media (min-width: 1024px) {
   430	  .paper-layout {
   431	    grid-template-columns: minmax(0, 1fr) 240px;
   432	    padding: 2.5rem 1.5rem 5rem;
   433	    gap: 3rem;
   434	  }
   435	}
   436	
   437	.paper-header {
   438	  margin-bottom: 1.75rem;
   439	}
   440	
   441	.paper-header .kicker {
   442	  color: var(--accent-secondary);
   443	  font-size: 0.76rem;
   444	  font-weight: 600;
   445	  letter-spacing: 0.2em;
   446	  text-transform: uppercase;
   447	  margin: 0 0 0.75rem;
   448	}
   449	
   450	.paper-header h1 {
   451	  font-size: clamp(1.65rem, 4.5vw, 2.55rem);
   452	  margin: 0 0 0.75rem;
   453	}
   454	
   455	.paper-header .sub {
   456	  color: var(--text-muted);
   457	  font-size: 1.02rem;
   458	  margin: 0 0 1rem;
   459	}
   460	
   461	.paper-meta {
   462	  display: flex;
   463	  flex-wrap: wrap;
   464	  gap: 0.45rem 1.15rem;
   465	  color: var(--text-dim);
   466	  font-size: 0.83rem;
   467	}
   468	
   469	.paper-meta b {
   470	  color: var(--text-muted);
   471	  font-weight: 600;
   472	}
   473	
   474	.pdf-btn {
   475	  position: fixed;
   476	  right: 1rem;
   477	  bottom: 1rem;
   478	  z-index: 40;
   479	  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.45);
   480	}
   481	
   482	@media (min-width: 1024px) {
   483	  .pdf-btn-fixed {
   484	    display: none;
   485	  }
   486	}
   487	
   488	.paper-abstract {
   489	  border: 1px solid var(--border);
   490	  border-left: 3px solid var(--accent);
   491	  background: var(--surface);
   492	  border-radius: 10px;
   493	  padding: 1.15rem 1.25rem;
   494	  margin: 1.5rem 0 2.25rem;
   495	}
   496	
   497	.paper-abstract h2 {
   498	  font-size: 1.05rem;
   499	  margin: 0 0 0.65rem;
   500	  color: var(--accent-hover);
   501	  font-family: var(--font-body);
   502	  letter-spacing: 0.08em;
   503	  text-transform: uppercase;
   504	}
   505	
   506	.paper-abstract p {
   507	  margin: 0 0 0.75rem;
   508	  color: var(--text-muted);
   509	  font-size: 0.96rem;
   510	}
   511	.paper-abstract p:last-child {
   512	  margin-bottom: 0;
   513	}
   514	
   515	/* ---------- paper content typography + math ---------- */
   516	
   517	.paper-content {
   518	  min-width: 0;
   519	  max-width: 100%;
   520	  overflow-wrap: break-word;
   521	  word-break: normal;
   522	  font-size: 1.02rem;
   523	  color: var(--text);
   524	}
   525	
   526	.paper-content .katex-display {
   527	  max-width: 100%;
   528	}
   529	
   530	.paper-content h1,
   531	.paper-content h2,
   532	.paper-content h3,
   533	.paper-content h4 {
   534	  max-width: 100%;
   535	}
   536	
   537	.paper-content h2 {
   538	  font-size: clamp(1.35rem, 3.2vw, 1.85rem);
   539	  margin: 2.75rem 0 1rem;
   540	  padding-top: 0.5rem;
   541	  border-top: 1px solid var(--border);
   542	}
   543	
   544	.paper-content h3 {
   545	  font-size: clamp(1.12rem, 2.6vw, 1.38rem);
   546	  margin: 2.1rem 0 0.85rem;
   547	}
   548	
   549	.paper-content h4 {
   550	  font-size: 1.05rem;
   551	  margin: 1.6rem 0 0.7rem;
   552	  color: var(--text-muted);
   553	}
   554	
   555	.paper-content p {
   556	  margin: 0 0 1.05rem;
   557	}
   558	
   559	.paper-content ul,
   560	.paper-content ol {
   561	  margin: 0 0 1.15rem;
   562	  padding-left: 1.4rem;
   563	}
   564	
   565	.paper-content li {
   566	  margin-bottom: 0.45rem;
   567	}
   568	
   569	.paper-content blockquote {
   570	  margin: 1.25rem 0;
   571	  padding: 0.15rem 0 0.15rem 1.1rem;
   572	  border-left: 3px solid var(--border);
   573	  color: var(--text-muted);
   574	}
   575	
   576	.paper-content code {
   577	  font-family: ui-monospace, 'SFMono-Regular', Menlo, monospace;
   578	  font-size: 0.88em;
   579	  background: var(--code-bg);
   580	  border: 1px solid var(--border);
   581	  border-radius: 4px;
   582	  padding: 0.08em 0.35em;
   583	}
   584	
   585	.paper-content pre {
   586	  background: var(--code-bg);
   587	  border: 1px solid var(--border);
   588	  border-radius: 8px;
   589	  padding: 0.95rem 1.05rem;
   590	  overflow-x: auto;
   591	  max-width: 100%;
   592	  margin: 0 0 1.25rem;
   593	}
   594	
   595	.paper-content pre code {
   596	  background: none;
   597	  border: none;
   598	  padding: 0;
   599	  font-size: 0.82rem;
   600	  line-height: 1.55;
   601	}
   602	
   603	/* theorem-style blocks */
   604	.paper-content .definition,
   605	.paper-content .theorem,
   606	.paper-content .proposition,
   607	.paper-content .lemma,
   608	.paper-content .corollary,
   609	.paper-content .conjecture,
   610	.paper-content .example,
   611	.paper-content .remark,
   612	.paper-content .proof {
   613	  border: 1px solid var(--border);
   614	  border-radius: 10px;
   615	  padding: 1rem 1.15rem;
   616	  margin: 1.35rem 0;
   617	  background: rgba(14, 20, 40, 0.55);
   618	}
   619	
   620	.paper-content .definition {
   621	  border-left: 3px solid var(--accent);
   622	}
   623	.paper-content .theorem,
   624	.paper-content .proposition {
   625	  border-left: 3px solid var(--accent-secondary);
   626	}
   627	.paper-content .lemma,
   628	.paper-content .corollary {
   629	  border-left: 3px solid #7dd3fc;
   630	}
   631	.paper-content .conjecture {
   632	  border-left: 3px solid var(--warning);
   633	}
   634	.paper-content .remark,
   635	.paper-content .example {
   636	  border-left: 3px solid var(--border);
   637	}
   638	.paper-content .proof {
   639	  background: transparent;
   640	  border-style: dashed;
   641	}
   642	
   643	.paper-content .definition p,
   644	.paper-content .theorem p,
   645	.paper-content .proposition p,
   646	.paper-content .lemma p,
   647	.paper-content .corollary p,
   648	.paper-content .conjecture p {
   649	  margin-bottom: 0.65rem;
   650	}
   651	.paper-content .definition p:last-child,
   652	.paper-content .theorem p:last-child,
   653	.paper-content .proposition p:last-child {
   654	  margin-bottom: 0;
   655	}
   656	
   657	/* tables */
   658	.paper-content table {
   659	  display: block;
   660	  width: 100%;
   661	  max-width: 100%;
   662	  overflow-x: auto;
   663	  border-collapse: collapse;
   664	  margin: 1.5rem 0;
   665	  font-size: 0.86rem;
   666	}
   667	
   668	.paper-content caption {
   669	  caption-side: top;
   670	  text-align: left;
   671	  color: var(--text-muted);
   672	  font-size: 0.85rem;
   673	  padding: 0 0 0.65rem;
   674	  line-height: 1.5;
   675	}
   676	
   677	.paper-content caption .tbl-num {
   678	  color: var(--accent-secondary);
   679	  font-weight: 600;
   680	  margin-right: 0.35rem;
   681	}
   682	
   683	.paper-content th,
   684	.paper-content td {
   685	  border: 1px solid var(--border);
   686	  padding: 0.55rem 0.75rem;
   687	  text-align: left;
   688	  vertical-align: top;
   689	  min-width: 5.5rem;
   690	}
   691	
   692	.paper-content th {
   693	  background: var(--surface-hover);
   694	  color: var(--text);
   695	  font-weight: 600;
   696	}
   697	
   698	.paper-content tr:nth-child(even) td {
   699	  background: rgba(14, 20, 40, 0.4);
   700	}
   701	
   702	/* math — inline stays inline; display blocks scroll horizontally */
   703	.paper-content .math-display-rendered,
   704	.paper-content .math.display {
   705	  display: block;
   706	  overflow-x: auto;
   707	  overflow-y: hidden;
   708	  max-width: 100%;
   709	  padding: 0.35rem 0;
   710	}
   711	
   712	.paper-content .math-inline-rendered,
   713	.paper-content .math.inline {
   714	  display: inline;
   715	  max-width: 100%;
   716	}
   717	
   718	.paper-content .katex-display {
   719	  margin: 0.55rem 0;
   720	  overflow-x: auto;
   721	  overflow-y: hidden;
   722	}
   723	
   724	.paper-content .katex {
   725	  font-size: 1.06em;
   726	}
   727	
   728	.paper-content .math-display-rendered .katex-display > .katex {
   729	  text-align: left;
   730	}
   731	
   732	.paper-content .katex-error {
   733	  color: var(--warning);
   734	  font-family: ui-monospace, monospace;
   735	  font-size: 0.85em;
   736	}
   737	
   738	/* inline citations + bibliography */
   739	.paper-content a.citation {
   740	  color: var(--accent-secondary);
   741	  font-size: 0.85em;
   742	  white-space: nowrap;
   743	}
   744	
   745	.paper-content .thebibliography {
   746	  font-size: 0.88rem;
   747	  color: var(--text-muted);
   748	}
   749	
   750	.paper-content .bibitem {
   751	  margin: 0 0 0.85rem;
   752	  padding-left: 2.2rem;
   753	  text-indent: -2.2rem;
   754	}
   755	
   756	.paper-content .bibitem .bib-num {
   757	  color: var(--accent-secondary);
   758	  margin-right: 0.45rem;
   759	  font-weight: 600;
   760	}
   761	
   762	/* ---------- TOC ---------- */
   763	
   764	.toc-wrap {
   765	  min-width: 0;
   766	}
   767	
   768	.toc-toggle {
   769	  width: 100%;
   770	  text-align: left;
   771	  background: var(--surface);
   772	  color: var(--text);
   773	  border: 1px solid var(--border);
   774	  border-radius: 8px;
   775	  padding: 0.65rem 0.95rem;
   776	  font-size: 0.88rem;
   777	  font-weight: 600;
   778	  cursor: pointer;
   779	}
   780	
   781	@media (min-width: 1024px) {
   782	  .toc-toggle {
   783	    display: none;
   784	  }
   785	}
   786	
   787	.toc {
   788	  display: none;
   789	  flex-direction: column;
   790	  gap: 0.15rem;
   791	  margin-top: 0.65rem;
   792	}
   793	
   794	.toc-open {
   795	  display: flex;
   796	}
   797	
   798	@media (min-width: 1024px) {
   799	  .toc {
   800	    display: flex;
   801	    position: sticky;
   802	    top: 5.25rem;
   803	    max-height: calc(100vh - 7rem);
   804	    overflow-y: auto;
   805	    margin-top: 0;
   806	  }
   807	}
   808	
   809	.toc-item {
   810	  color: var(--text-muted);
   811	  font-size: 0.83rem;
   812	  line-height: 1.45;
   813	  padding: 0.32rem 0.65rem;
   814	  border-left: 2px solid transparent;
   815	  border-radius: 0 6px 6px 0;
   816	}
   817	
   818	.toc-item:hover {
   819	  color: var(--text);
   820	  background: var(--surface);
   821	}
   822	
   823	.toc-level-3 {
   824	  padding-left: 1.35rem;
   825	  font-size: 0.8rem;
   826	}
   827	.toc-level-4 {
   828	  padding-left: 2.05rem;
   829	  font-size: 0.78rem;
   830	  color: var(--text-dim);
   831	}
   832	
   833	.toc-active {
   834	  color: var(--accent-hover);
   835	  border-left-color: var(--accent);
   836	  background: var(--accent-glow);
   837	}
   838	
   839	/* ---------- prev / next ---------- */
   840	
   841	.paper-nav {
   842	  display: grid;
   843	  grid-template-columns: 1fr;
   844	  gap: 1rem;
   845	  margin-top: 3.5rem;
   846	  padding-top: 1.75rem;
   847	  border-top: 1px solid var(--border);
   848	}
   849	
   850	@media (min-width: 640px) {
     1	# The Periodic Table of Mathematical Physics
     2	
     3	**Program:** CMRPS, a 12-volume series by the YonedaAI Collaboration (PI Matthew Long).
     4	**Status date:** 2026-10-29.
     5	**Nature of this chart.** A research framework for classification, not a completed classification. Completeness is a theorem to investigate (Founding Document 02); the central conjecture it serves is registered as T-CMRPS-01 and remains a **conjecture**.
     6	
     7	**Status legend (used in every cell of every Status column).**
     8	
     9	| Token | Meaning |
    10	|---|---|
    11	| **PROVEN** | A classification theorem with a completeness statement exists in the stated scope. |
    12	| **CLAIMED** | An announced result whose supporting artifacts are not publicly checkable. |
    13	| **OPEN** | No complete result; partial or parametric results noted in the row. |
    14	| **IMPOSSIBLE** | A theorem proves that no classification of the stated kind can exist. |
    15	
    16	Citation convention: bracketed numbers resolve to the Sources list of `research/cmrps-research-map/REPORT.md`. Inferences are marked *conjectural* or *open*.
    17	
    18	---
    19	
    20	## (a) Fundamental structural families and their defining invariants
    21	
    22	Families I–X are the candidate organizing families of the founding document §4 (DEF-026–035). They are candidates, not a completed classification.
    23	
    24	| Family | Structure | Representative systems | Defining invariants | Status | Sources |
    25	|---|---|---|---|---|---|
    26	| **I** | Symplectic and Poisson structures | Classical mechanics | Symplectic form ω; **locally: none** (Darboux normal form); globally: topology of ω. Poisson: Weinstein splitting (symplectic × transverse), symplectic-leaf foliation, coadjoint orbits for KKS | **PROVEN** local; global classification topological | [6][7] |
    27	| **II** | Hilbert spaces and operator algebras | Quantum mechanics | Dimension vector (finite-dim C*: A ≅ ⊕ M_{n_i}(C)); Murray–von Neumann type + Connes invariants (amenable factors); Kraus rank (channels) | **PROVEN** islands; general factors **IMPOSSIBLE** [8]; fusion cats **OPEN** [14] | [8][9][10][11][14] |
    28	| **III** | Smooth manifolds and geometric structures | Relativity | Holonomy group (Lorentzian, Berger-list analogue); causal class (complete causal ladder); Thurston geometry type (3-manifolds) | **PROVEN** in stated regimes; dim-4 unrecognizable instances **IMPOSSIBLE** | [50][51][54][60] |
    29	| **IV** | Principal bundles and connections | Gauge theories | [X, BG]; characteristic classes in H*(BG) (SW, Pontryagin, Euler, Chern, DD); anomaly classes H¹⊕H²(CE(P)) | **PROVEN** (bundles; anomalies as obstructions) | [17][18][19] |
    30	| **V** | Probability and measure-theoretic structures | Statistical physics | Fisher metric, unique up to constant (Chentsov, classical) | **PROVEN** unique classical; quantum parametric (Petz–Sudar) | [52] |
    31	| **VI** | Topological and higher-categorical structures | TQFTs | Fully dualizable objects (cobordism hypothesis); Atiyah axioms | **CLAIMED** for extended TQFTs (Lurie proof sketch) [35]; functorial TQFT **PROVEN** tractable [36] | [34][35][36] |
    32	| **VII** | Dynamical systems and operator semigroups | Dissipative and open systems | Generator data; Stinespring minimal dilation of CP maps | **OPEN** as a classification; normal form only | [10][11] |
    33	| **VIII** | Tensor categories and compositional structures | Quantum information | Symmetric structure (load-bearing); conjugates, subobjects, End(1)=C (DR hypotheses); pivotal structure (fusion cats) | **PROVEN** islands (DR, Deligne); fusion cats **OPEN** | [12][13][14][16] |
    34	| **IX** | Discrete combinatorial structures | Lattice and network models | Lattice data; tame/wild class | **PROVEN** regime-restricted theorems [30][31][32]; wild sectors **IMPOSSIBLE** to classify | [30][31][32][55][56][57][58] |
    35	| **X** | Derived and homotopical structures | Higher gauge and derived field theories | Derived-tame vs derived-wild dichotomy | **OPEN** beyond the dichotomy | [55] |
    36	
    37	**Cross-family correspondences.** Classical–quantum connection via deformation quantization is *conjectural* (Founding Document §4). Gelfand/Stone/DR/Deligne links are proved — see region (c). The 2024–2026 supermap-representability line [40][41] and its possible unification with Gelfand/Stone/Naimark is *open*.
    38	
    39	---
    40	
    41	## (b) Exceptional structures
    42	
    43	The CFSG template suggests families + sporadics. The founding document warns: one should not assume that physical theories possess a finite collection of exceptional objects analogous to the 26 sporadic groups (Founding Document 03). The entries below are the proven exceptional mathematics the table must accommodate.
    44	
    45	| Exceptional object | Region | Defining data | Status | Sources |
    46	|---|---|---|---|---|
    47	| 26 sporadic finite simple groups (27 counting Tits) | Family II/group theory | Order, Schur multiplier, Out(G), presentations, character tables with power maps (ATLAS companions) | **PROVEN** to exist and be exhaustive (CFSG); no uniform parameterization known | [1][2][3] |
    48	| Exceptional Lie algebras G2, F4, E6, E7, E8 | Family I–II boundary (symmetry) | Dynkin diagrams outside A–D series; Satake diagrams for their real forms | **PROVEN** (Killing–Cartan complete) | [4] |
    49	| Real forms and compact/split forms | Family III (symmetry layer) | Order-≤2 automorphism classes; split and compact forms always exist | **PROVEN** | [4] |
    50	| Amenable type III₀ and III₁ factors | Family II | III₀ = ergodic flows; III₁ completed by Haagerup; III_λ (0<λ≤1) continuous parameter | **PROVEN** within the amenable class | [8] |
    51	| Hyperfinite (AFD) II₁ factor | Family II | Unique amenable II₁ factor | **PROVEN**; contrast: uncountably many non-amenable separable II₁ factors | [8] |
    52	| Thurston's 8 model geometries | Family III | S³, E³, H³, S²×R, H²×R, Nil, Sol, SL₂(R)~ | **PROVEN** (geometrization) | [60] |
    53	| Filipkiewicz's dim-4 model geometries | Family III | 18 + one countably infinite family | **PROVEN** to exist; only restricted 4-manifold classes decompose | [60] |
    54	| Isocategorical group pairs (Etingof–Gelaki) | Family VIII | Non-isomorphic groups with equivalent plain tensor representation categories | **PROVEN** to exist — the symmetric layer is not recoverable without them | [12] |
    55	| Extra Z₂ factor in higher-form DHR (Casini–Magan) | Families IV, VIII | Sector not realizable by Lagrangian gauge models | **OPEN** [single source] | [20] |
    56	
    57	---
    58	
    59	## (c) Proven reconstruction relationships
    60	
    61	Objects determined by probes — the pattern CFSG-class classification rarely achieves but reconstruction theorems routinely do.
    62	
    63	| Reconstruction theorem | Recovers | From | Scope limits | Status | Sources |
    64	|---|---|---|---|---|---|
    65	| Gelfand–Naimark | A concrete representation of a C*-algebra in B(H) | Abstract C*-algebra | Representation theorem, **not** a classification; only the commutative case is fully classified | **PROVEN** | [9][42] |
    66	| Gelfand duality | Compact Hausdorff space | Commutative C*-algebra | Commutative side only | **PROVEN** | [43] |
    67	| Stone duality | Spectrum (zero-dimensional compact space) | Boolean algebra | Boolean side only | **PROVEN** | [44] |
    68	| Doplicher–Roberts reconstruction | Compact supergroup (unique up to isomorphism) | Symmetric tensor *-category with conjugates, direct sums, subobjects, End(1)=C | Requires the symmetric structure; DHR selection criteria; Haag duality in the QFT reading | **PROVEN** under stated hypotheses | [12][15][16] |
    69	| Deligne's theorem | Supergroup representation category | Char-0 symmetric tensor category of subexponential growth | Hypotheses essential | **PROVEN** | [13] |
    70	| Stinespring dilation | Minimal dilation (unique up to unitary) | Completely positive map | Normal form; not an isomorphism classification of channels | **PROVEN** | [10][11] |
    71	| Classifying-space construction | Principal G-bundle from a map X → BG | Map to classifying space | Homotopy-classified; characteristic classes are pullbacks | **PROVEN** | [17][18] |
    72	| Supermap representability | Concrete representation of categorical supermaps | Theory with suitable channel–state duality (2024–2026) | Settings with channel–state duality; unification with Gelfand/Stone/Naimark **open** | **PROVEN** in stated settings | [40][41] |
    73	
    74	---
    75	
    76	## (d) Established equivalences and dualities
    77	
    78	**Standing warning (Etingof–Gelaki).** Tensor-category equivalence **without symmetric structure** provably fails to recover the group: non-isomorphic finite groups can carry equivalent plain tensor representation categories [12]. Any equivalence, duality, or classification in the series that forgets the monoidal/symmetric layer is **false** (DEF-018). The table marks this row **IMPOSSIBLE** as a recovery principle.
    79	
    80	| Equivalence / duality | Identifies | Preserves | Status | Sources |
    81	|---|---|---|---|---|
    82	| Tensor-cat equivalence without symmetric structure → group recovery | — | nothing usable | **IMPOSSIBLE** (Etingof–Gelaki isocategorical groups) | [12] |
    83	| DR equivalence: symmetric tensor *-cat ≃ Rep(compact supergroup) | Superselection data and compact supergroup | Symmetric tensor structure, conjugates, End(1)=C | **PROVEN** | [12][16] |
    84	| Deligne equivalence: subexponential char-0 symmetric tensor cats ≃ supergroup reps | Tensor category and supergroup representations | Symmetric structure, growth condition | **PROVEN** | [13] |
    85	| Gelfand duality | Commutative C*-algebras and compact Hausdorff spaces | Algebraic/topological structure | **PROVEN** | [43] |
    86	| Stone duality | Boolean algebras and zero-dimensional compact spectra | Boolean structure | **PROVEN** | [44] |
    87	| *-isomorphism of finite-dim C*-algebras | Dimension vectors and algebras | *-algebra structure | **PROVEN** | [9] |
    88	| Channel equivalence via minimal Stinespring dilation | CP maps and dilations | Complete positivity; unitary freedom | **PROVEN** (up to unitary) | [10] |
    89	| Müger's Galois theory for braided tensor categories | Fixed-point-net representation categories | Braided structure **plus extra "soliton" data** | **PROVEN**; extra data required | [21] |
    90	| Holographic duality (AdS/CFT) as applied to RT | Bulk geometry and boundary entanglement | — | **OPEN** — RT verified exactly only in AdS₃/2D CFT [45]; entanglement-wedge reconstruction is a **PROVEN** quantum-information theorem [46]; HaPPY codes are tensor-network toys, not AdS/CFT [48] | [45][46][48] |
    91	| Yoneda embedding Hom(−, P) | Objects and their relational profiles | Categorical structure | **PROVEN** mathematically; the Yoneda qualification binds: **"Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem."** | Founding Document §5 |
    92	
    93	---
    94	
    95	## (e) Open classification problems
    96	
    97	| Problem | Region | What is known | Status | Sources |
    98	|---|---|---|---|---|
    99	| Fusion categories | Family VIII | Every fusion category is Rep of a weak Hopf algebra (Ostrik); ENO pivotal-structure conjecture (Annals 162, 2005) | **OPEN** | [14] |
   100	| Elliott program (simple nuclear C*-algebras, UCT) | Family II | Active unfinished program | **OPEN** | [9] |
     1	[1] Classification of finite simple groups — https://en.wikipedia.org/wiki/Classification_of_finite_simple_groups (accessed 2026-10-29)
     2	[2] Solomon, "A brief history of the classification of the finite simple groups", Bull. AMS 38 (2001) 315–352 — https://www.ams.org/journals/bull/2001-38-03/S0273-0979-01-00909-0/ (published 2001-03-27, accessed 2026-10-29)
     3	[3] ATLAS of Finite Groups — https://en.wikipedia.org/wiki/ATLAS_of_Finite_Groups (accessed 2026-10-29)
     4	[4] Simple Lie group — https://en.wikipedia.org/wiki/Simple_Lie_group (accessed 2026-10-29)
     5	[5] Theorem of the highest weight — https://en.wikipedia.org/wiki/Theorem_of_the_highest_weight (accessed 2026-10-29)
     6	[6] Darboux's theorem — https://en.wikipedia.org/wiki/Darboux%27s_theorem (accessed 2026-10-29)
     7	[7] Poisson manifold (WikiJournal of Science 7(1):6, 2024) — https://en.wikipedia.org/wiki/Poisson_manifold (accessed 2026-10-29)
     8	[8] Von Neumann algebra — https://en.wikipedia.org/wiki/Von_Neumann_algebra (accessed 2026-10-29)
     9	[9] C*-algebra — https://en.wikipedia.org/wiki/C*-algebra (accessed 2026-10-29)
    10	[10] Stinespring dilation theorem — https://en.wikipedia.org/wiki/Stinespring_dilation_theorem (accessed 2026-10-29)
    11	[11] Quantum channel — https://en.wikipedia.org/wiki/Quantum_channel (accessed 2026-10-29)
    12	[12] Doplicher–Roberts reconstruction theorem (nLab) — https://ncatlab.org/nlab/show/Doplicher-Roberts+reconstruction+theorem (accessed 2026-10-29)
    13	[13] Deligne's theorem on tensor categories (nLab) — https://ncatlab.org/nlab/show/Deligne%27s+theorem+on+tensor_categories (accessed 2026-10-29)
    14	[14] Fusion category (nLab) — https://ncatlab.org/nlab/show/fusion+category (accessed 2026-10-29)
    15	[15] Haag–Kastler axioms (nLab) — https://ncatlab.org/nlab/show/Haag-Kastler+axioms (accessed 2026-10-29)
    16	[16] DHR superselection theory (nLab) — https://ncatlab.org/nlab/show/DHR+superselection+theory (accessed 2026-10-29)
    17	[17] Classifying space (nLab) — https://ncatlab.org/nlab/show/classifying+space (accessed 2026-10-29)
    18	[18] Characteristic class (nLab) — https://ncatlab.org/nlab/show/characteristic+class (accessed 2026-10-29)
    19	[19] Quantum anomaly (nLab) — https://ncatlab.org/nlab/show/quantum+anomaly (accessed 2026-10-29)
    20	[20] Casini–Magan, arXiv:2511.21810 — https://arxiv.org/abs/2511.21810 (published 2025-11-26, accessed 2026-10-29)
    21	[21] Müger, arXiv:math-ph/0008027 — http://export.arxiv.org/api/query?search_query=all:%22Doplicher-Roberts%22&start=0&max_results=15 (entry arXiv:math-ph/0008027; published 2000-08-21, accessed 2026-10-29)
    22	[22] Pinzari, arXiv:2502.06229 — https://arxiv.org/abs/2502.06229 (v8 2026-09-19, accessed 2026-10-29)
    23	[23] Clay Mathematics Institute, Yang–Mills problem page — https://www.claymath.org/millennium/yang-mills-the-maths-gap/ (accessed 2026-10-29)
    24	[24] OpenAI, "Building scientific understanding with academic communities" — https://openai.com/index/building-scientific-understanding-with-academic-communities/ (published 2026-10-26, accessed 2026-10-29)
    25	[25] KITP Yang–Mills working group statement — https://www.kitp.ucsb.edu/sites/default/files/YM_working_group.pdf (published 2026-10, accessed 2026-10-29)
    26	[26] Scientific American, "Dueling proofs from OpenAI and Anthropic astound scientists" — https://www.scientificamerican.com/article/dueling-proofs-from-openai-and-anthropic-astound-scientists/ (published 2026-10-27, accessed 2026-10-29)
    27	[27] Douglas, Nat. Rev. Phys. 8, 86–97 — https://www.nature.com/articles/s42254-025-00909-2 (published 2026-01-12, accessed 2026-10-29)
    28	[28] Faizal–Shabir, arXiv:2606.19362 — https://arxiv.org/abs/2606.19362 (published 2026-06-09, accessed 2026-10-29)
    29	[29] Jacobsen, arXiv:2506.00284 (withdrawn) — https://arxiv.org/abs/2506.00284 (published 2025-05-30, accessed 2026-10-29)
    30	[30] Nissim, arXiv:2510.22788 — https://arxiv.org/abs/2510.22788 (published 2025-10-26, accessed 2026-10-29)
    31	[31] Cao–Nissim–Sheffield, arXiv:2509.04688 — https://arxiv.org/abs/2509.04688 (published 2025-09-04, accessed 2026-10-29)
    32	[32] Faria da Veiga–O'Carroll, arXiv:2509.03513 — https://arxiv.org/abs/2509.03513 (published 2025-09-03, accessed 2026-10-29)
    33	[33] Nair, arXiv:2608.10133 — https://arxiv.org/abs/2608.10133 (published 2026-08-10, accessed 2026-10-29)
    34	[34] Baez–Dolan, arXiv:q-alg/9503002 — https://arxiv.org/abs/q-alg/9503002 (published 1995-03-05, accessed 2026-10-29)
    35	[35] Lurie, arXiv:0905.0465 — https://arxiv.org/abs/0905.0465 (published 2009-05-04, accessed 2026-10-29)

exec
/usr/local/bin/zsh -lc "sed -n '475,738p' website/app/globals.css; sed -n '850,1040p' website/app/globals.css; head -45 website/content/papers/vol-01-foundations.html; rg -n -i 'reviewer|review process|revision|verification|audit|pipeline|consistency report|research/|run-|artifact|agent' website/app website/content/periodic-table.md website/content/papers | head -65" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
  position: fixed;
  right: 1rem;
  bottom: 1rem;
  z-index: 40;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.45);
}

@media (min-width: 1024px) {
  .pdf-btn-fixed {
    display: none;
  }
}

.paper-abstract {
  border: 1px solid var(--border);
  border-left: 3px solid var(--accent);
  background: var(--surface);
  border-radius: 10px;
  padding: 1.15rem 1.25rem;
  margin: 1.5rem 0 2.25rem;
}

.paper-abstract h2 {
  font-size: 1.05rem;
  margin: 0 0 0.65rem;
  color: var(--accent-hover);
  font-family: var(--font-body);
  letter-spacing: 0.08em;
  text-transform: uppercase;
}

.paper-abstract p {
  margin: 0 0 0.75rem;
  color: var(--text-muted);
  font-size: 0.96rem;
}
.paper-abstract p:last-child {
  margin-bottom: 0;
}

/* ---------- paper content typography + math ---------- */

.paper-content {
  min-width: 0;
  max-width: 100%;
  overflow-wrap: break-word;
  word-break: normal;
  font-size: 1.02rem;
  color: var(--text);
}

.paper-content .katex-display {
  max-width: 100%;
}

.paper-content h1,
.paper-content h2,
.paper-content h3,
.paper-content h4 {
  max-width: 100%;
}

.paper-content h2 {
  font-size: clamp(1.35rem, 3.2vw, 1.85rem);
  margin: 2.75rem 0 1rem;
  padding-top: 0.5rem;
  border-top: 1px solid var(--border);
}

.paper-content h3 {
  font-size: clamp(1.12rem, 2.6vw, 1.38rem);
  margin: 2.1rem 0 0.85rem;
}

.paper-content h4 {
  font-size: 1.05rem;
  margin: 1.6rem 0 0.7rem;
  color: var(--text-muted);
}

.paper-content p {
  margin: 0 0 1.05rem;
}

.paper-content ul,
.paper-content ol {
  margin: 0 0 1.15rem;
  padding-left: 1.4rem;
}

.paper-content li {
  margin-bottom: 0.45rem;
}

.paper-content blockquote {
  margin: 1.25rem 0;
  padding: 0.15rem 0 0.15rem 1.1rem;
  border-left: 3px solid var(--border);
  color: var(--text-muted);
}

.paper-content code {
  font-family: ui-monospace, 'SFMono-Regular', Menlo, monospace;
  font-size: 0.88em;
  background: var(--code-bg);
  border: 1px solid var(--border);
  border-radius: 4px;
  padding: 0.08em 0.35em;
}

.paper-content pre {
  background: var(--code-bg);
  border: 1px solid var(--border);
  border-radius: 8px;
  padding: 0.95rem 1.05rem;
  overflow-x: auto;
  max-width: 100%;
  margin: 0 0 1.25rem;
}

.paper-content pre code {
  background: none;
  border: none;
  padding: 0;
  font-size: 0.82rem;
  line-height: 1.55;
}

/* theorem-style blocks */
.paper-content .definition,
.paper-content .theorem,
.paper-content .proposition,
.paper-content .lemma,
.paper-content .corollary,
.paper-content .conjecture,
.paper-content .example,
.paper-content .remark,
.paper-content .proof {
  border: 1px solid var(--border);
  border-radius: 10px;
  padding: 1rem 1.15rem;
  margin: 1.35rem 0;
  background: rgba(14, 20, 40, 0.55);
}

.paper-content .definition {
  border-left: 3px solid var(--accent);
}
.paper-content .theorem,
.paper-content .proposition {
  border-left: 3px solid var(--accent-secondary);
}
.paper-content .lemma,
.paper-content .corollary {
  border-left: 3px solid #7dd3fc;
}
.paper-content .conjecture {
  border-left: 3px solid var(--warning);
}
.paper-content .remark,
.paper-content .example {
  border-left: 3px solid var(--border);
}
.paper-content .proof {
  background: transparent;
  border-style: dashed;
}

.paper-content .definition p,
.paper-content .theorem p,
.paper-content .proposition p,
.paper-content .lemma p,
.paper-content .corollary p,
.paper-content .conjecture p {
  margin-bottom: 0.65rem;
}
.paper-content .definition p:last-child,
.paper-content .theorem p:last-child,
.paper-content .proposition p:last-child {
  margin-bottom: 0;
}

/* tables */
.paper-content table {
  display: block;
  width: 100%;
  max-width: 100%;
  overflow-x: auto;
  border-collapse: collapse;
  margin: 1.5rem 0;
  font-size: 0.86rem;
}

.paper-content caption {
  caption-side: top;
  text-align: left;
  color: var(--text-muted);
  font-size: 0.85rem;
  padding: 0 0 0.65rem;
  line-height: 1.5;
}

.paper-content caption .tbl-num {
  color: var(--accent-secondary);
  font-weight: 600;
  margin-right: 0.35rem;
}

.paper-content th,
.paper-content td {
  border: 1px solid var(--border);
  padding: 0.55rem 0.75rem;
  text-align: left;
  vertical-align: top;
  min-width: 5.5rem;
}

.paper-content th {
  background: var(--surface-hover);
  color: var(--text);
  font-weight: 600;
}

.paper-content tr:nth-child(even) td {
  background: rgba(14, 20, 40, 0.4);
}

/* math — inline stays inline; display blocks scroll horizontally */
.paper-content .math-display-rendered,
.paper-content .math.display {
  display: block;
  overflow-x: auto;
  overflow-y: hidden;
  max-width: 100%;
  padding: 0.35rem 0;
}

.paper-content .math-inline-rendered,
.paper-content .math.inline {
  display: inline;
  max-width: 100%;
}

.paper-content .katex-display {
  margin: 0.55rem 0;
  overflow-x: auto;
  overflow-y: hidden;
}

.paper-content .katex {
  font-size: 1.06em;
}

.paper-content .math-display-rendered .katex-display > .katex {
  text-align: left;
}

.paper-content .katex-error {
  color: var(--warning);
  font-family: ui-monospace, monospace;
  font-size: 0.85em;
}

/* inline citations + bibliography */
@media (min-width: 640px) {
  .paper-nav {
    grid-template-columns: 1fr 1fr;
  }
}

.paper-nav .nav-link {
  display: block;
  border: 1px solid var(--border);
  border-radius: 10px;
  padding: 1rem 1.15rem;
  color: var(--text);
  transition: border-color 0.18s ease;
}

.paper-nav .nav-link:hover {
  border-color: var(--accent);
  color: var(--text);
}

.paper-nav .dir {
  color: var(--text-dim);
  font-size: 0.75rem;
  letter-spacing: 0.16em;
  text-transform: uppercase;
  margin-bottom: 0.35rem;
}

.paper-nav .nav-title {
  font-family: var(--font-heading);
  font-size: 1rem;
}

.paper-nav .next {
  text-align: left;
}

@media (min-width: 640px) {
  .paper-nav .next {
    text-align: right;
  }
}

/* ---------- periodic table page ---------- */

.md-content {
  min-width: 0;
  overflow-wrap: break-word;
  font-size: 0.97rem;
}

.md-content h2 {
  font-size: clamp(1.35rem, 3vw, 1.8rem);
  margin: 2.75rem 0 1rem;
  padding-top: 0.5rem;
  border-top: 1px solid var(--border);
}

.md-content h3 {
  font-size: clamp(1.1rem, 2.4vw, 1.35rem);
  margin: 2.1rem 0 0.85rem;
}

.md-content p {
  margin: 0 0 1.05rem;
  color: var(--text-muted);
}

.md-content strong {
  color: var(--text);
}

.md-content table {
  display: block;
  width: 100%;
  max-width: 100%;
  overflow-x: auto;
  border-collapse: collapse;
  margin: 1.35rem 0;
  font-size: 0.82rem;
}

.md-content th,
.md-content td {
  border: 1px solid var(--border);
  padding: 0.55rem 0.75rem;
  text-align: left;
  vertical-align: top;
  min-width: 5.5rem;
}

.md-content th {
  background: var(--surface-hover);
  color: var(--text);
}

.md-content tr:nth-child(even) td {
  background: rgba(14, 20, 40, 0.4);
}

.md-content hr {
  border: none;
  border-top: 1px solid var(--border);
  margin: 2.25rem 0;
}

.status-proven { color: var(--success); font-weight: 600; }
.status-claimed { color: var(--warning); font-weight: 600; }
.status-open { color: var(--accent); font-weight: 600; }
.status-impossible { color: #f87171; font-weight: 600; }

/* ---------- footer ---------- */

.site-footer {
  border-top: 1px solid var(--border);
  margin-top: 2rem;
  background: rgba(14, 20, 40, 0.4);
}

.site-footer-inner {
  max-width: 1120px;
  margin: 0 auto;
  padding: 2.25rem 1rem;
  display: grid;
  gap: 1.25rem;
  color: var(--text-dim);
  font-size: 0.85rem;
}

@media (min-width: 768px) {
  .site-footer-inner {
    grid-template-columns: 2fr 1fr 1fr;
    padding: 2.75rem 1.5rem;
  }
}

.site-footer h3 {
  font-family: var(--font-body);
  font-size: 0.78rem;
  letter-spacing: 0.18em;
  text-transform: uppercase;
  color: var(--text-muted);
  margin: 0 0 0.65rem;
}

.site-footer p {
  margin: 0 0 0.55rem;
  max-width: 42em;
}

.site-footer a {
  color: var(--text-muted);
}
.site-footer a:hover {
  color: var(--accent-hover);
}

.site-footer ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

.site-footer li {
  margin-bottom: 0.45rem;
}
<section class="paper-abstract" id="abstract"><h2>Abstract</h2>
The classification of mathematical representations of physical systems is a structural problem before it is a physical one, and this paper establishes the foundations that the problem requires. A representation is recorded as a five-part tuple of state space, observables, dynamics, symmetries, and composition rules. Morphisms are admitted in five named kinds, each with an explicit preservation law, and admissibility is fixed by six stated conditions that single out admissible records and admissible class specifications. Several results give the framework content. An explicit counterexample shows that the composite of an embedding and a coarse-graining satisfies no listed preservation law: the five morphism kinds are closed under self-composition and not across kinds, and the vocabulary resolves into kind-relative categories. Three restricted classes are then classified in full: finite classical systems under disjoint union are classified by cardinality with one-point systems as the unique irreducibles, finite dynamical systems decompose uniquely into connected components, and finite symmetric systems are classified by orbit type. Irreducibility is characterized relative to the composition rule; a two-qubit example identifies the additional factorization data that decomposition requires. The structural classification conjecture is stated with its five proof obligations as the theorem targets of the program. All results are stated relative to the admissibility axioms and the preservation laws fixed in the paper, in the standard axiom-relative form.
</section>
<h2 id="introduction">Introduction</h2>
<p>Classifying the mathematical representations of physical systems is a structural question. It asks which representations exist, which of them describe the same system, and which are assembled from simpler ones. The Classification of Finite Simple Groups shows how much a completed structural classification can deliver and how much it can withhold. The classification is complete, every finite simple group belongs to a named family or is a sporadic group, and no uniform parameterization analogous to Dynkin diagrams is known <a class="citation" href="#bib-gorenstein1982">[1]</a>, <a class="citation" href="#bib-solomon2001">[2]</a>. Practical identification runs through companion data of the ATLAS kind, order, Schur multiplier, outer automorphism group, presentations, and character tables with power maps <a class="citation" href="#bib-atlas-book">[3]</a>. A completed classification and a usable parameterization are separate achievements.</p>
<p>Three notions must be kept apart from the start. A <em>classification</em> is an exhaustive list of objects up to a stated equivalence. A <em>parameterization</em> is a uniform finite or continuous datum whose value identifies the object. A <em>recognition procedure</em> is an algorithm that decides identity from recorded invariants. The finite simple groups deliver the first, partially the third, and not the second. Complex semisimple Lie algebras deliver all three, since Dynkin diagrams parameterize them <a class="citation" href="#bib-humphreys1972">[4]</a>. A foundation for a classification program of physical systems has to state which of the three it pursues.</p>
<p>The foundations needed here are definitional. Before a classification theorem can be stated, the program needs a mathematical notion of a physical system, a notion of morphism, a notion of equivalence, and a condition that separates admissible records from arbitrary ones. The difficulty is that no universally accepted mathematical definition of every possible physical system exists. This paper does not remove that difficulty. It makes the difficulty explicit and workable: it fixes a record schema, a morphism vocabulary with preservation laws, an equivalence discipline, and a list of admissibility conditions, and it proves results about that framework rather than about any physical theory.</p>
<p>This paper contributes a five-component record for a representation with each component given a precise mathematical role, carried by worked classes of records that support every later construction. Preservation laws for the five named morphism kinds come with a proof that the kinds do not compose across kinds (Proposition <a href="#prop:composition-not-typed" data-reference-type="ref" data-reference="prop:composition-not-typed">12</a>), so the morphism vocabulary is a schema with kind-relative categories rather than a single one, and with a proof that each kind is closed under self-composition (Proposition <a href="#prop:self-composition" data-reference-type="ref" data-reference="prop:self-composition">14</a>). Four conditions single out admissible records, two further conditions single out admissible class specifications, and under a closed morphism kind the admissible records form a category (Propositions <a href="#prop:schema-category" data-reference-type="ref" data-reference="prop:schema-category">24</a> and <a href="#prop:conditional" data-reference-type="ref" data-reference="prop:conditional">25</a>). Three restricted classes receive complete classification (Theorems <a href="#thm:finite-state-classification" data-reference-type="ref" data-reference="thm:finite-state-classification">32</a>, <a href="#thm:dynamical-decomposition" data-reference-type="ref" data-reference="thm:dynamical-decomposition">33</a>, and <a href="#thm:symmetric-classification" data-reference-type="ref" data-reference="thm:symmetric-classification">35</a>), and an explicit two-qubit computation shows that decomposition needs factorization data beyond the record (Proposition <a href="#prop:factorization-nonunique" data-reference-type="ref" data-reference="prop:factorization-nonunique">31</a>). The structural classification conjecture is stated with its five proof obligations, and a claim-status discipline keeps announced results, complete proofs, and machine-checked statements apart.</p>
<p>The scope of the program follows a founding distinction. Classifying mathematical representations of physical systems is a mathematical problem that can be formalized at once. Classifying physical systems themselves additionally requires a justified notion of physical equivalence and an empirical interpretation. This paper works entirely on the first side of that line. It also adopts the program’s three levels of mathematical achievement, mathematical formulation, rigorous theorem, and physical validation, and it places its own results on the first two. Nothing in this paper reaches physical validation.</p>
<h2 id="sec:problem">The classification problem</h2>
<p>Completed classifications in mathematics fall into regimes, and the regimes determine what a classification program for physics can promise. Table <a href="#tab:regimes" class="reflink">1</a> collects representative cases on which the program relies as background. The rows are established mathematics, cited here as registered background; no theorem of this paper depends on them, and the comparison with finite simple groups is the only one of them that shapes the constructions below.</p>
<table class="paper-table" id="tab:regimes">
<caption><span class="tbl-num">Table 1.</span> Regimes of completed classification. Each row records what is classified, the identifying invariant data, and the kind of achievement the result represents.</caption>
<tr><th>Domain</th><th>What is classified</th><th>Identifying data</th><th>Achievement</th></tr>
<tr><td>Finite simple groups</td><td>Simple groups up to isomorphism</td><td>Family name or sporadic name</td><td>Complete, unparameterized <a class="citation" href="#bib-gorenstein1982">[1]</a>, <a class="citation" href="#bib-solomon2001">[2]</a></td></tr>
<tr><td>Complex semisimple Lie algebras</td><td>Algebras up to isomorphism</td><td>Dynkin diagram</td><td>Complete and parameterized <a class="citation" href="#bib-humphreys1972">[4]</a></td></tr>
<tr><td>Finite-dimensional <span class="math inline">\(C^*\)</span>-algebras</td><td>Unital algebras up to *-isomorphism</td><td>Dimension vector of matrix blocks <a class="citation" href="#bib-dixmier1977">[5]</a></td><td>Complete and parameterized</td></tr>
<tr><td>Amenable factors</td><td>Hyperfinite factors of all types</td><td>Murray-von Neumann type and Connes invariants <a class="citation" href="#bib-connes1976">[6]</a></td><td>Complete in the amenable class</td></tr>
<tr><td>General type II<span class="math inline">\(_1\)</span> factors</td><td>Nothing beyond coarse strata</td><td>No countable invariant set</td><td>Impossible by theorem <a class="citation" href="#bib-mcduff1969">[7]</a></td></tr>
<tr><td>Principal <span class="math inline">\(G\)</span>-bundles</td><td>Bundles over a paracompact base up to bundle isomorphism</td><td>Homotopy classes of maps into the classifying space <a class="citation" href="#bib-milnor1956">[8]</a></td><td>Complete</td></tr>
<tr><td>Closed 3-manifolds</td><td>Manifolds up to homeomorphism</td><td>Decomposition into geometric pieces</td><td>Complete by geometrization <a class="citation" href="#bib-scott1983">[9]</a></td></tr>
<tr><td>4-manifolds</td><td>Restricted classes only</td><td>No general invariant set</td><td>Partly unrecognizable <a class="citation" href="#bib-tancer">[10]</a></td></tr>
</table>
<p>Classification is sharp exactly where the identifying invariant is finite or parametric. Classification content can be entirely global, since Darboux’s theorem removes all local invariants from symplectic geometry, so the classifying data of a classical system has to be topological <a class="citation" href="#bib-arnold1978">[11]</a>. Non-classifiability is itself a theorem rather than a difficulty, as the impossibility of classifying general type II<span class="math inline">\(_1\)</span> factors <a class="citation" href="#bib-mcduff1969">[7]</a>, the undecidability of Markov properties of finitely presented groups <a class="citation" href="#bib-rabin1958">[12]</a>, the wildness of large representation categories <a class="citation" href="#bib-buchweitz-leuschke">[13]</a>, and the unrecognizability of certain four-manifolds <a class="citation" href="#bib-tancer">[10]</a> all show.</p>
<p>Reconstruction is better developed than classification. Gelfand duality reconstructs compact Hausdorff spaces from commutative <span class="math inline">\(C^*\)</span>-algebras, and the Gelfand-Naimark theorem embeds every <span class="math inline">\(C^*\)</span>-algebra into an algebra of operators <a class="citation" href="#bib-gelfand-naimark1943">[14]</a>. Stone duality reconstructs spectra from Boolean algebras <a class="citation" href="#bib-stone1936">[15]</a>. The Doplicher-Roberts theorem reconstructs a compact supergroup from symmetric tensor categories under explicit hypotheses <a class="citation" href="#bib-doplicher-roberts">[16]</a>, and Deligne’s theorem identifies characteristic-zero symmetric tensor categories of subexponential growth as supergroup representation categories <a class="citation" href="#bib-deligne2002">[17]</a>. These are results about recovering objects from probes, and they are proof templates for the series. They are not classification theorems, and they do not make classification unnecessary.</p>
<p>Classification and reconstruction both rest on explicit mathematical primitives. Classification demands an object class, an equivalence relation, and a composable morphism vocabulary; reconstruction demands structured probes and preservation laws. This paper fixes those primitives and proves results about them, and it separates the representation of a system from any empirical realization of it.</p>
<p>This paper depends on no theorem of the series and on no classification theorem beyond the architectural comparison with finite simple groups. The classification theorems of Table <a href="#tab:regimes" class="reflink">1</a> are registered background, and the conjecture below enters later work as a declared hypothesis. This paper asserts no universal classification; that statement is the conjecture’s subject. These rules make the definitions reusable: a definitional root that smuggled in results would make every dependent statement rest on them.</p>
<h2 id="sec:framework">Mathematical framework</h2>
<p>A representation of a physical system is a piece of mathematical data, and the schema below records that data in five components. The schema is a stipulation. It is proposed as a working definition, it is the definitional root of the series, and it is not claimed to capture every system anyone would call physical.</p>
<div id="def:record" class="definition">
<p><strong>Definition 1</strong> (System record).  A system record is a tuple <span class="math display">\[P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})\]</span> with the following components. The component <span class="math inline">\(X\)</span> is the state space or geometric structure of <span class="math inline">\(P\)</span>. The component <span class="math inline">\(\mathcal{O}\)</span> is the algebra or collection of observables of <span class="math inline">\(P\)</span>. The component <span class="math inline">\(\mathcal{D}\)</span> holds the evolution laws of <span class="math inline">\(P\)</span>, given as Hamiltonian or vector-field data, an operator semigroup, a flow, or an evolution functor. The component <span class="math inline">\(\mathcal{S}\)</span> holds the symmetry and constraint data of <span class="math inline">\(P\)</span>, the group or groupoid actions, gauge constraints, and constraint surfaces. The component <span class="math inline">\(\mathcal{C}\)</span> declares how <span class="math inline">\(P\)</span> is to be combined with other systems, through tensor products, coupling terms, or interfacing rules.</p>
</div>
<p>Each component is a mathematical object of some ambient category, and the schema does not fix which. The state space may be a set, a symplectic or smooth manifold, a Hilbert space, or a lattice configuration. The observables may be real functions on a state space, a <span class="math inline">\(C^*\)</span>-algebra, a von Neumann algebra, or a sheaf of observable collections. The composition component is the load-bearing one for the later sections: it fixes what counts as a decomposition, so irreducibility is always relative to <span class="math inline">\(\mathcal{C}\)</span>. The five components need not be independent, and the record is a candidate definition rather than a theorem. Table <a href="#tab:notation" class="reflink">2</a> fixes the notation of the paper.</p>
<p>The composition component needs a typing statement, since composition is an operation on several systems at once. The component <span class="math inline">\(\mathcal{C}\)</span> of a record is a declaration: it names the construction under which the record is to be combined with other records of its class. The construction itself is class-level data, a binary operation on records with the induced transport on the remaining components. Two records combine exactly when they declare the same construction, and the result of the combination is a record of the same class. In the restricted classes below the declaration is the choice of disjoint union or of product, and the operation acts on state spaces with the induced maps on observables, dynamics, and symmetry data.</p>
<table class="paper-table" id="tab:notation">
<caption><span class="tbl-num">Table 2.</span> Notation of the paper. Each symbol names one piece of the record schema or one relation on records.</caption>
<tr><th>Symbol</th><th>Meaning</th></tr>
<tr><td><span class="math inline">\(P\)</span></td><td>A system record of Definition <a href="#def:record" data-reference-type="ref" data-reference="def:record">1</a>: a tuple of state space <span class="math inline">\(X\)</span>, observables <span class="math inline">\(\mathcal{O}\)</span>, dynamics <span class="math inline">\(\mathcal{D}\)</span>, symmetries <span class="math inline">\(\mathcal{S}\)</span>, and composition data <span class="math inline">\(\mathcal{C}\)</span></td></tr>
<tr><td><span class="math inline">\(\mathrm{Phys}_{\mathrm{fin}}\)</span></td><td>The finite classical records of Definition <a href="#def:finite-classical" data-reference-type="ref" data-reference="def:finite-classical">6</a></td></tr>
<tr><td><span class="math inline">\(\mathrm{Phys}_{\mathrm{dyn}}\)</span></td><td>The finite dynamical records of Definition <a href="#def:finite-dynamical" data-reference-type="ref" data-reference="def:finite-dynamical">7</a></td></tr>
<tr><td><span class="math inline">\(\mathrm{Phys}_{\mathrm{qub}}\)</span></td><td>The bipartite qubit records of Definition <a href="#def:qubit" data-reference-type="ref" data-reference="def:qubit">8</a></td></tr>
<tr><td><span class="math inline">\(\mathrm{Phys}_{\mathrm{adm}}\)</span></td><td>The admissible subcategory of Definition <a href="#def:phys-adm" data-reference-type="ref" data-reference="def:phys-adm">23</a></td></tr>
<tr><td><span class="math inline">\(\cong\)</span></td><td>Mathematical equivalence of records, Definition <a href="#def:math-equiv" data-reference-type="ref" data-reference="def:math-equiv">15</a></td></tr>
<tr><td><span class="math inline">\(\simeq\)</span></td><td>The declared physical equivalence, Definition <a href="#def:phys-equiv" data-reference-type="ref" data-reference="def:phys-equiv">16</a></td></tr>
<tr><td><span class="math inline">\(\mathfrak{J}_{\mathcal{C}}\)</span></td><td>The class of records irreducible relative to <span class="math inline">\(\mathcal{C}\)</span></td></tr>
website/content/periodic-table.md:12:| **CLAIMED** | An announced result whose supporting artifacts are not publicly checkable. |
website/content/periodic-table.md:16:Citation convention: bracketed numbers resolve to the Sources list of `research/cmrps-research-map/REPORT.md`. Inferences are marked *conjectural* or *open*.
website/content/periodic-table.md:105:| 4D YM/QCD existence | Family VII/QFT | Existence claimed 2026-10-26 (QCD, GUT completion, pure YM subproblem, Balaban-based); 1147-page manuscript unpublished; claimed Lean formalization withheld; KITP verification pending | **CLAIMED** — never conflated with mass gap | [24][25][26] |
website/content/papers/vol-01-foundations.html:190:<p>Each condition excludes a concrete pathology, and the list can be tested record by record. A tuple with a component named but not defined fails AC-1. An observable collection such as the two point masses on a two-point state space fails AC-2. A Hamiltonian vector field defined only on an open subset of the state space fails AC-3. A symmetry action that moves an observable outside the observable collection fails AC-4. A composition rule that produces records with undefined components on some inputs, with no declared domain, fails AC-5. A class of records with no declared equivalence relation fails AC-6. The conditions are strong enough to rule these out and weak enough to admit the restricted classes of Section <a href="#sec:restricted" data-reference-type="ref" data-reference="sec:restricted">8</a>, and that pairing is the design criterion for any revision of the list.</p>
website/content/papers/vol-01-foundations.html:315:<p>Nothing in the program is machine-checked at the time of writing: no formalization of any record has been accepted by a clean kernel-checked build, and a formalization that is announced but withheld does not qualify for the first label. The record of the announced existence result in constructive quantum field theory reads “existence claimed; manuscript and formalization withheld; verification pending” <a class="citation" href="#bib-openai-claim">[21]</a>, <a class="citation" href="#bib-kitp">[22]</a>, and an existence result and a mass-gap result are separate claims, the Yang-Mills mass gap remaining an open problem <a class="citation" href="#bib-clay">[23]</a>.</p>
website/content/papers/vol-01-foundations.html:323:<p>A revision of the framework has a clear path. The preservation laws need completion in three directions: the inter-kind composition rule of Corollary <a href="#cor:schema-not-category" data-reference-type="ref" data-reference="cor:schema-not-category">13</a>, the algebraic form of the laws for quantum and gauge records, and the status of dualities as equivalences between record presentations. The admissibility list needs testing against records the paper does not treat, in particular gauge records with constraints and lattice records with a continuum limit. The equivalence relation takes a positive criterion beyond the negative constraint of Definition <a href="#def:preserved-structure" data-reference-type="ref" data-reference="def:preserved-structure">17</a>. Each of these is a stated task with a stated failure mode.</p>
website/content/papers/vol-01-foundations.html:358:<caption><span class="tbl-num">Table 7.</span> Code evidence for the computational claims of the paper. Each row names the claim, the artifact that carries the computation, and the check performed.</caption>
website/content/papers/vol-01-foundations.html:359:<tr><th>Claim</th><th>Artifact</th><th>Check</th></tr>
website/content/papers/vol-12-principia-physica.html:2:This paper assembles the registered results of the Classification of Mathematical Representations of Physical Systems into the three-layer architecture of Principia Physica: mathematical classification, physical realization, and empirical selection. The assembly keeps the three layers apart and separates proved statements from conjectural ones. Twenty background classification theorems and seven obstruction theorems are organized into seven classification regimes; a finite case analysis of the twenty-eight domains of the program comparison spine, with one boundary case, shows that fifteen carry a classification theorem with a finite or explicitly parameterized invariant, one is complete but unparameterized, one is a complete obstruction classification, seven remain open or claimed, three are impossible in the stated generality, one is undecidable, and one is decidable but unclassified. Eight reconstruction theorems recover objects from probes, each under hypotheses that cannot be dropped. The empirical layer admits no unique monotone metric in the quantum case, and no record validates the physical layer: the announced four-dimensional existence result carries the status existence claimed; manuscript and formalization withheld; verification pending, and the mass gap problem remains open. The structural classification statement enters only as a declared hypothesis, and a conditional reduction records what its five proof obligations would deliver. No record in the series carries a completed computer-checked proof.
website/content/papers/vol-12-principia-physica.html:324:<td style="text-align: left;">Announced, manuscript unpublished, formalization withheld, verification pending</td>
website/content/papers/vol-12-principia-physica.html:348:<p>None of the registered claim entries resolves the four-dimensional Yang-Mills Millennium problem, which requires proving both existence of the quantum field theory and a strictly positive mass gap <a class="citation" href="#bib-corpus-23">[23]</a>. The announced existence work explicitly omits the mass gap, lacks public artifacts, and awaits independent verification <a class="citation" href="#bib-corpus-24">[24]</a>, <a class="citation" href="#bib-corpus-25">[25]</a>, <a class="citation" href="#bib-corpus-26">[26]</a>; it carries the status existence claimed; manuscript and formalization withheld; verification pending. The remaining entries restrict their scope to lattice approximations without establishing the continuum limit <a class="citation" href="#bib-corpus-30">[30]</a>, <a class="citation" href="#bib-corpus-31">[31]</a>, <a class="citation" href="#bib-corpus-32">[32]</a>, confine their arguments to three dimensions <a class="citation" href="#bib-corpus-33">[33]</a>, or remain unverified or retracted <a class="citation" href="#bib-corpus-28">[28]</a>, <a class="citation" href="#bib-corpus-29">[29]</a>. The Clay problem page lists the problem as unsolved <a class="citation" href="#bib-corpus-23">[23]</a>. Because constructive field theory currently lacks a demonstrated continuum mass gap, the realization layer for four-dimensional non-Abelian gauge theory remains open.</p>
website/content/papers/vol-12-principia-physica.html:349:<p>A pre-claim baseline makes the ladder vivid. The 2026 survey of rigorous approaches to quantum field theory records that rigorous renormalization has never been made rigorous in the needed generality and that on the mass gap no clear path is known <a class="citation" href="#bib-corpus-27">[27]</a>. The October 2026 existence announcement postdates that survey, contradicts its existence-side assessment, and confirms its mass-gap-side assessment <a class="citation" href="#bib-corpus-24">[24]</a>. Independent verification before a standing committee is the step that would move the claim up the ladder <a class="citation" href="#bib-corpus-25">[25]</a>.</p>
website/content/papers/vol-12-principia-physica.html:428:<p>At the realization layer, the reconstruction of an interacting four-dimensional quantum field theory from such data is claimed rather than established. The announced existence result carries the status existence claimed; manuscript and formalization withheld; verification pending <a class="citation" href="#bib-corpus-24">[24]</a>, <a class="citation" href="#bib-corpus-25">[25]</a>. At the empirical layer, the mass gap remains open <a class="citation" href="#bib-corpus-23">[23]</a>, lattice theorems hold only in restricted regimes <a class="citation" href="#bib-corpus-30">[30]</a>, <a class="citation" href="#bib-corpus-31">[31]</a>, <a class="citation" href="#bib-corpus-32">[32]</a>, and no entry of <a href="#tab:claims" class="reflink">5</a> closes the continuum limit. The example therefore shows the three layers in three different states: proved at <span class="math inline">\(\mathcal{M}\)</span>, claimed at <span class="math inline">\(\mathcal{R}\)</span>, open at <span class="math inline">\(\mathcal{E}\)</span>.</p>
website/content/papers/vol-12-principia-physica.html:465:<td style="text-align: left;">A verification layer for the registered proofs</td>
website/content/papers/vol-12-principia-physica.html:477:<p>The seventh deliverable is verification. No proof in the series has been checked by a proof-assistant kernel. The executable taxonomy code in the source directory is computational evidence: it is validated against stated specifications and has not been checked by a kernel. The verification directory records ten mechanization targets matching the definitions and theorems above. Mechanization is future work.</p>
website/content/papers/vol-12-principia-physica.html:480:<p>Four limitations bound this synthesis. The assembly inherits the statuses of the program registry, and any status revision propagates. Three entries rest on single sources and were not independently re-verified here: the extra <span class="math inline">\(Z_2\)</span> sector of higher-form DHR theory <a class="citation" href="#bib-corpus-20">[20]</a>, the journal-published mass-gap claim <a class="citation" href="#bib-corpus-28">[28]</a>, and the Borel-reducibility obstruction announced at the survey level <a class="citation" href="#bib-corpus-59">[55]</a>. The literature survey behind the registry ran on the arXiv API plus known-URL fetches, so non-arXiv venues may be under-covered, and absence of a citation here is not evidence of absence. The regime taxonomy organizes the registered domains and proves a coverage statement about them; it does not classify all of mathematics.</p>
website/content/papers/vol-12-principia-physica.html:484:<p>What remains uncertain is equally sharp. The admissibility conditions are unfixed. The physical equivalence is unchosen. The realization and selection maps are stipulated and not constructed. The announced four-dimensional existence result carries the status existence claimed; manuscript and formalization withheld; verification pending, and the mass gap is open. No record carries a completed computer-checked proof. The central test of the realization layer, reconstruction of interacting dynamics and spacetime without presupposing spacetime, is unanswered.</p>
website/content/papers/vol-12-principia-physica.html:487:<p>The computational artifacts of this volume record the bookkeeping claims of the assembly and the finite-dimensional example of <a href="#sec:examples" data-reference-type="ref+label" data-reference="sec:examples">9</a>. The two files perform automated registry auditing and bookkeeping and exercise the worked example; they verify no mathematics. Both files accompany this paper in the CMRPS project repository at <a href="https://github.com/YonedaAI/cmrps" class="uri">https://github.com/YonedaAI/cmrps</a>, under <code>src/vol-12-principia-physica</code>. <a href="#tab:code" class="reflink">8</a> maps each computational claim to the file and function that exercises it.</p>
website/content/papers/vol-12-principia-physica.html:501:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-12-principia-physica.html:506:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-12-principia-physica.html:511:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-12-principia-physica.html:516:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-03-irreducibility-decomposition.html:306:<p>Three computational artifacts accompany this paper. They are evidence about the combinatorics of the theorems above; no statement in this volume is established by them.</p>
website/content/papers/vol-03-irreducibility-decomposition.html:307:<p>The first artifact is an executable taxonomy layer in Haskell. Its module declares instances of the shared family, construction, and decomposition classes for the systems treated here: matrix blocks and their direct sums, tensor products of blocks, and Kraus normal form data. Multiplicity matrices appear as data types mirroring <a href="#def:multiplicity-matrix" data-reference-type="ref+label" data-reference="def:multiplicity-matrix">19</a>. The names mirror the definitions of this paper and the mechanization targets listed with this paper. The Haskell layer is computational evidence, validated against kernel-checked specifications through cross-audit, and it is not verified by any proof assistant.</p>
website/content/papers/vol-03-irreducibility-decomposition.html:308:<p>The second artifact is a set of enumeration experiments in Python. One experiment enumerates dimension vectors of the closure of <span class="math inline">\(\{\mathbb{C}, M_2(\mathbb{C})\}\)</span> under direct sum and tensor product up to total dimension <span class="math inline">\(64\)</span> and checks the arithmetic of <a href="#prop:construction-arithmetic" data-reference-type="ref+label" data-reference="prop:construction-arithmetic">37</a>. It returns <span class="math inline">\(1085\)</span> dimension vectors, all of whose entries lie in the multiplicative semigroup <span class="math inline">\(\{1, 2, 4, 8, 16, 32, 64\}\)</span> generated by <span class="math inline">\(1\)</span> and <span class="math inline">\(2\)</span>, and it confirms that <span class="math inline">\(M_3(\mathbb{C})\)</span> lies outside the closure. A second experiment enumerates multiplicity matrices for the three block pairs of <a href="#tab:homs" class="reflink">1</a> and returns exactly <span class="math inline">\(2\)</span>, <span class="math inline">\(1\)</span>, and <span class="math inline">\(6\)</span> solutions, matching the conjugacy-class counts of the table entry by entry. A third computes Choi ranks of completely positive maps: for a random map of minimal rank <span class="math inline">\(1\)</span>, presented Kraus families of sizes <span class="math inline">\(1\)</span>, <span class="math inline">\(2\)</span>, <span class="math inline">\(3\)</span>, <span class="math inline">\(5\)</span>, and <span class="math inline">\(8\)</span> all return Choi rank <span class="math inline">\(1\)</span> and reproduce the same map, while the identity channel and conjugation by the Pauli <span class="math inline">\(Z\)</span> operator both have rank <span class="math inline">\(1\)</span> and differ on the Pauli <span class="math inline">\(X\)</span> operator. The experiments run in seconds on ordinary hardware and record their seeds in the source.</p>
website/content/papers/vol-03-irreducibility-decomposition.html:309:<p>The third artifact is a code evidence table, given in the appendix, that maps each computational claim to the file and function that exhibits it.</p>
website/content/papers/synthesis.html:2:This paper states the structural picture formed by the twelve parts of the Classification of Mathematical Representations of Physical Systems, a program asking whether mathematical representations of physical systems admit a structural classification analogous to the Classification of Finite Simple Groups. One ontology of forty-two definitions, one dependency graph, and one equivalence discipline run through the series. Three kinds of result organize its classification content. Complete invariants appear wherever the invariant is finite or explicitly parameterized: dimension vectors for finite-dimensional <span class="math inline">\(C^*\)</span>-algebras, Dynkin and Satake diagrams for semisimple Lie theory, classifying spaces for principal bundles, and the Murray-von Neumann and Connes data for amenable factors. Reconstruction theorems recover objects from probes under hypotheses that cannot be dropped. Seven obstruction theorems bound the scope of any classification, from uncountably many type <span class="math inline">\(\mathrm{II}_1\)</span> factors to algorithmic unrecognizability in dimension four. Every equivalence in the series declares the structure it preserves, and equivalences that forget the symmetric layer fail in a proved counterexample. The structural classification conjecture is stated as the program’s theorem target with its five proof obligations. The cross-volume consistency report records that the twelve parts share definitions, dependency discipline, and claim vocabulary without conflict.
website/content/papers/synthesis.html:150:<p>A result has been announced and its supporting artifacts are not publicly checkable. The four-dimensional existence announcement lives here.</p>
website/content/papers/synthesis.html:236:<p>An asymmetry separates reconstruction from classification. Reconstruction theorems recur across the series, each recovering an object from probes, and each under hypotheses that cannot be dropped. Complete classifications recur much less often and never outside finite or parametric regimes. The asymmetry is a structural feature of the subject matter rather than an artifact of the survey: the probe categories that reconstruction uses are richer invariants than the finite data that classification needs.</p>
website/content/papers/vol-04-yoneda-classification.html:284:<p>The taxonomy declarations record vocabulary: the abstract components of the probe system and the group system are opaque identifiers, so those declarations index the definitions of the taxonomy rather than encode mathematics at the type level. The typed channel fragment and the Python experiments are the computational evidence proper. No claim of machine verification is made anywhere in this volume; a later mechanization could audit the executable models against kernel-checked specifications, which would be a cross-audit of models rather than a verification of the claims.</p>
website/content/papers/vol-04-yoneda-classification.html:293:<p><em>Evidence discipline.</em> The computational layer of <a href="#sec:computation" data-reference-type="ref+label" data-reference="sec:computation">7</a> evidences statements already proved in the paper or cited from the literature; it proves nothing on its own, and no claim of the paper is promoted by computation. The taxonomy declarations of <a href="#sec:computation" data-reference-type="ref+label" data-reference="sec:computation">7</a> are executable models of the definitions, not verified artifacts, and no claim of machine verification is made anywhere in this volume. Should a later mechanization check these models against kernel-checked specifications, the result would be a cross-audit of executable models, not a verification of the mathematical claims.</p>
website/content/papers/vol-09-gravity-information-geometry.html:119:<p>The failure of uniqueness is structural, not an artifact of the qubit. The Petz family is infinite in every dimension <span class="math inline">\(d \geq 2\)</span>, and the ambiguity appears already in the two-level system. Any physical statement of the form “the geometry of the quantum state space is <span class="math inline">\(G\)</span>” must therefore name <span class="math inline">\(f\)</span>, or must derive <span class="math inline">\(f\)</span> from independent principles. This constraint carries into every proposed gravity-information dictionary in <a href="#sec:correspondence" data-reference-type="ref+label" data-reference="sec:correspondence">10</a>.</p>
website/content/papers/vol-09-gravity-information-geometry.html:308:<p>The monotonicity experiment verifies <a href="#prop:monotone" data-reference-type="ref+label" data-reference="prop:monotone">14</a> numerically. For two thousand random interior points <span class="math inline">\(p\)</span> of the four-outcome simplex and random stochastic maps from four outcomes to three, the smallest eigenvalue of <span class="math inline">\(g_p - (D\varphi)^{\mathsf{T}} g_{\varphi p} (D\varphi)\)</span> restricted to the tangent space was <span class="math inline">\(1.028\)</span> at worst. The eigenvalues are taken in the ambient Euclidean metric on an orthonormal tangent basis, since a difference of metric tensors has no canonical eigenvalues without a reference metric; the positive floor is a sampling artifact of random maps avoiding the coarse-grainings where equality holds.</p>
website/content/papers/vol-09-gravity-information-geometry.html:327:<p>The Haskell module <code>src/vol-09-gravity-information-geometry/Instances.hs</code> declares instances of shared taxonomy classes (structural families, invariant records, decomposition hooks) for the systems of this paper (classical statistical models, quantum state systems, entanglement-wedge data, thermodynamic systems, weighted-nerve models). The module is executable vocabulary validated against the statements above; it is not machine-checked, and no claim of formal verification is made for it. The paths in this section are relative to the manuscript source tree; no permanent archival identifier for the code is available at the time of writing, and none is invented here.</p>
website/content/papers/vol-07-gauge-qft.html:2:We develop the classification of gauge structures and quantum field theories within the CMRPS program. The subject divides into two territories of unequal evidential standing. The established territory contains the KillingCartan classification of semisimple Lie algebras, the highest-weight classification of their finite-dimensional representations, the classification of principal <span class="math inline">\(G\)</span>-bundles by homotopy classes of maps into the classifying space <span class="math inline">\(BG\)</span>, characteristic classes as pullbacks of universal classes, and anomalies as cohomological obstructions that gate quantization. The restricted territory contains functorial topological field theories under the Atiyah axioms and the DoplicherRoberts reconstruction of superselection sectors under the HaagKastler framework. Beyond these islands the evidence is claimed rather than proved. The cobordism hypothesis classifies extended topological field theories by fully dualizable objects, yet the 2009 writeup is an informal proof sketch. The October 2026 four-dimensional quantum chromodynamics claim stands at existence claimed with manuscript and formalization withheld and verification pending, and the YangMills mass gap remains open. We present the classification results with their hypotheses and keep proved, claimed, and open statements apart throughout.
website/content/papers/vol-07-gauge-qft.html:5:<p>Gauge theories and quantum field theories occupy the point in the CMRPS program where classification is strongest on the geometric side and weakest on the analytic side. This volume takes the classification problem for its subject: which gauge structures and which quantum field theories are determined, up to a stated equivalence, by an explicit and computable invariant, and which are not. The answer splits sharply. For principal bundles, semisimple Lie algebras, their finite-dimensional representations, and the obstruction content of anomalies, complete classification theorems exist and are proved in the standard literature. For functorial topological field theories in low dimensions the position is similar. For extended topological field theories the classification is claimed on the strength of a proof sketch. For four-dimensional interacting quantum field theories the position is a claims register: one existence result is announced with its artifacts withheld, the mass gap is open, and several lower-rung claims carry statuses ranging from journal-published-and-unverified to withdrawn.</p>
website/content/papers/vol-07-gauge-qft.html:10:<p>The mathematical classification of gauge and quantum field theories splits into an established topological and algebraic core and an unverified analytic frontier. Complete classification invariants characterize Lie symmetries, bundle topologies, two-dimensional topological field theories, and localized superselection sectors: Dynkin diagrams, universal characteristic classes, Frobenius algebras, and unitary tensor categories do this work. The classification of four-dimensional continuum field theories, connection moduli spaces, and non-perturbative mass spectra remains conditional, claimed without public proof artifacts, or open.</p>
website/content/papers/vol-07-gauge-qft.html:44:<tr><td>Four-dimensional interacting theories</td><td>Balaban-program methods as announced</td><td>Not established</td><td>Claimed with artifacts withheld</td></tr>
website/content/papers/vol-07-gauge-qft.html:200:<p>The claim ladder separates an announced result, a manuscript, a machine-checked formalization, an independently verified proof, and an accepted theorem; a result moves up the ladder only by an artifact that can be checked, and each row of the register below keeps its current rung. Table <a href="#tab:rigorous" class="reflink">2</a> collects rigorous results in restricted regimes and the official problem status. Table <a href="#tab:claims" class="reflink">3</a> collects claims that lack public proof artifacts.</p>
website/content/papers/vol-07-gauge-qft.html:211:<caption><span class="tbl-num">Table 3.</span> Claims without public proof artifacts, as of 29 October 2026. None of these rows is a theorem of this volume or of the public record.</caption>
website/content/papers/vol-07-gauge-qft.html:213:<tr><td>OpenAI existence claim</td><td>Rigorous existence of quantum chromodynamics, a simplest grand unified completion, and pure YangMills theory as a subproblem, by Balaban-program methods <a class="citation" href="#bib-openai">[29]</a>, <a class="citation" href="#bib-kitp">[22]</a></td><td>Existence claimed. Manuscript and formalization withheld. Verification pending before a committee chaired by Gross with Douglas, Jaffe, Klebanov, and Nekrasov</td></tr>
website/content/papers/vol-07-gauge-qft.html:218:<p>The OpenAI claim carries the strongest external attention and the weakest public evidence. Its status string, binding on every mention of the work, is: existence claimed; manuscript and formalization withheld; verification pending <a class="citation" href="#bib-openai">[29]</a>, <a class="citation" href="#bib-kitp">[22]</a>. Nothing withheld from the public record can be machine-checked. The release of the artifacts is a tracked event; until then the entry belongs to the claims register and not among theorems.</p>
website/content/papers/vol-07-gauge-qft.html:222:<p>If the OpenAI claim is validated, the admissible set of four-dimensional interacting theories will contain at least one rigorous member, and the classification will record where it sits relative to the known families. Until the artifacts are released, no result of this volume depends on the claim. Classifying the structures that are already proved does not wait on the verdict.</p>
website/content/papers/vol-07-gauge-qft.html:237:<p>The constructive quantum field theory claims have a tracked event. The release of the withheld manuscript and the claimed formalization behind the October 2026 existence announcement would move that row of Table <a href="#tab:claims" class="reflink">3</a> from withheld to publicly checkable, and a committee verdict would move it further. Until the release, no result of this volume depends on it. The competing journal-published construction of a four-dimensional YangMills theory with a mass gap carries a second question: where its continuum limit is closed and where it is assumed. An audit of that construction is the sharpest available test of the mass-gap claim, and the audit has not been done.</p>
website/content/papers/vol-07-gauge-qft.html:239:<p>A single-source frontier claim needs verification. The possible extra factor of order two in the sector data of higher-form symmetric theories is noted in one preprint, and the classification of higher-form sectors would change if the possibility is realized. We record it and do not build on it.</p>
website/content/papers/vol-07-gauge-qft.html:250:<p>The two incomplete places are the extended topological field theory classification and four-dimensional constructive quantum field theory. The first is claimed on the strength of a proof sketch and registered as such. The second is a claims register: one existence result announced with its artifacts withheld, one mass gap open, one journal-published unverified construction, one withdrawn preprint, regime-restricted lattice theorems, and one outline. The ladder keeps them apart, and the classification program does not import any of them as a dependency.</p>
website/content/papers/vol-07-gauge-qft.html:253:<p>The volume closes where the classification is sharp. Gauge algebras, matter representations, bundles, anomaly-free configurations, and two-dimensional topological theories are classified by explicit invariants under stated equivalences. The extended topological classification is claimed and registered as claimed. Four-dimensional existence is claimed with its artifacts withheld and the mass gap is open. The claim ladder keeps those rows apart, and the classification program carries the proved rows forward without waiting on the others.</p>
website/content/papers/vol-11-completeness-obstructions.html:133:<p><em>Remark 10</em> (Assignment is evidence-shaped).  The assignment records where the classification evidence of each domain sits as of October 2026. A domain moves when new theorems arrive: the fusion-category entry moves if the open conjecture closes <a class="citation" href="#bib-fusionnlab">[26]</a>. One tracked claim sits outside the table because it rests on announcements rather than published proofs: an October 2026 existence claim for four-dimensional Yang-Mills and QCD, whose status is exactly the standing one, existence claimed; manuscript and formalization withheld; verification pending <a class="citation" href="#bib-openai">[30]</a>, <a class="citation" href="#bib-kitp">[31]</a>. Existence and the mass gap are separate questions and are never conflated; the Clay problem remains open <a class="citation" href="#bib-clay">[29]</a>, <a class="citation" href="#bib-kitp">[31]</a>.</p>
website/content/papers/vol-11-completeness-obstructions.html:261:<p>A companion Haskell module encodes the taxonomy layer: representative systems of each regime, carrying instances of the shared family classes of the series taxonomy, with a regime tag mirroring <a href="#def:regime" data-reference-type="ref+Label" data-reference="def:regime">9</a>. The module is executable specification, and it is computational evidence of the same standing as the experiments. Its witness systems cover the McDuff sector, the wild module sector, the finite-dimensional <span class="math inline">\(C^*\)</span>-algebra sector, and the four-manifold sector, so each regime of <a href="#def:regime" data-reference-type="ref+Label" data-reference="def:regime">9</a> that has a concrete witness in this paper is represented. No artifact in this section is a machine-checked formalization, and none is presented as one.</p>
website/content/papers/vol-11-completeness-obstructions.html:275:<p><a href="#tab:code" class="reflink">4</a> maps each computational claim of <a href="#sec:computational" data-reference-type="ref+Label" data-reference="sec:computational">8</a> to the file and function that demonstrates it. The artifacts live in <code>src/vol-11-completeness-obstructions/</code>. Each row is checked against the named code before publication.</p>
website/content/papers/vol-05-classical-systems.html:329:<p>The Haskell models in <code>src/vol-05-classical-systems/</code> declare instances of the shared taxonomy classes for symplectic systems, Poisson systems, Hamiltonian systems, and classical statistical systems, with names mirroring the definitions above and the companion verification targets. They compute witness data for the normal forms: standard symplectic matrices, rank splits of Poisson tensors, the Kirillov-Kostant-Souriau form on a two-dimensional orbit, and the Fisher metric on probability vectors. The models are executable, not machine-checked proofs. Appendix <a href="#app:code" data-reference-type="ref" data-reference="app:code">13</a> maps each computational claim to its file and function.</p>
website/content/papers/vol-02-structural-families.html:206:<p><em>Remark 28</em> (Proof gap).  The classification claim of <a href="#rem:cobordism" data-reference-type="ref+Label" data-reference="rem:cobordism">27</a> is recorded as claimed and not as complete. Later low-dimensional cases have been proved in the literature, and which cases are complete is a matter for verification case by case. A family row that reads “claimed” is a family row that should not carry load-bearing dependencies.</p>

exec
/usr/local/bin/zsh -lc "rg -n -i 'reviewer|revision|consistency report|review round|pipeline|audit trail|review feedback|publication gate' website/content website/app --glob '"'!manifest.json'"' | cut -c 1-550; nl -ba website/lib/macros.ts | tail -25; cat website/next.config.mjs; cat website/README.md" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
website/content/papers/vol-01-foundations.html:190:<p>Each condition excludes a concrete pathology, and the list can be tested record by record. A tuple with a component named but not defined fails AC-1. An observable collection such as the two point masses on a two-point state space fails AC-2. A Hamiltonian vector field defined only on an open subset of the state space fails AC-3. A symmetry action that moves an observable outside the observable collection fails AC-4. A composition rule that produces records with undefined components on some 
website/content/papers/vol-01-foundations.html:323:<p>A revision of the framework has a clear path. The preservation laws need completion in three directions: the inter-kind composition rule of Corollary <a href="#cor:schema-not-category" data-reference-type="ref" data-reference="cor:schema-not-category">13</a>, the algebraic form of the laws for quantum and gauge records, and the status of dualities as equivalences between record presentations. The admissibility list needs testing against records the paper does not treat, in particular gauge r
website/content/papers/vol-12-principia-physica.html:480:<p>Four limitations bound this synthesis. The assembly inherits the statuses of the program registry, and any status revision propagates. Three entries rest on single sources and were not independently re-verified here: the extra <span class="math inline">\(Z_2\)</span> sector of higher-form DHR theory <a class="citation" href="#bib-corpus-20">[20]</a>, the journal-published mass-gap claim <a class="citation" href="#bib-corpus-28">[28]</a>, and the Borel-reducibility obstruction announced
website/content/papers/synthesis.html:2:This paper states the structural picture formed by the twelve parts of the Classification of Mathematical Representations of Physical Systems, a program asking whether mathematical representations of physical systems admit a structural classification analogous to the Classification of Finite Simple Groups. One ontology of forty-two definitions, one dependency graph, and one equivalence discipline run through the series. Three kinds of result organize its classification content. Complete invariants appear 
    81	    else if (c === '}') {
    82	      depth--;
    83	      if (depth === 0) return src.slice(openIdx + 1, i);
    84	    }
    85	  }
    86	  return null;
    87	}
    88	
    89	let cached: MacroMap | null = null;
    90	
    91	export function getMacros(): MacroMap {
    92	  if (cached) return cached;
    93	  const candidates = [
    94	    path.join(process.cwd(), '..', 'papers', 'latex'),
    95	    path.join(process.cwd(), 'content', 'tex'),
    96	  ];
    97	  for (const dir of candidates) {
    98	    if (fs.existsSync(dir)) {
    99	      cached = extractMacros(dir);
   100	      return cached;
   101	    }
   102	  }
   103	  cached = { ...BASE_MACROS };
   104	  return cached;
   105	}
/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export',
  images: { unoptimized: true },
  trailingSlash: true,
};

export default nextConfig;
This is a [Next.js](https://nextjs.org) project bootstrapped with [`create-next-app`](https://nextjs.org/docs/app/api-reference/cli/create-next-app).

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `app/page.tsx`. The page auto-updates as you edit the file.

This project uses [`next/font`](https://nextjs.org/docs/app/building-your-application/optimizing/fonts) to automatically optimize and load [Geist](https://vercel.com/font), a new font family for Vercel.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.

codex
The periodic-table page and social metadata are present. I’m checking rendered math and fragment targets next; the macro loader depends on files outside `website/`, so I’m keeping that dependency uninspected and testing the website-only fallback.
exec
/usr/local/bin/zsh -lc "node -e '
const fs=require(\"fs\"),path=require(\"path\"),ts=require(\"./website/node_modules/typescript\"),katex=require(\"./website/node_modules/katex\");
function load(file,req){const m={exports:{}};new Function(\"require\",\"module\",\"exports\",ts.transpile(fs.readFileSync(file,\"utf8\"),{module:ts.ModuleKind.CommonJS}))(req,m,m.exports);return m.exports;}
const macros=load(\"website/lib/macros.ts\",require).BASE_MACROS;
const {renderMath}=load(\"website/lib/render-math.ts\",n=>n===\"katex\"?katex:{getMacros:()=>({...macros})});
for(const name of fs.readdirSync(\"website/content/papers\")){
const raw=fs.readFileSync(\"website/content/papers/\"+name,\"utf8\");const out=renderMath(raw);
const ids=new Set([...raw.matchAll(/\\bid=\"(["'^"]*)"/g)].map(m=>m[1]));const dead=[...raw.matchAll(/href="#([''^"]*)"/g)].filter(m=>!ids.has(m[1])).map(m=>({line:raw.slice(0,m.index).split("'"\\n\").length,target:m[1]}));
const errs=[...out.matchAll(/class=\"katex-error\"["'^>]*>(['"\\s\\S]*?)<\\/span>/g)].map(m=>m[1]);
const math=[...raw.matchAll(/<span class=\"math (?:inline|display)\">([\\s\\S]*?)<\\/span>/g)];
const split=math.filter(m=>/<[a-z]/i.test(m[1]));
console.log(JSON.stringify({file:name,dead,errors:errs.length,examples:[...new Set(errs)].slice(0,5),splitMath:split.slice(0,3).map(m=>({line:raw.slice(0,m.index).split(\"\\n\").length,body:m[1]}))}));
}
'" in /Users/mlong/Documents/Development/classification-physical-systems
 exited 1 in 50ms:
<anonymous_script>:20
    return katex_1.default.renderToString(unescapeHtml(tex).trim(), {
                           ^

TypeError: Cannot read properties of undefined (reading 'renderToString')
    at renderOne (eval at load ([eval]:3:46), <anonymous>:20:28)
    at renderTextRun (eval at load ([eval]:3:46), <anonymous>:88:28)
    at eval (eval at load ([eval]:3:46), <anonymous>:110:54)
    at Array.map (<anonymous>)
    at renderMath (eval at load ([eval]:3:46), <anonymous>:110:10)
    at [eval]:7:76
    at runScriptInThisContext (node:internal/vm:219:10)
    at node:internal/process/execution:451:12
    at [eval]-wrapper:6:24
    at runScriptInContext (node:internal/process/execution:449:60)

Node.js v24.22.0

exec
/usr/local/bin/zsh -lc "node -e '
const fs=require(\"fs\"),ts=require(\"./website/node_modules/typescript\"),katex=require(\"./website/node_modules/katex\");
function load(file,req){const m={exports:{}};new Function(\"require\",\"module\",\"exports\",ts.transpile(fs.readFileSync(file,\"utf8\"),{module:ts.ModuleKind.CommonJS,esModuleInterop:true}))(req,m,m.exports);return m.exports;}
const macros=load(\"website/lib/macros.ts\",require).BASE_MACROS;
const {renderMath}=load(\"website/lib/render-math.ts\",n=>n===\"katex\"?katex:{getMacros:()=>({...macros})});
for(const name of fs.readdirSync(\"website/content/papers\")){
const raw=fs.readFileSync(\"website/content/papers/\"+name,\"utf8\"),out=renderMath(raw);
const ids=new Set([...raw.matchAll(/\\bid=\"(["'^"]*)"/g)].map(m=>m[1]));const dead=[...raw.matchAll(/href="#([''^"]*)"/g)].filter(m=>!ids.has(m[1])).map(m=>({line:raw.slice(0,m.index).split("'"\\n\").length,target:m[1]}));
const errs=[...out.matchAll(/class=\"katex-error\"["'^>]*>(['"\\s\\S]*?)<\\/span>/g)].map(m=>m[1]);
const math=[...raw.matchAll(/<span class=\"math (?:inline|display)\">([\\s\\S]*?)<\\/span>/g)],split=math.filter(m=>/<[a-z]/i.test(m[1]));
console.log(JSON.stringify({file:name,dead,errors:errs.length,examples:[...new Set(errs)].slice(0,4),splitMath:split.slice(0,2).map(m=>({line:raw.slice(0,m.index).split(\"\\n\").length,body:m[1]}))}));
}
'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 291ms:
{"file":"synthesis.html","dead":[],"errors":0,"examples":[],"splitMath":[]}
{"file":"vol-01-foundations.html","dead":[],"errors":0,"examples":[],"splitMath":[]}
{"file":"vol-02-structural-families.html","dead":[],"errors":0,"examples":[],"splitMath":[]}
{"file":"vol-03-irreducibility-decomposition.html","dead":[],"errors":0,"examples":[],"splitMath":[]}
{"file":"vol-04-yoneda-classification.html","dead":[],"errors":0,"examples":[],"splitMath":[]}
{"file":"vol-05-classical-systems.html","dead":[],"errors":0,"examples":[],"splitMath":[]}
{"file":"vol-06-quantum-systems.html","dead":[],"errors":0,"examples":[],"splitMath":[]}
{"file":"vol-07-gauge-qft.html","dead":[],"errors":0,"examples":[],"splitMath":[]}
{"file":"vol-08-spacetime-reconstruction.html","dead":[],"errors":0,"examples":[],"splitMath":[]}
{"file":"vol-09-gravity-information-geometry.html","dead":[],"errors":0,"examples":[],"splitMath":[]}
{"file":"vol-10-observational-equivalence.html","dead":[],"errors":0,"examples":[],"splitMath":[]}
{"file":"vol-11-completeness-obstructions.html","dead":[],"errors":0,"examples":[],"splitMath":[]}
{"file":"vol-12-principia-physica.html","dead":[],"errors":0,"examples":[],"splitMath":[]}

exec
/usr/local/bin/zsh -lc "rg -n '\\"'$|'"\\\\[a-zA-Z]|review|report|research/|checklist|obligation|consisten' website/content/periodic-table.md | cut -c 1-600; rg -n 'consistency report|reviewer|review|report|verification' website/content/papers/synthesis.html | cut -c 1-700; nl -ba website/app/page.tsx | sed -n '93,108p'; nl -ba website/app/layout.tsx | head -38; nl -ba website/app/globals.css | sed -n '338,390p'; rg -n 'style=|width=|nowrap|<img|<svg' website/content/papers | head -15" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
16:Citation convention: bracketed numbers resolve to the Sources list of `research/cmrps-research-map/REPORT.md`. Inferences are marked *conjectural* or *open*.
138:3. **OPEN** cells mark where the series' own conjecture (T-CMRPS-01) and its five obligations live; the table is the chart that conjecture would complete.
2:This paper states the structural picture formed by the twelve parts of the Classification of Mathematical Representations of Physical Systems, a program asking whether mathematical representations of physical systems admit a structural classification analogous to the Classification of Finite Simple Groups. One ontology of forty-two definitions, one dependency graph, and one equivalence discipline run through the series. Three kinds of result organize its classification content. Complete invariants appear wherever the invariant is finite or explicitly parameterized: dimension vectors for finite-dimensional <span class="math inline">\(C^*\)</span>-algebras, Dynkin and Satake diagrams for sem
    93	            </p>
    94	            <div className="card-foot">
    95	              <a className="read" href="/periodic-table/">Open the table →</a>
    96	            </div>
    97	          </article>
    98	          <article className="paper-card">
    99	            <div className="card-part">
   100	              <span>Synthesis</span>
   101	              <span className="cat">math-ph</span>
   102	            </div>
   103	            <h3>
   104	              <a href="/papers/synthesis/">Structural Synthesis</a>
   105	            </h3>
   106	            <p className="card-abstract">
   107	              The structural picture formed by the twelve parts: the registered results,
   108	              the dependency structure among the volumes, and the obligations the
     1	import type { Metadata } from 'next';
     2	import { Inter, Spectral } from 'next/font/google';
     3	import 'katex/dist/katex.min.css';
     4	import './globals.css';
     5	
     6	const inter = Inter({ subsets: ['latin'], variable: '--font-inter', display: 'swap' });
     7	const spectral = Spectral({
     8	  subsets: ['latin'],
     9	  weight: ['400', '600', '700'],
    10	  variable: '--font-spectral',
    11	  display: 'swap',
    12	});
    13	
    14	const siteUrl = process.env.VERCEL_PROJECT_PRODUCTION_URL
    15	  ? `https://${process.env.VERCEL_PROJECT_PRODUCTION_URL}`
    16	  : process.env.NEXT_PUBLIC_SITE_URL || 'http://localhost:3000';
    17	
    18	const SITE_NAME = 'CMRPS';
    19	
    20	export const metadata: Metadata = {
    21	  metadataBase: new URL(siteUrl),
    22	  title: { default: 'CMRPS — Classification of Mathematical Representations of Physical Systems', template: '%s | CMRPS' },
    23	  description:
    24	    'A twelve-volume research series on the structural classification of mathematical representations of physical systems, with a structural synthesis. Matthew Long / The YonedaAI Collaboration.',
    25	  openGraph: {
    26	    type: 'website',
    27	    siteName: SITE_NAME,
    28	    images: [{ url: '/og/og-default.png', width: 1200, height: 630 }],
    29	  },
    30	  twitter: {
    31	    card: 'summary_large_image',
    32	    images: ['/og/og-default.png'],
    33	  },
    34	};
    35	
    36	export default function RootLayout({
    37	  children,
    38	}: Readonly<{
   338	  border-color: var(--accent);
   339	  box-shadow: 0 14px 36px rgba(0, 0, 0, 0.35), 0 0 0 1px var(--accent-glow);
   340	}
   341	
   342	.card-part {
   343	  display: flex;
   344	  justify-content: space-between;
   345	  align-items: center;
   346	  gap: 0.5rem;
   347	  margin-bottom: 0.75rem;
   348	  font-size: 0.75rem;
   349	  letter-spacing: 0.12em;
   350	  text-transform: uppercase;
   351	  color: var(--accent-secondary);
   352	  font-weight: 600;
   353	}
   354	
   355	.card-part .cat {
   356	  color: var(--text-dim);
   357	  letter-spacing: 0.06em;
   358	  text-transform: none;
   359	  font-family: ui-monospace, monospace;
   360	}
   361	
   362	.paper-card h3 {
   363	  font-size: 1.13rem;
   364	  margin: 0 0 0.55rem;
   365	}
   366	
   367	.paper-card h3 a {
   368	  color: var(--text);
   369	}
   370	.paper-card:hover h3 a {
   371	  color: var(--accent-hover);
   372	}
   373	
   374	.card-sub {
   375	  color: var(--text-dim);
   376	  font-size: 0.8rem;
   377	  margin: 0 0 0.75rem;
   378	}
   379	
   380	.card-abstract {
   381	  color: var(--text-muted);
   382	  font-size: 0.88rem;
   383	  margin: 0 0 1.15rem;
   384	  flex: 1;
   385	}
   386	
   387	.card-foot {
   388	  display: flex;
   389	  flex-wrap: wrap;
   390	  align-items: center;
website/content/papers/vol-12-principia-physica.html:50:<th style="text-align: left;">Family</th>
website/content/papers/vol-12-principia-physica.html:51:<th style="text-align: left;">Underlying structure</th>
website/content/papers/vol-12-principia-physica.html:52:<th style="text-align: left;">Representative systems</th>
website/content/papers/vol-12-principia-physica.html:53:<th style="text-align: left;">Defining invariants</th>
website/content/papers/vol-12-principia-physica.html:58:<td style="text-align: left;">I</td>
website/content/papers/vol-12-principia-physica.html:59:<td style="text-align: left;">Symplectic and Poisson structures</td>
website/content/papers/vol-12-principia-physica.html:60:<td style="text-align: left;">Classical mechanics</td>
website/content/papers/vol-12-principia-physica.html:61:<td style="text-align: left;">Symplectic form and splitting data</td>
website/content/papers/vol-12-principia-physica.html:64:<td style="text-align: left;">II</td>
website/content/papers/vol-12-principia-physica.html:65:<td style="text-align: left;">Hilbert spaces and operator algebras</td>
website/content/papers/vol-12-principia-physica.html:66:<td style="text-align: left;">Quantum mechanics</td>
website/content/papers/vol-12-principia-physica.html:67:<td style="text-align: left;">Dimension vector and factor type</td>
website/content/papers/vol-12-principia-physica.html:70:<td style="text-align: left;">III</td>
website/content/papers/vol-12-principia-physica.html:71:<td style="text-align: left;">Smooth manifolds and geometry</td>
website/content/papers/vol-12-principia-physica.html:72:<td style="text-align: left;">Relativity</td>

exec
/usr/local/bin/zsh -lc "node -e '
const fs=require(\"fs\"),ts=require(\"./website/node_modules/typescript\"),katex=require(\"./website/node_modules/katex\");function load(file,req){const m={exports:{}};new Function(\"require\",\"module\",\"exports\",ts.transpile(fs.readFileSync(file,\"utf8\"),{module:ts.ModuleKind.CommonJS,esModuleInterop:true}))(req,m,m.exports);return m.exports;}const macros=load(\"website/lib/macros.ts\",require).BASE_MACROS;const {renderMath}=load(\"website/lib/render-math.ts\",n=>n===\"katex\"?katex:{getMacros:()=>({...macros})});
let longs=[];for(const name of fs.readdirSync(\"website/content/papers\")){const raw=fs.readFileSync(\"website/content/papers/\"+name,\"utf8\"),out=renderMath(raw);for(const m of raw.matchAll(/<h([2-4])["'^>]*id="([''^"]+)"[''^>]*>(['"\\s\\S]*?)<\\/h\\1>/g)){if(m[3].includes(\"math\")){const r=renderMath(m[0]);console.log(\"HEADING\",name,raw.slice(0,m.index).split(\"\\n\").length,r.replace(/<["'^>]+>/g,"").slice(0,400));}}
for(const m of raw.matchAll(/<span class="math inline">'"\\\\\\(([\\s\\S]*?)\\\\\\)<\\/span>/g)){longs.push({file:name,line:raw.slice(0,m.index).split(\"\\n\").length,tex:m[1]});try{katex.renderToString(m[1].replace(/&amp;/g,\"&\").replace(/&lt;/g,\"<\").replace(/&gt;/g,\">\"),{throwOnError:true,macros:{...macros},strict:false})}catch(e){console.log(\"PARSE\",name,e.message.slice(0,170))}}
}console.log(\"LONG\",JSON.stringify(longs.sort((a,b)=>b.tex.length-a.tex.length).slice(0,7)));
'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 347ms:
PARSE vol-02-structural-families.html KaTeX parse error: Expected 'EOF', got '&' at position 5: U, U&̲#39;
PARSE vol-02-structural-families.html KaTeX parse error: Expected 'EOF', got '&' at position 10: UXU^* = U&̲#39;XU&#39;^*
PARSE vol-02-structural-families.html KaTeX parse error: Expected 'EOF', got '&' at position 2: U&̲#39; = \lambda …
PARSE vol-03-irreducibility-decomposition.html KaTeX parse error: Expected 'EOF', got '&' at position 10: A \cong A&̲#39;
PARSE vol-03-irreducibility-decomposition.html KaTeX parse error: Expected 'EOF', got '&' at position 29: … = \mathbf{n}(A&̲#39;)
PARSE vol-04-yoneda-classification.html KaTeX parse error: Expected 'EOF', got '&' at position 17: … \colon R \to R&̲#39;
PARSE vol-04-yoneda-classification.html KaTeX parse error: Expected 'EOF', got '&' at position 39: …\mathrm{Hom}}(R&̲#39;, P) \to \m…
PARSE vol-04-yoneda-classification.html KaTeX parse error: Expected 'EOF', got '&' at position 3: (H&̲#39;, A&#39;)
PARSE vol-04-yoneda-classification.html KaTeX parse error: Expected 'EOF', got '&' at position 2: A&̲#39; \to A
PARSE vol-04-yoneda-classification.html KaTeX parse error: Expected 'EOF', got '&' at position 17: … \colon R \to R&̲#39;
PARSE vol-04-yoneda-classification.html KaTeX parse error: Expected 'EOF', got '&' at position 17: … \colon R \to R&̲#39;
PARSE vol-04-yoneda-classification.html KaTeX parse error: Expected 'EOF', got '&' at position 24: …\mathrm{Hom}}(R&̲#39;, P)
PARSE vol-04-yoneda-classification.html KaTeX parse error: Expected '}', got '&' at position 23: …hi) \colon M_{n&̲#39;} \to M_{m&…
PARSE vol-04-yoneda-classification.html KaTeX parse error: Expected 'EOF', got '&' at position 2: L&̲#39;
PARSE vol-04-yoneda-classification.html KaTeX parse error: Expected 'EOF', got '&' at position 2: L&̲#39;
PARSE vol-04-yoneda-classification.html KaTeX parse error: Expected 'EOF', got '&' at position 2: L&̲#39;
PARSE vol-05-classical-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 2: B&̲#39;
PARSE vol-05-classical-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 2: B&̲#39;
PARSE vol-05-classical-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 2: B&̲#39; = B(p, r)
PARSE vol-05-classical-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 2: B&̲#39; \subset B
PARSE vol-05-classical-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 2: B&̲#39;
PARSE vol-05-classical-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 2: B&̲#39;
PARSE vol-05-classical-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 2: B&̲#39;
PARSE vol-05-classical-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 3: (B&̲#39;, \omega)
PARSE vol-05-classical-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 12: f : M \to M&̲#39;
PARSE vol-05-classical-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 8: [\omega&̲#39;]
PARSE vol-05-classical-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 13: f^{*} \omega&̲#39;
PARSE vol-05-classical-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 3: (M&̲#39;, \omega&#3…
PARSE vol-05-classical-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 7: \sigma&̲#39;
PARSE vol-05-classical-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 42: …_{S^{2}} \sigma&̲#39;
PARSE vol-05-classical-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 15: (S^{2}, \sigma&̲#39;)
PARSE vol-05-classical-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 37: …igma + t \sigma&̲#39;
PARSE vol-05-classical-systems.html KaTeX parse error: Expected '}', got '&' at position 14: (M, \omega_{a&̲#39;, b&#39;})
PARSE vol-05-classical-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 15: \{a, b\} = \{a&̲#39;, b&#39;\}
PARSE vol-05-classical-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 22: …omega) \leq c(M&̲#39;, \omega&#3…
PARSE vol-05-classical-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 3: (M&̲#39;, \omega&#3…
PARSE vol-06-quantum-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 3: (K&̲#39;, V&#39;)
PARSE vol-06-quantum-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 11: U: K \to K&̲#39;
PARSE vol-06-quantum-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 22: …otimes U) V = V&̲#39;
PARSE vol-06-quantum-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 2: K&̲#39;
PARSE vol-06-quantum-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 18: …^* \otimes I) V&̲#39; \psi
PARSE vol-06-quantum-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 11: U: K \to K&̲#39;
PARSE vol-06-quantum-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 22: …otimes U) V = V&̲#39;
PARSE vol-06-quantum-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 31: …\sum_{i,j} 2 |A&̲#39;_{ij}|^2 / …
PARSE vol-06-quantum-systems.html KaTeX parse error: Expected 'EOF', got '&' at position 2: A&̲#39; = U^* A U
PARSE vol-07-gauge-qft.html KaTeX parse error: Expected 'EOF', got '&' at position 2: Z&̲#39;
PARSE vol-07-gauge-qft.html KaTeX parse error: Expected 'EOF', got '&' at position 16: \widetilde{G}/Z&̲#39;
PARSE vol-08-spacetime-reconstruction.html KaTeX parse error: Expected 'EOF', got '&' at position 3: (M&̲#39;,g&#39;)
PARSE vol-08-spacetime-reconstruction.html KaTeX parse error: Expected 'EOF', got '&' at position 9: e^{2f} g&̲#39;
PARSE vol-08-spacetime-reconstruction.html KaTeX parse error: Expected 'EOF', got '&' at position 3: (M&̲#39;,g&#39;)
PARSE vol-08-spacetime-reconstruction.html KaTeX parse error: Expected 'EOF', got '&' at position 23: … \colon M \to M&̲#39;
PARSE vol-08-spacetime-reconstruction.html KaTeX parse error: Expected 'EOF', got '&' at position 17: …varphi(p) \prec&̲#39; \varphi(q)
PARSE vol-09-gravity-information-geometry.html KaTeX parse error: Expected 'EOF', got '&' at position 2: p&̲#39;
PARSE vol-09-gravity-information-geometry.html KaTeX parse error: Expected '}', got '&' at position 29: …m_i \sqrt{p_i p&̲#39;_i}
PARSE vol-09-gravity-information-geometry.html KaTeX parse error: Expected 'EOF', got '&' at position 6: i : M&̲#39; \to \Delta…
PARSE vol-09-gravity-information-geometry.html KaTeX parse error: Expected 'EOF', got '&' at position 2: M&̲#39;
PARSE vol-09-gravity-information-geometry.html KaTeX parse error: Expected 'EOF', got '&' at position 2: g&̲#39; = i^{*} g^…
PARSE vol-09-gravity-information-geometry.html KaTeX parse error: Expected 'EOF', got '&' at position 3: (M&̲#39;, g&#39;)
PARSE vol-09-gravity-information-geometry.html KaTeX parse error: Expected 'EOF', got '&' at position 2: p&̲#39;(\theta) = …
PARSE vol-10-observational-equivalence.html KaTeX parse error: Expected 'EOF', got '&' at position 12: P \approx P&̲#39;
PARSE vol-10-observational-equivalence.html KaTeX parse error: Expected 'EOF', got '&' at position 12: Q \approx Q&̲#39;
PARSE vol-10-observational-equivalence.html KaTeX parse error: Expected 'EOF', got '&' at position 22: …mes Q \approx P&̲#39; \otimes Q&…
PARSE vol-10-observational-equivalence.html KaTeX parse error: Expected 'EOF', got '&' at position 2: E&̲#39; = \{e_1, e…
HEADING vol-12-principia-physica.html 167 The mathematical layer
LONG [{"file":"vol-09-gravity-information-geometry.html","line":157,"tex":"\\sqrt{\\rho}\\, \\sigma \\sqrt{\\rho} = \\left(\\begin{smallmatrix} \\lambda_+^2 &amp; \\tfrac{\\varepsilon}{2}\\sqrt{\\lambda_+ \\lambda_-} \\\\ \\tfrac{\\varepsilon}{2}\\sqrt{\\lambda_+ \\lambda_-} &amp; \\lambda_-^2 \\end{smallmatrix}\\right)"},{"file":"vol-05-classical-systems.html","line":100,"tex":"\\langle \\operatorname{Ad}^{*}_{g} \\xi, [\\operatorname{Ad}_{g} x, \\operatorname{Ad}_{g} y] \\rangle = \\langle \\xi, [x, y] \\rangle"},{"file":"vol-03-irreducibility-decomposition.html","line":161,"tex":"I/2 = \\frac{1}{2}(|0\\rangle\\langle 0| + |1\\rangle\\langle 1|) = \\frac{1}{2}(|+\\rangle\\langle +| + |-\\rangle\\langle -|)"},{"file":"vol-04-yoneda-classification.html","line":136,"tex":"\\sum_{k,l} J(\\Phi)_{(ik),(jl)} \\delta_{k\\alpha} \\delta_{l\\beta} = \\tfrac{1}{2} \\delta_{ij} \\delta_{\\alpha\\beta}"},{"file":"vol-09-gravity-information-geometry.html","line":91,"tex":"\\varphi = \\left(\\begin{smallmatrix} 0.7 &amp; 0.1 &amp; 0.2 \\\\ 0.3 &amp; 0.9 &amp; 0.8 \\end{smallmatrix}\\right)"},{"file":"vol-03-irreducibility-decomposition.html","line":190,"tex":"\\operatorname{rank}(J(\\Psi \\circ \\Phi)) \\leq \\operatorname{rank}(J(\\Phi)) \\cdot \\operatorname{rank}(J(\\Psi))"},{"file":"vol-04-yoneda-classification.html","line":91,"tex":"\\mathop{\\mathrm{Hom}}(R, A \\times B) \\cong \\mathop{\\mathrm{Hom}}(R, A) \\times \\mathop{\\mathrm{Hom}}(R, B)"}]

exec
/usr/local/bin/zsh -lc "node -e '
const fs=require(\"fs\"),ts=require(\"./website/node_modules/typescript\"),katex=require(\"./website/node_modules/katex\");function load(f,r){const m={exports:{}};new Function(\"require\",\"module\",\"exports\",ts.transpile(fs.readFileSync(f,\"utf8\"),{module:ts.ModuleKind.CommonJS,esModuleInterop:true}))(r,m,m.exports);return m.exports;}const macros=load(\"website/lib/macros.ts\",require).BASE_MACROS;const {renderMath}=load(\"website/lib/render-math.ts\",n=>n===\"katex\"?katex:{getMacros:()=>({...macros})});for(const f of fs.readdirSync(\"website/content/papers\")){const raw=fs.readFileSync(\"website/content/papers/\"+f,\"utf8\"),out=renderMath(raw);const errors=(out.match(/katex-error/g)||[]).length;const text=out.replace(/<span class=\"katex\">[\\s\\S]*?<\\/annotation>[\\s\\S]*?<\\/math><\\/span>/g,\"\").replace(/<["'^>]*>/g,"");const residual=text.match(/'"\\\\(?:[a-zA-Z]+|\\(|\\[)/g)||[];if(errors||residual.length)console.log(f,errors,[...new Set(residual)].slice(0,20));}
const md=fs.readFileSync(\"website/content/periodic-table.md\",\"utf8\"),sources=fs.readFileSync(\"website/content/periodic-table-sources.md\",\"utf8\"),ids=new Set([...sources.matchAll(/"'^'"\\[(\\d+)\\]/gm)].map(m=>m[1]));console.log(\"MISSING SOURCES\",[...new Set([...md.matchAll(/\\[(\\d+)\\]/g)].filter(m=>"'!ids.has(m[1])).map(m=>m[1]))]);for(const p of JSON.parse(fs.readFileSync("website/content/manifest.json","utf8"))){for(const loc of ["website/content/papers/"+p.slug+".html","website/public/pdf/"+p.slug+".pdf","website/public/og/"+p.slug+".png"])if(!fs.existsSync(loc))console.log("MISSING",loc);}
'"'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 215ms:
MISSING SOURCES []

exec
/usr/local/bin/zsh -lc "rg -n 'description|title' website/node_modules/next/dist/lib/metadata/resolvers/resolve-opengraph.js | head -28; rg -n 'description|openGraph|twitter' website/node_modules/next/dist/lib/metadata/resolve-metadata.js | tail -35; nl -ba website/content/papers/vol-03-irreducibility-decomposition.html | sed -n '156,164p'; nl -ba website/content/papers/synthesis.html | head -4; nl -ba website/app/periodic-table/page.tsx | head -28; nl -ba website/app/page.tsx | head -19" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
29:const _resolvetitle = require("./resolve-title");
113:const resolveOpenGraph = (openGraph, metadataBase, metadataContext, titleTemplate)=>{
132:        title: (0, _resolvetitle.resolveTitle)(openGraph.title, titleTemplate)
143:    "description"
145:const resolveTwitter = (twitter, metadataBase, metadataContext, titleTemplate)=>{
151:        title: (0, _resolvetitle.resolveTitle)(twitter.title, titleTemplate)
151:                    target.twitter = (0, _resolveopengraph.resolveTwitter)(source.twitter, metadataBase, metadataContext, titleTemplates.twitter);
196:            case "description":
280:    const [icon, apple, openGraph, twitter] = await Promise.all([
283:        collectStaticImagesFiles(metadata, props, "openGraph"),
284:        collectStaticImagesFiles(metadata, props, "twitter")
289:        openGraph,
290:        twitter,
396:        if (!target.description && metadata.description) {
397:            target.description = metadata.description;
403:    "description",
407:    const { openGraph, twitter } = metadata;
408:    if (openGraph) {
409:        // If there's openGraph information but not configured in twitter,
410:        // inherit them from openGraph metadata.
412:        const hasTwTitle = hasTitle(twitter);
413:        const hasTwDescription = twitter == null ? void 0 : twitter.description;
414:        const hasTwImages = Boolean((twitter == null ? void 0 : twitter.hasOwnProperty("images")) && twitter.images);
416:            if (isTitleTruthy(openGraph.title)) {
417:                autoFillProps.title = openGraph.title;
422:        if (!hasTwDescription) autoFillProps.description = openGraph.description || metadata.description || undefined;
423:        if (!hasTwImages) autoFillProps.images = openGraph.images;
425:            const partialTwitter = (0, _resolveopengraph.resolveTwitter)(autoFillProps, metadata.metadataBase, metadataContext, titleTemplates.twitter);
426:            if (metadata.twitter) {
427:                metadata.twitter = Object.assign({}, metadata.twitter, {
432:                        description: partialTwitter == null ? void 0 : partialTwitter.description
439:                metadata.twitter = partialTwitter;
443:    // If there's no title and description configured in openGraph or twitter,
444:    // use the title and description from metadata.
445:    inheritFromMetadata(openGraph, metadata);
446:    inheritFromMetadata(twitter, metadata);
515:        twitter: null,
516:        openGraph: null
557:            var _resolvedMetadata_title, _resolvedMetadata_openGraph, _resolvedMetadata_twitter;
560:                openGraph: ((_resolvedMetadata_openGraph = resolvedMetadata.openGraph) == null ? void 0 : _resolvedMetadata_openGraph.title.template) || null,
561:                twitter: ((_resolvedMetadata_twitter = resolvedMetadata.twitter) == null ? void 0 : _resolvedMetadata_twitter.title.template) || null
   156	</div>
   157	<div id="prop:ensemble" class="proposition">
   158	<p><strong>Proposition 27</strong> (Ensemble nonuniqueness).  <em>Every mixed density operator <span class="math inline">\(\rho\)</span>, that is, every density operator of rank at least two, admits infinitely many distinct decompositions into pure states. Pure states are the only exceptions: a rank-one projector is an extreme point of the state space and admits no nontrivial decomposition.</em></p>
   159	</div>
   160	<div class="proof">
   161	<p><em>Proof.</em> Let <span class="math inline">\(\rho = \sum_{k=1}^{r} \lambda_k |v_k\rangle\langle v_k|\)</span> be the spectral decomposition with <span class="math inline">\(r \geq 2\)</span> and all <span class="math inline">\(\lambda_k &gt; 0\)</span>. Every choice of an isometry <span class="math inline">\(U \colon \mathbb{C}^{r} \to \mathbb{C}^{m}\)</span> with <span class="math inline">\(m \geq r\)</span> produces a pure-state ensemble of <span class="math inline">\(\rho\)</span> through the unitary-mixing construction: the unnormalized vectors <span class="math inline">\(|\phi_j\rangle = \sum_{k=1}^{r} U_{jk} \sqrt{\lambda_k} |v_k\rangle\)</span> for <span class="math inline">\(j = 1, \dots, m\)</span> satisfy <span class="math inline">\(\sum_j |\phi_j\rangle\langle\phi_j| = \rho\)</span>, because <span class="math inline">\(U^* U = I_r\)</span> rearranges the spectral sum. The corresponding ensemble consists of the normalized pure states <span class="math inline">\(|\phi_j\rangle/\|\phi_j\|\)</span> with probabilities <span class="math inline">\(p_j = \|\phi_j\|^2\)</span>. Varying <span class="math inline">\(U\)</span> over the unitary group gives continuously many distinct ensembles, and two ensembles related by no unitary mixing differ as decompositions. In the qubit case <span class="math inline">\(\rho = I/2\)</span> the construction reads <span class="math inline">\(I/2 = \frac{1}{2}(|0\rangle\langle 0| + |1\rangle\langle 1|) = \frac{1}{2}(|+\rangle\langle +| + |-\rangle\langle -|)\)</span>, and every orthonormal basis of <span class="math inline">\(\mathbb{C}^2\)</span> gives a new decomposition. ◻</p>
   162	</div>
   163	<p>The proposition is the state-level counterpart of the normal-form warning: every mixed state has a canonical spectral decomposition, and no decomposition into pure states is unique. Uniqueness returns only in the restricted bipartite case of <a href="#prop:unique-restricted" data-reference-type="ref+label" data-reference="prop:unique-restricted">25</a>.</p>
   164	<div class="remark">
     1	<section class="paper-abstract" id="abstract"><h2>Abstract</h2>
     2	This paper states the structural picture formed by the twelve parts of the Classification of Mathematical Representations of Physical Systems, a program asking whether mathematical representations of physical systems admit a structural classification analogous to the Classification of Finite Simple Groups. One ontology of forty-two definitions, one dependency graph, and one equivalence discipline run through the series. Three kinds of result organize its classification content. Complete invariants appear wherever the invariant is finite or explicitly parameterized: dimension vectors for finite-dimensional <span class="math inline">\(C^*\)</span>-algebras, Dynkin and Satake diagrams for semisimple Lie theory, classifying spaces for principal bundles, and the Murray-von Neumann and Connes data for amenable factors. Reconstruction theorems recover objects from probes under hypotheses that cannot be dropped. Seven obstruction theorems bound the scope of any classification, from uncountably many type <span class="math inline">\(\mathrm{II}_1\)</span> factors to algorithmic unrecognizability in dimension four. Every equivalence in the series declares the structure it preserves, and equivalences that forget the symmetric layer fail in a proved counterexample. The structural classification conjecture is stated as the program’s theorem target with its five proof obligations. The cross-volume consistency report records that the twelve parts share definitions, dependency discipline, and claim vocabulary without conflict.
     3	</section>
     4	<h2 id="introduction">Introduction</h2>
     1	import type { Metadata } from 'next';
     2	import { getPeriodicTable } from '../../lib/papers';
     3	import { PaperContent } from '../../components/PaperContent';
     4	
     5	const title = 'The Periodic Table of Mathematical Physics';
     6	
     7	export const metadata: Metadata = {
     8	  title,
     9	  description:
    10	    'The classification chart of the CMRPS program: structural families and their defining invariants, exceptional structures, proven reconstruction relationships, and the claim status of every row (PROVEN, CLAIMED, OPEN, IMPOSSIBLE).',
    11	  openGraph: {
    12	    title,
    13	    type: 'article',
    14	    url: '/periodic-table/',
    15	    images: [{ url: '/og/synthesis.png', width: 1200, height: 630 }],
    16	  },
    17	  twitter: {
    18	    card: 'summary_large_image',
    19	    title,
    20	    images: ['/og/synthesis.png'],
    21	  },
    22	};
    23	
    24	export default async function PeriodicTablePage() {
    25	  const { html } = await getPeriodicTable();
    26	
    27	  return (
    28	    <div className="paper-layout">
     1	import type { Metadata } from 'next';
     2	import { getPapers } from '../lib/papers';
     3	
     4	export const metadata: Metadata = {
     5	  openGraph: {
     6	    images: [{ url: '/og/og-default.png', width: 1200, height: 630 }],
     7	  },
     8	  twitter: {
     9	    card: 'summary_large_image',
    10	    images: ['/og/og-default.png'],
    11	  },
    12	};
    13	
    14	export default function HomePage() {
    15	  const papers = getPapers();
    16	  const totalPages = papers.reduce((n, p) => n + p.pages, 0);
    17	
    18	  return (
    19	    <>

exec
/usr/local/bin/zsh -lc "node -e 'const k=require(\"./website/node_modules/katex\");const t=k.__renderToHTMLTree(\"\\\\langle \\\\operatorname{Ad}"'^{*}_{g} '"\\\\xi, [\\\\operatorname{Ad}_{g} x, \\\\operatorname{Ad}_{g} y] \\\\rangle\",{});console.log(JSON.stringify(t,(x,v)=>[\"children\",\"classes\",\"width\",\"height\",\"text\",\"style\"].includes(x)||x===\"\"?v:undefined).slice(0,1000)); console.log(Object.keys(k));'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
{"children":[null],"classes":[null],"height":0.773036,"style":{}}
[
  'version',
  'render',
  'renderToString',
  'ParseError',
  'SETTINGS_SCHEMA',
  '__parse',
  '__renderToDomTree',
  '__renderToHTMLTree',
  '__setFontMetrics',
  '__defineSymbol',
  '__defineFunction',
  '__defineMacro',
  '__domTree'
]

exec
/usr/local/bin/zsh -lc "tail -30 website/content/periodic-table-sources.md; nl -ba website/content/periodic-table.md | tail -35; rg -n '\\\\\\\\|\\\\[a-zA-Z]+' website/content/manifest.json | head -3" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
[32] Faria da Veiga–O'Carroll, arXiv:2509.03513 — https://arxiv.org/abs/2509.03513 (published 2025-09-03, accessed 2026-10-29)
[33] Nair, arXiv:2608.10133 — https://arxiv.org/abs/2608.10133 (published 2026-08-10, accessed 2026-10-29)
[34] Baez–Dolan, arXiv:q-alg/9503002 — https://arxiv.org/abs/q-alg/9503002 (published 1995-03-05, accessed 2026-10-29)
[35] Lurie, arXiv:0905.0465 — https://arxiv.org/abs/0905.0465 (published 2009-05-04, accessed 2026-10-29)
[36] Topological quantum field theory (nLab) — https://ncatlab.org/nlab/show/topological+quantum+field+theory (accessed 2026-10-29)
[37] Butterfield–Isham, arXiv:quant-ph/9803055 — https://arxiv.org/abs/quant-ph/9803055 (published 1998-03-20, accessed 2026-10-29)
[38] Isham–Döring, arXiv:quant-ph/0703060 — https://arxiv.org/abs/quant-ph/0703060 (published 2007-03-07, accessed 2026-10-29)
[39] Isham, arXiv:1004.3564 — https://arxiv.org/abs/1004.3564 (published 2010-04-20, accessed 2026-10-29)
[40] Wilson–Hefford–Hoffreumon, arXiv:2602.23865 — https://arxiv.org/abs/2602.23865 (published 2026-02-27, accessed 2026-10-29)
[41] Hefford–Wilson, arXiv:2402.02997 — https://arxiv.org/abs/2402.02997 (published 2024-02-05, accessed 2026-10-29)
[42] Gelfand–Naimark theorem (nLab) — https://ncatlab.org/nlab/show/Gelfand-Naimark+theorem (accessed 2026-10-29)
[43] Gelfand duality (nLab) — https://ncatlab.org/nlab/show/Gelfand+duality (accessed 2026-10-29)
[44] Stone duality (nLab) — https://ncatlab.org/nlab/show/Stone+duality (accessed 2026-10-29)
[45] Ryu–Takayanagi, arXiv:hep-th/0603001 — https://arxiv.org/abs/hep-th/0603001 (published 2006-02-28, accessed 2026-10-29)
[46] Dong–Harlow–Wall, arXiv:1601.05416 — https://arxiv.org/abs/1601.05416 (published 2016-01-20, accessed 2026-10-29)
[47] Bao–Nezami–Ooguri–Stoica–Sully–Walter, arXiv:1505.07839 — https://arxiv.org/abs/1505.07839 (published 2015-05-28, accessed 2026-10-29)
[48] Pastawski–Yoshida–Harlow–Preskill, arXiv:1503.06237 — https://arxiv.org/abs/1503.06237 (published 2015-03-20, accessed 2026-10-29)
[49] Van Raamsdonk, arXiv:1005.3035 — https://arxiv.org/abs/1005.3035 (published 2010-05-17, accessed 2026-10-29)
[50] Minguzzi–Sánchez, arXiv:gr-qc/0609119 — https://arxiv.org/abs/gr-qc/0609119 (published 2006-09-26, accessed 2026-10-29)
[51] Galaev, arXiv:1611.01551 — https://arxiv.org/abs/1611.01551 (published 2016-11-04, accessed 2026-10-29)
[52] Petz–Sudar, arXiv:quant-ph/0102132 — https://arxiv.org/abs/quant-ph/0102132 (published 2001-02-27, accessed 2026-10-29)
[53] Adyan–Rabin theorem — https://en.wikipedia.org/wiki/Adian%E2%80%93Rabin_theorem (accessed 2026-10-29)
[54] Tancer, arXiv:2310.07421 — https://arxiv.org/abs/2310.07421 (published 2023-10-11, accessed 2026-10-29)
[55] Bekkert–Drozd, arXiv:math/0310352 — https://arxiv.org/abs/math/0310352 (published 2003-10-22, accessed 2026-10-29)
[56] Buchweitz–Leuschke, arXiv:math/0505315 — https://arxiv.org/abs/math/0505315 (published 2005-05-15, accessed 2026-10-29)
[57] Grochow–Qiao, arXiv:1507.01917 — https://arxiv.org/abs/1507.01917 (published 2015-07-07, accessed 2026-10-29)
[58] Grevstad–May, arXiv:2509.17604 — https://arxiv.org/abs/2509.17604 (published 2025-09-22, accessed 2026-10-29)
[59] Sasyk–Tørnquist, arXiv:0909.2657 — https://arxiv.org/abs/0909.2657 (published 2009-09-14, accessed 2026-10-29)
[60] Geometrization conjecture — https://en.wikipedia.org/wiki/Geometrization_conjecture (accessed 2026-10-29)
[61] Unknotting problem — https://en.wikipedia.org/wiki/Unknotting_problem (accessed 2026-10-29)
   105	| 4D YM/QCD existence | Family VII/QFT | Existence claimed 2026-10-26 (QCD, GUT completion, pure YM subproblem, Balaban-based); 1147-page manuscript unpublished; claimed Lean formalization withheld; KITP verification pending | **CLAIMED** — never conflated with mass gap | [24][25][26] |
   106	| Quantum monotone metrics | Family V | Classified parametrically by operator monotone functions (Petz–Sudar) — not a finite list | **OPEN** (classification not finite) | [52] |
   107	| General II₁ / III factors | Family II | Coarse Connes-spectrum strata only; fundamental groups vary | **IMPOSSIBLE** globally [8]; residual strata **OPEN** | [8] |
   108	| Uniform parameterization of finite simple groups | Group theory | CFSG complete; "no clean uniform description… is known" [1] | **OPEN** | [1] |
   109	| Freed–Hopkins anomaly classification statement | Family IV | Cobordism-spectrum statement not retrieved; primary source needed | **OPEN** | [19] context |
   110	| Type-III factor structure beyond Connes spectrum | Family II | Coarse strata; examples with countable and trivial fundamental groups | **OPEN** | [8] |
   111	
   112	---
   113	
   114	## (f) Obstructions region — where no table exists
   115	
   116	A periodic table must mark where no table can exist. Each entry below is a **theorem**, not a difficulty.
   117	
   118	| Obstruction | Statement | What it forbids | Status | Sources |
   119	|---|---|---|---|---|
   120	| Adyan–Rabin | Every Markov property of finitely presentable groups is algorithmically undecidable — including finiteness and simplicity (Collins extended beyond Markov properties) | Any uniform recognition procedure for group-flavored sectors | **IMPOSSIBLE** | [53] |
   121	| McDuff | Uncountably many non-isomorphic separable type II₁ factors | CFSG-style total classification of factors outside the amenable case | **IMPOSSIBLE** | [8] |
   122	| Wildness (derived-wild; Buchweitz–Leuschke; Grevstad–May) | Rank-2 isomorphism classes of the generic determinant's Cohen–Macaulay modules are not parametrizable by a finite-dimensional variety; "no meaningful classification" of compact C_p-equivariant HF_p-modules at odd primes; wildness is degeneration-robust | Finite-variety parameterization of wild representation categories | **IMPOSSIBLE** | [55][56][58] |
   123	| Tame/wild tractability boundary (Grochow–Qiao) | Polynomial-time group isomorphism for tame extensions; required bounds fail in the wild case | Algorithmic classification in wild regimes | **IMPOSSIBLE** (wild side) | [57] |
   124	| Borel reducibility / turbulence (Sasyk–Tørnquist) | Von Neumann algebra isomorphism admits no classification by countable invariants | Countable-invariant classifications of vN algebras | **IMPOSSIBLE** [single source; announcement-level] | [59] |
   125	| Dimension-4 unrecognizability (Tancer; Gordon) | #₉(S²×S²) homeomorphism is algorithmically unrecognizable (improving #₁₂) | Effective classification of 4-manifolds in general | **IMPOSSIBLE** | [54][60] |
   126	| Etingof–Gelaki | Isocategorical groups: tensor equivalence without symmetric structure does not determine the group | Equivalence notions that discard the monoidal/symmetric layer | **IMPOSSIBLE** | [12] |
   127	| Unknotting problem | Unknot recognition is in NP and coNP; P-membership open | — (a "decidable but unclassified" middle regime) | **OPEN** | [61] |
   128	| Darboux triviality | Symplectic geometry has no local invariants | Local classification content on the symplectic side (classification must be global) | **PROVEN** (trivially classified locally) | [6] |
   129	
   130	**Regime contrast.** Geometrization decomposes 3-manifolds into exactly 8 Thurston geometries [60] — finite tables exist, but only in tame regimes (dimension 3, not 4 [54][60]). The synthesis offered to the program is that one should expect restricted-class classification theorems plus explicit obstruction theorems, not one global periodic table; this synthesis is *conjectural*.
   131	
   132	---
   133	
   134	## Reading the table
   135	
   136	1. **PROVEN** cells are citations to completed theorems; **IMPOSSIBLE** cells are citations to impossibility theorems — both are knowledge.
   137	2. **CLAIMED** appears exactly once as a classification-status cell (4D YM/QCD existence) [24][25][26]; existence and mass gap are never conflated [23][26].
   138	3. **OPEN** cells mark where the series' own conjecture (T-CMRPS-01) and its five obligations live; the table is the chart that conjecture would complete.
   139	4. Every equivalences entry names the structure it preserves, or records the failure that follows from not naming it [12].
60:    "abstract": "This paper classifies restricted classes of classical physical systems: symplectic and Poisson systems and classical statistical systems. The central structural fact is an inversion of the Riemannian situation. Darboux\u2019s theorem removes every local symplectic invariant, so the classification content",
61:    "abstractFull": "This paper classifies restricted classes of classical physical systems: symplectic and Poisson systems and classical statistical systems. The central structural fact is an inversion of the Riemannian situation. Darboux\u2019s theorem removes every local symplectic invariant, so the classification content of Hamiltonian mechanics is global and topological. On the Poisson side, Weinstein\u2019s splitting theorem replaces local rigidity by a rank stratification into symplectic leaves and transverse data, and coadjoint orbits tie the homogeneous case to the Dynkin classification of simple Lie algebras and the highest-weight classification of their finite-dimensional representations. On the statistical side, Chentsov\u2019s theorem singles out the Fisher metric as the unique metric monotone under stochastic maps, while the quantum analogue is parametric rather than unique. The results include one complete local classification theorem, one rank normal form, one uniqueness theorem, and two restricted global classification theorems, each stated with hypotheses and proof or proof reference. The limitation that matters most is scope: no global classification theorem for closed symplectic manifolds is claimed or available, decomposition uniqueness is open outside restricted subclasses, and the deformation-quantization bridge to quantum theory remains conjectural. Computational experiments exhibit the local normal forms and supply executable models; they are evidence, not proofs.",
74:    "abstractFull": "Quantum physical systems admit a complete structural classification only in restricted regimes, and this paper records where those regimes begin and end. Finite-dimensional observable algebras are classified by one combinatorial invariant, the dimension vector of the block decomposition. Amenable operator-algebraic models are classified by Murray-von Neumann type together with Connes invariants. Completely positive maps admit a canonical normal form through minimal Stinespring dilations, unique up to unitary equivalence, and the Kraus rank of that normal form is not an isomorphism invariant of channels. Beyond the amenable class no finite answer is possible: uncountably many pairwise non-isomorphic separable factors exist, so no finite list of factor types can be exhaustive. On the categorical side, the Doplicher-Roberts reconstruction theorem and Deligne\u2019s theorem classify superselection and symmetric tensor categories under explicit hypotheses, and the Etingof-Gelaki examples show that any equivalence forgetting the symmetric structure fails to recover its group. Quantum monotone metrics form a parametric family rather than a unique choice. The paper separates classified islands from proved impossibilities and open problems, and reports executable models of the finite-dimensional taxonomy as computational evidence only.",

exec
/usr/local/bin/zsh -lc "rg -n 'og:type|og:url|openGraph.type' website/node_modules/next/dist/lib/metadata/generate/opengraph.js | head -15; sed -n '113,140p' website/node_modules/next/dist/lib/metadata/resolvers/resolve-opengraph.js; sed -n '137,153p' website/node_modules/next/dist/lib/metadata/resolve-metadata.js; nl -ba website/content/papers/vol-04-yoneda-classification.html | sed -n '133,138p'; nl -ba website/app/globals.css | sed -n '708,728p'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
35:        const openGraphType = openGraph.type;
40:                        property: "og:type",
49:                        property: "og:type",
81:                        property: "og:type",
105:                        property: "og:type",
130:                        property: "og:type",
150:                        property: "og:type",
170:                        property: "og:type",
186:                        property: "og:type",
198:                        property: "og:type",
230:                        property: "og:type",
266:                        property: "og:type",
274:                        property: "og:type",
298:            property: "og:url",
const resolveOpenGraph = (openGraph, metadataBase, metadataContext, titleTemplate)=>{
    if (!openGraph) return null;
    function resolveProps(target, og) {
        const ogType = og && "type" in og ? og.type : undefined;
        const keys = getFieldsByOgType(ogType);
        for (const k of keys){
            const key = k;
            if (key in og && key !== "url") {
                const value = og[key];
                if (value) {
                    const arrayValue = (0, _utils.resolveAsArrayOrUndefined)(value);
                    target[key] = arrayValue;
                }
            }
        }
        target.images = resolveImages(og.images, metadataBase, metadataContext.isStandaloneMode);
    }
    const resolved = {
        ...openGraph,
        title: (0, _resolvetitle.resolveTitle)(openGraph.title, titleTemplate)
    };
    resolveProps(resolved, openGraph);
    resolved.url = openGraph.url ? (0, _resolveurl.resolveAbsoluteUrlWithPathname)(openGraph.url, metadataBase, metadataContext) : null;
    return resolved;
};
const TwitterBasicInfoKeys = [
    "site",
    "siteId",
                    break;
                }
            case "alternates":
                {
                    target.alternates = (0, _resolvebasics.resolveAlternates)(source.alternates, metadataBase, metadataContext);
                    break;
                }
            case "openGraph":
                {
                    target.openGraph = (0, _resolveopengraph.resolveOpenGraph)(source.openGraph, metadataBase, metadataContext, titleTemplates.openGraph);
                    break;
                }
            case "twitter":
                {
                    target.twitter = (0, _resolveopengraph.resolveTwitter)(source.twitter, metadataBase, metadataContext, titleTemplates.twitter);
                    break;
                }
   133	<p><em>Proof.</em> The assignment is linear in <span class="math inline">\(\Phi\)</span> by construction. Write <span class="math inline">\(\Phi^{ij,kl}\)</span> for the elementary linear maps <span class="math inline">\(\Phi^{ij,kl}(X) = \mathop{\mathrm{Tr}}(E_{ji} X)\, E_{kl}\)</span>; these form a basis of <span class="math inline">\(L(M_n, M_m)\)</span>, and <span class="math inline">\(J(\Phi^{ij,kl}) = E_{ij} \otimes E_{kl}\)</span>. The elements <span class="math inline">\(E_{ij} \otimes E_{kl}\)</span> form a basis of <span class="math inline">\(M_n \otimes M_m\)</span>, so the assignment carries a basis to a basis between vector spaces of the same dimension <span class="math inline">\(n^2 m^2\)</span> and is therefore bijective. Complete positivity corresponds to positivity of <span class="math inline">\(J(\Phi)\)</span>, which is the standard matrix-unit characterization. For the trace condition, the partial trace <span class="math inline">\(\mathop{\mathrm{Tr}}_m J(\Phi)\)</span> has entries <span class="math inline">\(\mathop{\mathrm{Tr}}(\Phi(E_{ij}))\)</span>, and <span class="math inline">\(\Phi\)</span> is trace preserving exactly when <span class="math inline">\(\mathop{\mathrm{Tr}}(\Phi(E_{ij})) = \mathop{\mathrm{Tr}}(E_{ij}) = \delta_{ij}\)</span> for all <span class="math inline">\(i, j\)</span>, which says <span class="math inline">\(\mathop{\mathrm{Tr}}_m J(\Phi) = \sum_i E_{ii} = I_n\)</span>. For the composition identity, write <span class="math inline">\(\Phi(E_{ij}) = \sum_{k,l} c^{ij}_{kl} E_{kl}\)</span>. Then <span class="math inline">\(J(\Phi)_{(ik),(jl)} = c^{ij}_{kl}\)</span> and <span class="math inline">\(J(\Psi)_{(k\alpha),(l\beta)} = \Psi(E_{kl})_{\alpha\beta}\)</span>. The right-hand side of the claimed identity is <span class="math inline">\(\sum_{k,l} c^{ij}_{kl} \Psi(E_{kl})_{\alpha\beta} = \Psi(\Phi(E_{ij}))_{\alpha\beta}\)</span>, which is <span class="math inline">\(J(\Psi \circ \Phi)_{(i\alpha),(j\beta)}\)</span> by definition. ◻</p>
   134	</div>
   135	<div id="rem:worked" class="remark">
   136	<p><em>Remark 19</em> (Worked instance of the contraction).  Take <span class="math inline">\(n = m = 2\)</span>, let <span class="math inline">\(\Phi\)</span> be the completely depolarizing channel <span class="math inline">\(\Phi(X) = \mathop{\mathrm{Tr}}(X)\, I/2\)</span>, and let <span class="math inline">\(\Psi\)</span> be the identity channel. Then <span class="math inline">\(J(\Phi) = \tfrac{1}{2} I \otimes I\)</span> and <span class="math inline">\(J(\Psi) = |\Omega\rangle\langle\Omega|\)</span> with <span class="math inline">\(|\Omega\rangle = \sum_{k} |kk\rangle\)</span> the unnormalized maximally entangled vector; both are positive semidefinite with <span class="math inline">\(\mathop{\mathrm{Tr}}_m J = I\)</span>. The contraction of <a href="#eq:choi-comp" class="reflink">(1)</a> reads <span class="math inline">\(\sum_{k,l} J(\Phi)_{(ik),(jl)} \delta_{k\alpha} \delta_{l\beta} = \tfrac{1}{2} \delta_{ij} \delta_{\alpha\beta}\)</span>, which is <span class="math inline">\(J(\Psi \circ \Phi) = J(\Phi)\)</span>, since <span class="math inline">\(\Psi \circ \Phi = \Phi\)</span>. The experiment of <a href="#sec:computation" data-reference-type="ref+label" data-reference="sec:computation">7</a> checks the same identity on sampled channels with random Kraus operators.</p>
   137	</div>
   138	<p>Proposition <a href="#prop:choi" data-reference-type="ref" data-reference="prop:choi">18</a> is the concrete setting in which channel-state duality is exact: the channel is a state on the composed system, and composition is an index contraction. The category of Remark <a href="#ex:process" data-reference-type="ref" data-reference="ex:process">7</a> records the fragment of process morphisms without auxiliary memory; the theorem below covers supermaps in the full sense of <a class="citation" href="#bib-whh">[1]</a>, <a class="citation" href="#bib-hw">[2]</a>, where ancillary systems may bridge input and output, and the presheaf of the restricted category is the fragment of that structure on pre- and post-processings.</p>
   708	  max-width: 100%;
   709	  padding: 0.35rem 0;
   710	}
   711	
   712	.paper-content .math-inline-rendered,
   713	.paper-content .math.inline {
   714	  display: inline;
   715	  max-width: 100%;
   716	}
   717	
   718	.paper-content .katex-display {
   719	  margin: 0.55rem 0;
   720	  overflow-x: auto;
   721	  overflow-y: hidden;
   722	}
   723	
   724	.paper-content .katex {
   725	  font-size: 1.06em;
   726	}
   727	
   728	.paper-content .math-display-rendered .katex-display > .katex {

codex
The website-only math check found no KaTeX errors or leftover delimiters, and all paper fragment links and periodic-table citation targets resolve. I found incomplete homepage Open Graph metadata and public copy that still points readers to an internal report. I’m making one final check for unbreakable inline formulas on mobile.
exec
/usr/local/bin/zsh -lc "node -e '
const fs=require(\"fs\"),k=require(\"./website/node_modules/katex\"),{JSDOM}=require(\"./website/node_modules/jsdom\");let a=[];for(const f of fs.readdirSync(\"website/content/papers\")){const raw=fs.readFileSync(\"website/content/papers/\"+f,\"utf8\");for(const m of raw.matchAll(/<span class=\"math inline\">\\\\\\(([\\s\\S]*?)\\\\\\)<\\/span>/g)){const tex=m[1].replace(/&amp;/g,\"&\").replace(/&lt;/g,\"<\").replace(/&gt;/g,\">\").replace(/&#39;/g,\"\\u0027\");const el=JSDOM.fragment(k.renderToString(tex,{throwOnError:false}));for(const b of el.querySelectorAll(\".katex-html > .base\"))a.push({file:f,line:raw.slice(0,m.index).split(\"\\n\").length,text:b.textContent,tex});}}console.log(JSON.stringify(a.sort((x,y)=>y.text.length-x.text.length).slice(0,8)));
'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 1643ms:
[]

exec
/usr/local/bin/zsh -lc "node -e 'console.log(require(\"./website/node_modules/katex\").renderToString(\"a=b+c\"))'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
<span class="katex"><span class="katex-mathml"><math xmlns="http://www.w3.org/1998/Math/MathML"><semantics><mrow><mi>a</mi><mo>=</mo><mi>b</mi><mo>+</mo><mi>c</mi></mrow><annotation encoding="application/x-tex">a=b+c</annotation></semantics></math></span><span class="katex-html" aria-hidden="true"><span class="katex-base"><span class="katex-strut" style="height:0.4306em;"></span><span class="mord mathnormal">a</span><span class="mspace" style="margin-right:0.2778em;"></span><span class="mrel">=</span><span class="mspace" style="margin-right:0.2778em;"></span></span><span class="katex-base"><span class="katex-strut" style="height:0.7778em;vertical-align:-0.0833em;"></span><span class="mord mathnormal">b</span><span class="mspace" style="margin-right:0.2222em;"></span><span class="mbin">+</span><span class="mspace" style="margin-right:0.2222em;"></span></span><span class="katex-base"><span class="katex-strut" style="height:0.4306em;"></span><span class="mord mathnormal">c</span></span></span></span>

exec
/usr/local/bin/zsh -lc "node -e '
const fs=require(\"fs\"),k=require(\"./website/node_modules/katex\"),{JSDOM}=require(\"./website/node_modules/jsdom\");let a=[];for(const f of fs.readdirSync(\"website/content/papers\")){const raw=fs.readFileSync(\"website/content/papers/\"+f,\"utf8\");for(const m of raw.matchAll(/<span class=\"math inline\">\\\\\\(([\\s\\S]*?)\\\\\\)<\\/span>/g)){const tex=m[1].replace(/&amp;/g,\"&\").replace(/&lt;/g,\"<\").replace(/&gt;/g,\">\").replace(/&#39;/g,\"\\u0027\");const el=JSDOM.fragment(k.renderToString(tex,{throwOnError:false}));for(const b of el.querySelectorAll(\".katex-html > .katex-base\"))a.push({file:f,line:raw.slice(0,m.index).split(\"\\n\").length,text:b.textContent,tex});}}console.log(JSON.stringify(a.sort((x,y)=>y.text.length-x.text.length).slice(0,5)));
'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 1930ms:
[{"file":"vol-09-gravity-information-geometry.html","line":157,"text":"(λ+2​2ε​λ+​λ−​​​2ε​λ+​λ−​​λ−2​​)","tex":"\\sqrt{\\rho}\\, \\sigma \\sqrt{\\rho} = \\left(\\begin{smallmatrix} \\lambda_+^2 & \\tfrac{\\varepsilon}{2}\\sqrt{\\lambda_+ \\lambda_-} \\\\ \\tfrac{\\varepsilon}{2}\\sqrt{\\lambda_+ \\lambda_-} & \\lambda_-^2 \\end{smallmatrix}\\right)"},{"file":"vol-09-gravity-information-geometry.html","line":116,"text":"diag((1/2)/(3/4),(−1/2)/(1/4))=","tex":"L = \\operatorname{diag}\\bigl((1/2)/(3/4), (-1/2)/(1/4)\\bigr) = \\operatorname{diag}(2/3, -2)"},{"file":"vol-12-principia-physica.html","line":29,"text":"Classify(admissible structures)","tex":"\\mathcal{M} = \\mathrm{Classify}(\\text{admissible structures})"},{"file":"vol-04-yoneda-classification.html","line":136,"text":"∑k,l​J(Φ)(ik),(jl)​δkα​δlβ​=","tex":"\\sum_{k,l} J(\\Phi)_{(ik),(jl)} \\delta_{k\\alpha} \\delta_{l\\beta} = \\tfrac{1}{2} \\delta_{ij} \\delta_{\\alpha\\beta}"},{"file":"vol-09-gravity-information-geometry.html","line":310,"text":"diag(1,sin2χ,sin2χsin2θ)","tex":"\\operatorname{diag}(1, \\sin^2\\!\\chi, \\sin^2\\!\\chi \\sin^2\\!\\theta)"}]

codex
1. **Homepage omits `og:type` and `og:url`.** [website/app/page.tsx:5](/Users/mlong/Documents/Development/classification-physical-systems/website/app/page.tsx:5) replaces the layout’s `openGraph` object with an images-only object. Next’s metadata merge does not preserve the parent’s `type`, and neither object supplies the homepage URL. **Fix:** add `type: 'website'` and `url: '/'` to homepage metadata, retaining the image.

2. **Public copy still contains internal process references.**
   - [website/content/periodic-table.md:16](/Users/mlong/Documents/Development/classification-physical-systems/website/content/periodic-table.md:16) directs readers to `research/cmrps-research-map/REPORT.md`, although citations now resolve to the published Sources section. **Fix:** replace this with “Bracketed citations link to the Sources section below.”
   - [website/content/papers/synthesis.html:2](/Users/mlong/Documents/Development/classification-physical-systems/website/content/papers/synthesis.html:2) ends with “The cross-volume consistency report records…” **Fix:** state the substantive relationship directly: “The twelve parts use shared definitions, dependency conventions, and claim terminology.”

Checks passed: all 13 paper bodies rendered without KaTeX errors or leftover math delimiters using the website-only macro fallback; paper fragment targets, periodic-table citation targets, and manifest-linked HTML/PDF/image assets resolve. Periodic-table and synthesis pages exist; Twitter metadata is configured.

No definite mobile overflow or navigation collision emerged from source inspection. Actual 375px layout and external URL availability were not verified.

VERDICT: NEEDS_FIX
hook: Stop
hook: Stop Completed
tokens used
80,224
1. **Homepage omits `og:type` and `og:url`.** [website/app/page.tsx:5](/Users/mlong/Documents/Development/classification-physical-systems/website/app/page.tsx:5) replaces the layout’s `openGraph` object with an images-only object. Next’s metadata merge does not preserve the parent’s `type`, and neither object supplies the homepage URL. **Fix:** add `type: 'website'` and `url: '/'` to homepage metadata, retaining the image.

2. **Public copy still contains internal process references.**
   - [website/content/periodic-table.md:16](/Users/mlong/Documents/Development/classification-physical-systems/website/content/periodic-table.md:16) directs readers to `research/cmrps-research-map/REPORT.md`, although citations now resolve to the published Sources section. **Fix:** replace this with “Bracketed citations link to the Sources section below.”
   - [website/content/papers/synthesis.html:2](/Users/mlong/Documents/Development/classification-physical-systems/website/content/papers/synthesis.html:2) ends with “The cross-volume consistency report records…” **Fix:** state the substantive relationship directly: “The twelve parts use shared definitions, dependency conventions, and claim terminology.”

Checks passed: all 13 paper bodies rendered without KaTeX errors or leftover math delimiters using the website-only macro fallback; paper fragment targets, periodic-table citation targets, and manifest-linked HTML/PDF/image assets resolve. Periodic-table and synthesis pages exist; Twitter metadata is configured.

No definite mobile overflow or navigation collision emerged from source inspection. Actual 375px layout and external URL availability were not verified.

VERDICT: NEEDS_FIX
