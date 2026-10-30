# Claim status — vol-12-principia-physica

**Module:** lean/Cmrps/Vol12PrincipiaPhysica.lean (namespace `Cmrps.Vol12`)
**Date:** 2026-10-29
**Labels:** `machine-checked` (kernel-accepted statement in the module, no
`sorry`; assembler promotes to `machine-checked` after `lake build` exits 0) ·
`complete-informal-proof` (proved in the cited literature, not formalized here) ·
`conditional` (depends on an unfixed stipulation) · `conjecture` · `computational-evidence`
(checked only by the paper's executable code) · `open-problem`.

Every statement below is the exact Lean name where one exists. The ten mechanization
targets are all covered; classical inputs of the survey theorems are recorded as
hypotheses of the Lean statements rather than proved.

## Formalized claims (Lean)

| Name | One-line statement | Label |
|---|---|---|
| `PrincipiaLayers` | Structure of Def. 2.5: types `M`, `P`, `Eobs` with realization map `R : M → P` and selection map `E : P → Eobs`. | machine-checked |
| `NotFactoring` | Separation clause of Def. 2.5 as formalized: the equivalence relation induced by `select` differs from the one induced by `cls` (`¬ ∀ a b, E a = E b ↔ cls a = cls b`); this is NOT failure of factorization `E = f ∘ cls` (Codex review round 1). | machine-checked (induced-relations inequality; the factorization reading is `complete-informal-proof`) |
| `SelectionNotComputedByClassification` | Two mathematically distinct but empirically equivalent theories show that `select` and `cls` do not induce the same equivalence relation on theories (Section 3 non-collapse, induced-relations reading). | machine-checked |
| `EvidenceGrade` / `RecordType` / `evidenceGrade` | Def. 2.6 grades 1–3 and the six record types of Table 2 with their grades. | machine-checked |
| `EvidenceGradeAssignment` | Every record type on file lies at grade 1 or 2; grade 3 is attained only by the physical-validation type, which holds no record (Def. 2.6, Table 2). | machine-checked |
| `registry_no_grade3` / `registry_grades` | Explicit check that none of the five record types on file is graded 3; Table 2 read off as data. | machine-checked |
| `Regime` / `SpineRow` / `spineTable` / `countRegime` | Def. 2.7's seven regimes and the twenty-nine rows of Table 3 as data. | machine-checked |
| `spine_row_count` | The comparison table has exactly 29 rows (28 spine domains + unknot boundary case). | machine-checked |
| `RegimeAssignment` | The 29 rows map into exactly one regime each, with counts 15, 1, 1, 7, 3, 1, 1 over regimes 1–7 (Def. 2.7, Table 3). | machine-checked |
| `ObstructionObjective` / `refutingTheorem` | The six forbidden classification objectives of Thm 5.1, each with its named registered theorem (McDuff; Bekkert–Drozd/Buchweitz–Leuschke/Grevstad–May; Adyan–Rabin+Collins; Tancer; Etingof–Gelaki; Grochow–Qiao). | machine-checked |
| `ObstructionAssembly` | Every classification objective of Thm 5.1 is refuted by a registered theorem (data-level assembly). | machine-checked |
| `StructurePreservation` | No recovery function from coarse data can classify objects when the coarse data cannot distinguish them (Thm 6.1: isocategorical groups refute recovery of the group from plain tensor data). | machine-checked |
| `f_id` / `f_aff` / `MonotoneWitnessDistinct` | The witness functions `x` and `(x+1)/2` of Thm 7.1 are distinct. | machine-checked |
| `MonotoneMetricGap` | A parameterized family with more than one element admits no unique choice, so classical uniqueness cannot extend to it (Thm 7.1, gap clause). | machine-checked |
| `MonotoneMetricGapQuantum` | Given operator-monotone membership of both witnesses (classical Petz–Sudar input), an abstract operator-monotone predicate has two distinct members (Thm 7.1, quantum clause as formalized). | machine-checked (function distinctness only — no metric correspondence or non-proportionality; the metric conclusion is `complete-informal-proof`, cf. Vol09 `quantum_monotone_metrics_not_unique`; Codex review round 1) |
| `ClayProblem` / `ClaySolved` | The Clay problem is the conjunction of existence and positive mass gap (Section 6). | machine-checked |
| `ExistenceMassGapSeparation` | An existence claim alone does not discharge the mass-gap conjunct; the two properties are separate conjuncts (Section 6). | machine-checked |
| `LadderPosition` / `claimPositions` | Table 4's five claim-ledger entries and their ladder positions, as data. | machine-checked |
| `claim_positions_exact` / `claim_ledger_size` / `claim_ledger_not_verified` | The five entries are announced, published-unverified, withdrawn, rigorous-within-regimes, preprint-outline; none is verified or accepted, so none resolves the Clay problem. | machine-checked |
| `InvariantRecord` / `ConstituentRecord` | Def. 2.9 invariant record and Def. 8.2 constituent record `μ(P) = (F, {I(Iᵢ)}, g_P)`. | machine-checked |
| `countNat` / `SameBlocks` / `sameBlocks_refl` / `sameBlocks_symm` / `sameBlocks_trans` | Block-multiset equality is an equivalence relation on block-size lists. | machine-checked |
| `Layer` / `constructionLayer` / `ConstructionLayerSeparation` | The two constructions of Prop. 8.3 act at the mathematical layer, mapping neither into theories nor into observation data. | machine-checked |
| `ConditionalStructuralGeneration` | Prop. 8.3: in case (a) the block multiset and in case (b) the record `(N, Q, g_P)` is a complete invariant up to the stated equivalences, under the classical inputs recorded as hypotheses. | machine-checked |
| `GenerationVersusClassification` | Generation of every object from basic data does not imply classification by invariants; one generated-but-unclassified object refutes the implication (Rem. 8.4). | machine-checked |
| `FiniteDimCStarDecomposition` | Lemma 9.1 uniqueness form: under the structure theorem and isomorphism invariance of simple-module dimensions, the block multiset is a complete invariant up to `*`-isomorphism. | machine-checked |
| `ExampleBlockMultiset` | The worked example `A = ℂ ⊕ M₂(ℂ)` has block multiset `{1, 2}`, independent of block order (Lemma 9.1, Section 9.1). | machine-checked |

## Skipped or only-informal claims

| Name | One-line statement | Label |
|---|---|---|
| Chentsov's theorem | The Fisher metric is the unique metric up to constant monotone under stochastic maps (Thm 7.1 first clause). | complete-informal-proof |
| Petz–Sudar classification | Quantum monotone metrics are classified by operator monotone functions (Thm 7.1 second clause). | complete-informal-proof |
| Operator monotone membership | `x` and `(x+1)/2` are operator monotone; used as hypotheses `hid`, `haff` of `MonotoneMetricGapQuantum`. | complete-informal-proof |
| Existence of isocategorical groups | Non-isomorphic finite groups with equivalent plain tensor representation categories (hypothesis of `StructurePreservation` when instantiated). | complete-informal-proof |
| McDuff 1969 | Uncountably many non-isomorphic separable type II₁ factors (first clause of Thm 5.1). | complete-informal-proof |
| Derived wildness line | Bekkert–Drozd; Buchweitz–Leuschke; Grevstad–May wildness results (second clause of Thm 5.1). | complete-informal-proof |
| Adyan–Rabin + Collins | Markov properties of finitely presented groups are undecidable (third clause of Thm 5.1; witness of `GenerationVersusClassification`). | complete-informal-proof |
| Tancer 2023 | Connected-sum homeomorphism for a specific four-manifold is unrecognizable (fourth clause of Thm 5.1). | complete-informal-proof |
| Grochow–Qiao | Tame/wild tractability boundary for group isomorphism (sixth clause of Thm 5.1). | complete-informal-proof |
| Finite-dimensional C*-structure theorem | Every f.d. complex C*-algebra is `⊕ᵢ M_{nᵢ}(ℂ)` with block sizes = simple-module dimensions (existence half of Lemma 9.1; hypothesis `hRec`/`hInv` of `FiniteDimCStarDecomposition`). | complete-informal-proof |
| Group extension classification | Extensions with fixed action correspond to `H²(Q, Z(N))` (case (b) input of Prop. 8.3; hypothesis `hB₁`/`hB₂`). | complete-informal-proof |
| Layer separation of the registry | No record of the program registry lives at grade 3 / no observation functor is constructed (Section 3, Table 2). | complete-informal-proof |
| Statements over `Phys_adm` | Every theorem quantified over the admissible class is conditional on unfixed admissibility conditions (Def. 2.3). | conditional |
| Equivalence discipline | Any identification must declare preserved structure layers (Thm 6.1 conclusion); which layers count as admissible is an open choice (Def. 2.2). | conditional |
| Structural classification conjecture | `Phys_adm ≃ ⟨𝔉_α⟩_𝔘` for suitable families and admissible constructions (Conj. 7.1). | conjecture |
| Constituent-record completeness, remaining constructions | The analogue of Prop. 8.3 for the constructions beyond direct sums and group extensions. | conjecture |
| Four-dimensional existence | Existence of the four-dimensional Yang–Mills/QCD quantum field theory (claim CL-01 announced; manuscript and formalization withheld). | open-problem |
| Positive mass gap | Strict positivity of the four-dimensional Yang–Mills mass gap (Clay problem, second conjunct). | open-problem |
| Physical validation of the architecture | Empirical criteria the architecture could pass and rivals fail (eighth deliverable of Section 10). | open-problem |
| Unification of reconstruction patterns | Supermap representability and the Gelfand/Stone/Naimark pattern join into one relational principle. | open-problem |
| Independence of the ten families | Whether any two of the ten candidate structural families are logically independent. | open-problem |
| Observational equivalence composition | Whether `∼_E` composes in interacting regimes; the observation functor has four pieces of missing data. | open-problem |
| Regime counts, obligation scoreboard, record counts, grade-3 emptiness (code) | `regime_counts`, `obligation_scoreboard`, `record_counts`, `layer_separation` in `src/vol-12-principia-physica/phase_d_registry_audit.py`. | computational-evidence |
| Dimension vector and decomposition examples (code) | `dimensionVectorExample`, `classificationOrderCheck`, `decompositionExample`, `decompositionCheck` in `src/vol-12-principia-physica/Instances.hs`. | computational-evidence |
