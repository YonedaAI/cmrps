/-
Module for `vol-05-classical-systems` (CMRPS Volume 5,
"Classification of Classical Physical Systems").

Lean identifiers mirror the definition and theorem names of
`papers/latex/vol-05-classical-systems.tex` and the witness names of
`src/vol-05-classical-systems/Instances.hs` where possible.
-/
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Algebra.Lie.Basic
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Basic.Real.Basic
import Mathlib.Data.Fin.VecNotation
import Mathlib.Data.Matrix.Mul
import Mathlib.LinearAlgebra.BilinearMap
import Mathlib.LinearAlgebra.CrossProduct
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Tactic

/-!
# Classical systems (Volume 5)

Formalized targets for Volume 5 of *The Classification of Mathematical
Representations of Physical Systems*.  The module machine-checks the
finite-dimensional core of the paper:

* the Fisher metric on open simplices, its product formula (Proposition 8.9),
  its monotonicity under stochastic maps (the hypothesis of Theorem 8.4), and
  the equality case along sufficient statistics (Lemma 8.5);
* symplectic forms on real vector spaces, the standard form
  `ω₀ = Σᵢ dxᵢ ∧ dyᵢ`, and the partner-vector step of Lemma 3.1;
* the Kirillov–Kostant–Souriau two-form `ω_ξ(x, y) = ⟨ξ, [x, y]⟩` and the
  `so(3)` Casimir of Proposition 4.5;
* the monodromy matrix of the spherical pendulum (Example 7.5).

The manifold-level statements (Darboux, Weinstein splitting, Moser stability,
Liouville–Arnold, Chentsov uniqueness, Weyl chamber classification, Delzant)
are recorded, unformalized, in
`verification/vol-05-classical-systems-claim-status.md` and
`verification/vol-05-classical-systems-conjectures.md`.
-/

namespace Cmrps.Vol05

/-! ## Classical statistical systems (Section 8) -/

section Statistical

/-- Definition 8.1: a tangent vector at a point of the open simplex: the
coordinates sum to zero. -/
def IsTangentVector {ι : Type*} [Fintype ι] (u : ι → ℝ) : Prop :=
  ∑ i, u i = 0

/-- Definition 2.4 / 8.1: the open simplex
`Δ° = {p | pᵢ > 0 and Σᵢ pᵢ = 1}`. -/
def OpenSimplex {ι : Type*} [Fintype ι] (p : ι → ℝ) : Prop :=
  (∀ i, 0 < p i) ∧ ∑ i, p i = 1

/-- Definition 8.1: the Fisher metric on the open simplex,
`g_p(u, v) = Σᵢ uᵢ vᵢ / pᵢ` (Haskell witness `fisherMetric`). -/
noncomputable def fisherMetric {ι : Type*} [Fintype ι] (p u v : ι → ℝ) : ℝ :=
  ∑ i, u i * v i / p i

theorem fisherMetric_comm {ι : Type*} [Fintype ι] (p u v : ι → ℝ) :
    fisherMetric p u v = fisherMetric p v u := by
  simp only [fisherMetric, mul_comm]

theorem fisherMetric_self_nonneg {ι : Type*} [Fintype ι] (p u : ι → ℝ)
    (hp : ∀ i, 0 < p i) : 0 ≤ fisherMetric p u u := by
  apply Finset.sum_nonneg
  intro i _
  exact div_nonneg (mul_self_nonneg (u i)) (le_of_lt (hp i))

/-- The Fisher metric is positive definite: `g_p(u, u) = 0` forces `u = 0`. -/
theorem fisherMetric_self_eq_zero {ι : Type*} [Fintype ι] (p u : ι → ℝ)
    (hp : ∀ i, 0 < p i) (h : fisherMetric p u u = 0) : u = 0 := by
  have hterm : ∀ i, 0 ≤ u i * u i / p i :=
    fun i => div_nonneg (mul_self_nonneg (u i)) (le_of_lt (hp i))
  have hz : ∀ i ∈ (Finset.univ : Finset ι), u i * u i / p i = 0 := by
    refine (Finset.sum_eq_zero_iff_of_nonneg (fun i _ => hterm i)).mp ?_
    show (∑ i, u i * u i / p i) = 0
    exact h
  funext i
  have hi : u i * u i / p i = 0 := hz i (Finset.mem_univ i)
  have hpi : p i ≠ 0 := ne_of_gt (hp i)
  rcases div_eq_zero_iff.mp hi with h0 | h0
  · exact mul_self_eq_zero.mp h0
  · exact absurd h0 hpi

/-- An open simplex is indexed by a nonempty type. -/
theorem openSimplex_index_nonempty {ι : Type*} [Fintype ι] {p : ι → ℝ}
    (hp : OpenSimplex p) : Nonempty ι := by
  by_contra h
  have h' : IsEmpty ι := not_nonempty_iff.mp h
  rcases hp with ⟨_, hsum⟩
  have h0 : (∑ i, p i) = 0 :=
    Finset.sum_eq_zero fun i _ => (@IsEmpty.false ι h' i).elim
  linarith

/-- Example 8.3: for `p = (1/2, 1/3, 1/6)` and `u = (1, -1, 0)` one has
`g_p(u, u) = 5`. -/
theorem fisherMetric_example_three :
    fisherMetric ![1 / 2, 1 / 3, 1 / 6] ![1, -1, 0] ![1, -1, 0] = 5 := by
  simp only [fisherMetric, Fin.sum_univ_three, Matrix.cons_val_zero]
  norm_num

/-- Example 8.3: at the uniform point `p = (1/3, 1/3, 1/3)` the same vector has
`g_p(u, u) = 6`. -/
theorem fisherMetric_example_uniform :
    fisherMetric ![1 / 3, 1 / 3, 1 / 3] ![1, -1, 0] ![1, -1, 0] = 6 := by
  simp only [fisherMetric, Fin.sum_univ_three, Matrix.cons_val_zero]
  norm_num

/-- Definition 2.4 / 8.2: column-stochastic matrix: nonnegative entries and unit
column sums. -/
def IsColumnStochastic {m n : ℕ} (T : Matrix (Fin m) (Fin n) ℝ) : Prop :=
  (∀ j i, 0 ≤ T j i) ∧ ∀ i, ∑ j, T j i = 1

/-- A column-stochastic matrix with strictly positive entries maps the open
simplex into itself (Definition 2.4). -/
theorem mulVec_mem_openSimplex {m n : ℕ} {T : Matrix (Fin m) (Fin n) ℝ} {p : Fin n → ℝ}
    (hT : IsColumnStochastic T) (hTpos : ∀ j i, 0 < T j i) (hp : OpenSimplex p) :
    OpenSimplex (T.mulVec p) := by
  rcases hp with ⟨hpos, hsum⟩
  obtain ⟨i₀⟩ := openSimplex_index_nonempty ⟨hpos, hsum⟩
  refine ⟨?_, ?_⟩
  · intro j
    have hpos' : ∀ i, 0 < T j i * p i := fun i => mul_pos (hTpos j i) (hpos i)
    simpa [Matrix.mulVec_apply_eq_sum] using
      Finset.sum_pos (fun i _ => hpos' i) (⟨i₀, Finset.mem_univ i₀⟩ : (Finset.univ : Finset (Fin n)).Nonempty)
  · show ∑ j, ∑ i, T j i * p i = 1
    rw [Finset.sum_comm]
    have hswap : ∀ i, (∑ j, T j i * p i) = p i := by
      intro i
      rw [← Finset.sum_mul, hT.2, one_mul]
    simp only [hswap, hsum]

/-- Definition 8.2: a family of Riemannian metrics on the open simplices of all
dimensions, monotone under stochastic maps:
`g_{Tp}(Tu, Tu) ≤ g_p(u, u)`. -/
structure MonotoneMetric where
  /-- The metric at `p` on tangent vectors `u`, `v` of the `k`-outcome simplex. -/
  g : (k : ℕ) → (Fin k → ℝ) → (Fin k → ℝ) → (Fin k → ℝ) → ℝ
  /-- Symmetry of the metric. -/
  symm : ∀ k p u v, g k p u v = g k p v u
  /-- Monotonicity under column-stochastic maps: coarse-graining cannot increase
  distinguishability. -/
  monotone : ∀ (n m : ℕ) (T : Matrix (Fin m) (Fin n) ℝ), IsColumnStochastic T →
    ∀ (p u : Fin n → ℝ), (∀ i, 0 < p i) → (∀ j, 0 < (T.mulVec p) j) →
      g m (T.mulVec p) (T.mulVec u) (T.mulVec u) ≤ g n p u u

/-- Lemma 8.5: a stochastic map with a stochastic left inverse is an isometry for
every monotone metric. -/
theorem monotoneMetric_equality_of_leftInverse (G : MonotoneMetric)
    {n m : ℕ} (T : Matrix (Fin m) (Fin n) ℝ) (S : Matrix (Fin n) (Fin m) ℝ)
    (hT : IsColumnStochastic T) (hS : IsColumnStochastic S)
    (hST : S * T = 1) (p u : Fin n → ℝ)
    (hp : ∀ i, 0 < p i) (hq : ∀ j, 0 < (T.mulVec p) j) :
    G.g n p u u = G.g m (T.mulVec p) (T.mulVec u) (T.mulVec u) := by
  have h1 : G.g m (T.mulVec p) (T.mulVec u) (T.mulVec u) ≤ G.g n p u u :=
    G.monotone n m T hT p u hp hq
  have hSTp : S.mulVec (T.mulVec p) = p := by
    rw [Matrix.mulVec_mulVec, hST, Matrix.one_mulVec]
  have hSTu : S.mulVec (T.mulVec u) = u := by
    rw [Matrix.mulVec_mulVec, hST, Matrix.one_mulVec]
  have h2 : G.g n p u u ≤ G.g m (T.mulVec p) (T.mulVec u) (T.mulVec u) := by
    have hss : G.g n (S.mulVec (T.mulVec p)) (S.mulVec (T.mulVec u))
          (S.mulVec (T.mulVec u)) ≤ G.g m (T.mulVec p) (T.mulVec u) (T.mulVec u) :=
      G.monotone m n S hS (T.mulVec p) (T.mulVec u) hq (by rw [hSTp]; exact hp)
    rw [hSTp, hSTu] at hss
    exact hss
  exact le_antisymm h2 h1

/-- Proposition 8.9 (target `FisherExplicit`): the Fisher metric of a product of
probability vectors is the direct sum of the factor metrics.  The product
`p ⊗ q` is indexed by `Fin n × Fin m`, with `(p ⊗ q)ᵢⱼ = pᵢ qⱼ` and tangent
vector `u ⊗ q + p ⊗ v`. -/
theorem fisherMetric_product {n m : ℕ} {p : Fin n → ℝ} {q : Fin m → ℝ}
    {u : Fin n → ℝ} {v : Fin m → ℝ} (hp : OpenSimplex p) (hq : OpenSimplex q)
    (hu : IsTangentVector u) (hv : IsTangentVector v) :
    fisherMetric (fun ij : Fin n × Fin m => p ij.1 * q ij.2)
        (fun ij => u ij.1 * q ij.2 + p ij.1 * v ij.2)
        (fun ij => u ij.1 * q ij.2 + p ij.1 * v ij.2)
      = fisherMetric p u u + fisherMetric q v v := by
  rcases hp with ⟨hppos, hps⟩
  rcases hq with ⟨hqpos, hqs⟩
  have hu0 : ∑ i, u i = 0 := hu
  have hv0 : ∑ j, v j = 0 := hv
  simp only [fisherMetric]
  have hprod : (Finset.univ : Finset (Fin n × Fin m)) = Finset.univ ×ˢ Finset.univ := by
    ext ⟨i, j⟩
    simp
  have hf : ∀ (i : Fin n) (j : Fin m),
      (u i * q j + p i * v j) * (u i * q j + p i * v j) / (p i * q j)
        = u i * u i * q j / p i + 2 * (u i * v j) + p i * (v j * v j / q j) := by
    intro i j
    have hp0 : p i ≠ 0 := ne_of_gt (hppos i)
    have hq0 : q j ≠ 0 := ne_of_gt (hqpos j)
    field_simp [hp0, hq0]
    ring
  have hA : (∑ i, ∑ j, u i * u i * q j / p i) = ∑ i, u i * u i / p i := by
    have hfA : ∀ (i : Fin n) (j : Fin m), u i * u i * q j / p i = (u i * u i / p i) * q j := by
      intro i j
      field_simp [ne_of_gt (hppos i)]
    simp only [hfA, ← Finset.mul_sum, hqs, mul_one]
  have hB : (∑ i, ∑ j, 2 * (u i * v j)) = 0 := by
    have hfB : ∀ (i : Fin n) (j : Fin m), 2 * (u i * v j) = (2 * u i) * v j := by
      intro i j
      ring
    simp only [hfB, ← Finset.mul_sum, hv0, mul_zero, Finset.sum_const_zero]
  have hC : (∑ i, ∑ j, p i * (v j * v j / q j)) = ∑ j, v j * v j / q j := by
    rw [Finset.sum_comm]
    simp only [← Finset.sum_mul, hps, one_mul]
  rw [hprod, Finset.sum_product]
  simp only [hf, Finset.sum_add_distrib]
  rw [hA, hB, hC]
  ring

/-- The key identity behind Fisher monotonicity: the gap
`g_p(u, u) - g_{Tp}(Tu, Tu)` is a sum of squares. -/
theorem fisherMetric_gap_eq_sum_squares {m n : ℕ} (T : Matrix (Fin m) (Fin n) ℝ)
    (hT : IsColumnStochastic T) (p u : Fin n → ℝ)
    (hp : ∀ i, 0 < p i) (hq : ∀ j, 0 < (T.mulVec p) j) :
    fisherMetric p u u - fisherMetric (T.mulVec p) (T.mulVec u) (T.mulVec u)
      = ∑ i, ∑ j,
          T j i * p i * (u i / p i - (T.mulVec u) j / (T.mulVec p) j) ^ 2 := by
  have hsumT : ∀ i, ∑ j, T j i = 1 := hT.2
  have hqdef : ∀ j, (T.mulVec p) j = ∑ i, T j i * p i :=
    fun j => Matrix.mulVec_apply_eq_sum T p j
  have hvdef : ∀ j, (T.mulVec u) j = ∑ i, T j i * u i :=
    fun j => Matrix.mulVec_apply_eq_sum T u j
  have hdiv : ∀ (i : Fin n) (j : Fin m),
      T j i * p i * (u i / p i - (T.mulVec u) j / (T.mulVec p) j) ^ 2
        = T j i * u i * (u i / p i)
            - 2 * (T j i * u i) * ((T.mulVec u) j / (T.mulVec p) j)
            + T j i * p i * ((T.mulVec u) j / (T.mulVec p) j) * ((T.mulVec u) j / (T.mulVec p) j) := by
    intro i j
    have hp0 : p i ≠ 0 := ne_of_gt (hp i)
    have hq0 : (T.mulVec p) j ≠ 0 := ne_of_gt (hq j)
    field_simp [hp0, hq0]
    ring
  -- term A: Σᵢ Σⱼ Tⱼᵢ uᵢ (uᵢ / pᵢ) = g_p(u, u)
  have hA : (∑ i, ∑ j, T j i * u i * (u i / p i)) = ∑ i, u i * u i / p i := by
    have hfA : ∀ (i : Fin n) (j : Fin m),
        T j i * u i * (u i / p i) = T j i * (u i * (u i / p i)) := fun i j => by ring
    simp only [hfA, ← Finset.sum_mul, hsumT, one_mul]
    exact Finset.sum_congr rfl fun i _ => (mul_div_assoc (u i) (u i) (p i)).symm
  -- term B: Σᵢ Σⱼ 2 (Tⱼᵢ uᵢ) (vⱼ / qⱼ) = 2 g_q(v, v)
  have hB : (∑ i, ∑ j, 2 * (T j i * u i) * ((T.mulVec u) j / (T.mulVec p) j))
      = 2 * (∑ j, (T.mulVec u) j * (T.mulVec u) j / (T.mulVec p) j) := by
    rw [Finset.sum_comm]
    have hinner : ∀ j : Fin m,
        (∑ i, 2 * (T j i * u i) * ((T.mulVec u) j / (T.mulVec p) j))
          = 2 * ((T.mulVec u) j / (T.mulVec p) j) * (T.mulVec u) j := by
      intro j
      have hfB : ∀ i : Fin n,
          2 * (T j i * u i) * ((T.mulVec u) j / (T.mulVec p) j)
            = (2 * ((T.mulVec u) j / (T.mulVec p) j)) * (T j i * u i) := fun i => by ring
      simp only [hfB, ← Finset.mul_sum]
      rw [← hvdef]
    simp only [hinner]
    have hassoc : ∀ j : Fin m,
        2 * ((T.mulVec u) j / (T.mulVec p) j) * (T.mulVec u) j
          = 2 * (((T.mulVec u) j / (T.mulVec p) j) * (T.mulVec u) j) := fun j => by ring
    simp only [hassoc, ← Finset.mul_sum]
    congr 1
    exact Finset.sum_congr rfl fun j _ => by
      rw [mul_comm, mul_div_assoc]
  -- term C: Σᵢ Σⱼ Tⱼᵢ pᵢ (vⱼ / qⱼ)² = g_q(v, v)
  have hC : (∑ i, ∑ j,
        T j i * p i * ((T.mulVec u) j / (T.mulVec p) j) * ((T.mulVec u) j / (T.mulVec p) j))
      = ∑ j, (T.mulVec u) j * (T.mulVec u) j / (T.mulVec p) j := by
    rw [Finset.sum_comm]
    simp only [← Finset.sum_mul, hqdef]
    exact Finset.sum_congr rfl fun j _ => by
      have hq0 : (T.mulVec p) j ≠ 0 := ne_of_gt (hq j)
      field_simp [hq0]
  -- assemble: R = A - B + C = P - Q
  have hR : (∑ i, ∑ j, T j i * p i * (u i / p i - (T.mulVec u) j / (T.mulVec p) j) ^ 2)
      = (∑ i, u i * u i / p i)
          - (∑ j, (T.mulVec u) j * (T.mulVec u) j / (T.mulVec p) j) := by
    simp only [hdiv, Finset.sum_add_distrib, Finset.sum_sub_distrib]
    rw [hA, hB, hC]
    ring
  exact hR.symm

/-- Fisher monotonicity (the hypothesis of Chentsov's theorem, Theorem 8.4;
computational claim 3): for a column-stochastic `T` the pullback of the Fisher
metric at `T p` is bounded by the Fisher metric at `p`. -/
theorem fisherMetric_monotone {m n : ℕ} (T : Matrix (Fin m) (Fin n) ℝ)
    (hT : IsColumnStochastic T) (p u : Fin n → ℝ)
    (hp : ∀ i, 0 < p i) (hq : ∀ j, 0 < (T.mulVec p) j) :
    fisherMetric (T.mulVec p) (T.mulVec u) (T.mulVec u) ≤ fisherMetric p u u := by
  have hgap := fisherMetric_gap_eq_sum_squares T hT p u hp hq
  have hnonneg : 0 ≤ ∑ i, ∑ j,
      T j i * p i * (u i / p i - (T.mulVec u) j / (T.mulVec p) j) ^ 2 := by
    apply Finset.sum_nonneg
    intro i _
    apply Finset.sum_nonneg
    intro j _
    have hTj : 0 ≤ T j i := hT.1 j i
    have hpi : 0 ≤ p i := le_of_lt (hp i)
    exact mul_nonneg (mul_nonneg hTj hpi) (sq_nonneg _)
  linarith

end Statistical

/-! ## Symplectic geometry (Sections 2 and 3) -/

section Symplectic

/-- A symplectic form on a real vector space: bilinear, alternating, nondegenerate
(linear model of Definition 2.2; standard form of Theorem 3.3). -/
structure SymplecticForm (V : Type*) [AddCommGroup V] [Module ℝ V] where
  /-- The underlying bilinear form. -/
  form : V →ₗ[ℝ] V →ₗ[ℝ] ℝ
  /-- Alternating: `ω(v, v) = 0`. -/
  alternating : ∀ v, form v v = 0
  /-- Nondegenerate in the first slot. -/
  nondegenerate : ∀ v, (∀ w, form v w = 0) → v = 0

/-- Every symplectic form is skew-symmetric. -/
theorem SymplecticForm.skew {V : Type*} [AddCommGroup V] [Module ℝ V]
    (ω : SymplecticForm V) (u v : V) : ω.form u v = - ω.form v u := by
  have h := ω.alternating (u + v)
  simp only [map_add, LinearMap.add_apply] at h
  rw [ω.alternating u, ω.alternating v] at h
  simp only [zero_add, add_zero] at h
  linarith

/-- The standard symplectic form `ω₀ = Σᵢ dxᵢ ∧ dyᵢ` on `ℝⁿ × ℝⁿ`
(Theorem 3.3, target `Darboux`; Haskell witness `darboux`). -/
noncomputable def stdSymplecticForm (n : ℕ) : SymplecticForm ((Fin n → ℝ) × (Fin n → ℝ)) where
  form := LinearMap.mk₂ ℝ
    (fun u v => ∑ i, (u.1 i * v.2 i - u.2 i * v.1 i))
    (fun u₁ u₂ w => by
      simp only [Prod.fst_add, Prod.snd_add, Pi.add_apply]
      rw [← Finset.sum_add_distrib]
      exact Finset.sum_congr rfl fun i _ => by ring)
    (fun c u w => by
      simp only [Prod.smul_fst, Prod.smul_snd, Pi.smul_apply, smul_eq_mul]
      rw [Finset.mul_sum]
      exact Finset.sum_congr rfl fun i _ => by ring)
    (fun u w₁ w₂ => by
      simp only [Prod.fst_add, Prod.snd_add, Pi.add_apply]
      rw [← Finset.sum_add_distrib]
      exact Finset.sum_congr rfl fun i _ => by ring)
    (fun c u w => by
      simp only [Prod.smul_fst, Prod.smul_snd, Pi.smul_apply, smul_eq_mul]
      rw [Finset.mul_sum]
      exact Finset.sum_congr rfl fun i _ => by ring)
  alternating := fun v => by
    simp only [LinearMap.mk₂_apply]
    exact Finset.sum_eq_zero fun i _ => by ring
  nondegenerate := fun v hv => by
    obtain ⟨x, y⟩ := v
    have hx : ∀ k, x k = 0 := by
      intro k
      have hk := hv ⟨0, fun j => if j = k then (1 : ℝ) else 0⟩
      simp only [LinearMap.mk₂_apply] at hk
      simp only [Pi.zero_apply, mul_zero, sub_zero] at hk
      have hs : (∑ i, x i * (if i = k then (1 : ℝ) else 0)) = x k := by
        simp [Finset.sum_ite_eq']
      rw [hs] at hk
      exact hk
    have hy : ∀ k, y k = 0 := by
      intro k
      have hk := hv ⟨fun j => if j = k then (1 : ℝ) else 0, 0⟩
      simp only [LinearMap.mk₂_apply] at hk
      simp only [Pi.zero_apply, mul_zero, zero_sub] at hk
      simp only [Finset.sum_neg_distrib, neg_eq_zero] at hk
      have hs : (∑ i, y i * (if i = k then (1 : ℝ) else 0)) = y k := by
        simp [Finset.sum_ite_eq']
      rw [hs] at hk
      exact hk
    obtain rfl : x = 0 := funext hx
    obtain rfl : y = 0 := funext hy
    rfl

/-- Lemma 3.1 (engine of symplectic Gram–Schmidt): every nonzero vector has a
symplectic partner `w` with `ω(v, w) = 1`. -/
theorem exists_symplectic_partner {V : Type*} [AddCommGroup V] [Module ℝ V]
    (ω : SymplecticForm V) {v : V} (hv : v ≠ 0) :
    ∃ w, ω.form v w = 1 := by
  by_contra h
  push Not at h
  have hzero : ∀ w, ω.form v w = 0 := by
    intro w
    by_contra hw
    push Not at hw
    exact h ((ω.form v w)⁻¹ • w) (by
      rw [map_smul, smul_eq_mul]
      exact inv_mul_cancel₀ hw)
  exact hv (ω.nondegenerate v hzero)

end Symplectic

/-! ## Poisson geometry and coadjoint orbits (Sections 4 and 6) -/

section LiePoisson

variable {L : Type*} [LieRing L] [LieAlgebra ℝ L]

/-- The Kirillov–Kostant–Souriau two-form `ω_ξ(x, y) = ⟨ξ, [x, y]⟩`
(Theorem 4.4, target `KKSSymplectic`; Haskell witness `kksSymplecticForm`). -/
noncomputable def kksForm (ξ : Module.Dual ℝ L) (x y : L) : ℝ :=
  ξ ⁅x, y⁆

theorem kksForm_self (ξ : Module.Dual ℝ L) (x : L) : kksForm ξ x x = 0 := by
  simp [kksForm, lie_self]

theorem kksForm_skew (ξ : Module.Dual ℝ L) (x y : L) :
    kksForm ξ x y = - kksForm ξ y x := by
  simp only [kksForm]
  rw [← lie_skew, map_neg]

/-- The coadjoint stabilizer of `ξ`: the radical carrier of the KKS form at `ξ`
(the kernel of `ad*`, i.e. `g_ξ` in the proof of Theorem 4.4). -/
def coadjointStabilizer (ξ : Module.Dual ℝ L) (x : L) : Prop :=
  ∀ y, kksForm ξ x y = 0

/-- Theorem 4.4 (well-definedness part): the KKS form is insensitive to the
choice of representative modulo the stabilizer, so it descends to
`g / g_ξ ≅ T_ξ O`. -/
theorem kksForm_eq_of_sub_mem_stabilizer (ξ : Module.Dual ℝ L) (x x' y : L)
    (h : coadjointStabilizer ξ (x - x')) :
    kksForm ξ x y = kksForm ξ x' y := by
  have hz := h y
  simp only [kksForm] at hz ⊢
  rw [sub_lie, map_sub] at hz
  linarith

/-- The linear function `ℓ_x` on `g*` attached to `x ∈ g` (Example 4.3). -/
noncomputable def liePoissonLinear (x : L) : Module.Dual ℝ L →ₗ[ℝ] ℝ where
  toFun := fun ξ => ξ x
  map_add' := fun ξ η => by simp
  map_smul' := fun c ξ => by simp

/-- Example 4.3: the Lie–Poisson bracket of linear functions evaluated at `ξ`
is the KKS form: `{ℓ_x, ℓ_y}(ξ) = ⟨ξ, [x, y]⟩`. -/
theorem liePoissonLinear_bracket (x y : L) (ξ : Module.Dual ℝ L) :
    liePoissonLinear ⁅x, y⁆ ξ = kksForm ξ x y :=
  rfl

/-- Example 4.3: the Lie–Poisson bracket of linear functions is antisymmetric. -/
theorem liePoissonLinear_antisymm (x y : L) :
    liePoissonLinear ⁅x, y⁆ = - liePoissonLinear ⁅y, x⁆ := by
  apply LinearMap.ext
  intro ξ
  show ξ ⁅x, y⁆ = - ξ ⁅y, x⁆
  rw [← lie_skew, map_neg]

/-- Proposition 4.5 (`so(3)` case): with the cross-product bracket on
`so(3)* ≅ ℝ³`, the squared-norm Casimir satisfies `⟨ξ, [ξ, x]⟩ = 0` for all
`ξ, x`: the Hamiltonian vector field of the Casimir vanishes. -/
theorem so3_casimir (ξ x : Fin 3 → ℝ) : ξ ⬝ᵥ crossProduct ξ x = 0 :=
  dot_self_cross ξ x

end LiePoisson

/-! ## Integrable systems: monodromy (Section 7) -/

section Monodromy

/-- Example 7.5 / target `MonodromyObstruction`: the monodromy matrix of the
spherical pendulum's period lattice (Haskell witness `pendulumMonodromy`;
the computation is due to Duistermaat 1980). -/
def pendulumMonodromy : Matrix (Fin 2) (Fin 2) ℤ :=
  !![1, 1; 0, 1]

theorem pendulumMonodromy_det : pendulumMonodromy.det = 1 := by
  rw [pendulumMonodromy, Matrix.det_fin_two_of]
  norm_num

/-- The monodromy is nontrivial: parallel transport around the critical value
does not act as the identity on the period lattice. -/
theorem pendulumMonodromy_ne_one :
    pendulumMonodromy ≠ (1 : Matrix (Fin 2) (Fin 2) ℤ) := by
  intro h
  have h01 := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℤ => M 0 1) h
  simp [pendulumMonodromy] at h01

/-- The monodromy is unipotent: `(M - 1)² = 0`. -/
theorem pendulumMonodromy_unipotent :
    (pendulumMonodromy - 1) ^ 2 = (0 : Matrix (Fin 2) (Fin 2) ℤ) := by
  have hA : pendulumMonodromy - 1 = !![0, 1; 0, 0] := by
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [pendulumMonodromy, Matrix.sub_apply]
  rw [hA, pow_two]
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

end Monodromy

end Cmrps.Vol05
