# Human-readable check: vol-02-structural-families

**Paper:** `papers/latex/vol-02-structural-families.tex`
**Date:** 2026-10-30
**Flag:** HUMAN_READABLE: ON. Checks are the humanizer grep of `references/team-protocol.md` section 2.

## Rules enforced

1. No em dashes and no en dashes in prose.
2. No `---` or `--` sequences in prose (exempt: `\hrule`, `3. No AI-vocabulary words from the banned list.
4. Sentence-case headings.
5. Straight quotes only in prose.
6. No bold-header bullet lists.
7. Neutral scholarly voice.

## Grep results

```
OK: no em dash and no en dash characters
OK: no --- or -- sequences in prose
OK: no AI-vocabulary words
OK: headings are sentence case
OK: straight quotes only
OK: no bold-header bullet lists
```

## Note on one enforced deviation

The Codex formatting review asked for en dashes in joint names and page ranges.
Those two items are not applied, because the humanizer rule above forbids the
en-dash ligature and forbids en-dash characters in prose, and
`references/paper-format.md` states that page and date ranges use hyphens for
exactly that reason. The binding humanizer invariant takes precedence over the
reviewer preference here. The Codex round-2 record notes the constraint and
returns PASS.

## Result

HUMANIZER: CLEAN
