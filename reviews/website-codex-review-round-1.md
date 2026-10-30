---
reviewer: codex (OpenAI) gpt-6.1-sol
type: website
round: 1
date: 2026-10-30T14:13:08Z
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
session id: 01a18d28-43c9-7042-aa4c-0db9b5c423f1
--------
user
Read ONLY the website/ source (do not explore other directories). Review for: broken KaTeX math (raw TeX leaking into HTML), horizontal overflow at 375px width, nav collisions on small screens, missing OG/Twitter meta tags, missing run-level summary pages (e.g. a periodic-table page when the run has one), dead links, and any process/reviewer language in public copy. List issues with file:line references and concrete fixes. End with VERDICT: PASS or VERDICT: NEEDS_FIX.
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
I’ll review only `website/` source for the requested rendering, navigation, metadata, link, and public-copy issues.
exec
/usr/local/bin/zsh -lc 'rg --files website' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
website/tsconfig.json
website/lib/render-math.ts
website/lib/papers.ts
website/lib/macros.ts
website/package.json
website/package-lock.json
website/tailwind.config.ts
website/README.md
website/public/og/vol-10-observational-equivalence.png
website/public/og/vol-04-yoneda-classification.png
website/public/og/vol-07-gauge-qft.png
website/public/og/vol-08-spacetime-reconstruction.png
website/public/og/vol-05-classical-systems.png
website/public/og/og-default.png
website/public/og/vol-02-structural-families.png
website/public/og/og-image.png
website/public/og/vol-09-gravity-information-geometry.png
website/public/og/synthesis.png
website/public/og/vol-03-irreducibility-decomposition.png
website/public/og/vol-06-quantum-systems.png
website/public/og/vol-11-completeness-obstructions.png
website/public/og/vol-12-principia-physica.png
website/public/og/vol-01-foundations.png
website/content/manifest.json
website/components/TableOfContents.tsx
website/components/PaperContent.tsx
website/theme.json
website/next.config.mjs
website/postcss.config.mjs
website/content/periodic-table.md
website/public/pdf/vol-03-irreducibility-decomposition.pdf
website/public/pdf/vol-06-quantum-systems.pdf
website/public/pdf/vol-01-foundations.pdf
website/public/pdf/vol-11-completeness-obstructions.pdf
website/public/pdf/vol-12-principia-physica.pdf
website/public/pdf/synthesis.pdf
website/public/pdf/vol-09-gravity-information-geometry.pdf
website/public/pdf/vol-07-gauge-qft.pdf
website/public/pdf/vol-04-yoneda-classification.pdf
website/public/pdf/vol-10-observational-equivalence.pdf
website/public/pdf/vol-05-classical-systems.pdf
website/public/pdf/vol-08-spacetime-reconstruction.pdf
website/public/pdf/vol-02-structural-families.pdf
website/app/globals.css
website/app/layout.tsx
website/app/page.tsx
website/app/favicon.ico
website/content/papers/vol-12-principia-physica.html
website/content/papers/vol-09-gravity-information-geometry.html
website/content/papers/vol-05-classical-systems.html
website/content/papers/vol-07-gauge-qft.html
website/content/papers/synthesis.html
website/content/papers/vol-08-spacetime-reconstruction.html
website/content/papers/vol-02-structural-families.html
website/content/papers/vol-11-completeness-obstructions.html
website/content/papers/vol-10-observational-equivalence.html
website/content/papers/vol-04-yoneda-classification.html
website/content/papers/vol-01-foundations.html
website/content/papers/vol-06-quantum-systems.html
website/content/papers/vol-03-irreducibility-decomposition.html
website/app/periodic-table/page.tsx
website/app/papers/[slug]/page.tsx
website/app/fonts/GeistVF.woff
website/app/fonts/GeistMonoVF.woff

exec
/usr/local/bin/zsh -lc 'nl -ba website/lib/render-math.ts; nl -ba website/components/PaperContent.tsx; nl -ba website/components/TableOfContents.tsx; nl -ba website/app/globals.css' in /Users/mlong/Documents/Development/classification-physical-systems
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
    18	  try {
    19	    return katex.renderToString(unescapeHtml(tex).trim(), {
    20	      displayMode,
    21	      throwOnError: false,
    22	      trust: true,
    23	      macros: getMacros(),
    24	      strict: false,
    25	    });
    26	  } catch {
    27	    return katex.renderToString(unescapeHtml(tex).trim(), {
    28	      displayMode,
    29	      throwOnError: false,
    30	      trust: true,
    31	      macros: getMacros(),
    32	      strict: false,
    33	      output: 'html',
    34	    });
    35	  }
    36	}
    37	
    38	/**
    39	 * Build-time math pre-rendering: replace every math delimiter in the HTML
    40	 * string with KaTeX-rendered static markup. Handles the pandoc spans
    41	 * (<span class="math inline">\(...\)</span>, <span class="math display">\[...\]</span>)
    42	 * as well as bare \[...\], $$...$$, \(...\), $...$ delimiters.
    43	 */
    44	export function renderMath(html: string): string {
    45	  // 1. pandoc-style spans (content delimited by \( \) or \[ \])
    46	  let out = html.replace(
    47	    /<span class="math (inline|display)"([^>]*)>([\s\S]*?)<\/span>/g,
    48	    (_all, kind: string, attrs: string, inner: string) => {
    49	      const displayMode = kind === 'display';
    50	      let tex = inner.trim();
    51	      if (tex.startsWith('\\(') && tex.endsWith('\\)')) tex = tex.slice(2, -2);
    52	      else if (tex.startsWith('\\[') && tex.endsWith('\\]')) tex = tex.slice(2, -2);
    53	      else if (tex.startsWith('$$') && tex.endsWith('$$')) tex = tex.slice(2, -2);
    54	      const idMatch = attrs.match(/id="([^"]+)"/);
    55	      const anchor = idMatch ? ` data-eqid="${idMatch[1]}"` : '';
    56	      return `<span class="math-rendered"${anchor}>${renderOne(tex, displayMode)}</span>`;
    57	    },
    58	  );
    59	
    60	  // 2. display: $$...$$ then \[...\]
    61	  out = out.replace(/\$\$([\s\S]+?)\$\$/g, (_all, tex: string) =>
    62	    `<span class="math-rendered">${renderOne(tex, true)}</span>`);
    63	  out = out.replace(/\\\[([\s\S]+?)\\\]/g, (_all, tex: string) =>
    64	    `<span class="math-rendered">${renderOne(tex, true)}</span>`);
    65	
    66	  // 3. inline: \(...\) then $...$
    67	  out = out.replace(/\\\(([\s\S]+?)\\\)/g, (_all, tex: string) =>
    68	    `<span class="math-rendered">${renderOne(tex, false)}</span>`);
    69	  out = out.replace(/\$([^$\n][\s\S]*?)\$/g, (_all, tex: string) =>
    70	    `<span class="math-rendered">${renderOne(tex, false)}</span>`);
    71	
    72	  return out;
    73	}
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
    30	  -webkit-text-size-adjust: 100%;
    31	}
    32	
    33	body {
    34	  background: var(--bg);
    35	  color: var(--text);
    36	  font-family: var(--font-body);
    37	  line-height: 1.65;
    38	  margin: 0;
    39	  overflow-x: hidden;
    40	}
    41	
    42	a {
    43	  color: var(--accent);
    44	  text-decoration: none;
    45	}
    46	a:hover {
    47	  color: var(--accent-hover);
    48	}
    49	
    50	h1, h2, h3, h4, h5 {
    51	  font-family: var(--font-heading);
    52	  color: var(--text);
    53	  line-height: 1.25;
    54	  overflow-wrap: break-word;
    55	}
    56	
    57	/* ---------- header / nav ---------- */
    58	
    59	.site-header {
    60	  position: sticky;
    61	  top: 0;
    62	  z-index: 50;
    63	  background: rgba(7, 10, 22, 0.92);
    64	  backdrop-filter: blur(10px);
    65	  border-bottom: 1px solid var(--border);
    66	}
    67	
    68	.site-header-inner {
    69	  max-width: 1120px;
    70	  margin: 0 auto;
    71	  padding: 0.75rem 1rem;
    72	  display: flex;
    73	  flex-wrap: wrap;
    74	  align-items: center;
    75	  gap: 0.5rem 1.25rem;
    76	}
    77	
    78	.site-title {
    79	  font-family: var(--font-heading);
    80	  font-weight: 700;
    81	  font-size: 1.05rem;
    82	  letter-spacing: 0.04em;
    83	  color: var(--text);
    84	  display: flex;
    85	  align-items: center;
    86	  gap: 0.55rem;
    87	  min-width: 0;
    88	  flex: 1 1 auto;
    89	}
    90	
    91	.site-title .mark {
    92	  color: var(--accent-secondary);
    93	  font-family: var(--font-body);
    94	  font-size: 0.72rem;
    95	  font-weight: 600;
    96	  letter-spacing: 0.18em;
    97	  border: 1px solid var(--border);
    98	  border-radius: 4px;
    99	  padding: 0.15rem 0.4rem;
   100	  white-space: nowrap;
   101	}
   102	
   103	.site-nav {
   104	  display: flex;
   105	  flex-wrap: wrap;
   106	  gap: 0.35rem 1rem;
   107	  font-size: 0.88rem;
   108	}
   109	
   110	.site-nav a {
   111	  color: var(--text-muted);
   112	  padding: 0.25rem 0;
   113	  border-bottom: 2px solid transparent;
   114	}
   115	.site-nav a:hover {
   116	  color: var(--text);
   117	  border-bottom-color: var(--accent);
   118	}
   119	
   120	/* ---------- hero ---------- */
   121	
   122	.hero {
   123	  position: relative;
   124	  padding: 3rem 1rem 2.25rem;
   125	  overflow: hidden;
   126	  border-bottom: 1px solid var(--border);
   127	}
   128	
   129	@media (min-width: 768px) {
   130	  .hero {
   131	    padding: 5.5rem 1.5rem 4.5rem;
   132	  }
   133	}
   134	
   135	.hero-bg {
   136	  position: absolute;
   137	  inset: 0;
   138	  pointer-events: none;
   139	  background:
   140	    radial-gradient(900px 380px at 82% -10%, rgba(109, 140, 255, 0.18), transparent 65%),
   141	    radial-gradient(700px 320px at 8% 110%, rgba(34, 211, 238, 0.12), transparent 60%);
   142	}
   143	
   144	.hero-grid-lines {
   145	  position: absolute;
   146	  inset: 0;
   147	  pointer-events: none;
   148	  opacity: 0.5;
   149	  background-image:
   150	    linear-gradient(var(--border) 1px, transparent 1px),
   151	    linear-gradient(90deg, var(--border) 1px, transparent 1px);
   152	  background-size: 72px 72px;
   153	  mask-image: radial-gradient(ellipse 90% 80% at 50% 0%, black 20%, transparent 78%);
   154	  -webkit-mask-image: radial-gradient(ellipse 90% 80% at 50% 0%, black 20%, transparent 78%);
   155	}
   156	
   157	.hero-inner {
   158	  position: relative;
   159	  max-width: 1120px;
   160	  margin: 0 auto;
   161	}
   162	
   163	.hero-kicker {
   164	  color: var(--accent-secondary);
   165	  font-size: 0.78rem;
   166	  font-weight: 600;
   167	  letter-spacing: 0.22em;
   168	  text-transform: uppercase;
   169	  margin: 0 0 1rem;
   170	}
   171	
   172	.hero h1 {
   173	  font-size: clamp(1.9rem, 5.4vw, 3.4rem);
   174	  margin: 0 0 1rem;
   175	  max-width: 20em;
   176	}
   177	
   178	.hero h1 .em {
   179	  color: var(--accent);
   180	  font-style: italic;
   181	}
   182	
   183	.hero-sub {
   184	  color: var(--text-muted);
   185	  font-size: clamp(1rem, 2.2vw, 1.18rem);
   186	  max-width: 46em;
   187	  margin: 0 0 1.5rem;
   188	}
   189	
   190	.hero-meta {
   191	  display: flex;
   192	  flex-wrap: wrap;
   193	  gap: 0.6rem 1.4rem;
   194	  color: var(--text-dim);
   195	  font-size: 0.85rem;
   196	}
   197	
   198	.hero-meta b {
   199	  color: var(--text);
   200	  font-weight: 600;
   201	}
   202	
   203	.hero-actions {
   204	  display: flex;
   205	  flex-wrap: wrap;
   206	  gap: 0.75rem;
   207	  margin-top: 1.75rem;
   208	}
   209	
   210	/* ---------- buttons ---------- */
   211	
   212	.btn {
   213	  display: inline-flex;
   214	  align-items: center;
   215	  gap: 0.45rem;
   216	  padding: 0.65rem 1.15rem;
   217	  border-radius: 8px;
   218	  font-size: 0.92rem;
   219	  font-weight: 600;
   220	  border: 1px solid transparent;
   221	  transition: all 0.18s ease;
   222	}
   223	
   224	.btn-primary {
   225	  background: var(--accent);
   226	  color: #071022;
   227	}
   228	.btn-primary:hover {
   229	  background: var(--accent-hover);
   230	  color: #071022;
   231	  box-shadow: 0 6px 24px var(--accent-glow);
   232	}
   233	
   234	.btn-ghost {
   235	  border-color: var(--border);
   236	  color: var(--text);
   237	  background: transparent;
   238	}
   239	.btn-ghost:hover {
   240	  border-color: var(--accent);
   241	  color: var(--accent-hover);
   242	}
   243	
   244	/* ---------- section shells ---------- */
   245	
   246	.section {
   247	  max-width: 1120px;
   248	  margin: 0 auto;
   249	  padding: 2.75rem 1rem;
   250	}
   251	
   252	@media (min-width: 768px) {
   253	  .section {
   254	    padding: 4rem 1.5rem;
   255	  }
   256	}
   257	
   258	.section-head {
   259	  display: flex;
   260	  flex-wrap: wrap;
   261	  align-items: baseline;
   262	  justify-content: space-between;
   263	  gap: 0.75rem;
   264	  margin-bottom: 1.75rem;
   265	}
   266	
   267	.section-head h2 {
   268	  font-size: clamp(1.45rem, 3.2vw, 2.1rem);
   269	  margin: 0;
   270	}
   271	
   272	.section-head .hint {
   273	  color: var(--text-dim);
   274	  font-size: 0.85rem;
   275	}
   276	
   277	/* ---------- paper cards ---------- */
   278	
   279	.paper-grid {
   280	  display: grid;
   281	  grid-template-columns: 1fr;
   282	  gap: 1.15rem;
   283	}
   284	
   285	@media (min-width: 640px) {
   286	  .paper-grid {
   287	    grid-template-columns: repeat(2, 1fr);
   288	  }
   289	}
   290	
   291	@media (min-width: 1024px) {
   292	  .paper-grid {
   293	    grid-template-columns: repeat(3, 1fr);
   294	  }
   295	}
   296	
   297	.paper-card {
   298	  position: relative;
   299	  display: flex;
   300	  flex-direction: column;
   301	  background: var(--surface);
   302	  border: 1px solid var(--border);
   303	  border-radius: 12px;
   304	  padding: 1.25rem 1.25rem 1.15rem;
   305	  min-height: 100%;
   306	  transition: transform 0.18s ease, border-color 0.18s ease, box-shadow 0.18s ease;
   307	  overflow: hidden;
   308	}
   309	
   310	.paper-card::before {
   311	  content: '';
   312	  position: absolute;
   313	  top: 0;
   314	  left: 0;
   315	  right: 0;
   316	  height: 3px;
   317	  background: linear-gradient(90deg, var(--accent), var(--accent-secondary));
   318	  opacity: 0.75;
   319	}
   320	
   321	.paper-card:hover {
   322	  transform: translateY(-3px);
   323	  border-color: var(--accent);
   324	  box-shadow: 0 14px 36px rgba(0, 0, 0, 0.35), 0 0 0 1px var(--accent-glow);
   325	}
   326	
   327	.card-part {
   328	  display: flex;
   329	  justify-content: space-between;
   330	  align-items: center;
   331	  gap: 0.5rem;
   332	  margin-bottom: 0.75rem;
   333	  font-size: 0.75rem;
   334	  letter-spacing: 0.12em;
   335	  text-transform: uppercase;
   336	  color: var(--accent-secondary);
   337	  font-weight: 600;
   338	}
   339	
   340	.card-part .cat {
   341	  color: var(--text-dim);
   342	  letter-spacing: 0.06em;
   343	  text-transform: none;
   344	  font-family: ui-monospace, monospace;
   345	}
   346	
   347	.paper-card h3 {
   348	  font-size: 1.13rem;
   349	  margin: 0 0 0.55rem;
   350	}
   351	
   352	.paper-card h3 a {
   353	  color: var(--text);
   354	}
   355	.paper-card:hover h3 a {
   356	  color: var(--accent-hover);
   357	}
   358	
   359	.card-sub {
   360	  color: var(--text-dim);
   361	  font-size: 0.8rem;
   362	  margin: 0 0 0.75rem;
   363	}
   364	
   365	.card-abstract {
   366	  color: var(--text-muted);
   367	  font-size: 0.88rem;
   368	  margin: 0 0 1.15rem;
   369	  flex: 1;
   370	}
   371	
   372	.card-foot {
   373	  display: flex;
   374	  flex-wrap: wrap;
   375	  align-items: center;
   376	  gap: 0.55rem 0.9rem;
   377	  border-top: 1px solid var(--border);
   378	  padding-top: 0.85rem;
   379	  font-size: 0.82rem;
   380	  color: var(--text-dim);
   381	}
   382	
   383	.card-foot .read {
   384	  color: var(--accent);
   385	  font-weight: 600;
   386	}
   387	
   388	.card-foot .pdf-link {
   389	  color: var(--text-muted);
   390	  border: 1px solid var(--border);
   391	  border-radius: 6px;
   392	  padding: 0.18rem 0.55rem;
   393	}
   394	.card-foot .pdf-link:hover {
   395	  color: var(--accent-hover);
   396	  border-color: var(--accent);
   397	}
   398	
   399	/* ---------- paper page ---------- */
   400	
   401	.paper-layout {
   402	  max-width: 1120px;
   403	  margin: 0 auto;
   404	  padding: 1.5rem 1rem 4rem;
   405	  display: grid;
   406	  grid-template-columns: 1fr;
   407	  gap: 2rem;
   408	}
   409	
   410	.paper-layout > * {
   411	  min-width: 0;
   412	}
   413	
   414	@media (min-width: 1024px) {
   415	  .paper-layout {
   416	    grid-template-columns: minmax(0, 1fr) 240px;
   417	    padding: 2.5rem 1.5rem 5rem;
   418	    gap: 3rem;
   419	  }
   420	}
   421	
   422	.paper-header {
   423	  margin-bottom: 1.75rem;
   424	}
   425	
   426	.paper-header .kicker {
   427	  color: var(--accent-secondary);
   428	  font-size: 0.76rem;
   429	  font-weight: 600;
   430	  letter-spacing: 0.2em;
   431	  text-transform: uppercase;
   432	  margin: 0 0 0.75rem;
   433	}
   434	
   435	.paper-header h1 {
   436	  font-size: clamp(1.65rem, 4.5vw, 2.55rem);
   437	  margin: 0 0 0.75rem;
   438	}
   439	
   440	.paper-header .sub {
   441	  color: var(--text-muted);
   442	  font-size: 1.02rem;
   443	  margin: 0 0 1rem;
   444	}
   445	
   446	.paper-meta {
   447	  display: flex;
   448	  flex-wrap: wrap;
   449	  gap: 0.45rem 1.15rem;
   450	  color: var(--text-dim);
   451	  font-size: 0.83rem;
   452	}
   453	
   454	.paper-meta b {
   455	  color: var(--text-muted);
   456	  font-weight: 600;
   457	}
   458	
   459	.pdf-btn {
   460	  position: fixed;
   461	  right: 1rem;
   462	  bottom: 1rem;
   463	  z-index: 40;
   464	  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.45);
   465	}
   466	
   467	@media (min-width: 1024px) {
   468	  .pdf-btn-fixed {
   469	    display: none;
   470	  }
   471	}
   472	
   473	.paper-abstract {
   474	  border: 1px solid var(--border);
   475	  border-left: 3px solid var(--accent);
   476	  background: var(--surface);
   477	  border-radius: 10px;
   478	  padding: 1.15rem 1.25rem;
   479	  margin: 1.5rem 0 2.25rem;
   480	}
   481	
   482	.paper-abstract h2 {
   483	  font-size: 1.05rem;
   484	  margin: 0 0 0.65rem;
   485	  color: var(--accent-hover);
   486	  font-family: var(--font-body);
   487	  letter-spacing: 0.08em;
   488	  text-transform: uppercase;
   489	}
   490	
   491	.paper-abstract p {
   492	  margin: 0 0 0.75rem;
   493	  color: var(--text-muted);
   494	  font-size: 0.96rem;
   495	}
   496	.paper-abstract p:last-child {
   497	  margin-bottom: 0;
   498	}
   499	
   500	/* ---------- paper content typography + math ---------- */
   501	
   502	.paper-content {
   503	  min-width: 0;
   504	  max-width: 100%;
   505	  overflow-wrap: break-word;
   506	  word-break: normal;
   507	  font-size: 1.02rem;
   508	  color: var(--text);
   509	}
   510	
   511	.paper-content .katex-display {
   512	  max-width: 100%;
   513	}
   514	
   515	.paper-content h1,
   516	.paper-content h2,
   517	.paper-content h3,
   518	.paper-content h4 {
   519	  max-width: 100%;
   520	}
   521	
   522	.paper-content h2 {
   523	  font-size: clamp(1.35rem, 3.2vw, 1.85rem);
   524	  margin: 2.75rem 0 1rem;
   525	  padding-top: 0.5rem;
   526	  border-top: 1px solid var(--border);
   527	}
   528	
   529	.paper-content h3 {
   530	  font-size: clamp(1.12rem, 2.6vw, 1.38rem);
   531	  margin: 2.1rem 0 0.85rem;
   532	}
   533	
   534	.paper-content h4 {
   535	  font-size: 1.05rem;
   536	  margin: 1.6rem 0 0.7rem;
   537	  color: var(--text-muted);
   538	}
   539	
   540	.paper-content p {
   541	  margin: 0 0 1.05rem;
   542	}
   543	
   544	.paper-content ul,
   545	.paper-content ol {
   546	  margin: 0 0 1.15rem;
   547	  padding-left: 1.4rem;
   548	}
   549	
   550	.paper-content li {
   551	  margin-bottom: 0.45rem;
   552	}
   553	
   554	.paper-content blockquote {
   555	  margin: 1.25rem 0;
   556	  padding: 0.15rem 0 0.15rem 1.1rem;
   557	  border-left: 3px solid var(--border);
   558	  color: var(--text-muted);
   559	}
   560	
   561	.paper-content code {
   562	  font-family: ui-monospace, 'SFMono-Regular', Menlo, monospace;
   563	  font-size: 0.88em;
   564	  background: var(--code-bg);
   565	  border: 1px solid var(--border);
   566	  border-radius: 4px;
   567	  padding: 0.08em 0.35em;
   568	}
   569	
   570	.paper-content pre {
   571	  background: var(--code-bg);
   572	  border: 1px solid var(--border);
   573	  border-radius: 8px;
   574	  padding: 0.95rem 1.05rem;
   575	  overflow-x: auto;
   576	  max-width: 100%;
   577	  margin: 0 0 1.25rem;
   578	}
   579	
   580	.paper-content pre code {
   581	  background: none;
   582	  border: none;
   583	  padding: 0;
   584	  font-size: 0.82rem;
   585	  line-height: 1.55;
   586	}
   587	
   588	/* theorem-style blocks */
   589	.paper-content .definition,
   590	.paper-content .theorem,
   591	.paper-content .proposition,
   592	.paper-content .lemma,
   593	.paper-content .corollary,
   594	.paper-content .conjecture,
   595	.paper-content .example,
   596	.paper-content .remark,
   597	.paper-content .proof {
   598	  border: 1px solid var(--border);
   599	  border-radius: 10px;
   600	  padding: 1rem 1.15rem;
   601	  margin: 1.35rem 0;
   602	  background: rgba(14, 20, 40, 0.55);
   603	}
   604	
   605	.paper-content .definition {
   606	  border-left: 3px solid var(--accent);
   607	}
   608	.paper-content .theorem,
   609	.paper-content .proposition {
   610	  border-left: 3px solid var(--accent-secondary);
   611	}
   612	.paper-content .lemma,
   613	.paper-content .corollary {
   614	  border-left: 3px solid #7dd3fc;
   615	}
   616	.paper-content .conjecture {
   617	  border-left: 3px solid var(--warning);
   618	}
   619	.paper-content .remark,
   620	.paper-content .example {
   621	  border-left: 3px solid var(--border);
   622	}
   623	.paper-content .proof {
   624	  background: transparent;
   625	  border-style: dashed;
   626	}
   627	
   628	.paper-content .definition p,
   629	.paper-content .theorem p,
   630	.paper-content .proposition p,
   631	.paper-content .lemma p,
   632	.paper-content .corollary p,
   633	.paper-content .conjecture p {
   634	  margin-bottom: 0.65rem;
   635	}
   636	.paper-content .definition p:last-child,
   637	.paper-content .theorem p:last-child,
   638	.paper-content .proposition p:last-child {
   639	  margin-bottom: 0;
   640	}
   641	
   642	/* tables */
   643	.paper-content table {
   644	  display: block;
   645	  width: 100%;
   646	  max-width: 100%;
   647	  overflow-x: auto;
   648	  border-collapse: collapse;
   649	  margin: 1.5rem 0;
   650	  font-size: 0.86rem;
   651	}
   652	
   653	.paper-content caption {
   654	  caption-side: top;
   655	  text-align: left;
   656	  color: var(--text-muted);
   657	  font-size: 0.85rem;
   658	  padding: 0 0 0.65rem;
   659	  line-height: 1.5;
   660	}
   661	
   662	.paper-content caption .tbl-num {
   663	  color: var(--accent-secondary);
   664	  font-weight: 600;
   665	  margin-right: 0.35rem;
   666	}
   667	
   668	.paper-content th,
   669	.paper-content td {
   670	  border: 1px solid var(--border);
   671	  padding: 0.55rem 0.75rem;
   672	  text-align: left;
   673	  vertical-align: top;
   674	  min-width: 5.5rem;
   675	}
   676	
   677	.paper-content th {
   678	  background: var(--surface-hover);
   679	  color: var(--text);
   680	  font-weight: 600;
   681	}
   682	
   683	.paper-content tr:nth-child(even) td {
   684	  background: rgba(14, 20, 40, 0.4);
   685	}
   686	
   687	/* math */
   688	.paper-content .math-rendered {
   689	  display: block;
   690	  overflow-x: auto;
   691	  overflow-y: hidden;
   692	  padding: 0.35rem 0;
   693	  max-width: 100%;
   694	}
   695	
   696	.paper-content .math-rendered .katex-display {
   697	  margin: 0.55rem 0;
   698	  overflow-x: auto;
   699	  overflow-y: hidden;
   700	}
   701	
   702	.paper-content .math-rendered .katex {
   703	  font-size: 1.06em;
   704	}
   705	
   706	.paper-content .katex-display > .katex {
   707	  text-align: left;
   708	}
   709	
   710	.paper-content .katex-error {
   711	  color: var(--warning);
   712	  font-family: ui-monospace, monospace;
   713	  font-size: 0.85em;
   714	}
   715	
   716	/* inline citations + bibliography */
   717	.paper-content a.citation {
   718	  color: var(--accent-secondary);
   719	  font-size: 0.85em;
   720	  white-space: nowrap;
   721	}
   722	
   723	.paper-content .thebibliography {
   724	  font-size: 0.88rem;
   725	  color: var(--text-muted);
   726	}
   727	
   728	.paper-content .bibitem {
   729	  margin: 0 0 0.85rem;
   730	  padding-left: 2.2rem;
   731	  text-indent: -2.2rem;
   732	}
   733	
   734	.paper-content .bibitem .bib-num {
   735	  color: var(--accent-secondary);
   736	  margin-right: 0.45rem;
   737	  font-weight: 600;
   738	}
   739	
   740	/* ---------- TOC ---------- */
   741	
   742	.toc-wrap {
   743	  min-width: 0;
   744	}
   745	
   746	.toc-toggle {
   747	  width: 100%;
   748	  text-align: left;
   749	  background: var(--surface);
   750	  color: var(--text);
   751	  border: 1px solid var(--border);
   752	  border-radius: 8px;
   753	  padding: 0.65rem 0.95rem;
   754	  font-size: 0.88rem;
   755	  font-weight: 600;
   756	  cursor: pointer;
   757	}
   758	
   759	@media (min-width: 1024px) {
   760	  .toc-toggle {
   761	    display: none;
   762	  }
   763	}
   764	
   765	.toc {
   766	  display: none;
   767	  flex-direction: column;
   768	  gap: 0.15rem;
   769	  margin-top: 0.65rem;
   770	}
   771	
   772	.toc-open {
   773	  display: flex;
   774	}
   775	
   776	@media (min-width: 1024px) {
   777	  .toc {
   778	    display: flex;
   779	    position: sticky;
   780	    top: 5.25rem;
   781	    max-height: calc(100vh - 7rem);
   782	    overflow-y: auto;
   783	    margin-top: 0;
   784	  }
   785	}
   786	
   787	.toc-item {
   788	  color: var(--text-muted);
   789	  font-size: 0.83rem;
   790	  line-height: 1.45;
   791	  padding: 0.32rem 0.65rem;
   792	  border-left: 2px solid transparent;
   793	  border-radius: 0 6px 6px 0;
   794	}
   795	
   796	.toc-item:hover {
   797	  color: var(--text);
   798	  background: var(--surface);
   799	}
   800	
   801	.toc-level-3 {
   802	  padding-left: 1.35rem;
   803	  font-size: 0.8rem;
   804	}
   805	.toc-level-4 {
   806	  padding-left: 2.05rem;
   807	  font-size: 0.78rem;
   808	  color: var(--text-dim);
   809	}
   810	
   811	.toc-active {
   812	  color: var(--accent-hover);
   813	  border-left-color: var(--accent);
   814	  background: var(--accent-glow);
   815	}
   816	
   817	/* ---------- prev / next ---------- */
   818	
   819	.paper-nav {
   820	  display: grid;
   821	  grid-template-columns: 1fr;
   822	  gap: 1rem;
   823	  margin-top: 3.5rem;
   824	  padding-top: 1.75rem;
   825	  border-top: 1px solid var(--border);
   826	}
   827	
   828	@media (min-width: 640px) {
   829	  .paper-nav {
   830	    grid-template-columns: 1fr 1fr;
   831	  }
   832	}
   833	
   834	.paper-nav .nav-link {
   835	  display: block;
   836	  border: 1px solid var(--border);
   837	  border-radius: 10px;
   838	  padding: 1rem 1.15rem;
   839	  color: var(--text);
   840	  transition: border-color 0.18s ease;
   841	}
   842	
   843	.paper-nav .nav-link:hover {
   844	  border-color: var(--accent);
   845	  color: var(--text);
   846	}
   847	
   848	.paper-nav .dir {
   849	  color: var(--text-dim);
   850	  font-size: 0.75rem;
   851	  letter-spacing: 0.16em;
   852	  text-transform: uppercase;
   853	  margin-bottom: 0.35rem;
   854	}
   855	
   856	.paper-nav .nav-title {
   857	  font-family: var(--font-heading);
   858	  font-size: 1rem;
   859	}
   860	
   861	.paper-nav .next {
   862	  text-align: left;
   863	}
   864	
   865	@media (min-width: 640px) {
   866	  .paper-nav .next {
   867	    text-align: right;
   868	  }
   869	}
   870	
   871	/* ---------- periodic table page ---------- */
   872	
   873	.md-content {
   874	  min-width: 0;
   875	  overflow-wrap: break-word;
   876	  font-size: 0.97rem;
   877	}
   878	
   879	.md-content h2 {
   880	  font-size: clamp(1.35rem, 3vw, 1.8rem);
   881	  margin: 2.75rem 0 1rem;
   882	  padding-top: 0.5rem;
   883	  border-top: 1px solid var(--border);
   884	}
   885	
   886	.md-content h3 {
   887	  font-size: clamp(1.1rem, 2.4vw, 1.35rem);
   888	  margin: 2.1rem 0 0.85rem;
   889	}
   890	
   891	.md-content p {
   892	  margin: 0 0 1.05rem;
   893	  color: var(--text-muted);
   894	}
   895	
   896	.md-content strong {
   897	  color: var(--text);
   898	}
   899	
   900	.md-content table {
   901	  display: block;
   902	  width: 100%;
   903	  max-width: 100%;
   904	  overflow-x: auto;
   905	  border-collapse: collapse;
   906	  margin: 1.35rem 0;
   907	  font-size: 0.82rem;
   908	}
   909	
   910	.md-content th,
   911	.md-content td {
   912	  border: 1px solid var(--border);
   913	  padding: 0.55rem 0.75rem;
   914	  text-align: left;
   915	  vertical-align: top;
   916	  min-width: 5.5rem;
   917	}
   918	
   919	.md-content th {
   920	  background: var(--surface-hover);
   921	  color: var(--text);
   922	}
   923	
   924	.md-content tr:nth-child(even) td {
   925	  background: rgba(14, 20, 40, 0.4);
   926	}
   927	
   928	.md-content hr {
   929	  border: none;
   930	  border-top: 1px solid var(--border);
   931	  margin: 2.25rem 0;
   932	}
   933	
   934	.status-proven { color: var(--success); font-weight: 600; }
   935	.status-claimed { color: var(--warning); font-weight: 600; }
   936	.status-open { color: var(--accent); font-weight: 600; }
   937	.status-impossible { color: #f87171; font-weight: 600; }
   938	
   939	/* ---------- footer ---------- */
   940	
   941	.site-footer {
   942	  border-top: 1px solid var(--border);
   943	  margin-top: 2rem;
   944	  background: rgba(14, 20, 40, 0.4);
   945	}
   946	
   947	.site-footer-inner {
   948	  max-width: 1120px;
   949	  margin: 0 auto;
   950	  padding: 2.25rem 1rem;
   951	  display: grid;
   952	  gap: 1.25rem;
   953	  color: var(--text-dim);
   954	  font-size: 0.85rem;
   955	}
   956	
   957	@media (min-width: 768px) {
   958	  .site-footer-inner {
   959	    grid-template-columns: 2fr 1fr 1fr;
   960	    padding: 2.75rem 1.5rem;
   961	  }
   962	}
   963	
   964	.site-footer h3 {
   965	  font-family: var(--font-body);
   966	  font-size: 0.78rem;
   967	  letter-spacing: 0.18em;
   968	  text-transform: uppercase;
   969	  color: var(--text-muted);
   970	  margin: 0 0 0.65rem;
   971	}
   972	
   973	.site-footer p {
   974	  margin: 0 0 0.55rem;
   975	  max-width: 42em;
   976	}
   977	
   978	.site-footer a {
   979	  color: var(--text-muted);
   980	}
   981	.site-footer a:hover {
   982	  color: var(--accent-hover);
   983	}
   984	
   985	.site-footer ul {
   986	  list-style: none;
   987	  margin: 0;
   988	  padding: 0;
   989	}
   990	
   991	.site-footer li {
   992	  margin-bottom: 0.45rem;
   993	}

exec
/usr/local/bin/zsh -lc "nl -ba website/app/layout.tsx; nl -ba website/app/page.tsx; nl -ba 'website/app/papers/[slug]/page.tsx'; nl -ba website/app/periodic-table/page.tsx; nl -ba website/lib/papers.ts; cat website/package.json; cat website/next.config.mjs" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
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
    51	export async function getPeriodicTable(): Promise<{ html: string; headings: Heading[] }> {
    52	  const md = fs.readFileSync(path.join(CONTENT_DIR, 'periodic-table.md'), 'utf8');
    53	  const { marked } = await import('marked');
    54	  const rawHtml = await marked.parse(md, { async: true, gfm: true });
    55	  const DOMPurify = (await import('isomorphic-dompurify')).default;
    56	  const clean = DOMPurify.sanitize(rawHtml, {
    57	    ADD_TAGS: ['span', 'table', 'thead', 'tbody', 'tr', 'th', 'td', 'caption'],
    58	    ADD_ATTR: ['class', 'id'],
    59	  });
    60	  const html = renderMath(clean);
    61	  return { html, headings: extractHeadings(html) };
    62	}
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
/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export',
  images: { unoptimized: true },
  trailingSlash: true,
};

export default nextConfig;

exec
/usr/local/bin/zsh -lc 'nl -ba website/content/periodic-table.md' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
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
   101	| Holographic entropy cone, n ≤ 5 | Families III, VI | Complete inequality sets for 2, 3, and 4 boundary regions follow from strong subadditivity and monogamy of mutual information [47]; the five-region cone is completely constructed by exhibiting graph models for every extreme ray orbit of the cone defined by all proven inequalities, which settles the existence of further five-party inequalities in the negative (Hernández-Cuenca, Phys. Rev. D 100, 026004 (2019)) | **PROVEN** | [47]; Hernández-Cuenca 2019 |
   102	| Holographic entropy cone, n ≥ 6 | Families III, VI | For fixed n finitely many independent inequalities exist; only one infinite family known; a 2026 "multi-entropy cone" preprint is unverified | **OPEN** | [47] |
   103	| Lurie proof gap (extended TQFTs) | Family VI | Baez–Dolan proposal [34]; Lurie 2009 is an "informal sketch of a proof" [35]; exact range of completed cases unverified | **OPEN** (claim **CLAIMED**) | [34][35] |
   104	| Yang–Mills mass gap | Family VII/QFT | Clay: "no proof of this property is known"; explicitly not claimed in the 2026 announcements | **OPEN** | [23][25][26] |
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

exec
/usr/local/bin/zsh -lc "sed -n '500,850p' website/app/globals.css | nl -ba -v500" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   500	/* ---------- paper content typography + math ---------- */
   501	
   502	.paper-content {
   503	  min-width: 0;
   504	  max-width: 100%;
   505	  overflow-wrap: break-word;
   506	  word-break: normal;
   507	  font-size: 1.02rem;
   508	  color: var(--text);
   509	}
   510	
   511	.paper-content .katex-display {
   512	  max-width: 100%;
   513	}
   514	
   515	.paper-content h1,
   516	.paper-content h2,
   517	.paper-content h3,
   518	.paper-content h4 {
   519	  max-width: 100%;
   520	}
   521	
   522	.paper-content h2 {
   523	  font-size: clamp(1.35rem, 3.2vw, 1.85rem);
   524	  margin: 2.75rem 0 1rem;
   525	  padding-top: 0.5rem;
   526	  border-top: 1px solid var(--border);
   527	}
   528	
   529	.paper-content h3 {
   530	  font-size: clamp(1.12rem, 2.6vw, 1.38rem);
   531	  margin: 2.1rem 0 0.85rem;
   532	}
   533	
   534	.paper-content h4 {
   535	  font-size: 1.05rem;
   536	  margin: 1.6rem 0 0.7rem;
   537	  color: var(--text-muted);
   538	}
   539	
   540	.paper-content p {
   541	  margin: 0 0 1.05rem;
   542	}
   543	
   544	.paper-content ul,
   545	.paper-content ol {
   546	  margin: 0 0 1.15rem;
   547	  padding-left: 1.4rem;
   548	}
   549	
   550	.paper-content li {
   551	  margin-bottom: 0.45rem;
   552	}
   553	
   554	.paper-content blockquote {
   555	  margin: 1.25rem 0;
   556	  padding: 0.15rem 0 0.15rem 1.1rem;
   557	  border-left: 3px solid var(--border);
   558	  color: var(--text-muted);
   559	}
   560	
   561	.paper-content code {
   562	  font-family: ui-monospace, 'SFMono-Regular', Menlo, monospace;
   563	  font-size: 0.88em;
   564	  background: var(--code-bg);
   565	  border: 1px solid var(--border);
   566	  border-radius: 4px;
   567	  padding: 0.08em 0.35em;
   568	}
   569	
   570	.paper-content pre {
   571	  background: var(--code-bg);
   572	  border: 1px solid var(--border);
   573	  border-radius: 8px;
   574	  padding: 0.95rem 1.05rem;
   575	  overflow-x: auto;
   576	  max-width: 100%;
   577	  margin: 0 0 1.25rem;
   578	}
   579	
   580	.paper-content pre code {
   581	  background: none;
   582	  border: none;
   583	  padding: 0;
   584	  font-size: 0.82rem;
   585	  line-height: 1.55;
   586	}
   587	
   588	/* theorem-style blocks */
   589	.paper-content .definition,
   590	.paper-content .theorem,
   591	.paper-content .proposition,
   592	.paper-content .lemma,
   593	.paper-content .corollary,
   594	.paper-content .conjecture,
   595	.paper-content .example,
   596	.paper-content .remark,
   597	.paper-content .proof {
   598	  border: 1px solid var(--border);
   599	  border-radius: 10px;
   600	  padding: 1rem 1.15rem;
   601	  margin: 1.35rem 0;
   602	  background: rgba(14, 20, 40, 0.55);
   603	}
   604	
   605	.paper-content .definition {
   606	  border-left: 3px solid var(--accent);
   607	}
   608	.paper-content .theorem,
   609	.paper-content .proposition {
   610	  border-left: 3px solid var(--accent-secondary);
   611	}
   612	.paper-content .lemma,
   613	.paper-content .corollary {
   614	  border-left: 3px solid #7dd3fc;
   615	}
   616	.paper-content .conjecture {
   617	  border-left: 3px solid var(--warning);
   618	}
   619	.paper-content .remark,
   620	.paper-content .example {
   621	  border-left: 3px solid var(--border);
   622	}
   623	.paper-content .proof {
   624	  background: transparent;
   625	  border-style: dashed;
   626	}
   627	
   628	.paper-content .definition p,
   629	.paper-content .theorem p,
   630	.paper-content .proposition p,
   631	.paper-content .lemma p,
   632	.paper-content .corollary p,
   633	.paper-content .conjecture p {
   634	  margin-bottom: 0.65rem;
   635	}
   636	.paper-content .definition p:last-child,
   637	.paper-content .theorem p:last-child,
   638	.paper-content .proposition p:last-child {
   639	  margin-bottom: 0;
   640	}
   641	
   642	/* tables */
   643	.paper-content table {
   644	  display: block;
   645	  width: 100%;
   646	  max-width: 100%;
   647	  overflow-x: auto;
   648	  border-collapse: collapse;
   649	  margin: 1.5rem 0;
   650	  font-size: 0.86rem;
   651	}
   652	
   653	.paper-content caption {
   654	  caption-side: top;
   655	  text-align: left;
   656	  color: var(--text-muted);
   657	  font-size: 0.85rem;
   658	  padding: 0 0 0.65rem;
   659	  line-height: 1.5;
   660	}
   661	
   662	.paper-content caption .tbl-num {
   663	  color: var(--accent-secondary);
   664	  font-weight: 600;
   665	  margin-right: 0.35rem;
   666	}
   667	
   668	.paper-content th,
   669	.paper-content td {
   670	  border: 1px solid var(--border);
   671	  padding: 0.55rem 0.75rem;
   672	  text-align: left;
   673	  vertical-align: top;
   674	  min-width: 5.5rem;
   675	}
   676	
   677	.paper-content th {
   678	  background: var(--surface-hover);
   679	  color: var(--text);
   680	  font-weight: 600;
   681	}
   682	
   683	.paper-content tr:nth-child(even) td {
   684	  background: rgba(14, 20, 40, 0.4);
   685	}
   686	
   687	/* math */
   688	.paper-content .math-rendered {
   689	  display: block;
   690	  overflow-x: auto;
   691	  overflow-y: hidden;
   692	  padding: 0.35rem 0;
   693	  max-width: 100%;
   694	}
   695	
   696	.paper-content .math-rendered .katex-display {
   697	  margin: 0.55rem 0;
   698	  overflow-x: auto;
   699	  overflow-y: hidden;
   700	}
   701	
   702	.paper-content .math-rendered .katex {
   703	  font-size: 1.06em;
   704	}
   705	
   706	.paper-content .katex-display > .katex {
   707	  text-align: left;
   708	}
   709	
   710	.paper-content .katex-error {
   711	  color: var(--warning);
   712	  font-family: ui-monospace, monospace;
   713	  font-size: 0.85em;
   714	}
   715	
   716	/* inline citations + bibliography */
   717	.paper-content a.citation {
   718	  color: var(--accent-secondary);
   719	  font-size: 0.85em;
   720	  white-space: nowrap;
   721	}
   722	
   723	.paper-content .thebibliography {
   724	  font-size: 0.88rem;
   725	  color: var(--text-muted);
   726	}
   727	
   728	.paper-content .bibitem {
   729	  margin: 0 0 0.85rem;
   730	  padding-left: 2.2rem;
   731	  text-indent: -2.2rem;
   732	}
   733	
   734	.paper-content .bibitem .bib-num {
   735	  color: var(--accent-secondary);
   736	  margin-right: 0.45rem;
   737	  font-weight: 600;
   738	}
   739	
   740	/* ---------- TOC ---------- */
   741	
   742	.toc-wrap {
   743	  min-width: 0;
   744	}
   745	
   746	.toc-toggle {
   747	  width: 100%;
   748	  text-align: left;
   749	  background: var(--surface);
   750	  color: var(--text);
   751	  border: 1px solid var(--border);
   752	  border-radius: 8px;
   753	  padding: 0.65rem 0.95rem;
   754	  font-size: 0.88rem;
   755	  font-weight: 600;
   756	  cursor: pointer;
   757	}
   758	
   759	@media (min-width: 1024px) {
   760	  .toc-toggle {
   761	    display: none;
   762	  }
   763	}
   764	
   765	.toc {
   766	  display: none;
   767	  flex-direction: column;
   768	  gap: 0.15rem;
   769	  margin-top: 0.65rem;
   770	}
   771	
   772	.toc-open {
   773	  display: flex;
   774	}
   775	
   776	@media (min-width: 1024px) {
   777	  .toc {
   778	    display: flex;
   779	    position: sticky;
   780	    top: 5.25rem;
   781	    max-height: calc(100vh - 7rem);
   782	    overflow-y: auto;
   783	    margin-top: 0;
   784	  }
   785	}
   786	
   787	.toc-item {
   788	  color: var(--text-muted);
   789	  font-size: 0.83rem;
   790	  line-height: 1.45;
   791	  padding: 0.32rem 0.65rem;
   792	  border-left: 2px solid transparent;
   793	  border-radius: 0 6px 6px 0;
   794	}
   795	
   796	.toc-item:hover {
   797	  color: var(--text);
   798	  background: var(--surface);
   799	}
   800	
   801	.toc-level-3 {
   802	  padding-left: 1.35rem;
   803	  font-size: 0.8rem;
   804	}
   805	.toc-level-4 {
   806	  padding-left: 2.05rem;
   807	  font-size: 0.78rem;
   808	  color: var(--text-dim);
   809	}
   810	
   811	.toc-active {
   812	  color: var(--accent-hover);
   813	  border-left-color: var(--accent);
   814	  background: var(--accent-glow);
   815	}
   816	
   817	/* ---------- prev / next ---------- */
   818	
   819	.paper-nav {
   820	  display: grid;
   821	  grid-template-columns: 1fr;
   822	  gap: 1rem;
   823	  margin-top: 3.5rem;
   824	  padding-top: 1.75rem;
   825	  border-top: 1px solid var(--border);
   826	}
   827	
   828	@media (min-width: 640px) {
   829	  .paper-nav {
   830	    grid-template-columns: 1fr 1fr;
   831	  }
   832	}
   833	
   834	.paper-nav .nav-link {
   835	  display: block;
   836	  border: 1px solid var(--border);
   837	  border-radius: 10px;
   838	  padding: 1rem 1.15rem;
   839	  color: var(--text);
   840	  transition: border-color 0.18s ease;
   841	}
   842	
   843	.paper-nav .nav-link:hover {
   844	  border-color: var(--accent);
   845	  color: var(--text);
   846	}
   847	
   848	.paper-nav .dir {
   849	  color: var(--text-dim);
   850	  font-size: 0.75rem;

exec
/usr/local/bin/zsh -lc 'nl -ba website/lib/macros.ts; head -60 website/content/manifest.json; head -65 website/content/papers/vol-01-foundations.html; head -20 website/app/layout.tsx' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
     1	import * as fs from 'fs';
     2	import * as path from 'path';
     3	
     4	export type MacroMap = Record<string, string>;
     5	
     6	export const BASE_MACROS: MacroMap = {
     7	  '\\slashed': '\\not{#1}',
     8	  '\\bra': '\\langle #1 \\vert',
     9	  '\\ket': '\\vert #1 \\rangle',
    10	  '\\braket': '\\langle #1 \\vert #2 \\rangle',
    11	  '\\Hom': '\\operatorname{Hom}',
    12	  '\\Tr': '\\operatorname{Tr}',
    13	  '\\Lan': '\\operatorname{Lan}',
    14	  '\\Ran': '\\operatorname{Ran}',
    15	  '\\End': '\\operatorname{End}',
    16	  '\\Nat': '\\operatorname{Nat}',
    17	  '\\Sp': '\\operatorname{Sp}',
    18	  '\\id': '\\operatorname{id}',
    19	  '\\im': '\\operatorname{im}',
    20	  '\\coker': '\\operatorname{coker}',
    21	  '\\rank': '\\operatorname{rank}',
    22	  '\\diag': '\\operatorname{diag}',
    23	  '\\supp': '\\operatorname{supp}',
    24	  '\\Arg': '\\operatorname{Arg}',
    25	  '\\Res': '\\operatorname{Res}',
    26	  '\\ad': '\\operatorname{ad}',
    27	};
    28	
    29	/**
    30	 * Auto-extract \newcommand / \renewcommand / \DeclareMathOperator definitions
    31	 * from the LaTeX preambles of the series papers. Papers define 50-70 custom
    32	 * commands between them; missing any produces red error text on the site.
    33	 */
    34	export function extractMacros(texDir: string): MacroMap {
    35	  const macros: MacroMap = { ...BASE_MACROS };
    36	  if (!fs.existsSync(texDir)) return macros;
    37	
    38	  const newCmd = /\\(?:newcommand|renewcommand)\s*\{?(\\[a-zA-Z]+)\}?\s*(?:\[(\d)\])?\s*\{/g;
    39	  const declOp = /\\DeclareMathOperator\*?\s*\{?(\\[a-zA-Z]+)\}?\s*\{([^{}]*)\}/g;
    40	
    41	  for (const file of fs.readdirSync(texDir)) {
    42	    if (!file.endsWith('.tex')) continue;
    43	    const src = fs.readFileSync(path.join(texDir, file), 'utf8');
    44	    // only scan the preamble — the body can contain usage, not definitions
    45	    const preamble = src.includes('\\begin{document}')
    46	      ? src.slice(0, src.indexOf('\\begin{document}'))
    47	      : src;
    48	
    49	    let m: RegExpExecArray | null;
    50	    while ((m = newCmd.exec(preamble)) !== null) {
    51	      const name = m[1];
    52	      const arity = m[2] ? parseInt(m[2], 10) : 0;
    53	      const body = extractBraceGroup(preamble, newCmd.lastIndex - 1);
    54	      if (body === null) continue;
    55	      let replacement = body;
    56	      for (let i = 1; i <= arity; i++) {
    57	        replacement = replacement.replace(
    58	          new RegExp(`#${i}`, 'g'),
    59	          `{#${i}}`,
    60	        );
    61	      }
    62	      macros[name] = replacement;
    63	    }
    64	    while ((m = declOp.exec(preamble)) !== null) {
    65	      macros[m[1]] = `\\operatorname{${m[2]}}`;
    66	    }
    67	  }
    68	  return macros;
    69	}
    70	
    71	function extractBraceGroup(src: string, openIdx: number): string | null {
    72	  if (src[openIdx] !== '{') return null;
    73	  let depth = 0;
    74	  for (let i = openIdx; i < src.length; i++) {
    75	    const c = src[i];
    76	    if (c === '\\') {
    77	      i++;
    78	      continue;
    79	    }
    80	    if (c === '{') depth++;
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
<p>Completed classifications in mathematics fall into regimes, and the regimes determine what a classification program for physics can promise. Table <a href="#tab:regimes" data-reference-type="ref" data-reference="tab:regimes">1</a> collects representative cases on which the program relies as background. The rows are established mathematics, cited here as registered background; no theorem of this paper depends on them, and the comparison with finite simple groups is the only one of them that shapes the constructions below.</p>
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
<p>This paper depends on no theorem of the series and on no classification theorem beyond the architectural comparison with finite simple groups. The classification theorems of Table <a href="#tab:regimes" data-reference-type="ref" data-reference="tab:regimes">1</a> are registered background, and the conjecture below enters later work as a declared hypothesis. This paper asserts no universal classification; that statement is the conjecture’s subject. These rules make the definitions reusable: a definitional root that smuggled in results would make every dependent statement rest on them.</p>
<h2 id="sec:framework">Mathematical framework</h2>
<p>A representation of a physical system is a piece of mathematical data, and the schema below records that data in five components. The schema is a stipulation. It is proposed as a working definition, it is the definitional root of the series, and it is not claimed to capture every system anyone would call physical.</p>
<div id="def:record" class="definition">
<p><strong>Definition 1</strong> (System record).  A system record is a tuple <span class="math display">\[P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})\]</span> with the following components. The component <span class="math inline">\(X\)</span> is the state space or geometric structure of <span class="math inline">\(P\)</span>. The component <span class="math inline">\(\mathcal{O}\)</span> is the algebra or collection of observables of <span class="math inline">\(P\)</span>. The component <span class="math inline">\(\mathcal{D}\)</span> holds the evolution laws of <span class="math inline">\(P\)</span>, given as Hamiltonian or vector-field data, an operator semigroup, a flow, or an evolution functor. The component <span class="math inline">\(\mathcal{S}\)</span> holds the symmetry and constraint data of <span class="math inline">\(P\)</span>, the group or groupoid actions, gauge constraints, and constraint surfaces. The component <span class="math inline">\(\mathcal{C}\)</span> declares how <span class="math inline">\(P\)</span> is to be combined with other systems, through tensor products, coupling terms, or interfacing rules.</p>
</div>
<p>Each component is a mathematical object of some ambient category, and the schema does not fix which. The state space may be a set, a symplectic or smooth manifold, a Hilbert space, or a lattice configuration. The observables may be real functions on a state space, a <span class="math inline">\(C^*\)</span>-algebra, a von Neumann algebra, or a sheaf of observable collections. The composition component is the load-bearing one for the later sections: it fixes what counts as a decomposition, so irreducibility is always relative to <span class="math inline">\(\mathcal{C}\)</span>. The five components need not be independent, and the record is a candidate definition rather than a theorem. Table <a href="#tab:notation" data-reference-type="ref" data-reference="tab:notation">2</a> fixes the notation of the paper.</p>
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
<tr><td><span class="math inline">\(\langle \mathfrak{F} \rangle_{\mathfrak{C}}\)</span></td><td>Closure of a family collection under the constructions <span class="math inline">\(\mathfrak{C}\)</span></td></tr>
<tr><td><span class="math inline">\(\mathbf{1}_{\mathcal{C}}\)</span></td><td>The neutral record of the composition rule <span class="math inline">\(\mathcal{C}\)</span></td></tr>
</table>
<div id="rem:scope" class="remark">
<p><em>Remark 2</em> (Scope of the schema).  The schema records representations, not the systems they represent, and it treats gauge orbits, superselection sectors, and state spaces with constraints at the level of the components that carry them rather than resolving them into separate object types. Two records may describe one physical system at different levels of coarse-graining, and the schema does not decide when. The remark is a boundary of Definition <a href="#def:record" data-reference-type="ref" data-reference="def:record">1</a>, not a defect to be patched silently in later sections.</p>
</div>
<div id="ex:hamiltonian" class="example">
<p><strong>Example 3</strong> (Classical Hamiltonian record).  Let <span class="math inline">\(X\)</span> be a symplectic manifold, let <span class="math inline">\(\mathcal{O} = C^\infty(X)\)</span>, let <span class="math inline">\(\mathcal{D}\)</span> be the Hamiltonian flow of a chosen Hamiltonian <span class="math inline">\(H \in C^\infty(X)\)</span>, let <span class="math inline">\(\mathcal{S}\)</span> be the group of symplectomorphisms preserving <span class="math inline">\(H\)</span>, and let <span class="math inline">\(\mathcal{C}\)</span> be the product of symplectic manifolds with coupled Hamiltonians. Poisson manifolds give the wider family, whose local models are supplied by Weinstein splitting <a class="citation" href="#bib-weinstein1983">[18]</a>.</p>
</div>
<div id="ex:quantum" class="example">
<p><strong>Example 4</strong> (Quantum record).  Let <span class="math inline">\(X\)</span> be a Hilbert space, let <span class="math inline">\(\mathcal{O} = B(X)\)</span> or a <span class="math inline">\(C^*\)</span>-subalgebra of it, let <span class="math inline">\(\mathcal{D}\)</span> be a strongly continuous one-parameter unitary group or a semigroup of completely positive maps, let <span class="math inline">\(\mathcal{S}\)</span> be the unitary group commuting with <span class="math inline">\(\mathcal{D}\)</span>, and let <span class="math inline">\(\mathcal{C}\)</span> be the Hilbert-space tensor product with tensor-product dynamics.</p>
</div>
<div id="ex:lattice" class="example">
<p><strong>Example 5</strong> (Lattice record).  Let <span class="math inline">\(X\)</span> be the set of vertices of a finite lattice, let <span class="math inline">\(\mathcal{O}\)</span> be the algebra of functions on <span class="math inline">\(X\)</span> generated by local gauge-invariant operators, let <span class="math inline">\(\mathcal{D}\)</span> be the update rule of a lattice gauge model, let <span class="math inline">\(\mathcal{S}\)</span> be the local gauge group acting on the links, and let <span class="math inline">\(\mathcal{C}\)</span> be the gluing of lattices along shared boundaries. Lattice models of gauge theory are the class where restricted theorems of the series have proved attainable and where the continuum limit remains a limiting procedure in the sense of Definition <a href="#def:morphism-kind" data-reference-type="ref" data-reference="def:morphism-kind">9</a>.</p>
</div>
<p>These classes are deliberately small. Section <a href="#sec:restricted" data-reference-type="ref" data-reference="sec:restricted">8</a> classifies the first two in full and adds a variant of the first with symmetry data.</p>
<div id="def:finite-classical" class="definition">
<p><strong>Definition 6</strong> (Finite classical record).  Let <span class="math inline">\(\mathrm{Phys}_{\mathrm{fin}}\)</span> be the class of records <span class="math inline">\(P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})\)</span> with <span class="math inline">\(X\)</span> a finite set, <span class="math inline">\(\mathcal{O} = \mathbb{R}^{X}\)</span> the algebra of all real functions on <span class="math inline">\(X\)</span>, <span class="math inline">\(\mathcal{D}\)</span> the identity dynamics, <span class="math inline">\(\mathcal{S}\)</span> the trivial symmetry group, and <span class="math inline">\(\mathcal{C}\)</span> the disjoint union of state spaces. The empty record is admitted and is the neutral record for disjoint union, the <span class="math inline">\(\mathbf{1}_{\mathcal{C}}\)</span> of Definition <a href="#def:irreducible" data-reference-type="ref" data-reference="def:irreducible">26</a>. The set <span class="math inline">\(X\)</span> ranges over finite sets in a fixed countable universe, so the class is a set rather than a proper class, and isomorphic records with different underlying sets are identified in the quotient of Theorem <a href="#thm:finite-state-classification" data-reference-type="ref" data-reference="thm:finite-state-classification">32</a>.</p>
</div>
<div id="def:finite-dynamical" class="definition">
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

exec
/usr/local/bin/zsh -lc "rg -n -i 'reviewer|review\\b|pipeline|artifact|pandoc|revision|draft|todo|pending|run[- ]|audit|generated|agent' website/content website/app" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
website/content/manifest.json:87:    "abstractFull": "We develop the classification of gauge structures and quantum field theories within the CMRPS program. The subject divides into two territories of unequal evidential standing. The established territory contains the KillingCartan classification of semisimple Lie algebras, the highest-weight classification of their finite-dimensional representations, the classification of principal -bundles by homotopy classes of maps into the classifying space , characteristic classes as pullbacks of universal classes, and anomalies as cohomological obstructions that gate quantization. The restricted territory contains functorial topological field theories under the Atiyah axioms and the DoplicherRoberts reconstruction of superselection sectors under the HaagKastler framework. Beyond these islands the evidence is claimed rather than proved. The cobordism hypothesis classifies extended topological field theories by fully dualizable objects, yet the 2009 writeup is an informal proof sketch. The October 2026 four-dimensional quantum chromodynamics claim stands at existence claimed with manuscript and formalization withheld and verification pending, and the YangMills mass gap remains open. We present the classification results with their hypotheses and keep proved, claimed, and open statements apart throughout.",
website/content/manifest.json:152:    "abstractFull": "This paper assembles the registered results of the Classification of Mathematical Representations of Physical Systems into the three-layer architecture of Principia Physica: mathematical classification, physical realization, and empirical selection. The assembly keeps the three layers apart and separates proved statements from conjectural ones. Twenty background classification theorems and seven obstruction theorems are organized into seven classification regimes; a finite case analysis of the twenty-eight domains of the program comparison spine, with one boundary case, shows that fifteen carry a classification theorem with a finite or explicitly parameterized invariant, one is complete but unparameterized, one is a complete obstruction classification, seven remain open or claimed, three are impossible in the stated generality, one is undecidable, and one is decidable but unclassified. Eight reconstruction theorems recover objects from probes, each under hypotheses that cannot be dropped. The empirical layer admits no unique monotone metric in the quantum case, and no record validates the physical layer: the announced four-dimensional existence result carries the status existence claimed; manuscript and formalization withheld; verification pending, and the mass gap problem remains open. The structural classification statement enters only as a declared hypothesis, and a conditional reduction records what its five proof obligations would deliver. No record in the series carries a completed computer-checked proof.",
website/content/manifest.json:165:    "abstractFull": "This paper states the structural picture formed by the twelve parts of the Classification of Mathematical Representations of Physical Systems, a program asking whether mathematical representations of physical systems admit a structural classification analogous to the Classification of Finite Simple Groups. One ontology of forty-two definitions, one dependency graph, and one equivalence discipline run through the series. Three kinds of result organize its classification content. Complete invariants appear wherever the invariant is finite or explicitly parameterized: dimension vectors for finite-dimensional -algebras, Dynkin and Satake diagrams for semisimple Lie theory, classifying spaces for principal bundles, and the Murray-von Neumann and Connes data for amenable factors. Reconstruction theorems recover objects from probes under hypotheses that cannot be dropped. Seven obstruction theorems bound the scope of any classification, from uncountably many type factors to algorithmic unrecognizability in dimension four. Every equivalence in the series declares the structure it preserves, and equivalences that forget the symmetric layer fail in a proved counterexample. The structural classification conjecture is stated as the program\u2019s theorem target with its five proof obligations. The cross-volume consistency report records that the twelve parts share definitions, dependency discipline, and claim vocabulary without conflict.",
website/content/periodic-table.md:12:| **CLAIMED** | An announced result whose supporting artifacts are not publicly checkable. |
website/content/periodic-table.md:105:| 4D YM/QCD existence | Family VII/QFT | Existence claimed 2026-10-26 (QCD, GUT completion, pure YM subproblem, Balaban-based); 1147-page manuscript unpublished; claimed Lean formalization withheld; KITP verification pending | **CLAIMED** — never conflated with mass gap | [24][25][26] |
website/content/papers/vol-12-principia-physica.html:2:This paper assembles the registered results of the Classification of Mathematical Representations of Physical Systems into the three-layer architecture of Principia Physica: mathematical classification, physical realization, and empirical selection. The assembly keeps the three layers apart and separates proved statements from conjectural ones. Twenty background classification theorems and seven obstruction theorems are organized into seven classification regimes; a finite case analysis of the twenty-eight domains of the program comparison spine, with one boundary case, shows that fifteen carry a classification theorem with a finite or explicitly parameterized invariant, one is complete but unparameterized, one is a complete obstruction classification, seven remain open or claimed, three are impossible in the stated generality, one is undecidable, and one is decidable but unclassified. Eight reconstruction theorems recover objects from probes, each under hypotheses that cannot be dropped. The empirical layer admits no unique monotone metric in the quantum case, and no record validates the physical layer: the announced four-dimensional existence result carries the status existence claimed; manuscript and formalization withheld; verification pending, and the mass gap problem remains open. The structural classification statement enters only as a declared hypothesis, and a conditional reduction records what its five proof obligations would deliver. No record in the series carries a completed computer-checked proof.
website/content/papers/vol-12-principia-physica.html:7:<p>The central object is the identity <span class="math display">\[\mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F}_\alpha \rangle_{\mathfrak{C}},\]</span> which asserts that every admissible physical system is generated from a collection of fundamental structural families under admissible constructions. The identity is a conjecture and is never used here as a lemma. The results assembled around it are the classification regimes where theorems exist, the obstruction theorems that forbid classification elsewhere, the reconstruction theorems that recover objects from probes, and the empirical constraints that no mathematical classification can discharge.</p>
website/content/papers/vol-12-principia-physica.html:324:<td style="text-align: left;">Announced, manuscript unpublished, formalization withheld, verification pending</td>
website/content/papers/vol-12-principia-physica.html:348:<p>None of the registered claim entries resolves the four-dimensional Yang-Mills Millennium problem, which requires proving both existence of the quantum field theory and a strictly positive mass gap <a class="citation" href="#bib-corpus-23">[23]</a>. The announced existence work explicitly omits the mass gap, lacks public artifacts, and awaits independent verification <a class="citation" href="#bib-corpus-24">[24]</a>, <a class="citation" href="#bib-corpus-25">[25]</a>, <a class="citation" href="#bib-corpus-26">[26]</a>; it carries the status existence claimed; manuscript and formalization withheld; verification pending. The remaining entries restrict their scope to lattice approximations without establishing the continuum limit <a class="citation" href="#bib-corpus-30">[30]</a>, <a class="citation" href="#bib-corpus-31">[31]</a>, <a class="citation" href="#bib-corpus-32">[32]</a>, confine their arguments to three dimensions <a class="citation" href="#bib-corpus-33">[33]</a>, or remain unverified or retracted <a class="citation" href="#bib-corpus-28">[28]</a>, <a class="citation" href="#bib-corpus-29">[29]</a>. The Clay problem page lists the problem as unsolved <a class="citation" href="#bib-corpus-23">[23]</a>. Because constructive field theory currently lacks a demonstrated continuum mass gap, the realization layer for four-dimensional non-Abelian gauge theory remains open.</p>
website/content/papers/vol-12-principia-physica.html:374:<td style="text-align: left;">Every generated structure satisfies the admissibility conditions</td>
website/content/papers/vol-12-principia-physica.html:404:<p><strong>Remark 19</strong> (Generation and classification).  The five obligations concern generation, admissibility, identification, family definitions, and decomposition, and <a href="#thm:obstructions" data-reference-type="ref+label" data-reference="thm:obstructions">12</a> concerns classification by finite or parametric invariants and by algorithms. The two objectives do not contradict each other: finitely presented groups are generated from cyclic groups by free products and quotients, and their Markov properties are algorithmically undecidable <a class="citation" href="#bib-corpus-53">[49]</a>. The objectives meet only in regimes 1 and 2 of <a href="#tab:regimes" data-reference-type="ref+label" data-reference="tab:regimes">3</a>, where constituents carry classifying invariants and <a href="#thm:conditional" data-reference-type="ref+label" data-reference="thm:conditional">18</a> applies. In the sectors of <a href="#thm:obstructions" data-reference-type="ref+label" data-reference="thm:obstructions">12</a> the classification-layer objective of <a href="#def:layers" data-reference-type="ref+label" data-reference="def:layers">5</a> is unattainable without restricting the class or weakening the invariant notion.</p>
website/content/papers/vol-12-principia-physica.html:428:<p>At the realization layer, the reconstruction of an interacting four-dimensional quantum field theory from such data is claimed rather than established. The announced existence result carries the status existence claimed; manuscript and formalization withheld; verification pending <a class="citation" href="#bib-corpus-24">[24]</a>, <a class="citation" href="#bib-corpus-25">[25]</a>. At the empirical layer, the mass gap remains open <a class="citation" href="#bib-corpus-23">[23]</a>, lattice theorems hold only in restricted regimes <a class="citation" href="#bib-corpus-30">[30]</a>, <a class="citation" href="#bib-corpus-31">[31]</a>, <a class="citation" href="#bib-corpus-32">[32]</a>, and no entry of <a href="#tab:claims" data-reference-type="ref+label" data-reference="tab:claims">5</a> closes the continuum limit. The example therefore shows the three layers in three different states: proved at <span class="math inline">\(\mathcal{M}\)</span>, claimed at <span class="math inline">\(\mathcal{R}\)</span>, open at <span class="math inline">\(\mathcal{E}\)</span>.</p>
website/content/papers/vol-12-principia-physica.html:480:<p>Four limitations bound this synthesis. The assembly inherits the statuses of the program registry, and any status revision propagates. Three entries rest on single sources and were not independently re-verified here: the extra <span class="math inline">\(Z_2\)</span> sector of higher-form DHR theory <a class="citation" href="#bib-corpus-20">[20]</a>, the journal-published mass-gap claim <a class="citation" href="#bib-corpus-28">[28]</a>, and the Borel-reducibility obstruction announced at the survey level <a class="citation" href="#bib-corpus-59">[55]</a>. The literature survey behind the registry ran on the arXiv API plus known-URL fetches, so non-arXiv venues may be under-covered, and absence of a citation here is not evidence of absence. The regime taxonomy organizes the registered domains and proves a coverage statement about them; it does not classify all of mathematics.</p>
website/content/papers/vol-12-principia-physica.html:484:<p>What remains uncertain is equally sharp. The admissibility conditions are unfixed. The physical equivalence is unchosen. The realization and selection maps are stipulated and not constructed. The announced four-dimensional existence result carries the status existence claimed; manuscript and formalization withheld; verification pending, and the mass gap is open. No record carries a completed computer-checked proof. The central test of the realization layer, reconstruction of interacting dynamics and spacetime without presupposing spacetime, is unanswered.</p>
website/content/papers/vol-12-principia-physica.html:487:<p>The computational artifacts of this volume record the bookkeeping claims of the assembly and the finite-dimensional example of <a href="#sec:examples" data-reference-type="ref+label" data-reference="sec:examples">9</a>. The two files perform automated registry auditing and bookkeeping and exercise the worked example; they verify no mathematics. Both files accompany this paper in the CMRPS project repository at <a href="https://github.com/YonedaAI/cmrps" class="uri">https://github.com/YonedaAI/cmrps</a>, under <code>src/vol-12-principia-physica</code>. <a href="#tab:code" data-reference-type="ref+Label" data-reference="tab:code">8</a> maps each computational claim to the file and function that exercises it.</p>
website/content/papers/vol-12-principia-physica.html:501:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-12-principia-physica.html:506:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-12-principia-physica.html:511:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-12-principia-physica.html:516:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/synthesis.html:2:This paper states the structural picture formed by the twelve parts of the Classification of Mathematical Representations of Physical Systems, a program asking whether mathematical representations of physical systems admit a structural classification analogous to the Classification of Finite Simple Groups. One ontology of forty-two definitions, one dependency graph, and one equivalence discipline run through the series. Three kinds of result organize its classification content. Complete invariants appear wherever the invariant is finite or explicitly parameterized: dimension vectors for finite-dimensional <span class="math inline">\(C^*\)</span>-algebras, Dynkin and Satake diagrams for semisimple Lie theory, classifying spaces for principal bundles, and the Murray-von Neumann and Connes data for amenable factors. Reconstruction theorems recover objects from probes under hypotheses that cannot be dropped. Seven obstruction theorems bound the scope of any classification, from uncountably many type <span class="math inline">\(\mathrm{II}_1\)</span> factors to algorithmic unrecognizability in dimension four. Every equivalence in the series declares the structure it preserves, and equivalences that forget the symmetric layer fail in a proved counterexample. The structural classification conjecture is stated as the program’s theorem target with its five proof obligations. The cross-volume consistency report records that the twelve parts share definitions, dependency discipline, and claim vocabulary without conflict.
website/content/papers/synthesis.html:6:<p>The target of the program is the identity <span class="math display">\[\mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F}_\alpha \rangle_{\mathfrak{C}},\]</span> in which every admissible physical system is generated from a collection of fundamental structural families under admissible constructions. The identity is the program’s theorem target and is stated in full in <a href="#conj:cmrps" data-reference-type="ref+label" data-reference="conj:cmrps">1</a>. The results around it are of three kinds: classification theorems that supply complete invariants in restricted sectors, reconstruction theorems that recover objects from probes, and obstruction theorems that mark where no classification of the stated generality can exist.</p>
website/content/papers/synthesis.html:11:<p>Every part of the series works in one definitional substrate. The substrate is a category of representations of physical systems, a discipline of morphisms, a physical equivalence, a collection of structural families, and an invariant record. The definitions are stated once in the foundational part and reused across the series; later parts extend the list only by appending new identifiers. The identifiers and their roles appear in <a href="#tab:ontology" data-reference-type="ref+label" data-reference="tab:ontology">1</a>.</p>
website/content/papers/synthesis.html:57:<p>Completeness requires that every admissible physical system is represented in the closure <span class="math inline">\(\langle \mathfrak{F} \rangle_{\mathfrak{C}}\)</span>. Soundness requires that every generated structure satisfies the admissibility conditions of <a href="#def:admissibility" data-reference-type="ref+label" data-reference="def:admissibility">3</a>. Equivalence requires that different representations of the same physical system are identified correctly, which is where the preserved-layer requirement <a class="citation" href="#bib-corpus-74">[27]</a> constrains the choice of <span class="math inline">\(\simeq\)</span>. Structural characterization requires that the fundamental families have precise mathematical definitions; the ten candidate families of <a href="#tab:ontology" data-reference-type="ref+label" data-reference="tab:ontology">1</a> are named, and the admissibility conditions of <a href="#def:admissibility" data-reference-type="ref+label" data-reference="def:admissibility">3</a> select among them. Decomposition requires that systems in the targeted classes can be constructed from the fundamental families by the operations of <a href="#def:constructions" data-reference-type="ref+label" data-reference="def:constructions">2</a>; restricted forms of this obligation are established for finite-dimensional <span class="math inline">\(C^*\)</span>-algebras <a class="citation" href="#bib-corpus-9">[1]</a>, amenable factors <a class="citation" href="#bib-corpus-62">[5]</a>, <a class="citation" href="#bib-corpus-64">[6]</a>, and superselection categories <a class="citation" href="#bib-corpus-12">[10]</a>, <a class="citation" href="#bib-corpus-67">[11]</a>.</p>
website/content/papers/synthesis.html:150:<p>A result has been announced and its supporting artifacts are not publicly checkable. The four-dimensional existence announcement lives here.</p>
website/content/papers/synthesis.html:236:<p>An asymmetry separates reconstruction from classification. Reconstruction theorems recur across the series, each recovering an object from probes, and each under hypotheses that cannot be dropped. Complete classifications recur much less often and never outside finite or parametric regimes. The asymmetry is a structural feature of the subject matter rather than an artifact of the survey: the probe categories that reconstruction uses are richer invariants than the finite data that classification needs.</p>
website/content/papers/synthesis.html:253:<p>The forty-two definition identifiers are used with one meaning across all twelve parts, and later parts extend the list only by appending new identifiers.</p>
website/content/papers/synthesis.html:329:<p class="bibitem" id="bib-corpus-73"><span class="bib-num">[38]</span> S. Hernández-Cuenca, The holographic entropy cone for five regions, Physical Review D 100 (2019) 026004. <a href="https://doi.org/10.1103/PhysRevD.100.026004" class="uri">https://doi.org/10.1103/PhysRevD.100.026004</a></p>
website/content/papers/vol-11-completeness-obstructions.html:5:<p>The classification of finite simple groups is the model of what a total classification theorem looks like: every object of the domain falls into an explicitly described list of families and exceptions, and the list is exhaustive <a class="citation" href="#bib-solomon2001">[21]</a>. The research program of this series asks whether mathematical representations of physical systems admit an analogous classification. The question is precise enough to be attacked only after fixing an equivalence relation on representations, a notion of admissible system, and a catalogue of constructions from which complex systems are assembled. The central identity of the program, that every admissible system is generated by a fixed collection of structural families under a fixed set of constructions, remains a registered conjecture.</p>
website/content/papers/vol-11-completeness-obstructions.html:133:<p><em>Remark 10</em> (Assignment is evidence-shaped).  The assignment records where the classification evidence of each domain sits as of October 2026. A domain moves when new theorems arrive: the fusion-category entry moves if the open conjecture closes <a class="citation" href="#bib-fusionnlab">[26]</a>. One tracked claim sits outside the table because it rests on announcements rather than published proofs: an October 2026 existence claim for four-dimensional Yang-Mills and QCD, whose status is exactly the standing one, existence claimed; manuscript and formalization withheld; verification pending <a class="citation" href="#bib-openai">[30]</a>, <a class="citation" href="#bib-kitp">[31]</a>. Existence and the mass gap are separate questions and are never conflated; the Clay problem remains open <a class="citation" href="#bib-clay">[29]</a>, <a class="citation" href="#bib-kitp">[31]</a>.</p>
website/content/papers/vol-11-completeness-obstructions.html:208:<p>Full faithfulness is what carries the wild embedding, because it preserves the Hom-dimensions the universality property is built from; injectivity on isomorphism classes is what carries isomorphism behavior. Physical embeddings that deliberately identify systems fail the second hypothesis, and a coarse-graining map that forgets microscopic detail typically fails it as well, so the theorem is silent about classification programs run on coarse descriptions.</p>
website/content/papers/vol-11-completeness-obstructions.html:232:<p>The universal classification conjecture states that every admissible physical system is generated by a fixed collection of structural families under a fixed set of admissible constructions, up to a justified equivalence. Its proof obligations number five, and <a href="#tab:obligations" data-reference-type="ref+Label" data-reference="tab:obligations">3</a> gives their status against the evidence of this paper. The conjecture is a registered hypothesis and an object of analysis here; nothing in this section assumes it true or false.</p>
website/content/papers/vol-11-completeness-obstructions.html:236:<tr><td>Completeness</td><td>Every admissible system lies in the generated class</td><td>Open, conditional on the unfixed admissibility list</td></tr>
website/content/papers/vol-11-completeness-obstructions.html:237:<tr><td>Soundness</td><td>Every generated structure is admissible</td><td>Open, same conditionality</td></tr>
website/content/papers/vol-11-completeness-obstructions.html:242:<p>The completeness obligation quantifies over <span class="math inline">\(\mathrm{Phys}_{\mathrm{adm}}\)</span> and is therefore conditional on the admissibility list that <a href="#rem:unfixed" data-reference-type="ref+Label" data-reference="rem:unfixed">4</a> records as unfixed. Beyond the conditionality, <a href="#thm:transport" data-reference-type="ref+Label" data-reference="thm:transport">12</a> blocks the obligation in any formulation whose generated class contains a wild or undecidable sector isomorphism-reflectingly: the parameter space the classification needs cannot exist there. The obligation is open today and its unrestricted form collides with the register.</p>
website/content/papers/vol-11-completeness-obstructions.html:243:<p>The soundness obligation runs in the other direction, from the generated class to the admissibility conditions. It is vacuous until the conditions are stated, and it becomes checkable only after the list is fixed. No obstruction in the register touches it directly; its difficulty is definitional.</p>
website/content/papers/vol-11-completeness-obstructions.html:261:<p>A companion Haskell module encodes the taxonomy layer: representative systems of each regime, carrying instances of the shared family classes of the series taxonomy, with a regime tag mirroring <a href="#def:regime" data-reference-type="ref+Label" data-reference="def:regime">9</a>. The module is executable specification, and it is computational evidence of the same standing as the experiments. Its witness systems cover the McDuff sector, the wild module sector, the finite-dimensional <span class="math inline">\(C^*\)</span>-algebra sector, and the four-manifold sector, so each regime of <a href="#def:regime" data-reference-type="ref+Label" data-reference="def:regime">9</a> that has a concrete witness in this paper is represented. No artifact in this section is a machine-checked formalization, and none is presented as one.</p>
website/content/papers/vol-11-completeness-obstructions.html:262:<p>The experiments also mark what computation cannot do here. No finite run decides whether an algebraic family exists covering an isomorphism-class set, and no enumeration of small instances distinguishes a tame domain from a wild one at the boundary. The register theorems decide those questions, and the experiments only display their shadow on finite data.</p>
website/content/papers/vol-11-completeness-obstructions.html:263:<p>The experiments are deterministic and self-contained. Each script computes its output from definitions written in the script itself and from no external data, so a reader can rerun them and compare printed values against the claims of this section. The expected outputs are small enough to check by hand: the partition property of the regime table, the lists of dimension vectors at small <span class="math inline">\(N\)</span>, and the quotient-dimension values along the diagonal <span class="math inline">\(a = b = n\)</span> for <span class="math inline">\(m = 2\)</span> and <span class="math inline">\(m = 3\)</span>. Agreement is evidence for the claims as stated and nothing more.</p>
website/content/papers/vol-11-completeness-obstructions.html:275:<p><a href="#tab:code" data-reference-type="ref+Label" data-reference="tab:code">4</a> maps each computational claim of <a href="#sec:computational" data-reference-type="ref+Label" data-reference="sec:computational">8</a> to the file and function that demonstrates it. The artifacts live in <code>src/vol-11-completeness-obstructions/</code>. Each row is checked against the named code before publication.</p>
website/content/papers/vol-10-observational-equivalence.html:59:<p><em>Proof, by reference.</em> The construction of isocategorical groups and the proof appear in the original source <a class="citation" href="#bib-b2">[2]</a>, recorded in the series theorem registry as an obstruction result. The example pairs the affine symplectic group of a vector space over the field with two elements with a suitable affine pseudosymplectic group; the proofs run through triangular Hopf algebras <a class="citation" href="#bib-b2">[2]</a>. The tensor-category equivalence is monoidal and does not respect the commutativity constraint <a class="citation" href="#bib-b2">[2]</a>: the symmetric braiding is the layer the equivalence fails to preserve. This paper does not reprove the construction; it uses the statement as a constraint and searches for counterexamples to other criteria in <a href="#sec:search" data-reference-type="ref+Label" data-reference="sec:search">6</a>. The series status of the statement is a complete proof in the mathematical literature, not a machine-checked result. ◻</p>
website/content/papers/vol-10-observational-equivalence.html:118:<p><a href="#prop:equivrel" data-reference-type="ref+Label" data-reference="prop:equivrel">12</a> settles transitivity for functorially induced observational equivalence. The open question is whether indistinguishability generated by admissible experiments composes in interacting regimes. The series records this as unstudied, and the present paper does not close it. What can be said is conditional, and both regimes of the conditional statement are realistic.</p>
website/content/papers/vol-10-observational-equivalence.html:147:<p><strong>Proposition 19</strong> (Commutative restriction).  <em>For every operator monotone <span class="math inline">\(f\)</span> with <span class="math inline">\(f(1) = 1\)</span>, the quadratic form <span class="math inline">\(g_f^{\rho}\)</span> restricted to operators <span class="math inline">\(A\)</span> that are diagonal in an eigenbasis of <span class="math inline">\(\rho\)</span> equals <span class="math inline">\(\sum_i |A_{ii}|^2 / \lambda_i\)</span>, the classical Fisher form on the commutative subalgebra generated by <span class="math inline">\(\rho\)</span>. On commutative data the quantum monotone metrics therefore agree, and the parametric freedom of <a href="#thm:petzsudar" data-reference-type="ref+Label" data-reference="thm:petzsudar">18</a> is invisible.</em></p>
website/content/papers/vol-10-observational-equivalence.html:188:<p>A criterion that survives all three steps is not thereby correct. It is admissible so far, and the record of the search is part of the argument: which examples were run, which layers were named, which failure modes were ruled out. The series records no positive criterion for physical equivalence; the outcomes of <a href="#tab:criteria" data-reference-type="ref+Label" data-reference="tab:criteria">3</a> are the first run of the protocol.</p>
website/content/papers/vol-10-observational-equivalence.html:211:<p>The constructions of <a href="#sec:functors,sec:metrics" data-reference-type="ref+Label" data-reference="sec:functors,sec:metrics">Section Observation functors, Section Information-geometric distinguishability</a> run on explicit data. The explicit data cover a finite classical observation functor with its quotient classes, the qubit computation of <a href="#ex:monotone" data-reference-type="ref+Label" data-reference="ex:monotone">20</a> in full generality, groups of order 8 whose character tables agree, and a product of observations.</p>
website/content/papers/vol-10-observational-equivalence.html:340:<p>The choice of <span class="math inline">\(\simeq\)</span> moves from open to fixed only through concrete tasks, each stated so that it can fail. The first task is to fix the record category for a named class of systems: the admissible experiments, the isomorphisms of records, and the composition of records under interaction. Success means a construction to which <a href="#prop:equivrel" data-reference-type="ref+Label" data-reference="prop:equivrel">12</a> applies outside the toy model of <a href="#sec:examples" data-reference-type="ref+Label" data-reference="sec:examples">9</a>; failure means the class admits no well-formed observation functor. The second task is to determine whether bounded experimental indistinguishability composes in an interacting regime, the question <a href="#sec:functors" data-reference-type="ref+Label" data-reference="sec:functors">4</a> leaves open through <a href="#prop:composed" data-reference-type="ref+Label" data-reference="prop:composed">16</a>. Success means a theorem connecting the functorial relation of <a href="#sec:functors" data-reference-type="ref+Label" data-reference="sec:functors">4</a> with an operational relation between records; failure means a counterexample in which two systems are indistinguishable by every individual experiment and distinguishable by a joint one. The third task is to state a positive criterion for physical equivalence and run it through the protocol of <a href="#sec:protocol" data-reference-type="ref+Label" data-reference="sec:protocol">6.1</a>. Success means a criterion that survives the protocol and is argued for at the empirical layer; failure means another row of <a href="#tab:criteria" data-reference-type="ref+Label" data-reference="tab:criteria">3</a> closes negatively, which is itself a result the program accepts.</p>
website/content/papers/vol-01-foundations.html:59:<p><strong>Example 5</strong> (Lattice record).  Let <span class="math inline">\(X\)</span> be the set of vertices of a finite lattice, let <span class="math inline">\(\mathcal{O}\)</span> be the algebra of functions on <span class="math inline">\(X\)</span> generated by local gauge-invariant operators, let <span class="math inline">\(\mathcal{D}\)</span> be the update rule of a lattice gauge model, let <span class="math inline">\(\mathcal{S}\)</span> be the local gauge group acting on the links, and let <span class="math inline">\(\mathcal{C}\)</span> be the gluing of lattices along shared boundaries. Lattice models of gauge theory are the class where restricted theorems of the series have proved attainable and where the continuum limit remains a limiting procedure in the sense of Definition <a href="#def:morphism-kind" data-reference-type="ref" data-reference="def:morphism-kind">9</a>.</p>
website/content/papers/vol-01-foundations.html:190:<p>Each condition excludes a concrete pathology, and the list can be tested record by record. A tuple with a component named but not defined fails AC-1. An observable collection such as the two point masses on a two-point state space fails AC-2. A Hamiltonian vector field defined only on an open subset of the state space fails AC-3. A symmetry action that moves an observable outside the observable collection fails AC-4. A composition rule that produces records with undefined components on some inputs, with no declared domain, fails AC-5. A class of records with no declared equivalence relation fails AC-6. The conditions are strong enough to rule these out and weak enough to admit the restricted classes of Section <a href="#sec:restricted" data-reference-type="ref" data-reference="sec:restricted">8</a>, and that pairing is the design criterion for any revision of the list.</p>
website/content/papers/vol-01-foundations.html:291:<tr><td>Soundness</td><td>Every generated record satisfies the admissibility conditions</td><td>Open</td></tr>
website/content/papers/vol-01-foundations.html:315:<p>Nothing in the program is machine-checked at the time of writing: no formalization of any record has been accepted by a clean kernel-checked build, and a formalization that is announced but withheld does not qualify for the first label. The record of the announced existence result in constructive quantum field theory reads “existence claimed; manuscript and formalization withheld; verification pending” <a class="citation" href="#bib-openai-claim">[21]</a>, <a class="citation" href="#bib-kitp">[22]</a>, and an existence result and a mass-gap result are separate claims, the Yang-Mills mass gap remaining an open problem <a class="citation" href="#bib-clay">[23]</a>.</p>
website/content/papers/vol-01-foundations.html:323:<p>A revision of the framework has a clear path. The preservation laws need completion in three directions: the inter-kind composition rule of Corollary <a href="#cor:schema-not-category" data-reference-type="ref" data-reference="cor:schema-not-category">13</a>, the algebraic form of the laws for quantum and gauge records, and the status of dualities as equivalences between record presentations. The admissibility list needs testing against records the paper does not treat, in particular gauge records with constraints and lattice records with a continuum limit. The equivalence relation takes a positive criterion beyond the negative constraint of Definition <a href="#def:preserved-structure" data-reference-type="ref" data-reference="def:preserved-structure">17</a>. Each of these is a stated task with a stated failure mode.</p>
website/content/papers/vol-01-foundations.html:358:<caption><span class="tbl-num">Table 7.</span> Code evidence for the computational claims of the paper. Each row names the claim, the artifact that carries the computation, and the check performed.</caption>
website/content/papers/vol-01-foundations.html:359:<tr><th>Claim</th><th>Artifact</th><th>Check</th></tr>
website/content/papers/vol-01-foundations.html:365:<tr><td>Taxonomy instances compile against the shared classes and run their demo</td><td>with</td><td>Build transcript and demo output recorded in the evidence file</td></tr>
website/content/papers/vol-07-gauge-qft.html:2:We develop the classification of gauge structures and quantum field theories within the CMRPS program. The subject divides into two territories of unequal evidential standing. The established territory contains the KillingCartan classification of semisimple Lie algebras, the highest-weight classification of their finite-dimensional representations, the classification of principal <span class="math inline">\(G\)</span>-bundles by homotopy classes of maps into the classifying space <span class="math inline">\(BG\)</span>, characteristic classes as pullbacks of universal classes, and anomalies as cohomological obstructions that gate quantization. The restricted territory contains functorial topological field theories under the Atiyah axioms and the DoplicherRoberts reconstruction of superselection sectors under the HaagKastler framework. Beyond these islands the evidence is claimed rather than proved. The cobordism hypothesis classifies extended topological field theories by fully dualizable objects, yet the 2009 writeup is an informal proof sketch. The October 2026 four-dimensional quantum chromodynamics claim stands at existence claimed with manuscript and formalization withheld and verification pending, and the YangMills mass gap remains open. We present the classification results with their hypotheses and keep proved, claimed, and open statements apart throughout.
website/content/papers/vol-07-gauge-qft.html:5:<p>Gauge theories and quantum field theories occupy the point in the CMRPS program where classification is strongest on the geometric side and weakest on the analytic side. This volume takes the classification problem for its subject: which gauge structures and which quantum field theories are determined, up to a stated equivalence, by an explicit and computable invariant, and which are not. The answer splits sharply. For principal bundles, semisimple Lie algebras, their finite-dimensional representations, and the obstruction content of anomalies, complete classification theorems exist and are proved in the standard literature. For functorial topological field theories in low dimensions the position is similar. For extended topological field theories the classification is claimed on the strength of a proof sketch. For four-dimensional interacting quantum field theories the position is a claims register: one existence result is announced with its artifacts withheld, the mass gap is open, and several lower-rung claims carry statuses ranging from journal-published-and-unverified to withdrawn.</p>
website/content/papers/vol-07-gauge-qft.html:10:<p>The mathematical classification of gauge and quantum field theories splits into an established topological and algebraic core and an unverified analytic frontier. Complete classification invariants characterize Lie symmetries, bundle topologies, two-dimensional topological field theories, and localized superselection sectors: Dynkin diagrams, universal characteristic classes, Frobenius algebras, and unitary tensor categories do this work. The classification of four-dimensional continuum field theories, connection moduli spaces, and non-perturbative mass spectra remains conditional, claimed without public proof artifacts, or open.</p>
website/content/papers/vol-07-gauge-qft.html:44:<tr><td>Four-dimensional interacting theories</td><td>Balaban-program methods as announced</td><td>Not established</td><td>Claimed with artifacts withheld</td></tr>
website/content/papers/vol-07-gauge-qft.html:158:<p><strong>Definition 27</strong> (Local net).  A local net on Minkowski spacetime assigns to each double cone <span class="math inline">\(\mathcal{O}\)</span> a unital <span class="math inline">\(\mathrm{C}^*\)</span>-algebra <span class="math inline">\(\mathcal{A}(\mathcal{O})\)</span> such that isotony holds for inclusions <span class="math inline">\(\mathcal{O}_1 \subset \mathcal{O}_2\)</span>, graded locality holds for spacelike separation, the Poincaré group acts by automorphisms covariantly, the spectrum of the generator of time translations is contained in the closed forward cone, and a vacuum state exists <a class="citation" href="#bib-haag-kastler">[19]</a>. A representation of the net is a representation of the quasilocal algebra <span class="math inline">\(\mathcal{A}\)</span> that is generated by the local algebras.</p>
website/content/papers/vol-07-gauge-qft.html:195:<p>For a YangMills system on a four-manifold with gauge group <span class="math inline">\(G\)</span>, the state component <span class="math inline">\(\mathcal{S}_T\)</span> is the moduli space of connections modulo gauge, classified only in its topological stratification by the bundle data. The observable component <span class="math inline">\(\mathcal{O}_T\)</span> is generated by Wilson loops and curvature polynomials, with no classification theorem in this volume. The dynamics component <span class="math inline">\(\mathcal{D}_T\)</span> is the YangMills functional, outside all our theorems. The symmetry component <span class="math inline">\(\mathcal{G}_T\)</span> is the gauge group together with its global form, classified by Theorem <a href="#thm:killing-cartan" data-reference-type="ref" data-reference="thm:killing-cartan">6</a> and Example <a href="#ex:global-form" data-reference-type="ref" data-reference="ex:global-form">15</a>. The representation component <span class="math inline">\(\mathcal{R}_T\)</span> is the matter content, classified by Theorem <a href="#thm:highest-weight" data-reference-type="ref" data-reference="thm:highest-weight">7</a> and constrained by Proposition <a href="#prop:cancellation" data-reference-type="ref" data-reference="prop:cancellation">23</a>.</p>
website/content/papers/vol-07-gauge-qft.html:200:<p>The claim ladder separates an announced result, a manuscript, a machine-checked formalization, an independently verified proof, and an accepted theorem; a result moves up the ladder only by an artifact that can be checked, and each row of the register below keeps its current rung. Table <a href="#tab:rigorous" data-reference-type="ref" data-reference="tab:rigorous">2</a> collects rigorous results in restricted regimes and the official problem status. Table <a href="#tab:claims" data-reference-type="ref" data-reference="tab:claims">3</a> collects claims that lack public proof artifacts.</p>
website/content/papers/vol-07-gauge-qft.html:211:<caption><span class="tbl-num">Table 3.</span> Claims without public proof artifacts, as of 29 October 2026. None of these rows is a theorem of this volume or of the public record.</caption>
website/content/papers/vol-07-gauge-qft.html:213:<tr><td>OpenAI existence claim</td><td>Rigorous existence of quantum chromodynamics, a simplest grand unified completion, and pure YangMills theory as a subproblem, by Balaban-program methods <a class="citation" href="#bib-openai">[29]</a>, <a class="citation" href="#bib-kitp">[22]</a></td><td>Existence claimed. Manuscript and formalization withheld. Verification pending before a committee chaired by Gross with Douglas, Jaffe, Klebanov, and Nekrasov</td></tr>
website/content/papers/vol-07-gauge-qft.html:218:<p>The OpenAI claim carries the strongest external attention and the weakest public evidence. Its status string, binding on every mention of the work, is: existence claimed; manuscript and formalization withheld; verification pending <a class="citation" href="#bib-openai">[29]</a>, <a class="citation" href="#bib-kitp">[22]</a>. Nothing withheld from the public record can be machine-checked. The release of the artifacts is a tracked event; until then the entry belongs to the claims register and not among theorems.</p>
website/content/papers/vol-07-gauge-qft.html:222:<p>If the OpenAI claim is validated, the admissible set of four-dimensional interacting theories will contain at least one rigorous member, and the classification will record where it sits relative to the known families. Until the artifacts are released, no result of this volume depends on the claim. Classifying the structures that are already proved does not wait on the verdict.</p>
website/content/papers/vol-07-gauge-qft.html:237:<p>The constructive quantum field theory claims have a tracked event. The release of the withheld manuscript and the claimed formalization behind the October 2026 existence announcement would move that row of Table <a href="#tab:claims" data-reference-type="ref" data-reference="tab:claims">3</a> from withheld to publicly checkable, and a committee verdict would move it further. Until the release, no result of this volume depends on it. The competing journal-published construction of a four-dimensional YangMills theory with a mass gap carries a second question: where its continuum limit is closed and where it is assumed. An audit of that construction is the sharpest available test of the mass-gap claim, and the audit has not been done.</p>
website/content/papers/vol-07-gauge-qft.html:250:<p>The two incomplete places are the extended topological field theory classification and four-dimensional constructive quantum field theory. The first is claimed on the strength of a proof sketch and registered as such. The second is a claims register: one existence result announced with its artifacts withheld, one mass gap open, one journal-published unverified construction, one withdrawn preprint, regime-restricted lattice theorems, and one outline. The ladder keeps them apart, and the classification program does not import any of them as a dependency.</p>
website/content/papers/vol-07-gauge-qft.html:253:<p>The volume closes where the classification is sharp. Gauge algebras, matter representations, bundles, anomaly-free configurations, and two-dimensional topological theories are classified by explicit invariants under stated equivalences. The extended topological classification is claimed and registered as claimed. Four-dimensional existence is claimed with its artifacts withheld and the mass gap is open. The claim ladder keeps those rows apart, and the classification program carries the proved rows forward without waiting on the others.</p>
website/content/papers/vol-03-irreducibility-decomposition.html:225:<p><strong>Corollary 38</strong> (Closure of a finite set of blocks).  <em>Let <span class="math inline">\(S = \{M_{n_1}(\mathbb{C}), \dots, M_{n_k}(\mathbb{C})\}\)</span> and let <span class="math inline">\(\mathcal{C} = \{\oplus, \otimes\}\)</span>. The closure <span class="math inline">\(\langle S \rangle_{\mathcal{C}}\)</span> is the class of unital finite-dimensional complex C*-algebras whose dimension vector entries lie in the multiplicative semigroup generated by <span class="math inline">\(n_1, \dots, n_k\)</span> in <span class="math inline">\(\mathbb{N}_{\geq 1}\)</span>.</em></p>
website/content/papers/vol-03-irreducibility-decomposition.html:240:<p><em>Example 39</em> (Qubit closure).  For <span class="math inline">\(S = \{ \mathbb{C}, M_2(\mathbb{C}) \}\)</span> under direct sum and tensor product, the multiplicative semigroup generated by <span class="math inline">\(1\)</span> and <span class="math inline">\(2\)</span> is <span class="math inline">\(\{1, 2, 4, 8, \dots\}\)</span>, and the closure is the class of algebras whose dimension vectors have entries that are powers of two. The algebras <span class="math inline">\(M_3(\mathbb{C})\)</span> and <span class="math inline">\(M_2(\mathbb{C}) \oplus M_3(\mathbb{C})\)</span> are outside the closure. The enumeration of <a href="#sec:computation" data-reference-type="ref+label" data-reference="sec:computation">13</a> checks this arithmetic.</p>
website/content/papers/vol-03-irreducibility-decomposition.html:242:<p>The closure of a finite set of blocks under direct sum and tensor product is always infinite as a class, because tensor powers keep producing new sizes, and the closure is always decidable at the level of individual dimension vectors: entry size belongs to a finitely generated multiplicative semigroup of the positive integers, and membership in such a semigroup is decidable. The computability of the closure is a peculiarity of the finite-dimensional regime, where the constructions act on integer vectors; nothing here extends it to closure taken over the full admissible construction list of the framework section.</p>
website/content/papers/vol-03-irreducibility-decomposition.html:306:<p>Three computational artifacts accompany this paper. They are evidence about the combinatorics of the theorems above; no statement in this volume is established by them.</p>
website/content/papers/vol-03-irreducibility-decomposition.html:307:<p>The first artifact is an executable taxonomy layer in Haskell. Its module declares instances of the shared family, construction, and decomposition classes for the systems treated here: matrix blocks and their direct sums, tensor products of blocks, and Kraus normal form data. Multiplicity matrices appear as data types mirroring <a href="#def:multiplicity-matrix" data-reference-type="ref+label" data-reference="def:multiplicity-matrix">19</a>. The names mirror the definitions of this paper and the mechanization targets listed in the accompanying verification record. The Haskell layer is computational evidence, validated against kernel-checked specifications through cross-audit, and it is not verified by any proof assistant.</p>
website/content/papers/vol-03-irreducibility-decomposition.html:308:<p>The second artifact is a set of enumeration experiments in Python. One experiment enumerates dimension vectors of the closure of <span class="math inline">\(\{\mathbb{C}, M_2(\mathbb{C})\}\)</span> under direct sum and tensor product up to total dimension <span class="math inline">\(64\)</span> and checks the arithmetic of <a href="#prop:construction-arithmetic" data-reference-type="ref+label" data-reference="prop:construction-arithmetic">37</a>. It returns <span class="math inline">\(1085\)</span> dimension vectors, all of whose entries lie in the multiplicative semigroup <span class="math inline">\(\{1, 2, 4, 8, 16, 32, 64\}\)</span> generated by <span class="math inline">\(1\)</span> and <span class="math inline">\(2\)</span>, and it confirms that <span class="math inline">\(M_3(\mathbb{C})\)</span> lies outside the closure. A second experiment enumerates multiplicity matrices for the three block pairs of <a href="#tab:homs" data-reference-type="ref+label" data-reference="tab:homs">1</a> and returns exactly <span class="math inline">\(2\)</span>, <span class="math inline">\(1\)</span>, and <span class="math inline">\(6\)</span> solutions, matching the conjugacy-class counts of the table entry by entry. A third computes Choi ranks of completely positive maps: for a random map of minimal rank <span class="math inline">\(1\)</span>, presented Kraus families of sizes <span class="math inline">\(1\)</span>, <span class="math inline">\(2\)</span>, <span class="math inline">\(3\)</span>, <span class="math inline">\(5\)</span>, and <span class="math inline">\(8\)</span> all return Choi rank <span class="math inline">\(1\)</span> and reproduce the same map, while the identity channel and conjugation by the Pauli <span class="math inline">\(Z\)</span> operator both have rank <span class="math inline">\(1\)</span> and differ on the Pauli <span class="math inline">\(X\)</span> operator. The experiments run in seconds on ordinary hardware and record their seeds in the source.</p>
website/content/papers/vol-03-irreducibility-decomposition.html:309:<p>The third artifact is a code evidence table, given in the appendix, that maps each computational claim to the file and function that exhibits it.</p>
website/content/papers/vol-04-yoneda-classification.html:100:<p><strong>Theorem 16</strong> (Representability does not imply classifiability).  <em>Let <span class="math inline">\(n \geq 3\)</span>, let <span class="math inline">\(S = k[x_{ij}]\)</span> be the polynomial ring over a field <span class="math inline">\(k\)</span> in the entries of a generic <span class="math inline">\(n \times n\)</span> matrix, let <span class="math inline">\(R = S/(\det(x_{ij}))\)</span> be the coordinate ring of the generic determinant hypersurface, and let <span class="math inline">\(\mathcal{C}\)</span> be the category of finitely generated maximal Cohen-Macaulay <span class="math inline">\(R\)</span>-modules of rank two, with <span class="math inline">\(R\)</span>-module homomorphisms as morphisms. The objects of <span class="math inline">\(\mathcal{C}\)</span> admit no parametrization by a finite-dimensional variety over <span class="math inline">\(k\)</span> in the sense of Definition <a href="#def:classify" data-reference-type="ref" data-reference="def:classify">15</a>, while <span class="math inline">\(y\)</span> is fully faithful on <span class="math inline">\(\mathcal{C}\)</span>. Full faithfulness of the Yoneda embedding therefore does not imply the existence of a classification theorem.</em></p>
website/content/papers/vol-04-yoneda-classification.html:165:<p><em>Proof.</em> Ultrafilters of a Boolean algebra <span class="math inline">\(B\)</span> form a compact zero-dimensional space with the topology generated by the sets of ultrafilters containing each element; the clopen algebra of that space recovers <span class="math inline">\(B\)</span>. The two constructions are mutually inverse up to natural isomorphism <a class="citation" href="#bib-stone">[4]</a>. ◻</p>
website/content/papers/vol-04-yoneda-classification.html:243:<p>Three claims of this paper have computational evidence and none has a computational proof. The experiment files in <code>src/vol-04-yoneda-classification/</code> run the checks, and the module <code>Instances.hs</code> records the taxonomy declarations for the volume’s four systems: a commutative probe system in the sense of Remark <a href="#ex:classical" data-reference-type="ref" data-reference="ex:classical">6</a>, a Boolean probe system, a finite-group representation system, and a quantum channel system in the sense of Remark <a href="#ex:quantum" data-reference-type="ref" data-reference="ex:quantum">5</a>. The profile data of Definition <a href="#def:profile" data-reference-type="ref" data-reference="def:profile">2</a> appears in the module in the following executable shape, where the action field is the presheaf action of the definition: precomposition of a relationship along a probe morphism.</p>
website/content/papers/vol-04-yoneda-classification.html:284:<p>The taxonomy declarations record vocabulary: the abstract components of the probe system and the group system are opaque identifiers, so those declarations index the definitions of the taxonomy rather than encode mathematics at the type level. The typed channel fragment and the Python experiments are the computational evidence proper. No claim of machine verification is made anywhere in this volume; a later mechanization could audit the executable models against kernel-checked specifications, which would be a cross-audit of models rather than a verification of the claims.</p>
website/content/papers/vol-04-yoneda-classification.html:293:<p><em>Evidence discipline.</em> The computational layer of <a href="#sec:computation" data-reference-type="ref+label" data-reference="sec:computation">7</a> evidences statements already proved in the paper or cited from the literature; it proves nothing on its own, and no claim of the paper is promoted by computation. The taxonomy declarations of <a href="#sec:computation" data-reference-type="ref+label" data-reference="sec:computation">7</a> are executable models of the definitions, not verified artifacts, and no claim of machine verification is made anywhere in this volume. Should a later mechanization check these models against kernel-checked specifications, the result would be a cross-audit of executable models, not a verification of the mathematical claims.</p>
website/content/papers/vol-02-structural-families.html:14:<p>Two equivalence relations run through the paper. Mathematical equivalence is isomorphism of the record in the ambient category of each component. Physical equivalence, written <span class="math inline">\(\simeq\)</span>, is a chosen equivalence relation on objects and is strictly coarser in general. Two mathematical descriptions may be physically equivalent without being mathematically isomorphic. Every classification statement below fixes which relation is in force.</p>
website/content/papers/vol-02-structural-families.html:237:<p>Take a finite graph <span class="math inline">\(\Lambda\)</span> with a compact structure group <span class="math inline">\(G\)</span> and a configuration space of <span class="math inline">\(G\)</span>-valued edge assignments modulo the gauge action at the vertices. The record is: state space the quotient configuration space, observables the gauge-invariant functions generated by Wilson loops, dynamics the transfer operator, symmetries the gauge group, and composition the disjoint union of graphs.</p>
website/content/papers/vol-02-structural-families.html:292:<p><em>Proof.</em> Take <span class="math inline">\(M\)</span> a compact Kähler manifold with integral Kähler form <span class="math inline">\(\omega\)</span>, let <span class="math inline">\(L \to M\)</span> be the corresponding positive line bundle, and let <span class="math inline">\(\mathcal{H}_L\)</span> be the space of holomorphic sections of <span class="math inline">\(L\)</span>. For <span class="math inline">\(f \in C^\infty(M)\)</span> let <span class="math inline">\(T_f\)</span> be the Toeplitz operator on <span class="math inline">\(\mathcal{H}_L\)</span> that multiplies by <span class="math inline">\(f\)</span> and then projects back to <span class="math inline">\(\mathcal{H}_L\)</span>. The <span class="math inline">\(C^*\)</span>-algebra generated by the operators <span class="math inline">\(T_f\)</span> is noncommutative whenever <span class="math inline">\(\dim \mathcal{H}_L &gt; 1\)</span>, since <span class="math inline">\(T_f T_g - T_g T_f\)</span> is nonzero for suitable <span class="math inline">\(f\)</span> and <span class="math inline">\(g\)</span>. The record whose state space is <span class="math inline">\(M\)</span> with its symplectic form, whose observable algebra is this Toeplitz <span class="math inline">\(C^*\)</span>-algebra, whose symmetries are the biholomorphisms of <span class="math inline">\(M\)</span> lifting to <span class="math inline">\(L\)</span>, and whose dynamics is the quantization of a Hamiltonian on <span class="math inline">\(M\)</span>, presents symplectic, operator-algebraic, and geometric structure at once. If the families were mutually exclusive, this record would lie in none of them or in more than one, and the second option contradicts exclusivity. ◻</p>
website/content/papers/vol-02-structural-families.html:295:<p>Two further relations between families are worth naming. A family may be a special case of another: the commutative unital <span class="math inline">\(C^*\)</span>-algebras are a full subcategory of the operator-algebra family and are equivalent to compact Hausdorff spaces, so the two presentations carry the same information <a class="citation" href="#bib-gelfand-duality">[24]</a>. A family may be generated from another under constructions, in the sense of <a href="#def:structural-family" data-reference-type="ref+Label" data-reference="def:structural-family">4</a>. Both relations are structural statements about the families, and neither is a statement about the physical systems the families represent.</p>
website/content/papers/vol-05-classical-systems.html:106:<p><em>Proof.</em> The bracket <span class="math inline">\(\{F, f\} = \pi(dF, df)\)</span> vanishes for all <span class="math inline">\(f\)</span> if and only if <span class="math inline">\(dF\)</span> annihilates the image of <span class="math inline">\(\pi^{\sharp}\)</span>, and the image of <span class="math inline">\(\pi^{\sharp}\)</span> spans the tangent spaces of the leaves. So <span class="math inline">\(F\)</span> has vanishing differential along the leaves, which on each connected leaf means <span class="math inline">\(F\)</span> is constant. On <span class="math inline">\(\mathfrak{g}^{*}\)</span> the condition <span class="math inline">\(\{F, f\} = 0\)</span> for all linear functions <span class="math inline">\(f(\eta) = \langle \eta, x \rangle\)</span> reads <span class="math inline">\(\langle \xi, [\nabla F(\xi), x] \rangle = 0\)</span> for all <span class="math inline">\(x\)</span>, which is the infinitesimal form of coadjoint invariance. For <span class="math inline">\(\mathfrak{so}(3)\)</span> the invariant polynomials are generated by the quadratic form <span class="math inline">\(|\xi|^{2}\)</span>, and <a href="#ex:lie-poisson" data-reference-type="ref+label" data-reference="ex:lie-poisson">15</a> identifies its level sets with the leaves. ◻</p>
website/content/papers/vol-05-classical-systems.html:213:<p><strong>Theorem 35</strong> (Nekhoroshev estimate).  <em>Let <span class="math inline">\(H = H_0 + \varepsilon H_1\)</span> be a steep integrable Hamiltonian system with <span class="math inline">\(n\)</span> degrees of freedom and let <span class="math inline">\(H_0(I)\)</span> be the integrable part in action variables. There are positive constants <span class="math inline">\(c\)</span>, <span class="math inline">\(a\)</span>, and <span class="math inline">\(b\)</span> depending on the system such that, for <span class="math inline">\(\varepsilon\)</span> small, every trajectory satisfies <span class="math display">\[\| I(t) - I(0) \| \leq c \varepsilon^{b}
website/content/papers/vol-08-spacetime-reconstruction.html:91:<p><em>Proof.</em> The Levi-Civita connection of a product metric is the direct sum of the factor connections, so parallel transport preserves the splitting <span class="math inline">\(T(M_1 \times M_2) = TM_1 \oplus TM_2\)</span> of tangent spaces into horizontal and vertical parts. By the Ambrose-Singer theorem the restricted holonomy algebra is generated by parallel translates of curvature endomorphisms. The curvature of the product splits as <span class="math inline">\(R = R_1 \oplus R_2\)</span>, each factor curvature acting only on its own summand, so the generated algebra is <span class="math inline">\(\mathfrak{hol}^0(g_1) \oplus \mathfrak{hol}^0(g_2)\)</span>. Exponentiating gives the group identity for restricted holonomy. No completeness assumption is used; the identity concerns the restricted group, which is generated by contractible loops. ◻</p>
website/content/papers/vol-08-spacetime-reconstruction.html:98:<p><em>Proof.</em> <span class="math inline">\(\mathrm{Hol}^0(g)\)</span> is generated by parallel transport along contractible loops, hence connected and contained in the identity component <span class="math inline">\(\mathrm{SO}(1,n-1)^{\uparrow}\)</span> on every Lorentzian manifold, independently of orientability. Time-orientability is exactly the condition that parallel transport preserves time-orientation on all loops, so <span class="math inline">\(\mathrm{Hol}(g)\)</span> lies in the orthochronous group. The quotient of a Lie group by its identity component is countable in the intrinsic topology of the quotient, though it need not be discrete in the subspace topology of <span class="math inline">\(\mathrm{O}(1,n-1)\)</span>. ◻</p>
website/content/papers/vol-08-spacetime-reconstruction.html:257:<p><strong>Lemma 32</strong> (Strong subadditivity from subadditivity and monogamy).  <em>For three single regions, strong subadditivity follows from subadditivity together with monogamy of mutual information. At <span class="math inline">\(n = 3\)</span> the strong subadditivity family is therefore a consequence rather than an independent input. This argument covers three-region instances only: at <span class="math inline">\(n = 2\)</span> monogamy is vacuous, and at <span class="math inline">\(n = 4\)</span> the strong subadditivity instances involving four regions are not generated by three-region monogamy and remain independent inputs of <a href="#thm:cone" data-reference-type="ref+Label" data-reference="thm:cone">28</a>.</em></p>
website/content/papers/vol-08-spacetime-reconstruction.html:288:<p>Two unrelated topologies share the name Alexandrov in English transliteration. The open-diamond topology on a spacetime, due to A. D. Alexandrov, is generated by the sets <span class="math inline">\(I^+(p) \cap I^-(q)\)</span> and is sensitive to causality; the up-set topology on a poset, due to P. S. Alexandroff, is generated by up-sets and is generally not <span class="math inline">\(T_1\)</span>. The two are distinguished by name throughout what follows.</p>
website/content/papers/vol-08-spacetime-reconstruction.html:337:<p>Three experiments accompany the claims above. They are recorded as evidence, run from <code>src/vol-08-spacetime-reconstruction/</code>, and checked by the paper’s code evidence appendix. None of them proves anything: they test that the definitions behave as the proofs say on finite instances. The claims each experiment probes are listed in <a href="#tab:checks" data-reference-type="ref+Label" data-reference="tab:checks">7</a> and <a href="#tab:code" data-reference-type="ref+Label" data-reference="tab:code">8</a>.</p>
website/content/papers/vol-08-spacetime-reconstruction.html:350:<caption><span class="tbl-num">Table 7.</span> Executable checks and the exact claims they probe. The verdict column records what the run shows; no entry is a proof.</caption>
website/content/papers/vol-08-spacetime-reconstruction.html:360:<p><a href="#tab:haskell" data-reference-type="ref+Label" data-reference="tab:haskell">6</a> states which formal object each Haskell type stands for, and <a href="#tab:checks" data-reference-type="ref+Label" data-reference="tab:checks">7</a> states what each run demonstrates; every file is rerunnable and its output comparable with the propositions in the body. A row that fails to match its claim is removed together with the claim.</p>
website/content/papers/vol-08-spacetime-reconstruction.html:448:<caption><span class="tbl-num">Table 8.</span> Code evidence: claim, file, and the function or declaration that probes it. The audit of this table is recorded with the paper’s verification artifacts.</caption>
website/content/papers/vol-09-gravity-information-geometry.html:119:<p>The failure of uniqueness is structural, not an artifact of the qubit. The Petz family is infinite in every dimension <span class="math inline">\(d \geq 2\)</span>, and the ambiguity appears already in the two-level system. Any physical statement of the form “the geometry of the quantum state space is <span class="math inline">\(G\)</span>” must therefore name <span class="math inline">\(f\)</span>, or must derive <span class="math inline">\(f\)</span> from independent principles. This constraint carries into every proposed gravity-information dictionary in <a href="#sec:correspondence" data-reference-type="ref+label" data-reference="sec:correspondence">10</a>.</p>
website/content/papers/vol-09-gravity-information-geometry.html:228:<p><strong>Theorem 43</strong> (Holographic entropy cone).  <em>In static holographic settings with <span class="math inline">\(N\)</span> boundary subregions of a state purified by a complement <a class="citation" href="#bib-bao">[1]</a>, the complete linear entropy inequalities for <span class="math inline">\(N = 2, 3, 4\)</span> are generated by subadditivity, the Araki-Lieb inequalities, and monogamy of mutual information. For <span class="math inline">\(N = 5\)</span> five further symmetry orbits of five-party inequalities, including the cyclic five-party inequality, are required, and the resulting description is complete <a class="citation" href="#bib-hc5">[11]</a>. For six and more regions the complete inequality set is unknown. For each fixed <span class="math inline">\(N\)</span> there are only finitely many independent inequalities.</em></p>
website/content/papers/vol-09-gravity-information-geometry.html:308:<p>The monotonicity experiment verifies <a href="#prop:monotone" data-reference-type="ref+label" data-reference="prop:monotone">14</a> numerically. For two thousand random interior points <span class="math inline">\(p\)</span> of the four-outcome simplex and random stochastic maps from four outcomes to three, the smallest eigenvalue of <span class="math inline">\(g_p - (D\varphi)^{\mathsf{T}} g_{\varphi p} (D\varphi)\)</span> restricted to the tangent space was <span class="math inline">\(1.028\)</span> at worst. The eigenvalues are taken in the ambient Euclidean metric on an orthonormal tangent basis, since a difference of metric tensors has no canonical eigenvalues without a reference metric; the positive floor is a sampling artifact of random maps avoiding the coarse-grainings where equality holds.</p>
website/content/papers/vol-09-gravity-information-geometry.html:352:<p class="bibitem" id="bib-braunstein-caves"><span class="bib-num">[2]</span> S. L. Braunstein and C. M. Caves, “Statistical distance and the geometry of quantum states,” <em>Physical Review Letters</em> 72 (1994) 3439. DOI: 10.1103/PhysRevLett.72.3439.</p>
website/content/papers/vol-09-gravity-information-geometry.html:355:<p class="bibitem" id="bib-dhw"><span class="bib-num">[5]</span> X. Dong, D. Harlow, and A. C. Wall, “Reconstruction of bulk operators within the entanglement wedge in gauge-gravity duality,” <em>Physical Review Letters</em> 117 (2016) 021601. arXiv:1601.05416.</p>
website/content/papers/vol-09-gravity-information-geometry.html:361:<p class="bibitem" id="bib-hc5"><span class="bib-num">[11]</span> S. Hernández-Cuenca, “Holographic entropy cone for five regions,” <em>Physical Review D</em> 100 (2019) 026004. DOI: 10.1103/PhysRevD.100.026004.</p>
website/content/papers/vol-09-gravity-information-geometry.html:364:<p class="bibitem" id="bib-jacobson"><span class="bib-num">[14]</span> T. Jacobson, “Thermodynamics of spacetime: the Einstein equation of state,” <em>Physical Review Letters</em> 75 (1995) 1260. DOI: 10.1103/PhysRevLett.75.1260.</p>
website/content/papers/vol-09-gravity-information-geometry.html:365:<p class="bibitem" id="bib-jac2016"><span class="bib-num">[15]</span> T. Jacobson, “Entanglement equilibrium and the Einstein equation,” <em>Physical Review Letters</em> 116 (2016) 201101. DOI: 10.1103/PhysRevLett.116.201101.</p>
website/content/papers/vol-09-gravity-information-geometry.html:373:<p class="bibitem" id="bib-ruppeiner"><span class="bib-num">[23]</span> G. Ruppeiner, “Thermodynamics: a Riemannian geometric model,” <em>Physical Review A</em> 20 (1979) 1608. DOI: 10.1103/PhysRevA.20.1608.</p>
website/content/papers/vol-09-gravity-information-geometry.html:374:<p class="bibitem" id="bib-rt"><span class="bib-num">[24]</span> S. Ryu and T. Takayanagi, “Holographic derivation of entanglement entropy from AdS/CFT,” <em>Physical Review Letters</em> 96 (2006) 181602. arXiv:hep-th/0603001.</p>

exec
/usr/local/bin/zsh -lc 'cat website/lib/macros.ts' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
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
/usr/local/bin/zsh -lc "rg -n -i 'reviewer|pipeline|revision|draft|todo|audit|verification artifacts|research/|REPORT.md|founding document' website/content/periodic-table.md website/content/papers | cut -c1-700" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
website/content/periodic-table.md:5:**Nature of this chart.** A research framework for classification, not a completed classification. Completeness is a theorem to investigate (Founding Document 02); the central conjecture it serves is registered as T-CMRPS-01 and remains a **conjecture**.
website/content/periodic-table.md:16:Citation convention: bracketed numbers resolve to the Sources list of `research/cmrps-research-map/REPORT.md`. Inferences are marked *conjectural* or *open*.
website/content/periodic-table.md:22:Families I–X are the candidate organizing families of the founding document §4 (DEF-026–035). They are candidates, not a completed classification.
website/content/periodic-table.md:37:**Cross-family correspondences.** Classical–quantum connection via deformation quantization is *conjectural* (Founding Document §4). Gelfand/Stone/DR/Deligne links are proved — see region (c). The 2024–2026 supermap-representability line [40][41] and its possible unification with Gelfand/Stone/Naimark is *open*.
website/content/periodic-table.md:43:The CFSG template suggests families + sporadics. The founding document warns: one should not assume that physical theories possess a finite collection of exceptional objects analogous to the 26 sporadic groups (Founding Document 03). The entries below are the proven exceptional mathematics the table must accommodate.
website/content/periodic-table.md:91:| Yoneda embedding Hom(−, P) | Objects and their relational profiles | Categorical structure | **PROVEN** mathematically; the Yoneda qualification binds: **"Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem."** | Founding Document §5 |
website/content/papers/vol-12-principia-physica.html:121:<p>Under the architecture of <a href="#def:layers" data-reference-type="ref+label" data-reference="def:layers">5</a>, classification data determines neither realization nor selection. The architecture stipulates <span class="math inline">\(\mathcal{R}\)</span> and <span class="math inline">\(\mathcal{E}\)</span> as maps with separate domains and codomains, and the founding documents stipulate that several mathematically distinct theories may produce identical predictions within an experimentally accessible regime. The registry of the program, examined record by record, contains classification theorems, reconstruction theorems, and obst
website/content/papers/vol-12-principia-physica.html:211:<p>The analogy between the two classification problems is architectural rather than evidentiary. The finite simple groups share one definition; physical systems have no universally accepted mathematical definition, and the schema of <a href="#def:representation" data-reference-type="ref+label" data-reference="def:representation">1</a> is a candidate. The founding documents warn against assuming that physical theories possess a finite collection of exceptional objects analogous to the twenty-six sporadic groups <a class="citation" href="#bib-corpus-1">[1]</a>. Exceptional mathematics exists and the taxonomy must accommodate it: the exce
website/content/papers/vol-12-principia-physica.html:225:<p><strong>Remark 13</strong>.  The program founding documents warn against assuming that physical theories possess a finite collection of exceptional objects analogous to the twenty-six sporadic groups <a class="citation" href="#bib-corpus-1">[1]</a>. The sporadic groups exist and are exhaustive in the finite-simple setting, and the corresponding question for physical theories is open. The obstruction register shows what a periodic table must record where no table exists.</p>
website/content/papers/vol-12-principia-physica.html:480:<p>Four limitations bound this synthesis. The assembly inherits the statuses of the program registry, and any status revision propagates. Three entries rest on single sources and were not independently re-verified here: the extra <span class="math inline">\(Z_2\)</span> sector of higher-form DHR theory <a class="citation" href="#bib-corpus-20">[20]</a>, the journal-published mass-gap claim <a class="citation" href="#bib-corpus-28">[28]</a>, and the Borel-reducibility obstruction announced at the survey level <a class="citation" href="#bib-corpus-59">[55]</a>. The literature survey behind the registry ran on the arXiv API plus known-URL
website/content/papers/vol-12-principia-physica.html:487:<p>The computational artifacts of this volume record the bookkeeping claims of the assembly and the finite-dimensional example of <a href="#sec:examples" data-reference-type="ref+label" data-reference="sec:examples">9</a>. The two files perform automated registry auditing and bookkeeping and exercise the worked example; they verify no mathematics. Both files accompany this paper in the CMRPS project repository at <a href="https://github.com/YonedaAI/cmrps" class="uri">https://github.com/YonedaAI/cmrps</a>, under <code>src/vol-12-principia-physica</code>. <a href="#tab:code" data-reference-type="ref+Label" data-reference="tab:code">8</a
website/content/papers/vol-12-principia-physica.html:501:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-12-principia-physica.html:506:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-12-principia-physica.html:511:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-12-principia-physica.html:516:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-01-foundations.html:190:<p>Each condition excludes a concrete pathology, and the list can be tested record by record. A tuple with a component named but not defined fails AC-1. An observable collection such as the two point masses on a two-point state space fails AC-2. A Hamiltonian vector field defined only on an open subset of the state space fails AC-3. A symmetry action that moves an observable outside the observable collection fails AC-4. A composition rule that produces records with undefined components on some inputs, with no declared domain, fails AC-5. A class of records with no declared equivalence relation fails AC-6. The conditions are strong enough to 
website/content/papers/vol-01-foundations.html:323:<p>A revision of the framework has a clear path. The preservation laws need completion in three directions: the inter-kind composition rule of Corollary <a href="#cor:schema-not-category" data-reference-type="ref" data-reference="cor:schema-not-category">13</a>, the algebraic form of the laws for quantum and gauge records, and the status of dualities as equivalences between record presentations. The admissibility list needs testing against records the paper does not treat, in particular gauge records with constraints and lattice records with a continuum limit. The equivalence relation takes a positive criterion beyond the negative constraint
website/content/papers/vol-11-completeness-obstructions.html:272:<p>The strongest defensible conclusion is negative and useful. A universal classification of all mathematical representations of physical systems, in the form of the classification of finite simple groups, is not attainable across the surveyed domains: uncountably many isomorphism classes, unrecognizable instances, and wild sectors forbid it as a matter of theorem. What is attainable, and what the regime table documents, is a program of restricted classification theorems on tame classes together with explicit obstruction theorems everywhere else. That shape of outcome was named as acceptable in the founding documents of the pro
website/content/papers/vol-07-gauge-qft.html:237:<p>The constructive quantum field theory claims have a tracked event. The release of the withheld manuscript and the claimed formalization behind the October 2026 existence announcement would move that row of Table <a href="#tab:claims" data-reference-type="ref" data-reference="tab:claims">3</a> from withheld to publicly checkable, and a committee verdict would move it further. Until the release, no result of this volume depends on it. The competing journal-published construction of a four-dimensional YangMills theory with a mass gap carries a second question: where its continuum limit is closed and where it is assumed. An audit of that constr
website/content/papers/synthesis.html:24:<p>The series binds every Yoneda-based argument to one constraint, quoted from the founding document: “Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.” The Yoneda embedding sends an object to its functor of relationships, <span class="math display">\[P \;\longmapsto\; \mathrm{Hom}_{\mathrm{Phys}}(-, P),\]</span> and is faithful as mathematics. The physical interpretation of the resulting categorical structure is established separately.</p>
website/content/papers/vol-04-yoneda-classification.html:284:<p>The taxonomy declarations record vocabulary: the abstract components of the probe system and the group system are opaque identifiers, so those declarations index the definitions of the taxonomy rather than encode mathematics at the type level. The typed channel fragment and the Python experiments are the computational evidence proper. No claim of machine verification is made anywhere in this volume; a later mechanization could audit the executable models against kernel-checked specifications, which would be a cross-audit of models rather than a verification of the claims.</p>
website/content/papers/vol-04-yoneda-classification.html:293:<p><em>Evidence discipline.</em> The computational layer of <a href="#sec:computation" data-reference-type="ref+label" data-reference="sec:computation">7</a> evidences statements already proved in the paper or cited from the literature; it proves nothing on its own, and no claim of the paper is promoted by computation. The taxonomy declarations of <a href="#sec:computation" data-reference-type="ref+label" data-reference="sec:computation">7</a> are executable models of the definitions, not verified artifacts, and no claim of machine verification is made anywhere in this volume. Should a later mechanization check these models against
website/content/papers/vol-08-spacetime-reconstruction.html:448:<caption><span class="tbl-num">Table 8.</span> Code evidence: claim, file, and the function or declaration that probes it. The audit of this table is recorded with the paper’s verification artifacts.</caption>
website/content/papers/vol-10-observational-equivalence.html:181:<p>The first row is only partially closed. The program’s founding document states that two mathematical descriptions may be physically equivalent without being mathematically isomorphic, and dual presentations are the motivating case. The table gives a mathematical illustration of dual presentations: a compact Hausdorff space and the commutative <span class="math inline">\(C^*\)</span>-algebra of its continuous functions are distinct objects of their categories, isomorphic to no common record, yet Gelfand duality identifies them as presentations of one object <a class="citation" href="#bib-b3">[3]</a>. A pair of system records 
website/content/papers/vol-10-observational-equivalence.html:200:<p>A mathematical structure can be consistent without describing our universe. Several mathematically distinct theories may produce identical predictions inside an experimentally accessible regime. A complete mathematical classification of representations would not by itself solve the empirical problem (founding document, section 7). The quotient <span class="math inline">\(\mathrm{Ob}(\mathrm{Phys})/{\simeq}\)</span> therefore cannot be formed by mathematical equivalence and then declared empirical; the relation must be argued for at the layer where the theories are compared.</p>
website/content/papers/vol-10-observational-equivalence.html:208:<p>Instantiated as an observation functor, the empirical layer computes a quotient: two theories land in the same class exactly when their records are isomorphic, which is the relation of <a href="#prop:equivrel" data-reference-type="ref+Label" data-reference="prop:equivrel">12</a>. This is the part of empirical selection that observation performs, and its limits are the limits of the records. A class of the quotient contains every theory compatible with the recorded outcomes, and the founding document anticipates exactly this situation: several mathematically distinct theories may produce identical predictions inside an experi
website/content/papers/vol-10-observational-equivalence.html:335:<p><a href="#def:band" data-reference-type="ref+Label" data-reference="def:band">5</a> is a constraint, not a construction, and both of its failure modes are live. A relation too close to <span class="math inline">\(\cong\)</span> cannot identify dual presentations, and the founding document records such presentations as the reason <span class="math inline">\(\simeq\)</span> is a choice at all. A family <span class="math inline">\(\mathcal{A}\)</span> that is too small over-identifies: the fewer observation functors are admitted, the larger the intersection, and a system class with one weak experiment identifies systems no work
website/content/papers/vol-10-observational-equivalence.html:379:<li id="fn1"><p>The founding document of the YonedaAI Collaboration (2026, cited by section throughout this paper) and the YonedaAI physics research summary (2026-10-27) are program documents of the series in which this paper sits. Every mathematical statement used here is defined and stated explicitly in this text.<a href="#fnref1" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
website/content/papers/vol-03-irreducibility-decomposition.html:307:<p>The first artifact is an executable taxonomy layer in Haskell. Its module declares instances of the shared family, construction, and decomposition classes for the systems treated here: matrix blocks and their direct sums, tensor products of blocks, and Kraus normal form data. Multiplicity matrices appear as data types mirroring <a href="#def:multiplicity-matrix" data-reference-type="ref+label" data-reference="def:multiplicity-matrix">19</a>. The names mirror the definitions of this paper and the mechanization targets listed in the accompanying verification record. The Haskell layer is computational evidence, validated aga

codex
The periodic-table and synthesis pages are present and linked, and the routes declare OG/Twitter metadata. I’m checking citation targets and the math-rendering path next; the source also contains references to internal verification records that may need removal from public copy.
exec
/usr/local/bin/zsh -lc "node -e 'console.log(require.resolve(\"katex\")); console.log(require.resolve(\"typescript\"))'" in /Users/mlong/Documents/Development/classification-physical-systems/website
 succeeded in 0ms:
/Users/mlong/Documents/Development/classification-physical-systems/website/node_modules/katex/dist/katex.js
/Users/mlong/Documents/Development/classification-physical-systems/website/node_modules/typescript/lib/typescript.js

exec
/usr/local/bin/zsh -lc "rg -n '\\\\[a-zA-Z]+|\\"'$'"' website/content/manifest.json website/content/periodic-table.md; sed -n '850,960p' website/app/globals.css | nl -ba -v850; rg -n -i 'reviewer|referee|verification record|verification artifacts|evidence discipline|phase[- _][a-d]' website/content/papers | cut -c1-1000" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
website/content/manifest.json:60:    "abstract": "This paper classifies restricted classes of classical physical systems: symplectic and Poisson systems and classical statistical systems. The central structural fact is an inversion of the Riemannian situation. Darboux\u2019s theorem removes every local symplectic invariant, so the classification content",
website/content/manifest.json:61:    "abstractFull": "This paper classifies restricted classes of classical physical systems: symplectic and Poisson systems and classical statistical systems. The central structural fact is an inversion of the Riemannian situation. Darboux\u2019s theorem removes every local symplectic invariant, so the classification content of Hamiltonian mechanics is global and topological. On the Poisson side, Weinstein\u2019s splitting theorem replaces local rigidity by a rank stratification into symplectic leaves and transverse data, and coadjoint orbits tie the homogeneous case to the Dynkin classification of simple Lie algebras and the highest-weight classification of their finite-dimensional representations. On the statistical side, Chentsov\u2019s theorem singles out the Fisher metric as the unique metric monotone under stochastic maps, while the quantum analogue is parametric rather than unique. The results include one complete local classification theorem, one rank normal form, one uniqueness theorem, and two restricted global classification theorems, each stated with hypotheses and proof or proof reference. The limitation that matters most is scope: no global classification theorem for closed symplectic manifolds is claimed or available, decomposition uniqueness is open outside restricted subclasses, and the deformation-quantization bridge to quantum theory remains conjectural. Computational experiments exhibit the local normal forms and supply executable models; they are evidence, not proofs.",
website/content/manifest.json:74:    "abstractFull": "Quantum physical systems admit a complete structural classification only in restricted regimes, and this paper records where those regimes begin and end. Finite-dimensional observable algebras are classified by one combinatorial invariant, the dimension vector of the block decomposition. Amenable operator-algebraic models are classified by Murray-von Neumann type together with Connes invariants. Completely positive maps admit a canonical normal form through minimal Stinespring dilations, unique up to unitary equivalence, and the Kraus rank of that normal form is not an isomorphism invariant of channels. Beyond the amenable class no finite answer is possible: uncountably many pairwise non-isomorphic separable factors exist, so no finite list of factor types can be exhaustive. On the categorical side, the Doplicher-Roberts reconstruction theorem and Deligne\u2019s theorem classify superselection and symmetric tensor categories under explicit hypotheses, and the Etingof-Gelaki examples show that any equivalence forgetting the symmetric structure fails to recover its group. Quantum monotone metrics form a parametric family rather than a unique choice. The paper separates classified islands from proved impossibilities and open problems, and reports executable models of the finite-dimensional taxonomy as computational evidence only.",
website/content/manifest.json:165:    "abstractFull": "This paper states the structural picture formed by the twelve parts of the Classification of Mathematical Representations of Physical Systems, a program asking whether mathematical representations of physical systems admit a structural classification analogous to the Classification of Finite Simple Groups. One ontology of forty-two definitions, one dependency graph, and one equivalence discipline run through the series. Three kinds of result organize its classification content. Complete invariants appear wherever the invariant is finite or explicitly parameterized: dimension vectors for finite-dimensional -algebras, Dynkin and Satake diagrams for semisimple Lie theory, classifying spaces for principal bundles, and the Murray-von Neumann and Connes data for amenable factors. Reconstruction theorems recover objects from probes under hypotheses that cannot be dropped. Seven obstruction theorems bound the scope of any classification, from uncountably many type factors to algorithmic unrecognizability in dimension four. Every equivalence in the series declares the structure it preserves, and equivalences that forget the symmetric layer fail in a proved counterexample. The structural classification conjecture is stated as the program\u2019s theorem target with its five proof obligations. The cross-volume consistency report records that the twelve parts share definitions, dependency discipline, and claim vocabulary without conflict.",
   850	  font-size: 0.75rem;
   851	  letter-spacing: 0.16em;
   852	  text-transform: uppercase;
   853	  margin-bottom: 0.35rem;
   854	}
   855	
   856	.paper-nav .nav-title {
   857	  font-family: var(--font-heading);
   858	  font-size: 1rem;
   859	}
   860	
   861	.paper-nav .next {
   862	  text-align: left;
   863	}
   864	
   865	@media (min-width: 640px) {
   866	  .paper-nav .next {
   867	    text-align: right;
   868	  }
   869	}
   870	
   871	/* ---------- periodic table page ---------- */
   872	
   873	.md-content {
   874	  min-width: 0;
   875	  overflow-wrap: break-word;
   876	  font-size: 0.97rem;
   877	}
   878	
   879	.md-content h2 {
   880	  font-size: clamp(1.35rem, 3vw, 1.8rem);
   881	  margin: 2.75rem 0 1rem;
   882	  padding-top: 0.5rem;
   883	  border-top: 1px solid var(--border);
   884	}
   885	
   886	.md-content h3 {
   887	  font-size: clamp(1.1rem, 2.4vw, 1.35rem);
   888	  margin: 2.1rem 0 0.85rem;
   889	}
   890	
   891	.md-content p {
   892	  margin: 0 0 1.05rem;
   893	  color: var(--text-muted);
   894	}
   895	
   896	.md-content strong {
   897	  color: var(--text);
   898	}
   899	
   900	.md-content table {
   901	  display: block;
   902	  width: 100%;
   903	  max-width: 100%;
   904	  overflow-x: auto;
   905	  border-collapse: collapse;
   906	  margin: 1.35rem 0;
   907	  font-size: 0.82rem;
   908	}
   909	
   910	.md-content th,
   911	.md-content td {
   912	  border: 1px solid var(--border);
   913	  padding: 0.55rem 0.75rem;
   914	  text-align: left;
   915	  vertical-align: top;
   916	  min-width: 5.5rem;
   917	}
   918	
   919	.md-content th {
   920	  background: var(--surface-hover);
   921	  color: var(--text);
   922	}
   923	
   924	.md-content tr:nth-child(even) td {
   925	  background: rgba(14, 20, 40, 0.4);
   926	}
   927	
   928	.md-content hr {
   929	  border: none;
   930	  border-top: 1px solid var(--border);
   931	  margin: 2.25rem 0;
   932	}
   933	
   934	.status-proven { color: var(--success); font-weight: 600; }
   935	.status-claimed { color: var(--warning); font-weight: 600; }
   936	.status-open { color: var(--accent); font-weight: 600; }
   937	.status-impossible { color: #f87171; font-weight: 600; }
   938	
   939	/* ---------- footer ---------- */
   940	
   941	.site-footer {
   942	  border-top: 1px solid var(--border);
   943	  margin-top: 2rem;
   944	  background: rgba(14, 20, 40, 0.4);
   945	}
   946	
   947	.site-footer-inner {
   948	  max-width: 1120px;
   949	  margin: 0 auto;
   950	  padding: 2.25rem 1rem;
   951	  display: grid;
   952	  gap: 1.25rem;
   953	  color: var(--text-dim);
   954	  font-size: 0.85rem;
   955	}
   956	
   957	@media (min-width: 768px) {
   958	  .site-footer-inner {
   959	    grid-template-columns: 2fr 1fr 1fr;
   960	    padding: 2.75rem 1.5rem;
website/content/papers/vol-12-principia-physica.html:501:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-12-principia-physica.html:506:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-12-principia-physica.html:511:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-12-principia-physica.html:516:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-04-yoneda-classification.html:293:<p><em>Evidence discipline.</em> The computational layer of <a href="#sec:computation" data-reference-type="ref+label" data-reference="sec:computation">7</a> evidences statements already proved in the paper or cited from the literature; it proves nothing on its own, and no claim of the paper is promoted by computation. The taxonomy declarations of <a href="#sec:computation" data-reference-type="ref+label" data-reference="sec:computation">7</a> are executable models of the definitions, not verified artifacts, and no claim of machine verification is made anywhere in this volume. Should a later mechanization check these models against kernel-checked specifications, the result would be a cross-audit of executable models, not a verification of the mathematical claims.</p>
website/content/papers/vol-03-irreducibility-decomposition.html:307:<p>The first artifact is an executable taxonomy layer in Haskell. Its module declares instances of the shared family, construction, and decomposition classes for the systems treated here: matrix blocks and their direct sums, tensor products of blocks, and Kraus normal form data. Multiplicity matrices appear as data types mirroring <a href="#def:multiplicity-matrix" data-reference-type="ref+label" data-reference="def:multiplicity-matrix">19</a>. The names mirror the definitions of this paper and the mechanization targets listed in the accompanying verification record. The Haskell layer is computational evidence, validated against kernel-checked specifications through cross-audit, and it is not verified by any proof assistant.</p>
website/content/papers/vol-08-spacetime-reconstruction.html:448:<caption><span class="tbl-num">Table 8.</span> Code evidence: claim, file, and the function or declaration that probes it. The audit of this table is recorded with the paper’s verification artifacts.</caption>

exec
/usr/local/bin/zsh -lc "python3 -c 'from pathlib import Path; from html.parser import HTMLParser; from urllib.parse import unquote
class P(HTMLParser):
 def __init__(self): super().__init__(); self.ids=set(); self.links=[]
 def handle_starttag(self,t,a):
  a=dict(a)
  if \"id\" in a:self.ids.add(a[\"id\"])
  if t==\"a\" and \"href\" in a:self.links.append((self.getpos()[0],a[\"href\"]))
for f in sorted(Path(\"website/content/papers\").glob(\"*.html\")):
 p=P();p.feed(f.read_text()); bad=[(n,h) for n,h in p.links if h.startswith(\"#\") and unquote(h[1:]) not in p.ids]; print(f.name,\"bad\",bad); print(\"external\",[(n,h) for n,h in p.links if not h.startswith(\"#\")])'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 86ms:
synthesis.html bad [(43, '#def:admissibility,def:constructions')]
external [(296, 'https://doi.org/10.2307/1969107'), (297, 'https://doi.org/10.2307/1971057'), (298, 'https://doi.org/10.1090/conm/167/16'), (300, 'https://doi.org/10.1090/s0002-9947-1937-1501905-7'), (301, 'https://doi.org/10.2307/1971477'), (302, 'https://doi.org/10.1007/bf01388849'), (304, 'https://doi.org/10.2307/1970730'), (305, 'https://doi.org/10.2307/1969933'), (306, 'https://arxiv.org/abs/math/0310352'), (307, 'https://arxiv.org/abs/math/0505315'), (308, 'https://arxiv.org/abs/2509.17604'), (309, 'https://arxiv.org/abs/2310.07421'), (311, 'https://doi.org/10.4310/jdg/1214437787'), (312, 'https://arxiv.org/abs/gr-qc/0609119'), (313, 'https://arxiv.org/abs/1611.01551'), (315, 'https://arxiv.org/abs/2510.22788'), (316, 'https://arxiv.org/abs/2509.04688'), (317, 'https://arxiv.org/abs/2509.03513'), (318, 'https://arxiv.org/abs/math/0007196'), (320, 'https://arxiv.org/abs/q-alg/9503002'), (321, 'https://arxiv.org/abs/0905.0465'), (322, 'https://arxiv.org/abs/1505.07839'), (323, 'https://arxiv.org/abs/quant-ph/0102132'), (326, 'https://doi.org/10.1007/bf01877742'), (327, 'https://doi.org/10.1090/s0273-0979-1982-15003-0'), (328, 'https://arxiv.org/abs/math/0211159'), (329, 'https://doi.org/10.1103/PhysRevD.100.026004'), (331, 'https://doi.org/10.4007/annals.2005.162.581'), (332, 'https://doi.org/10.2307/2032342'), (334, 'https://arxiv.org/abs/1507.01917'), (335, 'https://openai.com/index/building-scientific-understanding-with-academic-communities/'), (336, 'https://www.kitp.ucsb.edu/sites/default/files/YM_working_group.pdf'), (337, 'https://www.claymath.org/millennium/yang-mills-the-maths-gap/'), (338, 'https://arxiv.org/abs/math-ph/0008027'), (339, 'https://arxiv.org/abs/hep-th/0603001'), (340, 'https://arxiv.org/abs/1601.05416'), (341, 'https://arxiv.org/abs/1503.06237'), (342, 'https://arxiv.org/abs/2602.23865'), (343, 'https://arxiv.org/abs/2402.02997'), (344, 'https://arxiv.org/abs/0909.2657')]
vol-01-foundations.html bad []
external [(331, 'https://doi.org/10.1090/S0273-0979-01-00909-0'), (333, 'https://doi.org/10.1007/978-1-4612-6398-2'), (335, 'https://doi.org/10.2307/1971057'), (336, 'https://doi.org/10.2307/1970730'), (337, 'https://doi.org/10.2307/1969609'), (338, 'https://doi.org/10.1112/blms/15.5.401'), (339, 'https://arxiv.org/abs/2310.07421'), (340, 'https://doi.org/10.1007/978-1-4757-2063-1'), (341, 'https://doi.org/10.2307/1969933'), (342, 'https://arxiv.org/abs/math/0505315'), (343, 'https://doi.org/10.1090/conm/167/16'), (344, 'https://doi.org/10.1090/S0002-9947-1936-1501865-8'), (345, 'https://doi.org/10.1007/BF01388849'), (346, 'https://doi.org/10.17323/1609-4514-2002-2-2-227-248'), (347, 'https://doi.org/10.4310/jdg/1214437787'), (348, 'https://arxiv.org/abs/math/0007196'), (349, 'https://doi.org/10.1007/978-1-4757-4721-8'), (350, 'https://openai.com/index/building-scientific-understanding-with-academic-communities/'), (351, 'https://www.kitp.ucsb.edu/sites/default/files/YM_working_group.pdf'), (352, 'https://www.claymath.org/millennium/yang-mills-the-maths-gap/')]
vol-02-structural-families.html bad []
external [(354, 'https://en.wikipedia.org/wiki/Classification_of_finite_simple_groups'), (355, 'https://www.ams.org/journals/bull/2001-38-03/S0273-0979-01-00909-0/'), (356, 'https://en.wikipedia.org/wiki/ATLAS_of_Finite_Groups'), (357, 'https://en.wikipedia.org/wiki/Simple_Lie_group'), (358, 'https://en.wikipedia.org/wiki/Theorem_of_the_highest_weight'), (359, 'https://en.wikipedia.org/wiki/Darboux%27s_theorem'), (360, 'https://en.wikipedia.org/wiki/Poisson_manifold'), (361, 'https://en.wikipedia.org/wiki/Von_Neumann_algebra'), (362, 'https://en.wikipedia.org/wiki/$C^*$-algebra'), (363, 'https://en.wikipedia.org/wiki/Stinespring_dilation_theorem'), (364, 'https://en.wikipedia.org/wiki/Quantum_channel'), (365, 'https://ncatlab.org/nlab/show/Doplicher-Roberts+reconstruction+theorem'), (366, 'https://ncatlab.org/nlab/show/Deligne%27s+theorem+on+tensor+categories'), (367, 'https://ncatlab.org/nlab/show/fusion+category'), (368, 'https://ncatlab.org/nlab/show/Haag-Kastler+axioms'), (369, 'https://ncatlab.org/nlab/show/DHR+superselection+theory'), (370, 'https://ncatlab.org/nlab/show/classifying+space'), (371, 'https://ncatlab.org/nlab/show/characteristic+class'), (372, 'https://ncatlab.org/nlab/show/quantum+anomaly'), (373, 'https://arxiv.org/abs/q-alg/9503002'), (374, 'https://arxiv.org/abs/0905.0465'), (375, 'https://ncatlab.org/nlab/show/topological+quantum+field+theory'), (376, 'https://ncatlab.org/nlab/show/Gelfand-Naimark+theorem'), (377, 'https://ncatlab.org/nlab/show/Gelfand+duality'), (378, 'https://ncatlab.org/nlab/show/Stone+duality'), (379, 'https://arxiv.org/abs/gr-qc/0609119'), (380, 'https://arxiv.org/abs/1611.01551'), (381, 'https://arxiv.org/abs/quant-ph/0102132'), (382, 'https://en.wikipedia.org/wiki/Adian%E2%80%93Rabin_theorem'), (383, 'https://arxiv.org/abs/2310.07421'), (384, 'https://arxiv.org/abs/math/0310352'), (385, 'https://arxiv.org/abs/math/0505315'), (386, 'https://arxiv.org/abs/1507.01917'), (387, 'https://arxiv.org/abs/2509.17604'), (388, 'https://en.wikipedia.org/wiki/Geometrization_conjecture'), (389, 'https://doi.org/10.1155/s1073792801000046'), (390, 'https://doi.org/10.2307/1970730'), (391, 'https://arxiv.org/abs/0909.2657'), (392, 'https://doi.org/10.4310/jdg/1214437787'), (393, 'https://doi.org/10.1090/s0002-9939-1955-0069403-4')]
vol-03-irreducibility-decomposition.html bad []
external []
vol-04-yoneda-classification.html bad []
external [(335, 'https://arxiv.org/abs/2602.23865'), (339, 'https://eudml.org/doc/143725'), (342, 'https://arxiv.org/abs/math/0310352'), (345, 'https://arxiv.org/abs/math/0007196')]
vol-05-classical-systems.html bad []
external []
vol-06-quantum-systems.html bad [(241, '#thm:dr,thm:deligne'), (287, '#thm:dr,thm:deligne'), (324, '#thm:dr,thm:deligne')]
external []
vol-07-gauge-qft.html bad []
external [(258, 'https://arxiv.org/abs/q-alg/9503002'), (261, 'https://arxiv.org/abs/2509.04688'), (262, 'https://arxiv.org/abs/2511.21810'), (263, 'https://www.claymath.org/millennium/yang-mills-the-maths-gap/'), (268, 'https://www.nature.com/articles/s42254-025-00909-2'), (270, 'https://arxiv.org/abs/2606.19362'), (271, 'https://arxiv.org/abs/2509.03513'), (276, 'https://arxiv.org/abs/2506.00284'), (277, 'https://www.kitp.ucsb.edu/sites/default/files/YM_working_group.pdf'), (278, 'https://arxiv.org/abs/0905.0465'), (281, 'https://arxiv.org/abs/math-ph/0008027'), (282, 'https://arxiv.org/abs/2608.10133'), (283, 'https://arxiv.org/abs/2510.22788'), (284, 'https://openai.com/index/building-scientific-understanding-with-academic-communities/'), (286, 'https://arxiv.org/abs/2502.06229')]
vol-08-spacetime-reconstruction.html bad []
external []
vol-09-gravity-information-geometry.html bad [(136, '#prop:nonunique,prop:commutative'), (160, '#prop:qubit-sld,prop:qubit-fid'), (163, '#prop:qubit-sld,prop:qubit-fid'), (205, '#thm:gelfand,thm:stone,thm:dhw'), (212, '#thm:gelfand,thm:stone,thm:dhw'), (266, '#thm:gelfand,thm:dhw'), (270, '#prop:qubit-sld,prop:ideal-gas'), (282, '#thm:gelfand,thm:stone'), (309, '#prop:nonunique,prop:commutative'), (310, '#prop:qubit-sld,prop:qubit-fid'), (340, '#thm:chentsov,thm:petz-sudar,thm:gelfand,thm:stone,thm:dhw,thm:cone'), (340, '#prop:monotone,prop:nonunique,prop:commutative,prop:qubit-sld,prop:qubit-fid,prop:ideal-gas')]
external []
vol-10-observational-equivalence.html bad [(211, '#sec:functors,sec:metrics'), (320, '#sec:functors,sec:metrics'), (321, '#prop:equivrel,prop:coarse'), (345, '#thm:chentsov,thm:petzsudar')]
external []
vol-11-completeness-obstructions.html bad []
external [(287, 'https://www.jstor.org/stable/1969933'), (288, 'https://link.springer.com/article/10.1007/BF01899291'), (289, 'https://annals.math.princeton.edu/1969/90-2/p07'), (290, 'https://annals.math.princeton.edu/1976/104-1/p04'), (291, 'https://doi.org/10.1145/301970.301971'), (292, 'https://doi.org/10.1016/j.aim.2021.107796'), (293, 'https://arxiv.org/abs/math/0212142'), (295, 'https://arxiv.org/abs/math/0310352'), (296, 'https://arxiv.org/abs/math/0505315'), (297, 'https://arxiv.org/abs/2509.17604'), (298, 'https://arxiv.org/abs/1507.01917'), (299, 'https://arxiv.org/abs/2310.07421'), (300, 'https://arxiv.org/abs/0909.2657'), (302, 'https://arxiv.org/abs/math/0303109'), (312, 'https://arxiv.org/abs/quant-ph/0102132'), (313, 'https://arxiv.org/abs/0905.0465'), (314, 'https://www.claymath.org/millennium/yang-mills-the-maths-gap/'), (315, 'https://openai.com/index/building-scientific-understanding-with-academic-communities/'), (316, 'https://www.kitp.ucsb.edu/sites/default/files/YM_working_group.pdf')]
vol-12-principia-physica.html bad []
external [(5, 'https://yonedalabs.ai'), (487, 'https://github.com/YonedaAI/cmrps'), (533, 'https://www.ams.org/journals/bull/2001-38-03/S0273-0979-01-00909-0/'), (541, 'https://doi.org/10.2307/2032342'), (543, 'https://doi.org/10.2307/1971477'), (545, 'https://doi.org/10.4007/annals.2005.162.581'), (546, 'https://doi.org/10.1063/1.1704187'), (547, 'https://doi.org/10.1007/bf01877742'), (551, 'https://arxiv.org/abs/2511.21810'), (552, 'https://arxiv.org/abs/math-ph/0008027'), (553, 'https://arxiv.org/abs/2502.06229'), (554, 'https://www.claymath.org/millennium/yang-mills-the-maths-gap/'), (555, 'https://openai.com/index/building-scientific-understanding-with-academic-communities/'), (556, 'https://www.kitp.ucsb.edu/sites/default/files/YM_working_group.pdf'), (557, 'https://www.scientificamerican.com/article/dueling-proofs-from-openai-and-anthropic-astound-scientists/'), (558, 'https://www.nature.com/articles/s42254-025-00909-2'), (559, 'https://arxiv.org/abs/2606.19362'), (560, 'https://arxiv.org/abs/2506.00284'), (561, 'https://arxiv.org/abs/2510.22788'), (562, 'https://arxiv.org/abs/2509.04688'), (563, 'https://arxiv.org/abs/2509.03513'), (564, 'https://arxiv.org/abs/2608.10133'), (565, 'https://arxiv.org/abs/q-alg/9503002'), (566, 'https://arxiv.org/abs/0905.0465'), (567, 'https://doi.org/10.1007/bf02698547'), (568, 'https://arxiv.org/abs/2602.23865'), (569, 'https://arxiv.org/abs/2402.02997'), (570, 'https://doi.org/10.1090/conm/167/16'), (571, 'https://doi.org/10.1090/s0002-9947-1937-1501905-7'), (572, 'https://arxiv.org/abs/hep-th/0603001'), (573, 'https://arxiv.org/abs/1601.05416'), (574, 'https://arxiv.org/abs/1505.07839'), (575, 'https://arxiv.org/abs/1503.06237'), (576, 'https://arxiv.org/abs/1005.3035'), (577, 'https://arxiv.org/abs/gr-qc/0609119'), (578, 'https://arxiv.org/abs/1611.01551'), (579, 'https://arxiv.org/abs/quant-ph/0102132'), (580, 'https://doi.org/10.2307/1969933'), (581, 'https://arxiv.org/abs/2310.07421'), (582, 'https://arxiv.org/abs/math/0310352'), (583, 'https://arxiv.org/abs/math/0505315'), (584, 'https://arxiv.org/abs/1507.01917'), (585, 'https://arxiv.org/abs/2509.17604'), (586, 'https://arxiv.org/abs/0909.2657'), (587, 'https://doi.org/10.1090/s0273-0979-1982-15003-0'), (588, 'https://doi.org/10.1145/301970.301971'), (589, 'https://doi.org/10.2307/1969107'), (590, 'https://doi.org/10.2307/1971057'), (591, 'https://doi.org/10.2307/1970730'), (592, 'https://doi.org/10.1007/bf01388849'), (593, 'https://doi.org/10.4310/jdg/1214437787'), (594, 'https://arxiv.org/abs/math/0211159'), (595, 'https://doi.org/10.1016/j.aim.2021.107796')]

exec
/usr/local/bin/zsh -lc "node -e 'const fs=require(\"fs\"),ts=require(\"typescript\"); function compile(src,req){const m={exports:{}}; new Function(\"require\",\"module\",\"exports\",ts.transpileModule(src,{compilerOptions:{module:ts.ModuleKind.CommonJS,esModuleInterop:true}}).outputText)(req,m,m.exports);return m.exports;} const macros=compile(fs.readFileSync(\"lib/macros.ts\",\"utf8\"),require).BASE_MACROS; const render=compile(fs.readFileSync(\"lib/render-math.ts\",\"utf8\"),n=>n===\"./macros\"?{getMacros:()=>({...macros})}:require).renderMath; for(const f of fs.readdirSync(\"content/papers\")){const raw=fs.readFileSync(\"content/papers/\"+f,\"utf8\");const out=render(raw);const errs=[...out.matchAll(/class=\"katex-error\"["'^>]*title="([''^"]*)"[''^>]*>(['"\\s\\S]*?)<\\/span>/g)]; const badattr=[...out.matchAll(/href=\"["'^"'"\\n]*<span["'^'"\\n]{0,130}/g)];console.log(f,JSON.stringify({errors:errs.map(x=>({error:x[1],tex:x[2]})),badattr}));}'" in /Users/mlong/Documents/Development/classification-physical-systems/website
 exited 1 in 1ms:
<anonymous_script>:33
        return katex_1.default.renderToString(unescapeHtml(tex).trim(), {
                               ^

TypeError: katex_1.default.renderToString is not a function
    at renderOne (eval at compile ([eval]:1:98), <anonymous>:33:32)
    at eval (eval at compile ([eval]:1:98), <anonymous>:62:75)
    at String.replace (<anonymous>)
    at renderMath (eval at compile ([eval]:1:98), <anonymous>:51:20)
    at [eval]:1:614
    at runScriptInThisContext (node:internal/vm:219:10)
    at node:internal/process/execution:451:12
    at [eval]-wrapper:6:24
    at runScriptInContext (node:internal/process/execution:449:60)
    at evalFunction (node:internal/process/execution:283:30)

Node.js v24.22.0

exec
/usr/local/bin/zsh -lc "python3 -c 'import re;from pathlib import Path
for f in sorted(Path(\"website/content/papers\").glob(\"*.html\")):
 s=f.read_text(); s=re.sub(r\"<span class=\\\"math (?:inline|display)\\\"["'^>]*>['"\\s\\S]*?</span>\",lambda m:\"\\n\"*m[0].count(\"\\n\"),s)
 for n,line in enumerate(s.splitlines(),1):
  text=re.sub(\"<["'^>]+>","",line)
  if re.search(r"'"\\\\[a-zA-Z]+|\\"'$",text):print(str(f)+":"+str(n)+":"+text[:400])'"'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 63ms:
website/content/papers/vol-02-structural-families.html:362:[9] -algebra. Encyclopedia article. Available at https://en.wikipedia.org/wiki/$C^*$-algebra.

exec
/usr/local/bin/zsh -lc "node --input-type=module -e 'import fs from \"fs\";import ts from \"typescript\";import katex from \"katex\";import {createRequire} from \"module\";const require=createRequire(import.meta.url);function compile(src,req){const m={exports:{}};new Function(\"require\",\"module\",\"exports\",ts.transpileModule(src,{compilerOptions:{module:ts.ModuleKind.CommonJS,esModuleInterop:true}}).outputText)(req,m,m.exports);return m.exports;}const macros=compile(fs.readFileSync(\"lib/macros.ts\",\"utf8\"),require).BASE_MACROS;const render=compile(fs.readFileSync(\"lib/render-math.ts\",\"utf8\"),n=>n===\"./macros\"?{getMacros:()=>({...macros})}:n===\"katex\"?katex:require(n)).renderMath;for(const f of fs.readdirSync(\"content/papers\")){const raw=fs.readFileSync(\"content/papers/\"+f,\"utf8\"),out=render(raw);const errs=[...out.matchAll(/class=\"katex-error\"["'^>]*title="([''^"]*)"[''^>]*>(['"\\s\\S]*?)<\\/span>/g)];const badattr=[...out.matchAll(/href=\"["'^"'"\\n]*<span["'^'"\\n]{0,130}/g)].map(x=>x[0]);console.log(f,JSON.stringify({errors:errs.map(x=>({error:x[1],tex:x[2]})),badattr}));}'" in /Users/mlong/Documents/Development/classification-physical-systems/website
 succeeded in 165ms:
synthesis.html {"errors":[],"badattr":[]}
vol-01-foundations.html {"errors":[],"badattr":[]}
vol-02-structural-families.html {"errors":[],"badattr":["href=\"https://en.wikipedia.org/wiki/<span class=\"math-rendered\"><span class=\"katex\"><span class=\"katex-mathml\"><math xmlns=\"http://www.w3.org/1998/Math/MathML\"><semantics>"]}
vol-03-irreducibility-decomposition.html {"errors":[],"badattr":[]}
vol-04-yoneda-classification.html {"errors":[],"badattr":[]}
vol-05-classical-systems.html {"errors":[],"badattr":[]}
vol-06-quantum-systems.html {"errors":[],"badattr":[]}
vol-07-gauge-qft.html {"errors":[],"badattr":[]}
vol-08-spacetime-reconstruction.html {"errors":[],"badattr":[]}
vol-09-gravity-information-geometry.html {"errors":[],"badattr":[]}
vol-10-observational-equivalence.html {"errors":[],"badattr":[]}
vol-11-completeness-obstructions.html {"errors":[],"badattr":[]}
vol-12-principia-physica.html {"errors":[],"badattr":[]}

exec
/usr/local/bin/zsh -lc "rg -n '<h[234].*class=\"math' website/content/papers | cut -c1-600; sed -n '354,365p' website/content/papers/vol-02-structural-families.html | nl -ba -v354; sed -n '35,47p' website/content/papers/synthesis.html | nl -ba -v35; sed -n '155,170p' website/content/manifest.json | nl -ba -v155; tail -30 website/content/periodic-table.md | nl -ba -v99" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   354	<p class="bibitem" id="bib-cfsg"><span class="bib-num">[1]</span> <em>Classification of finite simple groups</em>. Encyclopedia article. Available at <a href="https://en.wikipedia.org/wiki/Classification_of_finite_simple_groups" class="uri">https://en.wikipedia.org/wiki/Classification_of_finite_simple_groups</a>.</p>
   355	<p class="bibitem" id="bib-solomon"><span class="bib-num">[2]</span> R. Solomon, <em>A brief history of the classification of the finite simple groups</em>, Bulletin of the American Mathematical Society <strong>38</strong> (2001) 315-352. Available at <a href="https://www.ams.org/journals/bull/2001-38-03/S0273-0979-01-00909-0/" class="uri">https://www.ams.org/journals/bull/2001-38-03/S0273-0979-01-00909-0/</a>.</p>
   356	<p class="bibitem" id="bib-atlas"><span class="bib-num">[3]</span> <em>ATLAS of Finite Groups</em>. Encyclopedia article. Available at <a href="https://en.wikipedia.org/wiki/ATLAS_of_Finite_Groups" class="uri">https://en.wikipedia.org/wiki/ATLAS_of_Finite_Groups</a>.</p>
   357	<p class="bibitem" id="bib-lie"><span class="bib-num">[4]</span> <em>Simple Lie group</em>. Encyclopedia article. Available at <a href="https://en.wikipedia.org/wiki/Simple_Lie_group" class="uri">https://en.wikipedia.org/wiki/Simple_Lie_group</a>.</p>
   358	<p class="bibitem" id="bib-hw"><span class="bib-num">[5]</span> <em>Theorem of the highest weight</em>. Encyclopedia article. Available at <a href="https://en.wikipedia.org/wiki/Theorem_of_the_highest_weight" class="uri">https://en.wikipedia.org/wiki/Theorem_of_the_highest_weight</a>.</p>
   359	<p class="bibitem" id="bib-darboux"><span class="bib-num">[6]</span> <em>Darboux’s theorem</em>. Encyclopedia article. Available at <a href="https://en.wikipedia.org/wiki/Darboux%27s_theorem" class="uri">https://en.wikipedia.org/wiki/Darboux%27s_theorem</a>.</p>
   360	<p class="bibitem" id="bib-poisson"><span class="bib-num">[7]</span> <em>Poisson manifold</em>. WikiJournal of Science <strong>7</strong> (2024) 6. Available at <a href="https://en.wikipedia.org/wiki/Poisson_manifold" class="uri">https://en.wikipedia.org/wiki/Poisson_manifold</a>.</p>
   361	<p class="bibitem" id="bib-vnalg"><span class="bib-num">[8]</span> <em>Von Neumann algebra</em>. Encyclopedia article. Available at <a href="https://en.wikipedia.org/wiki/Von_Neumann_algebra" class="uri">https://en.wikipedia.org/wiki/Von_Neumann_algebra</a>.</p>
   362	<p class="bibitem" id="bib-calg"><span class="bib-num">[9]</span> <em><span class="math inline">\(C^*\)</span>-algebra</em>. Encyclopedia article. Available at <a href="https://en.wikipedia.org/wiki/$C^*$-algebra" class="uri">https://en.wikipedia.org/wiki/$C^*$-algebra</a>.</p>
   363	<p class="bibitem" id="bib-stinespring"><span class="bib-num">[10]</span> <em>Stinespring dilation theorem</em>. Encyclopedia article. Available at <a href="https://en.wikipedia.org/wiki/Stinespring_dilation_theorem" class="uri">https://en.wikipedia.org/wiki/Stinespring_dilation_theorem</a>.</p>
   364	<p class="bibitem" id="bib-qchannel"><span class="bib-num">[11]</span> <em>Quantum channel</em>. Encyclopedia article. Available at <a href="https://en.wikipedia.org/wiki/Quantum_channel" class="uri">https://en.wikipedia.org/wiki/Quantum_channel</a>.</p>
   365	<p class="bibitem" id="bib-dr"><span class="bib-num">[12]</span> <em>Doplicher-Roberts reconstruction theorem</em>. nLab entry. Available at <a href="https://ncatlab.org/nlab/show/Doplicher-Roberts+reconstruction+theorem" class="uri">https://ncatlab.org/nlab/show/Doplicher-Roberts+reconstruction+theorem</a>.</p>
    35	<tr><td>DEF-019 and DEF-020</td><td>Admissible physical systems and the conditions that define them</td><td>Domain of the central conjecture. Theorems over this domain are stated relative to these conditions.</td></tr>
    36	<tr><td>DEF-021 to DEF-024</td><td>Irreducibles, decompositions, admissible constructions, and closure</td><td>Supplies the generation operation of the central identity.</td></tr>
    37	<tr><td>DEF-025 to DEF-035</td><td>The ten structural families</td><td>Candidate generating collection for the central identity.</td></tr>
    38	<tr><td>DEF-036 to DEF-038</td><td>Invariant records, classifying invariants, and the Yoneda embedding</td><td>Carries the data by which objects are recognized.</td></tr>
    39	<tr><td>DEF-039 to DEF-042</td><td>The classification problem, the generation statement, the conjectural identity, and the three-layer architecture</td><td>States the problem the series attacks and the architecture that separates mathematics from realization and observation.</td></tr>
    40	</table>
    41	<p>The five components supply the bridge between the families. A cotangent bundle, a finite-dimensional operator algebra, and a principal bundle are instances of one tuple shape: each has a state space, an observable layer, a dynamics, a symmetry group, and a composition rule, and the invariant record <span class="math inline">\(\mathcal{I}(T)\)</span> reads the same five slots in every case. The families differ in what fills the slots rather than in the slots themselves, and that common shape is what makes a cross-family classification problem well posed at all.</p>
    42	<h3 id="admissibility-and-constructions">Admissibility and constructions</h3>
    43	<p><a href="#def:admissibility,def:constructions" data-reference-type="ref+Label" data-reference="def:admissibility,def:constructions">Definition 3, Definition 2</a> fix the domain and the generating operations of the structural classification conjecture. The admissible subcategory restricts the classification scope to mutually compatible components, and the construction set defines the inductive closure.</p>
    44	<div id="def:constructions" class="definition">
    45	<p><strong>Definition 2</strong> (Admissible constructions).  The set <span class="math inline">\(\mathfrak{C}\)</span> of admissible constructions consists of the tensor product, the direct sum, extension in the group, algebra, and field-theoretic senses, limits and colimits including the thermodynamic, infinite-volume, semiclassical, and continuum limits, and factorization of a representation into factors. These are operations on objects of <span class="math inline">\(\mathrm{Phys}\)</span>: each takes one or more systems and builds a new system, so each is a functor or a universal construction on the category rather than a component of any single system.</p>
    46	</div>
    47	<div id="def:admissibility" class="definition">
   155	    "category": "math-ph",
   156	    "date": "October 2026"
   157	  },
   158	  {
   159	    "slug": "synthesis",
   160	    "title": "Structural Synthesis",
   161	    "subtitle": "Synthesis of The Classification of Mathematical Representations of Physical Systems",
   162	    "part": "Synthesis",
   163	    "volume": 13,
   164	    "abstract": "This paper states the structural picture formed by the twelve parts of the Classification of Mathematical Representations of Physical Systems, a program asking whether mathematical representations of physical systems admit a structural classification analogous to the Classification of Finite Simple ",
   165	    "abstractFull": "This paper states the structural picture formed by the twelve parts of the Classification of Mathematical Representations of Physical Systems, a program asking whether mathematical representations of physical systems admit a structural classification analogous to the Classification of Finite Simple Groups. One ontology of forty-two definitions, one dependency graph, and one equivalence discipline run through the series. Three kinds of result organize its classification content. Complete invariants appear wherever the invariant is finite or explicitly parameterized: dimension vectors for finite-dimensional -algebras, Dynkin and Satake diagrams for semisimple Lie theory, classifying spaces for principal bundles, and the Murray-von Neumann and Connes data for amenable factors. Reconstruction theorems recover objects from probes under hypotheses that cannot be dropped. Seven obstruction theorems bound the scope of any classification, from uncountably many type factors to algorithmic unrecognizability in dimension four. Every equivalence in the series declares the structure it preserves, and equivalences that forget the symmetric layer fail in a proved counterexample. The structural classification conjecture is stated as the program\u2019s theorem target with its five proof obligations. The cross-volume consistency report records that the twelve parts share definitions, dependency discipline, and claim vocabulary without conflict.",
   166	    "pages": 23,
   167	    "hasCode": false,
   168	    "category": "math-ph",
   169	    "date": "October 2026"
   170	  }
    99	| Type-III factor structure beyond Connes spectrum | Family II | Coarse strata; examples with countable and trivial fundamental groups | **OPEN** | [8] |
   100	
   101	---
   102	
   103	## (f) Obstructions region — where no table exists
   104	
   105	A periodic table must mark where no table can exist. Each entry below is a **theorem**, not a difficulty.
   106	
   107	| Obstruction | Statement | What it forbids | Status | Sources |
   108	|---|---|---|---|---|
   109	| Adyan–Rabin | Every Markov property of finitely presentable groups is algorithmically undecidable — including finiteness and simplicity (Collins extended beyond Markov properties) | Any uniform recognition procedure for group-flavored sectors | **IMPOSSIBLE** | [53] |
   110	| McDuff | Uncountably many non-isomorphic separable type II₁ factors | CFSG-style total classification of factors outside the amenable case | **IMPOSSIBLE** | [8] |
   111	| Wildness (derived-wild; Buchweitz–Leuschke; Grevstad–May) | Rank-2 isomorphism classes of the generic determinant's Cohen–Macaulay modules are not parametrizable by a finite-dimensional variety; "no meaningful classification" of compact C_p-equivariant HF_p-modules at odd primes; wildness is degeneration-robust | Finite-variety parameterization of wild representation categories | **IMPOSSIBLE** | [55][56][58] |
   112	| Tame/wild tractability boundary (Grochow–Qiao) | Polynomial-time group isomorphism for tame extensions; required bounds fail in the wild case | Algorithmic classification in wild regimes | **IMPOSSIBLE** (wild side) | [57] |
   113	| Borel reducibility / turbulence (Sasyk–Tørnquist) | Von Neumann algebra isomorphism admits no classification by countable invariants | Countable-invariant classifications of vN algebras | **IMPOSSIBLE** [single source; announcement-level] | [59] |
   114	| Dimension-4 unrecognizability (Tancer; Gordon) | #₉(S²×S²) homeomorphism is algorithmically unrecognizable (improving #₁₂) | Effective classification of 4-manifolds in general | **IMPOSSIBLE** | [54][60] |
   115	| Etingof–Gelaki | Isocategorical groups: tensor equivalence without symmetric structure does not determine the group | Equivalence notions that discard the monoidal/symmetric layer | **IMPOSSIBLE** | [12] |
   116	| Unknotting problem | Unknot recognition is in NP and coNP; P-membership open | — (a "decidable but unclassified" middle regime) | **OPEN** | [61] |
   117	| Darboux triviality | Symplectic geometry has no local invariants | Local classification content on the symplectic side (classification must be global) | **PROVEN** (trivially classified locally) | [6] |
   118	
   119	**Regime contrast.** Geometrization decomposes 3-manifolds into exactly 8 Thurston geometries [60] — finite tables exist, but only in tame regimes (dimension 3, not 4 [54][60]). The synthesis offered to the program is that one should expect restricted-class classification theorems plus explicit obstruction theorems, not one global periodic table; this synthesis is *conjectural*.
   120	
   121	---
   122	
   123	## Reading the table
   124	
   125	1. **PROVEN** cells are citations to completed theorems; **IMPOSSIBLE** cells are citations to impossibility theorems — both are knowledge.
   126	2. **CLAIMED** appears exactly once as a classification-status cell (4D YM/QCD existence) [24][25][26]; existence and mass gap are never conflated [23][26].
   127	3. **OPEN** cells mark where the series' own conjecture (T-CMRPS-01) and its five obligations live; the table is the chart that conjecture would complete.
   128	4. Every equivalences entry names the structure it preserves, or records the failure that follows from not naming it [12].

exec
/usr/local/bin/zsh -lc "python3 -c 'import json;from pathlib import Path
ps=json.loads(Path(\"website/content/manifest.json\").read_text())
for p in ps:
 for f in (\"website/content/papers/\"+p[\"slug\"]+\".html\",\"website/public/pdf/\"+p[\"slug\"]+\".pdf\",\"website/public/og/\"+p[\"slug\"]+\".png\"):
  if not Path(f).is_file():print(\"MISSING\",f)
print(\"Checked\",len(ps),\"paper HTML/PDF/OG asset triplets\")'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 53ms:
Checked 13 paper HTML/PDF/OG asset triplets

codex
Reviewed only `website/` source.

1. **Math replacement corrupts a bibliography link.** [render-math.ts:69](website/lib/render-math.ts:69) applies `$…$` replacement across HTML attributes. In [vol-02-structural-families.html:362](website/content/papers/vol-02-structural-families.html:362), it inserts KaTeX markup inside `href="https://en.wikipedia.org/wiki/$C^*$-algebra"`. Reproduced by running the renderer. **Fix:** render math in text nodes only, skip attributes and previously rendered math, and correct the destination to `/wiki/C*-algebra`.

2. **Twenty internal reference links have nonexistent targets.** Comma-separated references become a single fragment identifier. Affected files include:
   
   - [synthesis.html:43](website/content/papers/synthesis.html:43): 1 link.
   - [vol-06-quantum-systems.html:241](website/content/papers/vol-06-quantum-systems.html:241): 3 links, also lines 287 and 324.
   - [vol-09-gravity-information-geometry.html:136](website/content/papers/vol-09-gravity-information-geometry.html:136): 12 links.
   - [vol-10-observational-equivalence.html:211](website/content/papers/vol-10-observational-equivalence.html:211): 4 links, also lines 320, 321 and 345.
   
   **Fix:** emit a separate anchor for each referenced definition, proposition or theorem. Validate every fragment against the destination document’s IDs.

3. **Periodic-table citations have no public bibliography.** [periodic-table.md:16](website/content/periodic-table.md:16) directs readers to `research/cmrps-research-map/REPORT.md`, which is neither linked nor published through the website source. The table’s numbered citations therefore cannot be followed. **Fix:** include the bibliography on this page and link citation numbers to its entries.

4. **All inline math is forced onto separate lines.** [render-math.ts:56](website/lib/render-math.ts:56) assigns the same class to inline and display math; [globals.css:688](website/app/globals.css:688) makes that class `display: block`. This breaks sentences around every inline expression. **Fix:** retain separate inline/display classes; apply block layout and horizontal scrolling to display equations, with appropriate containment for unusually long inline expressions.

5. **Sticky navigation can cover anchor destinations on small screens.** The header is sticky at [globals.css:59](website/app/globals.css:59), and its long title and navigation wrap at narrow widths. Neither global scroll padding nor heading scroll margins compensate for its height. **Fix:** add responsive anchor offsets, sized for the wrapped header, and verify paper references and `/#papers` at 375px.

6. **Internal process language remains in public papers.** Examples include “accompanying verification record” at [vol-03-irreducibility-decomposition.html:307](website/content/papers/vol-03-irreducibility-decomposition.html:307), the editorial removal rule at [vol-08-spacetime-reconstruction.html:360](website/content/papers/vol-08-spacetime-reconstruction.html:360), and “verification artifacts” at [vol-08-spacetime-reconstruction.html:448](website/content/papers/vol-08-spacetime-reconstruction.html:448). **Fix:** replace these with reader-facing descriptions and direct public evidence links; remove editorial workflow instructions.

OG/Twitter metadata, periodic-table and synthesis routes, and all 13 paper HTML/PDF/OG asset sets are present. Source includes wrapping navigation and scrolling containers for tables and equations; **375px overflow and collision behavior was not browser-verified**. External URL availability was not checked.

VERDICT: NEEDS_FIX
hook: Stop
hook: Stop Completed
tokens used
65,647
Reviewed only `website/` source.

1. **Math replacement corrupts a bibliography link.** [render-math.ts:69](website/lib/render-math.ts:69) applies `$…$` replacement across HTML attributes. In [vol-02-structural-families.html:362](website/content/papers/vol-02-structural-families.html:362), it inserts KaTeX markup inside `href="https://en.wikipedia.org/wiki/$C^*$-algebra"`. Reproduced by running the renderer. **Fix:** render math in text nodes only, skip attributes and previously rendered math, and correct the destination to `/wiki/C*-algebra`.

2. **Twenty internal reference links have nonexistent targets.** Comma-separated references become a single fragment identifier. Affected files include:
   
   - [synthesis.html:43](website/content/papers/synthesis.html:43): 1 link.
   - [vol-06-quantum-systems.html:241](website/content/papers/vol-06-quantum-systems.html:241): 3 links, also lines 287 and 324.
   - [vol-09-gravity-information-geometry.html:136](website/content/papers/vol-09-gravity-information-geometry.html:136): 12 links.
   - [vol-10-observational-equivalence.html:211](website/content/papers/vol-10-observational-equivalence.html:211): 4 links, also lines 320, 321 and 345.
   
   **Fix:** emit a separate anchor for each referenced definition, proposition or theorem. Validate every fragment against the destination document’s IDs.

3. **Periodic-table citations have no public bibliography.** [periodic-table.md:16](website/content/periodic-table.md:16) directs readers to `research/cmrps-research-map/REPORT.md`, which is neither linked nor published through the website source. The table’s numbered citations therefore cannot be followed. **Fix:** include the bibliography on this page and link citation numbers to its entries.

4. **All inline math is forced onto separate lines.** [render-math.ts:56](website/lib/render-math.ts:56) assigns the same class to inline and display math; [globals.css:688](website/app/globals.css:688) makes that class `display: block`. This breaks sentences around every inline expression. **Fix:** retain separate inline/display classes; apply block layout and horizontal scrolling to display equations, with appropriate containment for unusually long inline expressions.

5. **Sticky navigation can cover anchor destinations on small screens.** The header is sticky at [globals.css:59](website/app/globals.css:59), and its long title and navigation wrap at narrow widths. Neither global scroll padding nor heading scroll margins compensate for its height. **Fix:** add responsive anchor offsets, sized for the wrapped header, and verify paper references and `/#papers` at 375px.

6. **Internal process language remains in public papers.** Examples include “accompanying verification record” at [vol-03-irreducibility-decomposition.html:307](website/content/papers/vol-03-irreducibility-decomposition.html:307), the editorial removal rule at [vol-08-spacetime-reconstruction.html:360](website/content/papers/vol-08-spacetime-reconstruction.html:360), and “verification artifacts” at [vol-08-spacetime-reconstruction.html:448](website/content/papers/vol-08-spacetime-reconstruction.html:448). **Fix:** replace these with reader-facing descriptions and direct public evidence links; remove editorial workflow instructions.

OG/Twitter metadata, periodic-table and synthesis routes, and all 13 paper HTML/PDF/OG asset sets are present. Source includes wrapping navigation and scrolling containers for tables and equations; **375px overflow and collision behavior was not browser-verified**. External URL availability was not checked.

VERDICT: NEEDS_FIX
