# Dependency notes: vol-07-gauge-qft

**Module:** lean/Cmrps/Vol07GaugeQft.lean (namespace `Cmrps.Vol07`)
**Paper:** papers/latex/vol-07-gauge-qft.tex
**Date:** 2026-10-30

## 1. Build provenance

| Item | Value |
|---|---|
| Lean toolchain | leanprover/lean4:v4.35.0 (lean/lean-toolchain) |
| Mathlib | pinned rev `56a005855ea17e0b0958f73ec801ae140b0a1679` (lean/lake-manifest.json) |
| `lake build` | NOT run by the module writer (assembler owns the build) |
| `lake exe cache get` | NOT run by the module writer |
| Single-file check | `lake env lean Cmrps/Vol07GaugeQft.lean` (read-only elaboration, no build artifacts) exited 0 with no errors and no warnings at the pinned rev |
| `sorry` | none in the module |
| Axioms | none beyond the `structure` fields of `FrobeniusAlgebra`, `AnomalyData`, `AnomalyObstruction`, `GlobalFormInvariant` (listed as fields, used as data) |

The assembler's `lake build` remains the authoritative gate; until it exits 0, every formalized
row stays `machine-checked (pending build)`.

## 2. Mathlib imports used (and why)

| Import | Supplies |
|---|---|
| `Mathlib.Algebra.Algebra.Basic` | `Algebra k A`, `Module k A` via algebra |
| `Mathlib.Algebra.Module.LinearMap.Defs` | `LinearMap`, `A →ₗ[k] k` |
| `Mathlib.Algebra.BigOperators.Group.Finset.Basic` | `∑ i, _` over `Fintype`, `Finset.sum_eq_zero`, `map_sum` |
| `Mathlib.Algebra.BigOperators.Group.List.Defs` | additive names `List.sum_append` etc. |
| `Mathlib.Algebra.Group.Subgroup.Ker` | `AddMonoidHom.ker`, `AddMonoidHom.mem_ker` |
| `Mathlib.Data.ZMod.Basic` | `ZMod 2`, `ZMod.card` |

Lean-core lemmas used: `Int.natCast_nonneg`, `Int.toNat_of_nonneg`, `Int.toNat_natCast`,
`Fin.fin_one_eq_zero`, `List.sum_cons`, `List.sum_nil`, `List.map_cons`, `Subtype.ext`,
`Classical.byContradiction`, `zero_smul`, `one_smul`, `mul_smul`, `inv_smul_smul`, `map_add`.

## 3. Paper dependency graph (which result needs which)

| Result | Depends on |
|---|---|
| thm:killing-cartan | Root-system classification, Serre presentation, Cartan's theorem on real forms (Humphreys, Serre); standalone in the volume |
| thm:highest-weight | thm:killing-cartan only for ambient setup; internally: classification by highest weight + Borel–Weil / Verma module existence (Humphreys) |
| thm:bundles | Milnor join construction (numerable universal bundle), Dold–Steenrod homotopy invariance of pullbacks; standalone |
| prop:spheres | thm:bundles + long exact homotopy sequence of G → EG → BG with EG contractible |
| ex:line | prop:spheres (U(1), n = 2) + first Chern class |
| ex:instanton | prop:spheres (SU(2), n = 4) + second Chern class |
| ex:global-form | prop:spheres (SO(3) and SU(2), n = 2) + π₁(SO(3)) ≅ Z/2, π₁(SU(2)) = 0 |
| def:gauge-equivalence | standalone definitional |
| prop:classical-classes | splitting principle, Chern–Weil theory (Milnor–Stasheff) |
| def:fermionic-anomaly | Quillen determinant line, Atiyah–Singer index theory |
| def:bvbrst-anomaly | Wess–Zumino consistency, Barnich–Brandt–Henneaux local BRST cohomology, Chevalley–Eilenberg complex of the gauge algebra |
| prop:anomaly | def:fermionic-anomaly + def:bvbrst-anomaly (the two obstructions are the gate) |
| prop:cancellation | thm:highest-weight (basis of irreducibles) + prop:anomaly (the anomaly computation α) |
| ex:abelian-anomaly | def:bvbrst-anomaly (Chevalley–Eilenberg shadow only) |
| thm:frobenius | Atiyah axioms + Frobenius identity; standalone |
| conj:cobordism | none proved; stands alone as a conjecture |
| def:local-net | Haag–Kastler axioms |
| def:dhr | def:local-net |
| thm:dr | def:dhr + Haag duality + symmetric C*-tensor category structure (Doplicher–Roberts) |
| thm:deligne | Tannakian theory; standalone |
| thm:gelfand | Gelfand–Naimark + Stone duality; standalone |

Cross-volume: vol-07 instantiates the series schema (structural families IV and VI) defined in
vol-01; the Etingof–Gelaki constraint (`def:etingof-gelaki`) governs every equivalence recorded
in this volume, as in vol-06's tensor-category layer.

## 4. Lean lemma dependencies (what each formalized theorem uses)

| Lean declaration | Uses |
|---|---|
| `highestWeightRankOne` | `Subtype.ext`, `Fin.fin_one_eq_zero`, `Int.toNat_of_nonneg`, `Int.toNat_natCast`, `Int.natCast_nonneg` |
| `FrobeniusAlgebra.pairing_comm` | `mul_comm` |
| `FrobeniusAlgebra.nondegenerate_left` | field `left_dual`, `Finset.sum_eq_zero`, `zero_smul`, simp on `h` |
| `FrobeniusAlgebra.nondegenerate_right` | `nondegenerate_left`, `mul_comm` |
| `FrobeniusAlgebra.exists_pairing_ne_zero` | `nondegenerate_right`, `Classical.byContradiction` |
| `FrobeniusAlgebra.genusOne_eq` | defs `euler`, `genusOne`, `map_sum` |
| `gaugeAction_one` | `Pi.one_apply`, `one_smul` |
| `gaugeAction_mul` | `Pi.mul_apply`, `mul_smul` |
| `gaugeEquiv_refl` | `gaugeAction_one` |
| `gaugeEquiv_trans` | `gaugeAction_mul` (compose in order g₂ * g₁) |
| `gaugeEquiv_symm` | `congrFun`, `inv_smul_smul` |
| `anomaly_free_iff_mem_ker` | `AddMonoidHom.mem_ker`, def `AnomalyFree` |
| `anomaly_free_zero` | `map_zero` |
| `anomaly_free_add` | `map_add` |
| `anomaly_free_neg` | `map_neg`, `neg_zero` |
| `map_list_sum` | induction on `List`, `List.sum_cons`, `List.map_cons`, `map_add` |
| `anomaly_free_list_iff_sum_map` | `map_list_sum` |
| `anomaly_free_list_iff_mem_ker` | `AddMonoidHom.mem_ker` |
| `anomaly_free_list_nil` | `List.sum_nil`, `map_zero` |
| `anomaly_free_list_append` | `List.sum_append`, `map_add` |
| `quantization_gate_iff` | def `QuantizationGate` (Iff.rfl) |
| `not_quantization_gate_of_ne_zero` | def `QuantizationGate` |
| `not_quantization_gate_of_not_trivial` | def `QuantizationGate` |
| `quantization_gate_iff_anomalyFree` | defs `QuantizationGate`, `AnomalyData.AnomalyFree` (Iff.rfl) |
| `so3_w2_detection` | `ZMod 2` decidable equality (`by decide`) |
| `so3_two_classes` | `ZMod.card 2` |
| `w2_detects_nontrivial` | field `w2_trivial` |
| `su2_bundles_over_s2_trivial` | `PUnit` case analysis |

## 5. Model-vs-geometry boundary (do not over-claim)

| Lean row | What it proves | What it does NOT prove |
|---|---|---|
| `highestWeightRankOne` | rank-one dominant weights ↔ ℕ | existence/uniqueness of irreps for general semisimple g |
| `FrobeniusAlgebra.*` | symmetric nondegenerate pairing from dual bases; genus-one scalar | the equivalence of categories "2D TQFT ↔ Frobenius algebra" (thm:frobenius full statement) |
| `gaugeAction_*`, `GaugeEquiv_*` | pointwise action laws and equivalence laws | the geometric definition via bundle automorphisms of a principal bundle |
| `AnomalyData.*`, `QuantizationGate.*` | kernel/additivity and the two-condition gate as logic | the determinant line of a Dirac family, H^{1,n}(s|d), Wess–Zumino consistency |
| `GlobalFormInvariant.*`, `SU2BundleClass` | Z/2 detection logic and two/one class models | π₁(SO(3)) ≅ Z/2, π₁(SU(2)) = 0, Stiefel–Whitney class of the tangent 2-plane bundle |
