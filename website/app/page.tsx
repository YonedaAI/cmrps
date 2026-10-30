import type { Metadata } from 'next';
import { getPapers } from '../lib/papers';

export const metadata: Metadata = {
  openGraph: {
    type: 'website',
    url: '/',
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
