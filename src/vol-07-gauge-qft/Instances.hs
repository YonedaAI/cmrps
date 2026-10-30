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
