import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Tactic

/-!
# Observational Equivalence and Physical Distinguishability (Volume 10)

Formalization of the tractable mechanization targets of
`verification/vol-10-observational-equivalence-lean-targets.md`, mirroring the names of
`papers/latex/vol-10-observational-equivalence.tex`.

Policy of this module: definitions are stated directly; survey theorems whose content is
external literature (Etingof–Gelaki, Chentsov, Petz–Sudar) are formalized as their honest
logical skeleton, with the classical inputs recorded as explicit hypotheses or as
statement definitions left unproved. Nothing in this file uses `sorry` or new axioms.
-/

namespace Cmrps.Vol10

/-! ## Equivalence notions (Definitions 2.1–2.7) -/

/-- Definition 2.1 (System record): a physical system representation is a tuple
`P = (X, O, D, S, C)` of state space, observable collection, dynamics, symmetry and
constraint data, and composition rules. -/
structure SystemRecord where
  /-- State space or geometric structure. -/
  X : Type
  /-- Observable algebra or collection. -/
  O : Type
  /-- Dynamical data. -/
  D : Type
  /-- Symmetry and constraint data. -/
  S : Type
  /-- Composition or interaction rules. -/
  C : Type

/-- Definition 2.5 (admissible candidate relation): a candidate `≃` is admissible only if
`≅ ⊆ ≃` and `≃` is contained in the intersection of the admissible observational
relations. Here `mathIso` is mathematical equivalence and `admissible` is the family of
admissible observational relations `≈_Obs`. -/
def AdmissibleCandidate {S : Type*} (mathIso : S → S → Prop)
    (admissible : Set (S → S → Prop)) (candidate : S → S → Prop) : Prop :=
  (∀ P Q, mathIso P Q → candidate P Q) ∧
    ∀ P Q, candidate P Q → ∀ rel ∈ admissible, rel P Q

/-- The equivalence notion in force (Definition 2.6). -/
inductive EquivalenceNotion where
  | mathematical
  | physical
deriving DecidableEq, Repr

/-- The morphism kinds of the object schema at the observational level
(Definition 2.7). -/
inductive MorphismKind where
  | coarseGraining
  | embedding
  | duality
  | limitingProcedure
deriving DecidableEq, Repr

/-- The layers of structure an identification may preserve (Definition 2.6, Table 3). -/
inductive PreservedLayer where
  | symmetricMonoidal
  | braided
  | monoidalWithoutSymmetry
  | star
  | algebraic
  | topological
  | completePositivity
  | unitaryFreedom
deriving DecidableEq, Repr

/-- Definition 2.6 (equivalence witness): an identification of two systems records the
equivalence notion in force, the morphism kind realizing it, and the layers of structure
it preserves. -/
structure EquivalenceWitness where
  /-- The equivalence notion in force. -/
  notion : EquivalenceNotion
  /-- The morphism kind realizing the identification. -/
  morphism : MorphismKind
  /-- The layers of structure the identification preserves. -/
  preservedLayers : Set PreservedLayer

/-- A witness declares the symmetric monoidal layer. -/
def DeclaresSymmetric (w : EquivalenceWitness) : Prop :=
  PreservedLayer.symmetricMonoidal ∈ w.preservedLayers

/-! ## Observation functors (Definition 4.1, Definition 2.4) -/

/-- Definition 4.1 (observation functor), skeletal form: a functor `Obs` from systems to
observation records, with record comparison abstracted as record isomorphism (an
equivalence relation on records). -/
structure ObservationFunctor (S R : Type*) where
  /-- The observation record of a system. -/
  obs : S → R
  /-- Isomorphism of observation records. -/
  recordIso : R → R → Prop
  /-- Record isomorphism is an equivalence relation. -/
  recordIso_equiv : Equivalence recordIso

/-- Definition 2.4 (observational equivalence): `P ≈ Q` when the observation records of
`P` and `Q` are isomorphic. -/
def obsEquiv {S R : Type*} (F : ObservationFunctor S R) (P Q : S) : Prop :=
  F.recordIso (F.obs P) (F.obs Q)

/-- The record isomorphism class of a record (Proposition 4.2). -/
def recordClass {R : Type*} (rel : R → R → Prop) (h : Equivalence rel) : R → Quotient ⟨rel, h⟩ :=
  Quotient.mk ⟨rel, h⟩

/-- Proposition 4.2 (induced relation): the relation `P ≈ Q` defined by record
isomorphism is an equivalence relation on systems. -/
theorem obs_induced_equivalence {S R : Type*} (F : ObservationFunctor S R) :
    Equivalence (obsEquiv F) where
  refl _P := F.recordIso_equiv.refl _
  symm h := F.recordIso_equiv.symm h
  trans h1 h2 := F.recordIso_equiv.trans h1 h2

/-- Proposition 4.2 (classes are fibers): `P ≈ Q` holds exactly when the record
isomorphism classes of `Obs P` and `Obs Q` coincide. -/
theorem obs_class_fibers {S R : Type*} (F : ObservationFunctor S R) (P Q : S) :
    recordClass F.recordIso F.recordIso_equiv (F.obs P)
      = recordClass F.recordIso F.recordIso_equiv (F.obs Q) ↔ obsEquiv F P Q := by
  constructor
  · intro h
    exact Quotient.exact h
  · intro h
    exact Quotient.sound h

/-- Proposition 4.2 (universal quotient property): every map out of the systems that is
constant on `≈`-classes factors uniquely through the quotient by `≈`. -/
theorem obs_quotient_factor {S T R : Type*} (F : ObservationFunctor S R)
    (f : S → T) (hf : ∀ P Q, obsEquiv F P Q → f P = f Q) :
    ∃! g : Quotient ⟨obsEquiv F, obs_induced_equivalence F⟩ → T,
      ∀ P, g (Quotient.mk _ P) = f P := by
  refine ⟨Quotient.lift f (fun P Q h => hf P Q h), ?_, ?_⟩
  · intro P
    rfl
  · intro g hg
    funext x
    refine Quotient.inductionOn x fun P => ?_
    exact hg P

/-- Lemma 4.3 (setup): the product of two observation functors is an observation functor
into the product of the record categories. -/
def ObservationFunctor.prod {S R₁ R₂ : Type*} (F₁ : ObservationFunctor S R₁)
    (F₂ : ObservationFunctor S R₂) : ObservationFunctor S (R₁ × R₂) where
  obs := fun P => (F₁.obs P, F₂.obs P)
  recordIso := fun x y => F₁.recordIso x.1 y.1 ∧ F₂.recordIso x.2 y.2
  recordIso_equiv :=
    { refl := fun _x => ⟨F₁.recordIso_equiv.refl _, F₂.recordIso_equiv.refl _⟩
      symm := fun ⟨h1, h2⟩ => ⟨F₁.recordIso_equiv.symm h1, F₂.recordIso_equiv.symm h2⟩
      trans := fun ⟨a, b⟩ ⟨c, d⟩ =>
        ⟨F₁.recordIso_equiv.trans a c, F₂.recordIso_equiv.trans b d⟩ }

/-- Lemma 4.3 (products of observations): the relation induced by a product of
observation functors is the intersection of the relations of the two factors. -/
theorem obs_products_intersection {S R₁ R₂ : Type*} (F₁ : ObservationFunctor S R₁)
    (F₂ : ObservationFunctor S R₂) (P Q : S) :
    obsEquiv (F₁.prod F₂) P Q ↔ obsEquiv F₁ P Q ∧ obsEquiv F₂ P Q :=
  Iff.rfl

/-! ## Coarse and fine observations (Definition 4.4, Proposition 4.5) -/

/-- Definition 4.4 (coarse and fine observations): `Obs_c` is a coarsening of `Obs_f`
when a forgetting map `h` on records exists with `Obs_c = h ∘ Obs_f`. -/
structure Coarsening {S Rf Rc : Type*} (Ff : ObservationFunctor S Rf) (obsC : S → Rc) where
  /-- The comparison map on records that forgets detail. -/
  h : Rf → Rc
  /-- `Obs_c = h ∘ Obs_f` on systems. -/
  factors : obsC = h ∘ Ff.obs

/-- Proposition 4.5 (coarse records separate less), inclusion direction: if
`Obs_c = h ∘ Obs_f` and `h` carries record isomorphisms to record isomorphisms, then
fine equivalence implies coarse equivalence. -/
theorem obs_coarse_graining_composition {S Rf Rc : Type*}
    (Ff : ObservationFunctor S Rf) (Fc : ObservationFunctor S Rc)
    (h : Rf → Rc) (factors : Fc.obs = h ∘ Ff.obs)
    (h_mono : ∀ x y, Ff.recordIso x y → Fc.recordIso (h x) (h y))
    (P Q : S) (hpq : obsEquiv Ff P Q) : obsEquiv Fc P Q := by
  have hP : Fc.obs P = h (Ff.obs P) := by rw [factors]; rfl
  have hQ : Fc.obs Q = h (Ff.obs Q) := by rw [factors]; rfl
  show Fc.recordIso (Fc.obs P) (Fc.obs Q)
  rw [hP, hQ]
  exact h_mono (Ff.obs P) (Ff.obs Q) hpq

/-! ## The four-point witness of §9.1 -/

/-- A probability vector on the four-point sample space `Ω = {1,2,3,4}` of §9.1. -/
structure Dist4 where
  x1 : ℚ
  x2 : ℚ
  x3 : ℚ
  x4 : ℚ
deriving DecidableEq, Repr

/-- The distribution `p = (1/2, 1/4, 1/8, 1/8)` of §9.1. -/
def pDist : Dist4 := ⟨1/2, 1/4, 1/8, 1/8⟩

/-- The distribution `q = (1/4, 1/2, 1/8, 1/8)` of §9.1. -/
def qDist : Dist4 := ⟨1/4, 1/2, 1/8, 1/8⟩

/-- The distribution `r = (1/8, 1/8, 1/2, 1/4)` of §9.4. -/
def rDist : Dist4 := ⟨1/8, 1/8, 1/2, 1/4⟩

/-- Experiment `e1 = {{1,2},{3,4}}`: its outcome distribution on `v`. -/
def e1Push (v : Dist4) : ℚ × ℚ := (v.x1 + v.x2, v.x3 + v.x4)

/-- Experiment `e2 = {{1,3},{2,4}}`: its outcome distribution on `v`. -/
def e2Push (v : Dist4) : ℚ × ℚ := (v.x1 + v.x3, v.x2 + v.x4)

/-- Experiment `e3 = {{1,4},{2,3}}`: its outcome distribution on `v`. -/
def e3Push (v : Dist4) : ℚ × ℚ := (v.x1 + v.x4, v.x2 + v.x3)

/-- Two distributions report the same record for the experiment `push`. -/
def SameRecord (push : Dist4 → ℚ × ℚ) (v w : Dist4) : Prop :=
  (push v).1 = (push w).1 ∧ (push v).2 = (push w).2

/-- The diagonal joint event `{ω1 = ω2}` on the composite `Ω × Ω` (Proposition 4.6). -/
def diagJoint (v w : Dist4) : ℚ :=
  v.x1 * w.x1 + v.x2 * w.x2 + v.x3 * w.x3 + v.x4 * w.x4

/-- Proposition 4.5 (strictness witness of §9.1): the coarse record `e1` identifies `p`
and `q`, while the fine record over `e1` and `e2` separates them; the inclusion of
relations is strict. -/
theorem obs_coarse_witness :
    SameRecord e1Push pDist qDist ∧ ¬ SameRecord e2Push pDist qDist := by
  constructor
  · show (e1Push pDist).1 = (e1Push qDist).1 ∧ (e1Push pDist).2 = (e1Push qDist).2
    constructor
    · norm_num [e1Push, pDist, qDist]
    · norm_num [e1Push, pDist, qDist]
  · intro h
    norm_num [SameRecord, e2Push, pDist, qDist] at h

/-! ## Composed experiments (Proposition 4.6) -/

/-- The observation functor of a composite system whose record is the product of the
factor records (the hypothesis of Proposition 4.6). -/
def ObservationFunctor.compProd {S₁ S₂ R₁ R₂ : Type*} (F₁ : ObservationFunctor S₁ R₁)
    (F₂ : ObservationFunctor S₂ R₂) : ObservationFunctor (S₁ × S₂) (R₁ × R₂) where
  obs := fun PQ => (F₁.obs PQ.1, F₂.obs PQ.2)
  recordIso := fun x y => F₁.recordIso x.1 y.1 ∧ F₂.recordIso x.2 y.2
  recordIso_equiv :=
    { refl := fun _x => ⟨F₁.recordIso_equiv.refl _, F₂.recordIso_equiv.refl _⟩
      symm := fun ⟨h1, h2⟩ => ⟨F₁.recordIso_equiv.symm h1, F₂.recordIso_equiv.symm h2⟩
      trans := fun ⟨a, b⟩ ⟨c, d⟩ =>
        ⟨F₁.recordIso_equiv.trans a c, F₂.recordIso_equiv.trans b d⟩ }

/-- Proposition 4.6 (composed experiments), product direction: under product records
indistinguishability of the factors is preserved on composites. -/
theorem obs_composed_product_preserved {S₁ S₂ R₁ R₂ : Type*}
    (F₁ : ObservationFunctor S₁ R₁) (F₂ : ObservationFunctor S₂ R₂)
    (P P' : S₁) (Q Q' : S₂)
    (hP : obsEquiv F₁ P P') (hQ : obsEquiv F₂ Q Q') :
    obsEquiv (F₁.compProd F₂) (P, Q) (P', Q') :=
  ⟨hP, hQ⟩

/-- Proposition 4.6 (composed experiments), failure witness: the factor records of `p`
and `q` under `e1` coincide, yet the diagonal joint experiment on the composite
separates `p × p` from `p × q`, reporting `11/32` against `9/32`. -/
theorem obs_composed_experiments_failure :
    SameRecord e1Push pDist qDist
      ∧ diagJoint pDist pDist = 11/32
      ∧ diagJoint pDist qDist = 9/32
      ∧ (11/32 : ℚ) ≠ 9/32 := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · exact obs_coarse_witness.1
  · norm_num [diagJoint, pDist, qDist]
  · norm_num [diagJoint, pDist, qDist]
  · norm_num

/-! ## Structure preservation and its failure (Theorem 3.1, Corollary 3.2) -/

/-- Theorem 3.1 (Etingof–Gelaki) as hypothesis data: non-isomorphic finite groups whose
complex representation categories are equivalent as plain tensor categories. The
construction itself is literature; this record packages exactly the data the corollary
needs. -/
structure PlainTensorCounterexample (Grp : Type)
    (plainTensorEquiv : Grp → Grp → Prop) (groupIso : Grp → Grp → Prop) where
  /-- The first group. -/
  G : Grp
  /-- The second group. -/
  H : Grp
  /-- The groups are not isomorphic. -/
  groups_noniso : ¬ groupIso G H
  /-- Their representation categories are equivalent as plain tensor categories. -/
  plain_tensor_equiv : plainTensorEquiv G H

/-- Theorem 3.1 (`eg_plain_tensor_insufficient`), conditional form: an equivalence of
representation categories that forgets the symmetric structure cannot recover the
underlying group — plain tensor equivalence does not detect group isomorphism. -/
theorem eg_plain_tensor_insufficient {Grp : Type}
    {plainTensorEquiv groupIso : Grp → Grp → Prop}
    (w : PlainTensorCounterexample Grp plainTensorEquiv groupIso) :
    ¬ ∀ x y, plainTensorEquiv x y ↔ groupIso x y := by
  intro h
  exact w.groups_noniso ((h w.G w.H).1 w.plain_tensor_equiv)

/-- Corollary 3.2 (`preserved_layer_discipline`), conditional form: a candidate relation
whose identifications ride on plain tensor equivalence — an equivalence whose declared
layers omit the symmetric monoidal layer — identifies a pair of systems whose observable
group data differ, and so cannot justify the identification. -/
theorem preserved_layer_discipline {Grp : Type}
    {plainTensorEquiv groupIso : Grp → Grp → Prop}
    (w : PlainTensorCounterexample Grp plainTensorEquiv groupIso)
    (candidate : Grp → Grp → Prop)
    (wit : EquivalenceWitness)
    (h_omit : ¬ DeclaresSymmetric wit)
    (hidentify : ∀ x y, plainTensorEquiv x y → candidate x y) :
    candidate w.G w.H ∧ ¬ groupIso w.G w.H ∧ ¬ DeclaresSymmetric wit :=
  ⟨hidentify _ _ w.plain_tensor_equiv, w.groups_noniso, h_omit⟩

/-! ## Information-geometric distinguishability (§5) -/

/-- Section 5.1: the Fisher form on the simplex, `g_p(a,a) = ∑_i a_i² / p_i`. -/
def fisherForm {n : ℕ} (p a : Fin n → ℚ) : ℚ :=
  ∑ i : Fin n, (a i * a i) / p i

/-- Theorem 5.1 (Chentsov), statement skeleton (unproved; literature): every monotone
Riemannian metric on the simplex is a positive multiple of the Fisher form. The
monotonicity predicate is external to this skeleton and is left as a parameter. -/
def chentsov_fisher_uniqueness {n : ℕ}
    (monotone : ((Fin n → ℚ) → (Fin n → ℚ) → ℚ) → Prop) : Prop :=
  ∀ g : (Fin n → ℚ) → (Fin n → ℚ) → ℚ,
    monotone g → ∃ c : ℚ, 0 < c ∧
      ∀ p a, (∀ i, 0 < p i) → (∑ i, p i = 1) → (∑ i, a i = 0) →
        g p a = c * fisherForm p a

/-- Section 5.2: the summand `A_ij² / (λ_j f(λ_i/λ_j))` of the Morozova–Chentsov
quadratic form. -/
def mcTerm {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ) (A : Fin n → Fin n → ℚ)
    (i j : Fin n) : ℚ :=
  (A i j * A i j) / (lam j * f (lam i / lam j))

/-- Section 5.2: the Morozova–Chentsov quadratic form
`g_f^ρ(A,A) = ∑_{i,j} A_ij² / (λ_j f(λ_i/λ_j))`, with `lam` the eigenvalues of `ρ`. -/
def mcQuadratic {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ) (A : Fin n → Fin n → ℚ) : ℚ :=
  ∑ i : Fin n, ∑ j : Fin n, mcTerm f lam A i j

/-- Normalization of an operator monotone representative: `f(1) = 1`. -/
def NormalizedAtOne (f : ℚ → ℚ) : Prop := f 1 = 1

/-- Petz self-reciprocity on the *positive* domain (the paper's classification
identifies parameter functions on `x > 0` only): `f(x) = x f(x⁻¹)`. -/
def SelfReciprocal (f : ℚ → ℚ) : Prop := ∀ x : ℚ, 0 < x → f x = x * f x⁻¹

/-- The Petz transpose `f^#(x) = x f(x⁻¹)`. -/
def petzTranspose (f : ℚ → ℚ) (x : ℚ) : ℚ := x * f x⁻¹

/-- Theorem 5.2 (`petz_sudar_parametricity`), statement skeleton (unproved; literature):
quantum monotone metrics correspond to operator monotone `f` with `f(1) = 1` and
`f(x) = x f(x⁻¹)` on the positive domain, and distinct such `f` give distinct metrics
on self-adjoint directions at positive eigenvalues. `OperatorMonotone` is a parameter
(predicate on parameter functions) because operator monotonicity is external to this
module. The skeleton requires `n ≥ 2`, positive eigenvalues, and symmetric tangent
directions, and compares parameter functions only through their positive-domain data
(Codex review rounds 1–2). This is an unproved specification, NOT the paper's theorem. -/
def petz_sudar_parametricity {n : ℕ}
    (OperatorMonotone : (ℚ → ℚ) → Prop)
    (monotone : ((Fin n → ℚ) → (Fin n → Fin n → ℚ) → ℚ) → Prop) : Prop :=
  (2 ≤ n) ∧
  (∀ f : ℚ → ℚ, NormalizedAtOne f → SelfReciprocal f → OperatorMonotone f →
      monotone (fun lam A => mcQuadratic f lam A)) ∧
    (∀ m, monotone m → ∃ f : ℚ → ℚ, NormalizedAtOne f ∧ SelfReciprocal f ∧ OperatorMonotone f ∧
      ∀ lam : Fin n → ℚ, ∀ A : Fin n → Fin n → ℚ,
        (∀ i, 0 < lam i) → (∀ i j, A i j = A j i) → (∑ i, A i i = 0) →
        m lam A = mcQuadratic f lam A) ∧
    (∀ f g : ℚ → ℚ, SelfReciprocal f → SelfReciprocal g →
      OperatorMonotone f → OperatorMonotone g → ¬ Set.EqOn f g (Set.Ioi 0) →
      ∃ lam : Fin n → ℚ, ∃ A : Fin n → Fin n → ℚ,
        (∀ i, 0 < lam i) ∧ (∀ i j, A i j = A j i) ∧ (∑ i, A i i = 0) ∧
        mcQuadratic f lam A ≠ mcQuadratic g lam A)

/-- Theorem 5.2, proof ingredient: the Petz transpose `f^#` yields the same quadratic
form as `f` on symmetric (self-adjoint) directions, which is why self-reciprocity
`f = f^#` is the correct normalization. -/
theorem petz_transpose_same_form {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ)
    (hpos : ∀ i, 0 < lam i) (A : Fin n → Fin n → ℚ) (hsymm : ∀ i j, A i j = A j i) :
    mcQuadratic f lam A = mcQuadratic (petzTranspose f) lam A := by
  have key : ∀ i j, mcTerm (petzTranspose f) lam A i j = mcTerm f lam A j i := by
    intro i j
    have hj : lam j ≠ 0 := (hpos j).ne'
    simp only [mcTerm, petzTranspose]
    rw [inv_div, ← mul_assoc, mul_div_cancel₀ _ hj, hsymm i j]
  unfold mcQuadratic
  simp only [key]
  rw [Finset.sum_comm]

/-- Proposition 5.3 (`monotone_commutative_restriction`): for every `f` with `f(1) = 1`
(operator monotonicity is not needed for the computation), the quadratic form restricted
to directions diagonal in an eigenbasis of `ρ` is the classical Fisher form
`∑ A_ii² / λ_i`. -/
theorem monotone_commutative_restriction {n : ℕ} (f : ℚ → ℚ) (hf1 : f 1 = 1)
    (lam : Fin n → ℚ) (hpos : ∀ i, 0 < lam i)
    (A : Fin n → Fin n → ℚ) (hdiag : ∀ i j, i ≠ j → A i j = 0) :
    mcQuadratic f lam A = ∑ i : Fin n, (A i i * A i i) / lam i := by
  unfold mcQuadratic
  apply Finset.sum_congr rfl
  intro i _
  refine (Finset.sum_eq_single i (fun j _ hj => ?_) (fun hi => absurd (Finset.mem_univ i) hi)).trans ?_
  · have : A i j = 0 := hdiag i j (Ne.symm hj)
    simp [mcTerm, this]
  · have hi : lam i / lam i = 1 := div_self (hpos i).ne'
    simp [mcTerm, hi, hf1]

/-- Proposition 5.3 restated: the commutative restriction of any normalized monotone
metric is the Fisher form on the commutative subalgebra generated by `ρ`. -/
theorem commutative_restriction_is_fisher {n : ℕ} (f : ℚ → ℚ) (hf1 : f 1 = 1)
    (lam : Fin n → ℚ) (hpos : ∀ i, 0 < lam i)
    (A : Fin n → Fin n → ℚ) (hdiag : ∀ i j, i ≠ j → A i j = 0) :
    mcQuadratic f lam A = fisherForm lam (fun i => A i i) :=
  (monotone_commutative_restriction f hf1 lam hpos A hdiag).trans (by rfl)

/-! ## Ruler dependence of the metric scale (Example 5.4, Corollary 5.5) -/

/-- The self-reciprocal representative `f(x) = 2x/(1+x)` of Example 5.4. -/
def fRat (x : ℚ) : ℚ := 2 * x / (1 + x)

/-- The self-reciprocal representative `h(x) = (1+x)/2` of Example 5.4. -/
def hRat (x : ℚ) : ℚ := (1 + x) / 2

/-- The state `ρ = diag(3/4, 1/4)` of Example 5.4. -/
def rhoDiag : Fin 2 → ℚ := fun i => if i = 0 then 3/4 else 1/4

/-- The direction `A = σ_x` of Example 5.4. -/
def sigmaX : Fin 2 → Fin 2 → ℚ := fun i j => if i = j then 0 else 1

/-- Example 5.4 (`monotone_not_canonical`): at `ρ = diag(3/4, 1/4)` and `A = σ_x` the
quadratic forms of `f(x) = 2x/(1+x)` and `h(x) = (1+x)/2` are `16/3` and `4`; the two
admissible monotone metrics disagree by the factor `4/3`. -/
theorem monotone_not_canonical :
    mcQuadratic fRat rhoDiag sigmaX = 16/3
      ∧ mcQuadratic hRat rhoDiag sigmaX = 4
      ∧ (16/3 : ℚ) ≠ 4 := by
  refine ⟨?_, ?_, ?_⟩
  · simp only [mcQuadratic, Fin.sum_univ_two]
    norm_num [mcTerm, fRat, hRat, rhoDiag, sigmaX]
  · simp only [mcQuadratic, Fin.sum_univ_two]
    norm_num [mcTerm, fRat, hRat, rhoDiag, sigmaX]
  · norm_num

/-- Corollary 5.5: numerical monotone-metric distance is not a function of the states
alone — the two admissible rulers disagree at the same state and direction. -/
theorem monotone_ruler_dependence :
    mcQuadratic fRat rhoDiag sigmaX ≠ mcQuadratic hRat rhoDiag sigmaX := by
  rw [monotone_not_canonical.1, monotone_not_canonical.2.1]
  norm_num

end Cmrps.Vol10
