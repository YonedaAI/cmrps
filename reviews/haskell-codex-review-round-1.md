---
reviewer: codex (OpenAI) gpt-6.1-sol
type: haskell
scope: cross-audit (src/ vs lean/)
round: 1
date: 2026-10-30T13:14:31Z
---
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
session id: 01a18cf2-ccf3-7fe0-a96f-a0e2cc7bfa1e
--------
user
Read the Haskell files under src/ and the Lean files under lean/ ONLY (do not explore other directories). Review for: (1) CROSS-AUDIT CONSISTENCY — every class in src/Taxonomy/ and every instance in src/<topic>/Instances.hs must mirror a Lean name in lean/; flag every name/type divergence and every claim in the Haskell layer that overstates its status (Haskell is computational evidence, never proof, never 'verified by Lean'); (2) no family class redefined outside src/Taxonomy/; (3) type safety, missing type signatures, incomplete patterns; (4) that Haskell comments do not overstate (no 'verified by Lean', no 'proof'). House rule: do NOT report dash-style or punctuation style nits. List issues with file:line references and concrete fixes. End your response with a VERDICT line — exactly one of: VERDICT: PASS or VERDICT: NEEDS_FIX.
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
I’ll read only the Haskell files under `src/` and Lean files under `lean/`, then check name and type correspondence, family class placement, type safety, and claims in comments.
exec
/usr/local/bin/zsh -lc "rg --files src lean -g '*.hs' -g '*.lean'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
lean/Cmrps.lean
src/vol-02-structural-families/Instances.hs
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
src/vol-06-quantum-systems/Instances.hs
src/vol-10-observational-equivalence/Instances.hs
src/vol-08-spacetime-reconstruction/Instances.hs
src/vol-05-classical-systems/Instances.hs
src/vol-07-gauge-qft/Instances.hs
src/vol-11-completeness-obstructions/Instances.hs
src/Taxonomy/Families.hs
src/Taxonomy/Equivalences.hs
src/Taxonomy/Invariants.hs
src/Taxonomy/Constructions.hs
src/vol-03-irreducibility-decomposition/Instances.hs
src/vol-09-gravity-information-geometry/Instances.hs
src/vol-04-yoneda-classification/Instances.hs
src/vol-12-principia-physica/Instances.hs
src/vol-01-foundations/Instances.hs
src/vol-01-foundations/Main.hs

exec
/usr/local/bin/zsh -lc 'wc -l src/Taxonomy/*.hs src/*/*.hs lean/*.lean lean/Cmrps/*.lean' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
     162 src/Taxonomy/Constructions.hs
     165 src/Taxonomy/Equivalences.hs
     253 src/Taxonomy/Families.hs
     366 src/Taxonomy/Invariants.hs
     162 src/Taxonomy/Constructions.hs
     165 src/Taxonomy/Equivalences.hs
     253 src/Taxonomy/Families.hs
     366 src/Taxonomy/Invariants.hs
     510 src/vol-01-foundations/Instances.hs
       9 src/vol-01-foundations/Main.hs
     555 src/vol-02-structural-families/Instances.hs
     286 src/vol-03-irreducibility-decomposition/Instances.hs
     341 src/vol-04-yoneda-classification/Instances.hs
     315 src/vol-05-classical-systems/Instances.hs
     347 src/vol-06-quantum-systems/Instances.hs
     313 src/vol-07-gauge-qft/Instances.hs
     287 src/vol-08-spacetime-reconstruction/Instances.hs
     294 src/vol-09-gravity-information-geometry/Instances.hs
     250 src/vol-10-observational-equivalence/Instances.hs
     274 src/vol-11-completeness-obstructions/Instances.hs
     212 src/vol-12-principia-physica/Instances.hs
      12 lean/Cmrps.lean
     808 lean/Cmrps/Vol01Foundations.lean
     805 lean/Cmrps/Vol02StructuralFamilies.lean
     345 lean/Cmrps/Vol03IrreducibilityDecomposition.lean
     403 lean/Cmrps/Vol04YonedaClassification.lean
     498 lean/Cmrps/Vol05ClassicalSystems.lean
     298 lean/Cmrps/Vol06QuantumSystems.lean
     306 lean/Cmrps/Vol07GaugeQft.lean
     477 lean/Cmrps/Vol08SpacetimeReconstruction.lean
     516 lean/Cmrps/Vol09GravityInformationGeometry.lean
     448 lean/Cmrps/Vol10ObservationalEquivalence.lean
     403 lean/Cmrps/Vol11CompletenessObstructions.lean
     440 lean/Cmrps/Vol12PrincipiaPhysica.lean
   11644 total

exec
/usr/local/bin/zsh -lc "rg -n '"'^|$'"' src/Taxonomy/*.hs" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
src/Taxonomy/Constructions.hs:1:{-# LANGUAGE TypeFamilies #-}
src/Taxonomy/Constructions.hs:2:
src/Taxonomy/Constructions.hs:3:-- | Module        : Taxonomy.Constructions
src/Taxonomy/Constructions.hs:4:-- Description     : Admissible constructions F, decomposition, irreducibility,
src/Taxonomy/Constructions.hs:5:--                   and closure under constructions.
src/Taxonomy/Constructions.hs:6:-- Ontology source : docs/ontology.md (DEF-013, DEF-021..DEF-024).
src/Taxonomy/Constructions.hs:7:--
src/Taxonomy/Constructions.hs:8:-- The admissible constructions F of DEF-023 (tensor product, direct sum,
src/Taxonomy/Constructions.hs:9:-- extension, limits and colimits, factorization) plus quotient /
src/Taxonomy/Constructions.hs:10:-- symmetry-reduction, encoded as a value-level vocabulary and as type-class
src/Taxonomy/Constructions.hs:11:-- hooks that later volumes instantiate. Each use of a construction must state
src/Taxonomy/Constructions.hs:12:-- the composition data it contributes to C (DEF-007); this module does not
src/Taxonomy/Constructions.hs:13:-- fix those data.
src/Taxonomy/Constructions.hs:14:--
src/Taxonomy/Constructions.hs:15:-- Claim status (docs/theorem-registry.md): vocabulary and hook shapes only.
src/Taxonomy/Constructions.hs:16:-- No construction is computed here and no proof is claimed. The structural
src/Taxonomy/Constructions.hs:17:-- generation statement (DEF-040) and the classification identity
src/Taxonomy/Constructions.hs:18:-- Phys_adm = <F>_C (DEF-041, T-CMRPS-01) are conjectural and are encoded only
src/Taxonomy/Constructions.hs:19:-- as data about what would have to be shown.
src/Taxonomy/Constructions.hs:20:module Taxonomy.Constructions
src/Taxonomy/Constructions.hs:21:  ( -- * Construction vocabulary (DEF-023)
src/Taxonomy/Constructions.hs:22:    Construction (..)
src/Taxonomy/Constructions.hs:23:  , ExtensionKind (..)
src/Taxonomy/Constructions.hs:24:  , LimitKind (..)
src/Taxonomy/Constructions.hs:25:  , QuotientKind (..)
src/Taxonomy/Constructions.hs:26:    -- * Construction hooks
src/Taxonomy/Constructions.hs:27:  , Constructible (..)
src/Taxonomy/Constructions.hs:28:    -- * Irreducibility and decomposition (DEF-021, DEF-022)
src/Taxonomy/Constructions.hs:29:  , Irreducible (..)
src/Taxonomy/Constructions.hs:30:  , Decomposition (..)
src/Taxonomy/Constructions.hs:31:  , Decomposable (..)
src/Taxonomy/Constructions.hs:32:    -- * Closure under constructions (DEF-024)
src/Taxonomy/Constructions.hs:33:  , Closure (..)
src/Taxonomy/Constructions.hs:34:  ) where
src/Taxonomy/Constructions.hs:35:
src/Taxonomy/Constructions.hs:36:import Taxonomy.Families (StructuralFamily)
src/Taxonomy/Constructions.hs:37:
src/Taxonomy/Constructions.hs:38:-- | DEF-023 — an admissible construction F: a permitted operation assembling
src/Taxonomy/Constructions.hs:39:-- systems from simpler ones. The canonical list for the series is tensor
src/Taxonomy/Constructions.hs:40:-- product, direct sum, extension (group, algebra, field-theoretic), limits and
src/Taxonomy/Constructions.hs:41:-- colimits (including the limiting procedures of DEF-013), and factorization
src/Taxonomy/Constructions.hs:42:-- (decomposition of a representation into factors). Quotient /
src/Taxonomy/Constructions.hs:43:-- symmetry-reduction is included as the vocabulary for reducing by symmetry
src/Taxonomy/Constructions.hs:44:-- data (DEF-006). Status: stipulative; each use must state the composition
src/Taxonomy/Constructions.hs:45:-- data it contributes to C (DEF-007).
src/Taxonomy/Constructions.hs:46:data Construction
src/Taxonomy/Constructions.hs:47:  = TensorProduct
src/Taxonomy/Constructions.hs:48:    -- ^ Tensor product of systems.
src/Taxonomy/Constructions.hs:49:  | DirectSum
src/Taxonomy/Constructions.hs:50:    -- ^ Direct sum of systems.
src/Taxonomy/Constructions.hs:51:  | Extension ExtensionKind
src/Taxonomy/Constructions.hs:52:    -- ^ Extension in the sense of DEF-023.
src/Taxonomy/Constructions.hs:53:  | Limit LimitKind
src/Taxonomy/Constructions.hs:54:    -- ^ Limit process (DEF-013, limit side).
src/Taxonomy/Constructions.hs:55:  | Colimit LimitKind
src/Taxonomy/Constructions.hs:56:    -- ^ Colimit process (DEF-013, colimit side).
src/Taxonomy/Constructions.hs:57:  | Factorization
src/Taxonomy/Constructions.hs:58:    -- ^ Factorization of a representation into factors (cf. direct-integral
src/Taxonomy/Constructions.hs:59:    -- decomposition into factors).
src/Taxonomy/Constructions.hs:60:  | Quotient QuotientKind
src/Taxonomy/Constructions.hs:61:    -- ^ Quotient or symmetry reduction.
src/Taxonomy/Constructions.hs:62:  deriving (Eq, Show)
src/Taxonomy/Constructions.hs:63:
src/Taxonomy/Constructions.hs:64:-- | DEF-023 — the extension kinds named in the canonical list.
src/Taxonomy/Constructions.hs:65:data ExtensionKind
src/Taxonomy/Constructions.hs:66:  = GroupExtension
src/Taxonomy/Constructions.hs:67:  | AlgebraExtension
src/Taxonomy/Constructions.hs:68:  | FieldTheoreticExtension
src/Taxonomy/Constructions.hs:69:  deriving (Eq, Ord, Show)
src/Taxonomy/Constructions.hs:70:
src/Taxonomy/Constructions.hs:71:-- | DEF-013 — limiting procedures named as morphism-level constructions:
src/Taxonomy/Constructions.hs:72:-- thermodynamic limit, infinite-volume limit, semiclassical limit, continuum
src/Taxonomy/Constructions.hs:73:-- limit. Continuum limits in constructive QFT are the load-bearing case;
src/Taxonomy/Constructions.hs:74:-- lattice theorems in restricted regimes do not by themselves close the
src/Taxonomy/Constructions.hs:75:-- continuum limit. Status: stipulative.
src/Taxonomy/Constructions.hs:76:data LimitKind
src/Taxonomy/Constructions.hs:77:  = ThermodynamicLimit
src/Taxonomy/Constructions.hs:78:  | InfiniteVolumeLimit
src/Taxonomy/Constructions.hs:79:  | SemiclassicalLimit
src/Taxonomy/Constructions.hs:80:  | ContinuumLimit
src/Taxonomy/Constructions.hs:81:  deriving (Eq, Ord, Show)
src/Taxonomy/Constructions.hs:82:
src/Taxonomy/Constructions.hs:83:-- | Quotient / symmetry-reduction kinds: reducing a system by symmetry data
src/Taxonomy/Constructions.hs:84:-- (DEF-006) or by gauge or constraint identification. Stipulative vocabulary.
src/Taxonomy/Constructions.hs:85:data QuotientKind
src/Taxonomy/Constructions.hs:86:  = SymmetryReduction
src/Taxonomy/Constructions.hs:87:  | GaugeQuotient
src/Taxonomy/Constructions.hs:88:  | ConstraintQuotient
src/Taxonomy/Constructions.hs:89:  deriving (Eq, Ord, Show)
src/Taxonomy/Constructions.hs:90:
src/Taxonomy/Constructions.hs:91:-- | DEF-023 — hook class for systems that admit the admissible constructions.
src/Taxonomy/Constructions.hs:92:-- Method semantics: 'Nothing' means the construction is not supplied for this
src/Taxonomy/Constructions.hs:93:-- system here; later volumes instantiate the hooks with their own data. No
src/Taxonomy/Constructions.hs:94:-- construction is computed by this package.
src/Taxonomy/Constructions.hs:95:class Constructible p where
src/Taxonomy/Constructions.hs:96:  -- | The type of systems produced by the binary constructions of 'p'.
src/Taxonomy/Constructions.hs:97:  type Composite p
src/Taxonomy/Constructions.hs:98:
src/Taxonomy/Constructions.hs:99:  -- | Tensor product (DEF-023). The result's composition data is whatever the
src/Taxonomy/Constructions.hs:100:  -- instance states (DEF-007).
src/Taxonomy/Constructions.hs:101:  tensorProduct :: p -> p -> Maybe (Composite p)
src/Taxonomy/Constructions.hs:102:
src/Taxonomy/Constructions.hs:103:  -- | Direct sum (DEF-023).
src/Taxonomy/Constructions.hs:104:  directSum :: p -> p -> Maybe (Composite p)
src/Taxonomy/Constructions.hs:105:
src/Taxonomy/Constructions.hs:106:  -- | Extension (DEF-023): group, algebra, or field-theoretic extension.
src/Taxonomy/Constructions.hs:107:  extend :: ExtensionKind -> p -> p -> Maybe (Composite p)
src/Taxonomy/Constructions.hs:108:
src/Taxonomy/Constructions.hs:109:  -- | Limit hook (DEF-013, DEF-023): the limit of a diagram of systems, when
src/Taxonomy/Constructions.hs:110:  -- the volume supplies one.
src/Taxonomy/Constructions.hs:111:  limitHook :: LimitKind -> [p] -> Maybe p
src/Taxonomy/Constructions.hs:112:
src/Taxonomy/Constructions.hs:113:  -- | Colimit hook (DEF-013, DEF-023): the colimit of a diagram of systems,
src/Taxonomy/Constructions.hs:114:  -- when the volume supplies one.
src/Taxonomy/Constructions.hs:115:  colimitHook :: LimitKind -> [p] -> Maybe p
src/Taxonomy/Constructions.hs:116:
src/Taxonomy/Constructions.hs:117:  -- | Quotient / symmetry reduction (DEF-006, DEF-023).
src/Taxonomy/Constructions.hs:118:  quotientReduction :: QuotientKind -> p -> Maybe p
src/Taxonomy/Constructions.hs:119:
src/Taxonomy/Constructions.hs:120:-- | DEF-021 — irreducibility: P admits no nontrivial decomposition under a
src/Taxonomy/Constructions.hs:121:-- specified composition operation. Irreducibility is always relative to C
src/Taxonomy/Constructions.hs:122:-- (DEF-007) and to the decomposition notion in force; an instance asserts
src/Taxonomy/Constructions.hs:123:-- irreducibility in exactly the sense its 'irreducibilityBasis' names. The
src/Taxonomy/Constructions.hs:124:-- class of irreducibles is J = {P : P is irreducible} (DEF-021). Status:
src/Taxonomy/Constructions.hs:125:-- stipulative.
src/Taxonomy/Constructions.hs:126:class Irreducible p where
src/Taxonomy/Constructions.hs:127:  -- | The composition operation (represented as the construction vocabulary)
src/Taxonomy/Constructions.hs:128:  -- relative to which p is irreducible.
src/Taxonomy/Constructions.hs:129:  irreducibilityBasis :: p -> Construction
src/Taxonomy/Constructions.hs:130:
src/Taxonomy/Constructions.hs:131:-- | DEF-022 — a decomposition P = F(I_1, ..., I_n) with each I_i irreducible
src/Taxonomy/Constructions.hs:132:-- (DEF-021) and F an admissible construction (DEF-023). Status: stipulative;
src/Taxonomy/Constructions.hs:133:-- uniqueness is open. Interacting physical systems need not admit unique
src/Taxonomy/Constructions.hs:134:-- decompositions — entanglement, emergence, gauge redundancy, and nontrivial
src/Taxonomy/Constructions.hs:135:-- interactions all complicate the notion — so existence and uniqueness claims
src/Taxonomy/Constructions.hs:136:-- belong only to carefully restricted subclasses.
src/Taxonomy/Constructions.hs:137:data Decomposition p = Decomposition
src/Taxonomy/Constructions.hs:138:  { decompositionConstruction :: Construction
src/Taxonomy/Constructions.hs:139:    -- ^ The construction F witnessing the decomposition (DEF-023).
src/Taxonomy/Constructions.hs:140:  , irreducibleFactors :: [p]
src/Taxonomy/Constructions.hs:141:    -- ^ The irreducible factors I_1 .. I_n (DEF-021).
src/Taxonomy/Constructions.hs:142:  }
src/Taxonomy/Constructions.hs:143:  deriving (Eq, Show)
src/Taxonomy/Constructions.hs:144:
src/Taxonomy/Constructions.hs:145:-- | DEF-022 — hook class for systems with a supplied decomposition.
src/Taxonomy/Constructions.hs:146:-- 'Nothing' means no decomposition is supplied here; it is not a claim that
src/Taxonomy/Constructions.hs:147:-- none exists.
src/Taxonomy/Constructions.hs:148:class Decomposable p where
src/Taxonomy/Constructions.hs:149:  decomposition :: p -> Maybe (Decomposition p)
src/Taxonomy/Constructions.hs:150:
src/Taxonomy/Constructions.hs:151:-- | DEF-024 — closure <F>_C: the class of objects generated from a family
src/Taxonomy/Constructions.hs:152:-- collection F under the admissible constructions C — the smallest class
src/Taxonomy/Constructions.hs:153:-- containing F and closed under C. The conjectural objective of the program is
src/Taxonomy/Constructions.hs:154:-- the identity Phys_adm = <F>_C (DEF-041, T-CMRPS-01, status conjecture); this
src/Taxonomy/Constructions.hs:155:-- record only names generators and constructions, and asserts no such identity.
src/Taxonomy/Constructions.hs:156:data Closure = Closure
src/Taxonomy/Constructions.hs:157:  { closureGenerators :: [StructuralFamily]
src/Taxonomy/Constructions.hs:158:    -- ^ The generating family collection F (DEF-025).
src/Taxonomy/Constructions.hs:159:  , closureConstructions :: [Construction]
src/Taxonomy/Constructions.hs:160:    -- ^ The constructions C under which closure is taken (DEF-023).
src/Taxonomy/Constructions.hs:161:  }
src/Taxonomy/Constructions.hs:162:  deriving (Eq, Show)
src/Taxonomy/Equivalences.hs:1:{-# LANGUAGE EmptyDataDecls #-}
src/Taxonomy/Equivalences.hs:2:
src/Taxonomy/Equivalences.hs:3:-- | Module        : Taxonomy.Equivalences
src/Taxonomy/Equivalences.hs:4:-- Description     : Equivalence and duality vocabulary for Phys: mathematical
src/Taxonomy/Equivalences.hs:5:--                   versus physical equivalence, morphism kinds, and the
src/Taxonomy/Equivalences.hs:6:--                   structure-preserving requirement.
src/Taxonomy/Equivalences.hs:7:-- Ontology source : docs/ontology.md (DEF-008..DEF-018, DEF-038).
src/Taxonomy/Equivalences.hs:8:--
src/Taxonomy/Equivalences.hs:9:-- The morphisms of Phys (DEF-008) are admissible relationships —
src/Taxonomy/Equivalences.hs:10:-- coarse-graining, exact equivalences, embeddings, dualities, and certain
src/Taxonomy/Equivalences.hs:11:-- limiting procedures — but their preservation laws and composition rules are
src/Taxonomy/Equivalences.hs:12:-- not fixed: until DEF-014 is fixed, Phys is a schema, not a category, and
src/Taxonomy/Equivalences.hs:13:-- each volume must state which morphism classes are in force.
src/Taxonomy/Equivalences.hs:14:--
src/Taxonomy/Equivalences.hs:15:-- Claim status (docs/theorem-registry.md): vocabulary only; no proof is
src/Taxonomy/Equivalences.hs:16:-- claimed and no formalisation is asserted.
src/Taxonomy/Equivalences.hs:17:module Taxonomy.Equivalences
src/Taxonomy/Equivalences.hs:18:  ( -- * Morphism kinds (DEF-008..DEF-013)
src/Taxonomy/Equivalences.hs:19:    MorphismKind (..)
src/Taxonomy/Equivalences.hs:20:  , PreservationLaw
src/Taxonomy/Equivalences.hs:21:    -- * Equivalence kinds (DEF-015, DEF-016)
src/Taxonomy/Equivalences.hs:22:  , EquivalenceKind (..)
src/Taxonomy/Equivalences.hs:23:  , MathematicalEquivalence (..)
src/Taxonomy/Equivalences.hs:24:  , PhysicalEquivalence (..)
src/Taxonomy/Equivalences.hs:25:  , EquivalenceWitness (..)
src/Taxonomy/Equivalences.hs:26:    -- * Structure-preserving requirement (DEF-018)
src/Taxonomy/Equivalences.hs:27:  , PreservedStructure (..)
src/Taxonomy/Equivalences.hs:28:  , RecoveryObstruction (..)
src/Taxonomy/Equivalences.hs:29:    -- * Yoneda vocabulary (DEF-017, DEF-038)
src/Taxonomy/Equivalences.hs:30:  , YonedaEmbedding
src/Taxonomy/Equivalences.hs:31:  ) where
src/Taxonomy/Equivalences.hs:32:
src/Taxonomy/Equivalences.hs:33:-- | DEF-008 — kinds of morphism of Phys: admissible relationships between
src/Taxonomy/Equivalences.hs:34:-- physical systems. The founding document names coarse-graining, exact
src/Taxonomy/Equivalences.hs:35:-- equivalences, embeddings, dualities, and certain limiting procedures; these
src/Taxonomy/Equivalences.hs:36:-- are not automatically compatible as ordinary categorical morphisms, and
src/Taxonomy/Equivalences.hs:37:-- whether one category suffices is open (DEF-008).
src/Taxonomy/Equivalences.hs:38:data MorphismKind
src/Taxonomy/Equivalences.hs:39:  = CoarseGraining
src/Taxonomy/Equivalences.hs:40:    -- ^ DEF-009 — forgets microscopic detail while preserving macroscopic
src/Taxonomy/Equivalences.hs:41:    -- observables. Which observables lift and which states are identified must
src/Taxonomy/Equivalences.hs:42:    -- be fixed per application.
src/Taxonomy/Equivalences.hs:43:  | EquivalenceMorphism
src/Taxonomy/Equivalences.hs:44:    -- ^ DEF-010 — an invertible morphism representing exact equivalence of
src/Taxonomy/Equivalences.hs:45:    -- representations; induces the relation of DEF-015 on objects.
src/Taxonomy/Equivalences.hs:46:  | Embedding
src/Taxonomy/Equivalences.hs:47:    -- ^ DEF-011 — realizes P_1 as a subsystem, subtheory, or substructure of
src/Taxonomy/Equivalences.hs:48:    -- P_2 (e.g. Gelfand-Naimark embeds every C*-algebra in B(H) — a
src/Taxonomy/Equivalences.hs:49:    -- representation theorem, not a classification).
src/Taxonomy/Equivalences.hs:50:  | Duality
src/Taxonomy/Equivalences.hs:51:    -- ^ DEF-012 — generally invertible only after passage to an appropriate
src/Taxonomy/Equivalences.hs:52:    -- opposite or dual category; must state which structure it preserves
src/Taxonomy/Equivalences.hs:53:    -- (DEF-018).
src/Taxonomy/Equivalences.hs:54:  | LimitingProcedure
src/Taxonomy/Equivalences.hs:55:    -- ^ DEF-013 — arises from a limit or colimit process: thermodynamic,
src/Taxonomy/Equivalences.hs:56:    -- infinite-volume, semiclassical, continuum. See Taxonomy.Constructions
src/Taxonomy/Equivalences.hs:57:    -- for the construction vocabulary.
src/Taxonomy/Equivalences.hs:58:  deriving (Eq, Ord, Show)
src/Taxonomy/Equivalences.hs:59:
src/Taxonomy/Equivalences.hs:60:-- | DEF-014 — the explicitly stated conditions a morphism of a given kind must
src/Taxonomy/Equivalences.hs:61:-- satisfy, and the composition rule under which two such morphisms compose.
src/Taxonomy/Equivalences.hs:62:-- Stub: the law is left abstract on purpose. Status: open — until it is fixed,
src/Taxonomy/Equivalences.hs:63:-- Phys is a schema, not a category (DEF-014).
src/Taxonomy/Equivalences.hs:64:data PreservationLaw
src/Taxonomy/Equivalences.hs:65:
src/Taxonomy/Equivalences.hs:66:-- | The two equivalence notions of the series (DEF-015, DEF-016), kept
src/Taxonomy/Equivalences.hs:67:-- strictly apart: mathematical equivalence is finer than physical equivalence
src/Taxonomy/Equivalences.hs:68:-- in general.
src/Taxonomy/Equivalences.hs:69:data EquivalenceKind
src/Taxonomy/Equivalences.hs:70:  = ByMathematicalEquivalence
src/Taxonomy/Equivalences.hs:71:    -- ^ DEF-016 — isomorphism of the tuples P = (X, O, D, S, C) in the ambient
src/Taxonomy/Equivalences.hs:72:    -- category of each component.
src/Taxonomy/Equivalences.hs:73:  | ByPhysicalEquivalence
src/Taxonomy/Equivalences.hs:74:    -- ^ DEF-015 — the chosen physical equivalence relation; the choice itself
src/Taxonomy/Equivalences.hs:75:    -- is open and is essential to the classification problem.
src/Taxonomy/Equivalences.hs:76:  deriving (Eq, Ord, Show)
src/Taxonomy/Equivalences.hs:77:
src/Taxonomy/Equivalences.hs:78:-- | DEF-016 — mathematical equivalence: isomorphism of the representations
src/Taxonomy/Equivalences.hs:79:-- P = (X, O, D, S, C) in the ambient category of each component. Established
src/Taxonomy/Equivalences.hs:80:-- as a notion; strictly finer than physical equivalence in general.
src/Taxonomy/Equivalences.hs:81:class MathematicalEquivalence p where
src/Taxonomy/Equivalences.hs:82:  -- | Hook: whether two representations are isomorphic as tuples. Instances
src/Taxonomy/Equivalences.hs:83:  -- state the ambient categories in force; nothing is decided here.
src/Taxonomy/Equivalences.hs:84:  mathematicallyEquivalent :: p -> p -> Bool
src/Taxonomy/Equivalences.hs:85:
src/Taxonomy/Equivalences.hs:86:-- | DEF-015 — physical equivalence: a carefully chosen equivalence relation on
src/Taxonomy/Equivalences.hs:87:-- Ob(Phys); the classification problem is Classify(Ob(Phys)/≃). The choice is
src/Taxonomy/Equivalences.hs:88:-- essential: two mathematical descriptions may be physically equivalent
src/Taxonomy/Equivalences.hs:89:-- without being mathematically isomorphic. Status: stipulative; the choice is
src/Taxonomy/Equivalences.hs:90:-- open.
src/Taxonomy/Equivalences.hs:91:class PhysicalEquivalence p where
src/Taxonomy/Equivalences.hs:92:  -- | Hook: whether two systems are physically equivalent under the relation
src/Taxonomy/Equivalences.hs:93:  -- the instance declares. The relation must be stated, not assumed.
src/Taxonomy/Equivalences.hs:94:  physicallyEquivalent :: p -> p -> Bool
src/Taxonomy/Equivalences.hs:95:
src/Taxonomy/Equivalences.hs:96:-- | A record of a proposed identification of systems: which equivalence notion
src/Taxonomy/Equivalences.hs:97:-- is used, by what kind of morphism, and — per DEF-018 — exactly which layers
src/Taxonomy/Equivalences.hs:98:-- of structure the identification preserves. An identification that does not
src/Taxonomy/Equivalences.hs:99:-- name its preserved structure is not admissible in the series (DEF-018).
src/Taxonomy/Equivalences.hs:100:data EquivalenceWitness p q = EquivalenceWitness
src/Taxonomy/Equivalences.hs:101:  { equivalenceKind :: EquivalenceKind
src/Taxonomy/Equivalences.hs:102:    -- ^ DEF-015 or DEF-016 — which equivalence notion is in force.
src/Taxonomy/Equivalences.hs:103:  , equivalenceMorphismKind :: MorphismKind
src/Taxonomy/Equivalences.hs:104:    -- ^ DEF-008 — the morphism kind realizing the identification.
src/Taxonomy/Equivalences.hs:105:  , preservedStructure :: [PreservedStructure]
src/Taxonomy/Equivalences.hs:106:    -- ^ DEF-018 — the layers of structure preserved; must be stated.
src/Taxonomy/Equivalences.hs:107:  , equivalenceSource :: p
src/Taxonomy/Equivalences.hs:108:    -- ^ The source system P_1.
src/Taxonomy/Equivalences.hs:109:  , equivalenceTarget :: q
src/Taxonomy/Equivalences.hs:110:    -- ^ The target system P_2.
src/Taxonomy/Equivalences.hs:111:  }
src/Taxonomy/Equivalences.hs:112:  deriving (Eq, Show)
src/Taxonomy/Equivalences.hs:113:
src/Taxonomy/Equivalences.hs:114:-- | DEF-018 — layers of structure an equivalence may claim to preserve. The
src/Taxonomy/Equivalences.hs:115:-- Etingof-Gelaki constraint: any equivalence used to identify systems must
src/Taxonomy/Equivalences.hs:116:-- state which layer it preserves, and equivalences that forget the
src/Taxonomy/Equivalences.hs:117:-- monoidal/symmetric layer are provably insufficient. Status: established as a
src/Taxonomy/Equivalences.hs:118:-- negative theorem (T-OB-02, complete-informal-proof).
src/Taxonomy/Equivalences.hs:119:data PreservedStructure
src/Taxonomy/Equivalences.hs:120:  = SymmetricMonoidalStructure
src/Taxonomy/Equivalences.hs:121:    -- ^ The symmetric monoidal layer (the load-bearing layer).
src/Taxonomy/Equivalences.hs:122:  | MonoidalStructure
src/Taxonomy/Equivalences.hs:123:    -- ^ The monoidal layer without symmetry.
src/Taxonomy/Equivalences.hs:124:  | BraidedStructure
src/Taxonomy/Equivalences.hs:125:    -- ^ The braided layer (cf. Mueger's Galois theory, which needs extra
src/Taxonomy/Equivalences.hs:126:    -- soliton data beyond braiding).
src/Taxonomy/Equivalences.hs:127:  | PlainTensorStructure
src/Taxonomy/Equivalences.hs:128:    -- ^ The plain tensor layer only — provably insufficient to recover the
src/Taxonomy/Equivalences.hs:129:    -- group (see 'TensorEquivalenceWithoutSymmetricStructure').
src/Taxonomy/Equivalences.hs:130:  | StarStructure
src/Taxonomy/Equivalences.hs:131:    -- ^ The *-structure of operator-algebraic data.
src/Taxonomy/Equivalences.hs:132:  | AlgebraicStructure
src/Taxonomy/Equivalences.hs:133:    -- ^ Algebraic structure (e.g. *-algebra isomorphism).
src/Taxonomy/Equivalences.hs:134:  | TopologicalStructure
src/Taxonomy/Equivalences.hs:135:    -- ^ Topological structure.
src/Taxonomy/Equivalences.hs:136:  | CompletePositivity
src/Taxonomy/Equivalences.hs:137:    -- ^ Complete positivity of channels (Stinespring equivalence, up to
src/Taxonomy/Equivalences.hs:138:    -- unitary freedom).
src/Taxonomy/Equivalences.hs:139:  | UnitaryFreedom
src/Taxonomy/Equivalences.hs:140:    -- ^ Unitary freedom of minimal dilations.
src/Taxonomy/Equivalences.hs:141:  deriving (Eq, Ord, Show)
src/Taxonomy/Equivalences.hs:142:
src/Taxonomy/Equivalences.hs:143:-- | DEF-018 / T-OB-02 — recorded failures of recovery. Isocategorical groups:
src/Taxonomy/Equivalences.hs:144:-- non-isomorphic finite groups can carry equivalent representation categories
src/Taxonomy/Equivalences.hs:145:-- as plain tensor categories, so any equivalence that forgets the symmetric
src/Taxonomy/Equivalences.hs:146:-- layer cannot recover the group and any classification built on such an
src/Taxonomy/Equivalences.hs:147:-- equivalence is false (Etingof-Gelaki; periodic-table region (f),
src/Taxonomy/Equivalences.hs:148:-- IMPOSSIBLE as a recovery principle).
src/Taxonomy/Equivalences.hs:149:data RecoveryObstruction
src/Taxonomy/Equivalences.hs:150:  = TensorEquivalenceWithoutSymmetricStructure
src/Taxonomy/Equivalences.hs:151:  deriving (Eq, Ord, Show)
src/Taxonomy/Equivalences.hs:152:
src/Taxonomy/Equivalences.hs:153:-- | DEF-038 — the Yoneda embedding P -> Hom_Phys(-, P), a faithful
src/Taxonomy/Equivalences.hs:154:-- mathematical representation of objects of a locally small Phys through their
src/Taxonomy/Equivalences.hs:155:-- relationships. Established mathematics; the physical interpretation is open.
src/Taxonomy/Equivalences.hs:156:-- The representation itself is left abstract here.
src/Taxonomy/Equivalences.hs:157:--
src/Taxonomy/Equivalences.hs:158:-- DEF-017 — the Yoneda qualification, quoted verbatim from the founding
src/Taxonomy/Equivalences.hs:159:-- document (§5) and binding on every volume:
src/Taxonomy/Equivalences.hs:160:-- "Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem."
src/Taxonomy/Equivalences.hs:161:-- The categorical structure must be given a physical interpretation
src/Taxonomy/Equivalences.hs:162:-- separately; nothing in this module treats representability as physical
src/Taxonomy/Equivalences.hs:163:-- equivalence.
src/Taxonomy/Equivalences.hs:164:data YonedaEmbedding
src/Taxonomy/Equivalences.hs:165:  deriving (Eq, Show)
src/Taxonomy/Families.hs:1:{-# LANGUAGE TypeFamilies #-}
src/Taxonomy/Families.hs:2:
src/Taxonomy/Families.hs:3:-- | Module        : Taxonomy.Families
src/Taxonomy/Families.hs:4:-- Description     : Object schema of Phys and the ten structural families.
src/Taxonomy/Families.hs:5:-- Ontology source : docs/ontology.md (DEF-002..DEF-007, DEF-025..DEF-035).
src/Taxonomy/Families.hs:6:--
src/Taxonomy/Families.hs:7:-- The typed taxonomy of the CMRPS program (the 'typed Periodic Table').
src/Taxonomy/Families.hs:8:-- Objects of Phys are tuples P = (X, O, D, S, C) (DEF-002); the ten candidate
src/Taxonomy/Families.hs:9:-- structural families (DEF-026..DEF-035) are encoded as type classes carrying
src/Taxonomy/Families.hs:10:-- each family's defining structural data. Family tags exist at the value level
src/Taxonomy/Families.hs:11:-- as 'StructuralFamily' for mechanical cross-audit against other formal names.
src/Taxonomy/Families.hs:12:--
src/Taxonomy/Families.hs:13:-- Claim status (docs/theorem-registry.md): this module encodes vocabulary
src/Taxonomy/Families.hs:14:-- only. It proves nothing and asserts no formalisation; the definitions are
src/Taxonomy/Families.hs:15:-- stipulative unless a cited background record says otherwise. Instances for
src/Taxonomy/Families.hs:16:-- concrete per-volume physical systems are supplied elsewhere, never here.
src/Taxonomy/Families.hs:17:module Taxonomy.Families
src/Taxonomy/Families.hs:18:  ( -- * Object schema of Phys (DEF-002)
src/Taxonomy/Families.hs:19:    PhysicalSystem (..)
src/Taxonomy/Families.hs:20:  , SystemRecord (..)
src/Taxonomy/Families.hs:21:    -- * Structural family tags (DEF-025)
src/Taxonomy/Families.hs:22:  , StructuralFamily (..)
src/Taxonomy/Families.hs:23:  , familyDefId
src/Taxonomy/Families.hs:24:    -- * Family I: symplectic and Poisson structures (DEF-026)
src/Taxonomy/Families.hs:25:  , FamilySymplecticPoisson (..)
src/Taxonomy/Families.hs:26:    -- * Family II: Hilbert spaces and operator algebras (DEF-027)
src/Taxonomy/Families.hs:27:  , FamilyHilbertOperatorAlgebras (..)
src/Taxonomy/Families.hs:28:    -- * Family III: smooth manifolds and geometric structures (DEF-028)
src/Taxonomy/Families.hs:29:  , FamilySmoothGeometric (..)
src/Taxonomy/Families.hs:30:    -- * Family IV: principal bundles and connections (DEF-029)
src/Taxonomy/Families.hs:31:  , FamilyPrincipalBundlesConnections (..)
src/Taxonomy/Families.hs:32:    -- * Family V: probability and measure-theoretic structures (DEF-030)
src/Taxonomy/Families.hs:33:  , FamilyProbabilityMeasure (..)
src/Taxonomy/Families.hs:34:    -- * Family VI: topological and higher-categorical structures (DEF-031)
src/Taxonomy/Families.hs:35:  , FamilyTopologicalHigherCategorical (..)
src/Taxonomy/Families.hs:36:    -- * Family VII: dynamical systems and operator semigroups (DEF-032)
src/Taxonomy/Families.hs:37:  , FamilyDynamicalSemigroups (..)
src/Taxonomy/Families.hs:38:    -- * Family VIII: tensor categories and compositional structures (DEF-033)
src/Taxonomy/Families.hs:39:  , FamilyTensorCategoriesComposition (..)
src/Taxonomy/Families.hs:40:    -- * Family IX: discrete combinatorial structures (DEF-034)
src/Taxonomy/Families.hs:41:  , FamilyDiscreteCombinatorial (..)
src/Taxonomy/Families.hs:42:    -- * Family X: derived and homotopical structures (DEF-035)
src/Taxonomy/Families.hs:43:  , FamilyDerivedHomotopical (..)
src/Taxonomy/Families.hs:44:  ) where
src/Taxonomy/Families.hs:45:
src/Taxonomy/Families.hs:46:-- | DEF-002 — an object of Phys is a tuple P = (X, O, D, S, C): a state space,
src/Taxonomy/Families.hs:47:-- an observable algebra or collection, dynamical laws, symmetry and constraint
src/Taxonomy/Families.hs:48:-- data, and composition\/interaction rules. The five components need not be
src/Taxonomy/Families.hs:49:-- independent; the schema is a candidate definition, not a theorem (DEF-002,
src/Taxonomy/Families.hs:50:-- status stipulative).
src/Taxonomy/Families.hs:51:class PhysicalSystem p where
src/Taxonomy/Families.hs:52:  -- | DEF-003 — the state space or geometric structure X of P. Instances in
src/Taxonomy/Families.hs:53:  -- the founding text range over symplectic manifolds, Hilbert spaces,
src/Taxonomy/Families.hs:54:  -- probability spaces, smooth manifolds, and lattice configurations.
src/Taxonomy/Families.hs:55:  type StateSpace p
src/Taxonomy/Families.hs:56:  stateSpace :: p -> StateSpace p
src/Taxonomy/Families.hs:57:
src/Taxonomy/Families.hs:58:  -- | DEF-004 — the algebra or collection of observables O of P.
src/Taxonomy/Families.hs:59:  type Observables p
src/Taxonomy/Families.hs:60:  observables :: p -> Observables p
src/Taxonomy/Families.hs:61:
src/Taxonomy/Families.hs:62:  -- | DEF-005 — the dynamical laws D of P: Hamiltonian or vector-field data,
src/Taxonomy/Families.hs:63:  -- operator semigroups, flows, or evolution functors.
src/Taxonomy/Families.hs:64:  type Dynamics p
src/Taxonomy/Families.hs:65:  dynamics :: p -> Dynamics p
src/Taxonomy/Families.hs:66:
src/Taxonomy/Families.hs:67:  -- | DEF-006 — the symmetry and constraint data S of P: group or groupoid
src/Taxonomy/Families.hs:68:  -- actions, gauge constraints, constraint surfaces.
src/Taxonomy/Families.hs:69:  type Symmetries p
src/Taxonomy/Families.hs:70:  symmetries :: p -> Symmetries p
src/Taxonomy/Families.hs:71:
src/Taxonomy/Families.hs:72:  -- | DEF-007 — the composition and interaction rules C of P: tensor products,
src/Taxonomy/Families.hs:73:  -- coupling terms, interfacing rules. C fixes the meaning of irreducibility
src/Taxonomy/Families.hs:74:  -- (DEF-021).
src/Taxonomy/Families.hs:75:  type Composition p
src/Taxonomy/Families.hs:76:  composition :: p -> Composition p
src/Taxonomy/Families.hs:77:
src/Taxonomy/Families.hs:78:-- | DEF-002 — the coordinate record form of P = (X, O, D, S, C): the same five
src/Taxonomy/Families.hs:79:-- components as fields, for systems whose components are given as plain data.
src/Taxonomy/Families.hs:80:-- This is a generic record instance of the schema, not a claim that any
src/Taxonomy/Families.hs:81:-- particular physical system is fully captured by it.
src/Taxonomy/Families.hs:82:data SystemRecord x o d s c = SystemRecord
src/Taxonomy/Families.hs:83:  { stateSpaceData :: x
src/Taxonomy/Families.hs:84:    -- ^ DEF-003 — state space X.
src/Taxonomy/Families.hs:85:  , observablesData :: o
src/Taxonomy/Families.hs:86:    -- ^ DEF-004 — observables O.
src/Taxonomy/Families.hs:87:  , dynamicsData :: d
src/Taxonomy/Families.hs:88:    -- ^ DEF-005 — dynamics D.
src/Taxonomy/Families.hs:89:  , symmetriesData :: s
src/Taxonomy/Families.hs:90:    -- ^ DEF-006 — symmetries and constraints S.
src/Taxonomy/Families.hs:91:  , compositionData :: c
src/Taxonomy/Families.hs:92:    -- ^ DEF-007 — composition and interaction rules C.
src/Taxonomy/Families.hs:93:  }
src/Taxonomy/Families.hs:94:  deriving (Eq, Show)
src/Taxonomy/Families.hs:95:
src/Taxonomy/Families.hs:96:instance PhysicalSystem (SystemRecord x o d s c) where
src/Taxonomy/Families.hs:97:  type StateSpace (SystemRecord x o d s c) = x
src/Taxonomy/Families.hs:98:  type Observables (SystemRecord x o d s c) = o
src/Taxonomy/Families.hs:99:  type Dynamics (SystemRecord x o d s c) = d
src/Taxonomy/Families.hs:100:  type Symmetries (SystemRecord x o d s c) = s
src/Taxonomy/Families.hs:101:  type Composition (SystemRecord x o d s c) = c
src/Taxonomy/Families.hs:102:  stateSpace = stateSpaceData
src/Taxonomy/Families.hs:103:  observables = observablesData
src/Taxonomy/Families.hs:104:  dynamics = dynamicsData
src/Taxonomy/Families.hs:105:  symmetries = symmetriesData
src/Taxonomy/Families.hs:106:  composition = compositionData
src/Taxonomy/Families.hs:107:
src/Taxonomy/Families.hs:108:-- | DEF-025 — value-level tags for the ten candidate structural families.
src/Taxonomy/Families.hs:109:-- The families are full subcategories of Phys singled out by their underlying
src/Taxonomy/Families.hs:110:-- mathematical structure; they are candidate organising families, not a
src/Taxonomy/Families.hs:111:-- completed classification, and some may later be unified (DEF-025).
src/Taxonomy/Families.hs:112:data StructuralFamily
src/Taxonomy/Families.hs:113:  = FamilyI
src/Taxonomy/Families.hs:114:    -- ^ DEF-026 — symplectic and Poisson structures.
src/Taxonomy/Families.hs:115:  | FamilyII
src/Taxonomy/Families.hs:116:    -- ^ DEF-027 — Hilbert spaces and operator algebras.
src/Taxonomy/Families.hs:117:  | FamilyIII
src/Taxonomy/Families.hs:118:    -- ^ DEF-028 — smooth manifolds and geometric structures.
src/Taxonomy/Families.hs:119:  | FamilyIV
src/Taxonomy/Families.hs:120:    -- ^ DEF-029 — principal bundles and connections.
src/Taxonomy/Families.hs:121:  | FamilyV
src/Taxonomy/Families.hs:122:    -- ^ DEF-030 — probability and measure-theoretic structures.
src/Taxonomy/Families.hs:123:  | FamilyVI
src/Taxonomy/Families.hs:124:    -- ^ DEF-031 — topological and higher-categorical structures.
src/Taxonomy/Families.hs:125:  | FamilyVII
src/Taxonomy/Families.hs:126:    -- ^ DEF-032 — dynamical systems and operator semigroups.
src/Taxonomy/Families.hs:127:  | FamilyVIII
src/Taxonomy/Families.hs:128:    -- ^ DEF-033 — tensor categories and compositional structures.
src/Taxonomy/Families.hs:129:  | FamilyIX
src/Taxonomy/Families.hs:130:    -- ^ DEF-034 — discrete combinatorial structures.
src/Taxonomy/Families.hs:131:  | FamilyX
src/Taxonomy/Families.hs:132:    -- ^ DEF-035 — derived and homotopical structures.
src/Taxonomy/Families.hs:133:  deriving (Eq, Ord, Show, Enum, Bounded)
src/Taxonomy/Families.hs:134:
src/Taxonomy/Families.hs:135:-- | The ontology identifier of each family, for mechanical cross-audit against
src/Taxonomy/Families.hs:136:-- names used in other formal layers. Pure metadata; no mathematical claim.
src/Taxonomy/Families.hs:137:familyDefId :: StructuralFamily -> String
src/Taxonomy/Families.hs:138:familyDefId FamilyI = "DEF-026"
src/Taxonomy/Families.hs:139:familyDefId FamilyII = "DEF-027"
src/Taxonomy/Families.hs:140:familyDefId FamilyIII = "DEF-028"
src/Taxonomy/Families.hs:141:familyDefId FamilyIV = "DEF-029"
src/Taxonomy/Families.hs:142:familyDefId FamilyV = "DEF-030"
src/Taxonomy/Families.hs:143:familyDefId FamilyVI = "DEF-031"
src/Taxonomy/Families.hs:144:familyDefId FamilyVII = "DEF-032"
src/Taxonomy/Families.hs:145:familyDefId FamilyVIII = "DEF-033"
src/Taxonomy/Families.hs:146:familyDefId FamilyIX = "DEF-034"
src/Taxonomy/Families.hs:147:familyDefId FamilyX = "DEF-035"
src/Taxonomy/Families.hs:148:
src/Taxonomy/Families.hs:149:-- | DEF-026 — Family I: symplectic and Poisson structures. Representative
src/Taxonomy/Families.hs:150:-- systems: classical mechanics. Local classification is trivial (Darboux
src/Taxonomy/Families.hs:151:-- normal form: no local invariants); global content is topological. Poisson
src/Taxonomy/Families.hs:152:-- data includes Weinstein splitting (symplectic x transverse), the
src/Taxonomy/Families.hs:153:-- symplectic-leaf foliation, and coadjoint orbits for KKS leaves. The link to
src/Taxonomy/Families.hs:154:-- Family II via deformation quantization is conjectural (DEF-026).
src/Taxonomy/Families.hs:155:class FamilySymplecticPoisson p where
src/Taxonomy/Families.hs:156:  -- | The symplectic or Poisson structural data of the system (symplectic
src/Taxonomy/Families.hs:157:  -- form, Poisson bivector, leaf data). Abstract here; volumes fix the type.
src/Taxonomy/Families.hs:158:  type SymplecticPoissonData p
src/Taxonomy/Families.hs:159:  symplecticPoissonData :: p -> SymplecticPoissonData p
src/Taxonomy/Families.hs:160:
src/Taxonomy/Families.hs:161:-- | DEF-027 — Family II: Hilbert spaces and operator algebras. Representative
src/Taxonomy/Families.hs:162:-- systems: quantum mechanics. Finite-dimensional C*-algebras are classified by
src/Taxonomy/Families.hs:163:-- dimension vector; amenable factors are classified; a general classification
src/Taxonomy/Families.hs:164:-- of II_1\/III factors is impossible in the stated generality (T-OB-01).
src/Taxonomy/Families.hs:165:class FamilyHilbertOperatorAlgebras p where
src/Taxonomy/Families.hs:166:  -- | The Hilbert-space or operator-algebra structural data of the system
src/Taxonomy/Families.hs:167:  -- (Hilbert space, C*- or von Neumann algebra, channel data). Abstract here.
src/Taxonomy/Families.hs:168:  type OperatorAlgebraData p
src/Taxonomy/Families.hs:169:  operatorAlgebraData :: p -> OperatorAlgebraData p
src/Taxonomy/Families.hs:170:
src/Taxonomy/Families.hs:171:-- | DEF-028 — Family III: smooth manifolds and geometric structures.
src/Taxonomy/Families.hs:172:-- Representative systems: relativity. Proven in restricted regimes (Lorentzian
src/Taxonomy/Families.hs:173:-- holonomy, complete causal ladder, 8 Thurston geometries in dimension 3);
src/Taxonomy/Families.hs:174:-- dimension 4 contains algorithmically unrecognizable instances (T-OB-05).
src/Taxonomy/Families.hs:175:class FamilySmoothGeometric p where
src/Taxonomy/Families.hs:176:  -- | The smooth or geometric structural data of the system (manifold,
src/Taxonomy/Families.hs:177:  -- metric, connection-independent geometry). Abstract here.
src/Taxonomy/Families.hs:178:  type GeometricData p
src/Taxonomy/Families.hs:179:  geometricData :: p -> GeometricData p
src/Taxonomy/Families.hs:180:
src/Taxonomy/Families.hs:181:-- | DEF-029 — Family IV: principal bundles and connections. Representative
src/Taxonomy/Families.hs:182:-- systems: gauge theories. Bundles are classified by maps into BG and
src/Taxonomy/Families.hs:183:-- characteristic classes; anomalies are classified as cohomological
src/Taxonomy/Families.hs:184:-- obstructions. See Taxonomy.Invariants for the classifying data.
src/Taxonomy/Families.hs:185:class FamilyPrincipalBundlesConnections p where
src/Taxonomy/Families.hs:186:  -- | The principal-bundle and connection data of the system (bundle,
src/Taxonomy/Families.hs:187:  -- structure group, connection, gauge data). Abstract here.
src/Taxonomy/Families.hs:188:  type BundleConnectionData p
src/Taxonomy/Families.hs:189:  bundleConnectionData :: p -> BundleConnectionData p
src/Taxonomy/Families.hs:190:
src/Taxonomy/Families.hs:191:-- | DEF-030 — Family V: probability and measure-theoretic structures.
src/Taxonomy/Families.hs:192:-- Representative systems: statistical physics. The Fisher metric is uniquely
src/Taxonomy/Families.hs:193:-- monotone under stochastic maps in the classical case (Chentsov, T-BG-14);
src/Taxonomy/Families.hs:194:-- quantum monotone metrics form a parametric family, not a finite list
src/Taxonomy/Families.hs:195:-- (T-BG-18). Uniqueness does not extend to the quantum case.
src/Taxonomy/Families.hs:196:class FamilyProbabilityMeasure p where
src/Taxonomy/Families.hs:197:  -- | The probability or measure-theoretic data of the system (state space of
src/Taxonomy/Families.hs:198:  -- measures, monotone metrics). Abstract here.
src/Taxonomy/Families.hs:199:  type ProbabilityMeasureData p
src/Taxonomy/Families.hs:200:  probabilityMeasureData :: p -> ProbabilityMeasureData p
src/Taxonomy/Families.hs:201:
src/Taxonomy/Families.hs:202:-- | DEF-031 — Family VI: topological and higher-categorical structures.
src/Taxonomy/Families.hs:203:-- Representative systems: TQFTs. Functorial TQFT is tractable under the Atiyah
src/Taxonomy/Families.hs:204:-- axioms; the cobordism-hypothesis classification of extended TQFTs is
src/Taxonomy/Families.hs:205:-- recorded as CLAIMED with a proof gap (T-OP-05), not as a completed theorem.
src/Taxonomy/Families.hs:206:class FamilyTopologicalHigherCategorical p where
src/Taxonomy/Families.hs:207:  -- | The topological or higher-categorical data of the system (cobordism
src/Taxonomy/Families.hs:208:  -- datum, extended-TQFT structure). Abstract here.
src/Taxonomy/Families.hs:209:  type HigherCategoricalData p
src/Taxonomy/Families.hs:210:  higherCategoricalData :: p -> HigherCategoricalData p
src/Taxonomy/Families.hs:211:
src/Taxonomy/Families.hs:212:-- | DEF-032 — Family VII: dynamical systems and operator semigroups.
src/Taxonomy/Families.hs:213:-- Representative systems: dissipative and open systems. Stinespring gives a
src/Taxonomy/Families.hs:214:-- minimal dilation of completely positive maps (a normal form, not an
src/Taxonomy/Families.hs:215:-- isomorphism classification, T-BG-15); no classification theorem for the
src/Taxonomy/Families.hs:216:-- family is on record.
src/Taxonomy/Families.hs:217:class FamilyDynamicalSemigroups p where
src/Taxonomy/Families.hs:218:  -- | The dynamical-semigroup data of the system (generator, semigroup,
src/Taxonomy/Families.hs:219:  -- dilation data). Abstract here.
src/Taxonomy/Families.hs:220:  type DynamicalSemigroupData p
src/Taxonomy/Families.hs:221:  dynamicalSemigroupData :: p -> DynamicalSemigroupData p
src/Taxonomy/Families.hs:222:
src/Taxonomy/Families.hs:223:-- | DEF-033 — Family VIII: tensor categories and compositional structures.
src/Taxonomy/Families.hs:224:-- Representative systems: quantum information. Established islands (DR
src/Taxonomy/Families.hs:225:-- reconstruction, Deligne's theorem) but open in general (fusion categories,
src/Taxonomy/Families.hs:226:-- T-OP-01). The symmetric layer is load-bearing: tensor equivalence without
src/Taxonomy/Families.hs:227:-- it cannot recover the group (DEF-018, T-OB-02).
src/Taxonomy/Families.hs:228:class FamilyTensorCategoriesComposition p where
src/Taxonomy/Families.hs:229:  -- | The tensor-category or compositional data of the system (tensor
src/Taxonomy/Families.hs:230:  -- category, conjugates, pivotal structure). Abstract here.
src/Taxonomy/Families.hs:231:  type TensorCategoryData p
src/Taxonomy/Families.hs:232:  tensorCategoryData :: p -> TensorCategoryData p
src/Taxonomy/Families.hs:233:
src/Taxonomy/Families.hs:234:-- | DEF-034 — Family IX: discrete combinatorial structures. Representative
src/Taxonomy/Families.hs:235:-- systems: lattice and network models. Lattice theorems hold only in
src/Taxonomy/Families.hs:236:-- restricted regimes; wild sectors forbid finite-variety parameterization
src/Taxonomy/Families.hs:237:-- (T-OB-04) and sit beyond an algorithmic tractability boundary (T-OB-07).
src/Taxonomy/Families.hs:238:class FamilyDiscreteCombinatorial p where
src/Taxonomy/Families.hs:239:  -- | The lattice or combinatorial data of the system (graph, lattice,
src/Taxonomy/Families.hs:240:  -- network, tame/wild class). Abstract here.
src/Taxonomy/Families.hs:241:  type CombinatorialData p
src/Taxonomy/Families.hs:242:  combinatorialData :: p -> CombinatorialData p
src/Taxonomy/Families.hs:243:
src/Taxonomy/Families.hs:244:-- | DEF-035 — Family X: derived and homotopical structures. Representative
src/Taxonomy/Families.hs:245:-- systems: higher gauge and derived field theories. Every finite-dimensional
src/Taxonomy/Families.hs:246:-- algebra over an algebraically closed field is derived-tame or derived-wild,
src/Taxonomy/Families.hs:247:-- wildness degeneration-robust (T-OB-04); no classification beyond that
src/Taxonomy/Families.hs:248:-- dichotomy is claimed.
src/Taxonomy/Families.hs:249:class FamilyDerivedHomotopical p where
src/Taxonomy/Families.hs:250:  -- | The derived or homotopical data of the system (derived category,
src/Taxonomy/Families.hs:251:  -- homotopical enhancement, derived-tame/wild class). Abstract here.
src/Taxonomy/Families.hs:252:  type DerivedHomotopicalData p
src/Taxonomy/Families.hs:253:  derivedHomotopicalData :: p -> DerivedHomotopicalData p
src/Taxonomy/Invariants.hs:1:{-# LANGUAGE EmptyDataDecls #-}
src/Taxonomy/Invariants.hs:2:
src/Taxonomy/Invariants.hs:3:-- | Module        : Taxonomy.Invariants
src/Taxonomy/Invariants.hs:4:-- Description     : Invariant records, classifying invariants, and invariant
src/Taxonomy/Invariants.hs:5:--                   accessors for the typed taxonomy.
src/Taxonomy/Invariants.hs:6:-- Ontology source : docs/ontology.md (DEF-036, DEF-037; family DEF-IDs cited
src/Taxonomy/Invariants.hs:7:--                   per declaration).
src/Taxonomy/Invariants.hs:8:--
src/Taxonomy/Invariants.hs:9:-- Mirrors the invariants layer of the ontology: the structural invariant
src/Taxonomy/Invariants.hs:10:-- record (DEF-036) and the classifying invariants named in DEF-037. Types
src/Taxonomy/Invariants.hs:11:-- whose mathematical content is abstract at this level are honest stubs: their
src/Taxonomy/Invariants.hs:12:-- Haddock comments state the semantics a later volume must supply, and no
src/Taxonomy/Invariants.hs:13:-- computation of mathematical content happens here.
src/Taxonomy/Invariants.hs:14:--
src/Taxonomy/Invariants.hs:15:-- Claim status (docs/theorem-registry.md): this module is vocabulary and
src/Taxonomy/Invariants.hs:16:-- accessor shape only. It claims no proof and no formalisation; cited
src/Taxonomy/Invariants.hs:17:-- classification results carry their registry status in the comments
src/Taxonomy/Invariants.hs:18:-- (literature results are 'complete-informal-proof' at best, never
src/Taxonomy/Invariants.hs:19:-- machine-checked within this program).
src/Taxonomy/Invariants.hs:20:module Taxonomy.Invariants
src/Taxonomy/Invariants.hs:21:  ( -- * Structural invariant record (DEF-036)
src/Taxonomy/Invariants.hs:22:    InvariantRecord (..)
src/Taxonomy/Invariants.hs:23:    -- * Classifying invariants (DEF-037)
src/Taxonomy/Invariants.hs:24:  , ClassifyingInvariant (..)
src/Taxonomy/Invariants.hs:25:  , dimensionVectorOf
src/Taxonomy/Invariants.hs:26:  , lieDiagramOf
src/Taxonomy/Invariants.hs:27:  , weightDataOf
src/Taxonomy/Invariants.hs:28:  , murrayVonNeumannTypeOf
src/Taxonomy/Invariants.hs:29:  , connesInvariantsOf
src/Taxonomy/Invariants.hs:30:  , classifyingSpaceMapOf
src/Taxonomy/Invariants.hs:31:  , characteristicClassesOf
src/Taxonomy/Invariants.hs:32:  , fullyDualizableObjectOf
src/Taxonomy/Invariants.hs:33:  , holonomyGroupOf
src/Taxonomy/Invariants.hs:34:  , causalClassOf
src/Taxonomy/Invariants.hs:35:  , holographicInequalityDataOf
src/Taxonomy/Invariants.hs:36:  , fisherMetricOf
src/Taxonomy/Invariants.hs:37:  , monotoneMetricOf
src/Taxonomy/Invariants.hs:38:    -- * Invariant data types
src/Taxonomy/Invariants.hs:39:  , DimensionVector (..)
src/Taxonomy/Invariants.hs:40:  , LieDiagram (..)
src/Taxonomy/Invariants.hs:41:  , DynkinDiagram (..)
src/Taxonomy/Invariants.hs:42:  , SatakeDiagram
src/Taxonomy/Invariants.hs:43:  , WeightData (..)
src/Taxonomy/Invariants.hs:44:  , CasimirData (..)
src/Taxonomy/Invariants.hs:45:  , MurrayVonNeumannType (..)
src/Taxonomy/Invariants.hs:46:  , ConnesInvariants
src/Taxonomy/Invariants.hs:47:  , ClassifyingSpaceMap
src/Taxonomy/Invariants.hs:48:  , CharacteristicClass (..)
src/Taxonomy/Invariants.hs:49:  , FullyDualizableObject
src/Taxonomy/Invariants.hs:50:  , HolonomyGroup
src/Taxonomy/Invariants.hs:51:  , CausalClass (..)
src/Taxonomy/Invariants.hs:52:  , HolographicInequalityData (..)
src/Taxonomy/Invariants.hs:53:  , EntropyInequality (..)
src/Taxonomy/Invariants.hs:54:  , FisherMetric
src/Taxonomy/Invariants.hs:55:  , MonotoneMetric
src/Taxonomy/Invariants.hs:56:  , EntropyHook (..)
src/Taxonomy/Invariants.hs:57:  , entropyUnder
src/Taxonomy/Invariants.hs:58:  ) where
src/Taxonomy/Invariants.hs:59:
src/Taxonomy/Invariants.hs:60:-- | DEF-036 — the structural invariant record of a theory T:
src/Taxonomy/Invariants.hs:61:-- I(T) = (S_T, O_T, D_T, G_T, R_T), describing states, observables, dynamics,
src/Taxonomy/Invariants.hs:62:-- symmetries, and representations. The classification question is which of
src/Taxonomy/Invariants.hs:63:-- these invariants suffice to distinguish theories up to the chosen physical
src/Taxonomy/Invariants.hs:64:-- equivalence (DEF-015). Status: stipulative.
src/Taxonomy/Invariants.hs:65:data InvariantRecord s o d g r = InvariantRecord
src/Taxonomy/Invariants.hs:66:  { stateInvariants :: s
src/Taxonomy/Invariants.hs:67:    -- ^ State-side invariants S_T.
src/Taxonomy/Invariants.hs:68:  , observableInvariants :: o
src/Taxonomy/Invariants.hs:69:    -- ^ Observable-side invariants O_T.
src/Taxonomy/Invariants.hs:70:  , dynamicsInvariants :: d
src/Taxonomy/Invariants.hs:71:    -- ^ Dynamics-side invariants D_T.
src/Taxonomy/Invariants.hs:72:  , symmetryInvariants :: g
src/Taxonomy/Invariants.hs:73:    -- ^ Symmetry-side invariants G_T.
src/Taxonomy/Invariants.hs:74:  , representationInvariants :: r
src/Taxonomy/Invariants.hs:75:    -- ^ Representation-side invariants R_T.
src/Taxonomy/Invariants.hs:76:  }
src/Taxonomy/Invariants.hs:77:  deriving (Eq, Show)
src/Taxonomy/Invariants.hs:78:
src/Taxonomy/Invariants.hs:79:-- | DEF-037 — a classifying invariant: for a domain with a completed
src/Taxonomy/Invariants.hs:80:-- classification, the invariant whose value determines the object up to the
src/Taxonomy/Invariants.hs:81:-- chosen equivalence. The constructors mirror exactly the list of DEF-037;
src/Taxonomy/Invariants.hs:82:-- each carries the data named there. Scope limits of the underlying results
src/Taxonomy/Invariants.hs:83:-- are cited per constructor; nothing here extends them.
src/Taxonomy/Invariants.hs:84:data ClassifyingInvariant
src/Taxonomy/Invariants.hs:85:  = ByLieDiagram LieDiagram
src/Taxonomy/Invariants.hs:86:    -- ^ Dynkin\/Satake diagram (Killing-Cartan classification, T-BG-02,
src/Taxonomy/Invariants.hs:87:    -- complete-informal-proof).
src/Taxonomy/Invariants.hs:88:  | ByDominantIntegralWeight WeightData
src/Taxonomy/Invariants.hs:89:    -- ^ Dominant integral weight (highest-weight theorem, T-BG-03).
src/Taxonomy/Invariants.hs:90:  | ByDimensionVector DimensionVector
src/Taxonomy/Invariants.hs:91:    -- ^ Dimension vector of a finite-dimensional C*-algebra (T-BG-06).
src/Taxonomy/Invariants.hs:92:  | ByMurrayVonNeumannType MurrayVonNeumannType
src/Taxonomy/Invariants.hs:93:    -- ^ Murray-von Neumann type (T-BG-07; amenable factors only).
src/Taxonomy/Invariants.hs:94:  | ByConnesInvariants ConnesInvariants
src/Taxonomy/Invariants.hs:95:    -- ^ Connes invariants (T-BG-07, T-OP-06).
src/Taxonomy/Invariants.hs:96:  | ByClassifyingSpaceMap ClassifyingSpaceMap
src/Taxonomy/Invariants.hs:97:    -- ^ Homotopy-class map X -> BG classifying a principal bundle (T-BG-08).
src/Taxonomy/Invariants.hs:98:  | ByCharacteristicClasses [CharacteristicClass]
src/Taxonomy/Invariants.hs:99:    -- ^ Characteristic classes in H*(BG), pullbacks of universal classes
src/Taxonomy/Invariants.hs:100:    -- (T-BG-08).
src/Taxonomy/Invariants.hs:101:  | ByFullyDualizableObject FullyDualizableObject
src/Taxonomy/Invariants.hs:102:    -- ^ Fully dualizable object (cobordism hypothesis; the 2009 writeup is an
src/Taxonomy/Invariants.hs:103:    -- informal proof sketch, so the classification claim is recorded as
src/Taxonomy/Invariants.hs:104:    -- CLAIMED with a proof gap, T-OP-05).
src/Taxonomy/Invariants.hs:105:  | ByHolonomyGroup HolonomyGroup
src/Taxonomy/Invariants.hs:106:    -- ^ Holonomy group (Lorentzian case classified, T-BG-11).
src/Taxonomy/Invariants.hs:107:  | ByCausalClass CausalClass
src/Taxonomy/Invariants.hs:108:    -- ^ Causal class on the complete causal ladder (T-BG-12).
src/Taxonomy/Invariants.hs:109:  | ByHolographicInequalityData HolographicInequalityData
src/Taxonomy/Invariants.hs:110:    -- ^ SSA+MMI inequality data for at most 4 regions (T-BG-13).
src/Taxonomy/Invariants.hs:111:  | ByFisherMetric FisherMetric
src/Taxonomy/Invariants.hs:112:    -- ^ Fisher metric, unique up to constant in the classical case
src/Taxonomy/Invariants.hs:113:    -- (Chentsov, T-BG-14).
src/Taxonomy/Invariants.hs:114:  | ByMonotoneMetric MonotoneMetric
src/Taxonomy/Invariants.hs:115:    -- ^ Quantum monotone metric; the quantum case is parametric
src/Taxonomy/Invariants.hs:116:    -- (operator monotone functions, T-BG-18), not a finite list.
src/Taxonomy/Invariants.hs:117:  deriving (Eq, Show)
src/Taxonomy/Invariants.hs:118:
src/Taxonomy/Invariants.hs:119:-- | Accessor (DEF-037): the dimension vector, when that is the invariant in
src/Taxonomy/Invariants.hs:120:-- force. Stub semantics: projection only; no classification is computed.
src/Taxonomy/Invariants.hs:121:dimensionVectorOf :: ClassifyingInvariant -> Maybe DimensionVector
src/Taxonomy/Invariants.hs:122:dimensionVectorOf (ByDimensionVector dv) = Just dv
src/Taxonomy/Invariants.hs:123:dimensionVectorOf _ = Nothing
src/Taxonomy/Invariants.hs:124:
src/Taxonomy/Invariants.hs:125:-- | Accessor (DEF-037): the Lie diagram, when that is the invariant in force.
src/Taxonomy/Invariants.hs:126:lieDiagramOf :: ClassifyingInvariant -> Maybe LieDiagram
src/Taxonomy/Invariants.hs:127:lieDiagramOf (ByLieDiagram d) = Just d
src/Taxonomy/Invariants.hs:128:lieDiagramOf _ = Nothing
src/Taxonomy/Invariants.hs:129:
src/Taxonomy/Invariants.hs:130:-- | Accessor (DEF-037): the weight data (dominant weight, Casimirs), when that
src/Taxonomy/Invariants.hs:131:-- is the invariant in force.
src/Taxonomy/Invariants.hs:132:weightDataOf :: ClassifyingInvariant -> Maybe WeightData
src/Taxonomy/Invariants.hs:133:weightDataOf (ByDominantIntegralWeight w) = Just w
src/Taxonomy/Invariants.hs:134:weightDataOf _ = Nothing
src/Taxonomy/Invariants.hs:135:
src/Taxonomy/Invariants.hs:136:-- | Accessor (DEF-037): the Murray-von Neumann type, when that is the
src/Taxonomy/Invariants.hs:137:-- invariant in force.
src/Taxonomy/Invariants.hs:138:murrayVonNeumannTypeOf :: ClassifyingInvariant -> Maybe MurrayVonNeumannType
src/Taxonomy/Invariants.hs:139:murrayVonNeumannTypeOf (ByMurrayVonNeumannType t) = Just t
src/Taxonomy/Invariants.hs:140:murrayVonNeumannTypeOf _ = Nothing
src/Taxonomy/Invariants.hs:141:
src/Taxonomy/Invariants.hs:142:-- | Accessor (DEF-037): the Connes invariants, when that is the invariant in
src/Taxonomy/Invariants.hs:143:-- force.
src/Taxonomy/Invariants.hs:144:connesInvariantsOf :: ClassifyingInvariant -> Maybe ConnesInvariants
src/Taxonomy/Invariants.hs:145:connesInvariantsOf (ByConnesInvariants c) = Just c
src/Taxonomy/Invariants.hs:146:connesInvariantsOf _ = Nothing
src/Taxonomy/Invariants.hs:147:
src/Taxonomy/Invariants.hs:148:-- | Accessor (DEF-037): the classifying-space map X -> BG, when that is the
src/Taxonomy/Invariants.hs:149:-- invariant in force.
src/Taxonomy/Invariants.hs:150:classifyingSpaceMapOf :: ClassifyingInvariant -> Maybe ClassifyingSpaceMap
src/Taxonomy/Invariants.hs:151:classifyingSpaceMapOf (ByClassifyingSpaceMap m) = Just m
src/Taxonomy/Invariants.hs:152:classifyingSpaceMapOf _ = Nothing
src/Taxonomy/Invariants.hs:153:
src/Taxonomy/Invariants.hs:154:-- | Accessor (DEF-037): the characteristic classes, when those are the
src/Taxonomy/Invariants.hs:155:-- invariant in force.
src/Taxonomy/Invariants.hs:156:characteristicClassesOf :: ClassifyingInvariant -> Maybe [CharacteristicClass]
src/Taxonomy/Invariants.hs:157:characteristicClassesOf (ByCharacteristicClasses cs) = Just cs
src/Taxonomy/Invariants.hs:158:characteristicClassesOf _ = Nothing
src/Taxonomy/Invariants.hs:159:
src/Taxonomy/Invariants.hs:160:-- | Accessor (DEF-037): the fully dualizable object, when that is the
src/Taxonomy/Invariants.hs:161:-- invariant in force. See the CLAIMED status note on 'ByFullyDualizableObject'.
src/Taxonomy/Invariants.hs:162:fullyDualizableObjectOf :: ClassifyingInvariant -> Maybe FullyDualizableObject
src/Taxonomy/Invariants.hs:163:fullyDualizableObjectOf (ByFullyDualizableObject o) = Just o
src/Taxonomy/Invariants.hs:164:fullyDualizableObjectOf _ = Nothing
src/Taxonomy/Invariants.hs:165:
src/Taxonomy/Invariants.hs:166:-- | Accessor (DEF-037): the holonomy group, when that is the invariant in
src/Taxonomy/Invariants.hs:167:-- force.
src/Taxonomy/Invariants.hs:168:holonomyGroupOf :: ClassifyingInvariant -> Maybe HolonomyGroup
src/Taxonomy/Invariants.hs:169:holonomyGroupOf (ByHolonomyGroup h) = Just h
src/Taxonomy/Invariants.hs:170:holonomyGroupOf _ = Nothing
src/Taxonomy/Invariants.hs:171:
src/Taxonomy/Invariants.hs:172:-- | Accessor (DEF-037): the causal class, when that is the invariant in force.
src/Taxonomy/Invariants.hs:173:causalClassOf :: ClassifyingInvariant -> Maybe CausalClass
src/Taxonomy/Invariants.hs:174:causalClassOf (ByCausalClass c) = Just c
src/Taxonomy/Invariants.hs:175:causalClassOf _ = Nothing
src/Taxonomy/Invariants.hs:176:
src/Taxonomy/Invariants.hs:177:-- | Accessor (DEF-037): the holographic inequality data, when that is the
src/Taxonomy/Invariants.hs:178:-- invariant in force.
src/Taxonomy/Invariants.hs:179:holographicInequalityDataOf
src/Taxonomy/Invariants.hs:180:  :: ClassifyingInvariant -> Maybe HolographicInequalityData
src/Taxonomy/Invariants.hs:181:holographicInequalityDataOf (ByHolographicInequalityData h) = Just h
src/Taxonomy/Invariants.hs:182:holographicInequalityDataOf _ = Nothing
src/Taxonomy/Invariants.hs:183:
src/Taxonomy/Invariants.hs:184:-- | Accessor (DEF-037): the Fisher metric, when that is the invariant in
src/Taxonomy/Invariants.hs:185:-- force.
src/Taxonomy/Invariants.hs:186:fisherMetricOf :: ClassifyingInvariant -> Maybe FisherMetric
src/Taxonomy/Invariants.hs:187:fisherMetricOf (ByFisherMetric f) = Just f
src/Taxonomy/Invariants.hs:188:fisherMetricOf _ = Nothing
src/Taxonomy/Invariants.hs:189:
src/Taxonomy/Invariants.hs:190:-- | Accessor (DEF-037): the quantum monotone metric, when that is the
src/Taxonomy/Invariants.hs:191:-- invariant in force.
src/Taxonomy/Invariants.hs:192:monotoneMetricOf :: ClassifyingInvariant -> Maybe MonotoneMetric
src/Taxonomy/Invariants.hs:193:monotoneMetricOf (ByMonotoneMetric m) = Just m
src/Taxonomy/Invariants.hs:194:monotoneMetricOf _ = Nothing
src/Taxonomy/Invariants.hs:195:
src/Taxonomy/Invariants.hs:196:-- | DEF-037 — dimension vector of a finite-dimensional complex C*-algebra:
src/Taxonomy/Invariants.hs:197:-- the multiset of matrix block sizes in A ~= sum_i M_{n_i}(C). Within its
src/Taxonomy/Invariants.hs:198:-- scope the multiset determines A up to *-isomorphism (T-BG-06,
src/Taxonomy/Invariants.hs:199:-- complete-informal-proof). Encoding: the block sizes as a list; the
src/Taxonomy/Invariants.hs:200:-- multiset, not the order, is the invariant.
src/Taxonomy/Invariants.hs:201:newtype DimensionVector = DimensionVector [Int]
src/Taxonomy/Invariants.hs:202:  deriving (Eq, Ord, Show)
src/Taxonomy/Invariants.hs:203:
src/Taxonomy/Invariants.hs:204:-- | DEF-037 — Dynkin or Satake diagram data of a (real or complex) semisimple
src/Taxonomy/Invariants.hs:205:-- Lie algebra (T-BG-02).
src/Taxonomy/Invariants.hs:206:data LieDiagram
src/Taxonomy/Invariants.hs:207:  = Dynkin DynkinDiagram
src/Taxonomy/Invariants.hs:208:    -- ^ Complex semisimple case: Dynkin diagram.
src/Taxonomy/Invariants.hs:209:  | Satake SatakeDiagram
src/Taxonomy/Invariants.hs:210:    -- ^ Real simple case: Satake diagram.
src/Taxonomy/Invariants.hs:211:  deriving (Eq, Show)
src/Taxonomy/Invariants.hs:212:
src/Taxonomy/Invariants.hs:213:-- | DEF-037 — Dynkin diagrams of complex simple Lie algebras: the A-D series
src/Taxonomy/Invariants.hs:214:-- and the five exceptional diagrams (T-BG-02).
src/Taxonomy/Invariants.hs:215:data DynkinDiagram
src/Taxonomy/Invariants.hs:216:  = ADyn Int
src/Taxonomy/Invariants.hs:217:  | BDyn Int
src/Taxonomy/Invariants.hs:218:  | CDyn Int
src/Taxonomy/Invariants.hs:219:  | DDyn Int
src/Taxonomy/Invariants.hs:220:  | G2Dyn
src/Taxonomy/Invariants.hs:221:  | F4Dyn
src/Taxonomy/Invariants.hs:222:  | E6Dyn
src/Taxonomy/Invariants.hs:223:  | E7Dyn
src/Taxonomy/Invariants.hs:224:  | E8Dyn
src/Taxonomy/Invariants.hs:225:  deriving (Eq, Ord, Show)
src/Taxonomy/Invariants.hs:226:
src/Taxonomy/Invariants.hs:227:-- | DEF-037 — Satake diagram of a real simple Lie algebra. Stub: the diagram
src/Taxonomy/Invariants.hs:228:-- itself is left abstract; a volume that needs its data refines this type.
src/Taxonomy/Invariants.hs:229:data SatakeDiagram
src/Taxonomy/Invariants.hs:230:  deriving (Eq, Show)
src/Taxonomy/Invariants.hs:231:
src/Taxonomy/Invariants.hs:232:-- | DEF-037 — weight data of a finite-dimensional irrep of a complex
src/Taxonomy/Invariants.hs:233:-- semisimple Lie algebra: a dominant integral weight, with the Casimir data
src/Taxonomy/Invariants.hs:234:-- recorded alongside (T-BG-03). The weight is given in the fundamental-weight
src/Taxonomy/Invariants.hs:235:-- basis; semantics are those of the highest-weight theorem.
src/Taxonomy/Invariants.hs:236:data WeightData = WeightData
src/Taxonomy/Invariants.hs:237:  { dominantIntegralWeight :: [Rational]
src/Taxonomy/Invariants.hs:238:    -- ^ Coordinates in the fundamental-weight basis.
src/Taxonomy/Invariants.hs:239:  , casimirData :: CasimirData
src/Taxonomy/Invariants.hs:240:    -- ^ Casimir data attached to the weight.
src/Taxonomy/Invariants.hs:241:  }
src/Taxonomy/Invariants.hs:242:  deriving (Eq, Show)
src/Taxonomy/Invariants.hs:243:
src/Taxonomy/Invariants.hs:244:-- | DEF-037 — Casimir data: eigenvalues of the Casimir operators on the
src/Taxonomy/Invariants.hs:245:-- representation, recorded in a fixed basis order. Stub semantics: the list is
src/Taxonomy/Invariants.hs:246:-- abstract data; no computation of Casimir elements is claimed here.
src/Taxonomy/Invariants.hs:247:newtype CasimirData = CasimirData [Rational]
src/Taxonomy/Invariants.hs:248:  deriving (Eq, Ord, Show)
src/Taxonomy/Invariants.hs:249:
src/Taxonomy/Invariants.hs:250:-- | DEF-037 — Murray-von Neumann type of a von Neumann algebra factor. The
src/Taxonomy/Invariants.hs:251:-- constructors mirror the amenable classification (T-BG-07,
src/Taxonomy/Invariants.hs:252:-- complete-informal-proof): types I_n, I_infinity, II_1, II_infinity,
src/Taxonomy/Invariants.hs:253:-- III_lambda (0 < lambda <= 1), III_0, III_1. Outside the amenable class a
src/Taxonomy/Invariants.hs:254:-- total classification is impossible (T-OB-01).
src/Taxonomy/Invariants.hs:255:data MurrayVonNeumannType
src/Taxonomy/Invariants.hs:256:  = TypeI Int
src/Taxonomy/Invariants.hs:257:    -- ^ Type I_n, n matrix size.
src/Taxonomy/Invariants.hs:258:  | TypeIInfinite
src/Taxonomy/Invariants.hs:259:    -- ^ Type I_infinity.
src/Taxonomy/Invariants.hs:260:  | TypeII1
src/Taxonomy/Invariants.hs:261:    -- ^ Type II_1.
src/Taxonomy/Invariants.hs:262:  | TypeIIInfinite
src/Taxonomy/Invariants.hs:263:    -- ^ Type II_infinity.
src/Taxonomy/Invariants.hs:264:  | TypeIIILambda Rational
src/Taxonomy/Invariants.hs:265:    -- ^ Type III_lambda with 0 < lambda <= 1.
src/Taxonomy/Invariants.hs:266:  | TypeIII0
src/Taxonomy/Invariants.hs:267:    -- ^ Type III_0 (ergodic-flow description).
src/Taxonomy/Invariants.hs:268:  | TypeIII1
src/Taxonomy/Invariants.hs:269:    -- ^ Type III_1.
src/Taxonomy/Invariants.hs:270:  deriving (Eq, Show)
src/Taxonomy/Invariants.hs:271:
src/Taxonomy/Invariants.hs:272:-- | DEF-037 — Connes invariants of a factor. Stub: the invariants (Connes
src/Taxonomy/Invariants.hs:273:-- spectrum, fundamental group) are left abstract; only coarse strata are
src/Taxonomy/Invariants.hs:274:-- available in general (T-OP-06).
src/Taxonomy/Invariants.hs:275:data ConnesInvariants
src/Taxonomy/Invariants.hs:276:  deriving (Eq, Show)
src/Taxonomy/Invariants.hs:277:
src/Taxonomy/Invariants.hs:278:-- | DEF-037 — classifying-space map [X, BG]: homotopy classes of maps into
src/Taxonomy/Invariants.hs:279:-- the classifying space, classifying principal G-bundles; characteristic
src/Taxonomy/Invariants.hs:280:-- classes are pullbacks of universal classes (T-BG-08). Stub: the map is left
src/Taxonomy/Invariants.hs:281:-- abstract.
src/Taxonomy/Invariants.hs:282:data ClassifyingSpaceMap
src/Taxonomy/Invariants.hs:283:  deriving (Eq, Show)
src/Taxonomy/Invariants.hs:284:
src/Taxonomy/Invariants.hs:285:-- | DEF-037 / DEF-029 — named characteristic classes in H*(BG): the standard
src/Taxonomy/Invariants.hs:286:-- list used to classify principal bundles and their obstructions (T-BG-08).
src/Taxonomy/Invariants.hs:287:data CharacteristicClass
src/Taxonomy/Invariants.hs:288:  = StiefelWhitney
src/Taxonomy/Invariants.hs:289:    -- ^ Stiefel-Whitney classes.
src/Taxonomy/Invariants.hs:290:  | Pontryagin
src/Taxonomy/Invariants.hs:291:    -- ^ Pontryagin classes.
src/Taxonomy/Invariants.hs:292:  | Euler
src/Taxonomy/Invariants.hs:293:    -- ^ Euler class.
src/Taxonomy/Invariants.hs:294:  | Chern
src/Taxonomy/Invariants.hs:295:    -- ^ Chern classes.
src/Taxonomy/Invariants.hs:296:  | DixmierDouady
src/Taxonomy/Invariants.hs:297:    -- ^ Dixmier-Douady class.
src/Taxonomy/Invariants.hs:298:  deriving (Eq, Ord, Show)
src/Taxonomy/Invariants.hs:299:
src/Taxonomy/Invariants.hs:300:-- | DEF-037 — fully dualizable object, the invariant named by the cobordism
src/Taxonomy/Invariants.hs:301:-- hypothesis for extended TQFTs. Stub: the object is left abstract. Status
src/Taxonomy/Invariants.hs:302:-- note: the classification statement is recorded as CLAIMED with a proof gap
src/Taxonomy/Invariants.hs:303:-- (T-OP-05); nothing here treats it as proved.
src/Taxonomy/Invariants.hs:304:data FullyDualizableObject
src/Taxonomy/Invariants.hs:305:  deriving (Eq, Show)
src/Taxonomy/Invariants.hs:306:
src/Taxonomy/Invariants.hs:307:-- | DEF-037 — holonomy group of a (here: Lorentzian) geometric structure.
src/Taxonomy/Invariants.hs:308:-- Stub: the group is left abstract; the connected Lorentzian case is
src/Taxonomy/Invariants.hs:309:-- classified (T-BG-11, complete-informal-proof).
src/Taxonomy/Invariants.hs:310:data HolonomyGroup
src/Taxonomy/Invariants.hs:311:  deriving (Eq, Show)
src/Taxonomy/Invariants.hs:312:
src/Taxonomy/Invariants.hs:313:-- | DEF-037 — causal class of a spacetime: a rung of the causal ladder, which
src/Taxonomy/Invariants.hs:314:-- is complete as a classification of causality conditions (T-BG-12).
src/Taxonomy/Invariants.hs:315:data CausalClass
src/Taxonomy/Invariants.hs:316:  = Chronological
src/Taxonomy/Invariants.hs:317:    -- ^ No closed timelike curves.
src/Taxonomy/Invariants.hs:318:  | Causal
src/Taxonomy/Invariants.hs:319:    -- ^ No closed causal curves.
src/Taxonomy/Invariants.hs:320:  | Distinguishing
src/Taxonomy/Invariants.hs:321:  -- ^ Distinguishing spacetime.
src/Taxonomy/Invariants.hs:322:  | StrongCausality
src/Taxonomy/Invariants.hs:323:  | StableCausality
src/Taxonomy/Invariants.hs:324:  | GlobalHyperbolicity
src/Taxonomy/Invariants.hs:325:  deriving (Eq, Ord, Show, Enum, Bounded)
src/Taxonomy/Invariants.hs:326:
src/Taxonomy/Invariants.hs:327:-- | DEF-037 — SSA+MMI inequality data for the holographic entropy cone in the
src/Taxonomy/Invariants.hs:328:-- proven range of at most 4 boundary regions (T-BG-13). For n >= 5 regions the
src/Taxonomy/Invariants.hs:329:-- cone is open (T-OP-04); this record does not extend the proven range.
src/Taxonomy/Invariants.hs:330:data HolographicInequalityData = HolographicInequalityData
src/Taxonomy/Invariants.hs:331:  { regionCount :: Int
src/Taxonomy/Invariants.hs:332:    -- ^ Number of boundary regions; the proven range is <= 4.
src/Taxonomy/Invariants.hs:333:  , entropyInequalities :: [EntropyInequality]
src/Taxonomy/Invariants.hs:334:    -- ^ The inequality kinds in force for this region count.
src/Taxonomy/Invariants.hs:335:  }
src/Taxonomy/Invariants.hs:336:  deriving (Eq, Show)
src/Taxonomy/Invariants.hs:337:
src/Taxonomy/Invariants.hs:338:-- | Inequality kinds named in the proven SSA+MMI data (T-BG-13).
src/Taxonomy/Invariants.hs:339:data EntropyInequality
src/Taxonomy/Invariants.hs:340:  = StrongSubadditivity
src/Taxonomy/Invariants.hs:341:  | MonogamyOfMutualInformation
src/Taxonomy/Invariants.hs:342:  deriving (Eq, Ord, Show)
src/Taxonomy/Invariants.hs:343:
src/Taxonomy/Invariants.hs:344:-- | DEF-037 — Fisher information metric. Stub: the metric is left abstract.
src/Taxonomy/Invariants.hs:345:-- In the classical case it is unique up to constant as the metric monotone
src/Taxonomy/Invariants.hs:346:-- under stochastic maps (Chentsov, T-BG-14); uniqueness fails in the quantum
src/Taxonomy/Invariants.hs:347:-- case.
src/Taxonomy/Invariants.hs:348:data FisherMetric
src/Taxonomy/Invariants.hs:349:  deriving (Eq, Show)
src/Taxonomy/Invariants.hs:350:
src/Taxonomy/Invariants.hs:351:-- | DEF-037 — quantum monotone metric. Stub: the metric is left abstract. The
src/Taxonomy/Invariants.hs:352:-- quantum case is classified parametrically by operator monotone functions
src/Taxonomy/Invariants.hs:353:-- (Petz-Sudar, T-BG-18) — a parametric family, not a finite list; the
src/Taxonomy/Invariants.hs:354:-- classical uniqueness may not be extended.
src/Taxonomy/Invariants.hs:355:data MonotoneMetric
src/Taxonomy/Invariants.hs:356:  deriving (Eq, Show)
src/Taxonomy/Invariants.hs:357:
src/Taxonomy/Invariants.hs:358:-- | DEF-037 — entropy hook: an entropy functional supplied by a volume,
src/Taxonomy/Invariants.hs:359:-- mapping a state of type s to an entropy value of type e when defined.
src/Taxonomy/Invariants.hs:360:-- Hook semantics: Nothing means the volume does not assign an entropy in that
src/Taxonomy/Invariants.hs:361:-- case; no value is computed here.
src/Taxonomy/Invariants.hs:362:newtype EntropyHook s e = EntropyHook (s -> Maybe e)
src/Taxonomy/Invariants.hs:363:
src/Taxonomy/Invariants.hs:364:-- | Apply an entropy hook (DEF-037). Pure plumbing; no mathematical content.
src/Taxonomy/Invariants.hs:365:entropyUnder :: EntropyHook s e -> s -> Maybe e
src/Taxonomy/Invariants.hs:366:entropyUnder (EntropyHook f) = f

exec
/usr/local/bin/zsh -lc 'cat src/Taxonomy/Families.hs src/Taxonomy/Equivalences.hs' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
{-# LANGUAGE TypeFamilies #-}

-- | Module        : Taxonomy.Families
-- Description     : Object schema of Phys and the ten structural families.
-- Ontology source : docs/ontology.md (DEF-002..DEF-007, DEF-025..DEF-035).
--
-- The typed taxonomy of the CMRPS program (the 'typed Periodic Table').
-- Objects of Phys are tuples P = (X, O, D, S, C) (DEF-002); the ten candidate
-- structural families (DEF-026..DEF-035) are encoded as type classes carrying
-- each family's defining structural data. Family tags exist at the value level
-- as 'StructuralFamily' for mechanical cross-audit against other formal names.
--
-- Claim status (docs/theorem-registry.md): this module encodes vocabulary
-- only. It proves nothing and asserts no formalisation; the definitions are
-- stipulative unless a cited background record says otherwise. Instances for
-- concrete per-volume physical systems are supplied elsewhere, never here.
module Taxonomy.Families
  ( -- * Object schema of Phys (DEF-002)
    PhysicalSystem (..)
  , SystemRecord (..)
    -- * Structural family tags (DEF-025)
  , StructuralFamily (..)
  , familyDefId
    -- * Family I: symplectic and Poisson structures (DEF-026)
  , FamilySymplecticPoisson (..)
    -- * Family II: Hilbert spaces and operator algebras (DEF-027)
  , FamilyHilbertOperatorAlgebras (..)
    -- * Family III: smooth manifolds and geometric structures (DEF-028)
  , FamilySmoothGeometric (..)
    -- * Family IV: principal bundles and connections (DEF-029)
  , FamilyPrincipalBundlesConnections (..)
    -- * Family V: probability and measure-theoretic structures (DEF-030)
  , FamilyProbabilityMeasure (..)
    -- * Family VI: topological and higher-categorical structures (DEF-031)
  , FamilyTopologicalHigherCategorical (..)
    -- * Family VII: dynamical systems and operator semigroups (DEF-032)
  , FamilyDynamicalSemigroups (..)
    -- * Family VIII: tensor categories and compositional structures (DEF-033)
  , FamilyTensorCategoriesComposition (..)
    -- * Family IX: discrete combinatorial structures (DEF-034)
  , FamilyDiscreteCombinatorial (..)
    -- * Family X: derived and homotopical structures (DEF-035)
  , FamilyDerivedHomotopical (..)
  ) where

-- | DEF-002 — an object of Phys is a tuple P = (X, O, D, S, C): a state space,
-- an observable algebra or collection, dynamical laws, symmetry and constraint
-- data, and composition\/interaction rules. The five components need not be
-- independent; the schema is a candidate definition, not a theorem (DEF-002,
-- status stipulative).
class PhysicalSystem p where
  -- | DEF-003 — the state space or geometric structure X of P. Instances in
  -- the founding text range over symplectic manifolds, Hilbert spaces,
  -- probability spaces, smooth manifolds, and lattice configurations.
  type StateSpace p
  stateSpace :: p -> StateSpace p

  -- | DEF-004 — the algebra or collection of observables O of P.
  type Observables p
  observables :: p -> Observables p

  -- | DEF-005 — the dynamical laws D of P: Hamiltonian or vector-field data,
  -- operator semigroups, flows, or evolution functors.
  type Dynamics p
  dynamics :: p -> Dynamics p

  -- | DEF-006 — the symmetry and constraint data S of P: group or groupoid
  -- actions, gauge constraints, constraint surfaces.
  type Symmetries p
  symmetries :: p -> Symmetries p

  -- | DEF-007 — the composition and interaction rules C of P: tensor products,
  -- coupling terms, interfacing rules. C fixes the meaning of irreducibility
  -- (DEF-021).
  type Composition p
  composition :: p -> Composition p

-- | DEF-002 — the coordinate record form of P = (X, O, D, S, C): the same five
-- components as fields, for systems whose components are given as plain data.
-- This is a generic record instance of the schema, not a claim that any
-- particular physical system is fully captured by it.
data SystemRecord x o d s c = SystemRecord
  { stateSpaceData :: x
    -- ^ DEF-003 — state space X.
  , observablesData :: o
    -- ^ DEF-004 — observables O.
  , dynamicsData :: d
    -- ^ DEF-005 — dynamics D.
  , symmetriesData :: s
    -- ^ DEF-006 — symmetries and constraints S.
  , compositionData :: c
    -- ^ DEF-007 — composition and interaction rules C.
  }
  deriving (Eq, Show)

instance PhysicalSystem (SystemRecord x o d s c) where
  type StateSpace (SystemRecord x o d s c) = x
  type Observables (SystemRecord x o d s c) = o
  type Dynamics (SystemRecord x o d s c) = d
  type Symmetries (SystemRecord x o d s c) = s
  type Composition (SystemRecord x o d s c) = c
  stateSpace = stateSpaceData
  observables = observablesData
  dynamics = dynamicsData
  symmetries = symmetriesData
  composition = compositionData

-- | DEF-025 — value-level tags for the ten candidate structural families.
-- The families are full subcategories of Phys singled out by their underlying
-- mathematical structure; they are candidate organising families, not a
-- completed classification, and some may later be unified (DEF-025).
data StructuralFamily
  = FamilyI
    -- ^ DEF-026 — symplectic and Poisson structures.
  | FamilyII
    -- ^ DEF-027 — Hilbert spaces and operator algebras.
  | FamilyIII
    -- ^ DEF-028 — smooth manifolds and geometric structures.
  | FamilyIV
    -- ^ DEF-029 — principal bundles and connections.
  | FamilyV
    -- ^ DEF-030 — probability and measure-theoretic structures.
  | FamilyVI
    -- ^ DEF-031 — topological and higher-categorical structures.
  | FamilyVII
    -- ^ DEF-032 — dynamical systems and operator semigroups.
  | FamilyVIII
    -- ^ DEF-033 — tensor categories and compositional structures.
  | FamilyIX
    -- ^ DEF-034 — discrete combinatorial structures.
  | FamilyX
    -- ^ DEF-035 — derived and homotopical structures.
  deriving (Eq, Ord, Show, Enum, Bounded)

-- | The ontology identifier of each family, for mechanical cross-audit against
-- names used in other formal layers. Pure metadata; no mathematical claim.
familyDefId :: StructuralFamily -> String
familyDefId FamilyI = "DEF-026"
familyDefId FamilyII = "DEF-027"
familyDefId FamilyIII = "DEF-028"
familyDefId FamilyIV = "DEF-029"
familyDefId FamilyV = "DEF-030"
familyDefId FamilyVI = "DEF-031"
familyDefId FamilyVII = "DEF-032"
familyDefId FamilyVIII = "DEF-033"
familyDefId FamilyIX = "DEF-034"
familyDefId FamilyX = "DEF-035"

-- | DEF-026 — Family I: symplectic and Poisson structures. Representative
-- systems: classical mechanics. Local classification is trivial (Darboux
-- normal form: no local invariants); global content is topological. Poisson
-- data includes Weinstein splitting (symplectic x transverse), the
-- symplectic-leaf foliation, and coadjoint orbits for KKS leaves. The link to
-- Family II via deformation quantization is conjectural (DEF-026).
class FamilySymplecticPoisson p where
  -- | The symplectic or Poisson structural data of the system (symplectic
  -- form, Poisson bivector, leaf data). Abstract here; volumes fix the type.
  type SymplecticPoissonData p
  symplecticPoissonData :: p -> SymplecticPoissonData p

-- | DEF-027 — Family II: Hilbert spaces and operator algebras. Representative
-- systems: quantum mechanics. Finite-dimensional C*-algebras are classified by
-- dimension vector; amenable factors are classified; a general classification
-- of II_1\/III factors is impossible in the stated generality (T-OB-01).
class FamilyHilbertOperatorAlgebras p where
  -- | The Hilbert-space or operator-algebra structural data of the system
  -- (Hilbert space, C*- or von Neumann algebra, channel data). Abstract here.
  type OperatorAlgebraData p
  operatorAlgebraData :: p -> OperatorAlgebraData p

-- | DEF-028 — Family III: smooth manifolds and geometric structures.
-- Representative systems: relativity. Proven in restricted regimes (Lorentzian
-- holonomy, complete causal ladder, 8 Thurston geometries in dimension 3);
-- dimension 4 contains algorithmically unrecognizable instances (T-OB-05).
class FamilySmoothGeometric p where
  -- | The smooth or geometric structural data of the system (manifold,
  -- metric, connection-independent geometry). Abstract here.
  type GeometricData p
  geometricData :: p -> GeometricData p

-- | DEF-029 — Family IV: principal bundles and connections. Representative
-- systems: gauge theories. Bundles are classified by maps into BG and
-- characteristic classes; anomalies are classified as cohomological
-- obstructions. See Taxonomy.Invariants for the classifying data.
class FamilyPrincipalBundlesConnections p where
  -- | The principal-bundle and connection data of the system (bundle,
  -- structure group, connection, gauge data). Abstract here.
  type BundleConnectionData p
  bundleConnectionData :: p -> BundleConnectionData p

-- | DEF-030 — Family V: probability and measure-theoretic structures.
-- Representative systems: statistical physics. The Fisher metric is uniquely
-- monotone under stochastic maps in the classical case (Chentsov, T-BG-14);
-- quantum monotone metrics form a parametric family, not a finite list
-- (T-BG-18). Uniqueness does not extend to the quantum case.
class FamilyProbabilityMeasure p where
  -- | The probability or measure-theoretic data of the system (state space of
  -- measures, monotone metrics). Abstract here.
  type ProbabilityMeasureData p
  probabilityMeasureData :: p -> ProbabilityMeasureData p

-- | DEF-031 — Family VI: topological and higher-categorical structures.
-- Representative systems: TQFTs. Functorial TQFT is tractable under the Atiyah
-- axioms; the cobordism-hypothesis classification of extended TQFTs is
-- recorded as CLAIMED with a proof gap (T-OP-05), not as a completed theorem.
class FamilyTopologicalHigherCategorical p where
  -- | The topological or higher-categorical data of the system (cobordism
  -- datum, extended-TQFT structure). Abstract here.
  type HigherCategoricalData p
  higherCategoricalData :: p -> HigherCategoricalData p

-- | DEF-032 — Family VII: dynamical systems and operator semigroups.
-- Representative systems: dissipative and open systems. Stinespring gives a
-- minimal dilation of completely positive maps (a normal form, not an
-- isomorphism classification, T-BG-15); no classification theorem for the
-- family is on record.
class FamilyDynamicalSemigroups p where
  -- | The dynamical-semigroup data of the system (generator, semigroup,
  -- dilation data). Abstract here.
  type DynamicalSemigroupData p
  dynamicalSemigroupData :: p -> DynamicalSemigroupData p

-- | DEF-033 — Family VIII: tensor categories and compositional structures.
-- Representative systems: quantum information. Established islands (DR
-- reconstruction, Deligne's theorem) but open in general (fusion categories,
-- T-OP-01). The symmetric layer is load-bearing: tensor equivalence without
-- it cannot recover the group (DEF-018, T-OB-02).
class FamilyTensorCategoriesComposition p where
  -- | The tensor-category or compositional data of the system (tensor
  -- category, conjugates, pivotal structure). Abstract here.
  type TensorCategoryData p
  tensorCategoryData :: p -> TensorCategoryData p

-- | DEF-034 — Family IX: discrete combinatorial structures. Representative
-- systems: lattice and network models. Lattice theorems hold only in
-- restricted regimes; wild sectors forbid finite-variety parameterization
-- (T-OB-04) and sit beyond an algorithmic tractability boundary (T-OB-07).
class FamilyDiscreteCombinatorial p where
  -- | The lattice or combinatorial data of the system (graph, lattice,
  -- network, tame/wild class). Abstract here.
  type CombinatorialData p
  combinatorialData :: p -> CombinatorialData p

-- | DEF-035 — Family X: derived and homotopical structures. Representative
-- systems: higher gauge and derived field theories. Every finite-dimensional
-- algebra over an algebraically closed field is derived-tame or derived-wild,
-- wildness degeneration-robust (T-OB-04); no classification beyond that
-- dichotomy is claimed.
class FamilyDerivedHomotopical p where
  -- | The derived or homotopical data of the system (derived category,
  -- homotopical enhancement, derived-tame/wild class). Abstract here.
  type DerivedHomotopicalData p
  derivedHomotopicalData :: p -> DerivedHomotopicalData p
{-# LANGUAGE EmptyDataDecls #-}

-- | Module        : Taxonomy.Equivalences
-- Description     : Equivalence and duality vocabulary for Phys: mathematical
--                   versus physical equivalence, morphism kinds, and the
--                   structure-preserving requirement.
-- Ontology source : docs/ontology.md (DEF-008..DEF-018, DEF-038).
--
-- The morphisms of Phys (DEF-008) are admissible relationships —
-- coarse-graining, exact equivalences, embeddings, dualities, and certain
-- limiting procedures — but their preservation laws and composition rules are
-- not fixed: until DEF-014 is fixed, Phys is a schema, not a category, and
-- each volume must state which morphism classes are in force.
--
-- Claim status (docs/theorem-registry.md): vocabulary only; no proof is
-- claimed and no formalisation is asserted.
module Taxonomy.Equivalences
  ( -- * Morphism kinds (DEF-008..DEF-013)
    MorphismKind (..)
  , PreservationLaw
    -- * Equivalence kinds (DEF-015, DEF-016)
  , EquivalenceKind (..)
  , MathematicalEquivalence (..)
  , PhysicalEquivalence (..)
  , EquivalenceWitness (..)
    -- * Structure-preserving requirement (DEF-018)
  , PreservedStructure (..)
  , RecoveryObstruction (..)
    -- * Yoneda vocabulary (DEF-017, DEF-038)
  , YonedaEmbedding
  ) where

-- | DEF-008 — kinds of morphism of Phys: admissible relationships between
-- physical systems. The founding document names coarse-graining, exact
-- equivalences, embeddings, dualities, and certain limiting procedures; these
-- are not automatically compatible as ordinary categorical morphisms, and
-- whether one category suffices is open (DEF-008).
data MorphismKind
  = CoarseGraining
    -- ^ DEF-009 — forgets microscopic detail while preserving macroscopic
    -- observables. Which observables lift and which states are identified must
    -- be fixed per application.
  | EquivalenceMorphism
    -- ^ DEF-010 — an invertible morphism representing exact equivalence of
    -- representations; induces the relation of DEF-015 on objects.
  | Embedding
    -- ^ DEF-011 — realizes P_1 as a subsystem, subtheory, or substructure of
    -- P_2 (e.g. Gelfand-Naimark embeds every C*-algebra in B(H) — a
    -- representation theorem, not a classification).
  | Duality
    -- ^ DEF-012 — generally invertible only after passage to an appropriate
    -- opposite or dual category; must state which structure it preserves
    -- (DEF-018).
  | LimitingProcedure
    -- ^ DEF-013 — arises from a limit or colimit process: thermodynamic,
    -- infinite-volume, semiclassical, continuum. See Taxonomy.Constructions
    -- for the construction vocabulary.
  deriving (Eq, Ord, Show)

-- | DEF-014 — the explicitly stated conditions a morphism of a given kind must
-- satisfy, and the composition rule under which two such morphisms compose.
-- Stub: the law is left abstract on purpose. Status: open — until it is fixed,
-- Phys is a schema, not a category (DEF-014).
data PreservationLaw

-- | The two equivalence notions of the series (DEF-015, DEF-016), kept
-- strictly apart: mathematical equivalence is finer than physical equivalence
-- in general.
data EquivalenceKind
  = ByMathematicalEquivalence
    -- ^ DEF-016 — isomorphism of the tuples P = (X, O, D, S, C) in the ambient
    -- category of each component.
  | ByPhysicalEquivalence
    -- ^ DEF-015 — the chosen physical equivalence relation; the choice itself
    -- is open and is essential to the classification problem.
  deriving (Eq, Ord, Show)

-- | DEF-016 — mathematical equivalence: isomorphism of the representations
-- P = (X, O, D, S, C) in the ambient category of each component. Established
-- as a notion; strictly finer than physical equivalence in general.
class MathematicalEquivalence p where
  -- | Hook: whether two representations are isomorphic as tuples. Instances
  -- state the ambient categories in force; nothing is decided here.
  mathematicallyEquivalent :: p -> p -> Bool

-- | DEF-015 — physical equivalence: a carefully chosen equivalence relation on
-- Ob(Phys); the classification problem is Classify(Ob(Phys)/≃). The choice is
-- essential: two mathematical descriptions may be physically equivalent
-- without being mathematically isomorphic. Status: stipulative; the choice is
-- open.
class PhysicalEquivalence p where
  -- | Hook: whether two systems are physically equivalent under the relation
  -- the instance declares. The relation must be stated, not assumed.
  physicallyEquivalent :: p -> p -> Bool

-- | A record of a proposed identification of systems: which equivalence notion
-- is used, by what kind of morphism, and — per DEF-018 — exactly which layers
-- of structure the identification preserves. An identification that does not
-- name its preserved structure is not admissible in the series (DEF-018).
data EquivalenceWitness p q = EquivalenceWitness
  { equivalenceKind :: EquivalenceKind
    -- ^ DEF-015 or DEF-016 — which equivalence notion is in force.
  , equivalenceMorphismKind :: MorphismKind
    -- ^ DEF-008 — the morphism kind realizing the identification.
  , preservedStructure :: [PreservedStructure]
    -- ^ DEF-018 — the layers of structure preserved; must be stated.
  , equivalenceSource :: p
    -- ^ The source system P_1.
  , equivalenceTarget :: q
    -- ^ The target system P_2.
  }
  deriving (Eq, Show)

-- | DEF-018 — layers of structure an equivalence may claim to preserve. The
-- Etingof-Gelaki constraint: any equivalence used to identify systems must
-- state which layer it preserves, and equivalences that forget the
-- monoidal/symmetric layer are provably insufficient. Status: established as a
-- negative theorem (T-OB-02, complete-informal-proof).
data PreservedStructure
  = SymmetricMonoidalStructure
    -- ^ The symmetric monoidal layer (the load-bearing layer).
  | MonoidalStructure
    -- ^ The monoidal layer without symmetry.
  | BraidedStructure
    -- ^ The braided layer (cf. Mueger's Galois theory, which needs extra
    -- soliton data beyond braiding).
  | PlainTensorStructure
    -- ^ The plain tensor layer only — provably insufficient to recover the
    -- group (see 'TensorEquivalenceWithoutSymmetricStructure').
  | StarStructure
    -- ^ The *-structure of operator-algebraic data.
  | AlgebraicStructure
    -- ^ Algebraic structure (e.g. *-algebra isomorphism).
  | TopologicalStructure
    -- ^ Topological structure.
  | CompletePositivity
    -- ^ Complete positivity of channels (Stinespring equivalence, up to
    -- unitary freedom).
  | UnitaryFreedom
    -- ^ Unitary freedom of minimal dilations.
  deriving (Eq, Ord, Show)

-- | DEF-018 / T-OB-02 — recorded failures of recovery. Isocategorical groups:
-- non-isomorphic finite groups can carry equivalent representation categories
-- as plain tensor categories, so any equivalence that forgets the symmetric
-- layer cannot recover the group and any classification built on such an
-- equivalence is false (Etingof-Gelaki; periodic-table region (f),
-- IMPOSSIBLE as a recovery principle).
data RecoveryObstruction
  = TensorEquivalenceWithoutSymmetricStructure
  deriving (Eq, Ord, Show)

-- | DEF-038 — the Yoneda embedding P -> Hom_Phys(-, P), a faithful
-- mathematical representation of objects of a locally small Phys through their
-- relationships. Established mathematics; the physical interpretation is open.
-- The representation itself is left abstract here.
--
-- DEF-017 — the Yoneda qualification, quoted verbatim from the founding
-- document (§5) and binding on every volume:
-- "Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem."
-- The categorical structure must be given a physical interpretation
-- separately; nothing in this module treats representability as physical
-- equivalence.
data YonedaEmbedding
  deriving (Eq, Show)

exec
/usr/local/bin/zsh -lc "rg -n '"'^(class|instance|data|newtype|type) |verified|[Pp]roof|[Pp]roved|Lean|undefined|error |head |tail |!!|fromJust|read '"' src -g '*.hs'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
src/vol-02-structural-families/Instances.hs:19:-- is NOT verified by Lean and no such claim is made anywhere. The honest
src/vol-02-structural-families/Instances.hs:74:data SymplecticSystem = SymplecticSystem
src/vol-02-structural-families/Instances.hs:85:instance PhysicalSystem SymplecticSystem where
src/vol-02-structural-families/Instances.hs:97:instance FamilySymplecticPoisson SymplecticSystem where
src/vol-02-structural-families/Instances.hs:102:data CotangentBundleSystem = CotangentBundleSystem
src/vol-02-structural-families/Instances.hs:110:instance PhysicalSystem CotangentBundleSystem where
src/vol-02-structural-families/Instances.hs:122:instance FamilySymplecticPoisson CotangentBundleSystem where
src/vol-02-structural-families/Instances.hs:128:-- family of labelled fibres, which is the computational reading of the proof
src/vol-02-structural-families/Instances.hs:129:-- of Proposition 7.1. This is a model of the retraction and not a proof.
src/vol-02-structural-families/Instances.hs:143:newtype FiniteCStarAlgebra = FiniteCStarAlgebra [Int]
src/vol-02-structural-families/Instances.hs:171:instance PhysicalSystem FiniteCStarAlgebra where
src/vol-02-structural-families/Instances.hs:183:instance FamilyHilbertOperatorAlgebras FiniteCStarAlgebra where
src/vol-02-structural-families/Instances.hs:190:instance Constructible FiniteCStarAlgebra where
src/vol-02-structural-families/Instances.hs:205:instance Irreducible FiniteCStarAlgebra where
src/vol-02-structural-families/Instances.hs:210:instance Decomposable FiniteCStarAlgebra where
src/vol-02-structural-families/Instances.hs:222:instance MathematicalEquivalence FiniteCStarAlgebra where
src/vol-02-structural-families/Instances.hs:230:instance PhysicalEquivalence FiniteCStarAlgebra where
src/vol-02-structural-families/Instances.hs:235:data BinaryQuantumSystem = BinaryQuantumSystem
src/vol-02-structural-families/Instances.hs:240:instance PhysicalSystem BinaryQuantumSystem where
src/vol-02-structural-families/Instances.hs:252:instance FamilyHilbertOperatorAlgebras BinaryQuantumSystem where
src/vol-02-structural-families/Instances.hs:261:data LorentzianSystem = LorentzianSystem
src/vol-02-structural-families/Instances.hs:267:instance PhysicalSystem LorentzianSystem where
src/vol-02-structural-families/Instances.hs:279:instance FamilySmoothGeometric LorentzianSystem where
src/vol-02-structural-families/Instances.hs:290:data PrincipalU1Bundle = PrincipalU1Bundle
src/vol-02-structural-families/Instances.hs:295:instance PhysicalSystem PrincipalU1Bundle where
src/vol-02-structural-families/Instances.hs:307:instance FamilyPrincipalBundlesConnections PrincipalU1Bundle where
src/vol-02-structural-families/Instances.hs:317:data ClassicalStatisticalSystem = ClassicalStatisticalSystem
src/vol-02-structural-families/Instances.hs:331:instance PhysicalSystem ClassicalStatisticalSystem where
src/vol-02-structural-families/Instances.hs:343:instance FamilyProbabilityMeasure ClassicalStatisticalSystem where
src/vol-02-structural-families/Instances.hs:353:data TopologicalQFTSystem = TopologicalQFTSystem
src/vol-02-structural-families/Instances.hs:358:instance PhysicalSystem TopologicalQFTSystem where
src/vol-02-structural-families/Instances.hs:370:instance FamilyTopologicalHigherCategorical TopologicalQFTSystem where
src/vol-02-structural-families/Instances.hs:381:data QuantumChannelSystem = QuantumChannelSystem
src/vol-02-structural-families/Instances.hs:389:data ComplexPair = ComplexPair Double Double
src/vol-02-structural-families/Instances.hs:392:instance PhysicalSystem QuantumChannelSystem where
src/vol-02-structural-families/Instances.hs:404:instance FamilyDynamicalSemigroups QuantumChannelSystem where
src/vol-02-structural-families/Instances.hs:418:-- not a proof of the proposition.
src/vol-02-structural-families/Instances.hs:435:data SymmetricTensorCategorySystem = SymmetricTensorCategorySystem
src/vol-02-structural-families/Instances.hs:440:instance PhysicalSystem SymmetricTensorCategorySystem where
src/vol-02-structural-families/Instances.hs:452:instance FamilyTensorCategoriesComposition SymmetricTensorCategorySystem where
src/vol-02-structural-families/Instances.hs:461:data LatticeGaugeSystem = LatticeGaugeSystem
src/vol-02-structural-families/Instances.hs:467:instance PhysicalSystem LatticeGaugeSystem where
src/vol-02-structural-families/Instances.hs:479:instance FamilyDiscreteCombinatorial LatticeGaugeSystem where
src/vol-02-structural-families/Instances.hs:489:data DerivedAlgebraSystem = DerivedAlgebraSystem
src/vol-02-structural-families/Instances.hs:494:instance PhysicalSystem DerivedAlgebraSystem where
src/vol-02-structural-families/Instances.hs:506:instance FamilyDerivedHomotopical DerivedAlgebraSystem where
src/vol-02-structural-families/Instances.hs:539:data AchievementKind
src/vol-02-structural-families/Instances.hs:548:data ClassificationRecord = ClassificationRecord
src/vol-10-observational-equivalence/Instances.hs:7:-- Lean targets    : verification/vol-10-observational-equivalence-lean-targets.md
src/vol-10-observational-equivalence/Instances.hs:19:-- computational evidence. It proves nothing and is not verified by any proof
src/vol-10-observational-equivalence/Instances.hs:48:newtype Experiment = Experiment { outcomeBlocks :: [[Int]] }
src/vol-10-observational-equivalence/Instances.hs:55:data ObservationRecord = ObservationRecord
src/vol-10-observational-equivalence/Instances.hs:65:data FiniteClassicalSystem = FiniteClassicalSystem
src/vol-10-observational-equivalence/Instances.hs:77:instance PhysicalSystem FiniteClassicalSystem where
src/vol-10-observational-equivalence/Instances.hs:93:instance FamilyProbabilityMeasure FiniteClassicalSystem where
src/vol-10-observational-equivalence/Instances.hs:110:      [sum [probs !! i | i <- block] | block <- blocks]
src/vol-10-observational-equivalence/Instances.hs:120:instance MathematicalEquivalence ObservationRecord where
src/vol-10-observational-equivalence/Instances.hs:126:instance PhysicalEquivalence ObservationRecord where
src/vol-10-observational-equivalence/Instances.hs:132:newtype CoarseMap = CoarseMap [Experiment]
src/vol-10-observational-equivalence/Instances.hs:157:data FiniteQuantumSystem = FiniteQuantumSystem
src/vol-10-observational-equivalence/Instances.hs:167:instance FamilyHilbertOperatorAlgebras FiniteQuantumSystem where
src/vol-10-observational-equivalence/Instances.hs:176:instance FamilyProbabilityMeasure FiniteQuantumSystem where
src/vol-10-observational-equivalence/Instances.hs:192:    [ (rows !! i !! j) * (rows !! i !! j)
src/vol-10-observational-equivalence/Instances.hs:193:        / ((lams !! j) * f ((lams !! i) / (lams !! j)))
src/vol-10-observational-equivalence/Instances.hs:213:      sum [((rows !! i !! i) * (rows !! i !! i)) / (lams !! i) | i <- [0 .. length lams - 1]]
src/vol-10-observational-equivalence/Instances.hs:220:data IsocategoricalWitness = IsocategoricalWitness
src/vol-10-observational-equivalence/Instances.hs:235:instance FamilyTensorCategoriesComposition IsocategoricalWitness where
src/vol-05-classical-systems/Instances.hs:13:-- functions below carry the names used in the paper and in the Lean
src/vol-05-classical-systems/Instances.hs:18:-- computational evidence only. It proves nothing and is never "verified by
src/vol-05-classical-systems/Instances.hs:19:-- Lean": the honest statement is that these are executable models validated
src/vol-05-classical-systems/Instances.hs:50:newtype SymplecticForm = SymplecticForm [[Rational]]
src/vol-05-classical-systems/Instances.hs:55:newtype PoissonBivector = PoissonBivector [[Rational]]
src/vol-05-classical-systems/Instances.hs:59:newtype ProbVector = ProbVector [Rational]
src/vol-05-classical-systems/Instances.hs:63:newtype StochasticMatrix = StochasticMatrix [[Rational]]
src/vol-05-classical-systems/Instances.hs:68:newtype SymplecticSurface = SymplecticSurface (String, Rational)
src/vol-05-classical-systems/Instances.hs:73:data SymplecticSystem = SymplecticSystem
src/vol-05-classical-systems/Instances.hs:82:data PoissonSystem = PoissonSystem
src/vol-05-classical-systems/Instances.hs:90:data HamiltonianSystem = HamiltonianSystem
src/vol-05-classical-systems/Instances.hs:98:data ClassicalStatisticalSystem = ClassicalStatisticalSystem
src/vol-05-classical-systems/Instances.hs:115:-- | Lean target 'Darboux': the Darboux normal form at any point is the
src/vol-05-classical-systems/Instances.hs:122:-- | Lean target 'WeinsteinSplitting': the rank split of a Poisson tensor at a
src/vol-05-classical-systems/Instances.hs:131:-- | Lean target 'KKSSymplectic': the Kirillov-Kostant-Souriau form on the
src/vol-05-classical-systems/Instances.hs:138:-- | Lean target 'MoserStability': the hypothesis of the theorem is that the
src/vol-05-classical-systems/Instances.hs:145:-- | Lean target 'MonodromyObstruction': the monodromy matrix of the spherical
src/vol-05-classical-systems/Instances.hs:152:-- | Lean target 'FisherExplicit' and 'ChentsovFisher': the Fisher metric
src/vol-05-classical-systems/Instances.hs:170:          case break (\row -> row !! col /= 0) rows of
src/vol-05-classical-systems/Instances.hs:173:              let piv = pivot !! col
src/vol-05-classical-systems/Instances.hs:175:                  red row = zipWith (\a b -> a - (row !! col) * b) row norm
src/vol-05-classical-systems/Instances.hs:214:instance PhysicalSystem SymplecticSystem where
src/vol-05-classical-systems/Instances.hs:227:instance PhysicalSystem PoissonSystem where
src/vol-05-classical-systems/Instances.hs:240:instance PhysicalSystem HamiltonianSystem where
src/vol-05-classical-systems/Instances.hs:253:instance PhysicalSystem ClassicalStatisticalSystem where
src/vol-05-classical-systems/Instances.hs:267:instance FamilySymplecticPoisson SymplecticSystem where
src/vol-05-classical-systems/Instances.hs:272:instance FamilySymplecticPoisson PoissonSystem where
src/vol-05-classical-systems/Instances.hs:278:instance FamilySymplecticPoisson HamiltonianSystem where
src/vol-05-classical-systems/Instances.hs:284:instance FamilyProbabilityMeasure ClassicalStatisticalSystem where
src/vol-05-classical-systems/Instances.hs:291:instance Constructible SymplecticSystem where
src/vol-05-classical-systems/Instances.hs:302:instance Decomposable SymplecticSystem where
src/vol-05-classical-systems/Instances.hs:307:instance Irreducible SymplecticSurface where
src/vol-05-classical-systems/Instances.hs:314:instance MathematicalEquivalence SymplecticSystem where
src/vol-11-completeness-obstructions/Instances.hs:68:data ClassificationRegime
src/vol-11-completeness-obstructions/Instances.hs:74:    -- ^ The classification content is a proved impossibility theorem.
src/vol-11-completeness-obstructions/Instances.hs:92:data WitnessSystem
src/vol-11-completeness-obstructions/Instances.hs:133:data OperatorAlgebraWitness
src/vol-11-completeness-obstructions/Instances.hs:141:data DerivedWitness
src/vol-11-completeness-obstructions/Instances.hs:147:data TensorCategoryWitness
src/vol-11-completeness-obstructions/Instances.hs:157:data GeometricWitness
src/vol-11-completeness-obstructions/Instances.hs:165:data CombinatorialWitness
src/vol-11-completeness-obstructions/Instances.hs:192:instance FamilyHilbertOperatorAlgebras WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs:199:instance FamilyDerivedHomotopical WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs:204:instance FamilyTensorCategoriesComposition WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs:211:instance FamilySmoothGeometric WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs:217:instance FamilyDiscreteCombinatorial WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs:225:instance Constructible WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs:239:instance Irreducible WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs:247:instance Decomposable WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs:255:instance MathematicalEquivalence WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs:266:instance PhysicalEquivalence WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs:272:instance FamilyDynamicalSemigroups WitnessSystem where
src/vol-03-irreducibility-decomposition/Instances.hs:20:-- kernel-checked specifications through cross-audit and is NEVER "verified by
src/vol-03-irreducibility-decomposition/Instances.hs:21:-- Lean".
src/vol-03-irreducibility-decomposition/Instances.hs:68:newtype MatrixBlock = MatrixBlock { blockSize :: Int }
src/vol-03-irreducibility-decomposition/Instances.hs:75:newtype FiniteDimCStar = FiniteDimCStar { blocks :: [MatrixBlock] }
src/vol-03-irreducibility-decomposition/Instances.hs:123:newtype MultiplicityMatrix = MultiplicityMatrix { multRows :: [[Int]] }
src/vol-03-irreducibility-decomposition/Instances.hs:134:    && and [ sum [ blockSize (blocks dom !! i) * (rows !! i !! j) | i <- [0 .. k - 1] ]
src/vol-03-irreducibility-decomposition/Instances.hs:135:             == blockSize (blocks cod !! j)
src/vol-03-irreducibility-decomposition/Instances.hs:149:  , and [ blockSize (bs !! i) == blockSize (bs !! (perm !! i)) | i <- [0 .. length bs - 1] ]
src/vol-03-irreducibility-decomposition/Instances.hs:180:data KrausNormalForm = KrausNormalForm
src/vol-03-irreducibility-decomposition/Instances.hs:197:data TwoQubitSystem = TwoQubitSystem
src/vol-03-irreducibility-decomposition/Instances.hs:207:newtype SuperselectionPair = SuperselectionPair (FiniteDimCStar, FiniteDimCStar)
src/vol-03-irreducibility-decomposition/Instances.hs:213:instance Irreducible MatrixBlock where
src/vol-03-irreducibility-decomposition/Instances.hs:218:instance Irreducible FiniteDimCStar where
src/vol-03-irreducibility-decomposition/Instances.hs:224:instance Decomposable FiniteDimCStar where
src/vol-03-irreducibility-decomposition/Instances.hs:231:instance Decomposable MatrixBlock where
src/vol-03-irreducibility-decomposition/Instances.hs:238:instance Constructible FiniteDimCStar where
src/vol-03-irreducibility-decomposition/Instances.hs:249:instance Constructible MatrixBlock where
src/vol-03-irreducibility-decomposition/Instances.hs:260:instance FamilyHilbertOperatorAlgebras MatrixBlock where
src/vol-03-irreducibility-decomposition/Instances.hs:266:instance FamilyHilbertOperatorAlgebras FiniteDimCStar where
src/vol-03-irreducibility-decomposition/Instances.hs:273:instance FamilyDynamicalSemigroups KrausNormalForm where
src/vol-03-irreducibility-decomposition/Instances.hs:279:instance FamilyTensorCategoriesComposition TwoQubitSystem where
src/vol-03-irreducibility-decomposition/Instances.hs:285:instance MathematicalEquivalence FiniteDimCStar where
src/vol-04-yoneda-classification/Instances.hs:20:-- Nothing here is proof, and no claim of machine verification is made: the
src/vol-04-yoneda-classification/Instances.hs:68:data RelationalProfile probe probeMor rel = RelationalProfile
src/vol-04-yoneda-classification/Instances.hs:85:data CompactHausdorffSystem = CompactHausdorffSystem
src/vol-04-yoneda-classification/Instances.hs:96:instance PhysicalSystem CompactHausdorffSystem where
src/vol-04-yoneda-classification/Instances.hs:108:instance FamilySmoothGeometric CompactHausdorffSystem where
src/vol-04-yoneda-classification/Instances.hs:112:instance FamilyHilbertOperatorAlgebras CompactHausdorffSystem where
src/vol-04-yoneda-classification/Instances.hs:116:instance MathematicalEquivalence CompactHausdorffSystem where
src/vol-04-yoneda-classification/Instances.hs:119:instance PhysicalEquivalence CompactHausdorffSystem where
src/vol-04-yoneda-classification/Instances.hs:124:data BooleanAlgebraSystem = BooleanAlgebraSystem
src/vol-04-yoneda-classification/Instances.hs:132:instance PhysicalSystem BooleanAlgebraSystem where
src/vol-04-yoneda-classification/Instances.hs:144:instance FamilyDiscreteCombinatorial BooleanAlgebraSystem where
src/vol-04-yoneda-classification/Instances.hs:148:instance MathematicalEquivalence BooleanAlgebraSystem where
src/vol-04-yoneda-classification/Instances.hs:151:instance PhysicalEquivalence BooleanAlgebraSystem where
src/vol-04-yoneda-classification/Instances.hs:157:data FiniteGroupRepSystem = FiniteGroupRepSystem
src/vol-04-yoneda-classification/Instances.hs:166:instance PhysicalSystem FiniteGroupRepSystem where
src/vol-04-yoneda-classification/Instances.hs:178:instance FamilyTensorCategoriesComposition FiniteGroupRepSystem where
src/vol-04-yoneda-classification/Instances.hs:182:instance MathematicalEquivalence FiniteGroupRepSystem where
src/vol-04-yoneda-classification/Instances.hs:185:instance PhysicalEquivalence FiniteGroupRepSystem where
src/vol-04-yoneda-classification/Instances.hs:188:instance Constructible FiniteGroupRepSystem where
src/vol-04-yoneda-classification/Instances.hs:197:instance Irreducible FiniteGroupRepSystem where
src/vol-04-yoneda-classification/Instances.hs:200:instance Decomposable FiniteGroupRepSystem where
src/vol-04-yoneda-classification/Instances.hs:205:newtype Matrix = Matrix { entries :: [[Complex Double]] }
src/vol-04-yoneda-classification/Instances.hs:224:  Matrix [ [ conjugate ((rs !! j) !! i) | j <- [0 .. length rs - 1] ]
src/vol-04-yoneda-classification/Instances.hs:230:  Matrix [ [ (rs !! j) !! i | j <- [0 .. length rs - 1] ]
src/vol-04-yoneda-classification/Instances.hs:241:  Matrix [ concat [ map ((ar !! k) *) brow | k <- [0 .. length ar - 1] ]
src/vol-04-yoneda-classification/Instances.hs:244:         , let brow = b !! j ]
src/vol-04-yoneda-classification/Instances.hs:254:data KrausChannel = KrausChannel
src/vol-04-yoneda-classification/Instances.hs:285:data QuantumChannelSystem = QuantumChannelSystem
src/vol-04-yoneda-classification/Instances.hs:294:instance PhysicalSystem QuantumChannelSystem where
src/vol-04-yoneda-classification/Instances.hs:306:instance FamilyHilbertOperatorAlgebras QuantumChannelSystem where
src/vol-04-yoneda-classification/Instances.hs:310:instance FamilyDynamicalSemigroups QuantumChannelSystem where
src/vol-04-yoneda-classification/Instances.hs:314:instance MathematicalEquivalence QuantumChannelSystem where
src/vol-04-yoneda-classification/Instances.hs:317:instance PhysicalEquivalence QuantumChannelSystem where
src/vol-04-yoneda-classification/Instances.hs:320:instance Constructible QuantumChannelSystem where
src/vol-04-yoneda-classification/Instances.hs:337:instance Irreducible QuantumChannelSystem where
src/vol-04-yoneda-classification/Instances.hs:340:instance Decomposable QuantumChannelSystem where
src/vol-12-principia-physica/Instances.hs:23:-- never "verified by Lean"; the honest statement is that executable models
src/vol-12-principia-physica/Instances.hs:41:    -- * Executable checks (computational evidence, never proofs)
src/vol-12-principia-physica/Instances.hs:69:data Regime
src/vol-12-principia-physica/Instances.hs:82:data EvidenceGrade
src/vol-12-principia-physica/Instances.hs:102:data PrincipiaLayers m r e = PrincipiaLayers
src/vol-12-principia-physica/Instances.hs:116:newtype FiniteDimQuantumExample = FiniteDimQuantumExample
src/vol-12-principia-physica/Instances.hs:122:newtype MatrixBlock = MatrixBlock
src/vol-12-principia-physica/Instances.hs:158:instance PhysicalSystem FiniteDimQuantumExample where
src/vol-12-principia-physica/Instances.hs:170:instance FamilyHilbertOperatorAlgebras FiniteDimQuantumExample where
src/vol-12-principia-physica/Instances.hs:174:instance Irreducible MatrixBlock where
src/vol-12-principia-physica/Instances.hs:177:instance Decomposable FiniteDimQuantumExample where
src/vol-12-principia-physica/Instances.hs:185:instance MathematicalEquivalence FiniteDimQuantumExample where
src/vol-06-quantum-systems/Instances.hs:26:-- of the paper. It is not a proof and no machine-checked formalization is
src/vol-06-quantum-systems/Instances.hs:27:-- claimed for it; the Lean targets of the volume state what a future
src/vol-06-quantum-systems/Instances.hs:84:newtype FiniteDimCStar = FiniteDimCStar { blockSizes :: [Int] }
src/vol-06-quantum-systems/Instances.hs:89:newtype MatrixBlock = MatrixBlock { matrixSize :: Int }
src/vol-06-quantum-systems/Instances.hs:136:data DynamicsSpec
src/vol-06-quantum-systems/Instances.hs:143:data SymmetrySpec
src/vol-06-quantum-systems/Instances.hs:150:data CompositionSpec
src/vol-06-quantum-systems/Instances.hs:159:data QuantumSystemRecord = QuantumSystemRecord
src/vol-06-quantum-systems/Instances.hs:170:data Amenability = Amenable | NonAmenable
src/vol-06-quantum-systems/Instances.hs:176:data FactorDescriptor = FactorDescriptor
src/vol-06-quantum-systems/Instances.hs:188:data McDuffWitness = McDuffWitness
src/vol-06-quantum-systems/Instances.hs:208:data ChannelDescriptor = ChannelDescriptor
src/vol-06-quantum-systems/Instances.hs:230:data OperatorMonotoneParameter = OperatorMonotoneParameter
src/vol-06-quantum-systems/Instances.hs:243:data DensityMatrixSystem = DensityMatrixSystem
src/vol-06-quantum-systems/Instances.hs:252:data SuperselectionDescriptor = SuperselectionDescriptor
src/vol-06-quantum-systems/Instances.hs:263:newtype SuperselectionSystem = SuperselectionSystem
src/vol-06-quantum-systems/Instances.hs:270:instance PhysicalSystem QuantumSystemRecord where
src/vol-06-quantum-systems/Instances.hs:283:instance FamilyHilbertOperatorAlgebras QuantumSystemRecord where
src/vol-06-quantum-systems/Instances.hs:289:instance FamilyHilbertOperatorAlgebras FactorDescriptor where
src/vol-06-quantum-systems/Instances.hs:296:instance FamilyDynamicalSemigroups ChannelDescriptor where
src/vol-06-quantum-systems/Instances.hs:303:instance FamilyProbabilityMeasure DensityMatrixSystem where
src/vol-06-quantum-systems/Instances.hs:309:instance FamilyTensorCategoriesComposition SuperselectionSystem where
src/vol-06-quantum-systems/Instances.hs:315:instance Constructible FiniteDimCStar where
src/vol-06-quantum-systems/Instances.hs:327:instance Decomposable FiniteDimCStar where
src/vol-06-quantum-systems/Instances.hs:336:instance Irreducible MatrixBlock where
src/vol-06-quantum-systems/Instances.hs:342:instance MathematicalEquivalence FiniteDimCStar where
src/vol-08-spacetime-reconstruction/Instances.hs:20:-- modeling evidence. It is NOT verified by Lean and no proof assistant has
src/vol-08-spacetime-reconstruction/Instances.hs:62:newtype EventManifold = EventManifold Int
src/vol-08-spacetime-reconstruction/Instances.hs:68:newtype SmoothObservables = SmoothObservables String
src/vol-08-spacetime-reconstruction/Instances.hs:74:data DynamicsData = GeodesicFlow | FixedGeometry
src/vol-08-spacetime-reconstruction/Instances.hs:79:newtype IsometryData = IsometryData String
src/vol-08-spacetime-reconstruction/Instances.hs:83:data CompositionRules = ProductGluing | DisjointUnion | BoundaryGluing
src/vol-08-spacetime-reconstruction/Instances.hs:90:data LorentzianHolonomyType
src/vol-08-spacetime-reconstruction/Instances.hs:104:data CausalRung
src/vol-08-spacetime-reconstruction/Instances.hs:132:data LorentzianMetricData = LorentzianMetricData
src/vol-08-spacetime-reconstruction/Instances.hs:149:data LorentzianSpacetime = LorentzianSpacetime
src/vol-08-spacetime-reconstruction/Instances.hs:161:instance PhysicalSystem LorentzianSpacetime where
src/vol-08-spacetime-reconstruction/Instances.hs:173:instance FamilySmoothGeometric LorentzianSpacetime where
src/vol-08-spacetime-reconstruction/Instances.hs:181:instance MathematicalEquivalence LorentzianSpacetime where
src/vol-08-spacetime-reconstruction/Instances.hs:187:data ThurstonGeometry3
src/vol-08-spacetime-reconstruction/Instances.hs:203:instance FamilySmoothGeometric ThurstonGeometry3 where
src/vol-08-spacetime-reconstruction/Instances.hs:209:newtype RegionLabels = RegionLabels [String]
src/vol-08-spacetime-reconstruction/Instances.hs:213:data NoDynamics = NoDynamics
src/vol-08-spacetime-reconstruction/Instances.hs:217:newtype RegionPermutation = RegionPermutation [Int]
src/vol-08-spacetime-reconstruction/Instances.hs:223:newtype HolographicEntropyVector = HolographicEntropyVector [(Int, Rational)]
src/vol-08-spacetime-reconstruction/Instances.hs:233:instance PhysicalSystem HolographicEntropyVector where
src/vol-08-spacetime-reconstruction/Instances.hs:245:instance FamilyProbabilityMeasure HolographicEntropyVector where
src/vol-08-spacetime-reconstruction/Instances.hs:283:-- strong subadditivity and violates monogamy. Evidence only; not a proof.
src/vol-07-gauge-qft/Instances.hs:21:-- is "verified by Lean". Literature results cited in the comments carry their
src/vol-07-gauge-qft/Instances.hs:22:-- registry status (complete-informal-proof at best).
src/vol-07-gauge-qft/Instances.hs:74:data GaugeGroup
src/vol-07-gauge-qft/Instances.hs:119:data BaseSpace
src/vol-07-gauge-qft/Instances.hs:127:data PrincipalBundleSystem = PrincipalBundleSystem
src/vol-07-gauge-qft/Instances.hs:176:data AnomalyData = AnomalyData
src/vol-07-gauge-qft/Instances.hs:203:data FrobeniusSystem = FrobeniusSystem
src/vol-07-gauge-qft/Instances.hs:215:data SectorSystem = SectorSystem
src/vol-07-gauge-qft/Instances.hs:226:data ProductBundleSystem = ProductBundleSystem
src/vol-07-gauge-qft/Instances.hs:234:instance PhysicalSystem PrincipalBundleSystem where
src/vol-07-gauge-qft/Instances.hs:249:instance FamilyPrincipalBundlesConnections PrincipalBundleSystem where
src/vol-07-gauge-qft/Instances.hs:255:instance FamilyTopologicalHigherCategorical FrobeniusSystem where
src/vol-07-gauge-qft/Instances.hs:260:instance FamilyTensorCategoriesComposition SectorSystem where
src/vol-07-gauge-qft/Instances.hs:268:instance Constructible PrincipalBundleSystem where
src/Taxonomy/Families.hs:51:class PhysicalSystem p where
src/Taxonomy/Families.hs:82:data SystemRecord x o d s c = SystemRecord
src/Taxonomy/Families.hs:96:instance PhysicalSystem (SystemRecord x o d s c) where
src/Taxonomy/Families.hs:112:data StructuralFamily
src/Taxonomy/Families.hs:155:class FamilySymplecticPoisson p where
src/Taxonomy/Families.hs:165:class FamilyHilbertOperatorAlgebras p where
src/Taxonomy/Families.hs:175:class FamilySmoothGeometric p where
src/Taxonomy/Families.hs:185:class FamilyPrincipalBundlesConnections p where
src/Taxonomy/Families.hs:196:class FamilyProbabilityMeasure p where
src/Taxonomy/Families.hs:205:-- recorded as CLAIMED with a proof gap (T-OP-05), not as a completed theorem.
src/Taxonomy/Families.hs:206:class FamilyTopologicalHigherCategorical p where
src/Taxonomy/Families.hs:217:class FamilyDynamicalSemigroups p where
src/Taxonomy/Families.hs:228:class FamilyTensorCategoriesComposition p where
src/Taxonomy/Families.hs:238:class FamilyDiscreteCombinatorial p where
src/Taxonomy/Families.hs:249:class FamilyDerivedHomotopical p where
src/Taxonomy/Equivalences.hs:15:-- Claim status (docs/theorem-registry.md): vocabulary only; no proof is
src/Taxonomy/Equivalences.hs:38:data MorphismKind
src/Taxonomy/Equivalences.hs:40:    -- ^ DEF-009 — forgets microscopic detail while preserving macroscopic
src/Taxonomy/Equivalences.hs:64:data PreservationLaw
src/Taxonomy/Equivalences.hs:69:data EquivalenceKind
src/Taxonomy/Equivalences.hs:81:class MathematicalEquivalence p where
src/Taxonomy/Equivalences.hs:91:class PhysicalEquivalence p where
src/Taxonomy/Equivalences.hs:100:data EquivalenceWitness p q = EquivalenceWitness
src/Taxonomy/Equivalences.hs:118:-- negative theorem (T-OB-02, complete-informal-proof).
src/Taxonomy/Equivalences.hs:119:data PreservedStructure
src/Taxonomy/Equivalences.hs:149:data RecoveryObstruction
src/Taxonomy/Equivalences.hs:164:data YonedaEmbedding
src/Taxonomy/Invariants.hs:16:-- accessor shape only. It claims no proof and no formalisation; cited
src/Taxonomy/Invariants.hs:18:-- (literature results are 'complete-informal-proof' at best, never
src/Taxonomy/Invariants.hs:65:data InvariantRecord s o d g r = InvariantRecord
src/Taxonomy/Invariants.hs:84:data ClassifyingInvariant
src/Taxonomy/Invariants.hs:87:    -- complete-informal-proof).
src/Taxonomy/Invariants.hs:103:    -- informal proof sketch, so the classification claim is recorded as
src/Taxonomy/Invariants.hs:104:    -- CLAIMED with a proof gap, T-OP-05).
src/Taxonomy/Invariants.hs:199:-- complete-informal-proof). Encoding: the block sizes as a list; the
src/Taxonomy/Invariants.hs:201:newtype DimensionVector = DimensionVector [Int]
src/Taxonomy/Invariants.hs:206:data LieDiagram
src/Taxonomy/Invariants.hs:215:data DynkinDiagram
src/Taxonomy/Invariants.hs:229:data SatakeDiagram
src/Taxonomy/Invariants.hs:236:data WeightData = WeightData
src/Taxonomy/Invariants.hs:247:newtype CasimirData = CasimirData [Rational]
src/Taxonomy/Invariants.hs:252:-- complete-informal-proof): types I_n, I_infinity, II_1, II_infinity,
src/Taxonomy/Invariants.hs:255:data MurrayVonNeumannType
src/Taxonomy/Invariants.hs:275:data ConnesInvariants
src/Taxonomy/Invariants.hs:282:data ClassifyingSpaceMap
src/Taxonomy/Invariants.hs:287:data CharacteristicClass
src/Taxonomy/Invariants.hs:302:-- note: the classification statement is recorded as CLAIMED with a proof gap
src/Taxonomy/Invariants.hs:303:-- (T-OP-05); nothing here treats it as proved.
src/Taxonomy/Invariants.hs:304:data FullyDualizableObject
src/Taxonomy/Invariants.hs:309:-- classified (T-BG-11, complete-informal-proof).
src/Taxonomy/Invariants.hs:310:data HolonomyGroup
src/Taxonomy/Invariants.hs:315:data CausalClass
src/Taxonomy/Invariants.hs:330:data HolographicInequalityData = HolographicInequalityData
src/Taxonomy/Invariants.hs:339:data EntropyInequality
src/Taxonomy/Invariants.hs:348:data FisherMetric
src/Taxonomy/Invariants.hs:355:data MonotoneMetric
src/Taxonomy/Invariants.hs:362:newtype EntropyHook s e = EntropyHook (s -> Maybe e)
src/Taxonomy/Constructions.hs:16:-- No construction is computed here and no proof is claimed. The structural
src/Taxonomy/Constructions.hs:46:data Construction
src/Taxonomy/Constructions.hs:65:data ExtensionKind
src/Taxonomy/Constructions.hs:76:data LimitKind
src/Taxonomy/Constructions.hs:85:data QuotientKind
src/Taxonomy/Constructions.hs:95:class Constructible p where
src/Taxonomy/Constructions.hs:126:class Irreducible p where
src/Taxonomy/Constructions.hs:137:data Decomposition p = Decomposition
src/Taxonomy/Constructions.hs:148:class Decomposable p where
src/Taxonomy/Constructions.hs:156:data Closure = Closure
src/vol-09-gravity-information-geometry/Instances.hs:19:-- evidence only. It is NOT machine-checked and is never 'verified by Lean';
src/vol-09-gravity-information-geometry/Instances.hs:21:-- specifications' once the Lean layer exists.
src/vol-09-gravity-information-geometry/Instances.hs:52:data FisherMetricData = FisherMetricData
src/vol-09-gravity-information-geometry/Instances.hs:65:data PetzMetricData
src/vol-09-gravity-information-geometry/Instances.hs:77:data RuppeinerMetricData = RuppeinerMetricData
src/vol-09-gravity-information-geometry/Instances.hs:87:data EntropyWedgeData = EntropyWedgeData
src/vol-09-gravity-information-geometry/Instances.hs:93:    -- ^ Number of boundary regions; the proved entropy-cone range is <= 5.
src/vol-09-gravity-information-geometry/Instances.hs:100:data ClassicalStatisticalModel = ClassicalStatisticalModel
src/vol-09-gravity-information-geometry/Instances.hs:110:data QuantumStateSystem = QuantumStateSystem
src/vol-09-gravity-information-geometry/Instances.hs:117:-- the entropy-cone range in force (at most 5 regions is the proved range of
src/vol-09-gravity-information-geometry/Instances.hs:119:data EntanglementWedgeSystem = EntanglementWedgeSystem
src/vol-09-gravity-information-geometry/Instances.hs:128:data ThermodynamicGeometrySystem = ThermodynamicGeometrySystem
src/vol-09-gravity-information-geometry/Instances.hs:138:data WeightedNerveModel = WeightedNerveModel
src/vol-09-gravity-information-geometry/Instances.hs:148:instance FamilyProbabilityMeasure ClassicalStatisticalModel where
src/vol-09-gravity-information-geometry/Instances.hs:154:instance FamilyProbabilityMeasure QuantumStateSystem where
src/vol-09-gravity-information-geometry/Instances.hs:160:instance FamilyHilbertOperatorAlgebras QuantumStateSystem where
src/vol-09-gravity-information-geometry/Instances.hs:166:instance FamilyHilbertOperatorAlgebras EntanglementWedgeSystem where
src/vol-09-gravity-information-geometry/Instances.hs:172:instance FamilyTensorCategoriesComposition EntanglementWedgeSystem where
src/vol-09-gravity-information-geometry/Instances.hs:178:instance FamilyProbabilityMeasure ThermodynamicGeometrySystem where
src/vol-09-gravity-information-geometry/Instances.hs:184:instance FamilySmoothGeometric ThermodynamicGeometrySystem where
src/vol-09-gravity-information-geometry/Instances.hs:190:instance FamilyDiscreteCombinatorial WeightedNerveModel where
src/vol-09-gravity-information-geometry/Instances.hs:196:instance FamilySmoothGeometric WeightedNerveModel where
src/vol-09-gravity-information-geometry/Instances.hs:203:instance PhysicalSystem ClassicalStatisticalModel where
src/vol-09-gravity-information-geometry/Instances.hs:216:instance PhysicalSystem QuantumStateSystem where
src/vol-09-gravity-information-geometry/Instances.hs:229:instance PhysicalSystem EntanglementWedgeSystem where
src/vol-09-gravity-information-geometry/Instances.hs:242:instance PhysicalSystem ThermodynamicGeometrySystem where
src/vol-09-gravity-information-geometry/Instances.hs:256:instance PhysicalSystem WeightedNerveModel where
src/vol-09-gravity-information-geometry/Instances.hs:271:instance Decomposable ClassicalStatisticalModel where
src/vol-09-gravity-information-geometry/Instances.hs:280:instance Decomposable EntanglementWedgeSystem where
src/vol-01-foundations/Instances.hs:16:of the paper, with names mirroring the paper and the Lean targets of
src/vol-01-foundations/Instances.hs:20:evidence, never proof. Nothing here is machine-checked, and no executable
src/vol-01-foundations/Instances.hs:21:model is verified by Lean. The Lean formalizations live in lean/Cmrps/ and
src/vol-01-foundations/Instances.hs:67:newtype FiniteStateSpace = FiniteStateSpace [Int]
src/vol-01-foundations/Instances.hs:72:newtype FullFunctionAlgebra = FullFunctionAlgebra Int
src/vol-01-foundations/Instances.hs:76:data IdentityDynamics = IdentityDynamics
src/vol-01-foundations/Instances.hs:80:data TrivialSymmetry = TrivialSymmetry
src/vol-01-foundations/Instances.hs:84:data DisjointUnionComposition = DisjointUnionComposition
src/vol-01-foundations/Instances.hs:88:data CartesianProductComposition = CartesianProductComposition
src/vol-01-foundations/Instances.hs:93:newtype DiscreteTimeMap = DiscreteTimeMap [(Int, Int)]
src/vol-01-foundations/Instances.hs:100:data Factorization = Factorization
src/vol-01-foundations/Instances.hs:106:-- | Definition 3.6 (Lean target vol01.finiteState.classify_iff_card_eq):
src/vol-01-foundations/Instances.hs:108:data FiniteStateSystem = FiniteStateSystem
src/vol-01-foundations/Instances.hs:113:-- | Example 7.5 (Lean target vol01.product.irreducible_iff_prime_card): the
src/vol-01-foundations/Instances.hs:115:data FiniteProductSystem = FiniteProductSystem
src/vol-01-foundations/Instances.hs:120:-- | Definition 3.7 (Lean targets vol01.dynamics.irreducible_iff_connected
src/vol-01-foundations/Instances.hs:123:data FiniteDynamicalSystem = FiniteDynamicalSystem
src/vol-01-foundations/Instances.hs:129:-- | Definition 3.8 (Lean target vol01.qubit.factorization_nonunique):
src/vol-01-foundations/Instances.hs:131:data BipartiteQubitSystem = BipartiteQubitSystem
src/vol-01-foundations/Instances.hs:139:instance PhysicalSystem FiniteStateSystem where
src/vol-01-foundations/Instances.hs:152:instance PhysicalSystem FiniteProductSystem where
src/vol-01-foundations/Instances.hs:165:instance PhysicalSystem FiniteDynamicalSystem where
src/vol-01-foundations/Instances.hs:178:instance PhysicalSystem BipartiteQubitSystem where
src/vol-01-foundations/Instances.hs:192:instance MathematicalEquivalence FiniteStateSystem where
src/vol-01-foundations/Instances.hs:196:instance MathematicalEquivalence FiniteProductSystem where
src/vol-01-foundations/Instances.hs:203:instance MathematicalEquivalence FiniteDynamicalSystem where
src/vol-01-foundations/Instances.hs:211:instance MathematicalEquivalence BipartiteQubitSystem where
src/vol-01-foundations/Instances.hs:221:instance PhysicalEquivalence FiniteStateSystem where
src/vol-01-foundations/Instances.hs:226:instance PhysicalEquivalence FiniteDynamicalSystem where
src/vol-01-foundations/Instances.hs:232:instance PhysicalEquivalence BipartiteQubitSystem where
src/vol-01-foundations/Instances.hs:238:instance Constructible FiniteStateSystem where
src/vol-01-foundations/Instances.hs:249:instance Constructible FiniteProductSystem where
src/vol-01-foundations/Instances.hs:261:instance Constructible FiniteDynamicalSystem where
src/vol-01-foundations/Instances.hs:279:-- reason a composite cannot be read off the bare record.
src/vol-01-foundations/Instances.hs:280:instance Constructible BipartiteQubitSystem where
src/vol-01-foundations/Instances.hs:290:-- union. Lean target vol01.finiteState.irreducible_iff_card_eq_one.
src/vol-01-foundations/Instances.hs:291:instance Irreducible FiniteStateSystem where
src/vol-01-foundations/Instances.hs:295:instance Irreducible FiniteProductSystem where
src/vol-01-foundations/Instances.hs:300:instance Irreducible FiniteDynamicalSystem where
src/vol-01-foundations/Instances.hs:305:instance Irreducible BipartiteQubitSystem where
src/vol-01-foundations/Instances.hs:310:instance Decomposable FiniteStateSystem where
src/vol-01-foundations/Instances.hs:319:-- Lean target vol01.product.irreducible_iff_prime_card.
src/vol-01-foundations/Instances.hs:320:instance Decomposable FiniteProductSystem where
src/vol-01-foundations/Instances.hs:330:instance Decomposable FiniteDynamicalSystem where
src/vol-01-foundations/Instances.hs:345:instance Decomposable BipartiteQubitSystem where
src/vol-01-foundations/Instances.hs:401:      (i : _) -> phi !! i
src/vol-01-foundations/Instances.hs:420:    _ -> error "schmidtCoefficients: expected four amplitudes"
src/vol-01-foundations/Instances.hs:429:-- never proof; the proofs live in the paper.
src/vol-01-foundations/Main.hs:3:-- only; nothing here is proof and nothing here is verified by Lean.

exec
/usr/local/bin/zsh -lc 'cat src/vol-01-foundations/Instances.hs src/vol-01-foundations/Main.hs' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
{-# LANGUAGE TypeFamilies #-}

{-|
Module      : Vol01Foundations.Instances
Description : Taxonomy instances for the records of vol-01-foundations.
Copyright   : (c) Matthew Long, 2026
License     : MIT
Maintainer  : matthew@yonedaai.com
Stability   : experimental

Executable instance layer for "Foundations of Structural Classification"
(Part 1 of The Classification of Mathematical Representations of Physical
Systems). The shared family classes live in "Taxonomy.Families",
"Taxonomy.Constructions", and "Taxonomy.Equivalences"; this module imports
them and declares instances for the physical systems of Definitions 3.6 to 3.8
of the paper, with names mirroring the paper and the Lean targets of
verification/vol-01-foundations-lean-targets.md.

Claim status (docs/theorem-registry.md): this module is computational
evidence, never proof. Nothing here is machine-checked, and no executable
model is verified by Lean. The Lean formalizations live in lean/Cmrps/ and
build cleanly (verification/lean-build.log); this module is validated against
them by cross-audit only.
-}
module Vol01Foundations.Instances
  ( -- * Record component data (Definition 3.1)
    FiniteStateSpace (..)
  , FullFunctionAlgebra (..)
  , IdentityDynamics (..)
  , TrivialSymmetry (..)
  , DisjointUnionComposition (..)
  , CartesianProductComposition (..)
  , DiscreteTimeMap (..)
  , Factorization (..)
    -- * Systems (Definitions 3.6 to 3.8)
  , FiniteStateSystem (..)
  , FiniteProductSystem (..)
  , FiniteDynamicalSystem (..)
  , BipartiteQubitSystem (..)
    -- * Computations mirroring the paper
  , primeFactors
  , functionalGraphComponents
  , conjugateMaps
  , schmidtCoefficients
  , schmidtRank
    -- * Demonstration
  , demo
  ) where

import Data.Complex (Complex (..), magnitude)
import Data.List (nub, permutations, sort)

import Taxonomy.Constructions
  ( Construction (..)
  , Constructible (..)
  , Decomposable (..)
  , Decomposition (..)
  , Irreducible (..)
  )
import Taxonomy.Equivalences
  ( MathematicalEquivalence (..)
  , PhysicalEquivalence (..)
  )
import Taxonomy.Families (PhysicalSystem (..))

-- | DEF-003 for the finite classes: the state space X = {0, ..., n-1}.
newtype FiniteStateSpace = FiniteStateSpace [Int]
  deriving (Eq, Show)

-- | DEF-004 for the finite classes: the full algebra O = R^X, recorded by
-- the cardinality of X since the algebra is determined by it.
newtype FullFunctionAlgebra = FullFunctionAlgebra Int
  deriving (Eq, Show)

-- | DEF-005 in the trivial case: identity dynamics.
data IdentityDynamics = IdentityDynamics
  deriving (Eq, Show)

-- | DEF-006 in the trivial case: the trivial symmetry group.
data TrivialSymmetry = TrivialSymmetry
  deriving (Eq, Show)

-- | DEF-007 for Definition 3.6: C is the disjoint union of state spaces.
data DisjointUnionComposition = DisjointUnionComposition
  deriving (Eq, Show)

-- | DEF-007 for Example 7.5: C is the cartesian product of state spaces.
data CartesianProductComposition = CartesianProductComposition
  deriving (Eq, Show)

-- | DEF-005 for Definition 3.7: dynamics given by a self-map f, recorded as
-- its graph.
newtype DiscreteTimeMap = DiscreteTimeMap [(Int, Int)]
  deriving (Eq, Show)

-- | DEF-007 for Definition 3.8: a chosen factorization of a four-dimensional
-- space into two qubit factors. Proposition 7.6 shows this data is not
-- recoverable from the bare record. The tag stores the factor dimensions;
-- the basis change of Proposition 7.6 is realized in the Phase D experiment.
data Factorization = Factorization
  { factorDimA :: Int
  , factorDimB :: Int
  }
  deriving (Eq, Show)

-- | Definition 3.6 (Lean target vol01.finiteState.classify_iff_card_eq):
-- finite classical records P = (X, R^X, id, trivial, disjoint union).
data FiniteStateSystem = FiniteStateSystem
  { fsCardinality :: Int
  }
  deriving (Eq, Show)

-- | Example 7.5 (Lean target vol01.product.irreducible_iff_prime_card): the
-- same records with composition rule the cartesian product.
data FiniteProductSystem = FiniteProductSystem
  { fpsCardinality :: Int
  }
  deriving (Eq, Show)

-- | Definition 3.7 (Lean targets vol01.dynamics.irreducible_iff_connected
-- and vol01.dynamics.connected_components_unique): finite dynamical records
-- with a self-map of discrete time.
data FiniteDynamicalSystem = FiniteDynamicalSystem
  { fdsStates :: [Int]
  , fdsMap :: [(Int, Int)]
  }
  deriving (Eq, Show)

-- | Definition 3.8 (Lean target vol01.qubit.factorization_nonunique):
-- bipartite qubit records, carrying a chosen factorization.
data BipartiteQubitSystem = BipartiteQubitSystem
  { bqsAmplitudes :: [(Double, Double)]
    -- ^ Four complex amplitudes of the state vector, as (real, imaginary).
  , bqsFactorization :: Factorization
  }
  deriving (Eq, Show)

-- | DEF-002 record schema: finite classical systems.
instance PhysicalSystem FiniteStateSystem where
  type StateSpace FiniteStateSystem = FiniteStateSpace
  type Observables FiniteStateSystem = FullFunctionAlgebra
  type Dynamics FiniteStateSystem = IdentityDynamics
  type Symmetries FiniteStateSystem = TrivialSymmetry
  type Composition FiniteStateSystem = DisjointUnionComposition
  stateSpace p = FiniteStateSpace [0 .. fsCardinality p - 1]
  observables p = FullFunctionAlgebra (fsCardinality p)
  dynamics _ = IdentityDynamics
  symmetries _ = TrivialSymmetry
  composition _ = DisjointUnionComposition

-- | DEF-002 record schema: finite systems with product composition.
instance PhysicalSystem FiniteProductSystem where
  type StateSpace FiniteProductSystem = FiniteStateSpace
  type Observables FiniteProductSystem = FullFunctionAlgebra
  type Dynamics FiniteProductSystem = IdentityDynamics
  type Symmetries FiniteProductSystem = TrivialSymmetry
  type Composition FiniteProductSystem = CartesianProductComposition
  stateSpace p = FiniteStateSpace [0 .. fpsCardinality p - 1]
  observables p = FullFunctionAlgebra (fpsCardinality p)
  dynamics _ = IdentityDynamics
  symmetries _ = TrivialSymmetry
  composition _ = CartesianProductComposition

-- | DEF-002 record schema: finite dynamical systems.
instance PhysicalSystem FiniteDynamicalSystem where
  type StateSpace FiniteDynamicalSystem = FiniteStateSpace
  type Observables FiniteDynamicalSystem = FullFunctionAlgebra
  type Dynamics FiniteDynamicalSystem = DiscreteTimeMap
  type Symmetries FiniteDynamicalSystem = TrivialSymmetry
  type Composition FiniteDynamicalSystem = DisjointUnionComposition
  stateSpace p = FiniteStateSpace (fdsStates p)
  observables p = FullFunctionAlgebra (length (fdsStates p))
  dynamics p = DiscreteTimeMap (fdsMap p)
  symmetries _ = TrivialSymmetry
  composition _ = DisjointUnionComposition

-- | DEF-002 record schema: bipartite qubit systems.
instance PhysicalSystem BipartiteQubitSystem where
  type StateSpace BipartiteQubitSystem = [(Double, Double)]
  type Observables BipartiteQubitSystem = FullFunctionAlgebra
  type Dynamics BipartiteQubitSystem = IdentityDynamics
  type Symmetries BipartiteQubitSystem = Factorization
  type Composition BipartiteQubitSystem = Factorization
  stateSpace = bqsAmplitudes
  observables _ = FullFunctionAlgebra 4
  dynamics _ = IdentityDynamics
  symmetries = bqsFactorization
  composition = bqsFactorization

-- | DEF-016 on Definition 3.6: Theorem 8.1, claim 3. Two finite classical
-- records are isomorphic exactly when their cardinalities agree.
instance MathematicalEquivalence FiniteStateSystem where
  mathematicallyEquivalent a b = fsCardinality a == fsCardinality b

-- | DEF-016 on Example 7.5: isomorphism is still a bijection of state spaces.
instance MathematicalEquivalence FiniteProductSystem where
  mathematicallyEquivalent a b = fpsCardinality a == fpsCardinality b

-- | DEF-016 on Definition 3.7: Theorem 8.2, claim 3. Isomorphism of dynamical
-- records is conjugacy of the self-maps. Decided by brute force on the
-- symmetric group for up to eight states, which covers the Phase D
-- enumerations; larger systems are outside the scope of this instance.
instance MathematicalEquivalence FiniteDynamicalSystem where
  mathematicallyEquivalent a b =
    length (fdsStates a) == length (fdsStates b)
      && length (fdsStates a) <= 8
      && conjugateMaps a b

-- | DEF-016 on Definition 3.8: isomorphism of qubit records is local-unitary
-- equivalence, decided by equality of Schmidt coefficient lists.
instance MathematicalEquivalence BipartiteQubitSystem where
  mathematicallyEquivalent a b =
    map round6 (schmidtCoefficients (bqsAmplitudes a))
      == map round6 (schmidtCoefficients (bqsAmplitudes b))
    where
      round6 :: Double -> Double
      round6 x = fromIntegral (round (x * 1.0e6) :: Integer) / 1.0e6

-- | DEF-015 on Definition 3.6: the declared equivalence for the restricted
-- class is mathematical equivalence (condition AC-6 of the paper).
instance PhysicalEquivalence FiniteStateSystem where
  physicallyEquivalent = mathematicallyEquivalent

-- | DEF-015 on Definition 3.7: the declared equivalence is mathematical
-- equivalence.
instance PhysicalEquivalence FiniteDynamicalSystem where
  physicallyEquivalent = mathematicallyEquivalent

-- | DEF-015 on Definition 3.8: the declared relation compares local-unitary
-- classes through Schmidt coefficients. The declaration is a choice, and the
-- choice of physical equivalence is open in general.
instance PhysicalEquivalence BipartiteQubitSystem where
  physicallyEquivalent = mathematicallyEquivalent

-- | DEF-023 hooks for Definition 3.6: the composition rule is disjoint union
-- (direct sum). The product hook is not supplied on this type, which is what
-- makes irreducibility relative to the composition rule.
instance Constructible FiniteStateSystem where
  type Composite FiniteStateSystem = FiniteStateSystem
  tensorProduct _ _ = Nothing
  directSum a b = Just (FiniteStateSystem (fsCardinality a + fsCardinality b))
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

-- | DEF-023 hooks for Example 7.5: the composition rule is the cartesian
-- product.
instance Constructible FiniteProductSystem where
  type Composite FiniteProductSystem = FiniteProductSystem
  tensorProduct a b =
    Just (FiniteProductSystem (fpsCardinality a * fpsCardinality b))
  directSum _ _ = Nothing
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

-- | DEF-023 hooks for Definition 3.7: disjoint union of dynamical records,
-- acting componentwise on the self-maps.
instance Constructible FiniteDynamicalSystem where
  type Composite FiniteDynamicalSystem = FiniteDynamicalSystem
  tensorProduct _ _ = Nothing
  directSum a b =
    Just FiniteDynamicalSystem
      { fdsStates = fdsStates a ++ map (+ offset) (fdsStates b)
      , fdsMap =
          fdsMap a ++ [(x + offset, y + offset) | (x, y) <- fdsMap b]
      }
    where
      offset = maximum (0 : fdsStates a) + 1
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

-- | DEF-023 hooks for Definition 3.8: the record carries one factorization
-- and no composite construction is supplied here. Proposition 7.6 is the
-- reason a composite cannot be read off the bare record.
instance Constructible BipartiteQubitSystem where
  type Composite BipartiteQubitSystem = BipartiteQubitSystem
  tensorProduct _ _ = Nothing
  directSum _ _ = Nothing
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

-- | DEF-021 for Definition 3.6: irreducibility is relative to disjoint
-- union. Lean target vol01.finiteState.irreducible_iff_card_eq_one.
instance Irreducible FiniteStateSystem where
  irreducibilityBasis _ = DirectSum

-- | DEF-021 for Example 7.5: irreducibility is relative to the product.
instance Irreducible FiniteProductSystem where
  irreducibilityBasis _ = TensorProduct

-- | DEF-021 for Definition 3.7: irreducibility is relative to disjoint
-- union, and equals connectedness of the functional graph.
instance Irreducible FiniteDynamicalSystem where
  irreducibilityBasis _ = DirectSum

-- | DEF-021 for Definition 3.8: irreducibility is relative to the tensor
-- product of factors.
instance Irreducible BipartiteQubitSystem where
  irreducibilityBasis _ = TensorProduct

-- | DEF-022 for Definition 3.6: Theorem 8.1, claim 2. The decomposition is
-- into one-point records, unique up to order.
instance Decomposable FiniteStateSystem where
  decomposition p =
    Just Decomposition
      { decompositionConstruction = DirectSum
      , irreducibleFactors =
          replicate (fsCardinality p) (FiniteStateSystem 1)
      }

-- | DEF-022 for Example 7.5: decomposition into prime-cardinality factors.
-- Lean target vol01.product.irreducible_iff_prime_card.
instance Decomposable FiniteProductSystem where
  decomposition p =
    Just Decomposition
      { decompositionConstruction = TensorProduct
      , irreducibleFactors =
          map FiniteProductSystem (primeFactors (fpsCardinality p))
      }

-- | DEF-022 for Definition 3.7: Theorem 8.2, claim 2. The decomposition is
-- into the records on the connected components of the functional graph.
instance Decomposable FiniteDynamicalSystem where
  decomposition p =
    Just Decomposition
      { decompositionConstruction = DirectSum
      , irreducibleFactors =
          [ FiniteDynamicalSystem
              { fdsStates = comp
              , fdsMap = [(x, y) | (x, y) <- fdsMap p, x `elem` comp]
              }
          | comp <- functionalGraphComponents (fdsStates p) (fdsMap p)
          ]
      }

-- | DEF-022 for Definition 3.8: no decomposition is supplied from the bare
-- record, and Proposition 7.6 shows none can be.
instance Decomposable BipartiteQubitSystem where
  decomposition _ = Nothing

-- | Example 7.5: prime factorization of a positive integer. The empty list
-- is the unit, the empty product.
primeFactors :: Int -> [Int]
primeFactors n
  | n <= 1 = []
  | otherwise = go n 2
  where
    go 1 _ = []
    go m d
      | m `mod` d == 0 = d : go (m `div` d) d
      | d * d > m = [m]
      | otherwise = go m (d + 1)

-- | Theorem 8.2: connected components of a functional graph, computed as the
-- weakly connected components of the undirected edge set {x, f(x)}.
functionalGraphComponents :: [Int] -> [(Int, Int)] -> [[Int]]
functionalGraphComponents states edges = go [] states
  where
    neighbours x =
      nub ([y | (a, y) <- edges, a == x] ++ [a | (a, y) <- edges, y == x])
    reachableFrom start = sort (walk [start] [start])
      where
        walk [] seen = seen
        walk (x : rest) seen =
          let nxt = [y | y <- neighbours x, y `notElem` seen]
           in walk (rest ++ nxt) (seen ++ nxt)
    go _ [] = []
    go visited (x : xs)
      | x `elem` visited = go visited xs
      | otherwise =
          let c = reachableFrom x
           in c : go (visited ++ c) xs

-- | Theorem 8.2, claim 3: conjugacy of two self-maps, decided by testing all
-- relabelings for systems of at most eight states.
conjugateMaps :: FiniteDynamicalSystem -> FiniteDynamicalSystem -> Bool
conjugateMaps a b
  | length sa /= length sb = False
  | length sa > 8 = False
  | otherwise = any works (permutations sb)
  where
    sa = fdsStates a
    sb = fdsStates b
    lookupA = fdsMap a
    lookupB = fdsMap b
    app m x = case lookup x m of
      Just y -> y
      Nothing -> x
    works phi =
      and [ app lookupB (phiOf phi x) == phiOf phi (app lookupA x)
          | x <- sa
          ]
    phiOf phi x = case [i | (i, s) <- zip [0 ..] sa, s == x] of
      (i : _) -> phi !! i
      [] -> x

-- | Proposition 7.6: Schmidt coefficients of a two-qubit pure state given by
-- four complex amplitudes, computed as the singular values of the reshaped
-- 2 by 2 amplitude matrix.
schmidtCoefficients :: [(Double, Double)] -> [Double]
schmidtCoefficients amps =
  case map toComplex amps of
    [a, b, c, d] ->
      let row1 = [a, b]
          row2 = [c, d]
          mm x y = sum (zipWith (\u v -> magnitude u * magnitude v) x y)
          t = mm row1 row1 + mm row2 row2
          detSq = magnitude (a * d - b * c) ^ (2 :: Int)
          disc = max 0 (t * t - 4 * detSq)
          s1 = sqrt (max 0 ((t + sqrt disc) / 2))
          s2 = sqrt (max 0 ((t - sqrt disc) / 2))
       in sort [s1, s2]
    _ -> error "schmidtCoefficients: expected four amplitudes"
  where
    toComplex (x, y) = x :+ y

-- | Proposition 7.6: Schmidt rank of a two-qubit pure state.
schmidtRank :: [(Double, Double)] -> Int
schmidtRank amps = length (filter (> 1.0e-9) (schmidtCoefficients amps))

-- | Executable evidence for the statements of the paper. Computation is
-- never proof; the proofs live in the paper.
demo :: IO ()
demo = do
  putStrLn "=== vol-01-foundations: taxonomy instance demo ==="
  putStrLn ""
  putStrLn "-- Theorem 8.1 (a): irreducible under disjoint union iff |X| = 1"
  let states = [FiniteStateSystem n | n <- [1 .. 8]]
  mapM_
    ( \p ->
        putStrLn
          ( "  |X| = "
              ++ show (fsCardinality p)
              ++ ", irreducible: "
              ++ show (fsCardinality p == 1)
          )
    )
    states
  putStrLn ""
  putStrLn "-- Theorem 8.1 (b): decomposition into one-point records"
  print (decomposition (FiniteStateSystem 5))
  putStrLn ""
  putStrLn "-- Theorem 8.1 (c): isomorphism exactly when cardinalities agree"
  print (mathematicallyEquivalent (FiniteStateSystem 3) (FiniteStateSystem 3))
  print (mathematicallyEquivalent (FiniteStateSystem 3) (FiniteStateSystem 4))
  putStrLn ""
  putStrLn "-- Example 7.5: irreducibles under product are prime cardinalities"
  mapM_
    ( \n ->
        putStrLn
          ( "  "
              ++ show n
              ++ " = "
              ++ show (primeFactors n)
          )
    )
    [1, 2, 4, 6, 12, 30, 97]
  putStrLn ""
  putStrLn "-- Theorem 8.2: components of a functional graph"
  let dyn =
        FiniteDynamicalSystem
          { fdsStates = [0, 1, 2, 3, 4, 5]
          , fdsMap = [(0, 1), (1, 2), (2, 0), (3, 3), (4, 5), (5, 4)]
          }
  print (decomposition dyn)
  putStrLn ""
  putStrLn "-- Theorem 8.2 (c): conjugacy of self-maps"
  let dynB =
        FiniteDynamicalSystem
          { fdsStates = [0, 1, 2, 3, 4, 5]
          , fdsMap = [(0, 0), (1, 2), (2, 3), (3, 1), (4, 5), (5, 4)]
          }
      dynC =
        FiniteDynamicalSystem
          { fdsStates = [0, 1, 2, 3, 4, 5]
          , fdsMap = [(0, 1), (1, 0), (2, 3), (3, 2), (4, 5), (5, 4)]
          }
  putStrLn
    ( "  relabeled cycles: "
        ++ show (mathematicallyEquivalent dyn dynB)
    )
  putStrLn
    ( "  different cycle type: "
        ++ show (mathematicallyEquivalent dyn dynC)
    )
  putStrLn ""
  putStrLn "-- Proposition 7.6: factorization changes entanglement"
  let psi0 = [(1, 0), (0, 0), (0, 0), (0, 0)]
      psi1 = [(1 / sqrt 2, 0), (0, 0), (0, 0), (1 / sqrt 2, 0)]
  putStrLn
    ( "  product vector: Schmidt rank "
        ++ show (schmidtRank psi0)
        ++ ", coefficients "
        ++ show (schmidtCoefficients psi0)
    )
  putStrLn
    ( "  rotated vector: Schmidt rank "
        ++ show (schmidtRank psi1)
        ++ ", coefficients "
        ++ show (schmidtCoefficients psi1)
    )
  putStrLn ""
  putStrLn "All demonstrations completed."
-- | Entry point for the vol-01-foundations executable taxonomy layer.
-- Runs the instance demonstrations of "Instances". Computational evidence
-- only; nothing here is proof and nothing here is verified by Lean.
module Main (main) where

import Vol01Foundations.Instances (demo)

main :: IO ()
main = demo

exec
/usr/local/bin/zsh -lc "rg -n '"'^(namespace|end|class |structure |def |abbrev |inductive |theorem |instance |noncomputable def |opaque |axiom )'"' lean -g '*.lean'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
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
lean/Cmrps/Vol09GravityInformationGeometry.lean:414:theorem quantum_monotone_metrics_not_unique :
lean/Cmrps/Vol09GravityInformationGeometry.lean:458:noncomputable def lamQubit (s : ℝ) : Fin 2 → ℝ := fun i => if i = 0 then (1 + s) / 2 else (1 - s) / 2
lean/Cmrps/Vol09GravityInformationGeometry.lean:465:theorem sld_qubit_transverse (s : ℝ) (hs : 0 < s) (hs' : s < 1) :
lean/Cmrps/Vol09GravityInformationGeometry.lean:479:theorem sld_qubit_radial (s : ℝ) (hs : 0 < s) (hs' : s < 1) :
lean/Cmrps/Vol09GravityInformationGeometry.lean:492:theorem sldBlochForm_transverse (s : ℝ) (hs : s ^ 2 < 1) :
lean/Cmrps/Vol09GravityInformationGeometry.lean:499:theorem sldBlochForm_radial (s : ℝ) (hs : s ^ 2 < 1) :
lean/Cmrps/Vol09GravityInformationGeometry.lean:511:theorem ideal_gas_ruppeiner_flat (N k cv U V dU dV : ℝ) (hcv : 0 ≤ cv) :
lean/Cmrps/Vol09GravityInformationGeometry.lean:516:end Cmrps.Vol09
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
lean/Cmrps/Vol10ObservationalEquivalence.lean:330:def mcTerm {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ) (A : Fin n → Fin n → ℚ)
lean/Cmrps/Vol10ObservationalEquivalence.lean:336:def mcQuadratic {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ) (A : Fin n → Fin n → ℚ) : ℚ :=
lean/Cmrps/Vol10ObservationalEquivalence.lean:340:def NormalizedAtOne (f : ℚ → ℚ) : Prop := f 1 = 1
lean/Cmrps/Vol10ObservationalEquivalence.lean:344:def SelfReciprocal (f : ℚ → ℚ) : Prop := ∀ x : ℚ, 0 < x → f x = x * f x⁻¹
lean/Cmrps/Vol10ObservationalEquivalence.lean:347:def petzTranspose (f : ℚ → ℚ) (x : ℚ) : ℚ := x * f x⁻¹
lean/Cmrps/Vol10ObservationalEquivalence.lean:357:def petz_sudar_parametricity {n : ℕ}
lean/Cmrps/Vol10ObservationalEquivalence.lean:376:theorem petz_transpose_same_form {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ)
lean/Cmrps/Vol10ObservationalEquivalence.lean:392:theorem monotone_commutative_restriction {n : ℕ} (f : ℚ → ℚ) (hf1 : f 1 = 1)
lean/Cmrps/Vol10ObservationalEquivalence.lean:407:theorem commutative_restriction_is_fisher {n : ℕ} (f : ℚ → ℚ) (hf1 : f 1 = 1)
lean/Cmrps/Vol10ObservationalEquivalence.lean:416:def fRat (x : ℚ) : ℚ := 2 * x / (1 + x)
lean/Cmrps/Vol10ObservationalEquivalence.lean:419:def hRat (x : ℚ) : ℚ := (1 + x) / 2
lean/Cmrps/Vol10ObservationalEquivalence.lean:422:def rhoDiag : Fin 2 → ℚ := fun i => if i = 0 then 3/4 else 1/4
lean/Cmrps/Vol10ObservationalEquivalence.lean:425:def sigmaX : Fin 2 → Fin 2 → ℚ := fun i j => if i = j then 0 else 1
lean/Cmrps/Vol10ObservationalEquivalence.lean:430:theorem monotone_not_canonical :
lean/Cmrps/Vol10ObservationalEquivalence.lean:443:theorem monotone_ruler_dependence :
lean/Cmrps/Vol10ObservationalEquivalence.lean:448:end Cmrps.Vol10
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
lean/Cmrps/Vol07GaugeQft.lean:208:theorem anomaly_free_list_iff_sum_map (d : AnomalyData R A) (l : List R) :
lean/Cmrps/Vol07GaugeQft.lean:214:theorem anomaly_free_list_iff_mem_ker (d : AnomalyData R A) (l : List R) :
lean/Cmrps/Vol07GaugeQft.lean:218:theorem anomaly_free_list_nil (d : AnomalyData R A) : d.AnomalyFreeList [] := by
lean/Cmrps/Vol07GaugeQft.lean:222:theorem anomaly_free_list_append (d : AnomalyData R A) (l₁ l₂ : List R) :
lean/Cmrps/Vol07GaugeQft.lean:226:end AnomalyData
lean/Cmrps/Vol07GaugeQft.lean:233:structure AnomalyObstruction (A : Type*) [Zero A] where
lean/Cmrps/Vol07GaugeQft.lean:241:def QuantizationGate {A : Type*} [Zero A] (o : AnomalyObstruction A) : Prop :=
lean/Cmrps/Vol07GaugeQft.lean:244:theorem quantization_gate_iff {A : Type*} [Zero A] (o : AnomalyObstruction A) :
lean/Cmrps/Vol07GaugeQft.lean:248:theorem not_quantization_gate_of_ne_zero {A : Type*} [Zero A] (o : AnomalyObstruction A)
lean/Cmrps/Vol07GaugeQft.lean:251:theorem not_quantization_gate_of_not_trivial {A : Type*} [Zero A] (o : AnomalyObstruction A)
lean/Cmrps/Vol07GaugeQft.lean:255:theorem quantization_gate_iff_anomalyFree {R A : Type*} [AddCommGroup R] [AddCommGroup A]
lean/Cmrps/Vol07GaugeQft.lean:265:structure GlobalFormInvariant (B : Type*) where
lean/Cmrps/Vol07GaugeQft.lean:276:abbrev SO3BundleClass : Type := ZMod 2
lean/Cmrps/Vol07GaugeQft.lean:279:def w2 : SO3BundleClass → ZMod 2 := id
lean/Cmrps/Vol07GaugeQft.lean:282:def so3_w2_detection : GlobalFormInvariant SO3BundleClass where
lean/Cmrps/Vol07GaugeQft.lean:288:theorem so3_two_classes : Fintype.card SO3BundleClass = 2 :=
lean/Cmrps/Vol07GaugeQft.lean:292:theorem w2_detects_nontrivial {B : Type*} (F : GlobalFormInvariant B) {b : B}
lean/Cmrps/Vol07GaugeQft.lean:300:def SU2BundleClass : Type := PUnit
lean/Cmrps/Vol07GaugeQft.lean:302:theorem su2_bundles_over_s2_trivial (b : SU2BundleClass) : b = ⟨⟩ := by
lean/Cmrps/Vol07GaugeQft.lean:306:end Cmrps.Vol07
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
lean/Cmrps/Vol08SpacetimeReconstruction.lean:466:instance : Fintype ThurstonGeometry3 where
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
lean/Cmrps/Vol04YonedaClassification.lean:175:def gapProbe : Discrete (Fin 1) ⥤ Discrete (Fin 3) :=
lean/Cmrps/Vol04YonedaClassification.lean:182:instance : IsEmpty gapHom0 :=
lean/Cmrps/Vol04YonedaClassification.lean:185:instance : IsEmpty gapHom1 :=
lean/Cmrps/Vol04YonedaClassification.lean:190:theorem profile_restriction_gap :
lean/Cmrps/Vol04YonedaClassification.lean:201:end RestrictionGap
lean/Cmrps/Vol04YonedaClassification.lean:212:theorem profile_limit_preservation (P : C) :
lean/Cmrps/Vol04YonedaClassification.lean:218:theorem yoneda_embedding_preserves_limits :
lean/Cmrps/Vol04YonedaClassification.lean:223:noncomputable def profile_prod_iso (A B : C) [HasBinaryProduct A B] :
lean/Cmrps/Vol04YonedaClassification.lean:228:noncomputable def profile_terminal_iso [HasTerminal C] :
lean/Cmrps/Vol04YonedaClassification.lean:232:end Limits
lean/Cmrps/Vol04YonedaClassification.lean:241:abbrev M (n : ℕ) := Matrix (Fin n) (Fin n) ℂ
lean/Cmrps/Vol04YonedaClassification.lean:245:def choiMatrix {n m : ℕ} (Φ : M n →ₗ[ℂ] M m) : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ :=
lean/Cmrps/Vol04YonedaClassification.lean:278:def ofChoi {n m : ℕ} (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ) : M n →ₗ[ℂ] M m where
lean/Cmrps/Vol04YonedaClassification.lean:284:theorem sum_single_smul {n : ℕ} (X : M n) :
lean/Cmrps/Vol04YonedaClassification.lean:289:theorem map_eq_sum_single {n p : ℕ} (Ψ : M n →ₗ[ℂ] M p) (Y : M n) (α β) :
lean/Cmrps/Vol04YonedaClassification.lean:295:def choi_correspondence {n m : ℕ} :
lean/Cmrps/Vol04YonedaClassification.lean:330:theorem choi_composition {n m p : ℕ} (Φ : M n →ₗ[ℂ] M m) (Ψ : M m →ₗ[ℂ] M p) :
lean/Cmrps/Vol04YonedaClassification.lean:339:def partialTrace {n m : ℕ} (J : Matrix (Fin n × Fin m) (Fin n × Fin m) ℂ) : M n :=
lean/Cmrps/Vol04YonedaClassification.lean:357:theorem choi_trace_preserving {n m : ℕ} (Φ : M n →ₗ[ℂ] M m) :
lean/Cmrps/Vol04YonedaClassification.lean:401:end Choi
lean/Cmrps/Vol04YonedaClassification.lean:403:end Cmrps.Vol04
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
lean/Cmrps/Vol02StructuralFamilies.lean:294:theorem pos_tensor {v w : DimensionVector} (hv : v.Pos) (hw : w.Pos) :
lean/Cmrps/Vol02StructuralFamilies.lean:301:theorem totalDim_sum (v w : DimensionVector) :
lean/Cmrps/Vol02StructuralFamilies.lean:318:theorem totalDim_tensor (v w : DimensionVector) :
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
lean/Cmrps/Vol02StructuralFamilies.lean:705:def Reconstructable (F G : StructuralFamily) : Prop := Nonempty (F.Obj ≃ G.Obj)
lean/Cmrps/Vol02StructuralFamilies.lean:713:def Independent (F G : StructuralFamily) : Prop :=
lean/Cmrps/Vol02StructuralFamilies.lean:719:def HasClassifyingInvariant (F : StructuralFamily.{u}) : Prop :=
lean/Cmrps/Vol02StructuralFamilies.lean:725:theorem not_independent_of_reconstructable (F G : StructuralFamily)
lean/Cmrps/Vol02StructuralFamilies.lean:732:theorem invariants_not_independence :
lean/Cmrps/Vol02StructuralFamilies.lean:746:def subtypeEquivOfEq {γ : Type*} {s t : Set γ} (h : s = t) : ↥s ≃ ↥t :=
lean/Cmrps/Vol02StructuralFamilies.lean:752:theorem comparability_of_records {Obj : Type u} {r : Obj → Obj → Prop} (hr : Equivalence r)
lean/Cmrps/Vol02StructuralFamilies.lean:803:end Comparability
lean/Cmrps/Vol02StructuralFamilies.lean:805:end Cmrps.Vol02
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
lean/Cmrps/Vol01Foundations.lean:706:theorem changeFactorization_involutive (M : CoeffMat) :
lean/Cmrps/Vol01Foundations.lean:721:theorem changeFactorization_psi : changeFactorization psiFirst = psiSecond := by
lean/Cmrps/Vol01Foundations.lean:726:theorem reducedDiag_first :
lean/Cmrps/Vol01Foundations.lean:750:theorem reducedDiag_second :
lean/Cmrps/Vol01Foundations.lean:763:theorem isUnitState_psi : IsUnitState psiFirst ∧ IsUnitState psiSecond := by
lean/Cmrps/Vol01Foundations.lean:793:theorem factorization_nonunique :
lean/Cmrps/Vol01Foundations.lean:808:end Cmrps.Vol01
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

exec
/usr/local/bin/zsh -lc 'cat src/vol-02-structural-families/Instances.hs' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
{-# LANGUAGE TypeFamilies #-}

-- | Module        : Vol02StructuralFamilies.Instances
-- Volume          : vol-02-structural-families
-- Paper           : Fundamental Structural Families of Mathematical Physics
-- Description     : Executable taxonomy instances for the physical systems
--                   named in the volume, against the shared family classes of
--                   'Taxonomy.Families', 'Taxonomy.Invariants',
--                   'Taxonomy.Constructions' and 'Taxonomy.Equivalences'.
--
-- The shared family classes are imported and never redefined. Each record
-- below mirrors one system of the paper and one row of
-- verification/vol-02-structural-families-lean-targets.md. The type and method
-- names carry the paper's own vocabulary so that a reader can move between the
-- two without a concordance.
--
-- Claim status (docs/theorem-registry.md): this file is executable
-- computational evidence. It proves nothing and asserts no formalisation. It
-- is NOT verified by Lean and no such claim is made anywhere. The honest
-- statement is that these are executable models validated against the
-- specifications recorded in the paper.
module Vol02StructuralFamilies.Instances
  ( -- * Family I: symplectic and Poisson structures
    SymplecticSystem (..)
  , CotangentBundleSystem (..)
  , cotangentRetractFibers
    -- * Family II: Hilbert spaces and operator algebras
  , FiniteCStarAlgebra (..)
  , mkFiniteCStarAlgebra
  , dimensionVectorOfAlgebra
  , algebrasOfTotalDimension
  , BinaryQuantumSystem (..)
    -- * Family III: smooth manifolds and geometric structures
  , LorentzianSystem (..)
    -- * Family IV: principal bundles and connections
  , PrincipalU1Bundle (..)
    -- * Family V: probability and measure-theoretic structures
  , ClassicalStatisticalSystem (..)
  , binaryFisherMetric
    -- * Family VI: topological and higher-categorical structures
  , TopologicalQFTSystem (..)
    -- * Family VII: dynamical systems and operator semigroups
  , QuantumChannelSystem (..)
  , ComplexPair (..)
  , unitaryChannelFamily
  , krausRankOf
    -- * Family VIII: tensor categories and compositional structures
  , SymmetricTensorCategorySystem (..)
    -- * Family IX: discrete combinatorial structures
  , LatticeGaugeSystem (..)
    -- * Family X: derived and homotopical structures
  , DerivedAlgebraSystem (..)
    -- * Family tags and classification records
  , familyTagOf
  , familyDefIds
  , AchievementKind (..)
  , ClassificationRecord (..)
  ) where

import Data.List (nub, sort)

import Taxonomy.Constructions
import Taxonomy.Equivalences
import Taxonomy.Families
import Taxonomy.Invariants

-- ---------------------------------------------------------------------------
-- Family I: symplectic and Poisson structures (paper Section 6, DEF-026)
-- ---------------------------------------------------------------------------

-- | Paper Section 5 and Section 6: a symplectic system with the record
-- (X, O, D, S, C). The paper's Proposition 3.2 records that no local
-- invariant is classifying here, so the record carries global data only.
data SymplecticSystem = SymplecticSystem
  { symplecticDim      :: Int
    -- ^ Half the dimension of the symplectic manifold.
  , symplecticGlobalData :: String
    -- ^ Global datum of the record: cohomology class of the symplectic form
    -- and homotopy type of the base. The paper's Section 6 records the
    -- absence of local data.
  , symplecticHamiltonian :: String
    -- ^ The Hamiltonian whose flow is the dynamics.
  } deriving (Eq, Show)

instance PhysicalSystem SymplecticSystem where
  type StateSpace SymplecticSystem = (Int, String)
  type Observables SymplecticSystem = String
  type Dynamics SymplecticSystem = String
  type Symmetries SymplecticSystem = String
  type Composition SymplecticSystem = Construction
  stateSpace s = (symplecticDim s, symplecticGlobalData s)
  observables _ = "C^infty(M)"
  dynamics = symplecticHamiltonian
  symmetries _ = "cotangent lift of base diffeomorphisms preserving H"
  composition _ = DirectSum

instance FamilySymplecticPoisson SymplecticSystem where
  type SymplecticPoissonData SymplecticSystem = (Int, String)
  symplecticPoissonData s = (symplecticDim s, symplecticGlobalData s)

-- | Paper Section 7.1: the cotangent bundle T*Q with its canonical form.
data CotangentBundleSystem = CotangentBundleSystem
  { cotangentBaseHomotopyType :: String
    -- ^ Homotopy type of Q. Proposition 7.1: this is the homotopy type of
    -- T*Q, so it is the global invariant of the symplectic record.
  , cotangentFiberDim :: Int
    -- ^ Dimension of the cotangent fibre, which equals dim Q.
  } deriving (Eq, Show)

instance PhysicalSystem CotangentBundleSystem where
  type StateSpace CotangentBundleSystem = (String, Int)
  type Observables CotangentBundleSystem = String
  type Dynamics CotangentBundleSystem = String
  type Symmetries CotangentBundleSystem = String
  type Composition CotangentBundleSystem = Construction
  stateSpace c = (cotangentBaseHomotopyType c, cotangentFiberDim c)
  observables _ = "C^infty(T*Q)"
  dynamics _ = "Hamiltonian flow on T*Q"
  symmetries _ = "cotangent lift of diffeomorphisms of Q"
  composition _ = DirectSum

instance FamilySymplecticPoisson CotangentBundleSystem where
  type SymplecticPoissonData CotangentBundleSystem = (String, Int)
  symplecticPoissonData c = (cotangentBaseHomotopyType c, cotangentFiberDim c)

-- | Paper Proposition 7.1: the fibre-wise radial retraction of T*Q onto the
-- zero section. Returns the homotopy of the retraction at parameter t as a
-- family of labelled fibres, which is the computational reading of the proof
-- of Proposition 7.1. This is a model of the retraction and not a proof.
cotangentRetractFibers :: Int -> [(Double, String)]
cotangentRetractFibers n =
  [ (t, "fibre scaled to " ++ show (t :: Double)) | t <- ts ]
  where
    ts = [fromIntegral k / fromIntegral n | k <- [0 .. n]]

-- ---------------------------------------------------------------------------
-- Family II: Hilbert spaces and operator algebras (paper Theorem 5.1, DEF-027)
-- ---------------------------------------------------------------------------

-- | Paper Theorem 5.1 and Section 7.2: a unital finite-dimensional complex
-- C*-algebra, recorded by its multiset of matrix block sizes. Theorem 5.1 is
-- the classification: the dimension vector is classifying for this sector.
newtype FiniteCStarAlgebra = FiniteCStarAlgebra [Int]
  deriving (Eq, Show)

-- | Constructor that normalises the block sizes as a multiset, since the
-- invariant is the multiset and not the order (Theorem 5.1).
mkFiniteCStarAlgebra :: [Int] -> FiniteCStarAlgebra
mkFiniteCStarAlgebra = FiniteCStarAlgebra . sort . filter (> 0)

-- | The classifying invariant of Theorem 5.1, as a Taxonomy dimension vector.
dimensionVectorOfAlgebra :: FiniteCStarAlgebra -> DimensionVector
dimensionVectorOfAlgebra (FiniteCStarAlgebra ns) = DimensionVector (sort ns)

-- | Paper Section 7.2 and Table 4 row 2: all dimension vectors of total
-- complex dimension n, that is all multisets of positive integers whose
-- squares sum to n. For n = 5 the list is [[2,1]]; for n = 4 it is [[2],[1,1,1,1]].
algebrasOfTotalDimension :: Int -> [[Int]]
algebrasOfTotalDimension n = nub (map sort (go n))
  where
    go :: Int -> [[Int]]
    go 0 = [[]]
    go m
      | m < 0 = []
      | otherwise =
          [ k : rest
          | k <- [1 .. m]
          , rest <- go (m - k * k)
          ]

instance PhysicalSystem FiniteCStarAlgebra where
  type StateSpace FiniteCStarAlgebra = [Int]
  type Observables FiniteCStarAlgebra = FiniteCStarAlgebra
  type Dynamics FiniteCStarAlgebra = String
  type Symmetries FiniteCStarAlgebra = String
  type Composition FiniteCStarAlgebra = Construction
  stateSpace (FiniteCStarAlgebra ns) = ns
  observables = id
  dynamics _ = "one-parameter group of *-automorphisms"
  symmetries _ = "unitary group acting by conjugation"
  composition _ = TensorProduct

instance FamilyHilbertOperatorAlgebras FiniteCStarAlgebra where
  type OperatorAlgebraData FiniteCStarAlgebra = DimensionVector
  operatorAlgebraData = dimensionVectorOfAlgebra

-- | Paper Proposition 6.1: the dimension vector of a direct sum is the
-- multiset union, and the dimension vector of a tensor product is the
-- multiset of products of block sizes.
instance Constructible FiniteCStarAlgebra where
  type Composite FiniteCStarAlgebra = FiniteCStarAlgebra
  tensorProduct (FiniteCStarAlgebra as) (FiniteCStarAlgebra bs) =
    Just (mkFiniteCStarAlgebra [a * b | a <- as, b <- bs])
  directSum (FiniteCStarAlgebra as) (FiniteCStarAlgebra bs) =
    Just (mkFiniteCStarAlgebra (as ++ bs))
  extend AlgebraExtension _ _ = Nothing
  extend GroupExtension _ _ = Nothing
  extend FieldTheoreticExtension _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

-- | Paper Theorem 5.1: a finite-dimensional algebra is reducible under direct
-- sum exactly when it has more than one block.
instance Irreducible FiniteCStarAlgebra where
  irreducibilityBasis (FiniteCStarAlgebra [_]) = DirectSum
  irreducibilityBasis _ = DirectSum

-- | Paper Theorem 5.1: the Wedderburn blocks are the irreducible factors.
instance Decomposable FiniteCStarAlgebra where
  decomposition (FiniteCStarAlgebra ns)
    | length ns <= 1 = Nothing
    | otherwise =
        Just Decomposition
          { decompositionConstruction = DirectSum
          , irreducibleFactors =
              [ FiniteCStarAlgebra [k] | k <- sort ns ]
          }

-- | Paper Theorem 5.1: mathematical equivalence of the records is equality of
-- the dimension vector, which is complete for this sector.
instance MathematicalEquivalence FiniteCStarAlgebra where
  mathematicallyEquivalent a b =
    dimensionVectorOfAlgebra a == dimensionVectorOfAlgebra b

-- | The instance declares *-isomorphism of the observable algebra as the
-- chosen relation for this record. That is a stipulative choice for this
-- record and is not a claim that DEF-015 is settled; the choice of physical
-- equivalence is open in the ontology.
instance PhysicalEquivalence FiniteCStarAlgebra where
  physicallyEquivalent = mathematicallyEquivalent

-- | Paper Section 7.2: the observable algebra of a two-level system together
-- with a classical bit, A = M_2(C) + C, dimension vector {2,1}.
data BinaryQuantumSystem = BinaryQuantumSystem
  { binaryBlocks :: [Int]
  , binaryLabel  :: String
  } deriving (Eq, Show)

instance PhysicalSystem BinaryQuantumSystem where
  type StateSpace BinaryQuantumSystem = [Int]
  type Observables BinaryQuantumSystem = FiniteCStarAlgebra
  type Dynamics BinaryQuantumSystem = String
  type Symmetries BinaryQuantumSystem = String
  type Composition BinaryQuantumSystem = Construction
  stateSpace = binaryBlocks
  observables = mkFiniteCStarAlgebra . binaryBlocks
  dynamics _ = "one-parameter group of *-automorphisms"
  symmetries _ = "unitary group of the algebra"
  composition _ = TensorProduct

instance FamilyHilbertOperatorAlgebras BinaryQuantumSystem where
  type OperatorAlgebraData BinaryQuantumSystem = DimensionVector
  operatorAlgebraData = dimensionVectorOfAlgebra . mkFiniteCStarAlgebra . binaryBlocks

-- ---------------------------------------------------------------------------
-- Family III: smooth manifolds and geometric structures (paper Section 8, DEF-028)
-- ---------------------------------------------------------------------------

-- | Paper Section 8: a Lorentzian system carrying holonomy and causal data.
data LorentzianSystem = LorentzianSystem
  { lorentzianDim :: Int
  , lorentzianHolonomyLabel :: String
  , lorentzianCausalClass :: CausalClass
  } deriving (Eq, Show)

instance PhysicalSystem LorentzianSystem where
  type StateSpace LorentzianSystem = (Int, String)
  type Observables LorentzianSystem = String
  type Dynamics LorentzianSystem = String
  type Symmetries LorentzianSystem = String
  type Composition LorentzianSystem = Construction
  stateSpace l = (lorentzianDim l, lorentzianHolonomyLabel l)
  observables _ = "function algebra on the manifold"
  dynamics _ = "Einstein flow or geodesic flow"
  symmetries _ = "Lorentz group of the tangent frame"
  composition _ = DirectSum

instance FamilySmoothGeometric LorentzianSystem where
  type GeometricData LorentzianSystem = (Int, String, CausalClass)
  geometricData l =
    (lorentzianDim l, lorentzianHolonomyLabel l, lorentzianCausalClass l)

-- ---------------------------------------------------------------------------
-- Family IV: principal bundles and connections (paper Section 7.3, DEF-029)
-- ---------------------------------------------------------------------------

-- | Paper Section 7.3: a principal U(1)-bundle over S^2, classified by its
-- first Chern class in H^2(S^2; Z) = Z.
data PrincipalU1Bundle = PrincipalU1Bundle
  { baseLabel :: String
  , firstChernClass :: Integer
  } deriving (Eq, Show)

instance PhysicalSystem PrincipalU1Bundle where
  type StateSpace PrincipalU1Bundle = (String, Integer)
  type Observables PrincipalU1Bundle = String
  type Dynamics PrincipalU1Bundle = String
  type Symmetries PrincipalU1Bundle = String
  type Composition PrincipalU1Bundle = Construction
  stateSpace b = (baseLabel b, firstChernClass b)
  observables _ = "gauge-invariant functionals of the connection"
  dynamics _ = "parallel transport along the connection"
  symmetries _ = "gauge group of the bundle"
  composition _ = TensorProduct

instance FamilyPrincipalBundlesConnections PrincipalU1Bundle where
  type BundleConnectionData PrincipalU1Bundle = (String, Integer, [CharacteristicClass])
  bundleConnectionData b = (baseLabel b, firstChernClass b, [Chern])

-- ---------------------------------------------------------------------------
-- Family V: probability and measure-theoretic structures (paper Section 8.1, DEF-030)
-- ---------------------------------------------------------------------------

-- | Paper Section 8.1: the binary statistical system, with the Fisher metric
-- in the coordinate p given by 1 / (p (1 - p)).
data ClassicalStatisticalSystem = ClassicalStatisticalSystem
  { outcomeCount :: Int
  , probabilityCoordinate :: Double
  } deriving (Eq, Show)

-- | Paper Section 8.1: the Fisher metric component g_pp = 1 / (p (1 - p)) of
-- the binary system. Returns Nothing outside the open interval (0,1).
binaryFisherMetric :: ClassicalStatisticalSystem -> Maybe Double
binaryFisherMetric s
  | p <= 0 || p >= 1 = Nothing
  | otherwise = Just (1 / (p * (1 - p)))
  where
    p = probabilityCoordinate s

instance PhysicalSystem ClassicalStatisticalSystem where
  type StateSpace ClassicalStatisticalSystem = (Int, Double)
  type Observables ClassicalStatisticalSystem = String
  type Dynamics ClassicalStatisticalSystem = String
  type Symmetries ClassicalStatisticalSystem = String
  type Composition ClassicalStatisticalSystem = Construction
  stateSpace s = (outcomeCount s, probabilityCoordinate s)
  observables _ = "real functions on the outcome set"
  dynamics _ = "Markov kernel"
  symmetries _ = "stochastic maps preserving the metric"
  composition _ = TensorProduct

instance FamilyProbabilityMeasure ClassicalStatisticalSystem where
  type ProbabilityMeasureData ClassicalStatisticalSystem = Maybe Double
  probabilityMeasureData = binaryFisherMetric

-- ---------------------------------------------------------------------------
-- Family VI: topological and higher-categorical structures (paper Section 10, DEF-031)
-- ---------------------------------------------------------------------------

-- | Paper Section 10: a topological quantum field theory record, carrying the
-- fully dualizable object that the claimed classification names.
data TopologicalQFTSystem = TopologicalQFTSystem
  { tqftDimension :: Int
  , fullyDualizableLabel :: String
  } deriving (Eq, Show)

instance PhysicalSystem TopologicalQFTSystem where
  type StateSpace TopologicalQFTSystem = (Int, String)
  type Observables TopologicalQFTSystem = String
  type Dynamics TopologicalQFTSystem = String
  type Symmetries TopologicalQFTSystem = String
  type Composition TopologicalQFTSystem = Construction
  stateSpace t = (tqftDimension t, fullyDualizableLabel t)
  observables _ = "topological invariants of the manifold"
  dynamics _ = "gluing of cobordisms"
  symmetries _ = "diffeomorphism group of the bordism"
  composition _ = TensorProduct

instance FamilyTopologicalHigherCategorical TopologicalQFTSystem where
  type HigherCategoricalData TopologicalQFTSystem = (Int, String)
  higherCategoricalData t = (tqftDimension t, fullyDualizableLabel t)

-- ---------------------------------------------------------------------------
-- Family VII: dynamical systems and operator semigroups (paper Section 11, DEF-032)
-- ---------------------------------------------------------------------------

-- | Paper Theorem 11.1 and Proposition 11.2: a completely positive map
-- recorded by its minimal Kraus list. Proposition 11.2 is that the Kraus rank
-- is constant on a positive-dimensional family of unitary channels.
data QuantumChannelSystem = QuantumChannelSystem
  { krausOperators :: [[ComplexPair]]
    -- ^ One minimal Kraus list per channel; the list length is the Kraus rank.
  , channelLabel :: String
  } deriving (Eq, Show)

-- | A 2 by 2 complex matrix entry pair, enough to carry the unitary channels
-- of Proposition 11.2 without a linear algebra dependency.
data ComplexPair = ComplexPair Double Double
  deriving (Eq, Show)

instance PhysicalSystem QuantumChannelSystem where
  type StateSpace QuantumChannelSystem = [ComplexPair]
  type Observables QuantumChannelSystem = String
  type Dynamics QuantumChannelSystem = String
  type Symmetries QuantumChannelSystem = String
  type Composition QuantumChannelSystem = Construction
  stateSpace q = concat (krausOperators q)
  observables _ = "completely positive maps on the algebra"
  dynamics _ = "Stinespring dilation"
  symmetries _ = "unitary freedom of the minimal dilation"
  composition _ = TensorProduct

instance FamilyDynamicalSemigroups QuantumChannelSystem where
  type DynamicalSemigroupData QuantumChannelSystem = Int
  dynamicalSemigroupData = krausRankOf

-- | Paper Proposition 11.2: the Kraus rank is the length of a minimal Kraus
-- list. It is an invariant of the normal form and not an isomorphism
-- invariant of the channel.
krausRankOf :: QuantumChannelSystem -> Int
krausRankOf q = maximum (1 : map length (krausOperators q))

-- | Paper Proposition 11.2: the family of unitary channels Phi_U(X) = U X U*
-- for U in U(2), each with Kraus rank one. The returned list has one entry
-- per sampled phase, and every entry has Kraus rank one, which is the
-- non-injectivity the proposition records. This is a model of the family and
-- not a proof of the proposition.
unitaryChannelFamily :: [Double] -> QuantumChannelSystem
unitaryChannelFamily phases =
  QuantumChannelSystem
    { krausOperators =
        [ [ComplexPair (cos th) 0, ComplexPair 0 (sin th)]
        | th <- phases ]
    , channelLabel = "unitary channels on M_2"
    }

-- ---------------------------------------------------------------------------
-- Family VIII: tensor categories and compositional structures (paper Section 12, DEF-033)
-- ---------------------------------------------------------------------------

-- | Paper Section 12: a symmetric tensor category record carrying the
-- structural layer it preserves, which is the load-bearing datum of
-- Theorem 12.1.
data SymmetricTensorCategorySystem = SymmetricTensorCategorySystem
  { categoryLabel :: String
  , preservedLayers :: [PreservedStructure]
  } deriving (Eq, Show)

instance PhysicalSystem SymmetricTensorCategorySystem where
  type StateSpace SymmetricTensorCategorySystem = String
  type Observables SymmetricTensorCategorySystem = String
  type Dynamics SymmetricTensorCategorySystem = String
  type Symmetries SymmetricTensorCategorySystem = [PreservedStructure]
  type Composition SymmetricTensorCategorySystem = Construction
  stateSpace = categoryLabel
  observables _ = "objects and morphisms of the category"
  dynamics _ = "tensor functor"
  symmetries = preservedLayers
  composition _ = TensorProduct

instance FamilyTensorCategoriesComposition SymmetricTensorCategorySystem where
  type TensorCategoryData SymmetricTensorCategorySystem = [PreservedStructure]
  tensorCategoryData = preservedLayers

-- ---------------------------------------------------------------------------
-- Family IX: discrete combinatorial structures (paper Section 9, DEF-034)
-- ---------------------------------------------------------------------------

-- | Paper Section 9.1: a lattice gauge configuration on a finite graph.
data LatticeGaugeSystem = LatticeGaugeSystem
  { latticeVertices :: Int
  , latticeEdges :: Int
  , wilsonLoopLabels :: [String]
  } deriving (Eq, Show)

instance PhysicalSystem LatticeGaugeSystem where
  type StateSpace LatticeGaugeSystem = (Int, Int)
  type Observables LatticeGaugeSystem = [String]
  type Dynamics LatticeGaugeSystem = String
  type Symmetries LatticeGaugeSystem = String
  type Composition LatticeGaugeSystem = Construction
  stateSpace l = (latticeVertices l, latticeEdges l)
  observables = wilsonLoopLabels
  dynamics _ = "transfer operator"
  symmetries _ = "gauge group at the vertices"
  composition _ = DirectSum

instance FamilyDiscreteCombinatorial LatticeGaugeSystem where
  type CombinatorialData LatticeGaugeSystem = (Int, Int, [String])
  combinatorialData l = (latticeVertices l, latticeEdges l, wilsonLoopLabels l)

-- ---------------------------------------------------------------------------
-- Family X: derived and homotopical structures (paper Section 14, DEF-035)
-- ---------------------------------------------------------------------------

-- | Paper Section 14: a derived algebra record carrying the tame or wild
-- class named by the dichotomy.
data DerivedAlgebraSystem = DerivedAlgebraSystem
  { derivedLabel :: String
  , derivedTameOrWild :: String
  } deriving (Eq, Show)

instance PhysicalSystem DerivedAlgebraSystem where
  type StateSpace DerivedAlgebraSystem = String
  type Observables DerivedAlgebraSystem = String
  type Dynamics DerivedAlgebraSystem = String
  type Symmetries DerivedAlgebraSystem = String
  type Composition DerivedAlgebraSystem = Construction
  stateSpace = derivedLabel
  observables _ = "derived category of modules"
  dynamics _ = "derived equivalence"
  symmetries _ = "derived autoequivalences"
  composition _ = DirectSum

instance FamilyDerivedHomotopical DerivedAlgebraSystem where
  type DerivedHomotopicalData DerivedAlgebraSystem = String
  derivedHomotopicalData = derivedTameOrWild

-- ---------------------------------------------------------------------------
-- Family tags, ontology identifiers, and classification records
-- ---------------------------------------------------------------------------

-- | Paper Table 4 row 4: the family tag of each record, paired with the
-- ontology identifier the taxonomy attaches to it. The mapping is metadata and
-- carries no mathematical claim.
familyTagOf :: String -> Maybe (StructuralFamily, String)
familyTagOf name = lookup name table
  where
    table =
      [ ("symplectic", (FamilyI, familyDefId FamilyI))
      , ("operator-algebra", (FamilyII, familyDefId FamilyII))
      , ("geometric", (FamilyIII, familyDefId FamilyIII))
      , ("bundle", (FamilyIV, familyDefId FamilyIV))
      , ("probability", (FamilyV, familyDefId FamilyV))
      , ("topological", (FamilyVI, familyDefId FamilyVI))
      , ("semigroup", (FamilyVII, familyDefId FamilyVII))
      , ("tensor-category", (FamilyVIII, familyDefId FamilyVIII))
      , ("combinatorial", (FamilyIX, familyDefId FamilyIX))
      , ("derived", (FamilyX, familyDefId FamilyX))
      ]

-- | Paper Table 4 row 4: the full list of family tags and their ontology
-- identifiers, in family order.
familyDefIds :: [(StructuralFamily, String)]
familyDefIds = [ (f, familyDefId f) | f <- [minBound .. maxBound] ]

-- | Paper Definition 5.1: the four achievement kinds of a classified sector.
data AchievementKind
  = CompleteParameterized
  | CompleteUnparameterized
  | CompleteAsObstruction
  | Impossible
  deriving (Eq, Ord, Show, Enum, Bounded)

-- | Paper Section 15: the five-field classification record a later volume
-- writes against the family rows.
data ClassificationRecord = ClassificationRecord
  { recordFamily :: StructuralFamily
  , recordSector :: String
  , recordInvariant :: Maybe ClassifyingInvariant
  , recordEquivalence :: EquivalenceKind
  , recordScope :: String
  , recordKind :: AchievementKind
  } deriving (Eq, Show)

exec
/usr/local/bin/zsh -lc 'cat src/vol-03-irreducibility-decomposition/Instances.hs src/vol-04-yoneda-classification/Instances.hs' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
{-# LANGUAGE TypeFamilies #-}

-- | Module        : Vol03IrreducibilityDecomposition.Instances
-- Description     : Taxonomy instances of vol-03 (irreducibility, decomposition,
--                   universal constructions) for the volume's physical systems.
-- Paper source    : papers/latex/vol-03-irreducibility-decomposition.tex
-- Taxonomy source : src/Taxonomy/ (imported, never redefined).
--
-- Instances of the family, invariant, construction, irreducibility, and
-- decomposition classes of the shared taxonomy for the systems this volume
-- classifies: matrix blocks and their direct sums (unital finite-dimensional
-- complex C*-algebras), tensor products of blocks, multiplicity matrices of
-- unital *-homomorphisms, Kraus normal-form data of completely positive maps,
-- and the two-qubit worked example. Type and method names mirror the paper's
-- definitions and the mechanization targets of
-- verification/vol-03-irreducibility-decomposition-lean-targets.md.
--
-- Claim status (docs/theorem-registry.md): this module is executable
-- computational evidence. It proves nothing; it is validated against
-- kernel-checked specifications through cross-audit and is NEVER "verified by
-- Lean".
module Vol03IrreducibilityDecomposition.Instances
  ( -- * Matrix blocks and finite-dimensional C*-algebras
    MatrixBlock (..)
  , FiniteDimCStar (..)
  , DimensionVector (..)
  , dimVector
  , blockDecomposition
  , dimensionVectorComplete
    -- * Constructions on blocks
  , tensorBlock
  , directSumBlocks
  , closureSemigroup
    -- * Morphisms and multiplicity matrices
  , MultiplicityMatrix (..)
  , unitalStarHoms
  , outerAutomorphisms
    -- * States and modules
  , statesDirectSum
  , moduleFactorization
    -- * Channels and Kraus normal form
  , KrausNormalForm (..)
  , krausNormalForm
    -- * Worked example systems
  , TwoQubitSystem (..)
  , SuperselectionPair (..)
  ) where

import Taxonomy.Constructions
  ( Construction (..)
  , Constructible (..)
  , Decomposable (..)
  , Decomposition (..)
  , Irreducible (..)
  )
import Taxonomy.Equivalences (MathematicalEquivalence (..))
import Taxonomy.Families
  ( FamilyDynamicalSemigroups (..)
  , FamilyHilbertOperatorAlgebras (..)
  , FamilyTensorCategoriesComposition (..)
  )
import Taxonomy.Invariants (DimensionVector (..))

-- | A simple block M_n(C) of a unital finite-dimensional complex C*-algebra.
-- The parameter is the matrix size n >= 1. Mirrors the blocks of the paper's
-- Theorem 3.2 (block decomposition) and lean target
-- finite_dim_cstar_block_decomposition.
newtype MatrixBlock = MatrixBlock { blockSize :: Int }
  deriving (Eq, Ord, Show)

-- | A unital finite-dimensional complex C*-algebra presented by its block
-- list, that is, by a direct sum of matrix blocks. Mirrors Definition 2.6
-- (dimension vector) and lean targets dimension_vector_complete_invariant and
-- dimension_vector_uniqueness.
newtype FiniteDimCStar = FiniteDimCStar { blocks :: [MatrixBlock] }
  deriving (Eq, Show)

-- | The multiset of matrix sizes of a decomposed algebra, unordered. The
-- construction from a block list sorts the sizes so that equality of
-- dimension vectors is equality of sorted lists, the paper's permutation
-- uniqueness.
dimVector :: FiniteDimCStar -> DimensionVector
dimVector (FiniteDimCStar bs) = DimensionVector (sorted (map blockSize bs))
  where
    sorted [] = []
    sorted (x : xs) = sorted [y | y <- xs, y < x] ++ [x] ++ sorted [y | y <- xs, y >= x]

-- | The block decomposition of a decomposed algebra: the factors of
-- DEF-022 with construction DirectSum. Mirrors Theorem 3.2.
blockDecomposition :: FiniteDimCStar -> [MatrixBlock]
blockDecomposition = blocks

-- | Complete-invariant check of Corollary 3.3: two algebras are
-- *-isomorphic exactly when their dimension vectors agree as multisets.
-- Computational evidence for lean target dimension_vector_complete_invariant.
dimensionVectorComplete :: FiniteDimCStar -> FiniteDimCStar -> Bool
dimensionVectorComplete a b = dimVector a == dimVector b

-- | Tensor product of blocks: M_n (x) M_m = M_{nm}. Mirrors
-- Proposition 8.1 and lean target tensor_block_product.
tensorBlock :: MatrixBlock -> MatrixBlock -> MatrixBlock
tensorBlock (MatrixBlock n) (MatrixBlock m) = MatrixBlock (n * m)

-- | Direct sum of decomposed algebras: concatenation of block lists.
-- Mirrors Proposition 8.1.
directSumBlocks :: FiniteDimCStar -> FiniteDimCStar -> FiniteDimCStar
directSumBlocks (FiniteDimCStar as) (FiniteDimCStar bs) = FiniteDimCStar (as ++ bs)

-- | Closure of a set of block sizes under direct sum and tensor product:
-- the dimension-vector entries of the closure lie in the multiplicative
-- semigroup generated by the seeds. Mirrors Corollary 8.2 and lean target
-- closure_semigroup.
closureSemigroup :: [Int] -> Int -> [Int]
closureSemigroup seeds bound = go [1]
  where
    go acc =
      let next = [n * s | n <- acc, s <- seeds, n * s <= bound, n * s `notElem` acc]
      in if null next then filter (/= 0) acc else go (acc ++ next)

-- | A multiplicity matrix R = (r_i^j) of unital *-homomorphisms: rows are
-- indexed by domain blocks, columns by codomain blocks. Mirrors Definition
-- 4.1 and lean target unital_star_hom_classification.
newtype MultiplicityMatrix = MultiplicityMatrix { multRows :: [[Int]] }
  deriving (Eq, Show)

-- | Constraint check of Definition 4.1: k_i^j = n_i * r_i^j with
-- sum_i k_i^j = m_j for every codomain block j. When the constraints hold,
-- the matrix names one conjugacy class of unital *-homomorphisms by
-- Theorem 4.2.
unitalStarHoms :: FiniteDimCStar -> FiniteDimCStar -> MultiplicityMatrix -> Bool
unitalStarHoms dom cod (MultiplicityMatrix rows) =
  length rows == length (blocks dom)
    && all (\r -> length r == length (blocks cod)) rows
    && and [ sum [ blockSize (blocks dom !! i) * (rows !! i !! j) | i <- [0 .. k - 1] ]
             == blockSize (blocks cod !! j)
           | j <- [0 .. l - 1] ]
  where
    k = length (blocks dom)
    l = length (blocks cod)

-- | Outer automorphisms of a decomposed algebra: permutations of blocks with
-- equal size. Mirrors Corollary 4.3 and lean target
-- outer_automorphism_permutation. The result lists the admissible
-- permutations of the block index set as index maps.
outerAutomorphisms :: FiniteDimCStar -> [[Int]]
outerAutomorphisms (FiniteDimCStar bs) =
  [ perm
  | perm <- permutations [0 .. length bs - 1]
  , and [ blockSize (bs !! i) == blockSize (bs !! (perm !! i)) | i <- [0 .. length bs - 1] ]
  ]
  where
    permutations [] = [[]]
    permutations xs = [y : zs | (y, rest) <- picks xs, zs <- permutations rest]
    picks [] = []
    picks (y : ys) = (y, ys) : [(z, y : zs) | (z, zs) <- picks ys]

-- | States on a direct sum: the weight of the first block and the normalized
-- restrictions determine the state uniquely (convex join). Represented here
-- by the weight data. Mirrors Proposition 3.7 and lean target
-- states_direct_sum_join.
statesDirectSum :: Double -> FiniteDimCStar -> Maybe (Double, [Double])
statesDirectSum lambda (FiniteDimCStar bs)
  | lambda < 0 || lambda > 1 = Nothing
  | otherwise = Just (lambda, replicate (length bs) (1 / fromIntegral (length bs)))

-- | Factorization of modules over a decomposed algebra: a module is the
-- direct sum of its block summands, with multiplicities r_i = dim(p_i M)/n_i.
-- Represented by the multiplicity vector. Mirrors Proposition 4.5 and lean
-- target module_factorization.
moduleFactorization :: FiniteDimCStar -> [Int] -> Maybe [Int]
moduleFactorization (FiniteDimCStar bs) dims
  | length dims /= length bs = Nothing
  | any (< 0) dims = Nothing
  | otherwise = Just [d `div` n | (MatrixBlock n, d) <- zip bs dims, d `mod` n == 0]

-- | Kraus normal-form data of a completely positive map: the operator family
-- size together with the minimal count (Choi rank). Mirrors Theorem 6.2 and
-- lean target kraus_normal_form_uniqueness. The two fields differ exactly
-- when the dilation is non-minimal.
data KrausNormalForm = KrausNormalForm
  { familySize :: Int
    -- ^ Number of Kraus operators in the presented family.
  , minimalKrausRank :: Int
    -- ^ Choi rank of the underlying map; invariant of the normal form.
  }
  deriving (Eq, Show)

-- | The invariant of the normal form: the minimal count is fixed by the map,
-- the family size is inflated by non-minimal dilation. The output records
-- whether the presented family is minimal.
krausNormalForm :: KrausNormalForm -> (Int, Bool)
krausNormalForm knf = (minimalKrausRank knf, familySize knf == minimalKrausRank knf)

-- | The two-qubit worked example of the paper: observable algebra M_4 with
-- both composition data available. Under DirectSum the system is
-- irreducible; under TensorProduct it factors as M_2 (x) M_2.
data TwoQubitSystem = TwoQubitSystem
  { twoQubitAlgebra :: FiniteDimCStar
    -- ^ The observable algebra M_4, a single block.
  , tensorFactors :: [MatrixBlock]
    -- ^ The tensor factorization into two blocks of size 2.
  }
  deriving (Eq, Show)

-- | The superselection pair M_2 + M_2 of the paper's worked example: two
-- sectors, each a qubit block.
newtype SuperselectionPair = SuperselectionPair (FiniteDimCStar, FiniteDimCStar)
  deriving (Eq, Show)

-- | DEF-021: a matrix block is irreducible relative to DirectSum. The
-- instance asserts the composition operation relative to which irreducibility
-- is judged, exactly as the paper's Definition 2.2 requires.
instance Irreducible MatrixBlock where
  irreducibilityBasis _ = DirectSum

-- | DEF-021: a decomposed algebra is judged for irreducibility relative to
-- DirectSum; decomposition is supplied by 'Decomposable' below.
instance Irreducible FiniteDimCStar where
  irreducibilityBasis _ = DirectSum

-- | DEF-022: the decomposition of a decomposed algebra into simple blocks.
-- Each factor is packaged as a single-block algebra, the irreducible object
-- of the direct-sum composition.
instance Decomposable FiniteDimCStar where
  decomposition (FiniteDimCStar []) = Nothing
  decomposition (FiniteDimCStar bs) =
    Just (Decomposition DirectSum [FiniteDimCStar [b] | b <- bs])

-- | DEF-022: no decomposition of a simple block under DirectSum is supplied;
-- by the paper's Theorem 3.2 none exists when the block is nonzero.
instance Decomposable MatrixBlock where
  decomposition _ = Nothing

-- | DEF-023: the two computable admissible constructions on decomposed
-- algebras. The hooks for extension, limits, colimits, and quotient return
-- Nothing, matching the paper's Table 7 record that these constructions are
-- not determined by dimension vectors alone.
instance Constructible FiniteDimCStar where
  type Composite FiniteDimCStar = FiniteDimCStar
  tensorProduct (FiniteDimCStar as) (FiniteDimCStar bs) =
    Just (FiniteDimCStar [tensorBlock a b | a <- as, b <- bs])
  directSum a b = Just (directSumBlocks a b)
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

-- | DEF-023: constructions on a single block.
instance Constructible MatrixBlock where
  type Composite MatrixBlock = FiniteDimCStar
  tensorProduct a b = Just (FiniteDimCStar [tensorBlock a b])
  directSum a b = Just (FiniteDimCStar [a, b])
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

-- | DEF-027: operator-algebra data of a single block is the one-entry
-- dimension vector of its matrix size.
instance FamilyHilbertOperatorAlgebras MatrixBlock where
  type OperatorAlgebraData MatrixBlock = DimensionVector
  operatorAlgebraData b = DimensionVector [blockSize b]

-- | DEF-027: operator-algebra data of a decomposed system is its dimension
-- vector, the paper's complete invariant.
instance FamilyHilbertOperatorAlgebras FiniteDimCStar where
  type OperatorAlgebraData FiniteDimCStar = DimensionVector
  operatorAlgebraData = dimVector

-- | DEF-032: dynamical-semigroup data of a completely positive map is its
-- Kraus normal form; the instance carries the normal-form data named in the
-- paper's Theorem 6.2.
instance FamilyDynamicalSemigroups KrausNormalForm where
  type DynamicalSemigroupData KrausNormalForm = KrausNormalForm
  dynamicalSemigroupData = id

-- | DEF-033: compositional data of the two-qubit system is its tensor
-- factorization into blocks.
instance FamilyTensorCategoriesComposition TwoQubitSystem where
  type TensorCategoryData TwoQubitSystem = [MatrixBlock]
  tensorCategoryData = tensorFactors

-- | Corollary 3.3 at the value level: mathematical equivalence of decomposed
-- algebras is equality of dimension vectors.
instance MathematicalEquivalence FiniteDimCStar where
  mathematicallyEquivalent = dimensionVectorComplete
{-# LANGUAGE TypeFamilies #-}

-- | Module        : Vol04YonedaClassification.Instances
-- Description     : Taxonomy instances for the physical systems of vol-04,
--                   The Yoneda Classification Principle.
-- Paper source    : papers/latex/vol-04-yoneda-classification.tex
-- Ontology source : docs/ontology.md (DEF-002, DEF-015, DEF-017, DEF-038).
--
-- Two kinds of content live here. First, declarations of instances of the
-- shared classes in src/Taxonomy/ for the volume's four systems; the abstract
-- components of those systems are recorded as opaque identifiers, so the
-- declarations index the definitions and carry no type-level guarantee.
-- Second, a typed fragment for quantum channels: Kraus data as matrices,
-- channel application, and the Choi matrix of the paper's Proposition
-- (Choi correspondence and composition). That fragment, and the Python
-- experiments in this directory, are the computational evidence; the
-- declarations are records of vocabulary.
--
-- Claim status (docs/theorem-registry.md): computational evidence only.
-- Nothing here is proof, and no claim of machine verification is made: the
-- executable models are stated against the same definitions the paper states,
-- and a later mechanization may audit them against kernel-checked
-- specifications.
module Vol04YonedaClassification.Instances
  ( -- * Systems of the volume
    CompactHausdorffSystem (..)
  , BooleanAlgebraSystem (..)
  , FiniteGroupRepSystem (..)
  , QuantumChannelSystem (..)
    -- * Relational profile (paper, probe class and relational profile)
  , RelationalProfile (..)
  , yonedaProfile
    -- * Typed channel fragment
  , Matrix (..)
  , matRows
  , matCols
  , matAdd
  , matScale
  , KrausChannel (..)
  , applyChannel
  , choiMatrix
  ) where

import Data.Complex (Complex, conjugate)

import Taxonomy.Families
  ( PhysicalSystem (..)
  , FamilyHilbertOperatorAlgebras (..)
  , FamilySmoothGeometric (..)
  , FamilyDynamicalSemigroups (..)
  , FamilyTensorCategoriesComposition (..)
  , FamilyDiscreteCombinatorial (..)
  )
import Taxonomy.Equivalences
  ( MathematicalEquivalence (..)
  , PhysicalEquivalence (..)
  )
import Taxonomy.Constructions
  ( Construction (..)
  , Constructible (..)
  , Irreducible (..)
  , Decomposable (..)
  )

-- | The relational profile of the paper's definition: the probe R, the set of
-- admissible relationships from R to P, and the presheaf action along probe
-- morphisms, which precomposes a relationship with the probe morphism.
data RelationalProfile probe probeMor rel = RelationalProfile
  { profileProbe     :: probe
  , profileRelations :: [rel]
  , profileAction    :: probeMor -> rel -> rel
  }

-- | Assemble the relational profile of a system against one probe. Executable
-- form of y(P)(R) = Hom(R, P) with its precomposition action along probe
-- morphisms; the action is the functorial transport of the presheaf.
yonedaProfile
  :: probe -> [rel] -> (probeMor -> rel -> rel) -> RelationalProfile probe probeMor rel
yonedaProfile p rs act = RelationalProfile p rs act

-- | Classical probe system of the paper's classical example: a compact
-- Hausdorff state space with commutative observable algebra C(X). The fields
-- are opaque identifiers; the instance declarations below record which family
-- data and which equivalence keys the system carries.
data CompactHausdorffSystem = CompactHausdorffSystem
  { chsSpace        :: String
  , chsObservables  :: String
  , chsDynamics     :: String
  , chsSymmetries   :: String
  , chsComposition  :: String
  , chsIsoKey       :: String
  , chsPhysicalKey  :: String
  }
  deriving (Eq, Show)

instance PhysicalSystem CompactHausdorffSystem where
  type StateSpace   CompactHausdorffSystem = String
  type Observables  CompactHausdorffSystem = String
  type Dynamics     CompactHausdorffSystem = String
  type Symmetries   CompactHausdorffSystem = String
  type Composition  CompactHausdorffSystem = String
  stateSpace  = chsSpace
  observables = chsObservables
  dynamics    = chsDynamics
  symmetries  = chsSymmetries
  composition = chsComposition

instance FamilySmoothGeometric CompactHausdorffSystem where
  type GeometricData CompactHausdorffSystem = String
  geometricData = chsSpace

instance FamilyHilbertOperatorAlgebras CompactHausdorffSystem where
  type OperatorAlgebraData CompactHausdorffSystem = String
  operatorAlgebraData = chsObservables

instance MathematicalEquivalence CompactHausdorffSystem where
  mathematicallyEquivalent a b = chsIsoKey a == chsIsoKey b

instance PhysicalEquivalence CompactHausdorffSystem where
  physicallyEquivalent a b = chsPhysicalKey a == chsPhysicalKey b

-- | Boolean probe system of the paper's finite Stone remark: a Boolean
-- algebra of probes with its Stone spectrum.
data BooleanAlgebraSystem = BooleanAlgebraSystem
  { basAlgebra      :: String
  , basSpectrum     :: String
  , basIsoKey       :: String
  , basPhysicalKey  :: String
  }
  deriving (Eq, Show)

instance PhysicalSystem BooleanAlgebraSystem where
  type StateSpace   BooleanAlgebraSystem = String
  type Observables  BooleanAlgebraSystem = String
  type Dynamics     BooleanAlgebraSystem = String
  type Symmetries   BooleanAlgebraSystem = String
  type Composition  BooleanAlgebraSystem = String
  stateSpace  = basSpectrum
  observables = basAlgebra
  dynamics    = const "none"
  symmetries  = const "none"
  composition = const "direct sum of clopen data"

instance FamilyDiscreteCombinatorial BooleanAlgebraSystem where
  type CombinatorialData BooleanAlgebraSystem = String
  combinatorialData = basAlgebra

instance MathematicalEquivalence BooleanAlgebraSystem where
  mathematicallyEquivalent a b = basIsoKey a == basIsoKey b

instance PhysicalEquivalence BooleanAlgebraSystem where
  physicallyEquivalent a b = basPhysicalKey a == basPhysicalKey b

-- | Finite-group representation system of the paper's fusion computation:
-- the representation category of a finite group, named by its group label and
-- fusion-ring label.
data FiniteGroupRepSystem = FiniteGroupRepSystem
  { fgrGroup        :: String
  , fgrCategory     :: String
  , fgrFusionRing   :: String
  , fgrIsoKey       :: String
  , fgrPhysicalKey  :: String
  }
  deriving (Eq, Show)

instance PhysicalSystem FiniteGroupRepSystem where
  type StateSpace   FiniteGroupRepSystem = String
  type Observables  FiniteGroupRepSystem = String
  type Dynamics     FiniteGroupRepSystem = String
  type Symmetries   FiniteGroupRepSystem = String
  type Composition  FiniteGroupRepSystem = String
  stateSpace  = fgrCategory
  observables = fgrFusionRing
  dynamics    = const "none"
  symmetries  = fgrGroup
  composition = const "tensor product of representations"

instance FamilyTensorCategoriesComposition FiniteGroupRepSystem where
  type TensorCategoryData FiniteGroupRepSystem = String
  tensorCategoryData = fgrCategory

instance MathematicalEquivalence FiniteGroupRepSystem where
  mathematicallyEquivalent a b = fgrIsoKey a == fgrIsoKey b

instance PhysicalEquivalence FiniteGroupRepSystem where
  physicallyEquivalent a b = fgrPhysicalKey a == fgrPhysicalKey b

instance Constructible FiniteGroupRepSystem where
  type Composite FiniteGroupRepSystem = FiniteGroupRepSystem
  tensorProduct a b = Just a { fgrFusionRing = fgrFusionRing a ++ " (x) " ++ fgrFusionRing b }
  directSum _ _ = Nothing
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

instance Irreducible FiniteGroupRepSystem where
  irreducibilityBasis _ = TensorProduct

instance Decomposable FiniteGroupRepSystem where
  decomposition _ = Nothing

-- | A complex matrix, given as a list of rows. Used for the typed channel
-- fragment below.
newtype Matrix = Matrix { entries :: [[Complex Double]] }
  deriving (Eq, Show)

matRows :: Matrix -> Int
matRows (Matrix m) = length m

matCols :: Matrix -> Int
matCols (Matrix []) = 0
matCols (Matrix (r : _)) = length r

matAdd :: Matrix -> Matrix -> Matrix
matAdd (Matrix a) (Matrix b) = Matrix (zipWith (zipWith (+)) a b)

matScale :: Complex Double -> Matrix -> Matrix
matScale s (Matrix m) = Matrix (map (map (s *)) m)

conjTranspose :: Matrix -> Matrix
conjTranspose (Matrix []) = Matrix []
conjTranspose (Matrix rs@(r : _)) =
  Matrix [ [ conjugate ((rs !! j) !! i) | j <- [0 .. length rs - 1] ]
         | i <- [0 .. length r - 1] ]

transposeMat :: Matrix -> Matrix
transposeMat (Matrix []) = Matrix []
transposeMat (Matrix rs@(r : _)) =
  Matrix [ [ (rs !! j) !! i | j <- [0 .. length rs - 1] ]
         | i <- [0 .. length r - 1] ]

matMul :: Matrix -> Matrix -> Matrix
matMul (Matrix a) b =
  let bt = entries (transposeMat b)
  in Matrix [ [ sum (zipWith (*) row col) | col <- bt ] | row <- a ]

-- | Kronecker product.
kron :: Matrix -> Matrix -> Matrix
kron (Matrix a) (Matrix b) =
  Matrix [ concat [ map ((ar !! k) *) brow | k <- [0 .. length ar - 1] ]
         | ar <- a
         , j  <- [0 .. length b - 1]
         , let brow = b !! j ]

-- | The matrix unit E_ij of size n.
basisMatrix :: Int -> Int -> Int -> Matrix
basisMatrix n i j =
  Matrix [ [ if r == i && c == j then 1 else 0 | c <- [0 .. n - 1] ]
         | r <- [0 .. n - 1] ]

-- | A quantum channel given by Kraus operators K_s : C^n -> C^m, acting as
-- X |-> sum_s K_s X K_s^*.
data KrausChannel = KrausChannel
  { kcInputDim   :: Int
  , kcOutputDim  :: Int
  , kcOperators  :: [Matrix]
  }
  deriving (Eq, Show)

-- | Zero matrix of the given shape.
zeroMatrix :: Int -> Int -> Matrix
zeroMatrix r c = Matrix (replicate r (replicate c 0))

-- | Apply a Kraus channel to a matrix.
applyChannel :: KrausChannel -> Matrix -> Matrix
applyChannel ch x =
  let zero = zeroMatrix (kcOutputDim ch) (kcOutputDim ch)
  in foldr matAdd zero [ matMul (matMul k x) (conjTranspose k) | k <- kcOperators ch ]

-- | The Choi matrix J(Phi) = sum_ij E_ij (x) Phi(E_ij) of the paper's
-- proposition on the Choi correspondence.
choiMatrix :: KrausChannel -> Matrix
choiMatrix ch =
  let n = kcInputDim ch
      m = kcOutputDim ch
      zero = zeroMatrix (n * m) (n * m)
  in foldr matAdd zero
       [ kron (basisMatrix n i j) (applyChannel ch (basisMatrix n i j))
       | i <- [0 .. n - 1], j <- [0 .. n - 1] ]

-- | Quantum channel system of the paper's process example. The process data
-- is typed (dimensions and Kraus operators); the equivalence keys are
-- declared data.
data QuantumChannelSystem = QuantumChannelSystem
  { qcsChannel      :: KrausChannel
  , qcsSymmetries   :: String
  , qcsComposition  :: String
  , qcsIsoKey       :: String
  , qcsPhysicalKey  :: String
  }
  deriving (Eq, Show)

instance PhysicalSystem QuantumChannelSystem where
  type StateSpace   QuantumChannelSystem = (Int, Int)
  type Observables  QuantumChannelSystem = Matrix
  type Dynamics     QuantumChannelSystem = KrausChannel
  type Symmetries   QuantumChannelSystem = String
  type Composition  QuantumChannelSystem = String
  stateSpace q  = (kcInputDim (qcsChannel q), kcOutputDim (qcsChannel q))
  observables   = choiMatrix . qcsChannel
  dynamics      = qcsChannel
  symmetries    = qcsSymmetries
  composition   = qcsComposition

instance FamilyHilbertOperatorAlgebras QuantumChannelSystem where
  type OperatorAlgebraData QuantumChannelSystem = Matrix
  operatorAlgebraData = choiMatrix . qcsChannel

instance FamilyDynamicalSemigroups QuantumChannelSystem where
  type DynamicalSemigroupData QuantumChannelSystem = KrausChannel
  dynamicalSemigroupData = qcsChannel

instance MathematicalEquivalence QuantumChannelSystem where
  mathematicallyEquivalent a b = qcsIsoKey a == qcsIsoKey b

instance PhysicalEquivalence QuantumChannelSystem where
  physicallyEquivalent a b = qcsPhysicalKey a == qcsPhysicalKey b

instance Constructible QuantumChannelSystem where
  type Composite QuantumChannelSystem = QuantumChannelSystem
  tensorProduct a b =
    let ca = qcsChannel a
        cb = qcsChannel b
        combined = KrausChannel
          { kcInputDim  = kcInputDim ca * kcInputDim cb
          , kcOutputDim = kcOutputDim ca * kcOutputDim cb
          , kcOperators = [ kron ka kb | ka <- kcOperators ca, kb <- kcOperators cb ]
          }
    in Just a { qcsChannel = combined }
  directSum _ _ = Nothing
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

instance Irreducible QuantumChannelSystem where
  irreducibilityBasis _ = TensorProduct

instance Decomposable QuantumChannelSystem where
  decomposition _ = Nothing

exec
/usr/local/bin/zsh -lc 'cat src/vol-05-classical-systems/Instances.hs src/vol-06-quantum-systems/Instances.hs' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
{-# LANGUAGE TypeFamilies #-}

-- | Module        : Vol05ClassicalSystems.Instances
-- Description     : Instance declarations of the shared CMRPS taxonomy classes
--                   for the classical physical systems of vol-05
--                   (Classification of Classical Physical Systems).
-- Paper source    : papers/latex/vol-05-classical-systems.tex
-- Targets mirror  : verification/vol-05-classical-systems-lean-targets.md
--
-- The family classes of 'Taxonomy.Families', the construction hooks of
-- 'Taxonomy.Constructions', and the equivalence hooks of
-- 'Taxonomy.Equivalences' are imported, never redefined. The types and witness
-- functions below carry the names used in the paper and in the Lean
-- mechanization targets (Darboux, WeinsteinSplitting, KKSSymplectic,
-- MoserStability, MonodromyObstruction, ChentsovFisher, FisherExplicit).
--
-- Claim status (docs/theorem-registry.md): this module is executable
-- computational evidence only. It proves nothing and is never "verified by
-- Lean": the honest statement is that these are executable models validated
-- against the informal specifications of the paper.
module Vol05ClassicalSystems.Instances
  ( -- * Witness data types
    SymplecticForm (..)
  , PoissonBivector (..)
  , ProbVector (..)
  , StochasticMatrix (..)
  , SymplecticSurface (..)
    -- * Physical systems of this volume
  , SymplecticSystem (..)
  , PoissonSystem (..)
  , HamiltonianSystem (..)
  , ClassicalStatisticalSystem (..)
    -- * Witness functions mirroring the paper's theorems
  , standardSymplecticForm
  , darboux
  , weinsteinSplitting
  , kksSymplecticForm
  , moserStableFamily
  , pendulumMonodromy
  , fisherMetric
  , rankChecks
  ) where

import Taxonomy.Families
import Taxonomy.Constructions
import Taxonomy.Equivalences

-- | Definition 2.2 (paper): a symplectic form as its skew matrix in a chart.
-- Entries are rational for exact computation.
newtype SymplecticForm = SymplecticForm [[Rational]]
  deriving (Eq, Show)

-- | Definition 2.3 (paper): a Poisson bivector as its matrix pi^{ij} in a
-- chart.
newtype PoissonBivector = PoissonBivector [[Rational]]
  deriving (Eq, Show)

-- | Definition 2.4 (paper): a probability vector in the open simplex.
newtype ProbVector = ProbVector [Rational]
  deriving (Eq, Show)

-- | Definition 2.4 (paper): a column-stochastic matrix (columns sum to one).
newtype StochasticMatrix = StochasticMatrix [[Rational]]
  deriving (Eq, Show)

-- | Proposition 9 (paper): a closed symplectic surface, recorded by genus name
-- and total area (the classifying data of Example "surfaces").
newtype SymplecticSurface = SymplecticSurface (String, Rational)
  deriving (Eq, Show)

-- | Definition 2.2 (paper): a symplectic system, recorded by manifold name,
-- symplectic form, and Hamiltonian names.
data SymplecticSystem = SymplecticSystem
  { symplecticManifold :: String
  , symplecticForm :: SymplecticForm
  , symplecticHamiltonians :: [String]
  }
  deriving (Eq, Show)

-- | Definition 2.3 (paper): a Poisson system, recorded by manifold name and
-- Poisson bivector.
data PoissonSystem = PoissonSystem
  { poissonManifold :: String
  , poissonBivector :: PoissonBivector
  }
  deriving (Eq, Show)

-- | Definition 2.2 (paper): a Hamiltonian system: a symplectic system with one
-- distinguished Hamiltonian.
data HamiltonianSystem = HamiltonianSystem
  { hamiltonianBase :: SymplecticSystem
  , hamiltonianFunction :: String
  }
  deriving (Eq, Show)

-- | Definition 2.4 (paper): a classical statistical system, recorded by its
-- probability vector and its stochastic maps.
data ClassicalStatisticalSystem = ClassicalStatisticalSystem
  { statProbabilities :: ProbVector
  , statStochasticMaps :: [StochasticMatrix]
  }
  deriving (Eq, Show)

-- | Definition 2.2 (paper): the standard symplectic matrix
-- omega_0 = sum_i dx_i wedge dy_i in dimension 2n.
standardSymplecticForm :: Int -> SymplecticForm
standardSymplecticForm n = SymplecticForm [[entry i j | j <- [0 .. 2 * n - 1]]
                                         | i <- [0 .. 2 * n - 1]]
  where
    entry i j
      | j == i + n = 1
      | i == j + n = -1
      | otherwise = 0

-- | Lean target 'Darboux': the Darboux normal form at any point is the
-- standard symplectic form. The witness is the standard matrix of dimension
-- 2n; the paper's Theorem 3.1 proves that every symplectic manifold is locally
-- symplectomorphic to it.
darboux :: Int -> SymplecticForm
darboux = standardSymplecticForm

-- | Lean target 'WeinsteinSplitting': the rank split of a Poisson tensor at a
-- point. The witness returns (rank, transverse dimension) for the tensor
-- matrix; the paper's Theorem 4.1 splits a neighborhood into a symplectic
-- factor of dimension rank and a transverse Poisson factor.
weinsteinSplitting :: PoissonBivector -> (Int, Int)
weinsteinSplitting (PoissonBivector m) = (r, length m - r)
  where
    r = rankRational m

-- | Lean target 'KKSSymplectic': the Kirillov-Kostant-Souriau form on the
-- coadjoint orbit of so(3)* through xi = (0, 0, r), in the basis of
-- fundamental vector fields. The value omega_xi(ad*_x xi, ad*_y xi) =
-- <xi, [x, y]> is the area form of magnitude r (paper, Theorem 4.3).
kksSymplecticForm :: Rational -> SymplecticForm
kksSymplecticForm r = SymplecticForm [[0, r], [negate r, 0]]

-- | Lean target 'MoserStability': the hypothesis of the theorem is that the
-- cohomology classes of the family omega_t are constant. The witness checks
-- constancy of recorded class vectors.
moserStableFamily :: [[Rational]] -> Bool
moserStableFamily [] = True
moserStableFamily (c : cs) = all (== c) cs

-- | Lean target 'MonodromyObstruction': the monodromy matrix of the spherical
-- pendulum period lattice, the unipotent matrix computed by Duistermaat
-- (paper, Example "pendulum"). Nontrivial monodromy obstructs global
-- action-angle coordinates.
pendulumMonodromy :: [[Integer]]
pendulumMonodromy = [[1, 1], [0, 1]]

-- | Lean target 'FisherExplicit' and 'ChentsovFisher': the Fisher metric
-- g_p(u, v) = sum_i u_i v_i / p_i on the open simplex (paper, Definition 8.1).
fisherMetric :: ProbVector -> [Rational] -> [Rational] -> Maybe Rational
fisherMetric (ProbVector ps) us vs
  | length ps == length us && length us == length vs =
      Just (sum (zipWith3 (\p u v -> u * v / p) ps us vs))
  | otherwise = Nothing

-- | Gaussian elimination over the rationals; used by 'weinsteinSplitting'.
rankRational :: [[Rational]] -> Int
rankRational [] = 0
rankRational mat = go 0 mat
  where
    ncols = rowLength mat
    go _ [] = 0
    go col rows
      | col >= ncols = 0
      | otherwise =
          case break (\row -> row !! col /= 0) rows of
            (_, []) -> go (col + 1) rows
            (before, pivot : rest) ->
              let piv = pivot !! col
                  norm = map (/ piv) pivot
                  red row = zipWith (\a b -> a - (row !! col) * b) row norm
              in 1 + go (col + 1) (map red (before ++ rest))

-- | Property checks for 'rankRational', the helper behind
-- 'weinsteinSplitting': the skew matrix [[0,1],[-1,0]] has rank two and the
-- zero matrix of any size has rank zero.
rankChecks :: Bool
rankChecks =
  rankRational [[0, 1], [-1, 0]] == 2
    && rankRational [[0, 0], [0, 0]] == 0
    && rankRational [[1, 0], [0, 1]] == 2

-- | Length of the first row of a nonempty matrix.
rowLength :: [[Rational]] -> Int
rowLength (r : _) = length r
rowLength [] = 0

-- | Block-diagonal sum of two matrices (product composition of forms).
blockDiagonal :: [[Rational]] -> [[Rational]] -> [[Rational]]
blockDiagonal a b =
  [row ++ replicate nb 0 | row <- a] ++ [replicate na 0 ++ row | row <- b]
  where
    na = rowLength a
    nb = rowLength b

-- | Product of two symplectic systems (Definition 9.1, paper).
productSystem :: SymplecticSystem -> SymplecticSystem -> SymplecticSystem
productSystem s1 s2 = SymplecticSystem
  { symplecticManifold = symplecticManifold s1 ++ " x " ++ symplecticManifold s2
  , symplecticForm = SymplecticForm
      (blockDiagonal rows1 rows2)
  , symplecticHamiltonians = symplecticHamiltonians s1 ++ symplecticHamiltonians s2
  }
  where
    SymplecticForm rows1 = symplecticForm s1
    SymplecticForm rows2 = symplecticForm s2

-- | DEF-002 instance: symplectic systems are classical systems of the
-- five-component schema (paper, Definition 2.2).
instance PhysicalSystem SymplecticSystem where
  type StateSpace SymplecticSystem = SymplecticForm
  type Observables SymplecticSystem = [String]
  type Dynamics SymplecticSystem = [String]
  type Symmetries SymplecticSystem = [String]
  type Composition SymplecticSystem = Construction
  stateSpace = symplecticForm
  observables _ = ["C^infty(M)"]
  dynamics = symplecticHamiltonians
  symmetries _ = ["Hamiltonian group"]
  composition _ = TensorProduct

-- | DEF-002 instance for Poisson systems (paper, Definition 2.3).
instance PhysicalSystem PoissonSystem where
  type StateSpace PoissonSystem = PoissonBivector
  type Observables PoissonSystem = [String]
  type Dynamics PoissonSystem = [String]
  type Symmetries PoissonSystem = [String]
  type Composition PoissonSystem = Construction
  stateSpace = poissonBivector
  observables _ = ["C^infty(M)"]
  dynamics _ = ["Poisson flow"]
  symmetries _ = ["Poisson automorphisms"]
  composition _ = TensorProduct

-- | DEF-002 instance for Hamiltonian systems (paper, Definition 2.2).
instance PhysicalSystem HamiltonianSystem where
  type StateSpace HamiltonianSystem = SymplecticForm
  type Observables HamiltonianSystem = [String]
  type Dynamics HamiltonianSystem = String
  type Symmetries HamiltonianSystem = [String]
  type Composition HamiltonianSystem = Construction
  stateSpace = symplecticForm . hamiltonianBase
  observables = observables . hamiltonianBase
  dynamics = hamiltonianFunction
  symmetries = symmetries . hamiltonianBase
  composition = composition . hamiltonianBase

-- | DEF-002 instance for classical statistical systems (paper, Definition 2.4).
instance PhysicalSystem ClassicalStatisticalSystem where
  type StateSpace ClassicalStatisticalSystem = ProbVector
  type Observables ClassicalStatisticalSystem = [String]
  type Dynamics ClassicalStatisticalSystem = [StochasticMatrix]
  type Symmetries ClassicalStatisticalSystem = [String]
  type Composition ClassicalStatisticalSystem = Construction
  stateSpace = statProbabilities
  observables _ = ["random variables"]
  dynamics = statStochasticMaps
  symmetries _ = ["sufficient statistics"]
  composition _ = DirectSum

-- | DEF-026 instance: symplectic systems carry Family I data (the symplectic
-- form itself).
instance FamilySymplecticPoisson SymplecticSystem where
  type SymplecticPoissonData SymplecticSystem = SymplecticForm
  symplecticPoissonData = symplecticForm

-- | DEF-026 instance: Poisson systems carry Family I data (the bivector).
instance FamilySymplecticPoisson PoissonSystem where
  type SymplecticPoissonData PoissonSystem = PoissonBivector
  symplecticPoissonData = poissonBivector

-- | DEF-026 instance: Hamiltonian systems carry Family I data through their
-- base symplectic system.
instance FamilySymplecticPoisson HamiltonianSystem where
  type SymplecticPoissonData HamiltonianSystem = SymplecticForm
  symplecticPoissonData = symplecticForm . hamiltonianBase

-- | DEF-030 instance: classical statistical systems carry Family V data (the
-- probability vector; the Fisher metric witness is 'fisherMetric').
instance FamilyProbabilityMeasure ClassicalStatisticalSystem where
  type ProbabilityMeasureData ClassicalStatisticalSystem = ProbVector
  probabilityMeasureData = statProbabilities

-- | DEF-023 instance: product composition of symplectic systems
-- (paper, Definition 9.1). Extension, limit, and colimit hooks are not
-- supplied for this volume.
instance Constructible SymplecticSystem where
  type Composite SymplecticSystem = SymplecticSystem
  tensorProduct s1 s2 = Just (productSystem s1 s2)
  directSum s1 s2 = Just (productSystem s1 s2)
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ s = Just s

-- | DEF-022 hook: no decomposition is supplied by this module. Nothing is not
-- a claim that no decomposition exists (paper, Remark "uniqueness").
instance Decomposable SymplecticSystem where
  decomposition _ = Nothing

-- | DEF-021 instance: closed symplectic surfaces are irreducible relative to
-- the product composition (paper, Proposition "surface-irreducible").
instance Irreducible SymplecticSurface where
  irreducibilityBasis _ = TensorProduct

-- | DEF-016 hook: equality of the recorded chart data is a conservative
-- witness of mathematical equivalence. It is not a decision procedure for
-- symplectomorphism, and the paper's equivalence claims are stated with their
-- preserved layers, not through this hook.
instance MathematicalEquivalence SymplecticSystem where
  mathematicallyEquivalent s1 s2 = symplecticForm s1 == symplecticForm s2
{-# LANGUAGE TypeFamilies #-}

-- | Module      : Vol06QuantumSystems.Instances
-- Description   : Volume 06 instances of the CMRPS taxonomy classes for the
--                 quantum physical systems of the paper "Classification of
--                 Quantum Physical Systems": finite-dimensional block
--                 algebras, Hilbert-space systems, operator-algebra systems
--                 (factors), quantum channels, density-matrix systems, and
--                 superselection categories.
-- Copyright     : (c) Matthew Long, 2026
-- License       : MIT
-- Maintainer    : matthew@yonedaai.com
-- Stability     : experimental
--
-- The shared family classes live in "Taxonomy.Families",
-- "Taxonomy.Invariants", "Taxonomy.Constructions", and
-- "Taxonomy.Equivalences"; this module imports them and supplies only
-- instances, never redefinitions. Method and type names mirror the
-- definitions and theorem targets of the paper and of
-- verification/vol-06-quantum-systems-lean-targets.md (dimension vector,
-- minimal Kraus rank, Stinespring minimal dilation, operator monotone
-- parameter, the McDuff obstruction).
--
-- Claim status (docs/theorem-registry.md): this module is executable
-- taxonomy and computational evidence for the finite-dimensional statements
-- of the paper. It is not a proof and no machine-checked formalization is
-- claimed for it; the Lean targets of the volume state what a future
-- kernel-checked development would have to establish.
module Vol06QuantumSystems.Instances
  ( -- * Finite-dimensional block algebras (paper, Theorem 3.1)
    FiniteDimCStar (..)
  , MatrixBlock (..)
  , dimensionVector
  , tensorBlocks
  , directSumBlocks
  , isomorphicByDimensionVector
  , partitionsIntoSquares
    -- * System records (paper, Definition 2.1)
  , QuantumSystemRecord (..)
  , DynamicsSpec (..)
  , SymmetrySpec (..)
  , CompositionSpec (..)
    -- * Operator-algebraic systems (paper, Section 4)
  , FactorDescriptor (..)
  , Amenability (..)
  , mcduffWitness
    -- * Channels and dilations (paper, Section 6)
  , ChannelDescriptor (..)
  , minimalKrausRank
  , stinespringDilationDim
    -- * Density-matrix systems (paper, Section 8)
  , DensityMatrixSystem (..)
  , OperatorMonotoneParameter (..)
  , petzOperatorMonotone
    -- * Superselection categories (paper, Section 7)
  , SuperselectionSystem (..)
  , SuperselectionDescriptor (..)
  ) where

import Taxonomy.Constructions
  ( Construction (..)
  , Constructible (..)
  , Decomposable (..)
  , Decomposition (..)
  , Irreducible (..)
  )
import Data.List (sort)
import Taxonomy.Equivalences (MathematicalEquivalence (..))
import Taxonomy.Families
  ( FamilyDynamicalSemigroups (..)
  , FamilyHilbertOperatorAlgebras (..)
  , FamilyProbabilityMeasure (..)
  , FamilyTensorCategoriesComposition (..)
  , PhysicalSystem (..)
  )
import Taxonomy.Invariants
  ( DimensionVector (..)
  , MurrayVonNeumannType
  )

-- | Finite-dimensional C*-algebra A = sum_i M_{n_i}(C), given by its block
-- sizes (paper, Theorem 3.1). The list is a multiset: order carries no
-- information.
newtype FiniteDimCStar = FiniteDimCStar { blockSizes :: [Int] }
  deriving (Eq, Ord, Show)

-- | One matrix block M_n(C): an irreducible summand under direct sum
-- (paper, Theorem 3.1; DEF-021 for the direct-sum composition).
newtype MatrixBlock = MatrixBlock { matrixSize :: Int }
  deriving (Eq, Ord, Show)

-- | The dimension vector d(A) = {n_1, ..., n_k}, the classifying invariant of
-- finite-dimensional C*-algebras (paper, Definition 2.3 and Theorem 3.1;
-- lean target finite_dim_cstar_dimensionVector_classifies).
dimensionVector :: FiniteDimCStar -> DimensionVector
dimensionVector (FiniteDimCStar ns) = DimensionVector (sorted ns)

-- | Tensor product of block algebras: A tensor B has blocks {n_i * m_j}
-- (paper, Appendix A).
tensorBlocks :: FiniteDimCStar -> FiniteDimCStar -> FiniteDimCStar
tensorBlocks (FiniteDimCStar ns) (FiniteDimCStar ms) =
  FiniteDimCStar (sorted [n * m | n <- ns, m <- ms])

-- | Direct sum of block algebras: the block multiset union.
directSumBlocks :: FiniteDimCStar -> FiniteDimCStar -> FiniteDimCStar
directSumBlocks (FiniteDimCStar ns) (FiniteDimCStar ms) =
  FiniteDimCStar (sorted (ns ++ ms))

-- | Two finite-dimensional C*-algebras are *-isomorphic exactly when their
-- dimension vectors agree as multisets (paper, Theorem 3.1; lean target
-- finite_dim_cstar_dimensionVector_classifies).
isomorphicByDimensionVector :: FiniteDimCStar -> FiniteDimCStar -> Bool
isomorphicByDimensionVector a b = dimensionVector a == dimensionVector b

-- | Representations of d as a sum of squares of positive integers; each
-- representation is the block multiset of a unital finite-dimensional C*-algebra
-- of complex dimension d (paper, Corollary 3.2).
partitionsIntoSquares :: Int -> [[Int]]
partitionsIntoSquares = go 1
  where
    go _ 0 = [[]]
    go start d =
      [ n : rest
      | n <- [start .. isqrt d]
      , n * n <= d
      , rest <- go n (d - n * n)
      ]
    isqrt d = floor (sqrt (fromIntegral d :: Double))

sorted :: Ord a => [a] -> [a]
sorted = sort

-- | Dynamics data of a quantum system record (paper, Definition 2.1;
-- DEF-005). Abstract specification: kind of evolution and its generator
-- label. No dynamics is computed here.
data DynamicsSpec
  = UnitaryFlow String
  | SemigroupFlow String
  | NoDynamics
  deriving (Eq, Show)

-- | Symmetry and constraint data (DEF-006).
data SymmetrySpec
  = GroupAction String
  | TrivialSymmetry
  deriving (Eq, Show)

-- | Composition and interaction rules (DEF-007); fixes the meaning of
-- irreducibility (DEF-021).
data CompositionSpec
  = TensorComposition
  | DirectSumComposition
  | NoComposition
  deriving (Eq, Show)

-- | A quantum system record P = (H, A, D, S, C) (paper, Definition 2.1):
-- finite-dimensional Hilbert space of the given dimension, finite-dimensional
-- observable C*-algebra, dynamics, symmetries, composition.
data QuantumSystemRecord = QuantumSystemRecord
  { hilbertDim :: Int
  , observablesAlgebra :: FiniteDimCStar
  , dynamicsSpec :: DynamicsSpec
  , symmetriesSpec :: SymmetrySpec
  , compositionSpec :: CompositionSpec
  }
  deriving (Eq, Show)

-- | Amenability status of a factor (paper, Section 4). The amenable factors
-- are classified (Theorem 4.2); the non-amenable ones are not (Theorem 5.1).
data Amenability = Amenable | NonAmenable
  deriving (Eq, Ord, Show)

-- | An operator-algebraic system given as factor data: Murray-von Neumann
-- type (DEF-037), amenability, and a label for any additional Connes data
-- (T-OP-06 keeps the general strata open).
data FactorDescriptor = FactorDescriptor
  { murrayVonNeumannType :: MurrayVonNeumannType
  , factorAmenability :: Amenability
  , connesDataLabel :: String
  }
  deriving (Eq, Show)

-- | Symbolic witness for the McDuff obstruction (paper, Theorem 5.1;
-- lean target mcduff_uncountable_II1): separable type II_1 factors are
-- pairwise non-isomorphic along an uncountable family. No enumeration of the
-- family is possible or attempted; the witness records only that separation
-- data is asserted.
data McDuffWitness = McDuffWitness
  { separationInvariant :: String
  , witnessFamilyIndex :: String
  }
  deriving (Eq, Show)

-- | The McDuff obstruction as taxonomy vocabulary (T-OB-01). This is a
-- declaration, not a computation: uncountably many non-isomorphic separable
-- II_1 factors exist, so no total factor classification can hold.
mcduffWitness :: McDuffWitness
mcduffWitness =
  McDuffWitness
    { separationInvariant = "central-sequence algebra"
    , witnessFamilyIndex = "uncountable"
    }

-- | A quantum channel with its normal-form data (paper, Theorem 3.3 and
-- Section 6): number of Kraus operators in the given presentation, minimal
-- Kraus rank (equal to the Choi rank), and minimal Stinespring dilation
-- dimension.
data ChannelDescriptor = ChannelDescriptor
  { krausCount :: Int
  , krausRank :: Int
  , dilationDim :: Int
  }
  deriving (Eq, Show)

-- | Minimal number of Kraus operators, the normal-form invariant of a
-- channel (paper, Theorem 3.3 and Proposition 6.2; lean target
-- kraus_rank_normal_form). Not an isomorphism invariant of channels.
minimalKrausRank :: ChannelDescriptor -> Int
minimalKrausRank = krausRank

-- | Dimension of a minimal Stinespring dilation (paper, Theorem 6.1; lean
-- target stinespring_minimal_dilation_unique).
stinespringDilationDim :: ChannelDescriptor -> Int
stinespringDilationDim = dilationDim

-- | A normalized operator monotone function parameterizing a monotone metric
-- on density matrices (paper, Theorem 8.1; lean target
-- petz_monotone_metrics). The normalization condition is f(t) = t f(1/t);
-- the function itself is carried as data.
data OperatorMonotoneParameter = OperatorMonotoneParameter
  { monotoneLabel :: String
  , monotoneFunction :: Double -> Double
  , normalizedAt :: Double -> Bool
  }

-- | The operator monotone parameter in force for a density-matrix system
-- (paper, Corollary 8.2).
petzOperatorMonotone :: DensityMatrixSystem -> OperatorMonotoneParameter
petzOperatorMonotone = monotoneParameter

-- | A quantum state space of density matrices with the monotone metric
-- parameter in force (Family V, quantum side; paper, Definition 8.1).
data DensityMatrixSystem = DensityMatrixSystem
  { matrixDim :: Int
  , monotoneParameter :: OperatorMonotoneParameter
  }

-- | Superselection data of a local net (paper, Definition 7.1): symmetric
-- tensor structure flag, conjugates, and the scalar endomorphism ring of the
-- unit, the hypotheses of the Doplicher-Roberts theorem (lean target
-- dr_reconstruction).
data SuperselectionDescriptor = SuperselectionDescriptor
  { symmetricStructure :: Bool
  , hasConjugates :: Bool
  , hasDirectSumsSubobjects :: Bool
  , endOfUnitIsScalar :: Bool
  , selectionCriterion :: String
  }
  deriving (Eq, Show)

-- | A superselection category of a quantum field theory (Family VIII;
-- paper, Section 7).
newtype SuperselectionSystem = SuperselectionSystem
  { superselectionData :: SuperselectionDescriptor
  }
  deriving (Eq, Show)

-- | DEF-002 record instance: state space is the Hilbert dimension, observables
-- are the block algebra, and the remaining components are their spec data.
instance PhysicalSystem QuantumSystemRecord where
  type StateSpace QuantumSystemRecord = Int
  type Observables QuantumSystemRecord = FiniteDimCStar
  type Dynamics QuantumSystemRecord = DynamicsSpec
  type Symmetries QuantumSystemRecord = SymmetrySpec
  type Composition QuantumSystemRecord = CompositionSpec
  stateSpace = hilbertDim
  observables = observablesAlgebra
  dynamics = dynamicsSpec
  symmetries = symmetriesSpec
  composition = compositionSpec

-- | Family II instance for Hilbert-space systems (DEF-027).
instance FamilyHilbertOperatorAlgebras QuantumSystemRecord where
  type OperatorAlgebraData QuantumSystemRecord = FiniteDimCStar
  operatorAlgebraData = observablesAlgebra

-- | Family II instance for factor systems (DEF-027); the classifying data is
-- the factor descriptor, and no claim is made beyond Theorem 4.2.
instance FamilyHilbertOperatorAlgebras FactorDescriptor where
  type OperatorAlgebraData FactorDescriptor = FactorDescriptor
  operatorAlgebraData = id

-- | Family VII instance for open systems given by channels (DEF-032):
-- Stinespring data is normal form (T-BG-15), not an isomorphism
-- classification.
instance FamilyDynamicalSemigroups ChannelDescriptor where
  type DynamicalSemigroupData ChannelDescriptor = ChannelDescriptor
  dynamicalSemigroupData = id

-- | Family V instance for density-matrix systems (DEF-030): the quantum
-- monotone metric is parametric (T-BG-18), and no uniqueness transfers from
-- the classical case.
instance FamilyProbabilityMeasure DensityMatrixSystem where
  type ProbabilityMeasureData DensityMatrixSystem = OperatorMonotoneParameter
  probabilityMeasureData = monotoneParameter

-- | Family VIII instance for superselection categories (DEF-033); the
-- symmetric layer is load-bearing (paper, Proposition 7.5).
instance FamilyTensorCategoriesComposition SuperselectionSystem where
  type TensorCategoryData SuperselectionSystem = SuperselectionDescriptor
  tensorCategoryData = superselectionData

-- | DEF-023 constructions on block algebras: tensor and direct sum are
-- computed; extension and the limit hooks are not supplied here.
instance Constructible FiniteDimCStar where
  type Composite FiniteDimCStar = FiniteDimCStar
  tensorProduct a b = Just (tensorBlocks a b)
  directSum a b = Just (directSumBlocks a b)
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

-- | DEF-022 decomposition of a block algebra into single-block algebras under
-- direct sum (paper, Theorem 3.1); each factor FiniteDimCStar [n] is the
-- irreducible summand of the same size as MatrixBlock n.
instance Decomposable FiniteDimCStar where
  decomposition (FiniteDimCStar ns) =
    Just
      Decomposition
        { decompositionConstruction = DirectSum
        , irreducibleFactors = [FiniteDimCStar [n] | n <- ns]
        }

-- | DEF-021 irreducibility of a single matrix block under direct sum.
instance Irreducible MatrixBlock where
  irreducibilityBasis :: MatrixBlock -> Construction
  irreducibilityBasis _ = DirectSum

-- | DEF-016 mathematical equivalence for block algebras: equality of
-- dimension vectors (paper, Theorem 3.1).
instance MathematicalEquivalence FiniteDimCStar where
  mathematicallyEquivalent = isomorphicByDimensionVector

-- | DEF-016 mathematical equivalence for channels is deliberately absent:
-- Kraus rank is not a complete invariant (paper, Proposition 6.2), and the
-- taxonomy records no channel equivalence here on purpose.

codex
The family classes are confined to `src/Taxonomy/`. I’ve found several cross-audit and runtime issues so far: cited Lean names that differ from the declarations, a channel-rank calculation that contradicts its comment, and unchecked inputs that can raise exceptions. I’m checking the remaining volumes and Lean definitions to complete the list.
exec
/usr/local/bin/zsh -lc 'cat src/vol-07-gauge-qft/Instances.hs src/vol-08-spacetime-reconstruction/Instances.hs' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
{-# LANGUAGE TypeFamilies #-}

-- | Module        : Vol07GaugeQft.Instances
-- Description     : Instances of the shared CMRPS taxonomy classes for the
--                   gauge and quantum field theory systems of vol-07
--                   (Classification of Gauge Structures and Quantum Field
--                   Theories).
-- Ontology source : docs/ontology.md (DEF-029 Family IV, DEF-031 Family VI,
--                   DEF-033 Family VIII, DEF-036, DEF-037).
--
-- The shared family classes live in src/Taxonomy/ and are imported here, never
-- redefined. The types below are the physical systems of this volume: gauge
-- groups, principal bundles with connection data, anomaly records, two
-- dimensional topological theories, and local-net sector data. Method names
-- mirror the definitions and propositions of the paper and the targets listed
-- in verification/vol-07-gauge-qft-lean-targets.md.
--
-- Claim status (docs/theorem-registry.md): executable models of the
-- classification data, cross-audited against the paper's definitions. This
-- module is computational evidence; it is not machine-checked and nothing here
-- is "verified by Lean". Literature results cited in the comments carry their
-- registry status (complete-informal-proof at best).
module Vol07GaugeQft.Instances
  ( -- * Gauge groups and bases (paper, Section 3)
    GaugeGroup (..)
  , gaugeGroupDiagram
  , gaugeGroupCenter
  , labelOf
  , BaseSpace (..)
    -- * Principal bundles with connection data (paper, Section 4)
  , PrincipalBundleSystem (..)
  , classifyingInvariantOf
  , sphereBundleClass
  , classicalCharacteristicRing
    -- * Anomaly records (paper, Section 5)
  , AnomalyData (..)
  , anomalyFree
  , quantizationGate
    -- * Two-dimensional topological theories (paper, Section 6)
  , FrobeniusSystem (..)
    -- * Local-net sector data (paper, Section 7)
  , SectorSystem (..)
    -- * Composition of gauge systems (paper, Section 2)
  , ProductBundleSystem (..)
    -- * Examples of the paper as values
  , exampleInstantons
  , exampleAbelianObstruction
  , crossAudit
  ) where

import Taxonomy.Families
  ( PhysicalSystem (..)
  , FamilyPrincipalBundlesConnections (..)
  , FamilyTopologicalHigherCategorical (..)
  , FamilyTensorCategoriesComposition (..)
  )
import Taxonomy.Invariants
  ( CharacteristicClass (..)
  , DynkinDiagram (..)
  , LieDiagram (..)
  , WeightData (..)
  , CasimirData (..)
  )
import Taxonomy.Constructions
  ( Construction (..)
  , ExtensionKind (..)
  , QuotientKind (..)
  , Constructible (..)
  )

-- | Gauge groups of the paper's examples (Sections 3 and 4): the connected
-- compact groups whose Dynkin diagram, center, and sphere-bundle
-- classification appear in Examples 4.1, 4.2, 4.3 and 4.4.
data GaugeGroup
  = U1
    -- ^ Circle group; Dynkin datum A_1 with full center.
  | SU2
    -- ^ Simply connected group of type A_1 (Example 4.3).
  | SO3
    -- ^ Adjoint form of A_1; pi_1 = Z/2 (Example 4.4).
  | U2
    -- ^ Product of SU(2) and U(1) modulo a central Z/2.
  | SU3
    -- ^ Simply connected group of type A_2 (Example 3.2).
  deriving (Eq, Ord, Show)

-- | The Dynkin diagram of the gauge algebra of each group
-- (paper, Theorem 3.1, Killing-Cartan; lean target
-- killing_cartan_classification). Only the complex semisimple type is
-- recorded; real forms are not distinguished here.
gaugeGroupDiagram :: GaugeGroup -> DynkinDiagram
gaugeGroupDiagram U1  = ADyn 1
gaugeGroupDiagram SU2 = ADyn 1
gaugeGroupDiagram SO3 = ADyn 1
gaugeGroupDiagram U2  = ADyn 1
gaugeGroupDiagram SU3 = ADyn 2

-- | Center of the group as an abstract label. The distinction between
-- SU(2) and SO(3) (Example 4.4, lean target global_form_distinction) is
-- exactly this datum; the Dynkin diagram does not see it.
gaugeGroupCenter :: GaugeGroup -> String
gaugeGroupCenter U1  = "U(1) (full group is its own center)"
gaugeGroupCenter SU2 = "Z/2"
gaugeGroupCenter SO3 = "trivial"
gaugeGroupCenter U2  = "U(1) modulo the central Z/2 image"
gaugeGroupCenter SU3 = "Z/3"

-- | Human-readable label of a gauge group, used in composition records.
labelOf :: GaugeGroup -> String
labelOf U1  = "U(1)"
labelOf SU2 = "SU(2)"
labelOf SO3 = "SO(3)"
labelOf U2  = "U(2)"
labelOf SU3 = "SU(3)"

-- | Base spaces of the paper's examples: spheres of dimension one to four,
-- and a labelled closed four-manifold for the Yang-Mills record of
-- Example 2.1.
data BaseSpace
  = Sphere Int
  | ClosedFourManifold String
  deriving (Eq, Ord, Show)

-- | A principal G-bundle system with connection and matter data
-- (paper, Definition 2.1 and Example 2.1). Fields mirror the tuple
-- P = (X, O, D, S, C) of the series schema as instantiated for gauge theory.
data PrincipalBundleSystem = PrincipalBundleSystem
  { bundleBase :: BaseSpace
    -- ^ The base X of the bundle P -> X.
  , bundleGroup :: GaugeGroup
    -- ^ The structure group G (DEF-029).
  , classifyingMapLabel :: String
    -- ^ Homotopy-class label of the classifying map X -> BG (Theorem 4.1,
    --   lean target principal_bundle_classification).
  , characteristicData :: [CharacteristicClass]
    -- ^ Characteristic classes in force (Theorem 4.1 and Proposition 4.5,
    --   lean target characteristic_classes_pullback).
  , matterWeights :: [WeightData]
    -- ^ Highest weights of finite-dimensional matter representations
    --   (Theorem 3.2, lean target highest_weight_classification).
  , bundleAnomaly :: AnomalyData
    -- ^ Anomaly record of the configuration (Section 5).
  }
  deriving (Eq, Show)

-- | The classifying invariant of a gauge system in the sense of DEF-037:
-- the Dynkin diagram of the gauge algebra together with the characteristic
-- classes of the bundle. This mirrors Table 2 of the paper.
classifyingInvariantOf
  :: PrincipalBundleSystem -> (LieDiagram, [CharacteristicClass])
classifyingInvariantOf p =
  (Dynkin (gaugeGroupDiagram (bundleGroup p)), characteristicData p)

-- | Proposition 4.3 (lean target bundle_sphere_classification): the
-- isomorphism class of a principal G-bundle over a sphere is the element of
-- pi_{n-1}(G) named by the classifying map label. The label strings are the
-- values recorded by the Phase D experiment bundle_classification.py.
sphereBundleClass :: PrincipalBundleSystem -> Maybe String
sphereBundleClass p = case bundleBase p of
  Sphere _ -> Just (classifyingMapLabel p)
  _        -> Nothing

-- | Proposition 4.5 (classical characteristic rings): the named ring of
-- universal characteristic classes for each classical group. Pure metadata
-- mirroring the statement of the proposition; no cohomology is computed here.
classicalCharacteristicRing :: GaugeGroup -> String
classicalCharacteristicRing U1  = "Z[c1]"
classicalCharacteristicRing SU2 = "Z[c2]"
classicalCharacteristicRing SO3 = "Z[p1, w2, e]"
classicalCharacteristicRing U2  = "Z[c1, c2]"
classicalCharacteristicRing SU3 = "Z[c2, c3]"

-- | Anomaly record (paper, Definitions 5.1 and 5.2). The three fields are
-- the fermionic determinant-line trivializability flag and the two
-- Chevalley-Eilenberg obstruction classes.
data AnomalyData = AnomalyData
  { determinantLineTrivializable :: Bool
    -- ^ Whether the fermionic anomaly line is trivializable (Definition 5.1).
  , ceClassH1 :: [String]
    -- ^ Generators of the class in H^1(CE(P)) (Definition 5.2).
  , ceClassH2 :: [String]
    -- ^ Generators of the class in H^2(CE(P)) (Definition 5.2).
  }
  deriving (Eq, Show)

-- | The vanishing test of Definition 5.2: the BV-BRST gauge anomaly is
-- trivial exactly when both Chevalley-Eilenberg classes vanish
-- (lean target anomaly_obstruction_vanishing).
anomalyFree :: AnomalyData -> Bool
anomalyFree a = null (ceClassH1 a) && null (ceClassH2 a)

-- | Proposition 5.3 (quantization gate): a configuration admits the
-- consistent quantization exactly when the determinant line trivializes and
-- both obstruction classes vanish. Cross-audited against the Phase D
-- experiment anomaly_cohomology.py.
quantizationGate :: AnomalyData -> Bool
quantizationGate a = determinantLineTrivializable a && anomalyFree a

-- | A two-dimensional Atiyah theory presented by its commutative Frobenius
-- algebra (paper, Theorem 6.1, lean target frobenius_correspondence). The
-- algebra is named, not computed: the Phase D experiment tqft_frobenius.py
-- carries the executable verification.
data FrobeniusSystem = FrobeniusSystem
  { frobeniusAlgebraName :: String
  , frobeniusBasisSize :: Int
  , eulerElementLabel :: String
  }
  deriving (Eq, Show)

-- | Sector data of a local net satisfying the DHR hypotheses (paper,
-- Definitions 7.1 and 7.2, Theorem 7.2). The recovered group is the
-- Doplicher-Roberts reconstruction output (lean target
-- dr_reconstruction_hypotheses); Nothing means the hypotheses are not
-- asserted for this net, not that the reconstruction fails.
data SectorSystem = SectorSystem
  { netName :: String
  , haagDualityAssumed :: Bool
  , sectorCategoryLabel :: String
  , recoveredGroup :: Maybe GaugeGroup
  }
  deriving (Eq, Show)

-- | The product construction of the paper, Section 2: a principal
-- G-bundle and a principal H-bundle over the same base give a principal
-- (G x H)-bundle with the pair of connections.
data ProductBundleSystem = ProductBundleSystem
  { productFactorLeft :: PrincipalBundleSystem
  , productFactorRight :: PrincipalBundleSystem
  , productGroupLabel :: String
  }
  deriving (Eq, Show)

-- | DEF-002 schema instance for principal bundle systems.
instance PhysicalSystem PrincipalBundleSystem where
  type StateSpace PrincipalBundleSystem = BaseSpace
  type Observables PrincipalBundleSystem = [String]
  type Dynamics PrincipalBundleSystem = String
  type Symmetries PrincipalBundleSystem = GaugeGroup
  type Composition PrincipalBundleSystem = [Construction]

  stateSpace = bundleBase
  observables _ = ["Wilson loops on the base", "curvature polynomials"]
  dynamics _ = "Yang-Mills functional on connections modulo gauge"
  symmetries = bundleGroup
  composition _ = [Quotient GaugeQuotient, Extension FieldTheoreticExtension]

-- | DEF-029 (Family IV) instance: the bundle and connection data of the
-- system are its structure group and characteristic classes.
instance FamilyPrincipalBundlesConnections PrincipalBundleSystem where
  type BundleConnectionData PrincipalBundleSystem =
    (GaugeGroup, [CharacteristicClass])
  bundleConnectionData p = (bundleGroup p, characteristicData p)

-- | DEF-031 (Family VI) instance for two-dimensional topological theories.
instance FamilyTopologicalHigherCategorical FrobeniusSystem where
  type HigherCategoricalData FrobeniusSystem = (String, Int)
  higherCategoricalData f = (frobeniusAlgebraName f, frobeniusBasisSize f)

-- | DEF-033 (Family VIII) instance for sector categories of local nets.
instance FamilyTensorCategoriesComposition SectorSystem where
  type TensorCategoryData SectorSystem = String
  tensorCategoryData = sectorCategoryLabel

-- | DEF-023 construction hooks for gauge systems. The product construction
-- is the pair-of-bundles construction of Section 2; the quotient hook
-- records the gauge quotient. Hooks that this volume does not supply return
-- Nothing, which is not a claim that no construction exists.
instance Constructible PrincipalBundleSystem where
  type Composite PrincipalBundleSystem = ProductBundleSystem

  tensorProduct p q
    | bundleBase p == bundleBase q =
        Just (ProductBundleSystem p q
                (labelOf (bundleGroup p) ++ " x " ++ labelOf (bundleGroup q)))
    | otherwise = Nothing

  directSum _ _ = Nothing
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ p = Just p

-- | Example 4.3 of the paper (instantons over the four-sphere) as a value.
exampleInstantons :: PrincipalBundleSystem
exampleInstantons = PrincipalBundleSystem
  { bundleBase = Sphere 4
  , bundleGroup = SU2
  , classifyingMapLabel = "instanton number 1 (c2 = 1)"
  , characteristicData = [Chern]
  , matterWeights = [WeightData [1] (CasimirData [3 / 4])]
  , bundleAnomaly = AnomalyData True [] []
  }

-- | Example 5.2 of the paper (two-dimensional non-abelian obstruction) as
-- an anomaly record: H^1 is nonzero, so the quantization gate fails.
exampleAbelianObstruction :: AnomalyData
exampleAbelianObstruction = AnomalyData True ["e^1 class in H^1"] []

-- | Cross-audit summary: every classification method of this module called
-- on the paper's example values. The output is a plain report used as
-- computational evidence in the code evidence appendix of the paper.
crossAudit :: String
crossAudit = unlines
  [ "cross-audit of vol-07 gauge instances (computational evidence only)"
  , "dynkin diagram of SU(2): " ++ show (gaugeGroupDiagram SU2)
  , "center of SU(2): " ++ gaugeGroupCenter SU2
  , "center of SO(3): " ++ gaugeGroupCenter SO3
  , "classifying invariant of Example 4.3: " ++ show (classifyingInvariantOf exampleInstantons)
  , "sphere bundle class of Example 4.3: " ++ show (sphereBundleClass exampleInstantons)
  , "characteristic ring of SO(3): " ++ classicalCharacteristicRing SO3
  , "quantization gate of Example 4.3: " ++ show (quantizationGate (bundleAnomaly exampleInstantons))
  , "quantization gate of Example 5.2: " ++ show (quantizationGate exampleAbelianObstruction)
  ]
{-# LANGUAGE TypeFamilies #-}

-- | Module        : Vol08SpacetimeReconstruction.Instances
-- Description     : Taxonomy instances for the physical systems of the
--                   volume "Classification and Reconstruction of Spacetime"
--                   (vol-08-spacetime-reconstruction).
-- Copyright       : (c) Matthew Long, 2026
-- License         : MIT
-- Maintainer      : matthew@yonedaai.com
--
-- The shared family classes live in "Taxonomy.Families",
-- "Taxonomy.Invariants", "Taxonomy.Constructions" and "Taxonomy.Equivalences"
-- and are imported, never redefined. This module declares the instance heads
-- for the volume's systems: Lorentzian spacetimes with holonomy and causal
-- data, holographic entropy vectors, and Thurston geometry types. Type and
-- method names mirror the paper's definitions and the mechanization targets
-- recorded in verification/vol-08-spacetime-reconstruction-lean-targets.md.
--
-- Claim status (docs/theorem-registry.md): this module is executable
-- modeling evidence. It is NOT verified by Lean and no proof assistant has
-- checked it. The honest statement is that the executable models are
-- validated against the informal specifications in the paper.
module Vol08SpacetimeReconstruction.Instances
  ( -- * Lorentzian systems (paper Definition 2.1)
    LorentzianSpacetime (..)
  , LorentzianMetricData (..)
  , LorentzianHolonomyType (..)
  , CausalRung (..)
  , toCausalClass
    -- * Thurston systems (paper Theorem 5.1)
  , ThurstonGeometry3 (..)
  , thurstonGeometries
    -- * Entropy-vector systems (paper Definition 2.4)
  , HolographicEntropyVector (..)
  , witnessCorrelatedTriple
  , satisfiesSSA
  , satisfiesMMI
  , mmiIndependentOfSSA
    -- * Component data of the shared schema (DEF-002)
  , EventManifold (..)
  , SmoothObservables (..)
  , DynamicsData (..)
  , IsometryData (..)
  , CompositionRules (..)
  , RegionLabels (..)
  , NoDynamics (..)
  , RegionPermutation (..)
  ) where

import Data.Bits ((.&.), (.|.))

import Taxonomy.Equivalences (MathematicalEquivalence (..))
import Taxonomy.Families
  ( FamilyProbabilityMeasure (..)
  , FamilySmoothGeometric (..)
  , PhysicalSystem (..)
  )
import Taxonomy.Invariants (CausalClass (..))

-- | DEF-003 component: the event manifold of a Lorentzian system, recorded
-- by its dimension (paper Definition 2.1).
newtype EventManifold = EventManifold Int
  deriving (Eq, Show)

-- | DEF-004 component: the observable algebra of the system, recorded by its
-- standard presentation. For Lorentzian systems this is the smooth function
-- algebra of the event manifold.
newtype SmoothObservables = SmoothObservables String
  deriving (Eq, Show)

-- | DEF-005 component: dynamical data. Geodesic flow is the default dynamics
-- of a Lorentzian system; fixed-geometry is the static reading in which the
-- metric itself is the datum under study.
data DynamicsData = GeodesicFlow | FixedGeometry
  deriving (Eq, Show)

-- | DEF-006 component: symmetry data, recorded by the isometry class label of
-- the metric (paper Proposition 3.2 and Definition 2.1).
newtype IsometryData = IsometryData String
  deriving (Eq, Show)

-- | DEF-007 component: composition rules for Lorentzian systems.
data CompositionRules = ProductGluing | DisjointUnion | BoundaryGluing
  deriving (Eq, Show)

-- | Paper Definition 2.3 and the holonomy classification (paper Theorem 3.1):
-- the coarse strata of connected Lorentzian holonomy types. The entry-by-entry
-- table with realizing metrics lives in the cited survey; the constructors
-- mirror the strata of the paper's table.
data LorentzianHolonomyType
  = GenericHolonomy
    -- ^ Full group SO(1,n-1) up: the generic indecomposable case.
  | SpecialHolonomy
    -- ^ Prolongation-algebra entries, realized by plane-wave type metrics.
  | SymmetricHolonomy
    -- ^ Isotropy of a locally symmetric space.
  | DecomposableHolonomy
    -- ^ Product holonomy, by the product rule of paper Proposition 3.2.
  deriving (Eq, Show)

-- | Paper Definition 2.2: the eight rungs of the causal ladder. The shared
-- taxonomy records six coarse rungs in 'CausalClass'; this type mirrors the
-- paper's full ladder including causal continuity and causal simplicity.
data CausalRung
  = RungChronological
  | RungCausal
  | RungDistinguishing
  | RungStrongCausality
  | RungStableCausality
  | RungCausalContinuity
  | RungCausalSimplicity
  | RungGlobalHyperbolicity
  deriving (Eq, Ord, Show, Enum, Bounded)

-- | Bridge from the paper's eight rungs to the shared coarse 'CausalClass'
-- vocabulary. Causal continuity and causal simplicity have no dedicated
-- shared constructor and map to their nearest coarse rung.
toCausalClass :: CausalRung -> Maybe CausalClass
toCausalClass RungChronological = Just Chronological
toCausalClass RungCausal = Just Causal
toCausalClass RungDistinguishing = Just Distinguishing
toCausalClass RungStrongCausality = Just StrongCausality
toCausalClass RungStableCausality = Just StableCausality
toCausalClass RungCausalContinuity = Nothing
toCausalClass RungCausalSimplicity = Nothing
toCausalClass RungGlobalHyperbolicity = Just GlobalHyperbolicity

-- | The metric-level data of a Lorentzian system: signature, holonomy type,
-- causal rung, and the two class labels used by the paper's separation of
-- conformal class and isometry class (paper Corollary 4.2 of the
-- reconstruction section).
data LorentzianMetricData = LorentzianMetricData
  { metricSignature :: (Int, Int)
    -- ^ Signature (1, n-1).
  , metricHolonomyType :: LorentzianHolonomyType
    -- ^ Coarse holonomy stratum (paper Theorem 3.1).
  , metricCausalRung :: CausalRung
    -- ^ Rung of the causal ladder attained (paper Theorem 4.1).
  , metricConformalClass :: String
    -- ^ Label of the conformal class, the datum fixed by the chronological
    -- order (paper causal reconstruction theorem).
  , metricIsometryClass :: String
    -- ^ Label of the isometry class, which the chronological order does not
    -- fix (paper conformal-factor corollary).
  }
  deriving (Eq, Show)

-- | Paper Definition 2.1: a Lorentzian spacetime system.
data LorentzianSpacetime = LorentzianSpacetime
  { spacetimeDimension :: Int
    -- ^ n = dim M, with n >= 2.
  , spacetimeTimeOrientable :: Bool
    -- ^ Time-orientability hypothesis.
  , spacetimeMetricData :: LorentzianMetricData
    -- ^ Metric-level data.
  , spacetimeIsometryLabel :: String
    -- ^ Opaque isometry-class label, shared with 'metricIsometryClass'.
  }
  deriving (Eq, Show)

instance PhysicalSystem LorentzianSpacetime where
  type StateSpace LorentzianSpacetime = EventManifold
  type Observables LorentzianSpacetime = SmoothObservables
  type Dynamics LorentzianSpacetime = DynamicsData
  type Symmetries LorentzianSpacetime = IsometryData
  type Composition LorentzianSpacetime = CompositionRules
  stateSpace = EventManifold . spacetimeDimension
  observables _ = SmoothObservables "C^infty(M)"
  dynamics _ = GeodesicFlow
  symmetries = IsometryData . spacetimeIsometryLabel
  composition _ = ProductGluing

instance FamilySmoothGeometric LorentzianSpacetime where
  type GeometricData LorentzianSpacetime = LorentzianMetricData
  geometricData = spacetimeMetricData

-- | Mathematical equivalence for Lorentzian systems: isometry of the tuples,
-- recorded here as equality of the isometry-class label. The physical
-- equivalence of DEF-015 is deliberately left un-instanced: its choice is
-- open, and the volume states each equivalence where it is used.
instance MathematicalEquivalence LorentzianSpacetime where
  mathematicallyEquivalent a b =
    spacetimeIsometryLabel a == spacetimeIsometryLabel b

-- | Paper Theorem 5.1: the eight Thurston model geometries of dimension
-- three. The constructors mirror the rows of the paper's geometries table.
data ThurstonGeometry3
  = Euclidean3
  | Spherical3
  | Hyperbolic3
  | SphericalTimesLine
  | HyperbolicTimesLine
  | NilGeometry
  | SolGeometry
  | SL2RTildeGeometry
  deriving (Eq, Ord, Show, Enum, Bounded)

-- | The complete list of Thurston geometries in dimension three (paper
-- Theorem 5.1): exactly eight entries.
thurstonGeometries :: [ThurstonGeometry3]
thurstonGeometries = [minBound .. maxBound]

instance FamilySmoothGeometric ThurstonGeometry3 where
  type GeometricData ThurstonGeometry3 = ThurstonGeometry3
  geometricData = id

-- | DEF-003/DEF-004 components of an entropy-vector system: the boundary
-- region labels and the region algebra labels.
newtype RegionLabels = RegionLabels [String]
  deriving (Eq, Show)

-- | DEF-005 component: entropy-vector systems carry no time evolution.
data NoDynamics = NoDynamics
  deriving (Eq, Show)

-- | DEF-006 component: permutations of the boundary regions.
newtype RegionPermutation = RegionPermutation [Int]
  deriving (Eq, Show)

-- | Paper Definition 2.4: an entropy vector on n boundary regions, stored as
-- (subset bitmask, entropy) pairs with bit i labelling region i. Missing
-- subsets carry entropy zero by convention.
newtype HolographicEntropyVector = HolographicEntropyVector [(Int, Rational)]
  deriving (Eq, Show)

-- | Entropy of a subset mask, defaulting to zero.
entropyOfMask :: HolographicEntropyVector -> Int -> Rational
entropyOfMask (HolographicEntropyVector entries) mask =
  case lookup mask entries of
    Just e -> e
    Nothing -> 0

instance PhysicalSystem HolographicEntropyVector where
  type StateSpace HolographicEntropyVector = RegionLabels
  type Observables HolographicEntropyVector = RegionLabels
  type Dynamics HolographicEntropyVector = NoDynamics
  type Symmetries HolographicEntropyVector = RegionPermutation
  type Composition HolographicEntropyVector = CompositionRules
  stateSpace (HolographicEntropyVector _) = RegionLabels ["A", "B", "C"]
  observables = stateSpace
  dynamics _ = NoDynamics
  symmetries _ = RegionPermutation [0, 1, 2]
  composition _ = DisjointUnion

instance FamilyProbabilityMeasure HolographicEntropyVector where
  type ProbabilityMeasureData HolographicEntropyVector = HolographicEntropyVector
  probabilityMeasureData = id

-- | Paper Proposition 6.2 (mechanization target mmi_independent_of_ssa): the
-- entropy vector of the perfectly correlated triple A = B = C = X with X a
-- uniform bit. Every subset has entropy one.
witnessCorrelatedTriple :: HolographicEntropyVector
witnessCorrelatedTriple =
  HolographicEntropyVector [(m, 1) | m <- [1 .. 7]]

-- | Strong subadditivity S(U) + S(V) >= S(U u V) + S(U n V) on all subset
-- pairs (paper Definition 2.4, equation for strong subadditivity).
satisfiesSSA :: HolographicEntropyVector -> Bool
satisfiesSSA v =
  and [ entropyOfMask v u + entropyOfMask v w
          >= entropyOfMask v (u .|. w) + entropyOfMask v (u .&. w)
      | u <- [0 .. 7 :: Int]
      , w <- [0 .. 7]
      ]

-- | Monogamy of mutual information S(A)+S(B)+S(C)+S(ABC) <= S(AB)+S(AC)+S(BC)
-- (paper Definition 2.4, the monogamy equation).
satisfiesMMI :: HolographicEntropyVector -> Bool
satisfiesMMI v =
  entropyOfMask v a + entropyOfMask v b + entropyOfMask v c
      + entropyOfMask v abc
    <= entropyOfMask v ab + entropyOfMask v ac + entropyOfMask v bc
  where
    a = 1
    b = 2
    c = 4
    ab = a .|. b
    ac = a .|. c
    bc = b .|. c
    abc = a .|. b .|. c

-- | Computational probe of paper Proposition 6.2: the witness satisfies
-- strong subadditivity and violates monogamy. Evidence only; not a proof.
mmiIndependentOfSSA :: Bool
mmiIndependentOfSSA =
  satisfiesSSA witnessCorrelatedTriple
    && not (satisfiesMMI witnessCorrelatedTriple)

exec
/usr/local/bin/zsh -lc 'cat src/vol-09-gravity-information-geometry/Instances.hs src/vol-10-observational-equivalence/Instances.hs' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
{-# LANGUAGE TypeFamilies #-}

-- | Module        : Vol09GravityInformationGeometry.Instances
-- Description     : Taxonomy instances for the physical systems of
--                   vol-09-gravity-information-geometry (Gravity, Information,
--                   and Geometric Correspondence).
-- Paper source    : papers/latex/vol-09-gravity-information-geometry.tex
-- Taxonomy source : src/Taxonomy/ (imported classes, never redefined).
--
-- Declares instances of the shared taxonomy classes for this volume's
-- systems: classical statistical models (Fisher geometry), quantum state
-- systems (Petz monotone metrics), entanglement-wedge data, thermodynamic
-- systems (Ruppeiner geometry), and weighted-nerve models. Type and method
-- names mirror the paper's definitions and the mechanization targets in
-- verification/vol-09-gravity-information-geometry-lean-targets.md.
--
-- Claim status (docs/theorem-registry.md): this module is executable
-- vocabulary validated against the paper's statements. It is computational
-- evidence only. It is NOT machine-checked and is never 'verified by Lean';
-- the honest statement is 'executable models validated against kernel-checked
-- specifications' once the Lean layer exists.
module Vol09GravityInformationGeometry.Instances
  ( -- * Systems of the paper
    ClassicalStatisticalModel (..)
  , QuantumStateSystem (..)
  , EntanglementWedgeSystem (..)
  , ThermodynamicGeometrySystem (..)
  , WeightedNerveModel (..)
    -- * Metric data mirroring the paper's definitions
  , FisherMetricData (..)
  , PetzMetricData (..)
  , RuppeinerMetricData (..)
  , EntropyWedgeData (..)
    -- * Invariant record shape (DEF-036)
  , quantumInvariantRecord
  ) where

import Taxonomy.Families
  ( PhysicalSystem (..)
  , FamilyProbabilityMeasure (..)
  , FamilyHilbertOperatorAlgebras (..)
  , FamilySmoothGeometric (..)
  , FamilyTensorCategoriesComposition (..)
  , FamilyDiscreteCombinatorial (..)
  )
import Taxonomy.Invariants (InvariantRecord (..))
import Taxonomy.Constructions (Decomposable (..), Decomposition (..), Construction (..))

-- | Fisher metric data of a classical statistical model (paper, Definition
-- 'Fisher metric'). The sample size and the probability vector are recorded
-- as plain data; no metric is computed here.
data FisherMetricData = FisherMetricData
  { sampleSize :: Int
    -- ^ n = |Omega| of Definition 'Statistical model'.
  , probabilityVector :: [Double]
    -- ^ Interior point p of the simplex.
  }
  deriving (Eq, Show)

-- | Petz monotone metric data of a quantum state system (paper, Definition
-- 'Operator monotone function and the Petz family'). The tag names which
-- normalized operator monotone function is in force; the family is
-- parametric and the choice is load-bearing (paper, Proposition
-- 'Non-uniqueness on qubit states').
data PetzMetricData
  = SymmetricLogarithmicDerivative
    -- ^ f(t) = (1+t)/2; lean target petz_metric_sld.
  | WignerYanase
    -- ^ f(t) = (1/4)(1 + sqrt t)^2; lean target petz_metric_wy.
  | FidelityNormalization
    -- ^ Fidelity metric, one quarter of the SLD metric on qubits; lean
    -- target bures_qubit_round_sphere.
  deriving (Eq, Ord, Show)

-- | Ruppeiner metric data of a thermodynamic system (paper, Definition
-- 'Ruppeiner metric'). The equation of state is recorded as plain data.
data RuppeinerMetricData = RuppeinerMetricData
  { entropyFunction :: String
    -- ^ Name of the entropy function in force (ideal gas or van der Waals).
  , extensiveCoordinates :: [String]
    -- ^ Names of the extensive variables, e.g. ["U", "V"].
  }
  deriving (Eq, Show)

-- | Entanglement wedge data (paper, Definition 'Entanglement wedge'). The
-- region list and wedge assignment are plain data; nothing is derived here.
data EntropyWedgeData = EntropyWedgeData
  { boundaryRegions :: [String]
    -- ^ Boundary region labels A, B, C, ...
  , wedgeAssignments :: [(String, String)]
    -- ^ Pairs (region, bulk operator label) localized in the wedge.
  , regionCount :: Int
    -- ^ Number of boundary regions; the proved entropy-cone range is <= 5.
  }
  deriving (Eq, Show)

-- | A classical statistical model: state space is a finite probability
-- simplex, observables are functions on the sample space, dynamics and
-- symmetry data are recorded as the model declares them.
data ClassicalStatisticalModel = ClassicalStatisticalModel
  { statisticalModelName :: String
  , statisticalData :: FisherMetricData
  }
  deriving (Eq, Show)

-- | A quantum state system: states are density operators on C^d, observables
-- are the matrix algebra, and the monotone metric in force is named by a
-- 'PetzMetricData' tag (the choice cannot be suppressed: quantum monotone
-- metrics are parametric).
data QuantumStateSystem = QuantumStateSystem
  { quantumDimension :: Int
  , monotoneMetricTag :: PetzMetricData
  }
  deriving (Eq, Show)

-- | Entanglement-wedge system: boundary subregion structure together with
-- the entropy-cone range in force (at most 5 regions is the proved range of
-- the paper's Theorem 'Holographic entropy cone').
data EntanglementWedgeSystem = EntanglementWedgeSystem
  { wedgeName :: String
  , wedgeData :: EntropyWedgeData
  }
  deriving (Eq, Show)

-- | Thermodynamic geometry system: an equilibrium manifold with a Ruppeiner
-- metric. Ideal gas instances are flat (paper, Proposition 'Ideal gas');
-- interacting instances are not.
data ThermodynamicGeometrySystem = ThermodynamicGeometrySystem
  { thermoName :: String
  , thermoData :: RuppeinerMetricData
  }
  deriving (Eq, Show)

-- | Weighted-nerve model: finite combinatorial data proposed to converge to
-- a continuum geometry. The convergence condition is a hypothesis of this
-- volume, not an established fact; the Boolean records whether a convergence
-- claim is attached.
data WeightedNerveModel = WeightedNerveModel
  { nerveName :: String
  , groupoidObjects :: Int
  , continuumConvergenceClaimed :: Bool
    -- ^ Always False in honest instances: convergence is not established.
  }
  deriving (Eq, Show)

-- | Family V instance: classical statistical models carry probability and
-- measure structure (DEF-030).
instance FamilyProbabilityMeasure ClassicalStatisticalModel where
  type ProbabilityMeasureData ClassicalStatisticalModel = FisherMetricData
  probabilityMeasureData = statisticalData

-- | Family V instance: quantum state systems carry measure structure through
-- their monotone metrics (DEF-030).
instance FamilyProbabilityMeasure QuantumStateSystem where
  type ProbabilityMeasureData QuantumStateSystem = PetzMetricData
  probabilityMeasureData = monotoneMetricTag

-- | Family II instance: quantum state systems are operator-algebraic
-- (DEF-027).
instance FamilyHilbertOperatorAlgebras QuantumStateSystem where
  type OperatorAlgebraData QuantumStateSystem = Int
  operatorAlgebraData = quantumDimension

-- | Family II instance: entanglement wedges live over boundary operator
-- algebras (DEF-027).
instance FamilyHilbertOperatorAlgebras EntanglementWedgeSystem where
  type OperatorAlgebraData EntanglementWedgeSystem = EntropyWedgeData
  operatorAlgebraData = wedgeData

-- | Family VIII instance: entanglement data is compositional structure
-- (DEF-033).
instance FamilyTensorCategoriesComposition EntanglementWedgeSystem where
  type TensorCategoryData EntanglementWedgeSystem = [String]
  tensorCategoryData = boundaryRegions . wedgeData

-- | Family V instance: thermodynamic equilibrium manifolds carry measure
-- structure through fluctuation theory (DEF-030).
instance FamilyProbabilityMeasure ThermodynamicGeometrySystem where
  type ProbabilityMeasureData ThermodynamicGeometrySystem = RuppeinerMetricData
  probabilityMeasureData = thermoData

-- | Family III instance: thermodynamic systems carry smooth geometric
-- structure (DEF-028), the Ruppeiner metric.
instance FamilySmoothGeometric ThermodynamicGeometrySystem where
  type GeometricData ThermodynamicGeometrySystem = RuppeinerMetricData
  geometricData = thermoData

-- | Family IX instance: weighted-nerve models are discrete combinatorial
-- data (DEF-034).
instance FamilyDiscreteCombinatorial WeightedNerveModel where
  type CombinatorialData WeightedNerveModel = (Int, Bool)
  combinatorialData m = (groupoidObjects m, continuumConvergenceClaimed m)

-- | Family III instance: weighted-nerve models propose a smooth geometry
-- (DEF-028) only through an unestablished continuum limit.
instance FamilySmoothGeometric WeightedNerveModel where
  type GeometricData WeightedNerveModel = String
  geometricData = nerveName

-- | DEF-002 instance: the classical statistical model as an object of the
-- schema P = (X, O, D, S, C). Dynamics and symmetries are the trivial ones
-- declared here; the instance records shape, not content.
instance PhysicalSystem ClassicalStatisticalModel where
  type StateSpace ClassicalStatisticalModel = FisherMetricData
  type Observables ClassicalStatisticalModel = [String]
  type Dynamics ClassicalStatisticalModel = ()
  type Symmetries ClassicalStatisticalModel = [String]
  type Composition ClassicalStatisticalModel = ()
  stateSpace = statisticalData
  observables _ = ["functions on Omega"]
  dynamics _ = ()
  symmetries _ = ["permutations of outcomes"]
  composition _ = ()

-- | DEF-002 instance: the quantum state system.
instance PhysicalSystem QuantumStateSystem where
  type StateSpace QuantumStateSystem = Int
  type Observables QuantumStateSystem = String
  type Dynamics QuantumStateSystem = ()
  type Symmetries QuantumStateSystem = String
  type Composition QuantumStateSystem = ()
  stateSpace = quantumDimension
  observables _ = "matrix algebra M_d(C)"
  dynamics _ = ()
  symmetries _ = "unitary group U(d)"
  composition _ = ()

-- | DEF-002 instance: the entanglement-wedge system.
instance PhysicalSystem EntanglementWedgeSystem where
  type StateSpace EntanglementWedgeSystem = EntropyWedgeData
  type Observables EntanglementWedgeSystem = [(String, String)]
  type Dynamics EntanglementWedgeSystem = ()
  type Symmetries EntanglementWedgeSystem = [String]
  type Composition EntanglementWedgeSystem = [String]
  stateSpace = wedgeData
  observables = wedgeAssignments . wedgeData
  dynamics _ = ()
  symmetries = boundaryRegions . wedgeData
  composition = boundaryRegions . wedgeData

-- | DEF-002 instance: the thermodynamic geometry system.
instance PhysicalSystem ThermodynamicGeometrySystem where
  type StateSpace ThermodynamicGeometrySystem = RuppeinerMetricData
  type Observables ThermodynamicGeometrySystem = [String]
  type Dynamics ThermodynamicGeometrySystem = ()
  type Symmetries ThermodynamicGeometrySystem = [String]
  type Composition ThermodynamicGeometrySystem = ()
  stateSpace = thermoData
  observables _ = ["equilibrium observables"]
  dynamics _ = ()
  symmetries _ = []
  composition _ = ()

-- | DEF-002 instance: the weighted-nerve model. Composition is the monoidal
-- product of the underlying combinatorial data.
instance PhysicalSystem WeightedNerveModel where
  type StateSpace WeightedNerveModel = Int
  type Observables WeightedNerveModel = String
  type Dynamics WeightedNerveModel = ()
  type Symmetries WeightedNerveModel = String
  type Composition WeightedNerveModel = String
  stateSpace = groupoidObjects
  observables _ = "nerve functions"
  dynamics _ = ()
  symmetries _ = "groupoid automorphisms"
  composition _ = "tensor product of nerves"

-- | DEF-022 instance: a classical statistical model decomposes over the
-- outcomes of Omega when the composition rule is direct sum of the outcome
-- branches. Uniqueness of decomposition is not claimed (paper, Section 2).
instance Decomposable ClassicalStatisticalModel where
  decomposition m =
    Just Decomposition
      { decompositionConstruction = DirectSum
      , irreducibleFactors = [m]
      }

-- | A model does not supply a decomposition of its entanglement wedge data
-- here; Nothing records that none is supplied, not that none exists.
instance Decomposable EntanglementWedgeSystem where
  decomposition _ = Nothing

-- | Invariant record shape for a quantum state system (DEF-036). The fields
-- carry the classification data the paper discusses: the Petz family member
-- as state-side invariant data. No classification is computed.
quantumInvariantRecord :: QuantumStateSystem -> InvariantRecord PetzMetricData Int () String Int
quantumInvariantRecord q =
  InvariantRecord
    { stateInvariants = monotoneMetricTag q
    , observableInvariants = quantumDimension q
    , dynamicsInvariants = ()
    , symmetryInvariants = "U(d)"
    , representationInvariants = quantumDimension q
    }
{-# LANGUAGE TypeFamilies #-}

-- | Module        : Vol10ObservationalEquivalence.Instances
-- Description     : Per-volume taxonomy instances for vol-10-observational-equivalence
--                   (Observational Equivalence and Physical Distinguishability).
-- Paper source    : papers/latex/vol-10-observational-equivalence.tex
-- Lean targets    : verification/vol-10-observational-equivalence-lean-targets.md
--
-- Declares instances of the shared taxonomy classes (Taxonomy.Families,
-- Taxonomy.Equivalences) for the physical systems this volume uses: finite
-- classical observation theories with experiment partitions, finite quantum
-- systems carrying monotone-metric direction data, observation records and
-- the indistinguishability they induce, and the isocategorical witness of the
-- Etingof-Gelaki constraint. Type and method names mirror the paper's
-- definitions and the lean targets.
--
-- Claim status (docs/theorem-registry.md): this module is an executable
-- taxonomy layer. It encodes definitions and computes finite examples as
-- computational evidence. It proves nothing and is not verified by any proof
-- assistant; the honest statement is that executable models are validated
-- against kernel-checked specifications by cross-audit (lean/Cmrps/).
module Vol10ObservationalEquivalence.Instances
  ( -- * Observation records and finite classical systems (paper Definition 4.1)
    Experiment (..)
  , ObservationRecord (..)
  , FiniteClassicalSystem (..)
  , observationOf
  , observationallyEquivalent
    -- * Coarse and fine observations (paper Proposition 4.5)
  , CoarseMap (..)
  , coarseObservationFactor
    -- * Finite quantum systems and monotone metrics (paper Section 5)
  , FiniteQuantumSystem (..)
  , monotoneQuadraticForm
  , commutativeRestrictionCheck
    -- * Isocategorical witness (paper Theorem 3.1 and Corollary 3.2)
  , IsocategoricalWitness (..)
  , preservedLayersOf
  ) where

import Taxonomy.Families
import Taxonomy.Equivalences

-- | Paper Definition 4.1: an experiment on a finite microstate set is a
-- partition of the microstate indices into outcome blocks. The outcome
-- distribution of an experiment on a probability vector is the list of block
-- masses.
newtype Experiment = Experiment { outcomeBlocks :: [[Int]] }
  deriving (Eq, Ord, Show)

-- | Paper Definition 4.1: an observation record packages the outcome
-- distributions of the admissible experiments. Two records are isomorphic in
-- the record category exactly when the encoded lists agree, which is equality
-- on this encoding.
data ObservationRecord = ObservationRecord
  { recordExperiments :: [Experiment]
    -- ^ The admissible experiment family.
  , recordOutcomes :: [[Rational]]
    -- ^ Outcome distribution per experiment, in the order of the family.
  }
  deriving (Eq, Ord, Show)

-- | A finite classical system: a probability vector on a finite microstate
-- set, together with its experiment family (paper, worked example 9.1).
data FiniteClassicalSystem = FiniteClassicalSystem
  { classicalProbabilities :: [Rational]
    -- ^ Probability vector on the microstate set.
  , classicalExperiments :: [Experiment]
    -- ^ The admissible experiment family.
  }
  deriving (Eq, Show)

-- | Paper Definition 2.1: the system record schema of a finite classical
-- system. State space is the probability vector, observables are the
-- experiment family, dynamics and symmetry data are trivial in this toy
-- model, and composition multiplies independent copies pointwise.
instance PhysicalSystem FiniteClassicalSystem where
  type StateSpace FiniteClassicalSystem = [Rational]
  type Observables FiniteClassicalSystem = [Experiment]
  type Dynamics FiniteClassicalSystem = ()
  type Symmetries FiniteClassicalSystem = ()
  type Composition FiniteClassicalSystem = ([Rational], [Rational]) -> [Rational]
  stateSpace = classicalProbabilities
  observables = classicalExperiments
  dynamics _ = ()
  symmetries _ = ()
  composition _ = uncurry (zipWith (*))

-- | DEF-030 (Family V: probability and measure-theoretic structures): the
-- classical statistical data of the system is its probability vector. The
-- Fisher metric of Chentsov (T-BG-14) is the unique monotone metric on this
-- data up to constant; the instance records the data, not the metric.
instance FamilyProbabilityMeasure FiniteClassicalSystem where
  type ProbabilityMeasureData FiniteClassicalSystem = [Rational]
  probabilityMeasureData = classicalProbabilities

-- | Paper Definition 4.1: compute the observation record of a classical
-- system by pushing the probability vector through each experiment: the
-- outcome distribution of a block is the sum of the masses of its
-- microstates.
observationOf :: FiniteClassicalSystem -> ObservationRecord
observationOf sys =
  ObservationRecord
    { recordExperiments = classicalExperiments sys
    , recordOutcomes = map pushforward (classicalExperiments sys)
    }
  where
    probs = classicalProbabilities sys
    pushforward (Experiment blocks) =
      [sum [probs !! i | i <- block] | block <- blocks]

-- | Paper Proposition 4.2 (lean target obs_induced_equivalence):
-- observational indistinguishability, the relation induced by the observation
-- functor. On this encoding it is equality of records.
observationallyEquivalent :: ObservationRecord -> ObservationRecord -> Bool
observationallyEquivalent = (==)

-- | Records are the objects of the record category; mathematical equivalence
-- on records is isomorphism of the encoded data (DEF-016 at record level).
instance MathematicalEquivalence ObservationRecord where
  mathematicallyEquivalent = (==)

-- | Paper Proposition 4.2: physical equivalence on records, in this model,
-- is the indistinguishability relation of the record (DEF-015, instantiated).
-- The relation must be stated, not assumed (Taxonomy.Equivalences).
instance PhysicalEquivalence ObservationRecord where
  physicallyEquivalent = observationallyEquivalent

-- | Paper Definition 4.4: a coarse map on observation records forgets the
-- experiments in a drop list. The coarse record functor is this map applied
-- to fine records.
newtype CoarseMap = CoarseMap [Experiment]
  deriving (Eq, Show)

-- | Paper Proposition 4.5 (lean target obs_coarse_graining_composition):
-- coarse records separate less than fine ones. The map drops the listed
-- experiments; two fine records equal after dropping are the strictness
-- witness of the paper's worked example.
coarseObservationFactor :: CoarseMap -> ObservationRecord -> ObservationRecord
coarseObservationFactor (CoarseMap dropList) rec =
  ObservationRecord
    { recordExperiments = kept
    , recordOutcomes = keptOutcomes
    }
  where
    keptPairs =
      [ (e, o)
      | (e, o) <- zip (recordExperiments rec) (recordOutcomes rec)
      , e `notElem` dropList
      ]
    kept = map fst keptPairs
    keptOutcomes = map snd keptPairs

-- | A finite quantum system: a faithful density operator given by its
-- eigenvalues, and a self-adjoint direction given by its matrix entries
-- (paper Example 5.4 and Section 9.2).
data FiniteQuantumSystem = FiniteQuantumSystem
  { quantumEigenvalues :: [Rational]
    -- ^ Eigenvalues of the faithful density operator.
  , quantumDirection :: [[Rational]]
    -- ^ Matrix entries of the self-adjoint direction A.
  }
  deriving (Eq, Show)

-- | DEF-027 (Family II: Hilbert spaces and operator algebras): the
-- operator-algebra data of the system is the pair (eigenvalues, direction).
instance FamilyHilbertOperatorAlgebras FiniteQuantumSystem where
  type OperatorAlgebraData FiniteQuantumSystem = ([Rational], [[Rational]])
  operatorAlgebraData sys = (quantumEigenvalues sys, quantumDirection sys)

-- | DEF-030 quantum side: the monotone-metric data of the system is the
-- state and direction on which the Morozova-Chentsov form of a chosen
-- operator monotone function evaluates (T-BG-18, parametric; classical
-- uniqueness may not be extended, DEP-008). The metric itself is abstract
-- in the shared taxonomy and is not computed as a value here.
instance FamilyProbabilityMeasure FiniteQuantumSystem where
  type ProbabilityMeasureData FiniteQuantumSystem = ([Rational], [[Rational]])
  probabilityMeasureData = operatorAlgebraData

-- | Paper Section 5 (lean target monotone_not_canonical): the
-- Morozova-Chentsov quadratic form
--   g_f(rho, A) = sum_{i,j} |A_ij|^2 / (lambda_j * f(lambda_i / lambda_j))
-- for an operator monotone f normalized by f(1) = 1. Rational arithmetic on
-- the explicit data of Example 5.4; computational evidence only.
monotoneQuadraticForm
  :: (Rational -> Rational)
  -> [Rational]
  -> [[Rational]]
  -> Rational
monotoneQuadraticForm f lams rows =
  sum
    [ (rows !! i !! j) * (rows !! i !! j)
        / ((lams !! j) * f ((lams !! i) / (lams !! j)))
    | i <- [0 .. n - 1]
    , j <- [0 .. n - 1]
    ]
  where
    n = length lams

-- | Paper Proposition 5.3 (lean target monotone_commutative_restriction):
-- on a diagonal direction every normalized monotone metric gives the
-- classical Fisher form sum_i a_ii^2 / lambda_i. Returns True when the
-- computed form matches that closed expression for the given f.
commutativeRestrictionCheck
  :: (Rational -> Rational)
  -> [Rational]
  -> [[Rational]]
  -> Bool
commutativeRestrictionCheck f lams rows =
  monotoneQuadraticForm f lams rows == classical
  where
    classical =
      sum [((rows !! i !! i) * (rows !! i !! i)) / (lams !! i) | i <- [0 .. length lams - 1]]

-- | Paper Theorem 3.1 (lean target eg_plain_tensor_insufficient): the witness
-- of the Etingof-Gelaki constraint. Two non-isomorphic groups with equivalent
-- plain tensor representation categories; the recorded preserved layers are
-- exactly the plain tensor structure, which the constraint forbids as a
-- recovery principle (RecoveryObstruction in Taxonomy.Equivalences).
data IsocategoricalWitness = IsocategoricalWitness
  { isoGroupA :: String
    -- ^ Name of the first group (data stand-in; the construction is cited).
  , isoGroupB :: String
    -- ^ Name of the second group.
  , isoPlainTensorEquivalent :: Bool
    -- ^ Equivalent as plain tensor categories (the insufficient layer).
  , isoSymmetricEquivalent :: Bool
    -- ^ Equivalent as symmetric tensor categories (must differ).
  }
  deriving (Eq, Show)

-- | DEF-033 (Family VIII: tensor categories and compositional structures):
-- the compositional data of the witness is its pair of names and the two
-- equivalence verdicts.
instance FamilyTensorCategoriesComposition IsocategoricalWitness where
  type TensorCategoryData IsocategoricalWitness = ((String, String), (Bool, Bool))
  tensorCategoryData w =
    ( (isoGroupA w, isoGroupB w)
    , (isoPlainTensorEquivalent w, isoSymmetricEquivalent w)
    )

-- | Paper Definition 2.6 and Corollary 3.2 (lean target
-- preserved_layer_discipline): the layers of structure an identification
-- preserves must be stated. On this witness the only claim is the plain
-- tensor layer, which carries the recovery obstruction
-- TensorEquivalenceWithoutSymmetricStructure.
preservedLayersOf :: IsocategoricalWitness -> [PreservedStructure]
preservedLayersOf w
  | isoPlainTensorEquivalent w && not (isoSymmetricEquivalent w) = [PlainTensorStructure]
  | otherwise = [SymmetricMonoidalStructure]

exec
/usr/local/bin/zsh -lc 'cat src/vol-11-completeness-obstructions/Instances.hs src/vol-12-principia-physica/Instances.hs src/Taxonomy/Invariants.hs' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
{-# LANGUAGE TypeFamilies #-}

{-|
Module      : Vol11CompletenessObstructions.Instances
Description : Taxonomy instances for the regime taxonomy and obstruction
              witnesses of the completeness-and-obstructions volume.
Copyright   : (c) Matthew Long, 2026
License     : MIT
Maintainer  : matthew@yonedaai.com
Stability   : experimental

Executable taxonomy layer for the paper "Completeness and Obstructions"
(Part 11 of The Classification of Mathematical Representations of Physical
Systems).  The module imports the shared family classes of "Taxonomy" and
declares instances of them for this volume's witness systems; it never
redefines those classes.

The regime tag mirrors Definition 4.2 of the paper and the lean target
'Regime'; the type and method names mirror the paper's definitions.  This
module is computational evidence only: it proves nothing, it is not
machine-checked, and no formal verification is claimed for it.
-}
module Vol11CompletenessObstructions.Instances
  ( -- * Regime taxonomy (paper, Definition 4.2)
    ClassificationRegime (..)
  , regimes
  , regimeOf
    -- * Witness systems of the register
  , WitnessSystem (..)
    -- * Family data witnesses
  , OperatorAlgebraWitness (..)
  , DerivedWitness (..)
  , TensorCategoryWitness (..)
  , GeometricWitness (..)
  , CombinatorialWitness (..)
    -- * Invariant mirror (paper, Definition 4.1)
  , classifyCStar
  , sortDesc
  ) where

import Taxonomy.Families
  ( FamilyHilbertOperatorAlgebras (..)
  , FamilySmoothGeometric (..)
  , FamilyTensorCategoriesComposition (..)
  , FamilyDynamicalSemigroups (..)
  , FamilyDiscreteCombinatorial (..)
  , FamilyDerivedHomotopical (..)
  )
import Taxonomy.Invariants
  ( ClassifyingInvariant (..)
  , DimensionVector (..)
  )
import Taxonomy.Constructions
  ( Construction (..)
  , Constructible (..)
  , Irreducible (..)
  , Decomposition (..)
  , Decomposable (..)
  )
import Taxonomy.Equivalences
  ( MathematicalEquivalence (..)
  , PhysicalEquivalence (..)
  )

-- | Paper, Definition 4.2: the seven regimes of classification evidence.
-- Constructor names mirror the regime names used in the paper and in the
-- lean targets document.
data ClassificationRegime
  = ParameterizedRegime
    -- ^ Complete invariant, parameter space, and recognizer all exist.
  | UnparameterizedRegime
    -- ^ Complete invariant and recognizer exist; no uniform parameter space.
  | ObstructionCompleteRegime
    -- ^ The classification content is a proved impossibility theorem.
  | OpenRegime
    -- ^ Partial results exist and no impossibility theorem applies.
  | WildRegime
    -- ^ Finite-variety parameterization is provably impossible.
  | UndecidableRegime
    -- ^ No recognition procedure exists in the stated generality.
  | DecidableButUnclassifiedRegime
    -- ^ A recognizer exists; no complete invariant is known.
  deriving (Eq, Ord, Show, Enum, Bounded)

-- | All seven regimes, in the order of Definition 4.2.
regimes :: [ClassificationRegime]
regimes = [minBound .. maxBound]

-- | A witness system of the obstruction register and the regime table.
-- Each constructor names the domain whose evidence fixes its regime; the
-- payload is the identifying data used by the paper's examples.
data WitnessSystem
  = FiniteDimCStar [Int]
    -- ^ Finite-dimensional C*-algebra by dimension vector; parameterized.
  | SimpleGroupWitness String
    -- ^ Finite simple group; classified, not parameterized (CFSG gap).
  | AmenableFactorWitness String
    -- ^ Amenable factor; parameterized by type data.
  | GeneralII1Witness String
    -- ^ General separable II_1 factor; obstruction-complete (McDuff).
  | IsocategoricalPair String String
    -- ^ Pair of non-isomorphic groups with equivalent plain tensor
    -- representation categories (Etingof-Gelaki); obstruction-complete.
  | FusionCategoryWitness String
    -- ^ Fusion category; open.
  | WildModuleWitness (Int, Int)
    -- ^ Module of a wild category by rank data; wild.
  | MarkovGroupWitness String
    -- ^ Finitely presented group with a Markov property; undecidable.
  | FourManifoldWitness Int
    -- ^ Connected sum of n copies of S^2 x S^2; unrecognizable for n >= 9.
  | UnknotWitness Int
    -- ^ Knot diagram by crossing count; decidable-but-unclassified.
  deriving (Eq, Show)

-- | Paper, Table 4: the regime of each witness system.  Total by
-- construction, mirroring the lean target 'RegimeAssignment'.
regimeOf :: WitnessSystem -> ClassificationRegime
regimeOf (FiniteDimCStar _)        = ParameterizedRegime
regimeOf (SimpleGroupWitness _)    = UnparameterizedRegime
regimeOf (AmenableFactorWitness _) = ParameterizedRegime
regimeOf (GeneralII1Witness _)     = ObstructionCompleteRegime
regimeOf (IsocategoricalPair _ _)  = ObstructionCompleteRegime
regimeOf (FusionCategoryWitness _) = OpenRegime
regimeOf (WildModuleWitness _)     = WildRegime
regimeOf (MarkovGroupWitness _)    = UndecidableRegime
regimeOf (FourManifoldWitness _)   = UndecidableRegime
regimeOf (UnknotWitness _)         = DecidableButUnclassifiedRegime

-- | Operator-algebra structural data, for the 'FamilyHilbertOperatorAlgebras'
-- instance.  'Nothing' at the instance level means the witness carries no
-- operator-algebra data here.
data OperatorAlgebraWitness
  = CStarBlocks [Int]
    -- ^ Dimension vector of a finite-dimensional C*-algebra.
  | FactorTag String
    -- ^ Named factor witness.
  deriving (Eq, Show)

-- | Derived and homotopical data, for 'FamilyDerivedHomotopical'.
data DerivedWitness
  = DerivedWildTag (Int, Int)
    -- ^ Rank data of a derived-wild module category witness.
  deriving (Eq, Show)

-- | Tensor-category data, for 'FamilyTensorCategoriesComposition'.
data TensorCategoryWitness
  = PlainTensorRep String
    -- ^ Plain tensor representation category of a named group.
  | SymmetricTensorRep String
    -- ^ Symmetric tensor representation category of a named group.
  | FusionCategoryTag String
    -- ^ Named fusion category witness.
  deriving (Eq, Show)

-- | Geometric data, for 'FamilySmoothGeometric'.
data GeometricWitness
  = FourManifoldTag Int
    -- ^ Connected sum of n copies of S^2 x S^2.
  | KnotDiagramTag Int
    -- ^ Knot diagram with the given crossing count.
  deriving (Eq, Show)

-- | Combinatorial data, for 'FamilyDiscreteCombinatorial'.
data CombinatorialWitness
  = MarkovPresentation String
    -- ^ Finite presentation carrying a Markov property.
  | FiniteGroupData String
    -- ^ Combinatorial data of a named finite group.
  deriving (Eq, Show)

-- | Paper, Definition 4.1: the dimension vector is the complete invariant of
-- finite-dimensional complex C*-algebras up to *-isomorphism.  The mirror
-- returns the classifying-invariant tag of 'Taxonomy.Invariants' and 'Nothing'
-- outside that domain.
classifyCStar :: WitnessSystem -> Maybe ClassifyingInvariant
classifyCStar (FiniteDimCStar ns) =
  Just (ByDimensionVector (DimensionVector (sortDesc ns)))
classifyCStar _ = Nothing

-- | Sort a dimension vector in non-increasing order, so that equal
-- multisets of block sizes compare equal.
sortDesc :: [Int] -> [Int]
sortDesc = foldr insertDesc []
  where
    insertDesc :: Int -> [Int] -> [Int]
    insertDesc x [] = [x]
    insertDesc x (y : ys)
      | x >= y    = x : y : ys
      | otherwise = y : insertDesc x ys

instance FamilyHilbertOperatorAlgebras WitnessSystem where
  type OperatorAlgebraData WitnessSystem = Maybe OperatorAlgebraWitness
  operatorAlgebraData (FiniteDimCStar ns) = Just (CStarBlocks ns)
  operatorAlgebraData (GeneralII1Witness n) = Just (FactorTag n)
  operatorAlgebraData (AmenableFactorWitness n) = Just (FactorTag n)
  operatorAlgebraData _ = Nothing

instance FamilyDerivedHomotopical WitnessSystem where
  type DerivedHomotopicalData WitnessSystem = Maybe DerivedWitness
  derivedHomotopicalData (WildModuleWitness r) = Just (DerivedWildTag r)
  derivedHomotopicalData _ = Nothing

instance FamilyTensorCategoriesComposition WitnessSystem where
  type TensorCategoryData WitnessSystem = Maybe TensorCategoryWitness
  tensorCategoryData (IsocategoricalPair g _) = Just (PlainTensorRep g)
  tensorCategoryData (FusionCategoryWitness n) = Just (FusionCategoryTag n)
  tensorCategoryData (SimpleGroupWitness g) = Just (SymmetricTensorRep g)
  tensorCategoryData _ = Nothing

instance FamilySmoothGeometric WitnessSystem where
  type GeometricData WitnessSystem = Maybe GeometricWitness
  geometricData (FourManifoldWitness n) = Just (FourManifoldTag n)
  geometricData (UnknotWitness n) = Just (KnotDiagramTag n)
  geometricData _ = Nothing

instance FamilyDiscreteCombinatorial WitnessSystem where
  type CombinatorialData WitnessSystem = Maybe CombinatorialWitness
  combinatorialData (MarkovGroupWitness p) = Just (MarkovPresentation p)
  combinatorialData (SimpleGroupWitness g) = Just (FiniteGroupData g)
  combinatorialData _ = Nothing

-- | Direct sum concatenates dimension vectors; every other construction is
-- left unsupplied here, which asserts nothing about its existence.
instance Constructible WitnessSystem where
  type Composite WitnessSystem = WitnessSystem
  tensorProduct _ _ = Nothing
  directSum (FiniteDimCStar a) (FiniteDimCStar b) =
    Just (FiniteDimCStar (sortDesc (a ++ b)))
  directSum _ _ = Nothing
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

-- | Irreducibility is relative to the named construction, as in the paper:
-- single-block C*-algebras are irreducible for direct sum, and factors are
-- irreducible for factorization.
instance Irreducible WitnessSystem where
  irreducibilityBasis (FiniteDimCStar [_]) = DirectSum
  irreducibilityBasis (GeneralII1Witness _) = Factorization
  irreducibilityBasis (AmenableFactorWitness _) = Factorization
  irreducibilityBasis _ = DirectSum

-- | The block decomposition of a finite-dimensional C*-algebra, mirroring
-- the paper's model theorem: A = sum_i M_{n_i}(C) with each block irreducible.
instance Decomposable WitnessSystem where
  decomposition (FiniteDimCStar ns) =
    Just (Decomposition DirectSum [FiniteDimCStar [n] | n <- ns])
  decomposition _ = Nothing

-- | Mathematical equivalence of witnesses: dimension vectors compared as
-- multisets, named witnesses compared by name.  This is the finer relation
-- of the paper (isomorphism of presentations).
instance MathematicalEquivalence WitnessSystem where
  mathematicallyEquivalent (FiniteDimCStar a) (FiniteDimCStar b) =
    sortDesc a == sortDesc b
  mathematicallyEquivalent (IsocategoricalPair a b) (IsocategoricalPair c d) =
    (a == c && b == d) || (a == d && b == c)
  mathematicallyEquivalent x y = x == y

-- | Physical equivalence of witnesses, with the relation stated: two
-- witnesses are physically equivalent exactly when they sit in the same
-- regime of Definition 4.2.  This relation is declared for taxonomy purposes
-- and is not proposed as an equivalence for physical systems.
instance PhysicalEquivalence WitnessSystem where
  physicallyEquivalent a b = regimeOf a == regimeOf b

-- | The dynamical-semigroup family is referenced by the volume but carries
-- no witness data here; the instance records the absence rather than
-- inventing data.
instance FamilyDynamicalSemigroups WitnessSystem where
  type DynamicalSemigroupData WitnessSystem = ()
  dynamicalSemigroupData _ = ()
{-# LANGUAGE TypeFamilies #-}

-- | Module        : Vol12PrincipiaPhysica.Instances
-- Description     : Executable taxonomy instances for Volume 12, Principia
--                   Physica: the layered assembly and the worked example of
--                   Section 9 of the paper.
-- Copyright   : (c) Matthew Long, 2026
-- License     : MIT
-- Maintainer  : matthew@yonedaai.com
-- Stability   : experimental
--
-- This module declares instances of the shared taxonomy classes in
-- "Taxonomy.Families", "Taxonomy.Constructions", "Taxonomy.Equivalences", and
-- "Taxonomy.Invariants" for the systems this volume studies. The family
-- classes are imported and never redefined. The worked example is the
-- finite-dimensional C*-algebra A = C (+) M_2(C) of the paper: its dimension
-- vector is the classifying invariant, its blocks are the irreducible
-- constituents under direct sum, and its invariant record is the data the
-- three layers read.
--
-- Claim status (docs/theorem-registry.md): this module is executable
-- taxonomy, that is computational evidence only. It proves nothing and is
-- never "verified by Lean"; the honest statement is that executable models
-- are validated against kernel-checked specifications when such
-- specifications exist. Type and method names mirror the paper's
-- definitions and the targets in
-- verification/vol-12-principia-physica-lean-targets.md.
module Vol12PrincipiaPhysica.Instances
  ( -- * Regime and evidence vocabulary (paper, Definition 2.6 and 2.7)
    Regime (..)
  , EvidenceGrade (..)
  , regimeTally
    -- * The layered assembly (paper, Definition 2.5)
  , PrincipiaLayers (..)
    -- * Worked example (paper, Section 9.1)
  , FiniteDimQuantumExample (..)
  , MatrixBlock (..)
  , dimensionVectorExample
  , decompositionExample
  , invariantRecordExample
    -- * Executable checks (computational evidence, never proofs)
  , classificationOrderCheck
  , decompositionCheck
  ) where

import Data.List (sort)

import Taxonomy.Constructions
  ( Construction (..)
  , Decomposable (..)
  , Decomposition (..)
  , Irreducible (..)
  )
import Taxonomy.Equivalences (MathematicalEquivalence (..))
import Taxonomy.Families
  ( FamilyHilbertOperatorAlgebras (..)
  , PhysicalSystem (..)
  )
import Taxonomy.Invariants
  ( ClassifyingInvariant (..)
  , DimensionVector (..)
  , InvariantRecord (..)
  )

-- | Classification regimes of the paper (Definition 2.7). The constructors
-- mirror the seven regimes exactly: complete and parameterized, complete but
-- unparameterized, complete as obstruction, open, impossible in the stated
-- generality, undecidable, and decidable but unclassified.
data Regime
  = CompleteParameterized
  | CompleteUnparameterized
  | CompleteAsObstruction
  | OpenRegime
  | ImpossibleRegime
  | UndecidableRegime
  | DecidableUnclassified
  deriving (Eq, Ord, Show, Enum, Bounded)

-- | Evidence grades of the paper (Definition 2.6): formulation, rigorous
-- theorem, physical validation. The registry of the program places records
-- at the first two grades only; no record reaches 'PhysicalValidation'.
data EvidenceGrade
  = Formulation
  | RigorousTheorem
  | PhysicalValidation
  deriving (Eq, Ord, Show, Enum, Bounded)

-- | Tally domain rows by regime. The paper's Theorem 4.1 counts the rows of
-- its regime table; this function is the executable form of that count and
-- returns one pair per regime that occurs.
regimeTally :: [(String, Regime)] -> [(Regime, Int)]
regimeTally rows =
  [ (r, length (filter ((== r) . snd) rows))
  | r <- [minBound .. maxBound]
  , any ((== r) . snd) rows
  ]

-- | The Principia architecture (Definition 2.5): mathematical
-- classification, physical realization, and empirical selection kept as
-- three separate fields. The record is the non-collapse of the layers in
-- data form: no field is computed from another.
data PrincipiaLayers m r e = PrincipiaLayers
  { mathLayer :: m
    -- ^ Layer M: classification of admissible structures.
  , realizationLayer :: r
    -- ^ Layer R: map from structures to physical theories.
  , selectionLayer :: e
    -- ^ Layer E: map from theories to observational data.
  }
  deriving (Eq, Show)

-- | The worked example of the paper (Section 9.1): the finite-dimensional
-- complex C*-algebra A = C (+) M_2(C), recorded by its dimension vector. The
-- list of block sizes is the multiset that classifies the algebra up to
-- *-isomorphism (T-BG-06); the order of the list carries no meaning.
newtype FiniteDimQuantumExample = FiniteDimQuantumExample
  { exampleBlocks :: [Int] }
  deriving (Eq, Show)

-- | An irreducible matrix block M_n(C) of a finite-dimensional C*-algebra.
-- The integer is the block size n.
newtype MatrixBlock = MatrixBlock
  { matrixSize :: Int }
  deriving (Eq, Ord, Show)

-- | The dimension vector of the worked example: A = C (+) M_2(C) has
-- dimension vector {1, 2}. Mirrors the paper's Lemma 5.1 statement and the
-- lean target FiniteDimCStarDecomposition.
dimensionVectorExample :: DimensionVector
dimensionVectorExample = DimensionVector [1, 2]

-- | The decomposition of the worked example into irreducible blocks under
-- the direct-sum construction: one block of size one and one block of size
-- two. Mirrors the paper's Lemma 5.1: the multiset of sizes is unique up to
-- order.
decompositionExample :: Decomposition FiniteDimQuantumExample
decompositionExample = Decomposition
  { decompositionConstruction = DirectSum
  , irreducibleFactors =
      [ FiniteDimQuantumExample [1]
      , FiniteDimQuantumExample [2]
      ]
  }

-- | The structural invariant record of the worked example (Definition 2.8):
-- states, observables, dynamics, symmetries, and representations all reduce
-- to block data in this example. The representation entry is the
-- classifying dimension vector.
invariantRecordExample :: InvariantRecord [Int] [Int] [Int] [Int] ClassifyingInvariant
invariantRecordExample = InvariantRecord
  { stateInvariants = [1, 2]
  , observableInvariants = [1, 2]
  , dynamicsInvariants = [1, 2]
  , symmetryInvariants = [1, 2]
  , representationInvariants = ByDimensionVector dimensionVectorExample
  }

instance PhysicalSystem FiniteDimQuantumExample where
  type StateSpace FiniteDimQuantumExample = [Int]
  type Observables FiniteDimQuantumExample = [Int]
  type Dynamics FiniteDimQuantumExample = [Int]
  type Symmetries FiniteDimQuantumExample = [Int]
  type Composition FiniteDimQuantumExample = [Construction]
  stateSpace = exampleBlocks
  observables = exampleBlocks
  dynamics = exampleBlocks
  symmetries = exampleBlocks
  composition ex = [DirectSum | length (exampleBlocks ex) > 1]

instance FamilyHilbertOperatorAlgebras FiniteDimQuantumExample where
  type OperatorAlgebraData FiniteDimQuantumExample = DimensionVector
  operatorAlgebraData = DimensionVector . sort . exampleBlocks

instance Irreducible MatrixBlock where
  irreducibilityBasis _ = DirectSum

instance Decomposable FiniteDimQuantumExample where
  decomposition ex
    | length (exampleBlocks ex) == 1 = Nothing
    | otherwise = Just Decomposition
        { decompositionConstruction = DirectSum
        , irreducibleFactors = map (FiniteDimQuantumExample . pure) (exampleBlocks ex)
        }

instance MathematicalEquivalence FiniteDimQuantumExample where
  -- | *-isomorphism of the algebras, per T-BG-06: two examples are
  -- mathematically equivalent exactly when their block multisets agree.
  -- This is not physical equivalence (DEF-015); the choice of physical
  -- equivalence is open and no instance of it is declared here.
  mathematicallyEquivalent a b =
    sort (exampleBlocks a) == sort (exampleBlocks b)

-- | Executable check for the classification claim of the worked example:
-- block order does not affect mathematical equivalence, and different block
-- multisets are not equivalent. Mirrors the paper's Lemma 8.1 statement and
-- the lean target FiniteDimCStarDecomposition. Computational evidence only.
classificationOrderCheck :: Bool
classificationOrderCheck =
  mathematicallyEquivalent (FiniteDimQuantumExample [2, 1])
                           (FiniteDimQuantumExample [1, 2])
    && not (mathematicallyEquivalent (FiniteDimQuantumExample [1, 2])
                                     (FiniteDimQuantumExample [2, 2]))

-- | Executable check for the decomposition claim of the worked example: the
-- two factors of 'decompositionExample' have one block each, and concatenating
-- their block lists reconstructs the block list of the original example.
-- Computational evidence only.
decompositionCheck :: Bool
decompositionCheck =
  all ((== 1) . length . exampleBlocks) (irreducibleFactors decompositionExample)
    && concatMap exampleBlocks (irreducibleFactors decompositionExample)
         == exampleBlocks (FiniteDimQuantumExample [1, 2])
{-# LANGUAGE EmptyDataDecls #-}

-- | Module        : Taxonomy.Invariants
-- Description     : Invariant records, classifying invariants, and invariant
--                   accessors for the typed taxonomy.
-- Ontology source : docs/ontology.md (DEF-036, DEF-037; family DEF-IDs cited
--                   per declaration).
--
-- Mirrors the invariants layer of the ontology: the structural invariant
-- record (DEF-036) and the classifying invariants named in DEF-037. Types
-- whose mathematical content is abstract at this level are honest stubs: their
-- Haddock comments state the semantics a later volume must supply, and no
-- computation of mathematical content happens here.
--
-- Claim status (docs/theorem-registry.md): this module is vocabulary and
-- accessor shape only. It claims no proof and no formalisation; cited
-- classification results carry their registry status in the comments
-- (literature results are 'complete-informal-proof' at best, never
-- machine-checked within this program).
module Taxonomy.Invariants
  ( -- * Structural invariant record (DEF-036)
    InvariantRecord (..)
    -- * Classifying invariants (DEF-037)
  , ClassifyingInvariant (..)
  , dimensionVectorOf
  , lieDiagramOf
  , weightDataOf
  , murrayVonNeumannTypeOf
  , connesInvariantsOf
  , classifyingSpaceMapOf
  , characteristicClassesOf
  , fullyDualizableObjectOf
  , holonomyGroupOf
  , causalClassOf
  , holographicInequalityDataOf
  , fisherMetricOf
  , monotoneMetricOf
    -- * Invariant data types
  , DimensionVector (..)
  , LieDiagram (..)
  , DynkinDiagram (..)
  , SatakeDiagram
  , WeightData (..)
  , CasimirData (..)
  , MurrayVonNeumannType (..)
  , ConnesInvariants
  , ClassifyingSpaceMap
  , CharacteristicClass (..)
  , FullyDualizableObject
  , HolonomyGroup
  , CausalClass (..)
  , HolographicInequalityData (..)
  , EntropyInequality (..)
  , FisherMetric
  , MonotoneMetric
  , EntropyHook (..)
  , entropyUnder
  ) where

-- | DEF-036 — the structural invariant record of a theory T:
-- I(T) = (S_T, O_T, D_T, G_T, R_T), describing states, observables, dynamics,
-- symmetries, and representations. The classification question is which of
-- these invariants suffice to distinguish theories up to the chosen physical
-- equivalence (DEF-015). Status: stipulative.
data InvariantRecord s o d g r = InvariantRecord
  { stateInvariants :: s
    -- ^ State-side invariants S_T.
  , observableInvariants :: o
    -- ^ Observable-side invariants O_T.
  , dynamicsInvariants :: d
    -- ^ Dynamics-side invariants D_T.
  , symmetryInvariants :: g
    -- ^ Symmetry-side invariants G_T.
  , representationInvariants :: r
    -- ^ Representation-side invariants R_T.
  }
  deriving (Eq, Show)

-- | DEF-037 — a classifying invariant: for a domain with a completed
-- classification, the invariant whose value determines the object up to the
-- chosen equivalence. The constructors mirror exactly the list of DEF-037;
-- each carries the data named there. Scope limits of the underlying results
-- are cited per constructor; nothing here extends them.
data ClassifyingInvariant
  = ByLieDiagram LieDiagram
    -- ^ Dynkin\/Satake diagram (Killing-Cartan classification, T-BG-02,
    -- complete-informal-proof).
  | ByDominantIntegralWeight WeightData
    -- ^ Dominant integral weight (highest-weight theorem, T-BG-03).
  | ByDimensionVector DimensionVector
    -- ^ Dimension vector of a finite-dimensional C*-algebra (T-BG-06).
  | ByMurrayVonNeumannType MurrayVonNeumannType
    -- ^ Murray-von Neumann type (T-BG-07; amenable factors only).
  | ByConnesInvariants ConnesInvariants
    -- ^ Connes invariants (T-BG-07, T-OP-06).
  | ByClassifyingSpaceMap ClassifyingSpaceMap
    -- ^ Homotopy-class map X -> BG classifying a principal bundle (T-BG-08).
  | ByCharacteristicClasses [CharacteristicClass]
    -- ^ Characteristic classes in H*(BG), pullbacks of universal classes
    -- (T-BG-08).
  | ByFullyDualizableObject FullyDualizableObject
    -- ^ Fully dualizable object (cobordism hypothesis; the 2009 writeup is an
    -- informal proof sketch, so the classification claim is recorded as
    -- CLAIMED with a proof gap, T-OP-05).
  | ByHolonomyGroup HolonomyGroup
    -- ^ Holonomy group (Lorentzian case classified, T-BG-11).
  | ByCausalClass CausalClass
    -- ^ Causal class on the complete causal ladder (T-BG-12).
  | ByHolographicInequalityData HolographicInequalityData
    -- ^ SSA+MMI inequality data for at most 4 regions (T-BG-13).
  | ByFisherMetric FisherMetric
    -- ^ Fisher metric, unique up to constant in the classical case
    -- (Chentsov, T-BG-14).
  | ByMonotoneMetric MonotoneMetric
    -- ^ Quantum monotone metric; the quantum case is parametric
    -- (operator monotone functions, T-BG-18), not a finite list.
  deriving (Eq, Show)

-- | Accessor (DEF-037): the dimension vector, when that is the invariant in
-- force. Stub semantics: projection only; no classification is computed.
dimensionVectorOf :: ClassifyingInvariant -> Maybe DimensionVector
dimensionVectorOf (ByDimensionVector dv) = Just dv
dimensionVectorOf _ = Nothing

-- | Accessor (DEF-037): the Lie diagram, when that is the invariant in force.
lieDiagramOf :: ClassifyingInvariant -> Maybe LieDiagram
lieDiagramOf (ByLieDiagram d) = Just d
lieDiagramOf _ = Nothing

-- | Accessor (DEF-037): the weight data (dominant weight, Casimirs), when that
-- is the invariant in force.
weightDataOf :: ClassifyingInvariant -> Maybe WeightData
weightDataOf (ByDominantIntegralWeight w) = Just w
weightDataOf _ = Nothing

-- | Accessor (DEF-037): the Murray-von Neumann type, when that is the
-- invariant in force.
murrayVonNeumannTypeOf :: ClassifyingInvariant -> Maybe MurrayVonNeumannType
murrayVonNeumannTypeOf (ByMurrayVonNeumannType t) = Just t
murrayVonNeumannTypeOf _ = Nothing

-- | Accessor (DEF-037): the Connes invariants, when that is the invariant in
-- force.
connesInvariantsOf :: ClassifyingInvariant -> Maybe ConnesInvariants
connesInvariantsOf (ByConnesInvariants c) = Just c
connesInvariantsOf _ = Nothing

-- | Accessor (DEF-037): the classifying-space map X -> BG, when that is the
-- invariant in force.
classifyingSpaceMapOf :: ClassifyingInvariant -> Maybe ClassifyingSpaceMap
classifyingSpaceMapOf (ByClassifyingSpaceMap m) = Just m
classifyingSpaceMapOf _ = Nothing

-- | Accessor (DEF-037): the characteristic classes, when those are the
-- invariant in force.
characteristicClassesOf :: ClassifyingInvariant -> Maybe [CharacteristicClass]
characteristicClassesOf (ByCharacteristicClasses cs) = Just cs
characteristicClassesOf _ = Nothing

-- | Accessor (DEF-037): the fully dualizable object, when that is the
-- invariant in force. See the CLAIMED status note on 'ByFullyDualizableObject'.
fullyDualizableObjectOf :: ClassifyingInvariant -> Maybe FullyDualizableObject
fullyDualizableObjectOf (ByFullyDualizableObject o) = Just o
fullyDualizableObjectOf _ = Nothing

-- | Accessor (DEF-037): the holonomy group, when that is the invariant in
-- force.
holonomyGroupOf :: ClassifyingInvariant -> Maybe HolonomyGroup
holonomyGroupOf (ByHolonomyGroup h) = Just h
holonomyGroupOf _ = Nothing

-- | Accessor (DEF-037): the causal class, when that is the invariant in force.
causalClassOf :: ClassifyingInvariant -> Maybe CausalClass
causalClassOf (ByCausalClass c) = Just c
causalClassOf _ = Nothing

-- | Accessor (DEF-037): the holographic inequality data, when that is the
-- invariant in force.
holographicInequalityDataOf
  :: ClassifyingInvariant -> Maybe HolographicInequalityData
holographicInequalityDataOf (ByHolographicInequalityData h) = Just h
holographicInequalityDataOf _ = Nothing

-- | Accessor (DEF-037): the Fisher metric, when that is the invariant in
-- force.
fisherMetricOf :: ClassifyingInvariant -> Maybe FisherMetric
fisherMetricOf (ByFisherMetric f) = Just f
fisherMetricOf _ = Nothing

-- | Accessor (DEF-037): the quantum monotone metric, when that is the
-- invariant in force.
monotoneMetricOf :: ClassifyingInvariant -> Maybe MonotoneMetric
monotoneMetricOf (ByMonotoneMetric m) = Just m
monotoneMetricOf _ = Nothing

-- | DEF-037 — dimension vector of a finite-dimensional complex C*-algebra:
-- the multiset of matrix block sizes in A ~= sum_i M_{n_i}(C). Within its
-- scope the multiset determines A up to *-isomorphism (T-BG-06,
-- complete-informal-proof). Encoding: the block sizes as a list; the
-- multiset, not the order, is the invariant.
newtype DimensionVector = DimensionVector [Int]
  deriving (Eq, Ord, Show)

-- | DEF-037 — Dynkin or Satake diagram data of a (real or complex) semisimple
-- Lie algebra (T-BG-02).
data LieDiagram
  = Dynkin DynkinDiagram
    -- ^ Complex semisimple case: Dynkin diagram.
  | Satake SatakeDiagram
    -- ^ Real simple case: Satake diagram.
  deriving (Eq, Show)

-- | DEF-037 — Dynkin diagrams of complex simple Lie algebras: the A-D series
-- and the five exceptional diagrams (T-BG-02).
data DynkinDiagram
  = ADyn Int
  | BDyn Int
  | CDyn Int
  | DDyn Int
  | G2Dyn
  | F4Dyn
  | E6Dyn
  | E7Dyn
  | E8Dyn
  deriving (Eq, Ord, Show)

-- | DEF-037 — Satake diagram of a real simple Lie algebra. Stub: the diagram
-- itself is left abstract; a volume that needs its data refines this type.
data SatakeDiagram
  deriving (Eq, Show)

-- | DEF-037 — weight data of a finite-dimensional irrep of a complex
-- semisimple Lie algebra: a dominant integral weight, with the Casimir data
-- recorded alongside (T-BG-03). The weight is given in the fundamental-weight
-- basis; semantics are those of the highest-weight theorem.
data WeightData = WeightData
  { dominantIntegralWeight :: [Rational]
    -- ^ Coordinates in the fundamental-weight basis.
  , casimirData :: CasimirData
    -- ^ Casimir data attached to the weight.
  }
  deriving (Eq, Show)

-- | DEF-037 — Casimir data: eigenvalues of the Casimir operators on the
-- representation, recorded in a fixed basis order. Stub semantics: the list is
-- abstract data; no computation of Casimir elements is claimed here.
newtype CasimirData = CasimirData [Rational]
  deriving (Eq, Ord, Show)

-- | DEF-037 — Murray-von Neumann type of a von Neumann algebra factor. The
-- constructors mirror the amenable classification (T-BG-07,
-- complete-informal-proof): types I_n, I_infinity, II_1, II_infinity,
-- III_lambda (0 < lambda <= 1), III_0, III_1. Outside the amenable class a
-- total classification is impossible (T-OB-01).
data MurrayVonNeumannType
  = TypeI Int
    -- ^ Type I_n, n matrix size.
  | TypeIInfinite
    -- ^ Type I_infinity.
  | TypeII1
    -- ^ Type II_1.
  | TypeIIInfinite
    -- ^ Type II_infinity.
  | TypeIIILambda Rational
    -- ^ Type III_lambda with 0 < lambda <= 1.
  | TypeIII0
    -- ^ Type III_0 (ergodic-flow description).
  | TypeIII1
    -- ^ Type III_1.
  deriving (Eq, Show)

-- | DEF-037 — Connes invariants of a factor. Stub: the invariants (Connes
-- spectrum, fundamental group) are left abstract; only coarse strata are
-- available in general (T-OP-06).
data ConnesInvariants
  deriving (Eq, Show)

-- | DEF-037 — classifying-space map [X, BG]: homotopy classes of maps into
-- the classifying space, classifying principal G-bundles; characteristic
-- classes are pullbacks of universal classes (T-BG-08). Stub: the map is left
-- abstract.
data ClassifyingSpaceMap
  deriving (Eq, Show)

-- | DEF-037 / DEF-029 — named characteristic classes in H*(BG): the standard
-- list used to classify principal bundles and their obstructions (T-BG-08).
data CharacteristicClass
  = StiefelWhitney
    -- ^ Stiefel-Whitney classes.
  | Pontryagin
    -- ^ Pontryagin classes.
  | Euler
    -- ^ Euler class.
  | Chern
    -- ^ Chern classes.
  | DixmierDouady
    -- ^ Dixmier-Douady class.
  deriving (Eq, Ord, Show)

-- | DEF-037 — fully dualizable object, the invariant named by the cobordism
-- hypothesis for extended TQFTs. Stub: the object is left abstract. Status
-- note: the classification statement is recorded as CLAIMED with a proof gap
-- (T-OP-05); nothing here treats it as proved.
data FullyDualizableObject
  deriving (Eq, Show)

-- | DEF-037 — holonomy group of a (here: Lorentzian) geometric structure.
-- Stub: the group is left abstract; the connected Lorentzian case is
-- classified (T-BG-11, complete-informal-proof).
data HolonomyGroup
  deriving (Eq, Show)

-- | DEF-037 — causal class of a spacetime: a rung of the causal ladder, which
-- is complete as a classification of causality conditions (T-BG-12).
data CausalClass
  = Chronological
    -- ^ No closed timelike curves.
  | Causal
    -- ^ No closed causal curves.
  | Distinguishing
  -- ^ Distinguishing spacetime.
  | StrongCausality
  | StableCausality
  | GlobalHyperbolicity
  deriving (Eq, Ord, Show, Enum, Bounded)

-- | DEF-037 — SSA+MMI inequality data for the holographic entropy cone in the
-- proven range of at most 4 boundary regions (T-BG-13). For n >= 5 regions the
-- cone is open (T-OP-04); this record does not extend the proven range.
data HolographicInequalityData = HolographicInequalityData
  { regionCount :: Int
    -- ^ Number of boundary regions; the proven range is <= 4.
  , entropyInequalities :: [EntropyInequality]
    -- ^ The inequality kinds in force for this region count.
  }
  deriving (Eq, Show)

-- | Inequality kinds named in the proven SSA+MMI data (T-BG-13).
data EntropyInequality
  = StrongSubadditivity
  | MonogamyOfMutualInformation
  deriving (Eq, Ord, Show)

-- | DEF-037 — Fisher information metric. Stub: the metric is left abstract.
-- In the classical case it is unique up to constant as the metric monotone
-- under stochastic maps (Chentsov, T-BG-14); uniqueness fails in the quantum
-- case.
data FisherMetric
  deriving (Eq, Show)

-- | DEF-037 — quantum monotone metric. Stub: the metric is left abstract. The
-- quantum case is classified parametrically by operator monotone functions
-- (Petz-Sudar, T-BG-18) — a parametric family, not a finite list; the
-- classical uniqueness may not be extended.
data MonotoneMetric
  deriving (Eq, Show)

-- | DEF-037 — entropy hook: an entropy functional supplied by a volume,
-- mapping a state of type s to an entropy value of type e when defined.
-- Hook semantics: Nothing means the volume does not assign an entropy in that
-- case; no value is computed here.
newtype EntropyHook s e = EntropyHook (s -> Maybe e)

-- | Apply an entropy hook (DEF-037). Pure plumbing; no mathematical content.
entropyUnder :: EntropyHook s e -> s -> Maybe e
entropyUnder (EntropyHook f) = f

exec
/usr/local/bin/zsh -lc 'cat lean/Cmrps/Vol03IrreducibilityDecomposition.lean lean/Cmrps/Vol06QuantumSystems.lean' in /Users/mlong/Documents/Development/classification-physical-systems
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
(paper `cor:closure`): the submonoid of `(ℕ, ×)` generated by `S`. **Scope caveat
(Codex review, round 2):** `Submonoid.closure` always contains the multiplicative
unit `1`, so this is closure *with the tensor unit adjoined* — starting from only
block size `2`, the paper's binary constructions cannot generate a size-`1` block
unless nullary tensor products are admitted (the paper's convention). -/
def sizeSemigroup (S : Set ℕ) : Submonoid ℕ :=
  Submonoid.closure S

/-- A dimension vector is closed over `S` when every entry lies in the generated
multiplicative semigroup (paper `cor:closure`), where the semigroup includes the
unit `1` (see the caveat on `sizeSemigroup`). -/
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
/usr/local/bin/zsh -lc 'cat lean/Cmrps/Vol07GaugeQft.lean lean/Cmrps/Vol11CompletenessObstructions.lean' in /Users/mlong/Documents/Development/classification-physical-systems
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
    d.alpha l.sum = (l.map d.alpha).sum :=
  _root_.map_list_sum d.alpha l

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
/usr/local/bin/zsh -lc 'cat lean/Cmrps/Vol08SpacetimeReconstruction.lean lean/Cmrps/Vol09GravityInformationGeometry.lean' in /Users/mlong/Documents/Development/classification-physical-systems
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
/usr/local/bin/zsh -lc 'cat lean/Cmrps/Vol10ObservationalEquivalence.lean lean/Cmrps/Vol12PrincipiaPhysica.lean' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
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
    monotone g → ∃ c : ℚ, 0 < c ∧
      ∀ p a, (∀ i, 0 < p i) → (∑ i, p i = 1) → (∑ i, a i = 0) →
        g p a = c * fisherForm p a

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
`f(x) = x f(x⁻¹)` on the positive domain, and distinct such `f` give distinct metrics
on self-adjoint directions at positive eigenvalues. `OperatorMonotone` is a parameter
(predicate on parameter functions) because operator monotonicity is external to this
module. The skeleton requires `n ≥ 2`, positive eigenvalues, and symmetric tangent
directions, and compares parameter functions only through their positive-domain data
(Codex review rounds 1–2). This is an unproved specification, NOT the paper's theorem. -/
def petz_sudar_parametricity {n : ℕ}
    (OperatorMonotone : (ℚ → ℚ) → Prop)
    (monotone : ((Fin n → ℚ) → (Fin n → Fin n → ℚ) → ℚ) → Prop) : Prop :=
  (2 ≤ n) ∧
  (∀ f : ℚ → ℚ, NormalizedAtOne f → SelfReciprocal f → OperatorMonotone f →
      monotone (fun lam A => mcQuadratic f lam A)) ∧
    (∀ m, monotone m → ∃ f : ℚ → ℚ, NormalizedAtOne f ∧ SelfReciprocal f ∧ OperatorMonotone f ∧
      ∀ lam : Fin n → ℚ, ∀ A : Fin n → Fin n → ℚ,
        (∀ i, 0 < lam i) → (∀ i j, A i j = A j i) → (∑ i, A i i = 0) →
        m lam A = mcQuadratic f lam A) ∧
    (∀ f g : ℚ → ℚ, SelfReciprocal f → SelfReciprocal g →
      OperatorMonotone f → OperatorMonotone g → ¬ Set.EqOn f g (Set.Ioi 0) →
      ∃ lam : Fin n → ℚ, ∃ A : Fin n → Fin n → ℚ,
        (∀ i, 0 < lam i) ∧ (∀ i j, A i j = A j i) ∧ (∑ i, A i i = 0) ∧
        mcQuadratic f lam A ≠ mcQuadratic g lam A)

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
  simpa only [Matrix.smul_single, smul_eq_mul, mul_one] using Matrix.matrix_eq_sum_single X

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
/usr/local/bin/zsh -lc "sed -n '1,335p' lean/Cmrps/Vol01Foundations.lean" in /Users/mlong/Documents/Development/classification-physical-systems
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

exec
/usr/local/bin/zsh -lc "sed -n '1,265p' lean/Cmrps/Vol02StructuralFamilies.lean" in /Users/mlong/Documents/Development/classification-physical-systems
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

/-- Paper Proposition 3.4 consequence, as formalized: every germ invariant is *constant*
on all germs (a restatement of `globality_symplectic`). **Scope caveat (Codex review,
round 2):** the paper's "no local classifier" reading additionally needs global objects,
a pair of non-equivalent objects, and a classifier predicate separating them — none is
formalized here (and since `G.darboux` makes all germs equivalent, a constant invariant
does classify the germ equivalence). The name records the paper's corollary; the
statement is germ constancy and no more. -/
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


exec
/usr/local/bin/zsh -lc "python3 -c 'from pathlib import Path
import re
lean=\"\\n\".join(p.read_text() for p in Path(\"lean\").rglob(\"*.lean\"))
names=set(re.findall(r\"\\b(?:structure|inductive|abbrev|def|class|theorem)\\s+([\\w.]+)\",lean))
for p in sorted(Path(\"src\").rglob(\"*.hs\")):
 for i,l in enumerate(p.read_text().splitlines(),1):
  if l.startswith((\"class \",\"instance \")):
   print(f\"{p}:{i}: {l}\"+(\" [class name absent from Lean]\" if l.startswith(\"class \") and l.split()[1] not in names else \"\"))'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 3119ms:
src/Taxonomy/Constructions.hs:95: class Constructible p where [class name absent from Lean]
src/Taxonomy/Constructions.hs:126: class Irreducible p where
src/Taxonomy/Constructions.hs:148: class Decomposable p where [class name absent from Lean]
src/Taxonomy/Equivalences.hs:81: class MathematicalEquivalence p where [class name absent from Lean]
src/Taxonomy/Equivalences.hs:91: class PhysicalEquivalence p where [class name absent from Lean]
src/Taxonomy/Families.hs:51: class PhysicalSystem p where [class name absent from Lean]
src/Taxonomy/Families.hs:96: instance PhysicalSystem (SystemRecord x o d s c) where
src/Taxonomy/Families.hs:155: class FamilySymplecticPoisson p where [class name absent from Lean]
src/Taxonomy/Families.hs:165: class FamilyHilbertOperatorAlgebras p where [class name absent from Lean]
src/Taxonomy/Families.hs:175: class FamilySmoothGeometric p where [class name absent from Lean]
src/Taxonomy/Families.hs:185: class FamilyPrincipalBundlesConnections p where [class name absent from Lean]
src/Taxonomy/Families.hs:196: class FamilyProbabilityMeasure p where [class name absent from Lean]
src/Taxonomy/Families.hs:206: class FamilyTopologicalHigherCategorical p where [class name absent from Lean]
src/Taxonomy/Families.hs:217: class FamilyDynamicalSemigroups p where [class name absent from Lean]
src/Taxonomy/Families.hs:228: class FamilyTensorCategoriesComposition p where [class name absent from Lean]
src/Taxonomy/Families.hs:238: class FamilyDiscreteCombinatorial p where [class name absent from Lean]
src/Taxonomy/Families.hs:249: class FamilyDerivedHomotopical p where [class name absent from Lean]
src/vol-01-foundations/Instances.hs:139: instance PhysicalSystem FiniteStateSystem where
src/vol-01-foundations/Instances.hs:152: instance PhysicalSystem FiniteProductSystem where
src/vol-01-foundations/Instances.hs:165: instance PhysicalSystem FiniteDynamicalSystem where
src/vol-01-foundations/Instances.hs:178: instance PhysicalSystem BipartiteQubitSystem where
src/vol-01-foundations/Instances.hs:192: instance MathematicalEquivalence FiniteStateSystem where
src/vol-01-foundations/Instances.hs:196: instance MathematicalEquivalence FiniteProductSystem where
src/vol-01-foundations/Instances.hs:203: instance MathematicalEquivalence FiniteDynamicalSystem where
src/vol-01-foundations/Instances.hs:211: instance MathematicalEquivalence BipartiteQubitSystem where
src/vol-01-foundations/Instances.hs:221: instance PhysicalEquivalence FiniteStateSystem where
src/vol-01-foundations/Instances.hs:226: instance PhysicalEquivalence FiniteDynamicalSystem where
src/vol-01-foundations/Instances.hs:232: instance PhysicalEquivalence BipartiteQubitSystem where
src/vol-01-foundations/Instances.hs:238: instance Constructible FiniteStateSystem where
src/vol-01-foundations/Instances.hs:249: instance Constructible FiniteProductSystem where
src/vol-01-foundations/Instances.hs:261: instance Constructible FiniteDynamicalSystem where
src/vol-01-foundations/Instances.hs:280: instance Constructible BipartiteQubitSystem where
src/vol-01-foundations/Instances.hs:291: instance Irreducible FiniteStateSystem where
src/vol-01-foundations/Instances.hs:295: instance Irreducible FiniteProductSystem where
src/vol-01-foundations/Instances.hs:300: instance Irreducible FiniteDynamicalSystem where
src/vol-01-foundations/Instances.hs:305: instance Irreducible BipartiteQubitSystem where
src/vol-01-foundations/Instances.hs:310: instance Decomposable FiniteStateSystem where
src/vol-01-foundations/Instances.hs:320: instance Decomposable FiniteProductSystem where
src/vol-01-foundations/Instances.hs:330: instance Decomposable FiniteDynamicalSystem where
src/vol-01-foundations/Instances.hs:345: instance Decomposable BipartiteQubitSystem where
src/vol-02-structural-families/Instances.hs:85: instance PhysicalSystem SymplecticSystem where
src/vol-02-structural-families/Instances.hs:97: instance FamilySymplecticPoisson SymplecticSystem where
src/vol-02-structural-families/Instances.hs:110: instance PhysicalSystem CotangentBundleSystem where
src/vol-02-structural-families/Instances.hs:122: instance FamilySymplecticPoisson CotangentBundleSystem where
src/vol-02-structural-families/Instances.hs:171: instance PhysicalSystem FiniteCStarAlgebra where
src/vol-02-structural-families/Instances.hs:183: instance FamilyHilbertOperatorAlgebras FiniteCStarAlgebra where
src/vol-02-structural-families/Instances.hs:190: instance Constructible FiniteCStarAlgebra where
src/vol-02-structural-families/Instances.hs:205: instance Irreducible FiniteCStarAlgebra where
src/vol-02-structural-families/Instances.hs:210: instance Decomposable FiniteCStarAlgebra where
src/vol-02-structural-families/Instances.hs:222: instance MathematicalEquivalence FiniteCStarAlgebra where
src/vol-02-structural-families/Instances.hs:230: instance PhysicalEquivalence FiniteCStarAlgebra where
src/vol-02-structural-families/Instances.hs:240: instance PhysicalSystem BinaryQuantumSystem where
src/vol-02-structural-families/Instances.hs:252: instance FamilyHilbertOperatorAlgebras BinaryQuantumSystem where
src/vol-02-structural-families/Instances.hs:267: instance PhysicalSystem LorentzianSystem where
src/vol-02-structural-families/Instances.hs:279: instance FamilySmoothGeometric LorentzianSystem where
src/vol-02-structural-families/Instances.hs:295: instance PhysicalSystem PrincipalU1Bundle where
src/vol-02-structural-families/Instances.hs:307: instance FamilyPrincipalBundlesConnections PrincipalU1Bundle where
src/vol-02-structural-families/Instances.hs:331: instance PhysicalSystem ClassicalStatisticalSystem where
src/vol-02-structural-families/Instances.hs:343: instance FamilyProbabilityMeasure ClassicalStatisticalSystem where
src/vol-02-structural-families/Instances.hs:358: instance PhysicalSystem TopologicalQFTSystem where
src/vol-02-structural-families/Instances.hs:370: instance FamilyTopologicalHigherCategorical TopologicalQFTSystem where
src/vol-02-structural-families/Instances.hs:392: instance PhysicalSystem QuantumChannelSystem where
src/vol-02-structural-families/Instances.hs:404: instance FamilyDynamicalSemigroups QuantumChannelSystem where
src/vol-02-structural-families/Instances.hs:440: instance PhysicalSystem SymmetricTensorCategorySystem where
src/vol-02-structural-families/Instances.hs:452: instance FamilyTensorCategoriesComposition SymmetricTensorCategorySystem where
src/vol-02-structural-families/Instances.hs:467: instance PhysicalSystem LatticeGaugeSystem where
src/vol-02-structural-families/Instances.hs:479: instance FamilyDiscreteCombinatorial LatticeGaugeSystem where
src/vol-02-structural-families/Instances.hs:494: instance PhysicalSystem DerivedAlgebraSystem where
src/vol-02-structural-families/Instances.hs:506: instance FamilyDerivedHomotopical DerivedAlgebraSystem where
src/vol-03-irreducibility-decomposition/Instances.hs:213: instance Irreducible MatrixBlock where
src/vol-03-irreducibility-decomposition/Instances.hs:218: instance Irreducible FiniteDimCStar where
src/vol-03-irreducibility-decomposition/Instances.hs:224: instance Decomposable FiniteDimCStar where
src/vol-03-irreducibility-decomposition/Instances.hs:231: instance Decomposable MatrixBlock where
src/vol-03-irreducibility-decomposition/Instances.hs:238: instance Constructible FiniteDimCStar where
src/vol-03-irreducibility-decomposition/Instances.hs:249: instance Constructible MatrixBlock where
src/vol-03-irreducibility-decomposition/Instances.hs:260: instance FamilyHilbertOperatorAlgebras MatrixBlock where
src/vol-03-irreducibility-decomposition/Instances.hs:266: instance FamilyHilbertOperatorAlgebras FiniteDimCStar where
src/vol-03-irreducibility-decomposition/Instances.hs:273: instance FamilyDynamicalSemigroups KrausNormalForm where
src/vol-03-irreducibility-decomposition/Instances.hs:279: instance FamilyTensorCategoriesComposition TwoQubitSystem where
src/vol-03-irreducibility-decomposition/Instances.hs:285: instance MathematicalEquivalence FiniteDimCStar where
src/vol-04-yoneda-classification/Instances.hs:96: instance PhysicalSystem CompactHausdorffSystem where
src/vol-04-yoneda-classification/Instances.hs:108: instance FamilySmoothGeometric CompactHausdorffSystem where
src/vol-04-yoneda-classification/Instances.hs:112: instance FamilyHilbertOperatorAlgebras CompactHausdorffSystem where
src/vol-04-yoneda-classification/Instances.hs:116: instance MathematicalEquivalence CompactHausdorffSystem where
src/vol-04-yoneda-classification/Instances.hs:119: instance PhysicalEquivalence CompactHausdorffSystem where
src/vol-04-yoneda-classification/Instances.hs:132: instance PhysicalSystem BooleanAlgebraSystem where
src/vol-04-yoneda-classification/Instances.hs:144: instance FamilyDiscreteCombinatorial BooleanAlgebraSystem where
src/vol-04-yoneda-classification/Instances.hs:148: instance MathematicalEquivalence BooleanAlgebraSystem where
src/vol-04-yoneda-classification/Instances.hs:151: instance PhysicalEquivalence BooleanAlgebraSystem where
src/vol-04-yoneda-classification/Instances.hs:166: instance PhysicalSystem FiniteGroupRepSystem where
src/vol-04-yoneda-classification/Instances.hs:178: instance FamilyTensorCategoriesComposition FiniteGroupRepSystem where
src/vol-04-yoneda-classification/Instances.hs:182: instance MathematicalEquivalence FiniteGroupRepSystem where
src/vol-04-yoneda-classification/Instances.hs:185: instance PhysicalEquivalence FiniteGroupRepSystem where
src/vol-04-yoneda-classification/Instances.hs:188: instance Constructible FiniteGroupRepSystem where
src/vol-04-yoneda-classification/Instances.hs:197: instance Irreducible FiniteGroupRepSystem where
src/vol-04-yoneda-classification/Instances.hs:200: instance Decomposable FiniteGroupRepSystem where
src/vol-04-yoneda-classification/Instances.hs:294: instance PhysicalSystem QuantumChannelSystem where
src/vol-04-yoneda-classification/Instances.hs:306: instance FamilyHilbertOperatorAlgebras QuantumChannelSystem where
src/vol-04-yoneda-classification/Instances.hs:310: instance FamilyDynamicalSemigroups QuantumChannelSystem where
src/vol-04-yoneda-classification/Instances.hs:314: instance MathematicalEquivalence QuantumChannelSystem where
src/vol-04-yoneda-classification/Instances.hs:317: instance PhysicalEquivalence QuantumChannelSystem where
src/vol-04-yoneda-classification/Instances.hs:320: instance Constructible QuantumChannelSystem where
src/vol-04-yoneda-classification/Instances.hs:337: instance Irreducible QuantumChannelSystem where
src/vol-04-yoneda-classification/Instances.hs:340: instance Decomposable QuantumChannelSystem where
src/vol-05-classical-systems/Instances.hs:214: instance PhysicalSystem SymplecticSystem where
src/vol-05-classical-systems/Instances.hs:227: instance PhysicalSystem PoissonSystem where
src/vol-05-classical-systems/Instances.hs:240: instance PhysicalSystem HamiltonianSystem where
src/vol-05-classical-systems/Instances.hs:253: instance PhysicalSystem ClassicalStatisticalSystem where
src/vol-05-classical-systems/Instances.hs:267: instance FamilySymplecticPoisson SymplecticSystem where
src/vol-05-classical-systems/Instances.hs:272: instance FamilySymplecticPoisson PoissonSystem where
src/vol-05-classical-systems/Instances.hs:278: instance FamilySymplecticPoisson HamiltonianSystem where
src/vol-05-classical-systems/Instances.hs:284: instance FamilyProbabilityMeasure ClassicalStatisticalSystem where
src/vol-05-classical-systems/Instances.hs:291: instance Constructible SymplecticSystem where
src/vol-05-classical-systems/Instances.hs:302: instance Decomposable SymplecticSystem where
src/vol-05-classical-systems/Instances.hs:307: instance Irreducible SymplecticSurface where
src/vol-05-classical-systems/Instances.hs:314: instance MathematicalEquivalence SymplecticSystem where
src/vol-06-quantum-systems/Instances.hs:270: instance PhysicalSystem QuantumSystemRecord where
src/vol-06-quantum-systems/Instances.hs:283: instance FamilyHilbertOperatorAlgebras QuantumSystemRecord where
src/vol-06-quantum-systems/Instances.hs:289: instance FamilyHilbertOperatorAlgebras FactorDescriptor where
src/vol-06-quantum-systems/Instances.hs:296: instance FamilyDynamicalSemigroups ChannelDescriptor where
src/vol-06-quantum-systems/Instances.hs:303: instance FamilyProbabilityMeasure DensityMatrixSystem where
src/vol-06-quantum-systems/Instances.hs:309: instance FamilyTensorCategoriesComposition SuperselectionSystem where
src/vol-06-quantum-systems/Instances.hs:315: instance Constructible FiniteDimCStar where
src/vol-06-quantum-systems/Instances.hs:327: instance Decomposable FiniteDimCStar where
src/vol-06-quantum-systems/Instances.hs:336: instance Irreducible MatrixBlock where
src/vol-06-quantum-systems/Instances.hs:342: instance MathematicalEquivalence FiniteDimCStar where
src/vol-07-gauge-qft/Instances.hs:234: instance PhysicalSystem PrincipalBundleSystem where
src/vol-07-gauge-qft/Instances.hs:249: instance FamilyPrincipalBundlesConnections PrincipalBundleSystem where
src/vol-07-gauge-qft/Instances.hs:255: instance FamilyTopologicalHigherCategorical FrobeniusSystem where
src/vol-07-gauge-qft/Instances.hs:260: instance FamilyTensorCategoriesComposition SectorSystem where
src/vol-07-gauge-qft/Instances.hs:268: instance Constructible PrincipalBundleSystem where
src/vol-08-spacetime-reconstruction/Instances.hs:161: instance PhysicalSystem LorentzianSpacetime where
src/vol-08-spacetime-reconstruction/Instances.hs:173: instance FamilySmoothGeometric LorentzianSpacetime where
src/vol-08-spacetime-reconstruction/Instances.hs:181: instance MathematicalEquivalence LorentzianSpacetime where
src/vol-08-spacetime-reconstruction/Instances.hs:203: instance FamilySmoothGeometric ThurstonGeometry3 where
src/vol-08-spacetime-reconstruction/Instances.hs:233: instance PhysicalSystem HolographicEntropyVector where
src/vol-08-spacetime-reconstruction/Instances.hs:245: instance FamilyProbabilityMeasure HolographicEntropyVector where
src/vol-09-gravity-information-geometry/Instances.hs:148: instance FamilyProbabilityMeasure ClassicalStatisticalModel where
src/vol-09-gravity-information-geometry/Instances.hs:154: instance FamilyProbabilityMeasure QuantumStateSystem where
src/vol-09-gravity-information-geometry/Instances.hs:160: instance FamilyHilbertOperatorAlgebras QuantumStateSystem where
src/vol-09-gravity-information-geometry/Instances.hs:166: instance FamilyHilbertOperatorAlgebras EntanglementWedgeSystem where
src/vol-09-gravity-information-geometry/Instances.hs:172: instance FamilyTensorCategoriesComposition EntanglementWedgeSystem where
src/vol-09-gravity-information-geometry/Instances.hs:178: instance FamilyProbabilityMeasure ThermodynamicGeometrySystem where
src/vol-09-gravity-information-geometry/Instances.hs:184: instance FamilySmoothGeometric ThermodynamicGeometrySystem where
src/vol-09-gravity-information-geometry/Instances.hs:190: instance FamilyDiscreteCombinatorial WeightedNerveModel where
src/vol-09-gravity-information-geometry/Instances.hs:196: instance FamilySmoothGeometric WeightedNerveModel where
src/vol-09-gravity-information-geometry/Instances.hs:203: instance PhysicalSystem ClassicalStatisticalModel where
src/vol-09-gravity-information-geometry/Instances.hs:216: instance PhysicalSystem QuantumStateSystem where
src/vol-09-gravity-information-geometry/Instances.hs:229: instance PhysicalSystem EntanglementWedgeSystem where
src/vol-09-gravity-information-geometry/Instances.hs:242: instance PhysicalSystem ThermodynamicGeometrySystem where
src/vol-09-gravity-information-geometry/Instances.hs:256: instance PhysicalSystem WeightedNerveModel where
src/vol-09-gravity-information-geometry/Instances.hs:271: instance Decomposable ClassicalStatisticalModel where
src/vol-09-gravity-information-geometry/Instances.hs:280: instance Decomposable EntanglementWedgeSystem where
src/vol-10-observational-equivalence/Instances.hs:77: instance PhysicalSystem FiniteClassicalSystem where
src/vol-10-observational-equivalence/Instances.hs:93: instance FamilyProbabilityMeasure FiniteClassicalSystem where
src/vol-10-observational-equivalence/Instances.hs:120: instance MathematicalEquivalence ObservationRecord where
src/vol-10-observational-equivalence/Instances.hs:126: instance PhysicalEquivalence ObservationRecord where
src/vol-10-observational-equivalence/Instances.hs:167: instance FamilyHilbertOperatorAlgebras FiniteQuantumSystem where
src/vol-10-observational-equivalence/Instances.hs:176: instance FamilyProbabilityMeasure FiniteQuantumSystem where
src/vol-10-observational-equivalence/Instances.hs:235: instance FamilyTensorCategoriesComposition IsocategoricalWitness where
src/vol-11-completeness-obstructions/Instances.hs:192: instance FamilyHilbertOperatorAlgebras WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs:199: instance FamilyDerivedHomotopical WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs:204: instance FamilyTensorCategoriesComposition WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs:211: instance FamilySmoothGeometric WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs:217: instance FamilyDiscreteCombinatorial WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs:225: instance Constructible WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs:239: instance Irreducible WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs:247: instance Decomposable WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs:255: instance MathematicalEquivalence WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs:266: instance PhysicalEquivalence WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs:272: instance FamilyDynamicalSemigroups WitnessSystem where
src/vol-12-principia-physica/Instances.hs:158: instance PhysicalSystem FiniteDimQuantumExample where
src/vol-12-principia-physica/Instances.hs:170: instance FamilyHilbertOperatorAlgebras FiniteDimQuantumExample where
src/vol-12-principia-physica/Instances.hs:174: instance Irreducible MatrixBlock where
src/vol-12-principia-physica/Instances.hs:177: instance Decomposable FiniteDimQuantumExample where
src/vol-12-principia-physica/Instances.hs:185: instance MathematicalEquivalence FiniteDimQuantumExample where

exec
/usr/local/bin/zsh -lc "sed -n '336,630p' lean/Cmrps/Vol01Foundations.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
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

exec
/usr/local/bin/zsh -lc "sed -n '266,420p' lean/Cmrps/Vol02StructuralFamilies.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
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

/-- Membership in a multiset product (thin alias for Mathlib's `Multiset.mem_product`). -/
private theorem mem_product {v w : Multiset ℕ} {p : ℕ × ℕ} :
    p ∈ (v ×ˢ w) ↔ p.1 ∈ v ∧ p.2 ∈ w :=
  Multiset.mem_product

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


exec
/usr/local/bin/zsh -lc "sed -n '631,808p' lean/Cmrps/Vol01Foundations.lean
" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
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
/usr/local/bin/zsh -lc "sed -n '421,690p' lean/Cmrps/Vol02StructuralFamilies.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
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

/-- The deformation retraction `r_t(x, ξ) = (x, tξ)`, formalized on the *trivial product
bundle* `Q × V`. **Scope caveat (Codex review, round 2):** a general cotangent bundle
`T*Q` is not globally a product `Q × V`; the paper's Proposition 4.1 in full generality
is NOT formalized here, only its product-bundle fragment. -/
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

/-- Paper Proposition 4.1, *product-bundle fragment*: the zero section of the trivial
bundle `Q × V` is a deformation retract; the data above (continuity of `r_t`,
`r_1 = id`, `r_0` through the zero section, `r_s ∘ r_t = r_{st}`, and the fixed zero
section) is the content of the fragment. The general cotangent bundle `T*Q` is not
globally a product, so the full proposition is NOT formalized (Codex review, round 2). -/
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

codex
The Lean layer has no matching declarations for the shared Haskell class interfaces, so every per-volume instance currently fails the literal mirror requirement. Lean also explicitly limits several results to combinatorics, conditional statements, or toy models; some Haskell comments and types omit those limits. I’m grouping the repeated mirror gaps and recording concrete counterexamples for the implementation bugs.
exec
/usr/local/bin/zsh -lc "sed -n '690,805p' lean/Cmrps/Vol02StructuralFamilies.lean
" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
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

/-- Subtype equivalence along an equality of sets (thin alias for Mathlib's
`Set.equivOfEq`, kept under the paper-facing name). -/
def subtypeEquivOfEq {γ : Type*} {s t : Set γ} (h : s = t) : ↥s ≃ ↥t :=
  Set.equivOfEq h

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
/usr/local/bin/zsh -lc "sed -n '420,477p' lean/Cmrps/Vol08SpacetimeReconstruction.lean
" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
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
/usr/local/bin/zsh -lc "sed -n '1,110p' lean/Cmrps/Vol09GravityInformationGeometry.lean
" in /Users/mlong/Documents/Development/classification-physical-systems
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

exec
/usr/local/bin/zsh -lc "sed -n '413,448p' lean/Cmrps/Vol10ObservationalEquivalence.lean
" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
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
/usr/local/bin/zsh -lc 'cat lean/Cmrps.lean src/vol-01-foundations/Main.hs' in /Users/mlong/Documents/Development/classification-physical-systems
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
-- | Entry point for the vol-01-foundations executable taxonomy layer.
-- Runs the instance demonstrations of "Instances". Computational evidence
-- only; nothing here is proof and nothing here is verified by Lean.
module Main (main) where

import Vol01Foundations.Instances (demo)

main :: IO ()
main = demo

exec
/usr/local/bin/zsh -lc "python3 -c 'from pathlib import Path
import re
for p in sorted(Path(\"src\").rglob(\"*.hs\")):
 ls=p.read_text().splitlines()
 vals=[]
 for i,l in enumerate(ls,1):
  if re.match(r\""'^[a-z]'"\\w*(?:\\s|"'$)",l) and not l.startswith(("module ","import ","class ","instance ","type ","data ","newtype ","deriving ")):
   n=l.split()[0]
   if not re.search(r"''^"+n+r"'"\\s*(?:\\n\\s*)?::\", \"\\n\".join(ls),re.M): vals.append((i,n))
 if vals: print(str(p), vals)
for p in sorted(Path(\"src\").rglob(\"*.hs\")):
 for i,l in enumerate(p.read_text().splitlines(),1):
  if re.match(r\""'^'"\\s+(?:[a-z]\\w*) .*?=\",l) and not re.match(r\""'^'"\\s+(?:type|in|let|case|if|else|then|where)\\b\",l):
   if \"where\" not in l: pass
'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 54ms:
src/vol-01-foundations/Instances.hs [(15, 'them'), (16, 'of'), (21, 'model'), (22, 'build'), (23, 'them')]
src/vol-11-completeness-obstructions/Instances.hs [(15, 'declares'), (16, 'redefines')]

exec
/usr/local/bin/zsh -lc "rg -n 'Darboux|WeinsteinSplitting|KKSSymplectic|MoserStability|MonodromyObstruction|ChentsovFisher|FisherExplicit|finite_dim_cstar|dimension_vector_|tensor_block_product|closure_semigroup|unital_star_hom_classification|outer_automorphism_permutation|states_direct_sum_join|module_factorization|kraus_normal_form_uniqueness|mcduff_uncountable|kraus_rank_normal_form|stinespring_minimal|petz_monotone_metrics|dr_reconstruction|killing_cartan_classification|global_form_distinction|principal_bundle_classification|characteristic_classes_pullback|highest_weight_classification|bundle_sphere_classification|anomaly_obstruction_vanishing|frobenius_correspondence|petz_metric_sld|petz_metric_wy|bures_qubit_round_sphere' src -g '*.hs'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
src/vol-03-irreducibility-decomposition/Instances.hs:67:-- finite_dim_cstar_block_decomposition.
src/vol-03-irreducibility-decomposition/Instances.hs:73:-- (dimension vector) and lean targets dimension_vector_complete_invariant and
src/vol-03-irreducibility-decomposition/Instances.hs:74:-- dimension_vector_uniqueness.
src/vol-03-irreducibility-decomposition/Instances.hs:95:-- Computational evidence for lean target dimension_vector_complete_invariant.
src/vol-03-irreducibility-decomposition/Instances.hs:100:-- Proposition 8.1 and lean target tensor_block_product.
src/vol-03-irreducibility-decomposition/Instances.hs:112:-- closure_semigroup.
src/vol-03-irreducibility-decomposition/Instances.hs:122:-- 4.1 and lean target unital_star_hom_classification.
src/vol-03-irreducibility-decomposition/Instances.hs:143:-- outer_automorphism_permutation. The result lists the admissible
src/vol-03-irreducibility-decomposition/Instances.hs:160:-- states_direct_sum_join.
src/vol-03-irreducibility-decomposition/Instances.hs:169:-- target module_factorization.
src/vol-03-irreducibility-decomposition/Instances.hs:178:-- lean target kraus_normal_form_uniqueness. The two fields differ exactly
src/Taxonomy/Families.hs:150:-- systems: classical mechanics. Local classification is trivial (Darboux
src/vol-07-gauge-qft/Instances.hs:89:-- killing_cartan_classification). Only the complex semisimple type is
src/vol-07-gauge-qft/Instances.hs:99:-- SU(2) and SO(3) (Example 4.4, lean target global_form_distinction) is
src/vol-07-gauge-qft/Instances.hs:134:    --   lean target principal_bundle_classification).
src/vol-07-gauge-qft/Instances.hs:137:    --   lean target characteristic_classes_pullback).
src/vol-07-gauge-qft/Instances.hs:140:    --   (Theorem 3.2, lean target highest_weight_classification).
src/vol-07-gauge-qft/Instances.hs:154:-- | Proposition 4.3 (lean target bundle_sphere_classification): the
src/vol-07-gauge-qft/Instances.hs:188:-- (lean target anomaly_obstruction_vanishing).
src/vol-07-gauge-qft/Instances.hs:200:-- algebra (paper, Theorem 6.1, lean target frobenius_correspondence). The
src/vol-07-gauge-qft/Instances.hs:213:-- dr_reconstruction_hypotheses); Nothing means the hypotheses are not
src/vol-09-gravity-information-geometry/Instances.hs:67:    -- ^ f(t) = (1+t)/2; lean target petz_metric_sld.
src/vol-09-gravity-information-geometry/Instances.hs:69:    -- ^ f(t) = (1/4)(1 + sqrt t)^2; lean target petz_metric_wy.
src/vol-09-gravity-information-geometry/Instances.hs:72:    -- target bures_qubit_round_sphere.
src/vol-06-quantum-systems/Instances.hs:94:-- lean target finite_dim_cstar_dimensionVector_classifies).
src/vol-06-quantum-systems/Instances.hs:111:-- finite_dim_cstar_dimensionVector_classifies).
src/vol-06-quantum-systems/Instances.hs:184:-- lean target mcduff_uncountable_II1): separable type II_1 factors are
src/vol-06-quantum-systems/Instances.hs:217:-- kraus_rank_normal_form). Not an isomorphism invariant of channels.
src/vol-06-quantum-systems/Instances.hs:222:-- target stinespring_minimal_dilation_unique).
src/vol-06-quantum-systems/Instances.hs:228:-- petz_monotone_metrics). The normalization condition is f(t) = t f(1/t);
src/vol-06-quantum-systems/Instances.hs:251:-- dr_reconstruction).
src/vol-05-classical-systems/Instances.hs:14:-- mechanization targets (Darboux, WeinsteinSplitting, KKSSymplectic,
src/vol-05-classical-systems/Instances.hs:15:-- MoserStability, MonodromyObstruction, ChentsovFisher, FisherExplicit).
src/vol-05-classical-systems/Instances.hs:115:-- | Lean target 'Darboux': the Darboux normal form at any point is the
src/vol-05-classical-systems/Instances.hs:122:-- | Lean target 'WeinsteinSplitting': the rank split of a Poisson tensor at a
src/vol-05-classical-systems/Instances.hs:131:-- | Lean target 'KKSSymplectic': the Kirillov-Kostant-Souriau form on the
src/vol-05-classical-systems/Instances.hs:138:-- | Lean target 'MoserStability': the hypothesis of the theorem is that the
src/vol-05-classical-systems/Instances.hs:145:-- | Lean target 'MonodromyObstruction': the monodromy matrix of the spherical
src/vol-05-classical-systems/Instances.hs:152:-- | Lean target 'FisherExplicit' and 'ChentsovFisher': the Fisher metric

exec
/usr/local/bin/zsh -lc "rg -n 'moduleFactorization|closureSemigroup|statesDirectSum|unitalStarHoms|krausRankOf|unitaryChannelFamily|binaryFisherMetric|cotangentRetractFibers|"'^data AchievementKind|''^data ClassificationRecord|''^fisherMetric |''^rankRational|''^partitionsIntoSquares|''^preservedLayersOf|''^  composition|''^  quotientReduction|''^  mathematicallyEquivalent|''^regimeOf|''^classifyingInvariantOf|''^classicalCharacteristicRing|''^quantizationGate|''^  irreducibilityBasis ::|''^monotoneQuadraticForm|''^commutativeRestrictionCheck'"' src -g '*.hs'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
src/vol-02-structural-families/Instances.hs:26:  , cotangentRetractFibers
src/vol-02-structural-families/Instances.hs:39:  , binaryFisherMetric
src/vol-02-structural-families/Instances.hs:45:  , unitaryChannelFamily
src/vol-02-structural-families/Instances.hs:46:  , krausRankOf
src/vol-02-structural-families/Instances.hs:95:  composition _ = DirectSum
src/vol-02-structural-families/Instances.hs:120:  composition _ = DirectSum
src/vol-02-structural-families/Instances.hs:130:cotangentRetractFibers :: Int -> [(Double, String)]
src/vol-02-structural-families/Instances.hs:131:cotangentRetractFibers n =
src/vol-02-structural-families/Instances.hs:181:  composition _ = TensorProduct
src/vol-02-structural-families/Instances.hs:201:  quotientReduction _ _ = Nothing
src/vol-02-structural-families/Instances.hs:223:  mathematicallyEquivalent a b =
src/vol-02-structural-families/Instances.hs:250:  composition _ = TensorProduct
src/vol-02-structural-families/Instances.hs:277:  composition _ = DirectSum
src/vol-02-structural-families/Instances.hs:305:  composition _ = TensorProduct
src/vol-02-structural-families/Instances.hs:324:binaryFisherMetric :: ClassicalStatisticalSystem -> Maybe Double
src/vol-02-structural-families/Instances.hs:325:binaryFisherMetric s
src/vol-02-structural-families/Instances.hs:341:  composition _ = TensorProduct
src/vol-02-structural-families/Instances.hs:345:  probabilityMeasureData = binaryFisherMetric
src/vol-02-structural-families/Instances.hs:368:  composition _ = TensorProduct
src/vol-02-structural-families/Instances.hs:402:  composition _ = TensorProduct
src/vol-02-structural-families/Instances.hs:406:  dynamicalSemigroupData = krausRankOf
src/vol-02-structural-families/Instances.hs:411:krausRankOf :: QuantumChannelSystem -> Int
src/vol-02-structural-families/Instances.hs:412:krausRankOf q = maximum (1 : map length (krausOperators q))
src/vol-02-structural-families/Instances.hs:419:unitaryChannelFamily :: [Double] -> QuantumChannelSystem
src/vol-02-structural-families/Instances.hs:420:unitaryChannelFamily phases =
src/vol-02-structural-families/Instances.hs:450:  composition _ = TensorProduct
src/vol-02-structural-families/Instances.hs:477:  composition _ = DirectSum
src/vol-02-structural-families/Instances.hs:504:  composition _ = DirectSum
src/vol-02-structural-families/Instances.hs:539:data AchievementKind
src/vol-02-structural-families/Instances.hs:548:data ClassificationRecord = ClassificationRecord
src/vol-12-principia-physica/Instances.hs:168:  composition ex = [DirectSum | length (exampleBlocks ex) > 1]
src/vol-12-principia-physica/Instances.hs:190:  mathematicallyEquivalent a b =
src/vol-12-principia-physica/Instances.hs:199:  mathematicallyEquivalent (FiniteDimQuantumExample [2, 1])
src/vol-04-yoneda-classification/Instances.hs:106:  composition = chsComposition
src/vol-04-yoneda-classification/Instances.hs:117:  mathematicallyEquivalent a b = chsIsoKey a == chsIsoKey b
src/vol-04-yoneda-classification/Instances.hs:142:  composition = const "direct sum of clopen data"
src/vol-04-yoneda-classification/Instances.hs:149:  mathematicallyEquivalent a b = basIsoKey a == basIsoKey b
src/vol-04-yoneda-classification/Instances.hs:176:  composition = const "tensor product of representations"
src/vol-04-yoneda-classification/Instances.hs:183:  mathematicallyEquivalent a b = fgrIsoKey a == fgrIsoKey b
src/vol-04-yoneda-classification/Instances.hs:195:  quotientReduction _ _ = Nothing
src/vol-04-yoneda-classification/Instances.hs:304:  composition   = qcsComposition
src/vol-04-yoneda-classification/Instances.hs:315:  mathematicallyEquivalent a b = qcsIsoKey a == qcsIsoKey b
src/vol-04-yoneda-classification/Instances.hs:335:  quotientReduction _ _ = Nothing
src/vol-10-observational-equivalence/Instances.hs:87:  composition _ = uncurry (zipWith (*))
src/vol-10-observational-equivalence/Instances.hs:121:  mathematicallyEquivalent = (==)
src/vol-10-observational-equivalence/Instances.hs:185:monotoneQuadraticForm
src/vol-10-observational-equivalence/Instances.hs:190:monotoneQuadraticForm f lams rows =
src/vol-10-observational-equivalence/Instances.hs:204:commutativeRestrictionCheck
src/vol-10-observational-equivalence/Instances.hs:209:commutativeRestrictionCheck f lams rows =
src/vol-10-observational-equivalence/Instances.hs:247:preservedLayersOf :: IsocategoricalWitness -> [PreservedStructure]
src/vol-10-observational-equivalence/Instances.hs:248:preservedLayersOf w
src/vol-03-irreducibility-decomposition/Instances.hs:33:  , closureSemigroup
src/vol-03-irreducibility-decomposition/Instances.hs:36:  , unitalStarHoms
src/vol-03-irreducibility-decomposition/Instances.hs:39:  , statesDirectSum
src/vol-03-irreducibility-decomposition/Instances.hs:40:  , moduleFactorization
src/vol-03-irreducibility-decomposition/Instances.hs:113:closureSemigroup :: [Int] -> Int -> [Int]
src/vol-03-irreducibility-decomposition/Instances.hs:114:closureSemigroup seeds bound = go [1]
src/vol-03-irreducibility-decomposition/Instances.hs:130:unitalStarHoms :: FiniteDimCStar -> FiniteDimCStar -> MultiplicityMatrix -> Bool
src/vol-03-irreducibility-decomposition/Instances.hs:131:unitalStarHoms dom cod (MultiplicityMatrix rows) =
src/vol-03-irreducibility-decomposition/Instances.hs:161:statesDirectSum :: Double -> FiniteDimCStar -> Maybe (Double, [Double])
src/vol-03-irreducibility-decomposition/Instances.hs:162:statesDirectSum lambda (FiniteDimCStar bs)
src/vol-03-irreducibility-decomposition/Instances.hs:170:moduleFactorization :: FiniteDimCStar -> [Int] -> Maybe [Int]
src/vol-03-irreducibility-decomposition/Instances.hs:171:moduleFactorization (FiniteDimCStar bs) dims
src/vol-03-irreducibility-decomposition/Instances.hs:246:  quotientReduction _ _ = Nothing
src/vol-03-irreducibility-decomposition/Instances.hs:256:  quotientReduction _ _ = Nothing
src/vol-03-irreducibility-decomposition/Instances.hs:286:  mathematicallyEquivalent = dimensionVectorComplete
src/vol-05-classical-systems/Instances.hs:154:fisherMetric :: ProbVector -> [Rational] -> [Rational] -> Maybe Rational
src/vol-05-classical-systems/Instances.hs:155:fisherMetric (ProbVector ps) us vs
src/vol-05-classical-systems/Instances.hs:161:rankRational :: [[Rational]] -> Int
src/vol-05-classical-systems/Instances.hs:162:rankRational [] = 0
src/vol-05-classical-systems/Instances.hs:163:rankRational mat = go 0 mat
src/vol-05-classical-systems/Instances.hs:224:  composition _ = TensorProduct
src/vol-05-classical-systems/Instances.hs:237:  composition _ = TensorProduct
src/vol-05-classical-systems/Instances.hs:250:  composition = composition . hamiltonianBase
src/vol-05-classical-systems/Instances.hs:263:  composition _ = DirectSum
src/vol-05-classical-systems/Instances.hs:298:  quotientReduction _ s = Just s
src/vol-05-classical-systems/Instances.hs:315:  mathematicallyEquivalent s1 s2 = symplecticForm s1 == symplecticForm s2
src/vol-08-spacetime-reconstruction/Instances.hs:171:  composition _ = ProductGluing
src/vol-08-spacetime-reconstruction/Instances.hs:182:  mathematicallyEquivalent a b =
src/vol-08-spacetime-reconstruction/Instances.hs:243:  composition _ = DisjointUnion
src/vol-07-gauge-qft/Instances.hs:149:classifyingInvariantOf
src/vol-07-gauge-qft/Instances.hs:151:classifyingInvariantOf p =
src/vol-07-gauge-qft/Instances.hs:166:classicalCharacteristicRing :: GaugeGroup -> String
src/vol-07-gauge-qft/Instances.hs:167:classicalCharacteristicRing U1  = "Z[c1]"
src/vol-07-gauge-qft/Instances.hs:168:classicalCharacteristicRing SU2 = "Z[c2]"
src/vol-07-gauge-qft/Instances.hs:169:classicalCharacteristicRing SO3 = "Z[p1, w2, e]"
src/vol-07-gauge-qft/Instances.hs:170:classicalCharacteristicRing U2  = "Z[c1, c2]"
src/vol-07-gauge-qft/Instances.hs:171:classicalCharacteristicRing SU3 = "Z[c2, c3]"
src/vol-07-gauge-qft/Instances.hs:196:quantizationGate :: AnomalyData -> Bool
src/vol-07-gauge-qft/Instances.hs:197:quantizationGate a = determinantLineTrivializable a && anomalyFree a
src/vol-07-gauge-qft/Instances.hs:245:  composition _ = [Quotient GaugeQuotient, Extension FieldTheoreticExtension]
src/vol-07-gauge-qft/Instances.hs:281:  quotientReduction _ p = Just p
src/vol-06-quantum-systems/Instances.hs:118:partitionsIntoSquares :: Int -> [[Int]]
src/vol-06-quantum-systems/Instances.hs:119:partitionsIntoSquares = go 1
src/vol-06-quantum-systems/Instances.hs:280:  composition = compositionSpec
src/vol-06-quantum-systems/Instances.hs:322:  quotientReduction _ _ = Nothing
src/vol-06-quantum-systems/Instances.hs:337:  irreducibilityBasis :: MatrixBlock -> Construction
src/vol-06-quantum-systems/Instances.hs:343:  mathematicallyEquivalent = isomorphicByDimensionVector
src/vol-09-gravity-information-geometry/Instances.hs:213:  composition _ = ()
src/vol-09-gravity-information-geometry/Instances.hs:226:  composition _ = ()
src/vol-09-gravity-information-geometry/Instances.hs:239:  composition = boundaryRegions . wedgeData
src/vol-09-gravity-information-geometry/Instances.hs:252:  composition _ = ()
src/vol-09-gravity-information-geometry/Instances.hs:266:  composition _ = "tensor product of nerves"
src/vol-11-completeness-obstructions/Instances.hs:118:regimeOf :: WitnessSystem -> ClassificationRegime
src/vol-11-completeness-obstructions/Instances.hs:119:regimeOf (FiniteDimCStar _)        = ParameterizedRegime
src/vol-11-completeness-obstructions/Instances.hs:120:regimeOf (SimpleGroupWitness _)    = UnparameterizedRegime
src/vol-11-completeness-obstructions/Instances.hs:121:regimeOf (AmenableFactorWitness _) = ParameterizedRegime
src/vol-11-completeness-obstructions/Instances.hs:122:regimeOf (GeneralII1Witness _)     = ObstructionCompleteRegime
src/vol-11-completeness-obstructions/Instances.hs:123:regimeOf (IsocategoricalPair _ _)  = ObstructionCompleteRegime
src/vol-11-completeness-obstructions/Instances.hs:124:regimeOf (FusionCategoryWitness _) = OpenRegime
src/vol-11-completeness-obstructions/Instances.hs:125:regimeOf (WildModuleWitness _)     = WildRegime
src/vol-11-completeness-obstructions/Instances.hs:126:regimeOf (MarkovGroupWitness _)    = UndecidableRegime
src/vol-11-completeness-obstructions/Instances.hs:127:regimeOf (FourManifoldWitness _)   = UndecidableRegime
src/vol-11-completeness-obstructions/Instances.hs:128:regimeOf (UnknotWitness _)         = DecidableButUnclassifiedRegime
src/vol-11-completeness-obstructions/Instances.hs:234:  quotientReduction _ _ = Nothing
src/vol-11-completeness-obstructions/Instances.hs:256:  mathematicallyEquivalent (FiniteDimCStar a) (FiniteDimCStar b) =
src/vol-11-completeness-obstructions/Instances.hs:258:  mathematicallyEquivalent (IsocategoricalPair a b) (IsocategoricalPair c d) =
src/vol-11-completeness-obstructions/Instances.hs:260:  mathematicallyEquivalent x y = x == y
src/Taxonomy/Families.hs:76:  composition :: p -> Composition p
src/Taxonomy/Families.hs:106:  composition = compositionData
src/vol-01-foundations/Instances.hs:149:  composition _ = DisjointUnionComposition
src/vol-01-foundations/Instances.hs:162:  composition _ = CartesianProductComposition
src/vol-01-foundations/Instances.hs:175:  composition _ = DisjointUnionComposition
src/vol-01-foundations/Instances.hs:188:  composition = bqsFactorization
src/vol-01-foundations/Instances.hs:193:  mathematicallyEquivalent a b = fsCardinality a == fsCardinality b
src/vol-01-foundations/Instances.hs:197:  mathematicallyEquivalent a b = fpsCardinality a == fpsCardinality b
src/vol-01-foundations/Instances.hs:204:  mathematicallyEquivalent a b =
src/vol-01-foundations/Instances.hs:212:  mathematicallyEquivalent a b =
src/vol-01-foundations/Instances.hs:245:  quotientReduction _ _ = Nothing
src/vol-01-foundations/Instances.hs:257:  quotientReduction _ _ = Nothing
src/vol-01-foundations/Instances.hs:275:  quotientReduction _ _ = Nothing
src/vol-01-foundations/Instances.hs:287:  quotientReduction _ _ = Nothing
src/Taxonomy/Equivalences.hs:84:  mathematicallyEquivalent :: p -> p -> Bool
src/Taxonomy/Constructions.hs:118:  quotientReduction :: QuotientKind -> p -> Maybe p
src/Taxonomy/Constructions.hs:129:  irreducibilityBasis :: p -> Construction

exec
/usr/local/bin/zsh -lc "sed -n '390,419p' lean/Cmrps/Vol08SpacetimeReconstruction.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:

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

codex
Reviewed only `.hs` files under `src/` and `.lean` files under `lean/`. This is a source review; I did not inspect build configuration or run builds.

1. **The shared classes have no matching Lean interfaces.** These declarations fail the requested name/type mirror:

   | Haskell declaration | Location |
   |---|---|
   | `PhysicalSystem` | `src/Taxonomy/Families.hs:51` |
   | `FamilySymplecticPoisson` | `src/Taxonomy/Families.hs:155` |
   | `FamilyHilbertOperatorAlgebras` | `src/Taxonomy/Families.hs:165` |
   | `FamilySmoothGeometric` | `src/Taxonomy/Families.hs:175` |
   | `FamilyPrincipalBundlesConnections` | `src/Taxonomy/Families.hs:185` |
   | `FamilyProbabilityMeasure` | `src/Taxonomy/Families.hs:196` |
   | `FamilyTopologicalHigherCategorical` | `src/Taxonomy/Families.hs:206` |
   | `FamilyDynamicalSemigroups` | `src/Taxonomy/Families.hs:217` |
   | `FamilyTensorCategoriesComposition` | `src/Taxonomy/Families.hs:228` |
   | `FamilyDiscreteCombinatorial` | `src/Taxonomy/Families.hs:238` |
   | `FamilyDerivedHomotopical` | `src/Taxonomy/Families.hs:249` |
   | `Constructible` | `src/Taxonomy/Constructions.hs:95` |
   | `Decomposable` | `src/Taxonomy/Constructions.hs:148` |
   | `MathematicalEquivalence` | `src/Taxonomy/Equivalences.hs:81` |
   | `PhysicalEquivalence` | `src/Taxonomy/Equivalences.hs:91` |
   | `Irreducible` | `src/Taxonomy/Constructions.hs:126` |

   The last name exists as a Lean **predicate**, `Cmrps.Vol02.Irreducible`, at `lean/Cmrps/Vol02StructuralFamilies.lean:653`; it is not the Haskell class that merely returns a construction tag.

   **Fix:** introduce matching Lean interfaces and explicit instance correspondences, including associated types and methods. A theorem about a related mathematical subject is insufficient.

2. **Consequently, every per-volume Haskell instance lacks a corresponding Lean interface instance.** The affected instance-bearing types are:

   | Haskell file | Types; first instance location |
   |---|---|
   | `src/vol-01-foundations/Instances.hs` | `FiniteStateSystem`:139; `FiniteProductSystem`:152; `FiniteDynamicalSystem`:165; `BipartiteQubitSystem`:178 |
   | `src/vol-02-structural-families/Instances.hs` | `SymplecticSystem`:85; `CotangentBundleSystem`:110; `FiniteCStarAlgebra`:171; `BinaryQuantumSystem`:240; `LorentzianSystem`:267; `PrincipalU1Bundle`:295; `ClassicalStatisticalSystem`:331; `TopologicalQFTSystem`:358; `QuantumChannelSystem`:392; `SymmetricTensorCategorySystem`:440; `LatticeGaugeSystem`:467; `DerivedAlgebraSystem`:494 |
   | `src/vol-03-irreducibility-decomposition/Instances.hs` | `MatrixBlock`:213; `FiniteDimCStar`:218; `KrausNormalForm`:273; `TwoQubitSystem`:279 |
   | `src/vol-04-yoneda-classification/Instances.hs` | `CompactHausdorffSystem`:96; `BooleanAlgebraSystem`:132; `FiniteGroupRepSystem`:166; `QuantumChannelSystem`:294 |
   | `src/vol-05-classical-systems/Instances.hs` | `SymplecticSystem`:214; `PoissonSystem`:227; `HamiltonianSystem`:240; `ClassicalStatisticalSystem`:253; `SymplecticSurface`:307 |
   | `src/vol-06-quantum-systems/Instances.hs` | `QuantumSystemRecord`:270; `FactorDescriptor`:289; `ChannelDescriptor`:296; `DensityMatrixSystem`:303; `SuperselectionSystem`:309; `FiniteDimCStar`:315; `MatrixBlock`:336 |
   | `src/vol-07-gauge-qft/Instances.hs` | `PrincipalBundleSystem`:234; `FrobeniusSystem`:255; `SectorSystem`:260 |
   | `src/vol-08-spacetime-reconstruction/Instances.hs` | `LorentzianSpacetime`:161; `ThurstonGeometry3`:203; `HolographicEntropyVector`:233 |
   | `src/vol-09-gravity-information-geometry/Instances.hs` | `ClassicalStatisticalModel`:148; `QuantumStateSystem`:154; `EntanglementWedgeSystem`:166; `ThermodynamicGeometrySystem`:178; `WeightedNerveModel`:190 |
   | `src/vol-10-observational-equivalence/Instances.hs` | `FiniteClassicalSystem`:77; `ObservationRecord`:120; `FiniteQuantumSystem`:167; `IsocategoricalWitness`:235 |
   | `src/vol-11-completeness-obstructions/Instances.hs` | `WitnessSystem`:192 |
   | `src/vol-12-principia-physica/Instances.hs` | `FiniteDimQuantumExample`:158; `MatrixBlock`:174 |

   This applies to **all** instances for each listed type, not just its first instance. `ThurstonGeometry3` has a Lean namesake, but its family instance and constructor names still do not mirror Lean.

   **Fix:** add an explicit correspondence for every instance head; distinguish missing formal counterparts from existing conditional or model-level counterparts.

3. **Several shared data types also diverge materially.**

   - `src/Taxonomy/Families.hs:82`: Haskell `SystemRecord` stores component **values**; Lean `SystemRecord` stores five **types** (`lean/Cmrps/Vol10ObservationalEquivalence.lean:24`).
   - `src/Taxonomy/Families.hs:112`: `StructuralFamily` is a ten-tag enumeration; Lean’s namesake stores an object type (`lean/Cmrps/Vol02StructuralFamilies.lean:690`).
   - `src/Taxonomy/Equivalences.hs:38`: Haskell `MorphismKind` includes `EquivalenceMorphism`; the Lean enumeration at `lean/Cmrps/Vol10ObservationalEquivalence.lean:55` omits it.
   - `src/Taxonomy/Equivalences.hs:100`: Haskell `EquivalenceWitness` includes source/target values and a list of structures; Lean’s witness at `lean/Cmrps/Vol10ObservationalEquivalence.lean:80` has no endpoints and uses a set. `PreservedStructure` also has no exact counterpart for its separate `PlainTensorStructure` constructor.
   - `src/Taxonomy/Constructions.hs:137`: `Decomposition` stores an unchecked list, whereas Lean’s `DynDecomposition` requires nonemptiness, invariance, disjointness, coverage and connectivity (`lean/Cmrps/Vol01Foundations.lean:440`).
   - `src/Taxonomy/Invariants.hs:65`: `InvariantRecord` has matching component roles, but different field names from `lean/Cmrps/Vol12PrincipiaPhysica.lean:350`.

   **Fix:** align these representations or provide explicit, scoped conversions with documented information loss.

4. **Dimension vectors are not multisets in the shared Haskell API.** `src/Taxonomy/Invariants.hs:201` derives order-sensitive `Eq`/`Ord` for `[Int]`; Lean uses `Multiset ℕ` or `List.Perm`. Moreover, volume 11 sorts descending (`src/vol-11-completeness-obstructions/Instances.hs:176`), while other volumes sort ascending. The same invariant therefore compares unequal across volumes.

   **Fix:** hide the constructor, validate positive entries, and use one canonical ordering everywhere.

5. **Other invariant types admit values outside their stated mathematical domains.** `src/Taxonomy/Invariants.hs:216` permits invalid Dynkin ranks; `:237` permits fractional/negative “dominant integral” coordinates; `:256` permits nonpositive matrix sizes; `:264` permits invalid III parameters and duplicates `TypeIII1` through parameter `1`. Lean’s dominant weights explicitly require nonnegative integral coordinates (`lean/Cmrps/Vol07GaugeQft.lean:38`).

   **Fix:** use validated constructors and nonnegative integral weight coordinates; enforce the proper rank and parameter ranges.

6. **The achievement enumeration is incomplete.** `src/vol-02-structural-families/Instances.hs:539` has four constructors; Lean has five, including `noRecord` (`lean/Cmrps/Vol02StructuralFamilies.lean:191`). All four existing constructor names also differ. `ClassificationRecord` at Haskell `:548` is not Lean’s `FamilyRecord`: it lacks an actual invariant function, relation and law fields.

   **Fix:** add `NoRecord`, align constructor names through an explicit mapping, and distinguish descriptive metadata from a classification record satisfying the Lean specification.

7. **The remaining cited target names are not Lean declaration names.** The following references need correction or an explicit “unformalized target” label:

   | Haskell locations | Divergence and concrete replacement |
   |---|---|
   | `src/vol-03-irreducibility-decomposition/Instances.hs:67,73,74,95,100,112,122,143,160,169,178` | `finite_dim_cstar_block_decomposition`, `dimension_vector_complete_invariant`, `dimension_vector_uniqueness`, `tensor_block_product`, `closure_semigroup`, `unital_star_hom_classification`, `outer_automorphism_permutation`, `states_direct_sum_join`, `module_factorization`, `kraus_normal_form_uniqueness` are absent. Cite the actual `BlockAlg`, `finrank_blockAlg`, `dimVector_perm_invariant`, `finrank_tensor_blocks`, `sizeSemigroup`, `MultiplicityMatrix`, `blockPerm` declarations where applicable. State/module/Kraus uniqueness results have no corresponding development here. |
   | `src/vol-05-classical-systems/Instances.hs:115,122,131,138,145,152` | `Darboux`, `WeinsteinSplitting`, `KKSSymplectic`, `MoserStability`, `MonodromyObstruction`, `FisherExplicit`, `ChentsovFisher` are target labels, not declarations. Actual counterparts include `stdSymplecticForm`, `kksForm`, `pendulumMonodromy`, `fisherMetric`, `fisherMetric_product`; full manifold theorems remain unformalized. |
   | `src/vol-06-quantum-systems/Instances.hs:94,184,217,222,228,251` | The cited classification, McDuff, Kraus, Stinespring, Petz and DR names are absent. Use `dimvec_classifies_sorted` only for sorted block combinatorics; label the other results unformalized. |
   | `src/vol-07-gauge-qft/Instances.hs:89,99,134,137,140,154,188,200,213` | The cited Killing–Cartan, global-form, bundle, characteristic-class, highest-weight, anomaly, Frobenius and DR target names are absent. Actual fragments include `highestWeightRankOne`, `GlobalFormInvariant`, `SO3BundleClass`, `AnomalyObstruction`, `QuantizationGate`, `FrobeniusAlgebra`; they have narrower types/content. |
   | `src/vol-09-gravity-information-geometry/Instances.hs:67,69,72` | `petz_metric_sld`, `petz_metric_wy`, `bures_qubit_round_sphere` are absent. Cite `fSLD`/`fWY` for parameter formulas; the full hemisphere/fidelity statement is explicitly unmechanized. |

   Volume 1’s `vol01.…` labels are explicitly mapped to actual names in its Lean header; they are target identifiers, not direct Lean names.

8. **Cross-audit claims exceed the available correspondence.** `src/vol-01-foundations/Instances.hs:22`, `src/vol-03-irreducibility-decomposition/Instances.hs:19`, and `src/vol-10-observational-equivalence/Instances.hs:20` assert validation against kernel-checked specifications despite the missing interfaces and mismatches above. Volume 1 also asserts a clean Lean build using evidence outside the permitted review scope.

   **Fix:** say “computational evidence intended for comparison with the listed Lean fragments,” and identify the exact comparison and its limits. Negative statements such as “not verified by Lean” are not themselves overclaims.

9. **`Irreducible` asserts membership without checking irreducibility.** `src/Taxonomy/Constructions.hs:126` supplies only an operation tag. Instances cover reducible values—for example `FiniteStateSystem 2` (`src/vol-01-foundations/Instances.hs:291`) and multiblock algebras (`src/vol-02-structural-families/Instances.hs:205`).

   **Fix:** rename this hook to describe the decomposition operation, or expose an irreducibility predicate/validated wrapper. Require checked irreducible factors in decompositions.

10. **Finite dynamics has invalid equivalence and construction behavior.** `src/vol-01-foundations/Instances.hs:203,381` returns `False` even for self-equivalence above eight states. Missing map entries silently become identity mappings; duplicate states and maps leaving the state set are accepted. At `:265`, offsetting labels does not ensure disjointness when the second system contains negative labels.

    **Fix:** validate a finite set with a total endomap; report search limits as `Unknown`; use tagged disjoint unions or fresh canonical labels.

11. **Qubit operations are partial and omit factorization data.** `src/vol-01-foundations/Instances.hs:420` explicitly throws on any amplitude count other than four; `:211` rounds floating coefficients and ignores the supplied factorization. The factorization stores dimensions, whereas Lean models an actual coordinate transformation (`lean/Cmrps/Vol01Foundations.lean:659`). The comment at Haskell `:343` also strengthens a nonuniqueness example into “none can be” supplied.

    **Fix:** use a validated four-amplitude state and explicit factorization transformation; return a scoped numerical comparison, and describe the Lean result as a nonuniqueness witness.

12. **Zero-cardinality product decomposition is wrong.** `src/vol-01-foundations/Instances.hs:320` produces an empty factor list for cardinality zero, whose product is one. Lean requires nonzero cardinality (`lean/Cmrps/Vol01Foundations.lean:615`).

    **Fix:** reject zero for this operation and negative cardinalities at construction.

13. **The Kraus-rank example contradicts its claimed result.** `src/vol-02-structural-families/Instances.hs:412` takes the maximum inner-list length. Every sampled entry generated at `:420` has length two, so any nonempty sample reports rank **two**, despite the rank-one comment. The function also packages multiple sampled channels as one channel and does not construct full `2×2` unitary matrices. Lean uses a list of matrices and minimality (`lean/Cmrps/Vol02StructuralFamilies.lean:442,446`).

    **Fix:** return one channel per phase, with one full unitary Kraus operator per channel; compute/validate minimal rank or label it supplied metadata.

14. **The cotangent “retraction” computes labels only.** `src/vol-02-structural-families/Instances.hs:126` describes a homotopy, but returns strings; `n = 0` also creates a `NaN` parameter. Lean formalizes an actual map on a trivial product bundle, not arbitrary cotangent bundles (`lean/Cmrps/Vol02StructuralFamilies.lean:566,607`).

    **Fix:** implement point/fibre scaling with positive sampling resolution, or rename this a display-only parameter sample and state the product-bundle scope.

15. **The local symplectic classification comment is too broad.** `src/vol-02-structural-families/Instances.hs:72` says no local invariant is classifying. Lean explicitly explains that a constant invariant does classify the fixed-dimensional germ equivalence; its result is germ constancy (`lean/Cmrps/Vol02StructuralFamilies.lean:178`).

    **Fix:** distinguish classification of germs from classification of global systems.

16. **Multiplicity checks accept negative multiplicities.** `src/vol-03-irreducibility-decomposition/Instances.hs:131` checks column sums but not nonnegativity. With source sizes `[1,1]`, target `[1]`, rows `[[-1],[2]]` pass. Lean uses `ℕ` (`lean/Cmrps/Vol03IrreducibilityDecomposition.lean:53`).

    **Fix:** reject negative entries and validate positive block sizes.

17. **`moduleFactorization` silently drops invalid components and can divide by zero.** At `src/vol-03-irreducibility-decomposition/Instances.hs:171`, size `2` with module dimension `3` returns `Just []`; size `0` reaches `mod 0`.

    **Fix:** validate every block and divisibility condition before producing the entire multiplicity vector; otherwise return `Nothing`.

18. **`statesDirectSum` does not reconstruct the stated state.** `src/vol-03-irreducibility-decomposition/Instances.hs:162` returns uniform weights independent of `lambda`; no normalized block restrictions are inputs.

    **Fix:** accept the actual block states and compatible weights, or rename the output as illustrative weight metadata and remove the uniqueness assertion.

19. **Closure arithmetic can fail to terminate or overflow.** `src/vol-03-irreducibility-decomposition/Instances.hs:114` accepts negative seeds, uses overflowing `Int` products, duplicates discoveries, and returns `1` even below the bound. Removing zero also disagrees with Lean’s unrestricted `Set ℕ` closure.

    **Fix:** define the intended positive-size domain, use `Integer`/`Natural`, maintain a set, and enforce the bound consistently.

20. **The “typed” matrix fragment accepts malformed shapes.** `src/vol-04-yoneda-classification/Instances.hs:205,215,222,228,234,271` permits ragged matrices, truncates addition/multiplication through `zipWith`, and indexes rows unsafely. Channel dimensions need not match their Kraus operators. Lean uses dimension-indexed matrices.

    **Fix:** hide constructors, validate rectangularity and channel dimensions, and make incompatible operations return errors.

21. **Tensor constructions retain stale identity data.** `src/vol-04-yoneda-classification/Instances.hs:190` changes only the fusion label; group, category and equivalence keys remain those of the left operand. At `:333`, channel tensoring similarly preserves the original equivalence keys.

    **Fix:** construct the complete composite record and derive comparison data from it; return `Nothing` for unsupported symbolic constructions.

22. **Symplectic equivalence is unsound.** `src/vol-05-classical-systems/Instances.hs:315` treats equal chart matrices as a “conservative witness” of whole-system equivalence, ignoring manifold and Hamiltonians. Equal local matrices do not establish global equivalence.

    **Fix:** rename this as chart-matrix equality or require explicit whole-system equivalence data.

23. **Some construction hooks claim operations they do not perform.** `src/vol-05-classical-systems/Instances.hs:294` implements `directSum` as a product. Quotient hooks at `src/vol-05-classical-systems/Instances.hs:298` and `src/vol-07-gauge-qft/Instances.hs:281` return the unchanged input for every quotient kind.

    **Fix:** implement the named construction or return `Nothing`.

24. **Probability and metric inputs are unchecked.**

    - `src/vol-05-classical-systems/Instances.hs:155`: zero probabilities cause rational division by zero; simplex and tangent conditions are absent.
    - `src/vol-05-classical-systems/Instances.hs:170`: ragged Poisson matrices cause out-of-bounds indexing.
    - `src/vol-10-observational-equivalence/Instances.hs:190,209`: malformed matrices and zero denominators cause exceptions; the restriction check does not validate diagonality or normalization.
    - `src/vol-02-structural-families/Instances.hs:325`: ignores whether the outcome count is two and accepts `NaN`.

    **Fix:** validate matrix shapes, positive normalized distributions, required tangent conditions and parameter normalization before evaluation; return `Either`/`Maybe`.

25. **Volume 6 has additional type/status divergences.** `src/vol-06-quantum-systems/Instances.hs:228` calls self-reciprocity the normalization condition, omitting `f(1)=1`; Lean distinguishes them (`lean/Cmrps/Vol10ObservationalEquivalence.lean:349,353`). At Haskell `:194`, uncountably many factors is overstated as excluding *all* total classifications; Lean’s relevant obstruction is specifically about countable-range invariants (`lean/Cmrps/Vol11CompletenessObstructions.lean:143`). At Haskell `:119`, negative input reaches `floor (sqrt negative)`.

    **Fix:** separate normalization, self-reciprocity and monotonicity; qualify the obstruction; validate nonnegative enumeration inputs.

26. **Gauge data conflates different structures.** `src/vol-07-gauge-qft/Instances.hs:92` assigns `A₁` to `U(1)`; `:95` omits the abelian component of `U(2)`. At `:151`, “classifying invariant” drops global-form and characteristic-class **values**. At `:169`, `Z[p1,w2,e]` incorrectly mixes integral and mod-two characteristic data without relations.

    **Fix:** represent reductive Lie data and global form separately; carry actual characteristic classes and values; specify coefficient rings and relations.

27. **The anomaly model and quantization claim differ from Lean.** Haskell `AnomalyData` (`src/vol-07-gauge-qft/Instances.hs:176`) stores a determinant flag and two lists. Lean’s namesake stores an additive homomorphism; its separate `AnomalyObstruction` stores a BRST class (`lean/Cmrps/Vol07GaugeQft.lean:173,242`). Haskell `:192` further claims sufficient conditions for consistent quantization, while Lean defines an obstruction gate.

    **Fix:** align those distinct records and describe the Boolean as an obstruction check, not an existence/sufficiency result.

28. **The causal ladder and entropy-vector domain disagree with their comments.** `src/Taxonomy/Invariants.hs:315` omits causal continuity/simplicity while describing a complete ladder. The bridge at `src/vol-08-spacetime-reconstruction/Instances.hs:117` promises nearest-rung mapping but returns `Nothing`. Entropy-vector records claim arbitrary region counts at `:220`, while state labels and SSA/MMI checks are fixed to three regions (`:239,259`).

    **Fix:** complete the ladder or label it coarse; correct the bridge description; either restrict entropy vectors to exactly three regions or parameterize the region set.

29. **The entropy-cone scope conflicts across layers.** `src/vol-09-gravity-information-geometry/Instances.hs:93,117` says the established range includes five regions. `src/Taxonomy/Invariants.hs:327` and Lean’s spine (`lean/Cmrps/Vol12PrincipiaPhysica.lean:141`) place five-or-more regions outside the recorded completed range.

    **Fix:** reconcile the scope explicitly and avoid implying SSA/MMI completeness beyond the stated range.

30. **Proposed geometry and decomposition are presented as existing structure.** `src/vol-09-gravity-information-geometry/Instances.hs:196` gives every weighted-nerve model smooth-geometric membership despite its explicitly unestablished limit. At `:271`, a claimed decomposition over outcomes simply returns `[m]`.

    **Fix:** represent proposed geometric data separately from supplied geometry; implement outcome factors or return `Nothing`.

31. **Observation construction is partial, and composition loses probability mass.** `src/vol-10-observational-equivalence/Instances.hs:113` accepts invalid partition indices, causing exceptions or double-counting. At `:87`, pointwise multiplication is not the independent product distribution: `[1/2,1/2]` composed with itself sums to `1/2`.

    **Fix:** validate partitions and use the Cartesian-product distribution `[p*q | p <- ps, q <- qs]`.

32. **Preservation metadata invents a stronger layer.** `src/vol-10-observational-equivalence/Instances.hs:250` returns `SymmetricMonoidalStructure` whenever the specific plain-only condition fails—including when both equivalence flags are false.

    **Fix:** return only explicitly supported layers; reject inconsistent witness data.

33. **Volume 11 ignores its witness restriction and uses different names.** `src/vol-11-completeness-obstructions/Instances.hs:127` assigns undecidability to every `FourManifoldWitness n`, although its comment restricts the cited result to `n ≥ 9`. `ClassificationRegime` and all constructor names differ from Lean’s `Regime` (`lean/Cmrps/Vol11CompletenessObstructions.lean:113`).

    **Fix:** validate the threshold and map all seven constructors explicitly.

34. **`PrincipiaLayers` omits the architecture’s maps.** `src/vol-12-principia-physica/Instances.hs:102` stores three unrelated values; Lean stores three types plus `realize` and `select` maps (`lean/Cmrps/Vol12PrincipiaPhysica.lean:23`). Separate fields do not establish the claimed non-collapse. `Regime`/`EvidenceGrade` constructor names also differ from Lean’s `r1…r7` and `formulation/rigorous/validated`.

    **Fix:** include the maps and explicit constructor correspondences; describe separation as a supplied condition rather than a consequence of record shape.

35. **Language-extension requirements are not self-contained.** `src/vol-06-quantum-systems/Instances.hs:337` uses an instance signature without a local `InstanceSigs` pragma. Empty-type derivations at `src/Taxonomy/Invariants.hs:229` and similar declarations require `EmptyDataDeriving` unless supplied by the project language configuration.

    **Fix:** declare the required extensions locally or verify/document their build-level provision. Build configuration was outside the permitted scope.

No family class is redefined outside `src/Taxonomy/`. All top-level Haskell functions have type signatures. I found no separate non-exhaustive pattern match; the partiality findings above arise from explicit `error`, indexing, arithmetic and unchecked representations. No punctuation-style issues are reported.

VERDICT: NEEDS_FIX
hook: Stop
hook: Stop Completed
tokens used
214,607
Reviewed only `.hs` files under `src/` and `.lean` files under `lean/`. This is a source review; I did not inspect build configuration or run builds.

1. **The shared classes have no matching Lean interfaces.** These declarations fail the requested name/type mirror:

   | Haskell declaration | Location |
   |---|---|
   | `PhysicalSystem` | `src/Taxonomy/Families.hs:51` |
   | `FamilySymplecticPoisson` | `src/Taxonomy/Families.hs:155` |
   | `FamilyHilbertOperatorAlgebras` | `src/Taxonomy/Families.hs:165` |
   | `FamilySmoothGeometric` | `src/Taxonomy/Families.hs:175` |
   | `FamilyPrincipalBundlesConnections` | `src/Taxonomy/Families.hs:185` |
   | `FamilyProbabilityMeasure` | `src/Taxonomy/Families.hs:196` |
   | `FamilyTopologicalHigherCategorical` | `src/Taxonomy/Families.hs:206` |
   | `FamilyDynamicalSemigroups` | `src/Taxonomy/Families.hs:217` |
   | `FamilyTensorCategoriesComposition` | `src/Taxonomy/Families.hs:228` |
   | `FamilyDiscreteCombinatorial` | `src/Taxonomy/Families.hs:238` |
   | `FamilyDerivedHomotopical` | `src/Taxonomy/Families.hs:249` |
   | `Constructible` | `src/Taxonomy/Constructions.hs:95` |
   | `Decomposable` | `src/Taxonomy/Constructions.hs:148` |
   | `MathematicalEquivalence` | `src/Taxonomy/Equivalences.hs:81` |
   | `PhysicalEquivalence` | `src/Taxonomy/Equivalences.hs:91` |
   | `Irreducible` | `src/Taxonomy/Constructions.hs:126` |

   The last name exists as a Lean **predicate**, `Cmrps.Vol02.Irreducible`, at `lean/Cmrps/Vol02StructuralFamilies.lean:653`; it is not the Haskell class that merely returns a construction tag.

   **Fix:** introduce matching Lean interfaces and explicit instance correspondences, including associated types and methods. A theorem about a related mathematical subject is insufficient.

2. **Consequently, every per-volume Haskell instance lacks a corresponding Lean interface instance.** The affected instance-bearing types are:

   | Haskell file | Types; first instance location |
   |---|---|
   | `src/vol-01-foundations/Instances.hs` | `FiniteStateSystem`:139; `FiniteProductSystem`:152; `FiniteDynamicalSystem`:165; `BipartiteQubitSystem`:178 |
   | `src/vol-02-structural-families/Instances.hs` | `SymplecticSystem`:85; `CotangentBundleSystem`:110; `FiniteCStarAlgebra`:171; `BinaryQuantumSystem`:240; `LorentzianSystem`:267; `PrincipalU1Bundle`:295; `ClassicalStatisticalSystem`:331; `TopologicalQFTSystem`:358; `QuantumChannelSystem`:392; `SymmetricTensorCategorySystem`:440; `LatticeGaugeSystem`:467; `DerivedAlgebraSystem`:494 |
   | `src/vol-03-irreducibility-decomposition/Instances.hs` | `MatrixBlock`:213; `FiniteDimCStar`:218; `KrausNormalForm`:273; `TwoQubitSystem`:279 |
   | `src/vol-04-yoneda-classification/Instances.hs` | `CompactHausdorffSystem`:96; `BooleanAlgebraSystem`:132; `FiniteGroupRepSystem`:166; `QuantumChannelSystem`:294 |
   | `src/vol-05-classical-systems/Instances.hs` | `SymplecticSystem`:214; `PoissonSystem`:227; `HamiltonianSystem`:240; `ClassicalStatisticalSystem`:253; `SymplecticSurface`:307 |
   | `src/vol-06-quantum-systems/Instances.hs` | `QuantumSystemRecord`:270; `FactorDescriptor`:289; `ChannelDescriptor`:296; `DensityMatrixSystem`:303; `SuperselectionSystem`:309; `FiniteDimCStar`:315; `MatrixBlock`:336 |
   | `src/vol-07-gauge-qft/Instances.hs` | `PrincipalBundleSystem`:234; `FrobeniusSystem`:255; `SectorSystem`:260 |
   | `src/vol-08-spacetime-reconstruction/Instances.hs` | `LorentzianSpacetime`:161; `ThurstonGeometry3`:203; `HolographicEntropyVector`:233 |
   | `src/vol-09-gravity-information-geometry/Instances.hs` | `ClassicalStatisticalModel`:148; `QuantumStateSystem`:154; `EntanglementWedgeSystem`:166; `ThermodynamicGeometrySystem`:178; `WeightedNerveModel`:190 |
   | `src/vol-10-observational-equivalence/Instances.hs` | `FiniteClassicalSystem`:77; `ObservationRecord`:120; `FiniteQuantumSystem`:167; `IsocategoricalWitness`:235 |
   | `src/vol-11-completeness-obstructions/Instances.hs` | `WitnessSystem`:192 |
   | `src/vol-12-principia-physica/Instances.hs` | `FiniteDimQuantumExample`:158; `MatrixBlock`:174 |

   This applies to **all** instances for each listed type, not just its first instance. `ThurstonGeometry3` has a Lean namesake, but its family instance and constructor names still do not mirror Lean.

   **Fix:** add an explicit correspondence for every instance head; distinguish missing formal counterparts from existing conditional or model-level counterparts.

3. **Several shared data types also diverge materially.**

   - `src/Taxonomy/Families.hs:82`: Haskell `SystemRecord` stores component **values**; Lean `SystemRecord` stores five **types** (`lean/Cmrps/Vol10ObservationalEquivalence.lean:24`).
   - `src/Taxonomy/Families.hs:112`: `StructuralFamily` is a ten-tag enumeration; Lean’s namesake stores an object type (`lean/Cmrps/Vol02StructuralFamilies.lean:690`).
   - `src/Taxonomy/Equivalences.hs:38`: Haskell `MorphismKind` includes `EquivalenceMorphism`; the Lean enumeration at `lean/Cmrps/Vol10ObservationalEquivalence.lean:55` omits it.
   - `src/Taxonomy/Equivalences.hs:100`: Haskell `EquivalenceWitness` includes source/target values and a list of structures; Lean’s witness at `lean/Cmrps/Vol10ObservationalEquivalence.lean:80` has no endpoints and uses a set. `PreservedStructure` also has no exact counterpart for its separate `PlainTensorStructure` constructor.
   - `src/Taxonomy/Constructions.hs:137`: `Decomposition` stores an unchecked list, whereas Lean’s `DynDecomposition` requires nonemptiness, invariance, disjointness, coverage and connectivity (`lean/Cmrps/Vol01Foundations.lean:440`).
   - `src/Taxonomy/Invariants.hs:65`: `InvariantRecord` has matching component roles, but different field names from `lean/Cmrps/Vol12PrincipiaPhysica.lean:350`.

   **Fix:** align these representations or provide explicit, scoped conversions with documented information loss.

4. **Dimension vectors are not multisets in the shared Haskell API.** `src/Taxonomy/Invariants.hs:201` derives order-sensitive `Eq`/`Ord` for `[Int]`; Lean uses `Multiset ℕ` or `List.Perm`. Moreover, volume 11 sorts descending (`src/vol-11-completeness-obstructions/Instances.hs:176`), while other volumes sort ascending. The same invariant therefore compares unequal across volumes.

   **Fix:** hide the constructor, validate positive entries, and use one canonical ordering everywhere.

5. **Other invariant types admit values outside their stated mathematical domains.** `src/Taxonomy/Invariants.hs:216` permits invalid Dynkin ranks; `:237` permits fractional/negative “dominant integral” coordinates; `:256` permits nonpositive matrix sizes; `:264` permits invalid III parameters and duplicates `TypeIII1` through parameter `1`. Lean’s dominant weights explicitly require nonnegative integral coordinates (`lean/Cmrps/Vol07GaugeQft.lean:38`).

   **Fix:** use validated constructors and nonnegative integral weight coordinates; enforce the proper rank and parameter ranges.

6. **The achievement enumeration is incomplete.** `src/vol-02-structural-families/Instances.hs:539` has four constructors; Lean has five, including `noRecord` (`lean/Cmrps/Vol02StructuralFamilies.lean:191`). All four existing constructor names also differ. `ClassificationRecord` at Haskell `:548` is not Lean’s `FamilyRecord`: it lacks an actual invariant function, relation and law fields.

   **Fix:** add `NoRecord`, align constructor names through an explicit mapping, and distinguish descriptive metadata from a classification record satisfying the Lean specification.

7. **The remaining cited target names are not Lean declaration names.** The following references need correction or an explicit “unformalized target” label:

   | Haskell locations | Divergence and concrete replacement |
   |---|---|
   | `src/vol-03-irreducibility-decomposition/Instances.hs:67,73,74,95,100,112,122,143,160,169,178` | `finite_dim_cstar_block_decomposition`, `dimension_vector_complete_invariant`, `dimension_vector_uniqueness`, `tensor_block_product`, `closure_semigroup`, `unital_star_hom_classification`, `outer_automorphism_permutation`, `states_direct_sum_join`, `module_factorization`, `kraus_normal_form_uniqueness` are absent. Cite the actual `BlockAlg`, `finrank_blockAlg`, `dimVector_perm_invariant`, `finrank_tensor_blocks`, `sizeSemigroup`, `MultiplicityMatrix`, `blockPerm` declarations where applicable. State/module/Kraus uniqueness results have no corresponding development here. |
   | `src/vol-05-classical-systems/Instances.hs:115,122,131,138,145,152` | `Darboux`, `WeinsteinSplitting`, `KKSSymplectic`, `MoserStability`, `MonodromyObstruction`, `FisherExplicit`, `ChentsovFisher` are target labels, not declarations. Actual counterparts include `stdSymplecticForm`, `kksForm`, `pendulumMonodromy`, `fisherMetric`, `fisherMetric_product`; full manifold theorems remain unformalized. |
   | `src/vol-06-quantum-systems/Instances.hs:94,184,217,222,228,251` | The cited classification, McDuff, Kraus, Stinespring, Petz and DR names are absent. Use `dimvec_classifies_sorted` only for sorted block combinatorics; label the other results unformalized. |
   | `src/vol-07-gauge-qft/Instances.hs:89,99,134,137,140,154,188,200,213` | The cited Killing–Cartan, global-form, bundle, characteristic-class, highest-weight, anomaly, Frobenius and DR target names are absent. Actual fragments include `highestWeightRankOne`, `GlobalFormInvariant`, `SO3BundleClass`, `AnomalyObstruction`, `QuantizationGate`, `FrobeniusAlgebra`; they have narrower types/content. |
   | `src/vol-09-gravity-information-geometry/Instances.hs:67,69,72` | `petz_metric_sld`, `petz_metric_wy`, `bures_qubit_round_sphere` are absent. Cite `fSLD`/`fWY` for parameter formulas; the full hemisphere/fidelity statement is explicitly unmechanized. |

   Volume 1’s `vol01.…` labels are explicitly mapped to actual names in its Lean header; they are target identifiers, not direct Lean names.

8. **Cross-audit claims exceed the available correspondence.** `src/vol-01-foundations/Instances.hs:22`, `src/vol-03-irreducibility-decomposition/Instances.hs:19`, and `src/vol-10-observational-equivalence/Instances.hs:20` assert validation against kernel-checked specifications despite the missing interfaces and mismatches above. Volume 1 also asserts a clean Lean build using evidence outside the permitted review scope.

   **Fix:** say “computational evidence intended for comparison with the listed Lean fragments,” and identify the exact comparison and its limits. Negative statements such as “not verified by Lean” are not themselves overclaims.

9. **`Irreducible` asserts membership without checking irreducibility.** `src/Taxonomy/Constructions.hs:126` supplies only an operation tag. Instances cover reducible values—for example `FiniteStateSystem 2` (`src/vol-01-foundations/Instances.hs:291`) and multiblock algebras (`src/vol-02-structural-families/Instances.hs:205`).

   **Fix:** rename this hook to describe the decomposition operation, or expose an irreducibility predicate/validated wrapper. Require checked irreducible factors in decompositions.

10. **Finite dynamics has invalid equivalence and construction behavior.** `src/vol-01-foundations/Instances.hs:203,381` returns `False` even for self-equivalence above eight states. Missing map entries silently become identity mappings; duplicate states and maps leaving the state set are accepted. At `:265`, offsetting labels does not ensure disjointness when the second system contains negative labels.

    **Fix:** validate a finite set with a total endomap; report search limits as `Unknown`; use tagged disjoint unions or fresh canonical labels.

11. **Qubit operations are partial and omit factorization data.** `src/vol-01-foundations/Instances.hs:420` explicitly throws on any amplitude count other than four; `:211` rounds floating coefficients and ignores the supplied factorization. The factorization stores dimensions, whereas Lean models an actual coordinate transformation (`lean/Cmrps/Vol01Foundations.lean:659`). The comment at Haskell `:343` also strengthens a nonuniqueness example into “none can be” supplied.

    **Fix:** use a validated four-amplitude state and explicit factorization transformation; return a scoped numerical comparison, and describe the Lean result as a nonuniqueness witness.

12. **Zero-cardinality product decomposition is wrong.** `src/vol-01-foundations/Instances.hs:320` produces an empty factor list for cardinality zero, whose product is one. Lean requires nonzero cardinality (`lean/Cmrps/Vol01Foundations.lean:615`).

    **Fix:** reject zero for this operation and negative cardinalities at construction.

13. **The Kraus-rank example contradicts its claimed result.** `src/vol-02-structural-families/Instances.hs:412` takes the maximum inner-list length. Every sampled entry generated at `:420` has length two, so any nonempty sample reports rank **two**, despite the rank-one comment. The function also packages multiple sampled channels as one channel and does not construct full `2×2` unitary matrices. Lean uses a list of matrices and minimality (`lean/Cmrps/Vol02StructuralFamilies.lean:442,446`).

    **Fix:** return one channel per phase, with one full unitary Kraus operator per channel; compute/validate minimal rank or label it supplied metadata.

14. **The cotangent “retraction” computes labels only.** `src/vol-02-structural-families/Instances.hs:126` describes a homotopy, but returns strings; `n = 0` also creates a `NaN` parameter. Lean formalizes an actual map on a trivial product bundle, not arbitrary cotangent bundles (`lean/Cmrps/Vol02StructuralFamilies.lean:566,607`).

    **Fix:** implement point/fibre scaling with positive sampling resolution, or rename this a display-only parameter sample and state the product-bundle scope.

15. **The local symplectic classification comment is too broad.** `src/vol-02-structural-families/Instances.hs:72` says no local invariant is classifying. Lean explicitly explains that a constant invariant does classify the fixed-dimensional germ equivalence; its result is germ constancy (`lean/Cmrps/Vol02StructuralFamilies.lean:178`).

    **Fix:** distinguish classification of germs from classification of global systems.

16. **Multiplicity checks accept negative multiplicities.** `src/vol-03-irreducibility-decomposition/Instances.hs:131` checks column sums but not nonnegativity. With source sizes `[1,1]`, target `[1]`, rows `[[-1],[2]]` pass. Lean uses `ℕ` (`lean/Cmrps/Vol03IrreducibilityDecomposition.lean:53`).

    **Fix:** reject negative entries and validate positive block sizes.

17. **`moduleFactorization` silently drops invalid components and can divide by zero.** At `src/vol-03-irreducibility-decomposition/Instances.hs:171`, size `2` with module dimension `3` returns `Just []`; size `0` reaches `mod 0`.

    **Fix:** validate every block and divisibility condition before producing the entire multiplicity vector; otherwise return `Nothing`.

18. **`statesDirectSum` does not reconstruct the stated state.** `src/vol-03-irreducibility-decomposition/Instances.hs:162` returns uniform weights independent of `lambda`; no normalized block restrictions are inputs.

    **Fix:** accept the actual block states and compatible weights, or rename the output as illustrative weight metadata and remove the uniqueness assertion.

19. **Closure arithmetic can fail to terminate or overflow.** `src/vol-03-irreducibility-decomposition/Instances.hs:114` accepts negative seeds, uses overflowing `Int` products, duplicates discoveries, and returns `1` even below the bound. Removing zero also disagrees with Lean’s unrestricted `Set ℕ` closure.

    **Fix:** define the intended positive-size domain, use `Integer`/`Natural`, maintain a set, and enforce the bound consistently.

20. **The “typed” matrix fragment accepts malformed shapes.** `src/vol-04-yoneda-classification/Instances.hs:205,215,222,228,234,271` permits ragged matrices, truncates addition/multiplication through `zipWith`, and indexes rows unsafely. Channel dimensions need not match their Kraus operators. Lean uses dimension-indexed matrices.

    **Fix:** hide constructors, validate rectangularity and channel dimensions, and make incompatible operations return errors.

21. **Tensor constructions retain stale identity data.** `src/vol-04-yoneda-classification/Instances.hs:190` changes only the fusion label; group, category and equivalence keys remain those of the left operand. At `:333`, channel tensoring similarly preserves the original equivalence keys.

    **Fix:** construct the complete composite record and derive comparison data from it; return `Nothing` for unsupported symbolic constructions.

22. **Symplectic equivalence is unsound.** `src/vol-05-classical-systems/Instances.hs:315` treats equal chart matrices as a “conservative witness” of whole-system equivalence, ignoring manifold and Hamiltonians. Equal local matrices do not establish global equivalence.

    **Fix:** rename this as chart-matrix equality or require explicit whole-system equivalence data.

23. **Some construction hooks claim operations they do not perform.** `src/vol-05-classical-systems/Instances.hs:294` implements `directSum` as a product. Quotient hooks at `src/vol-05-classical-systems/Instances.hs:298` and `src/vol-07-gauge-qft/Instances.hs:281` return the unchanged input for every quotient kind.

    **Fix:** implement the named construction or return `Nothing`.

24. **Probability and metric inputs are unchecked.**

    - `src/vol-05-classical-systems/Instances.hs:155`: zero probabilities cause rational division by zero; simplex and tangent conditions are absent.
    - `src/vol-05-classical-systems/Instances.hs:170`: ragged Poisson matrices cause out-of-bounds indexing.
    - `src/vol-10-observational-equivalence/Instances.hs:190,209`: malformed matrices and zero denominators cause exceptions; the restriction check does not validate diagonality or normalization.
    - `src/vol-02-structural-families/Instances.hs:325`: ignores whether the outcome count is two and accepts `NaN`.

    **Fix:** validate matrix shapes, positive normalized distributions, required tangent conditions and parameter normalization before evaluation; return `Either`/`Maybe`.

25. **Volume 6 has additional type/status divergences.** `src/vol-06-quantum-systems/Instances.hs:228` calls self-reciprocity the normalization condition, omitting `f(1)=1`; Lean distinguishes them (`lean/Cmrps/Vol10ObservationalEquivalence.lean:349,353`). At Haskell `:194`, uncountably many factors is overstated as excluding *all* total classifications; Lean’s relevant obstruction is specifically about countable-range invariants (`lean/Cmrps/Vol11CompletenessObstructions.lean:143`). At Haskell `:119`, negative input reaches `floor (sqrt negative)`.

    **Fix:** separate normalization, self-reciprocity and monotonicity; qualify the obstruction; validate nonnegative enumeration inputs.

26. **Gauge data conflates different structures.** `src/vol-07-gauge-qft/Instances.hs:92` assigns `A₁` to `U(1)`; `:95` omits the abelian component of `U(2)`. At `:151`, “classifying invariant” drops global-form and characteristic-class **values**. At `:169`, `Z[p1,w2,e]` incorrectly mixes integral and mod-two characteristic data without relations.

    **Fix:** represent reductive Lie data and global form separately; carry actual characteristic classes and values; specify coefficient rings and relations.

27. **The anomaly model and quantization claim differ from Lean.** Haskell `AnomalyData` (`src/vol-07-gauge-qft/Instances.hs:176`) stores a determinant flag and two lists. Lean’s namesake stores an additive homomorphism; its separate `AnomalyObstruction` stores a BRST class (`lean/Cmrps/Vol07GaugeQft.lean:173,242`). Haskell `:192` further claims sufficient conditions for consistent quantization, while Lean defines an obstruction gate.

    **Fix:** align those distinct records and describe the Boolean as an obstruction check, not an existence/sufficiency result.

28. **The causal ladder and entropy-vector domain disagree with their comments.** `src/Taxonomy/Invariants.hs:315` omits causal continuity/simplicity while describing a complete ladder. The bridge at `src/vol-08-spacetime-reconstruction/Instances.hs:117` promises nearest-rung mapping but returns `Nothing`. Entropy-vector records claim arbitrary region counts at `:220`, while state labels and SSA/MMI checks are fixed to three regions (`:239,259`).

    **Fix:** complete the ladder or label it coarse; correct the bridge description; either restrict entropy vectors to exactly three regions or parameterize the region set.

29. **The entropy-cone scope conflicts across layers.** `src/vol-09-gravity-information-geometry/Instances.hs:93,117` says the established range includes five regions. `src/Taxonomy/Invariants.hs:327` and Lean’s spine (`lean/Cmrps/Vol12PrincipiaPhysica.lean:141`) place five-or-more regions outside the recorded completed range.

    **Fix:** reconcile the scope explicitly and avoid implying SSA/MMI completeness beyond the stated range.

30. **Proposed geometry and decomposition are presented as existing structure.** `src/vol-09-gravity-information-geometry/Instances.hs:196` gives every weighted-nerve model smooth-geometric membership despite its explicitly unestablished limit. At `:271`, a claimed decomposition over outcomes simply returns `[m]`.

    **Fix:** represent proposed geometric data separately from supplied geometry; implement outcome factors or return `Nothing`.

31. **Observation construction is partial, and composition loses probability mass.** `src/vol-10-observational-equivalence/Instances.hs:113` accepts invalid partition indices, causing exceptions or double-counting. At `:87`, pointwise multiplication is not the independent product distribution: `[1/2,1/2]` composed with itself sums to `1/2`.

    **Fix:** validate partitions and use the Cartesian-product distribution `[p*q | p <- ps, q <- qs]`.

32. **Preservation metadata invents a stronger layer.** `src/vol-10-observational-equivalence/Instances.hs:250` returns `SymmetricMonoidalStructure` whenever the specific plain-only condition fails—including when both equivalence flags are false.

    **Fix:** return only explicitly supported layers; reject inconsistent witness data.

33. **Volume 11 ignores its witness restriction and uses different names.** `src/vol-11-completeness-obstructions/Instances.hs:127` assigns undecidability to every `FourManifoldWitness n`, although its comment restricts the cited result to `n ≥ 9`. `ClassificationRegime` and all constructor names differ from Lean’s `Regime` (`lean/Cmrps/Vol11CompletenessObstructions.lean:113`).

    **Fix:** validate the threshold and map all seven constructors explicitly.

34. **`PrincipiaLayers` omits the architecture’s maps.** `src/vol-12-principia-physica/Instances.hs:102` stores three unrelated values; Lean stores three types plus `realize` and `select` maps (`lean/Cmrps/Vol12PrincipiaPhysica.lean:23`). Separate fields do not establish the claimed non-collapse. `Regime`/`EvidenceGrade` constructor names also differ from Lean’s `r1…r7` and `formulation/rigorous/validated`.

    **Fix:** include the maps and explicit constructor correspondences; describe separation as a supplied condition rather than a consequence of record shape.

35. **Language-extension requirements are not self-contained.** `src/vol-06-quantum-systems/Instances.hs:337` uses an instance signature without a local `InstanceSigs` pragma. Empty-type derivations at `src/Taxonomy/Invariants.hs:229` and similar declarations require `EmptyDataDeriving` unless supplied by the project language configuration.

    **Fix:** declare the required extensions locally or verify/document their build-level provision. Build configuration was outside the permitted scope.

No family class is redefined outside `src/Taxonomy/`. All top-level Haskell functions have type signatures. I found no separate non-exhaustive pattern match; the partiality findings above arise from explicit `error`, indexing, arithmetic and unchecked representations. No punctuation-style issues are reported.

VERDICT: NEEDS_FIX
