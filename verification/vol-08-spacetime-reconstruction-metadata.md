# Metadata: vol-08-spacetime-reconstruction

Volume 8 of CMRPS: Classification and Reconstruction of Spacetime. Written
2026-10-30 as part of the October 2026 run. This file records novelty
assessment, literature coverage, proof-status summary, open problems, and
cross-volume connections.

## Novelty assessment

The volume is a synthesis with two original boundary results and one original
reduction, plus a framing contribution; the standard counterexample material is
attributed to its sources (review round 3 corrected an earlier misattribution).

1. Non-transfer of the causal ladder to finite orders, reframed after review as
   translation dependence: the strict-chronology reading of distinguishing
   fails on the two-point antichain while the reflexive reading is vacuous on
   every antisymmetric order (Propositions 6.3 and 6.4, Corollary 6.5).
2. Incompleteness of the headline invariants: the flat plane and the flat
   cylinder share dimension, trivial holonomy, and global hyperbolicity but are
   not isometric (Proposition 4.1, Corollary 4.2).
3. The reduction that strong subadditivity follows from subadditivity and
   monogamy for three single regions (Lemma 8.5), with its scope limit at n = 2
   and n = 4 made explicit.
4. The independence of monogamy from strong subadditivity (Proposition 8.2) is
   the standard counterexample of Hayden-Headrick-Maloney and Bao et al.;
   the paper contributes a self-contained derivation and the computational
   checks, not the counterexample itself.

A fourth piece of original content is the formal framing: classification
problem, probe reconstruction, and the code-audited computational evidence.
No claim of priority is made beyond these explicit statements, and no claim of
a classification of Lorentzian spacetimes up to isometry is made.

## Literature coverage

Primary sources, all resolved in reviews/vol-08-spacetime-reconstruction-bib-check.md:
Galaev (Lorentzian holonomy survey), Minguzzi-Sanchez (causal hierarchy),
Perelman (three Ricci-flow preprints) and Thurston 1982 (geometrization),
Hillman (four-dimensional geometries, including the Filipkiewicz count),
Tancer (unrecognizable 4-manifolds), Bao et al. (holographic entropy cone),
Hernandez-Cuenca (five-region cone), Malament and Hawking-King-McCarthy
(causal reconstruction), Ryu-Takayanagi and Hubeny-Rangamani-Takayanagi and
Casini-Huerta-Myers and Lewkowycz-Maldacena (RT prescription and its checks),
Dong-Harlow-Wall (entanglement-wedge reconstruction), Pastawski et al. (HaPPY),
Van Raamsdonk (entanglement and connectedness). Coverage gaps: the
post-2019 extremal-structure literature (Avis-Hernandez-Cuenca and related) is
not surveyed in depth; the n >= 6 entropy-cone facets are open; the
refinement literature on RT beyond its cited checks is not exhausted.

## Proof-status summary

- proved-in-paper: 12 statements (Propositions 4.1, 5.3, 6.3, 6.4, 7.2, 8.2,
  8.4, 9.4; Lemmas 5.4, 8.5, 8.6; Corollaries 4.2, 6.5, 7.4, 8.3, 9.2).
- complete-informal-proof (cited background, argument structure given):
  Theorems 5.1, 6.1, 7.1, 7.3, 8.1, 9.1, 9.5 and the characterization in
  Lemma 9.3.
- conjecture (marked as proposal or argument on every appearance): Remarks
  10.1, 10.2, 10.3 (Ryu-Takayanagi, HaPPY, Van Raamsdonk).
- open-problem: Remark 8.7 (entropy cone for n >= 6), Remark 10.4 (three
  requirements for an entanglement-to-geometry theorem).
- computational-evidence: the three Python experiments and the Haskell
  taxonomy instances. Never presented as proof; nothing is machine-checked.

## Open problems left by this volume

1. Complete RT facet lists for six and more boundary regions (five are settled
   by Hernandez-Cuenca 2019; the corpus record T-OP-04 is updated
   accordingly).
2. Which global invariants complete the classification begun by holonomy,
   causal class, and dimension (Corollary 4.2 gives the obstruction only for
   that triple).
3. Whether the conformal factor left free by Corollary 9.2 is physically
   irrelevant or recoverable from additional probes.
4. A determination theorem for spacetime from entanglement data (the three
   items of Remark 10.4).

## Corpus reconciliation note (T-OP-04)

The corpus (docs/theorem-registry.md T-OP-04, knowledge base C8-10) records
the holographic entropy cone for n >= 5 as open with only one infinite family
known. Review round 1 flagged that the five-region case was completed by
S. Hernandez-Cuenca, "The holographic entropy cone for five regions", Phys.
Rev. D 100, 026004 (2019). The claim was verified against INSPIRE record
1726352 and the abstract of Fadel-Hernandez-Cuenca, Phys. Rev. D 105 (2022)
086008 ("to date it has only been possible to completely characterize the HEC
for at most n=5 parties"). The paper therefore states the open problem for
n >= 6 and cites the 2019 completion. The registry record should be amended by
the series editors: T-OP-04 is resolved for n = 5 and open for n >= 6.

## Connections to other volumes

- vol-01 (foundations): uses the shared schema P = (X,O,D,S,C) and the
  claim-status vocabulary; classification-of-representations vs
  classification-of-systems distinction is assumed.
- vol-02 (structural families): instantiates Family III (smooth manifolds and
  geometric structures) and Family V (probability and measure data) exactly as
  the taxonomy defines them.
- vol-03 (irreducibility, decomposition): the geometrization decomposition is
  this volume's decomposition theorem; uniqueness caveats of DEF-022 are
  respected.
- vol-04 (Yoneda classification): the Yoneda qualification appears verbatim in
  Section 9 and constrains every probe-reconstruction claim.
- vol-05 (classical systems): the causal-order material is Family III content
  only; no symplectic claims.
- vol-07 (gauge and QFT): no dependency on claim-ledger results; Yang-Mills
  existence/mass-gap rules are untouched here.
- vol-09 (gravity, information, geometry): inherits this volume's proved
  islands (holonomy, ladder, geometrization, entropy cone) and its
  conjectural-core status labels; the RT proposal status is binding downstream.
- vol-11 (completeness and obstructions): the dimension contrast
  (Theorem 7.3, Corollary 7.4) and the invariant incompleteness
  (Corollary 4.2) are raw material for the obstruction catalogue.
- vol-12 (principia physica): the three achievement levels apply: this volume
  has formulation and rigorous theorems (levels 1-2), not physical validation.

## Dependency discipline

This volume depends on: the shared definitions (vol-01 ontology), and the
registered background results it cites. It does not depend on: RT outside its
stated settings (conditional), HaPPY as evidence about gravity (toy models),
or any statement about the entropy cone for n >= 6 (open). Registered results
used as inputs: T-BG-11, T-BG-12, T-BG-13, T-BG-17, T-BG-20, T-OB-05, with the
T-OP-04 reconciliation recorded above.
