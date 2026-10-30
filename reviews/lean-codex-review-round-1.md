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
session id: 01a18c9b-d524-7e30-be98-022f39ad1367
--------
user
Read ONLY the files under lean/ and papers/latex/*.tex (do not explore other directories). Review the Lean 4 + Mathlib sources under lean/ for: type correctness, missing hypotheses, over-strong claims vs their paper statements (check against papers/latex/*.tex), incomplete patterns, unsound axioms or sorry usage, Mathlib idempotence (no re-proving Mathlib), clarity of namespaces. House rule: no style nits on dashes. List issues with file:line references and concrete fixes. End your response with a VERDICT line — exactly one of: VERDICT: PASS or VERDICT: NEEDS_FIX.
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
I’ll read the Lean sources and LaTeX files, compare the formal statements with the papers, and report concrete issues with file and line references.
exec
/usr/local/bin/zsh -lc "rg --files lean papers/latex -g '*.lean' -g '*.tex' -g 'lean-toolchain' -g 'lakefile.*' -g 'lake-manifest.json'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
lean/lakefile.toml
papers/latex/vol-08-spacetime-reconstruction.tex
lean/Cmrps.lean
papers/latex/vol-05-classical-systems.tex
lean/lake-manifest.json
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
/usr/local/bin/zsh -lc "wc -l lean/Cmrps/*.lean papers/latex/*.tex; cat lean/lakefile.toml lean/lean-toolchain; rg -n 'sorry|axiom|admit|unsafe|theorem|lemma|def |structure |class |namespace|end ' lean/Cmrps/*.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
     808 lean/Cmrps/Vol01Foundations.lean
     798 lean/Cmrps/Vol02StructuralFamilies.lean
     340 lean/Cmrps/Vol03IrreducibilityDecomposition.lean
     407 lean/Cmrps/Vol04YonedaClassification.lean
     498 lean/Cmrps/Vol05ClassicalSystems.lean
     298 lean/Cmrps/Vol06QuantumSystems.lean
     308 lean/Cmrps/Vol07GaugeQft.lean
     475 lean/Cmrps/Vol08SpacetimeReconstruction.lean
     516 lean/Cmrps/Vol09GravityInformationGeometry.lean
     435 lean/Cmrps/Vol10ObservationalEquivalence.lean
     393 lean/Cmrps/Vol11CompletenessObstructions.lean
     429 lean/Cmrps/Vol12PrincipiaPhysica.lean
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
   15185 total
name = "Cmrps"
version = "0.1.0"
defaultTargets = ["Cmrps"]

[[require]]
name = "mathlib"
git = "https://github.com/leanprover-community/mathlib4"
rev = "56a005855ea17e0b0958f73ec801ae140b0a1679"

[[lean_lib]]
name = "Cmrps"
leanprover/lean4:v4.35.0lean/Cmrps/Vol03IrreducibilityDecomposition.lean:21:Names mirror the paper's labels. The abstract classification theorem (Thm 3.3 for
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:28:All statements below are fully proved; nothing uses `sorry`, `axiom`, or `native_decide`.
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:33:namespace Cmrps.Vol03
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:42:def dimVector {ι : Type*} [Fintype ι] (n : ι → ℕ) : Multiset ℕ :=
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:51:def starBlock {ι : Type*} [Fintype ι] {n : ι → ℕ} (x : BlockAlg n) : BlockAlg n :=
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:57:structure MultiplicityMatrix {ι κ : Type*} [Fintype ι] [Fintype κ]
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:65:def rankMatrix {ι κ : Type*} [Fintype ι] [Fintype κ] {n : ι → ℕ} {m : κ → ℕ}
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:71:def sizeSemigroup (S : Set ℕ) : Submonoid ℕ :=
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:76:def ClosedVectors (S : Set ℕ) (v : Multiset ℕ) : Prop :=
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:80:def pairwiseProd (v w : Multiset ℕ) : Multiset ℕ :=
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:85:def blockPerm {ι : Type*} [Fintype ι] (n : ι → ℕ) : Subgroup (Equiv.Perm ι) where
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:97:theorem mem_blockPerm {ι : Type*} [Fintype ι] {n : ι → ℕ} {σ : Equiv.Perm ι} :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:105:theorem finrank_blockAlg {ι : Type*} [Fintype ι] (n : ι → ℕ) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:111:theorem starBlock_involutive {ι : Type*} [Fintype ι] {n : ι → ℕ} (x : BlockAlg n) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:117:theorem starBlock_mul {ι : Type*} [Fintype ι] {n : ι → ℕ} (x y : BlockAlg n) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:125:theorem dimVector_perm_invariant {ι : Type*} [Fintype ι] (n : ι → ℕ) (σ : Equiv.Perm ι) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:139:theorem dimVector_sum_elim {ι κ : Type*} [Fintype ι] [Fintype κ]
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:154:theorem dimVector_prod {ι κ : Type*} [Fintype ι] [Fintype κ]
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:172:theorem finrank_tensor_blocks (a b : ℕ) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:180:theorem sum_two_sq_eq_eight : (2 : ℕ) ^ 2 + 2 ^ 2 = 8 := by norm_num
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:182:theorem ne_eight_of_sq (a b : ℕ) : (a * b) ^ 2 ≠ 8 := by
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:198:/-- Worked example (paper `ex:superselection`), witness form: `M_2 ⊕ M_2` admits no
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:201:theorem two_two_blocks_ne_tensor_block (a b : ℕ) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:218:theorem rankMatrix_colSum {ι κ : Type*} [Fintype ι] [Fintype κ] {n : ι → ℕ} {m : κ → ℕ}
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:225:theorem multiplicity_example_44 (r1 r2 : ℕ) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:233:/-- Paper Table 4.1 row 3: column sums `(1, 2)` admit `2 × 3 = 6` multiplicity matrices.
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:235:theorem multiplicity_col_sum_one (x y : ℕ) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:244:theorem multiplicity_col_sum_two (x y : ℕ) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:254:theorem multiplicity_diagonal_unique (r s : ℕ) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:262:theorem mem_sizeSemigroup_of_mem {S : Set ℕ} {x : ℕ} (hx : x ∈ S) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:266:theorem one_mem_sizeSemigroup (S : Set ℕ) : 1 ∈ sizeSemigroup S :=
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:269:theorem mul_mem_sizeSemigroup {S : Set ℕ} {x y : ℕ}
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:275:theorem closedVectors_add {S : Set ℕ} {v w : Multiset ℕ}
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:284:theorem closedVectors_pairwiseProd {S : Set ℕ} {v w : Multiset ℕ}
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:294:theorem closedVectors_singleton {S : Set ℕ} {x : ℕ} (hx : x ∈ S) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:303:theorem mem_sizeSemigroup_one_two (x : ℕ) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:320:theorem two_pow_ne_three (k : ℕ) : (2 : ℕ) ^ k ≠ 3 := by
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:334:theorem three_not_mem_sizeSemigroup_one_two :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:340:end Cmrps.Vol03
lean/Cmrps/Vol11CompletenessObstructions.lean:25:file uses `sorry` or an axiom.
lean/Cmrps/Vol11CompletenessObstructions.lean:30:namespace Cmrps.Vol11
lean/Cmrps/Vol11CompletenessObstructions.lean:46:structure Recognizer {α : Type u} (S : Setoid α) where
lean/Cmrps/Vol11CompletenessObstructions.lean:54:algebraic-family / Borel-parametrization content of the structure is carried by
lean/Cmrps/Vol11CompletenessObstructions.lean:57:structure ParameterSpace {α : Type u} {κ : Type v} (S : Setoid α) where
lean/Cmrps/Vol11CompletenessObstructions.lean:66:structure CompleteInvariant {α : Type u} (S : Setoid α) (ι : Type v) where
lean/Cmrps/Vol11CompletenessObstructions.lean:75:structure ClassificationProgram {α : Type u} (S : Setoid α) (ι : Type v)
lean/Cmrps/Vol11CompletenessObstructions.lean:95:structure FiniteVarietyParametrization {α : Type u} {κ : Type v}
lean/Cmrps/Vol11CompletenessObstructions.lean:117:theorem Regime.occupies_exactly_one {α : Type u} (reg : α → Regime) (x : α) :
lean/Cmrps/Vol11CompletenessObstructions.lean:124:def CompleteInvariant.onClasses {α : Type u} {S : Setoid α} {ι : Type v}
lean/Cmrps/Vol11CompletenessObstructions.lean:135:theorem CountableInvariantImpossibility
lean/Cmrps/Vol11CompletenessObstructions.lean:151:structure IsomorphismInjective {α : Type u} {β : Type w}
lean/Cmrps/Vol11CompletenessObstructions.lean:158:def IsomorphismInjective.classes {α : Type u} {β : Type w} {S : Setoid α}
lean/Cmrps/Vol11CompletenessObstructions.lean:165:theorem IsomorphismInjective.classes_injective
lean/Cmrps/Vol11CompletenessObstructions.lean:173:def ObstructionTransport.pullback
lean/Cmrps/Vol11CompletenessObstructions.lean:185:theorem ObstructionTransport.uncountableClasses
lean/Cmrps/Vol11CompletenessObstructions.lean:194:theorem ObstructionTransport.noCountableInvariant
lean/Cmrps/Vol11CompletenessObstructions.lean:205:def DecidableProblem {κ : Type u} (Q : κ → Prop) : Prop :=
lean/Cmrps/Vol11CompletenessObstructions.lean:210:is itself undecidable. `hmarkov` is the Adyan-Rabin theorem taken as hypothesis
lean/Cmrps/Vol11CompletenessObstructions.lean:216:theorem UndecidabilityTransport
lean/Cmrps/Vol11CompletenessObstructions.lean:232:/-- Paper, Proposition 5.6: a CFSG-style decomposition of a class set into
lean/Cmrps/Vol11CompletenessObstructions.lean:234:structure SporadicDecomposition (κ : Type u) where
lean/Cmrps/Vol11CompletenessObstructions.lean:241:  /-- Every class is in a family or is one of the listed sporadic objects. -/
lean/Cmrps/Vol11CompletenessObstructions.lean:245:which no infinite family reaches and which admits no finite listing cannot be
lean/Cmrps/Vol11CompletenessObstructions.lean:250:theorem FiniteSporadicFails {κ : Type u} (d : SporadicDecomposition κ)
lean/Cmrps/Vol11CompletenessObstructions.lean:268:theorem TwoRegimeFails (f : Regime → Bool) : ¬ Function.Injective f := by
lean/Cmrps/Vol11CompletenessObstructions.lean:281:def Coarsens {α : Type u} (r s : α → α → Prop) : Prop :=
lean/Cmrps/Vol11CompletenessObstructions.lean:290:theorem IsocategoricalEquivalenceFails
lean/Cmrps/Vol11CompletenessObstructions.lean:337:def RegimeAssignment : SurveyedDomain → Regime
lean/Cmrps/Vol11CompletenessObstructions.lean:370:theorem RegimeAssignment.total (d : SurveyedDomain) :
lean/Cmrps/Vol11CompletenessObstructions.lean:376:theorem RegimeAssignment.unique (d : SurveyedDomain) :
lean/Cmrps/Vol11CompletenessObstructions.lean:382:theorem RegimeAssignment.every_regime_used (ρ : Regime) :
lean/Cmrps/Vol11CompletenessObstructions.lean:393:end Cmrps.Vol11
lean/Cmrps/Vol08SpacetimeReconstruction.lean:49:  the geometrization theorem itself is a cited literature result and is not
lean/Cmrps/Vol08SpacetimeReconstruction.lean:52:The deep cited theorems (Lorentzian holonomy classification, causal ladder
lean/Cmrps/Vol08SpacetimeReconstruction.lean:60:namespace Cmrps.Vol08
lean/Cmrps/Vol08SpacetimeReconstruction.lean:68:def Past {α : Type*} (r : α → α → Prop) (x : α) : Set α := {y | r y x}
lean/Cmrps/Vol08SpacetimeReconstruction.lean:72:def Future {α : Type*} (r : α → α → Prop) (x : α) : Set α := {y | r x y}
lean/Cmrps/Vol08SpacetimeReconstruction.lean:76:def IsDistinguishing {α : Type*} (r : α → α → Prop) : Prop :=
lean/Cmrps/Vol08SpacetimeReconstruction.lean:85:theorem no_increasing_loop {X : Type*} [Preorder X] (n : ℕ) (g : ℕ → X)
lean/Cmrps/Vol08SpacetimeReconstruction.lean:103:theorem interval_finite {X : Type*} [Preorder X] [Finite X] (x y : X) :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:108:theorem interval_compact {X : Type*} [Preorder X] [Finite X] [TopologicalSpace X]
lean/Cmrps/Vol08SpacetimeReconstruction.lean:116:theorem antichain_fails_distinguishing :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:126:theorem ladder_nontransfer_finite_orders :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:138:def Ssa {ι : Type*} (S : Set ι → ℝ) : Prop :=
lean/Cmrps/Vol08SpacetimeReconstruction.lean:142:def Subadditive {ι : Type*} (S : Set ι → ℝ) : Prop :=
lean/Cmrps/Vol08SpacetimeReconstruction.lean:146:def ArakiLieb {ι : Type*} (S : Set ι → ℝ) : Prop :=
lean/Cmrps/Vol08SpacetimeReconstruction.lean:152:def Mmi {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) : Prop :=
lean/Cmrps/Vol08SpacetimeReconstruction.lean:156:def MutualInfo {ι : Type*} (S : Set ι → ℝ) (A B : Set ι) : ℝ :=
lean/Cmrps/Vol08SpacetimeReconstruction.lean:160:def CondMutualInfo {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) : ℝ :=
lean/Cmrps/Vol08SpacetimeReconstruction.lean:164:def TripartiteInfo {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) : ℝ :=
lean/Cmrps/Vol08SpacetimeReconstruction.lean:173:noncomputable def correlatedTripleWitness (u : Set (Fin 3)) : ℝ :=
lean/Cmrps/Vol08SpacetimeReconstruction.lean:176:theorem correlatedTripleWitness_empty :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:180:theorem correlatedTripleWitness_eq_one {u : Set (Fin 3)} (hu : u ≠ ∅) :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:184:theorem correlatedTripleWitness_nonneg (u : Set (Fin 3)) :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:190:theorem correlatedTripleWitness_le_one (u : Set (Fin 3)) :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:198:theorem correlatedTripleWitness_ssa : Ssa (correlatedTripleWitness : Set (Fin 3) → ℝ) := by
lean/Cmrps/Vol08SpacetimeReconstruction.lean:219:theorem correlatedTripleWitness_mmi_fails :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:241:theorem correlatedTripleWitness_mmi_margin :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:268:theorem mmi_independent_of_ssa :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:278:theorem correlatedTripleWitness_clean :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:324:theorem mmi_iff_information_form {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:331:theorem mmi_iff_tripartite_nonpos {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:339:theorem cmi_factorization {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:351:theorem ssa_of_subadditive_and_mmi {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι)
lean/Cmrps/Vol08SpacetimeReconstruction.lean:364:def upSetTopology (α : Type*) [Preorder α] : TopologicalSpace α :=
lean/Cmrps/Vol08SpacetimeReconstruction.lean:367:theorem isUpperSet_of_isOpen {α : Type*} [Preorder α] {s : Set α}
lean/Cmrps/Vol08SpacetimeReconstruction.lean:376:theorem isOpen_iff_isUpperSet {α : Type*} [Preorder α] {s : Set α} :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:380:theorem isClosed_iff_isLowerSet {α : Type*} [Preorder α] {s : Set α} :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:391:theorem exists_upperSet_separating {α : Type*} [PartialOrder α] (x y : α) (hne : x ≠ y) :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:404:theorem closure_singleton_eq_downset {α : Type*} [PartialOrder α] (x : α) :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:424:theorem le_iff_mem_closure {α : Type*} [PartialOrder α] (x y : α) :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:432:theorem upSetTopology_t0Space {α : Type*} [PartialOrder α] :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:447:theorem specialization_order_recovery {α : Type*} [PartialOrder α] :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:470:decomposition theorem itself (every closed 3-manifold decomposes into pieces
lean/Cmrps/Vol08SpacetimeReconstruction.lean:473:theorem card_thurstonGeometry3 : Fintype.card ThurstonGeometry3 = 8 := by decide
lean/Cmrps/Vol08SpacetimeReconstruction.lean:475:end Cmrps.Vol08
lean/Cmrps/Vol07GaugeQft.lean:33:namespace Cmrps.Vol07
lean/Cmrps/Vol07GaugeQft.lean:39:def DominantIntegralWeight (r : ℕ) : Type :=
lean/Cmrps/Vol07GaugeQft.lean:44:def highestWeightRankOne : DominantIntegralWeight 1 ≃ ℕ where
lean/Cmrps/Vol07GaugeQft.lean:59:structure FrobeniusAlgebra (k A ι : Type*) [CommRing k] [CommRing A] [Algebra k A]
lean/Cmrps/Vol07GaugeQft.lean:70:namespace FrobeniusAlgebra
lean/Cmrps/Vol07GaugeQft.lean:75:theorem pairing_comm (F : FrobeniusAlgebra k A ι) (a b : A) :
lean/Cmrps/Vol07GaugeQft.lean:81:theorem nondegenerate_left (F : FrobeniusAlgebra k A ι) (a : A)
lean/Cmrps/Vol07GaugeQft.lean:91:theorem nondegenerate_right (F : FrobeniusAlgebra k A ι) (a : A)
lean/Cmrps/Vol07GaugeQft.lean:98:theorem exists_pairing_ne_zero (F : FrobeniusAlgebra k A ι) {a : A} (ha : a ≠ 0) :
lean/Cmrps/Vol07GaugeQft.lean:104:def euler (F : FrobeniusAlgebra k A ι) : A :=
lean/Cmrps/Vol07GaugeQft.lean:108:def genusOne (F : FrobeniusAlgebra k A ι) : k :=
lean/Cmrps/Vol07GaugeQft.lean:112:theorem genusOne_eq (F : FrobeniusAlgebra k A ι) :
lean/Cmrps/Vol07GaugeQft.lean:116:end FrobeniusAlgebra
lean/Cmrps/Vol07GaugeQft.lean:122:def gaugeAction {X H V : Type*} [Monoid H] [MulAction H V] (g : X → H) (A : X → V) :
lean/Cmrps/Vol07GaugeQft.lean:126:theorem gaugeAction_one {X H V : Type*} [Monoid H] [MulAction H V] (A : X → V) :
lean/Cmrps/Vol07GaugeQft.lean:131:theorem gaugeAction_mul {X H V : Type*} [Monoid H] [MulAction H V] (g₁ g₂ : X → H)
lean/Cmrps/Vol07GaugeQft.lean:139:def GaugeEquiv {X H V : Type*} [Monoid H] [MulAction H V] (g : X → H) (A B : X → V) :
lean/Cmrps/Vol07GaugeQft.lean:143:theorem gaugeEquiv_refl {X H V : Type*} [Monoid H] [MulAction H V] (A : X → V) :
lean/Cmrps/Vol07GaugeQft.lean:147:theorem gaugeEquiv_trans {X H V : Type*} [Monoid H] [MulAction H V] {g₁ g₂ : X → H}
lean/Cmrps/Vol07GaugeQft.lean:153:theorem gaugeEquiv_symm {X H V : Type*} [Group H] [MulAction H V] {g : X → H}
lean/Cmrps/Vol07GaugeQft.lean:166:structure AnomalyData (R A : Type*) [AddCommGroup R] [AddCommGroup A] where
lean/Cmrps/Vol07GaugeQft.lean:170:namespace AnomalyData
lean/Cmrps/Vol07GaugeQft.lean:176:def AnomalyFree (d : AnomalyData R A) (x : R) : Prop :=
lean/Cmrps/Vol07GaugeQft.lean:181:theorem anomaly_free_iff_mem_ker (d : AnomalyData R A) (x : R) :
lean/Cmrps/Vol07GaugeQft.lean:185:theorem anomaly_free_zero (d : AnomalyData R A) : d.AnomalyFree 0 := by
lean/Cmrps/Vol07GaugeQft.lean:188:theorem anomaly_free_add (d : AnomalyData R A) {x y : R} (hx : d.AnomalyFree x)
lean/Cmrps/Vol07GaugeQft.lean:194:theorem anomaly_free_neg (d : AnomalyData R A) {x : R} (hx : d.AnomalyFree x) :
lean/Cmrps/Vol07GaugeQft.lean:201:def AnomalyFreeList (d : AnomalyData R A) (l : List R) : Prop :=
lean/Cmrps/Vol07GaugeQft.lean:204:theorem map_list_sum (d : AnomalyData R A) (l : List R) :
lean/Cmrps/Vol07GaugeQft.lean:210:theorem anomaly_free_list_iff_sum_map (d : AnomalyData R A) (l : List R) :
lean/Cmrps/Vol07GaugeQft.lean:216:theorem anomaly_free_list_iff_mem_ker (d : AnomalyData R A) (l : List R) :
lean/Cmrps/Vol07GaugeQft.lean:220:theorem anomaly_free_list_nil (d : AnomalyData R A) : d.AnomalyFreeList [] := by
lean/Cmrps/Vol07GaugeQft.lean:224:theorem anomaly_free_list_append (d : AnomalyData R A) (l₁ l₂ : List R) :
lean/Cmrps/Vol07GaugeQft.lean:228:end AnomalyData
lean/Cmrps/Vol07GaugeQft.lean:234:and the local BRST anomaly class in `H^{1,n}(s | d)`. -/
lean/Cmrps/Vol07GaugeQft.lean:235:structure AnomalyObstruction (A : Type*) [Zero A] where
lean/Cmrps/Vol07GaugeQft.lean:243:def QuantizationGate {A : Type*} [Zero A] (o : AnomalyObstruction A) : Prop :=
lean/Cmrps/Vol07GaugeQft.lean:246:theorem quantization_gate_iff {A : Type*} [Zero A] (o : AnomalyObstruction A) :
lean/Cmrps/Vol07GaugeQft.lean:250:theorem not_quantization_gate_of_ne_zero {A : Type*} [Zero A] (o : AnomalyObstruction A)
lean/Cmrps/Vol07GaugeQft.lean:253:theorem not_quantization_gate_of_not_trivial {A : Type*} [Zero A] (o : AnomalyObstruction A)
lean/Cmrps/Vol07GaugeQft.lean:257:theorem quantization_gate_iff_anomalyFree {R A : Type*} [AddCommGroup R] [AddCommGroup A]
lean/Cmrps/Vol07GaugeQft.lean:262:/-! ## Global forms and the second Stiefel-Whitney class (`ex:global-form`) -/
lean/Cmrps/Vol07GaugeQft.lean:267:structure GlobalFormInvariant (B : Type*) where
lean/Cmrps/Vol07GaugeQft.lean:268:  /-- Second Stiefel-Whitney class as a `ℤ/2`-valued invariant. -/
lean/Cmrps/Vol07GaugeQft.lean:274:  /-- Some class has nonvanishing `w2`, so `w2` detects nontriviality. -/
lean/Cmrps/Vol07GaugeQft.lean:280:/-- Second Stiefel-Whitney class in the model. -/
lean/Cmrps/Vol07GaugeQft.lean:281:def w2 : SO3BundleClass → ZMod 2 := id
lean/Cmrps/Vol07GaugeQft.lean:284:def so3_w2_detection : GlobalFormInvariant SO3BundleClass where
lean/Cmrps/Vol07GaugeQft.lean:290:theorem so3_two_classes : Fintype.card SO3BundleClass = 2 :=
lean/Cmrps/Vol07GaugeQft.lean:293:/-- Nonvanishing `w2` certifies that the class is not the trivial one. -/
lean/Cmrps/Vol07GaugeQft.lean:294:theorem w2_detects_nontrivial {B : Type*} (F : GlobalFormInvariant B) {b : B}
lean/Cmrps/Vol07GaugeQft.lean:301:single (trivial) isomorphism class of principal `SU(2)`-bundles over `S²`. -/
lean/Cmrps/Vol07GaugeQft.lean:302:def SU2BundleClass : Type := PUnit
lean/Cmrps/Vol07GaugeQft.lean:304:theorem su2_bundles_over_s2_trivial (b : SU2BundleClass) : b = ⟨⟩ := by
lean/Cmrps/Vol07GaugeQft.lean:308:end Cmrps.Vol07
lean/Cmrps/Vol01Foundations.lean:29:namespace Cmrps.Vol01
lean/Cmrps/Vol01Foundations.lean:37:structure FinRec where
lean/Cmrps/Vol01Foundations.lean:51:def IsCoarseGraining {X Y : Type} (g : X → Y) : Prop := Function.Surjective g
lean/Cmrps/Vol01Foundations.lean:56:def IsEmbedding {X Y : Type} (e : X → Y) : Prop := Function.Injective e
lean/Cmrps/Vol01Foundations.lean:60:def IsEquivalenceMorphism {X Y : Type} (g : X → Y) : Prop := Function.Bijective g
lean/Cmrps/Vol01Foundations.lean:65:def IsDuality {X Y : Type} (g : X → Y) : Prop := Function.Bijective g
lean/Cmrps/Vol01Foundations.lean:70:def IsLimitingProcedure {X Y : Type} (_g : X → Y) : Prop := False
lean/Cmrps/Vol01Foundations.lean:76:def embeddingMap : Fin 2 → Fin 4 := fun i => if i = 0 then 0 else 2
lean/Cmrps/Vol01Foundations.lean:80:def coarseMap : Fin 4 → Fin 2 := fun i => if i = 0 ∨ i = 2 then 0 else 1
lean/Cmrps/Vol01Foundations.lean:86:theorem compositionNotTyped :
lean/Cmrps/Vol01Foundations.lean:127:theorem coarseGraining_selfComposition {X Y Z : Type} {g : Y → Z} {f : X → Y}
lean/Cmrps/Vol01Foundations.lean:132:theorem embedding_selfComposition {X Y Z : Type} {g : Y → Z} {f : X → Y}
lean/Cmrps/Vol01Foundations.lean:138:theorem equivalenceMorphism_selfComposition {X Y Z : Type} {g : Y → Z} {f : X → Y}
lean/Cmrps/Vol01Foundations.lean:144:theorem identity_of_kind {X : Type} :
lean/Cmrps/Vol01Foundations.lean:152:self-composition and containing the identities, carry exactly the structure of
lean/Cmrps/Vol01Foundations.lean:155:structure CategoryData (Obj : Type u) (Hom : Obj → Obj → Type v) where
lean/Cmrps/Vol01Foundations.lean:169:def CoarseHom (P Q : FinRec) : Type := {f : P.X → Q.X // IsCoarseGraining f}
lean/Cmrps/Vol01Foundations.lean:172:def EmbeddingHom (P Q : FinRec) : Type := {f : P.X → Q.X // IsEmbedding f}
lean/Cmrps/Vol01Foundations.lean:175:def EquivalenceHom (P Q : FinRec) : Type := {f : P.X → Q.X // IsEquivalenceMorphism f}
lean/Cmrps/Vol01Foundations.lean:179:def coarseGraining_kindCategory : CategoryData FinRec CoarseHom where
lean/Cmrps/Vol01Foundations.lean:188:def embedding_kindCategory : CategoryData FinRec EmbeddingHom where
lean/Cmrps/Vol01Foundations.lean:197:def equivalenceMorphism_kindCategory : CategoryData FinRec EquivalenceHom where
lean/Cmrps/Vol01Foundations.lean:209:def ObservableClosure {X : Type} (O : Set (X → ℝ)) : Prop :=
lean/Cmrps/Vol01Foundations.lean:213:def delta {X : Type} [DecidableEq X] (x : X) : X → ℝ := fun y => if y = x then 1 else 0
lean/Cmrps/Vol01Foundations.lean:217:in force, and fails on the admitted record `X = Fin 2`, `O = {δ₀, δ₁}` of point
lean/Cmrps/Vol01Foundations.lean:219:theorem conditional_statements :
lean/Cmrps/Vol01Foundations.lean:245:def IsIrreducibleDisjointUnion (X : Type) [Fintype X] : Prop :=
lean/Cmrps/Vol01Foundations.lean:250:theorem irreducible_iff_no_sum_split {X : Type} [Fintype X] :
lean/Cmrps/Vol01Foundations.lean:278:theorem irreducible_iff_card_eq_one {X : Type} [Fintype X] :
lean/Cmrps/Vol01Foundations.lean:294:theorem iso_iff_card_eq {X Y : Type} [Fintype X] [Fintype Y] :
lean/Cmrps/Vol01Foundations.lean:301:theorem onePoint_decomposition_unique
lean/Cmrps/Vol01Foundations.lean:315:theorem onePoint_factors_iso {n : ℕ} {P : Fin n → Type} [∀ i, Fintype (P i)]
lean/Cmrps/Vol01Foundations.lean:322:theorem card_classifies_quotient :
lean/Cmrps/Vol01Foundations.lean:336:def Step {X : Type} (f : X → X) (x y : X) : Prop := f x = y ∨ f y = x
lean/Cmrps/Vol01Foundations.lean:341:def WeaklyConnected {X : Type} (f : X → X) : Prop :=
lean/Cmrps/Vol01Foundations.lean:347:def IsIrreducibleDyn {X : Type} (f : X → X) : Prop :=
lean/Cmrps/Vol01Foundations.lean:352:theorem step_symm {X : Type} {f : X → X} {a b : X} (h : Step f a b) : Step f b a := by
lean/Cmrps/Vol01Foundations.lean:359:theorem reachable_symm {X : Type} {f : X → X} {a b : X}
lean/Cmrps/Vol01Foundations.lean:367:theorem reachable_pre {X : Type} {f : X → X} {x₀ x : X}
lean/Cmrps/Vol01Foundations.lean:375:theorem irreducible_iff_connected {X : Type} [Fintype X] (f : X → X) :
lean/Cmrps/Vol01Foundations.lean:435:def reachableClass {X : Type} (f : X → X) (x : X) : Set X :=
lean/Cmrps/Vol01Foundations.lean:440:structure DynDecomposition {X : Type} (f : X → X) where
lean/Cmrps/Vol01Foundations.lean:455:theorem reachableClass_eq_of_reach {X : Type} {f : X → X} {x y : X}
lean/Cmrps/Vol01Foundations.lean:464:/-- Every part of a decomposition is exactly the reachability class of any of
lean/Cmrps/Vol01Foundations.lean:466:theorem class_eq_of_mem {X : Type} {f : X → X} {D : DynDecomposition f}
lean/Cmrps/Vol01Foundations.lean:504:theorem components_unique {X : Type} {f : X → X}
lean/Cmrps/Vol01Foundations.lean:529:theorem components_exist {X : Type} [Fintype X] (f : X → X) :
lean/Cmrps/Vol01Foundations.lean:576:def IsIrreducibleProduct (X : Type) [Fintype X] : Prop :=
lean/Cmrps/Vol01Foundations.lean:582:theorem irreducibleProduct_iff_prime_card {X : Type} [Fintype X] :
lean/Cmrps/Vol01Foundations.lean:615:theorem prime_factorization {X : Type} [Fintype X] (h : Fintype.card X ≠ 0) :
lean/Cmrps/Vol01Foundations.lean:621:to order, by the fundamental theorem of arithmetic. -/
lean/Cmrps/Vol01Foundations.lean:622:theorem prime_factorization_unique {n : ℕ} {l : List ℕ}
lean/Cmrps/Vol01Foundations.lean:636:noncomputable def reducedDiag (M : CoeffMat) : Fin 2 → ℝ := fun i => ∑ j, ‖M i j‖ ^ 2
lean/Cmrps/Vol01Foundations.lean:640:noncomputable def reducedOffDiag (M : CoeffMat) : ℂ := ∑ j, M 0 j * star (M 1 j)
lean/Cmrps/Vol01Foundations.lean:643:def IsUnitState (M : CoeffMat) : Prop := (∑ i, ∑ j, ‖M i j‖ ^ 2) = 1
lean/Cmrps/Vol01Foundations.lean:650:noncomputable def entanglementEntropy (M : CoeffMat) : ℝ :=
lean/Cmrps/Vol01Foundations.lean:659:noncomputable def changeFactorization (M : CoeffMat) : CoeffMat := fun i j =>
lean/Cmrps/Vol01Foundations.lean:667:def psiFirst : CoeffMat := fun i j => if i = 0 ∧ j = 0 then 1 else 0
lean/Cmrps/Vol01Foundations.lean:671:noncomputable def psiSecond : CoeffMat := fun i j =>
lean/Cmrps/Vol01Foundations.lean:674:private theorem sq_sqrt_two : ((Real.sqrt 2 : ℝ) : ℂ) * ((Real.sqrt 2 : ℝ) : ℂ) = 2 := by
lean/Cmrps/Vol01Foundations.lean:678:private theorem norm_psiSecond (i j : Fin 2) :
lean/Cmrps/Vol01Foundations.lean:695:private theorem hadamard_involutive (a b : ℂ) :
lean/Cmrps/Vol01Foundations.lean:706:theorem changeFactorization_involutive (M : CoeffMat) :
lean/Cmrps/Vol01Foundations.lean:721:theorem changeFactorization_psi : changeFactorization psiFirst = psiSecond := by
lean/Cmrps/Vol01Foundations.lean:726:theorem reducedDiag_first :
lean/Cmrps/Vol01Foundations.lean:750:theorem reducedDiag_second :
lean/Cmrps/Vol01Foundations.lean:763:theorem isUnitState_psi : IsUnitState psiFirst ∧ IsUnitState psiSecond := by
lean/Cmrps/Vol01Foundations.lean:793:theorem factorization_nonunique :
lean/Cmrps/Vol01Foundations.lean:808:end Cmrps.Vol01
lean/Cmrps/Vol10ObservationalEquivalence.lean:11:Policy of this module: definitions are stated directly; survey theorems whose content is
lean/Cmrps/Vol10ObservationalEquivalence.lean:14:statement definitions left unproved. Nothing in this file uses `sorry` or new axioms.
lean/Cmrps/Vol10ObservationalEquivalence.lean:17:namespace Cmrps.Vol10
lean/Cmrps/Vol10ObservationalEquivalence.lean:24:structure SystemRecord where
lean/Cmrps/Vol10ObservationalEquivalence.lean:40:def AdmissibleCandidate {S : Type*} (mathIso : S → S → Prop)
lean/Cmrps/Vol10ObservationalEquivalence.lean:60:/-- The layers of structure an identification may preserve (Definition 2.6, Table 3). -/
lean/Cmrps/Vol10ObservationalEquivalence.lean:75:structure EquivalenceWitness where
lean/Cmrps/Vol10ObservationalEquivalence.lean:80:  /-- The layers of structure the identification preserves. -/
lean/Cmrps/Vol10ObservationalEquivalence.lean:84:def DeclaresSymmetric (w : EquivalenceWitness) : Prop :=
lean/Cmrps/Vol10ObservationalEquivalence.lean:92:structure ObservationFunctor (S R : Type*) where
lean/Cmrps/Vol10ObservationalEquivalence.lean:102:def obsEquiv {S R : Type*} (F : ObservationFunctor S R) (P Q : S) : Prop :=
lean/Cmrps/Vol10ObservationalEquivalence.lean:105:/-- The record isomorphism class of a record (Proposition 4.2). -/
lean/Cmrps/Vol10ObservationalEquivalence.lean:106:def recordClass {R : Type*} (rel : R → R → Prop) (h : Equivalence rel) : R → Quotient ⟨rel, h⟩ :=
lean/Cmrps/Vol10ObservationalEquivalence.lean:111:theorem obs_induced_equivalence {S R : Type*} (F : ObservationFunctor S R) :
lean/Cmrps/Vol10ObservationalEquivalence.lean:119:theorem obs_class_fibers {S R : Type*} (F : ObservationFunctor S R) (P Q : S) :
lean/Cmrps/Vol10ObservationalEquivalence.lean:130:theorem obs_quotient_factor {S T R : Type*} (F : ObservationFunctor S R)
lean/Cmrps/Vol10ObservationalEquivalence.lean:144:def ObservationFunctor.prod {S R₁ R₂ : Type*} (F₁ : ObservationFunctor S R₁)
lean/Cmrps/Vol10ObservationalEquivalence.lean:156:theorem obs_products_intersection {S R₁ R₂ : Type*} (F₁ : ObservationFunctor S R₁)
lean/Cmrps/Vol10ObservationalEquivalence.lean:165:structure Coarsening {S Rf Rc : Type*} (Ff : ObservationFunctor S Rf) (obsC : S → Rc) where
lean/Cmrps/Vol10ObservationalEquivalence.lean:174:theorem obs_coarse_graining_composition {S Rf Rc : Type*}
lean/Cmrps/Vol10ObservationalEquivalence.lean:188:structure Dist4 where
lean/Cmrps/Vol10ObservationalEquivalence.lean:196:def pDist : Dist4 := ⟨1/2, 1/4, 1/8, 1/8⟩
lean/Cmrps/Vol10ObservationalEquivalence.lean:199:def qDist : Dist4 := ⟨1/4, 1/2, 1/8, 1/8⟩
lean/Cmrps/Vol10ObservationalEquivalence.lean:202:def rDist : Dist4 := ⟨1/8, 1/8, 1/2, 1/4⟩
lean/Cmrps/Vol10ObservationalEquivalence.lean:205:def e1Push (v : Dist4) : ℚ × ℚ := (v.x1 + v.x2, v.x3 + v.x4)
lean/Cmrps/Vol10ObservationalEquivalence.lean:208:def e2Push (v : Dist4) : ℚ × ℚ := (v.x1 + v.x3, v.x2 + v.x4)
lean/Cmrps/Vol10ObservationalEquivalence.lean:211:def e3Push (v : Dist4) : ℚ × ℚ := (v.x1 + v.x4, v.x2 + v.x3)
lean/Cmrps/Vol10ObservationalEquivalence.lean:214:def SameRecord (push : Dist4 → ℚ × ℚ) (v w : Dist4) : Prop :=
lean/Cmrps/Vol10ObservationalEquivalence.lean:218:def diagJoint (v w : Dist4) : ℚ :=
lean/Cmrps/Vol10ObservationalEquivalence.lean:224:theorem obs_coarse_witness :
lean/Cmrps/Vol10ObservationalEquivalence.lean:238:def ObservationFunctor.compProd {S₁ S₂ R₁ R₂ : Type*} (F₁ : ObservationFunctor S₁ R₁)
lean/Cmrps/Vol10ObservationalEquivalence.lean:250:theorem obs_composed_product_preserved {S₁ S₂ R₁ R₂ : Type*}
lean/Cmrps/Vol10ObservationalEquivalence.lean:260:theorem obs_composed_experiments_failure :
lean/Cmrps/Vol10ObservationalEquivalence.lean:277:structure PlainTensorCounterexample (Grp : Type)
lean/Cmrps/Vol10ObservationalEquivalence.lean:289:representation categories that forgets the symmetric structure cannot recover the
lean/Cmrps/Vol10ObservationalEquivalence.lean:291:theorem eg_plain_tensor_insufficient {Grp : Type}
lean/Cmrps/Vol10ObservationalEquivalence.lean:302:theorem preserved_layer_discipline {Grp : Type}
lean/Cmrps/Vol10ObservationalEquivalence.lean:315:def fisherForm {n : ℕ} (p a : Fin n → ℚ) : ℚ :=
lean/Cmrps/Vol10ObservationalEquivalence.lean:321:def chentsov_fisher_uniqueness {n : ℕ}
lean/Cmrps/Vol10ObservationalEquivalence.lean:328:def mcTerm {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ) (A : Fin n → Fin n → ℚ)
lean/Cmrps/Vol10ObservationalEquivalence.lean:334:def mcQuadratic {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ) (A : Fin n → Fin n → ℚ) : ℚ :=
lean/Cmrps/Vol10ObservationalEquivalence.lean:338:def NormalizedAtOne (f : ℚ → ℚ) : Prop := f 1 = 1
lean/Cmrps/Vol10ObservationalEquivalence.lean:341:def SelfReciprocal (f : ℚ → ℚ) : Prop := ∀ x : ℚ, x ≠ 0 → f x = x * f x⁻¹
lean/Cmrps/Vol10ObservationalEquivalence.lean:344:def petzTranspose (f : ℚ → ℚ) (x : ℚ) : ℚ := x * f x⁻¹
lean/Cmrps/Vol10ObservationalEquivalence.lean:351:def petz_sudar_parametricity {n : ℕ}
lean/Cmrps/Vol10ObservationalEquivalence.lean:363:theorem petz_transpose_same_form {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ)
lean/Cmrps/Vol10ObservationalEquivalence.lean:379:theorem monotone_commutative_restriction {n : ℕ} (f : ℚ → ℚ) (hf1 : f 1 = 1)
lean/Cmrps/Vol10ObservationalEquivalence.lean:394:theorem commutative_restriction_is_fisher {n : ℕ} (f : ℚ → ℚ) (hf1 : f 1 = 1)
lean/Cmrps/Vol10ObservationalEquivalence.lean:403:def fRat (x : ℚ) : ℚ := 2 * x / (1 + x)
lean/Cmrps/Vol10ObservationalEquivalence.lean:406:def hRat (x : ℚ) : ℚ := (1 + x) / 2
lean/Cmrps/Vol10ObservationalEquivalence.lean:409:def rhoDiag : Fin 2 → ℚ := fun i => if i = 0 then 3/4 else 1/4
lean/Cmrps/Vol10ObservationalEquivalence.lean:412:def sigmaX : Fin 2 → Fin 2 → ℚ := fun i j => if i = j then 0 else 1
lean/Cmrps/Vol10ObservationalEquivalence.lean:417:theorem monotone_not_canonical :
lean/Cmrps/Vol10ObservationalEquivalence.lean:430:theorem monotone_ruler_dependence :
lean/Cmrps/Vol10ObservationalEquivalence.lean:435:end Cmrps.Vol10
lean/Cmrps/Vol04YonedaClassification.lean:31:namespace Cmrps.Vol04
lean/Cmrps/Vol04YonedaClassification.lean:43:def relationalProfile (P : C) : Cᵒᵖ ⥤ Type v :=
lean/Cmrps/Vol04YonedaClassification.lean:47:along a probe class realized by a functor `ι : S ⥤ C`. -/
lean/Cmrps/Vol04YonedaClassification.lean:48:def restrictedProfile {S : Type*} [Category S] (ι : S ⥤ C) (P : C) : Sᵒᵖ ⥤ Type v :=
lean/Cmrps/Vol04YonedaClassification.lean:52:def restrictedYoneda {S : Type*} [Category S] (ι : S ⥤ C) : C ⥤ (Sᵒᵖ ⥤ Type v) :=
lean/Cmrps/Vol04YonedaClassification.lean:55:theorem restrictedProfile_eq_obj {S : Type*} [Category S] (ι : S ⥤ C) (P : C) :
lean/Cmrps/Vol04YonedaClassification.lean:61:def RelationalEquivalence (P Q : C) : Prop :=
lean/Cmrps/Vol04YonedaClassification.lean:65:def RestrictedRelationalEquivalence {S : Type*} [Category S] (ι : S ⥤ C) (P Q : C) : Prop :=
lean/Cmrps/Vol04YonedaClassification.lean:68:end Profiles
lean/Cmrps/Vol04YonedaClassification.lean:78:structure Invariant (S : Type*) where
lean/Cmrps/Vol04YonedaClassification.lean:86:def Invariant.Classifies {S : Type*} (I : Invariant (C := C) S) : Prop :=
lean/Cmrps/Vol04YonedaClassification.lean:91:def FiniteVarietyType (k : Type*) [Field k] (S : Type*) : Prop :=
lean/Cmrps/Vol04YonedaClassification.lean:96:def ClassifyingInvariantOfFiniteVarietyType (k : Type*) [Field k] (S : Type*)
lean/Cmrps/Vol04YonedaClassification.lean:102:def ParametrizedByFiniteVariety (k : Type*) [Field k] : Prop :=
lean/Cmrps/Vol04YonedaClassification.lean:105:end Classification
lean/Cmrps/Vol04YonedaClassification.lean:113:/-- Paper Theorem 3.1 (Yoneda lemma): the evaluation map
lean/Cmrps/Vol04YonedaClassification.lean:115:def yoneda_nat_iso (A : C) (F : Cᵒᵖ ⥤ Type v) :
lean/Cmrps/Vol04YonedaClassification.lean:119:theorem yoneda_nat_iso_apply (A : C) (F : Cᵒᵖ ⥤ Type v) (α : relationalProfile A ⟶ F) :
lean/Cmrps/Vol04YonedaClassification.lean:124:def yoneda_fully_faithful (A B : C) :
lean/Cmrps/Vol04YonedaClassification.lean:128:theorem yoneda_fully_faithful_apply {A B : C} (φ : A ⟶ B) (R : C) (g : R ⟶ A) :
lean/Cmrps/Vol04YonedaClassification.lean:133:theorem yoneda_reflects_iso (A B : C) :
lean/Cmrps/Vol04YonedaClassification.lean:140:theorem relational_characterization (P Q : C) :
lean/Cmrps/Vol04YonedaClassification.lean:147:theorem restricted_faithful_separates {S : Type*} [Category S] {ι : S ⥤ C}
lean/Cmrps/Vol04YonedaClassification.lean:152:end YonedaCore
lean/Cmrps/Vol04YonedaClassification.lean:160:private theorem eq_of_isEmpty_hom {α β : Type w} [IsEmpty α] (f g : α ⟶ β) : f = g := by
lean/Cmrps/Vol04YonedaClassification.lean:167:private def emptyTypeIso {α β : Type w} [IsEmpty α] [IsEmpty β] : α ≅ β where
lean/Cmrps/Vol04YonedaClassification.lean:175:def gapProbe : Discrete (Fin 1) ⥤ Discrete (Fin 3) :=
lean/Cmrps/Vol04YonedaClassification.lean:179:private def gapHom0 : Type := (Discrete.mk 2 : Discrete (Fin 3)) ⟶ Discrete.mk 0
lean/Cmrps/Vol04YonedaClassification.lean:180:private def gapHom1 : Type := (Discrete.mk 2 : Discrete (Fin 3)) ⟶ Discrete.mk 1
lean/Cmrps/Vol04YonedaClassification.lean:189:non-isomorphic objects — restricting the probe class destroys separation. -/
lean/Cmrps/Vol04YonedaClassification.lean:190:theorem profile_restriction_gap :
lean/Cmrps/Vol04YonedaClassification.lean:201:end RestrictionGap
lean/Cmrps/Vol04YonedaClassification.lean:210:theorem profile_limit_preservation (P : C) :
lean/Cmrps/Vol04YonedaClassification.lean:215:noncomputable def profile_prod_iso (A B : C) [HasBinaryProduct A B] :
lean/Cmrps/Vol04YonedaClassification.lean:220:noncomputable def profile_terminal_iso [HasTerminal C] :
lean/Cmrps/Vol04YonedaClassification.lean:224:end Limits
lean/Cmrps/Vol04YonedaClassification.lean:237:def choiMatrix {n m : ℕ} (Φ : M n →ₗ[ℂ] M m) : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ :=
lean/Cmrps/Vol04YonedaClassification.lean:242:private theorem add_entry {n : ℕ} (X Y : M n) (i j : Fin n) :
lean/Cmrps/Vol04YonedaClassification.lean:246:private theorem smul_entry {n : ℕ} (c : ℂ) (X : M n) (i j : Fin n) :
lean/Cmrps/Vol04YonedaClassification.lean:251:private theorem ofChoi_add {n m : ℕ} (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ)
lean/Cmrps/Vol04YonedaClassification.lean:261:private theorem ofChoi_smul {n m : ℕ} (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ)
lean/Cmrps/Vol04YonedaClassification.lean:270:def ofChoi {n m : ℕ} (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ) : M n →ₗ[ℂ] M m where
lean/Cmrps/Vol04YonedaClassification.lean:276:theorem sum_single_smul {n : ℕ} (X : M n) :
lean/Cmrps/Vol04YonedaClassification.lean:293:theorem map_eq_sum_single {n p : ℕ} (Ψ : M n →ₗ[ℂ] M p) (Y : M n) (α β) :
lean/Cmrps/Vol04YonedaClassification.lean:299:def choi_correspondence {n m : ℕ} :
lean/Cmrps/Vol04YonedaClassification.lean:334:theorem choi_composition {n m p : ℕ} (Φ : M n →ₗ[ℂ] M m) (Ψ : M m →ₗ[ℂ] M p) :
lean/Cmrps/Vol04YonedaClassification.lean:343:def partialTrace {n m : ℕ} (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ) : M n :=
lean/Cmrps/Vol04YonedaClassification.lean:347:private theorem trace_single {n : ℕ} (i j : Fin n) :
lean/Cmrps/Vol04YonedaClassification.lean:361:theorem choi_trace_preserving {n m : ℕ} (Φ : M n →ₗ[ℂ] M m) :
lean/Cmrps/Vol04YonedaClassification.lean:405:end Choi
lean/Cmrps/Vol04YonedaClassification.lean:407:end Cmrps.Vol04
lean/Cmrps/Vol05ClassicalSystems.lean:5:Lean identifiers mirror the definition and theorem names of
lean/Cmrps/Vol05ClassicalSystems.lean:45:namespace Cmrps.Vol05
lean/Cmrps/Vol05ClassicalSystems.lean:53:def IsTangentVector {ι : Type*} [Fintype ι] (u : ι → ℝ) : Prop :=
lean/Cmrps/Vol05ClassicalSystems.lean:58:def OpenSimplex {ι : Type*} [Fintype ι] (p : ι → ℝ) : Prop :=
lean/Cmrps/Vol05ClassicalSystems.lean:63:noncomputable def fisherMetric {ι : Type*} [Fintype ι] (p u v : ι → ℝ) : ℝ :=
lean/Cmrps/Vol05ClassicalSystems.lean:66:theorem fisherMetric_comm {ι : Type*} [Fintype ι] (p u v : ι → ℝ) :
lean/Cmrps/Vol05ClassicalSystems.lean:70:theorem fisherMetric_self_nonneg {ι : Type*} [Fintype ι] (p u : ι → ℝ)
lean/Cmrps/Vol05ClassicalSystems.lean:77:theorem fisherMetric_self_eq_zero {ι : Type*} [Fintype ι] (p u : ι → ℝ)
lean/Cmrps/Vol05ClassicalSystems.lean:93:theorem openSimplex_index_nonempty {ι : Type*} [Fintype ι] {p : ι → ℝ}
lean/Cmrps/Vol05ClassicalSystems.lean:104:theorem fisherMetric_example_three :
lean/Cmrps/Vol05ClassicalSystems.lean:111:theorem fisherMetric_example_uniform :
lean/Cmrps/Vol05ClassicalSystems.lean:118:def IsColumnStochastic {m n : ℕ} (T : Matrix (Fin m) (Fin n) ℝ) : Prop :=
lean/Cmrps/Vol05ClassicalSystems.lean:123:theorem mulVec_mem_openSimplex {m n : ℕ} {T : Matrix (Fin m) (Fin n) ℝ} {p : Fin n → ℝ}
lean/Cmrps/Vol05ClassicalSystems.lean:143:structure MonotoneMetric where
lean/Cmrps/Vol05ClassicalSystems.lean:156:theorem monotoneMetric_equality_of_leftInverse (G : MonotoneMetric)
lean/Cmrps/Vol05ClassicalSystems.lean:180:theorem fisherMetric_product {n m : ℕ} {p : Fin n → ℝ} {q : Fin m → ℝ}
lean/Cmrps/Vol05ClassicalSystems.lean:223:theorem fisherMetric_gap_eq_sum_squares {m n : ℕ} (T : Matrix (Fin m) (Fin n) ℝ)
lean/Cmrps/Vol05ClassicalSystems.lean:230:  have hqdef : ∀ j, (T.mulVec p) j = ∑ i, T j i * p i :=
lean/Cmrps/Vol05ClassicalSystems.lean:232:  have hvdef : ∀ j, (T.mulVec u) j = ∑ i, T j i * u i :=
lean/Cmrps/Vol05ClassicalSystems.lean:289:/-- Fisher monotonicity (the hypothesis of Chentsov's theorem, Theorem 8.4;
lean/Cmrps/Vol05ClassicalSystems.lean:292:theorem fisherMetric_monotone {m n : ℕ} (T : Matrix (Fin m) (Fin n) ℝ)
lean/Cmrps/Vol05ClassicalSystems.lean:308:end Statistical
lean/Cmrps/Vol05ClassicalSystems.lean:316:structure SymplecticForm (V : Type*) [AddCommGroup V] [Module ℝ V] where
lean/Cmrps/Vol05ClassicalSystems.lean:325:theorem SymplecticForm.skew {V : Type*} [AddCommGroup V] [Module ℝ V]
lean/Cmrps/Vol05ClassicalSystems.lean:335:noncomputable def stdSymplecticForm (n : ℕ) : SymplecticForm ((Fin n → ℝ) × (Fin n → ℝ)) where
lean/Cmrps/Vol05ClassicalSystems.lean:384:theorem exists_symplectic_partner {V : Type*} [AddCommGroup V] [Module ℝ V]
lean/Cmrps/Vol05ClassicalSystems.lean:398:end Symplectic
lean/Cmrps/Vol05ClassicalSystems.lean:408:noncomputable def kksForm (ξ : Module.Dual ℝ L) (x y : L) : ℝ :=
lean/Cmrps/Vol05ClassicalSystems.lean:411:theorem kksForm_self (ξ : Module.Dual ℝ L) (x : L) : kksForm ξ x x = 0 := by
lean/Cmrps/Vol05ClassicalSystems.lean:414:theorem kksForm_skew (ξ : Module.Dual ℝ L) (x y : L) :
lean/Cmrps/Vol05ClassicalSystems.lean:421:def coadjointStabilizer (ξ : Module.Dual ℝ L) (x : L) : Prop :=
lean/Cmrps/Vol05ClassicalSystems.lean:427:theorem kksForm_eq_of_sub_mem_stabilizer (ξ : Module.Dual ℝ L) (x x' y : L)
lean/Cmrps/Vol05ClassicalSystems.lean:436:noncomputable def liePoissonLinear (x : L) : Module.Dual ℝ L →ₗ[ℝ] ℝ where
lean/Cmrps/Vol05ClassicalSystems.lean:443:theorem liePoissonLinear_bracket (x y : L) (ξ : Module.Dual ℝ L) :
lean/Cmrps/Vol05ClassicalSystems.lean:448:theorem liePoissonLinear_antisymm (x y : L) :
lean/Cmrps/Vol05ClassicalSystems.lean:458:theorem so3_casimir (ξ x : Fin 3 → ℝ) : ξ ⬝ᵥ crossProduct ξ x = 0 :=
lean/Cmrps/Vol05ClassicalSystems.lean:461:end LiePoisson
lean/Cmrps/Vol05ClassicalSystems.lean:470:def pendulumMonodromy : Matrix (Fin 2) (Fin 2) ℤ :=
lean/Cmrps/Vol05ClassicalSystems.lean:473:theorem pendulumMonodromy_det : pendulumMonodromy.det = 1 := by
lean/Cmrps/Vol05ClassicalSystems.lean:479:theorem pendulumMonodromy_ne_one :
lean/Cmrps/Vol05ClassicalSystems.lean:486:theorem pendulumMonodromy_unipotent :
lean/Cmrps/Vol05ClassicalSystems.lean:496:end Monodromy
lean/Cmrps/Vol05ClassicalSystems.lean:498:end Cmrps.Vol05
lean/Cmrps/Vol12PrincipiaPhysica.lean:11:Policy of this module: definitions are stated directly; survey theorems whose content is
lean/Cmrps/Vol12PrincipiaPhysica.lean:14:hypotheses. Nothing in this file uses `sorry` or new axioms.
lean/Cmrps/Vol12PrincipiaPhysica.lean:17:namespace Cmrps.Vol12
lean/Cmrps/Vol12PrincipiaPhysica.lean:23:structure PrincipiaLayers where
lean/Cmrps/Vol12PrincipiaPhysica.lean:37:def NotFactoring {M P Obs : Type} (cls : P → M) (select : P → Obs) : Prop :=
lean/Cmrps/Vol12PrincipiaPhysica.lean:43:theorem SelectionNotComputedByClassification
lean/Cmrps/Vol12PrincipiaPhysica.lean:52:/-- Definition 2.6: formulation, rigorous theorem, physical validation. -/
lean/Cmrps/Vol12PrincipiaPhysica.lean:70:def evidenceGrade : RecordType → EvidenceGrade
lean/Cmrps/Vol12PrincipiaPhysica.lean:79:def registryTypes : List RecordType :=
lean/Cmrps/Vol12PrincipiaPhysica.lean:85:theorem EvidenceGradeAssignment (r : RecordType) :
lean/Cmrps/Vol12PrincipiaPhysica.lean:91:theorem registry_no_grade3 :
lean/Cmrps/Vol12PrincipiaPhysica.lean:100:theorem registry_grades :
lean/Cmrps/Vol12PrincipiaPhysica.lean:112:structure SpineRow where
lean/Cmrps/Vol12PrincipiaPhysica.lean:119:def spineTable : List SpineRow :=
lean/Cmrps/Vol12PrincipiaPhysica.lean:151:def spineRegimes : List Regime := spineTable.map (·.regime)
lean/Cmrps/Vol12PrincipiaPhysica.lean:154:def countRegime (r : Regime) : List Regime → ℕ
lean/Cmrps/Vol12PrincipiaPhysica.lean:158:theorem spine_row_count : spineTable.length = 29 := by decide
lean/Cmrps/Vol12PrincipiaPhysica.lean:162:theorem RegimeAssignment :
lean/Cmrps/Vol12PrincipiaPhysica.lean:184:/-- A registered obstruction theorem: a named external result forbidding an objective. -/
lean/Cmrps/Vol12PrincipiaPhysica.lean:185:structure RegisteredObstruction where
lean/Cmrps/Vol12PrincipiaPhysica.lean:186:  theoremName : String
lean/Cmrps/Vol12PrincipiaPhysica.lean:191:def refutingTheorem : ObstructionObjective → RegisteredObstruction
lean/Cmrps/Vol12PrincipiaPhysica.lean:212:theorem (data-level formalization of the survey). -/
lean/Cmrps/Vol12PrincipiaPhysica.lean:213:theorem ObstructionAssembly (o : ObstructionObjective) :
lean/Cmrps/Vol12PrincipiaPhysica.lean:220:structure (hdata) but are inequivalent at the level one wants to recover (hcls), no recovery
lean/Cmrps/Vol12PrincipiaPhysica.lean:224:theorem StructurePreservation
lean/Cmrps/Vol12PrincipiaPhysica.lean:234:def f_id : ℝ → ℝ := fun x => x
lean/Cmrps/Vol12PrincipiaPhysica.lean:237:noncomputable def f_aff : ℝ → ℝ := fun x => (x + 1) / 2
lean/Cmrps/Vol12PrincipiaPhysica.lean:240:theorem MonotoneWitnessDistinct : f_id ≠ f_aff := by
lean/Cmrps/Vol12PrincipiaPhysica.lean:246:/-- Target 6, gap clause: a parameterized family with more than one element admits no
lean/Cmrps/Vol12PrincipiaPhysica.lean:247:unique choice, so a uniqueness-up-to-scalar statement cannot extend to it. -/
lean/Cmrps/Vol12PrincipiaPhysica.lean:248:theorem MonotoneMetricGap {Param : Type} (f g : Param) (hne : f ≠ g) :
lean/Cmrps/Vol12PrincipiaPhysica.lean:255:the affine function are operator monotone, the parameter class of quantum monotone metrics
lean/Cmrps/Vol12PrincipiaPhysica.lean:256:is nontrivial, and classical uniqueness does not extend to the quantum case. -/
lean/Cmrps/Vol12PrincipiaPhysica.lean:257:theorem MonotoneMetricGapQuantum
lean/Cmrps/Vol12PrincipiaPhysica.lean:267:structure ClayProblem where
lean/Cmrps/Vol12PrincipiaPhysica.lean:274:def ClaySolved (C : ClayProblem) : Prop := C.Existence ∧ C.MassGap
lean/Cmrps/Vol12PrincipiaPhysica.lean:278:theorem ExistenceMassGapSeparation (C : ClayProblem)
lean/Cmrps/Vol12PrincipiaPhysica.lean:295:def claimPositions : List LadderPosition :=
lean/Cmrps/Vol12PrincipiaPhysica.lean:298:theorem claim_positions_exact :
lean/Cmrps/Vol12PrincipiaPhysica.lean:302:theorem claim_ledger_size : claimPositions.length = 5 := by decide
lean/Cmrps/Vol12PrincipiaPhysica.lean:306:theorem claim_ledger_not_verified :
lean/Cmrps/Vol12PrincipiaPhysica.lean:320:def countNat (n : ℕ) : List ℕ → ℕ
lean/Cmrps/Vol12PrincipiaPhysica.lean:325:def SameBlocks (l₁ l₂ : List ℕ) : Prop := ∀ n, countNat n l₁ = countNat n l₂
lean/Cmrps/Vol12PrincipiaPhysica.lean:327:theorem sameBlocks_refl (l : List ℕ) : SameBlocks l l := fun _ => rfl
lean/Cmrps/Vol12PrincipiaPhysica.lean:329:theorem sameBlocks_symm {l₁ l₂ : List ℕ} (h : SameBlocks l₁ l₂) : SameBlocks l₂ l₁ :=
lean/Cmrps/Vol12PrincipiaPhysica.lean:332:theorem sameBlocks_trans {l₁ l₂ l₃ : List ℕ} (h₁ : SameBlocks l₁ l₂)
lean/Cmrps/Vol12PrincipiaPhysica.lean:339:structure InvariantRecord (S O D G R : Type) where
lean/Cmrps/Vol12PrincipiaPhysica.lean:348:structure ConstituentRecord (F Inv G : Type) where
lean/Cmrps/Vol12PrincipiaPhysica.lean:353:  /-- Gluing datum `g_P` (e.g. an extension class in `H²(Q, Z(N))`). -/
lean/Cmrps/Vol12PrincipiaPhysica.lean:364:def constructionLayer : Layer := .mathematical
lean/Cmrps/Vol12PrincipiaPhysica.lean:367:theorem ConstructionLayerSeparation :
lean/Cmrps/Vol12PrincipiaPhysica.lean:377:case record the classical inputs (structure theorem and simple-module-dimension recovery
lean/Cmrps/Vol12PrincipiaPhysica.lean:379:theorem ConditionalStructuralGeneration
lean/Cmrps/Vol12PrincipiaPhysica.lean:398:theorem GenerationVersusClassification
lean/Cmrps/Vol12PrincipiaPhysica.lean:408:isomorphism invariants (`hInv`), and the structure theorem reconstructs the algebra from
lean/Cmrps/Vol12PrincipiaPhysica.lean:411:theorem FiniteDimCStarDecomposition
lean/Cmrps/Vol12PrincipiaPhysica.lean:420:theorem ExampleBlockMultiset :
lean/Cmrps/Vol12PrincipiaPhysica.lean:429:end Cmrps.Vol12
lean/Cmrps/Vol06QuantumSystems.lean:38:namespace Cmrps.Vol06
lean/Cmrps/Vol06QuantumSystems.lean:48:def ValidDimvec (l : DimensionVector) : Prop := ∀ n ∈ l, 0 < n
lean/Cmrps/Vol06QuantumSystems.lean:52:def algebraDim (l : DimensionVector) : ℕ := (l.map fun n => n * n).sum
lean/Cmrps/Vol06QuantumSystems.lean:55:theorem algebraDim_nil : algebraDim [] = 0 := rfl
lean/Cmrps/Vol06QuantumSystems.lean:58:theorem algebraDim_cons (n : ℕ) (l : DimensionVector) :
lean/Cmrps/Vol06QuantumSystems.lean:63:def tensorDimvec (l₁ l₂ : DimensionVector) : DimensionVector :=
lean/Cmrps/Vol06QuantumSystems.lean:67:theorem sum_map_product {α β : Type*} (f : α → ℕ) (g : β → ℕ)
lean/Cmrps/Vol06QuantumSystems.lean:81:theorem algebraDim_tensor (l₁ l₂ : DimensionVector) :
lean/Cmrps/Vol06QuantumSystems.lean:95:theorem tensorDimvec_perm {l₁ l₁' l₂ l₂' : DimensionVector}
lean/Cmrps/Vol06QuantumSystems.lean:100:theorem tensorDimvec_valid {l₁ l₂ : DimensionVector}
lean/Cmrps/Vol06QuantumSystems.lean:115:theorem dimvec_classifies_sorted {l₁ l₂ : DimensionVector}
lean/Cmrps/Vol06QuantumSystems.lean:123:theorem dim4_vector_dimension_not_classifying :
lean/Cmrps/Vol06QuantumSystems.lean:137:def dimVecs : (fuel d bound : ℕ) → List (List ℕ)
lean/Cmrps/Vol06QuantumSystems.lean:148:def dimVectorsOfDim (d : ℕ) : List (List ℕ) := dimVecs (d + 1) d d
lean/Cmrps/Vol06QuantumSystems.lean:152:theorem algebraDim_eq_of_mem_dimVecs {fuel d bound : ℕ} {l : DimensionVector}
lean/Cmrps/Vol06QuantumSystems.lean:175:theorem algebraDim_eq_of_mem_dimVectorsOfDim {d : ℕ} {l : DimensionVector}
lean/Cmrps/Vol06QuantumSystems.lean:180:theorem dimVectorsOfDim_four :
lean/Cmrps/Vol06QuantumSystems.lean:184:theorem dimVectorsOfDim_eight :
lean/Cmrps/Vol06QuantumSystems.lean:188:theorem dimVectorsOfDim_twelve :
lean/Cmrps/Vol06QuantumSystems.lean:206:theorem finrank_blockAlgebra {k : ℕ} (s : Fin k → ℕ) :
lean/Cmrps/Vol06QuantumSystems.lean:214:theorem algebraDim_ofFn {k : ℕ} (s : Fin k → ℕ) :
lean/Cmrps/Vol06QuantumSystems.lean:223:theorem algebraDim_eq_finrank_ofFn {k : ℕ} (s : Fin k → ℕ) :
lean/Cmrps/Vol06QuantumSystems.lean:230:def matrixUnit {n : ℕ} (i j : Fin n) : Matrix (Fin n) (Fin n) ℂ :=
lean/Cmrps/Vol06QuantumSystems.lean:234:theorem matrixUnit_apply {n : ℕ} (i j a b : Fin n) :
lean/Cmrps/Vol06QuantumSystems.lean:240:def choi {n m : ℕ} (Φ : Matrix (Fin n) (Fin n) ℂ →ₗ[ℂ] Matrix (Fin m) (Fin m) ℂ) :
lean/Cmrps/Vol06QuantumSystems.lean:245:theorem choi_apply {n m : ℕ}
lean/Cmrps/Vol06QuantumSystems.lean:252:def partialTrace₂ {n m : ℕ}
lean/Cmrps/Vol06QuantumSystems.lean:257:theorem partialTrace₂_apply {n m : ℕ}
lean/Cmrps/Vol06QuantumSystems.lean:261:theorem trace_eq_sum_apply {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ) :
lean/Cmrps/Vol06QuantumSystems.lean:267:theorem partialTrace₂_choi_apply {n m : ℕ}
lean/Cmrps/Vol06QuantumSystems.lean:276:theorem choi_tracePreserving {n m : ℕ}
lean/Cmrps/Vol06QuantumSystems.lean:292:theorem choi_id {n : ℕ} :
lean/Cmrps/Vol06QuantumSystems.lean:298:end Cmrps.Vol06
lean/Cmrps/Vol02StructuralFamilies.lean:32:   constructibility is Chevalley's theorem and is recorded as a conjectural input)
lean/Cmrps/Vol02StructuralFamilies.lean:36:   the Wedderburn structure theorem is a literature input)
lean/Cmrps/Vol02StructuralFamilies.lean:46:namespace Cmrps.Vol02
lean/Cmrps/Vol02StructuralFamilies.lean:54:structure FamilyRecord where
lean/Cmrps/Vol02StructuralFamilies.lean:68:namespace FamilyRecord
lean/Cmrps/Vol02StructuralFamilies.lean:72:def Classifying (R : FamilyRecord) : Prop := ∀ a b : R.Obj, R.I a = R.I b → R.r a b
lean/Cmrps/Vol02StructuralFamilies.lean:75:def InvariantComplete (R : FamilyRecord) : Prop := R.Classifying
lean/Cmrps/Vol02StructuralFamilies.lean:78:def toSetoid (R : FamilyRecord) : Setoid R.Obj := ⟨R.r, R.rEquiv⟩
lean/Cmrps/Vol02StructuralFamilies.lean:81:def inducedMap (R : FamilyRecord) : Quotient R.toSetoid → R.V :=
lean/Cmrps/Vol02StructuralFamilies.lean:85:theorem inducedMap_mk (R : FamilyRecord) (a : R.Obj) :
lean/Cmrps/Vol02StructuralFamilies.lean:90:theorem sharpness_well_defined (R : FamilyRecord) {a b : R.Obj} (h : R.r a b) :
lean/Cmrps/Vol02StructuralFamilies.lean:96:theorem inducedMap_injective (R : FamilyRecord) (h : R.Classifying) :
lean/Cmrps/Vol02StructuralFamilies.lean:107:theorem classifying_iff (R : FamilyRecord) :
lean/Cmrps/Vol02StructuralFamilies.lean:116:theorem sharpness_card_bound (R : FamilyRecord) (h : R.Classifying) [Fintype R.V] {N : ℕ}
lean/Cmrps/Vol02StructuralFamilies.lean:128:finite-type morphism). Constructibility of that image is Chevalley's theorem and is not
lean/Cmrps/Vol02StructuralFamilies.lean:130:theorem sharpness_injects_into_superset (R : FamilyRecord) (h : R.Classifying)
lean/Cmrps/Vol02StructuralFamilies.lean:142:/-- Paper Theorem 3.2(4): if the class set is uncountable, no invariant-complete record
lean/Cmrps/Vol02StructuralFamilies.lean:144:theorem sharpness_uncountable (R : FamilyRecord) (h : R.Classifying)
lean/Cmrps/Vol02StructuralFamilies.lean:150:end FamilyRecord
lean/Cmrps/Vol02StructuralFamilies.lean:155:germs as the equivalence. Darboux's theorem is recorded as an input field. -/
lean/Cmrps/Vol02StructuralFamilies.lean:156:structure SymplecticGermField where
lean/Cmrps/Vol02StructuralFamilies.lean:163:  /-- Darboux's theorem (literature input): every `2n`-dimensional symplectic germ is
lean/Cmrps/Vol02StructuralFamilies.lean:168:def GermInvariant {G : SymplecticGermField} {A : Type v} (f : G.Germ → A) : Prop :=
lean/Cmrps/Vol02StructuralFamilies.lean:173:theorem globality_symplectic {G : SymplecticGermField} {A : Type v} {f : G.Germ → A}
lean/Cmrps/Vol02StructuralFamilies.lean:179:theorem globality_no_local_classifier {G : SymplecticGermField} {A : Type v}
lean/Cmrps/Vol02StructuralFamilies.lean:193:  /-- Impossible: an impossibility theorem is on record. -/
lean/Cmrps/Vol02StructuralFamilies.lean:195:  /-- No record: no classification and no impossibility theorem on record. -/
lean/Cmrps/Vol02StructuralFamilies.lean:199:(record exists, impossibility theorem exists, obstructions classified,
lean/Cmrps/Vol02StructuralFamilies.lean:201:structure Sector where
lean/Cmrps/Vol02StructuralFamilies.lean:202:  /-- A theorem on record names a classifying invariant. -/
lean/Cmrps/Vol02StructuralFamilies.lean:204:  /-- An impossibility theorem is on record. -/
lean/Cmrps/Vol02StructuralFamilies.lean:213:def kindOf : Sector → AchievementKind
lean/Cmrps/Vol02StructuralFamilies.lean:221:def KindApplies : AchievementKind → Sector → Prop
lean/Cmrps/Vol02StructuralFamilies.lean:237:theorem kindOf_applies (s : Sector) : KindApplies (kindOf s) s := by
lean/Cmrps/Vol02StructuralFamilies.lean:243:theorem kindOf_unique (s : Sector) (k : AchievementKind) (hk : KindApplies k s) :
lean/Cmrps/Vol02StructuralFamilies.lean:251:theorem achievement_kinds_exhaustive (s : Sector) :
lean/Cmrps/Vol02StructuralFamilies.lean:261:namespace DimensionVector
lean/Cmrps/Vol02StructuralFamilies.lean:264:def Pos (v : DimensionVector) : Prop := ∀ n ∈ v, 0 < n
lean/Cmrps/Vol02StructuralFamilies.lean:267:def totalDim (v : DimensionVector) : ℕ := (v.map (· ^ 2)).sum
lean/Cmrps/Vol02StructuralFamilies.lean:270:def sum (v w : DimensionVector) : DimensionVector := v + w
lean/Cmrps/Vol02StructuralFamilies.lean:275:def tensor (v w : DimensionVector) : DimensionVector :=
lean/Cmrps/Vol02StructuralFamilies.lean:278:theorem pos_sum {v w : DimensionVector} (hv : v.Pos) (hw : w.Pos) : (sum v w).Pos :=
lean/Cmrps/Vol02StructuralFamilies.lean:285:private theorem mem_product {v w : Multiset ℕ} {p : ℕ × ℕ} :
lean/Cmrps/Vol02StructuralFamilies.lean:298:theorem pos_tensor {v w : DimensionVector} (hv : v.Pos) (hw : w.Pos) :
lean/Cmrps/Vol02StructuralFamilies.lean:305:theorem totalDim_sum (v w : DimensionVector) :
lean/Cmrps/Vol02StructuralFamilies.lean:311:private lemma sum_product_map (v w : Multiset ℕ) (f g : ℕ → ℕ) :
lean/Cmrps/Vol02StructuralFamilies.lean:322:theorem totalDim_tensor (v w : DimensionVector) :
lean/Cmrps/Vol02StructuralFamilies.lean:335:private lemma sq_le_sum_map (v : Multiset ℕ) : ∀ n ∈ v, n ^ 2 ≤ (v.map (· ^ 2)).sum := by
lean/Cmrps/Vol02StructuralFamilies.lean:346:private lemma le_totalDim_of_mem {v : DimensionVector} (hp : v.Pos) {n : ℕ}
lean/Cmrps/Vol02StructuralFamilies.lean:354:private lemma card_le_totalDim : ∀ {v : DimensionVector}, v.Pos → v.card ≤ v.totalDim := by
lean/Cmrps/Vol02StructuralFamilies.lean:370:private def encode (d : ℕ) (v : DimensionVector) (hv : v.Pos ∧ v.totalDim = d) :
lean/Cmrps/Vol02StructuralFamilies.lean:379:private lemma encode_injective (d : ℕ) (v w : DimensionVector)
lean/Cmrps/Vol02StructuralFamilies.lean:411:theorem dimVector_finite (d : ℕ) :
lean/Cmrps/Vol02StructuralFamilies.lean:421:end DimensionVector
lean/Cmrps/Vol02StructuralFamilies.lean:428:namespace Kraus
lean/Cmrps/Vol02StructuralFamilies.lean:433:def φ (U : M) (X : M) : M := U * X * U ᴴ
lean/Cmrps/Vol02StructuralFamilies.lean:437:def SameChannel (Φ Ψ : M → M) : Prop := ∀ X : M, Φ X = Ψ X
lean/Cmrps/Vol02StructuralFamilies.lean:439:theorem sameChannel_iff (Φ Ψ : M → M) : SameChannel Φ Ψ ↔ Φ = Ψ :=
lean/Cmrps/Vol02StructuralFamilies.lean:443:def IsUnitary (U : M) : Prop := U * U ᴴ = 1 ∧ U ᴴ * U = 1
lean/Cmrps/Vol02StructuralFamilies.lean:446:def KrausRep (Φ : M → M) (ops : List M) : Prop :=
lean/Cmrps/Vol02StructuralFamilies.lean:450:def IsKrausRank (n : ℕ) (Φ : M → M) : Prop :=
lean/Cmrps/Vol02StructuralFamilies.lean:454:theorem kraus_rep_one (U : M) : KrausRep (φ U) [U] := by
lean/Cmrps/Vol02StructuralFamilies.lean:459:theorem not_kraus_rep_zero (U : M) (hU : IsUnitary U) : ¬ KrausRep (φ U) [] := by
lean/Cmrps/Vol02StructuralFamilies.lean:471:theorem kraus_rank_one (U : M) (hU : IsUnitary U) : IsKrausRank 1 (φ U) := by
lean/Cmrps/Vol02StructuralFamilies.lean:482:private def X : M := Matrix.of fun _ _ => (1 : ℂ)
lean/Cmrps/Vol02StructuralFamilies.lean:485:private def v : Fin 2 → ℂ := fun i => if i = 0 then 1 else -1
lean/Cmrps/Vol02StructuralFamilies.lean:487:private def P : M := Matrix.diagonal v
lean/Cmrps/Vol02StructuralFamilies.lean:489:private theorem v_apply_zero : v 0 = 1 := by simp [v]
lean/Cmrps/Vol02StructuralFamilies.lean:491:private theorem v_apply_one : v 1 = -1 := by simp [v]
lean/Cmrps/Vol02StructuralFamilies.lean:493:private theorem v_mul_star (i : Fin 2) : v i * star (v i) = 1 := by
lean/Cmrps/Vol02StructuralFamilies.lean:496:private theorem P_unitary : IsUnitary P := by
lean/Cmrps/Vol02StructuralFamilies.lean:513:private theorem one_unitary : IsUnitary (1 : M) := by
lean/Cmrps/Vol02StructuralFamilies.lean:520:private theorem phi_one : φ 1 = fun Y => Y := by
lean/Cmrps/Vol02StructuralFamilies.lean:525:private theorem phi_P_X_apply : (φ P X) 0 1 = -1 := by
lean/Cmrps/Vol02StructuralFamilies.lean:540:private theorem phi_one_X_apply : (φ 1 X) 0 1 = 1 := by
lean/Cmrps/Vol02StructuralFamilies.lean:546:theorem kraus_rank_not_injective :
lean/Cmrps/Vol02StructuralFamilies.lean:557:end Kraus
lean/Cmrps/Vol02StructuralFamilies.lean:568:def retraction (t : ℝ) (p : Q × V) : Q × V := (p.1, t • p.2)
lean/Cmrps/Vol02StructuralFamilies.lean:572:theorem retraction_one (p : Q × V) : retraction (1 : ℝ) p = p := by
lean/Cmrps/Vol02StructuralFamilies.lean:576:theorem retraction_comp (s t : ℝ) (p : Q × V) :
lean/Cmrps/Vol02StructuralFamilies.lean:581:theorem retraction_fixes_zero_section (t : ℝ) (x : Q) :
lean/Cmrps/Vol02StructuralFamilies.lean:586:theorem retraction_zero_eq (p : Q × V) : retraction (0 : ℝ) p = (p.1, (0 : V)) := by
lean/Cmrps/Vol02StructuralFamilies.lean:589:theorem retraction_zero_mem_zeroSection (p : Q × V) :
lean/Cmrps/Vol02StructuralFamilies.lean:594:theorem continuous_retraction (t : ℝ) : Continuous (retraction (t : ℝ) (Q := Q) (V := V)) := by
lean/Cmrps/Vol02StructuralFamilies.lean:599:theorem continuous_retraction₂ :
lean/Cmrps/Vol02StructuralFamilies.lean:607:theorem cotangent_retract :
lean/Cmrps/Vol02StructuralFamilies.lean:618:end Cotangent
lean/Cmrps/Vol02StructuralFamilies.lean:626:/-- A class of objects is closed under a family `K` of binary constructions when it is
lean/Cmrps/Vol02StructuralFamilies.lean:628:def ClosedUnder (K : Set (α → α → α)) (C : Set α) : Prop :=
lean/Cmrps/Vol02StructuralFamilies.lean:631:/-- Paper Section 2: `⟨E⟩_K`, the smallest class containing `E` and closed under `K`. -/
lean/Cmrps/Vol02StructuralFamilies.lean:632:def closure (K : Set (α → α → α)) (E : Set α) : Set α :=
lean/Cmrps/Vol02StructuralFamilies.lean:635:theorem mem_closure {K : Set (α → α → α)} {E : Set α} {x : α} :
lean/Cmrps/Vol02StructuralFamilies.lean:639:theorem subset_closure (K : Set (α → α → α)) (E : Set α) : E ⊆ closure K E :=
lean/Cmrps/Vol02StructuralFamilies.lean:642:theorem closedUnder_closure (K : Set (α → α → α)) (E : Set α) :
lean/Cmrps/Vol02StructuralFamilies.lean:647:theorem closure_minimal (K : Set (α → α → α)) {E C : Set α}
lean/Cmrps/Vol02StructuralFamilies.lean:653:def Irreducible (op : α → α → α) (a : α) : Prop :=
lean/Cmrps/Vol02StructuralFamilies.lean:656:/-- Paper Proposition 15.1: a nonempty class of nonzero objects each irreducible under
lean/Cmrps/Vol02StructuralFamilies.lean:660:theorem exceptional_not_closed (op : α → α → α) (K : Set (α → α → α)) (hop : op ∈ K)
lean/Cmrps/Vol02StructuralFamilies.lean:678:/-- Paper Proposition 15.1: the class still generates its closure (the conclusion is
lean/Cmrps/Vol02StructuralFamilies.lean:680:theorem closure_generation (K : Set (α → α → α)) (E : Set α) :
lean/Cmrps/Vol02StructuralFamilies.lean:685:end Closure
lean/Cmrps/Vol02StructuralFamilies.lean:689:/-- Paper Definition 2.3 / 16.1: a structural family is presented by its class of objects. -/
lean/Cmrps/Vol02StructuralFamilies.lean:690:structure StructuralFamily where
lean/Cmrps/Vol02StructuralFamilies.lean:696:def SpecialCase (F G : StructuralFamily) : Prop := Nonempty (F.Obj ↪ G.Obj)
lean/Cmrps/Vol02StructuralFamilies.lean:700:def Reconstructable (F G : StructuralFamily) : Prop := Nonempty (F.Obj ≃ G.Obj)
lean/Cmrps/Vol02StructuralFamilies.lean:704:def Independent (F G : StructuralFamily) : Prop :=
lean/Cmrps/Vol02StructuralFamilies.lean:707:/-- Paper Proposition 16.2: a family admits a classifying invariant when some map on
lean/Cmrps/Vol02StructuralFamilies.lean:710:def HasClassifyingInvariant (F : StructuralFamily.{u}) : Prop :=
lean/Cmrps/Vol02StructuralFamilies.lean:716:theorem not_independent_of_reconstructable (F G : StructuralFamily)
lean/Cmrps/Vol02StructuralFamilies.lean:720:/-- Paper Proposition 16.2: two families may each admit a classifying invariant and
lean/Cmrps/Vol02StructuralFamilies.lean:723:theorem invariants_not_independence :
lean/Cmrps/Vol02StructuralFamilies.lean:736:def subtypeEquivOfEq {γ : Type*} {s t : Set γ} (h : s = t) : ↥s ≃ ↥t where
lean/Cmrps/Vol02StructuralFamilies.lean:745:theorem comparability_of_records {Obj : Type u} {r : Obj → Obj → Prop} (hr : Equivalence r)
lean/Cmrps/Vol02StructuralFamilies.lean:796:end Comparability
lean/Cmrps/Vol02StructuralFamilies.lean:798:end Cmrps.Vol02
lean/Cmrps/Vol09GravityInformationGeometry.lean:18:Ruppeiner metric (Proposition 9.1). The survey theorems quoted from the
lean/Cmrps/Vol09GravityInformationGeometry.lean:37:namespace Cmrps.Vol09
lean/Cmrps/Vol09GravityInformationGeometry.lean:44:def IsStochastic {m n : ℕ} (φ : Fin m → Fin n → ℝ) : Prop :=
lean/Cmrps/Vol09GravityInformationGeometry.lean:49:def stochApply {m n : ℕ} (φ : Fin m → Fin n → ℝ) (v : Fin n → ℝ) : Fin m → ℝ :=
lean/Cmrps/Vol09GravityInformationGeometry.lean:54:noncomputable def fisherBilinear {n : ℕ} (p u v : Fin n → ℝ) : ℝ := ∑ i, u i * v i / p i
lean/Cmrps/Vol09GravityInformationGeometry.lean:57:noncomputable def fisherMetric {n : ℕ} (p u : Fin n → ℝ) : ℝ := ∑ i, u i ^ 2 / p i
lean/Cmrps/Vol09GravityInformationGeometry.lean:59:theorem fisherMetric_eq_bilinear {n : ℕ} (p u : Fin n → ℝ) :
lean/Cmrps/Vol09GravityInformationGeometry.lean:64:noncomputable def klDiv {n : ℕ} (q p : Fin n → ℝ) : ℝ := ∑ i, q i * Real.log (q i / p i)
lean/Cmrps/Vol09GravityInformationGeometry.lean:67:noncomputable def perturbed {n : ℕ} (p u : Fin n → ℝ) (t : ℝ) : Fin n → ℝ := fun i => p i + t * u i
lean/Cmrps/Vol09GravityInformationGeometry.lean:70:noncomputable def klRay {n : ℕ} (p u : Fin n → ℝ) (t : ℝ) : ℝ := klDiv (perturbed p u t) p
lean/Cmrps/Vol09GravityInformationGeometry.lean:74:noncomputable def klRayDeriv {n : ℕ} (p u : Fin n → ℝ) (t : ℝ) : ℝ :=
lean/Cmrps/Vol09GravityInformationGeometry.lean:80:noncomputable def petzValue {d : ℕ} (f : ℝ → ℝ) (lam : Fin d → ℝ) (X : Fin d → Fin d → ℝ) : ℝ :=
lean/Cmrps/Vol09GravityInformationGeometry.lean:84:noncomputable def fSLD (t : ℝ) : ℝ := (1 + t) / 2
lean/Cmrps/Vol09GravityInformationGeometry.lean:87:noncomputable def fWY (t : ℝ) : ℝ := (1 + Real.sqrt t) ^ 2 / 4
lean/Cmrps/Vol09GravityInformationGeometry.lean:89:theorem fSLD_one : fSLD 1 = 1 := by norm_num [fSLD]
lean/Cmrps/Vol09GravityInformationGeometry.lean:91:theorem fWY_one : fWY 1 = 1 := by
lean/Cmrps/Vol09GravityInformationGeometry.lean:97:noncomputable def idealGasEntropy (U V N cv k : ℝ) : ℝ :=
lean/Cmrps/Vol09GravityInformationGeometry.lean:102:noncomputable def ruppeinerForm (N k cv U V dU dV : ℝ) : ℝ :=
lean/Cmrps/Vol09GravityInformationGeometry.lean:106:noncomputable def euclideanForm (N k dy dz : ℝ) : ℝ := N * k * (dy ^ 2 + dz ^ 2)
lean/Cmrps/Vol09GravityInformationGeometry.lean:111:noncomputable def sldBlochForm (r₁ r₂ r₃ dr₁ dr₂ dr₃ : ℝ) : ℝ :=
lean/Cmrps/Vol09GravityInformationGeometry.lean:121:theorem fisher_monotone_under_stochastic_maps
lean/Cmrps/Vol09GravityInformationGeometry.lean:159:theorem fisher_monotone_under_stochastic_maps'
lean/Cmrps/Vol09GravityInformationGeometry.lean:169:theorem hasDerivAt_klRay {n : ℕ} (p u : Fin n → ℝ) (t : ℝ)
lean/Cmrps/Vol09GravityInformationGeometry.lean:209:theorem hasDerivAt_klRayDeriv {n : ℕ} (p u : Fin n → ℝ) (t : ℝ)
lean/Cmrps/Vol09GravityInformationGeometry.lean:254:theorem fisher_second_order_kl {n : ℕ} (p u : Fin n → ℝ)
lean/Cmrps/Vol09GravityInformationGeometry.lean:291:theorem monotone_metrics_restrict_to_fisher_on_commutative_locus
lean/Cmrps/Vol09GravityInformationGeometry.lean:309:noncomputable def lam42 : Fin 2 → ℝ := fun i => if i = 0 then 3 / 4 else 1 / 4
lean/Cmrps/Vol09GravityInformationGeometry.lean:313:noncomputable def Xtrans : Fin 2 → Fin 2 → ℝ := fun i j => if i = j then 0 else 1 / 2
lean/Cmrps/Vol09GravityInformationGeometry.lean:317:noncomputable def Yrad : Fin 2 → Fin 2 → ℝ :=
lean/Cmrps/Vol09GravityInformationGeometry.lean:320:lemma lam42_0 : lam42 0 = 3 / 4 := if_pos rfl
lean/Cmrps/Vol09GravityInformationGeometry.lean:321:lemma lam42_1 : lam42 1 = 1 / 4 := if_neg (by decide)
lean/Cmrps/Vol09GravityInformationGeometry.lean:323:lemma Xtrans_00 : Xtrans 0 0 = 0 := if_pos rfl
lean/Cmrps/Vol09GravityInformationGeometry.lean:324:lemma Xtrans_01 : Xtrans 0 1 = 1 / 2 := if_neg (by decide)
lean/Cmrps/Vol09GravityInformationGeometry.lean:325:lemma Xtrans_10 : Xtrans 1 0 = 1 / 2 := if_neg (by decide)
lean/Cmrps/Vol09GravityInformationGeometry.lean:326:lemma Xtrans_11 : Xtrans 1 1 = 0 := if_pos rfl
lean/Cmrps/Vol09GravityInformationGeometry.lean:328:lemma Yrad_00 : Yrad 0 0 = 1 / 2 := by rw [Yrad, if_pos rfl, if_pos rfl]
lean/Cmrps/Vol09GravityInformationGeometry.lean:329:lemma Yrad_01 : Yrad 0 1 = 0 := if_neg (by decide)
lean/Cmrps/Vol09GravityInformationGeometry.lean:330:lemma Yrad_10 : Yrad 1 0 = 0 := if_neg (by decide)
lean/Cmrps/Vol09GravityInformationGeometry.lean:331:lemma Yrad_11 : Yrad 1 1 = -1 / 2 := by rw [Yrad, if_pos rfl, if_neg (by decide)]
lean/Cmrps/Vol09GravityInformationGeometry.lean:333:lemma petzValue_fSLD_Xtrans : petzValue fSLD lam42 Xtrans = 1 := by
lean/Cmrps/Vol09GravityInformationGeometry.lean:339:lemma petzValue_fSLD_Yrad : petzValue fSLD lam42 Yrad = 4 / 3 := by
lean/Cmrps/Vol09GravityInformationGeometry.lean:345:lemma sqrt_three_quarter : Real.sqrt (3 / 4) = Real.sqrt 3 / 2 := by
lean/Cmrps/Vol09GravityInformationGeometry.lean:349:lemma sqrt_one_quarter : Real.sqrt (1 / 4) = 1 / 2 := by
lean/Cmrps/Vol09GravityInformationGeometry.lean:352:lemma mul_fWY {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
lean/Cmrps/Vol09GravityInformationGeometry.lean:366:lemma petzValue_fWY_Xtrans : petzValue fWY lam42 Xtrans = 4 * (2 - Real.sqrt 3) := by
lean/Cmrps/Vol09GravityInformationGeometry.lean:402:lemma petzValue_fWY_Yrad : petzValue fWY lam42 Yrad = 4 / 3 := by
lean/Cmrps/Vol09GravityInformationGeometry.lean:414:theorem quantum_monotone_metrics_not_unique :
lean/Cmrps/Vol09GravityInformationGeometry.lean:458:noncomputable def lamQubit (s : ℝ) : Fin 2 → ℝ := fun i => if i = 0 then (1 + s) / 2 else (1 - s) / 2
lean/Cmrps/Vol09GravityInformationGeometry.lean:460:lemma lamQubit_0 (s : ℝ) : lamQubit s 0 = (1 + s) / 2 := if_pos rfl
lean/Cmrps/Vol09GravityInformationGeometry.lean:461:lemma lamQubit_1 (s : ℝ) : lamQubit s 1 = (1 - s) / 2 := if_neg (by decide)
lean/Cmrps/Vol09GravityInformationGeometry.lean:465:theorem sld_qubit_transverse (s : ℝ) (hs : 0 < s) (hs' : s < 1) :
lean/Cmrps/Vol09GravityInformationGeometry.lean:479:theorem sld_qubit_radial (s : ℝ) (hs : 0 < s) (hs' : s < 1) :
lean/Cmrps/Vol09GravityInformationGeometry.lean:492:theorem sldBlochForm_transverse (s : ℝ) (hs : s ^ 2 < 1) :
lean/Cmrps/Vol09GravityInformationGeometry.lean:499:theorem sldBlochForm_radial (s : ℝ) (hs : s ^ 2 < 1) :
lean/Cmrps/Vol09GravityInformationGeometry.lean:511:theorem ideal_gas_ruppeiner_flat (N k cv U V dU dV : ℝ) (hcv : 0 ≤ cv) :
lean/Cmrps/Vol09GravityInformationGeometry.lean:516:end Cmrps.Vol09

exec
/usr/local/bin/zsh -lc 'cat lean/Cmrps.lean; nl -ba lean/Cmrps/Vol01Foundations.lean' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
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
     1	/-
     2	Vol. 1 — Foundations (papers/latex/vol-01-foundations.tex).
     3	Mechanisation targets: verification/vol-01-foundations-lean-targets.md.
     4	Namespace `Cmrps.Vol01`; identifiers mirror the paper's names where possible.
     5	-/
     6	import Mathlib
     7	
     8	/-!
     9	# Vol. 1 — Foundations
    10	
    11	Formalised targets (see `verification/vol-01-foundations-lean-targets.md`):
    12	
    13	* `vol01.morphisms.composition_not_typed`      → `compositionNotTyped`
    14	* `vol01.morphisms.self_composition`           → `coarseGraining_selfComposition`,
    15	  `embedding_selfComposition`, `equivalenceMorphism_selfComposition`
    16	* `vol01.admissibility.kind_category`          → `coarseGraining_kindCategory`,
    17	  `embedding_kindCategory`, `equivalenceMorphism_kindCategory`
    18	* `vol01.admissibility.conditional_statements` → `conditional_statements`
    19	* `vol01.finiteState.irreducible_iff_card_eq_one` → `irreducible_iff_card_eq_one`
    20	* `vol01.finiteState.classify_iff_card_eq`     → `iso_iff_card_eq`,
    21	  `onePoint_decomposition_unique`, `card_classifies_quotient`
    22	* `vol01.dynamics.irreducible_iff_connected`   → `irreducible_iff_connected`
    23	* `vol01.dynamics.connected_components_unique` → `components_unique`, `components_exist`
    24	* `vol01.product.irreducible_iff_prime_card`   → `irreducibleProduct_iff_prime_card`,
    25	  `prime_factorization`, `prime_factorization_unique`
    26	* `vol01.qubit.factorization_nonunique`        → `factorization_nonunique`
    27	-/
    28	
    29	namespace Cmrps.Vol01
    30	
    31	/-! ## Definition 3.4 — finite classical records -/
    32	
    33	/-- Definition 3.4: a finite classical record `P = (X, O, D, S, C)`. Only the
    34	state space `X` varies: the observables are the full algebra `ℝ^X`, the
    35	dynamics is the identity, the symmetry is trivial, and the composition rule is
    36	disjoint union. The record is presented by its state space. -/
    37	structure FinRec where
    38	  /-- The state space of the record. -/
    39	  X : Type
    40	  /-- The state space is finite. -/
    41	  instFintype : Fintype X
    42	
    43	attribute [instance] FinRec.instFintype
    44	
    45	/-! ## Definition 4.3 — concrete preservation laws (point-set form) -/
    46	
    47	/-- Definition 4.3(1), point-set form on finite classical records: a
    48	coarse-graining has surjective state map. The observable condition is vacuous
    49	here because the observable algebra is the full function algebra `ℝ^X`, so
    50	every target observable pulls back by precomposition. -/
    51	def IsCoarseGraining {X Y : Type} (g : X → Y) : Prop := Function.Surjective g
    52	
    53	/-- Definition 4.3(2), point-set form: an embedding has injective state map.
    54	Observable extension is vacuous for `ℝ^X`, and the identity dynamics of finite
    55	classical records restricts to the identity. -/
    56	def IsEmbedding {X Y : Type} (e : X → Y) : Prop := Function.Injective e
    57	
    58	/-- Definition 4.3(3): an equivalence morphism is a bijection of state spaces,
    59	carrying the determined components across. -/
    60	def IsEquivalenceMorphism {X Y : Type} (g : X → Y) : Prop := Function.Bijective g
    61	
    62	/-- Definition 4.3(4), point-set form: the underlying map of a duality is
    63	invertible as a correspondence between the two presentations (isomorphisms of
    64	a category and of its opposite coincide). -/
    65	def IsDuality {X Y : Type} (g : X → Y) : Prop := Function.Bijective g
    66	
    67	/-- Definition 4.3(5): a map between two fixed finite records is never a
    68	limiting procedure — the law requires the leg of a cone on a diagram with
    69	unbounded index, and excludes such fixed maps by definition. -/
    70	def IsLimitingProcedure {X Y : Type} (_g : X → Y) : Prop := False
    71	
    72	/-! ## Proposition 4.4 — composition is not typed -/
    73	
    74	/-- The embedding state map of Proposition 4.4: `Fin 2 → Fin 4`, `0 ↦ 0`,
    75	`1 ↦ 2` (the paper's `a ↦ 1`, `b ↦ 3`). -/
    76	def embeddingMap : Fin 2 → Fin 4 := fun i => if i = 0 then 0 else 2
    77	
    78	/-- The coarse-graining state map of Proposition 4.4: `Fin 4 → Fin 2`,
    79	`0 ↦ 0`, `1 ↦ 1`, `2 ↦ 0`, `3 ↦ 1` (the paper's `1,3 ↦ p`, `2,4 ↦ q`). -/
    80	def coarseMap : Fin 4 → Fin 2 := fun i => if i = 0 ∨ i = 2 then 0 else 1
    81	
    82	/-- Proposition 4.4 (target `vol01.morphisms.composition_not_typed`): there
    83	are finite classical records and morphisms — the embedding `embeddingMap`
    84	followed by the coarse-graining `coarseMap` — whose composite is the constant
    85	map `0 ↦ 0`, satisfying none of the five preservation laws of Definition 4.3. -/
    86	theorem compositionNotTyped :
    87	    IsEmbedding embeddingMap ∧ IsCoarseGraining coarseMap ∧
    88	      (¬ IsCoarseGraining (coarseMap ∘ embeddingMap)) ∧
    89	      (¬ IsEmbedding (coarseMap ∘ embeddingMap)) ∧
    90	      (¬ IsEquivalenceMorphism (coarseMap ∘ embeddingMap)) ∧
    91	      (¬ IsDuality (coarseMap ∘ embeddingMap)) ∧
    92	      (¬ IsLimitingProcedure (coarseMap ∘ embeddingMap)) := by
    93	  have hcomp : ∀ i : Fin 2, (coarseMap ∘ embeddingMap) i = 0 := by
    94	    intro i
    95	    fin_cases i <;> simp [coarseMap, embeddingMap]
    96	  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
    97	  · intro a b hab
    98	    fin_cases a <;> fin_cases b <;> simp [embeddingMap] at hab ⊢
    99	  · intro y
   100	    fin_cases y
   101	    · exact ⟨0, by simp [coarseMap]⟩
   102	    · exact ⟨1, by simp [coarseMap]⟩
   103	  · intro h
   104	    have h1 : (coarseMap ∘ embeddingMap) 1 = 0 := hcomp 1
   105	    obtain ⟨y, hy⟩ := h (1 : Fin 2)
   106	    fin_cases y <;> simp [coarseMap, embeddingMap] at hy
   107	  · intro h
   108	    have hh : (coarseMap ∘ embeddingMap) 0 = (coarseMap ∘ embeddingMap) 1 := by
   109	      rw [hcomp, hcomp]
   110	    have : (0 : Fin 2) = 1 := h hh
   111	    exact absurd this (by decide)
   112	  · intro h
   113	    have hh : (coarseMap ∘ embeddingMap) 0 = (coarseMap ∘ embeddingMap) 1 := by
   114	      rw [hcomp, hcomp]
   115	    exact absurd (h.1 hh) (by decide)
   116	  · intro h
   117	    have hh : (coarseMap ∘ embeddingMap) 0 = (coarseMap ∘ embeddingMap) 1 := by
   118	      rw [hcomp, hcomp]
   119	    exact absurd (h.1 hh) (by decide)
   120	  · exact fun h => h
   121	
   122	/-! ## Proposition 4.6 — self-composition within a kind -/
   123	
   124	/-- Proposition 4.6 (target `vol01.morphisms.self_composition`), coarse-graining
   125	kind: coarse-grainings compose to coarse-grainings and the identity is a
   126	coarse-graining, under the laws of Definition 4.3. -/
   127	theorem coarseGraining_selfComposition {X Y Z : Type} {g : Y → Z} {f : X → Y}
   128	    (hg : IsCoarseGraining g) (hf : IsCoarseGraining f) : IsCoarseGraining (g ∘ f) :=
   129	  hg.comp hf
   130	
   131	/-- Proposition 4.6, embedding kind: embeddings compose to embeddings. -/
   132	theorem embedding_selfComposition {X Y Z : Type} {g : Y → Z} {f : X → Y}
   133	    (hg : IsEmbedding g) (hf : IsEmbedding f) : IsEmbedding (g ∘ f) :=
   134	  hg.comp hf
   135	
   136	/-- Proposition 4.6, equivalence-morphism kind: equivalence morphisms compose
   137	to equivalence morphisms. -/
   138	theorem equivalenceMorphism_selfComposition {X Y Z : Type} {g : Y → Z} {f : X → Y}
   139	    (hg : IsEquivalenceMorphism g) (hf : IsEquivalenceMorphism f) :
   140	    IsEquivalenceMorphism (g ∘ f) :=
   141	  ⟨hg.1.comp hf.1, hg.2.comp hf.2⟩
   142	
   143	/-- The identity state map is a morphism of each of the three closed kinds. -/
   144	theorem identity_of_kind {X : Type} :
   145	    IsCoarseGraining (id : X → X) ∧ IsEmbedding (id : X → X) ∧
   146	      IsEquivalenceMorphism (id : X → X) :=
   147	  ⟨fun y => ⟨y, rfl⟩, fun _ _ h => h, ⟨fun _ _ h => h, fun y => ⟨y, rfl⟩⟩⟩
   148	
   149	/-! ## Proposition 6.4 — kind-relative categories -/
   150	
   151	/-- The morphisms of one kind between finite classical records, closed under
   152	self-composition and containing the identities, carry exactly the structure of
   153	a category (Proposition 6.4). This is the category content of the proposition;
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
   178	kind: finite classical records with coarse-graining morphisms form a category. -/
   179	def coarseGraining_kindCategory : CategoryData FinRec CoarseHom where
   180	  id _ := ⟨id, (identity_of_kind).1⟩
   181	  comp f g := ⟨g.1 ∘ f.1, coarseGraining_selfComposition g.2 f.2⟩
   182	  id_comp _ := Subtype.ext (Function.comp_id _)
   183	  comp_id _ := Subtype.ext (Function.id_comp _)
   184	  assoc _ _ _ := Subtype.ext (Function.comp_assoc _ _ _).symm
   185	
   186	/-- Proposition 6.4, embedding kind: finite classical records with embedding
   187	morphisms form a category. -/
   188	def embedding_kindCategory : CategoryData FinRec EmbeddingHom where
   189	  id _ := ⟨id, (identity_of_kind).2.1⟩
   190	  comp f g := ⟨g.1 ∘ f.1, embedding_selfComposition g.2 f.2⟩
   191	  id_comp _ := Subtype.ext (Function.comp_id _)
   192	  comp_id _ := Subtype.ext (Function.id_comp _)
   193	  assoc _ _ _ := Subtype.ext (Function.comp_assoc _ _ _).symm
   194	
   195	/-- Proposition 6.4, equivalence kind: finite classical records with
   196	equivalence morphisms form a category. -/
   197	def equivalenceMorphism_kindCategory : CategoryData FinRec EquivalenceHom where
   198	  id _ := ⟨id, (identity_of_kind).2.2⟩
   199	  comp f g := ⟨g.1 ∘ f.1, equivalenceMorphism_selfComposition g.2 f.2⟩
   200	  id_comp _ := Subtype.ext (Function.comp_id _)
   201	  comp_id _ := Subtype.ext (Function.id_comp _)
   202	  assoc _ _ _ := Subtype.ext (Function.comp_assoc _ _ _).symm
   203	
   204	/-! ## Proposition 6.5 — conditionality over admissible systems -/
   205	
   206	/-- Definition 6.1 (AC-2), specialised to point-set records: the observable
   207	collection `O ⊆ (X → ℝ)` is closed under the operations of its ambient algebra,
   208	in particular under addition. -/
   209	def ObservableClosure {X : Type} (O : Set (X → ℝ)) : Prop :=
   210	  ∀ f ∈ O, ∀ h ∈ O, f + h ∈ O
   211	
   212	/-- The point-mass observable `δ_x` on a decidable type. -/
   213	def delta {X : Type} [DecidableEq X] (x : X) : X → ℝ := fun y => if y = x then 1 else 0
   214	
   215	/-- Proposition 6.5 (target `vol01.admissibility.conditional_statements`): the
   216	sentence "the observable collection is closed under addition" holds with AC-2
   217	in force, and fails on the admitted record `X = Fin 2`, `O = {δ₀, δ₁}` of point
   218	masses with AC-2 dropped. -/
   219	theorem conditional_statements :
   220	    (∀ (X : Type) (O : Set (X → ℝ)), ObservableClosure O →
   221	        ∀ f ∈ O, ∀ h ∈ O, f + h ∈ O) ∧
   222	      ¬ ObservableClosure ({delta 0, delta 1} : Set (Fin 2 → ℝ)) := by
   223	  refine ⟨fun X O hO f hf h hh => hO f hf h hh, ?_⟩
   224	  intro hO
   225	  have hsum : delta (0 : Fin 2) + delta 1 = fun _ => 1 := by
   226	    funext x
   227	    fin_cases x <;> simp [delta, Pi.add_apply]
   228	  have hmem : (fun _ : Fin 2 => (1 : ℝ)) ∈ ({delta 0, delta 1} : Set (Fin 2 → ℝ)) := by
   229	    rw [← hsum]
   230	    exact hO (delta 0) (by simp) (delta 1) (by simp)
   231	  simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hmem
   232	  rcases hmem with hmem | hmem
   233	  · have hne := congrFun hmem (1 : Fin 2)
   234	    simp [delta] at hne
   235	  · have hne := congrFun hmem (0 : Fin 2)
   236	    simp [delta] at hne
   237	
   238	/-! ## Definition 3.12 and Theorem 8.1 — finite classical records -/
   239	
   240	/-- Definition 3.12 with disjoint-union composition: the neutral record is the
   241	empty record (cardinality 0), and a record is irreducible when it is not the
   242	unit and is not the disjoint union of two nonempty state spaces. Up to
   243	isomorphism only the cardinality matters, so the condition is a condition on
   244	`Fintype.card X`. -/
   245	def IsIrreducibleDisjointUnion (X : Type) [Fintype X] : Prop :=
   246	  Fintype.card X ≠ 0 ∧ ¬ ∃ n : ℕ, 0 < n ∧ n < Fintype.card X
   247	
   248	/-- Example 7.1: a record splits as the disjoint union of two nonempty records
   249	exactly when its cardinality has an intermediate factor. -/
   250	theorem irreducible_iff_no_sum_split {X : Type} [Fintype X] :
   251	    IsIrreducibleDisjointUnion X ↔
   252	      Fintype.card X ≠ 0 ∧
   253	        ¬ ∃ (X₁ X₂ : Type) (_ : Fintype X₁) (_ : Fintype X₂),
   254	          Nonempty X₁ ∧ Nonempty X₂ ∧ Nonempty (X ≃ X₁ ⊕ X₂) := by
   255	  constructor
   256	  · rintro ⟨hne, hs⟩
   257	    refine ⟨hne, ?_⟩
   258	    rintro ⟨X₁, X₂, _, _, h₁, h₂, ⟨e⟩⟩
   259	    have hc1 : 0 < Fintype.card X₁ := Fintype.card_pos_iff.mpr h₁
   260	    have hc2 : 0 < Fintype.card X₂ := Fintype.card_pos_iff.mpr h₂
   261	    exact hs ⟨Fintype.card X₁, hc1, by
   262	      rw [Fintype.card_congr e, Fintype.card_sum]
   263	      omega⟩
   264	  · rintro ⟨hne, hs⟩
   265	    refine ⟨hne, ?_⟩
   266	    rintro ⟨n, hpos, hlt⟩
   267	    refine hs ?_
   268	    refine ⟨Fin n, Fin (Fintype.card X - n), inferInstance, inferInstance,
   269	      ⟨⟨0, by omega⟩⟩, ⟨⟨0, by omega⟩⟩, ?_⟩
   270	    have hcard : Fintype.card (Fin n ⊕ Fin (Fintype.card X - n)) = Fintype.card X := by
   271	      rw [Fintype.card_sum, Fintype.card_fin, Fintype.card_fin]
   272	      omega
   273	    exact Fintype.card_eq.mp hcard.symm
   274	
   275	/-- Theorem 8.1(1) (target `vol01.finiteState.irreducible_iff_card_eq_one`): a
   276	finite classical record is irreducible under disjoint union exactly when its
   277	state space has one element. -/
   278	theorem irreducible_iff_card_eq_one {X : Type} [Fintype X] :
   279	    IsIrreducibleDisjointUnion X ↔ Fintype.card X = 1 := by
   280	  constructor
   281	  · rintro ⟨hne, hs⟩
   282	    have hnot : ¬ (2 ≤ Fintype.card X) := by
   283	      intro h2
   284	      exact hs ⟨1, by omega, by omega⟩
   285	    omega
   286	  · intro h
   287	    refine ⟨by omega, ?_⟩
   288	    rintro ⟨n, _, hlt⟩
   289	    omega
   290	
   291	/-- Theorem 8.1(3) (target `vol01.finiteState.classify_iff_card_eq`): two
   292	finite classical records are isomorphic exactly when their state spaces have
   293	equal cardinality. -/
   294	theorem iso_iff_card_eq {X Y : Type} [Fintype X] [Fintype Y] :
   295	    Nonempty (X ≃ Y) ↔ Fintype.card X = Fintype.card Y :=
   296	  Fintype.card_eq.symm
   297	
   298	/-- Theorem 8.1(2): a decomposition of `X` into one-point records has exactly
   299	`Fintype.card X` factors, so the decomposition is unique up to order and
   300	isomorphism of factors. -/
   301	theorem onePoint_decomposition_unique
   302	    {X : Type} [Fintype X] {n : ℕ} {P : Fin n → Type} [∀ i, Fintype (P i)]
   303	    (h1 : ∀ i, Fintype.card (P i) = 1) (split : Nonempty (X ≃ Σ i, P i)) :
   304	    n = Fintype.card X := by
   305	  obtain ⟨e⟩ := split
   306	  have hcard : Fintype.card X = n := by
   307	    rw [Fintype.card_congr e, Fintype.card_sigma]
   308	    simp_rw [h1]
   309	    rw [Finset.sum_const, Finset.card_fin]
   310	    simp
   311	  exact hcard.symm
   312	
   313	/-- Theorem 8.1(2): all one-point factors of a decomposition are isomorphic to
   314	the one-point record `Fin 1`. -/
   315	theorem onePoint_factors_iso {n : ℕ} {P : Fin n → Type} [∀ i, Fintype (P i)]
   316	    (h1 : ∀ i, Fintype.card (P i) = 1) (i : Fin n) : Nonempty (P i ≃ Fin 1) :=
   317	  Fintype.card_eq.mp ((h1 i).trans (Fintype.card_fin 1).symm)
   318	
   319	/-- Theorem 8.1(4): cardinality is a complete invariant; the quotient of
   320	finite classical records by isomorphism is in bijection with the nonnegative
   321	integers, the empty record corresponding to zero. -/
   322	theorem card_classifies_quotient :
   323	    (∀ (X Y : Type) [Fintype X] [Fintype Y],
   324	        (Nonempty (X ≃ Y) ↔ Fintype.card X = Fintype.card Y)) ∧
   325	      ∀ n : ℕ, ∃ (X : Type) (_ : Fintype X), Fintype.card X = n := by
   326	  refine ⟨fun X Y _ _ => iso_iff_card_eq, ?_⟩
   327	  intro n
   328	  exact ⟨Fin n, inferInstance, Fintype.card_fin n⟩
   329	
   330	/-! ## Definition 3.5, 3.12 and Theorem 8.2 — finite dynamical records -/
   331	
   332	/-- Definition 3.5: a finite dynamical record is presented by a finite state
   333	space `X` with discrete-time dynamics given by a self-map `f : X → X`. Two
   334	states are adjacent when one is the image of the other under `f`; this is the
   335	edge relation of the functional graph. -/
   336	def Step {X : Type} (f : X → X) (x y : X) : Prop := f x = y ∨ f y = x
   337	
   338	/-- Weak connectivity of the functional graph of `f` (Theorem 8.2): the record
   339	is nonempty and any two states are joined by a finite chain of forward or
   340	backward edges. -/
   341	def WeaklyConnected {X : Type} (f : X → X) : Prop :=
   342	  Nonempty X ∧ ∀ x y : X, Relation.ReflTransGen (Step f) x y
   343	
   344	/-- Definition 3.12 on a finite dynamical record: irreducible under disjoint
   345	union with componentwise dynamics — not the unit (the empty record) and no
   346	split of `X` into two nonempty `f`-invariant parts. -/
   347	def IsIrreducibleDyn {X : Type} (f : X → X) : Prop :=
   348	  Nonempty X ∧ ¬ ∃ (s t : Set X), s.Nonempty ∧ t.Nonempty ∧ s ∩ t = ∅ ∧
   349	    s ∪ t = Set.univ ∧ (∀ x ∈ s, f x ∈ s) ∧ (∀ x ∈ t, f x ∈ t)
   350	
   351	/-- The functional graph edge relation is symmetric. -/
   352	theorem step_symm {X : Type} {f : X → X} {a b : X} (h : Step f a b) : Step f b a := by
   353	  rcases h with h | h
   354	  · exact Or.inr h
   355	  · exact Or.inl h
   356	
   357	/-- Reachability in the functional graph is symmetric, because the edge
   358	relation is. -/
   359	theorem reachable_symm {X : Type} {f : X → X} {a b : X}
   360	    (h : Relation.ReflTransGen (Step f) a b) : Relation.ReflTransGen (Step f) b a := by
   361	  induction h with
   362	  | refl => exact Relation.ReflTransGen.refl
   363	  | tail _ hstep ih => exact (Relation.ReflTransGen.single (step_symm hstep)).trans ih
   364	
   365	/-- If `x₀` reaches `f x` then it reaches `x`: the edge `x — f x` is traversed
   366	backwards. -/
   367	theorem reachable_pre {X : Type} {f : X → X} {x₀ x : X}
   368	    (h : Relation.ReflTransGen (Step f) x₀ (f x)) :
   369	    Relation.ReflTransGen (Step f) x₀ x :=
   370	  h.trans (reachable_symm (Relation.ReflTransGen.single (Or.inl rfl : Step f x (f x))))
   371	
   372	/-- Theorem 8.2(1) (target `vol01.dynamics.irreducible_iff_connected`): a
   373	finite dynamical record is irreducible under disjoint union exactly when its
   374	functional graph is weakly connected. -/
   375	theorem irreducible_iff_connected {X : Type} [Fintype X] (f : X → X) :
   376	    IsIrreducibleDyn f ↔ WeaklyConnected f := by
   377	  constructor
   378	  · rintro ⟨hne, hirr⟩
   379	    obtain ⟨x₀⟩ := hne
   380	    refine ⟨⟨x₀⟩, ?_⟩
   381	    intro y z
   382	    have hall : ∀ w : X, Relation.ReflTransGen (Step f) x₀ w := by
   383	      by_contra hn
   384	      push Not at hn
   385	      obtain ⟨w, hw⟩ := hn
   386	      set s := {u : X | Relation.ReflTransGen (Step f) x₀ u} with hsdef
   387	      have hsn : s.Nonempty := ⟨x₀, Relation.ReflTransGen.refl⟩
   388	      have htn : sᶜ.Nonempty := ⟨w, by simpa [hsdef] using hw⟩
   389	      have hs : ∀ u ∈ s, f u ∈ s := by
   390	        intro u hu
   391	        exact Relation.ReflTransGen.trans hu
   392	          (Relation.ReflTransGen.single (Or.inl rfl : Step f u (f u)))
   393	      have hsc : ∀ u ∈ sᶜ, f u ∈ sᶜ := by
   394	        intro u hu hfu
   395	        exact hu (reachable_pre hfu)
   396	      exact hirr ⟨s, sᶜ, hsn, htn, Set.inter_compl_self s,
   397	        Set.union_compl_self s, hs, hsc⟩
   398	    exact (reachable_symm (hall y)).trans (hall z)
   399	  · rintro ⟨hne, hconn⟩
   400	    refine ⟨hne, ?_⟩
   401	    rintro ⟨s, t, hsn, htn, hdisj, huniv, hs, ht⟩
   402	    obtain ⟨x, hx⟩ := hsn
   403	    obtain ⟨y, hy⟩ := htn
   404	    have htc : ∀ u ∈ sᶜ, f u ∈ sᶜ := by
   405	      intro u hu hfu
   406	      have hu' : u ∈ s ∪ t := by rw [huniv]; trivial
   407	      rcases hu' with hu' | hu'
   408	      · exact hu hu'
   409	      · have hfin : f u ∈ s ∩ t := ⟨hfu, ht u hu'⟩
   410	        rw [hdisj] at hfin
   411	        exact (Set.mem_empty_iff_false _).mp hfin
   412	    have hstep : ∀ {a b : X}, Step f a b → a ∈ s → b ∈ s := by
   413	      intro a b hab ha
   414	      rcases hab with hab | hab
   415	      · rw [← hab]; exact hs a ha
   416	      · by_contra hbs
   417	        have hbs' : b ∈ sᶜ := by simpa using hbs
   418	        have : f b ∈ sᶜ := htc b hbs'
   419	        rw [hab] at this
   420	        exact this ha
   421	    have hmem : ∀ {b : X}, Relation.ReflTransGen (Step f) x b → b ∈ s := by
   422	      intro b hb
   423	      induction hb with
   424	      | refl => exact hx
   425	      | tail _ hstep' ih => exact hstep hstep' ih
   426	    have hy' : y ∈ s := hmem (hconn x y)
   427	    have hyt : y ∈ s ∩ t := ⟨hy', hy⟩
   428	    rw [hdisj] at hyt
   429	    exact (Set.mem_empty_iff_false y).mp hyt
   430	
   431	/-! ## Theorem 8.2(2) — uniqueness of the connected-component decomposition -/
   432	
   433	/-- The connected component (reachability class) of `x` in the functional
   434	graph of `f`. -/
   435	def reachableClass {X : Type} (f : X → X) (x : X) : Set X :=
   436	  {y | Relation.ReflTransGen (Step f) x y}
   437	
   438	/-- A decomposition of a finite dynamical record (Definition 3.13): a
   439	partition of `X` into nonempty `f`-invariant weakly connected parts. -/
   440	structure DynDecomposition {X : Type} (f : X → X) where
   441	  /-- The parts of the partition. -/
   442	  parts : Finset (Set X)
   443	  /-- Every part is nonempty. -/
   444	  nonempty : ∀ s ∈ parts, s.Nonempty
   445	  /-- Every part is `f`-invariant. -/
   446	  invariant : ∀ s ∈ parts, ∀ x ∈ s, f x ∈ s
   447	  /-- Distinct parts are disjoint. -/
   448	  disjoint : ∀ s ∈ parts, ∀ t ∈ parts, s ≠ t → s ∩ t = ∅
   449	  /-- The parts cover `X`. -/
   450	  cover : ∀ x : X, ∃ s ∈ parts, x ∈ s
   451	  /-- Every part is weakly connected in the functional graph. -/
   452	  connected : ∀ s ∈ parts, ∀ x ∈ s, ∀ y ∈ s, Relation.ReflTransGen (Step f) x y
   453	
   454	/-- Reachability classes are equal or disjoint. -/
   455	theorem reachableClass_eq_of_reach {X : Type} {f : X → X} {x y : X}
   456	    (h : Relation.ReflTransGen (Step f) x y) :
   457	    reachableClass f x = reachableClass f y := by
   458	  apply Set.eq_of_subset_of_subset
   459	  · intro z hz
   460	    exact (reachable_symm h).trans hz
   461	  · intro z hz
   462	    exact h.trans hz
   463	
   464	/-- Every part of a decomposition is exactly the reachability class of any of
   465	its points. -/
   466	theorem class_eq_of_mem {X : Type} {f : X → X} {D : DynDecomposition f}
   467	    {s : Set X} {x : X} (hs : s ∈ D.parts) (hx : x ∈ s) :
   468	    s = reachableClass f x := by
   469	  apply Set.eq_of_subset_of_subset
   470	  · intro y hy
   471	    exact D.connected s hs x hx y hy
   472	  · intro y hy
   473	    have hsc : ∀ z ∈ sᶜ, f z ∈ sᶜ := by
   474	      intro z hz hfin
   475	      obtain ⟨t, ht, hzt⟩ := D.cover z
   476	      have hts : t ≠ s := by
   477	        rintro rfl
   478	        exact hz hzt
   479	      have hfin' : f z ∈ t := D.invariant t ht z hzt
   480	      have hempty : s ∩ t = ∅ := D.disjoint s hs t ht hts.symm
   481	      have hboth : f z ∈ s ∩ t := ⟨hfin, hfin'⟩
   482	      rw [hempty] at hboth
   483	      exact (Set.mem_empty_iff_false _).mp hboth
   484	    have hstep : ∀ {a b : X}, Step f a b → a ∈ s → b ∈ s := by
   485	      intro a b hab ha
   486	      rcases hab with hab | hab
   487	      · rw [← hab]; exact D.invariant s hs a ha
   488	      · by_contra hbs
   489	        have hbs' : b ∈ sᶜ := by simpa using hbs
   490	        have : f b ∈ sᶜ := hsc b hbs'
   491	        rw [hab] at this
   492	        exact this ha
   493	    have hmem : ∀ {b : X}, Relation.ReflTransGen (Step f) x b → b ∈ s := by
   494	      intro b hb
   495	      induction hb with
   496	      | refl => exact hx
   497	      | tail _ hstep' ih => exact hstep hstep' ih
   498	    exact hmem hy
   499	
   500	/-- Theorem 8.2(2) (target `vol01.dynamics.connected_components_unique`): the
   501	connected-component decomposition is unique up to order and isomorphism of
   502	factors — any two decompositions into nonempty invariant connected parts have
   503	the same parts. -/
   504	theorem components_unique {X : Type} {f : X → X}
   505	    (D₁ D₂ : DynDecomposition f) : D₁.parts = D₂.parts := by
   506	  apply Finset.ext
   507	  intro a
   508	  constructor
   509	  · intro ha
   510	    obtain ⟨x, hx⟩ := D₁.nonempty a ha
   511	    have key := class_eq_of_mem ha hx
   512	    obtain ⟨b, hb, hxb⟩ := D₂.cover x
   513	    have keyb := class_eq_of_mem hb hxb
   514	    have hab : a = b := key.trans keyb.symm
   515	    rw [hab]
   516	    exact hb
   517	  · intro ha
   518	    obtain ⟨x, hx⟩ := D₂.nonempty a ha
   519	    have key := class_eq_of_mem ha hx
   520	    obtain ⟨b, hb, hxb⟩ := D₁.cover x
   521	    have keyb := class_eq_of_mem hb hxb
   522	    have hab : a = b := key.trans keyb.symm
   523	    rw [hab]
   524	    exact hb
   525	
   526	/-- Theorem 8.2(2): the connected-component decomposition exists — the
   527	reachability classes of the functional graph partition `X` into nonempty
   528	invariant connected parts. -/
   529	theorem components_exist {X : Type} [Fintype X] (f : X → X) :
   530	    ∃ D : DynDecomposition f,
   531	      ∀ s : Set X, s ∈ D.parts ↔ ∃ x : X, s = reachableClass f x := by
   532	  classical
   533	  set S : Finset (Set X) := Finset.univ.image fun x : X => reachableClass f x
   534	  have hne : ∀ s ∈ S, s.Nonempty := by
   535	    intro s hs
   536	    obtain ⟨x, _, rfl⟩ := Finset.mem_image.mp hs
   537	    exact ⟨x, Relation.ReflTransGen.refl⟩
   538	  have hinv : ∀ s ∈ S, ∀ x ∈ s, f x ∈ s := by
   539	    intro s hs x hx
   540	    obtain ⟨x₀, _, rfl⟩ := Finset.mem_image.mp hs
   541	    exact Relation.ReflTransGen.trans hx
   542	      (Relation.ReflTransGen.single (Or.inl rfl : Step f x (f x)))
   543	  have hdisj : ∀ s ∈ S, ∀ t ∈ S, s ≠ t → s ∩ t = ∅ := by
   544	    intro s hs t ht hne'
   545	    obtain ⟨x, _, rfl⟩ := Finset.mem_image.mp hs
   546	    obtain ⟨y, _, rfl⟩ := Finset.mem_image.mp ht
   547	    apply Set.eq_empty_iff_forall_notMem.mpr
   548	    intro z hzs
   549	    obtain ⟨hzs, hzt⟩ := hzs
   550	    apply hne'
   551	    exact reachableClass_eq_of_reach (hzs.trans (reachable_symm hzt))
   552	  have hcover : ∀ x : X, ∃ s ∈ S, x ∈ s := by
   553	    intro x
   554	    exact ⟨reachableClass f x, Finset.mem_image.mpr ⟨x, Finset.mem_univ x, rfl⟩,
   555	      Relation.ReflTransGen.refl⟩
   556	  have hconn : ∀ s ∈ S, ∀ x ∈ s, ∀ y ∈ s, Relation.ReflTransGen (Step f) x y := by
   557	    intro s hs x hx y hy
   558	    obtain ⟨x₀, _, rfl⟩ := Finset.mem_image.mp hs
   559	    exact (reachable_symm hx).trans hy
   560	  have himg : ∀ s : Set X, s ∈ S ↔ ∃ x : X, s = reachableClass f x := by
   561	    intro s
   562	    constructor
   563	    · intro hs
   564	      obtain ⟨x, _, heq⟩ := Finset.mem_image.mp hs
   565	      exact ⟨x, heq.symm⟩
   566	    · rintro ⟨x, rfl⟩
   567	      exact Finset.mem_image.mpr ⟨x, Finset.mem_univ x, rfl⟩
   568	  exact ⟨⟨S, hne, hinv, hdisj, hcover, hconn⟩, himg⟩
   569	
   570	/-! ## Example 7.5 — irreducibles under product composition -/
   571	
   572	/-- Definition 3.12 with product composition (Example 7.5): the neutral record
   573	is the one-point record, the empty product, and a record is irreducible when
   574	it is not the unit and is not a product of two non-unit state spaces. Up to
   575	isomorphism only the cardinality matters. -/
   576	def IsIrreducibleProduct (X : Type) [Fintype X] : Prop :=
   577	  Fintype.card X ≠ 1 ∧ ¬ ∃ a b : ℕ, a ≠ 1 ∧ b ≠ 1 ∧ Fintype.card X = a * b
   578	
   579	/-- Example 7.5 (target `vol01.product.irreducible_iff_prime_card`): under the
   580	product rule the irreducible finite classical records are exactly those of
   581	prime cardinality. -/
   582	theorem irreducibleProduct_iff_prime_card {X : Type} [Fintype X] :
   583	    IsIrreducibleProduct X ↔ Nat.Prime (Fintype.card X) := by
   584	  constructor
   585	  · rintro ⟨hne, hs⟩
   586	    have h0 : Fintype.card X ≠ 0 := by
   587	      intro h0
   588	      exact hs ⟨0, 0, by decide, by decide, by rw [h0]⟩
   589	    have h2 : 2 ≤ Fintype.card X := by omega
   590	    refine (Nat.prime_def_lt').2 ⟨h2, ?_⟩
   591	    intro m hm2 hmlt hdvd
   592	    obtain ⟨k, hk⟩ := hdvd
   593	    have hk1 : k ≠ 1 := by
   594	      rintro rfl
   595	      rw [mul_one] at hk
   596	      omega
   597	    exact hs ⟨m, k, by omega, hk1, hk⟩
   598	  · intro hp
   599	    refine ⟨?_, ?_⟩
   600	    · intro h1
   601	      have := hp.two_le
   602	      omega
   603	    · rintro ⟨a, b, ha, hb, hab⟩
   604	      have hdvd : a ∣ Fintype.card X := ⟨b, hab⟩
   605	      rcases hp.eq_one_or_self_of_dvd a hdvd with h | h
   606	      · exact ha h
   607	      · rw [h] at hab
   608	        have h1 : (1 : ℕ) = b := Nat.mul_left_cancel
   609	          (Nat.pos_of_ne_zero hp.ne_zero) (by rw [← hab, mul_one])
   610	        exact hb h1.symm
   611	
   612	/-- Example 7.5: every nonzero-cardinality finite classical record is a
   613	product of prime-cardinality records; the factor list is the prime
   614	factorisation of the cardinality. -/
   615	theorem prime_factorization {X : Type} [Fintype X] (h : Fintype.card X ≠ 0) :
   616	    List.prod (Fintype.card X).primeFactorsList = Fintype.card X ∧
   617	      ∀ p ∈ (Fintype.card X).primeFactorsList, Nat.Prime p :=
   618	  ⟨Nat.prod_primeFactorsList h, fun _ hp => Nat.prime_of_mem_primeFactorsList hp⟩
   619	
   620	/-- Example 7.5: the decomposition into prime-cardinality records is unique up
   621	to order, by the fundamental theorem of arithmetic. -/
   622	theorem prime_factorization_unique {n : ℕ} {l : List ℕ}
   623	    (hprod : List.prod l = n) (hprime : ∀ p ∈ l, Nat.Prime p) :
   624	    List.Perm l n.primeFactorsList :=
   625	  Nat.primeFactorsList_unique hprod hprime
   626	
   627	/-! ## Proposition 7.6 — factorisation is extra data -/
   628	
   629	/-- A coefficient matrix of a pure two-qubit state (Definition 3.8): the entry
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
   656	extended by the identity on the off-diagonal ones. It is an involution, hence
   657	invertible, so it relates two legitimate factorisation structures on the same
   658	bare Hilbert space. -/
   659	noncomputable def changeFactorization (M : CoeffMat) : CoeffMat := fun i j =>
   660	  if i = j then
   661	    if i = 0 then (M 0 0 + M 1 1) / ((Real.sqrt 2 : ℝ) : ℂ)
   662	    else (M 0 0 - M 1 1) / ((Real.sqrt 2 : ℝ) : ℂ)
   663	  else M i j
   664	
   665	/-- The fixed unit vector `ψ = e₁ ⊗ e₁` of Proposition 7.6 in the coordinates
   666	of the first factorisation. -/
   667	def psiFirst : CoeffMat := fun i j => if i = 0 ∧ j = 0 then 1 else 0
   668	
   669	/-- The coordinate matrix of the same bare vector `ψ` in the second
   670	factorisation: `(e₁ ⊗ e₁ + e₂ ⊗ e₂)/√2`. -/
   671	noncomputable def psiSecond : CoeffMat := fun i j =>
   672	  if i = j then (1 : ℂ) / ((Real.sqrt 2 : ℝ) : ℂ) else 0
   673	
   674	private theorem sq_sqrt_two : ((Real.sqrt 2 : ℝ) : ℂ) * ((Real.sqrt 2 : ℝ) : ℂ) = 2 := by
   675	  rw [← Complex.ofReal_mul, Real.mul_self_sqrt (by norm_num : (0:ℝ) ≤ 2)]
   676	  norm_num
   677	
   678	private theorem norm_psiSecond (i j : Fin 2) :
   679	    ‖psiSecond i j‖ ^ 2 = if i = j then (1 / 2 : ℝ) else 0 := by
   680	  by_cases h : i = j
   681	  · subst h
   682	    have hrw : (if i = i then (1 / 2 : ℝ) else 0) = 1 / 2 := by simp
   683	    rw [hrw]
   684	    have hval : psiSecond i i = (1 : ℂ) / ((Real.sqrt 2 : ℝ) : ℂ) := by simp [psiSecond]
   685	    rw [hval]
   686	    have hnorm : ‖((1 : ℂ) / ((Real.sqrt 2 : ℝ) : ℂ))‖ = (1 / Real.sqrt 2 : ℝ) := by
   687	      rw [norm_div, Complex.norm_real, Real.norm_eq_abs,
   688	        abs_of_nonneg (Real.sqrt_nonneg 2), norm_one]
   689	    rw [hnorm]
   690	    have h2 : (Real.sqrt 2) ^ 2 = 2 := Real.sq_sqrt (by norm_num)
   691	    rw [div_pow, one_pow, h2]
   692	  · simp [psiSecond, h]
   693	
   694	/-- The Hadamard block is an involution. -/
   695	private theorem hadamard_involutive (a b : ℂ) :
   696	    ((a + b) / ((Real.sqrt 2 : ℝ) : ℂ) + (a - b) / ((Real.sqrt 2 : ℝ) : ℂ)) /
   697	        ((Real.sqrt 2 : ℝ) : ℂ) = a ∧
   698	      ((a + b) / ((Real.sqrt 2 : ℝ) : ℂ) - (a - b) / ((Real.sqrt 2 : ℝ) : ℂ)) /
   699	        ((Real.sqrt 2 : ℝ) : ℂ) = b := by
   700	  have h2 : ((Real.sqrt 2 : ℝ) : ℂ) ^ 2 = 2 := by
   701	    rw [← sq_sqrt_two]
   702	    ring
   703	  constructor <;> (field_simp [h2]; rw [h2]; ring)
   704	
   705	/-- The change of factorisation is invertible: it is an involution. -/
   706	theorem changeFactorization_involutive (M : CoeffMat) :
   707	    changeFactorization (changeFactorization M) = M := by
   708	  apply Matrix.ext
   709	  intro i j
   710	  fin_cases i <;> fin_cases j
   711	  · simp [changeFactorization]
   712	    exact (hadamard_involutive (M 0 0) (M 1 1)).1
   713	  · simp [changeFactorization]
   714	  · simp [changeFactorization]
   715	  · simp [changeFactorization]
   716	    exact (hadamard_involutive (M 0 0) (M 1 1)).2
   717	
   718	/-- The two factorisation presentations of the fixed vector `ψ` of
   719	Proposition 7.6: the first coordinates are `e₁ ⊗ e₁`, the second are
   720	`(e₁ ⊗ e₁ + e₂ ⊗ e₂)/√2`, related by the change of factorisation `W`. -/
   721	theorem changeFactorization_psi : changeFactorization psiFirst = psiSecond := by
   722	  funext i j
   723	  fin_cases i <;> fin_cases j <;> simp [changeFactorization, psiFirst, psiSecond]
   724	
   725	/-- The first presentation of `ψ` has reduced density matrix `diag(1, 0)`. -/
   726	theorem reducedDiag_first :
   727	    reducedDiag psiFirst 0 = 1 ∧ reducedDiag psiFirst 1 = 0 ∧
   728	      reducedOffDiag psiFirst = 0 := by
   729	  have hnorm : ∀ i j : Fin 2,
   730	      ‖psiFirst i j‖ ^ 2 = if i = 0 ∧ j = 0 then (1 : ℝ) else 0 := by
   731	    intro i j
   732	    by_cases h : i = 0 ∧ j = 0
   733	    · have hij : psiFirst i j = 1 := by simp [psiFirst, h]
   734	      rw [hij]
   735	      simp [h]
   736	    · have hij : psiFirst i j = 0 := by simp [psiFirst, h]
   737	      rw [hij]
   738	      simp [h]
   739	  refine ⟨?_, ?_, ?_⟩
   740	  · have h := hnorm 0 0
   741	    have h' := hnorm 0 1
   742	    simp [reducedDiag, Fin.sum_univ_two, h, h']
   743	  · have h := hnorm 1 0
   744	    have h' := hnorm 1 1
   745	    simp [reducedDiag, Fin.sum_univ_two, h, h']
   746	  · simp [reducedOffDiag, psiFirst]
   747	
   748	/-- The second presentation of `ψ` has reduced density matrix
   749	`diag(1/2, 1/2)`. -/
   750	theorem reducedDiag_second :
   751	    reducedDiag psiSecond 0 = 1 / 2 ∧ reducedDiag psiSecond 1 = 1 / 2 ∧
   752	      reducedOffDiag psiSecond = 0 := by
   753	  refine ⟨?_, ?_, ?_⟩
   754	  · have h := norm_psiSecond 0 0
   755	    have h' := norm_psiSecond 0 1
   756	    simp [reducedDiag, Fin.sum_univ_two, h, h']
   757	  · have h := norm_psiSecond 1 0
   758	    have h' := norm_psiSecond 1 1
   759	    simp [reducedDiag, Fin.sum_univ_two, h, h']
   760	  · simp [reducedOffDiag, psiSecond]
   761	
   762	/-- Both presentations of `ψ` are unit vectors. -/
   763	theorem isUnitState_psi : IsUnitState psiFirst ∧ IsUnitState psiSecond := by
   764	  have hnorm : ∀ i j : Fin 2,
   765	      ‖psiFirst i j‖ ^ 2 = if i = 0 ∧ j = 0 then (1 : ℝ) else 0 := by
   766	    intro i j
   767	    by_cases h : i = 0 ∧ j = 0
   768	    · have hij : psiFirst i j = 1 := by simp [psiFirst, h]
   769	      rw [hij]
   770	      simp [h]
   771	    · have hij : psiFirst i j = 0 := by simp [psiFirst, h]
   772	      rw [hij]
   773	      simp [h]
   774	  refine ⟨?_, ?_⟩
   775	  · show (∑ i, ∑ j, ‖psiFirst i j‖ ^ 2) = 1
   776	    have a00 := hnorm 0 0
   777	    have a01 := hnorm 0 1
   778	    have a10 := hnorm 1 0
   779	    have a11 := hnorm 1 1
   780	    simp [Fin.sum_univ_two, a00, a01, a10, a11]
   781	  · show (∑ i, ∑ j, ‖psiSecond i j‖ ^ 2) = 1
   782	    have a00 := norm_psiSecond 0 0
   783	    have a01 := norm_psiSecond 0 1
   784	    have a10 := norm_psiSecond 1 0
   785	    have a11 := norm_psiSecond 1 1
   786	    simp [Fin.sum_univ_two, a00, a01, a10, a11]
   787	    norm_num
   788	
   789	/-- Proposition 7.6 (target `vol01.qubit.factorization_nonunique`): the fixed
   790	unit vector `ψ` has entanglement entropy `0` in the first factorisation and
   791	`log 2` in the second. The bare record does not determine the decomposition of
   792	the state space into factors. -/
   793	theorem factorization_nonunique :
   794	    IsUnitState psiFirst ∧ IsUnitState psiSecond ∧
   795	      changeFactorization (changeFactorization psiFirst) = psiFirst ∧
   796	      changeFactorization psiFirst = psiSecond ∧
   797	      entanglementEntropy psiFirst = 0 ∧
   798	      entanglementEntropy psiSecond = Real.log 2 := by
   799	  refine ⟨isUnitState_psi.1, isUnitState_psi.2,
   800	    changeFactorization_involutive psiFirst, changeFactorization_psi, ?_, ?_⟩
   801	  · rw [entanglementEntropy, reducedDiag_first.1, reducedDiag_first.2.1]
   802	    simp
   803	  · rw [entanglementEntropy, reducedDiag_second.1, reducedDiag_second.2.1]
   804	    have h12 : ((1 / 2 : ℝ)) = (2 : ℝ)⁻¹ := by ring
   805	    rw [h12, Real.log_inv]
   806	    ring
   807	
   808	end Cmrps.Vol01

exec
/usr/local/bin/zsh -lc "sed -n '1,260p' lean/Cmrps/Vol04YonedaClassification.lean; sed -n '1,300p' lean/Cmrps/Vol05ClassicalSystems.lean" in /Users/mlong/Documents/Development/classification-physical-systems
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

/-- Paper Proposition 3.7: `y` preserves limits that exist in `C`. -/
theorem profile_limit_preservation (P : C) :
    PreservesLimitsOfSize.{t, w} (relationalProfile P) :=
  CategoryTheory.yoneda_preservesLimits P

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

exec
/usr/local/bin/zsh -lc "sed -n '261,407p' lean/Cmrps/Vol04YonedaClassification.lean; sed -n '300,498p' lean/Cmrps/Vol05ClassicalSystems.lean; cat lean/Cmrps/Vol06QuantumSystems.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
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

codex
The files generally distinguish proved results from literature inputs. I’m checking the remaining statements for cases where the Lean abstraction changes the paper’s meaning, and looking for duplicated library constructions.
exec
/usr/local/bin/zsh -lc 'cat lean/Cmrps/Vol07GaugeQft.lean; cat lean/Cmrps/Vol10ObservationalEquivalence.lean' in /Users/mlong/Documents/Development/classification-physical-systems
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

/-- Petz self-reciprocity: `f(x) = x f(x⁻¹)`. -/
def SelfReciprocal (f : ℚ → ℚ) : Prop := ∀ x : ℚ, x ≠ 0 → f x = x * f x⁻¹

/-- The Petz transpose `f^#(x) = x f(x⁻¹)`. -/
def petzTranspose (f : ℚ → ℚ) (x : ℚ) : ℚ := x * f x⁻¹

/-- Theorem 5.2 (`petz_sudar_parametricity`), statement skeleton (unproved; literature):
quantum monotone metrics correspond to operator monotone `f` with `f(1) = 1` and
`f(x) = x f(x⁻¹)`, and distinct such `f` give distinct metrics on self-adjoint
directions. Operator monotonicity is external to this skeleton and is left as a
parameter. -/
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
/usr/local/bin/zsh -lc 'cat lean/Cmrps/Vol11CompletenessObstructions.lean; cat lean/Cmrps/Vol12PrincipiaPhysica.lean' in /Users/mlong/Documents/Development/classification-physical-systems
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
is the correctness clause of the decision procedure. -/
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
a procedure `d` with `d x = true ↔ Q x`. -/
def DecidableProblem {κ : Type u} (Q : κ → Prop) : Prop :=
  ∃ d : κ → Bool, ∀ x, d x = true ↔ Q x

/-- Paper, Proposition 5.5 (Undecidability transport): a recognition problem
many-one reducible from an undecidable property of finitely presentable groups
is itself undecidable. `hmarkov` is the Adyan-Rabin theorem taken as hypothesis
(hence the `conditional` status of this claim): every Markov property of
finitely presentable groups is algorithmically undecidable. The paper requires
the reduction map `φ` to be computable so that the composed procedure is
algorithmic; the extensional form above is the content of the reduction
argument. -/
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

/-- The separation clause of Definition 2.5: the selection map is not computed by the
classification map, i.e. no map factors through another layer. -/
def NotFactoring {M P Obs : Type} (cls : P → M) (select : P → Obs) : Prop :=
  ¬ ∀ a b : P, (select a = select b ↔ cls a = cls b)

/-- Section 3, non-collapse argument: if two theories are mathematically distinct but
empirically equivalent, then the observational equivalence cannot be computed from the
classification map. -/
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
is nontrivial, and classical uniqueness does not extend to the quantum case. -/
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
/usr/local/bin/zsh -lc 'cat lean/Cmrps/Vol08SpacetimeReconstruction.lean' in /Users/mlong/Documents/Development/classification-physical-systems
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
distinct points never share a past or share a future. -/
def IsDistinguishing {α : Type*} (r : α → α → Prop) : Prop :=
  ∀ x y : α, Past r x = Past r y → Future r x = Future r y → x = y

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
  exact hne (hd x y hp hf)

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

exec
/usr/local/bin/zsh -lc "rg --files --hidden lean -g '"'!**/.git/**'"' -g '*Yoneda.lean' -g '*Alexandrov*.lean' -g '*Frobenius*.lean' -g '*lean*log*' -g '*build*log*'; cat lean/Cmrps/Vol03IrreducibilityDecomposition.lean; sed -n '1,210p' lean/Cmrps/Vol02StructuralFamilies.lean" in /Users/mlong/Documents/Development/classification-physical-systems
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

exec
/usr/local/bin/zsh -lc "sed -n '211,427p' lean/Cmrps/Vol02StructuralFamilies.lean; sed -n '428,798p' lean/Cmrps/Vol02StructuralFamilies.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:

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
of the objects of `F` into the objects of `G`. -/
def SpecialCase (F G : StructuralFamily) : Prop := Nonempty (F.Obj ↪ G.Obj)

/-- Paper Definition 16.1 / Table 14: `G` is reconstructable from `F` when a
correspondence determines one from the other. -/
def Reconstructable (F G : StructuralFamily) : Prop := Nonempty (F.Obj ≃ G.Obj)

/-- Paper Definition 16.1: two structural families are logically independent when
neither is a special case of the other and neither is reconstructable from the other. -/
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
/usr/local/bin/zsh -lc "cat lean/Cmrps/Vol09GravityInformationGeometry.lean; sed -n '330,431p' lean/Cmrps/Vol01Foundations.lean; rg -n '"'^'"\\s*(axiom|opaque)|\\b(sorry|admit|native_decide|implemented_by)\\b' lean -g '*.lean'" in /Users/mlong/Documents/Development/classification-physical-systems
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
lean/Cmrps/Vol11CompletenessObstructions.lean:25:file uses `sorry` or an axiom.
lean/Cmrps/Vol12PrincipiaPhysica.lean:14:hypotheses. Nothing in this file uses `sorry` or new axioms.
lean/Cmrps/Vol02StructuralFamilies.lean:720:/-- Paper Proposition 16.2: two families may each admit a classifying invariant and
lean/Cmrps/Vol10ObservationalEquivalence.lean:14:statement definitions left unproved. Nothing in this file uses `sorry` or new axioms.
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:28:All statements below are fully proved; nothing uses `sorry`, `axiom`, or `native_decide`.
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:233:/-- Paper Table 4.1 row 3: column sums `(1, 2)` admit `2 × 3 = 6` multiplicity matrices.

exec
/usr/local/bin/zsh -lc "rg -n -C 6 'prop:limits|preserv.*limit|finite-variety|finite.variety|parametriz|def:independ|logical independence|def:.*distinguish|past.distinguish|future.distinguish|selection|factor|operator.monotone|self.recip|undecid|recognizer' papers/latex/vol-04-yoneda-classification.tex papers/latex/vol-08-spacetime-reconstruction.tex papers/latex/vol-10-observational-equivalence.tex papers/latex/vol-11-completeness-obstructions.tex papers/latex/vol-12-principia-physica.tex papers/latex/vol-02-structural-families.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
papers/latex/vol-08-spacetime-reconstruction.tex-51-
papers/latex/vol-08-spacetime-reconstruction.tex-52-\begin{document}
papers/latex/vol-08-spacetime-reconstruction.tex-53-
papers/latex/vol-08-spacetime-reconstruction.tex-54-\maketitle
papers/latex/vol-08-spacetime-reconstruction.tex-55-
papers/latex/vol-08-spacetime-reconstruction.tex-56-\begin{abstract}
papers/latex/vol-08-spacetime-reconstruction.tex:57:This paper classifies and reconstructs spacetime and separates what is proved from what is proposed. Four results are complete within their stated hypotheses: connected holonomy groups of Lorentzian manifolds in signature $(1,n-1)$ are classified and realized by explicit metrics; the causal ladder of spacetimes is complete as a hierarchy of causality conditions; closed 3-manifolds decompose into exactly eight Thurston geometries; and for two, three, and four boundary regions the holographic entropy cone is cut out by strong subadditivity together with monogamy of mutual information. Against these islands, the homeomorphism problem for closed 4-manifolds is algorithmically undecidable, so finite classification tables exist only in tame regimes. Reconstruction recovers a target geometry from relational probe data: the chronological order determines the topology and the conformal class of a distinguishing spacetime, and entanglement-wedge reconstruction recovers bulk operators from boundary subregions in a quantum-information setting. The Ryu-Takayanagi formula remains a proposal, with exact agreement in AdS$_3$/2D CFT and for spherical regions in higher dimensions, HaPPY codes realize it in toy models only, and entanglement-induced geometry is an argument. Two boundary statements delimit the subject: monogamy of mutual information is independent of strong subadditivity over entropic vectors, and the ladder depends on how its rungs are translated to discrete orders.
papers/latex/vol-08-spacetime-reconstruction.tex-58-\end{abstract}
papers/latex/vol-08-spacetime-reconstruction.tex-59-
papers/latex/vol-08-spacetime-reconstruction.tex-60-\section{Introduction}
papers/latex/vol-08-spacetime-reconstruction.tex-61-
papers/latex/vol-08-spacetime-reconstruction.tex-62-Lorentzian geometry admits no uniform classification by local invariants: the causal, metric, and holonomic structures of a spacetime constrain its metric only up to large equivalence classes. Riemannian manifolds and Lie algebras carry discrete or rigid classification invariants. Lorentzian spacetimes offer global invariants instead: holonomy groups, causal ladder rungs, Thurston model geometries. Each of these determines geometry only within a restricted class or up to conformal rescaling. The questions are which of these invariants classify their stated targets, which of them reconstruct a geometry from relational data, and where the classification runs out.
papers/latex/vol-08-spacetime-reconstruction.tex-63-
papers/latex/vol-08-spacetime-reconstruction.tex:64:The evidence divides cleanly. On one side stand four complete results inside their hypotheses. Connected holonomy groups of Lorentzian manifolds are classified and every entry is realized by a metric \cite{galaev}. The causal ladder of spacetimes is complete: each rung strengthens the previous one and strict counterexamples separate the rungs \cite{minguzzisanchez}. Closed 3-manifolds decompose into exactly eight model geometries \cite{perelman,thurston1982}. For at most four boundary regions the holographic entropy cone is cut out by two named inequalities \cite{baoetal}. On the other side stands a sharp failure: the homeomorphism problem for closed 4-manifolds is algorithmically undecidable, and Tancer's construction needs as few as nine summands of $\mathbb{S}^2 \times \mathbb{S}^2$ \cite{tancer}. That bound limits the topological complexity an undecidability proof requires; it does not separate decidable from undecidable manifolds, and the recognition problem for $\mathbb{S}^4$ itself remains open. Finite tables of model geometries therefore exist in dimension three and not in dimension four.
papers/latex/vol-08-spacetime-reconstruction.tex-65-
papers/latex/vol-08-spacetime-reconstruction.tex:66:Metric reconstruction from non-metric data succeeds classically up to a conformal factor and remains partially conjectural in the quantum setting. In distinguishing spacetimes of dimension $n \ge 3$ the chronological order determines the manifold topology and the conformal metric class \cite{malament,hkm}. Holographic reconstruction operates rigorously only inside restricted code subspaces: boundary subregions reconstruct bulk operators in their entanglement wedge \cite{dongharlowwall}, while the identification of bulk areas with boundary entropies remains an unproved variational prescription \cite{ryutakayanagi}, its toy-model realizations \cite{haappy} and its entanglement arguments \cite{vanraamsdonk} notwithstanding. The proved determination theorems and the proposals are kept in separate sections below, and the proposals never carry the theorems' authority.
papers/latex/vol-08-spacetime-reconstruction.tex-67-
papers/latex/vol-08-spacetime-reconstruction.tex-68-This paper classifies mathematical representations of physical systems rather than physical systems themselves. A system is recorded as a tuple $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ of state space, observables, dynamics, symmetries, and composition rules; spacetime systems carry manifolds, metrics, causal relations, and holonomy groups in the state-space slot. Theorems cited from the literature appear with their hypotheses and their scope. Proposals and arguments are labeled as such in every section where they appear. Statements proved here carry complete proofs, and standard counterexamples are attributed to their sources.
papers/latex/vol-08-spacetime-reconstruction.tex-69-
papers/latex/vol-08-spacetime-reconstruction.tex-70-The relation to prior work is one of scope. The classification theorems used here are complete results about narrow targets: holonomy groups \cite{galaev}, causality conditions \cite{minguzzisanchez}, model geometries \cite{perelman,thurston1982}, and entropy cones \cite{baoetal}. The reconstruction theorems determine geometry from relational data \cite{malament} and represent bulk operators on boundary regions \cite{dongharlowwall}. The holographic literature adds a prescription \cite{ryutakayanagi}, solvable models \cite{haappy}, and a research argument \cite{vanraamsdonk}. What no source supplies is a classification of Lorentzian spacetimes up to isometry, and what this paper adds is a set of boundary results: invariants that fail to be complete (\Cref{prop:incomplete}), inequalities that fail to be redundant (\Cref{prop:mmi}), and a ladder that fails to transfer to discrete models (\Cref{cor:notransfer}). Boundaries of this kind are what a classification program needs before it can state honest targets.
papers/latex/vol-08-spacetime-reconstruction.tex-71-
papers/latex/vol-08-spacetime-reconstruction.tex-72-Two boundary statements are made precise here. Monogamy of mutual information is not implied by strong subadditivity even over classical entropic vectors; the perfectly correlated triple of \Cref{prop:mmi} is the standard counterexample of the holographic-entropy literature \cite{hhm,baoetal}, recorded with a short self-contained derivation. The causal ladder, read as a hierarchy of order-theoretic conditions, depends on how its rungs are translated to discrete orders: the compactness rung holds universally in finite orders while the strict-chronology reading of distinguishing fails there (\Cref{prop:finiteposet}, \Cref{prop:distinguish}).
--
papers/latex/vol-08-spacetime-reconstruction.tex-75-
papers/latex/vol-08-spacetime-reconstruction.tex-76-\section{Definitions}
papers/latex/vol-08-spacetime-reconstruction.tex-77-
papers/latex/vol-08-spacetime-reconstruction.tex-78-The definitions state each notion explicitly; classical notions follow standard usage.
papers/latex/vol-08-spacetime-reconstruction.tex-79-
papers/latex/vol-08-spacetime-reconstruction.tex-80-\begin{definition}[Lorentzian spacetime]\label{def:spacetime}
papers/latex/vol-08-spacetime-reconstruction.tex:81:A \emph{Lorentzian spacetime} is a connected, time-orientable smooth manifold $M$ of dimension $n \ge 2$ equipped with a Lorentzian metric $g$ of signature $(1, n-1)$. The points of $M$ are events. Two spacetimes $(M,g)$ and $(M',g')$ are \emph{conformally equivalent} when a diffeomorphism pulls one metric back to a positive conformal multiple $e^{2f} g'$ of the other. They are \emph{isometric} when the conformal factor is constant equal to one.
papers/latex/vol-08-spacetime-reconstruction.tex-82-\end{definition}
papers/latex/vol-08-spacetime-reconstruction.tex-83-
papers/latex/vol-08-spacetime-reconstruction.tex-84-\begin{definition}[Causal relations]\label{def:causal}
papers/latex/vol-08-spacetime-reconstruction.tex-85-For events $p, q \in M$ write $p \prec q$ when a future-directed timelike curve joins $p$ to $q$, and $p \le q$ when a future-directed causal curve joins them. Write $I^+(p) = \{ q : p \prec q \}$ and $J^+(p) = \{ q : p \le q \}$, and symmetrically for the pasts. The relations $\prec$ and $\le$ are the \emph{causal order} of the spacetime.
papers/latex/vol-08-spacetime-reconstruction.tex-86-\end{definition}
papers/latex/vol-08-spacetime-reconstruction.tex-87-
papers/latex/vol-08-spacetime-reconstruction.tex-88-\begin{definition}[The causal ladder]\label{def:ladder}
papers/latex/vol-08-spacetime-reconstruction.tex:89:A Lorentzian spacetime is \emph{chronological} when no closed timelike curve exists, \emph{causal} when no closed causal curve exists, \emph{distinguishing} when $I^-(p) = I^-(q)$ implies $p = q$ and $I^+(p) = I^+(q)$ implies $p = q$ (past-distinguishing and future-distinguishing), \emph{strongly causal} when every event has a neighborhood base of causally convex open sets, \emph{stably causal} when a time function exists, \emph{causally continuous} when distinguishing and the maps $p \mapsto I^{\pm}(p)$ are outer continuous (the spacetime is reflecting), \emph{causally simple} when distinguishing and each $J^+(p)$, $J^-(p)$ is closed, and \emph{globally hyperbolic} when the spacetime is causal and $J^+(p) \cap J^-(q)$ is compact for all $p, q$. These conditions form the \emph{causal ladder}, ordered from chronology to global hyperbolicity \cite{minguzzisanchez}. Causality is part of the definition of global hyperbolicity: compact diamonds alone do not exclude closed causal curves.
papers/latex/vol-08-spacetime-reconstruction.tex-90-\end{definition}
papers/latex/vol-08-spacetime-reconstruction.tex-91-
papers/latex/vol-08-spacetime-reconstruction.tex-92-\begin{definition}[Holonomy]\label{def:holonomy}
papers/latex/vol-08-spacetime-reconstruction.tex:93:For a Lorentzian spacetime $(M,g)$ the \emph{holonomy group} $\mathrm{Hol}(g)$ is the subgroup of $\mathrm{O}(1,n-1)$ obtained by parallel transport of the Levi-Civita connection along piecewise smooth loops at a base point; the \emph{restricted holonomy} $\mathrm{Hol}^0(g)$ is the identity component. The metric $g$ is \emph{decomposable} when the tangent bundle splits as an orthogonal direct sum of proper nondegenerate subspaces that are parallel for the connection, equivalently when $\mathrm{Hol}(g)$ preserves such a splitting; a Lorentzian splitting consists of a Lorentzian factor and one or more Riemannian factors. Otherwise $g$ is \emph{indecomposable}.
papers/latex/vol-08-spacetime-reconstruction.tex-94-\end{definition}
papers/latex/vol-08-spacetime-reconstruction.tex-95-
papers/latex/vol-08-spacetime-reconstruction.tex-96-\begin{definition}[Entropy vectors]\label{def:entropy}
papers/latex/vol-08-spacetime-reconstruction.tex-97-Let $A_1, \dots, A_n$ be boundary regions and let $S$ assign a nonnegative real number $S(A)$ to every nonempty union $A = A_{i_1} \cup \cdots \cup A_{i_k}$, with $S(\emptyset) = 0$. The tuple $S \in \mathbb{R}^{2^n - 1}$ is an \emph{entropy vector}. An entropy vector is \emph{entropic} when it is realized by the von Neumann entropy of some quantum state on the tensor product of the region Hilbert spaces. Standard inequalities include subadditivity $S(A) + S(B) \ge S(AB)$, the Araki-Lieb bound $|S(A) - S(B)| \le S(AB)$, and strong subadditivity
papers/latex/vol-08-spacetime-reconstruction.tex-98-\begin{equation}\label{eq:ssa}
papers/latex/vol-08-spacetime-reconstruction.tex-99-S(U) + S(V) \ge S(U \cup V) + S(U \cap V),
--
papers/latex/vol-08-spacetime-reconstruction.tex-139-Invariant & Classifies & Scope & Status \\
papers/latex/vol-08-spacetime-reconstruction.tex-140-\midrule
papers/latex/vol-08-spacetime-reconstruction.tex-141-Holonomy group & Connected holonomy types & Indecomposable Lorentzian metrics & Complete \\
papers/latex/vol-08-spacetime-reconstruction.tex-142-Causal class & Rung of the causal ladder & Lorentzian spacetimes & Complete \\
papers/latex/vol-08-spacetime-reconstruction.tex-143-Thurston geometry type & Geometry type of each piece & Pieces of a closed 3-manifold decomposition & Complete \\
papers/latex/vol-08-spacetime-reconstruction.tex-144-RT inequality data & Facets of the entropy cone & At most 4 boundary regions & Complete \\
papers/latex/vol-08-spacetime-reconstruction.tex:145:Conformal class & Metric up to conformal factor & Distinguishing spacetimes & Complete \\
papers/latex/vol-08-spacetime-reconstruction.tex-146-Entanglement data & Bulk geometry & Holographic code subspaces & Open \\
papers/latex/vol-08-spacetime-reconstruction.tex-147-\bottomrule
papers/latex/vol-08-spacetime-reconstruction.tex-148-\end{tabularx}
papers/latex/vol-08-spacetime-reconstruction.tex-149-\end{table}
papers/latex/vol-08-spacetime-reconstruction.tex-150-
papers/latex/vol-08-spacetime-reconstruction.tex:151:The rows attach data to a spacetime without fixing its isometry class, as \Cref{prop:incomplete} shows. The last row states the reconstruction problem in the language of invariants. The conformal class is recovered from the chronological order (\Cref{thm:malament}) and the isometry class is not (\Cref{cor:confactor}). Bulk geometry is recovered inside a code subspace from boundary operator data (\Cref{thm:dhw}) and is not known to be recovered from entanglement data alone. Classification and reconstruction use the same rows of the table and ask different questions of them.
papers/latex/vol-08-spacetime-reconstruction.tex-152-
papers/latex/vol-08-spacetime-reconstruction.tex-153-\section{Incomplete invariants}
papers/latex/vol-08-spacetime-reconstruction.tex-154-
papers/latex/vol-08-spacetime-reconstruction.tex-155-Invariants do not classify unless they are complete. The holonomy group, the causal class, and the dimension fail to be complete: an explicit pair of spacetimes shares all three and is not isometric.
papers/latex/vol-08-spacetime-reconstruction.tex-156-
papers/latex/vol-08-spacetime-reconstruction.tex-157-\begin{proposition}[Shared invariants, distinct spacetimes]\label{prop:incomplete}
--
papers/latex/vol-08-spacetime-reconstruction.tex-193-\[
papers/latex/vol-08-spacetime-reconstruction.tex-194-\mathrm{Hol}^0(g_1 \oplus g_2) = \mathrm{Hol}^0(g_1) \times \mathrm{Hol}^0(g_2).
papers/latex/vol-08-spacetime-reconstruction.tex-195-\]
papers/latex/vol-08-spacetime-reconstruction.tex-196-\end{proposition}
papers/latex/vol-08-spacetime-reconstruction.tex-197-
papers/latex/vol-08-spacetime-reconstruction.tex-198-\begin{proof}
papers/latex/vol-08-spacetime-reconstruction.tex:199:The Levi-Civita connection of a product metric is the direct sum of the factor connections, so parallel transport preserves the splitting $T(M_1 \times M_2) = TM_1 \oplus TM_2$ of tangent spaces into horizontal and vertical parts. By the Ambrose-Singer theorem the restricted holonomy algebra is generated by parallel translates of curvature endomorphisms. The curvature of the product splits as $R = R_1 \oplus R_2$, each factor curvature acting only on its own summand, so the generated algebra is $\mathfrak{hol}^0(g_1) \oplus \mathfrak{hol}^0(g_2)$. Exponentiating gives the group identity for restricted holonomy. No completeness assumption is used; the identity concerns the restricted group, which is generated by contractible loops.
papers/latex/vol-08-spacetime-reconstruction.tex-200-\end{proof}
papers/latex/vol-08-spacetime-reconstruction.tex-201-
papers/latex/vol-08-spacetime-reconstruction.tex-202-\Cref{prop:product} is the invariant-level statement of what it means for a metric to decompose. Indecomposability in \Cref{def:holonomy} is exactly the failure of this splitting, and the holonomy classification of \Cref{thm:holonomy} is a classification of the indecomposable case.
papers/latex/vol-08-spacetime-reconstruction.tex-203-
papers/latex/vol-08-spacetime-reconstruction.tex-204-\begin{lemma}[Restricted holonomy]\label{lem:restricted}
papers/latex/vol-08-spacetime-reconstruction.tex-205-For every Lorentzian spacetime the restricted holonomy $\mathrm{Hol}^0(g)$ is a connected Lie subgroup of $\mathrm{SO}(1,n-1)^{\uparrow}$, and time-orientability places the full holonomy $\mathrm{Hol}(g)$ in the orthochronous group $\mathrm{O}(1,n-1)^{\uparrow}$. The quotient $\mathrm{Hol}(g)/\mathrm{Hol}^0(g)$ is countable in its intrinsic topology, and the classification of \Cref{thm:holonomy} concerns the connected part.
--
papers/latex/vol-08-spacetime-reconstruction.tex-207-
papers/latex/vol-08-spacetime-reconstruction.tex-208-\begin{proof}
papers/latex/vol-08-spacetime-reconstruction.tex-209-$\mathrm{Hol}^0(g)$ is generated by parallel transport along contractible loops, hence connected and contained in the identity component $\mathrm{SO}(1,n-1)^{\uparrow}$ on every Lorentzian manifold, independently of orientability. Time-orientability is exactly the condition that parallel transport preserves time-orientation on all loops, so $\mathrm{Hol}(g)$ lies in the orthochronous group. The quotient of a Lie group by its identity component is countable in the intrinsic topology of the quotient, though it need not be discrete in the subspace topology of $\mathrm{O}(1,n-1)$.
papers/latex/vol-08-spacetime-reconstruction.tex-210-\end{proof}
papers/latex/vol-08-spacetime-reconstruction.tex-211-
papers/latex/vol-08-spacetime-reconstruction.tex-212-\begin{remark}[Two standard examples]\label{rem:holonomyexamples}
papers/latex/vol-08-spacetime-reconstruction.tex:213:Two metrics illustrate the cases of \Cref{thm:holonomy}. The flat metric on Minkowski space has trivial holonomy and is both decomposable and locally symmetric, so it sits outside the indecomposable list of the theorem: its trivial holonomy is an instance of \Cref{prop:product} applied to flat factors. A plane-wave metric (a Walker metric with parallel null vector) is indecomposable with a special holonomy group obtained by the prolongation construction, and its holonomy is the proper null-line-stabilizing entry predicted by \Cref{thm:holonomy} and realized by the metric itself \cite{galaev}. The special entries of the list are attained by such metrics rather than merely possible.
papers/latex/vol-08-spacetime-reconstruction.tex-214-\end{remark}
papers/latex/vol-08-spacetime-reconstruction.tex-215-
papers/latex/vol-08-spacetime-reconstruction.tex-216-\begin{table}[t]
papers/latex/vol-08-spacetime-reconstruction.tex-217-\centering
papers/latex/vol-08-spacetime-reconstruction.tex-218-\caption{Coarse strata of the Lorentzian holonomy classification. The entry-by-entry table with realizing metrics is in the cited survey; the strata record how the cases are organized.}
papers/latex/vol-08-spacetime-reconstruction.tex-219-\label{tab:holonomy}
--
papers/latex/vol-08-spacetime-reconstruction.tex-222-\toprule
papers/latex/vol-08-spacetime-reconstruction.tex-223-Stratum & Holonomy type & Scope \\
papers/latex/vol-08-spacetime-reconstruction.tex-224-\midrule
papers/latex/vol-08-spacetime-reconstruction.tex-225-Generic & Full group $\mathrm{SO}(1,n-1)^{\uparrow}$ & Indecomposable metrics without special structure \\
papers/latex/vol-08-spacetime-reconstruction.tex-226-Special & Null-line-stabilizing algebras inside $\mathfrak{sim}(n-2)$ & Plane waves and Walker metrics realizing each entry \\
papers/latex/vol-08-spacetime-reconstruction.tex-227-Symmetric & Isotropy of a symmetric space & Locally symmetric Lorentzian metrics \\
papers/latex/vol-08-spacetime-reconstruction.tex:228:Decomposable & Products of factor holonomy groups & Split metrics, by \Cref{prop:product} \\
papers/latex/vol-08-spacetime-reconstruction.tex-229-\bottomrule
papers/latex/vol-08-spacetime-reconstruction.tex-230-\end{tabularx}
papers/latex/vol-08-spacetime-reconstruction.tex-231-\end{table}
papers/latex/vol-08-spacetime-reconstruction.tex-232-
papers/latex/vol-08-spacetime-reconstruction.tex-233-\Cref{tab:holonomy} is an organization of \Cref{thm:holonomy}, not a second classification: the proved statement is the entry-by-entry list with realizing metrics \cite{galaev}, and the strata record the three constructions used in the proof plus the decomposable case excluded from it. Read as classification data, the table says which construction a given holonomy group came from; it does not say which spacetime carries it.
papers/latex/vol-08-spacetime-reconstruction.tex-234-
papers/latex/vol-08-spacetime-reconstruction.tex-235-\section{The causal ladder}
papers/latex/vol-08-spacetime-reconstruction.tex-236-
papers/latex/vol-08-spacetime-reconstruction.tex-237-Causality conditions order spacetimes by how badly causal curves misbehave. The ladder is complete as a classification of these conditions \cite{minguzzisanchez}, and its rungs do not survive translation to discrete orders.
papers/latex/vol-08-spacetime-reconstruction.tex-238-
papers/latex/vol-08-spacetime-reconstruction.tex-239-\begin{theorem}[Completeness of the causal ladder]\label{thm:ladder}
papers/latex/vol-08-spacetime-reconstruction.tex:240:For Lorentzian spacetimes the causality conditions of \Cref{def:ladder} form a strict chain: global hyperbolicity implies causal simplicity, which implies causal continuity, which implies stable causality, which implies strong causality, which implies distinguishing, which implies causality, which implies chronology. Each implication is strict: for each pair of adjacent rungs there exists a spacetime satisfying the lower rung and violating the higher one. Global hyperbolicity is the strongest of the standard causality conditions, and it is equivalent to the compactness of causal diamonds $J^+(p) \cap J^-(q)$ together with the absence of closed causal curves \cite{minguzzisanchez}.
papers/latex/vol-08-spacetime-reconstruction.tex-241-\end{theorem}
papers/latex/vol-08-spacetime-reconstruction.tex-242-
papers/latex/vol-08-spacetime-reconstruction.tex-243-\par\medskip\noindent\emph{Argument structure.}
papers/latex/vol-08-spacetime-reconstruction.tex-244-The implications are proved in the source in a single framework with minimal hypotheses; the strictness is proved by constructing, for each pair of adjacent rungs, a separating spacetime, and the equivalences at the top rung are proved by the compactness characterization of global hyperbolicity. The survey of Minguzzi and S\'{a}nchez also records the alternative definitions of each rung and the smoothability results needed to make the examples smooth. The contribution of this paper begins at \Cref{prop:finiteposet}, where the ladder is tested against a different category of causal models.
papers/latex/vol-08-spacetime-reconstruction.tex-245-\par\medskip
papers/latex/vol-08-spacetime-reconstruction.tex-246-
--
papers/latex/vol-08-spacetime-reconstruction.tex-283-
papers/latex/vol-08-spacetime-reconstruction.tex-284-\begin{proposition}[Distinguishing fails in finite orders under the strict reading]\label{prop:distinguish}
papers/latex/vol-08-spacetime-reconstruction.tex-285-Read the ladder rungs on an order by translating the open futures and pasts literally: $I^+(x) = \{ y : x < y \}$ and $I^-(x) = \{ y : y < x \}$. Under this translation there exists a finite order satisfying the conclusions of \Cref{prop:finiteposet} and failing distinguishing: for the two-element antichain $X = \{a, b\}$ with $a$ and $b$ incomparable, one has $I^-(a) = I^-(b) = \emptyset$ and $I^+(a) = I^+(b) = \emptyset$ for distinct points.
papers/latex/vol-08-spacetime-reconstruction.tex-286-\end{proposition}
papers/latex/vol-08-spacetime-reconstruction.tex-287-
papers/latex/vol-08-spacetime-reconstruction.tex-288-\begin{proof}
papers/latex/vol-08-spacetime-reconstruction.tex:289:In an antichain no two distinct points are related, so every chronological future and past is empty. Distinct points therefore carry identical pasts and identical futures, while the order-theoretic compactness of intervals holds vacuously. This is exactly the failure mode \Cref{def:ladder} forbids at the distinguishing rung.
papers/latex/vol-08-spacetime-reconstruction.tex-290-\end{proof}
papers/latex/vol-08-spacetime-reconstruction.tex-291-
papers/latex/vol-08-spacetime-reconstruction.tex-292-\begin{corollary}[Translation dependence of the ladder on finite orders]\label{cor:notransfer}
papers/latex/vol-08-spacetime-reconstruction.tex-293-Rung membership of the causal ladder is not invariant under the translation from continuum definitions to orders. The strict reading of \Cref{prop:distinguish} fails on finite orders while the compactness rung holds universally there, and the reflexive reading built from causal futures $J^{\pm}(x) = \{ y : y \le x \}$ is distinguishing on every antisymmetric order by construction. A discrete causality theory must therefore state which translation it uses, and the rungs cannot be carried over verbatim from the manifold category.
papers/latex/vol-08-spacetime-reconstruction.tex-294-\end{corollary}
papers/latex/vol-08-spacetime-reconstruction.tex-295-
--
papers/latex/vol-08-spacetime-reconstruction.tex-338-
papers/latex/vol-08-spacetime-reconstruction.tex-339-\begin{proof}
papers/latex/vol-08-spacetime-reconstruction.tex-340-Each model space is a simply connected Lie group or a symmetric space carrying an invariant metric of the stated signature (Riemannian here), and the isometry group of an invariant metric on a Lie group contains the left translations, which act transitively. The dimension counts in \Cref{tab:geometries} are the dimensions of the full isometry groups of the model metrics, computed from the Killing fields of the corresponding homogeneous structures. In dimension three the isotropy of a homogeneous geometry is a subgroup of $\mathrm{O}(3)$ of dimension at most three, so the isometry dimension is at most six, and the three constant-curvature geometries attain the bound because their isotropy is all of $\mathrm{O}(3)$. The eight entries are precisely the maximal such geometries; maximality is the classification input of \Cref{thm:geometrization} \cite{thurston1982}.
papers/latex/vol-08-spacetime-reconstruction.tex-341-\end{proof}
papers/latex/vol-08-spacetime-reconstruction.tex-342-
papers/latex/vol-08-spacetime-reconstruction.tex-343-\begin{theorem}[Unrecognizability in dimension four]\label{thm:tancer}
papers/latex/vol-08-spacetime-reconstruction.tex:344:The recognition problem for closed 4-manifolds is algorithmically undecidable: there is no algorithm that takes as input a finite triangulation of a closed 4-manifold and decides whether it is homeomorphic to $\#_9(\mathbb{S}^2 \times \mathbb{S}^2)$. The connected sum $\#_9(\mathbb{S}^2 \times \mathbb{S}^2)$ is therefore unrecognizable, improving the previous bound $\#_{12}(\mathbb{S}^2 \times \mathbb{S}^2)$ of Gordon \cite{tancer}.
papers/latex/vol-08-spacetime-reconstruction.tex-345-\end{theorem}
papers/latex/vol-08-spacetime-reconstruction.tex-346-
papers/latex/vol-08-spacetime-reconstruction.tex-347-\par\medskip\noindent\emph{Argument structure.}
papers/latex/vol-08-spacetime-reconstruction.tex:348:The construction encodes the Adian-Rabin set of a group presentation into the topology of a simply connected 4-manifold built from the presentation, and shows that the homeomorphism type of the resulting connected sum of copies of $\mathbb{S}^2 \times \mathbb{S}^2$ decides a property of the presentation that is known to be undecidable. Removing Markov's trick and reducing the deficiency of the presentation lowers the number of summands from twelve to nine \cite{tancer}.
papers/latex/vol-08-spacetime-reconstruction.tex-349-\par\medskip
papers/latex/vol-08-spacetime-reconstruction.tex-350-
papers/latex/vol-08-spacetime-reconstruction.tex-351-\begin{corollary}[Dimension contrast]\label{cor:dimcontrast}
papers/latex/vol-08-spacetime-reconstruction.tex-352-A finite table of model geometries with a canonical decomposition theorem exists for closed 3-manifolds and cannot exist, in the algorithmic sense, for closed 4-manifolds. Classification of closed manifolds by a finite table of models is a tame-regime phenomenon.
papers/latex/vol-08-spacetime-reconstruction.tex-353-\end{corollary}
papers/latex/vol-08-spacetime-reconstruction.tex-354-
papers/latex/vol-08-spacetime-reconstruction.tex-355-\begin{proof}
papers/latex/vol-08-spacetime-reconstruction.tex-356-\Cref{thm:geometrization} supplies the finite table and the decomposition in dimension three. \Cref{thm:tancer} shows that no algorithm can recognize the members of even a single infinite family of closed 4-manifolds, so no finite table can be accompanied by an algorithmic identification procedure in dimension four.
papers/latex/vol-08-spacetime-reconstruction.tex-357-\end{proof}
papers/latex/vol-08-spacetime-reconstruction.tex-358-
papers/latex/vol-08-spacetime-reconstruction.tex-359-\begin{remark}[Model geometries in dimension four]\label{rem:filipkiewicz}
papers/latex/vol-08-spacetime-reconstruction.tex:360:Four-dimensional model geometries do exist as a list: Filipkiewicz classified them into eighteen geometries together with one countably infinite family \cite{hillman}. The existence of a list of homogeneous models is not a classification of manifolds, and \Cref{thm:tancer} shows that recognition of manifolds carrying those geometries is undecidable in general. Restricted classes do decompose; the unrestricted classification does not exist.
papers/latex/vol-08-spacetime-reconstruction.tex-361-\end{remark}
papers/latex/vol-08-spacetime-reconstruction.tex-362-
papers/latex/vol-08-spacetime-reconstruction.tex-363-\section{The holographic entropy cone}
papers/latex/vol-08-spacetime-reconstruction.tex-364-
papers/latex/vol-08-spacetime-reconstruction.tex-365-The holographic entropy cone is the one classification result on the quantum-information side of this volume whose completeness is proved in a bounded range. The bound matters: for two, three, and four regions the inequality set is known and small; five regions are settled by a later enumeration; from six regions on the facet lists are open. The explosion of facets from five regions on tracks the proliferation of minimal-graph topologies that minimal surfaces can realize \cite{baoetal}.
papers/latex/vol-08-spacetime-reconstruction.tex-366-
--
papers/latex/vol-08-spacetime-reconstruction.tex-408-
papers/latex/vol-08-spacetime-reconstruction.tex-409-\begin{lemma}[Strong subadditivity from subadditivity and monogamy]\label{lem:ssaredundant}
papers/latex/vol-08-spacetime-reconstruction.tex-410-For three single regions, strong subadditivity follows from subadditivity together with monogamy of mutual information. At $n = 3$ the strong subadditivity family is therefore a consequence rather than an independent input. This argument covers three-region instances only: at $n = 2$ monogamy is vacuous, and at $n = 4$ the strong subadditivity instances involving four regions are not generated by three-region monogamy and remain independent inputs of \Cref{thm:cone}.
papers/latex/vol-08-spacetime-reconstruction.tex-411-\end{lemma}
papers/latex/vol-08-spacetime-reconstruction.tex-412-
papers/latex/vol-08-spacetime-reconstruction.tex-413-\begin{proof}
papers/latex/vol-08-spacetime-reconstruction.tex:414:The conditional mutual information factors as $I(A{:}C \mid B) = I(A{:}BC) - I(A{:}B)$. Monogamy \eqref{eq:mmi} in the form of \Cref{prop:mmiform} gives $I(A{:}BC) - I(A{:}B) \ge I(A{:}C)$, and subadditivity gives $I(A{:}C) \ge 0$. Hence $I(A{:}C \mid B) \ge 0$, which is strong subadditivity for the triple.
papers/latex/vol-08-spacetime-reconstruction.tex-415-\end{proof}
papers/latex/vol-08-spacetime-reconstruction.tex-416-
papers/latex/vol-08-spacetime-reconstruction.tex-417-\begin{lemma}[The witness satisfies every other standard inequality]\label{lem:witnessclean}
papers/latex/vol-08-spacetime-reconstruction.tex-418-The entropy vector of \Cref{prop:mmi} is nonnegative, is zero on $\emptyset$, and satisfies subadditivity, the Araki-Lieb bound, and strong subadditivity. It violates only \eqref{eq:mmi}. Hence the independence of \Cref{prop:mmi} is not caused by any other failure.
papers/latex/vol-08-spacetime-reconstruction.tex-419-\end{lemma}
papers/latex/vol-08-spacetime-reconstruction.tex-420-
--
papers/latex/vol-08-spacetime-reconstruction.tex-441-\end{theorem}
papers/latex/vol-08-spacetime-reconstruction.tex-442-
papers/latex/vol-08-spacetime-reconstruction.tex-443-\par\medskip\noindent\emph{Argument structure.}
papers/latex/vol-08-spacetime-reconstruction.tex-444-The argument has two stages. First, the chronological order determines the topology: Malament shows that an order-preserving bijection between distinguishing spacetimes is a homeomorphism, using order arguments on chains of timelike curves rather than any metric. Second, a homeomorphism that maps timelike curves to timelike curves preserves the conformal class, and in dimension $n \ge 3$ the causal, differential, and conformal structures of a spacetime determine each other, so the homeomorphism upgrades to a smooth conformal isometry \cite{hkm}. The complete argument is Malament's \cite{malament} with the smooth upgrade of \cite{hkm}. In dimension $n = 2$ the conclusion fails: in null coordinates $(u,v)$ on $\mathbb{R}^{1,1}$ the map $(u,v) \mapsto (u^3, v)$ preserves the chronological order but its inverse is not smooth at $u = 0$.
papers/latex/vol-08-spacetime-reconstruction.tex-445-\par\medskip
papers/latex/vol-08-spacetime-reconstruction.tex-446-
papers/latex/vol-08-spacetime-reconstruction.tex:447:\Cref{thm:malament} is the strongest reconstruction statement in this volume, and its scope is exactly the scope of \Cref{def:reconstruction}: the probe datum is the chronological order, the class is the distinguishing spacetimes, and the equivalence is the conformal isometry class. The next corollary records the boundary of the theorem.
papers/latex/vol-08-spacetime-reconstruction.tex-448-
papers/latex/vol-08-spacetime-reconstruction.tex:449:\begin{corollary}[The order does not fix the conformal factor]\label{cor:confactor}
papers/latex/vol-08-spacetime-reconstruction.tex:450:No reconstruction of a metric from the chronological order alone can determine the conformal factor: distinct metrics $g$ and $e^{2f} g$ on the same manifold carry the same chronological order and are not isometric unless $f$ is constant. Recovering the conformal factor requires additional probe data, such as a volume form, a time function normalized by matter, or stress-energy data.
papers/latex/vol-08-spacetime-reconstruction.tex-451-\end{corollary}
papers/latex/vol-08-spacetime-reconstruction.tex-452-
papers/latex/vol-08-spacetime-reconstruction.tex-453-\begin{proof}
papers/latex/vol-08-spacetime-reconstruction.tex:454:Conformal rescaling of a metric by a positive function $e^{2f}$ preserves the timelike cones of every tangent space, hence preserves the chronological order. Distinct conformal factors give distinct metrics with the same probe datum, so no procedure reading the order can distinguish them. Any reconstruction of the full metric must add data that breaks the conformal freedom.
papers/latex/vol-08-spacetime-reconstruction.tex-455-\end{proof}
papers/latex/vol-08-spacetime-reconstruction.tex-456-
papers/latex/vol-08-spacetime-reconstruction.tex-457-Two unrelated topologies share the name Alexandrov in English transliteration. The open-diamond topology on a spacetime, due to A. D. Alexandrov, is generated by the sets $I^+(p) \cap I^-(q)$ and is sensitive to causality; the up-set topology on a poset, due to P. S. Alexandroff, is generated by up-sets and is generally not $T_1$. The two are distinguished by name throughout what follows.
papers/latex/vol-08-spacetime-reconstruction.tex-458-
papers/latex/vol-08-spacetime-reconstruction.tex-459-\begin{lemma}[The order determines the diamond topology]\label{lem:alexandrov}
papers/latex/vol-08-spacetime-reconstruction.tex-460-The chronological order of a spacetime determines the open-diamond topology of A. D. Alexandrov: the sets $I^+(p) \cap I^-(q)$ form a basis whose lattice structure is a function of the order alone. This diamond topology coincides with the manifold topology exactly when the spacetime is strongly causal \cite{minguzzisanchez}, so on a strongly causal spacetime the order determines the topology of $M$ without reference to the metric.
--
papers/latex/vol-08-spacetime-reconstruction.tex-526-Van Raamsdonk's essay \cite{vanraamsdonk} argues that the emergence of classically connected spacetime is tied to quantum entanglement: disentangling the degrees of freedom of two regions makes the regions pinch off from each other, quantified by standard entanglement measures. The status of the statement is an argument based on examples, not a theorem. It states a research direction for reconstruction: if entanglement builds connectedness, then entanglement data should determine geometric data. \Cref{thm:malament} shows what such a determination would have to look like as a theorem, with class, datum, and equivalence declared. No such theorem is claimed here.
papers/latex/vol-08-spacetime-reconstruction.tex-527-\end{remark}
papers/latex/vol-08-spacetime-reconstruction.tex-528-
papers/latex/vol-08-spacetime-reconstruction.tex-529-The gap between these remarks and a reconstruction theorem of quantum gravity is not a technicality. \Cref{thm:malament} recovers a conformal class from a causal order; it does not derive a metric from entanglement. \Cref{thm:dhw} recovers operators inside a code subspace; it does not derive the code subspace from first principles. A derivation of spacetime geometry from informational data without assuming the geometry at the start would need both steps in reverse order and is not on the shelf.
papers/latex/vol-08-spacetime-reconstruction.tex-530-
papers/latex/vol-08-spacetime-reconstruction.tex-531-\begin{remark}[What an upgrade would require]\label{rem:upgrade}
papers/latex/vol-08-spacetime-reconstruction.tex:532:To promote the entanglement-connectedness argument \cite{vanraamsdonk} to a theorem of the kind \Cref{def:reconstruction} asks for, three things would be needed: a probe datum consisting only of entanglement data on a declared family of subsystems, a proof that the datum determines a spacetime up to a declared equivalence, and a demonstration that the construction does not smuggle in the geometry at the start. \Cref{thm:malament} shows the second item is achievable when the probe datum is a causal order and the equivalence is conformal. \Cref{cor:confactor} shows that even then a conformal factor remains undetermined, so the third item requires either additional data or a theorem that the factor is physically irrelevant. None of the three items is established in the sources reviewed (cutoff 2026-10-29).
papers/latex/vol-08-spacetime-reconstruction.tex-533-\end{remark}
papers/latex/vol-08-spacetime-reconstruction.tex-534-
papers/latex/vol-08-spacetime-reconstruction.tex-535-\section{Computational evidence}
papers/latex/vol-08-spacetime-reconstruction.tex-536-
papers/latex/vol-08-spacetime-reconstruction.tex-537-Three experiments accompany the claims above. They are recorded as evidence, run from \texttt{src/vol-08-spacetime-reconstruction/}, and checked by the paper's code evidence appendix. None of them proves anything: they test that the definitions behave as the proofs say on finite instances. The claims each experiment probes are listed in \Cref{tab:checks} and \Cref{tab:code}.
papers/latex/vol-08-spacetime-reconstruction.tex-538-
--
papers/latex/vol-08-spacetime-reconstruction.tex-625-                    return True
papers/latex/vol-08-spacetime-reconstruction.tex-626-                if nxt not in seen:
papers/latex/vol-08-spacetime-reconstruction.tex-627-                    stack.append((nxt, seen | {nxt}))
papers/latex/vol-08-spacetime-reconstruction.tex-628-    return False
papers/latex/vol-08-spacetime-reconstruction.tex-629-
papers/latex/vol-08-spacetime-reconstruction.tex-630-def is_distinguishing(le, n):
papers/latex/vol-08-spacetime-reconstruction.tex:631:    # Past- and future-distinguishing (Definition 2.3).
papers/latex/vol-08-spacetime-reconstruction.tex-632-    for x in range(n):
papers/latex/vol-08-spacetime-reconstruction.tex-633-        for y in range(n):
papers/latex/vol-08-spacetime-reconstruction.tex-634-            if x == y:
papers/latex/vol-08-spacetime-reconstruction.tex-635-                continue
papers/latex/vol-08-spacetime-reconstruction.tex-636-            px, fx = past_future(le, x, n)
papers/latex/vol-08-spacetime-reconstruction.tex-637-            py, fy = past_future(le, y, n)
--
papers/latex/vol-08-spacetime-reconstruction.tex-651-The Python experiments test finite instances of the propositions proved in \Cref{prop:mmi}, \Cref{prop:finiteposet}, and \Cref{prop:distinguish}; the Haskell instances type the objects of \Cref{def:systems}. The evidence is reproducible from the files in the appendix and is not proof. Nothing in this volume has been checked by a proof assistant, and the mechanization targets are recorded separately as targets. This volume depends on the shared definitions and on the registered background results it cites. It does not depend on any statement about the entropy cone for six or more regions, on the Ryu-Takayanagi formula outside its stated settings, or on tensor-network toy models as evidence about gravity; where a result needs those inputs, the conditional phrasing appears in the statement.
papers/latex/vol-08-spacetime-reconstruction.tex-652-
papers/latex/vol-08-spacetime-reconstruction.tex-653-\section{Conclusion}
papers/latex/vol-08-spacetime-reconstruction.tex-654-
papers/latex/vol-08-spacetime-reconstruction.tex-655-Spacetime admits classification exactly where its invariants are finite or parametric and reconstruction exactly where probes determine a target up to a stated equivalence. Lorentzian holonomy groups form a classified list with realizing metrics \cite{galaev}. Causality conditions form a complete ladder \cite{minguzzisanchez}. Closed 3-manifolds form a finite table of eight geometries \cite{perelman,thurston1982}, and closed 4-manifolds do not admit algorithmic recognition \cite{tancer}. The holographic entropy cone is a complete polyhedral calculation for at most four regions \cite{baoetal}, probed here by a witness showing that its two inequality families are independent (\Cref{prop:mmi}).
papers/latex/vol-08-spacetime-reconstruction.tex-656-
papers/latex/vol-08-spacetime-reconstruction.tex:657:Reconstruction has one proved classical form: the chronological order determines the topology and the conformal class \cite{malament}, and the conformal factor is exactly the undetermined freedom (\Cref{cor:confactor}). It has one proved quantum-information form: bulk operators in an entanglement wedge are boundary-representable in the code subspace \cite{dongharlowwall}. Between them lies the conjecture that entanglement determines geometry \cite{ryutakayanagi,haappy,vanraamsdonk}, presented here with its status on every appearance.
papers/latex/vol-08-spacetime-reconstruction.tex-658-
papers/latex/vol-08-spacetime-reconstruction.tex-659-The negative results are part of the answer. The causal ladder rungs depend on their translation to finite orders (\Cref{cor:notransfer}), so a discrete quantum-gravity model that uses its rungs must state its definitions and prove its own causality theorems. Monogamy of mutual information is not free from strong subadditivity (\Cref{prop:mmi}), so from three regions on the entropy cone genuinely needs both inequality families. Dimension four has no algorithmic classification (\Cref{thm:tancer}), so a classification chart of this kind has rows that end in impossibility results rather than in lists. Each of these is a boundary, and each boundary narrows the targets a classification can honestly claim.
papers/latex/vol-08-spacetime-reconstruction.tex-660-
papers/latex/vol-08-spacetime-reconstruction.tex:661:Four open problems delimit the next stage. The complete RT facet lists for six and more boundary regions are unknown; five regions are settled \cite{hernandezcuenca}, and for general $n$ only one infinite family of inequalities is known \cite{baoetal}. The invariants of \Cref{tab:invariants} do not separate isometry classes (\Cref{cor:notclassifies}), and which additional global invariants complete such a classification is open. The conformal factor left undetermined by \Cref{cor:confactor} is either physically irrelevant or recoverable from additional probes, and the choice is not made by any theorem here. A determination theorem for spacetime from entanglement data would need the three items of \Cref{rem:upgrade}, and none is established in the sources reviewed (cutoff 2026-10-29). The classification of Lorentzian spacetimes up to isometry remains, as this paper has tried to make precise, exactly where its invariants stop.
papers/latex/vol-08-spacetime-reconstruction.tex-662-
papers/latex/vol-08-spacetime-reconstruction.tex-663-\begin{thebibliography}{99}\small
papers/latex/vol-08-spacetime-reconstruction.tex-664-
papers/latex/vol-08-spacetime-reconstruction.tex-665-\bibitem{galaev}
papers/latex/vol-08-spacetime-reconstruction.tex-666-A.~S. Galaev, \emph{Holonomy groups of Lorentzian manifolds}, arXiv:1611.01551; Russian Math. Surveys 70 (2015) 249-298, DOI 10.1070/RM2015v070n02ABEH004947.
papers/latex/vol-08-spacetime-reconstruction.tex-667-
--
papers/latex/vol-11-completeness-obstructions.tex-49-\date{October 2026}
papers/latex/vol-11-completeness-obstructions.tex-50-
papers/latex/vol-11-completeness-obstructions.tex-51-\begin{document}
papers/latex/vol-11-completeness-obstructions.tex-52-\maketitle
papers/latex/vol-11-completeness-obstructions.tex-53-
papers/latex/vol-11-completeness-obstructions.tex-54-\begin{abstract}
papers/latex/vol-11-completeness-obstructions.tex:55:This paper determines what can be established about the completeness of a classification of mathematical representations of physical systems. Seven proved obstruction theorems are compiled as a register: there are uncountably many separable type $\mathrm{II}_1$ factors; tensor-category equivalence without symmetric structure does not determine the group; every Markov property of finitely presentable groups is algorithmically undecidable; wild representation categories admit no parametrization by a finite-dimensional variety; homeomorphism of a specific closed four-manifold is unrecognizable; isomorphism of separable von Neumann algebras admits no classification by countable invariants; and the tame-wild dichotomy bounds algorithmic tractability. From these results a classification program is defined as a triple of complete invariant, parameter space, and recognition procedure, and each surveyed domain of mathematical physics is assigned to one of seven regimes. A transport theorem shows that wild embeddings and invariant obstructions propagate along fully faithful functors, so such obstructions travel with any fully faithful re-presentation of a domain. Counterexamples refute three natural completions of the universal classification conjecture. The conjecture itself is examined obligation by obligation and is never used as a lemma. Completeness holds in restricted tame regimes and is provably unattainable elsewhere without further restrictions.
papers/latex/vol-11-completeness-obstructions.tex-56-\end{abstract}
papers/latex/vol-11-completeness-obstructions.tex-57-
papers/latex/vol-11-completeness-obstructions.tex-58-\section{Introduction}
papers/latex/vol-11-completeness-obstructions.tex-59-
papers/latex/vol-11-completeness-obstructions.tex-60-The classification of finite simple groups is the model of what a total classification theorem looks like: every object of the domain falls into an explicitly described list of families and exceptions, and the list is exhaustive \cite{solomon2001}. The research program of this series asks whether mathematical representations of physical systems admit an analogous classification. The question is precise enough to be attacked only after fixing an equivalence relation on representations, a notion of admissible system, and a catalogue of constructions from which complex systems are assembled. The central identity of the program, that every admissible system is generated by a fixed collection of structural families under a fixed set of constructions, remains a registered conjecture.
papers/latex/vol-11-completeness-obstructions.tex-61-
papers/latex/vol-11-completeness-obstructions.tex-62-Impossibility theorems bound the structure of classification programs as tightly as exhaustive enumerations do. A theorem showing that no complete invariant or parameter space can exist in a stated generality marks the same kind of mathematical boundary as a theorem listing the objects. The analysis below works out those boundaries for mathematical representations of physical systems: it compiles seven proved obstruction theorems, refutes three natural completions of the universal classification conjecture on explicit counterexamples, and keeps the conjecture itself as an object of study rather than a premise.
papers/latex/vol-11-completeness-obstructions.tex-63-
papers/latex/vol-11-completeness-obstructions.tex-64-Seven proved obstruction theorems forbid specific forms of classification, and a regime taxonomy applies them to every domain surveyed in the series. A transport theorem, proved here, shows the obstructions survive fully faithful re-presentation of a domain, and three counterexamples, also proved here, refute natural completions of the universal classification problem.
papers/latex/vol-11-completeness-obstructions.tex-65-
papers/latex/vol-11-completeness-obstructions.tex-66-Established results are cited to the mathematical literature and are used at the strength their proofs support. New statements are proved in full or narrowed until they can be. Counterexample search is part of the method and not an afterthought: for every natural completion of the classification picture considered here, an explicit counterexample was sought, and three completions failed the search. Computational experiments accompany the paper as evidence about finite instances; they are never treated as proofs.
papers/latex/vol-11-completeness-obstructions.tex-67-
papers/latex/vol-11-completeness-obstructions.tex:68:Wild embeddings and invariant obstructions transport along fully faithful functors, so a wild or undecidable sector embedded in the manner of \Cref{thm:transport} carries its obstruction into the larger domain. The surveyed domains occupy seven distinct regimes, and no coarser taxonomy places them all. Three natural strengthenings of the universal classification conjecture are false: the number of exceptional isomorphism classes in the operator-algebra sector is uncountable, the two-regime picture of classified versus impossible is refuted by concrete domains, and equivalence defined at the plain tensor layer fails to identify systems correctly. The universal conjecture itself, examined against its five proof obligations, has four open obligations and one partial obligation, and its statement is conditional on an unfixed admissibility list.
papers/latex/vol-11-completeness-obstructions.tex-69-
papers/latex/vol-11-completeness-obstructions.tex-70-\section{Definitions and standing constraints}
papers/latex/vol-11-completeness-obstructions.tex-71-
papers/latex/vol-11-completeness-obstructions.tex-72-\subsection{Classification problem}
papers/latex/vol-11-completeness-obstructions.tex-73-
papers/latex/vol-11-completeness-obstructions.tex-74-\begin{definition}[Representation]
--
papers/latex/vol-11-completeness-obstructions.tex-79-The tuple of \Cref{def:tuple} is the coordinate record of the series. The classification problem is
papers/latex/vol-11-completeness-obstructions.tex-80-\[
papers/latex/vol-11-completeness-obstructions.tex-81-\mathrm{Classify}\bigl(\mathrm{Ob}(\mathrm{Phys})/{\simeq}\bigr),
papers/latex/vol-11-completeness-obstructions.tex-82-\]
papers/latex/vol-11-completeness-obstructions.tex-83-the classification of representations up to a carefully chosen equivalence $\simeq$.
papers/latex/vol-11-completeness-obstructions.tex-84-
papers/latex/vol-11-completeness-obstructions.tex:85:Notation is fixed as follows. The symbol $\simeq$ stands for an equivalence relation on objects of a category and $\cong$ for isomorphism; when a domain is introduced, its equivalence is named. The letters $\mathcal{A}$ and $\mathcal{C}$ denote categories, $D$ denotes a domain of objects with an equivalence relation, and $k$ denotes a field. Isomorphism classes are written $\mathrm{Ob}(\mathcal{A})/{\cong}$. The symbol $*$ marks the adjoint of operator-algebraic structures. All classification statements in this paper are statements about mathematical representations, and none is a statement about empirical selection among physical theories.
papers/latex/vol-11-completeness-obstructions.tex-86-
papers/latex/vol-11-completeness-obstructions.tex-87-Two equivalence notions must be kept apart. Mathematical equivalence is isomorphism of the tuples in the ambient category of each component. Physical equivalence is a chosen relation on objects for which two mathematically different descriptions count as the same system; the choice is load-bearing and is not settled. Every equivalence used to identify systems must state which layer of structure it preserves, and equivalences that forget the monoidal or symmetric layer are provably insufficient \cite{eg2000}. The counterexample is recorded in the register and restated as \Cref{prop:equiv}.
papers/latex/vol-11-completeness-obstructions.tex-88-
papers/latex/vol-11-completeness-obstructions.tex:89:Obstructions proved for mathematical isomorphism constrain physical equivalence directly on every subsector where physical equivalence coincides with isomorphism. On any subsector where two systems are physically equivalent if and only if their representations are isomorphic, wildness, undecidability, and non-classifiability transfer unconditionally. Coarser physical equivalences can identify additional representations globally, but they cannot dissolve proved mathematical obstructions on subsectors where isomorphism is preserved.
papers/latex/vol-11-completeness-obstructions.tex-90-
papers/latex/vol-11-completeness-obstructions.tex-91-Yoneda embeddings preserve mathematical structure but cannot determine physical equivalence, empirical adequacy, or classification boundaries. Representing a system $P$ through its functor of points $\operatorname{Hom}(-, P)$ provides relational data without identifying which relational differences are physically observable. The standing qualification of the program binds every such use and is quoted verbatim: Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem. Relational embeddings therefore cannot discharge the equivalence and completeness obligations of Section 7.
papers/latex/vol-11-completeness-obstructions.tex-92-
papers/latex/vol-11-completeness-obstructions.tex-93-\begin{remark}[Schema and category]
papers/latex/vol-11-completeness-obstructions.tex-94-The morphisms of the program, coarse-graining, exact equivalence, embedding, duality, and limiting procedures, do not yet carry fixed preservation laws or composition rules. Until they do, the ambient object is a schema rather than a category. This paper therefore runs its arguments on standard mathematical categories with standard isomorphism relations, and it treats the physical reading of those arguments as conditional on the eventual fixings.
papers/latex/vol-11-completeness-obstructions.tex-95-\end{remark}
papers/latex/vol-11-completeness-obstructions.tex-96-
papers/latex/vol-11-completeness-obstructions.tex-97-\subsection{Admissibility}
papers/latex/vol-11-completeness-obstructions.tex-98-
papers/latex/vol-11-completeness-obstructions.tex-99-\begin{definition}[Admissible class and closure]
papers/latex/vol-11-completeness-obstructions.tex-100-\label{def:adm}
papers/latex/vol-11-completeness-obstructions.tex:101:An admissible representation is one satisfying four consistency conditions: internal consistency of the five components of \Cref{def:tuple}; closure of the observable algebra under its stated operations; existence of a well-posed dynamics; and compatibility of symmetry data with composition. The full subcategory of admissible representations is $\mathrm{Phys}_{\mathrm{adm}}$. A structural family is a full subcategory of representations singled out by its underlying mathematical structure, and a family collection is a set $\mathfrak{F} = \{\mathfrak{F}_\alpha\}_{\alpha \in A}$ of them. The construction set $\mathfrak{C}$ consists of tensor product, direct sum, extension, limits and colimits, and factorization, and the closure $\langle \mathfrak{F}_\alpha \rangle_{\mathfrak{C}}$ is the smallest class containing $\mathfrak{F}$ and closed under $\mathfrak{C}$.
papers/latex/vol-11-completeness-obstructions.tex-102-\end{definition}
papers/latex/vol-11-completeness-obstructions.tex-103-
papers/latex/vol-11-completeness-obstructions.tex-104-The central conjecture of the program asserts
papers/latex/vol-11-completeness-obstructions.tex-105-\[
papers/latex/vol-11-completeness-obstructions.tex-106-\mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F}_\alpha \rangle_{\mathfrak{C}}
papers/latex/vol-11-completeness-obstructions.tex-107-\]
--
papers/latex/vol-11-completeness-obstructions.tex-111-\label{rem:unfixed}
papers/latex/vol-11-completeness-obstructions.tex-112-Completeness of a classification over $\mathrm{Phys}_{\mathrm{adm}}$ cannot be evaluated against a moving premise. Until the admissibility list is fixed, the first proof obligation of the universal classification conjecture is not merely open; its statement is conditional. This is an obstruction of an internal kind, and it is the reason the analysis below runs on domains with standard mathematical definitions rather than on $\mathrm{Phys}_{\mathrm{adm}}$ itself.
papers/latex/vol-11-completeness-obstructions.tex-113-\end{remark}
papers/latex/vol-11-completeness-obstructions.tex-114-
papers/latex/vol-11-completeness-obstructions.tex-115-\subsection{Claim discipline}
papers/latex/vol-11-completeness-obstructions.tex-116-
papers/latex/vol-11-completeness-obstructions.tex:117:Three levels of achievement are distinguished throughout: mathematical formulation, rigorous theorem, and physical validation. The results of this paper sit at the second level. Nothing in this paper establishes physical validation of any representation, and no mathematical classification established here is presented as an empirical selection among physical theories. Where a claim rests on an announcement rather than a published proof, the text says so; one such claim is tracked in a remark outside the regime table.
papers/latex/vol-11-completeness-obstructions.tex-118-
papers/latex/vol-11-completeness-obstructions.tex-119-\section{Obstruction register}
papers/latex/vol-11-completeness-obstructions.tex-120-
papers/latex/vol-11-completeness-obstructions.tex:121:Each obstruction below is a proved theorem, and it decides a question a classification program would otherwise have to settle by effort. Two conventions govern the collection. Only theorems with complete proofs in the mathematical literature enter; announcements stay out until they are proved. And an obstruction is recorded at the generality its proof supports: an undecidability result about finitely presented groups says nothing about finite groups, and a wildness result about modules over a specific algebra says nothing about modules over algebras on the tame side. Reading the register is a matter of reading the quantifiers.
papers/latex/vol-11-completeness-obstructions.tex-122-
papers/latex/vol-11-completeness-obstructions.tex:123:Each row is a theorem, and each theorem decides a question that a classification program would otherwise have to decide by effort. The seven rows divide by the component of \Cref{def:program} they destroy: the invariant, the parameter space, the recognizer, or the equivalence itself.
papers/latex/vol-11-completeness-obstructions.tex-124-
papers/latex/vol-11-completeness-obstructions.tex-125-\subsection{Factor classification}
papers/latex/vol-11-completeness-obstructions.tex-126-
papers/latex/vol-11-completeness-obstructions.tex:127:The classification of von Neumann algebra factors reduces, by the Murray-von Neumann direct-integral decomposition, to the classification of factors, and the amenable factors are classified: types $\mathrm{I}_n$, $\mathrm{I}_\infty$, $\mathrm{II}_1$, $\mathrm{II}_\infty$, $\mathrm{III}_\lambda$ for $0 < \lambda \leq 1$, and $\mathrm{III}_0$, with the type $\mathrm{III}_0$ case described by ergodic flows \cite{connes1976,vnwiki}. Outside the amenable class the situation changes completely. McDuff proved in 1969 that there are uncountably many non-isomorphic separable type $\mathrm{II}_1$ factors \cite{mcduff1969}.
papers/latex/vol-11-completeness-obstructions.tex-128-
papers/latex/vol-11-completeness-obstructions.tex:129:What this forbids is a total classification of factors in the style of the classification of finite simple groups: no list of families and finitely many exceptions can exhaust the separable $\mathrm{II}_1$ factors, and no countable table of isomorphism classes can be complete. What it permits is a classification of the amenable class, which exists, and stratification of the general case by invariants of coarser grain, such as the Connes spectrum, which records partial information only \cite{vnwiki}.
papers/latex/vol-11-completeness-obstructions.tex-130-
papers/latex/vol-11-completeness-obstructions.tex-131-\subsection{Tensor-category recovery}
papers/latex/vol-11-completeness-obstructions.tex-132-\label{sec:tensor-recovery}
papers/latex/vol-11-completeness-obstructions.tex-133-
papers/latex/vol-11-completeness-obstructions.tex-134-A natural proposal for identifying physical systems is to compare their representation categories as tensor categories and declare two systems equivalent when the categories are equivalent. The proposal fails. Etingof and Gelaki constructed pairs of non-isomorphic finite groups whose representation categories are equivalent as plain tensor categories \cite{eg2000}. The symmetric structure of the category is not recoverable from the plain tensor layer, and two different symmetry groups present the same plain tensor representation theory.
papers/latex/vol-11-completeness-obstructions.tex-135-
papers/latex/vol-11-completeness-obstructions.tex-136-What this forbids is any classification or equivalence criterion that discards the monoidal or symmetric layer: such a criterion is not merely imprecise, it is false on explicit counterexamples. What it permits is the Doplicher-Roberts style of reconstruction, which takes the symmetric tensor structure with its conjugates, direct sums, subobjects, and $\operatorname{End}(1) = \mathbb{C}$ as input and recovers a compact supergroup unique up to isomorphism \cite{eg2000}. The counterexample is the sharpest constraint in the register, and it is applied twice more in this paper: as an impossibility theorem in the transport analysis, and as a counterexample to a natural completion of the universal conjecture.
papers/latex/vol-11-completeness-obstructions.tex-137-
papers/latex/vol-11-completeness-obstructions.tex:138:\subsection{Markov undecidability}
papers/latex/vol-11-completeness-obstructions.tex-139-
papers/latex/vol-11-completeness-obstructions.tex:140:A classification program can aim at an algorithm: given a presentation of an object, decide which isomorphism class it lies in. For finitely presented groups this aim fails at the root. Adyan and Rabin proved that every Markov property of finitely presentable groups is algorithmically undecidable \cite{adyan1955,rabin1958}. The list of Markov properties includes being trivial, being finite, and being simple, so even the coarsest structural tests on finitely presented groups admit no uniform decision procedure. Collins extended undecidability beyond Markov properties, proving that the Hopfian property is undecidable even though neither it nor its negation is Markov \cite{collins1969}.
papers/latex/vol-11-completeness-obstructions.tex-141-
papers/latex/vol-11-completeness-obstructions.tex-142-What this forbids is any uniform recognition procedure for group-flavored sectors of a classification, including recognition of finiteness and simplicity. What it permits is decision of the same properties on restricted subclasses where the Markov construction does not embed, and it permits recognition procedures that are partial or that come with error. The proof reduces the halting problem to the group property through a Markov set construction, and Section 5 builds transport results on the same reduction pattern.
papers/latex/vol-11-completeness-obstructions.tex-143-
papers/latex/vol-11-completeness-obstructions.tex-144-\subsection{Wildness}
papers/latex/vol-11-completeness-obstructions.tex-145-
papers/latex/vol-11-completeness-obstructions.tex:146:The tame-wild dichotomy of Drozd is the boundary of parametrizable representation theory. Bekkert and Drozd proved that every finite-dimensional algebra over an algebraically closed field is derived-tame or derived-wild, and that any degeneration of a derived-wild algebra is again derived-wild \cite{bekkert2003}. Wildness is a property of the category of representations, and it is a non-classifiability statement rather than a difficulty rating. Buchweitz and Leuschke showed that the Cohen-Macaulay representation theory of the generic determinant is wild in a strong sense: already in rank two the isomorphism classes cannot be parametrized by a finite-dimensional variety over the coefficients \cite{buchweitz2005}. Grevstad and May proved that the cohomological Mackey algebra is derived-wild whenever the group surjects onto a $p$-group of order greater than two, and concluded that no meaningful classification of compact $C_p$-equivariant $H\underline{\mathbb{F}}_p$-modules exists at odd primes \cite{grevstad2025}.
papers/latex/vol-11-completeness-obstructions.tex-147-
papers/latex/vol-11-completeness-obstructions.tex:148:What this forbids is any finite-variety parameterization of the isomorphism classes of a wild representation category, and any classification of a domain that contains such a category as an isomorphism-reflecting subcategory. What it permits is a complete classification theory on the tame side, where parametrizations do exist, and partial invariants on the wild side that ignore the wild core.
papers/latex/vol-11-completeness-obstructions.tex-149-
papers/latex/vol-11-completeness-obstructions.tex-150-\subsection{Four-manifold unrecognizability}
papers/latex/vol-11-completeness-obstructions.tex-151-
papers/latex/vol-11-completeness-obstructions.tex:152:In dimension three the geometrization theorem decomposes every oriented prime closed 3-manifold into pieces carrying one of exactly eight Thurston geometries \cite{geometrization}. In dimension four the finite-table picture breaks. Markov's construction shows that unrecognizable four-manifolds exist, that is, manifolds for which the homeomorphism problem is undecidable. Tancer sharpened the construction to show that the connected sum of nine copies of $S^2 \times S^2$ is unrecognizable, improving the previous bound of twelve due to Gordon \cite{tancer2023}. Filipkiewicz classified the four-dimensional maximal model geometries and found eighteen of them plus one countably infinite family, against exactly eight in dimension three \cite{geometrization,perelman,hillman}.
papers/latex/vol-11-completeness-obstructions.tex-153-
papers/latex/vol-11-completeness-obstructions.tex-154-What this forbids is any effective classification of four-manifolds in general, and any assumption that the finite-list paradigm of dimension three persists upward. What it permits is classification of restricted four-manifold classes, and the dimension contrast itself: finite tables exist in tame regimes, and dimension four is not one of them.
papers/latex/vol-11-completeness-obstructions.tex-155-
papers/latex/vol-11-completeness-obstructions.tex-156-\subsection{Countable invariants}
papers/latex/vol-11-completeness-obstructions.tex-157-
papers/latex/vol-11-completeness-obstructions.tex-158-Descriptive set theory supplies a machine for proving that no classification by countable invariants can exist. Sasyk and Tørnquist applied Borel reducibility and Hjorth's theory of turbulence to the isomorphism relation for separable von Neumann algebras \cite{sasyk2009}. The result, as recorded in the survey that this series relies on, is that isomorphism of separable von Neumann algebras admits no classification by countable invariants. The result is published in the Bulletin of Symbolic Logic, with the complete proof in Inventiones Mathematicae \cite{sasyk2009}.
--
papers/latex/vol-11-completeness-obstructions.tex-175-\label{tab:register}
papers/latex/vol-11-completeness-obstructions.tex-176-\small
papers/latex/vol-11-completeness-obstructions.tex-177-\begin{tabular}{L{3.2cm}L{4.6cm}L{4.6cm}}
papers/latex/vol-11-completeness-obstructions.tex-178-\toprule
papers/latex/vol-11-completeness-obstructions.tex-179-Obstruction & Statement & Forbidden classification form \\
papers/latex/vol-11-completeness-obstructions.tex-180-\midrule
papers/latex/vol-11-completeness-obstructions.tex:181:McDuff 1969 & Uncountably many non-isomorphic separable $\mathrm{II}_1$ factors & Total factor classification outside the amenable class \\
papers/latex/vol-11-completeness-obstructions.tex-182-Etingof-Gelaki & Non-isomorphic groups with equivalent plain tensor representation categories & Equivalence discarding the symmetric layer \\
papers/latex/vol-11-completeness-obstructions.tex:183:Adyan-Rabin & Every Markov property of finitely presentable groups is undecidable & Uniform recognition of group-flavored properties \\
papers/latex/vol-11-completeness-obstructions.tex:184:Wildness & Wild categories admit no finite-variety parametrization of isomorphism classes & Finite-variety parameterization of wild sectors \\
papers/latex/vol-11-completeness-obstructions.tex-185-Tancer 2023 & Nine-fold connected sum of $S^2 \times S^2$ is unrecognizable & Effective classification of four-manifolds \\
papers/latex/vol-11-completeness-obstructions.tex-186-Sasyk-Tørnquist & vN algebra isomorphism admits no classification by countable invariants & Countable-valued complete invariants \\
papers/latex/vol-11-completeness-obstructions.tex-187-Grochow-Qiao & Tame extensions tractable, wild bounds fail & Uniform polynomial-time classification across the boundary \\
papers/latex/vol-11-completeness-obstructions.tex-188-\bottomrule
papers/latex/vol-11-completeness-obstructions.tex-189-\end{tabular}
papers/latex/vol-11-completeness-obstructions.tex-190-\end{table}
--
papers/latex/vol-11-completeness-obstructions.tex-194-\subsection{Classification program data}
papers/latex/vol-11-completeness-obstructions.tex-195-
papers/latex/vol-11-completeness-obstructions.tex-196-The register forbids specific forms of classification. To compare those forms across domains, a classification program is decomposed into three pieces of data.
papers/latex/vol-11-completeness-obstructions.tex-197-
papers/latex/vol-11-completeness-obstructions.tex-198-\begin{definition}[Classification program]
papers/latex/vol-11-completeness-obstructions.tex-199-\label{def:program}
papers/latex/vol-11-completeness-obstructions.tex:200:Let $(D, \simeq)$ be a domain of objects with an equivalence relation. A classification program for $(D, \simeq)$ is a triple $(\iota, \Pi, R)$ where $\iota$ is a complete invariant, a map from objects to a set $I$ with $\iota(x) = \iota(y)$ if and only if $x \simeq y$; $\Pi$ is a parameter space, a structured object together with a structure-compatible surjection onto the $\simeq$-classes of $D$; and $R$ is a recognizer, a procedure that decides $x \simeq y$ from finite presentations of $x$ and $y$. The structure of $\Pi$ is part of the data: it is a finite-dimensional $k$-variety with an algebraic family, a standard Borel space with a Borel parametrization, or a finite combinatorial set. Without that structure $\Pi$ is just another name for the class set and carries no content beyond $\iota$.
papers/latex/vol-11-completeness-obstructions.tex-201-\end{definition}
papers/latex/vol-11-completeness-obstructions.tex-202-
papers/latex/vol-11-completeness-obstructions.tex:203:\begin{definition}[Finite-variety parametrization]
papers/latex/vol-11-completeness-obstructions.tex-204-\label{def:param}
papers/latex/vol-11-completeness-obstructions.tex:205:The isomorphism classes of a category $\mathcal{A}$ over a field $k$ are parametrized by a finite-dimensional variety when there are a finite-dimensional $k$-variety $V$ and an algebraic family of objects $\{A_v\}_{v \in V(k)}$ of $\mathcal{A}$ such that every object of $\mathcal{A}$ is isomorphic to some fiber $A_v$. A bare set-theoretic surjection $V(k) \twoheadrightarrow \mathrm{Ob}(\mathcal{A})/{\cong}$ is not a parametrization: when $k$ is uncountable the cardinality of $V(k)$ exceeds the class set of any tame category, so such maps exist trivially and carry no geometric information.
papers/latex/vol-11-completeness-obstructions.tex-206-\end{definition}
papers/latex/vol-11-completeness-obstructions.tex-207-
papers/latex/vol-11-completeness-obstructions.tex:208:\Cref{def:param} is the notion the wildness results refute. Buchweitz and Leuschke show that in rank two the isomorphism classes of the generic determinant's Cohen-Macaulay modules admit no parametrization by a finite-dimensional variety over the coefficients \cite{buchweitz2005}, in exactly the algebraic-family sense of \Cref{def:param}.
papers/latex/vol-11-completeness-obstructions.tex-209-
papers/latex/vol-11-completeness-obstructions.tex-210-The classification of finite simple groups delivers an exhaustive list, and practical identification runs through companion data of the Atlas kind: order, Schur multiplier, outer automorphism group, presentations, character tables with power maps \cite{atlaswiki}. What it does not deliver is a uniform parameterization. Gorenstein's verdict is the recorded one: no clean uniform description of the finite simple groups analogous to Dynkin diagrams is known \cite{solomon2001}. The classification is complete and its parameterization is missing, so completeness of the list and existence of a parameter space are different achievements. The Killing-Cartan classification of complex semisimple Lie algebras achieves both: Dynkin diagrams parameterize, the invariant is complete, and recognition is algorithmic \cite{humphreys,fultonharris}. Darboux's theorem shows a third configuration: locally, symplectic manifolds of the same dimension are all equivalent, so the local classification is complete and trivial and its content is entirely global \cite{darboux}.
papers/latex/vol-11-completeness-obstructions.tex-211-
papers/latex/vol-11-completeness-obstructions.tex-212-\begin{lemma}[Countable invariants]
papers/latex/vol-11-completeness-obstructions.tex-213-\label{lem:countable}
papers/latex/vol-11-completeness-obstructions.tex-214-If the isomorphism relation on a domain $D$ admits no classification by countable invariants in the descriptive-set-theoretic sense, that is, if it is not Borel reducible to the isomorphism relation of any class of countable structures, then no complete invariant of $D$ takes values in a space of countable structures. If in addition $D$ has more than countably many isomorphism classes, then no complete invariant of $D$ takes values in a countable set.
papers/latex/vol-11-completeness-obstructions.tex-215-\end{lemma}
papers/latex/vol-11-completeness-obstructions.tex-216-
papers/latex/vol-11-completeness-obstructions.tex-217-\begin{proof}
papers/latex/vol-11-completeness-obstructions.tex-218-A complete invariant whose values are countable structures, taken with a Borel assignment of the structure to the object, is a classification by countable invariants and would give a Borel reduction to the isomorphism of those structures. For the second claim, a complete invariant with countable range has countably many fibers, so the class set is countable.
papers/latex/vol-11-completeness-obstructions.tex-219-\end{proof}
papers/latex/vol-11-completeness-obstructions.tex-220-
papers/latex/vol-11-completeness-obstructions.tex:221:For the separable $\mathrm{II}_1$ factors the second claim of \Cref{lem:countable} is already settled by McDuff's uncountable family \cite{mcduff1969}. The first claim is stronger: for general separable von Neumann algebras even invariants valued in countable structures, K-theory data of that kind, fail to classify isomorphism \cite{sasyk2009}. A cardinality bound and a Borel-reducibility bound are different statements, and the arguments below invoke each where it applies.
papers/latex/vol-11-completeness-obstructions.tex-222-
papers/latex/vol-11-completeness-obstructions.tex-223-\begin{remark}[Two instances of the definition]
papers/latex/vol-11-completeness-obstructions.tex-224-Finite-dimensional complex $C^*$-algebras instantiate \Cref{def:program} with $\iota$ the dimension vector, $\Pi$ the finite set of multisets of block sizes, and $R$ the block decomposition algorithm. Finitely presented groups under isomorphism instantiate it with the obstruction register in place of the components: $\iota$ exists set-theoretically, no algebraic-family $\Pi$ is expected in the wild sectors, and $R$ does not exist at all in the presence of Markov reductions. The two instances show that the definition is neutral between regimes; the regimes are properties of the evidence, not of the definition.
papers/latex/vol-11-completeness-obstructions.tex-225-\end{remark}
papers/latex/vol-11-completeness-obstructions.tex-226-
papers/latex/vol-11-completeness-obstructions.tex-227-\subsection{The seven regimes}
papers/latex/vol-11-completeness-obstructions.tex-228-
papers/latex/vol-11-completeness-obstructions.tex-229-\begin{definition}[Regimes]
papers/latex/vol-11-completeness-obstructions.tex-230-\label{def:regime}
papers/latex/vol-11-completeness-obstructions.tex:231:A domain $(D, \simeq)$ with a classification program lies in one of seven regimes. \emph{Parameterized}: all three components exist and $\Pi$ is one of the structured kinds of \Cref{def:program}, a finite combinatorial set, a finite-dimensional variety with an algebraic family, or a standard Borel space with a Borel parametrization. \emph{Unparameterized}: $\iota$ and $R$ exist, no uniform $\Pi$ is known. \emph{Obstruction-complete}: the classification content is a proved impossibility theorem, so the classification is the obstruction. \emph{Open}: partial results exist and no impossibility theorem applies. \emph{Wild}: finite-variety parametrization is provably impossible and isomorphism classes grow without bound in every proposed parameter dimension. \emph{Undecidable}: $R$ is provably nonexistent in the stated generality. \emph{Decidable-but-unclassified}: $R$ exists and no complete $\iota$ is known.
papers/latex/vol-11-completeness-obstructions.tex-232-\end{definition}
papers/latex/vol-11-completeness-obstructions.tex-233-
papers/latex/vol-11-completeness-obstructions.tex-234-The regimes are not a partition of a single mathematical universe. They are a partition of the surveyed domains of the series by the shape of their classification evidence, and the assignment in \Cref{tab:regimes} is checked computationally in Section 8. The regime vocabulary is the deliverable the periodic table of the program needs: a table must mark where no table can exist, and the seven regimes are the marks available.
papers/latex/vol-11-completeness-obstructions.tex-235-
papers/latex/vol-11-completeness-obstructions.tex:236:Each regime has an archetype. The Killing-Cartan classification is the archetype of the parameterized regime; the classification of finite simple groups is the archetype of the unparameterized regime; anomaly classification is the archetype of obstruction-complete; fusion categories are the archetype of open; the Cohen-Macaulay modules of the generic determinant are the archetype of wild; Markov properties of finitely presented groups are the archetype of undecidable; and unknot recognition is the archetype of decidable-but-unclassified. The archetypes are proved mathematics in every case, so the taxonomy rests on theorems rather than on analogy.
papers/latex/vol-11-completeness-obstructions.tex-237-
papers/latex/vol-11-completeness-obstructions.tex-238-\subsection{Assignment of surveyed domains}
papers/latex/vol-11-completeness-obstructions.tex-239-
papers/latex/vol-11-completeness-obstructions.tex-240-\Cref{tab:regimes} assigns each domain from the literature survey of the series to a regime. The proofs behind the assignments are the register of Section 3 and the classification theorems cited in the survey.
papers/latex/vol-11-completeness-obstructions.tex-241-
papers/latex/vol-11-completeness-obstructions.tex-242-\begingroup
--
papers/latex/vol-11-completeness-obstructions.tex-260-Simple Lie algebras & Parameterized & Dynkin and Satake diagrams \cite{humphreys,fultonharris} \\
papers/latex/vol-11-completeness-obstructions.tex-261-Highest-weight irreps & Parameterized & Dominant integral weights \cite{humphreys,fultonharris} \\
papers/latex/vol-11-completeness-obstructions.tex-262-Finite-dim $C^*$-algebras & Parameterized & Dimension vector \cite{cstarwiki} \\
papers/latex/vol-11-completeness-obstructions.tex-263-Principal $G$-bundles & Parameterized & Maps into the classifying space \cite{cstarwiki} \\
papers/latex/vol-11-completeness-obstructions.tex-264-Classical monotone metrics & Parameterized & Fisher metric unique up to constant \cite{petzsudar} \\
papers/latex/vol-11-completeness-obstructions.tex-265-Local symplectic germs & Parameterized & Darboux normal form \cite{darboux} \\
papers/latex/vol-11-completeness-obstructions.tex:266:Amenable factors & Parameterized & Type and Connes invariants \cite{vnwiki} \\
papers/latex/vol-11-completeness-obstructions.tex-267-Finite simple groups & Unparameterized & Complete list, no uniform parameterization \cite{solomon2001} \\
papers/latex/vol-11-completeness-obstructions.tex-268-Quantum monotone metrics & Unparameterized & Operator monotone functions, infinite family \cite{petzsudar} \\
papers/latex/vol-11-completeness-obstructions.tex-269-Anomalies & Obstruction-complete & Cohomological obstruction classes \cite{cstarwiki} \\
papers/latex/vol-11-completeness-obstructions.tex:270:General $\mathrm{II}_1$ factors & Obstruction-complete & McDuff's theorem \cite{mcduff1969} \\
papers/latex/vol-11-completeness-obstructions.tex-271-Plain tensor category recovery & Obstruction-complete & Etingof-Gelaki counterexamples \cite{eg2000} \\
papers/latex/vol-11-completeness-obstructions.tex-272-Fusion categories & Open & Weak Hopf algebra presentation known \cite{fusionnlab} \\
papers/latex/vol-11-completeness-obstructions.tex-273-Elliott nuclear program & Open & Program unfinished \cite{cstarwiki} \\
papers/latex/vol-11-completeness-obstructions.tex-274-Holographic entropy cone, $n \geq 5$ & Open & One inequality family known \cite{cstarwiki} \\
papers/latex/vol-11-completeness-obstructions.tex-275-Extended TQFTs & Open & Classification claim carries a proof gap \cite{lurie2009} \\
papers/latex/vol-11-completeness-obstructions.tex-276-Yang-Mills mass gap & Open & Clay lists the problem unsolved \cite{clay} \\
papers/latex/vol-11-completeness-obstructions.tex:277:Type III factors & Open & Coarse Connes strata only \cite{vnwiki} \\
papers/latex/vol-11-completeness-obstructions.tex:278:Wild CM modules of the generic determinant & Wild & No finite-variety parametrization \cite{buchweitz2005} \\
papers/latex/vol-11-completeness-obstructions.tex-279-$C_p$-equivariant modules at odd primes & Wild & Derived-wild Mackey algebra \cite{grevstad2025} \\
papers/latex/vol-11-completeness-obstructions.tex-280-Derived-wild algebras & Wild & Wildness holds under degeneration \cite{bekkert2003} \\
papers/latex/vol-11-completeness-obstructions.tex-281-Finitely presented groups, Markov properties & Undecidable & Adyan-Rabin \cite{rabin1958} \\
papers/latex/vol-11-completeness-obstructions.tex-282-Four-manifold homeomorphism & Undecidable & Unrecognizable connected sums \cite{tancer2023} \\
papers/latex/vol-11-completeness-obstructions.tex-283-vN algebra isomorphism & Obstruction-complete & No classification by countable structures \cite{sasyk2009} \\
papers/latex/vol-11-completeness-obstructions.tex-284-Unknot recognition & Decidable-but-unclassified & In NP and coNP, P open \cite{hass1999,lackenby2021} \\
--
papers/latex/vol-11-completeness-obstructions.tex-308-\subsection{Regime stability}
papers/latex/vol-11-completeness-obstructions.tex-309-
papers/latex/vol-11-completeness-obstructions.tex-310-The regime assignment of \Cref{tab:regimes} is dated evidence, and three kinds of event move rows.
papers/latex/vol-11-completeness-obstructions.tex-311-
papers/latex/vol-11-completeness-obstructions.tex-312-A new theorem moves a row upward in the table. The fusion-category row moves from open to parameterized or unparameterized if the structural conjecture in that area closes; the Elliott program row moves when the program completes or when a counterexample to its uniqueness conjecture is proved; the four-dimensional existence row moves when the announced manuscript and its formalization are released and verified \cite{openai,kitp,cstarwiki,fusionnlab}.
papers/latex/vol-11-completeness-obstructions.tex-313-
papers/latex/vol-11-completeness-obstructions.tex:314:A new obstruction moves a row downward. A proof that a recognition problem is unrecognizable, or that a representation category is wild, moves its domain into undecidable or wild and, by \Cref{thm:transport}, moves every domain containing it isomorphism-reflectingly.
papers/latex/vol-11-completeness-obstructions.tex-315-
papers/latex/vol-11-completeness-obstructions.tex-316-A change of equivalence moves rows sideways. If a domain is redefined under a coarser equivalence, its invariant becomes complete or incomplete for reasons that have nothing to do with new theorems; \Cref{prop:equiv} is exactly such a case at the level of groups. The taxonomy is therefore a record of theorems and of a chosen equivalence, and both must be read with it.
papers/latex/vol-11-completeness-obstructions.tex-317-
papers/latex/vol-11-completeness-obstructions.tex-318-\section{Nonclassification results}
papers/latex/vol-11-completeness-obstructions.tex-319-
papers/latex/vol-11-completeness-obstructions.tex:320:Obstructions propagate along embeddings: a wild or undecidable sector carried by a fully faithful functor that is injective on isomorphism classes brings its failure with it into the larger domain, and undecidability transports along computable reductions. Three natural completions of the classification picture fail on explicit counterexamples.
papers/latex/vol-11-completeness-obstructions.tex-321-
papers/latex/vol-11-completeness-obstructions.tex-322-\subsection{Obstruction transport}
papers/latex/vol-11-completeness-obstructions.tex-323-
papers/latex/vol-11-completeness-obstructions.tex-324-\begin{definition}[Isomorphism-injective functor]
papers/latex/vol-11-completeness-obstructions.tex-325-\label{def:injfun}
papers/latex/vol-11-completeness-obstructions.tex-326-A functor $F: \mathcal{A} \to \mathcal{C}$ is isomorphism-injective when $F(A) \cong F(B)$ implies $A \cong B$ for all objects $A, B$ of $\mathcal{A}$. Every fully faithful functor is isomorphism-injective: the inverse of an isomorphism $F(A) \cong F(B)$ lifts to a morphism over $B$, and the lifted composites are identities by uniqueness of preimages.
--
papers/latex/vol-11-completeness-obstructions.tex-328-
papers/latex/vol-11-completeness-obstructions.tex-329-\begin{theorem}[Obstruction transport]
papers/latex/vol-11-completeness-obstructions.tex-330-\label{thm:transport}
papers/latex/vol-11-completeness-obstructions.tex-331-Let $F: \mathcal{A} \to \mathcal{C}$ be fully faithful.
papers/latex/vol-11-completeness-obstructions.tex-332-\begin{enumerate}
papers/latex/vol-11-completeness-obstructions.tex-333-\item If $\mathcal{A}$ has uncountably many isomorphism classes, so does $\mathcal{C}$, and if no complete invariant of $\mathcal{A}$ takes values in a countable set, none for $\mathcal{C}$ does either. If $\mathcal{A}$ and $\mathcal{C}$ are categories of structures on standard Borel spaces of objects and $F$ acts Borel-measurably on those spaces, then classification of the isomorphism relation of $\mathcal{C}$ by countable structures implies the same for $\mathcal{A}$; hence non-classifiability by countable structures transports from $\mathcal{A}$ to $\mathcal{C}$.
papers/latex/vol-11-completeness-obstructions.tex:334:\item If $\mathcal{A}$ carries a wild embedding, a family of objects with the matrix-pair universality property of the tame-wild dichotomy, then $\mathcal{C}$ carries the same wild embedding composed with $F$. Every non-parametrization or non-classification conclusion whose hypothesis is such an embedding, as in the wildness results of the register, is then available for the embedded family in $\mathcal{C}$ on the same footing as in $\mathcal{A}$.
papers/latex/vol-11-completeness-obstructions.tex-335-\end{enumerate}
papers/latex/vol-11-completeness-obstructions.tex-336-\end{theorem}
papers/latex/vol-11-completeness-obstructions.tex-337-
papers/latex/vol-11-completeness-obstructions.tex-338-\begin{proof}
papers/latex/vol-11-completeness-obstructions.tex-339-$F$ is isomorphism-injective by \Cref{def:injfun}, so it induces an injection $F_*: \mathrm{Ob}(\mathcal{A})/{\cong} \hookrightarrow \mathrm{Ob}(\mathcal{C})/{\cong}$ on isomorphism classes, and uncountability and the absence of countable-valued complete invariants transport by restriction of any hypothetical invariant to $\mathcal{A}$ along $F$. For the countable-structures claim, a Borel reduction of the isomorphism relation of $\mathcal{C}$ to the isomorphism of countable structures, composed with the Borel map $F$ induces on object spaces, is a Borel reduction for $\mathcal{A}$; contrapositively, none for $\mathcal{A}$ means none for $\mathcal{C}$. The Borel hypotheses are what make this composition legitimate; without them the claim is not asserted. For the wild embedding, the matrix-pair family in $\mathcal{A}$ maps to a family in $\mathcal{C}$ with identical $\operatorname{Hom}$-space dimensions, since $F$ is fully faithful, and identical isomorphism behavior, since $F$ is isomorphism-injective; the universality property is preserved verbatim.
papers/latex/vol-11-completeness-obstructions.tex-340-\end{proof}
papers/latex/vol-11-completeness-obstructions.tex-341-
papers/latex/vol-11-completeness-obstructions.tex:342:The wild-embedding clause transports the obstruction, not the conclusion about a category strictly larger than the embedded family. When a whole category is the wild family, as for the Cohen-Macaulay modules of the generic determinant \cite{buchweitz2005}, non-parametrization of the category follows in the sense of \Cref{def:param}. When the wild family sits inside a larger category, the proved non-parametrization statements apply to the essential image of the wild module category and to any subcategory of $\mathcal{C}$ equivalent to it; no claim is made about parametrizations of a category that strictly contains that image without an explicit moduli framework for the containment.
papers/latex/vol-11-completeness-obstructions.tex-343-
papers/latex/vol-11-completeness-obstructions.tex-344-\begin{corollary}[Wild embedding]
papers/latex/vol-11-completeness-obstructions.tex-345-\label{cor:wild}
papers/latex/vol-11-completeness-obstructions.tex:346:Let $\mathcal{C}$ be a category of representations admitting a fully faithful functor $F$ from the module category of a derived-wild finite-dimensional algebra. Then $\mathcal{C}$ carries a wild embedding, the essential image $F(\mathcal{A})$ admits no finite-variety parametrization of its isomorphism classes \cite{bekkert2003,buchweitz2005,grevstad2025}, and the same non-parametrization holds for any subcategory of $\mathcal{C}$ equivalent to that image.
papers/latex/vol-11-completeness-obstructions.tex-347-\end{corollary}
papers/latex/vol-11-completeness-obstructions.tex-348-
papers/latex/vol-11-completeness-obstructions.tex:349:\Cref{cor:wild} is the reason wildness is a structural fact about a domain and not a comment on the state of the art. The generic determinant's Cohen-Macaulay modules in rank two already defeat finite-variety parametrization \cite{buchweitz2005}, and the compact $C_p$-equivariant modules at odd primes carry no meaningful classification at all \cite{grevstad2025}. Any larger domain that embeds either category in the manner of the corollary carries the obstruction on its embedded part. The same pattern with \Cref{lem:countable} shows that a sector with no classification by countable structures forbids such classification for any domain receiving it along a Borel, fully faithful functor.
papers/latex/vol-11-completeness-obstructions.tex-350-
papers/latex/vol-11-completeness-obstructions.tex-351-\begin{corollary}[Operator-algebra consequence]
papers/latex/vol-11-completeness-obstructions.tex-352-\label{cor:opalg}
papers/latex/vol-11-completeness-obstructions.tex:353:Let $\mathcal{C}$ be the category of separable von Neumann algebras with normal *-homomorphisms as morphisms, taken with isomorphism as its equivalence. The separable $\mathrm{II}_1$ factors have uncountably many isomorphism classes \cite{mcduff1969}, so no complete invariant of $\mathcal{C}$ takes values in a countable set, and no atlas of countably many computable fingerprints can be complete for $\mathcal{C}$. The stronger statement holds: the isomorphism relation of $\mathcal{C}$ admits no classification by countable structures at all \cite{sasyk2009}.
papers/latex/vol-11-completeness-obstructions.tex-354-\end{corollary}
papers/latex/vol-11-completeness-obstructions.tex-355-
papers/latex/vol-11-completeness-obstructions.tex-356-\begin{proof}
papers/latex/vol-11-completeness-obstructions.tex-357-An atlas of countably many computable fingerprints assigns to each algebra a tuple of values from countable sets, and the combined map is a complete invariant with countable range if the atlas is complete; \Cref{lem:countable} and McDuff's uncountable family rule this out \cite{mcduff1969}. The stronger statement is the Borel-reducibility result of Sasyk and Tørnquist \cite{sasyk2009}.
papers/latex/vol-11-completeness-obstructions.tex-358-\end{proof}
papers/latex/vol-11-completeness-obstructions.tex-359-
papers/latex/vol-11-completeness-obstructions.tex-360-\Cref{cor:opalg} fixes the reach of the Atlas discipline of the model program, identification by finite tables of computable data \cite{atlaswiki}. That method is complete exactly where a countable-valued complete invariant exists and provably incomplete where uncountably many classes or the Borel-reducibility obstruction stand. The regime table records which domains admit an atlas at all.
papers/latex/vol-11-completeness-obstructions.tex-361-
papers/latex/vol-11-completeness-obstructions.tex-362-\subsection{Recognition reductions}
papers/latex/vol-11-completeness-obstructions.tex-363-
papers/latex/vol-11-completeness-obstructions.tex-364-\begin{proposition}[Undecidability transport]
papers/latex/vol-11-completeness-obstructions.tex-365-\label{prop:undec}
papers/latex/vol-11-completeness-obstructions.tex:366:Let $Q$ be a recognition problem for a class $\mathcal{C}$, and suppose there is a computable map $\varphi$ from finite group presentations to objects of $\mathcal{C}$ and a Markov property $P$ of finitely presentable groups such that a presentation $G$ has $P$ if and only if $\varphi(G)$ satisfies $Q$. Then $Q$ is algorithmically undecidable.
papers/latex/vol-11-completeness-obstructions.tex-367-\end{proposition}
papers/latex/vol-11-completeness-obstructions.tex-368-
papers/latex/vol-11-completeness-obstructions.tex-369-\begin{proof}
papers/latex/vol-11-completeness-obstructions.tex-370-A decision procedure for $Q$, composed with the computable map $\varphi$, decides $P$ on finite presentations. By the Adyan-Rabin theorem no such procedure exists for any Markov property \cite{adyan1955,rabin1958}. Hence none exists for $Q$.
papers/latex/vol-11-completeness-obstructions.tex-371-\end{proof}
papers/latex/vol-11-completeness-obstructions.tex-372-
papers/latex/vol-11-completeness-obstructions.tex:373:\Cref{prop:undec} is the shape of every undecidability entry in the register. Tancer's construction is an instance: the unrecognizability of the nine-fold connected sum of $S^2 \times S^2$ is proved through the Markov set construction carried into four-manifold topology \cite{tancer2023}. The proposition also explains why undecidability is a statement about the recognizer component of \Cref{def:program} and says nothing by itself about invariants or parameter spaces: an undecidable domain may still carry rich complete invariants that no algorithm can compute.
papers/latex/vol-11-completeness-obstructions.tex-374-
papers/latex/vol-11-completeness-obstructions.tex-375-\subsection{Counterexample catalogue}
papers/latex/vol-11-completeness-obstructions.tex-376-\label{sec:counterexamples}
papers/latex/vol-11-completeness-obstructions.tex-377-
papers/latex/vol-11-completeness-obstructions.tex-378-Each of the three natural strengthenings of the classification picture below fails on an explicit counterexample.
papers/latex/vol-11-completeness-obstructions.tex-379-
papers/latex/vol-11-completeness-obstructions.tex-380-\begin{proposition}[No finite sporadic list]
papers/latex/vol-11-completeness-obstructions.tex-381-\label{prop:sporadic}
papers/latex/vol-11-completeness-obstructions.tex:382:The hypothesis that the isomorphism classes of a completed classification decompose into infinite families plus finitely many exceptional objects is false for the operator-algebra sector and for four-dimensional geometry. The separable $\mathrm{II}_1$ factors number uncountably many isomorphism classes \cite{mcduff1969}, and the four-dimensional maximal model geometries number eighteen plus one countably infinite family \cite{geometrization}.
papers/latex/vol-11-completeness-obstructions.tex-383-\end{proposition}
papers/latex/vol-11-completeness-obstructions.tex-384-
papers/latex/vol-11-completeness-obstructions.tex-385-\begin{proof}
papers/latex/vol-11-completeness-obstructions.tex-386-Both lower bounds refute finiteness of the exceptional set: uncountably many classes cannot be listed as finitely many sporadics, and a countably infinite family of model geometries is not finite. Any classification whose final form is families plus finitely many sporadics is therefore false in these sectors before its completeness is even considered.
papers/latex/vol-11-completeness-obstructions.tex-387-\end{proof}
papers/latex/vol-11-completeness-obstructions.tex-388-
--
papers/latex/vol-11-completeness-obstructions.tex-405-\end{proof}
papers/latex/vol-11-completeness-obstructions.tex-406-
papers/latex/vol-11-completeness-obstructions.tex-407-\Cref{prop:equiv} is the counterexample the register promised for the third proof obligation of the universal conjecture. Choosing an equivalence relation is not a formality: the plain tensor choice is a natural one, it is stated in one line, and it is provably wrong. Every equivalence admitted in the program must name the layers of structure it preserves, and the symmetric layer is the one that recovers the group.
papers/latex/vol-11-completeness-obstructions.tex-408-
papers/latex/vol-11-completeness-obstructions.tex-409-\subsection{Common consequences}
papers/latex/vol-11-completeness-obstructions.tex-410-
papers/latex/vol-11-completeness-obstructions.tex:411:The four statements have a common consequence. Non-classifiability in the register is not a set of isolated pathologies; it travels along fully faithful embeddings (\Cref{thm:transport}), along computable maps (\Cref{prop:undec}), and it defeats three natural completion schemes (Propositions \ref{prop:sporadic} to \ref{prop:equiv}). A universal classification theorem for all admissible physical systems cannot be of CFSG form unless every wild, undecidable, and unrecognizable sector is excluded from its quantifiers. The exclusions are restrictions on the domain, and each restriction is a new admissibility condition of the kind that \Cref{rem:unfixed} records as unfixed.
papers/latex/vol-11-completeness-obstructions.tex-412-
papers/latex/vol-11-completeness-obstructions.tex-413-\subsection{Scope of the transport theorem}
papers/latex/vol-11-completeness-obstructions.tex-414-
papers/latex/vol-11-completeness-obstructions.tex-415-\Cref{thm:transport} quantifies over functors injective on isomorphism classes, and its hypotheses are mathematical. Three remarks delimit its use.
papers/latex/vol-11-completeness-obstructions.tex-416-
papers/latex/vol-11-completeness-obstructions.tex:417:The theorem transports refutations, not theorems. It moves wild embeddings and invariant obstructions from a subcategory to a larger category, and it moves undecidability along computable reductions. It does not transport positive classification results: a classification of a subcategory says nothing about the ambient category, which is why the completed islands of Section 6 each restate their own hypotheses.
papers/latex/vol-11-completeness-obstructions.tex-418-
papers/latex/vol-11-completeness-obstructions.tex-419-Full faithfulness is what carries the wild embedding, because it preserves the Hom-dimensions the universality property is built from; injectivity on isomorphism classes is what carries isomorphism behavior. Physical embeddings that deliberately identify systems fail the second hypothesis, and a coarse-graining map that forgets microscopic detail typically fails it as well, so the theorem is silent about classification programs run on coarse descriptions.
papers/latex/vol-11-completeness-obstructions.tex-420-
papers/latex/vol-11-completeness-obstructions.tex-421-The theorem applies at the level of domains, not of families. A family such as the operator-algebra family contains parameterized islands and obstruction-complete sectors side by side, and the transport theorem says which ambient domains inherit which failure. Regime assignment remains a domain-level judgment, and the two levels must not be confused.
papers/latex/vol-11-completeness-obstructions.tex-422-
papers/latex/vol-11-completeness-obstructions.tex-423-\section{Restricted classification results}
--
papers/latex/vol-11-completeness-obstructions.tex-426-
papers/latex/vol-11-completeness-obstructions.tex-427-\subsection{Completed islands}
papers/latex/vol-11-completeness-obstructions.tex-428-\label{sec:completed}
papers/latex/vol-11-completeness-obstructions.tex-429-
papers/latex/vol-11-completeness-obstructions.tex-430-The finite-dimensional complex $C^*$-algebras are classified completely. Every such algebra is a direct sum $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ of matrix algebras, and the multiset of matrix sizes, the dimension vector, determines $A$ up to *-isomorphism \cite{cstarwiki}. The classification program of \Cref{def:program} is fully realized here: the dimension vector is a complete invariant, the parameter space is the set of finite multisets of positive integers, and recognition is the finite computation of block decomposition. This is the model theorem of the series and the shape every restricted classification aims at.
papers/latex/vol-11-completeness-obstructions.tex-431-
papers/latex/vol-11-completeness-obstructions.tex:432:The amenable factors are classified as well: types $\mathrm{I}_n$, $\mathrm{I}_\infty$, $\mathrm{II}_1$, $\mathrm{II}_\infty$, $\mathrm{III}_\lambda$ for $0 < \lambda \leq 1$, and $\mathrm{III}_0$, with the invariant given by Murray-von Neumann type and Connes data \cite{connes1976,vnwiki}. The restriction is the word amenable. McDuff's theorem removes it and the classification dies \cite{mcduff1969}.
papers/latex/vol-11-completeness-obstructions.tex-433-
papers/latex/vol-11-completeness-obstructions.tex-434-Principal $G$-bundles over a base $X$ are classified by homotopy classes of maps into the classifying space, and the characteristic classes are exactly the pullbacks of universal classes \cite{cstarwiki}. The restriction is topological: the classification is up to bundle isomorphism and it records no connection data. Anomalies are classified on the obstruction pattern: the gauge anomaly is a pair of cohomology classes whose vanishing is the condition for quantization, so the classification content is the obstruction itself \cite{cstarwiki}.
papers/latex/vol-11-completeness-obstructions.tex-435-
papers/latex/vol-11-completeness-obstructions.tex-436-Doplicher-Roberts reconstruction classifies symmetric tensor *-categories with conjugates, direct sums, subobjects, and $\operatorname{End}(1) = \mathbb{C}$: such a category is the representation category of a compact supergroup, unique up to isomorphism \cite{eg2000}. The hypotheses are the restriction, and the Etingof-Gelaki counterexamples show that dropping the symmetric layer destroys the conclusion \cite{eg2000}. Deligne's theorem classifies symmetric tensor categories of subexponential growth in characteristic zero along the same lines \cite{eg2000}.
papers/latex/vol-11-completeness-obstructions.tex-437-
papers/latex/vol-11-completeness-obstructions.tex-438-Quantum channels occupy a middle position. Stinespring dilation classifies completely positive maps up to minimal dilation, unique up to unitary freedom, and the Choi-Kraus form is a normal form whose Kraus rank is an invariant of the form \cite{stinespring,cstarwiki}. The classification is of dilations, not of channels up to isomorphism, and the Kraus rank of a normal form is not an isomorphism invariant of the channel. This is a classification of a presentation, and the regime table places the domain in the unparameterized regime accordingly.
papers/latex/vol-11-completeness-obstructions.tex-439-
papers/latex/vol-11-completeness-obstructions.tex:440:The local symplectic classification is complete and trivial: Darboux's theorem gives local normal form with no local invariants, so the classification content of the symplectic side is entirely global and topological \cite{darboux}. In the opposite direction, the Killing-Cartan classification of semisimple Lie algebras and the highest-weight classification of their irreducible representations deliver complete invariants with parameterizations \cite{humphreys,fultonharris}. The geometrization theorem decomposes closed 3-manifolds into exactly eight Thurston geometries \cite{geometrization}, and Chentsov's theorem gives the Fisher metric as the unique metric monotone under stochastic maps, while the quantum analogue is a parametric family indexed by operator monotone functions \cite{petzsudar}. In every row the invariant is finite or parametric, and in every row the domain is stated with its restrictions.
papers/latex/vol-11-completeness-obstructions.tex-441-
papers/latex/vol-11-completeness-obstructions.tex-442-\subsection{Hypotheses and their cost}
papers/latex/vol-11-completeness-obstructions.tex-443-
papers/latex/vol-11-completeness-obstructions.tex-444-\begin{corollary}[Quantifier restriction]
papers/latex/vol-11-completeness-obstructions.tex-445-\label{cor:restrict}
papers/latex/vol-11-completeness-obstructions.tex-446-Under the hypotheses of \Cref{thm:transport}, a completeness statement for $\mathcal{C}$ in the sense of \Cref{def:program} is false. Under the hypotheses of \Cref{prop:undec}, a recognition statement for $\mathcal{C}$ in that sense is false. Any correct completeness or recognition statement about $\mathcal{C}$ restricts its quantifiers to a subdomain that excludes the part carrying the obstruction.
papers/latex/vol-11-completeness-obstructions.tex-447-\end{corollary}
papers/latex/vol-11-completeness-obstructions.tex-448-
papers/latex/vol-11-completeness-obstructions.tex-449-\begin{proof}
papers/latex/vol-11-completeness-obstructions.tex:450:\Cref{thm:transport} and \Cref{prop:undec} deny the existence of the parameter space or of the recognizer over all of $\mathcal{C}$. A statement quantified over a subdomain that excludes the obstruction carries no contradiction, and the surveyed theorems of Section 6.1 are all of this form.
papers/latex/vol-11-completeness-obstructions.tex-451-\end{proof}
papers/latex/vol-11-completeness-obstructions.tex-452-
papers/latex/vol-11-completeness-obstructions.tex-453-\Cref{cor:restrict} explains the shape of the completed islands. The restriction in each theorem is not a hedge and it is not removable by a better argument; it is the boundary the obstruction register draws. Two further points about the cost of hypotheses deserve recording. First, hypotheses can be subtle: braided extensions of the Doplicher-Roberts setting can require extra data beyond the braiding for the reconstruction to close, so the hypothesis list of a reconstruction theorem is part of its content and must travel with it. Second, a restriction can hide a boundary rather than a theorem: the tame side of the Grochow-Qiao divide admits polynomial-time isomorphism testing for the groups named, and the wild side fails the bounds their method needs \cite{grochow2015}. A classification program built on the tame side inherits the boundary as a working assumption.
papers/latex/vol-11-completeness-obstructions.tex-454-
papers/latex/vol-11-completeness-obstructions.tex-455-\subsection{Regime boundaries}
papers/latex/vol-11-completeness-obstructions.tex-456-
--
papers/latex/vol-11-completeness-obstructions.tex-479-Structural characterization & The families have precise mathematical definitions & Partial: families named, admissibility unfixed \\
papers/latex/vol-11-completeness-obstructions.tex-480-Decomposition & Targeted classes assemble from the families & Open in general; proved in restricted domains \\
papers/latex/vol-11-completeness-obstructions.tex-481-\bottomrule
papers/latex/vol-11-completeness-obstructions.tex-482-\end{tabular}
papers/latex/vol-11-completeness-obstructions.tex-483-\end{table}
papers/latex/vol-11-completeness-obstructions.tex-484-
papers/latex/vol-11-completeness-obstructions.tex:485:The completeness obligation quantifies over $\mathrm{Phys}_{\mathrm{adm}}$ and is therefore conditional on the admissibility list that \Cref{rem:unfixed} records as unfixed. Beyond the conditionality, \Cref{thm:transport} blocks the obligation in any formulation whose generated class contains a wild or undecidable sector isomorphism-reflectingly: the parameter space the classification needs cannot exist there. The obligation is open today and its unrestricted form collides with the register.
papers/latex/vol-11-completeness-obstructions.tex-486-
papers/latex/vol-11-completeness-obstructions.tex-487-The soundness obligation runs in the other direction, from the generated class to the admissibility conditions. It is vacuous until the conditions are stated, and it becomes checkable only after the list is fixed. No obstruction in the register touches it directly; its difficulty is definitional.
papers/latex/vol-11-completeness-obstructions.tex-488-
papers/latex/vol-11-completeness-obstructions.tex-489-The equivalence obligation is the one with a proved negative result attached. \Cref{prop:equiv} shows that the natural plain tensor choice of equivalence is strictly coarser than isomorphism and merges distinct systems. Any solution must therefore name the layers of structure it preserves and must recover the group from the preserved layers where a group is present. The solution space is restricted by a counterexample, which is a stronger constraint than mere openness.
papers/latex/vol-11-completeness-obstructions.tex-490-
papers/latex/vol-11-completeness-obstructions.tex-491-The structural characterization obligation is partial on the evidence of record. The ten candidate families of the program are named with their defining structures and their established islands, and the admissibility conditions that would make the families exhaustive are unfixed. Naming a family is not characterizing it to the precision a completeness proof needs, and the gap between the two is where this obligation lives.
papers/latex/vol-11-completeness-obstructions.tex-492-
papers/latex/vol-11-completeness-obstructions.tex:493:The decomposition obligation asks that systems of the targeted classes assemble from the families under the admissible constructions. Restricted theorems exist: the finite-dimensional $C^*$-algebra decomposition assembles every algebra of that class from matrix blocks \cite{cstarwiki}, amenable factors decompose by type \cite{vnwiki}, and Doplicher-Roberts reconstruction assembles superselection data from symmetric tensor structure \cite{eg2000}. In general the obligation is open, and uniqueness of decomposition is open even before assembly is considered: interacting systems need not admit unique decompositions at all.
papers/latex/vol-11-completeness-obstructions.tex-494-
papers/latex/vol-11-completeness-obstructions.tex-495-What survives the register is the restricted form the survey of the series anticipated: classification theorems on tame, restricted classes, plus explicit obstruction theorems where no classification can exist. The regime taxonomy of Section 4 states exactly which domains admit which of the two outcomes today, and Section 6 records the shape of every completed theorem on the positive side.
papers/latex/vol-11-completeness-obstructions.tex-496-
papers/latex/vol-11-completeness-obstructions.tex-497-The consequences for a periodic table of mathematical physics are direct. A table with only status columns for proved and open is incomplete: it has no cell for the proved impossibilities, and the regime taxonomy supplies one regime per kind of impossibility. A table with a single row per family is too coarse at the boundaries, because a family such as the operator-algebra family contains parameterized islands, an unparameterized island, and an obstruction-complete sector at once. The right grain is the domain, not the family, and the right vocabulary is the seven regimes.
papers/latex/vol-11-completeness-obstructions.tex-498-
papers/latex/vol-11-completeness-obstructions.tex-499-\subsection{Requirements for a completeness theorem}
papers/latex/vol-11-completeness-obstructions.tex-500-
papers/latex/vol-11-completeness-obstructions.tex-501-The register and the transport results fix what any future completeness theorem must contain. Four conditions are necessary, and each is drawn from a proved obstruction rather than from preference.
papers/latex/vol-11-completeness-obstructions.tex-502-
papers/latex/vol-11-completeness-obstructions.tex:503:The quantifier must be restricted. By \Cref{cor:restrict}, a domain carrying a wild or undecidable sector in the manner of \Cref{thm:transport} supports no completeness statement unless the quantifier excludes the part carrying the obstruction. A theorem over a class that embeds the generic determinant's modules, or a Markov construction, is false before its proof begins.
papers/latex/vol-11-completeness-obstructions.tex-504-
papers/latex/vol-11-completeness-obstructions.tex-505-The equivalence must name its layers. By \Cref{prop:equiv}, any equivalence forgetting the symmetric layer merges distinct systems, so the identification relation of the theorem must state the preserved structure and must recover groups where groups are present.
papers/latex/vol-11-completeness-obstructions.tex-506-
papers/latex/vol-11-completeness-obstructions.tex:507:The parameter space must be structured. By \Cref{def:param} and \Cref{lem:countable}, a bare set-theoretic indexing carries no content, and countable-valued complete invariants cannot exist where uncountably many classes or Borel non-reducibility stand. The parameterizer must be an algebraic family, a standard Borel parametrization, or a finite combinatorial set of the kind \Cref{def:program} names.
papers/latex/vol-11-completeness-obstructions.tex-508-
papers/latex/vol-11-completeness-obstructions.tex-509-The premise must be fixed. By \Cref{rem:unfixed}, a theorem over an admissible class whose conditions are unfixed is conditional on the list one adopts. A completeness theorem that quantifies over $\mathrm{Phys}_{\mathrm{adm}}$ waits on \Cref{def:adm} being settled; a theorem over a standard mathematical domain, as in the completed islands of \Cref{sec:completed}, does not.
papers/latex/vol-11-completeness-obstructions.tex-510-
papers/latex/vol-11-completeness-obstructions.tex-511-Together the four conditions describe the shape of the positive results the program may still earn: restricted-class theorems with stated hypotheses on tame domains, side by side with obstruction theorems registered at their full generality. That is the shape the evidence already has, and the regime table is where each domain's share of it is recorded.
papers/latex/vol-11-completeness-obstructions.tex-512-
papers/latex/vol-11-completeness-obstructions.tex-513-\section{Computational evidence}
papers/latex/vol-11-completeness-obstructions.tex-514-\label{sec:computational}
papers/latex/vol-11-completeness-obstructions.tex-515-
papers/latex/vol-11-completeness-obstructions.tex-516-The three experiments of this section are evidence about finite instances and growth patterns, not proofs. The claims they support are marked as computational in the code evidence appendix.
papers/latex/vol-11-completeness-obstructions.tex-517-
papers/latex/vol-11-completeness-obstructions.tex-518-The first experiment enumerates the regime assignment of \Cref{tab:regimes} as data and checks two properties mechanically: every surveyed domain receives exactly one regime label, and every label used is one of the seven of \Cref{def:regime}. The experiment treats the table as input, so it verifies the internal consistency of the assignment and not the mathematical truth of any row.
papers/latex/vol-11-completeness-obstructions.tex-519-
papers/latex/vol-11-completeness-obstructions.tex:520:The second experiment enumerates unital finite-dimensional complex $C^*$-algebras of a given complex dimension $N$, where $N = \dim_{\mathbb{C}}(A)$ is the vector space dimension over $\mathbb{C}$, by their dimension vectors, the multisets of matrix block sizes with $\sum_i n_i^2 = N$. For each $N$ up to a bound it prints the finite list of vectors, exhibiting on the tame side what a parametrization looks like: finitely many classes per dimension, listed by a finite invariant. For example, dimension $N = 5$ admits exactly two algebras, with block-size multisets $\{\!\{1,1,1,1,1\}\!\}$ and $\{\!\{1,2\}\!\}$, and dimension $N = 8$ admits exactly three, with multisets $\{\!\{1^{(8)}\}\!\}$, $\{\!\{2,1,1,1,1\}\!\}$, and $\{\!\{2,2\}\!\}$. The enumeration is exhaustive within its bound and is a direct check of the finiteness claim for each dimension.
papers/latex/vol-11-completeness-obstructions.tex-521-
papers/latex/vol-11-completeness-obstructions.tex:522:The third experiment computes the dimension of the quotient of representation varieties for the $m$-Kronecker quiver along the dimension vector $(n, n)$. The quotient dimension is $m n^2$ minus the generic orbit dimension $2n^2$ minus the dimension of the generic stabilizer: the centralizer of a generic matrix, of dimension $n$, for the tame case $m = 2$, and the scalar matrices, of dimension $1$, for the wild case $m = 3$. The quotient dimension therefore grows linearly for $m = 2$ and quadratically for $m = 3$. The tame side is parametrizable by eigenvalue data, a finite-dimensional variety of the kind \Cref{def:param} allows; the wild side grows faster than any fixed algebraic family can absorb, which is the dimension bookkeeping behind the non-parametrization theorems. The calculation is a growth pattern, and the non-parametrization theorem it illustrates is the proved result of Buchweitz and Leuschke \cite{buchweitz2005}.
papers/latex/vol-11-completeness-obstructions.tex-523-
papers/latex/vol-11-completeness-obstructions.tex-524-A companion Haskell module encodes the taxonomy layer: representative systems of each regime, carrying instances of the shared family classes of the series taxonomy, with a regime tag mirroring \Cref{def:regime}. The module is executable specification, and it is computational evidence of the same standing as the experiments. Its witness systems cover the McDuff sector, the wild module sector, the finite-dimensional $C^*$-algebra sector, and the four-manifold sector, so each regime of \Cref{def:regime} that has a concrete witness in this paper is represented. No artifact in this section is a machine-checked formalization, and none is presented as one.
papers/latex/vol-11-completeness-obstructions.tex-525-
papers/latex/vol-11-completeness-obstructions.tex-526-The experiments also mark what computation cannot do here. No finite run decides whether an algebraic family exists covering an isomorphism-class set, and no enumeration of small instances distinguishes a tame domain from a wild one at the boundary. The register theorems decide those questions, and the experiments only display their shadow on finite data.
papers/latex/vol-11-completeness-obstructions.tex-527-
papers/latex/vol-11-completeness-obstructions.tex-528-The experiments are deterministic and self-contained. Each script computes its output from definitions written in the script itself and from no external data, so a reader can rerun them and compare printed values against the claims of this section. The expected outputs are small enough to check by hand: the partition property of the regime table, the lists of dimension vectors at small $N$, and the quotient-dimension values along the diagonal $a = b = n$ for $m = 2$ and $m = 3$. Agreement is evidence for the claims as stated and nothing more.
--
papers/latex/vol-11-completeness-obstructions.tex-538-The universal classification conjecture is neither proved nor refuted here. The analysis shows that its unrestricted form collides with the register and that its restricted forms are where the provable content sits; whether a nontrivial restricted form yields a completeness theorem is open.
papers/latex/vol-11-completeness-obstructions.tex-539-
papers/latex/vol-11-completeness-obstructions.tex-540-A fifth limitation concerns the counterexamples of Section 5. Each refutes a specific natural completion of the classification picture, and none refutes every completion. The finite sporadic list fails in two sectors, the two-regime picture fails on two domains, and the plain tensor equivalence fails on explicit group pairs; a completion that avoids all three by construction is untouched by these results, and the register bounds it from the other side.
papers/latex/vol-11-completeness-obstructions.tex-541-
papers/latex/vol-11-completeness-obstructions.tex-542-\section{Conclusion}
papers/latex/vol-11-completeness-obstructions.tex-543-
papers/latex/vol-11-completeness-obstructions.tex:544:Completeness of a classification is a theorem about a domain and an equivalence relation, and the theorem holds where the invariant is finite or parametric and fails where proved obstructions stand. The register of Section 3 collects seven such obstructions, each forbidding a specific classification form, and the transport theorem shows the obstructions travel along fully faithful embeddings: a domain carrying a wild or undecidable sector in the manner of \Cref{thm:transport} inherits the obstruction. The regime taxonomy of Section 4 assigns the surveyed domains of the series to seven regimes, and the counterexamples of Section 5 refute three natural completions of the universal picture: a finite sporadic list, a two-regime account, and equivalence at the plain tensor layer.
papers/latex/vol-11-completeness-obstructions.tex-545-
papers/latex/vol-11-completeness-obstructions.tex-546-The strongest defensible conclusion is negative and useful. A universal classification of all mathematical representations of physical systems, in the form of the classification of finite simple groups, is not attainable across the surveyed domains: uncountably many isomorphism classes, unrecognizable instances, and wild sectors forbid it as a matter of theorem. What is attainable, and what the regime table documents, is a program of restricted classification theorems on tame classes together with explicit obstruction theorems everywhere else. That shape of outcome was named as acceptable in the founding documents of the program, and the analysis here shows it is the shape the evidence has.
papers/latex/vol-11-completeness-obstructions.tex-547-
papers/latex/vol-11-completeness-obstructions.tex-548-The obligations of the universal conjecture remain four open and one partial, and the admissibility conditions that would give the conjecture a fixed premise remain unfixed. Those two facts set the agenda that the closing volume of the series inherits: fix admissibility, fix equivalence at a layer that survives \Cref{prop:equiv}, and then read the regime table as the boundary between what a completeness theorem could cover and what an impossibility theorem already forbids.
papers/latex/vol-11-completeness-obstructions.tex-549-
papers/latex/vol-11-completeness-obstructions.tex-550-\appendix
--
papers/latex/vol-11-completeness-obstructions.tex-579-M. O. Rabin. Recursive unsolvability of group theoretic problems. \emph{Annals of Mathematics} (2) 67 (1958), 172-194. \url{https://www.jstor.org/stable/1969933}
papers/latex/vol-11-completeness-obstructions.tex-580-
papers/latex/vol-11-completeness-obstructions.tex-581-\bibitem{collins1969}
papers/latex/vol-11-completeness-obstructions.tex-582-D. J. Collins. On recognizing Hopf groups. \emph{Archiv der Mathematik} 20 (1969), 235-240. \url{https://link.springer.com/article/10.1007/BF01899291}
papers/latex/vol-11-completeness-obstructions.tex-583-
papers/latex/vol-11-completeness-obstructions.tex-584-\bibitem{mcduff1969}
papers/latex/vol-11-completeness-obstructions.tex:585:D. McDuff. Uncountably many $\mathrm{II}_1$ factors. \emph{Annals of Mathematics} (2) 90 (1969), 361-371. \url{https://annals.math.princeton.edu/1969/90-2/p07}
papers/latex/vol-11-completeness-obstructions.tex-586-
papers/latex/vol-11-completeness-obstructions.tex-587-\bibitem{connes1976}
papers/latex/vol-11-completeness-obstructions.tex:588:A. Connes. Classification of injective factors. Cases $\mathrm{II}_1$, $\mathrm{II}_\infty$, $\mathrm{III}_\lambda$, $\lambda \neq 1$. \emph{Annals of Mathematics} (2) 104 (1976), 73-115. \url{https://annals.math.princeton.edu/1976/104-1/p04}
papers/latex/vol-11-completeness-obstructions.tex-589-
papers/latex/vol-11-completeness-obstructions.tex-590-\bibitem{hass1999}
papers/latex/vol-11-completeness-obstructions.tex-591-J. Hass, J. C. Lagarias, and N. Pippenger. The computational complexity of knot and link problems. \emph{Journal of the ACM} 46 (1999), 185-211. \url{https://doi.org/10.1145/301970.301971}
papers/latex/vol-11-completeness-obstructions.tex-592-
papers/latex/vol-11-completeness-obstructions.tex-593-\bibitem{lackenby2021}
papers/latex/vol-11-completeness-obstructions.tex-594-M. Lackenby. The efficient certification of knottedness and Thurston norm. \emph{Advances in Mathematics} 387 (2021), article 107796. \url{https://doi.org/10.1016/j.aim.2021.107796}
--
papers/latex/vol-12-principia-physica.tex-46-\date{October 2026}
papers/latex/vol-12-principia-physica.tex-47-
papers/latex/vol-12-principia-physica.tex-48-\begin{document}
papers/latex/vol-12-principia-physica.tex-49-\maketitle
papers/latex/vol-12-principia-physica.tex-50-
papers/latex/vol-12-principia-physica.tex-51-\begin{abstract}
papers/latex/vol-12-principia-physica.tex:52:This paper assembles the registered results of the Classification of Mathematical Representations of Physical Systems into the three-layer architecture of Principia Physica: mathematical classification, physical realization, and empirical selection. The assembly keeps the three layers apart and separates proved statements from conjectural ones. Twenty background classification theorems and seven obstruction theorems are organized into seven classification regimes; a finite case analysis of the twenty-eight domains of the program comparison spine, with one boundary case, shows that fifteen carry a classification theorem with a finite or explicitly parameterized invariant, one is complete but unparameterized, one is a complete obstruction classification, seven remain open or claimed, three are impossible in the stated generality, one is undecidable, and one is decidable but unclassified. Eight reconstruction theorems recover objects from probes, each under hypotheses that cannot be dropped. The empirical layer admits no unique monotone metric in the quantum case, and no record validates the physical layer: the announced four-dimensional existence result carries the status existence claimed; manuscript and formalization withheld; verification pending, and the mass gap problem remains open. The structural classification statement enters only as a declared hypothesis, and a conditional reduction records what its five proof obligations would deliver. No record in the series carries a completed computer-checked proof.
papers/latex/vol-12-principia-physica.tex-53-\end{abstract}
papers/latex/vol-12-principia-physica.tex-54-
papers/latex/vol-12-principia-physica.tex-55-\section{Introduction}
papers/latex/vol-12-principia-physica.tex-56-
papers/latex/vol-12-principia-physica.tex-57-A unified structural theory of mathematical physics would answer three questions at once: which mathematical structures can represent physical systems, how those structures realize concrete physical theories, and how observation selects among the theories that survive. The Classification of Mathematical Representations of Physical Systems (CMRPS) program treats the three questions as three layers of a single architecture and studies them separately. This paper is the assembly layer of that program. It takes the registered results of the eleven preceding volumes and states, at exactly the strength the evidence supports, what a unified structural theory would require. It proves no new classification theorem; its formal statements are deductions about the assembled evidence and about what the central conjecture would deliver. The program documents and the eleven preceding volumes are works of this series and are available from the program site \url{https://yonedalabs.ai}. They organize citations and claim statuses and add no authority of their own: every mathematical statement used below is cited to the external literature, with a resolvable primary source for each citation.
papers/latex/vol-12-principia-physica.tex-58-
--
papers/latex/vol-12-principia-physica.tex-61-The central object is the identity
papers/latex/vol-12-principia-physica.tex-62-\[
papers/latex/vol-12-principia-physica.tex-63-  \mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F}_\alpha \rangle_{\mathfrak{C}},
papers/latex/vol-12-principia-physica.tex-64-\]
papers/latex/vol-12-principia-physica.tex-65-which asserts that every admissible physical system is generated from a collection of fundamental structural families under admissible constructions. The identity is a conjecture and is never used here as a lemma. The results assembled around it are the classification regimes where theorems exist, the obstruction theorems that forbid classification elsewhere, the reconstruction theorems that recover objects from probes, and the empirical constraints that no mathematical classification can discharge.
papers/latex/vol-12-principia-physica.tex-66-
papers/latex/vol-12-principia-physica.tex:67:This assembly establishes four results. Twenty-eight mathematical domains fall into six realized classification regimes, with complete invariants appearing only where the invariant is finite or explicitly parameterized. Seven impossibility theorems show that wild representation categories, non-amenable factors, and generic four-manifolds admit no uniform classification. Every reconstruction theorem on record requires its full algebraic hypotheses, and dropping the symmetric or monoidal structure admits non-isomorphic counterexamples. Resolving the structural classification conjecture would complete the mathematical classification alone, leaving physical realization and empirical selection unconstrained.
papers/latex/vol-12-principia-physica.tex-68-
papers/latex/vol-12-principia-physica.tex:69:A mathematical classification is never stated as a physical realization, and neither is ever stated as empirical selection. The strongest defensible claim on record is the founding program's own calibration: the architecture is precise enough to organize a substantial, long-term mathematical research program, and its individual components produce valuable results even if a universal classification theorem ultimately proves unattainable.
papers/latex/vol-12-principia-physica.tex-70-
papers/latex/vol-12-principia-physica.tex-71-\section{Definitions}
papers/latex/vol-12-principia-physica.tex-72-
papers/latex/vol-12-principia-physica.tex-73-Stipulated notions are marked as such; established mathematics is cited to primary sources.
papers/latex/vol-12-principia-physica.tex-74-
papers/latex/vol-12-principia-physica.tex-75-\begin{definition}[Representation of a physical system]
--
papers/latex/vol-12-principia-physica.tex-78-\[
papers/latex/vol-12-principia-physica.tex-79-  P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C}),
papers/latex/vol-12-principia-physica.tex-80-\]
papers/latex/vol-12-principia-physica.tex-81-comprising a state space or geometric structure $X$, an observable algebra or collection $\mathcal{O}$, dynamical laws $\mathcal{D}$, symmetry and constraint data $\mathcal{S}$, and composition rules $\mathcal{C}$. The five components need not be independent.
papers/latex/vol-12-principia-physica.tex-82-\end{definition}
papers/latex/vol-12-principia-physica.tex-83-
papers/latex/vol-12-principia-physica.tex:84:\Cref{def:representation} is a stipulative schema, not a theorem. Instances of $X$ range over symplectic manifolds \cite{corpus-6,corpus-7}, Hilbert spaces \cite{corpus-9}, probability spaces, smooth manifolds \cite{corpus-50,corpus-51}, and lattice configurations. The intended ambient structure $\mathrm{Phys}$ takes these representations as objects and admissible relationships as morphisms. Coarse-graining, equivalences, embeddings, dualities, and limiting procedures are candidate morphism kinds, and their preservation laws and composition rules are not fixed. Until they are fixed, $\mathrm{Phys}$ is a schema rather than a category, and every construction below is read at the level of object classes: no categorical subcategory, limit, or colimit construction is invoked.
papers/latex/vol-12-principia-physica.tex-85-
papers/latex/vol-12-principia-physica.tex-86-\begin{definition}[Equivalences]
papers/latex/vol-12-principia-physica.tex-87-\label{def:equivalence}
papers/latex/vol-12-principia-physica.tex-88-Mathematical equivalence is isomorphism of the tuples of \cref{def:representation} in the ambient category of each component. Physical equivalence $\simeq$ is a chosen equivalence relation on the objects of $\mathrm{Phys}$; the classification problem is $\mathrm{Classify}(\mathrm{Ob}(\mathrm{Phys})/\simeq)$.
papers/latex/vol-12-principia-physica.tex-89-\end{definition}
papers/latex/vol-12-principia-physica.tex-90-
papers/latex/vol-12-principia-physica.tex-91-Physical equivalence is stipulative and the choice is open. Two mathematical descriptions may be physically equivalent without being mathematically isomorphic. Any equivalence used to identify systems must state which layer of structure it preserves; equivalences that forget the monoidal or symmetric layer are provably insufficient \cite{corpus-12}.
papers/latex/vol-12-principia-physica.tex-92-
papers/latex/vol-12-principia-physica.tex-93-\begin{definition}[Admissible systems and family closure]
papers/latex/vol-12-principia-physica.tex-94-\label{def:admissible}
papers/latex/vol-12-principia-physica.tex:95:An admissible physical system is an object of the schema of \cref{def:representation} satisfying explicitly stated consistency conditions; $\mathrm{Phys}_{\mathrm{adm}}$ denotes the class of such objects. A structural family collection $\mathfrak{F} = \{\mathfrak{F}_\alpha\}_{\alpha \in A}$ is a collection of classes of objects singled out by their underlying mathematical structure, and $\langle \mathfrak{F} \rangle_{\mathfrak{C}}$ denotes the smallest class of objects containing $\mathfrak{F}$ and closed under a set of admissible constructions $\mathfrak{C}$: tensor product, direct sum, extension, limits and colimits, and factorization.
papers/latex/vol-12-principia-physica.tex-96-\end{definition}
papers/latex/vol-12-principia-physica.tex-97-
papers/latex/vol-12-principia-physica.tex-98-The admissibility conditions are the first deliverable of the foundations volume and remain unfixed. Every statement quantified over $\mathrm{Phys}_{\mathrm{adm}}$ is therefore conditional on the chosen conditions. The ten candidate structural families are named in the shared ontology and range from symplectic and Poisson structures through operator algebras, manifolds, bundles, probability, higher categories, dynamical systems, tensor categories, combinatorial structures, and derived structures. They are candidate organizing families, and some may later be unified.
papers/latex/vol-12-principia-physica.tex-99-
papers/latex/vol-12-principia-physica.tex-100-\begin{definition}[Irreducibility and decomposition]
papers/latex/vol-12-principia-physica.tex-101-\label{def:irreducible}
--
papers/latex/vol-12-principia-physica.tex-103-\end{definition}
papers/latex/vol-12-principia-physica.tex-104-
papers/latex/vol-12-principia-physica.tex-105-Interacting physical systems need not admit unique decompositions. Entanglement, emergence, gauge redundancy, and nontrivial interactions all complicate the notion, so existence-and-uniqueness theorems belong only to restricted subclasses.
papers/latex/vol-12-principia-physica.tex-106-
papers/latex/vol-12-principia-physica.tex-107-\begin{definition}[The three layers]
papers/latex/vol-12-principia-physica.tex-108-\label{def:layers}
papers/latex/vol-12-principia-physica.tex:109:The Principia architecture consists of three layers. The mathematical layer is $\mathcal{M} = \mathrm{Classify}(\text{admissible structures})$. The realization layer is a map $\mathcal{R} : \mathcal{M} \to \mathcal{P}$ into physical theories. The selection layer is a map $\mathcal{E} : \mathcal{P} \to \mathcal{E}_{\mathrm{obs}}$ into observational constraints or predictions. The object $\mathcal{E}_{\mathrm{obs}}$ records observational data; the map $\mathcal{E}$ does not assert that every model maps to a single observational object.
papers/latex/vol-12-principia-physica.tex-110-\end{definition}
papers/latex/vol-12-principia-physica.tex-111-
papers/latex/vol-12-principia-physica.tex-112-\begin{definition}[Evidence grades]
papers/latex/vol-12-principia-physica.tex-113-\label{def:grades}
papers/latex/vol-12-principia-physica.tex:114:A statement carries grade 1 when it is a mathematical formulation, grade 2 when a rigorous proof exists in the literature, and grade 3 when the statement has achieved physical validation, meaning that its physical realization and its empirical selection have been established for the systems it describes.
papers/latex/vol-12-principia-physica.tex-115-\end{definition}
papers/latex/vol-12-principia-physica.tex-116-
papers/latex/vol-12-principia-physica.tex-117-\begin{definition}[Classification regimes]
papers/latex/vol-12-principia-physica.tex-118-\label{def:regimes}
papers/latex/vol-12-principia-physica.tex:119:A domain of mathematical structures is assigned to exactly one of seven regimes. Regime 1 is complete and parameterized: a classification theorem exists and a finite or explicitly described parameter class determines the object. Parameter classes range from finite data such as dimension vectors to infinite function classes such as operator monotone functions, and the classification is a bijection with the parameter class in either case. Regime 2 is complete but unparameterized: a classification theorem exists and no uniform parameterization is known. Regime 3 is complete as obstruction: the classification content is the obstruction itself. Regime 4 is open: partial results, normal forms, or claims only. Regime 5 is impossible in the stated generality: a theorem forbids the classification. Regime 6 is undecidable: no algorithm can carry the classification. Regime 7 is decidable but unclassified.
papers/latex/vol-12-principia-physica.tex-120-\end{definition}
papers/latex/vol-12-principia-physica.tex-121-
papers/latex/vol-12-principia-physica.tex-122-\begin{remark}
papers/latex/vol-12-principia-physica.tex-123-The regime assignment is an organizing device for the evidence base. It does not assert that the regimes are mathematically exhaustive of all possible classification situations. The unknot recognition problem, in $\mathrm{NP}$ and co-$\mathrm{NP}$ with the complexity-class membership open \cite{corpus-61}, is the registered instance of regime 7, and \cref{tab:regimes} carries it as a boundary case beyond the twenty-eight spine domains.
papers/latex/vol-12-principia-physica.tex-124-\end{remark}
papers/latex/vol-12-principia-physica.tex-125-
--
papers/latex/vol-12-principia-physica.tex-131-\]
papers/latex/vol-12-principia-physica.tex-132-describing states, observables, dynamics, symmetries, and representations. The classification question is which of these invariants suffice to distinguish theories up to the chosen equivalence of \cref{def:equivalence}.
papers/latex/vol-12-principia-physica.tex-133-\end{definition}
papers/latex/vol-12-principia-physica.tex-134-
papers/latex/vol-12-principia-physica.tex-135-\begin{definition}[Observational equivalence]
papers/latex/vol-12-principia-physica.tex-136-\label{def:observational}
papers/latex/vol-12-principia-physica.tex:137:Given a regime $E$ of accessible experiments, two theories satisfy $T_1 \sim_E T_2$ when they give identical predictions in $E$. The relation $\sim_E$ is an equivalence relation on theories, and the selection layer $\mathcal{E}$ is the map whose induced quotient computes it.
papers/latex/vol-12-principia-physica.tex-138-\end{definition}
papers/latex/vol-12-principia-physica.tex-139-
papers/latex/vol-12-principia-physica.tex-140-\begin{table}[htbp]
papers/latex/vol-12-principia-physica.tex-141-\caption{The ten candidate structural families with representative systems and defining invariants. The families are candidates and some may later be unified.}
papers/latex/vol-12-principia-physica.tex-142-\label{tab:families}
papers/latex/vol-12-principia-physica.tex-143-\small
papers/latex/vol-12-principia-physica.tex-144-\begin{tabularx}{\textwidth}{>{\hsize=0.35\hsize\raggedright\arraybackslash}X >{\hsize=1.4\hsize\raggedright\arraybackslash}X >{\hsize=0.95\hsize\raggedright\arraybackslash}X >{\hsize=1.3\hsize\raggedright\arraybackslash}X}
papers/latex/vol-12-principia-physica.tex-145-\toprule
papers/latex/vol-12-principia-physica.tex-146-Family & Underlying structure & Representative systems & Defining invariants \\
papers/latex/vol-12-principia-physica.tex-147-\midrule
papers/latex/vol-12-principia-physica.tex-148-I & Symplectic and Poisson structures & Classical mechanics & Symplectic form and splitting data \\
papers/latex/vol-12-principia-physica.tex:149:II & Hilbert spaces and operator algebras & Quantum mechanics & Dimension vector and factor type \\
papers/latex/vol-12-principia-physica.tex-150-III & Smooth manifolds and geometry & Relativity & Holonomy group and causal class \\
papers/latex/vol-12-principia-physica.tex-151-IV & Principal bundles and connections & Gauge theories & Characteristic and obstruction classes \\
papers/latex/vol-12-principia-physica.tex-152-V & Probability and measure theory & Statistical physics & Fisher metric up to constant \\
papers/latex/vol-12-principia-physica.tex-153-VI & Topological and higher categories & Topological field theories & Fully dualizable objects \\
papers/latex/vol-12-principia-physica.tex-154-VII & Dynamical systems and semigroups & Dissipative systems & Normal-form dilation data \\
papers/latex/vol-12-principia-physica.tex-155-VIII & Tensor categories and composition & Quantum information & Symmetric structure and conjugates \\
--
papers/latex/vol-12-principia-physica.tex-160-\end{table}
papers/latex/vol-12-principia-physica.tex-161-
papers/latex/vol-12-principia-physica.tex-162-\section{The three layers of the assembly}
papers/latex/vol-12-principia-physica.tex-163-
papers/latex/vol-12-principia-physica.tex-164-The three layers of \cref{def:layers} are stipulated as separate maps, and the evidence base treats them as separate.
papers/latex/vol-12-principia-physica.tex-165-
papers/latex/vol-12-principia-physica.tex:166:Under the architecture of \cref{def:layers}, classification data determines neither realization nor selection. The architecture stipulates $\mathcal{R}$ and $\mathcal{E}$ as maps with separate domains and codomains, and the founding documents stipulate that several mathematically distinct theories may produce identical predictions within an experimentally accessible regime. The registry of the program, examined record by record, contains classification theorems, reconstruction theorems, and obstruction theorems, and it contains no observation functor and no construction of $\mathcal{E}$: every record lives at the mathematical layer or at the interface between the mathematical and realization layers. Classification data therefore underdetermines empirical selection.
papers/latex/vol-12-principia-physica.tex-167-
papers/latex/vol-12-principia-physica.tex:168:Empirical selection is not a corollary of classification. Let $T_1$ and $T_2$ be mathematically distinct theories whose predictions agree in an accessible regime $E$, as the architecture stipulates; write $T_1 \sim_E T_2$ for that agreement. A classification at $\mathcal{M}$ distinguishes $T_1$ from $T_2$, so the classification map is not constant on $\sim_E$-classes and cannot compute them. Deciding $\sim_E$ requires the map $\mathcal{E}$, which the classification layer does not supply.
papers/latex/vol-12-principia-physica.tex-169-
papers/latex/vol-12-principia-physica.tex-170-\Cref{tab:grades} places the record types of the program at the evidence grades of \cref{def:grades}. The grade-3 column is empty.
papers/latex/vol-12-principia-physica.tex-171-
papers/latex/vol-12-principia-physica.tex-172-\begin{table}[htbp]
papers/latex/vol-12-principia-physica.tex-173-\caption{Evidence grades of the record types of the program registry. Physical validation is empty for every record type.}
papers/latex/vol-12-principia-physica.tex-174-\label{tab:grades}
--
papers/latex/vol-12-principia-physica.tex-177-\toprule
papers/latex/vol-12-principia-physica.tex-178-Record type & Grade & Example \\
papers/latex/vol-12-principia-physica.tex-179-\midrule
papers/latex/vol-12-principia-physica.tex-180-Stipulated definitions and architecture & 1 & The three layers of \cref{def:layers} \\
papers/latex/vol-12-principia-physica.tex-181-Classification theorems & 2 & Dimension vector classification of finite-dimensional $C^*$-algebras \\
papers/latex/vol-12-principia-physica.tex-182-Reconstruction theorems & 2 & Doplicher-Roberts reconstruction under its hypotheses \\
papers/latex/vol-12-principia-physica.tex:183:Obstruction theorems & 2 & Uncountably many non-isomorphic separable type~$\mathrm{II}_1$ factors \\
papers/latex/vol-12-principia-physica.tex-184-Claim-ledger entries & 1 & The announced existence claim of \cref{tab:claims} \\
papers/latex/vol-12-principia-physica.tex-185-Physical validation of the architecture & 3 & No record on file \\
papers/latex/vol-12-principia-physica.tex-186-\bottomrule
papers/latex/vol-12-principia-physica.tex-187-\end{tabularx}
papers/latex/vol-12-principia-physica.tex-188-\end{table}
papers/latex/vol-12-principia-physica.tex-189-
papers/latex/vol-12-principia-physica.tex:190:A complete mathematical classification $\mathcal{M}$ leaves empirical selection $\mathcal{E}$ underdetermined whenever distinct mathematical models yield identical observational predictions. Because the mathematical, realization, and empirical layers possess distinct domains and quotient structures, each layer imposes independent constraints on physical admissibility.
papers/latex/vol-12-principia-physica.tex-191-
papers/latex/vol-12-principia-physica.tex-192-\section{The mathematical layer}
papers/latex/vol-12-principia-physica.tex-193-\label{sec:mathlayer}
papers/latex/vol-12-principia-physica.tex-194-
papers/latex/vol-12-principia-physica.tex-195-The mathematical layer $\mathcal{M}$ is where the evidence base is strongest. It is also where the limits of classification are theorems rather than difficulties. \Cref{tab:regimes} assigns every domain of the program comparison spine to a regime of \cref{def:regimes}.
papers/latex/vol-12-principia-physica.tex-196-
papers/latex/vol-12-principia-physica.tex-197-{\small
papers/latex/vol-12-principia-physica.tex-198-\begin{longtable}{L{0.32\textwidth} L{0.36\textwidth} L{0.10\textwidth}}
papers/latex/vol-12-principia-physica.tex:199:\caption{The twenty-eight domains of the program comparison spine and the unknot-recognition boundary case, with classifying invariant and classification regime. Regime 1 is complete and parameterized, 2 is complete but unparameterized, 3 is complete as obstruction, 4 is open or claimed, 5 is impossible in the stated generality, 6 is undecidable, and 7 is decidable but unclassified.}
papers/latex/vol-12-principia-physica.tex-200-\label{tab:regimes}\\
papers/latex/vol-12-principia-physica.tex-201-\toprule
papers/latex/vol-12-principia-physica.tex-202-Domain & Classifying invariant & Regime \\
papers/latex/vol-12-principia-physica.tex-203-\midrule
papers/latex/vol-12-principia-physica.tex-204-\endfirsthead
papers/latex/vol-12-principia-physica.tex-205-\toprule
--
papers/latex/vol-12-principia-physica.tex-209-Finite simple groups & Character table and companion atlas data & 2 \\
papers/latex/vol-12-principia-physica.tex-210-Simple Lie groups and Lie algebras & Dynkin and Satake diagrams & 1 \\
papers/latex/vol-12-principia-physica.tex-211-Irreducible representations of semisimple Lie algebras & Dominant integral weights & 1 \\
papers/latex/vol-12-principia-physica.tex-212-Symplectic manifolds in the local category & The empty local invariant & 1 \\
papers/latex/vol-12-principia-physica.tex-213-Poisson manifolds in the local category & Weinstein splitting data & 1 \\
papers/latex/vol-12-principia-physica.tex-214-Finite-dimensional complex $C^*$-algebras & Dimension vector & 1 \\
papers/latex/vol-12-principia-physica.tex:215:Amenable factors & Murray-von Neumann type and Connes invariants & 1 \\
papers/latex/vol-12-principia-physica.tex:216:General type~$\mathrm{II}$ and type~$\mathrm{III}$ factors & Coarse Connes-spectrum strata only & 5 \\
papers/latex/vol-12-principia-physica.tex-217-Quantum channels & Kraus rank as normal-form data & 4 \\
papers/latex/vol-12-principia-physica.tex-218-Principal $G$-bundles & Homotopy classes of maps into the classifying space & 1 \\
papers/latex/vol-12-principia-physica.tex-219-Anomalies & Cohomological obstruction classes & 3 \\
papers/latex/vol-12-principia-physica.tex:220:DHR superselection sectors & Compact supergroup from the reconstruction & 1 \\
papers/latex/vol-12-principia-physica.tex-221-Symmetric tensor categories of subexponential growth & Supergroup representation category & 1 \\
papers/latex/vol-12-principia-physica.tex-222-Fusion categories & Weak Hopf algebra presentation & 4 \\
papers/latex/vol-12-principia-physica.tex-223-Extended topological quantum field theories & Fully dualizable objects & 4 \\
papers/latex/vol-12-principia-physica.tex-224-Lorentzian holonomy groups & Holonomy group & 1 \\
papers/latex/vol-12-principia-physica.tex-225-Spacetime causality conditions & Causal class on the causal ladder & 1 \\
papers/latex/vol-12-principia-physica.tex-226-Holographic entropy cone with at most four regions & Subadditivity and monogamy inequality data & 1 \\
--
papers/latex/vol-12-principia-physica.tex-230-Emergent spacetime and the Ryu-Takayanagi formula & No established invariant & 4 \\
papers/latex/vol-12-principia-physica.tex-231-Four-dimensional Yang-Mills and QCD existence & Balaban-program methods & 4 \\
papers/latex/vol-12-principia-physica.tex-232-Four-dimensional Yang-Mills mass gap & No invariant established & 4 \\
papers/latex/vol-12-principia-physica.tex-233-Closed three-manifolds & Thurston geometry type & 1 \\
papers/latex/vol-12-principia-physica.tex-234-Four-manifolds & Restricted classes only & 5 \\
papers/latex/vol-12-principia-physica.tex-235-Finitely presented groups under Markov properties & No invariant can exist & 6 \\
papers/latex/vol-12-principia-physica.tex:236:Wild representation categories & No finite-variety parameterization exists & 5 \\
papers/latex/vol-12-principia-physica.tex-237-Unknot recognition & Decidable with complexity class open & 7 \\
papers/latex/vol-12-principia-physica.tex-238-\bottomrule
papers/latex/vol-12-principia-physica.tex-239-\end{longtable}}
papers/latex/vol-12-principia-physica.tex-240-
papers/latex/vol-12-principia-physica.tex-241-
papers/latex/vol-12-principia-physica.tex:242:The twenty-nine rows of \cref{tab:regimes} carry the regime counts $15, 1, 1, 7, 3, 1, 1$ over regimes 1 to 7. Every regime-1 domain carries a finite or explicitly parameterized classifying invariant; parameter classes range from dimension vectors to the infinite class of operator monotone functions. Every domain whose objects include wild, non-amenable, or algorithmically unrecognizable sectors lies in regime 4, 5, or 6, and none of those domains carries a classification theorem. The counts hold by inspection of the table, where row 29 carries regime 7. Regime~1 contains the rows for simple Lie theory \cite{corpus-4}, its representation theory \cite{corpus-5}, local symplectic and Poisson geometry, finite-dimensional $C^*$-algebras, amenable factors, principal bundles, DHR sectors, subexponential symmetric tensor categories, Lorentzian holonomy, the causal ladder, the at-most-four-region entropy cone, monotone metrics, and closed three-manifolds. Each invariant listed for those rows is finite data or parametric data: diagrams, weights, dimension vectors, types and Connes invariants, homotopy-class data, supergroup data, holonomy groups, causal classes, inequality data, metrics up to constant, and geometry type. Regime~2 is finite simple groups, where the classification theorem exists and no uniform parameterization is known. Regime~3 is anomalies, where the classification content is the obstruction classes. Regime~4 contains quantum channels, fusion categories, extended topological field theories, the entropy cone from five regions up, emergent spacetime, and the two Yang-Mills rows. Regime~5 contains general type~$\mathrm{II}$ and type~$\mathrm{III}$ factors \cite{corpus-8}, four-manifolds \cite{corpus-54}, and wild representation categories \cite{corpus-55,corpus-56,corpus-58}. Regime~6 contains Markov properties of finitely presented groups \cite{corpus-53}. The wild, non-amenable, and unrecognizable sectors appear exactly in rows that \cref{thm:obstructions} below covers, and those rows carry partial data or nothing at all where a classification theorem would sit.
papers/latex/vol-12-principia-physica.tex-243-
papers/latex/vol-12-principia-physica.tex-244-The regime-4 rows are partial in four distinct ways. Quantum channels carry only normal-form data \cite{corpus-10,corpus-11}. Fusion categories are open \cite{corpus-14}. Extended topological quantum field theories are claimed through the cobordism hypothesis \cite{corpus-34}, whose 2009 proof is an informal sketch \cite{corpus-35}, while functorial topological field theory is tractable under the Atiyah axioms \cite{corpus-36}. The entropy cone from five regions up has one infinite inequality family and no complete list \cite{corpus-47}. The two Yang-Mills rows carry the claim register of \cref{tab:claims}.
papers/latex/vol-12-principia-physica.tex-245-
papers/latex/vol-12-principia-physica.tex-246-\begin{remark}
papers/latex/vol-12-principia-physica.tex:247:Row 21 records a proved parametric classification: quantum monotone metrics are classified by operator monotone functions \cite{corpus-52}. The parameter class here is an infinite-dimensional class of functions, not the finite or discrete data of the other regime-1 rows, and uniqueness fails in the quantum case. The program periodic table lists the same domain among open classification problems because the classification is not a finite list. Both statements stand together: the classification theorem is proved, and the classification is not finite.
papers/latex/vol-12-principia-physica.tex-248-\end{remark}
papers/latex/vol-12-principia-physica.tex-249-
papers/latex/vol-12-principia-physica.tex-250-Within the evidence base, classification is sharp exactly where the invariant is finite or explicitly parameterized, and the classification content can be entirely global. Every regime-1 and regime-2 row of \cref{tab:regimes} has a finite or explicitly parameterized invariant, and the domains without such invariants are exactly the domains with no classification theorem. The global character of symplectic classification is Darboux's theorem \cite{corpus-6}: any two symplectic manifolds of the same dimension are locally symplectomorphic, so the local invariant is empty and the classifying data must be global. The contrast with Riemannian geometry, where curvature supplies local invariants, is structural rather than incidental.
papers/latex/vol-12-principia-physica.tex-251-
papers/latex/vol-12-principia-physica.tex-252-\subsection{Classification, parameterization, recognition}
papers/latex/vol-12-principia-physica.tex-253-
papers/latex/vol-12-principia-physica.tex-254-Three classification achievements are often conflated. A parameterization assigns uniform finite data to each object. A classification lists the objects exhaustively. A recognition procedure identifies an object algorithmically from companion data.
papers/latex/vol-12-principia-physica.tex-255-
papers/latex/vol-12-principia-physica.tex-256-The classification of finite simple groups delivers the second achievement and only part of the third. The list of families and sporadic groups is complete \cite{corpus-1,corpus-2}, and practical identification runs through companion data of atlas type: order, Schur multiplier, outer automorphism group, presentations, and character tables with power maps \cite{corpus-3}. No clean uniform parameterization analogous to Dynkin diagrams is known \cite{corpus-1}. The template program itself therefore sits in regime 2 of \cref{def:regimes}, and a periodic table of physical structures cannot expect more from its analogy than the template delivers.
papers/latex/vol-12-principia-physica.tex-257-
papers/latex/vol-12-principia-physica.tex:258:The analogy between the two classification problems is architectural rather than evidentiary. The finite simple groups share one definition; physical systems have no universally accepted mathematical definition, and the schema of \cref{def:representation} is a candidate. The founding documents warn against assuming that physical theories possess a finite collection of exceptional objects analogous to the twenty-six sporadic groups \cite{corpus-1}. Exceptional mathematics exists and the taxonomy must accommodate it: the exceptional Lie algebras \cite{corpus-4}, the type~$\mathrm{III}$ factors and the hyperfinite $\mathrm{II}_1$ factor \cite{corpus-8}, the eight Thurston geometries \cite{corpus-60}, and the isocategorical group pairs \cite{corpus-12}. Whether any two of the ten families of \cref{tab:families} are logically independent is open, and no theorem on record settles it.
papers/latex/vol-12-principia-physica.tex-259-
papers/latex/vol-12-principia-physica.tex-260-\section{Obstruction theorems}
papers/latex/vol-12-principia-physica.tex-261-\label{sec:obstructions}
papers/latex/vol-12-principia-physica.tex-262-
papers/latex/vol-12-principia-physica.tex-263-Obstructions are theorems. Seven of them are registered, and each forbids a classification objective that one might otherwise pursue.
papers/latex/vol-12-principia-physica.tex-264-
papers/latex/vol-12-principia-physica.tex-265-\begin{theorem}[Survey: non-classification outside tame regimes, assembled from McDuff, Adyan-Rabin, the wildness results, Tancer, Etingof-Gelaki, and Grochow-Qiao]
papers/latex/vol-12-principia-physica.tex-266-\label{thm:obstructions}
papers/latex/vol-12-principia-physica.tex:267:The following classification objectives are forbidden by proved results. Separable type~$\mathrm{II}_1$ factors admit no total classification outside the amenable case, and their isomorphism relation admits no classification by countable invariants. Wild representation categories admit no finite-variety parameterization. Markov properties of finitely presented groups, including finiteness and simplicity, are algorithmically undecidable. Homeomorphism of compact four-manifolds is algorithmically unrecognizable in general. A finite group is not determined by its representation category as a plain tensor category. Group isomorphism admits no polynomial-time algorithm in wild regimes under standard complexity assumptions, while tame extensions do. Consequently any classification theorem in the program must either restrict its class to a tame regime or weaken its invariant notion, and a global periodic table covering all families cannot exist outside tame regimes.
papers/latex/vol-12-principia-physica.tex-268-\end{theorem}
papers/latex/vol-12-principia-physica.tex-269-
papers/latex/vol-12-principia-physica.tex-270-\begin{proof}
papers/latex/vol-12-principia-physica.tex:271:The first statement is McDuff's theorem: there are uncountably many non-isomorphic separable type~$\mathrm{II}_1$ factors \cite{corpus-8,corpus-65}. A total classification by a countable list of invariants would inject that uncountable family into a countable product of invariant values, which is impossible, and the Borel-reducibility analysis makes the failure precise for isomorphism of von Neumann algebras \cite{corpus-59}. The second statement is the wildness line: every finite-dimensional algebra over an algebraically closed field is derived-tame or derived-wild with wildness preserved under degeneration \cite{corpus-55}, the rank-2 isomorphism classes of the generic determinant's Cohen-Macaulay modules admit no finite-dimensional-variety parameterization \cite{corpus-56}, and no meaningful classification of compact $C_p$-equivariant $H\mathbb{F}_p$-modules exists at odd primes \cite{corpus-58}. The third statement is the Adyan-Rabin theorem with the Collins extension \cite{corpus-53}. The fourth statement is the unrecognizability of connected-sum homeomorphism for a specific four-manifold \cite{corpus-54}, set against the eight-geometry decomposition of closed three-manifolds \cite{corpus-60,corpus-70}. The fifth statement is the isocategorical-group construction: non-isomorphic finite groups carry equivalent representation categories as plain tensor categories \cite{corpus-12}. The sixth statement is the tame/wild tractability boundary \cite{corpus-57}. Each forbidden objective is a classification covering one of the named sectors, so each such classification would contradict the corresponding theorem. The conjunctive conclusion follows.
papers/latex/vol-12-principia-physica.tex-272-\end{proof}
papers/latex/vol-12-principia-physica.tex-273-
papers/latex/vol-12-principia-physica.tex-274-\subsection{What the obstructions permit}
papers/latex/vol-12-principia-physica.tex-275-
papers/latex/vol-12-principia-physica.tex-276-\Cref{thm:obstructions} does not say that classification fails everywhere. It says that classification objectives must match regimes.
papers/latex/vol-12-principia-physica.tex-277-
papers/latex/vol-12-principia-physica.tex:278:The amenable factors are completely classified by Murray-von Neumann type and Connes invariants \cite{corpus-8,corpus-62,corpus-64}, and the obstruction concerns only the non-amenable remainder. The classification theorem and the impossibility theorem sit side by side and refer to different classes. The anomaly sector is classified completely in regime 3: quantization exists exactly when the relevant cohomological obstruction classes vanish \cite{corpus-19}, so the classification content is the obstruction itself. An impossibility statement of this shape is a finished classification, not a gap. Dimension three admits a finite table of Thurston geometries \cite{corpus-60,corpus-70} while dimension four contains algorithmically unrecognizable instances \cite{corpus-54}, so finite tables exist only in tame regimes. The same contrast appears inside group theory: tame extensions admit polynomial-time isomorphism tests while wild regimes do not \cite{corpus-57}, and unknot recognition is decidable in principle with its complexity-class membership open \cite{corpus-61}, which places it in regime 7 and separates decidability from classification.
papers/latex/vol-12-principia-physica.tex-279-
papers/latex/vol-12-principia-physica.tex:280:The register therefore has a constructive use. An obstruction names the restriction a classification theorem needs. McDuff's theorem tells a would-be factor classification to restrict to the amenable class, and that restricted classification exists. Wildness tells a would-be module classification to restrict to the derived-tame side. The unrecognizability theorem tells a would-be four-manifold classification to restrict to decomposable classes. Each obstruction pairs with a restricted positive theorem, and that pairing is the working form of the program's negative results.
papers/latex/vol-12-principia-physica.tex-281-
papers/latex/vol-12-principia-physica.tex-282-\begin{remark}
papers/latex/vol-12-principia-physica.tex-283-The program founding documents warn against assuming that physical theories possess a finite collection of exceptional objects analogous to the twenty-six sporadic groups \cite{corpus-1}. The sporadic groups exist and are exhaustive in the finite-simple setting, and the corresponding question for physical theories is open. The obstruction register shows what a periodic table must record where no table exists.
papers/latex/vol-12-principia-physica.tex-284-\end{remark}
papers/latex/vol-12-principia-physica.tex-285-
papers/latex/vol-12-principia-physica.tex-286-\section{The realization layer}
--
papers/latex/vol-12-principia-physica.tex-311-Reconstruction is better developed than classification. The pattern is uniform: probe data determines the object. Gelfand duality recovers a space from its commutative $C^*$-algebra \cite{corpus-42}, Stone duality recovers a spectrum from a Boolean algebra \cite{corpus-44}, and Doplicher-Roberts reconstruction recovers a compact supergroup from a symmetric tensor $*$-category with the stated hypotheses \cite{corpus-12,corpus-16}. The 2024 to 2026 supermap line establishes concrete representability of categorical supermaps whenever suitable channel-state duality holds \cite{corpus-40,corpus-41}. Whether that line unifies with the Gelfand, Stone, and Naimark pattern into a single relational principle is open.
papers/latex/vol-12-principia-physica.tex-312-
papers/latex/vol-12-principia-physica.tex-313-\subsection{Relational characterization}
papers/latex/vol-12-principia-physica.tex-314-
papers/latex/vol-12-principia-physica.tex-315-Reconstruction from probes has a categorical form. The Yoneda embedding sends an object $P$ to the functor $\mathrm{Hom}(-, P)$, and the Yoneda lemma shows that an object of a locally small category is determined up to isomorphism by its relationships. The embedding is therefore a faithful mathematical representation of objects of $\mathrm{Phys}$ through their relational profiles. Its physical interpretation is open.
papers/latex/vol-12-principia-physica.tex-316-
papers/latex/vol-12-principia-physica.tex:317:The constraint on every relational argument in the program is stated verbatim: \emph{Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.} The embedding supplies representability and nothing else. Physical equivalence requires the chosen relation of \cref{def:equivalence}, empirical adequacy requires the selection layer, and a classification theorem requires invariants with completeness statements.
papers/latex/vol-12-principia-physica.tex-318-
papers/latex/vol-12-principia-physica.tex-319-Two islands support the relational program. Concrete representability of categorical supermaps is proved whenever the theory admits suitable channel-state duality \cite{corpus-40,corpus-41}. The classical reconstruction pattern of Gelfand, Stone, and Naimark recovers objects from their probe algebras \cite{corpus-42,corpus-44}. Whether the two islands join into one principle is open, and no argument in this paper crosses that gap.
papers/latex/vol-12-principia-physica.tex-320-
papers/latex/vol-12-principia-physica.tex-321-\begin{theorem}[Survey: necessity of the structure hypotheses, assembled from Etingof-Gelaki, Doplicher-Roberts, Stinespring, and the supermap results]
papers/latex/vol-12-principia-physica.tex-322-\label{thm:hypotheses}
papers/latex/vol-12-principia-physica.tex-323-Every registered realization or identification theorem fails or becomes open as soon as its structure hypotheses are dropped. In particular: plain tensor equivalence of representation categories does not determine the finite group; Doplicher-Roberts reconstruction requires the symmetric structure and its companion hypotheses; Stinespring data is a normal form and its Kraus rank is not an isomorphism invariant of channels; supermap representability requires channel-state duality. Consequently any identification of systems in the program must declare the layers of structure it preserves, and an identification that forgets the monoidal or symmetric layer is refuted.
--
papers/latex/vol-12-principia-physica.tex-337-
papers/latex/vol-12-principia-physica.tex-338-The honest summary of the realization layer is therefore asymmetric. Reconstruction from probes is strong where the probes are algebraic or categorical. Reconstruction of interacting dynamics and of spacetime itself from primitive data remains open.
papers/latex/vol-12-principia-physica.tex-339-
papers/latex/vol-12-principia-physica.tex-340-\section{The empirical layer}
papers/latex/vol-12-principia-physica.tex-341-\label{sec:empirical}
papers/latex/vol-12-principia-physica.tex-342-
papers/latex/vol-12-principia-physica.tex:343:The empirical layer $\mathcal{E}$ is where mathematical classification stops and observational selection begins.
papers/latex/vol-12-principia-physica.tex-344-
papers/latex/vol-12-principia-physica.tex-345-\begin{theorem}[Survey: classical uniqueness and quantum parametricity, assembled from Chentsov and Petz-Sudar]
papers/latex/vol-12-principia-physica.tex-346-\label{thm:monotone}
papers/latex/vol-12-principia-physica.tex:347:The Fisher metric is the unique Riemannian metric, up to constant factor, that is monotone under stochastic maps. Quantum monotone metrics are classified by operator monotone functions, a parametric family containing more than one element. Classical uniqueness therefore does not extend to the quantum case, and any quantum distinguishability criterion must either select within the parametric family and justify the selection or carry the family as data.
papers/latex/vol-12-principia-physica.tex-348-\end{theorem}
papers/latex/vol-12-principia-physica.tex-349-
papers/latex/vol-12-principia-physica.tex-350-\begin{proof}
papers/latex/vol-12-principia-physica.tex:351:The first statement is Chentsov's theorem \cite{corpus-52}. The second is the Petz-Sudar classification \cite{corpus-52}. The parameterizing class of operator monotone functions contains more than one element; for instance the identity function and the affine function $f(x) = (x+1)/2$ are both operator monotone and give different metrics. The uniqueness statement is therefore false in the quantum case, and the last clause follows: a criterion that names a single quantum monotone metric makes an additional choice beyond the classification theorem.
papers/latex/vol-12-principia-physica.tex-352-\end{proof}
papers/latex/vol-12-principia-physica.tex-353-
papers/latex/vol-12-principia-physica.tex-354-\Cref{thm:monotone} fixes what empirical distinguishability can borrow from information geometry. In the classical case the statistical distance is canonical. In the quantum case the statistical distance is a choice inside a proved parameterization, so an observational equivalence relation built on such distances must state the choice.
papers/latex/vol-12-principia-physica.tex-355-
papers/latex/vol-12-principia-physica.tex-356-\subsection{Observational equivalence}
papers/latex/vol-12-principia-physica.tex-357-
--
papers/latex/vol-12-principia-physica.tex-426-\begin{proposition}[Completeness of the constituent record for two constructions]
papers/latex/vol-12-principia-physica.tex-427-\label{thm:conditional}
papers/latex/vol-12-principia-physica.tex-428-Let $P$ be an object assembled by one of two operations. In case (a) $P$ is a finite-dimensional complex $C^*$-algebra written as a direct sum $P \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$, with constituents classified by their block sizes. In case (b) $P$ is a group extension $1 \to N \to P \to Q \to 1$ with a fixed action of $Q$ on $N$, with $N$ and $Q$ classified up to isomorphism and the extension class $g_P$ recorded in $H^2(Q, Z(N))$. In case (a) the multiset of block sizes is a complete invariant of $P$ up to $*$-isomorphism. In case (b) the pair consisting of the invariant records of $N$ and $Q$ and the extension class $g_P$ is a complete invariant of $P$ up to isomorphism of extensions. In both cases the constituent record of \cref{def:constituent} is complete, and the construction maps neither into theories nor into observation data.
papers/latex/vol-12-principia-physica.tex-429-\end{proposition}
papers/latex/vol-12-principia-physica.tex-430-
papers/latex/vol-12-principia-physica.tex-431-\begin{proof}
papers/latex/vol-12-principia-physica.tex:432:In case (a) the block sizes are the dimensions of the simple modules of $P$, which are invariant under $*$-isomorphism, and they determine the algebra by the structure theorem \cite{corpus-9,corpus-42}; this is \cref{lem:blocks}. In case (b) the classification of group extensions with a fixed action states that isomorphism classes of extensions of $Q$ by $N$ correspond bijectively to classes in $H^2(Q, Z(N))$, and an isomorphism of extensions preserves the class while a shared class builds an isomorphism of extensions \cite{corpus-72}. In both cases the record $\mu(P)$ therefore determines $P$ up to the stated equivalence. Neither construction outputs a theory or an observation, so the non-collapse argument of Section~3 leaves realization and selection unconstructed.
papers/latex/vol-12-principia-physica.tex-433-\end{proof}
papers/latex/vol-12-principia-physica.tex-434-
papers/latex/vol-12-principia-physica.tex-435-\begin{remark}[Generation and classification]
papers/latex/vol-12-principia-physica.tex-436-\label{rem:incompat}
papers/latex/vol-12-principia-physica.tex:437:The five obligations concern generation, admissibility, identification, family definitions, and decomposition, and \cref{thm:obstructions} concerns classification by finite or parametric invariants and by algorithms. The two objectives do not contradict each other: finitely presented groups are generated from cyclic groups by free products and quotients, and their Markov properties are algorithmically undecidable \cite{corpus-53}. The objectives meet only in regimes 1 and 2 of \cref{tab:regimes}, where constituents carry classifying invariants and \cref{thm:conditional} applies. In the sectors of \cref{thm:obstructions} the classification-layer objective of \cref{def:layers} is unattainable without restricting the class or weakening the invariant notion.
papers/latex/vol-12-principia-physica.tex-438-\end{remark}
papers/latex/vol-12-principia-physica.tex-439-
papers/latex/vol-12-principia-physica.tex-440-\Cref{thm:conditional} covers the two constructions where extension theory is established. The analogous completeness statement for the remaining admissible constructions is conditional on the five obligations of \cref{conj:structural}, of which one is partial and four are open, and on uniqueness of decomposition, which the program leaves open; it is not claimed here. Its conclusion would stop at the mathematical layer. The regime analysis of \cref{sec:mathlayer} bounds its scope further: inside a target class, the classifying data must live in a regime of \cref{tab:regimes} where invariants are finite or explicitly parameterized, and outside those regimes \cref{thm:obstructions} forbids the classification the conjecture would deliver.
papers/latex/vol-12-principia-physica.tex-441-
papers/latex/vol-12-principia-physica.tex-442-\begin{remark}
papers/latex/vol-12-principia-physica.tex-443-The conjecture may also fail. The founding program records that proving either a complete classification of a specified class or the impossibility of natural classification objectives without additional restrictions is a meaningful mathematical result. The obstruction register already delivers the second kind of result in six sectors.
--
papers/latex/vol-12-principia-physica.tex-462-\end{proof}
papers/latex/vol-12-principia-physica.tex-463-
papers/latex/vol-12-principia-physica.tex-464-The blocks $M_{n_i}(\mathbb{C})$ are the irreducible constituents under the direct-sum construction, so this example displays decomposition and irreducibility exactly as \cref{def:irreducible} requires, and \cref{lem:blocks} shows the decomposition unique in this restricted class.
papers/latex/vol-12-principia-physica.tex-465-
papers/latex/vol-12-principia-physica.tex-466-At the realization layer, $A$ acts on a Hilbert space and states are density matrices on $\mathbb{C} \oplus \mathbb{C}^2$. The representation is the standard one from the Gelfand-Naimark embedding \cite{corpus-42}, which is a representation theorem and not a classification theorem; the classification content is the dimension vector from the layer above.
papers/latex/vol-12-principia-physica.tex-467-
papers/latex/vol-12-principia-physica.tex:468:At the empirical layer, measurement statistics on states define distinguishability. The classical statistical distance is canonical by \cref{thm:monotone}, and the quantum statistical distance is one choice inside the parametric family of operator monotone functions. Two admissible choices give two inequivalent distinguishability structures on the same classified algebra, so the empirical layer carries data the mathematical layer does not determine.
papers/latex/vol-12-principia-physica.tex-469-
papers/latex/vol-12-principia-physica.tex-470-\subsection{Classical mechanics}
papers/latex/vol-12-principia-physica.tex-471-
papers/latex/vol-12-principia-physica.tex-472-Let $(M, \omega)$ be a symplectic manifold with Hamiltonian dynamics. At the mathematical layer, Darboux's theorem removes all local invariants \cite{corpus-6}, so the classifying data is global: the topology of $\omega$ and its cohomology class are candidate data, and Poisson geometry adds Weinstein splitting, the symplectic-leaf foliation, and coadjoint orbits for the Kirillov-Kostant-Souriau case \cite{corpus-7,corpus-68}. Local classification is complete and trivial, and the classification content is entirely global.
papers/latex/vol-12-principia-physica.tex-473-
papers/latex/vol-12-principia-physica.tex:474:At the realization layer, Hamiltonian vector fields realize the dynamics and the observable algebra is the algebra of smooth functions on $M$. At the empirical layer, the Fisher metric is the unique monotone metric up to constant factor \cite{corpus-52}, so classical statistical distinguishability is canonical. The bridge from this family to the quantum family through deformation quantization is a programmatic link and not an equivalence theorem, so no classical-to-quantum conclusion crosses the layer boundary.
papers/latex/vol-12-principia-physica.tex-475-
papers/latex/vol-12-principia-physica.tex-476-\subsection{Gauge theory and the claim register}
papers/latex/vol-12-principia-physica.tex-477-
papers/latex/vol-12-principia-physica.tex-478-Let $P \to X$ be a principal $G$-bundle with connection. At the mathematical layer, principal bundles are classified by homotopy classes of maps into the classifying space $BG$, and characteristic classes are pullbacks of universal classes \cite{corpus-17,corpus-18}. Anomalies are classified as obstruction classes: quantization exists exactly when the relevant classes vanish \cite{corpus-19}. This is regime 3, complete as obstruction, and it is the volume's sharpest example of classification content that is an impossibility statement.
papers/latex/vol-12-principia-physica.tex-479-
papers/latex/vol-12-principia-physica.tex-480-At the realization layer, the reconstruction of an interacting four-dimensional quantum field theory from such data is claimed rather than established. The announced existence result carries the status existence claimed; manuscript and formalization withheld; verification pending \cite{corpus-24,corpus-25}. At the empirical layer, the mass gap remains open \cite{corpus-23}, lattice theorems hold only in restricted regimes \cite{corpus-30,corpus-31,corpus-32}, and no entry of \cref{tab:claims} closes the continuum limit. The example therefore shows the three layers in three different states: proved at $\mathcal{M}$, claimed at $\mathcal{R}$, open at $\mathcal{E}$.
--
papers/latex/vol-12-principia-physica.tex-493-Deliverable & Current state \\
papers/latex/vol-12-principia-physica.tex-494-\midrule
papers/latex/vol-12-principia-physica.tex-495-Admissibility conditions defining the target class & Unfixed, so statements over the class are conditional \\
papers/latex/vol-12-principia-physica.tex-496-Preservation laws and composition rules for morphisms & Unfixed, so the ambient category is a schema \\
papers/latex/vol-12-principia-physica.tex-497-A chosen physical equivalence with declared preserved structure & Open, constrained by the isocategorical counterexample \\
papers/latex/vol-12-principia-physica.tex-498-A constructed realization map from structures to theories & Stipulated only \\
papers/latex/vol-12-principia-physica.tex:499:A constructed selection map from theories to observations & Not constructed in the record \\
papers/latex/vol-12-principia-physica.tex-500-Regime-appropriate objectives & Established by the regime analysis of \cref{tab:regimes} and by \cref{thm:obstructions} \\
papers/latex/vol-12-principia-physica.tex-501-A verification layer for the registered proofs & No record carries a completed proof-assistant check \\
papers/latex/vol-12-principia-physica.tex-502-Criteria for physical validation of the architecture & Open, level named but its criteria unstated \\
papers/latex/vol-12-principia-physica.tex-503-\bottomrule
papers/latex/vol-12-principia-physica.tex-504-\end{tabularx}
papers/latex/vol-12-principia-physica.tex-505-\end{table}
papers/latex/vol-12-principia-physica.tex-506-
papers/latex/vol-12-principia-physica.tex-507-The first three deliverables are definitional. Until the admissibility conditions are fixed, every theorem over the admissible class is conditional on the chosen conditions. Until the morphism rules are fixed, the ambient category is a schema, and any theorem must state which morphism classes are in force. The equivalence must name the structure it preserves, and the isocategorical counterexample shows what happens otherwise \cite{corpus-12}.
papers/latex/vol-12-principia-physica.tex-508-
papers/latex/vol-12-principia-physica.tex:509:The fourth and fifth deliverables are constructions, and neither exists in the record. The realization map is stipulated as an arrow in the architecture and never built; the selection map has no definition of its observation object, no domain, no codomain, and no composition rule with coarse-graining. Until both are built, the identity of \cref{thm:conditional} stops at the mathematical layer.
papers/latex/vol-12-principia-physica.tex-510-
papers/latex/vol-12-principia-physica.tex-511-The sixth deliverable is what this paper supplies. Restricted classification theorems are the right objective where invariants are finite or explicitly parameterized, and obstruction theorems are the right objective everywhere else. A rigorous impossibility result is a valuable outcome of the program, not a consolation.
papers/latex/vol-12-principia-physica.tex-512-
papers/latex/vol-12-principia-physica.tex-513-The seventh deliverable is verification. No proof in the series has been checked by a proof-assistant kernel. The executable taxonomy code in the source directory is computational evidence: it is validated against stated specifications and has not been checked by a kernel. The verification directory records ten mechanization targets matching the definitions and theorems above. Mechanization is future work.
papers/latex/vol-12-principia-physica.tex-514-
papers/latex/vol-12-principia-physica.tex-515-The eighth deliverable is the hardest. Physical validation would require empirical criteria that the architecture could pass and its rivals fail. The corpus names the level and does not fix its criteria. Until those criteria exist, the architecture is a mathematical research program with proved components and an unvalidated assembly.
--
papers/latex/vol-12-principia-physica.tex-520-Four limitations bound this synthesis. The assembly inherits the statuses of the program registry, and any status revision propagates. Three entries rest on single sources and were not independently re-verified here: the extra $Z_2$ sector of higher-form DHR theory \cite{corpus-20}, the journal-published mass-gap claim \cite{corpus-28}, and the Borel-reducibility obstruction announced at the survey level \cite{corpus-59}. The literature survey behind the registry ran on the arXiv API plus known-URL fetches, so non-arXiv venues may be under-covered, and absence of a citation here is not evidence of absence. The regime taxonomy organizes the registered domains and proves a coverage statement about them; it does not classify all of mathematics.
papers/latex/vol-12-principia-physica.tex-521-
papers/latex/vol-12-principia-physica.tex-522-The formal statements of this paper are assembly results: coverage statements about a finite registry, reductions to the registered impossibility theorems, necessity statements about structure hypotheses, and one conditional reduction. No new classifying invariant is introduced.
papers/latex/vol-12-principia-physica.tex-523-
papers/latex/vol-12-principia-physica.tex-524-\section{Conclusion}
papers/latex/vol-12-principia-physica.tex-525-
papers/latex/vol-12-principia-physica.tex:526:The assembly establishes four things. Every domain of the program comparison spine sits in exactly one classification regime, fifteen of them with finite or explicitly parameterized invariants and complete classification theorems. Seven obstruction theorems forbid classification in the wild, non-amenable, and undecidable sectors, so classification objectives must match regimes. Every realization and identification theorem fails or becomes open when its structure hypotheses are dropped, so identifications must declare preserved structure. And the structural classification conjecture, under its five obligations, would complete the mathematical layer for a targeted class while leaving realization and selection untouched.
papers/latex/vol-12-principia-physica.tex-527-
papers/latex/vol-12-principia-physica.tex:528:What remains uncertain is equally sharp. The admissibility conditions are unfixed. The physical equivalence is unchosen. The realization and selection maps are stipulated and not constructed. The announced four-dimensional existence result carries the status existence claimed; manuscript and formalization withheld; verification pending, and the mass gap is open. No record carries a completed computer-checked proof. The central test of the realization layer, reconstruction of interacting dynamics and spacetime without presupposing spacetime, is unanswered.
papers/latex/vol-12-principia-physica.tex-529-
papers/latex/vol-12-principia-physica.tex-530-What follows is the founding program's own calibration. The architecture is precise enough to organize a substantial long-term mathematical research program, and its components produce valuable results even if a universal classification theorem proves unattainable. The program should be prepared to prove either that a specified class admits a complete classification or that certain natural classification objectives are impossible without additional restrictions. Both are meaningful mathematical results, and the obstruction register has already begun to deliver the second.
papers/latex/vol-12-principia-physica.tex-531-
papers/latex/vol-12-principia-physica.tex-532-\appendix
papers/latex/vol-12-principia-physica.tex-533-\section{Code evidence}
papers/latex/vol-12-principia-physica.tex-534-\label{app:code}
--
papers/latex/vol-12-principia-physica.tex-545-\midrule
papers/latex/vol-12-principia-physica.tex-546-Regime counts of \cref{tab:regimes} are 15, 1, 1, 7, 3, 1, 1 & \texttt{regime\_counts} & \texttt{phase\_d\_registry\_audit.py} \\
papers/latex/vol-12-principia-physica.tex-547-The obligation scoreboard of \cref{tab:obligations} is four open and one partial & \texttt{obligation\_scoreboard} & \texttt{phase\_d\_registry\_audit.py} \\
papers/latex/vol-12-principia-physica.tex-548-Registry record counts are 20 background, 7 obstruction, 7 open problem, and 5 claim-ledger entries & \texttt{record\_counts} over the enumerated record list & \texttt{phase\_d\_registry\_audit.py} \\
papers/latex/vol-12-principia-physica.tex-549-No enumerated registry record reaches evidence grade 3 & \texttt{layer\_separation} over per-record grades & \texttt{phase\_d\_registry\_audit.py} \\
papers/latex/vol-12-principia-physica.tex-550-The dimension vector $\{1,2\}$ is the classification data of the example and block order does not affect it & \texttt{dimensionVectorExample}, \texttt{classificationOrderCheck} & \texttt{Instances.hs} \\
papers/latex/vol-12-principia-physica.tex:551:The example algebra decomposes into two one-block factors and reassembles from them & \texttt{decompositionExample}, \texttt{decompositionCheck} & \texttt{Instances.hs} \\
papers/latex/vol-12-principia-physica.tex-552-\bottomrule
papers/latex/vol-12-principia-physica.tex-553-\end{tabularx}
papers/latex/vol-12-principia-physica.tex-554-\end{table}
papers/latex/vol-12-principia-physica.tex-555-
papers/latex/vol-12-principia-physica.tex-556-\begin{thebibliography}{72}
papers/latex/vol-12-principia-physica.tex-557-\small
--
papers/latex/vol-12-principia-physica.tex-673-
papers/latex/vol-12-principia-physica.tex-674-
papers/latex/vol-12-principia-physica.tex-675-
papers/latex/vol-12-principia-physica.tex-676-\bibitem[62]{corpus-62} F. J. Murray and J. von Neumann, On rings of operators IV, Annals of Mathematics 44 (1943) 716--808. \url{https://doi.org/10.2307/1969107}.
papers/latex/vol-12-principia-physica.tex-677-
papers/latex/vol-12-principia-physica.tex-678-
papers/latex/vol-12-principia-physica.tex:679:\bibitem[64]{corpus-64} A. Connes, Classification of injective factors, Annals of Mathematics 104 (1976) 73--115. \url{https://doi.org/10.2307/1971057}.
papers/latex/vol-12-principia-physica.tex-680-
papers/latex/vol-12-principia-physica.tex:681:\bibitem[65]{corpus-65} D. McDuff, Uncountably many $\mathrm{II}_1$ factors, Annals of Mathematics 90 (1969) 361--371. \url{https://doi.org/10.2307/1970730}.
papers/latex/vol-12-principia-physica.tex-682-
papers/latex/vol-12-principia-physica.tex-683-
papers/latex/vol-12-principia-physica.tex-684-\bibitem[67]{corpus-67} S. Doplicher and J. E. Roberts, A new duality theory for compact groups, Inventiones Mathematicae 98 (1989) 157--218. \url{https://doi.org/10.1007/bf01388849}.
papers/latex/vol-12-principia-physica.tex-685-
papers/latex/vol-12-principia-physica.tex-686-\bibitem[68]{corpus-68} A. Weinstein, The local structure of Poisson manifolds, Journal of Differential Geometry 18 (1983) 523--557. \url{https://doi.org/10.4310/jdg/1214437787}.
papers/latex/vol-12-principia-physica.tex-687-
--
papers/latex/vol-02-structural-families.tex-70-\label{sec:defs}
papers/latex/vol-02-structural-families.tex-71-
papers/latex/vol-02-structural-families.tex-72-The ontology of the series fixes the ambient vocabulary. An object of the category of representations of physical systems is a record $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ carrying a state space or geometric structure, an observable algebra or collection, dynamical laws, symmetry and constraint data, and composition or interaction rules. The five components need not be independent. The record is a candidate definition and not a theorem: a universally accepted mathematical definition of every possible physical system does not exist, and establishing one is the first major research problem of the program. Part 1 of this series fixes the vocabulary reused here.
papers/latex/vol-02-structural-families.tex-73-
papers/latex/vol-02-structural-families.tex-74-\begin{definition}[Morphism of records]
papers/latex/vol-02-structural-families.tex-75-\label{def:morphism}
papers/latex/vol-02-structural-families.tex:76:A \emph{morphism} $f \colon P_1 \to P_2$ of records is a tuple of maps, one per component, that are compatible with the stated composition rules of the two records. The classes of morphism in force below are exact equivalence (invertible), coarse-graining (forgetting microscopic detail while preserving named macroscopic observables), embedding (realizing $P_1$ inside $P_2$), duality (invertible only after passage to an appropriate opposite category), and limiting procedure. \emph{Status: stipulative}. A single ambient category for all five classes is not established, and the preservation laws under which two morphisms of a given class compose are open. Until those laws are fixed, the record is a schema rather than a category, and every statement below names the morphism class it uses.
papers/latex/vol-02-structural-families.tex-77-\end{definition}
papers/latex/vol-02-structural-families.tex-78-
papers/latex/vol-02-structural-families.tex-79-Two equivalence relations run through the paper. Mathematical equivalence is isomorphism of the record in the ambient category of each component. Physical equivalence, written $\simeq$, is a chosen equivalence relation on objects and is strictly coarser in general. Two mathematical descriptions may be physically equivalent without being mathematically isomorphic. Every classification statement below fixes which relation is in force.
papers/latex/vol-02-structural-families.tex-80-
papers/latex/vol-02-structural-families.tex-81-\begin{definition}[Family record]
papers/latex/vol-02-structural-families.tex-82-\label{def:family-record}
--
papers/latex/vol-02-structural-families.tex-87-\label{def:sector}
papers/latex/vol-02-structural-families.tex-88-A family record is \emph{invariant-complete} when its invariant is classifying in the sense of \Cref{def:family-record}. A \emph{sector} of a family is a full subcategory of it. A sector is invariant-complete when the restricted record is.
papers/latex/vol-02-structural-families.tex-89-\end{definition}
papers/latex/vol-02-structural-families.tex-90-
papers/latex/vol-02-structural-families.tex-91-\begin{definition}[Structural family]
papers/latex/vol-02-structural-families.tex-92-\label{def:structural-family}
papers/latex/vol-02-structural-families.tex:93:A \emph{structural family} is a family record $(\mathfrak{F}, V, I)$ whose objects are singled out by the mathematical structure of their state space, observable algebra, or both. The families are defined by the structure each one singles out and not by a partition of records, so a record whose components carry structure of several kinds belongs to each of the corresponding families. A structural family is \emph{fundamental} for a class of physical systems when every object in that class lies in the closure of the family under the admissible constructions. The admissible constructions are tensor product, direct sum, extension, limits and colimits, factorization, and quotient or symmetry reduction.
papers/latex/vol-02-structural-families.tex-94-\end{definition}
papers/latex/vol-02-structural-families.tex-95-
papers/latex/vol-02-structural-families.tex-96-The closure of a collection $\mathfrak{G}$ under a set of constructions $\mathcal{K}$ is the smallest class containing $\mathfrak{G}$ and closed under $\mathcal{K}$, written $\langle \mathfrak{G} \rangle_{\mathcal{K}}$. The long-term target of the program is the identity $\mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F}_1, \dots, \mathfrak{F}_n \rangle_{\mathcal{K}}$ between the class of admissible physical systems and the closure of a finite family list. That identity is a research objective. No result below assumes it.
papers/latex/vol-02-structural-families.tex-97-
papers/latex/vol-02-structural-families.tex-98-\subsection{The five components and the invariant record}
papers/latex/vol-02-structural-families.tex-99-\label{sec:components}
--
papers/latex/vol-02-structural-families.tex-192-\end{proposition}
papers/latex/vol-02-structural-families.tex-193-
papers/latex/vol-02-structural-families.tex-194-\begin{proof}
papers/latex/vol-02-structural-families.tex-195-The three conditions of \Cref{def:kinds} are tested in order. If no theorem on record names a classifying invariant and no impossibility theorem is on record, the kind is no record, and no other kind applies since the others all presuppose one of the two kinds of record. If an impossibility theorem is on record, the kind is impossible, and no other kind applies. If a theorem names a classification and the classified target is the obstructions, the kind is complete as an obstruction classification. If it names a classification of objects, the attained values either form an explicitly described subset of a structured range or they do not, which is exactly the remaining pair. The tests are disjoint at each stage and cover every case at each stage, so one and only one kind applies.
papers/latex/vol-02-structural-families.tex-196-\end{proof}
papers/latex/vol-02-structural-families.tex-197-
papers/latex/vol-02-structural-families.tex:198:The five kinds are realized in the families below. The Killing-Cartan and highest weight classifications are complete and parameterized \cite{lie,hw}. The finite simple groups are classified and not uniformly parameterized \cite{cfsg,solomon}. Anomalies are classified as obstructions to quantization \cite{anomaly}. General separable type $\mathrm{II}_1$ factors are impossible to classify \cite{vnalg}. Sectors with no record at all, such as the semigroup family, realize the fifth kind, and \Cref{prop:kinds} accounts for them rather than excluding them.
papers/latex/vol-02-structural-families.tex-199-
papers/latex/vol-02-structural-families.tex-200-\begin{table}[ht]
papers/latex/vol-02-structural-families.tex-201-\centering
papers/latex/vol-02-structural-families.tex-202-\small
papers/latex/vol-02-structural-families.tex-203-\caption{Achievement kinds realized inside the ten families. A family occupies more than one row when its sectors differ.}
papers/latex/vol-02-structural-families.tex-204-\label{tab:kinds}
--
papers/latex/vol-02-structural-families.tex-206-\toprule
papers/latex/vol-02-structural-families.tex-207-Kind & Realized in & Invariant range \\
papers/latex/vol-02-structural-families.tex-208-\midrule
papers/latex/vol-02-structural-families.tex-209-Complete and parameterized & Complex semisimple Lie algebras \cite{lie}, finite-dimensional irreducible representations \cite{hw}, finite-dimensional $C^*$-algebras \cite{calg} & Dynkin diagram, dominant integral weight, dimension vector \\
papers/latex/vol-02-structural-families.tex-210-Complete and unparameterized & Finite simple groups \cite{cfsg,solomon} & Atlas data, with no uniform description \\
papers/latex/vol-02-structural-families.tex-211-Complete as obstruction classification & Anomalies in gauge theories \cite{anomaly} & Cohomological obstruction classes whose vanishing is required \\
papers/latex/vol-02-structural-families.tex:212:Impossible & General separable type $\mathrm{II}_1$ factors \cite{vnalg} & No range of the required cardinality exists \\
papers/latex/vol-02-structural-families.tex-213-No record & Completely positive maps up to isomorphism \cite{stinespring,qchannel} & The normal form is not an isomorphism classification \\
papers/latex/vol-02-structural-families.tex-214-\bottomrule
papers/latex/vol-02-structural-families.tex-215-\end{tabularx}
papers/latex/vol-02-structural-families.tex-216-\end{table}
papers/latex/vol-02-structural-families.tex-217-
papers/latex/vol-02-structural-families.tex-218-The table makes two points that a status token would hide. A single family can occupy several kinds at once, because its sectors differ in cardinality and in what is classified. And the absence of a record is not the same as impossibility, since an impossibility is a theorem and an absence is a gap.
--
papers/latex/vol-02-structural-families.tex-232-\begin{proposition}[Global invariants of a cotangent bundle]
papers/latex/vol-02-structural-families.tex-233-\label{prop:cotangent}
papers/latex/vol-02-structural-families.tex-234-The zero section of $T^*Q$ is a deformation retract of $T^*Q$. Consequently the homotopy type of the symplectic manifold $T^*Q$ equals the homotopy type of $Q$, and every homotopy invariant of $Q$ is a global invariant of the symplectic record.
papers/latex/vol-02-structural-families.tex-235-\end{proposition}
papers/latex/vol-02-structural-families.tex-236-
papers/latex/vol-02-structural-families.tex-237-\begin{proof}
papers/latex/vol-02-structural-families.tex:238:The maps $r_t \colon T^*Q \to T^*Q$ given by $r_t(x, \xi) = (x, t\xi)$ for $t \in [0,1]$ form a deformation retraction: each $r_t$ is smooth, $r_1$ is the identity, $r_0$ factors through the zero section, and $r_s \circ r_t = r_{st}$ for $s, t \in [0,1]$. The zero section is diffeomorphic to $Q$, so $T^*Q$ and $Q$ are homotopy equivalent and share all homotopy invariants.
papers/latex/vol-02-structural-families.tex-239-\end{proof}
papers/latex/vol-02-structural-families.tex-240-
papers/latex/vol-02-structural-families.tex-241-\Cref{prop:cotangent} supplies an invariant and not a complete one. Two homotopy-equivalent bases need not have symplectomorphic cotangent bundles, and the record also carries the Hamiltonian $H$, which the homotopy type does not see. The scope of the record is therefore the homotopy data of the base, and the record does not claim more.
papers/latex/vol-02-structural-families.tex-242-
papers/latex/vol-02-structural-families.tex-243-\subsection{A finite-dimensional quantum system}
papers/latex/vol-02-structural-families.tex-244-\label{sec:worked-calg}
--
papers/latex/vol-02-structural-families.tex-312-
papers/latex/vol-02-structural-families.tex-313-\section{Family I: symplectic and Poisson structures}
papers/latex/vol-02-structural-families.tex-314-\label{sec:family1}
papers/latex/vol-02-structural-families.tex-315-
papers/latex/vol-02-structural-families.tex-316-This family singles out classical mechanics. Its defining structural data is a symplectic or Poisson state space; systems in it carry function algebras of observables and Hamiltonian dynamics \cite{poisson}. A record whose state space is symplectic belongs to this family whatever else its components carry.
papers/latex/vol-02-structural-families.tex-317-
papers/latex/vol-02-structural-families.tex:318:The local picture is closed. Darboux's theorem gives a normal form and \Cref{prop:globality} extracts its classification consequence. For Poisson manifolds the local picture is also closed and it is not empty: near a point of rank $2k$ a Poisson manifold splits as a symplectic factor times a transverse Poisson factor \cite{poisson}. The symplectic leaves foliate the manifold, and on the dual of a Lie algebra the leaves of the Kirillov-Kostant-Souriau structure are the coadjoint orbits \cite{poisson}.
papers/latex/vol-02-structural-families.tex-319-
papers/latex/vol-02-structural-families.tex-320-\begin{theorem}[Poisson local models]
papers/latex/vol-02-structural-families.tex-321-\label{thm:weinstein}
papers/latex/vol-02-structural-families.tex-322-Near a point of rank $2k$ a Poisson manifold is locally isomorphic to a product of a symplectic manifold of dimension $2k$ and a Poisson manifold whose linearization vanishes at the point \cite{weinstein}. The symplectic leaves form a foliation, and two Poisson manifolds with isomorphic local models need not be globally isomorphic.
papers/latex/vol-02-structural-families.tex-323-\end{theorem}
papers/latex/vol-02-structural-families.tex-324-
--
papers/latex/vol-02-structural-families.tex-341-\begin{proof}[Proof sketch]
papers/latex/vol-02-structural-families.tex-342-The Jacobson radical of a $C^*$-algebra is a closed two-sided $*$-ideal of topologically nilpotent elements and is zero, so $A$ is semisimple. The Artin-Wedderburn theorem then gives $A \cong \bigoplus_i M_{n_i}(D_i)$ with each $D_i$ a division algebra over $\mathbb{C}$. Every finite-dimensional division algebra over $\mathbb{C}$ equals $\mathbb{C}$, because $\mathbb{C}$ is algebraically closed and the minimal polynomial of any element splits. The $C^*$-identity then determines the $*$-structure on each matrix summand, and an isomorphism of the algebras that respects the $*$-structure permutes the simple summands. Uniqueness of the multiset is the uniqueness of the Wedderburn decomposition of a semisimple algebra. At fixed total dimension $d$ the number of multisets whose squares sum to $d$ is finite, which is the stated bound.
papers/latex/vol-02-structural-families.tex-343-\end{proof}
papers/latex/vol-02-structural-families.tex-344-
papers/latex/vol-02-structural-families.tex-345-\Cref{thm:calg} is the sector in which the invariant discipline behaves exactly as intended: one named invariant, a finite range, a complete determination. It is also the sector that the later volume on irreducibility and decomposition takes as its model theorem.
papers/latex/vol-02-structural-families.tex-346-
papers/latex/vol-02-structural-families.tex:347:The infinite-dimensional picture is different in kind. Amenable factors are classified by Murray-von Neumann type and Connes invariants \cite{vnalg}. Beyond the amenable class, there are uncountably many pairwise non-isomorphic separable type $\mathrm{II}_1$ factors, constructed by McDuff \cite{mcduff}. By \Cref{thm:sharpness} no invariant with countable range classifies that sector. That consequence is what uncountability alone delivers, and a stronger obstruction is known: the isomorphism relation on separable type $\mathrm{II}_1$ factors is not classifiable by countable structures, in the sense of Borel reducibility \cite{sasyk}. The parametric question is therefore closed in the negative rather than left open. The row of the family table records the countable-invariant obstruction and cites the stronger one.
papers/latex/vol-02-structural-families.tex-348-
papers/latex/vol-02-structural-families.tex-349-\begin{remark}[What the impossibility does and does not say]
papers/latex/vol-02-structural-families.tex-350-\label{rem:mcduff}
papers/latex/vol-02-structural-families.tex:351:The impossibility is a theorem of McDuff \cite{mcduff} about the sector of all separable type $\mathrm{II}_1$ factors. It does not forbid restricted classification under extra hypotheses such as amenability, and it does not bear on the finite-dimensional sector of \Cref{thm:calg}. The row of the family table for this family records all three situations at once, which is why a single status token per family is not enough.
papers/latex/vol-02-structural-families.tex-352-\end{remark}
papers/latex/vol-02-structural-families.tex-353-
papers/latex/vol-02-structural-families.tex-354-Completely positive maps and quantum channels sit in this family through Stinespring dilation and the Kraus form \cite{stinespring,qchannel}. The classification status of that data is treated in \Cref{sec:family7}, where the maps are the objects rather than the ambient structure.
papers/latex/vol-02-structural-families.tex-355-
papers/latex/vol-02-structural-families.tex-356-\section{Family III: smooth manifolds and geometric structures}
papers/latex/vol-02-structural-families.tex-357-\label{sec:family3}
papers/latex/vol-02-structural-families.tex-358-
papers/latex/vol-02-structural-families.tex-359-This family singles out relativity. Its defining structural data is a smooth manifold with additional geometric structure, carrying function or operator algebras of observables and a flow or field equation as dynamics.
papers/latex/vol-02-structural-families.tex-360-
papers/latex/vol-02-structural-families.tex-361-Three classification results are on record and each holds in a restricted regime. The holonomy groups of connected Lorentzian manifolds of signature $(1, n-1)$ are classified by a Berger-list analogue, with realizing metrics constructed \cite{holonomy}. The causal hierarchy of spacetimes is complete as a ladder of conditions from the weakest to global hyperbolicity \cite{causal}. Closed three-manifolds are classified up to homeomorphism by geometrization: each decomposes into pieces carrying exactly one of eight Thurston geometries \cite{geometrization}.
papers/latex/vol-02-structural-families.tex-362-
papers/latex/vol-02-structural-families.tex:363:Dimension four is the boundary. Only restricted classes of four-manifolds are classified, by eighteen model geometries together with one countably infinite family, and recognition is not algorithmic: the homeomorphism problem for a connected sum of nine copies of $S^2 \times S^2$ is undecidable \cite{tancer}.
papers/latex/vol-02-structural-families.tex-364-
papers/latex/vol-02-structural-families.tex-365-\begin{proposition}[Recognition without classification]
papers/latex/vol-02-structural-families.tex-366-\label{prop:recognition}
papers/latex/vol-02-structural-families.tex:367:There exist four-manifolds for which homeomorphism is undecidable. Consequently no algorithm whose output is a classifying invariant in a decidable range can classify all four-manifolds, and any classification statement in this regime must restrict the class of manifolds under consideration.
papers/latex/vol-02-structural-families.tex-368-\end{proposition}
papers/latex/vol-02-structural-families.tex-369-
papers/latex/vol-02-structural-families.tex-370-\begin{proof}
papers/latex/vol-02-structural-families.tex:371:Undecidability of the homeomorphism problem for the stated family of four-manifolds is proved in \cite{tancer}, and the analogous undecidability for group-theoretic Markov properties is the classical Adyan-Rabin theorem \cite{adyanrabin}. An algorithm producing a decidable classifying invariant would decide homeomorphism by comparing outputs, which contradicts undecidability. So no such algorithm exists on the unrestricted class.
papers/latex/vol-02-structural-families.tex-372-\end{proof}
papers/latex/vol-02-structural-families.tex-373-
papers/latex/vol-02-structural-families.tex-374-\section{Family IV: principal bundles and connections}
papers/latex/vol-02-structural-families.tex-375-\label{sec:family4}
papers/latex/vol-02-structural-families.tex-376-
papers/latex/vol-02-structural-families.tex-377-This family represents gauge theories. Its state spaces are spaces of connections on a principal bundle, its observables are gauge-invariant functionals or operator algebras, and its symmetries are gauge group actions.
--
papers/latex/vol-02-structural-families.tex-393-This family represents statistical physics. Its state spaces are spaces of probability measures or density operators, its observables are measurable functions or operators, and its composition rule is product measure or tensor product.
papers/latex/vol-02-structural-families.tex-394-
papers/latex/vol-02-structural-families.tex-395-The classical row carries the one uniqueness result in the ten families.
papers/latex/vol-02-structural-families.tex-396-
papers/latex/vol-02-structural-families.tex-397-\begin{theorem}[Chentsov]
papers/latex/vol-02-structural-families.tex-398-\label{thm:chentsov}
papers/latex/vol-02-structural-families.tex:399:On the classical statistical state space of a finite sample space, the Fisher metric is the unique Riemannian metric, up to a positive constant factor, that is monotone under stochastic maps. The uniqueness is recorded in the survey literature as the classical anchor of the monotone-metric classification \cite{petz}, and the quantum analogue there is parametric rather than unique.
papers/latex/vol-02-structural-families.tex-400-\end{theorem}
papers/latex/vol-02-structural-families.tex-401-
papers/latex/vol-02-structural-families.tex:402:The quantum analogue fails to be unique. Monotone metrics on quantum state spaces are classified parametrically by operator monotone functions, which form a continuum and not a finite list \cite{petz}. Classical uniqueness therefore does not transfer to the quantum case, and any classification statement in this family must record which side of that line it stands on.
papers/latex/vol-02-structural-families.tex-403-
papers/latex/vol-02-structural-families.tex-404-\begin{remark}[Scope of the uniqueness]
papers/latex/vol-02-structural-families.tex-405-\label{rem:chentsov-scope}
papers/latex/vol-02-structural-families.tex-406-The uniqueness is a statement about metrics monotone under stochastic maps on the classical state space. It is not a classification of classical statistical systems, and it is not a statement about quantum state spaces. Uniqueness and classification are separate achievements, as \Cref{cor:parameterization} records.
papers/latex/vol-02-structural-families.tex-407-\end{remark}
papers/latex/vol-02-structural-families.tex-408-
--
papers/latex/vol-02-structural-families.tex-410-\label{sec:binary}
papers/latex/vol-02-structural-families.tex-411-
papers/latex/vol-02-structural-families.tex-412-Take the state space of probability vectors $(p, 1-p)$ with $p \in (0,1)$ and the observable algebra of real functions on $\{0, 1\}$. The Fisher metric in the coordinate $p$ is
papers/latex/vol-02-structural-families.tex-413-\[
papers/latex/vol-02-structural-families.tex-414-g_{pp} = \frac{1}{p(1-p)}.
papers/latex/vol-02-structural-families.tex-415-\]
papers/latex/vol-02-structural-families.tex:416:Up to a positive constant factor this is the only Riemannian metric on this state space that is monotone under stochastic maps, by \Cref{thm:chentsov}. What is unique is the metric as ambient geometry on the state space, and not the physical system record. The record carries a state space, a two-point function algebra of observables, and a Markov kernel as dynamics, and the metric does not classify the record: two binary systems with different kernels are not equivalent, and both carry the same metric up to scale. This sector therefore has no classifying invariant on record, and the uniqueness of the metric is a statement about geometry rather than about classification.
papers/latex/vol-02-structural-families.tex-417-
papers/latex/vol-02-structural-families.tex:418:The quantum analogue of the same two-point system has a state space of $2 \times 2$ density matrices and a continuum of monotone metrics, parametrized by operator monotone functions \cite{petz}. The classical row is therefore a uniqueness statement of a kind the quantum row does not have.
papers/latex/vol-02-structural-families.tex-419-
papers/latex/vol-02-structural-families.tex-420-\section{Family VI: topological and higher-categorical structures}
papers/latex/vol-02-structural-families.tex-421-\label{sec:family6}
papers/latex/vol-02-structural-families.tex-422-
papers/latex/vol-02-structural-families.tex-423-This family represents topological quantum field theories. Its state spaces are spaces of fields on a manifold, its observables are topological invariants, and its composition rule is gluing of manifolds.
papers/latex/vol-02-structural-families.tex-424-
--
papers/latex/vol-02-structural-families.tex-451-\begin{proposition}[Kraus rank is not injective on channels]
papers/latex/vol-02-structural-families.tex-452-\label{prop:kraus}
papers/latex/vol-02-structural-families.tex-453-Fix the equivalence relation on channels to be equality of completely positive maps. Let $\Phi_U \colon M_2(\mathbb{C}) \to M_2(\mathbb{C})$ be the channel $\Phi_U(X) = U X U^*$ for $U \in U(2)$. Every $\Phi_U$ has Kraus rank one, and the set of distinct channels of this form is in bijection with $PU(2)$, which is not a point. The assignment from channels to Kraus rank is therefore not injective under equality of maps, and Kraus rank is not a classifying invariant for this family under that relation.
papers/latex/vol-02-structural-families.tex-454-\end{proposition}
papers/latex/vol-02-structural-families.tex-455-
papers/latex/vol-02-structural-families.tex-456-\begin{proof}
papers/latex/vol-02-structural-families.tex:457:For each $U$ the single Kraus operator $U$ realizes $\Phi_U$, and no shorter dilation exists because $\Phi_U$ is nonzero. So the Kraus rank is one for every $U$. Two operators $U, U'$ give the same map exactly when $UXU^* = U'XU'^*$ for all $X \in M_2(\mathbb{C})$, which forces $U' = \lambda U$ for a scalar $\lambda$ of unit modulus. The distinct channels of this form are therefore parametrized by $PU(2)$, which is positive dimensional, and the fiber of the rank map over $1$ is not a point.
papers/latex/vol-02-structural-families.tex-458-\end{proof}
papers/latex/vol-02-structural-families.tex-459-
papers/latex/vol-02-structural-families.tex:460:The choice of equivalence in \Cref{prop:kraus} is load-bearing and the conclusion changes with it. Under simultaneous unitary conjugacy the classes of these channels are the conjugacy classes of $PU(2)$, parametrized by a rotation angle in $[0, \pi]$, and rank is still not complete on them. Under two-sided conjugacy by automorphisms of $M_2(\mathbb{C})$ every unitary channel is isomorphic to the identity channel, so this particular family is not an isomorphism counterexample in that sense. What the proposition establishes is the narrow and sufficient claim that one scalar of a normal form does not classify: recording that scalar as though it were an isomorphism classification would produce a false row in the family table.
papers/latex/vol-02-structural-families.tex-461-
papers/latex/vol-02-structural-families.tex-462-\section{Family VIII: tensor categories and compositional structures}
papers/latex/vol-02-structural-families.tex-463-\label{sec:family8}
papers/latex/vol-02-structural-families.tex-464-
papers/latex/vol-02-structural-families.tex-465-This family represents quantum information. Its objects are tensor categories, its morphisms are tensor functors, and its composition rule is the monoidal product.
papers/latex/vol-02-structural-families.tex-466-
--
papers/latex/vol-02-structural-families.tex-506-A dichotomy theorem classifies the objects of a theory into two classes and classifies neither class internally. The row for this family in the chart below is complete at the level of the dichotomy and open at the level of the two sides.
papers/latex/vol-02-structural-families.tex-507-\end{remark}
papers/latex/vol-02-structural-families.tex-508-
papers/latex/vol-02-structural-families.tex-509-\section{Exceptional structures}
papers/latex/vol-02-structural-families.tex-510-\label{sec:exceptional}
papers/latex/vol-02-structural-families.tex-511-
papers/latex/vol-02-structural-families.tex:512:The chart of families is not a chart of everything. Two kinds of additional structure sit beside it: genuinely exceptional objects, and distinguished objects that are canonical rather than exceptional. Both kinds are simple or indecomposable in their ambient categories, and that is the property the table below uses: the twenty-six sporadic simple groups together with the cyclic, alternating, and Lie-type families \cite{cfsg,solomon,atlas}; the exceptional Lie algebras $\mathrm{G}_2$, $\mathrm{F}_4$, $\mathrm{E}_6$, $\mathrm{E}_7$, $\mathrm{E}_8$ \cite{lie}; the type $\mathrm{III}_0$ and type $\mathrm{III}_1$ factors and the hyperfinite $\mathrm{II}_1$ factor \cite{vnalg}; the eight Thurston geometries \cite{geometrization} and the bounded list of four-dimensional model geometries that Filipkiewicz enumerated, recorded in the survey literature beside the unrecognizability results of \cite{tancer}; and pairs of non-isomorphic finite groups with equivalent plain-tensor representation categories \cite{etingof}.
papers/latex/vol-02-structural-families.tex-513-
papers/latex/vol-02-structural-families.tex-514-\begin{table}[ht]
papers/latex/vol-02-structural-families.tex-515-\centering
papers/latex/vol-02-structural-families.tex-516-\small
papers/latex/vol-02-structural-families.tex-517-\caption{Collections of simple or indecomposable objects recorded beside the families. The last column states why none of them is closed under direct sum; that property is about simplicity and not about exceptionality.}
papers/latex/vol-02-structural-families.tex-518-\label{tab:exceptional}
papers/latex/vol-02-structural-families.tex-519-\begin{tabularx}{\textwidth}{L{0.22\textwidth} X L{0.30\textwidth}}
papers/latex/vol-02-structural-families.tex-520-\toprule
papers/latex/vol-02-structural-families.tex-521-Collection & What it is & Why it is not closed under direct sum \\
papers/latex/vol-02-structural-families.tex-522-\midrule
papers/latex/vol-02-structural-families.tex-523-Sporadic simple groups & Finite simple groups outside the cyclic, alternating, and Lie-type families \cite{cfsg,solomon} & Direct sum or direct product of two such groups is not simple \\
papers/latex/vol-02-structural-families.tex-524-Exceptional Lie algebras & The five simple Lie algebras of types $\mathrm{G}_2$, $\mathrm{F}_4$, $\mathrm{E}_6$, $\mathrm{E}_7$, $\mathrm{E}_8$ \cite{lie} & Direct sum of two of them is not simple \\
papers/latex/vol-02-structural-families.tex:525:Distinguished factors & Type $\mathrm{III}_0$, type $\mathrm{III}_1$, and the hyperfinite $\mathrm{II}_1$ factor \cite{vnalg}, none of them exceptional & Direct sum of any two factors has nontrivial center and is not a factor \\
papers/latex/vol-02-structural-families.tex-526-Thurston geometries & The eight model geometries in dimension three \cite{geometrization} & Connected sum of geometrized manifolds need not carry a single geometry \\
papers/latex/vol-02-structural-families.tex-527-Isocategorical pairs & Non-isomorphic finite groups with equivalent plain-tensor categories \cite{etingof} & Recovering the group from the category fails without symmetric structure \\
papers/latex/vol-02-structural-families.tex-528-\bottomrule
papers/latex/vol-02-structural-families.tex-529-\end{tabularx}
papers/latex/vol-02-structural-families.tex-530-\end{table}
papers/latex/vol-02-structural-families.tex-531-
--
papers/latex/vol-02-structural-families.tex-534-\begin{proposition}[Irreducible classes do not close]
papers/latex/vol-02-structural-families.tex-535-\label{prop:closure}
papers/latex/vol-02-structural-families.tex-536-Let $\mathcal{K}$ contain direct sum and let $\mathcal{E}$ be a nonempty class of nonzero objects each irreducible under direct sum. Then $\mathcal{E}$ is not closed under direct sum and $\langle \mathcal{E} \rangle_{\mathcal{K}}$ strictly contains $\mathcal{E}$. The conclusion is one of non-closure and not of non-generation: $\mathcal{E}$ generates $\langle \mathcal{E} \rangle_{\mathcal{K}}$ by definition of closure, so a generating class may consist of irreducibles alone.
papers/latex/vol-02-structural-families.tex-537-\end{proposition}
papers/latex/vol-02-structural-families.tex-538-
papers/latex/vol-02-structural-families.tex-539-\begin{proof}
papers/latex/vol-02-structural-families.tex:540:Take $A \in \mathcal{E}$ nonzero. The pair $(A, A)$ witnesses a decomposition of $A \oplus A$ under the direct-sum construction with irreducible factors $A$ and $A$, so $A \oplus A$ is reducible and is therefore not in $\mathcal{E}$. It is in $\langle \mathcal{E} \rangle_{\mathcal{K}}$ by closure under direct sum. The inclusion $\mathcal{E} \subsetneq \langle \mathcal{E} \rangle_{\mathcal{K}}$ is strict, which is the non-closure claim. The generation claim runs the other way and is immediate: $\langle \mathcal{E} \rangle_{\mathcal{K}}$ is by definition the smallest class containing $\mathcal{E}$ and closed under $\mathcal{K}$, so $\mathcal{E}$ generates it.
papers/latex/vol-02-structural-families.tex-541-\end{proof}
papers/latex/vol-02-structural-families.tex-542-
papers/latex/vol-02-structural-families.tex-543-Two consequences follow and they are different. A class of irreducibles is never a fixed point of the closure operator whenever $\mathcal{K}$ contains direct sum, so taking a closure always adds objects. A class of irreducibles can nevertheless be a generating set, and the finite-dimensional matrix algebras are the example: each $M_n(\mathbb{C})$ is irreducible under direct sum and the list $\{M_n(\mathbb{C}) : n \geq 1\}$ generates every unital finite-dimensional complex $C^*$-algebra under direct sum, by \Cref{thm:calg}.
papers/latex/vol-02-structural-families.tex-544-
papers/latex/vol-02-structural-families.tex-545-\section{Independence and reconstructability}
papers/latex/vol-02-structural-families.tex-546-\label{sec:independence}
--
papers/latex/vol-02-structural-families.tex-564-Symplectic and operator-algebra families & Open & Deformation quantization is a program and not an equivalence \\
papers/latex/vol-02-structural-families.tex-565-\bottomrule
papers/latex/vol-02-structural-families.tex-566-\end{tabularx}
papers/latex/vol-02-structural-families.tex-567-\end{table}
papers/latex/vol-02-structural-families.tex-568-
papers/latex/vol-02-structural-families.tex-569-\begin{definition}[Independence of families]
papers/latex/vol-02-structural-families.tex:570:\label{def:independence}
papers/latex/vol-02-structural-families.tex-571-Two structural families $\mathfrak{F}$ and $\mathfrak{G}$ are \emph{logically independent} when neither is a special case of the other and neither is reconstructable from the other: there is no full embedding of one into the other, and no correspondence of the kind in Table~\ref{tab:independence} that determines one from the other. Independence in this sense is a statement about the families as classes of records and not about any particular system.
papers/latex/vol-02-structural-families.tex-572-\end{definition}
papers/latex/vol-02-structural-families.tex-573-
papers/latex/vol-02-structural-families.tex-574-\begin{proposition}[Invariants do not imply independence]
papers/latex/vol-02-structural-families.tex-575-\label{prop:independence}
papers/latex/vol-02-structural-families.tex-576-Let $\mathfrak{F}$ and $\mathfrak{G}$ be two structural families each admitting a classifying invariant. Then $\mathfrak{F}$ and $\mathfrak{G}$ need not be logically independent. In particular the commutative unital $C^*$-algebras inside the operator-algebra family and the compact Hausdorff spaces inside the geometric family each carry a classifying invariant, and neither is independent of the other.
papers/latex/vol-02-structural-families.tex-577-\end{proposition}
papers/latex/vol-02-structural-families.tex-578-
papers/latex/vol-02-structural-families.tex-579-\begin{proof}
papers/latex/vol-02-structural-families.tex-580-The Gelfand correspondence gives a bijection between commutative unital $C^*$-algebras and compact Hausdorff spaces that is an anti-equivalence of categories \cite{gelfand-duality,gelfand-naimark}. The spectrum is a classifying invariant for the space side and the algebra is a classifying invariant for the algebra side, and each determines the other. Two families related by such a correspondence cannot be logically independent, because every statement about one transfers to the other. The existence of a classifying invariant in each family is therefore silent on the question of independence.
papers/latex/vol-02-structural-families.tex-581-\end{proof}
papers/latex/vol-02-structural-families.tex-582-
papers/latex/vol-02-structural-families.tex:583:No theorem on record states that any two of the ten families are independent in the sense of \Cref{def:independence}. The honest chart entry for the independence question is open, and \Cref{prop:independence} explains why classifying invariants cannot settle it.
papers/latex/vol-02-structural-families.tex-584-
papers/latex/vol-02-structural-families.tex-585-\section{Systems in more than one family}
papers/latex/vol-02-structural-families.tex-586-\label{sec:mixing}
papers/latex/vol-02-structural-families.tex-587-
papers/latex/vol-02-structural-families.tex-588-A physical system is a record $(X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$, and the families classify records by their mathematical structure. A single record can present structure from several families at once, and the taxonomy must account for that without pretending the families partition mathematics.
papers/latex/vol-02-structural-families.tex-589-
--
papers/latex/vol-02-structural-families.tex-667-III & Smooth manifold with geometry & Holonomy, causal class, geometry type & Mixed: parameterized in restricted regimes & Dimension four is unrecognizable \\
papers/latex/vol-02-structural-families.tex-668-IV & Principal bundle with connection & Map to the classifying space & Complete and parameterized & Base and group must be numerable \\
papers/latex/vol-02-structural-families.tex-669-V & Space of probability measures & Fisher metric up to constant & No record for the systems & Uniqueness is of the metric, not of the record \\
papers/latex/vol-02-structural-families.tex-670-VI & Cobordism datum & Fully dualizable object & No record, with a claim on file & The 2009 proof is a sketch \\
papers/latex/vol-02-structural-families.tex-671-VII & Operator semigroup or generator & None on record & No record & The Kraus form is a normal form, and rank is one scalar of it \\
papers/latex/vol-02-structural-families.tex-672-VIII & Tensor category & Supergroup data with symmetric layer & Mixed: parameterized islands, no record generally & Hypotheses travel with the theorem \\
papers/latex/vol-02-structural-families.tex:673:IX & Configuration space on a lattice & Tame or wild class & Mixed: impossible in wild parts & No finite-variety parameterization \\
papers/latex/vol-02-structural-families.tex-674-X & Derived or homotopical category & Derived-tame or derived-wild class & No record beyond the dichotomy & Nothing is claimed beyond it \\
papers/latex/vol-02-structural-families.tex-675-\bottomrule
papers/latex/vol-02-structural-families.tex-676-\end{tabularx}
papers/latex/vol-02-structural-families.tex-677-\end{table}
papers/latex/vol-02-structural-families.tex-678-
papers/latex/vol-02-structural-families.tex-679-\section{Conclusion}
--
papers/latex/vol-02-structural-families.tex-753-\emph{Fusion category}. nLab entry. Available at \url{https://ncatlab.org/nlab/show/fusion+category}.
papers/latex/vol-02-structural-families.tex-754-
papers/latex/vol-02-structural-families.tex-755-\bibitem{haagkastler}
papers/latex/vol-02-structural-families.tex-756-\emph{Haag-Kastler axioms}. nLab entry. Available at \url{https://ncatlab.org/nlab/show/Haag-Kastler+axioms}.
papers/latex/vol-02-structural-families.tex-757-
papers/latex/vol-02-structural-families.tex-758-\bibitem{dhr}
papers/latex/vol-02-structural-families.tex:759:\emph{DHR superselection theory}. nLab entry. Available at \url{https://ncatlab.org/nlab/show/DHR+superselection+theory}.
papers/latex/vol-02-structural-families.tex-760-
papers/latex/vol-02-structural-families.tex-761-\bibitem{classifying-space}
papers/latex/vol-02-structural-families.tex-762-\emph{Classifying space}. nLab entry. Available at \url{https://ncatlab.org/nlab/show/classifying+space}.
papers/latex/vol-02-structural-families.tex-763-
papers/latex/vol-02-structural-families.tex-764-\bibitem{charclass}
papers/latex/vol-02-structural-families.tex-765-\emph{Characteristic class}. nLab entry. Available at \url{https://ncatlab.org/nlab/show/characteristic+class}.
--
papers/latex/vol-02-structural-families.tex-816-\emph{Geometrization conjecture}. Encyclopedia article. Available at \url{https://en.wikipedia.org/wiki/Geometrization_conjecture}.
papers/latex/vol-02-structural-families.tex-817-
papers/latex/vol-02-structural-families.tex-818-\bibitem{etingof}
papers/latex/vol-02-structural-families.tex-819-P. Etingof and S. Gelaki, \emph{Isocategorical groups}, International Mathematics Research Notices \textbf{2001} (2001) 59-120. DOI \texttt{10.1155/s1073792801000046}. Available at \url{https://doi.org/10.1155/s1073792801000046}.
papers/latex/vol-02-structural-families.tex-820-
papers/latex/vol-02-structural-families.tex-821-\bibitem{mcduff}
papers/latex/vol-02-structural-families.tex:822:D. McDuff, \emph{Uncountably many $\mathrm{II}_1$ factors}, Annals of Mathematics \textbf{90} (1969) 351-370. DOI \texttt{10.2307/1970730}. Available at \url{https://doi.org/10.2307/1970730}.
papers/latex/vol-02-structural-families.tex-823-
papers/latex/vol-02-structural-families.tex-824-\bibitem{sasyk}
papers/latex/vol-02-structural-families.tex-825-R. Sasyk and A. T\o rnquist, \emph{Borel reducibility and classification of von Neumann algebras}, arXiv:0909.2657 (2009). Available at \url{https://arxiv.org/abs/0909.2657}.
papers/latex/vol-02-structural-families.tex-826-
papers/latex/vol-02-structural-families.tex-827-\bibitem{weinstein}
papers/latex/vol-02-structural-families.tex-828-A. Weinstein, \emph{The local structure of Poisson manifolds}, Journal of Differential Geometry \textbf{18} (1983) 523-557. DOI \texttt{10.4310/jdg/1214437787}. Available at \url{https://doi.org/10.4310/jdg/1214437787}.
--
papers/latex/vol-04-yoneda-classification.tex-57-
papers/latex/vol-04-yoneda-classification.tex-58-\begin{document}
papers/latex/vol-04-yoneda-classification.tex-59-
papers/latex/vol-04-yoneda-classification.tex-60-\maketitle
papers/latex/vol-04-yoneda-classification.tex-61-
papers/latex/vol-04-yoneda-classification.tex-62-\begin{abstract}
papers/latex/vol-04-yoneda-classification.tex:63:The Yoneda embedding sends each object of a category to the functor it represents through its relationships with all other objects. This paper develops the relational characterization of mathematical representations of physical systems that the embedding supplies, and it states precisely what the embedding does not supply. The Yoneda lemma determines an object up to isomorphism by its relational profile, and the embedding is fully faithful on any locally small category of representations once the admissible morphisms are fixed. Concrete representability results for quantum supermaps show that in settings with channel-state duality the relational content is not merely formal, and the classical reconstruction theorems of Gelfand, Stone, and Doplicher and Roberts recover objects from categories of probes. Against these results stands a governing constraint: Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem. A non-implication theorem makes the third denial precise, because full faithfulness holds in categories where isomorphism classes admit no finite-variety parametrization, so representability cannot be the source of a classification theorem. The paper separates established mathematics from conjectural physical interpretation throughout and records the open problem of unifying the supermap line with the reconstruction pattern.
papers/latex/vol-04-yoneda-classification.tex-64-\end{abstract}
papers/latex/vol-04-yoneda-classification.tex-65-
papers/latex/vol-04-yoneda-classification.tex-66-\section{Introduction}
papers/latex/vol-04-yoneda-classification.tex-67-\label{sec:intro}
papers/latex/vol-04-yoneda-classification.tex-68-
papers/latex/vol-04-yoneda-classification.tex-69-A mathematical representation of a physical system is a tuple of data: a state space, an observable algebra, dynamical laws, symmetry and constraint data, and composition rules. Two questions about such a tuple are easy to confuse. The first asks which equations describe the system. The second asks what relationships the system admits with every other system. Its formal home is the Yoneda embedding
--
papers/latex/vol-04-yoneda-classification.tex-73-y(P) = \Hom_{\mathcal{C}}(-, P),
papers/latex/vol-04-yoneda-classification.tex-74-\]
papers/latex/vol-04-yoneda-classification.tex-75-which sends an object $P$ to the presheaf of its incoming morphisms. The embedding is a theorem of pure category theory: it is fully faithful on every locally small category, and an object is determined up to isomorphism by the presheaf $y(P)$.
papers/latex/vol-04-yoneda-classification.tex-76-
papers/latex/vol-04-yoneda-classification.tex-77-The research program of this series asks whether mathematical representations of physical systems admit a structural classification analogous to the classification of finite simple groups. The Yoneda embedding is the natural formal home for one part of that question, because it replaces intrinsic descriptions of objects by relational data. The assignment $P \mapsto y(P)$ turns the question of what $P$ is into the question of which admissible relationships $P$ has with every probe. That shift is exact mathematics. What it is not is a classification, a theory of physical equivalence, or a theory of empirical adequacy. A standing constraint of the series states the limit in one sentence, in its exact words: ``Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.'' The sentence governs everything that follows.
papers/latex/vol-04-yoneda-classification.tex-78-
papers/latex/vol-04-yoneda-classification.tex:79:The relational profile of a representation determines that representation up to isomorphism in a declared category of morphisms, and it determines nothing beyond that isomorphism. Full faithfulness preserves isomorphism classes without constraining how those classes are parameterized, so relational data yields no classification invariants on its own. Concrete physical recovery happens only where extra structure is assumed: channel-state duality for quantum supermaps, symmetric monoidal structure for Doplicher-Roberts reconstruction. On the positive side stand the Yoneda lemma and its corollaries, the Choi correspondence and the supermap representability it supports \cite{whh, hw}, and the probe reconstruction theorems with their declared hypotheses \cite{gn, stone, dr}. On the negative side stands a non-implication theorem: full faithfulness holds in categories where isomorphism classes admit no finite-variety parametrization \cite{buchweitz}, so representability cannot be the source of a classification theorem. No theorem joins the two sides; \cref{sec:synthesis} records the open problem that would.
papers/latex/vol-04-yoneda-classification.tex-80-
papers/latex/vol-04-yoneda-classification.tex-81-The classification problem of the program asks for the fundamental structural families of mathematical physics, the operations that assemble systems from them, and the equivalences that connect presentations. The Yoneda embedding lets the third question be phrased without choosing a presentation: an object is what it does to probes. A classification theorem built on relational data must supply invariants beyond representability, because representability delivers determination up to isomorphism and no parameterization of isomorphism classes. A physical reading of relational data must pass the qualification quoted above, because the morphisms defining the profiles are mathematical choices rather than physical identifications. Restricted regimes remain the available home for classification theorems.
papers/latex/vol-04-yoneda-classification.tex-82-
papers/latex/vol-04-yoneda-classification.tex-83-Three distinctions organize the results. Mathematical equivalence, isomorphism of representations, is not physical equivalence, the chosen identification of systems in the world. Relational characterization establishes the first and touches the second only through the morphisms one feeds to it. Neither notion is empirical adequacy, which lives in a separate layer of the architecture.
papers/latex/vol-04-yoneda-classification.tex-84-
papers/latex/vol-04-yoneda-classification.tex-85-\section{Mathematical framework}
--
papers/latex/vol-04-yoneda-classification.tex-219-\subsection{Composition of systems}
papers/latex/vol-04-yoneda-classification.tex-220-\label{sec:composition}
papers/latex/vol-04-yoneda-classification.tex-221-
papers/latex/vol-04-yoneda-classification.tex-222-Physical systems compose, through tensor products, direct sums, and the other constructions that generate complex systems from simple ones. The behavior of relational profiles under composition is therefore a question the classification program cannot avoid.
papers/latex/vol-04-yoneda-classification.tex-223-
papers/latex/vol-04-yoneda-classification.tex-224-\begin{proposition}[Profiles respect limits]
papers/latex/vol-04-yoneda-classification.tex:225:\label{prop:limits}
papers/latex/vol-04-yoneda-classification.tex-226-Let $\mathcal{C}$ be a locally small category in which a diagram $D$ has a limit $L = \lim D$. Then $y(L)$ is the limit of the diagram $y \circ D$ in $[\mathcal{C}^{\mathrm{op}}, \mathbf{Set}]$. In particular $y$ preserves terminal objects and binary products: $y(A \times B) \cong y(A) \times y(B)$ canonically whenever the product exists.
papers/latex/vol-04-yoneda-classification.tex-227-\end{proposition}
papers/latex/vol-04-yoneda-classification.tex-228-
papers/latex/vol-04-yoneda-classification.tex-229-\begin{proof}
papers/latex/vol-04-yoneda-classification.tex-230-Limits of presheaves are computed pointwise, so for each probe $R$ one must show
papers/latex/vol-04-yoneda-classification.tex-231-\[
papers/latex/vol-04-yoneda-classification.tex-232-\Hom(R, \lim D) \cong \lim \Hom(R, D),
papers/latex/vol-04-yoneda-classification.tex-233-\]
papers/latex/vol-04-yoneda-classification.tex-234-which is the defining universal property of the limit applied to the probe $R$. For binary products the statement reads $\Hom(R, A \times B) \cong \Hom(R, A) \times \Hom(R, B)$, which is the universal property of the product.
papers/latex/vol-04-yoneda-classification.tex-235-\end{proof}
papers/latex/vol-04-yoneda-classification.tex-236-
papers/latex/vol-04-yoneda-classification.tex:237:Tensor products behave differently. There is in general no canonical map relating $\Hom(R, P \otimes Q)$ to $\Hom(R, P) \otimes \Hom(R, Q)$, and the profile of a composite system is not assembled from the profiles of its factors by any universal construction available to the embedding. Determination of composites from relational data is therefore not a formal consequence of Yoneda; where it holds, it holds by a further theorem. The factorisation results of \cref{sec:supermap} are exactly such a theorem for the composition of processes under a causal-order hypothesis, and the decomposition theory of representation categories is such a theory for tensor structure. This asymmetry is a design fact of the relational program: limits are transparent to probes, monoidal composition is not.
papers/latex/vol-04-yoneda-classification.tex-238-
papers/latex/vol-04-yoneda-classification.tex-239-\subsection{The classification question}
papers/latex/vol-04-yoneda-classification.tex-240-\label{sec:classification}
papers/latex/vol-04-yoneda-classification.tex-241-
papers/latex/vol-04-yoneda-classification.tex-242-\begin{definition}[Classification by invariants]
papers/latex/vol-04-yoneda-classification.tex-243-\label{def:classify}
papers/latex/vol-04-yoneda-classification.tex:244:Let $\mathcal{C}$ be a category of representations and let $S$ be a parameter set. An \emph{invariant} is a map $I \colon \mathrm{Ob}(\mathcal{C}) \to S$ constant on isomorphism classes. The invariant $I$ \emph{classifies} $\mathcal{C}$ up to isomorphism when $I(P) = I(Q)$ implies $P \cong Q$; a family of invariants classifies when the joint map does. A classification is \emph{of finite-variety type} over a field $k$ when the parameter set $S$ is the set of $k$-points of a finite-dimensional algebraic variety over $k$. A class of objects is \emph{parametrized by a finite-dimensional variety over $k$} when such a classifying invariant of finite-variety type exists.
papers/latex/vol-04-yoneda-classification.tex-245-\end{definition}
papers/latex/vol-04-yoneda-classification.tex-246-
papers/latex/vol-04-yoneda-classification.tex-247-In the series vocabulary a classifying invariant is an invariant of this kind whose value determines the object up to the chosen equivalence, in the manner of a Dynkin diagram for semisimple Lie algebras or a dimension vector for finite-dimensional $C^*$-algebras. The Yoneda embedding supplies no such data: $y(P)$ is a functor rather than a value in a parameter space, and deciding $y(P) \cong y(Q)$ is in general as hard as deciding $P \cong Q$. The temptation the governing constraint guards against is to read determination by relationships as classification. The next theorem separates the two notions formally; its witness is the boundary of representability itself rather than a counterexample to any published claim.
papers/latex/vol-04-yoneda-classification.tex-248-
papers/latex/vol-04-yoneda-classification.tex-249-\begin{theorem}[Representability does not imply classifiability]
papers/latex/vol-04-yoneda-classification.tex-250-\label{thm:noimplication}
papers/latex/vol-04-yoneda-classification.tex:251:Let $n \geq 3$, let $S = k[x_{ij}]$ be the polynomial ring over a field $k$ in the entries of a generic $n \times n$ matrix, let $R = S/(\det(x_{ij}))$ be the coordinate ring of the generic determinant hypersurface, and let $\mathcal{C}$ be the category of finitely generated maximal Cohen-Macaulay $R$-modules of rank two, with $R$-module homomorphisms as morphisms. The objects of $\mathcal{C}$ admit no parametrization by a finite-dimensional variety over $k$ in the sense of Definition~\ref{def:classify}, while $y$ is fully faithful on $\mathcal{C}$. Full faithfulness of the Yoneda embedding therefore does not imply the existence of a classification theorem.
papers/latex/vol-04-yoneda-classification.tex-252-\end{theorem}
papers/latex/vol-04-yoneda-classification.tex-253-
papers/latex/vol-04-yoneda-classification.tex-254-\begin{proof}
papers/latex/vol-04-yoneda-classification.tex:255:The category $\mathcal{C}$ is locally small, so Theorem~\ref{thm:yoneda} and Corollary~\ref{cor:faithful} apply: $y$ is fully faithful on $\mathcal{C}$. The non-parametrization is the classification result of Buchweitz and Leuschke \cite{buchweitz} for modules over the generic determinant of an $n \times n$ matrix with $n \geq 3$; the bound on $n$ is part of their setting, since the small cases are tame. Their conclusion is exact: the Cohen-Macaulay representation theory of the generic determinant is wild in the tame-wild dichotomy, and in their words it is quite wild, since even in rank two the isomorphism classes cannot be parametrized by a finite-dimensional variety over the coefficients. Rank two is precisely the case their statement covers, which is why $\mathcal{C}$ is defined there. Both statements hold in the same category: a classification in the sense of Definition~\ref{def:classify} is absent for $\mathcal{C}$, while full faithfulness of $y$ on $\mathcal{C}$ is complete. If full faithfulness implied classifiability, no such category would exist; the category exists; so the implication fails.
papers/latex/vol-04-yoneda-classification.tex-256-\end{proof}
papers/latex/vol-04-yoneda-classification.tex-257-
papers/latex/vol-04-yoneda-classification.tex-258-\begin{remark}[Scope of the non-implication]
papers/latex/vol-04-yoneda-classification.tex-259-\label{rem:scope}
papers/latex/vol-04-yoneda-classification.tex-260-Theorem~\ref{thm:noimplication} denies an implication; it does not deny that relational data is useful. In tame regimes relational methods convert into invariants, and Sections~\ref{sec:supermap} and~\ref{sec:reconstruction} exhibit settings where they do. The theorem says that the conversion is a further theorem, with hypotheses, and that it cannot be smuggled in as a consequence of representability. The wider wildness literature reinforces the point: every finite-dimensional algebra over an algebraically closed field is derived tame or derived wild, and wildness is preserved under degeneration \cite{bekkert}, so the failure pattern is structural rather than isolated.
papers/latex/vol-04-yoneda-classification.tex-261-\end{remark}
--
papers/latex/vol-04-yoneda-classification.tex-267-
papers/latex/vol-04-yoneda-classification.tex-268-Structural knowledge of a family falls into one of four regimes, recorded in Table~\ref{tab:regimes}; the Yoneda embedding belongs to the third.
papers/latex/vol-04-yoneda-classification.tex-269-
papers/latex/vol-04-yoneda-classification.tex-270-\begin{table}[t]
papers/latex/vol-04-yoneda-classification.tex-271-\centering
papers/latex/vol-04-yoneda-classification.tex-272-\small
papers/latex/vol-04-yoneda-classification.tex:273:\caption{Four regimes of structural knowledge. The Yoneda embedding supplies determination; classification content comes from the invariants of each family; the wild regimes forbid finite-variety classification outright.}
papers/latex/vol-04-yoneda-classification.tex-274-\label{tab:regimes}
papers/latex/vol-04-yoneda-classification.tex-275-\begin{tabular}{@{} L{3.8cm} L{4.2cm} L{3.2cm} L{3.2cm} @{}}
papers/latex/vol-04-yoneda-classification.tex-276-\toprule
papers/latex/vol-04-yoneda-classification.tex-277-Regime & Example & Invariant & What is missing \\
papers/latex/vol-04-yoneda-classification.tex-278-\midrule
papers/latex/vol-04-yoneda-classification.tex-279-Complete and parameterized & Semisimple Lie algebras & Dynkin diagram & Nothing in scope \\
papers/latex/vol-04-yoneda-classification.tex-280-Complete without parameters & Finite simple groups & Atlas data & A uniform parameterization \\
papers/latex/vol-04-yoneda-classification.tex-281-Determination only & Any locally small category & Relational profile & Separating invariants \\
papers/latex/vol-04-yoneda-classification.tex:282:Forbidden in the stated generality & Modules over the generic determinant & None of finite-variety type & Classification itself \\
papers/latex/vol-04-yoneda-classification.tex-283-\bottomrule
papers/latex/vol-04-yoneda-classification.tex-284-\end{tabular}
papers/latex/vol-04-yoneda-classification.tex-285-\end{table}
papers/latex/vol-04-yoneda-classification.tex-286-
papers/latex/vol-04-yoneda-classification.tex-287-The second regime is the reminder that even a completed classification can lack a uniform parameterization, which is why the classification problem of this series asks for families and constructions rather than for a single list. The third regime is where this paper lives: determination is available everywhere, and classification content is a further achievement of particular families. The fourth regime is the boundary drawn by Theorem~\ref{thm:noimplication}: in wild settings determination persists and classification does not, and no amount of representability changes that. A relational program for classification must therefore work through the second regime, converting determination into family-specific invariants wherever tame structure allows.
papers/latex/vol-04-yoneda-classification.tex-288-
papers/latex/vol-04-yoneda-classification.tex-289-\section{Supermap representability}
papers/latex/vol-04-yoneda-classification.tex-290-\label{sec:supermap}
papers/latex/vol-04-yoneda-classification.tex-291-
papers/latex/vol-04-yoneda-classification.tex:292:Formal category theory gives relational profiles no matter what the objects are. The question of whether relational content is ever concretely computational, rather than formal, has a positive answer in one corner of quantum theory: quantum supermaps, the transformations of quantum channels. The representability theorems of 2024 to 2026 show that in settings with channel-state duality, categorical supermaps are concretely representable, and that Yoneda representability underlies factorisation theorems for them \cite{whh, hw}.
papers/latex/vol-04-yoneda-classification.tex-293-
papers/latex/vol-04-yoneda-classification.tex-294-A \emph{supermap} is a transformation $\Psi$ that assigns to each channel $\Phi \colon M_n \to M_m$ of an admissible class a channel $\Psi(\Phi) \colon M_{n'} \to M_{m'}$, compatibly with composition of channels and with the tensor product of systems. Supermaps are therefore second-order processes: processes whose inputs and outputs are themselves processes. The relational question for them is concrete. Which transformations count as processes in their own right, and can the answer be read off from the relationships the channel admits? The channel-state duality answers both questions at once, because it identifies a channel with a state of the composed system.
papers/latex/vol-04-yoneda-classification.tex-295-
papers/latex/vol-04-yoneda-classification.tex-296-Let $M_n$ denote the $n \times n$ complex matrices, and let $\Phi \colon M_n \to M_m$ be a linear map. The \emph{Choi matrix} of $\Phi$ \cite{choi} is
papers/latex/vol-04-yoneda-classification.tex-297-\[
papers/latex/vol-04-yoneda-classification.tex-298-J(\Phi) \;=\; \sum_{i,j=1}^{n} E_{ij} \otimes \Phi(E_{ij}) \;\in\; M_n \otimes M_m,
papers/latex/vol-04-yoneda-classification.tex-299-\]
papers/latex/vol-04-yoneda-classification.tex:300:where $E_{ij}$ are the matrix units of $M_n$. A linear map is completely positive if and only if $J(\Phi) \geq 0$, and it is trace preserving if and only if $\Tr_m\, J(\Phi) = I_n$, the partial trace over the second tensor factor. The normalized Choi matrix of a channel is a state on $M_n \otimes M_m$, and this correspondence between channels and states is \emph{channel-state duality}.
papers/latex/vol-04-yoneda-classification.tex-301-
papers/latex/vol-04-yoneda-classification.tex-302-\begin{proposition}[Choi correspondence and composition]
papers/latex/vol-04-yoneda-classification.tex-303-\label{prop:choi}
papers/latex/vol-04-yoneda-classification.tex-304-For fixed $n, m \geq 1$ the assignment $\Phi \mapsto J(\Phi)$ is a linear bijection $L(M_n, M_m) \to M_n \otimes M_m$. It restricts to a bijection between completely positive maps and positive semidefinite Choi matrices, and $\Phi$ is trace preserving if and only if $\Tr_m J(\Phi) = I_n$. If $\Phi \colon M_n \to M_m$ and $\Psi \colon M_m \to M_p$ are linear, then
papers/latex/vol-04-yoneda-classification.tex-305-\begin{equation}
papers/latex/vol-04-yoneda-classification.tex-306-\label{eq:choi-comp}
papers/latex/vol-04-yoneda-classification.tex-307-J(\Psi \circ \Phi)_{(i\alpha),(j\beta)}
papers/latex/vol-04-yoneda-classification.tex-308-\;=\;
papers/latex/vol-04-yoneda-classification.tex-309-\sum_{k,l=1}^{m} J(\Phi)_{(ik),(jl)}\, J(\Psi)_{(k\alpha),(l\beta)},
papers/latex/vol-04-yoneda-classification.tex-310-\end{equation}
papers/latex/vol-04-yoneda-classification.tex:311:where composite indices label rows and columns of $M_n \otimes M_m$ and $M_m \otimes M_p$. Composition of channels is therefore a contraction of Choi indices along the shared system. In the link-product notation of quantum information the same identity appears as $J(\Psi \circ \Phi) = J(\Phi) \ast J(\Psi)$, where the standard convention places a partial transpose on the contracted factor; the component formula displayed here pairs row with row and column with column indices of the shared system, which absorbs that transposition into the index placement.
papers/latex/vol-04-yoneda-classification.tex-312-\end{proposition}
papers/latex/vol-04-yoneda-classification.tex-313-
papers/latex/vol-04-yoneda-classification.tex-314-\begin{proof}
papers/latex/vol-04-yoneda-classification.tex-315-The assignment is linear in $\Phi$ by construction. Write $\Phi^{ij,kl}$ for the elementary linear maps $\Phi^{ij,kl}(X) = \Tr(E_{ji} X)\, E_{kl}$; these form a basis of $L(M_n, M_m)$, and $J(\Phi^{ij,kl}) = E_{ij} \otimes E_{kl}$. The elements $E_{ij} \otimes E_{kl}$ form a basis of $M_n \otimes M_m$, so the assignment carries a basis to a basis between vector spaces of the same dimension $n^2 m^2$ and is therefore bijective. Complete positivity corresponds to positivity of $J(\Phi)$, which is the standard matrix-unit characterization. For the trace condition, the partial trace $\Tr_m J(\Phi)$ has entries $\Tr(\Phi(E_{ij}))$, and $\Phi$ is trace preserving exactly when $\Tr(\Phi(E_{ij})) = \Tr(E_{ij}) = \delta_{ij}$ for all $i, j$, which says $\Tr_m J(\Phi) = \sum_i E_{ii} = I_n$. For the composition identity, write $\Phi(E_{ij}) = \sum_{k,l} c^{ij}_{kl} E_{kl}$. Then $J(\Phi)_{(ik),(jl)} = c^{ij}_{kl}$ and $J(\Psi)_{(k\alpha),(l\beta)} = \Psi(E_{kl})_{\alpha\beta}$. The right-hand side of the claimed identity is $\sum_{k,l} c^{ij}_{kl} \Psi(E_{kl})_{\alpha\beta} = \Psi(\Phi(E_{ij}))_{\alpha\beta}$, which is $J(\Psi \circ \Phi)_{(i\alpha),(j\beta)}$ by definition.
papers/latex/vol-04-yoneda-classification.tex-316-\end{proof}
papers/latex/vol-04-yoneda-classification.tex-317-
--
papers/latex/vol-04-yoneda-classification.tex-321-\end{remark}
papers/latex/vol-04-yoneda-classification.tex-322-
papers/latex/vol-04-yoneda-classification.tex-323-Proposition~\ref{prop:choi} is the concrete setting in which channel-state duality is exact: the channel is a state on the composed system, and composition is an index contraction. The category of Remark~\ref{ex:process} records the fragment of process morphisms without auxiliary memory; the theorem below covers supermaps in the full sense of \cite{whh, hw}, where ancillary systems may bridge input and output, and the presheaf of the restricted category is the fragment of that structure on pre- and post-processings.
papers/latex/vol-04-yoneda-classification.tex-324-
papers/latex/vol-04-yoneda-classification.tex-325-\begin{theorem}[Supermap representability]
papers/latex/vol-04-yoneda-classification.tex-326-\label{thm:supermap}
papers/latex/vol-04-yoneda-classification.tex:327:Let $\mathcal{T}$ be a theory of processes whose processes form a symmetric monoidal category under sequential and parallel composition, and suppose $\mathcal{T}$ is equipped with a channel-state duality: a natural identification of each process $\Phi \colon A \to B$ with a state of the composite system $A \otimes B$, preserved by composition. Then the categorical supermaps of $\mathcal{T}$ are concretely representable through that duality: every supermap corresponds to a process of the composite system, and representability yields the factorisation theorems for causally ordered supermaps.
papers/latex/vol-04-yoneda-classification.tex-328-\end{theorem}
papers/latex/vol-04-yoneda-classification.tex-329-
papers/latex/vol-04-yoneda-classification.tex-330-\begin{proof}
papers/latex/vol-04-yoneda-classification.tex:331:The statement is the representability lemma established in \cite{whh}; the factorisation theorems are proved in \cite{hw}. We record the result as a registered input of the series and do not reproduce the arguments there. Proposition~\ref{prop:choi} verifies the hypothesis in the finite-dimensional matrix setting: the Choi matrix identifies each channel with a state of the composite system, and composition of channels matches contraction of Choi indices, so the duality is preserved by composition as the hypothesis requires.
papers/latex/vol-04-yoneda-classification.tex-332-\end{proof}
papers/latex/vol-04-yoneda-classification.tex-333-
papers/latex/vol-04-yoneda-classification.tex-334-\begin{remark}[What the theorem shows]
papers/latex/vol-04-yoneda-classification.tex-335-\label{rem:supermap}
papers/latex/vol-04-yoneda-classification.tex:336:Theorem~\ref{thm:supermap} is the one recorded setting where relational representability is concretely computational: the relationships between processes are themselves processes, and factorisation statements follow. The hypotheses travel with the theorem. Channel-state duality of the required kind is a property of particular frameworks, and no claim is made here that every setting of interest has it, or that the result extends from quantum processes to mathematical representations of physical systems at large. Wilson, Hefford, and Hoffreumon \cite{whh} apply the same lemma to generalised circuit theories, including boxworld and real quantum theory, which shows the hypothesis is checkable theory by theory rather than automatic.
papers/latex/vol-04-yoneda-classification.tex-337-\end{remark}
papers/latex/vol-04-yoneda-classification.tex-338-
papers/latex/vol-04-yoneda-classification.tex-339-The supermap setting supports one precise reading of the relational program: once the morphisms are fixed as process transformations and a channel-state duality is available, the profile of a process is not formal data but computable data. That is genuine content, and it is narrower than the slogan of a Yoneda lemma for physics. \Cref{sec:synthesis} records how much narrower.
papers/latex/vol-04-yoneda-classification.tex-340-
papers/latex/vol-04-yoneda-classification.tex-341-\subsection{Factorisation theorems}
papers/latex/vol-04-yoneda-classification.tex:342:\label{sec:factorisation}
papers/latex/vol-04-yoneda-classification.tex-343-
papers/latex/vol-04-yoneda-classification.tex:344:The representability statement is not the end of the supermap line. The same authors use it to prove factorisation theorems \cite{hw}, and the shape of those theorems is the clearest existing instance of relational structure producing concrete process structure.
papers/latex/vol-04-yoneda-classification.tex-345-
papers/latex/vol-04-yoneda-classification.tex:346:The 2024 work \cite{hw} identifies morphisms of strong profunctors as a categorification of quantum supermaps, which places these black-box generalisations of diagrams with holes inside the theory of profunctor optics. From this vantage it constructs abstract logical connectives for supermaps, including tensor products and negations, in a theory-independent setting. Three structural features of quantum supermaps are then modelled by these connectives alone: black-box indefinite causal order, black-box definite causal order, and the factorisation of definitely causally ordered supermaps into concrete circuit diagrams. The 2026 work \cite{whh} states the mechanism as the lemma of Theorem~\ref{thm:supermap}, and the lemma eliminates guesswork in defining supermaps for a given theory.
papers/latex/vol-04-yoneda-classification.tex-347-
papers/latex/vol-04-yoneda-classification.tex:348:Two features of this line matter for the classification program. The factorisation theorems are classification-like results for a restricted class: under a causal-order hypothesis, supermaps decompose into circuit data, which is determination by constituents in the sense of decomposition rather than determination by probes. The hypotheses are physical and checkable per theory, and \cite{whh} applies them to generalised theories, including boxworld and real quantum theory, rather than to quantum theory alone. The relational principle has so far earned its keep as a method with hypotheses, not as a universal law.
papers/latex/vol-04-yoneda-classification.tex-349-
papers/latex/vol-04-yoneda-classification.tex-350-\section{Reconstruction from probes}
papers/latex/vol-04-yoneda-classification.tex-351-\label{sec:reconstruction}
papers/latex/vol-04-yoneda-classification.tex-352-
papers/latex/vol-04-yoneda-classification.tex-353-A second family of results shares the shape of the relational program: reconstruction theorems, which recover an object from a category of probes attached to it. The pattern is older than the supermap line and its settings are exact.
papers/latex/vol-04-yoneda-classification.tex-354-
--
papers/latex/vol-04-yoneda-classification.tex-378-\begin{proof}
papers/latex/vol-04-yoneda-classification.tex-379-The reconstruction is that of \cite{dr}, applied in its original setting to the representations selected by the DHR criteria of a local net \cite{dhr}; the uniqueness statement is part of the same theorem. The hypotheses of the statement are exactly those listed; dropping any of them invalidates the conclusion, and \cref{sec:equivalence} records the constraint that dropping the symmetric layer is provably insufficient in any case.
papers/latex/vol-04-yoneda-classification.tex-380-\end{proof}
papers/latex/vol-04-yoneda-classification.tex-381-
papers/latex/vol-04-yoneda-classification.tex-382-\begin{remark}[The DHR setting]
papers/latex/vol-04-yoneda-classification.tex-383-\label{rem:dhr}
papers/latex/vol-04-yoneda-classification.tex:384:The Doplicher-Roberts theorem arises from a net of local observables on spacetime: representations of the net are selected by their behavior on the causal complements of regions \cite{dhr}, and the selected representations form exactly the symmetric tensor $C^*$-category of Theorem~\ref{thm:dr}. The probes are the localized endomorphisms, and the recovered object is the compact supergroup implementing the superselection sectors. When the parity twist is trivial, the recovered object is an ordinary compact group; the supergroup form records a non-trivial parity in the symmetric structure. The finite-group statements of \cref{sec:equivalence} are the trivial-twist case, where a symmetric representation category recovers the group itself. This is the sense in which a physical setting supplies a probe category by construction; it is also the reason the hypotheses are physical, not just technical.
papers/latex/vol-04-yoneda-classification.tex-385-\end{remark}
papers/latex/vol-04-yoneda-classification.tex-386-
papers/latex/vol-04-yoneda-classification.tex-387-Each theorem has the same shape: a category of probes determines the object. For Gelfand, the probes are characters; for Stone, the probes are ultrafilters; for Doplicher-Roberts, the probes are the localized endomorphisms of a net of observables. In each case the recovering functor is contravariant, and in each case the statement is an equivalence of categories, which is stronger than determination of a single object. Table~\ref{tab:islands} collects the data.
papers/latex/vol-04-yoneda-classification.tex-388-
papers/latex/vol-04-yoneda-classification.tex-389-\begin{table}[t]
papers/latex/vol-04-yoneda-classification.tex-390-\centering
--
papers/latex/vol-04-yoneda-classification.tex-573-\label{sec:limitations}
papers/latex/vol-04-yoneda-classification.tex-574-
papers/latex/vol-04-yoneda-classification.tex-575-Each denial of the governing constraint is a precise limitation. They are stated below in the order the constraint lists them.
papers/latex/vol-04-yoneda-classification.tex-576-
papers/latex/vol-04-yoneda-classification.tex-577-\emph{Physical equivalence.} Corollary~\ref{cor:releq} shows that relational equivalence is isomorphism in the declared category. Physical equivalence is a chosen relation on representations, motivated by the observation that two mathematical descriptions may describe the same physics without being isomorphic, and the correct choice of that relation is open. The Yoneda embedding neither supplies the choice nor validates one. Any claim that two systems are physically equivalent because their relational profiles agree is therefore unsupported unless the morphisms in force have themselves been justified as physical equivalences.
papers/latex/vol-04-yoneda-classification.tex-578-
papers/latex/vol-04-yoneda-classification.tex:579:\emph{Empirical adequacy.} A mathematical structure can be consistent without describing our universe, and several mathematically distinct theories can produce identical predictions in an experimentally accessible regime. Empirical selection is a separate layer of the architecture from mathematical classification, and the Yoneda embedding lives entirely on the mathematical side. The layer is left unformalized here by design: its mathematical content is the subject of observational equivalence, and the claim of this paper is only that relational data does not supply it.
papers/latex/vol-04-yoneda-classification.tex-580-
papers/latex/vol-04-yoneda-classification.tex:581:\emph{Classification.} Theorem~\ref{thm:noimplication} shows that full faithfulness of $y$ is logically compatible with the absence of any finite-variety parametrization of isomorphism classes. The classification problem of the series asks for invariants separating objects up to a chosen equivalence; profiles separate objects up to isomorphism by a different mechanism, and the two must not be confused. Where classification content exists for a family of systems, it comes from the invariants of that family, not from representability.
papers/latex/vol-04-yoneda-classification.tex-582-
papers/latex/vol-04-yoneda-classification.tex-583-\emph{Morphisms in force.} All relational statements of this paper are conditional on a declared category of representations. The preservation laws and composition rules for the full morphism vocabulary of $\mathrm{Phys}$ are not fixed. Until they are, statements about $\Hom_{\mathrm{Phys}}(-, P)$ are conditional on the chosen fragment, and the one-category assumption itself is open.
papers/latex/vol-04-yoneda-classification.tex-584-
papers/latex/vol-04-yoneda-classification.tex-585-\emph{Probe classes.} Proposition~\ref{prop:restriction} shows that restricted profiles determine objects only when the probe class is adequate. Every claim of determination by probes carries the probe class as a hypothesis.
papers/latex/vol-04-yoneda-classification.tex-586-
papers/latex/vol-04-yoneda-classification.tex-587-\emph{The unification.} The resemblance between the supermap representability theorem and the reconstruction islands is real and it is unproved as a principle. \Cref{sec:synthesis} states the problem; this paper does not assume its solution.
--
papers/latex/vol-10-observational-equivalence.tex-56-
papers/latex/vol-10-observational-equivalence.tex-57-\begin{document}
papers/latex/vol-10-observational-equivalence.tex-58-
papers/latex/vol-10-observational-equivalence.tex-59-\maketitle
papers/latex/vol-10-observational-equivalence.tex-60-
papers/latex/vol-10-observational-equivalence.tex-61-\begin{abstract}
papers/latex/vol-10-observational-equivalence.tex:62:The classification problem of mathematical representations of physical systems is a quotient: classify objects of a category of systems up to an equivalence relation. The quotient is unusable until the relation is chosen, and the choice is decisive. This paper develops the observational side of that choice. It separates three relations: mathematical equivalence, given by isomorphism of the component data of a representation; physical equivalence, an open choice constrained by what the identifying morphism preserves; and observational equivalence, induced by a functor from systems to observation records. Observation functors are defined, their induced relations are proved to be equivalence relations with classes given by record isomorphism classes, and their interaction with coarse-graining is proved monotone in one direction only. Distinguishability is treated through monotone metrics: the Fisher metric is the unique classical choice up to constant, while the quantum case admits a parametric family indexed by operator monotone functions. An explicit two-dimensional computation shows the resulting quadratic forms differ on non-commuting directions, so quantum metric distinguishability is not canonical. The plain tensor-category criterion for physical equivalence fails outright: equivalence of representation categories without the symmetric structure does not recover the group, and every proposed relation must name the layers of structure it preserves. A counterexample search records which candidate criteria fail and why, and the empirical layer of the three-layer architecture is instantiated as a functor and left open where the sources leave it open.
papers/latex/vol-10-observational-equivalence.tex-63-\end{abstract}
papers/latex/vol-10-observational-equivalence.tex-64-
papers/latex/vol-10-observational-equivalence.tex-65-\section{Introduction}
papers/latex/vol-10-observational-equivalence.tex-66-
papers/latex/vol-10-observational-equivalence.tex-67-The program of this series asks whether mathematical representations of physical systems admit a structural classification analogous to the classification of finite simple groups. The question is stated as
papers/latex/vol-10-observational-equivalence.tex-68-\[
--
papers/latex/vol-10-observational-equivalence.tex-71-and each term of that expression requires work. The objects are tuples of state space, observable algebra, dynamics, symmetry data, and composition rules. The category they live in is still a schema: the preservation laws and composition rules for its morphisms are not fixed. The relation $\simeq$ is a choice, and the choice is essential. Two mathematical descriptions may be physically equivalent without being mathematically isomorphic; dual theories may describe the same observable physics through very different mathematical structures.\footnote{The founding document of the YonedaAI Collaboration (2026, cited by section throughout this paper) and the YonedaAI physics research summary (2026-10-27) are program documents of the series in which this paper sits. Every mathematical statement used here is defined and stated explicitly in this text.}
papers/latex/vol-10-observational-equivalence.tex-72-
papers/latex/vol-10-observational-equivalence.tex-73-This paper develops the empirical side of that quotient. Observational equivalence identifies two systems exactly when no admissible observation separates them. The formal object is the observation functor named by the Information Geometry Correspondence program of the YonedaAI research summary; that program names the object without defining it, so the definition, its basic properties, and its limits are established here.
papers/latex/vol-10-observational-equivalence.tex-74-
papers/latex/vol-10-observational-equivalence.tex-75-Observation functors are ordinary functors from a category of systems to a category of observation records. The indistinguishability relation they induce is an equivalence relation whose classes are the record isomorphism classes of the functor.
papers/latex/vol-10-observational-equivalence.tex-76-
papers/latex/vol-10-observational-equivalence.tex:77:Coarsening the observations identifies at least as many systems as the fine observations identify, and the inclusion of relations can be strict. The quantitative side of distinguishability splits along the classical and quantum divide: the Fisher metric is unique up to constant among metrics monotone under stochastic maps \cite{b8}, while the quantum monotone metrics form a parametric family indexed by operator monotone functions \cite{b8}. An explicit two-dimensional computation shows the induced quadratic forms disagree on non-commuting directions, so distinguishability read from an unnamed monotone metric is not a function of the states alone.
papers/latex/vol-10-observational-equivalence.tex-78-
papers/latex/vol-10-observational-equivalence.tex-79-A proved counterexample blocks the most natural equivalence criterion of all: equivalence of representation categories as plain tensor categories does not recover the underlying group, so any equivalence used to identify systems must state which layer of structure it preserves.
papers/latex/vol-10-observational-equivalence.tex-80-
papers/latex/vol-10-observational-equivalence.tex-81-The separation between mathematical and physical equivalence runs through every section. Mathematical equivalence is isomorphism of representations. Physical equivalence is a relation to be chosen and defended. Observational equivalence is what an observation functor computes. The three notions must not be conflated. The series qualification on relational arguments binds throughout and is quoted in \Cref{sec:recon}.
papers/latex/vol-10-observational-equivalence.tex-82-
papers/latex/vol-10-observational-equivalence.tex-83-
--
papers/latex/vol-10-observational-equivalence.tex-151-\label{sec:morphisms}
papers/latex/vol-10-observational-equivalence.tex-152-
papers/latex/vol-10-observational-equivalence.tex-153-The morphism kinds of the object schema act on observation records in characteristic ways, and stating the action is part of fixing the record category.
papers/latex/vol-10-observational-equivalence.tex-154-
papers/latex/vol-10-observational-equivalence.tex-155-\begin{definition}[Action of the morphism kinds]
papers/latex/vol-10-observational-equivalence.tex-156-\label{def:morphisms}
papers/latex/vol-10-observational-equivalence.tex:157:A coarse-graining is a functor $c$ on the system category; the record of $cP$ is computed by composing the observation functor with $c$. An embedding assigns to a subsystem its record and includes it in the record of the larger system. A duality carries records across presentations and must declare what it preserves (\Cref{sec:eg}). A limiting procedure acts on records by a limit of records: the record of a thermodynamic or continuum limit is the limit of the records, when that limit exists in the record category.
papers/latex/vol-10-observational-equivalence.tex-158-\end{definition}
papers/latex/vol-10-observational-equivalence.tex-159-
papers/latex/vol-10-observational-equivalence.tex:160:Coarse-graining is the case \Cref{sec:coarse} controls. Embeddings are controlled whenever the record of a composite system determines the records of its subsystems, which is a hypothesis on the record category rather than a theorem about observation. Dualities are controlled by the preserved-layer discipline of \Cref{sec:eg}. Limiting procedures are the least settled case: a limit of records exists when the record category admits the relevant limits, and continuum limits in particular are not closed by formal means alone. Constructive quantum field theory treats continuum limits as essential, and nothing in this paper supplies the missing analysis. Any use of \Cref{def:morphisms} must therefore say which morphism class is in force, exactly as the open status of the preservation laws requires.
papers/latex/vol-10-observational-equivalence.tex-161-
papers/latex/vol-10-observational-equivalence.tex-162-\subsection{Standing assumptions}
papers/latex/vol-10-observational-equivalence.tex-163-
papers/latex/vol-10-observational-equivalence.tex-164-The formal results of this paper rest on a short list of assumptions, and each is stated where it is used. The object schema of \Cref{def:system} is taken as the coordinate record of a representation, with the status of a stipulative schema rather than a settled definition of a physical system. The morphism classes in force are the three named at the end of \Cref{sec:notions}. Statements quantified over admissible systems assume some fixed admissibility conditions; the condition list is left open in the series, so every such statement is conditional on the choice, and no result of this paper fixes the list.
papers/latex/vol-10-observational-equivalence.tex-165-
papers/latex/vol-10-observational-equivalence.tex:166:The cited results are used as established mathematics with their hypotheses intact: the plain tensor counterexample (\Cref{thm:eg}) with its construction cited rather than reproduced, the classical monotone-metric uniqueness (\Cref{thm:chentsov}) on spaces of probability distributions, and the quantum parametric classification (\Cref{thm:petzsudar}) for operator monotone functions normalized at $1$ and symmetric under $x \mapsto x^{-1}$ in Petz's sense. Nothing in this paper extends a cited result beyond its hypotheses, and the counterexample search of \Cref{sec:search} keeps extension attempts visible.
papers/latex/vol-10-observational-equivalence.tex-167-
papers/latex/vol-10-observational-equivalence.tex-168-\section{Structure preservation and its failure}
papers/latex/vol-10-observational-equivalence.tex-169-\label{sec:eg}
papers/latex/vol-10-observational-equivalence.tex-170-
papers/latex/vol-10-observational-equivalence.tex-171-\subsection{The preserved-layer requirement}
papers/latex/vol-10-observational-equivalence.tex-172-
papers/latex/vol-10-observational-equivalence.tex-173-Any equivalence used to identify systems in the classification quotient must state which layer of structure it preserves. The requirement exists because one natural criterion is false. The criterion says: identify two systems when their representation categories are equivalent as tensor categories. The criterion is natural, since compositional structure is part of the object schema; it is also insufficient.
papers/latex/vol-10-observational-equivalence.tex-174-
papers/latex/vol-10-observational-equivalence.tex-175-\begin{theorem}[Plain tensor equivalence does not recover the group]
papers/latex/vol-10-observational-equivalence.tex-176-\label{thm:eg}
papers/latex/vol-10-observational-equivalence.tex:177:There exist finite groups $G$ and $H$ that are not isomorphic and whose complex representation categories are equivalent as plain tensor categories, that is, as monoidal categories without regard for the commutativity constraint. Consequently, an equivalence of representation categories that forgets the symmetric structure cannot recover the underlying group, and any classification that identifies systems by such an equivalence is false wherever the group data are observable superselection data of the systems.
papers/latex/vol-10-observational-equivalence.tex-178-\end{theorem}
papers/latex/vol-10-observational-equivalence.tex-179-
papers/latex/vol-10-observational-equivalence.tex-180-\begin{proof}[Proof, by reference]
papers/latex/vol-10-observational-equivalence.tex-181-The construction of isocategorical groups and the proof appear in the original source \cite{b2}, recorded in the series theorem registry as an obstruction result. The example pairs the affine symplectic group of a vector space over the field with two elements with a suitable affine pseudosymplectic group; the proofs run through triangular Hopf algebras \cite{b2}. The tensor-category equivalence is monoidal and does not respect the commutativity constraint \cite{b2}: the symmetric braiding is the layer the equivalence fails to preserve. This paper does not reprove the construction; it uses the statement as a constraint and searches for counterexamples to other criteria in \Cref{sec:search}. The series status of the statement is a complete proof in the mathematical literature, not a machine-checked result.
papers/latex/vol-10-observational-equivalence.tex-182-\end{proof}
papers/latex/vol-10-observational-equivalence.tex-183-
papers/latex/vol-10-observational-equivalence.tex-184-\begin{corollary}[Preserved-layer discipline]
papers/latex/vol-10-observational-equivalence.tex-185-\label{cor:preserved}
papers/latex/vol-10-observational-equivalence.tex-186-Every proposed physical equivalence $\simeq$ entering the quotient $\mathrm{Ob}(\mathrm{Phys})/{\simeq}$ must declare its preserved layers, and a declaration that omits the symmetric monoidal layer cannot justify identifying systems whose observable global symmetry data differ.
papers/latex/vol-10-observational-equivalence.tex-187-\end{corollary}
papers/latex/vol-10-observational-equivalence.tex-188-
papers/latex/vol-10-observational-equivalence.tex-189-\begin{proof}
papers/latex/vol-10-observational-equivalence.tex:190:If two systems were identified by an equivalence of representation categories as plain tensor categories, \Cref{thm:eg} exhibits pairs of groups for which such an identification misreports the systems as alike while their group data differ. When those data are observable (superselection sectors, global symmetry groups), the identification contradicts the observable physics. The declaration of preserved layers is the device that makes the failure visible before the quotient is formed.
papers/latex/vol-10-observational-equivalence.tex-191-\end{proof}
papers/latex/vol-10-observational-equivalence.tex-192-
papers/latex/vol-10-observational-equivalence.tex-193-The qualification in the corollary matters. Dualities of physical theories can identify systems whose presentation-level symmetry groups differ while the observable content agrees; the constraint forbids dropping the symmetric layer when the group data themselves are at stake, which is exactly the setting of \Cref{thm:eg}.
papers/latex/vol-10-observational-equivalence.tex-194-
papers/latex/vol-10-observational-equivalence.tex-195-\begin{remark}[What the counterexample does not say]
papers/latex/vol-10-observational-equivalence.tex-196-\label{rmk:scope}
--
papers/latex/vol-10-observational-equivalence.tex-236-\Cref{def:obs} is a proposal: the Information Geometry Correspondence research program names observation functors as its formal object without defining them. Two choices in the definition are deliberate. The domain is the admissible systems, not all of $\mathrm{Phys}$, because observation presupposes a system one can measure. The codomain is a category of records, not a set of numbers, because experiments compose and compare; a set-valued statistic would discard that structure.
papers/latex/vol-10-observational-equivalence.tex-237-
papers/latex/vol-10-observational-equivalence.tex-238-The functorial framing differs from the decision-theoretic framing in which monotone metrics were first studied, and the difference is structural. The classical uniqueness of \Cref{sec:metrics} originates in a decision-theoretic question about metrics on spaces of probability measures \cite{b8}: which metrics do not increase under stochastic transformations. That question presupposes the probability model and asks about its geometry. \Cref{def:obs} moves one level up: it asks what data a system presents to measurement before any metric is chosen. The two framings meet in \Cref{sec:metrics}, where the metrics are computed on the data \Cref{def:obs} produces.
papers/latex/vol-10-observational-equivalence.tex-239-
papers/latex/vol-10-observational-equivalence.tex-240-\begin{proposition}[Induced relation]
papers/latex/vol-10-observational-equivalence.tex-241-\label{prop:equivrel}
papers/latex/vol-10-observational-equivalence.tex:242:For a fixed observation functor $\mathrm{Obs}$, the relation $P \approx_{\mathrm{Obs}} Q$ defined by $\mathrm{Obs}(P) \cong \mathrm{Obs}(Q)$ is an equivalence relation on admissible systems. The map $P \mapsto [\mathrm{Obs}(P)]$ to record isomorphism classes is constant exactly on the $\approx_{\mathrm{Obs}}$ classes, so the quotient by $\approx_{\mathrm{Obs}}$ injects into the set of record isomorphism classes in the image of $\mathrm{Obs}$, and every map of sets out of the systems that is constant on $\approx_{\mathrm{Obs}}$ classes factors uniquely through that quotient.
papers/latex/vol-10-observational-equivalence.tex-243-\end{proposition}
papers/latex/vol-10-observational-equivalence.tex-244-
papers/latex/vol-10-observational-equivalence.tex-245-\begin{proof}
papers/latex/vol-10-observational-equivalence.tex:246:Isomorphism in $\mathsf{Obs}$ is an equivalence relation, and $\approx_{\mathrm{Obs}}$ is its pullback along $\mathrm{Obs}$: reflexivity, symmetry, and transitivity hold because they hold for isomorphism in $\mathsf{Obs}$. By construction $P \approx_{\mathrm{Obs}} Q$ holds exactly when $[\mathrm{Obs}(P)] = [\mathrm{Obs}(Q)]$, so the fibers of $P \mapsto [\mathrm{Obs}(P)]$ (the record isomorphism classes, not the strict fibers of $\mathrm{Obs}$ on objects) are the $\approx_{\mathrm{Obs}}$ classes, and the induced map on the quotient is injective on the image. Any set map constant on those fibers factors through the quotient by the universal property of quotient sets, and the factorization is unique because the quotient map is surjective.
papers/latex/vol-10-observational-equivalence.tex-247-\end{proof}
papers/latex/vol-10-observational-equivalence.tex-248-
papers/latex/vol-10-observational-equivalence.tex-249-The classes of $\approx_{\mathrm{Obs}}$ are the fibers of the record-isomorphism-class map, sometimes called the essential fibers of $\mathrm{Obs}$. Strict fibers, which fix one record object rather than its isomorphism class, are finer in general and are not the relation of \Cref{prop:equivrel}.
papers/latex/vol-10-observational-equivalence.tex-250-
papers/latex/vol-10-observational-equivalence.tex-251-\begin{lemma}[Products of observations]
papers/latex/vol-10-observational-equivalence.tex-252-\label{lem:products}
papers/latex/vol-10-observational-equivalence.tex:253:Let $\mathrm{Obs}_1$ and $\mathrm{Obs}_2$ be observation functors into record categories $\mathsf{Obs}_1$ and $\mathsf{Obs}_2$. The assignment $P \mapsto (\mathrm{Obs}_1(P), \mathrm{Obs}_2(P))$ is an observation functor into the product category, and its induced relation is the intersection of the relations of the two factors: $P \approx Q$ for the product holds exactly when $P \approx_{\mathrm{Obs}_1} Q$ and $P \approx_{\mathrm{Obs}_2} Q$.
papers/latex/vol-10-observational-equivalence.tex-254-\end{lemma}
papers/latex/vol-10-observational-equivalence.tex-255-
papers/latex/vol-10-observational-equivalence.tex-256-\begin{proof}
papers/latex/vol-10-observational-equivalence.tex-257-The product of functors is a functor into the product category, and an isomorphism of pairs is exactly a pair of isomorphisms. The statement about relations is the definition of isomorphism in a product category.
papers/latex/vol-10-observational-equivalence.tex-258-\end{proof}
papers/latex/vol-10-observational-equivalence.tex-259-
--
papers/latex/vol-10-observational-equivalence.tex-283-\subsection{Interaction and transitivity}
papers/latex/vol-10-observational-equivalence.tex-284-
papers/latex/vol-10-observational-equivalence.tex-285-\Cref{prop:equivrel} settles transitivity for functorially induced observational equivalence. The open question is whether indistinguishability generated by admissible experiments composes in interacting regimes. The series records this as unstudied, and the present paper does not close it. What can be said is conditional, and both regimes of the conditional statement are realistic.
papers/latex/vol-10-observational-equivalence.tex-286-
papers/latex/vol-10-observational-equivalence.tex-287-\begin{proposition}[Composed experiments]
papers/latex/vol-10-observational-equivalence.tex-288-\label{prop:composed}
papers/latex/vol-10-observational-equivalence.tex:289:Suppose the record category carries a product of records and the observation record of a composite system $A \otimes B$ is the product of the records of the factors. If $P \approx P'$ in the first factor relation and $Q \approx Q'$ in the second, then $P \otimes Q \approx P' \otimes Q'$. If instead the record of a composite contains a joint experiment whose outcome distribution is not determined by the factor records, the implication can fail.
papers/latex/vol-10-observational-equivalence.tex-290-\end{proposition}
papers/latex/vol-10-observational-equivalence.tex-291-
papers/latex/vol-10-observational-equivalence.tex-292-\begin{proof}
papers/latex/vol-10-observational-equivalence.tex:293:Under the stated hypothesis the record of a composite is a product of records, and a product of isomorphisms is an isomorphism, so indistinguishability of the factors is preserved. For the failure direction, take $\Omega = \{1,2,3,4\}$ with distributions $p = (\tfrac{1}{2}, \tfrac{1}{4}, \tfrac{1}{8}, \tfrac{1}{8})$ and $q = (\tfrac{1}{4}, \tfrac{1}{2}, \tfrac{1}{8}, \tfrac{1}{8})$. Let the factor observation be the single experiment with outcome blocks $\{\{1,2\}, \{3,4\}\}$, under which $p \approx q$ (both push forward to $(\tfrac{3}{4}, \tfrac{1}{4})$). On the composite state space $\Omega \times \Omega$ the factor-marginal records of $p \times p$ and $p \times q$ coincide, yet the joint event $\omega_1 = \omega_2$ reports $\sum_i p_i^2 = \tfrac{11}{32}$ under $p \times p$ and $\sum_i p_i q_i = \tfrac{9}{32}$ under $p \times q$. The joint experiment separates two composites whose factor relations identify the factors.
papers/latex/vol-10-observational-equivalence.tex-294-\end{proof}
papers/latex/vol-10-observational-equivalence.tex-295-
papers/latex/vol-10-observational-equivalence.tex:296:Which of the two regimes holds is a property of the interaction data, not of the observation formalism. If the accessible experiments of an interacting composite are the products of the accessible experiments of the factors, composition is safe by \Cref{prop:composed}. If the composition rules $\mathcal{C}$ of the object schema contribute experiments that neither factor admits alone, the implication has no reason to survive.
papers/latex/vol-10-observational-equivalence.tex-297-
papers/latex/vol-10-observational-equivalence.tex-298-\section{Information-geometric distinguishability}
papers/latex/vol-10-observational-equivalence.tex-299-\label{sec:metrics}
papers/latex/vol-10-observational-equivalence.tex-300-
papers/latex/vol-10-observational-equivalence.tex-301-\subsection{Classical uniqueness}
papers/latex/vol-10-observational-equivalence.tex-302-
--
papers/latex/vol-10-observational-equivalence.tex-318-for tangent vectors $a$ with zero sum, and \Cref{thm:chentsov} says every monotone Riemannian metric on the simplex is a positive multiple of this form. The expression is the one that appears in \Cref{prop:commutative} as the commutative restriction of the quantum family: on commuting data the quantum metrics all give the classical answer.
papers/latex/vol-10-observational-equivalence.tex-319-
papers/latex/vol-10-observational-equivalence.tex-320-Classical statistical distance is therefore pinned down: any criterion that reads distinguishability from a monotone Riemannian metric on classical models must be a multiple of the Fisher metric. This is the one uniqueness result among the family of probability and measure-theoretic structures in the series taxonomy.
papers/latex/vol-10-observational-equivalence.tex-321-
papers/latex/vol-10-observational-equivalence.tex-322-\subsection{Quantum parametricity}
papers/latex/vol-10-observational-equivalence.tex-323-
papers/latex/vol-10-observational-equivalence.tex:324:In the quantum case the uniqueness fails. Monotone metrics on quantum state spaces are given by the Morozova-Chentsov construction indexed by operator monotone functions $f$ on the positive reals, normalized by $f(1) = 1$ and self-reciprocal in Petz's sense, $f(x) = x f(x^{-1})$; the self-reciprocity is the symmetry condition that makes the quadratic form well defined on self-adjoint tangent directions, and distinct self-reciprocal $f$ give distinct metrics.
papers/latex/vol-10-observational-equivalence.tex-325-
papers/latex/vol-10-observational-equivalence.tex-326-\begin{theorem}[Petz-Sud{\'a}r classification]
papers/latex/vol-10-observational-equivalence.tex-327-\label{thm:petzsudar}
papers/latex/vol-10-observational-equivalence.tex:328:Every quantum monotone metric arises from an operator monotone function $f$ with $f(1) = 1$ and $f(x) = x f(x^{-1})$ through the Morozova-Chentsov form, and distinct such $f$ give distinct metrics on self-adjoint directions. The family is parametric, not a finite list, and no member is distinguished among all monotone metrics.
papers/latex/vol-10-observational-equivalence.tex-329-\end{theorem}
papers/latex/vol-10-observational-equivalence.tex-330-
papers/latex/vol-10-observational-equivalence.tex-331-\begin{proof}[Proof, by reference]
papers/latex/vol-10-observational-equivalence.tex:332:The classification of monotone metrics by operator monotone functions is stated and applied at \cite{b8}, where the classical uniqueness and its quantum failure are contrasted. The self-reciprocity condition identifies each metric with a symmetric representative; without it, $f$ and its transpose $f^{\#}(x) = x f(x^{-1})$ yield the same quadratic form on self-adjoint operators and would be double counted. The parametric nature of the family is the reason the classical uniqueness statement may not be extended to the quantum case.
papers/latex/vol-10-observational-equivalence.tex-333-\end{proof}
papers/latex/vol-10-observational-equivalence.tex-334-
papers/latex/vol-10-observational-equivalence.tex-335-Concretely, for a faithful density operator $\rho$ with eigenvalues $\lambda_i$ and a self-adjoint trace-free operator $A = \sum_{i,j} A_{ij} |i\rangle\langle j|$ in an eigenbasis of $\rho$, the quadratic form of the metric $g_f$ is
papers/latex/vol-10-observational-equivalence.tex-336-\[
papers/latex/vol-10-observational-equivalence.tex-337-g_f^{\rho}(A, A) \;=\; \sum_{i,j} \frac{|A_{ij}|^2}{\lambda_j \, f(\lambda_i / \lambda_j)}.
papers/latex/vol-10-observational-equivalence.tex-338-\]
papers/latex/vol-10-observational-equivalence.tex-339-
papers/latex/vol-10-observational-equivalence.tex-340-\begin{proposition}[Commutative restriction]
papers/latex/vol-10-observational-equivalence.tex-341-\label{prop:commutative}
papers/latex/vol-10-observational-equivalence.tex:342:For every operator monotone $f$ with $f(1) = 1$, the quadratic form $g_f^{\rho}$ restricted to operators $A$ that are diagonal in an eigenbasis of $\rho$ equals $\sum_i |A_{ii}|^2 / \lambda_i$, the classical Fisher form on the commutative subalgebra generated by $\rho$. On commutative data the quantum monotone metrics therefore agree, and the parametric freedom of \Cref{thm:petzsudar} is invisible.
papers/latex/vol-10-observational-equivalence.tex-343-\end{proposition}
papers/latex/vol-10-observational-equivalence.tex-344-
papers/latex/vol-10-observational-equivalence.tex-345-\begin{proof}
papers/latex/vol-10-observational-equivalence.tex:346:For $i \neq j$ the summands of the quadratic form carry factors $|A_{ij}|^2 = 0$ when $A$ is diagonal in the chosen basis. The surviving summands are $|A_{ii}|^2 / (\lambda_i f(1)) = |A_{ii}|^2 / \lambda_i$, since $f(1) = 1$.
papers/latex/vol-10-observational-equivalence.tex-347-\end{proof}
papers/latex/vol-10-observational-equivalence.tex-348-
papers/latex/vol-10-observational-equivalence.tex-349-\subsection{Ruler dependence of the metric scale}
papers/latex/vol-10-observational-equivalence.tex-350-
papers/latex/vol-10-observational-equivalence.tex:351:The parametric freedom becomes visible on non-commuting data. Two self-reciprocal representatives suffice to see it: $f(x) = \tfrac{2x}{1+x}$ and $h(x) = \tfrac{1+x}{2}$, both operator monotone with value $1$ at $1$ and both satisfying $f(x) = x f(x^{-1})$.
papers/latex/vol-10-observational-equivalence.tex-352-
papers/latex/vol-10-observational-equivalence.tex-353-\begin{example}[Two monotone metrics disagree]
papers/latex/vol-10-observational-equivalence.tex-354-\label{ex:monotone}
papers/latex/vol-10-observational-equivalence.tex-355-Let $\rho = \mathrm{diag}(3/4, 1/4)$ and $A = \sigma_x = \left(\begin{smallmatrix} 0 & 1 \\ 1 & 0 \end{smallmatrix}\right)$. Then
papers/latex/vol-10-observational-equivalence.tex-356-\[
papers/latex/vol-10-observational-equivalence.tex-357-g_f^{\rho}(A, A) = \frac{1}{\tfrac{1}{4} \cdot \tfrac{3}{2}} + \frac{1}{\tfrac{3}{4} \cdot \tfrac{1}{2}} = \frac{16}{3},
papers/latex/vol-10-observational-equivalence.tex-358-\qquad
papers/latex/vol-10-observational-equivalence.tex-359-g_h^{\rho}(A, A) = \frac{2}{\tfrac{3}{4} + \tfrac{1}{4}} + \frac{2}{\tfrac{1}{4} + \tfrac{3}{4}} = 4.
papers/latex/vol-10-observational-equivalence.tex-360-\]
papers/latex/vol-10-observational-equivalence.tex:361:The two admissible monotone metrics give different quadratic forms at the same state and the same direction, by the factor $4/3$.
papers/latex/vol-10-observational-equivalence.tex-362-\end{example}
papers/latex/vol-10-observational-equivalence.tex-363-
papers/latex/vol-10-observational-equivalence.tex-364-\begin{corollary}[Metric-level distinguishability is not canonical]
papers/latex/vol-10-observational-equivalence.tex-365-\label{cor:noncanonical}
papers/latex/vol-10-observational-equivalence.tex-366-Any criterion that reads quantum distinguishability from a monotone metric must name the function $f$. Different admissible choices give different quadratic forms at the same states and directions, so the numerical scale of ``the monotone-metric distance'' is not a function of the states alone.
papers/latex/vol-10-observational-equivalence.tex-367-\end{corollary}
--
papers/latex/vol-10-observational-equivalence.tex-412-
papers/latex/vol-10-observational-equivalence.tex-413-\subsection{A search protocol}
papers/latex/vol-10-observational-equivalence.tex-414-\label{sec:protocol}
papers/latex/vol-10-observational-equivalence.tex-415-
papers/latex/vol-10-observational-equivalence.tex-416-The counterexample search above is repeatable for any future criterion. A candidate relation on system records comes with the morphism kind realizing its identifications, and the protocol screens it in three passes.
papers/latex/vol-10-observational-equivalence.tex-417-
papers/latex/vol-10-observational-equivalence.tex:418:The screening pass reads the preserved layers off the morphism kind and checks them against \Cref{tab:layers}; a witness naming the monoidal layer without symmetry fails on the strength of \Cref{thm:eg} immediately. The testing pass runs the candidate on four cases: a finite classical pair separated only by a second experiment, a qubit pair of monotone metrics disagreeing off the commutative slice, two non-isomorphic groups of order 8 with equal character tables, and a product of observations that separates what its factors hide. A criterion that misidentifies any case is false, and a criterion that passes all four is untested.
papers/latex/vol-10-observational-equivalence.tex-419-
papers/latex/vol-10-observational-equivalence.tex-420-The band pass compares the candidate with \Cref{def:band}: the candidate must be at least as coarse as isomorphism and no coarser than admissible observation.
papers/latex/vol-10-observational-equivalence.tex-421-
papers/latex/vol-10-observational-equivalence.tex-422-A criterion that survives all three steps is not thereby correct. It is admissible so far, and the record of the search is part of the argument: which examples were run, which layers were named, which failure modes were ruled out. The series records no positive criterion for physical equivalence; the outcomes of \Cref{tab:criteria} are the first run of the protocol.
papers/latex/vol-10-observational-equivalence.tex-423-
papers/latex/vol-10-observational-equivalence.tex-424-\section{Reconstruction patterns and representability}
papers/latex/vol-10-observational-equivalence.tex-425-\label{sec:recon}
papers/latex/vol-10-observational-equivalence.tex-426-
papers/latex/vol-10-observational-equivalence.tex-427-Observation functors are stipulated here rather than derived, because the two proved reconstruction patterns do not yet connect across general system classes.
papers/latex/vol-10-observational-equivalence.tex-428-
papers/latex/vol-10-observational-equivalence.tex:429:The classic pattern recovers objects from probes. Gelfand duality reconstructs compact Hausdorff spaces from commutative $C^*$-algebras \cite{b3}; Stone duality reconstructs spectra from Boolean algebras \cite{b6}; the Gelfand-Naimark theorem embeds every $C^*$-algebra in an algebra of operators \cite{b4}. Each theorem is a precise statement with named hypotheses: an object is determined by how probes see it. The modern pattern represents higher-order operations. Categorical supermaps on a theory are concretely representable through channel-state duality whenever the theory has such a duality \cite{b5,b9}, and the factorization theorems for supermaps rest on the Yoneda lemma and on representability \cite{b5}.
papers/latex/vol-10-observational-equivalence.tex-430-
papers/latex/vol-10-observational-equivalence.tex-431-Whether the two patterns connect into one principle is open. The series records the question explicitly: whether the categorical-supermap line unifies with the Gelfand, Stone, and Naimark pattern into a single account of objects determined by their relationships is not established, and this paper does not close it. The relevance to observation functors is a hypothesis rather than a result. If representability of higher-order operations extends from supermaps to observation records in general, then records could be defined as representable objects and the functorial account of \Cref{sec:functors} would be derived rather than stipulated. The hypothesis needs a channel-state-duality statement for the systems in question, and no such statement is on record for general system classes.
papers/latex/vol-10-observational-equivalence.tex-432-
papers/latex/vol-10-observational-equivalence.tex-433-What can be used now is narrower. The reconstruction pattern fixes the shape of a legitimate claim about observation: an object recovered from named probes under named hypotheses is a theorem of reconstruction, not a classification and not an empirical adequacy claim. The series qualification applies to both patterns verbatim: ``Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.'' \Cref{sec:functors} defines observation functors as additional structure, and this section records the standing option of deriving them instead. The option is reasonable and unresolved.
papers/latex/vol-10-observational-equivalence.tex-434-
papers/latex/vol-10-observational-equivalence.tex-435-\section{The empirical layer}
papers/latex/vol-10-observational-equivalence.tex-436-\label{sec:empirical}
papers/latex/vol-10-observational-equivalence.tex-437-
papers/latex/vol-10-observational-equivalence.tex-438-\subsection{Instantiation of the layer}
papers/latex/vol-10-observational-equivalence.tex-439-
papers/latex/vol-10-observational-equivalence.tex:440:The three-layer architecture of the program separates mathematical classification, physical realization, and empirical selection. Layer three is a map from theories to observational constraints or predictions; it is not a claim that every model maps to a single observational object. This section instantiates layer three as an observation functor and marks where the instantiation stops.
papers/latex/vol-10-observational-equivalence.tex-441-
papers/latex/vol-10-observational-equivalence.tex-442-\begin{definition}[Empirical layer as observation functor]
papers/latex/vol-10-observational-equivalence.tex-443-\label{def:layer}
papers/latex/vol-10-observational-equivalence.tex-444-The empirical layer is the functor $\mathrm{Obs} \colon \mathrm{Phys}_{\mathrm{adm}} \to \mathsf{Obs}$ of \Cref{def:obs}, and the observational constraints or predictions of a theory are the contents of its observation record. The symbol $\mathcal{O}$ used for the codomain in the architecture collides with the observable-algebra symbol of the object schema; this paper writes $\mathsf{Obs}$ for the record category and keeps $\mathcal{O}$ for the observable algebra.
papers/latex/vol-10-observational-equivalence.tex-445-\end{definition}
papers/latex/vol-10-observational-equivalence.tex-446-
--
papers/latex/vol-10-observational-equivalence.tex-453-\subsection{Contents of the record category}
papers/latex/vol-10-observational-equivalence.tex-454-
papers/latex/vol-10-observational-equivalence.tex-455-\Cref{def:obs} names the record category without fixing its objects beyond outcome data. The results of this paper force specific contents of that category, and each forced content names an open condition.
papers/latex/vol-10-observational-equivalence.tex-456-
papers/latex/vol-10-observational-equivalence.tex-457-Experiments and outcomes are forced by \Cref{prop:equivrel}: a record that carries no outcome data induces the universal relation, and every system is indistinguishable from every other. Outcome labels are fixed by calibration of a given experiment: isomorphism of records compares the outcome distributions of the same experiment on the same label set, and a relabeling of outcomes is an isomorphism of experiment presentations rather than of records of one calibrated experiment. Comparison morphisms between records are forced by \Cref{prop:coarse}: coarsening is a functor on records, so the record category must contain the morphisms that forgetting induces. Limits of records are forced only when limiting procedures are in force, and \Cref{sec:morphisms} records that case as the least settled.
papers/latex/vol-10-observational-equivalence.tex-458-
papers/latex/vol-10-observational-equivalence.tex:459:What remains open is the treatment of interaction. The record of a composite system is not determined by the records of the factors unless the record category carries a monoidal structure mirroring the composition rules $\mathcal{C}$ of the object schema, and \Cref{prop:composed} shows both what holds under a product hypothesis and what can fail without it. The series leaves this open, and the record category proposed here inherits the open status.
papers/latex/vol-10-observational-equivalence.tex-460-
papers/latex/vol-10-observational-equivalence.tex:461:\subsection{Empirical selection as a quotient}
papers/latex/vol-10-observational-equivalence.tex-462-
papers/latex/vol-10-observational-equivalence.tex:463:Instantiated as an observation functor, the empirical layer computes a quotient: two theories land in the same class exactly when their records are isomorphic, which is the relation of \Cref{prop:equivrel}. This is the part of empirical selection that observation performs, and its limits are the limits of the records. A class of the quotient contains every theory compatible with the recorded outcomes, and the founding document anticipates exactly this situation: several mathematically distinct theories may produce identical predictions inside an experimentally accessible regime (section 7).
papers/latex/vol-10-observational-equivalence.tex-464-
papers/latex/vol-10-observational-equivalence.tex-465-Selection among the members of one class is not an observation problem in the sense of \Cref{def:obs}. It requires data the records do not carry: the internal structure of the theories, the behavior outside the accessible regime, or criteria of a different kind entirely. The three-layer architecture keeps this separation explicit: the empirical layer maps theories to observational constraints and predictions, and it is not a claim that every model maps to a single observational object. The quotient of \Cref{prop:equivrel} is the observational part of that map, nothing more.
papers/latex/vol-10-observational-equivalence.tex-466-
papers/latex/vol-10-observational-equivalence.tex-467-\section{Worked examples}
papers/latex/vol-10-observational-equivalence.tex-468-\label{sec:examples}
papers/latex/vol-10-observational-equivalence.tex-469-
--
papers/latex/vol-10-observational-equivalence.tex-495-g_f^{\rho}(A, A) = \tfrac{16}{3}(a^2 + b^2),
papers/latex/vol-10-observational-equivalence.tex-496-\]
papers/latex/vol-10-observational-equivalence.tex-497-and for $h(x) = (1+x)/2$ it is
papers/latex/vol-10-observational-equivalence.tex-498-\[
papers/latex/vol-10-observational-equivalence.tex-499-g_h^{\rho}(A, A) = \tfrac{16}{3} b^2 + 4 a^2.
papers/latex/vol-10-observational-equivalence.tex-500-\]
papers/latex/vol-10-observational-equivalence.tex:501:The two metrics differ only on off-diagonal directions. The diagonal summands contribute $\tfrac{4}{3}b^2 + 4b^2 = \tfrac{16}{3}b^2$ in both cases. For $f(x) = \tfrac{2x}{1+x}$ each of the two off-diagonal summands equals $\tfrac{a^2}{\lambda_2 f(\lambda_1/\lambda_2)} = \tfrac{8}{3}a^2$, so the off-diagonal total is $\tfrac{16}{3}a^2$; for $h(x) = (1+x)/2$ the two summands are $2a^2$ each, for a total of $4a^2$. The metrics coincide when $a = 0$ and differ by the factor $4/3$ when $b = 0$.
papers/latex/vol-10-observational-equivalence.tex-502-
papers/latex/vol-10-observational-equivalence.tex-503-\begin{table}[t]
papers/latex/vol-10-observational-equivalence.tex-504-\centering
papers/latex/vol-10-observational-equivalence.tex-505-\small
papers/latex/vol-10-observational-equivalence.tex-506-\begin{tabular}{@{} lccc @{}}
papers/latex/vol-10-observational-equivalence.tex-507-\toprule
--
papers/latex/vol-10-observational-equivalence.tex-600-\label{sec:limits}
papers/latex/vol-10-observational-equivalence.tex-601-
papers/latex/vol-10-observational-equivalence.tex-602-The observations of this paper are proposals constrained by proved results; they are not a completed formalization of the empirical layer. The domain and codomain of \Cref{def:obs} fix the shape of an observation functor, and the sources do not fix the contents: which experiments are admissible for a given system, how outcome families compose under interaction, and what structure the record category must carry are open. Until they are fixed, \Cref{prop:equivrel} is a statement about a proposed construction, not about physics.
papers/latex/vol-10-observational-equivalence.tex-603-
papers/latex/vol-10-observational-equivalence.tex-604-The counterexample search found one proved falsification (\Cref{thm:eg}) and one computed failure of canonicity (\Cref{ex:monotone}); it did not produce a concrete non-isomorphic pair of system records to close the dual-presentation row of \Cref{tab:criteria} at the system level. The search is bounded by the sources reviewed (cutoff 2026-10-29), and the absence of such a pair in this paper is not evidence that the literature lacks one.
papers/latex/vol-10-observational-equivalence.tex-605-
papers/latex/vol-10-observational-equivalence.tex:606:The metric results carry their own boundary. \Cref{thm:chentsov,thm:petzsudar} are used as established mathematics with their hypotheses intact: monotone under stochastic maps in the classical case, operator monotone functions normalized at $1$ and self-reciprocal in the quantum case. Nothing here extends classical uniqueness to the quantum case, and \Cref{cor:noncanonical} is the reason not to. The explicit computation is two-dimensional; the disagreement of the metrics is general (\Cref{thm:petzsudar}) but only the two-dimensional instance is exhibited here.
papers/latex/vol-10-observational-equivalence.tex-607-
papers/latex/vol-10-observational-equivalence.tex-608-The observational equivalence defined here is functorial indistinguishability. Bounded experimental indistinguishability in interacting regimes is not shown to coincide with it (\Cref{prop:composed}), and the empirical layer of the three-layer architecture keeps its full open status wherever the sources keep it.
papers/latex/vol-10-observational-equivalence.tex-609-
papers/latex/vol-10-observational-equivalence.tex-610-\section{Conclusion}
papers/latex/vol-10-observational-equivalence.tex-611-
papers/latex/vol-10-observational-equivalence.tex-612-Observational equivalence can be defined with ordinary categorical tools: an observation functor induces an equivalence relation whose classes are its record isomorphism classes, and coarsening the observations identifies at least what the fine observations identify. Distinguishability has a canonical classical ruler and no canonical quantum one: the Fisher metric is unique among monotone metrics on classical models, while quantum monotone metrics form a parametric family that agrees only on commutative data and disagrees on explicit non-commuting examples. Physical equivalence remains a choice, constrained from three sides by the results of this paper: it cannot be finer than observation, it must name the layers of structure it preserves, and it cannot rest on an unnamed metric. The most natural categorical criterion for it is false by a proved counterexample: plain tensor equivalence does not recover the group.
--
papers/latex/vol-10-observational-equivalence.tex-626-$P \cong Q$ & mathematical equivalence: isomorphism of tuples (\Cref{def:matheq}) \\
papers/latex/vol-10-observational-equivalence.tex-627-$P \simeq Q$ & physical equivalence: the chosen relation of the classification quotient (\Cref{def:physeq}) \\
papers/latex/vol-10-observational-equivalence.tex-628-$\mathrm{Obs}, \mathsf{Obs}$ & observation functor and its category of records (\Cref{def:obs}) \\
papers/latex/vol-10-observational-equivalence.tex-629-$P \approx_{\mathrm{Obs}} Q$ & observational equivalence induced by $\mathrm{Obs}$ (\Cref{def:obseq}) \\
papers/latex/vol-10-observational-equivalence.tex-630-$\approx_{\mathrm{Obs}_c}$ & relation of a coarsened observation (\Cref{def:coarse}) \\
papers/latex/vol-10-observational-equivalence.tex-631-$g_f^{\rho}(A, A)$ & Morozova-Chentsov quadratic form of the monotone metric $g_f$ (\Cref{sec:metrics}) \\
papers/latex/vol-10-observational-equivalence.tex:632:$f, h$ & self-reciprocal operator monotone functions normalized at $1$: $f(x) = \tfrac{2x}{1+x}$ and $h(x) = \tfrac{1+x}{2}$ \\
papers/latex/vol-10-observational-equivalence.tex-633-$\mathcal{A}$ & family of admissible observation functors (\Cref{def:band}) \\
papers/latex/vol-10-observational-equivalence.tex-634-\bottomrule
papers/latex/vol-10-observational-equivalence.tex-635-\end{tabularx}
papers/latex/vol-10-observational-equivalence.tex-636-\caption{Notation used throughout the paper.}
papers/latex/vol-10-observational-equivalence.tex-637-\label{tab:notation}
papers/latex/vol-10-observational-equivalence.tex-638-\end{table}

exec
/usr/local/bin/zsh -lc "rg -n 'label\\{(prop:limits|def:.*variety|def:.*independ|def:program|def:param|prop:undec|def:architecture|thm:petzsudar)|finite-variety type|finite-variety parametr|logical.*independen|selection.*comput|identity.*affine|preserves limits|Yoneda embedding preserves' papers/latex/*.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
papers/latex/vol-10-observational-equivalence.tex:327:\label{thm:petzsudar}
papers/latex/vol-11-completeness-obstructions.tex:184:Wildness & Wild categories admit no finite-variety parametrization of isomorphism classes & Finite-variety parameterization of wild sectors \\
papers/latex/vol-11-completeness-obstructions.tex:199:\label{def:program}
papers/latex/vol-11-completeness-obstructions.tex:204:\label{def:param}
papers/latex/vol-11-completeness-obstructions.tex:231:A domain $(D, \simeq)$ with a classification program lies in one of seven regimes. \emph{Parameterized}: all three components exist and $\Pi$ is one of the structured kinds of \Cref{def:program}, a finite combinatorial set, a finite-dimensional variety with an algebraic family, or a standard Borel space with a Borel parametrization. \emph{Unparameterized}: $\iota$ and $R$ exist, no uniform $\Pi$ is known. \emph{Obstruction-complete}: the classification content is a proved impossibility theorem, so the classification is the obstruction. \emph{Open}: partial results exist and no impossibility theorem applies. \emph{Wild}: finite-variety parametrization is provably impossible and isomorphism classes grow without bound in every proposed parameter dimension. \emph{Undecidable}: $R$ is provably nonexistent in the stated generality. \emph{Decidable-but-unclassified}: $R$ exists and no complete $\iota$ is known.
papers/latex/vol-11-completeness-obstructions.tex:278:Wild CM modules of the generic determinant & Wild & No finite-variety parametrization \cite{buchweitz2005} \\
papers/latex/vol-11-completeness-obstructions.tex:346:Let $\mathcal{C}$ be a category of representations admitting a fully faithful functor $F$ from the module category of a derived-wild finite-dimensional algebra. Then $\mathcal{C}$ carries a wild embedding, the essential image $F(\mathcal{A})$ admits no finite-variety parametrization of its isomorphism classes \cite{bekkert2003,buchweitz2005,grevstad2025}, and the same non-parametrization holds for any subcategory of $\mathcal{C}$ equivalent to that image.
papers/latex/vol-11-completeness-obstructions.tex:349:\Cref{cor:wild} is the reason wildness is a structural fact about a domain and not a comment on the state of the art. The generic determinant's Cohen-Macaulay modules in rank two already defeat finite-variety parametrization \cite{buchweitz2005}, and the compact $C_p$-equivariant modules at odd primes carry no meaningful classification at all \cite{grevstad2025}. Any larger domain that embeds either category in the manner of the corollary carries the obstruction on its embedded part. The same pattern with \Cref{lem:countable} shows that a sector with no classification by countable structures forbids such classification for any domain receiving it along a Borel, fully faithful functor.
papers/latex/vol-11-completeness-obstructions.tex:365:\label{prop:undec}
papers/latex/vol-12-principia-physica.tex:52:This paper assembles the registered results of the Classification of Mathematical Representations of Physical Systems into the three-layer architecture of Principia Physica: mathematical classification, physical realization, and empirical selection. The assembly keeps the three layers apart and separates proved statements from conjectural ones. Twenty background classification theorems and seven obstruction theorems are organized into seven classification regimes; a finite case analysis of the twenty-eight domains of the program comparison spine, with one boundary case, shows that fifteen carry a classification theorem with a finite or explicitly parameterized invariant, one is complete but unparameterized, one is a complete obstruction classification, seven remain open or claimed, three are impossible in the stated generality, one is undecidable, and one is decidable but unclassified. Eight reconstruction theorems recover objects from probes, each under hypotheses that cannot be dropped. The empirical layer admits no unique monotone metric in the quantum case, and no record validates the physical layer: the announced four-dimensional existence result carries the status existence claimed; manuscript and formalization withheld; verification pending, and the mass gap problem remains open. The structural classification statement enters only as a declared hypothesis, and a conditional reduction records what its five proof obligations would deliver. No record in the series carries a completed computer-checked proof.
papers/latex/vol-12-principia-physica.tex:137:Given a regime $E$ of accessible experiments, two theories satisfy $T_1 \sim_E T_2$ when they give identical predictions in $E$. The relation $\sim_E$ is an equivalence relation on theories, and the selection layer $\mathcal{E}$ is the map whose induced quotient computes it.
papers/latex/vol-12-principia-physica.tex:168:Empirical selection is not a corollary of classification. Let $T_1$ and $T_2$ be mathematically distinct theories whose predictions agree in an accessible regime $E$, as the architecture stipulates; write $T_1 \sim_E T_2$ for that agreement. A classification at $\mathcal{M}$ distinguishes $T_1$ from $T_2$, so the classification map is not constant on $\sim_E$-classes and cannot compute them. Deciding $\sim_E$ requires the map $\mathcal{E}$, which the classification layer does not supply.
papers/latex/vol-12-principia-physica.tex:258:The analogy between the two classification problems is architectural rather than evidentiary. The finite simple groups share one definition; physical systems have no universally accepted mathematical definition, and the schema of \cref{def:representation} is a candidate. The founding documents warn against assuming that physical theories possess a finite collection of exceptional objects analogous to the twenty-six sporadic groups \cite{corpus-1}. Exceptional mathematics exists and the taxonomy must accommodate it: the exceptional Lie algebras \cite{corpus-4}, the type~$\mathrm{III}$ factors and the hyperfinite $\mathrm{II}_1$ factor \cite{corpus-8}, the eight Thurston geometries \cite{corpus-60}, and the isocategorical group pairs \cite{corpus-12}. Whether any two of the ten families of \cref{tab:families} are logically independent is open, and no theorem on record settles it.
papers/latex/vol-12-principia-physica.tex:351:The first statement is Chentsov's theorem \cite{corpus-52}. The second is the Petz-Sudar classification \cite{corpus-52}. The parameterizing class of operator monotone functions contains more than one element; for instance the identity function and the affine function $f(x) = (x+1)/2$ are both operator monotone and give different metrics. The uniqueness statement is therefore false in the quantum case, and the last clause follows: a criterion that names a single quantum monotone metric makes an additional choice beyond the classification theorem.
papers/latex/vol-12-principia-physica.tex:528:What remains uncertain is equally sharp. The admissibility conditions are unfixed. The physical equivalence is unchosen. The realization and selection maps are stipulated and not constructed. The announced four-dimensional existence result carries the status existence claimed; manuscript and formalization withheld; verification pending, and the mass gap is open. No record carries a completed computer-checked proof. The central test of the realization layer, reconstruction of interacting dynamics and spacetime without presupposing spacetime, is unanswered.
papers/latex/vol-02-structural-families.tex:56:This paper develops the family-level taxonomy that a classification of mathematical representations of physical systems requires. Ten structural families organize mathematical structures capable of representing physical systems: symplectic and Poisson structures, Hilbert spaces and operator algebras, smooth manifolds and geometric structures, principal bundles and connections, probability and measure-theoretic structures, topological and higher-categorical structures, dynamical systems and operator semigroups, tensor categories and compositional structures, discrete combinatorial structures, and derived and homotopical structures. Each family is presented with its defining invariant, its classified islands, and its recorded obstructions. Four results govern how the taxonomy may be used. A sharpness criterion shows that a family admits a classification of a prescribed shape only when its classifying invariant takes values in a set of matching cardinality or geometric structure. A globality proposition shows that no local invariant classifies inside the symplectic family. A non-closure proposition shows that a class of objects irreducible under direct sum is not itself closed under direct sum. An independence proposition shows that two families may each carry a classifying invariant and still fail to be logically independent. The ten families are candidates for an organizing taxonomy and not a completed classification, and no completeness claim is made for them.
papers/latex/vol-02-structural-families.tex:65:Four results carry the argument. \Cref{thm:sharpness} bounds the shape of any classification by the shape of the classifying invariant: a family whose invariant takes values in a finite set has finitely many classes, a family with uncountably many classes admits no invariant into a countable set, and a family whose classes are the image of a morphism of finite type is parameterized by a constructible set. \Cref{prop:globality} shows that inside the symplectic family every local invariant is constant, so classification content there is global and topological. \Cref{prop:closure} shows that a class of objects irreducible under direct sum is never closed under direct sum, so passing to a closure always adds objects. \Cref{prop:independence} shows that two families may both carry classifying invariants and still fail to be logically independent.
papers/latex/vol-02-structural-families.tex:548:A natural hope is that the ten families are logically independent, so that no family can be rebuilt from another. What the literature proves is a mixture of reconstruction theorems and counterexamples to reconstruction.
papers/latex/vol-02-structural-families.tex:570:\label{def:independence}
papers/latex/vol-02-structural-families.tex:571:Two structural families $\mathfrak{F}$ and $\mathfrak{G}$ are \emph{logically independent} when neither is a special case of the other and neither is reconstructable from the other: there is no full embedding of one into the other, and no correspondence of the kind in Table~\ref{tab:independence} that determines one from the other. Independence in this sense is a statement about the families as classes of records and not about any particular system.
papers/latex/vol-02-structural-families.tex:576:Let $\mathfrak{F}$ and $\mathfrak{G}$ be two structural families each admitting a classifying invariant. Then $\mathfrak{F}$ and $\mathfrak{G}$ need not be logically independent. In particular the commutative unital $C^*$-algebras inside the operator-algebra family and the compact Hausdorff spaces inside the geometric family each carry a classifying invariant, and neither is independent of the other.
papers/latex/vol-02-structural-families.tex:580:The Gelfand correspondence gives a bijection between commutative unital $C^*$-algebras and compact Hausdorff spaces that is an anti-equivalence of categories \cite{gelfand-duality,gelfand-naimark}. The spectrum is a classifying invariant for the space side and the algebra is a classifying invariant for the algebra side, and each determines the other. Two families related by such a correspondence cannot be logically independent, because every statement about one transfers to the other. The existence of a classifying invariant in each family is therefore silent on the question of independence.
papers/latex/vol-02-structural-families.tex:646:Whether any two families are logically independent & Open & A non-derivability theorem in a stated sense \\
papers/latex/vol-02-structural-families.tex:686:What remains open is stated plainly. Which of the ten families are fundamental rather than presentations of others is not known. Whether any two families are logically independent is not known. Whether the ten families generate all admissible physical systems under the admissible constructions is a conjecture. The taxonomy is a place to record classification results, and it is not itself the classification.
papers/latex/vol-08-spacetime-reconstruction.tex:57:This paper classifies and reconstructs spacetime and separates what is proved from what is proposed. Four results are complete within their stated hypotheses: connected holonomy groups of Lorentzian manifolds in signature $(1,n-1)$ are classified and realized by explicit metrics; the causal ladder of spacetimes is complete as a hierarchy of causality conditions; closed 3-manifolds decompose into exactly eight Thurston geometries; and for two, three, and four boundary regions the holographic entropy cone is cut out by strong subadditivity together with monogamy of mutual information. Against these islands, the homeomorphism problem for closed 4-manifolds is algorithmically undecidable, so finite classification tables exist only in tame regimes. Reconstruction recovers a target geometry from relational probe data: the chronological order determines the topology and the conformal class of a distinguishing spacetime, and entanglement-wedge reconstruction recovers bulk operators from boundary subregions in a quantum-information setting. The Ryu-Takayanagi formula remains a proposal, with exact agreement in AdS$_3$/2D CFT and for spherical regions in higher dimensions, HaPPY codes realize it in toy models only, and entanglement-induced geometry is an argument. Two boundary statements delimit the subject: monogamy of mutual information is independent of strong subadditivity over entropic vectors, and the ladder depends on how its rungs are translated to discrete orders.
papers/latex/vol-04-yoneda-classification.tex:63:The Yoneda embedding sends each object of a category to the functor it represents through its relationships with all other objects. This paper develops the relational characterization of mathematical representations of physical systems that the embedding supplies, and it states precisely what the embedding does not supply. The Yoneda lemma determines an object up to isomorphism by its relational profile, and the embedding is fully faithful on any locally small category of representations once the admissible morphisms are fixed. Concrete representability results for quantum supermaps show that in settings with channel-state duality the relational content is not merely formal, and the classical reconstruction theorems of Gelfand, Stone, and Doplicher and Roberts recover objects from categories of probes. Against these results stands a governing constraint: Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem. A non-implication theorem makes the third denial precise, because full faithfulness holds in categories where isomorphism classes admit no finite-variety parametrization, so representability cannot be the source of a classification theorem. The paper separates established mathematics from conjectural physical interpretation throughout and records the open problem of unifying the supermap line with the reconstruction pattern.
papers/latex/vol-04-yoneda-classification.tex:79:The relational profile of a representation determines that representation up to isomorphism in a declared category of morphisms, and it determines nothing beyond that isomorphism. Full faithfulness preserves isomorphism classes without constraining how those classes are parameterized, so relational data yields no classification invariants on its own. Concrete physical recovery happens only where extra structure is assumed: channel-state duality for quantum supermaps, symmetric monoidal structure for Doplicher-Roberts reconstruction. On the positive side stand the Yoneda lemma and its corollaries, the Choi correspondence and the supermap representability it supports \cite{whh, hw}, and the probe reconstruction theorems with their declared hypotheses \cite{gn, stone, dr}. On the negative side stands a non-implication theorem: full faithfulness holds in categories where isomorphism classes admit no finite-variety parametrization \cite{buchweitz}, so representability cannot be the source of a classification theorem. No theorem joins the two sides; \cref{sec:synthesis} records the open problem that would.
papers/latex/vol-04-yoneda-classification.tex:225:\label{prop:limits}
papers/latex/vol-04-yoneda-classification.tex:244:Let $\mathcal{C}$ be a category of representations and let $S$ be a parameter set. An \emph{invariant} is a map $I \colon \mathrm{Ob}(\mathcal{C}) \to S$ constant on isomorphism classes. The invariant $I$ \emph{classifies} $\mathcal{C}$ up to isomorphism when $I(P) = I(Q)$ implies $P \cong Q$; a family of invariants classifies when the joint map does. A classification is \emph{of finite-variety type} over a field $k$ when the parameter set $S$ is the set of $k$-points of a finite-dimensional algebraic variety over $k$. A class of objects is \emph{parametrized by a finite-dimensional variety over $k$} when such a classifying invariant of finite-variety type exists.
papers/latex/vol-04-yoneda-classification.tex:263:The three denials of the governing constraint now have their mathematical content. Physical equivalence is a choice of morphisms or relations that the embedding does not make. Empirical adequacy is a property of how a representation meets observation, a separate layer of the architecture from mathematical classification. A classification theorem is a supply of separating invariants, and Theorem~\ref{thm:noimplication} shows that representability is logically independent of such a supply. What Yoneda does establish is Corollary~\ref{cor:releq}: objects are determined by their relationships, up to the isomorphism encoded in the declared morphisms.
papers/latex/vol-04-yoneda-classification.tex:282:Forbidden in the stated generality & Modules over the generic determinant & None of finite-variety type & Classification itself \\
papers/latex/vol-04-yoneda-classification.tex:346:The 2024 work \cite{hw} identifies morphisms of strong profunctors as a categorification of quantum supermaps, which places these black-box generalisations of diagrams with holes inside the theory of profunctor optics. From this vantage it constructs abstract logical connectives for supermaps, including tensor products and negations, in a theory-independent setting. Three structural features of quantum supermaps are then modelled by these connectives alone: black-box indefinite causal order, black-box definite causal order, and the factorisation of definitely causally ordered supermaps into concrete circuit diagrams. The 2026 work \cite{whh} states the mechanism as the lemma of Theorem~\ref{thm:supermap}, and the lemma eliminates guesswork in defining supermaps for a given theory.
papers/latex/vol-04-yoneda-classification.tex:581:\emph{Classification.} Theorem~\ref{thm:noimplication} shows that full faithfulness of $y$ is logically compatible with the absence of any finite-variety parametrization of isomorphism classes. The classification problem of the series asks for invariants separating objects up to a chosen equivalence; profiles separate objects up to isomorphism by a different mechanism, and the two must not be confused. Where classification content exists for a family of systems, it comes from the invariants of that family, not from representability.
papers/latex/synthesis.tex:518:A layer separation holds in the architecture. Mathematical classification, physical realization, and empirical selection are three maps with different domains and codomains. A complete mathematical classification would leave realization and selection unconstrained, because the latter two apply maps that classification does not compute. The separation is stated in the foundational part, instantiated in the observational-equivalence part, and preserved in the assembly part.
papers/latex/synthesis.tex:536:Mathematical consistency and empirical selection are different layers. A consistency proof settles the first and leaves the second open, because the empirical layer applies an observation map that mathematical classification does not compute.
papers/latex/vol-06-quantum-systems.tex:72:Quantum physical systems admit a complete structural classification only in restricted regimes, and this paper records where those regimes begin and end. Finite-dimensional observable algebras are classified by one combinatorial invariant, the dimension vector of the block decomposition. Amenable operator-algebraic models are classified by Murray-von Neumann type together with Connes invariants. Completely positive maps admit a canonical normal form through minimal Stinespring dilations, unique up to unitary equivalence, and the Kraus rank of that normal form is not an isomorphism invariant of channels. Beyond the amenable class no finite answer is possible: uncountably many pairwise non-isomorphic separable $\mathrm{II}_1$ factors exist, so no finite list of factor types can be exhaustive. On the categorical side, the Doplicher-Roberts reconstruction theorem and Deligne's theorem classify superselection and symmetric tensor categories under explicit hypotheses, and the Etingof-Gelaki examples show that any equivalence forgetting the symmetric structure fails to recover its group. Quantum monotone metrics form a parametric family rather than a unique choice. The paper separates classified islands from proved impossibilities and open problems, and reports executable models of the finite-dimensional taxonomy as computational evidence only.
papers/latex/vol-06-quantum-systems.tex:648:No theorem here states that any two of the structural families used above are logically independent, and no theorem here establishes physical or empirical equivalence of any two systems. The long-term classification target of the program remains a research objective; the results of this paper are consistent with it in the classified islands and constrain it by theorem in the non-classifiable ocean. The open problems of \cref{sec:regimes} are the natural restricted-class targets next, and each has the shape of a solved problem: a named class, a declared equivalence, and an invariant that either separates or provably cannot.
papers/latex/vol-06-quantum-systems.tex:654:Quantum physical systems admit classification by dimension vector in finite dimension, by Murray-von Neumann type and Connes invariants on the amenable side of operator algebra, and by underlying supergroup in the symmetric tensor categories of superselection theory. Completely positive maps admit a minimal Stinespring normal form whose Kraus rank is not a channel classification. Quantum monotone metrics are parametric, classified by operator monotone functions rather than by a unique metric. Against these classifications stands the McDuff obstruction: uncountably many separable $\mathrm{II}_1$ factors exist, so no finite list of factor types is exhaustive and no CFSG-style list exists outside restricted classes. The open problems of the Elliott program, fusion-category structure, non-amenable type $\mathrm{III}$ strata, and channel isomorphism define the current frontier. The supplementary code records the finite-dimensional content as computational evidence and nothing more.
papers/latex/vol-07-gauge-qft.tex:245:Two connections $\omega_1$ and $\omega_2$ on a principal $G$-bundle $P \to X$ are gauge equivalent when a bundle automorphism $g: P \to P$ over the identity of $X$ satisfies $g^*\omega_2 = \omega_1$. The moduli space of connections on a fixed bundle is the quotient of the affine space of connections by this gauge action. Its singularities are the reducible connections, whose stabilizer is larger than the center of $G$, and those points obstruct a smooth quotient description.

exec
/usr/local/bin/zsh -lc "sed -n '215,260p' papers/latex/vol-04-yoneda-classification.tex; sed -n '195,225p' papers/latex/vol-11-completeness-obstructions.tex; sed -n '357,378p' papers/latex/vol-11-completeness-obstructions.tex; sed -n '300,340p' papers/latex/vol-10-observational-equivalence.tex; sed -n '120,145p' papers/latex/vol-12-principia-physica.tex; sed -n '575,615p' papers/latex/vol-02-structural-families.tex; cat lean/lake-manifest.json; rg --files --hidden lean -g '"'!**/.git/**'"'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
\end{proof}

Proposition~\ref{prop:restriction} makes the probe class part of the hypothesis. A profile computed on an arbitrary small probe class carries no more content than that class exposes, and the condition that the comparison be fully faithful is the standard density requirement on $\mathcal{R}$. Any physical claim about determination by probes must therefore state the probes.

\subsection{Composition of systems}
\label{sec:composition}

Physical systems compose, through tensor products, direct sums, and the other constructions that generate complex systems from simple ones. The behavior of relational profiles under composition is therefore a question the classification program cannot avoid.

\begin{proposition}[Profiles respect limits]
\label{prop:limits}
Let $\mathcal{C}$ be a locally small category in which a diagram $D$ has a limit $L = \lim D$. Then $y(L)$ is the limit of the diagram $y \circ D$ in $[\mathcal{C}^{\mathrm{op}}, \mathbf{Set}]$. In particular $y$ preserves terminal objects and binary products: $y(A \times B) \cong y(A) \times y(B)$ canonically whenever the product exists.
\end{proposition}

\begin{proof}
Limits of presheaves are computed pointwise, so for each probe $R$ one must show
\[
\Hom(R, \lim D) \cong \lim \Hom(R, D),
\]
which is the defining universal property of the limit applied to the probe $R$. For binary products the statement reads $\Hom(R, A \times B) \cong \Hom(R, A) \times \Hom(R, B)$, which is the universal property of the product.
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

The register forbids specific forms of classification. To compare those forms across domains, a classification program is decomposed into three pieces of data.

\begin{definition}[Classification program]
\label{def:program}
Let $(D, \simeq)$ be a domain of objects with an equivalence relation. A classification program for $(D, \simeq)$ is a triple $(\iota, \Pi, R)$ where $\iota$ is a complete invariant, a map from objects to a set $I$ with $\iota(x) = \iota(y)$ if and only if $x \simeq y$; $\Pi$ is a parameter space, a structured object together with a structure-compatible surjection onto the $\simeq$-classes of $D$; and $R$ is a recognizer, a procedure that decides $x \simeq y$ from finite presentations of $x$ and $y$. The structure of $\Pi$ is part of the data: it is a finite-dimensional $k$-variety with an algebraic family, a standard Borel space with a Borel parametrization, or a finite combinatorial set. Without that structure $\Pi$ is just another name for the class set and carries no content beyond $\iota$.
\end{definition}

\begin{definition}[Finite-variety parametrization]
\label{def:param}
The isomorphism classes of a category $\mathcal{A}$ over a field $k$ are parametrized by a finite-dimensional variety when there are a finite-dimensional $k$-variety $V$ and an algebraic family of objects $\{A_v\}_{v \in V(k)}$ of $\mathcal{A}$ such that every object of $\mathcal{A}$ is isomorphic to some fiber $A_v$. A bare set-theoretic surjection $V(k) \twoheadrightarrow \mathrm{Ob}(\mathcal{A})/{\cong}$ is not a parametrization: when $k$ is uncountable the cardinality of $V(k)$ exceeds the class set of any tame category, so such maps exist trivially and carry no geometric information.
\end{definition}

\Cref{def:param} is the notion the wildness results refute. Buchweitz and Leuschke show that in rank two the isomorphism classes of the generic determinant's Cohen-Macaulay modules admit no parametrization by a finite-dimensional variety over the coefficients \cite{buchweitz2005}, in exactly the algebraic-family sense of \Cref{def:param}.

The classification of finite simple groups delivers an exhaustive list, and practical identification runs through companion data of the Atlas kind: order, Schur multiplier, outer automorphism group, presentations, character tables with power maps \cite{atlaswiki}. What it does not deliver is a uniform parameterization. Gorenstein's verdict is the recorded one: no clean uniform description of the finite simple groups analogous to Dynkin diagrams is known \cite{solomon2001}. The classification is complete and its parameterization is missing, so completeness of the list and existence of a parameter space are different achievements. The Killing-Cartan classification of complex semisimple Lie algebras achieves both: Dynkin diagrams parameterize, the invariant is complete, and recognition is algorithmic \cite{humphreys,fultonharris}. Darboux's theorem shows a third configuration: locally, symplectic manifolds of the same dimension are all equivalent, so the local classification is complete and trivial and its content is entirely global \cite{darboux}.

\begin{lemma}[Countable invariants]
\label{lem:countable}
If the isomorphism relation on a domain $D$ admits no classification by countable invariants in the descriptive-set-theoretic sense, that is, if it is not Borel reducible to the isomorphism relation of any class of countable structures, then no complete invariant of $D$ takes values in a space of countable structures. If in addition $D$ has more than countably many isomorphism classes, then no complete invariant of $D$ takes values in a countable set.
\end{lemma}

\begin{proof}
A complete invariant whose values are countable structures, taken with a Borel assignment of the structure to the object, is a classification by countable invariants and would give a Borel reduction to the isomorphism of those structures. For the second claim, a complete invariant with countable range has countably many fibers, so the class set is countable.
\end{proof}

For the separable $\mathrm{II}_1$ factors the second claim of \Cref{lem:countable} is already settled by McDuff's uncountable family \cite{mcduff1969}. The first claim is stronger: for general separable von Neumann algebras even invariants valued in countable structures, K-theory data of that kind, fail to classify isomorphism \cite{sasyk2009}. A cardinality bound and a Borel-reducibility bound are different statements, and the arguments below invoke each where it applies.

\begin{remark}[Two instances of the definition]
Finite-dimensional complex $C^*$-algebras instantiate \Cref{def:program} with $\iota$ the dimension vector, $\Pi$ the finite set of multisets of block sizes, and $R$ the block decomposition algorithm. Finitely presented groups under isomorphism instantiate it with the obstruction register in place of the components: $\iota$ exists set-theoretically, no algebraic-family $\Pi$ is expected in the wild sectors, and $R$ does not exist at all in the presence of Markov reductions. The two instances show that the definition is neutral between regimes; the regimes are properties of the evidence, not of the definition.
\end{remark}
An atlas of countably many computable fingerprints assigns to each algebra a tuple of values from countable sets, and the combined map is a complete invariant with countable range if the atlas is complete; \Cref{lem:countable} and McDuff's uncountable family rule this out \cite{mcduff1969}. The stronger statement is the Borel-reducibility result of Sasyk and Tørnquist \cite{sasyk2009}.
\end{proof}

\Cref{cor:opalg} fixes the reach of the Atlas discipline of the model program, identification by finite tables of computable data \cite{atlaswiki}. That method is complete exactly where a countable-valued complete invariant exists and provably incomplete where uncountably many classes or the Borel-reducibility obstruction stand. The regime table records which domains admit an atlas at all.

\subsection{Recognition reductions}

\begin{proposition}[Undecidability transport]
\label{prop:undec}
Let $Q$ be a recognition problem for a class $\mathcal{C}$, and suppose there is a computable map $\varphi$ from finite group presentations to objects of $\mathcal{C}$ and a Markov property $P$ of finitely presentable groups such that a presentation $G$ has $P$ if and only if $\varphi(G)$ satisfies $Q$. Then $Q$ is algorithmically undecidable.
\end{proposition}

\begin{proof}
A decision procedure for $Q$, composed with the computable map $\varphi$, decides $P$ on finite presentations. By the Adyan-Rabin theorem no such procedure exists for any Markov property \cite{adyan1955,rabin1958}. Hence none exists for $Q$.
\end{proof}

\Cref{prop:undec} is the shape of every undecidability entry in the register. Tancer's construction is an instance: the unrecognizability of the nine-fold connected sum of $S^2 \times S^2$ is proved through the Markov set construction carried into four-manifold topology \cite{tancer2023}. The proposition also explains why undecidability is a statement about the recognizer component of \Cref{def:program} and says nothing by itself about invariants or parameter spaces: an undecidable domain may still carry rich complete invariants that no algorithm can compute.

\subsection{Counterexample catalogue}
\label{sec:counterexamples}

Each of the three natural strengthenings of the classification picture below fails on an explicit counterexample.

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
\end{definition}

\begin{remark}
The regime assignment is an organizing device for the evidence base. It does not assert that the regimes are mathematically exhaustive of all possible classification situations. The unknot recognition problem, in $\mathrm{NP}$ and co-$\mathrm{NP}$ with the complexity-class membership open \cite{corpus-61}, is the registered instance of regime 7, and \cref{tab:regimes} carries it as a boundary case beyond the twenty-eight spine domains.
\end{remark}

\begin{definition}[Structural invariant record]
\label{def:invariants}
For a theory $T$, the structural invariant record is the tuple
\[
  \mathcal{I}(T) = (\mathcal{S}_T, \mathcal{O}_T, \mathcal{D}_T, \mathcal{G}_T, \mathcal{R}_T),
\]
describing states, observables, dynamics, symmetries, and representations. The classification question is which of these invariants suffice to distinguish theories up to the chosen equivalence of \cref{def:equivalence}.
\end{definition}

\begin{definition}[Observational equivalence]
\label{def:observational}
Given a regime $E$ of accessible experiments, two theories satisfy $T_1 \sim_E T_2$ when they give identical predictions in $E$. The relation $\sim_E$ is an equivalence relation on theories, and the selection layer $\mathcal{E}$ is the map whose induced quotient computes it.
\end{definition}

\begin{table}[htbp]
\caption{The ten candidate structural families with representative systems and defining invariants. The families are candidates and some may later be unified.}
\label{tab:families}
\small
\begin{tabularx}{\textwidth}{>{\hsize=0.35\hsize\raggedright\arraybackslash}X >{\hsize=1.4\hsize\raggedright\arraybackslash}X >{\hsize=0.95\hsize\raggedright\arraybackslash}X >{\hsize=1.3\hsize\raggedright\arraybackslash}X}
\toprule
\label{prop:independence}
Let $\mathfrak{F}$ and $\mathfrak{G}$ be two structural families each admitting a classifying invariant. Then $\mathfrak{F}$ and $\mathfrak{G}$ need not be logically independent. In particular the commutative unital $C^*$-algebras inside the operator-algebra family and the compact Hausdorff spaces inside the geometric family each carry a classifying invariant, and neither is independent of the other.
\end{proposition}

\begin{proof}
The Gelfand correspondence gives a bijection between commutative unital $C^*$-algebras and compact Hausdorff spaces that is an anti-equivalence of categories \cite{gelfand-duality,gelfand-naimark}. The spectrum is a classifying invariant for the space side and the algebra is a classifying invariant for the algebra side, and each determines the other. Two families related by such a correspondence cannot be logically independent, because every statement about one transfers to the other. The existence of a classifying invariant in each family is therefore silent on the question of independence.
\end{proof}

No theorem on record states that any two of the ten families are independent in the sense of \Cref{def:independence}. The honest chart entry for the independence question is open, and \Cref{prop:independence} explains why classifying invariants cannot settle it.

\section{Systems in more than one family}
\label{sec:mixing}

A physical system is a record $(X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$, and the families classify records by their mathematical structure. A single record can present structure from several families at once, and the taxonomy must account for that without pretending the families partition mathematics.

\begin{proposition}[Mixed records are not defects]
\label{prop:mixed}
There exist records whose state space is a symplectic manifold, whose observable algebra is a noncommutative $C^*$-algebra, and whose symmetry group is a Lie group. Such a record lies in the symplectic, operator-algebraic, and geometric families at once. Consequently the assignment of records to families is not a partition, and no argument may treat the ten families as mutually exclusive classes.
\end{proposition}

\begin{proof}
Take $M$ a compact K\"{a}hler manifold with integral K\"{a}hler form $\omega$, let $L \to M$ be the corresponding positive line bundle, and let $\mathcal{H}_L$ be the space of holomorphic sections of $L$. For $f \in C^\infty(M)$ let $T_f$ be the Toeplitz operator on $\mathcal{H}_L$ that multiplies by $f$ and then projects back to $\mathcal{H}_L$. The $C^*$-algebra generated by the operators $T_f$ is noncommutative whenever $\dim \mathcal{H}_L > 1$, since $T_f T_g - T_g T_f$ is nonzero for suitable $f$ and $g$. The record whose state space is $M$ with its symplectic form, whose observable algebra is this Toeplitz $C^*$-algebra, whose symmetries are the biholomorphisms of $M$ lifting to $L$, and whose dynamics is the quantization of a Hamiltonian on $M$, presents symplectic, operator-algebraic, and geometric structure at once. If the families were mutually exclusive, this record would lie in none of them or in more than one, and the second option contradicts exclusivity.
\end{proof}

The research goal at this level is to discover which distinctions are fundamental and which arise from different mathematical presentations. \Cref{prop:mixed} is a small instance of that question, and it is the reason \Cref{def:structural-family} defines a family by the structure it singles out rather than by membership of records.

Two further relations between families are worth naming. A family may be a special case of another: the commutative unital $C^*$-algebras are a full subcategory of the operator-algebra family and are equivalent to compact Hausdorff spaces, so the two presentations carry the same information \cite{gelfand-duality}. A family may be generated from another under constructions, in the sense of \Cref{def:structural-family}. Both relations are structural statements about the families, and neither is a statement about the physical systems the families represent.

\section{The taxonomy as an interface}
\label{sec:interface}

Later volumes classify systems. The taxonomy is the place they record what they find, and the record format is fixed here so that results produced independently are comparable.

A classification record in a later volume has six fields: the family, the sector, the classifying invariant together with its range, the equivalence the invariant is complete for, the scope in which completeness holds, and the achievement kind of \Cref{def:kinds}. A record with an empty invariant field is a record of an absence and not a classification.

\begin{proposition}[Comparability of records]
\label{prop:comparable}
Two classification records are comparable when they agree on family, sector, and equivalence. If they agree on those three fields and both name classifying invariants, then the two invariants are related by a bijection between their attained values on that sector.
\end{proposition}

\begin{proof}
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
lean/lakefile.toml
lean/Cmrps.lean
lean/lake-manifest.json
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
lean/lean-toolchain

exec
/usr/local/bin/zsh -lc "rg --files --hidden --no-ignore lean -g '*Yoneda.lean' -g '*Alexandrov*.lean' -g '*Frobenius*.lean' -g '*Group/List/Basic.lean' -g '*Multiset/Prod.lean' -g '*Mathlib/Basic/Real/Basic.lean' -g '*Mathlib/Data/Real/Basic.lean' -g '*Mathlib/Logic/Equiv/Set.lean'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Yoneda.lean
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Triangulated/Yoneda.lean
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Bicategory/Yoneda.lean
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/ShrinkYoneda.lean
lean/.lake/packages/mathlib/Mathlib/Algebra/CharP/Frobenius.lean
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/Preserves/Yoneda.lean
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Monoidal/Cartesian/ShrinkYoneda.lean
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Abelian/Yoneda.lean
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/IndYoneda.lean
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/Types/Yoneda.lean
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/Yoneda.lean
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Linear/Yoneda.lean
lean/.lake/packages/mathlib/Mathlib/NumberTheory/FrobeniusNumber.lean
lean/.lake/packages/mathlib/Mathlib/Algebra/Category/MonCat/Yoneda.lean
lean/.lake/packages/mathlib/Mathlib/Algebra/Category/Grp/Yoneda.lean
lean/.lake/packages/mathlib/Mathlib/RingTheory/Coalgebra/IsFrobenius.lean
lean/.lake/packages/mathlib/Mathlib/RingTheory/Frobenius.lean
lean/.lake/packages/mathlib/Mathlib/RingTheory/WittVector/FrobeniusFractionField.lean
lean/.lake/packages/mathlib/Mathlib/RingTheory/WittVector/Frobenius.lean
lean/.lake/packages/mathlib/Mathlib/Topology/Sheaves/Alexandrov.lean
lean/.lake/packages/mathlib/Mathlib/Topology/AlexandrovDiscrete.lean
lean/.lake/packages/mathlib/Mathlib/Topology/Separation/AlexandrovDiscrete.lean
lean/.lake/packages/mathlib/Mathlib/Topology/Category/TopCat/Yoneda.lean

exec
/usr/local/bin/zsh -lc 'lake env lean Cmrps/Vol04YonedaClassification.lean' in /Users/mlong/Documents/Development/classification-physical-systems/lean
codex
I found several substantive mismatches: the undecidability model allows arbitrary functions as “procedures,” distinguishing is weaker than the paper’s definition, and the general limits theorem concerns the wrong functor. I’m now checking elaboration and the Mathlib APIs available under `lean/`.
exec
/usr/local/bin/zsh -lc 'for f in Cmrps/Vol01Foundations.lean Cmrps/Vol02StructuralFamilies.lean Cmrps/Vol03IrreducibilityDecomposition.lean Cmrps/Vol05ClassicalSystems.lean Cmrps/Vol06QuantumSystems.lean Cmrps/Vol07GaugeQft.lean Cmrps/Vol08SpacetimeReconstruction.lean Cmrps/Vol09GravityInformationGeometry.lean Cmrps/Vol10ObservationalEquivalence.lean Cmrps/Vol11CompletenessObstructions.lean Cmrps/Vol12PrincipiaPhysica.lean; do lake env lean "$f" || break; done' in /Users/mlong/Documents/Development/classification-physical-systems/lean
exec
/usr/local/bin/zsh -lc "rg -n 'yoneda_preservesLimits|preservesLimits.*yoneda|instance.*[Yy]oneda' lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/Yoneda.lean lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/Preserves/Yoneda.lean; rg -n 'mem_product|sum.*product|sum.*mul|of_eq|subtypeEquiv' lean/.lake/packages/mathlib/Mathlib/Data/Multiset/Bind.lean lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Ring/Multiset.lean lean/.lake/packages/mathlib/Mathlib/Logic/Equiv/Set.lean; rg -n 'map_list_sum|map_sum' lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/List/*.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 exited 1 in 0ms:
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/Preserves/Yoneda.lean:81:noncomputable instance {X : C} : PreservesColimit F (coyoneda.obj (op (yoneda.obj X))) := by
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/Yoneda.lean:59:instance (X : Cᵒᵖ) : HasColimit (coyoneda.obj X) :=
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/Yoneda.lean:91:instance yoneda_preservesLimit (F : J ⥤ Cᵒᵖ) (X : C) :
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/Yoneda.lean:103:noncomputable instance yoneda_preservesLimitsOfShape (X : C) :
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/Yoneda.lean:138:instance coyoneda_preservesLimit (F : J ⥤ C) (X : Cᵒᵖ) :
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/Yoneda.lean:147:noncomputable instance coyonedaPreservesLimitsOfShape (X : Cᵒᵖ) :
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/Yoneda.lean:174:instance yoneda_preservesLimits (X : C) :
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/Yoneda.lean:178:instance coyoneda_preservesLimits (X : Cᵒᵖ) :
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/Yoneda.lean:181:instance yonedaFunctor_preservesLimits :
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/Yoneda.lean:188:noncomputable instance coyonedaFunctor_preservesLimits :
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/Yoneda.lean:195:noncomputable instance yonedaFunctor_reflectsLimits :
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/Yoneda.lean:198:noncomputable instance coyonedaFunctor_reflectsLimits :
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/Yoneda.lean:201:instance uliftYonedaFunctor_preservesLimits :
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/Yoneda.lean:208:instance : PreservesLimitsOfSize.{t, w} (uliftCoyoneda.{w'} : Cᵒᵖ ⥤ _) := by
lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/Yoneda.lean:242:  rw [preservesLimitsOfSize_iff_of_natIso (F ⋙ uliftFunctor.{v}).uliftCoyonedaCoreprXIso.symm]
lean/.lake/packages/mathlib/Mathlib/Logic/Equiv/Set.lean:50:def equivOfEq (h : s = t) : s ≃ t := Equiv.subtypeEquivProp <| h ▸ rfl
lean/.lake/packages/mathlib/Mathlib/Logic/Equiv/Set.lean:393:    subtypeEquiv e fun _ =>
lean/.lake/packages/mathlib/Mathlib/Logic/Equiv/Set.lean:414:    · simp only [Set.sumCompl_symm_apply_of_notMem hx, Sum.map_inr, subtypeEquiv_apply,
lean/.lake/packages/mathlib/Mathlib/Logic/Equiv/Set.lean:418:      simp only [Sum.map_inr, subtypeEquiv_apply, Set.sumCompl_apply_inr, Function.comp_apply,
lean/.lake/packages/mathlib/Mathlib/Data/Multiset/Bind.lean:18:* `Multiset.join`: The join, aka union or sum, of multisets.
lean/.lake/packages/mathlib/Mathlib/Data/Multiset/Bind.lean:21:* `Multiset.sigma`: Disjoint sum of multisets in a sigma type.
lean/.lake/packages/mathlib/Mathlib/Data/Multiset/Bind.lean:341:@[simp] lemma mem_product : ∀ {p : α × β}, p ∈ s ×ˢ t ↔ p.1 ∈ s ∧ p.2 ∈ t
lean/.lake/packages/mathlib/Mathlib/Data/Multiset/Bind.lean:358:/-! ### Disjoint sum of multisets -/
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Ring/Multiset.lean:46:lemma sum_map_mul_left : sum (s.map fun i ↦ a * f i) = a * sum (s.map f) :=
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Ring/Multiset.lean:49:lemma sum_map_mul_right : sum (s.map fun i ↦ f i * a) = sum (s.map f) * a :=
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Ring/Multiset.lean:70:    simp [ih, map_bind, sum_map_mul_left, sum_map_mul_right]
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Ring/Multiset.lean:77:  · simp only [map_cons, prod_cons, ih, sum_map_mul_left.symm, add_mul, mul_left_comm (f a),

exec
/usr/local/bin/zsh -lc "sed -n '165,190p' lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Limits/Yoneda.lean; rg -n 'map_list_sum' lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group -g '*.lean'; rg -n 'IsUpperSet|upperSet|upper.*topology|specializ|ofUpper|upperSet' lean/.lake/packages/mathlib/Mathlib/Topology/AlexandrovDiscrete.lean lean/.lake/packages/mathlib/Mathlib/Topology/Order.lean; sed -n '561,578p' papers/latex/vol-02-structural-families.tex; sed -n '361,376p' papers/latex/vol-11-completeness-obstructions.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
    IsLimit c ≃ ∀ (X : Cᵒᵖ), IsLimit ((coyoneda.obj X).mapCone c) where
  toFun h _ := isLimitOfPreserves _ h
  invFun h := coyonedaJointlyReflectsLimits _ _ h
  left_inv _ := Subsingleton.elim _ _
  right_inv _ := by ext; apply Subsingleton.elim

end

/-- The yoneda embedding `yoneda.obj X : Cᵒᵖ ⥤ Type v` for `X : C` preserves limits. -/
instance yoneda_preservesLimits (X : C) :
    PreservesLimitsOfSize.{t, w} (yoneda.obj X) where

/-- The coyoneda embedding `coyoneda.obj X : C ⥤ Type v` for `X : Cᵒᵖ` preserves limits. -/
instance coyoneda_preservesLimits (X : Cᵒᵖ) :
    PreservesLimitsOfSize.{t, w} (coyoneda.obj X) where

instance yonedaFunctor_preservesLimits :
    PreservesLimitsOfSize.{t, w} (@yoneda C _) := by
  apply preservesLimits_of_evaluation
  intro K
  change PreservesLimitsOfSize (coyoneda.obj K)
  infer_instance

noncomputable instance coyonedaFunctor_preservesLimits :
    PreservesLimitsOfSize.{t, w} (@coyoneda C _) := by
  apply preservesLimits_of_evaluation
lean/.lake/packages/mathlib/Mathlib/Topology/AlexandrovDiscrete.lean:183:lemma isOpen_iff_forall_specializes : IsOpen s ↔ ∀ x y, x ⤳ y → y ∈ s → x ∈ s := by
lean/.lake/packages/mathlib/Mathlib/Topology/AlexandrovDiscrete.lean:184:  simp only [← nhdsKer_subset_iff_isOpen, Set.subset_def, mem_nhdsKer_iff_specializes, exists_imp,
lean/.lake/packages/mathlib/Mathlib/Topology/AlexandrovDiscrete.lean:196:    specialize hS s hs a has
Symmetric tensor categories with conjugates and compact supergroups & Reconstructable & Doplicher-Roberts reconstruction preserves the symmetric structure \cite{dr,dhr} \\
Plain tensor categories and the underlying finite group & Not reconstructable & No symmetric structure is preserved, and the group is lost \cite{etingof} \\
Classical and quantum monotone metrics, both in Family V & Not identical & Uniqueness holds classically and fails in the quantum case \cite{petz} \\
Symplectic and operator-algebra families & Open & Deformation quantization is a program and not an equivalence \\
\bottomrule
\end{tabularx}
\end{table}

\begin{definition}[Independence of families]
\label{def:independence}
Two structural families $\mathfrak{F}$ and $\mathfrak{G}$ are \emph{logically independent} when neither is a special case of the other and neither is reconstructable from the other: there is no full embedding of one into the other, and no correspondence of the kind in Table~\ref{tab:independence} that determines one from the other. Independence in this sense is a statement about the families as classes of records and not about any particular system.
\end{definition}

\begin{proposition}[Invariants do not imply independence]
\label{prop:independence}
Let $\mathfrak{F}$ and $\mathfrak{G}$ be two structural families each admitting a classifying invariant. Then $\mathfrak{F}$ and $\mathfrak{G}$ need not be logically independent. In particular the commutative unital $C^*$-algebras inside the operator-algebra family and the compact Hausdorff spaces inside the geometric family each carry a classifying invariant, and neither is independent of the other.
\end{proposition}


\subsection{Recognition reductions}

\begin{proposition}[Undecidability transport]
\label{prop:undec}
Let $Q$ be a recognition problem for a class $\mathcal{C}$, and suppose there is a computable map $\varphi$ from finite group presentations to objects of $\mathcal{C}$ and a Markov property $P$ of finitely presentable groups such that a presentation $G$ has $P$ if and only if $\varphi(G)$ satisfies $Q$. Then $Q$ is algorithmically undecidable.
\end{proposition}

\begin{proof}
A decision procedure for $Q$, composed with the computable map $\varphi$, decides $P$ on finite presentations. By the Adyan-Rabin theorem no such procedure exists for any Markov property \cite{adyan1955,rabin1958}. Hence none exists for $Q$.
\end{proof}

\Cref{prop:undec} is the shape of every undecidability entry in the register. Tancer's construction is an instance: the unrecognizability of the nine-fold connected sum of $S^2 \times S^2$ is proved through the Markov set construction carried into four-manifold topology \cite{tancer2023}. The proposition also explains why undecidability is a statement about the recognizer component of \Cref{def:program} and says nothing by itself about invariants or parameter spaces: an undecidable domain may still carry rich complete invariants that no algorithm can compute.

\subsection{Counterexample catalogue}
\label{sec:counterexamples}

exec
/usr/local/bin/zsh -lc "rg -n 'theorem.*map.*sum|lemma.*map.*sum' lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators -g '*.lean' | head -35; nl -ba lean/Cmrps/Vol10ObservationalEquivalence.lean | sed -n '321,365p'; nl -ba lean/Cmrps/Vol12PrincipiaPhysica.lean | sed -n '31,52p'; nl -ba lean/Cmrps/Vol11CompletenessObstructions.lean | sed -n '201,229p'; nl -ba lean/Cmrps/Vol04YonedaClassification.lean | sed -n '218,232p'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/RingEquiv.lean:27:protected theorem map_list_sum [NonUnitalNonAssocSemiring R] [NonUnitalNonAssocSemiring S]
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/RingEquiv.lean:39:protected theorem map_multiset_sum [NonUnitalNonAssocSemiring R] [NonUnitalNonAssocSemiring S]
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/RingEquiv.lean:47:protected theorem map_sum [NonUnitalNonAssocSemiring R] [NonUnitalNonAssocSemiring S] (g : R ≃+* S)
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Ring/Multiset.lean:46:lemma sum_map_mul_left : sum (s.map fun i ↦ a * f i) = a * sum (s.map f) :=
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Ring/Multiset.lean:49:lemma sum_map_mul_right : sum (s.map fun i ↦ f i * a) = sum (s.map f) * a :=
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Ring/Multiset.lean:67:lemma prod_map_sum {s : Multiset (Multiset R)} :
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Ring/List.lean:80:lemma sum_map_mul_left : (l.map fun b ↦ r * f b).sum = r * (l.map f).sum :=
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Ring/List.lean:83:lemma sum_map_mul_right : (l.map fun b ↦ f b * r).sum = (l.map f).sum * r :=
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/ModEq.lean:40:theorem listSum_map (h : ∀ x ∈ l, f x ≡ g x [MOD n]) : (l.map f).sum ≡ (l.map g).sum [MOD n] := by
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/ModEq.lean:43:theorem listSum_map_zero (h : ∀ x ∈ l, f x ≡ 0 [MOD n]) : (l.map f).sum ≡ 0 [MOD n] := by
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/ModEq.lean:133:theorem listSum_map (h : ∀ x ∈ l, f x ≡ g x [ZMOD n]) : (l.map f).sum ≡ (l.map g).sum [ZMOD n] := by
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/ModEq.lean:136:theorem listSum_map_zero (h : ∀ x ∈ l, f x ≡ 0 [ZMOD n]) : (l.map f).sum ≡ 0 [ZMOD n] := by
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Ring/Finset.lean:324:lemma cast_list_sum [AddMonoidWithOne R] (s : List ℕ) : (↑s.sum : R) = (s.map (↑)).sum :=
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Ring/Finset.lean:363:lemma cast_list_sum [AddGroupWithOne R] (s : List ℤ) : (↑s.sum : R) = (s.map (↑)).sum :=
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Finsupp/Basic.lean:532:theorem multiset_map_sum [Zero M] {f : α →₀ M} {m : β → γ} {h : α → M → Multiset β} :
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/GroupWithZero/Action.lean:35:theorem List.smul_sum {r : M} {l : List N} : r • l.sum = (l.map (r • ·)).sum :=
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/GroupWithZero/Action.lean:53:theorem Multiset.smul_sum {s : Multiset N} : r • s.sum = (s.map (r • ·)).sum :=
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/List/Basic.lean:448:lemma sum_nat_mod (l : List ℕ) (n : ℕ) : l.sum % n = (l.map (· % n)).sum % n := by
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/List/Basic.lean:460:lemma sum_int_mod (l : List ℤ) (n : ℤ) : l.sum % n = (l.map (· % n)).sum % n := by
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/Multiset/Basic.lean:206:theorem sum_map_singleton (s : Multiset M) : (s.map fun a => ({a} : Multiset M)).sum = s :=
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/Multiset/Basic.lean:209:theorem sum_nat_mod (s : Multiset ℕ) (n : ℕ) : s.sum % n = (s.map (· % n)).sum % n := by
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/Multiset/Basic.lean:215:theorem sum_int_mod (s : Multiset ℤ) (n : ℤ) : s.sum % n = (s.map (· % n)).sum % n := by
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:650:@[simp] lemma op_sum (f : ι → M) : op (∑ x ∈ s, f x) = ∑ x ∈ s, op (f x) := map_sum opAddEquiv ..
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:847:theorem ofMul_list_prod (s : List M) : ofMul s.prod = (s.map ofMul).sum := by simp [ofMul]; rfl
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:866:theorem toAdd_list_sum (s : List (Multiplicative M)) : s.prod.toAdd = (s.map toAdd).sum := by
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:877:theorem ofMul_multiset_prod (s : Multiset M) : ofMul s.prod = (s.map ofMul).sum := by
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
   340	/-- Petz self-reciprocity: `f(x) = x f(x⁻¹)`. -/
   341	def SelfReciprocal (f : ℚ → ℚ) : Prop := ∀ x : ℚ, x ≠ 0 → f x = x * f x⁻¹
   342	
   343	/-- The Petz transpose `f^#(x) = x f(x⁻¹)`. -/
   344	def petzTranspose (f : ℚ → ℚ) (x : ℚ) : ℚ := x * f x⁻¹
   345	
   346	/-- Theorem 5.2 (`petz_sudar_parametricity`), statement skeleton (unproved; literature):
   347	quantum monotone metrics correspond to operator monotone `f` with `f(1) = 1` and
   348	`f(x) = x f(x⁻¹)`, and distinct such `f` give distinct metrics on self-adjoint
   349	directions. Operator monotonicity is external to this skeleton and is left as a
   350	parameter. -/
   351	def petz_sudar_parametricity {n : ℕ}
   352	    (monotone : ((Fin n → ℚ) → (Fin n → Fin n → ℚ) → ℚ) → Prop) : Prop :=
   353	  (∀ f : ℚ → ℚ, NormalizedAtOne f → SelfReciprocal f →
   354	      monotone (fun lam A => mcQuadratic f lam A)) ∧
   355	    (∀ m, monotone m → ∃ f : ℚ → ℚ, NormalizedAtOne f ∧ SelfReciprocal f ∧
   356	      ∀ lam : Fin n → ℚ, ∀ A : Fin n → Fin n → ℚ, m lam A = mcQuadratic f lam A) ∧
   357	    (∀ f g : ℚ → ℚ, SelfReciprocal f → SelfReciprocal g → f ≠ g →
   358	      ∃ lam : Fin n → ℚ, ∃ A : Fin n → Fin n → ℚ, mcQuadratic f lam A ≠ mcQuadratic g lam A)
   359	
   360	/-- Theorem 5.2, proof ingredient: the Petz transpose `f^#` yields the same quadratic
   361	form as `f` on symmetric (self-adjoint) directions, which is why self-reciprocity
   362	`f = f^#` is the correct normalization. -/
   363	theorem petz_transpose_same_form {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ)
   364	    (hpos : ∀ i, 0 < lam i) (A : Fin n → Fin n → ℚ) (hsymm : ∀ i j, A i j = A j i) :
   365	    mcQuadratic f lam A = mcQuadratic (petzTranspose f) lam A := by
    31	  realize : M → P
    32	  /-- The selection map `E : P → Eobs`. -/
    33	  select : P → Eobs
    34	
    35	/-- The separation clause of Definition 2.5: the selection map is not computed by the
    36	classification map, i.e. no map factors through another layer. -/
    37	def NotFactoring {M P Obs : Type} (cls : P → M) (select : P → Obs) : Prop :=
    38	  ¬ ∀ a b : P, (select a = select b ↔ cls a = cls b)
    39	
    40	/-- Section 3, non-collapse argument: if two theories are mathematically distinct but
    41	empirically equivalent, then the observational equivalence cannot be computed from the
    42	classification map. -/
    43	theorem SelectionNotComputedByClassification
    44	    {M P Obs : Type} (cls : P → M) (select : P → Obs)
    45	    (T₁ T₂ : P) (hmath : cls T₁ ≠ cls T₂) (hobs : select T₁ = select T₂) :
    46	    NotFactoring cls select := by
    47	  intro h
    48	  exact hmath ((h T₁ T₂).1 hobs)
    49	
    50	/-! ## Target 2 — `EvidenceGradeAssignment` (Definition 2.6, Table 2) -/
    51	
    52	/-- Definition 2.6: formulation, rigorous theorem, physical validation. -/
   201	/-! ## Undecidability transport (paper, Proposition 5.5) -/
   202	
   203	/-- Paper, Proposition 5.5: a recognition problem `Q` is decidable when there is
   204	a procedure `d` with `d x = true ↔ Q x`. -/
   205	def DecidableProblem {κ : Type u} (Q : κ → Prop) : Prop :=
   206	  ∃ d : κ → Bool, ∀ x, d x = true ↔ Q x
   207	
   208	/-- Paper, Proposition 5.5 (Undecidability transport): a recognition problem
   209	many-one reducible from an undecidable property of finitely presentable groups
   210	is itself undecidable. `hmarkov` is the Adyan-Rabin theorem taken as hypothesis
   211	(hence the `conditional` status of this claim): every Markov property of
   212	finitely presentable groups is algorithmically undecidable. The paper requires
   213	the reduction map `φ` to be computable so that the composed procedure is
   214	algorithmic; the extensional form above is the content of the reduction
   215	argument. -/
   216	theorem UndecidabilityTransport
   217	    {G : Type u} {κ : Type w} {P : G → Prop} {Q : κ → Prop} {φ : G → κ}
   218	    (hred : ∀ g, P g ↔ Q (φ g))
   219	    (hmarkov : ¬ DecidableProblem P) : ¬ DecidableProblem Q := by
   220	  intro hq
   221	  change ∃ d : κ → Bool, ∀ x, d x = true ↔ Q x at hq
   222	  cases hq with
   223	  | intro d hd =>
   224	    refine hmarkov ?_
   225	    change ∃ e : G → Bool, ∀ g, e g = true ↔ P g
   226	    exact ⟨fun g => d (φ g), fun g =>
   227	      ⟨fun h => (hred g).2 ((hd (φ g)).1 h),
   228	       fun h => (hd (φ g)).2 ((hred g).1 h)⟩⟩
   229	
   218	
   219	/-- Paper Proposition 3.7: `y` preserves terminal objects. -/
   220	noncomputable def profile_terminal_iso [HasTerminal C] :
   221	    relationalProfile (⊤_ C) ≅ ⊤_ (Cᵒᵖ ⥤ Type v) :=
   222	  PreservesTerminal.iso (G := CategoryTheory.yoneda (C := C))
   223	
   224	end Limits
   225	
   226	/-! ## Choi correspondence (paper Proposition 4.1 and Equation (1)) -/
   227	
   228	section Choi
   229	
   230	open Matrix
   231	
   232	/-- `M_n`, the `n × n` complex matrices (paper: `M_n`). -/

exec
/usr/local/bin/zsh -lc "rg -n 'map_prod|map_sum|list_prod|list_sum' lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/List/Defs.lean; nl -ba lean/Cmrps/Vol04YonedaClassification.lean | sed -n '203,219p'; nl -ba lean/Cmrps/Vol02StructuralFamilies.lean | sed -n '280,298p'; nl -ba lean/Cmrps/Vol02StructuralFamilies.lean | sed -n '731,746p'; nl -ba papers/latex/vol-12-principia-physica.tex | sed -n '337,354p'; rg -n 'def count|count_perm|perm_iff_count' lean/.lake/packages/mathlib/Mathlib/Data/List/Perm/*.lean lean/.lake/packages/mathlib/Mathlib/Data/List/Count.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   203	/-! ## Profiles respect limits (paper Proposition 3.7) -/
   204	
   205	section Limits
   206	
   207	variable {C : Type u} [Category.{v} C]
   208	
   209	/-- Paper Proposition 3.7: `y` preserves limits that exist in `C`. -/
   210	theorem profile_limit_preservation (P : C) :
   211	    PreservesLimitsOfSize.{t, w} (relationalProfile P) :=
   212	  CategoryTheory.yoneda_preservesLimits P
   213	
   214	/-- Paper Proposition 3.7: `y(A ⨯ B) ≅ y(A) ⨯ y(B)` whenever the product exists. -/
   215	noncomputable def profile_prod_iso (A B : C) [HasBinaryProduct A B] :
   216	    relationalProfile (A ⨯ B) ≅ relationalProfile A ⨯ relationalProfile B :=
   217	  PreservesLimitPair.iso CategoryTheory.yoneda A B
   218	
   219	/-- Paper Proposition 3.7: `y` preserves terminal objects. -/
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
   731	/-! ## Comparability of records (paper Proposition 18.1) -/
   732	
   733	section Comparability
   734	
   735	/-- Subtype equivalence along an equality of sets. -/
   736	def subtypeEquivOfEq {γ : Type*} {s t : Set γ} (h : s = t) : ↥s ≃ ↥t where
   737	  toFun p := ⟨p.1, h ▸ p.2⟩
   738	  invFun p := ⟨p.1, h.symm ▸ p.2⟩
   739	  left_inv := fun p => Subtype.ext rfl
   740	  right_inv := fun p => Subtype.ext rfl
   741	
   742	/-- Paper Proposition 18.1: two classification records that agree on family, sector, and
   743	equivalence (same objects, same physical equivalence) and that both name classifying
   744	invariants have invariants related by a bijection between their attained values. -/
   745	theorem comparability_of_records {Obj : Type u} {r : Obj → Obj → Prop} (hr : Equivalence r)
   746	    {V₁ : Type v} {I₁ : Obj → V₁}
   337	
   338	The honest summary of the realization layer is therefore asymmetric. Reconstruction from probes is strong where the probes are algebraic or categorical. Reconstruction of interacting dynamics and of spacetime itself from primitive data remains open.
   339	
   340	\section{The empirical layer}
   341	\label{sec:empirical}
   342	
   343	The empirical layer $\mathcal{E}$ is where mathematical classification stops and observational selection begins.
   344	
   345	\begin{theorem}[Survey: classical uniqueness and quantum parametricity, assembled from Chentsov and Petz-Sudar]
   346	\label{thm:monotone}
   347	The Fisher metric is the unique Riemannian metric, up to constant factor, that is monotone under stochastic maps. Quantum monotone metrics are classified by operator monotone functions, a parametric family containing more than one element. Classical uniqueness therefore does not extend to the quantum case, and any quantum distinguishability criterion must either select within the parametric family and justify the selection or carry the family as data.
   348	\end{theorem}
   349	
   350	\begin{proof}
   351	The first statement is Chentsov's theorem \cite{corpus-52}. The second is the Petz-Sudar classification \cite{corpus-52}. The parameterizing class of operator monotone functions contains more than one element; for instance the identity function and the affine function $f(x) = (x+1)/2$ are both operator monotone and give different metrics. The uniqueness statement is therefore false in the quantum case, and the last clause follows: a criterion that names a single quantum monotone metric makes an additional choice beyond the classification theorem.
   352	\end{proof}
   353	
   354	\Cref{thm:monotone} fixes what empirical distinguishability can borrow from information geometry. In the classical case the statistical distance is canonical. In the quantum case the statistical distance is a choice inside a proved parameterization, so an observational equivalence relation built on such distances must state the choice.
lean/.lake/packages/mathlib/Mathlib/Data/List/Perm/Basic.lean:217:  rw [perm_iff_count, ← Decidable.and_forall_ne a, ← Decidable.and_forall_ne b]
lean/.lake/packages/mathlib/Mathlib/Data/List/Perm/Lattice.lean:50:  perm_iff_count.mpr fun _ ↦ (by simp [List.count_bagInter, Nat.min_comm])
lean/.lake/packages/mathlib/Mathlib/Data/List/Perm/Subperm.lean:35:lemma subperm_iff_count [DecidableEq α] : l₁ <+~ l₂ ↔ ∀ a, count a l₁ ≤ count a l₂ :=

 succeeded in 51393ms:
exec
/usr/local/bin/zsh -lc "python3 -c 'from pathlib import Path
import re
for n in (\"01\",\"03\",\"05\",\"06\",\"07\",\"09\"):
 p=next(Path(\"papers/latex\").glob(\"vol-\"+n+\"-*.tex\"))
 s=p.read_text()
 for m in re.finditer(r\"\\\\begin\\{(definition|theorem|lemma|proposition|corollary|example)\\}.*?\\\\end\\{\\1\\}\", s, re.S):
  print(str(p)+\":\"+str(s.count(chr(10),0,m.start())+1)+\": \"+m.group())'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 28ms:
papers/latex/vol-01-foundations.tex:113: \begin{definition}[System record]
\label{def:record}
A system record is a tuple
\[
P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})
\]
with the following components. The component $X$ is the state space or geometric structure of $P$. The component $\mathcal{O}$ is the algebra or collection of observables of $P$. The component $\mathcal{D}$ holds the evolution laws of $P$, given as Hamiltonian or vector-field data, an operator semigroup, a flow, or an evolution functor. The component $\mathcal{S}$ holds the symmetry and constraint data of $P$, the group or groupoid actions, gauge constraints, and constraint surfaces. The component $\mathcal{C}$ declares how $P$ is to be combined with other systems, through tensor products, coupling terms, or interfacing rules.
\end{definition}
papers/latex/vol-01-foundations.tex:154: \begin{example}[Classical Hamiltonian record]
\label{ex:hamiltonian}
Let $X$ be a symplectic manifold, let $\mathcal{O} = C^\infty(X)$, let $\mathcal{D}$ be the Hamiltonian flow of a chosen Hamiltonian $H \in C^\infty(X)$, let $\mathcal{S}$ be the group of symplectomorphisms preserving $H$, and let $\mathcal{C}$ be the product of symplectic manifolds with coupled Hamiltonians. Poisson manifolds give the wider family, whose local models are supplied by Weinstein splitting \cite{weinstein1983}.
\end{example}
papers/latex/vol-01-foundations.tex:159: \begin{example}[Quantum record]
\label{ex:quantum}
Let $X$ be a Hilbert space, let $\mathcal{O} = B(X)$ or a $C^*$-subalgebra of it, let $\mathcal{D}$ be a strongly continuous one-parameter unitary group or a semigroup of completely positive maps, let $\mathcal{S}$ be the unitary group commuting with $\mathcal{D}$, and let $\mathcal{C}$ be the Hilbert-space tensor product with tensor-product dynamics.
\end{example}
papers/latex/vol-01-foundations.tex:164: \begin{example}[Lattice record]
\label{ex:lattice}
Let $X$ be the set of vertices of a finite lattice, let $\mathcal{O}$ be the algebra of functions on $X$ generated by local gauge-invariant operators, let $\mathcal{D}$ be the update rule of a lattice gauge model, let $\mathcal{S}$ be the local gauge group acting on the links, and let $\mathcal{C}$ be the gluing of lattices along shared boundaries. Lattice models of gauge theory are the class where restricted theorems of the series have proved attainable and where the continuum limit remains a limiting procedure in the sense of Definition~\ref{def:morphism-kind}.
\end{example}
papers/latex/vol-01-foundations.tex:171: \begin{definition}[Finite classical record]
\label{def:finite-classical}
Let $\mathrm{Phys}_{\mathrm{fin}}$ be the class of records $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ with $X$ a finite set, $\mathcal{O} = \mathbb{R}^{X}$ the algebra of all real functions on $X$, $\mathcal{D}$ the identity dynamics, $\mathcal{S}$ the trivial symmetry group, and $\mathcal{C}$ the disjoint union of state spaces. The empty record is admitted and is the neutral record for disjoint union, the $\mathbf{1}_{\mathcal{C}}$ of Definition~\ref{def:irreducible}. The set $X$ ranges over finite sets in a fixed countable universe, so the class is a set rather than a proper class, and isomorphic records with different underlying sets are identified in the quotient of Theorem~\ref{thm:finite-state-classification}.
\end{definition}
papers/latex/vol-01-foundations.tex:176: \begin{definition}[Finite dynamical record]
\label{def:finite-dynamical}
Let $\mathrm{Phys}_{\mathrm{dyn}}$ be the class of records $P = (X, \mathcal{O}, f, \mathcal{S}, \mathcal{C})$ with $X$ a finite set, $\mathcal{O} = \mathbb{R}^{X}$, dynamics given by a self-map $f \colon X \to X$ of discrete time, $\mathcal{S}$ trivial, and $\mathcal{C}$ the disjoint union of state spaces with the map that acts componentwise. The empty record is admitted and is the neutral record for disjoint union. An invariant subsystem of $P$ is a nonempty subset $Y \subseteq X$ with $f(Y) \subseteq Y$, carrying the restricted record.
\end{definition}
papers/latex/vol-01-foundations.tex:181: \begin{definition}[Bipartite qubit record]
\label{def:qubit}
Let $\mathrm{Phys}_{\mathrm{qub}}$ be the class of records with $X = \mathbb{C}^2 \otimes \mathbb{C}^2$ carrying a chosen factorization of the four-dimensional space into two qubit factors, $\mathcal{O} = B(X)$, $\mathcal{D}$ the identity, $\mathcal{S}$ the group $U(2) \times U(2)$ of local unitaries, and $\mathcal{C}$ the tensor product of factors. The factorization is part of the record, and Section~\ref{sec:irreducibility} shows what fails when it is left out.
\end{definition}
papers/latex/vol-01-foundations.tex:193: \begin{definition}[Morphism kind]
\label{def:morphism-kind}
A morphism of records is declared in exactly one of five kinds. A \emph{coarse-graining} forgets microscopic detail while preserving macroscopic observables. An \emph{equivalence morphism} is invertible and represents exact equivalence of representations. An \emph{embedding} realizes $P_1$ as a subsystem, subtheory, or substructure of $P_2$. A \emph{duality} is a contravariant equivalence between two record presentations: invertible as a correspondence between distinct presentations rather than as an arrow of one category. A \emph{limiting procedure} arises from a limit or colimit process, and the named processes of the program are the thermodynamic limit, the infinite-volume limit, the semiclassical limit, and the continuum limit.
\end{definition}
papers/latex/vol-01-foundations.tex:198: \begin{definition}[Preservation law]
\label{def:preservation-law}
A \emph{morphism of records} $g \colon P_1 \to P_2$ is a tuple $(g_X, g_{\mathcal{O}}, g_{\mathcal{D}}, g_{\mathcal{S}}, g_{\mathcal{C}})$ of maps in the ambient categories of the five components, with $g_X \colon X_1 \to X_2$, with $g_{\mathcal{O}} \colon \mathcal{O}_2 \to \mathcal{O}_1$ contravariant on observables, and with the remaining components transported compatibly with their declared structure; on records carrying dynamics the tuple intertwines the dynamics. Morphisms of records compose componentwise. On point-set records whose observables are functions on the state space, the tuple is determined by the state map through precomposition, and the laws of Definition~\ref{def:concrete-laws} are stated in that specialization. A preservation law for a morphism kind assigns to each declared morphism of that kind explicit conditions on the tuple, and a composition rule stating which kind, if any, the composite of two declared morphisms belongs to. A morphism is admissible when its declared preservation law is stated. The morphism schema is the collection of all admissible morphisms over all kinds.
\end{definition}
papers/latex/vol-01-foundations.tex:205: \begin{definition}[Concrete preservation laws]
\label{def:concrete-laws}
\begin{enumerate}
\item \emph{Coarse-graining.} The state map $\hat g \colon X_1 \to X_2$ is surjective, and every observable of $\mathcal{O}_2$ pulls back along $\hat g$ to an observable of $\mathcal{O}_1$. Surjectivity records that every macro-state of $P_2$ is realized by a micro-state of $P_1$.
\item \emph{Embedding.} The state map is injective, every observable of $\mathcal{O}_1$ extends to an observable of $\mathcal{O}_2$ on the embedded states, and the dynamics of $P_1$ is the restriction of the dynamics of $P_2$ to the embedded subsystem.
\item \emph{Equivalence morphism.} The state map is a bijection and carries $\mathcal{O}$, $\mathcal{D}$, $\mathcal{S}$, and $\mathcal{C}$ across, so the map is invertible and its inverse satisfies the same conditions.
\item \emph{Duality.} The declared morphism is the underlying map of a contravariant equivalence between two record presentations. The law names the two presentations, the direction of the correspondence, and the layers of structure preserved in the sense of Definition~\ref{def:preserved-structure}. Invertibility in an opposite category adds nothing to invertibility, since the isomorphisms of a category and of its opposite coincide; the content of the law is the pairing of presentations and the naming of preserved layers.
\item \emph{Limiting procedure.} The declared morphism is the leg map of a cone or cocone of a diagram of records under one of the four named limit processes, and the law carries the diagram data. The diagram is indexed by a directed parameter with no terminal object, a family growing without bound or a parameter approaching a limiting value. A map between two fixed finite records is never a limiting procedure of this kind.
\end{enumerate}
\end{definition}
papers/latex/vol-01-foundations.tex:240: \begin{proposition}[Composition is not typed]
\label{prop:composition-not-typed}
There are records $P_1, P_2, P_3$ and morphisms $e \colon P_1 \to P_2$ of embedding kind and $g \colon P_2 \to P_3$ of coarse-graining kind whose composite satisfies none of the five preservation laws of Definition~\ref{def:concrete-laws}.
\end{proposition}
papers/latex/vol-01-foundations.tex:249: \begin{corollary}[Schema, not category]
\label{cor:schema-not-category}
The morphism schema of Definition~\ref{def:preservation-law} is not a category. Turning it into one requires one of three decisions: enlarge the kind vocabulary so that composites are retyped, restrict admissible morphisms to those whose composites stay inside the list, or replace the single collection by a multi-category whose composition is typed in each slot. Whether one category suffices is the question these three decisions address.
\end{corollary}
papers/latex/vol-01-foundations.tex:258: \begin{proposition}[Self-composition within a kind]
\label{prop:self-composition}
Coarse-grainings compose to coarse-grainings, embeddings compose to embeddings, and equivalence morphisms compose to equivalence morphisms, under the laws of Definition~\ref{def:concrete-laws}.
\end{proposition}
papers/latex/vol-01-foundations.tex:274: \begin{definition}[Mathematical equivalence]
\label{def:math-equiv}
Two records $P_1$ and $P_2$ are mathematically equivalent, written $P_1 \cong P_2$, when there is a bijection of state spaces carrying $\mathcal{O}$, $\mathcal{D}$, $\mathcal{S}$, and $\mathcal{C}$ across in the ambient category of each component. Mathematical equivalence is isomorphism of records.
\end{definition}
papers/latex/vol-01-foundations.tex:279: \begin{definition}[Physical equivalence]
\label{def:phys-equiv}
Physical equivalence $\simeq$ is a chosen equivalence relation on records, declared per class of systems, that identifies representations describing the same physical system. Two mathematical descriptions may be physically equivalent without being mathematically isomorphic.
\end{definition}
papers/latex/vol-01-foundations.tex:286: \begin{definition}[Preserved-structure record]
\label{def:preserved-structure}
An identification of two records must name the layers of structure it preserves. The layers are the symmetric monoidal layer, the monoidal layer without symmetry, the braided layer, the plain tensor layer, the *-structure of operator-algebraic data, the algebraic structure, the topological structure, complete positivity of channels, and the unitary freedom of dilations. An identification that names no preserved layer is not admissible.
\end{definition}
papers/latex/vol-01-foundations.tex:300: \begin{definition}[Three layers]
\label{def:three-layers}
The program separates three layers of achievement. The mathematical layer classifies admissible structures up to the chosen equivalence. The realization layer assigns to classified structures physical systems. The selection layer assigns to physical systems the observational constraints or predictions that experiments bear on. A complete solution of the first layer would not by itself solve the second or the third.
\end{definition}
papers/latex/vol-01-foundations.tex:317: \begin{definition}[Admissible record]
\label{def:admissibility}
A record $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ is admissible when it satisfies the following four conditions.
\begin{enumerate}[label=AC-\arabic*.,widest=AC-6.,leftmargin=*]
\item \emph{Total record.} All five components are defined, and each is an object of a stated ambient category.
\item \emph{Observable closure.} The collection $\mathcal{O}$ is closed under the operations of its ambient algebra.
\item \emph{Well-posed dynamics.} The dynamics $\mathcal{D}$ acts on the whole state space or observable collection, as a flow, a semigroup action, or an evolution functor.
\item \emph{Symmetry compatibility.} The symmetries and constraints $\mathcal{S}$ act on $X$ preserving the declared structure, and $\mathcal{O}$ is invariant or equivariant under that action.
\end{enumerate}
\end{definition}
papers/latex/vol-01-foundations.tex:328: \begin{definition}[Admissible class specification]
\label{def:admissible-spec}
A class specification $(\mathcal{K}, \mathrm{Mor}_{\mathcal{K}}, \simeq_{\mathcal{K}})$ is admissible when its records satisfy Definition~\ref{def:admissibility} and the specification itself satisfies the following two conditions.
\begin{enumerate}[label=AC-\arabic*.,widest=AC-6.,leftmargin=*,start=5]
\item \emph{Composition closure.} The class $\mathcal{K}$ is closed under the construction of $\mathcal{C}$ wherever that construction is defined, and the composition rule declares its domain of composability as part of $\mathcal{C}$.
\item \emph{Declared equivalence.} The specification states which equivalence relation of Definition~\ref{def:phys-equiv} is in force and which preservation laws of Definition~\ref{def:concrete-laws} its morphisms obey.
\end{enumerate}
\end{definition}
papers/latex/vol-01-foundations.tex:337: \begin{definition}[Admissible subcategory]
\label{def:phys-adm}
Let $\mathrm{Phys}_{\mathrm{adm}}$ be the class of records satisfying Definition~\ref{def:admissibility}, inside a class specification satisfying Definition~\ref{def:admissible-spec}. Statements about morphisms are made in one of the categories $\mathrm{Phys}^{K}_{\mathrm{adm}}$, whose objects are the records of $\mathrm{Phys}_{\mathrm{adm}}$ and whose morphisms are those of a single kind $K$ closed under self-composition, together with the identities; Proposition~\ref{prop:schema-category} supplies these categories. The five-kind schema is not one category, by Proposition~\ref{prop:composition-not-typed}, and a morphism statement that crosses kinds has no ambient category until one of the resolutions of Corollary~\ref{cor:schema-not-category} is adopted.
\end{definition}
papers/latex/vol-01-foundations.tex:363: \begin{proposition}[Admissible morphisms form a category]
\label{prop:schema-category}
Fix a morphism kind whose preservation law contains the identities and is closed under self-composition, and take the admissible morphisms to be those of the chosen kind. Then the admissible records of Definition~\ref{def:phys-adm} together with these morphisms form a category. For the laws of Definition~\ref{def:concrete-laws} the coarse-graining kind, the embedding kind, and the equivalence kind qualify, by Proposition~\ref{prop:self-composition}.
\end{proposition}
papers/latex/vol-01-foundations.tex:372: \begin{proposition}[Conditionality over admissible systems]
\label{prop:conditional}
Every statement quantified over $\mathrm{Phys}_{\mathrm{adm}}$ is stated relative to the chosen admissibility conditions and preservation laws. Removing a condition enlarges the class and can falsify statements that hold for the smaller class.
\end{proposition}
papers/latex/vol-01-foundations.tex:390: \begin{definition}[Irreducibility]
\label{def:irreducible}
Fix a composition rule $\mathcal{C}$ and write $\mathbf{1}_{\mathcal{C}}$ for its neutral record, the unit of $\mathcal{C}$ when one exists. A record $P$ is irreducible relative to $\mathcal{C}$ when $P$ is not isomorphic to $\mathbf{1}_{\mathcal{C}}$ and admits no decomposition $P \cong \mathcal{F}(P_1, P_2)$ with $\mathcal{F}$ the composition construction of $\mathcal{C}$ and neither $P_1$ nor $P_2$ isomorphic to $\mathbf{1}_{\mathcal{C}}$. The class of irreducibles is $\mathfrak{J}_{\mathcal{C}}$.
\end{definition}
papers/latex/vol-01-foundations.tex:395: \begin{definition}[Decomposition]
\label{def:decomposition}
A decomposition of $P$ is an expression $P \cong \mathcal{F}(I_1, \dots, I_n)$ with each $I_i$ in $\mathfrak{J}_{\mathcal{C}}$ and $\mathcal{F}$ an admissible construction. The unit record is the empty decomposition. Uniqueness of decomposition holds in the restricted subclasses below and is not claimed in general.
\end{definition}
papers/latex/vol-01-foundations.tex:400: \begin{definition}[Closure]
\label{def:closure}
For a collection $\mathfrak{F}$ of records and a set $\mathfrak{C}$ of admissible constructions, the closure $\langle \mathfrak{F} \rangle_{\mathfrak{C}}$ is the smallest class of records containing $\mathfrak{F}$ and closed under the constructions of $\mathfrak{C}$. The symbol $\mathcal{C}$ stays reserved for the composition coordinate of an individual record, and the set $\mathfrak{C}$ is program-level data.
\end{definition}
papers/latex/vol-01-foundations.tex:409: \begin{example}[Irreducibles under disjoint union]
\label{ex:union-irreducibles}
In $\mathrm{Phys}_{\mathrm{fin}}$ with $\mathcal{C}$ the disjoint union of state spaces, the neutral record is the empty record, and Definition~\ref{def:irreducible} excludes it from the irreducibles. The irreducibles are exactly the one-point records. A record with more than one point splits as $X = \{x\} \cup (X \setminus \{x\})$ into two nonempty records, and a one-point record admits no split into two nonempty parts.
\end{example}
papers/latex/vol-01-foundations.tex:414: \begin{example}[Irreducibles under product]
\label{ex:product-irreducibles}
Take the same records with $\mathcal{C}$ the cartesian product of state spaces and product composition rules. The neutral record is the one-point record, and it is the empty product. The irreducibles are the records of prime cardinality. A record of cardinality $n$ decomposes as a product of records of prime cardinality, and the multiset of prime factors is unique up to order by unique prime factorization.
\end{example}
papers/latex/vol-01-foundations.tex:423: \begin{proposition}[Factorization is extra data]
\label{prop:factorization-nonunique}
For any four-dimensional complex Hilbert space $H$ there exist two factorizations $H \cong \mathbb{C}^2 \otimes \mathbb{C}^2$ and a unit vector $\psi \in H$ whose entanglement entropy is $0$ in one factorization and $\log 2$ in the other. The bare record $(H, B(H), \mathrm{id}_H, U(H))$ does not determine the decomposition of $H$ into factors.
\end{proposition}
papers/latex/vol-01-foundations.tex:441: \begin{theorem}[Finite classical classification]
\label{thm:finite-state-classification}
Let $P$ and $Q$ be records of $\mathrm{Phys}_{\mathrm{fin}}$ with state spaces of cardinality $m$ and $n$, with composition rule the disjoint union, and with mathematical equivalence as the declared equivalence relation. Then:
\begin{enumerate}
\item $P$ is irreducible if and only if $m = 1$;
\item $P$ decomposes as a disjoint union of $m$ one-point records, and this decomposition is unique up to order and isomorphism of factors;
\item $P \cong Q$ if and only if $m = n$;
\item the cardinality $|X|$ is a complete invariant, and the quotient $\mathrm{Ob}(\mathrm{Phys}_{\mathrm{fin}})/\cong$ is in bijection with the nonnegative integers, the empty record corresponding to zero.
\end{enumerate}
\end{theorem}
papers/latex/vol-01-foundations.tex:458: \begin{theorem}[Finite dynamical decomposition]
\label{thm:dynamical-decomposition}
Let $P$ be a record of $\mathrm{Phys}_{\mathrm{dyn}}$ with state space $X$ and dynamics $f \colon X \to X$, and call two states adjacent when one is the image of the other under $f$. Then:
\begin{enumerate}
\item $P$ is irreducible if and only if the functional graph of $f$ is weakly connected;
\item $P$ decomposes as the disjoint union of the records on its connected components, and this decomposition is unique up to order and isomorphism of factors;
\item $P \cong Q$ if and only if the multisets of connected-component isomorphism classes of $P$ and $Q$ agree.
\end{enumerate}
\end{theorem}
papers/latex/vol-01-foundations.tex:480: \begin{theorem}[Generation in the restricted classes]
\label{thm:generation}
Let $P$ be a record of one of the two restricted classes.
\begin{enumerate}
\item If $P$ is in $\mathrm{Phys}_{\mathrm{fin}}$, then $P$ is a disjoint union of one-point records, and under the product rule $P$ is a product of prime-cardinality records.
\item If $P$ is in $\mathrm{Phys}_{\mathrm{dyn}}$, then $P$ is a disjoint union of records on weakly connected functional graphs.
\item In both cases the generation is effective: the irreducible factors are computed from the state space and the dynamics by finite enumeration.
\end{enumerate}
\end{theorem}
papers/latex/vol-01-foundations.tex:498: \begin{theorem}[Finite symmetric classification]
\label{thm:symmetric-classification}
Fix a finite group $G$, and let $\mathrm{Phys}^{G}_{\mathrm{fin}}$ be the records of $\mathrm{Phys}_{\mathrm{fin}}$ with $\mathcal{S} = G$ acting on $X$ by permutations, with $\mathcal{O} = \mathbb{R}^{X}$ carrying the induced action, and with $\mathcal{C}$ the disjoint union of $G$-sets. Then:
\begin{enumerate}
\item $P$ is irreducible if and only if the action of $G$ on $X$ is transitive;
\item $P$ decomposes as the disjoint union of its orbit records, and this decomposition is unique up to order and isomorphism of factors;
\item $P \cong Q$ if and only if for every conjugacy class of subgroups of $G$ the number of orbits with stabilizer in that class agrees;
\item the resulting orbit-counting function is a complete invariant with finite range.
\end{enumerate}
\end{theorem}
papers/latex/vol-01-foundations.tex:522: \begin{definition}[Classification problem]
\label{def:classification-problem}
The classification problem is $\mathrm{Classify}(\mathrm{Ob}(\mathrm{Phys}_{\mathrm{adm}})/\simeq)$, the classification of admissible records up to the declared physical equivalence. The problem is stated on objects and the declared equivalence; it does not require the five-kind morphism schema to be a category, and morphism statements enter it only through the kind-relative categories of Definition~\ref{def:phys-adm}.
\end{definition}
papers/latex/vol-01-foundations.tex:569: \begin{definition}[Claim-status labels]
\label{def:claim-status}
The claim-status labels are the following. \emph{Machine-checked}: a complete formalization has been accepted by a clean kernel-checked build, with the build archived. \emph{Complete-informal-proof}: a complete mathematical proof exists, given in full in the record or cited from the mathematical literature. \emph{Conditional}: the statement is proved from hypotheses recorded explicitly, and some hypothesis is itself unproved. \emph{Conjecture}: a precise statement with no complete proof. \emph{Computational-evidence}: support from computation that is not a proof. \emph{Open-problem}: a stated question with neither proof nor substantial evidence.
\end{definition}
papers/latex/vol-03-irreducibility-decomposition.tex:77: \begin{definition}[Physical system, composition data]
A physical system is a tuple $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ consisting of a state space $X$, an observable algebra or collection $\mathcal{O}$, dynamical laws $\mathcal{D}$, symmetry and constraint data $\mathcal{S}$, and composition and interaction rules $\mathcal{C}$. The component $\mathcal{C}$ specifies how $P$ composes with other systems: tensor products, coupling terms, interfacing rules.
\end{definition}
papers/latex/vol-03-irreducibility-decomposition.tex:83: \begin{definition}[Irreducibility relative to $\mathcal{C}$]
Fix a composition operation $\ast$ named by $\mathcal{C}$, with its unit object: the zero system for direct sum, the one-dimensional system for tensor product. A system $P$ is \emph{irreducible relative to $\ast$} when $P$ admits no decomposition $P \simeq \ast(P_1, P_2)$ with both $P_1$ and $P_2$ nonisomorphic to the unit. The class of irreducibles for $\ast$ is
\[
\mathfrak{J}_{\ast} = \{ P : P \text{ is irreducible relative to } \ast \}.
\]
\end{definition}
papers/latex/vol-03-irreducibility-decomposition.tex:92: \begin{definition}[Decomposition]
A \emph{decomposition} of $P$ is an expression $P \simeq \mathcal{F}(I_1, \dots, I_n)$ with each $I_i$ irreducible relative to the composition operation in force and $\mathcal{F}$ an admissible construction. A decomposition is \emph{unique in a class} when any two decompositions of a system in that class differ by a permutation of isomorphic factors and by the ambient equivalence $\simeq$.
\end{definition}
papers/latex/vol-03-irreducibility-decomposition.tex:96: \begin{definition}[Admissible constructions]
The admissible constructions $\mathcal{F}$ are the permitted operations assembling systems from simpler ones: tensor product, direct sum, extension (group, algebra, field-theoretic), limits and colimits including the limiting procedures of the morphism layer, factorization of a representation into factors, and quotient or symmetry reduction. Each use of a construction must state the composition data it contributes to $\mathcal{C}$.
\end{definition}
papers/latex/vol-03-irreducibility-decomposition.tex:102: \begin{definition}[Closure]
Given a collection $\mathfrak{F}$ of families and a set of constructions $\mathcal{C}$, the closure $\langle \mathfrak{F} \rangle_{\mathcal{C}}$ is the smallest class of systems containing $\mathfrak{F}$ and closed under the constructions $\mathcal{C}$.
\end{definition}
papers/latex/vol-03-irreducibility-decomposition.tex:108: \begin{definition}[Dimension vector]
For a unital finite-dimensional complex C*-algebra presented as a direct sum $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$, the \emph{dimension vector} of $A$ is the multiset $\mathbf{n}(A) = \{n_1, \dots, n_k\}$ of matrix sizes, equivalently the unordered list of the dimensions of the simple $A$-modules.
\end{definition}
papers/latex/vol-03-irreducibility-decomposition.tex:133: \begin{lemma}[No nilpotent radical]
\label{lem:radical}
Let $A$ be a finite-dimensional C*-algebra over $\mathbb{C}$. The Jacobson radical $J(A)$ is zero.
\end{lemma}
papers/latex/vol-03-irreducibility-decomposition.tex:142: \begin{lemma}[Simple blocks are matrix algebras]
\label{lem:simple-blocks}
Let $B$ be a finite-dimensional simple C*-algebra over $\mathbb{C}$. Then $B \cong M_n(\mathbb{C})$ for some $n \geq 1$.
\end{lemma}
papers/latex/vol-03-irreducibility-decomposition.tex:151: \begin{theorem}[Block decomposition]
\label{thm:block-decomposition}
Let $A$ be a unital finite-dimensional complex C*-algebra of dimension $d$. Then there exist $k \geq 1$ and integers $n_1, \dots, n_k \geq 1$ with $\sum_{i=1}^{k} n_i^2 = d$ and a *-isomorphism
\[
A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C}).
\]
The multiset $\mathbf{n}(A) = \{n_1, \dots, n_k\}$ is unique up to permutation, and $k = \dim_{\mathbb{C}} Z(A)$.
\end{theorem}
papers/latex/vol-03-irreducibility-decomposition.tex:166: \begin{corollary}[Classification of the class]
\label{cor:classification}
Two unital finite-dimensional complex C*-algebras are *-isomorphic if and only if their dimension vectors agree as multisets. The dimension vector is a complete invariant of the class.
\end{corollary}
papers/latex/vol-03-irreducibility-decomposition.tex:182: \begin{example}[One system, two answers]
\label{ex:two-answers}
Consider a two-qubit system with observable algebra $M_4(\mathbb{C})$. Under the direct sum composition, $M_4(\mathbb{C})$ is irreducible: it is simple, it has no nontrivial central idempotent, and its dimension vector is $\{4\}$. Under the tensor product composition, the same algebra factors as $M_2(\mathbb{C}) \otimes M_2(\mathbb{C}) \cong M_4(\mathbb{C})$ with two irreducible tensor factors. The dimension vector of the tensor product is the pairwise product multiset of the factor vectors: the product multiset of $\{2\}$ and $\{2\}$ is $\{4\}$, and the tensor factorization is invisible to the direct-sum invariant. Irreducibility is a property of the pair $(P, \ast)$.
\end{example}
papers/latex/vol-03-irreducibility-decomposition.tex:187: \begin{example}[Superselection and subsystems]
\label{ex:superselection}
The algebra $M_2(\mathbb{C}) \oplus M_2(\mathbb{C})$ decomposes as a direct sum into two simple blocks, the standard model of two superselection sectors, each carrying a qubit observable algebra. The same algebra is not a tensor product of two matrix algebras of equal size: a tensor decomposition $M_a \otimes M_b \cong M_{ab}$ is simple and has dimension vector $\{ab\}$, while $M_2 \oplus M_2$ has dimension vector $\{2,2\}$ and total dimension $8 = 2^2 + 2^2 \neq 2^3$. Direct-sum decomposition detects superselection, tensor decomposition detects subsystems, and neither detects the other.
\end{example}
papers/latex/vol-03-irreducibility-decomposition.tex:196: \begin{definition}[State]
A state on a unital C*-algebra $A$ is a linear functional $\omega \colon A \to \mathbb{C}$ that is positive and normalized by $\omega(1) = 1$. Write $S(A)$ for the set of states of $A$.
\end{definition}
papers/latex/vol-03-irreducibility-decomposition.tex:200: \begin{proposition}[States on a direct sum]
\label{prop:states-direct-sum}
Let $A = A_1 \oplus A_2$ with unital summands $A_1, A_2$ and central block projections $p_1, p_2$. Every state $\omega$ of $A$ has a unique expression
\[
\omega = \lambda \, \omega_1 + (1 - \lambda) \, \omega_2
\]
where $\lambda = \omega(p_1) \in [0,1]$, where $\omega_i$ is the restriction of $\omega$ to $A_i$ normalized to a state of $A_i$ when $\omega(p_i) > 0$, and the term is omitted when its weight is zero. Consequently $S(A)$ is the convex join of $S(A_1)$ and $S(A_2)$.
\end{proposition}
papers/latex/vol-03-irreducibility-decomposition.tex:213: \begin{example}[State space of two superselection sectors]
For $A = M_2(\mathbb{C}) \oplus M_2(\mathbb{C})$, each block state space is a Bloch ball and $S(A)$ is the join of two Bloch balls: a state is a choice of sector weight $\lambda \in [0,1]$ and a Bloch vector in each sector. The direct-sum decomposition of the algebra is exactly the superselection decomposition of the state space, and no information is lost or doubled in passing between the two descriptions.
\end{example}
papers/latex/vol-03-irreducibility-decomposition.tex:227: \begin{definition}[Multiplicity matrix]
\label{def:multiplicity-matrix}
Let $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ and $B \cong \bigoplus_{j=1}^{\ell} M_{m_j}(\mathbb{C})$. A \emph{multiplicity matrix} from $A$ to $B$ is a matrix $R = (r^{(i)}_j)$ of nonnegative integers with
\[
k^{(i)}_j = n_i \, r^{(i)}_j \qquad \text{and} \qquad \sum_{i=1}^{k} k^{(i)}_j = m_j \quad \text{for each } j.
\]
Write $k(R) = (k^{(i)}_j)$ for the induced rank matrix.
\end{definition}
papers/latex/vol-03-irreducibility-decomposition.tex:236: \begin{theorem}[Classification of unital *-homomorphisms]
\label{thm:homs}
Let $A$ and $B$ be unital finite-dimensional complex C*-algebras with fixed block presentations as above. Unital *-homomorphisms $\varphi \colon A \to B$, up to unitary conjugacy in $B$, correspond bijectively to multiplicity matrices $R$ from $A$ to $B$. The correspondence sends $\varphi$ to the rank matrix $k^{(i)}_j = \operatorname{rank}(\varphi(p_i) q_j)$, where $p_i$ is the $i$-th block projection of $A$ and $q_j$ the $j$-th block projection of $B$. Two unital *-homomorphisms are unitarily conjugate in $B$ if and only if their multiplicity matrices agree.
\end{theorem}
papers/latex/vol-03-irreducibility-decomposition.tex:251: \begin{corollary}[Outer automorphisms]
\label{cor:outer-aut}
Let $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$. Automorphisms of $A$, modulo inner automorphisms, are classified by permutations of the blocks with equal dimension vector entries. Concretely, $\mathrm{Aut}(A)/\mathrm{Inn}(A)$ is isomorphic to the group of permutations $\sigma$ of $\{1, \dots, k\}$ with $n_{\sigma(i)} = n_i$ for all $i$.
\end{corollary}
papers/latex/vol-03-irreducibility-decomposition.tex:260: \begin{example}[Two homomorphisms into $M_3$]
\label{ex:two-homs}
Take $A = \mathbb{C} \oplus M_2(\mathbb{C})$ and $B = M_3(\mathbb{C})$. A multiplicity matrix is a pair $(r^{(1)}, r^{(2)}) \in \mathbb{N}^2$ with $1 \cdot r^{(1)} + 2 \cdot r^{(2)} = 3$. The solutions are $(3, 0)$ and $(1, 1)$. There are exactly two conjugacy classes of unital *-homomorphisms $A \to M_3(\mathbb{C})$: one in which the $M_2$ summand acts as zero, and one in which the scalar summand acts on a one-dimensional summand and the $M_2$ block acts on the remaining $\mathbb{C}^2$. The classification is exact, small, and verifiable by hand.
\end{example}
papers/latex/vol-03-irreducibility-decomposition.tex:287: \begin{proposition}[Module factorization]
\label{prop:module-factorization}
Let $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ and let $M$ be a finite-dimensional left $A$-module. Then $M = \bigoplus_{i=1}^{k} p_i M$ uniquely as $A$-modules, each summand $p_i M$ is a module over the simple block $M_{n_i}(\mathbb{C})$, and $p_i M \cong (\mathbb{C}^{n_i})^{\oplus r_i}$ for a unique multiplicity $r_i \geq 0$. Two modules are isomorphic if and only if their multiplicity vectors agree.
\end{proposition}
papers/latex/vol-03-irreducibility-decomposition.tex:309: \begin{proposition}[Uniqueness in the restricted classes]
\label{prop:unique-restricted}
Uniqueness of decomposition up to permutation of isomorphic factors holds in each of the following restricted classes.
\begin{enumerate}
\item Unital finite-dimensional complex C*-algebras under direct sum: \cref{thm:block-decomposition}.
\item Unital *-homomorphisms of such algebras up to unitary conjugacy: \cref{thm:homs}.
\item Tensor factorizations into prime-dimensional factors: if a finite-dimensional Hilbert space is written as a tensor product of factors of prime dimension, the multiset of factor dimensions is unique up to permutation, by unique prime factorization of the total dimension.
\item Bipartite pure states of a finite-dimensional bipartite system, up to the Schmidt decomposition: the Schmidt coefficients are unique, and the left and right Schmidt subspaces are unique as subspaces.
\end{enumerate}
\end{proposition}
papers/latex/vol-03-irreducibility-decomposition.tex:328: \begin{proposition}[Ensemble nonuniqueness]
\label{prop:ensemble}
Every mixed density operator $\rho$, that is, every density operator of rank at least two, admits infinitely many distinct decompositions into pure states. Pure states are the only exceptions: a rank-one projector is an extreme point of the state space and admits no nontrivial decomposition.
\end{proposition}
papers/latex/vol-03-irreducibility-decomposition.tex:354: \begin{theorem}[Stinespring]
\label{thm:stinespring}
Let $A$ be a unital C*-algebra, $H$ a Hilbert space, and $\Phi \colon A \to B(H)$ completely positive. Then there exist a Hilbert space $K$, a *-representation $\pi \colon A \to B(K)$, and a bounded operator $V \colon H \to K$ with $\Phi(a) = V^* \pi(a) V$ for all $a \in A$. Among such dilations the minimal one, in which $K = \overline{\pi(A) V H}$, is unique up to a unitary intertwiner.
\end{theorem}
papers/latex/vol-03-irreducibility-decomposition.tex:369: \begin{theorem}[Kraus normal form]
\label{thm:kraus}
Every completely positive map $\Phi \colon M_n(\mathbb{C}) \to M_m(\mathbb{C})$ can be written $\Phi(X) = \sum_{s=1}^{r} K_s X K_s^*$ with Kraus operators $K_s \colon \mathbb{C}^n \to \mathbb{C}^m$. The minimal number $r$ of Kraus operators equals the rank of the Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$. Two Kraus families $(K_s)_{s=1}^{r}$ and $(L_t)_{t=1}^{r}$ of minimal size represent the same map if and only if $L_t = \sum_s u_{ts} K_s$ for a unitary $u \in U(r)$.
\end{theorem}
papers/latex/vol-03-irreducibility-decomposition.tex:380: \begin{example}[Equal count, different channels]
\label{ex:equal-count}
Both $\Phi(X) = X$ and $\Psi(X) = Z X Z$ on $M_2(\mathbb{C})$, with $Z$ the Pauli $Z$ operator, have minimal Kraus count one. They are not unitarily equivalent channels: the fixed-point algebra of $\Phi$ is all of $M_2(\mathbb{C})$, of complex dimension four, while the fixed-point algebra of $\Psi$ is the diagonal algebra $\mathbb{C} \oplus \mathbb{C}$, of dimension two, and unitary conjugation preserves the dimension of the fixed-point algebra. The invariant $r = 1$ does not separate the two channels.
\end{example}
papers/latex/vol-03-irreducibility-decomposition.tex:399: \begin{theorem}[Gelfand-Naimark]
\label{thm:gelfand-naimark}
Every C*-algebra admits a faithful isometric *-representation on a Hilbert space~\cite{gelfand-naimark}. In the commutative case, every unital commutative C*-algebra is isometrically *-isomorphic to $C(X)$ for a compact Hausdorff space $X$ given by its character space, and $X$ is recovered from $A$ as the set of multiplicative linear functionals with the weak-* topology.
\end{theorem}
papers/latex/vol-03-irreducibility-decomposition.tex:410: \begin{theorem}[Doplicher-Roberts reconstruction]
\label{thm:dr-reconstruction}
Let $\mathcal{C}$ be a symmetric tensor *-category with conjugates, direct sums and subobjects, with $\mathrm{End}(\mathbf{1}) = \mathbb{C}$, satisfying the selection criteria of the DHR analysis of a local net of observable algebras~\cite{dhr}. Then $\mathcal{C}$ is equivalent to the category of finite-dimensional unitary representations of a compact supergroup $G$, and $G$ is unique up to isomorphism~\cite{dr-duality,dr-endomorphisms}.
\end{theorem}
papers/latex/vol-03-irreducibility-decomposition.tex:428: \begin{proposition}[Construction arithmetic]
\label{prop:construction-arithmetic}
Let $A$ and $B$ be unital finite-dimensional complex C*-algebras with dimension vectors $\mathbf{n}(A)$ and $\mathbf{n}(B)$. Then:
\begin{enumerate}
\item $\mathbf{n}(A \oplus B) = \mathbf{n}(A) \uplus \mathbf{n}(B)$, the multiset union.
\item $\mathbf{n}(A \otimes B) = \{ n m : n \in \mathbf{n}(A),\, m \in \mathbf{n}(B) \}$, the pairwise product multiset.
\item $A \oplus B$ is irreducible under direct sum if and only if one summand is zero and the other is simple.
\end{enumerate}
\end{proposition}
papers/latex/vol-03-irreducibility-decomposition.tex:442: \begin{corollary}[Closure of a finite set of blocks]
\label{cor:closure}
Let $S = \{M_{n_1}(\mathbb{C}), \dots, M_{n_k}(\mathbb{C})\}$ and let $\mathcal{C} = \{\oplus, \otimes\}$. The closure $\langle S \rangle_{\mathcal{C}}$ is the class of unital finite-dimensional complex C*-algebras whose dimension vector entries lie in the multiplicative semigroup generated by $n_1, \dots, n_k$ in $\mathbb{N}_{\geq 1}$.
\end{corollary}
papers/latex/vol-03-irreducibility-decomposition.tex:469: \begin{example}[Qubit closure]
\label{ex:qubit-closure}
For $S = \{ \mathbb{C}, M_2(\mathbb{C}) \}$ under direct sum and tensor product, the multiplicative semigroup generated by $1$ and $2$ is $\{1, 2, 4, 8, \dots\}$, and the closure is the class of algebras whose dimension vectors have entries that are powers of two. The algebras $M_3(\mathbb{C})$ and $M_2(\mathbb{C}) \oplus M_3(\mathbb{C})$ are outside the closure. The enumeration of \cref{sec:computation} checks this arithmetic.
\end{example}
papers/latex/vol-03-irreducibility-decomposition.tex:490: \begin{proposition}[Embeddings and multiplicity matrices]
\label{prop:embeddings}
In the setting of \cref{thm:homs}, a unital *-homomorphism $\varphi \colon A \to B$ is injective if and only if its multiplicity matrix has no zero row. Injective unital *-homomorphisms are the embeddings of the finite-dimensional C*-category.
\end{proposition}
papers/latex/vol-03-irreducibility-decomposition.tex:499: \begin{proposition}[Spectra of direct sums]
\label{prop:spectrum-sum}
Let $A$ and $B$ be unital commutative C*-algebras with spectra $X$ and $Y$. Then $A \oplus B \cong C(X \sqcup Y)$ and the spectrum of a direct sum is the disjoint union of the spectra.
\end{proposition}
papers/latex/vol-03-irreducibility-decomposition.tex:546: \begin{theorem}[Tame-wild dichotomy]
\label{thm:tame-wild}
Every finite-dimensional algebra over an algebraically closed field is either derived tame or derived wild~\cite{bekkert-drozd}. Derived wildness is preserved under degeneration, and derived tameness is preserved under deformation.
\end{theorem}
papers/latex/vol-03-irreducibility-decomposition.tex:551: \begin{theorem}[Wildness of the generic determinant]
\label{thm:wild-generic-det}
The maximal Cohen-Macaulay module theory of the generic determinant is wild~\cite{buchweitz-leuschke}: already in rank two, the isomorphism classes of modules cannot be parametrized by a finite-dimensional variety over the coefficients.
\end{theorem}
papers/latex/vol-03-irreducibility-decomposition.tex:558: \begin{corollary}[Boundary on decomposition programs]
\label{cor:boundary}
Any program that decomposes systems into irreducibles and then parametrizes the irreducibles by finite-dimensional data is confined to tame regimes. In wild regimes the decomposition step may still exist while the parameterization step is provably unavailable.
\end{corollary}
papers/latex/vol-05-classical-systems.tex:78: \begin{definition}[Classical system]
\label{def:classical-system}
A classical system is a tuple $P = (X, O, D, S, C)$ where $X$ is a smooth state space, $O$ is a distinguished family of observables on $X$, $D$ is a family of admissible state evolutions with their composition rules (vector fields with flows on smooth manifolds, stochastic maps on simplices), $S$ is symmetry data preserving $O$ and $D$ (a Lie group action in the smooth case, outcome permutations and sufficient-statistics embeddings in the statistical case), and $C$ assigns composition data to products of systems. The tuple is the classical instance of the five-component schema of the series.
\end{definition}
papers/latex/vol-05-classical-systems.tex:83: \begin{definition}[Symplectic system]
\label{def:symplectic-system}
A symplectic system is a classical system whose state space is a symplectic manifold $(M, \omega)$ of dimension $2n$, whose observables are $O = C^{\infty}(M)$, and whose dynamics are Hamiltonian vector fields $X_H$ defined by $\iota_{X_H} \omega = dH$ for Hamiltonians $H \in C^{\infty}(M)$. The Poisson bracket is $\{f, g\} = \omega(X_f, X_g)$ and the flow equation reads $\dot{f} = \{f, H\}$.
\end{definition}
papers/latex/vol-05-classical-systems.tex:88: \begin{definition}[Poisson system]
\label{def:poisson-system}
A Poisson system is a classical system whose state space is a Poisson manifold $(M, \pi)$: a smooth manifold with a bivector field $\pi \in \Gamma(\Lambda^2 TM)$ whose Schouten-Nijenhuis bracket satisfies $[\pi, \pi] = 0$. The bracket $\{f, g\} = \pi(df, dg)$ makes $C^{\infty}(M)$ a Lie algebra obeying the Leibniz rule in each argument. Symplectic systems are the special case in which $\pi$ is nondegenerate.
\end{definition}
papers/latex/vol-05-classical-systems.tex:93: \begin{definition}[Classical statistical system]
\label{def:statistical-system}
A classical statistical system is a classical system whose state space is the interior $\Delta^{\circ} = \{ p \in \mathbb{R}^{n} : p_i > 0,\ \sum_i p_i = 1 \}$ of the probability simplex $\Delta^{n-1} = \{ p \in \mathbb{R}^{n} : p_i \geq 0,\ \sum_i p_i = 1 \}$, whose observables are random variables (functions on the outcome set), and whose admissible state changes are the column-stochastic matrices $T$ that map $\Delta^{\circ}$ into itself (columns strictly positive); maps that reach the boundary are excluded because the Fisher metric is singular there. Restriction to submodels is by sufficient statistics, and the symmetries $S$ are the outcome permutations together with those embeddings.
\end{definition}
papers/latex/vol-05-classical-systems.tex:100: \begin{definition}[Morphisms and equivalence in force]
\label{def:morphisms}
Between symplectic systems the admissible exact morphisms are symplectomorphisms and, between Poisson systems, Poisson maps (smooth maps pulling Poisson brackets back). Between classical statistical systems the admissible coarse-grainings are stochastic maps. Mathematical equivalence of classical systems is isomorphism in the ambient category fixed here: symplectomorphism, Poisson isomorphism, or diffeomorphism of statistical models carrying the model map. Every such identification preserves the symplectic form or the Poisson bracket or the probability structure, and the paper names the preserved layer whenever an identification is claimed.
\end{definition}
papers/latex/vol-05-classical-systems.tex:105: \begin{definition}[Irreducibility relative to composition]
\label{def:irreducible}
Fix the product composition of Section 9 as the composition data $C$. A classical system is $C$-irreducible if it admits no decomposition $P \simeq P_1 \times P_2$ with both factors of positive dimension. Irreducibility is always relative to the composition data chosen, and the paper never asserts irreducibility without naming that data.
\end{definition}
papers/latex/vol-05-classical-systems.tex:135: \begin{definition}[Canonical transformation and coarse-graining]
\label{def:canonical}
A canonical transformation between symplectic systems $(M_1, \omega_1)$ and $(M_2, \omega_2)$ is a diffeomorphism $\varphi : M_1 \to M_2$ with $\varphi^{*} \omega_2 = \omega_1$; it carries Hamiltonian flows to Hamiltonian flows and preserves the Poisson bracket. A coarse-graining of a classical statistical system is a stochastic map $T$; it preserves the probability structure and contracts the Fisher metric by \cref{def:monotone}. The two kinds of morphism implement the two equivalence regimes of this paper: exact mathematical equivalence on the symplectic side and a metric-degrading order relation on the statistical side.
\end{definition}
papers/latex/vol-05-classical-systems.tex:144: \begin{lemma}[Linearization at a point]
\label{lem:linearization}
Let $(M^{2n}, \omega)$ be symplectic and let $p \in M$. There are coordinates $(x_1, y_1, \dots, x_n, y_n)$ centered at $p$ in which $\omega_p = \sum_{i=1}^{n} dx_i \wedge dy_i$ at $p$.
\end{lemma}
papers/latex/vol-05-classical-systems.tex:153: \begin{lemma}[Moser trick on a ball]
\label{lem:moser-ball}
Let $B$ be an open ball centered at $p$ in a chart, and let $\omega_t$, $t \in [0, 1]$, be a smooth family of symplectic forms on $B$ with $\omega_t$ nondegenerate for all $t$. If $\dot{\omega}_t$ is exact for each $t$, then there is a concentric ball $B'$ compactly contained in $B$ carrying an isotopy $\varphi_t$ with $\varphi_t^{*} \omega_t = \omega_0$ for all $t$, and $\varphi_1$ maps $B'$ into $B$.
\end{lemma}
papers/latex/vol-05-classical-systems.tex:166: \begin{theorem}[Darboux]
\label{thm:darboux}
Let $(M^{2n}, \omega)$ be a symplectic manifold and $p \in M$. There exists a neighborhood $U$ of $p$ and a diffeomorphism $\varphi : U \to V$ onto an open subset $V \subset \mathbb{R}^{2n}$ such that $\varphi^{*} \omega_0 = \omega|_U$ where $\omega_0 = \sum_{i=1}^{n} dx_i \wedge dy_i$. In particular, any two symplectic manifolds of the same dimension are locally symplectomorphic.
\end{theorem}
papers/latex/vol-05-classical-systems.tex:175: \begin{corollary}[Absence of local invariants]
\label{cor:no-local}
Every local symplectic invariant of a $2n$-dimensional symplectic manifold is constant on connected components. Any classification of symplectic manifolds up to symplectomorphism must be carried by global data.
\end{corollary}
papers/latex/vol-05-classical-systems.tex:195: \begin{theorem}[Weinstein splitting]
\label{thm:weinstein}
Let $(M, \pi)$ be a Poisson manifold and $p \in M$ a point of rank $2k$. There exist a neighborhood $U$ of $p$ and a Poisson diffeomorphism from $U$ onto a product $U_1 \times U_2$ where $U_1$ is a neighborhood of a point in a symplectic manifold $(N^{2k}, \omega)$ and $U_2$ is a neighborhood of a zero $q_0$ of a Poisson structure $\pi_2$ of rank zero at $q_0$.
\end{theorem}
papers/latex/vol-05-classical-systems.tex:204: \begin{proposition}[Leaf foliation]
\label{prop:leaves}
A Poisson manifold $(M, \pi)$ is foliated by its symplectic leaves: maximal immersed submanifolds $S \subset M$ on which $\pi|_S$ is nondegenerate and which are tangent to the distribution $\operatorname{im} \pi^{\sharp}$. Each leaf is a symplectic manifold, and the restriction of the Poisson bracket of functions to a leaf is the bracket of the leaf symplectic form.
\end{proposition}
papers/latex/vol-05-classical-systems.tex:213: \begin{example}[Lie-Poisson bracket on $\mathfrak{g}^{*}$]
\label{ex:lie-poisson}
For a finite-dimensional Lie algebra $\mathfrak{g}$ the dual space $\mathfrak{g}^{*}$ carries the linear Poisson structure $\pi(\xi)(d f, d g) = \langle \xi, [d f(\xi), d g(\xi)] \rangle$ under the identification $T_{\xi}^{*} \mathfrak{g}^{*} \cong \mathfrak{g}$. Its symplectic leaves are the coadjoint orbits. For $\mathfrak{g} = \mathfrak{so}(3)$ the space $\mathfrak{g}^{*} \cong \mathbb{R}^{3}$ carries the angular momentum bracket $\{x, y\} = z$ and its cyclic permutations; the rank is two away from the origin and zero at the origin, the leaves are the spheres $\{|\xi| = r\}$ together with the origin, and \cref{thm:weinstein} at a point of a sphere recovers a two-dimensional symplectic factor with a one-dimensional transverse Poisson factor.
\end{example}
papers/latex/vol-05-classical-systems.tex:218: \begin{theorem}[Kirillov-Kostant-Souriau form]
\label{thm:kks}
Let $G$ be a Lie group with Lie algebra $\mathfrak{g}$ and let $\mathcal{O} \subset \mathfrak{g}^{*}$ be a coadjoint orbit. The formula
\[
\omega_{\xi}(\operatorname{ad}^{*}_{x} \xi, \operatorname{ad}^{*}_{y} \xi) = \langle \xi, [x, y] \rangle
\]
defines a $G$-invariant symplectic form $\omega_{\xi}$ on $\mathcal{O}$, and the coadjoint action of $G$ on $(\mathcal{O}, \omega_{\xi})$ is by symplectomorphisms. The Poisson structure induced on $\mathfrak{g}^{*}$ by the Lie bracket restricts on each orbit to the inverse of $\omega_{\xi}$.
\end{theorem}
papers/latex/vol-05-classical-systems.tex:231: \begin{proposition}[Casimir functions]
\label{prop:casimirs}
A smooth function $F \in C^{\infty}(M)$ on a Poisson manifold $(M, \pi)$ is constant on the symplectic leaves if and only if $\{F, f\} = 0$ for all $f \in C^{\infty}(M)$. On the Lie-Poisson space $\mathfrak{g}^{*}$ these functions are exactly the coadjoint-invariant functions $F(\xi) = F(\operatorname{Ad}^{*}_{g} \xi)$ for all $g \in G$. For $\mathfrak{g} = \mathfrak{so}(3)$ the Casimir is $F(\xi) = |\xi|^{2}$, and its level sets are the symplectic leaves of \cref{ex:lie-poisson}.
\end{proposition}
papers/latex/vol-05-classical-systems.tex:248: \begin{theorem}[Moser stability]
\label{thm:moser-stability}
Let $M$ be a closed manifold and $\omega_t$, $t \in [0, 1]$, a smooth family of symplectic forms with $[\omega_t] \in H^{2}(M; \mathbb{R})$ independent of $t$. Then there is an isotopy $\varphi_t$ of $M$ with $\varphi_t^{*} \omega_t = \omega_0$ for all $t$.
\end{theorem}
papers/latex/vol-05-classical-systems.tex:257: \begin{corollary}[Classification refines diffeomorphism and cohomology]
\label{cor:classification-data}
Let $f : M \to M'$ be a diffeomorphism of closed symplectic manifolds carrying $[\omega]$ to $[\omega']$. If there is a smooth path of symplectic forms $\omega_t$ in the constant class $[\omega]$ connecting $\omega$ to $f^{*} \omega'$, then $(M, \omega)$ and $(M', \omega')$ are symplectomorphic. Symplectomorphism classes therefore form a strictly finer partition than the pairs consisting of a diffeomorphism type and an orbit of $[\omega]$ under the diffeomorphism group.
\end{corollary}
papers/latex/vol-05-classical-systems.tex:264: \begin{example}[Surfaces]
\label{ex:surfaces}
A symplectic form on a closed surface is an area form, and the total area $\int_{M} \omega$ is a symplectomorphism invariant. Two closed oriented surfaces with area forms are symplectomorphic if and only if they are diffeomorphic and the areas agree. Classification here is classification of genus and area.
\end{example}
papers/latex/vol-05-classical-systems.tex:269: \begin{example}[Area forms on the sphere]
\label{ex:area-sphere}
Let $\sigma$ and $\sigma'$ be two area forms on $S^{2}$ with the same total area $\int_{S^{2}} \sigma = \int_{S^{2}} \sigma'$. Then $(S^{2}, \sigma)$ and $(S^{2}, \sigma')$ are symplectomorphic. The interpolation $\sigma_t = (1 - t) \sigma + t \sigma'$ consists of area forms of the same total area, hence symplectic forms with constant cohomology class in $H^{2}(S^{2}; \mathbb{R})$, and \cref{thm:moser-stability} above produces the isotopy. The classification of area forms on a fixed surface up to symplectomorphism is therefore the classification of total areas, in agreement with \cref{ex:surfaces}, and the theorem in action is Moser stability rather than any local analysis.
\end{example}
papers/latex/vol-05-classical-systems.tex:274: \begin{example}[Products of spheres]
\label{ex:product-spheres}
On $M = S^{2} \times S^{2}$ with area forms $\sigma_1$ and $\sigma_2$ of total area one on each factor, consider $\omega_{a, b} = a \sigma_1 \oplus b \sigma_2$ with $a, b > 0$. The cohomology class $[\omega_{a, b}] = a [\sigma_1] + b [\sigma_2]$ is a symplectomorphism invariant, and the diffeomorphism group of $S^{2} \times S^{2}$ acts on $H^{2}(M; \mathbb{R})$ by permuting the two factors. Hence $(M, \omega_{a, b})$ is symplectomorphic to $(M, \omega_{a', b'})$ if and only if $\{a, b\} = \{a', b'\}$ as unordered pairs. The classification is the unordered pair of areas, a two-dimensional global invariant with no local content.
\end{example}
papers/latex/vol-05-classical-systems.tex:285: \begin{definition}[Symplectic capacity]
\label{def:capacity}
A symplectic capacity is a rule $c$ assigning to each symplectic manifold $(M^{2n}, \omega)$ a number $c(M, \omega) \in [0, +\infty]$ such that: (i) monotonicity holds, $c(M, \omega) \leq c(M', \omega')$ whenever a symplectomorphism embeds $(M, \omega)$ into $(M', \omega')$; (ii) conformality holds, $c(M, \lambda \omega) = |\lambda| c(M, \omega)$ for $\lambda \neq 0$; (iii) normalization holds, $c(B^{2n}(1)) = c(B^{2}(1) \times \mathbb{R}^{2n-2}) = \pi$ where $B^{2n}(1)$ is the open unit ball and $B^{2}(1)$ the open unit disc.
\end{definition}
papers/latex/vol-05-classical-systems.tex:290: \begin{proposition}[Gromov width]
\label{prop:gromov-width}
The Gromov width
\[
w_G(M, \omega) = \sup \{ \pi r^{2} : B^{2n}(r) \text{ embeds symplectically into } (M, \omega) \}
\]
is a symplectic capacity in the sense of \cref{def:capacity}.
\end{proposition}
papers/latex/vol-05-classical-systems.tex:305: \begin{theorem}[Gromov nonsqueezing]
\label{thm:nonsqueezing}
Let $B^{2n}(r)$ be the open ball of radius $r$ in $\mathbb{R}^{2n}$ and $B^{2}(R) \times \mathbb{R}^{2n-2}$ the cylinder of radius $R$. A symplectic embedding $B^{2n}(r) \hookrightarrow B^{2}(R) \times \mathbb{R}^{2n-2}$ exists only if $r \leq R$.
\end{theorem}
papers/latex/vol-05-classical-systems.tex:322: \begin{definition}[Momentum map and homogeneous orbits]
\label{def:momentum}
Let $G$ act symplectically on $(M, \omega)$ with momentum map $J : M \to \mathfrak{g}^{*}$ characterized by $\langle dJ, x \rangle = \iota_{x_M} \omega$ for the fundamental vector fields $x_M$. The fibers and orbits of $J$ are the symmetry-level objects of the classical system, and coadjoint orbits in $\mathfrak{g}^{*}$ are the model homogeneous symplectic manifolds.
\end{definition}
papers/latex/vol-05-classical-systems.tex:327: \begin{theorem}[Coadjoint orbits of compact semisimple groups]
\label{thm:coadjoint-classification}
Let $G$ be compact, connected, and semisimple with complexification $G^{\mathbb{C}}$ and maximal torus $T$ with Lie algebra $\mathfrak{t}$. Every coadjoint orbit of $G$ meets $\mathfrak{t}^{*}$ in a single $W$-orbit, so the orbits are parameterized continuously by points $\xi$ of the closed positive Weyl chamber $\mathfrak{t}^{*}_{+}$. Each orbit is a flag manifold $G^{\mathbb{C}} / P_{\xi}$ where the parabolic $P_{\xi}$ is determined by the support of $\xi$, that is by the subset of Dynkin nodes on whose walls $\xi$ lies; regular $\xi$ gives full flag manifolds and singular $\xi$ gives partial flags. The symplectic form on the orbit is the Kirillov-Kostant-Souriau form of \Cref{thm:kks}. The dominant integral weights form the discrete sublattice $\Lambda_{+} \subset \mathfrak{t}^{*}_{+}$ that selects the integral, that is quantizable, orbits; those are the orbits carrying finite-dimensional irreducible representations by the Borel-Weil theorem.
\end{theorem}
papers/latex/vol-05-classical-systems.tex:336: \begin{example}[The spheres as coadjoint orbits]
\label{ex:sphere-orbit}
For $G = SU(2)$ the dual $\mathfrak{su}(2)^{*} \cong \mathbb{R}^{3}$, and the coadjoint orbits are the spheres $\{|\xi| = r\}$ of every radius $r > 0$ together with the degenerate orbit at the origin: a continuous one-parameter family, the Weyl chamber being the half-line $r \geq 0$. The Kirillov-Kostant-Souriau form of \Cref{thm:kks} on the sphere of radius $r$ is $1/r$ times the round area form, of total symplectic area $4 \pi r$. The integral orbits are those with $2r$ a nonnegative integer, and the Borel-Weil theorem attaches to the orbit of radius $r = j$ the spin-$j$ representation of dimension $2j + 1$. The example separates the two classification statements: the classical orbit family is continuous in $r$, and the representation labels form the discrete sublattice $r \in \tfrac{1}{2} \mathbb{Z}_{\geq 0}$.
\end{example}
papers/latex/vol-05-classical-systems.tex:371: \begin{definition}[Integrable system]
\label{def:integrable}
A Liouville integrable system is a symplectic manifold $(M^{2n}, \omega)$ with $n$ functions $H_1, \dots, H_n \in C^{\infty}(M)$ in involution, $\{H_i, H_j\} = 0$, and with $dH_1 \wedge \dots \wedge dH_n$ nonzero on a dense open subset of $M$.
\end{definition}
papers/latex/vol-05-classical-systems.tex:376: \begin{theorem}[Liouville-Arnold]
\label{thm:liouville-arnold}
Let $(M^{2n}, \omega, H_1, \dots, H_n)$ be a Liouville integrable system and let $M_c = \{ H_1 = c_1, \dots, H_n = c_n \}$ be a compact connected regular level set. Then $M_c$ is diffeomorphic to an $n$-torus $T^{n}$, and a neighborhood of $M_c$ in $M$ carries action-angle coordinates $(I, \theta)$ in which $\omega = \sum_{i} dI_i \wedge d\theta_i$ and the $H_i$ depend on the actions $I_i$ alone.
\end{theorem}
papers/latex/vol-05-classical-systems.tex:385: \begin{proposition}[Action variables are periods]
\label{prop:periods}
In the action-angle coordinates of \cref{thm:liouville-arnold}, the action variables are the periods of the action one-form $\lambda$ with $d\lambda = \omega$ over a basis $\gamma_1, \dots, \gamma_n$ of $H_1(M_c; \mathbb{Z})$:
\[
I_j = \frac{1}{2\pi} \oint_{\gamma_j} \lambda.
\]
The value depends on the choice of primitive $\lambda$: two primitives differ by a closed one-form, and the resulting shift of the actions is the period vector of that form, a vector of $H^{1}(M_c; \mathbb{R}) \cong \mathbb{R}^{n}$. Once $\lambda$ is fixed, the angle variables are fiberwise coordinates normalized so that $\omega = \sum_j dI_j \wedge d\theta_j$.
\end{proposition}
papers/latex/vol-05-classical-systems.tex:400: \begin{proposition}[Monodromy obstruction]
\label{prop:monodromy}
There exist integrable Hamiltonian systems whose regular compact fibers are tori and which admit no global action-angle coordinates; the obstruction is the monodromy representation of $\pi_1$ of the base of the fibration acting on the period lattice $H_1(T^{n}; \mathbb{Z})$.
\end{proposition}
papers/latex/vol-05-classical-systems.tex:409: \begin{example}[Spherical pendulum]
\label{ex:pendulum}
The spherical pendulum on $T^{*} S^{2}$ with Hamiltonian $H = \tfrac{1}{2} (p_{\theta}^{2} + p_{\varphi}^{2} / \sin^{2}\theta) - \cos \theta$ is integrable with the vertical angular momentum $p_{\varphi}$ as second integral. Regular compact fibers are two-tori, and the system has one focus-focus critical point. Parallel transport of the period lattice around the critical value acts on $H_1(T^{2}; \mathbb{Z})$ by the unipotent matrix $\begin{pmatrix} 1 & 1 \\ 0 & 1 \end{pmatrix}$. The local decomposition of \cref{thm:liouville-arnold} holds near every regular fiber, and no global decomposition into action-angle pairs exists on the complement of the critical value.
\end{example}
papers/latex/vol-05-classical-systems.tex:414: \begin{example}[Euler top]
\label{ex:euler-top}
The free rigid body is the Hamiltonian system on the coadjoint orbit $\mathcal{O} \subset \mathfrak{so}(3)^{*}$ of \cref{ex:lie-poisson} with Hamiltonian $H(\xi) = \tfrac{1}{2} (\xi_1^{2} / I_1 + \xi_2^{2} / I_2 + \xi_3^{2} / I_3)$ for positive moments of inertia $I_i$. The Casimir $|\xi|^{2}$ is a second integral in involution with $H$, so the system is integrable on each sphere $|\xi|^{2} = r^{2}$. The regular compact fibers are the intersections of the energy ellipsoids with the momentum spheres, the trajectories are the Euler-Poinsot curves on those spheres, and \cref{thm:liouville-arnold} applies at every regular fiber. The example lives simultaneously in the homogeneous symplectic geometry of Section 6 and in the integrable dynamics of this section: its state space is a coadjoint orbit, its invariant is the Casimir, and its local normal form is action-angle.
\end{example}
papers/latex/vol-05-classical-systems.tex:421: \begin{theorem}[Nekhoroshev estimate]
\label{thm:nekhoroshev}
Let $H = H_0 + \varepsilon H_1$ be a steep integrable Hamiltonian system with $n$ degrees of freedom and let $H_0(I)$ be the integrable part in action variables. There are positive constants $c$, $a$, and $b$ depending on the system such that, for $\varepsilon$ small, every trajectory satisfies
\[
\| I(t) - I(0) \| \leq c \varepsilon^{b}
\qquad \text{for all } 0 \leq t \leq \exp(c \varepsilon^{-a}).
\]
The bound is on the drift of the action variables, not on the energy, which is conserved exactly.
\end{theorem}
papers/latex/vol-05-classical-systems.tex:439: \begin{definition}[Fisher metric]
\label{def:fisher}
On the open simplex $\Delta^{\circ} \subset \mathbb{R}^{n}$ the Fisher metric is the Riemannian metric whose value at $p$ on tangent vectors $u, v$ (with $\sum_i u_i = \sum_i v_i = 0$) is
\[
g_{p}(u, v) = \sum_{i=1}^{n} \frac{u_i v_i}{p_i}.
\]
On a smooth statistical model $\theta \mapsto p_{\theta}$ the Fisher metric is the pullback of this metric, with components $g_{jk}(\theta) = \sum_i \frac{1}{p_i} \partial_j p_i \, \partial_k p_i$.
\end{definition}
papers/latex/vol-05-classical-systems.tex:448: \begin{example}[Fisher metric on three outcomes]
\label{ex:fisher-three}
For $p = (\tfrac{1}{2}, \tfrac{1}{3}, \tfrac{1}{6})$ and the tangent vector $u = (1, -1, 0)$ the Fisher metric evaluates to $g_p(u, u) = \frac{1}{1/2} + \frac{1}{1/3} = 5$. At the uniform point $p = (\tfrac{1}{3}, \tfrac{1}{3}, \tfrac{1}{3})$ the same vector gives $g_p(u, u) = 6$. The metric therefore weights directions by the rarity of the outcomes they move, and the example is the two-dimensional case of \cref{def:fisher}.
\end{example}
papers/latex/vol-05-classical-systems.tex:453: \begin{definition}[Monotone metric]
\label{def:monotone}
A Riemannian metric $g$ on $\Delta^{\circ}$ is monotone under stochastic maps if for every column-stochastic matrix $T$ and every $p$, the pullback $T^{*} g_{Tp}$ at $p$ satisfies $T^{*} g_{Tp} \leq g_{p}$ as quadratic forms. Monotonicity is the requirement that coarse-graining cannot increase distinguishability.
\end{definition}
papers/latex/vol-05-classical-systems.tex:458: \begin{theorem}[Chentsov]
\label{thm:chentsov}
Let $g$ be a family of Riemannian metrics $g^{(n)}$ on the open simplices $\Delta^{\circ} \subset \mathbb{R}^{n}$ for all $n \geq 1$, compatible with Markov embeddings (pullback along every sufficient statistic is an isometry) and monotone under stochastic maps in the sense of \cref{def:monotone}. Then one constant $c > 0$ satisfies $g^{(n)} = c \, g_{\mathrm{Fisher}}^{(n)}$ for every $n$, where $g_{\mathrm{Fisher}}^{(n)}$ is the Fisher metric of \cref{def:fisher}. The cross-dimension compatibility is a hypothesis: monotonicity on a single fixed simplex does not determine the metric up to scale.
\end{theorem}
papers/latex/vol-05-classical-systems.tex:467: \begin{lemma}[Equality along sufficient statistics]
\label{lem:sufficiency}
Let $g$ be a monotone metric on $\Delta^{\circ}$ and let $T$ be a stochastic map with a stochastic left inverse $S$, that is $S T = \mathrm{Id}$. Then $T$ is an isometric embedding for $g$, and for every tangent vector $u$ at $p$,
\[
g_{p}(u, u) = g_{Tp}(Tu, Tu).
\]
\end{lemma}
papers/latex/vol-05-classical-systems.tex:483: \begin{example}[Isometries of the Fisher metric]
\label{ex:reparameterization}
Under the square-root map $x_i = \sqrt{p_i}$ the open simplex $\Delta^{\circ}$ maps to the open positive orthant of the unit sphere, and the Fisher metric becomes four times the round metric of that sphere: $dx_i = u_i / (2 \sqrt{p_i})$ gives $\sum_i dx_i^{2} = \tfrac{1}{4} g_{p}(u, u)$. The isometries of the round sphere preserving the positive orthant are the coordinate permutations, so the isometries of the Fisher metric are exactly the relabelings of the outcome set. Stochastic maps that are not invertible on the model are contractions rather than isometries (\cref{def:monotone}), and \cref{lem:sufficiency} identifies the case of equality. The example shows concretely how the preserved layers of \cref{def:canonical} separate exact equivalence from coarse-graining.
\end{example}
papers/latex/vol-05-classical-systems.tex:488: \begin{corollary}[Fisher metric as classifying invariant]
\label{cor:fisher-invariant}
The Fisher metric, up to positive scale, is a classifying invariant of the classical statistical family under stochastic morphisms: it is the unique metric compatible with the coarse-graining order.
\end{corollary}
papers/latex/vol-05-classical-systems.tex:498: \begin{proposition}[Product of statistical models]
\label{prop:stat-product}
Let $p \in \Delta^{\circ} \subset \mathbb{R}^{n}$ and $q \in \Delta^{\circ} \subset \mathbb{R}^{m}$ be probability vectors and let $p \otimes q \in \Delta^{\circ} \subset \mathbb{R}^{nm}$ be their product. Then the Fisher metric of the product is the direct sum of the factors:
\[
g_{p \otimes q}(u \otimes q + p \otimes v, u \otimes q + p \otimes v) = g_{p}(u, u) + g_{q}(v, v)
\]
for tangent vectors $u$ at $p$ and $v$ at $q$.
\end{proposition}
papers/latex/vol-05-classical-systems.tex:521: \begin{theorem}[Petz-Sudar parametric classification]
\label{thm:petz-sudar}
Monotone metrics on the space of positive definite density matrices, defined by monotonicity under completely positive trace-preserving maps, are classified by operator monotone functions $f : (0, \infty) \to (0, \infty)$ with $f(1) = 1$ and the symmetry $f(t) = t f(1/t)$ that makes the bilinear form symmetric. The family of such metrics is parametric and infinite, and no constant multiple of a single metric exhausts it.
\end{theorem}
papers/latex/vol-05-classical-systems.tex:536: \begin{definition}[Product composition]
\label{def:product-composition}
The product composition of classical systems is defined componentwise. For symplectic systems, $(M_1 \times M_2, \omega_1 \oplus \omega_2)$ with $\omega_1 \oplus \omega_2 = \operatorname{pr}_1^{*} \omega_1 + \operatorname{pr}_2^{*} \omega_2$ and Hamiltonians $H_1 + H_2$. For Poisson systems, the direct sum of bivectors. For statistical systems, the product of simplices with product measures and product stochastic maps. The composition data $C$ of \cref{def:irreducible} is this product.
\end{definition}
papers/latex/vol-05-classical-systems.tex:541: \begin{proposition}[Irreducibility of symplectic surfaces]
\label{prop:surface-irreducible}
Every closed symplectic surface of genus $g \geq 0$ is $C$-irreducible for the product composition.
\end{proposition}
papers/latex/vol-05-classical-systems.tex:550: \begin{proposition}[Symplectic reduction]
\label{prop:reduction}
Let a compact Lie group $G$ act on a symplectic system $(M, \omega)$ by symplectomorphisms with momentum map $J$. For a regular value $\mu$ of $J$ at which the isotropy group $G_{\mu}$ acts freely and properly on $J^{-1}(\mu)$, the reduced space $J^{-1}(\mu) / G_{\mu}$ carries a unique symplectic form $\omega_{\mu}$ such that the pullback along $J^{-1}(\mu) \to J^{-1}(\mu)/G_{\mu}$ agrees with $\omega|_{J^{-1}(\mu)}$, and the reduced dynamics of an invariant Hamiltonian is Hamiltonian for $\omega_{\mu}$. The reduction is a decomposition construction on classical systems, and its output is again a classical system of \cref{def:classical-system}.
\end{proposition}
papers/latex/vol-05-classical-systems.tex:561: \begin{example}[Reduction of the plane]
\label{ex:reduction-sphere}
Let $U(1)$ act on $\mathbb{C}^{2} \cong \mathbb{R}^{4}$ with its standard symplectic form by $e^{i\theta} \cdot z = e^{i\theta} z$, with momentum map $J(z) = \tfrac{1}{2} (|z_1|^{2} + |z_2|^{2})$. For $\mu > 0$ the level set $J^{-1}(\mu)$ is the three-sphere of radius $\sqrt{2\mu}$ in $\mathbb{C}^{2}$, and the reduced space $J^{-1}(\mu) / U(1)$ is $\mathbb{CP}^{1}$ with the Fubini-Study symplectic form normalized to total area $2\pi \mu$; the quotient identifies the Hopf fibers of the level set. The reduced dynamics of any rotation-invariant Hamiltonian is Hamiltonian on that sphere. The example is the elementary case of \cref{prop:reduction}: a four-dimensional symplectic system with a one-dimensional symmetry reduces to a two-dimensional one, and the reduction is a decomposition step in the sense of \cref{def:product-composition}.
\end{example}
papers/latex/vol-05-classical-systems.tex:566: \begin{proposition}[Reduction of products]
\label{prop:reduction-products}
Let $G$ act on a symplectic system $(M_1, \omega_1)$ with momentum map $J_1$, let $(M_2, \omega_2)$ carry the trivial $G$-action, and let $\mu$ be a regular value of $J_1$. Then the reduced space of the product $(M_1 \times M_2, \omega_1 \oplus \omega_2)$ at $\mu$ is the product of the reduced space of $M_1$ at $\mu$ with $M_2$:
\[
\big( J_1^{-1}(\mu) / G_{\mu} \big) \times M_2,
\]
with reduced form $\omega_{\mu} \oplus \omega_2$. Reduction commutes with product composition along the factor that carries no symmetry.
\end{proposition}
papers/latex/vol-05-classical-systems.tex:588: \begin{definition}[Toric symplectic manifold]
\label{def:toric}
A compact connected toric symplectic manifold is a symplectic manifold $(M^{2n}, \omega)$ of dimension $2n$ with an effective Hamiltonian action of the torus $T^{n}$ whose momentum map $J : M \to \mathbb{R}^{n}$ is proper.
\end{definition}
papers/latex/vol-05-classical-systems.tex:593: \begin{theorem}[Delzant]
\label{thm:delzant}
The momentum image $\Delta = J(M) \subset \mathbb{R}^{n}$ of a compact connected toric symplectic manifold is a convex rational Delzant polytope: convex, rational, simple, and Delzant (the normal vectors of the facets meeting at each vertex form a $\mathbb{Z}$-basis of $\mathbb{Z}^{n}$). Two compact connected toric symplectic manifolds are equivariantly symplectomorphic up to an automorphism of the acting torus $T^{n}$ if and only if their Delzant polytopes are related by an element of $GL(n; \mathbb{Z}) \ltimes \mathbb{R}^{n}$. When the torus action is fixed pointwise the equivalence narrows to translations of the polytope in $\mathbb{R}^{n}$ alone. Conversely, every Delzant polytope arises from such a manifold.
\end{theorem}
papers/latex/vol-05-classical-systems.tex:602: \begin{example}[Toric surfaces]
\label{ex:toric-surfaces}
In dimension two the Delzant polygons are the polygons with rational edge slopes meeting in lattice bases. The moment polygon of $(S^{2}, r \omega_{\text{area}})$ is an interval of length $r$, and the moment polygon of the one-point blowup of $(\mathbb{CP}^{2}, \omega)$ is a triangle with one corner cut. Two toric surfaces are equivariantly symplectomorphic if and only if their polygons coincide up to lattice equivalence, so the classification is a combinatorial list of polygons.
\end{example}
papers/latex/vol-06-quantum-systems.tex:87: \begin{definition}[Quantum system record]
\label{def:system}
A quantum system record is a tuple $P = (H, A, D, S, C)$ where $H$ is a complex Hilbert space, $A$ is a $C^*$-algebra of observables represented on $H$, $D$ is the dynamical data (a flow, a semigroup of endomorphisms, or a generator), $S$ is the symmetry and constraint data (a group or groupoid action with its fixed-point structure), and $C$ is the composition data (tensor product or another monoidal operation on records of the same kind). The five components need not be independent.
\end{definition}
papers/latex/vol-06-quantum-systems.tex:94: \begin{definition}[Classification problem]
\label{def:classproblem}
Fix a class $\mathcal{Q}$ of quantum system records and an equivalence relation $\approx$ on $\mathcal{Q}$ declared with its preserved layers as in \cref{def:preserved}. The classification problem for $(\mathcal{Q}, \approx)$ is to construct an invariant $I$ on $\mathcal{Q}$ with $I(P) = I(Q)$ exactly when $P \approx Q$. The equivalences in force below are $*$-isomorphism for observable algebras, unitary equivalence for minimal dilations, symmetric tensor equivalence for superselection categories, and equality of the operator monotone parameter for monotone metrics.
\end{definition}
papers/latex/vol-06-quantum-systems.tex:99: \begin{definition}[Observable algebras]
\label{def:observables}
A finite-dimensional quantum system is a record with $\dim H = n < \infty$ and $A \subseteq B(H)$ a $C^*$-subalgebra of the algebra of bounded operators on $H$. As an abstract $C^*$-algebra $A$ is finite-dimensional and unital, with a unit that need not be the identity of $B(H)$; \cref{thm:findim} applies to $A$ as an abstract algebra. An operator-algebraic system is a record whose observable algebra $A$ is a $C^*$-algebra or a von Neumann algebra of arbitrary dimension. A factor is a von Neumann algebra with trivial center.
\end{definition}
papers/latex/vol-06-quantum-systems.tex:104: \begin{definition}[States and channels]
\label{def:channels}
A state on a $C^*$-algebra $A$ is a positive linear functional $\rho$ of norm one. A channel between matrix algebras $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ is a linear map that is completely positive and trace preserving. A Stinespring dilation of a channel $\Phi$ is a pair $(K, V)$ with $K$ a finite-dimensional Hilbert space (the environment) and $V: \mathbb{C}^n \to \mathbb{C}^m \otimes K$ an isometry such that
\[
\Phi(X) = \operatorname{Tr}_K\bigl(V X V^*\bigr) \qquad \text{for all } X \in M_n(\mathbb{C}).
\]
The dilation is minimal when no proper subspace of $K$ carries a dilation of $\Phi$.
\end{definition}
papers/latex/vol-06-quantum-systems.tex:113: \begin{definition}[Dimension vector]
\label{def:dimvec}
Let $A$ be a finite-dimensional $C^*$-algebra. The dimension vector of $A$ is the multiset of matrix block sizes appearing in the decomposition of \cref{thm:findim}, written $\mathbf{d}(A) = \{n_1, \dots, n_k\}$ with each $n_i \geq 1$ and repetition allowed.
\end{definition}
papers/latex/vol-06-quantum-systems.tex:118: \begin{definition}[Preserved structure of an equivalence]
\label{def:preserved}
An equivalence used to identify two quantum system records must state which layers it preserves. The layers named in this paper are the $*$-structure of observable algebras, the monoidal structure of tensor products, the symmetric structure of a tensor category, and the complete positivity of channels. An identification that does not name its preserved layers is inadmissible.
\end{definition}
papers/latex/vol-06-quantum-systems.tex:125: \begin{example}[Qubit composite systems]
\label{ex:qubits}
A single qubit record has $H = \mathbb{C}^2$ and observables $M_2(\mathbb{C})$. An $N$-qubit record has $H = (\mathbb{C}^2)^{\otimes N}$ and observables $M_{2^N}(\mathbb{C})$ or a subalgebra of it, with composition data the tensor product of \cref{prop:tensor}. The dimension vector of the full observable algebra is $\{2^N\}$, and subalgebras correspond to blocks of smaller size in the sense of \cref{thm:findim}. Symmetry actions such as the Pauli group permute and mix the blocks, and that action is data the dimension vector does not carry.
\end{example}
papers/latex/vol-06-quantum-systems.tex:130: \begin{definition}[Invariants]
\label{def:invariants}
A classifying invariant for a class of records is a map $I$ such that $I(P) = I(Q)$ if and only if $P$ and $Q$ are equivalent under the relation in force. The classifying invariants of this paper are the dimension vector (\cref{def:dimvec}), the Murray-von Neumann type and the Connes invariants of a factor, and the operator monotone function classifying a monotone metric on quantum states. The Kraus rank of a minimal dilation is a normal-form dimension and not a classifying invariant for channels (\cref{rem:normalform}).
\end{definition}
papers/latex/vol-06-quantum-systems.tex:165: \begin{theorem}[Structure of finite-dimensional $C^*$-algebras]
\label{thm:findim}
Let $A$ be a finite-dimensional complex $C^*$-algebra. Then there are integers $n_1, \dots, n_k \geq 1$ and a $*$-isomorphism
\[
A \cong M_{n_1}(\mathbb{C}) \oplus \cdots \oplus M_{n_k}(\mathbb{C}).
\]
The multiset $\{n_1, \dots, n_k\}$ determines $A$ up to $*$-isomorphism, and two finite-dimensional $C^*$-algebras are $*$-isomorphic if and only if their dimension vectors agree as multisets.
\end{theorem}
papers/latex/vol-06-quantum-systems.tex:180: \begin{corollary}[Classification by dimension vector]
\label{cor:findimclass}
Up to $*$-isomorphism the finite-dimensional complex $C^*$-algebras are in bijection with finite multisets of positive integers, and every such algebra is unital with $\dim A = \sum_i n_i^2$ the sum of squares of its block sizes.
\end{corollary}
papers/latex/vol-06-quantum-systems.tex:190: \begin{example}[Qubit observables]
\label{ex:qubit}
For $H = \mathbb{C}^2$ the full observable algebra is $M_2(\mathbb{C})$ with dimension vector $\{2\}$. The commutative algebra of diagonal observables is $\mathbb{C} \oplus \mathbb{C}$ with dimension vector $\{1, 1\}$. The two algebras have equal vector-space dimension $4$ and are not $*$-isomorphic, so vector-space dimension is not a classifying invariant while the dimension vector is. Up to $*$-isomorphism there are exactly two $C^*$-algebras of complex dimension $4$: $M_2(\mathbb{C})$ and $\mathbb{C}^4$, since $4 = 2^2 = 1^2 + 1^2 + 1^2 + 1^2$ are the two partitions of $4$ into perfect squares.
\end{example}
papers/latex/vol-06-quantum-systems.tex:195: \begin{example}[Two presentations of one algebra]
\label{ex:iso}
Let $A \subseteq M_3(\mathbb{C})$ consist of the block matrices $\operatorname{diag}(M, \lambda)$ with $M \in M_2(\mathbb{C})$ and $\lambda \in \mathbb{C}$, and let $B = U A U^*$ for a unitary $U \in M_3(\mathbb{C})$. The algebras are $*$-isomorphic by construction and have the same dimension vector $\{1, 2\}$, while their matrix representations in $\mathbb{C}^3$ differ. The algebra $M_2(\mathbb{C}) \oplus \mathbb{C}$ carries the same dimension vector, and a unitary carrying the block decomposition of $A$ to the standard one exhibits the $*$-isomorphism of \cref{thm:findim} explicitly. The invariant sees the blocks and the presentation hides them.
\end{example}
papers/latex/vol-06-quantum-systems.tex:200: \begin{corollary}[Counting small algebras]
\label{cor:count}
For each $d \geq 1$ the $*$-isomorphism classes of finite-dimensional $C^*$-algebras of complex dimension $d$ are in bijection with the partitions of $d$ into perfect squares. In particular the number of such algebras grows as the number of such partitions.
\end{corollary}
papers/latex/vol-06-quantum-systems.tex:241: \begin{proposition}[States of a block algebra]
\label{prop:states}
Let $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$. Every state $\rho$ on $A$ is of the form
\[
\rho(X_1, \dots, X_k) = \sum_{i=1}^{k} \operatorname{Tr}(\sigma_i X_i)
\]
for positive matrices $\sigma_i \in M_{n_i}(\mathbb{C})$ with $\sum_i \operatorname{Tr} \sigma_i = 1$, and this correspondence is bijective. The pure states of $A$ are the vector states of individual blocks, so the pure state space is the disjoint union of complex projective spaces $\mathbb{CP}^{n_i - 1}$.
\end{proposition}
papers/latex/vol-06-quantum-systems.tex:256: \begin{proposition}[Automorphisms of block algebras]
\label{prop:aut}
Every $*$-automorphism of $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ is the composition of a blockwise inner automorphism and a permutation of blocks of equal size. The dynamics of a finite-dimensional quantum system is therefore a unitary path inside blocks together with block permutations of equal size, and none of it is recorded by the dimension vector beyond the block sizes themselves.
\end{proposition}
papers/latex/vol-06-quantum-systems.tex:265: \begin{proposition}[Unique decomposition in the finite-dimensional class]
\label{prop:unique}
Decompositions of a finite-dimensional $C^*$-algebra $A$ into irreducible summands under direct sum exist and are unique up to order and unitary equivalence. The dimension vector is therefore complete data for the decomposition as well as for the isomorphism class, and the uniqueness that fails for interacting systems in general holds in this restricted class.
\end{proposition}
papers/latex/vol-06-quantum-systems.tex:274: \begin{proposition}[Tensor products of block algebras]
\label{prop:tensor}
Let $A = \bigoplus_i M_{n_i}(\mathbb{C})$ and $B = \bigoplus_j M_{m_j}(\mathbb{C})$. Then $A \otimes B \cong \bigoplus_{i,j} M_{n_i m_j}(\mathbb{C})$, and the dimension vector of $A \otimes B$ is the multiset of products $\{n_i m_j\}$. In particular the dimension vector of a tensor product is computed from the factor dimension vectors without reference to any presentation.
\end{proposition}
papers/latex/vol-06-quantum-systems.tex:288: \begin{definition}[Factor types]
\label{def:factortype}
A factor $M$ is of type $\mathrm{I}$ if it contains minimal projections, of type $\mathrm{II}_1$ if it is infinite-dimensional with a finite faithful normal trace, of type $\mathrm{II}_\infty$ if it is properly infinite with a semifinite trace, and of type $\mathrm{III}$ if it admits no nonzero finite trace. The type $\mathrm{III}$ factors are stratified by the Connes spectrum of the modular automorphism group, with parameters $\lambda \in (0,1)$ and the two endpoint cases $\mathrm{III}_0$ and $\mathrm{III}_1$.
\end{definition}
papers/latex/vol-06-quantum-systems.tex:297: \begin{definition}[Amenable factors]
\label{def:amenable}
All factors in this section have separable predual. A factor is hyperfinite, or approximately finite-dimensional, when it is the norm closure of an increasing union of finite-dimensional subalgebras, and injective when a norm-one projection of $B(H)$ onto it exists. For factors with separable predual the two conditions coincide, and a factor satisfying them is amenable. The unique amenable factor of type $\mathrm{II}_1$ with separable predual is the hyperfinite factor $R$.
\end{definition}
papers/latex/vol-06-quantum-systems.tex:302: \begin{theorem}[Central decomposition]
\label{thm:central}
Every von Neumann algebra $M$ is a direct integral of factors over a measure space, unique up to measure-class isomorphism of the base. The isomorphism classification of von Neumann algebras therefore reduces to the classification of factors together with the measure-theoretic data of the decomposition.
\end{theorem}
papers/latex/vol-06-quantum-systems.tex:309: \begin{theorem}[Classification of amenable factors]
\label{thm:amenable}
Among factors with separable predual the amenable (equivalently injective, equivalently hyperfinite) factors are classified as follows. For each $n \geq 1$ there is a unique factor of type $\mathrm{I}_n$ and a unique factor of type $\mathrm{I}_\infty$. There is a unique amenable factor of type $\mathrm{II}_1$, the hyperfinite factor, and a unique amenable factor of type $\mathrm{II}_\infty$. For each $\lambda \in (0,1)$ there is a unique amenable factor of type $\mathrm{III}_\lambda$, and a unique amenable factor of type $\mathrm{III}_1$. Amenable factors of type $\mathrm{III}_0$ are classified by the ergodic flow of weights. The invariants in force are the Murray-von Neumann type together with the Connes invariants. Separable predual is essential: among non-separable injective $\mathrm{II}_1$ factors uniqueness fails, and there are $2^{\mathfrak{c}}$ pairwise non-isomorphic ones.
\end{theorem}
papers/latex/vol-06-quantum-systems.tex:341: \begin{theorem}[McDuff 1969]
\label{thm:mcduff}
There exist uncountably many pairwise non-isomorphic separable type $\mathrm{II}_1$ factors.
\end{theorem}
papers/latex/vol-06-quantum-systems.tex:350: \begin{corollary}[No finite list of factor types]
\label{cor:nofinite}
No finite or countable list of pairwise non-isomorphic factor types exhausts the separable $\mathrm{II}_1$ factors, and no CFSG-style list of factor types is complete outside a restricted class such as the amenable factors.
\end{corollary}
papers/latex/vol-06-quantum-systems.tex:374: \begin{lemma}[Choi correspondence]
\label{lem:choi}
For a linear map $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ with Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$ the following hold: $\Phi$ is completely positive if and only if $J(\Phi) \geq 0$, and $\Phi$ is trace preserving if and only if $\operatorname{Tr}_m J(\Phi) = I_n$, where $\operatorname{Tr}_m$ is the partial trace over the second tensor factor.
\end{lemma}
papers/latex/vol-06-quantum-systems.tex:383: \begin{example}[A family of one Kraus rank]
\label{ex:depol}
For $p \in (0,1)$ set $A_0 = \sqrt{1 - p} \, I_2$ and $A_i = \sqrt{p/3} \, \sigma_i$ for the three Pauli matrices $\sigma_i$. The map $\Phi_p(X) = \sum_{k=0}^{3} A_k X A_k^*$ satisfies $\sum_k A_k^* A_k = I_2$, so it is a qubit channel. Its Choi matrix has eigenvalues $2(1 - p)$ and $2p/3$ with multiplicity three, all positive, so the Kraus rank is $4$ for every $p \in (0,1)$. The Choi spectrum varies with $p$, and unitary equivalence of channels preserves the Choi spectrum, so the family consists of pairwise unitarily inequivalent channels sharing one Kraus rank.
\end{example}
papers/latex/vol-06-quantum-systems.tex:388: \begin{example}[Choi matrix of a qubit channel]
\label{ex:choi}
For the channel $\Phi_p$ of \cref{ex:depol} the Kraus vectors are the vectorizations of $I_2$ and of the Pauli matrices, which are orthogonal for the Hilbert-Schmidt pairing. The Choi matrix is therefore diagonal in the basis these vectors span, with eigenvalues $2(1 - p)$ and $2p/3$ with multiplicity three. Trace preservation reads $\operatorname{Tr}_m J(\Phi_p) = I_2$ on these eigenvalues, and complete positivity reads $J(\Phi_p) \geq 0$, which holds for $p \in (0,1)$. The eigenvalue list is the input of the minimization statement of \cref{prop:krausrank}.
\end{example}
papers/latex/vol-06-quantum-systems.tex:393: \begin{theorem}[Choi-Kraus normal form]
\label{thm:kraus}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be linear. Then $\Phi$ is completely positive if and only if there are matrices $A_1, \dots, A_r \in M_{m \times n}(\mathbb{C})$ with
\[
\Phi(X) = \sum_{i=1}^{r} A_i X A_i^* \qquad \text{for all } X \in M_n(\mathbb{C}),
\]
and one may take $r$ equal to the rank of the Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$. The minimal such $r$ is the Kraus rank of $\Phi$ and equals the rank of $J(\Phi)$.
\end{theorem}
papers/latex/vol-06-quantum-systems.tex:415: \begin{theorem}[Stinespring dilation]
\label{thm:stinespring}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be a channel. Then $\Phi$ admits a Stinespring dilation $(K, V)$ in the sense of \cref{def:channels}, and minimal dilations exist. Any two minimal dilations $(K, V)$ and $(K', V')$ of $\Phi$ are unitarily equivalent: there is a unitary $U: K \to K'$ with $(I_m \otimes U) V = V'$. The dimension $\dim K$ of a minimal dilation equals the Kraus rank of $\Phi$.
\end{theorem}
papers/latex/vol-06-quantum-systems.tex:431: \begin{proposition}[Kraus rank is a normal-form invariant]
\label{prop:krausrank}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be a channel. The Kraus rank of $\Phi$ equals the rank of its Choi matrix, equals the minimal number of Kraus operators in any representation of $\Phi$, and equals the dimension of the environment $K$ in a minimal Stinespring dilation. The Kraus rank is preserved by unitary changes of Kraus presentation and by composition of $\Phi$ with unitary conjugations of domain and codomain. It is not a complete invariant of channels: two channels with equal Kraus rank need not be unitarily equivalent.
\end{proposition}
papers/latex/vol-06-quantum-systems.tex:445: \begin{proposition}[Composition of channels]
\label{prop:compose}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ and $\Psi: M_m(\mathbb{C}) \to M_p(\mathbb{C})$ be linear. Then
\[
J(\Psi \circ \Phi)_{(i\alpha),(j\beta)} = \sum_{k,l=1}^{m} J(\Phi)_{(ik),(jl)} \, J(\Psi)_{(k\alpha),(l\beta)},
\]
with composite indices as in \cref{lem:choi}. The right-hand side is the link product of $J(\Phi)$ and $J(\Psi)$: matrix multiplication of $J(\Phi)$ after partial transpose on the shared subsystem, contracted with $J(\Psi)$ along that subsystem. Composition of channels is therefore a link-product contraction, and the Choi matrix of a composite is determined by the Choi matrices of the factors.
\end{proposition}
papers/latex/vol-06-quantum-systems.tex:468: \begin{definition}[Superselection category]
\label{def:dhr}
Fix a local net of observable algebras satisfying the Haag-Kastler axioms and the DHR selection criterion: representations that are equivalent to the vacuum representation on the algebra of every causally disconnected region. Under Haag duality these representations correspond to localized transportable endomorphisms of the observable algebra, and their intertwiners form a symmetric tensor $*$-category with conjugates, direct sums, and subobjects.
\end{definition}
papers/latex/vol-06-quantum-systems.tex:475: \begin{theorem}[Doplicher-Roberts reconstruction]
\label{thm:dr}
Let $\mathcal{C}$ be a symmetric tensor $*$-category with conjugates, direct sums, and subobjects, and with $\operatorname{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent, as a symmetric tensor $*$-category, to the category of finite-dimensional unitary representations of a compact supergroup $G$, and $G$ is unique up to isomorphism.
\end{theorem}
papers/latex/vol-06-quantum-systems.tex:492: \begin{theorem}[Deligne]
\label{thm:deligne}
Let $\mathcal{C}$ be a $\mathbb{C}$-linear, abelian, rigid symmetric tensor category over $\mathbb{C}$ of subexponential growth, with $\operatorname{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent, as a symmetric tensor category, to the category of finite-dimensional representations of an affine supergroup scheme. In particular the category is Tannakian in the super sense.
\end{theorem}
papers/latex/vol-06-quantum-systems.tex:499: \begin{proposition}[Etingof-Gelaki counterexample]
\label{prop:eg}
There exist finite non-isomorphic groups $G_1$ and $G_2$ whose representation categories over $\mathbb{C}$ are equivalent as tensor categories, but not as symmetric tensor categories. Consequently an equivalence of tensor categories that forgets the symmetric structure cannot recover the group, and any classification of such categories built on that equivalence is false.
\end{proposition}
papers/latex/vol-06-quantum-systems.tex:523: \begin{definition}[Monotone metric]
\label{def:monotone}
Let $\mathcal{D}_n$ denote the manifold of strictly positive density matrices of $M_n(\mathbb{C})$, an open subset of the affine space of self-adjoint trace-one matrices, with tangent space $T_\rho \mathcal{D}_n$ the space of self-adjoint traceless matrices at $\rho$. A monotone metric assigns to each $\rho \in \mathcal{D}_n$ an inner product on $T_\rho \mathcal{D}_n$ such that the metric decreases under every completely positive trace-preserving map. In the classical setting the corresponding notion is monotonicity under stochastic maps.
\end{definition}
papers/latex/vol-06-quantum-systems.tex:533: \begin{theorem}[Petz]
\label{thm:petz}
Monotone metrics on $\mathcal{D}_n$ are in bijection with operator monotone functions $f: (0,\infty) \to (0,\infty)$ that satisfy the symmetry condition $f(t) = t f(1/t)$ and the normalization $f(1) = 1$. Given such a function $f$, the corresponding metric on the tangent space $T_\rho \mathcal{D}_n$ is
\[
g_\rho^f(A, B) = \operatorname{Tr}\Bigl(A^* \bigl[R_\rho \, f(L_\rho R_\rho^{-1})\bigr]^{-1}(B)\Bigr),
\]
where $L_\rho$ and $R_\rho$ are the left and right multiplication operators by $\rho$ on $M_n(\mathbb{C})$. Distinct normalized operator monotone functions give distinct monotone metrics.
\end{theorem}
papers/latex/vol-06-quantum-systems.tex:546: \begin{corollary}[Parametricity of the quantum invariant]
\label{cor:parametric}
The monotone metrics of quantum states are classified by a continuous parameter (the normalized operator monotone function), not by a discrete choice. There is no quantum analogue of Chentsov uniqueness, and any classification statement for quantum monotone metrics must accept a parametric invariant in place of a unique object.
\end{corollary}
papers/latex/vol-06-quantum-systems.tex:551: \begin{example}[Two standard metrics]
\label{ex:metrics}
The function $f(t) = (1 + t)/2$ is operator monotone and satisfies $f(1) = 1$ and $f(t) = t f(1/t)$. In the eigenbasis of $\rho$ with eigenvalues $\lambda_i$ its metric reads $g_\rho(A, A) = \sum_{i,j} 2 |A'_{ij}|^2 / (\lambda_i + \lambda_j)$ with $A' = U^* A U$, which is the metric of the symmetric logarithmic derivative. The function $f(t) = (1 + \sqrt{t})^2 / 4$ again satisfies both conditions and yields the Wigner-Yanase metric. The two metrics coincide on tangent directions commuting with $\rho$ and differ on every self-adjoint traceless direction with an off-diagonal entry in the eigenbasis of $\rho$, which is \cref{cor:parametric} in concrete form.
\end{example}
papers/latex/vol-07-gauge-qft.tex:80: \begin{definition}[Structural family IV]
\label{def:family-iv}
Family IV is the full subcategory of $\mathrm{Phys}$ whose systems carry principal bundles and connections: a principal $G$-bundle $P \to X$ with structure group $G$, a connection form $\omega$ with curvature $\Omega$, and the gauge data that acts on the pair. Representative systems are gauge theories. The established classification content of the family is the classification of bundles by homotopy classes of maps into $BG$ and the characteristic classes in $H^*(BG)$.
\end{definition}
papers/latex/vol-07-gauge-qft.tex:85: \begin{definition}[Structural family VI]
\label{def:family-vi}
Family VI is the full subcategory of $\mathrm{Phys}$ whose systems carry topological or higher-categorical structure: a symmetric monoidal functor from a cobordism category to vector spaces, or an extended version landing in higher categories. Representative systems are topological quantum field theories. The established content is the functorial theory under the Atiyah axioms; the extended classification is claimed on the strength of the cobordism hypothesis and carries a proof gap.
\end{definition}
papers/latex/vol-07-gauge-qft.tex:90: \begin{definition}[Classification data for gauge systems]
\label{def:classdata}
A gauge system is classified, up to isomorphism of principal bundles, by the homotopy class of a map $f: X \to BG$; the characteristic classes of the bundle are the pullbacks $f^*(\kappa)$ of universal classes $\kappa \in H^*(BG)$. For a semisimple gauge algebra the Lie-theoretic datum is the Dynkin diagram, and for a finite-dimensional matter representation the datum is a dominant integral weight.
\end{definition}
papers/latex/vol-07-gauge-qft.tex:97: \begin{definition}[Etingof\textendash{}Gelaki constraint]
\label{def:etingof-gelaki}
Any equivalence used to identify systems must state which layers of structure it preserves. Equivalences that forget the monoidal or symmetric layer are provably insufficient to recover the group. The counterexample behind the constraint: there exist non-isomorphic finite groups whose representation categories are equivalent as plain tensor categories, while an equivalence of symmetric tensor categories does recover the group~\cite{etingof-gelaki}. Every duality and equivalence recorded in this volume names its preserved structure.
\end{definition}
papers/latex/vol-07-gauge-qft.tex:104: \begin{example}[A gauge theory as an object of $\mathrm{Phys}$]
\label{ex:tuple}
A classical Yang\textendash{}Mills system over a compact oriented four-manifold $X$ with gauge group $G$ is recorded as follows. The state space component $X_P$ is the space of connections on a fixed principal $G$-bundle $P \to X$ modulo the gauge group $\mathcal{G}$ of vertical automorphisms. The observable component $\mathcal{O}_P$ is the algebra of gauge-invariant polynomial functions of the curvature, together with the Wilson loops on a fixed class of loops when those are taken as the observable set. The dynamical component $\mathcal{D}_P$ is the Yang\textendash{}Mills functional $F \mapsto \int_X |F_\omega|^2$ and its gradient flow or Hamiltonian formulation. The symmetry component $\mathcal{S}_P$ is the gauge group $\mathcal{G}$ acting on connections with the Gauss law constraint surface as the reduced phase space. The composition component $\mathcal{C}_P$ is the product of bundles and the coupling of matter fields in representations of $G$. The tuple is an instance of the schema. The bundle is classified by Theorem~\ref{thm:bundles}, and the gauge algebra and the matter representations by Theorems~\ref{thm:killing-cartan} and~\ref{thm:highest-weight}. The dynamics, the state quotient, and the observable algebra lie outside those theorems.
\end{example}
papers/latex/vol-07-gauge-qft.tex:152: \begin{theorem}[Killing\textendash{}Cartan classification]
\label{thm:killing-cartan}
Complex semisimple Lie algebras are classified up to isomorphism by Dynkin diagrams of types $A_r$, $B_r$, $C_r$, $D_r$, $G_2$, $F_4$, $E_6$, $E_7$, $E_8$~\cite{humphreys, serre}. Real simple Lie algebras are classified by Satake diagrams; the real forms of a given complex simple algebra $\mathfrak{g}$ correspond to the conjugacy classes of involutive automorphisms of $\mathfrak{g}$, equivalently to conjugacy classes of Cartan involutions. Connected Lie groups with Lie algebra $\mathfrak{g}$ are classified by discrete subgroups $Z'$ of the center of the universal covering group $\widetilde{G}$: each such group is a quotient $\widetilde{G}/Z'$.
\end{theorem}
papers/latex/vol-07-gauge-qft.tex:163: \begin{theorem}[Highest-weight classification]
\label{thm:highest-weight}
Let $\mathfrak{g}$ be a complex semisimple Lie algebra. Finite-dimensional irreducible representations of $\mathfrak{g}$ are in bijection with dominant integral weights; the representation with highest weight $\lambda$ exists and is unique up to isomorphism~\cite{humphreys}.
\end{theorem}
papers/latex/vol-07-gauge-qft.tex:174: \begin{example}[The gauge algebra of quantum chromodynamics]
\label{ex:su3}
Take $\mathfrak{g} = \mathfrak{su}(3)$, the Lie algebra of $\mathrm{SU}(3)$. Its Dynkin diagram is $A_2$, two nodes joined by a single edge, and the Killing\textendash{}Cartan theorem records that no other complex simple algebra carries this diagram. The real form is compact, and the corresponding real simple algebra is the compact $\mathfrak{su}(3)$ itself; the split real form $\mathfrak{sl}(3, \mathbb{R})$ is a different real form of the same complex algebra and is distinguished by its Satake diagram. The fundamental weights $\lambda_1$ and $\lambda_2$ label the defining representation $\mathbf{3}$ and its conjugate $\bar{\mathbf{3}}$, and the highest weight of the adjoint representation is $\lambda_1 + \lambda_2$, giving the octet $\mathbf{8}$. Quarks in the defining representation, antiquarks in the conjugate, and gluons in the adjoint are therefore classified as representations by the dominant integral weights of $A_2$, and the matter content of the theory is a list of weights. The classification stops there: the interaction, the renormalization, and the spectrum of bound states are outside the highest-weight theorem.
\end{example}
papers/latex/vol-07-gauge-qft.tex:193: \begin{theorem}[Classification by the classifying space]
\label{thm:bundles}
Let $G$ be a Lie group and $X$ a paracompact Hausdorff space. The map that sends a principal $G$-bundle to its classifying map induces a bijection~\cite{milnor, dold, steenrod}
\[
\mathrm{GBund}(X) \cong [X, BG],
\]
and the characteristic classes of a bundle are exactly the pullbacks along its classifying map of the universal characteristic classes in $H^*(BG)$~\cite{milnor-stasheff}.
\end{theorem}
papers/latex/vol-07-gauge-qft.tex:208: \begin{proposition}[Bundles over spheres]
\label{prop:spheres}
Let $G$ be a connected Lie group and $n \geq 1$. Isomorphism classes of principal $G$-bundles over $S^n$ are in bijection with $\pi_{n-1}(G)$.
\end{proposition}
papers/latex/vol-07-gauge-qft.tex:221: \begin{example}[Line bundles over the sphere]
\label{ex:line}
For $G = \mathrm{U}(1)$ and $n = 2$, Proposition~\ref{prop:spheres} gives $\pi_1(\mathrm{U}(1)) \cong \mathbb{Z}$, and the isomorphism class is detected by the first Chern class $c_1 \in H^2(S^2; \mathbb{Z})$. Every complex line bundle over $S^2$ is a power of the Hopf bundle, and the classification is complete and parameterized by an integer.
\end{example}
papers/latex/vol-07-gauge-qft.tex:226: \begin{example}[Instantons over the four-sphere]
\label{ex:instanton}
For $G = \mathrm{SU}(2)$ and $n = 4$, Proposition~\ref{prop:spheres} gives $\pi_3(\mathrm{SU}(2)) \cong \mathbb{Z}$, and the integer is the instanton number, computed as the second Chern class of the associated complex vector bundle. For $n = 2$ and $n = 3$ the groups $\pi_1(\mathrm{SU}(2))$ and $\pi_2(\mathrm{SU}(2))$ vanish, so every principal $\mathrm{SU}(2)$-bundle over $S^2$ or $S^3$ is trivial. The nontrivial topology appears only in the dimension where the third homotopy group of the gauge group is nontrivial.
\end{example}
papers/latex/vol-07-gauge-qft.tex:231: \begin{example}[Global forms and the second Stiefel\textendash{}Whitney class]
\label{ex:global-form}
The choice of global form of the gauge group changes the bundle classification. For $G = \mathrm{SO}(3)$ the first homotopy group is $\pi_1(\mathrm{SO}(3)) \cong \mathbb{Z}/2$, so Proposition~\ref{prop:spheres} gives two isomorphism classes of principal $\mathrm{SO}(3)$-bundles over $S^2$, detected by the second Stiefel\textendash{}Whitney class $w_2$. The nontrivial class is the bundle of tangent 2-planes, and it admits no lift to a principal $\mathrm{SU}(2)$-bundle, since $\pi_1(\mathrm{SU}(2)) = 0$ forces every $\mathrm{SU}(2)$-bundle over $S^2$ to be trivial. Matter fields in a spinorial representation therefore distinguish the global form $\mathrm{SU}(2)$ from $\mathrm{SO}(3)$, and the classification of bundles records that distinction as a cohomology class rather than as a property of the Lie algebra.
\end{example}
papers/latex/vol-07-gauge-qft.tex:243: \begin{definition}[Gauge equivalence of connections]
\label{def:gauge-equivalence}
Two connections $\omega_1$ and $\omega_2$ on a principal $G$-bundle $P \to X$ are gauge equivalent when a bundle automorphism $g: P \to P$ over the identity of $X$ satisfies $g^*\omega_2 = \omega_1$. The moduli space of connections on a fixed bundle is the quotient of the affine space of connections by this gauge action. Its singularities are the reducible connections, whose stabilizer is larger than the center of $G$, and those points obstruct a smooth quotient description.
\end{definition}
papers/latex/vol-07-gauge-qft.tex:250: \begin{proposition}[Characteristic classes of the classical groups]
\label{prop:classical-classes}
For $G = \mathrm{U}(n)$ the classifying cohomology $H^*(B\mathrm{U}(n); \mathbb{Z})$ is a polynomial ring on the Chern classes $c_1, \ldots, c_n$. For $G = \mathrm{SO}(2k+1)$ the rational cohomology $H^*(B\mathrm{SO}(2k+1); \mathbb{Q})$ is a polynomial ring on the Pontryagin classes $p_1, \ldots, p_k$. For $G = \mathrm{SO}(2k)$ the rational cohomology $H^*(B\mathrm{SO}(2k); \mathbb{Q})$ is the free polynomial ring $\mathbb{Q}[p_1, \ldots, p_{k-1}, e]$; the top Pontryagin class is the element $p_k = e^2$ and is not an independent generator. For $G = \mathrm{SU}(n)$ the class $c_1$ vanishes and $H^*(B\mathrm{SU}(n); \mathbb{Z})$ is a polynomial ring on $c_2, \ldots, c_n$.
\end{proposition}
papers/latex/vol-07-gauge-qft.tex:266: \begin{definition}[Fermionic anomaly]
\label{def:fermionic-anomaly}
Let $M$ be a compact spin manifold, $P \to M$ a principal $G$-bundle with $G$ a compact Lie group, $\mathcal{A}$ the space of connections on $P$, and $\mathcal{G}$ the gauge group acting on $\mathcal{A}$. The determinant line of a family of Dirac operators assigns to each connection $A$ the determinant line of $D_A$, and these lines assemble into a complex line bundle $\lambda_{\mathrm{det}}$ over the gauge orbit space $\mathcal{A}/\mathcal{G}$, or over $\mathcal{A}$ when the family is lifted~\cite{quillen, atiyah-singer}. The fermionic anomaly is the obstruction to trivializing $\lambda_{\mathrm{det}}$, or its Pfaffian square root in the Majorana case. The theory is consistent only where the line bundle is trivializable.
\end{definition}
papers/latex/vol-07-gauge-qft.tex:271: \begin{definition}[BV-BRST gauge anomaly]
\label{def:bvbrst-anomaly}
Let $n$ be the spacetime dimension. The BV-BRST gauge anomaly is the obstruction class in the local BRST cohomology $H^{1,n}(s\mid d)$: the cohomology of the BRST differential $s$ on local functionals of the fields and ghosts, modulo total spacetime derivatives $d$, at ghost number one and form degree $n$. The class satisfies the Wess\textendash{}Zumino consistency condition~\cite{wess-zumino, bbh}. The Chevalley\textendash{}Eilenberg complex $\mathrm{CE}(\mathfrak{g})$ of the gauge algebra computes the zero-form part of the BRST double complex: $H^1(\mathrm{CE}(\mathfrak{g}))$ classifies the abelian quotients of $\mathfrak{g}$, and $H^2(\mathrm{CE}(\mathfrak{g}))$ its central extensions.
\end{definition}
papers/latex/vol-07-gauge-qft.tex:276: \begin{proposition}[Quantization gate]
\label{prop:anomaly}
A gauge theory admits a consistent quantization only where the determinant line $\lambda_{\mathrm{det}}$ of the Dirac family is trivializable and its anomaly cocycle $[a]$ vanishes in the local BRST cohomology $H^{1,n}(s\mid d)$. The group $H^{1,n}(s\mid d)$ is the space of candidate anomalies of the theory; the specific cocycle $[a]$ is the anomaly of the theory at hand. These two vanishing conditions are the classification content of the anomaly: the obstruction classes are natural in the gauge configuration and classify the inconsistent directions.
\end{proposition}
papers/latex/vol-07-gauge-qft.tex:287: \begin{example}[Algebraic obstruction data of a gauge algebra]
\label{ex:abelian-anomaly}
Take the gauge algebra to be the two-dimensional non-abelian algebra with basis $e_1, e_2$ and bracket $[e_1, e_2] = e_2$. The Chevalley\textendash{}Eilenberg differential on the dual basis $e^1, e^2$ is $d e^1 = 0$ and $d e^2 = -e^1 \wedge e^2$. The class of $e^1$ in $H^1(\mathrm{CE}(\mathfrak{g}))$ is closed and not exact, so $H^1$ is nonzero and the algebra has a nontrivial abelian quotient; $H^2$ vanishes because $d$ maps the span of $e^2$ onto the whole of $\Lambda^2$. This computation is the algebraic shadow of Definition~\ref{def:bvbrst-anomaly}: the full field-theory anomaly of a gauge theory over a spacetime is computed in the local cohomology $H^{1,n}(s\mid d)$, and the Chevalley\textendash{}Eilenberg classes record the abelian-quotient and central-extension data of the gauge algebra alone. The computation is reproduced by the Chevalley\textendash{}Eilenberg experiment of Section~\ref{sec:experiments}.
\end{example}
papers/latex/vol-07-gauge-qft.tex:294: \begin{proposition}[Anomaly cancellation as a linear condition]
\label{prop:cancellation}
Fix a compact simple gauge group $G$ and let the matter content be a finite list of finite-dimensional irreducible representations $R_1, \ldots, R_k$ with highest weights $\lambda_1, \ldots, \lambda_k$. The contribution of each representation to a fixed anomaly class is additive, so there is a homomorphism of abelian groups
\[
\alpha \colon R(G) \longrightarrow A,
\]
from the representation ring of $G$ to the coefficient group $A$ of the anomaly in question, and the anomaly-free matter lists form $\ker \alpha$. For the four-dimensional perturbative gauge anomaly $A = \mathbb{Z}$ and $\alpha(R)$ is the anomaly coefficient of $R$; for global anomalies $A$ is the relevant cobordism group of $G$. The admissible matter lists are cut out by linear conditions on the weight data, computable from Theorem~\ref{thm:highest-weight} and Proposition~\ref{prop:anomaly} together.
\end{proposition}
papers/latex/vol-07-gauge-qft.tex:314: \begin{theorem}[Two-dimensional topological field theories]
\label{thm:frobenius}
The category of two-dimensional Atiyah topological quantum field theories with values in vector spaces is equivalent to the category of commutative Frobenius algebras~\cite{atiyah-tqft}.
\end{theorem}
papers/latex/vol-07-gauge-qft.tex:350: \begin{definition}[Local net]
\label{def:local-net}
A local net on Minkowski spacetime assigns to each double cone $\mathcal{O}$ a unital $\mathrm{C}^*$-algebra $\mathcal{A}(\mathcal{O})$ such that isotony holds for inclusions $\mathcal{O}_1 \subset \mathcal{O}_2$, graded locality holds for spacelike separation, the Poincar\'e group acts by automorphisms covariantly, the spectrum of the generator of time translations is contained in the closed forward cone, and a vacuum state exists~\cite{haag-kastler}. A representation of the net is a representation of the quasilocal algebra $\mathcal{A}$ that is generated by the local algebras.
\end{definition}
papers/latex/vol-07-gauge-qft.tex:355: \begin{definition}[DHR criterion]
\label{def:dhr}
A representation $\pi$ of a local net satisfies the DHR criterion when its restriction to the algebra of the causal complement of every bounded region is equivalent to the vacuum representation~\cite{dhr}. Two such representations are equivalent when a unitary intertwiner exists.
\end{definition}
papers/latex/vol-07-gauge-qft.tex:364: \begin{theorem}[Doplicher\textendash{}Roberts reconstruction]
\label{thm:dr}
Let $\mathcal{C}$ be a symmetric tensor $\mathrm{C}^*$-category with conjugates, direct sums, subobjects, and $\mathrm{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent to the category of finite-dimensional unitary representations of a compact group $G$ equipped with a distinguished central element $k$ of order at most two, $k^2 = e$, whose adjoint action implements the $\mathbb{Z}/2$ grading of the statistics; in the graded language this data is a compact supergroup. The pair $(G, k)$ is unique up to isomorphism~\cite{dr, dhr}. Applied to the DHR category of a local net satisfying Haag duality, the theorem reconstructs a compact gauge group from the superselection sectors.
\end{theorem}
papers/latex/vol-07-gauge-qft.tex:377: \begin{theorem}[Deligne's theorem]
\label{thm:deligne}
An abelian, $k$-linear, rigid symmetric monoidal category over an algebraically closed field of characteristic zero, with $\mathrm{End}(\mathbf{1}) = k$ and subexponential growth, is equivalent to the category of representations of an affine supergroup scheme~\cite{deligne}.
\end{theorem}
papers/latex/vol-07-gauge-qft.tex:398: \begin{theorem}[Reconstruction from commutative probes]
\label{thm:gelfand}
The Gelfand\textendash{}Naimark theorem embeds every $\mathrm{C}^*$-algebra in an algebra of operators on a Hilbert space, and for commutative $\mathrm{C}^*$-algebras the Gelfand transform is an isomorphism onto the continuous functions on the Gelfand spectrum~\cite{gelfand-naimark}. Stone duality is the Boolean analogue: a Boolean algebra is recovered from its space of ultrafilters~\cite{stone}. In each case the object is determined by its commutative or Boolean probe data.
\end{theorem}
papers/latex/vol-09-gravity-information-geometry.tex:79: \begin{definition}[Statistical model]
\label{def:stat-model}
A statistical model is a finite set $\Omega = \{1, \dots, n\}$ and an open subset $M$ of the interior of the probability simplex $\Delta_{n-1}$. A point $p \in M$ is a strictly positive probability vector, and the tangent space at $p$ is identified with the subspace of $\mathbb{R}^n$ of vectors $u$ with $\sum_i u_i = 0$.
\end{definition}
papers/latex/vol-09-gravity-information-geometry.tex:84: \begin{definition}[Fisher metric]
\label{def:fisher}
The Fisher metric of a statistical model $M$ assigns to each $p \in M$ the bilinear form
\begin{equation}
g_p(u, v) = \sum_{i=1}^{n} \frac{u_i v_i}{p_i}.
\end{equation}
It is a Riemannian metric on $M$, positive definite on tangent vectors.
\end{definition}
papers/latex/vol-09-gravity-information-geometry.tex:93: \begin{definition}[Stochastic map and monotone metric]
\label{def:stochastic}
A stochastic map is an $m \times n$ matrix $\varphi$ with $\varphi_{ji} \geq 0$ and $\sum_{j} \varphi_{ji} = 1$ for every $i$, acting on distributions by $p \mapsto \varphi p$ where $(\varphi p)_j = \sum_i \varphi_{ji} p_i$. A monotone metric is a family $\{g^{(n)}\}_{n \geq 2}$ of smooth Riemannian metrics, one on each open simplex $\Delta_{n-1}^{\circ}$, such that for every stochastic map $\varphi$ and every tangent vector $u$ at $p \in \Delta_{n-1}^{\circ}$ with $\varphi p \in \Delta_{m-1}^{\circ}$,
\begin{equation}
g^{(m)}_{\varphi p}(D\varphi \cdot u, \; D\varphi \cdot u) \leq g^{(n)}_p(u, u).
\end{equation}
Monotonicity says that processing cannot increase statistical distinguishability. The Fisher family of \cref{def:fisher}, one Fisher metric per simplex, is monotone by \cref{prop:monotone}. The cross-dimensional quantifier is essential: on a fixed simplex alone, uniqueness of the monotone metric fails already at $n = 2$, where the flat metric $g_p(u,u) = u_1^2 + u_2^2$ on $\Delta_1^{\circ}$ also satisfies the inequality, and stochastic maps between simplices of different sizes are what eliminate it.
\end{definition}
papers/latex/vol-09-gravity-information-geometry.tex:102: \begin{definition}[Quantum state space]
\label{def:quantum-states}
For $d \geq 2$ let $\mathcal{D}_d$ be the set of density operators on $\mathbb{C}^d$, that is, the positive semidefinite Hermitian matrices of trace one. The interior $\mathcal{D}_d^{\circ}$ consists of the full-rank states; it is a smooth manifold of dimension $d^2 - 1$. A tangent vector at $\rho$ is a traceless Hermitian matrix $X$. A completely positive trace-preserving map (channel) $\Phi : \mathcal{D}_d \to \mathcal{D}_{m}$ acts on states in the usual way and is the quantum image of a stochastic map.
\end{definition}
papers/latex/vol-09-gravity-information-geometry.tex:107: \begin{definition}[Monotone metric on quantum states]
\label{def:quantum-monotone}
A monotone metric is a family $\{g^{(d)}\}$ of Riemannian metrics, one on each $\mathcal{D}_d^{\circ}$, such that for every channel $\Phi : \mathcal{D}_d \to \mathcal{D}_m$, every full-rank state $\rho \in \mathcal{D}_d^{\circ}$ with $\Phi(\rho) \in \mathcal{D}_m^{\circ}$, and every tangent vector $X$ at $\rho$,
\begin{equation}
g^{(m)}_{\Phi(\rho)}(D\Phi \cdot X, \; D\Phi \cdot X) \leq g^{(d)}_{\rho}(X, X).
\end{equation}
Invariance under unitary conjugation is not an extra hypothesis: $\rho \mapsto U \rho U^{\dagger}$ is a channel with channel inverse $\rho \mapsto U^{\dagger} \rho U$, so monotonicity in both directions forces invariance. The same argument applies to permutations of coordinates in \cref{def:stochastic}.
\end{definition}
papers/latex/vol-09-gravity-information-geometry.tex:116: \begin{definition}[Symmetric logarithmic derivative]
\label{def:sld}
Let $\rho \in \mathcal{D}_d^{\circ}$ and let $X$ be a tangent vector at $\rho$. The symmetric logarithmic derivative of $X$ at $\rho$ is the unique Hermitian matrix $L$ with
\begin{equation}
X = \frac{\rho L + L \rho}{2}.
\end{equation}
The symmetric logarithmic derivative metric is $g^{\mathrm{sld}}_{\rho}(X, X) = \operatorname{Tr}(X L)$.
\end{definition}
papers/latex/vol-09-gravity-information-geometry.tex:125: \begin{definition}[Operator monotone function and the Petz family]
\label{def:petz}
A function $f : (0, \infty) \to (0, \infty)$ is normalized operator monotone when it is operator monotone (the Loewner order is preserved on positive matrices), and satisfies $f(1) = 1$ and $f(t) = t f(1/t)$ for all $t > 0$. For such an $f$, the Petz metric \cite{petz-1996} $g^{f}$ on $\mathcal{D}_d^{\circ}$ is given in an orthonormal eigenbasis $\rho = \sum_i \lambda_i |i\rangle\langle i|$ by
\begin{equation}
\label{eq:petz}
g^{f}_{\rho}(X, X) = \sum_{i,j} \frac{|X_{ij}|^2}{\lambda_i f(\lambda_j / \lambda_i)},
\end{equation}
where $X_{ij} = \langle i | X | j \rangle$. The condition $f(1) = 1$ fixes the scale: it is equivalent to the metric restricting to the classical Fisher value on diagonal tangent vectors. Without that condition the formula is homogeneous of degree $-1$ in $f$ and classifies metrics only up to a positive constant.
\end{definition}
papers/latex/vol-09-gravity-information-geometry.tex:135: \begin{definition}[Fidelity metric]
\label{def:fidelity}
The Uhlmann fidelity \cite{uhlmann} of two states is
\begin{equation}
F(\rho, \sigma) = \bigl(\operatorname{Tr}\sqrt{\sqrt{\rho}\, \sigma \sqrt{\rho}}\bigr)^2.
\end{equation}
The fidelity distance $d_B$ is defined by $d_B(\rho, \sigma)^2 = 2\bigl(1 - \sqrt{F(\rho, \sigma)}\bigr)$. Where the induced Riemannian metric exists we call it the fidelity metric $g^{\mathrm{fid}}$. In this normalization $g^{\mathrm{fid}}$ equals one quarter of the symmetric logarithmic derivative metric in every dimension. The identity follows by expanding $d_B^2(\rho, \rho + d\rho) = 2(1 - \operatorname{Tr}\sqrt{\sqrt{\rho}(\rho + d\rho)\sqrt{\rho}})$ to second order and solving the Lyapunov equation $(\rho + d\rho) L + L (\rho + d\rho) = 2 \, d\rho$ for the symmetric logarithmic derivative of $d\rho$: the expansion yields $\tfrac{1}{4} \operatorname{Tr}(\rho L^2)$ at any full-rank state \cite{hubner, braunstein-caves}. \Cref{prop:qubit-fid} verifies the identity by direct computation on qubit states, and the code of \cref{sec:computation} checks it numerically in dimensions two to four. The fidelity metric is therefore not a member of the normalized Petz family but a positive multiple of one.
\end{definition}
papers/latex/vol-09-gravity-information-geometry.tex:144: \begin{definition}[Ruppeiner metric]
\label{def:ruppeiner}
Let $S(U, V, N)$ be the entropy of a thermodynamic system with internal energy $U$, volume $V$, and particle number $N$. Physical entropy is homogeneous of degree one in its extensive variables, so the full Hessian in $(U, V, N)$ is singular along the extensive direction by the Gibbs-Duhem relation, and strict concavity in all extensive variables cannot hold. The Ruppeiner metric is defined on a two-dimensional slice: fix $N$ (as this paper does) or pass to specific variables, and set
\begin{equation}
g^{\mathrm{rup}}_{ij} = -\frac{\partial^2 S}{\partial X^i \partial X^j}
\end{equation}
in the remaining extensive coordinates $X^i$. Its scalar curvature $R$ is computed with the standard Ricci convention, in which the round two-sphere has $R = +2$; the convention of Ruppeiner \cite{ruppeiner} carries the opposite sign. The construction is that of Ruppeiner \cite{ruppeiner}; the metric of Weinhold \cite{weinhold} is the Hessian of internal energy and differs by a conformal factor in the standard thermodynamic setting.
\end{definition}
papers/latex/vol-09-gravity-information-geometry.tex:153: \begin{definition}[Entanglement wedge]
\label{def:wedge}
Fix a boundary spatial region $A$ of a conformal field theory state dual to a bulk asymptotically anti-de Sitter spacetime, and a Cauchy slice $\Sigma$. The surface $A \cup \gamma_A$ bounds a spatial homology region $\Sigma_A \subset \Sigma$, where $\gamma_A$ is the extremal surface homologous to $A$ (minimal in static slices) \cite{hrt}. The entanglement wedge $W(A)$ is the domain of dependence of $\Sigma_A$. Entanglement-wedge reconstruction is the statement that bulk operators localized in $W(A)$ can be represented by operators of the boundary subregion $A$.
\end{definition}
papers/latex/vol-09-gravity-information-geometry.tex:158: \begin{definition}[Geometric correspondence]
\label{def:correspondence}
A geometric correspondence assigns to data $D$ of a physical or statistical system a Riemannian geometry $G(D)$, and optionally a relation between the curvature of $G(D)$ and physical quantities of the system. The correspondence is a proposed dictionary until both assignments are theorems; each assignment must state its domain, its codomain, and the structure it preserves.
\end{definition}
papers/latex/vol-09-gravity-information-geometry.tex:175: \begin{lemma}[Fisher metric and relative entropy]
\label{lem:kl}
Let $p$ be an interior point of the simplex and let $u$ be a tangent vector at $p$ with $\sum_i u_i = 0$. For the Kullback-Leibler divergence $D(p + u \,\|\, p) = \sum_i (p_i + u_i) \log \frac{p_i + u_i}{p_i}$ one has
\begin{equation}
D(p + u \,\|\, p) = \frac{1}{2} g_p(u, u) + O(\|u\|^3).
\end{equation}
The Fisher metric is the second-order term of the relative entropy at the diagonal.
\end{lemma}
papers/latex/vol-09-gravity-information-geometry.tex:191: \begin{proposition}[Monotonicity of the Fisher metric]
\label{prop:monotone}
The Fisher metric is monotone under stochastic maps.
\end{proposition}
papers/latex/vol-09-gravity-information-geometry.tex:221: \begin{theorem}[Chentsov]
\label{thm:chentsov}
On the probability simplices, the Fisher family is the unique family of Riemannian metrics, up to a single positive constant shared across dimensions, that is monotone under stochastic maps.
\end{theorem}
papers/latex/vol-09-gravity-information-geometry.tex:238: \begin{theorem}[Petz-Sud\'ar]
\label{thm:petz-sudar}
Monotone metric families $\{g^{(d)}\}_{d \geq 2}$ in the sense of \cref{def:quantum-monotone} correspond exactly to functions $f : (0, \infty) \to (0, \infty)$ that are operator monotone of all matrix orders and satisfy $f(t) = t f(1/t)$, by the formula \eqref{eq:petz} in each dimension \cite{petz-1996, petz-sudar-jmp}. The correspondence is a bijection after the normalization $f(1) = 1$, which is equivalent to restricting to the Fisher value on diagonal tangent vectors; without the normalization, metrics correspond to $f$ only up to a positive constant. In particular the symmetric logarithmic derivative metric of \cref{def:sld} corresponds to $f(t) = (1+t)/2$, and there are infinitely many monotone metrics.
\end{theorem}
papers/latex/vol-09-gravity-information-geometry.tex:245: \begin{proposition}[Non-uniqueness on qubit states]
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
papers/latex/vol-09-gravity-information-geometry.tex:273: \begin{proposition}[Commutative locus]
\label{prop:commutative}
For every normalized operator monotone $f$ and every full-rank diagonal $\rho = \sum_i \lambda_i |i\rangle\langle i|$, the restriction of $g^{f}$ to diagonal tangent vectors is the Fisher value:
\begin{equation}
g^{f}_{\rho}(X, X) = \sum_i \frac{X_{ii}^2}{\lambda_i}.
\end{equation}
More generally the restriction of any monotone metric to commuting states is a classical monotone metric, hence $c \cdot g^{\mathrm{fisher}}$ for some $c > 0$ by Chentsov's theorem (\cref{thm:chentsov}); in the Petz family $c = 1/f(1)$, so the normalization $f(1) = 1$ forces $c = 1$. Every normalized monotone metric restricts to the Fisher metric on the commutative locus.
\end{proposition}
papers/latex/vol-09-gravity-information-geometry.tex:303: \begin{proposition}[Symmetric logarithmic derivative geometry of the qubit]
\label{prop:qubit-sld}
In Bloch coordinates the symmetric logarithmic derivative metric is
\begin{equation}
\label{eq:qubit-sld}
g^{\mathrm{sld}} = |d\vec{r}|^2 + \frac{(\vec{r} \cdot d\vec{r})^2}{1 - |\vec{r}|^2}.
\end{equation}
In spherical coordinates $|\vec{r}| = r = \sin\chi$ this becomes $g^{\mathrm{sld}} = (d\chi)^2 + \sin^2\!\chi \, (d\Omega)^2$ with $\chi \in (0, \pi/2)$: the open state space $\mathcal{D}_2^{\circ}$ is isometric to an open hemisphere of the round three-sphere of radius one, of constant sectional curvature one.
\end{proposition}
papers/latex/vol-09-gravity-information-geometry.tex:323: \begin{proposition}[Fidelity metric of the qubit]
\label{prop:qubit-fid}
On $\mathcal{D}_2^{\circ}$ the fidelity metric satisfies $g^{\mathrm{fid}} = \tfrac{1}{4} g^{\mathrm{sld}}$. Consequently the open state space with the fidelity metric is an open hemisphere of the round three-sphere of radius one half, of constant sectional curvature four.
\end{proposition}
papers/latex/vol-09-gravity-information-geometry.tex:352: \begin{corollary}[Fisher geometry of the full simplex]
\label{cor:homogeneity}
The Fisher metric on the interior of $\Delta_{n-1}$ is locally isometric to the round sphere of radius two, with sectional curvature $1/4$ for $n \geq 3$, and the arc of \cref{rem:bernoulli} for $n = 2$. The isometry group of the full model is the finite group of coordinate permutations. Two statistical models defined on the full simplex with the same number of outcomes are isometric as Riemannian manifolds, and a permutation of outcomes is an isometry.
\end{corollary}
papers/latex/vol-09-gravity-information-geometry.tex:363: \begin{definition}[Statistical submodel]
\label{def:submodel}
A statistical submodel is a smooth embedding $i : M' \to \Delta_{n-1}^{\circ}$ of a lower-dimensional manifold $M'$ into the simplex, with the pullback metric $g' = i^{*} g^{\mathrm{fisher}}$. The intrinsic and extrinsic curvature invariants of $(M', g')$ are invariants of the model. Exponential families are the canonical submodels.
\end{definition}
papers/latex/vol-09-gravity-information-geometry.tex:393: \begin{theorem}[Gelfand-Naimark and Gelfand duality]
\label{thm:gelfand}
Every commutative unital $C^*$-algebra is isometrically $*$-isomorphic to $C(X)$ for a compact Hausdorff space $X$, its Gelfand spectrum; contravariantly, the categories of commutative unital $C^*$-algebras and of compact Hausdorff spaces are dual \cite{gn}. In particular the space $X$ is recovered from the algebra of observables $\mathcal{O} = C(X)$ alone.
\end{theorem}
papers/latex/vol-09-gravity-information-geometry.tex:398: \begin{theorem}[Stone duality]
\label{thm:stone}
Boolean algebras are dual to compact totally disconnected Hausdorff spaces \cite{stone}; the space is recovered from the algebra of clopen sets.
\end{theorem}
papers/latex/vol-09-gravity-information-geometry.tex:405: \begin{definition}[Probe data and reconstruction]
\label{def:probe}
Probe data of an object $P$ is a family of measurements or relationships $\{\phi_i(P)\}$ indexed by probes $\phi_i$; a reconstruction theorem assigns to the probe data an object $\hat{P}$ together with an isomorphism $\hat{P} \cong P$ in a stated category. The theorem is classification-grade only when the probes are a complete invariant, that is, when $\hat{P} \cong \hat{Q}$ implies $P \cong Q$ in the stated category for all objects in scope.
\end{definition}
papers/latex/vol-09-gravity-information-geometry.tex:415: \begin{theorem}[Entanglement-wedge reconstruction, Dong-Harlow-Wall]
\label{thm:dhw}
Let a boundary region $A$ and a code subspace of states be given in the holographic setting, with bulk geometry dual to a state in that subspace. Every bulk operator localized in the entanglement wedge $W(A)$ can be reconstructed as an operator of the boundary subregion $A$ acting on the code subspace; the reconstruction preserves expectation values on that subspace \cite{dhw}. The result is a theorem of quantum information theory (quantum error correction and relative entropy), proved under the stated hypotheses of the holographic code setup.
\end{theorem}
papers/latex/vol-09-gravity-information-geometry.tex:451: \begin{theorem}[Holographic entropy cone]
\label{thm:cone}
In static holographic settings with $N$ boundary subregions of a state purified by a complement \cite{bao}, the complete linear entropy inequalities for $N = 2, 3, 4$ are generated by subadditivity, the Araki-Lieb inequalities, and monogamy of mutual information. For $N = 5$ five further symmetry orbits of five-party inequalities, including the cyclic five-party inequality, are required, and the resulting description is complete \cite{hc5}. For six and more regions the complete inequality set is unknown. For each fixed $N$ there are only finitely many independent inequalities.
\end{theorem}
papers/latex/vol-09-gravity-information-geometry.tex:470: \begin{proposition}[Ideal gas]
\label{prop:ideal-gas}
For the ideal gas with entropy $S(U, V, N) = Nk \bigl(c_v \log U + \log V - (c_v + 1) \log N + \text{const}\bigr)$ at fixed $N$ and heat capacity coefficient $c_v$, the Ruppeiner metric in the coordinates $(U, V)$ is
\begin{equation}
g^{\mathrm{rup}} = Nk \left( c_v \frac{(dU)^2}{U^2} + \frac{(dV)^2}{V^2} \right),
\end{equation}
which is flat: its scalar curvature vanishes identically.
\end{proposition}

exec
/usr/local/bin/zsh -lc "sed -n '1,70p' lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/List/Defs.lean; rg -n 'map_list_prod|map_list_sum' lean/.lake/packages/mathlib/Mathlib/Algebra/Group -g '*.lean' | head -15; rg -n 'theorem|lemma|def ' lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
/-
Copyright (c) 2017 Johannes Hölzl. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Johannes Hölzl, Floris van Doorn, Sébastien Gouëzel, Alex J. Best
-/
module

public import Batteries.Data.List.Lemmas
public import Mathlib.Algebra.Group.Monoid

/-!
# Sums and products from lists

This file provides basic definitions for `List.prod`, `List.sum`,
which calculate the product and sum of elements of a list
and `List.alternatingProd`, `List.alternatingSum`, their alternating counterparts.
-/

@[expose] public section

variable {ι M N : Type*}

namespace List
section Defs

attribute [to_additive existing] prod prod_nil prod_cons prod_one_cons prod_append prod_concat
  prod_flatten prod_eq_foldl prod_reverse

/-- The alternating sum of a list. -/
def alternatingSum {G : Type*} [Zero G] [Add G] [Neg G] : List G → G
  | [] => 0
  | g :: [] => g
  | g :: h :: t => g + -h + alternatingSum t

/-- The alternating product of a list. -/
@[to_additive existing]
def alternatingProd {G : Type*} [One G] [Mul G] [Inv G] : List G → G
  | [] => 1
  | g :: [] => g
  | g :: h :: t => g * h⁻¹ * alternatingProd t

end Defs

section Mul

variable [Mul M] [One M] {a : M} {l : List M}

@[to_additive]
lemma prod_induction
    (p : M → Prop) (hom : ∀ a b, p a → p b → p (a * b)) (unit : p 1) (base : ∀ x ∈ l, p x) :
    p l.prod := by
  induction l with
  | nil => simpa
  | cons a l ih =>
    rw [List.prod_cons]
    simp only [mem_cons, forall_eq_or_imp] at base
    exact hom _ _ (base.1) (ih base.2)

end Mul

section MulOneClass

variable [MulOneClass M] {l : List M} {a : M}

@[to_additive]
theorem prod_map_one {l : List ι} :
    (l.map fun _ => (1 : M)).prod = 1 := by
  induction l with simp [*]

@[to_additive]
lean/.lake/packages/mathlib/Mathlib/Algebra/Group/Submonoid/BigOperators.lean:41:  map_list_prod (SubmonoidClass.subtype S : _ →* M) l
lean/.lake/packages/mathlib/Mathlib/Algebra/Group/Submonoid/BigOperators.lean:99:  map_list_prod s.subtype l
lean/.lake/packages/mathlib/Mathlib/Algebra/Group/Pointwise/Set/BigOperators.lean:127:  (map_list_prod (singletonMonoidHom : M →* Set M) _).symm
lean/.lake/packages/mathlib/Mathlib/Algebra/Group/Pointwise/Finset/Basic.lean:876:  map_list_prod (coeMonoidHom : Finset α →* Set α) _
64:def upperSet (α : Type*) [Preorder α] : TopologicalSpace α where
74:def lowerSet (α : Type*) [Preorder α] : TopologicalSpace α where
81:def WithUpperSet (α : Type*) := α
86:@[match_pattern] def toUpperSet : α ≃ WithUpperSet α := Equiv.refl _
89:@[match_pattern] def ofUpperSet : WithUpperSet α ≃ α := Equiv.refl _
91:@[simp] lemma toUpperSet_symm : (@toUpperSet α).symm = ofUpperSet := rfl
92:@[simp] lemma ofUpperSet_symm : (@ofUpperSet α).symm = toUpperSet := rfl
93:@[simp] lemma toUpperSet_ofUpperSet (a : WithUpperSet α) : toUpperSet (ofUpperSet a) = a := rfl
94:@[simp] lemma ofUpperSet_toUpperSet (a : α) : ofUpperSet (toUpperSet a) = a := rfl
95:lemma toUpperSet_inj {a b : α} : toUpperSet a = toUpperSet b ↔ a = b := Iff.rfl
96:lemma ofUpperSet_inj {a b : WithUpperSet α} : ofUpperSet a = ofUpperSet b ↔ a = b := Iff.rfl
100:protected def rec {motive : WithUpperSet α → Sort*} (toUpperSet : ∀ a, motive (toUpperSet a)) :
114:lemma ofUpperSet_le_iff {a b : WithUpperSet α} : ofUpperSet a ≤ ofUpperSet b ↔ a ≤ b := Iff.rfl
115:lemma toUpperSet_le_iff {a b : α} : toUpperSet a ≤ toUpperSet b ↔ a ≤ b := Iff.rfl
118:def ofUpperSetOrderIso : WithUpperSet α ≃o α where
123:def toUpperSetOrderIso : α ≃o WithUpperSet α where
130:def WithLowerSet (α : Type*) := α
135:@[match_pattern] def toLowerSet : α ≃ WithLowerSet α := Equiv.refl _
138:@[match_pattern] def ofLowerSet : WithLowerSet α ≃ α := Equiv.refl _
140:@[simp] lemma toLowerSet_symm : (@toLowerSet α).symm = ofLowerSet := rfl
141:@[simp] lemma ofLowerSet_symm : (@ofLowerSet α).symm = toLowerSet := rfl
142:@[simp] lemma toLowerSet_ofLowerSet (a : WithLowerSet α) : toLowerSet (ofLowerSet a) = a := rfl
143:@[simp] lemma ofLowerSet_toLowerSet (a : α) : ofLowerSet (toLowerSet a) = a := rfl
144:lemma toLowerSet_inj {a b : α} : toLowerSet a = toLowerSet b ↔ a = b := Iff.rfl
145:lemma ofLowerSet_inj {a b : WithLowerSet α} : ofLowerSet a = ofLowerSet b ↔ a = b := Iff.rfl
149:protected def rec {motive : WithLowerSet α → Sort*} (toLowerSet : ∀ a, motive (toLowerSet a)) :
163:lemma ofLowerSet_le_iff {a b : WithLowerSet α} : ofLowerSet a ≤ ofLowerSet b ↔ a ≤ b := Iff.rfl
164:lemma toLowerSet_le_iff {a b : α} : toLowerSet a ≤ toLowerSet b ↔ a ≤ b := Iff.rfl
167:def ofLowerSetOrderIso : WithLowerSet α ≃o α where
172:def toLowerSetOrderIso : α ≃o WithLowerSet α where
181:def WithUpperSet.toDualHomeomorph [Preorder α] : WithUpperSet α ≃ₜ WithLowerSet αᵒᵈ where
226:lemma topology_eq : ‹_› = upperSet α := topology_eq_upperSetTopology
236:def WithUpperSetHomeomorph : WithUpperSet α ≃ₜ α :=
239:lemma isOpen_iff_isUpperSet : IsOpen s ↔ IsUpperSet s := by
247:lemma isClosed_iff_isLower : IsClosed s ↔ IsLowerSet s := by
251:lemma closure_eq_lowerClosure {s : Set α} : closure s = lowerClosure s := by
262:@[simp] lemma closure_singleton {a : α} : closure {a} = Iic a := by
266:lemma specializes_iff_le {a b : α} : a ⤳ b ↔ b ≤ a := by
269:lemma nhdsKer_eq_upperClosure (s : Set α) : nhdsKer s = ↑(upperClosure s) := by
272:@[simp] lemma nhdsKer_singleton (a : α) : nhdsKer {a} = Ici a := by
275:lemma nhds_eq_principal_Ici (a : α) : 𝓝 a = 𝓟 (Ici a) := by
278:lemma nhdsSet_eq_principal_upperClosure (s : Set α) : 𝓝ˢ s = 𝓟 ↑(upperClosure s) := by
283:protected lemma _root_.Topology.isUpperSet_iff_nhds {α : Type*} [TopologicalSpace α] [Preorder α] :
297:protected lemma monotone_iff_continuous [TopologicalSpace α] [TopologicalSpace β]
310:lemma monotone_to_upperTopology_continuous [TopologicalSpace α] [TopologicalSpace β]
316:lemma upperSet_le_upper {t₁ t₂ : TopologicalSpace α} [@Topology.IsUpperSet α t₁ _]
332:lemma topology_eq : ‹_› = lowerSet α := topology_eq_lowerSetTopology
341:def WithLowerSetHomeomorph : WithLowerSet α ≃ₜ α :=
344:lemma isOpen_iff_isLowerSet : IsOpen s ↔ IsLowerSet s := by rw [topology_eq α]; rfl
348:lemma isClosed_iff_isUpper : IsClosed s ↔ IsUpperSet s := by
351:lemma closure_eq_upperClosure {s : Set α} : closure s = upperClosure s :=
358:@[simp] lemma closure_singleton {a : α} : closure {a} = Ici a := by
362:lemma specializes_iff_le {a b : α} : a ⤳ b ↔ a ≤ b := by
365:lemma nhdsKer_eq_lowerClosure (s : Set α) : nhdsKer s = ↑(lowerClosure s) := by
368:@[simp] lemma nhdsKer_singleton (a : α) : nhdsKer {a} = Iic a := by
371:lemma nhds_eq_principal_Iic (a : α) : 𝓝 a = 𝓟 (Iic a) := by
374:lemma nhdsSet_eq_principal_lowerClosure (s : Set α) : 𝓝ˢ s = 𝓟 ↑(lowerClosure s) := by
379:protected lemma _root_.Topology.isLowerSet_iff_nhds {α : Type*} [TopologicalSpace α] [Preorder α] :
391:protected lemma monotone_iff_continuous [TopologicalSpace α] [TopologicalSpace β]
397:lemma monotone_to_lowerTopology_continuous [TopologicalSpace α] [TopologicalSpace β]
401:lemma lowerSet_le_lower {t₁ t₂ : TopologicalSpace α} [@Topology.IsLowerSet α t₁ _]
410:lemma isUpperSet_orderDual [Preorder α] [TopologicalSpace α] :
416:lemma isLowerSet_orderDual [Preorder α] [TopologicalSpace α] :
424:def map (f : α →o β) : C(WithUpperSet α, WithUpperSet β) where
428:@[simp] lemma map_id : map (OrderHom.id : α →o α) = ContinuousMap.id _ := rfl
429:@[simp] lemma map_comp (g : β →o γ) (f : α →o β) : map (g.comp f) = (map g).comp (map f) := rfl
431:@[simp] lemma toUpperSet_specializes_toUpperSet {a b : α} :
436:@[simp] lemma ofUpperSet_le_ofUpperSet {a b : WithUpperSet α} :
439:@[simp] lemma isUpperSet_toUpperSet_preimage {s : Set (WithUpperSet α)} :
442:@[simp] lemma isOpen_ofUpperSet_preimage {s : Set α} :
452:def map (f : α →o β) : C(WithLowerSet α, WithLowerSet β) where
456:@[simp] lemma map_id : map (OrderHom.id : α →o α) = ContinuousMap.id _ := rfl
457:@[simp] lemma map_comp (g : β →o γ) (f : α →o β) : map (g.comp f) = (map g).comp (map f) := rfl
459:@[simp] lemma toLowerSet_specializes_toLowerSet {a b : α} :
464:@[simp] lemma ofLowerSet_le_ofLowerSet {a b : WithLowerSet α} :
467:@[simp] lemma isLowerSet_toLowerSet_preimage {s : Set (WithLowerSet α)} :
470:@[simp] lemma isOpen_ofLowerSet_preimage {s : Set α} :

2026-10-30T11:43:01.186160Z ERROR codex_core::tools::router: error=apply_patch verification failed: invalid patch: multiple operations target /Users/mlong/.codex/memories/memory_summary.md
exec
/usr/local/bin/zsh -lc "nl -ba lean/Cmrps/Vol08SpacetimeReconstruction.lean | sed -n '70,80p'; sed -n '200,232p' lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean; rg -n 'embedding.*total|total.*embedding' lean/.lake/packages/mathlib/Mathlib/Logic/Embedding/*.lean lean/.lake/packages/mathlib/Mathlib/Logic/Function/*.lean; rg -n '"'^(def|abbrev|theorem|private theorem) (matrixUnit|choi|partialTrace|countNat|countRegime|SameBlocks|sum_single_smul)'"' lean/Cmrps/*.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
    70	/-- The strict chronological future of `x` for a relation `r` read strictly:
    71	`I⁺(x) = {y | r x y}` (Definition 2.2 with the strict reading of Proposition 6.4). -/
    72	def Future {α : Type*} (r : α → α → Prop) (x : α) : Set α := {y | r x y}
    73	
    74	/-- Past- and future-distinguishing for a relation read strictly (Definition 2.3):
    75	distinct points never share a past or share a future. -/
    76	def IsDistinguishing {α : Type*} (r : α → α → Prop) : Prop :=
    77	  ∀ x y : α, Past r x = Past r y → Future r x = Future r y → x = y
    78	
    79	/-! ## Finite orders and the causal ladder (Proposition 6.3, Proposition 6.4,
    80	Corollary 6.5; target `ladder_nontransfer_finite_orders`) -/
instance [Preorder α] : @Topology.IsUpperSet α (upperSet α) _ := by
  let := upperSet α
  exact ⟨rfl⟩

/--
The lower set topology is the topology where the open sets are the lower sets. In general the lower
set topology does not coincide with the lower topology.
-/
protected class IsLowerSet (α : Type*) [t : TopologicalSpace α] [Preorder α] : Prop where
  topology_eq_lowerSetTopology : t = lowerSet α

attribute [nolint docBlame] IsLowerSet.topology_eq_lowerSetTopology

instance [Preorder α] : Topology.IsLowerSet (WithLowerSet α) := ⟨rfl⟩

instance [Preorder α] : @Topology.IsLowerSet α (lowerSet α) _ := by
  let := lowerSet α
  exact ⟨rfl⟩

namespace IsUpperSet

section Preorder

variable (α)
variable [Preorder α] [TopologicalSpace α] [Topology.IsUpperSet α] {s : Set α}

lemma topology_eq : ‹_› = upperSet α := topology_eq_upperSetTopology

variable {α}

set_option backward.isDefEq.respectTransparency false in
instance _root_.OrderDual.instIsLowerSet : Topology.IsLowerSet αᵒᵈ where
  topology_eq_lowerSetTopology := by ext; rw [IsUpperSet.topology_eq α]
lean/Cmrps/Vol06QuantumSystems.lean:230:def matrixUnit {n : ℕ} (i j : Fin n) : Matrix (Fin n) (Fin n) ℂ :=
lean/Cmrps/Vol06QuantumSystems.lean:234:theorem matrixUnit_apply {n : ℕ} (i j a b : Fin n) :
lean/Cmrps/Vol06QuantumSystems.lean:240:def choi {n m : ℕ} (Φ : Matrix (Fin n) (Fin n) ℂ →ₗ[ℂ] Matrix (Fin m) (Fin m) ℂ) :
lean/Cmrps/Vol06QuantumSystems.lean:245:theorem choi_apply {n m : ℕ}
lean/Cmrps/Vol06QuantumSystems.lean:252:def partialTrace₂ {n m : ℕ}
lean/Cmrps/Vol06QuantumSystems.lean:257:theorem partialTrace₂_apply {n m : ℕ}
lean/Cmrps/Vol06QuantumSystems.lean:267:theorem partialTrace₂_choi_apply {n m : ℕ}
lean/Cmrps/Vol06QuantumSystems.lean:276:theorem choi_tracePreserving {n m : ℕ}
lean/Cmrps/Vol06QuantumSystems.lean:292:theorem choi_id {n : ℕ} :
lean/Cmrps/Vol12PrincipiaPhysica.lean:154:def countRegime (r : Regime) : List Regime → ℕ
lean/Cmrps/Vol12PrincipiaPhysica.lean:320:def countNat (n : ℕ) : List ℕ → ℕ
lean/Cmrps/Vol12PrincipiaPhysica.lean:325:def SameBlocks (l₁ l₂ : List ℕ) : Prop := ∀ n, countNat n l₁ = countNat n l₂
lean/Cmrps/Vol04YonedaClassification.lean:237:def choiMatrix {n m : ℕ} (Φ : M n →ₗ[ℂ] M m) : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ :=
lean/Cmrps/Vol04YonedaClassification.lean:276:theorem sum_single_smul {n : ℕ} (X : M n) :
lean/Cmrps/Vol04YonedaClassification.lean:299:def choi_correspondence {n m : ℕ} :
lean/Cmrps/Vol04YonedaClassification.lean:334:theorem choi_composition {n m p : ℕ} (Φ : M n →ₗ[ℂ] M m) (Ψ : M m →ₗ[ℂ] M p) :
lean/Cmrps/Vol04YonedaClassification.lean:343:def partialTrace {n m : ℕ} (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ) : M n :=
lean/Cmrps/Vol04YonedaClassification.lean:361:theorem choi_trace_preserving {n m : ℕ} (Φ : M n →ₗ[ℂ] M m) :

exec
/usr/local/bin/zsh -lc "python3 -c 'from pathlib import Path
import re
for n in (\"03\",\"05\",\"06\",\"07\"):
 p=next(Path(\"papers/latex\").glob(\"vol-\"+n+\"-*.tex\"))
 s=p.read_text()
 keys={\"03\":(\"def:dim-vector\",\"def:multiplicity-matrix\",\"cor:closure\"),\"05\":(\"def:monotone\",\"lem:sufficient\",\"prop:product\"),\"06\":(\"def:dimvec\",\"cor:count\",\"lem:choi\",\"prop:tensor\"),\"07\":(\"prop:cancellation\",\"thm:frobenius\",\"thm:highest-weight\")}[n]
 for m in re.finditer(r\"\\\\begin\\{(definition|theorem|lemma|proposition|corollary|example)\\}.*?\\\\end\\{\\1\\}\",s,re.S):
  if any(k in m.group() for k in keys): print(str(p)+\":\"+str(s.count(chr(10),0,m.start())+1)+\": \"+m.group())'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 21ms:
papers/latex/vol-03-irreducibility-decomposition.tex:227: \begin{definition}[Multiplicity matrix]
\label{def:multiplicity-matrix}
Let $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ and $B \cong \bigoplus_{j=1}^{\ell} M_{m_j}(\mathbb{C})$. A \emph{multiplicity matrix} from $A$ to $B$ is a matrix $R = (r^{(i)}_j)$ of nonnegative integers with
\[
k^{(i)}_j = n_i \, r^{(i)}_j \qquad \text{and} \qquad \sum_{i=1}^{k} k^{(i)}_j = m_j \quad \text{for each } j.
\]
Write $k(R) = (k^{(i)}_j)$ for the induced rank matrix.
\end{definition}
papers/latex/vol-03-irreducibility-decomposition.tex:442: \begin{corollary}[Closure of a finite set of blocks]
\label{cor:closure}
Let $S = \{M_{n_1}(\mathbb{C}), \dots, M_{n_k}(\mathbb{C})\}$ and let $\mathcal{C} = \{\oplus, \otimes\}$. The closure $\langle S \rangle_{\mathcal{C}}$ is the class of unital finite-dimensional complex C*-algebras whose dimension vector entries lie in the multiplicative semigroup generated by $n_1, \dots, n_k$ in $\mathbb{N}_{\geq 1}$.
\end{corollary}
papers/latex/vol-05-classical-systems.tex:135: \begin{definition}[Canonical transformation and coarse-graining]
\label{def:canonical}
A canonical transformation between symplectic systems $(M_1, \omega_1)$ and $(M_2, \omega_2)$ is a diffeomorphism $\varphi : M_1 \to M_2$ with $\varphi^{*} \omega_2 = \omega_1$; it carries Hamiltonian flows to Hamiltonian flows and preserves the Poisson bracket. A coarse-graining of a classical statistical system is a stochastic map $T$; it preserves the probability structure and contracts the Fisher metric by \cref{def:monotone}. The two kinds of morphism implement the two equivalence regimes of this paper: exact mathematical equivalence on the symplectic side and a metric-degrading order relation on the statistical side.
\end{definition}
papers/latex/vol-05-classical-systems.tex:453: \begin{definition}[Monotone metric]
\label{def:monotone}
A Riemannian metric $g$ on $\Delta^{\circ}$ is monotone under stochastic maps if for every column-stochastic matrix $T$ and every $p$, the pullback $T^{*} g_{Tp}$ at $p$ satisfies $T^{*} g_{Tp} \leq g_{p}$ as quadratic forms. Monotonicity is the requirement that coarse-graining cannot increase distinguishability.
\end{definition}
papers/latex/vol-05-classical-systems.tex:458: \begin{theorem}[Chentsov]
\label{thm:chentsov}
Let $g$ be a family of Riemannian metrics $g^{(n)}$ on the open simplices $\Delta^{\circ} \subset \mathbb{R}^{n}$ for all $n \geq 1$, compatible with Markov embeddings (pullback along every sufficient statistic is an isometry) and monotone under stochastic maps in the sense of \cref{def:monotone}. Then one constant $c > 0$ satisfies $g^{(n)} = c \, g_{\mathrm{Fisher}}^{(n)}$ for every $n$, where $g_{\mathrm{Fisher}}^{(n)}$ is the Fisher metric of \cref{def:fisher}. The cross-dimension compatibility is a hypothesis: monotonicity on a single fixed simplex does not determine the metric up to scale.
\end{theorem}
papers/latex/vol-05-classical-systems.tex:483: \begin{example}[Isometries of the Fisher metric]
\label{ex:reparameterization}
Under the square-root map $x_i = \sqrt{p_i}$ the open simplex $\Delta^{\circ}$ maps to the open positive orthant of the unit sphere, and the Fisher metric becomes four times the round metric of that sphere: $dx_i = u_i / (2 \sqrt{p_i})$ gives $\sum_i dx_i^{2} = \tfrac{1}{4} g_{p}(u, u)$. The isometries of the round sphere preserving the positive orthant are the coordinate permutations, so the isometries of the Fisher metric are exactly the relabelings of the outcome set. Stochastic maps that are not invertible on the model are contractions rather than isometries (\cref{def:monotone}), and \cref{lem:sufficiency} identifies the case of equality. The example shows concretely how the preserved layers of \cref{def:canonical} separate exact equivalence from coarse-graining.
\end{example}
papers/latex/vol-06-quantum-systems.tex:113: \begin{definition}[Dimension vector]
\label{def:dimvec}
Let $A$ be a finite-dimensional $C^*$-algebra. The dimension vector of $A$ is the multiset of matrix block sizes appearing in the decomposition of \cref{thm:findim}, written $\mathbf{d}(A) = \{n_1, \dots, n_k\}$ with each $n_i \geq 1$ and repetition allowed.
\end{definition}
papers/latex/vol-06-quantum-systems.tex:125: \begin{example}[Qubit composite systems]
\label{ex:qubits}
A single qubit record has $H = \mathbb{C}^2$ and observables $M_2(\mathbb{C})$. An $N$-qubit record has $H = (\mathbb{C}^2)^{\otimes N}$ and observables $M_{2^N}(\mathbb{C})$ or a subalgebra of it, with composition data the tensor product of \cref{prop:tensor}. The dimension vector of the full observable algebra is $\{2^N\}$, and subalgebras correspond to blocks of smaller size in the sense of \cref{thm:findim}. Symmetry actions such as the Pauli group permute and mix the blocks, and that action is data the dimension vector does not carry.
\end{example}
papers/latex/vol-06-quantum-systems.tex:130: \begin{definition}[Invariants]
\label{def:invariants}
A classifying invariant for a class of records is a map $I$ such that $I(P) = I(Q)$ if and only if $P$ and $Q$ are equivalent under the relation in force. The classifying invariants of this paper are the dimension vector (\cref{def:dimvec}), the Murray-von Neumann type and the Connes invariants of a factor, and the operator monotone function classifying a monotone metric on quantum states. The Kraus rank of a minimal dilation is a normal-form dimension and not a classifying invariant for channels (\cref{rem:normalform}).
\end{definition}
papers/latex/vol-06-quantum-systems.tex:200: \begin{corollary}[Counting small algebras]
\label{cor:count}
For each $d \geq 1$ the $*$-isomorphism classes of finite-dimensional $C^*$-algebras of complex dimension $d$ are in bijection with the partitions of $d$ into perfect squares. In particular the number of such algebras grows as the number of such partitions.
\end{corollary}
papers/latex/vol-06-quantum-systems.tex:274: \begin{proposition}[Tensor products of block algebras]
\label{prop:tensor}
Let $A = \bigoplus_i M_{n_i}(\mathbb{C})$ and $B = \bigoplus_j M_{m_j}(\mathbb{C})$. Then $A \otimes B \cong \bigoplus_{i,j} M_{n_i m_j}(\mathbb{C})$, and the dimension vector of $A \otimes B$ is the multiset of products $\{n_i m_j\}$. In particular the dimension vector of a tensor product is computed from the factor dimension vectors without reference to any presentation.
\end{proposition}
papers/latex/vol-06-quantum-systems.tex:374: \begin{lemma}[Choi correspondence]
\label{lem:choi}
For a linear map $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ with Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$ the following hold: $\Phi$ is completely positive if and only if $J(\Phi) \geq 0$, and $\Phi$ is trace preserving if and only if $\operatorname{Tr}_m J(\Phi) = I_n$, where $\operatorname{Tr}_m$ is the partial trace over the second tensor factor.
\end{lemma}
papers/latex/vol-06-quantum-systems.tex:445: \begin{proposition}[Composition of channels]
\label{prop:compose}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ and $\Psi: M_m(\mathbb{C}) \to M_p(\mathbb{C})$ be linear. Then
\[
J(\Psi \circ \Phi)_{(i\alpha),(j\beta)} = \sum_{k,l=1}^{m} J(\Phi)_{(ik),(jl)} \, J(\Psi)_{(k\alpha),(l\beta)},
\]
with composite indices as in \cref{lem:choi}. The right-hand side is the link product of $J(\Phi)$ and $J(\Psi)$: matrix multiplication of $J(\Phi)$ after partial transpose on the shared subsystem, contracted with $J(\Psi)$ along that subsystem. Composition of channels is therefore a link-product contraction, and the Choi matrix of a composite is determined by the Choi matrices of the factors.
\end{proposition}
papers/latex/vol-07-gauge-qft.tex:104: \begin{example}[A gauge theory as an object of $\mathrm{Phys}$]
\label{ex:tuple}
A classical Yang\textendash{}Mills system over a compact oriented four-manifold $X$ with gauge group $G$ is recorded as follows. The state space component $X_P$ is the space of connections on a fixed principal $G$-bundle $P \to X$ modulo the gauge group $\mathcal{G}$ of vertical automorphisms. The observable component $\mathcal{O}_P$ is the algebra of gauge-invariant polynomial functions of the curvature, together with the Wilson loops on a fixed class of loops when those are taken as the observable set. The dynamical component $\mathcal{D}_P$ is the Yang\textendash{}Mills functional $F \mapsto \int_X |F_\omega|^2$ and its gradient flow or Hamiltonian formulation. The symmetry component $\mathcal{S}_P$ is the gauge group $\mathcal{G}$ acting on connections with the Gauss law constraint surface as the reduced phase space. The composition component $\mathcal{C}_P$ is the product of bundles and the coupling of matter fields in representations of $G$. The tuple is an instance of the schema. The bundle is classified by Theorem~\ref{thm:bundles}, and the gauge algebra and the matter representations by Theorems~\ref{thm:killing-cartan} and~\ref{thm:highest-weight}. The dynamics, the state quotient, and the observable algebra lie outside those theorems.
\end{example}
papers/latex/vol-07-gauge-qft.tex:163: \begin{theorem}[Highest-weight classification]
\label{thm:highest-weight}
Let $\mathfrak{g}$ be a complex semisimple Lie algebra. Finite-dimensional irreducible representations of $\mathfrak{g}$ are in bijection with dominant integral weights; the representation with highest weight $\lambda$ exists and is unique up to isomorphism~\cite{humphreys}.
\end{theorem}
papers/latex/vol-07-gauge-qft.tex:294: \begin{proposition}[Anomaly cancellation as a linear condition]
\label{prop:cancellation}
Fix a compact simple gauge group $G$ and let the matter content be a finite list of finite-dimensional irreducible representations $R_1, \ldots, R_k$ with highest weights $\lambda_1, \ldots, \lambda_k$. The contribution of each representation to a fixed anomaly class is additive, so there is a homomorphism of abelian groups
\[
\alpha \colon R(G) \longrightarrow A,
\]
from the representation ring of $G$ to the coefficient group $A$ of the anomaly in question, and the anomaly-free matter lists form $\ker \alpha$. For the four-dimensional perturbative gauge anomaly $A = \mathbb{Z}$ and $\alpha(R)$ is the anomaly coefficient of $R$; for global anomalies $A$ is the relevant cobordism group of $G$. The admissible matter lists are cut out by linear conditions on the weight data, computable from Theorem~\ref{thm:highest-weight} and Proposition~\ref{prop:anomaly} together.
\end{proposition}
papers/latex/vol-07-gauge-qft.tex:314: \begin{theorem}[Two-dimensional topological field theories]
\label{thm:frobenius}
The category of two-dimensional Atiyah topological quantum field theories with values in vector spaces is equivalent to the category of commutative Frobenius algebras~\cite{atiyah-tqft}.
\end{theorem}

exec
/usr/local/bin/zsh -lc "sed -n '48,70p' lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean; sed -n '275,298p' lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean; rg -n 'T0Space|PartialOrder' lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean; nl -ba lean/Cmrps/Vol12PrincipiaPhysica.lean | sed -n '235,280p'; nl -ba lean/Cmrps/Vol02StructuralFamilies.lean | sed -n '689,714p'; nl -ba lean/Cmrps/Vol11CompletenessObstructions.lean | sed -n '42,65p'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:

upper set topology, lower set topology, preorder, Alexandrov
-/

@[expose] public section

open Set TopologicalSpace Filter

variable {α β γ : Type*}

namespace Topology

/-- Topology whose open sets are upper sets.

Note: In general the upper set topology does not coincide with the upper topology. -/
@[instance_reducible]
def upperSet (α : Type*) [Preorder α] : TopologicalSpace α where
  IsOpen := IsUpperSet
  isOpen_univ := isUpperSet_univ
  isOpen_inter _ _ := IsUpperSet.inter
  isOpen_sUnion _ := isUpperSet_sUnion

/-- Topology whose open sets are lower sets.
lemma nhds_eq_principal_Ici (a : α) : 𝓝 a = 𝓟 (Ici a) := by
  rw [← principal_nhdsKer_singleton, nhdsKer_singleton]

lemma nhdsSet_eq_principal_upperClosure (s : Set α) : 𝓝ˢ s = 𝓟 ↑(upperClosure s) := by
  rw [← principal_nhdsKer, nhdsKer_eq_upperClosure]

end Preorder

protected lemma _root_.Topology.isUpperSet_iff_nhds {α : Type*} [TopologicalSpace α] [Preorder α] :
    Topology.IsUpperSet α ↔ (∀ a : α, 𝓝 a = 𝓟 (Ici a)) where
  mp _ a := nhds_eq_principal_Ici a
  mpr hα := ⟨by simp [TopologicalSpace.ext_iff_nhds, hα, nhds_eq_principal_Ici]⟩

instance : Topology.IsUpperSet Prop := by
  simp [Topology.isUpperSet_iff_nhds, Prop.forall]

section maps

variable [Preorder α] [Preorder β]

open Topology

protected lemma monotone_iff_continuous [TopologicalSpace α] [TopologicalSpace β]
    [Topology.IsUpperSet α] [Topology.IsUpperSet β] {f : α → β} : Monotone f ↔ Continuous f := by
   235	
   236	/-- The affine witness of Theorem 7.1: `f(x) = (x+1)/2`. -/
   237	noncomputable def f_aff : ℝ → ℝ := fun x => (x + 1) / 2
   238	
   239	/-- The two witness functions of Theorem 7.1 are distinct. -/
   240	theorem MonotoneWitnessDistinct : f_id ≠ f_aff := by
   241	  have h0 : f_id 0 ≠ f_aff 0 := by
   242	    show (0 : ℝ) ≠ (0 + 1) / 2
   243	    norm_num
   244	  exact fun h => h0 (congrFun h 0)
   245	
   246	/-- Target 6, gap clause: a parameterized family with more than one element admits no
   247	unique choice, so a uniqueness-up-to-scalar statement cannot extend to it. -/
   248	theorem MonotoneMetricGap {Param : Type} (f g : Param) (hne : f ≠ g) :
   249	    ¬ Subsingleton Param := by
   250	  intro h
   251	  letI := h
   252	  exact hne (Subsingleton.elim f g)
   253	
   254	/-- Target 6, quantum clause: given the classical Petz–Sudar input that the identity and
   255	the affine function are operator monotone, the parameter class of quantum monotone metrics
   256	is nontrivial, and classical uniqueness does not extend to the quantum case. -/
   257	theorem MonotoneMetricGapQuantum
   258	    (IsOperatorMonotone : (ℝ → ℝ) → Prop)
   259	    (hid : IsOperatorMonotone f_id) (haff : IsOperatorMonotone f_aff) :
   260	    ¬ Subsingleton { f : ℝ → ℝ // IsOperatorMonotone f } :=
   261	  MonotoneMetricGap (f := ⟨f_id, hid⟩) (g := ⟨f_aff, haff⟩) (fun h =>
   262	    MonotoneWitnessDistinct (congrArg Subtype.val h))
   263	
   264	/-! ## Target 7 — `ExistenceMassGapSeparation` (Section 6) -/
   265	
   266	/-- The two conjuncts of the Clay problem. -/
   267	structure ClayProblem where
   268	  /-- Existence of the four-dimensional quantum field theory. -/
   269	  Existence : Prop
   270	  /-- Strict positivity of the mass gap. -/
   271	  MassGap : Prop
   272	
   273	/-- The Clay problem is solved exactly when both conjuncts hold. -/
   274	def ClaySolved (C : ClayProblem) : Prop := C.Existence ∧ C.MassGap
   275	
   276	/-- Target 7: an existence claim alone does not discharge the mass-gap conjunct; the two
   277	properties are separate conjuncts of the Clay problem. -/
   278	theorem ExistenceMassGapSeparation (C : ClayProblem)
   279	    (hE : C.Existence) (hG : ¬ C.MassGap) : ¬ ClaySolved C := by
   280	  rintro ⟨_, hg⟩
   689	/-- Paper Definition 2.3 / 16.1: a structural family is presented by its class of objects. -/
   690	structure StructuralFamily where
   691	  /-- Objects of the family. -/
   692	  Obj : Type u
   693	
   694	/-- Paper Definition 16.1: `F` is a special case of `G` when there is a full embedding
   695	of the objects of `F` into the objects of `G`. -/
   696	def SpecialCase (F G : StructuralFamily) : Prop := Nonempty (F.Obj ↪ G.Obj)
   697	
   698	/-- Paper Definition 16.1 / Table 14: `G` is reconstructable from `F` when a
   699	correspondence determines one from the other. -/
   700	def Reconstructable (F G : StructuralFamily) : Prop := Nonempty (F.Obj ≃ G.Obj)
   701	
   702	/-- Paper Definition 16.1: two structural families are logically independent when
   703	neither is a special case of the other and neither is reconstructable from the other. -/
   704	def Independent (F G : StructuralFamily) : Prop :=
   705	  ¬ SpecialCase F G ∧ ¬ SpecialCase G F ∧ ¬ Reconstructable F G ∧ ¬ Reconstructable G F
   706	
   707	/-- Paper Proposition 16.2: a family admits a classifying invariant when some map on
   708	its objects is injective (it separates objects up to the chosen equivalence, taken here
   709	to be equality). -/
   710	def HasClassifyingInvariant (F : StructuralFamily.{u}) : Prop :=
   711	  ∃ (V : Type u) (I : F.Obj → V), Function.Injective I
   712	
   713	/-- Paper Proposition 16.2: families related by a correspondence (as the Gelfand
   714	anti-equivalence relates commutative unital C*-algebras and compact Hausdorff spaces)
    42	
    43	/-- Paper, Definition 4.1: a recognizer `R` decides `x ≃ y` from finite
    44	presentations. Presentations are abstracted to the objects themselves; `correct`
    45	is the correctness clause of the decision procedure. -/
    46	structure Recognizer {α : Type u} (S : Setoid α) where
    47	  /-- The decision procedure. -/
    48	  decides : α → α → Bool
    49	  /-- Correctness on presentations. -/
    50	  correct : ∀ x y, decides x y = true ↔ S.r x y
    51	
    52	/-- Paper, Definition 4.1: the structured parameter space `Π` — a structured
    53	carrier with a structure-compatible surjection onto the `≃`-classes. The
    54	algebraic-family / Borel-parametrization content of the structure is carried by
    55	`kind`; only the surjection component is formalized here (see
    56	`verification/vol-11-completeness-obstructions-dependency-notes.md`). -/
    57	structure ParameterSpace {α : Type u} {κ : Type v} (S : Setoid α) where
    58	  /-- Which structured shape the carrier claims. -/
    59	  kind : ParameterKind
    60	  /-- Structure-compatible map from the carrier onto the `S`-classes. -/
    61	  toClasses : κ → Quotient S
    62	  /-- The map is onto the classes. -/
    63	  surjective : Function.Surjective toClasses
    64	
    65	/-- Paper, Definition 4.1: a complete invariant `ι` for the equivalence `S`. -/

2026-10-30T11:44:04.599001Z ERROR codex_core::tools::router: error=apply_patch verification failed: Failed to find context '-1,98 +1,120 @@' in /Users/mlong/.codex/memories/memory_summary.md
exec
/usr/local/bin/zsh -lc "sed -n '426,470p' papers/latex/vol-03-irreducibility-decomposition.tex; sed -n '405,430p' papers/latex/vol-01-foundations.tex; sed -n '605,625p' papers/latex/vol-02-structural-families.tex; rg -n 'sum.*single|single.*sum' lean/.lake/packages/mathlib/Mathlib/Data/Matrix/Basis.lean | head -20" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
The construction list of the framework section becomes computable in the finite-dimensional setting: the effect of each construction on dimension vectors is arithmetic.

\begin{proposition}[Construction arithmetic]
\label{prop:construction-arithmetic}
Let $A$ and $B$ be unital finite-dimensional complex C*-algebras with dimension vectors $\mathbf{n}(A)$ and $\mathbf{n}(B)$. Then:
\begin{enumerate}
\item $\mathbf{n}(A \oplus B) = \mathbf{n}(A) \uplus \mathbf{n}(B)$, the multiset union.
\item $\mathbf{n}(A \otimes B) = \{ n m : n \in \mathbf{n}(A),\, m \in \mathbf{n}(B) \}$, the pairwise product multiset.
\item $A \oplus B$ is irreducible under direct sum if and only if one summand is zero and the other is simple.
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
\label{tab:constructions}
\end{table}

\begin{example}[Qubit closure]
\label{ex:qubit-closure}
The constructions of the program are the tensor product, the direct sum, extension, limits and colimits, and factorization of a representation into factors, and each use of a construction must state the composition data it contributes to $\mathcal{C}$. In the restricted classes below only two of these are active: disjoint union, which is a direct sum of state spaces, and the cartesian product, which is a tensor product of finite sets. The restriction is deliberate. A framework that cannot state and prove a theorem about its simplest constructions has no standing to state one about tensor products of quantum field theories.

The dependence of irreducibility on $\mathcal{C}$ is checkable on the finite classical records in two ways.

\begin{example}[Irreducibles under disjoint union]
\label{ex:union-irreducibles}
In $\mathrm{Phys}_{\mathrm{fin}}$ with $\mathcal{C}$ the disjoint union of state spaces, the neutral record is the empty record, and Definition~\ref{def:irreducible} excludes it from the irreducibles. The irreducibles are exactly the one-point records. A record with more than one point splits as $X = \{x\} \cup (X \setminus \{x\})$ into two nonempty records, and a one-point record admits no split into two nonempty parts.
\end{example}

\begin{example}[Irreducibles under product]
\label{ex:product-irreducibles}
Take the same records with $\mathcal{C}$ the cartesian product of state spaces and product composition rules. The neutral record is the one-point record, and it is the empty product. The irreducibles are the records of prime cardinality. A record of cardinality $n$ decomposes as a product of records of prime cardinality, and the multiset of prime factors is unique up to order by unique prime factorization.
\end{example}

The two examples classify the same class of records and disagree on the irreducibles. Irreducibility is relative to $\mathcal{C}$, and no statement about simple systems is meaningful until the composition rule is part of the record.

Uniqueness of decomposition fails as soon as the record carries less than the composition data. The smallest instance is two qubits.

\begin{proposition}[Factorization is extra data]
\label{prop:factorization-nonunique}
For any four-dimensional complex Hilbert space $H$ there exist two factorizations $H \cong \mathbb{C}^2 \otimes \mathbb{C}^2$ and a unit vector $\psi \in H$ whose entanglement entropy is $0$ in one factorization and $\log 2$ in the other. The bare record $(H, B(H), \mathrm{id}_H, U(H))$ does not determine the decomposition of $H$ into factors.
\end{proposition}

\begin{proof}
Write $v_1 = e_1 \otimes e_1$ and $v_2 = e_2 \otimes e_2$. In the standard factorization $\psi = v_1$ is a product vector, its Schmidt rank is one, and its entanglement entropy is $0$. Let $W$ be the unitary of $H$ that acts on the span of $v_1, v_2$ by the rotation $W v_1 = (v_1 + v_2)/\sqrt{2}$ and $W v_2 = (v_1 - v_2)/\sqrt{2}$, and acts as the identity on the orthogonal complement. Then $W$ is self-adjoint and unitary on that span, so $W^2$ is the identity there. Write $\Phi_1 \colon H \to \mathbb{C}^2 \otimes \mathbb{C}^2$ for the standard factorization, so that $\psi = v_1$ has coordinate vector $v_1$. The second factorization is the pullback $\Phi_2 = \Phi_1 \circ W^{-1}$: the vector $\psi$ is unchanged and the factorizing isomorphism changes. In the coordinates of $\Phi_2$ the fixed vector $\psi$ is represented by $\Phi_2(\psi) = \Phi_1(W^{-1} \psi)$, and since $W^2$ is the identity on the span of $v_1, v_2$ we have $W^{-1} = W$ there, so the coordinate vector is $W \psi = (v_1 + v_2)/\sqrt{2} = (e_1 \otimes e_1 + e_2 \otimes e_2)/\sqrt{2}$. Its Schmidt coefficients are $1/\sqrt{2}$ and $1/\sqrt{2}$ and its entanglement entropy is $\log 2$. Both factorizations are legitimate structures on $H$, so the decomposition into factors is not a function of the bare Hilbert space.
\end{proof}

Later volumes classify systems. The taxonomy is the place they record what they find, and the record format is fixed here so that results produced independently are comparable.

A classification record in a later volume has six fields: the family, the sector, the classifying invariant together with its range, the equivalence the invariant is complete for, the scope in which completeness holds, and the achievement kind of \Cref{def:kinds}. A record with an empty invariant field is a record of an absence and not a classification.

\begin{proposition}[Comparability of records]
\label{prop:comparable}
Two classification records are comparable when they agree on family, sector, and equivalence. If they agree on those three fields and both name classifying invariants, then the two invariants are related by a bijection between their attained values on that sector.
\end{proposition}

\begin{proof}
Both invariants are complete for the same equivalence on the same set of objects, so each induces a bijection between the set of classes and its own attained values. The composite of one bijection with the inverse of the other is a bijection between the two sets of attained values.
\end{proof}

\Cref{prop:comparable} is what makes the family rows usable across volumes. Two independently obtained invariants for the same sector are not competing claims; they are coordinate descriptions of the same class set, and each can be converted into the other once both are recorded. What is not automatic is agreement on scope, since two records may cover different sub-sectors. Scope comparison is therefore a manual step, and the family tables above state the scope of every row they carry.

The interface also fixes how an obstruction is recorded. An impossibility result names the sector, names the candidate invariant range it excludes, and cites the theorem that excludes it. An absence of record names the sector and states that no classification is on record. The two are different fields and never share a row, as Table~\ref{tab:kinds} shows.

\section{Scope of the family taxonomy}
\label{sec:limitations}

148:lemma sum_single_eq_diagonal [AddCommMonoid α] [Fintype m] (f : m → α) :
151:  rw [sum_apply, diagonal_apply, Finset.sum_eq_single j] <;> simp +contextual [single]
153:lemma sum_single_one [AddCommMonoid α] [One α] [Fintype m] :
155:  sum_single_eq_diagonal _
157:lemma sum_single_natCast [AddCommMonoidWithOne α] [Fintype m] (n : ℕ) :
159:  sum_single_eq_diagonal _
161:lemma sum_single_ofNat [AddCommMonoidWithOne α] [Fintype m] (n : ℕ) [n.AtLeastTwo] :
163:  sum_single_eq_diagonal _
165:lemma sum_single_intCast [AddCommGroupWithOne α] [Fintype m] (z : ℤ) :
167:  sum_single_eq_diagonal _
169:theorem sum_sum_single [AddCommMonoid α] [Fintype m] [Fintype n] (x : m → n → α) :
173:  simp [single, Matrix.sum_apply, Matrix.of_apply, ← Prod.mk_inj]
175:theorem matrix_eq_sum_single [AddCommMonoid α] [Fintype m] [Fintype n] (x : Matrix m n α) :
177:  sum_sum_single _ |>.symm
190:  rw [matrix_eq_sum_single M, ← Finset.sum_product']
235:  rw [matrix_eq_sum_single x]
275:  simp_rw [of_symm_single, LinearMap.lsum_piSingle]

codex
The Yoneda module elaborated successfully. I also confirmed that Mathlib already provides the upper-set topology and several helper results re-proved here. The remaining modules are still being checked; the main findings so far concern statement meaning rather than syntax.
exec
/usr/local/bin/zsh -lc "rg -n 'embedding.*total|total.*embedding|nonempty_embedding|Embedding.total' lean/.lake/packages/mathlib/Mathlib/Logic/Embedding* -g '*.lean'; nl -ba lean/.lake/packages/mathlib/Mathlib/Data/Matrix/Basis.lean | sed -n '166,180p'; rg -n 'proc|build|error' lean -g '*.log' -g '*.json' -g '"'!lake-manifest.json'"' -g '"'!**/.lake/**'"'" in /Users/mlong/Documents/Development/classification-physical-systems
 exited 1 in 0ms:
   166	    ∑ i : m, single i i (z : α) = z :=
   167	  sum_single_eq_diagonal _
   168	
   169	theorem sum_sum_single [AddCommMonoid α] [Fintype m] [Fintype n] (x : m → n → α) :
   170	    ∑ i : m, ∑ j : n, single i j (x i j) = of x := by
   171	  ext i j
   172	  rw [← Fintype.sum_prod_type']
   173	  simp [single, Matrix.sum_apply, Matrix.of_apply, ← Prod.mk_inj]
   174	
   175	theorem matrix_eq_sum_single [AddCommMonoid α] [Fintype m] [Fintype n] (x : Matrix m n α) :
   176	    x = ∑ i : m, ∑ j : n, single i j (x i j) :=
   177	  sum_sum_single _ |>.symm
   178	
   179	theorem single_eq_single_vecMulVec_single [MulZeroOneClass α] (i : m) (j : n) :
   180	    single i j (1 : α) = vecMulVec (Pi.single i 1) (Pi.single j 1) := by

exec
/usr/local/bin/zsh -lc "python3 -c 'from pathlib import Path
for n in (\"03\",\"05\",\"06\",\"07\"):
 p=next(Path(\"papers/latex\").glob(\"vol-\"+n+\"-*.tex\"))
 lines=p.read_text().splitlines()
 keys={\"03\":(\"def:dimension-vector\",\"Dimension vector\",\"thm:block-decomposition\"),\"05\":(\"lem:sufficiency\", \"prop:fisher-product\"),\"06\":(\"partitions of\",),\"07\":(\"prop:anomaly\",)}[n]
 for i,l in enumerate(lines):
  if any(k in l for k in keys) and len(l)<160: print(str(p)+\":\"+str(i+1)+\": \"+\"\\n\".join(lines[max(0,i-1):min(len(lines),i+7)]))'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 18ms:
papers/latex/vol-03-irreducibility-decomposition.tex:108: 
\begin{definition}[Dimension vector]
For a unital finite-dimensional complex C*-algebra presented as a direct sum $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$, the \emph{dimension vector} of $A$ is the multiset $\mathbf{n}(A) = \{n_1, \dots, n_k\}$ of matrix sizes, equivalently the unordered list of the dimensions of the simple $A$-modules.
\end{definition}

\begin{remark}[Two composition operations on operator-algebra systems]
For systems whose observable algebra is a unital finite-dimensional complex C*-algebra, two composition operations are natural: the direct sum $A \oplus B$ of observable algebras, which models superselection, and the tensor product $A \otimes B$, which models subsystems. The irreducibles of the first operation are the simple blocks $M_n(\mathbb{C})$. The irreducibles of the second are different. The distinction is not cosmetic; it decides what counts as a basic object.
\end{remark}
papers/latex/vol-03-irreducibility-decomposition.tex:152: \begin{theorem}[Block decomposition]
\label{thm:block-decomposition}
Let $A$ be a unital finite-dimensional complex C*-algebra of dimension $d$. Then there exist $k \geq 1$ and integers $n_1, \dots, n_k \geq 1$ with $\sum_{i=1}^{k} n_i^2 = d$ and a *-isomorphism
\[
A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C}).
\]
The multiset $\mathbf{n}(A) = \{n_1, \dots, n_k\}$ is unique up to permutation, and $k = \dim_{\mathbb{C}} Z(A)$.
\end{theorem}
papers/latex/vol-03-irreducibility-decomposition.tex:313: \begin{enumerate}
\item Unital finite-dimensional complex C*-algebras under direct sum: \cref{thm:block-decomposition}.
\item Unital *-homomorphisms of such algebras up to unitary conjugacy: \cref{thm:homs}.
\item Tensor factorizations into prime-dimensional factors: if a finite-dimensional Hilbert space is written as a tensor product of factors of prime dimension, the multiset of factor dimensions is unique up to permutation, by unique prime factorization of the total dimension.
\item Bipartite pure states of a finite-dimensional bipartite system, up to the Schmidt decomposition: the Schmidt coefficients are unique, and the left and right Schmidt subspaces are unique as subspaces.
\end{enumerate}
\end{proposition}

papers/latex/vol-03-irreducibility-decomposition.tex:525: \midrule
Finite-dimensional C*-algebras & Direct sum into matrix blocks & Dimension vector unique up to permutation & Dimension vector is complete \\
Commutative C*-algebras & Spectrum of characters & Spectrum is unique & The spectrum itself \\
Von Neumann algebras & Direct integral into factors & Essentially unique up to measure class & No parameterization of the factors in general \\
Completely positive maps & Stinespring dilation and Kraus form & Minimal dilation unique up to unitary & Kraus rank is a normal-form invariant only \\
Bipartite pure states & Schmidt decomposition & Coefficients unique & Schmidt coefficients \\
Interacting systems & No general theorem & Fails in general & Not available \\
Wild representation categories & Indecomposable decompositions may exist & Not controlled & Finite-dimensional parameterization is impossible \\
papers/latex/vol-05-classical-systems.tex:468: \begin{lemma}[Equality along sufficient statistics]
\label{lem:sufficiency}
Let $g$ be a monotone metric on $\Delta^{\circ}$ and let $T$ be a stochastic map with a stochastic left inverse $S$, that is $S T = \mathrm{Id}$. Then $T$ is an isometric embedding for $g$, and for every tangent vector $u$ at $p$,
\[
g_{p}(u, u) = g_{Tp}(Tu, Tu).
\]
\end{lemma}

papers/latex/vol-07-gauge-qft.tex:277: \begin{proposition}[Quantization gate]
\label{prop:anomaly}
A gauge theory admits a consistent quantization only where the determinant line $\lambda_{\mathrm{det}}$ of the Dirac family is trivializable and its anomaly cocycle $[a]$ vanishes in the local BRST cohomology $H^{1,n}(s\mid d)$. The group $H^{1,n}(s\mid d)$ is the space of candidate anomalies of the theory; the specific cocycle $[a]$ is the anomaly of the theory at hand. These two vanishing conditions are the classification content of the anomaly: the obstruction classes are natural in the gauge configuration and classify the inconsistent directions.
\end{proposition}

\begin{proof}
If the determinant line of the family is nontrivial, the path integral measure is a section of a nontrivial line bundle rather than a measure, and gauge transformations multiply the partition function by a nontrivial phase; gauge invariance of the measure fails exactly then. The measure exists exactly when $\lambda_{\mathrm{det}}$ is trivializable. The BRST anomaly class is the obstruction to the nilpotency of the quantized BRST charge: the classical BRST differential satisfies $s^2 = 0$, and the quantum deformation fails to be nilpotent exactly when the anomaly cocycle $[a]$ is nonzero in $H^{1,n}(s\mid d)$. The Wess\textendash{}Zumino consistency condition is the integrability condition for this class and holds by construction~\cite{bbh}. Both constructions are functorial in the gauge configuration, so the obstruction classes are natural and the vanishing test is a classification of the inconsistent directions.
\end{proof}

exec
/usr/local/bin/zsh -lc "rg -n 'def (ComputablePred|Computable)|ComputablePred' lean/.lake/packages/mathlib/Mathlib/Computability/Computable.lean | head -15; rg -n 'embedding_total|Embedding.total|nonempty_embedding' lean/.lake/packages/mathlib/Mathlib/SetTheory/Cardinal/Order.lean lean/.lake/packages/mathlib/Mathlib/Logic/Embedding/Basic.lean; nl -ba lean/Cmrps/Vol08SpacetimeReconstruction.lean | sed -n '360,380p'; nl -ba lean/Cmrps/Vol01Foundations.lean | sed -n '150,167p'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
rg: lean/.lake/packages/mathlib/Mathlib/Computability/Computable.lean: IO error for operation on lean/.lake/packages/mathlib/Mathlib/Computability/Computable.lean: No such file or directory (os error 2)
lean/.lake/packages/mathlib/Mathlib/SetTheory/Cardinal/Order.lean:100:      apply Embedding.total
lean/.lake/packages/mathlib/Mathlib/SetTheory/Cardinal/Order.lean:511:theorem nonempty_embedding_to_cardinal : Nonempty (α ↪ Cardinal.{u}) :=
lean/.lake/packages/mathlib/Mathlib/SetTheory/Cardinal/Order.lean:512:  (Embedding.total _ _).resolve_left fun ⟨⟨f, hf⟩⟩ =>
lean/.lake/packages/mathlib/Mathlib/SetTheory/Cardinal/Order.lean:520:  Classical.choice nonempty_embedding_to_cardinal
   360	`specialization_order_recovery`) -/
   361	
   362	/-- The up-set (P. S. Alexandroff) topology of a preorder: the open sets are the
   363	upper sets (Definition 2 discussion and Proposition 9.4). -/
   364	def upSetTopology (α : Type*) [Preorder α] : TopologicalSpace α :=
   365	  TopologicalSpace.generateFrom {u | IsUpperSet u}
   366	
   367	theorem isUpperSet_of_isOpen {α : Type*} [Preorder α] {s : Set α}
   368	    (hs : IsOpen[upSetTopology α] s) : IsUpperSet s := by
   369	  have hs' : TopologicalSpace.GenerateOpen {u | IsUpperSet u} s := hs
   370	  induction hs' with
   371	  | basic u hu => exact hu
   372	  | univ => exact isUpperSet_univ
   373	  | inter u v hu hv ih1 ih2 => exact fun a b hab ha => ⟨ih1 hu hab ha.1, ih2 hv hab ha.2⟩
   374	  | sUnion S h ih => exact isUpperSet_sUnion fun t ht => ih t ht (h t ht)
   375	
   376	theorem isOpen_iff_isUpperSet {α : Type*} [Preorder α] {s : Set α} :
   377	    IsOpen[upSetTopology α] s ↔ IsUpperSet s :=
   378	  ⟨isUpperSet_of_isOpen, fun h => TopologicalSpace.isOpen_generateFrom_of_mem h⟩
   379	
   380	theorem isClosed_iff_isLowerSet {α : Type*} [Preorder α] {s : Set α} :
   150	
   151	/-- The morphisms of one kind between finite classical records, closed under
   152	self-composition and containing the identities, carry exactly the structure of
   153	a category (Proposition 6.4). This is the category content of the proposition;
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

exec
/usr/local/bin/zsh -lc "rg --files lean/.lake/packages/mathlib/Mathlib/Computability -g '*.lean' | head -15; rg -n 'theorem total|lemma total' lean/.lake/packages/mathlib/Mathlib/Logic/Embedding* -g '*.lean'; sed -n '1,12p' lean/.lake/packages/mathlib/Mathlib/Data/Real/Basic.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
lean/.lake/packages/mathlib/Mathlib/Computability/PartrecBasis.lean
lean/.lake/packages/mathlib/Mathlib/Computability/Reduce.lean
lean/.lake/packages/mathlib/Mathlib/Computability/MyhillNerode.lean
lean/.lake/packages/mathlib/Mathlib/Computability/TuringMachine/StackTuringMachine.lean
lean/.lake/packages/mathlib/Mathlib/Computability/TuringMachine/Config.lean
lean/.lake/packages/mathlib/Mathlib/Computability/TuringMachine/Tape.lean
lean/.lake/packages/mathlib/Mathlib/Computability/TuringMachine/Computable.lean
lean/.lake/packages/mathlib/Mathlib/Computability/TuringMachine/ToPartrec.lean
lean/.lake/packages/mathlib/Mathlib/Computability/TuringMachine/PostTuringMachine.lean
lean/.lake/packages/mathlib/Mathlib/Computability/PartrecCode.lean
lean/.lake/packages/mathlib/Mathlib/Computability/Primrec/Basic.lean
lean/.lake/packages/mathlib/Mathlib/Computability/Primrec/List.lean
lean/.lake/packages/mathlib/Mathlib/Computability/Language.lean
lean/.lake/packages/mathlib/Mathlib/Computability/Encoding.lean
lean/.lake/packages/mathlib/Mathlib/Computability/StateTransition.lean
module -- shake: keep-all

public import Mathlib.Basic.Real.Basic

deprecated_module (since := "2026-08-27")

exec
/usr/local/bin/zsh -lc 'lake env lean --version' in /Users/mlong/Documents/Development/classification-physical-systems/lean
exec
/usr/local/bin/zsh -lc 'lean --version' in /Users/mlong/Documents/Development/classification-physical-systems/lean
 succeeded in 0ms:
Lean (version 4.35.0, arm64-apple-darwin24.6.0, commit eb6cafb7290e8bd5f2937522d8d804f58f02bafc, Release)

 succeeded in 44479ms:
Lean (version 4.35.0, arm64-apple-darwin24.6.0, commit eb6cafb7290e8bd5f2937522d8d804f58f02bafc, Release)

exec
/usr/local/bin/zsh -lc "python3 -c 'from pathlib import Path
import os, subprocess
root=Path.cwd()
paths=[root/\".lake/build/lib/lean\"]+list((root/\".lake/packages\").glob(\"*/.lake/build/lib/lean\"))
env=dict(os.environ, LEAN_PATH=os.pathsep.join(map(str,paths)))
for name in (\"Vol09GravityInformationGeometry\", \"Vol10ObservationalEquivalence\", \"Vol11CompletenessObstructions\", \"Vol12PrincipiaPhysica\"):
 r=subprocess.run([\"lean\", \"Cmrps/\"+name+\".lean\"],env=env)
 print(name+\": exit \"+str(r.returncode),flush=True)
 if r.returncode: break'" in /Users/mlong/Documents/Development/classification-physical-systems/lean
 succeeded in 8559ms:
python3: warning: confstr() failed with code 5: couldn't get path of DARWIN_USER_TEMP_DIR; using /tmp instead
python3: error: couldn't create cache file '/tmp/xcrun_db-vZ0cCIeq' (errno=Operation not permitted)
2026-10-30 06:47:31.506 xcodebuild[30845:40749632]  DVTFilePathFSEvents: Failed to start fs event stream.
2026-10-30 06:47:31.609 xcodebuild[30845:40749631] [MT] DVTDeveloperPaths: Failed to get length of DARWIN_USER_CACHE_DIR from confstr(3), error = Error Domain=NSPOSIXErrorDomain Code=5 "Input/output error". Using NSCachesDirectory instead.
python3: warning: confstr() failed with code 5: couldn't get path of DARWIN_USER_TEMP_DIR; using /tmp instead
python3: error: couldn't create cache file '/tmp/xcrun_db-5YYFyzBK' (errno=Operation not permitted)
2026-10-30 06:47:32.035 xcodebuild[30850:40749687]  DVTFilePathFSEvents: Failed to start fs event stream.
2026-10-30 06:47:32.133 xcodebuild[30850:40749686] [MT] DVTDeveloperPaths: Failed to get length of DARWIN_USER_CACHE_DIR from confstr(3), error = Error Domain=NSPOSIXErrorDomain Code=5 "Input/output error". Using NSCachesDirectory instead.
Cmrps/Vol09GravityInformationGeometry.lean:146:27: warning: Unused tactic linter: `<;>` should be replaced with `;` or be removed.

Note: This linter can be disabled with `set_option linter.unusedTactic false`
Cmrps/Vol09GravityInformationGeometry.lean:146:31: warning: Unused tactic linter: `ring` does nothing.

Note: This linter can be disabled with `set_option linter.unusedTactic false`
Cmrps/Vol09GravityInformationGeometry.lean:146:31: warning: this tactic is never executed

Note: This linter can be disabled with `set_option linter.unreachableTactic false`
Cmrps/Vol09GravityInformationGeometry.lean:161:43: warning: Variable name `hu` is not explicitly referenced.

Hint: The binding can be removed (if unused) or named `_` (if used implicitly). Alternatively, prefix the name with `_` to silence this warning:
  [apply] _hu

Note: This linter can be disabled with `set_option linter.unusedVariables false`
Cmrps/Vol09GravityInformationGeometry.lean:194:29: warning: Unused tactic linter: `<;>` should be replaced with `;` or be removed.

Note: This linter can be disabled with `set_option linter.unusedTactic false`
Cmrps/Vol09GravityInformationGeometry.lean:194:33: warning: Unused tactic linter: `ring` does nothing.

Note: This linter can be disabled with `set_option linter.unusedTactic false`
Cmrps/Vol09GravityInformationGeometry.lean:194:33: warning: this tactic is never executed

Note: This linter can be disabled with `set_option linter.unreachableTactic false`
Cmrps/Vol09GravityInformationGeometry.lean:235:29: warning: Unused tactic linter: `<;>` should be replaced with `;` or be removed.

Note: This linter can be disabled with `set_option linter.unusedTactic false`
Cmrps/Vol09GravityInformationGeometry.lean:235:33: warning: Unused tactic linter: `ring` does nothing.

Note: This linter can be disabled with `set_option linter.unusedTactic false`
Cmrps/Vol09GravityInformationGeometry.lean:235:33: warning: this tactic is never executed

Note: This linter can be disabled with `set_option linter.unreachableTactic false`
Cmrps/Vol09GravityInformationGeometry.lean:271:35: warning: This simp argument is unused:
  this

Hint: Omit it from the simp argument list.
  [apply] simp [klRay, klDiv, perturbed]

Note: This linter can be disabled with `set_option linter.unusedSimpArgs false`
Cmrps/Vol09GravityInformationGeometry.lean:278:24: warning: This simp argument is unused:
  hi

Hint: Omit it from the simp argument list.
  [apply] simp [klRayDeriv, Real.log_one, mul_zero, zero_add, add_zero]

Note: This linter can be disabled with `set_option linter.unusedSimpArgs false`
Cmrps/Vol09GravityInformationGeometry.lean:278:28: warning: This simp argument is unused:
  Real.log_one

Hint: Omit it from the simp argument list.
  [apply] simp [klRayDeriv, hi, mul_zero, zero_add, add_zero]

Note: This linter can be disabled with `set_option linter.unusedSimpArgs false`
Cmrps/Vol09GravityInformationGeometry.lean:320:35: warning: `if_pos` has been deprecated: Use `ite_eq_left` instead

Hint: Replace the deprecated name:
  i̵f̵_̵p̵o̵s̵i̲t̲e̲_̲e̲q̲_̲l̲e̲f̲t̲
Cmrps/Vol09GravityInformationGeometry.lean:321:35: warning: `if_neg` has been deprecated: Use `ite_eq_right` instead

Hint: Replace the deprecated name:
  i̵f̵_̵n̵e̵g̵i̲t̲e̲_̲e̲q̲_̲r̲i̲g̲h̲t̲
Cmrps/Vol09GravityInformationGeometry.lean:323:36: warning: `if_pos` has been deprecated: Use `ite_eq_left` instead

Hint: Replace the deprecated name:
  i̵f̵_̵p̵o̵s̵i̲t̲e̲_̲e̲q̲_̲l̲e̲f̲t̲
Cmrps/Vol09GravityInformationGeometry.lean:324:40: warning: `if_neg` has been deprecated: Use `ite_eq_right` instead

Hint: Replace the deprecated name:
  i̵f̵_̵n̵e̵g̵i̲t̲e̲_̲e̲q̲_̲r̲i̲g̲h̲t̲
Cmrps/Vol09GravityInformationGeometry.lean:325:40: warning: `if_neg` has been deprecated: Use `ite_eq_right` instead

Hint: Replace the deprecated name:
  i̵f̵_̵n̵e̵g̵i̲t̲e̲_̲e̲q̲_̲r̲i̲g̲h̲t̲
Cmrps/Vol09GravityInformationGeometry.lean:326:36: warning: `if_pos` has been deprecated: Use `ite_eq_left` instead

Hint: Replace the deprecated name:
  i̵f̵_̵p̵o̵s̵i̲t̲e̲_̲e̲q̲_̲l̲e̲f̲t̲
Cmrps/Vol09GravityInformationGeometry.lean:328:49: warning: `if_pos` has been deprecated: Use `ite_eq_left` instead

Hint: Replace the deprecated name:
  i̵f̵_̵p̵o̵s̵i̲t̲e̲_̲e̲q̲_̲l̲e̲f̲t̲
Cmrps/Vol09GravityInformationGeometry.lean:328:61: warning: `if_pos` has been deprecated: Use `ite_eq_left` instead

Hint: Replace the deprecated name:
  i̵f̵_̵p̵o̵s̵i̲t̲e̲_̲e̲q̲_̲l̲e̲f̲t̲
Cmrps/Vol09GravityInformationGeometry.lean:329:32: warning: `if_neg` has been deprecated: Use `ite_eq_right` instead

Hint: Replace the deprecated name:
  i̵f̵_̵n̵e̵g̵i̲t̲e̲_̲e̲q̲_̲r̲i̲g̲h̲t̲
Cmrps/Vol09GravityInformationGeometry.lean:330:32: warning: `if_neg` has been deprecated: Use `ite_eq_right` instead

Hint: Replace the deprecated name:
  i̵f̵_̵n̵e̵g̵i̲t̲e̲_̲e̲q̲_̲r̲i̲g̲h̲t̲
Cmrps/Vol09GravityInformationGeometry.lean:331:50: warning: `if_pos` has been deprecated: Use `ite_eq_left` instead

Hint: Replace the deprecated name:
  i̵f̵_̵p̵o̵s̵i̲t̲e̲_̲e̲q̲_̲l̲e̲f̲t̲
Cmrps/Vol09GravityInformationGeometry.lean:331:62: warning: `if_neg` has been deprecated: Use `ite_eq_right` instead

Hint: Replace the deprecated name:
  i̵f̵_̵n̵e̵g̵i̲t̲e̲_̲e̲q̲_̲r̲i̲g̲h̲t̲
Cmrps/Vol09GravityInformationGeometry.lean:364:22: warning: Unused tactic linter: `<;>` should be replaced with `;` or be removed.

Note: This linter can be disabled with `set_option linter.unusedTactic false`
Cmrps/Vol09GravityInformationGeometry.lean:364:26: warning: Unused tactic linter: `ring` does nothing.

Note: This linter can be disabled with `set_option linter.unusedTactic false`
Cmrps/Vol09GravityInformationGeometry.lean:364:26: warning: this tactic is never executed

Note: This linter can be disabled with `set_option linter.unreachableTactic false`
Cmrps/Vol09GravityInformationGeometry.lean:460:57: warning: `if_pos` has been deprecated: Use `ite_eq_left` instead

Hint: Replace the deprecated name:
  i̵f̵_̵p̵o̵s̵i̲t̲e̲_̲e̲q̲_̲l̲e̲f̲t̲
Cmrps/Vol09GravityInformationGeometry.lean:461:57: warning: `if_neg` has been deprecated: Use `ite_eq_right` instead

Hint: Replace the deprecated name:
  i̵f̵_̵n̵e̵g̵i̲t̲e̲_̲e̲q̲_̲r̲i̲g̲h̲t̲
Cmrps/Vol09GravityInformationGeometry.lean:495:22: warning: This simp argument is unused:
  h

Hint: Omit it from the simp argument list.
  [apply] simp [sldBlochForm]

Note: This linter can be disabled with `set_option linter.unusedSimpArgs false`
Cmrps/Vol09GravityInformationGeometry.lean:495:25: warning: Unused tactic linter: `<;>` should be replaced with `;` or be removed.

Note: This linter can be disabled with `set_option linter.unusedTactic false`
Cmrps/Vol09GravityInformationGeometry.lean:495:29: warning: Unused tactic linter: `field_simp` does nothing.

Note: This linter can be disabled with `set_option linter.unusedTactic false`
Cmrps/Vol09GravityInformationGeometry.lean:495:40: warning: Unused tactic linter: `<;>` should be replaced with `;` or be removed.

Note: This linter can be disabled with `set_option linter.unusedTactic false`
Cmrps/Vol09GravityInformationGeometry.lean:495:44: warning: Unused tactic linter: `ring` does nothing.

Note: This linter can be disabled with `set_option linter.unusedTactic false`
Cmrps/Vol09GravityInformationGeometry.lean:495:29: warning: this tactic is never executed

Note: This linter can be disabled with `set_option linter.unreachableTactic false`
Cmrps/Vol09GravityInformationGeometry.lean:495:44: warning: this tactic is never executed

Note: This linter can be disabled with `set_option linter.unreachableTactic false`
Cmrps/Vol09GravityInformationGeometry.lean:502:22: warning: This simp argument is unused:
  h

Hint: Omit it from the simp argument list.
  [apply] simp [sldBlochForm]

Note: This linter can be disabled with `set_option linter.unusedSimpArgs false`
Vol09GravityInformationGeometry: exit 0
Vol10ObservationalEquivalence: exit 0
Cmrps/Vol11CompletenessObstructions.lean:119:19: warning: Variable name `ρ` is not explicitly referenced.

Hint: The binding can be removed (if unused) or named `_` (if used implicitly). Alternatively, prefix the name with `_` to silence this warning:
  [apply] _ρ

Note: This linter can be disabled with `set_option linter.unusedVariables false`
Cmrps/Vol11CompletenessObstructions.lean:189:6: warning: Variable name `hcount` is not explicitly referenced.

Hint: The binding can be removed (if unused) or named `_` (if used implicitly). Alternatively, prefix the name with `_` to silence this warning:
  [apply] _hcount

Note: This linter can be disabled with `set_option linter.unusedVariables false`
Cmrps/Vol11CompletenessObstructions.lean:197:29: warning: Variable name `c` is not explicitly referenced.

Hint: The binding can be removed (if unused) or named `_` (if used implicitly). Alternatively, prefix the name with `_` to silence this warning:
  [apply] _c

Note: This linter can be disabled with `set_option linter.unusedVariables false`
Cmrps/Vol11CompletenessObstructions.lean:198:20: warning: Variable name `c` is not explicitly referenced.

Hint: The binding can be removed (if unused) or named `_` (if used implicitly). Alternatively, prefix the name with `_` to silence this warning:
  [apply] _c

Note: This linter can be disabled with `set_option linter.unusedVariables false`
Cmrps/Vol11CompletenessObstructions.lean:378:32: warning: Variable name `ρ` is not explicitly referenced.

Hint: The binding can be removed (if unused) or named `_` (if used implicitly). Alternatively, prefix the name with `_` to silence this warning:
  [apply] _ρ

Note: This linter can be disabled with `set_option linter.unusedVariables false`
Vol11CompletenessObstructions: exit 0
Cmrps/Vol12PrincipiaPhysica.lean:1:0: warning: 
'Mathlib.Data.Real.Basic' has been deprecated: please replace this import by

import Mathlib.Basic.Real.Basic
Cmrps/Vol12PrincipiaPhysica.lean:251:2: warning: Try this: 
  letI̵

The goal is a proposition, so `let` is preferred over `letI`.
The difference between `let` and `letI` is that `letI` inlines the value.
But this is not relevant for proofs because of proof irrelevance.

Note: This linter can be disabled with `set_option linter.style.haveILetI false`
Cmrps/Vol12PrincipiaPhysica.lean:279:5: warning: Variable name `hE` is not explicitly referenced.

Hint: The binding can be removed (if unused) or named `_` (if used implicitly). Alternatively, prefix the name with `_` to silence this warning:
  [apply] _hE

Note: This linter can be disabled with `set_option linter.unusedVariables false`
Vol12PrincipiaPhysica: exit 0

codex
All twelve Lean modules elaborated successfully. I found no `sorry`, `admit`, new axiom declarations, or incomplete matches. The fixes below concern semantic mismatches and Mathlib duplication.
codex
All twelve Lean modules elaborated successfully with Lean 4.35.0. I found no `sorry`, `admit`, new axiom declarations, or incomplete matches. Namespaces are consistently qualified. The following semantic and Mathlib reuse issues remain.

1. **High — Undecidability transport has an impossible hypothesis.**  
   [Vol11CompletenessObstructions.lean:205](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol11CompletenessObstructions.lean:205) defines decidability as the existence of an arbitrary Boolean function. Classically, every predicate satisfies this definition using `fun x => decide (P x)`. Consequently, `hmarkov` at line 219 is contradictory, making the transport theorem vacuous. `Recognizer` at line 46 has the same algorithmic gap. The [paper proposition](/Users/mlong/Documents/Development/classification-physical-systems/papers/latex/vol-11-completeness-obstructions.tex:365) requires computable procedures and a computable reduction.  
   **Fix:** encode presentations, require computable deciders, and add computability of `φ`.

2. **High — The Petz statement omits essential hypotheses and includes false cases.**  
   [Vol10ObservationalEquivalence.lean:351](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol10ObservationalEquivalence.lean:351) asserts that every normalized self-reciprocal function produces a monotone metric; operator monotonicity of the function is never required. Its injectivity clause also permits `n = 0` or `n = 1`, where distinct normalized representatives cannot be distinguished by these forms. `SelfReciprocal` at line 341 additionally imposes the identity on negative arguments, beyond the positive domain of the [paper’s classification](/Users/mlong/Documents/Development/classification-physical-systems/papers/latex/vol-10-observational-equivalence.tex:327). This is an unproved `Prop` definition, so it causes no kernel inconsistency, but it is an incorrect statement skeleton.  
   **Fix:** include operator monotonicity, positivity, normalization, positive eigenvalues, appropriate tangent directions, and dimension hypotheses; identify functions on their positive domain.

3. **High — Structural independence collapses to cardinality comparison.**  
   [Vol02StructuralFamilies.lean:696](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol02StructuralFamilies.lean:696) models a full embedding as an injection of object types. By classical comparability of embeddings, one direction always exists, so `Independent F G` is always false. Likewise, an arbitrary bijection at line 700 does not express structural reconstruction. This changes the meaning of the [paper’s definition](/Users/mlong/Documents/Development/classification-physical-systems/papers/latex/vol-02-structural-families.tex:569).  
   **Fix:** equip families with categories and use fully faithful functors and structure-preserving equivalences or anti-equivalences.

4. **Medium — Distinguishing is weaker than the paper’s definition.**  
   [Vol08SpacetimeReconstruction.lean:76](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol08SpacetimeReconstruction.lean:76) requires equal pasts **and** equal futures before concluding equality. The [paper](/Users/mlong/Documents/Development/classification-physical-systems/papers/latex/vol-08-spacetime-reconstruction.tex:89) requires past-distinguishing and future-distinguishing separately. A three-point strict order containing only `0 < 1`, with `2` isolated, satisfies the Lean definition but fails both separate injectivity conditions.  
   **Fix:** define `Function.Injective (Past r) ∧ Function.Injective (Future r)` and update the antichain proof accordingly.

5. **Medium — The general limits theorem concerns the wrong functor.**  
   [Vol04YonedaClassification.lean:210](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol04YonedaClassification.lean:210) proves that the fixed representable `Hom(-, P) : Cᵒᵖ ⥤ Type v` preserves limits. The [paper proposition](/Users/mlong/Documents/Development/classification-physical-systems/papers/latex/vol-04-yoneda-classification.tex:225) concerns the embedding `yoneda : C ⥤ (Cᵒᵖ ⥤ Type v)`. The subsequent product and terminal results use the correct embedding.  
   **Fix:** state preservation for `CategoryTheory.yoneda`, remove the unnecessary `P`, and use Mathlib’s `yonedaFunctor_preservesLimits`.

6. **Medium — `NotFactoring` does not express failure of factorization.**  
   [Vol12PrincipiaPhysica.lean:37](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol12PrincipiaPhysica.lean:37) expresses unequal induced equivalence relations. For example, `cls = id` and a constant `select` satisfy this predicate even though selection factors through classification.  
   **Fix:** rename it to describe unequal induced relations. Alternatively, the existing hypotheses prove the precise reverse-direction obstruction `¬ ∃ f : Obs → M, ∀ p, f (select p) = cls p`; adjust the theorem’s name and explanation to that statement.

7. **Medium — Distinct operator-monotone functions do not establish the advertised metric conclusion.**  
   [Vol12PrincipiaPhysica.lean:257](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol12PrincipiaPhysica.lean:257) concludes only that an abstract predicate contains two distinct functions. It supplies no correspondence to metrics or proof of nonproportionality. Moreover, `f_id` is outside the self-reciprocal parameter class: at `t = 2`, `f(t) ≠ t f(1/t)`. The [paper proof](/Users/mlong/Documents/Development/classification-physical-systems/papers/latex/vol-12-principia-physica.tex:351) repeats this witness issue.  
   **Fix:** use the SLD and Wigner–Yanase representatives and the existing nonproportionality result in `Vol09`, with explicit admissibility inputs.

8. **Medium — Existing Mathlib constructions are reimplemented.**  
   Concrete instances include:

   - [Vol08SpacetimeReconstruction.lean:364](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol08SpacetimeReconstruction.lean:364): use `Topology.upperSet` and `Topology.IsUpperSet` results, including `closure_singleton`.
   - [Vol02StructuralFamilies.lean:285](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol02StructuralFamilies.lean:285): replace the membership proof with `Multiset.mem_product`; at line 736, use `Set.equivOfEq`.
   - [Vol01Foundations.lean:155](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol01Foundations.lean:155): replace `CategoryData` with `CategoryTheory.Category`, using separate object wrappers for the three morphism kinds.

   **Fix:** retain paper-facing aliases where useful, while delegating the underlying constructions and proofs to Mathlib.

VERDICT: NEEDS_FIX
hook: Stop
hook: Stop Completed
tokens used
216,351
All twelve Lean modules elaborated successfully with Lean 4.35.0. I found no `sorry`, `admit`, new axiom declarations, or incomplete matches. Namespaces are consistently qualified. The following semantic and Mathlib reuse issues remain.

1. **High — Undecidability transport has an impossible hypothesis.**  
   [Vol11CompletenessObstructions.lean:205](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol11CompletenessObstructions.lean:205) defines decidability as the existence of an arbitrary Boolean function. Classically, every predicate satisfies this definition using `fun x => decide (P x)`. Consequently, `hmarkov` at line 219 is contradictory, making the transport theorem vacuous. `Recognizer` at line 46 has the same algorithmic gap. The [paper proposition](/Users/mlong/Documents/Development/classification-physical-systems/papers/latex/vol-11-completeness-obstructions.tex:365) requires computable procedures and a computable reduction.  
   **Fix:** encode presentations, require computable deciders, and add computability of `φ`.

2. **High — The Petz statement omits essential hypotheses and includes false cases.**  
   [Vol10ObservationalEquivalence.lean:351](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol10ObservationalEquivalence.lean:351) asserts that every normalized self-reciprocal function produces a monotone metric; operator monotonicity of the function is never required. Its injectivity clause also permits `n = 0` or `n = 1`, where distinct normalized representatives cannot be distinguished by these forms. `SelfReciprocal` at line 341 additionally imposes the identity on negative arguments, beyond the positive domain of the [paper’s classification](/Users/mlong/Documents/Development/classification-physical-systems/papers/latex/vol-10-observational-equivalence.tex:327). This is an unproved `Prop` definition, so it causes no kernel inconsistency, but it is an incorrect statement skeleton.  
   **Fix:** include operator monotonicity, positivity, normalization, positive eigenvalues, appropriate tangent directions, and dimension hypotheses; identify functions on their positive domain.

3. **High — Structural independence collapses to cardinality comparison.**  
   [Vol02StructuralFamilies.lean:696](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol02StructuralFamilies.lean:696) models a full embedding as an injection of object types. By classical comparability of embeddings, one direction always exists, so `Independent F G` is always false. Likewise, an arbitrary bijection at line 700 does not express structural reconstruction. This changes the meaning of the [paper’s definition](/Users/mlong/Documents/Development/classification-physical-systems/papers/latex/vol-02-structural-families.tex:569).  
   **Fix:** equip families with categories and use fully faithful functors and structure-preserving equivalences or anti-equivalences.

4. **Medium — Distinguishing is weaker than the paper’s definition.**  
   [Vol08SpacetimeReconstruction.lean:76](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol08SpacetimeReconstruction.lean:76) requires equal pasts **and** equal futures before concluding equality. The [paper](/Users/mlong/Documents/Development/classification-physical-systems/papers/latex/vol-08-spacetime-reconstruction.tex:89) requires past-distinguishing and future-distinguishing separately. A three-point strict order containing only `0 < 1`, with `2` isolated, satisfies the Lean definition but fails both separate injectivity conditions.  
   **Fix:** define `Function.Injective (Past r) ∧ Function.Injective (Future r)` and update the antichain proof accordingly.

5. **Medium — The general limits theorem concerns the wrong functor.**  
   [Vol04YonedaClassification.lean:210](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol04YonedaClassification.lean:210) proves that the fixed representable `Hom(-, P) : Cᵒᵖ ⥤ Type v` preserves limits. The [paper proposition](/Users/mlong/Documents/Development/classification-physical-systems/papers/latex/vol-04-yoneda-classification.tex:225) concerns the embedding `yoneda : C ⥤ (Cᵒᵖ ⥤ Type v)`. The subsequent product and terminal results use the correct embedding.  
   **Fix:** state preservation for `CategoryTheory.yoneda`, remove the unnecessary `P`, and use Mathlib’s `yonedaFunctor_preservesLimits`.

6. **Medium — `NotFactoring` does not express failure of factorization.**  
   [Vol12PrincipiaPhysica.lean:37](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol12PrincipiaPhysica.lean:37) expresses unequal induced equivalence relations. For example, `cls = id` and a constant `select` satisfy this predicate even though selection factors through classification.  
   **Fix:** rename it to describe unequal induced relations. Alternatively, the existing hypotheses prove the precise reverse-direction obstruction `¬ ∃ f : Obs → M, ∀ p, f (select p) = cls p`; adjust the theorem’s name and explanation to that statement.

7. **Medium — Distinct operator-monotone functions do not establish the advertised metric conclusion.**  
   [Vol12PrincipiaPhysica.lean:257](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol12PrincipiaPhysica.lean:257) concludes only that an abstract predicate contains two distinct functions. It supplies no correspondence to metrics or proof of nonproportionality. Moreover, `f_id` is outside the self-reciprocal parameter class: at `t = 2`, `f(t) ≠ t f(1/t)`. The [paper proof](/Users/mlong/Documents/Development/classification-physical-systems/papers/latex/vol-12-principia-physica.tex:351) repeats this witness issue.  
   **Fix:** use the SLD and Wigner–Yanase representatives and the existing nonproportionality result in `Vol09`, with explicit admissibility inputs.

8. **Medium — Existing Mathlib constructions are reimplemented.**  
   Concrete instances include:

   - [Vol08SpacetimeReconstruction.lean:364](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol08SpacetimeReconstruction.lean:364): use `Topology.upperSet` and `Topology.IsUpperSet` results, including `closure_singleton`.
   - [Vol02StructuralFamilies.lean:285](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol02StructuralFamilies.lean:285): replace the membership proof with `Multiset.mem_product`; at line 736, use `Set.equivOfEq`.
   - [Vol01Foundations.lean:155](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol01Foundations.lean:155): replace `CategoryData` with `CategoryTheory.Category`, using separate object wrappers for the three morphism kinds.

   **Fix:** retain paper-facing aliases where useful, while delegating the underlying constructions and proofs to Mathlib.

VERDICT: NEEDS_FIX
