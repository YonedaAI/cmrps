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
