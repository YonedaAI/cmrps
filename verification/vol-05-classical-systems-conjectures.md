# Conjectures and unproved statements: vol-05-classical-systems

Numbered `C-<n>` statements of `papers/latex/vol-05-classical-systems.tex` that
are NOT proved inside `lean/Cmrps/Vol05ClassicalSystems.lean`. Each is recorded
as text with the reason it was not formalized. Several are established theorems
of the literature (marked `complete-informal-proof (cited)` in the claim-status
file) and appear here only because no Lean proof exists in this module.

- **C-1.** (Darboux, Thm. 3.3, target 1) Every symplectic manifold `(M^{2n}, ω)`
  has a neighborhood of each point `p` diffeomorphic to an open subset of
  `(ℝ^{2n}, ω₀)` by a map pulling `ω₀` back to `ω`. Not formalized: the module
  has no smooth manifolds, differential forms, or isotopies; only the linear
  model (`stdSymplecticForm`) and the partner-vector step of Lemma 3.1
  (`exists_symplectic_partner`) are machine-checked.

- **C-2.** (Weinstein splitting, Thm. 4.1, target 2) Near a point of rank `2k`
  a Poisson manifold is Poisson-diffeomorphic to a product of a `2k`-dimensional
  symplectic factor and a transverse Poisson factor vanishing at the base point.
  Not formalized: requires bivector fields, the Schouten–Nijenhuis bracket, and
  local normal forms.

- **C-3.** (Moser stability, Thm. 5.1 and Lemma 3.2, target 4) A smooth family
  `ω_t` of symplectic forms on a closed manifold with constant cohomology class
  is trivialized by an isotopy; on a ball the same holds on a smaller concentric
  ball. Not formalized: needs smooth isotopies, ODE existence for time-dependent
  vector fields, and the homotopy operator.

- **C-4.** (Liouville–Arnold, Thm. 7.2, target 5) A compact connected regular
  level set of `n` commuting independent Hamiltonians on a `2n`-dimensional
  symplectic manifold is diffeomorphic to `T^n`, with a neighborhood carrying
  action-angle coordinates. Not formalized.

- **C-5.** (Chentsov, Thm. 8.4, target 7) A family of metrics on the open
  simplices of all dimensions, monotone under stochastic maps and isometric
  along sufficient statistics, equals `c · g_Fisher` for one constant `c > 0`.
  Not formalized: the uniqueness direction (reduction to `f(p)` and
  cross-dimension constancy). The monotonicity direction IS machine-checked
  (`fisherMetric_monotone`) and the equality case along sufficient statistics IS
  machine-checked (`monotoneMetric_equality_of_leftInverse`).

- **C-6.** (KKS invariance, Thm. 4.4, target 3) The KKS form on a coadjoint
  orbit is `G`-invariant, nondegenerate on the orbit, and inverse to the
  Lie–Poisson structure restricted to the orbit. Not formalized: needs group
  actions and orbit manifolds. The alternating property and descent to
  `g / g_ξ` ARE machine-checked.

- **C-7.** (Monodromy obstruction, Prop. 7.4, target 6) Nontrivial monodromy of
  the period lattice of a torus fibration obstructs global action-angle
  coordinates; the spherical pendulum has monodromy `[[1, 1], [0, 1]]`. The
  matrix and its properties (det 1, unipotent, not the identity) ARE
  machine-checked; the obstruction implication and the pendulum computation are
  not (cited: Duistermaat 1980).

- **C-8.** (Coadjoint orbits of compact semisimple groups, Thm. 6.2, target 9)
  Coadjoint orbits are parameterized by the closed positive Weyl chamber; the
  dominant integral weights form the sublattice of integral orbits carrying
  finite-dimensional irreducible representations. Not formalized: needs the
  Killing–Cartan classification and Borel–Weil.

- **C-9.** (Delzant, Thm. 9.8, target 10) The momentum image of a compact
  connected toric symplectic manifold is a Delzant polytope, and two such
  manifolds are equivariantly symplectomorphic up to torus automorphism exactly
  when their polytopes are related by `GL(n; ℤ)` with translations. Not
  formalized.

- **C-10.** (Deformation-quantization bridge, §11) Deformation quantization
  connects the symplectic family to the operator-algebra family in a sense
  stronger than a programmatic correspondence. This is the paper's explicit
  conjecture; every statement crossing the classical/quantum boundary
  (including the Petz–Sudar contrast, Thm. 8.10) is CONDITIONAL on it.

- **C-11.** (Global classification, §11 open question 1) The invariants
  `[ω]`, characteristic classes, and capacities complete the classification of
  closed symplectic manifolds in dimension four. Open problem; the paper claims
  no classification beyond surfaces and the toric subclass.

- **C-12.** (Decomposition uniqueness, §11 open question 2 and Remark 9.6)
  Which subclasses of classical systems admit unique decomposition into
  `C`-irreducible factors. Open problem; monodromy (C-7) is the exhibited
  obstruction inside the integrable subclass.
