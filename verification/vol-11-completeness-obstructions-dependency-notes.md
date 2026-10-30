# Dependency notes: vol-11-completeness-obstructions

Paper: Completeness and Obstructions (Part 11). Module:
`lean/Cmrps/Vol11CompletenessObstructions.lean` (namespace `Cmrps.Vol11`).
Two kinds of dependency are recorded: paper results on other paper results /
literature inputs, and Lean lemmas on Lean lemmas.

## Paper-level dependencies

| Result | Depends on |
|---|---|
| Lemma 4.3 (Countable invariants), countable-range clause | Definition 4.1 (complete invariant); pure cardinality (injection classes → value set → ℕ) |
| Lemma 4.3, Borel clause | Definition of Borel reducibility; descriptive set theory (C-1) |
| Theorem 5.2 (Obstruction transport) | Definition 5.1 (isomorphism-injective functor); fully faithful ⇒ isomorphism-injective (C-4); Borel hypotheses for the countable-structures clause (C-2); matrix-pair universality for the wild clause (C-3) |
| Corollary 5.3 (Wild embedding) | Theorem 5.2(2) + wildness theorems (Bekkert-Drozd, Buchweitz-Leuschke, Grevstad-May; C-8) |
| Corollary 5.4 (Operator-algebra consequence) | Lemma 4.3 + McDuff (C-5) + Sasyk-Tørnquist (C-9) |
| Proposition 5.5 (Undecidability transport) | Adyan-Rabin (C-6) via a computable many-one reduction |
| Proposition 5.6 (No finite sporadic list) | McDuff (C-5) for the II₁ sector; classification of four-dimensional maximal model geometries (Hillman/Filipkiewicz) for the geometry sector; the no-family premise (C-11) |
| Proposition 5.7 (Two-regime picture fails) | Unknot recognition status (Hass-Lagarias-Pippenger; Lackenby) + classification of finite simple groups (Solomon) |
| Proposition 5.8 (Plain tensor layer fails) | Etingof-Gelaki isocategorical groups (C-7) |
| Corollary 6.2 (Quantifier restriction) | Theorem 5.2 + Proposition 5.5 |
| Table 4 / Regime assignment | Obstruction register (Section 3) + survey classification theorems; partition consistency checked by `regime_inventory.py` |
| Five proof obligations (Section 7) | Proposition 5.8 (equivalence obligation constrained); Theorem 5.2 (completeness obligation blocked on wild/undecidable sectors); admissibility list unfixed (Remark 2.3) |

## Lean dependency graph (module-internal)

| Declaration | Uses |
|---|---|
| `CompleteInvariant.onClasses` | `Quotient.liftOn'`, `CompleteInvariant.complete` |
| `CountableInvariantImpossibility` | `CompleteInvariant.onClasses`, `Quotient.inductionOn₂'`, `Quotient.sound'`, `Function.Injective.countable` |
| `IsomorphismInjective.classes` | `Quotient.map'`, `IsomorphismInjective.map_rel` |
| `IsomorphismInjective.classes_injective` | `Quotient.inductionOn₂'`, `Quotient.exact'`, `Quotient.sound'`, `IsomorphismInjective.reflect_rel` |
| `ObstructionTransport.pullback` | `IsomorphismInjective.map_rel`, `.reflect_rel`, `CompleteInvariant.complete` |
| `ObstructionTransport.uncountableClasses` | `IsomorphismInjective.classes_injective`, `Function.Injective.countable` |
| `ObstructionTransport.noCountableInvariant` | `ObstructionTransport.pullback` |
| `UndecidabilityTransport` | `DecidableProblem` (definitional unfolding), `Exists`/`Iff` only |
| `FiniteSporadicFails` | `SporadicDecomposition.cover`, `Function.Surjective`, `absurd` |
| `TwoRegimeFails` | `Function.Injective`, three-valued pigeonhole on `Bool` (`cases`/`decide`), constructor discrimination on `Regime` |
| `IsocategoricalEquivalenceFails` | `Coarsens` (definitional) |
| `RegimeAssignment.total/.unique/.every_regime_used` | `RegimeAssignment` (definitional reduction), `cases` on `Regime` |
| `Regime.occupies_exactly_one` | `ExistsUnique.intro` |

## Mathlib dependencies (external)

Imported: `Mathlib.Basic.Countable.Defs`, `Mathlib.Data.Quot` (pinned rev
`56a005855ea17e0b0958f73ec801ae140b0a1679`).

| Mathlib declaration | Used for |
|---|---|
| `Countable` (`Mathlib.Basic.Countable.Defs`) | "takes values in a countable set" |
| `Function.Injective.countable` (same file) | injection into a countable set is countable (do not re-prove) |
| `Quotient.map'`, `Quotient.liftOn'`, `Quotient.exact'`, `Quotient.sound'`, `Quotient.inductionOn₂'` (`Mathlib.Data.Quot`) | class sets, induced class maps, quotient induction |

No cross-volume Lean dependencies: the module is self-contained apart from the
two Mathlib imports above. No `sorry`, no axioms. The external literature
inputs (C-5, C-6, C-7, C-8, C-9, C-10) appear only as hypotheses of
conditional theorems or as text in the conjectures file — never as axioms.

## Formalization gaps carried as conjectures

- C-1: Lemma 4.3 Borel clause (needs standard Borel + Borel reducibility).
- C-2: Theorem 5.2 Borel clause (same gap).
- C-3: Theorem 5.2 wild-embedding clause (needs matrix-pair universality).
- C-4: fully faithful ⇒ isomorphism-injective (needs `CategoryTheory`
  instantiation; the relational surrogate `IsomorphismInjective` is what the
  module's transport theorems consume).
- C-13: the algebraic-family condition of Definition 4.2
  (`FiniteVarietyParametrization` carries exhaustiveness only).
