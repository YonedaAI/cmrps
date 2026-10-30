{-# LANGUAGE TypeFamilies #-}

-- | Module        : Vol12PrincipiaPhysica.Instances
-- Description     : Executable taxonomy instances for Volume 12, Principia
--                   Physica: the layered assembly and the worked example of
--                   Section 9 of the paper.
-- Copyright   : (c) Matthew Long, 2026
-- License     : MIT
-- Maintainer  : matthew@yonedaai.com
-- Stability   : experimental
--
-- This module declares instances of the shared taxonomy classes in
-- "Taxonomy.Families", "Taxonomy.Constructions", "Taxonomy.Equivalences", and
-- "Taxonomy.Invariants" for the systems this volume studies. The family
-- classes are imported and never redefined. The worked example is the
-- finite-dimensional C*-algebra A = C (+) M_2(C) of the paper: its dimension
-- vector is the classifying invariant, its blocks are the irreducible
-- constituents under direct sum, and its invariant record is the data the
-- three layers read.
--
-- Claim status (docs/theorem-registry.md): this module is executable
-- taxonomy, that is computational evidence only. It proves nothing and is
-- never "verified by Lean"; the honest statement is that executable models
-- are validated against kernel-checked specifications when such
-- specifications exist. Type and method names mirror the paper's
-- definitions and the targets in
-- verification/vol-12-principia-physica-lean-targets.md.
module Vol12PrincipiaPhysica.Instances
  ( -- * Regime and evidence vocabulary (paper, Definition 2.6 and 2.7)
    Regime (..)
  , EvidenceGrade (..)
  , regimeTally
    -- * The layered assembly (paper, Definition 2.5)
  , PrincipiaLayers (..)
    -- * Worked example (paper, Section 9.1)
  , FiniteDimQuantumExample (..)
  , MatrixBlock (..)
  , dimensionVectorExample
  , decompositionExample
  , invariantRecordExample
    -- * Executable checks (computational evidence, never proofs)
  , classificationOrderCheck
  , decompositionCheck
  ) where

import Data.List (sort)

import Taxonomy.Constructions
  ( Construction (..)
  , Decomposable (..)
  , Decomposition (..)
  , Irreducible (..)
  )
import Taxonomy.Equivalences (MathematicalEquivalence (..))
import Taxonomy.Families
  ( FamilyHilbertOperatorAlgebras (..)
  , PhysicalSystem (..)
  )
import Taxonomy.Invariants
  ( ClassifyingInvariant (..)
  , DimensionVector (..)
  , InvariantRecord (..)
  )

-- | Classification regimes of the paper (Definition 2.7). The constructors
-- mirror the seven regimes exactly: complete and parameterized, complete but
-- unparameterized, complete as obstruction, open, impossible in the stated
-- generality, undecidable, and decidable but unclassified.
data Regime
  = CompleteParameterized
  | CompleteUnparameterized
  | CompleteAsObstruction
  | OpenRegime
  | ImpossibleRegime
  | UndecidableRegime
  | DecidableUnclassified
  deriving (Eq, Ord, Show, Enum, Bounded)

-- | Evidence grades of the paper (Definition 2.6): formulation, rigorous
-- theorem, physical validation. The registry of the program places records
-- at the first two grades only; no record reaches 'PhysicalValidation'.
data EvidenceGrade
  = Formulation
  | RigorousTheorem
  | PhysicalValidation
  deriving (Eq, Ord, Show, Enum, Bounded)

-- | Tally domain rows by regime. The paper's Theorem 4.1 counts the rows of
-- its regime table; this function is the executable form of that count and
-- returns one pair per regime that occurs.
regimeTally :: [(String, Regime)] -> [(Regime, Int)]
regimeTally rows =
  [ (r, length (filter ((== r) . snd) rows))
  | r <- [minBound .. maxBound]
  , any ((== r) . snd) rows
  ]

-- | The Principia architecture (Definition 2.5): mathematical
-- classification, physical realization, and empirical selection, with the
-- realization and selection maps mirroring 'Cmrps.Vol12.PrincipiaLayers'
-- (lean/Cmrps/Vol12PrincipiaPhysica.lean). The non-collapse of the layers is
-- a supplied condition, not a consequence of the record shape: mirroring
-- Lean's 'NotFactoring', the equivalence relation induced by 'select' must
-- differ from the one induced by classification.
data PrincipiaLayers m r e = PrincipiaLayers
  { mathLayer :: m
    -- ^ Layer M: a classification of admissible structures.
  , realizationLayer :: r
    -- ^ Layer R: a physical theory.
  , selectionLayer :: e
    -- ^ Layer E: observational data.
  , realize :: m -> r
    -- ^ The realization map R : M -> P of Definition 2.5.
  , select :: r -> e
    -- ^ The selection map E : P -> Eobs of Definition 2.5.
  }

-- | The worked example of the paper (Section 9.1): the finite-dimensional
-- complex C*-algebra A = C (+) M_2(C), recorded by its dimension vector. The
-- list of block sizes is the multiset that classifies the algebra up to
-- *-isomorphism (T-BG-06); the order of the list carries no meaning.
newtype FiniteDimQuantumExample = FiniteDimQuantumExample
  { exampleBlocks :: [Int] }
  deriving (Eq, Show)

-- | An irreducible matrix block M_n(C) of a finite-dimensional C*-algebra.
-- The integer is the block size n.
newtype MatrixBlock = MatrixBlock
  { matrixSize :: Int }
  deriving (Eq, Ord, Show)

-- | The dimension vector of the worked example: A = C (+) M_2(C) has
-- dimension vector {1, 2}. Mirrors the paper's Lemma 5.1 statement and the
-- lean target FiniteDimCStarDecomposition.
dimensionVectorExample :: DimensionVector
dimensionVectorExample = DimensionVector [1, 2]

-- | The decomposition of the worked example into irreducible blocks under
-- the direct-sum construction: one block of size one and one block of size
-- two. Mirrors the paper's Lemma 5.1: the multiset of sizes is unique up to
-- order.
decompositionExample :: Decomposition FiniteDimQuantumExample
decompositionExample = Decomposition
  { decompositionConstruction = DirectSum
  , irreducibleFactors =
      [ FiniteDimQuantumExample [1]
      , FiniteDimQuantumExample [2]
      ]
  }

-- | The structural invariant record of the worked example (Definition 2.8):
-- states, observables, dynamics, symmetries, and representations all reduce
-- to block data in this example. The representation entry is the
-- classifying dimension vector.
invariantRecordExample :: InvariantRecord [Int] [Int] [Int] [Int] ClassifyingInvariant
invariantRecordExample = InvariantRecord
  { stateInvariants = [1, 2]
  , observableInvariants = [1, 2]
  , dynamicsInvariants = [1, 2]
  , symmetryInvariants = [1, 2]
  , representationInvariants = ByDimensionVector dimensionVectorExample
  }

instance PhysicalSystem FiniteDimQuantumExample where
  type StateSpace FiniteDimQuantumExample = [Int]
  type Observables FiniteDimQuantumExample = [Int]
  type Dynamics FiniteDimQuantumExample = [Int]
  type Symmetries FiniteDimQuantumExample = [Int]
  type Composition FiniteDimQuantumExample = [Construction]
  stateSpace = exampleBlocks
  observables = exampleBlocks
  dynamics = exampleBlocks
  symmetries = exampleBlocks
  composition ex = [DirectSum | length (exampleBlocks ex) > 1]

instance FamilyHilbertOperatorAlgebras FiniteDimQuantumExample where
  type OperatorAlgebraData FiniteDimQuantumExample = DimensionVector
  operatorAlgebraData = DimensionVector . sort . exampleBlocks

instance Irreducible MatrixBlock where
  irreducibilityBasis _ = DirectSum

instance Decomposable FiniteDimQuantumExample where
  decomposition ex
    | length (exampleBlocks ex) == 1 = Nothing
    | otherwise = Just Decomposition
        { decompositionConstruction = DirectSum
        , irreducibleFactors = map (FiniteDimQuantumExample . pure) (exampleBlocks ex)
        }

instance MathematicalEquivalence FiniteDimQuantumExample where
  -- | *-isomorphism of the algebras, per T-BG-06: two examples are
  -- mathematically equivalent exactly when their block multisets agree.
  -- This is not physical equivalence (DEF-015); the choice of physical
  -- equivalence is open and no instance of it is declared here.
  mathematicallyEquivalent a b =
    sort (exampleBlocks a) == sort (exampleBlocks b)

-- | Executable check for the classification claim of the worked example:
-- block order does not affect mathematical equivalence, and different block
-- multisets are not equivalent. Mirrors the paper's Lemma 8.1 statement and
-- the lean target FiniteDimCStarDecomposition. Computational evidence only.
classificationOrderCheck :: Bool
classificationOrderCheck =
  mathematicallyEquivalent (FiniteDimQuantumExample [2, 1])
                           (FiniteDimQuantumExample [1, 2])
    && not (mathematicallyEquivalent (FiniteDimQuantumExample [1, 2])
                                     (FiniteDimQuantumExample [2, 2]))

-- | Executable check for the decomposition claim of the worked example: the
-- two factors of 'decompositionExample' have one block each, and concatenating
-- their block lists reconstructs the block list of the original example.
-- Computational evidence only.
decompositionCheck :: Bool
decompositionCheck =
  all ((== 1) . length . exampleBlocks) (irreducibleFactors decompositionExample)
    && concatMap exampleBlocks (irreducibleFactors decompositionExample)
         == exampleBlocks (FiniteDimQuantumExample [1, 2])
