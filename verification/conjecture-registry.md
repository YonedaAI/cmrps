# Conjecture registry

Every `C-<n>` item from the per-topic `verification/<topic>-conjectures.md` files,
with where it is used or referenced. These statements are **not** machine-checked:
they are text, and no Lean module references them. (Conjecture numbers restart per
volume; use the volume prefix to disambiguate.)

| ID | Title | Where used / referenced |
|---|---|---|
| `vol-01-foundations/C-1` | Structural classification (Conjecture 9.2 of the paper) | Definition 3.16; Section 9 |
| `vol-01-foundations/C-2` | One category or many (question of Corollary 4.5) | compositionNotTyped; Definition 4.2; Proposition 4.4; Proposition 4.6; Corollary 4.5 |
| `vol-01-foundations/C-3` | Formalization of Theorem 8.2 claim 3 (component multisets classify) | Cmrps.Vol01Foundations.lean; components_exist; components_unique; Theorem 8.2 |
| `vol-01-foundations/C-4` | Unitarity of the change of factorisation `W` (Proposition 7.6) | changeFactorization; changeFactorization_involutive; Proposition 7.6; Proposition 7.6. |
| `vol-02-structural-families/C-1` | Chevalley constructibility (input to `sharpness_criterion` part 3) | FamilyRecord.sharpness_injects_into_superset; Theorem 3.2 |
| `vol-02-structural-families/C-2` | PU(2) parametrization of unitary channels of `M₂(ℂ)` (input to `kraus_rank_not_injective`) | Kraus.kraus_rank_not_injective; Proposition 11.2. |
| `vol-02-structural-families/C-3` | Gelfand anti-equivalence (input to `invariants_not_independence` instance) | not_independent_of_reconstructable; invariants_not_independence; Proposition 16.2. |
| `vol-02-structural-families/C-4` | Wedderburn structure theorem for finite-dimensional unital complex C*-algebras (input to `dim_vector_classification`, `induced_dimension_vector`) | dimVector_finite; Theorem 7.1 |
| `vol-02-structural-families/C-5` | Matrix algebra tensor identity (input to `induced_dimension_vector`) | DimensionVector.totalDim_tensor; DimensionVector.tensor; Proposition 4.2 |
| `vol-02-structural-families/C-6` | Darboux's theorem (input to `globality_symplectic`) | globality_symplectic; SymplecticGermField.darboux; conditional; Proposition 3.4. |
| `vol-04-yoneda-classification/C-1` | Representability does not imply classifiability (paper Theorem 3.9) | yoneda_fully_faithful; ParametrizedByFiniteVariety; Invariant; FiniteVarietyType; Definition 3.8 |
| `vol-04-yoneda-classification/C-2` | Supermap representability (paper Theorem 4.3, conditional) | choi_correspondence; choi_composition |
| `vol-04-yoneda-classification/C-3` | Monoidal layer insufficiency (paper Theorem 6.1) | Proposition 6.2; iv:math |
| `vol-04-yoneda-classification/C-4` | Fusion rings of `D₈` and `Q₈` (paper Proposition 6.2) | check_fusion_ring_iso; check_groups_distinct |
| `vol-04-yoneda-classification/C-5` | The synthesis problem (paper Section 8, open problem) | stated as text only (no theorem references) |
| `vol-07-gauge-qft/C-1` | Cobordism hypothesis (paper `conj:cobordism`) | stated as text only (no theorem references) |
| `vol-07-gauge-qft/C-2` | Classification of connections modulo gauge | tab:invariants |
| `vol-07-gauge-qft/C-3` | Global anomalies after local obstruction classes vanish | QuantizationGate; prop:anomaly |
| `vol-07-gauge-qft/C-4` | Yang–Mills mass gap (Clay, series row T-OP-03) | stated as text only (no theorem references) |
| `vol-07-gauge-qft/C-5` | Existence of a four-dimensional interacting theory (series row CL-01) | stated as text only (no theorem references) |
| `vol-07-gauge-qft/C-6` | Reflection-positive 4d SU(N) with mass gap and confinement (series row CL-02) | stated as text only (no theorem references) |
| `vol-07-gauge-qft/C-7` | Existence and mass gap via a 5d orbifold regulator (series row CL-03) | stated as text only (no theorem references) |
| `vol-07-gauge-qft/C-8` | Three-dimensional mass-gap proof outline (series row CL-05) | stated as text only (no theorem references) |
| `vol-09-gravity-information-geometry/C-1` | Which monotone metric? (Open question 1) | Proposition 4.2; Lemma 3.1 |
| `vol-09-gravity-information-geometry/C-2` | Continuum convergence of weighted-nerve constructions (Open question 2) | stated as text only (no theorem references) |
| `vol-09-gravity-information-geometry/C-3` | The entropy formula in general settings (Open question 3) | conjecture |
| `vol-09-gravity-information-geometry/C-4` | Curvature as physics (Open question 4) | conjecture |
| `vol-09-gravity-information-geometry/C-5` | Petz family in infinite dimensions (Open question 5) | stated as text only (no theorem references) |
| `vol-09-gravity-information-geometry/C-6` | Reconstruction of interacting dynamics (Open question 6) | Definition 2.10 |
| `vol-09-gravity-information-geometry/C-7` | The gravity–information correspondence (Remark 10.1) | conjecture |
| `vol-09-gravity-information-geometry/C-8` | Emergence of spacetime connectivity from entanglement (Remark 8.2) | conjecture |
| `vol-09-gravity-information-geometry/C-9` | Chentsov uniqueness (Target 3, Thm 3.4) | stated as text only (no theorem references) |
| `vol-09-gravity-information-geometry/C-10` | Petz–Sudar classification (Target 4, Thm 4.1) | stated as text only (no theorem references) |
| `vol-09-gravity-information-geometry/C-11` | Qubit SLD geometry is an open hemisphere (Target 7, Prop. 5.1 conclusion) | sld_qubit_transverse; sld_qubit_radial |
| `vol-09-gravity-information-geometry/C-12` | Fidelity metric equals one quarter SLD (Target 8, Def. 2.8 / Prop. 5.2) | stated as text only (no theorem references) |
| `vol-09-gravity-information-geometry/C-13` | Ideal-gas Ruppeiner scalar curvature vanishes (Target 9, Prop. 9.1) | ideal_gas_ruppeiner_flat |
| `vol-09-gravity-information-geometry/C-14` | Holographic entropy cone for N ≤ 4 (Target 10, Thm 8.4) | stated as text only (no theorem references) |
| `vol-10-observational-equivalence/C-1` | Isocategorical groups (Theorem 3.1, Etingof–Gelaki) | Cmrps.Vol10.PlainTensorCounterexample; eg_plain_tensor_insufficient; preserved_layer_discipline; iv:math |
| `vol-10-observational-equivalence/C-2` | Chentsov uniqueness (Theorem 5.1) | Cmrps.Vol10.chentsov_fisher_uniqueness; iv:quant-ph |
| `vol-10-observational-equivalence/C-3` | Petz–Sudar classification (Theorem 5.2) | Cmrps.Vol10.petz_sudar_parametricity; Cmrps.Vol10.petz_transpose_same_form; Cmrps.Vol10.monotone_not_canonical; iv:quant-ph |
| `vol-10-observational-equivalence/C-4` | Doplicher–Roberts reconstruction (Remark 3.3) | Theorem 3.1 |
| `vol-10-observational-equivalence/C-5` | Non-transitivity of metric tolerance relations (§5.4) | Proposition 4.2 |
| `vol-10-observational-equivalence/C-6` | Character tables do not separate D8 and Q8 (§9.3) | invariant_coarseness.py; DihedralGroup; QuaternionGroup |
| `vol-10-observational-equivalence/C-7` | The correct choice of physical equivalence (§11) | Definition 2.5 |
| `vol-10-observational-equivalence/C-8` | Composition of indistinguishability under interaction (§4.3, §8.2) | Proposition 4.6 |
| `vol-10-observational-equivalence/C-9` | Positive reconstruction criterion (§11.1) | §6.1. |
| `vol-10-observational-equivalence/C-10` | A system-level duality pair (§6, Table 4 row 1) | stated as text only (no theorem references) |
| `vol-12-principia-physica/C-1` | Structural classification of admissible physical systems (Conjecture 7.1) | Phys_adm |
| `vol-12-principia-physica/C-2` | Completeness of the constituent record beyond the two covered constructions | Definition 8.2 |
| `vol-12-principia-physica/C-3` | Four-dimensional Yang–Mills existence and mass gap (Clay problem) | stated as text only (no theorem references) |
| `vol-12-principia-physica/C-4` | Unification of the reconstruction patterns | stated as text only (no theorem references) |
| `vol-12-principia-physica/C-5` | Logical independence of the ten structural families | stated as text only (no theorem references) |
| `vol-12-principia-physica/C-6` | Composition of observational equivalence in interacting regimes | Definition 2.10 |

Total conjecture items: 53

