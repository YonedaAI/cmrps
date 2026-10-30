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
