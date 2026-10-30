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
