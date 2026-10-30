# Claim ledger: vol-05-classical-systems

Verification artifact for `papers/latex/vol-05-classical-systems.tex` (Classification of Classical Physical Systems, Part 5 of CMRPS). One row per theorem, proposition, lemma, and corollary of the paper, plus the computational claims. Statuses: `proved-in-paper` (complete proof in the paper), `complete-informal-proof (cited)` (established literature result, proof by reference with the citation attached in the paper), `computational-evidence` (Phase D run, never proof). Numbering matches the compiled paper.

| Name | One-line statement | Status | Where used |
|---|---|---|---|
| Lemma 3.1 (Linearization at a point) | A symplectic form is standard at a point in suitable coordinates | proved-in-paper | Proof of Theorem 3.3 |
| Lemma 3.2 (Moser trick on a ball) | An exact family of symplectic forms on a ball is trivialized by an isotopy of a smaller concentric ball | proved-in-paper | Theorem 3.3, Theorem 5.1 |
| Theorem 3.3 (Darboux) | Every symplectic manifold is locally symplectomorphic to the standard space of the same dimension | proved-in-paper | Corollary 3.4, Sections 5 and 10 |
| Corollary 3.4 (Absence of local invariants) | Every local symplectic invariant is constant on connected components; classification content is global | proved-in-paper | Introduction, Section 5, Conclusion |
| Theorem 4.1 (Weinstein splitting) | Near a rank-2k point a Poisson manifold splits as symplectic times transverse Poisson with vanishing tensor at the base point | complete-informal-proof (cited: Weinstein 1983; proof sketch in paper) | Example 4.3, Section 10 |
| Proposition 4.2 (Leaf foliation) | A Poisson manifold is foliated by symplectic leaves carrying the inverse bracket | complete-informal-proof (cited: Weinstein 1983) | Section 4 |
| Theorem 4.4 (Kirillov-Kostant-Souriau form) | Coadjoint orbits carry a canonical invariant symplectic form | complete-informal-proof (cited: Kirillov 1976; proof in paper) | Theorem 6.2, Examples 6.3 and 7.6, Section 10 |
| Proposition 4.5 (Casimir functions) | Functions constant on the leaves are the Poisson-central functions; on so(3)* the Casimir is the squared norm | proved-in-paper | Example 7.6 |
| Theorem 5.1 (Moser stability) | A family of symplectic forms on a closed manifold with constant cohomology class is trivialized by an isotopy | proved-in-paper | Examples 5.3 and 5.4, Corollary 5.2 |
| Corollary 5.2 (Refinement of diffeomorphism data) | Symplectomorphism classes form a finer partition than diffeomorphism type together with the orbit of the cohomology class | proved-in-paper | Section 5, Section 11 |
| Proposition 5.7 (Gromov width) | The Gromov width is a symplectic capacity | complete-informal-proof (cited: Gromov 1985) | Section 5 |
| Theorem 5.8 (Gromov nonsqueezing) | A symplectic ball embeds into a cylinder only when the ball radius does not exceed the cylinder radius | complete-informal-proof (cited: Gromov 1985) | Section 5 |
| Theorem 6.2 (Coadjoint orbits of compact semisimple groups) | Orbits are parameterized by the positive Weyl chamber; dominant integral weights select the integral orbits (Borel-Weil) | complete-informal-proof (cited: Humphreys 1972, Kirillov 1976) | Introduction, Table 2, Example 6.3, Example 7.6 |
| Theorem 7.2 (Liouville-Arnold) | Compact connected regular level sets of integrable systems are tori with local action-angle coordinates | complete-informal-proof (cited: Arnold 1978) | Proposition 7.3, Examples 7.5 and 7.6, Section 9 |
| Proposition 7.3 (Action variables are periods) | Action variables are periods of a primitive of the symplectic form, defined up to a shift by H^1 period vectors | proved-in-paper | Section 7 |
| Proposition 7.4 (Monodromy obstruction) | Nontrivial monodromy of the period lattice obstructs global action-angle coordinates | complete-informal-proof (cited: Duistermaat 1980) | Example 7.5, Sections 9 and 11 |
| Theorem 7.7 (Nekhoroshev estimate) | Action drift is at most c epsilon^b on the exponential time scale exp(c epsilon^{-a}) for steep integrable systems | complete-informal-proof (cited: Nekhoroshev 1977) | Section 7 |
| Theorem 8.4 (Chentsov) | Across all finite simplices the unique monotone metric family up to scale is the Fisher metric | complete-informal-proof (cited: Chentsov 1982; proof structure in paper) | Corollary 8.7, Section 10, Conclusion |
| Lemma 8.5 (Equality along sufficient statistics) | A stochastic map with stochastic left inverse is an isometry for every monotone metric | proved-in-paper | Example 8.6, proof of Theorem 8.4 |
| Corollary 8.7 (Fisher metric as classifying invariant) | The Fisher metric up to scale is the classifying invariant of the classical statistical family | proved-in-paper | Table 1, Conclusion |
| Proposition 8.9 (Product of statistical models) | The Fisher metric of a product of probability vectors is the direct sum of the factor metrics | proved-in-paper | Section 9 |
| Theorem 8.10 (Petz-Sudar parametric classification) | Quantum monotone metrics are classified by operator monotone functions with f(1)=1 and f(t)=t f(1/t); the family is parametric, not unique | complete-informal-proof (cited: Petz and Sudar 2001) | Introduction, Section 11, Conclusion |
| Proposition 9.2 (Irreducibility of symplectic surfaces) | Closed symplectic surfaces are irreducible for the product composition | proved-in-paper | Section 9 |
| Proposition 9.3 (Symplectic reduction) | At a regular value with free proper isotropy action the reduced space is symplectic with unique reduced form and dynamics | complete-informal-proof (cited: Marsden and Weinstein 1974) | Example 9.4, Proposition 9.5 |
| Proposition 9.5 (Reduction of products) | Reduction commutes with product composition along the factor carrying no symmetry | proved-in-paper | Section 9 |
| Theorem 9.8 (Delzant) | Compact connected toric symplectic manifolds are classified by Delzant polytopes up to torus automorphism and translation | complete-informal-proof (cited: Delzant 1988) | Examples 5.5 and 9.9, Tables 1 and 2, Section 11 |
| Computational claim 1 (Darboux chart experiment) | The Moser homotopy produces a Darboux chart on the tested perturbed form with residual 2.4e-15 | computational-evidence | Section 10, Appendix A row 1 |
| Computational claim 2 (Rank stratification experiment) | The Lie-Poisson tensor on so(3)* has rank 2 on the spheres and rank 0 at the origin | computational-evidence | Section 10, Appendix A row 2 |
| Computational claim 3 (Fisher monotonicity experiment) | The Fisher metric pullback along random stochastic maps is monotone on 200 sampled trials | computational-evidence | Section 10, Appendix A row 3 |

Notes. (1) No claim in this ledger is machine-checked; the companion Haskell models are executable evidence and the Lean target file is a mechanization plan, not a development. (2) Theorem 4.1 is consumed as a product decomposition; the paper states explicitly that it does not linearize the transverse factor. (3) The deformation-quantization bridge to quantum theory appears nowhere as a dependency; the paper states it as a conjectural program in Section 11.
