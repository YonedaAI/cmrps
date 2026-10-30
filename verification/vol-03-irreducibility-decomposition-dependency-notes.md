# Dependency notes: vol-03-irreducibility-decomposition

**Module:** `lean/Cmrps/Vol03IrreducibilityDecomposition.lean` (namespace `Cmrps.Vol03`)
**Date:** 2026-10-30

## 1. Paper-level dependencies

```
lem:radical (3.1) ──┐
lem:simple-blocks (3.2) ──┤
                          ├─→ thm:block-decomposition (3.3) ─→ cor:classification (3.4)
                          │        │                            ─→ rem:krull-schmidt (3.5)
                          │        ├─→ thm:homs (4.2) ─→ cor:outer-aut (4.3)
                          │        │                 ─→ prop:embeddings (9.1)
                          │        ├─→ prop:module-factorization (4.5)   [independent of 4.2]
                          │        └─→ prop:states-direct-sum (3.7)      [uses only direct-sum form]
prop:construction-arithmetic (8.1) ─→ cor:closure (8.2)
thm:kraus (6.2) ─→ ex:equal-count (6.4)   [prohibition content]
thm:tame-wild (11.1) + thm:wild-generic-det (11.2) ─→ cor:boundary (11.3)
prop:ensemble (5.2), prop:unique-restricted (5.1): independent of the block theory
thm:stinespring (6.1), thm:gelfand-naimark (7.1), thm:dr-reconstruction (7.2):
  cited literature; no volume result depends on them except by comparison
```

No formalized statement of this module depends on another module of the series:
`Cmrps.Vol03` imports Mathlib only and is self-contained. If Vol. 01/02 later define
overlapping combinatorics (multisets of sizes, closure), the assembler may ask for a
shared refactoring; nothing here requires it.

## 2. Lean lemma dependencies (Mathlib, pinned rev `56a005855ea17e0b0958f73ec801ae140b0a1679`)

| Lean claim | Mathlib lemmas used |
|---|---|
| `finrank_blockAlg` | `Module.finrank_pi_fintype`, `Module.finrank_matrix`, `Fintype.card_fin`, `Module.finrank_self`, `pow_two` |
| `starBlock_involutive` | `Matrix.conjTranspose_conjTranspose` (via `simp`) |
| `starBlock_mul` | `Matrix.conjTranspose_mul`, pi-type `Mul` |
| `dimVector_perm_invariant` | `Multiset.map_map`, `Finset.map_val`, `Finset.map_univ_equiv` |
| `dimVector_sum_elim` | `Finset.univ_disjSum_univ`, `Finset.val_disjSum`, `Multiset.disjSum` (def), `Multiset.map_add`, `Multiset.map_map` |
| `dimVector_prod` | `Finset.mem_product`, `Multiset.product` (def), `Multiset.map_bind`, `Multiset.bind_map`, `Multiset.map_map`, `Function.comp` |
| `finrank_tensor_blocks` | `Module.finrank_tensorProduct`, `Module.finrank_matrix`, `pow_two`, `mul_comm/mul_left_comm` |
| `sum_two_sq_eq_eight` | `norm_num` |
| `ne_eight_of_sq` | `Nat.mul_le_mul`, `omega` |
| `two_two_blocks_ne_tensor_block` | `LinearEquiv.finrank_eq`, `finrank_blockAlg`, `Fin.sum_univ_two`, `Fin.sum_univ_one`, `ne_eight_of_sq` |
| `rankMatrix_colSum` | definitional (`MultiplicityMatrix.column_sum`) |
| `multiplicity_example_44`, `multiplicity_col_sum_one/two` | `omega`, `Prod.mk.injEq` |
| `multiplicity_diagonal_unique` | `omega` |
| `blockPerm`, `mem_blockPerm` | `Subgroup` constructor, `Equiv.Perm` application, `Equiv.apply_symm_apply` (via `simpa`) |
| `mem_sizeSemigroup_of_mem` | `Submonoid.subset_closure` |
| `one_mem_sizeSemigroup` | `Submonoid.one_mem` |
| `mul_mem_sizeSemigroup` | `mul_mem` (exported `MulMemClass.mul_mem`) |
| `closedVectors_add` | `Multiset.mem_add` |
| `closedVectors_pairwiseProd` | `Multiset.mem_bind`, `Multiset.mem_map`, `mul_mem` |
| `closedVectors_singleton` | `Multiset.mem_singleton` |
| `mem_sizeSemigroup_one_two` | `Submonoid.closure_induction`, `pow_mem`, `pow_add` |
| `two_pow_ne_three` | `Nat.two_pow_pos`, `omega`, `ring` |
| `three_not_mem_sizeSemigroup_one_two` | `mem_sizeSemigroup_one_two`, `two_pow_ne_three` |

Internal dependencies inside the module:
`two_two_blocks_ne_tensor_block` ← `finrank_blockAlg`, `sum_two_sq_eq_eight`, `ne_eight_of_sq`;
`three_not_mem_sizeSemigroup_one_two` ← `mem_sizeSemigroup_one_two`, `two_pow_ne_three`;
all other claims are independent of each other (only of the module's definitions).

## 3. Mathlib imports used

`Mathlib.Basic.Complex.Basic`, `Mathlib.LinearAlgebra.Dimension.Constructions`,
`Mathlib.LinearAlgebra.TensorProduct.Basic`, `Mathlib.LinearAlgebra.Matrix.ConjTranspose`,
`Mathlib.Algebra.Group.Submonoid.Basic`, `Mathlib.Algebra.Group.Submonoid.Membership`,
`Mathlib.GroupTheory.Perm.Basic`, `Mathlib.Data.Fintype.Sum`.
No other module of `lean/Cmrps/` is imported. No Mathlib result is re-proved.

## 4. Build and verification status

- The module was elaborated standalone with `lake env lean Cmrps/Vol03IrreducibilityDecomposition.lean`
  against the pinned Mathlib checkout at `56a005855ea17e0b0958f73ec801ae140b0a1679`
  (Lean `v4.35.0`). This is elaboration only: `lake build` and `lake exe cache get`
  were NOT run and no build artifact was written — the assembler owns the build.
- Elaboration result: **0 errors, 0 warnings**; no `sorry`, `axiom`, or `native_decide`
  in the module.
- Every claim labeled `machine-checked-pending-build` was accepted by the kernel
  during that elaboration. The assembler must still promote the labels after its
  consolidated `lake build` exits 0, and demote anything that fails there.

## 5. Honesty notes

- Targets 1–3 (abstract block decomposition and the complete-invariant corollary) are
  NOT machine-checked at their abstract strength; only the concrete model `BlockAlg`
  and its dimension/permutation arithmetic is. The gap is the C*-structure layer,
  absent from Mathlib at the pinned rev (see `vol-03-irreducibility-decomposition-conjectures.md` M-1..M-2).
- The unitary-conjugacy bijection of target 4 is NOT machine-checked; the
  multiplicity-matrix data layer and the three table counts (2, 1, 6) are.
- `dimVector_prod` and `finrank_tensor_blocks` mechanize the *arithmetic* of the
  tensor block; the `*`-isomorphism `M_n ⊗ M_m ≅ M_{nm}` itself is not built
  (M-5 in the conjecture file).
- The completeness half of `cor:closure` (realization of every admissible multiset)
  is not mechanized (M-6); the soundness half and the qubit example are.
