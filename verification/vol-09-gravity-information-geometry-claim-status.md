# Claim status — vol-09-gravity-information-geometry

**Module:** lean/Cmrps/Vol09GravityInformationGeometry.lean (namespace `Cmrps.Vol09`)
**Date:** 2026-10-30
**Labels:** `machine-checked` (kernel-accepted statement in the module, no
`sorry`; assembler promotes to `machine-checked` after `lake build` exits 0) ·
`complete-informal-proof` (proved in the paper or the cited literature, not formalized
here) · `conditional` (depends on an unproved hypothesis) · `conjecture` ·
`computational-evidence` (checked only by the paper's executable code) · `open-problem`.

Every statement below is the exact Lean name where one exists. All ten mechanization
targets are covered; the Petz formula is stated on real tangent vectors (`|X ij|²` is
`X ij ^ 2` there), which covers every computation the paper performs in real form.

## Formalized claims (Lean)

| Name | One-line statement | Label |
|---|---|---|
| `IsStochastic` | Def. 2.3: `m × n` array `φ j i ≥ 0` with unit column sums `∑ j, φ j i = 1`. | machine-checked |
| `stochApply` | Def. 2.3: action `p ↦ φ p`, `(φ v) j = ∑ i, φ j i * v i`. | machine-checked |
| `fisherBilinear` / `fisherMetric` | Def. 2.2: `g_p(u,v) = ∑ i, u i * v i / p i`; quadratic form `∑ i, u i ^ 2 / p i`. | machine-checked |
| `fisherMetric_eq_bilinear` | The quadratic form is the bilinear form at `u = v`. | machine-checked |
| `klDiv` / `perturbed` / `klRay` / `klRayDeriv` | Lemma 3.1 data: `D(q‖p) = ∑ i, q i * Real.log (q i / p i)`, ray `p + t • u`, its value and first derivative in `t`. | machine-checked |
| `fisher_monotone_under_stochastic_maps` | Target 1 (Prop. 3.2): `g_{φ p}(φ u, φ u) ≤ g_p(u, u)` for every stochastic `φ` and interior `p` (Cauchy–Schwarz proof of the paper). | machine-checked |
| `fisher_monotone_under_stochastic_maps'` | Same inequality with the tangent hypothesis `∑ i, u i = 0` stated (unused by the proof). | machine-checked |
| `hasDerivAt_klRay` / `hasDerivAt_klRayDeriv` | The ray `t ↦ D(p + t•u ‖ p)` has first derivative `klRayDeriv`, and that derivative has derivative `∑ i, u i ^ 2 / (p i + t * u i)`. | machine-checked |
| `fisher_second_order_kl` | Target 2 (Lemma 3.1, derivative form): `h(0) = 0`, `h'(0) = 0` (uses `∑ i, u i = 0`), and the second derivative at `0` is `g_p(u, u)`. | machine-checked |
| `petzValue` | Def. 2.7 (Eq. 2.7): `g^f(X,X) = ∑ i j, (X i j) ^ 2 / (λ i * f (λ j / λ i))` on real tangent data. | machine-checked |
| `fSLD` / `fSLD_one` | Thm 4.1: SLD parameter `f(t) = (1 + t) / 2`, normalized `f 1 = 1`. | machine-checked |
| `fWY` / `fWY_one` | Prop. 4.2: Wigner–Yanase parameter `f(t) = (1 + √t)² / 4`, normalized `f 1 = 1`. | machine-checked |
| `monotone_metrics_restrict_to_fisher_on_commutative_locus` | Target 6 (Prop. 4.4): for diagonal `X` and `f 1 = 1`, `petzValue f λ X = ∑ i, X i i ^ 2 / λ i`, the Fisher value. | machine-checked |
| `lam42`, `Xtrans`, `Yrad` (+ `lam42_*`, `Xtrans_*`, `Yrad_*`) | Prop. 4.2 data: `ρ = diag(3/4, 1/4)`, `X = σ_x / 2`, `Y = σ_z / 2`, with their matrix entries as `rfl`-lemmas. | machine-checked |
| `petzValue_fSLD_Xtrans` / `petzValue_fSLD_Yrad` | `g^sld(X,X) = 1`, `g^sld(Y,Y) = 4/3` at `ρ = diag(3/4, 1/4)`. | machine-checked |
| `sqrt_three_quarter`, `sqrt_one_quarter`, `mul_fWY` | Surd helpers: `√(3/4) = √3/2`, `√(1/4) = 1/2`, and `a * fWY (b / a) = (√a + √b)² / 4` for `a, b > 0`. | machine-checked |
| `petzValue_fWY_Xtrans` / `petzValue_fWY_Yrad` | `g^wy(X,X) = 4(2 - √3)`, `g^wy(Y,Y) = 4/3`. | machine-checked |
| `quantum_monotone_metrics_not_unique` | Target 5 (Prop. 4.2): the four values above, radial-to-transverse ratios `4/3` and `(2 + √3)/3`, and non-proportionality `¬ ∃ c, g^wy = c · g^sld` on the span of `X, Y`. | machine-checked |
| `lamQubit` (+ `lamQubit_0/1`) | Prop. 5.1 data: qubit eigenvalues `λ± = (1 ± s)/2` at Bloch radius `s`. | machine-checked |
| `sld_qubit_transverse` / `sld_qubit_radial` | Target 7 (Prop. 5.1, components): at radius `s`, `g^sld(X,X) = 1` and `g^sld(Y,Y) = 1/(1 - s²)`. | machine-checked |
| `sldBlochForm` / `sldBlochForm_transverse` / `sldBlochForm_radial` | Prop. 5.1 closed form `|dr|² + (r·dr)²/(1-|r|²)` at `r = (0,0,s)`: equals `1` for `dr = e₁` and `1/(1-s²)` for `dr = e₃`, matching the Petz values. | machine-checked |
| `idealGasEntropy` / `ruppeinerForm` / `euclideanForm` | Def. 2.9 / Prop. 9.1 data: `S = Nk (c_v log U + log V - (c_v+1) log N)`, `g = Nk (c_v (dU/U)² + (dV/V)²)`, Euclidean form `Nk (dy² + dz²)`. | machine-checked |
| `ideal_gas_ruppeiner_flat` | Target 9 (Prop. 9.1, content of its proof): in the log coordinates `y = √c_v log U`, `z = log V` the Ruppeiner form equals the constant Euclidean form `Nk (dy² + dz²)`. | machine-checked |

## Skipped or only-informal claims

| Name | One-line statement | Label |
|---|---|---|
| Target 2, remainder form | `D(p+u‖p) = ½ g_p(u,u) + O(‖u‖³)` as stated in Lemma 3.1 (only the derivative content is mechanized). | complete-informal-proof |
| Target 3, `chentsov_uniqueness_classical` | The Fisher family is the unique (up to one shared constant) metric family on the simplices monotone under stochastic maps (Thm 3.4; Chentsov 1982, Petz–Sudar 1999, hypotheses as stated). | complete-informal-proof |
| Target 4, `petz_sudar_parametric_classification` | Monotone metric families correspond bijectively (after `f 1 = 1`) to operator monotone `f` with `f(t) = t f(1/t)` via the Petz formula (Thm 4.1; Petz 1996, Petz–Sudar 1996/1999). | complete-informal-proof |
| Target 7, hemisphere claim | `D_2°` with `g^sld` is an open hemisphere of the round `S³` of radius one (Prop. 5.1 conclusion; Riemannian isometry not mechanized). | complete-informal-proof |
| Target 8, `fidelity_metric_quarter_sld` | In the normalization `d_B² = 2(1-√F)` the fidelity metric equals `¼ g^sld` (Def. 2.8, Prop. 5.2; Hübner 1992, Braunstein–Caves 1994). | complete-informal-proof |
| Target 8, numerical check | Finite-difference verification of `g^fid = g^sld/4` in dimensions two to four (Section 11). | computational-evidence |
| Target 9, Ricci vanishing | The ideal-gas Ruppeiner scalar curvature vanishes identically (Prop. 9.1 conclusion; follows from `ideal_gas_ruppeiner_flat` plus the textbook fact that a Euclidean metric is flat). | complete-informal-proof |
| Target 10, `holographic_entropy_cone_leq4` | For `N = 2, 3, 4` static holographic subregions, SA + Araki–Lieb + MMI generate the complete linear entropy inequalities (Thm 8.4; Bao et al. 2015, Hernández-Cuenca 2019). | complete-informal-proof |
| Worked monotonicity (Rem. 3.3) | Concrete `φ`, `p`, `u` with `g_p(u,u) = 49/1200 > 121/9744 = g_q(φu,φu)` (arithmetic). | complete-informal-proof |
| Qubit SLD distance (Rem. 5.3) | Geodesic distance from the center equals `arcsin r`; diameter `π`. | complete-informal-proof |
| van der Waals curvature (Sec. 9) | Closed form `R(u,v)` of Eq. (9.2), nonzero away from the critical point (symbolic/numeric computation). | computational-evidence |

No claim in this file is labeled `machine-checked` until the assembler promotes it; no
statement in the module uses `sorry` or new axioms.
