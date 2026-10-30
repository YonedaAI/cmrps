# Human-readable check — vol-09-gravity-information-geometry

**Paper:** papers/latex/vol-09-gravity-information-geometry.tex
**Date:** 2026-10-30
**Flag:** HUMAN-READABLE: ON. Checks from references/team-protocol.md section 2 run over the final source.

| Check | Result |
|---|---|
| No em dashes or en dashes in prose (unicode `—`, `–`) | clean |
| No `---` or `--` sequences outside exempted contexts | clean (page ranges use `\textendash`, which contains no `--` source sequence; DOI hyphens are single) |
| AI-vocabulary ban list (delve, tapestry, testament, pivotal, crucial, seamless, leverage, realm, groundbreaking, cutting-edge, unlock, harness, foster, holistic, nuanced, intricate, multifaceted, vibrant, "it is worth noting", "it is important to note", "in today's", "in the realm of", "serves as", "stands as", "plays a vital role", "paradigm shift") | clean |
| Sentence-case headings | clean (heuristic title-case grep produced no hits) |
| Straight quotes only (no unicode curly quotes) | clean |
| No bold-header bullet lists (`\item \textbf{...}`) | clean (the two `description` environments use plain labels) |
| Neutral scholarly voice (no promotional adjectives, no rhetorical questions, no rule-of-three flourishes) | reviewed through the AGY rounds; the round-3 catchphrase and copular-chain fixes removed the flagged passages |

The greps were run before every review round and again on the final source before compile; every historical hit (round 1 "Moreover", round 1 "with respect to", round 3 "load-bearing") was fixed by editing prose.

HUMANIZER: CLEAN
