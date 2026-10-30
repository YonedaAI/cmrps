/-
Vol. 04 — The Yoneda Classification Principle.
Formalization of `verification/vol-04-yoneda-classification-lean-targets.md`
against `papers/latex/vol-04-yoneda-classification.tex`.

Names mirror the paper: `relationalProfile` (Definition 2.2),
`RelationalEquivalence` (Definition 2.4), `Invariant`/`FiniteVarietyType`
(Definition 3.8), `yoneda_nat_iso` (Theorem 3.1), `yoneda_fully_faithful`
(Corollary 3.2), `relational_characterization` (Corollary 3.4),
`profile_restriction_gap` (Proposition 3.6), `profile_limit_preservation`
(Proposition 3.7), `choi_correspondence`/`choi_composition` (Proposition 4.1
and Equation (1)).
-/

import Mathlib.CategoryTheory.Discrete.Basic
import Mathlib.CategoryTheory.Limits.Preserves.Shapes.BinaryProducts
import Mathlib.CategoryTheory.Limits.Preserves.Shapes.Terminal
import Mathlib.CategoryTheory.Limits.Shapes.BinaryProducts.BinaryProducts
import Mathlib.CategoryTheory.Limits.Shapes.Terminal
import Mathlib.CategoryTheory.Limits.Yoneda
import Mathlib.CategoryTheory.Types.Basic
import Mathlib.CategoryTheory.Whiskering
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Basic.Complex.Basic
import Mathlib.Data.Matrix.Basis
import Mathlib.Data.Matrix.Diagonal
import Mathlib.LinearAlgebra.Matrix.Trace

universe u v t w

namespace Cmrps.Vol04

open CategoryTheory Opposite CategoryTheory.Limits

/-! ## Relational profiles (paper Definition 2.2) -/

section Profiles

variable {C : Type u} [Category.{v} C]

/-- Paper Definition 2.2: the relational profile of `P` is the presheaf
`y(P) = Hom(-, P)` of admissible relationships with every probe. -/
def relationalProfile (P : C) : Cᵒᵖ ⥤ Type v :=
  CategoryTheory.yoneda.obj P

/-- Paper Definition 2.2 (restricted probe class): the `R`-restricted profile of `P`
along a probe class realized by a functor `ι : S ⥤ C`. -/
def restrictedProfile {S : Type*} [Category S] (ι : S ⥤ C) (P : C) : Sᵒᵖ ⥤ Type v :=
  ι.op ⋙ CategoryTheory.yoneda.obj P

/-- The restricted Yoneda comparison `y_R : C ⥤ [R^op, Set]` of Proposition 3.6. -/
def restrictedYoneda {S : Type*} [Category S] (ι : S ⥤ C) : C ⥤ (Sᵒᵖ ⥤ Type v) :=
  CategoryTheory.yoneda ⋙ (Functor.whiskeringLeft Sᵒᵖ Cᵒᵖ (Type v)).obj ι.op

theorem restrictedProfile_eq_obj {S : Type*} [Category S] (ι : S ⥤ C) (P : C) :
    (restrictedYoneda ι).obj P = restrictedProfile ι P :=
  rfl

/-- Paper Definition 2.4: relational equivalence `P ~_rel Q`, i.e. `y(P) ≅ y(Q)`
as presheaves on the declared category. -/
def RelationalEquivalence (P Q : C) : Prop :=
  Nonempty (relationalProfile P ≅ relationalProfile Q)

/-- Paper Definition 2.4: `R`-restricted relational equivalence. -/
def RestrictedRelationalEquivalence {S : Type*} [Category S] (ι : S ⥤ C) (P Q : C) : Prop :=
  Nonempty (restrictedProfile ι P ≅ restrictedProfile ι Q)

end Profiles

/-! ## Determination and classification (paper Definition 3.8) -/

section Classification

variable {C : Type u} [Category.{v} C]

/-- Paper Definition 3.8: an invariant is a map on objects constant on isomorphism
classes. -/
structure Invariant (S : Type*) where
  /-- The value of the invariant on an object. -/
  toFun : C → S
  /-- The invariant is constant on isomorphism classes. -/
  iso_const : ∀ {P Q : C}, (P ≅ Q) → toFun P = toFun Q

/-- Paper Definition 3.8: the invariant `I` classifies `C` up to isomorphism when
`I(P) = I(Q)` implies `P ≅ Q`. -/
def Invariant.Classifies {S : Type*} (I : Invariant (C := C) S) : Prop :=
  ∀ P Q : C, I.toFun P = I.toFun Q → Nonempty (P ≅ Q)

/-- Paper Definition 3.8: `S` is of finite-variety type over `k` when it is the set
of `k`-points of an affine variety of finite type (a common zero locus in `k^n`). -/
def FiniteVarietyType (k : Type*) [Field k] (S : Type*) : Prop :=
  ∃ (n : ℕ) (p : Finset (MvPolynomial (Fin n) k)),
    Nonempty (S ≃ {x : Fin n → k // ∀ f ∈ p, MvPolynomial.eval x f = 0})

/-- Paper Definition 3.8: a classifying invariant of finite-variety type. -/
def ClassifyingInvariantOfFiniteVarietyType (k : Type*) [Field k] (S : Type*)
    (I : Invariant (C := C) S) : Prop :=
  I.Classifies ∧ FiniteVarietyType k S

/-- Paper Definition 3.8: `C` is parametrized by a finite-dimensional variety over `k`
when a classifying invariant of finite-variety type exists. -/
def ParametrizedByFiniteVariety (k : Type*) [Field k] : Prop :=
  ∃ (S : Type v) (I : Invariant (C := C) S), I.Classifies ∧ FiniteVarietyType k S

end Classification

/-! ## Relational characterization (paper Theorem 3.1, Corollaries 3.2, 3.4) -/

section YonedaCore

variable {C : Type u} [Category.{v} C]

/-- Paper Theorem 3.1 (Yoneda lemma): the evaluation map
`Nat(Hom(-, A), F) → F(A)`, `α ↦ α_A(id_A)`, is a bijection. -/
def yoneda_nat_iso (A : C) (F : Cᵒᵖ ⥤ Type v) :
    (relationalProfile A ⟶ F) ≃ F.obj (op A) :=
  CategoryTheory.yonedaEquiv

theorem yoneda_nat_iso_apply (A : C) (F : Cᵒᵖ ⥤ Type v) (α : relationalProfile A ⟶ F) :
    yoneda_nat_iso A F α = α.app (op A) (𝟙 A) :=
  rfl

/-- Paper Corollary 3.2: `Hom(A, B) → Nat(y(A), y(B))`, `φ ↦ (g ↦ φ ∘ g)`, is a bijection. -/
def yoneda_fully_faithful (A B : C) :
    (A ⟶ B) ≃ (relationalProfile A ⟶ relationalProfile B) :=
  (CategoryTheory.yonedaEquiv (X := A) (F := relationalProfile B)).symm

theorem yoneda_fully_faithful_apply {A B : C} (φ : A ⟶ B) (R : C) (g : R ⟶ A) :
    (yoneda_fully_faithful A B φ).app (op R) g = g ≫ φ :=
  rfl

/-- Paper Corollary 3.2: `y(A) ≅ y(B)` if and only if `A ≅ B`. -/
theorem yoneda_reflects_iso (A B : C) :
    Nonempty (relationalProfile A ≅ relationalProfile B) ↔ Nonempty (A ≅ B) :=
  ⟨fun ⟨e⟩ => ⟨CategoryTheory.Yoneda.fullyFaithful.preimageIso e⟩,
    fun ⟨e⟩ => ⟨CategoryTheory.yoneda.mapIso e⟩⟩

/-- Paper Corollary 3.4: relational equivalence coincides with isomorphism in the
declared category. -/
theorem relational_characterization (P Q : C) :
    RelationalEquivalence P Q ↔ Nonempty (P ≅ Q) :=
  yoneda_reflects_iso P Q

/-- Paper Corollary 3.2 applied to the restricted comparison: if `y_R` is fully
faithful then `R`-relationally equivalent objects are isomorphic
(second half of Proposition 3.6). -/
theorem restricted_faithful_separates {S : Type*} [Category S] {ι : S ⥤ C}
    (h : (restrictedYoneda ι).FullyFaithful) (P Q : C)
    (e : RestrictedRelationalEquivalence ι P Q) : Nonempty (P ≅ Q) :=
  Nonempty.elim e fun e => ⟨h.preimageIso e⟩

end YonedaCore

/-! ## What restriction loses (paper Proposition 3.6) -/

section RestrictionGap

/-- Two morphisms out of an empty type are equal (hom-sets of `Type` are wrapped
in `TypeCat.Hom`, so plain `funext` does not apply). -/
private theorem eq_of_isEmpty_hom {α β : Type w} [IsEmpty α] (f g : α ⟶ β) : f = g := by
  apply TypeCat.Hom.ext
  apply TypeCat.Fun.ext
  funext x
  exact isEmptyElim x

/-- The unique isomorphism between two empty types. -/
private def emptyTypeIso {α β : Type w} [IsEmpty α] [IsEmpty β] : α ≅ β where
  hom := TypeCat.ofHom fun x => isEmptyElim x
  inv := TypeCat.ofHom fun y => isEmptyElim y
  hom_inv_id := eq_of_isEmpty_hom _ _
  inv_hom_id := eq_of_isEmpty_hom _ _

/-- Probe inclusion for the gap witness of Proposition 3.6: the single probe `2`
among three pairwise non-isomorphic objects. -/
def gapProbe : Discrete (Fin 1) ⥤ Discrete (Fin 3) :=
  Discrete.functor fun _ => Discrete.mk 2

/-- The two empty hom-types of the gap witness. -/
private def gapHom0 : Type := (Discrete.mk 2 : Discrete (Fin 3)) ⟶ Discrete.mk 0
private def gapHom1 : Type := (Discrete.mk 2 : Discrete (Fin 3)) ⟶ Discrete.mk 1

instance : IsEmpty gapHom0 :=
  ⟨fun f => absurd (Discrete.eq_of_hom f) (by decide)⟩

instance : IsEmpty gapHom1 :=
  ⟨fun f => absurd (Discrete.eq_of_hom f) (by decide)⟩

/-- Paper Proposition 3.6, first half: restricted profiles can agree on
non-isomorphic objects — restricting the probe class destroys separation. -/
theorem profile_restriction_gap :
    RestrictedRelationalEquivalence gapProbe (Discrete.mk 0) (Discrete.mk 1) ∧
      ¬ Nonempty ((Discrete.mk 0 : Discrete (Fin 3)) ≅ Discrete.mk 1) := by
  constructor
  · refine ⟨NatIso.ofComponents
      (fun _ => emptyTypeIso (α := gapHom0) (β := gapHom1)) ?_⟩
    intros
    exact eq_of_isEmpty_hom (α := gapHom0) (β := gapHom1) _ _
  · intro h
    exact absurd (Discrete.eq_of_hom (α := Fin 3) h.some.hom) (by decide)

end RestrictionGap

/-! ## Profiles respect limits (paper Proposition 3.7) -/

section Limits

variable {C : Type u} [Category.{v} C]

/-- Paper Proposition 3.7 (representable form): `y(P) = Hom(-, P)` preserves limits
that exist in `C`. The paper's proposition is about the Yoneda *embedding*; see
`yoneda_embedding_preserves_limits` below, which is the statement of Proposition 3.7. -/
theorem profile_limit_preservation (P : C) :
    PreservesLimitsOfSize.{t, w} (relationalProfile P) :=
  CategoryTheory.yoneda_preservesLimits P

/-- Paper Proposition 3.7 (functor form): the Yoneda embedding
`y : C ⥤ (Cᵒᵖ ⥤ Type v)` preserves limits that exist in `C`. -/
theorem yoneda_embedding_preserves_limits :
    PreservesLimitsOfSize.{t, w} (CategoryTheory.yoneda : C ⥤ Cᵒᵖ ⥤ Type v) :=
  CategoryTheory.yonedaFunctor_preservesLimits

/-- Paper Proposition 3.7: `y(A ⨯ B) ≅ y(A) ⨯ y(B)` whenever the product exists. -/
noncomputable def profile_prod_iso (A B : C) [HasBinaryProduct A B] :
    relationalProfile (A ⨯ B) ≅ relationalProfile A ⨯ relationalProfile B :=
  PreservesLimitPair.iso CategoryTheory.yoneda A B

/-- Paper Proposition 3.7: `y` preserves terminal objects. -/
noncomputable def profile_terminal_iso [HasTerminal C] :
    relationalProfile (⊤_ C) ≅ ⊤_ (Cᵒᵖ ⥤ Type v) :=
  PreservesTerminal.iso (G := CategoryTheory.yoneda (C := C))

end Limits

/-! ## Choi correspondence (paper Proposition 4.1 and Equation (1)) -/

section Choi

open Matrix

/-- `M_n`, the `n × n` complex matrices (paper: `M_n`). -/
abbrev M (n : ℕ) := Matrix (Fin n) (Fin n) ℂ

/-- The Choi matrix of a linear map `Φ : M_n → M_m` (paper: `J(Φ) = Σ E_ij ⊗ Φ(E_ij)`,
whose entries are `J(Φ)_{(i,α),(j,β)} = Φ(E_ij)_{αβ}`). -/
def choiMatrix {n m : ℕ} (Φ : M n →ₗ[ℂ] M m) : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ :=
  fun x y => Φ (Matrix.single x.1 y.1 1) x.2 y.2

/-- Pointwise matrix arithmetic, stated entrywise so tactics need not unfold
the (semi-reducible) matrix type. -/
private theorem add_entry {n : ℕ} (X Y : M n) (i j : Fin n) :
    (X + Y) i j = X i j + Y i j :=
  rfl

private theorem smul_entry {n : ℕ} (c : ℂ) (X : M n) (i j : Fin n) :
    (c • X) i j = c * X i j :=
  rfl

/-- Additivity of the inverse Choi assignment on entries. -/
private theorem ofChoi_add {n m : ℕ} (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ)
    (X Y : M n) :
    (fun α β => ∑ i : Fin n, ∑ j : Fin n, (X + Y) i j * J (i, α) (j, β)) =
      (fun α β => ∑ i : Fin n, ∑ j : Fin n, X i j * J (i, α) (j, β)) +
        (fun α β => ∑ i : Fin n, ∑ j : Fin n, Y i j * J (i, α) (j, β)) := by
  apply Matrix.ext
  intro α β
  simp only [add_entry, add_mul, Finset.sum_add_distrib, Pi.add_apply]

/-- Homogeneity of the inverse Choi assignment on entries. -/
private theorem ofChoi_smul {n m : ℕ} (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ)
    (c : ℂ) (X : M n) :
    (fun α β => ∑ i : Fin n, ∑ j : Fin n, (c • X) i j * J (i, α) (j, β)) =
      c • (fun α β => ∑ i : Fin n, ∑ j : Fin n, X i j * J (i, α) (j, β)) := by
  apply Matrix.ext
  intro α β
  simp only [smul_entry, mul_assoc, Finset.mul_sum, Pi.smul_apply, smul_eq_mul]

/-- Inverse of the Choi assignment: `J ↦ (X ↦ (α, β) ↦ Σ_{i,j} X_{ij} J_{(i,α),(j,β)})`. -/
def ofChoi {n m : ℕ} (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ) : M n →ₗ[ℂ] M m where
  toFun X := fun α β => ∑ i : Fin n, ∑ j : Fin n, X i j * J (i, α) (j, β)
  map_add' := ofChoi_add J
  map_smul' := ofChoi_smul J

/-- Every matrix is the linear combination `X = Σ_{i,j} X_{ij} • E_{ij}` of matrix units. -/
theorem sum_single_smul {n : ℕ} (X : M n) :
    X = ∑ i : Fin n, ∑ j : Fin n, X i j • Matrix.single i j (1 : ℂ) := by
  simpa only [Matrix.smul_single, smul_eq_mul, mul_one] using Matrix.matrix_eq_sum_single X

/-- Applying a linear map to `Y` expands entrywise along the matrix units. -/
theorem map_eq_sum_single {n p : ℕ} (Ψ : M n →ₗ[ℂ] M p) (Y : M n) (α β) :
    Ψ Y α β = ∑ i : Fin n, ∑ j : Fin n, Y i j * Ψ (Matrix.single i j 1) α β := by
  conv_lhs => rw [sum_single_smul Y]
  simp only [map_sum, Matrix.sum_apply, map_smul, smul_entry]

/-- Paper Proposition 4.1: `Φ ↦ J(Φ)` is a linear bijection `L(M_n, M_m) ≃ M_n ⊗ M_m`. -/
def choi_correspondence {n m : ℕ} :
    (M n →ₗ[ℂ] M m) ≃ₗ[ℂ] Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ where
  toFun := choiMatrix
  invFun := ofChoi
  map_add' Φ Ψ := by
    apply Matrix.ext
    intro x y
    rfl
  map_smul' c Φ := by
    apply Matrix.ext
    intro x y
    rfl
  left_inv Φ := by
    apply LinearMap.ext
    intro X
    apply Matrix.ext
    intro α β
    exact (map_eq_sum_single Φ X α β).symm
  right_inv J := by
    apply Matrix.ext
    intro x y
    show ∑ i : Fin n, ∑ j : Fin n, (Matrix.single x.1 y.1 1) i j * J (i, x.2) (j, y.2) = J x y
    rw [Finset.sum_eq_single x.1]
    · rw [Finset.sum_eq_single y.1]
      · simp
      · intro l _ hl
        rw [Matrix.single_apply_of_ne x.1 y.1 1 x.1 l (fun h => hl h.2.symm), zero_mul]
      · simp
    · intro k _ hk
      refine Finset.sum_eq_zero fun l _ => ?_
      rw [Matrix.single_apply_of_ne x.1 y.1 1 k l (fun h => hk h.1.symm), zero_mul]
    · simp

/-- Composition of channels is a double contraction of Choi indices along the shared
system (paper Equation (1)). -/
theorem choi_composition {n m p : ℕ} (Φ : M n →ₗ[ℂ] M m) (Ψ : M m →ₗ[ℂ] M p) :
    choiMatrix (Ψ.comp Φ) = fun x y =>
      ∑ k : Fin m, ∑ l : Fin m,
        choiMatrix Φ (x.1, k) (y.1, l) * choiMatrix Ψ (k, x.2) (l, y.2) := by
  apply Matrix.ext
  intro x y
  exact map_eq_sum_single Ψ (Φ (Matrix.single x.1 y.1 1)) x.2 y.2

/-- Partial trace over the output factor: `(Tr_m J)_{ij} = Σ_α J_{(i,α),(j,α)}`. -/
def partialTrace {n m : ℕ} (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ) : M n :=
  fun i j => ∑ α : Fin m, J (i, α) (j, α)

/-- The matrix unit `E_{ij}` has trace `(1 : M n) i j`. -/
private theorem trace_single {n : ℕ} (i j : Fin n) :
    Matrix.trace (Matrix.single i j (1 : ℂ)) = (1 : M n) i j := by
  show (∑ k : Fin n, (Matrix.single i j 1) k k) = (1 : M n) i j
  rw [Finset.sum_eq_single i]
  · by_cases h : i = j
    · subst h
      simp
    · have h2 : ¬(j = i) := fun w => h w.symm
      simp [h, h2]
  · intro k _ hk
    exact Matrix.single_apply_of_ne i j 1 k k (fun h => hk h.1.symm)
  · simp

/-- Paper Proposition 4.1: `Φ` is trace preserving if and only if `Tr_m J(Φ) = I_n`. -/
theorem choi_trace_preserving {n m : ℕ} (Φ : M n →ₗ[ℂ] M m) :
    (∀ X : M n, Matrix.trace (Φ X) = Matrix.trace X) ↔
      partialTrace (choiMatrix Φ) = 1 := by
  have e1 : ∀ i j : Fin n,
      partialTrace (choiMatrix Φ) i j = Matrix.trace (Φ (Matrix.single i j 1)) := by
    intro i j
    show (∑ α : Fin m, choiMatrix Φ (i, α) (j, α)) = ∑ k : Fin m, Φ (Matrix.single i j 1) k k
    simp only [choiMatrix]
  constructor
  · intro h
    apply Matrix.ext
    intro i j
    rw [e1 i j, h, trace_single]
  · intro h X
    have key : ∀ i j : Fin n, Matrix.trace (Φ (Matrix.single i j 1)) = (1 : M n) i j := by
      intro i j
      rw [← e1 i j, h]
    have step1 : Φ X = ∑ i : Fin n, ∑ j : Fin n, X i j • Φ (Matrix.single i j 1) := by
      conv_lhs => rw [sum_single_smul X]
      simp only [map_sum, map_smul]
    calc Matrix.trace (Φ X)
        = Matrix.trace (∑ i : Fin n, ∑ j : Fin n, X i j • Φ (Matrix.single i j 1)) := by
          rw [step1]
      _ = ∑ i : Fin n, ∑ j : Fin n, Matrix.trace (X i j • Φ (Matrix.single i j 1)) := by
          simp only [Matrix.trace_sum]
      _ = ∑ i : Fin n, ∑ j : Fin n, X i j * Matrix.trace (Φ (Matrix.single i j 1)) := by
          simp only [Matrix.trace_smul, smul_eq_mul]
      _ = ∑ i : Fin n, ∑ j : Fin n, X i j * (1 : M n) i j := by
          simp only [key]
      _ = ∑ i : Fin n, X i i := by
          apply Finset.sum_congr rfl
          intro i _
          show ∑ j : Fin n, X i j * (1 : M n) i j = X i i
          rw [Finset.sum_eq_single i]
          · rw [Matrix.one_apply]
            simp
          · intro j _ hj
            rw [Matrix.one_apply]
            have hij : ¬(i = j) := fun w => hj w.symm
            simp [hij]
          · simp
      _ = Matrix.trace X := by
          simp only [Matrix.trace, Matrix.diag_apply]

end Choi

end Cmrps.Vol04
