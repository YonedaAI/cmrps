'use client';
import { useState, useEffect } from 'react';

export function TableOfContents({
  headings,
}: {
  headings: { id: string; text: string; level: number }[];
}) {
  const [activeId, setActiveId] = useState('');
  const [open, setOpen] = useState(false);

  useEffect(() => {
    const onScroll = () => {
      const scrollY = window.scrollY + 120;
      let current = '';
      for (const { id } of headings) {
        const el = document.getElementById(id);
        if (el && el.offsetTop <= scrollY) {
          current = id;
        }
      }
      setActiveId(current);
    };
    window.addEventListener('scroll', onScroll, { passive: true });
    onScroll();
    return () => window.removeEventListener('scroll', onScroll);
  }, [headings]);

  return (
    <div className="toc-wrap">
      <button
        type="button"
        className="toc-toggle"
        onClick={() => setOpen((v) => !v)}
        aria-expanded={open}
      >
        Contents {open ? '▾' : '▸'}
      </button>
      <nav className={`toc ${open ? 'toc-open' : ''}`}>
        {headings.map(({ id, text, level }) => (
          <a
            key={id}
            href={`#${id}`}
            className={`toc-item toc-level-${level} ${activeId === id ? 'toc-active' : ''}`}
            onClick={() => setOpen(false)}
          >
            {text}
          </a>
        ))}
      </nav>
    </div>
  );
}
