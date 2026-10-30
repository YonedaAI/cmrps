# Dependency notes — vol-09-gravity-information-geometry

**Module:** lean/Cmrps/Vol09GravityInformationGeometry.lean (namespace `Cmrps.Vol09`).
**Imports:** `Mathlib.Algebra.BigOperators.Fin`, `Mathlib.Algebra.Order.BigOperators.Ring.Finset`,
`Mathlib.Algebra.Order.Field.Basic`, `Mathlib.Analysis.SpecialFunctions.Log.Deriv`, `Mathlib.Tactic`.
**Scope:** real-valued form of the Petz formula (`|X ij|²` = `X ij ^ 2`); complex Hermitian
statements are not attempted.

## Paper-level dependencies

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

## Lean-level dependencies (which declarations each theorem uses)

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

## Notes on scope

- The Petz formula is mechanized on real symmetric tangent data only; this covers
  Propositions 4.2, 4.4 and the radial/transverse slices of Proposition 5.1, which are
  exactly the real-form computations of the paper.
- The `O(‖u‖³)` remainder of Lemma 3.1, the Riemannian isometry of Proposition 5.1,
  the fidelity identity of Proposition 5.2, and the Ricci computation of Proposition 9.1
  are not mechanized; see the claim-status and conjectures files.
- `fisher_second_order_kl` states the derivative content of Lemma 3.1 (`h(0) = h'(0) = 0`,
  `h''(0) = g_p(u,u)`); the asymptotic remainder form is `complete-informal-proof`.
