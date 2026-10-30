# Cross-audit registry — Haskell taxonomy layer vs Lean

**Two layers.** `lean/Cmrps/` is the normative formalization (kernel-checked,
`verification/lean-build.log`: Build completed successfully). `src/` is the
executable taxonomy — computational evidence validated against kernel-checked
specifications by cross-audit, never proof, never "verified by Lean".
A MISMATCH is fixed in Haskell or recorded as a gap — Lean is never weakened.

**Method.** Every family class / invariant / construction / equivalence in
`src/Taxonomy/` and every `instance` in `src/<topic>/Instances.hs` is checked
against its Lean counterpart in `lean/Cmrps/` (names mirror; `docs/ontology.md`
DEF ids cover names not yet formalized). Status per row:
**MIRRORED** (name + claim align) / **PARTIAL** (counterpart exists but names
or scope diverge — one-line fix given) / **MISMATCH** (contradiction — none
found in this run).

Per-topic detail files: `verification/<topic>-cross-audit.md` (each contains the
shared taxonomy table plus that topic's instance rows).

## Summary

| Section | Rows | MIRRORED | PARTIAL | MISMATCH |
|---|---|---|---|---|
| Shared taxonomy (`src/Taxonomy/`) | 44 | 7 | 37 | 0 |
| vol-01-foundations | 23 | 13 | 10 | 0 |
| vol-02-structural-families | 16 | 2 | 14 | 0 |
| vol-03-irreducibility-decomposition | 9 | 3 | 6 | 0 |
| vol-04-yoneda-classification | 11 | 1 | 10 | 0 |
| vol-05-classical-systems | 9 | 1 | 8 | 0 |
| vol-06-quantum-systems | 8 | 1 | 7 | 0 |
| vol-07-gauge-qft | 6 | 1 | 5 | 0 |
| vol-08-spacetime-reconstruction | 5 | 1 | 4 | 0 |
| vol-09-gravity-information-geometry | 7 | 1 | 6 | 0 |
| vol-10-observational-equivalence | 6 | 1 | 5 | 0 |
| vol-11-completeness-obstructions | 5 | 0 | 5 | 0 |
| vol-12-principia-physica | 5 | 3 | 2 | 0 |
| **Total** | **153** | **36** | **117** | **0** |

Rows compress the 159 `instance` declarations of `src/*/Instances.hs` (one row
per system type covers its instance cluster) plus 44 taxonomy rows.

## Taxonomy rows (shared — full table in every per-topic file)

| Haskell (src/Taxonomy/) | Lean counterpart | Status | Fix |
|---|---|---|---|
| `PhysicalSystem` (DEF-002 class) | `SystemRecord` (Vol10:24), `FinRec` (Vol01:37) | PARTIAL | cross-ref comment. |
| `SystemRecord` | `SystemRecord` (Vol10:24) | MIRRORED | — |
| `StructuralFamily` tags | `StructuralFamily` (Vol02:690) | PARTIAL | tag enum vs object class — comment. |
| `familyDefId` | ontology DEF-025..035 | MIRRORED | — |
| `FamilySymplecticPoisson`..`FamilyDerivedHomotopical` (10 classes) | `SymplecticGermField`, `BlockAlg`, `FrobeniusAlgebra`, `Kraus`, `fisherMetric`, `sizeSemigroup` etc.; DEF-035 has none | PARTIAL | add Lean name cross-ref per class; DEF-035 gap noted. |
| `InvariantRecord` | `InvariantRecord` (Vol12:350) | MIRRORED | — |
| `ClassifyingInvariant` | `ClassifyingInvariantOfFiniteVarietyType` (Vol04:96) | PARTIAL | cross-ref comment. |
| `DimensionVector` | `DimensionVector` (Vol02:264, Vol06:44) | MIRRORED | — |
| `FisherMetric`, `MonotoneMetric` | `fisherMetric` (Vol05:63), `MonotoneMetric` (Vol05:143) | MIRRORED | — |
| `EquivalenceWitness` | `EquivalenceWitness` (Vol10:75) | MIRRORED | — |
| `LieDiagram`/`DynkinDiagram`/`SatakeDiagram`/`WeightData`/`CasimirData` | `DominantIntegralWeight` (Vol07:39), `so3_casimir` (Vol05:458) | PARTIAL | Lean covers weight + so(3) only; cross-ref. |
| `MurrayVonNeumannType`, `ConnesInvariants`, `FullyDualizableObject`, `HolonomyGroup`, `EntropyHook` | none yet (ontology DEF-037 names only) | PARTIAL | gaps correctly claimed as unformalized. |
| `ClassifyingSpaceMap`, `CharacteristicClass`, `CausalClass`, `HolographicInequalityData`, `EntropyInequality` | `GlobalFormInvariant`/`w2` (Vol07), causal ladder (Vol08), `Ssa`/`Mmi` (Vol08) | PARTIAL | partial scope; cross-ref. |
| `Construction`/`ExtensionKind`/`LimitKind`/`QuotientKind`/`Constructible`/`Decomposition`/`Decomposable`/`Closure`/`Irreducible` | closure (Vol02:626), `IsIrreducible*` (Vol01), `DynDecomposition` (Vol01:440), `components_exist` (Vol01:529) | PARTIAL | Lean proves per-composition facts, not the hook classes; cross-ref. |
| `MorphismKind` | `MorphismKind` (Vol10:53) | PARTIAL | Haskell has `EquivalenceMorphism` ctor Lean's enum lacks — comment. |
| `PreservationLaw` | Def 4.3 point-set forms (Vol01:45) | PARTIAL | stub is empty by design (DEF-014 open); cross-ref. |
| `EquivalenceKind`/`PreservedStructure` | `EquivalenceNotion`/`PreservedLayer` (Vol10:46/61) | PARTIAL | name divergences (Kind/Notion, Structure/Layer) — comment. |
| `MathematicalEquivalence`/`PhysicalEquivalence` | `AdmissibleCandidate`/`obsEquiv` (Vol10:40/106) | PARTIAL | cross-ref comments. |
| `RecoveryObstruction` | `ObstructionTransport` (Vol11:177) | PARTIAL | cross-ref comment. |
| `YonedaEmbedding` | `restrictedYoneda` (Vol04:52) | PARTIAL | cross-ref comment. |

## Cross-topic findings

1. **No MISMATCH rows.** No Haskell claim contradicts a Lean statement.
2. **System-type names diverge in 9 of 12 topics** (e.g. `FiniteStateSystem` vs
   `FinRec`, `FrobeniusSystem` vs `FrobeniusAlgebra`, `IsocategoricalWitness` vs
   `PlainTensorCounterexample`). Fix pattern: add one-line cross-ref comments in
   `src/<topic>/Instances.hs` naming the Lean identifier. Claims themselves
   align; only names do not mirror exactly.
3. **Stale claims fixed in this run:** `src/vol-01-foundations/Instances.hs`
   claimed "no Lean build exists" (contradicted by `verification/lean-build.log`
   — build successful) and `src/vol-10-observational-equivalence/Instances.hs`
   said cross-audit "does not perform" validation. Both comments corrected.
4. **Module-name collision fixed:** all 12 `Instances.hs` declared `module
   Instances`; renamed to `VolNN<Name>.Instances` mirroring `Cmrps.VolNN*`.
5. **Genuinely unformalized in Lean (gaps, correctly claimed in Haskell):**
   DEF-035 derived/homotopical family, McDuff factor obstruction, DHR/Deligne
   tensor-category results, Petz quantum monotone classification, entanglement
   wedges, holonomy classification.
