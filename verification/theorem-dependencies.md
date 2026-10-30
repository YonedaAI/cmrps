# Theorem dependencies (cross-volume record)

Consolidated by the Lean assembler from the per-topic
`verification/<topic>-dependency-notes.md` files. The twelve Lean modules are
**self-contained** (each imports Mathlib only; there are no `Cmrps.*`-internal
cross-imports), so every cross-volume dependency below is at the level of the
paper series, not of Lean `import` statements. The single package-level import
edge is `Cmrps.lean` → each volume module (assembler root).

## Package structure

| Volume | Module | Lean imports | Role |
|---|---|---|---|
| vol-01-foundations | `lean/Cmrps/Vol01Foundations.lean` | Mathlib only | self-contained |
| vol-02-structural-families | `lean/Cmrps/Vol02StructuralFamilies.lean` | Mathlib only | self-contained |
| vol-03-irreducibility-decomposition | `lean/Cmrps/Vol03IrreducibilityDecomposition.lean` | Mathlib only | self-contained |
| vol-04-yoneda-classification | `lean/Cmrps/Vol04YonedaClassification.lean` | Mathlib only | self-contained |
| vol-05-classical-systems | `lean/Cmrps/Vol05ClassicalSystems.lean` | Mathlib only | self-contained |
| vol-06-quantum-systems | `lean/Cmrps/Vol06QuantumSystems.lean` | Mathlib only | self-contained |
| vol-07-gauge-qft | `lean/Cmrps/Vol07GaugeQft.lean` | Mathlib only | self-contained |
| vol-08-spacetime-reconstruction | `lean/Cmrps/Vol08SpacetimeReconstruction.lean` | Mathlib only | self-contained |
| vol-09-gravity-information-geometry | `lean/Cmrps/Vol09GravityInformationGeometry.lean` | Mathlib only | self-contained |
| vol-10-observational-equivalence | `lean/Cmrps/Vol10ObservationalEquivalence.lean` | Mathlib only | self-contained |
| vol-11-completeness-obstructions | `lean/Cmrps/Vol11CompletenessObstructions.lean` | Mathlib only | self-contained |
| vol-12-principia-physica | `lean/Cmrps/Vol12PrincipiaPhysica.lean` | Mathlib only | self-contained |


## vol-01-foundations (`Cmrps.Vol01`)

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


## vol-02-structural-families (`Cmrps.Vol02`)

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


## vol-03-irreducibility-decomposition (`Cmrps.Vol03`)

| Lean claim | Mathlib lemmas used |
|---|---|
| `finrank_blockAlg` | `Module.finrank_pi_fintype`, `Module.finrank_matrix`, `Fintype.card_fin`, `Module.finrank_self`, `pow_two` |
| `starBlock_involutive` | `Matrix.conjTranspose_conjTranspose` (via `simp`) |
| `starBlock_mul` | `Matrix.conjTranspose_mul`, pi-type `Mul` |
| `dimVector_perm_invariant` | `Multiset.map_map`, `Finset.map_val`, `Finset.map_univ_equiv` |
| `dimVector_sum_elim` | `Finset.univ_disjSum_univ`, `Finset.val_disjSum`, `Multiset.disjSum` (def), `Multiset.map_add`, `Multiset.map_map` |
| `dimVector_prod` | `Finset.mem_product`, `Multiset.product` (def), `Multiset.map_bind`, `Multiset.bind_map`, `Multiset.map_map`, `Function.comp` |
| `finrank_tensor_blocks` | `Module.finrank_tensorProduct`, `Module.finrank_matrix`, `pow_two`, `mul_comm/mul_left_comm` |
| `sum_two_sq_eq_eight` | `norm_num` |
| `ne_eight_of_sq` | `Nat.mul_le_mul`, `omega` |
| `two_two_blocks_ne_tensor_block` | `LinearEquiv.finrank_eq`, `finrank_blockAlg`, `Fin.sum_univ_two`, `Fin.sum_univ_one`, `ne_eight_of_sq` |
| `rankMatrix_colSum` | definitional (`MultiplicityMatrix.column_sum`) |
| `multiplicity_example_44`, `multiplicity_col_sum_one/two` | `omega`, `Prod.mk.injEq` |
| `multiplicity_diagonal_unique` | `omega` |
| `blockPerm`, `mem_blockPerm` | `Subgroup` constructor, `Equiv.Perm` application, `Equiv.apply_symm_apply` (via `simpa`) |
| `mem_sizeSemigroup_of_mem` | `Submonoid.subset_closure` |
| `one_mem_sizeSemigroup` | `Submonoid.one_mem` |
| `mul_mem_sizeSemigroup` | `mul_mem` (exported `MulMemClass.mul_mem`) |
| `closedVectors_add` | `Multiset.mem_add` |
| `closedVectors_pairwiseProd` | `Multiset.mem_bind`, `Multiset.mem_map`, `mul_mem` |
| `closedVectors_singleton` | `Multiset.mem_singleton` |
| `mem_sizeSemigroup_one_two` | `Submonoid.closure_induction`, `pow_mem`, `pow_add` |
| `two_pow_ne_three` | `Nat.two_pow_pos`, `omega`, `ring` |
| `three_not_mem_sizeSemigroup_one_two` | `mem_sizeSemigroup_one_two`, `two_pow_ne_three` |


## vol-04-yoneda-classification (`Cmrps.Vol04`)

| Mathlib item | Used for |
|---|---|
| `CategoryTheory.yoneda`, `CategoryTheory.yonedaEquiv` | `relationalProfile`, `yoneda_nat_iso` (Theorem 3.1 is exactly `yonedaEquiv`) |
| `CategoryTheory.Yoneda.fullyFaithful`, `Functor.FullyFaithful.preimageIso`, `Functor.mapIso` | `yoneda_reflects_iso`, `relational_characterization` |
| `CategoryTheory.Functor.whiskeringLeft`, `Functor.op` | `restrictedProfile`, `restrictedYoneda` |
| `yoneda_preservesLimits`, `Limits.PreservesLimitPair.iso`, `Limits.PreservesTerminal.iso` | `profile_limit_preservation`, `profile_prod_iso`, `profile_terminal_iso` (Proposition 3.7) |
| `Discrete`, `Discrete.functor`, `Discrete.eq_of_hom` | the Proposition 3.6 gap witness |
| `Matrix.single` (+ `single_apply`, `single_apply_of_ne`), `Matrix.trace` (+ `trace_smul`, `trace_sum`), `Matrix.one_apply`, `Matrix.sum_apply` | Choi block |
| `MvPolynomial.eval` | `FiniteVarietyType` (Definition 3.8) |

| Theorem | Lemmas used |
|---|---|
| `yoneda_nat_iso` | Mathlib `yonedaEquiv` |
| `yoneda_fully_faithful` | Mathlib `yonedaEquiv.symm` |
| `yoneda_reflects_iso` | Mathlib `Yoneda.fullyFaithful.preimageIso`, `yoneda.mapIso` |
| `relational_characterization` | `yoneda_reflects_iso` |
| `restricted_faithful_separates` | `restrictedYoneda`, `FullyFaithful.preimageIso` |
| `profile_restriction_gap` | `gapProbe`, `emptyTypeIso`, `eq_of_isEmpty_hom`, `NatIso.ofComponents` |
| `profile_limit_preservation` | Mathlib `yoneda_preservesLimits` |
| `profile_prod_iso` / `profile_terminal_iso` | Mathlib `PreservesLimitPair.iso` / `PreservesTerminal.iso` + `yonedaFunctor_preservesLimits` |
| `choi_correspondence` | `choiMatrix`, `ofChoi`, `sum_single_smul`, `map_eq_sum_single` |
| `choi_composition` | `map_eq_sum_single` |
| `choi_trace_preserving` | `e1` (entrywise partial-trace identity), `trace_single`, `sum_single_smul`, `map_eq_sum_single`, `key` |


## vol-05-classical-systems (`Cmrps.Vol05`)

| Result | Depends on |
|---|---|
| Thm. 3.3 (Darboux) | Lem. 3.1 (linearization) + Lem. 3.2 (Moser trick on a ball); de Rham `H² = 0` on a contractible ball |
| Cor. 3.4 (no local invariants) | Thm. 3.3 |
| Thm. 4.1 (Weinstein) | Weinstein 1983; `[π, π] = 0` as integrability |
| Prop. 4.2 (leaf foliation) | Thm. 4.1's mechanism (Stefan–Sussmann) |
| Thm. 4.4 (KKS) | linear algebra: stabilizer `g_ξ` = radical of `(x, y) ↦ ⟨ξ, [x, y]⟩` |
| Prop. 4.5 (Casimirs) | bracket definition; `so(3)` case is the triple-product identity |
| Thm. 5.1 (Moser stability) | Lem. 3.2 argument on closed `M` |
| Ex. 5.3, 5.4, Cor. 5.2 | Thm. 5.1 |
| Thm. 6.2 (Weyl chamber) | Thm. 4.4 + Killing–Cartan + highest-weight + Borel–Weil |
| Thm. 7.2 (Liouville–Arnold) | Arnold 1978; commuting flows give `T^n`-action |
| Prop. 7.3 (periods) | Thm. 7.2's coordinates |
| Prop. 7.4 (monodromy) | Duistermaat 1980; focus-focus singularity of Ex. 7.5 |
| Thm. 8.4 (Chentsov) | Lem. 8.5 (equality along sufficient statistics) + cross-dimension compatibility hypothesis |
| Cor. 8.7 | Thm. 8.4 |
| Prop. 8.9 (products) | direct computation with `Σu = Σv = 0`, `Σp = Σq = 1` (no external results) |
| Prop. 9.2 (surfaces) | dimension parity under products |
| Prop. 9.3, 9.5 (reduction) | Marsden–Weinstein 1974 |
| Thm. 9.8 (Delzant) | Delzant 1988 |

| Theorem | Uses |
|---|---|
| `fisherMetric_self_nonneg` | `Finset.sum_nonneg`, `div_nonneg`, `mul_self_nonneg` |
| `fisherMetric_self_eq_zero` | `Finset.sum_eq_zero_iff_of_nonneg`, `div_eq_zero_iff`, `mul_self_eq_zero` |
| `fisherMetric_example_three`, `fisherMetric_example_uniform` | `Fin.sum_univ_three`, `Matrix.cons_val_zero`, `norm_num` |
| `mulVec_mem_openSimplex` | `openSimplex_index_nonempty`, `Matrix.mulVec_apply_eq_sum`, `Finset.sum_comm`, `Finset.sum_mul`, `Finset.sum_pos` |
| `monotoneMetric_equality_of_leftInverse` | `MonotoneMetric.monotone` (twice), `Matrix.mulVec_mulVec`, `Matrix.one_mulVec`, `le_antisymm` |
| `fisherMetric_product` | `Finset.sum_product`, `Finset.sum_add_distrib`, `Finset.mul_sum`, `Finset.sum_mul`, `Finset.sum_comm`, `field_simp`, `ring` |
| `fisherMetric_gap_eq_sum_squares` | `Matrix.mulVec_apply_eq_sum`, `Finset.sum_comm`, `Finset.mul_sum`, `Finset.sum_mul`, `Finset.sum_add_distrib`, `Finset.sum_sub_distrib`, `mul_div_assoc`, `mul_comm`, `field_simp`, `ring` |
| `fisherMetric_monotone` | `fisherMetric_gap_eq_sum_squares`, `Finset.sum_nonneg`, `mul_nonneg`, `sq_nonneg`, `linarith` |
| `SymplecticForm.skew` | `alternating`, `map_add`, `LinearMap.add_apply`, `linarith` |
| `stdSymplecticForm` | `LinearMap.mk₂`, `Prod.fst_add`, `Prod.snd_add`, `Pi.add_apply`, `Prod.smul_fst`, `Prod.smul_snd`, `Pi.smul_apply`, `Finset.sum_add_distrib`, `Finset.mul_sum`, `Finset.sum_eq_zero`, `Finset.sum_ite_eq'`, `ring` |
| `exists_symplectic_partner` | `SymplecticForm.nondegenerate`, `map_smul`, `inv_mul_cancel₀` |
| `kksForm_self` | `lie_self` |
| `kksForm_skew` | `lie_skew`, `map_neg` |
| `kksForm_eq_of_sub_mem_stabilizer` | `sub_lie`, `map_sub`, `linarith` |
| `liePoissonLinear_bracket` | `rfl` (definitional bridge to `kksForm`) |
| `liePoissonLinear_antisymm` | `LinearMap.ext`, `lie_skew`, `map_neg` |
| `so3_casimir` | `Matrix.dot_self_cross` (Mathlib `LinearAlgebra.CrossProduct`) |
| `pendulumMonodromy_det` | `Matrix.det_fin_two_of`, `norm_num` |
| `pendulumMonodromy_ne_one` | `congrArg`, `Matrix.one_apply` (via `simp`), `pendulumMonodromy` |
| `pendulumMonodromy_unipotent` | `Matrix.sub_apply`, `Matrix.mul_apply`, `Fin.sum_univ_two`, `fin_cases`, `pow_two` |


## vol-06-quantum-systems (`Cmrps.Vol06`)

| Paper | Lean identifier |
|---|---|
| Definition 2.4 (`dimvec`) | `DimensionVector`, `ValidDimvec`, `algebraDim` |
| Definition 2.3 (observable algebra, block form) | `BlockAlgebra` |
| Corollary 3.2 (`dim A = Σ n_i²`) | `finrank_blockAlgebra`, `algebraDim_ofFn` |
| Theorem 3.1 / Corollary 3.2 (classification) | `dimvec_classifies_sorted` (combinatorial half only) |
| Corollary 3.6 / Table 2 | `dimVecs`, `dimVectorsOfDim`, `dimVectorsOfDim_four/eight/twelve`, `algebraDim_eq_of_mem_dimVecs` |
| Example 3.4 | `dim4_vector_dimension_not_classifying` |
| Proposition 3.11 | `tensorDimvec`, `algebraDim_tensor`, `tensorDimvec_perm` |
| Lemma 6.1 (`J(Φ)`, `Tr_m`) | `choi`, `partialTrace₂`, `choi_tracePreserving` (TP half), `partialTrace₂_choi_apply` |


## vol-07-gauge-qft (`Cmrps.Vol07`)

| Item | Value |
|---|---|
| Lean toolchain | leanprover/lean4:v4.35.0 (lean/lean-toolchain) |
| Mathlib | pinned rev `56a005855ea17e0b0958f73ec801ae140b0a1679` (lean/lake-manifest.json) |
| `lake build` | NOT run by the module writer (assembler owns the build) |
| `lake exe cache get` | NOT run by the module writer |
| Single-file check | `lake env lean Cmrps/Vol07GaugeQft.lean` (read-only elaboration, no build artifacts) exited 0 with no errors and no warnings at the pinned rev |
| `sorry` | none in the module |
| Axioms | none beyond the `structure` fields of `FrobeniusAlgebra`, `AnomalyData`, `AnomalyObstruction`, `GlobalFormInvariant` (listed as fields, used as data) |

| Import | Supplies |
|---|---|
| `Mathlib.Algebra.Algebra.Basic` | `Algebra k A`, `Module k A` via algebra |
| `Mathlib.Algebra.Module.LinearMap.Defs` | `LinearMap`, `A →ₗ[k] k` |
| `Mathlib.Algebra.BigOperators.Group.Finset.Basic` | `∑ i, _` over `Fintype`, `Finset.sum_eq_zero`, `map_sum` |
| `Mathlib.Algebra.BigOperators.Group.List.Defs` | additive names `List.sum_append` etc. |
| `Mathlib.Algebra.Group.Subgroup.Ker` | `AddMonoidHom.ker`, `AddMonoidHom.mem_ker` |
| `Mathlib.Data.ZMod.Basic` | `ZMod 2`, `ZMod.card` |

| Result | Depends on |
|---|---|
| thm:killing-cartan | Root-system classification, Serre presentation, Cartan's theorem on real forms (Humphreys, Serre); standalone in the volume |
| thm:highest-weight | thm:killing-cartan only for ambient setup; internally: classification by highest weight + Borel–Weil / Verma module existence (Humphreys) |
| thm:bundles | Milnor join construction (numerable universal bundle), Dold–Steenrod homotopy invariance of pullbacks; standalone |
| prop:spheres | thm:bundles + long exact homotopy sequence of G → EG → BG with EG contractible |
| ex:line | prop:spheres (U(1), n = 2) + first Chern class |
| ex:instanton | prop:spheres (SU(2), n = 4) + second Chern class |
| ex:global-form | prop:spheres (SO(3) and SU(2), n = 2) + π₁(SO(3)) ≅ Z/2, π₁(SU(2)) = 0 |
| def:gauge-equivalence | standalone definitional |
| prop:classical-classes | splitting principle, Chern–Weil theory (Milnor–Stasheff) |
| def:fermionic-anomaly | Quillen determinant line, Atiyah–Singer index theory |
| def:bvbrst-anomaly | Wess–Zumino consistency, Barnich–Brandt–Henneaux local BRST cohomology, Chevalley–Eilenberg complex of the gauge algebra |
| prop:anomaly | def:fermionic-anomaly + def:bvbrst-anomaly (the two obstructions are the gate) |
| prop:cancellation | thm:highest-weight (basis of irreducibles) + prop:anomaly (the anomaly computation α) |
| ex:abelian-anomaly | def:bvbrst-anomaly (Chevalley–Eilenberg shadow only) |
| thm:frobenius | Atiyah axioms + Frobenius identity; standalone |
| conj:cobordism | none proved; stands alone as a conjecture |
| def:local-net | Haag–Kastler axioms |
| def:dhr | def:local-net |
| thm:dr | def:dhr + Haag duality + symmetric C*-tensor category structure (Doplicher–Roberts) |
| thm:deligne | Tannakian theory; standalone |
| thm:gelfand | Gelfand–Naimark + Stone duality; standalone |

| Lean declaration | Uses |
|---|---|
| `highestWeightRankOne` | `Subtype.ext`, `Fin.fin_one_eq_zero`, `Int.toNat_of_nonneg`, `Int.toNat_natCast`, `Int.natCast_nonneg` |
| `FrobeniusAlgebra.pairing_comm` | `mul_comm` |
| `FrobeniusAlgebra.nondegenerate_left` | field `left_dual`, `Finset.sum_eq_zero`, `zero_smul`, simp on `h` |
| `FrobeniusAlgebra.nondegenerate_right` | `nondegenerate_left`, `mul_comm` |
| `FrobeniusAlgebra.exists_pairing_ne_zero` | `nondegenerate_right`, `Classical.byContradiction` |
| `FrobeniusAlgebra.genusOne_eq` | defs `euler`, `genusOne`, `map_sum` |
| `gaugeAction_one` | `Pi.one_apply`, `one_smul` |
| `gaugeAction_mul` | `Pi.mul_apply`, `mul_smul` |
| `gaugeEquiv_refl` | `gaugeAction_one` |
| `gaugeEquiv_trans` | `gaugeAction_mul` (compose in order g₂ * g₁) |
| `gaugeEquiv_symm` | `congrFun`, `inv_smul_smul` |
| `anomaly_free_iff_mem_ker` | `AddMonoidHom.mem_ker`, def `AnomalyFree` |
| `anomaly_free_zero` | `map_zero` |
| `anomaly_free_add` | `map_add` |
| `anomaly_free_neg` | `map_neg`, `neg_zero` |
| `map_list_sum` | induction on `List`, `List.sum_cons`, `List.map_cons`, `map_add` |
| `anomaly_free_list_iff_sum_map` | `map_list_sum` |
| `anomaly_free_list_iff_mem_ker` | `AddMonoidHom.mem_ker` |
| `anomaly_free_list_nil` | `List.sum_nil`, `map_zero` |
| `anomaly_free_list_append` | `List.sum_append`, `map_add` |
| `quantization_gate_iff` | def `QuantizationGate` (Iff.rfl) |
| `not_quantization_gate_of_ne_zero` | def `QuantizationGate` |
| `not_quantization_gate_of_not_trivial` | def `QuantizationGate` |
| `quantization_gate_iff_anomalyFree` | defs `QuantizationGate`, `AnomalyData.AnomalyFree` (Iff.rfl) |
| `so3_w2_detection` | `ZMod 2` decidable equality (`by decide`) |
| `so3_two_classes` | `ZMod.card 2` |
| `w2_detects_nontrivial` | field `w2_trivial` |
| `su2_bundles_over_s2_trivial` | `PUnit` case analysis |

| Lean row | What it proves | What it does NOT prove |
|---|---|---|
| `highestWeightRankOne` | rank-one dominant weights ↔ ℕ | existence/uniqueness of irreps for general semisimple g |
| `FrobeniusAlgebra.*` | symmetric nondegenerate pairing from dual bases; genus-one scalar | the equivalence of categories "2D TQFT ↔ Frobenius algebra" (thm:frobenius full statement) |
| `gaugeAction_*`, `GaugeEquiv_*` | pointwise action laws and equivalence laws | the geometric definition via bundle automorphisms of a principal bundle |
| `AnomalyData.*`, `QuantizationGate.*` | kernel/additivity and the two-condition gate as logic | the determinant line of a Dirac family, H^{1,n}(s|d), Wess–Zumino consistency |
| `GlobalFormInvariant.*`, `SU2BundleClass` | Z/2 detection logic and two/one class models | π₁(SO(3)) ≅ Z/2, π₁(SU(2)) = 0, Stiefel–Whitney class of the tangent 2-plane bundle |


## vol-08-spacetime-reconstruction (`Cmrps.Vol08`)

| Result | Depends on |
|---|---|
| Prop 6.3 (prop:finiteposet) | Order axioms + finiteness only; no geometry |
| Prop 6.4 (prop:distinguish) | Def 2.3 (strict reading of the ladder); self-contained |
| Cor 6.5 (cor:notransfer) | Prop 6.3 + Prop 6.4, contrasted with Thm 6.1 (thm:ladder, cited) |
| Thm 8.1 (thm:cone) | Def 2.6, which is defined through the RT proposal (C-1); conditional framing |
| Prop 8.2 (prop:mmi) | Def 2.5 only (explicit vector computation) |
| Prop 8.4 (prop:mmiform) | Def 2.5 (algebraic rearrangement) |
| Lemma 8.5 (lem:ssaredundant) | Prop 8.4 + subadditivity |
| Lemma 8.6 (lem:witnessclean) | Prop 8.2 + Def 2.5 |
| Cor 9.2 (cor:confactor) | Thm 9.1 (thm:malament, cited) |
| Prop 9.4 (prop:specialization) | Order theory only (up-set topology of P. S. Alexandroff) |
| Cor 7.4 (cor:dimcontrast) | Thm 7.1 (thm:geometrization, cited) + Thm 7.3 (thm:tancer, cited) |
| Prop 4.1 (prop:incomplete) | Flat geometry + fundamental groups; self-contained in paper |

| Theorem | Uses |
|---|---|
| `no_increasing_loop` | `lt_trans`, `lt_asymm`, `lt_irrefl` (Mathlib preorder facts), induction on ℕ, `omega` |
| `interval_finite` | `Set.toFinite`, instance `Subtype.finite` |
| `interval_compact` | `interval_finite`, `Set.Finite.isCompact` |
| `antichain_fails_distinguishing` | `Past`/`Future` definitions; `rfl` on empty setOf |
| `ladder_nontransfer_finite_orders` | `antichain_fails_distinguishing`, `Set.toFinite` |
| `correlatedTripleWitness_*` lemmas | definition of `correlatedTripleWitness`, `Set.union_empty_iff`, `Set.singleton_nonempty`, `norm_num`/`linarith` |
| `mmi_independent_of_ssa` | `correlatedTripleWitness_ssa`, `correlatedTripleWitness_mmi_fails` |
| `mmi_iff_information_form` | `Mmi`, `MutualInfo`, `Set.union_assoc`, `linarith` |
| `mmi_iff_tripartite_nonpos` | `mmi_iff_information_form`, `TripartiteInfo`, `linarith` |
| `cmi_factorization` | `CondMutualInfo`, `MutualInfo`, `Set.union_comm`, `Set.union_assoc`, `ring` |
| `ssa_of_subadditive_and_mmi` | `cmi_factorization`, `mmi_iff_information_form`, `linarith` |
| `correlatedTripleWitness_clean` | all `correlatedTripleWitness_*` lemmas |
| `isUpperSet_of_isOpen` | induction on `TopologicalSpace.GenerateOpen`; `isUpperSet_univ`, `IsUpperSet.inter`, `isUpperSet_sUnion` |
| `isOpen_iff_isUpperSet` | `isUpperSet_of_isOpen`, `TopologicalSpace.isOpen_generateFrom_of_mem` |
| `isClosed_iff_isLowerSet` | `isOpen_iff_isUpperSet`, `isUpperSet_compl`, `IsClosed.isOpen_compl` |
| `exists_upperSet_separating` | antisymmetry (`LE.le.antisymm`), `not_and_or`, `le_trans` |
| `closure_singleton_eq_downset` | `closure_minimal`, `subset_closure`, `isClosed_closure`, `isClosed_iff_isLowerSet` |
| `le_iff_mem_closure` | `closure_singleton_eq_downset` |
| `upSetTopology_t0Space` | `exists_upperSet_separating`, `inseparable_iff_forall_isOpen`, `T0Space` |
| `specialization_order_recovery` | the four preceding specialization lemmas |
| `card_thurstonGeometry3` | `Fintype` instance for `ThurstonGeometry3`, `decide` |


## vol-09-gravity-information-geometry (`Cmrps.Vol09`)

| Paper result | Depends on |
|---|---|
| Def. 2.2 (Fisher metric) | None; definitional. |
| Def. 2.3 (stochastic map, monotone metric) | None; definitional. |
| Lemma 3.1 (second-order KL) | Taylor expansion of `x ↦ (1+x) log(1+x)`; `∑ i, u i = 0` kills the first-order term. |
| Prop. 3.2 (Fisher monotone) | Cauchy–Schwarz in the weighted form used in the paper's proof; no dependence on Lemma 3.1. |
| Thm 3.4 (Chentsov) | Cited literature (Chentsov 1982; Petz–Sudar 1999). Used by Prop. 4.4's "more generally" clause only. |
| Def. 2.7 (Petz formula) | None; definitional. |
| Thm 4.1 (Petz–Sudar) | Cited literature (Petz 1996; Petz–Sudar 1996, 1999). |
| Prop. 4.2 (non-uniqueness) | Def. 2.7 evaluated at `ρ = diag(3/4,1/4)` with `f_sld`, `f_wy`; elementary surd arithmetic. |
| Prop. 4.4 (commutative locus) | Def. 2.7 with `f 1 = 1` and diagonal `X` (direct computation); the general `c · Fisher` clause additionally needs Thm 3.4. |
| Prop. 5.1 (qubit SLD geometry) | Def. 2.7 with `f_sld` at the diagonal qubit state; the hemisphere conclusion needs the closed form `|dr|² + (r·dr)²/(1-|r|²)`. |
| Prop. 5.2 (fidelity) | Def. 2.8; Hübner 1992; Braunstein–Caves 1994; Lemma 3.1 on the commuting side. |
| Thm 7.1–7.5 (Gelfand, Stone, DHW) | Cited literature; not used by any formalized claim. |
| Thm 8.4 (entropy cone) | Cited literature (Bao et al. 2015; Hernández-Cuenca 2019). |
| Prop. 9.1 (ideal gas) | Def. 2.9 Hessian of `S = Nk(c_v log U + log V − (c_v+1) log N)`; coordinate change `y = √c_v log U`, `z = log V`. |

| Lean theorem | Uses |
|---|---|
| `fisherMetric_eq_bilinear` | `fisherMetric`, `fisherBilinear`, `pow_two`. |
| `fisher_monotone_under_stochastic_maps` | `IsStochastic`, `stochApply`, `fisherMetric`; `Finset.sum_sq_le_sum_mul_sum_of_sq_le_mul` (Cauchy–Schwarz), `div_le_of_le_mul₀`, `Finset.sum_comm`, `Finset.sum_mul`, `Finset.sum_le_sum`. |
| `fisher_monotone_under_stochastic_maps'` | `fisher_monotone_under_stochastic_maps` (hypothesis `hu` unused). |
| `hasDerivAt_klRay` | `klRay`, `klRayDeriv`; `HasDerivAt.add`, `.mul`, `.mul_const`, `.div_const`, `.log`, `.sum`, `Real.hasDerivAt_log`, `div_ne_zero`. |
| `hasDerivAt_klRayDeriv` | Same chain with `.const_mul`, `.add_const`; conclusion `∑ i, u i ^ 2 / (p i + t * u i)`. |
| `fisher_second_order_kl` | `hasDerivAt_klRay`, `hasDerivAt_klRayDeriv`, `HasDerivAt.deriv`, `Real.log_one`, `div_self`, `fisherMetric`. |
| `monotone_metrics_restrict_to_fisher_on_commutative_locus` | `petzValue`, `Finset.sum_eq_single`, `Finset.sum_congr`, `div_self`, hypothesis `f 1 = 1`. |
| `petzValue_fSLD_Xtrans` / `petzValue_fSLD_Yrad` | `petzValue`, `fSLD`, `Fin.sum_univ_two`, `lam42_*`, `Xtrans_*`/`Yrad_*`, `norm_num`. |
| `mul_fWY` | `fWY`, `Real.sqrt_div`, `Real.sq_sqrt`, `Real.sqrt_ne_zero'`, `div_pow`, `div_add_one`. |
| `petzValue_fWY_Xtrans` / `petzValue_fWY_Yrad` | `mul_fWY`, `sqrt_three_quarter`, `sqrt_one_quarter`, `petzValue`, `Fin.sum_univ_two`, `Real.sqrt_one`, `Real.mul_self_sqrt`. |
| `quantum_monotone_metrics_not_unique` | `petzValue_fSLD_*`, `petzValue_fWY_*`, `Real.mul_self_sqrt`; non-proportionality by case analysis on `c`. |
| `sld_qubit_transverse` / `sld_qubit_radial` | `petzValue`, `fSLD`, `lamQubit_*`, `Xtrans_*`/`Yrad_*`, `Fin.sum_univ_two`, `fSLD_one`, `field_simp`, `ring`. |
| `sldBlochForm_transverse` / `sldBlochForm_radial` | `sldBlochForm` (pure algebra). |
| `ideal_gas_ruppeiner_flat` | `ruppeinerForm`, `euclideanForm`, `mul_pow`, `Real.sq_sqrt` (the coordinate change `y = √c_v log U`, `z = log V` of Prop. 9.1). |


## vol-10-observational-equivalence (`Cmrps.Vol10`)

| Paper result | Depends on |
|---|---|
| Def. 2.1 (system record) | Stipulation only (series object schema). |
| Defs. 2.2–2.4 (the three relations) | Def. 2.1; Def. 2.4 additionally needs Def. 4.1 (observation functor). |
| Def. 2.5 (admissible candidate relation) | Defs. 2.2–2.4; the family `A` of admissible observation functors is a stipulation. |
| Defs. 2.6–2.7 (equivalence witness, morphism kinds) | Def. 2.1; Table 3 (preserved layers) is data. |
| Thm 3.1 (plain tensor does not recover the group) | Etingof–Gelaki isocategorical construction (arXiv:math/0007196), by reference. |
| Cor. 3.2 (preserved-layer discipline) | Thm 3.1 only. |
| Rem. 3.3 (scope) | Doplicher–Roberts reconstruction (literature). |
| Def. 4.1 (observation functor) | Def. 2.1; proposal of the series corpus, defined in the paper. |
| Prop. 4.2 (induced relation) | Defs. 2.4, 4.1 only; isomorphism in the record category is an equivalence relation. |
| Lemma 4.3 (products of observations) | Def. 4.1; isomorphism in a product category is a pair of isomorphisms. |
| Def. 4.4 (coarse and fine observations) | Def. 4.1; Def. 2.7 for the coarse-graining functor `c`. |
| Prop. 4.5 (coarse records separate less) | Def. 4.4 for the inclusion; the §9.1 four-point witness for strictness (also cross-checked by `observation_quotient.py`). |
| Prop. 4.6 (composed experiments) | Def. 4.1; the product-records hypothesis for the positive direction; the §8.3 bipartite witness (11/32 vs 9/32) for the failure direction. |
| Thm 5.1 (Chentsov) | Literature (Chentsov; applied at Petz–Sudar, arXiv:quant-ph/0102132); Fisher form of §5.1. |
| Thm 5.2 (Petz–Sudar) | Literature (arXiv:quant-ph/0102132); Morozova–Chentsov form of §5.2; self-reciprocity as the normalization that kills the `f ↔ f^#` double count. |
| Prop. 5.3 (commutative restriction) | The quadratic form of §5.2 and `f(1) = 1` only — operator monotonicity is not used in the computation. |
| Ex. 5.4 / Cor. 5.5 | Direct arithmetic at `ρ = diag(3/4,1/4)`, `A = σ_x` (also cross-checked by `monotone_metric_contrast.py`); Cor. 5.5 additionally cites Thm 5.2 for the existence of many rulers. |
| §9.3 (groups of order 8) | Finite computation `invariant_coarseness.py`; a shadow of Thm 3.1, not the theorem. |

| Lean theorem | Uses |
|---|---|
| `obs_induced_equivalence` | `obsEquiv`, `ObservationFunctor.recordIso_equiv` (Equivalence.refl/symm/trans). |
| `obs_class_fibers` | `recordClass`, `Quotient.sound`, `Quotient.exact`, `obsEquiv`. |
| `obs_quotient_factor` | `obs_induced_equivalence`, `Quotient.lift`, `Quotient.inductionOn`; the quotient universal property. |
| `obs_products_intersection` | `ObservationFunctor.prod`, `obsEquiv` (definitional: `Iff.rfl`). |
| `obs_coarse_graining_composition` | `Coarsening.factors` pattern (`factors : Fc.obs = h ∘ Ff.obs`), `h_mono`, `obsEquiv`. |
| `obs_coarse_witness` | `Dist4`, `pDist`, `qDist`, `e1Push`, `e2Push`, `SameRecord` (`norm_num` on ℚ). |
| `obs_composed_product_preserved` | `ObservationFunctor.compProd`, `obsEquiv` (structure eta). |
| `obs_composed_experiments_failure` | `obs_coarse_witness.1`, `diagJoint`, `pDist`, `qDist` (`norm_num` on ℚ). |
| `eg_plain_tensor_insufficient` | `PlainTensorCounterexample` (hypothesis data only). |
| `preserved_layer_discipline` | `eg_plain_tensor_insufficient`'s hypothesis package, `EquivalenceWitness`, `DeclaresSymmetric`. |
| `petz_transpose_same_form` | `mcTerm`, `mcQuadratic`, `petzTranspose`; `inv_div`, `mul_div_cancel₀`, `Ne.symm`; `Finset.sum_comm`. |
| `monotone_commutative_restriction` | `mcTerm`, `mcQuadratic`; `Finset.sum_congr`, `Finset.sum_eq_single`, `div_self`, `Ne.symm`. |
| `commutative_restriction_is_fisher` | `monotone_commutative_restriction`, `fisherForm` (`rfl`). |
| `monotone_not_canonical` | `mcQuadratic`, `mcTerm`, `fRat`, `hRat`, `rhoDiag`, `sigmaX`; `Fin.sum_univ_two`, `norm_num`. |
| `monotone_ruler_dependence` | `monotone_not_canonical` (`.1`, `.2.1`), `norm_num`. |


## vol-11-completeness-obstructions (`Cmrps.Vol11`)

| Result | Depends on |
|---|---|
| Lemma 4.3 (Countable invariants), countable-range clause | Definition 4.1 (complete invariant); pure cardinality (injection classes → value set → ℕ) |
| Lemma 4.3, Borel clause | Definition of Borel reducibility; descriptive set theory (C-1) |
| Theorem 5.2 (Obstruction transport) | Definition 5.1 (isomorphism-injective functor); fully faithful ⇒ isomorphism-injective (C-4); Borel hypotheses for the countable-structures clause (C-2); matrix-pair universality for the wild clause (C-3) |
| Corollary 5.3 (Wild embedding) | Theorem 5.2(2) + wildness theorems (Bekkert-Drozd, Buchweitz-Leuschke, Grevstad-May; C-8) |
| Corollary 5.4 (Operator-algebra consequence) | Lemma 4.3 + McDuff (C-5) + Sasyk-Tørnquist (C-9) |
| Proposition 5.5 (Undecidability transport) | Adyan-Rabin (C-6) via a computable many-one reduction |
| Proposition 5.6 (No finite sporadic list) | McDuff (C-5) for the II₁ sector; classification of four-dimensional maximal model geometries (Hillman/Filipkiewicz) for the geometry sector; the no-family premise (C-11) |
| Proposition 5.7 (Two-regime picture fails) | Unknot recognition status (Hass-Lagarias-Pippenger; Lackenby) + classification of finite simple groups (Solomon) |
| Proposition 5.8 (Plain tensor layer fails) | Etingof-Gelaki isocategorical groups (C-7) |
| Corollary 6.2 (Quantifier restriction) | Theorem 5.2 + Proposition 5.5 |
| Table 4 / Regime assignment | Obstruction register (Section 3) + survey classification theorems; partition consistency checked by `regime_inventory.py` |
| Five proof obligations (Section 7) | Proposition 5.8 (equivalence obligation constrained); Theorem 5.2 (completeness obligation blocked on wild/undecidable sectors); admissibility list unfixed (Remark 2.3) |

| Declaration | Uses |
|---|---|
| `CompleteInvariant.onClasses` | `Quotient.liftOn'`, `CompleteInvariant.complete` |
| `CountableInvariantImpossibility` | `CompleteInvariant.onClasses`, `Quotient.inductionOn₂'`, `Quotient.sound'`, `Function.Injective.countable` |
| `IsomorphismInjective.classes` | `Quotient.map'`, `IsomorphismInjective.map_rel` |
| `IsomorphismInjective.classes_injective` | `Quotient.inductionOn₂'`, `Quotient.exact'`, `Quotient.sound'`, `IsomorphismInjective.reflect_rel` |
| `ObstructionTransport.pullback` | `IsomorphismInjective.map_rel`, `.reflect_rel`, `CompleteInvariant.complete` |
| `ObstructionTransport.uncountableClasses` | `IsomorphismInjective.classes_injective`, `Function.Injective.countable` |
| `ObstructionTransport.noCountableInvariant` | `ObstructionTransport.pullback` |
| `UndecidabilityTransport` | `DecidableProblem` (definitional unfolding), `Exists`/`Iff` only |
| `FiniteSporadicFails` | `SporadicDecomposition.cover`, `Function.Surjective`, `absurd` |
| `TwoRegimeFails` | `Function.Injective`, three-valued pigeonhole on `Bool` (`cases`/`decide`), constructor discrimination on `Regime` |
| `IsocategoricalEquivalenceFails` | `Coarsens` (definitional) |
| `RegimeAssignment.total/.unique/.every_regime_used` | `RegimeAssignment` (definitional reduction), `cases` on `Regime` |
| `Regime.occupies_exactly_one` | `ExistsUnique.intro` |

| Mathlib declaration | Used for |
|---|---|
| `Countable` (`Mathlib.Basic.Countable.Defs`) | "takes values in a countable set" |
| `Function.Injective.countable` (same file) | injection into a countable set is countable (do not re-prove) |
| `Quotient.map'`, `Quotient.liftOn'`, `Quotient.exact'`, `Quotient.sound'`, `Quotient.inductionOn₂'` (`Mathlib.Data.Quot`) | class sets, induced class maps, quotient induction |


## vol-12-principia-physica (`Cmrps.Vol12`)

| Paper result | Depends on |
|---|---|
| Def. 2.5 (three layers) | Stipulation only; no external input. |
| Def. 2.6 / Table 2 (evidence grades) | Registry audit of the program records; Table 2 is data. |
| Def. 2.7 / Table 3 (regime assignment) | Inspection of Table 3; counts 15,1,1,7,3,1,1 by row tally. |
| Section 3 non-collapse | Def. 2.5 + the stipulation that mathematically distinct theories may agree in an accessible regime. |
| Thm 5.1 (obstructions) | McDuff (II₁ factors); Bekkert–Drozd / Buchweitz–Leuschke / Grevstad–May (wildness); Adyan–Rabin with the Collins extension (Markov properties); Tancer (4-manifolds); Etingof–Gelaki (isocategorical groups); Grochow–Qiao (tame/wild boundary). |
| Thm 6.1 (structure hypotheses) | Etingof–Gelaki isocategorical construction (counterexample); Doplicher–Roberts (reconstruction under hypotheses); Stinespring (normal form only); supermap representability (channel-state duality). |
| Thm 7.1 (monotone metrics) | Chentsov (classical uniqueness up to constant); Petz–Sudar (classification by operator monotone functions). |
| Section 6 claim register | Clay problem statement; the five claim-ledger entries CL-01..CL-05 and their ladder positions. |
| Def. 8.2 / Prop. 8.3 (constituent record) | Case (a): Lemma 9.1. Case (b): classification of group extensions by `H²(Q, Z(N))` (Brown). Non-collapse: Section 3. |
| Rem. 8.4 (generation vs classification) | Thm 5.1 third clause (Adyan–Rabin): finitely presented groups are generated from cyclic groups yet their Markov properties are undecidable. |
| Lemma 9.1 (block decomposition) | Murphy: structure theorem for finite-dimensional complex C*-algebras; block sizes recovered as simple-module dimensions. |
| Conj. 7.1 | Standalone; never used as a lemma in the paper. |

| Lean theorem | Uses |
|---|---|
| `SelectionNotComputedByClassification` | `NotFactoring`; `Iff.mpr`/`mp`, hypothesis application only. |
| `EvidenceGradeAssignment` | `evidenceGrade`, `RecordType`, `EvidenceGrade` (case analysis + `decide`). |
| `registry_no_grade3` / `registry_grades` | `evidenceGrade`, `registryTypes` (`decide` / `rfl`). |
| `spine_row_count` | `spineTable` (`decide`). |
| `RegimeAssignment` | `countRegime`, `spineRegimes`, `spineTable`, `Regime` (`decide`). |
| `ObstructionAssembly` | `refutingTheorem`, `ObstructionObjective` (case analysis + `rfl`). |
| `StructurePreservation` | `Eq.symm`, `Eq.trans`, `congrArg` only. |
| `MonotoneWitnessDistinct` | `f_id`, `f_aff`, `congrFun`, `norm_num`. |
| `MonotoneMetricGap` | `Subsingleton.elim` (`letI` instance). |
| `MonotoneMetricGapQuantum` | `MonotoneMetricGap`, `MonotoneWitnessDistinct`, `congrArg Subtype.val`. |
| `ExistenceMassGapSeparation` | `ClaySolved`, `ClayProblem` (And elimination). |
| `claim_positions_exact` / `claim_ledger_size` / `claim_ledger_not_verified` | `claimPositions`, `LadderPosition` (`rfl` / `decide`). |
| `sameBlocks_refl` / `sameBlocks_symm` / `sameBlocks_trans` | `SameBlocks`, `countNat`, `Eq.symm`, `Eq.trans`. |
| `ConstructionLayerSeparation` | `constructionLayer`, `Layer` (`decide`). |
| `ConditionalStructuralGeneration` | `SameBlocks`, `constructionLayer`; hypothesis application + `rfl`. |
| `GenerationVersusClassification` | Hypothesis application only. |
| `FiniteDimCStarDecomposition` | `SameBlocks`; hypothesis application (`Iff.intro`). |
| `ExampleBlockMultiset` | `countNat` (`decide`). |


## Cross-volume dependency statements (paper level)

- **vol-01-foundations**: # Dependency notes — vol-01-foundations
- **vol-01-foundations**: ## Paper-level dependencies (results of vol-01-foundations.tex)
- **vol-02-structural-families**: # Dependency notes: vol-02-structural-families
- **vol-02-structural-families**: **Paper:** `papers/latex/vol-02-structural-families.tex`
- **vol-02-structural-families**: ## Cross-volume notes
- **vol-02-structural-families**: - vol-02 consumes vol-01 ontology vocabulary (records, equivalence, families) as definitions
- **vol-02-structural-families**: only; no vol-01 theorem is imported (there is no cross-module Lean import in either
- **vol-02-structural-families**: - Later volumes (vol-03 irreducibility/decomposition, vol-05 classical, vol-06 quantum) may
- **vol-02-structural-families**: - The Haskell/Python artifacts under `src/vol-02-structural-families/` are computational
- **vol-03-irreducibility-decomposition**: # Dependency notes: vol-03-irreducibility-decomposition
- **vol-03-irreducibility-decomposition**: absent from Mathlib at the pinned rev (see `vol-03-irreducibility-decomposition-conjectures.md` M-1..M-2).
- **vol-04-yoneda-classification**: # Dependency notes — vol-04-yoneda-classification
- **vol-04-yoneda-classification**: `vol-04-yoneda-classification-lean-targets.md` and are not formalized (their content is
- **vol-05-classical-systems**: # Dependency notes: vol-05-classical-systems
- **vol-06-quantum-systems**: # Dependency notes: vol-06-quantum-systems
- **vol-07-gauge-qft**: # Dependency notes: vol-07-gauge-qft
- **vol-07-gauge-qft**: **Paper:** papers/latex/vol-07-gauge-qft.tex
- **vol-07-gauge-qft**: Cross-volume: vol-07 instantiates the series schema (structural families IV and VI) defined in
- **vol-07-gauge-qft**: vol-01; the Etingof–Gelaki constraint (`def:etingof-gelaki`) governs every equivalence recorded
- **vol-07-gauge-qft**: in this volume, as in vol-06's tensor-category layer.
- **vol-08-spacetime-reconstruction**: # Dependency notes: vol-08-spacetime-reconstruction
- **vol-08-spacetime-reconstruction**: ## Cross-volume dependencies
- **vol-08-spacetime-reconstruction**: None. The module imports no other `Cmrps` module and states no cross-volume
- **vol-08-spacetime-reconstruction**: (`mmi_independent_of_ssa`) should record a DEP entry: from vol-08 to the
- **vol-09-gravity-information-geometry**: # Dependency notes — vol-09-gravity-information-geometry
- **vol-10-observational-equivalence**: # Dependency notes — vol-10-observational-equivalence
- **vol-10-observational-equivalence**: ## Cross-volume notes
- **vol-10-observational-equivalence**: - Thm 3.1 is the same literature result used by vol-12 (`ObstructionAssembly`'s
- **vol-10-observational-equivalence**: Etingof–Gelaki row, DEP-007 in the series registry). The vol-10 module packages it as
- **vol-10-observational-equivalence**: `PlainTensorCounterexample` hypothesis data; vol-12 records it as a refutation row.
- **vol-10-observational-equivalence**: - Thm 5.1 and Thm 5.2 are the same literature pair vol-12 cites in its Thm 7.1 (DEP-008:
- **vol-10-observational-equivalence**: classical uniqueness may not be extended to the quantum case). vol-10 formalizes the
- **vol-10-observational-equivalence**: distinguishing computation (Ex. 5.4: 16/3 vs 4) that vol-12 assumes as the gap witness.
- **vol-11-completeness-obstructions**: # Dependency notes: vol-11-completeness-obstructions
- **vol-11-completeness-obstructions**: No cross-volume Lean dependencies: the module is self-contained apart from the
- **vol-12-principia-physica**: # Dependency notes — vol-12-principia-physica
- **vol-12-principia-physica**: is self-contained apart from Mathlib. Cross-volume links are informational only:
- **vol-12-principia-physica**: `FiniteDimCStarDecomposition` is the background record T-BG-06 cited from vol-01/vol-02
- **vol-12-principia-physica**: vol-03/vol-04/vol-11 contexts; neither imports their modules.
