{-# LANGUAGE TypeFamilies #-}

{-|
Module      : Vol01Foundations.Instances
Description : Taxonomy instances for the records of vol-01-foundations.
Copyright   : (c) Matthew Long, 2026
License     : MIT
Maintainer  : matthew@yonedaai.com
Stability   : experimental

Executable instance layer for "Foundations of Structural Classification"
(Part 1 of The Classification of Mathematical Representations of Physical
Systems). The shared family classes live in "Taxonomy.Families",
"Taxonomy.Constructions", and "Taxonomy.Equivalences"; this module imports
them and declares instances for the physical systems of Definitions 3.6 to 3.8
of the paper, with names mirroring the paper and the Lean targets of
verification/vol-01-foundations-lean-targets.md.

Claim status (docs/theorem-registry.md): this module is computational
evidence, never proof. Nothing here is machine-checked, and no executable
model is verified by Lean. The Lean formalizations live in lean/Cmrps/ and
build cleanly (verification/lean-build.log); this module is validated against
them by cross-audit only.
-}
module Vol01Foundations.Instances
  ( -- * Record component data (Definition 3.1)
    FiniteStateSpace (..)
  , FullFunctionAlgebra (..)
  , IdentityDynamics (..)
  , TrivialSymmetry (..)
  , DisjointUnionComposition (..)
  , CartesianProductComposition (..)
  , DiscreteTimeMap (..)
  , Factorization (..)
    -- * Systems (Definitions 3.6 to 3.8)
  , FiniteStateSystem (..)
  , FiniteProductSystem (..)
  , FiniteDynamicalSystem (..)
  , BipartiteQubitSystem (..)
    -- * Computations mirroring the paper
  , primeFactors
  , functionalGraphComponents
  , conjugateMaps
  , schmidtCoefficients
  , schmidtRank
    -- * Demonstration
  , demo
  ) where

import Data.Complex (Complex (..), magnitude)
import Data.List (nub, permutations, sort)

import Taxonomy.Constructions
  ( Construction (..)
  , Constructible (..)
  , Decomposable (..)
  , Decomposition (..)
  , Irreducible (..)
  )
import Taxonomy.Equivalences
  ( MathematicalEquivalence (..)
  , PhysicalEquivalence (..)
  )
import Taxonomy.Families (PhysicalSystem (..))

-- | DEF-003 for the finite classes: the state space X = {0, ..., n-1}.
newtype FiniteStateSpace = FiniteStateSpace [Int]
  deriving (Eq, Show)

-- | DEF-004 for the finite classes: the full algebra O = R^X, recorded by
-- the cardinality of X since the algebra is determined by it.
newtype FullFunctionAlgebra = FullFunctionAlgebra Int
  deriving (Eq, Show)

-- | DEF-005 in the trivial case: identity dynamics.
data IdentityDynamics = IdentityDynamics
  deriving (Eq, Show)

-- | DEF-006 in the trivial case: the trivial symmetry group.
data TrivialSymmetry = TrivialSymmetry
  deriving (Eq, Show)

-- | DEF-007 for Definition 3.6: C is the disjoint union of state spaces.
data DisjointUnionComposition = DisjointUnionComposition
  deriving (Eq, Show)

-- | DEF-007 for Example 7.5: C is the cartesian product of state spaces.
data CartesianProductComposition = CartesianProductComposition
  deriving (Eq, Show)

-- | DEF-005 for Definition 3.7: dynamics given by a self-map f, recorded as
-- its graph.
newtype DiscreteTimeMap = DiscreteTimeMap [(Int, Int)]
  deriving (Eq, Show)

-- | DEF-007 for Definition 3.8: a chosen factorization of a four-dimensional
-- space into two qubit factors. Proposition 7.6 shows this data is not
-- recoverable from the bare record. The tag stores the factor dimensions;
-- the basis change of Proposition 7.6 is realized in the Phase D experiment.
data Factorization = Factorization
  { factorDimA :: Int
  , factorDimB :: Int
  }
  deriving (Eq, Show)

-- | Definition 3.6 (Lean target vol01.finiteState.classify_iff_card_eq):
-- finite classical records P = (X, R^X, id, trivial, disjoint union).
data FiniteStateSystem = FiniteStateSystem
  { fsCardinality :: Int
  }
  deriving (Eq, Show)

-- | Example 7.5 (Lean target vol01.product.irreducible_iff_prime_card): the
-- same records with composition rule the cartesian product.
data FiniteProductSystem = FiniteProductSystem
  { fpsCardinality :: Int
  }
  deriving (Eq, Show)

-- | Definition 3.7 (Lean targets vol01.dynamics.irreducible_iff_connected
-- and vol01.dynamics.connected_components_unique): finite dynamical records
-- with a self-map of discrete time.
data FiniteDynamicalSystem = FiniteDynamicalSystem
  { fdsStates :: [Int]
  , fdsMap :: [(Int, Int)]
  }
  deriving (Eq, Show)

-- | Definition 3.8 (Lean target vol01.qubit.factorization_nonunique):
-- bipartite qubit records, carrying a chosen factorization.
data BipartiteQubitSystem = BipartiteQubitSystem
  { bqsAmplitudes :: [(Double, Double)]
    -- ^ Four complex amplitudes of the state vector, as (real, imaginary).
  , bqsFactorization :: Factorization
  }
  deriving (Eq, Show)

-- | DEF-002 record schema: finite classical systems.
instance PhysicalSystem FiniteStateSystem where
  type StateSpace FiniteStateSystem = FiniteStateSpace
  type Observables FiniteStateSystem = FullFunctionAlgebra
  type Dynamics FiniteStateSystem = IdentityDynamics
  type Symmetries FiniteStateSystem = TrivialSymmetry
  type Composition FiniteStateSystem = DisjointUnionComposition
  stateSpace p = FiniteStateSpace [0 .. fsCardinality p - 1]
  observables p = FullFunctionAlgebra (fsCardinality p)
  dynamics _ = IdentityDynamics
  symmetries _ = TrivialSymmetry
  composition _ = DisjointUnionComposition

-- | DEF-002 record schema: finite systems with product composition.
instance PhysicalSystem FiniteProductSystem where
  type StateSpace FiniteProductSystem = FiniteStateSpace
  type Observables FiniteProductSystem = FullFunctionAlgebra
  type Dynamics FiniteProductSystem = IdentityDynamics
  type Symmetries FiniteProductSystem = TrivialSymmetry
  type Composition FiniteProductSystem = CartesianProductComposition
  stateSpace p = FiniteStateSpace [0 .. fpsCardinality p - 1]
  observables p = FullFunctionAlgebra (fpsCardinality p)
  dynamics _ = IdentityDynamics
  symmetries _ = TrivialSymmetry
  composition _ = CartesianProductComposition

-- | DEF-002 record schema: finite dynamical systems.
instance PhysicalSystem FiniteDynamicalSystem where
  type StateSpace FiniteDynamicalSystem = FiniteStateSpace
  type Observables FiniteDynamicalSystem = FullFunctionAlgebra
  type Dynamics FiniteDynamicalSystem = DiscreteTimeMap
  type Symmetries FiniteDynamicalSystem = TrivialSymmetry
  type Composition FiniteDynamicalSystem = DisjointUnionComposition
  stateSpace p = FiniteStateSpace (fdsStates p)
  observables p = FullFunctionAlgebra (length (fdsStates p))
  dynamics p = DiscreteTimeMap (fdsMap p)
  symmetries _ = TrivialSymmetry
  composition _ = DisjointUnionComposition

-- | DEF-002 record schema: bipartite qubit systems.
instance PhysicalSystem BipartiteQubitSystem where
  type StateSpace BipartiteQubitSystem = [(Double, Double)]
  type Observables BipartiteQubitSystem = FullFunctionAlgebra
  type Dynamics BipartiteQubitSystem = IdentityDynamics
  type Symmetries BipartiteQubitSystem = Factorization
  type Composition BipartiteQubitSystem = Factorization
  stateSpace = bqsAmplitudes
  observables _ = FullFunctionAlgebra 4
  dynamics _ = IdentityDynamics
  symmetries = bqsFactorization
  composition = bqsFactorization

-- | DEF-016 on Definition 3.6: Theorem 8.1, claim 3. Two finite classical
-- records are isomorphic exactly when their cardinalities agree.
instance MathematicalEquivalence FiniteStateSystem where
  mathematicallyEquivalent a b = fsCardinality a == fsCardinality b

-- | DEF-016 on Example 7.5: isomorphism is still a bijection of state spaces.
instance MathematicalEquivalence FiniteProductSystem where
  mathematicallyEquivalent a b = fpsCardinality a == fpsCardinality b

-- | DEF-016 on Definition 3.7: Theorem 8.2, claim 3. Isomorphism of dynamical
-- records is conjugacy of the self-maps. Decided by brute force on the
-- symmetric group for up to eight states, which covers the Phase D
-- enumerations; larger systems are outside the scope of this instance.
instance MathematicalEquivalence FiniteDynamicalSystem where
  mathematicallyEquivalent a b =
    length (fdsStates a) == length (fdsStates b)
      && length (fdsStates a) <= 8
      && conjugateMaps a b

-- | DEF-016 on Definition 3.8: isomorphism of qubit records is local-unitary
-- equivalence, decided by equality of Schmidt coefficient lists.
instance MathematicalEquivalence BipartiteQubitSystem where
  mathematicallyEquivalent a b =
    map round6 (schmidtCoefficients (bqsAmplitudes a))
      == map round6 (schmidtCoefficients (bqsAmplitudes b))
    where
      round6 :: Double -> Double
      round6 x = fromIntegral (round (x * 1.0e6) :: Integer) / 1.0e6

-- | DEF-015 on Definition 3.6: the declared equivalence for the restricted
-- class is mathematical equivalence (condition AC-6 of the paper).
instance PhysicalEquivalence FiniteStateSystem where
  physicallyEquivalent = mathematicallyEquivalent

-- | DEF-015 on Definition 3.7: the declared equivalence is mathematical
-- equivalence.
instance PhysicalEquivalence FiniteDynamicalSystem where
  physicallyEquivalent = mathematicallyEquivalent

-- | DEF-015 on Definition 3.8: the declared relation compares local-unitary
-- classes through Schmidt coefficients. The declaration is a choice, and the
-- choice of physical equivalence is open in general.
instance PhysicalEquivalence BipartiteQubitSystem where
  physicallyEquivalent = mathematicallyEquivalent

-- | DEF-023 hooks for Definition 3.6: the composition rule is disjoint union
-- (direct sum). The product hook is not supplied on this type, which is what
-- makes irreducibility relative to the composition rule.
instance Constructible FiniteStateSystem where
  type Composite FiniteStateSystem = FiniteStateSystem
  tensorProduct _ _ = Nothing
  directSum a b = Just (FiniteStateSystem (fsCardinality a + fsCardinality b))
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

-- | DEF-023 hooks for Example 7.5: the composition rule is the cartesian
-- product.
instance Constructible FiniteProductSystem where
  type Composite FiniteProductSystem = FiniteProductSystem
  tensorProduct a b =
    Just (FiniteProductSystem (fpsCardinality a * fpsCardinality b))
  directSum _ _ = Nothing
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

-- | DEF-023 hooks for Definition 3.7: disjoint union of dynamical records,
-- acting componentwise on the self-maps.
instance Constructible FiniteDynamicalSystem where
  type Composite FiniteDynamicalSystem = FiniteDynamicalSystem
  tensorProduct _ _ = Nothing
  directSum a b =
    Just FiniteDynamicalSystem
      { fdsStates = fdsStates a ++ map (+ offset) (fdsStates b)
      , fdsMap =
          fdsMap a ++ [(x + offset, y + offset) | (x, y) <- fdsMap b]
      }
    where
      offset = maximum (0 : fdsStates a) + 1
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

-- | DEF-023 hooks for Definition 3.8: the record carries one factorization
-- and no composite construction is supplied here. Proposition 7.6 is the
-- reason a composite cannot be read off the bare record.
instance Constructible BipartiteQubitSystem where
  type Composite BipartiteQubitSystem = BipartiteQubitSystem
  tensorProduct _ _ = Nothing
  directSum _ _ = Nothing
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

-- | DEF-021 for Definition 3.6: irreducibility is relative to disjoint
-- union. Lean target vol01.finiteState.irreducible_iff_card_eq_one.
instance Irreducible FiniteStateSystem where
  irreducibilityBasis _ = DirectSum

-- | DEF-021 for Example 7.5: irreducibility is relative to the product.
instance Irreducible FiniteProductSystem where
  irreducibilityBasis _ = TensorProduct

-- | DEF-021 for Definition 3.7: irreducibility is relative to disjoint
-- union, and equals connectedness of the functional graph.
instance Irreducible FiniteDynamicalSystem where
  irreducibilityBasis _ = DirectSum

-- | DEF-021 for Definition 3.8: irreducibility is relative to the tensor
-- product of factors.
instance Irreducible BipartiteQubitSystem where
  irreducibilityBasis _ = TensorProduct

-- | DEF-022 for Definition 3.6: Theorem 8.1, claim 2. The decomposition is
-- into one-point records, unique up to order.
instance Decomposable FiniteStateSystem where
  decomposition p =
    Just Decomposition
      { decompositionConstruction = DirectSum
      , irreducibleFactors =
          replicate (fsCardinality p) (FiniteStateSystem 1)
      }

-- | DEF-022 for Example 7.5: decomposition into prime-cardinality factors.
-- Lean target vol01.product.irreducible_iff_prime_card.
instance Decomposable FiniteProductSystem where
  decomposition p =
    Just Decomposition
      { decompositionConstruction = TensorProduct
      , irreducibleFactors =
          map FiniteProductSystem (primeFactors (fpsCardinality p))
      }

-- | DEF-022 for Definition 3.7: Theorem 8.2, claim 2. The decomposition is
-- into the records on the connected components of the functional graph.
instance Decomposable FiniteDynamicalSystem where
  decomposition p =
    Just Decomposition
      { decompositionConstruction = DirectSum
      , irreducibleFactors =
          [ FiniteDynamicalSystem
              { fdsStates = comp
              , fdsMap = [(x, y) | (x, y) <- fdsMap p, x `elem` comp]
              }
          | comp <- functionalGraphComponents (fdsStates p) (fdsMap p)
          ]
      }

-- | DEF-022 for Definition 3.8: no decomposition is supplied from the bare
-- record, and Proposition 7.6 shows none can be.
instance Decomposable BipartiteQubitSystem where
  decomposition _ = Nothing

-- | Example 7.5: prime factorization of a positive integer. The empty list
-- is the unit, the empty product.
primeFactors :: Int -> [Int]
primeFactors n
  | n <= 1 = []
  | otherwise = go n 2
  where
    go 1 _ = []
    go m d
      | m `mod` d == 0 = d : go (m `div` d) d
      | d * d > m = [m]
      | otherwise = go m (d + 1)

-- | Theorem 8.2: connected components of a functional graph, computed as the
-- weakly connected components of the undirected edge set {x, f(x)}.
functionalGraphComponents :: [Int] -> [(Int, Int)] -> [[Int]]
functionalGraphComponents states edges = go [] states
  where
    neighbours x =
      nub ([y | (a, y) <- edges, a == x] ++ [a | (a, y) <- edges, y == x])
    reachableFrom start = sort (walk [start] [start])
      where
        walk [] seen = seen
        walk (x : rest) seen =
          let nxt = [y | y <- neighbours x, y `notElem` seen]
           in walk (rest ++ nxt) (seen ++ nxt)
    go _ [] = []
    go visited (x : xs)
      | x `elem` visited = go visited xs
      | otherwise =
          let c = reachableFrom x
           in c : go (visited ++ c) xs

-- | Theorem 8.2, claim 3: conjugacy of two self-maps, decided by testing all
-- relabelings for systems of at most eight states.
conjugateMaps :: FiniteDynamicalSystem -> FiniteDynamicalSystem -> Bool
conjugateMaps a b
  | length sa /= length sb = False
  | length sa > 8 = False
  | otherwise = any works (permutations sb)
  where
    sa = fdsStates a
    sb = fdsStates b
    lookupA = fdsMap a
    lookupB = fdsMap b
    app m x = case lookup x m of
      Just y -> y
      Nothing -> x
    works phi =
      and [ app lookupB (phiOf phi x) == phiOf phi (app lookupA x)
          | x <- sa
          ]
    phiOf phi x = case [i | (i, s) <- zip [0 ..] sa, s == x] of
      (i : _) -> phi !! i
      [] -> x

-- | Proposition 7.6: Schmidt coefficients of a two-qubit pure state given by
-- four complex amplitudes, computed as the singular values of the reshaped
-- 2 by 2 amplitude matrix.
schmidtCoefficients :: [(Double, Double)] -> [Double]
schmidtCoefficients amps =
  case map toComplex amps of
    [a, b, c, d] ->
      let row1 = [a, b]
          row2 = [c, d]
          mm x y = sum (zipWith (\u v -> magnitude u * magnitude v) x y)
          t = mm row1 row1 + mm row2 row2
          detSq = magnitude (a * d - b * c) ^ (2 :: Int)
          disc = max 0 (t * t - 4 * detSq)
          s1 = sqrt (max 0 ((t + sqrt disc) / 2))
          s2 = sqrt (max 0 ((t - sqrt disc) / 2))
       in sort [s1, s2]
    _ -> error "schmidtCoefficients: expected four amplitudes"
  where
    toComplex (x, y) = x :+ y

-- | Proposition 7.6: Schmidt rank of a two-qubit pure state.
schmidtRank :: [(Double, Double)] -> Int
schmidtRank amps = length (filter (> 1.0e-9) (schmidtCoefficients amps))

-- | Executable evidence for the statements of the paper. Computation is
-- never proof; the proofs live in the paper.
demo :: IO ()
demo = do
  putStrLn "=== vol-01-foundations: taxonomy instance demo ==="
  putStrLn ""
  putStrLn "-- Theorem 8.1 (a): irreducible under disjoint union iff |X| = 1"
  let states = [FiniteStateSystem n | n <- [1 .. 8]]
  mapM_
    ( \p ->
        putStrLn
          ( "  |X| = "
              ++ show (fsCardinality p)
              ++ ", irreducible: "
              ++ show (fsCardinality p == 1)
          )
    )
    states
  putStrLn ""
  putStrLn "-- Theorem 8.1 (b): decomposition into one-point records"
  print (decomposition (FiniteStateSystem 5))
  putStrLn ""
  putStrLn "-- Theorem 8.1 (c): isomorphism exactly when cardinalities agree"
  print (mathematicallyEquivalent (FiniteStateSystem 3) (FiniteStateSystem 3))
  print (mathematicallyEquivalent (FiniteStateSystem 3) (FiniteStateSystem 4))
  putStrLn ""
  putStrLn "-- Example 7.5: irreducibles under product are prime cardinalities"
  mapM_
    ( \n ->
        putStrLn
          ( "  "
              ++ show n
              ++ " = "
              ++ show (primeFactors n)
          )
    )
    [1, 2, 4, 6, 12, 30, 97]
  putStrLn ""
  putStrLn "-- Theorem 8.2: components of a functional graph"
  let dyn =
        FiniteDynamicalSystem
          { fdsStates = [0, 1, 2, 3, 4, 5]
          , fdsMap = [(0, 1), (1, 2), (2, 0), (3, 3), (4, 5), (5, 4)]
          }
  print (decomposition dyn)
  putStrLn ""
  putStrLn "-- Theorem 8.2 (c): conjugacy of self-maps"
  let dynB =
        FiniteDynamicalSystem
          { fdsStates = [0, 1, 2, 3, 4, 5]
          , fdsMap = [(0, 0), (1, 2), (2, 3), (3, 1), (4, 5), (5, 4)]
          }
      dynC =
        FiniteDynamicalSystem
          { fdsStates = [0, 1, 2, 3, 4, 5]
          , fdsMap = [(0, 1), (1, 0), (2, 3), (3, 2), (4, 5), (5, 4)]
          }
  putStrLn
    ( "  relabeled cycles: "
        ++ show (mathematicallyEquivalent dyn dynB)
    )
  putStrLn
    ( "  different cycle type: "
        ++ show (mathematicallyEquivalent dyn dynC)
    )
  putStrLn ""
  putStrLn "-- Proposition 7.6: factorization changes entanglement"
  let psi0 = [(1, 0), (0, 0), (0, 0), (0, 0)]
      psi1 = [(1 / sqrt 2, 0), (0, 0), (0, 0), (1 / sqrt 2, 0)]
  putStrLn
    ( "  product vector: Schmidt rank "
        ++ show (schmidtRank psi0)
        ++ ", coefficients "
        ++ show (schmidtCoefficients psi0)
    )
  putStrLn
    ( "  rotated vector: Schmidt rank "
        ++ show (schmidtRank psi1)
        ++ ", coefficients "
        ++ show (schmidtCoefficients psi1)
    )
  putStrLn ""
  putStrLn "All demonstrations completed."
