{-# LANGUAGE TypeFamilies #-}

-- | Module        : Taxonomy.Constructions
-- Description     : Admissible constructions F, decomposition, irreducibility,
--                   and closure under constructions.
-- Ontology source : docs/ontology.md (DEF-013, DEF-021..DEF-024).
--
-- The admissible constructions F of DEF-023 (tensor product, direct sum,
-- extension, limits and colimits, factorization) plus quotient /
-- symmetry-reduction, encoded as a value-level vocabulary and as type-class
-- hooks that later volumes instantiate. Each use of a construction must state
-- the composition data it contributes to C (DEF-007); this module does not
-- fix those data.
--
-- Claim status (docs/theorem-registry.md): vocabulary and hook shapes only.
-- No construction is computed here and no proof is claimed. The structural
-- generation statement (DEF-040) and the classification identity
-- Phys_adm = <F>_C (DEF-041, T-CMRPS-01) are conjectural and are encoded only
-- as data about what would have to be shown.
module Taxonomy.Constructions
  ( -- * Construction vocabulary (DEF-023)
    Construction (..)
  , ExtensionKind (..)
  , LimitKind (..)
  , QuotientKind (..)
    -- * Construction hooks
  , Constructible (..)
    -- * Irreducibility and decomposition (DEF-021, DEF-022)
  , Irreducible (..)
  , Decomposition (..)
  , Decomposable (..)
    -- * Closure under constructions (DEF-024)
  , Closure (..)
  ) where

import Taxonomy.Families (StructuralFamily)

-- | DEF-023 — an admissible construction F: a permitted operation assembling
-- systems from simpler ones. The canonical list for the series is tensor
-- product, direct sum, extension (group, algebra, field-theoretic), limits and
-- colimits (including the limiting procedures of DEF-013), and factorization
-- (decomposition of a representation into factors). Quotient /
-- symmetry-reduction is included as the vocabulary for reducing by symmetry
-- data (DEF-006). Status: stipulative; each use must state the composition
-- data it contributes to C (DEF-007).
data Construction
  = TensorProduct
    -- ^ Tensor product of systems.
  | DirectSum
    -- ^ Direct sum of systems.
  | Extension ExtensionKind
    -- ^ Extension in the sense of DEF-023.
  | Limit LimitKind
    -- ^ Limit process (DEF-013, limit side).
  | Colimit LimitKind
    -- ^ Colimit process (DEF-013, colimit side).
  | Factorization
    -- ^ Factorization of a representation into factors (cf. direct-integral
    -- decomposition into factors).
  | Quotient QuotientKind
    -- ^ Quotient or symmetry reduction.
  deriving (Eq, Show)

-- | DEF-023 — the extension kinds named in the canonical list.
data ExtensionKind
  = GroupExtension
  | AlgebraExtension
  | FieldTheoreticExtension
  deriving (Eq, Ord, Show)

-- | DEF-013 — limiting procedures named as morphism-level constructions:
-- thermodynamic limit, infinite-volume limit, semiclassical limit, continuum
-- limit. Continuum limits in constructive QFT are the load-bearing case;
-- lattice theorems in restricted regimes do not by themselves close the
-- continuum limit. Status: stipulative.
data LimitKind
  = ThermodynamicLimit
  | InfiniteVolumeLimit
  | SemiclassicalLimit
  | ContinuumLimit
  deriving (Eq, Ord, Show)

-- | Quotient / symmetry-reduction kinds: reducing a system by symmetry data
-- (DEF-006) or by gauge or constraint identification. Stipulative vocabulary.
data QuotientKind
  = SymmetryReduction
  | GaugeQuotient
  | ConstraintQuotient
  deriving (Eq, Ord, Show)

-- | DEF-023 — hook class for systems that admit the admissible constructions.
-- Method semantics: 'Nothing' means the construction is not supplied for this
-- system here; later volumes instantiate the hooks with their own data. No
-- construction is computed by this package.
class Constructible p where
  -- | The type of systems produced by the binary constructions of 'p'.
  type Composite p

  -- | Tensor product (DEF-023). The result's composition data is whatever the
  -- instance states (DEF-007).
  tensorProduct :: p -> p -> Maybe (Composite p)

  -- | Direct sum (DEF-023).
  directSum :: p -> p -> Maybe (Composite p)

  -- | Extension (DEF-023): group, algebra, or field-theoretic extension.
  extend :: ExtensionKind -> p -> p -> Maybe (Composite p)

  -- | Limit hook (DEF-013, DEF-023): the limit of a diagram of systems, when
  -- the volume supplies one.
  limitHook :: LimitKind -> [p] -> Maybe p

  -- | Colimit hook (DEF-013, DEF-023): the colimit of a diagram of systems,
  -- when the volume supplies one.
  colimitHook :: LimitKind -> [p] -> Maybe p

  -- | Quotient / symmetry reduction (DEF-006, DEF-023).
  quotientReduction :: QuotientKind -> p -> Maybe p

-- | DEF-021 — irreducibility: P admits no nontrivial decomposition under a
-- specified composition operation. Irreducibility is always relative to C
-- (DEF-007) and to the decomposition notion in force; an instance asserts
-- irreducibility in exactly the sense its 'irreducibilityBasis' names. The
-- class of irreducibles is J = {P : P is irreducible} (DEF-021). Status:
-- stipulative.
class Irreducible p where
  -- | The composition operation (represented as the construction vocabulary)
  -- relative to which p is irreducible.
  irreducibilityBasis :: p -> Construction

-- | DEF-022 — a decomposition P = F(I_1, ..., I_n) with each I_i irreducible
-- (DEF-021) and F an admissible construction (DEF-023). Status: stipulative;
-- uniqueness is open. Interacting physical systems need not admit unique
-- decompositions — entanglement, emergence, gauge redundancy, and nontrivial
-- interactions all complicate the notion — so existence and uniqueness claims
-- belong only to carefully restricted subclasses.
data Decomposition p = Decomposition
  { decompositionConstruction :: Construction
    -- ^ The construction F witnessing the decomposition (DEF-023).
  , irreducibleFactors :: [p]
    -- ^ The irreducible factors I_1 .. I_n (DEF-021).
  }
  deriving (Eq, Show)

-- | DEF-022 — hook class for systems with a supplied decomposition.
-- 'Nothing' means no decomposition is supplied here; it is not a claim that
-- none exists.
class Decomposable p where
  decomposition :: p -> Maybe (Decomposition p)

-- | DEF-024 — closure <F>_C: the class of objects generated from a family
-- collection F under the admissible constructions C — the smallest class
-- containing F and closed under C. The conjectural objective of the program is
-- the identity Phys_adm = <F>_C (DEF-041, T-CMRPS-01, status conjecture); this
-- record only names generators and constructions, and asserts no such identity.
data Closure = Closure
  { closureGenerators :: [StructuralFamily]
    -- ^ The generating family collection F (DEF-025).
  , closureConstructions :: [Construction]
    -- ^ The constructions C under which closure is taken (DEF-023).
  }
  deriving (Eq, Show)
