/-
Copyright (c) 2026 The YonedaAI Collaboration. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.

# Vol. 6 — Classification of Quantum Physical Systems

Mechanization of the tractable targets of
`papers/latex/vol-06-quantum-systems.tex` (Part VI of CMRPS).

Scope note. The paper's Theorem 3.1 classifies finite-dimensional complex
C*-algebras up to *-isomorphism. This module formalizes the *block-size
combinatorics* of that statement — dimension vectors as multisets of positive
integers, their tensor-product law, their counting function, and the concrete
vector-space dimension of a block algebra — plus the entrywise form of the
trace-preserving half of the Choi correspondence (Lemma 6.1). The C*-algebraic
lifting (Jacobson radical vanishing, Artin-Wedderburn, *-isomorphism) and the
operator-algebraic and categorical targets (Stinespring, McDuff,
Doplicher-Roberts, Deligne, Petz) are NOT formalized here; they are recorded in
`verification/vol-06-quantum-systems-claim-status.md` and
`verification/vol-06-quantum-systems-conjectures.md`.

Dimension vectors are represented by `List ℕ` up to `List.Perm`, i.e. as
multisets of block sizes with the order of blocks forgotten.
-/

import Mathlib.Data.List.Basic
import Mathlib.Data.List.ProdSigma
import Mathlib.Data.List.Perm.Basic
import Mathlib.Data.List.Sort
import Mathlib.Data.List.OfFn
import Mathlib.Data.Matrix.Basic
import Mathlib.Algebra.BigOperators.Ring.List
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.Tactic

namespace Cmrps.Vol06

/-! ## Dimension vectors (paper: Definition 2.4) -/

/-- A dimension vector is a multiset of positive block sizes, represented as a
list up to `List.Perm`. Paper: Definition 2.4 (`dimvec`). -/
abbrev DimensionVector : Type := List ℕ

/-- Validity of a dimension vector: every block size is a positive integer.
Paper: Definition 2.4, "each `n_i ≥ 1`". -/
def ValidDimvec (l : DimensionVector) : Prop := ∀ n ∈ l, 0 < n

/-- Complex dimension `Σ n_i²` of the block algebra attached to a dimension
vector. Paper: Corollary 3.2, "`dim A = Σ_i n_i²`". -/
def algebraDim (l : DimensionVector) : ℕ := (l.map fun n => n * n).sum

@[simp]
theorem algebraDim_nil : algebraDim [] = 0 := rfl

@[simp]
theorem algebraDim_cons (n : ℕ) (l : DimensionVector) :
    algebraDim (n :: l) = n * n + algebraDim l := rfl

/-- The dimension vector of a tensor product of block algebras is the multiset
of pairwise products of block sizes. Paper: Proposition 3.11. -/
def tensorDimvec (l₁ l₂ : DimensionVector) : DimensionVector :=
  (l₁ ×ˢ l₂).map fun p => p.1 * p.2

/-- Sum over a product list splits as a product of sums. -/
theorem sum_map_product {α β : Type*} (f : α → ℕ) (g : β → ℕ)
    (l₁ : List α) (l₂ : List β) :
    ((l₁ ×ˢ l₂).map fun p => f p.1 * g p.2).sum = (l₁.map f).sum * (l₂.map g).sum := by
  induction l₁ with
  | nil => simp
  | cons a l₁ ih =>
    have hmap : ((a :: l₁) ×ˢ l₂).map (fun p => f p.1 * g p.2) =
        (l₂.map fun b => f a * g b) ++ ((l₁ ×ˢ l₂).map fun p => f p.1 * g p.2) := by
      simp [List.product_cons]
    rw [hmap, List.sum_append, ih, List.map_cons, List.sum_cons, List.sum_map_mul_left]
    ring

/-- Paper: Proposition 3.11, "`dim(A ⊗ B) = dim A · dim B`" at the level of
block-size combinatorics. -/
theorem algebraDim_tensor (l₁ l₂ : DimensionVector) :
    algebraDim (tensorDimvec l₁ l₂) = algebraDim l₁ * algebraDim l₂ := by
  show (((l₁ ×ˢ l₂).map fun p => p.1 * p.2).map fun n => n * n).sum = _
  rw [List.map_map]
  have key :
      ((fun n => n * n) ∘ fun p : ℕ × ℕ => p.1 * p.2) = fun p => (p.1 * p.1) * (p.2 * p.2) := by
    funext p
    simp [Function.comp]
    ring
  rw [key]
  exact sum_map_product (fun n => n * n) (fun n => n * n) l₁ l₂

/-- Dimension vectors of tensor products are computed without reference to a
presentation: the operation is permutation-invariant. Paper: Proposition 3.11. -/
theorem tensorDimvec_perm {l₁ l₁' l₂ l₂' : DimensionVector}
    (h₁ : List.Perm l₁ l₁') (h₂ : List.Perm l₂ l₂') :
    List.Perm (tensorDimvec l₁ l₂) (tensorDimvec l₁' l₂') :=
  List.Perm.map _ (List.Perm.product h₁ h₂)

theorem tensorDimvec_valid {l₁ l₂ : DimensionVector}
    (h₁ : ValidDimvec l₁) (h₂ : ValidDimvec l₂) :
    ValidDimvec (tensorDimvec l₁ l₂) := by
  intro n hn
  simp only [tensorDimvec, List.mem_map] at hn
  obtain ⟨p, hp, rfl⟩ := hn
  have hp1 : p.1 ∈ l₁ ∧ p.2 ∈ l₂ := List.mem_product.mp hp
  exact Nat.mul_pos (h₁ _ hp1.1) (h₂ _ hp1.2)

/-! ## Classification by dimension vector (paper: Theorem 3.1, Corollary 3.2) -/

/-- A dimension vector is complete data for a block presentation up to order:
two sorted presentations agree as soon as they agree as multisets. This is the
combinatorial content of Theorem 3.1 / Corollary 3.2; the C*-algebraic lifting
to *-isomorphism is not formalized here. -/
theorem dimvec_classifies_sorted {l₁ l₂ : DimensionVector}
    (h₁ : l₁.Pairwise (· ≤ ·)) (h₂ : l₂.Pairwise (· ≤ ·)) :
    List.Perm l₁ l₂ ↔ l₁ = l₂ :=
  ⟨fun h => h.eq_of_pairwise' h₁ h₂, fun h => h ▸ List.Perm.refl _⟩

/-- Vector-space dimension is not a classifying invariant while the dimension
vector is: `[2]` and `[1,1,1,1]` have equal `algebraDim` but are not
permutation-equivalent. Paper: Example 3.4. -/
theorem dim4_vector_dimension_not_classifying :
    algebraDim [2] = algebraDim [1, 1, 1, 1] ∧
      ¬ List.Perm ([2] : DimensionVector) [1, 1, 1, 1] := by
  constructor
  · rfl
  · intro h
    have := List.Perm.length_eq h
    simp at this

/-- Enumeration of the dimension vectors of complex dimension `d`: all
nonincreasing lists of positive integers whose squares sum to `d`. The `fuel`
argument is a structural recursion budget; `dimVectorsOfDim` supplies `d + 1`,
which is enough to reach every list of algebra dimension `d` (each step strictly
decreases `d`). -/
def dimVecs : (fuel d bound : ℕ) → List (List ℕ)
  | 0, _, _ => []
  | _ + 1, 0, _ => [[]]
  | fuel + 1, d + 1, bound =>
      (List.range (bound + 1)).flatMap fun k =>
        if k * k ≤ d + 1 ∧ 1 ≤ k ∧ k ≤ bound then
          ((dimVecs fuel (d + 1 - k * k) k).map fun l => k :: l)
        else []

/-- All dimension vectors of complex dimension `d`, as nonincreasing lists.
Paper: Corollary 3.6 and Table 2. -/
def dimVectorsOfDim (d : ℕ) : List (List ℕ) := dimVecs (d + 1) d d

/-- Soundness of the enumeration: every listed vector has algebra dimension `d`.
Paper: Corollary 3.6. -/
theorem algebraDim_eq_of_mem_dimVecs {fuel d bound : ℕ} {l : DimensionVector}
    (h : l ∈ dimVecs fuel d bound) : algebraDim l = d := by
  induction fuel generalizing d bound l with
  | zero => simp [dimVecs] at h
  | succ fuel ih =>
    match d with
    | 0 =>
      simp only [dimVecs] at h
      rw [List.mem_singleton] at h
      subst h
      rfl
    | d + 1 =>
      simp only [dimVecs] at h
      rw [List.mem_flatMap] at h
      obtain ⟨k, hk, hk'⟩ := h
      split_ifs at hk' with hc
      · rw [List.mem_map] at hk'
        obtain ⟨l', hl', rfl⟩ := hk'
        specialize ih hl'
        rw [algebraDim_cons, ih]
        exact Nat.add_sub_cancel' hc.1
      · simp at hk'

theorem algebraDim_eq_of_mem_dimVectorsOfDim {d : ℕ} {l : DimensionVector}
    (h : l ∈ dimVectorsOfDim d) : algebraDim l = d :=
  algebraDim_eq_of_mem_dimVecs h

/-- Table 2, row `d = 4`: the two algebras of complex dimension 4. -/
theorem dimVectorsOfDim_four :
    dimVectorsOfDim 4 = [[1, 1, 1, 1], [2]] := by decide

/-- Table 2, row `d = 8`. -/
theorem dimVectorsOfDim_eight :
    dimVectorsOfDim 8 = [[1, 1, 1, 1, 1, 1, 1, 1], [2, 1, 1, 1, 1], [2, 2]] := by decide

/-- Table 2, row `d = 12`. -/
theorem dimVectorsOfDim_twelve :
    dimVectorsOfDim 12 =
      [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
       [2, 1, 1, 1, 1, 1, 1, 1, 1],
       [2, 2, 1, 1, 1, 1],
       [2, 2, 2],
       [3, 1, 1, 1]] := by decide

/-! ## Block algebras and their dimension (paper: Definition 2.3, Corollary 3.2) -/

/-- The block algebra of block sizes `s : Fin k → ℕ`: a direct sum of full
matrix algebras, realized as the product of the matrix spaces. Paper:
Definition 2.3 and Theorem 3.1 (block form). -/
abbrev BlockAlgebra {k : ℕ} (s : Fin k → ℕ) : Type :=
  ∀ i : Fin k, Matrix (Fin (s i)) (Fin (s i)) ℂ

/-- The complex dimension of a block algebra is the sum of squares of its block
sizes. Paper: Corollary 3.2, "`dim A = Σ_i n_i²`". -/
theorem finrank_blockAlgebra {k : ℕ} (s : Fin k → ℕ) :
    Module.finrank ℂ (BlockAlgebra s) = ∑ i : Fin k, (s i) ^ 2 := by
  rw [Module.finrank_pi_fintype]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [Module.finrank_matrix, Fintype.card_fin, Module.finrank_self]
  ring

/-- Bridge between the list form and the family form of a dimension vector. -/
theorem algebraDim_ofFn {k : ℕ} (s : Fin k → ℕ) :
    algebraDim (List.ofFn s) = ∑ i : Fin k, (s i) ^ 2 := by
  simp only [algebraDim, List.map_ofFn]
  rw [Fin.sum_ofFn]
  refine Finset.sum_congr rfl fun i _ => ?_
  simp only [Function.comp_apply, Nat.pow_two]

/-- The combinatorial dimension of the list presentation agrees with the
vector-space dimension of the block algebra. -/
theorem algebraDim_eq_finrank_ofFn {k : ℕ} (s : Fin k → ℕ) :
    algebraDim (List.ofFn s) = Module.finrank ℂ (BlockAlgebra s) := by
  rw [algebraDim_ofFn, finrank_blockAlgebra]

/-! ## Choi matrix and trace preservation (paper: Lemma 6.1) -/

/-- Matrix unit `E_{ij}` of `M_n(ℂ)`. -/
def matrixUnit {n : ℕ} (i j : Fin n) : Matrix (Fin n) (Fin n) ℂ :=
  Matrix.of fun a b => if a = i ∧ b = j then 1 else 0

@[simp]
theorem matrixUnit_apply {n : ℕ} (i j a b : Fin n) :
    matrixUnit i j a b = if a = i ∧ b = j then 1 else 0 := rfl

/-- Choi matrix of a linear map `Φ : M_n(ℂ) →ₗ[ℂ] M_m(ℂ)`, with entries
`J(Φ)_{(i,a),(j,b)} = Φ(E_{ij})_{a b}`, i.e. `J(Φ) = Σ_{ij} E_{ij} ⊗ Φ(E_{ij})`.
Paper: Lemma 6.1. -/
def choi {n m : ℕ} (Φ : Matrix (Fin n) (Fin n) ℂ →ₗ[ℂ] Matrix (Fin m) (Fin m) ℂ) :
    Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ :=
  Matrix.of fun x y => Φ (matrixUnit x.1 y.1) x.2 y.2

@[simp]
theorem choi_apply {n m : ℕ}
    (Φ : Matrix (Fin n) (Fin n) ℂ →ₗ[ℂ] Matrix (Fin m) (Fin m) ℂ)
    (x y : Fin n × Fin m) :
    choi Φ x y = Φ (matrixUnit x.1 y.1) x.2 y.2 := rfl

/-- Partial trace over the second tensor factor of a block matrix on
`ℂ^n ⊗ ℂ^m`. Paper: Lemma 6.1, `Tr_m`. -/
def partialTrace₂ {n m : ℕ}
    (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ) : Matrix (Fin n) (Fin n) ℂ :=
  Matrix.of fun i j => ∑ a : Fin m, J (i, a) (j, a)

@[simp]
theorem partialTrace₂_apply {n m : ℕ}
    (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ) (i j : Fin n) :
    partialTrace₂ J i j = ∑ a : Fin m, J (i, a) (j, a) := rfl

theorem trace_eq_sum_apply {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ) :
    Matrix.trace A = ∑ i : Fin n, A i i := by
  simp [Matrix.trace, Matrix.diag_apply]

/-- The partial trace of a Choi matrix along the second factor has entries
`Tr(Φ(E_{ij}))`. -/
theorem partialTrace₂_choi_apply {n m : ℕ}
    (Φ : Matrix (Fin n) (Fin n) ℂ →ₗ[ℂ] Matrix (Fin m) (Fin m) ℂ) (i j : Fin n) :
    partialTrace₂ (choi Φ) i j = Matrix.trace (Φ (matrixUnit i j)) := by
  rw [trace_eq_sum_apply]
  rfl

/-- Trace-preserving half of the Choi correspondence: `Φ` preserves trace on
matrix units exactly when the partial trace of its Choi matrix is the identity,
`Tr_m J(Φ) = I_n`. Paper: Lemma 6.1 (second equivalence). -/
theorem choi_tracePreserving {n m : ℕ}
    (Φ : Matrix (Fin n) (Fin n) ℂ →ₗ[ℂ] Matrix (Fin m) (Fin m) ℂ) :
    partialTrace₂ (choi Φ) = 1 ↔
      ∀ i j : Fin n, Matrix.trace (Φ (matrixUnit i j)) = if i = j then 1 else 0 := by
  rw [← Matrix.ext_iff]
  constructor
  · intro h i j
    specialize h i j
    rw [partialTrace₂_choi_apply, Matrix.one_apply] at h
    exact h
  · intro h i j
    rw [partialTrace₂_choi_apply, Matrix.one_apply]
    exact h i j

/-- Sanity check: the Choi matrix of the identity map has entries
`δ_{a i} δ_{b j}` on composite indices. -/
theorem choi_id {n : ℕ} :
    choi (LinearMap.id : Matrix (Fin n) (Fin n) ℂ →ₗ[ℂ] Matrix (Fin n) (Fin n) ℂ) =
      Matrix.of fun x y => if x.2 = x.1 ∧ y.2 = y.1 then 1 else 0 := by
  ext x y
  simp [choi, matrixUnit, LinearMap.id]

end Cmrps.Vol06
