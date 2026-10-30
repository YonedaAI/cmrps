---
reviewer: Gemini 3.8 Flash (Medium) (focused fix-verification round)
paper: vol-06-quantum-systems
round: 4 (focused)
date: 2026-10-30T06:28:00Z
---


- **CRITICAL 1 (Definition of classifying invariants listed the Kraus rank)**: FIXED. Definition 2.7 restricts classifying invariants to the dimension vector, Murray-von Neumann type with Connes invariants, and operator monotone functions, explicitly designating Kraus rank as a normal-form dimension rather than a classifying invariant.
- **CRITICAL 2 (Local code paths and hypothetical Lean targets cited as evidence)**: FIXED. All references to future Lean targets have been removed, code files are presented strictly as supplementary material, and Section 9 explicitly disclaims that computations are evidence rather than proofs.
- **MAJOR 1 (Deligne theorem omitted the qualifier as a symmetric tensor category)**: FIXED. Theorem 7.4 now explicitly states that $\mathcal{C}$ is equivalent "as a symmetric tensor category" to the representation category of an affine supergroup scheme.
- **MAJOR 2 (Petz metric missing tangent-space constraints)**: FIXED. Definition 8.1 defines the manifold of strictly positive density matrices with tangent space $T_\rho \mathcal{D}_n$ consisting of self-adjoint traceless matrices, and Theorem 8.3 explicitly specifies the metric on this tangent space.
- **MAJOR 3 (Forward reference from Choi example to depolarizing family)**: FIXED. The depolarizing family is now introduced in Example 6.2 immediately prior to the Choi matrix discussion in Example 6.3.
- **MAJOR 4 (Signposting and meta-filler at flagged locations)**: FIXED. Flagged phrases and paragraphs (including the three-levels discussion, classification-shape remarks, and introductory filler) have been removed or rewritten as direct technical exposition.
- **MINOR 1 (Choi contraction is a link product)**: FIXED. Proposition 6.6 explicitly identifies channel composition as a link-product contraction of Choi matrices.
- **MINOR 2 (Factor types in math italics)**: FIXED. All factor classifications are now typeset in roman font ($\mathrm{I}$, $\mathrm{II}_1$, $\mathrm{II}_\infty$, $\mathrm{III}$, $\mathrm{III}_\lambda$, etc.).
- **MINOR 3 (Unused preamble packages graphicx, tikz, L column)**: NOT FIXED. These remain in the preamble as required by the series binding house format skeleton.
- **MINOR 4 (Connes spectrum formulation)**: FIXED. Remark 4.4 defines the Connes spectrum as the intersection of modular operator spectra in $[0, \infty)$ and reads stratum parameters from $S(M) \cap \mathbb{R}_+^*$.

All critical and major mathematical, conceptual, and stylistic issues raised in Round 3 have been resolved. The remaining minor preamble retention is mandated by the series house format template and requires no further modification, leaving the manuscript technically sound and complete.

VERDICT: ACCEPT (publishable as-is)
