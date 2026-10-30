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
