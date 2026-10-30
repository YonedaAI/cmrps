# Cross-audit — vol-03-irreducibility-decomposition (Haskell vs Lean)

**Layers.** Lean (`lean/Cmrps/`) is the normative formalization; the Haskell
taxonomy layer (`src/`) is the executable model — computational evidence
validated against kernel-checked specifications, never proof and never
"verified by Lean". A MISMATCH is resolved by fixing Haskell or by recording
the gap — never by weakening Lean.

**Scope.** (1) every family class / invariant / construction / equivalence in
`src/Taxonomy/` against its Lean counterpart; (2) every `instance` in
`src/vol-03-irreducibility-decomposition/Instances.hs` against the system names of `Cmrps.Vol03 (Vol03IrreducibilityDecomposition.lean)`. Rows:
MIRRORED / PARTIAL / MISMATCH + one-line fix.

## 1. Shared taxonomy (src/Taxonomy/) vs Lean (lean/Cmrps/)

Lean is normative. Rows check every family class / invariant / construction /
equivalence in `src/Taxonomy/` against its Lean counterpart (names mirror;
ontology `docs/ontology.md` DEF ids cited where Lean has no name yet).

| Haskell name (src/Taxonomy/) | Lean counterpart (lean/Cmrps/) | Status | Fix |
|---|---|---|---|
| `PhysicalSystem` (class, DEF-002) | `SystemRecord` (Vol10:24), `FinRec` (Vol01:37) | PARTIAL | Lean models the schema as structures, not a class; add cross-ref comment naming `Cmrps.Vol10.SystemRecord`. |
| `SystemRecord` (DEF-002 tuple) | `SystemRecord` (Vol10:24, fields X,O,D,S,C) | MIRRORED | — (fields X/O/D/S/C ↔ stateSpaceData..compositionData). |
| `StructuralFamily` (tags FamilyI..X, DEF-025) | `StructuralFamily` (Vol02:690) | PARTIAL | Haskell is a tag enum, Lean is `Obj : Type u`; add comment distinguishing tag vs object-class form. |
| `familyDefId` | (ontology DEF-025..035) | MIRRORED | — (pure metadata). |
| `FamilySymplecticPoisson` (DEF-026) | `SymplecticGermField` (Vol02:156), `SymplecticForm` (Vol05:316) | PARTIAL | no Lean class name; comment already cites DEF-026 — add Lean name cross-ref. |
| `FamilyHilbertOperatorAlgebras` (DEF-027) | `BlockAlg` (Vol03:47), `BlockAlgebra` (Vol06:201) | PARTIAL | add Lean name cross-ref in class comment. |
| `FamilySmoothGeometric` (DEF-028) | causal/order layer (Vol08) | PARTIAL | add Lean name cross-ref in class comment. |
| `FamilyPrincipalBundlesConnections` (DEF-029) | `AnomalyData` (Vol07:166), `GlobalFormInvariant` (Vol07:265) | PARTIAL | add Lean name cross-ref in class comment. |
| `FamilyProbabilityMeasure` (DEF-030) | `fisherMetric` (Vol05:63), `MonotoneMetric` (Vol05:143) | PARTIAL | add Lean name cross-ref in class comment. |
| `FamilyTopologicalHigherCategorical` (DEF-031) | `FrobeniusAlgebra` (Vol07:59) | PARTIAL | add Lean name cross-ref in class comment. |
| `FamilyDynamicalSemigroups` (DEF-032) | `Kraus` namespace (Vol02:424) | PARTIAL | add Lean name cross-ref in class comment. |
| `FamilyTensorCategoriesComposition` (DEF-033) | `PreservedLayer.symmetricMonoidal` (Vol10:61) | PARTIAL | add Lean name cross-ref in class comment. |
| `FamilyDiscreteCombinatorial` (DEF-034) | `sizeSemigroup` (Vol03:75) | PARTIAL | add Lean name cross-ref in class comment. |
| `FamilyDerivedHomotopical` (DEF-035) | (none; ontology DEF-035 only) | PARTIAL | not yet formalized in Lean — comment states the gap correctly; keep. |
| `InvariantRecord` (DEF-036) | `InvariantRecord` (Vol12:350) | MIRRORED | — (states/observables/dynamics/symmetries/representations ↔ five fields). |
| `ClassifyingInvariant` (DEF-037) | `ClassifyingInvariantOfFiniteVarietyType` (Vol04:96) | PARTIAL | Lean names the finite-variety case only; add cross-ref comment. |
| `DimensionVector` (DEF-037) | `DimensionVector` (Vol02:264 `Multiset ℕ`; Vol06:44 `List ℕ`) | MIRRORED | — (representation differs by design; names mirror). |
| `LieDiagram`/`DynkinDiagram`/`SatakeDiagram` | `DominantIntegralWeight` (Vol07:39) | PARTIAL | Lean covers the weight side only; comment cross-ref. |
| `WeightData` | `DominantIntegralWeight` (Vol07:39) | PARTIAL | add Lean name cross-ref. |
| `CasimirData` | `so3_casimir` (Vol05:458) | PARTIAL | Lean proves the so(3) case only; comment cross-ref. |
| `MurrayVonNeumannType`, `ConnesInvariants` | (none) | PARTIAL | not yet formalized; ontology DEF-037 covers the name — keep gap note. |
| `ClassifyingSpaceMap`, `CharacteristicClass` | `GlobalFormInvariant`/`w2` (Vol07:265-282) | PARTIAL | Lean covers SO(3) w2 detection; add cross-ref comment. |
| `FullyDualizableObject` | (none) | PARTIAL | not yet formalized; comment already flags T-OP-05 proof gap — keep. |
| `HolonomyGroup` | (none; name in Vol12 `spineTable`) | PARTIAL | not yet formalized; keep gap note. |
| `CausalClass` | causal ladder (Vol08:81-128) | PARTIAL | Lean covers finite-order shadow; add cross-ref comment. |
| `HolographicInequalityData`, `EntropyInequality` | `Ssa`/`Mmi` (Vol08:140-158) | PARTIAL | Lean covers SSA/MMI props; add cross-ref comment. |
| `FisherMetric` | `fisherMetric` (Vol05:63) | MIRRORED | — (case-differing name, same object). |
| `MonotoneMetric` | `MonotoneMetric` (Vol05:143) | MIRRORED | — |
| `EntropyHook` | (none) | PARTIAL | not yet formalized; keep gap note. |
| `Construction`, `ExtensionKind`, `LimitKind`, `QuotientKind` | closure-under-constructions (Vol02:626) | PARTIAL | Lean formalizes closure, not the kind enums; add cross-ref comment. |
| `Constructible` (class) | (none as class) | PARTIAL | hooks only; not yet formalized as a Lean class — keep. |
| `Irreducible` (class, DEF-021) | `IsIrreducibleDisjointUnion`/`IsIrreducibleDyn`/`IsIrreducibleProduct` (Vol01:245/347/576) | PARTIAL | Lean splits by composition rule; add cross-ref comment citing the three names. |
| `Decomposition` (DEF-022) | `DynDecomposition` (Vol01:440) | PARTIAL | Lean covers the dynamical case; add cross-ref comment. |
| `Decomposable` (class) | `components_exist` (Vol01:529) | PARTIAL | add cross-ref comment. |
| `Closure` (DEF-024) | closed-under-family (Vol02:626) | PARTIAL | add cross-ref comment. |
| `MorphismKind` (DEF-008..013) | `MorphismKind` (Vol10:53) | PARTIAL | Haskell has `EquivalenceMorphism` constructor, Lean's enum does not (Lean Vol01 has `IsEquivalenceMorphism` as a Prop); comment the divergence. |
| `PreservationLaw` (DEF-014) | preservation laws Def 4.3 (Vol01:45) | PARTIAL | Haskell stub is empty by design (DEF-014 open); add cross-ref to Vol01 point-set forms. |
| `EquivalenceKind` (DEF-015/016) | `EquivalenceNotion` (Vol10:46) | PARTIAL | name divergence (Kind vs Notion); add cross-ref comment. |
| `MathematicalEquivalence` (class, DEF-016) | `AdmissibleCandidate` `mathIso` (Vol10:40) | PARTIAL | add cross-ref comment. |
| `PhysicalEquivalence` (class, DEF-015) | `obsEquiv` (Vol10:106) | PARTIAL | add cross-ref comment. |
| `EquivalenceWitness` (DEF-018) | `EquivalenceWitness` (Vol10:75) | MIRRORED | — (notion/morphism/preservedLayers ↔ three fields + source/target). |
| `PreservedStructure` (DEF-018) | `PreservedLayer` (Vol10:61) | PARTIAL | name divergence (Structure vs Layer); add cross-ref comment. |
| `RecoveryObstruction` | `ObstructionTransport` (Vol11:177) | PARTIAL | add cross-ref comment. |
| `YonedaEmbedding` (DEF-038) | `restrictedYoneda` (Vol04:52), `yoneda_fully_faithful` (Vol04:124) | PARTIAL | add cross-ref comment. |

## 2. Instances (`src/vol-03-irreducibility-decomposition/Instances.hs`) vs `Cmrps.Vol03 (Vol03IrreducibilityDecomposition.lean)`

| Haskell instance(s) | Lean counterpart | Status | Fix |
|---|---|---|---|
| `FamilyHilbertOperatorAlgebras MatrixBlock` (Thm 3.2 blocks) | `BlockAlg`/`starBlock` (Vol03:47/51) | PARTIAL | names differ (`MatrixBlock` vs block of `BlockAlg`); add comment naming `BlockAlg`. |
| `Irreducible`/`Decomposable`/`Constructible MatrixBlock` | `finrank_blockAlg` (Vol03:110) | PARTIAL | Lean treats blocks inside `BlockAlg`; comment the gap. |
| `FamilyHilbertOperatorAlgebras FiniteDimCStar` (Thm 3.2) | `BlockAlg n` (Vol03:47) | PARTIAL | names differ; add comment naming `BlockAlg`. |
| `Irreducible`/`Decomposable`/`Constructible FiniteDimCStar` | `dimVector_sum_elim`/`dimVector_prod` (Vol03:144/159) | MIRRORED | — (block decomposition ↔ dimension-vector arithmetic; header states Thm 3.3 itself is not mechanized). |
| `MathematicalEquivalence FiniteDimCStar` | `dimVector_perm_invariant` (Vol03:130) | MIRRORED | — (iso ↔ dimension vector up to order). |
| `MultiplicityMatrix` (data + ops) | `MultiplicityMatrix` (Vol03:57) | MIRRORED | — (same name; Haskell `[[Int]]` vs Lean submatrix structure — comment representation choice). |
| `KrausNormalForm` + `FamilyDynamicalSemigroups KrausNormalForm` | `KrausRep`/`IsKrausRank` (Vol02:442/446) | PARTIAL | names differ (`KrausNormalForm` vs `KrausRep`); add comment naming `KrausRep`. |
| `FamilyTensorCategoriesComposition TwoQubitSystem` | `two_two_blocks_ne_tensor_block` (Vol03:206) | PARTIAL | Lean proves the block non-tensor fact; names differ; comment the gap. |
| `SuperselectionPair` (data) | `ClosedVectors`/`sizeSemigroup` (Vol03:75/81) | PARTIAL | Lean models the closed-vector semigroup, not pair records; add cross-ref comment. |
