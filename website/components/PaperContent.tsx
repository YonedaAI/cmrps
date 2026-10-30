'use client';
import { useCallback } from 'react';

/**
 * Injects build-time pre-rendered paper HTML directly into the DOM, bypassing
 * React reconciliation (which would mangle KaTeX spans on hydration). The HTML
 * is our own pandoc output pre-rendered with KaTeX at build time — not
 * user-supplied content.
 */
export function PaperContent({ html }: { html: string }) {
  const contentRef = useCallback((node: HTMLDivElement | null) => {
    if (node) {
      node.innerHTML = html;
    }
  }, [html]);

  return <div ref={contentRef} className="paper-content" />;
}
