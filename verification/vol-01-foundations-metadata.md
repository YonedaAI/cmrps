# Metadata — vol-01-foundations

**Paper:** Foundations of Structural Classification (Part 1 of The Classification of
Mathematical Representations of Physical Systems), 21 pages, compiled 2026-10-30.

## Novelty assessment

The paper's original content is the framework itself and three results inside it. The
five-component record schema is stipulative and follows the series ontology; the new
content is the typing statement for the composition coordinate (record-level
declaration against class-level construction), the preservation-law set for the five
morphism kinds, and the proof that the kinds do not compose across kinds while each is
closed under self-composition (Propositions 4.4 and 4.6). The restricted classification
theorems (8.1, 8.2, 8.4) are standard mathematics of finite sets, functional graphs, and
G-sets, presented and proved in the new framework; they are deliberately elementary and
are claimed as worked instances, not as new theorems of combinatorics. Proposition 7.6
(two factorizations of one vector with entropies 0 and log 2) is an explicit linear-algebra
example with a written proof. The admissibility list (AC-1 to AC-6) is the paper's first
deliverable to the ontology and is a proposal, not settled mathematics.

## Literature coverage

The bibliography has 23 entries, all resolved (reviews/vol-01-foundations-bib-check.md).
Load-bearing claims cite primary sources: Gorenstein and Solomon for the finite simple
groups comparison, Humphreys for Lie classification, Dixmier for C*-algebras, Connes and
McDuff for factors, Milnor for classifying spaces, Scott for geometrization, Tancer for
4-manifold unrecognizability, Arnold for Darboux's theorem, Rabin for undecidability,
Buchweitz-Leuschke for wildness, Gelfand-Naimark and Stone for duality, Doplicher-Roberts
and Deligne for tensor-category reconstruction, Etingof-Gelaki for the preserved-structure
constraint, Weinstein for Poisson splitting, and Mac Lane for the Yoneda lemma. Survey
coverage of the underlying series corpus is arXiv plus known-URL discovery, so non-arXiv
venues may be under-covered; absence of a citation is not evidence of absence.

## Proof-status summary

Ten theorem-level items: nine complete-informal-proofs given in full in the paper
(Propositions 4.4, 4.6, 6.4, 6.5, 7.6, Corollary 4.5, Theorems 8.1 to 8.4, with 8.3
following from 8.1 and 8.2) and one conjecture (9.2). Nothing in the paper is
machine-checked. The computational artifacts (Haskell instance layer with its build
transcript, four Python experiments) are computational-evidence only. The claim ledger
is verification/vol-01-foundations-claim-ledger.md.

## Open problems left by the paper

1. Inter-kind morphism composition: the schema is not a category; a bicategory of spans
   or cospans, or a typed multicategory, is the named candidate and is not constructed.
2. The preservation laws for quantum, gauge, and dual presentations are stated in their
   point-set specialization only; the algebraic form is described but not developed.
3. The admissibility conditions AC-1 to AC-6 are proposals; every statement over
   admissible records is conditional on them, and Proposition 6.5 shows the dependence
   is real.
4. The choice of physical equivalence is open; the paper declares it per restricted class
   and supplies only the negative constraint (preserved structure must be named).
5. Conjecture 9.2 stands with four open obligations and one partial; finite generation of
   the family collection is unproved.
6. The restricted theorems verify combinatorial scaffolding only; how observables,
   dynamics, and constraints interact under morphisms is untested by them.

## Connections to other volumes

- vol-01 is the definitional root: the record schema (onto DEF-001 to DEF-007), the
  morphism kinds (DEF-008 to DEF-014), the equivalence discipline (DEF-015 to DEF-018),
  the admissibility proposal (DEF-019, DEF-020), irreducibility and closure (DEF-021 to
  DEF-024), and the conjecture statement (DEF-039 to DEF-041) all originate here.
- vol-02 inherits the morphism and admissibility vocabulary for the ten structural
  families; the family names appear in Section 9 only for orientation.
- vol-03 inherits the decomposition definitions (7.1 to 7.3) and the finite-dynamical
  decomposition pattern of Theorem 8.2 as its smallest worked instance.
- vol-04 inherits the Yoneda qualification as stated in Remark 5.4 and the preserved-
  structure discipline of Definition 5.3.
- vol-10 inherits the three equivalence notions (5.1, 5.2, 5.6) and the constraint that
  isomorphism is never identified with indistinguishability.
- vol-11 inherits the obstruction-shaped stance: a rigorous impossibility result counts
  as progress, and Conjecture 9.2 may enter only as a declared hypothesis.
- vol-12 inherits the three layers of Definition 5.5 and the rule that the layers are
  never collapsed.
