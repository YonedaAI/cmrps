# Dependency notes — vol-12-principia-physica

**Module:** lean/Cmrps/Vol12PrincipiaPhysica.lean (namespace `Cmrps.Vol12`).
**Imports:** `Mathlib.Data.Real.Basic`, `Mathlib.Tactic` only.

## Paper-level dependencies

| Paper result | Depends on |
|---|---|
| Def. 2.5 (three layers) | Stipulation only; no external input. |
| Def. 2.6 / Table 2 (evidence grades) | Registry audit of the program records; Table 2 is data. |
| Def. 2.7 / Table 3 (regime assignment) | Inspection of Table 3; counts 15,1,1,7,3,1,1 by row tally. |
| Section 3 non-collapse | Def. 2.5 + the stipulation that mathematically distinct theories may agree in an accessible regime. |
| Thm 5.1 (obstructions) | McDuff (II₁ factors); Bekkert–Drozd / Buchweitz–Leuschke / Grevstad–May (wildness); Adyan–Rabin with the Collins extension (Markov properties); Tancer (4-manifolds); Etingof–Gelaki (isocategorical groups); Grochow–Qiao (tame/wild boundary). |
| Thm 6.1 (structure hypotheses) | Etingof–Gelaki isocategorical construction (counterexample); Doplicher–Roberts (reconstruction under hypotheses); Stinespring (normal form only); supermap representability (channel-state duality). |
| Thm 7.1 (monotone metrics) | Chentsov (classical uniqueness up to constant); Petz–Sudar (classification by operator monotone functions). |
| Section 6 claim register | Clay problem statement; the five claim-ledger entries CL-01..CL-05 and their ladder positions. |
| Def. 8.2 / Prop. 8.3 (constituent record) | Case (a): Lemma 9.1. Case (b): classification of group extensions by `H²(Q, Z(N))` (Brown). Non-collapse: Section 3. |
| Rem. 8.4 (generation vs classification) | Thm 5.1 third clause (Adyan–Rabin): finitely presented groups are generated from cyclic groups yet their Markov properties are undecidable. |
| Lemma 9.1 (block decomposition) | Murphy: structure theorem for finite-dimensional complex C*-algebras; block sizes recovered as simple-module dimensions. |
| Conj. 7.1 | Standalone; never used as a lemma in the paper. |

## Lean-level dependencies (which declarations each theorem uses)

| Lean theorem | Uses |
|---|---|
| `SelectionNotComputedByClassification` | `NotFactoring`; `Iff.mpr`/`mp`, hypothesis application only. |
| `EvidenceGradeAssignment` | `evidenceGrade`, `RecordType`, `EvidenceGrade` (case analysis + `decide`). |
| `registry_no_grade3` / `registry_grades` | `evidenceGrade`, `registryTypes` (`decide` / `rfl`). |
| `spine_row_count` | `spineTable` (`decide`). |
| `RegimeAssignment` | `countRegime`, `spineRegimes`, `spineTable`, `Regime` (`decide`). |
| `ObstructionAssembly` | `refutingTheorem`, `ObstructionObjective` (case analysis + `rfl`). |
| `StructurePreservation` | `Eq.symm`, `Eq.trans`, `congrArg` only. |
| `MonotoneWitnessDistinct` | `f_id`, `f_aff`, `congrFun`, `norm_num`. |
| `MonotoneMetricGap` | `Subsingleton.elim` (`letI` instance). |
| `MonotoneMetricGapQuantum` | `MonotoneMetricGap`, `MonotoneWitnessDistinct`, `congrArg Subtype.val`. |
| `ExistenceMassGapSeparation` | `ClaySolved`, `ClayProblem` (And elimination). |
| `claim_positions_exact` / `claim_ledger_size` / `claim_ledger_not_verified` | `claimPositions`, `LadderPosition` (`rfl` / `decide`). |
| `sameBlocks_refl` / `sameBlocks_symm` / `sameBlocks_trans` | `SameBlocks`, `countNat`, `Eq.symm`, `Eq.trans`. |
| `ConstructionLayerSeparation` | `constructionLayer`, `Layer` (`decide`). |
| `ConditionalStructuralGeneration` | `SameBlocks`, `constructionLayer`; hypothesis application + `rfl`. |
| `GenerationVersusClassification` | Hypothesis application only. |
| `FiniteDimCStarDecomposition` | `SameBlocks`; hypothesis application (`Iff.intro`). |
| `ExampleBlockMultiset` | `countNat` (`decide`). |

No Lean declaration in this module depends on any other Cmrps volume module; the module
is self-contained apart from Mathlib. Cross-volume links are informational only:
`FiniteDimCStarDecomposition` is the background record T-BG-06 cited from vol-01/vol-02
registry, and `ObstructionAssembly` assembles the obstruction theorems registered in
vol-03/vol-04/vol-11 contexts; neither imports their modules.

## Hypotheses recorded (not proved in Lean)

- `hInv` / `hRec` of `FiniteDimCStarDecomposition`: structure theorem for finite-dimensional
  complex C*-algebras and isomorphism invariance of simple-module dimensions.
- `hA₁`/`hA₂`, `hB₁`/`hB₂` of `ConditionalStructuralGeneration`: the same structure theorem
  and the classification of group extensions by `H²(Q, Z(N))`.
- `hid` / `haff` of `MonotoneMetricGapQuantum`: operator monotone membership of `x` and
  `(x+1)/2` (Petz–Sudar parameter class).
- The witness of `StructurePreservation` when instantiated to groups: existence of
  isocategorical group pairs (Etingof–Gelaki).
- The witness of `GenerationVersusClassification` when instantiated: a finitely presented
  group with an undecidable Markov property (Adyan–Rabin).
