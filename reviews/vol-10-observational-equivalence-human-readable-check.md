# Human-readable check: vol-10-observational-equivalence

HUMAN-READABLE: ON. Humanizer grep checks of references/team-protocol.md run
before the final compile (Stage 7), 2026-10-30, against
papers/latex/vol-10-observational-equivalence.tex.

1. Em and en dashes (unicode): none found.
2. Double and triple hyphen sequences in prose: none found (bibliographic page
   ranges use the \textendash macro, which keeps the source free of literal en
   dashes and of -- sequences while typesetting correctly).
3. AI vocabulary (delve, tapestry, testament, pivotal, crucial, robust,
   seamless, leverage, navigate, landscape, realm, paradigm shift,
   groundbreaking, cutting-edge, unlock, harness, foster, holistic, nuanced,
   intricate, multifaceted, vibrant, it is worth noting, it is important to
   note, in today's, in the realm of, serves as, stands as, plays a vital
   role, and the rest of the banned list): none found.
4. Sentence-case headings: all headings are sentence-case plain noun phrases;
   proper nouns keep their capitals; no heading hit remains in the heuristic
   title-case check.
5. Straight quotes only: no unicode curly quotes in the source; typographic
   quotes come from LaTeX `` and '' pairs.
6. No bold-header bullet lists.
7. Neutral scholarly voice: count-announcing openers and the promotional
   phrases flagged in review rounds 2 and 4 (including "durable product of
   this section", "load-bearing", "deliverable", "by hand", "the row that
   matters") were removed in the round-4 fix pass.

HUMANIZER: CLEAN
