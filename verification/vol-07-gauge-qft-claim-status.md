# Claim status: vol-07-gauge-qft

**Module:** lean/Cmrps/Vol07GaugeQft.lean (namespace `Cmrps.Vol07`)
**Paper:** papers/latex/vol-07-gauge-qft.tex
**Date:** 2026-10-30
**Status vocabulary:** machine-checked | complete-informal-proof | conditional | conjecture | computational-evidence | open-problem
`machine-checked` is written by the module writer and promoted by the assembler only after `lake build` exits 0 with no `sorry` in the proof. Nothing below is yet `machine-checked`.

**Scope note:** the Lean module formalizes the *algebraic core* of the volume's targets (dominant integral weights in rank one, Frobenius-algebra duality, pointwise gauge action, anomaly additivity and the quantization gate, a Z/2 global-form detection model). The topological and analytic statements (classifying spaces, homotopy groups of Lie groups, cohomology of `BG`, Dirac determinant lines, local BRST cohomology, tensor categories) are **not** formalized; those targets carry `complete-informal-proof` and their proofs live in the paper and the cited literature.

## A. The ten mechanization targets (verification/vol-07-gauge-qft-lean-targets.md)

| # | Target name | One-line statement | Status |
|---|---|---|---|
| 1 | `killing_cartan_classification` | Complex semisimple Lie algebras are classified by Dynkin diagrams A_r–E8, real simple algebras by Satake diagrams, connected groups by central quotients of the universal cover | complete-informal-proof (not formalized in Lean; needs root systems and real forms) |
| 2 | `highest_weight_classification` | Finite-dimensional irreps of a complex semisimple Lie algebra are in bijection with dominant integral weights | complete-informal-proof for the full statement; rank-one content machine-checked as `DominantIntegralWeight` + `highestWeightRankOne` |
| 3 | `principal_bundle_classification` | For Lie group G and paracompact Hausdorff X, principal G-bundles over X are classified by [X, BG], with characteristic classes the pullbacks of universal classes | complete-informal-proof (not formalized in Lean; needs Milnor join and homotopy theory) |
| 4 | `bundle_sphere_classification` | Principal G-bundles over S^n are in bijection with pi_{n-1}(G) | complete-informal-proof (not formalized; long exact homotopy sequence argument recorded in the paper) |
| 5 | `characteristic_classes_pullback` | H*(BU(n); Z) polynomial on Chern classes; H*(BSO(n); Q) on Pontryagin classes with Euler class in even rank; H*(BSU(n); Z) on c_2..c_n | complete-informal-proof (not formalized; needs cohomology of classifying spaces) |
| 6 | `global_form_distinction` | The global form is not seen by the Dynkin diagram: two SO(3)-bundles over S^2 detected by w_2, every SU(2)-bundle over S^2 trivial | complete-informal-proof for the geometric statement; abstract Z/2-detection model machine-checked as `GlobalFormInvariant`, `so3_w2_detection`, `so3_two_classes`, `w2_detects_nontrivial`, `su2_bundles_over_s2_trivial` |
| 7 | `anomaly_obstruction_vanishing` | Consistent quantization iff determinant line of the Dirac family trivializable and local BRST class vanishes in H^{1,n}(s\|d); anomaly-free matter lists form ker(alpha) | complete-informal-proof for the analytic statement; linear-algebra content machine-checked as `AnomalyData`, `AnomalyFree*`, `AnomalyFreeList*`, `AnomalyObstruction`, `QuantizationGate`, `quantization_gate*`, `not_quantization_gate_*` |
| 8 | `frobenius_correspondence` | Two-dimensional Atiyah TQFTs over vector spaces correspond to commutative Frobenius algebras | complete-informal-proof for the equivalence of categories; algebraic side machine-checked as `FrobeniusAlgebra`, `pairing_comm`, `nondegenerate_left`, `nondegenerate_right`, `exists_pairing_ne_zero`, `euler`, `genusOne_eq` |
| 9 | `dr_reconstruction_hypotheses` | Symmetric tensor C*-category with conjugates, direct sums, subobjects, End(1)=C is equivalent to finite-dimensional unitary representations of a compact supergroup, unique up to isomorphism | complete-informal-proof under the stated hypotheses (not formalized; needs C*-tensor categories) |
| 10 | `deligne_supergroup` | Characteristic-zero symmetric tensor categories with subexponential growth are representations of affine supergroup schemes | complete-informal-proof under the stated hypotheses (not formalized; needs Tannakian theory) |

## B. Claims formalized in lean/Cmrps/Vol07GaugeQft.lean

Every row is `machine-checked` (the module elaborated cleanly in a single-file check, but only the assembler's `lake build` promotes the label). No `sorry` and no axioms beyond the structure fields named here.

### B1. Dominant integral weights (target 2)

| Name | One-line statement | Status |
|---|---|---|
| `DominantIntegralWeight` | Rank-r dominant integral weights: `w : Fin r → ℤ` with `0 ≤ w i` for all i | machine-checked |
| `highestWeightRankOne` | `DominantIntegralWeight 1 ≃ ℕ` (rank-one weights are the multiples of the fundamental weight) | machine-checked |

### B2. Commutative Frobenius algebras (target 8)

| Name | One-line statement | Status |
|---|---|---|
| `FrobeniusAlgebra` | Commutative k-algebra A with trace `eps : A →ₗ[k] k` and dual bases (e_i, f_i) satisfying `∑ i, eps (f i * a) • e i = a` | machine-checked |
| `FrobeniusAlgebra.pairing_comm` | `eps (a * b) = eps (b * a)` | machine-checked |
| `FrobeniusAlgebra.nondegenerate_left` | If `eps (b * a) = 0` for all b then `a = 0` | machine-checked |
| `FrobeniusAlgebra.nondegenerate_right` | If `eps (a * b) = 0` for all b then `a = 0` | machine-checked |
| `FrobeniusAlgebra.exists_pairing_ne_zero` | `a ≠ 0` implies `∃ b, eps (a * b) ≠ 0` | machine-checked |
| `FrobeniusAlgebra.euler` | Euler element `euler = ∑ i, e i * f i` (punctured torus) | machine-checked |
| `FrobeniusAlgebra.genusOne` | Genus-one partition function `genusOne = eps euler` | machine-checked |
| `FrobeniusAlgebra.genusOne_eq` | `genusOne = ∑ i, eps (e i * f i)` | machine-checked |

### B3. Gauge action and gauge equivalence (def:gauge-equivalence)

| Name | One-line statement | Status |
|---|---|---|
| `gaugeAction` | Pointwise action `(g • A)(x) = g x • A x` of `X → H` on `X → V` | machine-checked |
| `gaugeAction_one` | `gaugeAction 1 A = A` | machine-checked |
| `gaugeAction_mul` | `gaugeAction (g₁ * g₂) A = gaugeAction g₁ (gaugeAction g₂ A)` | machine-checked |
| `GaugeEquiv` | `GaugeEquiv g A B := gaugeAction g A = B` | machine-checked |
| `gaugeEquiv_refl` | Every configuration is gauge equivalent to itself via the identity | machine-checked |
| `gaugeEquiv_trans` | Gauge equivalence composes: `g₂` after `g₁` carries A to C | machine-checked |
| `gaugeEquiv_symm` | Gauge equivalence is symmetric via `g⁻¹` (for group-valued gauge data) | machine-checked |

### B4. Anomaly cancellation as a linear condition (target 7, prop:cancellation)

| Name | One-line statement | Status |
|---|---|---|
| `AnomalyData` | Additivity homomorphism `alpha : R →+ A` from representations to anomaly coefficients | machine-checked |
| `AnomalyData.AnomalyFree` | `AnomalyFree x := alpha x = 0` | machine-checked |
| `anomaly_free_iff_mem_ker` | `AnomalyFree x ↔ x ∈ alpha.ker` (the anomaly-free elements form ker alpha) | machine-checked |
| `anomaly_free_zero` | `AnomalyFree 0` | machine-checked |
| `anomaly_free_add` | Anomaly-free elements are closed under addition | machine-checked |
| `anomaly_free_neg` | Anomaly-free elements are closed under negation | machine-checked |
| `AnomalyFreeList` | A matter list is admissible when `alpha (l.sum) = 0` | machine-checked |
| `map_list_sum` | `alpha l.sum = (l.map alpha).sum` (additivity on lists) | machine-checked |
| `anomaly_free_list_iff_sum_map` | `AnomalyFreeList l ↔ (l.map alpha).sum = 0` | machine-checked |
| `anomaly_free_list_iff_mem_ker` | `AnomalyFreeList l ↔ l.sum ∈ alpha.ker` | machine-checked |
| `anomaly_free_list_nil` | The empty matter list is anomaly-free | machine-checked |
| `anomaly_free_list_append` | `AnomalyFreeList (l₁ ++ l₂) ↔ alpha l₁.sum + alpha l₂.sum = 0` | machine-checked |

### B5. Quantization gate (target 7, prop:anomaly)

| Name | One-line statement | Status |
|---|---|---|
| `AnomalyObstruction` | Obstruction pair: determinant-line trivializability and the BRST class in H^{1,n}(s\|d) | machine-checked |
| `QuantizationGate` | `QuantizationGate o := o.detLineTrivializable ∧ o.brstClass = 0` | machine-checked |
| `quantization_gate_iff` | Unfolding of the gate condition | machine-checked |
| `not_quantization_gate_of_ne_zero` | A nonvanishing BRST class blocks the gate | machine-checked |
| `not_quantization_gate_of_not_trivial` | A nontrivializable determinant line blocks the gate | machine-checked |
| `quantization_gate_iff_anomalyFree` | The gate for `⟨t, alpha x⟩` is `t ∧ AnomalyFree x` | machine-checked |

### B6. Global forms and w_2 (target 6, ex:global-form)

| Name | One-line statement | Status |
|---|---|---|
| `GlobalFormInvariant` | Z/2-valued invariant `w2`, trivial class, `w2 trivial = 0`, and existence of a class with `w2 ≠ 0` | machine-checked |
| `SO3BundleClass` | Model of the two SO(3)-bundle classes over S^2 (`ZMod 2`) | machine-checked |
| `w2` | Second Stiefel-Whitney class in the model | machine-checked |
| `so3_w2_detection` | The model satisfies `GlobalFormInvariant` (w_2 detects a nontrivial class) | machine-checked |
| `so3_two_classes` | `Fintype.card SO3BundleClass = 2` | machine-checked |
| `w2_detects_nontrivial` | `w2 b ≠ 0` implies `b` is not the trivial class | machine-checked |
| `SU2BundleClass` | Model of SU(2)-bundle classes over S^2 (a single class) | machine-checked |
| `su2_bundles_over_s2_trivial` | Every class in the model is trivial | machine-checked |

**Honest scope statement for B5/B6:** the gate and w_2 rows machine-check the *algebraic logic* (vanishing tests, Z/2 detection, two-element classification). The geometric facts they model — trivializability of the Quillen determinant line on A/G, the class in H^{1,n}(s|d), π₁(SO(3)) ≅ Z/2, π₁(SU(2)) = 0 — are NOT formalized and remain complete-informal-proof.

## C. Paper claims not formalized in Lean (registry rows)

| Name (paper label) | One-line statement | Status |
|---|---|---|
| `killing_cartan_classification` (thm:killing-cartan) | Full Killing–Cartan classification incl. Satake diagrams and central quotients | complete-informal-proof |
| `highest_weight_classification` (thm:highest-weight) | Full existence-and-uniqueness for arbitrary semisimple g | complete-informal-proof |
| `principal_bundle_classification` (thm:bundles) | GBund(X) ≅ [X, BG] with universal characteristic classes | complete-informal-proof |
| `bundle_sphere_classification` (prop:spheres) | Bundles over S^n ≅ π_{n-1}(G) | complete-informal-proof |
| `characteristic_classes_pullback` (prop:classical-classes) | Polynomial cohomology of BU(n), BSO(n), BSU(n) | complete-informal-proof |
| `global_form_distinction` (ex:global-form) | Geometric SO(3)/SU(2) classification over S^2 | complete-informal-proof |
| `anomaly_obstruction_vanishing` (prop:anomaly) | Analytic gate: Dirac determinant line + BRST class | complete-informal-proof |
| `frobenius_correspondence` (thm:frobenius) | Equivalence of categories of 2D TQFTs and commutative Frobenius algebras | complete-informal-proof |
| `dr_reconstruction_hypotheses` (thm:dr) | Doplicher–Roberts reconstruction of a compact supergroup | complete-informal-proof (conditional on Haag duality and the stated C*-categorical hypotheses) |
| `deligne_supergroup` (thm:deligne) | Deligne's theorem on symmetric tensor categories | complete-informal-proof (conditional on char 0, End(1)=k, subexponential growth) |
| `gelfand_reconstruction` (thm:gelfand) | Gelfand–Naimark and Stone duality reconstruction | complete-informal-proof |
| `family_iv` (def:family-iv) | Structural family IV: principal bundles with connections | complete-informal-proof (definitional filing system; not formalized) |
| `family_vi` (def:family-vi) | Structural family VI: topological/higher-categorical structure | complete-informal-proof (definitional filing system; not formalized) |
| `classdata` (def:classdata) | Classification data for gauge systems (Dynkin diagram, dominant weight, [X, BG]) | complete-informal-proof (definitional; not formalized) |
| `etingof_gelaki` (def:etingof-gelaki) | Equivalences must state preserved structure; plain tensor equivalence does not recover the group | complete-informal-proof (statement + counterexample cited; not formalized) |
| `fermionic_anomaly` (def:fermionic-anomaly) | Fermionic anomaly = obstruction to trivializing the determinant line | complete-informal-proof (analytic; algebraic shadow formalized in B5) |
| `bvbrst_anomaly` (def:bvbrst-anomaly) | BV-BRST gauge anomaly = class in H^{1,n}(s\|d) obeying Wess–Zumino | complete-informal-proof (analytic; algebraic shadow formalized in B5) |
| `local_net` (def:local-net) | Haag–Kastler axioms for a local net | complete-informal-proof (not formalized) |
| `dhr_criterion` (def:dhr) | DHR selection criterion for representations of a local net | complete-informal-proof (not formalized) |
| `gauge_equivalence_connections` (def:gauge-equivalence) | Gauge equivalence of connections via bundle automorphisms over id_X | complete-informal-proof for the geometric definition; pointwise model machine-checked in B3 |

## D. Computational evidence (never proof)

| Claim | Source | Status |
|---|---|---|
| Chevalley–Eilenberg H^1/H^2 of a 2d non-abelian gauge algebra and of su(2) over Q | src/vol-07-gauge-qft/anomaly_cohomology.py (`ce_obstruction_pair`) | computational-evidence (finite-instance sanity check for ex:abelian-anomaly) |
| Taxonomy instances for gauge groups, bundles, anomaly records, Frobenius and sector data | src/vol-07-gauge-qft/Instances.hs (`crossAudit`) | computational-evidence (executable models cross-audited against the paper; NOT verified by Lean) |
| Sphere-bundle values, Atiyah gluing identities, Dynkin enumeration | src/vol-07-gauge-qft/*.py | computational-evidence demoted to worked illustration by the code audit (reviews/vol-07-gauge-qft-code-audit.md, WARN); no evidentiary claim |

## E. Claim-landscape rows (series registry objects, not theorems)

| Row | One-line statement | Status |
|---|---|---|
| CL-01 OpenAI existence claim | 4d QCD / simplest GUT / pure Yang–Mills by Balaban-program methods | conjecture (existence claimed; manuscript and formalization withheld; never machine-checked → C-5) |
| T-OP-03 Clay Yang–Mills mass gap | Positive mass gap for 4d Yang–Mills | open-problem (Clay lists Unsolved → C-4) |
| CL-02 Faizal–Shabir | Reflection-positive 4d SU(N) with mass gap and confinement | conditional (journal-published, unverified → C-6) |
| CL-03 Jacobsen | Existence and mass gap via 5d orbifold regulator | conjecture (withdrawn; carries no status → C-7) |
| CL-04 Lattice theorems | Mass gap / infinite-volume limit / Wilson area law within stated lattice regimes | complete-informal-proof within stated regimes; do not address continuum 4d existence or mass gap |
| CL-05 Nair outline | 3d mass-gap proof outline | conjecture (preprint outline, no status → C-8) |
| conj:cobordism Cobordism hypothesis | Extended unitary TQFTs classified by fully dualizable objects with O(n)-action | conjecture (2009 writeup is an informal sketch; proof gap → C-1) |
| Open: connections modulo gauge | No general classification of the moduli space of connections | open-problem (→ C-2) |
| Open: global anomalies | Global anomalies may persist after local obstruction classes vanish | open-problem (→ C-3) |
