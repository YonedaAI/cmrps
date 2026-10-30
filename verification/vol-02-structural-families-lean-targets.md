# Lean 4 mechanization targets: vol-02-structural-families

**Paper:** `papers/latex/vol-02-structural-families.tex`
**Volume:** Fundamental Structural Families of Mathematical Physics (CMRPS Part 2)
**Date:** 2026-10-29
**Count:** 10 targets (the maximum for this run)

## Status of this file

These are mechanization **targets**. No `.lean` file has been written and `lake` has not been
run. Nothing in this volume is machine-checked. The claim-status labels below are the informal
status of each statement as recorded in
`verification/vol-02-structural-families-claim-ledger.md`; the intended Lean status after a
clean kernel build would be `machine-checked`, and that label is not claimed here.

The names below mirror the paper's labels and the declarations in
`src/vol-02-structural-families/Instances.hs`, so that the three layers use one vocabulary.

## Targets

### 1. `sharpness_criterion` (paper Theorem 3.2)

Informal statement. Let `(F, V, I)` be an invariant-complete family record and let `F/≃` be the
set of `≃`-classes. Then: (a) `[P] ↦ I(P)` is a well-defined injection `F/≃ → V`; (b) if `V`
is finite with `|V| = N` then `|F/≃| ≤ N`; (c) if `k` is an algebraically closed field, `V` and
`W` are `k`-varieties, and `f : W → V` is a morphism of finite type whose image contains every
attained value of `I`, then `f(W)` is a constructible subset of `V` and `F/≃` injects into the
`k`-points of `f(W)`; (d) if `F/≃` is uncountable then no invariant-complete record for `F` has
countable range.

Lean notes. Parts (a), (b), (d) are set theory and cardinality; (c) needs the statement of
Chevalley's theorem and should be isolated behind an axiom or a Mathlib import.

### 2. `globality_symplectic` (paper Proposition 3.4)

Informal statement. Let `(M, ω)` and `(N, η)` be symplectic manifolds of the same dimension
`2n` with `n ≥ 1`. Let `f` assign a value to every symplectic germ, invariant under
symplectomorphism of germs. Then `f` is constant at every point of `M` and of `N`. Consequently
no germ invariant classifies in the symplectic family at fixed dimension, and every classifying
invariant there is global.

Lean notes. Depends on Darboux's theorem as a hypothesis; the mechanization should take
Darboux as an axiomatized input and prove the constancy consequence.

### 3. `achievement_kinds_exhaustive` (paper Proposition 3.7)

Informal statement. For any sector `S` exactly one of five achievement kinds applies:
complete-and-parameterized, complete-and-unparameterized, complete-as-obstruction,
impossible, no-record. The five are pairwise disjoint and exhaustive.

Lean notes. A nested case split on three decidable conditions; straightforward once the three
conditions are stated as a `Prop`-valued structure.

### 4. `dim_vector_classification` (paper Theorem 7.1)

Informal statement. Every unital finite-dimensional complex C*-algebra is isomorphic to a direct
sum of matrix algebras `⊕ᵢ M_{nᵢ}(ℂ)` for a unique multiset `{n₁, …, n_k}` of positive integers,
and that multiset determines the algebra up to `*`-isomorphism. At fixed total complex dimension
`d = Σᵢ nᵢ²` the number of such multisets is finite.

Lean notes. A literature result. The mechanization target is the uniqueness statement and the
finiteness of the range at fixed dimension; the structure theorem itself is a large input.

### 5. `induced_dimension_vector` (paper Proposition 4.2)

Informal statement. Let `A`, `B` be unital finite-dimensional complex C*-algebras with dimension
vectors `{n₁, …, n_k}` and `{m₁, …, m_l}`. Then the dimension vector of `A ⊕ B` is the multiset
union `{n₁, …, n_k, m₁, …, m_l}`, and the dimension vector of `A ⊗ B` is the multiset
`{nᵢ m_j : 1 ≤ i ≤ k, 1 ≤ j ≤ l}`.

Lean notes. Feeds directly off `dim_vector_classification`; the tensor identity
`M_a(ℂ) ⊗ M_b(ℂ) ≅ M_{ab}(ℂ)` is the load-bearing input. This is the target that
`src/vol-02-structural-families/Instances.hs` models in the `Constructible` instance and
`phaseD_dimension_vectors.py` checks numerically.

### 6. `kraus_rank_not_injective` (paper Proposition 11.2)

Informal statement. Fix the equivalence on channels to be equality of completely positive maps.
Let `Φ_U(X) = U X U*` for `U ∈ U(2)`. Every `Φ_U` has Kraus rank one, and the set of distinct
channels of this form is in bijection with `PU(2)`, which is not a point. The assignment from
channels to Kraus rank is therefore not injective under equality of maps.

Lean notes. The proof is elementary linear algebra: `Φ_U = Φ_U'` as maps forces `U' = λU`.
The mechanization must state the equivalence relation explicitly, since the conclusion changes
under other relations.

### 7. `cotangent_retract` (paper Proposition 4.1)

Informal statement. The zero section of `T*Q` is a deformation retract of `T*Q`. Consequently
the homotopy type of `T*Q` equals the homotopy type of `Q`, and every homotopy invariant of `Q`
is a global invariant of the symplectic record on `T*Q`.

Lean notes. The homotopy `r_t(x, ξ) = (x, tξ)` and the identity `r_s ∘ r_t = r_{st}` are the
content.

### 8. `exceptional_not_closed` (paper Proposition 15.1)

Informal statement. Let `K` contain direct sum and let `E` be a nonempty class of nonzero
objects each irreducible under direct sum. Then `E` is not closed under direct sum, and
`⟨E⟩_K` strictly contains `E`.

Lean notes. The hypothesis `E` nonempty is required and is stated in the paper. The conclusion
is non-closure, not non-generation; the distinction is load-bearing and the mechanization must
keep the two apart.

### 9. `invariants_not_independence` (paper Proposition 16.2)

Informal statement. Two structural families may each admit a classifying invariant and still
fail to be logically independent. In particular the commutative unital C*-algebras and the
compact Hausdorff spaces each carry a classifying invariant, and neither is independent of the
other.

Lean notes. Witnessed by the Gelfand anti-equivalence; the mechanization needs that
correspondence as an input and the definition of independence from paper Definition 16.1.

### 10. `comparability_of_records` (paper Proposition 18.1)

Informal statement. Two classification records that agree on family, sector, and equivalence
and that both name classifying invariants have invariants related by a bijection between their
attained values on that sector.

Lean notes. Two bijections composed; elementary once the record structure is in scope.

## Cross-audit note

The Haskell declarations in `src/vol-02-structural-families/Instances.hs` use the same names
for the systems and families these targets refer to. The Haskell is an executable model
validated against these specifications and against the paper. It is **not** verified by Lean,
and no such claim is made anywhere in the run. The honest statement is "executable models
validated against kernel-checked specifications", and the kernel-checked side does not yet
exist, since no Lean file has been written.
