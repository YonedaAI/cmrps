/-
Copyright (c) 2026 The YonedaAI Collaboration. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: CMRPS formalization team
-/
import Mathlib.Basic.Real.Basic
import Mathlib.Order.Defs.PartialOrder
import Mathlib.Order.Defs.Unbundled
import Mathlib.Order.UpperLower.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Data.Set.Insert
import Mathlib.Data.Set.Finite.Basic
import Mathlib.Data.Fintype.EquivFin
import Mathlib.Data.Fintype.Card
import Mathlib.Basic.Finite.Defs
import Mathlib.Basic.Logic.Basic
import Mathlib.Topology.Order
import Mathlib.Topology.Closure
import Mathlib.Topology.Inseparable
import Mathlib.Topology.Separation.Basic
import Mathlib.Topology.Compactness.Compact
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Mathlib.Tactic.NormNum

/-!
# Volume 8: Classification and Reconstruction of Spacetime

Formalization targets from `verification/vol-08-spacetime-reconstruction-lean-targets.md`,
with identifiers mirroring the names of `papers/latex/vol-08-spacetime-reconstruction.tex`.

This module machine-checks the volume's own order-theoretic and entropy-vector
content:

* target `ladder_nontransfer_finite_orders` (Prop 6.3, Prop 6.4, Cor 6.5):
  no strictly increasing loop in a preorder, finite order intervals in a finite
  order, failure of distinguishing on the two-point antichain, and the
  non-transfer of the causal ladder to finite orders;
* target `mmi_independent_of_ssa` (Prop 8.2, Prop 8.4, Lemma 8.5, Lemma 8.6):
  the perfectly correlated triple satisfies strong subadditivity and violates
  monogamy of mutual information, so monogamy does not follow from strong
  subadditivity; the information and tripartite forms of monogamy; strong
  subadditivity from subadditivity plus monogamy;
* target `specialization_order_recovery` (Prop 9.4): the up-set topology of a
  partial order is T0, the closure of a singleton is its down-set, and the order
  is recovered from the closures;
* target `geometrization_dim3` (Thm 7.1) is formalized only as far as the
  eight-element type of Thurston model geometries (`card_thurstonGeometry3`);
  the geometrization theorem itself is a cited literature result and is not
  formalized here.

The deep cited theorems (Lorentzian holonomy classification, causal ladder
completeness, Tancer unrecognizability, entropy cone completeness, Malament
reconstruction) are outside the reach of current Mathlib and are recorded in the
claim-status and conjecture registries instead of being stated here.
-/

open scoped Topology

namespace Cmrps.Vol08

open Classical

/-! ## Causal relations and distinguishing (Definition 2.2, Definition 2.3) -/

/-- The strict chronological past of `x` for a relation `r` read strictly:
`I⁻(x) = {y | r y x}` (Definition 2.2 with the strict reading of Proposition 6.4). -/
def Past {α : Type*} (r : α → α → Prop) (x : α) : Set α := {y | r y x}

/-- The strict chronological future of `x` for a relation `r` read strictly:
`I⁺(x) = {y | r x y}` (Definition 2.2 with the strict reading of Proposition 6.4). -/
def Future {α : Type*} (r : α → α → Prop) (x : α) : Set α := {y | r x y}

/-- Past- and future-distinguishing for a relation read strictly (Definition 2.3):
the past map and the future map are each injective — past-distinguishing and
future-distinguishing hold *separately*, as in the paper (a single point pair is
already a witness when either map identifies it). -/
def IsDistinguishing {α : Type*} (r : α → α → Prop) : Prop :=
  Function.Injective (Past r) ∧ Function.Injective (Future r)

/-! ## Finite orders and the causal ladder (Proposition 6.3, Proposition 6.4,
Corollary 6.5; target `ladder_nontransfer_finite_orders`) -/

/-- Proposition 6.3 (prop:finiteposet), first half: no strictly increasing loop
`x₀ < x₁ < ⋯ < xₙ < x₀` exists in a preorder. A loop of strict inequalities would
give `g 0 < g 0` by transitivity. -/
theorem no_increasing_loop {X : Type*} [Preorder X] (n : ℕ) (g : ℕ → X)
    (hstep : ∀ k, k < n → g k < g (k + 1)) (hback : g n < g 0) : False := by
  have key : ∀ m, m ≤ n → g 0 < g m ∨ m = 0 := by
    intro m
    induction m with
    | zero => intro; exact Or.inr rfl
    | succ m ih =>
      intro hm
      have hmn : m < n := by omega
      rcases ih (by omega) with h | h
      · exact Or.inl (lt_trans h (hstep m hmn))
      · subst h; exact Or.inl (hstep 0 (by omega))
  rcases key n le_rfl with h | h
  · exact lt_asymm h hback
  · subst h; exact lt_irrefl (g 0) hback

/-- Proposition 6.3 (prop:finiteposet), second half: every order interval
`[x, y] = {z | x ≤ z ∧ z ≤ y}` of a finite order is a finite set. -/
theorem interval_finite {X : Type*} [Preorder X] [Finite X] (x y : X) :
    Set.Finite {z | x ≤ z ∧ z ≤ y} := Set.toFinite _

/-- Proposition 6.3 (prop:finiteposet): order intervals of a finite order are
compact in every topology on the order, since they are finite sets. -/
theorem interval_compact {X : Type*} [Preorder X] [Finite X] [TopologicalSpace X]
    (x y : X) : IsCompact {z | x ≤ z ∧ z ≤ y} :=
  (interval_finite x y).isCompact

/-- Proposition 6.4 (prop:distinguish): under the strict reading
`I⁺(x) = {y | x < y}`, `I⁻(x) = {y | y < x}` the two-element antichain fails
distinguishing: its two distinct points have equal empty pasts and equal empty
futures. -/
theorem antichain_fails_distinguishing :
    ∃ x y : Bool, x ≠ y ∧
      Past (fun _ _ : Bool => False) x = Past (fun _ _ : Bool => False) y ∧
      Future (fun _ _ : Bool => False) x = Future (fun _ _ : Bool => False) y := by
  refine ⟨false, true, by decide, ?_, ?_⟩ <;> rfl

/-- Corollary 6.5 (cor:notransfer): rung membership of the causal ladder does not
transfer from Lorentzian manifolds to finite orders. The two-element antichain is
a finite order (the order-theoretic compactness rung of Proposition 6.3 holds
there) on which the strict reading of distinguishing fails. -/
theorem ladder_nontransfer_finite_orders :
    Set.Finite (univ : Set Bool) ∧ ¬ IsDistinguishing (fun _ _ : Bool => False) := by
  refine ⟨Set.toFinite _, ?_⟩
  intro hd
  obtain ⟨x, y, hne, hp, hf⟩ := antichain_fails_distinguishing
  exact hne (hd.1 hp)

/-! ## Entropy vectors (Definition 2.5) -/

/-- Strong subadditivity `S(U) + S(V) ≥ S(U ∪ V) + S(U ∩ V)` for all unions
(equation eq:ssa). An entropy vector is modeled as a function on subsets of the
region index type. -/
def Ssa {ι : Type*} (S : Set ι → ℝ) : Prop :=
  ∀ u v : Set ι, S (u ∪ v) + S (u ∩ v) ≤ S u + S v

/-- Subadditivity `S(AB) ≤ S(A) + S(B)`. -/
def Subadditive {ι : Type*} (S : Set ι → ℝ) : Prop :=
  ∀ u v : Set ι, S (u ∪ v) ≤ S u + S v

/-- The Araki-Lieb bound `|S(A) − S(B)| ≤ S(AB)`. -/
def ArakiLieb {ι : Type*} (S : Set ι → ℝ) : Prop :=
  ∀ u v : Set ι, |S u - S v| ≤ S (u ∪ v)

/-- Monogamy of mutual information `S(A) + S(B) + S(C) + S(ABC) ≤ S(AB) + S(AC) +
S(BC)` (equation eq:mmi) for three disjoint regions given as sets of the region
index type. -/
def Mmi {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) : Prop :=
  S A + S B + S C + S (A ∪ B ∪ C) ≤ S (A ∪ B) + S (A ∪ C) + S (B ∪ C)

/-- Mutual information `I(A:B) = S(A) + S(B) − S(AB)`. -/
def MutualInfo {ι : Type*} (S : Set ι → ℝ) (A B : Set ι) : ℝ :=
  S A + S B - S (A ∪ B)

/-- Conditional mutual information `I(A:B|C) = S(AC) + S(BC) − S(ABC) − S(C)`. -/
def CondMutualInfo {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) : ℝ :=
  S (A ∪ C) + S (B ∪ C) - S (A ∪ B ∪ C) - S C

/-- Tripartite information `I₃(A:B:C) = I(A:B) + I(A:C) − I(A:BC)`. -/
def TripartiteInfo {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) : ℝ :=
  MutualInfo S A B + MutualInfo S A C - MutualInfo S A (B ∪ C)

/-! ## The perfectly correlated triple (Proposition 8.2, Lemma 8.6; target
`mmi_independent_of_ssa`) -/

/-- The entropy vector of the perfectly correlated triple `A = B = C = X` with
`X` a uniform bit: every nonempty union has entropy `1`, the empty set has
entropy `0` (Proposition 8.2). -/
noncomputable def correlatedTripleWitness (u : Set (Fin 3)) : ℝ :=
  if u = ∅ then 0 else 1

theorem correlatedTripleWitness_empty :
    correlatedTripleWitness (∅ : Set (Fin 3)) = 0 := by
  simp [correlatedTripleWitness]

theorem correlatedTripleWitness_eq_one {u : Set (Fin 3)} (hu : u ≠ ∅) :
    correlatedTripleWitness u = 1 := by
  simp [correlatedTripleWitness, hu]

theorem correlatedTripleWitness_nonneg (u : Set (Fin 3)) :
    0 ≤ correlatedTripleWitness u := by
  rcases eq_or_ne u ∅ with hu | hu
  · norm_num [correlatedTripleWitness, hu]
  · norm_num [correlatedTripleWitness, hu]

theorem correlatedTripleWitness_le_one (u : Set (Fin 3)) :
    correlatedTripleWitness u ≤ 1 := by
  rcases eq_or_ne u ∅ with hu | hu
  · norm_num [correlatedTripleWitness, hu]
  · norm_num [correlatedTripleWitness, hu]

/-- Proposition 8.2 (prop:mmi): the witness vector satisfies every strong
subadditivity inequality (case analysis on the two sets). -/
theorem correlatedTripleWitness_ssa : Ssa (correlatedTripleWitness : Set (Fin 3) → ℝ) := by
  intro u v
  rcases eq_or_ne u ∅ with hu | hu
  · subst u
    simp only [Set.empty_union, Set.empty_inter, correlatedTripleWitness_empty,
      add_zero, zero_add]
    exact le_rfl
  · rcases eq_or_ne v ∅ with hv | hv
    · subst v
      simp only [Set.union_empty, Set.inter_empty, correlatedTripleWitness_empty,
        add_zero, zero_add]
      exact le_rfl
    · have eu := correlatedTripleWitness_eq_one hu
      have ev := correlatedTripleWitness_eq_one hv
      have e1 := correlatedTripleWitness_le_one (u ∪ v)
      have e2 := correlatedTripleWitness_le_one (u ∩ v)
      linarith

/-- Proposition 8.2 (prop:mmi): the witness vector violates monogamy of mutual
information on the triple of single regions: the left side equals `4` and the
right side equals `3`. -/
theorem correlatedTripleWitness_mmi_fails :
    ¬ Mmi correlatedTripleWitness ({0} : Set (Fin 3)) {1} {2} := by
  have h0 : (({0} : Set (Fin 3))) ≠ ∅ := (Set.singleton_nonempty 0).ne_empty
  have h1 : (({1} : Set (Fin 3))) ≠ ∅ := (Set.singleton_nonempty 1).ne_empty
  have h2 : (({2} : Set (Fin 3))) ≠ ∅ := (Set.singleton_nonempty 2).ne_empty
  have un : ∀ {s t : Set (Fin 3)}, s ≠ ∅ → s ∪ t ≠ ∅ := fun hs h => hs (Set.union_empty_iff.1 h).1
  have h01 : (({0} : Set (Fin 3)) ∪ {1}) ≠ ∅ := un h0
  have h02 : (({0} : Set (Fin 3)) ∪ {2}) ≠ ∅ := un h0
  have h12 : (({1} : Set (Fin 3)) ∪ {2}) ≠ ∅ := un h1
  have h012 : (({0} : Set (Fin 3)) ∪ {1} ∪ {2}) ≠ ∅ := un h01
  have e0 := correlatedTripleWitness_eq_one h0
  have e1 := correlatedTripleWitness_eq_one h1
  have e2 := correlatedTripleWitness_eq_one h2
  have e01 := correlatedTripleWitness_eq_one h01
  have e02 := correlatedTripleWitness_eq_one h02
  have e12 := correlatedTripleWitness_eq_one h12
  have e012 := correlatedTripleWitness_eq_one h012
  simp only [Mmi, e0, e1, e2, e01, e02, e12, e012]
  norm_num

/-- The numerical margin of Proposition 8.2: on the witness the monogamy left
side equals `4` and the right side equals `3`, a violation of `1`. -/
theorem correlatedTripleWitness_mmi_margin :
    correlatedTripleWitness ({0} : Set (Fin 3)) + correlatedTripleWitness {1} +
        correlatedTripleWitness {2} + correlatedTripleWitness ({0} ∪ {1} ∪ {2}) = 4 ∧
      correlatedTripleWitness (({0} : Set (Fin 3)) ∪ {1}) +
        correlatedTripleWitness ({0} ∪ {2}) + correlatedTripleWitness ({1} ∪ {2}) = 3 := by
  have h0 : (({0} : Set (Fin 3))) ≠ ∅ := (Set.singleton_nonempty 0).ne_empty
  have h1 : (({1} : Set (Fin 3))) ≠ ∅ := (Set.singleton_nonempty 1).ne_empty
  have h2 : (({2} : Set (Fin 3))) ≠ ∅ := (Set.singleton_nonempty 2).ne_empty
  have un : ∀ {s t : Set (Fin 3)}, s ≠ ∅ → s ∪ t ≠ ∅ := fun hs h => hs (Set.union_empty_iff.1 h).1
  have h01 : (({0} : Set (Fin 3)) ∪ {1}) ≠ ∅ := un h0
  have h02 : (({0} : Set (Fin 3)) ∪ {2}) ≠ ∅ := un h0
  have h12 : (({1} : Set (Fin 3)) ∪ {2}) ≠ ∅ := un h1
  have h012 : (({0} : Set (Fin 3)) ∪ {1} ∪ {2}) ≠ ∅ := un h01
  simp only [correlatedTripleWitness_eq_one h0, correlatedTripleWitness_eq_one h1,
    correlatedTripleWitness_eq_one h2, correlatedTripleWitness_eq_one h01,
    correlatedTripleWitness_eq_one h02, correlatedTripleWitness_eq_one h12,
    correlatedTripleWitness_eq_one h012]
  norm_num

/-- Proposition 8.2 (prop:mmi) / target `mmi_independent_of_ssa`: the entropy
vector of a perfectly correlated triple satisfies strong subadditivity and
violates monogamy of mutual information, so monogamy is not implied by strong
subadditivity over entropy functions of three regions.

The witness is the classical entropy vector of a uniform shared bit (the paper's
Proposition 8.2 realizes it as an entropic vector); the entropic realization is
not formalized here and is recorded as informal in the claim-status registry. -/
theorem mmi_independent_of_ssa :
    Ssa correlatedTripleWitness ∧
      ¬ Mmi correlatedTripleWitness ({0} : Set (Fin 3)) {1} {2} ∧
      ¬ (∀ S : Set (Fin 3) → ℝ, Ssa S → Mmi S {0} {1} {2}) :=
  ⟨correlatedTripleWitness_ssa, correlatedTripleWitness_mmi_fails,
    fun h => correlatedTripleWitness_mmi_fails (h _ correlatedTripleWitness_ssa)⟩

/-- Lemma 8.6 (lem:witnessclean): the witness vector is nonnegative, vanishes on
the empty set, and satisfies subadditivity, the Araki-Lieb bound, and strong
subadditivity. It violates only monogamy. -/
theorem correlatedTripleWitness_clean :
    (∀ u : Set (Fin 3), 0 ≤ correlatedTripleWitness u) ∧
      correlatedTripleWitness (∅ : Set (Fin 3)) = 0 ∧
      Subadditive correlatedTripleWitness ∧
      ArakiLieb correlatedTripleWitness ∧
      Ssa correlatedTripleWitness ∧
      ¬ Mmi correlatedTripleWitness ({0} : Set (Fin 3)) {1} {2} := by
  refine ⟨correlatedTripleWitness_nonneg, correlatedTripleWitness_empty,
    ?_, ?_, correlatedTripleWitness_ssa, correlatedTripleWitness_mmi_fails⟩
  · intro u v
    rcases eq_or_ne u ∅ with hu | hu
    · subst u
      simp only [Set.empty_union, correlatedTripleWitness_empty, zero_add]
      exact le_rfl
    · rcases eq_or_ne v ∅ with hv | hv
      · subst v
        simp only [Set.union_empty, correlatedTripleWitness_empty, add_zero]
        exact le_rfl
      · have eu := correlatedTripleWitness_eq_one hu
        have ev := correlatedTripleWitness_eq_one hv
        have euv := correlatedTripleWitness_eq_one (u := u ∪ v)
          (fun h => hu (Set.union_empty_iff.1 h).1)
        linarith
  · intro u v
    rcases eq_or_ne u ∅ with hu | hu
    · rcases eq_or_ne v ∅ with hv | hv
      · subst u; subst v
        norm_num [correlatedTripleWitness_empty, Set.empty_union, sub_self, abs_zero]
      · subst u
        rw [Set.empty_union, correlatedTripleWitness_empty,
          correlatedTripleWitness_eq_one hv]
        norm_num
    · rcases eq_or_ne v ∅ with hv | hv
      · subst v
        rw [Set.union_empty, correlatedTripleWitness_empty,
          correlatedTripleWitness_eq_one hu]
        norm_num
      · rw [correlatedTripleWitness_eq_one hu, correlatedTripleWitness_eq_one hv,
          sub_self, abs_zero]
        exact correlatedTripleWitness_nonneg _

/-! ## Two forms of monogamy (Proposition 8.4; target `mmi_independent_of_ssa`) -/

/-- Proposition 8.4 (prop:mmiform): monogamy of mutual information is equivalent
to the information form `I(A:B) + I(A:C) ≤ I(A:BC)`; the proof is the algebraic
rearrangement of the paper. -/
theorem mmi_iff_information_form {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) :
    Mmi S A B C ↔ MutualInfo S A B + MutualInfo S A C ≤ MutualInfo S A (B ∪ C) := by
  simp only [Mmi, MutualInfo, Set.union_assoc]
  constructor <;> intro h <;> linarith

/-- Proposition 8.4 (prop:mmiform): monogamy of mutual information is equivalent
to nonpositivity of the tripartite information `I₃(A:B:C)`. -/
theorem mmi_iff_tripartite_nonpos {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) :
    Mmi S A B C ↔ TripartiteInfo S A B C ≤ 0 := by
  rw [mmi_iff_information_form]
  simp only [TripartiteInfo]
  constructor <;> intro h <;> linarith

/-- Lemma 8.5 (lem:ssaredundant), proof step: the conditional mutual information
factors as `I(A:C|B) = I(A:BC) − I(A:B)`. -/
theorem cmi_factorization {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) :
    CondMutualInfo S A C B = MutualInfo S A (B ∪ C) - MutualInfo S A B := by
  have hcb : C ∪ B = B ∪ C := Set.union_comm _ _
  have habc : (A ∪ C) ∪ B = A ∪ (B ∪ C) := by rw [Set.union_assoc, Set.union_comm C B]
  simp only [CondMutualInfo, MutualInfo, hcb, habc]
  ring

/-- Lemma 8.5 (lem:ssaredundant): for three regions, strong subadditivity
`I(A:C|B) ≥ 0` follows from subadditivity `I(A:C) ≥ 0` together with monogamy of
mutual information. At three regions the strong subadditivity family is a
consequence rather than an independent input (n = 4 composite instances remain
independent, as the paper notes). -/
theorem ssa_of_subadditive_and_mmi {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι)
    (hsub : 0 ≤ MutualInfo S A C) (hmmi : Mmi S A B C) :
    0 ≤ CondMutualInfo S A C B := by
  rw [cmi_factorization]
  have hinfo : MutualInfo S A B + MutualInfo S A C ≤ MutualInfo S A (B ∪ C) :=
    (mmi_iff_information_form S A B C).1 hmmi
  linarith

/-! ## Up-set topology and specialization order (Proposition 9.4; target
`specialization_order_recovery`) -/

/-- The up-set (P. S. Alexandroff) topology of a preorder: the open sets are the
upper sets (Definition 2 discussion and Proposition 9.4). -/
def upSetTopology (α : Type*) [Preorder α] : TopologicalSpace α :=
  TopologicalSpace.generateFrom {u | IsUpperSet u}

theorem isUpperSet_of_isOpen {α : Type*} [Preorder α] {s : Set α}
    (hs : IsOpen[upSetTopology α] s) : IsUpperSet s := by
  have hs' : TopologicalSpace.GenerateOpen {u | IsUpperSet u} s := hs
  induction hs' with
  | basic u hu => exact hu
  | univ => exact isUpperSet_univ
  | inter u v hu hv ih1 ih2 => exact fun a b hab ha => ⟨ih1 hu hab ha.1, ih2 hv hab ha.2⟩
  | sUnion S h ih => exact isUpperSet_sUnion fun t ht => ih t ht (h t ht)

theorem isOpen_iff_isUpperSet {α : Type*} [Preorder α] {s : Set α} :
    IsOpen[upSetTopology α] s ↔ IsUpperSet s :=
  ⟨isUpperSet_of_isOpen, fun h => TopologicalSpace.isOpen_generateFrom_of_mem h⟩

theorem isClosed_iff_isLowerSet {α : Type*} [Preorder α] {s : Set α} :
    IsClosed[upSetTopology α] s ↔ IsLowerSet s := by
  letI : TopologicalSpace α := upSetTopology α
  constructor
  · intro h
    exact isUpperSet_compl.1 (isUpperSet_of_isOpen h.isOpen_compl)
  · intro h
    exact ⟨isOpen_iff_isUpperSet.2 (isUpperSet_compl.2 h)⟩

/-- Proposition 9.4 (prop:specialization), separation step: distinct points of a
partial order are separated by an up-set. -/
theorem exists_upperSet_separating {α : Type*} [PartialOrder α] (x y : α) (hne : x ≠ y) :
    ∃ u : Set α, IsUpperSet u ∧ ((x ∈ u ∧ y ∉ u) ∨ (y ∈ u ∧ x ∉ u)) := by
  have hanti : ¬ (x ≤ y ∧ y ≤ x) := fun h => hne (h.1.antisymm h.2)
  rcases not_and_or.mp hanti with h | h
  · refine ⟨{z | ¬ z ≤ y}, ?_, Or.inl ⟨h, fun hh => hh le_rfl⟩⟩
    intro a b hab ha hby
    exact (Set.mem_setOf.1 ha) (le_trans hab hby)
  · refine ⟨{z | ¬ z ≤ x}, ?_, Or.inr ⟨h, fun hh => hh le_rfl⟩⟩
    intro a b hab ha hbx
    exact (Set.mem_setOf.1 ha) (le_trans hab hbx)

/-- Proposition 9.4 (prop:specialization): the closure of a singleton in the
up-set topology is its down-set `cl({x}) = {y | y ≤ x}`. -/
theorem closure_singleton_eq_downset {α : Type*} [PartialOrder α] (x : α) :
    @closure α (upSetTopology α) ({x} : Set α) = {y | y ≤ x} := by
  letI : TopologicalSpace α := upSetTopology α
  apply le_antisymm
  · refine closure_minimal ?_ ?_
    · intro z hz
      simp only [Set.mem_singleton_iff] at hz
      subst hz
      exact le_rfl
    · rw [isClosed_iff_isLowerSet]
      exact fun a b hba ha => le_trans hba ha
  · intro y hy
    have hx : x ∈ @closure α (upSetTopology α) ({x} : Set α) :=
      subset_closure (Set.mem_singleton x)
    have hlow : IsLowerSet (@closure α (upSetTopology α) ({x} : Set α)) :=
      isClosed_iff_isLowerSet.1 isClosed_closure
    exact hlow hy hx

/-- Proposition 9.4 (prop:specialization): the order is read off the closures:
`x ≤ y` if and only if `x ∈ cl({y})`. -/
theorem le_iff_mem_closure {α : Type*} [PartialOrder α] (x y : α) :
    x ≤ y ↔ x ∈ @closure α (upSetTopology α) ({y} : Set α) := by
  letI : TopologicalSpace α := upSetTopology α
  rw [closure_singleton_eq_downset]
  exact Iff.rfl

/-- Proposition 9.4 (prop:specialization): the up-set topology of a partial order
is T₀ (two distinct points are separated by an open up-set). -/
theorem upSetTopology_t0Space {α : Type*} [PartialOrder α] :
    @T0Space α (upSetTopology α) := by
  letI : TopologicalSpace α := upSetTopology α
  refine ⟨fun x y hxy => ?_⟩
  by_contra hne
  obtain ⟨u, hu, hsep⟩ := exists_upperSet_separating x y hne
  have hopen : IsOpen[upSetTopology α] u := TopologicalSpace.isOpen_generateFrom_of_mem hu
  have hiff := inseparable_iff_forall_isOpen.1 hxy u hopen
  rcases hsep with ⟨hx, hy⟩ | ⟨hy, hx⟩
  · exact hy (hiff.1 hx)
  · exact hx (hiff.2 hy)

/-- Proposition 9.4 (prop:specialization) / target `specialization_order_recovery`:
the up-set topology of a partial order is T₀, the closure of each singleton is
its down-set, and the order is recovered from the closures. -/
theorem specialization_order_recovery {α : Type*} [PartialOrder α] :
    (∀ x y : α, x ≠ y → ∃ u, IsUpperSet u ∧ ((x ∈ u ∧ y ∉ u) ∨ (y ∈ u ∧ x ∉ u))) ∧
      (∀ x : α, @closure α (upSetTopology α) ({x} : Set α) = {y | y ≤ x}) ∧
      (∀ x y : α, x ≤ y ↔ x ∈ @closure α (upSetTopology α) ({y} : Set α)) ∧
      @T0Space α (upSetTopology α) :=
  ⟨fun x y => exists_upperSet_separating x y, fun x => closure_singleton_eq_downset x,
    fun x y => le_iff_mem_closure x y, upSetTopology_t0Space⟩

/-! ## Thurston model geometries (Theorem 7.1, Table 4; target
`geometrization_dim3`, partial) -/

/-- The eight Thurston model geometries of dimension three (Theorem 7.1,
Table 4): `E³`, `S³`, `H³`, `S² × ℝ`, `H² × ℝ`, `Nil`, `Sol`, `SL̃(2,ℝ)`. -/
inductive ThurstonGeometry3 : Type where
  | e3 | s3 | h3 | s2TimesR | h2TimesR | nil | sol | sl2tilde
  deriving DecidableEq, Repr

instance : Fintype ThurstonGeometry3 where
  elems := { .e3, .s3, .h3, .s2TimesR, .h2TimesR, .nil, .sol, .sl2tilde }
  complete := by intro x; cases x <;> simp

/-- Theorem 7.1 (thm:geometrization), type-level fragment: the list of Thurston
model geometries in dimension three has exactly eight entries. The geometrization
decomposition theorem itself (every closed 3-manifold decomposes into pieces
carrying one of these geometries) is a cited literature result and is not
formalized here. -/
theorem card_thurstonGeometry3 : Fintype.card ThurstonGeometry3 = 8 := by decide

end Cmrps.Vol08
