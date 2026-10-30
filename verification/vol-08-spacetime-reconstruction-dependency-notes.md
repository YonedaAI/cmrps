# Dependency notes: vol-08-spacetime-reconstruction

Module: `lean/Cmrps/Vol08SpacetimeReconstruction.lean` (namespace `Cmrps.Vol08`).
Records which paper results depend on which, and which Lean lemmas each theorem
uses. No theorem of this module uses a conjecture (C-1..C-9) as a premise.

## Paper-level dependencies

| Result | Depends on |
|---|---|
| Prop 6.3 (prop:finiteposet) | Order axioms + finiteness only; no geometry |
| Prop 6.4 (prop:distinguish) | Def 2.3 (strict reading of the ladder); self-contained |
| Cor 6.5 (cor:notransfer) | Prop 6.3 + Prop 6.4, contrasted with Thm 6.1 (thm:ladder, cited) |
| Thm 8.1 (thm:cone) | Def 2.6, which is defined through the RT proposal (C-1); conditional framing |
| Prop 8.2 (prop:mmi) | Def 2.5 only (explicit vector computation) |
| Prop 8.4 (prop:mmiform) | Def 2.5 (algebraic rearrangement) |
| Lemma 8.5 (lem:ssaredundant) | Prop 8.4 + subadditivity |
| Lemma 8.6 (lem:witnessclean) | Prop 8.2 + Def 2.5 |
| Cor 9.2 (cor:confactor) | Thm 9.1 (thm:malament, cited) |
| Prop 9.4 (prop:specialization) | Order theory only (up-set topology of P. S. Alexandroff) |
| Cor 7.4 (cor:dimcontrast) | Thm 7.1 (thm:geometrization, cited) + Thm 7.3 (thm:tancer, cited) |
| Prop 4.1 (prop:incomplete) | Flat geometry + fundamental groups; self-contained in paper |

## Lean-level dependencies (module-internal)

| Theorem | Uses |
|---|---|
| `no_increasing_loop` | `lt_trans`, `lt_asymm`, `lt_irrefl` (Mathlib preorder facts), induction on ℕ, `omega` |
| `interval_finite` | `Set.toFinite`, instance `Subtype.finite` |
| `interval_compact` | `interval_finite`, `Set.Finite.isCompact` |
| `antichain_fails_distinguishing` | `Past`/`Future` definitions; `rfl` on empty setOf |
| `ladder_nontransfer_finite_orders` | `antichain_fails_distinguishing`, `Set.toFinite` |
| `correlatedTripleWitness_*` lemmas | definition of `correlatedTripleWitness`, `Set.union_empty_iff`, `Set.singleton_nonempty`, `norm_num`/`linarith` |
| `mmi_independent_of_ssa` | `correlatedTripleWitness_ssa`, `correlatedTripleWitness_mmi_fails` |
| `mmi_iff_information_form` | `Mmi`, `MutualInfo`, `Set.union_assoc`, `linarith` |
| `mmi_iff_tripartite_nonpos` | `mmi_iff_information_form`, `TripartiteInfo`, `linarith` |
| `cmi_factorization` | `CondMutualInfo`, `MutualInfo`, `Set.union_comm`, `Set.union_assoc`, `ring` |
| `ssa_of_subadditive_and_mmi` | `cmi_factorization`, `mmi_iff_information_form`, `linarith` |
| `correlatedTripleWitness_clean` | all `correlatedTripleWitness_*` lemmas |
| `isUpperSet_of_isOpen` | induction on `TopologicalSpace.GenerateOpen`; `isUpperSet_univ`, `IsUpperSet.inter`, `isUpperSet_sUnion` |
| `isOpen_iff_isUpperSet` | `isUpperSet_of_isOpen`, `TopologicalSpace.isOpen_generateFrom_of_mem` |
| `isClosed_iff_isLowerSet` | `isOpen_iff_isUpperSet`, `isUpperSet_compl`, `IsClosed.isOpen_compl` |
| `exists_upperSet_separating` | antisymmetry (`LE.le.antisymm`), `not_and_or`, `le_trans` |
| `closure_singleton_eq_downset` | `closure_minimal`, `subset_closure`, `isClosed_closure`, `isClosed_iff_isLowerSet` |
| `le_iff_mem_closure` | `closure_singleton_eq_downset` |
| `upSetTopology_t0Space` | `exists_upperSet_separating`, `inseparable_iff_forall_isOpen`, `T0Space` |
| `specialization_order_recovery` | the four preceding specialization lemmas |
| `card_thurstonGeometry3` | `Fintype` instance for `ThurstonGeometry3`, `decide` |

## Mathlib imports used

`Mathlib.Order.Defs.PartialOrder`, `Mathlib.Order.Defs.Unbundled`,
`Mathlib.Order.UpperLower.Basic`, `Mathlib.Data.Set.Basic`,
`Mathlib.Data.Set.Insert`, `Mathlib.Data.Set.Finite.Basic`,
`Mathlib.Data.Fintype.EquivFin`, `Mathlib.Data.Fintype.Card`,
`Mathlib.Basic.Finite.Defs`, `Mathlib.Basic.Logic.Basic`,
`Mathlib.Topology.Order`, `Mathlib.Topology.Closure`,
`Mathlib.Topology.Inseparable`, `Mathlib.Topology.Separation.Basic`,
`Mathlib.Topology.Compactness.Compact`, `Mathlib.Tactic.Linarith`,
`Mathlib.Tactic.Ring`, `Mathlib.Tactic.NormNum`.

## Cross-volume dependencies

None. The module imports no other `Cmrps` module and states no cross-volume
claims. Future volumes citing the entropy-vector independence
(`mmi_independent_of_ssa`) should record a DEP entry: from vol-08 to the
consumer, condition "direct" for the vector-level statement; the entropic
qualification stays `complete-informal-proof` and must be declared as a
hypothesis if needed.

## Honest scope notes

- The Lean independence statement is over all set-functions `Set (Fin 3) → ℝ`;
  the paper's statement is over entropic vectors. Independence over the larger
  class implies independence over entropic vectors only together with the fact
  that the witness is entropic (paper Prop 8.2, not formalized).
- `Mmi` in the module is stated for sets `A B C` (unions of regions), matching
  eq:mmi; disjointness of `A B C` is not required by the algebraic statements
  (`mmi_iff_information_form`, `ssa_of_subadditive_and_mmi`), which hold for all
  `A B C`, and is assumed in the paper's reading.
- `specialization_order_recovery` holds for arbitrary partial orders; the
  paper's `Finite` hypothesis is used there only for flavor (Prop 6.3 is where
  finiteness matters).
