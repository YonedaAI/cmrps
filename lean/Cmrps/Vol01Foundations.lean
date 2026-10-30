/-
Vol. 1 — Foundations (papers/latex/vol-01-foundations.tex).
Mechanisation targets: verification/vol-01-foundations-lean-targets.md.
Namespace `Cmrps.Vol01`; identifiers mirror the paper's names where possible.
-/
import Mathlib

/-!
# Vol. 1 — Foundations

Formalised targets (see `verification/vol-01-foundations-lean-targets.md`):

* `vol01.morphisms.composition_not_typed`      → `compositionNotTyped`
* `vol01.morphisms.self_composition`           → `coarseGraining_selfComposition`,
  `embedding_selfComposition`, `equivalenceMorphism_selfComposition`
* `vol01.admissibility.kind_category`          → `coarseGraining_kindCategory`,
  `embedding_kindCategory`, `equivalenceMorphism_kindCategory`
* `vol01.admissibility.conditional_statements` → `conditional_statements`
* `vol01.finiteState.irreducible_iff_card_eq_one` → `irreducible_iff_card_eq_one`
* `vol01.finiteState.classify_iff_card_eq`     → `iso_iff_card_eq`,
  `onePoint_decomposition_unique`, `card_classifies_quotient`
* `vol01.dynamics.irreducible_iff_connected`   → `irreducible_iff_connected`
* `vol01.dynamics.connected_components_unique` → `components_unique`, `components_exist`
* `vol01.product.irreducible_iff_prime_card`   → `irreducibleProduct_iff_prime_card`,
  `prime_factorization`, `prime_factorization_unique`
* `vol01.qubit.factorization_nonunique`        → `factorization_nonunique`
-/

namespace Cmrps.Vol01

/-! ## Definition 3.4 — finite classical records -/

/-- Definition 3.4: a finite classical record `P = (X, O, D, S, C)`. Only the
state space `X` varies: the observables are the full algebra `ℝ^X`, the
dynamics is the identity, the symmetry is trivial, and the composition rule is
disjoint union. The record is presented by its state space. -/
structure FinRec where
  /-- The state space of the record. -/
  X : Type
  /-- The state space is finite. -/
  instFintype : Fintype X

attribute [instance] FinRec.instFintype

/-! ## Definition 4.3 — concrete preservation laws (point-set form) -/

/-- Definition 4.3(1), point-set form on finite classical records: a
coarse-graining has surjective state map. The observable condition is vacuous
here because the observable algebra is the full function algebra `ℝ^X`, so
every target observable pulls back by precomposition. -/
def IsCoarseGraining {X Y : Type} (g : X → Y) : Prop := Function.Surjective g

/-- Definition 4.3(2), point-set form: an embedding has injective state map.
Observable extension is vacuous for `ℝ^X`, and the identity dynamics of finite
classical records restricts to the identity. -/
def IsEmbedding {X Y : Type} (e : X → Y) : Prop := Function.Injective e

/-- Definition 4.3(3): an equivalence morphism is a bijection of state spaces,
carrying the determined components across. -/
def IsEquivalenceMorphism {X Y : Type} (g : X → Y) : Prop := Function.Bijective g

/-- Definition 4.3(4), point-set form: the underlying map of a duality is
invertible as a correspondence between the two presentations (isomorphisms of
a category and of its opposite coincide). -/
def IsDuality {X Y : Type} (g : X → Y) : Prop := Function.Bijective g

/-- Definition 4.3(5): a map between two fixed finite records is never a
limiting procedure — the law requires the leg of a cone on a diagram with
unbounded index, and excludes such fixed maps by definition. -/
def IsLimitingProcedure {X Y : Type} (_g : X → Y) : Prop := False

/-! ## Proposition 4.4 — composition is not typed -/

/-- The embedding state map of Proposition 4.4: `Fin 2 → Fin 4`, `0 ↦ 0`,
`1 ↦ 2` (the paper's `a ↦ 1`, `b ↦ 3`). -/
def embeddingMap : Fin 2 → Fin 4 := fun i => if i = 0 then 0 else 2

/-- The coarse-graining state map of Proposition 4.4: `Fin 4 → Fin 2`,
`0 ↦ 0`, `1 ↦ 1`, `2 ↦ 0`, `3 ↦ 1` (the paper's `1,3 ↦ p`, `2,4 ↦ q`). -/
def coarseMap : Fin 4 → Fin 2 := fun i => if i = 0 ∨ i = 2 then 0 else 1

/-- Proposition 4.4 (target `vol01.morphisms.composition_not_typed`): there
are finite classical records and morphisms — the embedding `embeddingMap`
followed by the coarse-graining `coarseMap` — whose composite is the constant
map `0 ↦ 0`, satisfying none of the five preservation laws of Definition 4.3. -/
theorem compositionNotTyped :
    IsEmbedding embeddingMap ∧ IsCoarseGraining coarseMap ∧
      (¬ IsCoarseGraining (coarseMap ∘ embeddingMap)) ∧
      (¬ IsEmbedding (coarseMap ∘ embeddingMap)) ∧
      (¬ IsEquivalenceMorphism (coarseMap ∘ embeddingMap)) ∧
      (¬ IsDuality (coarseMap ∘ embeddingMap)) ∧
      (¬ IsLimitingProcedure (coarseMap ∘ embeddingMap)) := by
  have hcomp : ∀ i : Fin 2, (coarseMap ∘ embeddingMap) i = 0 := by
    intro i
    fin_cases i <;> simp [coarseMap, embeddingMap]
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · intro a b hab
    fin_cases a <;> fin_cases b <;> simp [embeddingMap] at hab ⊢
  · intro y
    fin_cases y
    · exact ⟨0, by simp [coarseMap]⟩
    · exact ⟨1, by simp [coarseMap]⟩
  · intro h
    have h1 : (coarseMap ∘ embeddingMap) 1 = 0 := hcomp 1
    obtain ⟨y, hy⟩ := h (1 : Fin 2)
    fin_cases y <;> simp [coarseMap, embeddingMap] at hy
  · intro h
    have hh : (coarseMap ∘ embeddingMap) 0 = (coarseMap ∘ embeddingMap) 1 := by
      rw [hcomp, hcomp]
    have : (0 : Fin 2) = 1 := h hh
    exact absurd this (by decide)
  · intro h
    have hh : (coarseMap ∘ embeddingMap) 0 = (coarseMap ∘ embeddingMap) 1 := by
      rw [hcomp, hcomp]
    exact absurd (h.1 hh) (by decide)
  · intro h
    have hh : (coarseMap ∘ embeddingMap) 0 = (coarseMap ∘ embeddingMap) 1 := by
      rw [hcomp, hcomp]
    exact absurd (h.1 hh) (by decide)
  · exact fun h => h

/-! ## Proposition 4.6 — self-composition within a kind -/

/-- Proposition 4.6 (target `vol01.morphisms.self_composition`), coarse-graining
kind: coarse-grainings compose to coarse-grainings and the identity is a
coarse-graining, under the laws of Definition 4.3. -/
theorem coarseGraining_selfComposition {X Y Z : Type} {g : Y → Z} {f : X → Y}
    (hg : IsCoarseGraining g) (hf : IsCoarseGraining f) : IsCoarseGraining (g ∘ f) :=
  hg.comp hf

/-- Proposition 4.6, embedding kind: embeddings compose to embeddings. -/
theorem embedding_selfComposition {X Y Z : Type} {g : Y → Z} {f : X → Y}
    (hg : IsEmbedding g) (hf : IsEmbedding f) : IsEmbedding (g ∘ f) :=
  hg.comp hf

/-- Proposition 4.6, equivalence-morphism kind: equivalence morphisms compose
to equivalence morphisms. -/
theorem equivalenceMorphism_selfComposition {X Y Z : Type} {g : Y → Z} {f : X → Y}
    (hg : IsEquivalenceMorphism g) (hf : IsEquivalenceMorphism f) :
    IsEquivalenceMorphism (g ∘ f) :=
  ⟨hg.1.comp hf.1, hg.2.comp hf.2⟩

/-- The identity state map is a morphism of each of the three closed kinds. -/
theorem identity_of_kind {X : Type} :
    IsCoarseGraining (id : X → X) ∧ IsEmbedding (id : X → X) ∧
      IsEquivalenceMorphism (id : X → X) :=
  ⟨fun y => ⟨y, rfl⟩, fun _ _ h => h, ⟨fun _ _ h => h, fun y => ⟨y, rfl⟩⟩⟩

/-! ## Proposition 6.4 — kind-relative categories -/

/-- The morphisms of one kind between finite classical records, closed under
self-composition and containing the identities, carry exactly the structure of
a category (Proposition 6.4). This is the category content of the proposition;
the objects are the records and `Hom P Q` the morphisms of the chosen kind. -/
structure CategoryData (Obj : Type u) (Hom : Obj → Obj → Type v) where
  /-- The identity morphism of a record. -/
  id : ∀ X, Hom X X
  /-- Composition of morphisms of the kind. -/
  comp : ∀ {X Y Z : Obj}, Hom X Y → Hom Y Z → Hom X Z
  /-- Left identity law. -/
  id_comp : ∀ {X Y : Obj} (f : Hom X Y), comp (id X) f = f
  /-- Right identity law. -/
  comp_id : ∀ {X Y : Obj} (f : Hom X Y), comp f (id Y) = f
  /-- Associativity of composition. -/
  assoc : ∀ {W X Y Z : Obj} (f : Hom W X) (g : Hom X Y) (h : Hom Y Z),
    comp (comp f g) h = comp f (comp g h)

/-- Morphisms of coarse-graining kind between finite classical records. -/
def CoarseHom (P Q : FinRec) : Type := {f : P.X → Q.X // IsCoarseGraining f}

/-- Morphisms of embedding kind between finite classical records. -/
def EmbeddingHom (P Q : FinRec) : Type := {f : P.X → Q.X // IsEmbedding f}

/-- Morphisms of equivalence kind between finite classical records. -/
def EquivalenceHom (P Q : FinRec) : Type := {f : P.X → Q.X // IsEquivalenceMorphism f}

/-- Proposition 6.4 (target `vol01.admissibility.kind_category`), coarse-graining
kind: finite classical records with coarse-graining morphisms form a category. -/
def coarseGraining_kindCategory : CategoryData FinRec CoarseHom where
  id _ := ⟨id, (identity_of_kind).1⟩
  comp f g := ⟨g.1 ∘ f.1, coarseGraining_selfComposition g.2 f.2⟩
  id_comp _ := Subtype.ext (Function.comp_id _)
  comp_id _ := Subtype.ext (Function.id_comp _)
  assoc _ _ _ := Subtype.ext (Function.comp_assoc _ _ _).symm

/-- Proposition 6.4, embedding kind: finite classical records with embedding
morphisms form a category. -/
def embedding_kindCategory : CategoryData FinRec EmbeddingHom where
  id _ := ⟨id, (identity_of_kind).2.1⟩
  comp f g := ⟨g.1 ∘ f.1, embedding_selfComposition g.2 f.2⟩
  id_comp _ := Subtype.ext (Function.comp_id _)
  comp_id _ := Subtype.ext (Function.id_comp _)
  assoc _ _ _ := Subtype.ext (Function.comp_assoc _ _ _).symm

/-- Proposition 6.4, equivalence kind: finite classical records with
equivalence morphisms form a category. -/
def equivalenceMorphism_kindCategory : CategoryData FinRec EquivalenceHom where
  id _ := ⟨id, (identity_of_kind).2.2⟩
  comp f g := ⟨g.1 ∘ f.1, equivalenceMorphism_selfComposition g.2 f.2⟩
  id_comp _ := Subtype.ext (Function.comp_id _)
  comp_id _ := Subtype.ext (Function.id_comp _)
  assoc _ _ _ := Subtype.ext (Function.comp_assoc _ _ _).symm

/-! ## Proposition 6.5 — conditionality over admissible systems -/

/-- Definition 6.1 (AC-2), specialised to point-set records: the observable
collection `O ⊆ (X → ℝ)` is closed under the operations of its ambient algebra,
in particular under addition. -/
def ObservableClosure {X : Type} (O : Set (X → ℝ)) : Prop :=
  ∀ f ∈ O, ∀ h ∈ O, f + h ∈ O

/-- The point-mass observable `δ_x` on a decidable type. -/
def delta {X : Type} [DecidableEq X] (x : X) : X → ℝ := fun y => if y = x then 1 else 0

/-- Proposition 6.5 (target `vol01.admissibility.conditional_statements`): the
sentence "the observable collection is closed under addition" holds with AC-2
in force, and fails on the admitted record `X = Fin 2`, `O = {δ₀, δ₁}` of point
masses with AC-2 dropped. -/
theorem conditional_statements :
    (∀ (X : Type) (O : Set (X → ℝ)), ObservableClosure O →
        ∀ f ∈ O, ∀ h ∈ O, f + h ∈ O) ∧
      ¬ ObservableClosure ({delta 0, delta 1} : Set (Fin 2 → ℝ)) := by
  refine ⟨fun X O hO f hf h hh => hO f hf h hh, ?_⟩
  intro hO
  have hsum : delta (0 : Fin 2) + delta 1 = fun _ => 1 := by
    funext x
    fin_cases x <;> simp [delta, Pi.add_apply]
  have hmem : (fun _ : Fin 2 => (1 : ℝ)) ∈ ({delta 0, delta 1} : Set (Fin 2 → ℝ)) := by
    rw [← hsum]
    exact hO (delta 0) (by simp) (delta 1) (by simp)
  simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hmem
  rcases hmem with hmem | hmem
  · have hne := congrFun hmem (1 : Fin 2)
    simp [delta] at hne
  · have hne := congrFun hmem (0 : Fin 2)
    simp [delta] at hne

/-! ## Definition 3.12 and Theorem 8.1 — finite classical records -/

/-- Definition 3.12 with disjoint-union composition: the neutral record is the
empty record (cardinality 0), and a record is irreducible when it is not the
unit and is not the disjoint union of two nonempty state spaces. Up to
isomorphism only the cardinality matters, so the condition is a condition on
`Fintype.card X`. -/
def IsIrreducibleDisjointUnion (X : Type) [Fintype X] : Prop :=
  Fintype.card X ≠ 0 ∧ ¬ ∃ n : ℕ, 0 < n ∧ n < Fintype.card X

/-- Example 7.1: a record splits as the disjoint union of two nonempty records
exactly when its cardinality has an intermediate factor. -/
theorem irreducible_iff_no_sum_split {X : Type} [Fintype X] :
    IsIrreducibleDisjointUnion X ↔
      Fintype.card X ≠ 0 ∧
        ¬ ∃ (X₁ X₂ : Type) (_ : Fintype X₁) (_ : Fintype X₂),
          Nonempty X₁ ∧ Nonempty X₂ ∧ Nonempty (X ≃ X₁ ⊕ X₂) := by
  constructor
  · rintro ⟨hne, hs⟩
    refine ⟨hne, ?_⟩
    rintro ⟨X₁, X₂, _, _, h₁, h₂, ⟨e⟩⟩
    have hc1 : 0 < Fintype.card X₁ := Fintype.card_pos_iff.mpr h₁
    have hc2 : 0 < Fintype.card X₂ := Fintype.card_pos_iff.mpr h₂
    exact hs ⟨Fintype.card X₁, hc1, by
      rw [Fintype.card_congr e, Fintype.card_sum]
      omega⟩
  · rintro ⟨hne, hs⟩
    refine ⟨hne, ?_⟩
    rintro ⟨n, hpos, hlt⟩
    refine hs ?_
    refine ⟨Fin n, Fin (Fintype.card X - n), inferInstance, inferInstance,
      ⟨⟨0, by omega⟩⟩, ⟨⟨0, by omega⟩⟩, ?_⟩
    have hcard : Fintype.card (Fin n ⊕ Fin (Fintype.card X - n)) = Fintype.card X := by
      rw [Fintype.card_sum, Fintype.card_fin, Fintype.card_fin]
      omega
    exact Fintype.card_eq.mp hcard.symm

/-- Theorem 8.1(1) (target `vol01.finiteState.irreducible_iff_card_eq_one`): a
finite classical record is irreducible under disjoint union exactly when its
state space has one element. -/
theorem irreducible_iff_card_eq_one {X : Type} [Fintype X] :
    IsIrreducibleDisjointUnion X ↔ Fintype.card X = 1 := by
  constructor
  · rintro ⟨hne, hs⟩
    have hnot : ¬ (2 ≤ Fintype.card X) := by
      intro h2
      exact hs ⟨1, by omega, by omega⟩
    omega
  · intro h
    refine ⟨by omega, ?_⟩
    rintro ⟨n, _, hlt⟩
    omega

/-- Theorem 8.1(3) (target `vol01.finiteState.classify_iff_card_eq`): two
finite classical records are isomorphic exactly when their state spaces have
equal cardinality. -/
theorem iso_iff_card_eq {X Y : Type} [Fintype X] [Fintype Y] :
    Nonempty (X ≃ Y) ↔ Fintype.card X = Fintype.card Y :=
  Fintype.card_eq.symm

/-- Theorem 8.1(2): a decomposition of `X` into one-point records has exactly
`Fintype.card X` factors, so the decomposition is unique up to order and
isomorphism of factors. -/
theorem onePoint_decomposition_unique
    {X : Type} [Fintype X] {n : ℕ} {P : Fin n → Type} [∀ i, Fintype (P i)]
    (h1 : ∀ i, Fintype.card (P i) = 1) (split : Nonempty (X ≃ Σ i, P i)) :
    n = Fintype.card X := by
  obtain ⟨e⟩ := split
  have hcard : Fintype.card X = n := by
    rw [Fintype.card_congr e, Fintype.card_sigma]
    simp_rw [h1]
    rw [Finset.sum_const, Finset.card_fin]
    simp
  exact hcard.symm

/-- Theorem 8.1(2): all one-point factors of a decomposition are isomorphic to
the one-point record `Fin 1`. -/
theorem onePoint_factors_iso {n : ℕ} {P : Fin n → Type} [∀ i, Fintype (P i)]
    (h1 : ∀ i, Fintype.card (P i) = 1) (i : Fin n) : Nonempty (P i ≃ Fin 1) :=
  Fintype.card_eq.mp ((h1 i).trans (Fintype.card_fin 1).symm)

/-- Theorem 8.1(4): cardinality is a complete invariant; the quotient of
finite classical records by isomorphism is in bijection with the nonnegative
integers, the empty record corresponding to zero. -/
theorem card_classifies_quotient :
    (∀ (X Y : Type) [Fintype X] [Fintype Y],
        (Nonempty (X ≃ Y) ↔ Fintype.card X = Fintype.card Y)) ∧
      ∀ n : ℕ, ∃ (X : Type) (_ : Fintype X), Fintype.card X = n := by
  refine ⟨fun X Y _ _ => iso_iff_card_eq, ?_⟩
  intro n
  exact ⟨Fin n, inferInstance, Fintype.card_fin n⟩

/-! ## Definition 3.5, 3.12 and Theorem 8.2 — finite dynamical records -/

/-- Definition 3.5: a finite dynamical record is presented by a finite state
space `X` with discrete-time dynamics given by a self-map `f : X → X`. Two
states are adjacent when one is the image of the other under `f`; this is the
edge relation of the functional graph. -/
def Step {X : Type} (f : X → X) (x y : X) : Prop := f x = y ∨ f y = x

/-- Weak connectivity of the functional graph of `f` (Theorem 8.2): the record
is nonempty and any two states are joined by a finite chain of forward or
backward edges. -/
def WeaklyConnected {X : Type} (f : X → X) : Prop :=
  Nonempty X ∧ ∀ x y : X, Relation.ReflTransGen (Step f) x y

/-- Definition 3.12 on a finite dynamical record: irreducible under disjoint
union with componentwise dynamics — not the unit (the empty record) and no
split of `X` into two nonempty `f`-invariant parts. -/
def IsIrreducibleDyn {X : Type} (f : X → X) : Prop :=
  Nonempty X ∧ ¬ ∃ (s t : Set X), s.Nonempty ∧ t.Nonempty ∧ s ∩ t = ∅ ∧
    s ∪ t = Set.univ ∧ (∀ x ∈ s, f x ∈ s) ∧ (∀ x ∈ t, f x ∈ t)

/-- The functional graph edge relation is symmetric. -/
theorem step_symm {X : Type} {f : X → X} {a b : X} (h : Step f a b) : Step f b a := by
  rcases h with h | h
  · exact Or.inr h
  · exact Or.inl h

/-- Reachability in the functional graph is symmetric, because the edge
relation is. -/
theorem reachable_symm {X : Type} {f : X → X} {a b : X}
    (h : Relation.ReflTransGen (Step f) a b) : Relation.ReflTransGen (Step f) b a := by
  induction h with
  | refl => exact Relation.ReflTransGen.refl
  | tail _ hstep ih => exact (Relation.ReflTransGen.single (step_symm hstep)).trans ih

/-- If `x₀` reaches `f x` then it reaches `x`: the edge `x — f x` is traversed
backwards. -/
theorem reachable_pre {X : Type} {f : X → X} {x₀ x : X}
    (h : Relation.ReflTransGen (Step f) x₀ (f x)) :
    Relation.ReflTransGen (Step f) x₀ x :=
  h.trans (reachable_symm (Relation.ReflTransGen.single (Or.inl rfl : Step f x (f x))))

/-- Theorem 8.2(1) (target `vol01.dynamics.irreducible_iff_connected`): a
finite dynamical record is irreducible under disjoint union exactly when its
functional graph is weakly connected. -/
theorem irreducible_iff_connected {X : Type} [Fintype X] (f : X → X) :
    IsIrreducibleDyn f ↔ WeaklyConnected f := by
  constructor
  · rintro ⟨hne, hirr⟩
    obtain ⟨x₀⟩ := hne
    refine ⟨⟨x₀⟩, ?_⟩
    intro y z
    have hall : ∀ w : X, Relation.ReflTransGen (Step f) x₀ w := by
      by_contra hn
      push Not at hn
      obtain ⟨w, hw⟩ := hn
      set s := {u : X | Relation.ReflTransGen (Step f) x₀ u} with hsdef
      have hsn : s.Nonempty := ⟨x₀, Relation.ReflTransGen.refl⟩
      have htn : sᶜ.Nonempty := ⟨w, by simpa [hsdef] using hw⟩
      have hs : ∀ u ∈ s, f u ∈ s := by
        intro u hu
        exact Relation.ReflTransGen.trans hu
          (Relation.ReflTransGen.single (Or.inl rfl : Step f u (f u)))
      have hsc : ∀ u ∈ sᶜ, f u ∈ sᶜ := by
        intro u hu hfu
        exact hu (reachable_pre hfu)
      exact hirr ⟨s, sᶜ, hsn, htn, Set.inter_compl_self s,
        Set.union_compl_self s, hs, hsc⟩
    exact (reachable_symm (hall y)).trans (hall z)
  · rintro ⟨hne, hconn⟩
    refine ⟨hne, ?_⟩
    rintro ⟨s, t, hsn, htn, hdisj, huniv, hs, ht⟩
    obtain ⟨x, hx⟩ := hsn
    obtain ⟨y, hy⟩ := htn
    have htc : ∀ u ∈ sᶜ, f u ∈ sᶜ := by
      intro u hu hfu
      have hu' : u ∈ s ∪ t := by rw [huniv]; trivial
      rcases hu' with hu' | hu'
      · exact hu hu'
      · have hfin : f u ∈ s ∩ t := ⟨hfu, ht u hu'⟩
        rw [hdisj] at hfin
        exact (Set.mem_empty_iff_false _).mp hfin
    have hstep : ∀ {a b : X}, Step f a b → a ∈ s → b ∈ s := by
      intro a b hab ha
      rcases hab with hab | hab
      · rw [← hab]; exact hs a ha
      · by_contra hbs
        have hbs' : b ∈ sᶜ := by simpa using hbs
        have : f b ∈ sᶜ := htc b hbs'
        rw [hab] at this
        exact this ha
    have hmem : ∀ {b : X}, Relation.ReflTransGen (Step f) x b → b ∈ s := by
      intro b hb
      induction hb with
      | refl => exact hx
      | tail _ hstep' ih => exact hstep hstep' ih
    have hy' : y ∈ s := hmem (hconn x y)
    have hyt : y ∈ s ∩ t := ⟨hy', hy⟩
    rw [hdisj] at hyt
    exact (Set.mem_empty_iff_false y).mp hyt

/-! ## Theorem 8.2(2) — uniqueness of the connected-component decomposition -/

/-- The connected component (reachability class) of `x` in the functional
graph of `f`. -/
def reachableClass {X : Type} (f : X → X) (x : X) : Set X :=
  {y | Relation.ReflTransGen (Step f) x y}

/-- A decomposition of a finite dynamical record (Definition 3.13): a
partition of `X` into nonempty `f`-invariant weakly connected parts. -/
structure DynDecomposition {X : Type} (f : X → X) where
  /-- The parts of the partition. -/
  parts : Finset (Set X)
  /-- Every part is nonempty. -/
  nonempty : ∀ s ∈ parts, s.Nonempty
  /-- Every part is `f`-invariant. -/
  invariant : ∀ s ∈ parts, ∀ x ∈ s, f x ∈ s
  /-- Distinct parts are disjoint. -/
  disjoint : ∀ s ∈ parts, ∀ t ∈ parts, s ≠ t → s ∩ t = ∅
  /-- The parts cover `X`. -/
  cover : ∀ x : X, ∃ s ∈ parts, x ∈ s
  /-- Every part is weakly connected in the functional graph. -/
  connected : ∀ s ∈ parts, ∀ x ∈ s, ∀ y ∈ s, Relation.ReflTransGen (Step f) x y

/-- Reachability classes are equal or disjoint. -/
theorem reachableClass_eq_of_reach {X : Type} {f : X → X} {x y : X}
    (h : Relation.ReflTransGen (Step f) x y) :
    reachableClass f x = reachableClass f y := by
  apply Set.eq_of_subset_of_subset
  · intro z hz
    exact (reachable_symm h).trans hz
  · intro z hz
    exact h.trans hz

/-- Every part of a decomposition is exactly the reachability class of any of
its points. -/
theorem class_eq_of_mem {X : Type} {f : X → X} {D : DynDecomposition f}
    {s : Set X} {x : X} (hs : s ∈ D.parts) (hx : x ∈ s) :
    s = reachableClass f x := by
  apply Set.eq_of_subset_of_subset
  · intro y hy
    exact D.connected s hs x hx y hy
  · intro y hy
    have hsc : ∀ z ∈ sᶜ, f z ∈ sᶜ := by
      intro z hz hfin
      obtain ⟨t, ht, hzt⟩ := D.cover z
      have hts : t ≠ s := by
        rintro rfl
        exact hz hzt
      have hfin' : f z ∈ t := D.invariant t ht z hzt
      have hempty : s ∩ t = ∅ := D.disjoint s hs t ht hts.symm
      have hboth : f z ∈ s ∩ t := ⟨hfin, hfin'⟩
      rw [hempty] at hboth
      exact (Set.mem_empty_iff_false _).mp hboth
    have hstep : ∀ {a b : X}, Step f a b → a ∈ s → b ∈ s := by
      intro a b hab ha
      rcases hab with hab | hab
      · rw [← hab]; exact D.invariant s hs a ha
      · by_contra hbs
        have hbs' : b ∈ sᶜ := by simpa using hbs
        have : f b ∈ sᶜ := hsc b hbs'
        rw [hab] at this
        exact this ha
    have hmem : ∀ {b : X}, Relation.ReflTransGen (Step f) x b → b ∈ s := by
      intro b hb
      induction hb with
      | refl => exact hx
      | tail _ hstep' ih => exact hstep hstep' ih
    exact hmem hy

/-- Theorem 8.2(2) (target `vol01.dynamics.connected_components_unique`): the
connected-component decomposition is unique up to order and isomorphism of
factors — any two decompositions into nonempty invariant connected parts have
the same parts. -/
theorem components_unique {X : Type} {f : X → X}
    (D₁ D₂ : DynDecomposition f) : D₁.parts = D₂.parts := by
  apply Finset.ext
  intro a
  constructor
  · intro ha
    obtain ⟨x, hx⟩ := D₁.nonempty a ha
    have key := class_eq_of_mem ha hx
    obtain ⟨b, hb, hxb⟩ := D₂.cover x
    have keyb := class_eq_of_mem hb hxb
    have hab : a = b := key.trans keyb.symm
    rw [hab]
    exact hb
  · intro ha
    obtain ⟨x, hx⟩ := D₂.nonempty a ha
    have key := class_eq_of_mem ha hx
    obtain ⟨b, hb, hxb⟩ := D₁.cover x
    have keyb := class_eq_of_mem hb hxb
    have hab : a = b := key.trans keyb.symm
    rw [hab]
    exact hb

/-- Theorem 8.2(2): the connected-component decomposition exists — the
reachability classes of the functional graph partition `X` into nonempty
invariant connected parts. -/
theorem components_exist {X : Type} [Fintype X] (f : X → X) :
    ∃ D : DynDecomposition f,
      ∀ s : Set X, s ∈ D.parts ↔ ∃ x : X, s = reachableClass f x := by
  classical
  set S : Finset (Set X) := Finset.univ.image fun x : X => reachableClass f x
  have hne : ∀ s ∈ S, s.Nonempty := by
    intro s hs
    obtain ⟨x, _, rfl⟩ := Finset.mem_image.mp hs
    exact ⟨x, Relation.ReflTransGen.refl⟩
  have hinv : ∀ s ∈ S, ∀ x ∈ s, f x ∈ s := by
    intro s hs x hx
    obtain ⟨x₀, _, rfl⟩ := Finset.mem_image.mp hs
    exact Relation.ReflTransGen.trans hx
      (Relation.ReflTransGen.single (Or.inl rfl : Step f x (f x)))
  have hdisj : ∀ s ∈ S, ∀ t ∈ S, s ≠ t → s ∩ t = ∅ := by
    intro s hs t ht hne'
    obtain ⟨x, _, rfl⟩ := Finset.mem_image.mp hs
    obtain ⟨y, _, rfl⟩ := Finset.mem_image.mp ht
    apply Set.eq_empty_iff_forall_notMem.mpr
    intro z hzs
    obtain ⟨hzs, hzt⟩ := hzs
    apply hne'
    exact reachableClass_eq_of_reach (hzs.trans (reachable_symm hzt))
  have hcover : ∀ x : X, ∃ s ∈ S, x ∈ s := by
    intro x
    exact ⟨reachableClass f x, Finset.mem_image.mpr ⟨x, Finset.mem_univ x, rfl⟩,
      Relation.ReflTransGen.refl⟩
  have hconn : ∀ s ∈ S, ∀ x ∈ s, ∀ y ∈ s, Relation.ReflTransGen (Step f) x y := by
    intro s hs x hx y hy
    obtain ⟨x₀, _, rfl⟩ := Finset.mem_image.mp hs
    exact (reachable_symm hx).trans hy
  have himg : ∀ s : Set X, s ∈ S ↔ ∃ x : X, s = reachableClass f x := by
    intro s
    constructor
    · intro hs
      obtain ⟨x, _, heq⟩ := Finset.mem_image.mp hs
      exact ⟨x, heq.symm⟩
    · rintro ⟨x, rfl⟩
      exact Finset.mem_image.mpr ⟨x, Finset.mem_univ x, rfl⟩
  exact ⟨⟨S, hne, hinv, hdisj, hcover, hconn⟩, himg⟩

/-! ## Example 7.5 — irreducibles under product composition -/

/-- Definition 3.12 with product composition (Example 7.5): the neutral record
is the one-point record, the empty product, and a record is irreducible when
it is not the unit and is not a product of two non-unit state spaces. Up to
isomorphism only the cardinality matters. -/
def IsIrreducibleProduct (X : Type) [Fintype X] : Prop :=
  Fintype.card X ≠ 1 ∧ ¬ ∃ a b : ℕ, a ≠ 1 ∧ b ≠ 1 ∧ Fintype.card X = a * b

/-- Example 7.5 (target `vol01.product.irreducible_iff_prime_card`): under the
product rule the irreducible finite classical records are exactly those of
prime cardinality. -/
theorem irreducibleProduct_iff_prime_card {X : Type} [Fintype X] :
    IsIrreducibleProduct X ↔ Nat.Prime (Fintype.card X) := by
  constructor
  · rintro ⟨hne, hs⟩
    have h0 : Fintype.card X ≠ 0 := by
      intro h0
      exact hs ⟨0, 0, by decide, by decide, by rw [h0]⟩
    have h2 : 2 ≤ Fintype.card X := by omega
    refine (Nat.prime_def_lt').2 ⟨h2, ?_⟩
    intro m hm2 hmlt hdvd
    obtain ⟨k, hk⟩ := hdvd
    have hk1 : k ≠ 1 := by
      rintro rfl
      rw [mul_one] at hk
      omega
    exact hs ⟨m, k, by omega, hk1, hk⟩
  · intro hp
    refine ⟨?_, ?_⟩
    · intro h1
      have := hp.two_le
      omega
    · rintro ⟨a, b, ha, hb, hab⟩
      have hdvd : a ∣ Fintype.card X := ⟨b, hab⟩
      rcases hp.eq_one_or_self_of_dvd a hdvd with h | h
      · exact ha h
      · rw [h] at hab
        have h1 : (1 : ℕ) = b := Nat.mul_left_cancel
          (Nat.pos_of_ne_zero hp.ne_zero) (by rw [← hab, mul_one])
        exact hb h1.symm

/-- Example 7.5: every nonzero-cardinality finite classical record is a
product of prime-cardinality records; the factor list is the prime
factorisation of the cardinality. -/
theorem prime_factorization {X : Type} [Fintype X] (h : Fintype.card X ≠ 0) :
    List.prod (Fintype.card X).primeFactorsList = Fintype.card X ∧
      ∀ p ∈ (Fintype.card X).primeFactorsList, Nat.Prime p :=
  ⟨Nat.prod_primeFactorsList h, fun _ hp => Nat.prime_of_mem_primeFactorsList hp⟩

/-- Example 7.5: the decomposition into prime-cardinality records is unique up
to order, by the fundamental theorem of arithmetic. -/
theorem prime_factorization_unique {n : ℕ} {l : List ℕ}
    (hprod : List.prod l = n) (hprime : ∀ p ∈ l, Nat.Prime p) :
    List.Perm l n.primeFactorsList :=
  Nat.primeFactorsList_unique hprod hprime

/-! ## Proposition 7.6 — factorisation is extra data -/

/-- A coefficient matrix of a pure two-qubit state (Definition 3.8): the entry
`M i j` is the coefficient of `eᵢ ⊗ eⱼ` in a chosen factorisation of the bare
four-dimensional space. -/
abbrev CoeffMat := Matrix (Fin 2) (Fin 2) ℂ

/-- The diagonal entries of the reduced density matrix `M ⬝ M†` of a pure
two-qubit state with coefficient matrix `M`: the squared norms of the rows. -/
noncomputable def reducedDiag (M : CoeffMat) : Fin 2 → ℝ := fun i => ∑ j, ‖M i j‖ ^ 2

/-- The off-diagonal entry `ρ₀₁` of the reduced density matrix `M ⬝ M†`; the
reduced matrix is diagonal exactly when this vanishes. -/
noncomputable def reducedOffDiag (M : CoeffMat) : ℂ := ∑ j, M 0 j * star (M 1 j)

/-- A pure two-qubit state is a unit vector of the bare space. -/
def IsUnitState (M : CoeffMat) : Prop := (∑ i, ∑ j, ‖M i j‖ ^ 2) = 1

/-- Entanglement entropy of a pure two-qubit state whose reduced density
matrix is diagonal in the computational basis: the von Neumann entropy of the
reduced state is the entropy of the distribution of its diagonal entries (the
squared row norms computed by `reducedDiag`). Both witnesses of
Proposition 7.6 have diagonal reduced density matrix. -/
noncomputable def entanglementEntropy (M : CoeffMat) : ℝ :=
  -(reducedDiag M 0 * Real.log (reducedDiag M 0) +
    reducedDiag M 1 * Real.log (reducedDiag M 1))

/-- The change of factorisation `W` of Proposition 7.6: the Hadamard rotation
on the span of the diagonal coefficient matrices `e₁ ⊗ e₁`, `e₂ ⊗ e₂`,
extended by the identity on the off-diagonal ones. It is an involution, hence
invertible, so it relates two legitimate factorisation structures on the same
bare Hilbert space. -/
noncomputable def changeFactorization (M : CoeffMat) : CoeffMat := fun i j =>
  if i = j then
    if i = 0 then (M 0 0 + M 1 1) / ((Real.sqrt 2 : ℝ) : ℂ)
    else (M 0 0 - M 1 1) / ((Real.sqrt 2 : ℝ) : ℂ)
  else M i j

/-- The fixed unit vector `ψ = e₁ ⊗ e₁` of Proposition 7.6 in the coordinates
of the first factorisation. -/
def psiFirst : CoeffMat := fun i j => if i = 0 ∧ j = 0 then 1 else 0

/-- The coordinate matrix of the same bare vector `ψ` in the second
factorisation: `(e₁ ⊗ e₁ + e₂ ⊗ e₂)/√2`. -/
noncomputable def psiSecond : CoeffMat := fun i j =>
  if i = j then (1 : ℂ) / ((Real.sqrt 2 : ℝ) : ℂ) else 0

private theorem sq_sqrt_two : ((Real.sqrt 2 : ℝ) : ℂ) * ((Real.sqrt 2 : ℝ) : ℂ) = 2 := by
  rw [← Complex.ofReal_mul, Real.mul_self_sqrt (by norm_num : (0:ℝ) ≤ 2)]
  norm_num

private theorem norm_psiSecond (i j : Fin 2) :
    ‖psiSecond i j‖ ^ 2 = if i = j then (1 / 2 : ℝ) else 0 := by
  by_cases h : i = j
  · subst h
    have hrw : (if i = i then (1 / 2 : ℝ) else 0) = 1 / 2 := by simp
    rw [hrw]
    have hval : psiSecond i i = (1 : ℂ) / ((Real.sqrt 2 : ℝ) : ℂ) := by simp [psiSecond]
    rw [hval]
    have hnorm : ‖((1 : ℂ) / ((Real.sqrt 2 : ℝ) : ℂ))‖ = (1 / Real.sqrt 2 : ℝ) := by
      rw [norm_div, Complex.norm_real, Real.norm_eq_abs,
        abs_of_nonneg (Real.sqrt_nonneg 2), norm_one]
    rw [hnorm]
    have h2 : (Real.sqrt 2) ^ 2 = 2 := Real.sq_sqrt (by norm_num)
    rw [div_pow, one_pow, h2]
  · simp [psiSecond, h]

/-- The Hadamard block is an involution. -/
private theorem hadamard_involutive (a b : ℂ) :
    ((a + b) / ((Real.sqrt 2 : ℝ) : ℂ) + (a - b) / ((Real.sqrt 2 : ℝ) : ℂ)) /
        ((Real.sqrt 2 : ℝ) : ℂ) = a ∧
      ((a + b) / ((Real.sqrt 2 : ℝ) : ℂ) - (a - b) / ((Real.sqrt 2 : ℝ) : ℂ)) /
        ((Real.sqrt 2 : ℝ) : ℂ) = b := by
  have h2 : ((Real.sqrt 2 : ℝ) : ℂ) ^ 2 = 2 := by
    rw [← sq_sqrt_two]
    ring
  constructor <;> (field_simp [h2]; rw [h2]; ring)

/-- The change of factorisation is invertible: it is an involution. -/
theorem changeFactorization_involutive (M : CoeffMat) :
    changeFactorization (changeFactorization M) = M := by
  apply Matrix.ext
  intro i j
  fin_cases i <;> fin_cases j
  · simp [changeFactorization]
    exact (hadamard_involutive (M 0 0) (M 1 1)).1
  · simp [changeFactorization]
  · simp [changeFactorization]
  · simp [changeFactorization]
    exact (hadamard_involutive (M 0 0) (M 1 1)).2

/-- The two factorisation presentations of the fixed vector `ψ` of
Proposition 7.6: the first coordinates are `e₁ ⊗ e₁`, the second are
`(e₁ ⊗ e₁ + e₂ ⊗ e₂)/√2`, related by the change of factorisation `W`. -/
theorem changeFactorization_psi : changeFactorization psiFirst = psiSecond := by
  funext i j
  fin_cases i <;> fin_cases j <;> simp [changeFactorization, psiFirst, psiSecond]

/-- The first presentation of `ψ` has reduced density matrix `diag(1, 0)`. -/
theorem reducedDiag_first :
    reducedDiag psiFirst 0 = 1 ∧ reducedDiag psiFirst 1 = 0 ∧
      reducedOffDiag psiFirst = 0 := by
  have hnorm : ∀ i j : Fin 2,
      ‖psiFirst i j‖ ^ 2 = if i = 0 ∧ j = 0 then (1 : ℝ) else 0 := by
    intro i j
    by_cases h : i = 0 ∧ j = 0
    · have hij : psiFirst i j = 1 := by simp [psiFirst, h]
      rw [hij]
      simp [h]
    · have hij : psiFirst i j = 0 := by simp [psiFirst, h]
      rw [hij]
      simp [h]
  refine ⟨?_, ?_, ?_⟩
  · have h := hnorm 0 0
    have h' := hnorm 0 1
    simp [reducedDiag, Fin.sum_univ_two, h, h']
  · have h := hnorm 1 0
    have h' := hnorm 1 1
    simp [reducedDiag, Fin.sum_univ_two, h, h']
  · simp [reducedOffDiag, psiFirst]

/-- The second presentation of `ψ` has reduced density matrix
`diag(1/2, 1/2)`. -/
theorem reducedDiag_second :
    reducedDiag psiSecond 0 = 1 / 2 ∧ reducedDiag psiSecond 1 = 1 / 2 ∧
      reducedOffDiag psiSecond = 0 := by
  refine ⟨?_, ?_, ?_⟩
  · have h := norm_psiSecond 0 0
    have h' := norm_psiSecond 0 1
    simp [reducedDiag, Fin.sum_univ_two, h, h']
  · have h := norm_psiSecond 1 0
    have h' := norm_psiSecond 1 1
    simp [reducedDiag, Fin.sum_univ_two, h, h']
  · simp [reducedOffDiag, psiSecond]

/-- Both presentations of `ψ` are unit vectors. -/
theorem isUnitState_psi : IsUnitState psiFirst ∧ IsUnitState psiSecond := by
  have hnorm : ∀ i j : Fin 2,
      ‖psiFirst i j‖ ^ 2 = if i = 0 ∧ j = 0 then (1 : ℝ) else 0 := by
    intro i j
    by_cases h : i = 0 ∧ j = 0
    · have hij : psiFirst i j = 1 := by simp [psiFirst, h]
      rw [hij]
      simp [h]
    · have hij : psiFirst i j = 0 := by simp [psiFirst, h]
      rw [hij]
      simp [h]
  refine ⟨?_, ?_⟩
  · show (∑ i, ∑ j, ‖psiFirst i j‖ ^ 2) = 1
    have a00 := hnorm 0 0
    have a01 := hnorm 0 1
    have a10 := hnorm 1 0
    have a11 := hnorm 1 1
    simp [Fin.sum_univ_two, a00, a01, a10, a11]
  · show (∑ i, ∑ j, ‖psiSecond i j‖ ^ 2) = 1
    have a00 := norm_psiSecond 0 0
    have a01 := norm_psiSecond 0 1
    have a10 := norm_psiSecond 1 0
    have a11 := norm_psiSecond 1 1
    simp [Fin.sum_univ_two, a00, a01, a10, a11]
    norm_num

/-- Proposition 7.6 (target `vol01.qubit.factorization_nonunique`): the fixed
unit vector `ψ` has entanglement entropy `0` in the first factorisation and
`log 2` in the second. The bare record does not determine the decomposition of
the state space into factors. -/
theorem factorization_nonunique :
    IsUnitState psiFirst ∧ IsUnitState psiSecond ∧
      changeFactorization (changeFactorization psiFirst) = psiFirst ∧
      changeFactorization psiFirst = psiSecond ∧
      entanglementEntropy psiFirst = 0 ∧
      entanglementEntropy psiSecond = Real.log 2 := by
  refine ⟨isUnitState_psi.1, isUnitState_psi.2,
    changeFactorization_involutive psiFirst, changeFactorization_psi, ?_, ?_⟩
  · rw [entanglementEntropy, reducedDiag_first.1, reducedDiag_first.2.1]
    simp
  · rw [entanglementEntropy, reducedDiag_second.1, reducedDiag_second.2.1]
    have h12 : ((1 / 2 : ℝ)) = (2 : ℝ)⁻¹ := by ring
    rw [h12, Real.log_inv]
    ring

end Cmrps.Vol01
