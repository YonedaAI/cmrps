# Claim status — vol-10-observational-equivalence

**Module:** lean/Cmrps/Vol10ObservationalEquivalence.lean (namespace `Cmrps.Vol10`)
**Date:** 2026-10-30
**Labels:** `machine-checked` (kernel-accepted statement in the module, no
`sorry`; assembler promotes to `machine-checked` after `lake build` exits 0) ·
`complete-informal-proof` (proved in the cited literature, not formalized here) ·
`conditional` (depends on an unfixed stipulation or on literature input recorded as a
hypothesis) · `conjecture` · `computational-evidence` (checked only by the paper's
executable code) · `open-problem`.

Every statement below is the exact Lean name where one exists. All ten mechanization
targets are covered: seven as machine-checked theorems, three (Etingof–Gelaki,
Chentsov, Petz–Sudar) as honest skeletons — explicit hypothesis data or statement
predicates — with the classical literature input recorded rather than proved. Nothing in
the module uses `sorry` or new axioms.

## Formalized claims (Lean)

| Name | One-line statement | Label |
|---|---|---|
| `SystemRecord` | Def. 2.1: a system record is a five-tuple `P = (X, O, D, S, C)` of state space, observables, dynamics, symmetry data, composition rules. | machine-checked |
| `AdmissibleCandidate` | Def. 2.5: `≅ ⊆ ≃ ⊆ ⋂_{Obs ∈ A} ≈_Obs` — a candidate relation sits between tuple isomorphism and the intersection of admissible observational relations. | machine-checked |
| `EquivalenceNotion` / `MorphismKind` / `PreservedLayer` / `EquivalenceWitness` / `DeclaresSymmetric` | Defs. 2.6–2.7 and Table 3: an equivalence witness names its notion, morphism kind, and preserved layers (the eight layers of Table 3); declaring the symmetric monoidal layer is `DeclaresSymmetric`. | machine-checked |
| `ObservationFunctor` | Def. 4.1, skeletal form: a functor `obs : S → R` into records with record comparison abstracted as record isomorphism (an equivalence relation). | machine-checked |
| `obsEquiv` | Def. 2.4: `P ≈ Q` iff `Obs P ≅ Obs Q` as records. | machine-checked |
| `obs_induced_equivalence` (target 1) | Prop. 4.2: the pullback of record isomorphism along an observation functor is an equivalence relation on systems. | machine-checked |
| `obs_class_fibers` (target 1) | Prop. 4.2: `P ≈ Q` holds exactly when the record isomorphism classes `[Obs P]` and `[Obs Q]` coincide. | machine-checked |
| `obs_quotient_factor` (target 1) | Prop. 4.2 universal property: every map constant on `≈`-classes factors uniquely through the quotient by `≈`. | machine-checked |
| `ObservationFunctor.prod` | Lemma 4.3 setup: the product of two observation functors is an observation functor into the product of the record categories. | machine-checked |
| `obs_products_intersection` (target 2) | Lemma 4.3: the relation of a product of observation functors is the intersection of the two factor relations. | machine-checked |
| `Coarsening` | Def. 4.4: a coarsening is a forgetting map `h` on records with `Obs_c = h ∘ Obs_f`. | machine-checked |
| `obs_coarse_graining_composition` (target 3) | Prop. 4.5 inclusion: if `Obs_c = h ∘ Obs_f` and `h` preserves record isomorphism, then fine equivalence implies coarse equivalence. | machine-checked |
| `obs_coarse_witness` (target 3) | Prop. 4.5 strictness, §9.1 four-point witness: `p = (1/2,1/4,1/8,1/8)` and `q = (1/4,1/2,1/8,1/8)` share the `e1 = {{1,2},{3,4}}` record but differ on `e2 = {{1,3},{2,4}}`; the inclusion of relations is strict. | machine-checked |
| `ObservationFunctor.compProd` | Prop. 4.6 setup: the observation functor of a composite whose record is the product of the factor records. | machine-checked |
| `obs_composed_product_preserved` (target 4) | Prop. 4.6 positive direction: under product records, indistinguishability of the factors is preserved on composites. | machine-checked |
| `obs_composed_experiments_failure` (target 4) | Prop. 4.6 failure witness: factor records of `p`, `q` under `e1` coincide, yet the diagonal joint event reports `11/32` under `p × p` and `9/32` under `p × q`, separating the composites. | machine-checked |
| `PlainTensorCounterexample` | Thm 3.1 hypothesis data: non-isomorphic groups whose representation categories are equivalent as plain tensor categories (the Etingof–Gelaki construction packaged as explicit input). | conditional |
| `eg_plain_tensor_insufficient` (target 5) | Thm 3.1, conditional form: plain tensor equivalence does not detect group isomorphism — an equivalence forgetting the symmetric structure cannot recover the group. | machine-checked (conditional statement; counterexample existence is `complete-informal-proof`, see C-1) |
| `preserved_layer_discipline` (target 6) | Cor. 3.2, conditional form: a candidate whose identifications ride on plain-tensor equivalence (layers omitting the symmetric monoidal layer) identifies systems whose observable group data differ, and cannot justify the identification. | machine-checked (conditional statement; rests on C-1) |
| `fisherForm` | §5.1: the Fisher form `g_p(a,a) = ∑ a_i² / p_i` on the simplex. | machine-checked |
| `chentsov_fisher_uniqueness` (target 7) | Thm 5.1 statement skeleton (predicate `monotone` external): every monotone metric is a positive multiple of the Fisher form. | complete-informal-proof (statement formalized as a predicate, unproved; Chentsov via Petz–Sudar, arXiv:quant-ph/0102132 — see C-2) |
| `mcTerm` / `mcQuadratic` | §5.2: the Morozova–Chentsov quadratic form `g_f^ρ(A,A) = ∑_{i,j} A_ij² / (λ_j f(λ_i/λ_j))`. | machine-checked |
| `NormalizedAtOne` / `SelfReciprocal` / `petzTranspose` | §5.2 vocabulary: `f(1) = 1`, Petz self-reciprocity on the positive domain `x > 0`: `f(x) = x f(x⁻¹)`, and the transpose `f^#`. | machine-checked (definitions) |
| `petz_sudar_parametricity` (target 8) | Thm 5.2 statement skeleton (operator monotonicity an explicit parameter): for `n ≥ 2`, monotone metrics correspond to normalized self-reciprocal operator-monotone `f`, and distinct such `f` give distinct metrics on symmetric directions at positive eigenvalues. | complete-informal-proof (statement formalized as a predicate, unproved; Petz–Sudar — see C-3) |
| `petz_transpose_same_form` (target 8) | Thm 5.2 proof ingredient: `f` and its Petz transpose `f^#` yield the same quadratic form on symmetric (self-adjoint) directions, so self-reciprocity `f = f^#` is the correct normalization. | machine-checked |
| `monotone_commutative_restriction` (target 9) | Prop. 5.3: for `f(1) = 1` (operator monotonicity not needed for the computation), the quadratic form on diagonal directions is the classical Fisher form `∑ A_ii² / λ_i`. | machine-checked |
| `commutative_restriction_is_fisher` (target 9) | Prop. 5.3 restated: the commutative restriction equals `fisherForm lam (fun i => A i i)` exactly. | machine-checked |
| `fRat` / `hRat` / `rhoDiag` / `sigmaX` | Ex. 5.4 data: `f(x) = 2x/(1+x)`, `h(x) = (1+x)/2`, `ρ = diag(3/4,1/4)`, `A = σ_x`. | machine-checked |
| `monotone_not_canonical` (target 10) | Ex. 5.4: at `ρ = diag(3/4,1/4)`, `A = σ_x` the quadratic forms of `f` and `h` are `16/3` and `4`, and `16/3 ≠ 4`. | machine-checked |
| `monotone_ruler_dependence` | Cor. 5.5: the two admissible rulers disagree at the same state and direction, so the numerical scale of "the monotone-metric distance" is not a function of the states alone. | machine-checked |

## Skipped or only-informal claims

| Name | One-line statement | Label |
|---|---|---|
| Thm 3.1 existence clause | There exist non-isomorphic finite groups with equivalent plain tensor representation categories (Etingof–Gelaki isocategorical construction, arXiv:math/0007196). | complete-informal-proof (packaged as `PlainTensorCounterexample` hypothesis data; construction not formalized — C-1) |
| Thm 5.1 rigidity clause | Chentsov's rigidity argument classifying monotone metrics on the classical simplex. | complete-informal-proof (C-2) |
| Thm 5.2 classification clause | Every quantum monotone metric arises from a normalized self-reciprocal operator monotone `f` (Morozova–Chentsov/Petz). | complete-informal-proof (C-3) |
| Rem. 3.3 (scope) | With the symmetric structure restored, representation categories of the stated kind are equivalent to representations of a compact supergroup (Doplicher–Roberts). | complete-informal-proof (C-4) |
| Def. 4.1, full categorical form | Observation functor as a genuine functor `Phys_adm → 𝒪bs` between categories; the module uses the skeletal equivalence-relation form (record iso abstracted as an equivalence relation). | machine-checked (skeletal form only) |
| §5.4 tolerance non-transitivity | On a connected state space, `{(ρ,σ) : d_f(ρ,σ) ≤ ε}` is not transitive for `ε > 0`. | conjecture (not formalized; plausible analysis — C-5) |
| §9.1 class geometry | The fine class of `p` over `{e1,e2}` is the segment `p(t)`, `t ∈ [-1/8, 1/8]`, and `e3` separates its points. | computational-evidence (paper's `observation_quotient.py`; arithmetic not formalized) |
| §9.3 groups of order 8 | `D8` and `Q8` share character tables as matrices and differ on element orders. | computational-evidence (paper's `invariant_coarseness.py`; not formalized — C-6) |
| §9.4 three-system illustration | Over `e1` the relation identifies `p ~ q` and separates `r`; over `e2` it identifies `p ~ r`; over the product only the identity remains. | computational-evidence (paper arithmetic; the mechanism itself is `obs_products_intersection`) |
| Correct choice of `≃` | Which candidate relation is physical equivalence. | open-problem (C-7) |
| Record category under interaction | Whether bounded experimental indistinguishability composes in interacting regimes. | open-problem (C-8) |
| Positive reconstruction criterion | A criterion for "the same physical system" surviving the screening protocol of §6.1. | open-problem (C-9) |
| System-level duality pair | Two system records, non-isomorphic, declared physically equivalent (would close Table 4 row 1). | open-problem (C-10) |
