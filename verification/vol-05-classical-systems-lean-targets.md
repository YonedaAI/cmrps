# Lean mechanization targets: vol-05-classical-systems

Ten targets for a later Lean 4 + Mathlib development (this file is a plan; no `.lean` files are written and `lake` is never run in this phase). Names match the witness functions of `src/vol-05-classical-systems/Instances.hs` and the results of `papers/latex/vol-05-classical-systems.tex`.

1. **Darboux** (paper, Theorem 3.3; Haskell `darboux`)
   Every symplectic manifold of dimension 2n is locally symplectomorphic to (R^{2n}, omega_0) with omega_0 = sum_i dx_i wedge dy_i.

2. **WeinsteinSplitting** (paper, Theorem 4.1; Haskell `weinsteinSplitting`)
   Near a point of rank 2k, a Poisson manifold is locally isomorphic to a product of a symplectic manifold of dimension 2k and a transverse Poisson manifold whose tensor vanishes at the base point.

3. **KKSSymplectic** (paper, Theorem 4.4; Haskell `kksSymplecticForm`)
   A coadjoint orbit of a Lie group carries the symplectic form given at xi by omega_xi(ad*_x xi, ad*_y xi) = <xi, [x, y]>, and the coadjoint action preserves it.

4. **MoserStability** (paper, Theorem 5.1 and Lemma 3.2; Haskell `moserStableFamily`)
   A smooth family of symplectic forms on a closed manifold whose cohomology class is constant is trivialized by an isotopy; on a ball the same holds on a smaller concentric ball.

5. **LiouvilleArnold** (paper, Theorem 7.2)
   A compact connected regular level set of n commuting independent Hamiltonians on a symplectic manifold of dimension 2n is diffeomorphic to an n-torus and has a neighborhood with action-angle coordinates.

6. **MonodromyObstruction** (paper, Proposition 7.4; Haskell `pendulumMonodromy`)
   Nontrivial monodromy of the period lattice of a torus fibration obstructs the existence of global action-angle coordinates; the spherical pendulum has monodromy matrix [[1, 1], [0, 1]].

7. **ChentsovFisher** (paper, Theorem 8.4)
   A family of Riemannian metrics on the open simplices of all dimensions that is invariant under sufficient statistics and monotone under stochastic maps equals a positive constant times the Fisher metric family.

8. **FisherExplicit** (paper, Definition 8.1 and Proposition 8.9; Haskell `fisherMetric`)
   The Fisher metric on the open simplex has components g_p(u, v) = sum_i u_i v_i / p_i, and the metric of a product of probability vectors is the direct sum of the factor metrics.

9. **CoadjointOrbitWeyl** (paper, Theorem 6.2)
   Coadjoint orbits of a compact connected semisimple group are parameterized by the closed positive Weyl chamber; the dominant integral weights form the sublattice of integral (quantizable) orbits carrying finite-dimensional irreducible representations.

10. **DelzantPolytope** (paper, Theorem 9.8)
    The momentum image of a compact connected toric symplectic manifold is a Delzant polytope; two such manifolds are equivariantly symplectomorphic up to torus automorphism exactly when their polytopes are related by GL(n; Z) acting with translations.

Status of every target within the series: none is machine-checked in the CMRPS formal library. The classification vocabulary of `src/Taxonomy/` supplies the surrounding definitions; these targets are the mathematical statements a future kernel-checked development must reproduce.
