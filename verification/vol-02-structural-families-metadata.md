# Metadata: vol-02-structural-families

**Title:** Fundamental Structural Families of Mathematical Physics
**Series:** Part 2 of The Classification of Mathematical Representations of Physical Systems
**Author block:** Matthew Long; The YonedaAI Collaboration, YonedaAI Research Collective;
Chicago, Illinois, USA; matthew@yonedaai.com; https://yonedaai.com
**Publication date:** October 2026
**Compiled:** `papers/pdf/vol-02-structural-families.pdf`

## Novelty assessment

The paper is a taxonomy volume and its novelty claim is correspondingly narrow.

What is new here and proved in full: the sharpness criterion (Theorem 3.2) formalizing the
observation that classification shape follows invariant shape; the globality proposition
(Proposition 3.4) extracting the classification consequence of Darboux's theorem; the induced
operations on the dimension vector (Proposition 4.2); the non-closure proposition
(Proposition 15.1) for classes irreducible under direct sum; the non-independence proposition
(Proposition 16.2) showing that classifying invariants do not settle family independence; the
mixed-record proposition (Proposition 17.1); the comparability proposition
(Proposition 18.1); and the five-kind achievement taxonomy (Definition 3.6, Proposition 3.7).

What is synthesis rather than novelty: the ten family rows, the invariant discipline as a
record format, and the open-questions table. The paper claims no completeness for the family
list and no classification theorem beyond those it cites.

What is deliberately absent: any completeness claim for the ten families, any global periodic
table, any claim that the families are logically independent, and any claim of machine
checking.

## Literature coverage

Thirty-five bibliography entries, all resolved before the first review round
(`reviews/vol-02-structural-families-bib-check.md`). Coverage is concentrated in the domains
the ten families draw on: symplectic and Poisson geometry, operator algebras, bundle theory,
monotone metrics, topological field theory, tensor categories, wild representation theory,
and the classification-theory template of the finite simple groups.

Known limits of coverage. The bibliography relies on the survey corpus of the research map,
whose discovery ran on the arXiv API plus known-URL fetches; non-arXiv venues may be
under-covered. A substantial fraction of the entries are encyclopedia and reference-work
records (Wikipedia, nLab) rather than primary journal sources, because those are the locators
the staged corpus resolved. Where a result is load-bearing, the paper states the result and
attributes it to the record it was located in. Replacing the secondary locators with primary
journal references is the highest-value bibliographic improvement for a revision.

## Proof-status summary

| Status | Count |
|---|---|
| proved in this paper (complete-informal-proof) | 16 |
| cited from the literature (complete-informal-proof) | 6 |
| recorded as claimed (conjecture) | 1 |
| computational evidence (never proof) | 3 files |
| machine-checked | 0 |

No result in this paper is machine-checked. The Lean targets in
`verification/vol-02-structural-families-lean-targets.md` are mechanization targets and not
formalizations.

## Open problems

1. Which of the ten families are fundamental rather than presentations of others.
2. Whether any two of the ten families are logically independent in the sense of
   Definition 16.1.
3. Whether the ten families generate all admissible systems under the admissible
   constructions. This is the conjectural closure identity and is never used as a lemma.
4. Which global invariants of symplectic manifolds serve as classifying data. Darboux removes
   the local ones; the corpus does not fix the global list.
5. A classification theorem for completely positive maps up to isomorphism. Stinespring gives
   a normal form and the paper proves that the normal-form invariant is not injective on
   channels.
6. Classification of fusion categories, and the pivotal-structure conjecture attached to them.
7. Which cases of the extended topological field theory classification are complete, given
   that the 2009 proof is described by its author as an informal sketch.
8. Whether a smooth or parametric classification of the general separable type II_1 factors
   exists beyond the countable-invariant obstruction the paper records.

## Connections to other volumes

| Volume | Connection |
|---|---|
| vol-01 | Supplies the ontology the paper reuses: the object record, the morphism classes, the equivalence notions, the admissible constructions, and the ten family definitions. vol-02 is the family-level instantiation and adds no new ontology identifier. |
| vol-03 | Takes the induced-operations result (Proposition 4.2) and the finite-dimensional C*-algebra sector (Theorem 7.1) as its model theorem for decomposition. |
| vol-05 | Takes the symplectic family row and the globality proposition (Proposition 3.4) as the reason classification content there is topological. |
| vol-06 | Takes the operator-algebra family row, including the scope limits the paper records for the finite-dimensional, amenable, and wild sectors. |
| vol-07 | Takes the bundle family row and the anomaly-as-obstruction row. |
| vol-08, vol-09 | Take the geometric family row and the monotone-metric rows. |
| vol-10 | Takes the independence and reconstruction table and the Etingof-Gelaki discipline rule. |
| vol-11 | Takes the obstruction rows and the achievement-kind taxonomy as objects of analysis. |
| vol-12 | Takes the family tables as the taxonomy layer of the assembly. |

## Compliance record for this run

| Invariant | Status |
|---|---|
| HUMAN_READABLE | on; record in `reviews/vol-02-structural-families-human-readable-check.md` |
| BIB_GATE | on; record in `reviews/vol-02-structural-families-bib-check.md`, written before the first review round |
| CODE_AUDIT | on; record in `reviews/vol-02-structural-families-code-audit.md` |
| Haskell | on; `src/vol-02-structural-families/Instances.hs` imports the taxonomy classes and does not redefine them |
| LEAN | on; targets in `verification/vol-02-structural-families-lean-targets.md`; no `.lean` file written, `lake` never run |
| Geometry | `\usepackage[margin=1in]{geometry}` |
| GrokRxiv sidebar | added after the review loops |
