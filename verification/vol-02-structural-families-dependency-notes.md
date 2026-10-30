# Dependency notes: vol-02-structural-families

**Paper:** `papers/latex/vol-02-structural-families.tex`
**Module:** `lean/Cmrps/Vol02StructuralFamilies.lean` (namespace `Cmrps.Vol02`)
**Date:** 2026-07-11

## Lean lemma dependencies (within the module)

| Theorem | Uses (Lean) | External inputs |
|---|---|---|
| `FamilyRecord.inducedMap_injective` | `FamilyRecord.inducedMap`, `inducedMap_mk`, `Quotient.inductionOn₂`, `Quotient.sound` | — |
| `FamilyRecord.classifying_iff` | `inducedMap_injective`, `Quotient.exact` | — |
| `FamilyRecord.sharpness_card_bound` | `inducedMap_injective`, `Nat.card_le_card_of_injective`, `Nat.card_eq_fintype_card` (Mathlib) | — |
| `FamilyRecord.sharpness_injects_into_superset` | `inducedMap_injective`, `inducedMap_mk`, `Quotient.out_eq` | — |
| `FamilyRecord.sharpness_uncountable` | `inducedMap_injective`, `Function.Injective.countable`, `Uncountable.not_countable` (Mathlib) | — |
| `globality_symplectic` | `GermInvariant`, `SymplecticGermField.darboux` | C-6 (Darboux) as hypothesis field |
| `achievement_kinds_exhaustive` | `kindOf_applies`, `kindOf_unique` (16+5 case splits on `Bool`/`AchievementKind`) | — |
| `DimensionVector.dimVector_finite` | `encode_injective` (via `Multiset.ext'`, `Multiset.count_eq_zero_of_notMem`), `card_le_totalDim`, `le_totalDim_of_mem`, `sq_le_sum_map`, `Fintype.ofInjective`, `Set.toFinite` | — |
| `DimensionVector.totalDim_sum` | `Multiset.map_add`, `Multiset.sum_add` | — |
| `DimensionVector.totalDim_tensor` | `sum_product_map` (private; `Multiset.cons_product`, `Multiset.map_add`, `Multiset.sum_add`, `Multiset.map_map`, `Multiset.sum_map_mul_left`), `mul_pow` | — |
| `Kraus.kraus_rank_one` | `kraus_rep_one`, `not_kraus_rep_zero`, `List.length_eq_zero_iff` | — |
| `Kraus.kraus_rank_not_injective` | `kraus_rank_one`, `one_unitary`, `P_unitary`, `phi_one`, `phi_P_X_apply`, `phi_one_X_apply`, `Matrix.diagonal_conjTranspose`, `Matrix.diagonal_mul`, `Matrix.mul_diagonal`, `Matrix.diagonal_mul_diagonal`, `Matrix.diagonal_one'` | — |
| `cotangent_retract` | `continuous_retraction`, `retraction_one`, `retraction_zero_mem_zeroSection`, `retraction_comp`, `retraction_fixes_zero_section`, `Continuous.smul`, `Continuous.prodMk`, `smul_smul` | — |
| `exceptional_not_closed` | `Irreducible`, `closedUnder_closure`, `subset_closure` | — |
| `closure_generation` | `subset_closure`, `closure_minimal` | — |
| `not_independent_of_reconstructable` | `Independent`, `Reconstructable` (projections) | — |
| `invariants_not_independence` | `not_independent_of_reconstructable`, `HasClassifyingInvariant`, `Equiv.ulift` | C-3 (Gelfand) for the paper's concrete instance |
| `comparability_of_records` | `subtypeEquivOfEq`, `Equiv.ofInjective`, `Quotient.inductionOn₂`, `Quotient.sound`, `Quotient.out_eq` | — |

## Paper-result dependency structure

| Paper result | Depends on (paper) | Depends on (Lean names) | External input |
|---|---|---|---|
| Thm 3.2 (a) injection | Def. 2.1–2.2 | `FamilyRecord`, `inducedMap_injective`, `classifying_iff` | — |
| Thm 3.2 (b) finite range | Thm 3.2 (a) | `sharpness_card_bound` | — |
| Thm 3.2 (c) constructible image | Thm 3.2 (a), Chevalley | `sharpness_injects_into_superset` | C-1 |
| Thm 3.2 (d) uncountable classes | Thm 3.2 (a) | `sharpness_uncountable` | — |
| Prop. 3.4 globality | Darboux's theorem | `globality_symplectic` | C-6 |
| Cor. 3.5 topological data | Prop. 3.4 | (informal) | — |
| Prop. 3.7 kinds exhaustive | Def. 3.6 | `achievement_kinds_exhaustive` | — |
| Prop. 4.1 cotangent retract | — | `cotangent_retract`, `retraction_comp` | — |
| Thm 7.1 structure + uniqueness | Artin-Wedderburn, C*-identity | (vocabulary `DimensionVector`, `dimVector_finite`) | C-4 |
| Thm 7.1 finiteness at `d` | Thm 7.1 range description | `dimVector_finite` | — |
| Prop. 4.2 induced operations | Thm 7.1, `M_a ⊗ M_b ≅ M_{ab}` | `totalDim_sum`, `totalDim_tensor`, `pos_sum`, `pos_tensor` | C-4, C-5 |
| Prop. 11.2 Kraus rank | Stinespring normal form (for the notion of rank) | `kraus_rank_one`, `kraus_rank_not_injective` | C-2 for the PU(2) statement |
| Prop. 15.1 irreducibles do not close | Def. 2.3 closure | `exceptional_not_closed`, `closure_generation` | — |
| Prop. 16.2 invariants ⇏ independence | Def. 16.1, Gelfand duality | `not_independent_of_reconstructable`, `invariants_not_independence` | C-3 |
| Prop. 18.1 comparability | Thm 3.2 (a) (both records complete) | `comparability_of_records` | — |

## Cross-volume notes

- vol-02 consumes vol-01 ontology vocabulary (records, equivalence, families) as definitions
  only; no vol-01 theorem is imported (there is no cross-module Lean import in either
  direction at this stage).
- Later volumes (vol-03 irreducibility/decomposition, vol-05 classical, vol-06 quantum) may
  instantiate `DimensionVector`, `FamilyRecord`, and `exceptional_not_closed`; those modules
  would import `Cmrps.Vol02StructuralFamilies` after the assembler adds the import list to
  `lean/Cmrps.lean`.
- The Haskell/Python artifacts under `src/vol-02-structural-families/` are computational
  evidence only and are not verified by this module.

## Build/verification boundary

- The module was kernel-typechecked with `lake env lean Cmrps/Vol02StructuralFamilies.lean`
  (exit 0, zero errors; only linter warnings). `lake build` and `lake exe cache get` were NOT
  run, per module-writer rules; the assembler performs the package build and promotes
  `machine-checked (pending build)` labels.
- The module contains no `sorry` and no `axiom`.
