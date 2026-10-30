# Claim status: vol-05-classical-systems

Verification artifact for `papers/latex/vol-05-classical-systems.tex`
(Classification of Classical Physical Systems, Part 5 of CMRPS) and
`verification/vol-05-classical-systems-lean-targets.md`. Module:
`lean/Cmrps/Vol05ClassicalSystems.lean`, namespace `Cmrps.Vol05`.

Labels: `machine-checked` (in the module, no `sorry`; assembler
promotes to `machine-checked` after `lake build` exits 0), `complete-informal-proof`
(proved in the paper or by cited literature, not formalized), `conditional`
(depends on a named conjecture), `conjecture`, `computational-evidence`
(Phase D run, never proof), `open-problem`.

## Formalized claims (all `machine-checked`)

| Name | One-line statement | Status |
|---|---|---|
| `IsTangentVector` | Def. 8.1: a tangent vector at a simplex point has coordinates summing to 0 | machine-checked |
| `OpenSimplex` | Def. 2.4/8.1: `Δ° = {p \| pᵢ > 0, Σᵢ pᵢ = 1}` | machine-checked |
| `fisherMetric` | Def. 8.1: `g_p(u, v) = Σᵢ uᵢ vᵢ / pᵢ` (Haskell witness `fisherMetric`) | machine-checked |
| `fisherMetric_comm` | The Fisher metric is symmetric: `g_p(u, v) = g_p(v, u)` | machine-checked |
| `fisherMetric_self_nonneg` | `0 ≤ g_p(u, u)` when all `pᵢ > 0` | machine-checked |
| `fisherMetric_self_eq_zero` | `g_p(u, u) = 0` forces `u = 0` (positive definiteness) | machine-checked |
| `openSimplex_index_nonempty` | An open simplex is indexed by a nonempty type | machine-checked |
| `fisherMetric_example_three` | Example 8.3: `p = (1/2, 1/3, 1/6)`, `u = (1, -1, 0)` gives `g_p(u, u) = 5` | machine-checked |
| `fisherMetric_example_uniform` | Example 8.3: at `p = (1/3, 1/3, 1/3)` the same `u` gives `g_p(u, u) = 6` | machine-checked |
| `IsColumnStochastic` | Def. 2.4/8.2: nonnegative entries and unit column sums | machine-checked |
| `mulVec_mem_openSimplex` | A column-stochastic matrix with positive entries maps `Δ°` into `Δ°` | machine-checked |
| `MonotoneMetric` | Def. 8.2: metric family on all simplices with `g_{Tp}(Tu, Tu) ≤ g_p(u, u)` | machine-checked |
| `monotoneMetric_equality_of_leftInverse` | Lemma 8.5: a stochastic map with stochastic left inverse is an isometry for any monotone metric | machine-checked |
| `fisherMetric_product` | Prop. 8.9 (target 8 `FisherExplicit`): the Fisher metric of `p ⊗ q` is the direct sum of the factor metrics | machine-checked |
| `fisherMetric_gap_eq_sum_squares` | Key identity: `g_p(u, u) − g_{Tp}(Tu, Tu)` is a sum of squares `Σᵢ Σⱼ Tⱼᵢ pᵢ (uᵢ/pᵢ − (Tu)ⱼ/(Tp)ⱼ)²` | machine-checked |
| `fisherMetric_monotone` | Fisher monotonicity (hypothesis of Thm. 8.4; computational claim 3): `g_{Tp}(Tu, Tu) ≤ g_p(u, u)` for column-stochastic `T` | machine-checked |
| `SymplecticForm` | Def. 2.2 linear model: bilinear, alternating, nondegenerate form on a real vector space | machine-checked |
| `SymplecticForm.skew` | Every symplectic form is skew-symmetric | machine-checked |
| `stdSymplecticForm` | Thm. 3.3 model (target 1 `Darboux`): `ω₀ = Σᵢ dxᵢ ∧ dyᵢ` on `ℝⁿ × ℝⁿ` (Haskell witness `darboux`) | machine-checked |
| `exists_symplectic_partner` | Lem. 3.1 engine (target 1): every `v ≠ 0` has `w` with `ω(v, w) = 1` | machine-checked |
| `kksForm` | Thm. 4.4 (target 3 `KKSSymplectic`): `ω_ξ(x, y) = ⟨ξ, [x, y]⟩` (Haskell witness `kksSymplecticForm`) | machine-checked |
| `kksForm_self` | The KKS form is alternating: `ω_ξ(x, x) = 0` | machine-checked |
| `kksForm_skew` | The KKS form is skew: `ω_ξ(x, y) = −ω_ξ(y, x)` | machine-checked |
| `coadjointStabilizer` | The stabilizer `g_ξ = {x \| ∀ y, ω_ξ(x, y) = 0}` (radical carrier of Thm. 4.4) | machine-checked |
| `kksForm_eq_of_sub_mem_stabilizer` | Thm. 4.4 well-definedness: the KKS form descends to `g / g_ξ ≅ T_ξ O` | machine-checked |
| `liePoissonLinear` | Ex. 4.3: the linear function `ℓ_x(ξ) = ⟨ξ, x⟩` on `g*` | machine-checked |
| `liePoissonLinear_bracket` | Ex. 4.3: the Lie–Poisson bracket of linear functions at `ξ` is the KKS form | machine-checked |
| `liePoissonLinear_antisymm` | Ex. 4.3: the Lie–Poisson bracket of linear functions is antisymmetric | machine-checked |
| `so3_casimir` | Prop. 4.5 (`so(3)` case): `⟨ξ, [ξ, x]⟩ = 0` for all `ξ, x` (Casimir `|ξ|²` generates no motion) | machine-checked |
| `pendulumMonodromy` | Ex. 7.5 / target 6: the spherical pendulum monodromy matrix `[[1, 1], [0, 1]]` (Haskell witness `pendulumMonodromy`) | machine-checked |
| `pendulumMonodromy_det` | The monodromy matrix has determinant 1 | machine-checked |
| `pendulumMonodromy_ne_one` | The monodromy is nontrivial (not the identity) | machine-checked |
| `pendulumMonodromy_unipotent` | The monodromy is unipotent: `(M − 1)² = 0` | machine-checked |

## Lean mechanization targets (the ten targets of the targets file)

| Name | One-line statement | Status |
|---|---|---|
| 1. `Darboux` (Thm. 3.3) | Every symplectic `2n`-manifold is locally symplectomorphic to `(ℝ^{2n}, ω₀)` | complete-informal-proof (cited: paper Lem. 3.1 + 3.2, Moser 1965); linear core (`stdSymplecticForm`, `exists_symplectic_partner`) machine-checked |
| 2. `WeinsteinSplitting` (Thm. 4.1) | Near a rank-`2k` point a Poisson manifold splits as symplectic times transverse Poisson | complete-informal-proof (cited: Weinstein 1983); not formalized — no Poisson bivector or manifold-level structure in the module |
| 3. `KKSSymplectic` (Thm. 4.4) | Coadjoint orbits carry `ω_ξ(ad*_x ξ, ad*_y ξ) = ⟨ξ, [x, y]⟩`, coadjoint-invariant | complete-informal-proof (cited: Kirillov 1976) for invariance and orbit nondegeneracy; alternating + well-definedness machine-checked (`kksForm`, `kksForm_skew`, `kksForm_eq_of_sub_mem_stabilizer`) |
| 4. `MoserStability` (Thm. 5.1, Lem. 3.2) | A constant-cohomology family of symplectic forms on a closed manifold is trivialized by an isotopy | complete-informal-proof (cited: Moser 1965); not formalized (needs smooth isotopies) |
| 5. `LiouvilleArnold` (Thm. 7.2) | Compact connected regular level sets of integrable systems are `n`-tori with action-angle neighborhoods | complete-informal-proof (cited: Arnold 1978); not formalized |
| 6. `MonodromyObstruction` (Prop. 7.4, Ex. 7.5) | Nontrivial monodromy of the period lattice obstructs global action-angle coordinates; pendulum monodromy is `[[1, 1], [0, 1]]` | obstruction theorem complete-informal-proof (cited: Duistermaat 1980); matrix value computational-evidence (Duistermaat 1980 / Haskell `pendulumMonodromy`); matrix facts (`pendulumMonodromy_*`) machine-checked |
| 7. `ChentsovFisher` (Thm. 8.4) | Monotone + sufficient-statistics-invariant metric families are constant multiples of the Fisher family | complete-informal-proof (cited: Chentsov 1982); uniqueness direction NOT formalized; monotonicity direction and the equality case along sufficient statistics machine-checked (`fisherMetric_monotone`, `monotoneMetric_equality_of_leftInverse`) |
| 8. `FisherExplicit` (Def. 8.1, Prop. 8.9) | `g_p(u, v) = Σᵢ uᵢ vᵢ / pᵢ`, and the product metric is the direct sum of factor metrics | machine-checked (`fisherMetric`, `fisherMetric_product`, `fisherMetric_example_three`, `fisherMetric_example_uniform`) |
| 9. `CoadjointOrbitWeyl` (Thm. 6.2) | Orbits of compact connected semisimple `G` are parameterized by the closed positive Weyl chamber; dominant integral weights select integral orbits | complete-informal-proof (cited: Humphreys 1972, Kirillov 1976, Borel-Weil); not formalized |
| 10. `DelzantPolytope` (Thm. 9.8) | Momentum images of compact connected toric symplectic manifolds are Delzant polytopes, classifying them up to `GL(n; ℤ) ⋉ ℝⁿ` | complete-informal-proof (cited: Delzant 1988); not formalized |

## Other paper claims (not in the targets file)

| Name | One-line statement | Status |
|---|---|---|
| Cor. 3.4 (no local invariants) | Every local symplectic invariant is constant on connected components | complete-informal-proof (from Thm. 3.3) |
| Prop. 4.2 (leaf foliation) | A Poisson manifold is foliated by symplectic leaves | complete-informal-proof (cited: Weinstein 1983) |
| Prop. 4.5 (Casimir functions) | Poisson-central functions are constant on leaves; on `so(3)*` the Casimir is `|ξ|²` | `so(3)` infinitesimal form machine-checked (`so3_casimir`); general leaf-constancy complete-informal-proof |
| Prop. 5.7 / Thm. 5.8 (Gromov width / nonsqueezing) | The Gromov width is a capacity; ball embeds into cylinder only if `r ≤ R` | complete-informal-proof (cited: Gromov 1985) |
| Thm. 7.7 (Nekhoroshev) | Action drift `≤ c ε^b` up to time `exp(c ε^{-a})` for steep systems | complete-informal-proof (cited: Nekhoroshev 1977) |
| Thm. 8.10 (Petz–Sudar) | Quantum monotone metrics form a parametric family, not a unique metric up to scale | complete-informal-proof (cited: Petz–Sudar 2001) |
| Prop. 9.2 (surfaces irreducible) | Closed symplectic surfaces are `C`-irreducible | complete-informal-proof (dimension parity) |
| Prop. 9.3 / 9.5 (reduction) | Marsden–Weinstein reduction; reduction commutes with products along the symmetric factor | complete-informal-proof (cited: Marsden–Weinstein 1974) |
| Computational claim 1 (Darboux chart) | Moser homotopy yields a Darboux chart, residual `2.4e-15` | computational-evidence |
| Computational claim 2 (rank stratification) | Lie–Poisson rank on `so(3)*` is 2 on spheres, 0 at origin | computational-evidence |
| Computational claim 3 (Fisher monotonicity) | Fisher pullback monotone on 200 sampled stochastic maps | computational-evidence (the mathematical content `fisherMetric_monotone` is machine-checked) |
| §11 bridge (deformation quantization) | Classical/quantum family bridge | conjecture (see `C-10` in the conjecture file); every cross-boundary statement is conditional |
