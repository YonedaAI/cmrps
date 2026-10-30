# Dependency notes — vol-10-observational-equivalence

**Module:** lean/Cmrps/Vol10ObservationalEquivalence.lean (namespace `Cmrps.Vol10`).
**Imports:** `Mathlib.Algebra.BigOperators.Group.Finset.Basic`, `Mathlib.Tactic` only.

**Verification note.** The module was elaborated file-locally with `lake env lean` (no
`lake build`, no `lake exe cache get`, no other module touched) and elaborated without
error or warning. Claims remain labelled `machine-checked-pending-build`; the assembler
owns the package build and the promotion to `machine-checked`.

## Paper-level dependencies

| Paper result | Depends on |
|---|---|
| Def. 2.1 (system record) | Stipulation only (series object schema). |
| Defs. 2.2–2.4 (the three relations) | Def. 2.1; Def. 2.4 additionally needs Def. 4.1 (observation functor). |
| Def. 2.5 (admissible candidate relation) | Defs. 2.2–2.4; the family `A` of admissible observation functors is a stipulation. |
| Defs. 2.6–2.7 (equivalence witness, morphism kinds) | Def. 2.1; Table 3 (preserved layers) is data. |
| Thm 3.1 (plain tensor does not recover the group) | Etingof–Gelaki isocategorical construction (arXiv:math/0007196), by reference. |
| Cor. 3.2 (preserved-layer discipline) | Thm 3.1 only. |
| Rem. 3.3 (scope) | Doplicher–Roberts reconstruction (literature). |
| Def. 4.1 (observation functor) | Def. 2.1; proposal of the series corpus, defined in the paper. |
| Prop. 4.2 (induced relation) | Defs. 2.4, 4.1 only; isomorphism in the record category is an equivalence relation. |
| Lemma 4.3 (products of observations) | Def. 4.1; isomorphism in a product category is a pair of isomorphisms. |
| Def. 4.4 (coarse and fine observations) | Def. 4.1; Def. 2.7 for the coarse-graining functor `c`. |
| Prop. 4.5 (coarse records separate less) | Def. 4.4 for the inclusion; the §9.1 four-point witness for strictness (also cross-checked by `observation_quotient.py`). |
| Prop. 4.6 (composed experiments) | Def. 4.1; the product-records hypothesis for the positive direction; the §8.3 bipartite witness (11/32 vs 9/32) for the failure direction. |
| Thm 5.1 (Chentsov) | Literature (Chentsov; applied at Petz–Sudar, arXiv:quant-ph/0102132); Fisher form of §5.1. |
| Thm 5.2 (Petz–Sudar) | Literature (arXiv:quant-ph/0102132); Morozova–Chentsov form of §5.2; self-reciprocity as the normalization that kills the `f ↔ f^#` double count. |
| Prop. 5.3 (commutative restriction) | The quadratic form of §5.2 and `f(1) = 1` only — operator monotonicity is not used in the computation. |
| Ex. 5.4 / Cor. 5.5 | Direct arithmetic at `ρ = diag(3/4,1/4)`, `A = σ_x` (also cross-checked by `monotone_metric_contrast.py`); Cor. 5.5 additionally cites Thm 5.2 for the existence of many rulers. |
| §9.3 (groups of order 8) | Finite computation `invariant_coarseness.py`; a shadow of Thm 3.1, not the theorem. |

## Lean-level dependencies (which declarations each theorem uses)

| Lean theorem | Uses |
|---|---|
| `obs_induced_equivalence` | `obsEquiv`, `ObservationFunctor.recordIso_equiv` (Equivalence.refl/symm/trans). |
| `obs_class_fibers` | `recordClass`, `Quotient.sound`, `Quotient.exact`, `obsEquiv`. |
| `obs_quotient_factor` | `obs_induced_equivalence`, `Quotient.lift`, `Quotient.inductionOn`; the quotient universal property. |
| `obs_products_intersection` | `ObservationFunctor.prod`, `obsEquiv` (definitional: `Iff.rfl`). |
| `obs_coarse_graining_composition` | `Coarsening.factors` pattern (`factors : Fc.obs = h ∘ Ff.obs`), `h_mono`, `obsEquiv`. |
| `obs_coarse_witness` | `Dist4`, `pDist`, `qDist`, `e1Push`, `e2Push`, `SameRecord` (`norm_num` on ℚ). |
| `obs_composed_product_preserved` | `ObservationFunctor.compProd`, `obsEquiv` (structure eta). |
| `obs_composed_experiments_failure` | `obs_coarse_witness.1`, `diagJoint`, `pDist`, `qDist` (`norm_num` on ℚ). |
| `eg_plain_tensor_insufficient` | `PlainTensorCounterexample` (hypothesis data only). |
| `preserved_layer_discipline` | `eg_plain_tensor_insufficient`'s hypothesis package, `EquivalenceWitness`, `DeclaresSymmetric`. |
| `petz_transpose_same_form` | `mcTerm`, `mcQuadratic`, `petzTranspose`; `inv_div`, `mul_div_cancel₀`, `Ne.symm`; `Finset.sum_comm`. |
| `monotone_commutative_restriction` | `mcTerm`, `mcQuadratic`; `Finset.sum_congr`, `Finset.sum_eq_single`, `div_self`, `Ne.symm`. |
| `commutative_restriction_is_fisher` | `monotone_commutative_restriction`, `fisherForm` (`rfl`). |
| `monotone_not_canonical` | `mcQuadratic`, `mcTerm`, `fRat`, `hRat`, `rhoDiag`, `sigmaX`; `Fin.sum_univ_two`, `norm_num`. |
| `monotone_ruler_dependence` | `monotone_not_canonical` (`.1`, `.2.1`), `norm_num`. |

## Cross-volume notes

- Thm 3.1 is the same literature result used by vol-12 (`ObstructionAssembly`'s
  Etingof–Gelaki row, DEP-007 in the series registry). The vol-10 module packages it as
  `PlainTensorCounterexample` hypothesis data; vol-12 records it as a refutation row.
- Thm 5.1 and Thm 5.2 are the same literature pair vol-12 cites in its Thm 7.1 (DEP-008:
  classical uniqueness may not be extended to the quantum case). vol-10 formalizes the
  distinguishing computation (Ex. 5.4: 16/3 vs 4) that vol-12 assumes as the gap witness.
- Registry mapping (series records used as inputs): T-OB-02 = Thm 3.1; T-BG-14 = Thm 5.1;
  T-BG-18 = Thm 5.2. Ontology objects: DEF-002 = Def. 2.1; DEF-015–DEF-018 = Defs.
  2.2–2.6 and Section 3; DEF-042 layer E = Def. 8.1 (empirical layer, not formalized here).
- No other Cmrps module is imported; this module is self-contained apart from Mathlib.
