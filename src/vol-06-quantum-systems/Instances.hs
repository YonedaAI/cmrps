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
