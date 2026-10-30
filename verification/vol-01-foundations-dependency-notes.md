# Dependency notes — vol-01-foundations

Module: `lean/Cmrps/Vol01Foundations.lean`, namespace `Cmrps.Vol01`.
Imports: `Mathlib` (single umbrella import; no project-internal imports —
this module is self-contained and is not imported by any other module).

## Paper-level dependencies (results of vol-01-foundations.tex)

| Result | Depends on |
|---|---|
| Definition 4.3 (concrete laws) | Definition 3.4 (finite classical records) for its point-set form |
| Proposition 4.4 (composition not typed) | Definition 4.3 |
| Corollary 4.5 (schema not category) | Proposition 4.4 |
| Proposition 4.6 (self-composition) | Definition 4.3 |
| Proposition 6.4 (kind categories) | Definition 4.3 + Proposition 4.6 (closure of the three kinds) |
| Proposition 6.5 (conditionality) | Definitions 6.1–6.2 (AC-1…AC-6) |
| Theorem 8.1 (finite classical classification) | Definitions 3.4, 3.12–3.14; Example 7.1 |
| Theorem 8.2 (dynamical decomposition) | Definitions 3.5, 3.12–3.13 |
| Theorem 8.3 (generation) | Theorem 8.1 claim 2 + Theorem 8.2 claim 2 + Example 7.5 (explicitly a corollary) |
| Theorem 8.4 (symmetric classification) | Definition 3.4 + orbit-stabilizer theory (standalone) |
| Example 7.5 (product rule) | Definitions 3.4, 3.12 with product composition |
| Proposition 7.6 (factorisation extra data) | Definition 3.8 (qubit records) + linear algebra of `ℂ²⊗ℂ²` |
| Conjecture 9.2 | Definitions 3.16, 6.3 + Theorems 8.1–8.4 as evidence only |

## Lean lemma dependencies (each theorem → what it uses in the module / Mathlib)

| Lean theorem | Module lemmas used | Mathlib used |
|---|---|---|
| `compositionNotTyped` | `embeddingMap`, `coarseMap`, `IsEmbedding`, `IsCoarseGraining`, `IsEquivalenceMorphism`, `IsDuality`, `IsLimitingProcedure` | `fin_cases`, `Function.Surjective`, `Function.Injective`, `Function.Bijective` |
| `coarseGraining_selfComposition` | — | `Function.Surjective.comp` |
| `embedding_selfComposition` | — | `Function.Injective.comp` |
| `equivalenceMorphism_selfComposition` | — | `Function.Injective.comp`, `Function.Surjective.comp` |
| `identity_of_kind` | — | `Function.Surjective`, `Function.Injective`, `Function.Bijective` |
| `coarseGraining_kindCategory` | `CoarseHom`, `identity_of_kind`, `coarseGraining_selfComposition` | `Function.comp_id`, `Function.id_comp`, `Function.comp_assoc`, `Subtype.ext` |
| `embedding_kindCategory` | `EmbeddingHom`, `identity_of_kind`, `embedding_selfComposition` | same |
| `equivalenceMorphism_kindCategory` | `EquivalenceHom`, `identity_of_kind`, `equivalenceMorphism_selfComposition` | same |
| `conditional_statements` | `ObservableClosure`, `delta` | `fin_cases`, `Pi.add_apply`, `Set.mem_insert_iff` |
| `irreducible_iff_no_sum_split` | `IsIrreducibleDisjointUnion` | `Fintype.card_congr`, `Fintype.card_sum`, `Fintype.card_fin`, `Fintype.card_pos_iff`, `Fintype.card_eq`, `omega` |
| `irreducible_iff_card_eq_one` | `IsIrreducibleDisjointUnion` | `omega` |
| `iso_iff_card_eq` | — | `Fintype.card_eq` |
| `onePoint_decomposition_unique` | — | `Fintype.card_congr`, `Fintype.card_sigma`, `Finset.sum_const`, `Finset.card_fin` |
| `onePoint_factors_iso` | — | `Fintype.card_eq`, `Fintype.card_fin` |
| `card_classifies_quotient` | `iso_iff_card_eq` | `Fintype.card_fin` |
| `step_symm`, `reachable_symm`, `reachable_pre` | `Step` | `Relation.ReflTransGen` (`.refl`, `.single`, `.trans`, induction) |
| `irreducible_iff_connected` | `Step`, `WeaklyConnected`, `IsIrreducibleDyn`, `reachable_symm`, `reachable_pre` | `Relation.ReflTransGen`, `Set.inter_compl_self`, `Set.union_compl_self`, `Set.mem_empty_iff_false`, `push Not` |
| `reachableClass_eq_of_reach` | `reachableClass`, `reachable_symm` | `Set.eq_of_subset_of_subset`, `Relation.ReflTransGen.trans` |
| `class_eq_of_mem` | `reachableClass`, `DynDecomposition`, `reachable_symm`, `reachable_pre` | `Set.mem_empty_iff_false`, `Set.mem_compl` (via `simpa`) |
| `components_unique` | `class_eq_of_mem`, `reachableClass`, `DynDecomposition` | `Finset.ext`, `Set.eq_of_subset_of_subset` |
| `components_exist` | `reachableClass`, `DynDecomposition`, `reachableClass_eq_of_reach`, `reachable_symm` | `Finset.mem_image`, `Finset.mem_univ`, `Set.eq_empty_iff_forall_notMem`, `Relation.ReflTransGen`, `classical` (DecidableEq on `Set X`) |
| `irreducibleProduct_iff_prime_card` | `IsIrreducibleProduct` | `Nat.prime_def_lt'`, `Nat.Prime.eq_one_or_self_of_dvd`, `Nat.Prime.two_le`, `Nat.Prime.ne_zero`, `Nat.pos_of_ne_zero`, `Nat.mul_left_cancel`, `omega`, `Nat.dvd` destructuring (`b = a * c` orientation) |
| `prime_factorization` | — | `Nat.prod_primeFactorsList`, `Nat.prime_of_mem_primeFactorsList` |
| `prime_factorization_unique` | — | `Nat.primeFactorsList_unique` (fundamental theorem of arithmetic) |
| `changeFactorization_involutive` | `changeFactorization`, `hadamard_involutive`, `sq_sqrt_two` | `Matrix.ext`, `fin_cases`, `Real.sq_sqrt`, `Complex.ofReal_mul`, `field_simp`, `ring` |
| `changeFactorization_psi` | `changeFactorization`, `psiFirst`, `psiSecond` | `fin_cases`, `simp` |
| `reducedDiag_first` | `reducedDiag`, `reducedOffDiag`, `psiFirst` | `Fin.sum_univ_two`, `fin_cases` |
| `reducedDiag_second` | `reducedDiag`, `reducedOffDiag`, `psiSecond`, `norm_psiSecond` | `Fin.sum_univ_two`, `Complex.norm_real`, `Real.norm_eq_abs`, `Real.sq_sqrt`, `norm_div`, `norm_one` |
| `isUnitState_psi` | `IsUnitState`, `psiFirst`, `psiSecond`, `norm_psiSecond` | `Fin.sum_univ_two`, `norm_num` |
| `factorization_nonunique` | all of target 10 | `Real.log_inv`, `Real.log_one`, `Real.log_zero`, `ring` |

## Cross-module dependencies

None. `Cmrps.Vol01Foundations` is the definitional root of the series and does
not import any other `Cmrps.*` module. Later volumes are expected to import it
for: `FinRec`, the five `Is…` morphism predicates, `CategoryData`,
`ObservableClosure`/`delta`, `IsIrreducibleDisjointUnion`,
`IsIrreducibleProduct`, `Step`/`WeaklyConnected`/`IsIrreducibleDyn`,
`reachableClass`/`DynDecomposition`, and the qubit coefficient-matrix layer.

## Build/verification note

Per the module-writer role, `lake build` and `lake exe cache get` were **not**
run; the assembler owns the package build. The module was additionally
type-checked standalone with `lake env lean Cmrps/Vol01Foundations.lean`
against the prebuilt Mathlib oleans (exit 0, no warnings, no `sorry`). This is
a file-level elaboration check only, not the assembler's gate.
