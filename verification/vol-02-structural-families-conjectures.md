# Conjectures and unformalized inputs: vol-02-structural-families

**Paper:** `papers/latex/vol-02-structural-families.tex`
**Module:** `lean/Cmrps/Vol02StructuralFamilies.lean`
**Date:** 2026-07-11

Numbered `C-<n>`. Each entry is a statement that the Lean module takes as an input or leaves
unproved; none is claimed machine-checked. Literature theorems used as inputs are recorded
here so the boundary between what the kernel checked and what was assumed is visible.

---

## C-1. Chevalley constructibility (input to `sharpness_criterion` part 3)

Let `k` be an algebraically closed field, `V`, `W` varieties over `k`, and `f : W → V` a
morphism of finite type. Then `f(W(k))` is a constructible subset of `V`.

**Role.** Paper Theorem 3.2(3) states that when the attained values of `I` lie in `f(W(k))`,
they form a constructible subset and `F/≃` injects into it. The module proves the set-theoretic
content (`FamilyRecord.sharpness_injects_into_superset`): the classes inject into any subset of
the range containing the attained values. The constructibility of `f(W(k))` is Chevalley's
theorem and is not formalized. With C-1 the full part (3) follows from the machine-checked
statement.

**Status.** conditional (theorem of Chevalley, complete-informal-proof in the literature).

## C-2. PU(2) parametrization of unitary channels of `M₂(ℂ)` (input to `kraus_rank_not_injective`)

Let `U, U' ∈ U(2)` and `Φ_U(X) = U X U*`. Then `Φ_U = Φ_{U'}` as maps `M₂(ℂ) → M₂(ℂ)` if and
only if `U' = λU` for some scalar `λ` of unit modulus. Consequently the distinct unitary
channels of `M₂(ℂ)` are in bijection with `PU(2)`, which is not a point.

**Role.** Paper Proposition 11.2. The module proves `Kraus.kraus_rank_not_injective` (two
explicit distinct channels, both of Kraus rank one) which is the injectivity failure. The
parametrization of ALL distinct channels by `PU(2)` is the remaining content; its forward
direction (`Φ_{λU} = Φ_U`) is elementary and its converse is linear algebra over `M₂(ℂ)`.

**Status.** complete-informal-proof (paper proof); not machine-checked.

## C-3. Gelfand anti-equivalence (input to `invariants_not_independence` instance)

There is an anti-equivalence between the category of commutative unital C*-algebras and the
category of compact Hausdorff spaces (Gelfand–Naimark): `A ↦ Spec(A)`, `X ↦ C(X)`, with each
side determining the other.

**Role.** Paper Proposition 16.2. The module proves the schema
(`not_independent_of_reconstructable`, `invariants_not_independence`): families related by a
correspondence are not logically independent, even when each carries a classifying invariant.
Instantiating the schema with the actual Gelfand pair requires C-3 as a formal correspondence.

**Status.** conditional (literature theorem, complete-informal-proof).

## C-4. Wedderburn structure theorem for finite-dimensional unital complex C*-algebras (input to `dim_vector_classification`, `induced_dimension_vector`)

Every unital finite-dimensional complex C*-algebra `A` is `*`-isomorphic to
`⊕ᵢ₌₁^k M_{nᵢ}(ℂ)` for a unique multiset `{n₁, …, n_k}` of positive integers; the multiset
determines `A` up to `*`-isomorphism.

**Role.** Paper Theorem 7.1 (structure + uniqueness). The module formalizes the
dimension-vector vocabulary, the induced operations, and the finiteness of the range at fixed
total dimension (`dimVector_finite`), all of which are combinatorics on multisets. The
identification of the multiset `{nᵢ}` with the matrix block sizes of an actual algebra, and the
uniqueness statement, are this input.

**Status.** conditional (literature theorem — Jacobson radical + Artin-Wedderburn;
complete-informal-proof sketch in the paper).

## C-5. Matrix algebra tensor identity (input to `induced_dimension_vector`)

`M_a(ℂ) ⊗ M_b(ℂ) ≅ M_{ab}(ℂ)` as C*-algebras, and tensor product distributes over direct sums.

**Role.** Paper Proposition 4.2: the dimension vector of `A ⊗ B` is the multiset
`{nᵢ mⱼ}`. The module proves the multiset identity
(`DimensionVector.totalDim_tensor`, `DimensionVector.tensor`); the identification with the
tensor product of algebras is this input.

**Status.** conditional (standard linear algebra; complete-informal-proof).

## C-6. Darboux's theorem (input to `globality_symplectic`)

Every symplectic germ of dimension `2n` (`n ≥ 1`) is symplectomorphic to the standard germ
`(ℝ^{2n}, ω₀)`.

**Role.** Paper Proposition 3.4. The module proves the constancy consequence
(`globality_symplectic`) with Darboux's theorem recorded as the input field
`SymplecticGermField.darboux`; the theorem itself is not formalized.

**Status.** conditional (literature theorem, complete-informal-proof).

---

### Note on the boundary

Everything above appears in the Lean module as either (a) a hypothesis field
(`SymplecticGermField.darboux`), (b) a statement about dimension-vector combinatorics whose
algebra-side identification is deferred here, or (c) a set-theoretic theorem with the geometric
content deferred here. No theorem in the module assumes any of C-1..C-6 silently: each
machine-checked claim is proved outright, and the claims that need these inputs are labeled
`conditional` in `vol-02-structural-families-claim-status.md`.
