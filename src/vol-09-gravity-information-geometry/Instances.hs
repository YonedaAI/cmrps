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
