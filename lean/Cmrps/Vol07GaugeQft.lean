import Mathlib.Algebra.Algebra.Basic
import Mathlib.Algebra.Module.LinearMap.Defs
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.BigOperators.Group.List.Defs
import Mathlib.Algebra.Group.Subgroup.Ker
import Mathlib.Data.ZMod.Basic

/-!
# Volume 07 — gauge structures and quantum field theories

Algebraic core of `papers/latex/vol-07-gauge-qft.tex`. Identifier names mirror the
paper labels:

* `DominantIntegralWeight`, `highestWeightRankOne` — Theorem (Highest-weight
  classification), `thm:highest-weight` (rank-one content only).
* `FrobeniusAlgebra` — Theorem (Two-dimensional topological field theories),
  `thm:frobenius` (commutative Frobenius algebra side of the correspondence).
* `gaugeAction`, `GaugeEquiv` — Definition (Gauge equivalence of connections),
  `def:gauge-equivalence` (pointwise model).
* `AnomalyData`, `AnomalyFree`, `AnomalyFreeList` — Proposition (Anomaly cancellation
  as a linear condition), `prop:cancellation`.
* `AnomalyObstruction`, `QuantizationGate` — Definition (Fermionic anomaly),
  `def:fermionic-anomaly`, Definition (BV-BRST gauge anomaly), `def:bvbrst-anomaly`,
  Proposition (Quantization gate), `prop:anomaly`.
* `GlobalFormInvariant`, `SO3BundleClass` — Example (Global forms and the second
  Stiefel-Whitney class), `ex:global-form` (abstract Z/2-detection model only).

The topological and analytic content of the paper (classifying spaces, homotopy
groups of Lie groups, cohomology rings of `BG`, Dirac determinant lines, BRST
cohomology, tensor categories) is not formalized in this module.
-/

namespace Cmrps.Vol07

/-! ## Dominant integral weights (`thm:highest-weight`) -/

/-- Dominant integral weights of rank `r`: integral weights with nonnegative
coefficients on the fundamental weights. -/
def DominantIntegralWeight (r : ℕ) : Type :=
  { w : Fin r → ℤ // ∀ i, 0 ≤ w i }

/-- Rank-one content of Theorem `thm:highest-weight`: dominant integral weights of
type `A_1` are exactly the multiples `n` of the fundamental weight. -/
def highestWeightRankOne : DominantIntegralWeight 1 ≃ ℕ where
  toFun w := (w.1 0).toNat
  invFun n := ⟨fun _ => (n : ℤ), fun _ => Int.natCast_nonneg n⟩
  left_inv w := by
    apply Subtype.ext
    funext i
    rw [Fin.fin_one_eq_zero i]
    exact Int.toNat_of_nonneg (w.2 0)
  right_inv n := Int.toNat_natCast n

/-! ## Commutative Frobenius algebras (`thm:frobenius`) -/

/-- Commutative Frobenius algebra over `k` on `A`, with a dual basis indexed by `ι`:
the algebraic datum classifying two-dimensional Atiyah theories in Theorem
`thm:frobenius`. -/
structure FrobeniusAlgebra (k A ι : Type*) [CommRing k] [CommRing A] [Algebra k A]
    [Fintype ι] where
  /-- Trace (the counit attached to the disc). -/
  eps : A →ₗ[k] k
  /-- Left half of a dual basis. -/
  e : ι → A
  /-- Right half of a dual basis. -/
  f : ι → A
  /-- Every element is reconstructed from its pairings against the dual basis. -/
  left_dual : ∀ a : A, ∑ i, eps (f i * a) • e i = a

namespace FrobeniusAlgebra

variable {k A ι : Type*} [CommRing k] [CommRing A] [Algebra k A] [Fintype ι]

/-- The Frobenius pairing `(a, b) ↦ eps (a * b)` is symmetric. -/
theorem pairing_comm (F : FrobeniusAlgebra k A ι) (a b : A) :
    F.eps (a * b) = F.eps (b * a) := by
  rw [mul_comm]

/-- Left-nondegeneracy: an element pairing to zero against every other element
vanishes. -/
theorem nondegenerate_left (F : FrobeniusAlgebra k A ι) (a : A)
    (h : ∀ b : A, F.eps (b * a) = 0) : a = 0 := by
  have hz : ∀ i, F.eps (F.f i * a) • F.e i = 0 := by
    intro i
    simp [h]
  have hsum := F.left_dual a
  rw [Finset.sum_eq_zero (fun i _ => hz i)] at hsum
  exact hsum.symm

/-- Right-nondegeneracy of the pairing. -/
theorem nondegenerate_right (F : FrobeniusAlgebra k A ι) (a : A)
    (h : ∀ b : A, F.eps (a * b) = 0) : a = 0 :=
  F.nondegenerate_left a fun b => by
    rw [mul_comm]
    exact h b

/-- A nonzero element pairs nontrivially against some element. -/
theorem exists_pairing_ne_zero (F : FrobeniusAlgebra k A ι) {a : A} (ha : a ≠ 0) :
    ∃ b : A, F.eps (a * b) ≠ 0 :=
  Classical.byContradiction fun H =>
    ha (F.nondegenerate_right a fun b => Classical.byContradiction fun hb => H ⟨b, hb⟩)

/-- The Euler element `m (Δ(1))` of the punctured torus. -/
def euler (F : FrobeniusAlgebra k A ι) : A :=
  ∑ i, F.e i * F.f i

/-- The genus-one partition function `eps (euler)`. -/
def genusOne (F : FrobeniusAlgebra k A ι) : k :=
  F.eps F.euler

/-- The genus-one partition function is the sum of the dual-basis pairings. -/
theorem genusOne_eq (F : FrobeniusAlgebra k A ι) :
    F.genusOne = ∑ i, F.eps (F.e i * F.f i) := by
  simp [genusOne, euler]

end FrobeniusAlgebra

/-! ## Gauge action and gauge equivalence (`def:gauge-equivalence`) -/

/-- Pointwise model of Definition `def:gauge-equivalence`: the gauge group `X → H`
acts on field configurations `X → V`. -/
def gaugeAction {X H V : Type*} [Monoid H] [MulAction H V] (g : X → H) (A : X → V) :
    X → V :=
  fun x => g x • A x

theorem gaugeAction_one {X H V : Type*} [Monoid H] [MulAction H V] (A : X → V) :
    gaugeAction (1 : X → H) A = A := by
  funext x
  simp [gaugeAction]

theorem gaugeAction_mul {X H V : Type*} [Monoid H] [MulAction H V] (g₁ g₂ : X → H)
    (A : X → V) :
    gaugeAction (g₁ * g₂) A = gaugeAction g₁ (gaugeAction g₂ A) := by
  funext x
  simp [gaugeAction, mul_smul]

/-- Definition `def:gauge-equivalence`: `B` is the image of `A` under the gauge
transformation `g`. -/
def GaugeEquiv {X H V : Type*} [Monoid H] [MulAction H V] (g : X → H) (A B : X → V) :
    Prop :=
  gaugeAction g A = B

theorem gaugeEquiv_refl {X H V : Type*} [Monoid H] [MulAction H V] (A : X → V) :
    GaugeEquiv (1 : X → H) A A :=
  gaugeAction_one A

theorem gaugeEquiv_trans {X H V : Type*} [Monoid H] [MulAction H V] {g₁ g₂ : X → H}
    {A B C : X → V} (h₁ : GaugeEquiv g₁ A B) (h₂ : GaugeEquiv g₂ B C) :
    GaugeEquiv (g₂ * g₁) A C := by
  show gaugeAction (g₂ * g₁) A = C
  rw [gaugeAction_mul, h₁, h₂]

theorem gaugeEquiv_symm {X H V : Type*} [Group H] [MulAction H V] {g : X → H}
    {A B : X → V} (h : GaugeEquiv g A B) : GaugeEquiv g⁻¹ B A := by
  have h' : ∀ x, g x • A x = B x := fun x => by
    have hx := congrFun h x
    simpa [gaugeAction] using hx
  funext x
  show (g x)⁻¹ • B x = A x
  rw [← h' x, inv_smul_smul]

/-! ## Anomaly cancellation as a linear condition (`prop:cancellation`) -/

/-- Anomaly data of Proposition `prop:cancellation`: the additivity homomorphism
`alpha : R(G) → A` from the representation ring to the anomaly coefficient group. -/
structure AnomalyData (R A : Type*) [AddCommGroup R] [AddCommGroup A] where
  /-- Additivity homomorphism of the anomaly coefficient. -/
  alpha : R →+ A

namespace AnomalyData

variable {R A : Type*} [AddCommGroup R] [AddCommGroup A]

/-- A virtual representation is anomaly-free when its contribution to the anomaly
vanishes (Definition `def:fermionic-anomaly`, Proposition `prop:cancellation`). -/
def AnomalyFree (d : AnomalyData R A) (x : R) : Prop :=
  d.alpha x = 0

/-- Proposition `prop:cancellation`: the anomaly-free elements are exactly the
kernel of `alpha`. -/
theorem anomaly_free_iff_mem_ker (d : AnomalyData R A) (x : R) :
    d.AnomalyFree x ↔ x ∈ d.alpha.ker := by
  simp [AnomalyFree]

theorem anomaly_free_zero (d : AnomalyData R A) : d.AnomalyFree 0 := by
  simp [AnomalyFree]

theorem anomaly_free_add (d : AnomalyData R A) {x y : R} (hx : d.AnomalyFree x)
    (hy : d.AnomalyFree y) : d.AnomalyFree (x + y) := by
  have hx' : d.alpha x = 0 := hx
  have hy' : d.alpha y = 0 := hy
  simp [AnomalyFree, hx', hy']

theorem anomaly_free_neg (d : AnomalyData R A) {x : R} (hx : d.AnomalyFree x) :
    d.AnomalyFree (-x) := by
  have hx' : d.alpha x = 0 := hx
  simp [AnomalyFree, hx']

/-- Matter lists of Proposition `prop:cancellation`: the list is admissible when the
total anomaly of its members vanishes. -/
def AnomalyFreeList (d : AnomalyData R A) (l : List R) : Prop :=
  d.alpha l.sum = 0

theorem map_list_sum (d : AnomalyData R A) (l : List R) :
    d.alpha l.sum = (l.map d.alpha).sum :=
  _root_.map_list_sum d.alpha l

theorem anomaly_free_list_iff_sum_map (d : AnomalyData R A) (l : List R) :
    d.AnomalyFreeList l ↔ (l.map d.alpha).sum = 0 := by
  simp [AnomalyFreeList, map_list_sum]

/-- Proposition `prop:cancellation`: anomaly-free matter lists form the kernel of
`alpha`, tested on the sum of the list. -/
theorem anomaly_free_list_iff_mem_ker (d : AnomalyData R A) (l : List R) :
    d.AnomalyFreeList l ↔ l.sum ∈ d.alpha.ker := by
  simp [AnomalyFreeList]

theorem anomaly_free_list_nil (d : AnomalyData R A) : d.AnomalyFreeList [] := by
  simp [AnomalyFreeList]

/-- Additivity of the anomaly on concatenation of matter lists. -/
theorem anomaly_free_list_append (d : AnomalyData R A) (l₁ l₂ : List R) :
    d.AnomalyFreeList (l₁ ++ l₂) ↔ d.alpha l₁.sum + d.alpha l₂.sum = 0 := by
  simp [AnomalyFreeList, List.sum_append, map_add]

end AnomalyData

/-! ## Quantization gate (`prop:anomaly`) -/

/-- Obstruction data of Definition `def:fermionic-anomaly` and Definition
`def:bvbrst-anomaly`: trivializability of the determinant line of the Dirac family
and the local BRST anomaly class in `H^{1,n}(s | d)`. -/
structure AnomalyObstruction (A : Type*) [Zero A] where
  /-- Whether the determinant line `λ_det` is trivializable. -/
  detLineTrivializable : Prop
  /-- The anomaly cocycle `[a]` in local BRST cohomology. -/
  brstClass : A

/-- Proposition `prop:anomaly` (quantization gate): a consistent quantization
requires a trivializable determinant line and a vanishing BRST anomaly class. -/
def QuantizationGate {A : Type*} [Zero A] (o : AnomalyObstruction A) : Prop :=
  o.detLineTrivializable ∧ o.brstClass = 0

theorem quantization_gate_iff {A : Type*} [Zero A] (o : AnomalyObstruction A) :
    QuantizationGate o ↔ o.detLineTrivializable ∧ o.brstClass = 0 :=
  Iff.rfl

theorem not_quantization_gate_of_ne_zero {A : Type*} [Zero A] (o : AnomalyObstruction A)
    (h : o.brstClass ≠ 0) : ¬ QuantizationGate o := fun ⟨_, hb⟩ => h hb

theorem not_quantization_gate_of_not_trivial {A : Type*} [Zero A] (o : AnomalyObstruction A)
    (h : ¬ o.detLineTrivializable) : ¬ QuantizationGate o := fun ⟨ht, _⟩ => h ht

/-- The gate read against the anomaly homomorphism of Proposition `prop:cancellation`. -/
theorem quantization_gate_iff_anomalyFree {R A : Type*} [AddCommGroup R] [AddCommGroup A]
    (d : AnomalyData R A) (x : R) (t : Prop) :
    QuantizationGate ⟨t, d.alpha x⟩ ↔ t ∧ d.AnomalyFree x :=
  Iff.rfl

/-! ## Global forms and the second Stiefel-Whitney class (`ex:global-form`) -/

/-- Model of Example `ex:global-form`: a two-valued invariant `w2` detecting the
isomorphism classes of principal `SO(3)`-bundles over `S²`. The geometric statement
(`π₁(SO(3)) ≅ ℤ/2`, `π₁(SU(2)) = 0`) is not formalized here. -/
structure GlobalFormInvariant (B : Type*) where
  /-- Second Stiefel-Whitney class as a `ℤ/2`-valued invariant. -/
  w2 : B → ZMod 2
  /-- Class of the trivial bundle. -/
  trivial : B
  /-- The trivial bundle has vanishing `w2`. -/
  w2_trivial : w2 trivial = 0
  /-- Some class has nonvanishing `w2`, so `w2` detects nontriviality. -/
  exists_nontrivial : ∃ b : B, w2 b ≠ 0

/-- Model of the two isomorphism classes of principal `SO(3)`-bundles over `S²`. -/
abbrev SO3BundleClass : Type := ZMod 2

/-- Second Stiefel-Whitney class in the model. -/
def w2 : SO3BundleClass → ZMod 2 := id

/-- The model of Example `ex:global-form`: two classes over `S²`, detected by `w2`. -/
def so3_w2_detection : GlobalFormInvariant SO3BundleClass where
  w2 := w2
  trivial := 0
  w2_trivial := rfl
  exists_nontrivial := ⟨1, by decide⟩

theorem so3_two_classes : Fintype.card SO3BundleClass = 2 :=
  ZMod.card 2

/-- Nonvanishing `w2` certifies that the class is not the trivial one. -/
theorem w2_detects_nontrivial {B : Type*} (F : GlobalFormInvariant B) {b : B}
    (h : F.w2 b ≠ 0) : b ≠ F.trivial := by
  intro hb
  rw [hb] at h
  exact h F.w2_trivial

/-- Model of the `SU(2)` side of Example `ex:global-form`: `π₁(SU(2)) = 0` forces a
single (trivial) isomorphism class of principal `SU(2)`-bundles over `S²`. -/
def SU2BundleClass : Type := PUnit

theorem su2_bundles_over_s2_trivial (b : SU2BundleClass) : b = ⟨⟩ := by
  cases b
  rfl

end Cmrps.Vol07
