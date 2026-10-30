# Conjectures — vol-01-foundations

Numbered `C-<n>`. Statements recorded here are **not** machine-checked; they are
text. The module `lean/Cmrps/Vol01Foundations.lean` contains no `sorry` and does
not reference any item below.

## C-1 — Structural classification (Conjecture 9.2 of the paper)

`Classify(Ob(Phys_adm)/≃)`, the classification of admissible records up to the
declared physical equivalence, has an answer built from the candidate structural
families — symplectic and Poisson structures; Hilbert spaces and operator
algebras; smooth manifolds and geometric structures; principal bundles and
connections; probability and measure-theoretic structures; topological and
higher-categorical structures; dynamical systems and operator semigroups; tensor
categories and compositional structures; discrete combinatorial structures;
derived and homotopical structures — together with the constructions of
Definition 3.16 (closure under tensor product, direct sum, extension, limits and
colimits, factorisation). The conjecture carries five proof obligations in
Section 9 of the paper. The restricted classes of Theorems 8.1–8.4 are evidence
for it and no more.

## C-2 — One category or many (question of Corollary 4.5)

Whether a **single** category suffices for the five-kind morphism schema of
Definition 4.2, or whether the schema must become a multi-category with
composition typed in each slot (or the kinds retyped, or admissible morphisms
restricted to one kind at a time as a working convention). Proposition 4.4
(`compositionNotTyped`) shows the kinds as listed do not compose across kinds;
Proposition 4.6 shows each kind is closed under self-composition. The question
of Corollary 4.5 is which of the three resolutions the program should adopt
globally; it is open at the level of this volume.

## C-3 — Formalization of Theorem 8.2 claim 3 (component multisets classify)

**Statement (paper, proved informally in Theorem 8.2):** two finite dynamical
records `(X, f)` and `(Y, g)` are isomorphic (a bijection `φ : X ≃ Y` with
`φ ∘ f = g ∘ φ`) if and only if the multisets of connected-component
isomorphism classes of `X` and `Y` agree.

**Status:** the paper gives a complete informal proof; no Lean proof is in
`Cmrps.Vol01Foundations.lean` (only the decomposition existence and uniqueness
of Theorem 8.2 claim 2 are formalized, as `components_exist` and
`components_unique`). Listed here as the formal counterpart of an informally
proved statement; not a mathematical conjecture. If a later module proves it,
move it to the claim-status file.

## C-4 — Unitarity of the change of factorisation `W` (Proposition 7.6)

**Statement:** the Hadamard rotation `W` of Proposition 7.6 (formalized as
`changeFactorization`) is a self-adjoint unitary of the bare Hilbert space
`ℂ² ⊗ ℂ²`, not merely an invertible linear involution.

**Status:** the paper proves `W` self-adjoint and unitary on
`span{v₁, v₂}` and the identity on the orthogonal complement. The Lean module
proves only `changeFactorization_involutive` (`W ∘ W = id`, hence invertibility).
Formalized unitarity would need the inner-product structure of coefficient
matrices. Not a mathematical conjecture; listed as an unformalized claim of
Proposition 7.6.
