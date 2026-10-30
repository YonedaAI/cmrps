# Metadata: vol-10-observational-equivalence

Paper: Observational Equivalence and Physical Distinguishability (Part 10 of
The Classification of Mathematical Representations of Physical Systems).
Author block: Matthew Long, The YonedaAI Collaboration, YonedaAI Research
Collective, Chicago, Illinois, USA (October 2026).

## Novelty assessment

The paper's original content is definitional and expository at the frontier the
corpus names but does not formalize. In order of strength: (1) the observation
functor of Definition 4.1 and its induced equivalence with the fiber and
quotient properties of Proposition 4.2 are a concrete formalization of the
object the Information Geometry Correspondence program names without defining;
(2) the two-direction analysis of coarsened observations (Proposition 4.5) and
the composed-experiments counterexample (Proposition 4.6, explicit bipartite
witness with diagonal event 11/32 against 9/32) settle one case of the
corpus's open question on composition of empirical indistinguishability and
isolate the remaining case; (3) the commutative-restriction result (Proposition
5.3) locates exactly where the parametric freedom of quantum monotone metrics
is invisible, and the worked example (16/3 against 4 at a non-commuting
direction for two self-reciprocal operator monotone functions) makes
ruler-dependence quantitative; (4) the counterexample search protocol and the
admissibility band of Definition 2.5 constrain any future candidate for
physical equivalence. No claim of priority is made beyond these constructions;
the literature results (Etingof-Gelaki, Chentsov, Petz-Sudar, Doplicher-Roberts,
Gelfand, Gelfand-Neumark, Johnstone, Mueger, supermap representability) are
cited as literature.

## Literature coverage

Nine bibliography entries, all live-resolved (reviews/vol-10-observational-equivalence-bib-check.md):
primary sources for Etingof-Gelaki isocategorical groups (arXiv:math/0007196),
Doplicher-Roberts reconstruction (Invent. Math. 98, 1989), Gelfand (1941),
Gelfand-Neumark (1943), Johnstone's Stone Spaces (1982), Petz-Sudar
(arXiv:quant-ph/0102132), Mueger (arXiv:math-ph/0008027), and the two supermap
papers (arXiv:2402.02997, arXiv:2602.23865). Coverage gaps: the classical
decision-theoretic literature behind Chentsov is used only through the
Petz-Sudar restatement; the operational distinguishability literature
(Helstrom-type bounds) is deliberately not cited since the corpus does not
stage it and the paper's results do not need it. Cutoff 2026-10-29.

## Proof-status summary

Two cited theorems carry complete-informal-proof status from the literature
(Theorems 3.1, 5.1, 5.2 with Remark 3.3). Eight statements are proved in the
paper (Propositions 4.2, 4.5, 4.6, 5.3, Corollaries 3.2, 5.5, Lemma 4.3, and
the finite computations of Section 9). Two statements are supported by
computational evidence that also verifies the arithmetic (Example 5.4 and the
character-table computation of Section 9.3). Nothing is machine-checked; the
Haskell module Instances.hs is an executable taxonomy model and the Python
scripts are Phase D evidence, never proof.

## Open problems carried forward

1. The correct choice of physical equivalence in Classify(Ob(Phys)/equivalence)
   (DEF-015); the paper supplies constraints (Definition 2.5), not a choice.
2. Whether bounded experimental indistinguishability composes in interacting
   regimes (the unproved regime of Proposition 4.6).
3. A positive reconstruction criterion for "the same physical system"; the
   counterexample search records the negative results only.
4. Concrete contents of the record category beyond the finite model, including
   limits of records for continuum limiting procedures.

## Connections to other volumes

vol-01 (foundations): supplies the object schema (Definition 2.1) and the
choice-of-equivalence problem this volume addresses at the empirical layer.
vol-04 (Yoneda): the Yoneda qualification governs Section 7; this volume adds
observation functors as structure on top of relational data, not a consequence
of it. vol-05 and vol-09: classical monotone-metric uniqueness (Theorem 5.1)
and its quantum failure (Theorem 5.2) are shared with the information-geometry
volumes under DEP-008 (uniqueness may not be extended across the
classical/quantum gap). vol-06 and vol-11: the Etingof-Gelaki constraint
(Theorem 3.1) is the equivalence discipline shared under DEP-007. vol-12: the
empirical layer instantiation (Definition 8.1) feeds the layer-E discussion of
Principia Physica.

## Format-standard note

The preamble package set (including graphicx, tikz, listings) is retained
unchanged because references/paper-format.md mandates the preamble skeleton
verbatim ("use exactly this skeleton"); this citation of the skeleton rule
closes review item R3-5. The GrokRxiv sidebar (Stage 6) uses the tikz and
everypage packages from that skeleton.
