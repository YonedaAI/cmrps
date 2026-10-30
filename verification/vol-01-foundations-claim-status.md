# Claim status — vol-01-foundations

Module: `lean/Cmrps/Vol01Foundations.lean` (namespace `Cmrps.Vol01`).
Every formalized claim below is proved without `sorry`, `admit`, or `axiom`.
The module was type-checked file-by-file (`lake env lean`), but the authoritative
gate is the assembler's `lake build`; therefore formalized claims carry the label
**machine-checked** until the assembler promotes them.
Status labels: `machine-checked` | `complete-informal-proof` |
`conditional` | `conjecture` | `computational-evidence` | `open-problem`.

Targets file: `verification/vol-01-foundations-lean-targets.md` (10 targets).

## Target 1 — vol01.morphisms.composition_not_typed (Proposition 4.4)

| Claim name | Statement | Status |
|---|---|---|
| `compositionNotTyped` | There are finite classical records and morphisms (the embedding `0↦0, 1↦2` into `Fin 4` and the coarse-graining `0↦0, 1↦1, 2↦0, 3↦1`) whose composite is the constant map `0↦0`, satisfying none of the five preservation laws of Definition 4.3. | machine-checked |
| `IsCoarseGraining`, `IsEmbedding`, `IsEquivalenceMorphism`, `IsDuality`, `IsLimitingProcedure` | Point-set specialisations of the five laws of Definition 4.3 on finite classical records (surjective / injective / bijective / bijective underlying map / `False` for maps between fixed finite records). | machine-checked (definitions) |

Scope note: laws 4 and 5 are specializations — a duality's underlying map is
invertible (isomorphisms of a category and its opposite coincide), and a map
between two fixed finite records is excluded from the limiting kind by
Definition 4.3(5). The full duality (paired presentations, named layers) and
limiting-procedure (cone legs on unbounded diagrams) structures are not
formalized: `complete-informal-proof` (paper Definition 4.3 items 4–5).

## Target 2 — vol01.morphisms.self_composition (Proposition 4.6)

| Claim name | Statement | Status |
|---|---|---|
| `coarseGraining_selfComposition` | Surjective state maps compose to surjective state maps: coarse-grainings are closed under self-composition. | machine-checked |
| `embedding_selfComposition` | Injective state maps compose to injective state maps: embeddings are closed under self-composition. | machine-checked |
| `equivalenceMorphism_selfComposition` | Bijective state maps compose to bijective state maps: equivalence morphisms are closed under self-composition. | machine-checked |
| `identity_of_kind` | The identity state map is a coarse-graining, an embedding, and an equivalence morphism. | machine-checked |

## Target 3 — vol01.admissibility.kind_category (Proposition 6.4)

| Claim name | Statement | Status |
|---|---|---|
| `CategoryData` | Structure packaging identity, composition, and the category laws (left/right identity, associativity) for morphisms of one kind. | machine-checked (definition) |
| `coarseGraining_kindCategory` | Finite classical records with coarse-graining morphisms (`CoarseHom`) form a category. | machine-checked |
| `embedding_kindCategory` | Finite classical records with embedding morphisms (`EmbeddingHom`) form a category. | machine-checked |
| `equivalenceMorphism_kindCategory` | Finite classical records with equivalence-morphism (`EquivalenceHom`) form a category. | machine-checked |

Scope note: Proposition 6.4 in full generality (admissible records of
Definitions 6.1–6.3, any ambient categories) is `complete-informal-proof`
(paper proof: closure under composition by hypothesis, identities satisfy each
law, associativity from composition of maps). The Lean version instantiates it
for the three closed kinds on finite classical records, the case the
proposition itself names. A `CategoryTheory.Category` instance is the natural
upgrade; `CategoryData` is self-contained to avoid category boilerplate.

## Target 4 — vol01.admissibility.conditional_statements (Proposition 6.5)

| Claim name | Statement | Status |
|---|---|---|
| `ObservableClosure` | AC-2 specialisation: the observable collection `O ⊆ (X → ℝ)` is closed under addition. | machine-checked (definition) |
| `delta` | The point-mass observable `δ_x`. | machine-checked (definition) |
| `conditional_statements` | With AC-2 in force sum-closure holds by definition; with AC-2 dropped the record `X = Fin 2`, `O = {δ₀, δ₁}` (point masses) is admitted and `δ₀ + δ₁ = 1 ∉ O`, so the sentence fails. | machine-checked |

Scope note: the full AC-1…AC-6 list as record predicates is not formalized
(AC-1/AC-3/AC-4 hold trivially for finite classical records; AC-5/AC-6 are
class-specification conditions): `complete-informal-proof` (Definitions 6.1–6.2).

## Target 5 — vol01.finiteState.irreducible_iff_card_eq_one (Theorem 8.1, claim 1)

| Claim name | Statement | Status |
|---|---|---|
| `IsIrreducibleDisjointUnion` | Definition 3.12 with disjoint union: not the unit (card ≠ 0) and no split into two nonempty parts. | machine-checked (definition) |
| `irreducible_iff_card_eq_one` | A finite classical record is irreducible under disjoint union iff its state space has one element. | machine-checked |
| `irreducible_iff_no_sum_split` | Irreducibility is equivalent to the absence of a split `X ≃ X₁ ⊕ X₂` with both factors nonempty (Example 7.1). | machine-checked |

## Target 6 — vol01.finiteState.classify_iff_card_eq (Theorem 8.1, claims 2–4)

| Claim name | Statement | Status |
|---|---|---|
| `iso_iff_card_eq` | Two finite classical records are isomorphic iff their cardinalities agree (claim 3). | machine-checked |
| `onePoint_decomposition_unique` | Any decomposition of `X` into one-point records has exactly `Fintype.card X` factors, so the decomposition is unique up to order and isomorphism of factors (claim 2). | machine-checked |
| `onePoint_factors_iso` | All one-point factors are isomorphic to `Fin 1` (claim 2, factor isomorphism part). | machine-checked |
| `card_classifies_quotient` | Cardinality is a complete invariant and every `n : ℕ` is realized by `Fin n`, so the quotient by isomorphism is in bijection with `ℕ` (claim 4). | machine-checked |

## Target 7 — vol01.dynamics.irreducible_iff_connected (Theorem 8.2, claim 1)

| Claim name | Statement | Status |
|---|---|---|
| `Step`, `WeaklyConnected`, `IsIrreducibleDyn` | Functional-graph edge relation (one state is the image of the other), weak connectivity (nonempty + reachability of every pair), and irreducibility under disjoint union with componentwise dynamics (no split into two nonempty invariant parts). | machine-checked (definitions) |
| `step_symm`, `reachable_symm`, `reachable_pre` | The edge relation is symmetric; reachability is symmetric; `x₀ →* f x` implies `x₀ →* x`. | machine-checked (lemmas) |
| `irreducible_iff_connected` | A finite dynamical record is irreducible under disjoint union iff its functional graph is weakly connected. | machine-checked |

## Target 8 — vol01.dynamics.connected_components_unique (Theorem 8.2, claims 2–3)

| Claim name | Statement | Status |
|---|---|---|
| `reachableClass`, `DynDecomposition` | Reachability class of a state; a decomposition is a partition of `X` into nonempty invariant weakly connected parts. | machine-checked (definitions) |
| `reachableClass_eq_of_reach`, `class_eq_of_mem` | Reachability classes are equal or disjoint; every part of a decomposition is exactly the class of any of its points. | machine-checked (lemmas) |
| `components_unique` | The connected-component decomposition is unique: any two decompositions into nonempty invariant connected parts have the same parts (hence the same count, unique up to order and isomorphism of factors). | machine-checked |
| `components_exist` | The connected-component decomposition exists: reachability classes partition `X` into nonempty invariant connected parts. | machine-checked |
| Theorem 8.2 claim 3 (component multisets classify records) | Two finite dynamical records are isomorphic iff the multisets of connected-component isomorphism classes agree. | complete-informal-proof (paper proof; not formalized) |

## Target 9 — vol01.product.irreducible_iff_prime_card (Example 7.5)

| Claim name | Statement | Status |
|---|---|---|
| `IsIrreducibleProduct` | Definition 3.12 with product composition: unit = one-point record (empty product); irreducible = not a product of two non-units. | machine-checked (definition) |
| `irreducibleProduct_iff_prime_card` | Under the product rule the irreducible finite classical records are exactly those of prime cardinality. | machine-checked |
| `prime_factorization` | Every nonzero-cardinality record is a product of prime-cardinality records (factor list = `Nat.primeFactorsList`). | machine-checked |
| `prime_factorization_unique` | The factorisation is unique up to order (`Nat.primeFactorsList_unique`, fundamental theorem of arithmetic). | machine-checked |

## Target 10 — vol01.qubit.factorization_nonunique (Proposition 7.6)

| Claim name | Statement | Status |
|---|---|---|
| `CoeffMat`, `reducedDiag`, `reducedOffDiag`, `IsUnitState`, `entanglementEntropy` | Coefficient matrix of a pure two-qubit state; diagonal and off-diagonal of the reduced density matrix `M ⬝ M†`; unit-vector condition; entanglement entropy as von Neumann entropy of the diagonal reduced state. | machine-checked (definitions) |
| `changeFactorization` | The Hadamard rotation `W` on `span{e₁⊗e₁, e₂⊗e₂}` extended by the identity: the change of factorisation of Proposition 7.6. | machine-checked (definition) |
| `changeFactorization_involutive` | `W ∘ W = id`, so the change of factorisation is invertible. | machine-checked |
| `changeFactorization_psi` | The fixed vector `ψ = e₁⊗e₁` has coordinates `e₁⊗e₁` in the first factorisation and `(e₁⊗e₁ + e₂⊗e₂)/√2` in the second. | machine-checked |
| `reducedDiag_first`, `reducedDiag_second` | The two presentations have reduced density matrices `diag(1,0)` and `diag(1/2,1/2)` (both diagonal). | machine-checked |
| `isUnitState_psi` | Both coordinate presentations of `ψ` are unit vectors. | machine-checked |
| `factorization_nonunique` | The entanglement entropy of `ψ` is `0` in the first factorisation and `log 2` in the second. | machine-checked |
| `sq_sqrt_two`, `norm_psiSecond`, `hadamard_involutive` | Arithmetic lemmas for the witnesses. | machine-checked (lemmas) |
| Proposition 7.6, Hilbert-space form | `W` is a self-adjoint **unitary** of the bare Hilbert space `ℂ²⊗ℂ²`, and entropies are von Neumann entropies of the reduced density operators in full generality. | complete-informal-proof (paper proof; the Lean version proves `W` invertible and computes the entropies for the diagonal-reduced witnesses; `entanglementEntropy` is defined via the diagonal of `M ⬝ M†`, which is exact here because both witnesses have diagonal reduced matrices) |

## Targets and claims skipped (not formalized)

| Claim name | Statement | Status |
|---|---|---|
| Definition 3.1 (general system record) | The five-component record `(X, O, D, S, C)` for arbitrary ambient categories. | complete-informal-proof (paper definition; only the finite classical / dynamical / qubit specialisations are formalized) |
| Corollary 4.5 (schema, not category) | The five-kind morphism schema is not a category; three resolutions are possible. | complete-informal-proof (paper corollary; direct consequence of `compositionNotTyped`) |
| Theorem 8.3 (generation) | Restricted-class records are generated by their irreducible factors, effectively. | complete-informal-proof (paper proof; stated in the targets file as a direct corollary of targets 6 and 8) |
| Theorem 8.4 (finite symmetric classification) | Orbits classify `G`-set records; transitive actions are irreducible. | complete-informal-proof (paper proof; excluded from the target list to keep it at ten) |
| Conjecture 9.2 (structural classification) | `Classify(Ob(Phys_adm)/≃)` is built from the candidate structural families and the constructions. | conjecture (C-1; never a target) |
