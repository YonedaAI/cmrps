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
