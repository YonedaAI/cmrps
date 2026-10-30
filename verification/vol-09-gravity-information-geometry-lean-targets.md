# Lean mechanization targets — vol-09-gravity-information-geometry

**Paper:** papers/latex/vol-09-gravity-information-geometry.tex
**Status:** target list only. No .lean files are written in this phase, and `lake` is never run. A later phase builds the Lean package against these names. Nothing here is machine-checked yet.

Ten targets, names mirroring the paper's statements and the identifiers in src/vol-09-gravity-information-geometry/Instances.hs.

1. `fisher_monotone_under_stochastic_maps`
   For every stochastic matrix φ and tangent vector u at an interior point p, the Fisher quadratic form satisfies g_{φp}(φu, φu) ≤ g_p(u, u). (Paper, Proposition 3.2.)

2. `fisher_second_order_kl`
   The Kullback-Leibler divergence satisfies D(p+u ‖ p) = ½ g_p(u,u) + O(‖u‖³) at interior p with Σ u_i = 0. (Paper, Lemma 3.1.)

3. `chentsov_uniqueness_classical`
   A metric family on the probability simplices that is monotone under stochastic maps equals c · Fisher for a single constant c > 0 shared across dimensions. (Paper, Theorem 3.4; cited literature, hypotheses as stated.)

4. `petz_sudar_parametric_classification`
   Monotone metric families on finite-dimensional state spaces correspond to operator monotone f with f(t) = t f(1/t), normalized by f(1) = 1, via the Petz formula. (Paper, Theorem 4.1; cited literature.)

5. `quantum_monotone_metrics_not_unique`
   At ρ = diag(3/4, 1/4) the symmetric logarithmic derivative and Wigner-Yanase metrics give radial-to-transverse ratios 4/3 and (2+√3)/3 on X = σ_x/2, Y = σ_z/2, hence are not proportional. (Paper, Proposition 4.2.)

6. `monotone_metrics_restrict_to_fisher_on_commutative_locus`
   For diagonal ρ and diagonal X, the Petz metric value is Σ X_{ii}²/λ_i for every normalized f. (Paper, Proposition 4.4.)

7. `sld_qubit_round_hemisphere`
   In Bloch coordinates the symmetric logarithmic derivative metric equals |dr|² + (r·dr)²/(1-|r|²), and under r = sin χ the open state space is an open hemisphere of the round three-sphere of radius one. (Paper, Proposition 5.1.)

8. `fidelity_metric_quarter_sld`
   In the normalization d_B² = 2(1-√F) the fidelity metric equals one quarter of the symmetric logarithmic derivative metric. (Paper, Definition 2.8 and Proposition 5.2; verified computationally in dimensions two to four.)

9. `ideal_gas_ruppeiner_flat`
   At fixed N the Ruppeiner metric of the ideal gas entropy S = Nk(c_v log U + log V - (c_v+1) log N + const) is flat: its Ricci scalar vanishes. (Paper, Proposition 9.1.)

10. `holographic_entropy_cone_leq4`
    For N = 2, 3, 4 boundary subregions of a static holographic state purified by a complement, subadditivity, Araki-Lieb, and monogamy of mutual information generate the complete set of linear entropy inequalities. (Paper, Theorem 8.4; cited literature.)
