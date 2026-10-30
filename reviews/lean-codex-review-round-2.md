type: lean
Reading additional input from stdin...
OpenAI Codex v0.166.0
--------
workdir: /Users/mlong/Documents/Development/classification-physical-systems
model: gpt-6.1-sol
provider: openai
approval: never
sandbox: read-only
reasoning effort: medium
reasoning summaries: none
session id: 01a18caa-9abd-7a02-94a7-a54a7d5da413
--------
user
Read ONLY the files under lean/ and papers/latex/*.tex (do not explore other directories). Review the Lean 4 + Mathlib sources under lean/ for: type correctness, missing hypotheses, over-strong claims vs their paper statements (check against papers/latex/*.tex), incomplete patterns, unsound axioms or sorry usage, Mathlib idempotence (no re-proving Mathlib), clarity of namespaces. House rule: no style nits on dashes. This is review round 2: round 1 raised 8 issues and the fixes applied were (1) Vol08 IsDistinguishing redefined as injectivity of past/future maps, (2) Vol10 SelfReciprocal restricted to positive domain + skeleton caveats, (3) Vol02 object-level shadows documented and claim demoted, (4) Vol04 yoneda embedding preservation stated, (5) Vol11 classical-triviality caveats + claim demotions, (6) Vol12 NotFactoring/MonotoneMetricGapQuantum docstrings scoped + claims rescoped, (7) Mathlib-reimplementation items documented as kept paper-facing (not refactored). Verify these fixes and check for remaining issues. List issues with file:line references and concrete fixes. End your response with a VERDICT line — exactly one of: VERDICT: PASS or VERDICT: NEEDS_FIX.
warning: Under-development features enabled: chronicle. Under-development features are incomplete and may behave unpredictably. To suppress this warning, set `suppress_unstable_features_warning = true` in /Users/mlong/.codex/config.toml.
warning: clamping SessionEnd hook timeout to 3s in /Users/mlong/.codex/plugins/cache/openai-codex/codex/1.0.6/hooks/hooks.json
hook: SessionStart
hook: SessionStart
hook: SessionStart
hook: SessionStart
hook: SessionStart
hook: SessionStart
hook: SessionStart Completed
hook: SessionStart Completed
hook: SessionStart Completed
hook: SessionStart Completed
hook: SessionStart Completed
hook: SessionStart Completed
codex
I’ll review the permitted Lean and LaTeX files, verify the round 1 fixes, and check for remaining correctness and scope issues.
exec
/usr/local/bin/zsh -lc "rg --files lean papers/latex -g '*.lean' -g '*.tex' -g 'AGENTS.md' -g 'lakefile.*' -g 'lean-toolchain' -g 'lake-manifest.json'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
papers/latex/vol-08-spacetime-reconstruction.tex
lean/lakefile.toml
papers/latex/vol-05-classical-systems.tex
papers/latex/vol-10-observational-equivalence.tex
papers/latex/vol-04-yoneda-classification.tex
papers/latex/vol-07-gauge-qft.tex
papers/latex/vol-01-foundations.tex
papers/latex/vol-03-irreducibility-decomposition.tex
papers/latex/vol-06-quantum-systems.tex
papers/latex/vol-12-principia-physica.tex
papers/latex/vol-11-completeness-obstructions.tex
papers/latex/synthesis.tex
papers/latex/vol-09-gravity-information-geometry.tex
papers/latex/vol-02-structural-families.tex
lean/Cmrps.lean
lean/lake-manifest.json
lean/lean-toolchain
lean/Cmrps/Vol11CompletenessObstructions.lean
lean/Cmrps/Vol09GravityInformationGeometry.lean
lean/Cmrps/Vol03IrreducibilityDecomposition.lean
lean/Cmrps/Vol10ObservationalEquivalence.lean
lean/Cmrps/Vol12PrincipiaPhysica.lean
lean/Cmrps/Vol02StructuralFamilies.lean
lean/Cmrps/Vol08SpacetimeReconstruction.lean
lean/Cmrps/Vol07GaugeQft.lean
lean/Cmrps/Vol05ClassicalSystems.lean
lean/Cmrps/Vol04YonedaClassification.lean
lean/Cmrps/Vol06QuantumSystems.lean
lean/Cmrps/Vol01Foundations.lean

exec
/usr/local/bin/zsh -lc "wc -l lean/Cmrps/*.lean papers/latex/*.tex; rg -n 'sorry|axiom|admit|unsafe|TODO|skeleton|shadow|trivial|paper-facing|Mathlib|claim|Claim' lean/Cmrps lean/Cmrps.lean; cat lean/lakefile.toml lean/lean-toolchain" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
     808 lean/Cmrps/Vol01Foundations.lean
     807 lean/Cmrps/Vol02StructuralFamilies.lean
     340 lean/Cmrps/Vol03IrreducibilityDecomposition.lean
     415 lean/Cmrps/Vol04YonedaClassification.lean
     498 lean/Cmrps/Vol05ClassicalSystems.lean
     298 lean/Cmrps/Vol06QuantumSystems.lean
     308 lean/Cmrps/Vol07GaugeQft.lean
     477 lean/Cmrps/Vol08SpacetimeReconstruction.lean
     516 lean/Cmrps/Vol09GravityInformationGeometry.lean
     439 lean/Cmrps/Vol10ObservationalEquivalence.lean
     403 lean/Cmrps/Vol11CompletenessObstructions.lean
     440 lean/Cmrps/Vol12PrincipiaPhysica.lean
     676 papers/latex/synthesis.tex
     723 papers/latex/vol-01-foundations.tex
     835 papers/latex/vol-02-structural-families.tex
     729 papers/latex/vol-03-irreducibility-decomposition.tex
     697 papers/latex/vol-04-yoneda-classification.tex
     801 papers/latex/vol-05-classical-systems.tex
     752 papers/latex/vol-06-quantum-systems.tex
     667 papers/latex/vol-07-gauge-qft.tex
     745 papers/latex/vol-08-spacetime-reconstruction.tex
     812 papers/latex/vol-09-gravity-information-geometry.tex
     671 papers/latex/vol-10-observational-equivalence.tex
     674 papers/latex/vol-11-completeness-obstructions.tex
     698 papers/latex/vol-12-principia-physica.tex
   15229 total
lean/Cmrps/Vol11CompletenessObstructions.lean:25:file uses `sorry` or an axiom.
lean/Cmrps/Vol11CompletenessObstructions.lean:27:import Mathlib.Basic.Countable.Defs
lean/Cmrps/Vol11CompletenessObstructions.lean:28:import Mathlib.Data.Quot
lean/Cmrps/Vol11CompletenessObstructions.lean:62:  /-- Which structured shape the carrier claims. -/
lean/Cmrps/Vol11CompletenessObstructions.lean:209:this is an *extensional* skeleton — classically `fun x => decide (Q x)` satisfies
lean/Cmrps/Vol11CompletenessObstructions.lean:218:(hence the `conditional` status of this claim): every Markov property of
lean/Cmrps/Vol11CompletenessObstructions.lean:223:is classically trivial, `hmarkov` is contradictory and the formalized
lean/Cmrps/Vol11CompletenessObstructions.lean:255:which no infinite family reaches and which admits no finite listing cannot be
lean/Cmrps/Vol11CompletenessObstructions.lean:259:literature results; see the claim-status and conjectures files. -/
lean/Cmrps/Vol09GravityInformationGeometry.lean:21:are recorded in `verification/vol-09-gravity-information-geometry-claim-status.md`
lean/Cmrps/Vol09GravityInformationGeometry.lean:29:import Mathlib.Algebra.BigOperators.Fin
lean/Cmrps/Vol09GravityInformationGeometry.lean:30:import Mathlib.Algebra.Order.BigOperators.Ring.Finset
lean/Cmrps/Vol09GravityInformationGeometry.lean:31:import Mathlib.Algebra.Order.Field.Basic
lean/Cmrps/Vol09GravityInformationGeometry.lean:32:import Mathlib.Analysis.SpecialFunctions.Log.Deriv
lean/Cmrps/Vol09GravityInformationGeometry.lean:33:import Mathlib.Tactic
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:5:import Mathlib.Basic.Complex.Basic
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:6:import Mathlib.LinearAlgebra.Dimension.Constructions
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:7:import Mathlib.LinearAlgebra.TensorProduct.Basic
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:8:import Mathlib.LinearAlgebra.Matrix.ConjTranspose
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:9:import Mathlib.Algebra.Group.Submonoid.Basic
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:10:import Mathlib.Algebra.Group.Submonoid.Membership
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:11:import Mathlib.GroupTheory.Perm.Basic
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:12:import Mathlib.Data.Fintype.Sum
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:23:Mathlib has no C*-algebra classification layer. This module formalizes the concrete
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:28:All statements below are fully proved; nothing uses `sorry`, `axiom`, or `native_decide`.
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:198:/-- Worked example (paper `ex:superselection`), witness form: `M_2 ⊕ M_2` admits no
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:233:/-- Paper Table 4.1 row 3: column sums `(1, 2)` admit `2 × 3 = 6` multiplicity matrices.
lean/Cmrps/Vol10ObservationalEquivalence.lean:1:import Mathlib.Algebra.BigOperators.Group.Finset.Basic
lean/Cmrps/Vol10ObservationalEquivalence.lean:2:import Mathlib.Tactic
lean/Cmrps/Vol10ObservationalEquivalence.lean:13:logical skeleton, with the classical inputs recorded as explicit hypotheses or as
lean/Cmrps/Vol10ObservationalEquivalence.lean:14:statement definitions left unproved. Nothing in this file uses `sorry` or new axioms.
lean/Cmrps/Vol10ObservationalEquivalence.lean:318:/-- Theorem 5.1 (Chentsov), statement skeleton (unproved; literature): every monotone
lean/Cmrps/Vol10ObservationalEquivalence.lean:320:monotonicity predicate is external to this skeleton and is left as a parameter. -/
lean/Cmrps/Vol10ObservationalEquivalence.lean:347:/-- Theorem 5.2 (`petz_sudar_parametricity`), statement skeleton (unproved; literature):
lean/Cmrps/Vol10ObservationalEquivalence.lean:350:directions. Operator monotonicity is external to this skeleton and is left as a
lean/Cmrps/Vol10ObservationalEquivalence.lean:352:meaningful for `n ≥ 2`, and the skeleton omits positivity of eigenvalues and
lean/Cmrps/Vol12PrincipiaPhysica.lean:1:import Mathlib.Data.Real.Basic
lean/Cmrps/Vol12PrincipiaPhysica.lean:2:import Mathlib.Tactic
lean/Cmrps/Vol12PrincipiaPhysica.lean:13:formalized as their honest logical skeleton, with the classical inputs recorded as explicit
lean/Cmrps/Vol12PrincipiaPhysica.lean:14:hypotheses. Nothing in this file uses `sorry` or new axioms.
lean/Cmrps/Vol12PrincipiaPhysica.lean:69:  | claimLedgerEntry
lean/Cmrps/Vol12PrincipiaPhysica.lean:79:  | .claimLedgerEntry => .formulation
lean/Cmrps/Vol12PrincipiaPhysica.lean:85:   .obstructionTheorem, .claimLedgerEntry]
lean/Cmrps/Vol12PrincipiaPhysica.lean:100:    (evidenceGrade .claimLedgerEntry ≠ .validated) := by
lean/Cmrps/Vol12PrincipiaPhysica.lean:250:/-- Target 6, gap clause: a parameterized family with more than one element admits no
lean/Cmrps/Vol12PrincipiaPhysica.lean:260:is nontrivial, and classical uniqueness does not extend to the quantum case.
lean/Cmrps/Vol12PrincipiaPhysica.lean:287:/-- Target 7: an existence claim alone does not discharge the mass-gap conjunct; the two
lean/Cmrps/Vol12PrincipiaPhysica.lean:294:/-- Claim ladder positions (Section 6). -/
lean/Cmrps/Vol12PrincipiaPhysica.lean:305:/-- Table 4: the ladder position of each claim-ledger entry. -/
lean/Cmrps/Vol12PrincipiaPhysica.lean:306:def claimPositions : List LadderPosition :=
lean/Cmrps/Vol12PrincipiaPhysica.lean:309:theorem claim_positions_exact :
lean/Cmrps/Vol12PrincipiaPhysica.lean:310:    claimPositions = [.announced, .publishedUnverified, .withdrawn,
lean/Cmrps/Vol12PrincipiaPhysica.lean:313:theorem claim_ledger_size : claimPositions.length = 5 := by decide
lean/Cmrps/Vol12PrincipiaPhysica.lean:315:/-- No claim-ledger entry has reached the verified or accepted rung, so none resolves the
lean/Cmrps/Vol12PrincipiaPhysica.lean:317:theorem claim_ledger_not_verified :
lean/Cmrps/Vol02StructuralFamilies.lean:7:import Mathlib.Tactic
lean/Cmrps/Vol02StructuralFamilies.lean:8:import Mathlib.Data.Quot
lean/Cmrps/Vol02StructuralFamilies.lean:9:import Mathlib.Basic.Countable.Defs
lean/Cmrps/Vol02StructuralFamilies.lean:10:import Mathlib.Logic.Equiv.Set
lean/Cmrps/Vol02StructuralFamilies.lean:11:import Mathlib.SetTheory.Cardinal.Finite
lean/Cmrps/Vol02StructuralFamilies.lean:12:import Mathlib.Data.Fintype.OfMap
lean/Cmrps/Vol02StructuralFamilies.lean:13:import Mathlib.Data.Multiset.Bind
lean/Cmrps/Vol02StructuralFamilies.lean:14:import Mathlib.Data.Multiset.Count
lean/Cmrps/Vol02StructuralFamilies.lean:15:import Mathlib.Algebra.BigOperators.Group.Multiset.Basic
lean/Cmrps/Vol02StructuralFamilies.lean:16:import Mathlib.Algebra.BigOperators.Ring.Multiset
lean/Cmrps/Vol02StructuralFamilies.lean:17:import Mathlib.Data.Matrix.Mul
lean/Cmrps/Vol02StructuralFamilies.lean:18:import Mathlib.Data.Matrix.Diagonal
lean/Cmrps/Vol02StructuralFamilies.lean:19:import Mathlib.LinearAlgebra.Matrix.ConjTranspose
lean/Cmrps/Vol02StructuralFamilies.lean:20:import Mathlib.Topology.Constructions
lean/Cmrps/Vol02StructuralFamilies.lean:21:import Mathlib.Topology.Continuous
lean/Cmrps/Vol02StructuralFamilies.lean:22:import Mathlib.Topology.Algebra.MulAction
lean/Cmrps/Vol02StructuralFamilies.lean:28:(Vol. 2: Fundamental Structural Families). Claim labels mirror
lean/Cmrps/Vol02StructuralFamilies.lean:696:this is the *object-level shadow* of the paper's definition — an injection of object
lean/Cmrps/Vol02StructuralFamilies.lean:703:this is the object-level shadow (a bijection of object types), not the paper's
lean/Cmrps/Vol02StructuralFamilies.lean:709:**Scope caveat (Codex review, round 1):** with the object-level shadows above, classical
lean/Cmrps/Vol02StructuralFamilies.lean:716:/-- Paper Proposition 16.2: a family admits a classifying invariant when some map on
lean/Cmrps/Vol02StructuralFamilies.lean:729:/-- Paper Proposition 16.2: two families may each admit a classifying invariant and
lean/Cmrps/Vol08SpacetimeReconstruction.lean:6:import Mathlib.Basic.Real.Basic
lean/Cmrps/Vol08SpacetimeReconstruction.lean:7:import Mathlib.Order.Defs.PartialOrder
lean/Cmrps/Vol08SpacetimeReconstruction.lean:8:import Mathlib.Order.Defs.Unbundled
lean/Cmrps/Vol08SpacetimeReconstruction.lean:9:import Mathlib.Order.UpperLower.Basic
lean/Cmrps/Vol08SpacetimeReconstruction.lean:10:import Mathlib.Data.Set.Basic
lean/Cmrps/Vol08SpacetimeReconstruction.lean:11:import Mathlib.Data.Set.Insert
lean/Cmrps/Vol08SpacetimeReconstruction.lean:12:import Mathlib.Data.Set.Finite.Basic
lean/Cmrps/Vol08SpacetimeReconstruction.lean:13:import Mathlib.Data.Fintype.EquivFin
lean/Cmrps/Vol08SpacetimeReconstruction.lean:14:import Mathlib.Data.Fintype.Card
lean/Cmrps/Vol08SpacetimeReconstruction.lean:15:import Mathlib.Basic.Finite.Defs
lean/Cmrps/Vol08SpacetimeReconstruction.lean:16:import Mathlib.Basic.Logic.Basic
lean/Cmrps/Vol08SpacetimeReconstruction.lean:17:import Mathlib.Topology.Order
lean/Cmrps/Vol08SpacetimeReconstruction.lean:18:import Mathlib.Topology.Closure
lean/Cmrps/Vol08SpacetimeReconstruction.lean:19:import Mathlib.Topology.Inseparable
lean/Cmrps/Vol08SpacetimeReconstruction.lean:20:import Mathlib.Topology.Separation.Basic
lean/Cmrps/Vol08SpacetimeReconstruction.lean:21:import Mathlib.Topology.Compactness.Compact
lean/Cmrps/Vol08SpacetimeReconstruction.lean:22:import Mathlib.Tactic.Linarith
lean/Cmrps/Vol08SpacetimeReconstruction.lean:23:import Mathlib.Tactic.Ring
lean/Cmrps/Vol08SpacetimeReconstruction.lean:24:import Mathlib.Tactic.NormNum
lean/Cmrps/Vol08SpacetimeReconstruction.lean:54:reconstruction) are outside the reach of current Mathlib and are recorded in the
lean/Cmrps/Vol08SpacetimeReconstruction.lean:55:claim-status and conjecture registries instead of being stated here.
lean/Cmrps/Vol08SpacetimeReconstruction.lean:269:not formalized here and is recorded as informal in the claim-status registry. -/
lean/Cmrps/Vol07GaugeQft.lean:1:import Mathlib.Algebra.Algebra.Basic
lean/Cmrps/Vol07GaugeQft.lean:2:import Mathlib.Algebra.Module.LinearMap.Defs
lean/Cmrps/Vol07GaugeQft.lean:3:import Mathlib.Algebra.BigOperators.Group.Finset.Basic
lean/Cmrps/Vol07GaugeQft.lean:4:import Mathlib.Algebra.BigOperators.Group.List.Defs
lean/Cmrps/Vol07GaugeQft.lean:5:import Mathlib.Algebra.Group.Subgroup.Ker
lean/Cmrps/Vol07GaugeQft.lean:6:import Mathlib.Data.ZMod.Basic
lean/Cmrps/Vol07GaugeQft.lean:97:/-- A nonzero element pairs nontrivially against some element. -/
lean/Cmrps/Vol07GaugeQft.lean:233:`def:bvbrst-anomaly`: trivializability of the determinant line of the Dirac family
lean/Cmrps/Vol07GaugeQft.lean:236:  /-- Whether the determinant line `λ_det` is trivializable. -/
lean/Cmrps/Vol07GaugeQft.lean:242:requires a trivializable determinant line and a vanishing BRST anomaly class. -/
lean/Cmrps/Vol07GaugeQft.lean:253:theorem not_quantization_gate_of_not_trivial {A : Type*} [Zero A] (o : AnomalyObstruction A)
lean/Cmrps/Vol07GaugeQft.lean:270:  /-- Class of the trivial bundle. -/
lean/Cmrps/Vol07GaugeQft.lean:271:  trivial : B
lean/Cmrps/Vol07GaugeQft.lean:272:  /-- The trivial bundle has vanishing `w2`. -/
lean/Cmrps/Vol07GaugeQft.lean:273:  w2_trivial : w2 trivial = 0
lean/Cmrps/Vol07GaugeQft.lean:274:  /-- Some class has nonvanishing `w2`, so `w2` detects nontriviality. -/
lean/Cmrps/Vol07GaugeQft.lean:275:  exists_nontrivial : ∃ b : B, w2 b ≠ 0
lean/Cmrps/Vol07GaugeQft.lean:286:  trivial := 0
lean/Cmrps/Vol07GaugeQft.lean:287:  w2_trivial := rfl
lean/Cmrps/Vol07GaugeQft.lean:288:  exists_nontrivial := ⟨1, by decide⟩
lean/Cmrps/Vol07GaugeQft.lean:293:/-- Nonvanishing `w2` certifies that the class is not the trivial one. -/
lean/Cmrps/Vol07GaugeQft.lean:294:theorem w2_detects_nontrivial {B : Type*} (F : GlobalFormInvariant B) {b : B}
lean/Cmrps/Vol07GaugeQft.lean:295:    (h : F.w2 b ≠ 0) : b ≠ F.trivial := by
lean/Cmrps/Vol07GaugeQft.lean:298:  exact h F.w2_trivial
lean/Cmrps/Vol07GaugeQft.lean:301:single (trivial) isomorphism class of principal `SU(2)`-bundles over `S²`. -/
lean/Cmrps/Vol07GaugeQft.lean:304:theorem su2_bundles_over_s2_trivial (b : SU2BundleClass) : b = ⟨⟩ := by
lean/Cmrps/Vol05ClassicalSystems.lean:9:import Mathlib.Algebra.BigOperators.Fin
lean/Cmrps/Vol05ClassicalSystems.lean:10:import Mathlib.Algebra.BigOperators.Ring.Finset
lean/Cmrps/Vol05ClassicalSystems.lean:11:import Mathlib.Algebra.Lie.Basic
lean/Cmrps/Vol05ClassicalSystems.lean:12:import Mathlib.Algebra.Order.BigOperators.Group.Finset
lean/Cmrps/Vol05ClassicalSystems.lean:13:import Mathlib.Basic.Real.Basic
lean/Cmrps/Vol05ClassicalSystems.lean:14:import Mathlib.Data.Fin.VecNotation
lean/Cmrps/Vol05ClassicalSystems.lean:15:import Mathlib.Data.Matrix.Mul
lean/Cmrps/Vol05ClassicalSystems.lean:16:import Mathlib.LinearAlgebra.BilinearMap
lean/Cmrps/Vol05ClassicalSystems.lean:17:import Mathlib.LinearAlgebra.CrossProduct
lean/Cmrps/Vol05ClassicalSystems.lean:18:import Mathlib.LinearAlgebra.Dual.Defs
lean/Cmrps/Vol05ClassicalSystems.lean:19:import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
lean/Cmrps/Vol05ClassicalSystems.lean:20:import Mathlib.Tactic
lean/Cmrps/Vol05ClassicalSystems.lean:41:`verification/vol-05-classical-systems-claim-status.md` and
lean/Cmrps/Vol05ClassicalSystems.lean:290:computational claim 3): for a column-stochastic `T` the pullback of the Fisher
lean/Cmrps/Vol05ClassicalSystems.lean:477:/-- The monodromy is nontrivial: parallel transport around the critical value
lean/Cmrps/Vol04YonedaClassification.lean:15:import Mathlib.CategoryTheory.Discrete.Basic
lean/Cmrps/Vol04YonedaClassification.lean:16:import Mathlib.CategoryTheory.Limits.Preserves.Shapes.BinaryProducts
lean/Cmrps/Vol04YonedaClassification.lean:17:import Mathlib.CategoryTheory.Limits.Preserves.Shapes.Terminal
lean/Cmrps/Vol04YonedaClassification.lean:18:import Mathlib.CategoryTheory.Limits.Shapes.BinaryProducts.BinaryProducts
lean/Cmrps/Vol04YonedaClassification.lean:19:import Mathlib.CategoryTheory.Limits.Shapes.Terminal
lean/Cmrps/Vol04YonedaClassification.lean:20:import Mathlib.CategoryTheory.Limits.Yoneda
lean/Cmrps/Vol04YonedaClassification.lean:21:import Mathlib.CategoryTheory.Types.Basic
lean/Cmrps/Vol04YonedaClassification.lean:22:import Mathlib.CategoryTheory.Whiskering
lean/Cmrps/Vol04YonedaClassification.lean:23:import Mathlib.Algebra.MvPolynomial.Eval
lean/Cmrps/Vol04YonedaClassification.lean:24:import Mathlib.Basic.Complex.Basic
lean/Cmrps/Vol04YonedaClassification.lean:25:import Mathlib.Data.Matrix.Basis
lean/Cmrps/Vol04YonedaClassification.lean:26:import Mathlib.Data.Matrix.Diagonal
lean/Cmrps/Vol04YonedaClassification.lean:27:import Mathlib.LinearAlgebra.Matrix.Trace
lean/Cmrps/Vol06QuantumSystems.lean:19:`verification/vol-06-quantum-systems-claim-status.md` and
lean/Cmrps/Vol06QuantumSystems.lean:26:import Mathlib.Data.List.Basic
lean/Cmrps/Vol06QuantumSystems.lean:27:import Mathlib.Data.List.ProdSigma
lean/Cmrps/Vol06QuantumSystems.lean:28:import Mathlib.Data.List.Perm.Basic
lean/Cmrps/Vol06QuantumSystems.lean:29:import Mathlib.Data.List.Sort
lean/Cmrps/Vol06QuantumSystems.lean:30:import Mathlib.Data.List.OfFn
lean/Cmrps/Vol06QuantumSystems.lean:31:import Mathlib.Data.Matrix.Basic
lean/Cmrps/Vol06QuantumSystems.lean:32:import Mathlib.Algebra.BigOperators.Ring.List
lean/Cmrps/Vol06QuantumSystems.lean:33:import Mathlib.Algebra.BigOperators.Fin
lean/Cmrps/Vol06QuantumSystems.lean:34:import Mathlib.LinearAlgebra.Matrix.Trace
lean/Cmrps/Vol06QuantumSystems.lean:35:import Mathlib.LinearAlgebra.Dimension.Constructions
lean/Cmrps/Vol06QuantumSystems.lean:36:import Mathlib.Tactic
lean/Cmrps/Vol01Foundations.lean:6:import Mathlib
lean/Cmrps/Vol01Foundations.lean:35:dynamics is the identity, the symmetry is trivial, and the composition rule is
lean/Cmrps/Vol01Foundations.lean:217:in force, and fails on the admitted record `X = Fin 2`, `O = {δ₀, δ₁}` of point
lean/Cmrps/Vol01Foundations.lean:406:      have hu' : u ∈ s ∪ t := by rw [huniv]; trivial
name = "Cmrps"
version = "0.1.0"
defaultTargets = ["Cmrps"]

[[require]]
name = "mathlib"
git = "https://github.com/leanprover-community/mathlib4"
rev = "56a005855ea17e0b0958f73ec801ae140b0a1679"

[[lean_lib]]
name = "Cmrps"
leanprover/lean4:v4.35.0
exec
/usr/local/bin/zsh -lc 'cat lean/Cmrps/Vol08SpacetimeReconstruction.lean lean/Cmrps/Vol10ObservationalEquivalence.lean' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
/-
Copyright (c) 2026 The YonedaAI Collaboration. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: CMRPS formalization team
-/
import Mathlib.Basic.Real.Basic
import Mathlib.Order.Defs.PartialOrder
import Mathlib.Order.Defs.Unbundled
import Mathlib.Order.UpperLower.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Data.Set.Insert
import Mathlib.Data.Set.Finite.Basic
import Mathlib.Data.Fintype.EquivFin
import Mathlib.Data.Fintype.Card
import Mathlib.Basic.Finite.Defs
import Mathlib.Basic.Logic.Basic
import Mathlib.Topology.Order
import Mathlib.Topology.Closure
import Mathlib.Topology.Inseparable
import Mathlib.Topology.Separation.Basic
import Mathlib.Topology.Compactness.Compact
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Mathlib.Tactic.NormNum

/-!
# Volume 8: Classification and Reconstruction of Spacetime

Formalization targets from `verification/vol-08-spacetime-reconstruction-lean-targets.md`,
with identifiers mirroring the names of `papers/latex/vol-08-spacetime-reconstruction.tex`.

This module machine-checks the volume's own order-theoretic and entropy-vector
content:

* target `ladder_nontransfer_finite_orders` (Prop 6.3, Prop 6.4, Cor 6.5):
  no strictly increasing loop in a preorder, finite order intervals in a finite
  order, failure of distinguishing on the two-point antichain, and the
  non-transfer of the causal ladder to finite orders;
* target `mmi_independent_of_ssa` (Prop 8.2, Prop 8.4, Lemma 8.5, Lemma 8.6):
  the perfectly correlated triple satisfies strong subadditivity and violates
  monogamy of mutual information, so monogamy does not follow from strong
  subadditivity; the information and tripartite forms of monogamy; strong
  subadditivity from subadditivity plus monogamy;
* target `specialization_order_recovery` (Prop 9.4): the up-set topology of a
  partial order is T0, the closure of a singleton is its down-set, and the order
  is recovered from the closures;
* target `geometrization_dim3` (Thm 7.1) is formalized only as far as the
  eight-element type of Thurston model geometries (`card_thurstonGeometry3`);
  the geometrization theorem itself is a cited literature result and is not
  formalized here.

The deep cited theorems (Lorentzian holonomy classification, causal ladder
completeness, Tancer unrecognizability, entropy cone completeness, Malament
reconstruction) are outside the reach of current Mathlib and are recorded in the
claim-status and conjecture registries instead of being stated here.
-/

open scoped Topology

namespace Cmrps.Vol08

open Classical

/-! ## Causal relations and distinguishing (Definition 2.2, Definition 2.3) -/

/-- The strict chronological past of `x` for a relation `r` read strictly:
`I⁻(x) = {y | r y x}` (Definition 2.2 with the strict reading of Proposition 6.4). -/
def Past {α : Type*} (r : α → α → Prop) (x : α) : Set α := {y | r y x}

/-- The strict chronological future of `x` for a relation `r` read strictly:
`I⁺(x) = {y | r x y}` (Definition 2.2 with the strict reading of Proposition 6.4). -/
def Future {α : Type*} (r : α → α → Prop) (x : α) : Set α := {y | r x y}

/-- Past- and future-distinguishing for a relation read strictly (Definition 2.3):
the past map and the future map are each injective — past-distinguishing and
future-distinguishing hold *separately*, as in the paper (a single point pair is
already a witness when either map identifies it). -/
def IsDistinguishing {α : Type*} (r : α → α → Prop) : Prop :=
  Function.Injective (Past r) ∧ Function.Injective (Future r)

/-! ## Finite orders and the causal ladder (Proposition 6.3, Proposition 6.4,
Corollary 6.5; target `ladder_nontransfer_finite_orders`) -/

/-- Proposition 6.3 (prop:finiteposet), first half: no strictly increasing loop
`x₀ < x₁ < ⋯ < xₙ < x₀` exists in a preorder. A loop of strict inequalities would
give `g 0 < g 0` by transitivity. -/
theorem no_increasing_loop {X : Type*} [Preorder X] (n : ℕ) (g : ℕ → X)
    (hstep : ∀ k, k < n → g k < g (k + 1)) (hback : g n < g 0) : False := by
  have key : ∀ m, m ≤ n → g 0 < g m ∨ m = 0 := by
    intro m
    induction m with
    | zero => intro; exact Or.inr rfl
    | succ m ih =>
      intro hm
      have hmn : m < n := by omega
      rcases ih (by omega) with h | h
      · exact Or.inl (lt_trans h (hstep m hmn))
      · subst h; exact Or.inl (hstep 0 (by omega))
  rcases key n le_rfl with h | h
  · exact lt_asymm h hback
  · subst h; exact lt_irrefl (g 0) hback

/-- Proposition 6.3 (prop:finiteposet), second half: every order interval
`[x, y] = {z | x ≤ z ∧ z ≤ y}` of a finite order is a finite set. -/
theorem interval_finite {X : Type*} [Preorder X] [Finite X] (x y : X) :
    Set.Finite {z | x ≤ z ∧ z ≤ y} := Set.toFinite _

/-- Proposition 6.3 (prop:finiteposet): order intervals of a finite order are
compact in every topology on the order, since they are finite sets. -/
theorem interval_compact {X : Type*} [Preorder X] [Finite X] [TopologicalSpace X]
    (x y : X) : IsCompact {z | x ≤ z ∧ z ≤ y} :=
  (interval_finite x y).isCompact

/-- Proposition 6.4 (prop:distinguish): under the strict reading
`I⁺(x) = {y | x < y}`, `I⁻(x) = {y | y < x}` the two-element antichain fails
distinguishing: its two distinct points have equal empty pasts and equal empty
futures. -/
theorem antichain_fails_distinguishing :
    ∃ x y : Bool, x ≠ y ∧
      Past (fun _ _ : Bool => False) x = Past (fun _ _ : Bool => False) y ∧
      Future (fun _ _ : Bool => False) x = Future (fun _ _ : Bool => False) y := by
  refine ⟨false, true, by decide, ?_, ?_⟩ <;> rfl

/-- Corollary 6.5 (cor:notransfer): rung membership of the causal ladder does not
transfer from Lorentzian manifolds to finite orders. The two-element antichain is
a finite order (the order-theoretic compactness rung of Proposition 6.3 holds
there) on which the strict reading of distinguishing fails. -/
theorem ladder_nontransfer_finite_orders :
    Set.Finite (univ : Set Bool) ∧ ¬ IsDistinguishing (fun _ _ : Bool => False) := by
  refine ⟨Set.toFinite _, ?_⟩
  intro hd
  obtain ⟨x, y, hne, hp, hf⟩ := antichain_fails_distinguishing
  exact hne (hd.1 hp)

/-! ## Entropy vectors (Definition 2.5) -/

/-- Strong subadditivity `S(U) + S(V) ≥ S(U ∪ V) + S(U ∩ V)` for all unions
(equation eq:ssa). An entropy vector is modeled as a function on subsets of the
region index type. -/
def Ssa {ι : Type*} (S : Set ι → ℝ) : Prop :=
  ∀ u v : Set ι, S (u ∪ v) + S (u ∩ v) ≤ S u + S v

/-- Subadditivity `S(AB) ≤ S(A) + S(B)`. -/
def Subadditive {ι : Type*} (S : Set ι → ℝ) : Prop :=
  ∀ u v : Set ι, S (u ∪ v) ≤ S u + S v

/-- The Araki-Lieb bound `|S(A) − S(B)| ≤ S(AB)`. -/
def ArakiLieb {ι : Type*} (S : Set ι → ℝ) : Prop :=
  ∀ u v : Set ι, |S u - S v| ≤ S (u ∪ v)

/-- Monogamy of mutual information `S(A) + S(B) + S(C) + S(ABC) ≤ S(AB) + S(AC) +
S(BC)` (equation eq:mmi) for three disjoint regions given as sets of the region
index type. -/
def Mmi {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) : Prop :=
  S A + S B + S C + S (A ∪ B ∪ C) ≤ S (A ∪ B) + S (A ∪ C) + S (B ∪ C)

/-- Mutual information `I(A:B) = S(A) + S(B) − S(AB)`. -/
def MutualInfo {ι : Type*} (S : Set ι → ℝ) (A B : Set ι) : ℝ :=
  S A + S B - S (A ∪ B)

/-- Conditional mutual information `I(A:B|C) = S(AC) + S(BC) − S(ABC) − S(C)`. -/
def CondMutualInfo {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) : ℝ :=
  S (A ∪ C) + S (B ∪ C) - S (A ∪ B ∪ C) - S C

/-- Tripartite information `I₃(A:B:C) = I(A:B) + I(A:C) − I(A:BC)`. -/
def TripartiteInfo {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) : ℝ :=
  MutualInfo S A B + MutualInfo S A C - MutualInfo S A (B ∪ C)

/-! ## The perfectly correlated triple (Proposition 8.2, Lemma 8.6; target
`mmi_independent_of_ssa`) -/

/-- The entropy vector of the perfectly correlated triple `A = B = C = X` with
`X` a uniform bit: every nonempty union has entropy `1`, the empty set has
entropy `0` (Proposition 8.2). -/
noncomputable def correlatedTripleWitness (u : Set (Fin 3)) : ℝ :=
  if u = ∅ then 0 else 1

theorem correlatedTripleWitness_empty :
    correlatedTripleWitness (∅ : Set (Fin 3)) = 0 := by
  simp [correlatedTripleWitness]

theorem correlatedTripleWitness_eq_one {u : Set (Fin 3)} (hu : u ≠ ∅) :
    correlatedTripleWitness u = 1 := by
  simp [correlatedTripleWitness, hu]

theorem correlatedTripleWitness_nonneg (u : Set (Fin 3)) :
    0 ≤ correlatedTripleWitness u := by
  rcases eq_or_ne u ∅ with hu | hu
  · norm_num [correlatedTripleWitness, hu]
  · norm_num [correlatedTripleWitness, hu]

theorem correlatedTripleWitness_le_one (u : Set (Fin 3)) :
    correlatedTripleWitness u ≤ 1 := by
  rcases eq_or_ne u ∅ with hu | hu
  · norm_num [correlatedTripleWitness, hu]
  · norm_num [correlatedTripleWitness, hu]

/-- Proposition 8.2 (prop:mmi): the witness vector satisfies every strong
subadditivity inequality (case analysis on the two sets). -/
theorem correlatedTripleWitness_ssa : Ssa (correlatedTripleWitness : Set (Fin 3) → ℝ) := by
  intro u v
  rcases eq_or_ne u ∅ with hu | hu
  · subst u
    simp only [Set.empty_union, Set.empty_inter, correlatedTripleWitness_empty,
      add_zero, zero_add]
    exact le_rfl
  · rcases eq_or_ne v ∅ with hv | hv
    · subst v
      simp only [Set.union_empty, Set.inter_empty, correlatedTripleWitness_empty,
        add_zero, zero_add]
      exact le_rfl
    · have eu := correlatedTripleWitness_eq_one hu
      have ev := correlatedTripleWitness_eq_one hv
      have e1 := correlatedTripleWitness_le_one (u ∪ v)
      have e2 := correlatedTripleWitness_le_one (u ∩ v)
      linarith

/-- Proposition 8.2 (prop:mmi): the witness vector violates monogamy of mutual
information on the triple of single regions: the left side equals `4` and the
right side equals `3`. -/
theorem correlatedTripleWitness_mmi_fails :
    ¬ Mmi correlatedTripleWitness ({0} : Set (Fin 3)) {1} {2} := by
  have h0 : (({0} : Set (Fin 3))) ≠ ∅ := (Set.singleton_nonempty 0).ne_empty
  have h1 : (({1} : Set (Fin 3))) ≠ ∅ := (Set.singleton_nonempty 1).ne_empty
  have h2 : (({2} : Set (Fin 3))) ≠ ∅ := (Set.singleton_nonempty 2).ne_empty
  have un : ∀ {s t : Set (Fin 3)}, s ≠ ∅ → s ∪ t ≠ ∅ := fun hs h => hs (Set.union_empty_iff.1 h).1
  have h01 : (({0} : Set (Fin 3)) ∪ {1}) ≠ ∅ := un h0
  have h02 : (({0} : Set (Fin 3)) ∪ {2}) ≠ ∅ := un h0
  have h12 : (({1} : Set (Fin 3)) ∪ {2}) ≠ ∅ := un h1
  have h012 : (({0} : Set (Fin 3)) ∪ {1} ∪ {2}) ≠ ∅ := un h01
  have e0 := correlatedTripleWitness_eq_one h0
  have e1 := correlatedTripleWitness_eq_one h1
  have e2 := correlatedTripleWitness_eq_one h2
  have e01 := correlatedTripleWitness_eq_one h01
  have e02 := correlatedTripleWitness_eq_one h02
  have e12 := correlatedTripleWitness_eq_one h12
  have e012 := correlatedTripleWitness_eq_one h012
  simp only [Mmi, e0, e1, e2, e01, e02, e12, e012]
  norm_num

/-- The numerical margin of Proposition 8.2: on the witness the monogamy left
side equals `4` and the right side equals `3`, a violation of `1`. -/
theorem correlatedTripleWitness_mmi_margin :
    correlatedTripleWitness ({0} : Set (Fin 3)) + correlatedTripleWitness {1} +
        correlatedTripleWitness {2} + correlatedTripleWitness ({0} ∪ {1} ∪ {2}) = 4 ∧
      correlatedTripleWitness (({0} : Set (Fin 3)) ∪ {1}) +
        correlatedTripleWitness ({0} ∪ {2}) + correlatedTripleWitness ({1} ∪ {2}) = 3 := by
  have h0 : (({0} : Set (Fin 3))) ≠ ∅ := (Set.singleton_nonempty 0).ne_empty
  have h1 : (({1} : Set (Fin 3))) ≠ ∅ := (Set.singleton_nonempty 1).ne_empty
  have h2 : (({2} : Set (Fin 3))) ≠ ∅ := (Set.singleton_nonempty 2).ne_empty
  have un : ∀ {s t : Set (Fin 3)}, s ≠ ∅ → s ∪ t ≠ ∅ := fun hs h => hs (Set.union_empty_iff.1 h).1
  have h01 : (({0} : Set (Fin 3)) ∪ {1}) ≠ ∅ := un h0
  have h02 : (({0} : Set (Fin 3)) ∪ {2}) ≠ ∅ := un h0
  have h12 : (({1} : Set (Fin 3)) ∪ {2}) ≠ ∅ := un h1
  have h012 : (({0} : Set (Fin 3)) ∪ {1} ∪ {2}) ≠ ∅ := un h01
  simp only [correlatedTripleWitness_eq_one h0, correlatedTripleWitness_eq_one h1,
    correlatedTripleWitness_eq_one h2, correlatedTripleWitness_eq_one h01,
    correlatedTripleWitness_eq_one h02, correlatedTripleWitness_eq_one h12,
    correlatedTripleWitness_eq_one h012]
  norm_num

/-- Proposition 8.2 (prop:mmi) / target `mmi_independent_of_ssa`: the entropy
vector of a perfectly correlated triple satisfies strong subadditivity and
violates monogamy of mutual information, so monogamy is not implied by strong
subadditivity over entropy functions of three regions.

The witness is the classical entropy vector of a uniform shared bit (the paper's
Proposition 8.2 realizes it as an entropic vector); the entropic realization is
not formalized here and is recorded as informal in the claim-status registry. -/
theorem mmi_independent_of_ssa :
    Ssa correlatedTripleWitness ∧
      ¬ Mmi correlatedTripleWitness ({0} : Set (Fin 3)) {1} {2} ∧
      ¬ (∀ S : Set (Fin 3) → ℝ, Ssa S → Mmi S {0} {1} {2}) :=
  ⟨correlatedTripleWitness_ssa, correlatedTripleWitness_mmi_fails,
    fun h => correlatedTripleWitness_mmi_fails (h _ correlatedTripleWitness_ssa)⟩

/-- Lemma 8.6 (lem:witnessclean): the witness vector is nonnegative, vanishes on
the empty set, and satisfies subadditivity, the Araki-Lieb bound, and strong
subadditivity. It violates only monogamy. -/
theorem correlatedTripleWitness_clean :
    (∀ u : Set (Fin 3), 0 ≤ correlatedTripleWitness u) ∧
      correlatedTripleWitness (∅ : Set (Fin 3)) = 0 ∧
      Subadditive correlatedTripleWitness ∧
      ArakiLieb correlatedTripleWitness ∧
      Ssa correlatedTripleWitness ∧
      ¬ Mmi correlatedTripleWitness ({0} : Set (Fin 3)) {1} {2} := by
  refine ⟨correlatedTripleWitness_nonneg, correlatedTripleWitness_empty,
    ?_, ?_, correlatedTripleWitness_ssa, correlatedTripleWitness_mmi_fails⟩
  · intro u v
    rcases eq_or_ne u ∅ with hu | hu
    · subst u
      simp only [Set.empty_union, correlatedTripleWitness_empty, zero_add]
      exact le_rfl
    · rcases eq_or_ne v ∅ with hv | hv
      · subst v
        simp only [Set.union_empty, correlatedTripleWitness_empty, add_zero]
        exact le_rfl
      · have eu := correlatedTripleWitness_eq_one hu
        have ev := correlatedTripleWitness_eq_one hv
        have euv := correlatedTripleWitness_eq_one (u := u ∪ v)
          (fun h => hu (Set.union_empty_iff.1 h).1)
        linarith
  · intro u v
    rcases eq_or_ne u ∅ with hu | hu
    · rcases eq_or_ne v ∅ with hv | hv
      · subst u; subst v
        norm_num [correlatedTripleWitness_empty, Set.empty_union, sub_self, abs_zero]
      · subst u
        rw [Set.empty_union, correlatedTripleWitness_empty,
          correlatedTripleWitness_eq_one hv]
        norm_num
    · rcases eq_or_ne v ∅ with hv | hv
      · subst v
        rw [Set.union_empty, correlatedTripleWitness_empty,
          correlatedTripleWitness_eq_one hu]
        norm_num
      · rw [correlatedTripleWitness_eq_one hu, correlatedTripleWitness_eq_one hv,
          sub_self, abs_zero]
        exact correlatedTripleWitness_nonneg _

/-! ## Two forms of monogamy (Proposition 8.4; target `mmi_independent_of_ssa`) -/

/-- Proposition 8.4 (prop:mmiform): monogamy of mutual information is equivalent
to the information form `I(A:B) + I(A:C) ≤ I(A:BC)`; the proof is the algebraic
rearrangement of the paper. -/
theorem mmi_iff_information_form {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) :
    Mmi S A B C ↔ MutualInfo S A B + MutualInfo S A C ≤ MutualInfo S A (B ∪ C) := by
  simp only [Mmi, MutualInfo, Set.union_assoc]
  constructor <;> intro h <;> linarith

/-- Proposition 8.4 (prop:mmiform): monogamy of mutual information is equivalent
to nonpositivity of the tripartite information `I₃(A:B:C)`. -/
theorem mmi_iff_tripartite_nonpos {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) :
    Mmi S A B C ↔ TripartiteInfo S A B C ≤ 0 := by
  rw [mmi_iff_information_form]
  simp only [TripartiteInfo]
  constructor <;> intro h <;> linarith

/-- Lemma 8.5 (lem:ssaredundant), proof step: the conditional mutual information
factors as `I(A:C|B) = I(A:BC) − I(A:B)`. -/
theorem cmi_factorization {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) :
    CondMutualInfo S A C B = MutualInfo S A (B ∪ C) - MutualInfo S A B := by
  have hcb : C ∪ B = B ∪ C := Set.union_comm _ _
  have habc : (A ∪ C) ∪ B = A ∪ (B ∪ C) := by rw [Set.union_assoc, Set.union_comm C B]
  simp only [CondMutualInfo, MutualInfo, hcb, habc]
  ring

/-- Lemma 8.5 (lem:ssaredundant): for three regions, strong subadditivity
`I(A:C|B) ≥ 0` follows from subadditivity `I(A:C) ≥ 0` together with monogamy of
mutual information. At three regions the strong subadditivity family is a
consequence rather than an independent input (n = 4 composite instances remain
independent, as the paper notes). -/
theorem ssa_of_subadditive_and_mmi {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι)
    (hsub : 0 ≤ MutualInfo S A C) (hmmi : Mmi S A B C) :
    0 ≤ CondMutualInfo S A C B := by
  rw [cmi_factorization]
  have hinfo : MutualInfo S A B + MutualInfo S A C ≤ MutualInfo S A (B ∪ C) :=
    (mmi_iff_information_form S A B C).1 hmmi
  linarith

/-! ## Up-set topology and specialization order (Proposition 9.4; target
`specialization_order_recovery`) -/

/-- The up-set (P. S. Alexandroff) topology of a preorder: the open sets are the
upper sets (Definition 2 discussion and Proposition 9.4). -/
def upSetTopology (α : Type*) [Preorder α] : TopologicalSpace α :=
  TopologicalSpace.generateFrom {u | IsUpperSet u}

theorem isUpperSet_of_isOpen {α : Type*} [Preorder α] {s : Set α}
    (hs : IsOpen[upSetTopology α] s) : IsUpperSet s := by
  have hs' : TopologicalSpace.GenerateOpen {u | IsUpperSet u} s := hs
  induction hs' with
  | basic u hu => exact hu
  | univ => exact isUpperSet_univ
  | inter u v hu hv ih1 ih2 => exact fun a b hab ha => ⟨ih1 hu hab ha.1, ih2 hv hab ha.2⟩
  | sUnion S h ih => exact isUpperSet_sUnion fun t ht => ih t ht (h t ht)

theorem isOpen_iff_isUpperSet {α : Type*} [Preorder α] {s : Set α} :
    IsOpen[upSetTopology α] s ↔ IsUpperSet s :=
  ⟨isUpperSet_of_isOpen, fun h => TopologicalSpace.isOpen_generateFrom_of_mem h⟩

theorem isClosed_iff_isLowerSet {α : Type*} [Preorder α] {s : Set α} :
    IsClosed[upSetTopology α] s ↔ IsLowerSet s := by
  letI : TopologicalSpace α := upSetTopology α
  constructor
  · intro h
    exact isUpperSet_compl.1 (isUpperSet_of_isOpen h.isOpen_compl)
  · intro h
    exact ⟨isOpen_iff_isUpperSet.2 (isUpperSet_compl.2 h)⟩

/-- Proposition 9.4 (prop:specialization), separation step: distinct points of a
partial order are separated by an up-set. -/
theorem exists_upperSet_separating {α : Type*} [PartialOrder α] (x y : α) (hne : x ≠ y) :
    ∃ u : Set α, IsUpperSet u ∧ ((x ∈ u ∧ y ∉ u) ∨ (y ∈ u ∧ x ∉ u)) := by
  have hanti : ¬ (x ≤ y ∧ y ≤ x) := fun h => hne (h.1.antisymm h.2)
  rcases not_and_or.mp hanti with h | h
  · refine ⟨{z | ¬ z ≤ y}, ?_, Or.inl ⟨h, fun hh => hh le_rfl⟩⟩
    intro a b hab ha hby
    exact (Set.mem_setOf.1 ha) (le_trans hab hby)
  · refine ⟨{z | ¬ z ≤ x}, ?_, Or.inr ⟨h, fun hh => hh le_rfl⟩⟩
    intro a b hab ha hbx
    exact (Set.mem_setOf.1 ha) (le_trans hab hbx)

/-- Proposition 9.4 (prop:specialization): the closure of a singleton in the
up-set topology is its down-set `cl({x}) = {y | y ≤ x}`. -/
theorem closure_singleton_eq_downset {α : Type*} [PartialOrder α] (x : α) :
    @closure α (upSetTopology α) ({x} : Set α) = {y | y ≤ x} := by
  letI : TopologicalSpace α := upSetTopology α
  apply le_antisymm
  · refine closure_minimal ?_ ?_
    · intro z hz
      simp only [Set.mem_singleton_iff] at hz
      subst hz
      exact le_rfl
    · rw [isClosed_iff_isLowerSet]
      exact fun a b hba ha => le_trans hba ha
  · intro y hy
    have hx : x ∈ @closure α (upSetTopology α) ({x} : Set α) :=
      subset_closure (Set.mem_singleton x)
    have hlow : IsLowerSet (@closure α (upSetTopology α) ({x} : Set α)) :=
      isClosed_iff_isLowerSet.1 isClosed_closure
    exact hlow hy hx

/-- Proposition 9.4 (prop:specialization): the order is read off the closures:
`x ≤ y` if and only if `x ∈ cl({y})`. -/
theorem le_iff_mem_closure {α : Type*} [PartialOrder α] (x y : α) :
    x ≤ y ↔ x ∈ @closure α (upSetTopology α) ({y} : Set α) := by
  letI : TopologicalSpace α := upSetTopology α
  rw [closure_singleton_eq_downset]
  exact Iff.rfl

/-- Proposition 9.4 (prop:specialization): the up-set topology of a partial order
is T₀ (two distinct points are separated by an open up-set). -/
theorem upSetTopology_t0Space {α : Type*} [PartialOrder α] :
    @T0Space α (upSetTopology α) := by
  letI : TopologicalSpace α := upSetTopology α
  refine ⟨fun x y hxy => ?_⟩
  by_contra hne
  obtain ⟨u, hu, hsep⟩ := exists_upperSet_separating x y hne
  have hopen : IsOpen[upSetTopology α] u := TopologicalSpace.isOpen_generateFrom_of_mem hu
  have hiff := inseparable_iff_forall_isOpen.1 hxy u hopen
  rcases hsep with ⟨hx, hy⟩ | ⟨hy, hx⟩
  · exact hy (hiff.1 hx)
  · exact hx (hiff.2 hy)

/-- Proposition 9.4 (prop:specialization) / target `specialization_order_recovery`:
the up-set topology of a partial order is T₀, the closure of each singleton is
its down-set, and the order is recovered from the closures. -/
theorem specialization_order_recovery {α : Type*} [PartialOrder α] :
    (∀ x y : α, x ≠ y → ∃ u, IsUpperSet u ∧ ((x ∈ u ∧ y ∉ u) ∨ (y ∈ u ∧ x ∉ u))) ∧
      (∀ x : α, @closure α (upSetTopology α) ({x} : Set α) = {y | y ≤ x}) ∧
      (∀ x y : α, x ≤ y ↔ x ∈ @closure α (upSetTopology α) ({y} : Set α)) ∧
      @T0Space α (upSetTopology α) :=
  ⟨fun x y => exists_upperSet_separating x y, fun x => closure_singleton_eq_downset x,
    fun x y => le_iff_mem_closure x y, upSetTopology_t0Space⟩

/-! ## Thurston model geometries (Theorem 7.1, Table 4; target
`geometrization_dim3`, partial) -/

/-- The eight Thurston model geometries of dimension three (Theorem 7.1,
Table 4): `E³`, `S³`, `H³`, `S² × ℝ`, `H² × ℝ`, `Nil`, `Sol`, `SL̃(2,ℝ)`. -/
inductive ThurstonGeometry3 : Type where
  | e3 | s3 | h3 | s2TimesR | h2TimesR | nil | sol | sl2tilde
  deriving DecidableEq, Repr

instance : Fintype ThurstonGeometry3 where
  elems := { .e3, .s3, .h3, .s2TimesR, .h2TimesR, .nil, .sol, .sl2tilde }
  complete := by intro x; cases x <;> simp

/-- Theorem 7.1 (thm:geometrization), type-level fragment: the list of Thurston
model geometries in dimension three has exactly eight entries. The geometrization
decomposition theorem itself (every closed 3-manifold decomposes into pieces
carrying one of these geometries) is a cited literature result and is not
formalized here. -/
theorem card_thurstonGeometry3 : Fintype.card ThurstonGeometry3 = 8 := by decide

end Cmrps.Vol08
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Tactic

/-!
# Observational Equivalence and Physical Distinguishability (Volume 10)

Formalization of the tractable mechanization targets of
`verification/vol-10-observational-equivalence-lean-targets.md`, mirroring the names of
`papers/latex/vol-10-observational-equivalence.tex`.

Policy of this module: definitions are stated directly; survey theorems whose content is
external literature (Etingof–Gelaki, Chentsov, Petz–Sudar) are formalized as their honest
logical skeleton, with the classical inputs recorded as explicit hypotheses or as
statement definitions left unproved. Nothing in this file uses `sorry` or new axioms.
-/

namespace Cmrps.Vol10

/-! ## Equivalence notions (Definitions 2.1–2.7) -/

/-- Definition 2.1 (System record): a physical system representation is a tuple
`P = (X, O, D, S, C)` of state space, observable collection, dynamics, symmetry and
constraint data, and composition rules. -/
structure SystemRecord where
  /-- State space or geometric structure. -/
  X : Type
  /-- Observable algebra or collection. -/
  O : Type
  /-- Dynamical data. -/
  D : Type
  /-- Symmetry and constraint data. -/
  S : Type
  /-- Composition or interaction rules. -/
  C : Type

/-- Definition 2.5 (admissible candidate relation): a candidate `≃` is admissible only if
`≅ ⊆ ≃` and `≃` is contained in the intersection of the admissible observational
relations. Here `mathIso` is mathematical equivalence and `admissible` is the family of
admissible observational relations `≈_Obs`. -/
def AdmissibleCandidate {S : Type*} (mathIso : S → S → Prop)
    (admissible : Set (S → S → Prop)) (candidate : S → S → Prop) : Prop :=
  (∀ P Q, mathIso P Q → candidate P Q) ∧
    ∀ P Q, candidate P Q → ∀ rel ∈ admissible, rel P Q

/-- The equivalence notion in force (Definition 2.6). -/
inductive EquivalenceNotion where
  | mathematical
  | physical
deriving DecidableEq, Repr

/-- The morphism kinds of the object schema at the observational level
(Definition 2.7). -/
inductive MorphismKind where
  | coarseGraining
  | embedding
  | duality
  | limitingProcedure
deriving DecidableEq, Repr

/-- The layers of structure an identification may preserve (Definition 2.6, Table 3). -/
inductive PreservedLayer where
  | symmetricMonoidal
  | braided
  | monoidalWithoutSymmetry
  | star
  | algebraic
  | topological
  | completePositivity
  | unitaryFreedom
deriving DecidableEq, Repr

/-- Definition 2.6 (equivalence witness): an identification of two systems records the
equivalence notion in force, the morphism kind realizing it, and the layers of structure
it preserves. -/
structure EquivalenceWitness where
  /-- The equivalence notion in force. -/
  notion : EquivalenceNotion
  /-- The morphism kind realizing the identification. -/
  morphism : MorphismKind
  /-- The layers of structure the identification preserves. -/
  preservedLayers : Set PreservedLayer

/-- A witness declares the symmetric monoidal layer. -/
def DeclaresSymmetric (w : EquivalenceWitness) : Prop :=
  PreservedLayer.symmetricMonoidal ∈ w.preservedLayers

/-! ## Observation functors (Definition 4.1, Definition 2.4) -/

/-- Definition 4.1 (observation functor), skeletal form: a functor `Obs` from systems to
observation records, with record comparison abstracted as record isomorphism (an
equivalence relation on records). -/
structure ObservationFunctor (S R : Type*) where
  /-- The observation record of a system. -/
  obs : S → R
  /-- Isomorphism of observation records. -/
  recordIso : R → R → Prop
  /-- Record isomorphism is an equivalence relation. -/
  recordIso_equiv : Equivalence recordIso

/-- Definition 2.4 (observational equivalence): `P ≈ Q` when the observation records of
`P` and `Q` are isomorphic. -/
def obsEquiv {S R : Type*} (F : ObservationFunctor S R) (P Q : S) : Prop :=
  F.recordIso (F.obs P) (F.obs Q)

/-- The record isomorphism class of a record (Proposition 4.2). -/
def recordClass {R : Type*} (rel : R → R → Prop) (h : Equivalence rel) : R → Quotient ⟨rel, h⟩ :=
  Quotient.mk ⟨rel, h⟩

/-- Proposition 4.2 (induced relation): the relation `P ≈ Q` defined by record
isomorphism is an equivalence relation on systems. -/
theorem obs_induced_equivalence {S R : Type*} (F : ObservationFunctor S R) :
    Equivalence (obsEquiv F) where
  refl _P := F.recordIso_equiv.refl _
  symm h := F.recordIso_equiv.symm h
  trans h1 h2 := F.recordIso_equiv.trans h1 h2

/-- Proposition 4.2 (classes are fibers): `P ≈ Q` holds exactly when the record
isomorphism classes of `Obs P` and `Obs Q` coincide. -/
theorem obs_class_fibers {S R : Type*} (F : ObservationFunctor S R) (P Q : S) :
    recordClass F.recordIso F.recordIso_equiv (F.obs P)
      = recordClass F.recordIso F.recordIso_equiv (F.obs Q) ↔ obsEquiv F P Q := by
  constructor
  · intro h
    exact Quotient.exact h
  · intro h
    exact Quotient.sound h

/-- Proposition 4.2 (universal quotient property): every map out of the systems that is
constant on `≈`-classes factors uniquely through the quotient by `≈`. -/
theorem obs_quotient_factor {S T R : Type*} (F : ObservationFunctor S R)
    (f : S → T) (hf : ∀ P Q, obsEquiv F P Q → f P = f Q) :
    ∃! g : Quotient ⟨obsEquiv F, obs_induced_equivalence F⟩ → T,
      ∀ P, g (Quotient.mk _ P) = f P := by
  refine ⟨Quotient.lift f (fun P Q h => hf P Q h), ?_, ?_⟩
  · intro P
    rfl
  · intro g hg
    funext x
    refine Quotient.inductionOn x fun P => ?_
    exact hg P

/-- Lemma 4.3 (setup): the product of two observation functors is an observation functor
into the product of the record categories. -/
def ObservationFunctor.prod {S R₁ R₂ : Type*} (F₁ : ObservationFunctor S R₁)
    (F₂ : ObservationFunctor S R₂) : ObservationFunctor S (R₁ × R₂) where
  obs := fun P => (F₁.obs P, F₂.obs P)
  recordIso := fun x y => F₁.recordIso x.1 y.1 ∧ F₂.recordIso x.2 y.2
  recordIso_equiv :=
    { refl := fun _x => ⟨F₁.recordIso_equiv.refl _, F₂.recordIso_equiv.refl _⟩
      symm := fun ⟨h1, h2⟩ => ⟨F₁.recordIso_equiv.symm h1, F₂.recordIso_equiv.symm h2⟩
      trans := fun ⟨a, b⟩ ⟨c, d⟩ =>
        ⟨F₁.recordIso_equiv.trans a c, F₂.recordIso_equiv.trans b d⟩ }

/-- Lemma 4.3 (products of observations): the relation induced by a product of
observation functors is the intersection of the relations of the two factors. -/
theorem obs_products_intersection {S R₁ R₂ : Type*} (F₁ : ObservationFunctor S R₁)
    (F₂ : ObservationFunctor S R₂) (P Q : S) :
    obsEquiv (F₁.prod F₂) P Q ↔ obsEquiv F₁ P Q ∧ obsEquiv F₂ P Q :=
  Iff.rfl

/-! ## Coarse and fine observations (Definition 4.4, Proposition 4.5) -/

/-- Definition 4.4 (coarse and fine observations): `Obs_c` is a coarsening of `Obs_f`
when a forgetting map `h` on records exists with `Obs_c = h ∘ Obs_f`. -/
structure Coarsening {S Rf Rc : Type*} (Ff : ObservationFunctor S Rf) (obsC : S → Rc) where
  /-- The comparison map on records that forgets detail. -/
  h : Rf → Rc
  /-- `Obs_c = h ∘ Obs_f` on systems. -/
  factors : obsC = h ∘ Ff.obs

/-- Proposition 4.5 (coarse records separate less), inclusion direction: if
`Obs_c = h ∘ Obs_f` and `h` carries record isomorphisms to record isomorphisms, then
fine equivalence implies coarse equivalence. -/
theorem obs_coarse_graining_composition {S Rf Rc : Type*}
    (Ff : ObservationFunctor S Rf) (Fc : ObservationFunctor S Rc)
    (h : Rf → Rc) (factors : Fc.obs = h ∘ Ff.obs)
    (h_mono : ∀ x y, Ff.recordIso x y → Fc.recordIso (h x) (h y))
    (P Q : S) (hpq : obsEquiv Ff P Q) : obsEquiv Fc P Q := by
  have hP : Fc.obs P = h (Ff.obs P) := by rw [factors]; rfl
  have hQ : Fc.obs Q = h (Ff.obs Q) := by rw [factors]; rfl
  show Fc.recordIso (Fc.obs P) (Fc.obs Q)
  rw [hP, hQ]
  exact h_mono (Ff.obs P) (Ff.obs Q) hpq

/-! ## The four-point witness of §9.1 -/

/-- A probability vector on the four-point sample space `Ω = {1,2,3,4}` of §9.1. -/
structure Dist4 where
  x1 : ℚ
  x2 : ℚ
  x3 : ℚ
  x4 : ℚ
deriving DecidableEq, Repr

/-- The distribution `p = (1/2, 1/4, 1/8, 1/8)` of §9.1. -/
def pDist : Dist4 := ⟨1/2, 1/4, 1/8, 1/8⟩

/-- The distribution `q = (1/4, 1/2, 1/8, 1/8)` of §9.1. -/
def qDist : Dist4 := ⟨1/4, 1/2, 1/8, 1/8⟩

/-- The distribution `r = (1/8, 1/8, 1/2, 1/4)` of §9.4. -/
def rDist : Dist4 := ⟨1/8, 1/8, 1/2, 1/4⟩

/-- Experiment `e1 = {{1,2},{3,4}}`: its outcome distribution on `v`. -/
def e1Push (v : Dist4) : ℚ × ℚ := (v.x1 + v.x2, v.x3 + v.x4)

/-- Experiment `e2 = {{1,3},{2,4}}`: its outcome distribution on `v`. -/
def e2Push (v : Dist4) : ℚ × ℚ := (v.x1 + v.x3, v.x2 + v.x4)

/-- Experiment `e3 = {{1,4},{2,3}}`: its outcome distribution on `v`. -/
def e3Push (v : Dist4) : ℚ × ℚ := (v.x1 + v.x4, v.x2 + v.x3)

/-- Two distributions report the same record for the experiment `push`. -/
def SameRecord (push : Dist4 → ℚ × ℚ) (v w : Dist4) : Prop :=
  (push v).1 = (push w).1 ∧ (push v).2 = (push w).2

/-- The diagonal joint event `{ω1 = ω2}` on the composite `Ω × Ω` (Proposition 4.6). -/
def diagJoint (v w : Dist4) : ℚ :=
  v.x1 * w.x1 + v.x2 * w.x2 + v.x3 * w.x3 + v.x4 * w.x4

/-- Proposition 4.5 (strictness witness of §9.1): the coarse record `e1` identifies `p`
and `q`, while the fine record over `e1` and `e2` separates them; the inclusion of
relations is strict. -/
theorem obs_coarse_witness :
    SameRecord e1Push pDist qDist ∧ ¬ SameRecord e2Push pDist qDist := by
  constructor
  · show (e1Push pDist).1 = (e1Push qDist).1 ∧ (e1Push pDist).2 = (e1Push qDist).2
    constructor
    · norm_num [e1Push, pDist, qDist]
    · norm_num [e1Push, pDist, qDist]
  · intro h
    norm_num [SameRecord, e2Push, pDist, qDist] at h

/-! ## Composed experiments (Proposition 4.6) -/

/-- The observation functor of a composite system whose record is the product of the
factor records (the hypothesis of Proposition 4.6). -/
def ObservationFunctor.compProd {S₁ S₂ R₁ R₂ : Type*} (F₁ : ObservationFunctor S₁ R₁)
    (F₂ : ObservationFunctor S₂ R₂) : ObservationFunctor (S₁ × S₂) (R₁ × R₂) where
  obs := fun PQ => (F₁.obs PQ.1, F₂.obs PQ.2)
  recordIso := fun x y => F₁.recordIso x.1 y.1 ∧ F₂.recordIso x.2 y.2
  recordIso_equiv :=
    { refl := fun _x => ⟨F₁.recordIso_equiv.refl _, F₂.recordIso_equiv.refl _⟩
      symm := fun ⟨h1, h2⟩ => ⟨F₁.recordIso_equiv.symm h1, F₂.recordIso_equiv.symm h2⟩
      trans := fun ⟨a, b⟩ ⟨c, d⟩ =>
        ⟨F₁.recordIso_equiv.trans a c, F₂.recordIso_equiv.trans b d⟩ }

/-- Proposition 4.6 (composed experiments), product direction: under product records
indistinguishability of the factors is preserved on composites. -/
theorem obs_composed_product_preserved {S₁ S₂ R₁ R₂ : Type*}
    (F₁ : ObservationFunctor S₁ R₁) (F₂ : ObservationFunctor S₂ R₂)
    (P P' : S₁) (Q Q' : S₂)
    (hP : obsEquiv F₁ P P') (hQ : obsEquiv F₂ Q Q') :
    obsEquiv (F₁.compProd F₂) (P, Q) (P', Q') :=
  ⟨hP, hQ⟩

/-- Proposition 4.6 (composed experiments), failure witness: the factor records of `p`
and `q` under `e1` coincide, yet the diagonal joint experiment on the composite
separates `p × p` from `p × q`, reporting `11/32` against `9/32`. -/
theorem obs_composed_experiments_failure :
    SameRecord e1Push pDist qDist
      ∧ diagJoint pDist pDist = 11/32
      ∧ diagJoint pDist qDist = 9/32
      ∧ (11/32 : ℚ) ≠ 9/32 := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · exact obs_coarse_witness.1
  · norm_num [diagJoint, pDist, qDist]
  · norm_num [diagJoint, pDist, qDist]
  · norm_num

/-! ## Structure preservation and its failure (Theorem 3.1, Corollary 3.2) -/

/-- Theorem 3.1 (Etingof–Gelaki) as hypothesis data: non-isomorphic finite groups whose
complex representation categories are equivalent as plain tensor categories. The
construction itself is literature; this record packages exactly the data the corollary
needs. -/
structure PlainTensorCounterexample (Grp : Type)
    (plainTensorEquiv : Grp → Grp → Prop) (groupIso : Grp → Grp → Prop) where
  /-- The first group. -/
  G : Grp
  /-- The second group. -/
  H : Grp
  /-- The groups are not isomorphic. -/
  groups_noniso : ¬ groupIso G H
  /-- Their representation categories are equivalent as plain tensor categories. -/
  plain_tensor_equiv : plainTensorEquiv G H

/-- Theorem 3.1 (`eg_plain_tensor_insufficient`), conditional form: an equivalence of
representation categories that forgets the symmetric structure cannot recover the
underlying group — plain tensor equivalence does not detect group isomorphism. -/
theorem eg_plain_tensor_insufficient {Grp : Type}
    {plainTensorEquiv groupIso : Grp → Grp → Prop}
    (w : PlainTensorCounterexample Grp plainTensorEquiv groupIso) :
    ¬ ∀ x y, plainTensorEquiv x y ↔ groupIso x y := by
  intro h
  exact w.groups_noniso ((h w.G w.H).1 w.plain_tensor_equiv)

/-- Corollary 3.2 (`preserved_layer_discipline`), conditional form: a candidate relation
whose identifications ride on plain tensor equivalence — an equivalence whose declared
layers omit the symmetric monoidal layer — identifies a pair of systems whose observable
group data differ, and so cannot justify the identification. -/
theorem preserved_layer_discipline {Grp : Type}
    {plainTensorEquiv groupIso : Grp → Grp → Prop}
    (w : PlainTensorCounterexample Grp plainTensorEquiv groupIso)
    (candidate : Grp → Grp → Prop)
    (wit : EquivalenceWitness)
    (h_omit : ¬ DeclaresSymmetric wit)
    (hidentify : ∀ x y, plainTensorEquiv x y → candidate x y) :
    candidate w.G w.H ∧ ¬ groupIso w.G w.H ∧ ¬ DeclaresSymmetric wit :=
  ⟨hidentify _ _ w.plain_tensor_equiv, w.groups_noniso, h_omit⟩

/-! ## Information-geometric distinguishability (§5) -/

/-- Section 5.1: the Fisher form on the simplex, `g_p(a,a) = ∑_i a_i² / p_i`. -/
def fisherForm {n : ℕ} (p a : Fin n → ℚ) : ℚ :=
  ∑ i : Fin n, (a i * a i) / p i

/-- Theorem 5.1 (Chentsov), statement skeleton (unproved; literature): every monotone
Riemannian metric on the simplex is a positive multiple of the Fisher form. The
monotonicity predicate is external to this skeleton and is left as a parameter. -/
def chentsov_fisher_uniqueness {n : ℕ}
    (monotone : ((Fin n → ℚ) → (Fin n → ℚ) → ℚ) → Prop) : Prop :=
  ∀ g : (Fin n → ℚ) → (Fin n → ℚ) → ℚ,
    monotone g → ∃ c : ℚ, 0 < c ∧ ∀ p a, g p a = c * fisherForm p a

/-- Section 5.2: the summand `A_ij² / (λ_j f(λ_i/λ_j))` of the Morozova–Chentsov
quadratic form. -/
def mcTerm {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ) (A : Fin n → Fin n → ℚ)
    (i j : Fin n) : ℚ :=
  (A i j * A i j) / (lam j * f (lam i / lam j))

/-- Section 5.2: the Morozova–Chentsov quadratic form
`g_f^ρ(A,A) = ∑_{i,j} A_ij² / (λ_j f(λ_i/λ_j))`, with `lam` the eigenvalues of `ρ`. -/
def mcQuadratic {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ) (A : Fin n → Fin n → ℚ) : ℚ :=
  ∑ i : Fin n, ∑ j : Fin n, mcTerm f lam A i j

/-- Normalization of an operator monotone representative: `f(1) = 1`. -/
def NormalizedAtOne (f : ℚ → ℚ) : Prop := f 1 = 1

/-- Petz self-reciprocity on the *positive* domain (the paper's classification
identifies parameter functions on `x > 0` only): `f(x) = x f(x⁻¹)`. -/
def SelfReciprocal (f : ℚ → ℚ) : Prop := ∀ x : ℚ, 0 < x → f x = x * f x⁻¹

/-- The Petz transpose `f^#(x) = x f(x⁻¹)`. -/
def petzTranspose (f : ℚ → ℚ) (x : ℚ) : ℚ := x * f x⁻¹

/-- Theorem 5.2 (`petz_sudar_parametricity`), statement skeleton (unproved; literature):
quantum monotone metrics correspond to operator monotone `f` with `f(1) = 1` and
`f(x) = x f(x⁻¹)`, and distinct such `f` give distinct metrics on self-adjoint
directions. Operator monotonicity is external to this skeleton and is left as a
parameter. Scope caveats (Codex review, round 1): the injectivity clause is only
meaningful for `n ≥ 2`, and the skeleton omits positivity of eigenvalues and
tangent-direction hypotheses of the paper's classification; the formalized
statement is deliberately weaker and is NOT the paper's theorem. -/
def petz_sudar_parametricity {n : ℕ}
    (monotone : ((Fin n → ℚ) → (Fin n → Fin n → ℚ) → ℚ) → Prop) : Prop :=
  (∀ f : ℚ → ℚ, NormalizedAtOne f → SelfReciprocal f →
      monotone (fun lam A => mcQuadratic f lam A)) ∧
    (∀ m, monotone m → ∃ f : ℚ → ℚ, NormalizedAtOne f ∧ SelfReciprocal f ∧
      ∀ lam : Fin n → ℚ, ∀ A : Fin n → Fin n → ℚ, m lam A = mcQuadratic f lam A) ∧
    (∀ f g : ℚ → ℚ, SelfReciprocal f → SelfReciprocal g → f ≠ g →
      ∃ lam : Fin n → ℚ, ∃ A : Fin n → Fin n → ℚ, mcQuadratic f lam A ≠ mcQuadratic g lam A)

/-- Theorem 5.2, proof ingredient: the Petz transpose `f^#` yields the same quadratic
form as `f` on symmetric (self-adjoint) directions, which is why self-reciprocity
`f = f^#` is the correct normalization. -/
theorem petz_transpose_same_form {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ)
    (hpos : ∀ i, 0 < lam i) (A : Fin n → Fin n → ℚ) (hsymm : ∀ i j, A i j = A j i) :
    mcQuadratic f lam A = mcQuadratic (petzTranspose f) lam A := by
  have key : ∀ i j, mcTerm (petzTranspose f) lam A i j = mcTerm f lam A j i := by
    intro i j
    have hj : lam j ≠ 0 := (hpos j).ne'
    simp only [mcTerm, petzTranspose]
    rw [inv_div, ← mul_assoc, mul_div_cancel₀ _ hj, hsymm i j]
  unfold mcQuadratic
  simp only [key]
  rw [Finset.sum_comm]

/-- Proposition 5.3 (`monotone_commutative_restriction`): for every `f` with `f(1) = 1`
(operator monotonicity is not needed for the computation), the quadratic form restricted
to directions diagonal in an eigenbasis of `ρ` is the classical Fisher form
`∑ A_ii² / λ_i`. -/
theorem monotone_commutative_restriction {n : ℕ} (f : ℚ → ℚ) (hf1 : f 1 = 1)
    (lam : Fin n → ℚ) (hpos : ∀ i, 0 < lam i)
    (A : Fin n → Fin n → ℚ) (hdiag : ∀ i j, i ≠ j → A i j = 0) :
    mcQuadratic f lam A = ∑ i : Fin n, (A i i * A i i) / lam i := by
  unfold mcQuadratic
  apply Finset.sum_congr rfl
  intro i _
  refine (Finset.sum_eq_single i (fun j _ hj => ?_) (fun hi => absurd (Finset.mem_univ i) hi)).trans ?_
  · have : A i j = 0 := hdiag i j (Ne.symm hj)
    simp [mcTerm, this]
  · have hi : lam i / lam i = 1 := div_self (hpos i).ne'
    simp [mcTerm, hi, hf1]

/-- Proposition 5.3 restated: the commutative restriction of any normalized monotone
metric is the Fisher form on the commutative subalgebra generated by `ρ`. -/
theorem commutative_restriction_is_fisher {n : ℕ} (f : ℚ → ℚ) (hf1 : f 1 = 1)
    (lam : Fin n → ℚ) (hpos : ∀ i, 0 < lam i)
    (A : Fin n → Fin n → ℚ) (hdiag : ∀ i j, i ≠ j → A i j = 0) :
    mcQuadratic f lam A = fisherForm lam (fun i => A i i) :=
  (monotone_commutative_restriction f hf1 lam hpos A hdiag).trans (by rfl)

/-! ## Ruler dependence of the metric scale (Example 5.4, Corollary 5.5) -/

/-- The self-reciprocal representative `f(x) = 2x/(1+x)` of Example 5.4. -/
def fRat (x : ℚ) : ℚ := 2 * x / (1 + x)

/-- The self-reciprocal representative `h(x) = (1+x)/2` of Example 5.4. -/
def hRat (x : ℚ) : ℚ := (1 + x) / 2

/-- The state `ρ = diag(3/4, 1/4)` of Example 5.4. -/
def rhoDiag : Fin 2 → ℚ := fun i => if i = 0 then 3/4 else 1/4

/-- The direction `A = σ_x` of Example 5.4. -/
def sigmaX : Fin 2 → Fin 2 → ℚ := fun i j => if i = j then 0 else 1

/-- Example 5.4 (`monotone_not_canonical`): at `ρ = diag(3/4, 1/4)` and `A = σ_x` the
quadratic forms of `f(x) = 2x/(1+x)` and `h(x) = (1+x)/2` are `16/3` and `4`; the two
admissible monotone metrics disagree by the factor `4/3`. -/
theorem monotone_not_canonical :
    mcQuadratic fRat rhoDiag sigmaX = 16/3
      ∧ mcQuadratic hRat rhoDiag sigmaX = 4
      ∧ (16/3 : ℚ) ≠ 4 := by
  refine ⟨?_, ?_, ?_⟩
  · simp only [mcQuadratic, Fin.sum_univ_two]
    norm_num [mcTerm, fRat, hRat, rhoDiag, sigmaX]
  · simp only [mcQuadratic, Fin.sum_univ_two]
    norm_num [mcTerm, fRat, hRat, rhoDiag, sigmaX]
  · norm_num

/-- Corollary 5.5: numerical monotone-metric distance is not a function of the states
alone — the two admissible rulers disagree at the same state and direction. -/
theorem monotone_ruler_dependence :
    mcQuadratic fRat rhoDiag sigmaX ≠ mcQuadratic hRat rhoDiag sigmaX := by
  rw [monotone_not_canonical.1, monotone_not_canonical.2.1]
  norm_num

end Cmrps.Vol10

exec
/usr/local/bin/zsh -lc 'lake env lean Cmrps.lean' in /Users/mlong/Documents/Development/classification-physical-systems/lean
exec
/usr/local/bin/zsh -lc 'cat lean/Cmrps/Vol11CompletenessObstructions.lean' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
/-
Module for vol-11-completeness-obstructions (Completeness and Obstructions).
Namespace `Cmrps.Vol11`.

Formalizes the mechanization targets of
`verification/vol-11-completeness-obstructions-lean-targets.md`, mirroring the
paper's names:

* `ClassificationProgram`            — paper, Definition 4.1
* `FiniteVarietyParametrization`     — paper, Definition 4.2
* `CountableInvariantImpossibility`  — paper, Lemma 4.3 (countable-range clause)
* `Regime`                           — paper, Definition 4.5
* `IsomorphismInjective`             — paper, Definition 5.1
* `ObstructionTransport.*`           — paper, Theorem 5.2 (set-level clauses)
* `UndecidabilityTransport`          — paper, Proposition 5.5
* `FiniteSporadicFails`              — paper, Proposition 5.6 (abstract core)
* `TwoRegimeFails`                   — paper, Proposition 5.7 (abstract core)
* `IsocategoricalEquivalenceFails`   — paper, Proposition 5.8 (conditional form)
* `RegimeAssignment`                 — paper, Table 4 (29 domains, 7 regimes)

Clauses requiring descriptive set theory (Borel reductions), matrix-pair wild
embeddings, or the external literature inputs (McDuff, Adyan-Rabin,
Etingof-Gelaki, Buchweitz-Leuschke, Sasyk-Tørnquist, Tancer) are recorded in
`verification/vol-11-completeness-obstructions-conjectures.md`. Nothing in this
file uses `sorry` or an axiom.
-/
import Mathlib.Basic.Countable.Defs
import Mathlib.Data.Quot

namespace Cmrps.Vol11

/-! ## Classification programs (paper, Definition 4.1) -/

/-- Paper, Definition 4.1: the three structured shapes a parameter space may
carry — a finite combinatorial set, a finite-dimensional `k`-variety with an
algebraic family, or a standard Borel space with a Borel parametrization. -/
inductive ParameterKind where
  | finiteCombinatorial
  | finiteDimensionalVariety
  | standardBorel
  deriving DecidableEq

/-- Paper, Definition 4.1: a recognizer `R` decides `x ≃ y` from finite
presentations. Presentations are abstracted to the objects themselves; `correct`
is the correctness clause of the decision procedure. **Scope caveat (Codex
review, round 1):** `decides` is an arbitrary Boolean function, not a computable
procedure, so classically such a recognizer exists for every decidable-in-`Prop`
relation; the paper's algorithmic content (computable presentations and a
computable decider) is NOT formalized here. -/
structure Recognizer {α : Type u} (S : Setoid α) where
  /-- The decision procedure. -/
  decides : α → α → Bool
  /-- Correctness on presentations. -/
  correct : ∀ x y, decides x y = true ↔ S.r x y

/-- Paper, Definition 4.1: the structured parameter space `Π` — a structured
carrier with a structure-compatible surjection onto the `≃`-classes. The
algebraic-family / Borel-parametrization content of the structure is carried by
`kind`; only the surjection component is formalized here (see
`verification/vol-11-completeness-obstructions-dependency-notes.md`). -/
structure ParameterSpace {α : Type u} {κ : Type v} (S : Setoid α) where
  /-- Which structured shape the carrier claims. -/
  kind : ParameterKind
  /-- Structure-compatible map from the carrier onto the `S`-classes. -/
  toClasses : κ → Quotient S
  /-- The map is onto the classes. -/
  surjective : Function.Surjective toClasses

/-- Paper, Definition 4.1: a complete invariant `ι` for the equivalence `S`. -/
structure CompleteInvariant {α : Type u} (S : Setoid α) (ι : Type v) where
  /-- The invariant itself. -/
  inv : α → ι
  /-- Completeness: `ι x = ι y ↔ x ≃ y`. -/
  complete : ∀ x y, inv x = inv y ↔ S.r x y

/-- Paper, Definition 4.1 (Classification program): a triple `(ι, Π, R)` of
complete invariant, structured parameter space, and recognizer for a domain
`(α, S)`. -/
structure ClassificationProgram {α : Type u} (S : Setoid α) (ι : Type v)
    (κ : Type w) where
  /-- The complete invariant component `ι`. -/
  invariant : α → ι
  complete : ∀ x y, invariant x = invariant y ↔ S.r x y
  /-- The parameter space component `Π`. -/
  param : ParameterSpace (κ := κ) S
  /-- The recognizer component `R`. -/
  recognizer : Recognizer S

/-! ## Finite-variety parametrization (paper, Definition 4.2) -/

/-- Paper, Definition 4.2 (Finite-variety parametrization): the isomorphism
classes of a category over a field `k` are parametrized by a finite-dimensional
variety when `V(k)` carries an algebraic family of objects whose fibers exhaust
the isomorphism classes. Here `κ` is the point set `V(k)` and `fiber v` is the
object `A_v`. The variety, its field, and the algebraic-family condition are
not formalized (they need algebraic geometry); what is formalized is the
exhaustiveness clause. The definition's warning is recorded verbatim: a bare
set-theoretic surjection `V(k) → Ob/≅` is *not* a parametrization. -/
structure FiniteVarietyParametrization {α : Type u} {κ : Type v}
    (S : Setoid α) where
  /-- The family `{A_v}_{v ∈ V(k)}`. -/
  fiber : κ → α
  /-- Every object is isomorphic to some fiber. -/
  exhaustive : ∀ x : α, ∃ v : κ, S.r x (fiber v)

/-! ## Regimes (paper, Definition 4.5) -/

/-- Paper, Definition 4.5 (Regimes): the seven regimes of the taxonomy. -/
inductive Regime where
  | parameterized
  | unparameterized
  | obstructionComplete
  | open_
  | wild
  | undecidable
  | decidableButUnclassified
  deriving DecidableEq

/-- Paper, Definition 4.5: a domain occupies exactly one regime; in the formal
version this is the single-valuedness of the assignment function. -/
theorem Regime.occupies_exactly_one {α : Type u} (reg : α → Regime) (x : α) :
    ∃! ρ, reg x = ρ :=
  ⟨reg x, rfl, fun ρ h => h.symm⟩

/-! ## Countable invariants (paper, Lemma 4.3) -/

/-- The complete invariant descends to the isomorphism classes: `⟦x⟧ ↦ ι x`. -/
def CompleteInvariant.onClasses {α : Type u} {S : Setoid α} {ι : Type v}
    (c : CompleteInvariant S ι) : Quotient S → ι :=
  fun q => Quotient.liftOn' q c.inv fun x y h => (c.complete x y).2 h

/-- Paper, Lemma 4.3 (Countable invariants), countable-range clause, target
`CountableInvariantImpossibility`: if the isomorphism classes are uncountable,
no complete invariant takes values in a countable set. The paper's proof: a
complete invariant with countable range descends to an injection of the class
set into the value set, hence into `ℕ`. The companion clause about invariants
valued in spaces of countable structures needs Borel reducibility and is not
formalized here (see the conjectures file). -/
theorem CountableInvariantImpossibility
    {α : Type u} {S : Setoid α} {ι : Type v}
    (c : CompleteInvariant S ι)
    (huncount : ¬ Countable (Quotient S)) : ¬ Countable ι := by
  intro hcount
  have hinj : Function.Injective c.onClasses :=
    fun x y => Quotient.inductionOn₂' x y fun a b h =>
      Quotient.sound' ((c.complete a b).1 h)
  exact huncount (Function.Injective.countable hinj)

/-! ## Obstruction transport (paper, Definition 5.1, Theorem 5.2) -/

/-- Paper, Definition 5.1 (Isomorphism-injective functor), relational form: a
map `F` between domains that preserves and reflects the equivalence. The
categorical content of the definition (every fully faithful functor is
isomorphism-injective) is not formalized here; see the conjectures file. -/
structure IsomorphismInjective {α : Type u} {β : Type w}
    (S : Setoid α) (T : Setoid β) (F : α → β) : Prop where
  map_rel : ∀ x y, S.r x y → T.r (F x) (F y)
  reflect_rel : ∀ x y, T.r (F x) (F y) → S.r x y

/-- Paper, Theorem 5.2: an isomorphism-injective map induces a map `F_*` on
isomorphism classes. -/
def IsomorphismInjective.classes {α : Type u} {β : Type w} {S : Setoid α}
    {T : Setoid β} {F : α → β} (h : IsomorphismInjective S T F) :
    Quotient S → Quotient T :=
  Quotient.map' F fun x y hr => h.map_rel x y hr

/-- Paper, Theorem 5.2: `F_*` is injective on classes, since `F` is
isomorphism-injective. -/
theorem IsomorphismInjective.classes_injective
    {α : Type u} {β : Type w} {S : Setoid α} {T : Setoid β} {F : α → β}
    (h : IsomorphismInjective S T F) : Function.Injective h.classes :=
  fun x y => Quotient.inductionOn₂' x y fun a b he =>
    Quotient.sound' (h.reflect_rel a b (Quotient.exact' (a := F a) (b := F b) he))

/-- Paper, Theorem 5.2: a complete invariant for the larger domain restricts
along `F` to a complete invariant for the smaller one, with the same value set. -/
def ObstructionTransport.pullback
    {α : Type u} {β : Type w} {S : Setoid α} {T : Setoid β} {F : α → β}
    (h : IsomorphismInjective S T F) {ι : Type v} (c : CompleteInvariant T ι) :
    CompleteInvariant S ι where
  inv := fun x => c.inv (F x)
  complete := fun x y =>
    ⟨fun he => h.reflect_rel x y ((c.complete (F x) (F y)).1 he),
     fun hr => (c.complete (F x) (F y)).2 (h.map_rel x y hr)⟩

/-- Paper, Theorem 5.2(1): uncountability of the isomorphism classes transports
along an isomorphism-injective map: if the source has uncountably many classes,
so does the target. -/
theorem ObstructionTransport.uncountableClasses
    {α : Type u} {β : Type w} {S : Setoid α} {T : Setoid β} {F : α → β}
    (h : IsomorphismInjective S T F)
    (huncount : ¬ Countable (Quotient S)) : ¬ Countable (Quotient T) :=
  fun hcount => huncount (Function.Injective.countable h.classes_injective)

/-- Paper, Theorem 5.2(1): absence of complete invariants with countable range
transports along an isomorphism-injective map: if none exists for the source,
none exists for the target. -/
theorem ObstructionTransport.noCountableInvariant
    {α : Type u} {β : Type w} {S : Setoid α} {T : Setoid β} {F : α → β}
    (h : IsomorphismInjective S T F)
    (hnone : ∀ (ι : Type v) (c : CompleteInvariant S ι), ¬ Countable ι) :
    ∀ (ι : Type v) (c : CompleteInvariant T ι), ¬ Countable ι :=
  fun ι c hc => hnone ι (ObstructionTransport.pullback h c) hc

/-! ## Undecidability transport (paper, Proposition 5.5) -/

/-- Paper, Proposition 5.5: a recognition problem `Q` is decidable when there is
a procedure `d` with `d x = true ↔ Q x`. **Scope caveat (Codex review, round 1):**
this is an *extensional* skeleton — classically `fun x => decide (Q x)` satisfies
it for every `Q`, so it is not algorithmic decidability; the paper's computable
procedures are NOT formalized here. -/
def DecidableProblem {κ : Type u} (Q : κ → Prop) : Prop :=
  ∃ d : κ → Bool, ∀ x, d x = true ↔ Q x

/-- Paper, Proposition 5.5 (Undecidability transport): a recognition problem
many-one reducible from an undecidable property of finitely presentable groups
is itself undecidable. `hmarkov` is the Adyan-Rabin theorem taken as hypothesis
(hence the `conditional` status of this claim): every Markov property of
finitely presentable groups is algorithmically undecidable. The paper requires
the reduction map `φ` to be computable so that the composed procedure is
algorithmic; the extensional form above is the content of the reduction
argument. **Scope caveat (Codex review, round 1):** because `DecidableProblem`
is classically trivial, `hmarkov` is contradictory and the formalized
implication is vacuously true; the theorem is a *shape* of the transport
argument only, and the algorithmic statement remains unproved. -/
theorem UndecidabilityTransport
    {G : Type u} {κ : Type w} {P : G → Prop} {Q : κ → Prop} {φ : G → κ}
    (hred : ∀ g, P g ↔ Q (φ g))
    (hmarkov : ¬ DecidableProblem P) : ¬ DecidableProblem Q := by
  intro hq
  change ∃ d : κ → Bool, ∀ x, d x = true ↔ Q x at hq
  cases hq with
  | intro d hd =>
    refine hmarkov ?_
    change ∃ e : G → Bool, ∀ g, e g = true ↔ P g
    exact ⟨fun g => d (φ g), fun g =>
      ⟨fun h => (hred g).2 ((hd (φ g)).1 h),
       fun h => (hd (φ g)).2 ((hred g).1 h)⟩⟩

/-! ## Counterexample catalogue (paper, Propositions 5.6–5.8) -/

/-- Paper, Proposition 5.6: a CFSG-style decomposition of a class set into
infinite families plus finitely many exceptional (sporadic) objects. -/
structure SporadicDecomposition (κ : Type u) where
  /-- Objects lying in one of the infinite families. -/
  family : κ → Prop
  /-- The number of sporadic objects. -/
  nSporadic : Nat
  /-- The sporadic objects, listed. -/
  sporadic : Fin nSporadic → κ
  /-- Every class is in a family or is one of the listed sporadic objects. -/
  cover : ∀ x : κ, family x ∨ ∃ i, sporadic i = x

/-- Paper, Proposition 5.6 (FiniteSporadicFails), abstract core: a sector in
which no infinite family reaches and which admits no finite listing cannot be
decomposed into families plus finitely many sporadics. The paper's concrete
inputs — uncountably many separable II₁ factors (McDuff) and the four-dimensional
model geometries (eighteen plus one countably infinite family) — are external
literature results; see the claim-status and conjectures files. -/
theorem FiniteSporadicFails {κ : Type u} (d : SporadicDecomposition κ)
    (hnoFamily : ∀ x : κ, ¬ d.family x)
    (hnoList : ∀ (n : Nat) (f : Fin n → κ), ¬ Function.Surjective f) : False := by
  have hsurj : Function.Surjective d.sporadic := by
    intro x
    cases d.cover x with
    | inl hx => exact absurd hx (hnoFamily x)
    | inr hx =>
      cases hx with
      | intro i hi => exact ⟨i, hi⟩
  exact hnoList d.nSporadic d.sporadic hsurj

/-- Paper, Proposition 5.7 (TwoRegimeFails), abstract core: three of the seven
regimes carry pairwise distinct evidence shapes, so no two-label taxonomy can
keep the surveyed domains straight — there is no injection of the seven regimes
into two labels. The paper's concrete witnesses (unknot recognition:
decidable-but-unclassified; finite simple groups: classified-but-unparameterized)
are external literature results. -/
theorem TwoRegimeFails (f : Regime → Bool) : ¬ Function.Injective f := by
  have key : ∀ x y z : Bool, x = y ∨ x = z ∨ y = z := by
    intro x y z
    cases x <;> cases y <;> cases z <;> decide
  intro hinj
  cases key (f Regime.parameterized) (f Regime.wild) (f Regime.undecidable) with
  | inl h => exact absurd (hinj h) (fun h' => by cases h')
  | inr h =>
    cases h with
    | inl h => exact absurd (hinj h) (fun h' => by cases h')
    | inr h => exact absurd (hinj h) (fun h' => by cases h')

/-- Paper, §2: `r` coarsens `s` when every `r`-pair is an `s`-pair. -/
def Coarsens {α : Type u} (r s : α → α → Prop) : Prop :=
  ∀ x y, r x y → s x y

/-- Paper, Proposition 5.8 (IsocategoricalEquivalenceFails), conditional form:
if plain tensor equivalence `≃pt` on finite groups coarsens isomorphism and one
pair `G ≇ H` has `G ≃pt H` (the Etingof-Gelaki witness), then `≃pt` is strictly
coarser than isomorphism, so classification at the plain tensor layer merges
distinct systems. The existence of the witness pair is external
(`conditional` status). -/
theorem IsocategoricalEquivalenceFails
    {α : Type u} (iso pt : α → α → Prop)
    (hcoarse : Coarsens iso pt)
    (G H : α) (hne : ¬ iso G H) (heq : pt G H) :
    Coarsens iso pt ∧ ¬ Coarsens pt iso :=
  ⟨hcoarse, fun hall => hne (hall G H heq)⟩

/-! ## Regime assignment (paper, Table 4) -/

/-- Paper, Table 4: the 29 surveyed domains of the series literature map. -/
inductive SurveyedDomain where
  | simpleLieAlgebras
  | highestWeightIrreps
  | finiteDimCstarAlgebras
  | principalGBundles
  | classicalMonotoneMetrics
  | localSymplecticGerms
  | amenableFactors
  | threeManifolds
  | groupIsoTameExtensions
  | finiteSimpleGroups
  | quantumMonotoneMetrics
  | quantumChannels
  | fourDimModelGeometries
  | anomalies
  | generalII1Factors
  | plainTensorCategoryRecovery
  | fusionCategories
  | elliottNuclearProgram
  | holographicEntropyCone
  | extendedTQFTs
  | yangMillsMassGap
  | typeIIIFactors
  | wildCMModulesGenericDet
  | cpEquivariantModulesOddPrimes
  | derivedWildAlgebras
  | fpGroupsMarkovProperties
  | fourManifoldHomeomorphism
  | vNAlgebraIsomorphism
  | unknotRecognition
  deriving DecidableEq

/-- Paper, Table 4 / Section 8 (RegimeAssignment): the assignment of surveyed
domains to regimes. The consistency properties below mirror
`src/vol-11-completeness-obstructions/regime_inventory.py` (`check_partition`);
the mathematical justification of each row is the obstruction register and the
survey, not this data. -/
def RegimeAssignment : SurveyedDomain → Regime
  | .simpleLieAlgebras => .parameterized
  | .highestWeightIrreps => .parameterized
  | .finiteDimCstarAlgebras => .parameterized
  | .principalGBundles => .parameterized
  | .classicalMonotoneMetrics => .parameterized
  | .localSymplecticGerms => .parameterized
  | .amenableFactors => .parameterized
  | .threeManifolds => .parameterized
  | .groupIsoTameExtensions => .parameterized
  | .fourDimModelGeometries => .parameterized
  | .finiteSimpleGroups => .unparameterized
  | .quantumMonotoneMetrics => .unparameterized
  | .quantumChannels => .unparameterized
  | .anomalies => .obstructionComplete
  | .generalII1Factors => .obstructionComplete
  | .plainTensorCategoryRecovery => .obstructionComplete
  | .vNAlgebraIsomorphism => .obstructionComplete
  | .fusionCategories => .open_
  | .elliottNuclearProgram => .open_
  | .holographicEntropyCone => .open_
  | .extendedTQFTs => .open_
  | .yangMillsMassGap => .open_
  | .typeIIIFactors => .open_
  | .wildCMModulesGenericDet => .wild
  | .cpEquivariantModulesOddPrimes => .wild
  | .derivedWildAlgebras => .wild
  | .fpGroupsMarkovProperties => .undecidable
  | .fourManifoldHomeomorphism => .undecidable
  | .unknotRecognition => .decidableButUnclassified

/-- Paper, Table 4: the assignment is total — every surveyed domain has a
regime. -/
theorem RegimeAssignment.total (d : SurveyedDomain) :
    ∃ ρ, RegimeAssignment d = ρ :=
  ⟨_, rfl⟩

/-- Paper, Definition 4.5 / Table 4: the assignment is single-valued — every
surveyed domain occupies exactly one regime. -/
theorem RegimeAssignment.unique (d : SurveyedDomain) :
    ∃! ρ, RegimeAssignment d = ρ :=
  ⟨RegimeAssignment d, rfl, fun ρ h => h.symm⟩

/-- Paper, Table 4 / Section 8: every one of the seven regimes is used by the
assignment (the partition check of `check_partition`). -/
theorem RegimeAssignment.every_regime_used (ρ : Regime) :
    ∃ d, RegimeAssignment d = ρ := by
  cases ρ with
  | parameterized => exact ⟨.simpleLieAlgebras, rfl⟩
  | unparameterized => exact ⟨.finiteSimpleGroups, rfl⟩
  | obstructionComplete => exact ⟨.anomalies, rfl⟩
  | open_ => exact ⟨.fusionCategories, rfl⟩
  | wild => exact ⟨.derivedWildAlgebras, rfl⟩
  | undecidable => exact ⟨.fpGroupsMarkovProperties, rfl⟩
  | decidableButUnclassified => exact ⟨.unknotRecognition, rfl⟩

end Cmrps.Vol11

exec
/usr/local/bin/zsh -lc 'cat lean/Cmrps/Vol12PrincipiaPhysica.lean' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
import Mathlib.Data.Real.Basic
import Mathlib.Tactic

/-!
# Principia Physica (Volume 12)

Formalization of the tractable mechanization targets of
`verification/vol-12-principia-physica-lean-targets.md`, mirroring the names of
`papers/latex/vol-12-principia-physica.tex`.

Policy of this module: definitions are stated directly; survey theorems whose content is
external literature (Chentsov, Petz–Sudar, McDuff, Adyan–Rabin, Etingof–Gelaki, …) are
formalized as their honest logical skeleton, with the classical inputs recorded as explicit
hypotheses. Nothing in this file uses `sorry` or new axioms.
-/

namespace Cmrps.Vol12

/-! ## Target 1 — `PrincipiaLayers` (Definition 2.5) -/

/-- Definition 2.5: the Principia architecture consists of three layers, with a
realization map `M → P` and a selection map `P → Eobs`. -/
structure PrincipiaLayers where
  /-- The mathematical layer: output of classification of admissible structures. -/
  M : Type
  /-- The realization layer: physical theories. -/
  P : Type
  /-- The empirical layer: observational data. -/
  Eobs : Type
  /-- The realization map `R : M → P`. -/
  realize : M → P
  /-- The selection map `E : P → Eobs`. -/
  select : P → Eobs

/-- The separation clause of Definition 2.5, as formalized: the equivalence relation
induced by `select` differs from the one induced by `cls` (they do not induce the
same partition of `P`). **Scope caveat (Codex review, round 1):** this is NOT the
failure of a factorization `select = f ∘ cls` — a constant `select` with `cls = id`
satisfies this predicate although `select` factors through `cls`; the name records
the paper's clause, the statement is the induced-relations inequality. -/
def NotFactoring {M P Obs : Type} (cls : P → M) (select : P → Obs) : Prop :=
  ¬ ∀ a b : P, (select a = select b ↔ cls a = cls b)

/-- Section 3, non-collapse argument: if two theories are mathematically distinct but
empirically equivalent, then `select` and `cls` do not induce the same equivalence
relation on theories (the induced relations differ). -/
theorem SelectionNotComputedByClassification
    {M P Obs : Type} (cls : P → M) (select : P → Obs)
    (T₁ T₂ : P) (hmath : cls T₁ ≠ cls T₂) (hobs : select T₁ = select T₂) :
    NotFactoring cls select := by
  intro h
  exact hmath ((h T₁ T₂).1 hobs)

/-! ## Target 2 — `EvidenceGradeAssignment` (Definition 2.6, Table 2) -/

/-- Definition 2.6: formulation, rigorous theorem, physical validation. -/
inductive EvidenceGrade
  | formulation  -- grade 1
  | rigorous     -- grade 2
  | validated    -- grade 3
deriving DecidableEq, Repr

/-- The record types of the program registry (Table 2). -/
inductive RecordType
  | stipulatedDefinitions
  | classificationTheorem
  | reconstructionTheorem
  | obstructionTheorem
  | claimLedgerEntry
  | physicalValidation
deriving DecidableEq, Repr

/-- Table 2: the evidence grade of each record type. -/
def evidenceGrade : RecordType → EvidenceGrade
  | .stipulatedDefinitions => .formulation
  | .classificationTheorem => .rigorous
  | .reconstructionTheorem => .rigorous
  | .obstructionTheorem => .rigorous
  | .claimLedgerEntry => .formulation
  | .physicalValidation => .validated

/-- The record types actually on file: grade 3 exists as a type but holds no record. -/
def registryTypes : List RecordType :=
  [.stipulatedDefinitions, .classificationTheorem, .reconstructionTheorem,
   .obstructionTheorem, .claimLedgerEntry]

/-- Target 2: every record type on file lies at grade 1 or 2; grade 3 is attained only by
the (empty) physical-validation record type. -/
theorem EvidenceGradeAssignment (r : RecordType) :
    (r = .physicalValidation → evidenceGrade r = .validated) ∧
    (r ≠ .physicalValidation → evidenceGrade r ≠ .validated) := by
  cases r <;> decide

/-- No record type on file reaches evidence grade 3. -/
theorem registry_no_grade3 :
    (evidenceGrade .stipulatedDefinitions ≠ .validated) ∧
    (evidenceGrade .classificationTheorem ≠ .validated) ∧
    (evidenceGrade .reconstructionTheorem ≠ .validated) ∧
    (evidenceGrade .obstructionTheorem ≠ .validated) ∧
    (evidenceGrade .claimLedgerEntry ≠ .validated) := by
  decide

/-- Table 2 read off as data. -/
theorem registry_grades :
    registryTypes.map evidenceGrade =
      [.formulation, .rigorous, .rigorous, .rigorous, .formulation] := rfl

/-! ## Target 3 — `RegimeAssignment` (Definition 2.7, Table 3) -/

/-- Definition 2.7: the seven classification regimes. -/
inductive Regime
  | r1 | r2 | r3 | r4 | r5 | r6 | r7
deriving DecidableEq, Repr

/-- A row of the program comparison spine (Table 3). -/
structure SpineRow where
  domain : String
  regime : Regime
deriving Repr

/-- The twenty-nine rows of Table 3 (twenty-eight spine domains plus the unknot-recognition
boundary case), in table order. -/
def spineTable : List SpineRow :=
  [ ⟨"Finite simple groups", .r2⟩
  , ⟨"Simple Lie groups and Lie algebras", .r1⟩
  , ⟨"Irreducible representations of semisimple Lie algebras", .r1⟩
  , ⟨"Symplectic manifolds in the local category", .r1⟩
  , ⟨"Poisson manifolds in the local category", .r1⟩
  , ⟨"Finite-dimensional complex C*-algebras", .r1⟩
  , ⟨"Amenable factors", .r1⟩
  , ⟨"General type II and type III factors", .r5⟩
  , ⟨"Quantum channels", .r4⟩
  , ⟨"Principal G-bundles", .r1⟩
  , ⟨"Anomalies", .r3⟩
  , ⟨"DHR superselection sectors", .r1⟩
  , ⟨"Symmetric tensor categories of subexponential growth", .r1⟩
  , ⟨"Fusion categories", .r4⟩
  , ⟨"Extended topological quantum field theories", .r4⟩
  , ⟨"Lorentzian holonomy groups", .r1⟩
  , ⟨"Spacetime causality conditions", .r1⟩
  , ⟨"Holographic entropy cone with at most four regions", .r1⟩
  , ⟨"Holographic entropy cone with five or more regions", .r4⟩
  , ⟨"Monotone metrics in the classical case", .r1⟩
  , ⟨"Monotone metrics in the quantum case", .r1⟩
  , ⟨"Emergent spacetime and the Ryu-Takayanagi formula", .r4⟩
  , ⟨"Four-dimensional Yang-Mills and QCD existence", .r4⟩
  , ⟨"Four-dimensional Yang-Mills mass gap", .r4⟩
  , ⟨"Closed three-manifolds", .r1⟩
  , ⟨"Four-manifolds", .r5⟩
  , ⟨"Finitely presented groups under Markov properties", .r6⟩
  , ⟨"Wild representation categories", .r5⟩
  , ⟨"Unknot recognition", .r7⟩ ]

/-- The regime of each row, in table order. -/
def spineRegimes : List Regime := spineTable.map (·.regime)

/-- Number of rows assigned to a regime. -/
def countRegime (r : Regime) : List Regime → ℕ
  | [] => 0
  | x :: xs => (if x = r then 1 else 0) + countRegime r xs

theorem spine_row_count : spineTable.length = 29 := by decide

/-- Target 3: the twenty-nine rows map into exactly one regime each, with counts
`15, 1, 1, 7, 3, 1, 1` over regimes 1 to 7. -/
theorem RegimeAssignment :
    countRegime .r1 spineRegimes = 15 ∧
    countRegime .r2 spineRegimes = 1 ∧
    countRegime .r3 spineRegimes = 1 ∧
    countRegime .r4 spineRegimes = 7 ∧
    countRegime .r5 spineRegimes = 3 ∧
    countRegime .r6 spineRegimes = 1 ∧
    countRegime .r7 spineRegimes = 1 := by
  decide

/-! ## Target 4 — `ObstructionAssembly` (Theorem 5.1) -/

/-- The six classification objectives of Theorem 5.1. -/
inductive ObstructionObjective
  | nonAmenableFactorTotalClassification
  | wildModuleFiniteVarietyParameterization
  | markovPropertyUniformRecognition
  | fourManifoldEffectiveClassification
  | groupFromPlainTensorCategory
  | wildRegimeIsomorphismAlgorithm
deriving DecidableEq, Repr

/-- A registered obstruction theorem: a named external result forbidding an objective. -/
structure RegisteredObstruction where
  theoremName : String
  objective : ObstructionObjective
deriving Repr

/-- The register of Theorem 5.1: each objective is refuted by a named proved result. -/
def refutingTheorem : ObstructionObjective → RegisteredObstruction
  | .nonAmenableFactorTotalClassification =>
      ⟨"McDuff 1969: uncountably many non-isomorphic separable II_1 factors",
        .nonAmenableFactorTotalClassification⟩
  | .wildModuleFiniteVarietyParameterization =>
      ⟨"Bekkert-Drozd derived wildness; Buchweitz-Leuschke; Grevstad-May",
        .wildModuleFiniteVarietyParameterization⟩
  | .markovPropertyUniformRecognition =>
      ⟨"Adyan-Rabin with the Collins extension",
        .markovPropertyUniformRecognition⟩
  | .fourManifoldEffectiveClassification =>
      ⟨"Tancer 2023: unrecognizability of connected-sum homeomorphism",
        .fourManifoldEffectiveClassification⟩
  | .groupFromPlainTensorCategory =>
      ⟨"Etingof-Gelaki isocategorical groups",
        .groupFromPlainTensorCategory⟩
  | .wildRegimeIsomorphismAlgorithm =>
      ⟨"Grochow-Qiao tame/wild tractability boundary",
        .wildRegimeIsomorphismAlgorithm⟩

/-- Target 4: every classification objective of Theorem 5.1 is refuted by a registered
theorem (data-level formalization of the survey). -/
theorem ObstructionAssembly (o : ObstructionObjective) :
    (refutingTheorem o).objective = o := by
  cases o <;> rfl

/-! ## Target 5 — `StructurePreservation` (Theorem 6.1) -/

/-- Theorem 6.1, logical form: if two objects carry the same data in a layer that forgets
structure (hdata) but are inequivalent at the level one wants to recover (hcls), no recovery
function from the coarse data can classify them. Applied with isocategorical groups and
plain tensor data, this forbids recovery of the group from a symmetric-monoidal-free
equivalence of representation categories. -/
theorem StructurePreservation
    {G D C : Type} (data : G → D) (cls : G → C) (g₁ g₂ : G)
    (hdata : data g₁ = data g₂) (hcls : cls g₁ ≠ cls g₂) :
    ¬ ∃ recover : D → C, ∀ g, recover (data g) = cls g := by
  rintro ⟨recover, h⟩
  exact hcls ((h g₁).symm.trans ((congrArg recover hdata).trans (h g₂)))

/-! ## Target 6 — `MonotoneMetricGap` (Theorem 7.1) -/

/-- The identity witness of Theorem 7.1. -/
def f_id : ℝ → ℝ := fun x => x

/-- The affine witness of Theorem 7.1: `f(x) = (x+1)/2`. -/
noncomputable def f_aff : ℝ → ℝ := fun x => (x + 1) / 2

/-- The two witness functions of Theorem 7.1 are distinct. -/
theorem MonotoneWitnessDistinct : f_id ≠ f_aff := by
  have h0 : f_id 0 ≠ f_aff 0 := by
    show (0 : ℝ) ≠ (0 + 1) / 2
    norm_num
  exact fun h => h0 (congrFun h 0)

/-- Target 6, gap clause: a parameterized family with more than one element admits no
unique choice, so a uniqueness-up-to-scalar statement cannot extend to it. -/
theorem MonotoneMetricGap {Param : Type} (f g : Param) (hne : f ≠ g) :
    ¬ Subsingleton Param := by
  intro h
  letI := h
  exact hne (Subsingleton.elim f g)

/-- Target 6, quantum clause: given the classical Petz–Sudar input that the identity and
the affine function are operator monotone, the parameter class of quantum monotone metrics
is nontrivial, and classical uniqueness does not extend to the quantum case.
**Scope caveat (Codex review, round 1):** this theorem establishes only that an abstract
`IsOperatorMonotone` predicate has two distinct members — it proves NO correspondence to
metrics and no non-proportionality of metric values (the metric-level conclusion is
`quantum_monotone_metrics_not_unique` in `Vol09GravityInformationGeometry` and the paper
proof). The witness `f_id` also fails self-reciprocity (`f t ≠ t f (1/t)` at `t = 2`),
matching a gap in the paper's proof; the result is the distinctness of two functions and
no more. -/
theorem MonotoneMetricGapQuantum
    (IsOperatorMonotone : (ℝ → ℝ) → Prop)
    (hid : IsOperatorMonotone f_id) (haff : IsOperatorMonotone f_aff) :
    ¬ Subsingleton { f : ℝ → ℝ // IsOperatorMonotone f } :=
  MonotoneMetricGap (f := ⟨f_id, hid⟩) (g := ⟨f_aff, haff⟩) (fun h =>
    MonotoneWitnessDistinct (congrArg Subtype.val h))

/-! ## Target 7 — `ExistenceMassGapSeparation` (Section 6) -/

/-- The two conjuncts of the Clay problem. -/
structure ClayProblem where
  /-- Existence of the four-dimensional quantum field theory. -/
  Existence : Prop
  /-- Strict positivity of the mass gap. -/
  MassGap : Prop

/-- The Clay problem is solved exactly when both conjuncts hold. -/
def ClaySolved (C : ClayProblem) : Prop := C.Existence ∧ C.MassGap

/-- Target 7: an existence claim alone does not discharge the mass-gap conjunct; the two
properties are separate conjuncts of the Clay problem. -/
theorem ExistenceMassGapSeparation (C : ClayProblem)
    (hE : C.Existence) (hG : ¬ C.MassGap) : ¬ ClaySolved C := by
  rintro ⟨_, hg⟩
  exact hG hg

/-- Claim ladder positions (Section 6). -/
inductive LadderPosition
  | announced
  | publishedUnverified
  | withdrawn
  | rigorousWithinRegimes
  | preprintOutline
  | verified
  | accepted
deriving DecidableEq, Repr

/-- Table 4: the ladder position of each claim-ledger entry. -/
def claimPositions : List LadderPosition :=
  [.announced, .publishedUnverified, .withdrawn, .rigorousWithinRegimes, .preprintOutline]

theorem claim_positions_exact :
    claimPositions = [.announced, .publishedUnverified, .withdrawn,
      .rigorousWithinRegimes, .preprintOutline] := rfl

theorem claim_ledger_size : claimPositions.length = 5 := by decide

/-- No claim-ledger entry has reached the verified or accepted rung, so none resolves the
Clay problem. -/
theorem claim_ledger_not_verified :
    LadderPosition.announced ≠ .verified ∧ LadderPosition.announced ≠ .accepted ∧
    LadderPosition.publishedUnverified ≠ .verified ∧
    LadderPosition.publishedUnverified ≠ .accepted ∧
    LadderPosition.withdrawn ≠ .verified ∧ LadderPosition.withdrawn ≠ .accepted ∧
    LadderPosition.rigorousWithinRegimes ≠ .verified ∧
    LadderPosition.rigorousWithinRegimes ≠ .accepted ∧
    LadderPosition.preprintOutline ≠ .verified ∧
    LadderPosition.preprintOutline ≠ .accepted := by
  decide

/-! ## Block-size data (used by Targets 8 and 10) -/

/-- Count of occurrences of `n` in a list of block sizes. -/
def countNat (n : ℕ) : List ℕ → ℕ
  | [] => 0
  | x :: xs => (if x = n then 1 else 0) + countNat n xs

/-- Two block-size lists determine the same block multiset. -/
def SameBlocks (l₁ l₂ : List ℕ) : Prop := ∀ n, countNat n l₁ = countNat n l₂

theorem sameBlocks_refl (l : List ℕ) : SameBlocks l l := fun _ => rfl

theorem sameBlocks_symm {l₁ l₂ : List ℕ} (h : SameBlocks l₁ l₂) : SameBlocks l₂ l₁ :=
  fun n => (h n).symm

theorem sameBlocks_trans {l₁ l₂ l₃ : List ℕ} (h₁ : SameBlocks l₁ l₂)
    (h₂ : SameBlocks l₂ l₃) : SameBlocks l₁ l₃ :=
  fun n => (h₁ n).trans (h₂ n)

/-! ## Target 8 — `ConditionalStructuralGeneration` (Definition 8.2, Proposition 8.3) -/

/-- Definition 2.9: the structural invariant record. -/
structure InvariantRecord (S O D G R : Type) where
  states : S
  observables : O
  dynamics : D
  symmetries : G
  representations : R

/-- Definition 8.2: the constituent invariant record
`μ(P) = (construction data, constituent invariant records, gluing datum)`. -/
structure ConstituentRecord (F Inv G : Type) where
  /-- Construction data `F`. -/
  construction : F
  /-- Multiset of invariant records of the constituents. -/
  constituents : List Inv
  /-- Gluing datum `g_P` (e.g. an extension class in `H²(Q, Z(N))`). -/
  gluing : G

/-- Layers of the architecture (Definition 2.5). -/
inductive Layer
  | mathematical
  | realization
  | empirical
deriving DecidableEq, Repr

/-- The two constructions of Proposition 8.3 act at the mathematical layer. -/
def constructionLayer : Layer := .mathematical

/-- The constructions map neither into theories nor into observation data. -/
theorem ConstructionLayerSeparation :
    constructionLayer = .mathematical ∧
    constructionLayer ≠ .realization ∧
    constructionLayer ≠ .empirical := by
  decide

/-- Target 8 (Proposition 8.3): in case (a), direct sums of finite-dimensional complex
C*-algebras classified by block sizes; in case (b), group extensions with fixed action
classified by invariant records of `N`, `Q` and the extension class. In both cases the
constituent record is complete up to the stated equivalences. The two hypotheses of each
case record the classical inputs (structure theorem and simple-module-dimension recovery
for (a); classification of extensions by `H²(Q, Z(N))` for (b)). -/
theorem ConditionalStructuralGeneration
    {Alg : Type} (IsoA : Alg → Alg → Prop) (dims : Alg → List ℕ)
    (hA₁ : ∀ a b, IsoA a b → SameBlocks (dims a) (dims b))
    (hA₂ : ∀ a b, SameBlocks (dims a) (dims b) → IsoA a b)
    {Ext NRec QRec H2 : Type} (record : Ext → NRec × QRec × H2) (IsoE : Ext → Ext → Prop)
    (hB₁ : ∀ e₁ e₂, IsoE e₁ e₂ → record e₁ = record e₂)
    (hB₂ : ∀ e₁ e₂, record e₁ = record e₂ → IsoE e₁ e₂)
    (a b : Alg) (e₁ e₂ : Ext) :
    (IsoA a b ↔ SameBlocks (dims a) (dims b)) ∧
    (IsoE e₁ e₂ ↔ record e₁ = record e₂) ∧
    constructionLayer = .mathematical :=
  ⟨⟨hA₁ a b, hA₂ a b⟩, ⟨⟨hB₁ e₁ e₂, hB₂ e₁ e₂⟩, rfl⟩⟩

/-! ## Target 9 — `GenerationVersusClassification` (Remark 8.4) -/

/-- Target 9, logical form: generation of every object from basic data does not deliver
classification by invariants; a single generated but unclassified object refutes the
implication. The witness of Remark 8.4 is a finitely presented group (generated from
cyclic groups by free products and quotients) whose Markov property is undecidable. -/
theorem GenerationVersusClassification
    {ι : Type} (Generated Classified : ι → Prop)
    (w : ι) (hwGen : Generated w) (hwCls : ¬ Classified w) :
    ¬ ∀ i, Generated i → Classified i := by
  intro h
  exact hwCls (h w hwGen)

/-! ## Target 10 — `FiniteDimCStarDecomposition` (Lemma 9.1, record T-BG-06) -/

/-- Target 10, uniqueness direction: block sizes recovered as simple-module dimensions are
isomorphism invariants (`hInv`), and the structure theorem reconstructs the algebra from
the block multiset (`hRec`); under these classical inputs the block multiset is a complete
invariant up to `*-`isomorphism. -/
theorem FiniteDimCStarDecomposition
    {Alg : Type} (Iso : Alg → Alg → Prop) (dims : Alg → List ℕ)
    (hInv : ∀ a b, Iso a b → SameBlocks (dims a) (dims b))
    (hRec : ∀ a b, SameBlocks (dims a) (dims b) → Iso a b) (a b : Alg) :
    Iso a b ↔ SameBlocks (dims a) (dims b) :=
  ⟨hInv a b, hRec a b⟩

/-- The worked example of Section 9.1: `A = ℂ ⊕ M₂(ℂ)` has block multiset `{1, 2}`, and
block order does not affect the counts. -/
theorem ExampleBlockMultiset :
    countNat 1 [1, 2] = 1 ∧
    countNat 2 [1, 2] = 1 ∧
    countNat 3 [1, 2] = 0 ∧
    countNat 1 [2, 1] = 1 ∧
    countNat 2 [2, 1] = 1 ∧
    countNat 3 [2, 1] = 0 := by
  decide

end Cmrps.Vol12

exec
/usr/local/bin/zsh -lc 'cat lean/Cmrps/Vol04YonedaClassification.lean' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
/-
Vol. 04 — The Yoneda Classification Principle.
Formalization of `verification/vol-04-yoneda-classification-lean-targets.md`
against `papers/latex/vol-04-yoneda-classification.tex`.

Names mirror the paper: `relationalProfile` (Definition 2.2),
`RelationalEquivalence` (Definition 2.4), `Invariant`/`FiniteVarietyType`
(Definition 3.8), `yoneda_nat_iso` (Theorem 3.1), `yoneda_fully_faithful`
(Corollary 3.2), `relational_characterization` (Corollary 3.4),
`profile_restriction_gap` (Proposition 3.6), `profile_limit_preservation`
(Proposition 3.7), `choi_correspondence`/`choi_composition` (Proposition 4.1
and Equation (1)).
-/

import Mathlib.CategoryTheory.Discrete.Basic
import Mathlib.CategoryTheory.Limits.Preserves.Shapes.BinaryProducts
import Mathlib.CategoryTheory.Limits.Preserves.Shapes.Terminal
import Mathlib.CategoryTheory.Limits.Shapes.BinaryProducts.BinaryProducts
import Mathlib.CategoryTheory.Limits.Shapes.Terminal
import Mathlib.CategoryTheory.Limits.Yoneda
import Mathlib.CategoryTheory.Types.Basic
import Mathlib.CategoryTheory.Whiskering
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Basic.Complex.Basic
import Mathlib.Data.Matrix.Basis
import Mathlib.Data.Matrix.Diagonal
import Mathlib.LinearAlgebra.Matrix.Trace

universe u v t w

namespace Cmrps.Vol04

open CategoryTheory Opposite CategoryTheory.Limits

/-! ## Relational profiles (paper Definition 2.2) -/

section Profiles

variable {C : Type u} [Category.{v} C]

/-- Paper Definition 2.2: the relational profile of `P` is the presheaf
`y(P) = Hom(-, P)` of admissible relationships with every probe. -/
def relationalProfile (P : C) : Cᵒᵖ ⥤ Type v :=
  CategoryTheory.yoneda.obj P

/-- Paper Definition 2.2 (restricted probe class): the `R`-restricted profile of `P`
along a probe class realized by a functor `ι : S ⥤ C`. -/
def restrictedProfile {S : Type*} [Category S] (ι : S ⥤ C) (P : C) : Sᵒᵖ ⥤ Type v :=
  ι.op ⋙ CategoryTheory.yoneda.obj P

/-- The restricted Yoneda comparison `y_R : C ⥤ [R^op, Set]` of Proposition 3.6. -/
def restrictedYoneda {S : Type*} [Category S] (ι : S ⥤ C) : C ⥤ (Sᵒᵖ ⥤ Type v) :=
  CategoryTheory.yoneda ⋙ (Functor.whiskeringLeft Sᵒᵖ Cᵒᵖ (Type v)).obj ι.op

theorem restrictedProfile_eq_obj {S : Type*} [Category S] (ι : S ⥤ C) (P : C) :
    (restrictedYoneda ι).obj P = restrictedProfile ι P :=
  rfl

/-- Paper Definition 2.4: relational equivalence `P ~_rel Q`, i.e. `y(P) ≅ y(Q)`
as presheaves on the declared category. -/
def RelationalEquivalence (P Q : C) : Prop :=
  Nonempty (relationalProfile P ≅ relationalProfile Q)

/-- Paper Definition 2.4: `R`-restricted relational equivalence. -/
def RestrictedRelationalEquivalence {S : Type*} [Category S] (ι : S ⥤ C) (P Q : C) : Prop :=
  Nonempty (restrictedProfile ι P ≅ restrictedProfile ι Q)

end Profiles

/-! ## Determination and classification (paper Definition 3.8) -/

section Classification

variable {C : Type u} [Category.{v} C]

/-- Paper Definition 3.8: an invariant is a map on objects constant on isomorphism
classes. -/
structure Invariant (S : Type*) where
  /-- The value of the invariant on an object. -/
  toFun : C → S
  /-- The invariant is constant on isomorphism classes. -/
  iso_const : ∀ {P Q : C}, (P ≅ Q) → toFun P = toFun Q

/-- Paper Definition 3.8: the invariant `I` classifies `C` up to isomorphism when
`I(P) = I(Q)` implies `P ≅ Q`. -/
def Invariant.Classifies {S : Type*} (I : Invariant (C := C) S) : Prop :=
  ∀ P Q : C, I.toFun P = I.toFun Q → Nonempty (P ≅ Q)

/-- Paper Definition 3.8: `S` is of finite-variety type over `k` when it is the set
of `k`-points of an affine variety of finite type (a common zero locus in `k^n`). -/
def FiniteVarietyType (k : Type*) [Field k] (S : Type*) : Prop :=
  ∃ (n : ℕ) (p : Finset (MvPolynomial (Fin n) k)),
    Nonempty (S ≃ {x : Fin n → k // ∀ f ∈ p, MvPolynomial.eval x f = 0})

/-- Paper Definition 3.8: a classifying invariant of finite-variety type. -/
def ClassifyingInvariantOfFiniteVarietyType (k : Type*) [Field k] (S : Type*)
    (I : Invariant (C := C) S) : Prop :=
  I.Classifies ∧ FiniteVarietyType k S

/-- Paper Definition 3.8: `C` is parametrized by a finite-dimensional variety over `k`
when a classifying invariant of finite-variety type exists. -/
def ParametrizedByFiniteVariety (k : Type*) [Field k] : Prop :=
  ∃ (S : Type v) (I : Invariant (C := C) S), I.Classifies ∧ FiniteVarietyType k S

end Classification

/-! ## Relational characterization (paper Theorem 3.1, Corollaries 3.2, 3.4) -/

section YonedaCore

variable {C : Type u} [Category.{v} C]

/-- Paper Theorem 3.1 (Yoneda lemma): the evaluation map
`Nat(Hom(-, A), F) → F(A)`, `α ↦ α_A(id_A)`, is a bijection. -/
def yoneda_nat_iso (A : C) (F : Cᵒᵖ ⥤ Type v) :
    (relationalProfile A ⟶ F) ≃ F.obj (op A) :=
  CategoryTheory.yonedaEquiv

theorem yoneda_nat_iso_apply (A : C) (F : Cᵒᵖ ⥤ Type v) (α : relationalProfile A ⟶ F) :
    yoneda_nat_iso A F α = α.app (op A) (𝟙 A) :=
  rfl

/-- Paper Corollary 3.2: `Hom(A, B) → Nat(y(A), y(B))`, `φ ↦ (g ↦ φ ∘ g)`, is a bijection. -/
def yoneda_fully_faithful (A B : C) :
    (A ⟶ B) ≃ (relationalProfile A ⟶ relationalProfile B) :=
  (CategoryTheory.yonedaEquiv (X := A) (F := relationalProfile B)).symm

theorem yoneda_fully_faithful_apply {A B : C} (φ : A ⟶ B) (R : C) (g : R ⟶ A) :
    (yoneda_fully_faithful A B φ).app (op R) g = g ≫ φ :=
  rfl

/-- Paper Corollary 3.2: `y(A) ≅ y(B)` if and only if `A ≅ B`. -/
theorem yoneda_reflects_iso (A B : C) :
    Nonempty (relationalProfile A ≅ relationalProfile B) ↔ Nonempty (A ≅ B) :=
  ⟨fun ⟨e⟩ => ⟨CategoryTheory.Yoneda.fullyFaithful.preimageIso e⟩,
    fun ⟨e⟩ => ⟨CategoryTheory.yoneda.mapIso e⟩⟩

/-- Paper Corollary 3.4: relational equivalence coincides with isomorphism in the
declared category. -/
theorem relational_characterization (P Q : C) :
    RelationalEquivalence P Q ↔ Nonempty (P ≅ Q) :=
  yoneda_reflects_iso P Q

/-- Paper Corollary 3.2 applied to the restricted comparison: if `y_R` is fully
faithful then `R`-relationally equivalent objects are isomorphic
(second half of Proposition 3.6). -/
theorem restricted_faithful_separates {S : Type*} [Category S] {ι : S ⥤ C}
    (h : (restrictedYoneda ι).FullyFaithful) (P Q : C)
    (e : RestrictedRelationalEquivalence ι P Q) : Nonempty (P ≅ Q) :=
  Nonempty.elim e fun e => ⟨h.preimageIso e⟩

end YonedaCore

/-! ## What restriction loses (paper Proposition 3.6) -/

section RestrictionGap

/-- Two morphisms out of an empty type are equal (hom-sets of `Type` are wrapped
in `TypeCat.Hom`, so plain `funext` does not apply). -/
private theorem eq_of_isEmpty_hom {α β : Type w} [IsEmpty α] (f g : α ⟶ β) : f = g := by
  apply TypeCat.Hom.ext
  apply TypeCat.Fun.ext
  funext x
  exact isEmptyElim x

/-- The unique isomorphism between two empty types. -/
private def emptyTypeIso {α β : Type w} [IsEmpty α] [IsEmpty β] : α ≅ β where
  hom := TypeCat.ofHom fun x => isEmptyElim x
  inv := TypeCat.ofHom fun y => isEmptyElim y
  hom_inv_id := eq_of_isEmpty_hom _ _
  inv_hom_id := eq_of_isEmpty_hom _ _

/-- Probe inclusion for the gap witness of Proposition 3.6: the single probe `2`
among three pairwise non-isomorphic objects. -/
def gapProbe : Discrete (Fin 1) ⥤ Discrete (Fin 3) :=
  Discrete.functor fun _ => Discrete.mk 2

/-- The two empty hom-types of the gap witness. -/
private def gapHom0 : Type := (Discrete.mk 2 : Discrete (Fin 3)) ⟶ Discrete.mk 0
private def gapHom1 : Type := (Discrete.mk 2 : Discrete (Fin 3)) ⟶ Discrete.mk 1

instance : IsEmpty gapHom0 :=
  ⟨fun f => absurd (Discrete.eq_of_hom f) (by decide)⟩

instance : IsEmpty gapHom1 :=
  ⟨fun f => absurd (Discrete.eq_of_hom f) (by decide)⟩

/-- Paper Proposition 3.6, first half: restricted profiles can agree on
non-isomorphic objects — restricting the probe class destroys separation. -/
theorem profile_restriction_gap :
    RestrictedRelationalEquivalence gapProbe (Discrete.mk 0) (Discrete.mk 1) ∧
      ¬ Nonempty ((Discrete.mk 0 : Discrete (Fin 3)) ≅ Discrete.mk 1) := by
  constructor
  · refine ⟨NatIso.ofComponents
      (fun _ => emptyTypeIso (α := gapHom0) (β := gapHom1)) ?_⟩
    intros
    exact eq_of_isEmpty_hom (α := gapHom0) (β := gapHom1) _ _
  · intro h
    exact absurd (Discrete.eq_of_hom (α := Fin 3) h.some.hom) (by decide)

end RestrictionGap

/-! ## Profiles respect limits (paper Proposition 3.7) -/

section Limits

variable {C : Type u} [Category.{v} C]

/-- Paper Proposition 3.7 (representable form): `y(P) = Hom(-, P)` preserves limits
that exist in `C`. The paper's proposition is about the Yoneda *embedding*; see
`yoneda_embedding_preserves_limits` below, which is the statement of Proposition 3.7. -/
theorem profile_limit_preservation (P : C) :
    PreservesLimitsOfSize.{t, w} (relationalProfile P) :=
  CategoryTheory.yoneda_preservesLimits P

/-- Paper Proposition 3.7 (functor form): the Yoneda embedding
`y : C ⥤ (Cᵒᵖ ⥤ Type v)` preserves limits that exist in `C`. -/
theorem yoneda_embedding_preserves_limits :
    PreservesLimitsOfSize.{t, w} (CategoryTheory.yoneda : C ⥤ Cᵒᵖ ⥤ Type v) :=
  CategoryTheory.yonedaFunctor_preservesLimits

/-- Paper Proposition 3.7: `y(A ⨯ B) ≅ y(A) ⨯ y(B)` whenever the product exists. -/
noncomputable def profile_prod_iso (A B : C) [HasBinaryProduct A B] :
    relationalProfile (A ⨯ B) ≅ relationalProfile A ⨯ relationalProfile B :=
  PreservesLimitPair.iso CategoryTheory.yoneda A B

/-- Paper Proposition 3.7: `y` preserves terminal objects. -/
noncomputable def profile_terminal_iso [HasTerminal C] :
    relationalProfile (⊤_ C) ≅ ⊤_ (Cᵒᵖ ⥤ Type v) :=
  PreservesTerminal.iso (G := CategoryTheory.yoneda (C := C))

end Limits

/-! ## Choi correspondence (paper Proposition 4.1 and Equation (1)) -/

section Choi

open Matrix

/-- `M_n`, the `n × n` complex matrices (paper: `M_n`). -/
abbrev M (n : ℕ) := Matrix (Fin n) (Fin n) ℂ

/-- The Choi matrix of a linear map `Φ : M_n → M_m` (paper: `J(Φ) = Σ E_ij ⊗ Φ(E_ij)`,
whose entries are `J(Φ)_{(i,α),(j,β)} = Φ(E_ij)_{αβ}`). -/
def choiMatrix {n m : ℕ} (Φ : M n →ₗ[ℂ] M m) : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ :=
  fun x y => Φ (Matrix.single x.1 y.1 1) x.2 y.2

/-- Pointwise matrix arithmetic, stated entrywise so tactics need not unfold
the (semi-reducible) matrix type. -/
private theorem add_entry {n : ℕ} (X Y : M n) (i j : Fin n) :
    (X + Y) i j = X i j + Y i j :=
  rfl

private theorem smul_entry {n : ℕ} (c : ℂ) (X : M n) (i j : Fin n) :
    (c • X) i j = c * X i j :=
  rfl

/-- Additivity of the inverse Choi assignment on entries. -/
private theorem ofChoi_add {n m : ℕ} (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ)
    (X Y : M n) :
    (fun α β => ∑ i : Fin n, ∑ j : Fin n, (X + Y) i j * J (i, α) (j, β)) =
      (fun α β => ∑ i : Fin n, ∑ j : Fin n, X i j * J (i, α) (j, β)) +
        (fun α β => ∑ i : Fin n, ∑ j : Fin n, Y i j * J (i, α) (j, β)) := by
  apply Matrix.ext
  intro α β
  simp only [add_entry, add_mul, Finset.sum_add_distrib, Pi.add_apply]

/-- Homogeneity of the inverse Choi assignment on entries. -/
private theorem ofChoi_smul {n m : ℕ} (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ)
    (c : ℂ) (X : M n) :
    (fun α β => ∑ i : Fin n, ∑ j : Fin n, (c • X) i j * J (i, α) (j, β)) =
      c • (fun α β => ∑ i : Fin n, ∑ j : Fin n, X i j * J (i, α) (j, β)) := by
  apply Matrix.ext
  intro α β
  simp only [smul_entry, mul_assoc, Finset.mul_sum, Pi.smul_apply, smul_eq_mul]

/-- Inverse of the Choi assignment: `J ↦ (X ↦ (α, β) ↦ Σ_{i,j} X_{ij} J_{(i,α),(j,β)})`. -/
def ofChoi {n m : ℕ} (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ) : M n →ₗ[ℂ] M m where
  toFun X := fun α β => ∑ i : Fin n, ∑ j : Fin n, X i j * J (i, α) (j, β)
  map_add' := ofChoi_add J
  map_smul' := ofChoi_smul J

/-- Every matrix is the linear combination `X = Σ_{i,j} X_{ij} • E_{ij}` of matrix units. -/
theorem sum_single_smul {n : ℕ} (X : M n) :
    X = ∑ i : Fin n, ∑ j : Fin n, X i j • Matrix.single i j (1 : ℂ) := by
  apply Matrix.ext
  intro a b
  simp only [Matrix.sum_apply, smul_entry, Matrix.single_apply]
  rw [Finset.sum_eq_single a]
  · rw [Finset.sum_eq_single b]
    · simp
    · intro j _ hj
      simp [hj]
    · simp
  · intro i _ hi
    refine Finset.sum_eq_zero fun j _ => ?_
    simp [hi]
  · simp

/-- Applying a linear map to `Y` expands entrywise along the matrix units. -/
theorem map_eq_sum_single {n p : ℕ} (Ψ : M n →ₗ[ℂ] M p) (Y : M n) (α β) :
    Ψ Y α β = ∑ i : Fin n, ∑ j : Fin n, Y i j * Ψ (Matrix.single i j 1) α β := by
  conv_lhs => rw [sum_single_smul Y]
  simp only [map_sum, Matrix.sum_apply, map_smul, smul_entry]

/-- Paper Proposition 4.1: `Φ ↦ J(Φ)` is a linear bijection `L(M_n, M_m) ≃ M_n ⊗ M_m`. -/
def choi_correspondence {n m : ℕ} :
    (M n →ₗ[ℂ] M m) ≃ₗ[ℂ] Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ where
  toFun := choiMatrix
  invFun := ofChoi
  map_add' Φ Ψ := by
    apply Matrix.ext
    intro x y
    rfl
  map_smul' c Φ := by
    apply Matrix.ext
    intro x y
    rfl
  left_inv Φ := by
    apply LinearMap.ext
    intro X
    apply Matrix.ext
    intro α β
    exact (map_eq_sum_single Φ X α β).symm
  right_inv J := by
    apply Matrix.ext
    intro x y
    show ∑ i : Fin n, ∑ j : Fin n, (Matrix.single x.1 y.1 1) i j * J (i, x.2) (j, y.2) = J x y
    rw [Finset.sum_eq_single x.1]
    · rw [Finset.sum_eq_single y.1]
      · simp
      · intro l _ hl
        rw [Matrix.single_apply_of_ne x.1 y.1 1 x.1 l (fun h => hl h.2.symm), zero_mul]
      · simp
    · intro k _ hk
      refine Finset.sum_eq_zero fun l _ => ?_
      rw [Matrix.single_apply_of_ne x.1 y.1 1 k l (fun h => hk h.1.symm), zero_mul]
    · simp

/-- Composition of channels is a double contraction of Choi indices along the shared
system (paper Equation (1)). -/
theorem choi_composition {n m p : ℕ} (Φ : M n →ₗ[ℂ] M m) (Ψ : M m →ₗ[ℂ] M p) :
    choiMatrix (Ψ.comp Φ) = fun x y =>
      ∑ k : Fin m, ∑ l : Fin m,
        choiMatrix Φ (x.1, k) (y.1, l) * choiMatrix Ψ (k, x.2) (l, y.2) := by
  apply Matrix.ext
  intro x y
  exact map_eq_sum_single Ψ (Φ (Matrix.single x.1 y.1 1)) x.2 y.2

/-- Partial trace over the output factor: `(Tr_m J)_{ij} = Σ_α J_{(i,α),(j,α)}`. -/
def partialTrace {n m : ℕ} (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ) : M n :=
  fun i j => ∑ α : Fin m, J (i, α) (j, α)

/-- The matrix unit `E_{ij}` has trace `(1 : M n) i j`. -/
private theorem trace_single {n : ℕ} (i j : Fin n) :
    Matrix.trace (Matrix.single i j (1 : ℂ)) = (1 : M n) i j := by
  show (∑ k : Fin n, (Matrix.single i j 1) k k) = (1 : M n) i j
  rw [Finset.sum_eq_single i]
  · by_cases h : i = j
    · subst h
      simp
    · have h2 : ¬(j = i) := fun w => h w.symm
      simp [h, h2]
  · intro k _ hk
    exact Matrix.single_apply_of_ne i j 1 k k (fun h => hk h.1.symm)
  · simp

/-- Paper Proposition 4.1: `Φ` is trace preserving if and only if `Tr_m J(Φ) = I_n`. -/
theorem choi_trace_preserving {n m : ℕ} (Φ : M n →ₗ[ℂ] M m) :
    (∀ X : M n, Matrix.trace (Φ X) = Matrix.trace X) ↔
      partialTrace (choiMatrix Φ) = 1 := by
  have e1 : ∀ i j : Fin n,
      partialTrace (choiMatrix Φ) i j = Matrix.trace (Φ (Matrix.single i j 1)) := by
    intro i j
    show (∑ α : Fin m, choiMatrix Φ (i, α) (j, α)) = ∑ k : Fin m, Φ (Matrix.single i j 1) k k
    simp only [choiMatrix]
  constructor
  · intro h
    apply Matrix.ext
    intro i j
    rw [e1 i j, h, trace_single]
  · intro h X
    have key : ∀ i j : Fin n, Matrix.trace (Φ (Matrix.single i j 1)) = (1 : M n) i j := by
      intro i j
      rw [← e1 i j, h]
    have step1 : Φ X = ∑ i : Fin n, ∑ j : Fin n, X i j • Φ (Matrix.single i j 1) := by
      conv_lhs => rw [sum_single_smul X]
      simp only [map_sum, map_smul]
    calc Matrix.trace (Φ X)
        = Matrix.trace (∑ i : Fin n, ∑ j : Fin n, X i j • Φ (Matrix.single i j 1)) := by
          rw [step1]
      _ = ∑ i : Fin n, ∑ j : Fin n, Matrix.trace (X i j • Φ (Matrix.single i j 1)) := by
          simp only [Matrix.trace_sum]
      _ = ∑ i : Fin n, ∑ j : Fin n, X i j * Matrix.trace (Φ (Matrix.single i j 1)) := by
          simp only [Matrix.trace_smul, smul_eq_mul]
      _ = ∑ i : Fin n, ∑ j : Fin n, X i j * (1 : M n) i j := by
          simp only [key]
      _ = ∑ i : Fin n, X i i := by
          apply Finset.sum_congr rfl
          intro i _
          show ∑ j : Fin n, X i j * (1 : M n) i j = X i i
          rw [Finset.sum_eq_single i]
          · rw [Matrix.one_apply]
            simp
          · intro j _ hj
            rw [Matrix.one_apply]
            have hij : ¬(i = j) := fun w => hj w.symm
            simp [hij]
          · simp
      _ = Matrix.trace X := by
          simp only [Matrix.trace, Matrix.diag_apply]

end Choi

end Cmrps.Vol04

exec
/usr/local/bin/zsh -lc "sed -n '1,280p' lean/Cmrps/Vol01Foundations.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
/-
Vol. 1 — Foundations (papers/latex/vol-01-foundations.tex).
Mechanisation targets: verification/vol-01-foundations-lean-targets.md.
Namespace `Cmrps.Vol01`; identifiers mirror the paper's names where possible.
-/
import Mathlib

/-!
# Vol. 1 — Foundations

Formalised targets (see `verification/vol-01-foundations-lean-targets.md`):

* `vol01.morphisms.composition_not_typed`      → `compositionNotTyped`
* `vol01.morphisms.self_composition`           → `coarseGraining_selfComposition`,
  `embedding_selfComposition`, `equivalenceMorphism_selfComposition`
* `vol01.admissibility.kind_category`          → `coarseGraining_kindCategory`,
  `embedding_kindCategory`, `equivalenceMorphism_kindCategory`
* `vol01.admissibility.conditional_statements` → `conditional_statements`
* `vol01.finiteState.irreducible_iff_card_eq_one` → `irreducible_iff_card_eq_one`
* `vol01.finiteState.classify_iff_card_eq`     → `iso_iff_card_eq`,
  `onePoint_decomposition_unique`, `card_classifies_quotient`
* `vol01.dynamics.irreducible_iff_connected`   → `irreducible_iff_connected`
* `vol01.dynamics.connected_components_unique` → `components_unique`, `components_exist`
* `vol01.product.irreducible_iff_prime_card`   → `irreducibleProduct_iff_prime_card`,
  `prime_factorization`, `prime_factorization_unique`
* `vol01.qubit.factorization_nonunique`        → `factorization_nonunique`
-/

namespace Cmrps.Vol01

/-! ## Definition 3.4 — finite classical records -/

/-- Definition 3.4: a finite classical record `P = (X, O, D, S, C)`. Only the
state space `X` varies: the observables are the full algebra `ℝ^X`, the
dynamics is the identity, the symmetry is trivial, and the composition rule is
disjoint union. The record is presented by its state space. -/
structure FinRec where
  /-- The state space of the record. -/
  X : Type
  /-- The state space is finite. -/
  instFintype : Fintype X

attribute [instance] FinRec.instFintype

/-! ## Definition 4.3 — concrete preservation laws (point-set form) -/

/-- Definition 4.3(1), point-set form on finite classical records: a
coarse-graining has surjective state map. The observable condition is vacuous
here because the observable algebra is the full function algebra `ℝ^X`, so
every target observable pulls back by precomposition. -/
def IsCoarseGraining {X Y : Type} (g : X → Y) : Prop := Function.Surjective g

/-- Definition 4.3(2), point-set form: an embedding has injective state map.
Observable extension is vacuous for `ℝ^X`, and the identity dynamics of finite
classical records restricts to the identity. -/
def IsEmbedding {X Y : Type} (e : X → Y) : Prop := Function.Injective e

/-- Definition 4.3(3): an equivalence morphism is a bijection of state spaces,
carrying the determined components across. -/
def IsEquivalenceMorphism {X Y : Type} (g : X → Y) : Prop := Function.Bijective g

/-- Definition 4.3(4), point-set form: the underlying map of a duality is
invertible as a correspondence between the two presentations (isomorphisms of
a category and of its opposite coincide). -/
def IsDuality {X Y : Type} (g : X → Y) : Prop := Function.Bijective g

/-- Definition 4.3(5): a map between two fixed finite records is never a
limiting procedure — the law requires the leg of a cone on a diagram with
unbounded index, and excludes such fixed maps by definition. -/
def IsLimitingProcedure {X Y : Type} (_g : X → Y) : Prop := False

/-! ## Proposition 4.4 — composition is not typed -/

/-- The embedding state map of Proposition 4.4: `Fin 2 → Fin 4`, `0 ↦ 0`,
`1 ↦ 2` (the paper's `a ↦ 1`, `b ↦ 3`). -/
def embeddingMap : Fin 2 → Fin 4 := fun i => if i = 0 then 0 else 2

/-- The coarse-graining state map of Proposition 4.4: `Fin 4 → Fin 2`,
`0 ↦ 0`, `1 ↦ 1`, `2 ↦ 0`, `3 ↦ 1` (the paper's `1,3 ↦ p`, `2,4 ↦ q`). -/
def coarseMap : Fin 4 → Fin 2 := fun i => if i = 0 ∨ i = 2 then 0 else 1

/-- Proposition 4.4 (target `vol01.morphisms.composition_not_typed`): there
are finite classical records and morphisms — the embedding `embeddingMap`
followed by the coarse-graining `coarseMap` — whose composite is the constant
map `0 ↦ 0`, satisfying none of the five preservation laws of Definition 4.3. -/
theorem compositionNotTyped :
    IsEmbedding embeddingMap ∧ IsCoarseGraining coarseMap ∧
      (¬ IsCoarseGraining (coarseMap ∘ embeddingMap)) ∧
      (¬ IsEmbedding (coarseMap ∘ embeddingMap)) ∧
      (¬ IsEquivalenceMorphism (coarseMap ∘ embeddingMap)) ∧
      (¬ IsDuality (coarseMap ∘ embeddingMap)) ∧
      (¬ IsLimitingProcedure (coarseMap ∘ embeddingMap)) := by
  have hcomp : ∀ i : Fin 2, (coarseMap ∘ embeddingMap) i = 0 := by
    intro i
    fin_cases i <;> simp [coarseMap, embeddingMap]
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · intro a b hab
    fin_cases a <;> fin_cases b <;> simp [embeddingMap] at hab ⊢
  · intro y
    fin_cases y
    · exact ⟨0, by simp [coarseMap]⟩
    · exact ⟨1, by simp [coarseMap]⟩
  · intro h
    have h1 : (coarseMap ∘ embeddingMap) 1 = 0 := hcomp 1
    obtain ⟨y, hy⟩ := h (1 : Fin 2)
    fin_cases y <;> simp [coarseMap, embeddingMap] at hy
  · intro h
    have hh : (coarseMap ∘ embeddingMap) 0 = (coarseMap ∘ embeddingMap) 1 := by
      rw [hcomp, hcomp]
    have : (0 : Fin 2) = 1 := h hh
    exact absurd this (by decide)
  · intro h
    have hh : (coarseMap ∘ embeddingMap) 0 = (coarseMap ∘ embeddingMap) 1 := by
      rw [hcomp, hcomp]
    exact absurd (h.1 hh) (by decide)
  · intro h
    have hh : (coarseMap ∘ embeddingMap) 0 = (coarseMap ∘ embeddingMap) 1 := by
      rw [hcomp, hcomp]
    exact absurd (h.1 hh) (by decide)
  · exact fun h => h

/-! ## Proposition 4.6 — self-composition within a kind -/

/-- Proposition 4.6 (target `vol01.morphisms.self_composition`), coarse-graining
kind: coarse-grainings compose to coarse-grainings and the identity is a
coarse-graining, under the laws of Definition 4.3. -/
theorem coarseGraining_selfComposition {X Y Z : Type} {g : Y → Z} {f : X → Y}
    (hg : IsCoarseGraining g) (hf : IsCoarseGraining f) : IsCoarseGraining (g ∘ f) :=
  hg.comp hf

/-- Proposition 4.6, embedding kind: embeddings compose to embeddings. -/
theorem embedding_selfComposition {X Y Z : Type} {g : Y → Z} {f : X → Y}
    (hg : IsEmbedding g) (hf : IsEmbedding f) : IsEmbedding (g ∘ f) :=
  hg.comp hf

/-- Proposition 4.6, equivalence-morphism kind: equivalence morphisms compose
to equivalence morphisms. -/
theorem equivalenceMorphism_selfComposition {X Y Z : Type} {g : Y → Z} {f : X → Y}
    (hg : IsEquivalenceMorphism g) (hf : IsEquivalenceMorphism f) :
    IsEquivalenceMorphism (g ∘ f) :=
  ⟨hg.1.comp hf.1, hg.2.comp hf.2⟩

/-- The identity state map is a morphism of each of the three closed kinds. -/
theorem identity_of_kind {X : Type} :
    IsCoarseGraining (id : X → X) ∧ IsEmbedding (id : X → X) ∧
      IsEquivalenceMorphism (id : X → X) :=
  ⟨fun y => ⟨y, rfl⟩, fun _ _ h => h, ⟨fun _ _ h => h, fun y => ⟨y, rfl⟩⟩⟩

/-! ## Proposition 6.4 — kind-relative categories -/

/-- The morphisms of one kind between finite classical records, closed under
self-composition and containing the identities, carry exactly the structure of
a category (Proposition 6.4). This is the category content of the proposition;
the objects are the records and `Hom P Q` the morphisms of the chosen kind. -/
structure CategoryData (Obj : Type u) (Hom : Obj → Obj → Type v) where
  /-- The identity morphism of a record. -/
  id : ∀ X, Hom X X
  /-- Composition of morphisms of the kind. -/
  comp : ∀ {X Y Z : Obj}, Hom X Y → Hom Y Z → Hom X Z
  /-- Left identity law. -/
  id_comp : ∀ {X Y : Obj} (f : Hom X Y), comp (id X) f = f
  /-- Right identity law. -/
  comp_id : ∀ {X Y : Obj} (f : Hom X Y), comp f (id Y) = f
  /-- Associativity of composition. -/
  assoc : ∀ {W X Y Z : Obj} (f : Hom W X) (g : Hom X Y) (h : Hom Y Z),
    comp (comp f g) h = comp f (comp g h)

/-- Morphisms of coarse-graining kind between finite classical records. -/
def CoarseHom (P Q : FinRec) : Type := {f : P.X → Q.X // IsCoarseGraining f}

/-- Morphisms of embedding kind between finite classical records. -/
def EmbeddingHom (P Q : FinRec) : Type := {f : P.X → Q.X // IsEmbedding f}

/-- Morphisms of equivalence kind between finite classical records. -/
def EquivalenceHom (P Q : FinRec) : Type := {f : P.X → Q.X // IsEquivalenceMorphism f}

/-- Proposition 6.4 (target `vol01.admissibility.kind_category`), coarse-graining
kind: finite classical records with coarse-graining morphisms form a category. -/
def coarseGraining_kindCategory : CategoryData FinRec CoarseHom where
  id _ := ⟨id, (identity_of_kind).1⟩
  comp f g := ⟨g.1 ∘ f.1, coarseGraining_selfComposition g.2 f.2⟩
  id_comp _ := Subtype.ext (Function.comp_id _)
  comp_id _ := Subtype.ext (Function.id_comp _)
  assoc _ _ _ := Subtype.ext (Function.comp_assoc _ _ _).symm

/-- Proposition 6.4, embedding kind: finite classical records with embedding
morphisms form a category. -/
def embedding_kindCategory : CategoryData FinRec EmbeddingHom where
  id _ := ⟨id, (identity_of_kind).2.1⟩
  comp f g := ⟨g.1 ∘ f.1, embedding_selfComposition g.2 f.2⟩
  id_comp _ := Subtype.ext (Function.comp_id _)
  comp_id _ := Subtype.ext (Function.id_comp _)
  assoc _ _ _ := Subtype.ext (Function.comp_assoc _ _ _).symm

/-- Proposition 6.4, equivalence kind: finite classical records with
equivalence morphisms form a category. -/
def equivalenceMorphism_kindCategory : CategoryData FinRec EquivalenceHom where
  id _ := ⟨id, (identity_of_kind).2.2⟩
  comp f g := ⟨g.1 ∘ f.1, equivalenceMorphism_selfComposition g.2 f.2⟩
  id_comp _ := Subtype.ext (Function.comp_id _)
  comp_id _ := Subtype.ext (Function.id_comp _)
  assoc _ _ _ := Subtype.ext (Function.comp_assoc _ _ _).symm

/-! ## Proposition 6.5 — conditionality over admissible systems -/

/-- Definition 6.1 (AC-2), specialised to point-set records: the observable
collection `O ⊆ (X → ℝ)` is closed under the operations of its ambient algebra,
in particular under addition. -/
def ObservableClosure {X : Type} (O : Set (X → ℝ)) : Prop :=
  ∀ f ∈ O, ∀ h ∈ O, f + h ∈ O

/-- The point-mass observable `δ_x` on a decidable type. -/
def delta {X : Type} [DecidableEq X] (x : X) : X → ℝ := fun y => if y = x then 1 else 0

/-- Proposition 6.5 (target `vol01.admissibility.conditional_statements`): the
sentence "the observable collection is closed under addition" holds with AC-2
in force, and fails on the admitted record `X = Fin 2`, `O = {δ₀, δ₁}` of point
masses with AC-2 dropped. -/
theorem conditional_statements :
    (∀ (X : Type) (O : Set (X → ℝ)), ObservableClosure O →
        ∀ f ∈ O, ∀ h ∈ O, f + h ∈ O) ∧
      ¬ ObservableClosure ({delta 0, delta 1} : Set (Fin 2 → ℝ)) := by
  refine ⟨fun X O hO f hf h hh => hO f hf h hh, ?_⟩
  intro hO
  have hsum : delta (0 : Fin 2) + delta 1 = fun _ => 1 := by
    funext x
    fin_cases x <;> simp [delta, Pi.add_apply]
  have hmem : (fun _ : Fin 2 => (1 : ℝ)) ∈ ({delta 0, delta 1} : Set (Fin 2 → ℝ)) := by
    rw [← hsum]
    exact hO (delta 0) (by simp) (delta 1) (by simp)
  simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hmem
  rcases hmem with hmem | hmem
  · have hne := congrFun hmem (1 : Fin 2)
    simp [delta] at hne
  · have hne := congrFun hmem (0 : Fin 2)
    simp [delta] at hne

/-! ## Definition 3.12 and Theorem 8.1 — finite classical records -/

/-- Definition 3.12 with disjoint-union composition: the neutral record is the
empty record (cardinality 0), and a record is irreducible when it is not the
unit and is not the disjoint union of two nonempty state spaces. Up to
isomorphism only the cardinality matters, so the condition is a condition on
`Fintype.card X`. -/
def IsIrreducibleDisjointUnion (X : Type) [Fintype X] : Prop :=
  Fintype.card X ≠ 0 ∧ ¬ ∃ n : ℕ, 0 < n ∧ n < Fintype.card X

/-- Example 7.1: a record splits as the disjoint union of two nonempty records
exactly when its cardinality has an intermediate factor. -/
theorem irreducible_iff_no_sum_split {X : Type} [Fintype X] :
    IsIrreducibleDisjointUnion X ↔
      Fintype.card X ≠ 0 ∧
        ¬ ∃ (X₁ X₂ : Type) (_ : Fintype X₁) (_ : Fintype X₂),
          Nonempty X₁ ∧ Nonempty X₂ ∧ Nonempty (X ≃ X₁ ⊕ X₂) := by
  constructor
  · rintro ⟨hne, hs⟩
    refine ⟨hne, ?_⟩
    rintro ⟨X₁, X₂, _, _, h₁, h₂, ⟨e⟩⟩
    have hc1 : 0 < Fintype.card X₁ := Fintype.card_pos_iff.mpr h₁
    have hc2 : 0 < Fintype.card X₂ := Fintype.card_pos_iff.mpr h₂
    exact hs ⟨Fintype.card X₁, hc1, by
      rw [Fintype.card_congr e, Fintype.card_sum]
      omega⟩
  · rintro ⟨hne, hs⟩
    refine ⟨hne, ?_⟩
    rintro ⟨n, hpos, hlt⟩
    refine hs ?_
    refine ⟨Fin n, Fin (Fintype.card X - n), inferInstance, inferInstance,
      ⟨⟨0, by omega⟩⟩, ⟨⟨0, by omega⟩⟩, ?_⟩
    have hcard : Fintype.card (Fin n ⊕ Fin (Fintype.card X - n)) = Fintype.card X := by
      rw [Fintype.card_sum, Fintype.card_fin, Fintype.card_fin]
      omega
    exact Fintype.card_eq.mp hcard.symm

/-- Theorem 8.1(1) (target `vol01.finiteState.irreducible_iff_card_eq_one`): a
finite classical record is irreducible under disjoint union exactly when its
state space has one element. -/
theorem irreducible_iff_card_eq_one {X : Type} [Fintype X] :
    IsIrreducibleDisjointUnion X ↔ Fintype.card X = 1 := by
  constructor

codex
The main round 1 definition changes are present, including separate past/future injectivity and the Yoneda embedding preservation statement. Volumes 11 and 12 now state their scope limitations explicitly. I’m checking whether the revised statements still have mathematical gaps.
exec
/usr/local/bin/zsh -lc "sed -n '281,560p' lean/Cmrps/Vol01Foundations.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
  · rintro ⟨hne, hs⟩
    have hnot : ¬ (2 ≤ Fintype.card X) := by
      intro h2
      exact hs ⟨1, by omega, by omega⟩
    omega
  · intro h
    refine ⟨by omega, ?_⟩
    rintro ⟨n, _, hlt⟩
    omega

/-- Theorem 8.1(3) (target `vol01.finiteState.classify_iff_card_eq`): two
finite classical records are isomorphic exactly when their state spaces have
equal cardinality. -/
theorem iso_iff_card_eq {X Y : Type} [Fintype X] [Fintype Y] :
    Nonempty (X ≃ Y) ↔ Fintype.card X = Fintype.card Y :=
  Fintype.card_eq.symm

/-- Theorem 8.1(2): a decomposition of `X` into one-point records has exactly
`Fintype.card X` factors, so the decomposition is unique up to order and
isomorphism of factors. -/
theorem onePoint_decomposition_unique
    {X : Type} [Fintype X] {n : ℕ} {P : Fin n → Type} [∀ i, Fintype (P i)]
    (h1 : ∀ i, Fintype.card (P i) = 1) (split : Nonempty (X ≃ Σ i, P i)) :
    n = Fintype.card X := by
  obtain ⟨e⟩ := split
  have hcard : Fintype.card X = n := by
    rw [Fintype.card_congr e, Fintype.card_sigma]
    simp_rw [h1]
    rw [Finset.sum_const, Finset.card_fin]
    simp
  exact hcard.symm

/-- Theorem 8.1(2): all one-point factors of a decomposition are isomorphic to
the one-point record `Fin 1`. -/
theorem onePoint_factors_iso {n : ℕ} {P : Fin n → Type} [∀ i, Fintype (P i)]
    (h1 : ∀ i, Fintype.card (P i) = 1) (i : Fin n) : Nonempty (P i ≃ Fin 1) :=
  Fintype.card_eq.mp ((h1 i).trans (Fintype.card_fin 1).symm)

/-- Theorem 8.1(4): cardinality is a complete invariant; the quotient of
finite classical records by isomorphism is in bijection with the nonnegative
integers, the empty record corresponding to zero. -/
theorem card_classifies_quotient :
    (∀ (X Y : Type) [Fintype X] [Fintype Y],
        (Nonempty (X ≃ Y) ↔ Fintype.card X = Fintype.card Y)) ∧
      ∀ n : ℕ, ∃ (X : Type) (_ : Fintype X), Fintype.card X = n := by
  refine ⟨fun X Y _ _ => iso_iff_card_eq, ?_⟩
  intro n
  exact ⟨Fin n, inferInstance, Fintype.card_fin n⟩

/-! ## Definition 3.5, 3.12 and Theorem 8.2 — finite dynamical records -/

/-- Definition 3.5: a finite dynamical record is presented by a finite state
space `X` with discrete-time dynamics given by a self-map `f : X → X`. Two
states are adjacent when one is the image of the other under `f`; this is the
edge relation of the functional graph. -/
def Step {X : Type} (f : X → X) (x y : X) : Prop := f x = y ∨ f y = x

/-- Weak connectivity of the functional graph of `f` (Theorem 8.2): the record
is nonempty and any two states are joined by a finite chain of forward or
backward edges. -/
def WeaklyConnected {X : Type} (f : X → X) : Prop :=
  Nonempty X ∧ ∀ x y : X, Relation.ReflTransGen (Step f) x y

/-- Definition 3.12 on a finite dynamical record: irreducible under disjoint
union with componentwise dynamics — not the unit (the empty record) and no
split of `X` into two nonempty `f`-invariant parts. -/
def IsIrreducibleDyn {X : Type} (f : X → X) : Prop :=
  Nonempty X ∧ ¬ ∃ (s t : Set X), s.Nonempty ∧ t.Nonempty ∧ s ∩ t = ∅ ∧
    s ∪ t = Set.univ ∧ (∀ x ∈ s, f x ∈ s) ∧ (∀ x ∈ t, f x ∈ t)

/-- The functional graph edge relation is symmetric. -/
theorem step_symm {X : Type} {f : X → X} {a b : X} (h : Step f a b) : Step f b a := by
  rcases h with h | h
  · exact Or.inr h
  · exact Or.inl h

/-- Reachability in the functional graph is symmetric, because the edge
relation is. -/
theorem reachable_symm {X : Type} {f : X → X} {a b : X}
    (h : Relation.ReflTransGen (Step f) a b) : Relation.ReflTransGen (Step f) b a := by
  induction h with
  | refl => exact Relation.ReflTransGen.refl
  | tail _ hstep ih => exact (Relation.ReflTransGen.single (step_symm hstep)).trans ih

/-- If `x₀` reaches `f x` then it reaches `x`: the edge `x — f x` is traversed
backwards. -/
theorem reachable_pre {X : Type} {f : X → X} {x₀ x : X}
    (h : Relation.ReflTransGen (Step f) x₀ (f x)) :
    Relation.ReflTransGen (Step f) x₀ x :=
  h.trans (reachable_symm (Relation.ReflTransGen.single (Or.inl rfl : Step f x (f x))))

/-- Theorem 8.2(1) (target `vol01.dynamics.irreducible_iff_connected`): a
finite dynamical record is irreducible under disjoint union exactly when its
functional graph is weakly connected. -/
theorem irreducible_iff_connected {X : Type} [Fintype X] (f : X → X) :
    IsIrreducibleDyn f ↔ WeaklyConnected f := by
  constructor
  · rintro ⟨hne, hirr⟩
    obtain ⟨x₀⟩ := hne
    refine ⟨⟨x₀⟩, ?_⟩
    intro y z
    have hall : ∀ w : X, Relation.ReflTransGen (Step f) x₀ w := by
      by_contra hn
      push Not at hn
      obtain ⟨w, hw⟩ := hn
      set s := {u : X | Relation.ReflTransGen (Step f) x₀ u} with hsdef
      have hsn : s.Nonempty := ⟨x₀, Relation.ReflTransGen.refl⟩
      have htn : sᶜ.Nonempty := ⟨w, by simpa [hsdef] using hw⟩
      have hs : ∀ u ∈ s, f u ∈ s := by
        intro u hu
        exact Relation.ReflTransGen.trans hu
          (Relation.ReflTransGen.single (Or.inl rfl : Step f u (f u)))
      have hsc : ∀ u ∈ sᶜ, f u ∈ sᶜ := by
        intro u hu hfu
        exact hu (reachable_pre hfu)
      exact hirr ⟨s, sᶜ, hsn, htn, Set.inter_compl_self s,
        Set.union_compl_self s, hs, hsc⟩
    exact (reachable_symm (hall y)).trans (hall z)
  · rintro ⟨hne, hconn⟩
    refine ⟨hne, ?_⟩
    rintro ⟨s, t, hsn, htn, hdisj, huniv, hs, ht⟩
    obtain ⟨x, hx⟩ := hsn
    obtain ⟨y, hy⟩ := htn
    have htc : ∀ u ∈ sᶜ, f u ∈ sᶜ := by
      intro u hu hfu
      have hu' : u ∈ s ∪ t := by rw [huniv]; trivial
      rcases hu' with hu' | hu'
      · exact hu hu'
      · have hfin : f u ∈ s ∩ t := ⟨hfu, ht u hu'⟩
        rw [hdisj] at hfin
        exact (Set.mem_empty_iff_false _).mp hfin
    have hstep : ∀ {a b : X}, Step f a b → a ∈ s → b ∈ s := by
      intro a b hab ha
      rcases hab with hab | hab
      · rw [← hab]; exact hs a ha
      · by_contra hbs
        have hbs' : b ∈ sᶜ := by simpa using hbs
        have : f b ∈ sᶜ := htc b hbs'
        rw [hab] at this
        exact this ha
    have hmem : ∀ {b : X}, Relation.ReflTransGen (Step f) x b → b ∈ s := by
      intro b hb
      induction hb with
      | refl => exact hx
      | tail _ hstep' ih => exact hstep hstep' ih
    have hy' : y ∈ s := hmem (hconn x y)
    have hyt : y ∈ s ∩ t := ⟨hy', hy⟩
    rw [hdisj] at hyt
    exact (Set.mem_empty_iff_false y).mp hyt

/-! ## Theorem 8.2(2) — uniqueness of the connected-component decomposition -/

/-- The connected component (reachability class) of `x` in the functional
graph of `f`. -/
def reachableClass {X : Type} (f : X → X) (x : X) : Set X :=
  {y | Relation.ReflTransGen (Step f) x y}

/-- A decomposition of a finite dynamical record (Definition 3.13): a
partition of `X` into nonempty `f`-invariant weakly connected parts. -/
structure DynDecomposition {X : Type} (f : X → X) where
  /-- The parts of the partition. -/
  parts : Finset (Set X)
  /-- Every part is nonempty. -/
  nonempty : ∀ s ∈ parts, s.Nonempty
  /-- Every part is `f`-invariant. -/
  invariant : ∀ s ∈ parts, ∀ x ∈ s, f x ∈ s
  /-- Distinct parts are disjoint. -/
  disjoint : ∀ s ∈ parts, ∀ t ∈ parts, s ≠ t → s ∩ t = ∅
  /-- The parts cover `X`. -/
  cover : ∀ x : X, ∃ s ∈ parts, x ∈ s
  /-- Every part is weakly connected in the functional graph. -/
  connected : ∀ s ∈ parts, ∀ x ∈ s, ∀ y ∈ s, Relation.ReflTransGen (Step f) x y

/-- Reachability classes are equal or disjoint. -/
theorem reachableClass_eq_of_reach {X : Type} {f : X → X} {x y : X}
    (h : Relation.ReflTransGen (Step f) x y) :
    reachableClass f x = reachableClass f y := by
  apply Set.eq_of_subset_of_subset
  · intro z hz
    exact (reachable_symm h).trans hz
  · intro z hz
    exact h.trans hz

/-- Every part of a decomposition is exactly the reachability class of any of
its points. -/
theorem class_eq_of_mem {X : Type} {f : X → X} {D : DynDecomposition f}
    {s : Set X} {x : X} (hs : s ∈ D.parts) (hx : x ∈ s) :
    s = reachableClass f x := by
  apply Set.eq_of_subset_of_subset
  · intro y hy
    exact D.connected s hs x hx y hy
  · intro y hy
    have hsc : ∀ z ∈ sᶜ, f z ∈ sᶜ := by
      intro z hz hfin
      obtain ⟨t, ht, hzt⟩ := D.cover z
      have hts : t ≠ s := by
        rintro rfl
        exact hz hzt
      have hfin' : f z ∈ t := D.invariant t ht z hzt
      have hempty : s ∩ t = ∅ := D.disjoint s hs t ht hts.symm
      have hboth : f z ∈ s ∩ t := ⟨hfin, hfin'⟩
      rw [hempty] at hboth
      exact (Set.mem_empty_iff_false _).mp hboth
    have hstep : ∀ {a b : X}, Step f a b → a ∈ s → b ∈ s := by
      intro a b hab ha
      rcases hab with hab | hab
      · rw [← hab]; exact D.invariant s hs a ha
      · by_contra hbs
        have hbs' : b ∈ sᶜ := by simpa using hbs
        have : f b ∈ sᶜ := hsc b hbs'
        rw [hab] at this
        exact this ha
    have hmem : ∀ {b : X}, Relation.ReflTransGen (Step f) x b → b ∈ s := by
      intro b hb
      induction hb with
      | refl => exact hx
      | tail _ hstep' ih => exact hstep hstep' ih
    exact hmem hy

/-- Theorem 8.2(2) (target `vol01.dynamics.connected_components_unique`): the
connected-component decomposition is unique up to order and isomorphism of
factors — any two decompositions into nonempty invariant connected parts have
the same parts. -/
theorem components_unique {X : Type} {f : X → X}
    (D₁ D₂ : DynDecomposition f) : D₁.parts = D₂.parts := by
  apply Finset.ext
  intro a
  constructor
  · intro ha
    obtain ⟨x, hx⟩ := D₁.nonempty a ha
    have key := class_eq_of_mem ha hx
    obtain ⟨b, hb, hxb⟩ := D₂.cover x
    have keyb := class_eq_of_mem hb hxb
    have hab : a = b := key.trans keyb.symm
    rw [hab]
    exact hb
  · intro ha
    obtain ⟨x, hx⟩ := D₂.nonempty a ha
    have key := class_eq_of_mem ha hx
    obtain ⟨b, hb, hxb⟩ := D₁.cover x
    have keyb := class_eq_of_mem hb hxb
    have hab : a = b := key.trans keyb.symm
    rw [hab]
    exact hb

/-- Theorem 8.2(2): the connected-component decomposition exists — the
reachability classes of the functional graph partition `X` into nonempty
invariant connected parts. -/
theorem components_exist {X : Type} [Fintype X] (f : X → X) :
    ∃ D : DynDecomposition f,
      ∀ s : Set X, s ∈ D.parts ↔ ∃ x : X, s = reachableClass f x := by
  classical
  set S : Finset (Set X) := Finset.univ.image fun x : X => reachableClass f x
  have hne : ∀ s ∈ S, s.Nonempty := by
    intro s hs
    obtain ⟨x, _, rfl⟩ := Finset.mem_image.mp hs
    exact ⟨x, Relation.ReflTransGen.refl⟩
  have hinv : ∀ s ∈ S, ∀ x ∈ s, f x ∈ s := by
    intro s hs x hx
    obtain ⟨x₀, _, rfl⟩ := Finset.mem_image.mp hs
    exact Relation.ReflTransGen.trans hx
      (Relation.ReflTransGen.single (Or.inl rfl : Step f x (f x)))
  have hdisj : ∀ s ∈ S, ∀ t ∈ S, s ≠ t → s ∩ t = ∅ := by
    intro s hs t ht hne'
    obtain ⟨x, _, rfl⟩ := Finset.mem_image.mp hs
    obtain ⟨y, _, rfl⟩ := Finset.mem_image.mp ht
    apply Set.eq_empty_iff_forall_notMem.mpr
    intro z hzs
    obtain ⟨hzs, hzt⟩ := hzs
    apply hne'
    exact reachableClass_eq_of_reach (hzs.trans (reachable_symm hzt))
  have hcover : ∀ x : X, ∃ s ∈ S, x ∈ s := by
    intro x
    exact ⟨reachableClass f x, Finset.mem_image.mpr ⟨x, Finset.mem_univ x, rfl⟩,
      Relation.ReflTransGen.refl⟩
  have hconn : ∀ s ∈ S, ∀ x ∈ s, ∀ y ∈ s, Relation.ReflTransGen (Step f) x y := by
    intro s hs x hx y hy
    obtain ⟨x₀, _, rfl⟩ := Finset.mem_image.mp hs
    exact (reachable_symm hx).trans hy
  have himg : ∀ s : Set X, s ∈ S ↔ ∃ x : X, s = reachableClass f x := by

exec
/usr/local/bin/zsh -lc "sed -n '561,840p' lean/Cmrps/Vol01Foundations.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
    intro s
    constructor
    · intro hs
      obtain ⟨x, _, heq⟩ := Finset.mem_image.mp hs
      exact ⟨x, heq.symm⟩
    · rintro ⟨x, rfl⟩
      exact Finset.mem_image.mpr ⟨x, Finset.mem_univ x, rfl⟩
  exact ⟨⟨S, hne, hinv, hdisj, hcover, hconn⟩, himg⟩

/-! ## Example 7.5 — irreducibles under product composition -/

/-- Definition 3.12 with product composition (Example 7.5): the neutral record
is the one-point record, the empty product, and a record is irreducible when
it is not the unit and is not a product of two non-unit state spaces. Up to
isomorphism only the cardinality matters. -/
def IsIrreducibleProduct (X : Type) [Fintype X] : Prop :=
  Fintype.card X ≠ 1 ∧ ¬ ∃ a b : ℕ, a ≠ 1 ∧ b ≠ 1 ∧ Fintype.card X = a * b

/-- Example 7.5 (target `vol01.product.irreducible_iff_prime_card`): under the
product rule the irreducible finite classical records are exactly those of
prime cardinality. -/
theorem irreducibleProduct_iff_prime_card {X : Type} [Fintype X] :
    IsIrreducibleProduct X ↔ Nat.Prime (Fintype.card X) := by
  constructor
  · rintro ⟨hne, hs⟩
    have h0 : Fintype.card X ≠ 0 := by
      intro h0
      exact hs ⟨0, 0, by decide, by decide, by rw [h0]⟩
    have h2 : 2 ≤ Fintype.card X := by omega
    refine (Nat.prime_def_lt').2 ⟨h2, ?_⟩
    intro m hm2 hmlt hdvd
    obtain ⟨k, hk⟩ := hdvd
    have hk1 : k ≠ 1 := by
      rintro rfl
      rw [mul_one] at hk
      omega
    exact hs ⟨m, k, by omega, hk1, hk⟩
  · intro hp
    refine ⟨?_, ?_⟩
    · intro h1
      have := hp.two_le
      omega
    · rintro ⟨a, b, ha, hb, hab⟩
      have hdvd : a ∣ Fintype.card X := ⟨b, hab⟩
      rcases hp.eq_one_or_self_of_dvd a hdvd with h | h
      · exact ha h
      · rw [h] at hab
        have h1 : (1 : ℕ) = b := Nat.mul_left_cancel
          (Nat.pos_of_ne_zero hp.ne_zero) (by rw [← hab, mul_one])
        exact hb h1.symm

/-- Example 7.5: every nonzero-cardinality finite classical record is a
product of prime-cardinality records; the factor list is the prime
factorisation of the cardinality. -/
theorem prime_factorization {X : Type} [Fintype X] (h : Fintype.card X ≠ 0) :
    List.prod (Fintype.card X).primeFactorsList = Fintype.card X ∧
      ∀ p ∈ (Fintype.card X).primeFactorsList, Nat.Prime p :=
  ⟨Nat.prod_primeFactorsList h, fun _ hp => Nat.prime_of_mem_primeFactorsList hp⟩

/-- Example 7.5: the decomposition into prime-cardinality records is unique up
to order, by the fundamental theorem of arithmetic. -/
theorem prime_factorization_unique {n : ℕ} {l : List ℕ}
    (hprod : List.prod l = n) (hprime : ∀ p ∈ l, Nat.Prime p) :
    List.Perm l n.primeFactorsList :=
  Nat.primeFactorsList_unique hprod hprime

/-! ## Proposition 7.6 — factorisation is extra data -/

/-- A coefficient matrix of a pure two-qubit state (Definition 3.8): the entry
`M i j` is the coefficient of `eᵢ ⊗ eⱼ` in a chosen factorisation of the bare
four-dimensional space. -/
abbrev CoeffMat := Matrix (Fin 2) (Fin 2) ℂ

/-- The diagonal entries of the reduced density matrix `M ⬝ M†` of a pure
two-qubit state with coefficient matrix `M`: the squared norms of the rows. -/
noncomputable def reducedDiag (M : CoeffMat) : Fin 2 → ℝ := fun i => ∑ j, ‖M i j‖ ^ 2

/-- The off-diagonal entry `ρ₀₁` of the reduced density matrix `M ⬝ M†`; the
reduced matrix is diagonal exactly when this vanishes. -/
noncomputable def reducedOffDiag (M : CoeffMat) : ℂ := ∑ j, M 0 j * star (M 1 j)

/-- A pure two-qubit state is a unit vector of the bare space. -/
def IsUnitState (M : CoeffMat) : Prop := (∑ i, ∑ j, ‖M i j‖ ^ 2) = 1

/-- Entanglement entropy of a pure two-qubit state whose reduced density
matrix is diagonal in the computational basis: the von Neumann entropy of the
reduced state is the entropy of the distribution of its diagonal entries (the
squared row norms computed by `reducedDiag`). Both witnesses of
Proposition 7.6 have diagonal reduced density matrix. -/
noncomputable def entanglementEntropy (M : CoeffMat) : ℝ :=
  -(reducedDiag M 0 * Real.log (reducedDiag M 0) +
    reducedDiag M 1 * Real.log (reducedDiag M 1))

/-- The change of factorisation `W` of Proposition 7.6: the Hadamard rotation
on the span of the diagonal coefficient matrices `e₁ ⊗ e₁`, `e₂ ⊗ e₂`,
extended by the identity on the off-diagonal ones. It is an involution, hence
invertible, so it relates two legitimate factorisation structures on the same
bare Hilbert space. -/
noncomputable def changeFactorization (M : CoeffMat) : CoeffMat := fun i j =>
  if i = j then
    if i = 0 then (M 0 0 + M 1 1) / ((Real.sqrt 2 : ℝ) : ℂ)
    else (M 0 0 - M 1 1) / ((Real.sqrt 2 : ℝ) : ℂ)
  else M i j

/-- The fixed unit vector `ψ = e₁ ⊗ e₁` of Proposition 7.6 in the coordinates
of the first factorisation. -/
def psiFirst : CoeffMat := fun i j => if i = 0 ∧ j = 0 then 1 else 0

/-- The coordinate matrix of the same bare vector `ψ` in the second
factorisation: `(e₁ ⊗ e₁ + e₂ ⊗ e₂)/√2`. -/
noncomputable def psiSecond : CoeffMat := fun i j =>
  if i = j then (1 : ℂ) / ((Real.sqrt 2 : ℝ) : ℂ) else 0

private theorem sq_sqrt_two : ((Real.sqrt 2 : ℝ) : ℂ) * ((Real.sqrt 2 : ℝ) : ℂ) = 2 := by
  rw [← Complex.ofReal_mul, Real.mul_self_sqrt (by norm_num : (0:ℝ) ≤ 2)]
  norm_num

private theorem norm_psiSecond (i j : Fin 2) :
    ‖psiSecond i j‖ ^ 2 = if i = j then (1 / 2 : ℝ) else 0 := by
  by_cases h : i = j
  · subst h
    have hrw : (if i = i then (1 / 2 : ℝ) else 0) = 1 / 2 := by simp
    rw [hrw]
    have hval : psiSecond i i = (1 : ℂ) / ((Real.sqrt 2 : ℝ) : ℂ) := by simp [psiSecond]
    rw [hval]
    have hnorm : ‖((1 : ℂ) / ((Real.sqrt 2 : ℝ) : ℂ))‖ = (1 / Real.sqrt 2 : ℝ) := by
      rw [norm_div, Complex.norm_real, Real.norm_eq_abs,
        abs_of_nonneg (Real.sqrt_nonneg 2), norm_one]
    rw [hnorm]
    have h2 : (Real.sqrt 2) ^ 2 = 2 := Real.sq_sqrt (by norm_num)
    rw [div_pow, one_pow, h2]
  · simp [psiSecond, h]

/-- The Hadamard block is an involution. -/
private theorem hadamard_involutive (a b : ℂ) :
    ((a + b) / ((Real.sqrt 2 : ℝ) : ℂ) + (a - b) / ((Real.sqrt 2 : ℝ) : ℂ)) /
        ((Real.sqrt 2 : ℝ) : ℂ) = a ∧
      ((a + b) / ((Real.sqrt 2 : ℝ) : ℂ) - (a - b) / ((Real.sqrt 2 : ℝ) : ℂ)) /
        ((Real.sqrt 2 : ℝ) : ℂ) = b := by
  have h2 : ((Real.sqrt 2 : ℝ) : ℂ) ^ 2 = 2 := by
    rw [← sq_sqrt_two]
    ring
  constructor <;> (field_simp [h2]; rw [h2]; ring)

/-- The change of factorisation is invertible: it is an involution. -/
theorem changeFactorization_involutive (M : CoeffMat) :
    changeFactorization (changeFactorization M) = M := by
  apply Matrix.ext
  intro i j
  fin_cases i <;> fin_cases j
  · simp [changeFactorization]
    exact (hadamard_involutive (M 0 0) (M 1 1)).1
  · simp [changeFactorization]
  · simp [changeFactorization]
  · simp [changeFactorization]
    exact (hadamard_involutive (M 0 0) (M 1 1)).2

/-- The two factorisation presentations of the fixed vector `ψ` of
Proposition 7.6: the first coordinates are `e₁ ⊗ e₁`, the second are
`(e₁ ⊗ e₁ + e₂ ⊗ e₂)/√2`, related by the change of factorisation `W`. -/
theorem changeFactorization_psi : changeFactorization psiFirst = psiSecond := by
  funext i j
  fin_cases i <;> fin_cases j <;> simp [changeFactorization, psiFirst, psiSecond]

/-- The first presentation of `ψ` has reduced density matrix `diag(1, 0)`. -/
theorem reducedDiag_first :
    reducedDiag psiFirst 0 = 1 ∧ reducedDiag psiFirst 1 = 0 ∧
      reducedOffDiag psiFirst = 0 := by
  have hnorm : ∀ i j : Fin 2,
      ‖psiFirst i j‖ ^ 2 = if i = 0 ∧ j = 0 then (1 : ℝ) else 0 := by
    intro i j
    by_cases h : i = 0 ∧ j = 0
    · have hij : psiFirst i j = 1 := by simp [psiFirst, h]
      rw [hij]
      simp [h]
    · have hij : psiFirst i j = 0 := by simp [psiFirst, h]
      rw [hij]
      simp [h]
  refine ⟨?_, ?_, ?_⟩
  · have h := hnorm 0 0
    have h' := hnorm 0 1
    simp [reducedDiag, Fin.sum_univ_two, h, h']
  · have h := hnorm 1 0
    have h' := hnorm 1 1
    simp [reducedDiag, Fin.sum_univ_two, h, h']
  · simp [reducedOffDiag, psiFirst]

/-- The second presentation of `ψ` has reduced density matrix
`diag(1/2, 1/2)`. -/
theorem reducedDiag_second :
    reducedDiag psiSecond 0 = 1 / 2 ∧ reducedDiag psiSecond 1 = 1 / 2 ∧
      reducedOffDiag psiSecond = 0 := by
  refine ⟨?_, ?_, ?_⟩
  · have h := norm_psiSecond 0 0
    have h' := norm_psiSecond 0 1
    simp [reducedDiag, Fin.sum_univ_two, h, h']
  · have h := norm_psiSecond 1 0
    have h' := norm_psiSecond 1 1
    simp [reducedDiag, Fin.sum_univ_two, h, h']
  · simp [reducedOffDiag, psiSecond]

/-- Both presentations of `ψ` are unit vectors. -/
theorem isUnitState_psi : IsUnitState psiFirst ∧ IsUnitState psiSecond := by
  have hnorm : ∀ i j : Fin 2,
      ‖psiFirst i j‖ ^ 2 = if i = 0 ∧ j = 0 then (1 : ℝ) else 0 := by
    intro i j
    by_cases h : i = 0 ∧ j = 0
    · have hij : psiFirst i j = 1 := by simp [psiFirst, h]
      rw [hij]
      simp [h]
    · have hij : psiFirst i j = 0 := by simp [psiFirst, h]
      rw [hij]
      simp [h]
  refine ⟨?_, ?_⟩
  · show (∑ i, ∑ j, ‖psiFirst i j‖ ^ 2) = 1
    have a00 := hnorm 0 0
    have a01 := hnorm 0 1
    have a10 := hnorm 1 0
    have a11 := hnorm 1 1
    simp [Fin.sum_univ_two, a00, a01, a10, a11]
  · show (∑ i, ∑ j, ‖psiSecond i j‖ ^ 2) = 1
    have a00 := norm_psiSecond 0 0
    have a01 := norm_psiSecond 0 1
    have a10 := norm_psiSecond 1 0
    have a11 := norm_psiSecond 1 1
    simp [Fin.sum_univ_two, a00, a01, a10, a11]
    norm_num

/-- Proposition 7.6 (target `vol01.qubit.factorization_nonunique`): the fixed
unit vector `ψ` has entanglement entropy `0` in the first factorisation and
`log 2` in the second. The bare record does not determine the decomposition of
the state space into factors. -/
theorem factorization_nonunique :
    IsUnitState psiFirst ∧ IsUnitState psiSecond ∧
      changeFactorization (changeFactorization psiFirst) = psiFirst ∧
      changeFactorization psiFirst = psiSecond ∧
      entanglementEntropy psiFirst = 0 ∧
      entanglementEntropy psiSecond = Real.log 2 := by
  refine ⟨isUnitState_psi.1, isUnitState_psi.2,
    changeFactorization_involutive psiFirst, changeFactorization_psi, ?_, ?_⟩
  · rw [entanglementEntropy, reducedDiag_first.1, reducedDiag_first.2.1]
    simp
  · rw [entanglementEntropy, reducedDiag_second.1, reducedDiag_second.2.1]
    have h12 : ((1 / 2 : ℝ)) = (2 : ℝ)⁻¹ := by ring
    rw [h12, Real.log_inv]
    ring

end Cmrps.Vol01

exec
/usr/local/bin/zsh -lc "sed -n '1,280p' lean/Cmrps/Vol02StructuralFamilies.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
/-
Copyright (c) 2026 CMRPS formalization. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: CMRPS module writer
-/

import Mathlib.Tactic
import Mathlib.Data.Quot
import Mathlib.Basic.Countable.Defs
import Mathlib.Logic.Equiv.Set
import Mathlib.SetTheory.Cardinal.Finite
import Mathlib.Data.Fintype.OfMap
import Mathlib.Data.Multiset.Bind
import Mathlib.Data.Multiset.Count
import Mathlib.Algebra.BigOperators.Group.Multiset.Basic
import Mathlib.Algebra.BigOperators.Ring.Multiset
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Matrix.Diagonal
import Mathlib.LinearAlgebra.Matrix.ConjTranspose
import Mathlib.Topology.Constructions
import Mathlib.Topology.Continuous
import Mathlib.Topology.Algebra.MulAction

/-!
# Fundamental structural families of mathematical physics

Formalization targets from `papers/latex/vol-02-structural-families.tex`
(Vol. 2: Fundamental Structural Families). Claim labels mirror
`verification/vol-02-structural-families-lean-targets.md`:

1. `sharpness_criterion`   — paper Theorem 3.2 (parts a, b, d; part c is set-theoretic only,
   constructibility is Chevalley's theorem and is recorded as a conjectural input)
2. `globality_symplectic`  — paper Proposition 3.4 (constancy consequence, Darboux as input)
3. `achievement_kinds_exhaustive` — paper Proposition 3.7
4. `dim_vector_classification`    — paper Theorem 7.1 (finiteness at fixed dimension;
   the Wedderburn structure theorem is a literature input)
5. `induced_dimension_vector`     — paper Proposition 4.2 (dimension-vector combinatorics;
   `M_a(ℂ) ⊗ M_b(ℂ) ≅ M_{ab}(ℂ)` is the load-bearing input)
6. `kraus_rank_not_injective`     — paper Proposition 11.2
7. `cotangent_retract`            — paper Proposition 4.1 (the homotopy `r_t`)
8. `exceptional_not_closed`       — paper Proposition 15.1
9. `invariants_not_independence`  — paper Proposition 16.2 (schema; Gelfand input)
10. `comparability_of_records`    — paper Proposition 18.1
-/

namespace Cmrps.Vol02

universe u v w

/-! ## Family records (paper Definitions 2.1–2.2) -/

/-- Paper Definition 2.1: a family record is a triple `(F, V, I)` with `F` the family of
objects, `V` the invariant range, `I` the invariant map, constant on `≃`-classes. -/
structure FamilyRecord where
  /-- Objects of the family. -/
  Obj : Type u
  /-- The invariant range. -/
  V : Type v
  /-- The physical equivalence relation on objects (paper relation `≃`). -/
  r : Obj → Obj → Prop
  /-- Physical equivalence is an equivalence relation. -/
  rEquiv : Equivalence r
  /-- The invariant map. -/
  I : Obj → V
  /-- The invariant is constant on `≃`-classes. -/
  constOnClasses : ∀ a b, r a b → I a = I b

namespace FamilyRecord

/-- Paper Definition 2.1: the invariant is *classifying* (complete) when
`I(P) = I(Q)` implies `P ≃ Q`. -/
def Classifying (R : FamilyRecord) : Prop := ∀ a b : R.Obj, R.I a = R.I b → R.r a b

/-- Paper Definition 2.2: a record is invariant-complete when its invariant is classifying. -/
def InvariantComplete (R : FamilyRecord) : Prop := R.Classifying

/-- The setoid induced by the physical equivalence. -/
def toSetoid (R : FamilyRecord) : Setoid R.Obj := ⟨R.r, R.rEquiv⟩

/-- Paper Theorem 3.2(1): the assignment `[P] ↦ I(P)` on `≃`-classes. -/
def inducedMap (R : FamilyRecord) : Quotient R.toSetoid → R.V :=
  Quotient.lift R.I (fun _ _ h => R.constOnClasses _ _ h)

@[simp]
theorem inducedMap_mk (R : FamilyRecord) (a : R.Obj) :
    R.inducedMap (Quotient.mk R.toSetoid a) = R.I a := rfl

/-- Paper Theorem 3.2(1): the induced map is well defined (the invariant is constant
on classes), restated as an equality of invariants on equivalent objects. -/
theorem sharpness_well_defined (R : FamilyRecord) {a b : R.Obj} (h : R.r a b) :
    R.I a = R.I b :=
  R.constOnClasses a b h

/-- Paper Theorem 3.2(1): for an invariant-complete record the induced map on classes
is injective. -/
theorem inducedMap_injective (R : FamilyRecord) (h : R.Classifying) :
    Function.Injective R.inducedMap := by
  intro q₁ q₂ he
  revert he
  refine Quotient.inductionOn₂ q₁ q₂ ?_
  intro a b he
  have heq : R.I a = R.I b := he
  exact Quotient.sound (h a b heq)

/-- Paper Theorem 3.2(1): completeness is exactly the statement that `I` separates
classes, i.e. the induced map on classes is injective. -/
theorem classifying_iff (R : FamilyRecord) :
    R.Classifying ↔ Function.Injective R.inducedMap :=
  ⟨R.inducedMap_injective, fun hinj a b he => by
    have hq := hinj (show R.inducedMap (Quotient.mk R.toSetoid a)
        = R.inducedMap (Quotient.mk R.toSetoid b) from he)
    exact Quotient.exact hq⟩

/-- Paper Theorem 3.2(2): if the range is finite with `|V| = N`, then the number of
`≃`-classes is at most `N`. -/
theorem sharpness_card_bound (R : FamilyRecord) (h : R.Classifying) [Fintype R.V] {N : ℕ}
    (hN : Fintype.card R.V = N) : Nat.card (Quotient R.toSetoid) ≤ N := by
  have hle : Nat.card (Quotient R.toSetoid) ≤ Nat.card R.V :=
    Nat.card_le_card_of_injective R.inducedMap (R.inducedMap_injective h)
  have hV : Nat.card R.V = N := by
    rw [Nat.card_eq_fintype_card]
    exact hN
  rw [hV] at hle
  exact hle

/-- Paper Theorem 3.2(3), set-theoretic content: the classes inject into any subset of
the range containing the attained values of `I` (e.g. the `k`-points of the image of a
finite-type morphism). Constructibility of that image is Chevalley's theorem and is not
formalized here; see `verification/vol-02-structural-families-conjectures.md`. -/
theorem sharpness_injects_into_superset (R : FamilyRecord) (h : R.Classifying)
    (s : Set R.V) (hs : Set.range R.I ⊆ s) :
    ∃ f : Quotient R.toSetoid → ↥s, Function.Injective f := by
  refine ⟨fun q => ⟨R.inducedMap q, ?_⟩, ?_⟩
  · have hq : R.inducedMap q = R.I (Quotient.out q) := by
      conv_lhs => rw [← Quotient.out_eq q]
      rfl
    rw [hq]
    exact hs ⟨Quotient.out q, rfl⟩
  · intro q₁ q₂ he
    exact R.inducedMap_injective h (Subtype.ext_iff.mp he)

/-- Paper Theorem 3.2(4): if the class set is uncountable, no invariant-complete record
for the family has countable range. -/
theorem sharpness_uncountable (R : FamilyRecord) (h : R.Classifying)
    (hU : Uncountable (Quotient R.toSetoid)) : ¬ Countable R.V := by
  intro hc
  haveI := hc
  exact hU.not_countable (Function.Injective.countable (R.inducedMap_injective h))

end FamilyRecord

/-! ## Globality in the symplectic family (paper Proposition 3.4) -/

/-- Symplectic germs of a fixed dimension `2n` with `n ≥ 1`, with symplectomorphism of
germs as the equivalence. Darboux's theorem is recorded as an input field. -/
structure SymplecticGermField where
  /-- The type of symplectic germs of dimension `2n`. -/
  Germ : Type u
  /-- Symplectomorphism of germs. -/
  SympEq : Germ → Germ → Prop
  /-- Symplectomorphism is an equivalence relation. -/
  sympEq_equiv : Equivalence SympEq
  /-- Darboux's theorem (literature input): every `2n`-dimensional symplectic germ is
  symplectomorphic to the standard germ. -/
  darboux : ∀ g h : Germ, SympEq g h

/-- A germ invariant: a map on germs invariant under symplectomorphism of germs. -/
def GermInvariant {G : SymplecticGermField} {A : Type v} (f : G.Germ → A) : Prop :=
  ∀ g h : G.Germ, G.SympEq g h → f g = f h

/-- Paper Proposition 3.4: every germ invariant is constant at every point. The
hypothesis `n ≥ 1` is carried by `Darboux` holding on the germ type. -/
theorem globality_symplectic {G : SymplecticGermField} {A : Type v} {f : G.Germ → A}
    (hf : GermInvariant f) : ∀ g h : G.Germ, f g = f h :=
  fun g h => hf g h (G.darboux g h)

/-- Paper Proposition 3.4 consequence: a germ invariant taking the same value on all
germs cannot separate two non-equivalent objects, hence cannot be classifying. -/
theorem globality_no_local_classifier {G : SymplecticGermField} {A : Type v}
    {f : G.Germ → A} (hf : GermInvariant f) (g h : G.Germ) : f g = f h :=
  globality_symplectic hf g h

/-! ## Achievement kinds (paper Definition 3.6, Proposition 3.7) -/

/-- Paper Definition 3.6: the five achievement kinds of a classified sector. -/
inductive AchievementKind where
  /-- Complete and parameterized. -/
  | completeAndParameterized : AchievementKind
  /-- Complete and unparameterized. -/
  | completeAndUnparameterized : AchievementKind
  /-- Complete as an obstruction classification. -/
  | completeAsObstruction : AchievementKind
  /-- Impossible: an impossibility theorem is on record. -/
  | impossible : AchievementKind
  /-- No record: no classification and no impossibility theorem on record. -/
  | noRecord : AchievementKind

/-- Paper Definition 3.6: a sector together with the three ordered conditions
(record exists, impossibility theorem exists, obstructions classified,
attained values parameterized). -/
structure Sector where
  /-- A theorem on record names a classifying invariant. -/
  hasClassifyingRecord : Bool
  /-- An impossibility theorem is on record. -/
  hasImpossibilityTheorem : Bool
  /-- The recorded classification classifies obstructions rather than objects. -/
  classifiesObstructions : Bool
  /-- The attained values of the invariant form an explicitly described subset
  of a structured range (only meaningful when a record names objects). -/
  parameterizedValues : Bool

/-- Paper Definition 3.6: the kind determined by the ordered tests of the sector. -/
def kindOf : Sector → AchievementKind
  | ⟨false, false, _, _⟩ => AchievementKind.noRecord
  | ⟨_, true, _, _⟩ => AchievementKind.impossible
  | ⟨true, false, true, _⟩ => AchievementKind.completeAsObstruction
  | ⟨true, false, false, true⟩ => AchievementKind.completeAndParameterized
  | ⟨true, false, false, false⟩ => AchievementKind.completeAndUnparameterized

/-- Paper Definition 3.6: the conditions under which a kind applies to a sector. -/
def KindApplies : AchievementKind → Sector → Prop
  | .completeAndParameterized, s =>
      s.hasClassifyingRecord = true ∧ s.hasImpossibilityTheorem = false ∧
        s.classifiesObstructions = false ∧ s.parameterizedValues = true
  | .completeAndUnparameterized, s =>
      s.hasClassifyingRecord = true ∧ s.hasImpossibilityTheorem = false ∧
        s.classifiesObstructions = false ∧ s.parameterizedValues = false
  | .completeAsObstruction, s =>
      s.hasClassifyingRecord = true ∧ s.hasImpossibilityTheorem = false ∧
        s.classifiesObstructions = true
  | .impossible, s =>
      s.hasImpossibilityTheorem = true
  | .noRecord, s =>
      s.hasClassifyingRecord = false ∧ s.hasImpossibilityTheorem = false

/-- Paper Proposition 3.7: the kind assigned by the ordered tests applies. -/
theorem kindOf_applies (s : Sector) : KindApplies (kindOf s) s := by
  rcases s with ⟨a, b, c, d⟩
  cases a <;> cases b <;> cases c <;> cases d <;> simp [KindApplies, kindOf]

/-- Paper Proposition 3.7: the kind assigned by the ordered tests is the only one
that applies. -/
theorem kindOf_unique (s : Sector) (k : AchievementKind) (hk : KindApplies k s) :
    k = kindOf s := by
  rcases s with ⟨a, b, c, d⟩
  cases a <;> cases b <;> cases c <;> cases d <;> cases k <;>
    simp [KindApplies, kindOf] at hk ⊢

/-- Paper Proposition 3.7: exactly one of the five achievement kinds applies to any
sector; the five are pairwise exclusive and exhaustive. -/
theorem achievement_kinds_exhaustive (s : Sector) :
    ∃! k : AchievementKind, KindApplies k s :=
  ⟨kindOf s, kindOf_applies s, fun _ hk => kindOf_unique s _ hk⟩

/-! ## Dimension vectors (paper Theorem 7.1, Proposition 4.2) -/

/-- Paper Theorem 7.1: a dimension vector is a finite multiset of positive integers
(the matrix block sizes of a unital finite-dimensional complex C*-algebra). -/
abbrev DimensionVector := Multiset ℕ

namespace DimensionVector

/-- Paper Theorem 7.1: dimension vectors have positive entries. -/
def Pos (v : DimensionVector) : Prop := ∀ n ∈ v, 0 < n

/-- Paper Theorem 7.1: the total complex dimension `d = Σᵢ nᵢ²`. -/
def totalDim (v : DimensionVector) : ℕ := (v.map (· ^ 2)).sum

/-- Paper Proposition 4.2: the dimension vector of a direct sum is the multiset union. -/
def sum (v w : DimensionVector) : DimensionVector := v + w

/-- Paper Proposition 4.2: the dimension vector of a tensor product is the multiset of
pairwise products `{nᵢ mⱼ}`. Written with the multiset product notation `×ˢ`
(`Multiset.product`). -/
def tensor (v w : DimensionVector) : DimensionVector :=
  (v ×ˢ w).map fun p => p.1 * p.2

theorem pos_sum {v w : DimensionVector} (hv : v.Pos) (hw : w.Pos) : (sum v w).Pos :=
  fun n hn => by
    rcases Multiset.mem_add.1 hn with h | h

exec
/usr/local/bin/zsh -lc "sed -n '281,560p' lean/Cmrps/Vol02StructuralFamilies.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
    · exact hv n h
    · exact hw n h

/-- Membership in a multiset product. -/
private theorem mem_product {v w : Multiset ℕ} {p : ℕ × ℕ} :
    p ∈ (v ×ˢ w) ↔ p.1 ∈ v ∧ p.2 ∈ w := by
  have h : v ×ˢ w = v.bind fun a => w.map (Prod.mk a) := rfl
  rw [h, Multiset.mem_bind]
  constructor
  · rintro ⟨a, ha, hp⟩
    rcases Multiset.mem_map.1 hp with ⟨b, hb, heq⟩
    have : p = (a, b) := heq.symm
    subst this
    exact ⟨ha, hb⟩
  · rintro ⟨h1, h2⟩
    exact ⟨p.1, h1, Multiset.mem_map.2 ⟨p.2, h2, rfl⟩⟩

theorem pos_tensor {v w : DimensionVector} (hv : v.Pos) (hw : w.Pos) :
    (tensor v w).Pos := by
  intro n hn
  rcases Multiset.mem_map.1 hn with ⟨p, hp, rfl⟩
  rcases mem_product.1 hp with ⟨h₁, h₂⟩
  exact Nat.mul_pos (hv p.1 h₁) (hw p.2 h₂)

theorem totalDim_sum (v w : DimensionVector) :
    totalDim (sum v w) = totalDim v + totalDim w := by
  simp [totalDim, sum, Multiset.map_add, Multiset.sum_add]

/-- Helper for `totalDim_tensor`: summing `f p.1 * g p.2` over a product multiset
factors as a product of sums. -/
private lemma sum_product_map (v w : Multiset ℕ) (f g : ℕ → ℕ) :
    ((v ×ˢ w).map fun p => f p.1 * g p.2).sum = (v.map f).sum * (w.map g).sum := by
  refine Multiset.induction_on v ?_ ?_
  · simp [Multiset.zero_product]
  · intro a v ih
    rw [Multiset.cons_product, Multiset.map_add, Multiset.sum_add, Multiset.map_map, ih,
      Multiset.map_cons, Multiset.sum_cons, add_mul]
    congr 1
    show (w.map fun b => f a * g b).sum = f a * (w.map g).sum
    exact Multiset.sum_map_mul_left

theorem totalDim_tensor (v w : DimensionVector) :
    totalDim (tensor v w) = totalDim v * totalDim w := by
  show (((v ×ˢ w).map fun p => p.1 * p.2).map (· ^ 2)).sum
    = (v.map (· ^ 2)).sum * (w.map (· ^ 2)).sum
  rw [Multiset.map_map]
  have h1 : (v ×ˢ w).map ((· ^ 2) ∘ fun p : ℕ × ℕ => p.1 * p.2)
      = (v ×ˢ w).map fun p => p.1 ^ 2 * p.2 ^ 2 :=
    congrArg (Multiset.map · (v ×ˢ w)) (funext fun p => mul_pow p.1 p.2 2)
  rw [h1]
  exact sum_product_map v w (· ^ 2) (· ^ 2)

/-! ### Finiteness at fixed total dimension (paper Theorem 7.1) -/

private lemma sq_le_sum_map (v : Multiset ℕ) : ∀ n ∈ v, n ^ 2 ≤ (v.map (· ^ 2)).sum := by
  refine Multiset.induction_on v ?_ ?_
  · intro n hn
    exact absurd hn (by simp)
  · intro a v ih n hn
    rw [Multiset.map_cons, Multiset.sum_cons]
    rcases Multiset.mem_cons.1 hn with h | h
    · subst h
      exact Nat.le_add_right _ _
    · exact (ih n h).trans (Nat.le_add_left _ _)

private lemma le_totalDim_of_mem {v : DimensionVector} (hp : v.Pos) {n : ℕ}
    (hmem : n ∈ v) : n ≤ v.totalDim := by
  have hn : n ≤ n ^ 2 := by
    have h1 : 1 ≤ n := hp n hmem
    simpa [pow_two] using Nat.mul_le_mul_right n h1
  have h2 : n ^ 2 ≤ (v.map (· ^ 2)).sum := sq_le_sum_map v n hmem
  exact hn.trans (by simpa [totalDim] using h2)

private lemma card_le_totalDim : ∀ {v : DimensionVector}, v.Pos → v.card ≤ v.totalDim := by
  intro v
  refine Multiset.induction_on v ?_ ?_
  · intro hp
    simp [totalDim]
  · intro a v ih hp
    have h1 : 1 ≤ a := hp a (Multiset.mem_cons_self a v)
    have ha : (1 : ℕ) ≤ a ^ 2 := by
      simpa [pow_two] using Nat.mul_le_mul h1 h1
    have hpv : Pos v := fun n hn => hp n (Multiset.mem_cons.2 (Or.inr hn))
    have ih' := ih hpv
    rw [totalDim] at ih'
    rw [totalDim, Multiset.card_cons, Multiset.map_cons, Multiset.sum_cons]
    omega

/-- Multiplicity encoding of a dimension vector: entry `i` counts the block size `i.val + 1`. -/
private def encode (d : ℕ) (v : DimensionVector) (hv : v.Pos ∧ v.totalDim = d) :
    Fin d → Fin (d + 1) :=
  fun i => ⟨v.count (i.val + 1), by
    have h1 : v.count (i.val + 1) ≤ v.card := Multiset.count_le_card _ _
    have h2 : v.card ≤ d := by
      have := card_le_totalDim hv.1
      omega
    omega⟩

private lemma encode_injective (d : ℕ) (v w : DimensionVector)
    (hv : v.Pos ∧ v.totalDim = d) (hw : w.Pos ∧ w.totalDim = d)
    (he : encode d v hv = encode d w hw) : v = w := by
  apply Multiset.ext'
  intro a
  have hvb : ∀ n ∈ v, n ≤ d := fun n hn => by
    have := le_totalDim_of_mem hv.1 hn
    omega
  have hwb : ∀ n ∈ w, n ≤ d := fun n hn => by
    have := le_totalDim_of_mem hw.1 hn
    omega
  by_cases ha : a = 0
  · subst ha
    have h1 : (0 : ℕ) ∉ v := fun h => absurd (hv.1 0 h) (by omega)
    have h2 : (0 : ℕ) ∉ w := fun h => absurd (hw.1 0 h) (by omega)
    rw [Multiset.count_eq_zero_of_notMem h1, Multiset.count_eq_zero_of_notMem h2]
  by_cases hbound : d < a
  · have h1 : a ∉ v := fun h => absurd (hvb a h) (by omega)
    have h2 : a ∉ w := fun h => absurd (hwb a h) (by omega)
    rw [Multiset.count_eq_zero_of_notMem h1, Multiset.count_eq_zero_of_notMem h2]
  have hpos : 0 < a := Nat.pos_of_ne_zero ha
  have hle : a ≤ d := by omega
  have hi : a - 1 < d := by omega
  have hmod : (a - 1 : ℕ) + 1 = a := by omega
  have heq := congrFun he ⟨a - 1, hi⟩
  have hcount : v.count ((⟨a - 1, hi⟩ : Fin d).val + 1)
      = w.count ((⟨a - 1, hi⟩ : Fin d).val + 1) :=
    congrArg (fun x : Fin (d + 1) => x.val) heq
  simpa [hmod] using hcount

/-- Paper Theorem 7.1: at fixed total complex dimension `d` the number of dimension
vectors is finite. -/
theorem dimVector_finite (d : ℕ) :
    Set.Finite {v : DimensionVector | v.Pos ∧ v.totalDim = d} := by
  let s : Set DimensionVector := {v | v.Pos ∧ v.totalDim = d}
  have hinj : Function.Injective (fun v : ↥s => encode d v.1 v.2) := by
    rintro ⟨v, hv⟩ ⟨w, hw⟩ he
    simp only [Subtype.mk.injEq]
    exact encode_injective d v w hv hw he
  haveI : Fintype ↥s := Fintype.ofInjective _ hinj
  exact Set.toFinite s

end DimensionVector

/-! ## Kraus rank is not injective (paper Proposition 11.2) -/

/-- The algebra of `2 × 2` complex matrices. -/
abbrev Kraus.M := Matrix (Fin 2) (Fin 2) ℂ

namespace Kraus

open scoped Matrix

/-- Paper Proposition 11.2: the unitary channel `Φ_U(X) = U X U*`. -/
def φ (U : M) (X : M) : M := U * X * U ᴴ

/-- Paper Proposition 11.2: the equivalence relation in force on channels is equality
of completely positive maps. -/
def SameChannel (Φ Ψ : M → M) : Prop := ∀ X : M, Φ X = Ψ X

theorem sameChannel_iff (Φ Ψ : M → M) : SameChannel Φ Ψ ↔ Φ = Ψ :=
  ⟨fun h => funext h, fun h _ => by rw [h]⟩

/-- Unitary matrices in `M₂(ℂ)`. -/
def IsUnitary (U : M) : Prop := U * U ᴴ = 1 ∧ U ᴴ * U = 1

/-- A Kraus representation of `Φ` with `n` operators. -/
def KrausRep (Φ : M → M) (ops : List M) : Prop :=
  ∀ X : M, Φ X = (ops.map (fun A => A * X * A ᴴ)).sum

/-- Paper Proposition 11.2: Kraus rank is the length of a minimal Kraus representation. -/
def IsKrausRank (n : ℕ) (Φ : M → M) : Prop :=
  (∃ ops, ops.length = n ∧ KrausRep Φ ops) ∧
    ∀ m < n, ∀ ops, ops.length = m → ¬ KrausRep Φ ops

theorem kraus_rep_one (U : M) : KrausRep (φ U) [U] := by
  intro X
  show U * X * U ᴴ = ([U].map fun A => A * X * A ᴴ).sum
  rw [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, add_zero]

theorem not_kraus_rep_zero (U : M) (hU : IsUnitary U) : ¬ KrausRep (φ U) [] := by
  intro h
  have h1 : (φ U) 1 = 0 := by
    have := h 1
    simpa [List.map_nil, List.sum_nil] using this
  have h2 : (φ U) 1 = 1 := by
    show U * 1 * U ᴴ = 1
    rw [mul_one, hU.1]
  rw [h2] at h1
  exact one_ne_zero h1

/-- Paper Proposition 11.2: every unitary channel has Kraus rank one. -/
theorem kraus_rank_one (U : M) (hU : IsUnitary U) : IsKrausRank 1 (φ U) := by
  refine ⟨⟨[U], rfl, kraus_rep_one U⟩, ?_⟩
  intro m hm
  have hm0 : m = 0 := by omega
  rintro ops hlen hrep
  subst hm0
  have : ops = [] := by simpa [List.length_eq_zero_iff] using hlen
  subst this
  exact not_kraus_rep_zero U hU hrep

/-- The probe matrix: all entries equal to `1`. -/
private def X : M := Matrix.of fun _ _ => (1 : ℂ)

/-- The probe unitary: `P = diag(1, -1)`. -/
private def v : Fin 2 → ℂ := fun i => if i = 0 then 1 else -1

private def P : M := Matrix.diagonal v

private theorem v_apply_zero : v 0 = 1 := by simp [v]

private theorem v_apply_one : v 1 = -1 := by simp [v]

private theorem v_mul_star (i : Fin 2) : v i * star (v i) = 1 := by
  fin_cases i <;> simp [v]

private theorem P_unitary : IsUnitary P := by
  refine ⟨?_, ?_⟩
  · show P * P ᴴ = 1
    rw [P, Matrix.diagonal_conjTranspose, Matrix.diagonal_mul_diagonal]
    have h : (fun i => v i * (star v) i) = fun _ => (1 : ℂ) := funext fun i => v_mul_star i
    rw [h]
    exact Matrix.diagonal_one'
  · show P ᴴ * P = 1
    rw [P, Matrix.diagonal_conjTranspose, Matrix.diagonal_mul_diagonal]
    have h : (fun i => (star v) i * v i) = fun _ => (1 : ℂ) := by
      funext i
      have h1 : v i * star (v i) = 1 := v_mul_star i
      rw [mul_comm] at h1
      exact h1
    rw [h]
    exact Matrix.diagonal_one'

private theorem one_unitary : IsUnitary (1 : M) := by
  refine ⟨?_, ?_⟩
  · show (1 : M) * 1 ᴴ = 1
    rw [Matrix.conjTranspose_one, mul_one]
  · show (1 : M) ᴴ * 1 = 1
    rw [Matrix.conjTranspose_one, one_mul]

private theorem phi_one : φ 1 = fun Y => Y := by
  funext Y
  show (1 : M) * Y * 1 ᴴ = Y
  simp [Matrix.conjTranspose_one]

private theorem phi_P_X_apply : (φ P X) 0 1 = -1 := by
  show (P * X * P ᴴ) 0 1 = -1
  have hdiag : P ᴴ = Matrix.diagonal (star v) := Matrix.diagonal_conjTranspose v
  rw [hdiag, Matrix.mul_diagonal]
  have hp : (P * X) 0 1 = v 0 * X 0 1 := by
    rw [P, Matrix.diagonal_mul]
  rw [hp, v_apply_zero]
  have hx : X 0 1 = 1 := rfl
  rw [hx]
  have hv1 : (star v) 1 = -1 := by
    show star (v 1) = -1
    rw [v_apply_one, star_neg, star_one]
  rw [hv1]
  norm_num

private theorem phi_one_X_apply : (φ 1 X) 0 1 = 1 := by
  rw [phi_one]
  rfl

/-- Paper Proposition 11.2: two distinct unitary channels, both of Kraus rank one, so
the assignment from channels to Kraus rank is not injective under equality of maps. -/
theorem kraus_rank_not_injective :
    ∃ U U' : M, IsUnitary U ∧ IsUnitary U' ∧ ¬ SameChannel (φ U) (φ U') ∧
      IsKrausRank 1 (φ U) ∧ IsKrausRank 1 (φ U') := by
  refine ⟨1, P, one_unitary, P_unitary, ?_, kraus_rank_one 1 one_unitary,
    kraus_rank_one P P_unitary⟩
  intro h
  have hX := h X
  have h01 := congrArg (fun Y => Y 0 1) hX
  rw [phi_one_X_apply, phi_P_X_apply] at h01
  exact absurd h01 (by norm_num)

end Kraus

/-! ## The cotangent retract (paper Proposition 4.1) -/


exec
/usr/local/bin/zsh -lc "sed -n '561,830p' lean/Cmrps/Vol02StructuralFamilies.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
section Cotangent

variable {Q : Type u} [TopologicalSpace Q]
variable {V : Type v} [AddCommGroup V] [Module ℝ V] [TopologicalSpace V] [ContinuousSMul ℝ V]

/-- Paper Proposition 4.1: the deformation retraction `r_t(x, ξ) = (x, tξ)` of `T*Q`
onto its zero section, modelled on the total space `Q × V`. -/
def retraction (t : ℝ) (p : Q × V) : Q × V := (p.1, t • p.2)

/-- `r_1 = id`. -/
@[simp]
theorem retraction_one (p : Q × V) : retraction (1 : ℝ) p = p := by
  simp [retraction]

/-- `r_s ∘ r_t = r_{s*t}`. -/
theorem retraction_comp (s t : ℝ) (p : Q × V) :
    retraction s (retraction t p) = retraction (s * t) p := by
  simp [retraction, smul_smul]

/-- `r_t` fixes the zero section pointwise. -/
theorem retraction_fixes_zero_section (t : ℝ) (x : Q) :
    retraction t (x, (0 : V)) = (x, 0) := by
  simp [retraction]

/-- `r_0` maps the total space onto the zero section. -/
theorem retraction_zero_eq (p : Q × V) : retraction (0 : ℝ) p = (p.1, (0 : V)) := by
  simp [retraction]

theorem retraction_zero_mem_zeroSection (p : Q × V) :
    retraction (0 : ℝ) p ∈ Set.range (fun x : Q => (x, (0 : V))) :=
  ⟨p.1, (retraction_zero_eq p).symm⟩

/-- Each `r_t` is continuous. -/
theorem continuous_retraction (t : ℝ) : Continuous (retraction (t : ℝ) (Q := Q) (V := V)) := by
  show Continuous fun p : Q × V => (p.1, t • p.2)
  exact continuous_fst.prodMk (continuous_const.smul continuous_snd)

/-- The deformation is jointly continuous in `t` and the point. -/
theorem continuous_retraction₂ :
    Continuous fun p : ℝ × (Q × V) => retraction (Q := Q) (V := V) p.1 p.2 := by
  show Continuous fun p : ℝ × (Q × V) => (p.2.1, p.1 • p.2.2)
  exact (continuous_snd.fst).prodMk (continuous_fst.smul continuous_snd.snd)

/-- Paper Proposition 4.1: the zero section is a deformation retract of `T*Q`;
the data above (continuity of `r_t`, `r_1 = id`, `r_0` through the zero section,
`r_s ∘ r_t = r_{st}`, and the fixed zero section) is the content of the proposition. -/
theorem cotangent_retract :
    (∀ t : ℝ, Continuous (retraction (t : ℝ) (Q := Q) (V := V))) ∧
      (∀ p : Q × V, retraction (1 : ℝ) p = p) ∧
        (∀ p : Q × V, retraction (0 : ℝ) p ∈ Set.range (fun x : Q => (x, (0 : V)))) ∧
          (∀ s t : ℝ, ∀ p : Q × V,
            retraction s (retraction t p) = retraction (s * t) p) ∧
            (∀ t : ℝ, ∀ x : Q, retraction t (x, (0 : V)) = (x, 0)) :=
  ⟨continuous_retraction, fun _ => retraction_one _,
    retraction_zero_mem_zeroSection, fun _ _ _ => retraction_comp _ _ _,
    fun _ _ => retraction_fixes_zero_section _ _⟩

end Cotangent

/-! ## Irreducible classes do not close (paper Proposition 15.1) -/

section Closure

variable {α : Type u} [Zero α]

/-- A class of objects is closed under a family `K` of binary constructions when it is
closed under each `f ∈ K` (paper: closure under the admissible constructions). -/
def ClosedUnder (K : Set (α → α → α)) (C : Set α) : Prop :=
  ∀ f ∈ K, ∀ a b, a ∈ C → b ∈ C → f a b ∈ C

/-- Paper Section 2: `⟨E⟩_K`, the smallest class containing `E` and closed under `K`. -/
def closure (K : Set (α → α → α)) (E : Set α) : Set α :=
  {x | ∀ C : Set α, E ⊆ C → ClosedUnder K C → x ∈ C}

theorem mem_closure {K : Set (α → α → α)} {E : Set α} {x : α} :
    x ∈ closure K E ↔ ∀ C : Set α, E ⊆ C → ClosedUnder K C → x ∈ C :=
  Iff.rfl

theorem subset_closure (K : Set (α → α → α)) (E : Set α) : E ⊆ closure K E :=
  fun _ hx C hE _ => hE hx

theorem closedUnder_closure (K : Set (α → α → α)) (E : Set α) :
    ClosedUnder K (closure K E) := by
  intro f hf a b ha hb C hE hC
  exact hC f hf a b (ha C hE hC) (hb C hE hC)

theorem closure_minimal (K : Set (α → α → α)) {E C : Set α}
    (hE : E ⊆ C) (hC : ClosedUnder K C) : closure K E ⊆ C :=
  fun _ hx => hx C hE hC

/-- Paper Proposition 15.1: an object irreducible under `⊕` is not a sum of two
nonzero objects. -/
def Irreducible (op : α → α → α) (a : α) : Prop :=
  ¬ ∃ b c, b ≠ 0 ∧ c ≠ 0 ∧ op b c = a

/-- Paper Proposition 15.1: a nonempty class of nonzero objects each irreducible under
direct sum is not closed under direct sum, and its closure strictly contains it.
The hypothesis `E.Nonempty` is required; the conclusion is non-closure, not
non-generation. -/
theorem exceptional_not_closed (op : α → α → α) (K : Set (α → α → α)) (hop : op ∈ K)
    (E : Set α) (hne : E.Nonempty)
    (hirr : ∀ a ∈ E, a ≠ 0 ∧ Irreducible op a) :
    (¬ ClosedUnder K E) ∧ E ⊂ closure K E := by
  obtain ⟨A, hA⟩ := hne
  have hA0 : A ≠ 0 := (hirr A hA).1
  have hAA : op A A ∉ E := by
    intro hmem
    have hirr' : Irreducible op (op A A) := (hirr _ hmem).2
    exact hirr' ⟨A, A, hA0, hA0, rfl⟩
  have hAA_mem : op A A ∈ closure K E :=
    closedUnder_closure K E op hop A A (subset_closure K E hA) (subset_closure K E hA)
  refine ⟨?_, ⟨subset_closure K E, ?_⟩⟩
  · intro hclosed
    exact hAA (hclosed op hop A A hA hA)
  · intro hincl
    exact hAA (hincl hAA_mem)

/-- Paper Proposition 15.1: the class still generates its closure (the conclusion is
non-closure, not non-generation). -/
theorem closure_generation (K : Set (α → α → α)) (E : Set α) :
    E ⊆ closure K E ∧
      ∀ C : Set α, E ⊆ C → ClosedUnder K C → closure K E ⊆ C :=
  ⟨subset_closure K E, fun _ => closure_minimal K⟩

end Closure

/-! ## Independence and reconstructability (paper Definition 16.1, Proposition 16.2) -/

/-- Paper Definition 2.3 / 16.1: a structural family is presented by its class of objects. -/
structure StructuralFamily where
  /-- Objects of the family. -/
  Obj : Type u

/-- Paper Definition 16.1: `F` is a special case of `G` when there is a full embedding
of the objects of `F` into the objects of `G`. **Scope caveat (Codex review, round 1):**
this is the *object-level shadow* of the paper's definition — an injection of object
types, not a fully faithful functor of the families' categories (those categories are
not formalized here). -/
def SpecialCase (F G : StructuralFamily) : Prop := Nonempty (F.Obj ↪ G.Obj)

/-- Paper Definition 16.1 / Table 14: `G` is reconstructable from `F` when a
correspondence determines one from the other. **Scope caveat (Codex review, round 1):**
this is the object-level shadow (a bijection of object types), not the paper's
structure-preserving equivalence or anti-equivalence. -/
def Reconstructable (F G : StructuralFamily) : Prop := Nonempty (F.Obj ≃ G.Obj)

/-- Paper Definition 16.1: two structural families are logically independent when
neither is a special case of the other and neither is reconstructable from the other.
**Scope caveat (Codex review, round 1):** with the object-level shadows above, classical
comparability of cardinalities makes one direction of `SpecialCase` always hold, so
`Independent F G` is false for all families — the paper's category-level independence
is NOT formalized here. -/
def Independent (F G : StructuralFamily) : Prop :=
  ¬ SpecialCase F G ∧ ¬ SpecialCase G F ∧ ¬ Reconstructable F G ∧ ¬ Reconstructable G F

/-- Paper Proposition 16.2: a family admits a classifying invariant when some map on
its objects is injective (it separates objects up to the chosen equivalence, taken here
to be equality). -/
def HasClassifyingInvariant (F : StructuralFamily.{u}) : Prop :=
  ∃ (V : Type u) (I : F.Obj → V), Function.Injective I

/-- Paper Proposition 16.2: families related by a correspondence (as the Gelfand
anti-equivalence relates commutative unital C*-algebras and compact Hausdorff spaces)
are not logically independent. -/
theorem not_independent_of_reconstructable (F G : StructuralFamily)
    (h : Reconstructable F G) : ¬ Independent F G :=
  fun hI => hI.2.2.1 h

/-- Paper Proposition 16.2: two families may each admit a classifying invariant and
still fail to be logically independent; the existence of classifying invariants is
silent on independence. -/
theorem invariants_not_independence :
    ∃ F G : StructuralFamily.{0}, HasClassifyingInvariant F ∧ HasClassifyingInvariant G ∧
      Reconstructable F G ∧ ¬ Independent F G := by
  let F : StructuralFamily.{0} := ⟨ℕ⟩
  let G : StructuralFamily.{0} := ⟨ULift ℕ⟩
  exact ⟨F, G, ⟨ℕ, id, fun _ _ h => h⟩, ⟨ULift ℕ, fun n => n, fun _ _ h => h⟩,
    ⟨Equiv.ulift.symm⟩, not_independent_of_reconstructable F G ⟨Equiv.ulift.symm⟩⟩

/-! ## Comparability of records (paper Proposition 18.1) -/

section Comparability

/-- Subtype equivalence along an equality of sets. -/
def subtypeEquivOfEq {γ : Type*} {s t : Set γ} (h : s = t) : ↥s ≃ ↥t where
  toFun p := ⟨p.1, h ▸ p.2⟩
  invFun p := ⟨p.1, h.symm ▸ p.2⟩
  left_inv := fun p => Subtype.ext rfl
  right_inv := fun p => Subtype.ext rfl

/-- Paper Proposition 18.1: two classification records that agree on family, sector, and
equivalence (same objects, same physical equivalence) and that both name classifying
invariants have invariants related by a bijection between their attained values. -/
theorem comparability_of_records {Obj : Type u} {r : Obj → Obj → Prop} (hr : Equivalence r)
    {V₁ : Type v} {I₁ : Obj → V₁}
    (h₁c : ∀ a b, r a b → I₁ a = I₁ b) (h₁k : ∀ a b, I₁ a = I₁ b → r a b)
    {V₂ : Type w} {I₂ : Obj → V₂}
    (h₂c : ∀ a b, r a b → I₂ a = I₂ b) (h₂k : ∀ a b, I₂ a = I₂ b → r a b) :
    Nonempty (Set.range I₁ ≃ Set.range I₂) := by
  let s : Setoid Obj := ⟨r, hr⟩
  let f₁ : Quotient s → V₁ := Quotient.lift I₁ h₁c
  let f₂ : Quotient s → V₂ := Quotient.lift I₂ h₂c
  have inj₁ : Function.Injective f₁ := by
    intro q₁ q₂ he
    revert he
    refine Quotient.inductionOn₂ q₁ q₂ ?_
    intro a b he
    have heq : I₁ a = I₁ b := by
      show f₁ (Quotient.mk s a) = f₁ (Quotient.mk s b)
      exact he
    exact Quotient.sound (h₁k a b heq)
  have inj₂ : Function.Injective f₂ := by
    intro q₁ q₂ he
    revert he
    refine Quotient.inductionOn₂ q₁ q₂ ?_
    intro a b he
    have heq : I₂ a = I₂ b := by
      show f₂ (Quotient.mk s a) = f₂ (Quotient.mk s b)
      exact he
    exact Quotient.sound (h₂k a b heq)
  have e₁ : Quotient s ≃ Set.range f₁ := Equiv.ofInjective f₁ inj₁
  have e₂ : Quotient s ≃ Set.range f₂ := Equiv.ofInjective f₂ inj₂
  have hr₁ : Set.range f₁ = Set.range I₁ := by
    apply Set.ext
    intro x
    constructor
    · rintro ⟨q, rfl⟩
      exact ⟨Quotient.out q, by
        conv_rhs => rw [← Quotient.out_eq q]
        rfl⟩
    · rintro ⟨a, rfl⟩
      exact ⟨Quotient.mk s a, rfl⟩
  have hr₂ : Set.range f₂ = Set.range I₂ := by
    apply Set.ext
    intro x
    constructor
    · rintro ⟨q, rfl⟩
      exact ⟨Quotient.out q, by
        conv_rhs => rw [← Quotient.out_eq q]
        rfl⟩
    · rintro ⟨a, rfl⟩
      exact ⟨Quotient.mk s a, rfl⟩
  refine ⟨(e₁.trans (subtypeEquivOfEq hr₁)).symm.trans (e₂.trans (subtypeEquivOfEq hr₂))⟩

end Comparability

end Cmrps.Vol02

exec
/usr/local/bin/zsh -lc 'cat lean/Cmrps/Vol03IrreducibilityDecomposition.lean' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
/-
Copyright: 2026 YonedaAI Research Collective.
Released under the terms of the project license.
-/
import Mathlib.Basic.Complex.Basic
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.Matrix.ConjTranspose
import Mathlib.Algebra.Group.Submonoid.Basic
import Mathlib.Algebra.Group.Submonoid.Membership
import Mathlib.GroupTheory.Perm.Basic
import Mathlib.Data.Fintype.Sum

/-!
# Vol. 03 — Irreducibility and Decomposition

Mechanization of the tractable targets of
`verification/vol-03-irreducibility-decomposition-lean-targets.md`, drawn from
`papers/latex/vol-03-irreducibility-decomposition.tex`.

Names mirror the paper's labels. The abstract classification theorem (Thm 3.3 for
arbitrary unital finite-dimensional complex C*-algebras) is NOT mechanized here —
Mathlib has no C*-algebra classification layer. This module formalizes the concrete
block model `BlockAlg n = ∀ i, M_{n i}(ℂ)`, its dimension arithmetic, the dimension
vector combinatorics (multiset union / pairwise product), the multiplicity-matrix
data layer, and the closure semigroup of `cor:closure`.

All statements below are fully proved; nothing uses `sorry`, `axiom`, or `native_decide`.
-/

universe u v

namespace Cmrps.Vol03

open Module Matrix BigOperators
open scoped TensorProduct

/-! ## Definitions (paper §2, §4) -/

/-- Dimension vector of a block presentation `n : ι → ℕ`: the multiset of matrix
block sizes (paper `def:dim-vector`). -/
def dimVector {ι : Type*} [Fintype ι] (n : ι → ℕ) : Multiset ℕ :=
  (Finset.univ.val.map n)

/-- The concrete decomposed algebra of a block presentation: the direct sum of the
matrix blocks `M_{n i}(ℂ)` (paper `thm:block-decomposition`, model side). -/
abbrev BlockAlg {ι : Type*} [Fintype ι] (n : ι → ℕ) :=
  ∀ i, Matrix (Fin (n i)) (Fin (n i)) ℂ

/-- Componentwise adjoint on a block algebra (paper `rem:krull-schmidt`, *-structure). -/
def starBlock {ι : Type*} [Fintype ι] {n : ι → ℕ} (x : BlockAlg n) : BlockAlg n :=
  fun i => (x i)ᴴ

/-- Multiplicity matrix from a presentation `n` to a presentation `m`
(paper `def:multiplicity-matrix`): `r i j` copies of the `i`-th source block inside
the `j`-th target block, with rank contributions `n i * r i j` summing to `m j`. -/
structure MultiplicityMatrix {ι κ : Type*} [Fintype ι] [Fintype κ]
    (n : ι → ℕ) (m : κ → ℕ) where
  /-- Multiplicity of source block `i` in target block `j`. -/
  r : ι → κ → ℕ
  /-- Column-sum constraint: `∑ i, n i * r i j = m j` for every target block `j`. -/
  column_sum : ∀ j, ∑ i, n i * r i j = m j

/-- Induced rank matrix `k^{(i)}_j = n_i * r^{(i)}_j` (paper `def:multiplicity-matrix`). -/
def rankMatrix {ι κ : Type*} [Fintype ι] [Fintype κ] {n : ι → ℕ} {m : κ → ℕ}
    (R : MultiplicityMatrix n m) (i : ι) (j : κ) : ℕ :=
  n i * R.r i j

/-- Multiplicative size semigroup generated by a set `S` of block sizes
(paper `cor:closure`): the submonoid of `(ℕ, ×)` generated by `S`. -/
def sizeSemigroup (S : Set ℕ) : Submonoid ℕ :=
  Submonoid.closure S

/-- A dimension vector is closed over `S` when every entry lies in the generated
multiplicative semigroup (paper `cor:closure`). -/
def ClosedVectors (S : Set ℕ) (v : Multiset ℕ) : Prop :=
  ∀ ⦃x⦄, x ∈ v → x ∈ sizeSemigroup S

/-- Pairwise product of two dimension vectors (paper `prop:construction-arithmetic` (2)). -/
def pairwiseProd (v w : Multiset ℕ) : Multiset ℕ :=
  v.bind fun a => w.map fun b => a * b

/-- Block permutations: permutations of the block index preserving all block sizes
(paper `cor:outer-aut`, data layer). -/
def blockPerm {ι : Type*} [Fintype ι] (n : ι → ℕ) : Subgroup (Equiv.Perm ι) where
  carrier := {σ | ∀ i, n (σ i) = n i}
  one_mem' := by intro i; rfl
  mul_mem' := by
    intro σ τ hσ hτ i
    exact (hσ (τ i)).trans (hτ i)
  inv_mem' := by
    intro σ hσ i
    have h := hσ (σ⁻¹ i)
    simpa using h.symm

@[simp]
theorem mem_blockPerm {ι : Type*} [Fintype ι] {n : ι → ℕ} {σ : Equiv.Perm ι} :
    σ ∈ blockPerm n ↔ ∀ i, n (σ i) = n i :=
  Iff.rfl

/-! ## Dimension arithmetic of the block model (paper Thm 3.3, Prop 8.1) -/

/-- Dimension of the block algebra is the sum of squares of the block sizes
(paper `thm:block-decomposition`, dimension clause). -/
theorem finrank_blockAlg {ι : Type*} [Fintype ι] (n : ι → ℕ) :
    Module.finrank ℂ (BlockAlg n) = ∑ i, (n i) ^ 2 := by
  rw [Module.finrank_pi_fintype]
  simp_rw [Module.finrank_matrix, Fintype.card_fin, Module.finrank_self, mul_one, pow_two]

/-- The componentwise adjoint is an involution (paper `thm:block-decomposition`, *-laws). -/
theorem starBlock_involutive {ι : Type*} [Fintype ι] {n : ι → ℕ} (x : BlockAlg n) :
    starBlock (starBlock x) = x := by
  funext i
  simp [starBlock]

/-- The componentwise adjoint is anti-multiplicative (paper `thm:block-decomposition`, *-laws). -/
theorem starBlock_mul {ι : Type*} [Fintype ι] {n : ι → ℕ} (x y : BlockAlg n) :
    starBlock (x * y) = starBlock y * starBlock x := by
  funext i
  simp [starBlock, Matrix.conjTranspose_mul]

/-- The dimension vector is invariant under permutation of the block indexing:
uniqueness of the multiset of block sizes up to permutation
(paper `thm:block-decomposition`, uniqueness clause, presentation level). -/
theorem dimVector_perm_invariant {ι : Type*} [Fintype ι] (n : ι → ℕ) (σ : Equiv.Perm ι) :
    dimVector (n ∘ σ) = dimVector n := by
  simp only [dimVector]
  conv_lhs => rw [← Multiset.map_map]
  have h1 : Multiset.map (⇑σ) (Finset.univ.val) = Finset.univ.val := by
    have h2 := Finset.map_val (f := σ.toEmbedding) (s := Finset.univ)
    rw [Finset.map_univ_equiv] at h2
    have h3 : (⇑σ.toEmbedding : ι → ι) = ⇑σ := rfl
    rw [h3] at h2
    exact h2.symm
  rw [h1]

/-- Dimension vectors add by multiset union on direct sums
(paper `prop:construction-arithmetic` (1)). -/
theorem dimVector_sum_elim {ι κ : Type*} [Fintype ι] [Fintype κ]
    (n : ι → ℕ) (m : κ → ℕ) :
    dimVector (Sum.elim n m) = dimVector n + dimVector m := by
  simp only [dimVector]
  conv_lhs =>
    rw [show (Finset.univ : Finset (ι ⊕ κ)) = Finset.univ.disjSum Finset.univ from
      (Finset.univ_disjSum_univ).symm]
    rw [Finset.val_disjSum]
  show Multiset.map (Sum.elim n m)
      ((Finset.univ.val.map Sum.inl) + (Finset.univ.val.map Sum.inr)) = _
  rw [Multiset.map_add, Multiset.map_map, Multiset.map_map]
  congr 1

/-- Dimension vectors multiply by pairwise product on tensor presentations
(paper `prop:construction-arithmetic` (2)): the tensor of blocks has sizes `n i * m j`. -/
theorem dimVector_prod {ι κ : Type*} [Fintype ι] [Fintype κ]
    (n : ι → ℕ) (m : κ → ℕ) :
    dimVector (fun p : ι × κ => n p.1 * m p.2)
      = pairwiseProd (dimVector n) (dimVector m) := by
  simp only [dimVector, pairwiseProd]
  conv_lhs =>
    rw [show (Finset.univ : Finset (ι × κ))
        = (Finset.univ : Finset ι) ×ˢ (Finset.univ : Finset κ) by
      ext p; simp]
  show Multiset.map (fun p : ι × κ => n p.1 * m p.2)
      ((Finset.univ.val).product (Finset.univ.val)) = _
  simp only [Multiset.product]
  rw [Multiset.map_bind]
  simp only [Multiset.map_map, Function.comp]
  conv_rhs => rw [Multiset.bind_map]

/-- `M_a(ℂ) ⊗ M_b(ℂ)` has complex dimension `(a b)²`, the square of the tensor block size
(paper `prop:construction-arithmetic` (2), `M_n ⊗ M_m ≅ M_{nm}` at the level of dimensions). -/
theorem finrank_tensor_blocks (a b : ℕ) :
    Module.finrank ℂ (Matrix (Fin a) (Fin a) ℂ ⊗[ℂ] Matrix (Fin b) (Fin b) ℂ) = (a * b) ^ 2 := by
  rw [Module.finrank_tensorProduct]
  simp [Module.finrank_matrix, pow_two, mul_comm, mul_left_comm]

/-- Worked example (paper `ex:superselection`): the direct sum `M_2 ⊕ M_2` has
dimension `2² + 2² = 8`, which is not a perfect square, so no tensor block `M_{ab}`
has the same dimension. -/
theorem sum_two_sq_eq_eight : (2 : ℕ) ^ 2 + 2 ^ 2 = 8 := by norm_num

theorem ne_eight_of_sq (a b : ℕ) : (a * b) ^ 2 ≠ 8 := by
  intro h
  have h2 : (a * b) * (a * b) = 8 := by simpa [pow_two] using h
  have h3 : a * b ≤ 3 := by
    by_contra hc
    have h4 : 4 ≤ a * b := by omega
    have h5 : 16 ≤ (a * b) * (a * b) := by simpa using Nat.mul_le_mul h4 h4
    omega
  have h6 : 2 ≤ a * b := by
    by_contra hc
    have h7 : a * b ≤ 1 := by omega
    have h8 : (a * b) * (a * b) ≤ 1 := by simpa using Nat.mul_le_mul h7 h7
    omega
  have : a * b = 2 ∨ a * b = 3 := by omega
  rcases this with hab | hab <;> rw [hab] at h2 <;> omega

/-- Worked example (paper `ex:superselection`), witness form: `M_2 ⊕ M_2` admits no
`ℂ`-linear isomorphism — a fortiori no *-isomorphism — with a tensor block `M_{ab}`,
because their dimensions `8` and `(ab)²` differ. -/
theorem two_two_blocks_ne_tensor_block (a b : ℕ) :
    ¬ Nonempty (BlockAlg (fun _ : Fin 2 => (2 : ℕ)) ≃ₗ[ℂ]
      BlockAlg (fun _ : Fin 1 => a * b)) := by
  rintro ⟨f⟩
  have h := LinearEquiv.finrank_eq f
  rw [finrank_blockAlg, finrank_blockAlg] at h
  simp only [Fin.sum_univ_two, Fin.sum_univ_one] at h
  have h2 : 8 = (a * b) ^ 2 := by
    have h3 : (2 : ℕ) ^ 2 + 2 ^ 2 = (a * b) ^ 2 := by simpa using h
    rw [sum_two_sq_eq_eight] at h3
    exact h3
  exact (ne_eight_of_sq a b) h2.symm

/-! ## Multiplicity matrices (paper §4, `def:multiplicity-matrix`, `thm:homs` data layer) -/

/-- Rank-matrix column sums recover the target block sizes
(paper `def:multiplicity-matrix`, `∑_i k^{(i)}_j = m_j`). -/
theorem rankMatrix_colSum {ι κ : Type*} [Fintype ι] [Fintype κ] {n : ι → ℕ} {m : κ → ℕ}
    (R : MultiplicityMatrix n m) (j : κ) :
    ∑ i, rankMatrix R i j = m j :=
  R.column_sum j

/-- Paper Example 4.4: unital *-homomorphisms `ℂ ⊕ M_2 → M_3` are classified by
nonnegative solutions of `r¹ + 2 r² = 3`, of which there are exactly two. -/
theorem multiplicity_example_44 (r1 r2 : ℕ) :
    r1 + 2 * r2 = 3 ↔ (r1, r2) = (3, 0) ∨ (r1, r2) = (1, 1) := by
  constructor
  · intro h
    have h' : r1 = 3 ∧ r2 = 0 ∨ r1 = 1 ∧ r2 = 1 := by omega
    rcases h' with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ <;> simp
  · rintro (h | h) <;> simp only [Prod.mk.injEq] at h <;> omega

/-- Paper Table 4.1 row 3: column sums `(1, 2)` admit `2 × 3 = 6` multiplicity matrices.
First column: exactly two solutions of `x + y = 1`. -/
theorem multiplicity_col_sum_one (x y : ℕ) :
    x + y = 1 ↔ (x, y) = (1, 0) ∨ (x, y) = (0, 1) := by
  constructor
  · intro h
    have h' : x = 1 ∧ y = 0 ∨ x = 0 ∧ y = 1 := by omega
    rcases h' with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ <;> simp
  · rintro (h | h) <;> simp only [Prod.mk.injEq] at h <;> omega

/-- Paper Table 4.1 row 3: second column — exactly three solutions of `x + y = 2`. -/
theorem multiplicity_col_sum_two (x y : ℕ) :
    x + y = 2 ↔ (x, y) = (2, 0) ∨ (x, y) = (1, 1) ∨ (x, y) = (0, 2) := by
  constructor
  · intro h
    have h' : x = 2 ∧ y = 0 ∨ x = 1 ∧ y = 1 ∨ x = 0 ∧ y = 2 := by omega
    rcases h' with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ <;> simp
  · rintro (h | h | h) <;> simp only [Prod.mk.injEq] at h <;> omega

/-- Paper Table 4.1 row 2: the unique multiplicity matrix of `M_2 → M_2 ⊕ M_2` is the
diagonal embedding (`2 r = 2` forces `r = 1` in each column). -/
theorem multiplicity_diagonal_unique (r s : ℕ) :
    2 * r = 2 ∧ 2 * s = 2 ↔ r = 1 ∧ s = 1 := by
  constructor
  · intro h; omega
  · rintro ⟨rfl, rfl⟩; simp

/-! ## Closure under direct sum and tensor product (paper `cor:closure`) -/

theorem mem_sizeSemigroup_of_mem {S : Set ℕ} {x : ℕ} (hx : x ∈ S) :
    x ∈ sizeSemigroup S :=
  Submonoid.subset_closure hx

theorem one_mem_sizeSemigroup (S : Set ℕ) : 1 ∈ sizeSemigroup S :=
  Submonoid.one_mem _

theorem mul_mem_sizeSemigroup {S : Set ℕ} {x y : ℕ}
    (hx : x ∈ sizeSemigroup S) (hy : y ∈ sizeSemigroup S) :
    x * y ∈ sizeSemigroup S :=
  mul_mem hx hy

/-- Direct sums of closed dimension vectors are closed (paper `cor:closure`, ⊕-step). -/
theorem closedVectors_add {S : Set ℕ} {v w : Multiset ℕ}
    (hv : ClosedVectors S v) (hw : ClosedVectors S w) :
    ClosedVectors S (v + w) := by
  intro x hx
  rcases Multiset.mem_add.mp hx with hx | hx
  · exact hv hx
  · exact hw hx

/-- Tensor products of closed dimension vectors are closed (paper `cor:closure`, ⊗-step). -/
theorem closedVectors_pairwiseProd {S : Set ℕ} {v w : Multiset ℕ}
    (hv : ClosedVectors S v) (hw : ClosedVectors S w) :
    ClosedVectors S (pairwiseProd v w) := by
  intro x hx
  simp only [pairwiseProd, Multiset.mem_bind] at hx
  obtain ⟨a, ha, hb⟩ := hx
  simp only [Multiset.mem_map] at hb
  obtain ⟨b, hb, rfl⟩ := hb
  exact mul_mem (hv ha) (hw hb)

theorem closedVectors_singleton {S : Set ℕ} {x : ℕ} (hx : x ∈ S) :
    ClosedVectors S {x} := by
  intro y hy
  rw [Multiset.mem_singleton] at hy
  rw [hy]
  exact mem_sizeSemigroup_of_mem hx

/-- Paper Example 8.5 (qubit closure): the semigroup generated by `{1, 2}` is the
powers of two. -/
theorem mem_sizeSemigroup_one_two (x : ℕ) :
    x ∈ sizeSemigroup ({1, 2} : Set ℕ) ↔ ∃ k, x = 2 ^ k := by
  constructor
  · intro hx
    refine Submonoid.closure_induction
      (s := ({1, 2} : Set ℕ)) (motive := fun x _ => ∃ k, x = 2 ^ k) ?_ ?_ ?_ hx
    · intro y hy
      simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hy
      rcases hy with rfl | rfl
      · exact ⟨0, by simp⟩
      · exact ⟨1, by simp⟩
    · exact ⟨0, by simp⟩
    · rintro a b - - ⟨k, rfl⟩ ⟨l, rfl⟩
      exact ⟨k + l, by rw [pow_add]⟩
  · rintro ⟨k, rfl⟩
    exact pow_mem (Submonoid.subset_closure (by simp : (2 : ℕ) ∈ ({1, 2} : Set ℕ))) k

theorem two_pow_ne_three (k : ℕ) : (2 : ℕ) ^ k ≠ 3 := by
  match k with
  | 0 => decide
  | 1 => decide
  | k + 2 =>
    intro h
    have h4 : (2 : ℕ) ^ (k + 2) = 4 * 2 ^ k := by ring
    rw [h4] at h
    have h5 : (4 : ℕ) ≤ 4 * 2 ^ k := by
      have h6 : 0 < 2 ^ k := Nat.two_pow_pos k
      omega
    omega

/-- Paper Example 8.5: `M_3` (size 3) lies outside the qubit closure. -/
theorem three_not_mem_sizeSemigroup_one_two :
    (3 : ℕ) ∉ sizeSemigroup ({1, 2} : Set ℕ) := by
  intro h
  obtain ⟨k, hk⟩ := (mem_sizeSemigroup_one_two 3).mp h
  exact two_pow_ne_three k hk.symm

end Cmrps.Vol03

exec
/usr/local/bin/zsh -lc 'cat lean/Cmrps/Vol06QuantumSystems.lean' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
/-
Copyright (c) 2026 The YonedaAI Collaboration. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.

# Vol. 6 — Classification of Quantum Physical Systems

Mechanization of the tractable targets of
`papers/latex/vol-06-quantum-systems.tex` (Part VI of CMRPS).

Scope note. The paper's Theorem 3.1 classifies finite-dimensional complex
C*-algebras up to *-isomorphism. This module formalizes the *block-size
combinatorics* of that statement — dimension vectors as multisets of positive
integers, their tensor-product law, their counting function, and the concrete
vector-space dimension of a block algebra — plus the entrywise form of the
trace-preserving half of the Choi correspondence (Lemma 6.1). The C*-algebraic
lifting (Jacobson radical vanishing, Artin-Wedderburn, *-isomorphism) and the
operator-algebraic and categorical targets (Stinespring, McDuff,
Doplicher-Roberts, Deligne, Petz) are NOT formalized here; they are recorded in
`verification/vol-06-quantum-systems-claim-status.md` and
`verification/vol-06-quantum-systems-conjectures.md`.

Dimension vectors are represented by `List ℕ` up to `List.Perm`, i.e. as
multisets of block sizes with the order of blocks forgotten.
-/

import Mathlib.Data.List.Basic
import Mathlib.Data.List.ProdSigma
import Mathlib.Data.List.Perm.Basic
import Mathlib.Data.List.Sort
import Mathlib.Data.List.OfFn
import Mathlib.Data.Matrix.Basic
import Mathlib.Algebra.BigOperators.Ring.List
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.Tactic

namespace Cmrps.Vol06

/-! ## Dimension vectors (paper: Definition 2.4) -/

/-- A dimension vector is a multiset of positive block sizes, represented as a
list up to `List.Perm`. Paper: Definition 2.4 (`dimvec`). -/
abbrev DimensionVector : Type := List ℕ

/-- Validity of a dimension vector: every block size is a positive integer.
Paper: Definition 2.4, "each `n_i ≥ 1`". -/
def ValidDimvec (l : DimensionVector) : Prop := ∀ n ∈ l, 0 < n

/-- Complex dimension `Σ n_i²` of the block algebra attached to a dimension
vector. Paper: Corollary 3.2, "`dim A = Σ_i n_i²`". -/
def algebraDim (l : DimensionVector) : ℕ := (l.map fun n => n * n).sum

@[simp]
theorem algebraDim_nil : algebraDim [] = 0 := rfl

@[simp]
theorem algebraDim_cons (n : ℕ) (l : DimensionVector) :
    algebraDim (n :: l) = n * n + algebraDim l := rfl

/-- The dimension vector of a tensor product of block algebras is the multiset
of pairwise products of block sizes. Paper: Proposition 3.11. -/
def tensorDimvec (l₁ l₂ : DimensionVector) : DimensionVector :=
  (l₁ ×ˢ l₂).map fun p => p.1 * p.2

/-- Sum over a product list splits as a product of sums. -/
theorem sum_map_product {α β : Type*} (f : α → ℕ) (g : β → ℕ)
    (l₁ : List α) (l₂ : List β) :
    ((l₁ ×ˢ l₂).map fun p => f p.1 * g p.2).sum = (l₁.map f).sum * (l₂.map g).sum := by
  induction l₁ with
  | nil => simp
  | cons a l₁ ih =>
    have hmap : ((a :: l₁) ×ˢ l₂).map (fun p => f p.1 * g p.2) =
        (l₂.map fun b => f a * g b) ++ ((l₁ ×ˢ l₂).map fun p => f p.1 * g p.2) := by
      simp [List.product_cons]
    rw [hmap, List.sum_append, ih, List.map_cons, List.sum_cons, List.sum_map_mul_left]
    ring

/-- Paper: Proposition 3.11, "`dim(A ⊗ B) = dim A · dim B`" at the level of
block-size combinatorics. -/
theorem algebraDim_tensor (l₁ l₂ : DimensionVector) :
    algebraDim (tensorDimvec l₁ l₂) = algebraDim l₁ * algebraDim l₂ := by
  show (((l₁ ×ˢ l₂).map fun p => p.1 * p.2).map fun n => n * n).sum = _
  rw [List.map_map]
  have key :
      ((fun n => n * n) ∘ fun p : ℕ × ℕ => p.1 * p.2) = fun p => (p.1 * p.1) * (p.2 * p.2) := by
    funext p
    simp [Function.comp]
    ring
  rw [key]
  exact sum_map_product (fun n => n * n) (fun n => n * n) l₁ l₂

/-- Dimension vectors of tensor products are computed without reference to a
presentation: the operation is permutation-invariant. Paper: Proposition 3.11. -/
theorem tensorDimvec_perm {l₁ l₁' l₂ l₂' : DimensionVector}
    (h₁ : List.Perm l₁ l₁') (h₂ : List.Perm l₂ l₂') :
    List.Perm (tensorDimvec l₁ l₂) (tensorDimvec l₁' l₂') :=
  List.Perm.map _ (List.Perm.product h₁ h₂)

theorem tensorDimvec_valid {l₁ l₂ : DimensionVector}
    (h₁ : ValidDimvec l₁) (h₂ : ValidDimvec l₂) :
    ValidDimvec (tensorDimvec l₁ l₂) := by
  intro n hn
  simp only [tensorDimvec, List.mem_map] at hn
  obtain ⟨p, hp, rfl⟩ := hn
  have hp1 : p.1 ∈ l₁ ∧ p.2 ∈ l₂ := List.mem_product.mp hp
  exact Nat.mul_pos (h₁ _ hp1.1) (h₂ _ hp1.2)

/-! ## Classification by dimension vector (paper: Theorem 3.1, Corollary 3.2) -/

/-- A dimension vector is complete data for a block presentation up to order:
two sorted presentations agree as soon as they agree as multisets. This is the
combinatorial content of Theorem 3.1 / Corollary 3.2; the C*-algebraic lifting
to *-isomorphism is not formalized here. -/
theorem dimvec_classifies_sorted {l₁ l₂ : DimensionVector}
    (h₁ : l₁.Pairwise (· ≤ ·)) (h₂ : l₂.Pairwise (· ≤ ·)) :
    List.Perm l₁ l₂ ↔ l₁ = l₂ :=
  ⟨fun h => h.eq_of_pairwise' h₁ h₂, fun h => h ▸ List.Perm.refl _⟩

/-- Vector-space dimension is not a classifying invariant while the dimension
vector is: `[2]` and `[1,1,1,1]` have equal `algebraDim` but are not
permutation-equivalent. Paper: Example 3.4. -/
theorem dim4_vector_dimension_not_classifying :
    algebraDim [2] = algebraDim [1, 1, 1, 1] ∧
      ¬ List.Perm ([2] : DimensionVector) [1, 1, 1, 1] := by
  constructor
  · rfl
  · intro h
    have := List.Perm.length_eq h
    simp at this

/-- Enumeration of the dimension vectors of complex dimension `d`: all
nonincreasing lists of positive integers whose squares sum to `d`. The `fuel`
argument is a structural recursion budget; `dimVectorsOfDim` supplies `d + 1`,
which is enough to reach every list of algebra dimension `d` (each step strictly
decreases `d`). -/
def dimVecs : (fuel d bound : ℕ) → List (List ℕ)
  | 0, _, _ => []
  | _ + 1, 0, _ => [[]]
  | fuel + 1, d + 1, bound =>
      (List.range (bound + 1)).flatMap fun k =>
        if k * k ≤ d + 1 ∧ 1 ≤ k ∧ k ≤ bound then
          ((dimVecs fuel (d + 1 - k * k) k).map fun l => k :: l)
        else []

/-- All dimension vectors of complex dimension `d`, as nonincreasing lists.
Paper: Corollary 3.6 and Table 2. -/
def dimVectorsOfDim (d : ℕ) : List (List ℕ) := dimVecs (d + 1) d d

/-- Soundness of the enumeration: every listed vector has algebra dimension `d`.
Paper: Corollary 3.6. -/
theorem algebraDim_eq_of_mem_dimVecs {fuel d bound : ℕ} {l : DimensionVector}
    (h : l ∈ dimVecs fuel d bound) : algebraDim l = d := by
  induction fuel generalizing d bound l with
  | zero => simp [dimVecs] at h
  | succ fuel ih =>
    match d with
    | 0 =>
      simp only [dimVecs] at h
      rw [List.mem_singleton] at h
      subst h
      rfl
    | d + 1 =>
      simp only [dimVecs] at h
      rw [List.mem_flatMap] at h
      obtain ⟨k, hk, hk'⟩ := h
      split_ifs at hk' with hc
      · rw [List.mem_map] at hk'
        obtain ⟨l', hl', rfl⟩ := hk'
        specialize ih hl'
        rw [algebraDim_cons, ih]
        exact Nat.add_sub_cancel' hc.1
      · simp at hk'

theorem algebraDim_eq_of_mem_dimVectorsOfDim {d : ℕ} {l : DimensionVector}
    (h : l ∈ dimVectorsOfDim d) : algebraDim l = d :=
  algebraDim_eq_of_mem_dimVecs h

/-- Table 2, row `d = 4`: the two algebras of complex dimension 4. -/
theorem dimVectorsOfDim_four :
    dimVectorsOfDim 4 = [[1, 1, 1, 1], [2]] := by decide

/-- Table 2, row `d = 8`. -/
theorem dimVectorsOfDim_eight :
    dimVectorsOfDim 8 = [[1, 1, 1, 1, 1, 1, 1, 1], [2, 1, 1, 1, 1], [2, 2]] := by decide

/-- Table 2, row `d = 12`. -/
theorem dimVectorsOfDim_twelve :
    dimVectorsOfDim 12 =
      [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
       [2, 1, 1, 1, 1, 1, 1, 1, 1],
       [2, 2, 1, 1, 1, 1],
       [2, 2, 2],
       [3, 1, 1, 1]] := by decide

/-! ## Block algebras and their dimension (paper: Definition 2.3, Corollary 3.2) -/

/-- The block algebra of block sizes `s : Fin k → ℕ`: a direct sum of full
matrix algebras, realized as the product of the matrix spaces. Paper:
Definition 2.3 and Theorem 3.1 (block form). -/
abbrev BlockAlgebra {k : ℕ} (s : Fin k → ℕ) : Type :=
  ∀ i : Fin k, Matrix (Fin (s i)) (Fin (s i)) ℂ

/-- The complex dimension of a block algebra is the sum of squares of its block
sizes. Paper: Corollary 3.2, "`dim A = Σ_i n_i²`". -/
theorem finrank_blockAlgebra {k : ℕ} (s : Fin k → ℕ) :
    Module.finrank ℂ (BlockAlgebra s) = ∑ i : Fin k, (s i) ^ 2 := by
  rw [Module.finrank_pi_fintype]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [Module.finrank_matrix, Fintype.card_fin, Module.finrank_self]
  ring

/-- Bridge between the list form and the family form of a dimension vector. -/
theorem algebraDim_ofFn {k : ℕ} (s : Fin k → ℕ) :
    algebraDim (List.ofFn s) = ∑ i : Fin k, (s i) ^ 2 := by
  simp only [algebraDim, List.map_ofFn]
  rw [Fin.sum_ofFn]
  refine Finset.sum_congr rfl fun i _ => ?_
  simp only [Function.comp_apply, Nat.pow_two]

/-- The combinatorial dimension of the list presentation agrees with the
vector-space dimension of the block algebra. -/
theorem algebraDim_eq_finrank_ofFn {k : ℕ} (s : Fin k → ℕ) :
    algebraDim (List.ofFn s) = Module.finrank ℂ (BlockAlgebra s) := by
  rw [algebraDim_ofFn, finrank_blockAlgebra]

/-! ## Choi matrix and trace preservation (paper: Lemma 6.1) -/

/-- Matrix unit `E_{ij}` of `M_n(ℂ)`. -/
def matrixUnit {n : ℕ} (i j : Fin n) : Matrix (Fin n) (Fin n) ℂ :=
  Matrix.of fun a b => if a = i ∧ b = j then 1 else 0

@[simp]
theorem matrixUnit_apply {n : ℕ} (i j a b : Fin n) :
    matrixUnit i j a b = if a = i ∧ b = j then 1 else 0 := rfl

/-- Choi matrix of a linear map `Φ : M_n(ℂ) →ₗ[ℂ] M_m(ℂ)`, with entries
`J(Φ)_{(i,a),(j,b)} = Φ(E_{ij})_{a b}`, i.e. `J(Φ) = Σ_{ij} E_{ij} ⊗ Φ(E_{ij})`.
Paper: Lemma 6.1. -/
def choi {n m : ℕ} (Φ : Matrix (Fin n) (Fin n) ℂ →ₗ[ℂ] Matrix (Fin m) (Fin m) ℂ) :
    Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ :=
  Matrix.of fun x y => Φ (matrixUnit x.1 y.1) x.2 y.2

@[simp]
theorem choi_apply {n m : ℕ}
    (Φ : Matrix (Fin n) (Fin n) ℂ →ₗ[ℂ] Matrix (Fin m) (Fin m) ℂ)
    (x y : Fin n × Fin m) :
    choi Φ x y = Φ (matrixUnit x.1 y.1) x.2 y.2 := rfl

/-- Partial trace over the second tensor factor of a block matrix on
`ℂ^n ⊗ ℂ^m`. Paper: Lemma 6.1, `Tr_m`. -/
def partialTrace₂ {n m : ℕ}
    (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ) : Matrix (Fin n) (Fin n) ℂ :=
  Matrix.of fun i j => ∑ a : Fin m, J (i, a) (j, a)

@[simp]
theorem partialTrace₂_apply {n m : ℕ}
    (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ) (i j : Fin n) :
    partialTrace₂ J i j = ∑ a : Fin m, J (i, a) (j, a) := rfl

theorem trace_eq_sum_apply {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ) :
    Matrix.trace A = ∑ i : Fin n, A i i := by
  simp [Matrix.trace, Matrix.diag_apply]

/-- The partial trace of a Choi matrix along the second factor has entries
`Tr(Φ(E_{ij}))`. -/
theorem partialTrace₂_choi_apply {n m : ℕ}
    (Φ : Matrix (Fin n) (Fin n) ℂ →ₗ[ℂ] Matrix (Fin m) (Fin m) ℂ) (i j : Fin n) :
    partialTrace₂ (choi Φ) i j = Matrix.trace (Φ (matrixUnit i j)) := by
  rw [trace_eq_sum_apply]
  rfl

/-- Trace-preserving half of the Choi correspondence: `Φ` preserves trace on
matrix units exactly when the partial trace of its Choi matrix is the identity,
`Tr_m J(Φ) = I_n`. Paper: Lemma 6.1 (second equivalence). -/
theorem choi_tracePreserving {n m : ℕ}
    (Φ : Matrix (Fin n) (Fin n) ℂ →ₗ[ℂ] Matrix (Fin m) (Fin m) ℂ) :
    partialTrace₂ (choi Φ) = 1 ↔
      ∀ i j : Fin n, Matrix.trace (Φ (matrixUnit i j)) = if i = j then 1 else 0 := by
  rw [← Matrix.ext_iff]
  constructor
  · intro h i j
    specialize h i j
    rw [partialTrace₂_choi_apply, Matrix.one_apply] at h
    exact h
  · intro h i j
    rw [partialTrace₂_choi_apply, Matrix.one_apply]
    exact h i j

/-- Sanity check: the Choi matrix of the identity map has entries
`δ_{a i} δ_{b j}` on composite indices. -/
theorem choi_id {n : ℕ} :
    choi (LinearMap.id : Matrix (Fin n) (Fin n) ℂ →ₗ[ℂ] Matrix (Fin n) (Fin n) ℂ) =
      Matrix.of fun x y => if x.2 = x.1 ∧ y.2 = y.1 then 1 else 0 := by
  ext x y
  simp [choi, matrixUnit, LinearMap.id]

end Cmrps.Vol06

exec
/usr/local/bin/zsh -lc 'cat lean/Cmrps/Vol07GaugeQft.lean' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
import Mathlib.Algebra.Algebra.Basic
import Mathlib.Algebra.Module.LinearMap.Defs
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.BigOperators.Group.List.Defs
import Mathlib.Algebra.Group.Subgroup.Ker
import Mathlib.Data.ZMod.Basic

/-!
# Volume 07 — gauge structures and quantum field theories

Algebraic core of `papers/latex/vol-07-gauge-qft.tex`. Identifier names mirror the
paper labels:

* `DominantIntegralWeight`, `highestWeightRankOne` — Theorem (Highest-weight
  classification), `thm:highest-weight` (rank-one content only).
* `FrobeniusAlgebra` — Theorem (Two-dimensional topological field theories),
  `thm:frobenius` (commutative Frobenius algebra side of the correspondence).
* `gaugeAction`, `GaugeEquiv` — Definition (Gauge equivalence of connections),
  `def:gauge-equivalence` (pointwise model).
* `AnomalyData`, `AnomalyFree`, `AnomalyFreeList` — Proposition (Anomaly cancellation
  as a linear condition), `prop:cancellation`.
* `AnomalyObstruction`, `QuantizationGate` — Definition (Fermionic anomaly),
  `def:fermionic-anomaly`, Definition (BV-BRST gauge anomaly), `def:bvbrst-anomaly`,
  Proposition (Quantization gate), `prop:anomaly`.
* `GlobalFormInvariant`, `SO3BundleClass` — Example (Global forms and the second
  Stiefel-Whitney class), `ex:global-form` (abstract Z/2-detection model only).

The topological and analytic content of the paper (classifying spaces, homotopy
groups of Lie groups, cohomology rings of `BG`, Dirac determinant lines, BRST
cohomology, tensor categories) is not formalized in this module.
-/

namespace Cmrps.Vol07

/-! ## Dominant integral weights (`thm:highest-weight`) -/

/-- Dominant integral weights of rank `r`: integral weights with nonnegative
coefficients on the fundamental weights. -/
def DominantIntegralWeight (r : ℕ) : Type :=
  { w : Fin r → ℤ // ∀ i, 0 ≤ w i }

/-- Rank-one content of Theorem `thm:highest-weight`: dominant integral weights of
type `A_1` are exactly the multiples `n` of the fundamental weight. -/
def highestWeightRankOne : DominantIntegralWeight 1 ≃ ℕ where
  toFun w := (w.1 0).toNat
  invFun n := ⟨fun _ => (n : ℤ), fun _ => Int.natCast_nonneg n⟩
  left_inv w := by
    apply Subtype.ext
    funext i
    rw [Fin.fin_one_eq_zero i]
    exact Int.toNat_of_nonneg (w.2 0)
  right_inv n := Int.toNat_natCast n

/-! ## Commutative Frobenius algebras (`thm:frobenius`) -/

/-- Commutative Frobenius algebra over `k` on `A`, with a dual basis indexed by `ι`:
the algebraic datum classifying two-dimensional Atiyah theories in Theorem
`thm:frobenius`. -/
structure FrobeniusAlgebra (k A ι : Type*) [CommRing k] [CommRing A] [Algebra k A]
    [Fintype ι] where
  /-- Trace (the counit attached to the disc). -/
  eps : A →ₗ[k] k
  /-- Left half of a dual basis. -/
  e : ι → A
  /-- Right half of a dual basis. -/
  f : ι → A
  /-- Every element is reconstructed from its pairings against the dual basis. -/
  left_dual : ∀ a : A, ∑ i, eps (f i * a) • e i = a

namespace FrobeniusAlgebra

variable {k A ι : Type*} [CommRing k] [CommRing A] [Algebra k A] [Fintype ι]

/-- The Frobenius pairing `(a, b) ↦ eps (a * b)` is symmetric. -/
theorem pairing_comm (F : FrobeniusAlgebra k A ι) (a b : A) :
    F.eps (a * b) = F.eps (b * a) := by
  rw [mul_comm]

/-- Left-nondegeneracy: an element pairing to zero against every other element
vanishes. -/
theorem nondegenerate_left (F : FrobeniusAlgebra k A ι) (a : A)
    (h : ∀ b : A, F.eps (b * a) = 0) : a = 0 := by
  have hz : ∀ i, F.eps (F.f i * a) • F.e i = 0 := by
    intro i
    simp [h]
  have hsum := F.left_dual a
  rw [Finset.sum_eq_zero (fun i _ => hz i)] at hsum
  exact hsum.symm

/-- Right-nondegeneracy of the pairing. -/
theorem nondegenerate_right (F : FrobeniusAlgebra k A ι) (a : A)
    (h : ∀ b : A, F.eps (a * b) = 0) : a = 0 :=
  F.nondegenerate_left a fun b => by
    rw [mul_comm]
    exact h b

/-- A nonzero element pairs nontrivially against some element. -/
theorem exists_pairing_ne_zero (F : FrobeniusAlgebra k A ι) {a : A} (ha : a ≠ 0) :
    ∃ b : A, F.eps (a * b) ≠ 0 :=
  Classical.byContradiction fun H =>
    ha (F.nondegenerate_right a fun b => Classical.byContradiction fun hb => H ⟨b, hb⟩)

/-- The Euler element `m (Δ(1))` of the punctured torus. -/
def euler (F : FrobeniusAlgebra k A ι) : A :=
  ∑ i, F.e i * F.f i

/-- The genus-one partition function `eps (euler)`. -/
def genusOne (F : FrobeniusAlgebra k A ι) : k :=
  F.eps F.euler

/-- The genus-one partition function is the sum of the dual-basis pairings. -/
theorem genusOne_eq (F : FrobeniusAlgebra k A ι) :
    F.genusOne = ∑ i, F.eps (F.e i * F.f i) := by
  simp [genusOne, euler]

end FrobeniusAlgebra

/-! ## Gauge action and gauge equivalence (`def:gauge-equivalence`) -/

/-- Pointwise model of Definition `def:gauge-equivalence`: the gauge group `X → H`
acts on field configurations `X → V`. -/
def gaugeAction {X H V : Type*} [Monoid H] [MulAction H V] (g : X → H) (A : X → V) :
    X → V :=
  fun x => g x • A x

theorem gaugeAction_one {X H V : Type*} [Monoid H] [MulAction H V] (A : X → V) :
    gaugeAction (1 : X → H) A = A := by
  funext x
  simp [gaugeAction]

theorem gaugeAction_mul {X H V : Type*} [Monoid H] [MulAction H V] (g₁ g₂ : X → H)
    (A : X → V) :
    gaugeAction (g₁ * g₂) A = gaugeAction g₁ (gaugeAction g₂ A) := by
  funext x
  simp [gaugeAction, mul_smul]

/-- Definition `def:gauge-equivalence`: `B` is the image of `A` under the gauge
transformation `g`. -/
def GaugeEquiv {X H V : Type*} [Monoid H] [MulAction H V] (g : X → H) (A B : X → V) :
    Prop :=
  gaugeAction g A = B

theorem gaugeEquiv_refl {X H V : Type*} [Monoid H] [MulAction H V] (A : X → V) :
    GaugeEquiv (1 : X → H) A A :=
  gaugeAction_one A

theorem gaugeEquiv_trans {X H V : Type*} [Monoid H] [MulAction H V] {g₁ g₂ : X → H}
    {A B C : X → V} (h₁ : GaugeEquiv g₁ A B) (h₂ : GaugeEquiv g₂ B C) :
    GaugeEquiv (g₂ * g₁) A C := by
  show gaugeAction (g₂ * g₁) A = C
  rw [gaugeAction_mul, h₁, h₂]

theorem gaugeEquiv_symm {X H V : Type*} [Group H] [MulAction H V] {g : X → H}
    {A B : X → V} (h : GaugeEquiv g A B) : GaugeEquiv g⁻¹ B A := by
  have h' : ∀ x, g x • A x = B x := fun x => by
    have hx := congrFun h x
    simpa [gaugeAction] using hx
  funext x
  show (g x)⁻¹ • B x = A x
  rw [← h' x, inv_smul_smul]

/-! ## Anomaly cancellation as a linear condition (`prop:cancellation`) -/

/-- Anomaly data of Proposition `prop:cancellation`: the additivity homomorphism
`alpha : R(G) → A` from the representation ring to the anomaly coefficient group. -/
structure AnomalyData (R A : Type*) [AddCommGroup R] [AddCommGroup A] where
  /-- Additivity homomorphism of the anomaly coefficient. -/
  alpha : R →+ A

namespace AnomalyData

variable {R A : Type*} [AddCommGroup R] [AddCommGroup A]

/-- A virtual representation is anomaly-free when its contribution to the anomaly
vanishes (Definition `def:fermionic-anomaly`, Proposition `prop:cancellation`). -/
def AnomalyFree (d : AnomalyData R A) (x : R) : Prop :=
  d.alpha x = 0

/-- Proposition `prop:cancellation`: the anomaly-free elements are exactly the
kernel of `alpha`. -/
theorem anomaly_free_iff_mem_ker (d : AnomalyData R A) (x : R) :
    d.AnomalyFree x ↔ x ∈ d.alpha.ker := by
  simp [AnomalyFree]

theorem anomaly_free_zero (d : AnomalyData R A) : d.AnomalyFree 0 := by
  simp [AnomalyFree]

theorem anomaly_free_add (d : AnomalyData R A) {x y : R} (hx : d.AnomalyFree x)
    (hy : d.AnomalyFree y) : d.AnomalyFree (x + y) := by
  have hx' : d.alpha x = 0 := hx
  have hy' : d.alpha y = 0 := hy
  simp [AnomalyFree, hx', hy']

theorem anomaly_free_neg (d : AnomalyData R A) {x : R} (hx : d.AnomalyFree x) :
    d.AnomalyFree (-x) := by
  have hx' : d.alpha x = 0 := hx
  simp [AnomalyFree, hx']

/-- Matter lists of Proposition `prop:cancellation`: the list is admissible when the
total anomaly of its members vanishes. -/
def AnomalyFreeList (d : AnomalyData R A) (l : List R) : Prop :=
  d.alpha l.sum = 0

theorem map_list_sum (d : AnomalyData R A) (l : List R) :
    d.alpha l.sum = (l.map d.alpha).sum := by
  induction l with
  | nil => simp
  | cons x xs ih => simp [ih]

theorem anomaly_free_list_iff_sum_map (d : AnomalyData R A) (l : List R) :
    d.AnomalyFreeList l ↔ (l.map d.alpha).sum = 0 := by
  simp [AnomalyFreeList, map_list_sum]

/-- Proposition `prop:cancellation`: anomaly-free matter lists form the kernel of
`alpha`, tested on the sum of the list. -/
theorem anomaly_free_list_iff_mem_ker (d : AnomalyData R A) (l : List R) :
    d.AnomalyFreeList l ↔ l.sum ∈ d.alpha.ker := by
  simp [AnomalyFreeList]

theorem anomaly_free_list_nil (d : AnomalyData R A) : d.AnomalyFreeList [] := by
  simp [AnomalyFreeList]

/-- Additivity of the anomaly on concatenation of matter lists. -/
theorem anomaly_free_list_append (d : AnomalyData R A) (l₁ l₂ : List R) :
    d.AnomalyFreeList (l₁ ++ l₂) ↔ d.alpha l₁.sum + d.alpha l₂.sum = 0 := by
  simp [AnomalyFreeList, List.sum_append, map_add]

end AnomalyData

/-! ## Quantization gate (`prop:anomaly`) -/

/-- Obstruction data of Definition `def:fermionic-anomaly` and Definition
`def:bvbrst-anomaly`: trivializability of the determinant line of the Dirac family
and the local BRST anomaly class in `H^{1,n}(s | d)`. -/
structure AnomalyObstruction (A : Type*) [Zero A] where
  /-- Whether the determinant line `λ_det` is trivializable. -/
  detLineTrivializable : Prop
  /-- The anomaly cocycle `[a]` in local BRST cohomology. -/
  brstClass : A

/-- Proposition `prop:anomaly` (quantization gate): a consistent quantization
requires a trivializable determinant line and a vanishing BRST anomaly class. -/
def QuantizationGate {A : Type*} [Zero A] (o : AnomalyObstruction A) : Prop :=
  o.detLineTrivializable ∧ o.brstClass = 0

theorem quantization_gate_iff {A : Type*} [Zero A] (o : AnomalyObstruction A) :
    QuantizationGate o ↔ o.detLineTrivializable ∧ o.brstClass = 0 :=
  Iff.rfl

theorem not_quantization_gate_of_ne_zero {A : Type*} [Zero A] (o : AnomalyObstruction A)
    (h : o.brstClass ≠ 0) : ¬ QuantizationGate o := fun ⟨_, hb⟩ => h hb

theorem not_quantization_gate_of_not_trivial {A : Type*} [Zero A] (o : AnomalyObstruction A)
    (h : ¬ o.detLineTrivializable) : ¬ QuantizationGate o := fun ⟨ht, _⟩ => h ht

/-- The gate read against the anomaly homomorphism of Proposition `prop:cancellation`. -/
theorem quantization_gate_iff_anomalyFree {R A : Type*} [AddCommGroup R] [AddCommGroup A]
    (d : AnomalyData R A) (x : R) (t : Prop) :
    QuantizationGate ⟨t, d.alpha x⟩ ↔ t ∧ d.AnomalyFree x :=
  Iff.rfl

/-! ## Global forms and the second Stiefel-Whitney class (`ex:global-form`) -/

/-- Model of Example `ex:global-form`: a two-valued invariant `w2` detecting the
isomorphism classes of principal `SO(3)`-bundles over `S²`. The geometric statement
(`π₁(SO(3)) ≅ ℤ/2`, `π₁(SU(2)) = 0`) is not formalized here. -/
structure GlobalFormInvariant (B : Type*) where
  /-- Second Stiefel-Whitney class as a `ℤ/2`-valued invariant. -/
  w2 : B → ZMod 2
  /-- Class of the trivial bundle. -/
  trivial : B
  /-- The trivial bundle has vanishing `w2`. -/
  w2_trivial : w2 trivial = 0
  /-- Some class has nonvanishing `w2`, so `w2` detects nontriviality. -/
  exists_nontrivial : ∃ b : B, w2 b ≠ 0

/-- Model of the two isomorphism classes of principal `SO(3)`-bundles over `S²`. -/
abbrev SO3BundleClass : Type := ZMod 2

/-- Second Stiefel-Whitney class in the model. -/
def w2 : SO3BundleClass → ZMod 2 := id

/-- The model of Example `ex:global-form`: two classes over `S²`, detected by `w2`. -/
def so3_w2_detection : GlobalFormInvariant SO3BundleClass where
  w2 := w2
  trivial := 0
  w2_trivial := rfl
  exists_nontrivial := ⟨1, by decide⟩

theorem so3_two_classes : Fintype.card SO3BundleClass = 2 :=
  ZMod.card 2

/-- Nonvanishing `w2` certifies that the class is not the trivial one. -/
theorem w2_detects_nontrivial {B : Type*} (F : GlobalFormInvariant B) {b : B}
    (h : F.w2 b ≠ 0) : b ≠ F.trivial := by
  intro hb
  rw [hb] at h
  exact h F.w2_trivial

/-- Model of the `SU(2)` side of Example `ex:global-form`: `π₁(SU(2)) = 0` forces a
single (trivial) isomorphism class of principal `SU(2)`-bundles over `S²`. -/
def SU2BundleClass : Type := PUnit

theorem su2_bundles_over_s2_trivial (b : SU2BundleClass) : b = ⟨⟩ := by
  cases b
  rfl

end Cmrps.Vol07

exec
/usr/local/bin/zsh -lc "sed -n '1,260p' lean/Cmrps/Vol05ClassicalSystems.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
/-
Module for `vol-05-classical-systems` (CMRPS Volume 5,
"Classification of Classical Physical Systems").

Lean identifiers mirror the definition and theorem names of
`papers/latex/vol-05-classical-systems.tex` and the witness names of
`src/vol-05-classical-systems/Instances.hs` where possible.
-/
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Algebra.Lie.Basic
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Basic.Real.Basic
import Mathlib.Data.Fin.VecNotation
import Mathlib.Data.Matrix.Mul
import Mathlib.LinearAlgebra.BilinearMap
import Mathlib.LinearAlgebra.CrossProduct
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Tactic

/-!
# Classical systems (Volume 5)

Formalized targets for Volume 5 of *The Classification of Mathematical
Representations of Physical Systems*.  The module machine-checks the
finite-dimensional core of the paper:

* the Fisher metric on open simplices, its product formula (Proposition 8.9),
  its monotonicity under stochastic maps (the hypothesis of Theorem 8.4), and
  the equality case along sufficient statistics (Lemma 8.5);
* symplectic forms on real vector spaces, the standard form
  `ω₀ = Σᵢ dxᵢ ∧ dyᵢ`, and the partner-vector step of Lemma 3.1;
* the Kirillov–Kostant–Souriau two-form `ω_ξ(x, y) = ⟨ξ, [x, y]⟩` and the
  `so(3)` Casimir of Proposition 4.5;
* the monodromy matrix of the spherical pendulum (Example 7.5).

The manifold-level statements (Darboux, Weinstein splitting, Moser stability,
Liouville–Arnold, Chentsov uniqueness, Weyl chamber classification, Delzant)
are recorded, unformalized, in
`verification/vol-05-classical-systems-claim-status.md` and
`verification/vol-05-classical-systems-conjectures.md`.
-/

namespace Cmrps.Vol05

/-! ## Classical statistical systems (Section 8) -/

section Statistical

/-- Definition 8.1: a tangent vector at a point of the open simplex: the
coordinates sum to zero. -/
def IsTangentVector {ι : Type*} [Fintype ι] (u : ι → ℝ) : Prop :=
  ∑ i, u i = 0

/-- Definition 2.4 / 8.1: the open simplex
`Δ° = {p | pᵢ > 0 and Σᵢ pᵢ = 1}`. -/
def OpenSimplex {ι : Type*} [Fintype ι] (p : ι → ℝ) : Prop :=
  (∀ i, 0 < p i) ∧ ∑ i, p i = 1

/-- Definition 8.1: the Fisher metric on the open simplex,
`g_p(u, v) = Σᵢ uᵢ vᵢ / pᵢ` (Haskell witness `fisherMetric`). -/
noncomputable def fisherMetric {ι : Type*} [Fintype ι] (p u v : ι → ℝ) : ℝ :=
  ∑ i, u i * v i / p i

theorem fisherMetric_comm {ι : Type*} [Fintype ι] (p u v : ι → ℝ) :
    fisherMetric p u v = fisherMetric p v u := by
  simp only [fisherMetric, mul_comm]

theorem fisherMetric_self_nonneg {ι : Type*} [Fintype ι] (p u : ι → ℝ)
    (hp : ∀ i, 0 < p i) : 0 ≤ fisherMetric p u u := by
  apply Finset.sum_nonneg
  intro i _
  exact div_nonneg (mul_self_nonneg (u i)) (le_of_lt (hp i))

/-- The Fisher metric is positive definite: `g_p(u, u) = 0` forces `u = 0`. -/
theorem fisherMetric_self_eq_zero {ι : Type*} [Fintype ι] (p u : ι → ℝ)
    (hp : ∀ i, 0 < p i) (h : fisherMetric p u u = 0) : u = 0 := by
  have hterm : ∀ i, 0 ≤ u i * u i / p i :=
    fun i => div_nonneg (mul_self_nonneg (u i)) (le_of_lt (hp i))
  have hz : ∀ i ∈ (Finset.univ : Finset ι), u i * u i / p i = 0 := by
    refine (Finset.sum_eq_zero_iff_of_nonneg (fun i _ => hterm i)).mp ?_
    show (∑ i, u i * u i / p i) = 0
    exact h
  funext i
  have hi : u i * u i / p i = 0 := hz i (Finset.mem_univ i)
  have hpi : p i ≠ 0 := ne_of_gt (hp i)
  rcases div_eq_zero_iff.mp hi with h0 | h0
  · exact mul_self_eq_zero.mp h0
  · exact absurd h0 hpi

/-- An open simplex is indexed by a nonempty type. -/
theorem openSimplex_index_nonempty {ι : Type*} [Fintype ι] {p : ι → ℝ}
    (hp : OpenSimplex p) : Nonempty ι := by
  by_contra h
  have h' : IsEmpty ι := not_nonempty_iff.mp h
  rcases hp with ⟨_, hsum⟩
  have h0 : (∑ i, p i) = 0 :=
    Finset.sum_eq_zero fun i _ => (@IsEmpty.false ι h' i).elim
  linarith

/-- Example 8.3: for `p = (1/2, 1/3, 1/6)` and `u = (1, -1, 0)` one has
`g_p(u, u) = 5`. -/
theorem fisherMetric_example_three :
    fisherMetric ![1 / 2, 1 / 3, 1 / 6] ![1, -1, 0] ![1, -1, 0] = 5 := by
  simp only [fisherMetric, Fin.sum_univ_three, Matrix.cons_val_zero]
  norm_num

/-- Example 8.3: at the uniform point `p = (1/3, 1/3, 1/3)` the same vector has
`g_p(u, u) = 6`. -/
theorem fisherMetric_example_uniform :
    fisherMetric ![1 / 3, 1 / 3, 1 / 3] ![1, -1, 0] ![1, -1, 0] = 6 := by
  simp only [fisherMetric, Fin.sum_univ_three, Matrix.cons_val_zero]
  norm_num

/-- Definition 2.4 / 8.2: column-stochastic matrix: nonnegative entries and unit
column sums. -/
def IsColumnStochastic {m n : ℕ} (T : Matrix (Fin m) (Fin n) ℝ) : Prop :=
  (∀ j i, 0 ≤ T j i) ∧ ∀ i, ∑ j, T j i = 1

/-- A column-stochastic matrix with strictly positive entries maps the open
simplex into itself (Definition 2.4). -/
theorem mulVec_mem_openSimplex {m n : ℕ} {T : Matrix (Fin m) (Fin n) ℝ} {p : Fin n → ℝ}
    (hT : IsColumnStochastic T) (hTpos : ∀ j i, 0 < T j i) (hp : OpenSimplex p) :
    OpenSimplex (T.mulVec p) := by
  rcases hp with ⟨hpos, hsum⟩
  obtain ⟨i₀⟩ := openSimplex_index_nonempty ⟨hpos, hsum⟩
  refine ⟨?_, ?_⟩
  · intro j
    have hpos' : ∀ i, 0 < T j i * p i := fun i => mul_pos (hTpos j i) (hpos i)
    simpa [Matrix.mulVec_apply_eq_sum] using
      Finset.sum_pos (fun i _ => hpos' i) (⟨i₀, Finset.mem_univ i₀⟩ : (Finset.univ : Finset (Fin n)).Nonempty)
  · show ∑ j, ∑ i, T j i * p i = 1
    rw [Finset.sum_comm]
    have hswap : ∀ i, (∑ j, T j i * p i) = p i := by
      intro i
      rw [← Finset.sum_mul, hT.2, one_mul]
    simp only [hswap, hsum]

/-- Definition 8.2: a family of Riemannian metrics on the open simplices of all
dimensions, monotone under stochastic maps:
`g_{Tp}(Tu, Tu) ≤ g_p(u, u)`. -/
structure MonotoneMetric where
  /-- The metric at `p` on tangent vectors `u`, `v` of the `k`-outcome simplex. -/
  g : (k : ℕ) → (Fin k → ℝ) → (Fin k → ℝ) → (Fin k → ℝ) → ℝ
  /-- Symmetry of the metric. -/
  symm : ∀ k p u v, g k p u v = g k p v u
  /-- Monotonicity under column-stochastic maps: coarse-graining cannot increase
  distinguishability. -/
  monotone : ∀ (n m : ℕ) (T : Matrix (Fin m) (Fin n) ℝ), IsColumnStochastic T →
    ∀ (p u : Fin n → ℝ), (∀ i, 0 < p i) → (∀ j, 0 < (T.mulVec p) j) →
      g m (T.mulVec p) (T.mulVec u) (T.mulVec u) ≤ g n p u u

/-- Lemma 8.5: a stochastic map with a stochastic left inverse is an isometry for
every monotone metric. -/
theorem monotoneMetric_equality_of_leftInverse (G : MonotoneMetric)
    {n m : ℕ} (T : Matrix (Fin m) (Fin n) ℝ) (S : Matrix (Fin n) (Fin m) ℝ)
    (hT : IsColumnStochastic T) (hS : IsColumnStochastic S)
    (hST : S * T = 1) (p u : Fin n → ℝ)
    (hp : ∀ i, 0 < p i) (hq : ∀ j, 0 < (T.mulVec p) j) :
    G.g n p u u = G.g m (T.mulVec p) (T.mulVec u) (T.mulVec u) := by
  have h1 : G.g m (T.mulVec p) (T.mulVec u) (T.mulVec u) ≤ G.g n p u u :=
    G.monotone n m T hT p u hp hq
  have hSTp : S.mulVec (T.mulVec p) = p := by
    rw [Matrix.mulVec_mulVec, hST, Matrix.one_mulVec]
  have hSTu : S.mulVec (T.mulVec u) = u := by
    rw [Matrix.mulVec_mulVec, hST, Matrix.one_mulVec]
  have h2 : G.g n p u u ≤ G.g m (T.mulVec p) (T.mulVec u) (T.mulVec u) := by
    have hss : G.g n (S.mulVec (T.mulVec p)) (S.mulVec (T.mulVec u))
          (S.mulVec (T.mulVec u)) ≤ G.g m (T.mulVec p) (T.mulVec u) (T.mulVec u) :=
      G.monotone m n S hS (T.mulVec p) (T.mulVec u) hq (by rw [hSTp]; exact hp)
    rw [hSTp, hSTu] at hss
    exact hss
  exact le_antisymm h2 h1

/-- Proposition 8.9 (target `FisherExplicit`): the Fisher metric of a product of
probability vectors is the direct sum of the factor metrics.  The product
`p ⊗ q` is indexed by `Fin n × Fin m`, with `(p ⊗ q)ᵢⱼ = pᵢ qⱼ` and tangent
vector `u ⊗ q + p ⊗ v`. -/
theorem fisherMetric_product {n m : ℕ} {p : Fin n → ℝ} {q : Fin m → ℝ}
    {u : Fin n → ℝ} {v : Fin m → ℝ} (hp : OpenSimplex p) (hq : OpenSimplex q)
    (hu : IsTangentVector u) (hv : IsTangentVector v) :
    fisherMetric (fun ij : Fin n × Fin m => p ij.1 * q ij.2)
        (fun ij => u ij.1 * q ij.2 + p ij.1 * v ij.2)
        (fun ij => u ij.1 * q ij.2 + p ij.1 * v ij.2)
      = fisherMetric p u u + fisherMetric q v v := by
  rcases hp with ⟨hppos, hps⟩
  rcases hq with ⟨hqpos, hqs⟩
  have hu0 : ∑ i, u i = 0 := hu
  have hv0 : ∑ j, v j = 0 := hv
  simp only [fisherMetric]
  have hprod : (Finset.univ : Finset (Fin n × Fin m)) = Finset.univ ×ˢ Finset.univ := by
    ext ⟨i, j⟩
    simp
  have hf : ∀ (i : Fin n) (j : Fin m),
      (u i * q j + p i * v j) * (u i * q j + p i * v j) / (p i * q j)
        = u i * u i * q j / p i + 2 * (u i * v j) + p i * (v j * v j / q j) := by
    intro i j
    have hp0 : p i ≠ 0 := ne_of_gt (hppos i)
    have hq0 : q j ≠ 0 := ne_of_gt (hqpos j)
    field_simp [hp0, hq0]
    ring
  have hA : (∑ i, ∑ j, u i * u i * q j / p i) = ∑ i, u i * u i / p i := by
    have hfA : ∀ (i : Fin n) (j : Fin m), u i * u i * q j / p i = (u i * u i / p i) * q j := by
      intro i j
      field_simp [ne_of_gt (hppos i)]
    simp only [hfA, ← Finset.mul_sum, hqs, mul_one]
  have hB : (∑ i, ∑ j, 2 * (u i * v j)) = 0 := by
    have hfB : ∀ (i : Fin n) (j : Fin m), 2 * (u i * v j) = (2 * u i) * v j := by
      intro i j
      ring
    simp only [hfB, ← Finset.mul_sum, hv0, mul_zero, Finset.sum_const_zero]
  have hC : (∑ i, ∑ j, p i * (v j * v j / q j)) = ∑ j, v j * v j / q j := by
    rw [Finset.sum_comm]
    simp only [← Finset.sum_mul, hps, one_mul]
  rw [hprod, Finset.sum_product]
  simp only [hf, Finset.sum_add_distrib]
  rw [hA, hB, hC]
  ring

/-- The key identity behind Fisher monotonicity: the gap
`g_p(u, u) - g_{Tp}(Tu, Tu)` is a sum of squares. -/
theorem fisherMetric_gap_eq_sum_squares {m n : ℕ} (T : Matrix (Fin m) (Fin n) ℝ)
    (hT : IsColumnStochastic T) (p u : Fin n → ℝ)
    (hp : ∀ i, 0 < p i) (hq : ∀ j, 0 < (T.mulVec p) j) :
    fisherMetric p u u - fisherMetric (T.mulVec p) (T.mulVec u) (T.mulVec u)
      = ∑ i, ∑ j,
          T j i * p i * (u i / p i - (T.mulVec u) j / (T.mulVec p) j) ^ 2 := by
  have hsumT : ∀ i, ∑ j, T j i = 1 := hT.2
  have hqdef : ∀ j, (T.mulVec p) j = ∑ i, T j i * p i :=
    fun j => Matrix.mulVec_apply_eq_sum T p j
  have hvdef : ∀ j, (T.mulVec u) j = ∑ i, T j i * u i :=
    fun j => Matrix.mulVec_apply_eq_sum T u j
  have hdiv : ∀ (i : Fin n) (j : Fin m),
      T j i * p i * (u i / p i - (T.mulVec u) j / (T.mulVec p) j) ^ 2
        = T j i * u i * (u i / p i)
            - 2 * (T j i * u i) * ((T.mulVec u) j / (T.mulVec p) j)
            + T j i * p i * ((T.mulVec u) j / (T.mulVec p) j) * ((T.mulVec u) j / (T.mulVec p) j) := by
    intro i j
    have hp0 : p i ≠ 0 := ne_of_gt (hp i)
    have hq0 : (T.mulVec p) j ≠ 0 := ne_of_gt (hq j)
    field_simp [hp0, hq0]
    ring
  -- term A: Σᵢ Σⱼ Tⱼᵢ uᵢ (uᵢ / pᵢ) = g_p(u, u)
  have hA : (∑ i, ∑ j, T j i * u i * (u i / p i)) = ∑ i, u i * u i / p i := by
    have hfA : ∀ (i : Fin n) (j : Fin m),
        T j i * u i * (u i / p i) = T j i * (u i * (u i / p i)) := fun i j => by ring
    simp only [hfA, ← Finset.sum_mul, hsumT, one_mul]
    exact Finset.sum_congr rfl fun i _ => (mul_div_assoc (u i) (u i) (p i)).symm
  -- term B: Σᵢ Σⱼ 2 (Tⱼᵢ uᵢ) (vⱼ / qⱼ) = 2 g_q(v, v)
  have hB : (∑ i, ∑ j, 2 * (T j i * u i) * ((T.mulVec u) j / (T.mulVec p) j))
      = 2 * (∑ j, (T.mulVec u) j * (T.mulVec u) j / (T.mulVec p) j) := by
    rw [Finset.sum_comm]
    have hinner : ∀ j : Fin m,
        (∑ i, 2 * (T j i * u i) * ((T.mulVec u) j / (T.mulVec p) j))
          = 2 * ((T.mulVec u) j / (T.mulVec p) j) * (T.mulVec u) j := by
      intro j
      have hfB : ∀ i : Fin n,
          2 * (T j i * u i) * ((T.mulVec u) j / (T.mulVec p) j)
            = (2 * ((T.mulVec u) j / (T.mulVec p) j)) * (T j i * u i) := fun i => by ring

exec
/usr/local/bin/zsh -lc "sed -n '261,510p' lean/Cmrps/Vol05ClassicalSystems.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
      simp only [hfB, ← Finset.mul_sum]
      rw [← hvdef]
    simp only [hinner]
    have hassoc : ∀ j : Fin m,
        2 * ((T.mulVec u) j / (T.mulVec p) j) * (T.mulVec u) j
          = 2 * (((T.mulVec u) j / (T.mulVec p) j) * (T.mulVec u) j) := fun j => by ring
    simp only [hassoc, ← Finset.mul_sum]
    congr 1
    exact Finset.sum_congr rfl fun j _ => by
      rw [mul_comm, mul_div_assoc]
  -- term C: Σᵢ Σⱼ Tⱼᵢ pᵢ (vⱼ / qⱼ)² = g_q(v, v)
  have hC : (∑ i, ∑ j,
        T j i * p i * ((T.mulVec u) j / (T.mulVec p) j) * ((T.mulVec u) j / (T.mulVec p) j))
      = ∑ j, (T.mulVec u) j * (T.mulVec u) j / (T.mulVec p) j := by
    rw [Finset.sum_comm]
    simp only [← Finset.sum_mul, hqdef]
    exact Finset.sum_congr rfl fun j _ => by
      have hq0 : (T.mulVec p) j ≠ 0 := ne_of_gt (hq j)
      field_simp [hq0]
  -- assemble: R = A - B + C = P - Q
  have hR : (∑ i, ∑ j, T j i * p i * (u i / p i - (T.mulVec u) j / (T.mulVec p) j) ^ 2)
      = (∑ i, u i * u i / p i)
          - (∑ j, (T.mulVec u) j * (T.mulVec u) j / (T.mulVec p) j) := by
    simp only [hdiv, Finset.sum_add_distrib, Finset.sum_sub_distrib]
    rw [hA, hB, hC]
    ring
  exact hR.symm

/-- Fisher monotonicity (the hypothesis of Chentsov's theorem, Theorem 8.4;
computational claim 3): for a column-stochastic `T` the pullback of the Fisher
metric at `T p` is bounded by the Fisher metric at `p`. -/
theorem fisherMetric_monotone {m n : ℕ} (T : Matrix (Fin m) (Fin n) ℝ)
    (hT : IsColumnStochastic T) (p u : Fin n → ℝ)
    (hp : ∀ i, 0 < p i) (hq : ∀ j, 0 < (T.mulVec p) j) :
    fisherMetric (T.mulVec p) (T.mulVec u) (T.mulVec u) ≤ fisherMetric p u u := by
  have hgap := fisherMetric_gap_eq_sum_squares T hT p u hp hq
  have hnonneg : 0 ≤ ∑ i, ∑ j,
      T j i * p i * (u i / p i - (T.mulVec u) j / (T.mulVec p) j) ^ 2 := by
    apply Finset.sum_nonneg
    intro i _
    apply Finset.sum_nonneg
    intro j _
    have hTj : 0 ≤ T j i := hT.1 j i
    have hpi : 0 ≤ p i := le_of_lt (hp i)
    exact mul_nonneg (mul_nonneg hTj hpi) (sq_nonneg _)
  linarith

end Statistical

/-! ## Symplectic geometry (Sections 2 and 3) -/

section Symplectic

/-- A symplectic form on a real vector space: bilinear, alternating, nondegenerate
(linear model of Definition 2.2; standard form of Theorem 3.3). -/
structure SymplecticForm (V : Type*) [AddCommGroup V] [Module ℝ V] where
  /-- The underlying bilinear form. -/
  form : V →ₗ[ℝ] V →ₗ[ℝ] ℝ
  /-- Alternating: `ω(v, v) = 0`. -/
  alternating : ∀ v, form v v = 0
  /-- Nondegenerate in the first slot. -/
  nondegenerate : ∀ v, (∀ w, form v w = 0) → v = 0

/-- Every symplectic form is skew-symmetric. -/
theorem SymplecticForm.skew {V : Type*} [AddCommGroup V] [Module ℝ V]
    (ω : SymplecticForm V) (u v : V) : ω.form u v = - ω.form v u := by
  have h := ω.alternating (u + v)
  simp only [map_add, LinearMap.add_apply] at h
  rw [ω.alternating u, ω.alternating v] at h
  simp only [zero_add, add_zero] at h
  linarith

/-- The standard symplectic form `ω₀ = Σᵢ dxᵢ ∧ dyᵢ` on `ℝⁿ × ℝⁿ`
(Theorem 3.3, target `Darboux`; Haskell witness `darboux`). -/
noncomputable def stdSymplecticForm (n : ℕ) : SymplecticForm ((Fin n → ℝ) × (Fin n → ℝ)) where
  form := LinearMap.mk₂ ℝ
    (fun u v => ∑ i, (u.1 i * v.2 i - u.2 i * v.1 i))
    (fun u₁ u₂ w => by
      simp only [Prod.fst_add, Prod.snd_add, Pi.add_apply]
      rw [← Finset.sum_add_distrib]
      exact Finset.sum_congr rfl fun i _ => by ring)
    (fun c u w => by
      simp only [Prod.smul_fst, Prod.smul_snd, Pi.smul_apply, smul_eq_mul]
      rw [Finset.mul_sum]
      exact Finset.sum_congr rfl fun i _ => by ring)
    (fun u w₁ w₂ => by
      simp only [Prod.fst_add, Prod.snd_add, Pi.add_apply]
      rw [← Finset.sum_add_distrib]
      exact Finset.sum_congr rfl fun i _ => by ring)
    (fun c u w => by
      simp only [Prod.smul_fst, Prod.smul_snd, Pi.smul_apply, smul_eq_mul]
      rw [Finset.mul_sum]
      exact Finset.sum_congr rfl fun i _ => by ring)
  alternating := fun v => by
    simp only [LinearMap.mk₂_apply]
    exact Finset.sum_eq_zero fun i _ => by ring
  nondegenerate := fun v hv => by
    obtain ⟨x, y⟩ := v
    have hx : ∀ k, x k = 0 := by
      intro k
      have hk := hv ⟨0, fun j => if j = k then (1 : ℝ) else 0⟩
      simp only [LinearMap.mk₂_apply] at hk
      simp only [Pi.zero_apply, mul_zero, sub_zero] at hk
      have hs : (∑ i, x i * (if i = k then (1 : ℝ) else 0)) = x k := by
        simp [Finset.sum_ite_eq']
      rw [hs] at hk
      exact hk
    have hy : ∀ k, y k = 0 := by
      intro k
      have hk := hv ⟨fun j => if j = k then (1 : ℝ) else 0, 0⟩
      simp only [LinearMap.mk₂_apply] at hk
      simp only [Pi.zero_apply, mul_zero, zero_sub] at hk
      simp only [Finset.sum_neg_distrib, neg_eq_zero] at hk
      have hs : (∑ i, y i * (if i = k then (1 : ℝ) else 0)) = y k := by
        simp [Finset.sum_ite_eq']
      rw [hs] at hk
      exact hk
    obtain rfl : x = 0 := funext hx
    obtain rfl : y = 0 := funext hy
    rfl

/-- Lemma 3.1 (engine of symplectic Gram–Schmidt): every nonzero vector has a
symplectic partner `w` with `ω(v, w) = 1`. -/
theorem exists_symplectic_partner {V : Type*} [AddCommGroup V] [Module ℝ V]
    (ω : SymplecticForm V) {v : V} (hv : v ≠ 0) :
    ∃ w, ω.form v w = 1 := by
  by_contra h
  push Not at h
  have hzero : ∀ w, ω.form v w = 0 := by
    intro w
    by_contra hw
    push Not at hw
    exact h ((ω.form v w)⁻¹ • w) (by
      rw [map_smul, smul_eq_mul]
      exact inv_mul_cancel₀ hw)
  exact hv (ω.nondegenerate v hzero)

end Symplectic

/-! ## Poisson geometry and coadjoint orbits (Sections 4 and 6) -/

section LiePoisson

variable {L : Type*} [LieRing L] [LieAlgebra ℝ L]

/-- The Kirillov–Kostant–Souriau two-form `ω_ξ(x, y) = ⟨ξ, [x, y]⟩`
(Theorem 4.4, target `KKSSymplectic`; Haskell witness `kksSymplecticForm`). -/
noncomputable def kksForm (ξ : Module.Dual ℝ L) (x y : L) : ℝ :=
  ξ ⁅x, y⁆

theorem kksForm_self (ξ : Module.Dual ℝ L) (x : L) : kksForm ξ x x = 0 := by
  simp [kksForm, lie_self]

theorem kksForm_skew (ξ : Module.Dual ℝ L) (x y : L) :
    kksForm ξ x y = - kksForm ξ y x := by
  simp only [kksForm]
  rw [← lie_skew, map_neg]

/-- The coadjoint stabilizer of `ξ`: the radical carrier of the KKS form at `ξ`
(the kernel of `ad*`, i.e. `g_ξ` in the proof of Theorem 4.4). -/
def coadjointStabilizer (ξ : Module.Dual ℝ L) (x : L) : Prop :=
  ∀ y, kksForm ξ x y = 0

/-- Theorem 4.4 (well-definedness part): the KKS form is insensitive to the
choice of representative modulo the stabilizer, so it descends to
`g / g_ξ ≅ T_ξ O`. -/
theorem kksForm_eq_of_sub_mem_stabilizer (ξ : Module.Dual ℝ L) (x x' y : L)
    (h : coadjointStabilizer ξ (x - x')) :
    kksForm ξ x y = kksForm ξ x' y := by
  have hz := h y
  simp only [kksForm] at hz ⊢
  rw [sub_lie, map_sub] at hz
  linarith

/-- The linear function `ℓ_x` on `g*` attached to `x ∈ g` (Example 4.3). -/
noncomputable def liePoissonLinear (x : L) : Module.Dual ℝ L →ₗ[ℝ] ℝ where
  toFun := fun ξ => ξ x
  map_add' := fun ξ η => by simp
  map_smul' := fun c ξ => by simp

/-- Example 4.3: the Lie–Poisson bracket of linear functions evaluated at `ξ`
is the KKS form: `{ℓ_x, ℓ_y}(ξ) = ⟨ξ, [x, y]⟩`. -/
theorem liePoissonLinear_bracket (x y : L) (ξ : Module.Dual ℝ L) :
    liePoissonLinear ⁅x, y⁆ ξ = kksForm ξ x y :=
  rfl

/-- Example 4.3: the Lie–Poisson bracket of linear functions is antisymmetric. -/
theorem liePoissonLinear_antisymm (x y : L) :
    liePoissonLinear ⁅x, y⁆ = - liePoissonLinear ⁅y, x⁆ := by
  apply LinearMap.ext
  intro ξ
  show ξ ⁅x, y⁆ = - ξ ⁅y, x⁆
  rw [← lie_skew, map_neg]

/-- Proposition 4.5 (`so(3)` case): with the cross-product bracket on
`so(3)* ≅ ℝ³`, the squared-norm Casimir satisfies `⟨ξ, [ξ, x]⟩ = 0` for all
`ξ, x`: the Hamiltonian vector field of the Casimir vanishes. -/
theorem so3_casimir (ξ x : Fin 3 → ℝ) : ξ ⬝ᵥ crossProduct ξ x = 0 :=
  dot_self_cross ξ x

end LiePoisson

/-! ## Integrable systems: monodromy (Section 7) -/

section Monodromy

/-- Example 7.5 / target `MonodromyObstruction`: the monodromy matrix of the
spherical pendulum's period lattice (Haskell witness `pendulumMonodromy`;
the computation is due to Duistermaat 1980). -/
def pendulumMonodromy : Matrix (Fin 2) (Fin 2) ℤ :=
  !![1, 1; 0, 1]

theorem pendulumMonodromy_det : pendulumMonodromy.det = 1 := by
  rw [pendulumMonodromy, Matrix.det_fin_two_of]
  norm_num

/-- The monodromy is nontrivial: parallel transport around the critical value
does not act as the identity on the period lattice. -/
theorem pendulumMonodromy_ne_one :
    pendulumMonodromy ≠ (1 : Matrix (Fin 2) (Fin 2) ℤ) := by
  intro h
  have h01 := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℤ => M 0 1) h
  simp [pendulumMonodromy] at h01

/-- The monodromy is unipotent: `(M - 1)² = 0`. -/
theorem pendulumMonodromy_unipotent :
    (pendulumMonodromy - 1) ^ 2 = (0 : Matrix (Fin 2) (Fin 2) ℤ) := by
  have hA : pendulumMonodromy - 1 = !![0, 1; 0, 0] := by
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [pendulumMonodromy, Matrix.sub_apply]
  rw [hA, pow_two]
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

end Monodromy

end Cmrps.Vol05

exec
/usr/local/bin/zsh -lc "sed -n '1,270p' lean/Cmrps/Vol09GravityInformationGeometry.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
/-
Copyright (c) 2026 The YonedaAI Collaboration. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.

# Vol. 9 — Gravity, Information, and Geometric Correspondence

Formalization of the tractable mechanization targets of
`verification/vol-09-gravity-information-geometry-lean-targets.md`, mirroring the
names of `papers/latex/vol-09-gravity-information-geometry.tex`.

Scope note. The classical information-geometric core is mechanized: the Fisher
metric and its monotonicity under stochastic maps (Proposition 3.2), the
second-order expansion of relative entropy along rays (Lemma 3.1, derivative
form), the Petz metric formula and its restriction to the commutative locus
(Proposition 4.4), the non-uniqueness of quantum monotone metrics on qubit
states (Proposition 4.2), the radial/transverse components of the qubit SLD
geometry (Proposition 5.1), and the log-coordinate form of the ideal-gas
Ruppeiner metric (Proposition 9.1). The survey theorems quoted from the
literature (Chentsov, Petz–Sudar, the holographic entropy cone), the full
hemisphere statement, and the fidelity identity are NOT mechanized here; they
are recorded in `verification/vol-09-gravity-information-geometry-claim-status.md`
and `verification/vol-09-gravity-information-geometry-conjectures.md`.

The Petz formula is stated on real tangent vectors, where `|X ij|²` of the
paper is `X ij ^ 2`; all computations the paper performs in real form
(Propositions 4.2, 4.4, 5.1) are covered by this form.
-/

import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Algebra.Order.BigOperators.Ring.Finset
import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Mathlib.Tactic

open BigOperators

namespace Cmrps.Vol09

/-! ## Definitions (paper: Section 2) -/

/-- Definition 2.3: a stochastic map with `m` output and `n` input outcomes, as an
`m × n` array `φ j i` of nonnegative entries with unit column sums
(`∑ j, φ j i = 1` for each `i`), acting on vectors by `(φ v) j = ∑ i, φ j i * v i`. -/
def IsStochastic {m n : ℕ} (φ : Fin m → Fin n → ℝ) : Prop :=
  (∀ j i, 0 ≤ φ j i) ∧ (∀ i, ∑ j, φ j i = 1)

/-- Action of a stochastic map on vectors (Definition 2.3): `p ↦ φ p`, and on tangent
vectors `u ↦ Dφ · u` (the same formula). -/
def stochApply {m n : ℕ} (φ : Fin m → Fin n → ℝ) (v : Fin n → ℝ) : Fin m → ℝ :=
  fun j => ∑ i, φ j i * v i

/-- Definition 2.2: the Fisher bilinear form `g_p(u, v) = ∑ i, u i * v i / p i`
on the interior of the probability simplex. -/
noncomputable def fisherBilinear {n : ℕ} (p u v : Fin n → ℝ) : ℝ := ∑ i, u i * v i / p i

/-- Definition 2.2: the Fisher quadratic form `g_p(u, u) = ∑ i, u i ^ 2 / p i`. -/
noncomputable def fisherMetric {n : ℕ} (p u : Fin n → ℝ) : ℝ := ∑ i, u i ^ 2 / p i

theorem fisherMetric_eq_bilinear {n : ℕ} (p u : Fin n → ℝ) :
    fisherMetric p u = fisherBilinear p u u := by
  simp [fisherMetric, fisherBilinear, pow_two]

/-- Lemma 3.1: the Kullback–Leibler divergence `D(q ‖ p) = ∑ i, q i * Real.log (q i / p i)`. -/
noncomputable def klDiv {n : ℕ} (q p : Fin n → ℝ) : ℝ := ∑ i, q i * Real.log (q i / p i)

/-- The perturbed distribution `p + t • u` of Lemma 3.1. -/
noncomputable def perturbed {n : ℕ} (p u : Fin n → ℝ) (t : ℝ) : Fin n → ℝ := fun i => p i + t * u i

/-- Relative entropy along the ray `p + t • u` (Lemma 3.1). -/
noncomputable def klRay {n : ℕ} (p u : Fin n → ℝ) (t : ℝ) : ℝ := klDiv (perturbed p u t) p

/-- First derivative in `t` of `klRay p u` (Lemma 3.1):
`∑ i, u i * Real.log ((p i + t * u i) / p i) + u i`. -/
noncomputable def klRayDeriv {n : ℕ} (p u : Fin n → ℝ) (t : ℝ) : ℝ :=
  ∑ i, (u i * Real.log ((p i + t * u i) / p i) + u i)

/-- Definition 2.7 (Eq. (2.7)): the Petz metric value of a real tangent vector `X`
at the diagonal state with eigenvalues `λ`, for the parameter function `f`:
`g^f(X, X) = ∑ i j, (X i j) ^ 2 / (λ i * f (λ j / λ i))`. -/
noncomputable def petzValue {d : ℕ} (f : ℝ → ℝ) (lam : Fin d → ℝ) (X : Fin d → Fin d → ℝ) : ℝ :=
  ∑ i, ∑ j, (X i j) ^ 2 / (lam i * f (lam j / lam i))

/-- Theorem 4.1: the symmetric-logarithmic-derivative parameter `f(t) = (1 + t) / 2`. -/
noncomputable def fSLD (t : ℝ) : ℝ := (1 + t) / 2

/-- Proposition 4.2: the Wigner–Yanase parameter `f(t) = (1 + √t)² / 4`. -/
noncomputable def fWY (t : ℝ) : ℝ := (1 + Real.sqrt t) ^ 2 / 4

theorem fSLD_one : fSLD 1 = 1 := by norm_num [fSLD]

theorem fWY_one : fWY 1 = 1 := by
  simp [fWY, Real.sqrt_one]
  norm_num

/-- Proposition 9.1: entropy of the ideal gas at fixed `N`,
`S = Nk (c_v log U + log V - (c_v + 1) log N)` (additive constant dropped). -/
noncomputable def idealGasEntropy (U V N cv k : ℝ) : ℝ :=
  N * k * (cv * Real.log U + Real.log V - (cv + 1) * Real.log N)

/-- Proposition 9.1: the Ruppeiner quadratic form of the ideal gas in the
coordinates `(U, V)` at fixed `N`, `g = Nk (c_v (dU/U)² + (dV/V)²)`. -/
noncomputable def ruppeinerForm (N k cv U V dU dV : ℝ) : ℝ :=
  N * k * (cv * (dU / U) ^ 2 + (dV / V) ^ 2)

/-- The Euclidean quadratic form `Nk (dy² + dz²)`. -/
noncomputable def euclideanForm (N k dy dz : ℝ) : ℝ := N * k * (dy ^ 2 + dz ^ 2)

/-- Proposition 5.1: the closed form of the SLD metric on the Bloch ball,
`g^sld = |dr|² + (r · dr)² / (1 - |r|²)`, in coordinates
`r = (r₁, r₂, r₃)`, `dr = (dr₁, dr₂, dr₃)`. -/
noncomputable def sldBlochForm (r₁ r₂ r₃ dr₁ dr₂ dr₃ : ℝ) : ℝ :=
  (dr₁ ^ 2 + dr₂ ^ 2 + dr₃ ^ 2) +
    (r₁ * dr₁ + r₂ * dr₂ + r₃ * dr₃) ^ 2 / (1 - (r₁ ^ 2 + r₂ ^ 2 + r₃ ^ 2))

/-! ## Proposition 3.2 — monotonicity of the Fisher metric (target 1) -/

/-- **Proposition 3.2** (`fisher_monotone_under_stochastic_maps`): the Fisher metric
is monotone under stochastic maps: `g_{φ p}(φ u, φ u) ≤ g_p(u, u)`.
The proof is the Cauchy–Schwarz argument of the paper; the tangent hypothesis
`∑ i, u i = 0` is not needed for the inequality. -/
theorem fisher_monotone_under_stochastic_maps
    {m n : ℕ} (φ : Fin m → Fin n → ℝ) (hφ : IsStochastic φ)
    (p u : Fin n → ℝ) (hp : ∀ i, 0 < p i) :
    fisherMetric (stochApply φ p) (stochApply φ u) ≤ fisherMetric p u := by
  have hφnn : ∀ j i, 0 ≤ φ j i := hφ.1
  have hφcol : ∀ i, ∑ j, φ j i = 1 := hφ.2
  have key : ∀ j, (stochApply φ u j) ^ 2 / stochApply φ p j ≤
      ∑ i, φ j i * (u i ^ 2 / p i) := by
    intro j
    have hq : 0 ≤ stochApply φ p j :=
      Finset.sum_nonneg fun i _ => mul_nonneg (hφnn j i) (hp i).le
    have hsum : 0 ≤ ∑ i, φ j i * (u i ^ 2 / p i) :=
      Finset.sum_nonneg fun i _ =>
        mul_nonneg (hφnn j i) (div_nonneg (sq_nonneg _) (hp i).le)
    refine div_le_of_le_mul₀ hq hsum ?_
    -- Cauchy–Schwarz in the form `r i ^ 2 ≤ f i * g i`
    have hcs := Finset.sum_sq_le_sum_mul_sum_of_sq_le_mul (s := Finset.univ)
      (r := fun i => φ j i * u i)
      (f := fun i => φ j i * (u i ^ 2 / p i))
      (g := fun i => φ j i * p i)
      (fun i _ => mul_nonneg (hφnn j i) (div_nonneg (sq_nonneg _) (hp i).le))
      (fun i _ => mul_nonneg (hφnn j i) (hp i).le)
      (fun i _ => by
        have hpi : p i ≠ 0 := (hp i).ne'
        have : (φ j i * u i) ^ 2 = φ j i * (u i ^ 2 / p i) * (φ j i * p i) := by
          field_simp [hpi] <;> ring
        exact this.le)
    have hs : ∑ i, φ j i * u i = stochApply φ u j := rfl
    have hs2 : ∑ i, φ j i * p i = stochApply φ p j := rfl
    rw [hs, hs2] at hcs
    exact hcs
  calc ∑ j, (stochApply φ u j) ^ 2 / stochApply φ p j
      ≤ ∑ j, ∑ i, φ j i * (u i ^ 2 / p i) := Finset.sum_le_sum (fun j _ => key j)
    _ = ∑ i, ∑ j, φ j i * (u i ^ 2 / p i) := Finset.sum_comm
    _ = ∑ i, (∑ j, φ j i) * (u i ^ 2 / p i) := by simp_rw [← Finset.sum_mul]
    _ = ∑ i, 1 * (u i ^ 2 / p i) := by simp_rw [hφcol]
    _ = ∑ i, u i ^ 2 / p i := by simp_rw [one_mul]

theorem fisher_monotone_under_stochastic_maps'
    {m n : ℕ} (φ : Fin m → Fin n → ℝ) (hφ : IsStochastic φ)
    (p u : Fin n → ℝ) (hp : ∀ i, 0 < p i) (hu : ∑ i, u i = 0) :
    fisherMetric (stochApply φ p) (stochApply φ u) ≤ fisherMetric p u :=
  fisher_monotone_under_stochastic_maps φ hφ p u hp

/-! ## Lemma 3.1 — second-order expansion of relative entropy (target 2) -/

/-- The derivative of each summand of `klRay` exists wherever the perturbed
entries stay positive. -/
theorem hasDerivAt_klRay {n : ℕ} (p u : Fin n → ℝ) (t : ℝ)
    (hp : ∀ i, 0 < p i) (ht : ∀ i, 0 < p i + t * u i) :
    HasDerivAt (klRay p u) (klRayDeriv p u t) t := by
  have hterm : ∀ i, HasDerivAt
      (fun s => (p i + s * u i) * Real.log ((p i + s * u i) / p i))
      (u i * Real.log ((p i + t * u i) / p i) + u i) t := by
    intro i
    have hpi : p i ≠ 0 := (hp i).ne'
    have hpos : p i + t * u i ≠ 0 := (ht i).ne'
    have hlin : HasDerivAt (fun s : ℝ => p i + s * u i) (u i) t := by
      have h1 : HasDerivAt (fun s : ℝ => s * u i) (1 * u i) t :=
        (hasDerivAt_id' t).mul_const (u i)
      have h2 : HasDerivAt (fun _ : ℝ => p i) 0 t := hasDerivAt_const t (p i)
      have := h2.add h1
      have hval0 : (0 + 1 * u i : ℝ) = u i := by ring
      rw [hval0] at this
      exact this
    have hdiv : HasDerivAt (fun s => (p i + s * u i) / p i) (u i / p i) t :=
      hlin.div_const (p i)
    have hlog : HasDerivAt (fun s => Real.log ((p i + s * u i) / p i))
        ((u i / p i) / ((p i + t * u i) / p i)) t :=
      hdiv.log (div_ne_zero hpos hpi)
    have hmul := hlin.mul hlog
    -- reduce the derivative value to `u i * log (...) + u i`
    have hval : (p i + t * u i) * ((u i / p i) / ((p i + t * u i) / p i)) = u i := by
      field_simp [hpos, hpi] <;> ring
    rw [hval] at hmul
    exact hmul
  have hsum : HasDerivAt
      (fun s => ∑ i, (p i + s * u i) * Real.log ((p i + s * u i) / p i))
      (∑ i, (u i * Real.log ((p i + t * u i) / p i) + u i)) t :=
    HasDerivAt.fun_sum fun i _ => hterm i
  have eqf : (fun s => ∑ i, (p i + s * u i) * Real.log ((p i + s * u i) / p i))
      = klRay p u := rfl
  have eqd : (∑ i, (u i * Real.log ((p i + t * u i) / p i) + u i)) = klRayDeriv p u t := rfl
  rw [eqf, eqd] at hsum
  exact hsum

/-- The derivative of `klRayDeriv` is `∑ i, u i ^ 2 / (p i + t * u i)`;
at `t = 0` this is the Fisher value `g_p(u, u)`. -/
theorem hasDerivAt_klRayDeriv {n : ℕ} (p u : Fin n → ℝ) (t : ℝ)
    (hp : ∀ i, 0 < p i) (ht : ∀ i, 0 < p i + t * u i) :
    HasDerivAt (klRayDeriv p u) (∑ i, u i ^ 2 / (p i + t * u i)) t := by
  have hterm : ∀ i, HasDerivAt
      (fun s => u i * Real.log ((p i + s * u i) / p i) + u i)
      (u i ^ 2 / (p i + t * u i)) t := by
    intro i
    have hpi : p i ≠ 0 := (hp i).ne'
    have hpos : p i + t * u i ≠ 0 := (ht i).ne'
    have hlin : HasDerivAt (fun s : ℝ => p i + s * u i) (u i) t := by
      have h1 : HasDerivAt (fun s : ℝ => s * u i) (1 * u i) t :=
        (hasDerivAt_id' t).mul_const (u i)
      have h2 : HasDerivAt (fun _ : ℝ => p i) 0 t := hasDerivAt_const t (p i)
      have := h2.add h1
      have hval0 : (0 + 1 * u i : ℝ) = u i := by ring
      rw [hval0] at this
      exact this
    have hdiv : HasDerivAt (fun s => (p i + s * u i) / p i) (u i / p i) t :=
      hlin.div_const (p i)
    have hlog : HasDerivAt (fun s => Real.log ((p i + s * u i) / p i))
        ((u i / p i) / ((p i + t * u i) / p i)) t :=
      hdiv.log (div_ne_zero hpos hpi)
    have hmul : HasDerivAt (fun s => u i * Real.log ((p i + s * u i) / p i))
        (u i * ((u i / p i) / ((p i + t * u i) / p i))) t :=
      hlog.const_mul (u i)
    have hval : u i * ((u i / p i) / ((p i + t * u i) / p i)) = u i ^ 2 / (p i + t * u i) := by
      field_simp [hpos, hpi] <;> ring
    have := hmul.add_const (u i)
    rw [hval] at this
    exact this
  have hsum : HasDerivAt
      (fun s => ∑ i, (u i * Real.log ((p i + s * u i) / p i) + u i))
      (∑ i, u i ^ 2 / (p i + t * u i)) t :=
    HasDerivAt.fun_sum fun i _ => hterm i
  have eqf : (fun s => ∑ i, (u i * Real.log ((p i + s * u i) / p i) + u i))
      = klRayDeriv p u := rfl
  rw [eqf] at hsum
  exact hsum

/-- **Lemma 3.1** (`fisher_second_order_kl`): along the ray `p + t • u` through an
interior point with tangent direction (`∑ i, u i = 0`), the relative entropy
satisfies `D(p + t•u ‖ p) = t² / 2 · g_p(u, u) + O(t³)`; we machine-check the
derivative content: `h(0) = 0`, `h'(0) = 0`, and the second derivative of the ray
at `0` is the Fisher value `g_p(u, u)` (the `O(t³)` remainder form is the
informal part). -/
theorem fisher_second_order_kl {n : ℕ} (p u : Fin n → ℝ)
    (hp : ∀ i, 0 < p i) (hu : ∑ i, u i = 0) :
    klRay p u 0 = 0 ∧
    deriv (klRay p u) 0 = 0 ∧
    deriv (klRayDeriv p u) 0 = fisherMetric p u := by
  have ht0 : ∀ i, 0 < p i + 0 * u i := by
    intro i
    simpa using hp i
  have h1 : HasDerivAt (klRay p u) (klRayDeriv p u 0) 0 :=
    hasDerivAt_klRay p u 0 hp ht0
  have h2 : HasDerivAt (klRayDeriv p u) (∑ i, u i ^ 2 / (p i + 0 * u i)) 0 :=
    hasDerivAt_klRayDeriv p u 0 hp ht0
  refine ⟨?_, ?_, ?_⟩
  · -- `D(p ‖ p) = 0`
    have : ∀ i, (p i + 0 * u i) * Real.log ((p i + 0 * u i) / p i) = 0 := by
      intro i
      rw [zero_mul, add_zero, div_self (hp i).ne', Real.log_one, mul_zero]

exec
/usr/local/bin/zsh -lc "sed -n '271,540p' lean/Cmrps/Vol09GravityInformationGeometry.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
    simp [klRay, klDiv, perturbed, this]
  · -- `h'(0) = ∑ i, u i = 0`
    rw [h1.deriv]
    have : klRayDeriv p u 0 = ∑ i, u i := by
      have hi : ∀ i, (p i + 0 * u i) / p i = 1 := by
        intro i
        rw [zero_mul, add_zero, div_self (hp i).ne']
      simp [klRayDeriv, hi, Real.log_one, mul_zero, zero_add, add_zero]
    rw [this, hu]
  · -- second derivative of the ray at `0` is `g_p(u, u)`
    rw [h2.deriv]
    have : (∑ i, u i ^ 2 / (p i + 0 * u i)) = fisherMetric p u := by
      simp [fisherMetric, zero_mul, add_zero]
    rw [this]

/-! ## Proposition 4.4 — commutative locus (target 6) -/

/-- **Proposition 4.4** (`monotone_metrics_restrict_to_fisher_on_commutative_locus`):
for diagonal tangent vectors the Petz value is the Fisher value `∑ i, X i i ^ 2 / λ i`,
for every parameter function `f` normalized by `f 1 = 1`. -/
theorem monotone_metrics_restrict_to_fisher_on_commutative_locus
    {d : ℕ} (f : ℝ → ℝ) (hf : f 1 = 1) (lam : Fin d → ℝ) (hlam : ∀ i, lam i ≠ 0)
    (X : Fin d → Fin d → ℝ) (hdiag : ∀ i j, i ≠ j → X i j = 0) :
    petzValue f lam X = ∑ i, X i i ^ 2 / lam i := by
  have hrow : ∀ i, ∑ j, (X i j) ^ 2 / (lam i * f (lam j / lam i)) = (X i i) ^ 2 / lam i := by
    intro i
    have hsingle : ∑ j, (X i j) ^ 2 / (lam i * f (lam j / lam i))
        = (X i i) ^ 2 / (lam i * f (lam i / lam i)) :=
      Finset.sum_eq_single i
        (fun j _ hj => by rw [hdiag i j (Ne.symm hj), pow_two, zero_mul, zero_div])
        (fun hi => absurd (Finset.mem_univ i) hi)
    rw [hsingle, div_self (hlam i), hf, mul_one]
  simp only [petzValue]
  exact Finset.sum_congr rfl fun i _ => hrow i

/-! ## Proposition 4.2 — non-uniqueness of quantum monotone metrics (target 5) -/

/-- Qubit eigenvalues `λ = (3/4, 1/4)` of Proposition 4.2. -/
noncomputable def lam42 : Fin 2 → ℝ := fun i => if i = 0 then 3 / 4 else 1 / 4

/-- Transverse tangent `X = σ_x / 2` of Proposition 4.2: `X 0 1 = X 1 0 = 1/2`,
diagonal entries `0`. -/
noncomputable def Xtrans : Fin 2 → Fin 2 → ℝ := fun i j => if i = j then 0 else 1 / 2

/-- Radial tangent `Y = σ_z / 2` of Proposition 4.2: `Y 0 0 = 1/2`, `Y 1 1 = -1/2`,
off-diagonal entries `0`. -/
noncomputable def Yrad : Fin 2 → Fin 2 → ℝ :=
  fun i j => if i = j then (if i = 0 then 1 / 2 else -1 / 2) else 0

lemma lam42_0 : lam42 0 = 3 / 4 := if_pos rfl
lemma lam42_1 : lam42 1 = 1 / 4 := if_neg (by decide)

lemma Xtrans_00 : Xtrans 0 0 = 0 := if_pos rfl
lemma Xtrans_01 : Xtrans 0 1 = 1 / 2 := if_neg (by decide)
lemma Xtrans_10 : Xtrans 1 0 = 1 / 2 := if_neg (by decide)
lemma Xtrans_11 : Xtrans 1 1 = 0 := if_pos rfl

lemma Yrad_00 : Yrad 0 0 = 1 / 2 := by rw [Yrad, if_pos rfl, if_pos rfl]
lemma Yrad_01 : Yrad 0 1 = 0 := if_neg (by decide)
lemma Yrad_10 : Yrad 1 0 = 0 := if_neg (by decide)
lemma Yrad_11 : Yrad 1 1 = -1 / 2 := by rw [Yrad, if_pos rfl, if_neg (by decide)]

lemma petzValue_fSLD_Xtrans : petzValue fSLD lam42 Xtrans = 1 := by
  simp only [petzValue, Fin.sum_univ_two]
  rw [lam42_0, lam42_1, Xtrans_00, Xtrans_01, Xtrans_10, Xtrans_11]
  simp only [fSLD]
  norm_num

lemma petzValue_fSLD_Yrad : petzValue fSLD lam42 Yrad = 4 / 3 := by
  simp only [petzValue, Fin.sum_univ_two]
  rw [lam42_0, lam42_1, Yrad_00, Yrad_01, Yrad_10, Yrad_11]
  simp only [fSLD]
  norm_num

lemma sqrt_three_quarter : Real.sqrt (3 / 4) = Real.sqrt 3 / 2 := by
  rw [show (3 / 4 : ℝ) = 3 / 2 ^ 2 by norm_num, Real.sqrt_div (by norm_num),
    Real.sqrt_sq (by norm_num)]

lemma sqrt_one_quarter : Real.sqrt (1 / 4) = 1 / 2 := by
  rw [show (1 / 4 : ℝ) = (1 / 2) ^ 2 by norm_num, Real.sqrt_sq (by norm_num)]

lemma mul_fWY {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
    a * fWY (b / a) = (Real.sqrt a + Real.sqrt b) ^ 2 / 4 := by
  have hne : Real.sqrt a ≠ 0 := (Real.sqrt_ne_zero').2 ha
  have hs : Real.sqrt (b / a) = Real.sqrt b / Real.sqrt a := Real.sqrt_div hb.le a
  have hsq : Real.sqrt a ^ 2 = a := Real.sq_sqrt ha.le
  have h1 : 1 + Real.sqrt b / Real.sqrt a = (Real.sqrt a + Real.sqrt b) / Real.sqrt a := by
    field_simp [hne]
  have h2 : ((Real.sqrt a + Real.sqrt b) / Real.sqrt a) ^ 2
      = (Real.sqrt a + Real.sqrt b) ^ 2 / a := by
    rw [div_pow, hsq]
  simp only [fWY]
  rw [hs, h1, h2]
  field_simp [ha.ne'] <;> ring

lemma petzValue_fWY_Xtrans : petzValue fWY lam42 Xtrans = 4 * (2 - Real.sqrt 3) := by
  have h3 : Real.sqrt 3 * Real.sqrt 3 = 3 := Real.mul_self_sqrt (by norm_num)
  have h3p : 0 < Real.sqrt 3 := Real.sqrt_pos.mpr (by norm_num)
  have h3ne : Real.sqrt 3 ≠ 2 := by
    intro h
    have := congrArg (· * Real.sqrt 3) h
    simp [h3] at this
    nlinarith [h3]
  have ha : (0:ℝ) < 3 / 4 := by norm_num
  have hb : (0:ℝ) < 1 / 4 := by norm_num
  have hA : ((Real.sqrt 3 / 2 + 1 / 2) ^ 2 / 4 : ℝ) = (2 + Real.sqrt 3) / 8 := by
    have h1 : Real.sqrt 3 / 2 + 1 / 2 = (Real.sqrt 3 + 1) / 2 := by ring
    rw [h1, div_pow]
    have hsq : (Real.sqrt 3 + 1) ^ 2 = 4 + 2 * Real.sqrt 3 := by nlinarith [h3]
    rw [hsq]
    ring
  have hB : ((1 / 2 + Real.sqrt 3 / 2) ^ 2 / 4 : ℝ) = (2 + Real.sqrt 3) / 8 := by
    have h1 : (1:ℝ) / 2 + Real.sqrt 3 / 2 = (Real.sqrt 3 + 1) / 2 := by ring
    rw [h1, div_pow]
    have hsq : (Real.sqrt 3 + 1) ^ 2 = 4 + 2 * Real.sqrt 3 := by nlinarith [h3]
    rw [hsq]
    ring
  have t01 : (Xtrans 0 1) ^ 2 / (lam42 0 * fWY (lam42 1 / lam42 0))
      = (1 / 2) ^ 2 / ((Real.sqrt 3 / 2 + 1 / 2) ^ 2 / 4) := by
    rw [Xtrans_01, lam42_0, lam42_1, mul_fWY ha hb, sqrt_three_quarter, sqrt_one_quarter]
  have t10 : (Xtrans 1 0) ^ 2 / (lam42 1 * fWY (lam42 0 / lam42 1))
      = (1 / 2) ^ 2 / ((1 / 2 + Real.sqrt 3 / 2) ^ 2 / 4) := by
    rw [Xtrans_10, lam42_1, lam42_0, mul_fWY hb ha, sqrt_one_quarter, sqrt_three_quarter]
  have hz : (0:ℝ) ^ 2 = 0 := by norm_num
  simp only [petzValue, Fin.sum_univ_two, Xtrans_00, Xtrans_11, hz,
    zero_div, add_zero, zero_add]
  rw [t01, t10, hA, hB]
  have h2x : (2:ℝ) + Real.sqrt 3 ≠ 0 := by nlinarith [h3p]
  field_simp [h2x]
  nlinarith [h3]

lemma petzValue_fWY_Yrad : petzValue fWY lam42 Yrad = 4 / 3 := by
  have hz : (0:ℝ) ^ 2 = 0 := by norm_num
  have h34 : ((3 / 4 : ℝ) / (3 / 4)) = 1 := by norm_num
  have h14 : ((1 / 4 : ℝ) / (1 / 4)) = 1 := by norm_num
  simp only [petzValue, Fin.sum_univ_two, lam42_0, lam42_1, Yrad_00, Yrad_01, Yrad_10,
    Yrad_11, h34, h14, fWY_one, mul_one, hz, zero_div, add_zero, zero_add]
  norm_num

/-- **Proposition 4.2** (`quantum_monotone_metrics_not_unique`): at
`ρ = diag(3/4, 1/4)` the symmetric logarithmic derivative and Wigner–Yanase
metrics give radial-to-transverse ratios `4/3` and `(2 + √3)/3` on
`X = σ_x / 2`, `Y = σ_z / 2`, hence are not proportional. -/
theorem quantum_monotone_metrics_not_unique :
    petzValue fSLD lam42 Xtrans = 1 ∧
    petzValue fSLD lam42 Yrad = 4 / 3 ∧
    petzValue fWY lam42 Xtrans = 4 * (2 - Real.sqrt 3) ∧
    petzValue fWY lam42 Yrad = 4 / 3 ∧
    petzValue fSLD lam42 Yrad / petzValue fSLD lam42 Xtrans = 4 / 3 ∧
    petzValue fWY lam42 Yrad / petzValue fWY lam42 Xtrans = (2 + Real.sqrt 3) / 3 ∧
    ¬ ∃ c : ℝ, petzValue fWY lam42 Xtrans = c * petzValue fSLD lam42 Xtrans ∧
        petzValue fWY lam42 Yrad = c * petzValue fSLD lam42 Yrad := by
  have h3 : Real.sqrt 3 * Real.sqrt 3 = 3 := Real.mul_self_sqrt (by norm_num)
  have h3p : 0 < Real.sqrt 3 := Real.sqrt_pos.mpr (by norm_num)
  have h3ne : Real.sqrt 3 ≠ 2 := by
    intro h
    have := congrArg (· * Real.sqrt 3) h
    simp [h3] at this
    nlinarith [h3]
  have h2s : (2:ℝ) - Real.sqrt 3 ≠ 0 := by
    intro h
    nlinarith [h3p]
  have vX := petzValue_fSLD_Xtrans
  have vY := petzValue_fSLD_Yrad
  have wX := petzValue_fWY_Xtrans
  have wY := petzValue_fWY_Yrad
  refine ⟨vX, vY, wX, wY, ?_, ?_, ?_⟩
  · rw [vY, vX]
    norm_num
  · rw [wY, wX]
    field_simp [h2s, h3ne, h3p.ne']
    nlinarith [h3]
  · rintro ⟨c, hx, hy⟩
    rw [vX] at hx
    rw [vY] at hy
    rw [wX] at hx
    rw [wY] at hy
    have hc : c = 1 := by nlinarith [hy]
    subst hc
    simp at hx
    nlinarith [h3]

/-! ## Proposition 5.1 — qubit SLD geometry, radial and transverse components
(target 7, partial) -/

/-- Eigenvalues `λ± = (1 ± s)/2` of the qubit state with Bloch radius `s` along
the third axis. -/
noncomputable def lamQubit (s : ℝ) : Fin 2 → ℝ := fun i => if i = 0 then (1 + s) / 2 else (1 - s) / 2

lemma lamQubit_0 (s : ℝ) : lamQubit s 0 = (1 + s) / 2 := if_pos rfl
lemma lamQubit_1 (s : ℝ) : lamQubit s 1 = (1 - s) / 2 := if_neg (by decide)

/-- Proposition 5.1, transverse component: at Bloch radius `s` the SLD value of
`X = σ_x / 2` equals `1`, the transverse value of the closed form. -/
theorem sld_qubit_transverse (s : ℝ) (hs : 0 < s) (hs' : s < 1) :
    petzValue fSLD (lamQubit s) Xtrans = 1 := by
  have hp0 : (1 + s) / 2 ≠ 0 := by nlinarith
  have hp1 : (1 - s) / 2 ≠ 0 := by nlinarith
  have h01 : (1 + s) / 2 + (1 - s) / 2 = 1 := by ring
  simp only [petzValue, Fin.sum_univ_two]
  rw [lamQubit_0, lamQubit_1, Xtrans_00, Xtrans_01, Xtrans_10, Xtrans_11]
  simp only [fSLD]
  field_simp [hp0, hp1, h01]
  ring

/-- Proposition 5.1, radial component: at Bloch radius `s` the SLD value of
`Y = σ_z / 2` equals `1 / (1 - s²)`, the radial value of the closed form
`|dr|² + (r · dr)² / (1 - |r|²)` at `dr = e₃`. -/
theorem sld_qubit_radial (s : ℝ) (hs : 0 < s) (hs' : s < 1) :
    petzValue fSLD (lamQubit s) Yrad = 1 / (1 - s ^ 2) := by
  have hp0 : (1 + s) / 2 ≠ 0 := by nlinarith
  have hp1 : (1 - s) / 2 ≠ 0 := by nlinarith
  have hs2 : 1 - s ^ 2 ≠ 0 := by nlinarith [mul_self_pos.mpr (ne_of_gt hs)]
  simp only [petzValue, Fin.sum_univ_two]
  rw [lamQubit_0, lamQubit_1, Yrad_00, Yrad_01, Yrad_10, Yrad_11,
    div_self hp0, div_self hp1, fSLD_one, mul_one]
  field_simp [hp0, hp1, hs2]
  ring

/-- Proposition 5.1 closed form on the transverse axis: `|dr|² + (r·dr)²/(1-|r|²)`
at `r = (0, 0, s)`, `dr = (1, 0, 0)` equals `1`. -/
theorem sldBlochForm_transverse (s : ℝ) (hs : s ^ 2 < 1) :
    sldBlochForm 0 0 s 1 0 0 = 1 := by
  have h : 1 - (0 ^ 2 + 0 ^ 2 + s ^ 2) ≠ 0 := by nlinarith
  simp [sldBlochForm, h] <;> field_simp <;> ring

/-- Proposition 5.1 closed form on the radial axis: `|dr|² + (r·dr)²/(1-|r|²)`
at `r = (0, 0, s)`, `dr = (0, 0, 1)` equals `1 / (1 - s²)`. -/
theorem sldBlochForm_radial (s : ℝ) (hs : s ^ 2 < 1) :
    sldBlochForm 0 0 s 0 0 1 = 1 / (1 - s ^ 2) := by
  have h : 1 - (0 ^ 2 + 0 ^ 2 + s ^ 2) ≠ 0 := by nlinarith
  simp [sldBlochForm, h]
  field_simp
  ring

/-! ## Proposition 9.1 — ideal-gas Ruppeiner geometry (target 9, partial) -/

/-- Proposition 9.1 (content of its proof): in the coordinates `y = √c_v · log U`,
`z = log V` the ideal-gas Ruppeiner quadratic form becomes the constant Euclidean
form `Nk (dy² + dz²)`; the Ricci-scalar vanishing follows (recorded informally). -/
theorem ideal_gas_ruppeiner_flat (N k cv U V dU dV : ℝ) (hcv : 0 ≤ cv) :
    ruppeinerForm N k cv U V dU dV =
      euclideanForm N k (Real.sqrt cv * (dU / U)) (dV / V) := by
  simp only [ruppeinerForm, euclideanForm, mul_pow, Real.sq_sqrt hcv]

end Cmrps.Vol09

exec
/usr/local/bin/zsh -lc "rg -n '\\\\begin\\{(theorem|proposition|lemma|corollary|definition)\\}|self.recip|operator.monot|NotFactor|factoriz|factoris|parameteriz|parametris|reconstruct|cotangent' papers/latex/vol-10-observational-equivalence.tex papers/latex/vol-12-principia-physica.tex papers/latex/vol-04-yoneda-classification.tex papers/latex/vol-02-structural-families.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
papers/latex/vol-02-structural-families.tex:61:The classification of finite simple groups supplies the architectural analogy for this program: complicated structures understood through simpler constituents, gathered into families, with a short list of exceptions recorded beside them \cite{cfsg,solomon}. The analogy is instructive and it is also incomplete. The template program is complete and a uniform description analogous to the Dynkin diagrams is missing from it: the assessment attributed to Gorenstein that ``no one has yet found a clean uniform description of the finite simple groups'' is recorded in the survey literature \cite{cfsg,solomon}. Classification and parameterization are separate achievements, and the template program has achieved the first without the second.
papers/latex/vol-02-structural-families.tex:65:Four results carry the argument. \Cref{thm:sharpness} bounds the shape of any classification by the shape of the classifying invariant: a family whose invariant takes values in a finite set has finitely many classes, a family with uncountably many classes admits no invariant into a countable set, and a family whose classes are the image of a morphism of finite type is parameterized by a constructible set. \Cref{prop:globality} shows that inside the symplectic family every local invariant is constant, so classification content there is global and topological. \Cref{prop:closure} shows that a class of objects irreducible under direct sum is never closed under direct sum, so passing to a closure always adds objects. \Cref{prop:independence} shows that two families may both carry classifying invariants and still fail to be logically independent.
papers/latex/vol-02-structural-families.tex:67:\Cref{sec:defs} fixes notation and the record structures. \Cref{sec:discipline} states the invariant discipline and the sharpness criterion. The ten families are treated in turn across \Cref{sec:family1} to \Cref{sec:family10}. \Cref{sec:exceptional} treats simple objects and their failure to close. \Cref{sec:independence} treats independence and reconstructability. \Cref{sec:limitations} records what the taxonomy cannot support. \Cref{sec:conclusion} concludes. An appendix records the computational evidence and where it lives.
papers/latex/vol-02-structural-families.tex:74:\begin{definition}[Morphism of records]
papers/latex/vol-02-structural-families.tex:81:\begin{definition}[Family record]
papers/latex/vol-02-structural-families.tex:86:\begin{definition}[Invariant-complete sector]
papers/latex/vol-02-structural-families.tex:91:\begin{definition}[Structural family]
papers/latex/vol-02-structural-families.tex:93:A \emph{structural family} is a family record $(\mathfrak{F}, V, I)$ whose objects are singled out by the mathematical structure of their state space, observable algebra, or both. The families are defined by the structure each one singles out and not by a partition of records, so a record whose components carry structure of several kinds belongs to each of the corresponding families. A structural family is \emph{fundamental} for a class of physical systems when every object in that class lies in the closure of the family under the admissible constructions. The admissible constructions are tensor product, direct sum, extension, limits and colimits, factorization, and quotient or symmetry reduction.
papers/latex/vol-02-structural-families.tex:103:\begin{proposition}[Component invariants are not classifying in general]
papers/latex/vol-02-structural-families.tex:124:\begin{definition}[Invariant record]
papers/latex/vol-02-structural-families.tex:136:\begin{theorem}[Sharpness criterion]
papers/latex/vol-02-structural-families.tex:142:\item Suppose in addition that $V$ carries the structure of a variety over an algebraically closed field $k$, that $W$ is a $k$-variety, and that $f \colon W \to V$ is a morphism of finite type whose image $f(W(k))$ contains every attained value of $I$. Then the attained values of $I$ form a constructible subset of $V$, and $\mathfrak{F}/\!\simeq$ injects into it. The content of the claim is the constructibility, which is a parameterization statement; the injectivity is part (1) and is not what this part adds.
papers/latex/vol-02-structural-families.tex:148:For the first claim, $I$ is constant on $\simeq$-classes, so the assignment is well defined on classes, and completeness gives injectivity. The second claim is the cardinality of a subset of a finite set. For the third claim, Chevalley's theorem states that the image of a morphism of finite type between varieties over an algebraically closed field is constructible. The hypothesis places the attained values of $I$ inside $f(W(k))$, so they form a subset of a constructible set and the classes inject into that subset by part (1). What the hypothesis buys is not the injectivity but the geometry: the classes are then described by the points of an explicitly constructible set, which is the parameterization that part (3) claims. No identification of $V$ with the set of its $k$-points is being made: the invariant $I$ is a map of sets in general, and part (3) is the case in which its range happens to carry a variety structure and its attained values happen to lie in the image of a finite-type morphism. The fourth claim is the contrapositive of the first: an injection from an uncountable set into a countable set does not exist.
papers/latex/vol-02-structural-families.tex:151:\begin{corollary}[Parameterization is a stronger achievement]
papers/latex/vol-02-structural-families.tex:152:\label{cor:parameterization}
papers/latex/vol-02-structural-families.tex:153:A family with a finite invariant range is classified into finitely many classes, and a family is parameterized only when its attained values form a constructible or otherwise explicitly described subset of a structured range. Classification and parameterization are separate achievements.
papers/latex/vol-02-structural-families.tex:156:\Cref{cor:parameterization} recovers the template program's own situation in the form that applies to it. The finite simple groups have infinitely many isomorphism classes, so no finite invariant range classifies them; they are classified, and a uniform parameterization analogous to Dynkin diagrams is missing \cite{cfsg,solomon}. Practical identification there runs through the atlas data instead \cite{atlas}, which is a recognition procedure in the sense of \Cref{prop:recognition-cost} and not a parameterization.
papers/latex/vol-02-structural-families.tex:163:\begin{proposition}[Globality of classification in the symplectic family]
papers/latex/vol-02-structural-families.tex:172:\begin{corollary}
papers/latex/vol-02-structural-families.tex:184:\begin{definition}[Achievement kind]
papers/latex/vol-02-structural-families.tex:186:Let $\mathcal{S}$ be a sector together with a statement of what is classified and up to which equivalence. Three conditions attach to $\mathcal{S}$ and together determine its \emph{achievement kind}. The first is whether a theorem on record names a classifying invariant for $\mathcal{S}$; this is an epistemic condition about the literature and not a claim that no set-theoretic invariant exists, since the assignment sending an object to its own equivalence class is always a classifying invariant of sets. The second is what a recorded classification classifies: existing objects, or obstructions to the existence of objects. The third, available only when the first two conditions name objects, is whether the attained values of the invariant form an explicitly described subset of a structured range. The resulting kinds are: \emph{complete and parameterized}, \emph{complete and unparameterized}, \emph{complete as an obstruction classification}, \emph{impossible}, and \emph{no record}. A sector is \emph{impossible} when a theorem on record proves that no classifying invariant of the prescribed type into a set of the required cardinality exists. A sector has \emph{no record} when no theorem names a classifying invariant and no impossibility theorem is on record.
papers/latex/vol-02-structural-families.tex:189:\begin{proposition}[The kinds are exhaustive]
papers/latex/vol-02-structural-families.tex:198:The five kinds are realized in the families below. The Killing-Cartan and highest weight classifications are complete and parameterized \cite{lie,hw}. The finite simple groups are classified and not uniformly parameterized \cite{cfsg,solomon}. Anomalies are classified as obstructions to quantization \cite{anomaly}. General separable type $\mathrm{II}_1$ factors are impossible to classify \cite{vnalg}. Sectors with no record at all, such as the semigroup family, realize the fifth kind, and \Cref{prop:kinds} accounts for them rather than excluding them.
papers/latex/vol-02-structural-families.tex:209:Complete and parameterized & Complex semisimple Lie algebras \cite{lie}, finite-dimensional irreducible representations \cite{hw}, finite-dimensional $C^*$-algebras \cite{calg} & Dynkin diagram, dominant integral weight, dimension vector \\
papers/latex/vol-02-structural-families.tex:210:Complete and unparameterized & Finite simple groups \cite{cfsg,solomon} & Atlas data, with no uniform description \\
papers/latex/vol-02-structural-families.tex:225:\subsection{A cotangent bundle in the symplectic family}
papers/latex/vol-02-structural-families.tex:226:\label{sec:cotangent}
papers/latex/vol-02-structural-families.tex:228:Let $Q$ be a smooth manifold and $M = T^*Q$ with its canonical symplectic form $\omega = d\theta$, where $\theta$ is the tautological one-form. The record is: state space $M$, observables $C^\infty(M)$, dynamics the Hamiltonian flow of a smooth function $H$, symmetries the cotangent lifts of diffeomorphisms of $Q$ preserving $H$, and composition the product of systems with the product symplectic form.
papers/latex/vol-02-structural-families.tex:232:\begin{proposition}[Global invariants of a cotangent bundle]
papers/latex/vol-02-structural-families.tex:233:\label{prop:cotangent}
papers/latex/vol-02-structural-families.tex:241:\Cref{prop:cotangent} supplies an invariant and not a complete one. Two homotopy-equivalent bases need not have symplectomorphic cotangent bundles, and the record also carries the Hamiltonian $H$, which the homotopy type does not see. The scope of the record is therefore the homotopy data of the base, and the record does not claim more.
papers/latex/vol-02-structural-families.tex:255:By \Cref{thm:bundles} the classifying invariant of the underlying topological bundle is the first Chern class, which takes values in $H^2(S^2; \mathbb{Z}) \cong \mathbb{Z}$. The invariant range is countably infinite and every integer is attained, so the topological sector is classified and not finite. It is an instance of the distinction in \Cref{cor:parameterization}: the classification is complete, and the range is an explicit discrete group in which the attained values are described. The invariant classifies the bundle and not the space of connections on it, which is an affine space and carries no such discrete invariant.
papers/latex/vol-02-structural-families.tex:262:\begin{proposition}[Induced operations on the dimension vector]
papers/latex/vol-02-structural-families.tex:278:\begin{proposition}[Invariance under equivalence only]
papers/latex/vol-02-structural-families.tex:302:\begin{proposition}[Recognition cost]
papers/latex/vol-02-structural-families.tex:320:\begin{theorem}[Poisson local models]
papers/latex/vol-02-structural-families.tex:336:\begin{theorem}[Structure of finite-dimensional unital complex $C^*$-algebras]
papers/latex/vol-02-structural-families.tex:365:\begin{proposition}[Recognition without classification]
papers/latex/vol-02-structural-families.tex:381:\begin{theorem}[Classification of principal bundles]
papers/latex/vol-02-structural-families.tex:397:\begin{theorem}[Chentsov]
papers/latex/vol-02-structural-families.tex:402:The quantum analogue fails to be unique. Monotone metrics on quantum state spaces are classified parametrically by operator monotone functions, which form a continuum and not a finite list \cite{petz}. Classical uniqueness therefore does not transfer to the quantum case, and any classification statement in this family must record which side of that line it stands on.
papers/latex/vol-02-structural-families.tex:406:The uniqueness is a statement about metrics monotone under stochastic maps on the classical state space. It is not a classification of classical statistical systems, and it is not a statement about quantum state spaces. Uniqueness and classification are separate achievements, as \Cref{cor:parameterization} records.
papers/latex/vol-02-structural-families.tex:418:The quantum analogue of the same two-point system has a state space of $2 \times 2$ density matrices and a continuum of monotone metrics, parametrized by operator monotone functions \cite{petz}. The classical row is therefore a uniqueness statement of a kind the quantum row does not have.
papers/latex/vol-02-structural-families.tex:444:\begin{theorem}[Stinespring]
papers/latex/vol-02-structural-families.tex:451:\begin{proposition}[Kraus rank is not injective on channels]
papers/latex/vol-02-structural-families.tex:471:\begin{theorem}[Structure preservation is load-bearing]
papers/latex/vol-02-structural-families.tex:483:The proved results are regime-restricted and the impossibility results are not. Lattice gauge results hold in restricted regimes and do not by themselves close a continuum limit. The obstructions recorded against this family come from wild representation theory, and the underlying mathematics is commutative algebra and equivariant homotopy theory, which the taxonomy places in Family X. On the commutative side, rank-two isomorphism classes of maximal Cohen-Macaulay modules over the generic determinantal ring admit no parameterization by a finite-dimensional variety \cite{buchweitz}. On the equivariant side, the compact modules over the equivariant Eilenberg-MacLane spectrum $H\underline{\mathbb{F}}_p$ at an odd prime $p$ are wild \cite{grevstad}, and the qualifier is load-bearing: modules over the group ring $\mathbb{F}_p[C_p]$ have finite representation type, so the claim is false if the spectrum coefficient is dropped. A companion boundary is algorithmic and lives in this family: an isomorphism test running in polynomial time exists for groups that are tame extensions, so the tame and wild regimes are separated by an algorithmic boundary as well \cite{grochow}.
papers/latex/vol-02-structural-families.tex:485:\begin{corollary}
papers/latex/vol-02-structural-families.tex:487:By \Cref{thm:sharpness}, a sector whose classes admit no parameterization by a finite-dimensional variety admits no invariant-complete record whose range is a finite-dimensional variety. The obstruction is a statement about the range of any candidate invariant.
papers/latex/vol-02-structural-families.tex:502:Every finite-dimensional algebra over an algebraically closed field falls on one side of the tame-wild dichotomy for derived categories \cite{bekkert}. This family is the home of the wild-side obstructions that Family IX inherits: the non-parameterization of rank-two isomorphism classes of maximal Cohen-Macaulay modules over the generic determinantal ring \cite{buchweitz}, and the wildness of the compact modules over $H\underline{\mathbb{F}}_p$ at an odd prime \cite{grevstad}. Beyond the dichotomy no classification is claimed.
papers/latex/vol-02-structural-families.tex:534:\begin{proposition}[Irreducible classes do not close]
papers/latex/vol-02-structural-families.tex:545:\section{Independence and reconstructability}
papers/latex/vol-02-structural-families.tex:548:A natural hope is that the ten families are logically independent, so that no family can be rebuilt from another. What the literature proves is a mixture of reconstruction theorems and counterexamples to reconstruction.
papers/latex/vol-02-structural-families.tex:553:\caption{Reconstruction and non-reconstruction results. The first four rows relate distinct families; the fifth compares two sectors of one family. Each row states the verdict and the structure the equivalence preserves.}
papers/latex/vol-02-structural-families.tex:561:Symmetric tensor categories with conjugates and compact supergroups & Reconstructable & Doplicher-Roberts reconstruction preserves the symmetric structure \cite{dr,dhr} \\
papers/latex/vol-02-structural-families.tex:562:Plain tensor categories and the underlying finite group & Not reconstructable & No symmetric structure is preserved, and the group is lost \cite{etingof} \\
papers/latex/vol-02-structural-families.tex:569:\begin{definition}[Independence of families]
papers/latex/vol-02-structural-families.tex:571:Two structural families $\mathfrak{F}$ and $\mathfrak{G}$ are \emph{logically independent} when neither is a special case of the other and neither is reconstructable from the other: there is no full embedding of one into the other, and no correspondence of the kind in Table~\ref{tab:independence} that determines one from the other. Independence in this sense is a statement about the families as classes of records and not about any particular system.
papers/latex/vol-02-structural-families.tex:574:\begin{proposition}[Invariants do not imply independence]
papers/latex/vol-02-structural-families.tex:590:\begin{proposition}[Mixed records are not defects]
papers/latex/vol-02-structural-families.tex:610:\begin{proposition}[Comparability of records]
papers/latex/vol-02-structural-families.tex:648:A uniform parameterization of the finite simple groups & Open & An explicit uniform description of the classes \\
papers/latex/vol-02-structural-families.tex:665:I & Symplectic or Poisson state space & Global symplectic topology & Mixed: parameterized locally, no record globally & No local invariants exist \\
papers/latex/vol-02-structural-families.tex:666:II & Noncommutative observable algebra & Dimension vector, type and Connes data & Mixed: parameterized, and impossible in part & Finite-dimensional and amenable sectors only \\
papers/latex/vol-02-structural-families.tex:667:III & Smooth manifold with geometry & Holonomy, causal class, geometry type & Mixed: parameterized in restricted regimes & Dimension four is unrecognizable \\
papers/latex/vol-02-structural-families.tex:668:IV & Principal bundle with connection & Map to the classifying space & Complete and parameterized & Base and group must be numerable \\
papers/latex/vol-02-structural-families.tex:672:VIII & Tensor category & Supergroup data with symmetric layer & Mixed: parameterized islands, no record generally & Hypotheses travel with the theorem \\
papers/latex/vol-02-structural-families.tex:673:IX & Configuration space on a lattice & Tame or wild class & Mixed: impossible in wild parts & No finite-variety parameterization \\
papers/latex/vol-02-structural-families.tex:747:\emph{Doplicher-Roberts reconstruction theorem}. nLab entry. Available at \url{https://ncatlab.org/nlab/show/Doplicher-Roberts+reconstruction+theorem}.
papers/latex/vol-04-yoneda-classification.tex:63:The Yoneda embedding sends each object of a category to the functor it represents through its relationships with all other objects. This paper develops the relational characterization of mathematical representations of physical systems that the embedding supplies, and it states precisely what the embedding does not supply. The Yoneda lemma determines an object up to isomorphism by its relational profile, and the embedding is fully faithful on any locally small category of representations once the admissible morphisms are fixed. Concrete representability results for quantum supermaps show that in settings with channel-state duality the relational content is not merely formal, and the classical reconstruction theorems of Gelfand, Stone, and Doplicher and Roberts recover objects from categories of probes. Against these results stands a governing constraint: Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem. A non-implication theorem makes the third denial precise, because full faithfulness holds in categories where isomorphism classes admit no finite-variety parametrization, so representability cannot be the source of a classification theorem. The paper separates established mathematics from conjectural physical interpretation throughout and records the open problem of unifying the supermap line with the reconstruction pattern.
papers/latex/vol-04-yoneda-classification.tex:79:The relational profile of a representation determines that representation up to isomorphism in a declared category of morphisms, and it determines nothing beyond that isomorphism. Full faithfulness preserves isomorphism classes without constraining how those classes are parameterized, so relational data yields no classification invariants on its own. Concrete physical recovery happens only where extra structure is assumed: channel-state duality for quantum supermaps, symmetric monoidal structure for Doplicher-Roberts reconstruction. On the positive side stand the Yoneda lemma and its corollaries, the Choi correspondence and the supermap representability it supports \cite{whh, hw}, and the probe reconstruction theorems with their declared hypotheses \cite{gn, stone, dr}. On the negative side stands a non-implication theorem: full faithfulness holds in categories where isomorphism classes admit no finite-variety parametrization \cite{buchweitz}, so representability cannot be the source of a classification theorem. No theorem joins the two sides; \cref{sec:synthesis} records the open problem that would.
papers/latex/vol-04-yoneda-classification.tex:81:The classification problem of the program asks for the fundamental structural families of mathematical physics, the operations that assemble systems from them, and the equivalences that connect presentations. The Yoneda embedding lets the third question be phrased without choosing a presentation: an object is what it does to probes. A classification theorem built on relational data must supply invariants beyond representability, because representability delivers determination up to isomorphism and no parameterization of isomorphism classes. A physical reading of relational data must pass the qualification quoted above, because the morphisms defining the profiles are mathematical choices rather than physical identifications. Restricted regimes remain the available home for classification theorems.
papers/latex/vol-04-yoneda-classification.tex:92:\begin{definition}[Object schema of a representation]
papers/latex/vol-04-yoneda-classification.tex:97:\begin{definition}[Probe class and relational profile]
papers/latex/vol-04-yoneda-classification.tex:106:\begin{definition}[Relational equivalence]
papers/latex/vol-04-yoneda-classification.tex:113:\begin{definition}[Equivalence notions and preserved layers]
papers/latex/vol-04-yoneda-classification.tex:129:Let $\mathcal{C}_{\mathrm{cl}}$ be the category of compact Hausdorff spaces with continuous maps, regarded as the geometric side of classical representations, and let the observable side be the commutative $C^*$-algebra $C(X)$ of continuous complex-valued functions. A probe $R$ contributes the set $\Hom(R, X)$ of continuous maps, equivalently the unital $*$-homomorphisms $C(X) \to C(R)$ through Gelfand duality. \Cref{sec:reconstruction} shows that on the commutative side the probe data reconstructs the object itself.
papers/latex/vol-04-yoneda-classification.tex:142:\begin{theorem}[Yoneda lemma]
papers/latex/vol-04-yoneda-classification.tex:159:\begin{corollary}[Full faithfulness]
papers/latex/vol-04-yoneda-classification.tex:176:\begin{proposition}[Probe content of a profile]
papers/latex/vol-04-yoneda-classification.tex:185:\begin{corollary}[Relational equivalence is isomorphism]
papers/latex/vol-04-yoneda-classification.tex:208:\begin{proposition}[What restriction loses]
papers/latex/vol-04-yoneda-classification.tex:224:\begin{proposition}[Profiles respect limits]
papers/latex/vol-04-yoneda-classification.tex:237:Tensor products behave differently. There is in general no canonical map relating $\Hom(R, P \otimes Q)$ to $\Hom(R, P) \otimes \Hom(R, Q)$, and the profile of a composite system is not assembled from the profiles of its factors by any universal construction available to the embedding. Determination of composites from relational data is therefore not a formal consequence of Yoneda; where it holds, it holds by a further theorem. The factorisation results of \cref{sec:supermap} are exactly such a theorem for the composition of processes under a causal-order hypothesis, and the decomposition theory of representation categories is such a theory for tensor structure. This asymmetry is a design fact of the relational program: limits are transparent to probes, monoidal composition is not.
papers/latex/vol-04-yoneda-classification.tex:242:\begin{definition}[Classification by invariants]
papers/latex/vol-04-yoneda-classification.tex:249:\begin{theorem}[Representability does not imply classifiability]
papers/latex/vol-04-yoneda-classification.tex:260:Theorem~\ref{thm:noimplication} denies an implication; it does not deny that relational data is useful. In tame regimes relational methods convert into invariants, and Sections~\ref{sec:supermap} and~\ref{sec:reconstruction} exhibit settings where they do. The theorem says that the conversion is a further theorem, with hypotheses, and that it cannot be smuggled in as a consequence of representability. The wider wildness literature reinforces the point: every finite-dimensional algebra over an algebraically closed field is derived tame or derived wild, and wildness is preserved under degeneration \cite{bekkert}, so the failure pattern is structural rather than isolated.
papers/latex/vol-04-yoneda-classification.tex:279:Complete and parameterized & Semisimple Lie algebras & Dynkin diagram & Nothing in scope \\
papers/latex/vol-04-yoneda-classification.tex:280:Complete without parameters & Finite simple groups & Atlas data & A uniform parameterization \\
papers/latex/vol-04-yoneda-classification.tex:287:The second regime is the reminder that even a completed classification can lack a uniform parameterization, which is why the classification problem of this series asks for families and constructions rather than for a single list. The third regime is where this paper lives: determination is available everywhere, and classification content is a further achievement of particular families. The fourth regime is the boundary drawn by Theorem~\ref{thm:noimplication}: in wild settings determination persists and classification does not, and no amount of representability changes that. A relational program for classification must therefore work through the second regime, converting determination into family-specific invariants wherever tame structure allows.
papers/latex/vol-04-yoneda-classification.tex:292:Formal category theory gives relational profiles no matter what the objects are. The question of whether relational content is ever concretely computational, rather than formal, has a positive answer in one corner of quantum theory: quantum supermaps, the transformations of quantum channels. The representability theorems of 2024 to 2026 show that in settings with channel-state duality, categorical supermaps are concretely representable, and that Yoneda representability underlies factorisation theorems for them \cite{whh, hw}.
papers/latex/vol-04-yoneda-classification.tex:302:\begin{proposition}[Choi correspondence and composition]
papers/latex/vol-04-yoneda-classification.tex:325:\begin{theorem}[Supermap representability]
papers/latex/vol-04-yoneda-classification.tex:327:Let $\mathcal{T}$ be a theory of processes whose processes form a symmetric monoidal category under sequential and parallel composition, and suppose $\mathcal{T}$ is equipped with a channel-state duality: a natural identification of each process $\Phi \colon A \to B$ with a state of the composite system $A \otimes B$, preserved by composition. Then the categorical supermaps of $\mathcal{T}$ are concretely representable through that duality: every supermap corresponds to a process of the composite system, and representability yields the factorisation theorems for causally ordered supermaps.
papers/latex/vol-04-yoneda-classification.tex:331:The statement is the representability lemma established in \cite{whh}; the factorisation theorems are proved in \cite{hw}. We record the result as a registered input of the series and do not reproduce the arguments there. Proposition~\ref{prop:choi} verifies the hypothesis in the finite-dimensional matrix setting: the Choi matrix identifies each channel with a state of the composite system, and composition of channels matches contraction of Choi indices, so the duality is preserved by composition as the hypothesis requires.
papers/latex/vol-04-yoneda-classification.tex:336:Theorem~\ref{thm:supermap} is the one recorded setting where relational representability is concretely computational: the relationships between processes are themselves processes, and factorisation statements follow. The hypotheses travel with the theorem. Channel-state duality of the required kind is a property of particular frameworks, and no claim is made here that every setting of interest has it, or that the result extends from quantum processes to mathematical representations of physical systems at large. Wilson, Hefford, and Hoffreumon \cite{whh} apply the same lemma to generalised circuit theories, including boxworld and real quantum theory, which shows the hypothesis is checkable theory by theory rather than automatic.
papers/latex/vol-04-yoneda-classification.tex:342:\label{sec:factorisation}
papers/latex/vol-04-yoneda-classification.tex:344:The representability statement is not the end of the supermap line. The same authors use it to prove factorisation theorems \cite{hw}, and the shape of those theorems is the clearest existing instance of relational structure producing concrete process structure.
papers/latex/vol-04-yoneda-classification.tex:346:The 2024 work \cite{hw} identifies morphisms of strong profunctors as a categorification of quantum supermaps, which places these black-box generalisations of diagrams with holes inside the theory of profunctor optics. From this vantage it constructs abstract logical connectives for supermaps, including tensor products and negations, in a theory-independent setting. Three structural features of quantum supermaps are then modelled by these connectives alone: black-box indefinite causal order, black-box definite causal order, and the factorisation of definitely causally ordered supermaps into concrete circuit diagrams. The 2026 work \cite{whh} states the mechanism as the lemma of Theorem~\ref{thm:supermap}, and the lemma eliminates guesswork in defining supermaps for a given theory.
papers/latex/vol-04-yoneda-classification.tex:348:Two features of this line matter for the classification program. The factorisation theorems are classification-like results for a restricted class: under a causal-order hypothesis, supermaps decompose into circuit data, which is determination by constituents in the sense of decomposition rather than determination by probes. The hypotheses are physical and checkable per theory, and \cite{whh} applies them to generalised theories, including boxworld and real quantum theory, rather than to quantum theory alone. The relational principle has so far earned its keep as a method with hypotheses, not as a universal law.
papers/latex/vol-04-yoneda-classification.tex:351:\label{sec:reconstruction}
papers/latex/vol-04-yoneda-classification.tex:353:A second family of results shares the shape of the relational program: reconstruction theorems, which recover an object from a category of probes attached to it. The pattern is older than the supermap line and its settings are exact.
papers/latex/vol-04-yoneda-classification.tex:355:\begin{theorem}[Gelfand duality]
papers/latex/vol-04-yoneda-classification.tex:364:\begin{theorem}[Stone duality]
papers/latex/vol-04-yoneda-classification.tex:373:\begin{theorem}[Doplicher-Roberts reconstruction]
papers/latex/vol-04-yoneda-classification.tex:379:The reconstruction is that of \cite{dr}, applied in its original setting to the representations selected by the DHR criteria of a local net \cite{dhr}; the uniqueness statement is part of the same theorem. The hypotheses of the statement are exactly those listed; dropping any of them invalidates the conclusion, and \cref{sec:equivalence} records the constraint that dropping the symmetric layer is provably insufficient in any case.
papers/latex/vol-04-yoneda-classification.tex:392:\caption{Probe reconstruction islands: each row recovers an object from a category of probes, with the hypotheses that make the recovery exact.}
papers/latex/vol-04-yoneda-classification.tex:405:\begin{proposition}[Probe reconstruction on the commutative side]
papers/latex/vol-04-yoneda-classification.tex:407:Let $A$ be a unital commutative $C^*$-algebra with character space $X = \Sp(A)$. The Gelfand transform $a \mapsto \hat{a}$ is the map that assembles the probe values of $a$, that is, the numbers $\chi(a)$ for the characters $\chi \in \Hom(A, \mathbb{C})$, and the statement of Theorem~\ref{thm:gelfand} is that these probe values determine $A$ up to isometric $*$-isomorphism. The probe data is thus the relational data of $A$ against the one-dimensional representations, and the reconstruction theorem upgrades the determination to an equivalence of categories.
papers/latex/vol-04-yoneda-classification.tex:414:The relationship of these theorems to Theorem~\ref{thm:supermap} is the open question of \cref{sec:synthesis}. Structurally, each is a relational determination result, and Proposition~\ref{prop:commprobe} shows how literally the probe reading can be taken in the commutative case. Whether the supermap representability line and these reconstruction theorems are instances of one principle is not settled by the present evidence. The resemblance is a research observation; no unifying theorem is claimed in this paper, and the qualification of the governing constraint applies to every attempt to synthesize them.
papers/latex/vol-04-yoneda-classification.tex:416:The boundaries of the islands are as informative as their statements. Gelfand duality classifies the commutative unital part of the operator-algebra family and stops at noncommutativity, where the Gelfand-Naimark theorem supplies an embedding but no classification. Stone duality reaches exactly the zero-dimensional compact spaces and the Boolean algebras, and no further. Doplicher-Roberts reconstruction is available only under symmetric tensor hypotheses, and \cref{sec:equivalence} shows that weakening the symmetric layer destroys the recovery of the group in general. Each theorem is an equivalence of categories with a domain of validity, and the domains do not presently overlap into one principle. A further distinction runs through all three: they determine objects by an equivalent category of probes, which is not parametric classification in the sense of Definition~\ref{def:classify}, since the probe objects are as varied as the objects determined.
papers/latex/vol-04-yoneda-classification.tex:428:\begin{theorem}[Etingof-Gelaki constraint]
papers/latex/vol-04-yoneda-classification.tex:441:\begin{proposition}[Preserved-layer discipline for profiles]
papers/latex/vol-04-yoneda-classification.tex:450:\begin{corollary}[Constraint inheritance]
papers/latex/vol-04-yoneda-classification.tex:478:\begin{proposition}[Fusion rings of two groups of order eight]
papers/latex/vol-04-yoneda-classification.tex:587:\emph{The unification.} The resemblance between the supermap representability theorem and the reconstruction islands is real and it is unproved as a principle. \Cref{sec:synthesis} states the problem; this paper does not assume its solution.
papers/latex/vol-04-yoneda-classification.tex:596:The open problems of this volume cluster around one question: is there a single principle behind relational representation of physical systems, covering the supermap line, the reconstruction theorems, and the formal Yoneda embedding at once? The problems below are stated in order of centrality. None is solved here.
papers/latex/vol-04-yoneda-classification.tex:599:\item[The synthesis problem] Does categorical supermap representability, which holds under channel-state duality, unify with the Gelfand, Stone, and Doplicher-Roberts reconstruction pattern into one Yoneda-principle account? A solution would exhibit one statement covering all three islands with explicit hypotheses, and would say what the probe categories have in common beyond their shape. A plausible starting point is to ask whether each island is an instance of one density or representability statement for a probe category attached to the object, with channel-state duality playing the role that characters play in the Gelfand case.
papers/latex/vol-04-yoneda-classification.tex:610:The first problem is the volume's headline: the two islands of concrete relational results, quantum supermaps and probe reconstruction, have never been shown to be instances of one theorem. Marking the synthesis as open is not a rhetorical hedge. A unification theorem would be a substantial result, and its absence bounds every claim this paper makes about a general relational principle.
papers/latex/vol-04-yoneda-classification.tex:615:The Yoneda embedding gives mathematical representations of physical systems a rigorous relational characterization. Objects are determined up to isomorphism by their admissible relationships with all probes; the determination is exact, and it is what the embedding establishes. In two concrete corners the relational content does more than hold formally: supermaps are representable in settings with channel-state duality, and reconstruction theorems recover objects from probe categories exactly. In exchange for these results one must state the declared category and its morphisms, declare the layers of structure an identification preserves, and accept that none of this yields physical equivalence, empirical adequacy, or a classification theorem.
papers/latex/vol-04-yoneda-classification.tex:619:The balance of the volume is therefore asymmetric in a deliberate way. On the positive side stand three exact results: the Yoneda lemma with its corollaries, the Choi correspondence and the supermap representability it supports, and the probe reconstruction theorems with their declared hypotheses. On the negative side stand three refusals: relational equivalence is not physical equivalence, representability is not classification, and equivalence at one layer of structure is not equivalence at another. The refusals are not caveats appended to the results; they are theorems about what the results cannot deliver, and together they state the scope of the relational program with a precision that the slogan alone lacks. Within that scope, objects are determined by their relationships, and the remaining questions of the classification program are open in exactly the places \cref{sec:synthesis} names.
papers/latex/vol-12-principia-physica.tex:52:This paper assembles the registered results of the Classification of Mathematical Representations of Physical Systems into the three-layer architecture of Principia Physica: mathematical classification, physical realization, and empirical selection. The assembly keeps the three layers apart and separates proved statements from conjectural ones. Twenty background classification theorems and seven obstruction theorems are organized into seven classification regimes; a finite case analysis of the twenty-eight domains of the program comparison spine, with one boundary case, shows that fifteen carry a classification theorem with a finite or explicitly parameterized invariant, one is complete but unparameterized, one is a complete obstruction classification, seven remain open or claimed, three are impossible in the stated generality, one is undecidable, and one is decidable but unclassified. Eight reconstruction theorems recover objects from probes, each under hypotheses that cannot be dropped. The empirical layer admits no unique monotone metric in the quantum case, and no record validates the physical layer: the announced four-dimensional existence result carries the status existence claimed; manuscript and formalization withheld; verification pending, and the mass gap problem remains open. The structural classification statement enters only as a declared hypothesis, and a conditional reduction records what its five proof obligations would deliver. No record in the series carries a completed computer-checked proof.
papers/latex/vol-12-principia-physica.tex:65:which asserts that every admissible physical system is generated from a collection of fundamental structural families under admissible constructions. The identity is a conjecture and is never used here as a lemma. The results assembled around it are the classification regimes where theorems exist, the obstruction theorems that forbid classification elsewhere, the reconstruction theorems that recover objects from probes, and the empirical constraints that no mathematical classification can discharge.
papers/latex/vol-12-principia-physica.tex:67:This assembly establishes four results. Twenty-eight mathematical domains fall into six realized classification regimes, with complete invariants appearing only where the invariant is finite or explicitly parameterized. Seven impossibility theorems show that wild representation categories, non-amenable factors, and generic four-manifolds admit no uniform classification. Every reconstruction theorem on record requires its full algebraic hypotheses, and dropping the symmetric or monoidal structure admits non-isomorphic counterexamples. Resolving the structural classification conjecture would complete the mathematical classification alone, leaving physical realization and empirical selection unconstrained.
papers/latex/vol-12-principia-physica.tex:75:\begin{definition}[Representation of a physical system]
papers/latex/vol-12-principia-physica.tex:86:\begin{definition}[Equivalences]
papers/latex/vol-12-principia-physica.tex:93:\begin{definition}[Admissible systems and family closure]
papers/latex/vol-12-principia-physica.tex:95:An admissible physical system is an object of the schema of \cref{def:representation} satisfying explicitly stated consistency conditions; $\mathrm{Phys}_{\mathrm{adm}}$ denotes the class of such objects. A structural family collection $\mathfrak{F} = \{\mathfrak{F}_\alpha\}_{\alpha \in A}$ is a collection of classes of objects singled out by their underlying mathematical structure, and $\langle \mathfrak{F} \rangle_{\mathfrak{C}}$ denotes the smallest class of objects containing $\mathfrak{F}$ and closed under a set of admissible constructions $\mathfrak{C}$: tensor product, direct sum, extension, limits and colimits, and factorization.
papers/latex/vol-12-principia-physica.tex:100:\begin{definition}[Irreducibility and decomposition]
papers/latex/vol-12-principia-physica.tex:107:\begin{definition}[The three layers]
papers/latex/vol-12-principia-physica.tex:112:\begin{definition}[Evidence grades]
papers/latex/vol-12-principia-physica.tex:117:\begin{definition}[Classification regimes]
papers/latex/vol-12-principia-physica.tex:119:A domain of mathematical structures is assigned to exactly one of seven regimes. Regime 1 is complete and parameterized: a classification theorem exists and a finite or explicitly described parameter class determines the object. Parameter classes range from finite data such as dimension vectors to infinite function classes such as operator monotone functions, and the classification is a bijection with the parameter class in either case. Regime 2 is complete but unparameterized: a classification theorem exists and no uniform parameterization is known. Regime 3 is complete as obstruction: the classification content is the obstruction itself. Regime 4 is open: partial results, normal forms, or claims only. Regime 5 is impossible in the stated generality: a theorem forbids the classification. Regime 6 is undecidable: no algorithm can carry the classification. Regime 7 is decidable but unclassified.
papers/latex/vol-12-principia-physica.tex:126:\begin{definition}[Structural invariant record]
papers/latex/vol-12-principia-physica.tex:135:\begin{definition}[Observational equivalence]
papers/latex/vol-12-principia-physica.tex:166:Under the architecture of \cref{def:layers}, classification data determines neither realization nor selection. The architecture stipulates $\mathcal{R}$ and $\mathcal{E}$ as maps with separate domains and codomains, and the founding documents stipulate that several mathematically distinct theories may produce identical predictions within an experimentally accessible regime. The registry of the program, examined record by record, contains classification theorems, reconstruction theorems, and obstruction theorems, and it contains no observation functor and no construction of $\mathcal{E}$: every record lives at the mathematical layer or at the interface between the mathematical and realization layers. Classification data therefore underdetermines empirical selection.
papers/latex/vol-12-principia-physica.tex:182:Reconstruction theorems & 2 & Doplicher-Roberts reconstruction under its hypotheses \\
papers/latex/vol-12-principia-physica.tex:199:\caption{The twenty-eight domains of the program comparison spine and the unknot-recognition boundary case, with classifying invariant and classification regime. Regime 1 is complete and parameterized, 2 is complete but unparameterized, 3 is complete as obstruction, 4 is open or claimed, 5 is impossible in the stated generality, 6 is undecidable, and 7 is decidable but unclassified.}
papers/latex/vol-12-principia-physica.tex:220:DHR superselection sectors & Compact supergroup from the reconstruction & 1 \\
papers/latex/vol-12-principia-physica.tex:236:Wild representation categories & No finite-variety parameterization exists & 5 \\
papers/latex/vol-12-principia-physica.tex:242:The twenty-nine rows of \cref{tab:regimes} carry the regime counts $15, 1, 1, 7, 3, 1, 1$ over regimes 1 to 7. Every regime-1 domain carries a finite or explicitly parameterized classifying invariant; parameter classes range from dimension vectors to the infinite class of operator monotone functions. Every domain whose objects include wild, non-amenable, or algorithmically unrecognizable sectors lies in regime 4, 5, or 6, and none of those domains carries a classification theorem. The counts hold by inspection of the table, where row 29 carries regime 7. Regime~1 contains the rows for simple Lie theory \cite{corpus-4}, its representation theory \cite{corpus-5}, local symplectic and Poisson geometry, finite-dimensional $C^*$-algebras, amenable factors, principal bundles, DHR sectors, subexponential symmetric tensor categories, Lorentzian holonomy, the causal ladder, the at-most-four-region entropy cone, monotone metrics, and closed three-manifolds. Each invariant listed for those rows is finite data or parametric data: diagrams, weights, dimension vectors, types and Connes invariants, homotopy-class data, supergroup data, holonomy groups, causal classes, inequality data, metrics up to constant, and geometry type. Regime~2 is finite simple groups, where the classification theorem exists and no uniform parameterization is known. Regime~3 is anomalies, where the classification content is the obstruction classes. Regime~4 contains quantum channels, fusion categories, extended topological field theories, the entropy cone from five regions up, emergent spacetime, and the two Yang-Mills rows. Regime~5 contains general type~$\mathrm{II}$ and type~$\mathrm{III}$ factors \cite{corpus-8}, four-manifolds \cite{corpus-54}, and wild representation categories \cite{corpus-55,corpus-56,corpus-58}. Regime~6 contains Markov properties of finitely presented groups \cite{corpus-53}. The wild, non-amenable, and unrecognizable sectors appear exactly in rows that \cref{thm:obstructions} below covers, and those rows carry partial data or nothing at all where a classification theorem would sit.
papers/latex/vol-12-principia-physica.tex:247:Row 21 records a proved parametric classification: quantum monotone metrics are classified by operator monotone functions \cite{corpus-52}. The parameter class here is an infinite-dimensional class of functions, not the finite or discrete data of the other regime-1 rows, and uniqueness fails in the quantum case. The program periodic table lists the same domain among open classification problems because the classification is not a finite list. Both statements stand together: the classification theorem is proved, and the classification is not finite.
papers/latex/vol-12-principia-physica.tex:250:Within the evidence base, classification is sharp exactly where the invariant is finite or explicitly parameterized, and the classification content can be entirely global. Every regime-1 and regime-2 row of \cref{tab:regimes} has a finite or explicitly parameterized invariant, and the domains without such invariants are exactly the domains with no classification theorem. The global character of symplectic classification is Darboux's theorem \cite{corpus-6}: any two symplectic manifolds of the same dimension are locally symplectomorphic, so the local invariant is empty and the classifying data must be global. The contrast with Riemannian geometry, where curvature supplies local invariants, is structural rather than incidental.
papers/latex/vol-12-principia-physica.tex:252:\subsection{Classification, parameterization, recognition}
papers/latex/vol-12-principia-physica.tex:254:Three classification achievements are often conflated. A parameterization assigns uniform finite data to each object. A classification lists the objects exhaustively. A recognition procedure identifies an object algorithmically from companion data.
papers/latex/vol-12-principia-physica.tex:256:The classification of finite simple groups delivers the second achievement and only part of the third. The list of families and sporadic groups is complete \cite{corpus-1,corpus-2}, and practical identification runs through companion data of atlas type: order, Schur multiplier, outer automorphism group, presentations, and character tables with power maps \cite{corpus-3}. No clean uniform parameterization analogous to Dynkin diagrams is known \cite{corpus-1}. The template program itself therefore sits in regime 2 of \cref{def:regimes}, and a periodic table of physical structures cannot expect more from its analogy than the template delivers.
papers/latex/vol-12-principia-physica.tex:265:\begin{theorem}[Survey: non-classification outside tame regimes, assembled from McDuff, Adyan-Rabin, the wildness results, Tancer, Etingof-Gelaki, and Grochow-Qiao]
papers/latex/vol-12-principia-physica.tex:267:The following classification objectives are forbidden by proved results. Separable type~$\mathrm{II}_1$ factors admit no total classification outside the amenable case, and their isomorphism relation admits no classification by countable invariants. Wild representation categories admit no finite-variety parameterization. Markov properties of finitely presented groups, including finiteness and simplicity, are algorithmically undecidable. Homeomorphism of compact four-manifolds is algorithmically unrecognizable in general. A finite group is not determined by its representation category as a plain tensor category. Group isomorphism admits no polynomial-time algorithm in wild regimes under standard complexity assumptions, while tame extensions do. Consequently any classification theorem in the program must either restrict its class to a tame regime or weaken its invariant notion, and a global periodic table covering all families cannot exist outside tame regimes.
papers/latex/vol-12-principia-physica.tex:271:The first statement is McDuff's theorem: there are uncountably many non-isomorphic separable type~$\mathrm{II}_1$ factors \cite{corpus-8,corpus-65}. A total classification by a countable list of invariants would inject that uncountable family into a countable product of invariant values, which is impossible, and the Borel-reducibility analysis makes the failure precise for isomorphism of von Neumann algebras \cite{corpus-59}. The second statement is the wildness line: every finite-dimensional algebra over an algebraically closed field is derived-tame or derived-wild with wildness preserved under degeneration \cite{corpus-55}, the rank-2 isomorphism classes of the generic determinant's Cohen-Macaulay modules admit no finite-dimensional-variety parameterization \cite{corpus-56}, and no meaningful classification of compact $C_p$-equivariant $H\mathbb{F}_p$-modules exists at odd primes \cite{corpus-58}. The third statement is the Adyan-Rabin theorem with the Collins extension \cite{corpus-53}. The fourth statement is the unrecognizability of connected-sum homeomorphism for a specific four-manifold \cite{corpus-54}, set against the eight-geometry decomposition of closed three-manifolds \cite{corpus-60,corpus-70}. The fifth statement is the isocategorical-group construction: non-isomorphic finite groups carry equivalent representation categories as plain tensor categories \cite{corpus-12}. The sixth statement is the tame/wild tractability boundary \cite{corpus-57}. Each forbidden objective is a classification covering one of the named sectors, so each such classification would contradict the corresponding theorem. The conjunctive conclusion follows.
papers/latex/vol-12-principia-physica.tex:289:The realization layer $\mathcal{R}$ asks which structures, once classified, are realized as physical theories. The proved content of this layer is reconstruction: objects recovered from their probes. Eight reconstruction theorems are registered.
papers/latex/vol-12-principia-physica.tex:292:\caption{The eight registered reconstruction theorems, with recovered object and scope limits. Each theorem is proved under the hypotheses stated in the source.}
papers/latex/vol-12-principia-physica.tex:293:\label{tab:reconstruction}
papers/latex/vol-12-principia-physica.tex:311:Reconstruction is better developed than classification. The pattern is uniform: probe data determines the object. Gelfand duality recovers a space from its commutative $C^*$-algebra \cite{corpus-42}, Stone duality recovers a spectrum from a Boolean algebra \cite{corpus-44}, and Doplicher-Roberts reconstruction recovers a compact supergroup from a symmetric tensor $*$-category with the stated hypotheses \cite{corpus-12,corpus-16}. The 2024 to 2026 supermap line establishes concrete representability of categorical supermaps whenever suitable channel-state duality holds \cite{corpus-40,corpus-41}. Whether that line unifies with the Gelfand, Stone, and Naimark pattern into a single relational principle is open.
papers/latex/vol-12-principia-physica.tex:319:Two islands support the relational program. Concrete representability of categorical supermaps is proved whenever the theory admits suitable channel-state duality \cite{corpus-40,corpus-41}. The classical reconstruction pattern of Gelfand, Stone, and Naimark recovers objects from their probe algebras \cite{corpus-42,corpus-44}. Whether the two islands join into one principle is open, and no argument in this paper crosses that gap.
papers/latex/vol-12-principia-physica.tex:321:\begin{theorem}[Survey: necessity of the structure hypotheses, assembled from Etingof-Gelaki, Doplicher-Roberts, Stinespring, and the supermap results]
papers/latex/vol-12-principia-physica.tex:323:Every registered realization or identification theorem fails or becomes open as soon as its structure hypotheses are dropped. In particular: plain tensor equivalence of representation categories does not determine the finite group; Doplicher-Roberts reconstruction requires the symmetric structure and its companion hypotheses; Stinespring data is a normal form and its Kraus rank is not an isomorphism invariant of channels; supermap representability requires channel-state duality. Consequently any identification of systems in the program must declare the layers of structure it preserves, and an identification that forgets the monoidal or symmetric layer is refuted.
papers/latex/vol-12-principia-physica.tex:334:The realization layer carries a central unanswered test. Can the proposed foundational structures reconstruct gauge connections and curvature, quantum states and observables, interacting Yang-Mills dynamics, and spacetime geometry together with gravitational dynamics, without assuming at the outset the spacetime geometry they aim to explain? Four constraints bound the current answer.
papers/latex/vol-12-principia-physica.tex:336:The finite-groupoid and weighted-nerve constructions of emergent spacetime are concrete, and their continuum convergence conditions are not established without complete proofs. The Ryu-Takayanagi formula is a proposal argued from the AdS/CFT correspondence and verified exactly only in the three-dimensional anti-de Sitter setting with two-dimensional conformal field theory \cite{corpus-45}. Entanglement-wedge bulk reconstruction is a proved quantum-information theorem \cite{corpus-46}, so it lives at the interface of the mathematical and realization layers and is not a theorem about gravity. Tensor-network constructions prove entropy relations inside exactly solvable toys and not inside the physical duality \cite{corpus-48}, and the statement that entanglement builds spacetime is an argument rather than a theorem \cite{corpus-49}.
papers/latex/vol-12-principia-physica.tex:345:\begin{theorem}[Survey: classical uniqueness and quantum parametricity, assembled from Chentsov and Petz-Sudar]
papers/latex/vol-12-principia-physica.tex:347:The Fisher metric is the unique Riemannian metric, up to constant factor, that is monotone under stochastic maps. Quantum monotone metrics are classified by operator monotone functions, a parametric family containing more than one element. Classical uniqueness therefore does not extend to the quantum case, and any quantum distinguishability criterion must either select within the parametric family and justify the selection or carry the family as data.
papers/latex/vol-12-principia-physica.tex:351:The first statement is Chentsov's theorem \cite{corpus-52}. The second is the Petz-Sudar classification \cite{corpus-52}. The parameterizing class of operator monotone functions contains more than one element; for instance the identity function and the affine function $f(x) = (x+1)/2$ are both operator monotone and give different metrics. The uniqueness statement is therefore false in the quantum case, and the last clause follows: a criterion that names a single quantum monotone metric makes an additional choice beyond the classification theorem.
papers/latex/vol-12-principia-physica.tex:354:\Cref{thm:monotone} fixes what empirical distinguishability can borrow from information geometry. In the classical case the statistical distance is canonical. In the quantum case the statistical distance is a choice inside a proved parameterization, so an observational equivalence relation built on such distances must state the choice.
papers/latex/vol-12-principia-physica.tex:360:Formalizing that criterion needs an observation functor with four pieces of data: a domain of theories, a codomain of observational constraints or predictions, a composition rule with coarse-graining, and the induced equivalence classes of \cref{def:observational}. The record contains none of the four. Whether observational equivalence composes in interacting regimes is unstudied, and the positive question of what makes two descriptions one physical system is open: the isocategorical counterexample shows what is insufficient, and no reconstruction criterion for sameness exists.
papers/latex/vol-12-principia-physica.tex:421:\begin{definition}[Constituent invariant record]
papers/latex/vol-12-principia-physica.tex:426:\begin{proposition}[Completeness of the constituent record for two constructions]
papers/latex/vol-12-principia-physica.tex:440:\Cref{thm:conditional} covers the two constructions where extension theory is established. The analogous completeness statement for the remaining admissible constructions is conditional on the five obligations of \cref{conj:structural}, of which one is partial and four are open, and on uniqueness of decomposition, which the program leaves open; it is not claimed here. Its conclusion would stop at the mathematical layer. The regime analysis of \cref{sec:mathlayer} bounds its scope further: inside a target class, the classifying data must live in a regime of \cref{tab:regimes} where invariants are finite or explicitly parameterized, and outside those regimes \cref{thm:obstructions} forbids the classification the conjecture would deliver.
papers/latex/vol-12-principia-physica.tex:455:\begin{lemma}[Uniqueness of the block decomposition]
papers/latex/vol-12-principia-physica.tex:468:At the empirical layer, measurement statistics on states define distinguishability. The classical statistical distance is canonical by \cref{thm:monotone}, and the quantum statistical distance is one choice inside the parametric family of operator monotone functions. Two admissible choices give two inequivalent distinguishability structures on the same classified algebra, so the empirical layer carries data the mathematical layer does not determine.
papers/latex/vol-12-principia-physica.tex:480:At the realization layer, the reconstruction of an interacting four-dimensional quantum field theory from such data is claimed rather than established. The announced existence result carries the status existence claimed; manuscript and formalization withheld; verification pending \cite{corpus-24,corpus-25}. At the empirical layer, the mass gap remains open \cite{corpus-23}, lattice theorems hold only in restricted regimes \cite{corpus-30,corpus-31,corpus-32}, and no entry of \cref{tab:claims} closes the continuum limit. The example therefore shows the three layers in three different states: proved at $\mathcal{M}$, claimed at $\mathcal{R}$, open at $\mathcal{E}$.
papers/latex/vol-12-principia-physica.tex:511:The sixth deliverable is what this paper supplies. Restricted classification theorems are the right objective where invariants are finite or explicitly parameterized, and obstruction theorems are the right objective everywhere else. A rigorous impossibility result is a valuable outcome of the program, not a consolation.
papers/latex/vol-12-principia-physica.tex:526:The assembly establishes four things. Every domain of the program comparison spine sits in exactly one classification regime, fifteen of them with finite or explicitly parameterized invariants and complete classification theorems. Seven obstruction theorems forbid classification in the wild, non-amenable, and undecidable sectors, so classification objectives must match regimes. Every realization and identification theorem fails or becomes open when its structure hypotheses are dropped, so identifications must declare preserved structure. And the structural classification conjecture, under its five obligations, would complete the mathematical layer for a targeted class while leaving realization and selection untouched.
papers/latex/vol-12-principia-physica.tex:528:What remains uncertain is equally sharp. The admissibility conditions are unfixed. The physical equivalence is unchosen. The realization and selection maps are stipulated and not constructed. The announced four-dimensional existence result carries the status existence claimed; manuscript and formalization withheld; verification pending, and the mass gap is open. No record carries a completed computer-checked proof. The central test of the realization layer, reconstruction of interacting dynamics and spacetime without presupposing spacetime, is unanswered.
papers/latex/vol-10-observational-equivalence.tex:62:The classification problem of mathematical representations of physical systems is a quotient: classify objects of a category of systems up to an equivalence relation. The quotient is unusable until the relation is chosen, and the choice is decisive. This paper develops the observational side of that choice. It separates three relations: mathematical equivalence, given by isomorphism of the component data of a representation; physical equivalence, an open choice constrained by what the identifying morphism preserves; and observational equivalence, induced by a functor from systems to observation records. Observation functors are defined, their induced relations are proved to be equivalence relations with classes given by record isomorphism classes, and their interaction with coarse-graining is proved monotone in one direction only. Distinguishability is treated through monotone metrics: the Fisher metric is the unique classical choice up to constant, while the quantum case admits a parametric family indexed by operator monotone functions. An explicit two-dimensional computation shows the resulting quadratic forms differ on non-commuting directions, so quantum metric distinguishability is not canonical. The plain tensor-category criterion for physical equivalence fails outright: equivalence of representation categories without the symmetric structure does not recover the group, and every proposed relation must name the layers of structure it preserves. A counterexample search records which candidate criteria fail and why, and the empirical layer of the three-layer architecture is instantiated as a functor and left open where the sources leave it open.
papers/latex/vol-10-observational-equivalence.tex:77:Coarsening the observations identifies at least as many systems as the fine observations identify, and the inclusion of relations can be strict. The quantitative side of distinguishability splits along the classical and quantum divide: the Fisher metric is unique up to constant among metrics monotone under stochastic maps \cite{b8}, while the quantum monotone metrics form a parametric family indexed by operator monotone functions \cite{b8}. An explicit two-dimensional computation shows the induced quadratic forms disagree on non-commuting directions, so distinguishability read from an unnamed monotone metric is not a function of the states alone.
papers/latex/vol-10-observational-equivalence.tex:90:\begin{definition}[System record]
papers/latex/vol-10-observational-equivalence.tex:99:\begin{definition}[Mathematical equivalence]
papers/latex/vol-10-observational-equivalence.tex:104:\begin{definition}[Physical equivalence]
papers/latex/vol-10-observational-equivalence.tex:109:\begin{definition}[Observational equivalence]
papers/latex/vol-10-observational-equivalence.tex:114:\begin{definition}[Admissible candidate relation]
papers/latex/vol-10-observational-equivalence.tex:143:\begin{definition}[Equivalence witness]
papers/latex/vol-10-observational-equivalence.tex:155:\begin{definition}[Action of the morphism kinds]
papers/latex/vol-10-observational-equivalence.tex:166:The cited results are used as established mathematics with their hypotheses intact: the plain tensor counterexample (\Cref{thm:eg}) with its construction cited rather than reproduced, the classical monotone-metric uniqueness (\Cref{thm:chentsov}) on spaces of probability distributions, and the quantum parametric classification (\Cref{thm:petzsudar}) for operator monotone functions normalized at $1$ and symmetric under $x \mapsto x^{-1}$ in Petz's sense. Nothing in this paper extends a cited result beyond its hypotheses, and the counterexample search of \Cref{sec:search} keeps extension attempts visible.
papers/latex/vol-10-observational-equivalence.tex:175:\begin{theorem}[Plain tensor equivalence does not recover the group]
papers/latex/vol-10-observational-equivalence.tex:184:\begin{corollary}[Preserved-layer discipline]
papers/latex/vol-10-observational-equivalence.tex:213:Symmetric monoidal structure & the compact supergroup of the representation category under the stated hypotheses & reconstructible \\
papers/latex/vol-10-observational-equivalence.tex:224:The reconstruction pattern is the positive counterpart of the constraint. Gelfand duality, Stone duality, and the Gelfand-Naimark theorem recover named objects from named probes under named hypotheses \cite{b3,b4,b6}; \Cref{sec:recon} places that pattern against the observation formalism. None of these results establishes physical equivalence by itself; the series qualification on relational arguments governs every such step and is quoted in \Cref{sec:recon}.
papers/latex/vol-10-observational-equivalence.tex:231:\begin{definition}[Observation functor]
papers/latex/vol-10-observational-equivalence.tex:240:\begin{proposition}[Induced relation]
papers/latex/vol-10-observational-equivalence.tex:246:Isomorphism in $\mathsf{Obs}$ is an equivalence relation, and $\approx_{\mathrm{Obs}}$ is its pullback along $\mathrm{Obs}$: reflexivity, symmetry, and transitivity hold because they hold for isomorphism in $\mathsf{Obs}$. By construction $P \approx_{\mathrm{Obs}} Q$ holds exactly when $[\mathrm{Obs}(P)] = [\mathrm{Obs}(Q)]$, so the fibers of $P \mapsto [\mathrm{Obs}(P)]$ (the record isomorphism classes, not the strict fibers of $\mathrm{Obs}$ on objects) are the $\approx_{\mathrm{Obs}}$ classes, and the induced map on the quotient is injective on the image. Any set map constant on those fibers factors through the quotient by the universal property of quotient sets, and the factorization is unique because the quotient map is surjective.
papers/latex/vol-10-observational-equivalence.tex:251:\begin{lemma}[Products of observations]
papers/latex/vol-10-observational-equivalence.tex:267:\begin{definition}[Coarse and fine observations]
papers/latex/vol-10-observational-equivalence.tex:272:\begin{proposition}[Coarse records separate less]
papers/latex/vol-10-observational-equivalence.tex:287:\begin{proposition}[Composed experiments]
papers/latex/vol-10-observational-equivalence.tex:305:\begin{theorem}[Chentsov]
papers/latex/vol-10-observational-equivalence.tex:324:In the quantum case the uniqueness fails. Monotone metrics on quantum state spaces are given by the Morozova-Chentsov construction indexed by operator monotone functions $f$ on the positive reals, normalized by $f(1) = 1$ and self-reciprocal in Petz's sense, $f(x) = x f(x^{-1})$; the self-reciprocity is the symmetry condition that makes the quadratic form well defined on self-adjoint tangent directions, and distinct self-reciprocal $f$ give distinct metrics.
papers/latex/vol-10-observational-equivalence.tex:326:\begin{theorem}[Petz-Sud{\'a}r classification]
papers/latex/vol-10-observational-equivalence.tex:328:Every quantum monotone metric arises from an operator monotone function $f$ with $f(1) = 1$ and $f(x) = x f(x^{-1})$ through the Morozova-Chentsov form, and distinct such $f$ give distinct metrics on self-adjoint directions. The family is parametric, not a finite list, and no member is distinguished among all monotone metrics.
papers/latex/vol-10-observational-equivalence.tex:332:The classification of monotone metrics by operator monotone functions is stated and applied at \cite{b8}, where the classical uniqueness and its quantum failure are contrasted. The self-reciprocity condition identifies each metric with a symmetric representative; without it, $f$ and its transpose $f^{\#}(x) = x f(x^{-1})$ yield the same quadratic form on self-adjoint operators and would be double counted. The parametric nature of the family is the reason the classical uniqueness statement may not be extended to the quantum case.
papers/latex/vol-10-observational-equivalence.tex:340:\begin{proposition}[Commutative restriction]
papers/latex/vol-10-observational-equivalence.tex:342:For every operator monotone $f$ with $f(1) = 1$, the quadratic form $g_f^{\rho}$ restricted to operators $A$ that are diagonal in an eigenbasis of $\rho$ equals $\sum_i |A_{ii}|^2 / \lambda_i$, the classical Fisher form on the commutative subalgebra generated by $\rho$. On commutative data the quantum monotone metrics therefore agree, and the parametric freedom of \Cref{thm:petzsudar} is invisible.
papers/latex/vol-10-observational-equivalence.tex:351:The parametric freedom becomes visible on non-commuting data. Two self-reciprocal representatives suffice to see it: $f(x) = \tfrac{2x}{1+x}$ and $h(x) = \tfrac{1+x}{2}$, both operator monotone with value $1$ at $1$ and both satisfying $f(x) = x f(x^{-1})$.
papers/latex/vol-10-observational-equivalence.tex:364:\begin{corollary}[Metric-level distinguishability is not canonical]
papers/latex/vol-10-observational-equivalence.tex:427:Observation functors are stipulated here rather than derived, because the two proved reconstruction patterns do not yet connect across general system classes.
papers/latex/vol-10-observational-equivalence.tex:429:The classic pattern recovers objects from probes. Gelfand duality reconstructs compact Hausdorff spaces from commutative $C^*$-algebras \cite{b3}; Stone duality reconstructs spectra from Boolean algebras \cite{b6}; the Gelfand-Naimark theorem embeds every $C^*$-algebra in an algebra of operators \cite{b4}. Each theorem is a precise statement with named hypotheses: an object is determined by how probes see it. The modern pattern represents higher-order operations. Categorical supermaps on a theory are concretely representable through channel-state duality whenever the theory has such a duality \cite{b5,b9}, and the factorization theorems for supermaps rest on the Yoneda lemma and on representability \cite{b5}.
papers/latex/vol-10-observational-equivalence.tex:433:What can be used now is narrower. The reconstruction pattern fixes the shape of a legitimate claim about observation: an object recovered from named probes under named hypotheses is a theorem of reconstruction, not a classification and not an empirical adequacy claim. The series qualification applies to both patterns verbatim: ``Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.'' \Cref{sec:functors} defines observation functors as additional structure, and this section records the standing option of deriving them instead. The option is reasonable and unresolved.
papers/latex/vol-10-observational-equivalence.tex:442:\begin{definition}[Empirical layer as observation functor]
papers/latex/vol-10-observational-equivalence.tex:589:The preserved-layer discipline is the one constructive tool the paper offers. A candidate $\simeq$ becomes checkable when its proponents file an equivalence witness (\Cref{def:witness}) for each identification: the notion in force, the morphism kind, the preserved layers. Isocategorical groups then serve as the standing test: a witness whose preserved layers omit the symmetric monoidal structure and whose systems carry different observable group data must be rejected before further analysis. The series records no positive reconstruction criterion for ``the same physical system''; the search for one is open, and the constraints above are the admissibility conditions any such criterion must meet.
papers/latex/vol-10-observational-equivalence.tex:606:The metric results carry their own boundary. \Cref{thm:chentsov,thm:petzsudar} are used as established mathematics with their hypotheses intact: monotone under stochastic maps in the classical case, operator monotone functions normalized at $1$ and self-reciprocal in the quantum case. Nothing here extends classical uniqueness to the quantum case, and \Cref{cor:noncanonical} is the reason not to. The explicit computation is two-dimensional; the disagreement of the metrics is general (\Cref{thm:petzsudar}) but only the two-dimensional instance is exhibited here.
papers/latex/vol-10-observational-equivalence.tex:632:$f, h$ & self-reciprocal operator monotone functions normalized at $1$: $f(x) = \tfrac{2x}{1+x}$ and $h(x) = \tfrac{1+x}{2}$ \\

exec
/usr/local/bin/zsh -lc "ls -ld lean/.lake lean/.lake/build/lib/lean/Cmrps lean/.lake/packages/mathlib; cat lean/Cmrps.lean; sed -n '400,490p' lean/Cmrps/Vol08SpacetimeReconstruction.lean; sed -n '120,145p' lean/Cmrps/Vol06QuantumSystems.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
drwxr-xr-x   5 mlong  staff   160 Oct 30 03:38 lean/.lake
drwxr-xr-x  62 mlong  staff  1984 Oct 30 06:55 lean/.lake/build/lib/lean/Cmrps
drwxr-xr-x  35 mlong  staff  1120 Oct 30 03:36 lean/.lake/packages/mathlib
import Cmrps.Vol01Foundations
import Cmrps.Vol02StructuralFamilies
import Cmrps.Vol03IrreducibilityDecomposition
import Cmrps.Vol04YonedaClassification
import Cmrps.Vol05ClassicalSystems
import Cmrps.Vol06QuantumSystems
import Cmrps.Vol07GaugeQft
import Cmrps.Vol08SpacetimeReconstruction
import Cmrps.Vol09GravityInformationGeometry
import Cmrps.Vol10ObservationalEquivalence
import Cmrps.Vol11CompletenessObstructions
import Cmrps.Vol12PrincipiaPhysica
  · refine ⟨{z | ¬ z ≤ x}, ?_, Or.inr ⟨h, fun hh => hh le_rfl⟩⟩
    intro a b hab ha hbx
    exact (Set.mem_setOf.1 ha) (le_trans hab hbx)

/-- Proposition 9.4 (prop:specialization): the closure of a singleton in the
up-set topology is its down-set `cl({x}) = {y | y ≤ x}`. -/
theorem closure_singleton_eq_downset {α : Type*} [PartialOrder α] (x : α) :
    @closure α (upSetTopology α) ({x} : Set α) = {y | y ≤ x} := by
  letI : TopologicalSpace α := upSetTopology α
  apply le_antisymm
  · refine closure_minimal ?_ ?_
    · intro z hz
      simp only [Set.mem_singleton_iff] at hz
      subst hz
      exact le_rfl
    · rw [isClosed_iff_isLowerSet]
      exact fun a b hba ha => le_trans hba ha
  · intro y hy
    have hx : x ∈ @closure α (upSetTopology α) ({x} : Set α) :=
      subset_closure (Set.mem_singleton x)
    have hlow : IsLowerSet (@closure α (upSetTopology α) ({x} : Set α)) :=
      isClosed_iff_isLowerSet.1 isClosed_closure
    exact hlow hy hx

/-- Proposition 9.4 (prop:specialization): the order is read off the closures:
`x ≤ y` if and only if `x ∈ cl({y})`. -/
theorem le_iff_mem_closure {α : Type*} [PartialOrder α] (x y : α) :
    x ≤ y ↔ x ∈ @closure α (upSetTopology α) ({y} : Set α) := by
  letI : TopologicalSpace α := upSetTopology α
  rw [closure_singleton_eq_downset]
  exact Iff.rfl

/-- Proposition 9.4 (prop:specialization): the up-set topology of a partial order
is T₀ (two distinct points are separated by an open up-set). -/
theorem upSetTopology_t0Space {α : Type*} [PartialOrder α] :
    @T0Space α (upSetTopology α) := by
  letI : TopologicalSpace α := upSetTopology α
  refine ⟨fun x y hxy => ?_⟩
  by_contra hne
  obtain ⟨u, hu, hsep⟩ := exists_upperSet_separating x y hne
  have hopen : IsOpen[upSetTopology α] u := TopologicalSpace.isOpen_generateFrom_of_mem hu
  have hiff := inseparable_iff_forall_isOpen.1 hxy u hopen
  rcases hsep with ⟨hx, hy⟩ | ⟨hy, hx⟩
  · exact hy (hiff.1 hx)
  · exact hx (hiff.2 hy)

/-- Proposition 9.4 (prop:specialization) / target `specialization_order_recovery`:
the up-set topology of a partial order is T₀, the closure of each singleton is
its down-set, and the order is recovered from the closures. -/
theorem specialization_order_recovery {α : Type*} [PartialOrder α] :
    (∀ x y : α, x ≠ y → ∃ u, IsUpperSet u ∧ ((x ∈ u ∧ y ∉ u) ∨ (y ∈ u ∧ x ∉ u))) ∧
      (∀ x : α, @closure α (upSetTopology α) ({x} : Set α) = {y | y ≤ x}) ∧
      (∀ x y : α, x ≤ y ↔ x ∈ @closure α (upSetTopology α) ({y} : Set α)) ∧
      @T0Space α (upSetTopology α) :=
  ⟨fun x y => exists_upperSet_separating x y, fun x => closure_singleton_eq_downset x,
    fun x y => le_iff_mem_closure x y, upSetTopology_t0Space⟩

/-! ## Thurston model geometries (Theorem 7.1, Table 4; target
`geometrization_dim3`, partial) -/

/-- The eight Thurston model geometries of dimension three (Theorem 7.1,
Table 4): `E³`, `S³`, `H³`, `S² × ℝ`, `H² × ℝ`, `Nil`, `Sol`, `SL̃(2,ℝ)`. -/
inductive ThurstonGeometry3 : Type where
  | e3 | s3 | h3 | s2TimesR | h2TimesR | nil | sol | sl2tilde
  deriving DecidableEq, Repr

instance : Fintype ThurstonGeometry3 where
  elems := { .e3, .s3, .h3, .s2TimesR, .h2TimesR, .nil, .sol, .sl2tilde }
  complete := by intro x; cases x <;> simp

/-- Theorem 7.1 (thm:geometrization), type-level fragment: the list of Thurston
model geometries in dimension three has exactly eight entries. The geometrization
decomposition theorem itself (every closed 3-manifold decomposes into pieces
carrying one of these geometries) is a cited literature result and is not
formalized here. -/
theorem card_thurstonGeometry3 : Fintype.card ThurstonGeometry3 = 8 := by decide

end Cmrps.Vol08
/-- Vector-space dimension is not a classifying invariant while the dimension
vector is: `[2]` and `[1,1,1,1]` have equal `algebraDim` but are not
permutation-equivalent. Paper: Example 3.4. -/
theorem dim4_vector_dimension_not_classifying :
    algebraDim [2] = algebraDim [1, 1, 1, 1] ∧
      ¬ List.Perm ([2] : DimensionVector) [1, 1, 1, 1] := by
  constructor
  · rfl
  · intro h
    have := List.Perm.length_eq h
    simp at this

/-- Enumeration of the dimension vectors of complex dimension `d`: all
nonincreasing lists of positive integers whose squares sum to `d`. The `fuel`
argument is a structural recursion budget; `dimVectorsOfDim` supplies `d + 1`,
which is enough to reach every list of algebra dimension `d` (each step strictly
decreases `d`). -/
def dimVecs : (fuel d bound : ℕ) → List (List ℕ)
  | 0, _, _ => []
  | _ + 1, 0, _ => [[]]
  | fuel + 1, d + 1, bound =>
      (List.range (bound + 1)).flatMap fun k =>
        if k * k ≤ d + 1 ∧ 1 ≤ k ∧ k ≤ bound then
          ((dimVecs fuel (d + 1 - k * k) k).map fun l => k :: l)
        else []


exec
/usr/local/bin/zsh -lc "sed -n '95,175p' papers/latex/vol-04-yoneda-classification.tex; sed -n '300,350p' papers/latex/vol-10-observational-equivalence.tex; sed -n '155,180p' papers/latex/vol-02-structural-families.tex; sed -n '228,241p' papers/latex/vol-02-structural-families.tex; sed -n '280,322p' papers/latex/vol-12-principia-physica.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
\end{definition}

\begin{definition}[Probe class and relational profile]
\label{def:profile}
Let $\mathcal{C}$ be a locally small category of mathematical representations of physical systems, with the morphism classes in force declared. The \emph{relational profile} of an object $P \in \mathrm{Ob}(\mathcal{C})$ is the presheaf
\[
y(P) = \Hom_{\mathcal{C}}(-, P) \in [\mathcal{C}^{\mathrm{op}}, \mathbf{Set}],
\]
so that for every probe $R \in \mathrm{Ob}(\mathcal{C})$ the set $y(P)(R) = \Hom_{\mathcal{C}}(R, P)$ is the collection of admissible relationships from $R$ to $P$, and for every morphism $f \colon R \to R'$ the action $y(P)(f) \colon \Hom(R', P) \to \Hom(R, P)$ is precomposition. For a restricted probe class $\mathcal{R} \subseteq \mathrm{Ob}(\mathcal{C})$, the \emph{$\mathcal{R}$-restricted profile} is the family $\big(\Hom_{\mathcal{C}}(R, P)\big)_{R \in \mathcal{R}}$ together with the induced actions of morphisms between probes in $\mathcal{R}$.
\end{definition}

\begin{definition}[Relational equivalence]
\label{def:releq}
Two objects $P, Q \in \mathrm{Ob}(\mathcal{C})$ are \emph{relationally equivalent}, written $P \sim_{\mathrm{rel}} Q$, when $y(P) \cong y(Q)$ as presheaves on $\mathcal{C}$. They are \emph{$\mathcal{R}$-relationally equivalent} when their restricted profiles are naturally isomorphic as functors on $\mathcal{R}$.
\end{definition}

The two equivalence notions of the series must be kept apart. \emph{Mathematical equivalence} is isomorphism of the tuples $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{K})$ in the ambient category of each component. \emph{Physical equivalence} is a carefully chosen equivalence relation on representations, motivated by the observation that two mathematical descriptions may describe the same physics without being isomorphic; the choice of that relation is itself open and is load-bearing for the classification problem $\mathrm{Classify}(\mathrm{Ob}(\mathrm{Phys})/{\simeq})$. Relational equivalence is a third notion, defined relative to a declared category $\mathcal{C}$, and its relationship to the first two is the subject of the next section.

\begin{definition}[Equivalence notions and preserved layers]
\label{def:equiv}
An \emph{identification} of two representations $P$ and $Q$ consists of an equivalence notion, being mathematical isomorphism or a declared physical equivalence relation, a morphism kind realizing it, and a declaration of the layers of structure the identification preserves among the symmetric monoidal, braided, monoidal, $*$-structure, algebraic, and topological layers. An identification that omits the declaration is inadmissible.
\end{definition}

Definition~\ref{def:equiv} is the equivalence discipline of the series in miniature. \Cref{sec:equivalence} shows that the discipline is forced by theorems rather than chosen for tidiness: identifications that forget the monoidal or symmetric layer fail to recover groups even in the finite case.

Two properties of the framework control later claims. First, the relational profile is a function of the morphisms in force and of nothing else; a profile computed in a category of coarse-grainings is a different mathematical object from a profile computed in a category of isomorphisms. Second, the profile is relational data rather than parameter data: it assigns to each probe a set of relationships, and it does not take values in any fixed parameter space of invariants. Classification theorems in the sense of the series demand invariants whose values determine objects up to the chosen equivalence; profiles determine objects up to isomorphism by a different mechanism entirely.

\begin{remark}[Finite-dimensional quantum systems]
\label{ex:quantum}
Fix $n \geq 1$ and let $\mathcal{C}_n$ be the category whose objects are pairs $(H, A)$ of a finite-dimensional complex Hilbert space $H$ with $\dim H \leq n$ and a unital $*$-subalgebra $A \subseteq B(H)$, with morphisms the $*$-homomorphisms. The tuple data of the series is recovered by taking $X = H$ as state space, $\mathcal{O} = A$ as observables, $\mathcal{D}$ the specified Hamiltonian or semigroup dynamics when present, $\mathcal{S}$ the specified symmetry action when present, and $\mathcal{K}$ the tensor product of systems. The relational profile of $(H, A)$ records, for each probe $(H', A')$, the set of unital $*$-homomorphisms $A' \to A$ together with their compatibilities. This category is locally small, and the Yoneda embedding applies to it as to any other.
\end{remark}

\begin{remark}[Classical probe systems]
\label{ex:classical}
Let $\mathcal{C}_{\mathrm{cl}}$ be the category of compact Hausdorff spaces with continuous maps, regarded as the geometric side of classical representations, and let the observable side be the commutative $C^*$-algebra $C(X)$ of continuous complex-valued functions. A probe $R$ contributes the set $\Hom(R, X)$ of continuous maps, equivalently the unital $*$-homomorphisms $C(X) \to C(R)$ through Gelfand duality. \Cref{sec:reconstruction} shows that on the commutative side the probe data reconstructs the object itself.
\end{remark}

\begin{remark}[Process categories]
\label{ex:process}
Fix finite-dimensional systems and let $\mathcal{C}_{\mathrm{ch}}$ have as objects the completely positive trace-preserving maps $\Phi \colon M_n \to M_m$ for varying $n$ and $m$. A morphism from $\Phi \colon A \to B$ to $\Psi \colon C \to D$ is a pair of channels $(E \colon C \to A,\ L \colon B \to D)$ with $\Psi = L \circ \Phi \circ E$; composition is componentwise, and the identity on $\Phi$ is $(\mathrm{id}, \mathrm{id})$. These pairs are the pre- and post-processings without auxiliary memory. General supermaps admit ancillary systems that bridge input and output, and the representability theorem of Section~\ref{sec:supermap} covers that wider setting. Supermaps are the transformations of the processes this category treats as objects, and the relational content in this setting is concretely computable through channel-state duality, because a channel is a state of the composed system.
\end{remark}

\section{Relational characterization}
\label{sec:relational}

The Yoneda lemma and its corollaries \cite{maclane} hold in every locally small category, and their application to $\mathrm{Phys}$ is conditional on the declaration of morphisms recorded in \cref{sec:framework}.

\begin{theorem}[Yoneda lemma]
\label{thm:yoneda}
Let $\mathcal{C}$ be a locally small category and let $A \in \mathrm{Ob}(\mathcal{C})$. For every functor $F \colon \mathcal{C}^{\mathrm{op}} \to \mathbf{Set}$ the evaluation map
\[
\mathrm{ev}_A \colon \Nat\big(\Hom_{\mathcal{C}}(-, A), F\big) \longrightarrow F(A),
\qquad
\alpha \longmapsto \alpha_A(\mathrm{id}_A),
\]
is a bijection.
\end{theorem}

\begin{proof}
Injectivity first. Suppose $\alpha, \beta \colon \Hom(-, A) \to F$ satisfy $\alpha_A(\mathrm{id}_A) = \beta_A(\mathrm{id}_A)$. For any object $X$ and any $f \in \Hom(X, A)$ the naturality square at $f \colon X \to A$ gives $\alpha_X(f) = F(f)(\alpha_A(\mathrm{id}_A))$ and likewise for $\beta$, so $\alpha_X = \beta_X$ for every $X$, and $\alpha = \beta$.

Surjectivity next. Given $a \in F(A)$, define $\alpha^{a}_X \colon \Hom(X, A) \to F(X)$ by $\alpha^{a}_X(f) = F(f)(a)$. Naturality holds: for $g \colon Y \to X$ and $f \in \Hom(X, A)$ one has $\alpha^{a}_Y(f \circ g) = F(f \circ g)(a) = F(g)(F(f)(a)) = F(g)(\alpha^{a}_X(f))$, which is exactly the required square. Finally $\alpha^{a}_A(\mathrm{id}_A) = F(\mathrm{id}_A)(a) = a$, so $\mathrm{ev}_A(\alpha^{a}) = a$. The two constructions are mutually inverse, and local smallness guarantees that each $\Hom(X, A)$ is a set on which $F$ acts.
\end{proof}

\begin{corollary}[Full faithfulness]
\label{cor:faithful}
For all objects $A, B$ of a locally small category $\mathcal{C}$ the map
\[
\Hom_{\mathcal{C}}(A, B) \longrightarrow \Nat\big(y(A), y(B)\big),
\qquad
\varphi \longmapsto \big(g \mapsto \varphi \circ g\big),
\]
is a bijection. In particular $y$ is faithful and full, and $y(A) \cong y(B)$ holds if and only if $A \cong B$.
\end{corollary}

\begin{proof}
Apply Theorem~\ref{thm:yoneda} with $F = \Hom(-, B)$; the bijection sends the natural transformation $\alpha$ to $\alpha_A(\mathrm{id}_A)$, and its inverse sends $\varphi$ to $(g \mapsto \varphi \circ g)$. Faithfulness and fullness are the statement that this map is bijective on hom-sets. If $\theta \colon y(A) \to y(B)$ is a natural isomorphism, the corresponding $\varphi = \theta_A(\mathrm{id}_A)$ is an isomorphism in $\mathcal{C}$, with inverse induced by $\theta^{-1}$; conversely an isomorphism $A \cong B$ induces one of profiles by precomposition.
\end{proof}

Corollary~\ref{cor:faithful} is the exact content of the relational shift. An object $P$ is fully described, up to isomorphism in $\mathcal{C}$, by the totality of its admissible relationships $\Hom(R, P)$ with all probes $R$, together with the compatibility of those relationships along morphisms of probes. No intrinsic presentation of $P$ is needed to recover $P$ up to isomorphism.


\subsection{Classical uniqueness}

Distinguishability between statistical models has a canonical classical measure. A Riemannian metric on a space of probability distributions is monotone under stochastic maps when no stochastic map increases the metric distance between distributions.

\begin{theorem}[Chentsov]
\label{thm:chentsov}
Up to a positive constant multiple, the Fisher information metric is the unique Riemannian metric on spaces of probability distributions that is monotone under stochastic maps.
\end{theorem}

\begin{proof}[Proof, by reference]
The uniqueness statement is Chentsov's theorem, used here in the form stated and applied at \cite{b8}; the proof is a rigidity argument classifying monotone metrics on the classical simplex. This paper uses the statement as the classical anchor of distinguishability and does not reprove it.
\end{proof}

Concretely, on the open simplex of positive probability vectors $p = (p_1, \ldots, p_n)$, the Fisher form is
\[
g^{\mathrm{Fisher}}_p(a, a) = \sum_{i=1}^{n} \frac{a_i^2}{p_i}
\]
for tangent vectors $a$ with zero sum, and \Cref{thm:chentsov} says every monotone Riemannian metric on the simplex is a positive multiple of this form. The expression is the one that appears in \Cref{prop:commutative} as the commutative restriction of the quantum family: on commuting data the quantum metrics all give the classical answer.

Classical statistical distance is therefore pinned down: any criterion that reads distinguishability from a monotone Riemannian metric on classical models must be a multiple of the Fisher metric. This is the one uniqueness result among the family of probability and measure-theoretic structures in the series taxonomy.

\subsection{Quantum parametricity}

In the quantum case the uniqueness fails. Monotone metrics on quantum state spaces are given by the Morozova-Chentsov construction indexed by operator monotone functions $f$ on the positive reals, normalized by $f(1) = 1$ and self-reciprocal in Petz's sense, $f(x) = x f(x^{-1})$; the self-reciprocity is the symmetry condition that makes the quadratic form well defined on self-adjoint tangent directions, and distinct self-reciprocal $f$ give distinct metrics.

\begin{theorem}[Petz-Sud{\'a}r classification]
\label{thm:petzsudar}
Every quantum monotone metric arises from an operator monotone function $f$ with $f(1) = 1$ and $f(x) = x f(x^{-1})$ through the Morozova-Chentsov form, and distinct such $f$ give distinct metrics on self-adjoint directions. The family is parametric, not a finite list, and no member is distinguished among all monotone metrics.
\end{theorem}

\begin{proof}[Proof, by reference]
The classification of monotone metrics by operator monotone functions is stated and applied at \cite{b8}, where the classical uniqueness and its quantum failure are contrasted. The self-reciprocity condition identifies each metric with a symmetric representative; without it, $f$ and its transpose $f^{\#}(x) = x f(x^{-1})$ yield the same quadratic form on self-adjoint operators and would be double counted. The parametric nature of the family is the reason the classical uniqueness statement may not be extended to the quantum case.
\end{proof}

Concretely, for a faithful density operator $\rho$ with eigenvalues $\lambda_i$ and a self-adjoint trace-free operator $A = \sum_{i,j} A_{ij} |i\rangle\langle j|$ in an eigenbasis of $\rho$, the quadratic form of the metric $g_f$ is
\[
g_f^{\rho}(A, A) \;=\; \sum_{i,j} \frac{|A_{ij}|^2}{\lambda_j \, f(\lambda_i / \lambda_j)}.
\]

\begin{proposition}[Commutative restriction]
\label{prop:commutative}
For every operator monotone $f$ with $f(1) = 1$, the quadratic form $g_f^{\rho}$ restricted to operators $A$ that are diagonal in an eigenbasis of $\rho$ equals $\sum_i |A_{ii}|^2 / \lambda_i$, the classical Fisher form on the commutative subalgebra generated by $\rho$. On commutative data the quantum monotone metrics therefore agree, and the parametric freedom of \Cref{thm:petzsudar} is invisible.
\end{proposition}

\begin{proof}
For $i \neq j$ the summands of the quadratic form carry factors $|A_{ij}|^2 = 0$ when $A$ is diagonal in the chosen basis. The surviving summands are $|A_{ii}|^2 / (\lambda_i f(1)) = |A_{ii}|^2 / \lambda_i$, since $f(1) = 1$.
\end{proof}

\subsection{Ruler dependence of the metric scale}


\Cref{cor:parameterization} recovers the template program's own situation in the form that applies to it. The finite simple groups have infinitely many isomorphism classes, so no finite invariant range classifies them; they are classified, and a uniform parameterization analogous to Dynkin diagrams is missing \cite{cfsg,solomon}. Practical identification there runs through the atlas data instead \cite{atlas}, which is a recognition procedure in the sense of \Cref{prop:recognition-cost} and not a parameterization.

\subsection{Locality of invariants}
\label{sec:locality}

Classification content can be entirely global.

\begin{proposition}[Globality of classification in the symplectic family]
\label{prop:globality}
Let $(M, \omega)$ and $(N, \eta)$ be symplectic manifolds of the same dimension $2n$ with $n \geq 1$. Let $f$ assign a value to every symplectic germ and be invariant under symplectomorphism of germs. Then $f$ takes the same value at every point of $M$ and at every point of $N$. Consequently no invariant defined on germs and constant on each connected component is classifying for the symplectic family at fixed dimension $2n$, and every classifying invariant for that family is global.
\end{proposition}

\begin{proof}
By Darboux's theorem, every symplectic germ of dimension $2n$ is symplectomorphic to the standard germ $(\mathbb{R}^{2n}, \omega_0)$ \cite{darboux}. The hypothesis $n \geq 1$ is needed: at $n = 0$ the manifold is a disjoint union of points and a constant invariant does classify it, and the dimension itself is a local germ invariant once dimensions are allowed to vary. Invariance under symplectomorphism forces $f$ to be constant on the orbit of germs, and that orbit is the whole set of $2n$-dimensional germs. So $f$ is constant at every point of $M$ and of $N$, and it cannot distinguish them. A classifying invariant must distinguish objects that are not equivalent, so it cannot be local.
\end{proof}

\begin{corollary}
\label{cor:topological}
Classifying data for the symplectic family is topological or global in character. This reverses the Riemannian situation, in which local curvature invariants do classifying work.
\end{corollary}

\Cref{prop:globality} is the reason the symplectic row of the family tables below reads ``complete locally, with no local invariants''. Completeness of the local classification is a theorem, and its content is that there is nothing local to compute.

\subsection{Achievement kinds for classified sectors}
\label{sec:kinds}
Let $Q$ be a smooth manifold and $M = T^*Q$ with its canonical symplectic form $\omega = d\theta$, where $\theta$ is the tautological one-form. The record is: state space $M$, observables $C^\infty(M)$, dynamics the Hamiltonian flow of a smooth function $H$, symmetries the cotangent lifts of diffeomorphisms of $Q$ preserving $H$, and composition the product of systems with the product symplectic form.

Local data is empty by \Cref{prop:globality}. The equivalence in force is symplectomorphism of the total space. The record supplies a global invariant and not a classifying one, and it says so.

\begin{proposition}[Global invariants of a cotangent bundle]
\label{prop:cotangent}
The zero section of $T^*Q$ is a deformation retract of $T^*Q$. Consequently the homotopy type of the symplectic manifold $T^*Q$ equals the homotopy type of $Q$, and every homotopy invariant of $Q$ is a global invariant of the symplectic record.
\end{proposition}

\begin{proof}
The maps $r_t \colon T^*Q \to T^*Q$ given by $r_t(x, \xi) = (x, t\xi)$ for $t \in [0,1]$ form a deformation retraction: each $r_t$ is smooth, $r_1$ is the identity, $r_0$ factors through the zero section, and $r_s \circ r_t = r_{st}$ for $s, t \in [0,1]$. The zero section is diffeomorphic to $Q$, so $T^*Q$ and $Q$ are homotopy equivalent and share all homotopy invariants.
\end{proof}

\Cref{prop:cotangent} supplies an invariant and not a complete one. Two homotopy-equivalent bases need not have symplectomorphic cotangent bundles, and the record also carries the Hamiltonian $H$, which the homotopy type does not see. The scope of the record is therefore the homotopy data of the base, and the record does not claim more.
The register therefore has a constructive use. An obstruction names the restriction a classification theorem needs. McDuff's theorem tells a would-be factor classification to restrict to the amenable class, and that restricted classification exists. Wildness tells a would-be module classification to restrict to the derived-tame side. The unrecognizability theorem tells a would-be four-manifold classification to restrict to decomposable classes. Each obstruction pairs with a restricted positive theorem, and that pairing is the working form of the program's negative results.

\begin{remark}
The program founding documents warn against assuming that physical theories possess a finite collection of exceptional objects analogous to the twenty-six sporadic groups \cite{corpus-1}. The sporadic groups exist and are exhaustive in the finite-simple setting, and the corresponding question for physical theories is open. The obstruction register shows what a periodic table must record where no table exists.
\end{remark}

\section{The realization layer}
\label{sec:realization}

The realization layer $\mathcal{R}$ asks which structures, once classified, are realized as physical theories. The proved content of this layer is reconstruction: objects recovered from their probes. Eight reconstruction theorems are registered.

\begin{table}[htbp]
\caption{The eight registered reconstruction theorems, with recovered object and scope limits. Each theorem is proved under the hypotheses stated in the source.}
\label{tab:reconstruction}
\small
\begin{tabularx}{\textwidth}{>{\hsize=0.70\hsize\raggedright\arraybackslash}X >{\hsize=1.12\hsize\raggedright\arraybackslash}X >{\hsize=1.18\hsize\raggedright\arraybackslash}X}
\toprule
Theorem & Recovers & Scope limits \\
\midrule
Gelfand-Naimark \cite{corpus-9,corpus-42} & A concrete representation of a $C^*$-algebra & A representation theorem, not a classification \\
Gelfand duality \cite{corpus-42} & A compact Hausdorff space & The commutative side only \\
Stone duality \cite{corpus-44} & A spectrum from a Boolean algebra & The Boolean side only \\
Doplicher-Roberts \cite{corpus-12,corpus-15,corpus-16,corpus-67} & A compact supergroup, unique up to isomorphism & Symmetric structure, conjugates, subobjects, and $\mathrm{End}(\mathbf{1})$ equal to the scalars \\
Deligne \cite{corpus-13} & A supergroup representation category & Characteristic zero and subexponential growth \\
Stinespring \cite{corpus-10,corpus-11} & A minimal dilation, unique up to unitary & Normal form only, not an isomorphism classification \\
Classifying-space construction \cite{corpus-17,corpus-18} & A principal bundle from a map to the classifying space & Homotopy classification \\
Supermap representability \cite{corpus-40,corpus-41} & Concrete representations of categorical supermaps & Settings with channel-state duality \\
\bottomrule
\end{tabularx}
\end{table}

Reconstruction is better developed than classification. The pattern is uniform: probe data determines the object. Gelfand duality recovers a space from its commutative $C^*$-algebra \cite{corpus-42}, Stone duality recovers a spectrum from a Boolean algebra \cite{corpus-44}, and Doplicher-Roberts reconstruction recovers a compact supergroup from a symmetric tensor $*$-category with the stated hypotheses \cite{corpus-12,corpus-16}. The 2024 to 2026 supermap line establishes concrete representability of categorical supermaps whenever suitable channel-state duality holds \cite{corpus-40,corpus-41}. Whether that line unifies with the Gelfand, Stone, and Naimark pattern into a single relational principle is open.

\subsection{Relational characterization}

Reconstruction from probes has a categorical form. The Yoneda embedding sends an object $P$ to the functor $\mathrm{Hom}(-, P)$, and the Yoneda lemma shows that an object of a locally small category is determined up to isomorphism by its relationships. The embedding is therefore a faithful mathematical representation of objects of $\mathrm{Phys}$ through their relational profiles. Its physical interpretation is open.

The constraint on every relational argument in the program is stated verbatim: \emph{Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.} The embedding supplies representability and nothing else. Physical equivalence requires the chosen relation of \cref{def:equivalence}, empirical adequacy requires the selection layer, and a classification theorem requires invariants with completeness statements.

Two islands support the relational program. Concrete representability of categorical supermaps is proved whenever the theory admits suitable channel-state duality \cite{corpus-40,corpus-41}. The classical reconstruction pattern of Gelfand, Stone, and Naimark recovers objects from their probe algebras \cite{corpus-42,corpus-44}. Whether the two islands join into one principle is open, and no argument in this paper crosses that gap.

\begin{theorem}[Survey: necessity of the structure hypotheses, assembled from Etingof-Gelaki, Doplicher-Roberts, Stinespring, and the supermap results]
\label{thm:hypotheses}

 succeeded in 69940ms:
exec
/usr/local/bin/zsh -lc "rg -n 'theorem|def|class ' lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/List/{Defs,Basic,Lemmas}.lean lean/.lake/packages/mathlib/Mathlib/Data/Multiset/{Basic,Bind,Count}.lean lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean lean/.lake/packages/mathlib/Mathlib/Logic/Equiv/Set.lean -g '*.lean' | rg 'map_sum|sum_map|mem_product|subtypeEquiv|Category|setCongr'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/List/Lemmas.lean:83:theorem sum_map_count_dedup_filter_eq_countP (p : α → Bool) (l : List α) :
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/List/Lemmas.lean:103:theorem sum_map_count_dedup_eq_length (l : List α) :
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:18:Defines a category, as a type class parametrised by the type of objects.
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:39:The typeclass `Category C` describes morphisms associated to objects of type `C : Type u`.
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:82:library_note «universe output parameters and typeclass caching»
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:95:By default (since https://github.com/leanprover/lean4/pull/12286), Lean treats any universe
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:106:(from https://github.com/leanprover/lean4/pull/12423) overrides the default:
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:110:**Rule of thumb:** if the class is typically used with explicit universe annotations
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:112:parameters are likely inputs, not outputs, and the class should be annotated with
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:120:/-- A preliminary structure on the way to defining a category,
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:123:class CategoryStruct (obj : Type u) : Type max u (v + 1) extends Quiver.{v} obj where
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:144:@[tactic sorryIfSorry, inherit_doc sorryIfSorry] meta def evalSorryIfSorry : Tactic := fun _ => do
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:174:allows `aesop` to look through semireducible definitions when calling `intros`.
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:181:  aesop $c* (config := { introsTransparency? := some .default, terminal := true })
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:190:  aesop? $c* (config := { introsTransparency? := some .default, terminal := true })
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:199:    aesop $c* (config := { introsTransparency? := some .default, warnOnNonterminal := false })
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:206:Currently this defaults to the `aesop_cat` wrapper around `aesop`, but by setting
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:209:meta def categoryTheoryDischarger : TacticM Unit := do
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:226:/-- The typeclass `Category C` describes morphisms associated to objects of type `C`.
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:230:-- https://github.com/leanprover/lean4/pull/12423, the morphism universe `v` would default to
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:232:-- See Note [universe output parameters and typeclass caching].
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:234:class Category (obj : Type u) : Type max u (v + 1) extends CategoryStruct.{v} obj where
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:276:theorem eq_whisker {f g : X ⟶ Y} (w : f = g) (h : Y ⟶ Z) : f ≫ h = g ≫ h := by rw [w]
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:291:theorem eq_of_comp_left_eq {f g : X ⟶ Y} (w : ∀ {Z : C} (h : Y ⟶ Z), f ≫ h = g ≫ h) :
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:296:theorem eq_of_comp_left_eq' (f g : X ⟶ Y)
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:301:theorem id_of_comp_left_id (f : X ⟶ X) (w : ∀ {Y : C} (g : X ⟶ Y), f ≫ g = g) : f = 𝟙 X := by
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:306:theorem comp_ite {P : Prop} [Decidable P] {X Y Z : C} (f : X ⟶ Y) (g g' : Y ⟶ Z) :
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:310:theorem comp_dite {P : Prop} [Decidable P]
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:316:class Epi (f : X ⟶ Y) : Prop where
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:323:class Mono (f : X ⟶ Y) : Prop where
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:332:theorem cancel_epi (f : X ⟶ Y) [Epi f] {g h : Y ⟶ Z} : f ≫ g = f ≫ h ↔ g = h :=
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:336:theorem cancel_epi_assoc_iff (f : X ⟶ Y) [Epi f] {g h : Y ⟶ Z} {W : C} {k l : Z ⟶ W} :
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:341:theorem cancel_epi_id (f : X ⟶ Y) [Epi f] {h : Y ⟶ Y} : f ≫ h = f ↔ h = 𝟙 Y := by
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:346:as typeclass arguments. For a version taking them as explicit arguments, see `epi_comp'`. -/
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:349:`Mono g` as typeclass arguments. For a version taking them as explicit arguments, see `mono_comp'`.
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:355:as explicit arguments. For a version taking them as typeclass arguments, see `epi_comp`. -/
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:358:`Mono g` as explicit arguments. For a version taking them as typeclass arguments, see `mono_comp`.
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:360:theorem epi_comp' {f : X ⟶ Y} {g : Y ⟶ Z} (hf : Epi f) (hg : Epi g) : Epi (f ≫ g) :=
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:364:theorem epi_of_epi (f : X ⟶ Y) (g : Y ⟶ Z) [Epi (f ≫ g)] : Epi g :=
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:368:theorem epi_of_epi_fac {f : X ⟶ Y} {g : Y ⟶ Z} {h : X ⟶ Z} [Epi h] (w : f ≫ g = h) : Epi g := by
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Category/Basic.lean:396:def uliftCategory : Category.{v} (ULift.{u'} C) where
lean/.lake/packages/mathlib/Mathlib/Logic/Equiv/Set.lean:50:def equivOfEq (h : s = t) : s ≃ t := Equiv.subtypeEquivProp <| h ▸ rfl
lean/.lake/packages/mathlib/Mathlib/Logic/Equiv/Set.lean:177:def setCongr {α β : Type*} (e : α ≃ β) : Set α ≃ Set β :=

exec
/usr/local/bin/zsh -lc "rg -n 'theorem|lemma|axiom|sorry|admit|native_decide|implemented_by' lean/Cmrps/*.lean | tail -30; rg -n 'Monotone|identity|f\\(t\\)|f\\(x\\)|factor through|factorization|not determined|non-collapse' papers/latex/vol-12-principia-physica.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
lean/Cmrps/Vol02StructuralFamilies.lean:459:theorem not_kraus_rep_zero (U : M) (hU : IsUnitary U) : ¬ KrausRep (φ U) [] := by
lean/Cmrps/Vol02StructuralFamilies.lean:471:theorem kraus_rank_one (U : M) (hU : IsUnitary U) : IsKrausRank 1 (φ U) := by
lean/Cmrps/Vol02StructuralFamilies.lean:489:private theorem v_apply_zero : v 0 = 1 := by simp [v]
lean/Cmrps/Vol02StructuralFamilies.lean:491:private theorem v_apply_one : v 1 = -1 := by simp [v]
lean/Cmrps/Vol02StructuralFamilies.lean:493:private theorem v_mul_star (i : Fin 2) : v i * star (v i) = 1 := by
lean/Cmrps/Vol02StructuralFamilies.lean:496:private theorem P_unitary : IsUnitary P := by
lean/Cmrps/Vol02StructuralFamilies.lean:513:private theorem one_unitary : IsUnitary (1 : M) := by
lean/Cmrps/Vol02StructuralFamilies.lean:520:private theorem phi_one : φ 1 = fun Y => Y := by
lean/Cmrps/Vol02StructuralFamilies.lean:525:private theorem phi_P_X_apply : (φ P X) 0 1 = -1 := by
lean/Cmrps/Vol02StructuralFamilies.lean:540:private theorem phi_one_X_apply : (φ 1 X) 0 1 = 1 := by
lean/Cmrps/Vol02StructuralFamilies.lean:546:theorem kraus_rank_not_injective :
lean/Cmrps/Vol02StructuralFamilies.lean:572:theorem retraction_one (p : Q × V) : retraction (1 : ℝ) p = p := by
lean/Cmrps/Vol02StructuralFamilies.lean:576:theorem retraction_comp (s t : ℝ) (p : Q × V) :
lean/Cmrps/Vol02StructuralFamilies.lean:581:theorem retraction_fixes_zero_section (t : ℝ) (x : Q) :
lean/Cmrps/Vol02StructuralFamilies.lean:586:theorem retraction_zero_eq (p : Q × V) : retraction (0 : ℝ) p = (p.1, (0 : V)) := by
lean/Cmrps/Vol02StructuralFamilies.lean:589:theorem retraction_zero_mem_zeroSection (p : Q × V) :
lean/Cmrps/Vol02StructuralFamilies.lean:594:theorem continuous_retraction (t : ℝ) : Continuous (retraction (t : ℝ) (Q := Q) (V := V)) := by
lean/Cmrps/Vol02StructuralFamilies.lean:599:theorem continuous_retraction₂ :
lean/Cmrps/Vol02StructuralFamilies.lean:607:theorem cotangent_retract :
lean/Cmrps/Vol02StructuralFamilies.lean:635:theorem mem_closure {K : Set (α → α → α)} {E : Set α} {x : α} :
lean/Cmrps/Vol02StructuralFamilies.lean:639:theorem subset_closure (K : Set (α → α → α)) (E : Set α) : E ⊆ closure K E :=
lean/Cmrps/Vol02StructuralFamilies.lean:642:theorem closedUnder_closure (K : Set (α → α → α)) (E : Set α) :
lean/Cmrps/Vol02StructuralFamilies.lean:647:theorem closure_minimal (K : Set (α → α → α)) {E C : Set α}
lean/Cmrps/Vol02StructuralFamilies.lean:660:theorem exceptional_not_closed (op : α → α → α) (K : Set (α → α → α)) (hop : op ∈ K)
lean/Cmrps/Vol02StructuralFamilies.lean:680:theorem closure_generation (K : Set (α → α → α)) (E : Set α) :
lean/Cmrps/Vol02StructuralFamilies.lean:716:/-- Paper Proposition 16.2: a family admits a classifying invariant when some map on
lean/Cmrps/Vol02StructuralFamilies.lean:725:theorem not_independent_of_reconstructable (F G : StructuralFamily)
lean/Cmrps/Vol02StructuralFamilies.lean:729:/-- Paper Proposition 16.2: two families may each admit a classifying invariant and
lean/Cmrps/Vol02StructuralFamilies.lean:732:theorem invariants_not_independence :
lean/Cmrps/Vol02StructuralFamilies.lean:754:theorem comparability_of_records {Obj : Type u} {r : Obj → Obj → Prop} (hr : Equivalence r)
61:The central object is the identity
65:which asserts that every admissible physical system is generated from a collection of fundamental structural families under admissible constructions. The identity is a conjecture and is never used here as a lemma. The results assembled around it are the classification regimes where theorems exist, the obstruction theorems that forbid classification elsewhere, the reconstruction theorems that recover objects from probes, and the empirical constraints that no mathematical classification can discharge.
95:An admissible physical system is an object of the schema of \cref{def:representation} satisfying explicitly stated consistency conditions; $\mathrm{Phys}_{\mathrm{adm}}$ denotes the class of such objects. A structural family collection $\mathfrak{F} = \{\mathfrak{F}_\alpha\}_{\alpha \in A}$ is a collection of classes of objects singled out by their underlying mathematical structure, and $\langle \mathfrak{F} \rangle_{\mathfrak{C}}$ denotes the smallest class of objects containing $\mathfrak{F}$ and closed under a set of admissible constructions $\mathfrak{C}$: tensor product, direct sum, extension, limits and colimits, and factorization.
228:Monotone metrics in the classical case & Fisher metric up to constant & 1 \\
229:Monotone metrics in the quantum case & Operator monotone functions (infinite parameter class) & 1 \\
267:The following classification objectives are forbidden by proved results. Separable type~$\mathrm{II}_1$ factors admit no total classification outside the amenable case, and their isomorphism relation admits no classification by countable invariants. Wild representation categories admit no finite-variety parameterization. Markov properties of finitely presented groups, including finiteness and simplicity, are algorithmically undecidable. Homeomorphism of compact four-manifolds is algorithmically unrecognizable in general. A finite group is not determined by its representation category as a plain tensor category. Group isomorphism admits no polynomial-time algorithm in wild regimes under standard complexity assumptions, while tame extensions do. Consequently any classification theorem in the program must either restrict its class to a tame regime or weaken its invariant notion, and a global periodic table covering all families cannot exist outside tame regimes.
351:The first statement is Chentsov's theorem \cite{corpus-52}. The second is the Petz-Sudar classification \cite{corpus-52}. The parameterizing class of operator monotone functions contains more than one element; for instance the identity function and the affine function $f(x) = (x+1)/2$ are both operator monotone and give different metrics. The uniqueness statement is therefore false in the quantum case, and the last clause follows: a criterion that names a single quantum monotone metric makes an additional choice beyond the classification theorem.
432:In case (a) the block sizes are the dimensions of the simple modules of $P$, which are invariant under $*$-isomorphism, and they determine the algebra by the structure theorem \cite{corpus-9,corpus-42}; this is \cref{lem:blocks}. In case (b) the classification of group extensions with a fixed action states that isomorphism classes of extensions of $Q$ by $N$ correspond bijectively to classes in $H^2(Q, Z(N))$, and an isomorphism of extensions preserves the class while a shared class builds an isomorphism of extensions \cite{corpus-72}. In both cases the record $\mu(P)$ therefore determines $P$ up to the stated equivalence. Neither construction outputs a theory or an observation, so the non-collapse argument of Section~3 leaves realization and selection unconstructed.
509:The fourth and fifth deliverables are constructions, and neither exists in the record. The realization map is stipulated as an arrow in the architecture and never built; the selection map has no definition of its observation object, no domain, no codomain, and no composition rule with coarse-graining. Until both are built, the identity of \cref{thm:conditional} stops at the mathematical layer.

exec
/usr/local/bin/zsh -lc "rg -n 'map_sum|map_list_sum' lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/{List,Finset} -g '*.lean'; rg -n 'mem_product' lean/.lake/packages/mathlib/Mathlib/Data/Multiset -g '*.lean'; nl -ba lean/Cmrps/Vol10ObservationalEquivalence.lean | sed -n '315,370p'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:650:@[simp] lemma op_sum (f : ι → M) : op (∑ x ∈ s, f x) = ∑ x ∈ s, op (f x) := map_sum opAddEquiv ..
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:653:  map_sum opAddEquiv.symm ..
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:778:  map_sum cardHom ..
lean/.lake/packages/mathlib/Mathlib/Data/Multiset/Bind.lean:341:@[simp] lemma mem_product : ∀ {p : α × β}, p ∈ s ×ˢ t ↔ p.1 ∈ s ∧ p.2 ∈ t
   315	def fisherForm {n : ℕ} (p a : Fin n → ℚ) : ℚ :=
   316	  ∑ i : Fin n, (a i * a i) / p i
   317	
   318	/-- Theorem 5.1 (Chentsov), statement skeleton (unproved; literature): every monotone
   319	Riemannian metric on the simplex is a positive multiple of the Fisher form. The
   320	monotonicity predicate is external to this skeleton and is left as a parameter. -/
   321	def chentsov_fisher_uniqueness {n : ℕ}
   322	    (monotone : ((Fin n → ℚ) → (Fin n → ℚ) → ℚ) → Prop) : Prop :=
   323	  ∀ g : (Fin n → ℚ) → (Fin n → ℚ) → ℚ,
   324	    monotone g → ∃ c : ℚ, 0 < c ∧ ∀ p a, g p a = c * fisherForm p a
   325	
   326	/-- Section 5.2: the summand `A_ij² / (λ_j f(λ_i/λ_j))` of the Morozova–Chentsov
   327	quadratic form. -/
   328	def mcTerm {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ) (A : Fin n → Fin n → ℚ)
   329	    (i j : Fin n) : ℚ :=
   330	  (A i j * A i j) / (lam j * f (lam i / lam j))
   331	
   332	/-- Section 5.2: the Morozova–Chentsov quadratic form
   333	`g_f^ρ(A,A) = ∑_{i,j} A_ij² / (λ_j f(λ_i/λ_j))`, with `lam` the eigenvalues of `ρ`. -/
   334	def mcQuadratic {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ) (A : Fin n → Fin n → ℚ) : ℚ :=
   335	  ∑ i : Fin n, ∑ j : Fin n, mcTerm f lam A i j
   336	
   337	/-- Normalization of an operator monotone representative: `f(1) = 1`. -/
   338	def NormalizedAtOne (f : ℚ → ℚ) : Prop := f 1 = 1
   339	
   340	/-- Petz self-reciprocity on the *positive* domain (the paper's classification
   341	identifies parameter functions on `x > 0` only): `f(x) = x f(x⁻¹)`. -/
   342	def SelfReciprocal (f : ℚ → ℚ) : Prop := ∀ x : ℚ, 0 < x → f x = x * f x⁻¹
   343	
   344	/-- The Petz transpose `f^#(x) = x f(x⁻¹)`. -/
   345	def petzTranspose (f : ℚ → ℚ) (x : ℚ) : ℚ := x * f x⁻¹
   346	
   347	/-- Theorem 5.2 (`petz_sudar_parametricity`), statement skeleton (unproved; literature):
   348	quantum monotone metrics correspond to operator monotone `f` with `f(1) = 1` and
   349	`f(x) = x f(x⁻¹)`, and distinct such `f` give distinct metrics on self-adjoint
   350	directions. Operator monotonicity is external to this skeleton and is left as a
   351	parameter. Scope caveats (Codex review, round 1): the injectivity clause is only
   352	meaningful for `n ≥ 2`, and the skeleton omits positivity of eigenvalues and
   353	tangent-direction hypotheses of the paper's classification; the formalized
   354	statement is deliberately weaker and is NOT the paper's theorem. -/
   355	def petz_sudar_parametricity {n : ℕ}
   356	    (monotone : ((Fin n → ℚ) → (Fin n → Fin n → ℚ) → ℚ) → Prop) : Prop :=
   357	  (∀ f : ℚ → ℚ, NormalizedAtOne f → SelfReciprocal f →
   358	      monotone (fun lam A => mcQuadratic f lam A)) ∧
   359	    (∀ m, monotone m → ∃ f : ℚ → ℚ, NormalizedAtOne f ∧ SelfReciprocal f ∧
   360	      ∀ lam : Fin n → ℚ, ∀ A : Fin n → Fin n → ℚ, m lam A = mcQuadratic f lam A) ∧
   361	    (∀ f g : ℚ → ℚ, SelfReciprocal f → SelfReciprocal g → f ≠ g →
   362	      ∃ lam : Fin n → ℚ, ∃ A : Fin n → Fin n → ℚ, mcQuadratic f lam A ≠ mcQuadratic g lam A)
   363	
   364	/-- Theorem 5.2, proof ingredient: the Petz transpose `f^#` yields the same quadratic
   365	form as `f` on symmetric (self-adjoint) directions, which is why self-reciprocity
   366	`f = f^#` is the correct normalization. -/
   367	theorem petz_transpose_same_form {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ)
   368	    (hpos : ∀ i, 0 < lam i) (A : Fin n → Fin n → ℚ) (hsymm : ∀ i j, A i j = A j i) :
   369	    mcQuadratic f lam A = mcQuadratic (petzTranspose f) lam A := by
   370	  have key : ∀ i j, mcTerm (petzTranspose f) lam A i j = mcTerm f lam A j i := by

exec
/usr/local/bin/zsh -lc 'command -v lean lake; ls -l lean/.lake/build/lib/lean/Cmrps/Vol10ObservationalEquivalence.olean lean/.lake/packages/mathlib/.lake/build/lib/lean/Mathlib.olean; lean --version' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
/Users/mlong/.elan/bin/lean
/Users/mlong/.elan/bin/lake
-rw-r--r--  1 mlong  staff  982744 Oct 30 06:55 lean/.lake/build/lib/lean/Cmrps/Vol10ObservationalEquivalence.olean
-rw-------  1 mlong  staff  795552 Oct 30 03:37 lean/.lake/packages/mathlib/.lake/build/lib/lean/Mathlib.olean
warning: failed to query latest release, using existing version 'leanprover/lean4:v4.35.0'
Lean (version 4.35.0, arm64-apple-darwin24.6.0, commit eb6cafb7290e8bd5f2937522d8d804f58f02bafc, Release)

codex
I found remaining gaps in the paper alignment: the cotangent result proves a product-space model, and the revised Petz statement still omits an operator-monotonicity hypothesis. Mathlib reimplementations also remain in the source; documenting them does not satisfy the requested no-reproof rule. Compiler verification is still pending.
exec
/usr/local/bin/zsh -lc "cat lean/lake-manifest.json; ls lean/.lake/packages; rg -n 'finite.variety|Finite.variety|classifying invariant|Parametrized' papers/latex/vol-04-yoneda-classification.tex | head -15; rg -n 'distinguish|prop:finiteposet|prop:distinguish' papers/latex/vol-08-spacetime-reconstruction.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
{"version": "1.3.0",
 "packagesDir": ".lake/packages",
 "packages":
 [{"url": "https://github.com/leanprover-community/mathlib4",
   "type": "git",
   "subDir": null,
   "scope": "",
   "rev": "56a005855ea17e0b0958f73ec801ae140b0a1679",
   "name": "mathlib",
   "manifestFile": "lake-manifest.json",
   "inputRev": "56a005855ea17e0b0958f73ec801ae140b0a1679",
   "inherited": false,
   "configFile": "lakefile.lean"},
  {"url": "https://github.com/leanprover-community/plausible",
   "type": "git",
   "subDir": null,
   "scope": "leanprover-community",
   "rev": "dfa4f38190d07c37e315953e08b90fe2d95b3c24",
   "name": "plausible",
   "manifestFile": "lake-manifest.json",
   "inputRev": "main",
   "inherited": true,
   "configFile": "lakefile.toml"},
  {"url": "https://github.com/leanprover-community/LeanSearchClient",
   "type": "git",
   "subDir": null,
   "scope": "leanprover-community",
   "rev": "d6b4c7be5be75ec4917c873ac50c756dc1436372",
   "name": "LeanSearchClient",
   "manifestFile": "lake-manifest.json",
   "inputRev": "main",
   "inherited": true,
   "configFile": "lakefile.toml"},
  {"url": "https://github.com/leanprover-community/import-graph",
   "type": "git",
   "subDir": null,
   "scope": "leanprover-community",
   "rev": "a41f0e9a4dea23188ea9cc1c41ac9f8bbafe0b93",
   "name": "importGraph",
   "manifestFile": "lake-manifest.json",
   "inputRev": "main",
   "inherited": true,
   "configFile": "lakefile.toml"},
  {"url": "https://github.com/leanprover-community/ProofWidgets4",
   "type": "git",
   "subDir": null,
   "scope": "leanprover-community",
   "rev": "df72b022e558978a1c50264cfc4d7fec86fa8e04",
   "name": "proofwidgets",
   "manifestFile": "lake-manifest.json",
   "inputRev": "main",
   "inherited": true,
   "configFile": "lakefile.lean"},
  {"url": "https://github.com/leanprover-community/aesop",
   "type": "git",
   "subDir": null,
   "scope": "leanprover-community",
   "rev": "4a174c490d8707121c4a9290800489f105d85e07",
   "name": "aesop",
   "manifestFile": "lake-manifest.json",
   "inputRev": "master",
   "inherited": true,
   "configFile": "lakefile.toml"},
  {"url": "https://github.com/leanprover-community/quote4",
   "type": "git",
   "subDir": null,
   "scope": "leanprover-community",
   "rev": "dce0ad79c486cb1fb504af04f953c3466b0c6db8",
   "name": "Qq",
   "manifestFile": "lake-manifest.json",
   "inputRev": "master",
   "inherited": true,
   "configFile": "lakefile.toml"},
  {"url": "https://github.com/leanprover-community/batteries",
   "type": "git",
   "subDir": null,
   "scope": "leanprover-community",
   "rev": "66e469188fe07963e5cf666c7d4433f45b8131c5",
   "name": "batteries",
   "manifestFile": "lake-manifest.json",
   "inputRev": "main",
   "inherited": true,
   "configFile": "lakefile.toml"},
  {"url": "https://github.com/leanprover/lean4-cli",
   "type": "git",
   "subDir": null,
   "scope": "leanprover",
   "rev": "c24fe6078c630e89b489bffe59b3e20ac30d12c8",
   "name": "Cli",
   "manifestFile": "lake-manifest.json",
   "inputRev": "v4.35.0",
   "inherited": true,
   "configFile": "lakefile.toml"}],
 "name": "Cmrps",
 "lakeDir": ".lake",
 "fixedToolchain": false}
Cli
LeanSearchClient
Qq
aesop
batteries
importGraph
mathlib
plausible
proofwidgets
63:The Yoneda embedding sends each object of a category to the functor it represents through its relationships with all other objects. This paper develops the relational characterization of mathematical representations of physical systems that the embedding supplies, and it states precisely what the embedding does not supply. The Yoneda lemma determines an object up to isomorphism by its relational profile, and the embedding is fully faithful on any locally small category of representations once the admissible morphisms are fixed. Concrete representability results for quantum supermaps show that in settings with channel-state duality the relational content is not merely formal, and the classical reconstruction theorems of Gelfand, Stone, and Doplicher and Roberts recover objects from categories of probes. Against these results stands a governing constraint: Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem. A non-implication theorem makes the third denial precise, because full faithfulness holds in categories where isomorphism classes admit no finite-variety parametrization, so representability cannot be the source of a classification theorem. The paper separates established mathematics from conjectural physical interpretation throughout and records the open problem of unifying the supermap line with the reconstruction pattern.
79:The relational profile of a representation determines that representation up to isomorphism in a declared category of morphisms, and it determines nothing beyond that isomorphism. Full faithfulness preserves isomorphism classes without constraining how those classes are parameterized, so relational data yields no classification invariants on its own. Concrete physical recovery happens only where extra structure is assumed: channel-state duality for quantum supermaps, symmetric monoidal structure for Doplicher-Roberts reconstruction. On the positive side stand the Yoneda lemma and its corollaries, the Choi correspondence and the supermap representability it supports \cite{whh, hw}, and the probe reconstruction theorems with their declared hypotheses \cite{gn, stone, dr}. On the negative side stands a non-implication theorem: full faithfulness holds in categories where isomorphism classes admit no finite-variety parametrization \cite{buchweitz}, so representability cannot be the source of a classification theorem. No theorem joins the two sides; \cref{sec:synthesis} records the open problem that would.
244:Let $\mathcal{C}$ be a category of representations and let $S$ be a parameter set. An \emph{invariant} is a map $I \colon \mathrm{Ob}(\mathcal{C}) \to S$ constant on isomorphism classes. The invariant $I$ \emph{classifies} $\mathcal{C}$ up to isomorphism when $I(P) = I(Q)$ implies $P \cong Q$; a family of invariants classifies when the joint map does. A classification is \emph{of finite-variety type} over a field $k$ when the parameter set $S$ is the set of $k$-points of a finite-dimensional algebraic variety over $k$. A class of objects is \emph{parametrized by a finite-dimensional variety over $k$} when such a classifying invariant of finite-variety type exists.
247:In the series vocabulary a classifying invariant is an invariant of this kind whose value determines the object up to the chosen equivalence, in the manner of a Dynkin diagram for semisimple Lie algebras or a dimension vector for finite-dimensional $C^*$-algebras. The Yoneda embedding supplies no such data: $y(P)$ is a functor rather than a value in a parameter space, and deciding $y(P) \cong y(Q)$ is in general as hard as deciding $P \cong Q$. The temptation the governing constraint guards against is to read determination by relationships as classification. The next theorem separates the two notions formally; its witness is the boundary of representability itself rather than a counterexample to any published claim.
273:\caption{Four regimes of structural knowledge. The Yoneda embedding supplies determination; classification content comes from the invariants of each family; the wild regimes forbid finite-variety classification outright.}
282:Forbidden in the stated generality & Modules over the generic determinant & None of finite-variety type & Classification itself \\
581:\emph{Classification.} Theorem~\ref{thm:noimplication} shows that full faithfulness of $y$ is logically compatible with the absence of any finite-variety parametrization of isomorphism classes. The classification problem of the series asks for invariants separating objects up to a chosen equivalence; profiles separate objects up to isomorphism by a different mechanism, and the two must not be confused. Where classification content exists for a family of systems, it comes from the invariants of that family, not from representability.
57:This paper classifies and reconstructs spacetime and separates what is proved from what is proposed. Four results are complete within their stated hypotheses: connected holonomy groups of Lorentzian manifolds in signature $(1,n-1)$ are classified and realized by explicit metrics; the causal ladder of spacetimes is complete as a hierarchy of causality conditions; closed 3-manifolds decompose into exactly eight Thurston geometries; and for two, three, and four boundary regions the holographic entropy cone is cut out by strong subadditivity together with monogamy of mutual information. Against these islands, the homeomorphism problem for closed 4-manifolds is algorithmically undecidable, so finite classification tables exist only in tame regimes. Reconstruction recovers a target geometry from relational probe data: the chronological order determines the topology and the conformal class of a distinguishing spacetime, and entanglement-wedge reconstruction recovers bulk operators from boundary subregions in a quantum-information setting. The Ryu-Takayanagi formula remains a proposal, with exact agreement in AdS$_3$/2D CFT and for spherical regions in higher dimensions, HaPPY codes realize it in toy models only, and entanglement-induced geometry is an argument. Two boundary statements delimit the subject: monogamy of mutual information is independent of strong subadditivity over entropic vectors, and the ladder depends on how its rungs are translated to discrete orders.
66:Metric reconstruction from non-metric data succeeds classically up to a conformal factor and remains partially conjectural in the quantum setting. In distinguishing spacetimes of dimension $n \ge 3$ the chronological order determines the manifold topology and the conformal metric class \cite{malament,hkm}. Holographic reconstruction operates rigorously only inside restricted code subspaces: boundary subregions reconstruct bulk operators in their entanglement wedge \cite{dongharlowwall}, while the identification of bulk areas with boundary entropies remains an unproved variational prescription \cite{ryutakayanagi}, its toy-model realizations \cite{haappy} and its entanglement arguments \cite{vanraamsdonk} notwithstanding. The proved determination theorems and the proposals are kept in separate sections below, and the proposals never carry the theorems' authority.
72:Two boundary statements are made precise here. Monogamy of mutual information is not implied by strong subadditivity even over classical entropic vectors; the perfectly correlated triple of \Cref{prop:mmi} is the standard counterexample of the holographic-entropy literature \cite{hhm,baoetal}, recorded with a short self-contained derivation. The causal ladder, read as a hierarchy of order-theoretic conditions, depends on how its rungs are translated to discrete orders: the compactness rung holds universally in finite orders while the strict-chronology reading of distinguishing fails there (\Cref{prop:finiteposet}, \Cref{prop:distinguish}).
89:A Lorentzian spacetime is \emph{chronological} when no closed timelike curve exists, \emph{causal} when no closed causal curve exists, \emph{distinguishing} when $I^-(p) = I^-(q)$ implies $p = q$ and $I^+(p) = I^+(q)$ implies $p = q$ (past-distinguishing and future-distinguishing), \emph{strongly causal} when every event has a neighborhood base of causally convex open sets, \emph{stably causal} when a time function exists, \emph{causally continuous} when distinguishing and the maps $p \mapsto I^{\pm}(p)$ are outer continuous (the spacetime is reflecting), \emph{causally simple} when distinguishing and each $J^+(p)$, $J^-(p)$ is closed, and \emph{globally hyperbolic} when the spacetime is causal and $J^+(p) \cap J^-(q)$ is compact for all $p, q$. These conditions form the \emph{causal ladder}, ordered from chronology to global hyperbolicity \cite{minguzzisanchez}. Causality is part of the definition of global hyperbolicity: compact diamonds alone do not exclude closed causal curves.
125:The program distinguishes a proved theorem from a proposal and an argument. In this paper, theorems are cited with their hypotheses and their sources, propositions proved here carry complete proofs, and the conjectural holographic material is marked as proposal or argument in every section where it appears. Computational evidence is evidence and is never presented as proof.
240:For Lorentzian spacetimes the causality conditions of \Cref{def:ladder} form a strict chain: global hyperbolicity implies causal simplicity, which implies causal continuity, which implies stable causality, which implies strong causality, which implies distinguishing, which implies causality, which implies chronology. Each implication is strict: for each pair of adjacent rungs there exists a spacetime satisfying the lower rung and violating the higher one. Global hyperbolicity is the strongest of the standard causality conditions, and it is equivalent to the compactness of causal diamonds $J^+(p) \cap J^-(q)$ together with the absence of closed causal curves \cite{minguzzisanchez}.
244:The implications are proved in the source in a single framework with minimal hypotheses; the strictness is proved by constructing, for each pair of adjacent rungs, a separating spacetime, and the equivalences at the top rung are proved by the compactness characterization of global hyperbolicity. The survey of Minguzzi and S\'{a}nchez also records the alternative definitions of each rung and the smoothability results needed to make the examples smooth. The contribution of this paper begins at \Cref{prop:finiteposet}, where the ladder is tested against a different category of causal models.
272:\Cref{tab:ladder} doubles as the checklist used by the finite-order tests of \Cref{prop:finiteposet} and \Cref{prop:distinguish}: the compactness rung passes on every finite order and the distinguishing rung fails on the antichain, which is the first row where the discrete translation breaks.
276:\begin{proposition}[Finite orders satisfy the compactness rung]\label{prop:finiteposet}
284:\begin{proposition}[Distinguishing fails in finite orders under the strict reading]\label{prop:distinguish}
285:Read the ladder rungs on an order by translating the open futures and pasts literally: $I^+(x) = \{ y : x < y \}$ and $I^-(x) = \{ y : y < x \}$. Under this translation there exists a finite order satisfying the conclusions of \Cref{prop:finiteposet} and failing distinguishing: for the two-element antichain $X = \{a, b\}$ with $a$ and $b$ incomparable, one has $I^-(a) = I^-(b) = \emptyset$ and $I^+(a) = I^+(b) = \emptyset$ for distinct points.
289:In an antichain no two distinct points are related, so every chronological future and past is empty. Distinct points therefore carry identical pasts and identical futures, while the order-theoretic compactness of intervals holds vacuously. This is exactly the failure mode \Cref{def:ladder} forbids at the distinguishing rung.
293:Rung membership of the causal ladder is not invariant under the translation from continuum definitions to orders. The strict reading of \Cref{prop:distinguish} fails on finite orders while the compactness rung holds universally there, and the reflexive reading built from causal futures $J^{\pm}(x) = \{ y : y \le x \}$ is distinguishing on every antisymmetric order by construction. A discrete causality theory must therefore state which translation it uses, and the rungs cannot be carried over verbatim from the manifold category.
297:Combine \Cref{prop:finiteposet} and \Cref{prop:distinguish} with \Cref{thm:ladder}. In the manifold category global hyperbolicity implies distinguishing. In the finite-order reading, the analogue of global hyperbolicity holds on the antichain and the analogue of distinguishing fails. The implication structure therefore differs between the two categories.
440:Let $(M,g)$ and $(M',g')$ be time-oriented distinguishing spacetimes of dimension $n \ge 3$ and let $\varphi \colon M \to M'$ be a bijection preserving the chronological order: $p \prec q$ if and only if $\varphi(p) \prec' \varphi(q)$ for all $p, q$. Then $\varphi$ is a diffeomorphism and a conformal isometry. Consequently the chronological order determines the topology of $M$ and the conformal class $[g]$ of the metric \cite{malament,hkm}.
444:The argument has two stages. First, the chronological order determines the topology: Malament shows that an order-preserving bijection between distinguishing spacetimes is a homeomorphism, using order arguments on chains of timelike curves rather than any metric. Second, a homeomorphism that maps timelike curves to timelike curves preserves the conformal class, and in dimension $n \ge 3$ the causal, differential, and conformal structures of a spacetime determine each other, so the homeomorphism upgrades to a smooth conformal isometry \cite{hkm}. The complete argument is Malament's \cite{malament} with the smooth upgrade of \cite{hkm}. In dimension $n = 2$ the conclusion fails: in null coordinates $(u,v)$ on $\mathbb{R}^{1,1}$ the map $(u,v) \mapsto (u^3, v)$ preserves the chronological order but its inverse is not smooth at $u = 0$.
447:\Cref{thm:malament} is the strongest reconstruction statement in this volume, and its scope is exactly the scope of \Cref{def:reconstruction}: the probe datum is the chronological order, the class is the distinguishing spacetimes, and the equivalence is the conformal isometry class. The next corollary records the boundary of the theorem.
454:Conformal rescaling of a metric by a positive function $e^{2f}$ preserves the timelike cones of every tangent space, hence preserves the chronological order. Distinct conformal factors give distinct metrics with the same probe datum, so no procedure reading the order can distinguish them. Any reconstruction of the full metric must add data that breaks the conformal freedom.
457:Two unrelated topologies share the name Alexandrov in English transliteration. The open-diamond topology on a spacetime, due to A. D. Alexandrov, is generated by the sets $I^+(p) \cap I^-(q)$ and is sensitive to causality; the up-set topology on a poset, due to P. S. Alexandroff, is generated by up-sets and is generally not $T_1$. The two are distinguished by name throughout what follows.
464:Each diamond $I^+(p) \cap I^-(q)$ is defined by two order relations, so the family of diamonds is a function of the order, and the intersection of two diamonds is a union of diamonds. The identification of the diamond topology with the manifold topology under strong causality is the standard characterization recorded in the causal-hierarchy survey \cite{minguzzisanchez}. For merely distinguishing spacetimes the coincidence can fail, which is why \Cref{thm:malament} uses Malament's order-continuity argument instead of this topological shortcut.
472:The closed sets of the up-set topology are the down-sets. The closure of $\{x\}$ is the intersection of all down-sets containing $x$, which is the smallest such down-set $\{y : y \le x\}$. For $T_0$, take $x \ne y$. Not both $x \le y$ and $y \le x$ hold. If $x \not\le y$ then $X \setminus \{z : z \le y\}$ is an up-set containing $x$ and not $y$; if $y \not\le x$ the symmetric set separates $y$ from $x$. In either case an open set distinguishes the pair. The order is then recovered from the closures as stated.
475:\Cref{prop:specialization} is the order-theoretic analogue of the topological step in \Cref{thm:malament}, but it is not the same topology: \Cref{lem:alexandrov} concerns the open-diamond topology of A. D. Alexandrov on a spacetime, while \Cref{prop:specialization} concerns the up-set topology of P. S. Alexandroff on a poset. In both cases a topology built from the order recovers the order. What \Cref{prop:distinguish} blocks is the next step, the passage from order to geometry; that passage uses smoothness in \Cref{thm:malament} and has no finite-order analogue.
539:The entropy experiment evaluates \eqref{eq:ssa} and \eqref{eq:mmi} on the witness vector of \Cref{prop:mmi} and on random classical distributions of three binary variables. The witness reproduces the proof exactly: every strong subadditivity inequality holds and monogamy fails by a margin of one. The random samples never violate strong subadditivity and violate monogamy in a positive fraction of cases, which is the computational shape of \Cref{cor:classicalmmi}. The finite-order experiment enumerates the 242 partial orders on at most four labeled points and takes a census of the ladder rungs: no order carries an increasing loop, only 33 of the orders are distinguishing, and the antichain of two points is the witness of \Cref{prop:distinguish}. The Alexandroff experiment builds the up-set topology on each enumerated order and verifies \Cref{prop:specialization}: the closure of each singleton is its down-set and the topology recovers the order.
573:Distinguishing census & \texttt{is\_distinguishing()} over orders to 4 points & 33 of 242 orders are distinguishing \\
574:Antichain distinguishing & \texttt{check\_antichain()} & Equal empty pasts and equal empty futures \\
611:The finite-order experiment enumerates every partial order on at most four labeled points and takes a census of the ladder rungs. The loop check of \Cref{prop:finiteposet} and the interval check are definitional on a finite ground set and are reported as such; the informative output is the distinguishing census: only 33 of the 242 enumerated orders are distinguishing, and the antichain of two points fails distinguishing while passing the interval check, as \Cref{prop:distinguish} states. The companion Alexandroff experiment rebuilds each order from its up-set topology and verifies \Cref{prop:specialization}: the closure of each singleton is its down-set, so the topology recovers the order.
613:\begin{lstlisting}[language=Python,caption={The rung checks from \texttt{causal\_ladder\_finite\_posets.py}: loop detection, the distinguishing census, and the antichain witness.},label=lst:posets]
630:def is_distinguishing(le, n):
631:    # Past- and future-distinguishing (Definition 2.3).
651:The Python experiments test finite instances of the propositions proved in \Cref{prop:mmi}, \Cref{prop:finiteposet}, and \Cref{prop:distinguish}; the Haskell instances type the objects of \Cref{def:systems}. The evidence is reproducible from the files in the appendix and is not proof. Nothing in this volume has been checked by a proof assistant, and the mechanization targets are recorded separately as targets. This volume depends on the shared definitions and on the registered background results it cites. It does not depend on any statement about the entropy cone for six or more regions, on the Ryu-Takayanagi formula outside its stated settings, or on tensor-network toy models as evidence about gravity; where a result needs those inputs, the conditional phrasing appears in the statement.
737:\Cref{prop:finiteposet} on enumerated orders & \path{causal_ladder_finite_posets.py} & \texttt{has\_increasing\_loop()}, \texttt{intervals\_finite()} \\
738:\Cref{prop:distinguish} on the antichain & \path{causal_ladder_finite_posets.py} & \texttt{check\_antichain()} \\

exec
/usr/local/bin/zsh -lc "lake env python3 -c 'import concurrent.futures,glob,subprocess; paths=sorted(glob.glob(\"Cmrps/*.lean\"));
def check(p):
 r=subprocess.run([\"lean\",p],capture_output=True,text=True); return p,r.returncode,r.stdout+r.stderr
with concurrent.futures.ThreadPoolExecutor(max_workers=3) as pool:
 for p,code,out in pool.map(check,paths):
  print(p,\"exit\",code,flush=True)
  if code: print(out,flush=True)
  else: print(\"diagnostic lines:\",len(out.splitlines()),flush=True)'" in /Users/mlong/Documents/Development/classification-physical-systems/lean
exec
/usr/local/bin/zsh -lc "sed -n '235,260p' papers/latex/vol-04-yoneda-classification.tex; sed -n '100,155p' papers/latex/vol-11-completeness-obstructions.tex; sed -n '337,355p' papers/latex/vol-12-principia-physica.tex; sed -n '105,135p' papers/latex/vol-08-spacetime-reconstruction.tex; sed -n '625,647p' papers/latex/vol-08-spacetime-reconstruction.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
\end{proof}

Tensor products behave differently. There is in general no canonical map relating $\Hom(R, P \otimes Q)$ to $\Hom(R, P) \otimes \Hom(R, Q)$, and the profile of a composite system is not assembled from the profiles of its factors by any universal construction available to the embedding. Determination of composites from relational data is therefore not a formal consequence of Yoneda; where it holds, it holds by a further theorem. The factorisation results of \cref{sec:supermap} are exactly such a theorem for the composition of processes under a causal-order hypothesis, and the decomposition theory of representation categories is such a theory for tensor structure. This asymmetry is a design fact of the relational program: limits are transparent to probes, monoidal composition is not.

\subsection{The classification question}
\label{sec:classification}

\begin{definition}[Classification by invariants]
\label{def:classify}
Let $\mathcal{C}$ be a category of representations and let $S$ be a parameter set. An \emph{invariant} is a map $I \colon \mathrm{Ob}(\mathcal{C}) \to S$ constant on isomorphism classes. The invariant $I$ \emph{classifies} $\mathcal{C}$ up to isomorphism when $I(P) = I(Q)$ implies $P \cong Q$; a family of invariants classifies when the joint map does. A classification is \emph{of finite-variety type} over a field $k$ when the parameter set $S$ is the set of $k$-points of a finite-dimensional algebraic variety over $k$. A class of objects is \emph{parametrized by a finite-dimensional variety over $k$} when such a classifying invariant of finite-variety type exists.
\end{definition}

In the series vocabulary a classifying invariant is an invariant of this kind whose value determines the object up to the chosen equivalence, in the manner of a Dynkin diagram for semisimple Lie algebras or a dimension vector for finite-dimensional $C^*$-algebras. The Yoneda embedding supplies no such data: $y(P)$ is a functor rather than a value in a parameter space, and deciding $y(P) \cong y(Q)$ is in general as hard as deciding $P \cong Q$. The temptation the governing constraint guards against is to read determination by relationships as classification. The next theorem separates the two notions formally; its witness is the boundary of representability itself rather than a counterexample to any published claim.

\begin{theorem}[Representability does not imply classifiability]
\label{thm:noimplication}
Let $n \geq 3$, let $S = k[x_{ij}]$ be the polynomial ring over a field $k$ in the entries of a generic $n \times n$ matrix, let $R = S/(\det(x_{ij}))$ be the coordinate ring of the generic determinant hypersurface, and let $\mathcal{C}$ be the category of finitely generated maximal Cohen-Macaulay $R$-modules of rank two, with $R$-module homomorphisms as morphisms. The objects of $\mathcal{C}$ admit no parametrization by a finite-dimensional variety over $k$ in the sense of Definition~\ref{def:classify}, while $y$ is fully faithful on $\mathcal{C}$. Full faithfulness of the Yoneda embedding therefore does not imply the existence of a classification theorem.
\end{theorem}

\begin{proof}
The category $\mathcal{C}$ is locally small, so Theorem~\ref{thm:yoneda} and Corollary~\ref{cor:faithful} apply: $y$ is fully faithful on $\mathcal{C}$. The non-parametrization is the classification result of Buchweitz and Leuschke \cite{buchweitz} for modules over the generic determinant of an $n \times n$ matrix with $n \geq 3$; the bound on $n$ is part of their setting, since the small cases are tame. Their conclusion is exact: the Cohen-Macaulay representation theory of the generic determinant is wild in the tame-wild dichotomy, and in their words it is quite wild, since even in rank two the isomorphism classes cannot be parametrized by a finite-dimensional variety over the coefficients. Rank two is precisely the case their statement covers, which is why $\mathcal{C}$ is defined there. Both statements hold in the same category: a classification in the sense of Definition~\ref{def:classify} is absent for $\mathcal{C}$, while full faithfulness of $y$ on $\mathcal{C}$ is complete. If full faithfulness implied classifiability, no such category would exist; the category exists; so the implication fails.
\end{proof}

\begin{remark}[Scope of the non-implication]
\label{rem:scope}
Theorem~\ref{thm:noimplication} denies an implication; it does not deny that relational data is useful. In tame regimes relational methods convert into invariants, and Sections~\ref{sec:supermap} and~\ref{sec:reconstruction} exhibit settings where they do. The theorem says that the conversion is a further theorem, with hypotheses, and that it cannot be smuggled in as a consequence of representability. The wider wildness literature reinforces the point: every finite-dimensional algebra over an algebraically closed field is derived tame or derived wild, and wildness is preserved under degeneration \cite{bekkert}, so the failure pattern is structural rather than isolated.
\label{def:adm}
An admissible representation is one satisfying four consistency conditions: internal consistency of the five components of \Cref{def:tuple}; closure of the observable algebra under its stated operations; existence of a well-posed dynamics; and compatibility of symmetry data with composition. The full subcategory of admissible representations is $\mathrm{Phys}_{\mathrm{adm}}$. A structural family is a full subcategory of representations singled out by its underlying mathematical structure, and a family collection is a set $\mathfrak{F} = \{\mathfrak{F}_\alpha\}_{\alpha \in A}$ of them. The construction set $\mathfrak{C}$ consists of tensor product, direct sum, extension, limits and colimits, and factorization, and the closure $\langle \mathfrak{F}_\alpha \rangle_{\mathfrak{C}}$ is the smallest class containing $\mathfrak{F}$ and closed under $\mathfrak{C}$.
\end{definition}

The central conjecture of the program asserts
\[
\mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F}_\alpha \rangle_{\mathfrak{C}}
\]
for some such family collection and construction set. The candidate conditions of \Cref{def:adm} are the ones the program names; the list is not fixed by any settled mathematics, and every statement quantifying over $\mathrm{Phys}_{\mathrm{adm}}$ is therefore conditional on the list one adopts. The conjecture is registered as an object of study and as a declared hypothesis only; it is never used as a lemma in this paper, and no result here assumes it true or false.

\begin{remark}[Unfixed premise]
\label{rem:unfixed}
Completeness of a classification over $\mathrm{Phys}_{\mathrm{adm}}$ cannot be evaluated against a moving premise. Until the admissibility list is fixed, the first proof obligation of the universal classification conjecture is not merely open; its statement is conditional. This is an obstruction of an internal kind, and it is the reason the analysis below runs on domains with standard mathematical definitions rather than on $\mathrm{Phys}_{\mathrm{adm}}$ itself.
\end{remark}

\subsection{Claim discipline}

Three levels of achievement are distinguished throughout: mathematical formulation, rigorous theorem, and physical validation. The results of this paper sit at the second level. Nothing in this paper establishes physical validation of any representation, and no mathematical classification established here is presented as an empirical selection among physical theories. Where a claim rests on an announcement rather than a published proof, the text says so; one such claim is tracked in a remark outside the regime table.

\section{Obstruction register}

Each obstruction below is a proved theorem, and it decides a question a classification program would otherwise have to settle by effort. Two conventions govern the collection. Only theorems with complete proofs in the mathematical literature enter; announcements stay out until they are proved. And an obstruction is recorded at the generality its proof supports: an undecidability result about finitely presented groups says nothing about finite groups, and a wildness result about modules over a specific algebra says nothing about modules over algebras on the tame side. Reading the register is a matter of reading the quantifiers.

Each row is a theorem, and each theorem decides a question that a classification program would otherwise have to decide by effort. The seven rows divide by the component of \Cref{def:program} they destroy: the invariant, the parameter space, the recognizer, or the equivalence itself.

\subsection{Factor classification}

The classification of von Neumann algebra factors reduces, by the Murray-von Neumann direct-integral decomposition, to the classification of factors, and the amenable factors are classified: types $\mathrm{I}_n$, $\mathrm{I}_\infty$, $\mathrm{II}_1$, $\mathrm{II}_\infty$, $\mathrm{III}_\lambda$ for $0 < \lambda \leq 1$, and $\mathrm{III}_0$, with the type $\mathrm{III}_0$ case described by ergodic flows \cite{connes1976,vnwiki}. Outside the amenable class the situation changes completely. McDuff proved in 1969 that there are uncountably many non-isomorphic separable type $\mathrm{II}_1$ factors \cite{mcduff1969}.

What this forbids is a total classification of factors in the style of the classification of finite simple groups: no list of families and finitely many exceptions can exhaust the separable $\mathrm{II}_1$ factors, and no countable table of isomorphism classes can be complete. What it permits is a classification of the amenable class, which exists, and stratification of the general case by invariants of coarser grain, such as the Connes spectrum, which records partial information only \cite{vnwiki}.

\subsection{Tensor-category recovery}
\label{sec:tensor-recovery}

A natural proposal for identifying physical systems is to compare their representation categories as tensor categories and declare two systems equivalent when the categories are equivalent. The proposal fails. Etingof and Gelaki constructed pairs of non-isomorphic finite groups whose representation categories are equivalent as plain tensor categories \cite{eg2000}. The symmetric structure of the category is not recoverable from the plain tensor layer, and two different symmetry groups present the same plain tensor representation theory.

What this forbids is any classification or equivalence criterion that discards the monoidal or symmetric layer: such a criterion is not merely imprecise, it is false on explicit counterexamples. What it permits is the Doplicher-Roberts style of reconstruction, which takes the symmetric tensor structure with its conjugates, direct sums, subobjects, and $\operatorname{End}(1) = \mathbb{C}$ as input and recovers a compact supergroup unique up to isomorphism \cite{eg2000}. The counterexample is the sharpest constraint in the register, and it is applied twice more in this paper: as an impossibility theorem in the transport analysis, and as a counterexample to a natural completion of the universal conjecture.

\subsection{Markov undecidability}

A classification program can aim at an algorithm: given a presentation of an object, decide which isomorphism class it lies in. For finitely presented groups this aim fails at the root. Adyan and Rabin proved that every Markov property of finitely presentable groups is algorithmically undecidable \cite{adyan1955,rabin1958}. The list of Markov properties includes being trivial, being finite, and being simple, so even the coarsest structural tests on finitely presented groups admit no uniform decision procedure. Collins extended undecidability beyond Markov properties, proving that the Hopfian property is undecidable even though neither it nor its negation is Markov \cite{collins1969}.

What this forbids is any uniform recognition procedure for group-flavored sectors of a classification, including recognition of finiteness and simplicity. What it permits is decision of the same properties on restricted subclasses where the Markov construction does not embed, and it permits recognition procedures that are partial or that come with error. The proof reduces the halting problem to the group property through a Markov set construction, and Section 5 builds transport results on the same reduction pattern.

\subsection{Wildness}

The tame-wild dichotomy of Drozd is the boundary of parametrizable representation theory. Bekkert and Drozd proved that every finite-dimensional algebra over an algebraically closed field is derived-tame or derived-wild, and that any degeneration of a derived-wild algebra is again derived-wild \cite{bekkert2003}. Wildness is a property of the category of representations, and it is a non-classifiability statement rather than a difficulty rating. Buchweitz and Leuschke showed that the Cohen-Macaulay representation theory of the generic determinant is wild in a strong sense: already in rank two the isomorphism classes cannot be parametrized by a finite-dimensional variety over the coefficients \cite{buchweitz2005}. Grevstad and May proved that the cohomological Mackey algebra is derived-wild whenever the group surjects onto a $p$-group of order greater than two, and concluded that no meaningful classification of compact $C_p$-equivariant $H\underline{\mathbb{F}}_p$-modules exists at odd primes \cite{grevstad2025}.

What this forbids is any finite-variety parameterization of the isomorphism classes of a wild representation category, and any classification of a domain that contains such a category as an isomorphism-reflecting subcategory. What it permits is a complete classification theory on the tame side, where parametrizations do exist, and partial invariants on the wild side that ignore the wild core.

\subsection{Four-manifold unrecognizability}

In dimension three the geometrization theorem decomposes every oriented prime closed 3-manifold into pieces carrying one of exactly eight Thurston geometries \cite{geometrization}. In dimension four the finite-table picture breaks. Markov's construction shows that unrecognizable four-manifolds exist, that is, manifolds for which the homeomorphism problem is undecidable. Tancer sharpened the construction to show that the connected sum of nine copies of $S^2 \times S^2$ is unrecognizable, improving the previous bound of twelve due to Gordon \cite{tancer2023}. Filipkiewicz classified the four-dimensional maximal model geometries and found eighteen of them plus one countably infinite family, against exactly eight in dimension three \cite{geometrization,perelman,hillman}.

What this forbids is any effective classification of four-manifolds in general, and any assumption that the finite-list paradigm of dimension three persists upward. What it permits is classification of restricted four-manifold classes, and the dimension contrast itself: finite tables exist in tame regimes, and dimension four is not one of them.


The honest summary of the realization layer is therefore asymmetric. Reconstruction from probes is strong where the probes are algebraic or categorical. Reconstruction of interacting dynamics and of spacetime itself from primitive data remains open.

\section{The empirical layer}
\label{sec:empirical}

The empirical layer $\mathcal{E}$ is where mathematical classification stops and observational selection begins.

\begin{theorem}[Survey: classical uniqueness and quantum parametricity, assembled from Chentsov and Petz-Sudar]
\label{thm:monotone}
The Fisher metric is the unique Riemannian metric, up to constant factor, that is monotone under stochastic maps. Quantum monotone metrics are classified by operator monotone functions, a parametric family containing more than one element. Classical uniqueness therefore does not extend to the quantum case, and any quantum distinguishability criterion must either select within the parametric family and justify the selection or carry the family as data.
\end{theorem}

\begin{proof}
The first statement is Chentsov's theorem \cite{corpus-52}. The second is the Petz-Sudar classification \cite{corpus-52}. The parameterizing class of operator monotone functions contains more than one element; for instance the identity function and the affine function $f(x) = (x+1)/2$ are both operator monotone and give different metrics. The uniqueness statement is therefore false in the quantum case, and the last clause follows: a criterion that names a single quantum monotone metric makes an additional choice beyond the classification theorem.
\end{proof}

\Cref{thm:monotone} fixes what empirical distinguishability can borrow from information geometry. In the classical case the statistical distance is canonical. In the quantum case the statistical distance is a choice inside a proved parameterization, so an observational equivalence relation built on such distances must state the choice.

The inequality applies to every choice of disjoint $A$, $B$, $C$; for single regions it reads as stated, and for composite regions it gives the coarse-grained instances used at $n = 4$.
\end{definition}

\begin{definition}[Holographic entropy cone]\label{def:cone}
Fix $n$ boundary regions of a conformal field theory with a smooth static classical Einstein dual. The Ryu-Takayanagi prescription assigns each region $A$ the area of a minimal bulk surface homologous to $A$ in a static slice; the resulting vectors $S$ lie in the \emph{holographic entropy cone} $\mathcal{H}_n \subseteq \mathbb{R}^{2^n-1}$, the closure of vectors realized by such surfaces. An \emph{RT inequality} is a linear inequality valid on $\mathcal{H}_n$ \cite{baoetal}. Staticity keeps the minimal-area prescription of \cite{ryutakayanagi} in force; a covariant extremal-surface prescription exists \cite{hrt} and is not used in this paper.
\end{definition}

\begin{definition}[Reconstruction from probes]\label{def:reconstruction}
A \emph{probe datum} for a class of spacetimes is a rule assigning to each spacetime relational data $D(M,g)$ that does not name the metric: a causal order, a family of curves, an algebra of observables, a set of entropies. A \emph{reconstruction} of a target $T$ from $D$ is a procedure which recovers $T$ from $D(M,g)$ for every spacetime in a stated class, together with a proof that the recovery is faithful for a stated equivalence: isometry, conformal isometry, or isomorphism. A reconstruction theorem must state its class, its datum, and its equivalence; a reconstruction claim without all three is incomplete.
\end{definition}

\begin{definition}[Systems of this volume]\label{def:systems}
The physical systems of this volume are tuples $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ in which $X$ carries geometric data: a smooth manifold with a Lorentzian metric, a causal relation, a holonomy group, or one of the Thurston geometry types. Entropy-vector systems carry measure-theoretic data and are included because the holographic cone is defined on them. All equivalences used in this volume are stated in the results that use them; none is assumed silently.
\end{definition}

\begin{definition}[Spacetime classification problem]\label{def:classify}
Fix a dimension $n$ and an equivalence $\simeq$ among isometry, conformal equivalence, and diffeomorphism. The \emph{classification problem} $\mathrm{Class}(\mathrm{Lor}_n / \simeq)$ is the problem of describing the equivalence classes of Lorentzian spacetimes of dimension $n$ by a complete set of invariants: a list of values such that two spacetimes carry the same values exactly when they are $\simeq$-equivalent. A solution must state the equivalence, the invariant, and the class; a list of invariants that is constant on classes but not separating on them is a partial solution only.
\end{definition}

\begin{remark}[Claim status]\label{rem:status}
The program distinguishes a proved theorem from a proposal and an argument. In this paper, theorems are cited with their hypotheses and their sources, propositions proved here carry complete proofs, and the conjectural holographic material is marked as proposal or argument in every section where it appears. Computational evidence is evidence and is never presented as proof.
\end{remark}

\section{Classification invariants}

A classification is only as sharp as the invariant it uses. \Cref{tab:invariants} records the invariants in force for this volume: five rows classify their stated targets completely within stated classes, and one row records the open reconstruction problem.

\begin{table}[t]
\centering
\caption{Classification invariants of this volume. ``Scope'' names the class the invariant classifies; ``Status'' records whether the classification is complete, partial, or open.}
\label{tab:invariants}
                    return True
                if nxt not in seen:
                    stack.append((nxt, seen | {nxt}))
    return False

def is_distinguishing(le, n):
    # Past- and future-distinguishing (Definition 2.3).
    for x in range(n):
        for y in range(n):
            if x == y:
                continue
            px, fx = past_future(le, x, n)
            py, fy = past_future(le, y, n)
            if px == py or fx == fy:
                return False
    return True
\end{lstlisting}

\section{Limitations}

Every proved result here classifies a narrow target rather than spacetime itself. The holonomy classification \cite{galaev} classifies holonomy groups and not spacetimes. The causal ladder \cite{minguzzisanchez} classifies causality conditions and not geometries. Geometrization \cite{perelman,thurston1982} classifies closed 3-manifolds, and \Cref{thm:tancer} shows there is no algorithmic analogue in dimension four. The entropy cone theorem \Cref{thm:cone} classifies entropy vectors produced by a proposal. No theorem in this paper classifies Lorentzian spacetimes themselves up to isometry, and no such theorem is claimed.

The holographic material is a proposal in all of its parts. The Ryu-Takayanagi formula has exact checks in special settings \cite{ryutakayanagi,casinimyers} and a physics-level replica derivation for static bulk geometries \cite{lewkowyczmaldacena}, and it is not a theorem. The HaPPY codes prove statements about toy models \cite{haappy}. The entanglement-connectedness statement is an argument \cite{vanraamsdonk}. Every result of this paper that touches holography is stated conditionally on the prescription, and the conditionality is written where the result is used.

exec
/usr/local/bin/zsh -lc "python3 -c 'import re,pathlib
for name in [\"vol-01-foundations\",\"vol-03-irreducibility-decomposition\",\"vol-05-classical-systems\",\"vol-06-quantum-systems\",\"vol-07-gauge-qft\",\"vol-09-gravity-information-geometry\"]:
 p=pathlib.Path(\"papers/latex\")/(name+\".tex\"); s=p.read_text(); print(\"FILE\",p)
 for m in re.finditer(r\"\\\\begin\\{(theorem|proposition|lemma|corollary)\\}.*?\\\\end\\{\\1\\}\",s,re.S):
  block=m.group(); print(\"LINE\",s.count(\"\\n\",0,m.start())+1,block)
'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 39ms:
FILE papers/latex/vol-01-foundations.tex
LINE 240 \begin{proposition}[Composition is not typed]
\label{prop:composition-not-typed}
There are records $P_1, P_2, P_3$ and morphisms $e \colon P_1 \to P_2$ of embedding kind and $g \colon P_2 \to P_3$ of coarse-graining kind whose composite satisfies none of the five preservation laws of Definition~\ref{def:concrete-laws}.
\end{proposition}
LINE 249 \begin{corollary}[Schema, not category]
\label{cor:schema-not-category}
The morphism schema of Definition~\ref{def:preservation-law} is not a category. Turning it into one requires one of three decisions: enlarge the kind vocabulary so that composites are retyped, restrict admissible morphisms to those whose composites stay inside the list, or replace the single collection by a multi-category whose composition is typed in each slot. Whether one category suffices is the question these three decisions address.
\end{corollary}
LINE 258 \begin{proposition}[Self-composition within a kind]
\label{prop:self-composition}
Coarse-grainings compose to coarse-grainings, embeddings compose to embeddings, and equivalence morphisms compose to equivalence morphisms, under the laws of Definition~\ref{def:concrete-laws}.
\end{proposition}
LINE 363 \begin{proposition}[Admissible morphisms form a category]
\label{prop:schema-category}
Fix a morphism kind whose preservation law contains the identities and is closed under self-composition, and take the admissible morphisms to be those of the chosen kind. Then the admissible records of Definition~\ref{def:phys-adm} together with these morphisms form a category. For the laws of Definition~\ref{def:concrete-laws} the coarse-graining kind, the embedding kind, and the equivalence kind qualify, by Proposition~\ref{prop:self-composition}.
\end{proposition}
LINE 372 \begin{proposition}[Conditionality over admissible systems]
\label{prop:conditional}
Every statement quantified over $\mathrm{Phys}_{\mathrm{adm}}$ is stated relative to the chosen admissibility conditions and preservation laws. Removing a condition enlarges the class and can falsify statements that hold for the smaller class.
\end{proposition}
LINE 423 \begin{proposition}[Factorization is extra data]
\label{prop:factorization-nonunique}
For any four-dimensional complex Hilbert space $H$ there exist two factorizations $H \cong \mathbb{C}^2 \otimes \mathbb{C}^2$ and a unit vector $\psi \in H$ whose entanglement entropy is $0$ in one factorization and $\log 2$ in the other. The bare record $(H, B(H), \mathrm{id}_H, U(H))$ does not determine the decomposition of $H$ into factors.
\end{proposition}
LINE 441 \begin{theorem}[Finite classical classification]
\label{thm:finite-state-classification}
Let $P$ and $Q$ be records of $\mathrm{Phys}_{\mathrm{fin}}$ with state spaces of cardinality $m$ and $n$, with composition rule the disjoint union, and with mathematical equivalence as the declared equivalence relation. Then:
\begin{enumerate}
\item $P$ is irreducible if and only if $m = 1$;
\item $P$ decomposes as a disjoint union of $m$ one-point records, and this decomposition is unique up to order and isomorphism of factors;
\item $P \cong Q$ if and only if $m = n$;
\item the cardinality $|X|$ is a complete invariant, and the quotient $\mathrm{Ob}(\mathrm{Phys}_{\mathrm{fin}})/\cong$ is in bijection with the nonnegative integers, the empty record corresponding to zero.
\end{enumerate}
\end{theorem}
LINE 458 \begin{theorem}[Finite dynamical decomposition]
\label{thm:dynamical-decomposition}
Let $P$ be a record of $\mathrm{Phys}_{\mathrm{dyn}}$ with state space $X$ and dynamics $f \colon X \to X$, and call two states adjacent when one is the image of the other under $f$. Then:
\begin{enumerate}
\item $P$ is irreducible if and only if the functional graph of $f$ is weakly connected;
\item $P$ decomposes as the disjoint union of the records on its connected components, and this decomposition is unique up to order and isomorphism of factors;
\item $P \cong Q$ if and only if the multisets of connected-component isomorphism classes of $P$ and $Q$ agree.
\end{enumerate}
\end{theorem}
LINE 480 \begin{theorem}[Generation in the restricted classes]
\label{thm:generation}
Let $P$ be a record of one of the two restricted classes.
\begin{enumerate}
\item If $P$ is in $\mathrm{Phys}_{\mathrm{fin}}$, then $P$ is a disjoint union of one-point records, and under the product rule $P$ is a product of prime-cardinality records.
\item If $P$ is in $\mathrm{Phys}_{\mathrm{dyn}}$, then $P$ is a disjoint union of records on weakly connected functional graphs.
\item In both cases the generation is effective: the irreducible factors are computed from the state space and the dynamics by finite enumeration.
\end{enumerate}
\end{theorem}
LINE 498 \begin{theorem}[Finite symmetric classification]
\label{thm:symmetric-classification}
Fix a finite group $G$, and let $\mathrm{Phys}^{G}_{\mathrm{fin}}$ be the records of $\mathrm{Phys}_{\mathrm{fin}}$ with $\mathcal{S} = G$ acting on $X$ by permutations, with $\mathcal{O} = \mathbb{R}^{X}$ carrying the induced action, and with $\mathcal{C}$ the disjoint union of $G$-sets. Then:
\begin{enumerate}
\item $P$ is irreducible if and only if the action of $G$ on $X$ is transitive;
\item $P$ decomposes as the disjoint union of its orbit records, and this decomposition is unique up to order and isomorphism of factors;
\item $P \cong Q$ if and only if for every conjugacy class of subgroups of $G$ the number of orbits with stabilizer in that class agrees;
\item the resulting orbit-counting function is a complete invariant with finite range.
\end{enumerate}
\end{theorem}
FILE papers/latex/vol-03-irreducibility-decomposition.tex
LINE 133 \begin{lemma}[No nilpotent radical]
\label{lem:radical}
Let $A$ be a finite-dimensional C*-algebra over $\mathbb{C}$. The Jacobson radical $J(A)$ is zero.
\end{lemma}
LINE 142 \begin{lemma}[Simple blocks are matrix algebras]
\label{lem:simple-blocks}
Let $B$ be a finite-dimensional simple C*-algebra over $\mathbb{C}$. Then $B \cong M_n(\mathbb{C})$ for some $n \geq 1$.
\end{lemma}
LINE 151 \begin{theorem}[Block decomposition]
\label{thm:block-decomposition}
Let $A$ be a unital finite-dimensional complex C*-algebra of dimension $d$. Then there exist $k \geq 1$ and integers $n_1, \dots, n_k \geq 1$ with $\sum_{i=1}^{k} n_i^2 = d$ and a *-isomorphism
\[
A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C}).
\]
The multiset $\mathbf{n}(A) = \{n_1, \dots, n_k\}$ is unique up to permutation, and $k = \dim_{\mathbb{C}} Z(A)$.
\end{theorem}
LINE 166 \begin{corollary}[Classification of the class]
\label{cor:classification}
Two unital finite-dimensional complex C*-algebras are *-isomorphic if and only if their dimension vectors agree as multisets. The dimension vector is a complete invariant of the class.
\end{corollary}
LINE 200 \begin{proposition}[States on a direct sum]
\label{prop:states-direct-sum}
Let $A = A_1 \oplus A_2$ with unital summands $A_1, A_2$ and central block projections $p_1, p_2$. Every state $\omega$ of $A$ has a unique expression
\[
\omega = \lambda \, \omega_1 + (1 - \lambda) \, \omega_2
\]
where $\lambda = \omega(p_1) \in [0,1]$, where $\omega_i$ is the restriction of $\omega$ to $A_i$ normalized to a state of $A_i$ when $\omega(p_i) > 0$, and the term is omitted when its weight is zero. Consequently $S(A)$ is the convex join of $S(A_1)$ and $S(A_2)$.
\end{proposition}
LINE 236 \begin{theorem}[Classification of unital *-homomorphisms]
\label{thm:homs}
Let $A$ and $B$ be unital finite-dimensional complex C*-algebras with fixed block presentations as above. Unital *-homomorphisms $\varphi \colon A \to B$, up to unitary conjugacy in $B$, correspond bijectively to multiplicity matrices $R$ from $A$ to $B$. The correspondence sends $\varphi$ to the rank matrix $k^{(i)}_j = \operatorname{rank}(\varphi(p_i) q_j)$, where $p_i$ is the $i$-th block projection of $A$ and $q_j$ the $j$-th block projection of $B$. Two unital *-homomorphisms are unitarily conjugate in $B$ if and only if their multiplicity matrices agree.
\end{theorem}
LINE 251 \begin{corollary}[Outer automorphisms]
\label{cor:outer-aut}
Let $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$. Automorphisms of $A$, modulo inner automorphisms, are classified by permutations of the blocks with equal dimension vector entries. Concretely, $\mathrm{Aut}(A)/\mathrm{Inn}(A)$ is isomorphic to the group of permutations $\sigma$ of $\{1, \dots, k\}$ with $n_{\sigma(i)} = n_i$ for all $i$.
\end{corollary}
LINE 287 \begin{proposition}[Module factorization]
\label{prop:module-factorization}
Let $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ and let $M$ be a finite-dimensional left $A$-module. Then $M = \bigoplus_{i=1}^{k} p_i M$ uniquely as $A$-modules, each summand $p_i M$ is a module over the simple block $M_{n_i}(\mathbb{C})$, and $p_i M \cong (\mathbb{C}^{n_i})^{\oplus r_i}$ for a unique multiplicity $r_i \geq 0$. Two modules are isomorphic if and only if their multiplicity vectors agree.
\end{proposition}
LINE 309 \begin{proposition}[Uniqueness in the restricted classes]
\label{prop:unique-restricted}
Uniqueness of decomposition up to permutation of isomorphic factors holds in each of the following restricted classes.
\begin{enumerate}
\item Unital finite-dimensional complex C*-algebras under direct sum: \cref{thm:block-decomposition}.
\item Unital *-homomorphisms of such algebras up to unitary conjugacy: \cref{thm:homs}.
\item Tensor factorizations into prime-dimensional factors: if a finite-dimensional Hilbert space is written as a tensor product of factors of prime dimension, the multiset of factor dimensions is unique up to permutation, by unique prime factorization of the total dimension.
\item Bipartite pure states of a finite-dimensional bipartite system, up to the Schmidt decomposition: the Schmidt coefficients are unique, and the left and right Schmidt subspaces are unique as subspaces.
\end{enumerate}
\end{proposition}
LINE 328 \begin{proposition}[Ensemble nonuniqueness]
\label{prop:ensemble}
Every mixed density operator $\rho$, that is, every density operator of rank at least two, admits infinitely many distinct decompositions into pure states. Pure states are the only exceptions: a rank-one projector is an extreme point of the state space and admits no nontrivial decomposition.
\end{proposition}
LINE 354 \begin{theorem}[Stinespring]
\label{thm:stinespring}
Let $A$ be a unital C*-algebra, $H$ a Hilbert space, and $\Phi \colon A \to B(H)$ completely positive. Then there exist a Hilbert space $K$, a *-representation $\pi \colon A \to B(K)$, and a bounded operator $V \colon H \to K$ with $\Phi(a) = V^* \pi(a) V$ for all $a \in A$. Among such dilations the minimal one, in which $K = \overline{\pi(A) V H}$, is unique up to a unitary intertwiner.
\end{theorem}
LINE 369 \begin{theorem}[Kraus normal form]
\label{thm:kraus}
Every completely positive map $\Phi \colon M_n(\mathbb{C}) \to M_m(\mathbb{C})$ can be written $\Phi(X) = \sum_{s=1}^{r} K_s X K_s^*$ with Kraus operators $K_s \colon \mathbb{C}^n \to \mathbb{C}^m$. The minimal number $r$ of Kraus operators equals the rank of the Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$. Two Kraus families $(K_s)_{s=1}^{r}$ and $(L_t)_{t=1}^{r}$ of minimal size represent the same map if and only if $L_t = \sum_s u_{ts} K_s$ for a unitary $u \in U(r)$.
\end{theorem}
LINE 399 \begin{theorem}[Gelfand-Naimark]
\label{thm:gelfand-naimark}
Every C*-algebra admits a faithful isometric *-representation on a Hilbert space~\cite{gelfand-naimark}. In the commutative case, every unital commutative C*-algebra is isometrically *-isomorphic to $C(X)$ for a compact Hausdorff space $X$ given by its character space, and $X$ is recovered from $A$ as the set of multiplicative linear functionals with the weak-* topology.
\end{theorem}
LINE 410 \begin{theorem}[Doplicher-Roberts reconstruction]
\label{thm:dr-reconstruction}
Let $\mathcal{C}$ be a symmetric tensor *-category with conjugates, direct sums and subobjects, with $\mathrm{End}(\mathbf{1}) = \mathbb{C}$, satisfying the selection criteria of the DHR analysis of a local net of observable algebras~\cite{dhr}. Then $\mathcal{C}$ is equivalent to the category of finite-dimensional unitary representations of a compact supergroup $G$, and $G$ is unique up to isomorphism~\cite{dr-duality,dr-endomorphisms}.
\end{theorem}
LINE 428 \begin{proposition}[Construction arithmetic]
\label{prop:construction-arithmetic}
Let $A$ and $B$ be unital finite-dimensional complex C*-algebras with dimension vectors $\mathbf{n}(A)$ and $\mathbf{n}(B)$. Then:
\begin{enumerate}
\item $\mathbf{n}(A \oplus B) = \mathbf{n}(A) \uplus \mathbf{n}(B)$, the multiset union.
\item $\mathbf{n}(A \otimes B) = \{ n m : n \in \mathbf{n}(A),\, m \in \mathbf{n}(B) \}$, the pairwise product multiset.
\item $A \oplus B$ is irreducible under direct sum if and only if one summand is zero and the other is simple.
\end{enumerate}
\end{proposition}
LINE 442 \begin{corollary}[Closure of a finite set of blocks]
\label{cor:closure}
Let $S = \{M_{n_1}(\mathbb{C}), \dots, M_{n_k}(\mathbb{C})\}$ and let $\mathcal{C} = \{\oplus, \otimes\}$. The closure $\langle S \rangle_{\mathcal{C}}$ is the class of unital finite-dimensional complex C*-algebras whose dimension vector entries lie in the multiplicative semigroup generated by $n_1, \dots, n_k$ in $\mathbb{N}_{\geq 1}$.
\end{corollary}
LINE 490 \begin{proposition}[Embeddings and multiplicity matrices]
\label{prop:embeddings}
In the setting of \cref{thm:homs}, a unital *-homomorphism $\varphi \colon A \to B$ is injective if and only if its multiplicity matrix has no zero row. Injective unital *-homomorphisms are the embeddings of the finite-dimensional C*-category.
\end{proposition}
LINE 499 \begin{proposition}[Spectra of direct sums]
\label{prop:spectrum-sum}
Let $A$ and $B$ be unital commutative C*-algebras with spectra $X$ and $Y$. Then $A \oplus B \cong C(X \sqcup Y)$ and the spectrum of a direct sum is the disjoint union of the spectra.
\end{proposition}
LINE 546 \begin{theorem}[Tame-wild dichotomy]
\label{thm:tame-wild}
Every finite-dimensional algebra over an algebraically closed field is either derived tame or derived wild~\cite{bekkert-drozd}. Derived wildness is preserved under degeneration, and derived tameness is preserved under deformation.
\end{theorem}
LINE 551 \begin{theorem}[Wildness of the generic determinant]
\label{thm:wild-generic-det}
The maximal Cohen-Macaulay module theory of the generic determinant is wild~\cite{buchweitz-leuschke}: already in rank two, the isomorphism classes of modules cannot be parametrized by a finite-dimensional variety over the coefficients.
\end{theorem}
LINE 558 \begin{corollary}[Boundary on decomposition programs]
\label{cor:boundary}
Any program that decomposes systems into irreducibles and then parametrizes the irreducibles by finite-dimensional data is confined to tame regimes. In wild regimes the decomposition step may still exist while the parameterization step is provably unavailable.
\end{corollary}
FILE papers/latex/vol-05-classical-systems.tex
LINE 144 \begin{lemma}[Linearization at a point]
\label{lem:linearization}
Let $(M^{2n}, \omega)$ be symplectic and let $p \in M$. There are coordinates $(x_1, y_1, \dots, x_n, y_n)$ centered at $p$ in which $\omega_p = \sum_{i=1}^{n} dx_i \wedge dy_i$ at $p$.
\end{lemma}
LINE 153 \begin{lemma}[Moser trick on a ball]
\label{lem:moser-ball}
Let $B$ be an open ball centered at $p$ in a chart, and let $\omega_t$, $t \in [0, 1]$, be a smooth family of symplectic forms on $B$ with $\omega_t$ nondegenerate for all $t$. If $\dot{\omega}_t$ is exact for each $t$, then there is a concentric ball $B'$ compactly contained in $B$ carrying an isotopy $\varphi_t$ with $\varphi_t^{*} \omega_t = \omega_0$ for all $t$, and $\varphi_1$ maps $B'$ into $B$.
\end{lemma}
LINE 166 \begin{theorem}[Darboux]
\label{thm:darboux}
Let $(M^{2n}, \omega)$ be a symplectic manifold and $p \in M$. There exists a neighborhood $U$ of $p$ and a diffeomorphism $\varphi : U \to V$ onto an open subset $V \subset \mathbb{R}^{2n}$ such that $\varphi^{*} \omega_0 = \omega|_U$ where $\omega_0 = \sum_{i=1}^{n} dx_i \wedge dy_i$. In particular, any two symplectic manifolds of the same dimension are locally symplectomorphic.
\end{theorem}
LINE 175 \begin{corollary}[Absence of local invariants]
\label{cor:no-local}
Every local symplectic invariant of a $2n$-dimensional symplectic manifold is constant on connected components. Any classification of symplectic manifolds up to symplectomorphism must be carried by global data.
\end{corollary}
LINE 195 \begin{theorem}[Weinstein splitting]
\label{thm:weinstein}
Let $(M, \pi)$ be a Poisson manifold and $p \in M$ a point of rank $2k$. There exist a neighborhood $U$ of $p$ and a Poisson diffeomorphism from $U$ onto a product $U_1 \times U_2$ where $U_1$ is a neighborhood of a point in a symplectic manifold $(N^{2k}, \omega)$ and $U_2$ is a neighborhood of a zero $q_0$ of a Poisson structure $\pi_2$ of rank zero at $q_0$.
\end{theorem}
LINE 204 \begin{proposition}[Leaf foliation]
\label{prop:leaves}
A Poisson manifold $(M, \pi)$ is foliated by its symplectic leaves: maximal immersed submanifolds $S \subset M$ on which $\pi|_S$ is nondegenerate and which are tangent to the distribution $\operatorname{im} \pi^{\sharp}$. Each leaf is a symplectic manifold, and the restriction of the Poisson bracket of functions to a leaf is the bracket of the leaf symplectic form.
\end{proposition}
LINE 218 \begin{theorem}[Kirillov-Kostant-Souriau form]
\label{thm:kks}
Let $G$ be a Lie group with Lie algebra $\mathfrak{g}$ and let $\mathcal{O} \subset \mathfrak{g}^{*}$ be a coadjoint orbit. The formula
\[
\omega_{\xi}(\operatorname{ad}^{*}_{x} \xi, \operatorname{ad}^{*}_{y} \xi) = \langle \xi, [x, y] \rangle
\]
defines a $G$-invariant symplectic form $\omega_{\xi}$ on $\mathcal{O}$, and the coadjoint action of $G$ on $(\mathcal{O}, \omega_{\xi})$ is by symplectomorphisms. The Poisson structure induced on $\mathfrak{g}^{*}$ by the Lie bracket restricts on each orbit to the inverse of $\omega_{\xi}$.
\end{theorem}
LINE 231 \begin{proposition}[Casimir functions]
\label{prop:casimirs}
A smooth function $F \in C^{\infty}(M)$ on a Poisson manifold $(M, \pi)$ is constant on the symplectic leaves if and only if $\{F, f\} = 0$ for all $f \in C^{\infty}(M)$. On the Lie-Poisson space $\mathfrak{g}^{*}$ these functions are exactly the coadjoint-invariant functions $F(\xi) = F(\operatorname{Ad}^{*}_{g} \xi)$ for all $g \in G$. For $\mathfrak{g} = \mathfrak{so}(3)$ the Casimir is $F(\xi) = |\xi|^{2}$, and its level sets are the symplectic leaves of \cref{ex:lie-poisson}.
\end{proposition}
LINE 248 \begin{theorem}[Moser stability]
\label{thm:moser-stability}
Let $M$ be a closed manifold and $\omega_t$, $t \in [0, 1]$, a smooth family of symplectic forms with $[\omega_t] \in H^{2}(M; \mathbb{R})$ independent of $t$. Then there is an isotopy $\varphi_t$ of $M$ with $\varphi_t^{*} \omega_t = \omega_0$ for all $t$.
\end{theorem}
LINE 257 \begin{corollary}[Classification refines diffeomorphism and cohomology]
\label{cor:classification-data}
Let $f : M \to M'$ be a diffeomorphism of closed symplectic manifolds carrying $[\omega]$ to $[\omega']$. If there is a smooth path of symplectic forms $\omega_t$ in the constant class $[\omega]$ connecting $\omega$ to $f^{*} \omega'$, then $(M, \omega)$ and $(M', \omega')$ are symplectomorphic. Symplectomorphism classes therefore form a strictly finer partition than the pairs consisting of a diffeomorphism type and an orbit of $[\omega]$ under the diffeomorphism group.
\end{corollary}
LINE 290 \begin{proposition}[Gromov width]
\label{prop:gromov-width}
The Gromov width
\[
w_G(M, \omega) = \sup \{ \pi r^{2} : B^{2n}(r) \text{ embeds symplectically into } (M, \omega) \}
\]
is a symplectic capacity in the sense of \cref{def:capacity}.
\end{proposition}
LINE 305 \begin{theorem}[Gromov nonsqueezing]
\label{thm:nonsqueezing}
Let $B^{2n}(r)$ be the open ball of radius $r$ in $\mathbb{R}^{2n}$ and $B^{2}(R) \times \mathbb{R}^{2n-2}$ the cylinder of radius $R$. A symplectic embedding $B^{2n}(r) \hookrightarrow B^{2}(R) \times \mathbb{R}^{2n-2}$ exists only if $r \leq R$.
\end{theorem}
LINE 327 \begin{theorem}[Coadjoint orbits of compact semisimple groups]
\label{thm:coadjoint-classification}
Let $G$ be compact, connected, and semisimple with complexification $G^{\mathbb{C}}$ and maximal torus $T$ with Lie algebra $\mathfrak{t}$. Every coadjoint orbit of $G$ meets $\mathfrak{t}^{*}$ in a single $W$-orbit, so the orbits are parameterized continuously by points $\xi$ of the closed positive Weyl chamber $\mathfrak{t}^{*}_{+}$. Each orbit is a flag manifold $G^{\mathbb{C}} / P_{\xi}$ where the parabolic $P_{\xi}$ is determined by the support of $\xi$, that is by the subset of Dynkin nodes on whose walls $\xi$ lies; regular $\xi$ gives full flag manifolds and singular $\xi$ gives partial flags. The symplectic form on the orbit is the Kirillov-Kostant-Souriau form of \Cref{thm:kks}. The dominant integral weights form the discrete sublattice $\Lambda_{+} \subset \mathfrak{t}^{*}_{+}$ that selects the integral, that is quantizable, orbits; those are the orbits carrying finite-dimensional irreducible representations by the Borel-Weil theorem.
\end{theorem}
LINE 376 \begin{theorem}[Liouville-Arnold]
\label{thm:liouville-arnold}
Let $(M^{2n}, \omega, H_1, \dots, H_n)$ be a Liouville integrable system and let $M_c = \{ H_1 = c_1, \dots, H_n = c_n \}$ be a compact connected regular level set. Then $M_c$ is diffeomorphic to an $n$-torus $T^{n}$, and a neighborhood of $M_c$ in $M$ carries action-angle coordinates $(I, \theta)$ in which $\omega = \sum_{i} dI_i \wedge d\theta_i$ and the $H_i$ depend on the actions $I_i$ alone.
\end{theorem}
LINE 385 \begin{proposition}[Action variables are periods]
\label{prop:periods}
In the action-angle coordinates of \cref{thm:liouville-arnold}, the action variables are the periods of the action one-form $\lambda$ with $d\lambda = \omega$ over a basis $\gamma_1, \dots, \gamma_n$ of $H_1(M_c; \mathbb{Z})$:
\[
I_j = \frac{1}{2\pi} \oint_{\gamma_j} \lambda.
\]
The value depends on the choice of primitive $\lambda$: two primitives differ by a closed one-form, and the resulting shift of the actions is the period vector of that form, a vector of $H^{1}(M_c; \mathbb{R}) \cong \mathbb{R}^{n}$. Once $\lambda$ is fixed, the angle variables are fiberwise coordinates normalized so that $\omega = \sum_j dI_j \wedge d\theta_j$.
\end{proposition}
LINE 400 \begin{proposition}[Monodromy obstruction]
\label{prop:monodromy}
There exist integrable Hamiltonian systems whose regular compact fibers are tori and which admit no global action-angle coordinates; the obstruction is the monodromy representation of $\pi_1$ of the base of the fibration acting on the period lattice $H_1(T^{n}; \mathbb{Z})$.
\end{proposition}
LINE 421 \begin{theorem}[Nekhoroshev estimate]
\label{thm:nekhoroshev}
Let $H = H_0 + \varepsilon H_1$ be a steep integrable Hamiltonian system with $n$ degrees of freedom and let $H_0(I)$ be the integrable part in action variables. There are positive constants $c$, $a$, and $b$ depending on the system such that, for $\varepsilon$ small, every trajectory satisfies
\[
\| I(t) - I(0) \| \leq c \varepsilon^{b}
\qquad \text{for all } 0 \leq t \leq \exp(c \varepsilon^{-a}).
\]
The bound is on the drift of the action variables, not on the energy, which is conserved exactly.
\end{theorem}
LINE 458 \begin{theorem}[Chentsov]
\label{thm:chentsov}
Let $g$ be a family of Riemannian metrics $g^{(n)}$ on the open simplices $\Delta^{\circ} \subset \mathbb{R}^{n}$ for all $n \geq 1$, compatible with Markov embeddings (pullback along every sufficient statistic is an isometry) and monotone under stochastic maps in the sense of \cref{def:monotone}. Then one constant $c > 0$ satisfies $g^{(n)} = c \, g_{\mathrm{Fisher}}^{(n)}$ for every $n$, where $g_{\mathrm{Fisher}}^{(n)}$ is the Fisher metric of \cref{def:fisher}. The cross-dimension compatibility is a hypothesis: monotonicity on a single fixed simplex does not determine the metric up to scale.
\end{theorem}
LINE 467 \begin{lemma}[Equality along sufficient statistics]
\label{lem:sufficiency}
Let $g$ be a monotone metric on $\Delta^{\circ}$ and let $T$ be a stochastic map with a stochastic left inverse $S$, that is $S T = \mathrm{Id}$. Then $T$ is an isometric embedding for $g$, and for every tangent vector $u$ at $p$,
\[
g_{p}(u, u) = g_{Tp}(Tu, Tu).
\]
\end{lemma}
LINE 488 \begin{corollary}[Fisher metric as classifying invariant]
\label{cor:fisher-invariant}
The Fisher metric, up to positive scale, is a classifying invariant of the classical statistical family under stochastic morphisms: it is the unique metric compatible with the coarse-graining order.
\end{corollary}
LINE 498 \begin{proposition}[Product of statistical models]
\label{prop:stat-product}
Let $p \in \Delta^{\circ} \subset \mathbb{R}^{n}$ and $q \in \Delta^{\circ} \subset \mathbb{R}^{m}$ be probability vectors and let $p \otimes q \in \Delta^{\circ} \subset \mathbb{R}^{nm}$ be their product. Then the Fisher metric of the product is the direct sum of the factors:
\[
g_{p \otimes q}(u \otimes q + p \otimes v, u \otimes q + p \otimes v) = g_{p}(u, u) + g_{q}(v, v)
\]
for tangent vectors $u$ at $p$ and $v$ at $q$.
\end{proposition}
LINE 521 \begin{theorem}[Petz-Sudar parametric classification]
\label{thm:petz-sudar}
Monotone metrics on the space of positive definite density matrices, defined by monotonicity under completely positive trace-preserving maps, are classified by operator monotone functions $f : (0, \infty) \to (0, \infty)$ with $f(1) = 1$ and the symmetry $f(t) = t f(1/t)$ that makes the bilinear form symmetric. The family of such metrics is parametric and infinite, and no constant multiple of a single metric exhausts it.
\end{theorem}
LINE 541 \begin{proposition}[Irreducibility of symplectic surfaces]
\label{prop:surface-irreducible}
Every closed symplectic surface of genus $g \geq 0$ is $C$-irreducible for the product composition.
\end{proposition}
LINE 550 \begin{proposition}[Symplectic reduction]
\label{prop:reduction}
Let a compact Lie group $G$ act on a symplectic system $(M, \omega)$ by symplectomorphisms with momentum map $J$. For a regular value $\mu$ of $J$ at which the isotropy group $G_{\mu}$ acts freely and properly on $J^{-1}(\mu)$, the reduced space $J^{-1}(\mu) / G_{\mu}$ carries a unique symplectic form $\omega_{\mu}$ such that the pullback along $J^{-1}(\mu) \to J^{-1}(\mu)/G_{\mu}$ agrees with $\omega|_{J^{-1}(\mu)}$, and the reduced dynamics of an invariant Hamiltonian is Hamiltonian for $\omega_{\mu}$. The reduction is a decomposition construction on classical systems, and its output is again a classical system of \cref{def:classical-system}.
\end{proposition}
LINE 566 \begin{proposition}[Reduction of products]
\label{prop:reduction-products}
Let $G$ act on a symplectic system $(M_1, \omega_1)$ with momentum map $J_1$, let $(M_2, \omega_2)$ carry the trivial $G$-action, and let $\mu$ be a regular value of $J_1$. Then the reduced space of the product $(M_1 \times M_2, \omega_1 \oplus \omega_2)$ at $\mu$ is the product of the reduced space of $M_1$ at $\mu$ with $M_2$:
\[
\big( J_1^{-1}(\mu) / G_{\mu} \big) \times M_2,
\]
with reduced form $\omega_{\mu} \oplus \omega_2$. Reduction commutes with product composition along the factor that carries no symmetry.
\end{proposition}
LINE 593 \begin{theorem}[Delzant]
\label{thm:delzant}
The momentum image $\Delta = J(M) \subset \mathbb{R}^{n}$ of a compact connected toric symplectic manifold is a convex rational Delzant polytope: convex, rational, simple, and Delzant (the normal vectors of the facets meeting at each vertex form a $\mathbb{Z}$-basis of $\mathbb{Z}^{n}$). Two compact connected toric symplectic manifolds are equivariantly symplectomorphic up to an automorphism of the acting torus $T^{n}$ if and only if their Delzant polytopes are related by an element of $GL(n; \mathbb{Z}) \ltimes \mathbb{R}^{n}$. When the torus action is fixed pointwise the equivalence narrows to translations of the polytope in $\mathbb{R}^{n}$ alone. Conversely, every Delzant polytope arises from such a manifold.
\end{theorem}
FILE papers/latex/vol-06-quantum-systems.tex
LINE 165 \begin{theorem}[Structure of finite-dimensional $C^*$-algebras]
\label{thm:findim}
Let $A$ be a finite-dimensional complex $C^*$-algebra. Then there are integers $n_1, \dots, n_k \geq 1$ and a $*$-isomorphism
\[
A \cong M_{n_1}(\mathbb{C}) \oplus \cdots \oplus M_{n_k}(\mathbb{C}).
\]
The multiset $\{n_1, \dots, n_k\}$ determines $A$ up to $*$-isomorphism, and two finite-dimensional $C^*$-algebras are $*$-isomorphic if and only if their dimension vectors agree as multisets.
\end{theorem}
LINE 180 \begin{corollary}[Classification by dimension vector]
\label{cor:findimclass}
Up to $*$-isomorphism the finite-dimensional complex $C^*$-algebras are in bijection with finite multisets of positive integers, and every such algebra is unital with $\dim A = \sum_i n_i^2$ the sum of squares of its block sizes.
\end{corollary}
LINE 200 \begin{corollary}[Counting small algebras]
\label{cor:count}
For each $d \geq 1$ the $*$-isomorphism classes of finite-dimensional $C^*$-algebras of complex dimension $d$ are in bijection with the partitions of $d$ into perfect squares. In particular the number of such algebras grows as the number of such partitions.
\end{corollary}
LINE 241 \begin{proposition}[States of a block algebra]
\label{prop:states}
Let $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$. Every state $\rho$ on $A$ is of the form
\[
\rho(X_1, \dots, X_k) = \sum_{i=1}^{k} \operatorname{Tr}(\sigma_i X_i)
\]
for positive matrices $\sigma_i \in M_{n_i}(\mathbb{C})$ with $\sum_i \operatorname{Tr} \sigma_i = 1$, and this correspondence is bijective. The pure states of $A$ are the vector states of individual blocks, so the pure state space is the disjoint union of complex projective spaces $\mathbb{CP}^{n_i - 1}$.
\end{proposition}
LINE 256 \begin{proposition}[Automorphisms of block algebras]
\label{prop:aut}
Every $*$-automorphism of $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ is the composition of a blockwise inner automorphism and a permutation of blocks of equal size. The dynamics of a finite-dimensional quantum system is therefore a unitary path inside blocks together with block permutations of equal size, and none of it is recorded by the dimension vector beyond the block sizes themselves.
\end{proposition}
LINE 265 \begin{proposition}[Unique decomposition in the finite-dimensional class]
\label{prop:unique}
Decompositions of a finite-dimensional $C^*$-algebra $A$ into irreducible summands under direct sum exist and are unique up to order and unitary equivalence. The dimension vector is therefore complete data for the decomposition as well as for the isomorphism class, and the uniqueness that fails for interacting systems in general holds in this restricted class.
\end{proposition}
LINE 274 \begin{proposition}[Tensor products of block algebras]
\label{prop:tensor}
Let $A = \bigoplus_i M_{n_i}(\mathbb{C})$ and $B = \bigoplus_j M_{m_j}(\mathbb{C})$. Then $A \otimes B \cong \bigoplus_{i,j} M_{n_i m_j}(\mathbb{C})$, and the dimension vector of $A \otimes B$ is the multiset of products $\{n_i m_j\}$. In particular the dimension vector of a tensor product is computed from the factor dimension vectors without reference to any presentation.
\end{proposition}
LINE 302 \begin{theorem}[Central decomposition]
\label{thm:central}
Every von Neumann algebra $M$ is a direct integral of factors over a measure space, unique up to measure-class isomorphism of the base. The isomorphism classification of von Neumann algebras therefore reduces to the classification of factors together with the measure-theoretic data of the decomposition.
\end{theorem}
LINE 309 \begin{theorem}[Classification of amenable factors]
\label{thm:amenable}
Among factors with separable predual the amenable (equivalently injective, equivalently hyperfinite) factors are classified as follows. For each $n \geq 1$ there is a unique factor of type $\mathrm{I}_n$ and a unique factor of type $\mathrm{I}_\infty$. There is a unique amenable factor of type $\mathrm{II}_1$, the hyperfinite factor, and a unique amenable factor of type $\mathrm{II}_\infty$. For each $\lambda \in (0,1)$ there is a unique amenable factor of type $\mathrm{III}_\lambda$, and a unique amenable factor of type $\mathrm{III}_1$. Amenable factors of type $\mathrm{III}_0$ are classified by the ergodic flow of weights. The invariants in force are the Murray-von Neumann type together with the Connes invariants. Separable predual is essential: among non-separable injective $\mathrm{II}_1$ factors uniqueness fails, and there are $2^{\mathfrak{c}}$ pairwise non-isomorphic ones.
\end{theorem}
LINE 341 \begin{theorem}[McDuff 1969]
\label{thm:mcduff}
There exist uncountably many pairwise non-isomorphic separable type $\mathrm{II}_1$ factors.
\end{theorem}
LINE 350 \begin{corollary}[No finite list of factor types]
\label{cor:nofinite}
No finite or countable list of pairwise non-isomorphic factor types exhausts the separable $\mathrm{II}_1$ factors, and no CFSG-style list of factor types is complete outside a restricted class such as the amenable factors.
\end{corollary}
LINE 374 \begin{lemma}[Choi correspondence]
\label{lem:choi}
For a linear map $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ with Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$ the following hold: $\Phi$ is completely positive if and only if $J(\Phi) \geq 0$, and $\Phi$ is trace preserving if and only if $\operatorname{Tr}_m J(\Phi) = I_n$, where $\operatorname{Tr}_m$ is the partial trace over the second tensor factor.
\end{lemma}
LINE 393 \begin{theorem}[Choi-Kraus normal form]
\label{thm:kraus}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be linear. Then $\Phi$ is completely positive if and only if there are matrices $A_1, \dots, A_r \in M_{m \times n}(\mathbb{C})$ with
\[
\Phi(X) = \sum_{i=1}^{r} A_i X A_i^* \qquad \text{for all } X \in M_n(\mathbb{C}),
\]
and one may take $r$ equal to the rank of the Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$. The minimal such $r$ is the Kraus rank of $\Phi$ and equals the rank of $J(\Phi)$.
\end{theorem}
LINE 415 \begin{theorem}[Stinespring dilation]
\label{thm:stinespring}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be a channel. Then $\Phi$ admits a Stinespring dilation $(K, V)$ in the sense of \cref{def:channels}, and minimal dilations exist. Any two minimal dilations $(K, V)$ and $(K', V')$ of $\Phi$ are unitarily equivalent: there is a unitary $U: K \to K'$ with $(I_m \otimes U) V = V'$. The dimension $\dim K$ of a minimal dilation equals the Kraus rank of $\Phi$.
\end{theorem}
LINE 431 \begin{proposition}[Kraus rank is a normal-form invariant]
\label{prop:krausrank}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be a channel. The Kraus rank of $\Phi$ equals the rank of its Choi matrix, equals the minimal number of Kraus operators in any representation of $\Phi$, and equals the dimension of the environment $K$ in a minimal Stinespring dilation. The Kraus rank is preserved by unitary changes of Kraus presentation and by composition of $\Phi$ with unitary conjugations of domain and codomain. It is not a complete invariant of channels: two channels with equal Kraus rank need not be unitarily equivalent.
\end{proposition}
LINE 445 \begin{proposition}[Composition of channels]
\label{prop:compose}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ and $\Psi: M_m(\mathbb{C}) \to M_p(\mathbb{C})$ be linear. Then
\[
J(\Psi \circ \Phi)_{(i\alpha),(j\beta)} = \sum_{k,l=1}^{m} J(\Phi)_{(ik),(jl)} \, J(\Psi)_{(k\alpha),(l\beta)},
\]
with composite indices as in \cref{lem:choi}. The right-hand side is the link product of $J(\Phi)$ and $J(\Psi)$: matrix multiplication of $J(\Phi)$ after partial transpose on the shared subsystem, contracted with $J(\Psi)$ along that subsystem. Composition of channels is therefore a link-product contraction, and the Choi matrix of a composite is determined by the Choi matrices of the factors.
\end{proposition}
LINE 475 \begin{theorem}[Doplicher-Roberts reconstruction]
\label{thm:dr}
Let $\mathcal{C}$ be a symmetric tensor $*$-category with conjugates, direct sums, and subobjects, and with $\operatorname{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent, as a symmetric tensor $*$-category, to the category of finite-dimensional unitary representations of a compact supergroup $G$, and $G$ is unique up to isomorphism.
\end{theorem}
LINE 492 \begin{theorem}[Deligne]
\label{thm:deligne}
Let $\mathcal{C}$ be a $\mathbb{C}$-linear, abelian, rigid symmetric tensor category over $\mathbb{C}$ of subexponential growth, with $\operatorname{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent, as a symmetric tensor category, to the category of finite-dimensional representations of an affine supergroup scheme. In particular the category is Tannakian in the super sense.
\end{theorem}
LINE 499 \begin{proposition}[Etingof-Gelaki counterexample]
\label{prop:eg}
There exist finite non-isomorphic groups $G_1$ and $G_2$ whose representation categories over $\mathbb{C}$ are equivalent as tensor categories, but not as symmetric tensor categories. Consequently an equivalence of tensor categories that forgets the symmetric structure cannot recover the group, and any classification of such categories built on that equivalence is false.
\end{proposition}
LINE 533 \begin{theorem}[Petz]
\label{thm:petz}
Monotone metrics on $\mathcal{D}_n$ are in bijection with operator monotone functions $f: (0,\infty) \to (0,\infty)$ that satisfy the symmetry condition $f(t) = t f(1/t)$ and the normalization $f(1) = 1$. Given such a function $f$, the corresponding metric on the tangent space $T_\rho \mathcal{D}_n$ is
\[
g_\rho^f(A, B) = \operatorname{Tr}\Bigl(A^* \bigl[R_\rho \, f(L_\rho R_\rho^{-1})\bigr]^{-1}(B)\Bigr),
\]
where $L_\rho$ and $R_\rho$ are the left and right multiplication operators by $\rho$ on $M_n(\mathbb{C})$. Distinct normalized operator monotone functions give distinct monotone metrics.
\end{theorem}
LINE 546 \begin{corollary}[Parametricity of the quantum invariant]
\label{cor:parametric}
The monotone metrics of quantum states are classified by a continuous parameter (the normalized operator monotone function), not by a discrete choice. There is no quantum analogue of Chentsov uniqueness, and any classification statement for quantum monotone metrics must accept a parametric invariant in place of a unique object.
\end{corollary}
FILE papers/latex/vol-07-gauge-qft.tex
LINE 152 \begin{theorem}[Killing\textendash{}Cartan classification]
\label{thm:killing-cartan}
Complex semisimple Lie algebras are classified up to isomorphism by Dynkin diagrams of types $A_r$, $B_r$, $C_r$, $D_r$, $G_2$, $F_4$, $E_6$, $E_7$, $E_8$~\cite{humphreys, serre}. Real simple Lie algebras are classified by Satake diagrams; the real forms of a given complex simple algebra $\mathfrak{g}$ correspond to the conjugacy classes of involutive automorphisms of $\mathfrak{g}$, equivalently to conjugacy classes of Cartan involutions. Connected Lie groups with Lie algebra $\mathfrak{g}$ are classified by discrete subgroups $Z'$ of the center of the universal covering group $\widetilde{G}$: each such group is a quotient $\widetilde{G}/Z'$.
\end{theorem}
LINE 163 \begin{theorem}[Highest-weight classification]
\label{thm:highest-weight}
Let $\mathfrak{g}$ be a complex semisimple Lie algebra. Finite-dimensional irreducible representations of $\mathfrak{g}$ are in bijection with dominant integral weights; the representation with highest weight $\lambda$ exists and is unique up to isomorphism~\cite{humphreys}.
\end{theorem}
LINE 193 \begin{theorem}[Classification by the classifying space]
\label{thm:bundles}
Let $G$ be a Lie group and $X$ a paracompact Hausdorff space. The map that sends a principal $G$-bundle to its classifying map induces a bijection~\cite{milnor, dold, steenrod}
\[
\mathrm{GBund}(X) \cong [X, BG],
\]
and the characteristic classes of a bundle are exactly the pullbacks along its classifying map of the universal characteristic classes in $H^*(BG)$~\cite{milnor-stasheff}.
\end{theorem}
LINE 208 \begin{proposition}[Bundles over spheres]
\label{prop:spheres}
Let $G$ be a connected Lie group and $n \geq 1$. Isomorphism classes of principal $G$-bundles over $S^n$ are in bijection with $\pi_{n-1}(G)$.
\end{proposition}
LINE 250 \begin{proposition}[Characteristic classes of the classical groups]
\label{prop:classical-classes}
For $G = \mathrm{U}(n)$ the classifying cohomology $H^*(B\mathrm{U}(n); \mathbb{Z})$ is a polynomial ring on the Chern classes $c_1, \ldots, c_n$. For $G = \mathrm{SO}(2k+1)$ the rational cohomology $H^*(B\mathrm{SO}(2k+1); \mathbb{Q})$ is a polynomial ring on the Pontryagin classes $p_1, \ldots, p_k$. For $G = \mathrm{SO}(2k)$ the rational cohomology $H^*(B\mathrm{SO}(2k); \mathbb{Q})$ is the free polynomial ring $\mathbb{Q}[p_1, \ldots, p_{k-1}, e]$; the top Pontryagin class is the element $p_k = e^2$ and is not an independent generator. For $G = \mathrm{SU}(n)$ the class $c_1$ vanishes and $H^*(B\mathrm{SU}(n); \mathbb{Z})$ is a polynomial ring on $c_2, \ldots, c_n$.
\end{proposition}
LINE 276 \begin{proposition}[Quantization gate]
\label{prop:anomaly}
A gauge theory admits a consistent quantization only where the determinant line $\lambda_{\mathrm{det}}$ of the Dirac family is trivializable and its anomaly cocycle $[a]$ vanishes in the local BRST cohomology $H^{1,n}(s\mid d)$. The group $H^{1,n}(s\mid d)$ is the space of candidate anomalies of the theory; the specific cocycle $[a]$ is the anomaly of the theory at hand. These two vanishing conditions are the classification content of the anomaly: the obstruction classes are natural in the gauge configuration and classify the inconsistent directions.
\end{proposition}
LINE 294 \begin{proposition}[Anomaly cancellation as a linear condition]
\label{prop:cancellation}
Fix a compact simple gauge group $G$ and let the matter content be a finite list of finite-dimensional irreducible representations $R_1, \ldots, R_k$ with highest weights $\lambda_1, \ldots, \lambda_k$. The contribution of each representation to a fixed anomaly class is additive, so there is a homomorphism of abelian groups
\[
\alpha \colon R(G) \longrightarrow A,
\]
from the representation ring of $G$ to the coefficient group $A$ of the anomaly in question, and the anomaly-free matter lists form $\ker \alpha$. For the four-dimensional perturbative gauge anomaly $A = \mathbb{Z}$ and $\alpha(R)$ is the anomaly coefficient of $R$; for global anomalies $A$ is the relevant cobordism group of $G$. The admissible matter lists are cut out by linear conditions on the weight data, computable from Theorem~\ref{thm:highest-weight} and Proposition~\ref{prop:anomaly} together.
\end{proposition}
LINE 314 \begin{theorem}[Two-dimensional topological field theories]
\label{thm:frobenius}
The category of two-dimensional Atiyah topological quantum field theories with values in vector spaces is equivalent to the category of commutative Frobenius algebras~\cite{atiyah-tqft}.
\end{theorem}
LINE 364 \begin{theorem}[Doplicher\textendash{}Roberts reconstruction]
\label{thm:dr}
Let $\mathcal{C}$ be a symmetric tensor $\mathrm{C}^*$-category with conjugates, direct sums, subobjects, and $\mathrm{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent to the category of finite-dimensional unitary representations of a compact group $G$ equipped with a distinguished central element $k$ of order at most two, $k^2 = e$, whose adjoint action implements the $\mathbb{Z}/2$ grading of the statistics; in the graded language this data is a compact supergroup. The pair $(G, k)$ is unique up to isomorphism~\cite{dr, dhr}. Applied to the DHR category of a local net satisfying Haag duality, the theorem reconstructs a compact gauge group from the superselection sectors.
\end{theorem}
LINE 377 \begin{theorem}[Deligne's theorem]
\label{thm:deligne}
An abelian, $k$-linear, rigid symmetric monoidal category over an algebraically closed field of characteristic zero, with $\mathrm{End}(\mathbf{1}) = k$ and subexponential growth, is equivalent to the category of representations of an affine supergroup scheme~\cite{deligne}.
\end{theorem}
LINE 398 \begin{theorem}[Reconstruction from commutative probes]
\label{thm:gelfand}
The Gelfand\textendash{}Naimark theorem embeds every $\mathrm{C}^*$-algebra in an algebra of operators on a Hilbert space, and for commutative $\mathrm{C}^*$-algebras the Gelfand transform is an isomorphism onto the continuous functions on the Gelfand spectrum~\cite{gelfand-naimark}. Stone duality is the Boolean analogue: a Boolean algebra is recovered from its space of ultrafilters~\cite{stone}. In each case the object is determined by its commutative or Boolean probe data.
\end{theorem}
FILE papers/latex/vol-09-gravity-information-geometry.tex
LINE 175 \begin{lemma}[Fisher metric and relative entropy]
\label{lem:kl}
Let $p$ be an interior point of the simplex and let $u$ be a tangent vector at $p$ with $\sum_i u_i = 0$. For the Kullback-Leibler divergence $D(p + u \,\|\, p) = \sum_i (p_i + u_i) \log \frac{p_i + u_i}{p_i}$ one has
\begin{equation}
D(p + u \,\|\, p) = \frac{1}{2} g_p(u, u) + O(\|u\|^3).
\end{equation}
The Fisher metric is the second-order term of the relative entropy at the diagonal.
\end{lemma}
LINE 191 \begin{proposition}[Monotonicity of the Fisher metric]
\label{prop:monotone}
The Fisher metric is monotone under stochastic maps.
\end{proposition}
LINE 221 \begin{theorem}[Chentsov]
\label{thm:chentsov}
On the probability simplices, the Fisher family is the unique family of Riemannian metrics, up to a single positive constant shared across dimensions, that is monotone under stochastic maps.
\end{theorem}
LINE 238 \begin{theorem}[Petz-Sud\'ar]
\label{thm:petz-sudar}
Monotone metric families $\{g^{(d)}\}_{d \geq 2}$ in the sense of \cref{def:quantum-monotone} correspond exactly to functions $f : (0, \infty) \to (0, \infty)$ that are operator monotone of all matrix orders and satisfy $f(t) = t f(1/t)$, by the formula \eqref{eq:petz} in each dimension \cite{petz-1996, petz-sudar-jmp}. The correspondence is a bijection after the normalization $f(1) = 1$, which is equivalent to restricting to the Fisher value on diagonal tangent vectors; without the normalization, metrics correspond to $f$ only up to a positive constant. In particular the symmetric logarithmic derivative metric of \cref{def:sld} corresponds to $f(t) = (1+t)/2$, and there are infinitely many monotone metrics.
\end{theorem}
LINE 245 \begin{proposition}[Non-uniqueness on qubit states]
\label{prop:nonunique}
Let $\rho = \operatorname{diag}(3/4, 1/4)$ and let $X = \sigma_x / 2$, $Y = \sigma_z / 2$ be the transverse and radial tangent vectors at $\rho$ in Bloch coordinates. For the symmetric logarithmic derivative metric,
\begin{equation}
g^{\mathrm{sld}}_{\rho}(X, X) = 1, \qquad g^{\mathrm{sld}}_{\rho}(Y, Y) = \frac{4}{3}.
\end{equation}
For the Wigner-Yanase metric, given by \eqref{eq:petz} with $f_{\mathrm{wy}}(t) = \tfrac{1}{4}(1 + \sqrt{t})^2$,
\begin{equation}
g^{\mathrm{wy}}_{\rho}(X, X) = 4(2 - \sqrt{3}), \qquad g^{\mathrm{wy}}_{\rho}(Y, Y) = \frac{4}{3}.
\end{equation}
The radial-to-transverse ratio is $4/3$ for the symmetric logarithmic derivative metric and $(2 + \sqrt{3})/3 \neq 4/3$ for the Wigner-Yanase metric, so the two metrics are not proportional. Quantum monotone metrics are not unique, even up to a constant.
\end{proposition}
LINE 273 \begin{proposition}[Commutative locus]
\label{prop:commutative}
For every normalized operator monotone $f$ and every full-rank diagonal $\rho = \sum_i \lambda_i |i\rangle\langle i|$, the restriction of $g^{f}$ to diagonal tangent vectors is the Fisher value:
\begin{equation}
g^{f}_{\rho}(X, X) = \sum_i \frac{X_{ii}^2}{\lambda_i}.
\end{equation}
More generally the restriction of any monotone metric to commuting states is a classical monotone metric, hence $c \cdot g^{\mathrm{fisher}}$ for some $c > 0$ by Chentsov's theorem (\cref{thm:chentsov}); in the Petz family $c = 1/f(1)$, so the normalization $f(1) = 1$ forces $c = 1$. Every normalized monotone metric restricts to the Fisher metric on the commutative locus.
\end{proposition}
LINE 303 \begin{proposition}[Symmetric logarithmic derivative geometry of the qubit]
\label{prop:qubit-sld}
In Bloch coordinates the symmetric logarithmic derivative metric is
\begin{equation}
\label{eq:qubit-sld}
g^{\mathrm{sld}} = |d\vec{r}|^2 + \frac{(\vec{r} \cdot d\vec{r})^2}{1 - |\vec{r}|^2}.
\end{equation}
In spherical coordinates $|\vec{r}| = r = \sin\chi$ this becomes $g^{\mathrm{sld}} = (d\chi)^2 + \sin^2\!\chi \, (d\Omega)^2$ with $\chi \in (0, \pi/2)$: the open state space $\mathcal{D}_2^{\circ}$ is isometric to an open hemisphere of the round three-sphere of radius one, of constant sectional curvature one.
\end{proposition}
LINE 323 \begin{proposition}[Fidelity metric of the qubit]
\label{prop:qubit-fid}
On $\mathcal{D}_2^{\circ}$ the fidelity metric satisfies $g^{\mathrm{fid}} = \tfrac{1}{4} g^{\mathrm{sld}}$. Consequently the open state space with the fidelity metric is an open hemisphere of the round three-sphere of radius one half, of constant sectional curvature four.
\end{proposition}
LINE 352 \begin{corollary}[Fisher geometry of the full simplex]
\label{cor:homogeneity}
The Fisher metric on the interior of $\Delta_{n-1}$ is locally isometric to the round sphere of radius two, with sectional curvature $1/4$ for $n \geq 3$, and the arc of \cref{rem:bernoulli} for $n = 2$. The isometry group of the full model is the finite group of coordinate permutations. Two statistical models defined on the full simplex with the same number of outcomes are isometric as Riemannian manifolds, and a permutation of outcomes is an isometry.
\end{corollary}
LINE 393 \begin{theorem}[Gelfand-Naimark and Gelfand duality]
\label{thm:gelfand}
Every commutative unital $C^*$-algebra is isometrically $*$-isomorphic to $C(X)$ for a compact Hausdorff space $X$, its Gelfand spectrum; contravariantly, the categories of commutative unital $C^*$-algebras and of compact Hausdorff spaces are dual \cite{gn}. In particular the space $X$ is recovered from the algebra of observables $\mathcal{O} = C(X)$ alone.
\end{theorem}
LINE 398 \begin{theorem}[Stone duality]
\label{thm:stone}
Boolean algebras are dual to compact totally disconnected Hausdorff spaces \cite{stone}; the space is recovered from the algebra of clopen sets.
\end{theorem}
LINE 415 \begin{theorem}[Entanglement-wedge reconstruction, Dong-Harlow-Wall]
\label{thm:dhw}
Let a boundary region $A$ and a code subspace of states be given in the holographic setting, with bulk geometry dual to a state in that subspace. Every bulk operator localized in the entanglement wedge $W(A)$ can be reconstructed as an operator of the boundary subregion $A$ acting on the code subspace; the reconstruction preserves expectation values on that subspace \cite{dhw}. The result is a theorem of quantum information theory (quantum error correction and relative entropy), proved under the stated hypotheses of the holographic code setup.
\end{theorem}
LINE 451 \begin{theorem}[Holographic entropy cone]
\label{thm:cone}
In static holographic settings with $N$ boundary subregions of a state purified by a complement \cite{bao}, the complete linear entropy inequalities for $N = 2, 3, 4$ are generated by subadditivity, the Araki-Lieb inequalities, and monogamy of mutual information. For $N = 5$ five further symmetry orbits of five-party inequalities, including the cyclic five-party inequality, are required, and the resulting description is complete \cite{hc5}. For six and more regions the complete inequality set is unknown. For each fixed $N$ there are only finitely many independent inequalities.
\end{theorem}
LINE 470 \begin{proposition}[Ideal gas]
\label{prop:ideal-gas}
For the ideal gas with entropy $S(U, V, N) = Nk \bigl(c_v \log U + \log V - (c_v + 1) \log N + \text{const}\bigr)$ at fixed $N$ and heat capacity coefficient $c_v$, the Ruppeiner metric in the coordinates $(U, V)$ is
\begin{equation}
g^{\mathrm{rup}} = Nk \left( c_v \frac{(dU)^2}{U^2} + \frac{(dV)^2}{V^2} \right),
\end{equation}
which is flat: its scalar curvature vanishes identically.
\end{proposition}

exec
/usr/local/bin/zsh -lc "sed -n '435,465p' papers/latex/vol-03-irreducibility-decomposition.tex; nl -ba lean/Cmrps/Vol02StructuralFamilies.lean | sed -n '178,195p'; nl -ba lean/Cmrps/Vol01Foundations.lean | sed -n '630,655p'; sed -n '428,439p' papers/latex/vol-01-foundations.tex; rg -n 'paper.facing|kept|reimplement|duplicate|wrapper' lean --glob '*.lean' --glob '"'!**/.lake/**'"'" in /Users/mlong/Documents/Development/classification-physical-systems
 exited 1 in 0ms:
\end{enumerate}
\end{proposition}

\begin{proof}
Direct sum concatenates block lists and matrix algebras satisfy $M_n(\mathbb{C}) \otimes M_m(\mathbb{C}) \cong M_{nm}(\mathbb{C})$, which gives the two computations. The third clause restates simplicity of the blocks: a direct sum is reducible exactly when both summands are nonzero, and the irreducible objects are the simple algebras $M_n(\mathbb{C})$.
\end{proof}

\begin{corollary}[Closure of a finite set of blocks]
\label{cor:closure}
Let $S = \{M_{n_1}(\mathbb{C}), \dots, M_{n_k}(\mathbb{C})\}$ and let $\mathcal{C} = \{\oplus, \otimes\}$. The closure $\langle S \rangle_{\mathcal{C}}$ is the class of unital finite-dimensional complex C*-algebras whose dimension vector entries lie in the multiplicative semigroup generated by $n_1, \dots, n_k$ in $\mathbb{N}_{\geq 1}$.
\end{corollary}

\begin{proof}
By \cref{prop:construction-arithmetic} every element of the closure has dimension vector entries built from the $n_i$ by multiplication, and every finite multiset of such products is realized by taking direct sums of tensor products of generators.
\end{proof}

\begin{table}[ht]
\centering
\small
\begin{tabularx}{\textwidth}{@{}L{0.2\textwidth}L{0.24\textwidth}X@{}}
\toprule
Construction & Effect on dimension vectors & Composition data it contributes \\
\midrule
Direct sum & Multiset union of the two vectors & Superselection structure of the combined system \\
Tensor product & Pairwise product multiset & Subsystem structure of the combined system \\
Extension & Not determined by dimension vectors alone & Coupling data that must be stated case by case \\
Quotient and symmetry reduction & Not determined by dimension vectors alone & Gauge identification data that must be stated case by case \\
Factorization & Splits a module into block summands & Central projections of the observable algebra \\
\bottomrule
\end{tabularx}
\caption{Effect of the admissible constructions on dimension vectors, with the composition data each construction contributes. The two computable rows are the ones the closure argument uses.}
   178	germs cannot separate two non-equivalent objects, hence cannot be classifying. -/
   179	theorem globality_no_local_classifier {G : SymplecticGermField} {A : Type v}
   180	    {f : G.Germ → A} (hf : GermInvariant f) (g h : G.Germ) : f g = f h :=
   181	  globality_symplectic hf g h
   182	
   183	/-! ## Achievement kinds (paper Definition 3.6, Proposition 3.7) -/
   184	
   185	/-- Paper Definition 3.6: the five achievement kinds of a classified sector. -/
   186	inductive AchievementKind where
   187	  /-- Complete and parameterized. -/
   188	  | completeAndParameterized : AchievementKind
   189	  /-- Complete and unparameterized. -/
   190	  | completeAndUnparameterized : AchievementKind
   191	  /-- Complete as an obstruction classification. -/
   192	  | completeAsObstruction : AchievementKind
   193	  /-- Impossible: an impossibility theorem is on record. -/
   194	  | impossible : AchievementKind
   195	  /-- No record: no classification and no impossibility theorem on record. -/
   630	`M i j` is the coefficient of `eᵢ ⊗ eⱼ` in a chosen factorisation of the bare
   631	four-dimensional space. -/
   632	abbrev CoeffMat := Matrix (Fin 2) (Fin 2) ℂ
   633	
   634	/-- The diagonal entries of the reduced density matrix `M ⬝ M†` of a pure
   635	two-qubit state with coefficient matrix `M`: the squared norms of the rows. -/
   636	noncomputable def reducedDiag (M : CoeffMat) : Fin 2 → ℝ := fun i => ∑ j, ‖M i j‖ ^ 2
   637	
   638	/-- The off-diagonal entry `ρ₀₁` of the reduced density matrix `M ⬝ M†`; the
   639	reduced matrix is diagonal exactly when this vanishes. -/
   640	noncomputable def reducedOffDiag (M : CoeffMat) : ℂ := ∑ j, M 0 j * star (M 1 j)
   641	
   642	/-- A pure two-qubit state is a unit vector of the bare space. -/
   643	def IsUnitState (M : CoeffMat) : Prop := (∑ i, ∑ j, ‖M i j‖ ^ 2) = 1
   644	
   645	/-- Entanglement entropy of a pure two-qubit state whose reduced density
   646	matrix is diagonal in the computational basis: the von Neumann entropy of the
   647	reduced state is the entropy of the distribution of its diagonal entries (the
   648	squared row norms computed by `reducedDiag`). Both witnesses of
   649	Proposition 7.6 have diagonal reduced density matrix. -/
   650	noncomputable def entanglementEntropy (M : CoeffMat) : ℝ :=
   651	  -(reducedDiag M 0 * Real.log (reducedDiag M 0) +
   652	    reducedDiag M 1 * Real.log (reducedDiag M 1))
   653	
   654	/-- The change of factorisation `W` of Proposition 7.6: the Hadamard rotation
   655	on the span of the diagonal coefficient matrices `e₁ ⊗ e₁`, `e₂ ⊗ e₂`,
\begin{proof}
Write $v_1 = e_1 \otimes e_1$ and $v_2 = e_2 \otimes e_2$. In the standard factorization $\psi = v_1$ is a product vector, its Schmidt rank is one, and its entanglement entropy is $0$. Let $W$ be the unitary of $H$ that acts on the span of $v_1, v_2$ by the rotation $W v_1 = (v_1 + v_2)/\sqrt{2}$ and $W v_2 = (v_1 - v_2)/\sqrt{2}$, and acts as the identity on the orthogonal complement. Then $W$ is self-adjoint and unitary on that span, so $W^2$ is the identity there. Write $\Phi_1 \colon H \to \mathbb{C}^2 \otimes \mathbb{C}^2$ for the standard factorization, so that $\psi = v_1$ has coordinate vector $v_1$. The second factorization is the pullback $\Phi_2 = \Phi_1 \circ W^{-1}$: the vector $\psi$ is unchanged and the factorizing isomorphism changes. In the coordinates of $\Phi_2$ the fixed vector $\psi$ is represented by $\Phi_2(\psi) = \Phi_1(W^{-1} \psi)$, and since $W^2$ is the identity on the span of $v_1, v_2$ we have $W^{-1} = W$ there, so the coordinate vector is $W \psi = (v_1 + v_2)/\sqrt{2} = (e_1 \otimes e_1 + e_2 \otimes e_2)/\sqrt{2}$. Its Schmidt coefficients are $1/\sqrt{2}$ and $1/\sqrt{2}$ and its entanglement entropy is $\log 2$. Both factorizations are legitimate structures on $H$, so the decomposition into factors is not a function of the bare Hilbert space.
\end{proof}

Two qualifications bound the claim. Factorizations related by a local unitary or by the swap of the two factors give the same entanglement entropy for every vector, so the proposition asserts the existence of a differing pair of factorizations and does not claim that every pair differs. When the symmetry data $\mathcal{S}$ of the record is fixed as a concrete subgroup $U(2) \times U(2)$ of $U(4)$, as in Definition~\ref{def:qubit}, that subgroup does pick out a tensor factorization up to factor swap, which is why Definition~\ref{def:qubit} makes the factorization part of the record.

Entanglement is a relation between a vector and a chosen tensor structure, and a classification of quantum systems that forgets the tensor structure classifies vectors in a bare space. The non-uniqueness visible here is the smallest member of the family of phenomena, entanglement, emergence, and gauge redundancy among them, that make decomposition uniqueness open for interacting systems in general.

\section{Classification in restricted classes}
\label{sec:restricted}

A framework for classification is worth having when classification theorems can be stated and proved inside it. Two restricted classes admit complete classification, and the theorems below give the series its smallest worked instances: an irreducible list, a decomposition theorem, a complete invariant, and a proof.

 succeeded in 66854ms:
python3: warning: confstr() failed with code 5: couldn't get path of DARWIN_USER_TEMP_DIR; using /tmp instead
python3: error: couldn't create cache file '/tmp/xcrun_db-juIt5yiA' (errno=Operation not permitted)
2026-10-30 06:59:02.840 xcodebuild[37242:40788597]  DVTFilePathFSEvents: Failed to start fs event stream.
2026-10-30 06:59:03.003 xcodebuild[37242:40788596] [MT] DVTDeveloperPaths: Failed to get length of DARWIN_USER_CACHE_DIR from confstr(3), error = Error Domain=NSPOSIXErrorDomain Code=5 "Input/output error". Using NSCachesDirectory instead.
python3: warning: confstr() failed with code 5: couldn't get path of DARWIN_USER_TEMP_DIR; using /tmp instead
python3: error: couldn't create cache file '/tmp/xcrun_db-aLD3Vsti' (errno=Operation not permitted)
2026-10-30 06:59:03.519 xcodebuild[37244:40788617]  DVTFilePathFSEvents: Failed to start fs event stream.
2026-10-30 06:59:03.632 xcodebuild[37244:40788616] [MT] DVTDeveloperPaths: Failed to get length of DARWIN_USER_CACHE_DIR from confstr(3), error = Error Domain=NSPOSIXErrorDomain Code=5 "Input/output error". Using NSCachesDirectory instead.
Cmrps/Vol01Foundations.lean exit 0
diagnostic lines: 0
Cmrps/Vol02StructuralFamilies.lean exit 0
diagnostic lines: 90
Cmrps/Vol03IrreducibilityDecomposition.lean exit 0
diagnostic lines: 0
Cmrps/Vol04YonedaClassification.lean exit 0
diagnostic lines: 0
Cmrps/Vol05ClassicalSystems.lean exit 0
diagnostic lines: 0
Cmrps/Vol06QuantumSystems.lean exit 0
diagnostic lines: 0
Cmrps/Vol07GaugeQft.lean exit 0
diagnostic lines: 0
Cmrps/Vol08SpacetimeReconstruction.lean exit 0
diagnostic lines: 49
Cmrps/Vol09GravityInformationGeometry.lean exit 0
diagnostic lines: 151
Cmrps/Vol10ObservationalEquivalence.lean exit 0
diagnostic lines: 0
Cmrps/Vol11CompletenessObstructions.lean exit 0
diagnostic lines: 30
Cmrps/Vol12PrincipiaPhysica.lean exit 0
diagnostic lines: 18

exec
/usr/local/bin/zsh -lc 'paths=(.lake/build/lib/lean .lake/packages/*/.lake/build/lib/lean); export LEAN_PATH="${(j/:/)paths}"; lean Cmrps/Vol10ObservationalEquivalence.lean' in /Users/mlong/Documents/Development/classification-physical-systems/lean
 succeeded in 1710ms:
exec
/usr/local/bin/zsh -lc "rg -n 'map_sum|map_list_sum' lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/List/Defs.lean; nl -ba lean/Cmrps/Vol03IrreducibilityDecomposition.lean | sed -n '68,84p'; nl -ba lean/Cmrps/Vol02StructuralFamilies.lean | sed -n '561,570p'; nl -ba lean/Cmrps/Vol01Foundations.lean | sed -n '154,177p'; nl -ba lean/Cmrps/Vol02StructuralFamilies.lean | sed -n '279,306p'; nl -ba lean/Cmrps/Vol02StructuralFamilies.lean | sed -n '739,752p'; sed -n '40,55p' lean/.lake/packages/mathlib/Mathlib/Logic/Equiv/Set.lean; sed -n '335,349p' lean/.lake/packages/mathlib/Mathlib/Data/Multiset/Bind.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
    68	
    69	/-- Multiplicative size semigroup generated by a set `S` of block sizes
    70	(paper `cor:closure`): the submonoid of `(ℕ, ×)` generated by `S`. -/
    71	def sizeSemigroup (S : Set ℕ) : Submonoid ℕ :=
    72	  Submonoid.closure S
    73	
    74	/-- A dimension vector is closed over `S` when every entry lies in the generated
    75	multiplicative semigroup (paper `cor:closure`). -/
    76	def ClosedVectors (S : Set ℕ) (v : Multiset ℕ) : Prop :=
    77	  ∀ ⦃x⦄, x ∈ v → x ∈ sizeSemigroup S
    78	
    79	/-- Pairwise product of two dimension vectors (paper `prop:construction-arithmetic` (2)). -/
    80	def pairwiseProd (v w : Multiset ℕ) : Multiset ℕ :=
    81	  v.bind fun a => w.map fun b => a * b
    82	
    83	/-- Block permutations: permutations of the block index preserving all block sizes
    84	(paper `cor:outer-aut`, data layer). -/
   561	section Cotangent
   562	
   563	variable {Q : Type u} [TopologicalSpace Q]
   564	variable {V : Type v} [AddCommGroup V] [Module ℝ V] [TopologicalSpace V] [ContinuousSMul ℝ V]
   565	
   566	/-- Paper Proposition 4.1: the deformation retraction `r_t(x, ξ) = (x, tξ)` of `T*Q`
   567	onto its zero section, modelled on the total space `Q × V`. -/
   568	def retraction (t : ℝ) (p : Q × V) : Q × V := (p.1, t • p.2)
   569	
   570	/-- `r_1 = id`. -/
   154	the objects are the records and `Hom P Q` the morphisms of the chosen kind. -/
   155	structure CategoryData (Obj : Type u) (Hom : Obj → Obj → Type v) where
   156	  /-- The identity morphism of a record. -/
   157	  id : ∀ X, Hom X X
   158	  /-- Composition of morphisms of the kind. -/
   159	  comp : ∀ {X Y Z : Obj}, Hom X Y → Hom Y Z → Hom X Z
   160	  /-- Left identity law. -/
   161	  id_comp : ∀ {X Y : Obj} (f : Hom X Y), comp (id X) f = f
   162	  /-- Right identity law. -/
   163	  comp_id : ∀ {X Y : Obj} (f : Hom X Y), comp f (id Y) = f
   164	  /-- Associativity of composition. -/
   165	  assoc : ∀ {W X Y Z : Obj} (f : Hom W X) (g : Hom X Y) (h : Hom Y Z),
   166	    comp (comp f g) h = comp f (comp g h)
   167	
   168	/-- Morphisms of coarse-graining kind between finite classical records. -/
   169	def CoarseHom (P Q : FinRec) : Type := {f : P.X → Q.X // IsCoarseGraining f}
   170	
   171	/-- Morphisms of embedding kind between finite classical records. -/
   172	def EmbeddingHom (P Q : FinRec) : Type := {f : P.X → Q.X // IsEmbedding f}
   173	
   174	/-- Morphisms of equivalence kind between finite classical records. -/
   175	def EquivalenceHom (P Q : FinRec) : Type := {f : P.X → Q.X // IsEquivalenceMorphism f}
   176	
   177	/-- Proposition 6.4 (target `vol01.admissibility.kind_category`), coarse-graining
   279	  fun n hn => by
   280	    rcases Multiset.mem_add.1 hn with h | h
   281	    · exact hv n h
   282	    · exact hw n h
   283	
   284	/-- Membership in a multiset product. -/
   285	private theorem mem_product {v w : Multiset ℕ} {p : ℕ × ℕ} :
   286	    p ∈ (v ×ˢ w) ↔ p.1 ∈ v ∧ p.2 ∈ w := by
   287	  have h : v ×ˢ w = v.bind fun a => w.map (Prod.mk a) := rfl
   288	  rw [h, Multiset.mem_bind]
   289	  constructor
   290	  · rintro ⟨a, ha, hp⟩
   291	    rcases Multiset.mem_map.1 hp with ⟨b, hb, heq⟩
   292	    have : p = (a, b) := heq.symm
   293	    subst this
   294	    exact ⟨ha, hb⟩
   295	  · rintro ⟨h1, h2⟩
   296	    exact ⟨p.1, h1, Multiset.mem_map.2 ⟨p.2, h2, rfl⟩⟩
   297	
   298	theorem pos_tensor {v w : DimensionVector} (hv : v.Pos) (hw : w.Pos) :
   299	    (tensor v w).Pos := by
   300	  intro n hn
   301	  rcases Multiset.mem_map.1 hn with ⟨p, hp, rfl⟩
   302	  rcases mem_product.1 hp with ⟨h₁, h₂⟩
   303	  exact Nat.mul_pos (hv p.1 h₁) (hw p.2 h₂)
   304	
   305	theorem totalDim_sum (v w : DimensionVector) :
   306	    totalDim (sum v w) = totalDim v + totalDim w := by
   739	
   740	/-! ## Comparability of records (paper Proposition 18.1) -/
   741	
   742	section Comparability
   743	
   744	/-- Subtype equivalence along an equality of sets. -/
   745	def subtypeEquivOfEq {γ : Type*} {s t : Set γ} (h : s = t) : ↥s ≃ ↥t where
   746	  toFun p := ⟨p.1, h ▸ p.2⟩
   747	  invFun p := ⟨p.1, h.symm ▸ p.2⟩
   748	  left_inv := fun p => Subtype.ext rfl
   749	  right_inv := fun p => Subtype.ext rfl
   750	
   751	/-- Paper Proposition 18.1: two classification records that agree on family, sector, and
   752	equivalence (same objects, same physical equivalence) and that both name classifying

end EquivLike

namespace Set
variable {α : Type*} {s t : Set α}

/-- The subtypes corresponding to equal sets are equivalent.

See also `Finset.equivOfEq`. -/
@[simps! apply symm_apply]
def equivOfEq (h : s = t) : s ≃ t := Equiv.subtypeEquivProp <| h ▸ rfl

lemma strictMono_equivOfEq [Preorder α] (h : s = t) : StrictMono (equivOfEq h) := fun _ _ ↦ id

@[deprecated (since := "2026-08-29")] alias _root_.Equiv.Set.congr := equivOfEq
@[deprecated (since := "2026-08-29")] alias _root_.Equiv.Set.congr_apply := equivOfEq_apply

@[simp]
theorem card_product : card (s ×ˢ t) = card s * card t := by simp [SProd.sprod, product]

variable {s t}

@[simp] lemma mem_product : ∀ {p : α × β}, p ∈ s ×ˢ t ↔ p.1 ∈ s ∧ p.2 ∈ t
  | (a, b) => by simp [SProd.sprod, product, and_left_comm]

protected theorem Nodup.product : Nodup s → Nodup t → Nodup (s ×ˢ t) :=
  Quotient.inductionOn₂ s t fun l₁ l₂ d₁ d₂ => by simp [List.Nodup.product d₁ d₂]

@[simp] lemma map_swap_product (s : Multiset α) (t : Multiset β) :
    (s ×ˢ t).map Prod.swap = t ×ˢ s := by
  induction s using Multiset.induction <;> simp_all

codex
All 12 Lean source modules type-check successfully with Lean 4.35.0 and the pinned dependencies. The remaining findings concern statement scope and library reuse, rather than compiler failures or unfinished proof branches.
exec
/usr/local/bin/zsh -lc "rg -n '"'^'"\\s*(axiom|opaque|unsafe)|\\b(sorryAx|native_decide|admit)\\b|\\bsorry\\b' lean/Cmrps/*.lean lean/Cmrps.lean; nl -ba lean/Cmrps/Vol02StructuralFamilies.lean | sed -n '164,182p'; nl -ba lean/Cmrps/Vol02StructuralFamilies.lean | sed -n '602,618p'; rg -n 'def IsDistinguishing|def Independent|yoneda_embedding_preserves_limits|Scope caveat|def NotFactoring|theorem MonotoneMetricGapQuantum|def Coarsens' lean/Cmrps/*.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
lean/Cmrps/Vol02StructuralFamilies.lean:729:/-- Paper Proposition 16.2: two families may each admit a classifying invariant and
lean/Cmrps/Vol10ObservationalEquivalence.lean:14:statement definitions left unproved. Nothing in this file uses `sorry` or new axioms.
lean/Cmrps/Vol11CompletenessObstructions.lean:25:file uses `sorry` or an axiom.
lean/Cmrps/Vol12PrincipiaPhysica.lean:14:hypotheses. Nothing in this file uses `sorry` or new axioms.
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:28:All statements below are fully proved; nothing uses `sorry`, `axiom`, or `native_decide`.
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:233:/-- Paper Table 4.1 row 3: column sums `(1, 2)` admit `2 × 3 = 6` multiplicity matrices.
   164	  symplectomorphic to the standard germ. -/
   165	  darboux : ∀ g h : Germ, SympEq g h
   166	
   167	/-- A germ invariant: a map on germs invariant under symplectomorphism of germs. -/
   168	def GermInvariant {G : SymplecticGermField} {A : Type v} (f : G.Germ → A) : Prop :=
   169	  ∀ g h : G.Germ, G.SympEq g h → f g = f h
   170	
   171	/-- Paper Proposition 3.4: every germ invariant is constant at every point. The
   172	hypothesis `n ≥ 1` is carried by `Darboux` holding on the germ type. -/
   173	theorem globality_symplectic {G : SymplecticGermField} {A : Type v} {f : G.Germ → A}
   174	    (hf : GermInvariant f) : ∀ g h : G.Germ, f g = f h :=
   175	  fun g h => hf g h (G.darboux g h)
   176	
   177	/-- Paper Proposition 3.4 consequence: a germ invariant taking the same value on all
   178	germs cannot separate two non-equivalent objects, hence cannot be classifying. -/
   179	theorem globality_no_local_classifier {G : SymplecticGermField} {A : Type v}
   180	    {f : G.Germ → A} (hf : GermInvariant f) (g h : G.Germ) : f g = f h :=
   181	  globality_symplectic hf g h
   182	
   602	  exact (continuous_snd.fst).prodMk (continuous_fst.smul continuous_snd.snd)
   603	
   604	/-- Paper Proposition 4.1: the zero section is a deformation retract of `T*Q`;
   605	the data above (continuity of `r_t`, `r_1 = id`, `r_0` through the zero section,
   606	`r_s ∘ r_t = r_{st}`, and the fixed zero section) is the content of the proposition. -/
   607	theorem cotangent_retract :
   608	    (∀ t : ℝ, Continuous (retraction (t : ℝ) (Q := Q) (V := V))) ∧
   609	      (∀ p : Q × V, retraction (1 : ℝ) p = p) ∧
   610	        (∀ p : Q × V, retraction (0 : ℝ) p ∈ Set.range (fun x : Q => (x, (0 : V)))) ∧
   611	          (∀ s t : ℝ, ∀ p : Q × V,
   612	            retraction s (retraction t p) = retraction (s * t) p) ∧
   613	            (∀ t : ℝ, ∀ x : Q, retraction t (x, (0 : V)) = (x, 0)) :=
   614	  ⟨continuous_retraction, fun _ => retraction_one _,
   615	    retraction_zero_mem_zeroSection, fun _ _ _ => retraction_comp _ _ _,
   616	    fun _ _ => retraction_fixes_zero_section _ _⟩
   617	
   618	end Cotangent
lean/Cmrps/Vol12PrincipiaPhysica.lean:37:same partition of `P`). **Scope caveat (Codex review, round 1):** this is NOT the
lean/Cmrps/Vol12PrincipiaPhysica.lean:41:def NotFactoring {M P Obs : Type} (cls : P → M) (select : P → Obs) : Prop :=
lean/Cmrps/Vol12PrincipiaPhysica.lean:261:**Scope caveat (Codex review, round 1):** this theorem establishes only that an abstract
lean/Cmrps/Vol12PrincipiaPhysica.lean:268:theorem MonotoneMetricGapQuantum
lean/Cmrps/Vol11CompletenessObstructions.lean:45:is the correctness clause of the decision procedure. **Scope caveat (Codex
lean/Cmrps/Vol11CompletenessObstructions.lean:208:a procedure `d` with `d x = true ↔ Q x`. **Scope caveat (Codex review, round 1):**
lean/Cmrps/Vol11CompletenessObstructions.lean:222:argument. **Scope caveat (Codex review, round 1):** because `DecidableProblem`
lean/Cmrps/Vol11CompletenessObstructions.lean:291:def Coarsens {α : Type u} (r s : α → α → Prop) : Prop :=
lean/Cmrps/Vol10ObservationalEquivalence.lean:351:parameter. Scope caveats (Codex review, round 1): the injectivity clause is only
lean/Cmrps/Vol02StructuralFamilies.lean:695:of the objects of `F` into the objects of `G`. **Scope caveat (Codex review, round 1):**
lean/Cmrps/Vol02StructuralFamilies.lean:702:correspondence determines one from the other. **Scope caveat (Codex review, round 1):**
lean/Cmrps/Vol02StructuralFamilies.lean:709:**Scope caveat (Codex review, round 1):** with the object-level shadows above, classical
lean/Cmrps/Vol02StructuralFamilies.lean:713:def Independent (F G : StructuralFamily) : Prop :=
lean/Cmrps/Vol08SpacetimeReconstruction.lean:78:def IsDistinguishing {α : Type*} (r : α → α → Prop) : Prop :=
lean/Cmrps/Vol04YonedaClassification.lean:211:`yoneda_embedding_preserves_limits` below, which is the statement of Proposition 3.7. -/
lean/Cmrps/Vol04YonedaClassification.lean:218:theorem yoneda_embedding_preserves_limits :

codex
All 12 Lean modules type-check with Lean 4.35.0 and the pinned dependencies. I found no project-defined axioms, `sorry`/`admit` proofs, or incomplete pattern matches. Namespaces are consistently scoped under `Cmrps.VolXX`.

Round 1 changes are present: Vol08’s separate injectivity conditions, Vol10’s positive-domain self-reciprocity and caveats, Vol02’s object-shadow caveats, Vol04’s embedding preservation theorem, and Vol11/12’s scope warnings. Claim-status demotions outside the permitted files were not inspected.

Remaining issues:

1. **Petz statement still lacks the operator-monotonicity hypothesis.**  
   `lean/Cmrps/Vol10ObservationalEquivalence.lean:355–362`, compared with `papers/latex/vol-10-observational-equivalence.tex:324–338`.  
   The first clause declares every normalized self-reciprocal function admissible. For example, `f(x) = if x = 1 then 1 else 0` satisfies both conditions but produces zero quadratic value on nonzero off-diagonal directions at unequal positive eigenvalues. It cannot define a Riemannian metric. The `monotone` parameter constrains metrics, not parameter functions, so it does not supply the missing hypothesis.  
   **Fix:** add an explicit operator-monotonicity predicate on `f`, positive eigenvalue and tangent conditions, and `n ≥ 2`. Compare parameter functions only on the positive domain. This is an unproved specification defect, not an unsound proved theorem.

2. **The cotangent theorem proves only a trivial-bundle model.**  
   `lean/Cmrps/Vol02StructuralFamilies.lean:566–568,604–613`, versus `papers/latex/vol-02-structural-families.tex:232–239`.  
   The formal carrier is `Q × V`; a general cotangent bundle is not globally such a product. Consequently, the claim that this is “the content of the proposition” overstates what was mechanized.  
   **Fix:** formalize fiberwise scaling on a vector-bundle total space, or rename this as the product-bundle fragment and explicitly leave the general cotangent result unformalized.

3. **The “no local classifier” theorem establishes only constancy.**  
   `lean/Cmrps/Vol02StructuralFamilies.lean:177–181`, versus `papers/latex/vol-02-structural-families.tex:163–170`.  
   Its conclusion repeats `globality_symplectic`. There are no global manifolds, inequivalent witnesses, or classifier predicate. Indeed, `G.darboux` makes every pair of germs equivalent, so a constant invariant *does* classify that germ equivalence.  
   **Fix:** restrict the docstring/name to germ constancy, or introduce global objects and an inequivalent pair that the local invariant identifies, then prove failure of classification.

4. **The block-closure model silently adds the multiplicative unit.**  
   `lean/Cmrps/Vol03IrreducibilityDecomposition.lean:69–77`, versus `papers/latex/vol-03-irreducibility-decomposition.tex:442–450`.  
   `Submonoid.closure` always contains `1`. Starting with only block size `2`, binary direct sums and tensor products cannot generate a size-`1` block, yet `ClosedVectors {2} {1}` holds. The model therefore describes a larger closure unless nullary tensor products are explicitly admitted.  
   **Fix:** use generated nonempty products, or explicitly include the tensor unit in the paper’s construction convention and describe this as closure with that unit adjoined.

5. **The no-reproof requirement remains unmet.**  
   Concrete duplicates include:
   
   - `lean/Cmrps/Vol02StructuralFamilies.lean:285–296`: replace the membership proof with `Multiset.mem_product`.
   - `lean/Cmrps/Vol02StructuralFamilies.lean:745–749`: replace the equivalence construction with `Set.equivOfEq`.
   - `lean/Cmrps/Vol01Foundations.lean:155–166`: replace `CategoryData` with Mathlib’s `CategoryTheory.Category`, using wrappers for the different morphism kinds.

   The first two replacements exist in the pinned Mathlib checkout. Paper-facing names can remain as thin aliases; documentation alone does not remove the duplicated implementations.

VERDICT: NEEDS_FIX
hook: Stop
hook: Stop Completed
tokens used
180,307
All 12 Lean modules type-check with Lean 4.35.0 and the pinned dependencies. I found no project-defined axioms, `sorry`/`admit` proofs, or incomplete pattern matches. Namespaces are consistently scoped under `Cmrps.VolXX`.

Round 1 changes are present: Vol08’s separate injectivity conditions, Vol10’s positive-domain self-reciprocity and caveats, Vol02’s object-shadow caveats, Vol04’s embedding preservation theorem, and Vol11/12’s scope warnings. Claim-status demotions outside the permitted files were not inspected.

Remaining issues:

1. **Petz statement still lacks the operator-monotonicity hypothesis.**  
   `lean/Cmrps/Vol10ObservationalEquivalence.lean:355–362`, compared with `papers/latex/vol-10-observational-equivalence.tex:324–338`.  
   The first clause declares every normalized self-reciprocal function admissible. For example, `f(x) = if x = 1 then 1 else 0` satisfies both conditions but produces zero quadratic value on nonzero off-diagonal directions at unequal positive eigenvalues. It cannot define a Riemannian metric. The `monotone` parameter constrains metrics, not parameter functions, so it does not supply the missing hypothesis.  
   **Fix:** add an explicit operator-monotonicity predicate on `f`, positive eigenvalue and tangent conditions, and `n ≥ 2`. Compare parameter functions only on the positive domain. This is an unproved specification defect, not an unsound proved theorem.

2. **The cotangent theorem proves only a trivial-bundle model.**  
   `lean/Cmrps/Vol02StructuralFamilies.lean:566–568,604–613`, versus `papers/latex/vol-02-structural-families.tex:232–239`.  
   The formal carrier is `Q × V`; a general cotangent bundle is not globally such a product. Consequently, the claim that this is “the content of the proposition” overstates what was mechanized.  
   **Fix:** formalize fiberwise scaling on a vector-bundle total space, or rename this as the product-bundle fragment and explicitly leave the general cotangent result unformalized.

3. **The “no local classifier” theorem establishes only constancy.**  
   `lean/Cmrps/Vol02StructuralFamilies.lean:177–181`, versus `papers/latex/vol-02-structural-families.tex:163–170`.  
   Its conclusion repeats `globality_symplectic`. There are no global manifolds, inequivalent witnesses, or classifier predicate. Indeed, `G.darboux` makes every pair of germs equivalent, so a constant invariant *does* classify that germ equivalence.  
   **Fix:** restrict the docstring/name to germ constancy, or introduce global objects and an inequivalent pair that the local invariant identifies, then prove failure of classification.

4. **The block-closure model silently adds the multiplicative unit.**  
   `lean/Cmrps/Vol03IrreducibilityDecomposition.lean:69–77`, versus `papers/latex/vol-03-irreducibility-decomposition.tex:442–450`.  
   `Submonoid.closure` always contains `1`. Starting with only block size `2`, binary direct sums and tensor products cannot generate a size-`1` block, yet `ClosedVectors {2} {1}` holds. The model therefore describes a larger closure unless nullary tensor products are explicitly admitted.  
   **Fix:** use generated nonempty products, or explicitly include the tensor unit in the paper’s construction convention and describe this as closure with that unit adjoined.

5. **The no-reproof requirement remains unmet.**  
   Concrete duplicates include:
   
   - `lean/Cmrps/Vol02StructuralFamilies.lean:285–296`: replace the membership proof with `Multiset.mem_product`.
   - `lean/Cmrps/Vol02StructuralFamilies.lean:745–749`: replace the equivalence construction with `Set.equivOfEq`.
   - `lean/Cmrps/Vol01Foundations.lean:155–166`: replace `CategoryData` with Mathlib’s `CategoryTheory.Category`, using wrappers for the different morphism kinds.

   The first two replacements exist in the pinned Mathlib checkout. Paper-facing names can remain as thin aliases; documentation alone does not remove the duplicated implementations.

VERDICT: NEEDS_FIX
