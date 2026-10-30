# Dependency notes: vol-06-quantum-systems

Module: `lean/Cmrps/Vol06QuantumSystems.lean` (namespace `Cmrps.Vol06`).
This module imports only Mathlib; it depends on no other CMRPS volume, and no
other volume depends on it. The assembler adds `import Cmrps.Vol06QuantumSystems`
to `lean/Cmrps.lean` at build time.

## A. Paper-level dependencies (which results use which)

- Theorem 3.1 (structure of finite-dimensional C*-algebras) is the root of the
  finite-dimensional block: Corollary 3.2, Corollary 3.6, Examples 3.4–3.5,
  Propositions 3.8–3.11, and the channel statements of Section 6 all read their
  block form from it.
- Corollary 3.6 (counting) and Table 2 use only the dimension-vector form of
  Theorem 3.1 (Corollary 3.2).
- Proposition 3.11 (tensor products of block algebras) uses Theorem 3.1 for the
  identification `M_n ⊗ M_m ≅ M_{nm}` and the direct-sum distribution.
- Lemma 6.1 (Choi correspondence) is the root of the channel block: Theorem 6.4
  (Choi-Kraus normal form) uses its complete-positivity half; Theorem 6.6
  (Stinespring) uses Theorem 6.4; Proposition 6.8 (Kraus rank) uses Theorems
  6.4 and 6.6 and the family of Example 6.2 for the negative half;
  Proposition 6.10 (composition) uses only the definition of the Choi matrix.
- Theorem 5.1 (McDuff) is independent of the finite-dimensional block;
  Corollary 5.2 follows from Theorem 5.1 alone. The amenable-factor
  classification (Theorem 4.4) is cited to Murray-von Neumann, Connes and
  Haagerup and does not feed any other paper result beyond the Section 9
  regime table.
- Theorems 7.2 (Doplicher-Roberts) and 7.5 (Deligne) are independent of each
  other and of Sections 3–6; Proposition 7.6 (Etingof-Gelaki) is independent of
  both and is used only for the equivalence discipline (Definition 2.6,
  Remark 7.7).
- Theorem 8.3 (Petz) is independent of all other numbered results;
  Corollary 8.4 and Example 8.5 use it.

## B. Lean-level dependencies (which lemmas each formalized result uses)

Mathlib entry points actually used:

- `Mathlib.Data.List.Basic`, `Mathlib.Data.List.ProdSigma` (`List.product` /
  `×ˢ`, `List.product_cons`, `List.mem_product`, `List.mem_flatMap`,
  `List.mem_map`, `List.mem_singleton`).
- `Mathlib.Data.List.Perm.Basic` and `Mathlib.Data.List.Sort`
  (`List.Perm.map`, `List.Perm.product`, `List.Perm.refl`, `List.Perm.length_eq`,
  `List.Perm.eq_of_pairwise'`).
- `Mathlib.Data.List.OfFn` (`List.map_ofFn`) and
  `Mathlib.Algebra.BigOperators.Fin` (`Fin.sum_ofFn`).
- `Mathlib.Algebra.BigOperators.Ring.List` (`List.sum_map_mul_left`).
- `Mathlib.Data.Matrix.Basic` (`Matrix.of`, `Matrix.ext_iff`,
  `Matrix.one_apply`) and `Mathlib.LinearAlgebra.Matrix.Trace`
  (`Matrix.trace`, `Matrix.diag_apply`).
- `Mathlib.LinearAlgebra.Dimension.Constructions` (`Module.finrank_pi_fintype`,
  `Module.finrank_matrix`, `Module.finrank_self`).

Per formalized result:

- `sum_map_product`: `List.product_cons`, `List.map_append`, `List.sum_append`,
  `List.map_cons`, `List.sum_cons`, `List.map_map`, `List.sum_map_mul_left`.
- `algebraDim_tensor`: `sum_map_product`, `List.map_map`.
- `tensorDimvec_perm`: `List.Perm.map`, `List.Perm.product`.
- `tensorDimvec_valid`: `List.mem_map`, `List.mem_product`.
- `dimvec_classifies_sorted`: `List.Perm.eq_of_pairwise'` (uses the
  `Std.Antisymm (· ≤ ·)` instance on `ℕ` from `Mathlib.Order.RelClasses`,
  transitively imported).
- `dim4_vector_dimension_not_classifying`: `List.Perm.length_eq`.
- `algebraDim_eq_of_mem_dimVecs`: `List.mem_flatMap`, `List.mem_map`,
  `List.mem_singleton`, `algebraDim_cons`, `Nat.add_sub_cancel'`.
- `dimVectorsOfDim_four/eight/twelve`: kernel evaluation (`decide`) of
  `dimVecs`, which is structural recursion on a fuel argument.
- `finrank_blockAlgebra`: `Module.finrank_pi_fintype`,
  `Module.finrank_matrix`, `Fintype.card_fin`, `Module.finrank_self`.
- `algebraDim_ofFn` / `algebraDim_eq_finrank_ofFn`: `List.map_ofFn`,
  `Fin.sum_ofFn`, `Function.comp_apply`, `Nat.pow_two`, plus
  `finrank_blockAlgebra`.
- `choi_tracePreserving`: `Matrix.ext_iff`, `Matrix.one_apply`,
  `partialTrace₂_choi_apply`, `trace_eq_sum_apply` (`Matrix.trace`,
  `Matrix.diag_apply`).
- `choi_id`: `LinearMap.id_apply`, `choi`, `matrixUnit`.

Internal dependency shape: `algebraDim_cons` ← used by the enumeration
soundness proof; `sum_map_product` ← used only by `algebraDim_tensor`;
`finrank_blockAlgebra` ← used only by `algebraDim_eq_finrank_ofFn`;
`trace_eq_sum_apply` ← used by `partialTrace₂_choi_apply` ← used by
`choi_tracePreserving`. No axiom is declared; there is no `sorry` and no
`Classical` choice beyond what Mathlib lemmas themselves use (`decide` for the
three Table 2 rows needs no choice).

## C. Name reconciliation (paper ↔ Lean)

| Paper | Lean identifier |
|---|---|
| Definition 2.4 (`dimvec`) | `DimensionVector`, `ValidDimvec`, `algebraDim` |
| Definition 2.3 (observable algebra, block form) | `BlockAlgebra` |
| Corollary 3.2 (`dim A = Σ n_i²`) | `finrank_blockAlgebra`, `algebraDim_ofFn` |
| Theorem 3.1 / Corollary 3.2 (classification) | `dimvec_classifies_sorted` (combinatorial half only) |
| Corollary 3.6 / Table 2 | `dimVecs`, `dimVectorsOfDim`, `dimVectorsOfDim_four/eight/twelve`, `algebraDim_eq_of_mem_dimVecs` |
| Example 3.4 | `dim4_vector_dimension_not_classifying` |
| Proposition 3.11 | `tensorDimvec`, `algebraDim_tensor`, `tensorDimvec_perm` |
| Lemma 6.1 (`J(Φ)`, `Tr_m`) | `choi`, `partialTrace₂`, `choi_tracePreserving` (TP half), `partialTrace₂_choi_apply` |

## D. Build and verification notes

- Hard rule honored: no `lake build` and no `lake exe cache get` was run by
  this agent. The file was elaborated once at write time with a read-only
  single-file check (`lake env lean Cmrps/Vol06QuantumSystems.lean`) against the
  already-fetched Mathlib oleans (pinned rev `56a005855ea17e0b0958f73ec801ae140b0a1679`,
  toolchain `leanprover/lean4:v4.35.0`); it produced zero errors and zero
  warnings and contains no `sorry`. This check is not the build gate: the
  authoritative `lake build` is the assembler's, and all module claims are
  labeled `machine-checked-pending-build` until it exits 0.
- The module uses no `native_decide`, no new `axiom`, and no `Classical` by
  name; the three Table 2 equalities are closed by `decide` on structurally
  recursive enumeration code.
- If the assembler's build or the Codex review flags the module, the likely
  pressure points are: (1) `List.Perm.eq_of_pairwise'` instance synthesis
  (relies on `Std.Antisymm (· ≤ ·)`), (2) `Module.finrank_matrix` /
  `Module.finrank_pi_fintype` signature drift across Mathlib revisions — the
  module is written against the pinned rev above.
