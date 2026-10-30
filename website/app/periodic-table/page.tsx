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
    <div className="paper-layout paper-layout--solo">
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
