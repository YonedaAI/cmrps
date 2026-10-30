# Lean targets: vol-10-observational-equivalence

Ten mechanization targets for the paper papers/latex/vol-10-observational-equivalence.tex.
No .lean files are written in this phase and no lake build is run; a later
phase builds the Lean package. Each target names an exact identifier and the
informal statement it must capture. Nothing here is machine-checked.

| Target name | Informal statement (matches paper) |
|---|---|
| `obs_induced_equivalence` | For a fixed observation functor, record isomorphism pulls back to an equivalence relation on systems whose classes are the record isomorphism classes of P -> [Obs(P)], with the universal quotient property (Proposition 4.2). |
| `obs_products_intersection` | The product of two observation functors induces the intersection of the two relations (Lemma 4.3). |
| `obs_coarse_graining_composition` | If Obs_c = h compose Obs_f then fine equivalence implies coarse equivalence, and the inclusion is strict (Proposition 4.5, with the four-point witness of Section 9.1). |
| `obs_composed_experiments_failure` | Under product records indistinguishability of factors is preserved; a joint experiment not determined by factor records can separate composites (Proposition 4.6, witness 11/32 against 9/32 on the diagonal event). |
| `eg_plain_tensor_insufficient` | There exist non-isomorphic finite groups with equivalent plain tensor representation categories; an equivalence forgetting the symmetric structure cannot recover the group (Theorem 3.1, Etingof-Gelaki). |
| `preserved_layer_discipline` | A candidate physical equivalence must declare preserved layers, and one omitting the symmetric monoidal layer cannot identify systems whose observable group data differ (Corollary 3.2). |
| `chentsov_fisher_uniqueness` | The Fisher metric is the unique Riemannian metric on probability simplices monotone under stochastic maps, up to constant (Theorem 5.1). |
| `petz_sudar_parametricity` | Quantum monotone metrics correspond to operator monotone f with f(1) = 1 and f(x) = x f(x^{-1}); distinct such f give distinct metrics on self-adjoint directions (Theorem 5.2). |
| `monotone_commutative_restriction` | For every normalized operator monotone f, g_f on diagonal directions equals the classical Fisher form sum a_ii^2 / lambda_i (Proposition 5.3). |
| `monotone_not_canonical` | At rho = diag(3/4,1/4) and A = sigma_x the quadratic forms of f(x) = 2x/(1+x) and h(x) = (1+x)/2 are 16/3 and 4, so numerical monotone-metric distance depends on the named f (Example 5.4, Corollary 5.5). |
