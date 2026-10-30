# Lean targets: vol-06-quantum-systems

Paper: papers/latex/vol-06-quantum-systems.tex. Mechanization targets for a later kernel-checked development in `lean/Cmrps/`. At most ten targets, exact names, informal statements matching the paper's numbered results. Nothing here is machine-checked within the CMRPS library; all Lean module fields in the series registry remain empty, and the Haskell in `src/vol-06-quantum-systems/` is computational evidence only.

| Target name | Informal statement | Paper source | Mirrored code |
|---|---|---|---|
| `finite_dim_cstar_decomposition` | Every finite-dimensional complex C*-algebra is *-isomorphic to a finite direct sum of full matrix algebras | Theorem 3.1 | Instances.hs, FiniteDimCStar |
| `finite_dim_cstar_dimensionVector_classifies` | Two finite-dimensional complex C*-algebras are *-isomorphic exactly when their dimension vectors agree as multisets | Theorem 3.1 and Corollary 3.2 | Instances.hs, dimensionVector, isomorphicByDimensionVector |
| `findim_unique_decomposition` | Decompositions of a finite-dimensional C*-algebra into irreducible direct summands exist and are unique up to order and unitary equivalence | Proposition 3.10 | Instances.hs, decomposition |
| `choi_kraus_normal_form` | A linear map between matrix algebras is completely positive exactly when its Choi matrix is positive, and then it is a sum of conjugations with minimal count the Choi rank | Lemma 6.1 and Theorem 6.4 | stinespring_kraus_rank.py, choi_matrix, kraus_rank |
| `stinespring_minimal_dilation_unique` | Every channel has a dilation through an environment, minimal dilations are unique up to unitary on the environment, and the minimal environment dimension equals the Kraus rank | Theorem 6.6 | Instances.hs, stinespringDilationDim |
| `kraus_rank_normal_form` | Kraus rank is preserved by unitary changes of Kraus presentation and is not a complete invariant of channels | Proposition 6.8 | stinespring_kraus_rank.py, minimize_kraus, same_rank_distinct_channels |
| `mcduff_uncountable_II1` | There exist uncountably many pairwise non-isomorphic separable type II_1 factors | Theorem 5.1 | Instances.hs, mcduffWitness (vocabulary only) |
| `dr_reconstruction` | Under the DHR hypotheses the symmetric tensor *-category with conjugates, direct sums, subobjects, and scalar endomorphisms of the unit is the representation category of a compact supergroup, unique up to isomorphism | Theorem 7.2 | Instances.hs, SuperselectionSystem |
| `deligne_symmetric_tensor` | A C-linear, abelian, rigid symmetric tensor category of subexponential growth in characteristic zero is the representation category of an affine supergroup scheme | Theorem 7.5 | (no executable model) |
| `petz_monotone_metrics` | Monotone metrics on density matrices correspond bijectively to operator monotone functions normalized by f(t) = t f(1/t) | Theorem 8.3 | petz_monotone_metrics.py, petz_metric, OPERATOR_MONOTONE |

Status of every row: proposed target, not developed. A future kernel-checked build must supply the analytic input for the operator-algebraic targets (`mcduff_uncountable_II1`, `dr_reconstruction`, `deligne_symmetric_tensor`) from the cited sources; the finite-dimensional and channel targets are self-contained and match the executable models listed.
