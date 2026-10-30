---
reviewer: codex (OpenAI) gpt-6.1-sol
type: website
round: 3
date: 2026-10-30T14:29:53Z
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
session id: 01a18d37-9864-7062-b30f-9946eb2f1b0d
--------
user
Read ONLY the website/ source (do not explore other directories). This is round 3 after fixes. Round 2 issues were: (1) homepage metadata missing og:type and og:url — fixed (type website, url / added in app/page.tsx); (2) two internal process references in public copy — the periodic-table citation convention line now points to the published Sources section, and the synthesis abstract no longer references the cross-volume consistency report. Verify these fixes and review again for: broken KaTeX math (raw TeX leaking into HTML), horizontal overflow at 375px width, nav collisions on small screens, missing OG/Twitter meta tags, missing run-level summary pages (e.g. a periodic-table page when the run has one), dead links, and any process/reviewer language in public copy. List issues with file:line references and concrete fixes. End with VERDICT: PASS or VERDICT: NEEDS_FIX.
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
I’ll check the three fixes, then review `website/` for the remaining issues, keeping all reads within that directory.
exec
/usr/local/bin/zsh -lc 'rg --files website' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
website/tsconfig.json
website/lib/render-math.ts
website/lib/papers.ts
website/lib/macros.ts
website/package.json
website/package-lock.json
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
website/public/pdf/vol-07-gauge-qft.pdf
website/public/pdf/vol-04-yoneda-classification.pdf
website/public/pdf/vol-10-observational-equivalence.pdf
website/public/pdf/vol-05-classical-systems.pdf
website/public/pdf/vol-08-spacetime-reconstruction.pdf
website/public/pdf/vol-02-structural-families.pdf
website/public/pdf/vol-09-gravity-information-geometry.pdf
website/public/pdf/synthesis.pdf
website/public/pdf/vol-11-completeness-obstructions.pdf
website/public/pdf/vol-12-principia-physica.pdf
website/public/pdf/vol-03-irreducibility-decomposition.pdf
website/public/pdf/vol-06-quantum-systems.pdf
website/public/pdf/vol-01-foundations.pdf
website/components/TableOfContents.tsx
website/components/PaperContent.tsx
website/tailwind.config.ts
website/README.md
website/content/manifest.json
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
website/content/periodic-table.md
website/content/periodic-table-sources.md
website/next.config.mjs
website/postcss.config.mjs
website/app/globals.css
website/app/page.tsx
website/app/fonts/GeistVF.woff
website/app/fonts/GeistMonoVF.woff
website/app/layout.tsx
website/app/papers/[slug]/page.tsx
website/app/favicon.ico
website/app/periodic-table/page.tsx
website/theme.json

exec
/usr/local/bin/zsh -lc "nl -ba website/app/page.tsx
nl -ba website/app/layout.tsx
nl -ba website/app/periodic-table/page.tsx
nl -ba 'website/app/papers/[slug]/page.tsx'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
     1	import type { Metadata } from 'next';
     2	import { getPapers } from '../lib/papers';
     3	
     4	export const metadata: Metadata = {
     5	  openGraph: {
     6	    type: 'website',
     7	    url: '/',
     8	    images: [{ url: '/og/og-default.png', width: 1200, height: 630 }],
     9	  },
    10	  twitter: {
    11	    card: 'summary_large_image',
    12	    images: ['/og/og-default.png'],
    13	  },
    14	};
    15	
    16	export default function HomePage() {
    17	  const papers = getPapers();
    18	  const totalPages = papers.reduce((n, p) => n + p.pages, 0);
    19	
    20	  return (
    21	    <>
    22	      <section className="hero">
    23	        <div className="hero-bg" />
    24	        <div className="hero-grid-lines" />
    25	        <div className="hero-inner">
    26	          <p className="hero-kicker">A research series in structural mathematics</p>
    27	          <h1>
    28	            The Classification of Mathematical Representations of{' '}
    29	            <span className="em">Physical Systems</span>
    30	          </h1>
    31	          <p className="hero-sub">
    32	            A representation is recorded as a five-part tuple of state space, observables,
    33	            dynamics, symmetries, and composition rules. The series fixes a morphism
    34	            vocabulary with explicit preservation laws, classifies restricted classes in
    35	            full, and states the structural classification conjecture with its five proof
    36	            obligations. Twelve volumes, one synthesis.
    37	          </p>
    38	          <div className="hero-meta">
    39	            <span><b>{papers.length}</b> papers</span>
    40	            <span><b>{totalPages}</b> pages</span>
    41	            <span>Matthew Long · The YonedaAI Collaboration</span>
    42	            <span>October 2026</span>
    43	          </div>
    44	          <div className="hero-actions">
    45	            <a className="btn btn-primary" href="#papers">Read the papers</a>
    46	            <a className="btn btn-ghost" href="/periodic-table/">Periodic table</a>
    47	          </div>
    48	        </div>
    49	      </section>
    50	
    51	      <section className="section" id="papers">
    52	        <div className="section-head">
    53	          <h2>Papers</h2>
    54	          <span className="hint">Twelve volumes and a structural synthesis</span>
    55	        </div>
    56	        <div className="paper-grid">
    57	          {papers.map((p) => (
    58	            <article className="paper-card" key={p.slug}>
    59	              <div className="card-part">
    60	                <span>{p.part}</span>
    61	                <span className="cat">{p.category}</span>
    62	              </div>
    63	              <h3>
    64	                <a href={`/papers/${p.slug}/`}>{p.title}</a>
    65	              </h3>
    66	              {p.subtitle ? <p className="card-sub">{p.subtitle}</p> : null}
    67	              <p className="card-abstract">{p.abstract.slice(0, 150)}…</p>
    68	              <div className="card-foot">
    69	                <a className="read" href={`/papers/${p.slug}/`}>Read →</a>
    70	                <a className="pdf-link" href={`/pdf/${p.slug}.pdf`}>PDF</a>
    71	                <span>{p.pages} pp</span>
    72	              </div>
    73	            </article>
    74	          ))}
    75	        </div>
    76	      </section>
    77	
    78	      <section className="section" id="series">
    79	        <div className="section-head">
    80	          <h2>Program</h2>
    81	        </div>
    82	        <div className="paper-grid">
    83	          <article className="paper-card">
    84	            <div className="card-part">
    85	              <span>Registry</span>
    86	              <span className="cat">PROVEN · CLAIMED · OPEN · IMPOSSIBLE</span>
    87	            </div>
    88	            <h3>
    89	              <a href="/periodic-table/">The Periodic Table of Mathematical Physics</a>
    90	            </h3>
    91	            <p className="card-abstract">
    92	              The classification chart of the program: ten candidate structural families
    93	              with their defining invariants, exceptional structures, proven
    94	              reconstruction relationships, and the claim status of every row.
    95	            </p>
    96	            <div className="card-foot">
    97	              <a className="read" href="/periodic-table/">Open the table →</a>
    98	            </div>
    99	          </article>
   100	          <article className="paper-card">
   101	            <div className="card-part">
   102	              <span>Synthesis</span>
   103	              <span className="cat">math-ph</span>
   104	            </div>
   105	            <h3>
   106	              <a href="/papers/synthesis/">Structural Synthesis</a>
   107	            </h3>
   108	            <p className="card-abstract">
   109	              The structural picture formed by the twelve parts: the registered results,
   110	              the dependency structure among the volumes, and the obligations the
   111	              classification conjecture still carries.
   112	            </p>
   113	            <div className="card-foot">
   114	              <a className="read" href="/papers/synthesis/">Read →</a>
   115	              <a className="pdf-link" href="/pdf/synthesis.pdf">PDF</a>
   116	            </div>
   117	          </article>
   118	          <article className="paper-card">
   119	            <div className="card-part">
   120	              <span>Method</span>
   121	              <span className="cat">admissibility</span>
   122	            </div>
   123	            <h3>
   124	              <a href="/papers/vol-01-foundations/">Foundations of Structural Classification</a>
   125	            </h3>
   126	            <p className="card-abstract">
   127	              The definitional root of the series: the system record schema, five morphism
   128	              kinds with preservation laws, admissibility conditions, and three restricted
   129	              classifications proved in full.
   130	            </p>
   131	            <div className="card-foot">
   132	              <a className="read" href="/papers/vol-01-foundations/">Read →</a>
   133	              <a className="pdf-link" href="/pdf/vol-01-foundations.pdf">PDF</a>
   134	            </div>
   135	          </article>
   136	        </div>
   137	      </section>
   138	    </>
   139	  );
   140	}
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

exec
/usr/local/bin/zsh -lc 'nl -ba website/app/globals.css
nl -ba website/components/PaperContent.tsx
nl -ba website/components/TableOfContents.tsx
nl -ba website/lib/render-math.ts
nl -ba website/lib/papers.ts
cat website/package.json' in /Users/mlong/Documents/Development/classification-physical-systems
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

exec
/usr/local/bin/zsh -lc "sed -n '83,160p' website/app/globals.css
sed -n '290,420p' website/app/globals.css
sed -n '470,705p' website/app/globals.css" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
.site-header-inner {
  max-width: 1120px;
  margin: 0 auto;
  padding: 0.75rem 1rem;
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 0.5rem 1.25rem;
}

.site-title {
  font-family: var(--font-heading);
  font-weight: 700;
  font-size: 1.05rem;
  letter-spacing: 0.04em;
  color: var(--text);
  display: flex;
  align-items: center;
  gap: 0.55rem;
  min-width: 0;
  flex: 1 1 auto;
}

.site-title .mark {
  color: var(--accent-secondary);
  font-family: var(--font-body);
  font-size: 0.72rem;
  font-weight: 600;
  letter-spacing: 0.18em;
  border: 1px solid var(--border);
  border-radius: 4px;
  padding: 0.15rem 0.4rem;
  white-space: nowrap;
}

.site-nav {
  display: flex;
  flex-wrap: wrap;
  gap: 0.35rem 1rem;
  font-size: 0.88rem;
}

.site-nav a {
  color: var(--text-muted);
  padding: 0.25rem 0;
  border-bottom: 2px solid transparent;
}
.site-nav a:hover {
  color: var(--text);
  border-bottom-color: var(--accent);
}

/* ---------- hero ---------- */

.hero {
  position: relative;
  padding: 3rem 1rem 2.25rem;
  overflow: hidden;
  border-bottom: 1px solid var(--border);
}

@media (min-width: 768px) {
  .hero {
    padding: 5.5rem 1.5rem 4.5rem;
  }
}

.hero-bg {
  position: absolute;
  inset: 0;
  pointer-events: none;
  background:
    radial-gradient(900px 380px at 82% -10%, rgba(109, 140, 255, 0.18), transparent 65%),
    radial-gradient(700px 320px at 8% 110%, rgba(34, 211, 238, 0.12), transparent 60%);
}

.hero-grid-lines {
  position: absolute;
}

/* ---------- paper cards ---------- */

.paper-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1.15rem;
}

@media (min-width: 640px) {
  .paper-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (min-width: 1024px) {
  .paper-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}

.paper-card {
  position: relative;
  display: flex;
  flex-direction: column;
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 12px;
  padding: 1.25rem 1.25rem 1.15rem;
  min-height: 100%;
  transition: transform 0.18s ease, border-color 0.18s ease, box-shadow 0.18s ease;
  overflow: hidden;
}

.paper-card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 3px;
  background: linear-gradient(90deg, var(--accent), var(--accent-secondary));
  opacity: 0.75;
}

.paper-card:hover {
  transform: translateY(-3px);
  border-color: var(--accent);
  box-shadow: 0 14px 36px rgba(0, 0, 0, 0.35), 0 0 0 1px var(--accent-glow);
}

.card-part {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 0.5rem;
  margin-bottom: 0.75rem;
  font-size: 0.75rem;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: var(--accent-secondary);
  font-weight: 600;
}

.card-part .cat {
  color: var(--text-dim);
  letter-spacing: 0.06em;
  text-transform: none;
  font-family: ui-monospace, monospace;
}

.paper-card h3 {
  font-size: 1.13rem;
  margin: 0 0 0.55rem;
}

.paper-card h3 a {
  color: var(--text);
}
.paper-card:hover h3 a {
  color: var(--accent-hover);
}

.card-sub {
  color: var(--text-dim);
  font-size: 0.8rem;
  margin: 0 0 0.75rem;
}

.card-abstract {
  color: var(--text-muted);
  font-size: 0.88rem;
  margin: 0 0 1.15rem;
  flex: 1;
}

.card-foot {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 0.55rem 0.9rem;
  border-top: 1px solid var(--border);
  padding-top: 0.85rem;
  font-size: 0.82rem;
  color: var(--text-dim);
}

.card-foot .read {
  color: var(--accent);
  font-weight: 600;
}

.card-foot .pdf-link {
  color: var(--text-muted);
  border: 1px solid var(--border);
  border-radius: 6px;
  padding: 0.18rem 0.55rem;
}
.card-foot .pdf-link:hover {
  color: var(--accent-hover);
  border-color: var(--accent);
}

/* ---------- paper page ---------- */

.paper-layout {
  max-width: 1120px;
  margin: 0 auto;
  padding: 1.5rem 1rem 4rem;
  display: grid;
  color: var(--text-muted);
  font-weight: 600;
}

.pdf-btn {
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

exec
/usr/local/bin/zsh -lc "rg -n -i 'review|consistency|report|audit|pipeline|pandoc|internal|run[- ]|draft|todo|fixme|agent|process|citation convention' website/content website/app --glob '"'!*.css'"'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
website/app/layout.tsx:14:const siteUrl = process.env.VERCEL_PROJECT_PRODUCTION_URL
website/app/layout.tsx:15:  ? `https://${process.env.VERCEL_PROJECT_PRODUCTION_URL}`
website/app/layout.tsx:16:  : process.env.NEXT_PUBLIC_SITE_URL || 'http://localhost:3000';
website/content/manifest.json:74:    "abstractFull": "Quantum physical systems admit a complete structural classification only in restricted regimes, and this paper records where those regimes begin and end. Finite-dimensional observable algebras are classified by one combinatorial invariant, the dimension vector of the block decomposition. Amenable operator-algebraic models are classified by Murray-von Neumann type together with Connes invariants. Completely positive maps admit a canonical normal form through minimal Stinespring dilations, unique up to unitary equivalence, and the Kraus rank of that normal form is not an isomorphism invariant of channels. Beyond the amenable class no finite answer is possible: uncountably many pairwise non-isomorphic separable factors exist, so no finite list of factor types can be exhaustive. On the categorical side, the Doplicher-Roberts reconstruction theorem and Deligne\u2019s theorem classify superselection and symmetric tensor categories under explicit hypotheses, and the Etingof-Gelaki examples show that any equivalence forgetting the symmetric structure fails to recover its group. Quantum monotone metrics form a parametric family rather than a unique choice. The paper separates classified islands from proved impossibilities and open problems, and reports executable models of the finite-dimensional taxonomy as computational evidence only.",
website/content/manifest.json:165:    "abstractFull": "This paper states the structural picture formed by the twelve parts of the Classification of Mathematical Representations of Physical Systems, a program asking whether mathematical representations of physical systems admit a structural classification analogous to the Classification of Finite Simple Groups. One ontology of forty-two definitions, one dependency graph, and one equivalence discipline run through the series. Three kinds of result organize its classification content. Complete invariants appear wherever the invariant is finite or explicitly parameterized: dimension vectors for finite-dimensional -algebras, Dynkin and Satake diagrams for semisimple Lie theory, classifying spaces for principal bundles, and the Murray-von Neumann and Connes data for amenable factors. Reconstruction theorems recover objects from probes under hypotheses that cannot be dropped. Seven obstruction theorems bound the scope of any classification, from uncountably many type factors to algorithmic unrecognizability in dimension four. Every equivalence in the series declares the structure it preserves, and equivalences that forget the symmetric layer fail in a proved counterexample. The structural classification conjecture is stated as the program\u2019s theorem target with its five proof obligations. The cross-volume consistency report records that the twelve parts share definitions, dependency discipline, and claim vocabulary without conflict.",
website/content/periodic-table.md:16:Citation convention: bracketed citations link to the Sources section below. Inferences are marked *conjectural* or *open*.
website/content/papers/vol-12-principia-physica.html:21:<p><strong>Definition 3</strong> (Admissible systems and family closure).  An admissible physical system is an object of the schema of <a href="#def:representation" data-reference-type="ref+label" data-reference="def:representation">1</a> satisfying explicitly stated consistency conditions; <span class="math inline">\(\mathrm{Phys}_{\mathrm{adm}}\)</span> denotes the class of such objects. A structural family collection <span class="math inline">\(\mathfrak{F} = \{\mathfrak{F}_\alpha\}_{\alpha \in A}\)</span> is a collection of classes of objects singled out by their underlying mathematical structure, and <span class="math inline">\(\langle \mathfrak{F} \rangle_{\mathfrak{C}}\)</span> denotes the smallest class of objects containing <span class="math inline">\(\mathfrak{F}\)</span> and closed under a set of admissible constructions <span class="math inline">\(\mathfrak{C}\)</span>: tensor product, direct sum, extension, limits and colimits, and factorization.</p>
website/content/papers/vol-12-principia-physica.html:354:<p><strong>Conjecture 16</strong> (Structural classification of admissible physical systems).  Let <span class="math inline">\(\mathrm{Phys}_{\mathrm{adm}}\)</span> denote the class of mathematically admissible physical systems satisfying explicitly stated consistency conditions. There exists a collection of fundamental structural families <span class="math inline">\(\mathfrak{F} = \{\mathfrak{F}_\alpha\}_{\alpha \in A}\)</span> and a set of admissible constructions <span class="math inline">\(\mathfrak{C}\)</span> such that <span class="math display">\[\mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F}_\alpha \rangle_{\mathfrak{C}}.\]</span></p>
website/content/papers/vol-12-principia-physica.html:487:<p>The computational artifacts of this volume record the bookkeeping claims of the assembly and the finite-dimensional example of <a href="#sec:examples" data-reference-type="ref+label" data-reference="sec:examples">9</a>. The two files perform automated registry auditing and bookkeeping and exercise the worked example; they verify no mathematics. Both files accompany this paper in the CMRPS project repository at <a href="https://github.com/YonedaAI/cmrps" class="uri">https://github.com/YonedaAI/cmrps</a>, under <code>src/vol-12-principia-physica</code>. <a href="#tab:code" class="reflink">8</a> maps each computational claim to the file and function that exercises it.</p>
website/content/papers/vol-12-principia-physica.html:501:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-12-principia-physica.html:506:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-12-principia-physica.html:511:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-12-principia-physica.html:516:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-12-principia-physica.html:558:<p class="bibitem" id="bib-corpus-27"><span class="bib-num">[27]</span> M. Douglas, Nature Reviews Physics 8 (2026) 86–97. <a href="https://www.nature.com/articles/s42254-025-00909-2" class="uri">https://www.nature.com/articles/s42254-025-00909-2</a></p>
website/content/papers/synthesis.html:2:This paper states the structural picture formed by the twelve parts of the Classification of Mathematical Representations of Physical Systems, a program asking whether mathematical representations of physical systems admit a structural classification analogous to the Classification of Finite Simple Groups. One ontology of forty-two definitions, one dependency graph, and one equivalence discipline run through the series. Three kinds of result organize its classification content. Complete invariants appear wherever the invariant is finite or explicitly parameterized: dimension vectors for finite-dimensional <span class="math inline">\(C^*\)</span>-algebras, Dynkin and Satake diagrams for semisimple Lie theory, classifying spaces for principal bundles, and the Murray-von Neumann and Connes data for amenable factors. Reconstruction theorems recover objects from probes under hypotheses that cannot be dropped. Seven obstruction theorems bound the scope of any classification, from uncountably many type <span class="math inline">\(\mathrm{II}_1\)</span> factors to algorithmic unrecognizability in dimension four. Every equivalence in the series declares the structure it preserves, and equivalences that forget the symmetric layer fail in a proved counterexample. The structural classification conjecture is stated as the program’s theorem target with its five proof obligations. The twelve parts share definitions, dependency discipline, and claim vocabulary without conflict.
website/content/papers/synthesis.html:48:<p><strong>Definition 3</strong> (Admissibility).  An object <span class="math inline">\(P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})\)</span> is admissible when the five components are mutually consistent. Explicitly: the domain of <span class="math inline">\(\mathcal{D}\)</span> is the state space <span class="math inline">\(X\)</span> and its flow preserves the observable algebra <span class="math inline">\(\mathcal{O}\)</span>; the action of <span class="math inline">\(\mathcal{S}\)</span> on <span class="math inline">\(X\)</span> preserves <span class="math inline">\(\mathcal{D}\)</span>; and the internal composition rule <span class="math inline">\(\mathcal{C}\)</span> is closed under composition of its own morphisms. The component <span class="math inline">\(\mathcal{C}\)</span> is internal to a single system and records how that system composes with others; the construction set <span class="math inline">\(\mathfrak{C}\)</span> of <a href="#def:constructions" data-reference-type="ref+label" data-reference="def:constructions">2</a> is external and builds new systems from old ones. The admissible objects form the full subcategory <span class="math inline">\(\mathrm{Phys}_{\mathrm{adm}}\)</span>, which is closed under every construction of <span class="math inline">\(\mathfrak{C}\)</span>.</p>
website/content/papers/synthesis.html:247:<p>Mathematical consistency and empirical selection are different layers. A consistency proof settles the first and leaves the second open, because the empirical layer applies an observation map that mathematical classification does not compute.</p>
website/content/papers/synthesis.html:248:<h2 id="cross-volume-consistency">Cross-volume consistency</h2>
website/content/papers/synthesis.html:249:<p>The twelve parts maintain uniform definition identifiers, respect the directed dependency discipline, and enforce the preserved-layer constraint throughout. Eight consistency checks hold across the corpus, seven without qualification and one after a scope correction.</p>
website/content/papers/synthesis.html:329:<p class="bibitem" id="bib-corpus-73"><span class="bib-num">[38]</span> S. Hernández-Cuenca, The holographic entropy cone for five regions, Physical Review D 100 (2019) 026004. <a href="https://doi.org/10.1103/PhysRevD.100.026004" class="uri">https://doi.org/10.1103/PhysRevD.100.026004</a></p>
website/content/papers/vol-03-irreducibility-decomposition.html:307:<p>The first artifact is an executable taxonomy layer in Haskell. Its module declares instances of the shared family, construction, and decomposition classes for the systems treated here: matrix blocks and their direct sums, tensor products of blocks, and Kraus normal form data. Multiplicity matrices appear as data types mirroring <a href="#def:multiplicity-matrix" data-reference-type="ref+label" data-reference="def:multiplicity-matrix">19</a>. The names mirror the definitions of this paper and the mechanization targets listed with this paper. The Haskell layer is computational evidence, validated against kernel-checked specifications through cross-audit, and it is not verified by any proof assistant.</p>
website/content/papers/vol-03-irreducibility-decomposition.html:308:<p>The second artifact is a set of enumeration experiments in Python. One experiment enumerates dimension vectors of the closure of <span class="math inline">\(\{\mathbb{C}, M_2(\mathbb{C})\}\)</span> under direct sum and tensor product up to total dimension <span class="math inline">\(64\)</span> and checks the arithmetic of <a href="#prop:construction-arithmetic" data-reference-type="ref+label" data-reference="prop:construction-arithmetic">37</a>. It returns <span class="math inline">\(1085\)</span> dimension vectors, all of whose entries lie in the multiplicative semigroup <span class="math inline">\(\{1, 2, 4, 8, 16, 32, 64\}\)</span> generated by <span class="math inline">\(1\)</span> and <span class="math inline">\(2\)</span>, and it confirms that <span class="math inline">\(M_3(\mathbb{C})\)</span> lies outside the closure. A second experiment enumerates multiplicity matrices for the three block pairs of <a href="#tab:homs" class="reflink">1</a> and returns exactly <span class="math inline">\(2\)</span>, <span class="math inline">\(1\)</span>, and <span class="math inline">\(6\)</span> solutions, matching the conjugacy-class counts of the table entry by entry. A third computes Choi ranks of completely positive maps: for a random map of minimal rank <span class="math inline">\(1\)</span>, presented Kraus families of sizes <span class="math inline">\(1\)</span>, <span class="math inline">\(2\)</span>, <span class="math inline">\(3\)</span>, <span class="math inline">\(5\)</span>, and <span class="math inline">\(8\)</span> all return Choi rank <span class="math inline">\(1\)</span> and reproduce the same map, while the identity channel and conjugation by the Pauli <span class="math inline">\(Z\)</span> operator both have rank <span class="math inline">\(1\)</span> and differ on the Pauli <span class="math inline">\(X\)</span> operator. The experiments run in seconds on ordinary hardware and record their seeds in the source.</p>
website/content/papers/vol-11-completeness-obstructions.html:25:<p><strong>Definition 3</strong> (Admissible class and closure).  An admissible representation is one satisfying four consistency conditions: internal consistency of the five components of <a href="#def:tuple" data-reference-type="ref+Label" data-reference="def:tuple">1</a>; closure of the observable algebra under its stated operations; existence of a well-posed dynamics; and compatibility of symmetry data with composition. The full subcategory of admissible representations is <span class="math inline">\(\mathrm{Phys}_{\mathrm{adm}}\)</span>. A structural family is a full subcategory of representations singled out by its underlying mathematical structure, and a family collection is a set <span class="math inline">\(\mathfrak{F} = \{\mathfrak{F}_\alpha\}_{\alpha \in A}\)</span> of them. The construction set <span class="math inline">\(\mathfrak{C}\)</span> consists of tensor product, direct sum, extension, limits and colimits, and factorization, and the closure <span class="math inline">\(\langle \mathfrak{F}_\alpha \rangle_{\mathfrak{C}}\)</span> is the smallest class containing <span class="math inline">\(\mathfrak{F}\)</span> and closed under <span class="math inline">\(\mathfrak{C}\)</span>.</p>
website/content/papers/vol-11-completeness-obstructions.html:29:<p><em>Remark 4</em> (Unfixed premise).  Completeness of a classification over <span class="math inline">\(\mathrm{Phys}_{\mathrm{adm}}\)</span> cannot be evaluated against a moving premise. Until the admissibility list is fixed, the first proof obligation of the universal classification conjecture is not merely open; its statement is conditional. This is an obstruction of an internal kind, and it is the reason the analysis below runs on domains with standard mathematical definitions rather than on <span class="math inline">\(\mathrm{Phys}_{\mathrm{adm}}\)</span> itself.</p>
website/content/papers/vol-11-completeness-obstructions.html:208:<p>Full faithfulness is what carries the wild embedding, because it preserves the Hom-dimensions the universality property is built from; injectivity on isomorphism classes is what carries isomorphism behavior. Physical embeddings that deliberately identify systems fail the second hypothesis, and a coarse-graining map that forgets microscopic detail typically fails it as well, so the theorem is silent about classification programs run on coarse descriptions.</p>
website/content/papers/vol-11-completeness-obstructions.html:258:<p>The first experiment enumerates the regime assignment of <a href="#tab:regimes" class="reflink">2</a> as data and checks two properties mechanically: every surveyed domain receives exactly one regime label, and every label used is one of the seven of <a href="#def:regime" data-reference-type="ref+Label" data-reference="def:regime">9</a>. The experiment treats the table as input, so it verifies the internal consistency of the assignment and not the mathematical truth of any row.</p>
website/content/papers/vol-11-completeness-obstructions.html:262:<p>The experiments also mark what computation cannot do here. No finite run decides whether an algebraic family exists covering an isomorphism-class set, and no enumeration of small instances distinguishes a tame domain from a wild one at the boundary. The register theorems decide those questions, and the experiments only display their shadow on finite data.</p>
website/content/papers/vol-11-completeness-obstructions.html:263:<p>The experiments are deterministic and self-contained. Each script computes its output from definitions written in the script itself and from no external data, so a reader can rerun them and compare printed values against the claims of this section. The expected outputs are small enough to check by hand: the partition property of the regime table, the lists of dimension vectors at small <span class="math inline">\(N\)</span>, and the quotient-dimension values along the diagonal <span class="math inline">\(a = b = n\)</span> for <span class="math inline">\(m = 2\)</span> and <span class="math inline">\(m = 3\)</span>. Agreement is evidence for the claims as stated and nothing more.</p>
website/content/papers/vol-06-quantum-systems.html:2:Quantum physical systems admit a complete structural classification only in restricted regimes, and this paper records where those regimes begin and end. Finite-dimensional observable algebras are classified by one combinatorial invariant, the dimension vector of the block decomposition. Amenable operator-algebraic models are classified by Murray-von Neumann type together with Connes invariants. Completely positive maps admit a canonical normal form through minimal Stinespring dilations, unique up to unitary equivalence, and the Kraus rank of that normal form is not an isomorphism invariant of channels. Beyond the amenable class no finite answer is possible: uncountably many pairwise non-isomorphic separable <span class="math inline">\(\mathrm{II}_1\)</span> factors exist, so no finite list of factor types can be exhaustive. On the categorical side, the Doplicher-Roberts reconstruction theorem and Deligne’s theorem classify superselection and symmetric tensor categories under explicit hypotheses, and the Etingof-Gelaki examples show that any equivalence forgetting the symmetric structure fails to recover its group. Quantum monotone metrics form a parametric family rather than a unique choice. The paper separates classified islands from proved impossibilities and open problems, and reports executable models of the finite-dimensional taxonomy as computational evidence only.
website/content/papers/vol-06-quantum-systems.html:331:<p>The negative results are part of the answer. The McDuff obstruction and the Etingof-Gelaki counterexample say where classification stops and which layers of structure carry it, and a classification program that records only its successes would misreport the state of the subject.</p>
website/content/papers/vol-01-foundations.html:75:<p><strong>Definition 9</strong> (Morphism kind).  A morphism of records is declared in exactly one of five kinds. A <em>coarse-graining</em> forgets microscopic detail while preserving macroscopic observables. An <em>equivalence morphism</em> is invertible and represents exact equivalence of representations. An <em>embedding</em> realizes <span class="math inline">\(P_1\)</span> as a subsystem, subtheory, or substructure of <span class="math inline">\(P_2\)</span>. A <em>duality</em> is a contravariant equivalence between two record presentations: invertible as a correspondence between distinct presentations rather than as an arrow of one category. A <em>limiting procedure</em> arises from a limit or colimit process, and the named processes of the program are the thermodynamic limit, the infinite-volume limit, the semiclassical limit, and the continuum limit.</p>
website/content/papers/vol-01-foundations.html:88:<li><p><em>Limiting procedure.</em> The declared morphism is the leg map of a cone or cocone of a diagram of records under one of the four named limit processes, and the law carries the diagram data. The diagram is indexed by a directed parameter with no terminal object, a family growing without bound or a parameter approaching a limiting value. A map between two fixed finite records is never a limiting procedure of this kind.</p></li>
website/content/papers/vol-01-foundations.html:146:<p>Arbitrary records are not physical systems. A record with contradictory components, an observable collection that is not closed under its own operations, or dynamics that is not defined on the whole state space is a formal tuple and nothing more. The program needs an explicit list of consistency conditions, and the list below is what this paper must fix.</p>
website/content/papers/vol-01-foundations.html:365:<tr><td>Taxonomy instances compile against the shared classes and run their demo</td><td>with</td><td>Build transcript and demo output recorded in the evidence file</td></tr>
website/content/papers/vol-05-classical-systems.html:326:<p>The Darboux chart experiment takes a perturbed two-form <span class="math inline">\(\omega = \omega_0 + d\alpha\)</span> on a ball in <span class="math inline">\(\mathbb{R}^{4}\)</span> and integrates the Moser homotopy of <a href="#lem:moser-ball" data-reference-type="ref+label" data-reference="lem:moser-ball">9</a>, producing a diffeomorphism that pulls <span class="math inline">\(\omega\)</span> back to <span class="math inline">\(\omega_0\)</span>. The residual <span class="math inline">\(\|\varphi^{*} \omega - \omega_0\|\)</span> is computed and reported. On the tested instance (quadratic perturbation with scale <span class="math inline">\(0.05\)</span>, twelve sample points, four hundred Runge-Kutta steps, complex-step Jacobians at step <span class="math inline">\(10^{-20}\)</span>) the maximum entrywise residual <span class="math inline">\(\|J^{T} \omega(\varphi(x_0)) J - \omega_0(x_0)\|_{\max}\)</span> is <span class="math inline">\(2.4 \times 10^{-15}\)</span>, at double precision floor. The experiment evidences the constructive content of the proof of <a href="#thm:darboux" data-reference-type="ref+label" data-reference="thm:darboux">10</a>: the homotopy exists as an ordinary differential equation and its numerical integration is stable on the tested examples.</p>
website/content/papers/vol-05-classical-systems.html:383:<p class="bibitem" id="bib-marsden-weinstein"><span class="bib-num">[10]</span> J. E. Marsden and A. Weinstein, Reduction of symplectic manifolds with symmetry, <em>Reports on Mathematical Physics</em> <strong>5</strong> (1974), 121 to 130.</p>
website/content/papers/vol-10-observational-equivalence.html:28:<p><strong>Definition 5</strong> (Admissible candidate relation).  Let <span class="math inline">\(\simeq\)</span> be a candidate relation claimed as physical equivalence, and let <span class="math inline">\(\mathcal{A}\)</span> be a family of admissible observation functors. The candidate is admissible only if <span class="math display">\[{\cong} \;\subseteq\; {\simeq} \;\subseteq\; \bigcap_{\mathrm{Obs} \in \mathcal{A}} {\approx_{\mathrm{Obs}}}.\]</span> The first inclusion states that an isomorphism of tuples is an identification no physical criterion can reject. The second states that physically equivalent systems are not separated by any admissible observation: if some admissible observation separates <span class="math inline">\(P\)</span> and <span class="math inline">\(Q\)</span>, the two systems report different outcomes to the same experiment, and declaring them physically equivalent contradicts the requirement that equivalent descriptions carry the same observable physics.</p>
website/content/papers/vol-10-observational-equivalence.html:59:<p><em>Proof, by reference.</em> The construction of isocategorical groups and the proof appear in the original source <a class="citation" href="#bib-b2">[2]</a>, recorded in the series theorem registry as an obstruction result. The example pairs the affine symplectic group of a vector space over the field with two elements with a suitable affine pseudosymplectic group; the proofs run through triangular Hopf algebras <a class="citation" href="#bib-b2">[2]</a>. The tensor-category equivalence is monoidal and does not respect the commutativity constraint <a class="citation" href="#bib-b2">[2]</a>: the symmetric braiding is the layer the equivalence fails to preserve. This paper does not reprove the construction; it uses the statement as a constraint and searches for counterexamples to other criteria in <a href="#sec:search" data-reference-type="ref+Label" data-reference="sec:search">6</a>. The series status of the statement is a complete proof in the mathematical literature, not a machine-checked result. ◻</p>
website/content/papers/vol-10-observational-equivalence.html:65:<p><em>Proof.</em> If two systems were identified by an equivalence of representation categories as plain tensor categories, <a href="#thm:eg" data-reference-type="ref+Label" data-reference="thm:eg">8</a> exhibits pairs of groups for which such an identification misreports the systems as alike while their group data differ. When those data are observable (superselection sectors, global symmetry groups), the identification contradicts the observable physics. The declaration of preserved layers is the device that makes the failure visible before the quotient is formed. ◻</p>
website/content/papers/vol-10-observational-equivalence.html:87:<p><strong>Definition 11</strong> (Observation functor).  An observation functor is a pair <span class="math inline">\((\mathsf{Obs}, \mathrm{Obs})\)</span> of a category <span class="math inline">\(\mathsf{Obs}\)</span> whose objects are observation records and whose morphisms are comparisons between records, together with a functor <span class="math inline">\(\mathrm{Obs} \colon \mathrm{Phys}_{\mathrm{adm}} \to \mathsf{Obs}\)</span> that assigns to each admissible system its observation record and to each admissible morphism the induced comparison of records. An observation record packages the observational constraints or predictions a system presents to measurement: the family of accessible experiments, the outcomes each experiment reports, and the comparison of records under coarsening.</p>
website/content/papers/vol-10-observational-equivalence.html:114:<p><em>Proof.</em> A comparison witnessing <span class="math inline">\(\mathrm{Obs}_f(P) \cong \mathrm{Obs}_f(Q)\)</span> maps under the functor <span class="math inline">\(h\)</span> to a comparison witnessing <span class="math inline">\(\mathrm{Obs}_c(P) \cong \mathrm{Obs}_c(Q)\)</span>, which proves the inclusion. For strictness, take <span class="math inline">\(\Omega = \{1,2,3,4\}\)</span> with <span class="math inline">\(p = (\tfrac{1}{2}, \tfrac{1}{4}, \tfrac{1}{8}, \tfrac{1}{8})\)</span> and <span class="math inline">\(q = (\tfrac{1}{4}, \tfrac{1}{2}, \tfrac{1}{8}, \tfrac{1}{8})\)</span>. Let <span class="math inline">\(\mathrm{Obs}_f\)</span> report the joint record of two experiments, the partition <span class="math inline">\(\{\{1,2\}, \{3,4\}\}\)</span> with pushforward <span class="math inline">\((\tfrac{3}{4}, \tfrac{1}{4})\)</span> for both <span class="math inline">\(p\)</span> and <span class="math inline">\(q\)</span>, and the partition <span class="math inline">\(\{\{1,3\}, \{2,4\}\}\)</span> with pushforwards <span class="math inline">\((\tfrac{5}{8}, \tfrac{3}{8})\)</span> and <span class="math inline">\((\tfrac{3}{8}, \tfrac{5}{8})\)</span>. Let <span class="math inline">\(h\)</span> forget the second experiment, so <span class="math inline">\(\mathrm{Obs}_c\)</span> retains only the first. The fine records differ and the coarse records agree, and the coarsening <span class="math inline">\(h\)</span> is exactly the forgetting map of <a href="#def:coarse" data-reference-type="ref+Label" data-reference="def:coarse">14</a>. The computation is reproduced in the computational appendix (<code>observation_quotient.py</code>, function <code>coarse_vs_fine</code>). ◻</p>
website/content/papers/vol-10-observational-equivalence.html:123:<p><em>Proof.</em> Under the stated hypothesis the record of a composite is a product of records, and a product of isomorphisms is an isomorphism, so indistinguishability of the factors is preserved. For the failure direction, take <span class="math inline">\(\Omega = \{1,2,3,4\}\)</span> with distributions <span class="math inline">\(p = (\tfrac{1}{2}, \tfrac{1}{4}, \tfrac{1}{8}, \tfrac{1}{8})\)</span> and <span class="math inline">\(q = (\tfrac{1}{4}, \tfrac{1}{2}, \tfrac{1}{8}, \tfrac{1}{8})\)</span>. Let the factor observation be the single experiment with outcome blocks <span class="math inline">\(\{\{1,2\}, \{3,4\}\}\)</span>, under which <span class="math inline">\(p \approx q\)</span> (both push forward to <span class="math inline">\((\tfrac{3}{4}, \tfrac{1}{4})\)</span>). On the composite state space <span class="math inline">\(\Omega \times \Omega\)</span> the factor-marginal records of <span class="math inline">\(p \times p\)</span> and <span class="math inline">\(p \times q\)</span> coincide, yet the joint event <span class="math inline">\(\omega_1 = \omega_2\)</span> reports <span class="math inline">\(\sum_i p_i^2 = \tfrac{11}{32}\)</span> under <span class="math inline">\(p \times p\)</span> and <span class="math inline">\(\sum_i p_i q_i = \tfrac{9}{32}\)</span> under <span class="math inline">\(p \times q\)</span>. The joint experiment separates two composites whose factor relations identify the factors. ◻</p>
website/content/papers/vol-10-observational-equivalence.html:188:<p>A criterion that survives all three steps is not thereby correct. It is admissible so far, and the record of the search is part of the argument: which examples were run, which layers were named, which failure modes were ruled out. The series records no positive criterion for physical equivalence; the outcomes of <a href="#tab:criteria" class="reflink">3</a> are the first run of the protocol.</p>
website/content/papers/vol-10-observational-equivalence.html:209:<p>Selection among the members of one class is not an observation problem in the sense of <a href="#def:obs" data-reference-type="ref+Label" data-reference="def:obs">11</a>. It requires data the records do not carry: the internal structure of the theories, the behavior outside the accessible regime, or criteria of a different kind entirely. The three-layer architecture keeps this separation explicit: the empirical layer maps theories to observational constraints and predictions, and it is not a claim that every model maps to a single observational object. The quotient of <a href="#prop:equivrel" data-reference-type="ref+Label" data-reference="prop:equivrel">12</a> is the observational part of that map, nothing more.</p>
website/content/papers/vol-10-observational-equivalence.html:211:<p>The constructions of <a href="#sec:functors" class="reflink">Section Observation functors</a> <a href="#sec:metrics" class="reflink">Section Information-geometric distinguishability</a> run on explicit data. The explicit data cover a finite classical observation functor with its quotient classes, the qubit computation of <a href="#ex:monotone" data-reference-type="ref+Label" data-reference="ex:monotone">20</a> in full generality, groups of order 8 whose character tables agree, and a product of observations.</p>
website/content/papers/vol-10-observational-equivalence.html:340:<p>The choice of <span class="math inline">\(\simeq\)</span> moves from open to fixed only through concrete tasks, each stated so that it can fail. The first task is to fix the record category for a named class of systems: the admissible experiments, the isomorphisms of records, and the composition of records under interaction. Success means a construction to which <a href="#prop:equivrel" data-reference-type="ref+Label" data-reference="prop:equivrel">12</a> applies outside the toy model of <a href="#sec:examples" data-reference-type="ref+Label" data-reference="sec:examples">9</a>; failure means the class admits no well-formed observation functor. The second task is to determine whether bounded experimental indistinguishability composes in an interacting regime, the question <a href="#sec:functors" data-reference-type="ref+Label" data-reference="sec:functors">4</a> leaves open through <a href="#prop:composed" data-reference-type="ref+Label" data-reference="prop:composed">16</a>. Success means a theorem connecting the functorial relation of <a href="#sec:functors" data-reference-type="ref+Label" data-reference="sec:functors">4</a> with an operational relation between records; failure means a counterexample in which two systems are indistinguishable by every individual experiment and distinguishable by a joint one. The third task is to state a positive criterion for physical equivalence and run it through the protocol of <a href="#sec:protocol" data-reference-type="ref+Label" data-reference="sec:protocol">6.1</a>. Success means a criterion that survives the protocol and is argued for at the empirical layer; failure means another row of <a href="#tab:criteria" class="reflink">3</a> closes negatively, which is itself a result the program accepts.</p>
website/content/papers/vol-10-observational-equivalence.html:344:<p>The counterexample search found one proved falsification (<a href="#thm:eg" data-reference-type="ref+Label" data-reference="thm:eg">8</a>) and one computed failure of canonicity (<a href="#ex:monotone" data-reference-type="ref+Label" data-reference="ex:monotone">20</a>); it did not produce a concrete non-isomorphic pair of system records to close the dual-presentation row of <a href="#tab:criteria" class="reflink">3</a> at the system level. The search is bounded by the sources reviewed (cutoff 2026-10-29), and the absence of such a pair in this paper is not evidence that the literature lacks one.</p>
website/content/papers/vol-04-yoneda-classification.html:36:<div id="ex:process" class="remark">
website/content/papers/vol-04-yoneda-classification.html:37:<p><em>Remark 7</em> (Process categories).  Fix finite-dimensional systems and let <span class="math inline">\(\mathcal{C}_{\mathrm{ch}}\)</span> have as objects the completely positive trace-preserving maps <span class="math inline">\(\Phi \colon M_n \to M_m\)</span> for varying <span class="math inline">\(n\)</span> and <span class="math inline">\(m\)</span>. A morphism from <span class="math inline">\(\Phi \colon A \to B\)</span> to <span class="math inline">\(\Psi \colon C \to D\)</span> is a pair of channels <span class="math inline">\((E \colon C \to A,\ L \colon B \to D)\)</span> with <span class="math inline">\(\Psi = L \circ \Phi \circ E\)</span>; composition is componentwise, and the identity on <span class="math inline">\(\Phi\)</span> is <span class="math inline">\((\mathrm{id}, \mathrm{id})\)</span>. These pairs are the pre- and post-processings without auxiliary memory. General supermaps admit ancillary systems that bridge input and output, and the representability theorem of Section <a href="#sec:supermap" data-reference-type="ref" data-reference="sec:supermap">4</a> covers that wider setting. Supermaps are the transformations of the processes this category treats as objects, and the relational content in this setting is concretely computable through channel-state duality, because a channel is a state of the composed system.</p>
website/content/papers/vol-04-yoneda-classification.html:93:<p>Tensor products behave differently. There is in general no canonical map relating <span class="math inline">\(\mathop{\mathrm{Hom}}(R, P \otimes Q)\)</span> to <span class="math inline">\(\mathop{\mathrm{Hom}}(R, P) \otimes \mathop{\mathrm{Hom}}(R, Q)\)</span>, and the profile of a composite system is not assembled from the profiles of its factors by any universal construction available to the embedding. Determination of composites from relational data is therefore not a formal consequence of Yoneda; where it holds, it holds by a further theorem. The factorisation results of <a href="#sec:supermap" data-reference-type="ref+label" data-reference="sec:supermap">4</a> are exactly such a theorem for the composition of processes under a causal-order hypothesis, and the decomposition theory of representation categories is such a theory for tensor structure. This asymmetry is a design fact of the relational program: limits are transparent to probes, monoidal composition is not.</p>
website/content/papers/vol-04-yoneda-classification.html:122:<p>A <em>supermap</em> is a transformation <span class="math inline">\(\Psi\)</span> that assigns to each channel <span class="math inline">\(\Phi \colon M_n \to M_m\)</span> of an admissible class a channel <span class="math inline">\(\Psi(\Phi) \colon M_{n&#39;} \to M_{m&#39;}\)</span>, compatibly with composition of channels and with the tensor product of systems. Supermaps are therefore second-order processes: processes whose inputs and outputs are themselves processes. The relational question for them is concrete. Which transformations count as processes in their own right, and can the answer be read off from the relationships the channel admits? The channel-state duality answers both questions at once, because it identifies a channel with a state of the composed system.</p>
website/content/papers/vol-04-yoneda-classification.html:138:<p>Proposition <a href="#prop:choi" data-reference-type="ref" data-reference="prop:choi">18</a> is the concrete setting in which channel-state duality is exact: the channel is a state on the composed system, and composition is an index contraction. The category of Remark <a href="#ex:process" data-reference-type="ref" data-reference="ex:process">7</a> records the fragment of process morphisms without auxiliary memory; the theorem below covers supermaps in the full sense of <a class="citation" href="#bib-whh">[1]</a>, <a class="citation" href="#bib-hw">[2]</a>, where ancillary systems may bridge input and output, and the presheaf of the restricted category is the fragment of that structure on pre- and post-processings.</p>
website/content/papers/vol-04-yoneda-classification.html:140:<p><strong>Theorem 20</strong> (Supermap representability).  <em>Let <span class="math inline">\(\mathcal{T}\)</span> be a theory of processes whose processes form a symmetric monoidal category under sequential and parallel composition, and suppose <span class="math inline">\(\mathcal{T}\)</span> is equipped with a channel-state duality: a natural identification of each process <span class="math inline">\(\Phi \colon A \to B\)</span> with a state of the composite system <span class="math inline">\(A \otimes B\)</span>, preserved by composition. Then the categorical supermaps of <span class="math inline">\(\mathcal{T}\)</span> are concretely representable through that duality: every supermap corresponds to a process of the composite system, and representability yields the factorisation theorems for causally ordered supermaps.</em></p>
website/content/papers/vol-04-yoneda-classification.html:146:<p><em>Remark 21</em> (What the theorem shows).  Theorem <a href="#thm:supermap" data-reference-type="ref" data-reference="thm:supermap">20</a> is the one recorded setting where relational representability is concretely computational: the relationships between processes are themselves processes, and factorisation statements follow. The hypotheses travel with the theorem. Channel-state duality of the required kind is a property of particular frameworks, and no claim is made here that every setting of interest has it, or that the result extends from quantum processes to mathematical representations of physical systems at large. Wilson, Hefford, and Hoffreumon <a class="citation" href="#bib-whh">[1]</a> apply the same lemma to generalised circuit theories, including boxworld and real quantum theory, which shows the hypothesis is checkable theory by theory rather than automatic.</p>
website/content/papers/vol-04-yoneda-classification.html:148:<p>The supermap setting supports one precise reading of the relational program: once the morphisms are fixed as process transformations and a channel-state duality is available, the profile of a process is not formal data but computable data. That is genuine content, and it is narrower than the slogan of a Yoneda lemma for physics. <a href="#sec:synthesis" data-reference-type="ref+Label" data-reference="sec:synthesis">9</a> records how much narrower.</p>
website/content/papers/vol-04-yoneda-classification.html:150:<p>The representability statement is not the end of the supermap line. The same authors use it to prove factorisation theorems <a class="citation" href="#bib-hw">[2]</a>, and the shape of those theorems is the clearest existing instance of relational structure producing concrete process structure.</p>
website/content/papers/vol-04-yoneda-classification.html:243:<p>Three claims of this paper have computational evidence and none has a computational proof. The experiment files in <code>src/vol-04-yoneda-classification/</code> run the checks, and the module <code>Instances.hs</code> records the taxonomy declarations for the volume’s four systems: a commutative probe system in the sense of Remark <a href="#ex:classical" data-reference-type="ref" data-reference="ex:classical">6</a>, a Boolean probe system, a finite-group representation system, and a quantum channel system in the sense of Remark <a href="#ex:quantum" data-reference-type="ref" data-reference="ex:quantum">5</a>. The profile data of Definition <a href="#def:profile" data-reference-type="ref" data-reference="def:profile">2</a> appears in the module in the following executable shape, where the action field is the presheaf action of the definition: precomposition of a relationship along a probe morphism.</p>
website/content/papers/vol-04-yoneda-classification.html:249:<p>The channel fragment of the module carries typed process data and computes with it: a channel is a list of Kraus operators between spaces of recorded dimensions, and the Choi matrix of Proposition <a href="#prop:choi" data-reference-type="ref" data-reference="prop:choi">18</a> is computed from that data.</p>
website/content/papers/vol-04-yoneda-classification.html:284:<p>The taxonomy declarations record vocabulary: the abstract components of the probe system and the group system are opaque identifiers, so those declarations index the definitions of the taxonomy rather than encode mathematics at the type level. The typed channel fragment and the Python experiments are the computational evidence proper. No claim of machine verification is made anywhere in this volume; a later mechanization could audit the executable models against kernel-checked specifications, which would be a cross-audit of models rather than a verification of the claims.</p>
website/content/papers/vol-04-yoneda-classification.html:293:<p><em>Evidence discipline.</em> The computational layer of <a href="#sec:computation" data-reference-type="ref+label" data-reference="sec:computation">7</a> evidences statements already proved in the paper or cited from the literature; it proves nothing on its own, and no claim of the paper is promoted by computation. The taxonomy declarations of <a href="#sec:computation" data-reference-type="ref+label" data-reference="sec:computation">7</a> are executable models of the definitions, not verified artifacts, and no claim of machine verification is made anywhere in this volume. Should a later mechanization check these models against kernel-checked specifications, the result would be a cross-audit of executable models, not a verification of the mathematical claims.</p>
website/content/papers/vol-04-yoneda-classification.html:316:<p>A Yoneda lemma for physics is a slogan until it is a theorem with hypotheses. What precise statement would earn the name? A candidate must specify the category of representations, the morphisms in force, the notion of determination, and the layer of physical structure it addresses; the slogan alone supports none of these. Theorem <a href="#thm:supermap" data-reference-type="ref" data-reference="thm:supermap">20</a> is the closest existing statement, and it is a theorem about processes in frameworks with duality, not about physics at large.</p>
website/content/papers/vol-02-structural-families.html:14:<p>Two equivalence relations run through the paper. Mathematical equivalence is isomorphism of the record in the ambient category of each component. Physical equivalence, written <span class="math inline">\(\simeq\)</span>, is a chosen equivalence relation on objects and is strictly coarser in general. Two mathematical descriptions may be physically equivalent without being mathematically isomorphic. Every classification statement below fixes which relation is in force.</p>
website/content/papers/vol-02-structural-families.html:144:<p>Recognition is therefore the weakest of the three tasks when the invariant is computable, and it is the one the atlas supplies in practice <a class="citation" href="#bib-atlas">[3]</a>. Parameterization is the strongest. The three are separate achievements, and a family row that reports one of them does not report the others.</p>
website/content/papers/vol-02-structural-families.html:243:<p><em>Remark 33</em> (Dichotomy as content).  A dichotomy theorem classifies the objects of a theory into two classes and classifies neither class internally. The row for this family in the chart below is complete at the level of the dichotomy and open at the level of the two sides.</p>
website/content/papers/vol-02-structural-families.html:347:<tr><td></td><td>Kraus rank is constant on a positive-dimensional family of channels</td><td></td><td>Constructs unitary channels on <span class="math inline">\(M_2\)</span> and reports rank one for each</td></tr>
website/content/papers/vol-02-structural-families.html:350:<tr><td>4</td><td>Family tags carry ontology identifiers</td><td></td><td>Reports the identifier of each family tag through the taxonomy accessor</td></tr>
website/content/papers/vol-08-spacetime-reconstruction.html:270:<p><em>Remark 34</em> (Open problem: entropy cone for six or more regions).  The enumeration gap that <a class="citation" href="#bib-baoetal">[6]</a> left at five regions has since been closed: the complete facet list for <span class="math inline">\(n = 5\)</span> is known <a class="citation" href="#bib-hernandezcuenca">[16]</a>. For fixed <span class="math inline">\(n \ge 6\)</span> the number of independent RT inequalities is finite, but the facet lists are open, and for general <span class="math inline">\(n\)</span> only one infinite family of inequalities is known <a class="citation" href="#bib-baoetal">[6]</a>. No verified resolution of the <span class="math inline">\(n \ge 6\)</span> gap was found in the sources reviewed (cutoff 2026-10-29).</p>
website/content/papers/vol-08-spacetime-reconstruction.html:334:<p><em>Remark 45</em> (What an upgrade would require).  To promote the entanglement-connectedness argument <a class="citation" href="#bib-vanraamsdonk">[13]</a> to a theorem of the kind <a href="#def:reconstruction" data-reference-type="ref+Label" data-reference="def:reconstruction">7</a> asks for, three things would be needed: a probe datum consisting only of entanglement data on a declared family of subsystems, a proof that the datum determines a spacetime up to a declared equivalence, and a demonstration that the construction does not smuggle in the geometry at the start. <a href="#thm:malament" data-reference-type="ref+Label" data-reference="thm:malament">36</a> shows the second item is achievable when the probe datum is a causal order and the equivalence is conformal. <a href="#cor:confactor" data-reference-type="ref+Label" data-reference="cor:confactor">37</a> shows that even then a conformal factor remains undetermined, so the third item requires either additional data or a theorem that the factor is physically irrelevant. None of the three items is established in the sources reviewed (cutoff 2026-10-29).</p>
website/content/papers/vol-08-spacetime-reconstruction.html:337:<p>Three experiments accompany the claims above. They are recorded as evidence, run from <code>src/vol-08-spacetime-reconstruction/</code>, and checked by the paper’s code evidence appendix. None of them proves anything: they test that the definitions behave as the proofs say on finite instances. The claims each experiment probes are listed in <a href="#tab:checks" class="reflink">7</a> and <a href="#tab:code" class="reflink">8</a>.</p>
website/content/papers/vol-08-spacetime-reconstruction.html:350:<caption><span class="tbl-num">Table 7.</span> Executable checks and the exact claims they probe. The verdict column records what the run shows; no entry is a proof.</caption>
website/content/papers/vol-08-spacetime-reconstruction.html:360:<p><a href="#tab:haskell" class="reflink">6</a> states which formal object each Haskell type stands for, and <a href="#tab:checks" class="reflink">7</a> states what each run demonstrates; every file is rerunnable and its output comparable with the propositions in the body.</p>
website/content/papers/vol-08-spacetime-reconstruction.html:386:<p>The finite-order experiment enumerates every partial order on at most four labeled points and takes a census of the ladder rungs. The loop check of <a href="#prop:finiteposet" data-reference-type="ref+Label" data-reference="prop:finiteposet">20</a> and the interval check are definitional on a finite ground set and are reported as such; the informative output is the distinguishing census: only 33 of the 242 enumerated orders are distinguishing, and the antichain of two points fails distinguishing while passing the interval check, as <a href="#prop:distinguish" data-reference-type="ref+Label" data-reference="prop:distinguish">21</a> states. The companion Alexandroff experiment rebuilds each order from its up-set topology and verifies <a href="#prop:specialization" data-reference-type="ref+Label" data-reference="prop:specialization">39</a>: the closure of each singleton is its down-set, so the topology recovers the order.</p>
website/content/papers/vol-08-spacetime-reconstruction.html:423:<p>Four open problems delimit the next stage. The complete RT facet lists for six and more boundary regions are unknown; five regions are settled <a class="citation" href="#bib-hernandezcuenca">[16]</a>, and for general <span class="math inline">\(n\)</span> only one infinite family of inequalities is known <a class="citation" href="#bib-baoetal">[6]</a>. The invariants of <a href="#tab:invariants" class="reflink">1</a> do not separate isometry classes (<a href="#cor:notclassifies" data-reference-type="ref+Label" data-reference="cor:notclassifies">12</a>), and which additional global invariants complete such a classification is open. The conformal factor left undetermined by <a href="#cor:confactor" data-reference-type="ref+Label" data-reference="cor:confactor">37</a> is either physically irrelevant or recoverable from additional probes, and the choice is not made by any theorem here. A determination theorem for spacetime from entanglement data would need the three items of <a href="#rem:upgrade" data-reference-type="ref+Label" data-reference="rem:upgrade">45</a>, and none is established in the sources reviewed (cutoff 2026-10-29). The classification of Lorentzian spacetimes up to isometry remains, as this paper has tried to make precise, exactly where its invariants stop.</p>
website/content/papers/vol-07-gauge-qft.html:117:<p><strong>Definition 20</strong> (BV-BRST gauge anomaly).  Let <span class="math inline">\(n\)</span> be the spacetime dimension. The BV-BRST gauge anomaly is the obstruction class in the local BRST cohomology <span class="math inline">\(H^{1,n}(s\mid d)\)</span>: the cohomology of the BRST differential <span class="math inline">\(s\)</span> on local functionals of the fields and ghosts, modulo total spacetime derivatives <span class="math inline">\(d\)</span>, at ghost number one and form degree <span class="math inline">\(n\)</span>. The class satisfies the WessZumino consistency condition <a class="citation" href="#bib-wess-zumino">[36]</a>, <a class="citation" href="#bib-bbh">[5]</a>. The ChevalleyEilenberg complex <span class="math inline">\(\mathrm{CE}(\mathfrak{g})\)</span> of the gauge algebra computes the zero-form part of the BRST double complex: <span class="math inline">\(H^1(\mathrm{CE}(\mathfrak{g}))\)</span> classifies the abelian quotients of <span class="math inline">\(\mathfrak{g}\)</span>, and <span class="math inline">\(H^2(\mathrm{CE}(\mathfrak{g}))\)</span> its central extensions.</p>
website/content/papers/vol-07-gauge-qft.html:123:<p><em>Proof.</em> If the determinant line of the family is nontrivial, the path integral measure is a section of a nontrivial line bundle rather than a measure, and gauge transformations multiply the partition function by a nontrivial phase; gauge invariance of the measure fails exactly then. The measure exists exactly when <span class="math inline">\(\lambda_{\mathrm{det}}\)</span> is trivializable. The BRST anomaly class is the obstruction to the nilpotency of the quantized BRST charge: the classical BRST differential satisfies <span class="math inline">\(s^2 = 0\)</span>, and the quantum deformation fails to be nilpotent exactly when the anomaly cocycle <span class="math inline">\([a]\)</span> is nonzero in <span class="math inline">\(H^{1,n}(s\mid d)\)</span>. The WessZumino consistency condition is the integrability condition for this class and holds by construction <a class="citation" href="#bib-bbh">[5]</a>. Both constructions are functorial in the gauge configuration, so the obstruction classes are natural and the vanishing test is a classification of the inconsistent directions. ◻</p>
website/content/papers/vol-07-gauge-qft.html:125:<p>The anomaly statement is the model of a complete obstruction classification: the classification content of the theory is the vanishing of the obstruction. No list of consistent theories is asserted; what is asserted is a necessary and sufficient condition for consistency. Anomaly cancellation conditions then become computable inputs to the classification of matter content: a matter representation contributes to the anomaly classes, and only the representations whose contributions cancel are admissible.</p>
website/content/papers/vol-07-gauge-qft.html:225:<p>A companion script computes the ChevalleyEilenberg cohomology of the two small gauge algebras of Example <a href="#ex:abelian-anomaly" data-reference-type="ref" data-reference="ex:abelian-anomaly">22</a> exactly over the rationals and reports the algebraic obstruction data. The non-abelian case displays the nonzero first class that records its nontrivial abelian quotient, and the semisimple case displays the vanishing consistent with the absence of abelian quotients. The field-theory anomaly of Definition <a href="#def:bvbrst-anomaly" data-reference-type="ref" data-reference="def:bvbrst-anomaly">20</a> lives in the local BRST cohomology and is not computed here.</p>
website/content/papers/vol-07-gauge-qft.html:237:<p>The constructive quantum field theory claims have a tracked event. The release of the withheld manuscript and the claimed formalization behind the October 2026 existence announcement would move that row of Table <a href="#tab:claims" class="reflink">3</a> from withheld to publicly checkable, and a committee verdict would move it further. Until the release, no result of this volume depends on it. The competing journal-published construction of a four-dimensional YangMills theory with a mass gap carries a second question: where its continuum limit is closed and where it is assumed. An audit of that construction is the sharpest available test of the mass-gap claim, and the audit has not been done.</p>
website/content/papers/vol-07-gauge-qft.html:260:<p class="bibitem" id="bib-bbh"><span class="bib-num">[5]</span> G. Barnich, F. Brandt, and M. Henneaux, <em>Local BRST cohomology in gauge theories</em>. Physics Reports 338 (2000) 439. arXiv:hep-th/0002245.</p>
website/content/papers/vol-07-gauge-qft.html:268:<p class="bibitem" id="bib-douglas"><span class="bib-num">[13]</span> M. R. Douglas, <em>The YangMills Millennium problem</em>. Nature Reviews Physics 8 (2026) 86. <a href="https://www.nature.com/articles/s42254-025-00909-2" class="uri">https://www.nature.com/articles/s42254-025-00909-2</a></p>
website/content/papers/vol-09-gravity-information-geometry.html:24:\]</span> Monotonicity says that processing cannot increase statistical distinguishability. The Fisher family of <a href="#def:fisher" data-reference-type="ref+label" data-reference="def:fisher">2</a>, one Fisher metric per simplex, is monotone by <a href="#prop:monotone" data-reference-type="ref+label" data-reference="prop:monotone">14</a>. The cross-dimensional quantifier is essential: on a fixed simplex alone, uniqueness of the monotone metric fails already at <span class="math inline">\(n = 2\)</span>, where the flat metric <span class="math inline">\(g_p(u,u) = u_1^2 + u_2^2\)</span> on <span class="math inline">\(\Delta_1^{\circ}\)</span> also satisfies the inequality, and stochastic maps between simplices of different sizes are what eliminate it.</p>
website/content/papers/vol-09-gravity-information-geometry.html:51:<p><strong>Definition 9</strong> (Ruppeiner metric).  Let <span class="math inline">\(S(U, V, N)\)</span> be the entropy of a thermodynamic system with internal energy <span class="math inline">\(U\)</span>, volume <span class="math inline">\(V\)</span>, and particle number <span class="math inline">\(N\)</span>. Physical entropy is homogeneous of degree one in its extensive variables, so the full Hessian in <span class="math inline">\((U, V, N)\)</span> is singular along the extensive direction by the Gibbs-Duhem relation, and strict concavity in all extensive variables cannot hold. The Ruppeiner metric is defined on a two-dimensional slice: fix <span class="math inline">\(N\)</span> (as this paper does) or pass to specific variables, and set <span class="math display">\[
website/content/papers/vol-09-gravity-information-geometry.html:53:\]</span> in the remaining extensive coordinates <span class="math inline">\(X^i\)</span>. Its scalar curvature <span class="math inline">\(R\)</span> is computed with the standard Ricci convention, in which the round two-sphere has <span class="math inline">\(R = +2\)</span>; the convention of Ruppeiner <a class="citation" href="#bib-ruppeiner">[23]</a> carries the opposite sign. The construction is that of Ruppeiner <a class="citation" href="#bib-ruppeiner">[23]</a>; the metric of Weinhold <a class="citation" href="#bib-weinhold">[28]</a> is the Hessian of internal energy and differs by a conformal factor in the standard thermodynamic setting.</p>
website/content/papers/vol-09-gravity-information-geometry.html:98:<p>Chentsov proved this theorem in the formulation: smooth metric families invariant under congruent embeddings (Markov morphisms) are unique up to constant; Petz and Sudár <a class="citation" href="#bib-petz-sudar">[22]</a> state the equivalent contraction form used here, monotone under general stochastic maps. The two formulations are connected as follows: a congruent embedding and its stochastic inverse force invariance under invertible stochastic maps (permutations included), and the contraction inequality for general stochastic maps is the monotonicity of <a href="#def:stochastic" data-reference-type="ref+label" data-reference="def:stochastic">3</a>. Smoothness of the metric tensor is assumed throughout, as in Chentsov’s statement. Two scope points are essential. The constant is undetermined and shared: monotonicity pins the metric only up to scale, and the cross-dimensional maps of <a href="#def:stochastic" data-reference-type="ref+label" data-reference="def:stochastic">3</a> are what force one constant across all <span class="math inline">\(n\)</span>. The classical uniqueness has an operational reading. Monotonicity says statistical distinguishability does not increase under processing; uniqueness says there is one ruler for that distinguishability. A classification program for statistical systems can therefore treat the Fisher metric as classifying data without a choice problem. <a href="#sec:quantum" data-reference-type="ref+Label" data-reference="sec:quantum">4</a> shows that this comfort does not survive quantization.</p>
website/content/papers/vol-09-gravity-information-geometry.html:224:<p><em>Remark 42</em> (Tensor-network models).  The holographic error-correcting codes of Pastawski, Yoshida, Harlow, and Preskill <a class="citation" href="#bib-happy">[19]</a> realize a discrete analogue of the Ryu-Takayanagi formula and of negative tripartite information inside exactly solvable tensor networks. These are toy models: they demonstrate that the information-theoretic mechanisms are internally consistent, and they carry no evidential weight about actual AdS/CFT.</p>
website/content/papers/vol-09-gravity-information-geometry.html:236:<p>The oldest working dictionary between information metrics and physical curvature is thermodynamic. Weinhold proposed the Hessian of internal energy as a metric on equilibrium states <a class="citation" href="#bib-weinhold">[28]</a>; Ruppeiner proposed the negative Hessian of entropy and read its curvature as a measure of microscopic interaction <a class="citation" href="#bib-ruppeiner">[23]</a>. The Ruppeiner metric of <a href="#def:ruppeiner" data-reference-type="ref+label" data-reference="def:ruppeiner">9</a> is, up to sign convention and a conformal factor, the Fisher metric of thermodynamic fluctuation theory, so the dictionary is an instance of information geometry in physical coordinates. The proposal that Einstein’s equations are an equation of state of this thermodynamic structure <a class="citation" href="#bib-jacobson">[14]</a> is the sharpest form of the gravity-thermodynamics link on record, and it is a derivation conditional on the horizon thermodynamics it assumes.</p>
website/content/papers/vol-09-gravity-information-geometry.html:249:\]</span> in the convention of <a href="#def:ruppeiner" data-reference-type="ref+label" data-reference="def:ruppeiner">9</a> (in Ruppeiner’s convention the sign is opposite). The numerator and denominator share no common factor in <span class="math inline">\((u, v)\)</span>, and <span class="math inline">\(R\)</span> vanishes only where the numerator does. Evaluations along the supercritical isochore <span class="math inline">\(v = 3\)</span> give <span class="math inline">\(R \approx 0.417\)</span> at <span class="math inline">\(u = 1\)</span>, <span class="math inline">\(R \approx 9.55\)</span> at <span class="math inline">\(u = 0.211\)</span>, and <span class="math inline">\(R \approx 179.4\)</span> at <span class="math inline">\(u = 0.131\)</span>, a growth of more than two orders of magnitude as the internal energy approaches the critical value <span class="math inline">\(u_c = 1/9 \approx 0.111\)</span>, where the denominator also vanishes. The pattern is consistent with Ruppeiner’s proposal that flatness marks noninteracting constituents and curvature marks interactions: it holds in the two models computed here, and beyond them it remains a proposed correspondence supported by examples.</p>
website/content/papers/vol-09-gravity-information-geometry.html:311:<p>The thermodynamic experiment verifies <a href="#prop:ideal-gas" data-reference-type="ref+label" data-reference="prop:ideal-gas">45</a> and the van der Waals computation. The symbolic Ricci scalar of the ideal gas metric <span class="math inline">\(\operatorname{diag}(c_v/u^2, 1/v^2)\)</span> at <span class="math inline">\(N = k = 1\)</span> is exactly zero, and the numeric evaluation agrees (the constants <span class="math inline">\(Nk\)</span> and <span class="math inline">\(c_v\)</span> do not affect the vanishing). The van der Waals Ricci scalar is a rational function of <span class="math inline">\((u, v)\)</span> whose sampled values are those recorded in <a href="#sec:thermo" data-reference-type="ref+label" data-reference="sec:thermo">9</a>: nonzero away from the critical point, growing from <span class="math inline">\(0.128\)</span> at <span class="math inline">\((2, 2)\)</span> to <span class="math inline">\(179.4\)</span> at <span class="math inline">\((0.131, 3)\)</span> near the critical internal energy <span class="math inline">\(u_c = 0.111\)</span>.</p>
website/content/papers/vol-09-gravity-information-geometry.html:352:<p class="bibitem" id="bib-braunstein-caves"><span class="bib-num">[2]</span> S. L. Braunstein and C. M. Caves, “Statistical distance and the geometry of quantum states,” <em>Physical Review Letters</em> 72 (1994) 3439. DOI: 10.1103/PhysRevLett.72.3439.</p>
website/content/papers/vol-09-gravity-information-geometry.html:355:<p class="bibitem" id="bib-dhw"><span class="bib-num">[5]</span> X. Dong, D. Harlow, and A. C. Wall, “Reconstruction of bulk operators within the entanglement wedge in gauge-gravity duality,” <em>Physical Review Letters</em> 117 (2016) 021601. arXiv:1601.05416.</p>
website/content/papers/vol-09-gravity-information-geometry.html:361:<p class="bibitem" id="bib-hc5"><span class="bib-num">[11]</span> S. Hernández-Cuenca, “Holographic entropy cone for five regions,” <em>Physical Review D</em> 100 (2019) 026004. DOI: 10.1103/PhysRevD.100.026004.</p>
website/content/papers/vol-09-gravity-information-geometry.html:364:<p class="bibitem" id="bib-jacobson"><span class="bib-num">[14]</span> T. Jacobson, “Thermodynamics of spacetime: the Einstein equation of state,” <em>Physical Review Letters</em> 75 (1995) 1260. DOI: 10.1103/PhysRevLett.75.1260.</p>
website/content/papers/vol-09-gravity-information-geometry.html:365:<p class="bibitem" id="bib-jac2016"><span class="bib-num">[15]</span> T. Jacobson, “Entanglement equilibrium and the Einstein equation,” <em>Physical Review Letters</em> 116 (2016) 201101. DOI: 10.1103/PhysRevLett.116.201101.</p>
website/content/papers/vol-09-gravity-information-geometry.html:373:<p class="bibitem" id="bib-ruppeiner"><span class="bib-num">[23]</span> G. Ruppeiner, “Thermodynamics: a Riemannian geometric model,” <em>Physical Review A</em> 20 (1979) 1608. DOI: 10.1103/PhysRevA.20.1608.</p>
website/content/papers/vol-09-gravity-information-geometry.html:374:<p class="bibitem" id="bib-rt"><span class="bib-num">[24]</span> S. Ryu and T. Takayanagi, “Holographic derivation of entanglement entropy from AdS/CFT,” <em>Physical Review Letters</em> 96 (2006) 181602. arXiv:hep-th/0603001.</p>
website/content/papers/vol-09-gravity-information-geometry.html:376:<p class="bibitem" id="bib-uhlmann"><span class="bib-num">[26]</span> A. Uhlmann, “The transition probability in the state space of a <span class="math inline">\(*\)</span>-algebra,” <em>Reports on Mathematical Physics</em> 9 (1976) 273. DOI: 10.1016/0034-4877(76)90060-4.</p>

exec
/usr/local/bin/zsh -lc 'cat website/lib/macros.ts
cat website/next.config.mjs
head -60 website/content/manifest.json
head -65 website/content/periodic-table.md
head -35 website/content/periodic-table-sources.md
 test -d website/node_modules && echo dependencies-present' in /Users/mlong/Documents/Development/classification-physical-systems
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
/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export',
  images: { unoptimized: true },
  trailingSlash: true,
};

export default nextConfig;
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
# The Periodic Table of Mathematical Physics

**Program:** CMRPS, a 12-volume series by the YonedaAI Collaboration (PI Matthew Long).
**Status date:** 2026-10-29.
**Nature of this chart.** A research framework for classification, not a completed classification. Completeness is a theorem to investigate (Founding Document 02); the central conjecture it serves is registered as T-CMRPS-01 and remains a **conjecture**.

**Status legend (used in every cell of every Status column).**

| Token | Meaning |
|---|---|
| **PROVEN** | A classification theorem with a completeness statement exists in the stated scope. |
| **CLAIMED** | An announced result whose supporting artifacts are not publicly checkable. |
| **OPEN** | No complete result; partial or parametric results noted in the row. |
| **IMPOSSIBLE** | A theorem proves that no classification of the stated kind can exist. |

Citation convention: bracketed citations link to the Sources section below. Inferences are marked *conjectural* or *open*.

---

## (a) Fundamental structural families and their defining invariants

Families I–X are the candidate organizing families of the founding document §4 (DEF-026–035). They are candidates, not a completed classification.

| Family | Structure | Representative systems | Defining invariants | Status | Sources |
|---|---|---|---|---|---|
| **I** | Symplectic and Poisson structures | Classical mechanics | Symplectic form ω; **locally: none** (Darboux normal form); globally: topology of ω. Poisson: Weinstein splitting (symplectic × transverse), symplectic-leaf foliation, coadjoint orbits for KKS | **PROVEN** local; global classification topological | [6][7] |
| **II** | Hilbert spaces and operator algebras | Quantum mechanics | Dimension vector (finite-dim C*: A ≅ ⊕ M_{n_i}(C)); Murray–von Neumann type + Connes invariants (amenable factors); Kraus rank (channels) | **PROVEN** islands; general factors **IMPOSSIBLE** [8]; fusion cats **OPEN** [14] | [8][9][10][11][14] |
| **III** | Smooth manifolds and geometric structures | Relativity | Holonomy group (Lorentzian, Berger-list analogue); causal class (complete causal ladder); Thurston geometry type (3-manifolds) | **PROVEN** in stated regimes; dim-4 unrecognizable instances **IMPOSSIBLE** | [50][51][54][60] |
| **IV** | Principal bundles and connections | Gauge theories | [X, BG]; characteristic classes in H*(BG) (SW, Pontryagin, Euler, Chern, DD); anomaly classes H¹⊕H²(CE(P)) | **PROVEN** (bundles; anomalies as obstructions) | [17][18][19] |
| **V** | Probability and measure-theoretic structures | Statistical physics | Fisher metric, unique up to constant (Chentsov, classical) | **PROVEN** unique classical; quantum parametric (Petz–Sudar) | [52] |
| **VI** | Topological and higher-categorical structures | TQFTs | Fully dualizable objects (cobordism hypothesis); Atiyah axioms | **CLAIMED** for extended TQFTs (Lurie proof sketch) [35]; functorial TQFT **PROVEN** tractable [36] | [34][35][36] |
| **VII** | Dynamical systems and operator semigroups | Dissipative and open systems | Generator data; Stinespring minimal dilation of CP maps | **OPEN** as a classification; normal form only | [10][11] |
| **VIII** | Tensor categories and compositional structures | Quantum information | Symmetric structure (load-bearing); conjugates, subobjects, End(1)=C (DR hypotheses); pivotal structure (fusion cats) | **PROVEN** islands (DR, Deligne); fusion cats **OPEN** | [12][13][14][16] |
| **IX** | Discrete combinatorial structures | Lattice and network models | Lattice data; tame/wild class | **PROVEN** regime-restricted theorems [30][31][32]; wild sectors **IMPOSSIBLE** to classify | [30][31][32][55][56][57][58] |
| **X** | Derived and homotopical structures | Higher gauge and derived field theories | Derived-tame vs derived-wild dichotomy | **OPEN** beyond the dichotomy | [55] |

**Cross-family correspondences.** Classical–quantum connection via deformation quantization is *conjectural* (Founding Document §4). Gelfand/Stone/DR/Deligne links are proved — see region (c). The 2024–2026 supermap-representability line [40][41] and its possible unification with Gelfand/Stone/Naimark is *open*.

---

## (b) Exceptional structures

The CFSG template suggests families + sporadics. The founding document warns: one should not assume that physical theories possess a finite collection of exceptional objects analogous to the 26 sporadic groups (Founding Document 03). The entries below are the proven exceptional mathematics the table must accommodate.

| Exceptional object | Region | Defining data | Status | Sources |
|---|---|---|---|---|
| 26 sporadic finite simple groups (27 counting Tits) | Family II/group theory | Order, Schur multiplier, Out(G), presentations, character tables with power maps (ATLAS companions) | **PROVEN** to exist and be exhaustive (CFSG); no uniform parameterization known | [1][2][3] |
| Exceptional Lie algebras G2, F4, E6, E7, E8 | Family I–II boundary (symmetry) | Dynkin diagrams outside A–D series; Satake diagrams for their real forms | **PROVEN** (Killing–Cartan complete) | [4] |
| Real forms and compact/split forms | Family III (symmetry layer) | Order-≤2 automorphism classes; split and compact forms always exist | **PROVEN** | [4] |
| Amenable type III₀ and III₁ factors | Family II | III₀ = ergodic flows; III₁ completed by Haagerup; III_λ (0<λ≤1) continuous parameter | **PROVEN** within the amenable class | [8] |
| Hyperfinite (AFD) II₁ factor | Family II | Unique amenable II₁ factor | **PROVEN**; contrast: uncountably many non-amenable separable II₁ factors | [8] |
| Thurston's 8 model geometries | Family III | S³, E³, H³, S²×R, H²×R, Nil, Sol, SL₂(R)~ | **PROVEN** (geometrization) | [60] |
| Filipkiewicz's dim-4 model geometries | Family III | 18 + one countably infinite family | **PROVEN** to exist; only restricted 4-manifold classes decompose | [60] |
| Isocategorical group pairs (Etingof–Gelaki) | Family VIII | Non-isomorphic groups with equivalent plain tensor representation categories | **PROVEN** to exist — the symmetric layer is not recoverable without them | [12] |
| Extra Z₂ factor in higher-form DHR (Casini–Magan) | Families IV, VIII | Sector not realizable by Lagrangian gauge models | **OPEN** [single source] | [20] |

---

## (c) Proven reconstruction relationships

Objects determined by probes — the pattern CFSG-class classification rarely achieves but reconstruction theorems routinely do.

| Reconstruction theorem | Recovers | From | Scope limits | Status | Sources |
|---|---|---|---|---|---|
| Gelfand–Naimark | A concrete representation of a C*-algebra in B(H) | Abstract C*-algebra | Representation theorem, **not** a classification; only the commutative case is fully classified | **PROVEN** | [9][42] |
[1] Classification of finite simple groups — https://en.wikipedia.org/wiki/Classification_of_finite_simple_groups (accessed 2026-10-29)
[2] Solomon, "A brief history of the classification of the finite simple groups", Bull. AMS 38 (2001) 315–352 — https://www.ams.org/journals/bull/2001-38-03/S0273-0979-01-00909-0/ (published 2001-03-27, accessed 2026-10-29)
[3] ATLAS of Finite Groups — https://en.wikipedia.org/wiki/ATLAS_of_Finite_Groups (accessed 2026-10-29)
[4] Simple Lie group — https://en.wikipedia.org/wiki/Simple_Lie_group (accessed 2026-10-29)
[5] Theorem of the highest weight — https://en.wikipedia.org/wiki/Theorem_of_the_highest_weight (accessed 2026-10-29)
[6] Darboux's theorem — https://en.wikipedia.org/wiki/Darboux%27s_theorem (accessed 2026-10-29)
[7] Poisson manifold (WikiJournal of Science 7(1):6, 2024) — https://en.wikipedia.org/wiki/Poisson_manifold (accessed 2026-10-29)
[8] Von Neumann algebra — https://en.wikipedia.org/wiki/Von_Neumann_algebra (accessed 2026-10-29)
[9] C*-algebra — https://en.wikipedia.org/wiki/C*-algebra (accessed 2026-10-29)
[10] Stinespring dilation theorem — https://en.wikipedia.org/wiki/Stinespring_dilation_theorem (accessed 2026-10-29)
[11] Quantum channel — https://en.wikipedia.org/wiki/Quantum_channel (accessed 2026-10-29)
[12] Doplicher–Roberts reconstruction theorem (nLab) — https://ncatlab.org/nlab/show/Doplicher-Roberts+reconstruction+theorem (accessed 2026-10-29)
[13] Deligne's theorem on tensor categories (nLab) — https://ncatlab.org/nlab/show/Deligne%27s+theorem+on+tensor_categories (accessed 2026-10-29)
[14] Fusion category (nLab) — https://ncatlab.org/nlab/show/fusion+category (accessed 2026-10-29)
[15] Haag–Kastler axioms (nLab) — https://ncatlab.org/nlab/show/Haag-Kastler+axioms (accessed 2026-10-29)
[16] DHR superselection theory (nLab) — https://ncatlab.org/nlab/show/DHR+superselection+theory (accessed 2026-10-29)
[17] Classifying space (nLab) — https://ncatlab.org/nlab/show/classifying+space (accessed 2026-10-29)
[18] Characteristic class (nLab) — https://ncatlab.org/nlab/show/characteristic+class (accessed 2026-10-29)
[19] Quantum anomaly (nLab) — https://ncatlab.org/nlab/show/quantum+anomaly (accessed 2026-10-29)
[20] Casini–Magan, arXiv:2511.21810 — https://arxiv.org/abs/2511.21810 (published 2025-11-26, accessed 2026-10-29)
[21] Müger, arXiv:math-ph/0008027 — http://export.arxiv.org/api/query?search_query=all:%22Doplicher-Roberts%22&start=0&max_results=15 (entry arXiv:math-ph/0008027; published 2000-08-21, accessed 2026-10-29)
[22] Pinzari, arXiv:2502.06229 — https://arxiv.org/abs/2502.06229 (v8 2026-09-19, accessed 2026-10-29)
[23] Clay Mathematics Institute, Yang–Mills problem page — https://www.claymath.org/millennium/yang-mills-the-maths-gap/ (accessed 2026-10-29)
[24] OpenAI, "Building scientific understanding with academic communities" — https://openai.com/index/building-scientific-understanding-with-academic-communities/ (published 2026-10-26, accessed 2026-10-29)
[25] KITP Yang–Mills working group statement — https://www.kitp.ucsb.edu/sites/default/files/YM_working_group.pdf (published 2026-10, accessed 2026-10-29)
[26] Scientific American, "Dueling proofs from OpenAI and Anthropic astound scientists" — https://www.scientificamerican.com/article/dueling-proofs-from-openai-and-anthropic-astound-scientists/ (published 2026-10-27, accessed 2026-10-29)
[27] Douglas, Nat. Rev. Phys. 8, 86–97 — https://www.nature.com/articles/s42254-025-00909-2 (published 2026-01-12, accessed 2026-10-29)
[28] Faizal–Shabir, arXiv:2606.19362 — https://arxiv.org/abs/2606.19362 (published 2026-06-09, accessed 2026-10-29)
[29] Jacobsen, arXiv:2506.00284 (withdrawn) — https://arxiv.org/abs/2506.00284 (published 2025-05-30, accessed 2026-10-29)
[30] Nissim, arXiv:2510.22788 — https://arxiv.org/abs/2510.22788 (published 2025-10-26, accessed 2026-10-29)
[31] Cao–Nissim–Sheffield, arXiv:2509.04688 — https://arxiv.org/abs/2509.04688 (published 2025-09-04, accessed 2026-10-29)
[32] Faria da Veiga–O'Carroll, arXiv:2509.03513 — https://arxiv.org/abs/2509.03513 (published 2025-09-03, accessed 2026-10-29)
[33] Nair, arXiv:2608.10133 — https://arxiv.org/abs/2608.10133 (published 2026-08-10, accessed 2026-10-29)
[34] Baez–Dolan, arXiv:q-alg/9503002 — https://arxiv.org/abs/q-alg/9503002 (published 1995-03-05, accessed 2026-10-29)
[35] Lurie, arXiv:0905.0465 — https://arxiv.org/abs/0905.0465 (published 2009-05-04, accessed 2026-10-29)
dependencies-present

exec
/usr/local/bin/zsh -lc "nl -ba website/content/papers/synthesis.html | sed -n '240,275p'
nl -ba website/app/globals.css | sed -n '410,470p'
nl -ba website/lib/macros.ts | sed -n '1,100p'
rg -n -i 'reviewer|review round|cross-volume consistency report|revision|editorial|audit|acceptance|phase [a-d]|phase[-_][a-d]|pipeline|todo|fixme' website/content --max-columns 450 --max-columns-preview" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   240	<h3 id="contrasts-the-series-maintains">Contrasts the series maintains</h3>
   241	<p>Several pairs of results pull against each other, and the series keeps each pair apart rather than resolving it prematurely.</p>
   242	<p>Classification and reconstruction are different achievements. Classification is sharp where the invariant is finite or parametric, and reconstruction routinely recovers an object from probes <a class="citation" href="#bib-corpus-42">[7]</a>, <a class="citation" href="#bib-corpus-43">[8]</a>, <a class="citation" href="#bib-corpus-44">[9]</a>, <a class="citation" href="#bib-corpus-12">[10]</a>, <a class="citation" href="#bib-corpus-13">[12]</a>. The parts that study the two do not merge them.</p>
   243	<p>Local and global classification content differ by subject. Darboux normal form empties the local symplectic invariant theory <a class="citation" href="#bib-corpus-6">[19]</a>, and Riemannian curvature supplies rich local data. Symplectic classification is therefore global, and the series states the difference as a property of the subject.</p>
   244	<p>Classical uniqueness and quantum parameterization do not match. The Fisher metric is unique up to constant in the classical case <a class="citation" href="#bib-corpus-52">[32]</a>, and the quantum monotone metrics form a family indexed by operator monotone functions. No part of the series extends the classical uniqueness across that gap.</p>
   245	<p>Relational determination and physical equivalence do not coincide. The Yoneda embedding determines an object by its relationships, and the qualification attached to every use of it records that physical equivalence, empirical adequacy, and classification do not follow from that determination alone.</p>
   246	<p>Announcement and evidence are different things. The constructive quantum field theory frontier carries several announced results <a class="citation" href="#bib-corpus-24">[44]</a>, <a class="citation" href="#bib-corpus-25">[45]</a>, and the series records each at the strength of its publicly checkable evidence, keeping existence and the mass gap separate <a class="citation" href="#bib-corpus-23">[46]</a>.</p>
   247	<p>Mathematical consistency and empirical selection are different layers. A consistency proof settles the first and leaves the second open, because the empirical layer applies an observation map that mathematical classification does not compute.</p>
   248	<h2 id="cross-volume-consistency">Cross-volume consistency</h2>
   249	<p>The twelve parts maintain uniform definition identifiers, respect the directed dependency discipline, and enforce the preserved-layer constraint throughout. Eight consistency checks hold across the corpus, seven without qualification and one after a scope correction.</p>
   250	<dl>
   251	<dt>Ontology identity.</dt>
   252	<dd>
   253	<p>The forty-two definition identifiers are used with one meaning across all twelve parts, and later parts extend the list only by appending new identifiers.</p>
   254	</dd>
   255	<dt>Definitional root.</dt>
   256	<dd>
   257	<p>Every part works in the ontology of Part I, and no part redefines an object that Part I owns.</p>
   258	</dd>
   259	<dt>Dependency discipline.</dt>
   260	<dd>
   261	<p>Every cross-part use of a registered result is a permitted edge of <a href="#fig:deps" data-reference-type="ref+label" data-reference="fig:deps">1</a>, and unproven statements enter only as declared hypotheses or as objects of study.</p>
   262	</dd>
   263	<dt>Yoneda qualification.</dt>
   264	<dd>
   265	<p>The constraint on Yoneda-based arguments appears in the same wording in every part that uses Yoneda methods.</p>
   266	</dd>
   267	<dt>Preserved-layer requirement.</dt>
   268	<dd>
   269	<p>Every equivalence and duality recorded across the series names the structure it preserves or records the failure of recovery.</p>
   270	</dd>
   271	<dt>Notation.</dt>
   272	<dd>
   273	<p>The five-component tuple, the invariant record, and the closure notation are used in one form throughout.</p>
   274	</dd>
   275	<dt>Existence and mass gap.</dt>
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
website/content/manifest.json:165:    "abstractFull": "This paper states the structural picture formed by the twelve parts of the Classification of Mathematical Representations of Physical Systems, a program asking whether mathematical representations of physical systems admit a structural classification analogous to the Classification of Finite Simple Groups. One ontology of forty-two definitions, one dependency graph, and one equivalence discipline run through the series. Three [... omitted end of long line]
website/content/papers/vol-12-principia-physica.html:480:<p>Four limitations bound this synthesis. The assembly inherits the statuses of the program registry, and any status revision propagates. Three entries rest on single sources and were not independently re-verified here: the extra <span class="math inline">\(Z_2\)</span> sector of higher-form DHR theory <a class="citation" href="#bib-corpus-20">[20]</a>, the journal-published mass-gap claim <a class="citation" href="#bib-corpus-28">[28]</a>, and t [... omitted end of long line]
website/content/papers/vol-12-principia-physica.html:487:<p>The computational artifacts of this volume record the bookkeeping claims of the assembly and the finite-dimensional example of <a href="#sec:examples" data-reference-type="ref+label" data-reference="sec:examples">9</a>. The two files perform automated registry auditing and bookkeeping and exercise the worked example; they verify no mathematics. Both files accompany this paper in the CMRPS project repository at <a href="https://github.com/Yoned [... omitted end of long line]
website/content/papers/vol-12-principia-physica.html:501:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-12-principia-physica.html:506:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-12-principia-physica.html:511:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-12-principia-physica.html:516:<td style="text-align: left;"><code>phase_d_registry_audit.py</code></td>
website/content/papers/vol-07-gauge-qft.html:237:<p>The constructive quantum field theory claims have a tracked event. The release of the withheld manuscript and the claimed formalization behind the October 2026 existence announcement would move that row of Table <a href="#tab:claims" class="reflink">3</a> from withheld to publicly checkable, and a committee verdict would move it further. Until the release, no result of this volume depends on it. The competing journal-published construction of  [... omitted end of long line]
website/content/papers/vol-04-yoneda-classification.html:284:<p>The taxonomy declarations record vocabulary: the abstract components of the probe system and the group system are opaque identifiers, so those declarations index the definitions of the taxonomy rather than encode mathematics at the type level. The typed channel fragment and the Python experiments are the computational evidence proper. No claim of machine verification is made anywhere in this volume; a later mechanization could audit the execut [... omitted end of long line]
website/content/papers/vol-04-yoneda-classification.html:293:<p><em>Evidence discipline.</em> The computational layer of <a href="#sec:computation" data-reference-type="ref+label" data-reference="sec:computation">7</a> evidences statements already proved in the paper or cited from the literature; it proves nothing on its own, and no claim of the paper is promoted by computation. The taxonomy declarations of <a href="#sec:computation" data-reference-type="ref+label" data-reference="sec:computation">7</a> ar [... omitted end of long line]
website/content/papers/vol-03-irreducibility-decomposition.html:307:<p>The first artifact is an executable taxonomy layer in Haskell. Its module declares instances of the shared family, construction, and decomposition classes for the systems treated here: matrix blocks and their direct sums, tensor products of blocks, and Kraus normal form data. Multiplicity matrices appear as data types mirroring <a href="#def:multiplicity-matrix" data-reference-type="ref+label" data-reference="def:multiplicity-matrix">19</a>. T [... omitted end of long line]
website/content/papers/vol-01-foundations.html:190:<p>Each condition excludes a concrete pathology, and the list can be tested record by record. A tuple with a component named but not defined fails AC-1. An observable collection such as the two point masses on a two-point state space fails AC-2. A Hamiltonian vector field defined only on an open subset of the state space fails AC-3. A symmetry action that moves an observable outside the observable collection fails AC-4. A composition rule that pr [... omitted end of long line]
website/content/papers/vol-01-foundations.html:323:<p>A revision of the framework has a clear path. The preservation laws need completion in three directions: the inter-kind composition rule of Corollary <a href="#cor:schema-not-category" data-reference-type="ref" data-reference="cor:schema-not-category">13</a>, the algebraic form of the laws for quantum and gauge records, and the status of dualities as equivalences between record presentations. The admissibility list needs testing against record [... omitted end of long line]

codex
The homepage now declares `og:type` and `og:url`, and the periodic-table citation line points to Sources. The synthesis HTML abstract is also updated, though the old report reference remains in `manifest.json`’s `abstractFull` field. I’ll check whether that field is displayed and continue checking math and link targets.
exec
/usr/local/bin/zsh -lc "node -e 'const fs=require(\"fs\"),ts=require(\"./website/node_modules/typescript\"),katex=require(\"./website/node_modules/katex\"); function load(file,req){let m={exports:{}};new Function(\"require\",\"module\",\"exports\",ts.transpileModule(fs.readFileSync(file,\"utf8\"),{compilerOptions:{module:ts.ModuleKind.CommonJS}}).outputText)(req,m,m.exports);return m.exports;} const macros=load(\"website/lib/macros.ts\",require).BASE_MACROS; const render=load(\"website/lib/render-math.ts\",n=>n===\"katex\"?katex:n===\"./macros\"?{getMacros:()=>({...macros})}:require(n)).renderMath;let totals={formulas:0,errors:0,rawRuns:0,deadAnchors:0};for(const file of fs.readdirSync(\"website/content/papers\")){const src=fs.readFileSync(\"website/content/papers/\"+file,\"utf8\"),html=render(src),errors=[...html.matchAll(/class=\"katex-error\"["'^>]*title="([''^"]*)"/g)].map(m=>m[1]);totals.formulas+=(html.match(/class="katex"/g)||[]).length;totals.errors+=errors.length;const ids=new Set([...src.matchAll(/'"\\bid=\"(["'^"]+)"/g)].map(m=>m[1]));const dead=[...src.matchAll(/href="#([''^"]+)"/g)].filter(m=>!ids.has(m[1]));totals.deadAnchors+=dead.length;const visible=html.replace(/<annotation['"\\s\\S]*?<\\/annotation>/g,\"\").replace(/<["'^>]*>/g,"");const raw=[...visible.matchAll(/'"\\\\(?:[a-zA-Z]+|[()[\\]])/g)];totals.rawRuns+=raw.length;console.log(JSON.stringify({file,errors:errors.slice(0,5),dead:dead.slice(0,12).map(m=>({target:m[1],line:src.slice(0,m.index).split(\"\\n\").length})),raw:raw.slice(0,5).map(m=>visible.slice(Math.max(0,m.index-35),m.index+65))}));}console.log(totals);'" in /Users/mlong/Documents/Development/classification-physical-systems
 exited 1 in 19ms:
<anonymous_script>:20
    return katex_1.default.renderToString(unescapeHtml(tex).trim(), {
                           ^

TypeError: Cannot read properties of undefined (reading 'renderToString')
    at renderOne (eval at load ([eval]:1:162), <anonymous>:20:28)
    at renderTextRun (eval at load ([eval]:1:162), <anonymous>:88:28)
    at eval (eval at load ([eval]:1:162), <anonymous>:110:54)
    at Array.map (<anonymous>)
    at renderMath (eval at load ([eval]:1:162), <anonymous>:110:10)
    at [eval]:1:738
    at runScriptInThisContext (node:internal/vm:219:10)
    at node:internal/process/execution:451:12
    at [eval]-wrapper:6:24
    at runScriptInContext (node:internal/process/execution:449:60)

Node.js v24.22.0

exec
/usr/local/bin/zsh -lc "node -e 'const fs=require(\"fs\"),ts=require(\"./website/node_modules/typescript\"),katex=require(\"./website/node_modules/katex\"); function load(file,req){let m={exports:{}};new Function(\"require\",\"module\",\"exports\",ts.transpileModule(fs.readFileSync(file,\"utf8\"),{compilerOptions:{module:ts.ModuleKind.CommonJS,esModuleInterop:true}}).outputText)(req,m,m.exports);return m.exports;} const macros=load(\"website/lib/macros.ts\",require).BASE_MACROS; const render=load(\"website/lib/render-math.ts\",n=>n===\"katex\"?katex:n===\"./macros\"?{getMacros:()=>({...macros})}:require(n)).renderMath;let totals={formulas:0,errors:0,rawRuns:0,deadAnchors:0};for(const file of fs.readdirSync(\"website/content/papers\")){const src=fs.readFileSync(\"website/content/papers/\"+file,\"utf8\"),html=render(src),errors=[...html.matchAll(/class=\"katex-error\"["'^>]*title="([''^"]*)"/g)].map(m=>m[1]);totals.formulas+=(html.match(/class="katex"/g)||[]).length;totals.errors+=errors.length;const ids=new Set([...src.matchAll(/'"\\bid=\"(["'^"]+)"/g)].map(m=>m[1]));const dead=[...src.matchAll(/href="#([''^"]+)"/g)].filter(m=>!ids.has(m[1]));totals.deadAnchors+=dead.length;const visible=html.replace(/<annotation['"\\s\\S]*?<\\/annotation>/g,\"\").replace(/<["'^>]*>/g,"");const raw=[...visible.matchAll(/'"\\\\(?:[a-zA-Z]+|[()[\\]])/g)];totals.rawRuns+=raw.length;console.log(JSON.stringify({file,errors:errors.slice(0,5),dead:dead.slice(0,12).map(m=>({target:m[1],line:src.slice(0,m.index).split(\"\\n\").length})),raw:raw.slice(0,5).map(m=>visible.slice(Math.max(0,m.index-35),m.index+65))}));}console.log(totals);'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 347ms:
{"file":"synthesis.html","errors":[],"dead":[],"raw":[]}
{"file":"vol-01-foundations.html","errors":[],"dead":[],"raw":[]}
{"file":"vol-02-structural-families.html","errors":[],"dead":[],"raw":[]}
{"file":"vol-03-irreducibility-decomposition.html","errors":[],"dead":[],"raw":[]}
{"file":"vol-04-yoneda-classification.html","errors":[],"dead":[],"raw":[]}
{"file":"vol-05-classical-systems.html","errors":[],"dead":[],"raw":[]}
{"file":"vol-06-quantum-systems.html","errors":[],"dead":[],"raw":[]}
{"file":"vol-07-gauge-qft.html","errors":[],"dead":[],"raw":[]}
{"file":"vol-08-spacetime-reconstruction.html","errors":[],"dead":[],"raw":[]}
{"file":"vol-09-gravity-information-geometry.html","errors":[],"dead":[],"raw":[]}
{"file":"vol-10-observational-equivalence.html","errors":[],"dead":[],"raw":[]}
{"file":"vol-11-completeness-obstructions.html","errors":[],"dead":[],"raw":[]}
{"file":"vol-12-principia-physica.html","errors":[],"dead":[],"raw":[]}
{ formulas: 4685, errors: 0, rawRuns: 0, deadAnchors: 0 }

exec
/usr/local/bin/zsh -lc "node -e 'const fs=require(\"fs\");const manifest=JSON.parse(fs.readFileSync(\"website/content/manifest.json\",\"utf8\"));for(const p of manifest)for(const f of [\"content/papers/\"+p.slug+\".html\",\"public/pdf/\"+p.slug+\".pdf\",\"public/og/\"+p.slug+\".png\"])if("'!fs.existsSync("website/"+f))console.log("MISSING",f);const files=fs.readdirSync("website/content/papers").map(x=>"website/content/papers/"+x);let urls=new Map();for(const file of files){const src=fs.readFileSync(file,"utf8");for(const m of src.matchAll(/href="([''^"]+)"/g)){const u=m[1];if(!u.startsWith("#")&&!u.startsWith("http"))console.log("OTHER LINK",file,src.slice(0,m.index).split("'"\\n\").length,u);if(u.startsWith(\"http\"))urls.set(u,(urls.get(u)||0)+1);}}console.log(\"Distinct external links\",urls.size);console.log([...urls.keys()].filter(u=>u.includes(\"github\")));'
rg -n '\\\\|\\]\\(' website/content/periodic-table.md --max-columns 600 --max-columns-preview
nl -ba website/content/papers/synthesis.html | sed -n '275,295p'
rg -n 'nowrap|min-width|width:|overflow' website/app/globals.css" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
Distinct external links 97
[ 'https://github.com/YonedaAI/cmrps' ]
   275	<dt>Existence and mass gap.</dt>
   276	<dd>
   277	<p>The announced four-dimensional existence result and the mass gap problem are recorded as separate items in every part that mentions them.</p>
   278	</dd>
   279	<dt>Entropy cone range.</dt>
   280	<dd>
   281	<p>The holographic entropy cone is completely characterized for five boundary regions and fewer <a class="citation" href="#bib-corpus-47">[31]</a>, <a class="citation" href="#bib-corpus-73">[38]</a>, and the open range begins at six regions. This entry is the correction.</p>
   282	</dd>
   283	</dl>
   284	<p>Four of these findings are load-bearing for the series as a whole. The definitional root is what makes the twelve parts one program rather than twelve adjacent papers: a definition introduced in Part I has one meaning everywhere. The dependency discipline is what makes the composition honest: a part that needs an unproven statement declares it as a hypothesis instead of using it as a lemma. The preserved-layer requirement is what makes the equivalence content of the series correct rather than merely plausible: the counterexample of Etingof and Gelaki <a class="citation" href="#bib-corpus-74">[27]</a> rules out the weaker discipline by theorem. The separation of existence from mass gap is what keeps the constructive quantum field theory material accurate <a class="citation" href="#bib-corpus-23">[46]</a>, <a class="citation" href="#bib-corpus-24">[44]</a>, <a class="citation" href="#bib-corpus-25">[45]</a>.</p>
   285	<p>The corrected entry concerns the holographic entropy cone. The cone for five boundary regions is completely characterized: the cone defined by all proven inequalities admits graph models for every extreme ray orbit, which settles the existence of further five-party inequalities in the negative <a class="citation" href="#bib-corpus-73">[38]</a>. The statement that the cone is open from five regions onward has been replaced by the correct range, which begins at six regions <a class="citation" href="#bib-corpus-47">[31]</a>, and the periodic table of <a href="#tab:periodic" class="reflink">5</a> records the corrected range.</p>
   286	<h2 id="conclusion">Conclusion</h2>
   287	<p>The structural picture of the series is a classification program with a stated scope. One ontology of forty-two definitions organizes the objects, morphisms, equivalences, families, and invariants. One dependency graph composes the twelve parts. One equivalence requirement forces every identification to name the structure it preserves. Around the central conjecture, the mathematical content sorts into regimes with complete invariants, regimes with parameterized or normal-form answers, and regimes where obstruction theorems prove that no classification of the stated kind exists.</p>
   288	<p>The regime structure is the durable finding. Complete invariants appear where the invariant is finite or explicitly parameterized. Reconstruction from probes is better developed than classification and carries hypotheses that cannot be dropped. Obstruction theorems mark a sharp scope boundary: dimension three admits a finite table of geometries and dimension four contains unrecognizable manifolds, the amenable factors are classified and the general type <span class="math inline">\(\mathrm{II}_1\)</span> factors are not, the symmetric tensor categories of subexponential growth are classified and the plain tensor categories do not determine their groups.</p>
   289	<p>The central conjecture states the program’s theorem target and carries the five obligations that would discharge it. Restricted forms of the decomposition obligation are established in the sectors where complete invariants exist. The remaining obligations are the research program.</p>
   290	<h2 id="references">References</h2>
   291	<div class="thebibliography">
   292	<p class="bibitem" id="bib-corpus-9"><span class="bib-num">[1]</span> <span>54</span> G. J. Murphy, <span class="math inline">\(C^*\)</span>-algebras and operator theory, Academic Press (1990). ISBN 978-0-12-511360-1.</p>
   293	<p class="bibitem" id="bib-corpus-4"><span class="bib-num">[2]</span> J. E. Humphreys, Introduction to Lie algebras and representation theory, Springer (1972). ISBN 3-540-90052-7.</p>
   294	<p class="bibitem" id="bib-corpus-17"><span class="bib-num">[3]</span> D. Husemoller, Fibre bundles, Springer (1966). ISBN 0-387-90103-5.</p>
   295	<p class="bibitem" id="bib-corpus-18"><span class="bib-num">[4]</span> J. Milnor and J. Stasheff, Characteristic classes, Princeton University Press (1974). ISBN 1-4008-8182-X.</p>
34:@media (min-width: 1024px) {
54:  overflow-x: hidden;
69:  overflow-wrap: break-word;
84:  max-width: 1120px;
102:  min-width: 0;
115:  white-space: nowrap;
140:  overflow: hidden;
144:@media (min-width: 768px) {
174:  max-width: 1120px;
190:  max-width: 20em;
201:  max-width: 46em;
262:  max-width: 1120px;
267:@media (min-width: 768px) {
300:@media (min-width: 640px) {
306:@media (min-width: 1024px) {
322:  overflow: hidden;
417:  max-width: 1120px;
426:  min-width: 0;
429:@media (min-width: 1024px) {
482:@media (min-width: 1024px) {
518:  min-width: 0;
519:  max-width: 100%;
520:  overflow-wrap: break-word;
527:  max-width: 100%;
534:  max-width: 100%;
590:  overflow-x: auto;
591:  max-width: 100%;
660:  width: 100%;
661:  max-width: 100%;
662:  overflow-x: auto;
689:  min-width: 5.5rem;
706:  overflow-x: auto;
707:  overflow-y: hidden;
708:  max-width: 100%;
715:  max-width: 100%;
720:  overflow-x: auto;
721:  overflow-y: hidden;
742:  white-space: nowrap;
765:  min-width: 0;
769:  width: 100%;
781:@media (min-width: 1024px) {
798:@media (min-width: 1024px) {
804:    overflow-y: auto;
850:@media (min-width: 640px) {
887:@media (min-width: 640px) {
896:  min-width: 0;
897:  overflow-wrap: break-word;
924:  width: 100%;
925:  max-width: 100%;
926:  overflow-x: auto;
938:  min-width: 5.5rem;
970:  max-width: 1120px;
979:@media (min-width: 768px) {
997:  max-width: 42em;

exec
/usr/local/bin/zsh -lc "node -e 'const fs=require(\"fs\"); console.log(fs.readdirSync(\"website/node_modules\").filter(x=>/playwright|puppeteer|dom|browser/.test(x)).join(\"\\n\")); console.log(fs.readdirSync(\"website/node_modules/next/node_modules\").filter(x=>/playwright|puppeteer/.test(x)).join(\"\\n\"));'
nl -ba website/content/periodic-table.md | tail -45
rg -n 'abstractFull' website --glob '"'!package-lock.json'"' --glob '"'!manifest.json'"'
cat website/README.md" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
dompurify
isomorphic-dompurify
jsdom
react-dom

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
website/lib/papers.ts:12:  abstractFull: string;
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

exec
/usr/local/bin/zsh -lc "node -e '(async()=>{const fs=require(\"fs\"),ts=require(\"./website/node_modules/typescript\"),katex=require(\"./website/node_modules/katex\");function load(file,req){let m={exports:{}};new Function(\"require\",\"module\",\"exports\",ts.transpileModule(fs.readFileSync(file,\"utf8\"),{compilerOptions:{module:ts.ModuleKind.CommonJS,esModuleInterop:true}}).outputText)(req,m,m.exports);return m.exports;}const macros=load(\"website/lib/macros.ts\",require).BASE_MACROS;const render=load(\"website/lib/render-math.ts\",n=>n===\"katex\"?katex:n===\"./macros\"?{getMacros:()=>({...macros})}:require(n)).renderMath;const {marked}=await import(\"./website/node_modules/marked/lib/marked.esm.js\");const purify=require(\"./website/node_modules/isomorphic-dompurify\");const clean=purify.sanitize(await marked.parse(fs.readFileSync(\"website/content/periodic-table.md\",\"utf8\")),{ADD_TAGS:[\"span\",\"table\",\"thead\",\"tbody\",\"tr\",\"th\",\"td\",\"caption\"],ADD_ATTR:[\"class\",\"id\"]});const nums=[...clean.matchAll(/\\[(\\d{1,3})\\]/g)].map(m=>m[1]);const entries=[...fs.readFileSync(\"website/content/periodic-table-sources.md\",\"utf8\").matchAll(/"'^'"\\[(\\d+)\\]/gm)].map(m=>m[1]);console.log({periodicMissingSources:[...new Set(nums)].filter(n=>"'!entries.includes(n)),periodicKatexErrors:(render(clean).match(/katex-error/g)||[]).length});let inline=[];for(const f of fs.readdirSync("website/content/papers")){let src=fs.readFileSync("website/content/papers/"+f,"utf8");for(const m of src.matchAll(/<span class="math inline">(['"\\s\\S]*?)<\\/span>/g)){inline.push({f,line:src.slice(0,m.index).split(\"\\n\").length,tex:m[1],len:m[1].length});}}console.log(inline.sort((a,b)=>b.len-a.len).slice(0,5));})();'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 931ms:
{ periodicMissingSources: [], periodicKatexErrors: 0 }
[
  {
    f: 'vol-09-gravity-information-geometry.html',
    line: 157,
    tex: '\\(\\sqrt{\\rho}\\, \\sigma \\sqrt{\\rho} = \\left(\\begin{smallmatrix} \\lambda_+^2 &amp; \\tfrac{\\varepsilon}{2}\\sqrt{\\lambda_+ \\lambda_-} \\\\ \\tfrac{\\varepsilon}{2}\\sqrt{\\lambda_+ \\lambda_-} &amp; \\lambda_-^2 \\end{smallmatrix}\\right)\\)',
    len: 226
  },
  {
    f: 'vol-05-classical-systems.html',
    line: 100,
    tex: '\\(\\langle \\operatorname{Ad}^{*}_{g} \\xi, [\\operatorname{Ad}_{g} x, \\operatorname{Ad}_{g} y] \\rangle = \\langle \\xi, [x, y] \\rangle\\)',
    len: 131
  },
  {
    f: 'vol-03-irreducibility-decomposition.html',
    line: 161,
    tex: '\\(I/2 = \\frac{1}{2}(|0\\rangle\\langle 0| + |1\\rangle\\langle 1|) = \\frac{1}{2}(|+\\rangle\\langle +| + |-\\rangle\\langle -|)\\)',
    len: 121
  },
  {
    f: 'vol-04-yoneda-classification.html',
    line: 136,
    tex: '\\(\\sum_{k,l} J(\\Phi)_{(ik),(jl)} \\delta_{k\\alpha} \\delta_{l\\beta} = \\tfrac{1}{2} \\delta_{ij} \\delta_{\\alpha\\beta}\\)',
    len: 115
  },
  {
    f: 'vol-09-gravity-information-geometry.html',
    line: 91,
    tex: '\\(\\varphi = \\left(\\begin{smallmatrix} 0.7 &amp; 0.1 &amp; 0.2 \\\\ 0.3 &amp; 0.9 &amp; 0.8 \\end{smallmatrix}\\right)\\)',
    len: 115
  }
]

codex
The math check rendered 4,685 paper formulas with no KaTeX errors or visible TeX commands. Paper anchors, periodic-table citation targets, and manifest-listed HTML/PDF/OG files also resolve locally. I found remaining process language in the synthesis body and periodic table. The CSS supports wrapping navigation and scrolling tables/display math; this source-only review does not confirm rendered widths at 375px.
exec
/usr/local/bin/zsh -lc "rg -n '<h[2-4]["'^>]*>.*(math|'"\\\\)' website/content/papers --max-columns 420 --max-columns-preview
nl -ba website/content/periodic-table.md | sed -n '1,20p'
nl -ba website/content/papers/vol-09-gravity-information-geometry.html | sed -n '153,159p'
rg -n -i 'not retrieved|primary source needed|correction|corrected|review|working note|cross-volume consistency report|consistency checks' website/content/periodic-table.md website/content/papers/synthesis.html --max-columns 650 --max-columns-preview" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
website/content/papers/vol-12-principia-physica.html:167:<h2 id="sec:mathlayer">The mathematical layer</h2>
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
    16	Citation convention: bracketed citations link to the Sources section below. Inferences are marked *conjectural* or *open*.
    17	
    18	---
    19	
    20	## (a) Fundamental structural families and their defining invariants
   153	<div id="prop:qubit-fid" class="proposition">
   154	<p><strong>Proposition 25</strong> (Fidelity metric of the qubit).  <em>On <span class="math inline">\(\mathcal{D}_2^{\circ}\)</span> the fidelity metric satisfies <span class="math inline">\(g^{\mathrm{fid}} = \tfrac{1}{4} g^{\mathrm{sld}}\)</span>. Consequently the open state space with the fidelity metric is an open hemisphere of the round three-sphere of radius one half, of constant sectional curvature four.</em></p>
   155	</div>
   156	<div class="proof">
   157	<p><em>Proof.</em> Both metrics are invariant under the rotations of the Bloch ball induced by unitary conjugation, so at each <span class="math inline">\(\vec{r}\)</span> the rotation group fixing <span class="math inline">\(\vec{r}\)</span> forces the cross term between radial and transverse directions to vanish and fixes transverse isotropy, and the quadratic form is determined by its radial and transverse values. For the transverse direction, set <span class="math inline">\(\sigma = \rho + \varepsilon X\)</span> with <span class="math inline">\(X = \sigma_x/2\)</span> and <span class="math inline">\(\rho = \operatorname{diag}(\lambda_+, \lambda_-)\)</span>. Then <span class="math inline">\(\sqrt{\rho}\, \sigma \sqrt{\rho} = \left(\begin{smallmatrix} \lambda_+^2 &amp; \tfrac{\varepsilon}{2}\sqrt{\lambda_+ \lambda_-} \\ \tfrac{\varepsilon}{2}\sqrt{\lambda_+ \lambda_-} &amp; \lambda_-^2 \end{smallmatrix}\right)\)</span>, whose determinant is <span class="math inline">\(\lambda_+ \lambda_- (\lambda_+ \lambda_- - \varepsilon^2/4)\)</span>. Since <span class="math inline">\((\operatorname{Tr}\sqrt{M})^2 = \operatorname{Tr} M + 2\sqrt{\det M}\)</span>, one gets <span class="math inline">\(\operatorname{Tr}\sqrt{\sqrt{\rho}\,\sigma\sqrt{\rho}} = 1 - \varepsilon^2/8 + O(\|\varepsilon X\|^3)\)</span> and <span class="math inline">\(d_B^2 = 2(1 - \sqrt{F}) = \varepsilon^2/4 + O(\|\varepsilon X\|^3)\)</span>, matching <span class="math inline">\(\tfrac{1}{4} g^{\mathrm{sld}}(X, X) = 1/4\)</span> from <a href="#prop:qubit-sld" data-reference-type="ref+label" data-reference="prop:qubit-sld">24</a> at every <span class="math inline">\(r\)</span>. For the radial direction the states commute and the fidelity reduces to the classical affinity <span class="math inline">\(\sum_i \sqrt{p_i q_i}\)</span> on the Bernoulli pair <span class="math inline">\(p = ((1+r)/2, (1-r)/2)\)</span>; the expansion <span class="math inline">\(\sum_i \sqrt{p_i (p_i + \delta_i)} = 1 - \sum_i \delta_i^2 / (8 p_i) + O(\|\delta\|^3)\)</span> for <span class="math inline">\(\sum_i \delta_i = 0\)</span> gives <span class="math inline">\(d_B^2 = \sum_i \delta_i^2 / (4 p_i)\)</span>, one quarter of the classical Fisher value, and the classical Fisher value is <span class="math inline">\(g^{\mathrm{sld}}\)</span> on the diagonal by <a href="#prop:commutative" data-reference-type="ref+label" data-reference="prop:commutative">21</a>. The curvature claim follows from <a href="#prop:qubit-sld" data-reference-type="ref+label" data-reference="prop:qubit-sld">24</a> and the constant factor <span class="math inline">\(1/4\)</span>, which multiplies sectional curvatures by <span class="math inline">\(4\)</span>. ◻</p>
   158	</div>
   159	<div id="rem:conventions" class="remark">
website/content/periodic-table.md:109:| Freed–Hopkins anomaly classification statement | Family IV | Cobordism-spectrum statement not retrieved; primary source needed | **OPEN** | [19] context |
website/content/papers/synthesis.html:249:<p>The twelve parts maintain uniform definition identifiers, respect the directed dependency discipline, and enforce the preserved-layer constraint throughout. Eight consistency checks hold across the corpus, seven without qualification and one after a scope correction.</p>
website/content/papers/synthesis.html:281:<p>The holographic entropy cone is completely characterized for five boundary regions and fewer <a class="citation" href="#bib-corpus-47">[31]</a>, <a class="citation" href="#bib-corpus-73">[38]</a>, and the open range begins at six regions. This entry is the correction.</p>
website/content/papers/synthesis.html:285:<p>The corrected entry concerns the holographic entropy cone. The cone for five boundary regions is completely characterized: the cone defined by all proven inequalities admits graph models for every extreme ray orbit, which settles the existence of further five-party inequalities in the negative <a class="citation" href="#bib-corpus-73">[38]</a>. The statement that the cone is open from five regions onward has been replaced by the correct range, which begins at six regions <a class="citation" href="#bib-corpus-47">[31]</a>, and the periodic table of <a href="#tab:periodic" class="reflink">5</a> records the corrected range.</p>
website/content/papers/synthesis.html:329:<p class="bibitem" id="bib-corpus-73"><span class="bib-num">[38]</span> S. Hernández-Cuenca, The holographic entropy cone for five regions, Physical Review D 100 (2019) 026004. <a href="https://doi.org/10.1103/PhysRevD.100.026004" class="uri">https://doi.org/10.1103/PhysRevD.100.026004</a></p>

codex
The Round 2 fixes are present: homepage `og:type`/`og:url`, the published Sources reference, and the revised synthesis HTML abstract.

Two public-copy issues remain:

1. **Research-process placeholder:** `website/content/periodic-table.md:109` says “statement not retrieved; primary source needed.” Replace this with a reader-facing statement of the mathematical scope and a published citation, or remove the row pending sourcing.

2. **Internal review history:** `website/content/papers/synthesis.html:249`, `:281`, and `:285` describe “eight consistency checks,” a “scope correction,” and a statement that “has been replaced.” Retain the mathematical conclusion—complete through five boundary regions, open from six—and remove the checking/correction history.

Other checks: 4,685 paper formulas rendered without KaTeX errors or visible TeX leakage; local paper anchors, periodic-table citations, and referenced HTML/PDF/OG assets resolve. Periodic-table and synthesis summary pages exist. No missing OG/Twitter declarations or obvious navigation collisions were found in source.

Limitations: 375px layout was assessed from CSS, not browser measurements; external link availability was not checked.

VERDICT: NEEDS_FIX
hook: Stop
hook: Stop Completed
tokens used
62,146
The Round 2 fixes are present: homepage `og:type`/`og:url`, the published Sources reference, and the revised synthesis HTML abstract.

Two public-copy issues remain:

1. **Research-process placeholder:** `website/content/periodic-table.md:109` says “statement not retrieved; primary source needed.” Replace this with a reader-facing statement of the mathematical scope and a published citation, or remove the row pending sourcing.

2. **Internal review history:** `website/content/papers/synthesis.html:249`, `:281`, and `:285` describe “eight consistency checks,” a “scope correction,” and a statement that “has been replaced.” Retain the mathematical conclusion—complete through five boundary regions, open from six—and remove the checking/correction history.

Other checks: 4,685 paper formulas rendered without KaTeX errors or visible TeX leakage; local paper anchors, periodic-table citations, and referenced HTML/PDF/OG assets resolve. Periodic-table and synthesis summary pages exist. No missing OG/Twitter declarations or obvious navigation collisions were found in source.

Limitations: 375px layout was assessed from CSS, not browser measurements; external link availability was not checked.

VERDICT: NEEDS_FIX
