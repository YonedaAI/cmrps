# Claim ledger — vol-09-gravity-information-geometry

**Paper:** papers/latex/vol-09-gravity-information-geometry.tex (October 2026)
**Rule:** one row per theorem, proposition, lemma, corollary, and numbered claim-bearing remark. Proof-status vocabulary: proved-in-paper | conditional | conjecture | computational-evidence | open-problem (plus quoted-literature results, recorded with their source). This ledger is a verification artifact; the paper itself carries no status labels.

| Number | Name | Statement (one line) | Proof status | Where used |
|---|---|---|---|---|
| Lemma 3.1 | Fisher metric and relative entropy | D(p+u‖p) = ½ g_p(u,u) + O(‖u‖³): the Fisher metric is the second-order term of the Kullback-Leibler divergence | proved-in-paper | Sections 3, 4 (Remark 4.3), Open question 1 |
| Proposition 3.2 | Monotonicity of the Fisher metric | The Fisher family is monotone under stochastic maps | proved-in-paper | Definitions 2.3, 3.4; Section 11 (numerical check) |
| Remark 3.3 | Worked monotonicity | Concrete map and tangent with g_p(u,u) = 49/1200 ≈ 0.040833 and g_q(φu,φu) = 121/9744 ≈ 0.012418 | proved-in-paper (arithmetic) | Section 3 |
| Theorem 3.4 | Chentsov | Fisher family unique up to one shared positive constant among metric families monotone under stochastic maps | quoted literature (Chentsov 1982; Petz-Sudar 1999) | Sections 3, 4 (Proposition 4.4), 10 |
| Remark 3.5 | Fisher geometry of the simplex | p_i = y_i² identifies the Fisher metric with the round metric of radius 2 on the positive orthant | proved-in-paper | Section 6 (Corollary 6.1) |
| Theorem 4.1 | Petz-Sudar | Monotone metric families correspond bijectively (after f(1)=1) to operator monotone f with f(t)=t f(1/t) | quoted literature (Petz 1996; Petz-Sudar 1996, 1999) | Sections 4, 5, 10 |
| Proposition 4.2 | Non-uniqueness on qubit states | SLD and Wigner-Yanase metrics have radial-to-transverse ratios 4/3 and (2+√3)/3 at diag(3/4,1/4); not proportional | proved-in-paper | Sections 4, 10, 11 (numerical check), Conclusion |
| Remark 4.3 | The parameter as data | The function f is classifying data; BKM selected by relative-entropy expansion, SLD by estimation | proved-in-paper (statements) + literature selections | Section 13, Open question 1 |
| Proposition 4.4 | Commutative locus | Every normalized Petz metric restricts to the Fisher value on diagonal tangents; any monotone metric restricts to c·Fisher with c = 1/f(1) | proved-in-paper | Sections 4, 6 (Remark 6.4), 11 (numerical check), Conclusion |
| Remark 4.5 | Commmutative values | diag(3/4,1/4) with Y = σ_z/2 gives the Fisher value 4/3 for both normalized metrics | proved-in-paper (arithmetic) | Section 4 |
| Remark 4.6 | Qutrit values | Qutrit off-diagonal tangent gives 10/7 ≈ 1.4286 (SLD) and ≈ 1.5010 (WY); diagonal tangent gives 49/300 ≈ 0.163333 | proved-in-paper (arithmetic) | Section 4, Section 11 |
| Proposition 5.1 | SLD geometry of the qubit | g_sld = \|dr\|² + (r·dr)²/(1-\|r\|²); D_2° is an open hemisphere of the round S³ of radius one | proved-in-paper | Sections 5, 6, 11 (numerical check), Conclusion |
| Proposition 5.2 | Fidelity metric of the qubit | g_fid = ¼ g_sld on D_2°; fidelity geometry is an open hemisphere of S³ of radius ½ | proved-in-paper (qubit) + standard identity (Hübner 1992; Braunstein-Caves 1994) + computational-evidence for d = 3, 4 | Sections 2 (Definition 2.8), 4 (Remark 4.6), 11 |
| Corollary 6.1 | Fisher geometry of the full simplex | Full models of equal sample size are isometric; isometry group is the permutation group | proved-in-paper | Section 6 |
| Remark 6.3 | Embedded two-outcome model | The embedded two-outcome model carries the Bernoulli Fisher metric exactly | proved-in-paper | Section 6 |
| Theorem 7.1 | Gelfand-Naimark and Gelfand duality | Commutative unital C*-algebras are C(X) for X the Gelfand spectrum; duality of categories | quoted literature (Gelfand-Naimark 1943) | Sections 7, 10 |
| Theorem 7.2 | Stone duality | Boolean algebras dual to compact totally disconnected Hausdorff spaces | quoted literature (Stone 1937) | Sections 7, 10 |
| Theorem 7.5 | Entanglement-wedge reconstruction | Bulk operators in W(A) reconstruct as boundary operators on the code subspace | quoted literature (Dong-Harlow-Wall 2016), hypotheses stated | Sections 7, 8, 10, 12 |
| Theorem 8.4 | Holographic entropy cone | SA/AL/MMI generate the complete cone for N ≤ 4; five further five-party orbits for N = 5; N ≥ 6 open | quoted literature (Bao et al. 2015; Hernández-Cuenca 2019) | Sections 8, 10, 13 |
| Proposition 9.1 | Ideal gas | Ruppeiner metric of the ideal gas at fixed N is flat | proved-in-paper | Sections 9, 11 (symbolic check), Conclusion |
| Remarks 8.1, 8.2, 8.3 | RT, connectivity, toy models | Ryu-Takayanagi proposal, Van Raamsdonk argument, HaPPY codes | proposals and arguments (recorded as such; derived special cases cited) | Sections 8, 10, 13 |
| Remarks 10.1, 10.2 | Proposed correspondence; structure-preserving discipline | Three-entry dictionary proposed; preserved layers not stated by any entry | proposed (no proof claimed) | Sections 10, 14 |
| Section 11 | Computational evidence | Numerical checks of Propositions 3.2, 4.2, 4.4, 5.1, 5.2, 9.1 | computational-evidence (never proof) | Section 12 (code evidence appendix) |

**Summary:** proved-in-paper: 11 numbered results (Lemma 3.1, Propositions 3.2, 4.2, 4.4, 5.1, 5.2, 9.1, Corollary 6.1, Remarks 3.3, 3.5, 4.5/4.6 arithmetic, 6.3). Quoted from the literature with hypotheses: Theorems 3.4, 4.1, 7.1, 7.2, 7.5, 8.4. Conjectural or proposed: the Ryu-Takayanagi formula in general settings, the emergence of spacetime from entanglement, the gravity-information correspondence, weighted-nerve continuum convergence. Nothing in the paper is machine-checked; nothing is labeled inside the .tex.
