# Style check: vol-07-gauge-qft

**Gate:** style-standard.md filler and signposting grep (run before the final compile)
**Paper:** papers/latex/vol-07-gauge-qft.tex
**Date:** 2026-10-30

## Filler and signposting grep

The style-standard.md grep was run over papers/latex/vol-07-gauge-qft.tex. It checks for the section II formulaic phrases ("it is important to note", "the aforementioned", "in what follows", "having established", "it follows that", "note that", "namely", "clearly", "with respect to", "in terms of", "the fact that", "moreover", "furthermore", "crucially", "at its core", the section VI markers [SOURCE REQUIRED] and [VERIFY VALUE], and enumerated First/Second/Third openers), excluding comment lines and citation-bearing lines.

Result for vol-07-gauge-qft: zero hits.

The same grep was run over every paper in papers/latex/ and returned zero hits in all of them.

## Format check (paper-format.md)

Every line of the format check prints OK for vol-07-gauge-qft.tex:

- OK class: \documentclass[11pt,letterpaper]{article}
- OK margins: margin=1in
- OK no parskip
- OK abstract 170 words (150 to 250), one paragraph, no citations
- OK headings: plain noun phrases in sentence case
- OK no counted headings
- OK title: no colon list
- OK table cells: no semicolon fragments
- OK sidebar: footnotesize GrokRxiv sidebar on page 1

Marker check: no [SOURCE REQUIRED] and no [VERIFY VALUE] anywhere in the .tex.

## Overfull boxes

Zero overfull \hbox warnings at the final compile (fixed during review rounds: bibliography URLs made breakable with \url, a wide inline tuple moved to display math).

STYLE GREP: CLEAN
