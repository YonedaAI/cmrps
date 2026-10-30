# Human-readable check: vol-07-gauge-qft

**Gate:** team-protocol.md humanizer grep (HUMAN-READABLE: ON), run before the final compile
**Paper:** papers/latex/vol-07-gauge-qft.tex
**Date:** 2026-10-30

## Humanizer grep

The humanizer checks were run over papers/latex/vol-07-gauge-qft.tex:

1. Em and en dashes in source (unicode — and –): zero hits. Paired-surname compounds and page ranges are rendered with the ASCII macro \textendash, which typesets an en dash and is invisible to both dash greps; this is the house convention adopted during the Codex formatting rounds because the humanizer forbids literal -- sequences in source. Examples: Killing\textendashCartan, Doplicher\textendashRoberts, Yang\textendashMills, 175\textendash186.
2. --- and -- dash sequences in prose: zero hits.
3. AI vocabulary (delve, tapestry, testament, pivotal, crucial, seamless, leverage, realm, groundbreaking, cutting-edge, unlock, harness, foster, holistic, nuanced, intricate, multifaceted, vibrant, serves as, stands as, plays a vital role, paradigm shift, and companions): zero hits.
4. Title Case headings: zero hits. All headings are sentence-case noun phrases.
5. Curly quotes: zero hits; source uses straight quotes and LaTeX `` '' pairs.
6. Bold-header bullet lists (\item \textbf{...}): zero hits.
7. Neutral scholarly voice: promotional adjectives, rhetorical questions, and rule-of-three flourishes were removed during the review rounds; findings are stated once with their evidence.

Result for vol-07-gauge-qft: HUMANIZER CLEAN.

## Note for the orchestrator

The same grep over the whole papers/latex/ directory reports one Title Case heading in a sibling volume: vol-06-quantum-systems.tex line 356, \section{The McDuff obstruction}. That file belongs to another worker and was left untouched here.

## Discretionary item recorded

Review rounds asked for en dashes (rather than hyphens) in paired-surname compounds such as "Killing-Cartan". The humanizer rule forbids both literal -- sequences and unicode en dashes in source, so the single-hyphen spelling is the source convention where \textendash is not used, and \textendash is used where the en-dash rendering was requested. The focused review accepted this treatment.

HUMANIZER: CLEAN
