# Claim ledger: vol-10-observational-equivalence

Paper: papers/latex/vol-10-observational-equivalence.tex (Observational Equivalence
and Physical Distinguishability, Part 10 of CMRPS). One row per numbered
theorem, proposition, lemma, corollary, and example. Proof-status vocabulary:
proved-in-paper / conditional / conjecture / computational-evidence /
open-problem, extended by complete-informal-proof for statements cited from the
literature (series vocabulary, docs/theorem-registry.md). Claim-status labels do
not appear in the .tex prose.

| Name | Statement (one line) | Proof status | Where used |
|---|---|---|---|
| Definition 2.1 (system record) | A system representation is a tuple P = (X, O, D, S, C) of state space, observables, dynamics, symmetries, composition rules | stipulative definition (series object schema) | Sections 2.5, 9.1, 9.2 |
| Definition 2.2 (mathematical equivalence) | P = Q when the tuples are isomorphic componentwise | definition (established notion) | Definitions 2.4, 2.5; Sections 6, 11 |
| Definition 2.3 (physical equivalence) | P ~ Q is a chosen equivalence relation used for the classification quotient | definition (stipulative; choice open) | Definition 2.5; Section 11 |
| Definition 2.4 (observational equivalence) | P approx Q when the observation records are isomorphic | definition | Proposition 4.2; Sections 8.2, 8.3 |
| Definition 2.5 (admissible candidate relation) | A candidate ~ must satisfy inclusion in [iso] and contain the intersection of admissible observational relations | definition (admissibility criterion) | Section 6.1; Section 11 |
| Definition 2.6 (equivalence witness) | An identification records its notion, morphism kind, and preserved layers | definition | Corollary 3.2; Section 11 |
| Definition 2.7 (morphism kinds on records) | Coarse-graining, embedding, duality, limits act on records as stated | definition | Sections 4.2, 8.2 |
| Theorem 3.1 (plain tensor equivalence does not recover the group) | Non-isomorphic finite groups have equivalent plain tensor representation categories | complete-informal-proof (literature; Etingof-Gelaki, arXiv:math/0007196) | Corollary 3.2; Tables 2, 3; Sections 6, 9.3, 11 |
| Corollary 3.2 (preserved-layer discipline) | A candidate physical equivalence must name preserved layers; omitting the symmetric layer misidentifies systems with different observable group data | proved-in-paper (from Theorem 3.1) | Sections 6.1, 11 |
| Remark 3.3 (scope) | With symmetric structure restored, reconstruction of a compact supergroup holds under its hypotheses | complete-informal-proof (literature; Doplicher-Roberts) | Section 3.2 |
| Definition 4.1 (observation functor) | Functor from admissible systems to a category of observation records | definition (proposal; corpus names, does not define) | Propositions 4.2, 4.5, 4.6; Sections 8, 9.1 |
| Proposition 4.2 (induced relation) | Observational equivalence is an equivalence relation; classes are record isomorphism classes; universal quotient property | proved-in-paper | Lemma 4.3; Sections 5.4, 8.2, 8.3, 11.1 |
| Lemma 4.3 (products of observations) | Product functor induces the intersection of the factor relations | proved-in-paper | Section 5.4; Section 11 |
| Definition 4.4 (coarse and fine observations) | Coarsening = factorization Obs_c = h compose Obs_f; coarse-grained observation = Obs compose c | definition | Proposition 4.5; Section 8.2 |
| Proposition 4.5 (coarse records separate less) | Fine equivalence implies coarse equivalence; inclusion can be strict | proved-in-paper (explicit four-point witness) + computational cross-check (observation_quotient.py) | Sections 8.2, 11; Table 3; Table 4 row 1-2 |
| Proposition 4.6 (composed experiments) | Indistinguishability composes under product records and can fail under joint experiments | proved-in-paper (explicit bipartite witness: 11/32 vs 9/32) | Sections 8.2, 11.1 |
| Theorem 5.1 (Chentsov) | Fisher metric is the unique (up to constant) monotone Riemannian metric on probability simplices | complete-informal-proof (literature; Petz-Sudar, arXiv:quant-ph/0102132) | Sections 5.1, 5.4, 9.2 |
| Theorem 5.2 (Petz-Sudar classification) | Quantum monotone metrics are parametrically classified by self-reciprocal operator monotone functions | complete-informal-proof (literature; arXiv:quant-ph/0102132) | Sections 5.2-5.4 |
| Proposition 5.3 (commutative restriction) | On diagonal directions every normalized monotone metric gives the classical Fisher form | proved-in-paper (one-line computation) | Sections 5.2, 9.2; Table 4 row 2 |
| Example 5.4 (two monotone metrics disagree) | At rho = diag(3/4,1/4), A = sigma_x: g_f = 16/3 for f = 2x/(1+x), g_h = 4 for h = (1+x)/2 | proved-in-paper (arithmetic) + computational cross-check (monotone_metric_contrast.py) | Corollary 5.5; Sections 6, 9.2, 10; Table 3 row 3 |
| Corollary 5.5 (ruler dependence) | Numerical monotone-metric distance depends on the named f; zero-distance relation does not | proved-in-paper (from Example 5.4 and Theorem 5.2) | Sections 5.4, 11 |
| Definition 8.1 (empirical layer) | Layer three instantiated as the observation functor into the record category | definition | Sections 8.2, 8.3 |
| Section 9.1 (finite classical classes) | Coarse class of p is a 2-dim slice; fine class over two experiments is a segment; third experiment reduces classes to points | proved-in-paper (explicit computation) | Section 4.2 witness (data), Section 8.2 |
| Section 9.3 (groups of order 8) | D8 and Q8 share character tables as matrices and differ on element orders | computational-evidence (proved by the finite computation in invariant_coarseness.py) | Section 6 Table 3 row 2 (context); Section 10 |

Notes. (1) Registry mapping for cross-volume consistency (series records used
as inputs): T-OB-02 = Theorem 3.1 (Etingof-Gelaki, DEP-007 applies); T-BG-14 =
Theorem 5.1 and T-BG-18 = Theorem 5.2 (DEP-008 applies: classical uniqueness
may not be extended to the quantum case). Ontology objects: DEF-002 = Definition
2.1; DEF-008 to DEF-013 = Section 2.4; DEF-015 to DEF-018 = Definitions 2.2 to
2.6 and Section 3; DEF-042 layer E = Definition 8.1. (2) No claim in this paper
is machine-checked; the Haskell module is an executable taxonomy model only.
(3) Open-problem rows: the correct choice of physical equivalence, the contents
of the record category under interaction, and the positive reconstruction
criterion remain open (Sections 8.2, 11.1).
