# Claim status: vol-11-completeness-obstructions

Paper: Completeness and Obstructions (Part 11 of The Classification of Mathematical
Representations of Physical Systems). Module: `lean/Cmrps/Vol11CompletenessObstructions.lean`,
namespace `Cmrps.Vol11`. One row per claim. Labels: `machine-checked`
(written in Lean, awaiting the assembler's `lake build`; promoted to
`machine-checked` only if the kernel accepts and the proof has no `sorry`),
`complete-informal-proof`, `conditional`, `conjecture`, `computational-evidence`,
`open-problem`. `machine-checked` is the module-writer role's
"`machine-checked`": written in Lean, awaiting the assembler's
`lake build`; the assembler promotes it to `machine-checked` only if the kernel
accepts the proof and it contains no `sorry`. Nothing in the module uses `sorry`
or an axiom.

| Name | Statement | Status |
|---|---|---|
| `ParameterKind` | Parameter spaces come in three structured shapes: finite combinatorial, finite-dimensional variety + algebraic family, standard Borel (Def 4.1). | machine-checked |
| `Recognizer` | A recognizer `R` is a boolean procedure with `R x y = true ↔ x ≃ y` (Def 4.1). | complete-informal-proof (algorithmic content of Def 4.1; the formalized `Recognizer` skeleton is machine-checked but classically trivial — arbitrary Boolean function, see module scope note, Codex review round 1) |
| `ParameterSpace` | A parameter space `Π` is a carrier with a structure-compatible surjection onto the `≃`-classes (Def 4.1). | machine-checked |
| `CompleteInvariant` | A complete invariant `ι` satisfies `ι x = ι y ↔ x ≃ y` (Def 4.1). | machine-checked |
| `ClassificationProgram` | A classification program is the triple (ι, Π, R) of complete invariant, structured parameter space, recognizer (Def 4.1). | machine-checked |
| `FiniteVarietyParametrization` | Parametrization = algebraic family over `V(k)` whose fibers exhaust the isomorphism classes (Def 4.2). Formalized: exhaustiveness clause only; the finite-dimensional variety and the algebraic-family condition are recorded as data, not formalized (needs algebraic geometry). The definition's warning (a bare surjection `V(k) → Ob/≅` is not a parametrization) is carried in the docstring. | machine-checked (partial content) |
| `Regime` | Seven-valued regime type: Parameterized, Unparameterized, ObstructionComplete, Open, Wild, Undecidable, DecidableButUnclassified (Def 4.5). | machine-checked |
| `Regime.occupies_exactly_one` | A domain occupies exactly one regime: any assignment `reg : α → Regime` is single-valued (Def 4.5). | machine-checked |
| `CountableInvariantImpossibility` | If the isomorphism classes are uncountable, no complete invariant takes values in a countable set (Lemma 4.3, countable-range clause). | machine-checked |
| Lemma 4.3, Borel clause | If the isomorphism relation is not Borel reducible to isomorphism of countable structures, no complete invariant takes values in a space of countable structures. | complete-informal-proof (paper proof; formalization gap C-1) |
| `IsomorphismInjective` | Relational form of Def 5.1: `F` preserves and reflects the equivalence (isomorphism-injective). | machine-checked |
| `IsomorphismInjective.classes`, `.classes_injective` | An isomorphism-injective map induces an injection `F_*` on isomorphism classes (Thm 5.2). | machine-checked |
| Fully faithful ⇒ isomorphism-injective | Every fully faithful functor is isomorphism-injective (Def 5.1 remark). Categorical instantiation not formalized. | complete-informal-proof (paper remark; formalization gap C-4) |
| `ObstructionTransport.pullback` | A complete invariant for the target restricts along `F` to a complete invariant for the source, same value set (Thm 5.2). | machine-checked |
| `ObstructionTransport.uncountableClasses` | Uncountability of isomorphism classes transports from source to target along an isomorphism-injective map (Thm 5.2(1a)). | machine-checked |
| `ObstructionTransport.noCountableInvariant` | Absence of countable-valued complete invariants transports from source to target (Thm 5.2(1c), set-level clause). | machine-checked |
| Thm 5.2, Borel clause | With standard Borel object spaces and Borel `F`, non-classifiability by countable structures transports. | complete-informal-proof (paper proof; formalization gap C-2) |
| Thm 5.2, wild-embedding clause | A wild embedding (matrix-pair universality) transports composed with `F`; non-parametrization holds for the essential image of the wild module category. | complete-informal-proof (paper proof; formalization gap C-3) |
| `DecidableProblem` | `Q` decidable = `∃ d, ∀ x, d x = true ↔ Q x` (Prop 5.5 setup). | complete-informal-proof (algorithmic decidability of Prop 5.5; the extensional skeleton is machine-checked but classically trivial, see module scope note) |
| `UndecidabilityTransport` | A recognition problem many-one reducible from an undecidable property is undecidable (Prop 5.5). Application is conditional on Adyan-Rabin (taken as hypothesis `hmarkov`). | conditional (named hypotheses: `hmarkov` — Adyan-Rabin; computability of `φ` and of the deciders is NOT formalized — the extensional implication is machine-checked but vacuous as stated, Codex review round 1; paper statement in C-6) |
| `SporadicDecomposition` | Families + finitely many sporadics: every class lies in a family or in a listed finite set (Prop 5.6 setup). | machine-checked |
| `FiniteSporadicFails` | If no family reaches the sector and the sector admits no finite listing, families + finitely many sporadics is impossible (Prop 5.6, abstract core). | machine-checked |
| Prop 5.6, concrete inputs | Uncountably many separable II₁ factors (McDuff 1969) and the 4-dimensional model geometries (18 + one countably infinite family) refute finite sporadic lists. | complete-informal-proof (external inputs C-5, C-10, C-11) |
| `TwoRegimeFails` | No injection of the seven regimes into two labels: a two-regime classified/impossible taxonomy cannot keep the evidence shapes straight (Prop 5.7, abstract core). | machine-checked |
| Prop 5.7, witnesses | Unknot recognition is decidable-but-unclassified (NP ∩ coNP, P open); finite simple groups are classified-but-unparameterized. | complete-informal-proof (external literature) |
| `Coarsens` | `Coarsens r s` = every `r`-pair is an `s`-pair (§2). | machine-checked |
| `IsocategoricalEquivalenceFails` | If plain tensor equivalence coarsens isomorphism and a pair `G ≇ H` with `G ≃pt H` exists, then `≃pt` is strictly coarser, merging distinct systems (Prop 5.8, conditional form). | machine-checked (witness: conditional, C-7) |
| Prop 5.8, witness | Etingof-Gelaki: non-isomorphic finite groups with equivalent plain tensor representation categories. | complete-informal-proof (external, Etingof-Gelaki 2001) |
| `SurveyedDomain` | The 29 surveyed domains of Table 4 as a finite data type. | machine-checked |
| `RegimeAssignment` | Total, single-valued assignment of the 29 domains to the seven regimes (Table 4). | machine-checked |
| `RegimeAssignment.total`, `.unique` | The assignment is total and every domain occupies exactly one regime (Table 4 / Def 4.5). | machine-checked |
| `RegimeAssignment.every_regime_used` | Every one of the seven regimes is used by the assignment (partition check). | machine-checked |
| Table 4, row truth | The deciding evidence for each regime row (register theorems + survey). | complete-informal-proof (per-row external citations in the paper) |
| `check_partition` (regime_inventory.py) | Mechanical check: assignment single-valued into the seven regimes. | computational-evidence |
| `dimvec_enumeration.py`, `wild_quiver_growth.py`, `Instances.hs` | Finite C*-algebra dimension vectors; Kronecker-quotient growth; witness systems with regime tags. | computational-evidence |
| Universal classification conjecture | Every admissible system is generated by fixed families under fixed constructions; 4 obligations open, 1 partial, premise (admissibility list) unfixed. | open-problem (C-12) |

Skipped targets: none of the ten targets is skipped outright. Targets 4, 5, 7, 8, 9
are formalized only in their tractable cores (marked above); their external-input
and descriptive-set-theoretic clauses are recorded as `C-<n>` in
`verification/vol-11-completeness-obstructions-conjectures.md`.
