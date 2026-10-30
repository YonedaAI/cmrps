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
-- model, and composition of independent copies is the product distribution
-- on the product sample space (the cartesian product of the microstate
-- sets), not a pointwise product.
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
  composition _ = uncurry (\ps qs -> [p * q | p <- ps, q <- qs])

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
