# Style check: vol-08-spacetime-reconstruction

Run 2026-10-30 after all review fixes (AGY rounds 1-4, Codex rounds 1-3) and
before the final compile. Scope: papers/latex/vol-08-spacetime-reconstruction.tex.
Check: the filler and formulaic-phrase grep from references/style-standard.md.

Results:

- filler and signposting grep: 0 hits
- enumerated signposting grep (First, Second, ... openers): 0 hits
- [SOURCE REQUIRED] and [VERIFY VALUE] markers: 0 hits
- format check from references/paper-format.md: all lines OK (11pt letterpaper,
  margin=1in, no parskip, abstract 205 words in one paragraph without
  citations, plain noun-phrase headings, no counted headings, no colon-list
  title, complete-phrase table cells, footnotesize sidebar)

House-standard notes:

- Page and date ranges use hyphens, as references/paper-format.md prescribes
  (the humanizer rule forbids en dashes). Codex round 1 asked for en dashes in
  the bibliography; the request was declined because the series format standard
  mandates hyphens.
- The preamble package set (including graphicx and tikz) is the fixed skeleton
  of references/paper-format.md; AGY round 3 flagged the packages as unused and
  the flag was declined for the same reason. The GrokRxiv sidebar uses tikz,
  so tikz is in fact used.

STYLE GREP: CLEAN
