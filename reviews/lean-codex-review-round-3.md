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
session id: 01a18cb2-0b44-7771-a74e-e130f58f3d4f
--------
user
Read ONLY the files under lean/ and papers/latex/*.tex (do not explore other directories). Review the Lean 4 + Mathlib sources under lean/ for: type correctness, missing hypotheses, over-strong claims vs their paper statements (check against papers/latex/*.tex), incomplete patterns, unsound axioms or sorry usage, Mathlib idempotence (no re-proving Mathlib), clarity of namespaces. House rule: no style nits on dashes. This is review round 3 (final). Round 2 raised 5 issues; the fixes applied were: (1) Vol10 petz_sudar_parametricity skeleton now takes an explicit OperatorMonotone parameter and requires n >= 2, positive eigenvalues, symmetric tangents; (2) Vol02 cotangent_retract rescope as the product-bundle fragment with the full T*Q statement marked unformalized; (3) Vol02 globality_no_local_classifier rescope to germ constancy; (4) Vol03 sizeSemigroup documented as closure with the tensor unit adjoined; (5) Vol02 mem_product is now a thin alias of Multiset.mem_product and subtypeEquivOfEq aliases Set.equivOfEq (CategoryData in Vol01 is deliberately kept as the paper-facing model, documented). Verify these fixes. List any remaining issues with file:line references and concrete fixes. End your response with a VERDICT line — exactly one of: VERDICT: PASS or VERDICT: NEEDS_FIX.
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
I’ll review the permitted Lean sources against the LaTeX statements, verify the five round-two fixes, and report any remaining issues with concrete fixes.
exec
/usr/local/bin/zsh -lc "rg --files lean papers/latex -g '*.lean' -g '*.tex' -g 'lean-toolchain' -g 'lakefile.*' -g 'lake-manifest.json'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
lean/lakefile.toml
papers/latex/vol-08-spacetime-reconstruction.tex
lean/Cmrps.lean
lean/lake-manifest.json
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
/usr/local/bin/zsh -lc "wc -l lean/Cmrps/*.lean papers/latex/*.tex; rg -n 'sorry|axiom|admit|unsafe|partial|TODO|unformal|skeleton|OperatorMonotone|petz_sudar|cotangent_retract|globality_no_local_classifier|sizeSemigroup|mem_product|subtypeEquivOfEq|CategoryData' lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
     808 lean/Cmrps/Vol01Foundations.lean
     805 lean/Cmrps/Vol02StructuralFamilies.lean
     345 lean/Cmrps/Vol03IrreducibilityDecomposition.lean
     415 lean/Cmrps/Vol04YonedaClassification.lean
     498 lean/Cmrps/Vol05ClassicalSystems.lean
     298 lean/Cmrps/Vol06QuantumSystems.lean
     308 lean/Cmrps/Vol07GaugeQft.lean
     477 lean/Cmrps/Vol08SpacetimeReconstruction.lean
     516 lean/Cmrps/Vol09GravityInformationGeometry.lean
     444 lean/Cmrps/Vol10ObservationalEquivalence.lean
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
   15237 total
lean/Cmrps/Vol11CompletenessObstructions.lean:25:file uses `sorry` or an axiom.
lean/Cmrps/Vol11CompletenessObstructions.lean:209:this is an *extensional* skeleton — classically `fun x => decide (Q x)` satisfies
lean/Cmrps/Vol11CompletenessObstructions.lean:255:which no infinite family reaches and which admits no finite listing cannot be
lean/Cmrps/Vol09GravityInformationGeometry.lean:454:(target 7, partial) -/
lean/Cmrps/Vol09GravityInformationGeometry.lean:506:/-! ## Proposition 9.1 — ideal-gas Ruppeiner geometry (target 9, partial) -/
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:28:All statements below are fully proved; nothing uses `sorry`, `axiom`, or `native_decide`.
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:74:unless nullary tensor products are admitted (the paper's convention). -/
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:75:def sizeSemigroup (S : Set ℕ) : Submonoid ℕ :=
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:80:unit `1` (see the caveat on `sizeSemigroup`). -/
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:82:  ∀ ⦃x⦄, x ∈ v → x ∈ sizeSemigroup S
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:203:/-- Worked example (paper `ex:superselection`), witness form: `M_2 ⊕ M_2` admits no
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:238:/-- Paper Table 4.1 row 3: column sums `(1, 2)` admit `2 × 3 = 6` multiplicity matrices.
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:267:theorem mem_sizeSemigroup_of_mem {S : Set ℕ} {x : ℕ} (hx : x ∈ S) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:268:    x ∈ sizeSemigroup S :=
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:271:theorem one_mem_sizeSemigroup (S : Set ℕ) : 1 ∈ sizeSemigroup S :=
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:274:theorem mul_mem_sizeSemigroup {S : Set ℕ} {x y : ℕ}
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:275:    (hx : x ∈ sizeSemigroup S) (hy : y ∈ sizeSemigroup S) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:276:    x * y ∈ sizeSemigroup S :=
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:304:  exact mem_sizeSemigroup_of_mem hx
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:308:theorem mem_sizeSemigroup_one_two (x : ℕ) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:309:    x ∈ sizeSemigroup ({1, 2} : Set ℕ) ↔ ∃ k, x = 2 ^ k := by
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:339:theorem three_not_mem_sizeSemigroup_one_two :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:340:    (3 : ℕ) ∉ sizeSemigroup ({1, 2} : Set ℕ) := by
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:342:  obtain ⟨k, hk⟩ := (mem_sizeSemigroup_one_two 3).mp h
lean/Cmrps/Vol10ObservationalEquivalence.lean:13:logical skeleton, with the classical inputs recorded as explicit hypotheses or as
lean/Cmrps/Vol10ObservationalEquivalence.lean:14:statement definitions left unproved. Nothing in this file uses `sorry` or new axioms.
lean/Cmrps/Vol10ObservationalEquivalence.lean:318:/-- Theorem 5.1 (Chentsov), statement skeleton (unproved; literature): every monotone
lean/Cmrps/Vol10ObservationalEquivalence.lean:320:monotonicity predicate is external to this skeleton and is left as a parameter. -/
lean/Cmrps/Vol10ObservationalEquivalence.lean:347:/-- Theorem 5.2 (`petz_sudar_parametricity`), statement skeleton (unproved; literature):
lean/Cmrps/Vol10ObservationalEquivalence.lean:350:on self-adjoint directions at positive eigenvalues. `OperatorMonotone` is a parameter
lean/Cmrps/Vol10ObservationalEquivalence.lean:352:module. The skeleton requires `n ≥ 2`, positive eigenvalues, and symmetric tangent
lean/Cmrps/Vol10ObservationalEquivalence.lean:355:def petz_sudar_parametricity {n : ℕ}
lean/Cmrps/Vol10ObservationalEquivalence.lean:356:    (OperatorMonotone : (ℚ → ℚ) → Prop)
lean/Cmrps/Vol10ObservationalEquivalence.lean:359:  (∀ f : ℚ → ℚ, NormalizedAtOne f → SelfReciprocal f → OperatorMonotone f →
lean/Cmrps/Vol10ObservationalEquivalence.lean:361:    (∀ m, monotone m → ∃ f : ℚ → ℚ, NormalizedAtOne f ∧ SelfReciprocal f ∧ OperatorMonotone f ∧
lean/Cmrps/Vol10ObservationalEquivalence.lean:364:      OperatorMonotone f → OperatorMonotone g → f ≠ g →
lean/Cmrps/Vol12PrincipiaPhysica.lean:13:formalized as their honest logical skeleton, with the classical inputs recorded as explicit
lean/Cmrps/Vol12PrincipiaPhysica.lean:14:hypotheses. Nothing in this file uses `sorry` or new axioms.
lean/Cmrps/Vol12PrincipiaPhysica.lean:250:/-- Target 6, gap clause: a parameterized family with more than one element admits no
lean/Cmrps/Vol12PrincipiaPhysica.lean:262:`IsOperatorMonotone` predicate has two distinct members — it proves NO correspondence to
lean/Cmrps/Vol12PrincipiaPhysica.lean:269:    (IsOperatorMonotone : (ℝ → ℝ) → Prop)
lean/Cmrps/Vol12PrincipiaPhysica.lean:270:    (hid : IsOperatorMonotone f_id) (haff : IsOperatorMonotone f_aff) :
lean/Cmrps/Vol12PrincipiaPhysica.lean:271:    ¬ Subsingleton { f : ℝ → ℝ // IsOperatorMonotone f } :=
lean/Cmrps/Vol02StructuralFamilies.lean:40:7. `cotangent_retract`            — paper Proposition 4.1 (the homotopy `r_t`)
lean/Cmrps/Vol02StructuralFamilies.lean:184:theorem globality_no_local_classifier {G : SymplecticGermField} {A : Type v}
lean/Cmrps/Vol02StructuralFamilies.lean:289:/-- Membership in a multiset product (thin alias for Mathlib's `Multiset.mem_product`). -/
lean/Cmrps/Vol02StructuralFamilies.lean:290:private theorem mem_product {v w : Multiset ℕ} {p : ℕ × ℕ} :
lean/Cmrps/Vol02StructuralFamilies.lean:292:  Multiset.mem_product
lean/Cmrps/Vol02StructuralFamilies.lean:298:  rcases mem_product.1 hp with ⟨h₁, h₂⟩
lean/Cmrps/Vol02StructuralFamilies.lean:607:theorem cotangent_retract :
lean/Cmrps/Vol02StructuralFamilies.lean:716:/-- Paper Proposition 16.2: a family admits a classifying invariant when some map on
lean/Cmrps/Vol02StructuralFamilies.lean:729:/-- Paper Proposition 16.2: two families may each admit a classifying invariant and
lean/Cmrps/Vol02StructuralFamilies.lean:746:def subtypeEquivOfEq {γ : Type*} {s t : Set γ} (h : s = t) : ↥s ≃ ↥t :=
lean/Cmrps/Vol02StructuralFamilies.lean:801:  refine ⟨(e₁.trans (subtypeEquivOfEq hr₁)).symm.trans (e₂.trans (subtypeEquivOfEq hr₂))⟩
lean/Cmrps/Vol08SpacetimeReconstruction.lean:45:  partial order is T0, the closure of a singleton is its down-set, and the order
lean/Cmrps/Vol08SpacetimeReconstruction.lean:392:partial order are separated by an up-set. -/
lean/Cmrps/Vol08SpacetimeReconstruction.lean:432:/-- Proposition 9.4 (prop:specialization): the up-set topology of a partial order
lean/Cmrps/Vol08SpacetimeReconstruction.lean:447:the up-set topology of a partial order is T₀, the closure of each singleton is
lean/Cmrps/Vol08SpacetimeReconstruction.lean:458:`geometrization_dim3`, partial) -/
lean/Cmrps/Vol06QuantumSystems.lean:106:  have hp1 : p.1 ∈ l₁ ∧ p.2 ∈ l₂ := List.mem_product.mp hp
lean/Cmrps/Vol06QuantumSystems.lean:252:def partialTrace₂ {n m : ℕ}
lean/Cmrps/Vol06QuantumSystems.lean:257:theorem partialTrace₂_apply {n m : ℕ}
lean/Cmrps/Vol06QuantumSystems.lean:259:    partialTrace₂ J i j = ∑ a : Fin m, J (i, a) (j, a) := rfl
lean/Cmrps/Vol06QuantumSystems.lean:265:/-- The partial trace of a Choi matrix along the second factor has entries
lean/Cmrps/Vol06QuantumSystems.lean:267:theorem partialTrace₂_choi_apply {n m : ℕ}
lean/Cmrps/Vol06QuantumSystems.lean:269:    partialTrace₂ (choi Φ) i j = Matrix.trace (Φ (matrixUnit i j)) := by
lean/Cmrps/Vol06QuantumSystems.lean:274:matrix units exactly when the partial trace of its Choi matrix is the identity,
lean/Cmrps/Vol06QuantumSystems.lean:278:    partialTrace₂ (choi Φ) = 1 ↔
lean/Cmrps/Vol06QuantumSystems.lean:284:    rw [partialTrace₂_choi_apply, Matrix.one_apply] at h
lean/Cmrps/Vol06QuantumSystems.lean:287:    rw [partialTrace₂_choi_apply, Matrix.one_apply]
lean/Cmrps/Vol04YonedaClassification.lean:351:def partialTrace {n m : ℕ} (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ) : M n :=
lean/Cmrps/Vol04YonedaClassification.lean:371:      partialTrace (choiMatrix Φ) = 1 := by
lean/Cmrps/Vol04YonedaClassification.lean:373:      partialTrace (choiMatrix Φ) i j = Matrix.trace (Φ (Matrix.single i j 1)) := by
lean/Cmrps/Vol05ClassicalSystems.lean:40:are recorded, unformalized, in
lean/Cmrps/Vol01Foundations.lean:155:structure CategoryData (Obj : Type u) (Hom : Obj → Obj → Type v) where
lean/Cmrps/Vol01Foundations.lean:179:def coarseGraining_kindCategory : CategoryData FinRec CoarseHom where
lean/Cmrps/Vol01Foundations.lean:188:def embedding_kindCategory : CategoryData FinRec EmbeddingHom where
lean/Cmrps/Vol01Foundations.lean:197:def equivalenceMorphism_kindCategory : CategoryData FinRec EquivalenceHom where
lean/Cmrps/Vol01Foundations.lean:217:in force, and fails on the admitted record `X = Fin 2`, `O = {δ₀, δ₁}` of point

exec
/usr/local/bin/zsh -lc 'cat lean/lakefile.toml lean/lean-toolchain lean/Cmrps.lean; nl -ba lean/Cmrps/Vol10ObservationalEquivalence.lean' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
name = "Cmrps"
version = "0.1.0"
defaultTargets = ["Cmrps"]

[[require]]
name = "mathlib"
git = "https://github.com/leanprover-community/mathlib4"
rev = "56a005855ea17e0b0958f73ec801ae140b0a1679"

[[lean_lib]]
name = "Cmrps"
leanprover/lean4:v4.35.0import Cmrps.Vol01Foundations
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
     1	import Mathlib.Algebra.BigOperators.Group.Finset.Basic
     2	import Mathlib.Tactic
     3	
     4	/-!
     5	# Observational Equivalence and Physical Distinguishability (Volume 10)
     6	
     7	Formalization of the tractable mechanization targets of
     8	`verification/vol-10-observational-equivalence-lean-targets.md`, mirroring the names of
     9	`papers/latex/vol-10-observational-equivalence.tex`.
    10	
    11	Policy of this module: definitions are stated directly; survey theorems whose content is
    12	external literature (Etingof–Gelaki, Chentsov, Petz–Sudar) are formalized as their honest
    13	logical skeleton, with the classical inputs recorded as explicit hypotheses or as
    14	statement definitions left unproved. Nothing in this file uses `sorry` or new axioms.
    15	-/
    16	
    17	namespace Cmrps.Vol10
    18	
    19	/-! ## Equivalence notions (Definitions 2.1–2.7) -/
    20	
    21	/-- Definition 2.1 (System record): a physical system representation is a tuple
    22	`P = (X, O, D, S, C)` of state space, observable collection, dynamics, symmetry and
    23	constraint data, and composition rules. -/
    24	structure SystemRecord where
    25	  /-- State space or geometric structure. -/
    26	  X : Type
    27	  /-- Observable algebra or collection. -/
    28	  O : Type
    29	  /-- Dynamical data. -/
    30	  D : Type
    31	  /-- Symmetry and constraint data. -/
    32	  S : Type
    33	  /-- Composition or interaction rules. -/
    34	  C : Type
    35	
    36	/-- Definition 2.5 (admissible candidate relation): a candidate `≃` is admissible only if
    37	`≅ ⊆ ≃` and `≃` is contained in the intersection of the admissible observational
    38	relations. Here `mathIso` is mathematical equivalence and `admissible` is the family of
    39	admissible observational relations `≈_Obs`. -/
    40	def AdmissibleCandidate {S : Type*} (mathIso : S → S → Prop)
    41	    (admissible : Set (S → S → Prop)) (candidate : S → S → Prop) : Prop :=
    42	  (∀ P Q, mathIso P Q → candidate P Q) ∧
    43	    ∀ P Q, candidate P Q → ∀ rel ∈ admissible, rel P Q
    44	
    45	/-- The equivalence notion in force (Definition 2.6). -/
    46	inductive EquivalenceNotion where
    47	  | mathematical
    48	  | physical
    49	deriving DecidableEq, Repr
    50	
    51	/-- The morphism kinds of the object schema at the observational level
    52	(Definition 2.7). -/
    53	inductive MorphismKind where
    54	  | coarseGraining
    55	  | embedding
    56	  | duality
    57	  | limitingProcedure
    58	deriving DecidableEq, Repr
    59	
    60	/-- The layers of structure an identification may preserve (Definition 2.6, Table 3). -/
    61	inductive PreservedLayer where
    62	  | symmetricMonoidal
    63	  | braided
    64	  | monoidalWithoutSymmetry
    65	  | star
    66	  | algebraic
    67	  | topological
    68	  | completePositivity
    69	  | unitaryFreedom
    70	deriving DecidableEq, Repr
    71	
    72	/-- Definition 2.6 (equivalence witness): an identification of two systems records the
    73	equivalence notion in force, the morphism kind realizing it, and the layers of structure
    74	it preserves. -/
    75	structure EquivalenceWitness where
    76	  /-- The equivalence notion in force. -/
    77	  notion : EquivalenceNotion
    78	  /-- The morphism kind realizing the identification. -/
    79	  morphism : MorphismKind
    80	  /-- The layers of structure the identification preserves. -/
    81	  preservedLayers : Set PreservedLayer
    82	
    83	/-- A witness declares the symmetric monoidal layer. -/
    84	def DeclaresSymmetric (w : EquivalenceWitness) : Prop :=
    85	  PreservedLayer.symmetricMonoidal ∈ w.preservedLayers
    86	
    87	/-! ## Observation functors (Definition 4.1, Definition 2.4) -/
    88	
    89	/-- Definition 4.1 (observation functor), skeletal form: a functor `Obs` from systems to
    90	observation records, with record comparison abstracted as record isomorphism (an
    91	equivalence relation on records). -/
    92	structure ObservationFunctor (S R : Type*) where
    93	  /-- The observation record of a system. -/
    94	  obs : S → R
    95	  /-- Isomorphism of observation records. -/
    96	  recordIso : R → R → Prop
    97	  /-- Record isomorphism is an equivalence relation. -/
    98	  recordIso_equiv : Equivalence recordIso
    99	
   100	/-- Definition 2.4 (observational equivalence): `P ≈ Q` when the observation records of
   101	`P` and `Q` are isomorphic. -/
   102	def obsEquiv {S R : Type*} (F : ObservationFunctor S R) (P Q : S) : Prop :=
   103	  F.recordIso (F.obs P) (F.obs Q)
   104	
   105	/-- The record isomorphism class of a record (Proposition 4.2). -/
   106	def recordClass {R : Type*} (rel : R → R → Prop) (h : Equivalence rel) : R → Quotient ⟨rel, h⟩ :=
   107	  Quotient.mk ⟨rel, h⟩
   108	
   109	/-- Proposition 4.2 (induced relation): the relation `P ≈ Q` defined by record
   110	isomorphism is an equivalence relation on systems. -/
   111	theorem obs_induced_equivalence {S R : Type*} (F : ObservationFunctor S R) :
   112	    Equivalence (obsEquiv F) where
   113	  refl _P := F.recordIso_equiv.refl _
   114	  symm h := F.recordIso_equiv.symm h
   115	  trans h1 h2 := F.recordIso_equiv.trans h1 h2
   116	
   117	/-- Proposition 4.2 (classes are fibers): `P ≈ Q` holds exactly when the record
   118	isomorphism classes of `Obs P` and `Obs Q` coincide. -/
   119	theorem obs_class_fibers {S R : Type*} (F : ObservationFunctor S R) (P Q : S) :
   120	    recordClass F.recordIso F.recordIso_equiv (F.obs P)
   121	      = recordClass F.recordIso F.recordIso_equiv (F.obs Q) ↔ obsEquiv F P Q := by
   122	  constructor
   123	  · intro h
   124	    exact Quotient.exact h
   125	  · intro h
   126	    exact Quotient.sound h
   127	
   128	/-- Proposition 4.2 (universal quotient property): every map out of the systems that is
   129	constant on `≈`-classes factors uniquely through the quotient by `≈`. -/
   130	theorem obs_quotient_factor {S T R : Type*} (F : ObservationFunctor S R)
   131	    (f : S → T) (hf : ∀ P Q, obsEquiv F P Q → f P = f Q) :
   132	    ∃! g : Quotient ⟨obsEquiv F, obs_induced_equivalence F⟩ → T,
   133	      ∀ P, g (Quotient.mk _ P) = f P := by
   134	  refine ⟨Quotient.lift f (fun P Q h => hf P Q h), ?_, ?_⟩
   135	  · intro P
   136	    rfl
   137	  · intro g hg
   138	    funext x
   139	    refine Quotient.inductionOn x fun P => ?_
   140	    exact hg P
   141	
   142	/-- Lemma 4.3 (setup): the product of two observation functors is an observation functor
   143	into the product of the record categories. -/
   144	def ObservationFunctor.prod {S R₁ R₂ : Type*} (F₁ : ObservationFunctor S R₁)
   145	    (F₂ : ObservationFunctor S R₂) : ObservationFunctor S (R₁ × R₂) where
   146	  obs := fun P => (F₁.obs P, F₂.obs P)
   147	  recordIso := fun x y => F₁.recordIso x.1 y.1 ∧ F₂.recordIso x.2 y.2
   148	  recordIso_equiv :=
   149	    { refl := fun _x => ⟨F₁.recordIso_equiv.refl _, F₂.recordIso_equiv.refl _⟩
   150	      symm := fun ⟨h1, h2⟩ => ⟨F₁.recordIso_equiv.symm h1, F₂.recordIso_equiv.symm h2⟩
   151	      trans := fun ⟨a, b⟩ ⟨c, d⟩ =>
   152	        ⟨F₁.recordIso_equiv.trans a c, F₂.recordIso_equiv.trans b d⟩ }
   153	
   154	/-- Lemma 4.3 (products of observations): the relation induced by a product of
   155	observation functors is the intersection of the relations of the two factors. -/
   156	theorem obs_products_intersection {S R₁ R₂ : Type*} (F₁ : ObservationFunctor S R₁)
   157	    (F₂ : ObservationFunctor S R₂) (P Q : S) :
   158	    obsEquiv (F₁.prod F₂) P Q ↔ obsEquiv F₁ P Q ∧ obsEquiv F₂ P Q :=
   159	  Iff.rfl
   160	
   161	/-! ## Coarse and fine observations (Definition 4.4, Proposition 4.5) -/
   162	
   163	/-- Definition 4.4 (coarse and fine observations): `Obs_c` is a coarsening of `Obs_f`
   164	when a forgetting map `h` on records exists with `Obs_c = h ∘ Obs_f`. -/
   165	structure Coarsening {S Rf Rc : Type*} (Ff : ObservationFunctor S Rf) (obsC : S → Rc) where
   166	  /-- The comparison map on records that forgets detail. -/
   167	  h : Rf → Rc
   168	  /-- `Obs_c = h ∘ Obs_f` on systems. -/
   169	  factors : obsC = h ∘ Ff.obs
   170	
   171	/-- Proposition 4.5 (coarse records separate less), inclusion direction: if
   172	`Obs_c = h ∘ Obs_f` and `h` carries record isomorphisms to record isomorphisms, then
   173	fine equivalence implies coarse equivalence. -/
   174	theorem obs_coarse_graining_composition {S Rf Rc : Type*}
   175	    (Ff : ObservationFunctor S Rf) (Fc : ObservationFunctor S Rc)
   176	    (h : Rf → Rc) (factors : Fc.obs = h ∘ Ff.obs)
   177	    (h_mono : ∀ x y, Ff.recordIso x y → Fc.recordIso (h x) (h y))
   178	    (P Q : S) (hpq : obsEquiv Ff P Q) : obsEquiv Fc P Q := by
   179	  have hP : Fc.obs P = h (Ff.obs P) := by rw [factors]; rfl
   180	  have hQ : Fc.obs Q = h (Ff.obs Q) := by rw [factors]; rfl
   181	  show Fc.recordIso (Fc.obs P) (Fc.obs Q)
   182	  rw [hP, hQ]
   183	  exact h_mono (Ff.obs P) (Ff.obs Q) hpq
   184	
   185	/-! ## The four-point witness of §9.1 -/
   186	
   187	/-- A probability vector on the four-point sample space `Ω = {1,2,3,4}` of §9.1. -/
   188	structure Dist4 where
   189	  x1 : ℚ
   190	  x2 : ℚ
   191	  x3 : ℚ
   192	  x4 : ℚ
   193	deriving DecidableEq, Repr
   194	
   195	/-- The distribution `p = (1/2, 1/4, 1/8, 1/8)` of §9.1. -/
   196	def pDist : Dist4 := ⟨1/2, 1/4, 1/8, 1/8⟩
   197	
   198	/-- The distribution `q = (1/4, 1/2, 1/8, 1/8)` of §9.1. -/
   199	def qDist : Dist4 := ⟨1/4, 1/2, 1/8, 1/8⟩
   200	
   201	/-- The distribution `r = (1/8, 1/8, 1/2, 1/4)` of §9.4. -/
   202	def rDist : Dist4 := ⟨1/8, 1/8, 1/2, 1/4⟩
   203	
   204	/-- Experiment `e1 = {{1,2},{3,4}}`: its outcome distribution on `v`. -/
   205	def e1Push (v : Dist4) : ℚ × ℚ := (v.x1 + v.x2, v.x3 + v.x4)
   206	
   207	/-- Experiment `e2 = {{1,3},{2,4}}`: its outcome distribution on `v`. -/
   208	def e2Push (v : Dist4) : ℚ × ℚ := (v.x1 + v.x3, v.x2 + v.x4)
   209	
   210	/-- Experiment `e3 = {{1,4},{2,3}}`: its outcome distribution on `v`. -/
   211	def e3Push (v : Dist4) : ℚ × ℚ := (v.x1 + v.x4, v.x2 + v.x3)
   212	
   213	/-- Two distributions report the same record for the experiment `push`. -/
   214	def SameRecord (push : Dist4 → ℚ × ℚ) (v w : Dist4) : Prop :=
   215	  (push v).1 = (push w).1 ∧ (push v).2 = (push w).2
   216	
   217	/-- The diagonal joint event `{ω1 = ω2}` on the composite `Ω × Ω` (Proposition 4.6). -/
   218	def diagJoint (v w : Dist4) : ℚ :=
   219	  v.x1 * w.x1 + v.x2 * w.x2 + v.x3 * w.x3 + v.x4 * w.x4
   220	
   221	/-- Proposition 4.5 (strictness witness of §9.1): the coarse record `e1` identifies `p`
   222	and `q`, while the fine record over `e1` and `e2` separates them; the inclusion of
   223	relations is strict. -/
   224	theorem obs_coarse_witness :
   225	    SameRecord e1Push pDist qDist ∧ ¬ SameRecord e2Push pDist qDist := by
   226	  constructor
   227	  · show (e1Push pDist).1 = (e1Push qDist).1 ∧ (e1Push pDist).2 = (e1Push qDist).2
   228	    constructor
   229	    · norm_num [e1Push, pDist, qDist]
   230	    · norm_num [e1Push, pDist, qDist]
   231	  · intro h
   232	    norm_num [SameRecord, e2Push, pDist, qDist] at h
   233	
   234	/-! ## Composed experiments (Proposition 4.6) -/
   235	
   236	/-- The observation functor of a composite system whose record is the product of the
   237	factor records (the hypothesis of Proposition 4.6). -/
   238	def ObservationFunctor.compProd {S₁ S₂ R₁ R₂ : Type*} (F₁ : ObservationFunctor S₁ R₁)
   239	    (F₂ : ObservationFunctor S₂ R₂) : ObservationFunctor (S₁ × S₂) (R₁ × R₂) where
   240	  obs := fun PQ => (F₁.obs PQ.1, F₂.obs PQ.2)
   241	  recordIso := fun x y => F₁.recordIso x.1 y.1 ∧ F₂.recordIso x.2 y.2
   242	  recordIso_equiv :=
   243	    { refl := fun _x => ⟨F₁.recordIso_equiv.refl _, F₂.recordIso_equiv.refl _⟩
   244	      symm := fun ⟨h1, h2⟩ => ⟨F₁.recordIso_equiv.symm h1, F₂.recordIso_equiv.symm h2⟩
   245	      trans := fun ⟨a, b⟩ ⟨c, d⟩ =>
   246	        ⟨F₁.recordIso_equiv.trans a c, F₂.recordIso_equiv.trans b d⟩ }
   247	
   248	/-- Proposition 4.6 (composed experiments), product direction: under product records
   249	indistinguishability of the factors is preserved on composites. -/
   250	theorem obs_composed_product_preserved {S₁ S₂ R₁ R₂ : Type*}
   251	    (F₁ : ObservationFunctor S₁ R₁) (F₂ : ObservationFunctor S₂ R₂)
   252	    (P P' : S₁) (Q Q' : S₂)
   253	    (hP : obsEquiv F₁ P P') (hQ : obsEquiv F₂ Q Q') :
   254	    obsEquiv (F₁.compProd F₂) (P, Q) (P', Q') :=
   255	  ⟨hP, hQ⟩
   256	
   257	/-- Proposition 4.6 (composed experiments), failure witness: the factor records of `p`
   258	and `q` under `e1` coincide, yet the diagonal joint experiment on the composite
   259	separates `p × p` from `p × q`, reporting `11/32` against `9/32`. -/
   260	theorem obs_composed_experiments_failure :
   261	    SameRecord e1Push pDist qDist
   262	      ∧ diagJoint pDist pDist = 11/32
   263	      ∧ diagJoint pDist qDist = 9/32
   264	      ∧ (11/32 : ℚ) ≠ 9/32 := by
   265	  refine ⟨?_, ?_, ?_, ?_⟩
   266	  · exact obs_coarse_witness.1
   267	  · norm_num [diagJoint, pDist, qDist]
   268	  · norm_num [diagJoint, pDist, qDist]
   269	  · norm_num
   270	
   271	/-! ## Structure preservation and its failure (Theorem 3.1, Corollary 3.2) -/
   272	
   273	/-- Theorem 3.1 (Etingof–Gelaki) as hypothesis data: non-isomorphic finite groups whose
   274	complex representation categories are equivalent as plain tensor categories. The
   275	construction itself is literature; this record packages exactly the data the corollary
   276	needs. -/
   277	structure PlainTensorCounterexample (Grp : Type)
   278	    (plainTensorEquiv : Grp → Grp → Prop) (groupIso : Grp → Grp → Prop) where
   279	  /-- The first group. -/
   280	  G : Grp
   281	  /-- The second group. -/
   282	  H : Grp
   283	  /-- The groups are not isomorphic. -/
   284	  groups_noniso : ¬ groupIso G H
   285	  /-- Their representation categories are equivalent as plain tensor categories. -/
   286	  plain_tensor_equiv : plainTensorEquiv G H
   287	
   288	/-- Theorem 3.1 (`eg_plain_tensor_insufficient`), conditional form: an equivalence of
   289	representation categories that forgets the symmetric structure cannot recover the
   290	underlying group — plain tensor equivalence does not detect group isomorphism. -/
   291	theorem eg_plain_tensor_insufficient {Grp : Type}
   292	    {plainTensorEquiv groupIso : Grp → Grp → Prop}
   293	    (w : PlainTensorCounterexample Grp plainTensorEquiv groupIso) :
   294	    ¬ ∀ x y, plainTensorEquiv x y ↔ groupIso x y := by
   295	  intro h
   296	  exact w.groups_noniso ((h w.G w.H).1 w.plain_tensor_equiv)
   297	
   298	/-- Corollary 3.2 (`preserved_layer_discipline`), conditional form: a candidate relation
   299	whose identifications ride on plain tensor equivalence — an equivalence whose declared
   300	layers omit the symmetric monoidal layer — identifies a pair of systems whose observable
   301	group data differ, and so cannot justify the identification. -/
   302	theorem preserved_layer_discipline {Grp : Type}
   303	    {plainTensorEquiv groupIso : Grp → Grp → Prop}
   304	    (w : PlainTensorCounterexample Grp plainTensorEquiv groupIso)
   305	    (candidate : Grp → Grp → Prop)
   306	    (wit : EquivalenceWitness)
   307	    (h_omit : ¬ DeclaresSymmetric wit)
   308	    (hidentify : ∀ x y, plainTensorEquiv x y → candidate x y) :
   309	    candidate w.G w.H ∧ ¬ groupIso w.G w.H ∧ ¬ DeclaresSymmetric wit :=
   310	  ⟨hidentify _ _ w.plain_tensor_equiv, w.groups_noniso, h_omit⟩
   311	
   312	/-! ## Information-geometric distinguishability (§5) -/
   313	
   314	/-- Section 5.1: the Fisher form on the simplex, `g_p(a,a) = ∑_i a_i² / p_i`. -/
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
   349	`f(x) = x f(x⁻¹)` on the positive domain, and distinct such `f` give distinct metrics
   350	on self-adjoint directions at positive eigenvalues. `OperatorMonotone` is a parameter
   351	(predicate on parameter functions) because operator monotonicity is external to this
   352	module. The skeleton requires `n ≥ 2`, positive eigenvalues, and symmetric tangent
   353	directions, and compares parameter functions only through their positive-domain data
   354	(Codex review rounds 1–2). This is an unproved specification, NOT the paper's theorem. -/
   355	def petz_sudar_parametricity {n : ℕ}
   356	    (OperatorMonotone : (ℚ → ℚ) → Prop)
   357	    (monotone : ((Fin n → ℚ) → (Fin n → Fin n → ℚ) → ℚ) → Prop) : Prop :=
   358	  (2 ≤ n) ∧
   359	  (∀ f : ℚ → ℚ, NormalizedAtOne f → SelfReciprocal f → OperatorMonotone f →
   360	      monotone (fun lam A => mcQuadratic f lam A)) ∧
   361	    (∀ m, monotone m → ∃ f : ℚ → ℚ, NormalizedAtOne f ∧ SelfReciprocal f ∧ OperatorMonotone f ∧
   362	      ∀ lam : Fin n → ℚ, ∀ A : Fin n → Fin n → ℚ, m lam A = mcQuadratic f lam A) ∧
   363	    (∀ f g : ℚ → ℚ, SelfReciprocal f → SelfReciprocal g →
   364	      OperatorMonotone f → OperatorMonotone g → f ≠ g →
   365	      ∃ lam : Fin n → ℚ, ∃ A : Fin n → Fin n → ℚ,
   366	        (∀ i, 0 < lam i) ∧ (∀ i j, A i j = A j i) ∧
   367	        mcQuadratic f lam A ≠ mcQuadratic g lam A)
   368	
   369	/-- Theorem 5.2, proof ingredient: the Petz transpose `f^#` yields the same quadratic
   370	form as `f` on symmetric (self-adjoint) directions, which is why self-reciprocity
   371	`f = f^#` is the correct normalization. -/
   372	theorem petz_transpose_same_form {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ)
   373	    (hpos : ∀ i, 0 < lam i) (A : Fin n → Fin n → ℚ) (hsymm : ∀ i j, A i j = A j i) :
   374	    mcQuadratic f lam A = mcQuadratic (petzTranspose f) lam A := by
   375	  have key : ∀ i j, mcTerm (petzTranspose f) lam A i j = mcTerm f lam A j i := by
   376	    intro i j
   377	    have hj : lam j ≠ 0 := (hpos j).ne'
   378	    simp only [mcTerm, petzTranspose]
   379	    rw [inv_div, ← mul_assoc, mul_div_cancel₀ _ hj, hsymm i j]
   380	  unfold mcQuadratic
   381	  simp only [key]
   382	  rw [Finset.sum_comm]
   383	
   384	/-- Proposition 5.3 (`monotone_commutative_restriction`): for every `f` with `f(1) = 1`
   385	(operator monotonicity is not needed for the computation), the quadratic form restricted
   386	to directions diagonal in an eigenbasis of `ρ` is the classical Fisher form
   387	`∑ A_ii² / λ_i`. -/
   388	theorem monotone_commutative_restriction {n : ℕ} (f : ℚ → ℚ) (hf1 : f 1 = 1)
   389	    (lam : Fin n → ℚ) (hpos : ∀ i, 0 < lam i)
   390	    (A : Fin n → Fin n → ℚ) (hdiag : ∀ i j, i ≠ j → A i j = 0) :
   391	    mcQuadratic f lam A = ∑ i : Fin n, (A i i * A i i) / lam i := by
   392	  unfold mcQuadratic
   393	  apply Finset.sum_congr rfl
   394	  intro i _
   395	  refine (Finset.sum_eq_single i (fun j _ hj => ?_) (fun hi => absurd (Finset.mem_univ i) hi)).trans ?_
   396	  · have : A i j = 0 := hdiag i j (Ne.symm hj)
   397	    simp [mcTerm, this]
   398	  · have hi : lam i / lam i = 1 := div_self (hpos i).ne'
   399	    simp [mcTerm, hi, hf1]
   400	
   401	/-- Proposition 5.3 restated: the commutative restriction of any normalized monotone
   402	metric is the Fisher form on the commutative subalgebra generated by `ρ`. -/
   403	theorem commutative_restriction_is_fisher {n : ℕ} (f : ℚ → ℚ) (hf1 : f 1 = 1)
   404	    (lam : Fin n → ℚ) (hpos : ∀ i, 0 < lam i)
   405	    (A : Fin n → Fin n → ℚ) (hdiag : ∀ i j, i ≠ j → A i j = 0) :
   406	    mcQuadratic f lam A = fisherForm lam (fun i => A i i) :=
   407	  (monotone_commutative_restriction f hf1 lam hpos A hdiag).trans (by rfl)
   408	
   409	/-! ## Ruler dependence of the metric scale (Example 5.4, Corollary 5.5) -/
   410	
   411	/-- The self-reciprocal representative `f(x) = 2x/(1+x)` of Example 5.4. -/
   412	def fRat (x : ℚ) : ℚ := 2 * x / (1 + x)
   413	
   414	/-- The self-reciprocal representative `h(x) = (1+x)/2` of Example 5.4. -/
   415	def hRat (x : ℚ) : ℚ := (1 + x) / 2
   416	
   417	/-- The state `ρ = diag(3/4, 1/4)` of Example 5.4. -/
   418	def rhoDiag : Fin 2 → ℚ := fun i => if i = 0 then 3/4 else 1/4
   419	
   420	/-- The direction `A = σ_x` of Example 5.4. -/
   421	def sigmaX : Fin 2 → Fin 2 → ℚ := fun i j => if i = j then 0 else 1
   422	
   423	/-- Example 5.4 (`monotone_not_canonical`): at `ρ = diag(3/4, 1/4)` and `A = σ_x` the
   424	quadratic forms of `f(x) = 2x/(1+x)` and `h(x) = (1+x)/2` are `16/3` and `4`; the two
   425	admissible monotone metrics disagree by the factor `4/3`. -/
   426	theorem monotone_not_canonical :
   427	    mcQuadratic fRat rhoDiag sigmaX = 16/3
   428	      ∧ mcQuadratic hRat rhoDiag sigmaX = 4
   429	      ∧ (16/3 : ℚ) ≠ 4 := by
   430	  refine ⟨?_, ?_, ?_⟩
   431	  · simp only [mcQuadratic, Fin.sum_univ_two]
   432	    norm_num [mcTerm, fRat, hRat, rhoDiag, sigmaX]
   433	  · simp only [mcQuadratic, Fin.sum_univ_two]
   434	    norm_num [mcTerm, fRat, hRat, rhoDiag, sigmaX]
   435	  · norm_num
   436	
   437	/-- Corollary 5.5: numerical monotone-metric distance is not a function of the states
   438	alone — the two admissible rulers disagree at the same state and direction. -/
   439	theorem monotone_ruler_dependence :
   440	    mcQuadratic fRat rhoDiag sigmaX ≠ mcQuadratic hRat rhoDiag sigmaX := by
   441	  rw [monotone_not_canonical.1, monotone_not_canonical.2.1]
   442	  norm_num
   443	
   444	end Cmrps.Vol10

exec
/usr/local/bin/zsh -lc 'nl -ba lean/Cmrps/Vol02StructuralFamilies.lean' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
     1	/-
     2	Copyright (c) 2026 CMRPS formalization. All rights reserved.
     3	Released under Apache 2.0 license as described in the file LICENSE.
     4	Authors: CMRPS module writer
     5	-/
     6	
     7	import Mathlib.Tactic
     8	import Mathlib.Data.Quot
     9	import Mathlib.Basic.Countable.Defs
    10	import Mathlib.Logic.Equiv.Set
    11	import Mathlib.SetTheory.Cardinal.Finite
    12	import Mathlib.Data.Fintype.OfMap
    13	import Mathlib.Data.Multiset.Bind
    14	import Mathlib.Data.Multiset.Count
    15	import Mathlib.Algebra.BigOperators.Group.Multiset.Basic
    16	import Mathlib.Algebra.BigOperators.Ring.Multiset
    17	import Mathlib.Data.Matrix.Mul
    18	import Mathlib.Data.Matrix.Diagonal
    19	import Mathlib.LinearAlgebra.Matrix.ConjTranspose
    20	import Mathlib.Topology.Constructions
    21	import Mathlib.Topology.Continuous
    22	import Mathlib.Topology.Algebra.MulAction
    23	
    24	/-!
    25	# Fundamental structural families of mathematical physics
    26	
    27	Formalization targets from `papers/latex/vol-02-structural-families.tex`
    28	(Vol. 2: Fundamental Structural Families). Claim labels mirror
    29	`verification/vol-02-structural-families-lean-targets.md`:
    30	
    31	1. `sharpness_criterion`   — paper Theorem 3.2 (parts a, b, d; part c is set-theoretic only,
    32	   constructibility is Chevalley's theorem and is recorded as a conjectural input)
    33	2. `globality_symplectic`  — paper Proposition 3.4 (constancy consequence, Darboux as input)
    34	3. `achievement_kinds_exhaustive` — paper Proposition 3.7
    35	4. `dim_vector_classification`    — paper Theorem 7.1 (finiteness at fixed dimension;
    36	   the Wedderburn structure theorem is a literature input)
    37	5. `induced_dimension_vector`     — paper Proposition 4.2 (dimension-vector combinatorics;
    38	   `M_a(ℂ) ⊗ M_b(ℂ) ≅ M_{ab}(ℂ)` is the load-bearing input)
    39	6. `kraus_rank_not_injective`     — paper Proposition 11.2
    40	7. `cotangent_retract`            — paper Proposition 4.1 (the homotopy `r_t`)
    41	8. `exceptional_not_closed`       — paper Proposition 15.1
    42	9. `invariants_not_independence`  — paper Proposition 16.2 (schema; Gelfand input)
    43	10. `comparability_of_records`    — paper Proposition 18.1
    44	-/
    45	
    46	namespace Cmrps.Vol02
    47	
    48	universe u v w
    49	
    50	/-! ## Family records (paper Definitions 2.1–2.2) -/
    51	
    52	/-- Paper Definition 2.1: a family record is a triple `(F, V, I)` with `F` the family of
    53	objects, `V` the invariant range, `I` the invariant map, constant on `≃`-classes. -/
    54	structure FamilyRecord where
    55	  /-- Objects of the family. -/
    56	  Obj : Type u
    57	  /-- The invariant range. -/
    58	  V : Type v
    59	  /-- The physical equivalence relation on objects (paper relation `≃`). -/
    60	  r : Obj → Obj → Prop
    61	  /-- Physical equivalence is an equivalence relation. -/
    62	  rEquiv : Equivalence r
    63	  /-- The invariant map. -/
    64	  I : Obj → V
    65	  /-- The invariant is constant on `≃`-classes. -/
    66	  constOnClasses : ∀ a b, r a b → I a = I b
    67	
    68	namespace FamilyRecord
    69	
    70	/-- Paper Definition 2.1: the invariant is *classifying* (complete) when
    71	`I(P) = I(Q)` implies `P ≃ Q`. -/
    72	def Classifying (R : FamilyRecord) : Prop := ∀ a b : R.Obj, R.I a = R.I b → R.r a b
    73	
    74	/-- Paper Definition 2.2: a record is invariant-complete when its invariant is classifying. -/
    75	def InvariantComplete (R : FamilyRecord) : Prop := R.Classifying
    76	
    77	/-- The setoid induced by the physical equivalence. -/
    78	def toSetoid (R : FamilyRecord) : Setoid R.Obj := ⟨R.r, R.rEquiv⟩
    79	
    80	/-- Paper Theorem 3.2(1): the assignment `[P] ↦ I(P)` on `≃`-classes. -/
    81	def inducedMap (R : FamilyRecord) : Quotient R.toSetoid → R.V :=
    82	  Quotient.lift R.I (fun _ _ h => R.constOnClasses _ _ h)
    83	
    84	@[simp]
    85	theorem inducedMap_mk (R : FamilyRecord) (a : R.Obj) :
    86	    R.inducedMap (Quotient.mk R.toSetoid a) = R.I a := rfl
    87	
    88	/-- Paper Theorem 3.2(1): the induced map is well defined (the invariant is constant
    89	on classes), restated as an equality of invariants on equivalent objects. -/
    90	theorem sharpness_well_defined (R : FamilyRecord) {a b : R.Obj} (h : R.r a b) :
    91	    R.I a = R.I b :=
    92	  R.constOnClasses a b h
    93	
    94	/-- Paper Theorem 3.2(1): for an invariant-complete record the induced map on classes
    95	is injective. -/
    96	theorem inducedMap_injective (R : FamilyRecord) (h : R.Classifying) :
    97	    Function.Injective R.inducedMap := by
    98	  intro q₁ q₂ he
    99	  revert he
   100	  refine Quotient.inductionOn₂ q₁ q₂ ?_
   101	  intro a b he
   102	  have heq : R.I a = R.I b := he
   103	  exact Quotient.sound (h a b heq)
   104	
   105	/-- Paper Theorem 3.2(1): completeness is exactly the statement that `I` separates
   106	classes, i.e. the induced map on classes is injective. -/
   107	theorem classifying_iff (R : FamilyRecord) :
   108	    R.Classifying ↔ Function.Injective R.inducedMap :=
   109	  ⟨R.inducedMap_injective, fun hinj a b he => by
   110	    have hq := hinj (show R.inducedMap (Quotient.mk R.toSetoid a)
   111	        = R.inducedMap (Quotient.mk R.toSetoid b) from he)
   112	    exact Quotient.exact hq⟩
   113	
   114	/-- Paper Theorem 3.2(2): if the range is finite with `|V| = N`, then the number of
   115	`≃`-classes is at most `N`. -/
   116	theorem sharpness_card_bound (R : FamilyRecord) (h : R.Classifying) [Fintype R.V] {N : ℕ}
   117	    (hN : Fintype.card R.V = N) : Nat.card (Quotient R.toSetoid) ≤ N := by
   118	  have hle : Nat.card (Quotient R.toSetoid) ≤ Nat.card R.V :=
   119	    Nat.card_le_card_of_injective R.inducedMap (R.inducedMap_injective h)
   120	  have hV : Nat.card R.V = N := by
   121	    rw [Nat.card_eq_fintype_card]
   122	    exact hN
   123	  rw [hV] at hle
   124	  exact hle
   125	
   126	/-- Paper Theorem 3.2(3), set-theoretic content: the classes inject into any subset of
   127	the range containing the attained values of `I` (e.g. the `k`-points of the image of a
   128	finite-type morphism). Constructibility of that image is Chevalley's theorem and is not
   129	formalized here; see `verification/vol-02-structural-families-conjectures.md`. -/
   130	theorem sharpness_injects_into_superset (R : FamilyRecord) (h : R.Classifying)
   131	    (s : Set R.V) (hs : Set.range R.I ⊆ s) :
   132	    ∃ f : Quotient R.toSetoid → ↥s, Function.Injective f := by
   133	  refine ⟨fun q => ⟨R.inducedMap q, ?_⟩, ?_⟩
   134	  · have hq : R.inducedMap q = R.I (Quotient.out q) := by
   135	      conv_lhs => rw [← Quotient.out_eq q]
   136	      rfl
   137	    rw [hq]
   138	    exact hs ⟨Quotient.out q, rfl⟩
   139	  · intro q₁ q₂ he
   140	    exact R.inducedMap_injective h (Subtype.ext_iff.mp he)
   141	
   142	/-- Paper Theorem 3.2(4): if the class set is uncountable, no invariant-complete record
   143	for the family has countable range. -/
   144	theorem sharpness_uncountable (R : FamilyRecord) (h : R.Classifying)
   145	    (hU : Uncountable (Quotient R.toSetoid)) : ¬ Countable R.V := by
   146	  intro hc
   147	  haveI := hc
   148	  exact hU.not_countable (Function.Injective.countable (R.inducedMap_injective h))
   149	
   150	end FamilyRecord
   151	
   152	/-! ## Globality in the symplectic family (paper Proposition 3.4) -/
   153	
   154	/-- Symplectic germs of a fixed dimension `2n` with `n ≥ 1`, with symplectomorphism of
   155	germs as the equivalence. Darboux's theorem is recorded as an input field. -/
   156	structure SymplecticGermField where
   157	  /-- The type of symplectic germs of dimension `2n`. -/
   158	  Germ : Type u
   159	  /-- Symplectomorphism of germs. -/
   160	  SympEq : Germ → Germ → Prop
   161	  /-- Symplectomorphism is an equivalence relation. -/
   162	  sympEq_equiv : Equivalence SympEq
   163	  /-- Darboux's theorem (literature input): every `2n`-dimensional symplectic germ is
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
   177	/-- Paper Proposition 3.4 consequence, as formalized: every germ invariant is *constant*
   178	on all germs (a restatement of `globality_symplectic`). **Scope caveat (Codex review,
   179	round 2):** the paper's "no local classifier" reading additionally needs global objects,
   180	a pair of non-equivalent objects, and a classifier predicate separating them — none is
   181	formalized here (and since `G.darboux` makes all germs equivalent, a constant invariant
   182	does classify the germ equivalence). The name records the paper's corollary; the
   183	statement is germ constancy and no more. -/
   184	theorem globality_no_local_classifier {G : SymplecticGermField} {A : Type v}
   185	    {f : G.Germ → A} (hf : GermInvariant f) (g h : G.Germ) : f g = f h :=
   186	  globality_symplectic hf g h
   187	
   188	/-! ## Achievement kinds (paper Definition 3.6, Proposition 3.7) -/
   189	
   190	/-- Paper Definition 3.6: the five achievement kinds of a classified sector. -/
   191	inductive AchievementKind where
   192	  /-- Complete and parameterized. -/
   193	  | completeAndParameterized : AchievementKind
   194	  /-- Complete and unparameterized. -/
   195	  | completeAndUnparameterized : AchievementKind
   196	  /-- Complete as an obstruction classification. -/
   197	  | completeAsObstruction : AchievementKind
   198	  /-- Impossible: an impossibility theorem is on record. -/
   199	  | impossible : AchievementKind
   200	  /-- No record: no classification and no impossibility theorem on record. -/
   201	  | noRecord : AchievementKind
   202	
   203	/-- Paper Definition 3.6: a sector together with the three ordered conditions
   204	(record exists, impossibility theorem exists, obstructions classified,
   205	attained values parameterized). -/
   206	structure Sector where
   207	  /-- A theorem on record names a classifying invariant. -/
   208	  hasClassifyingRecord : Bool
   209	  /-- An impossibility theorem is on record. -/
   210	  hasImpossibilityTheorem : Bool
   211	  /-- The recorded classification classifies obstructions rather than objects. -/
   212	  classifiesObstructions : Bool
   213	  /-- The attained values of the invariant form an explicitly described subset
   214	  of a structured range (only meaningful when a record names objects). -/
   215	  parameterizedValues : Bool
   216	
   217	/-- Paper Definition 3.6: the kind determined by the ordered tests of the sector. -/
   218	def kindOf : Sector → AchievementKind
   219	  | ⟨false, false, _, _⟩ => AchievementKind.noRecord
   220	  | ⟨_, true, _, _⟩ => AchievementKind.impossible
   221	  | ⟨true, false, true, _⟩ => AchievementKind.completeAsObstruction
   222	  | ⟨true, false, false, true⟩ => AchievementKind.completeAndParameterized
   223	  | ⟨true, false, false, false⟩ => AchievementKind.completeAndUnparameterized
   224	
   225	/-- Paper Definition 3.6: the conditions under which a kind applies to a sector. -/
   226	def KindApplies : AchievementKind → Sector → Prop
   227	  | .completeAndParameterized, s =>
   228	      s.hasClassifyingRecord = true ∧ s.hasImpossibilityTheorem = false ∧
   229	        s.classifiesObstructions = false ∧ s.parameterizedValues = true
   230	  | .completeAndUnparameterized, s =>
   231	      s.hasClassifyingRecord = true ∧ s.hasImpossibilityTheorem = false ∧
   232	        s.classifiesObstructions = false ∧ s.parameterizedValues = false
   233	  | .completeAsObstruction, s =>
   234	      s.hasClassifyingRecord = true ∧ s.hasImpossibilityTheorem = false ∧
   235	        s.classifiesObstructions = true
   236	  | .impossible, s =>
   237	      s.hasImpossibilityTheorem = true
   238	  | .noRecord, s =>
   239	      s.hasClassifyingRecord = false ∧ s.hasImpossibilityTheorem = false
   240	
   241	/-- Paper Proposition 3.7: the kind assigned by the ordered tests applies. -/
   242	theorem kindOf_applies (s : Sector) : KindApplies (kindOf s) s := by
   243	  rcases s with ⟨a, b, c, d⟩
   244	  cases a <;> cases b <;> cases c <;> cases d <;> simp [KindApplies, kindOf]
   245	
   246	/-- Paper Proposition 3.7: the kind assigned by the ordered tests is the only one
   247	that applies. -/
   248	theorem kindOf_unique (s : Sector) (k : AchievementKind) (hk : KindApplies k s) :
   249	    k = kindOf s := by
   250	  rcases s with ⟨a, b, c, d⟩
   251	  cases a <;> cases b <;> cases c <;> cases d <;> cases k <;>
   252	    simp [KindApplies, kindOf] at hk ⊢
   253	
   254	/-- Paper Proposition 3.7: exactly one of the five achievement kinds applies to any
   255	sector; the five are pairwise exclusive and exhaustive. -/
   256	theorem achievement_kinds_exhaustive (s : Sector) :
   257	    ∃! k : AchievementKind, KindApplies k s :=
   258	  ⟨kindOf s, kindOf_applies s, fun _ hk => kindOf_unique s _ hk⟩
   259	
   260	/-! ## Dimension vectors (paper Theorem 7.1, Proposition 4.2) -/
   261	
   262	/-- Paper Theorem 7.1: a dimension vector is a finite multiset of positive integers
   263	(the matrix block sizes of a unital finite-dimensional complex C*-algebra). -/
   264	abbrev DimensionVector := Multiset ℕ
   265	
   266	namespace DimensionVector
   267	
   268	/-- Paper Theorem 7.1: dimension vectors have positive entries. -/
   269	def Pos (v : DimensionVector) : Prop := ∀ n ∈ v, 0 < n
   270	
   271	/-- Paper Theorem 7.1: the total complex dimension `d = Σᵢ nᵢ²`. -/
   272	def totalDim (v : DimensionVector) : ℕ := (v.map (· ^ 2)).sum
   273	
   274	/-- Paper Proposition 4.2: the dimension vector of a direct sum is the multiset union. -/
   275	def sum (v w : DimensionVector) : DimensionVector := v + w
   276	
   277	/-- Paper Proposition 4.2: the dimension vector of a tensor product is the multiset of
   278	pairwise products `{nᵢ mⱼ}`. Written with the multiset product notation `×ˢ`
   279	(`Multiset.product`). -/
   280	def tensor (v w : DimensionVector) : DimensionVector :=
   281	  (v ×ˢ w).map fun p => p.1 * p.2
   282	
   283	theorem pos_sum {v w : DimensionVector} (hv : v.Pos) (hw : w.Pos) : (sum v w).Pos :=
   284	  fun n hn => by
   285	    rcases Multiset.mem_add.1 hn with h | h
   286	    · exact hv n h
   287	    · exact hw n h
   288	
   289	/-- Membership in a multiset product (thin alias for Mathlib's `Multiset.mem_product`). -/
   290	private theorem mem_product {v w : Multiset ℕ} {p : ℕ × ℕ} :
   291	    p ∈ (v ×ˢ w) ↔ p.1 ∈ v ∧ p.2 ∈ w :=
   292	  Multiset.mem_product
   293	
   294	theorem pos_tensor {v w : DimensionVector} (hv : v.Pos) (hw : w.Pos) :
   295	    (tensor v w).Pos := by
   296	  intro n hn
   297	  rcases Multiset.mem_map.1 hn with ⟨p, hp, rfl⟩
   298	  rcases mem_product.1 hp with ⟨h₁, h₂⟩
   299	  exact Nat.mul_pos (hv p.1 h₁) (hw p.2 h₂)
   300	
   301	theorem totalDim_sum (v w : DimensionVector) :
   302	    totalDim (sum v w) = totalDim v + totalDim w := by
   303	  simp [totalDim, sum, Multiset.map_add, Multiset.sum_add]
   304	
   305	/-- Helper for `totalDim_tensor`: summing `f p.1 * g p.2` over a product multiset
   306	factors as a product of sums. -/
   307	private lemma sum_product_map (v w : Multiset ℕ) (f g : ℕ → ℕ) :
   308	    ((v ×ˢ w).map fun p => f p.1 * g p.2).sum = (v.map f).sum * (w.map g).sum := by
   309	  refine Multiset.induction_on v ?_ ?_
   310	  · simp [Multiset.zero_product]
   311	  · intro a v ih
   312	    rw [Multiset.cons_product, Multiset.map_add, Multiset.sum_add, Multiset.map_map, ih,
   313	      Multiset.map_cons, Multiset.sum_cons, add_mul]
   314	    congr 1
   315	    show (w.map fun b => f a * g b).sum = f a * (w.map g).sum
   316	    exact Multiset.sum_map_mul_left
   317	
   318	theorem totalDim_tensor (v w : DimensionVector) :
   319	    totalDim (tensor v w) = totalDim v * totalDim w := by
   320	  show (((v ×ˢ w).map fun p => p.1 * p.2).map (· ^ 2)).sum
   321	    = (v.map (· ^ 2)).sum * (w.map (· ^ 2)).sum
   322	  rw [Multiset.map_map]
   323	  have h1 : (v ×ˢ w).map ((· ^ 2) ∘ fun p : ℕ × ℕ => p.1 * p.2)
   324	      = (v ×ˢ w).map fun p => p.1 ^ 2 * p.2 ^ 2 :=
   325	    congrArg (Multiset.map · (v ×ˢ w)) (funext fun p => mul_pow p.1 p.2 2)
   326	  rw [h1]
   327	  exact sum_product_map v w (· ^ 2) (· ^ 2)
   328	
   329	/-! ### Finiteness at fixed total dimension (paper Theorem 7.1) -/
   330	
   331	private lemma sq_le_sum_map (v : Multiset ℕ) : ∀ n ∈ v, n ^ 2 ≤ (v.map (· ^ 2)).sum := by
   332	  refine Multiset.induction_on v ?_ ?_
   333	  · intro n hn
   334	    exact absurd hn (by simp)
   335	  · intro a v ih n hn
   336	    rw [Multiset.map_cons, Multiset.sum_cons]
   337	    rcases Multiset.mem_cons.1 hn with h | h
   338	    · subst h
   339	      exact Nat.le_add_right _ _
   340	    · exact (ih n h).trans (Nat.le_add_left _ _)
   341	
   342	private lemma le_totalDim_of_mem {v : DimensionVector} (hp : v.Pos) {n : ℕ}
   343	    (hmem : n ∈ v) : n ≤ v.totalDim := by
   344	  have hn : n ≤ n ^ 2 := by
   345	    have h1 : 1 ≤ n := hp n hmem
   346	    simpa [pow_two] using Nat.mul_le_mul_right n h1
   347	  have h2 : n ^ 2 ≤ (v.map (· ^ 2)).sum := sq_le_sum_map v n hmem
   348	  exact hn.trans (by simpa [totalDim] using h2)
   349	
   350	private lemma card_le_totalDim : ∀ {v : DimensionVector}, v.Pos → v.card ≤ v.totalDim := by
   351	  intro v
   352	  refine Multiset.induction_on v ?_ ?_
   353	  · intro hp
   354	    simp [totalDim]
   355	  · intro a v ih hp
   356	    have h1 : 1 ≤ a := hp a (Multiset.mem_cons_self a v)
   357	    have ha : (1 : ℕ) ≤ a ^ 2 := by
   358	      simpa [pow_two] using Nat.mul_le_mul h1 h1
   359	    have hpv : Pos v := fun n hn => hp n (Multiset.mem_cons.2 (Or.inr hn))
   360	    have ih' := ih hpv
   361	    rw [totalDim] at ih'
   362	    rw [totalDim, Multiset.card_cons, Multiset.map_cons, Multiset.sum_cons]
   363	    omega
   364	
   365	/-- Multiplicity encoding of a dimension vector: entry `i` counts the block size `i.val + 1`. -/
   366	private def encode (d : ℕ) (v : DimensionVector) (hv : v.Pos ∧ v.totalDim = d) :
   367	    Fin d → Fin (d + 1) :=
   368	  fun i => ⟨v.count (i.val + 1), by
   369	    have h1 : v.count (i.val + 1) ≤ v.card := Multiset.count_le_card _ _
   370	    have h2 : v.card ≤ d := by
   371	      have := card_le_totalDim hv.1
   372	      omega
   373	    omega⟩
   374	
   375	private lemma encode_injective (d : ℕ) (v w : DimensionVector)
   376	    (hv : v.Pos ∧ v.totalDim = d) (hw : w.Pos ∧ w.totalDim = d)
   377	    (he : encode d v hv = encode d w hw) : v = w := by
   378	  apply Multiset.ext'
   379	  intro a
   380	  have hvb : ∀ n ∈ v, n ≤ d := fun n hn => by
   381	    have := le_totalDim_of_mem hv.1 hn
   382	    omega
   383	  have hwb : ∀ n ∈ w, n ≤ d := fun n hn => by
   384	    have := le_totalDim_of_mem hw.1 hn
   385	    omega
   386	  by_cases ha : a = 0
   387	  · subst ha
   388	    have h1 : (0 : ℕ) ∉ v := fun h => absurd (hv.1 0 h) (by omega)
   389	    have h2 : (0 : ℕ) ∉ w := fun h => absurd (hw.1 0 h) (by omega)
   390	    rw [Multiset.count_eq_zero_of_notMem h1, Multiset.count_eq_zero_of_notMem h2]
   391	  by_cases hbound : d < a
   392	  · have h1 : a ∉ v := fun h => absurd (hvb a h) (by omega)
   393	    have h2 : a ∉ w := fun h => absurd (hwb a h) (by omega)
   394	    rw [Multiset.count_eq_zero_of_notMem h1, Multiset.count_eq_zero_of_notMem h2]
   395	  have hpos : 0 < a := Nat.pos_of_ne_zero ha
   396	  have hle : a ≤ d := by omega
   397	  have hi : a - 1 < d := by omega
   398	  have hmod : (a - 1 : ℕ) + 1 = a := by omega
   399	  have heq := congrFun he ⟨a - 1, hi⟩
   400	  have hcount : v.count ((⟨a - 1, hi⟩ : Fin d).val + 1)
   401	      = w.count ((⟨a - 1, hi⟩ : Fin d).val + 1) :=
   402	    congrArg (fun x : Fin (d + 1) => x.val) heq
   403	  simpa [hmod] using hcount
   404	
   405	/-- Paper Theorem 7.1: at fixed total complex dimension `d` the number of dimension
   406	vectors is finite. -/
   407	theorem dimVector_finite (d : ℕ) :
   408	    Set.Finite {v : DimensionVector | v.Pos ∧ v.totalDim = d} := by
   409	  let s : Set DimensionVector := {v | v.Pos ∧ v.totalDim = d}
   410	  have hinj : Function.Injective (fun v : ↥s => encode d v.1 v.2) := by
   411	    rintro ⟨v, hv⟩ ⟨w, hw⟩ he
   412	    simp only [Subtype.mk.injEq]
   413	    exact encode_injective d v w hv hw he
   414	  haveI : Fintype ↥s := Fintype.ofInjective _ hinj
   415	  exact Set.toFinite s
   416	
   417	end DimensionVector
   418	
   419	/-! ## Kraus rank is not injective (paper Proposition 11.2) -/
   420	
   421	/-- The algebra of `2 × 2` complex matrices. -/
   422	abbrev Kraus.M := Matrix (Fin 2) (Fin 2) ℂ
   423	
   424	namespace Kraus
   425	
   426	open scoped Matrix
   427	
   428	/-- Paper Proposition 11.2: the unitary channel `Φ_U(X) = U X U*`. -/
   429	def φ (U : M) (X : M) : M := U * X * U ᴴ
   430	
   431	/-- Paper Proposition 11.2: the equivalence relation in force on channels is equality
   432	of completely positive maps. -/
   433	def SameChannel (Φ Ψ : M → M) : Prop := ∀ X : M, Φ X = Ψ X
   434	
   435	theorem sameChannel_iff (Φ Ψ : M → M) : SameChannel Φ Ψ ↔ Φ = Ψ :=
   436	  ⟨fun h => funext h, fun h _ => by rw [h]⟩
   437	
   438	/-- Unitary matrices in `M₂(ℂ)`. -/
   439	def IsUnitary (U : M) : Prop := U * U ᴴ = 1 ∧ U ᴴ * U = 1
   440	
   441	/-- A Kraus representation of `Φ` with `n` operators. -/
   442	def KrausRep (Φ : M → M) (ops : List M) : Prop :=
   443	  ∀ X : M, Φ X = (ops.map (fun A => A * X * A ᴴ)).sum
   444	
   445	/-- Paper Proposition 11.2: Kraus rank is the length of a minimal Kraus representation. -/
   446	def IsKrausRank (n : ℕ) (Φ : M → M) : Prop :=
   447	  (∃ ops, ops.length = n ∧ KrausRep Φ ops) ∧
   448	    ∀ m < n, ∀ ops, ops.length = m → ¬ KrausRep Φ ops
   449	
   450	theorem kraus_rep_one (U : M) : KrausRep (φ U) [U] := by
   451	  intro X
   452	  show U * X * U ᴴ = ([U].map fun A => A * X * A ᴴ).sum
   453	  rw [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, add_zero]
   454	
   455	theorem not_kraus_rep_zero (U : M) (hU : IsUnitary U) : ¬ KrausRep (φ U) [] := by
   456	  intro h
   457	  have h1 : (φ U) 1 = 0 := by
   458	    have := h 1
   459	    simpa [List.map_nil, List.sum_nil] using this
   460	  have h2 : (φ U) 1 = 1 := by
   461	    show U * 1 * U ᴴ = 1
   462	    rw [mul_one, hU.1]
   463	  rw [h2] at h1
   464	  exact one_ne_zero h1
   465	
   466	/-- Paper Proposition 11.2: every unitary channel has Kraus rank one. -/
   467	theorem kraus_rank_one (U : M) (hU : IsUnitary U) : IsKrausRank 1 (φ U) := by
   468	  refine ⟨⟨[U], rfl, kraus_rep_one U⟩, ?_⟩
   469	  intro m hm
   470	  have hm0 : m = 0 := by omega
   471	  rintro ops hlen hrep
   472	  subst hm0
   473	  have : ops = [] := by simpa [List.length_eq_zero_iff] using hlen
   474	  subst this
   475	  exact not_kraus_rep_zero U hU hrep
   476	
   477	/-- The probe matrix: all entries equal to `1`. -/
   478	private def X : M := Matrix.of fun _ _ => (1 : ℂ)
   479	
   480	/-- The probe unitary: `P = diag(1, -1)`. -/
   481	private def v : Fin 2 → ℂ := fun i => if i = 0 then 1 else -1
   482	
   483	private def P : M := Matrix.diagonal v
   484	
   485	private theorem v_apply_zero : v 0 = 1 := by simp [v]
   486	
   487	private theorem v_apply_one : v 1 = -1 := by simp [v]
   488	
   489	private theorem v_mul_star (i : Fin 2) : v i * star (v i) = 1 := by
   490	  fin_cases i <;> simp [v]
   491	
   492	private theorem P_unitary : IsUnitary P := by
   493	  refine ⟨?_, ?_⟩
   494	  · show P * P ᴴ = 1
   495	    rw [P, Matrix.diagonal_conjTranspose, Matrix.diagonal_mul_diagonal]
   496	    have h : (fun i => v i * (star v) i) = fun _ => (1 : ℂ) := funext fun i => v_mul_star i
   497	    rw [h]
   498	    exact Matrix.diagonal_one'
   499	  · show P ᴴ * P = 1
   500	    rw [P, Matrix.diagonal_conjTranspose, Matrix.diagonal_mul_diagonal]
   501	    have h : (fun i => (star v) i * v i) = fun _ => (1 : ℂ) := by
   502	      funext i
   503	      have h1 : v i * star (v i) = 1 := v_mul_star i
   504	      rw [mul_comm] at h1
   505	      exact h1
   506	    rw [h]
   507	    exact Matrix.diagonal_one'
   508	
   509	private theorem one_unitary : IsUnitary (1 : M) := by
   510	  refine ⟨?_, ?_⟩
   511	  · show (1 : M) * 1 ᴴ = 1
   512	    rw [Matrix.conjTranspose_one, mul_one]
   513	  · show (1 : M) ᴴ * 1 = 1
   514	    rw [Matrix.conjTranspose_one, one_mul]
   515	
   516	private theorem phi_one : φ 1 = fun Y => Y := by
   517	  funext Y
   518	  show (1 : M) * Y * 1 ᴴ = Y
   519	  simp [Matrix.conjTranspose_one]
   520	
   521	private theorem phi_P_X_apply : (φ P X) 0 1 = -1 := by
   522	  show (P * X * P ᴴ) 0 1 = -1
   523	  have hdiag : P ᴴ = Matrix.diagonal (star v) := Matrix.diagonal_conjTranspose v
   524	  rw [hdiag, Matrix.mul_diagonal]
   525	  have hp : (P * X) 0 1 = v 0 * X 0 1 := by
   526	    rw [P, Matrix.diagonal_mul]
   527	  rw [hp, v_apply_zero]
   528	  have hx : X 0 1 = 1 := rfl
   529	  rw [hx]
   530	  have hv1 : (star v) 1 = -1 := by
   531	    show star (v 1) = -1
   532	    rw [v_apply_one, star_neg, star_one]
   533	  rw [hv1]
   534	  norm_num
   535	
   536	private theorem phi_one_X_apply : (φ 1 X) 0 1 = 1 := by
   537	  rw [phi_one]
   538	  rfl
   539	
   540	/-- Paper Proposition 11.2: two distinct unitary channels, both of Kraus rank one, so
   541	the assignment from channels to Kraus rank is not injective under equality of maps. -/
   542	theorem kraus_rank_not_injective :
   543	    ∃ U U' : M, IsUnitary U ∧ IsUnitary U' ∧ ¬ SameChannel (φ U) (φ U') ∧
   544	      IsKrausRank 1 (φ U) ∧ IsKrausRank 1 (φ U') := by
   545	  refine ⟨1, P, one_unitary, P_unitary, ?_, kraus_rank_one 1 one_unitary,
   546	    kraus_rank_one P P_unitary⟩
   547	  intro h
   548	  have hX := h X
   549	  have h01 := congrArg (fun Y => Y 0 1) hX
   550	  rw [phi_one_X_apply, phi_P_X_apply] at h01
   551	  exact absurd h01 (by norm_num)
   552	
   553	end Kraus
   554	
   555	/-! ## The cotangent retract (paper Proposition 4.1) -/
   556	
   557	section Cotangent
   558	
   559	variable {Q : Type u} [TopologicalSpace Q]
   560	variable {V : Type v} [AddCommGroup V] [Module ℝ V] [TopologicalSpace V] [ContinuousSMul ℝ V]
   561	
   562	/-- The deformation retraction `r_t(x, ξ) = (x, tξ)`, formalized on the *trivial product
   563	bundle* `Q × V`. **Scope caveat (Codex review, round 2):** a general cotangent bundle
   564	`T*Q` is not globally a product `Q × V`; the paper's Proposition 4.1 in full generality
   565	is NOT formalized here, only its product-bundle fragment. -/
   566	def retraction (t : ℝ) (p : Q × V) : Q × V := (p.1, t • p.2)
   567	
   568	/-- `r_1 = id`. -/
   569	@[simp]
   570	theorem retraction_one (p : Q × V) : retraction (1 : ℝ) p = p := by
   571	  simp [retraction]
   572	
   573	/-- `r_s ∘ r_t = r_{s*t}`. -/
   574	theorem retraction_comp (s t : ℝ) (p : Q × V) :
   575	    retraction s (retraction t p) = retraction (s * t) p := by
   576	  simp [retraction, smul_smul]
   577	
   578	/-- `r_t` fixes the zero section pointwise. -/
   579	theorem retraction_fixes_zero_section (t : ℝ) (x : Q) :
   580	    retraction t (x, (0 : V)) = (x, 0) := by
   581	  simp [retraction]
   582	
   583	/-- `r_0` maps the total space onto the zero section. -/
   584	theorem retraction_zero_eq (p : Q × V) : retraction (0 : ℝ) p = (p.1, (0 : V)) := by
   585	  simp [retraction]
   586	
   587	theorem retraction_zero_mem_zeroSection (p : Q × V) :
   588	    retraction (0 : ℝ) p ∈ Set.range (fun x : Q => (x, (0 : V))) :=
   589	  ⟨p.1, (retraction_zero_eq p).symm⟩
   590	
   591	/-- Each `r_t` is continuous. -/
   592	theorem continuous_retraction (t : ℝ) : Continuous (retraction (t : ℝ) (Q := Q) (V := V)) := by
   593	  show Continuous fun p : Q × V => (p.1, t • p.2)
   594	  exact continuous_fst.prodMk (continuous_const.smul continuous_snd)
   595	
   596	/-- The deformation is jointly continuous in `t` and the point. -/
   597	theorem continuous_retraction₂ :
   598	    Continuous fun p : ℝ × (Q × V) => retraction (Q := Q) (V := V) p.1 p.2 := by
   599	  show Continuous fun p : ℝ × (Q × V) => (p.2.1, p.1 • p.2.2)
   600	  exact (continuous_snd.fst).prodMk (continuous_fst.smul continuous_snd.snd)
   601	
   602	/-- Paper Proposition 4.1, *product-bundle fragment*: the zero section of the trivial
   603	bundle `Q × V` is a deformation retract; the data above (continuity of `r_t`,
   604	`r_1 = id`, `r_0` through the zero section, `r_s ∘ r_t = r_{st}`, and the fixed zero
   605	section) is the content of the fragment. The general cotangent bundle `T*Q` is not
   606	globally a product, so the full proposition is NOT formalized (Codex review, round 2). -/
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
   619	
   620	/-! ## Irreducible classes do not close (paper Proposition 15.1) -/
   621	
   622	section Closure
   623	
   624	variable {α : Type u} [Zero α]
   625	
   626	/-- A class of objects is closed under a family `K` of binary constructions when it is
   627	closed under each `f ∈ K` (paper: closure under the admissible constructions). -/
   628	def ClosedUnder (K : Set (α → α → α)) (C : Set α) : Prop :=
   629	  ∀ f ∈ K, ∀ a b, a ∈ C → b ∈ C → f a b ∈ C
   630	
   631	/-- Paper Section 2: `⟨E⟩_K`, the smallest class containing `E` and closed under `K`. -/
   632	def closure (K : Set (α → α → α)) (E : Set α) : Set α :=
   633	  {x | ∀ C : Set α, E ⊆ C → ClosedUnder K C → x ∈ C}
   634	
   635	theorem mem_closure {K : Set (α → α → α)} {E : Set α} {x : α} :
   636	    x ∈ closure K E ↔ ∀ C : Set α, E ⊆ C → ClosedUnder K C → x ∈ C :=
   637	  Iff.rfl
   638	
   639	theorem subset_closure (K : Set (α → α → α)) (E : Set α) : E ⊆ closure K E :=
   640	  fun _ hx C hE _ => hE hx
   641	
   642	theorem closedUnder_closure (K : Set (α → α → α)) (E : Set α) :
   643	    ClosedUnder K (closure K E) := by
   644	  intro f hf a b ha hb C hE hC
   645	  exact hC f hf a b (ha C hE hC) (hb C hE hC)
   646	
   647	theorem closure_minimal (K : Set (α → α → α)) {E C : Set α}
   648	    (hE : E ⊆ C) (hC : ClosedUnder K C) : closure K E ⊆ C :=
   649	  fun _ hx => hx C hE hC
   650	
   651	/-- Paper Proposition 15.1: an object irreducible under `⊕` is not a sum of two
   652	nonzero objects. -/
   653	def Irreducible (op : α → α → α) (a : α) : Prop :=
   654	  ¬ ∃ b c, b ≠ 0 ∧ c ≠ 0 ∧ op b c = a
   655	
   656	/-- Paper Proposition 15.1: a nonempty class of nonzero objects each irreducible under
   657	direct sum is not closed under direct sum, and its closure strictly contains it.
   658	The hypothesis `E.Nonempty` is required; the conclusion is non-closure, not
   659	non-generation. -/
   660	theorem exceptional_not_closed (op : α → α → α) (K : Set (α → α → α)) (hop : op ∈ K)
   661	    (E : Set α) (hne : E.Nonempty)
   662	    (hirr : ∀ a ∈ E, a ≠ 0 ∧ Irreducible op a) :
   663	    (¬ ClosedUnder K E) ∧ E ⊂ closure K E := by
   664	  obtain ⟨A, hA⟩ := hne
   665	  have hA0 : A ≠ 0 := (hirr A hA).1
   666	  have hAA : op A A ∉ E := by
   667	    intro hmem
   668	    have hirr' : Irreducible op (op A A) := (hirr _ hmem).2
   669	    exact hirr' ⟨A, A, hA0, hA0, rfl⟩
   670	  have hAA_mem : op A A ∈ closure K E :=
   671	    closedUnder_closure K E op hop A A (subset_closure K E hA) (subset_closure K E hA)
   672	  refine ⟨?_, ⟨subset_closure K E, ?_⟩⟩
   673	  · intro hclosed
   674	    exact hAA (hclosed op hop A A hA hA)
   675	  · intro hincl
   676	    exact hAA (hincl hAA_mem)
   677	
   678	/-- Paper Proposition 15.1: the class still generates its closure (the conclusion is
   679	non-closure, not non-generation). -/
   680	theorem closure_generation (K : Set (α → α → α)) (E : Set α) :
   681	    E ⊆ closure K E ∧
   682	      ∀ C : Set α, E ⊆ C → ClosedUnder K C → closure K E ⊆ C :=
   683	  ⟨subset_closure K E, fun _ => closure_minimal K⟩
   684	
   685	end Closure
   686	
   687	/-! ## Independence and reconstructability (paper Definition 16.1, Proposition 16.2) -/
   688	
   689	/-- Paper Definition 2.3 / 16.1: a structural family is presented by its class of objects. -/
   690	structure StructuralFamily where
   691	  /-- Objects of the family. -/
   692	  Obj : Type u
   693	
   694	/-- Paper Definition 16.1: `F` is a special case of `G` when there is a full embedding
   695	of the objects of `F` into the objects of `G`. **Scope caveat (Codex review, round 1):**
   696	this is the *object-level shadow* of the paper's definition — an injection of object
   697	types, not a fully faithful functor of the families' categories (those categories are
   698	not formalized here). -/
   699	def SpecialCase (F G : StructuralFamily) : Prop := Nonempty (F.Obj ↪ G.Obj)
   700	
   701	/-- Paper Definition 16.1 / Table 14: `G` is reconstructable from `F` when a
   702	correspondence determines one from the other. **Scope caveat (Codex review, round 1):**
   703	this is the object-level shadow (a bijection of object types), not the paper's
   704	structure-preserving equivalence or anti-equivalence. -/
   705	def Reconstructable (F G : StructuralFamily) : Prop := Nonempty (F.Obj ≃ G.Obj)
   706	
   707	/-- Paper Definition 16.1: two structural families are logically independent when
   708	neither is a special case of the other and neither is reconstructable from the other.
   709	**Scope caveat (Codex review, round 1):** with the object-level shadows above, classical
   710	comparability of cardinalities makes one direction of `SpecialCase` always hold, so
   711	`Independent F G` is false for all families — the paper's category-level independence
   712	is NOT formalized here. -/
   713	def Independent (F G : StructuralFamily) : Prop :=
   714	  ¬ SpecialCase F G ∧ ¬ SpecialCase G F ∧ ¬ Reconstructable F G ∧ ¬ Reconstructable G F
   715	
   716	/-- Paper Proposition 16.2: a family admits a classifying invariant when some map on
   717	its objects is injective (it separates objects up to the chosen equivalence, taken here
   718	to be equality). -/
   719	def HasClassifyingInvariant (F : StructuralFamily.{u}) : Prop :=
   720	  ∃ (V : Type u) (I : F.Obj → V), Function.Injective I
   721	
   722	/-- Paper Proposition 16.2: families related by a correspondence (as the Gelfand
   723	anti-equivalence relates commutative unital C*-algebras and compact Hausdorff spaces)
   724	are not logically independent. -/
   725	theorem not_independent_of_reconstructable (F G : StructuralFamily)
   726	    (h : Reconstructable F G) : ¬ Independent F G :=
   727	  fun hI => hI.2.2.1 h
   728	
   729	/-- Paper Proposition 16.2: two families may each admit a classifying invariant and
   730	still fail to be logically independent; the existence of classifying invariants is
   731	silent on independence. -/
   732	theorem invariants_not_independence :
   733	    ∃ F G : StructuralFamily.{0}, HasClassifyingInvariant F ∧ HasClassifyingInvariant G ∧
   734	      Reconstructable F G ∧ ¬ Independent F G := by
   735	  let F : StructuralFamily.{0} := ⟨ℕ⟩
   736	  let G : StructuralFamily.{0} := ⟨ULift ℕ⟩
   737	  exact ⟨F, G, ⟨ℕ, id, fun _ _ h => h⟩, ⟨ULift ℕ, fun n => n, fun _ _ h => h⟩,
   738	    ⟨Equiv.ulift.symm⟩, not_independent_of_reconstructable F G ⟨Equiv.ulift.symm⟩⟩
   739	
   740	/-! ## Comparability of records (paper Proposition 18.1) -/
   741	
   742	section Comparability
   743	
   744	/-- Subtype equivalence along an equality of sets (thin alias for Mathlib's
   745	`Set.equivOfEq`, kept under the paper-facing name). -/
   746	def subtypeEquivOfEq {γ : Type*} {s t : Set γ} (h : s = t) : ↥s ≃ ↥t :=
   747	  Set.equivOfEq h
   748	
   749	/-- Paper Proposition 18.1: two classification records that agree on family, sector, and
   750	equivalence (same objects, same physical equivalence) and that both name classifying
   751	invariants have invariants related by a bijection between their attained values. -/
   752	theorem comparability_of_records {Obj : Type u} {r : Obj → Obj → Prop} (hr : Equivalence r)
   753	    {V₁ : Type v} {I₁ : Obj → V₁}
   754	    (h₁c : ∀ a b, r a b → I₁ a = I₁ b) (h₁k : ∀ a b, I₁ a = I₁ b → r a b)
   755	    {V₂ : Type w} {I₂ : Obj → V₂}
   756	    (h₂c : ∀ a b, r a b → I₂ a = I₂ b) (h₂k : ∀ a b, I₂ a = I₂ b → r a b) :
   757	    Nonempty (Set.range I₁ ≃ Set.range I₂) := by
   758	  let s : Setoid Obj := ⟨r, hr⟩
   759	  let f₁ : Quotient s → V₁ := Quotient.lift I₁ h₁c
   760	  let f₂ : Quotient s → V₂ := Quotient.lift I₂ h₂c
   761	  have inj₁ : Function.Injective f₁ := by
   762	    intro q₁ q₂ he
   763	    revert he
   764	    refine Quotient.inductionOn₂ q₁ q₂ ?_
   765	    intro a b he
   766	    have heq : I₁ a = I₁ b := by
   767	      show f₁ (Quotient.mk s a) = f₁ (Quotient.mk s b)
   768	      exact he
   769	    exact Quotient.sound (h₁k a b heq)
   770	  have inj₂ : Function.Injective f₂ := by
   771	    intro q₁ q₂ he
   772	    revert he
   773	    refine Quotient.inductionOn₂ q₁ q₂ ?_
   774	    intro a b he
   775	    have heq : I₂ a = I₂ b := by
   776	      show f₂ (Quotient.mk s a) = f₂ (Quotient.mk s b)
   777	      exact he
   778	    exact Quotient.sound (h₂k a b heq)
   779	  have e₁ : Quotient s ≃ Set.range f₁ := Equiv.ofInjective f₁ inj₁
   780	  have e₂ : Quotient s ≃ Set.range f₂ := Equiv.ofInjective f₂ inj₂
   781	  have hr₁ : Set.range f₁ = Set.range I₁ := by
   782	    apply Set.ext
   783	    intro x
   784	    constructor
   785	    · rintro ⟨q, rfl⟩
   786	      exact ⟨Quotient.out q, by
   787	        conv_rhs => rw [← Quotient.out_eq q]
   788	        rfl⟩
   789	    · rintro ⟨a, rfl⟩
   790	      exact ⟨Quotient.mk s a, rfl⟩
   791	  have hr₂ : Set.range f₂ = Set.range I₂ := by
   792	    apply Set.ext
   793	    intro x
   794	    constructor
   795	    · rintro ⟨q, rfl⟩
   796	      exact ⟨Quotient.out q, by
   797	        conv_rhs => rw [← Quotient.out_eq q]
   798	        rfl⟩
   799	    · rintro ⟨a, rfl⟩
   800	      exact ⟨Quotient.mk s a, rfl⟩
   801	  refine ⟨(e₁.trans (subtypeEquivOfEq hr₁)).symm.trans (e₂.trans (subtypeEquivOfEq hr₂))⟩
   802	
   803	end Comparability
   804	
   805	end Cmrps.Vol02

exec
/usr/local/bin/zsh -lc 'ls -ld lean/.lake lean/.lake/packages/mathlib lean/.lake/build/lib/lean/Cmrps; nl -ba lean/Cmrps/Vol03IrreducibilityDecomposition.lean' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
drwxr-xr-x   5 mlong  staff   160 Oct 30 03:38 lean/.lake
drwxr-xr-x  62 mlong  staff  1984 Oct 30 07:03 lean/.lake/build/lib/lean/Cmrps
drwxr-xr-x  35 mlong  staff  1120 Oct 30 03:36 lean/.lake/packages/mathlib
     1	/-
     2	Copyright: 2026 YonedaAI Research Collective.
     3	Released under the terms of the project license.
     4	-/
     5	import Mathlib.Basic.Complex.Basic
     6	import Mathlib.LinearAlgebra.Dimension.Constructions
     7	import Mathlib.LinearAlgebra.TensorProduct.Basic
     8	import Mathlib.LinearAlgebra.Matrix.ConjTranspose
     9	import Mathlib.Algebra.Group.Submonoid.Basic
    10	import Mathlib.Algebra.Group.Submonoid.Membership
    11	import Mathlib.GroupTheory.Perm.Basic
    12	import Mathlib.Data.Fintype.Sum
    13	
    14	/-!
    15	# Vol. 03 — Irreducibility and Decomposition
    16	
    17	Mechanization of the tractable targets of
    18	`verification/vol-03-irreducibility-decomposition-lean-targets.md`, drawn from
    19	`papers/latex/vol-03-irreducibility-decomposition.tex`.
    20	
    21	Names mirror the paper's labels. The abstract classification theorem (Thm 3.3 for
    22	arbitrary unital finite-dimensional complex C*-algebras) is NOT mechanized here —
    23	Mathlib has no C*-algebra classification layer. This module formalizes the concrete
    24	block model `BlockAlg n = ∀ i, M_{n i}(ℂ)`, its dimension arithmetic, the dimension
    25	vector combinatorics (multiset union / pairwise product), the multiplicity-matrix
    26	data layer, and the closure semigroup of `cor:closure`.
    27	
    28	All statements below are fully proved; nothing uses `sorry`, `axiom`, or `native_decide`.
    29	-/
    30	
    31	universe u v
    32	
    33	namespace Cmrps.Vol03
    34	
    35	open Module Matrix BigOperators
    36	open scoped TensorProduct
    37	
    38	/-! ## Definitions (paper §2, §4) -/
    39	
    40	/-- Dimension vector of a block presentation `n : ι → ℕ`: the multiset of matrix
    41	block sizes (paper `def:dim-vector`). -/
    42	def dimVector {ι : Type*} [Fintype ι] (n : ι → ℕ) : Multiset ℕ :=
    43	  (Finset.univ.val.map n)
    44	
    45	/-- The concrete decomposed algebra of a block presentation: the direct sum of the
    46	matrix blocks `M_{n i}(ℂ)` (paper `thm:block-decomposition`, model side). -/
    47	abbrev BlockAlg {ι : Type*} [Fintype ι] (n : ι → ℕ) :=
    48	  ∀ i, Matrix (Fin (n i)) (Fin (n i)) ℂ
    49	
    50	/-- Componentwise adjoint on a block algebra (paper `rem:krull-schmidt`, *-structure). -/
    51	def starBlock {ι : Type*} [Fintype ι] {n : ι → ℕ} (x : BlockAlg n) : BlockAlg n :=
    52	  fun i => (x i)ᴴ
    53	
    54	/-- Multiplicity matrix from a presentation `n` to a presentation `m`
    55	(paper `def:multiplicity-matrix`): `r i j` copies of the `i`-th source block inside
    56	the `j`-th target block, with rank contributions `n i * r i j` summing to `m j`. -/
    57	structure MultiplicityMatrix {ι κ : Type*} [Fintype ι] [Fintype κ]
    58	    (n : ι → ℕ) (m : κ → ℕ) where
    59	  /-- Multiplicity of source block `i` in target block `j`. -/
    60	  r : ι → κ → ℕ
    61	  /-- Column-sum constraint: `∑ i, n i * r i j = m j` for every target block `j`. -/
    62	  column_sum : ∀ j, ∑ i, n i * r i j = m j
    63	
    64	/-- Induced rank matrix `k^{(i)}_j = n_i * r^{(i)}_j` (paper `def:multiplicity-matrix`). -/
    65	def rankMatrix {ι κ : Type*} [Fintype ι] [Fintype κ] {n : ι → ℕ} {m : κ → ℕ}
    66	    (R : MultiplicityMatrix n m) (i : ι) (j : κ) : ℕ :=
    67	  n i * R.r i j
    68	
    69	/-- Multiplicative size semigroup generated by a set `S` of block sizes
    70	(paper `cor:closure`): the submonoid of `(ℕ, ×)` generated by `S`. **Scope caveat
    71	(Codex review, round 2):** `Submonoid.closure` always contains the multiplicative
    72	unit `1`, so this is closure *with the tensor unit adjoined* — starting from only
    73	block size `2`, the paper's binary constructions cannot generate a size-`1` block
    74	unless nullary tensor products are admitted (the paper's convention). -/
    75	def sizeSemigroup (S : Set ℕ) : Submonoid ℕ :=
    76	  Submonoid.closure S
    77	
    78	/-- A dimension vector is closed over `S` when every entry lies in the generated
    79	multiplicative semigroup (paper `cor:closure`), where the semigroup includes the
    80	unit `1` (see the caveat on `sizeSemigroup`). -/
    81	def ClosedVectors (S : Set ℕ) (v : Multiset ℕ) : Prop :=
    82	  ∀ ⦃x⦄, x ∈ v → x ∈ sizeSemigroup S
    83	
    84	/-- Pairwise product of two dimension vectors (paper `prop:construction-arithmetic` (2)). -/
    85	def pairwiseProd (v w : Multiset ℕ) : Multiset ℕ :=
    86	  v.bind fun a => w.map fun b => a * b
    87	
    88	/-- Block permutations: permutations of the block index preserving all block sizes
    89	(paper `cor:outer-aut`, data layer). -/
    90	def blockPerm {ι : Type*} [Fintype ι] (n : ι → ℕ) : Subgroup (Equiv.Perm ι) where
    91	  carrier := {σ | ∀ i, n (σ i) = n i}
    92	  one_mem' := by intro i; rfl
    93	  mul_mem' := by
    94	    intro σ τ hσ hτ i
    95	    exact (hσ (τ i)).trans (hτ i)
    96	  inv_mem' := by
    97	    intro σ hσ i
    98	    have h := hσ (σ⁻¹ i)
    99	    simpa using h.symm
   100	
   101	@[simp]
   102	theorem mem_blockPerm {ι : Type*} [Fintype ι] {n : ι → ℕ} {σ : Equiv.Perm ι} :
   103	    σ ∈ blockPerm n ↔ ∀ i, n (σ i) = n i :=
   104	  Iff.rfl
   105	
   106	/-! ## Dimension arithmetic of the block model (paper Thm 3.3, Prop 8.1) -/
   107	
   108	/-- Dimension of the block algebra is the sum of squares of the block sizes
   109	(paper `thm:block-decomposition`, dimension clause). -/
   110	theorem finrank_blockAlg {ι : Type*} [Fintype ι] (n : ι → ℕ) :
   111	    Module.finrank ℂ (BlockAlg n) = ∑ i, (n i) ^ 2 := by
   112	  rw [Module.finrank_pi_fintype]
   113	  simp_rw [Module.finrank_matrix, Fintype.card_fin, Module.finrank_self, mul_one, pow_two]
   114	
   115	/-- The componentwise adjoint is an involution (paper `thm:block-decomposition`, *-laws). -/
   116	theorem starBlock_involutive {ι : Type*} [Fintype ι] {n : ι → ℕ} (x : BlockAlg n) :
   117	    starBlock (starBlock x) = x := by
   118	  funext i
   119	  simp [starBlock]
   120	
   121	/-- The componentwise adjoint is anti-multiplicative (paper `thm:block-decomposition`, *-laws). -/
   122	theorem starBlock_mul {ι : Type*} [Fintype ι] {n : ι → ℕ} (x y : BlockAlg n) :
   123	    starBlock (x * y) = starBlock y * starBlock x := by
   124	  funext i
   125	  simp [starBlock, Matrix.conjTranspose_mul]
   126	
   127	/-- The dimension vector is invariant under permutation of the block indexing:
   128	uniqueness of the multiset of block sizes up to permutation
   129	(paper `thm:block-decomposition`, uniqueness clause, presentation level). -/
   130	theorem dimVector_perm_invariant {ι : Type*} [Fintype ι] (n : ι → ℕ) (σ : Equiv.Perm ι) :
   131	    dimVector (n ∘ σ) = dimVector n := by
   132	  simp only [dimVector]
   133	  conv_lhs => rw [← Multiset.map_map]
   134	  have h1 : Multiset.map (⇑σ) (Finset.univ.val) = Finset.univ.val := by
   135	    have h2 := Finset.map_val (f := σ.toEmbedding) (s := Finset.univ)
   136	    rw [Finset.map_univ_equiv] at h2
   137	    have h3 : (⇑σ.toEmbedding : ι → ι) = ⇑σ := rfl
   138	    rw [h3] at h2
   139	    exact h2.symm
   140	  rw [h1]
   141	
   142	/-- Dimension vectors add by multiset union on direct sums
   143	(paper `prop:construction-arithmetic` (1)). -/
   144	theorem dimVector_sum_elim {ι κ : Type*} [Fintype ι] [Fintype κ]
   145	    (n : ι → ℕ) (m : κ → ℕ) :
   146	    dimVector (Sum.elim n m) = dimVector n + dimVector m := by
   147	  simp only [dimVector]
   148	  conv_lhs =>
   149	    rw [show (Finset.univ : Finset (ι ⊕ κ)) = Finset.univ.disjSum Finset.univ from
   150	      (Finset.univ_disjSum_univ).symm]
   151	    rw [Finset.val_disjSum]
   152	  show Multiset.map (Sum.elim n m)
   153	      ((Finset.univ.val.map Sum.inl) + (Finset.univ.val.map Sum.inr)) = _
   154	  rw [Multiset.map_add, Multiset.map_map, Multiset.map_map]
   155	  congr 1
   156	
   157	/-- Dimension vectors multiply by pairwise product on tensor presentations
   158	(paper `prop:construction-arithmetic` (2)): the tensor of blocks has sizes `n i * m j`. -/
   159	theorem dimVector_prod {ι κ : Type*} [Fintype ι] [Fintype κ]
   160	    (n : ι → ℕ) (m : κ → ℕ) :
   161	    dimVector (fun p : ι × κ => n p.1 * m p.2)
   162	      = pairwiseProd (dimVector n) (dimVector m) := by
   163	  simp only [dimVector, pairwiseProd]
   164	  conv_lhs =>
   165	    rw [show (Finset.univ : Finset (ι × κ))
   166	        = (Finset.univ : Finset ι) ×ˢ (Finset.univ : Finset κ) by
   167	      ext p; simp]
   168	  show Multiset.map (fun p : ι × κ => n p.1 * m p.2)
   169	      ((Finset.univ.val).product (Finset.univ.val)) = _
   170	  simp only [Multiset.product]
   171	  rw [Multiset.map_bind]
   172	  simp only [Multiset.map_map, Function.comp]
   173	  conv_rhs => rw [Multiset.bind_map]
   174	
   175	/-- `M_a(ℂ) ⊗ M_b(ℂ)` has complex dimension `(a b)²`, the square of the tensor block size
   176	(paper `prop:construction-arithmetic` (2), `M_n ⊗ M_m ≅ M_{nm}` at the level of dimensions). -/
   177	theorem finrank_tensor_blocks (a b : ℕ) :
   178	    Module.finrank ℂ (Matrix (Fin a) (Fin a) ℂ ⊗[ℂ] Matrix (Fin b) (Fin b) ℂ) = (a * b) ^ 2 := by
   179	  rw [Module.finrank_tensorProduct]
   180	  simp [Module.finrank_matrix, pow_two, mul_comm, mul_left_comm]
   181	
   182	/-- Worked example (paper `ex:superselection`): the direct sum `M_2 ⊕ M_2` has
   183	dimension `2² + 2² = 8`, which is not a perfect square, so no tensor block `M_{ab}`
   184	has the same dimension. -/
   185	theorem sum_two_sq_eq_eight : (2 : ℕ) ^ 2 + 2 ^ 2 = 8 := by norm_num
   186	
   187	theorem ne_eight_of_sq (a b : ℕ) : (a * b) ^ 2 ≠ 8 := by
   188	  intro h
   189	  have h2 : (a * b) * (a * b) = 8 := by simpa [pow_two] using h
   190	  have h3 : a * b ≤ 3 := by
   191	    by_contra hc
   192	    have h4 : 4 ≤ a * b := by omega
   193	    have h5 : 16 ≤ (a * b) * (a * b) := by simpa using Nat.mul_le_mul h4 h4
   194	    omega
   195	  have h6 : 2 ≤ a * b := by
   196	    by_contra hc
   197	    have h7 : a * b ≤ 1 := by omega
   198	    have h8 : (a * b) * (a * b) ≤ 1 := by simpa using Nat.mul_le_mul h7 h7
   199	    omega
   200	  have : a * b = 2 ∨ a * b = 3 := by omega
   201	  rcases this with hab | hab <;> rw [hab] at h2 <;> omega
   202	
   203	/-- Worked example (paper `ex:superselection`), witness form: `M_2 ⊕ M_2` admits no
   204	`ℂ`-linear isomorphism — a fortiori no *-isomorphism — with a tensor block `M_{ab}`,
   205	because their dimensions `8` and `(ab)²` differ. -/
   206	theorem two_two_blocks_ne_tensor_block (a b : ℕ) :
   207	    ¬ Nonempty (BlockAlg (fun _ : Fin 2 => (2 : ℕ)) ≃ₗ[ℂ]
   208	      BlockAlg (fun _ : Fin 1 => a * b)) := by
   209	  rintro ⟨f⟩
   210	  have h := LinearEquiv.finrank_eq f
   211	  rw [finrank_blockAlg, finrank_blockAlg] at h
   212	  simp only [Fin.sum_univ_two, Fin.sum_univ_one] at h
   213	  have h2 : 8 = (a * b) ^ 2 := by
   214	    have h3 : (2 : ℕ) ^ 2 + 2 ^ 2 = (a * b) ^ 2 := by simpa using h
   215	    rw [sum_two_sq_eq_eight] at h3
   216	    exact h3
   217	  exact (ne_eight_of_sq a b) h2.symm
   218	
   219	/-! ## Multiplicity matrices (paper §4, `def:multiplicity-matrix`, `thm:homs` data layer) -/
   220	
   221	/-- Rank-matrix column sums recover the target block sizes
   222	(paper `def:multiplicity-matrix`, `∑_i k^{(i)}_j = m_j`). -/
   223	theorem rankMatrix_colSum {ι κ : Type*} [Fintype ι] [Fintype κ] {n : ι → ℕ} {m : κ → ℕ}
   224	    (R : MultiplicityMatrix n m) (j : κ) :
   225	    ∑ i, rankMatrix R i j = m j :=
   226	  R.column_sum j
   227	
   228	/-- Paper Example 4.4: unital *-homomorphisms `ℂ ⊕ M_2 → M_3` are classified by
   229	nonnegative solutions of `r¹ + 2 r² = 3`, of which there are exactly two. -/
   230	theorem multiplicity_example_44 (r1 r2 : ℕ) :
   231	    r1 + 2 * r2 = 3 ↔ (r1, r2) = (3, 0) ∨ (r1, r2) = (1, 1) := by
   232	  constructor
   233	  · intro h
   234	    have h' : r1 = 3 ∧ r2 = 0 ∨ r1 = 1 ∧ r2 = 1 := by omega
   235	    rcases h' with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ <;> simp
   236	  · rintro (h | h) <;> simp only [Prod.mk.injEq] at h <;> omega
   237	
   238	/-- Paper Table 4.1 row 3: column sums `(1, 2)` admit `2 × 3 = 6` multiplicity matrices.
   239	First column: exactly two solutions of `x + y = 1`. -/
   240	theorem multiplicity_col_sum_one (x y : ℕ) :
   241	    x + y = 1 ↔ (x, y) = (1, 0) ∨ (x, y) = (0, 1) := by
   242	  constructor
   243	  · intro h
   244	    have h' : x = 1 ∧ y = 0 ∨ x = 0 ∧ y = 1 := by omega
   245	    rcases h' with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ <;> simp
   246	  · rintro (h | h) <;> simp only [Prod.mk.injEq] at h <;> omega
   247	
   248	/-- Paper Table 4.1 row 3: second column — exactly three solutions of `x + y = 2`. -/
   249	theorem multiplicity_col_sum_two (x y : ℕ) :
   250	    x + y = 2 ↔ (x, y) = (2, 0) ∨ (x, y) = (1, 1) ∨ (x, y) = (0, 2) := by
   251	  constructor
   252	  · intro h
   253	    have h' : x = 2 ∧ y = 0 ∨ x = 1 ∧ y = 1 ∨ x = 0 ∧ y = 2 := by omega
   254	    rcases h' with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ <;> simp
   255	  · rintro (h | h | h) <;> simp only [Prod.mk.injEq] at h <;> omega
   256	
   257	/-- Paper Table 4.1 row 2: the unique multiplicity matrix of `M_2 → M_2 ⊕ M_2` is the
   258	diagonal embedding (`2 r = 2` forces `r = 1` in each column). -/
   259	theorem multiplicity_diagonal_unique (r s : ℕ) :
   260	    2 * r = 2 ∧ 2 * s = 2 ↔ r = 1 ∧ s = 1 := by
   261	  constructor
   262	  · intro h; omega
   263	  · rintro ⟨rfl, rfl⟩; simp
   264	
   265	/-! ## Closure under direct sum and tensor product (paper `cor:closure`) -/
   266	
   267	theorem mem_sizeSemigroup_of_mem {S : Set ℕ} {x : ℕ} (hx : x ∈ S) :
   268	    x ∈ sizeSemigroup S :=
   269	  Submonoid.subset_closure hx
   270	
   271	theorem one_mem_sizeSemigroup (S : Set ℕ) : 1 ∈ sizeSemigroup S :=
   272	  Submonoid.one_mem _
   273	
   274	theorem mul_mem_sizeSemigroup {S : Set ℕ} {x y : ℕ}
   275	    (hx : x ∈ sizeSemigroup S) (hy : y ∈ sizeSemigroup S) :
   276	    x * y ∈ sizeSemigroup S :=
   277	  mul_mem hx hy
   278	
   279	/-- Direct sums of closed dimension vectors are closed (paper `cor:closure`, ⊕-step). -/
   280	theorem closedVectors_add {S : Set ℕ} {v w : Multiset ℕ}
   281	    (hv : ClosedVectors S v) (hw : ClosedVectors S w) :
   282	    ClosedVectors S (v + w) := by
   283	  intro x hx
   284	  rcases Multiset.mem_add.mp hx with hx | hx
   285	  · exact hv hx
   286	  · exact hw hx
   287	
   288	/-- Tensor products of closed dimension vectors are closed (paper `cor:closure`, ⊗-step). -/
   289	theorem closedVectors_pairwiseProd {S : Set ℕ} {v w : Multiset ℕ}
   290	    (hv : ClosedVectors S v) (hw : ClosedVectors S w) :
   291	    ClosedVectors S (pairwiseProd v w) := by
   292	  intro x hx
   293	  simp only [pairwiseProd, Multiset.mem_bind] at hx
   294	  obtain ⟨a, ha, hb⟩ := hx
   295	  simp only [Multiset.mem_map] at hb
   296	  obtain ⟨b, hb, rfl⟩ := hb
   297	  exact mul_mem (hv ha) (hw hb)
   298	
   299	theorem closedVectors_singleton {S : Set ℕ} {x : ℕ} (hx : x ∈ S) :
   300	    ClosedVectors S {x} := by
   301	  intro y hy
   302	  rw [Multiset.mem_singleton] at hy
   303	  rw [hy]
   304	  exact mem_sizeSemigroup_of_mem hx
   305	
   306	/-- Paper Example 8.5 (qubit closure): the semigroup generated by `{1, 2}` is the
   307	powers of two. -/
   308	theorem mem_sizeSemigroup_one_two (x : ℕ) :
   309	    x ∈ sizeSemigroup ({1, 2} : Set ℕ) ↔ ∃ k, x = 2 ^ k := by
   310	  constructor
   311	  · intro hx
   312	    refine Submonoid.closure_induction
   313	      (s := ({1, 2} : Set ℕ)) (motive := fun x _ => ∃ k, x = 2 ^ k) ?_ ?_ ?_ hx
   314	    · intro y hy
   315	      simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hy
   316	      rcases hy with rfl | rfl
   317	      · exact ⟨0, by simp⟩
   318	      · exact ⟨1, by simp⟩
   319	    · exact ⟨0, by simp⟩
   320	    · rintro a b - - ⟨k, rfl⟩ ⟨l, rfl⟩
   321	      exact ⟨k + l, by rw [pow_add]⟩
   322	  · rintro ⟨k, rfl⟩
   323	    exact pow_mem (Submonoid.subset_closure (by simp : (2 : ℕ) ∈ ({1, 2} : Set ℕ))) k
   324	
   325	theorem two_pow_ne_three (k : ℕ) : (2 : ℕ) ^ k ≠ 3 := by
   326	  match k with
   327	  | 0 => decide
   328	  | 1 => decide
   329	  | k + 2 =>
   330	    intro h
   331	    have h4 : (2 : ℕ) ^ (k + 2) = 4 * 2 ^ k := by ring
   332	    rw [h4] at h
   333	    have h5 : (4 : ℕ) ≤ 4 * 2 ^ k := by
   334	      have h6 : 0 < 2 ^ k := Nat.two_pow_pos k
   335	      omega
   336	    omega
   337	
   338	/-- Paper Example 8.5: `M_3` (size 3) lies outside the qubit closure. -/
   339	theorem three_not_mem_sizeSemigroup_one_two :
   340	    (3 : ℕ) ∉ sizeSemigroup ({1, 2} : Set ℕ) := by
   341	  intro h
   342	  obtain ⟨k, hk⟩ := (mem_sizeSemigroup_one_two 3).mp h
   343	  exact two_pow_ne_three k hk.symm
   344	
   345	end Cmrps.Vol03

exec
/usr/local/bin/zsh -lc 'nl -ba lean/Cmrps/Vol01Foundations.lean' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
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

codex
The Vol02 scope changes and the two Mathlib aliases are present. The Vol10 fix is only partial: its injectivity clause still uses `f ≠ g` on all rationals, although the metric only samples positive arguments. I’m checking the remaining modules and type-checking the sources.
exec
/usr/local/bin/zsh -lc 'for f in Cmrps/*.lean Cmrps.lean; do lake env lean "$f" || exit; done' in /Users/mlong/Documents/Development/classification-physical-systems/lean
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
/usr/local/bin/zsh -lc 'cat lean/Cmrps/Vol05ClassicalSystems.lean' in /Users/mlong/Documents/Development/classification-physical-systems
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
/usr/local/bin/zsh -lc 'cat lean/Cmrps/Vol06QuantumSystems.lean lean/Cmrps/Vol07GaugeQft.lean' in /Users/mlong/Documents/Development/classification-physical-systems
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

exec
/usr/local/bin/zsh -lc 'cat lean/Cmrps/Vol09GravityInformationGeometry.lean' in /Users/mlong/Documents/Development/classification-physical-systems
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

codex
The proof/specification distinction is generally clear, and I found no explicit `sorry` or new axioms in the project modules. I’m now checking paper alignment and whether the generic helpers reuse available Mathlib results.
exec
/usr/local/bin/zsh -lc "rg -n 'Petz|Sudar|operator.monotone|normalized|normalised|self.recip|closure|semigroup|nullary|tensor unit' papers/latex/vol-10-observational-equivalence.tex papers/latex/vol-03-irreducibility-decomposition.tex; rg -n '"'^((private )?(noncomputable )?(def|abbrev|theorem|lemma|structure|inductive)|namespace|end )'"' lean/Cmrps/*.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
papers/latex/vol-10-observational-equivalence.tex:62:The classification problem of mathematical representations of physical systems is a quotient: classify objects of a category of systems up to an equivalence relation. The quotient is unusable until the relation is chosen, and the choice is decisive. This paper develops the observational side of that choice. It separates three relations: mathematical equivalence, given by isomorphism of the component data of a representation; physical equivalence, an open choice constrained by what the identifying morphism preserves; and observational equivalence, induced by a functor from systems to observation records. Observation functors are defined, their induced relations are proved to be equivalence relations with classes given by record isomorphism classes, and their interaction with coarse-graining is proved monotone in one direction only. Distinguishability is treated through monotone metrics: the Fisher metric is the unique classical choice up to constant, while the quantum case admits a parametric family indexed by operator monotone functions. An explicit two-dimensional computation shows the resulting quadratic forms differ on non-commuting directions, so quantum metric distinguishability is not canonical. The plain tensor-category criterion for physical equivalence fails outright: equivalence of representation categories without the symmetric structure does not recover the group, and every proposed relation must name the layers of structure it preserves. A counterexample search records which candidate criteria fail and why, and the empirical layer of the three-layer architecture is instantiated as a functor and left open where the sources leave it open.
papers/latex/vol-10-observational-equivalence.tex:77:Coarsening the observations identifies at least as many systems as the fine observations identify, and the inclusion of relations can be strict. The quantitative side of distinguishability splits along the classical and quantum divide: the Fisher metric is unique up to constant among metrics monotone under stochastic maps \cite{b8}, while the quantum monotone metrics form a parametric family indexed by operator monotone functions \cite{b8}. An explicit two-dimensional computation shows the induced quadratic forms disagree on non-commuting directions, so distinguishability read from an unnamed monotone metric is not a function of the states alone.
papers/latex/vol-10-observational-equivalence.tex:166:The cited results are used as established mathematics with their hypotheses intact: the plain tensor counterexample (\Cref{thm:eg}) with its construction cited rather than reproduced, the classical monotone-metric uniqueness (\Cref{thm:chentsov}) on spaces of probability distributions, and the quantum parametric classification (\Cref{thm:petzsudar}) for operator monotone functions normalized at $1$ and symmetric under $x \mapsto x^{-1}$ in Petz's sense. Nothing in this paper extends a cited result beyond its hypotheses, and the counterexample search of \Cref{sec:search} keeps extension attempts visible.
papers/latex/vol-10-observational-equivalence.tex:197:\Cref{thm:eg} removes the plain tensor layer as a recovery principle; it does not say tensor categories carry no group data. With the symmetric structure restored, representation categories with conjugates, direct sums, subobjects, and endomorphism ring of the tensor unit equal to the complex numbers are equivalent to finite-dimensional unitary representations of a compact supergroup, unique up to isomorphism \cite{b1}. The failure is specific: drop the symmetric layer and the group is no longer determined. The same point governs dualities below.
papers/latex/vol-10-observational-equivalence.tex:324:In the quantum case the uniqueness fails. Monotone metrics on quantum state spaces are given by the Morozova-Chentsov construction indexed by operator monotone functions $f$ on the positive reals, normalized by $f(1) = 1$ and self-reciprocal in Petz's sense, $f(x) = x f(x^{-1})$; the self-reciprocity is the symmetry condition that makes the quadratic form well defined on self-adjoint tangent directions, and distinct self-reciprocal $f$ give distinct metrics.
papers/latex/vol-10-observational-equivalence.tex:326:\begin{theorem}[Petz-Sud{\'a}r classification]
papers/latex/vol-10-observational-equivalence.tex:328:Every quantum monotone metric arises from an operator monotone function $f$ with $f(1) = 1$ and $f(x) = x f(x^{-1})$ through the Morozova-Chentsov form, and distinct such $f$ give distinct metrics on self-adjoint directions. The family is parametric, not a finite list, and no member is distinguished among all monotone metrics.
papers/latex/vol-10-observational-equivalence.tex:332:The classification of monotone metrics by operator monotone functions is stated and applied at \cite{b8}, where the classical uniqueness and its quantum failure are contrasted. The self-reciprocity condition identifies each metric with a symmetric representative; without it, $f$ and its transpose $f^{\#}(x) = x f(x^{-1})$ yield the same quadratic form on self-adjoint operators and would be double counted. The parametric nature of the family is the reason the classical uniqueness statement may not be extended to the quantum case.
papers/latex/vol-10-observational-equivalence.tex:342:For every operator monotone $f$ with $f(1) = 1$, the quadratic form $g_f^{\rho}$ restricted to operators $A$ that are diagonal in an eigenbasis of $\rho$ equals $\sum_i |A_{ii}|^2 / \lambda_i$, the classical Fisher form on the commutative subalgebra generated by $\rho$. On commutative data the quantum monotone metrics therefore agree, and the parametric freedom of \Cref{thm:petzsudar} is invisible.
papers/latex/vol-10-observational-equivalence.tex:351:The parametric freedom becomes visible on non-commuting data. Two self-reciprocal representatives suffice to see it: $f(x) = \tfrac{2x}{1+x}$ and $h(x) = \tfrac{1+x}{2}$, both operator monotone with value $1$ at $1$ and both satisfying $f(x) = x f(x^{-1})$.
papers/latex/vol-10-observational-equivalence.tex:606:The metric results carry their own boundary. \Cref{thm:chentsov,thm:petzsudar} are used as established mathematics with their hypotheses intact: monotone under stochastic maps in the classical case, operator monotone functions normalized at $1$ and self-reciprocal in the quantum case. Nothing here extends classical uniqueness to the quantum case, and \Cref{cor:noncanonical} is the reason not to. The explicit computation is two-dimensional; the disagreement of the metrics is general (\Cref{thm:petzsudar}) but only the two-dimensional instance is exhibited here.
papers/latex/vol-10-observational-equivalence.tex:632:$f, h$ & self-reciprocal operator monotone functions normalized at $1$: $f(x) = \tfrac{2x}{1+x}$ and $h(x) = \tfrac{1+x}{2}$ \\
papers/latex/vol-10-observational-equivalence.tex:664:D. Petz, Cs. Sud{\'a}r, \emph{Extending the Fisher metric to density matrices}, arXiv:quant-ph/0102132, 2001-02-27.
papers/latex/vol-03-irreducibility-decomposition.tex:65:A physical system is recorded as a tuple $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ of state space, observables, dynamics, symmetry data, and composition rules, and the classification problem is $\mathrm{Classify}(\mathrm{Ob}(\mathrm{Phys})/{\simeq})$ for a chosen equivalence $\simeq$. The present paper develops the machinery that turns candidate structural families into a classification: irreducibility, decomposition, admissible constructions, and closure under those constructions.
papers/latex/vol-03-irreducibility-decomposition.tex:103:Given a collection $\mathfrak{F}$ of families and a set of constructions $\mathcal{C}$, the closure $\langle \mathfrak{F} \rangle_{\mathcal{C}}$ is the smallest class of systems containing $\mathfrak{F}$ and closed under the constructions $\mathcal{C}$.
papers/latex/vol-03-irreducibility-decomposition.tex:197:A state on a unital C*-algebra $A$ is a linear functional $\omega \colon A \to \mathbb{C}$ that is positive and normalized by $\omega(1) = 1$. Write $S(A)$ for the set of states of $A$.
papers/latex/vol-03-irreducibility-decomposition.tex:206:where $\lambda = \omega(p_1) \in [0,1]$, where $\omega_i$ is the restriction of $\omega$ to $A_i$ normalized to a state of $A_i$ when $\omega(p_i) > 0$, and the term is omitted when its weight is zero. Consequently $S(A)$ is the convex join of $S(A_1)$ and $S(A_2)$.
papers/latex/vol-03-irreducibility-decomposition.tex:210:Write $a = p_1 a p_1 + p_2 a p_2$ for $a \in A$. Positivity of $\omega$ gives $0 \leq \omega(p_i) \leq 1$ and $\omega(p_1) + \omega(p_2) = 1$. Set $\lambda = \omega(p_1)$; when $\lambda \in (0,1)$ define $\omega_i(a) = \omega(p_i a p_i)/\lambda_i$ with $\lambda_1 = \lambda$ and $\lambda_2 = 1 - \lambda$. Each $\omega_i$ is positive and normalized, and $\omega$ is recovered as the convex combination above. Uniqueness of the weights follows from $\omega(p_1) = \lambda$ and uniqueness of the normalized restrictions follows from the formula. The convex-join description is the standard identification of a convex set built by joining two convex sets along their extreme points.
papers/latex/vol-03-irreducibility-decomposition.tex:334:Let $\rho = \sum_{k=1}^{r} \lambda_k |v_k\rangle\langle v_k|$ be the spectral decomposition with $r \geq 2$ and all $\lambda_k > 0$. Every choice of an isometry $U \colon \mathbb{C}^{r} \to \mathbb{C}^{m}$ with $m \geq r$ produces a pure-state ensemble of $\rho$ through the unitary-mixing construction: the unnormalized vectors $|\phi_j\rangle = \sum_{k=1}^{r} U_{jk} \sqrt{\lambda_k} |v_k\rangle$ for $j = 1, \dots, m$ satisfy $\sum_j |\phi_j\rangle\langle\phi_j| = \rho$, because $U^* U = I_r$ rearranges the spectral sum. The corresponding ensemble consists of the normalized pure states $|\phi_j\rangle/\|\phi_j\|$ with probabilities $p_j = \|\phi_j\|^2$. Varying $U$ over the unitary group gives continuously many distinct ensembles, and two ensembles related by no unitary mixing differ as decompositions. In the qubit case $\rho = I/2$ the construction reads $I/2 = \frac{1}{2}(|0\rangle\langle 0| + |1\rangle\langle 1|) = \frac{1}{2}(|+\rangle\langle +| + |-\rangle\langle -|)$, and every orthonormal basis of $\mathbb{C}^2$ gives a new decomposition.
papers/latex/vol-03-irreducibility-decomposition.tex:424:\section{Admissible constructions and closure}
papers/latex/vol-03-irreducibility-decomposition.tex:443:\label{cor:closure}
papers/latex/vol-03-irreducibility-decomposition.tex:444:Let $S = \{M_{n_1}(\mathbb{C}), \dots, M_{n_k}(\mathbb{C})\}$ and let $\mathcal{C} = \{\oplus, \otimes\}$. The closure $\langle S \rangle_{\mathcal{C}}$ is the class of unital finite-dimensional complex C*-algebras whose dimension vector entries lie in the multiplicative semigroup generated by $n_1, \dots, n_k$ in $\mathbb{N}_{\geq 1}$.
papers/latex/vol-03-irreducibility-decomposition.tex:448:By \cref{prop:construction-arithmetic} every element of the closure has dimension vector entries built from the $n_i$ by multiplication, and every finite multiset of such products is realized by taking direct sums of tensor products of generators.
papers/latex/vol-03-irreducibility-decomposition.tex:465:\caption{Effect of the admissible constructions on dimension vectors, with the composition data each construction contributes. The two computable rows are the ones the closure argument uses.}
papers/latex/vol-03-irreducibility-decomposition.tex:469:\begin{example}[Qubit closure]
papers/latex/vol-03-irreducibility-decomposition.tex:470:\label{ex:qubit-closure}
papers/latex/vol-03-irreducibility-decomposition.tex:471:For $S = \{ \mathbb{C}, M_2(\mathbb{C}) \}$ under direct sum and tensor product, the multiplicative semigroup generated by $1$ and $2$ is $\{1, 2, 4, 8, \dots\}$, and the closure is the class of algebras whose dimension vectors have entries that are powers of two. The algebras $M_3(\mathbb{C})$ and $M_2(\mathbb{C}) \oplus M_3(\mathbb{C})$ are outside the closure. The enumeration of \cref{sec:computation} checks this arithmetic.
papers/latex/vol-03-irreducibility-decomposition.tex:474:The closure of a finite set of blocks under direct sum and tensor product is always infinite as a class, because tensor powers keep producing new sizes, and the closure is always decidable at the level of individual dimension vectors: entry size belongs to a finitely generated multiplicative semigroup of the positive integers, and membership in such a semigroup is decidable. The computability of the closure is a peculiarity of the finite-dimensional regime, where the constructions act on integer vectors; nothing here extends it to closure taken over the full admissible construction list of the framework section.
papers/latex/vol-03-irreducibility-decomposition.tex:594:The second artifact is a set of enumeration experiments in Python. One experiment enumerates dimension vectors of the closure of $\{\mathbb{C}, M_2(\mathbb{C})\}$ under direct sum and tensor product up to total dimension $64$ and checks the arithmetic of \cref{prop:construction-arithmetic}. It returns $1085$ dimension vectors, all of whose entries lie in the multiplicative semigroup $\{1, 2, 4, 8, 16, 32, 64\}$ generated by $1$ and $2$, and it confirms that $M_3(\mathbb{C})$ lies outside the closure. A second experiment enumerates multiplicity matrices for the three block pairs of \cref{tab:homs} and returns exactly $2$, $1$, and $6$ solutions, matching the conjugacy-class counts of the table entry by entry. A third computes Choi ranks of completely positive maps: for a random map of minimal rank $1$, presented Kraus families of sizes $1$, $2$, $3$, $5$, and $8$ all return Choi rank $1$ and reproduce the same map, while the identity channel and conjugation by the Pauli $Z$ operator both have rank $1$ and differ on the Pauli $X$ operator. The experiments run in seconds on ordinary hardware and record their seeds in the source.
papers/latex/vol-03-irreducibility-decomposition.tex:634:Dimension vector arithmetic under direct sum and tensor product & \path{exp_closure.py} & \path{closure_enumeration} & Enumerated closures match pairwise product and multiset union \\
lean/Cmrps/Vol11CompletenessObstructions.lean:30:namespace Cmrps.Vol11
lean/Cmrps/Vol11CompletenessObstructions.lean:37:inductive ParameterKind where
lean/Cmrps/Vol11CompletenessObstructions.lean:50:structure Recognizer {α : Type u} (S : Setoid α) where
lean/Cmrps/Vol11CompletenessObstructions.lean:61:structure ParameterSpace {α : Type u} {κ : Type v} (S : Setoid α) where
lean/Cmrps/Vol11CompletenessObstructions.lean:70:structure CompleteInvariant {α : Type u} (S : Setoid α) (ι : Type v) where
lean/Cmrps/Vol11CompletenessObstructions.lean:79:structure ClassificationProgram {α : Type u} (S : Setoid α) (ι : Type v)
lean/Cmrps/Vol11CompletenessObstructions.lean:99:structure FiniteVarietyParametrization {α : Type u} {κ : Type v}
lean/Cmrps/Vol11CompletenessObstructions.lean:109:inductive Regime where
lean/Cmrps/Vol11CompletenessObstructions.lean:121:theorem Regime.occupies_exactly_one {α : Type u} (reg : α → Regime) (x : α) :
lean/Cmrps/Vol11CompletenessObstructions.lean:128:def CompleteInvariant.onClasses {α : Type u} {S : Setoid α} {ι : Type v}
lean/Cmrps/Vol11CompletenessObstructions.lean:139:theorem CountableInvariantImpossibility
lean/Cmrps/Vol11CompletenessObstructions.lean:155:structure IsomorphismInjective {α : Type u} {β : Type w}
lean/Cmrps/Vol11CompletenessObstructions.lean:162:def IsomorphismInjective.classes {α : Type u} {β : Type w} {S : Setoid α}
lean/Cmrps/Vol11CompletenessObstructions.lean:169:theorem IsomorphismInjective.classes_injective
lean/Cmrps/Vol11CompletenessObstructions.lean:177:def ObstructionTransport.pullback
lean/Cmrps/Vol11CompletenessObstructions.lean:189:theorem ObstructionTransport.uncountableClasses
lean/Cmrps/Vol11CompletenessObstructions.lean:198:theorem ObstructionTransport.noCountableInvariant
lean/Cmrps/Vol11CompletenessObstructions.lean:212:def DecidableProblem {κ : Type u} (Q : κ → Prop) : Prop :=
lean/Cmrps/Vol11CompletenessObstructions.lean:226:theorem UndecidabilityTransport
lean/Cmrps/Vol11CompletenessObstructions.lean:244:structure SporadicDecomposition (κ : Type u) where
lean/Cmrps/Vol11CompletenessObstructions.lean:260:theorem FiniteSporadicFails {κ : Type u} (d : SporadicDecomposition κ)
lean/Cmrps/Vol11CompletenessObstructions.lean:278:theorem TwoRegimeFails (f : Regime → Bool) : ¬ Function.Injective f := by
lean/Cmrps/Vol11CompletenessObstructions.lean:291:def Coarsens {α : Type u} (r s : α → α → Prop) : Prop :=
lean/Cmrps/Vol11CompletenessObstructions.lean:300:theorem IsocategoricalEquivalenceFails
lean/Cmrps/Vol11CompletenessObstructions.lean:310:inductive SurveyedDomain where
lean/Cmrps/Vol11CompletenessObstructions.lean:347:def RegimeAssignment : SurveyedDomain → Regime
lean/Cmrps/Vol11CompletenessObstructions.lean:380:theorem RegimeAssignment.total (d : SurveyedDomain) :
lean/Cmrps/Vol11CompletenessObstructions.lean:386:theorem RegimeAssignment.unique (d : SurveyedDomain) :
lean/Cmrps/Vol11CompletenessObstructions.lean:392:theorem RegimeAssignment.every_regime_used (ρ : Regime) :
lean/Cmrps/Vol11CompletenessObstructions.lean:403:end Cmrps.Vol11
lean/Cmrps/Vol12PrincipiaPhysica.lean:17:namespace Cmrps.Vol12
lean/Cmrps/Vol12PrincipiaPhysica.lean:23:structure PrincipiaLayers where
lean/Cmrps/Vol12PrincipiaPhysica.lean:41:def NotFactoring {M P Obs : Type} (cls : P → M) (select : P → Obs) : Prop :=
lean/Cmrps/Vol12PrincipiaPhysica.lean:47:theorem SelectionNotComputedByClassification
lean/Cmrps/Vol12PrincipiaPhysica.lean:57:inductive EvidenceGrade
lean/Cmrps/Vol12PrincipiaPhysica.lean:64:inductive RecordType
lean/Cmrps/Vol12PrincipiaPhysica.lean:74:def evidenceGrade : RecordType → EvidenceGrade
lean/Cmrps/Vol12PrincipiaPhysica.lean:83:def registryTypes : List RecordType :=
lean/Cmrps/Vol12PrincipiaPhysica.lean:89:theorem EvidenceGradeAssignment (r : RecordType) :
lean/Cmrps/Vol12PrincipiaPhysica.lean:95:theorem registry_no_grade3 :
lean/Cmrps/Vol12PrincipiaPhysica.lean:104:theorem registry_grades :
lean/Cmrps/Vol12PrincipiaPhysica.lean:111:inductive Regime
lean/Cmrps/Vol12PrincipiaPhysica.lean:116:structure SpineRow where
lean/Cmrps/Vol12PrincipiaPhysica.lean:123:def spineTable : List SpineRow :=
lean/Cmrps/Vol12PrincipiaPhysica.lean:155:def spineRegimes : List Regime := spineTable.map (·.regime)
lean/Cmrps/Vol12PrincipiaPhysica.lean:158:def countRegime (r : Regime) : List Regime → ℕ
lean/Cmrps/Vol12PrincipiaPhysica.lean:162:theorem spine_row_count : spineTable.length = 29 := by decide
lean/Cmrps/Vol12PrincipiaPhysica.lean:166:theorem RegimeAssignment :
lean/Cmrps/Vol12PrincipiaPhysica.lean:179:inductive ObstructionObjective
lean/Cmrps/Vol12PrincipiaPhysica.lean:189:structure RegisteredObstruction where
lean/Cmrps/Vol12PrincipiaPhysica.lean:195:def refutingTheorem : ObstructionObjective → RegisteredObstruction
lean/Cmrps/Vol12PrincipiaPhysica.lean:216:theorem (data-level formalization of the survey). -/
lean/Cmrps/Vol12PrincipiaPhysica.lean:217:theorem ObstructionAssembly (o : ObstructionObjective) :
lean/Cmrps/Vol12PrincipiaPhysica.lean:224:structure (hdata) but are inequivalent at the level one wants to recover (hcls), no recovery
lean/Cmrps/Vol12PrincipiaPhysica.lean:228:theorem StructurePreservation
lean/Cmrps/Vol12PrincipiaPhysica.lean:238:def f_id : ℝ → ℝ := fun x => x
lean/Cmrps/Vol12PrincipiaPhysica.lean:241:noncomputable def f_aff : ℝ → ℝ := fun x => (x + 1) / 2
lean/Cmrps/Vol12PrincipiaPhysica.lean:244:theorem MonotoneWitnessDistinct : f_id ≠ f_aff := by
lean/Cmrps/Vol12PrincipiaPhysica.lean:252:theorem MonotoneMetricGap {Param : Type} (f g : Param) (hne : f ≠ g) :
lean/Cmrps/Vol12PrincipiaPhysica.lean:268:theorem MonotoneMetricGapQuantum
lean/Cmrps/Vol12PrincipiaPhysica.lean:278:structure ClayProblem where
lean/Cmrps/Vol12PrincipiaPhysica.lean:285:def ClaySolved (C : ClayProblem) : Prop := C.Existence ∧ C.MassGap
lean/Cmrps/Vol12PrincipiaPhysica.lean:289:theorem ExistenceMassGapSeparation (C : ClayProblem)
lean/Cmrps/Vol12PrincipiaPhysica.lean:295:inductive LadderPosition
lean/Cmrps/Vol12PrincipiaPhysica.lean:306:def claimPositions : List LadderPosition :=
lean/Cmrps/Vol12PrincipiaPhysica.lean:309:theorem claim_positions_exact :
lean/Cmrps/Vol12PrincipiaPhysica.lean:313:theorem claim_ledger_size : claimPositions.length = 5 := by decide
lean/Cmrps/Vol12PrincipiaPhysica.lean:317:theorem claim_ledger_not_verified :
lean/Cmrps/Vol12PrincipiaPhysica.lean:331:def countNat (n : ℕ) : List ℕ → ℕ
lean/Cmrps/Vol12PrincipiaPhysica.lean:336:def SameBlocks (l₁ l₂ : List ℕ) : Prop := ∀ n, countNat n l₁ = countNat n l₂
lean/Cmrps/Vol12PrincipiaPhysica.lean:338:theorem sameBlocks_refl (l : List ℕ) : SameBlocks l l := fun _ => rfl
lean/Cmrps/Vol12PrincipiaPhysica.lean:340:theorem sameBlocks_symm {l₁ l₂ : List ℕ} (h : SameBlocks l₁ l₂) : SameBlocks l₂ l₁ :=
lean/Cmrps/Vol12PrincipiaPhysica.lean:343:theorem sameBlocks_trans {l₁ l₂ l₃ : List ℕ} (h₁ : SameBlocks l₁ l₂)
lean/Cmrps/Vol12PrincipiaPhysica.lean:350:structure InvariantRecord (S O D G R : Type) where
lean/Cmrps/Vol12PrincipiaPhysica.lean:359:structure ConstituentRecord (F Inv G : Type) where
lean/Cmrps/Vol12PrincipiaPhysica.lean:368:inductive Layer
lean/Cmrps/Vol12PrincipiaPhysica.lean:375:def constructionLayer : Layer := .mathematical
lean/Cmrps/Vol12PrincipiaPhysica.lean:378:theorem ConstructionLayerSeparation :
lean/Cmrps/Vol12PrincipiaPhysica.lean:390:theorem ConditionalStructuralGeneration
lean/Cmrps/Vol12PrincipiaPhysica.lean:409:theorem GenerationVersusClassification
lean/Cmrps/Vol12PrincipiaPhysica.lean:422:theorem FiniteDimCStarDecomposition
lean/Cmrps/Vol12PrincipiaPhysica.lean:431:theorem ExampleBlockMultiset :
lean/Cmrps/Vol12PrincipiaPhysica.lean:440:end Cmrps.Vol12
lean/Cmrps/Vol06QuantumSystems.lean:38:namespace Cmrps.Vol06
lean/Cmrps/Vol06QuantumSystems.lean:44:abbrev DimensionVector : Type := List ℕ
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
lean/Cmrps/Vol06QuantumSystems.lean:201:abbrev BlockAlgebra {k : ℕ} (s : Fin k → ℕ) : Type :=
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
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:33:namespace Cmrps.Vol03
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:42:def dimVector {ι : Type*} [Fintype ι] (n : ι → ℕ) : Multiset ℕ :=
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:47:abbrev BlockAlg {ι : Type*} [Fintype ι] (n : ι → ℕ) :=
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:51:def starBlock {ι : Type*} [Fintype ι] {n : ι → ℕ} (x : BlockAlg n) : BlockAlg n :=
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:57:structure MultiplicityMatrix {ι κ : Type*} [Fintype ι] [Fintype κ]
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:65:def rankMatrix {ι κ : Type*} [Fintype ι] [Fintype κ] {n : ι → ℕ} {m : κ → ℕ}
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:75:def sizeSemigroup (S : Set ℕ) : Submonoid ℕ :=
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:81:def ClosedVectors (S : Set ℕ) (v : Multiset ℕ) : Prop :=
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:85:def pairwiseProd (v w : Multiset ℕ) : Multiset ℕ :=
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:90:def blockPerm {ι : Type*} [Fintype ι] (n : ι → ℕ) : Subgroup (Equiv.Perm ι) where
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:102:theorem mem_blockPerm {ι : Type*} [Fintype ι] {n : ι → ℕ} {σ : Equiv.Perm ι} :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:110:theorem finrank_blockAlg {ι : Type*} [Fintype ι] (n : ι → ℕ) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:116:theorem starBlock_involutive {ι : Type*} [Fintype ι] {n : ι → ℕ} (x : BlockAlg n) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:122:theorem starBlock_mul {ι : Type*} [Fintype ι] {n : ι → ℕ} (x y : BlockAlg n) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:130:theorem dimVector_perm_invariant {ι : Type*} [Fintype ι] (n : ι → ℕ) (σ : Equiv.Perm ι) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:144:theorem dimVector_sum_elim {ι κ : Type*} [Fintype ι] [Fintype κ]
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:159:theorem dimVector_prod {ι κ : Type*} [Fintype ι] [Fintype κ]
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:177:theorem finrank_tensor_blocks (a b : ℕ) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:185:theorem sum_two_sq_eq_eight : (2 : ℕ) ^ 2 + 2 ^ 2 = 8 := by norm_num
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:187:theorem ne_eight_of_sq (a b : ℕ) : (a * b) ^ 2 ≠ 8 := by
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:206:theorem two_two_blocks_ne_tensor_block (a b : ℕ) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:223:theorem rankMatrix_colSum {ι κ : Type*} [Fintype ι] [Fintype κ] {n : ι → ℕ} {m : κ → ℕ}
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:230:theorem multiplicity_example_44 (r1 r2 : ℕ) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:240:theorem multiplicity_col_sum_one (x y : ℕ) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:249:theorem multiplicity_col_sum_two (x y : ℕ) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:259:theorem multiplicity_diagonal_unique (r s : ℕ) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:267:theorem mem_sizeSemigroup_of_mem {S : Set ℕ} {x : ℕ} (hx : x ∈ S) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:271:theorem one_mem_sizeSemigroup (S : Set ℕ) : 1 ∈ sizeSemigroup S :=
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:274:theorem mul_mem_sizeSemigroup {S : Set ℕ} {x y : ℕ}
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:280:theorem closedVectors_add {S : Set ℕ} {v w : Multiset ℕ}
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:289:theorem closedVectors_pairwiseProd {S : Set ℕ} {v w : Multiset ℕ}
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:299:theorem closedVectors_singleton {S : Set ℕ} {x : ℕ} (hx : x ∈ S) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:308:theorem mem_sizeSemigroup_one_two (x : ℕ) :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:325:theorem two_pow_ne_three (k : ℕ) : (2 : ℕ) ^ k ≠ 3 := by
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:339:theorem three_not_mem_sizeSemigroup_one_two :
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:345:end Cmrps.Vol03
lean/Cmrps/Vol10ObservationalEquivalence.lean:17:namespace Cmrps.Vol10
lean/Cmrps/Vol10ObservationalEquivalence.lean:24:structure SystemRecord where
lean/Cmrps/Vol10ObservationalEquivalence.lean:40:def AdmissibleCandidate {S : Type*} (mathIso : S → S → Prop)
lean/Cmrps/Vol10ObservationalEquivalence.lean:46:inductive EquivalenceNotion where
lean/Cmrps/Vol10ObservationalEquivalence.lean:53:inductive MorphismKind where
lean/Cmrps/Vol10ObservationalEquivalence.lean:61:inductive PreservedLayer where
lean/Cmrps/Vol10ObservationalEquivalence.lean:75:structure EquivalenceWitness where
lean/Cmrps/Vol10ObservationalEquivalence.lean:84:def DeclaresSymmetric (w : EquivalenceWitness) : Prop :=
lean/Cmrps/Vol10ObservationalEquivalence.lean:92:structure ObservationFunctor (S R : Type*) where
lean/Cmrps/Vol10ObservationalEquivalence.lean:102:def obsEquiv {S R : Type*} (F : ObservationFunctor S R) (P Q : S) : Prop :=
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
lean/Cmrps/Vol10ObservationalEquivalence.lean:291:theorem eg_plain_tensor_insufficient {Grp : Type}
lean/Cmrps/Vol10ObservationalEquivalence.lean:302:theorem preserved_layer_discipline {Grp : Type}
lean/Cmrps/Vol10ObservationalEquivalence.lean:315:def fisherForm {n : ℕ} (p a : Fin n → ℚ) : ℚ :=
lean/Cmrps/Vol10ObservationalEquivalence.lean:321:def chentsov_fisher_uniqueness {n : ℕ}
lean/Cmrps/Vol10ObservationalEquivalence.lean:328:def mcTerm {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ) (A : Fin n → Fin n → ℚ)
lean/Cmrps/Vol10ObservationalEquivalence.lean:334:def mcQuadratic {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ) (A : Fin n → Fin n → ℚ) : ℚ :=
lean/Cmrps/Vol10ObservationalEquivalence.lean:338:def NormalizedAtOne (f : ℚ → ℚ) : Prop := f 1 = 1
lean/Cmrps/Vol10ObservationalEquivalence.lean:342:def SelfReciprocal (f : ℚ → ℚ) : Prop := ∀ x : ℚ, 0 < x → f x = x * f x⁻¹
lean/Cmrps/Vol10ObservationalEquivalence.lean:345:def petzTranspose (f : ℚ → ℚ) (x : ℚ) : ℚ := x * f x⁻¹
lean/Cmrps/Vol10ObservationalEquivalence.lean:355:def petz_sudar_parametricity {n : ℕ}
lean/Cmrps/Vol10ObservationalEquivalence.lean:372:theorem petz_transpose_same_form {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ)
lean/Cmrps/Vol10ObservationalEquivalence.lean:388:theorem monotone_commutative_restriction {n : ℕ} (f : ℚ → ℚ) (hf1 : f 1 = 1)
lean/Cmrps/Vol10ObservationalEquivalence.lean:403:theorem commutative_restriction_is_fisher {n : ℕ} (f : ℚ → ℚ) (hf1 : f 1 = 1)
lean/Cmrps/Vol10ObservationalEquivalence.lean:412:def fRat (x : ℚ) : ℚ := 2 * x / (1 + x)
lean/Cmrps/Vol10ObservationalEquivalence.lean:415:def hRat (x : ℚ) : ℚ := (1 + x) / 2
lean/Cmrps/Vol10ObservationalEquivalence.lean:418:def rhoDiag : Fin 2 → ℚ := fun i => if i = 0 then 3/4 else 1/4
lean/Cmrps/Vol10ObservationalEquivalence.lean:421:def sigmaX : Fin 2 → Fin 2 → ℚ := fun i j => if i = j then 0 else 1
lean/Cmrps/Vol10ObservationalEquivalence.lean:426:theorem monotone_not_canonical :
lean/Cmrps/Vol10ObservationalEquivalence.lean:439:theorem monotone_ruler_dependence :
lean/Cmrps/Vol10ObservationalEquivalence.lean:444:end Cmrps.Vol10
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
lean/Cmrps/Vol07GaugeQft.lean:235:structure AnomalyObstruction (A : Type*) [Zero A] where
lean/Cmrps/Vol07GaugeQft.lean:243:def QuantizationGate {A : Type*} [Zero A] (o : AnomalyObstruction A) : Prop :=
lean/Cmrps/Vol07GaugeQft.lean:246:theorem quantization_gate_iff {A : Type*} [Zero A] (o : AnomalyObstruction A) :
lean/Cmrps/Vol07GaugeQft.lean:250:theorem not_quantization_gate_of_ne_zero {A : Type*} [Zero A] (o : AnomalyObstruction A)
lean/Cmrps/Vol07GaugeQft.lean:253:theorem not_quantization_gate_of_not_trivial {A : Type*} [Zero A] (o : AnomalyObstruction A)
lean/Cmrps/Vol07GaugeQft.lean:257:theorem quantization_gate_iff_anomalyFree {R A : Type*} [AddCommGroup R] [AddCommGroup A]
lean/Cmrps/Vol07GaugeQft.lean:267:structure GlobalFormInvariant (B : Type*) where
lean/Cmrps/Vol07GaugeQft.lean:278:abbrev SO3BundleClass : Type := ZMod 2
lean/Cmrps/Vol07GaugeQft.lean:281:def w2 : SO3BundleClass → ZMod 2 := id
lean/Cmrps/Vol07GaugeQft.lean:284:def so3_w2_detection : GlobalFormInvariant SO3BundleClass where
lean/Cmrps/Vol07GaugeQft.lean:290:theorem so3_two_classes : Fintype.card SO3BundleClass = 2 :=
lean/Cmrps/Vol07GaugeQft.lean:294:theorem w2_detects_nontrivial {B : Type*} (F : GlobalFormInvariant B) {b : B}
lean/Cmrps/Vol07GaugeQft.lean:302:def SU2BundleClass : Type := PUnit
lean/Cmrps/Vol07GaugeQft.lean:304:theorem su2_bundles_over_s2_trivial (b : SU2BundleClass) : b = ⟨⟩ := by
lean/Cmrps/Vol07GaugeQft.lean:308:end Cmrps.Vol07
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
lean/Cmrps/Vol08SpacetimeReconstruction.lean:60:namespace Cmrps.Vol08
lean/Cmrps/Vol08SpacetimeReconstruction.lean:68:def Past {α : Type*} (r : α → α → Prop) (x : α) : Set α := {y | r y x}
lean/Cmrps/Vol08SpacetimeReconstruction.lean:72:def Future {α : Type*} (r : α → α → Prop) (x : α) : Set α := {y | r x y}
lean/Cmrps/Vol08SpacetimeReconstruction.lean:78:def IsDistinguishing {α : Type*} (r : α → α → Prop) : Prop :=
lean/Cmrps/Vol08SpacetimeReconstruction.lean:87:theorem no_increasing_loop {X : Type*} [Preorder X] (n : ℕ) (g : ℕ → X)
lean/Cmrps/Vol08SpacetimeReconstruction.lean:105:theorem interval_finite {X : Type*} [Preorder X] [Finite X] (x y : X) :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:110:theorem interval_compact {X : Type*} [Preorder X] [Finite X] [TopologicalSpace X]
lean/Cmrps/Vol08SpacetimeReconstruction.lean:118:theorem antichain_fails_distinguishing :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:128:theorem ladder_nontransfer_finite_orders :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:140:def Ssa {ι : Type*} (S : Set ι → ℝ) : Prop :=
lean/Cmrps/Vol08SpacetimeReconstruction.lean:144:def Subadditive {ι : Type*} (S : Set ι → ℝ) : Prop :=
lean/Cmrps/Vol08SpacetimeReconstruction.lean:148:def ArakiLieb {ι : Type*} (S : Set ι → ℝ) : Prop :=
lean/Cmrps/Vol08SpacetimeReconstruction.lean:154:def Mmi {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) : Prop :=
lean/Cmrps/Vol08SpacetimeReconstruction.lean:158:def MutualInfo {ι : Type*} (S : Set ι → ℝ) (A B : Set ι) : ℝ :=
lean/Cmrps/Vol08SpacetimeReconstruction.lean:162:def CondMutualInfo {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) : ℝ :=
lean/Cmrps/Vol08SpacetimeReconstruction.lean:166:def TripartiteInfo {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) : ℝ :=
lean/Cmrps/Vol08SpacetimeReconstruction.lean:175:noncomputable def correlatedTripleWitness (u : Set (Fin 3)) : ℝ :=
lean/Cmrps/Vol08SpacetimeReconstruction.lean:178:theorem correlatedTripleWitness_empty :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:182:theorem correlatedTripleWitness_eq_one {u : Set (Fin 3)} (hu : u ≠ ∅) :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:186:theorem correlatedTripleWitness_nonneg (u : Set (Fin 3)) :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:192:theorem correlatedTripleWitness_le_one (u : Set (Fin 3)) :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:200:theorem correlatedTripleWitness_ssa : Ssa (correlatedTripleWitness : Set (Fin 3) → ℝ) := by
lean/Cmrps/Vol08SpacetimeReconstruction.lean:221:theorem correlatedTripleWitness_mmi_fails :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:243:theorem correlatedTripleWitness_mmi_margin :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:270:theorem mmi_independent_of_ssa :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:280:theorem correlatedTripleWitness_clean :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:326:theorem mmi_iff_information_form {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:333:theorem mmi_iff_tripartite_nonpos {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:341:theorem cmi_factorization {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι) :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:353:theorem ssa_of_subadditive_and_mmi {ι : Type*} (S : Set ι → ℝ) (A B C : Set ι)
lean/Cmrps/Vol08SpacetimeReconstruction.lean:366:def upSetTopology (α : Type*) [Preorder α] : TopologicalSpace α :=
lean/Cmrps/Vol08SpacetimeReconstruction.lean:369:theorem isUpperSet_of_isOpen {α : Type*} [Preorder α] {s : Set α}
lean/Cmrps/Vol08SpacetimeReconstruction.lean:378:theorem isOpen_iff_isUpperSet {α : Type*} [Preorder α] {s : Set α} :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:382:theorem isClosed_iff_isLowerSet {α : Type*} [Preorder α] {s : Set α} :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:393:theorem exists_upperSet_separating {α : Type*} [PartialOrder α] (x y : α) (hne : x ≠ y) :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:406:theorem closure_singleton_eq_downset {α : Type*} [PartialOrder α] (x : α) :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:426:theorem le_iff_mem_closure {α : Type*} [PartialOrder α] (x y : α) :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:434:theorem upSetTopology_t0Space {α : Type*} [PartialOrder α] :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:449:theorem specialization_order_recovery {α : Type*} [PartialOrder α] :
lean/Cmrps/Vol08SpacetimeReconstruction.lean:462:inductive ThurstonGeometry3 : Type where
lean/Cmrps/Vol08SpacetimeReconstruction.lean:475:theorem card_thurstonGeometry3 : Fintype.card ThurstonGeometry3 = 8 := by decide
lean/Cmrps/Vol08SpacetimeReconstruction.lean:477:end Cmrps.Vol08
lean/Cmrps/Vol04YonedaClassification.lean:31:namespace Cmrps.Vol04
lean/Cmrps/Vol04YonedaClassification.lean:43:def relationalProfile (P : C) : Cᵒᵖ ⥤ Type v :=
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
lean/Cmrps/Vol04YonedaClassification.lean:190:theorem profile_restriction_gap :
lean/Cmrps/Vol04YonedaClassification.lean:201:end RestrictionGap
lean/Cmrps/Vol04YonedaClassification.lean:212:theorem profile_limit_preservation (P : C) :
lean/Cmrps/Vol04YonedaClassification.lean:218:theorem yoneda_embedding_preserves_limits :
lean/Cmrps/Vol04YonedaClassification.lean:223:noncomputable def profile_prod_iso (A B : C) [HasBinaryProduct A B] :
lean/Cmrps/Vol04YonedaClassification.lean:228:noncomputable def profile_terminal_iso [HasTerminal C] :
lean/Cmrps/Vol04YonedaClassification.lean:232:end Limits
lean/Cmrps/Vol04YonedaClassification.lean:241:abbrev M (n : ℕ) := Matrix (Fin n) (Fin n) ℂ
lean/Cmrps/Vol04YonedaClassification.lean:245:def choiMatrix {n m : ℕ} (Φ : M n →ₗ[ℂ] M m) : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ :=
lean/Cmrps/Vol04YonedaClassification.lean:250:private theorem add_entry {n : ℕ} (X Y : M n) (i j : Fin n) :
lean/Cmrps/Vol04YonedaClassification.lean:254:private theorem smul_entry {n : ℕ} (c : ℂ) (X : M n) (i j : Fin n) :
lean/Cmrps/Vol04YonedaClassification.lean:259:private theorem ofChoi_add {n m : ℕ} (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ)
lean/Cmrps/Vol04YonedaClassification.lean:269:private theorem ofChoi_smul {n m : ℕ} (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ)
lean/Cmrps/Vol04YonedaClassification.lean:278:def ofChoi {n m : ℕ} (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ) : M n →ₗ[ℂ] M m where
lean/Cmrps/Vol04YonedaClassification.lean:284:theorem sum_single_smul {n : ℕ} (X : M n) :
lean/Cmrps/Vol04YonedaClassification.lean:301:theorem map_eq_sum_single {n p : ℕ} (Ψ : M n →ₗ[ℂ] M p) (Y : M n) (α β) :
lean/Cmrps/Vol04YonedaClassification.lean:307:def choi_correspondence {n m : ℕ} :
lean/Cmrps/Vol04YonedaClassification.lean:342:theorem choi_composition {n m p : ℕ} (Φ : M n →ₗ[ℂ] M m) (Ψ : M m →ₗ[ℂ] M p) :
lean/Cmrps/Vol04YonedaClassification.lean:351:def partialTrace {n m : ℕ} (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ) : M n :=
lean/Cmrps/Vol04YonedaClassification.lean:355:private theorem trace_single {n : ℕ} (i j : Fin n) :
lean/Cmrps/Vol04YonedaClassification.lean:369:theorem choi_trace_preserving {n m : ℕ} (Φ : M n →ₗ[ℂ] M m) :
lean/Cmrps/Vol04YonedaClassification.lean:413:end Choi
lean/Cmrps/Vol04YonedaClassification.lean:415:end Cmrps.Vol04
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
lean/Cmrps/Vol01Foundations.lean:155:structure CategoryData (Obj : Type u) (Hom : Obj → Obj → Type v) where
lean/Cmrps/Vol01Foundations.lean:169:def CoarseHom (P Q : FinRec) : Type := {f : P.X → Q.X // IsCoarseGraining f}
lean/Cmrps/Vol01Foundations.lean:172:def EmbeddingHom (P Q : FinRec) : Type := {f : P.X → Q.X // IsEmbedding f}
lean/Cmrps/Vol01Foundations.lean:175:def EquivalenceHom (P Q : FinRec) : Type := {f : P.X → Q.X // IsEquivalenceMorphism f}
lean/Cmrps/Vol01Foundations.lean:179:def coarseGraining_kindCategory : CategoryData FinRec CoarseHom where
lean/Cmrps/Vol01Foundations.lean:188:def embedding_kindCategory : CategoryData FinRec EmbeddingHom where
lean/Cmrps/Vol01Foundations.lean:197:def equivalenceMorphism_kindCategory : CategoryData FinRec EquivalenceHom where
lean/Cmrps/Vol01Foundations.lean:209:def ObservableClosure {X : Type} (O : Set (X → ℝ)) : Prop :=
lean/Cmrps/Vol01Foundations.lean:213:def delta {X : Type} [DecidableEq X] (x : X) : X → ℝ := fun y => if y = x then 1 else 0
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
lean/Cmrps/Vol01Foundations.lean:466:theorem class_eq_of_mem {X : Type} {f : X → X} {D : DynDecomposition f}
lean/Cmrps/Vol01Foundations.lean:504:theorem components_unique {X : Type} {f : X → X}
lean/Cmrps/Vol01Foundations.lean:529:theorem components_exist {X : Type} [Fintype X] (f : X → X) :
lean/Cmrps/Vol01Foundations.lean:576:def IsIrreducibleProduct (X : Type) [Fintype X] : Prop :=
lean/Cmrps/Vol01Foundations.lean:582:theorem irreducibleProduct_iff_prime_card {X : Type} [Fintype X] :
lean/Cmrps/Vol01Foundations.lean:615:theorem prime_factorization {X : Type} [Fintype X] (h : Fintype.card X ≠ 0) :
lean/Cmrps/Vol01Foundations.lean:622:theorem prime_factorization_unique {n : ℕ} {l : List ℕ}
lean/Cmrps/Vol01Foundations.lean:632:abbrev CoeffMat := Matrix (Fin 2) (Fin 2) ℂ
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
lean/Cmrps/Vol02StructuralFamilies.lean:130:theorem sharpness_injects_into_superset (R : FamilyRecord) (h : R.Classifying)
lean/Cmrps/Vol02StructuralFamilies.lean:144:theorem sharpness_uncountable (R : FamilyRecord) (h : R.Classifying)
lean/Cmrps/Vol02StructuralFamilies.lean:150:end FamilyRecord
lean/Cmrps/Vol02StructuralFamilies.lean:156:structure SymplecticGermField where
lean/Cmrps/Vol02StructuralFamilies.lean:168:def GermInvariant {G : SymplecticGermField} {A : Type v} (f : G.Germ → A) : Prop :=
lean/Cmrps/Vol02StructuralFamilies.lean:173:theorem globality_symplectic {G : SymplecticGermField} {A : Type v} {f : G.Germ → A}
lean/Cmrps/Vol02StructuralFamilies.lean:184:theorem globality_no_local_classifier {G : SymplecticGermField} {A : Type v}
lean/Cmrps/Vol02StructuralFamilies.lean:191:inductive AchievementKind where
lean/Cmrps/Vol02StructuralFamilies.lean:206:structure Sector where
lean/Cmrps/Vol02StructuralFamilies.lean:218:def kindOf : Sector → AchievementKind
lean/Cmrps/Vol02StructuralFamilies.lean:226:def KindApplies : AchievementKind → Sector → Prop
lean/Cmrps/Vol02StructuralFamilies.lean:242:theorem kindOf_applies (s : Sector) : KindApplies (kindOf s) s := by
lean/Cmrps/Vol02StructuralFamilies.lean:248:theorem kindOf_unique (s : Sector) (k : AchievementKind) (hk : KindApplies k s) :
lean/Cmrps/Vol02StructuralFamilies.lean:256:theorem achievement_kinds_exhaustive (s : Sector) :
lean/Cmrps/Vol02StructuralFamilies.lean:264:abbrev DimensionVector := Multiset ℕ
lean/Cmrps/Vol02StructuralFamilies.lean:266:namespace DimensionVector
lean/Cmrps/Vol02StructuralFamilies.lean:269:def Pos (v : DimensionVector) : Prop := ∀ n ∈ v, 0 < n
lean/Cmrps/Vol02StructuralFamilies.lean:272:def totalDim (v : DimensionVector) : ℕ := (v.map (· ^ 2)).sum
lean/Cmrps/Vol02StructuralFamilies.lean:275:def sum (v w : DimensionVector) : DimensionVector := v + w
lean/Cmrps/Vol02StructuralFamilies.lean:280:def tensor (v w : DimensionVector) : DimensionVector :=
lean/Cmrps/Vol02StructuralFamilies.lean:283:theorem pos_sum {v w : DimensionVector} (hv : v.Pos) (hw : w.Pos) : (sum v w).Pos :=
lean/Cmrps/Vol02StructuralFamilies.lean:290:private theorem mem_product {v w : Multiset ℕ} {p : ℕ × ℕ} :
lean/Cmrps/Vol02StructuralFamilies.lean:294:theorem pos_tensor {v w : DimensionVector} (hv : v.Pos) (hw : w.Pos) :
lean/Cmrps/Vol02StructuralFamilies.lean:301:theorem totalDim_sum (v w : DimensionVector) :
lean/Cmrps/Vol02StructuralFamilies.lean:307:private lemma sum_product_map (v w : Multiset ℕ) (f g : ℕ → ℕ) :
lean/Cmrps/Vol02StructuralFamilies.lean:318:theorem totalDim_tensor (v w : DimensionVector) :
lean/Cmrps/Vol02StructuralFamilies.lean:331:private lemma sq_le_sum_map (v : Multiset ℕ) : ∀ n ∈ v, n ^ 2 ≤ (v.map (· ^ 2)).sum := by
lean/Cmrps/Vol02StructuralFamilies.lean:342:private lemma le_totalDim_of_mem {v : DimensionVector} (hp : v.Pos) {n : ℕ}
lean/Cmrps/Vol02StructuralFamilies.lean:350:private lemma card_le_totalDim : ∀ {v : DimensionVector}, v.Pos → v.card ≤ v.totalDim := by
lean/Cmrps/Vol02StructuralFamilies.lean:366:private def encode (d : ℕ) (v : DimensionVector) (hv : v.Pos ∧ v.totalDim = d) :
lean/Cmrps/Vol02StructuralFamilies.lean:375:private lemma encode_injective (d : ℕ) (v w : DimensionVector)
lean/Cmrps/Vol02StructuralFamilies.lean:407:theorem dimVector_finite (d : ℕ) :
lean/Cmrps/Vol02StructuralFamilies.lean:417:end DimensionVector
lean/Cmrps/Vol02StructuralFamilies.lean:422:abbrev Kraus.M := Matrix (Fin 2) (Fin 2) ℂ
lean/Cmrps/Vol02StructuralFamilies.lean:424:namespace Kraus
lean/Cmrps/Vol02StructuralFamilies.lean:429:def φ (U : M) (X : M) : M := U * X * U ᴴ
lean/Cmrps/Vol02StructuralFamilies.lean:433:def SameChannel (Φ Ψ : M → M) : Prop := ∀ X : M, Φ X = Ψ X
lean/Cmrps/Vol02StructuralFamilies.lean:435:theorem sameChannel_iff (Φ Ψ : M → M) : SameChannel Φ Ψ ↔ Φ = Ψ :=
lean/Cmrps/Vol02StructuralFamilies.lean:439:def IsUnitary (U : M) : Prop := U * U ᴴ = 1 ∧ U ᴴ * U = 1
lean/Cmrps/Vol02StructuralFamilies.lean:442:def KrausRep (Φ : M → M) (ops : List M) : Prop :=
lean/Cmrps/Vol02StructuralFamilies.lean:446:def IsKrausRank (n : ℕ) (Φ : M → M) : Prop :=
lean/Cmrps/Vol02StructuralFamilies.lean:450:theorem kraus_rep_one (U : M) : KrausRep (φ U) [U] := by
lean/Cmrps/Vol02StructuralFamilies.lean:455:theorem not_kraus_rep_zero (U : M) (hU : IsUnitary U) : ¬ KrausRep (φ U) [] := by
lean/Cmrps/Vol02StructuralFamilies.lean:467:theorem kraus_rank_one (U : M) (hU : IsUnitary U) : IsKrausRank 1 (φ U) := by
lean/Cmrps/Vol02StructuralFamilies.lean:478:private def X : M := Matrix.of fun _ _ => (1 : ℂ)
lean/Cmrps/Vol02StructuralFamilies.lean:481:private def v : Fin 2 → ℂ := fun i => if i = 0 then 1 else -1
lean/Cmrps/Vol02StructuralFamilies.lean:483:private def P : M := Matrix.diagonal v
lean/Cmrps/Vol02StructuralFamilies.lean:485:private theorem v_apply_zero : v 0 = 1 := by simp [v]
lean/Cmrps/Vol02StructuralFamilies.lean:487:private theorem v_apply_one : v 1 = -1 := by simp [v]
lean/Cmrps/Vol02StructuralFamilies.lean:489:private theorem v_mul_star (i : Fin 2) : v i * star (v i) = 1 := by
lean/Cmrps/Vol02StructuralFamilies.lean:492:private theorem P_unitary : IsUnitary P := by
lean/Cmrps/Vol02StructuralFamilies.lean:509:private theorem one_unitary : IsUnitary (1 : M) := by
lean/Cmrps/Vol02StructuralFamilies.lean:516:private theorem phi_one : φ 1 = fun Y => Y := by
lean/Cmrps/Vol02StructuralFamilies.lean:521:private theorem phi_P_X_apply : (φ P X) 0 1 = -1 := by
lean/Cmrps/Vol02StructuralFamilies.lean:536:private theorem phi_one_X_apply : (φ 1 X) 0 1 = 1 := by
lean/Cmrps/Vol02StructuralFamilies.lean:542:theorem kraus_rank_not_injective :
lean/Cmrps/Vol02StructuralFamilies.lean:553:end Kraus
lean/Cmrps/Vol02StructuralFamilies.lean:566:def retraction (t : ℝ) (p : Q × V) : Q × V := (p.1, t • p.2)
lean/Cmrps/Vol02StructuralFamilies.lean:570:theorem retraction_one (p : Q × V) : retraction (1 : ℝ) p = p := by
lean/Cmrps/Vol02StructuralFamilies.lean:574:theorem retraction_comp (s t : ℝ) (p : Q × V) :
lean/Cmrps/Vol02StructuralFamilies.lean:579:theorem retraction_fixes_zero_section (t : ℝ) (x : Q) :
lean/Cmrps/Vol02StructuralFamilies.lean:584:theorem retraction_zero_eq (p : Q × V) : retraction (0 : ℝ) p = (p.1, (0 : V)) := by
lean/Cmrps/Vol02StructuralFamilies.lean:587:theorem retraction_zero_mem_zeroSection (p : Q × V) :
lean/Cmrps/Vol02StructuralFamilies.lean:592:theorem continuous_retraction (t : ℝ) : Continuous (retraction (t : ℝ) (Q := Q) (V := V)) := by
lean/Cmrps/Vol02StructuralFamilies.lean:597:theorem continuous_retraction₂ :
lean/Cmrps/Vol02StructuralFamilies.lean:607:theorem cotangent_retract :
lean/Cmrps/Vol02StructuralFamilies.lean:618:end Cotangent
lean/Cmrps/Vol02StructuralFamilies.lean:628:def ClosedUnder (K : Set (α → α → α)) (C : Set α) : Prop :=
lean/Cmrps/Vol02StructuralFamilies.lean:632:def closure (K : Set (α → α → α)) (E : Set α) : Set α :=
lean/Cmrps/Vol02StructuralFamilies.lean:635:theorem mem_closure {K : Set (α → α → α)} {E : Set α} {x : α} :
lean/Cmrps/Vol02StructuralFamilies.lean:639:theorem subset_closure (K : Set (α → α → α)) (E : Set α) : E ⊆ closure K E :=
lean/Cmrps/Vol02StructuralFamilies.lean:642:theorem closedUnder_closure (K : Set (α → α → α)) (E : Set α) :
lean/Cmrps/Vol02StructuralFamilies.lean:647:theorem closure_minimal (K : Set (α → α → α)) {E C : Set α}
lean/Cmrps/Vol02StructuralFamilies.lean:653:def Irreducible (op : α → α → α) (a : α) : Prop :=
lean/Cmrps/Vol02StructuralFamilies.lean:660:theorem exceptional_not_closed (op : α → α → α) (K : Set (α → α → α)) (hop : op ∈ K)
lean/Cmrps/Vol02StructuralFamilies.lean:680:theorem closure_generation (K : Set (α → α → α)) (E : Set α) :
lean/Cmrps/Vol02StructuralFamilies.lean:685:end Closure
lean/Cmrps/Vol02StructuralFamilies.lean:690:structure StructuralFamily where
lean/Cmrps/Vol02StructuralFamilies.lean:699:def SpecialCase (F G : StructuralFamily) : Prop := Nonempty (F.Obj ↪ G.Obj)
lean/Cmrps/Vol02StructuralFamilies.lean:704:structure-preserving equivalence or anti-equivalence. -/
lean/Cmrps/Vol02StructuralFamilies.lean:705:def Reconstructable (F G : StructuralFamily) : Prop := Nonempty (F.Obj ≃ G.Obj)
lean/Cmrps/Vol02StructuralFamilies.lean:713:def Independent (F G : StructuralFamily) : Prop :=
lean/Cmrps/Vol02StructuralFamilies.lean:719:def HasClassifyingInvariant (F : StructuralFamily.{u}) : Prop :=
lean/Cmrps/Vol02StructuralFamilies.lean:725:theorem not_independent_of_reconstructable (F G : StructuralFamily)
lean/Cmrps/Vol02StructuralFamilies.lean:732:theorem invariants_not_independence :
lean/Cmrps/Vol02StructuralFamilies.lean:746:def subtypeEquivOfEq {γ : Type*} {s t : Set γ} (h : s = t) : ↥s ≃ ↥t :=
lean/Cmrps/Vol02StructuralFamilies.lean:752:theorem comparability_of_records {Obj : Type u} {r : Obj → Obj → Prop} (hr : Equivalence r)
lean/Cmrps/Vol02StructuralFamilies.lean:803:end Comparability
lean/Cmrps/Vol02StructuralFamilies.lean:805:end Cmrps.Vol02

exec
/usr/local/bin/zsh -lc "rg -n 'map_list_sum|sum_map.*product|sum_product.*map|sum_le_sum|single.*smul|smul.*single' lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/List* lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Ring/List* lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Ring/Multiset* lean/.lake/packages/mathlib/Mathlib/Data/Matrix/Basis*; sed -n '290,370p' papers/latex/vol-10-observational-equivalence.tex; sed -n '348,416p' lean/Cmrps/Vol01Foundations.lean; sed -n '365,417p' lean/Cmrps/Vol02StructuralFamilies.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
lean/.lake/packages/mathlib/Mathlib/Data/Matrix/Basis.lean:73:theorem smul_single [SMulZeroClass R α] (r : R) (i : m) (j : n) (a : α) :
lean/.lake/packages/mathlib/Mathlib/Data/Matrix/Basis.lean:220:  map_smul' _ _ := smul_single _ _ _ _ |>.symm
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/List/Lemmas.lean:99:      · refine _root_.trans (sum_map_eq_nsmul_single a _ fun _ h _ => by simp [h.symm]) ?_
\end{proposition}

\begin{proof}
Under the stated hypothesis the record of a composite is a product of records, and a product of isomorphisms is an isomorphism, so indistinguishability of the factors is preserved. For the failure direction, take $\Omega = \{1,2,3,4\}$ with distributions $p = (\tfrac{1}{2}, \tfrac{1}{4}, \tfrac{1}{8}, \tfrac{1}{8})$ and $q = (\tfrac{1}{4}, \tfrac{1}{2}, \tfrac{1}{8}, \tfrac{1}{8})$. Let the factor observation be the single experiment with outcome blocks $\{\{1,2\}, \{3,4\}\}$, under which $p \approx q$ (both push forward to $(\tfrac{3}{4}, \tfrac{1}{4})$). On the composite state space $\Omega \times \Omega$ the factor-marginal records of $p \times p$ and $p \times q$ coincide, yet the joint event $\omega_1 = \omega_2$ reports $\sum_i p_i^2 = \tfrac{11}{32}$ under $p \times p$ and $\sum_i p_i q_i = \tfrac{9}{32}$ under $p \times q$. The joint experiment separates two composites whose factor relations identify the factors.
\end{proof}

Which of the two regimes holds is a property of the interaction data, not of the observation formalism. If the accessible experiments of an interacting composite are the products of the accessible experiments of the factors, composition is safe by \Cref{prop:composed}. If the composition rules $\mathcal{C}$ of the object schema contribute experiments that neither factor admits alone, the implication has no reason to survive.

\section{Information-geometric distinguishability}
\label{sec:metrics}

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

The parametric freedom becomes visible on non-commuting data. Two self-reciprocal representatives suffice to see it: $f(x) = \tfrac{2x}{1+x}$ and $h(x) = \tfrac{1+x}{2}$, both operator monotone with value $1$ at $1$ and both satisfying $f(x) = x f(x^{-1})$.

\begin{example}[Two monotone metrics disagree]
\label{ex:monotone}
Let $\rho = \mathrm{diag}(3/4, 1/4)$ and $A = \sigma_x = \left(\begin{smallmatrix} 0 & 1 \\ 1 & 0 \end{smallmatrix}\right)$. Then
\[
g_f^{\rho}(A, A) = \frac{1}{\tfrac{1}{4} \cdot \tfrac{3}{2}} + \frac{1}{\tfrac{3}{4} \cdot \tfrac{1}{2}} = \frac{16}{3},
\qquad
g_h^{\rho}(A, A) = \frac{2}{\tfrac{3}{4} + \tfrac{1}{4}} + \frac{2}{\tfrac{1}{4} + \tfrac{3}{4}} = 4.
\]
The two admissible monotone metrics give different quadratic forms at the same state and the same direction, by the factor $4/3$.
\end{example}

\begin{corollary}[Metric-level distinguishability is not canonical]
\label{cor:noncanonical}
Any criterion that reads quantum distinguishability from a monotone metric must name the function $f$. Different admissible choices give different quadratic forms at the same states and directions, so the numerical scale of ``the monotone-metric distance'' is not a function of the states alone.
\end{corollary}

\begin{proof}
\Cref{ex:monotone} exhibits a single state and a single direction on which two admissible monotone metrics disagree, and \Cref{thm:petzsudar} guarantees the family contains many more. A criterion built on an unnamed member of the family is therefore not a function of the systems alone.
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

exec
/usr/local/bin/zsh -lc "rg -n 'map_sum|map_prod|sum_product|prod_product' lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/List/Defs.lean lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Ring/Multiset.lean lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Ring/List.lean; rg -n 'count_cons|def count|perm_iff_count|count_eq' lean/.lake/packages/mathlib/Mathlib/Data/List/Count.lean lean/.lake/packages/mathlib/Mathlib/Data/List/Perm/Basic.lean; rg -n 'sum.*single|single.*sum' lean/.lake/packages/mathlib/Mathlib/Data/Matrix/Basis.lean; rg -n 'sorry|axiom|admit|native_decide|implemented_by|extern|set_option' lean/Cmrps.lean lean/Cmrps/*.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Ring/Multiset.lean:67:lemma prod_map_sum {s : Multiset (Multiset R)} :
lean/.lake/packages/mathlib/Mathlib/Data/List/Count.lean:49:    simp only [diff_cons, count_diff, count_erase, beq_iff_eq, Nat.sub_right_comm, count_cons,
lean/.lake/packages/mathlib/Mathlib/Data/List/Perm/Basic.lean:172:lemma count_eq_count_filter_add [DecidableEq α] (P : α → Prop) [DecidablePred P]
lean/.lake/packages/mathlib/Mathlib/Data/List/Perm/Basic.lean:217:  rw [perm_iff_count, ← Decidable.and_forall_ne a, ← Decidable.and_forall_ne b]
lean/.lake/packages/mathlib/Mathlib/Data/List/Perm/Basic.lean:219:    simp +contextual [count_replicate, h, this, count_eq_zero, Ne.symm]
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
lean/Cmrps/Vol11CompletenessObstructions.lean:22:embeddings, or the external literature inputs (McDuff, Adyan-Rabin,
lean/Cmrps/Vol11CompletenessObstructions.lean:25:file uses `sorry` or an axiom.
lean/Cmrps/Vol11CompletenessObstructions.lean:255:which no infinite family reaches and which admits no finite listing cannot be
lean/Cmrps/Vol11CompletenessObstructions.lean:258:model geometries (eighteen plus one countably infinite family) — are external
lean/Cmrps/Vol11CompletenessObstructions.lean:277:are external literature results. -/
lean/Cmrps/Vol11CompletenessObstructions.lean:298:distinct systems. The existence of the witness pair is external
lean/Cmrps/Vol01Foundations.lean:217:in force, and fails on the admitted record `X = Fin 2`, `O = {δ₀, δ₁}` of point
lean/Cmrps/Vol12PrincipiaPhysica.lean:12:external literature (Chentsov, Petz–Sudar, McDuff, Adyan–Rabin, Etingof–Gelaki, …) are
lean/Cmrps/Vol12PrincipiaPhysica.lean:14:hypotheses. Nothing in this file uses `sorry` or new axioms.
lean/Cmrps/Vol12PrincipiaPhysica.lean:188:/-- A registered obstruction theorem: a named external result forbidding an objective. -/
lean/Cmrps/Vol12PrincipiaPhysica.lean:250:/-- Target 6, gap clause: a parameterized family with more than one element admits no
lean/Cmrps/Vol10ObservationalEquivalence.lean:12:external literature (Etingof–Gelaki, Chentsov, Petz–Sudar) are formalized as their honest
lean/Cmrps/Vol10ObservationalEquivalence.lean:14:statement definitions left unproved. Nothing in this file uses `sorry` or new axioms.
lean/Cmrps/Vol10ObservationalEquivalence.lean:320:monotonicity predicate is external to this skeleton and is left as a parameter. -/
lean/Cmrps/Vol10ObservationalEquivalence.lean:351:(predicate on parameter functions) because operator monotonicity is external to this
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:28:All statements below are fully proved; nothing uses `sorry`, `axiom`, or `native_decide`.
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:74:unless nullary tensor products are admitted (the paper's convention). -/
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:203:/-- Worked example (paper `ex:superselection`), witness form: `M_2 ⊕ M_2` admits no
lean/Cmrps/Vol03IrreducibilityDecomposition.lean:238:/-- Paper Table 4.1 row 3: column sums `(1, 2)` admit `2 × 3 = 6` multiplicity matrices.
lean/Cmrps/Vol02StructuralFamilies.lean:716:/-- Paper Proposition 16.2: a family admits a classifying invariant when some map on
lean/Cmrps/Vol02StructuralFamilies.lean:729:/-- Paper Proposition 16.2: two families may each admit a classifying invariant and

exec
/usr/local/bin/zsh -lc "python3 -c 'import re; from pathlib import Path
for k in [1,2,3,4,5,6]:
 p=next(Path(\"papers/latex\").glob(f\"vol-{k:02}-*.tex\")); s=p.read_text(); print(\"\\nFILE\",p)
 for m in re.finditer(r\"\\\\begin\\{(theorem|proposition|lemma|corollary)\\}.*?\\\\end\\{\\1\\}\",s,re.S): print(s[:m.start()].count(\"\\n\")+1,m.group()[:2000])'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 38ms:

FILE papers/latex/vol-01-foundations.tex
240 \begin{proposition}[Composition is not typed]
\label{prop:composition-not-typed}
There are records $P_1, P_2, P_3$ and morphisms $e \colon P_1 \to P_2$ of embedding kind and $g \colon P_2 \to P_3$ of coarse-graining kind whose composite satisfies none of the five preservation laws of Definition~\ref{def:concrete-laws}.
\end{proposition}
249 \begin{corollary}[Schema, not category]
\label{cor:schema-not-category}
The morphism schema of Definition~\ref{def:preservation-law} is not a category. Turning it into one requires one of three decisions: enlarge the kind vocabulary so that composites are retyped, restrict admissible morphisms to those whose composites stay inside the list, or replace the single collection by a multi-category whose composition is typed in each slot. Whether one category suffices is the question these three decisions address.
\end{corollary}
258 \begin{proposition}[Self-composition within a kind]
\label{prop:self-composition}
Coarse-grainings compose to coarse-grainings, embeddings compose to embeddings, and equivalence morphisms compose to equivalence morphisms, under the laws of Definition~\ref{def:concrete-laws}.
\end{proposition}
363 \begin{proposition}[Admissible morphisms form a category]
\label{prop:schema-category}
Fix a morphism kind whose preservation law contains the identities and is closed under self-composition, and take the admissible morphisms to be those of the chosen kind. Then the admissible records of Definition~\ref{def:phys-adm} together with these morphisms form a category. For the laws of Definition~\ref{def:concrete-laws} the coarse-graining kind, the embedding kind, and the equivalence kind qualify, by Proposition~\ref{prop:self-composition}.
\end{proposition}
372 \begin{proposition}[Conditionality over admissible systems]
\label{prop:conditional}
Every statement quantified over $\mathrm{Phys}_{\mathrm{adm}}$ is stated relative to the chosen admissibility conditions and preservation laws. Removing a condition enlarges the class and can falsify statements that hold for the smaller class.
\end{proposition}
423 \begin{proposition}[Factorization is extra data]
\label{prop:factorization-nonunique}
For any four-dimensional complex Hilbert space $H$ there exist two factorizations $H \cong \mathbb{C}^2 \otimes \mathbb{C}^2$ and a unit vector $\psi \in H$ whose entanglement entropy is $0$ in one factorization and $\log 2$ in the other. The bare record $(H, B(H), \mathrm{id}_H, U(H))$ does not determine the decomposition of $H$ into factors.
\end{proposition}
441 \begin{theorem}[Finite classical classification]
\label{thm:finite-state-classification}
Let $P$ and $Q$ be records of $\mathrm{Phys}_{\mathrm{fin}}$ with state spaces of cardinality $m$ and $n$, with composition rule the disjoint union, and with mathematical equivalence as the declared equivalence relation. Then:
\begin{enumerate}
\item $P$ is irreducible if and only if $m = 1$;
\item $P$ decomposes as a disjoint union of $m$ one-point records, and this decomposition is unique up to order and isomorphism of factors;
\item $P \cong Q$ if and only if $m = n$;
\item the cardinality $|X|$ is a complete invariant, and the quotient $\mathrm{Ob}(\mathrm{Phys}_{\mathrm{fin}})/\cong$ is in bijection with the nonnegative integers, the empty record corresponding to zero.
\end{enumerate}
\end{theorem}
458 \begin{theorem}[Finite dynamical decomposition]
\label{thm:dynamical-decomposition}
Let $P$ be a record of $\mathrm{Phys}_{\mathrm{dyn}}$ with state space $X$ and dynamics $f \colon X \to X$, and call two states adjacent when one is the image of the other under $f$. Then:
\begin{enumerate}
\item $P$ is irreducible if and only if the functional graph of $f$ is weakly connected;
\item $P$ decomposes as the disjoint union of the records on its connected components, and this decomposition is unique up to order and isomorphism of factors;
\item $P \cong Q$ if and only if the multisets of connected-component isomorphism classes of $P$ and $Q$ agree.
\end{enumerate}
\end{theorem}
480 \begin{theorem}[Generation in the restricted classes]
\label{thm:generation}
Let $P$ be a record of one of the two restricted classes.
\begin{enumerate}
\item If $P$ is in $\mathrm{Phys}_{\mathrm{fin}}$, then $P$ is a disjoint union of one-point records, and under the product rule $P$ is a product of prime-cardinality records.
\item If $P$ is in $\mathrm{Phys}_{\mathrm{dyn}}$, then $P$ is a disjoint union of records on weakly connected functional graphs.
\item In both cases the generation is effective: the irreducible factors are computed from the state space and the dynamics by finite enumeration.
\end{enumerate}
\end{theorem}
498 \begin{theorem}[Finite symmetric classification]
\label{thm:symmetric-classification}
Fix a finite group $G$, and let $\mathrm{Phys}^{G}_{\mathrm{fin}}$ be the records of $\mathrm{Phys}_{\mathrm{fin}}$ with $\mathcal{S} = G$ acting on $X$ by permutations, with $\mathcal{O} = \mathbb{R}^{X}$ carrying the induced action, and with $\mathcal{C}$ the disjoint union of $G$-sets. Then:
\begin{enumerate}
\item $P$ is irreducible if and only if the action of $G$ on $X$ is transitive;
\item $P$ decomposes as the disjoint union of its orbit records, and this decomposition is unique up to order and isomorphism of factors;
\item $P \cong Q$ if and only if for every conjugacy class of subgroups of $G$ the number of orbits with stabilizer in that class agrees;
\item the resulting orbit-counting function is a complete invariant with finite range.
\end{enumerate}
\end{theorem}

FILE papers/latex/vol-02-structural-families.tex
103 \begin{proposition}[Component invariants are not classifying in general]
\label{prop:components}
Let $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ be a record and let each of the five components carry its own invariant data. Then the tuple of the five component invariants need not be a classifying invariant for $P$.
\end{proposition}
136 \begin{theorem}[Sharpness criterion]
\label{thm:sharpness}
Let $(\mathfrak{F}, V, I)$ be an invariant-complete family record and write $\mathfrak{F}/\!\simeq$ for the set of $\simeq$-classes.
\begin{enumerate}
\item The assignment $[P] \mapsto I(P)$ is a well-defined injection $\mathfrak{F}/\!\simeq \hookrightarrow V$.
\item If $V$ is finite with $|V| = N$, then $|\mathfrak{F}/\!\simeq| \leq N$.
\item Suppose in addition that $V$ carries the structure of a variety over an algebraically closed field $k$, that $W$ is a $k$-variety, and that $f \colon W \to V$ is a morphism of finite type whose image $f(W(k))$ contains every attained value of $I$. Then the attained values of $I$ form a constructible subset of $V$, and $\mathfrak{F}/\!\simeq$ injects into it. The content of the claim is the constructibility, which is a parameterization statement; the injectivity is part (1) and is not what this part adds.
\item If $\mathfrak{F}/\!\simeq$ is uncountable, then no invariant-complete record for $\mathfrak{F}$ has countable range.
\end{enumerate}
\end{theorem}
151 \begin{corollary}[Parameterization is a stronger achievement]
\label{cor:parameterization}
A family with a finite invariant range is classified into finitely many classes, and a family is parameterized only when its attained values form a constructible or otherwise explicitly described subset of a structured range. Classification and parameterization are separate achievements.
\end{corollary}
163 \begin{proposition}[Globality of classification in the symplectic family]
\label{prop:globality}
Let $(M, \omega)$ and $(N, \eta)$ be symplectic manifolds of the same dimension $2n$ with $n \geq 1$. Let $f$ assign a value to every symplectic germ and be invariant under symplectomorphism of germs. Then $f$ takes the same value at every point of $M$ and at every point of $N$. Consequently no invariant defined on germs and constant on each connected component is classifying for the symplectic family at fixed dimension $2n$, and every classifying invariant for that family is global.
\end{proposition}
172 \begin{corollary}
\label{cor:topological}
Classifying data for the symplectic family is topological or global in character. This reverses the Riemannian situation, in which local curvature invariants do classifying work.
\end{corollary}
189 \begin{proposition}[The kinds are exhaustive]
\label{prop:kinds}
For any sector $\mathcal{S}$ exactly one of the five achievement kinds of \Cref{def:kinds} applies, and the five are pairwise exclusive and exhaustive.
\end{proposition}
232 \begin{proposition}[Global invariants of a cotangent bundle]
\label{prop:cotangent}
The zero section of $T^*Q$ is a deformation retract of $T^*Q$. Consequently the homotopy type of the symplectic manifold $T^*Q$ equals the homotopy type of $Q$, and every homotopy invariant of $Q$ is a global invariant of the symplectic record.
\end{proposition}
262 \begin{proposition}[Induced operations on the dimension vector]
\label{prop:induced}
Let $A$ and $B$ be unital finite-dimensional complex $C^*$-algebras with dimension vectors $\{n_1, \dots, n_k\}$ and $\{m_1, \dots, m_l\}$. Then the dimension vector of $A \oplus B$ is the multiset union $\{n_1, \dots, n_k, m_1, \dots, m_l\}$, and the dimension vector of $A \otimes B$ is the multiset $\{n_i m_j \colon 1 \leq i \leq k,\ 1 \leq j \leq l\}$. Consequently the range of the classifying invariant of \Cref{thm:calg} is closed under these two operations, and the invariant record of a composite system is computed from the records of the summands.
\end{proposition}
278 \begin{proposition}[Invariance under equivalence only]
\label{prop:invariance}
Let $(\mathfrak{F}, V, I)$ be a family record and let $f \colon P \to Q$ be an invertible morphism representing exact equivalence. Then $I(P) = I(Q)$. The conclusion fails for coarse-grainings and for embeddings in general.
\end{proposition}
302 \begin{proposition}[Recognition cost]
\label{prop:recognition-cost}
Let $(\mathfrak{F}, V, I)$ be an invariant-complete family record with $V$ a set carrying decidable equality, and assume $I(P)$ is computable from a finite presentation of $P$. Recognition of the class of $P \in \mathfrak{F}$ reduces to computing $I(P)$ and comparing it with the recorded values, and it costs at most one invariant computation plus one comparison per candidate class. If in addition the list of attained values is finite and stored, recognition is an algorithm.
\end{proposition}
320 \begin{theorem}[Poisson local models]
\label{thm:weinstein}
Near a point of rank $2k$ a Poisson manifold is locally isomorphic to a product of a symplectic manifold of dimension $2k$ and a Poisson manifold whose linearization vanishes at the point \cite{weinstein}. The symplectic leaves form a foliation, and two Poisson manifolds with isomorphic local models need not be globally isomorphic.
\end{theorem}
336 \begin{theorem}[Structure of finite-dimensional unital complex $C^*$-algebras]
\label{thm:calg}
Let $A$ be a unital finite-dimensional complex $C^*$-algebra. Then $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ for a unique multiset $\{n_1, \dots, n_k\}$ of positive integers, and that multiset determines $A$ up to $*$-isomorphism. The invariant range of the sector of all such algebras is the countable set of finite multisets of positive integers. At fixed total complex dimension $d = \sum_i n_i^2$ the attained values are finite in number, and \Cref{thm:sharpness} bounds the number of classes at that dimension accordingly.
\end{theorem}
365 \begin{proposition}[Recognition without classification]
\label{prop:recognition}
There exist four-manifolds for which homeomorphism is undecidable. Consequently no algorithm whose output is a classifying invariant in a decidable range can classify all four-manifolds, and any classification statement in this regime must restrict the class of manifolds under consideration.
\end{proposition}
381 \begin{theorem}[Classification of principal bundles]
\label{thm:bundles}
Let $X$ be a paracompact Hausdorff space and $G$ a topological group. The isomorphism classes of principal $G$-bundles over $X$ are in bijection with the homotopy classes of maps $X \to BG$, where $BG$ is a classifying space for $G$. Characteristic classes of these bundles are exactly the pullbacks of universal classes in $H^*(BG)$, including Stiefel-Whitney, Pontryagin, Euler, and Chern classes. The Dixmier-Douady class is the corresponding invariant for $U(1)$-bundle gerbes, which lie in $H^3(X; \mathbb{Z})$, and it classifies those rather than ordinary principal bundles.
\end{theorem}
397 \begin{theorem}[Chentsov]
\label{thm:chentsov}
On the classical statistical state space of a finite sample space, the Fisher metric is the unique Riemannian metric, up to a positive constant factor, that is monotone under stochastic maps. The uniqueness is recorded in the survey literature as the classical anchor of the monotone-metric classification \cite{petz}, and the quantum analogue there is parametric rather than unique.
\end{theorem}
444 \begin{theorem}[Stinespring]
\label{thm:stinespring}
Every completely positive map admits a minimal Stinespring dilation, unique up to unitary equivalence of the dilating space \cite{stinespring-primary}. The associated Kraus form is a normal form, and the number of Kraus operators in a minimal dilation is an invariant of the dilation.
\end{theorem}
451 \begin{proposition}[Kraus rank is not injective on channels]
\label{prop:kraus}
Fix the equivalence relation on channels to be equality of completely positive maps. Let $\Phi_U \colon M_2(\mathbb{C}) \to M_2(\mathbb{C})$ be the channel $\Phi_U(X) = U X U^*$ for $U \in U(2)$. Every $\Phi_U$ has Kraus rank one, and the set of distinct channels of this form is in bijection with $PU(2)$, which is not a point. The assignment from channels to Kraus rank is therefore not injective under equality of maps, and Kraus rank is not a classifying invariant for this family under that relation.
\end{proposition}
471 \begin{theorem}[Structure preservation is load-bearing]
\label{thm:etingof-gelaki}
There exist finite groups that are not isomorphic and whose representation categories are equivalent as plain tensor categories. Consequently an equivalence that forgets the symmetric structure cannot recover the group, and any classification in this family must state which layer of structure its equivalence preserves \cite{etingof}.
\end{theorem}
485 \begin{corollary}
\label{cor:wild}
By \Cref{thm:sharpness}, a sector whose classes admit no parameterization by a finite-dimensional variety admits no invariant-complete record whose range is a finite-dimensional variety. The obstruction is a statement about the range of any candidate invariant.
\end{corollary}
534 \begin{proposition}[Irreducible classes do not close]
\label{prop:closure}
Let $\mathcal{K}$ contain direct sum and let $\mathcal{E}$ be a nonempty class of nonzero objects each irreducible under direct sum. Then $\mathcal{E}$ is not closed under direct sum and $\langle \mathcal{E} \rangle_{\mathcal{K}}$ strictly contains $\mathcal{E}$. The conclusion is one of non-closure and not of non-generation: $\mathcal{E}$ generates $\langle \mathcal{E} \rangle_{\mathcal{K}}$ by definition of closure, so a generating class may consist of irreducibles alone.
\end{proposition}
574 \begin{proposition}[Invariants do not imply independence]
\label{prop:independence}
Let $\mathfrak{F}$ and $\mathfrak{G}$ be two structural families each admitting a classifying invariant. Then $\mathfrak{F}$ and $\mathfrak{G}$ need not be logically independent. In particular the commutative unital $C^*$-algebras inside the operator-algebra family and the compact Hausdorff spaces inside the geometric family each carry a classifying invariant, and neither is independent of the other.
\end{proposition}
590 \begin{proposition}[Mixed records are not defects]
\label{prop:mixed}
There exist records whose state space is a symplectic manifold, whose observable algebra is a noncommutative $C^*$-algebra, and whose symmetry group is a Lie group. Such a record lies in the symplectic, operator-algebraic, and geometric families at once. Consequently the assignment of records to families is not a partition, and no argument may treat the ten families as mutually exclusive classes.
\end{proposition}
610 \begin{proposition}[Comparability of records]
\label{prop:comparable}
Two classification records are comparable when they agree on family, sector, and equivalence. If they agree on those three fields and both name classifying invariants, then the two invariants are related by a bijection between their attained values on that sector.
\end{proposition}

FILE papers/latex/vol-03-irreducibility-decomposition.tex
133 \begin{lemma}[No nilpotent radical]
\label{lem:radical}
Let $A$ be a finite-dimensional C*-algebra over $\mathbb{C}$. The Jacobson radical $J(A)$ is zero.
\end{lemma}
142 \begin{lemma}[Simple blocks are matrix algebras]
\label{lem:simple-blocks}
Let $B$ be a finite-dimensional simple C*-algebra over $\mathbb{C}$. Then $B \cong M_n(\mathbb{C})$ for some $n \geq 1$.
\end{lemma}
151 \begin{theorem}[Block decomposition]
\label{thm:block-decomposition}
Let $A$ be a unital finite-dimensional complex C*-algebra of dimension $d$. Then there exist $k \geq 1$ and integers $n_1, \dots, n_k \geq 1$ with $\sum_{i=1}^{k} n_i^2 = d$ and a *-isomorphism
\[
A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C}).
\]
The multiset $\mathbf{n}(A) = \{n_1, \dots, n_k\}$ is unique up to permutation, and $k = \dim_{\mathbb{C}} Z(A)$.
\end{theorem}
166 \begin{corollary}[Classification of the class]
\label{cor:classification}
Two unital finite-dimensional complex C*-algebras are *-isomorphic if and only if their dimension vectors agree as multisets. The dimension vector is a complete invariant of the class.
\end{corollary}
200 \begin{proposition}[States on a direct sum]
\label{prop:states-direct-sum}
Let $A = A_1 \oplus A_2$ with unital summands $A_1, A_2$ and central block projections $p_1, p_2$. Every state $\omega$ of $A$ has a unique expression
\[
\omega = \lambda \, \omega_1 + (1 - \lambda) \, \omega_2
\]
where $\lambda = \omega(p_1) \in [0,1]$, where $\omega_i$ is the restriction of $\omega$ to $A_i$ normalized to a state of $A_i$ when $\omega(p_i) > 0$, and the term is omitted when its weight is zero. Consequently $S(A)$ is the convex join of $S(A_1)$ and $S(A_2)$.
\end{proposition}
236 \begin{theorem}[Classification of unital *-homomorphisms]
\label{thm:homs}
Let $A$ and $B$ be unital finite-dimensional complex C*-algebras with fixed block presentations as above. Unital *-homomorphisms $\varphi \colon A \to B$, up to unitary conjugacy in $B$, correspond bijectively to multiplicity matrices $R$ from $A$ to $B$. The correspondence sends $\varphi$ to the rank matrix $k^{(i)}_j = \operatorname{rank}(\varphi(p_i) q_j)$, where $p_i$ is the $i$-th block projection of $A$ and $q_j$ the $j$-th block projection of $B$. Two unital *-homomorphisms are unitarily conjugate in $B$ if and only if their multiplicity matrices agree.
\end{theorem}
251 \begin{corollary}[Outer automorphisms]
\label{cor:outer-aut}
Let $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$. Automorphisms of $A$, modulo inner automorphisms, are classified by permutations of the blocks with equal dimension vector entries. Concretely, $\mathrm{Aut}(A)/\mathrm{Inn}(A)$ is isomorphic to the group of permutations $\sigma$ of $\{1, \dots, k\}$ with $n_{\sigma(i)} = n_i$ for all $i$.
\end{corollary}
287 \begin{proposition}[Module factorization]
\label{prop:module-factorization}
Let $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ and let $M$ be a finite-dimensional left $A$-module. Then $M = \bigoplus_{i=1}^{k} p_i M$ uniquely as $A$-modules, each summand $p_i M$ is a module over the simple block $M_{n_i}(\mathbb{C})$, and $p_i M \cong (\mathbb{C}^{n_i})^{\oplus r_i}$ for a unique multiplicity $r_i \geq 0$. Two modules are isomorphic if and only if their multiplicity vectors agree.
\end{proposition}
309 \begin{proposition}[Uniqueness in the restricted classes]
\label{prop:unique-restricted}
Uniqueness of decomposition up to permutation of isomorphic factors holds in each of the following restricted classes.
\begin{enumerate}
\item Unital finite-dimensional complex C*-algebras under direct sum: \cref{thm:block-decomposition}.
\item Unital *-homomorphisms of such algebras up to unitary conjugacy: \cref{thm:homs}.
\item Tensor factorizations into prime-dimensional factors: if a finite-dimensional Hilbert space is written as a tensor product of factors of prime dimension, the multiset of factor dimensions is unique up to permutation, by unique prime factorization of the total dimension.
\item Bipartite pure states of a finite-dimensional bipartite system, up to the Schmidt decomposition: the Schmidt coefficients are unique, and the left and right Schmidt subspaces are unique as subspaces.
\end{enumerate}
\end{proposition}
328 \begin{proposition}[Ensemble nonuniqueness]
\label{prop:ensemble}
Every mixed density operator $\rho$, that is, every density operator of rank at least two, admits infinitely many distinct decompositions into pure states. Pure states are the only exceptions: a rank-one projector is an extreme point of the state space and admits no nontrivial decomposition.
\end{proposition}
354 \begin{theorem}[Stinespring]
\label{thm:stinespring}
Let $A$ be a unital C*-algebra, $H$ a Hilbert space, and $\Phi \colon A \to B(H)$ completely positive. Then there exist a Hilbert space $K$, a *-representation $\pi \colon A \to B(K)$, and a bounded operator $V \colon H \to K$ with $\Phi(a) = V^* \pi(a) V$ for all $a \in A$. Among such dilations the minimal one, in which $K = \overline{\pi(A) V H}$, is unique up to a unitary intertwiner.
\end{theorem}
369 \begin{theorem}[Kraus normal form]
\label{thm:kraus}
Every completely positive map $\Phi \colon M_n(\mathbb{C}) \to M_m(\mathbb{C})$ can be written $\Phi(X) = \sum_{s=1}^{r} K_s X K_s^*$ with Kraus operators $K_s \colon \mathbb{C}^n \to \mathbb{C}^m$. The minimal number $r$ of Kraus operators equals the rank of the Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$. Two Kraus families $(K_s)_{s=1}^{r}$ and $(L_t)_{t=1}^{r}$ of minimal size represent the same map if and only if $L_t = \sum_s u_{ts} K_s$ for a unitary $u \in U(r)$.
\end{theorem}
399 \begin{theorem}[Gelfand-Naimark]
\label{thm:gelfand-naimark}
Every C*-algebra admits a faithful isometric *-representation on a Hilbert space~\cite{gelfand-naimark}. In the commutative case, every unital commutative C*-algebra is isometrically *-isomorphic to $C(X)$ for a compact Hausdorff space $X$ given by its character space, and $X$ is recovered from $A$ as the set of multiplicative linear functionals with the weak-* topology.
\end{theorem}
410 \begin{theorem}[Doplicher-Roberts reconstruction]
\label{thm:dr-reconstruction}
Let $\mathcal{C}$ be a symmetric tensor *-category with conjugates, direct sums and subobjects, with $\mathrm{End}(\mathbf{1}) = \mathbb{C}$, satisfying the selection criteria of the DHR analysis of a local net of observable algebras~\cite{dhr}. Then $\mathcal{C}$ is equivalent to the category of finite-dimensional unitary representations of a compact supergroup $G$, and $G$ is unique up to isomorphism~\cite{dr-duality,dr-endomorphisms}.
\end{theorem}
428 \begin{proposition}[Construction arithmetic]
\label{prop:construction-arithmetic}
Let $A$ and $B$ be unital finite-dimensional complex C*-algebras with dimension vectors $\mathbf{n}(A)$ and $\mathbf{n}(B)$. Then:
\begin{enumerate}
\item $\mathbf{n}(A \oplus B) = \mathbf{n}(A) \uplus \mathbf{n}(B)$, the multiset union.
\item $\mathbf{n}(A \otimes B) = \{ n m : n \in \mathbf{n}(A),\, m \in \mathbf{n}(B) \}$, the pairwise product multiset.
\item $A \oplus B$ is irreducible under direct sum if and only if one summand is zero and the other is simple.
\end{enumerate}
\end{proposition}
442 \begin{corollary}[Closure of a finite set of blocks]
\label{cor:closure}
Let $S = \{M_{n_1}(\mathbb{C}), \dots, M_{n_k}(\mathbb{C})\}$ and let $\mathcal{C} = \{\oplus, \otimes\}$. The closure $\langle S \rangle_{\mathcal{C}}$ is the class of unital finite-dimensional complex C*-algebras whose dimension vector entries lie in the multiplicative semigroup generated by $n_1, \dots, n_k$ in $\mathbb{N}_{\geq 1}$.
\end{corollary}
490 \begin{proposition}[Embeddings and multiplicity matrices]
\label{prop:embeddings}
In the setting of \cref{thm:homs}, a unital *-homomorphism $\varphi \colon A \to B$ is injective if and only if its multiplicity matrix has no zero row. Injective unital *-homomorphisms are the embeddings of the finite-dimensional C*-category.
\end{proposition}
499 \begin{proposition}[Spectra of direct sums]
\label{prop:spectrum-sum}
Let $A$ and $B$ be unital commutative C*-algebras with spectra $X$ and $Y$. Then $A \oplus B \cong C(X \sqcup Y)$ and the spectrum of a direct sum is the disjoint union of the spectra.
\end{proposition}
546 \begin{theorem}[Tame-wild dichotomy]
\label{thm:tame-wild}
Every finite-dimensional algebra over an algebraically closed field is either derived tame or derived wild~\cite{bekkert-drozd}. Derived wildness is preserved under degeneration, and derived tameness is preserved under deformation.
\end{theorem}
551 \begin{theorem}[Wildness of the generic determinant]
\label{thm:wild-generic-det}
The maximal Cohen-Macaulay module theory of the generic determinant is wild~\cite{buchweitz-leuschke}: already in rank two, the isomorphism classes of modules cannot be parametrized by a finite-dimensional variety over the coefficients.
\end{theorem}
558 \begin{corollary}[Boundary on decomposition programs]
\label{cor:boundary}
Any program that decomposes systems into irreducibles and then parametrizes the irreducibles by finite-dimensional data is confined to tame regimes. In wild regimes the decomposition step may still exist while the parameterization step is provably unavailable.
\end{corollary}

FILE papers/latex/vol-04-yoneda-classification.tex
142 \begin{theorem}[Yoneda lemma]
\label{thm:yoneda}
Let $\mathcal{C}$ be a locally small category and let $A \in \mathrm{Ob}(\mathcal{C})$. For every functor $F \colon \mathcal{C}^{\mathrm{op}} \to \mathbf{Set}$ the evaluation map
\[
\mathrm{ev}_A \colon \Nat\big(\Hom_{\mathcal{C}}(-, A), F\big) \longrightarrow F(A),
\qquad
\alpha \longmapsto \alpha_A(\mathrm{id}_A),
\]
is a bijection.
\end{theorem}
159 \begin{corollary}[Full faithfulness]
\label{cor:faithful}
For all objects $A, B$ of a locally small category $\mathcal{C}$ the map
\[
\Hom_{\mathcal{C}}(A, B) \longrightarrow \Nat\big(y(A), y(B)\big),
\qquad
\varphi \longmapsto \big(g \mapsto \varphi \circ g\big),
\]
is a bijection. In particular $y$ is faithful and full, and $y(A) \cong y(B)$ holds if and only if $A \cong B$.
\end{corollary}
176 \begin{proposition}[Probe content of a profile]
\label{prop:probe}
Let $P \in \mathrm{Ob}(\mathcal{C})$ with $\mathcal{C}$ locally small. For each probe $R$ the value $y(P)(R) = \Hom(R, P)$ is the set of admissible relationships from $R$ to $P$, and the action of $y(P)$ along $f \colon R \to R'$ is the composition law of $\mathcal{C}$. Consequently the profile $y(P)$ is determined by, and determines, the system's interaction with every probe in $\mathcal{C}$, and two systems have isomorphic profiles exactly when those interactions coincide up to relabelling by isomorphisms of the probes' targets.
\end{proposition}
185 \begin{corollary}[Relational equivalence is isomorphism]
\label{cor:releq}
For a declared category $\mathcal{C}$ of representations one has $P \sim_{\mathrm{rel}} Q$ if and only if $P$ and $Q$ are mathematically equivalent in the sense of isomorphism in $\mathcal{C}$. Relational equivalence therefore refines or coincides with mathematical equivalence according to the morphisms in force, and it implies physical equivalence only when the declared morphisms have themselves been justified as physical equivalences.
\end{corollary}
208 \begin{proposition}[What restriction loses]
\label{prop:restriction}
Let $\mathcal{R} \subseteq \mathrm{Ob}(\mathcal{C})$ be a probe class. Isomorphic restricted profiles do not imply isomorphic objects in general. If the restricted Yoneda comparison $y_{\mathcal{R}} \colon \mathcal{C} \to [\mathcal{R}^{\mathrm{op}}, \mathbf{Set}]$ is fully faithful, then $\mathcal{R}$-relationally equivalent objects are isomorphic, and the argument of Corollary~\ref{cor:faithful} applies verbatim.
\end{proposition}
224 \begin{proposition}[Profiles respect limits]
\label{prop:limits}
Let $\mathcal{C}$ be a locally small category in which a diagram $D$ has a limit $L = \lim D$. Then $y(L)$ is the limit of the diagram $y \circ D$ in $[\mathcal{C}^{\mathrm{op}}, \mathbf{Set}]$. In particular $y$ preserves terminal objects and binary products: $y(A \times B) \cong y(A) \times y(B)$ canonically whenever the product exists.
\end{proposition}
249 \begin{theorem}[Representability does not imply classifiability]
\label{thm:noimplication}
Let $n \geq 3$, let $S = k[x_{ij}]$ be the polynomial ring over a field $k$ in the entries of a generic $n \times n$ matrix, let $R = S/(\det(x_{ij}))$ be the coordinate ring of the generic determinant hypersurface, and let $\mathcal{C}$ be the category of finitely generated maximal Cohen-Macaulay $R$-modules of rank two, with $R$-module homomorphisms as morphisms. The objects of $\mathcal{C}$ admit no parametrization by a finite-dimensional variety over $k$ in the sense of Definition~\ref{def:classify}, while $y$ is fully faithful on $\mathcal{C}$. Full faithfulness of the Yoneda embedding therefore does not imply the existence of a classification theorem.
\end{theorem}
302 \begin{proposition}[Choi correspondence and composition]
\label{prop:choi}
For fixed $n, m \geq 1$ the assignment $\Phi \mapsto J(\Phi)$ is a linear bijection $L(M_n, M_m) \to M_n \otimes M_m$. It restricts to a bijection between completely positive maps and positive semidefinite Choi matrices, and $\Phi$ is trace preserving if and only if $\Tr_m J(\Phi) = I_n$. If $\Phi \colon M_n \to M_m$ and $\Psi \colon M_m \to M_p$ are linear, then
\begin{equation}
\label{eq:choi-comp}
J(\Psi \circ \Phi)_{(i\alpha),(j\beta)}
\;=\;
\sum_{k,l=1}^{m} J(\Phi)_{(ik),(jl)}\, J(\Psi)_{(k\alpha),(l\beta)},
\end{equation}
where composite indices label rows and columns of $M_n \otimes M_m$ and $M_m \otimes M_p$. Composition of channels is therefore a contraction of Choi indices along the shared system. In the link-product notation of quantum information the same identity appears as $J(\Psi \circ \Phi) = J(\Phi) \ast J(\Psi)$, where the standard convention places a partial transpose on the contracted factor; the component formula displayed here pairs row with row and column with column indices of the shared system, which absorbs that transposition into the index placement.
\end{proposition}
325 \begin{theorem}[Supermap representability]
\label{thm:supermap}
Let $\mathcal{T}$ be a theory of processes whose processes form a symmetric monoidal category under sequential and parallel composition, and suppose $\mathcal{T}$ is equipped with a channel-state duality: a natural identification of each process $\Phi \colon A \to B$ with a state of the composite system $A \otimes B$, preserved by composition. Then the categorical supermaps of $\mathcal{T}$ are concretely representable through that duality: every supermap corresponds to a process of the composite system, and representability yields the factorisation theorems for causally ordered supermaps.
\end{theorem}
355 \begin{theorem}[Gelfand duality]
\label{thm:gelfand}
Let $\mathbf{KHaus}$ be the category of compact Hausdorff spaces with continuous maps, and let $\mathbf{CCStar}$ be the category of unital commutative complex $C^*$-algebras with unital $*$-homomorphisms. The assignment $X \mapsto C(X)$ and $A \mapsto \Sp(A)$ extends to an equivalence of categories $\mathbf{KHaus}^{\mathrm{op}} \simeq \mathbf{CCStar}$, a contravariant equivalence between $\mathbf{KHaus}$ and $\mathbf{CCStar}$; equivalently, every unital commutative $C^*$-algebra is isometrically $*$-isomorphic to $C(X)$ for $X$ its character space. More generally, the Gelfand-Naimark theorem \cite{gn} embeds every $C^*$-algebra in the bounded operators of a Hilbert space, and the commutative case is the fully classified one.
\end{theorem}
364 \begin{theorem}[Stone duality]
\label{thm:stone}
Let $\mathbf{Bool}$ be the category of Boolean algebras with homomorphisms, and let $\mathbf{KHaus}_0$ be the category of zero-dimensional compact Hausdorff spaces with continuous maps. The Stone space construction $B \mapsto \mathrm{St}(B)$ and the algebra of clopen sets $X \mapsto \mathrm{Clop}(X)$ extend to an equivalence of categories $\mathbf{Bool}^{\mathrm{op}} \simeq \mathbf{KHaus}_0$, a contravariant equivalence between $\mathbf{Bool}$ and $\mathbf{KHaus}_0$ \cite{stone}.
\end{theorem}
373 \begin{theorem}[Doplicher-Roberts reconstruction]
\label{thm:dr}
Let $\mathcal{T}$ be a symmetric tensor $C^*$-category with conjugates, direct sums, subobjects, and $\End(\mathbf{1}) \cong \mathbb{C}$. Then $\mathcal{T}$ is equivalent, as a symmetric tensor $*$-category, to the category of finite-dimensional unitary representations of a compact supergroup $G$, and $G$ is unique up to isomorphism \cite{dr}. The hypotheses are not decorative: symmetric structure, conjugates, direct sums, subobjects, and the scalar endomorphism condition are all used.
\end{theorem}
405 \begin{proposition}[Probe reconstruction on the commutative side]
\label{prop:commprobe}
Let $A$ be a unital commutative $C^*$-algebra with character space $X = \Sp(A)$. The Gelfand transform $a \mapsto \hat{a}$ is the map that assembles the probe values of $a$, that is, the numbers $\chi(a)$ for the characters $\chi \in \Hom(A, \mathbb{C})$, and the statement of Theorem~\ref{thm:gelfand} is that these probe values determine $A$ up to isometric $*$-isomorphism. The probe data is thus the relational data of $A$ against the one-dimensional representations, and the reconstruction theorem upgrades the determination to an equivalence of categories.
\end{proposition}
428 \begin{theorem}[Etingof-Gelaki constraint]
\label{thm:eg}
There exist non-isomorphic finite groups $G$ and $H$ whose categories $\mathrm{Rep}(G)$ and $\mathrm{Rep}(H)$ of finite-dimensional complex representations are equivalent as monoidal categories, with the commutativity constraint ignored, while the symmetric structures of the two categories differ. A monoidal equivalence of representation categories therefore does not recover the group; the symmetric monoidal layer is required, and any identification that relies on the monoidal layer alone is provably insufficient.
\end{theorem}
441 \begin{proposition}[Preserved-layer discipline for profiles]
\label{prop:discipline}
Let $\mathcal{C}$ be a category of representations whose morphisms preserve a layer $L$ of structure and forget a layer $L'$. If $P \sim_{\mathrm{rel}} Q$ in $\mathcal{C}$, then $P$ and $Q$ are equivalent at layer $L$, and no claim about layer $L'$ follows. In particular, profiles computed in a category of monoidal equivalences that ignore the commutativity constraint cannot support identifications that require the symmetric layer, and every use of the relational profile must declare the layers its morphisms preserve.
\end{proposition}
450 \begin{corollary}[Constraint inheritance]
\label{cor:inherit}
The Yoneda embedding does not weaken the structure-preserving requirement on equivalences. Every relational identification inherits, through its morphisms, the preserved-layer declaration of the equivalence notion in force; a profile computed for one declaration is not evidence for an identification requiring another.
\end{corollary}
478 \begin{proposition}[Fusion rings of two groups of order eight]
\label{prop:fusion}
Let $D_8$ be the dihedral group of order eight and $Q_8$ the quaternion group. Their character tables and their representation fusion rings are isomorphic, and the groups are not isomorphic. Fusion-ring data therefore does not determine the group.
\end{proposition}

FILE papers/latex/vol-05-classical-systems.tex
144 \begin{lemma}[Linearization at a point]
\label{lem:linearization}
Let $(M^{2n}, \omega)$ be symplectic and let $p \in M$. There are coordinates $(x_1, y_1, \dots, x_n, y_n)$ centered at $p$ in which $\omega_p = \sum_{i=1}^{n} dx_i \wedge dy_i$ at $p$.
\end{lemma}
153 \begin{lemma}[Moser trick on a ball]
\label{lem:moser-ball}
Let $B$ be an open ball centered at $p$ in a chart, and let $\omega_t$, $t \in [0, 1]$, be a smooth family of symplectic forms on $B$ with $\omega_t$ nondegenerate for all $t$. If $\dot{\omega}_t$ is exact for each $t$, then there is a concentric ball $B'$ compactly contained in $B$ carrying an isotopy $\varphi_t$ with $\varphi_t^{*} \omega_t = \omega_0$ for all $t$, and $\varphi_1$ maps $B'$ into $B$.
\end{lemma}
166 \begin{theorem}[Darboux]
\label{thm:darboux}
Let $(M^{2n}, \omega)$ be a symplectic manifold and $p \in M$. There exists a neighborhood $U$ of $p$ and a diffeomorphism $\varphi : U \to V$ onto an open subset $V \subset \mathbb{R}^{2n}$ such that $\varphi^{*} \omega_0 = \omega|_U$ where $\omega_0 = \sum_{i=1}^{n} dx_i \wedge dy_i$. In particular, any two symplectic manifolds of the same dimension are locally symplectomorphic.
\end{theorem}
175 \begin{corollary}[Absence of local invariants]
\label{cor:no-local}
Every local symplectic invariant of a $2n$-dimensional symplectic manifold is constant on connected components. Any classification of symplectic manifolds up to symplectomorphism must be carried by global data.
\end{corollary}
195 \begin{theorem}[Weinstein splitting]
\label{thm:weinstein}
Let $(M, \pi)$ be a Poisson manifold and $p \in M$ a point of rank $2k$. There exist a neighborhood $U$ of $p$ and a Poisson diffeomorphism from $U$ onto a product $U_1 \times U_2$ where $U_1$ is a neighborhood of a point in a symplectic manifold $(N^{2k}, \omega)$ and $U_2$ is a neighborhood of a zero $q_0$ of a Poisson structure $\pi_2$ of rank zero at $q_0$.
\end{theorem}
204 \begin{proposition}[Leaf foliation]
\label{prop:leaves}
A Poisson manifold $(M, \pi)$ is foliated by its symplectic leaves: maximal immersed submanifolds $S \subset M$ on which $\pi|_S$ is nondegenerate and which are tangent to the distribution $\operatorname{im} \pi^{\sharp}$. Each leaf is a symplectic manifold, and the restriction of the Poisson bracket of functions to a leaf is the bracket of the leaf symplectic form.
\end{proposition}
218 \begin{theorem}[Kirillov-Kostant-Souriau form]
\label{thm:kks}
Let $G$ be a Lie group with Lie algebra $\mathfrak{g}$ and let $\mathcal{O} \subset \mathfrak{g}^{*}$ be a coadjoint orbit. The formula
\[
\omega_{\xi}(\operatorname{ad}^{*}_{x} \xi, \operatorname{ad}^{*}_{y} \xi) = \langle \xi, [x, y] \rangle
\]
defines a $G$-invariant symplectic form $\omega_{\xi}$ on $\mathcal{O}$, and the coadjoint action of $G$ on $(\mathcal{O}, \omega_{\xi})$ is by symplectomorphisms. The Poisson structure induced on $\mathfrak{g}^{*}$ by the Lie bracket restricts on each orbit to the inverse of $\omega_{\xi}$.
\end{theorem}
231 \begin{proposition}[Casimir functions]
\label{prop:casimirs}
A smooth function $F \in C^{\infty}(M)$ on a Poisson manifold $(M, \pi)$ is constant on the symplectic leaves if and only if $\{F, f\} = 0$ for all $f \in C^{\infty}(M)$. On the Lie-Poisson space $\mathfrak{g}^{*}$ these functions are exactly the coadjoint-invariant functions $F(\xi) = F(\operatorname{Ad}^{*}_{g} \xi)$ for all $g \in G$. For $\mathfrak{g} = \mathfrak{so}(3)$ the Casimir is $F(\xi) = |\xi|^{2}$, and its level sets are the symplectic leaves of \cref{ex:lie-poisson}.
\end{proposition}
248 \begin{theorem}[Moser stability]
\label{thm:moser-stability}
Let $M$ be a closed manifold and $\omega_t$, $t \in [0, 1]$, a smooth family of symplectic forms with $[\omega_t] \in H^{2}(M; \mathbb{R})$ independent of $t$. Then there is an isotopy $\varphi_t$ of $M$ with $\varphi_t^{*} \omega_t = \omega_0$ for all $t$.
\end{theorem}
257 \begin{corollary}[Classification refines diffeomorphism and cohomology]
\label{cor:classification-data}
Let $f : M \to M'$ be a diffeomorphism of closed symplectic manifolds carrying $[\omega]$ to $[\omega']$. If there is a smooth path of symplectic forms $\omega_t$ in the constant class $[\omega]$ connecting $\omega$ to $f^{*} \omega'$, then $(M, \omega)$ and $(M', \omega')$ are symplectomorphic. Symplectomorphism classes therefore form a strictly finer partition than the pairs consisting of a diffeomorphism type and an orbit of $[\omega]$ under the diffeomorphism group.
\end{corollary}
290 \begin{proposition}[Gromov width]
\label{prop:gromov-width}
The Gromov width
\[
w_G(M, \omega) = \sup \{ \pi r^{2} : B^{2n}(r) \text{ embeds symplectically into } (M, \omega) \}
\]
is a symplectic capacity in the sense of \cref{def:capacity}.
\end{proposition}
305 \begin{theorem}[Gromov nonsqueezing]
\label{thm:nonsqueezing}
Let $B^{2n}(r)$ be the open ball of radius $r$ in $\mathbb{R}^{2n}$ and $B^{2}(R) \times \mathbb{R}^{2n-2}$ the cylinder of radius $R$. A symplectic embedding $B^{2n}(r) \hookrightarrow B^{2}(R) \times \mathbb{R}^{2n-2}$ exists only if $r \leq R$.
\end{theorem}
327 \begin{theorem}[Coadjoint orbits of compact semisimple groups]
\label{thm:coadjoint-classification}
Let $G$ be compact, connected, and semisimple with complexification $G^{\mathbb{C}}$ and maximal torus $T$ with Lie algebra $\mathfrak{t}$. Every coadjoint orbit of $G$ meets $\mathfrak{t}^{*}$ in a single $W$-orbit, so the orbits are parameterized continuously by points $\xi$ of the closed positive Weyl chamber $\mathfrak{t}^{*}_{+}$. Each orbit is a flag manifold $G^{\mathbb{C}} / P_{\xi}$ where the parabolic $P_{\xi}$ is determined by the support of $\xi$, that is by the subset of Dynkin nodes on whose walls $\xi$ lies; regular $\xi$ gives full flag manifolds and singular $\xi$ gives partial flags. The symplectic form on the orbit is the Kirillov-Kostant-Souriau form of \Cref{thm:kks}. The dominant integral weights form the discrete sublattice $\Lambda_{+} \subset \mathfrak{t}^{*}_{+}$ that selects the integral, that is quantizable, orbits; those are the orbits carrying finite-dimensional irreducible representations by the Borel-Weil theorem.
\end{theorem}
376 \begin{theorem}[Liouville-Arnold]
\label{thm:liouville-arnold}
Let $(M^{2n}, \omega, H_1, \dots, H_n)$ be a Liouville integrable system and let $M_c = \{ H_1 = c_1, \dots, H_n = c_n \}$ be a compact connected regular level set. Then $M_c$ is diffeomorphic to an $n$-torus $T^{n}$, and a neighborhood of $M_c$ in $M$ carries action-angle coordinates $(I, \theta)$ in which $\omega = \sum_{i} dI_i \wedge d\theta_i$ and the $H_i$ depend on the actions $I_i$ alone.
\end{theorem}
385 \begin{proposition}[Action variables are periods]
\label{prop:periods}
In the action-angle coordinates of \cref{thm:liouville-arnold}, the action variables are the periods of the action one-form $\lambda$ with $d\lambda = \omega$ over a basis $\gamma_1, \dots, \gamma_n$ of $H_1(M_c; \mathbb{Z})$:
\[
I_j = \frac{1}{2\pi} \oint_{\gamma_j} \lambda.
\]
The value depends on the choice of primitive $\lambda$: two primitives differ by a closed one-form, and the resulting shift of the actions is the period vector of that form, a vector of $H^{1}(M_c; \mathbb{R}) \cong \mathbb{R}^{n}$. Once $\lambda$ is fixed, the angle variables are fiberwise coordinates normalized so that $\omega = \sum_j dI_j \wedge d\theta_j$.
\end{proposition}
400 \begin{proposition}[Monodromy obstruction]
\label{prop:monodromy}
There exist integrable Hamiltonian systems whose regular compact fibers are tori and which admit no global action-angle coordinates; the obstruction is the monodromy representation of $\pi_1$ of the base of the fibration acting on the period lattice $H_1(T^{n}; \mathbb{Z})$.
\end{proposition}
421 \begin{theorem}[Nekhoroshev estimate]
\label{thm:nekhoroshev}
Let $H = H_0 + \varepsilon H_1$ be a steep integrable Hamiltonian system with $n$ degrees of freedom and let $H_0(I)$ be the integrable part in action variables. There are positive constants $c$, $a$, and $b$ depending on the system such that, for $\varepsilon$ small, every trajectory satisfies
\[
\| I(t) - I(0) \| \leq c \varepsilon^{b}
\qquad \text{for all } 0 \leq t \leq \exp(c \varepsilon^{-a}).
\]
The bound is on the drift of the action variables, not on the energy, which is conserved exactly.
\end{theorem}
458 \begin{theorem}[Chentsov]
\label{thm:chentsov}
Let $g$ be a family of Riemannian metrics $g^{(n)}$ on the open simplices $\Delta^{\circ} \subset \mathbb{R}^{n}$ for all $n \geq 1$, compatible with Markov embeddings (pullback along every sufficient statistic is an isometry) and monotone under stochastic maps in the sense of \cref{def:monotone}. Then one constant $c > 0$ satisfies $g^{(n)} = c \, g_{\mathrm{Fisher}}^{(n)}$ for every $n$, where $g_{\mathrm{Fisher}}^{(n)}$ is the Fisher metric of \cref{def:fisher}. The cross-dimension compatibility is a hypothesis: monotonicity on a single fixed simplex does not determine the metric up to scale.
\end{theorem}
467 \begin{lemma}[Equality along sufficient statistics]
\label{lem:sufficiency}
Let $g$ be a monotone metric on $\Delta^{\circ}$ and let $T$ be a stochastic map with a stochastic left inverse $S$, that is $S T = \mathrm{Id}$. Then $T$ is an isometric embedding for $g$, and for every tangent vector $u$ at $p$,
\[
g_{p}(u, u) = g_{Tp}(Tu, Tu).
\]
\end{lemma}
488 \begin{corollary}[Fisher metric as classifying invariant]
\label{cor:fisher-invariant}
The Fisher metric, up to positive scale, is a classifying invariant of the classical statistical family under stochastic morphisms: it is the unique metric compatible with the coarse-graining order.
\end{corollary}
498 \begin{proposition}[Product of statistical models]
\label{prop:stat-product}
Let $p \in \Delta^{\circ} \subset \mathbb{R}^{n}$ and $q \in \Delta^{\circ} \subset \mathbb{R}^{m}$ be probability vectors and let $p \otimes q \in \Delta^{\circ} \subset \mathbb{R}^{nm}$ be their product. Then the Fisher metric of the product is the direct sum of the factors:
\[
g_{p \otimes q}(u \otimes q + p \otimes v, u \otimes q + p \otimes v) = g_{p}(u, u) + g_{q}(v, v)
\]
for tangent vectors $u$ at $p$ and $v$ at $q$.
\end{proposition}
521 \begin{theorem}[Petz-Sudar parametric classification]
\label{thm:petz-sudar}
Monotone metrics on the space of positive definite density matrices, defined by monotonicity under completely positive trace-preserving maps, are classified by operator monotone functions $f : (0, \infty) \to (0, \infty)$ with $f(1) = 1$ and the symmetry $f(t) = t f(1/t)$ that makes the bilinear form symmetric. The family of such metrics is parametric and infinite, and no constant multiple of a single metric exhausts it.
\end{theorem}
541 \begin{proposition}[Irreducibility of symplectic surfaces]
\label{prop:surface-irreducible}
Every closed symplectic surface of genus $g \geq 0$ is $C$-irreducible for the product composition.
\end{proposition}
550 \begin{proposition}[Symplectic reduction]
\label{prop:reduction}
Let a compact Lie group $G$ act on a symplectic system $(M, \omega)$ by symplectomorphisms with momentum map $J$. For a regular value $\mu$ of $J$ at which the isotropy group $G_{\mu}$ acts freely and properly on $J^{-1}(\mu)$, the reduced space $J^{-1}(\mu) / G_{\mu}$ carries a unique symplectic form $\omega_{\mu}$ such that the pullback along $J^{-1}(\mu) \to J^{-1}(\mu)/G_{\mu}$ agrees with $\omega|_{J^{-1}(\mu)}$, and the reduced dynamics of an invariant Hamiltonian is Hamiltonian for $\omega_{\mu}$. The reduction is a decomposition construction on classical systems, and its output is again a classical system of \cref{def:classical-system}.
\end{proposition}
566 \begin{proposition}[Reduction of products]
\label{prop:reduction-products}
Let $G$ act on a symplectic system $(M_1, \omega_1)$ with momentum map $J_1$, let $(M_2, \omega_2)$ carry the trivial $G$-action, and let $\mu$ be a regular value of $J_1$. Then the reduced space of the product $(M_1 \times M_2, \omega_1 \oplus \omega_2)$ at $\mu$ is the product of the reduced space of $M_1$ at $\mu$ with $M_2$:
\[
\big( J_1^{-1}(\mu) / G_{\mu} \big) \times M_2,
\]
with reduced form $\omega_{\mu} \oplus \omega_2$. Reduction commutes with product composition along the factor that carries no symmetry.
\end{proposition}
593 \begin{theorem}[Delzant]
\label{thm:delzant}
The momentum image $\Delta = J(M) \subset \mathbb{R}^{n}$ of a compact connected toric symplectic manifold is a convex rational Delzant polytope: convex, rational, simple, and Delzant (the normal vectors of the facets meeting at each vertex form a $\mathbb{Z}$-basis of $\mathbb{Z}^{n}$). Two compact connected toric symplectic manifolds are equivariantly symplectomorphic up to an automorphism of the acting torus $T^{n}$ if and only if their Delzant polytopes are related by an element of $GL(n; \mathbb{Z}) \ltimes \mathbb{R}^{n}$. When the torus action is fixed pointwise the equivalence narrows to translations of the polytope in $\mathbb{R}^{n}$ alone. Conversely, every Delzant polytope arises from such a manifold.
\end{theorem}

FILE papers/latex/vol-06-quantum-systems.tex
165 \begin{theorem}[Structure of finite-dimensional $C^*$-algebras]
\label{thm:findim}
Let $A$ be a finite-dimensional complex $C^*$-algebra. Then there are integers $n_1, \dots, n_k \geq 1$ and a $*$-isomorphism
\[
A \cong M_{n_1}(\mathbb{C}) \oplus \cdots \oplus M_{n_k}(\mathbb{C}).
\]
The multiset $\{n_1, \dots, n_k\}$ determines $A$ up to $*$-isomorphism, and two finite-dimensional $C^*$-algebras are $*$-isomorphic if and only if their dimension vectors agree as multisets.
\end{theorem}
180 \begin{corollary}[Classification by dimension vector]
\label{cor:findimclass}
Up to $*$-isomorphism the finite-dimensional complex $C^*$-algebras are in bijection with finite multisets of positive integers, and every such algebra is unital with $\dim A = \sum_i n_i^2$ the sum of squares of its block sizes.
\end{corollary}
200 \begin{corollary}[Counting small algebras]
\label{cor:count}
For each $d \geq 1$ the $*$-isomorphism classes of finite-dimensional $C^*$-algebras of complex dimension $d$ are in bijection with the partitions of $d$ into perfect squares. In particular the number of such algebras grows as the number of such partitions.
\end{corollary}
241 \begin{proposition}[States of a block algebra]
\label{prop:states}
Let $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$. Every state $\rho$ on $A$ is of the form
\[
\rho(X_1, \dots, X_k) = \sum_{i=1}^{k} \operatorname{Tr}(\sigma_i X_i)
\]
for positive matrices $\sigma_i \in M_{n_i}(\mathbb{C})$ with $\sum_i \operatorname{Tr} \sigma_i = 1$, and this correspondence is bijective. The pure states of $A$ are the vector states of individual blocks, so the pure state space is the disjoint union of complex projective spaces $\mathbb{CP}^{n_i - 1}$.
\end{proposition}
256 \begin{proposition}[Automorphisms of block algebras]
\label{prop:aut}
Every $*$-automorphism of $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ is the composition of a blockwise inner automorphism and a permutation of blocks of equal size. The dynamics of a finite-dimensional quantum system is therefore a unitary path inside blocks together with block permutations of equal size, and none of it is recorded by the dimension vector beyond the block sizes themselves.
\end{proposition}
265 \begin{proposition}[Unique decomposition in the finite-dimensional class]
\label{prop:unique}
Decompositions of a finite-dimensional $C^*$-algebra $A$ into irreducible summands under direct sum exist and are unique up to order and unitary equivalence. The dimension vector is therefore complete data for the decomposition as well as for the isomorphism class, and the uniqueness that fails for interacting systems in general holds in this restricted class.
\end{proposition}
274 \begin{proposition}[Tensor products of block algebras]
\label{prop:tensor}
Let $A = \bigoplus_i M_{n_i}(\mathbb{C})$ and $B = \bigoplus_j M_{m_j}(\mathbb{C})$. Then $A \otimes B \cong \bigoplus_{i,j} M_{n_i m_j}(\mathbb{C})$, and the dimension vector of $A \otimes B$ is the multiset of products $\{n_i m_j\}$. In particular the dimension vector of a tensor product is computed from the factor dimension vectors without reference to any presentation.
\end{proposition}
302 \begin{theorem}[Central decomposition]
\label{thm:central}
Every von Neumann algebra $M$ is a direct integral of factors over a measure space, unique up to measure-class isomorphism of the base. The isomorphism classification of von Neumann algebras therefore reduces to the classification of factors together with the measure-theoretic data of the decomposition.
\end{theorem}
309 \begin{theorem}[Classification of amenable factors]
\label{thm:amenable}
Among factors with separable predual the amenable (equivalently injective, equivalently hyperfinite) factors are classified as follows. For each $n \geq 1$ there is a unique factor of type $\mathrm{I}_n$ and a unique factor of type $\mathrm{I}_\infty$. There is a unique amenable factor of type $\mathrm{II}_1$, the hyperfinite factor, and a unique amenable factor of type $\mathrm{II}_\infty$. For each $\lambda \in (0,1)$ there is a unique amenable factor of type $\mathrm{III}_\lambda$, and a unique amenable factor of type $\mathrm{III}_1$. Amenable factors of type $\mathrm{III}_0$ are classified by the ergodic flow of weights. The invariants in force are the Murray-von Neumann type together with the Connes invariants. Separable predual is essential: among non-separable injective $\mathrm{II}_1$ factors uniqueness fails, and there are $2^{\mathfrak{c}}$ pairwise non-isomorphic ones.
\end{theorem}
341 \begin{theorem}[McDuff 1969]
\label{thm:mcduff}
There exist uncountably many pairwise non-isomorphic separable type $\mathrm{II}_1$ factors.
\end{theorem}
350 \begin{corollary}[No finite list of factor types]
\label{cor:nofinite}
No finite or countable list of pairwise non-isomorphic factor types exhausts the separable $\mathrm{II}_1$ factors, and no CFSG-style list of factor types is complete outside a restricted class such as the amenable factors.
\end{corollary}
374 \begin{lemma}[Choi correspondence]
\label{lem:choi}
For a linear map $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ with Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$ the following hold: $\Phi$ is completely positive if and only if $J(\Phi) \geq 0$, and $\Phi$ is trace preserving if and only if $\operatorname{Tr}_m J(\Phi) = I_n$, where $\operatorname{Tr}_m$ is the partial trace over the second tensor factor.
\end{lemma}
393 \begin{theorem}[Choi-Kraus normal form]
\label{thm:kraus}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be linear. Then $\Phi$ is completely positive if and only if there are matrices $A_1, \dots, A_r \in M_{m \times n}(\mathbb{C})$ with
\[
\Phi(X) = \sum_{i=1}^{r} A_i X A_i^* \qquad \text{for all } X \in M_n(\mathbb{C}),
\]
and one may take $r$ equal to the rank of the Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$. The minimal such $r$ is the Kraus rank of $\Phi$ and equals the rank of $J(\Phi)$.
\end{theorem}
415 \begin{theorem}[Stinespring dilation]
\label{thm:stinespring}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be a channel. Then $\Phi$ admits a Stinespring dilation $(K, V)$ in the sense of \cref{def:channels}, and minimal dilations exist. Any two minimal dilations $(K, V)$ and $(K', V')$ of $\Phi$ are unitarily equivalent: there is a unitary $U: K \to K'$ with $(I_m \otimes U) V = V'$. The dimension $\dim K$ of a minimal dilation equals the Kraus rank of $\Phi$.
\end{theorem}
431 \begin{proposition}[Kraus rank is a normal-form invariant]
\label{prop:krausrank}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be a channel. The Kraus rank of $\Phi$ equals the rank of its Choi matrix, equals the minimal number of Kraus operators in any representation of $\Phi$, and equals the dimension of the environment $K$ in a minimal Stinespring dilation. The Kraus rank is preserved by unitary changes of Kraus presentation and by composition of $\Phi$ with unitary conjugations of domain and codomain. It is not a complete invariant of channels: two channels with equal Kraus rank need not be unitarily equivalent.
\end{proposition}
445 \begin{proposition}[Composition of channels]
\label{prop:compose}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ and $\Psi: M_m(\mathbb{C}) \to M_p(\mathbb{C})$ be linear. Then
\[
J(\Psi \circ \Phi)_{(i\alpha),(j\beta)} = \sum_{k,l=1}^{m} J(\Phi)_{(ik),(jl)} \, J(\Psi)_{(k\alpha),(l\beta)},
\]
with composite indices as in \cref{lem:choi}. The right-hand side is the link product of $J(\Phi)$ and $J(\Psi)$: matrix multiplication of $J(\Phi)$ after partial transpose on the shared subsystem, contracted with $J(\Psi)$ along that subsystem. Composition of channels is therefore a link-product contraction, and the Choi matrix of a composite is determined by the Choi matrices of the factors.
\end{proposition}
475 \begin{theorem}[Doplicher-Roberts reconstruction]
\label{thm:dr}
Let $\mathcal{C}$ be a symmetric tensor $*$-category with conjugates, direct sums, and subobjects, and with $\operatorname{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent, as a symmetric tensor $*$-category, to the category of finite-dimensional unitary representations of a compact supergroup $G$, and $G$ is unique up to isomorphism.
\end{theorem}
492 \begin{theorem}[Deligne]
\label{thm:deligne}
Let $\mathcal{C}$ be a $\mathbb{C}$-linear, abelian, rigid symmetric tensor category over $\mathbb{C}$ of subexponential growth, with $\operatorname{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent, as a symmetric tensor category, to the category of finite-dimensional representations of an affine supergroup scheme. In particular the category is Tannakian in the super sense.
\end{theorem}
499 \begin{proposition}[Etingof-Gelaki counterexample]
\label{prop:eg}
There exist finite non-isomorphic groups $G_1$ and $G_2$ whose representation categories over $\mathbb{C}$ are equivalent as tensor categories, but not as symmetric tensor categories. Consequently an equivalence of tensor categories that forgets the symmetric structure cannot recover the group, and any classification of such categories built on that equivalence is false.
\end{proposition}
533 \begin{theorem}[Petz]
\label{thm:petz}
Monotone metrics on $\mathcal{D}_n$ are in bijection with operator monotone functions $f: (0,\infty) \to (0,\infty)$ that satisfy the symmetry condition $f(t) = t f(1/t)$ and the normalization $f(1) = 1$. Given such a function $f$, the corresponding metric on the tangent space $T_\rho \mathcal{D}_n$ is
\[
g_\rho^f(A, B) = \operatorname{Tr}\Bigl(A^* \bigl[R_\rho \, f(L_\rho R_\rho^{-1})\bigr]^{-1}(B)\Bigr),
\]
where $L_\rho$ and $R_\rho$ are the left and right multiplication operators by $\rho$ on $M_n(\mathbb{C})$. Distinct normalized operator monotone functions give distinct monotone metrics.
\end{theorem}
546 \begin{corollary}[Parametricity of the quantum invariant]
\label{cor:parametric}
The monotone metrics of quantum states are classified by a continuous parameter (the normalized operator monotone function), not by a discrete choice. There is no quantum analogue of Chentsov uniqueness, and any classification statement for quantum monotone metrics must accept a parametric invariant in place of a unique object.
\end{corollary}

exec
/usr/local/bin/zsh -lc "sed -n '245,278p' papers/latex/vol-04-yoneda-classification.tex; sed -n '1,130p' lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/List/Defs.lean; sed -n '165,180p' lean/.lake/packages/mathlib/Mathlib/Data/Matrix/Basis.lean; rg -n 'map_list_sum|sum_map_product|sum_product.*map|sum_map.*product' lean/.lake/packages/mathlib/Mathlib/Algebra lean/.lake/packages/mathlib/Mathlib/Data/List" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
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
\end{remark}

The three denials of the governing constraint now have their mathematical content. Physical equivalence is a choice of morphisms or relations that the embedding does not make. Empirical adequacy is a property of how a representation meets observation, a separate layer of the architecture from mathematical classification. A classification theorem is a supply of separating invariants, and Theorem~\ref{thm:noimplication} shows that representability is logically independent of such a supply. What Yoneda does establish is Corollary~\ref{cor:releq}: objects are determined by their relationships, up to the isomorphism encoded in the declared morphisms.

\subsection{Determination and classification}
\label{sec:regimes}

Structural knowledge of a family falls into one of four regimes, recorded in Table~\ref{tab:regimes}; the Yoneda embedding belongs to the third.

\begin{table}[t]
\centering
\small
\caption{Four regimes of structural knowledge. The Yoneda embedding supplies determination; classification content comes from the invariants of each family; the wild regimes forbid finite-variety classification outright.}
\label{tab:regimes}
\begin{tabular}{@{} L{3.8cm} L{4.2cm} L{3.2cm} L{3.2cm} @{}}
\toprule
Regime & Example & Invariant & What is missing \\
\midrule
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
lemma prod_induction_nonempty
    (p : M → Prop) (hom : ∀ a b, p a → p b → p (a * b)) (hl : l ≠ []) (base : ∀ x ∈ l, p x) :
    p l.prod := by
  induction l with
  | nil => simp at hl
  | cons a l ih =>
    by_cases hl_empty : l = []
    · simp [*]
    rw [List.prod_cons]
    simp only [mem_cons, forall_eq_or_imp] at base
    exact hom _ _ (base.1) (ih hl_empty base.2)

end MulOneClass

section Monoid

variable [Monoid M] [Monoid N]

@[to_additive (attr := simp)]
theorem prod_replicate (n : ℕ) (a : M) : (replicate n a).prod = a ^ n := by
  induction n with
  | zero => rw [pow_zero, replicate_zero, prod_nil]
  | succ n ih => rw [replicate_succ, prod_cons, ih, pow_succ']

@[to_additive sum_eq_length_nsmul]
theorem prod_eq_pow_length (l : List M) (m : M) (h : ∀ x ∈ l, x = m) : l.prod = m ^ l.length := by
  rw [← prod_replicate, ← List.eq_replicate_iff.mpr ⟨rfl, h⟩]

@[to_additive (attr := deprecated (since := "2026-08-26")) sum_eq_card_nsmul]
alias prod_eq_pow_card := prod_eq_pow_length

@[to_additive]
theorem prod_hom_rel (l : List ι) {r : M → N → Prop} {f : ι → M} {g : ι → N} (h₁ : r 1 1)
    (h₂ : ∀ ⦃i a b⦄, r a b → r (f i * a) (g i * b)) : r (l.map f).prod (l.map g).prod :=
  List.recOn l h₁ fun a l hl => by simp only [map_cons, prod_cons, h₂ hl]

end Monoid

end List
lemma sum_single_intCast [AddCommGroupWithOne α] [Fintype m] (z : ℤ) :
    ∑ i : m, single i i (z : α) = z :=
  sum_single_eq_diagonal _

theorem sum_sum_single [AddCommMonoid α] [Fintype m] [Fintype n] (x : m → n → α) :
    ∑ i : m, ∑ j : n, single i j (x i j) = of x := by
  ext i j
  rw [← Fintype.sum_prod_type']
  simp [single, Matrix.sum_apply, Matrix.of_apply, ← Prod.mk_inj]

theorem matrix_eq_sum_single [AddCommMonoid α] [Fintype m] [Fintype n] (x : Matrix m n α) :
    x = ∑ i : m, ∑ j : n, single i j (x i j) :=
  sum_sum_single _ |>.symm

theorem single_eq_single_vecMulVec_single [MulZeroOneClass α] (i : m) (j : n) :
    single i j (1 : α) = vecMulVec (Pi.single i 1) (Pi.single j 1) := by
lean/.lake/packages/mathlib/Mathlib/Algebra/WithConv.lean:155:    l.sum.ofConv = (l.map ofConv).sum := map_list_sum (WithConv.addEquiv _) _
lean/.lake/packages/mathlib/Mathlib/Algebra/WithConv.lean:157:    toConv l.sum = (l.map toConv).sum := map_list_sum (WithConv.addEquiv _).symm _
lean/.lake/packages/mathlib/Mathlib/Algebra/CharP/Lemmas.lean:336:  map_list_sum (frobenius R p) _
lean/.lake/packages/mathlib/Mathlib/Algebra/CharP/Lemmas.lean:345:  map_list_sum (iterateFrobenius R p n) _
lean/.lake/packages/mathlib/Mathlib/Algebra/CharP/Two.lean:179:  map_list_sum mulSelfAddMonoidHom _
lean/.lake/packages/mathlib/Mathlib/Algebra/Polynomial/Coeff.lean:97:  map_list_sum (lcoeff R n) _
lean/.lake/packages/mathlib/Mathlib/Algebra/Polynomial/Eval/Defs.lean:125:  map_list_sum (eval₂AddMonoidHom f x) l
lean/.lake/packages/mathlib/Mathlib/Algebra/Module/BigOperators.lean:26:  map_list_sum ((smulAddHom R M).flip x) l
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/RingEquiv.lean:27:protected theorem map_list_sum [NonUnitalNonAssocSemiring R] [NonUnitalNonAssocSemiring S]
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/RingEquiv.lean:28:    (f : R ≃+* S) (l : List R) : f l.sum = (l.map f).sum := map_list_sum f l
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Ring/Finset.lean:325:  map_list_sum (castAddMonoidHom R) _
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Ring/Finset.lean:364:  map_list_sum (castAddHom R) _
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/GroupWithZero/Action.lean:36:  map_list_sum (DistribSMul.toAddMonoidHom N r) l

exec
/usr/local/bin/zsh -lc "python3 -c 'import re; from pathlib import Path
for k in [4,7,8,9,11,12]:
 p=next(Path(\"papers/latex\").glob(f\"vol-{k:02}-*.tex\")); s=p.read_text(); print(\"\\nFILE\",p)
 for m in re.finditer(r\"\\\\begin\\{(theorem|proposition|lemma|corollary)\\}.*?\\\\end\\{\\1\\}\",s,re.S): print(s[:m.start()].count(\"\\n\")+1,m.group()[:750])'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 25ms:

FILE papers/latex/vol-04-yoneda-classification.tex
142 \begin{theorem}[Yoneda lemma]
\label{thm:yoneda}
Let $\mathcal{C}$ be a locally small category and let $A \in \mathrm{Ob}(\mathcal{C})$. For every functor $F \colon \mathcal{C}^{\mathrm{op}} \to \mathbf{Set}$ the evaluation map
\[
\mathrm{ev}_A \colon \Nat\big(\Hom_{\mathcal{C}}(-, A), F\big) \longrightarrow F(A),
\qquad
\alpha \longmapsto \alpha_A(\mathrm{id}_A),
\]
is a bijection.
\end{theorem}
159 \begin{corollary}[Full faithfulness]
\label{cor:faithful}
For all objects $A, B$ of a locally small category $\mathcal{C}$ the map
\[
\Hom_{\mathcal{C}}(A, B) \longrightarrow \Nat\big(y(A), y(B)\big),
\qquad
\varphi \longmapsto \big(g \mapsto \varphi \circ g\big),
\]
is a bijection. In particular $y$ is faithful and full, and $y(A) \cong y(B)$ holds if and only if $A \cong B$.
\end{corollary}
176 \begin{proposition}[Probe content of a profile]
\label{prop:probe}
Let $P \in \mathrm{Ob}(\mathcal{C})$ with $\mathcal{C}$ locally small. For each probe $R$ the value $y(P)(R) = \Hom(R, P)$ is the set of admissible relationships from $R$ to $P$, and the action of $y(P)$ along $f \colon R \to R'$ is the composition law of $\mathcal{C}$. Consequently the profile $y(P)$ is determined by, and determines, the system's interaction with every probe in $\mathcal{C}$, and two systems have isomorphic profiles exactly when those interactions coincide up to relabelling by isomorphisms of the probes' targets.
\end{proposition}
185 \begin{corollary}[Relational equivalence is isomorphism]
\label{cor:releq}
For a declared category $\mathcal{C}$ of representations one has $P \sim_{\mathrm{rel}} Q$ if and only if $P$ and $Q$ are mathematically equivalent in the sense of isomorphism in $\mathcal{C}$. Relational equivalence therefore refines or coincides with mathematical equivalence according to the morphisms in force, and it implies physical equivalence only when the declared morphisms have themselves been justified as physical equivalences.
\end{corollary}
208 \begin{proposition}[What restriction loses]
\label{prop:restriction}
Let $\mathcal{R} \subseteq \mathrm{Ob}(\mathcal{C})$ be a probe class. Isomorphic restricted profiles do not imply isomorphic objects in general. If the restricted Yoneda comparison $y_{\mathcal{R}} \colon \mathcal{C} \to [\mathcal{R}^{\mathrm{op}}, \mathbf{Set}]$ is fully faithful, then $\mathcal{R}$-relationally equivalent objects are isomorphic, and the argument of Corollary~\ref{cor:faithful} applies verbatim.
\end{proposition}
224 \begin{proposition}[Profiles respect limits]
\label{prop:limits}
Let $\mathcal{C}$ be a locally small category in which a diagram $D$ has a limit $L = \lim D$. Then $y(L)$ is the limit of the diagram $y \circ D$ in $[\mathcal{C}^{\mathrm{op}}, \mathbf{Set}]$. In particular $y$ preserves terminal objects and binary products: $y(A \times B) \cong y(A) \times y(B)$ canonically whenever the product exists.
\end{proposition}
249 \begin{theorem}[Representability does not imply classifiability]
\label{thm:noimplication}
Let $n \geq 3$, let $S = k[x_{ij}]$ be the polynomial ring over a field $k$ in the entries of a generic $n \times n$ matrix, let $R = S/(\det(x_{ij}))$ be the coordinate ring of the generic determinant hypersurface, and let $\mathcal{C}$ be the category of finitely generated maximal Cohen-Macaulay $R$-modules of rank two, with $R$-module homomorphisms as morphisms. The objects of $\mathcal{C}$ admit no parametrization by a finite-dimensional variety over $k$ in the sense of Definition~\ref{def:classify}, while $y$ is fully faithful on $\mathcal{C}$. Full faithfulness of the Yoneda embedding therefore does not imply the existence of a classification th
302 \begin{proposition}[Choi correspondence and composition]
\label{prop:choi}
For fixed $n, m \geq 1$ the assignment $\Phi \mapsto J(\Phi)$ is a linear bijection $L(M_n, M_m) \to M_n \otimes M_m$. It restricts to a bijection between completely positive maps and positive semidefinite Choi matrices, and $\Phi$ is trace preserving if and only if $\Tr_m J(\Phi) = I_n$. If $\Phi \colon M_n \to M_m$ and $\Psi \colon M_m \to M_p$ are linear, then
\begin{equation}
\label{eq:choi-comp}
J(\Psi \circ \Phi)_{(i\alpha),(j\beta)}
\;=\;
\sum_{k,l=1}^{m} J(\Phi)_{(ik),(jl)}\, J(\Psi)_{(k\alpha),(l\beta)},
\end{equation}
where composite indices label rows and columns of $M_n \otimes M_m$ and $M_m \otimes M_p$. Composition of channels is therefore a contraction
325 \begin{theorem}[Supermap representability]
\label{thm:supermap}
Let $\mathcal{T}$ be a theory of processes whose processes form a symmetric monoidal category under sequential and parallel composition, and suppose $\mathcal{T}$ is equipped with a channel-state duality: a natural identification of each process $\Phi \colon A \to B$ with a state of the composite system $A \otimes B$, preserved by composition. Then the categorical supermaps of $\mathcal{T}$ are concretely representable through that duality: every supermap corresponds to a process of the composite system, and representability yields the factorisation theorems for causally ordered supermaps.
\end{theorem}
355 \begin{theorem}[Gelfand duality]
\label{thm:gelfand}
Let $\mathbf{KHaus}$ be the category of compact Hausdorff spaces with continuous maps, and let $\mathbf{CCStar}$ be the category of unital commutative complex $C^*$-algebras with unital $*$-homomorphisms. The assignment $X \mapsto C(X)$ and $A \mapsto \Sp(A)$ extends to an equivalence of categories $\mathbf{KHaus}^{\mathrm{op}} \simeq \mathbf{CCStar}$, a contravariant equivalence between $\mathbf{KHaus}$ and $\mathbf{CCStar}$; equivalently, every unital commutative $C^*$-algebra is isometrically $*$-isomorphic to $C(X)$ for $X$ its character space. More generally, the Gelfand-Naimark theorem \cite{gn} embeds every $C^*$-algebra in the bounded operators of a Hilbert space, and the commutat
364 \begin{theorem}[Stone duality]
\label{thm:stone}
Let $\mathbf{Bool}$ be the category of Boolean algebras with homomorphisms, and let $\mathbf{KHaus}_0$ be the category of zero-dimensional compact Hausdorff spaces with continuous maps. The Stone space construction $B \mapsto \mathrm{St}(B)$ and the algebra of clopen sets $X \mapsto \mathrm{Clop}(X)$ extend to an equivalence of categories $\mathbf{Bool}^{\mathrm{op}} \simeq \mathbf{KHaus}_0$, a contravariant equivalence between $\mathbf{Bool}$ and $\mathbf{KHaus}_0$ \cite{stone}.
\end{theorem}
373 \begin{theorem}[Doplicher-Roberts reconstruction]
\label{thm:dr}
Let $\mathcal{T}$ be a symmetric tensor $C^*$-category with conjugates, direct sums, subobjects, and $\End(\mathbf{1}) \cong \mathbb{C}$. Then $\mathcal{T}$ is equivalent, as a symmetric tensor $*$-category, to the category of finite-dimensional unitary representations of a compact supergroup $G$, and $G$ is unique up to isomorphism \cite{dr}. The hypotheses are not decorative: symmetric structure, conjugates, direct sums, subobjects, and the scalar endomorphism condition are all used.
\end{theorem}
405 \begin{proposition}[Probe reconstruction on the commutative side]
\label{prop:commprobe}
Let $A$ be a unital commutative $C^*$-algebra with character space $X = \Sp(A)$. The Gelfand transform $a \mapsto \hat{a}$ is the map that assembles the probe values of $a$, that is, the numbers $\chi(a)$ for the characters $\chi \in \Hom(A, \mathbb{C})$, and the statement of Theorem~\ref{thm:gelfand} is that these probe values determine $A$ up to isometric $*$-isomorphism. The probe data is thus the relational data of $A$ against the one-dimensional representations, and the reconstruction theorem upgrades the determination to an equivalence of categories.
\end{proposition}
428 \begin{theorem}[Etingof-Gelaki constraint]
\label{thm:eg}
There exist non-isomorphic finite groups $G$ and $H$ whose categories $\mathrm{Rep}(G)$ and $\mathrm{Rep}(H)$ of finite-dimensional complex representations are equivalent as monoidal categories, with the commutativity constraint ignored, while the symmetric structures of the two categories differ. A monoidal equivalence of representation categories therefore does not recover the group; the symmetric monoidal layer is required, and any identification that relies on the monoidal layer alone is provably insufficient.
\end{theorem}
441 \begin{proposition}[Preserved-layer discipline for profiles]
\label{prop:discipline}
Let $\mathcal{C}$ be a category of representations whose morphisms preserve a layer $L$ of structure and forget a layer $L'$. If $P \sim_{\mathrm{rel}} Q$ in $\mathcal{C}$, then $P$ and $Q$ are equivalent at layer $L$, and no claim about layer $L'$ follows. In particular, profiles computed in a category of monoidal equivalences that ignore the commutativity constraint cannot support identifications that require the symmetric layer, and every use of the relational profile must declare the layers its morphisms preserve.
\end{proposition}
450 \begin{corollary}[Constraint inheritance]
\label{cor:inherit}
The Yoneda embedding does not weaken the structure-preserving requirement on equivalences. Every relational identification inherits, through its morphisms, the preserved-layer declaration of the equivalence notion in force; a profile computed for one declaration is not evidence for an identification requiring another.
\end{corollary}
478 \begin{proposition}[Fusion rings of two groups of order eight]
\label{prop:fusion}
Let $D_8$ be the dihedral group of order eight and $Q_8$ the quaternion group. Their character tables and their representation fusion rings are isomorphic, and the groups are not isomorphic. Fusion-ring data therefore does not determine the group.
\end{proposition}

FILE papers/latex/vol-07-gauge-qft.tex
152 \begin{theorem}[Killing\textendash{}Cartan classification]
\label{thm:killing-cartan}
Complex semisimple Lie algebras are classified up to isomorphism by Dynkin diagrams of types $A_r$, $B_r$, $C_r$, $D_r$, $G_2$, $F_4$, $E_6$, $E_7$, $E_8$~\cite{humphreys, serre}. Real simple Lie algebras are classified by Satake diagrams; the real forms of a given complex simple algebra $\mathfrak{g}$ correspond to the conjugacy classes of involutive automorphisms of $\mathfrak{g}$, equivalently to conjugacy classes of Cartan involutions. Connected Lie groups with Lie algebra $\mathfrak{g}$ are classified by discrete subgroups $Z'$ of the center of the universal covering group $\widetilde{G}$: each such group is a quotient $\widetilde{G}/Z'$.
\end{theorem
163 \begin{theorem}[Highest-weight classification]
\label{thm:highest-weight}
Let $\mathfrak{g}$ be a complex semisimple Lie algebra. Finite-dimensional irreducible representations of $\mathfrak{g}$ are in bijection with dominant integral weights; the representation with highest weight $\lambda$ exists and is unique up to isomorphism~\cite{humphreys}.
\end{theorem}
193 \begin{theorem}[Classification by the classifying space]
\label{thm:bundles}
Let $G$ be a Lie group and $X$ a paracompact Hausdorff space. The map that sends a principal $G$-bundle to its classifying map induces a bijection~\cite{milnor, dold, steenrod}
\[
\mathrm{GBund}(X) \cong [X, BG],
\]
and the characteristic classes of a bundle are exactly the pullbacks along its classifying map of the universal characteristic classes in $H^*(BG)$~\cite{milnor-stasheff}.
\end{theorem}
208 \begin{proposition}[Bundles over spheres]
\label{prop:spheres}
Let $G$ be a connected Lie group and $n \geq 1$. Isomorphism classes of principal $G$-bundles over $S^n$ are in bijection with $\pi_{n-1}(G)$.
\end{proposition}
250 \begin{proposition}[Characteristic classes of the classical groups]
\label{prop:classical-classes}
For $G = \mathrm{U}(n)$ the classifying cohomology $H^*(B\mathrm{U}(n); \mathbb{Z})$ is a polynomial ring on the Chern classes $c_1, \ldots, c_n$. For $G = \mathrm{SO}(2k+1)$ the rational cohomology $H^*(B\mathrm{SO}(2k+1); \mathbb{Q})$ is a polynomial ring on the Pontryagin classes $p_1, \ldots, p_k$. For $G = \mathrm{SO}(2k)$ the rational cohomology $H^*(B\mathrm{SO}(2k); \mathbb{Q})$ is the free polynomial ring $\mathbb{Q}[p_1, \ldots, p_{k-1}, e]$; the top Pontryagin class is the element $p_k = e^2$ and is not an independent generator. For $G = \mathrm{SU}(n)$ the class $c_1$ vanishes and $H^*(B\mathrm{SU}(n); \mathbb{Z})$ is a polynomial 
276 \begin{proposition}[Quantization gate]
\label{prop:anomaly}
A gauge theory admits a consistent quantization only where the determinant line $\lambda_{\mathrm{det}}$ of the Dirac family is trivializable and its anomaly cocycle $[a]$ vanishes in the local BRST cohomology $H^{1,n}(s\mid d)$. The group $H^{1,n}(s\mid d)$ is the space of candidate anomalies of the theory; the specific cocycle $[a]$ is the anomaly of the theory at hand. These two vanishing conditions are the classification content of the anomaly: the obstruction classes are natural in the gauge configuration and classify the inconsistent directions.
\end{proposition}
294 \begin{proposition}[Anomaly cancellation as a linear condition]
\label{prop:cancellation}
Fix a compact simple gauge group $G$ and let the matter content be a finite list of finite-dimensional irreducible representations $R_1, \ldots, R_k$ with highest weights $\lambda_1, \ldots, \lambda_k$. The contribution of each representation to a fixed anomaly class is additive, so there is a homomorphism of abelian groups
\[
\alpha \colon R(G) \longrightarrow A,
\]
from the representation ring of $G$ to the coefficient group $A$ of the anomaly in question, and the anomaly-free matter lists form $\ker \alpha$. For the four-dimensional perturbative gauge anomaly $A = \mathbb{Z}$ and $\alpha(R)$ is the anomaly coefficient of $R$; for global anomalies $A
314 \begin{theorem}[Two-dimensional topological field theories]
\label{thm:frobenius}
The category of two-dimensional Atiyah topological quantum field theories with values in vector spaces is equivalent to the category of commutative Frobenius algebras~\cite{atiyah-tqft}.
\end{theorem}
364 \begin{theorem}[Doplicher\textendash{}Roberts reconstruction]
\label{thm:dr}
Let $\mathcal{C}$ be a symmetric tensor $\mathrm{C}^*$-category with conjugates, direct sums, subobjects, and $\mathrm{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent to the category of finite-dimensional unitary representations of a compact group $G$ equipped with a distinguished central element $k$ of order at most two, $k^2 = e$, whose adjoint action implements the $\mathbb{Z}/2$ grading of the statistics; in the graded language this data is a compact supergroup. The pair $(G, k)$ is unique up to isomorphism~\cite{dr, dhr}. Applied to the DHR category of a local net satisfying Haag duality, the theorem reconstructs a compact gauge group from the
377 \begin{theorem}[Deligne's theorem]
\label{thm:deligne}
An abelian, $k$-linear, rigid symmetric monoidal category over an algebraically closed field of characteristic zero, with $\mathrm{End}(\mathbf{1}) = k$ and subexponential growth, is equivalent to the category of representations of an affine supergroup scheme~\cite{deligne}.
\end{theorem}
398 \begin{theorem}[Reconstruction from commutative probes]
\label{thm:gelfand}
The Gelfand\textendash{}Naimark theorem embeds every $\mathrm{C}^*$-algebra in an algebra of operators on a Hilbert space, and for commutative $\mathrm{C}^*$-algebras the Gelfand transform is an isomorphism onto the continuous functions on the Gelfand spectrum~\cite{gelfand-naimark}. Stone duality is the Boolean analogue: a Boolean algebra is recovered from its space of ultrafilters~\cite{stone}. In each case the object is determined by its commutative or Boolean probe data.
\end{theorem}

FILE papers/latex/vol-08-spacetime-reconstruction.tex
157 \begin{proposition}[Shared invariants, distinct spacetimes]\label{prop:incomplete}
There exist two Lorentzian spacetimes with the same dimension, the same holonomy group, and the same causal class, which are not isometric. Concretely, the flat plane $\mathbb{R}^{1,1}$ with metric $-dt^2 + dx^2$ and the flat cylinder $\mathbb{R} \times \mathbb{S}^1$ with metric $-dt^2 + d\theta^2$ both have trivial holonomy and are both globally hyperbolic, and no isometry exists between them.
\end{proposition}
165 \begin{corollary}[Classification by these invariants is not classification]\label{cor:notclassifies}
No classification of Lorentzian spacetimes up to isometry can be read off the holonomy group, the causal class, and the dimension alone. Any complete classification must add global invariants, such as topology or global curvature data, and the list of \Cref{tab:invariants} must be read as a list of attached data rather than as a complete set of coordinates.
\end{corollary}
179 \begin{theorem}[Lorentzian holonomy classification]\label{thm:holonomy}
Let $(M,g)$ be a connected, simply connected Lorentzian manifold of signature $(1,n-1)$ with $g$ indecomposable. Then the connected holonomy group $\mathrm{Hol}^0(g)$ is one of the following: the full group $\mathrm{SO}(1,n-1)^{\uparrow}$; a special holonomy group whose algebra stabilizes a null line and embeds in the similarity algebra $\mathfrak{sim}(n-2) = (\mathbb{R} \oplus \mathfrak{so}(n-2)) \ltimes \mathbb{R}^{n-2}$; or, when $g$ is locally symmetric, the isotropy holonomy of a symmetric space. Every entry of the list is the holonomy group of an explicitly constructed Lorentzian metric \cite{galaev}.
\end{theorem}
191 \begin{proposition}[Holonomy of a product]\label{prop:product}
Let $(M_1, g_1)$ and $(M_2, g_2)$ be connected pseudo-Riemannian manifolds. On the product $M_1 \times M_2$ with the product metric $g_1 \oplus g_2$, the restricted holonomy satisfies
\[
\mathrm{Hol}^0(g_1 \oplus g_2) = \mathrm{Hol}^0(g_1) \times \mathrm{Hol}^0(g_2).
\]
\end{proposition}
204 \begin{lemma}[Restricted holonomy]\label{lem:restricted}
For every Lorentzian spacetime the restricted holonomy $\mathrm{Hol}^0(g)$ is a connected Lie subgroup of $\mathrm{SO}(1,n-1)^{\uparrow}$, and time-orientability places the full holonomy $\mathrm{Hol}(g)$ in the orthochronous group $\mathrm{O}(1,n-1)^{\uparrow}$. The quotient $\mathrm{Hol}(g)/\mathrm{Hol}^0(g)$ is countable in its intrinsic topology, and the classification of \Cref{thm:holonomy} concerns the connected part.
\end{lemma}
239 \begin{theorem}[Completeness of the causal ladder]\label{thm:ladder}
For Lorentzian spacetimes the causality conditions of \Cref{def:ladder} form a strict chain: global hyperbolicity implies causal simplicity, which implies causal continuity, which implies stable causality, which implies strong causality, which implies distinguishing, which implies causality, which implies chronology. Each implication is strict: for each pair of adjacent rungs there exists a spacetime satisfying the lower rung and violating the higher one. Global hyperbolicity is the strongest of the standard causality conditions, and it is equivalent to the compactness of causal diamonds $J^+(p) \cap J^-(q)$ together with the absence of closed causal curves \cite{minguzzis
276 \begin{proposition}[Finite orders satisfy the compactness rung]\label{prop:finiteposet}
Let $(X, \le)$ be a finite partially ordered set, read as a causal model with $x < y$ meaning that $x$ precedes $y$. Then no strictly increasing loop $x_1 < x_2 < \cdots < x_k < x_1$ exists, and every order interval $[x,y] = \{ z : x \le z \le y \}$ is a finite set. Consequently the order-theoretic analogues of chronology and of compact causal diamonds hold for every finite order.
\end{proposition}
284 \begin{proposition}[Distinguishing fails in finite orders under the strict reading]\label{prop:distinguish}
Read the ladder rungs on an order by translating the open futures and pasts literally: $I^+(x) = \{ y : x < y \}$ and $I^-(x) = \{ y : y < x \}$. Under this translation there exists a finite order satisfying the conclusions of \Cref{prop:finiteposet} and failing distinguishing: for the two-element antichain $X = \{a, b\}$ with $a$ and $b$ incomparable, one has $I^-(a) = I^-(b) = \emptyset$ and $I^+(a) = I^+(b) = \emptyset$ for distinct points.
\end{proposition}
292 \begin{corollary}[Translation dependence of the ladder on finite orders]\label{cor:notransfer}
Rung membership of the causal ladder is not invariant under the translation from continuum definitions to orders. The strict reading of \Cref{prop:distinguish} fails on finite orders while the compactness rung holds universally there, and the reflexive reading built from causal futures $J^{\pm}(x) = \{ y : y \le x \}$ is distinguishing on every antisymmetric order by construction. A discrete causality theory must therefore state which translation it uses, and the rungs cannot be carried over verbatim from the manifold category.
\end{corollary}
306 \begin{theorem}[Geometrization of closed 3-manifolds]\label{thm:geometrization}
Every closed 3-manifold decomposes along a canonical family of spheres and tori into pieces, each of which admits one of exactly eight Thurston model geometries: $\mathbb{E}^3$, $\mathbb{S}^3$, $\mathbb{H}^3$, $\mathbb{S}^2 \times \mathbb{R}$, $\mathbb{H}^2 \times \mathbb{R}$, $\mathrm{Nil}$, $\mathrm{Sol}$, and $\widetilde{\mathrm{SL}}(2, \mathbb{R})$. The decomposition is unique up to isotopy, and each geometry is realized by a homogeneous metric on its model space \cite{perelman,thurston1982}.
\end{theorem}
335 \begin{proposition}[Homogeneity of the model geometries]\label{prop:homogeneous}
Each of the eight geometries of \Cref{tab:geometries} is homogeneous: its isometry group acts transitively on the model space. The maximal isometry dimension in dimension three is six, attained by exactly the constant-curvature geometries $\mathbb{E}^3$, $\mathbb{S}^3$, and $\mathbb{H}^3$.
\end{proposition}
343 \begin{theorem}[Unrecognizability in dimension four]\label{thm:tancer}
The recognition problem for closed 4-manifolds is algorithmically undecidable: there is no algorithm that takes as input a finite triangulation of a closed 4-manifold and decides whether it is homeomorphic to $\#_9(\mathbb{S}^2 \times \mathbb{S}^2)$. The connected sum $\#_9(\mathbb{S}^2 \times \mathbb{S}^2)$ is therefore unrecognizable, improving the previous bound $\#_{12}(\mathbb{S}^2 \times \mathbb{S}^2)$ of Gordon \cite{tancer}.
\end{theorem}
351 \begin{corollary}[Dimension contrast]\label{cor:dimcontrast}
A finite table of model geometries with a canonical decomposition theorem exists for closed 3-manifolds and cannot exist, in the algorithmic sense, for closed 4-manifolds. Classification of closed manifolds by a finite table of models is a tame-regime phenomenon.
\end{corollary}
367 \begin{theorem}[Entropy cone for at most four regions]\label{thm:cone}
Fix $n \in \{2, 3, 4\}$ boundary regions of a conformal field theory with a smooth static classical Einstein dual. The holographic entropy cone $\mathcal{H}_n$ coincides with the polyhedral cone cut out by the RT inequalities, and these are exactly the strong subadditivity inequalities \eqref{eq:ssa} together with the monogamy-of-mutual-information inequalities \eqref{eq:mmi} in all their instances, including composite regions at $n = 4$. Monogamy is a three-region inequality: it is already facet-defining at $n = 3$ and is vacuous only at $n = 2$. For every fixed $n$ the number of independent RT inequalities is finite \cite{baoetal}.
\end{theorem}
377 \begin{proposition}[Monogamy is independent of strong subadditivity]\label{prop:mmi}
The monogamy-of-mutual-information inequality \eqref{eq:mmi} for three single regions is not implied by strong subadditivity \eqref{eq:ssa} over entropic vectors. An explicit witness is the entropy vector of a perfectly correlated triple, the standard counterexample of the holographic-entropy literature \cite{hhm,baoetal}: let $X$ be a uniform bit and set $A = B = C = X$. Then
\[
S(A) = S(B) = S(C) = S(AB) = S(AC) = S(BC) = S(ABC) = 1,
\]
all strong subadditivity inequalities \eqref{eq:ssa} hold, and \eqref{eq:mmi} is violated: the left side equals $4$ and the right side equals $3$.
\end{proposition}
389 \begin{corollary}[Classical correlations violate monogamy]\label{cor:classicalmmi}
The witness of \Cref{prop:mmi} is a classical random variable, so monogamy of mutual information is not valid for general quantum states, classical or otherwise. Its validity inside $\mathcal{H}_n$ is a property of minimal surfaces in classical Einstein gravity, not a property of entropy theory. The completeness of \Cref{thm:cone} needs the monogamy family in addition to strong subadditivity already at $n = 3$, because strong subadditivity alone leaves room for the witness.
\end{corollary}
397 \begin{proposition}[Two forms of monogamy]\label{prop:mmiform}
For three single regions, \eqref{eq:mmi} is equivalent to the information form
\[
I(A{:}B) + I(A{:}C) \le I(A{:}BC),
\]
and both are equivalent to the negativity statement that the tripartite information $I_3(A{:}B{:}C) = I(A{:}B) + I(A{:}C) - I(A{:}BC)$ is nonpositive.
\end{proposition}
409 \begin{lemma}[Strong subadditivity from subadditivity and monogamy]\label{lem:ssaredundant}
For three single regions, strong subadditivity follows from subadditivity together with monogamy of mutual information. At $n = 3$ the strong subadditivity family is therefore a consequence rather than an independent input. This argument covers three-region instances only: at $n = 2$ monogamy is vacuous, and at $n = 4$ the strong subadditivity instances involving four regions are not generated by three-region monogamy and remain independent inputs of \Cref{thm:cone}.
\end{lemma}
417 \begin{lemma}[The witness satisfies every other standard inequality]\label{lem:witnessclean}
The entropy vector of \Cref{prop:mmi} is nonnegative, is zero on $\emptyset$, and satisfies subadditivity, the Araki-Lieb bound, and strong subadditivity. It violates only \eqref{eq:mmi}. Hence the independence of \Cref{prop:mmi} is not caused by any other failure.
\end{lemma}
439 \begin{theorem}[Causal reconstruction of conformal geometry]\label{thm:malament}
Let $(M,g)$ and $(M',g')$ be time-oriented distinguishing spacetimes of dimension $n \ge 3$ and let $\varphi \colon M \to M'$ be a bijection preserving the chronological order: $p \prec q$ if and only if $\varphi(p) \prec' \varphi(q)$ for all $p, q$. Then $\varphi$ is a diffeomorphism and a conformal isometry. Consequently the chronological order determines the topology of $M$ and the conformal class $[g]$ of the metric \cite{malament,hkm}.
\end{theorem}
449 \begin{corollary}[The order does not fix the conformal factor]\label{cor:confactor}
No reconstruction of a metric from the chronological order alone can determine the conformal factor: distinct metrics $g$ and $e^{2f} g$ on the same manifold carry the same chronological order and are not isometric unless $f$ is constant. Recovering the conformal factor requires additional probe data, such as a volume form, a time function normalized by matter, or stress-energy data.
\end{corollary}
459 \begin{lemma}[The order determines the diamond topology]\label{lem:alexandrov}
The chronological order of a spacetime determines the open-diamond topology of A. D. Alexandrov: the sets $I^+(p) \cap I^-(q)$ form a basis whose lattice structure is a function of the order alone. This diamond topology coincides with the manifold topology exactly when the spacetime is strongly causal \cite{minguzzisanchez}, so on a strongly causal spacetime the order determines the topology of $M$ without reference to the metric.
\end{lemma}
467 \begin{proposition}[Finite orders recover their order from their topology]\label{prop:specialization}
Let $(X, \le)$ be a finite order and give $X$ the up-set topology of P. S. Alexandroff, whose open sets are the up-sets. Then $X$ is $T_0$, the closure of a singleton is its down-set $\mathrm{cl}(\{x\}) = \{ y : y \le x \}$, and the order is read off the topology by $x \le y$ if and only if $x \in \mathrm{cl}(\{y\})$.
\end{proposition}
477 \begin{theorem}[Entanglement-wedge reconstruction]\label{thm:dhw}
In the holographic correspondence, let $A$ be a boundary subregion of a code subspace of states with a smooth classical dual, and let $W(A)$ be its entanglement wedge. Bulk operators supported in $W(A)$ can be reconstructed as operators acting on $A$ alone, within the code subspace. The result is a theorem of quantum information theory: its hypotheses are stated in the language of quantum error correction and quantum relative entropy, and its proof combines the relative-entropy argument for subregions with the error-correcting structure of the correspondence \cite{dongharlowwall}.
\end{theorem}

FILE papers/latex/vol-09-gravity-information-geometry.tex
175 \begin{lemma}[Fisher metric and relative entropy]
\label{lem:kl}
Let $p$ be an interior point of the simplex and let $u$ be a tangent vector at $p$ with $\sum_i u_i = 0$. For the Kullback-Leibler divergence $D(p + u \,\|\, p) = \sum_i (p_i + u_i) \log \frac{p_i + u_i}{p_i}$ one has
\begin{equation}
D(p + u \,\|\, p) = \frac{1}{2} g_p(u, u) + O(\|u\|^3).
\end{equation}
The Fisher metric is the second-order term of the relative entropy at the diagonal.
\end{lemma}
191 \begin{proposition}[Monotonicity of the Fisher metric]
\label{prop:monotone}
The Fisher metric is monotone under stochastic maps.
\end{proposition}
221 \begin{theorem}[Chentsov]
\label{thm:chentsov}
On the probability simplices, the Fisher family is the unique family of Riemannian metrics, up to a single positive constant shared across dimensions, that is monotone under stochastic maps.
\end{theorem}
238 \begin{theorem}[Petz-Sud\'ar]
\label{thm:petz-sudar}
Monotone metric families $\{g^{(d)}\}_{d \geq 2}$ in the sense of \cref{def:quantum-monotone} correspond exactly to functions $f : (0, \infty) \to (0, \infty)$ that are operator monotone of all matrix orders and satisfy $f(t) = t f(1/t)$, by the formula \eqref{eq:petz} in each dimension \cite{petz-1996, petz-sudar-jmp}. The correspondence is a bijection after the normalization $f(1) = 1$, which is equivalent to restricting to the Fisher value on diagonal tangent vectors; without the normalization, metrics correspond to $f$ only up to a positive constant. In particular the symmetric logarithmic derivative metric of \cref{def:sld} corresponds to $f(t) = (1+t)/2$, and there are infinitely ma
245 \begin{proposition}[Non-uniqueness on qubit states]
\label{prop:nonunique}
Let $\rho = \operatorname{diag}(3/4, 1/4)$ and let $X = \sigma_x / 2$, $Y = \sigma_z / 2$ be the transverse and radial tangent vectors at $\rho$ in Bloch coordinates. For the symmetric logarithmic derivative metric,
\begin{equation}
g^{\mathrm{sld}}_{\rho}(X, X) = 1, \qquad g^{\mathrm{sld}}_{\rho}(Y, Y) = \frac{4}{3}.
\end{equation}
For the Wigner-Yanase metric, given by \eqref{eq:petz} with $f_{\mathrm{wy}}(t) = \tfrac{1}{4}(1 + \sqrt{t})^2$,
\begin{equation}
g^{\mathrm{wy}}_{\rho}(X, X) = 4(2 - \sqrt{3}), \qquad g^{\mathrm{wy}}_{\rho}(Y, Y) = \frac{4}{3}.
\end{equation}
The radial-to-transverse ratio is $4/3$ for the symmetric logarithmic derivative metric and $(2 
273 \begin{proposition}[Commutative locus]
\label{prop:commutative}
For every normalized operator monotone $f$ and every full-rank diagonal $\rho = \sum_i \lambda_i |i\rangle\langle i|$, the restriction of $g^{f}$ to diagonal tangent vectors is the Fisher value:
\begin{equation}
g^{f}_{\rho}(X, X) = \sum_i \frac{X_{ii}^2}{\lambda_i}.
\end{equation}
More generally the restriction of any monotone metric to commuting states is a classical monotone metric, hence $c \cdot g^{\mathrm{fisher}}$ for some $c > 0$ by Chentsov's theorem (\cref{thm:chentsov}); in the Petz family $c = 1/f(1)$, so the normalization $f(1) = 1$ forces $c = 1$. Every normalized monotone metric restricts to the Fisher metric on the commutative locus.
\end{proposition}
303 \begin{proposition}[Symmetric logarithmic derivative geometry of the qubit]
\label{prop:qubit-sld}
In Bloch coordinates the symmetric logarithmic derivative metric is
\begin{equation}
\label{eq:qubit-sld}
g^{\mathrm{sld}} = |d\vec{r}|^2 + \frac{(\vec{r} \cdot d\vec{r})^2}{1 - |\vec{r}|^2}.
\end{equation}
In spherical coordinates $|\vec{r}| = r = \sin\chi$ this becomes $g^{\mathrm{sld}} = (d\chi)^2 + \sin^2\!\chi \, (d\Omega)^2$ with $\chi \in (0, \pi/2)$: the open state space $\mathcal{D}_2^{\circ}$ is isometric to an open hemisphere of the round three-sphere of radius one, of constant sectional curvature one.
\end{proposition}
323 \begin{proposition}[Fidelity metric of the qubit]
\label{prop:qubit-fid}
On $\mathcal{D}_2^{\circ}$ the fidelity metric satisfies $g^{\mathrm{fid}} = \tfrac{1}{4} g^{\mathrm{sld}}$. Consequently the open state space with the fidelity metric is an open hemisphere of the round three-sphere of radius one half, of constant sectional curvature four.
\end{proposition}
352 \begin{corollary}[Fisher geometry of the full simplex]
\label{cor:homogeneity}
The Fisher metric on the interior of $\Delta_{n-1}$ is locally isometric to the round sphere of radius two, with sectional curvature $1/4$ for $n \geq 3$, and the arc of \cref{rem:bernoulli} for $n = 2$. The isometry group of the full model is the finite group of coordinate permutations. Two statistical models defined on the full simplex with the same number of outcomes are isometric as Riemannian manifolds, and a permutation of outcomes is an isometry.
\end{corollary}
393 \begin{theorem}[Gelfand-Naimark and Gelfand duality]
\label{thm:gelfand}
Every commutative unital $C^*$-algebra is isometrically $*$-isomorphic to $C(X)$ for a compact Hausdorff space $X$, its Gelfand spectrum; contravariantly, the categories of commutative unital $C^*$-algebras and of compact Hausdorff spaces are dual \cite{gn}. In particular the space $X$ is recovered from the algebra of observables $\mathcal{O} = C(X)$ alone.
\end{theorem}
398 \begin{theorem}[Stone duality]
\label{thm:stone}
Boolean algebras are dual to compact totally disconnected Hausdorff spaces \cite{stone}; the space is recovered from the algebra of clopen sets.
\end{theorem}
415 \begin{theorem}[Entanglement-wedge reconstruction, Dong-Harlow-Wall]
\label{thm:dhw}
Let a boundary region $A$ and a code subspace of states be given in the holographic setting, with bulk geometry dual to a state in that subspace. Every bulk operator localized in the entanglement wedge $W(A)$ can be reconstructed as an operator of the boundary subregion $A$ acting on the code subspace; the reconstruction preserves expectation values on that subspace \cite{dhw}. The result is a theorem of quantum information theory (quantum error correction and relative entropy), proved under the stated hypotheses of the holographic code setup.
\end{theorem}
451 \begin{theorem}[Holographic entropy cone]
\label{thm:cone}
In static holographic settings with $N$ boundary subregions of a state purified by a complement \cite{bao}, the complete linear entropy inequalities for $N = 2, 3, 4$ are generated by subadditivity, the Araki-Lieb inequalities, and monogamy of mutual information. For $N = 5$ five further symmetry orbits of five-party inequalities, including the cyclic five-party inequality, are required, and the resulting description is complete \cite{hc5}. For six and more regions the complete inequality set is unknown. For each fixed $N$ there are only finitely many independent inequalities.
\end{theorem}
470 \begin{proposition}[Ideal gas]
\label{prop:ideal-gas}
For the ideal gas with entropy $S(U, V, N) = Nk \bigl(c_v \log U + \log V - (c_v + 1) \log N + \text{const}\bigr)$ at fixed $N$ and heat capacity coefficient $c_v$, the Ruppeiner metric in the coordinates $(U, V)$ is
\begin{equation}
g^{\mathrm{rup}} = Nk \left( c_v \frac{(dU)^2}{U^2} + \frac{(dV)^2}{V^2} \right),
\end{equation}
which is flat: its scalar curvature vanishes identically.
\end{proposition}

FILE papers/latex/vol-11-completeness-obstructions.tex
212 \begin{lemma}[Countable invariants]
\label{lem:countable}
If the isomorphism relation on a domain $D$ admits no classification by countable invariants in the descriptive-set-theoretic sense, that is, if it is not Borel reducible to the isomorphism relation of any class of countable structures, then no complete invariant of $D$ takes values in a space of countable structures. If in addition $D$ has more than countably many isomorphism classes, then no complete invariant of $D$ takes values in a countable set.
\end{lemma}
329 \begin{theorem}[Obstruction transport]
\label{thm:transport}
Let $F: \mathcal{A} \to \mathcal{C}$ be fully faithful.
\begin{enumerate}
\item If $\mathcal{A}$ has uncountably many isomorphism classes, so does $\mathcal{C}$, and if no complete invariant of $\mathcal{A}$ takes values in a countable set, none for $\mathcal{C}$ does either. If $\mathcal{A}$ and $\mathcal{C}$ are categories of structures on standard Borel spaces of objects and $F$ acts Borel-measurably on those spaces, then classification of the isomorphism relation of $\mathcal{C}$ by countable structures implies the same for $\mathcal{A}$; hence non-classifiability by countable structures transports from $\mathcal{A}$ to $\mathcal{C}$.
\item If $\mathcal{A}$ carries a wild embe
344 \begin{corollary}[Wild embedding]
\label{cor:wild}
Let $\mathcal{C}$ be a category of representations admitting a fully faithful functor $F$ from the module category of a derived-wild finite-dimensional algebra. Then $\mathcal{C}$ carries a wild embedding, the essential image $F(\mathcal{A})$ admits no finite-variety parametrization of its isomorphism classes \cite{bekkert2003,buchweitz2005,grevstad2025}, and the same non-parametrization holds for any subcategory of $\mathcal{C}$ equivalent to that image.
\end{corollary}
351 \begin{corollary}[Operator-algebra consequence]
\label{cor:opalg}
Let $\mathcal{C}$ be the category of separable von Neumann algebras with normal *-homomorphisms as morphisms, taken with isomorphism as its equivalence. The separable $\mathrm{II}_1$ factors have uncountably many isomorphism classes \cite{mcduff1969}, so no complete invariant of $\mathcal{C}$ takes values in a countable set, and no atlas of countably many computable fingerprints can be complete for $\mathcal{C}$. The stronger statement holds: the isomorphism relation of $\mathcal{C}$ admits no classification by countable structures at all \cite{sasyk2009}.
\end{corollary}
364 \begin{proposition}[Undecidability transport]
\label{prop:undec}
Let $Q$ be a recognition problem for a class $\mathcal{C}$, and suppose there is a computable map $\varphi$ from finite group presentations to objects of $\mathcal{C}$ and a Markov property $P$ of finitely presentable groups such that a presentation $G$ has $P$ if and only if $\varphi(G)$ satisfies $Q$. Then $Q$ is algorithmically undecidable.
\end{proposition}
380 \begin{proposition}[No finite sporadic list]
\label{prop:sporadic}
The hypothesis that the isomorphism classes of a completed classification decompose into infinite families plus finitely many exceptional objects is false for the operator-algebra sector and for four-dimensional geometry. The separable $\mathrm{II}_1$ factors number uncountably many isomorphism classes \cite{mcduff1969}, and the four-dimensional maximal model geometries number eighteen plus one countably infinite family \cite{geometrization}.
\end{proposition}
389 \begin{proposition}[The two-regime picture fails]
\label{prop:tworegime}
The taxonomy that sorts domains into classified and impossible misassigns at least two surveyed domains. Unknot recognition is decidable and sits in NP and coNP, while its complexity class is open and no complete invariant is known \cite{hass1999,lackenby2021}. The finite simple groups are completely classified and carry no uniform parameterization \cite{solomon2001}. The first domain is decidable but unclassified; the second is classified but unparameterized. Neither fits a two-regime picture.
\end{proposition}
398 \begin{proposition}[Equivalence at the plain tensor layer fails]
\label{prop:equiv}
Let $\simeq_{\mathrm{pt}}$ be the relation on finite groups obtained by declaring $G \simeq_{\mathrm{pt}} H$ when their representation categories are equivalent as plain tensor categories. Then $\simeq_{\mathrm{pt}}$ is strictly coarser than isomorphism, so any classification of systems whose symmetry data is a finite group, conducted at the plain tensor layer, identifies distinct systems.
\end{proposition}
444 \begin{corollary}[Quantifier restriction]
\label{cor:restrict}
Under the hypotheses of \Cref{thm:transport}, a completeness statement for $\mathcal{C}$ in the sense of \Cref{def:program} is false. Under the hypotheses of \Cref{prop:undec}, a recognition statement for $\mathcal{C}$ in that sense is false. Any correct completeness or recognition statement about $\mathcal{C}$ restricts its quantifiers to a subdomain that excludes the part carrying the obstruction.
\end{corollary}

FILE papers/latex/vol-12-principia-physica.tex
265 \begin{theorem}[Survey: non-classification outside tame regimes, assembled from McDuff, Adyan-Rabin, the wildness results, Tancer, Etingof-Gelaki, and Grochow-Qiao]
\label{thm:obstructions}
The following classification objectives are forbidden by proved results. Separable type~$\mathrm{II}_1$ factors admit no total classification outside the amenable case, and their isomorphism relation admits no classification by countable invariants. Wild representation categories admit no finite-variety parameterization. Markov properties of finitely presented groups, including finiteness and simplicity, are algorithmically undecidable. Homeomorphism of compact four-manifolds is algorithmically unrecognizable in general. A finite group is not determined 
321 \begin{theorem}[Survey: necessity of the structure hypotheses, assembled from Etingof-Gelaki, Doplicher-Roberts, Stinespring, and the supermap results]
\label{thm:hypotheses}
Every registered realization or identification theorem fails or becomes open as soon as its structure hypotheses are dropped. In particular: plain tensor equivalence of representation categories does not determine the finite group; Doplicher-Roberts reconstruction requires the symmetric structure and its companion hypotheses; Stinespring data is a normal form and its Kraus rank is not an isomorphism invariant of channels; supermap representability requires channel-state duality. Consequently any identification of systems in the program must declare the layers of struct
345 \begin{theorem}[Survey: classical uniqueness and quantum parametricity, assembled from Chentsov and Petz-Sudar]
\label{thm:monotone}
The Fisher metric is the unique Riemannian metric, up to constant factor, that is monotone under stochastic maps. Quantum monotone metrics are classified by operator monotone functions, a parametric family containing more than one element. Classical uniqueness therefore does not extend to the quantum case, and any quantum distinguishability criterion must either select within the parametric family and justify the selection or carry the family as data.
\end{theorem}
426 \begin{proposition}[Completeness of the constituent record for two constructions]
\label{thm:conditional}
Let $P$ be an object assembled by one of two operations. In case (a) $P$ is a finite-dimensional complex $C^*$-algebra written as a direct sum $P \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$, with constituents classified by their block sizes. In case (b) $P$ is a group extension $1 \to N \to P \to Q \to 1$ with a fixed action of $Q$ on $N$, with $N$ and $Q$ classified up to isomorphism and the extension class $g_P$ recorded in $H^2(Q, Z(N))$. In case (a) the multiset of block sizes is a complete invariant of $P$ up to $*$-isomorphism. In case (b) the pair consisting of the invariant records of $N$ and $Q$ and the extension class $g_P$
455 \begin{lemma}[Uniqueness of the block decomposition]
\label{lem:blocks}
Every finite-dimensional complex $C^*$-algebra $A$ admits a decomposition $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ with the multiset $\{n_1, \ldots, n_k\}$ uniquely determined by $A$. For the example algebra the multiset is $\{1, 2\}$, and any decomposition into irreducible blocks realizes it.
\end{lemma}

exec
/usr/local/bin/zsh -lc "sed -n '228,246p' papers/latex/vol-04-yoneda-classification.tex; rg -n 'def count|theorem count_cons|count_cons |perm_iff_count' lean/.lake/packages/mathlib/.lake/packages/batteries/Batteries/Data/List lean/.lake/packages/batteries/Batteries/Data/List lean/.lake/packages/mathlib/Mathlib/Data/List/Defs.lean; rg -n 'map_list_prod|map_list_sum' lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group*" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:

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

rg: lean/.lake/packages/mathlib/.lake/packages/batteries/Batteries/Data/List: No such file or directory (os error 2)
lean/.lake/packages/batteries/Batteries/Data/List/Basic.lean:262:@[expose] def countPBefore (p : α → Bool) (xs : List α) (i : Nat) : Nat := go xs i 0 where
lean/.lake/packages/batteries/Batteries/Data/List/Basic.lean:277:@[expose] def countBefore [BEq α] (a : α) : List α → Nat → Nat :=
lean/.lake/packages/batteries/Batteries/Data/List/Perm.lean:247:    rw [perm_iff_count.mp this] at h
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/GroupWithZero/Action.lean:36:  map_list_sum (DistribSMul.toAddMonoidHom N r) l
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/GroupWithZero/Action.lean:45:  map_list_prod (MulDistribMulAction.toMonoidHom N r) l
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/List/Basic.lean:473:theorem map_list_prod {F : Type*} [FunLike F M N] [MonoidHomClass F M N] (f : F) (l : List M) :
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/List/Basic.lean:480:protected theorem map_list_prod (f : M →* N) (l : List M) : f l.prod = (l.map f).prod :=
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/List/Basic.lean:481:  map_list_prod f l
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/List/Basic.lean:492:  map_list_prod fr l
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/List/Lemmas.lean:211:lemma unop_map_list_prod {F : Type*} [FunLike F M Nᵐᵒᵖ] [MonoidHomClass F M Nᵐᵒᵖ]
lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/List/Lemmas.lean:214:  rw [map_list_prod f l, MulOpposite.unop_list_prod, List.map_map]

codex
The source review found two substantive specification problems in Vol10: the positive-domain injectivity issue, and classification equalities quantified beyond valid states and tangent vectors. I also confirmed that some generic helpers still duplicate Mathlib results. Type-checking is still running; no errors have been reported so far.
exec
/usr/local/bin/zsh -lc "python3 -c 'print(\"import Cmrps.Vol10ObservationalEquivalence\\nimport Cmrps.Vol04YonedaClassification\\nimport Cmrps.Vol07GaugeQft\\nopen Cmrps.Vol10\\nexample {n : ℕ} (f g : ℚ → ℚ) (h : ∀ x, 0 < x → f x = g x) (lam : Fin n → ℚ) (hp : ∀ i, 0 < lam i) (A : Fin n → Fin n → ℚ) : mcQuadratic f lam A = mcQuadratic g lam A := by\\n  unfold mcQuadratic mcTerm\\n  apply Finset.sum_congr rfl\\n  intro i _\\n  apply Finset.sum_congr rfl\\n  intro j _\\n  rw [h _ (div_pos (hp i) (hp j))]\\nexample {n : ℕ} (X : Cmrps.Vol04.M n) : X = ∑ i : Fin n, ∑ j : Fin n, X i j • Matrix.single i j (1 : ℂ) := by\\n  simpa only [Matrix.smul_single, smul_eq_mul, mul_one] using Matrix.matrix_eq_sum_single X\\nexample {R A : Type*} [AddCommGroup R] [AddCommGroup A] (d : Cmrps.Vol07.AnomalyData R A) (l : List R) : d.alpha l.sum = (l.map d.alpha).sum := by\\n  exact _root_.map_list_sum d.alpha l\\n#check List.count\\n#check List.perm_iff_count\\n\")' | lake env lean --stdin" in /Users/mlong/Documents/Development/classification-physical-systems/lean
exec
/usr/local/bin/zsh -lc "sed -n '465,482p' lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Group/List/Basic.lean; rg -n 'Cotangent|globality|semigroup|nullary|tensor.unit' papers/latex/vol-02-structural-families.tex papers/latex/vol-03-irreducibility-decomposition.tex; nl -ba lean/Cmrps/Vol04YonedaClassification.lean | sed -n '270,300p'; nl -ba lean/Cmrps/Vol07GaugeQft.lean | sed -n '200,221p'; nl -ba lean/Cmrps/Vol12PrincipiaPhysica.lean | sed -n '164,175p;330,351p'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:

end List

section MonoidHom

variable [Monoid M] [Monoid N]

@[to_additive]
theorem map_list_prod {F : Type*} [FunLike F M N] [MonoidHomClass F M N] (f : F) (l : List M) :
    f l.prod = (l.map f).prod :=
  (l.prod_hom f).symm

namespace MonoidHom

@[to_additive]
protected theorem map_list_prod (f : M →* N) (l : List M) : f l.prod = (l.map f).prod :=
  map_list_prod f l

papers/latex/vol-03-irreducibility-decomposition.tex:444:Let $S = \{M_{n_1}(\mathbb{C}), \dots, M_{n_k}(\mathbb{C})\}$ and let $\mathcal{C} = \{\oplus, \otimes\}$. The closure $\langle S \rangle_{\mathcal{C}}$ is the class of unital finite-dimensional complex C*-algebras whose dimension vector entries lie in the multiplicative semigroup generated by $n_1, \dots, n_k$ in $\mathbb{N}_{\geq 1}$.
papers/latex/vol-03-irreducibility-decomposition.tex:471:For $S = \{ \mathbb{C}, M_2(\mathbb{C}) \}$ under direct sum and tensor product, the multiplicative semigroup generated by $1$ and $2$ is $\{1, 2, 4, 8, \dots\}$, and the closure is the class of algebras whose dimension vectors have entries that are powers of two. The algebras $M_3(\mathbb{C})$ and $M_2(\mathbb{C}) \oplus M_3(\mathbb{C})$ are outside the closure. The enumeration of \cref{sec:computation} checks this arithmetic.
papers/latex/vol-03-irreducibility-decomposition.tex:474:The closure of a finite set of blocks under direct sum and tensor product is always infinite as a class, because tensor powers keep producing new sizes, and the closure is always decidable at the level of individual dimension vectors: entry size belongs to a finitely generated multiplicative semigroup of the positive integers, and membership in such a semigroup is decidable. The computability of the closure is a peculiarity of the finite-dimensional regime, where the constructions act on integer vectors; nothing here extends it to closure taken over the full admissible construction list of the framework section.
papers/latex/vol-03-irreducibility-decomposition.tex:594:The second artifact is a set of enumeration experiments in Python. One experiment enumerates dimension vectors of the closure of $\{\mathbb{C}, M_2(\mathbb{C})\}$ under direct sum and tensor product up to total dimension $64$ and checks the arithmetic of \cref{prop:construction-arithmetic}. It returns $1085$ dimension vectors, all of whose entries lie in the multiplicative semigroup $\{1, 2, 4, 8, 16, 32, 64\}$ generated by $1$ and $2$, and it confirms that $M_3(\mathbb{C})$ lies outside the closure. A second experiment enumerates multiplicity matrices for the three block pairs of \cref{tab:homs} and returns exactly $2$, $1$, and $6$ solutions, matching the conjugacy-class counts of the table entry by entry. A third computes Choi ranks of completely positive maps: for a random map of minimal rank $1$, presented Kraus families of sizes $1$, $2$, $3$, $5$, and $8$ all return Choi rank $1$ and reproduce the same map, while the identity channel and conjugation by the Pauli $Z$ operator both have rank $1$ and differ on the Pauli $X$ operator. The experiments run in seconds on ordinary hardware and record their seeds in the source.
papers/latex/vol-02-structural-families.tex:56:This paper develops the family-level taxonomy that a classification of mathematical representations of physical systems requires. Ten structural families organize mathematical structures capable of representing physical systems: symplectic and Poisson structures, Hilbert spaces and operator algebras, smooth manifolds and geometric structures, principal bundles and connections, probability and measure-theoretic structures, topological and higher-categorical structures, dynamical systems and operator semigroups, tensor categories and compositional structures, discrete combinatorial structures, and derived and homotopical structures. Each family is presented with its defining invariant, its classified islands, and its recorded obstructions. Four results govern how the taxonomy may be used. A sharpness criterion shows that a family admits a classification of a prescribed shape only when its classifying invariant takes values in a set of matching cardinality or geometric structure. A globality proposition shows that no local invariant classifies inside the symplectic family. A non-closure proposition shows that a class of objects irreducible under direct sum is not itself closed under direct sum. An independence proposition shows that two families may each carry a classifying invariant and still fail to be logically independent. The ten families are candidates for an organizing taxonomy and not a completed classification, and no completeness claim is made for them.
papers/latex/vol-02-structural-families.tex:65:Four results carry the argument. \Cref{thm:sharpness} bounds the shape of any classification by the shape of the classifying invariant: a family whose invariant takes values in a finite set has finitely many classes, a family with uncountably many classes admits no invariant into a countable set, and a family whose classes are the image of a morphism of finite type is parameterized by a constructible set. \Cref{prop:globality} shows that inside the symplectic family every local invariant is constant, so classification content there is global and topological. \Cref{prop:closure} shows that a class of objects irreducible under direct sum is never closed under direct sum, so passing to a closure always adds objects. \Cref{prop:independence} shows that two families may both carry classifying invariants and still fail to be logically independent.
papers/latex/vol-02-structural-families.tex:164:\label{prop:globality}
papers/latex/vol-02-structural-families.tex:177:\Cref{prop:globality} is the reason the symplectic row of the family tables below reads ``complete locally, with no local invariants''. Completeness of the local classification is a theorem, and its content is that there is nothing local to compute.
papers/latex/vol-02-structural-families.tex:198:The five kinds are realized in the families below. The Killing-Cartan and highest weight classifications are complete and parameterized \cite{lie,hw}. The finite simple groups are classified and not uniformly parameterized \cite{cfsg,solomon}. Anomalies are classified as obstructions to quantization \cite{anomaly}. General separable type $\mathrm{II}_1$ factors are impossible to classify \cite{vnalg}. Sectors with no record at all, such as the semigroup family, realize the fifth kind, and \Cref{prop:kinds} accounts for them rather than excluding them.
papers/latex/vol-02-structural-families.tex:230:Local data is empty by \Cref{prop:globality}. The equivalence in force is symplectomorphism of the total space. The record supplies a global invariant and not a classifying one, and it says so.
papers/latex/vol-02-structural-families.tex:318:The local picture is closed. Darboux's theorem gives a normal form and \Cref{prop:globality} extracts its classification consequence. For Poisson manifolds the local picture is also closed and it is not empty: near a point of rank $2k$ a Poisson manifold splits as a symplectic factor times a transverse Poisson factor \cite{poisson}. The symplectic leaves foliate the manifold, and on the dual of a Lie algebra the leaves of the Kirillov-Kostant-Souriau structure are the coadjoint orbits \cite{poisson}.
papers/latex/vol-02-structural-families.tex:437:\section{Family VII: dynamical systems and operator semigroups}
papers/latex/vol-02-structural-families.tex:440:This family represents dissipative and open systems. Its state spaces are spaces of states, its observables are operators or algebras, and its dynamics is a semigroup of maps or a generator.
papers/latex/vol-02-structural-families.tex:650:A classification theorem for the semigroup family & None on record & A classification with a stated scope \\
papers/latex/vol-02-structural-families.tex:671:VII & Operator semigroup or generator & None on record & No record & The Kraus form is a normal form, and rank is one scalar of it \\
papers/latex/vol-02-structural-families.tex:684:The four results set the terms of use. Classification shape follows invariant shape (\Cref{thm:sharpness}), classification in the symplectic family is global (\Cref{prop:globality}), a class of irreducibles is not closed under the admissible constructions (\Cref{prop:closure}), and classifying invariants do not establish independence between families (\Cref{prop:independence}). All four are proved here in full. The fourth is also a standing warning against reading the chart as a decomposition of mathematics.
   270	    (c : ℂ) (X : M n) :
   271	    (fun α β => ∑ i : Fin n, ∑ j : Fin n, (c • X) i j * J (i, α) (j, β)) =
   272	      c • (fun α β => ∑ i : Fin n, ∑ j : Fin n, X i j * J (i, α) (j, β)) := by
   273	  apply Matrix.ext
   274	  intro α β
   275	  simp only [smul_entry, mul_assoc, Finset.mul_sum, Pi.smul_apply, smul_eq_mul]
   276	
   277	/-- Inverse of the Choi assignment: `J ↦ (X ↦ (α, β) ↦ Σ_{i,j} X_{ij} J_{(i,α),(j,β)})`. -/
   278	def ofChoi {n m : ℕ} (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ) : M n →ₗ[ℂ] M m where
   279	  toFun X := fun α β => ∑ i : Fin n, ∑ j : Fin n, X i j * J (i, α) (j, β)
   280	  map_add' := ofChoi_add J
   281	  map_smul' := ofChoi_smul J
   282	
   283	/-- Every matrix is the linear combination `X = Σ_{i,j} X_{ij} • E_{ij}` of matrix units. -/
   284	theorem sum_single_smul {n : ℕ} (X : M n) :
   285	    X = ∑ i : Fin n, ∑ j : Fin n, X i j • Matrix.single i j (1 : ℂ) := by
   286	  apply Matrix.ext
   287	  intro a b
   288	  simp only [Matrix.sum_apply, smul_entry, Matrix.single_apply]
   289	  rw [Finset.sum_eq_single a]
   290	  · rw [Finset.sum_eq_single b]
   291	    · simp
   292	    · intro j _ hj
   293	      simp [hj]
   294	    · simp
   295	  · intro i _ hi
   296	    refine Finset.sum_eq_zero fun j _ => ?_
   297	    simp [hi]
   298	  · simp
   299	
   300	/-- Applying a linear map to `Y` expands entrywise along the matrix units. -/
   200	total anomaly of its members vanishes. -/
   201	def AnomalyFreeList (d : AnomalyData R A) (l : List R) : Prop :=
   202	  d.alpha l.sum = 0
   203	
   204	theorem map_list_sum (d : AnomalyData R A) (l : List R) :
   205	    d.alpha l.sum = (l.map d.alpha).sum := by
   206	  induction l with
   207	  | nil => simp
   208	  | cons x xs ih => simp [ih]
   209	
   210	theorem anomaly_free_list_iff_sum_map (d : AnomalyData R A) (l : List R) :
   211	    d.AnomalyFreeList l ↔ (l.map d.alpha).sum = 0 := by
   212	  simp [AnomalyFreeList, map_list_sum]
   213	
   214	/-- Proposition `prop:cancellation`: anomaly-free matter lists form the kernel of
   215	`alpha`, tested on the sum of the list. -/
   216	theorem anomaly_free_list_iff_mem_ker (d : AnomalyData R A) (l : List R) :
   217	    d.AnomalyFreeList l ↔ l.sum ∈ d.alpha.ker := by
   218	  simp [AnomalyFreeList]
   219	
   220	theorem anomaly_free_list_nil (d : AnomalyData R A) : d.AnomalyFreeList [] := by
   221	  simp [AnomalyFreeList]
   164	/-- Target 3: the twenty-nine rows map into exactly one regime each, with counts
   165	`15, 1, 1, 7, 3, 1, 1` over regimes 1 to 7. -/
   166	theorem RegimeAssignment :
   167	    countRegime .r1 spineRegimes = 15 ∧
   168	    countRegime .r2 spineRegimes = 1 ∧
   169	    countRegime .r3 spineRegimes = 1 ∧
   170	    countRegime .r4 spineRegimes = 7 ∧
   171	    countRegime .r5 spineRegimes = 3 ∧
   172	    countRegime .r6 spineRegimes = 1 ∧
   173	    countRegime .r7 spineRegimes = 1 := by
   174	  decide
   175	
   330	/-- Count of occurrences of `n` in a list of block sizes. -/
   331	def countNat (n : ℕ) : List ℕ → ℕ
   332	  | [] => 0
   333	  | x :: xs => (if x = n then 1 else 0) + countNat n xs
   334	
   335	/-- Two block-size lists determine the same block multiset. -/
   336	def SameBlocks (l₁ l₂ : List ℕ) : Prop := ∀ n, countNat n l₁ = countNat n l₂
   337	
   338	theorem sameBlocks_refl (l : List ℕ) : SameBlocks l l := fun _ => rfl
   339	
   340	theorem sameBlocks_symm {l₁ l₂ : List ℕ} (h : SameBlocks l₁ l₂) : SameBlocks l₂ l₁ :=
   341	  fun n => (h n).symm
   342	
   343	theorem sameBlocks_trans {l₁ l₂ l₃ : List ℕ} (h₁ : SameBlocks l₁ l₂)
   344	    (h₂ : SameBlocks l₂ l₃) : SameBlocks l₁ l₃ :=
   345	  fun n => (h₁ n).trans (h₂ n)
   346	
   347	/-! ## Target 8 — `ConditionalStructuralGeneration` (Definition 8.2, Proposition 8.3) -/
   348	
   349	/-- Definition 2.9: the structural invariant record. -/
   350	structure InvariantRecord (S O D G R : Type) where
   351	  states : S

 succeeded in 53578ms:
python3: warning: confstr() failed with code 5: couldn't get path of DARWIN_USER_TEMP_DIR; using /tmp instead
python3: error: couldn't create cache file '/tmp/xcrun_db-wFlQJBja' (errno=Operation not permitted)
2026-10-30 07:06:38.968 xcodebuild[44689:40821041]  DVTFilePathFSEvents: Failed to start fs event stream.
2026-10-30 07:06:39.078 xcodebuild[44689:40821027] [MT] DVTDeveloperPaths: Failed to get length of DARWIN_USER_CACHE_DIR from confstr(3), error = Error Domain=NSPOSIXErrorDomain Code=5 "Input/output error". Using NSCachesDirectory instead.
python3: warning: confstr() failed with code 5: couldn't get path of DARWIN_USER_TEMP_DIR; using /tmp instead
python3: error: couldn't create cache file '/tmp/xcrun_db-ZiFQejUk' (errno=Operation not permitted)
2026-10-30 07:06:39.578 xcodebuild[44707:40821099]  DVTFilePathFSEvents: Failed to start fs event stream.
2026-10-30 07:06:39.690 xcodebuild[44707:40821095] [MT] DVTDeveloperPaths: Failed to get length of DARWIN_USER_CACHE_DIR from confstr(3), error = Error Domain=NSPOSIXErrorDomain Code=5 "Input/output error". Using NSCachesDirectory instead.
List.count.{u} {α : Type u} [BEq α] (a : α) : List α → ℕ
List.perm_iff_count.{u_1} {α : Type u_1} [BEq α] [LawfulBEq α] {l₁ l₂ : List α} :
  l₁.Perm l₂ ↔ ∀ (a : α), List.count a l₁ = List.count a l₂

exec
/usr/local/bin/zsh -lc "nl -ba lean/Cmrps/Vol10ObservationalEquivalence.lean | sed -n '318,367p'; nl -ba lean/Cmrps/Vol12PrincipiaPhysica.lean | sed -n '150,165p'; sed -n '350,370p' papers/latex/vol-12-principia-physica.tex; sed -n '1,100p' lean/.lake/packages/mathlib/Mathlib/Algebra/BigOperators/Ring/Multiset.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
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
   349	`f(x) = x f(x⁻¹)` on the positive domain, and distinct such `f` give distinct metrics
   350	on self-adjoint directions at positive eigenvalues. `OperatorMonotone` is a parameter
   351	(predicate on parameter functions) because operator monotonicity is external to this
   352	module. The skeleton requires `n ≥ 2`, positive eigenvalues, and symmetric tangent
   353	directions, and compares parameter functions only through their positive-domain data
   354	(Codex review rounds 1–2). This is an unproved specification, NOT the paper's theorem. -/
   355	def petz_sudar_parametricity {n : ℕ}
   356	    (OperatorMonotone : (ℚ → ℚ) → Prop)
   357	    (monotone : ((Fin n → ℚ) → (Fin n → Fin n → ℚ) → ℚ) → Prop) : Prop :=
   358	  (2 ≤ n) ∧
   359	  (∀ f : ℚ → ℚ, NormalizedAtOne f → SelfReciprocal f → OperatorMonotone f →
   360	      monotone (fun lam A => mcQuadratic f lam A)) ∧
   361	    (∀ m, monotone m → ∃ f : ℚ → ℚ, NormalizedAtOne f ∧ SelfReciprocal f ∧ OperatorMonotone f ∧
   362	      ∀ lam : Fin n → ℚ, ∀ A : Fin n → Fin n → ℚ, m lam A = mcQuadratic f lam A) ∧
   363	    (∀ f g : ℚ → ℚ, SelfReciprocal f → SelfReciprocal g →
   364	      OperatorMonotone f → OperatorMonotone g → f ≠ g →
   365	      ∃ lam : Fin n → ℚ, ∃ A : Fin n → Fin n → ℚ,
   366	        (∀ i, 0 < lam i) ∧ (∀ i j, A i j = A j i) ∧
   367	        mcQuadratic f lam A ≠ mcQuadratic g lam A)
   150	  , ⟨"Finitely presented groups under Markov properties", .r6⟩
   151	  , ⟨"Wild representation categories", .r5⟩
   152	  , ⟨"Unknot recognition", .r7⟩ ]
   153	
   154	/-- The regime of each row, in table order. -/
   155	def spineRegimes : List Regime := spineTable.map (·.regime)
   156	
   157	/-- Number of rows assigned to a regime. -/
   158	def countRegime (r : Regime) : List Regime → ℕ
   159	  | [] => 0
   160	  | x :: xs => (if x = r then 1 else 0) + countRegime r xs
   161	
   162	theorem spine_row_count : spineTable.length = 29 := by decide
   163	
   164	/-- Target 3: the twenty-nine rows map into exactly one regime each, with counts
   165	`15, 1, 1, 7, 3, 1, 1` over regimes 1 to 7. -/
\begin{proof}
The first statement is Chentsov's theorem \cite{corpus-52}. The second is the Petz-Sudar classification \cite{corpus-52}. The parameterizing class of operator monotone functions contains more than one element; for instance the identity function and the affine function $f(x) = (x+1)/2$ are both operator monotone and give different metrics. The uniqueness statement is therefore false in the quantum case, and the last clause follows: a criterion that names a single quantum monotone metric makes an additional choice beyond the classification theorem.
\end{proof}

\Cref{thm:monotone} fixes what empirical distinguishability can borrow from information geometry. In the classical case the statistical distance is canonical. In the quantum case the statistical distance is a choice inside a proved parameterization, so an observational equivalence relation built on such distances must state the choice.

\subsection{Observational equivalence}

Two theories that differ as mathematical descriptions may be empirically indistinguishable in an accessible regime, so observational equivalence is a further quotient that the mathematical classification does not compute. Conversely an equivalence that forgets the monoidal or symmetric layer is too coarse to be a correct identification at all, because isocategorical groups refute it \cite{corpus-12}. Any observational criterion must therefore be fine enough to respect the preserved-structure requirement and coarse enough to quotient the empirically indistinguishable.

Formalizing that criterion needs an observation functor with four pieces of data: a domain of theories, a codomain of observational constraints or predictions, a composition rule with coarse-graining, and the induced equivalence classes of \cref{def:observational}. The record contains none of the four. Whether observational equivalence composes in interacting regimes is unstudied, and the positive question of what makes two descriptions one physical system is open: the isocategorical counterexample shows what is insufficient, and no reconstruction criterion for sameness exists.

\subsection{The claim register}

The empirical record of the realization layer is currently claim-dense, and the claim ladder keeps the rungs apart: announced, manuscript, verified, and accepted are different positions.

\begin{table}[htbp]
\caption{The five claim-ledger entries of the program registry, with ladder position at the status date of the registry. None is a theorem record.}
\label{tab:claims}
\small
\begin{tabularx}{\textwidth}{>{\hsize=0.25\hsize\raggedright\arraybackslash}X >{\hsize=1.23\hsize\raggedright\arraybackslash}X >{\hsize=1.52\hsize\raggedright\arraybackslash}X}
/-
Copyright (c) 2019 Chris Hughes. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Chris Hughes, Bhavik Mehta, Eric Wieser
-/
module

public import Mathlib.Algebra.BigOperators.Ring.List
public import Mathlib.Data.Multiset.Antidiagonal
public import Mathlib.Data.Multiset.Sections

/-! # Lemmas about `Multiset.sum` and `Multiset.prod` requiring extra algebra imports -/

public section


variable {ι M M₀ R : Type*}

namespace Multiset
section CommMonoid
variable [CommMonoid M] [HasDistribNeg M]

@[simp] lemma prod_map_neg (s : Multiset M) : (s.map Neg.neg).prod = (-1) ^ card s * s.prod :=
  Quotient.inductionOn s (by simp)

end CommMonoid

section CommMonoidWithZero
variable [CommMonoidWithZero M₀] {s : Multiset M₀}

lemma prod_eq_zero (h : (0 : M₀) ∈ s) : s.prod = 0 := by
  rcases Multiset.exists_cons_of_mem h with ⟨s', hs'⟩; simp [hs', Multiset.prod_cons]

variable [NoZeroDivisors M₀] [Nontrivial M₀] {s : Multiset M₀}

@[simp] lemma prod_eq_zero_iff : s.prod = 0 ↔ (0 : M₀) ∈ s :=
  Quotient.inductionOn s fun l ↦ by rw [quot_mk_to_coe, prod_coe]; exact List.prod_eq_zero_iff

lemma prod_ne_zero (h : (0 : M₀) ∉ s) : s.prod ≠ 0 := mt prod_eq_zero_iff.1 h

end CommMonoidWithZero

section NonUnitalNonAssocSemiring
variable [NonUnitalNonAssocSemiring R] {a : R} {s : Multiset ι} {f : ι → R}

lemma sum_map_mul_left : sum (s.map fun i ↦ a * f i) = a * sum (s.map f) :=
  Multiset.induction_on s (by simp) fun i s ih => by simp [ih, mul_add]

lemma sum_map_mul_right : sum (s.map fun i ↦ f i * a) = sum (s.map f) * a :=
  Multiset.induction_on s (by simp) fun a s ih => by simp [ih, add_mul]

end NonUnitalNonAssocSemiring

section NonUnitalSemiring
variable [NonUnitalSemiring R] {s : Multiset R} {a : R}

lemma dvd_sum : (∀ x ∈ s, a ∣ x) → a ∣ s.sum :=
  Multiset.induction_on s (fun _ ↦ dvd_zero _) fun x s ih h ↦ by
    rw [sum_cons]
    exact dvd_add (h _ (mem_cons_self _ _)) (ih fun y hy ↦ h _ <| mem_cons.2 <| Or.inr hy)

end NonUnitalSemiring

section CommSemiring
variable [CommSemiring R]

lemma prod_map_sum {s : Multiset (Multiset R)} :
    prod (s.map sum) = sum ((Sections s).map prod) :=
  Multiset.induction_on s (by simp) fun a s ih ↦ by
    simp [ih, map_bind, sum_map_mul_left, sum_map_mul_right]

lemma prod_map_add {s : Multiset ι} {f g : ι → R} :
    prod (s.map fun i ↦ f i + g i) =
      sum ((antidiagonal s).map fun p ↦ (p.1.map f).prod * (p.2.map g).prod) := by
  refine s.induction_on ?_ fun a s ih ↦ ?_
  · simp only [map_zero, prod_zero, antidiagonal_zero, map_singleton, mul_one, sum_singleton]
  · simp only [map_cons, prod_cons, ih, sum_map_mul_left.symm, add_mul, mul_left_comm (f a),
      mul_left_comm (g a), sum_map_add, antidiagonal_cons, Prod.map_fst, Prod.map_snd,
      id_eq, map_add, map_map, Function.comp_apply, mul_assoc, sum_add]
    exact add_comm _ _

end CommSemiring
end Multiset

open Multiset

namespace Commute

variable [NonUnitalNonAssocSemiring R] (s : Multiset R)

theorem multiset_sum_right (a : R) (h : ∀ b ∈ s, Commute a b) : Commute a s.sum := by
  induction s using Quotient.inductionOn
  rw [quot_mk_to_coe, sum_coe]
  exact Commute.list_sum_right _ _ h

theorem multiset_sum_left (b : R) (h : ∀ a ∈ s, Commute a b) : Commute s.sum b :=
  ((Commute.multiset_sum_right _ _) fun _ ha => (h _ ha).symm).symm

end Commute

exec
/usr/local/bin/zsh -lc "printf '%s\\n' 'import Cmrps.Vol10ObservationalEquivalence' 'open Cmrps.Vol10' 'def reviewF (x : ℚ) : ℚ := (1+x)/2' 'def reviewG (x : ℚ) : ℚ := if x = 0 then 0 else reviewF x' 'example : NormalizedAtOne reviewF ∧ NormalizedAtOne reviewG := by norm_num [NormalizedAtOne, reviewF, reviewG]' 'example : SelfReciprocal reviewF := by' '  intro x hx' '  dsimp [reviewF]' '  field_simp' '  ring' 'example : SelfReciprocal reviewG := by' '  intro x hx' '  have hx0 : x ≠ 0 := ne_of_gt hx' '  have hi0 : x⁻¹ ≠ 0 := inv_ne_zero hx0' '  simp only [reviewG, if_neg hx0, if_neg hi0, reviewF]' '  field_simp' '  ring' 'example : reviewF ≠ reviewG := by' '  intro h' '  have hh := congrFun h 0' '  norm_num [reviewF, reviewG] at hh' 'example {n : ℕ} (lam : Fin n → ℚ) (hp : ∀ i, 0 < lam i) (A : Fin n → Fin n → ℚ) : mcQuadratic reviewF lam A = mcQuadratic reviewG lam A := by' '  unfold mcQuadratic mcTerm' '  apply Finset.sum_congr rfl' '  intro i _' '  apply Finset.sum_congr rfl' '  intro j _' '  have h : lam i / lam j ≠ 0 := ne_of_gt (div_pos (hp i) (hp j))' '  simp only [reviewG, if_neg h]' | lake env lean --stdin" in /Users/mlong/Documents/Development/classification-physical-systems/lean
codex
Lean accepted both proposed Mathlib replacements: the matrix expansion follows from `Matrix.matrix_eq_sum_single`, and the anomaly sum lemma is an alias of `_root_.map_list_sum`. The full source checks are still running, with only lint warnings reported so far.
 succeeded in 52607ms:
<stdin>:15:22: warning: `if_neg` has been deprecated: Use `ite_eq_right` instead

Hint: Replace the deprecated name:
  i̵f̵_̵n̵e̵g̵i̲t̲e̲_̲e̲q̲_̲r̲i̲g̲h̲t̲
<stdin>:15:34: warning: `if_neg` has been deprecated: Use `ite_eq_right` instead

Hint: Replace the deprecated name:
  i̵f̵_̵n̵e̵g̵i̲t̲e̲_̲e̲q̲_̲r̲i̲g̲h̲t̲
<stdin>:29:22: warning: `if_neg` has been deprecated: Use `ite_eq_right` instead

Hint: Replace the deprecated name:
  i̵f̵_̵n̵e̵g̵i̲t̲e̲_̲e̲q̲_̲r̲i̲g̲h̲t̲

exec
/usr/local/bin/zsh -lc "rg -n 'Subsingleton|IsEmpty|empty' lean/.lake/packages/mathlib/Mathlib/CategoryTheory/Types/Basic.lean | head -25; rg -n 'single_le_sum|le_sum_of_mem' lean/.lake/packages/mathlib/Mathlib/Algebra/Order/BigOperators/Group/Multiset.lean; rg -n 'countRegime|countNat|sameBlocks' lean/Cmrps/Vol12PrincipiaPhysica.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
158:def countRegime (r : Regime) : List Regime → ℕ
160:  | x :: xs => (if x = r then 1 else 0) + countRegime r xs
167:    countRegime .r1 spineRegimes = 15 ∧
168:    countRegime .r2 spineRegimes = 1 ∧
169:    countRegime .r3 spineRegimes = 1 ∧
170:    countRegime .r4 spineRegimes = 7 ∧
171:    countRegime .r5 spineRegimes = 3 ∧
172:    countRegime .r6 spineRegimes = 1 ∧
173:    countRegime .r7 spineRegimes = 1 := by
331:def countNat (n : ℕ) : List ℕ → ℕ
333:  | x :: xs => (if x = n then 1 else 0) + countNat n xs
336:def SameBlocks (l₁ l₂ : List ℕ) : Prop := ∀ n, countNat n l₁ = countNat n l₂
338:theorem sameBlocks_refl (l : List ℕ) : SameBlocks l l := fun _ => rfl
340:theorem sameBlocks_symm {l₁ l₂ : List ℕ} (h : SameBlocks l₁ l₂) : SameBlocks l₂ l₁ :=
343:theorem sameBlocks_trans {l₁ l₂ l₃ : List ℕ} (h₁ : SameBlocks l₁ l₂)
432:    countNat 1 [1, 2] = 1 ∧
433:    countNat 2 [1, 2] = 1 ∧
434:    countNat 3 [1, 2] = 0 ∧
435:    countNat 1 [2, 1] = 1 ∧
436:    countNat 2 [2, 1] = 1 ∧
437:    countNat 3 [2, 1] = 0 := by

exec
/usr/local/bin/zsh -lc 'ls lean/.lake/build/lib/lean/Cmrps/*trace' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
lean/.lake/build/lib/lean/Cmrps/Vol01Foundations.trace
lean/.lake/build/lib/lean/Cmrps/Vol02StructuralFamilies.trace
lean/.lake/build/lib/lean/Cmrps/Vol03IrreducibilityDecomposition.trace
lean/.lake/build/lib/lean/Cmrps/Vol04YonedaClassification.trace
lean/.lake/build/lib/lean/Cmrps/Vol05ClassicalSystems.trace
lean/.lake/build/lib/lean/Cmrps/Vol06QuantumSystems.trace
lean/.lake/build/lib/lean/Cmrps/Vol07GaugeQft.trace
lean/.lake/build/lib/lean/Cmrps/Vol08SpacetimeReconstruction.trace
lean/.lake/build/lib/lean/Cmrps/Vol09GravityInformationGeometry.trace
lean/.lake/build/lib/lean/Cmrps/Vol10ObservationalEquivalence.trace
lean/.lake/build/lib/lean/Cmrps/Vol11CompletenessObstructions.trace
lean/.lake/build/lib/lean/Cmrps/Vol12PrincipiaPhysica.trace

codex
The counterexample is now checked by Lean: two normalized, self-reciprocal rational functions that differ only at zero give identical `mcQuadratic` values at every positive spectrum. This confirms that the remaining injectivity issue needs a change to the statement, despite the added dimension and symmetry conditions.
exec
/usr/local/bin/zsh -lc "rg -n 'upperSet.*[Tt]opology|[Tt]opology.*upperSet|isOpen_iff_isUpperSet|isOpen.*IsUpperSet|upper.*Alexandrov' lean/.lake/packages/mathlib/Mathlib/Topology/Order* lean/.lake/packages/mathlib/Mathlib/Topology/AlexandrovDiscrete.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
lean/.lake/packages/mathlib/Mathlib/Topology/Order/LawsonTopology.lean:188:  ⟨fun hs => IsScott.isOpen_iff_isUpperSet_and_scottHausdorff_open (D := univ).mpr
lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean:26:- `Topology.IsUpperSet.toAlexandrovDiscrete`: The upper set topology is Alexandrov-discrete.
lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean:35:* `Topology.upperSet`: The upper set topology as a `TopologicalSpace α`
lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean:43:The upper set topology is an Alexandrov topology and, given any Alexandrov topological space, we can
lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean:49:upper set topology, lower set topology, preorder, Alexandrov
lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean:67:  isOpen_inter _ _ := IsUpperSet.inter
lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean:194:  topology_eq_upperSetTopology : t = upperSet α
lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean:196:attribute [nolint docBlame] IsUpperSet.topology_eq_upperSetTopology
lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean:200:instance [Preorder α] : @Topology.IsUpperSet α (upperSet α) _ := by
lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean:226:lemma topology_eq : ‹_› = upperSet α := topology_eq_upperSetTopology
lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean:239:lemma isOpen_iff_isUpperSet : IsOpen s ↔ IsUpperSet s := by
lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean:244:  isOpen_sInter S := by simpa only [isOpen_iff_isUpperSet] using isUpperSet_sInter (α := α)
lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean:248:  rw [← isOpen_compl_iff, isOpen_iff_isUpperSet,
lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean:301:    simp_rw [continuous_def, isOpen_iff_isUpperSet]
lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean:312:  simp_rw [continuous_def, isOpen_iff_isUpperSet]
lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean:316:lemma upperSet_le_upper {t₁ t₂ : TopologicalSpace α} [@Topology.IsUpperSet α t₁ _]
lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean:318:  rw [@isOpen_iff_isUpperSet α _ t₁]
lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean:338:  topology_eq_upperSetTopology := by ext; rw [IsLowerSet.topology_eq α]
lean/.lake/packages/mathlib/Mathlib/Topology/Order/LowerUpperTopology.lean:415:theorem isUpperSet_of_isOpen (h : IsOpen s) : IsUpperSet s :=
lean/.lake/packages/mathlib/Mathlib/Topology/Order/ScottTopology.lean:191:lemma isOpen_iff_isUpperSet_and_scottHausdorff_open [IsScott α D] :
lean/.lake/packages/mathlib/Mathlib/Topology/Order/ScottTopology.lean:194:lemma isOpen_iff_isUpperSet_and_dirSupInaccOn [IsScott α D] :
lean/.lake/packages/mathlib/Mathlib/Topology/Order/ScottTopology.lean:196:  rw [isOpen_iff_isUpperSet_and_scottHausdorff_open (D := D)]
lean/.lake/packages/mathlib/Mathlib/Topology/Order/ScottTopology.lean:205:  rw [← isOpen_compl_iff, isOpen_iff_isUpperSet_and_dirSupInaccOn (D := univ), isUpperSet_compl,
lean/.lake/packages/mathlib/Mathlib/Topology/Order/ScottTopology.lean:208:lemma isUpperSet_of_isOpen [IsScott α D] : IsOpen s → IsUpperSet s := fun h ↦
lean/.lake/packages/mathlib/Mathlib/Topology/Order/ScottTopology.lean:209:  (isOpen_iff_isUpperSet_and_scottHausdorff_open (D := D).mp h).left
lean/.lake/packages/mathlib/Mathlib/Topology/Order/ScottTopology.lean:246:  · rw [isOpen_iff_isUpperSet_and_dirSupInaccOn (D := D)]
lean/.lake/packages/mathlib/Mathlib/Topology/Order/ScottTopology.lean:249:        (isOpen_iff_isUpperSet_and_dirSupInaccOn (D := univ).mp hu).2 trivial (Nonempty.image f hd₁)
lean/.lake/packages/mathlib/Mathlib/Topology/Order/ScottTopology.lean:257:    rw [isOpen_iff_isUpperSet_and_dirSupInaccOn (D := D)] at hu
lean/.lake/packages/mathlib/Mathlib/Topology/Order/ScottTopology.lean:367:lemma isOpen_iff_isUpperSet_and_scottHausdorff_open' {u : Set α} :

exec
/usr/local/bin/zsh -lc "sed -n '52,78p' lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean; sed -n '215,295p' lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean; sed -n '338,415p' lean/Cmrps/Vol08SpacetimeReconstruction.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
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

Note: In general the lower set topology does not coincide with the lower topology. -/
@[instance_reducible]
def lowerSet (α : Type*) [Preorder α] : TopologicalSpace α where
  IsOpen := IsLowerSet
  isOpen_univ := isLowerSet_univ
  isOpen_inter _ _ := IsLowerSet.inter
  isOpen_sUnion _ := isLowerSet_sUnion
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

/-- If `α` is equipped with the upper set topology, then it is homeomorphic to
`WithUpperSet α`. -/
def WithUpperSetHomeomorph : WithUpperSet α ≃ₜ α :=
  WithUpperSet.ofUpperSet.toHomeomorphOfIsInducing ⟨topology_eq α ▸ induced_id.symm⟩

lemma isOpen_iff_isUpperSet : IsOpen s ↔ IsUpperSet s := by
  rw [topology_eq α]
  rfl

instance toAlexandrovDiscrete : AlexandrovDiscrete α where
  isOpen_sInter S := by simpa only [isOpen_iff_isUpperSet] using isUpperSet_sInter (α := α)

-- c.f. isClosed_iff_lower_and_subset_implies_LUB_mem
lemma isClosed_iff_isLower : IsClosed s ↔ IsLowerSet s := by
  rw [← isOpen_compl_iff, isOpen_iff_isUpperSet,
    isLowerSet_compl.symm, compl_compl]

lemma closure_eq_lowerClosure {s : Set α} : closure s = lowerClosure s := by
  rw [subset_antisymm_iff]
  refine ⟨?_, lowerClosure_min subset_closure (isClosed_iff_isLower.1 isClosed_closure)⟩
  apply closure_minimal subset_lowerClosure _
  rw [isClosed_iff_isLower]
  exact LowerSet.lower (lowerClosure s)

/--
The closure of a singleton `{a}` in the upper set topology is the right-closed left-infinite
interval $(-∞,a]$.
-/
@[simp] lemma closure_singleton {a : α} : closure {a} = Iic a := by
  rw [closure_eq_lowerClosure, lowerClosure_singleton]
  rfl

lemma specializes_iff_le {a b : α} : a ⤳ b ↔ b ≤ a := by
  simp only [specializes_iff_closure_subset, closure_singleton, Iic_subset_Iic]

lemma nhdsKer_eq_upperClosure (s : Set α) : nhdsKer s = ↑(upperClosure s) := by
  ext; simp [mem_nhdsKer_iff_specializes, specializes_iff_le]

@[simp] lemma nhdsKer_singleton (a : α) : nhdsKer {a} = Ici a := by
  rw [nhdsKer_eq_upperClosure, upperClosure_singleton, UpperSet.coe_Ici]

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

exec
/usr/local/bin/zsh -lc "rg -n 'T0Space|PartialOrder' lean/.lake/packages/mathlib/Mathlib/Topology/Order/UpperLowerSetTopology.lean; nl -ba lean/Cmrps/Vol08SpacetimeReconstruction.lean | sed -n '357,390p'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   357	  have hinfo : MutualInfo S A B + MutualInfo S A C ≤ MutualInfo S A (B ∪ C) :=
   358	    (mmi_iff_information_form S A B C).1 hmmi
   359	  linarith
   360	
   361	/-! ## Up-set topology and specialization order (Proposition 9.4; target
   362	`specialization_order_recovery`) -/
   363	
   364	/-- The up-set (P. S. Alexandroff) topology of a preorder: the open sets are the
   365	upper sets (Definition 2 discussion and Proposition 9.4). -/
   366	def upSetTopology (α : Type*) [Preorder α] : TopologicalSpace α :=
   367	  TopologicalSpace.generateFrom {u | IsUpperSet u}
   368	
   369	theorem isUpperSet_of_isOpen {α : Type*} [Preorder α] {s : Set α}
   370	    (hs : IsOpen[upSetTopology α] s) : IsUpperSet s := by
   371	  have hs' : TopologicalSpace.GenerateOpen {u | IsUpperSet u} s := hs
   372	  induction hs' with
   373	  | basic u hu => exact hu
   374	  | univ => exact isUpperSet_univ
   375	  | inter u v hu hv ih1 ih2 => exact fun a b hab ha => ⟨ih1 hu hab ha.1, ih2 hv hab ha.2⟩
   376	  | sUnion S h ih => exact isUpperSet_sUnion fun t ht => ih t ht (h t ht)
   377	
   378	theorem isOpen_iff_isUpperSet {α : Type*} [Preorder α] {s : Set α} :
   379	    IsOpen[upSetTopology α] s ↔ IsUpperSet s :=
   380	  ⟨isUpperSet_of_isOpen, fun h => TopologicalSpace.isOpen_generateFrom_of_mem h⟩
   381	
   382	theorem isClosed_iff_isLowerSet {α : Type*} [Preorder α] {s : Set α} :
   383	    IsClosed[upSetTopology α] s ↔ IsLowerSet s := by
   384	  letI : TopologicalSpace α := upSetTopology α
   385	  constructor
   386	  · intro h
   387	    exact isUpperSet_compl.1 (isUpperSet_of_isOpen h.isOpen_compl)
   388	  · intro h
   389	    exact ⟨isOpen_iff_isUpperSet.2 (isUpperSet_compl.2 h)⟩
   390	

codex
I also found Mathlib’s upper-set topology implementation, including the open/closed-set characterizations and singleton-closure result that Vol08 reproves. That belongs in the remaining Mathlib-reuse finding. The two round-two aliases themselves are correct.
codex
Volumes 1–9 have completed type-checking without errors. The remaining checks cover Volumes 10–12 and the umbrella import. The review findings remain the two Vol10 specification issues and incomplete Mathlib reuse.
codex
The round-two scope fixes remain intact. The outstanding specification errors are in unproved `Prop` definitions, so they do not introduce unsound axioms or invalid proofs; they still need correction to match the paper’s domain. The final compiler checks have reported no errors so far.
exec
/usr/local/bin/zsh -lc "nl -ba papers/latex/vol-10-observational-equivalence.tex | sed -n '310,339p'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   310	\begin{proof}[Proof, by reference]
   311	The uniqueness statement is Chentsov's theorem, used here in the form stated and applied at \cite{b8}; the proof is a rigidity argument classifying monotone metrics on the classical simplex. This paper uses the statement as the classical anchor of distinguishability and does not reprove it.
   312	\end{proof}
   313	
   314	Concretely, on the open simplex of positive probability vectors $p = (p_1, \ldots, p_n)$, the Fisher form is
   315	\[
   316	g^{\mathrm{Fisher}}_p(a, a) = \sum_{i=1}^{n} \frac{a_i^2}{p_i}
   317	\]
   318	for tangent vectors $a$ with zero sum, and \Cref{thm:chentsov} says every monotone Riemannian metric on the simplex is a positive multiple of this form. The expression is the one that appears in \Cref{prop:commutative} as the commutative restriction of the quantum family: on commuting data the quantum metrics all give the classical answer.
   319	
   320	Classical statistical distance is therefore pinned down: any criterion that reads distinguishability from a monotone Riemannian metric on classical models must be a multiple of the Fisher metric. This is the one uniqueness result among the family of probability and measure-theoretic structures in the series taxonomy.
   321	
   322	\subsection{Quantum parametricity}
   323	
   324	In the quantum case the uniqueness fails. Monotone metrics on quantum state spaces are given by the Morozova-Chentsov construction indexed by operator monotone functions $f$ on the positive reals, normalized by $f(1) = 1$ and self-reciprocal in Petz's sense, $f(x) = x f(x^{-1})$; the self-reciprocity is the symmetry condition that makes the quadratic form well defined on self-adjoint tangent directions, and distinct self-reciprocal $f$ give distinct metrics.
   325	
   326	\begin{theorem}[Petz-Sud{\'a}r classification]
   327	\label{thm:petzsudar}
   328	Every quantum monotone metric arises from an operator monotone function $f$ with $f(1) = 1$ and $f(x) = x f(x^{-1})$ through the Morozova-Chentsov form, and distinct such $f$ give distinct metrics on self-adjoint directions. The family is parametric, not a finite list, and no member is distinguished among all monotone metrics.
   329	\end{theorem}
   330	
   331	\begin{proof}[Proof, by reference]
   332	The classification of monotone metrics by operator monotone functions is stated and applied at \cite{b8}, where the classical uniqueness and its quantum failure are contrasted. The self-reciprocity condition identifies each metric with a symmetric representative; without it, $f$ and its transpose $f^{\#}(x) = x f(x^{-1})$ yield the same quadratic form on self-adjoint operators and would be double counted. The parametric nature of the family is the reason the classical uniqueness statement may not be extended to the quantum case.
   333	\end{proof}
   334	
   335	Concretely, for a faithful density operator $\rho$ with eigenvalues $\lambda_i$ and a self-adjoint trace-free operator $A = \sum_{i,j} A_{ij} |i\rangle\langle j|$ in an eigenbasis of $\rho$, the quadratic form of the metric $g_f$ is
   336	\[
   337	g_f^{\rho}(A, A) \;=\; \sum_{i,j} \frac{|A_{ij}|^2}{\lambda_j \, f(\lambda_i / \lambda_j)}.
   338	\]
   339	

 succeeded in 678876ms:
Cmrps/Vol02StructuralFamilies.lean:147:2: warning: Try this: 
  haveI̵

The goal is a proposition, so `have` is preferred over `haveI`.
The difference between `have` and `haveI` is that `haveI` inlines the value.
But this is not relevant for proofs because of proof irrelevance.

Note: This linter can be disabled with `set_option linter.style.haveILetI false`
Cmrps/Vol02StructuralFamilies.lean:414:2: warning: Try this: 
  haveI̵

The goal is a proposition, so `have` is preferred over `haveI`.
The difference between `have` and `haveI` is that `haveI` inlines the value.
But this is not relevant for proofs because of proof irrelevance.

Note: This linter can be disabled with `set_option linter.style.haveILetI false`
Cmrps/Vol02StructuralFamilies.lean:570:0: warning: automatically included section variable(s) unused in theorem `Cmrps.Vol02.retraction_one`:
  [TopologicalSpace Q]
  [TopologicalSpace V]
  [ContinuousSMul ℝ V]
consider restructuring your `variable` declarations so that the variables are not in scope or explicitly omit them:
  omit [TopologicalSpace Q] [TopologicalSpace V] [ContinuousSMul ℝ V] in theorem ...

Note: This linter can be disabled with `set_option linter.unusedSectionVars false`
Cmrps/Vol02StructuralFamilies.lean:574:0: warning: automatically included section variable(s) unused in theorem `Cmrps.Vol02.retraction_comp`:
  [TopologicalSpace Q]
  [TopologicalSpace V]
  [ContinuousSMul ℝ V]
consider restructuring your `variable` declarations so that the variables are not in scope or explicitly omit them:
  omit [TopologicalSpace Q] [TopologicalSpace V] [ContinuousSMul ℝ V] in theorem ...

Note: This linter can be disabled with `set_option linter.unusedSectionVars false`
Cmrps/Vol02StructuralFamilies.lean:579:0: warning: automatically included section variable(s) unused in theorem `Cmrps.Vol02.retraction_fixes_zero_section`:
  [TopologicalSpace Q]
  [TopologicalSpace V]
  [ContinuousSMul ℝ V]
consider restructuring your `variable` declarations so that the variables are not in scope or explicitly omit them:
  omit [TopologicalSpace Q] [TopologicalSpace V] [ContinuousSMul ℝ V] in theorem ...

Note: This linter can be disabled with `set_option linter.unusedSectionVars false`
Cmrps/Vol02StructuralFamilies.lean:584:0: warning: automatically included section variable(s) unused in theorem `Cmrps.Vol02.retraction_zero_eq`:
  [TopologicalSpace Q]
  [TopologicalSpace V]
  [ContinuousSMul ℝ V]
consider restructuring your `variable` declarations so that the variables are not in scope or explicitly omit them:
  omit [TopologicalSpace Q] [TopologicalSpace V] [ContinuousSMul ℝ V] in theorem ...

Note: This linter can be disabled with `set_option linter.unusedSectionVars false`
Cmrps/Vol02StructuralFamilies.lean:635:0: warning: automatically included section variable(s) unused in theorem `Cmrps.Vol02.mem_closure`:
  [Zero α]
consider restructuring your `variable` declarations so that the variables are not in scope or explicitly omit them:
  omit [Zero α] in theorem ...

Note: This linter can be disabled with `set_option linter.unusedSectionVars false`
Cmrps/Vol02StructuralFamilies.lean:639:0: warning: automatically included section variable(s) unused in theorem `Cmrps.Vol02.subset_closure`:
  [Zero α]
consider restructuring your `variable` declarations so that the variables are not in scope or explicitly omit them:
  omit [Zero α] in theorem ...

Note: This linter can be disabled with `set_option linter.unusedSectionVars false`
Cmrps/Vol02StructuralFamilies.lean:640:11: warning: Variable name `C` is not explicitly referenced.

Hint: The binding can be removed (if unused) or named `_` (if used implicitly). Alternatively, prefix the name with `_` to silence this warning:
  [apply] _C

Note: This linter can be disabled with `set_option linter.unusedVariables false`
Cmrps/Vol02StructuralFamilies.lean:642:0: warning: automatically included section variable(s) unused in theorem `Cmrps.Vol02.closedUnder_closure`:
  [Zero α]
consider restructuring your `variable` declarations so that the variables are not in scope or explicitly omit them:
  omit [Zero α] in theorem ...

Note: This linter can be disabled with `set_option linter.unusedSectionVars false`
Cmrps/Vol02StructuralFamilies.lean:647:0: warning: automatically included section variable(s) unused in theorem `Cmrps.Vol02.closure_minimal`:
  [Zero α]
consider restructuring your `variable` declarations so that the variables are not in scope or explicitly omit them:
  omit [Zero α] in theorem ...

Note: This linter can be disabled with `set_option linter.unusedSectionVars false`
Cmrps/Vol08SpacetimeReconstruction.lean:210:18: warning: This simp argument is unused:
  zero_add

Hint: Omit it from the simp argument list.
  [apply] simp only [Set.union_empty, Set.inter_empty, correlatedTripleWitness_empty, add_zero]

Note: This linter can be disabled with `set_option linter.unusedSimpArgs false`
Cmrps/Vol08SpacetimeReconstruction.lean:364:0: warning: Definition `Cmrps.Vol08.upSetTopology` of class type is semireducible. Most type class instances should be instance-reducible, so consider marking this
definition with `@[instance_reducible]`. If it is intentionally semireducible, this warning can be disabled with `set_option warn.classDefReducibility false`.
Cmrps/Vol08SpacetimeReconstruction.lean:384:2: warning: Try this: 
  letI̵

The goal is a proposition, so `let` is preferred over `letI`.
The difference between `let` and `letI` is that `letI` inlines the value.
But this is not relevant for proofs because of proof irrelevance.

Note: This linter can be disabled with `set_option linter.style.haveILetI false`
Cmrps/Vol08SpacetimeReconstruction.lean:399:11: warning: `Set.mem_setOf` has been deprecated: Use `Set.mem_ofPred` instead

Hint: Replace the deprecated name:
  S̵e̵t̵.̵m̵e̵m̵_̵s̵e̵t̵O̵f̵S̲e̲t̲.̲m̲e̲m̲_̲o̲f̲P̲r̲e̲d̲
Cmrps/Vol08SpacetimeReconstruction.lean:402:11: warning: `Set.mem_setOf` has been deprecated: Use `Set.mem_ofPred` instead

Hint: Replace the deprecated name:
  S̵e̵t̵.̵m̵e̵m̵_̵s̵e̵t̵O̵f̵S̲e̲t̲.̲m̲e̲m̲_̲o̲f̲P̲r̲e̲d̲
Cmrps/Vol08SpacetimeReconstruction.lean:408:2: warning: Try this: 
  letI̵

The goal is a proposition, so `let` is preferred over `letI`.
The difference between `let` and `letI` is that `letI` inlines the value.
But this is not relevant for proofs because of proof irrelevance.

Note: This linter can be disabled with `set_option linter.style.haveILetI false`
Cmrps/Vol08SpacetimeReconstruction.lean:428:2: warning: Try this: 
  letI̵

The goal is a proposition, so `let` is preferred over `letI`.
The difference between `let` and `letI` is that `letI` inlines the value.
But this is not relevant for proofs because of proof irrelevance.

Note: This linter can be disabled with `set_option linter.style.haveILetI false`
Cmrps/Vol08SpacetimeReconstruction.lean:436:2: warning: Try this: 
  letI̵

The goal is a proposition, so `let` is preferred over `letI`.
The difference between `let` and `letI` is that `letI` inlines the value.
But this is not relevant for proofs because of proof irrelevance.

Note: This linter can be disabled with `set_option linter.style.haveILetI false`
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
Cmrps/Vol11CompletenessObstructions.lean:123:19: warning: Variable name `ρ` is not explicitly referenced.

Hint: The binding can be removed (if unused) or named `_` (if used implicitly). Alternatively, prefix the name with `_` to silence this warning:
  [apply] _ρ

Note: This linter can be disabled with `set_option linter.unusedVariables false`
Cmrps/Vol11CompletenessObstructions.lean:193:6: warning: Variable name `hcount` is not explicitly referenced.

Hint: The binding can be removed (if unused) or named `_` (if used implicitly). Alternatively, prefix the name with `_` to silence this warning:
  [apply] _hcount

Note: This linter can be disabled with `set_option linter.unusedVariables false`
Cmrps/Vol11CompletenessObstructions.lean:201:29: warning: Variable name `c` is not explicitly referenced.

Hint: The binding can be removed (if unused) or named `_` (if used implicitly). Alternatively, prefix the name with `_` to silence this warning:
  [apply] _c

Note: This linter can be disabled with `set_option linter.unusedVariables false`
Cmrps/Vol11CompletenessObstructions.lean:202:20: warning: Variable name `c` is not explicitly referenced.

Hint: The binding can be removed (if unused) or named `_` (if used implicitly). Alternatively, prefix the name with `_` to silence this warning:
  [apply] _c

Note: This linter can be disabled with `set_option linter.unusedVariables false`
Cmrps/Vol11CompletenessObstructions.lean:388:32: warning: Variable name `ρ` is not explicitly referenced.

Hint: The binding can be removed (if unused) or named `_` (if used implicitly). Alternatively, prefix the name with `_` to silence this warning:
  [apply] _ρ

Note: This linter can be disabled with `set_option linter.unusedVariables false`
Cmrps/Vol12PrincipiaPhysica.lean:1:0: warning: 
'Mathlib.Data.Real.Basic' has been deprecated: please replace this import by

import Mathlib.Basic.Real.Basic
Cmrps/Vol12PrincipiaPhysica.lean:255:2: warning: Try this: 
  letI̵

The goal is a proposition, so `let` is preferred over `letI`.
The difference between `let` and `letI` is that `letI` inlines the value.
But this is not relevant for proofs because of proof irrelevance.

Note: This linter can be disabled with `set_option linter.style.haveILetI false`
Cmrps/Vol12PrincipiaPhysica.lean:290:5: warning: Variable name `hE` is not explicitly referenced.

Hint: The binding can be removed (if unused) or named `_` (if used implicitly). Alternatively, prefix the name with `_` to silence this warning:
  [apply] _hE

Note: This linter can be disabled with `set_option linter.unusedVariables false`

codex
Three issues remain. All 12 modules and `Cmrps.lean` type-check successfully. I found no `sorry`, new axioms, incomplete patterns, or namespace correctness problems.

1. **Petz injectivity still compares functions outside their meaningful domain.**  
   [Vol10ObservationalEquivalence.lean:363](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol10ObservationalEquivalence.lean:363) uses `f ≠ g` on all rationals. Take `f(x) = (1+x)/2` and change only its value at zero to obtain `g`. Both are normalized and self-reciprocal on positive inputs, and have identical positive-domain operator-monotonicity properties. Nevertheless, the clause demands distinct metric values. Positive spectra only sample positive ratios, so their quadratic forms always coincide. I checked the distinctness, normalization, self-reciprocity, and equality of these forms in Lean.

   **Fix:** replace `f ≠ g` with `¬ Set.EqOn f g (Set.Ioi 0)`, or define parameter functions on the positive subtype. Round-two fix (1) is therefore incomplete.

2. **The classification specifications still quantify beyond valid states and tangent vectors.**  
   [Vol10ObservationalEquivalence.lean:324](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol10ObservationalEquivalence.lean:324) requires Fisher equality for every `p, a`; [line 362](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol10ObservationalEquivalence.lean:362) requires Petz equality for every `lam, A`. The paper restricts these statements to the open simplex and its tangents, or faithful density states and self-adjoint trace-free tangents.

   Changing a metric’s extension at the zero state leaves its physical-domain behavior unchanged, but can violate these unrestricted equalities: both formula implementations evaluate to zero at the zero state.

   **Fix:** restrict the equalities to positive normalized states and valid tangent vectors. For Petz, include symmetry and zero trace. For Chentsov, also represent compatibility across dimensions explicitly, as required by [the Vol05 statement](/Users/mlong/Documents/Development/classification-physical-systems/papers/latex/vol-05-classical-systems.tex:458). These are incorrect unproved specifications, rather than unsound proved theorems.

3. **Mathlib reuse remains incomplete beyond the two corrected aliases.**

   - [Vol08SpacetimeReconstruction.lean:366](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol08SpacetimeReconstruction.lean:366) reconstructs the upper-set topology and reproves its open/closed-set characterizations and singleton closure. Import `Mathlib.Topology.Order.UpperLowerSetTopology`, alias `Topology.upperSet`, and reuse `Topology.IsUpperSet.isOpen_iff_isUpperSet`, `isClosed_iff_isLower`, and `closure_singleton`.
   - [Vol04YonedaClassification.lean:284](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol04YonedaClassification.lean:284) reproves matrix-unit expansion. Replace its proof with `simpa only [Matrix.smul_single, smul_eq_mul, mul_one] using Matrix.matrix_eq_sum_single X`.
   - [Vol07GaugeQft.lean:204](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol07GaugeQft.lean:204) reproves preservation of list sums. Replace the induction with `exact _root_.map_list_sum d.alpha l`.

   Both proposed proof replacements were accepted by Lean.

Round-two fixes **(2)–(5) are verified**: the product-bundle limitation, germ-constancy scope, tensor-unit-adjoined closure documentation, and the two Mathlib aliases are present. `CategoryData` is accepted as the deliberately retained paper-facing model.

VERDICT: NEEDS_FIX
hook: Stop
hook: Stop Completed
tokens used
206,524
Three issues remain. All 12 modules and `Cmrps.lean` type-check successfully. I found no `sorry`, new axioms, incomplete patterns, or namespace correctness problems.

1. **Petz injectivity still compares functions outside their meaningful domain.**  
   [Vol10ObservationalEquivalence.lean:363](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol10ObservationalEquivalence.lean:363) uses `f ≠ g` on all rationals. Take `f(x) = (1+x)/2` and change only its value at zero to obtain `g`. Both are normalized and self-reciprocal on positive inputs, and have identical positive-domain operator-monotonicity properties. Nevertheless, the clause demands distinct metric values. Positive spectra only sample positive ratios, so their quadratic forms always coincide. I checked the distinctness, normalization, self-reciprocity, and equality of these forms in Lean.

   **Fix:** replace `f ≠ g` with `¬ Set.EqOn f g (Set.Ioi 0)`, or define parameter functions on the positive subtype. Round-two fix (1) is therefore incomplete.

2. **The classification specifications still quantify beyond valid states and tangent vectors.**  
   [Vol10ObservationalEquivalence.lean:324](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol10ObservationalEquivalence.lean:324) requires Fisher equality for every `p, a`; [line 362](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol10ObservationalEquivalence.lean:362) requires Petz equality for every `lam, A`. The paper restricts these statements to the open simplex and its tangents, or faithful density states and self-adjoint trace-free tangents.

   Changing a metric’s extension at the zero state leaves its physical-domain behavior unchanged, but can violate these unrestricted equalities: both formula implementations evaluate to zero at the zero state.

   **Fix:** restrict the equalities to positive normalized states and valid tangent vectors. For Petz, include symmetry and zero trace. For Chentsov, also represent compatibility across dimensions explicitly, as required by [the Vol05 statement](/Users/mlong/Documents/Development/classification-physical-systems/papers/latex/vol-05-classical-systems.tex:458). These are incorrect unproved specifications, rather than unsound proved theorems.

3. **Mathlib reuse remains incomplete beyond the two corrected aliases.**

   - [Vol08SpacetimeReconstruction.lean:366](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol08SpacetimeReconstruction.lean:366) reconstructs the upper-set topology and reproves its open/closed-set characterizations and singleton closure. Import `Mathlib.Topology.Order.UpperLowerSetTopology`, alias `Topology.upperSet`, and reuse `Topology.IsUpperSet.isOpen_iff_isUpperSet`, `isClosed_iff_isLower`, and `closure_singleton`.
   - [Vol04YonedaClassification.lean:284](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol04YonedaClassification.lean:284) reproves matrix-unit expansion. Replace its proof with `simpa only [Matrix.smul_single, smul_eq_mul, mul_one] using Matrix.matrix_eq_sum_single X`.
   - [Vol07GaugeQft.lean:204](/Users/mlong/Documents/Development/classification-physical-systems/lean/Cmrps/Vol07GaugeQft.lean:204) reproves preservation of list sums. Replace the induction with `exact _root_.map_list_sum d.alpha l`.

   Both proposed proof replacements were accepted by Lean.

Round-two fixes **(2)–(5) are verified**: the product-bundle limitation, germ-constancy scope, tensor-unit-adjoined closure documentation, and the two Mathlib aliases are present. `CategoryData` is accepted as the deliberately retained paper-facing model.

VERDICT: NEEDS_FIX
