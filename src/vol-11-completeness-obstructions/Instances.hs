{-# LANGUAGE TypeFamilies #-}

{-|
Module      : Vol11CompletenessObstructions.Instances
Description : Taxonomy instances for the regime taxonomy and obstruction
              witnesses of the completeness-and-obstructions volume.
Copyright   : (c) Matthew Long, 2026
License     : MIT
Maintainer  : matthew@yonedaai.com
Stability   : experimental

Executable taxonomy layer for the paper "Completeness and Obstructions"
(Part 11 of The Classification of Mathematical Representations of Physical
Systems).  The module imports the shared family classes of "Taxonomy" and
declares instances of them for this volume's witness systems; it never
redefines those classes.

The regime tag mirrors Definition 4.2 of the paper and the lean target
'Regime'; the type and method names mirror the paper's definitions.  This
module is computational evidence only: it proves nothing, it is not
machine-checked, and no formal verification is claimed for it.
-}
module Vol11CompletenessObstructions.Instances
  ( -- * Regime taxonomy (paper, Definition 4.2)
    ClassificationRegime (..)
  , regimes
  , regimeOf
    -- * Witness systems of the register
  , WitnessSystem
      ( FiniteDimCStar, SimpleGroupWitness, AmenableFactorWitness
      , GeneralII1Witness, IsocategoricalPair, FusionCategoryWitness
      , WildModuleWitness, MarkovGroupWitness, UnknotWitness )
  , fourManifoldWitness
    -- ^ The only way to build 'FourManifoldWitness' (the raw constructor is
    -- not exported): enforces the n >= 9 threshold of the cited
    -- unrecognizability result, returning 'Nothing' below it.
    -- * Family data witnesses
  , OperatorAlgebraWitness (..)
  , DerivedWitness (..)
  , TensorCategoryWitness (..)
  , GeometricWitness (..)
  , CombinatorialWitness (..)
    -- * Invariant mirror (paper, Definition 4.1)
  , classifyCStar
  , sortDesc
  ) where

import Taxonomy.Families
  ( FamilyHilbertOperatorAlgebras (..)
  , FamilySmoothGeometric (..)
  , FamilyTensorCategoriesComposition (..)
  , FamilyDynamicalSemigroups (..)
  , FamilyDiscreteCombinatorial (..)
  , FamilyDerivedHomotopical (..)
  )
import Taxonomy.Invariants
  ( ClassifyingInvariant (..)
  , DimensionVector (..)
  )
import Taxonomy.Constructions
  ( Construction (..)
  , Constructible (..)
  , Irreducible (..)
  , Decomposition (..)
  , Decomposable (..)
  )
import Taxonomy.Equivalences
  ( MathematicalEquivalence (..)
  , PhysicalEquivalence (..)
  )

-- | Paper, Definition 4.2: the seven regimes of classification evidence.
-- Constructor names mirror the regime names used in the paper and in the
-- lean targets document.
data ClassificationRegime
  = ParameterizedRegime
    -- ^ Complete invariant, parameter space, and recognizer all exist.
  | UnparameterizedRegime
    -- ^ Complete invariant and recognizer exist; no uniform parameter space.
  | ObstructionCompleteRegime
    -- ^ The classification content is a proved impossibility theorem.
  | OpenRegime
    -- ^ Partial results exist and no impossibility theorem applies.
  | WildRegime
    -- ^ Finite-variety parameterization is provably impossible.
  | UndecidableRegime
    -- ^ No recognition procedure exists in the stated generality.
  | DecidableButUnclassifiedRegime
    -- ^ A recognizer exists; no complete invariant is known.
  deriving (Eq, Ord, Show, Enum, Bounded)

-- | All seven regimes, in the order of Definition 4.2.
regimes :: [ClassificationRegime]
regimes = [minBound .. maxBound]

-- | A witness system of the obstruction register and the regime table.
-- Each constructor names the domain whose evidence fixes its regime; the
-- payload is the identifying data used by the paper's examples.
data WitnessSystem
  = FiniteDimCStar [Int]
    -- ^ Finite-dimensional C*-algebra by dimension vector; parameterized.
  | SimpleGroupWitness String
    -- ^ Finite simple group; classified, not parameterized (CFSG gap).
  | AmenableFactorWitness String
    -- ^ Amenable factor; parameterized by type data.
  | GeneralII1Witness String
    -- ^ General separable II_1 factor; obstruction-complete (McDuff).
  | IsocategoricalPair String String
    -- ^ Pair of non-isomorphic groups with equivalent plain tensor
    -- representation categories (Etingof-Gelaki); obstruction-complete.
  | FusionCategoryWitness String
    -- ^ Fusion category; open.
  | WildModuleWitness (Int, Int)
    -- ^ Module of a wild category by rank data; wild.
  | MarkovGroupWitness String
    -- ^ Finitely presented group with a Markov property; undecidable.
  | FourManifoldWitness Int
    -- ^ Connected sum of n copies of S^2 x S^2; unrecognizable for n >= 9.
    -- Internal: construct only through 'fourManifoldWitness', which enforces
    -- the threshold of the cited result.
  | UnknotWitness Int
    -- ^ Knot diagram by crossing count; decidable-but-unclassified.
  deriving (Eq, Show)

-- | Smart constructor for 'FourManifoldWitness'. The cited unrecognizability
-- result (paper, Table 4) holds only for n >= 9, so witnesses below that
-- threshold are not admitted.
fourManifoldWitness :: Int -> Maybe WitnessSystem
fourManifoldWitness n
  | n >= 9    = Just (FourManifoldWitness n)
  | otherwise = Nothing

-- | Paper, Table 4: the regime of each witness system.  Total by
-- construction, mirroring the lean target 'RegimeAssignment'.
regimeOf :: WitnessSystem -> ClassificationRegime
regimeOf (FiniteDimCStar _)        = ParameterizedRegime
regimeOf (SimpleGroupWitness _)    = UnparameterizedRegime
regimeOf (AmenableFactorWitness _) = ParameterizedRegime
regimeOf (GeneralII1Witness _)     = ObstructionCompleteRegime
regimeOf (IsocategoricalPair _ _)  = ObstructionCompleteRegime
regimeOf (FusionCategoryWitness _) = OpenRegime
regimeOf (WildModuleWitness _)     = WildRegime
regimeOf (MarkovGroupWitness _)    = UndecidableRegime
regimeOf (FourManifoldWitness n)
  | n >= 9    = UndecidableRegime
  | otherwise = OpenRegime
    -- Below the cited n >= 9 threshold no unrecognizability theorem applies.
regimeOf (UnknotWitness _)         = DecidableButUnclassifiedRegime

-- | Operator-algebra structural data, for the 'FamilyHilbertOperatorAlgebras'
-- instance.  'Nothing' at the instance level means the witness carries no
-- operator-algebra data here.
data OperatorAlgebraWitness
  = CStarBlocks [Int]
    -- ^ Dimension vector of a finite-dimensional C*-algebra.
  | FactorTag String
    -- ^ Named factor witness.
  deriving (Eq, Show)

-- | Derived and homotopical data, for 'FamilyDerivedHomotopical'.
data DerivedWitness
  = DerivedWildTag (Int, Int)
    -- ^ Rank data of a derived-wild module category witness.
  deriving (Eq, Show)

-- | Tensor-category data, for 'FamilyTensorCategoriesComposition'.
data TensorCategoryWitness
  = PlainTensorRep String
    -- ^ Plain tensor representation category of a named group.
  | SymmetricTensorRep String
    -- ^ Symmetric tensor representation category of a named group.
  | FusionCategoryTag String
    -- ^ Named fusion category witness.
  deriving (Eq, Show)

-- | Geometric data, for 'FamilySmoothGeometric'.
data GeometricWitness
  = FourManifoldTag Int
    -- ^ Connected sum of n copies of S^2 x S^2.
  | KnotDiagramTag Int
    -- ^ Knot diagram with the given crossing count.
  deriving (Eq, Show)

-- | Combinatorial data, for 'FamilyDiscreteCombinatorial'.
data CombinatorialWitness
  = MarkovPresentation String
    -- ^ Finite presentation carrying a Markov property.
  | FiniteGroupData String
    -- ^ Combinatorial data of a named finite group.
  deriving (Eq, Show)

-- | Paper, Definition 4.1: the dimension vector is the complete invariant of
-- finite-dimensional complex C*-algebras up to *-isomorphism.  The mirror
-- returns the classifying-invariant tag of 'Taxonomy.Invariants' and 'Nothing'
-- outside that domain.
classifyCStar :: WitnessSystem -> Maybe ClassifyingInvariant
classifyCStar (FiniteDimCStar ns) =
  Just (ByDimensionVector (DimensionVector (sortDesc ns)))
classifyCStar _ = Nothing

-- | Sort a dimension vector in non-increasing order, so that equal
-- multisets of block sizes compare equal.
sortDesc :: [Int] -> [Int]
sortDesc = foldr insertDesc []
  where
    insertDesc :: Int -> [Int] -> [Int]
    insertDesc x [] = [x]
    insertDesc x (y : ys)
      | x >= y    = x : y : ys
      | otherwise = y : insertDesc x ys

instance FamilyHilbertOperatorAlgebras WitnessSystem where
  type OperatorAlgebraData WitnessSystem = Maybe OperatorAlgebraWitness
  operatorAlgebraData (FiniteDimCStar ns) = Just (CStarBlocks ns)
  operatorAlgebraData (GeneralII1Witness n) = Just (FactorTag n)
  operatorAlgebraData (AmenableFactorWitness n) = Just (FactorTag n)
  operatorAlgebraData _ = Nothing

instance FamilyDerivedHomotopical WitnessSystem where
  type DerivedHomotopicalData WitnessSystem = Maybe DerivedWitness
  derivedHomotopicalData (WildModuleWitness r) = Just (DerivedWildTag r)
  derivedHomotopicalData _ = Nothing

instance FamilyTensorCategoriesComposition WitnessSystem where
  type TensorCategoryData WitnessSystem = Maybe TensorCategoryWitness
  tensorCategoryData (IsocategoricalPair g _) = Just (PlainTensorRep g)
  tensorCategoryData (FusionCategoryWitness n) = Just (FusionCategoryTag n)
  tensorCategoryData (SimpleGroupWitness g) = Just (SymmetricTensorRep g)
  tensorCategoryData _ = Nothing

instance FamilySmoothGeometric WitnessSystem where
  type GeometricData WitnessSystem = Maybe GeometricWitness
  geometricData (FourManifoldWitness n) = Just (FourManifoldTag n)
  geometricData (UnknotWitness n) = Just (KnotDiagramTag n)
  geometricData _ = Nothing

instance FamilyDiscreteCombinatorial WitnessSystem where
  type CombinatorialData WitnessSystem = Maybe CombinatorialWitness
  combinatorialData (MarkovGroupWitness p) = Just (MarkovPresentation p)
  combinatorialData (SimpleGroupWitness g) = Just (FiniteGroupData g)
  combinatorialData _ = Nothing

-- | Direct sum concatenates dimension vectors; every other construction is
-- left unsupplied here, which asserts nothing about its existence.
instance Constructible WitnessSystem where
  type Composite WitnessSystem = WitnessSystem
  tensorProduct _ _ = Nothing
  directSum (FiniteDimCStar a) (FiniteDimCStar b) =
    Just (FiniteDimCStar (sortDesc (a ++ b)))
  directSum _ _ = Nothing
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

-- | Irreducibility is relative to the named construction, as in the paper:
-- single-block C*-algebras are irreducible for direct sum, and factors are
-- irreducible for factorization.
instance Irreducible WitnessSystem where
  irreducibilityBasis (FiniteDimCStar [_]) = DirectSum
  irreducibilityBasis (GeneralII1Witness _) = Factorization
  irreducibilityBasis (AmenableFactorWitness _) = Factorization
  irreducibilityBasis _ = DirectSum

-- | The block decomposition of a finite-dimensional C*-algebra, mirroring
-- the paper's model theorem: A = sum_i M_{n_i}(C) with each block irreducible.
instance Decomposable WitnessSystem where
  decomposition (FiniteDimCStar ns) =
    Just (Decomposition DirectSum [FiniteDimCStar [n] | n <- ns])
  decomposition _ = Nothing

-- | Mathematical equivalence of witnesses: dimension vectors compared as
-- multisets, named witnesses compared by name.  This is the finer relation
-- of the paper (isomorphism of presentations).
instance MathematicalEquivalence WitnessSystem where
  mathematicallyEquivalent (FiniteDimCStar a) (FiniteDimCStar b) =
    sortDesc a == sortDesc b
  mathematicallyEquivalent (IsocategoricalPair a b) (IsocategoricalPair c d) =
    (a == c && b == d) || (a == d && b == c)
  mathematicallyEquivalent x y = x == y

-- | Physical equivalence of witnesses, with the relation stated: two
-- witnesses are physically equivalent exactly when they sit in the same
-- regime of Definition 4.2.  This relation is declared for taxonomy purposes
-- and is not proposed as an equivalence for physical systems.
instance PhysicalEquivalence WitnessSystem where
  physicallyEquivalent a b = regimeOf a == regimeOf b

-- | The dynamical-semigroup family is referenced by the volume but carries
-- no witness data here; the instance records the absence rather than
-- inventing data.
instance FamilyDynamicalSemigroups WitnessSystem where
  type DynamicalSemigroupData WitnessSystem = ()
  dynamicalSemigroupData _ = ()
