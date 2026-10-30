/-
Copyright (c) 2026 CMRPS formalization. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: CMRPS module writer
-/

import Mathlib.Tactic
import Mathlib.Data.Quot
import Mathlib.Basic.Countable.Defs
import Mathlib.Logic.Equiv.Set
import Mathlib.SetTheory.Cardinal.Finite
import Mathlib.Data.Fintype.OfMap
import Mathlib.Data.Multiset.Bind
import Mathlib.Data.Multiset.Count
import Mathlib.Algebra.BigOperators.Group.Multiset.Basic
import Mathlib.Algebra.BigOperators.Ring.Multiset
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Matrix.Diagonal
import Mathlib.LinearAlgebra.Matrix.ConjTranspose
import Mathlib.Topology.Constructions
import Mathlib.Topology.Continuous
import Mathlib.Topology.Algebra.MulAction

/-!
# Fundamental structural families of mathematical physics

Formalization targets from `papers/latex/vol-02-structural-families.tex`
(Vol. 2: Fundamental Structural Families). Claim labels mirror
`verification/vol-02-structural-families-lean-targets.md`:

1. `sharpness_criterion`   — paper Theorem 3.2 (parts a, b, d; part c is set-theoretic only,
   constructibility is Chevalley's theorem and is recorded as a conjectural input)
2. `globality_symplectic`  — paper Proposition 3.4 (constancy consequence, Darboux as input)
3. `achievement_kinds_exhaustive` — paper Proposition 3.7
4. `dim_vector_classification`    — paper Theorem 7.1 (finiteness at fixed dimension;
   the Wedderburn structure theorem is a literature input)
5. `induced_dimension_vector`     — paper Proposition 4.2 (dimension-vector combinatorics;
   `M_a(ℂ) ⊗ M_b(ℂ) ≅ M_{ab}(ℂ)` is the load-bearing input)
6. `kraus_rank_not_injective`     — paper Proposition 11.2
7. `cotangent_retract`            — paper Proposition 4.1 (the homotopy `r_t`)
8. `exceptional_not_closed`       — paper Proposition 15.1
9. `invariants_not_independence`  — paper Proposition 16.2 (schema; Gelfand input)
10. `comparability_of_records`    — paper Proposition 18.1
-/

namespace Cmrps.Vol02

universe u v w

/-! ## Family records (paper Definitions 2.1–2.2) -/

/-- Paper Definition 2.1: a family record is a triple `(F, V, I)` with `F` the family of
objects, `V` the invariant range, `I` the invariant map, constant on `≃`-classes. -/
structure FamilyRecord where
  /-- Objects of the family. -/
  Obj : Type u
  /-- The invariant range. -/
  V : Type v
  /-- The physical equivalence relation on objects (paper relation `≃`). -/
  r : Obj → Obj → Prop
  /-- Physical equivalence is an equivalence relation. -/
  rEquiv : Equivalence r
  /-- The invariant map. -/
  I : Obj → V
  /-- The invariant is constant on `≃`-classes. -/
  constOnClasses : ∀ a b, r a b → I a = I b

namespace FamilyRecord

/-- Paper Definition 2.1: the invariant is *classifying* (complete) when
`I(P) = I(Q)` implies `P ≃ Q`. -/
def Classifying (R : FamilyRecord) : Prop := ∀ a b : R.Obj, R.I a = R.I b → R.r a b

/-- Paper Definition 2.2: a record is invariant-complete when its invariant is classifying. -/
def InvariantComplete (R : FamilyRecord) : Prop := R.Classifying

/-- The setoid induced by the physical equivalence. -/
def toSetoid (R : FamilyRecord) : Setoid R.Obj := ⟨R.r, R.rEquiv⟩

/-- Paper Theorem 3.2(1): the assignment `[P] ↦ I(P)` on `≃`-classes. -/
def inducedMap (R : FamilyRecord) : Quotient R.toSetoid → R.V :=
  Quotient.lift R.I (fun _ _ h => R.constOnClasses _ _ h)

@[simp]
theorem inducedMap_mk (R : FamilyRecord) (a : R.Obj) :
    R.inducedMap (Quotient.mk R.toSetoid a) = R.I a := rfl

/-- Paper Theorem 3.2(1): the induced map is well defined (the invariant is constant
on classes), restated as an equality of invariants on equivalent objects. -/
theorem sharpness_well_defined (R : FamilyRecord) {a b : R.Obj} (h : R.r a b) :
    R.I a = R.I b :=
  R.constOnClasses a b h

/-- Paper Theorem 3.2(1): for an invariant-complete record the induced map on classes
is injective. -/
theorem inducedMap_injective (R : FamilyRecord) (h : R.Classifying) :
    Function.Injective R.inducedMap := by
  intro q₁ q₂ he
  revert he
  refine Quotient.inductionOn₂ q₁ q₂ ?_
  intro a b he
  have heq : R.I a = R.I b := he
  exact Quotient.sound (h a b heq)

/-- Paper Theorem 3.2(1): completeness is exactly the statement that `I` separates
classes, i.e. the induced map on classes is injective. -/
theorem classifying_iff (R : FamilyRecord) :
    R.Classifying ↔ Function.Injective R.inducedMap :=
  ⟨R.inducedMap_injective, fun hinj a b he => by
    have hq := hinj (show R.inducedMap (Quotient.mk R.toSetoid a)
        = R.inducedMap (Quotient.mk R.toSetoid b) from he)
    exact Quotient.exact hq⟩

/-- Paper Theorem 3.2(2): if the range is finite with `|V| = N`, then the number of
`≃`-classes is at most `N`. -/
theorem sharpness_card_bound (R : FamilyRecord) (h : R.Classifying) [Fintype R.V] {N : ℕ}
    (hN : Fintype.card R.V = N) : Nat.card (Quotient R.toSetoid) ≤ N := by
  have hle : Nat.card (Quotient R.toSetoid) ≤ Nat.card R.V :=
    Nat.card_le_card_of_injective R.inducedMap (R.inducedMap_injective h)
  have hV : Nat.card R.V = N := by
    rw [Nat.card_eq_fintype_card]
    exact hN
  rw [hV] at hle
  exact hle

/-- Paper Theorem 3.2(3), set-theoretic content: the classes inject into any subset of
the range containing the attained values of `I` (e.g. the `k`-points of the image of a
finite-type morphism). Constructibility of that image is Chevalley's theorem and is not
formalized here; see `verification/vol-02-structural-families-conjectures.md`. -/
theorem sharpness_injects_into_superset (R : FamilyRecord) (h : R.Classifying)
    (s : Set R.V) (hs : Set.range R.I ⊆ s) :
    ∃ f : Quotient R.toSetoid → ↥s, Function.Injective f := by
  refine ⟨fun q => ⟨R.inducedMap q, ?_⟩, ?_⟩
  · have hq : R.inducedMap q = R.I (Quotient.out q) := by
      conv_lhs => rw [← Quotient.out_eq q]
      rfl
    rw [hq]
    exact hs ⟨Quotient.out q, rfl⟩
  · intro q₁ q₂ he
    exact R.inducedMap_injective h (Subtype.ext_iff.mp he)

/-- Paper Theorem 3.2(4): if the class set is uncountable, no invariant-complete record
for the family has countable range. -/
theorem sharpness_uncountable (R : FamilyRecord) (h : R.Classifying)
    (hU : Uncountable (Quotient R.toSetoid)) : ¬ Countable R.V := by
  intro hc
  haveI := hc
  exact hU.not_countable (Function.Injective.countable (R.inducedMap_injective h))

end FamilyRecord

/-! ## Globality in the symplectic family (paper Proposition 3.4) -/

/-- Symplectic germs of a fixed dimension `2n` with `n ≥ 1`, with symplectomorphism of
germs as the equivalence. Darboux's theorem is recorded as an input field. -/
structure SymplecticGermField where
  /-- The type of symplectic germs of dimension `2n`. -/
  Germ : Type u
  /-- Symplectomorphism of germs. -/
  SympEq : Germ → Germ → Prop
  /-- Symplectomorphism is an equivalence relation. -/
  sympEq_equiv : Equivalence SympEq
  /-- Darboux's theorem (literature input): every `2n`-dimensional symplectic germ is
  symplectomorphic to the standard germ. -/
  darboux : ∀ g h : Germ, SympEq g h

/-- A germ invariant: a map on germs invariant under symplectomorphism of germs. -/
def GermInvariant {G : SymplecticGermField} {A : Type v} (f : G.Germ → A) : Prop :=
  ∀ g h : G.Germ, G.SympEq g h → f g = f h

/-- Paper Proposition 3.4: every germ invariant is constant at every point. The
hypothesis `n ≥ 1` is carried by `Darboux` holding on the germ type. -/
theorem globality_symplectic {G : SymplecticGermField} {A : Type v} {f : G.Germ → A}
    (hf : GermInvariant f) : ∀ g h : G.Germ, f g = f h :=
  fun g h => hf g h (G.darboux g h)

/-- Paper Proposition 3.4 consequence, as formalized: every germ invariant is *constant*
on all germs (a restatement of `globality_symplectic`). **Scope caveat (Codex review,
round 2):** the paper's "no local classifier" reading additionally needs global objects,
a pair of non-equivalent objects, and a classifier predicate separating them — none is
formalized here (and since `G.darboux` makes all germs equivalent, a constant invariant
does classify the germ equivalence). The name records the paper's corollary; the
statement is germ constancy and no more. -/
theorem globality_no_local_classifier {G : SymplecticGermField} {A : Type v}
    {f : G.Germ → A} (hf : GermInvariant f) (g h : G.Germ) : f g = f h :=
  globality_symplectic hf g h

/-! ## Achievement kinds (paper Definition 3.6, Proposition 3.7) -/

/-- Paper Definition 3.6: the five achievement kinds of a classified sector. -/
inductive AchievementKind where
  /-- Complete and parameterized. -/
  | completeAndParameterized : AchievementKind
  /-- Complete and unparameterized. -/
  | completeAndUnparameterized : AchievementKind
  /-- Complete as an obstruction classification. -/
  | completeAsObstruction : AchievementKind
  /-- Impossible: an impossibility theorem is on record. -/
  | impossible : AchievementKind
  /-- No record: no classification and no impossibility theorem on record. -/
  | noRecord : AchievementKind

/-- Paper Definition 3.6: a sector together with the three ordered conditions
(record exists, impossibility theorem exists, obstructions classified,
attained values parameterized). -/
structure Sector where
  /-- A theorem on record names a classifying invariant. -/
  hasClassifyingRecord : Bool
  /-- An impossibility theorem is on record. -/
  hasImpossibilityTheorem : Bool
  /-- The recorded classification classifies obstructions rather than objects. -/
  classifiesObstructions : Bool
  /-- The attained values of the invariant form an explicitly described subset
  of a structured range (only meaningful when a record names objects). -/
  parameterizedValues : Bool

/-- Paper Definition 3.6: the kind determined by the ordered tests of the sector. -/
def kindOf : Sector → AchievementKind
  | ⟨false, false, _, _⟩ => AchievementKind.noRecord
  | ⟨_, true, _, _⟩ => AchievementKind.impossible
  | ⟨true, false, true, _⟩ => AchievementKind.completeAsObstruction
  | ⟨true, false, false, true⟩ => AchievementKind.completeAndParameterized
  | ⟨true, false, false, false⟩ => AchievementKind.completeAndUnparameterized

/-- Paper Definition 3.6: the conditions under which a kind applies to a sector. -/
def KindApplies : AchievementKind → Sector → Prop
  | .completeAndParameterized, s =>
      s.hasClassifyingRecord = true ∧ s.hasImpossibilityTheorem = false ∧
        s.classifiesObstructions = false ∧ s.parameterizedValues = true
  | .completeAndUnparameterized, s =>
      s.hasClassifyingRecord = true ∧ s.hasImpossibilityTheorem = false ∧
        s.classifiesObstructions = false ∧ s.parameterizedValues = false
  | .completeAsObstruction, s =>
      s.hasClassifyingRecord = true ∧ s.hasImpossibilityTheorem = false ∧
        s.classifiesObstructions = true
  | .impossible, s =>
      s.hasImpossibilityTheorem = true
  | .noRecord, s =>
      s.hasClassifyingRecord = false ∧ s.hasImpossibilityTheorem = false

/-- Paper Proposition 3.7: the kind assigned by the ordered tests applies. -/
theorem kindOf_applies (s : Sector) : KindApplies (kindOf s) s := by
  rcases s with ⟨a, b, c, d⟩
  cases a <;> cases b <;> cases c <;> cases d <;> simp [KindApplies, kindOf]

/-- Paper Proposition 3.7: the kind assigned by the ordered tests is the only one
that applies. -/
theorem kindOf_unique (s : Sector) (k : AchievementKind) (hk : KindApplies k s) :
    k = kindOf s := by
  rcases s with ⟨a, b, c, d⟩
  cases a <;> cases b <;> cases c <;> cases d <;> cases k <;>
    simp [KindApplies, kindOf] at hk ⊢

/-- Paper Proposition 3.7: exactly one of the five achievement kinds applies to any
sector; the five are pairwise exclusive and exhaustive. -/
theorem achievement_kinds_exhaustive (s : Sector) :
    ∃! k : AchievementKind, KindApplies k s :=
  ⟨kindOf s, kindOf_applies s, fun _ hk => kindOf_unique s _ hk⟩

/-! ## Dimension vectors (paper Theorem 7.1, Proposition 4.2) -/

/-- Paper Theorem 7.1: a dimension vector is a finite multiset of positive integers
(the matrix block sizes of a unital finite-dimensional complex C*-algebra). -/
abbrev DimensionVector := Multiset ℕ

namespace DimensionVector

/-- Paper Theorem 7.1: dimension vectors have positive entries. -/
def Pos (v : DimensionVector) : Prop := ∀ n ∈ v, 0 < n

/-- Paper Theorem 7.1: the total complex dimension `d = Σᵢ nᵢ²`. -/
def totalDim (v : DimensionVector) : ℕ := (v.map (· ^ 2)).sum

/-- Paper Proposition 4.2: the dimension vector of a direct sum is the multiset union. -/
def sum (v w : DimensionVector) : DimensionVector := v + w

/-- Paper Proposition 4.2: the dimension vector of a tensor product is the multiset of
pairwise products `{nᵢ mⱼ}`. Written with the multiset product notation `×ˢ`
(`Multiset.product`). -/
def tensor (v w : DimensionVector) : DimensionVector :=
  (v ×ˢ w).map fun p => p.1 * p.2

theorem pos_sum {v w : DimensionVector} (hv : v.Pos) (hw : w.Pos) : (sum v w).Pos :=
  fun n hn => by
    rcases Multiset.mem_add.1 hn with h | h
    · exact hv n h
    · exact hw n h

/-- Membership in a multiset product (thin alias for Mathlib's `Multiset.mem_product`). -/
private theorem mem_product {v w : Multiset ℕ} {p : ℕ × ℕ} :
    p ∈ (v ×ˢ w) ↔ p.1 ∈ v ∧ p.2 ∈ w :=
  Multiset.mem_product

theorem pos_tensor {v w : DimensionVector} (hv : v.Pos) (hw : w.Pos) :
    (tensor v w).Pos := by
  intro n hn
  rcases Multiset.mem_map.1 hn with ⟨p, hp, rfl⟩
  rcases mem_product.1 hp with ⟨h₁, h₂⟩
  exact Nat.mul_pos (hv p.1 h₁) (hw p.2 h₂)

theorem totalDim_sum (v w : DimensionVector) :
    totalDim (sum v w) = totalDim v + totalDim w := by
  simp [totalDim, sum, Multiset.map_add, Multiset.sum_add]

/-- Helper for `totalDim_tensor`: summing `f p.1 * g p.2` over a product multiset
factors as a product of sums. -/
private lemma sum_product_map (v w : Multiset ℕ) (f g : ℕ → ℕ) :
    ((v ×ˢ w).map fun p => f p.1 * g p.2).sum = (v.map f).sum * (w.map g).sum := by
  refine Multiset.induction_on v ?_ ?_
  · simp [Multiset.zero_product]
  · intro a v ih
    rw [Multiset.cons_product, Multiset.map_add, Multiset.sum_add, Multiset.map_map, ih,
      Multiset.map_cons, Multiset.sum_cons, add_mul]
    congr 1
    show (w.map fun b => f a * g b).sum = f a * (w.map g).sum
    exact Multiset.sum_map_mul_left

theorem totalDim_tensor (v w : DimensionVector) :
    totalDim (tensor v w) = totalDim v * totalDim w := by
  show (((v ×ˢ w).map fun p => p.1 * p.2).map (· ^ 2)).sum
    = (v.map (· ^ 2)).sum * (w.map (· ^ 2)).sum
  rw [Multiset.map_map]
  have h1 : (v ×ˢ w).map ((· ^ 2) ∘ fun p : ℕ × ℕ => p.1 * p.2)
      = (v ×ˢ w).map fun p => p.1 ^ 2 * p.2 ^ 2 :=
    congrArg (Multiset.map · (v ×ˢ w)) (funext fun p => mul_pow p.1 p.2 2)
  rw [h1]
  exact sum_product_map v w (· ^ 2) (· ^ 2)

/-! ### Finiteness at fixed total dimension (paper Theorem 7.1) -/

private lemma sq_le_sum_map (v : Multiset ℕ) : ∀ n ∈ v, n ^ 2 ≤ (v.map (· ^ 2)).sum := by
  refine Multiset.induction_on v ?_ ?_
  · intro n hn
    exact absurd hn (by simp)
  · intro a v ih n hn
    rw [Multiset.map_cons, Multiset.sum_cons]
    rcases Multiset.mem_cons.1 hn with h | h
    · subst h
      exact Nat.le_add_right _ _
    · exact (ih n h).trans (Nat.le_add_left _ _)

private lemma le_totalDim_of_mem {v : DimensionVector} (hp : v.Pos) {n : ℕ}
    (hmem : n ∈ v) : n ≤ v.totalDim := by
  have hn : n ≤ n ^ 2 := by
    have h1 : 1 ≤ n := hp n hmem
    simpa [pow_two] using Nat.mul_le_mul_right n h1
  have h2 : n ^ 2 ≤ (v.map (· ^ 2)).sum := sq_le_sum_map v n hmem
  exact hn.trans (by simpa [totalDim] using h2)

private lemma card_le_totalDim : ∀ {v : DimensionVector}, v.Pos → v.card ≤ v.totalDim := by
  intro v
  refine Multiset.induction_on v ?_ ?_
  · intro hp
    simp [totalDim]
  · intro a v ih hp
    have h1 : 1 ≤ a := hp a (Multiset.mem_cons_self a v)
    have ha : (1 : ℕ) ≤ a ^ 2 := by
      simpa [pow_two] using Nat.mul_le_mul h1 h1
    have hpv : Pos v := fun n hn => hp n (Multiset.mem_cons.2 (Or.inr hn))
    have ih' := ih hpv
    rw [totalDim] at ih'
    rw [totalDim, Multiset.card_cons, Multiset.map_cons, Multiset.sum_cons]
    omega

/-- Multiplicity encoding of a dimension vector: entry `i` counts the block size `i.val + 1`. -/
private def encode (d : ℕ) (v : DimensionVector) (hv : v.Pos ∧ v.totalDim = d) :
    Fin d → Fin (d + 1) :=
  fun i => ⟨v.count (i.val + 1), by
    have h1 : v.count (i.val + 1) ≤ v.card := Multiset.count_le_card _ _
    have h2 : v.card ≤ d := by
      have := card_le_totalDim hv.1
      omega
    omega⟩

private lemma encode_injective (d : ℕ) (v w : DimensionVector)
    (hv : v.Pos ∧ v.totalDim = d) (hw : w.Pos ∧ w.totalDim = d)
    (he : encode d v hv = encode d w hw) : v = w := by
  apply Multiset.ext'
  intro a
  have hvb : ∀ n ∈ v, n ≤ d := fun n hn => by
    have := le_totalDim_of_mem hv.1 hn
    omega
  have hwb : ∀ n ∈ w, n ≤ d := fun n hn => by
    have := le_totalDim_of_mem hw.1 hn
    omega
  by_cases ha : a = 0
  · subst ha
    have h1 : (0 : ℕ) ∉ v := fun h => absurd (hv.1 0 h) (by omega)
    have h2 : (0 : ℕ) ∉ w := fun h => absurd (hw.1 0 h) (by omega)
    rw [Multiset.count_eq_zero_of_notMem h1, Multiset.count_eq_zero_of_notMem h2]
  by_cases hbound : d < a
  · have h1 : a ∉ v := fun h => absurd (hvb a h) (by omega)
    have h2 : a ∉ w := fun h => absurd (hwb a h) (by omega)
    rw [Multiset.count_eq_zero_of_notMem h1, Multiset.count_eq_zero_of_notMem h2]
  have hpos : 0 < a := Nat.pos_of_ne_zero ha
  have hle : a ≤ d := by omega
  have hi : a - 1 < d := by omega
  have hmod : (a - 1 : ℕ) + 1 = a := by omega
  have heq := congrFun he ⟨a - 1, hi⟩
  have hcount : v.count ((⟨a - 1, hi⟩ : Fin d).val + 1)
      = w.count ((⟨a - 1, hi⟩ : Fin d).val + 1) :=
    congrArg (fun x : Fin (d + 1) => x.val) heq
  simpa [hmod] using hcount

/-- Paper Theorem 7.1: at fixed total complex dimension `d` the number of dimension
vectors is finite. -/
theorem dimVector_finite (d : ℕ) :
    Set.Finite {v : DimensionVector | v.Pos ∧ v.totalDim = d} := by
  let s : Set DimensionVector := {v | v.Pos ∧ v.totalDim = d}
  have hinj : Function.Injective (fun v : ↥s => encode d v.1 v.2) := by
    rintro ⟨v, hv⟩ ⟨w, hw⟩ he
    simp only [Subtype.mk.injEq]
    exact encode_injective d v w hv hw he
  haveI : Fintype ↥s := Fintype.ofInjective _ hinj
  exact Set.toFinite s

end DimensionVector

/-! ## Kraus rank is not injective (paper Proposition 11.2) -/

/-- The algebra of `2 × 2` complex matrices. -/
abbrev Kraus.M := Matrix (Fin 2) (Fin 2) ℂ

namespace Kraus

open scoped Matrix

/-- Paper Proposition 11.2: the unitary channel `Φ_U(X) = U X U*`. -/
def φ (U : M) (X : M) : M := U * X * U ᴴ

/-- Paper Proposition 11.2: the equivalence relation in force on channels is equality
of completely positive maps. -/
def SameChannel (Φ Ψ : M → M) : Prop := ∀ X : M, Φ X = Ψ X

theorem sameChannel_iff (Φ Ψ : M → M) : SameChannel Φ Ψ ↔ Φ = Ψ :=
  ⟨fun h => funext h, fun h _ => by rw [h]⟩

/-- Unitary matrices in `M₂(ℂ)`. -/
def IsUnitary (U : M) : Prop := U * U ᴴ = 1 ∧ U ᴴ * U = 1

/-- A Kraus representation of `Φ` with `n` operators. -/
def KrausRep (Φ : M → M) (ops : List M) : Prop :=
  ∀ X : M, Φ X = (ops.map (fun A => A * X * A ᴴ)).sum

/-- Paper Proposition 11.2: Kraus rank is the length of a minimal Kraus representation. -/
def IsKrausRank (n : ℕ) (Φ : M → M) : Prop :=
  (∃ ops, ops.length = n ∧ KrausRep Φ ops) ∧
    ∀ m < n, ∀ ops, ops.length = m → ¬ KrausRep Φ ops

theorem kraus_rep_one (U : M) : KrausRep (φ U) [U] := by
  intro X
  show U * X * U ᴴ = ([U].map fun A => A * X * A ᴴ).sum
  rw [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, add_zero]

theorem not_kraus_rep_zero (U : M) (hU : IsUnitary U) : ¬ KrausRep (φ U) [] := by
  intro h
  have h1 : (φ U) 1 = 0 := by
    have := h 1
    simpa [List.map_nil, List.sum_nil] using this
  have h2 : (φ U) 1 = 1 := by
    show U * 1 * U ᴴ = 1
    rw [mul_one, hU.1]
  rw [h2] at h1
  exact one_ne_zero h1

/-- Paper Proposition 11.2: every unitary channel has Kraus rank one. -/
theorem kraus_rank_one (U : M) (hU : IsUnitary U) : IsKrausRank 1 (φ U) := by
  refine ⟨⟨[U], rfl, kraus_rep_one U⟩, ?_⟩
  intro m hm
  have hm0 : m = 0 := by omega
  rintro ops hlen hrep
  subst hm0
  have : ops = [] := by simpa [List.length_eq_zero_iff] using hlen
  subst this
  exact not_kraus_rep_zero U hU hrep

/-- The probe matrix: all entries equal to `1`. -/
private def X : M := Matrix.of fun _ _ => (1 : ℂ)

/-- The probe unitary: `P = diag(1, -1)`. -/
private def v : Fin 2 → ℂ := fun i => if i = 0 then 1 else -1

private def P : M := Matrix.diagonal v

private theorem v_apply_zero : v 0 = 1 := by simp [v]

private theorem v_apply_one : v 1 = -1 := by simp [v]

private theorem v_mul_star (i : Fin 2) : v i * star (v i) = 1 := by
  fin_cases i <;> simp [v]

private theorem P_unitary : IsUnitary P := by
  refine ⟨?_, ?_⟩
  · show P * P ᴴ = 1
    rw [P, Matrix.diagonal_conjTranspose, Matrix.diagonal_mul_diagonal]
    have h : (fun i => v i * (star v) i) = fun _ => (1 : ℂ) := funext fun i => v_mul_star i
    rw [h]
    exact Matrix.diagonal_one'
  · show P ᴴ * P = 1
    rw [P, Matrix.diagonal_conjTranspose, Matrix.diagonal_mul_diagonal]
    have h : (fun i => (star v) i * v i) = fun _ => (1 : ℂ) := by
      funext i
      have h1 : v i * star (v i) = 1 := v_mul_star i
      rw [mul_comm] at h1
      exact h1
    rw [h]
    exact Matrix.diagonal_one'

private theorem one_unitary : IsUnitary (1 : M) := by
  refine ⟨?_, ?_⟩
  · show (1 : M) * 1 ᴴ = 1
    rw [Matrix.conjTranspose_one, mul_one]
  · show (1 : M) ᴴ * 1 = 1
    rw [Matrix.conjTranspose_one, one_mul]

private theorem phi_one : φ 1 = fun Y => Y := by
  funext Y
  show (1 : M) * Y * 1 ᴴ = Y
  simp [Matrix.conjTranspose_one]

private theorem phi_P_X_apply : (φ P X) 0 1 = -1 := by
  show (P * X * P ᴴ) 0 1 = -1
  have hdiag : P ᴴ = Matrix.diagonal (star v) := Matrix.diagonal_conjTranspose v
  rw [hdiag, Matrix.mul_diagonal]
  have hp : (P * X) 0 1 = v 0 * X 0 1 := by
    rw [P, Matrix.diagonal_mul]
  rw [hp, v_apply_zero]
  have hx : X 0 1 = 1 := rfl
  rw [hx]
  have hv1 : (star v) 1 = -1 := by
    show star (v 1) = -1
    rw [v_apply_one, star_neg, star_one]
  rw [hv1]
  norm_num

private theorem phi_one_X_apply : (φ 1 X) 0 1 = 1 := by
  rw [phi_one]
  rfl

/-- Paper Proposition 11.2: two distinct unitary channels, both of Kraus rank one, so
the assignment from channels to Kraus rank is not injective under equality of maps. -/
theorem kraus_rank_not_injective :
    ∃ U U' : M, IsUnitary U ∧ IsUnitary U' ∧ ¬ SameChannel (φ U) (φ U') ∧
      IsKrausRank 1 (φ U) ∧ IsKrausRank 1 (φ U') := by
  refine ⟨1, P, one_unitary, P_unitary, ?_, kraus_rank_one 1 one_unitary,
    kraus_rank_one P P_unitary⟩
  intro h
  have hX := h X
  have h01 := congrArg (fun Y => Y 0 1) hX
  rw [phi_one_X_apply, phi_P_X_apply] at h01
  exact absurd h01 (by norm_num)

end Kraus

/-! ## The cotangent retract (paper Proposition 4.1) -/

section Cotangent

variable {Q : Type u} [TopologicalSpace Q]
variable {V : Type v} [AddCommGroup V] [Module ℝ V] [TopologicalSpace V] [ContinuousSMul ℝ V]

/-- The deformation retraction `r_t(x, ξ) = (x, tξ)`, formalized on the *trivial product
bundle* `Q × V`. **Scope caveat (Codex review, round 2):** a general cotangent bundle
`T*Q` is not globally a product `Q × V`; the paper's Proposition 4.1 in full generality
is NOT formalized here, only its product-bundle fragment. -/
def retraction (t : ℝ) (p : Q × V) : Q × V := (p.1, t • p.2)

/-- `r_1 = id`. -/
@[simp]
theorem retraction_one (p : Q × V) : retraction (1 : ℝ) p = p := by
  simp [retraction]

/-- `r_s ∘ r_t = r_{s*t}`. -/
theorem retraction_comp (s t : ℝ) (p : Q × V) :
    retraction s (retraction t p) = retraction (s * t) p := by
  simp [retraction, smul_smul]

/-- `r_t` fixes the zero section pointwise. -/
theorem retraction_fixes_zero_section (t : ℝ) (x : Q) :
    retraction t (x, (0 : V)) = (x, 0) := by
  simp [retraction]

/-- `r_0` maps the total space onto the zero section. -/
theorem retraction_zero_eq (p : Q × V) : retraction (0 : ℝ) p = (p.1, (0 : V)) := by
  simp [retraction]

theorem retraction_zero_mem_zeroSection (p : Q × V) :
    retraction (0 : ℝ) p ∈ Set.range (fun x : Q => (x, (0 : V))) :=
  ⟨p.1, (retraction_zero_eq p).symm⟩

/-- Each `r_t` is continuous. -/
theorem continuous_retraction (t : ℝ) : Continuous (retraction (t : ℝ) (Q := Q) (V := V)) := by
  show Continuous fun p : Q × V => (p.1, t • p.2)
  exact continuous_fst.prodMk (continuous_const.smul continuous_snd)

/-- The deformation is jointly continuous in `t` and the point. -/
theorem continuous_retraction₂ :
    Continuous fun p : ℝ × (Q × V) => retraction (Q := Q) (V := V) p.1 p.2 := by
  show Continuous fun p : ℝ × (Q × V) => (p.2.1, p.1 • p.2.2)
  exact (continuous_snd.fst).prodMk (continuous_fst.smul continuous_snd.snd)

/-- Paper Proposition 4.1, *product-bundle fragment*: the zero section of the trivial
bundle `Q × V` is a deformation retract; the data above (continuity of `r_t`,
`r_1 = id`, `r_0` through the zero section, `r_s ∘ r_t = r_{st}`, and the fixed zero
section) is the content of the fragment. The general cotangent bundle `T*Q` is not
globally a product, so the full proposition is NOT formalized (Codex review, round 2). -/
theorem cotangent_retract :
    (∀ t : ℝ, Continuous (retraction (t : ℝ) (Q := Q) (V := V))) ∧
      (∀ p : Q × V, retraction (1 : ℝ) p = p) ∧
        (∀ p : Q × V, retraction (0 : ℝ) p ∈ Set.range (fun x : Q => (x, (0 : V)))) ∧
          (∀ s t : ℝ, ∀ p : Q × V,
            retraction s (retraction t p) = retraction (s * t) p) ∧
            (∀ t : ℝ, ∀ x : Q, retraction t (x, (0 : V)) = (x, 0)) :=
  ⟨continuous_retraction, fun _ => retraction_one _,
    retraction_zero_mem_zeroSection, fun _ _ _ => retraction_comp _ _ _,
    fun _ _ => retraction_fixes_zero_section _ _⟩

end Cotangent

/-! ## Irreducible classes do not close (paper Proposition 15.1) -/

section Closure

variable {α : Type u} [Zero α]

/-- A class of objects is closed under a family `K` of binary constructions when it is
closed under each `f ∈ K` (paper: closure under the admissible constructions). -/
def ClosedUnder (K : Set (α → α → α)) (C : Set α) : Prop :=
  ∀ f ∈ K, ∀ a b, a ∈ C → b ∈ C → f a b ∈ C

/-- Paper Section 2: `⟨E⟩_K`, the smallest class containing `E` and closed under `K`. -/
def closure (K : Set (α → α → α)) (E : Set α) : Set α :=
  {x | ∀ C : Set α, E ⊆ C → ClosedUnder K C → x ∈ C}

theorem mem_closure {K : Set (α → α → α)} {E : Set α} {x : α} :
    x ∈ closure K E ↔ ∀ C : Set α, E ⊆ C → ClosedUnder K C → x ∈ C :=
  Iff.rfl

theorem subset_closure (K : Set (α → α → α)) (E : Set α) : E ⊆ closure K E :=
  fun _ hx C hE _ => hE hx

theorem closedUnder_closure (K : Set (α → α → α)) (E : Set α) :
    ClosedUnder K (closure K E) := by
  intro f hf a b ha hb C hE hC
  exact hC f hf a b (ha C hE hC) (hb C hE hC)

theorem closure_minimal (K : Set (α → α → α)) {E C : Set α}
    (hE : E ⊆ C) (hC : ClosedUnder K C) : closure K E ⊆ C :=
  fun _ hx => hx C hE hC

/-- Paper Proposition 15.1: an object irreducible under `⊕` is not a sum of two
nonzero objects. -/
def Irreducible (op : α → α → α) (a : α) : Prop :=
  ¬ ∃ b c, b ≠ 0 ∧ c ≠ 0 ∧ op b c = a

/-- Paper Proposition 15.1: a nonempty class of nonzero objects each irreducible under
direct sum is not closed under direct sum, and its closure strictly contains it.
The hypothesis `E.Nonempty` is required; the conclusion is non-closure, not
non-generation. -/
theorem exceptional_not_closed (op : α → α → α) (K : Set (α → α → α)) (hop : op ∈ K)
    (E : Set α) (hne : E.Nonempty)
    (hirr : ∀ a ∈ E, a ≠ 0 ∧ Irreducible op a) :
    (¬ ClosedUnder K E) ∧ E ⊂ closure K E := by
  obtain ⟨A, hA⟩ := hne
  have hA0 : A ≠ 0 := (hirr A hA).1
  have hAA : op A A ∉ E := by
    intro hmem
    have hirr' : Irreducible op (op A A) := (hirr _ hmem).2
    exact hirr' ⟨A, A, hA0, hA0, rfl⟩
  have hAA_mem : op A A ∈ closure K E :=
    closedUnder_closure K E op hop A A (subset_closure K E hA) (subset_closure K E hA)
  refine ⟨?_, ⟨subset_closure K E, ?_⟩⟩
  · intro hclosed
    exact hAA (hclosed op hop A A hA hA)
  · intro hincl
    exact hAA (hincl hAA_mem)

/-- Paper Proposition 15.1: the class still generates its closure (the conclusion is
non-closure, not non-generation). -/
theorem closure_generation (K : Set (α → α → α)) (E : Set α) :
    E ⊆ closure K E ∧
      ∀ C : Set α, E ⊆ C → ClosedUnder K C → closure K E ⊆ C :=
  ⟨subset_closure K E, fun _ => closure_minimal K⟩

end Closure

/-! ## Independence and reconstructability (paper Definition 16.1, Proposition 16.2) -/

/-- Paper Definition 2.3 / 16.1: a structural family is presented by its class of objects. -/
structure StructuralFamily where
  /-- Objects of the family. -/
  Obj : Type u

/-- Paper Definition 16.1: `F` is a special case of `G` when there is a full embedding
of the objects of `F` into the objects of `G`. **Scope caveat (Codex review, round 1):**
this is the *object-level shadow* of the paper's definition — an injection of object
types, not a fully faithful functor of the families' categories (those categories are
not formalized here). -/
def SpecialCase (F G : StructuralFamily) : Prop := Nonempty (F.Obj ↪ G.Obj)

/-- Paper Definition 16.1 / Table 14: `G` is reconstructable from `F` when a
correspondence determines one from the other. **Scope caveat (Codex review, round 1):**
this is the object-level shadow (a bijection of object types), not the paper's
structure-preserving equivalence or anti-equivalence. -/
def Reconstructable (F G : StructuralFamily) : Prop := Nonempty (F.Obj ≃ G.Obj)

/-- Paper Definition 16.1: two structural families are logically independent when
neither is a special case of the other and neither is reconstructable from the other.
**Scope caveat (Codex review, round 1):** with the object-level shadows above, classical
comparability of cardinalities makes one direction of `SpecialCase` always hold, so
`Independent F G` is false for all families — the paper's category-level independence
is NOT formalized here. -/
def Independent (F G : StructuralFamily) : Prop :=
  ¬ SpecialCase F G ∧ ¬ SpecialCase G F ∧ ¬ Reconstructable F G ∧ ¬ Reconstructable G F

/-- Paper Proposition 16.2: a family admits a classifying invariant when some map on
its objects is injective (it separates objects up to the chosen equivalence, taken here
to be equality). -/
def HasClassifyingInvariant (F : StructuralFamily.{u}) : Prop :=
  ∃ (V : Type u) (I : F.Obj → V), Function.Injective I

/-- Paper Proposition 16.2: families related by a correspondence (as the Gelfand
anti-equivalence relates commutative unital C*-algebras and compact Hausdorff spaces)
are not logically independent. -/
theorem not_independent_of_reconstructable (F G : StructuralFamily)
    (h : Reconstructable F G) : ¬ Independent F G :=
  fun hI => hI.2.2.1 h

/-- Paper Proposition 16.2: two families may each admit a classifying invariant and
still fail to be logically independent; the existence of classifying invariants is
silent on independence. -/
theorem invariants_not_independence :
    ∃ F G : StructuralFamily.{0}, HasClassifyingInvariant F ∧ HasClassifyingInvariant G ∧
      Reconstructable F G ∧ ¬ Independent F G := by
  let F : StructuralFamily.{0} := ⟨ℕ⟩
  let G : StructuralFamily.{0} := ⟨ULift ℕ⟩
  exact ⟨F, G, ⟨ℕ, id, fun _ _ h => h⟩, ⟨ULift ℕ, fun n => n, fun _ _ h => h⟩,
    ⟨Equiv.ulift.symm⟩, not_independent_of_reconstructable F G ⟨Equiv.ulift.symm⟩⟩

/-! ## Comparability of records (paper Proposition 18.1) -/

section Comparability

/-- Subtype equivalence along an equality of sets (thin alias for Mathlib's
`Set.equivOfEq`, kept under the paper-facing name). -/
def subtypeEquivOfEq {γ : Type*} {s t : Set γ} (h : s = t) : ↥s ≃ ↥t :=
  Set.equivOfEq h

/-- Paper Proposition 18.1: two classification records that agree on family, sector, and
equivalence (same objects, same physical equivalence) and that both name classifying
invariants have invariants related by a bijection between their attained values. -/
theorem comparability_of_records {Obj : Type u} {r : Obj → Obj → Prop} (hr : Equivalence r)
    {V₁ : Type v} {I₁ : Obj → V₁}
    (h₁c : ∀ a b, r a b → I₁ a = I₁ b) (h₁k : ∀ a b, I₁ a = I₁ b → r a b)
    {V₂ : Type w} {I₂ : Obj → V₂}
    (h₂c : ∀ a b, r a b → I₂ a = I₂ b) (h₂k : ∀ a b, I₂ a = I₂ b → r a b) :
    Nonempty (Set.range I₁ ≃ Set.range I₂) := by
  let s : Setoid Obj := ⟨r, hr⟩
  let f₁ : Quotient s → V₁ := Quotient.lift I₁ h₁c
  let f₂ : Quotient s → V₂ := Quotient.lift I₂ h₂c
  have inj₁ : Function.Injective f₁ := by
    intro q₁ q₂ he
    revert he
    refine Quotient.inductionOn₂ q₁ q₂ ?_
    intro a b he
    have heq : I₁ a = I₁ b := by
      show f₁ (Quotient.mk s a) = f₁ (Quotient.mk s b)
      exact he
    exact Quotient.sound (h₁k a b heq)
  have inj₂ : Function.Injective f₂ := by
    intro q₁ q₂ he
    revert he
    refine Quotient.inductionOn₂ q₁ q₂ ?_
    intro a b he
    have heq : I₂ a = I₂ b := by
      show f₂ (Quotient.mk s a) = f₂ (Quotient.mk s b)
      exact he
    exact Quotient.sound (h₂k a b heq)
  have e₁ : Quotient s ≃ Set.range f₁ := Equiv.ofInjective f₁ inj₁
  have e₂ : Quotient s ≃ Set.range f₂ := Equiv.ofInjective f₂ inj₂
  have hr₁ : Set.range f₁ = Set.range I₁ := by
    apply Set.ext
    intro x
    constructor
    · rintro ⟨q, rfl⟩
      exact ⟨Quotient.out q, by
        conv_rhs => rw [← Quotient.out_eq q]
        rfl⟩
    · rintro ⟨a, rfl⟩
      exact ⟨Quotient.mk s a, rfl⟩
  have hr₂ : Set.range f₂ = Set.range I₂ := by
    apply Set.ext
    intro x
    constructor
    · rintro ⟨q, rfl⟩
      exact ⟨Quotient.out q, by
        conv_rhs => rw [← Quotient.out_eq q]
        rfl⟩
    · rintro ⟨a, rfl⟩
      exact ⟨Quotient.mk s a, rfl⟩
  refine ⟨(e₁.trans (subtypeEquivOfEq hr₁)).symm.trans (e₂.trans (subtypeEquivOfEq hr₂))⟩

end Comparability

end Cmrps.Vol02
