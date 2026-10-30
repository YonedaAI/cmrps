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
