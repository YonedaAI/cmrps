---
reviewer: Gemini 3.8 Flash (Medium)
paper: vol-04-yoneda-classification
round: 4 (focused re-review)
date: 2026-10-30T05:13:38Z
---


### Verification of Previous Round Issues

1. **Theorem on non-implication parameter bound ($n \ge 3$)**
   **FIXED**: In [Theorem 3.6](file:///Users/mlong/Documents/Development/classification-physical-systems#L254), the statement specifies "Let $n \ge 3$...", and the proof explicitly notes: "Buchweitz and Leuschke \cite{buchweitz} for modules over the generic determinant of an $n \times n$ matrix with $n \geq 3$; the bound on $n$ is part of their setting, since the small cases are tame."

2. **Section cross-references and labels**
   **FIXED**: All sections now carry labels (`\label{sec:...}`), and cross-references dynamically use `\cref` and `\ref` (e.g., `\cref{sec:framework}`, `\cref{sec:synthesis}`, `Section~\ref{sec:supermap}`, `\cref{sec:computation}`) with zero unlabelled hard-coded section numbers.

3. **Proof of Choi correspondence bijection**
   **FIXED**: In the proof of [Proposition 4.1](file:///Users/mlong/Documents/Development/classification-physical-systems#L318), elementary linear maps are defined by $\Phi^{ij,kl}(X) = \Tr(E_{ji} X) E_{kl}$, their image under $J$ is identified as $E_{ij} \otimes E_{kl}$, and bijectivity is established: "so the assignment carries a basis to a basis between vector spaces of the same dimension $n^2 m^2$ and is therefore bijective."

4. **Relationship of $\mathcal{C}_{\mathrm{ch}}$ to general supermaps**
   **FIXED**: In [Remark 2.7](file:///Users/mlong/Documents/Development/classification-physical-systems#L137), the restricted pre/post-processing fragment is explicitly distinguished from general supermaps ("These pairs are the pre- and post-processings without auxiliary memory. General supermaps admit ancillary systems that bridge input and output, and the representability theorem of Section~\ref{sec:supermap} covers that wider setting."), reinforced in the preamble to [Theorem 4.3](file:///Users/mlong/Documents/Development/classification-physical-systems#L337).

5. **Preamble packages and `cleveref` usage**
   **FIXED**: Mandated skeleton packages are retained by design with an explicit inline note (`\usepackage{tikz} % and tikz-cd when commutative diagrams are used`), and `cleveref` is actively and consistently used for structural cross-references throughout the manuscript.

6. **Removal of signposting phrases**
   **FIXED**: All six targeted phrases ("three examples that follow", "the following proposition records", "proved next", "one more feature of profiles deserves recording", "worth laying out as a regime picture", and "the mathematical content of the relational shift is") have been excised completely from the text.

7. **Integration of floating two-sentence transitional paragraphs**
   **FIXED**: All short transitional passages across Sections 2, 3, 4, 5, and 6 have been expanded with technical detail or integrated into adjacent substantive paragraphs.

8. **Numbered composition identity display**
   **FIXED**: The Choi composition display in [Proposition 4.1](file:///Users/mlong/Documents/Development/classification-physical-systems#L306-L313) is set as numbered equation \eqref{eq:choi-comp} (`\label{eq:choi-comp}`) and cited explicitly in [Remark 4.2](file:///Users/mlong/Documents/Development/classification-physical-systems#L328) ("The contraction of \eqref{eq:choi-comp} reads...").

---

### New Defect Assessment
No new defects were introduced by any of the applied fixes. The mathematical statements, category-theoretic framing, proof details, and cross-referencing structure are consistent, rigorous, and verified.

VERDICT: ACCEPT (publishable as-is)
