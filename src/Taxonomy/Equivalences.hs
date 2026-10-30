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
