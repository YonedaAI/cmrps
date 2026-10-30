# Claim ledger: vol-08-spacetime-reconstruction

Paper: papers/latex/vol-08-spacetime-reconstruction.tex (Classification and
Reconstruction of Spacetime). One row per theorem, proposition, lemma,
corollary, and conjectural remark in the paper. Proof-status vocabulary:
proved-in-paper | conditional | conjecture | computational-evidence |
open-problem (plus "complete-informal-proof (cited)" rows, which record cited
background theorems whose full proofs live in the sources). This ledger is a
verification artifact; the .tex carries no status labels.

| Env. | Name (label) | One-line statement | Proof status | Used at |
|---|---|---|---|---|
| Definition 2.1 | Lorentzian spacetime (def:spacetime) | Connected time-orientable manifold with metric of signature (1,n-1); conformal and isometric equivalence defined | stipulative definition | throughout |
| Definition 2.2 | Causal relations (def:causal) | Chronological and causal futures I+, J+ from timelike and causal curves | stipulative definition | Sections 6, 9 |
| Definition 2.3 | The causal ladder (def:ladder) | Eight rungs from chronology to global hyperbolicity; global hyperbolicity includes causality | stipulative definition | Theorem 6.1, Table 3 |
| Definition 2.4 | Holonomy (def:holonomy) | Hol(g) and Hol0(g); decomposability as a parallel orthogonal splitting | stipulative definition | Section 5 |
| Definition 2.5 | Entropy vectors (def:entropy) | Entropies of all nonempty unions; SA, Araki-Lieb, SSA, MMI formulas | stipulative definition | Section 8 |
| Definition 2.6 | Holographic entropy cone (def:cone) | Closure of RT entropy vectors of a static classical Einstein dual; RT inequalities | stipulative definition (on a proposal) | Theorem 8.1 |
| Definition 2.7 | Reconstruction from probes (def:reconstruction) | Recovery of a target from probe data up to a declared equivalence, with class, datum, equivalence stated | stipulative definition | Section 9 |
| Definition 2.8 | Systems of this volume (def:systems) | Shared-schematic tuples with Family III geometric data and Family V entropy data | stipulative definition | Tables 4, 5 |
| Definition 2.9 | Classification problem (def:classify) | Class(Lor_n / equivalence) by complete invariants | stipulative definition | Sections 3, 4 |
| Proposition 4.1 | Shared invariants, distinct spacetimes (prop:incomplete) | Flat plane and flat cylinder share dimension, trivial holonomy, global hyperbolicity, yet are not isometric | proved-in-paper | Corollary 4.2, Table 1 |
| Corollary 4.2 | Classification by these invariants is not classification (cor:notclassifies) | Holonomy, causal class, dimension do not determine the isometry class | proved-in-paper | Table 1, Conclusion |
| Theorem 5.1 | Lorentzian holonomy classification (thm:holonomy) | Indecomposable Lorentzian Hol0 is full group, a null-line-stabilizing group, or symmetric isotropy; all entries realized | complete-informal-proof (cited: Galaev) | Table 2, Remark 5.5 |
| Proposition 5.3 | Holonomy of a product (prop:product) | Hol0 of a product metric is the product of the factor restricted holonomies | proved-in-paper | Table 2, Remark 5.5 |
| Lemma 5.4 | Restricted holonomy (lem:restricted) | Hol0 connected in SO(1,n-1); time-orientability bounds full holonomy; quotient countable | proved-in-paper | Section 5 |
| Theorem 6.1 | Completeness of the causal ladder (thm:ladder) | The rung chain is strict; global hyperbolicity is the strongest standard condition | complete-informal-proof (cited: Minguzzi-Sanchez) | Table 3, Corollary 6.5 |
| Proposition 6.3 | Finite orders satisfy the compactness rung (prop:finiteposet) | No increasing loop; order intervals finite in every finite order | proved-in-paper | Corollary 6.5, code appendix |
| Proposition 6.4 | Distinguishing fails in finite orders under the strict reading (prop:distinguish) | With I-plus/minus from strict order, the two-point antichain has equal empty pasts and futures | proved-in-paper | Corollary 6.5, code appendix |
| Corollary 6.5 | Translation dependence of the ladder on finite orders (cor:notransfer) | Rung membership depends on the translation: strict reading fails on finite orders, reflexive J-plus-minus reading is distinguishing on every antisymmetric order | proved-in-paper | Conclusion |
| Theorem 7.1 | Geometrization of closed 3-manifolds (thm:geometrization) | Canonical decomposition into pieces carrying exactly eight Thurston geometries | complete-informal-proof (cited: Perelman, Thurston) | Table 4, Corollary 7.4 |
| Proposition 7.2 | Homogeneity of the model geometries (prop:homogeneous) | Each of the eight geometries is homogeneous; maximal isometry dimension is six | proved-in-paper | Table 4 |
| Theorem 7.3 | Unrecognizability in dimension four (thm:tancer) | Recognition of the connected sum of nine S^2 x S^2 from triangulations is undecidable | complete-informal-proof (cited: Tancer) | Corollary 7.4, Conclusion |
| Corollary 7.4 | Dimension contrast (cor:dimcontrast) | Finite model tables with decomposition exist in dimension three and not algorithmically in dimension four | proved-in-paper | Abstract, Conclusion |
| Theorem 8.1 | Entropy cone for at most four regions (thm:cone) | For n in {2,3,4} the cone is cut out by SSA together with MMI; MMI facet-defining from n = 3 | complete-informal-proof (cited: Bao et al.) | Section 8, Conclusion |
| Proposition 8.2 | Monogamy is independent of strong subadditivity (prop:mmi) | Correlated triple: all SSA hold, MMI fails (4 > 3); standard counterexample of the holographic-entropy literature (Hayden-Headrick-Maloney, Bao et al.), with a self-contained derivation | proved-in-paper (expository verification of a known counterexample) | Corollary 8.3, Lemma 8.6, code appendix |
| Corollary 8.3 | Classical correlations violate monogamy (cor:classicalmmi) | MMI is not valid for general states; the cone needs both families from n = 3 | proved-in-paper | Section 8, code appendix |
| Proposition 8.4 | Two forms of monogamy (prop:mmiform) | MMI equivalent to I(A:B)+I(A:C) <= I(A:BC) and to nonpositive tripartite information | proved-in-paper | Lemma 8.5 |
| Lemma 8.5 | Strong subadditivity from subadditivity and monogamy (lem:ssaredundant) | For three single regions SSA follows from SA + MMI; n = 2 MMI vacuous, n = 4 composite SSA instances independent | proved-in-paper | Theorem 8.1 discussion |
| Lemma 8.6 | The witness satisfies every other standard inequality (lem:witnessclean) | The witness violates only MMI | proved-in-paper | Proposition 8.2 |
| Remark 8.7 | Entropy cone for six or more regions (op:cone5) | n = 5 settled (Hernandez-Cuenca 2019); facet lists open for n >= 6 | open-problem | Conclusion |
| Theorem 9.1 | Causal reconstruction of conformal geometry (thm:malament) | Chronological bijection between distinguishing spacetimes (n >= 3) is a conformal diffeomorphism | complete-informal-proof (cited: Malament, Hawking-King-McCarthy) | Table 1, Tables 6-7, Conclusion |
| Corollary 9.2 | The order does not fix the conformal factor (cor:confactor) | Conformal rescalings share the chronological order; extra probe data needed | proved-in-paper | Table 1, Conclusion |
| Lemma 9.3 | The order determines the diamond topology (lem:alexandrov) | Diamond topology from the order; equals manifold topology exactly under strong causality | complete-informal-proof (cited characterization) | Proposition 9.4 discussion |
| Proposition 9.4 | Finite orders recover their order from their topology (prop:specialization) | Up-set topology is T0; closures are down-sets; order recovered | proved-in-paper | code appendix |
| Theorem 9.5 | Entanglement-wedge reconstruction (thm:dhw) | Bulk operators in the entanglement wedge are representable on the boundary subregion in the code subspace | complete-informal-proof (cited: Dong-Harlow-Wall; quantum-information theorem) | Tables 1, 6, Conclusion |
| Remark 10.1 | The Ryu-Takayanagi proposal (rem:rt) | S(A) = area of minimal homologous surface / 4G_N; exact checks in special settings; a proposal | conjecture (proposal; conditional on the prescription) | Theorem 8.1 framing, Limitations |
| Remark 10.2 | Toy models (rem:happy) | HaPPY codes realize RT and tripartite negativity in tensor-network toys only | conjecture (toy-model evidence) | Limitations |
| Remark 10.3 | Entanglement and connectedness (rem:vanraamsdonk) | Disentangling causes pinch-off; an argument, not a theorem | conjecture (argument) | Limitations |
| Remark 10.4 | What an upgrade would require (rem:upgrade) | Three items needed for a determination theorem from entanglement data; none established | open-problem | Conclusion |

Computational evidence (never proof): entropy_inequalities.py probes rows
Proposition 8.2 and Corollary 8.3; causal_ladder_finite_posets.py probes rows
Proposition 6.3 and Proposition 6.4; alexandrov_reconstruction.py probes row
Proposition 9.4; Instances.hs types the systems of Definition 2.8. See
Appendix A of the paper and reviews/vol-08-spacetime-reconstruction-code-audit.md
when present.
