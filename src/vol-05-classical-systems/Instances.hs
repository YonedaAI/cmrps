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
