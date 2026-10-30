# Dependency notes — vol-04-yoneda-classification

**Module:** `lean/Cmrps/Vol04YonedaClassification.lean`
**Mathlib pin:** `56a005855ea17e0b0958f73ec801ae140b0a1679` (per `lean/lakefile.toml`).

## Build/verification status

- The module was **not** built with `lake build` (assembler's job, per the hard rules).
- It was elaborated standalone with `lake env lean Cmrps/Vol04YonedaClassification.lean`
  against the already-fetched Mathlib oleans, which exits 0 with no errors and no warnings.
  This is single-file elaboration, not a package build; the authoritative gate remains the
  assembler's `lake build`.
- No `sorry`, no axioms beyond Mathlib's, no `native_decide`. All proofs are complete terms.

## Lean imports used (nothing re-proved from Mathlib)

| Mathlib item | Used for |
|---|---|
| `CategoryTheory.yoneda`, `CategoryTheory.yonedaEquiv` | `relationalProfile`, `yoneda_nat_iso` (Theorem 3.1 is exactly `yonedaEquiv`) |
| `CategoryTheory.Yoneda.fullyFaithful`, `Functor.FullyFaithful.preimageIso`, `Functor.mapIso` | `yoneda_reflects_iso`, `relational_characterization` |
| `CategoryTheory.Functor.whiskeringLeft`, `Functor.op` | `restrictedProfile`, `restrictedYoneda` |
| `yoneda_preservesLimits`, `Limits.PreservesLimitPair.iso`, `Limits.PreservesTerminal.iso` | `profile_limit_preservation`, `profile_prod_iso`, `profile_terminal_iso` (Proposition 3.7) |
| `Discrete`, `Discrete.functor`, `Discrete.eq_of_hom` | the Proposition 3.6 gap witness |
| `Matrix.single` (+ `single_apply`, `single_apply_of_ne`), `Matrix.trace` (+ `trace_smul`, `trace_sum`), `Matrix.one_apply`, `Matrix.sum_apply` | Choi block |
| `MvPolynomial.eval` | `FiniteVarietyType` (Definition 3.8) |

Mathlib idiom respected: the Yoneda lemma, full faithfulness, and limit preservation of
representables are Mathlib theorems; this module restates them under the paper's names and
contributes the paper-facing packaging (profiles, relational equivalence, classification
notions) and the Choi computations.

## Paper-result dependencies (as formalized)

- Theorem 3.1 (`yoneda_nat_iso`) depends on nothing else in the paper; formalized as
  `CategoryTheory.yonedaEquiv`.
- Corollary 3.2 (`yoneda_fully_faithful`, `yoneda_reflects_iso`) depends on Theorem 3.1
  (with `F = yoneda.obj B`) and on Mathlib's `Yoneda.fullyFaithful`. In Lean the iso-reflection
  goes through `Yoneda.fullyFaithful.preimageIso` (forward) and `yoneda.mapIso` (backward).
- Corollary 3.4 (`relational_characterization`) is exactly Corollary 3.2's iso-reflection
  repackaged through `RelationalEquivalence`; Lean proof is `yoneda_reflects_iso` itself.
- Proposition 3.6 (`profile_restriction_gap`) is independent of 3.1–3.4; its second half
  (`restricted_faithful_separates`) reuses the `FullyFaithful.preimageIso` argument of
  Corollary 3.2 on the restricted comparison.
- Proposition 3.7 (`profile_limit_preservation`) is independent; in Lean it is Mathlib's
  `yoneda_preservesLimits` / `PreservesLimitPair.iso` / `PreservesTerminal.iso` applied to the
  Yoneda embedding. The paper's pointwise proof (universal property of the limit at each probe)
  is the content of Mathlib's `yoneda_preservesLimit`.
- Theorem 3.9 (C-1) depends on Corollary 3.2 (full faithfulness half, machine-checked) **and**
  on Buchweitz–Leuschke wildness (not formalized). The paper's logic "both statements hold in
  the same category, so the implication fails" is recorded as C-1.
- Proposition 4.1 (`choi_correspondence`, `choi_trace_preserving`) depends on nothing else in
  the paper; the proofs use the matrix-unit expansion `sum_single_smul` and its consequence
  `map_eq_sum_single`, which also feed Equation (1).
- Equation (1) (`choi_composition`) depends on `map_eq_sum_single` only. The paper's worked
  instance (Remark 4.2) is not formalized (numerical check lives in `choi_duality.py`).
- Theorem 4.3 (C-2) depends on Proposition 4.1 as its finite-dimensional hypothesis check;
  the representability lemma itself is a registered input (Wilson–Hefford–Hoffreumon; Hefford–Wilson).
- Theorems 5.1–5.3 (Gelfand, Stone, Doplicher–Roberts) are independent of the Yoneda results
  and are not formalized here; they are the "reconstruction islands" that C-5 seeks to unify.
- Theorem 6.1 (C-3) is independent; Proposition 6.2 (preserved-layer discipline) depends on
  Corollary 3.4 plus C-3. Proposition 6.2's fusion-ring shadow (C-4) is a strictly weaker
  computation (paper says so explicitly) and is computational-evidence only.

## Internal lemma dependencies in the module

| Theorem | Lemmas used |
|---|---|
| `yoneda_nat_iso` | Mathlib `yonedaEquiv` |
| `yoneda_fully_faithful` | Mathlib `yonedaEquiv.symm` |
| `yoneda_reflects_iso` | Mathlib `Yoneda.fullyFaithful.preimageIso`, `yoneda.mapIso` |
| `relational_characterization` | `yoneda_reflects_iso` |
| `restricted_faithful_separates` | `restrictedYoneda`, `FullyFaithful.preimageIso` |
| `profile_restriction_gap` | `gapProbe`, `emptyTypeIso`, `eq_of_isEmpty_hom`, `NatIso.ofComponents` |
| `profile_limit_preservation` | Mathlib `yoneda_preservesLimits` |
| `profile_prod_iso` / `profile_terminal_iso` | Mathlib `PreservesLimitPair.iso` / `PreservesTerminal.iso` + `yonedaFunctor_preservesLimits` |
| `choi_correspondence` | `choiMatrix`, `ofChoi`, `sum_single_smul`, `map_eq_sum_single` |
| `choi_composition` | `map_eq_sum_single` |
| `choi_trace_preserving` | `e1` (entrywise partial-trace identity), `trace_single`, `sum_single_smul`, `map_eq_sum_single`, `key` |

## Honest gaps

- Complete positivity ↔ `J(Φ) ≥ 0` (Proposition 4.1) is left informal: no Lean definition of
  complete positivity for the block maps `id ⊗ Φ` is given (see claim-status).
- `FiniteVarietyType` formalizes the affine finite-type case (zero loci of finitely many
  polynomials in `k^n`); the paper's phrase "finite-dimensional algebraic variety" is read in
  that sense. Non-affine varieties would need a gluing construction not present here.
- The `ObjectSchema` of Definition 2.1 and the preserved-layers discipline of Definition 2.3
  are recorded in the paper as schema/declaration requirements; they are not targets in
  `vol-04-yoneda-classification-lean-targets.md` and are not formalized (their content is
  definitional bookkeeping rather than mathematics to check).
