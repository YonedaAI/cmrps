# Metadata: vol-11-completeness-obstructions

Paper: Completeness and Obstructions (Part 11 of The Classification of Mathematical
Representations of Physical Systems). Matthew Long, The YonedaAI Collaboration,
YonedaAI Research Collective, October 2026.

## Novelty assessment

The obstruction register compiles seven proved non-classifiability theorems into a
single named table keyed to the components of a classification program (invariant,
parameter space, recognizer, equivalence). The classification-program definition and
the seven-regime taxonomy are new organizational devices; the regime assignment of
29 surveyed domains is a new synthesis of the series literature map. Theorem 5.2
(obstruction transport) is new as stated: it transports wild embeddings and invariant
obstructions along fully faithful functors injective on isomorphism classes, with the
Borel hypotheses made explicit for the descriptive-set-theoretic clause, and it records
exactly where transport of non-parametrization to strictly larger categories stops.
Propositions 5.6 to 5.8 are new counterexamples to three natural completions of the
universal classification picture (finite sporadic list, two-regime taxonomy, plain
tensor equivalence). No claim of priority is made for the underlying register
theorems; each is cited to its source.

## Literature coverage

Coverage follows the staged survey of the series (61 sources, arXiv plus known-URL
discovery) and the primary sources resolved during the bibliography check: Adyan
1955, Rabin 1958, Collins 1969, McDuff 1969, Connes 1976, Stinespring 1955,
Etingof-Gelaki 2001, Etingof-Nikshych-Ostrik 2005, Bekkert-Drozd 2003, Buchweitz-
Leuschke 2005, Grevstad-May 2025, Grochow-Qiao 2015, Tancer 2023, Sasyk-Tornquist
2009, Hass-Lagarias-Pippenger 1999, Lackenby 2021, Hillman, Perelman, Thurston,
Solomon 2001, Humphreys, Fulton-Harris, Cannas da Silva, Dixmier, Murphy, Petz-
Sudar 2001, Lurie 2009. Encyclopedic locators were removed in review. Known gaps:
non-arXiv venues under-covered by the survey; the Sasyk-Tornquist result is
published (Bull. Symbolic Logic 2009, complete proof Invent. Math. 2011) and is
cited as such; Kuperberg 2014 (coNP under GRH) is named in the survey findings
without a resolvable record and is not cited.

## Proof-status summary

Register theorems: complete-informal-proof in the cited literature (Sasyk-Tornquist
published; the survey corpus recorded it at announcement strength). Paper results: proved in
full in the text (Definitions 2.1 and 2.3, 4.1, 4.2, 4.5, 5.1; Lemma 4.3; Theorem
5.2; Corollaries 5.3, 5.4, 6.1; Propositions 5.5-5.8). The universal classification
conjecture: registered conjecture, examined as an object of study, never a lemma.
Computational artifacts: evidence only, never proof. Nothing in this volume is
machine-checked; the lean-targets file lists mechanization targets for later work.

## Open problems

1. The admissibility list (Definition 2.3's candidate conditions) is unfixed; every
   statement over Phys_adm is conditional.
2. Where the tame-wild boundary sits for physical representation categories is
   unstudied (Section 6.3).
3. Whether a nontrivial restricted form of the universal conjecture yields a
   completeness theorem is open (Sections 9, 10).
4. The choice of physical equivalence remains open; the obstruction theorems give a
   lower bound on intractability only where it agrees with isomorphism (Section 2.1).
5. Regime assignment is dated evidence; rows move when the tracked claims resolve.

## Connections to other volumes

vol-01 (definitions root: tuple, equivalence, admissibility, conjecture form),
vol-02 (families and invariants, analyzed in Sections 4 and 6), vol-03
(decomposition, the model theorem of Section 6.1), vol-04 and vol-10 (Yoneda
qualification and Etingof-Gelaki constraint, Section 2.1 and Proposition 5.8),
vol-05-09 (per-domain regime rows), vol-12 (supplies the regime taxonomy and the
obstruction register as its factual base; the five-obligation scoreboard of Section 7
is the agenda the closing volume inherits). Dependency discipline: the universal
conjecture enters only as a declared hypothesis or object of study.
