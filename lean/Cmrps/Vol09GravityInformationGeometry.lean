/-
Copyright (c) 2026 The YonedaAI Collaboration. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.

# Vol. 9 — Gravity, Information, and Geometric Correspondence

Formalization of the tractable mechanization targets of
`verification/vol-09-gravity-information-geometry-lean-targets.md`, mirroring the
names of `papers/latex/vol-09-gravity-information-geometry.tex`.

Scope note. The classical information-geometric core is mechanized: the Fisher
metric and its monotonicity under stochastic maps (Proposition 3.2), the
second-order expansion of relative entropy along rays (Lemma 3.1, derivative
form), the Petz metric formula and its restriction to the commutative locus
(Proposition 4.4), the non-uniqueness of quantum monotone metrics on qubit
states (Proposition 4.2), the radial/transverse components of the qubit SLD
geometry (Proposition 5.1), and the log-coordinate form of the ideal-gas
Ruppeiner metric (Proposition 9.1). The survey theorems quoted from the
literature (Chentsov, Petz–Sudar, the holographic entropy cone), the full
hemisphere statement, and the fidelity identity are NOT mechanized here; they
are recorded in `verification/vol-09-gravity-information-geometry-claim-status.md`
and `verification/vol-09-gravity-information-geometry-conjectures.md`.

The Petz formula is stated on real tangent vectors, where `|X ij|²` of the
paper is `X ij ^ 2`; all computations the paper performs in real form
(Propositions 4.2, 4.4, 5.1) are covered by this form.
-/

import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Algebra.Order.BigOperators.Ring.Finset
import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Mathlib.Tactic

open BigOperators

namespace Cmrps.Vol09

/-! ## Definitions (paper: Section 2) -/

/-- Definition 2.3: a stochastic map with `m` output and `n` input outcomes, as an
`m × n` array `φ j i` of nonnegative entries with unit column sums
(`∑ j, φ j i = 1` for each `i`), acting on vectors by `(φ v) j = ∑ i, φ j i * v i`. -/
def IsStochastic {m n : ℕ} (φ : Fin m → Fin n → ℝ) : Prop :=
  (∀ j i, 0 ≤ φ j i) ∧ (∀ i, ∑ j, φ j i = 1)

/-- Action of a stochastic map on vectors (Definition 2.3): `p ↦ φ p`, and on tangent
vectors `u ↦ Dφ · u` (the same formula). -/
def stochApply {m n : ℕ} (φ : Fin m → Fin n → ℝ) (v : Fin n → ℝ) : Fin m → ℝ :=
  fun j => ∑ i, φ j i * v i

/-- Definition 2.2: the Fisher bilinear form `g_p(u, v) = ∑ i, u i * v i / p i`
on the interior of the probability simplex. -/
noncomputable def fisherBilinear {n : ℕ} (p u v : Fin n → ℝ) : ℝ := ∑ i, u i * v i / p i

/-- Definition 2.2: the Fisher quadratic form `g_p(u, u) = ∑ i, u i ^ 2 / p i`. -/
noncomputable def fisherMetric {n : ℕ} (p u : Fin n → ℝ) : ℝ := ∑ i, u i ^ 2 / p i

theorem fisherMetric_eq_bilinear {n : ℕ} (p u : Fin n → ℝ) :
    fisherMetric p u = fisherBilinear p u u := by
  simp [fisherMetric, fisherBilinear, pow_two]

/-- Lemma 3.1: the Kullback–Leibler divergence `D(q ‖ p) = ∑ i, q i * Real.log (q i / p i)`. -/
noncomputable def klDiv {n : ℕ} (q p : Fin n → ℝ) : ℝ := ∑ i, q i * Real.log (q i / p i)

/-- The perturbed distribution `p + t • u` of Lemma 3.1. -/
noncomputable def perturbed {n : ℕ} (p u : Fin n → ℝ) (t : ℝ) : Fin n → ℝ := fun i => p i + t * u i

/-- Relative entropy along the ray `p + t • u` (Lemma 3.1). -/
noncomputable def klRay {n : ℕ} (p u : Fin n → ℝ) (t : ℝ) : ℝ := klDiv (perturbed p u t) p

/-- First derivative in `t` of `klRay p u` (Lemma 3.1):
`∑ i, u i * Real.log ((p i + t * u i) / p i) + u i`. -/
noncomputable def klRayDeriv {n : ℕ} (p u : Fin n → ℝ) (t : ℝ) : ℝ :=
  ∑ i, (u i * Real.log ((p i + t * u i) / p i) + u i)

/-- Definition 2.7 (Eq. (2.7)): the Petz metric value of a real tangent vector `X`
at the diagonal state with eigenvalues `λ`, for the parameter function `f`:
`g^f(X, X) = ∑ i j, (X i j) ^ 2 / (λ i * f (λ j / λ i))`. -/
noncomputable def petzValue {d : ℕ} (f : ℝ → ℝ) (lam : Fin d → ℝ) (X : Fin d → Fin d → ℝ) : ℝ :=
  ∑ i, ∑ j, (X i j) ^ 2 / (lam i * f (lam j / lam i))

/-- Theorem 4.1: the symmetric-logarithmic-derivative parameter `f(t) = (1 + t) / 2`. -/
noncomputable def fSLD (t : ℝ) : ℝ := (1 + t) / 2

/-- Proposition 4.2: the Wigner–Yanase parameter `f(t) = (1 + √t)² / 4`. -/
noncomputable def fWY (t : ℝ) : ℝ := (1 + Real.sqrt t) ^ 2 / 4

theorem fSLD_one : fSLD 1 = 1 := by norm_num [fSLD]

theorem fWY_one : fWY 1 = 1 := by
  simp [fWY, Real.sqrt_one]
  norm_num

/-- Proposition 9.1: entropy of the ideal gas at fixed `N`,
`S = Nk (c_v log U + log V - (c_v + 1) log N)` (additive constant dropped). -/
noncomputable def idealGasEntropy (U V N cv k : ℝ) : ℝ :=
  N * k * (cv * Real.log U + Real.log V - (cv + 1) * Real.log N)

/-- Proposition 9.1: the Ruppeiner quadratic form of the ideal gas in the
coordinates `(U, V)` at fixed `N`, `g = Nk (c_v (dU/U)² + (dV/V)²)`. -/
noncomputable def ruppeinerForm (N k cv U V dU dV : ℝ) : ℝ :=
  N * k * (cv * (dU / U) ^ 2 + (dV / V) ^ 2)

/-- The Euclidean quadratic form `Nk (dy² + dz²)`. -/
noncomputable def euclideanForm (N k dy dz : ℝ) : ℝ := N * k * (dy ^ 2 + dz ^ 2)

/-- Proposition 5.1: the closed form of the SLD metric on the Bloch ball,
`g^sld = |dr|² + (r · dr)² / (1 - |r|²)`, in coordinates
`r = (r₁, r₂, r₃)`, `dr = (dr₁, dr₂, dr₃)`. -/
noncomputable def sldBlochForm (r₁ r₂ r₃ dr₁ dr₂ dr₃ : ℝ) : ℝ :=
  (dr₁ ^ 2 + dr₂ ^ 2 + dr₃ ^ 2) +
    (r₁ * dr₁ + r₂ * dr₂ + r₃ * dr₃) ^ 2 / (1 - (r₁ ^ 2 + r₂ ^ 2 + r₃ ^ 2))

/-! ## Proposition 3.2 — monotonicity of the Fisher metric (target 1) -/

/-- **Proposition 3.2** (`fisher_monotone_under_stochastic_maps`): the Fisher metric
is monotone under stochastic maps: `g_{φ p}(φ u, φ u) ≤ g_p(u, u)`.
The proof is the Cauchy–Schwarz argument of the paper; the tangent hypothesis
`∑ i, u i = 0` is not needed for the inequality. -/
theorem fisher_monotone_under_stochastic_maps
    {m n : ℕ} (φ : Fin m → Fin n → ℝ) (hφ : IsStochastic φ)
    (p u : Fin n → ℝ) (hp : ∀ i, 0 < p i) :
    fisherMetric (stochApply φ p) (stochApply φ u) ≤ fisherMetric p u := by
  have hφnn : ∀ j i, 0 ≤ φ j i := hφ.1
  have hφcol : ∀ i, ∑ j, φ j i = 1 := hφ.2
  have key : ∀ j, (stochApply φ u j) ^ 2 / stochApply φ p j ≤
      ∑ i, φ j i * (u i ^ 2 / p i) := by
    intro j
    have hq : 0 ≤ stochApply φ p j :=
      Finset.sum_nonneg fun i _ => mul_nonneg (hφnn j i) (hp i).le
    have hsum : 0 ≤ ∑ i, φ j i * (u i ^ 2 / p i) :=
      Finset.sum_nonneg fun i _ =>
        mul_nonneg (hφnn j i) (div_nonneg (sq_nonneg _) (hp i).le)
    refine div_le_of_le_mul₀ hq hsum ?_
    -- Cauchy–Schwarz in the form `r i ^ 2 ≤ f i * g i`
    have hcs := Finset.sum_sq_le_sum_mul_sum_of_sq_le_mul (s := Finset.univ)
      (r := fun i => φ j i * u i)
      (f := fun i => φ j i * (u i ^ 2 / p i))
      (g := fun i => φ j i * p i)
      (fun i _ => mul_nonneg (hφnn j i) (div_nonneg (sq_nonneg _) (hp i).le))
      (fun i _ => mul_nonneg (hφnn j i) (hp i).le)
      (fun i _ => by
        have hpi : p i ≠ 0 := (hp i).ne'
        have : (φ j i * u i) ^ 2 = φ j i * (u i ^ 2 / p i) * (φ j i * p i) := by
          field_simp [hpi] <;> ring
        exact this.le)
    have hs : ∑ i, φ j i * u i = stochApply φ u j := rfl
    have hs2 : ∑ i, φ j i * p i = stochApply φ p j := rfl
    rw [hs, hs2] at hcs
    exact hcs
  calc ∑ j, (stochApply φ u j) ^ 2 / stochApply φ p j
      ≤ ∑ j, ∑ i, φ j i * (u i ^ 2 / p i) := Finset.sum_le_sum (fun j _ => key j)
    _ = ∑ i, ∑ j, φ j i * (u i ^ 2 / p i) := Finset.sum_comm
    _ = ∑ i, (∑ j, φ j i) * (u i ^ 2 / p i) := by simp_rw [← Finset.sum_mul]
    _ = ∑ i, 1 * (u i ^ 2 / p i) := by simp_rw [hφcol]
    _ = ∑ i, u i ^ 2 / p i := by simp_rw [one_mul]

theorem fisher_monotone_under_stochastic_maps'
    {m n : ℕ} (φ : Fin m → Fin n → ℝ) (hφ : IsStochastic φ)
    (p u : Fin n → ℝ) (hp : ∀ i, 0 < p i) (hu : ∑ i, u i = 0) :
    fisherMetric (stochApply φ p) (stochApply φ u) ≤ fisherMetric p u :=
  fisher_monotone_under_stochastic_maps φ hφ p u hp

/-! ## Lemma 3.1 — second-order expansion of relative entropy (target 2) -/

/-- The derivative of each summand of `klRay` exists wherever the perturbed
entries stay positive. -/
theorem hasDerivAt_klRay {n : ℕ} (p u : Fin n → ℝ) (t : ℝ)
    (hp : ∀ i, 0 < p i) (ht : ∀ i, 0 < p i + t * u i) :
    HasDerivAt (klRay p u) (klRayDeriv p u t) t := by
  have hterm : ∀ i, HasDerivAt
      (fun s => (p i + s * u i) * Real.log ((p i + s * u i) / p i))
      (u i * Real.log ((p i + t * u i) / p i) + u i) t := by
    intro i
    have hpi : p i ≠ 0 := (hp i).ne'
    have hpos : p i + t * u i ≠ 0 := (ht i).ne'
    have hlin : HasDerivAt (fun s : ℝ => p i + s * u i) (u i) t := by
      have h1 : HasDerivAt (fun s : ℝ => s * u i) (1 * u i) t :=
        (hasDerivAt_id' t).mul_const (u i)
      have h2 : HasDerivAt (fun _ : ℝ => p i) 0 t := hasDerivAt_const t (p i)
      have := h2.add h1
      have hval0 : (0 + 1 * u i : ℝ) = u i := by ring
      rw [hval0] at this
      exact this
    have hdiv : HasDerivAt (fun s => (p i + s * u i) / p i) (u i / p i) t :=
      hlin.div_const (p i)
    have hlog : HasDerivAt (fun s => Real.log ((p i + s * u i) / p i))
        ((u i / p i) / ((p i + t * u i) / p i)) t :=
      hdiv.log (div_ne_zero hpos hpi)
    have hmul := hlin.mul hlog
    -- reduce the derivative value to `u i * log (...) + u i`
    have hval : (p i + t * u i) * ((u i / p i) / ((p i + t * u i) / p i)) = u i := by
      field_simp [hpos, hpi] <;> ring
    rw [hval] at hmul
    exact hmul
  have hsum : HasDerivAt
      (fun s => ∑ i, (p i + s * u i) * Real.log ((p i + s * u i) / p i))
      (∑ i, (u i * Real.log ((p i + t * u i) / p i) + u i)) t :=
    HasDerivAt.fun_sum fun i _ => hterm i
  have eqf : (fun s => ∑ i, (p i + s * u i) * Real.log ((p i + s * u i) / p i))
      = klRay p u := rfl
  have eqd : (∑ i, (u i * Real.log ((p i + t * u i) / p i) + u i)) = klRayDeriv p u t := rfl
  rw [eqf, eqd] at hsum
  exact hsum

/-- The derivative of `klRayDeriv` is `∑ i, u i ^ 2 / (p i + t * u i)`;
at `t = 0` this is the Fisher value `g_p(u, u)`. -/
theorem hasDerivAt_klRayDeriv {n : ℕ} (p u : Fin n → ℝ) (t : ℝ)
    (hp : ∀ i, 0 < p i) (ht : ∀ i, 0 < p i + t * u i) :
    HasDerivAt (klRayDeriv p u) (∑ i, u i ^ 2 / (p i + t * u i)) t := by
  have hterm : ∀ i, HasDerivAt
      (fun s => u i * Real.log ((p i + s * u i) / p i) + u i)
      (u i ^ 2 / (p i + t * u i)) t := by
    intro i
    have hpi : p i ≠ 0 := (hp i).ne'
    have hpos : p i + t * u i ≠ 0 := (ht i).ne'
    have hlin : HasDerivAt (fun s : ℝ => p i + s * u i) (u i) t := by
      have h1 : HasDerivAt (fun s : ℝ => s * u i) (1 * u i) t :=
        (hasDerivAt_id' t).mul_const (u i)
      have h2 : HasDerivAt (fun _ : ℝ => p i) 0 t := hasDerivAt_const t (p i)
      have := h2.add h1
      have hval0 : (0 + 1 * u i : ℝ) = u i := by ring
      rw [hval0] at this
      exact this
    have hdiv : HasDerivAt (fun s => (p i + s * u i) / p i) (u i / p i) t :=
      hlin.div_const (p i)
    have hlog : HasDerivAt (fun s => Real.log ((p i + s * u i) / p i))
        ((u i / p i) / ((p i + t * u i) / p i)) t :=
      hdiv.log (div_ne_zero hpos hpi)
    have hmul : HasDerivAt (fun s => u i * Real.log ((p i + s * u i) / p i))
        (u i * ((u i / p i) / ((p i + t * u i) / p i))) t :=
      hlog.const_mul (u i)
    have hval : u i * ((u i / p i) / ((p i + t * u i) / p i)) = u i ^ 2 / (p i + t * u i) := by
      field_simp [hpos, hpi] <;> ring
    have := hmul.add_const (u i)
    rw [hval] at this
    exact this
  have hsum : HasDerivAt
      (fun s => ∑ i, (u i * Real.log ((p i + s * u i) / p i) + u i))
      (∑ i, u i ^ 2 / (p i + t * u i)) t :=
    HasDerivAt.fun_sum fun i _ => hterm i
  have eqf : (fun s => ∑ i, (u i * Real.log ((p i + s * u i) / p i) + u i))
      = klRayDeriv p u := rfl
  rw [eqf] at hsum
  exact hsum

/-- **Lemma 3.1** (`fisher_second_order_kl`): along the ray `p + t • u` through an
interior point with tangent direction (`∑ i, u i = 0`), the relative entropy
satisfies `D(p + t•u ‖ p) = t² / 2 · g_p(u, u) + O(t³)`; we machine-check the
derivative content: `h(0) = 0`, `h'(0) = 0`, and the second derivative of the ray
at `0` is the Fisher value `g_p(u, u)` (the `O(t³)` remainder form is the
informal part). -/
theorem fisher_second_order_kl {n : ℕ} (p u : Fin n → ℝ)
    (hp : ∀ i, 0 < p i) (hu : ∑ i, u i = 0) :
    klRay p u 0 = 0 ∧
    deriv (klRay p u) 0 = 0 ∧
    deriv (klRayDeriv p u) 0 = fisherMetric p u := by
  have ht0 : ∀ i, 0 < p i + 0 * u i := by
    intro i
    simpa using hp i
  have h1 : HasDerivAt (klRay p u) (klRayDeriv p u 0) 0 :=
    hasDerivAt_klRay p u 0 hp ht0
  have h2 : HasDerivAt (klRayDeriv p u) (∑ i, u i ^ 2 / (p i + 0 * u i)) 0 :=
    hasDerivAt_klRayDeriv p u 0 hp ht0
  refine ⟨?_, ?_, ?_⟩
  · -- `D(p ‖ p) = 0`
    have : ∀ i, (p i + 0 * u i) * Real.log ((p i + 0 * u i) / p i) = 0 := by
      intro i
      rw [zero_mul, add_zero, div_self (hp i).ne', Real.log_one, mul_zero]
    simp [klRay, klDiv, perturbed, this]
  · -- `h'(0) = ∑ i, u i = 0`
    rw [h1.deriv]
    have : klRayDeriv p u 0 = ∑ i, u i := by
      have hi : ∀ i, (p i + 0 * u i) / p i = 1 := by
        intro i
        rw [zero_mul, add_zero, div_self (hp i).ne']
      simp [klRayDeriv, hi, Real.log_one, mul_zero, zero_add, add_zero]
    rw [this, hu]
  · -- second derivative of the ray at `0` is `g_p(u, u)`
    rw [h2.deriv]
    have : (∑ i, u i ^ 2 / (p i + 0 * u i)) = fisherMetric p u := by
      simp [fisherMetric, zero_mul, add_zero]
    rw [this]

/-! ## Proposition 4.4 — commutative locus (target 6) -/

/-- **Proposition 4.4** (`monotone_metrics_restrict_to_fisher_on_commutative_locus`):
for diagonal tangent vectors the Petz value is the Fisher value `∑ i, X i i ^ 2 / λ i`,
for every parameter function `f` normalized by `f 1 = 1`. -/
theorem monotone_metrics_restrict_to_fisher_on_commutative_locus
    {d : ℕ} (f : ℝ → ℝ) (hf : f 1 = 1) (lam : Fin d → ℝ) (hlam : ∀ i, lam i ≠ 0)
    (X : Fin d → Fin d → ℝ) (hdiag : ∀ i j, i ≠ j → X i j = 0) :
    petzValue f lam X = ∑ i, X i i ^ 2 / lam i := by
  have hrow : ∀ i, ∑ j, (X i j) ^ 2 / (lam i * f (lam j / lam i)) = (X i i) ^ 2 / lam i := by
    intro i
    have hsingle : ∑ j, (X i j) ^ 2 / (lam i * f (lam j / lam i))
        = (X i i) ^ 2 / (lam i * f (lam i / lam i)) :=
      Finset.sum_eq_single i
        (fun j _ hj => by rw [hdiag i j (Ne.symm hj), pow_two, zero_mul, zero_div])
        (fun hi => absurd (Finset.mem_univ i) hi)
    rw [hsingle, div_self (hlam i), hf, mul_one]
  simp only [petzValue]
  exact Finset.sum_congr rfl fun i _ => hrow i

/-! ## Proposition 4.2 — non-uniqueness of quantum monotone metrics (target 5) -/

/-- Qubit eigenvalues `λ = (3/4, 1/4)` of Proposition 4.2. -/
noncomputable def lam42 : Fin 2 → ℝ := fun i => if i = 0 then 3 / 4 else 1 / 4

/-- Transverse tangent `X = σ_x / 2` of Proposition 4.2: `X 0 1 = X 1 0 = 1/2`,
diagonal entries `0`. -/
noncomputable def Xtrans : Fin 2 → Fin 2 → ℝ := fun i j => if i = j then 0 else 1 / 2

/-- Radial tangent `Y = σ_z / 2` of Proposition 4.2: `Y 0 0 = 1/2`, `Y 1 1 = -1/2`,
off-diagonal entries `0`. -/
noncomputable def Yrad : Fin 2 → Fin 2 → ℝ :=
  fun i j => if i = j then (if i = 0 then 1 / 2 else -1 / 2) else 0

lemma lam42_0 : lam42 0 = 3 / 4 := if_pos rfl
lemma lam42_1 : lam42 1 = 1 / 4 := if_neg (by decide)

lemma Xtrans_00 : Xtrans 0 0 = 0 := if_pos rfl
lemma Xtrans_01 : Xtrans 0 1 = 1 / 2 := if_neg (by decide)
lemma Xtrans_10 : Xtrans 1 0 = 1 / 2 := if_neg (by decide)
lemma Xtrans_11 : Xtrans 1 1 = 0 := if_pos rfl

lemma Yrad_00 : Yrad 0 0 = 1 / 2 := by rw [Yrad, if_pos rfl, if_pos rfl]
lemma Yrad_01 : Yrad 0 1 = 0 := if_neg (by decide)
lemma Yrad_10 : Yrad 1 0 = 0 := if_neg (by decide)
lemma Yrad_11 : Yrad 1 1 = -1 / 2 := by rw [Yrad, if_pos rfl, if_neg (by decide)]

lemma petzValue_fSLD_Xtrans : petzValue fSLD lam42 Xtrans = 1 := by
  simp only [petzValue, Fin.sum_univ_two]
  rw [lam42_0, lam42_1, Xtrans_00, Xtrans_01, Xtrans_10, Xtrans_11]
  simp only [fSLD]
  norm_num

lemma petzValue_fSLD_Yrad : petzValue fSLD lam42 Yrad = 4 / 3 := by
  simp only [petzValue, Fin.sum_univ_two]
  rw [lam42_0, lam42_1, Yrad_00, Yrad_01, Yrad_10, Yrad_11]
  simp only [fSLD]
  norm_num

lemma sqrt_three_quarter : Real.sqrt (3 / 4) = Real.sqrt 3 / 2 := by
  rw [show (3 / 4 : ℝ) = 3 / 2 ^ 2 by norm_num, Real.sqrt_div (by norm_num),
    Real.sqrt_sq (by norm_num)]

lemma sqrt_one_quarter : Real.sqrt (1 / 4) = 1 / 2 := by
  rw [show (1 / 4 : ℝ) = (1 / 2) ^ 2 by norm_num, Real.sqrt_sq (by norm_num)]

lemma mul_fWY {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
    a * fWY (b / a) = (Real.sqrt a + Real.sqrt b) ^ 2 / 4 := by
  have hne : Real.sqrt a ≠ 0 := (Real.sqrt_ne_zero').2 ha
  have hs : Real.sqrt (b / a) = Real.sqrt b / Real.sqrt a := Real.sqrt_div hb.le a
  have hsq : Real.sqrt a ^ 2 = a := Real.sq_sqrt ha.le
  have h1 : 1 + Real.sqrt b / Real.sqrt a = (Real.sqrt a + Real.sqrt b) / Real.sqrt a := by
    field_simp [hne]
  have h2 : ((Real.sqrt a + Real.sqrt b) / Real.sqrt a) ^ 2
      = (Real.sqrt a + Real.sqrt b) ^ 2 / a := by
    rw [div_pow, hsq]
  simp only [fWY]
  rw [hs, h1, h2]
  field_simp [ha.ne'] <;> ring

lemma petzValue_fWY_Xtrans : petzValue fWY lam42 Xtrans = 4 * (2 - Real.sqrt 3) := by
  have h3 : Real.sqrt 3 * Real.sqrt 3 = 3 := Real.mul_self_sqrt (by norm_num)
  have h3p : 0 < Real.sqrt 3 := Real.sqrt_pos.mpr (by norm_num)
  have h3ne : Real.sqrt 3 ≠ 2 := by
    intro h
    have := congrArg (· * Real.sqrt 3) h
    simp [h3] at this
    nlinarith [h3]
  have ha : (0:ℝ) < 3 / 4 := by norm_num
  have hb : (0:ℝ) < 1 / 4 := by norm_num
  have hA : ((Real.sqrt 3 / 2 + 1 / 2) ^ 2 / 4 : ℝ) = (2 + Real.sqrt 3) / 8 := by
    have h1 : Real.sqrt 3 / 2 + 1 / 2 = (Real.sqrt 3 + 1) / 2 := by ring
    rw [h1, div_pow]
    have hsq : (Real.sqrt 3 + 1) ^ 2 = 4 + 2 * Real.sqrt 3 := by nlinarith [h3]
    rw [hsq]
    ring
  have hB : ((1 / 2 + Real.sqrt 3 / 2) ^ 2 / 4 : ℝ) = (2 + Real.sqrt 3) / 8 := by
    have h1 : (1:ℝ) / 2 + Real.sqrt 3 / 2 = (Real.sqrt 3 + 1) / 2 := by ring
    rw [h1, div_pow]
    have hsq : (Real.sqrt 3 + 1) ^ 2 = 4 + 2 * Real.sqrt 3 := by nlinarith [h3]
    rw [hsq]
    ring
  have t01 : (Xtrans 0 1) ^ 2 / (lam42 0 * fWY (lam42 1 / lam42 0))
      = (1 / 2) ^ 2 / ((Real.sqrt 3 / 2 + 1 / 2) ^ 2 / 4) := by
    rw [Xtrans_01, lam42_0, lam42_1, mul_fWY ha hb, sqrt_three_quarter, sqrt_one_quarter]
  have t10 : (Xtrans 1 0) ^ 2 / (lam42 1 * fWY (lam42 0 / lam42 1))
      = (1 / 2) ^ 2 / ((1 / 2 + Real.sqrt 3 / 2) ^ 2 / 4) := by
    rw [Xtrans_10, lam42_1, lam42_0, mul_fWY hb ha, sqrt_one_quarter, sqrt_three_quarter]
  have hz : (0:ℝ) ^ 2 = 0 := by norm_num
  simp only [petzValue, Fin.sum_univ_two, Xtrans_00, Xtrans_11, hz,
    zero_div, add_zero, zero_add]
  rw [t01, t10, hA, hB]
  have h2x : (2:ℝ) + Real.sqrt 3 ≠ 0 := by nlinarith [h3p]
  field_simp [h2x]
  nlinarith [h3]

lemma petzValue_fWY_Yrad : petzValue fWY lam42 Yrad = 4 / 3 := by
  have hz : (0:ℝ) ^ 2 = 0 := by norm_num
  have h34 : ((3 / 4 : ℝ) / (3 / 4)) = 1 := by norm_num
  have h14 : ((1 / 4 : ℝ) / (1 / 4)) = 1 := by norm_num
  simp only [petzValue, Fin.sum_univ_two, lam42_0, lam42_1, Yrad_00, Yrad_01, Yrad_10,
    Yrad_11, h34, h14, fWY_one, mul_one, hz, zero_div, add_zero, zero_add]
  norm_num

/-- **Proposition 4.2** (`quantum_monotone_metrics_not_unique`): at
`ρ = diag(3/4, 1/4)` the symmetric logarithmic derivative and Wigner–Yanase
metrics give radial-to-transverse ratios `4/3` and `(2 + √3)/3` on
`X = σ_x / 2`, `Y = σ_z / 2`, hence are not proportional. -/
theorem quantum_monotone_metrics_not_unique :
    petzValue fSLD lam42 Xtrans = 1 ∧
    petzValue fSLD lam42 Yrad = 4 / 3 ∧
    petzValue fWY lam42 Xtrans = 4 * (2 - Real.sqrt 3) ∧
    petzValue fWY lam42 Yrad = 4 / 3 ∧
    petzValue fSLD lam42 Yrad / petzValue fSLD lam42 Xtrans = 4 / 3 ∧
    petzValue fWY lam42 Yrad / petzValue fWY lam42 Xtrans = (2 + Real.sqrt 3) / 3 ∧
    ¬ ∃ c : ℝ, petzValue fWY lam42 Xtrans = c * petzValue fSLD lam42 Xtrans ∧
        petzValue fWY lam42 Yrad = c * petzValue fSLD lam42 Yrad := by
  have h3 : Real.sqrt 3 * Real.sqrt 3 = 3 := Real.mul_self_sqrt (by norm_num)
  have h3p : 0 < Real.sqrt 3 := Real.sqrt_pos.mpr (by norm_num)
  have h3ne : Real.sqrt 3 ≠ 2 := by
    intro h
    have := congrArg (· * Real.sqrt 3) h
    simp [h3] at this
    nlinarith [h3]
  have h2s : (2:ℝ) - Real.sqrt 3 ≠ 0 := by
    intro h
    nlinarith [h3p]
  have vX := petzValue_fSLD_Xtrans
  have vY := petzValue_fSLD_Yrad
  have wX := petzValue_fWY_Xtrans
  have wY := petzValue_fWY_Yrad
  refine ⟨vX, vY, wX, wY, ?_, ?_, ?_⟩
  · rw [vY, vX]
    norm_num
  · rw [wY, wX]
    field_simp [h2s, h3ne, h3p.ne']
    nlinarith [h3]
  · rintro ⟨c, hx, hy⟩
    rw [vX] at hx
    rw [vY] at hy
    rw [wX] at hx
    rw [wY] at hy
    have hc : c = 1 := by nlinarith [hy]
    subst hc
    simp at hx
    nlinarith [h3]

/-! ## Proposition 5.1 — qubit SLD geometry, radial and transverse components
(target 7, partial) -/

/-- Eigenvalues `λ± = (1 ± s)/2` of the qubit state with Bloch radius `s` along
the third axis. -/
noncomputable def lamQubit (s : ℝ) : Fin 2 → ℝ := fun i => if i = 0 then (1 + s) / 2 else (1 - s) / 2

lemma lamQubit_0 (s : ℝ) : lamQubit s 0 = (1 + s) / 2 := if_pos rfl
lemma lamQubit_1 (s : ℝ) : lamQubit s 1 = (1 - s) / 2 := if_neg (by decide)

/-- Proposition 5.1, transverse component: at Bloch radius `s` the SLD value of
`X = σ_x / 2` equals `1`, the transverse value of the closed form. -/
theorem sld_qubit_transverse (s : ℝ) (hs : 0 < s) (hs' : s < 1) :
    petzValue fSLD (lamQubit s) Xtrans = 1 := by
  have hp0 : (1 + s) / 2 ≠ 0 := by nlinarith
  have hp1 : (1 - s) / 2 ≠ 0 := by nlinarith
  have h01 : (1 + s) / 2 + (1 - s) / 2 = 1 := by ring
  simp only [petzValue, Fin.sum_univ_two]
  rw [lamQubit_0, lamQubit_1, Xtrans_00, Xtrans_01, Xtrans_10, Xtrans_11]
  simp only [fSLD]
  field_simp [hp0, hp1, h01]
  ring

/-- Proposition 5.1, radial component: at Bloch radius `s` the SLD value of
`Y = σ_z / 2` equals `1 / (1 - s²)`, the radial value of the closed form
`|dr|² + (r · dr)² / (1 - |r|²)` at `dr = e₃`. -/
theorem sld_qubit_radial (s : ℝ) (hs : 0 < s) (hs' : s < 1) :
    petzValue fSLD (lamQubit s) Yrad = 1 / (1 - s ^ 2) := by
  have hp0 : (1 + s) / 2 ≠ 0 := by nlinarith
  have hp1 : (1 - s) / 2 ≠ 0 := by nlinarith
  have hs2 : 1 - s ^ 2 ≠ 0 := by nlinarith [mul_self_pos.mpr (ne_of_gt hs)]
  simp only [petzValue, Fin.sum_univ_two]
  rw [lamQubit_0, lamQubit_1, Yrad_00, Yrad_01, Yrad_10, Yrad_11,
    div_self hp0, div_self hp1, fSLD_one, mul_one]
  field_simp [hp0, hp1, hs2]
  ring

/-- Proposition 5.1 closed form on the transverse axis: `|dr|² + (r·dr)²/(1-|r|²)`
at `r = (0, 0, s)`, `dr = (1, 0, 0)` equals `1`. -/
theorem sldBlochForm_transverse (s : ℝ) (hs : s ^ 2 < 1) :
    sldBlochForm 0 0 s 1 0 0 = 1 := by
  have h : 1 - (0 ^ 2 + 0 ^ 2 + s ^ 2) ≠ 0 := by nlinarith
  simp [sldBlochForm, h] <;> field_simp <;> ring

/-- Proposition 5.1 closed form on the radial axis: `|dr|² + (r·dr)²/(1-|r|²)`
at `r = (0, 0, s)`, `dr = (0, 0, 1)` equals `1 / (1 - s²)`. -/
theorem sldBlochForm_radial (s : ℝ) (hs : s ^ 2 < 1) :
    sldBlochForm 0 0 s 0 0 1 = 1 / (1 - s ^ 2) := by
  have h : 1 - (0 ^ 2 + 0 ^ 2 + s ^ 2) ≠ 0 := by nlinarith
  simp [sldBlochForm, h]
  field_simp
  ring

/-! ## Proposition 9.1 — ideal-gas Ruppeiner geometry (target 9, partial) -/

/-- Proposition 9.1 (content of its proof): in the coordinates `y = √c_v · log U`,
`z = log V` the ideal-gas Ruppeiner quadratic form becomes the constant Euclidean
form `Nk (dy² + dz²)`; the Ricci-scalar vanishing follows (recorded informally). -/
theorem ideal_gas_ruppeiner_flat (N k cv U V dU dV : ℝ) (hcv : 0 ≤ cv) :
    ruppeinerForm N k cv U V dU dV =
      euclideanForm N k (Real.sqrt cv * (dU / U)) (dV / V) := by
  simp only [ruppeinerForm, euclideanForm, mul_pow, Real.sq_sqrt hcv]

end Cmrps.Vol09
