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
      <div className="paper-layout paper-layout--toc">
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
