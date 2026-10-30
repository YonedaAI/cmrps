# Lean mechanization targets: vol-08-spacetime-reconstruction

Volume: Classification and Reconstruction of Spacetime (Part 8 of CMRPS).
Written 2026-10-30. At most ten targets, exact names plus informal statements
matching the paper's definitions and theorems. These are targets only: no
`.lean` file exists in this run, `lake` was never invoked, and nothing in this
volume is machine-checked. Claim-status labels follow docs/theorem-registry.md.

| # | Target name | Paper source | Informal statement | Status target |
|---|---|---|---|---|
| 1 | `lorentzian_holonomy_classification` | Theorem 3.1 (thm:holonomy) | For a connected simply connected indecomposable Lorentzian manifold of signature (1,n-1), the restricted holonomy group is the full special orthogonal group, a null-line-stabilizing group embedding in sim(n-2), or the isotropy holonomy of a locally symmetric space; every entry is realized by a metric. | complete-informal-proof in Galaev; target = formal statement of the trichotomy |
| 2 | `holonomy_product_rule` | Proposition 3.2 (prop:product) | The restricted holonomy of a product pseudo-Riemannian metric equals the product of the restricted holonomies of the factors. | complete-informal-proof in paper (Ambrose-Singer); target = formal group identity |
| 3 | `causal_ladder_completeness` | Theorem 4.1 (thm:ladder) | The causality conditions from chronology to global hyperbolicity (causal + compact diamonds) form a strict chain; each implication is witnessed by a separating spacetime. | complete-informal-proof in Minguzzi-Sanchez; target = implication chain + strictness |
| 4 | `ladder_nontransfer_finite_orders` | Proposition 4.2, Proposition 4.3, Corollary 4.4 | Every finite poset satisfies the order-theoretic compactness rung and has no increasing loop, while the two-point antichain fails distinguishing; rung membership therefore does not transfer from Lorentzian manifolds to finite orders. | proved in paper; target = finite-order theorem over posets |
| 5 | `geometrization_dim3` | Theorem 5.1 (thm:geometrization) | Every closed 3-manifold decomposes canonically into pieces each carrying one of exactly eight Thurston model geometries. | complete-informal-proof (Perelman); target = statement with the eight-geometry type |
| 6 | `tancer_unrecognizability_dim4` | Theorem 5.2 (thm:tancer) | The recognition problem for closed 4-manifolds given by finite triangulations is algorithmically undecidable; the connected sum of nine copies of S^2 x S^2 is unrecognizable. | complete-informal-proof (Tancer); target = undecidability statement |
| 7 | `entropy_cone_n_le_4` | Theorem 7.1 (thm:cone) | For 2, 3, and 4 boundary regions the holographic entropy cone is the polyhedral cone cut out by strong subadditivity together with monogamy of mutual information, and the number of independent RT inequalities is finite for each fixed region count. | complete-informal-proof (Bao et al.); target = polyhedral characterization |
| 8 | `mmi_independent_of_ssa` | Proposition 7.2 (prop:mmi), Lemma 7.5 | The entropy vector of a perfectly correlated triple satisfies every strong subadditivity inequality and violates monogamy of mutual information, so monogamy is not implied by strong subadditivity over entropic vectors; strong subadditivity follows from subadditivity and monogamy. | proved in paper; target = witness vector computation + independence |
| 9 | `malament_causal_reconstruction` | Theorem 8.1 (thm:malament) | A chronological-order-preserving bijection between time-oriented distinguishing spacetimes of dimension at least three is a diffeomorphism and a conformal isometry. | complete-informal-proof (Malament; smooth upgrade Hawking-King-McCarthy); target = order-to-conformal theorem |
| 10 | `specialization_order_recovery` | Proposition 8.4 (prop:specialization) | The up-set topology of a finite order is T0, the closure of each singleton is its down-set, and the order is recovered from the closures. | proved in paper; target = finite-order topology theorem |

Notes on scope:

- Target 8 is the volume's own computational and formal content; its Python
  probe is `src/vol-08-spacetime-reconstruction/entropy_inequalities.py`, and
  its Haskell mirror is `mmiIndependentOfSSA` in `Instances.hs`.
- Target 4's probes are `src/vol-08-spacetime-reconstruction/causal_ladder_finite_posets.py`.
- Targets 1, 3, 5, 6, 7, 9 formalize cited theorems; their proof skeletons are
  in the paper as argument-structure paragraphs and the full proofs are in the
  cited sources. A later Lean phase should import the cited statements with
  explicit hypotheses rather than re-prove them.
- Haskell under `src/` is executable modeling evidence cross-audited against
  these informal specifications. It is never "verified by Lean".
