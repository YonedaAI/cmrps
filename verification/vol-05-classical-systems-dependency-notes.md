# Dependency notes: vol-05-classical-systems

Record for `lean/Cmrps/Vol05ClassicalSystems.lean` (namespace `Cmrps.Vol05`).
Two directions are recorded: (1) dependencies among the paper's results;
(2) Mathlib lemmas used by each Lean theorem.

## Module self-containment

`Cmrps.Vol05ClassicalSystems` imports only Mathlib; it has NO dependencies on
any other `Cmrps.*` module. The Mathlib surface: `Mathlib.Algebra.BigOperators.Fin`,
`Mathlib.Algebra.BigOperators.Ring.Finset`, `Mathlib.Algebra.Lie.Basic`,
`Mathlib.Algebra.Order.BigOperators.Group.Finset`, `Mathlib.Basic.Real.Basic`,
`Mathlib.Data.Fin.VecNotation`, `Mathlib.Data.Matrix.Mul`,
`Mathlib.LinearAlgebra.BilinearMap`, `Mathlib.LinearAlgebra.CrossProduct`,
`Mathlib.LinearAlgebra.Dual.Defs`,
`Mathlib.LinearAlgebra.Matrix.Determinant.Basic`, `Mathlib.Tactic`.
Nothing in the module re-proves Mathlib; `so3_casimir` is a direct application
of `Matrix.dot_self_cross` to the paper's statement.

## Paper-result dependencies (Vol. 5)

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

## Lean lemma dependencies (in-module)

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

## Formalization gaps (tracked in the conjecture file)

The manifold-level layer is absent from Mathlib's interface used here: no
symplectic manifolds, no Poisson bivectors, no isotopies. Consequently
`C-1`–`C-4`, `C-6`–`C-9` are literature results consumed by the paper with no
Lean proof. The Chentsov uniqueness direction (`C-5`) is the one target where
the missing piece is a finite-dimensional argument rather than manifold
technology; a future extension would formalize the reduction to
`g_p(u, v) = f(p) Σᵢ uᵢ vᵢ / pᵢ` and the constancy of `f` across dimensions.
