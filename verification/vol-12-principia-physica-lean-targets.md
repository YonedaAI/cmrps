# Lean mechanization targets — vol-12-principia-physica

**Paper:** papers/latex/vol-12-principia-physica.tex (Principia Physica)
**Date:** 2026-10-29
**Rule:** at most 10 targets; exact names and informal statements matching the paper's definitions and theorems. No `.lean` files are written in this phase and `lake` is never run. Nothing in this series is machine-checked; these targets describe future work.

| # | Target name | Informal statement | Paper location |
|---|---|---|---|
| 1 | `PrincipiaLayers` | The Principia architecture consists of three separate maps: classification of admissible structures, realization into physical theories, and selection into observational data, with no map factoring through another. | Definition 2.5 |
| 2 | `EvidenceGradeAssignment` | Every record of the program registry lies at evidence grade 1 or 2 (formulation or rigorous theorem); no record reaches grade 3 (physical validation). | Definition 2.6, Table 2 |
| 3 | `RegimeAssignment` | The twenty-nine rows of the program comparison table map into exactly one of the seven classification regimes each, with counts 15, 1, 1, 7, 3, 1, 1 across regimes 1 to 7. | Definition 2.7, Table 3 regime analysis |
| 4 | `ObstructionAssembly` | Six classification objectives (total classification of non-amenable factors, finite-variety parameterization of wild module categories, uniform recognition of Markov properties, effective 4-manifold classification, group recovery from plain tensor categories, wild-regime isomorphism algorithms) are each refuted by a registered theorem. | Theorem 5.1 |
| 5 | `StructurePreservation` | An equivalence of representation categories that forgets the symmetric monoidal layer cannot recover the group; every admissible identification must declare its preserved structure layers. | Theorem 6.1 |
| 6 | `MonotoneMetricGap` | The Fisher metric is unique up to constant among metrics monotone under stochastic maps, and quantum monotone metrics form a parametric family with more than one element, so classical uniqueness fails in the quantum case. | Theorem 7.1 |
| 7 | `ExistenceMassGapSeparation` | An existence claim for a four-dimensional quantum field theory does not imply a positive mass gap; the two properties are separate conjuncts of the Clay problem and separate registry entries. | claim register discussion (Section 6) |
| 8 | `ConditionalStructuralGeneration` | For direct sums of finite-dimensional complex C*-algebras and for group extensions with fixed action and recorded extension class, the constituent invariant record (construction data, constituent invariants, gluing class) is complete up to the stated equivalences, and the constructions map neither into theories nor into observation data. | Definition 8.2, Proposition 8.3 |
| 9 | `GenerationVersusClassification` | Generation under the admissible constructions does not imply classification by invariants; the two objectives coincide only where constituents carry classifying invariants (finitely presented groups separate them). | Remark 8.4 |
| 10 | `FiniteDimCStarDecomposition` | Every finite-dimensional complex C*-algebra is a direct sum of matrix blocks with the multiset of block sizes uniquely determined; the worked example has block multiset {1, 2}. | Lemma 9.1 (background record T-BG-06) |
