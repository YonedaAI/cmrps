---
reviewer: codex (OpenAI) gpt-6.1-sol
type: haskell
scope: fix verification (3 named bugs from round 1)
round: 2
date: 2026-10-30T13:35:54Z
---
Reading additional input from stdin...
OpenAI Codex v0.166.0
--------
workdir: /Users/mlong/Documents/Development/classification-physical-systems
model: gpt-6.1-sol
provider: openai
approval: never
sandbox: read-only
reasoning effort: medium
reasoning summaries: none
session id: 01a18d06-2d3c-7ee0-b211-074ef757b246
--------
user
Verify ONLY these 3 fixes and report no other issues. Read ONLY these files: src/vol-10-observational-equivalence/Instances.hs, src/vol-11-completeness-obstructions/Instances.hs, src/vol-12-principia-physica/Instances.hs, and for comparison lean/Cmrps/Vol10ObservationalEquivalence.lean, lean/Cmrps/Vol11CompletenessObstructions.lean, lean/Cmrps/Vol12PrincipiaPhysica.lean. Fix 1 (vol-10): the PhysicalSystem FiniteClassicalSystem composition must be the independent product (Cartesian-product) distribution [p*q | p <- ps, q <- qs], not a pointwise multiply (the old pointwise form lost probability mass; [1/2,1/2] composed with itself must sum to 1). Fix 2 (vol-11): undecidability must NOT be assigned to FourManifoldWitness n below the cited n>=9 threshold; the witness must be restricted to n>=9. Fix 3 (vol-12): PrincipiaLayers must carry Lean's realize and select maps, mirroring the PrincipiaLayers structure in lean/Cmrps/Vol12PrincipiaPhysica.lean, so the non-collapse claim is supported by the record shape. For each fix state CORRECT or INCORRECT with file:line evidence. End your response with a VERDICT line - exactly one of: VERDICT: PASS or VERDICT: NEEDS_FIX.
warning: Under-development features enabled: chronicle. Under-development features are incomplete and may behave unpredictably. To suppress this warning, set `suppress_unstable_features_warning = true` in /Users/mlong/.codex/config.toml.
warning: clamping SessionEnd hook timeout to 3s in /Users/mlong/.codex/plugins/cache/openai-codex/codex/1.0.6/hooks/hooks.json
hook: SessionStart
hook: SessionStart
hook: SessionStart
hook: SessionStart
hook: SessionStart
hook: SessionStart
hook: SessionStart Completed
hook: SessionStart Completed
hook: SessionStart Completed
hook: SessionStart Completed
hook: SessionStart Completed
hook: SessionStart Completed
codex
I’ll read only the six listed files and check the three fixes against the Lean definitions.
exec
/usr/local/bin/zsh -lc 'nl -ba src/vol-10-observational-equivalence/Instances.hs
nl -ba src/vol-11-completeness-obstructions/Instances.hs
nl -ba src/vol-12-principia-physica/Instances.hs
nl -ba lean/Cmrps/Vol10ObservationalEquivalence.lean
nl -ba lean/Cmrps/Vol11CompletenessObstructions.lean
nl -ba lean/Cmrps/Vol12PrincipiaPhysica.lean' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
     1	{-# LANGUAGE TypeFamilies #-}
     2	
     3	-- | Module        : Vol10ObservationalEquivalence.Instances
     4	-- Description     : Per-volume taxonomy instances for vol-10-observational-equivalence
     5	--                   (Observational Equivalence and Physical Distinguishability).
     6	-- Paper source    : papers/latex/vol-10-observational-equivalence.tex
     7	-- Lean targets    : verification/vol-10-observational-equivalence-lean-targets.md
     8	--
     9	-- Declares instances of the shared taxonomy classes (Taxonomy.Families,
    10	-- Taxonomy.Equivalences) for the physical systems this volume uses: finite
    11	-- classical observation theories with experiment partitions, finite quantum
    12	-- systems carrying monotone-metric direction data, observation records and
    13	-- the indistinguishability they induce, and the isocategorical witness of the
    14	-- Etingof-Gelaki constraint. Type and method names mirror the paper's
    15	-- definitions and the lean targets.
    16	--
    17	-- Claim status (docs/theorem-registry.md): this module is an executable
    18	-- taxonomy layer. It encodes definitions and computes finite examples as
    19	-- computational evidence. It proves nothing and is not verified by any proof
    20	-- assistant; the honest statement is that executable models are validated
    21	-- against kernel-checked specifications by cross-audit (lean/Cmrps/).
    22	module Vol10ObservationalEquivalence.Instances
    23	  ( -- * Observation records and finite classical systems (paper Definition 4.1)
    24	    Experiment (..)
    25	  , ObservationRecord (..)
    26	  , FiniteClassicalSystem (..)
    27	  , observationOf
    28	  , observationallyEquivalent
    29	    -- * Coarse and fine observations (paper Proposition 4.5)
    30	  , CoarseMap (..)
    31	  , coarseObservationFactor
    32	    -- * Finite quantum systems and monotone metrics (paper Section 5)
    33	  , FiniteQuantumSystem (..)
    34	  , monotoneQuadraticForm
    35	  , commutativeRestrictionCheck
    36	    -- * Isocategorical witness (paper Theorem 3.1 and Corollary 3.2)
    37	  , IsocategoricalWitness (..)
    38	  , preservedLayersOf
    39	  ) where
    40	
    41	import Taxonomy.Families
    42	import Taxonomy.Equivalences
    43	
    44	-- | Paper Definition 4.1: an experiment on a finite microstate set is a
    45	-- partition of the microstate indices into outcome blocks. The outcome
    46	-- distribution of an experiment on a probability vector is the list of block
    47	-- masses.
    48	newtype Experiment = Experiment { outcomeBlocks :: [[Int]] }
    49	  deriving (Eq, Ord, Show)
    50	
    51	-- | Paper Definition 4.1: an observation record packages the outcome
    52	-- distributions of the admissible experiments. Two records are isomorphic in
    53	-- the record category exactly when the encoded lists agree, which is equality
    54	-- on this encoding.
    55	data ObservationRecord = ObservationRecord
    56	  { recordExperiments :: [Experiment]
    57	    -- ^ The admissible experiment family.
    58	  , recordOutcomes :: [[Rational]]
    59	    -- ^ Outcome distribution per experiment, in the order of the family.
    60	  }
    61	  deriving (Eq, Ord, Show)
    62	
    63	-- | A finite classical system: a probability vector on a finite microstate
    64	-- set, together with its experiment family (paper, worked example 9.1).
    65	data FiniteClassicalSystem = FiniteClassicalSystem
    66	  { classicalProbabilities :: [Rational]
    67	    -- ^ Probability vector on the microstate set.
    68	  , classicalExperiments :: [Experiment]
    69	    -- ^ The admissible experiment family.
    70	  }
    71	  deriving (Eq, Show)
    72	
    73	-- | Paper Definition 2.1: the system record schema of a finite classical
    74	-- system. State space is the probability vector, observables are the
    75	-- experiment family, dynamics and symmetry data are trivial in this toy
    76	-- model, and composition of independent copies is the product distribution
    77	-- on the product sample space (the cartesian product of the microstate
    78	-- sets), not a pointwise product.
    79	instance PhysicalSystem FiniteClassicalSystem where
    80	  type StateSpace FiniteClassicalSystem = [Rational]
    81	  type Observables FiniteClassicalSystem = [Experiment]
    82	  type Dynamics FiniteClassicalSystem = ()
    83	  type Symmetries FiniteClassicalSystem = ()
    84	  type Composition FiniteClassicalSystem = ([Rational], [Rational]) -> [Rational]
    85	  stateSpace = classicalProbabilities
    86	  observables = classicalExperiments
    87	  dynamics _ = ()
    88	  symmetries _ = ()
    89	  composition _ = uncurry (\ps qs -> [p * q | p <- ps, q <- qs])
    90	
    91	-- | DEF-030 (Family V: probability and measure-theoretic structures): the
    92	-- classical statistical data of the system is its probability vector. The
    93	-- Fisher metric of Chentsov (T-BG-14) is the unique monotone metric on this
    94	-- data up to constant; the instance records the data, not the metric.
    95	instance FamilyProbabilityMeasure FiniteClassicalSystem where
    96	  type ProbabilityMeasureData FiniteClassicalSystem = [Rational]
    97	  probabilityMeasureData = classicalProbabilities
    98	
    99	-- | Paper Definition 4.1: compute the observation record of a classical
   100	-- system by pushing the probability vector through each experiment: the
   101	-- outcome distribution of a block is the sum of the masses of its
   102	-- microstates.
   103	observationOf :: FiniteClassicalSystem -> ObservationRecord
   104	observationOf sys =
   105	  ObservationRecord
   106	    { recordExperiments = classicalExperiments sys
   107	    , recordOutcomes = map pushforward (classicalExperiments sys)
   108	    }
   109	  where
   110	    probs = classicalProbabilities sys
   111	    pushforward (Experiment blocks) =
   112	      [sum [probs !! i | i <- block] | block <- blocks]
   113	
   114	-- | Paper Proposition 4.2 (lean target obs_induced_equivalence):
   115	-- observational indistinguishability, the relation induced by the observation
   116	-- functor. On this encoding it is equality of records.
   117	observationallyEquivalent :: ObservationRecord -> ObservationRecord -> Bool
   118	observationallyEquivalent = (==)
   119	
   120	-- | Records are the objects of the record category; mathematical equivalence
   121	-- on records is isomorphism of the encoded data (DEF-016 at record level).
   122	instance MathematicalEquivalence ObservationRecord where
   123	  mathematicallyEquivalent = (==)
   124	
   125	-- | Paper Proposition 4.2: physical equivalence on records, in this model,
   126	-- is the indistinguishability relation of the record (DEF-015, instantiated).
   127	-- The relation must be stated, not assumed (Taxonomy.Equivalences).
   128	instance PhysicalEquivalence ObservationRecord where
   129	  physicallyEquivalent = observationallyEquivalent
   130	
   131	-- | Paper Definition 4.4: a coarse map on observation records forgets the
   132	-- experiments in a drop list. The coarse record functor is this map applied
   133	-- to fine records.
   134	newtype CoarseMap = CoarseMap [Experiment]
   135	  deriving (Eq, Show)
   136	
   137	-- | Paper Proposition 4.5 (lean target obs_coarse_graining_composition):
   138	-- coarse records separate less than fine ones. The map drops the listed
   139	-- experiments; two fine records equal after dropping are the strictness
   140	-- witness of the paper's worked example.
   141	coarseObservationFactor :: CoarseMap -> ObservationRecord -> ObservationRecord
   142	coarseObservationFactor (CoarseMap dropList) rec =
   143	  ObservationRecord
   144	    { recordExperiments = kept
   145	    , recordOutcomes = keptOutcomes
   146	    }
   147	  where
   148	    keptPairs =
   149	      [ (e, o)
   150	      | (e, o) <- zip (recordExperiments rec) (recordOutcomes rec)
   151	      , e `notElem` dropList
   152	      ]
   153	    kept = map fst keptPairs
   154	    keptOutcomes = map snd keptPairs
   155	
   156	-- | A finite quantum system: a faithful density operator given by its
   157	-- eigenvalues, and a self-adjoint direction given by its matrix entries
   158	-- (paper Example 5.4 and Section 9.2).
   159	data FiniteQuantumSystem = FiniteQuantumSystem
   160	  { quantumEigenvalues :: [Rational]
   161	    -- ^ Eigenvalues of the faithful density operator.
   162	  , quantumDirection :: [[Rational]]
   163	    -- ^ Matrix entries of the self-adjoint direction A.
   164	  }
   165	  deriving (Eq, Show)
   166	
   167	-- | DEF-027 (Family II: Hilbert spaces and operator algebras): the
   168	-- operator-algebra data of the system is the pair (eigenvalues, direction).
   169	instance FamilyHilbertOperatorAlgebras FiniteQuantumSystem where
   170	  type OperatorAlgebraData FiniteQuantumSystem = ([Rational], [[Rational]])
   171	  operatorAlgebraData sys = (quantumEigenvalues sys, quantumDirection sys)
   172	
   173	-- | DEF-030 quantum side: the monotone-metric data of the system is the
   174	-- state and direction on which the Morozova-Chentsov form of a chosen
   175	-- operator monotone function evaluates (T-BG-18, parametric; classical
   176	-- uniqueness may not be extended, DEP-008). The metric itself is abstract
   177	-- in the shared taxonomy and is not computed as a value here.
   178	instance FamilyProbabilityMeasure FiniteQuantumSystem where
   179	  type ProbabilityMeasureData FiniteQuantumSystem = ([Rational], [[Rational]])
   180	  probabilityMeasureData = operatorAlgebraData
   181	
   182	-- | Paper Section 5 (lean target monotone_not_canonical): the
   183	-- Morozova-Chentsov quadratic form
   184	--   g_f(rho, A) = sum_{i,j} |A_ij|^2 / (lambda_j * f(lambda_i / lambda_j))
   185	-- for an operator monotone f normalized by f(1) = 1. Rational arithmetic on
   186	-- the explicit data of Example 5.4; computational evidence only.
   187	monotoneQuadraticForm
   188	  :: (Rational -> Rational)
   189	  -> [Rational]
   190	  -> [[Rational]]
   191	  -> Rational
   192	monotoneQuadraticForm f lams rows =
   193	  sum
   194	    [ (rows !! i !! j) * (rows !! i !! j)
   195	        / ((lams !! j) * f ((lams !! i) / (lams !! j)))
   196	    | i <- [0 .. n - 1]
   197	    , j <- [0 .. n - 1]
   198	    ]
   199	  where
   200	    n = length lams
   201	
   202	-- | Paper Proposition 5.3 (lean target monotone_commutative_restriction):
   203	-- on a diagonal direction every normalized monotone metric gives the
   204	-- classical Fisher form sum_i a_ii^2 / lambda_i. Returns True when the
   205	-- computed form matches that closed expression for the given f.
   206	commutativeRestrictionCheck
   207	  :: (Rational -> Rational)
   208	  -> [Rational]
   209	  -> [[Rational]]
   210	  -> Bool
   211	commutativeRestrictionCheck f lams rows =
   212	  monotoneQuadraticForm f lams rows == classical
   213	  where
   214	    classical =
   215	      sum [((rows !! i !! i) * (rows !! i !! i)) / (lams !! i) | i <- [0 .. length lams - 1]]
   216	
   217	-- | Paper Theorem 3.1 (lean target eg_plain_tensor_insufficient): the witness
   218	-- of the Etingof-Gelaki constraint. Two non-isomorphic groups with equivalent
   219	-- plain tensor representation categories; the recorded preserved layers are
   220	-- exactly the plain tensor structure, which the constraint forbids as a
   221	-- recovery principle (RecoveryObstruction in Taxonomy.Equivalences).
   222	data IsocategoricalWitness = IsocategoricalWitness
   223	  { isoGroupA :: String
   224	    -- ^ Name of the first group (data stand-in; the construction is cited).
   225	  , isoGroupB :: String
   226	    -- ^ Name of the second group.
   227	  , isoPlainTensorEquivalent :: Bool
   228	    -- ^ Equivalent as plain tensor categories (the insufficient layer).
   229	  , isoSymmetricEquivalent :: Bool
   230	    -- ^ Equivalent as symmetric tensor categories (must differ).
   231	  }
   232	  deriving (Eq, Show)
   233	
   234	-- | DEF-033 (Family VIII: tensor categories and compositional structures):
   235	-- the compositional data of the witness is its pair of names and the two
   236	-- equivalence verdicts.
   237	instance FamilyTensorCategoriesComposition IsocategoricalWitness where
   238	  type TensorCategoryData IsocategoricalWitness = ((String, String), (Bool, Bool))
   239	  tensorCategoryData w =
   240	    ( (isoGroupA w, isoGroupB w)
   241	    , (isoPlainTensorEquivalent w, isoSymmetricEquivalent w)
   242	    )
   243	
   244	-- | Paper Definition 2.6 and Corollary 3.2 (lean target
   245	-- preserved_layer_discipline): the layers of structure an identification
   246	-- preserves must be stated. On this witness the only claim is the plain
   247	-- tensor layer, which carries the recovery obstruction
   248	-- TensorEquivalenceWithoutSymmetricStructure.
   249	preservedLayersOf :: IsocategoricalWitness -> [PreservedStructure]
   250	preservedLayersOf w
   251	  | isoPlainTensorEquivalent w && not (isoSymmetricEquivalent w) = [PlainTensorStructure]
   252	  | otherwise = [SymmetricMonoidalStructure]
     1	{-# LANGUAGE TypeFamilies #-}
     2	
     3	{-|
     4	Module      : Vol11CompletenessObstructions.Instances
     5	Description : Taxonomy instances for the regime taxonomy and obstruction
     6	              witnesses of the completeness-and-obstructions volume.
     7	Copyright   : (c) Matthew Long, 2026
     8	License     : MIT
     9	Maintainer  : matthew@yonedaai.com
    10	Stability   : experimental
    11	
    12	Executable taxonomy layer for the paper "Completeness and Obstructions"
    13	(Part 11 of The Classification of Mathematical Representations of Physical
    14	Systems).  The module imports the shared family classes of "Taxonomy" and
    15	declares instances of them for this volume's witness systems; it never
    16	redefines those classes.
    17	
    18	The regime tag mirrors Definition 4.2 of the paper and the lean target
    19	'Regime'; the type and method names mirror the paper's definitions.  This
    20	module is computational evidence only: it proves nothing, it is not
    21	machine-checked, and no formal verification is claimed for it.
    22	-}
    23	module Vol11CompletenessObstructions.Instances
    24	  ( -- * Regime taxonomy (paper, Definition 4.2)
    25	    ClassificationRegime (..)
    26	  , regimes
    27	  , regimeOf
    28	    -- * Witness systems of the register
    29	  , WitnessSystem
    30	      ( FiniteDimCStar, SimpleGroupWitness, AmenableFactorWitness
    31	      , GeneralII1Witness, IsocategoricalPair, FusionCategoryWitness
    32	      , WildModuleWitness, MarkovGroupWitness, UnknotWitness )
    33	  , fourManifoldWitness
    34	    -- ^ The only way to build 'FourManifoldWitness' (the raw constructor is
    35	    -- not exported): enforces the n >= 9 threshold of the cited
    36	    -- unrecognizability result, returning 'Nothing' below it.
    37	    -- * Family data witnesses
    38	  , OperatorAlgebraWitness (..)
    39	  , DerivedWitness (..)
    40	  , TensorCategoryWitness (..)
    41	  , GeometricWitness (..)
    42	  , CombinatorialWitness (..)
    43	    -- * Invariant mirror (paper, Definition 4.1)
    44	  , classifyCStar
    45	  , sortDesc
    46	  ) where
    47	
    48	import Taxonomy.Families
    49	  ( FamilyHilbertOperatorAlgebras (..)
    50	  , FamilySmoothGeometric (..)
    51	  , FamilyTensorCategoriesComposition (..)
    52	  , FamilyDynamicalSemigroups (..)
    53	  , FamilyDiscreteCombinatorial (..)
    54	  , FamilyDerivedHomotopical (..)
    55	  )
    56	import Taxonomy.Invariants
    57	  ( ClassifyingInvariant (..)
    58	  , DimensionVector (..)
    59	  )
    60	import Taxonomy.Constructions
    61	  ( Construction (..)
    62	  , Constructible (..)
    63	  , Irreducible (..)
    64	  , Decomposition (..)
    65	  , Decomposable (..)
    66	  )
    67	import Taxonomy.Equivalences
    68	  ( MathematicalEquivalence (..)
    69	  , PhysicalEquivalence (..)
    70	  )
    71	
    72	-- | Paper, Definition 4.2: the seven regimes of classification evidence.
    73	-- Constructor names mirror the regime names used in the paper and in the
    74	-- lean targets document.
    75	data ClassificationRegime
    76	  = ParameterizedRegime
    77	    -- ^ Complete invariant, parameter space, and recognizer all exist.
    78	  | UnparameterizedRegime
    79	    -- ^ Complete invariant and recognizer exist; no uniform parameter space.
    80	  | ObstructionCompleteRegime
    81	    -- ^ The classification content is a proved impossibility theorem.
    82	  | OpenRegime
    83	    -- ^ Partial results exist and no impossibility theorem applies.
    84	  | WildRegime
    85	    -- ^ Finite-variety parameterization is provably impossible.
    86	  | UndecidableRegime
    87	    -- ^ No recognition procedure exists in the stated generality.
    88	  | DecidableButUnclassifiedRegime
    89	    -- ^ A recognizer exists; no complete invariant is known.
    90	  deriving (Eq, Ord, Show, Enum, Bounded)
    91	
    92	-- | All seven regimes, in the order of Definition 4.2.
    93	regimes :: [ClassificationRegime]
    94	regimes = [minBound .. maxBound]
    95	
    96	-- | A witness system of the obstruction register and the regime table.
    97	-- Each constructor names the domain whose evidence fixes its regime; the
    98	-- payload is the identifying data used by the paper's examples.
    99	data WitnessSystem
   100	  = FiniteDimCStar [Int]
   101	    -- ^ Finite-dimensional C*-algebra by dimension vector; parameterized.
   102	  | SimpleGroupWitness String
   103	    -- ^ Finite simple group; classified, not parameterized (CFSG gap).
   104	  | AmenableFactorWitness String
   105	    -- ^ Amenable factor; parameterized by type data.
   106	  | GeneralII1Witness String
   107	    -- ^ General separable II_1 factor; obstruction-complete (McDuff).
   108	  | IsocategoricalPair String String
   109	    -- ^ Pair of non-isomorphic groups with equivalent plain tensor
   110	    -- representation categories (Etingof-Gelaki); obstruction-complete.
   111	  | FusionCategoryWitness String
   112	    -- ^ Fusion category; open.
   113	  | WildModuleWitness (Int, Int)
   114	    -- ^ Module of a wild category by rank data; wild.
   115	  | MarkovGroupWitness String
   116	    -- ^ Finitely presented group with a Markov property; undecidable.
   117	  | FourManifoldWitness Int
   118	    -- ^ Connected sum of n copies of S^2 x S^2; unrecognizable for n >= 9.
   119	    -- Internal: construct only through 'fourManifoldWitness', which enforces
   120	    -- the threshold of the cited result.
   121	  | UnknotWitness Int
   122	    -- ^ Knot diagram by crossing count; decidable-but-unclassified.
   123	  deriving (Eq, Show)
   124	
   125	-- | Smart constructor for 'FourManifoldWitness'. The cited unrecognizability
   126	-- result (paper, Table 4) holds only for n >= 9, so witnesses below that
   127	-- threshold are not admitted.
   128	fourManifoldWitness :: Int -> Maybe WitnessSystem
   129	fourManifoldWitness n
   130	  | n >= 9    = Just (FourManifoldWitness n)
   131	  | otherwise = Nothing
   132	
   133	-- | Paper, Table 4: the regime of each witness system.  Total by
   134	-- construction, mirroring the lean target 'RegimeAssignment'.
   135	regimeOf :: WitnessSystem -> ClassificationRegime
   136	regimeOf (FiniteDimCStar _)        = ParameterizedRegime
   137	regimeOf (SimpleGroupWitness _)    = UnparameterizedRegime
   138	regimeOf (AmenableFactorWitness _) = ParameterizedRegime
   139	regimeOf (GeneralII1Witness _)     = ObstructionCompleteRegime
   140	regimeOf (IsocategoricalPair _ _)  = ObstructionCompleteRegime
   141	regimeOf (FusionCategoryWitness _) = OpenRegime
   142	regimeOf (WildModuleWitness _)     = WildRegime
   143	regimeOf (MarkovGroupWitness _)    = UndecidableRegime
   144	regimeOf (FourManifoldWitness n)
   145	  | n >= 9    = UndecidableRegime
   146	  | otherwise = OpenRegime
   147	    -- Below the cited n >= 9 threshold no unrecognizability theorem applies.
   148	regimeOf (UnknotWitness _)         = DecidableButUnclassifiedRegime
   149	
   150	-- | Operator-algebra structural data, for the 'FamilyHilbertOperatorAlgebras'
   151	-- instance.  'Nothing' at the instance level means the witness carries no
   152	-- operator-algebra data here.
   153	data OperatorAlgebraWitness
   154	  = CStarBlocks [Int]
   155	    -- ^ Dimension vector of a finite-dimensional C*-algebra.
   156	  | FactorTag String
   157	    -- ^ Named factor witness.
   158	  deriving (Eq, Show)
   159	
   160	-- | Derived and homotopical data, for 'FamilyDerivedHomotopical'.
   161	data DerivedWitness
   162	  = DerivedWildTag (Int, Int)
   163	    -- ^ Rank data of a derived-wild module category witness.
   164	  deriving (Eq, Show)
   165	
   166	-- | Tensor-category data, for 'FamilyTensorCategoriesComposition'.
   167	data TensorCategoryWitness
   168	  = PlainTensorRep String
   169	    -- ^ Plain tensor representation category of a named group.
   170	  | SymmetricTensorRep String
   171	    -- ^ Symmetric tensor representation category of a named group.
   172	  | FusionCategoryTag String
   173	    -- ^ Named fusion category witness.
   174	  deriving (Eq, Show)
   175	
   176	-- | Geometric data, for 'FamilySmoothGeometric'.
   177	data GeometricWitness
   178	  = FourManifoldTag Int
   179	    -- ^ Connected sum of n copies of S^2 x S^2.
   180	  | KnotDiagramTag Int
   181	    -- ^ Knot diagram with the given crossing count.
   182	  deriving (Eq, Show)
   183	
   184	-- | Combinatorial data, for 'FamilyDiscreteCombinatorial'.
   185	data CombinatorialWitness
   186	  = MarkovPresentation String
   187	    -- ^ Finite presentation carrying a Markov property.
   188	  | FiniteGroupData String
   189	    -- ^ Combinatorial data of a named finite group.
   190	  deriving (Eq, Show)
   191	
   192	-- | Paper, Definition 4.1: the dimension vector is the complete invariant of
   193	-- finite-dimensional complex C*-algebras up to *-isomorphism.  The mirror
   194	-- returns the classifying-invariant tag of 'Taxonomy.Invariants' and 'Nothing'
   195	-- outside that domain.
   196	classifyCStar :: WitnessSystem -> Maybe ClassifyingInvariant
   197	classifyCStar (FiniteDimCStar ns) =
   198	  Just (ByDimensionVector (DimensionVector (sortDesc ns)))
   199	classifyCStar _ = Nothing
   200	
   201	-- | Sort a dimension vector in non-increasing order, so that equal
   202	-- multisets of block sizes compare equal.
   203	sortDesc :: [Int] -> [Int]
   204	sortDesc = foldr insertDesc []
   205	  where
   206	    insertDesc :: Int -> [Int] -> [Int]
   207	    insertDesc x [] = [x]
   208	    insertDesc x (y : ys)
   209	      | x >= y    = x : y : ys
   210	      | otherwise = y : insertDesc x ys
   211	
   212	instance FamilyHilbertOperatorAlgebras WitnessSystem where
   213	  type OperatorAlgebraData WitnessSystem = Maybe OperatorAlgebraWitness
   214	  operatorAlgebraData (FiniteDimCStar ns) = Just (CStarBlocks ns)
   215	  operatorAlgebraData (GeneralII1Witness n) = Just (FactorTag n)
   216	  operatorAlgebraData (AmenableFactorWitness n) = Just (FactorTag n)
   217	  operatorAlgebraData _ = Nothing
   218	
   219	instance FamilyDerivedHomotopical WitnessSystem where
   220	  type DerivedHomotopicalData WitnessSystem = Maybe DerivedWitness
   221	  derivedHomotopicalData (WildModuleWitness r) = Just (DerivedWildTag r)
   222	  derivedHomotopicalData _ = Nothing
   223	
   224	instance FamilyTensorCategoriesComposition WitnessSystem where
   225	  type TensorCategoryData WitnessSystem = Maybe TensorCategoryWitness
   226	  tensorCategoryData (IsocategoricalPair g _) = Just (PlainTensorRep g)
   227	  tensorCategoryData (FusionCategoryWitness n) = Just (FusionCategoryTag n)
   228	  tensorCategoryData (SimpleGroupWitness g) = Just (SymmetricTensorRep g)
   229	  tensorCategoryData _ = Nothing
   230	
   231	instance FamilySmoothGeometric WitnessSystem where
   232	  type GeometricData WitnessSystem = Maybe GeometricWitness
   233	  geometricData (FourManifoldWitness n) = Just (FourManifoldTag n)
   234	  geometricData (UnknotWitness n) = Just (KnotDiagramTag n)
   235	  geometricData _ = Nothing
   236	
   237	instance FamilyDiscreteCombinatorial WitnessSystem where
   238	  type CombinatorialData WitnessSystem = Maybe CombinatorialWitness
   239	  combinatorialData (MarkovGroupWitness p) = Just (MarkovPresentation p)
   240	  combinatorialData (SimpleGroupWitness g) = Just (FiniteGroupData g)
   241	  combinatorialData _ = Nothing
   242	
   243	-- | Direct sum concatenates dimension vectors; every other construction is
   244	-- left unsupplied here, which asserts nothing about its existence.
   245	instance Constructible WitnessSystem where
   246	  type Composite WitnessSystem = WitnessSystem
   247	  tensorProduct _ _ = Nothing
   248	  directSum (FiniteDimCStar a) (FiniteDimCStar b) =
   249	    Just (FiniteDimCStar (sortDesc (a ++ b)))
   250	  directSum _ _ = Nothing
   251	  extend _ _ _ = Nothing
   252	  limitHook _ _ = Nothing
   253	  colimitHook _ _ = Nothing
   254	  quotientReduction _ _ = Nothing
   255	
   256	-- | Irreducibility is relative to the named construction, as in the paper:
   257	-- single-block C*-algebras are irreducible for direct sum, and factors are
   258	-- irreducible for factorization.
   259	instance Irreducible WitnessSystem where
   260	  irreducibilityBasis (FiniteDimCStar [_]) = DirectSum
   261	  irreducibilityBasis (GeneralII1Witness _) = Factorization
   262	  irreducibilityBasis (AmenableFactorWitness _) = Factorization
   263	  irreducibilityBasis _ = DirectSum
   264	
   265	-- | The block decomposition of a finite-dimensional C*-algebra, mirroring
   266	-- the paper's model theorem: A = sum_i M_{n_i}(C) with each block irreducible.
   267	instance Decomposable WitnessSystem where
   268	  decomposition (FiniteDimCStar ns) =
   269	    Just (Decomposition DirectSum [FiniteDimCStar [n] | n <- ns])
   270	  decomposition _ = Nothing
   271	
   272	-- | Mathematical equivalence of witnesses: dimension vectors compared as
   273	-- multisets, named witnesses compared by name.  This is the finer relation
   274	-- of the paper (isomorphism of presentations).
   275	instance MathematicalEquivalence WitnessSystem where
   276	  mathematicallyEquivalent (FiniteDimCStar a) (FiniteDimCStar b) =
   277	    sortDesc a == sortDesc b
   278	  mathematicallyEquivalent (IsocategoricalPair a b) (IsocategoricalPair c d) =
   279	    (a == c && b == d) || (a == d && b == c)
   280	  mathematicallyEquivalent x y = x == y
   281	
   282	-- | Physical equivalence of witnesses, with the relation stated: two
   283	-- witnesses are physically equivalent exactly when they sit in the same
   284	-- regime of Definition 4.2.  This relation is declared for taxonomy purposes
   285	-- and is not proposed as an equivalence for physical systems.
   286	instance PhysicalEquivalence WitnessSystem where
   287	  physicallyEquivalent a b = regimeOf a == regimeOf b
   288	
   289	-- | The dynamical-semigroup family is referenced by the volume but carries
   290	-- no witness data here; the instance records the absence rather than
   291	-- inventing data.
   292	instance FamilyDynamicalSemigroups WitnessSystem where
   293	  type DynamicalSemigroupData WitnessSystem = ()
   294	  dynamicalSemigroupData _ = ()
     1	{-# LANGUAGE TypeFamilies #-}
     2	
     3	-- | Module        : Vol12PrincipiaPhysica.Instances
     4	-- Description     : Executable taxonomy instances for Volume 12, Principia
     5	--                   Physica: the layered assembly and the worked example of
     6	--                   Section 9 of the paper.
     7	-- Copyright   : (c) Matthew Long, 2026
     8	-- License     : MIT
     9	-- Maintainer  : matthew@yonedaai.com
    10	-- Stability   : experimental
    11	--
    12	-- This module declares instances of the shared taxonomy classes in
    13	-- "Taxonomy.Families", "Taxonomy.Constructions", "Taxonomy.Equivalences", and
    14	-- "Taxonomy.Invariants" for the systems this volume studies. The family
    15	-- classes are imported and never redefined. The worked example is the
    16	-- finite-dimensional C*-algebra A = C (+) M_2(C) of the paper: its dimension
    17	-- vector is the classifying invariant, its blocks are the irreducible
    18	-- constituents under direct sum, and its invariant record is the data the
    19	-- three layers read.
    20	--
    21	-- Claim status (docs/theorem-registry.md): this module is executable
    22	-- taxonomy, that is computational evidence only. It proves nothing and is
    23	-- never "verified by Lean"; the honest statement is that executable models
    24	-- are validated against kernel-checked specifications when such
    25	-- specifications exist. Type and method names mirror the paper's
    26	-- definitions and the targets in
    27	-- verification/vol-12-principia-physica-lean-targets.md.
    28	module Vol12PrincipiaPhysica.Instances
    29	  ( -- * Regime and evidence vocabulary (paper, Definition 2.6 and 2.7)
    30	    Regime (..)
    31	  , EvidenceGrade (..)
    32	  , regimeTally
    33	    -- * The layered assembly (paper, Definition 2.5)
    34	  , PrincipiaLayers (..)
    35	    -- * Worked example (paper, Section 9.1)
    36	  , FiniteDimQuantumExample (..)
    37	  , MatrixBlock (..)
    38	  , dimensionVectorExample
    39	  , decompositionExample
    40	  , invariantRecordExample
    41	    -- * Executable checks (computational evidence, never proofs)
    42	  , classificationOrderCheck
    43	  , decompositionCheck
    44	  ) where
    45	
    46	import Data.List (sort)
    47	
    48	import Taxonomy.Constructions
    49	  ( Construction (..)
    50	  , Decomposable (..)
    51	  , Decomposition (..)
    52	  , Irreducible (..)
    53	  )
    54	import Taxonomy.Equivalences (MathematicalEquivalence (..))
    55	import Taxonomy.Families
    56	  ( FamilyHilbertOperatorAlgebras (..)
    57	  , PhysicalSystem (..)
    58	  )
    59	import Taxonomy.Invariants
    60	  ( ClassifyingInvariant (..)
    61	  , DimensionVector (..)
    62	  , InvariantRecord (..)
    63	  )
    64	
    65	-- | Classification regimes of the paper (Definition 2.7). The constructors
    66	-- mirror the seven regimes exactly: complete and parameterized, complete but
    67	-- unparameterized, complete as obstruction, open, impossible in the stated
    68	-- generality, undecidable, and decidable but unclassified.
    69	data Regime
    70	  = CompleteParameterized
    71	  | CompleteUnparameterized
    72	  | CompleteAsObstruction
    73	  | OpenRegime
    74	  | ImpossibleRegime
    75	  | UndecidableRegime
    76	  | DecidableUnclassified
    77	  deriving (Eq, Ord, Show, Enum, Bounded)
    78	
    79	-- | Evidence grades of the paper (Definition 2.6): formulation, rigorous
    80	-- theorem, physical validation. The registry of the program places records
    81	-- at the first two grades only; no record reaches 'PhysicalValidation'.
    82	data EvidenceGrade
    83	  = Formulation
    84	  | RigorousTheorem
    85	  | PhysicalValidation
    86	  deriving (Eq, Ord, Show, Enum, Bounded)
    87	
    88	-- | Tally domain rows by regime. The paper's Theorem 4.1 counts the rows of
    89	-- its regime table; this function is the executable form of that count and
    90	-- returns one pair per regime that occurs.
    91	regimeTally :: [(String, Regime)] -> [(Regime, Int)]
    92	regimeTally rows =
    93	  [ (r, length (filter ((== r) . snd) rows))
    94	  | r <- [minBound .. maxBound]
    95	  , any ((== r) . snd) rows
    96	  ]
    97	
    98	-- | The Principia architecture (Definition 2.5): mathematical
    99	-- classification, physical realization, and empirical selection, with the
   100	-- realization and selection maps mirroring 'Cmrps.Vol12.PrincipiaLayers'
   101	-- (lean/Cmrps/Vol12PrincipiaPhysica.lean). The non-collapse of the layers is
   102	-- a supplied condition, not a consequence of the record shape: mirroring
   103	-- Lean's 'NotFactoring', the equivalence relation induced by 'select' must
   104	-- differ from the one induced by classification.
   105	data PrincipiaLayers m r e = PrincipiaLayers
   106	  { mathLayer :: m
   107	    -- ^ Layer M: a classification of admissible structures.
   108	  , realizationLayer :: r
   109	    -- ^ Layer R: a physical theory.
   110	  , selectionLayer :: e
   111	    -- ^ Layer E: observational data.
   112	  , realize :: m -> r
   113	    -- ^ The realization map R : M -> P of Definition 2.5.
   114	  , select :: r -> e
   115	    -- ^ The selection map E : P -> Eobs of Definition 2.5.
   116	  }
   117	
   118	-- | The worked example of the paper (Section 9.1): the finite-dimensional
   119	-- complex C*-algebra A = C (+) M_2(C), recorded by its dimension vector. The
   120	-- list of block sizes is the multiset that classifies the algebra up to
   121	-- *-isomorphism (T-BG-06); the order of the list carries no meaning.
   122	newtype FiniteDimQuantumExample = FiniteDimQuantumExample
   123	  { exampleBlocks :: [Int] }
   124	  deriving (Eq, Show)
   125	
   126	-- | An irreducible matrix block M_n(C) of a finite-dimensional C*-algebra.
   127	-- The integer is the block size n.
   128	newtype MatrixBlock = MatrixBlock
   129	  { matrixSize :: Int }
   130	  deriving (Eq, Ord, Show)
   131	
   132	-- | The dimension vector of the worked example: A = C (+) M_2(C) has
   133	-- dimension vector {1, 2}. Mirrors the paper's Lemma 5.1 statement and the
   134	-- lean target FiniteDimCStarDecomposition.
   135	dimensionVectorExample :: DimensionVector
   136	dimensionVectorExample = DimensionVector [1, 2]
   137	
   138	-- | The decomposition of the worked example into irreducible blocks under
   139	-- the direct-sum construction: one block of size one and one block of size
   140	-- two. Mirrors the paper's Lemma 5.1: the multiset of sizes is unique up to
   141	-- order.
   142	decompositionExample :: Decomposition FiniteDimQuantumExample
   143	decompositionExample = Decomposition
   144	  { decompositionConstruction = DirectSum
   145	  , irreducibleFactors =
   146	      [ FiniteDimQuantumExample [1]
   147	      , FiniteDimQuantumExample [2]
   148	      ]
   149	  }
   150	
   151	-- | The structural invariant record of the worked example (Definition 2.8):
   152	-- states, observables, dynamics, symmetries, and representations all reduce
   153	-- to block data in this example. The representation entry is the
   154	-- classifying dimension vector.
   155	invariantRecordExample :: InvariantRecord [Int] [Int] [Int] [Int] ClassifyingInvariant
   156	invariantRecordExample = InvariantRecord
   157	  { stateInvariants = [1, 2]
   158	  , observableInvariants = [1, 2]
   159	  , dynamicsInvariants = [1, 2]
   160	  , symmetryInvariants = [1, 2]
   161	  , representationInvariants = ByDimensionVector dimensionVectorExample
   162	  }
   163	
   164	instance PhysicalSystem FiniteDimQuantumExample where
   165	  type StateSpace FiniteDimQuantumExample = [Int]
   166	  type Observables FiniteDimQuantumExample = [Int]
   167	  type Dynamics FiniteDimQuantumExample = [Int]
   168	  type Symmetries FiniteDimQuantumExample = [Int]
   169	  type Composition FiniteDimQuantumExample = [Construction]
   170	  stateSpace = exampleBlocks
   171	  observables = exampleBlocks
   172	  dynamics = exampleBlocks
   173	  symmetries = exampleBlocks
   174	  composition ex = [DirectSum | length (exampleBlocks ex) > 1]
   175	
   176	instance FamilyHilbertOperatorAlgebras FiniteDimQuantumExample where
   177	  type OperatorAlgebraData FiniteDimQuantumExample = DimensionVector
   178	  operatorAlgebraData = DimensionVector . sort . exampleBlocks
   179	
   180	instance Irreducible MatrixBlock where
   181	  irreducibilityBasis _ = DirectSum
   182	
   183	instance Decomposable FiniteDimQuantumExample where
   184	  decomposition ex
   185	    | length (exampleBlocks ex) == 1 = Nothing
   186	    | otherwise = Just Decomposition
   187	        { decompositionConstruction = DirectSum
   188	        , irreducibleFactors = map (FiniteDimQuantumExample . pure) (exampleBlocks ex)
   189	        }
   190	
   191	instance MathematicalEquivalence FiniteDimQuantumExample where
   192	  -- | *-isomorphism of the algebras, per T-BG-06: two examples are
   193	  -- mathematically equivalent exactly when their block multisets agree.
   194	  -- This is not physical equivalence (DEF-015); the choice of physical
   195	  -- equivalence is open and no instance of it is declared here.
   196	  mathematicallyEquivalent a b =
   197	    sort (exampleBlocks a) == sort (exampleBlocks b)
   198	
   199	-- | Executable check for the classification claim of the worked example:
   200	-- block order does not affect mathematical equivalence, and different block
   201	-- multisets are not equivalent. Mirrors the paper's Lemma 8.1 statement and
   202	-- the lean target FiniteDimCStarDecomposition. Computational evidence only.
   203	classificationOrderCheck :: Bool
   204	classificationOrderCheck =
   205	  mathematicallyEquivalent (FiniteDimQuantumExample [2, 1])
   206	                           (FiniteDimQuantumExample [1, 2])
   207	    && not (mathematicallyEquivalent (FiniteDimQuantumExample [1, 2])
   208	                                     (FiniteDimQuantumExample [2, 2]))
   209	
   210	-- | Executable check for the decomposition claim of the worked example: the
   211	-- two factors of 'decompositionExample' have one block each, and concatenating
   212	-- their block lists reconstructs the block list of the original example.
   213	-- Computational evidence only.
   214	decompositionCheck :: Bool
   215	decompositionCheck =
   216	  all ((== 1) . length . exampleBlocks) (irreducibleFactors decompositionExample)
   217	    && concatMap exampleBlocks (irreducibleFactors decompositionExample)
   218	         == exampleBlocks (FiniteDimQuantumExample [1, 2])
     1	import Mathlib.Algebra.BigOperators.Group.Finset.Basic
     2	import Mathlib.Tactic
     3	
     4	/-!
     5	# Observational Equivalence and Physical Distinguishability (Volume 10)
     6	
     7	Formalization of the tractable mechanization targets of
     8	`verification/vol-10-observational-equivalence-lean-targets.md`, mirroring the names of
     9	`papers/latex/vol-10-observational-equivalence.tex`.
    10	
    11	Policy of this module: definitions are stated directly; survey theorems whose content is
    12	external literature (Etingof–Gelaki, Chentsov, Petz–Sudar) are formalized as their honest
    13	logical skeleton, with the classical inputs recorded as explicit hypotheses or as
    14	statement definitions left unproved. Nothing in this file uses `sorry` or new axioms.
    15	-/
    16	
    17	namespace Cmrps.Vol10
    18	
    19	/-! ## Equivalence notions (Definitions 2.1–2.7) -/
    20	
    21	/-- Definition 2.1 (System record): a physical system representation is a tuple
    22	`P = (X, O, D, S, C)` of state space, observable collection, dynamics, symmetry and
    23	constraint data, and composition rules. -/
    24	structure SystemRecord where
    25	  /-- State space or geometric structure. -/
    26	  X : Type
    27	  /-- Observable algebra or collection. -/
    28	  O : Type
    29	  /-- Dynamical data. -/
    30	  D : Type
    31	  /-- Symmetry and constraint data. -/
    32	  S : Type
    33	  /-- Composition or interaction rules. -/
    34	  C : Type
    35	
    36	/-- Definition 2.5 (admissible candidate relation): a candidate `≃` is admissible only if
    37	`≅ ⊆ ≃` and `≃` is contained in the intersection of the admissible observational
    38	relations. Here `mathIso` is mathematical equivalence and `admissible` is the family of
    39	admissible observational relations `≈_Obs`. -/
    40	def AdmissibleCandidate {S : Type*} (mathIso : S → S → Prop)
    41	    (admissible : Set (S → S → Prop)) (candidate : S → S → Prop) : Prop :=
    42	  (∀ P Q, mathIso P Q → candidate P Q) ∧
    43	    ∀ P Q, candidate P Q → ∀ rel ∈ admissible, rel P Q
    44	
    45	/-- The equivalence notion in force (Definition 2.6). -/
    46	inductive EquivalenceNotion where
    47	  | mathematical
    48	  | physical
    49	deriving DecidableEq, Repr
    50	
    51	/-- The morphism kinds of the object schema at the observational level
    52	(Definition 2.7). -/
    53	inductive MorphismKind where
    54	  | coarseGraining
    55	  | embedding
    56	  | duality
    57	  | limitingProcedure
    58	deriving DecidableEq, Repr
    59	
    60	/-- The layers of structure an identification may preserve (Definition 2.6, Table 3). -/
    61	inductive PreservedLayer where
    62	  | symmetricMonoidal
    63	  | braided
    64	  | monoidalWithoutSymmetry
    65	  | star
    66	  | algebraic
    67	  | topological
    68	  | completePositivity
    69	  | unitaryFreedom
    70	deriving DecidableEq, Repr
    71	
    72	/-- Definition 2.6 (equivalence witness): an identification of two systems records the
    73	equivalence notion in force, the morphism kind realizing it, and the layers of structure
    74	it preserves. -/
    75	structure EquivalenceWitness where
    76	  /-- The equivalence notion in force. -/
    77	  notion : EquivalenceNotion
    78	  /-- The morphism kind realizing the identification. -/
    79	  morphism : MorphismKind
    80	  /-- The layers of structure the identification preserves. -/
    81	  preservedLayers : Set PreservedLayer
    82	
    83	/-- A witness declares the symmetric monoidal layer. -/
    84	def DeclaresSymmetric (w : EquivalenceWitness) : Prop :=
    85	  PreservedLayer.symmetricMonoidal ∈ w.preservedLayers
    86	
    87	/-! ## Observation functors (Definition 4.1, Definition 2.4) -/
    88	
    89	/-- Definition 4.1 (observation functor), skeletal form: a functor `Obs` from systems to
    90	observation records, with record comparison abstracted as record isomorphism (an
    91	equivalence relation on records). -/
    92	structure ObservationFunctor (S R : Type*) where
    93	  /-- The observation record of a system. -/
    94	  obs : S → R
    95	  /-- Isomorphism of observation records. -/
    96	  recordIso : R → R → Prop
    97	  /-- Record isomorphism is an equivalence relation. -/
    98	  recordIso_equiv : Equivalence recordIso
    99	
   100	/-- Definition 2.4 (observational equivalence): `P ≈ Q` when the observation records of
   101	`P` and `Q` are isomorphic. -/
   102	def obsEquiv {S R : Type*} (F : ObservationFunctor S R) (P Q : S) : Prop :=
   103	  F.recordIso (F.obs P) (F.obs Q)
   104	
   105	/-- The record isomorphism class of a record (Proposition 4.2). -/
   106	def recordClass {R : Type*} (rel : R → R → Prop) (h : Equivalence rel) : R → Quotient ⟨rel, h⟩ :=
   107	  Quotient.mk ⟨rel, h⟩
   108	
   109	/-- Proposition 4.2 (induced relation): the relation `P ≈ Q` defined by record
   110	isomorphism is an equivalence relation on systems. -/
   111	theorem obs_induced_equivalence {S R : Type*} (F : ObservationFunctor S R) :
   112	    Equivalence (obsEquiv F) where
   113	  refl _P := F.recordIso_equiv.refl _
   114	  symm h := F.recordIso_equiv.symm h
   115	  trans h1 h2 := F.recordIso_equiv.trans h1 h2
   116	
   117	/-- Proposition 4.2 (classes are fibers): `P ≈ Q` holds exactly when the record
   118	isomorphism classes of `Obs P` and `Obs Q` coincide. -/
   119	theorem obs_class_fibers {S R : Type*} (F : ObservationFunctor S R) (P Q : S) :
   120	    recordClass F.recordIso F.recordIso_equiv (F.obs P)
   121	      = recordClass F.recordIso F.recordIso_equiv (F.obs Q) ↔ obsEquiv F P Q := by
   122	  constructor
   123	  · intro h
   124	    exact Quotient.exact h
   125	  · intro h
   126	    exact Quotient.sound h
   127	
   128	/-- Proposition 4.2 (universal quotient property): every map out of the systems that is
   129	constant on `≈`-classes factors uniquely through the quotient by `≈`. -/
   130	theorem obs_quotient_factor {S T R : Type*} (F : ObservationFunctor S R)
   131	    (f : S → T) (hf : ∀ P Q, obsEquiv F P Q → f P = f Q) :
   132	    ∃! g : Quotient ⟨obsEquiv F, obs_induced_equivalence F⟩ → T,
   133	      ∀ P, g (Quotient.mk _ P) = f P := by
   134	  refine ⟨Quotient.lift f (fun P Q h => hf P Q h), ?_, ?_⟩
   135	  · intro P
   136	    rfl
   137	  · intro g hg
   138	    funext x
   139	    refine Quotient.inductionOn x fun P => ?_
   140	    exact hg P
   141	
   142	/-- Lemma 4.3 (setup): the product of two observation functors is an observation functor
   143	into the product of the record categories. -/
   144	def ObservationFunctor.prod {S R₁ R₂ : Type*} (F₁ : ObservationFunctor S R₁)
   145	    (F₂ : ObservationFunctor S R₂) : ObservationFunctor S (R₁ × R₂) where
   146	  obs := fun P => (F₁.obs P, F₂.obs P)
   147	  recordIso := fun x y => F₁.recordIso x.1 y.1 ∧ F₂.recordIso x.2 y.2
   148	  recordIso_equiv :=
   149	    { refl := fun _x => ⟨F₁.recordIso_equiv.refl _, F₂.recordIso_equiv.refl _⟩
   150	      symm := fun ⟨h1, h2⟩ => ⟨F₁.recordIso_equiv.symm h1, F₂.recordIso_equiv.symm h2⟩
   151	      trans := fun ⟨a, b⟩ ⟨c, d⟩ =>
   152	        ⟨F₁.recordIso_equiv.trans a c, F₂.recordIso_equiv.trans b d⟩ }
   153	
   154	/-- Lemma 4.3 (products of observations): the relation induced by a product of
   155	observation functors is the intersection of the relations of the two factors. -/
   156	theorem obs_products_intersection {S R₁ R₂ : Type*} (F₁ : ObservationFunctor S R₁)
   157	    (F₂ : ObservationFunctor S R₂) (P Q : S) :
   158	    obsEquiv (F₁.prod F₂) P Q ↔ obsEquiv F₁ P Q ∧ obsEquiv F₂ P Q :=
   159	  Iff.rfl
   160	
   161	/-! ## Coarse and fine observations (Definition 4.4, Proposition 4.5) -/
   162	
   163	/-- Definition 4.4 (coarse and fine observations): `Obs_c` is a coarsening of `Obs_f`
   164	when a forgetting map `h` on records exists with `Obs_c = h ∘ Obs_f`. -/
   165	structure Coarsening {S Rf Rc : Type*} (Ff : ObservationFunctor S Rf) (obsC : S → Rc) where
   166	  /-- The comparison map on records that forgets detail. -/
   167	  h : Rf → Rc
   168	  /-- `Obs_c = h ∘ Obs_f` on systems. -/
   169	  factors : obsC = h ∘ Ff.obs
   170	
   171	/-- Proposition 4.5 (coarse records separate less), inclusion direction: if
   172	`Obs_c = h ∘ Obs_f` and `h` carries record isomorphisms to record isomorphisms, then
   173	fine equivalence implies coarse equivalence. -/
   174	theorem obs_coarse_graining_composition {S Rf Rc : Type*}
   175	    (Ff : ObservationFunctor S Rf) (Fc : ObservationFunctor S Rc)
   176	    (h : Rf → Rc) (factors : Fc.obs = h ∘ Ff.obs)
   177	    (h_mono : ∀ x y, Ff.recordIso x y → Fc.recordIso (h x) (h y))
   178	    (P Q : S) (hpq : obsEquiv Ff P Q) : obsEquiv Fc P Q := by
   179	  have hP : Fc.obs P = h (Ff.obs P) := by rw [factors]; rfl
   180	  have hQ : Fc.obs Q = h (Ff.obs Q) := by rw [factors]; rfl
   181	  show Fc.recordIso (Fc.obs P) (Fc.obs Q)
   182	  rw [hP, hQ]
   183	  exact h_mono (Ff.obs P) (Ff.obs Q) hpq
   184	
   185	/-! ## The four-point witness of §9.1 -/
   186	
   187	/-- A probability vector on the four-point sample space `Ω = {1,2,3,4}` of §9.1. -/
   188	structure Dist4 where
   189	  x1 : ℚ
   190	  x2 : ℚ
   191	  x3 : ℚ
   192	  x4 : ℚ
   193	deriving DecidableEq, Repr
   194	
   195	/-- The distribution `p = (1/2, 1/4, 1/8, 1/8)` of §9.1. -/
   196	def pDist : Dist4 := ⟨1/2, 1/4, 1/8, 1/8⟩
   197	
   198	/-- The distribution `q = (1/4, 1/2, 1/8, 1/8)` of §9.1. -/
   199	def qDist : Dist4 := ⟨1/4, 1/2, 1/8, 1/8⟩
   200	
   201	/-- The distribution `r = (1/8, 1/8, 1/2, 1/4)` of §9.4. -/
   202	def rDist : Dist4 := ⟨1/8, 1/8, 1/2, 1/4⟩
   203	
   204	/-- Experiment `e1 = {{1,2},{3,4}}`: its outcome distribution on `v`. -/
   205	def e1Push (v : Dist4) : ℚ × ℚ := (v.x1 + v.x2, v.x3 + v.x4)
   206	
   207	/-- Experiment `e2 = {{1,3},{2,4}}`: its outcome distribution on `v`. -/
   208	def e2Push (v : Dist4) : ℚ × ℚ := (v.x1 + v.x3, v.x2 + v.x4)
   209	
   210	/-- Experiment `e3 = {{1,4},{2,3}}`: its outcome distribution on `v`. -/
   211	def e3Push (v : Dist4) : ℚ × ℚ := (v.x1 + v.x4, v.x2 + v.x3)
   212	
   213	/-- Two distributions report the same record for the experiment `push`. -/
   214	def SameRecord (push : Dist4 → ℚ × ℚ) (v w : Dist4) : Prop :=
   215	  (push v).1 = (push w).1 ∧ (push v).2 = (push w).2
   216	
   217	/-- The diagonal joint event `{ω1 = ω2}` on the composite `Ω × Ω` (Proposition 4.6). -/
   218	def diagJoint (v w : Dist4) : ℚ :=
   219	  v.x1 * w.x1 + v.x2 * w.x2 + v.x3 * w.x3 + v.x4 * w.x4
   220	
   221	/-- Proposition 4.5 (strictness witness of §9.1): the coarse record `e1` identifies `p`
   222	and `q`, while the fine record over `e1` and `e2` separates them; the inclusion of
   223	relations is strict. -/
   224	theorem obs_coarse_witness :
   225	    SameRecord e1Push pDist qDist ∧ ¬ SameRecord e2Push pDist qDist := by
   226	  constructor
   227	  · show (e1Push pDist).1 = (e1Push qDist).1 ∧ (e1Push pDist).2 = (e1Push qDist).2
   228	    constructor
   229	    · norm_num [e1Push, pDist, qDist]
   230	    · norm_num [e1Push, pDist, qDist]
   231	  · intro h
   232	    norm_num [SameRecord, e2Push, pDist, qDist] at h
   233	
   234	/-! ## Composed experiments (Proposition 4.6) -/
   235	
   236	/-- The observation functor of a composite system whose record is the product of the
   237	factor records (the hypothesis of Proposition 4.6). -/
   238	def ObservationFunctor.compProd {S₁ S₂ R₁ R₂ : Type*} (F₁ : ObservationFunctor S₁ R₁)
   239	    (F₂ : ObservationFunctor S₂ R₂) : ObservationFunctor (S₁ × S₂) (R₁ × R₂) where
   240	  obs := fun PQ => (F₁.obs PQ.1, F₂.obs PQ.2)
   241	  recordIso := fun x y => F₁.recordIso x.1 y.1 ∧ F₂.recordIso x.2 y.2
   242	  recordIso_equiv :=
   243	    { refl := fun _x => ⟨F₁.recordIso_equiv.refl _, F₂.recordIso_equiv.refl _⟩
   244	      symm := fun ⟨h1, h2⟩ => ⟨F₁.recordIso_equiv.symm h1, F₂.recordIso_equiv.symm h2⟩
   245	      trans := fun ⟨a, b⟩ ⟨c, d⟩ =>
   246	        ⟨F₁.recordIso_equiv.trans a c, F₂.recordIso_equiv.trans b d⟩ }
   247	
   248	/-- Proposition 4.6 (composed experiments), product direction: under product records
   249	indistinguishability of the factors is preserved on composites. -/
   250	theorem obs_composed_product_preserved {S₁ S₂ R₁ R₂ : Type*}
   251	    (F₁ : ObservationFunctor S₁ R₁) (F₂ : ObservationFunctor S₂ R₂)
   252	    (P P' : S₁) (Q Q' : S₂)
   253	    (hP : obsEquiv F₁ P P') (hQ : obsEquiv F₂ Q Q') :
   254	    obsEquiv (F₁.compProd F₂) (P, Q) (P', Q') :=
   255	  ⟨hP, hQ⟩
   256	
   257	/-- Proposition 4.6 (composed experiments), failure witness: the factor records of `p`
   258	and `q` under `e1` coincide, yet the diagonal joint experiment on the composite
   259	separates `p × p` from `p × q`, reporting `11/32` against `9/32`. -/
   260	theorem obs_composed_experiments_failure :
   261	    SameRecord e1Push pDist qDist
   262	      ∧ diagJoint pDist pDist = 11/32
   263	      ∧ diagJoint pDist qDist = 9/32
   264	      ∧ (11/32 : ℚ) ≠ 9/32 := by
   265	  refine ⟨?_, ?_, ?_, ?_⟩
   266	  · exact obs_coarse_witness.1
   267	  · norm_num [diagJoint, pDist, qDist]
   268	  · norm_num [diagJoint, pDist, qDist]
   269	  · norm_num
   270	
   271	/-! ## Structure preservation and its failure (Theorem 3.1, Corollary 3.2) -/
   272	
   273	/-- Theorem 3.1 (Etingof–Gelaki) as hypothesis data: non-isomorphic finite groups whose
   274	complex representation categories are equivalent as plain tensor categories. The
   275	construction itself is literature; this record packages exactly the data the corollary
   276	needs. -/
   277	structure PlainTensorCounterexample (Grp : Type)
   278	    (plainTensorEquiv : Grp → Grp → Prop) (groupIso : Grp → Grp → Prop) where
   279	  /-- The first group. -/
   280	  G : Grp
   281	  /-- The second group. -/
   282	  H : Grp
   283	  /-- The groups are not isomorphic. -/
   284	  groups_noniso : ¬ groupIso G H
   285	  /-- Their representation categories are equivalent as plain tensor categories. -/
   286	  plain_tensor_equiv : plainTensorEquiv G H
   287	
   288	/-- Theorem 3.1 (`eg_plain_tensor_insufficient`), conditional form: an equivalence of
   289	representation categories that forgets the symmetric structure cannot recover the
   290	underlying group — plain tensor equivalence does not detect group isomorphism. -/
   291	theorem eg_plain_tensor_insufficient {Grp : Type}
   292	    {plainTensorEquiv groupIso : Grp → Grp → Prop}
   293	    (w : PlainTensorCounterexample Grp plainTensorEquiv groupIso) :
   294	    ¬ ∀ x y, plainTensorEquiv x y ↔ groupIso x y := by
   295	  intro h
   296	  exact w.groups_noniso ((h w.G w.H).1 w.plain_tensor_equiv)
   297	
   298	/-- Corollary 3.2 (`preserved_layer_discipline`), conditional form: a candidate relation
   299	whose identifications ride on plain tensor equivalence — an equivalence whose declared
   300	layers omit the symmetric monoidal layer — identifies a pair of systems whose observable
   301	group data differ, and so cannot justify the identification. -/
   302	theorem preserved_layer_discipline {Grp : Type}
   303	    {plainTensorEquiv groupIso : Grp → Grp → Prop}
   304	    (w : PlainTensorCounterexample Grp plainTensorEquiv groupIso)
   305	    (candidate : Grp → Grp → Prop)
   306	    (wit : EquivalenceWitness)
   307	    (h_omit : ¬ DeclaresSymmetric wit)
   308	    (hidentify : ∀ x y, plainTensorEquiv x y → candidate x y) :
   309	    candidate w.G w.H ∧ ¬ groupIso w.G w.H ∧ ¬ DeclaresSymmetric wit :=
   310	  ⟨hidentify _ _ w.plain_tensor_equiv, w.groups_noniso, h_omit⟩
   311	
   312	/-! ## Information-geometric distinguishability (§5) -/
   313	
   314	/-- Section 5.1: the Fisher form on the simplex, `g_p(a,a) = ∑_i a_i² / p_i`. -/
   315	def fisherForm {n : ℕ} (p a : Fin n → ℚ) : ℚ :=
   316	  ∑ i : Fin n, (a i * a i) / p i
   317	
   318	/-- Theorem 5.1 (Chentsov), statement skeleton (unproved; literature): every monotone
   319	Riemannian metric on the simplex is a positive multiple of the Fisher form. The
   320	monotonicity predicate is external to this skeleton and is left as a parameter. -/
   321	def chentsov_fisher_uniqueness {n : ℕ}
   322	    (monotone : ((Fin n → ℚ) → (Fin n → ℚ) → ℚ) → Prop) : Prop :=
   323	  ∀ g : (Fin n → ℚ) → (Fin n → ℚ) → ℚ,
   324	    monotone g → ∃ c : ℚ, 0 < c ∧
   325	      ∀ p a, (∀ i, 0 < p i) → (∑ i, p i = 1) → (∑ i, a i = 0) →
   326	        g p a = c * fisherForm p a
   327	
   328	/-- Section 5.2: the summand `A_ij² / (λ_j f(λ_i/λ_j))` of the Morozova–Chentsov
   329	quadratic form. -/
   330	def mcTerm {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ) (A : Fin n → Fin n → ℚ)
   331	    (i j : Fin n) : ℚ :=
   332	  (A i j * A i j) / (lam j * f (lam i / lam j))
   333	
   334	/-- Section 5.2: the Morozova–Chentsov quadratic form
   335	`g_f^ρ(A,A) = ∑_{i,j} A_ij² / (λ_j f(λ_i/λ_j))`, with `lam` the eigenvalues of `ρ`. -/
   336	def mcQuadratic {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ) (A : Fin n → Fin n → ℚ) : ℚ :=
   337	  ∑ i : Fin n, ∑ j : Fin n, mcTerm f lam A i j
   338	
   339	/-- Normalization of an operator monotone representative: `f(1) = 1`. -/
   340	def NormalizedAtOne (f : ℚ → ℚ) : Prop := f 1 = 1
   341	
   342	/-- Petz self-reciprocity on the *positive* domain (the paper's classification
   343	identifies parameter functions on `x > 0` only): `f(x) = x f(x⁻¹)`. -/
   344	def SelfReciprocal (f : ℚ → ℚ) : Prop := ∀ x : ℚ, 0 < x → f x = x * f x⁻¹
   345	
   346	/-- The Petz transpose `f^#(x) = x f(x⁻¹)`. -/
   347	def petzTranspose (f : ℚ → ℚ) (x : ℚ) : ℚ := x * f x⁻¹
   348	
   349	/-- Theorem 5.2 (`petz_sudar_parametricity`), statement skeleton (unproved; literature):
   350	quantum monotone metrics correspond to operator monotone `f` with `f(1) = 1` and
   351	`f(x) = x f(x⁻¹)` on the positive domain, and distinct such `f` give distinct metrics
   352	on self-adjoint directions at positive eigenvalues. `OperatorMonotone` is a parameter
   353	(predicate on parameter functions) because operator monotonicity is external to this
   354	module. The skeleton requires `n ≥ 2`, positive eigenvalues, and symmetric tangent
   355	directions, and compares parameter functions only through their positive-domain data
   356	(Codex review rounds 1–2). This is an unproved specification, NOT the paper's theorem. -/
   357	def petz_sudar_parametricity {n : ℕ}
   358	    (OperatorMonotone : (ℚ → ℚ) → Prop)
   359	    (monotone : ((Fin n → ℚ) → (Fin n → Fin n → ℚ) → ℚ) → Prop) : Prop :=
   360	  (2 ≤ n) ∧
   361	  (∀ f : ℚ → ℚ, NormalizedAtOne f → SelfReciprocal f → OperatorMonotone f →
   362	      monotone (fun lam A => mcQuadratic f lam A)) ∧
   363	    (∀ m, monotone m → ∃ f : ℚ → ℚ, NormalizedAtOne f ∧ SelfReciprocal f ∧ OperatorMonotone f ∧
   364	      ∀ lam : Fin n → ℚ, ∀ A : Fin n → Fin n → ℚ,
   365	        (∀ i, 0 < lam i) → (∀ i j, A i j = A j i) → (∑ i, A i i = 0) →
   366	        m lam A = mcQuadratic f lam A) ∧
   367	    (∀ f g : ℚ → ℚ, SelfReciprocal f → SelfReciprocal g →
   368	      OperatorMonotone f → OperatorMonotone g → ¬ Set.EqOn f g (Set.Ioi 0) →
   369	      ∃ lam : Fin n → ℚ, ∃ A : Fin n → Fin n → ℚ,
   370	        (∀ i, 0 < lam i) ∧ (∀ i j, A i j = A j i) ∧ (∑ i, A i i = 0) ∧
   371	        mcQuadratic f lam A ≠ mcQuadratic g lam A)
   372	
   373	/-- Theorem 5.2, proof ingredient: the Petz transpose `f^#` yields the same quadratic
   374	form as `f` on symmetric (self-adjoint) directions, which is why self-reciprocity
   375	`f = f^#` is the correct normalization. -/
   376	theorem petz_transpose_same_form {n : ℕ} (f : ℚ → ℚ) (lam : Fin n → ℚ)
   377	    (hpos : ∀ i, 0 < lam i) (A : Fin n → Fin n → ℚ) (hsymm : ∀ i j, A i j = A j i) :
   378	    mcQuadratic f lam A = mcQuadratic (petzTranspose f) lam A := by
   379	  have key : ∀ i j, mcTerm (petzTranspose f) lam A i j = mcTerm f lam A j i := by
   380	    intro i j
   381	    have hj : lam j ≠ 0 := (hpos j).ne'
   382	    simp only [mcTerm, petzTranspose]
   383	    rw [inv_div, ← mul_assoc, mul_div_cancel₀ _ hj, hsymm i j]
   384	  unfold mcQuadratic
   385	  simp only [key]
   386	  rw [Finset.sum_comm]
   387	
   388	/-- Proposition 5.3 (`monotone_commutative_restriction`): for every `f` with `f(1) = 1`
   389	(operator monotonicity is not needed for the computation), the quadratic form restricted
   390	to directions diagonal in an eigenbasis of `ρ` is the classical Fisher form
   391	`∑ A_ii² / λ_i`. -/
   392	theorem monotone_commutative_restriction {n : ℕ} (f : ℚ → ℚ) (hf1 : f 1 = 1)
   393	    (lam : Fin n → ℚ) (hpos : ∀ i, 0 < lam i)
   394	    (A : Fin n → Fin n → ℚ) (hdiag : ∀ i j, i ≠ j → A i j = 0) :
   395	    mcQuadratic f lam A = ∑ i : Fin n, (A i i * A i i) / lam i := by
   396	  unfold mcQuadratic
   397	  apply Finset.sum_congr rfl
   398	  intro i _
   399	  refine (Finset.sum_eq_single i (fun j _ hj => ?_) (fun hi => absurd (Finset.mem_univ i) hi)).trans ?_
   400	  · have : A i j = 0 := hdiag i j (Ne.symm hj)
   401	    simp [mcTerm, this]
   402	  · have hi : lam i / lam i = 1 := div_self (hpos i).ne'
   403	    simp [mcTerm, hi, hf1]
   404	
   405	/-- Proposition 5.3 restated: the commutative restriction of any normalized monotone
   406	metric is the Fisher form on the commutative subalgebra generated by `ρ`. -/
   407	theorem commutative_restriction_is_fisher {n : ℕ} (f : ℚ → ℚ) (hf1 : f 1 = 1)
   408	    (lam : Fin n → ℚ) (hpos : ∀ i, 0 < lam i)
   409	    (A : Fin n → Fin n → ℚ) (hdiag : ∀ i j, i ≠ j → A i j = 0) :
   410	    mcQuadratic f lam A = fisherForm lam (fun i => A i i) :=
   411	  (monotone_commutative_restriction f hf1 lam hpos A hdiag).trans (by rfl)
   412	
   413	/-! ## Ruler dependence of the metric scale (Example 5.4, Corollary 5.5) -/
   414	
   415	/-- The self-reciprocal representative `f(x) = 2x/(1+x)` of Example 5.4. -/
   416	def fRat (x : ℚ) : ℚ := 2 * x / (1 + x)
   417	
   418	/-- The self-reciprocal representative `h(x) = (1+x)/2` of Example 5.4. -/
   419	def hRat (x : ℚ) : ℚ := (1 + x) / 2
   420	
   421	/-- The state `ρ = diag(3/4, 1/4)` of Example 5.4. -/
   422	def rhoDiag : Fin 2 → ℚ := fun i => if i = 0 then 3/4 else 1/4
   423	
   424	/-- The direction `A = σ_x` of Example 5.4. -/
   425	def sigmaX : Fin 2 → Fin 2 → ℚ := fun i j => if i = j then 0 else 1
   426	
   427	/-- Example 5.4 (`monotone_not_canonical`): at `ρ = diag(3/4, 1/4)` and `A = σ_x` the
   428	quadratic forms of `f(x) = 2x/(1+x)` and `h(x) = (1+x)/2` are `16/3` and `4`; the two
   429	admissible monotone metrics disagree by the factor `4/3`. -/
   430	theorem monotone_not_canonical :
   431	    mcQuadratic fRat rhoDiag sigmaX = 16/3
   432	      ∧ mcQuadratic hRat rhoDiag sigmaX = 4
   433	      ∧ (16/3 : ℚ) ≠ 4 := by
   434	  refine ⟨?_, ?_, ?_⟩
   435	  · simp only [mcQuadratic, Fin.sum_univ_two]
   436	    norm_num [mcTerm, fRat, hRat, rhoDiag, sigmaX]
   437	  · simp only [mcQuadratic, Fin.sum_univ_two]
   438	    norm_num [mcTerm, fRat, hRat, rhoDiag, sigmaX]
   439	  · norm_num
   440	
   441	/-- Corollary 5.5: numerical monotone-metric distance is not a function of the states
   442	alone — the two admissible rulers disagree at the same state and direction. -/
   443	theorem monotone_ruler_dependence :
   444	    mcQuadratic fRat rhoDiag sigmaX ≠ mcQuadratic hRat rhoDiag sigmaX := by
   445	  rw [monotone_not_canonical.1, monotone_not_canonical.2.1]
   446	  norm_num
   447	
   448	end Cmrps.Vol10
     1	/-
     2	Module for vol-11-completeness-obstructions (Completeness and Obstructions).
     3	Namespace `Cmrps.Vol11`.
     4	
     5	Formalizes the mechanization targets of
     6	`verification/vol-11-completeness-obstructions-lean-targets.md`, mirroring the
     7	paper's names:
     8	
     9	* `ClassificationProgram`            — paper, Definition 4.1
    10	* `FiniteVarietyParametrization`     — paper, Definition 4.2
    11	* `CountableInvariantImpossibility`  — paper, Lemma 4.3 (countable-range clause)
    12	* `Regime`                           — paper, Definition 4.5
    13	* `IsomorphismInjective`             — paper, Definition 5.1
    14	* `ObstructionTransport.*`           — paper, Theorem 5.2 (set-level clauses)
    15	* `UndecidabilityTransport`          — paper, Proposition 5.5
    16	* `FiniteSporadicFails`              — paper, Proposition 5.6 (abstract core)
    17	* `TwoRegimeFails`                   — paper, Proposition 5.7 (abstract core)
    18	* `IsocategoricalEquivalenceFails`   — paper, Proposition 5.8 (conditional form)
    19	* `RegimeAssignment`                 — paper, Table 4 (29 domains, 7 regimes)
    20	
    21	Clauses requiring descriptive set theory (Borel reductions), matrix-pair wild
    22	embeddings, or the external literature inputs (McDuff, Adyan-Rabin,
    23	Etingof-Gelaki, Buchweitz-Leuschke, Sasyk-Tørnquist, Tancer) are recorded in
    24	`verification/vol-11-completeness-obstructions-conjectures.md`. Nothing in this
    25	file uses `sorry` or an axiom.
    26	-/
    27	import Mathlib.Basic.Countable.Defs
    28	import Mathlib.Data.Quot
    29	
    30	namespace Cmrps.Vol11
    31	
    32	/-! ## Classification programs (paper, Definition 4.1) -/
    33	
    34	/-- Paper, Definition 4.1: the three structured shapes a parameter space may
    35	carry — a finite combinatorial set, a finite-dimensional `k`-variety with an
    36	algebraic family, or a standard Borel space with a Borel parametrization. -/
    37	inductive ParameterKind where
    38	  | finiteCombinatorial
    39	  | finiteDimensionalVariety
    40	  | standardBorel
    41	  deriving DecidableEq
    42	
    43	/-- Paper, Definition 4.1: a recognizer `R` decides `x ≃ y` from finite
    44	presentations. Presentations are abstracted to the objects themselves; `correct`
    45	is the correctness clause of the decision procedure. **Scope caveat (Codex
    46	review, round 1):** `decides` is an arbitrary Boolean function, not a computable
    47	procedure, so classically such a recognizer exists for every decidable-in-`Prop`
    48	relation; the paper's algorithmic content (computable presentations and a
    49	computable decider) is NOT formalized here. -/
    50	structure Recognizer {α : Type u} (S : Setoid α) where
    51	  /-- The decision procedure. -/
    52	  decides : α → α → Bool
    53	  /-- Correctness on presentations. -/
    54	  correct : ∀ x y, decides x y = true ↔ S.r x y
    55	
    56	/-- Paper, Definition 4.1: the structured parameter space `Π` — a structured
    57	carrier with a structure-compatible surjection onto the `≃`-classes. The
    58	algebraic-family / Borel-parametrization content of the structure is carried by
    59	`kind`; only the surjection component is formalized here (see
    60	`verification/vol-11-completeness-obstructions-dependency-notes.md`). -/
    61	structure ParameterSpace {α : Type u} {κ : Type v} (S : Setoid α) where
    62	  /-- Which structured shape the carrier claims. -/
    63	  kind : ParameterKind
    64	  /-- Structure-compatible map from the carrier onto the `S`-classes. -/
    65	  toClasses : κ → Quotient S
    66	  /-- The map is onto the classes. -/
    67	  surjective : Function.Surjective toClasses
    68	
    69	/-- Paper, Definition 4.1: a complete invariant `ι` for the equivalence `S`. -/
    70	structure CompleteInvariant {α : Type u} (S : Setoid α) (ι : Type v) where
    71	  /-- The invariant itself. -/
    72	  inv : α → ι
    73	  /-- Completeness: `ι x = ι y ↔ x ≃ y`. -/
    74	  complete : ∀ x y, inv x = inv y ↔ S.r x y
    75	
    76	/-- Paper, Definition 4.1 (Classification program): a triple `(ι, Π, R)` of
    77	complete invariant, structured parameter space, and recognizer for a domain
    78	`(α, S)`. -/
    79	structure ClassificationProgram {α : Type u} (S : Setoid α) (ι : Type v)
    80	    (κ : Type w) where
    81	  /-- The complete invariant component `ι`. -/
    82	  invariant : α → ι
    83	  complete : ∀ x y, invariant x = invariant y ↔ S.r x y
    84	  /-- The parameter space component `Π`. -/
    85	  param : ParameterSpace (κ := κ) S
    86	  /-- The recognizer component `R`. -/
    87	  recognizer : Recognizer S
    88	
    89	/-! ## Finite-variety parametrization (paper, Definition 4.2) -/
    90	
    91	/-- Paper, Definition 4.2 (Finite-variety parametrization): the isomorphism
    92	classes of a category over a field `k` are parametrized by a finite-dimensional
    93	variety when `V(k)` carries an algebraic family of objects whose fibers exhaust
    94	the isomorphism classes. Here `κ` is the point set `V(k)` and `fiber v` is the
    95	object `A_v`. The variety, its field, and the algebraic-family condition are
    96	not formalized (they need algebraic geometry); what is formalized is the
    97	exhaustiveness clause. The definition's warning is recorded verbatim: a bare
    98	set-theoretic surjection `V(k) → Ob/≅` is *not* a parametrization. -/
    99	structure FiniteVarietyParametrization {α : Type u} {κ : Type v}
   100	    (S : Setoid α) where
   101	  /-- The family `{A_v}_{v ∈ V(k)}`. -/
   102	  fiber : κ → α
   103	  /-- Every object is isomorphic to some fiber. -/
   104	  exhaustive : ∀ x : α, ∃ v : κ, S.r x (fiber v)
   105	
   106	/-! ## Regimes (paper, Definition 4.5) -/
   107	
   108	/-- Paper, Definition 4.5 (Regimes): the seven regimes of the taxonomy. -/
   109	inductive Regime where
   110	  | parameterized
   111	  | unparameterized
   112	  | obstructionComplete
   113	  | open_
   114	  | wild
   115	  | undecidable
   116	  | decidableButUnclassified
   117	  deriving DecidableEq
   118	
   119	/-- Paper, Definition 4.5: a domain occupies exactly one regime; in the formal
   120	version this is the single-valuedness of the assignment function. -/
   121	theorem Regime.occupies_exactly_one {α : Type u} (reg : α → Regime) (x : α) :
   122	    ∃! ρ, reg x = ρ :=
   123	  ⟨reg x, rfl, fun ρ h => h.symm⟩
   124	
   125	/-! ## Countable invariants (paper, Lemma 4.3) -/
   126	
   127	/-- The complete invariant descends to the isomorphism classes: `⟦x⟧ ↦ ι x`. -/
   128	def CompleteInvariant.onClasses {α : Type u} {S : Setoid α} {ι : Type v}
   129	    (c : CompleteInvariant S ι) : Quotient S → ι :=
   130	  fun q => Quotient.liftOn' q c.inv fun x y h => (c.complete x y).2 h
   131	
   132	/-- Paper, Lemma 4.3 (Countable invariants), countable-range clause, target
   133	`CountableInvariantImpossibility`: if the isomorphism classes are uncountable,
   134	no complete invariant takes values in a countable set. The paper's proof: a
   135	complete invariant with countable range descends to an injection of the class
   136	set into the value set, hence into `ℕ`. The companion clause about invariants
   137	valued in spaces of countable structures needs Borel reducibility and is not
   138	formalized here (see the conjectures file). -/
   139	theorem CountableInvariantImpossibility
   140	    {α : Type u} {S : Setoid α} {ι : Type v}
   141	    (c : CompleteInvariant S ι)
   142	    (huncount : ¬ Countable (Quotient S)) : ¬ Countable ι := by
   143	  intro hcount
   144	  have hinj : Function.Injective c.onClasses :=
   145	    fun x y => Quotient.inductionOn₂' x y fun a b h =>
   146	      Quotient.sound' ((c.complete a b).1 h)
   147	  exact huncount (Function.Injective.countable hinj)
   148	
   149	/-! ## Obstruction transport (paper, Definition 5.1, Theorem 5.2) -/
   150	
   151	/-- Paper, Definition 5.1 (Isomorphism-injective functor), relational form: a
   152	map `F` between domains that preserves and reflects the equivalence. The
   153	categorical content of the definition (every fully faithful functor is
   154	isomorphism-injective) is not formalized here; see the conjectures file. -/
   155	structure IsomorphismInjective {α : Type u} {β : Type w}
   156	    (S : Setoid α) (T : Setoid β) (F : α → β) : Prop where
   157	  map_rel : ∀ x y, S.r x y → T.r (F x) (F y)
   158	  reflect_rel : ∀ x y, T.r (F x) (F y) → S.r x y
   159	
   160	/-- Paper, Theorem 5.2: an isomorphism-injective map induces a map `F_*` on
   161	isomorphism classes. -/
   162	def IsomorphismInjective.classes {α : Type u} {β : Type w} {S : Setoid α}
   163	    {T : Setoid β} {F : α → β} (h : IsomorphismInjective S T F) :
   164	    Quotient S → Quotient T :=
   165	  Quotient.map' F fun x y hr => h.map_rel x y hr
   166	
   167	/-- Paper, Theorem 5.2: `F_*` is injective on classes, since `F` is
   168	isomorphism-injective. -/
   169	theorem IsomorphismInjective.classes_injective
   170	    {α : Type u} {β : Type w} {S : Setoid α} {T : Setoid β} {F : α → β}
   171	    (h : IsomorphismInjective S T F) : Function.Injective h.classes :=
   172	  fun x y => Quotient.inductionOn₂' x y fun a b he =>
   173	    Quotient.sound' (h.reflect_rel a b (Quotient.exact' (a := F a) (b := F b) he))
   174	
   175	/-- Paper, Theorem 5.2: a complete invariant for the larger domain restricts
   176	along `F` to a complete invariant for the smaller one, with the same value set. -/
   177	def ObstructionTransport.pullback
   178	    {α : Type u} {β : Type w} {S : Setoid α} {T : Setoid β} {F : α → β}
   179	    (h : IsomorphismInjective S T F) {ι : Type v} (c : CompleteInvariant T ι) :
   180	    CompleteInvariant S ι where
   181	  inv := fun x => c.inv (F x)
   182	  complete := fun x y =>
   183	    ⟨fun he => h.reflect_rel x y ((c.complete (F x) (F y)).1 he),
   184	     fun hr => (c.complete (F x) (F y)).2 (h.map_rel x y hr)⟩
   185	
   186	/-- Paper, Theorem 5.2(1): uncountability of the isomorphism classes transports
   187	along an isomorphism-injective map: if the source has uncountably many classes,
   188	so does the target. -/
   189	theorem ObstructionTransport.uncountableClasses
   190	    {α : Type u} {β : Type w} {S : Setoid α} {T : Setoid β} {F : α → β}
   191	    (h : IsomorphismInjective S T F)
   192	    (huncount : ¬ Countable (Quotient S)) : ¬ Countable (Quotient T) :=
   193	  fun hcount => huncount (Function.Injective.countable h.classes_injective)
   194	
   195	/-- Paper, Theorem 5.2(1): absence of complete invariants with countable range
   196	transports along an isomorphism-injective map: if none exists for the source,
   197	none exists for the target. -/
   198	theorem ObstructionTransport.noCountableInvariant
   199	    {α : Type u} {β : Type w} {S : Setoid α} {T : Setoid β} {F : α → β}
   200	    (h : IsomorphismInjective S T F)
   201	    (hnone : ∀ (ι : Type v) (c : CompleteInvariant S ι), ¬ Countable ι) :
   202	    ∀ (ι : Type v) (c : CompleteInvariant T ι), ¬ Countable ι :=
   203	  fun ι c hc => hnone ι (ObstructionTransport.pullback h c) hc
   204	
   205	/-! ## Undecidability transport (paper, Proposition 5.5) -/
   206	
   207	/-- Paper, Proposition 5.5: a recognition problem `Q` is decidable when there is
   208	a procedure `d` with `d x = true ↔ Q x`. **Scope caveat (Codex review, round 1):**
   209	this is an *extensional* skeleton — classically `fun x => decide (Q x)` satisfies
   210	it for every `Q`, so it is not algorithmic decidability; the paper's computable
   211	procedures are NOT formalized here. -/
   212	def DecidableProblem {κ : Type u} (Q : κ → Prop) : Prop :=
   213	  ∃ d : κ → Bool, ∀ x, d x = true ↔ Q x
   214	
   215	/-- Paper, Proposition 5.5 (Undecidability transport): a recognition problem
   216	many-one reducible from an undecidable property of finitely presentable groups
   217	is itself undecidable. `hmarkov` is the Adyan-Rabin theorem taken as hypothesis
   218	(hence the `conditional` status of this claim): every Markov property of
   219	finitely presentable groups is algorithmically undecidable. The paper requires
   220	the reduction map `φ` to be computable so that the composed procedure is
   221	algorithmic; the extensional form above is the content of the reduction
   222	argument. **Scope caveat (Codex review, round 1):** because `DecidableProblem`
   223	is classically trivial, `hmarkov` is contradictory and the formalized
   224	implication is vacuously true; the theorem is a *shape* of the transport
   225	argument only, and the algorithmic statement remains unproved. -/
   226	theorem UndecidabilityTransport
   227	    {G : Type u} {κ : Type w} {P : G → Prop} {Q : κ → Prop} {φ : G → κ}
   228	    (hred : ∀ g, P g ↔ Q (φ g))
   229	    (hmarkov : ¬ DecidableProblem P) : ¬ DecidableProblem Q := by
   230	  intro hq
   231	  change ∃ d : κ → Bool, ∀ x, d x = true ↔ Q x at hq
   232	  cases hq with
   233	  | intro d hd =>
   234	    refine hmarkov ?_
   235	    change ∃ e : G → Bool, ∀ g, e g = true ↔ P g
   236	    exact ⟨fun g => d (φ g), fun g =>
   237	      ⟨fun h => (hred g).2 ((hd (φ g)).1 h),
   238	       fun h => (hd (φ g)).2 ((hred g).1 h)⟩⟩
   239	
   240	/-! ## Counterexample catalogue (paper, Propositions 5.6–5.8) -/
   241	
   242	/-- Paper, Proposition 5.6: a CFSG-style decomposition of a class set into
   243	infinite families plus finitely many exceptional (sporadic) objects. -/
   244	structure SporadicDecomposition (κ : Type u) where
   245	  /-- Objects lying in one of the infinite families. -/
   246	  family : κ → Prop
   247	  /-- The number of sporadic objects. -/
   248	  nSporadic : Nat
   249	  /-- The sporadic objects, listed. -/
   250	  sporadic : Fin nSporadic → κ
   251	  /-- Every class is in a family or is one of the listed sporadic objects. -/
   252	  cover : ∀ x : κ, family x ∨ ∃ i, sporadic i = x
   253	
   254	/-- Paper, Proposition 5.6 (FiniteSporadicFails), abstract core: a sector in
   255	which no infinite family reaches and which admits no finite listing cannot be
   256	decomposed into families plus finitely many sporadics. The paper's concrete
   257	inputs — uncountably many separable II₁ factors (McDuff) and the four-dimensional
   258	model geometries (eighteen plus one countably infinite family) — are external
   259	literature results; see the claim-status and conjectures files. -/
   260	theorem FiniteSporadicFails {κ : Type u} (d : SporadicDecomposition κ)
   261	    (hnoFamily : ∀ x : κ, ¬ d.family x)
   262	    (hnoList : ∀ (n : Nat) (f : Fin n → κ), ¬ Function.Surjective f) : False := by
   263	  have hsurj : Function.Surjective d.sporadic := by
   264	    intro x
   265	    cases d.cover x with
   266	    | inl hx => exact absurd hx (hnoFamily x)
   267	    | inr hx =>
   268	      cases hx with
   269	      | intro i hi => exact ⟨i, hi⟩
   270	  exact hnoList d.nSporadic d.sporadic hsurj
   271	
   272	/-- Paper, Proposition 5.7 (TwoRegimeFails), abstract core: three of the seven
   273	regimes carry pairwise distinct evidence shapes, so no two-label taxonomy can
   274	keep the surveyed domains straight — there is no injection of the seven regimes
   275	into two labels. The paper's concrete witnesses (unknot recognition:
   276	decidable-but-unclassified; finite simple groups: classified-but-unparameterized)
   277	are external literature results. -/
   278	theorem TwoRegimeFails (f : Regime → Bool) : ¬ Function.Injective f := by
   279	  have key : ∀ x y z : Bool, x = y ∨ x = z ∨ y = z := by
   280	    intro x y z
   281	    cases x <;> cases y <;> cases z <;> decide
   282	  intro hinj
   283	  cases key (f Regime.parameterized) (f Regime.wild) (f Regime.undecidable) with
   284	  | inl h => exact absurd (hinj h) (fun h' => by cases h')
   285	  | inr h =>
   286	    cases h with
   287	    | inl h => exact absurd (hinj h) (fun h' => by cases h')
   288	    | inr h => exact absurd (hinj h) (fun h' => by cases h')
   289	
   290	/-- Paper, §2: `r` coarsens `s` when every `r`-pair is an `s`-pair. -/
   291	def Coarsens {α : Type u} (r s : α → α → Prop) : Prop :=
   292	  ∀ x y, r x y → s x y
   293	
   294	/-- Paper, Proposition 5.8 (IsocategoricalEquivalenceFails), conditional form:
   295	if plain tensor equivalence `≃pt` on finite groups coarsens isomorphism and one
   296	pair `G ≇ H` has `G ≃pt H` (the Etingof-Gelaki witness), then `≃pt` is strictly
   297	coarser than isomorphism, so classification at the plain tensor layer merges
   298	distinct systems. The existence of the witness pair is external
   299	(`conditional` status). -/
   300	theorem IsocategoricalEquivalenceFails
   301	    {α : Type u} (iso pt : α → α → Prop)
   302	    (hcoarse : Coarsens iso pt)
   303	    (G H : α) (hne : ¬ iso G H) (heq : pt G H) :
   304	    Coarsens iso pt ∧ ¬ Coarsens pt iso :=
   305	  ⟨hcoarse, fun hall => hne (hall G H heq)⟩
   306	
   307	/-! ## Regime assignment (paper, Table 4) -/
   308	
   309	/-- Paper, Table 4: the 29 surveyed domains of the series literature map. -/
   310	inductive SurveyedDomain where
   311	  | simpleLieAlgebras
   312	  | highestWeightIrreps
   313	  | finiteDimCstarAlgebras
   314	  | principalGBundles
   315	  | classicalMonotoneMetrics
   316	  | localSymplecticGerms
   317	  | amenableFactors
   318	  | threeManifolds
   319	  | groupIsoTameExtensions
   320	  | finiteSimpleGroups
   321	  | quantumMonotoneMetrics
   322	  | quantumChannels
   323	  | fourDimModelGeometries
   324	  | anomalies
   325	  | generalII1Factors
   326	  | plainTensorCategoryRecovery
   327	  | fusionCategories
   328	  | elliottNuclearProgram
   329	  | holographicEntropyCone
   330	  | extendedTQFTs
   331	  | yangMillsMassGap
   332	  | typeIIIFactors
   333	  | wildCMModulesGenericDet
   334	  | cpEquivariantModulesOddPrimes
   335	  | derivedWildAlgebras
   336	  | fpGroupsMarkovProperties
   337	  | fourManifoldHomeomorphism
   338	  | vNAlgebraIsomorphism
   339	  | unknotRecognition
   340	  deriving DecidableEq
   341	
   342	/-- Paper, Table 4 / Section 8 (RegimeAssignment): the assignment of surveyed
   343	domains to regimes. The consistency properties below mirror
   344	`src/vol-11-completeness-obstructions/regime_inventory.py` (`check_partition`);
   345	the mathematical justification of each row is the obstruction register and the
   346	survey, not this data. -/
   347	def RegimeAssignment : SurveyedDomain → Regime
   348	  | .simpleLieAlgebras => .parameterized
   349	  | .highestWeightIrreps => .parameterized
   350	  | .finiteDimCstarAlgebras => .parameterized
   351	  | .principalGBundles => .parameterized
   352	  | .classicalMonotoneMetrics => .parameterized
   353	  | .localSymplecticGerms => .parameterized
   354	  | .amenableFactors => .parameterized
   355	  | .threeManifolds => .parameterized
   356	  | .groupIsoTameExtensions => .parameterized
   357	  | .fourDimModelGeometries => .parameterized
   358	  | .finiteSimpleGroups => .unparameterized
   359	  | .quantumMonotoneMetrics => .unparameterized
   360	  | .quantumChannels => .unparameterized
   361	  | .anomalies => .obstructionComplete
   362	  | .generalII1Factors => .obstructionComplete
   363	  | .plainTensorCategoryRecovery => .obstructionComplete
   364	  | .vNAlgebraIsomorphism => .obstructionComplete
   365	  | .fusionCategories => .open_
   366	  | .elliottNuclearProgram => .open_
   367	  | .holographicEntropyCone => .open_
   368	  | .extendedTQFTs => .open_
   369	  | .yangMillsMassGap => .open_
   370	  | .typeIIIFactors => .open_
   371	  | .wildCMModulesGenericDet => .wild
   372	  | .cpEquivariantModulesOddPrimes => .wild
   373	  | .derivedWildAlgebras => .wild
   374	  | .fpGroupsMarkovProperties => .undecidable
   375	  | .fourManifoldHomeomorphism => .undecidable
   376	  | .unknotRecognition => .decidableButUnclassified
   377	
   378	/-- Paper, Table 4: the assignment is total — every surveyed domain has a
   379	regime. -/
   380	theorem RegimeAssignment.total (d : SurveyedDomain) :
   381	    ∃ ρ, RegimeAssignment d = ρ :=
   382	  ⟨_, rfl⟩
   383	
   384	/-- Paper, Definition 4.5 / Table 4: the assignment is single-valued — every
   385	surveyed domain occupies exactly one regime. -/
   386	theorem RegimeAssignment.unique (d : SurveyedDomain) :
   387	    ∃! ρ, RegimeAssignment d = ρ :=
   388	  ⟨RegimeAssignment d, rfl, fun ρ h => h.symm⟩
   389	
   390	/-- Paper, Table 4 / Section 8: every one of the seven regimes is used by the
   391	assignment (the partition check of `check_partition`). -/
   392	theorem RegimeAssignment.every_regime_used (ρ : Regime) :
   393	    ∃ d, RegimeAssignment d = ρ := by
   394	  cases ρ with
   395	  | parameterized => exact ⟨.simpleLieAlgebras, rfl⟩
   396	  | unparameterized => exact ⟨.finiteSimpleGroups, rfl⟩
   397	  | obstructionComplete => exact ⟨.anomalies, rfl⟩
   398	  | open_ => exact ⟨.fusionCategories, rfl⟩
   399	  | wild => exact ⟨.derivedWildAlgebras, rfl⟩
   400	  | undecidable => exact ⟨.fpGroupsMarkovProperties, rfl⟩
   401	  | decidableButUnclassified => exact ⟨.unknotRecognition, rfl⟩
   402	
   403	end Cmrps.Vol11
     1	import Mathlib.Data.Real.Basic
     2	import Mathlib.Tactic
     3	
     4	/-!
     5	# Principia Physica (Volume 12)
     6	
     7	Formalization of the tractable mechanization targets of
     8	`verification/vol-12-principia-physica-lean-targets.md`, mirroring the names of
     9	`papers/latex/vol-12-principia-physica.tex`.
    10	
    11	Policy of this module: definitions are stated directly; survey theorems whose content is
    12	external literature (Chentsov, Petz–Sudar, McDuff, Adyan–Rabin, Etingof–Gelaki, …) are
    13	formalized as their honest logical skeleton, with the classical inputs recorded as explicit
    14	hypotheses. Nothing in this file uses `sorry` or new axioms.
    15	-/
    16	
    17	namespace Cmrps.Vol12
    18	
    19	/-! ## Target 1 — `PrincipiaLayers` (Definition 2.5) -/
    20	
    21	/-- Definition 2.5: the Principia architecture consists of three layers, with a
    22	realization map `M → P` and a selection map `P → Eobs`. -/
    23	structure PrincipiaLayers where
    24	  /-- The mathematical layer: output of classification of admissible structures. -/
    25	  M : Type
    26	  /-- The realization layer: physical theories. -/
    27	  P : Type
    28	  /-- The empirical layer: observational data. -/
    29	  Eobs : Type
    30	  /-- The realization map `R : M → P`. -/
    31	  realize : M → P
    32	  /-- The selection map `E : P → Eobs`. -/
    33	  select : P → Eobs
    34	
    35	/-- The separation clause of Definition 2.5, as formalized: the equivalence relation
    36	induced by `select` differs from the one induced by `cls` (they do not induce the
    37	same partition of `P`). **Scope caveat (Codex review, round 1):** this is NOT the
    38	failure of a factorization `select = f ∘ cls` — a constant `select` with `cls = id`
    39	satisfies this predicate although `select` factors through `cls`; the name records
    40	the paper's clause, the statement is the induced-relations inequality. -/
    41	def NotFactoring {M P Obs : Type} (cls : P → M) (select : P → Obs) : Prop :=
    42	  ¬ ∀ a b : P, (select a = select b ↔ cls a = cls b)
    43	
    44	/-- Section 3, non-collapse argument: if two theories are mathematically distinct but
    45	empirically equivalent, then `select` and `cls` do not induce the same equivalence
    46	relation on theories (the induced relations differ). -/
    47	theorem SelectionNotComputedByClassification
    48	    {M P Obs : Type} (cls : P → M) (select : P → Obs)
    49	    (T₁ T₂ : P) (hmath : cls T₁ ≠ cls T₂) (hobs : select T₁ = select T₂) :
    50	    NotFactoring cls select := by
    51	  intro h
    52	  exact hmath ((h T₁ T₂).1 hobs)
    53	
    54	/-! ## Target 2 — `EvidenceGradeAssignment` (Definition 2.6, Table 2) -/
    55	
    56	/-- Definition 2.6: formulation, rigorous theorem, physical validation. -/
    57	inductive EvidenceGrade
    58	  | formulation  -- grade 1
    59	  | rigorous     -- grade 2
    60	  | validated    -- grade 3
    61	deriving DecidableEq, Repr
    62	
    63	/-- The record types of the program registry (Table 2). -/
    64	inductive RecordType
    65	  | stipulatedDefinitions
    66	  | classificationTheorem
    67	  | reconstructionTheorem
    68	  | obstructionTheorem
    69	  | claimLedgerEntry
    70	  | physicalValidation
    71	deriving DecidableEq, Repr
    72	
    73	/-- Table 2: the evidence grade of each record type. -/
    74	def evidenceGrade : RecordType → EvidenceGrade
    75	  | .stipulatedDefinitions => .formulation
    76	  | .classificationTheorem => .rigorous
    77	  | .reconstructionTheorem => .rigorous
    78	  | .obstructionTheorem => .rigorous
    79	  | .claimLedgerEntry => .formulation
    80	  | .physicalValidation => .validated
    81	
    82	/-- The record types actually on file: grade 3 exists as a type but holds no record. -/
    83	def registryTypes : List RecordType :=
    84	  [.stipulatedDefinitions, .classificationTheorem, .reconstructionTheorem,
    85	   .obstructionTheorem, .claimLedgerEntry]
    86	
    87	/-- Target 2: every record type on file lies at grade 1 or 2; grade 3 is attained only by
    88	the (empty) physical-validation record type. -/
    89	theorem EvidenceGradeAssignment (r : RecordType) :
    90	    (r = .physicalValidation → evidenceGrade r = .validated) ∧
    91	    (r ≠ .physicalValidation → evidenceGrade r ≠ .validated) := by
    92	  cases r <;> decide
    93	
    94	/-- No record type on file reaches evidence grade 3. -/
    95	theorem registry_no_grade3 :
    96	    (evidenceGrade .stipulatedDefinitions ≠ .validated) ∧
    97	    (evidenceGrade .classificationTheorem ≠ .validated) ∧
    98	    (evidenceGrade .reconstructionTheorem ≠ .validated) ∧
    99	    (evidenceGrade .obstructionTheorem ≠ .validated) ∧
   100	    (evidenceGrade .claimLedgerEntry ≠ .validated) := by
   101	  decide
   102	
   103	/-- Table 2 read off as data. -/
   104	theorem registry_grades :
   105	    registryTypes.map evidenceGrade =
   106	      [.formulation, .rigorous, .rigorous, .rigorous, .formulation] := rfl
   107	
   108	/-! ## Target 3 — `RegimeAssignment` (Definition 2.7, Table 3) -/
   109	
   110	/-- Definition 2.7: the seven classification regimes. -/
   111	inductive Regime
   112	  | r1 | r2 | r3 | r4 | r5 | r6 | r7
   113	deriving DecidableEq, Repr
   114	
   115	/-- A row of the program comparison spine (Table 3). -/
   116	structure SpineRow where
   117	  domain : String
   118	  regime : Regime
   119	deriving Repr
   120	
   121	/-- The twenty-nine rows of Table 3 (twenty-eight spine domains plus the unknot-recognition
   122	boundary case), in table order. -/
   123	def spineTable : List SpineRow :=
   124	  [ ⟨"Finite simple groups", .r2⟩
   125	  , ⟨"Simple Lie groups and Lie algebras", .r1⟩
   126	  , ⟨"Irreducible representations of semisimple Lie algebras", .r1⟩
   127	  , ⟨"Symplectic manifolds in the local category", .r1⟩
   128	  , ⟨"Poisson manifolds in the local category", .r1⟩
   129	  , ⟨"Finite-dimensional complex C*-algebras", .r1⟩
   130	  , ⟨"Amenable factors", .r1⟩
   131	  , ⟨"General type II and type III factors", .r5⟩
   132	  , ⟨"Quantum channels", .r4⟩
   133	  , ⟨"Principal G-bundles", .r1⟩
   134	  , ⟨"Anomalies", .r3⟩
   135	  , ⟨"DHR superselection sectors", .r1⟩
   136	  , ⟨"Symmetric tensor categories of subexponential growth", .r1⟩
   137	  , ⟨"Fusion categories", .r4⟩
   138	  , ⟨"Extended topological quantum field theories", .r4⟩
   139	  , ⟨"Lorentzian holonomy groups", .r1⟩
   140	  , ⟨"Spacetime causality conditions", .r1⟩
   141	  , ⟨"Holographic entropy cone with at most four regions", .r1⟩
   142	  , ⟨"Holographic entropy cone with five or more regions", .r4⟩
   143	  , ⟨"Monotone metrics in the classical case", .r1⟩
   144	  , ⟨"Monotone metrics in the quantum case", .r1⟩
   145	  , ⟨"Emergent spacetime and the Ryu-Takayanagi formula", .r4⟩
   146	  , ⟨"Four-dimensional Yang-Mills and QCD existence", .r4⟩
   147	  , ⟨"Four-dimensional Yang-Mills mass gap", .r4⟩
   148	  , ⟨"Closed three-manifolds", .r1⟩
   149	  , ⟨"Four-manifolds", .r5⟩
   150	  , ⟨"Finitely presented groups under Markov properties", .r6⟩
   151	  , ⟨"Wild representation categories", .r5⟩
   152	  , ⟨"Unknot recognition", .r7⟩ ]
   153	
   154	/-- The regime of each row, in table order. -/
   155	def spineRegimes : List Regime := spineTable.map (·.regime)
   156	
   157	/-- Number of rows assigned to a regime. -/
   158	def countRegime (r : Regime) : List Regime → ℕ
   159	  | [] => 0
   160	  | x :: xs => (if x = r then 1 else 0) + countRegime r xs
   161	
   162	theorem spine_row_count : spineTable.length = 29 := by decide
   163	
   164	/-- Target 3: the twenty-nine rows map into exactly one regime each, with counts
   165	`15, 1, 1, 7, 3, 1, 1` over regimes 1 to 7. -/
   166	theorem RegimeAssignment :
   167	    countRegime .r1 spineRegimes = 15 ∧
   168	    countRegime .r2 spineRegimes = 1 ∧
   169	    countRegime .r3 spineRegimes = 1 ∧
   170	    countRegime .r4 spineRegimes = 7 ∧
   171	    countRegime .r5 spineRegimes = 3 ∧
   172	    countRegime .r6 spineRegimes = 1 ∧
   173	    countRegime .r7 spineRegimes = 1 := by
   174	  decide
   175	
   176	/-! ## Target 4 — `ObstructionAssembly` (Theorem 5.1) -/
   177	
   178	/-- The six classification objectives of Theorem 5.1. -/
   179	inductive ObstructionObjective
   180	  | nonAmenableFactorTotalClassification
   181	  | wildModuleFiniteVarietyParameterization
   182	  | markovPropertyUniformRecognition
   183	  | fourManifoldEffectiveClassification
   184	  | groupFromPlainTensorCategory
   185	  | wildRegimeIsomorphismAlgorithm
   186	deriving DecidableEq, Repr
   187	
   188	/-- A registered obstruction theorem: a named external result forbidding an objective. -/
   189	structure RegisteredObstruction where
   190	  theoremName : String
   191	  objective : ObstructionObjective
   192	deriving Repr
   193	
   194	/-- The register of Theorem 5.1: each objective is refuted by a named proved result. -/
   195	def refutingTheorem : ObstructionObjective → RegisteredObstruction
   196	  | .nonAmenableFactorTotalClassification =>
   197	      ⟨"McDuff 1969: uncountably many non-isomorphic separable II_1 factors",
   198	        .nonAmenableFactorTotalClassification⟩
   199	  | .wildModuleFiniteVarietyParameterization =>
   200	      ⟨"Bekkert-Drozd derived wildness; Buchweitz-Leuschke; Grevstad-May",
   201	        .wildModuleFiniteVarietyParameterization⟩
   202	  | .markovPropertyUniformRecognition =>
   203	      ⟨"Adyan-Rabin with the Collins extension",
   204	        .markovPropertyUniformRecognition⟩
   205	  | .fourManifoldEffectiveClassification =>
   206	      ⟨"Tancer 2023: unrecognizability of connected-sum homeomorphism",
   207	        .fourManifoldEffectiveClassification⟩
   208	  | .groupFromPlainTensorCategory =>
   209	      ⟨"Etingof-Gelaki isocategorical groups",
   210	        .groupFromPlainTensorCategory⟩
   211	  | .wildRegimeIsomorphismAlgorithm =>
   212	      ⟨"Grochow-Qiao tame/wild tractability boundary",
   213	        .wildRegimeIsomorphismAlgorithm⟩
   214	
   215	/-- Target 4: every classification objective of Theorem 5.1 is refuted by a registered
   216	theorem (data-level formalization of the survey). -/
   217	theorem ObstructionAssembly (o : ObstructionObjective) :
   218	    (refutingTheorem o).objective = o := by
   219	  cases o <;> rfl
   220	
   221	/-! ## Target 5 — `StructurePreservation` (Theorem 6.1) -/
   222	
   223	/-- Theorem 6.1, logical form: if two objects carry the same data in a layer that forgets
   224	structure (hdata) but are inequivalent at the level one wants to recover (hcls), no recovery
   225	function from the coarse data can classify them. Applied with isocategorical groups and
   226	plain tensor data, this forbids recovery of the group from a symmetric-monoidal-free
   227	equivalence of representation categories. -/
   228	theorem StructurePreservation
   229	    {G D C : Type} (data : G → D) (cls : G → C) (g₁ g₂ : G)
   230	    (hdata : data g₁ = data g₂) (hcls : cls g₁ ≠ cls g₂) :
   231	    ¬ ∃ recover : D → C, ∀ g, recover (data g) = cls g := by
   232	  rintro ⟨recover, h⟩
   233	  exact hcls ((h g₁).symm.trans ((congrArg recover hdata).trans (h g₂)))
   234	
   235	/-! ## Target 6 — `MonotoneMetricGap` (Theorem 7.1) -/
   236	
   237	/-- The identity witness of Theorem 7.1. -/
   238	def f_id : ℝ → ℝ := fun x => x
   239	
   240	/-- The affine witness of Theorem 7.1: `f(x) = (x+1)/2`. -/
   241	noncomputable def f_aff : ℝ → ℝ := fun x => (x + 1) / 2
   242	
   243	/-- The two witness functions of Theorem 7.1 are distinct. -/
   244	theorem MonotoneWitnessDistinct : f_id ≠ f_aff := by
   245	  have h0 : f_id 0 ≠ f_aff 0 := by
   246	    show (0 : ℝ) ≠ (0 + 1) / 2
   247	    norm_num
   248	  exact fun h => h0 (congrFun h 0)
   249	
   250	/-- Target 6, gap clause: a parameterized family with more than one element admits no
   251	unique choice, so a uniqueness-up-to-scalar statement cannot extend to it. -/
   252	theorem MonotoneMetricGap {Param : Type} (f g : Param) (hne : f ≠ g) :
   253	    ¬ Subsingleton Param := by
   254	  intro h
   255	  letI := h
   256	  exact hne (Subsingleton.elim f g)
   257	
   258	/-- Target 6, quantum clause: given the classical Petz–Sudar input that the identity and
   259	the affine function are operator monotone, the parameter class of quantum monotone metrics
   260	is nontrivial, and classical uniqueness does not extend to the quantum case.
   261	**Scope caveat (Codex review, round 1):** this theorem establishes only that an abstract
   262	`IsOperatorMonotone` predicate has two distinct members — it proves NO correspondence to
   263	metrics and no non-proportionality of metric values (the metric-level conclusion is
   264	`quantum_monotone_metrics_not_unique` in `Vol09GravityInformationGeometry` and the paper
   265	proof). The witness `f_id` also fails self-reciprocity (`f t ≠ t f (1/t)` at `t = 2`),
   266	matching a gap in the paper's proof; the result is the distinctness of two functions and
   267	no more. -/
   268	theorem MonotoneMetricGapQuantum
   269	    (IsOperatorMonotone : (ℝ → ℝ) → Prop)
   270	    (hid : IsOperatorMonotone f_id) (haff : IsOperatorMonotone f_aff) :
   271	    ¬ Subsingleton { f : ℝ → ℝ // IsOperatorMonotone f } :=
   272	  MonotoneMetricGap (f := ⟨f_id, hid⟩) (g := ⟨f_aff, haff⟩) (fun h =>
   273	    MonotoneWitnessDistinct (congrArg Subtype.val h))
   274	
   275	/-! ## Target 7 — `ExistenceMassGapSeparation` (Section 6) -/
   276	
   277	/-- The two conjuncts of the Clay problem. -/
   278	structure ClayProblem where
   279	  /-- Existence of the four-dimensional quantum field theory. -/
   280	  Existence : Prop
   281	  /-- Strict positivity of the mass gap. -/
   282	  MassGap : Prop
   283	
   284	/-- The Clay problem is solved exactly when both conjuncts hold. -/
   285	def ClaySolved (C : ClayProblem) : Prop := C.Existence ∧ C.MassGap
   286	
   287	/-- Target 7: an existence claim alone does not discharge the mass-gap conjunct; the two
   288	properties are separate conjuncts of the Clay problem. -/
   289	theorem ExistenceMassGapSeparation (C : ClayProblem)
   290	    (hE : C.Existence) (hG : ¬ C.MassGap) : ¬ ClaySolved C := by
   291	  rintro ⟨_, hg⟩
   292	  exact hG hg
   293	
   294	/-- Claim ladder positions (Section 6). -/
   295	inductive LadderPosition
   296	  | announced
   297	  | publishedUnverified
   298	  | withdrawn
   299	  | rigorousWithinRegimes
   300	  | preprintOutline
   301	  | verified
   302	  | accepted
   303	deriving DecidableEq, Repr
   304	
   305	/-- Table 4: the ladder position of each claim-ledger entry. -/
   306	def claimPositions : List LadderPosition :=
   307	  [.announced, .publishedUnverified, .withdrawn, .rigorousWithinRegimes, .preprintOutline]
   308	
   309	theorem claim_positions_exact :
   310	    claimPositions = [.announced, .publishedUnverified, .withdrawn,
   311	      .rigorousWithinRegimes, .preprintOutline] := rfl
   312	
   313	theorem claim_ledger_size : claimPositions.length = 5 := by decide
   314	
   315	/-- No claim-ledger entry has reached the verified or accepted rung, so none resolves the
   316	Clay problem. -/
   317	theorem claim_ledger_not_verified :
   318	    LadderPosition.announced ≠ .verified ∧ LadderPosition.announced ≠ .accepted ∧
   319	    LadderPosition.publishedUnverified ≠ .verified ∧
   320	    LadderPosition.publishedUnverified ≠ .accepted ∧
   321	    LadderPosition.withdrawn ≠ .verified ∧ LadderPosition.withdrawn ≠ .accepted ∧
   322	    LadderPosition.rigorousWithinRegimes ≠ .verified ∧
   323	    LadderPosition.rigorousWithinRegimes ≠ .accepted ∧
   324	    LadderPosition.preprintOutline ≠ .verified ∧
   325	    LadderPosition.preprintOutline ≠ .accepted := by
   326	  decide
   327	
   328	/-! ## Block-size data (used by Targets 8 and 10) -/
   329	
   330	/-- Count of occurrences of `n` in a list of block sizes. -/
   331	def countNat (n : ℕ) : List ℕ → ℕ
   332	  | [] => 0
   333	  | x :: xs => (if x = n then 1 else 0) + countNat n xs
   334	
   335	/-- Two block-size lists determine the same block multiset. -/
   336	def SameBlocks (l₁ l₂ : List ℕ) : Prop := ∀ n, countNat n l₁ = countNat n l₂
   337	
   338	theorem sameBlocks_refl (l : List ℕ) : SameBlocks l l := fun _ => rfl
   339	
   340	theorem sameBlocks_symm {l₁ l₂ : List ℕ} (h : SameBlocks l₁ l₂) : SameBlocks l₂ l₁ :=
   341	  fun n => (h n).symm
   342	
   343	theorem sameBlocks_trans {l₁ l₂ l₃ : List ℕ} (h₁ : SameBlocks l₁ l₂)
   344	    (h₂ : SameBlocks l₂ l₃) : SameBlocks l₁ l₃ :=
   345	  fun n => (h₁ n).trans (h₂ n)
   346	
   347	/-! ## Target 8 — `ConditionalStructuralGeneration` (Definition 8.2, Proposition 8.3) -/
   348	
   349	/-- Definition 2.9: the structural invariant record. -/
   350	structure InvariantRecord (S O D G R : Type) where
   351	  states : S
   352	  observables : O
   353	  dynamics : D
   354	  symmetries : G
   355	  representations : R
   356	
   357	/-- Definition 8.2: the constituent invariant record
   358	`μ(P) = (construction data, constituent invariant records, gluing datum)`. -/
   359	structure ConstituentRecord (F Inv G : Type) where
   360	  /-- Construction data `F`. -/
   361	  construction : F
   362	  /-- Multiset of invariant records of the constituents. -/
   363	  constituents : List Inv
   364	  /-- Gluing datum `g_P` (e.g. an extension class in `H²(Q, Z(N))`). -/
   365	  gluing : G
   366	
   367	/-- Layers of the architecture (Definition 2.5). -/
   368	inductive Layer
   369	  | mathematical
   370	  | realization
   371	  | empirical
   372	deriving DecidableEq, Repr
   373	
   374	/-- The two constructions of Proposition 8.3 act at the mathematical layer. -/
   375	def constructionLayer : Layer := .mathematical
   376	
   377	/-- The constructions map neither into theories nor into observation data. -/
   378	theorem ConstructionLayerSeparation :
   379	    constructionLayer = .mathematical ∧
   380	    constructionLayer ≠ .realization ∧
   381	    constructionLayer ≠ .empirical := by
   382	  decide
   383	
   384	/-- Target 8 (Proposition 8.3): in case (a), direct sums of finite-dimensional complex
   385	C*-algebras classified by block sizes; in case (b), group extensions with fixed action
   386	classified by invariant records of `N`, `Q` and the extension class. In both cases the
   387	constituent record is complete up to the stated equivalences. The two hypotheses of each
   388	case record the classical inputs (structure theorem and simple-module-dimension recovery
   389	for (a); classification of extensions by `H²(Q, Z(N))` for (b)). -/
   390	theorem ConditionalStructuralGeneration
   391	    {Alg : Type} (IsoA : Alg → Alg → Prop) (dims : Alg → List ℕ)
   392	    (hA₁ : ∀ a b, IsoA a b → SameBlocks (dims a) (dims b))
   393	    (hA₂ : ∀ a b, SameBlocks (dims a) (dims b) → IsoA a b)
   394	    {Ext NRec QRec H2 : Type} (record : Ext → NRec × QRec × H2) (IsoE : Ext → Ext → Prop)
   395	    (hB₁ : ∀ e₁ e₂, IsoE e₁ e₂ → record e₁ = record e₂)
   396	    (hB₂ : ∀ e₁ e₂, record e₁ = record e₂ → IsoE e₁ e₂)
   397	    (a b : Alg) (e₁ e₂ : Ext) :
   398	    (IsoA a b ↔ SameBlocks (dims a) (dims b)) ∧
   399	    (IsoE e₁ e₂ ↔ record e₁ = record e₂) ∧
   400	    constructionLayer = .mathematical :=
   401	  ⟨⟨hA₁ a b, hA₂ a b⟩, ⟨⟨hB₁ e₁ e₂, hB₂ e₁ e₂⟩, rfl⟩⟩
   402	
   403	/-! ## Target 9 — `GenerationVersusClassification` (Remark 8.4) -/
   404	
   405	/-- Target 9, logical form: generation of every object from basic data does not deliver
   406	classification by invariants; a single generated but unclassified object refutes the
   407	implication. The witness of Remark 8.4 is a finitely presented group (generated from
   408	cyclic groups by free products and quotients) whose Markov property is undecidable. -/
   409	theorem GenerationVersusClassification
   410	    {ι : Type} (Generated Classified : ι → Prop)
   411	    (w : ι) (hwGen : Generated w) (hwCls : ¬ Classified w) :
   412	    ¬ ∀ i, Generated i → Classified i := by
   413	  intro h
   414	  exact hwCls (h w hwGen)
   415	
   416	/-! ## Target 10 — `FiniteDimCStarDecomposition` (Lemma 9.1, record T-BG-06) -/
   417	
   418	/-- Target 10, uniqueness direction: block sizes recovered as simple-module dimensions are
   419	isomorphism invariants (`hInv`), and the structure theorem reconstructs the algebra from
   420	the block multiset (`hRec`); under these classical inputs the block multiset is a complete
   421	invariant up to `*-`isomorphism. -/
   422	theorem FiniteDimCStarDecomposition
   423	    {Alg : Type} (Iso : Alg → Alg → Prop) (dims : Alg → List ℕ)
   424	    (hInv : ∀ a b, Iso a b → SameBlocks (dims a) (dims b))
   425	    (hRec : ∀ a b, SameBlocks (dims a) (dims b) → Iso a b) (a b : Alg) :
   426	    Iso a b ↔ SameBlocks (dims a) (dims b) :=
   427	  ⟨hInv a b, hRec a b⟩
   428	
   429	/-- The worked example of Section 9.1: `A = ℂ ⊕ M₂(ℂ)` has block multiset `{1, 2}`, and
   430	block order does not affect the counts. -/
   431	theorem ExampleBlockMultiset :
   432	    countNat 1 [1, 2] = 1 ∧
   433	    countNat 2 [1, 2] = 1 ∧
   434	    countNat 3 [1, 2] = 0 ∧
   435	    countNat 1 [2, 1] = 1 ∧
   436	    countNat 2 [2, 1] = 1 ∧
   437	    countNat 3 [2, 1] = 0 := by
   438	  decide
   439	
   440	end Cmrps.Vol12

exec
/usr/local/bin/zsh -lc "rg -n -A 24 -B 6 'fourManifoldWitness ::|regimeOf ::|FourManifoldWitness|data PrincipiaLayers|realize|select|structure PrincipiaLayers|NonCollapse|nonCollapse|9 ≤|≥ 9|product' src/vol-11-completeness-obstructions/Instances.hs src/vol-12-principia-physica/Instances.hs lean/Cmrps/Vol10ObservationalEquivalence.lean lean/Cmrps/Vol11CompletenessObstructions.lean lean/Cmrps/Vol12PrincipiaPhysica.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
lean/Cmrps/Vol12PrincipiaPhysica.lean-16-
lean/Cmrps/Vol12PrincipiaPhysica.lean-17-namespace Cmrps.Vol12
lean/Cmrps/Vol12PrincipiaPhysica.lean-18-
lean/Cmrps/Vol12PrincipiaPhysica.lean-19-/-! ## Target 1 — `PrincipiaLayers` (Definition 2.5) -/
lean/Cmrps/Vol12PrincipiaPhysica.lean-20-
lean/Cmrps/Vol12PrincipiaPhysica.lean-21-/-- Definition 2.5: the Principia architecture consists of three layers, with a
lean/Cmrps/Vol12PrincipiaPhysica.lean:22:realization map `M → P` and a selection map `P → Eobs`. -/
lean/Cmrps/Vol12PrincipiaPhysica.lean:23:structure PrincipiaLayers where
lean/Cmrps/Vol12PrincipiaPhysica.lean-24-  /-- The mathematical layer: output of classification of admissible structures. -/
lean/Cmrps/Vol12PrincipiaPhysica.lean-25-  M : Type
lean/Cmrps/Vol12PrincipiaPhysica.lean-26-  /-- The realization layer: physical theories. -/
lean/Cmrps/Vol12PrincipiaPhysica.lean-27-  P : Type
lean/Cmrps/Vol12PrincipiaPhysica.lean-28-  /-- The empirical layer: observational data. -/
lean/Cmrps/Vol12PrincipiaPhysica.lean-29-  Eobs : Type
lean/Cmrps/Vol12PrincipiaPhysica.lean-30-  /-- The realization map `R : M → P`. -/
lean/Cmrps/Vol12PrincipiaPhysica.lean:31:  realize : M → P
lean/Cmrps/Vol12PrincipiaPhysica.lean:32:  /-- The selection map `E : P → Eobs`. -/
lean/Cmrps/Vol12PrincipiaPhysica.lean:33:  select : P → Eobs
lean/Cmrps/Vol12PrincipiaPhysica.lean-34-
lean/Cmrps/Vol12PrincipiaPhysica.lean-35-/-- The separation clause of Definition 2.5, as formalized: the equivalence relation
lean/Cmrps/Vol12PrincipiaPhysica.lean:36:induced by `select` differs from the one induced by `cls` (they do not induce the
lean/Cmrps/Vol12PrincipiaPhysica.lean-37-same partition of `P`). **Scope caveat (Codex review, round 1):** this is NOT the
lean/Cmrps/Vol12PrincipiaPhysica.lean:38:failure of a factorization `select = f ∘ cls` — a constant `select` with `cls = id`
lean/Cmrps/Vol12PrincipiaPhysica.lean:39:satisfies this predicate although `select` factors through `cls`; the name records
lean/Cmrps/Vol12PrincipiaPhysica.lean-40-the paper's clause, the statement is the induced-relations inequality. -/
lean/Cmrps/Vol12PrincipiaPhysica.lean:41:def NotFactoring {M P Obs : Type} (cls : P → M) (select : P → Obs) : Prop :=
lean/Cmrps/Vol12PrincipiaPhysica.lean:42:  ¬ ∀ a b : P, (select a = select b ↔ cls a = cls b)
lean/Cmrps/Vol12PrincipiaPhysica.lean-43-
lean/Cmrps/Vol12PrincipiaPhysica.lean-44-/-- Section 3, non-collapse argument: if two theories are mathematically distinct but
lean/Cmrps/Vol12PrincipiaPhysica.lean:45:empirically equivalent, then `select` and `cls` do not induce the same equivalence
lean/Cmrps/Vol12PrincipiaPhysica.lean-46-relation on theories (the induced relations differ). -/
lean/Cmrps/Vol12PrincipiaPhysica.lean-47-theorem SelectionNotComputedByClassification
lean/Cmrps/Vol12PrincipiaPhysica.lean:48:    {M P Obs : Type} (cls : P → M) (select : P → Obs)
lean/Cmrps/Vol12PrincipiaPhysica.lean:49:    (T₁ T₂ : P) (hmath : cls T₁ ≠ cls T₂) (hobs : select T₁ = select T₂) :
lean/Cmrps/Vol12PrincipiaPhysica.lean:50:    NotFactoring cls select := by
lean/Cmrps/Vol12PrincipiaPhysica.lean-51-  intro h
lean/Cmrps/Vol12PrincipiaPhysica.lean-52-  exact hmath ((h T₁ T₂).1 hobs)
lean/Cmrps/Vol12PrincipiaPhysica.lean-53-
lean/Cmrps/Vol12PrincipiaPhysica.lean-54-/-! ## Target 2 — `EvidenceGradeAssignment` (Definition 2.6, Table 2) -/
lean/Cmrps/Vol12PrincipiaPhysica.lean-55-
lean/Cmrps/Vol12PrincipiaPhysica.lean-56-/-- Definition 2.6: formulation, rigorous theorem, physical validation. -/
lean/Cmrps/Vol12PrincipiaPhysica.lean-57-inductive EvidenceGrade
lean/Cmrps/Vol12PrincipiaPhysica.lean-58-  | formulation  -- grade 1
lean/Cmrps/Vol12PrincipiaPhysica.lean-59-  | rigorous     -- grade 2
lean/Cmrps/Vol12PrincipiaPhysica.lean-60-  | validated    -- grade 3
lean/Cmrps/Vol12PrincipiaPhysica.lean-61-deriving DecidableEq, Repr
lean/Cmrps/Vol12PrincipiaPhysica.lean-62-
lean/Cmrps/Vol12PrincipiaPhysica.lean-63-/-- The record types of the program registry (Table 2). -/
lean/Cmrps/Vol12PrincipiaPhysica.lean-64-inductive RecordType
lean/Cmrps/Vol12PrincipiaPhysica.lean-65-  | stipulatedDefinitions
lean/Cmrps/Vol12PrincipiaPhysica.lean-66-  | classificationTheorem
lean/Cmrps/Vol12PrincipiaPhysica.lean-67-  | reconstructionTheorem
lean/Cmrps/Vol12PrincipiaPhysica.lean-68-  | obstructionTheorem
lean/Cmrps/Vol12PrincipiaPhysica.lean-69-  | claimLedgerEntry
lean/Cmrps/Vol12PrincipiaPhysica.lean-70-  | physicalValidation
lean/Cmrps/Vol12PrincipiaPhysica.lean-71-deriving DecidableEq, Repr
lean/Cmrps/Vol12PrincipiaPhysica.lean-72-
lean/Cmrps/Vol12PrincipiaPhysica.lean-73-/-- Table 2: the evidence grade of each record type. -/
lean/Cmrps/Vol12PrincipiaPhysica.lean-74-def evidenceGrade : RecordType → EvidenceGrade
--
lean/Cmrps/Vol12PrincipiaPhysica.lean-129-  , ⟨"Finite-dimensional complex C*-algebras", .r1⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-130-  , ⟨"Amenable factors", .r1⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-131-  , ⟨"General type II and type III factors", .r5⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-132-  , ⟨"Quantum channels", .r4⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-133-  , ⟨"Principal G-bundles", .r1⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-134-  , ⟨"Anomalies", .r3⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean:135:  , ⟨"DHR superselection sectors", .r1⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-136-  , ⟨"Symmetric tensor categories of subexponential growth", .r1⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-137-  , ⟨"Fusion categories", .r4⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-138-  , ⟨"Extended topological quantum field theories", .r4⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-139-  , ⟨"Lorentzian holonomy groups", .r1⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-140-  , ⟨"Spacetime causality conditions", .r1⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-141-  , ⟨"Holographic entropy cone with at most four regions", .r1⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-142-  , ⟨"Holographic entropy cone with five or more regions", .r4⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-143-  , ⟨"Monotone metrics in the classical case", .r1⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-144-  , ⟨"Monotone metrics in the quantum case", .r1⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-145-  , ⟨"Emergent spacetime and the Ryu-Takayanagi formula", .r4⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-146-  , ⟨"Four-dimensional Yang-Mills and QCD existence", .r4⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-147-  , ⟨"Four-dimensional Yang-Mills mass gap", .r4⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-148-  , ⟨"Closed three-manifolds", .r1⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-149-  , ⟨"Four-manifolds", .r5⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-150-  , ⟨"Finitely presented groups under Markov properties", .r6⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-151-  , ⟨"Wild representation categories", .r5⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-152-  , ⟨"Unknot recognition", .r7⟩ ]
lean/Cmrps/Vol12PrincipiaPhysica.lean-153-
lean/Cmrps/Vol12PrincipiaPhysica.lean-154-/-- The regime of each row, in table order. -/
lean/Cmrps/Vol12PrincipiaPhysica.lean-155-def spineRegimes : List Regime := spineTable.map (·.regime)
lean/Cmrps/Vol12PrincipiaPhysica.lean-156-
lean/Cmrps/Vol12PrincipiaPhysica.lean-157-/-- Number of rows assigned to a regime. -/
lean/Cmrps/Vol12PrincipiaPhysica.lean-158-def countRegime (r : Regime) : List Regime → ℕ
lean/Cmrps/Vol12PrincipiaPhysica.lean-159-  | [] => 0
--
lean/Cmrps/Vol12PrincipiaPhysica.lean-402-
lean/Cmrps/Vol12PrincipiaPhysica.lean-403-/-! ## Target 9 — `GenerationVersusClassification` (Remark 8.4) -/
lean/Cmrps/Vol12PrincipiaPhysica.lean-404-
lean/Cmrps/Vol12PrincipiaPhysica.lean-405-/-- Target 9, logical form: generation of every object from basic data does not deliver
lean/Cmrps/Vol12PrincipiaPhysica.lean-406-classification by invariants; a single generated but unclassified object refutes the
lean/Cmrps/Vol12PrincipiaPhysica.lean-407-implication. The witness of Remark 8.4 is a finitely presented group (generated from
lean/Cmrps/Vol12PrincipiaPhysica.lean:408:cyclic groups by free products and quotients) whose Markov property is undecidable. -/
lean/Cmrps/Vol12PrincipiaPhysica.lean-409-theorem GenerationVersusClassification
lean/Cmrps/Vol12PrincipiaPhysica.lean-410-    {ι : Type} (Generated Classified : ι → Prop)
lean/Cmrps/Vol12PrincipiaPhysica.lean-411-    (w : ι) (hwGen : Generated w) (hwCls : ¬ Classified w) :
lean/Cmrps/Vol12PrincipiaPhysica.lean-412-    ¬ ∀ i, Generated i → Classified i := by
lean/Cmrps/Vol12PrincipiaPhysica.lean-413-  intro h
lean/Cmrps/Vol12PrincipiaPhysica.lean-414-  exact hwCls (h w hwGen)
lean/Cmrps/Vol12PrincipiaPhysica.lean-415-
lean/Cmrps/Vol12PrincipiaPhysica.lean-416-/-! ## Target 10 — `FiniteDimCStarDecomposition` (Lemma 9.1, record T-BG-06) -/
lean/Cmrps/Vol12PrincipiaPhysica.lean-417-
lean/Cmrps/Vol12PrincipiaPhysica.lean-418-/-- Target 10, uniqueness direction: block sizes recovered as simple-module dimensions are
lean/Cmrps/Vol12PrincipiaPhysica.lean-419-isomorphism invariants (`hInv`), and the structure theorem reconstructs the algebra from
lean/Cmrps/Vol12PrincipiaPhysica.lean-420-the block multiset (`hRec`); under these classical inputs the block multiset is a complete
lean/Cmrps/Vol12PrincipiaPhysica.lean-421-invariant up to `*-`isomorphism. -/
lean/Cmrps/Vol12PrincipiaPhysica.lean-422-theorem FiniteDimCStarDecomposition
lean/Cmrps/Vol12PrincipiaPhysica.lean-423-    {Alg : Type} (Iso : Alg → Alg → Prop) (dims : Alg → List ℕ)
lean/Cmrps/Vol12PrincipiaPhysica.lean-424-    (hInv : ∀ a b, Iso a b → SameBlocks (dims a) (dims b))
lean/Cmrps/Vol12PrincipiaPhysica.lean-425-    (hRec : ∀ a b, SameBlocks (dims a) (dims b) → Iso a b) (a b : Alg) :
lean/Cmrps/Vol12PrincipiaPhysica.lean-426-    Iso a b ↔ SameBlocks (dims a) (dims b) :=
lean/Cmrps/Vol12PrincipiaPhysica.lean-427-  ⟨hInv a b, hRec a b⟩
lean/Cmrps/Vol12PrincipiaPhysica.lean-428-
lean/Cmrps/Vol12PrincipiaPhysica.lean-429-/-- The worked example of Section 9.1: `A = ℂ ⊕ M₂(ℂ)` has block multiset `{1, 2}`, and
lean/Cmrps/Vol12PrincipiaPhysica.lean-430-block order does not affect the counts. -/
lean/Cmrps/Vol12PrincipiaPhysica.lean-431-theorem ExampleBlockMultiset :
lean/Cmrps/Vol12PrincipiaPhysica.lean-432-    countNat 1 [1, 2] = 1 ∧
--
src/vol-11-completeness-obstructions/Instances.hs-28-    -- * Witness systems of the register
src/vol-11-completeness-obstructions/Instances.hs-29-  , WitnessSystem
src/vol-11-completeness-obstructions/Instances.hs-30-      ( FiniteDimCStar, SimpleGroupWitness, AmenableFactorWitness
src/vol-11-completeness-obstructions/Instances.hs-31-      , GeneralII1Witness, IsocategoricalPair, FusionCategoryWitness
src/vol-11-completeness-obstructions/Instances.hs-32-      , WildModuleWitness, MarkovGroupWitness, UnknotWitness )
src/vol-11-completeness-obstructions/Instances.hs-33-  , fourManifoldWitness
src/vol-11-completeness-obstructions/Instances.hs:34:    -- ^ The only way to build 'FourManifoldWitness' (the raw constructor is
src/vol-11-completeness-obstructions/Instances.hs-35-    -- not exported): enforces the n >= 9 threshold of the cited
src/vol-11-completeness-obstructions/Instances.hs-36-    -- unrecognizability result, returning 'Nothing' below it.
src/vol-11-completeness-obstructions/Instances.hs-37-    -- * Family data witnesses
src/vol-11-completeness-obstructions/Instances.hs-38-  , OperatorAlgebraWitness (..)
src/vol-11-completeness-obstructions/Instances.hs-39-  , DerivedWitness (..)
src/vol-11-completeness-obstructions/Instances.hs-40-  , TensorCategoryWitness (..)
src/vol-11-completeness-obstructions/Instances.hs-41-  , GeometricWitness (..)
src/vol-11-completeness-obstructions/Instances.hs-42-  , CombinatorialWitness (..)
src/vol-11-completeness-obstructions/Instances.hs-43-    -- * Invariant mirror (paper, Definition 4.1)
src/vol-11-completeness-obstructions/Instances.hs-44-  , classifyCStar
src/vol-11-completeness-obstructions/Instances.hs-45-  , sortDesc
src/vol-11-completeness-obstructions/Instances.hs-46-  ) where
src/vol-11-completeness-obstructions/Instances.hs-47-
src/vol-11-completeness-obstructions/Instances.hs-48-import Taxonomy.Families
src/vol-11-completeness-obstructions/Instances.hs-49-  ( FamilyHilbertOperatorAlgebras (..)
src/vol-11-completeness-obstructions/Instances.hs-50-  , FamilySmoothGeometric (..)
src/vol-11-completeness-obstructions/Instances.hs-51-  , FamilyTensorCategoriesComposition (..)
src/vol-11-completeness-obstructions/Instances.hs-52-  , FamilyDynamicalSemigroups (..)
src/vol-11-completeness-obstructions/Instances.hs-53-  , FamilyDiscreteCombinatorial (..)
src/vol-11-completeness-obstructions/Instances.hs-54-  , FamilyDerivedHomotopical (..)
src/vol-11-completeness-obstructions/Instances.hs-55-  )
src/vol-11-completeness-obstructions/Instances.hs-56-import Taxonomy.Invariants
src/vol-11-completeness-obstructions/Instances.hs-57-  ( ClassifyingInvariant (..)
src/vol-11-completeness-obstructions/Instances.hs-58-  , DimensionVector (..)
--
src/vol-11-completeness-obstructions/Instances.hs-111-  | FusionCategoryWitness String
src/vol-11-completeness-obstructions/Instances.hs-112-    -- ^ Fusion category; open.
src/vol-11-completeness-obstructions/Instances.hs-113-  | WildModuleWitness (Int, Int)
src/vol-11-completeness-obstructions/Instances.hs-114-    -- ^ Module of a wild category by rank data; wild.
src/vol-11-completeness-obstructions/Instances.hs-115-  | MarkovGroupWitness String
src/vol-11-completeness-obstructions/Instances.hs-116-    -- ^ Finitely presented group with a Markov property; undecidable.
src/vol-11-completeness-obstructions/Instances.hs:117:  | FourManifoldWitness Int
src/vol-11-completeness-obstructions/Instances.hs-118-    -- ^ Connected sum of n copies of S^2 x S^2; unrecognizable for n >= 9.
src/vol-11-completeness-obstructions/Instances.hs-119-    -- Internal: construct only through 'fourManifoldWitness', which enforces
src/vol-11-completeness-obstructions/Instances.hs-120-    -- the threshold of the cited result.
src/vol-11-completeness-obstructions/Instances.hs-121-  | UnknotWitness Int
src/vol-11-completeness-obstructions/Instances.hs-122-    -- ^ Knot diagram by crossing count; decidable-but-unclassified.
src/vol-11-completeness-obstructions/Instances.hs-123-  deriving (Eq, Show)
src/vol-11-completeness-obstructions/Instances.hs-124-
src/vol-11-completeness-obstructions/Instances.hs:125:-- | Smart constructor for 'FourManifoldWitness'. The cited unrecognizability
src/vol-11-completeness-obstructions/Instances.hs-126--- result (paper, Table 4) holds only for n >= 9, so witnesses below that
src/vol-11-completeness-obstructions/Instances.hs-127--- threshold are not admitted.
src/vol-11-completeness-obstructions/Instances.hs:128:fourManifoldWitness :: Int -> Maybe WitnessSystem
src/vol-11-completeness-obstructions/Instances.hs-129-fourManifoldWitness n
src/vol-11-completeness-obstructions/Instances.hs:130:  | n >= 9    = Just (FourManifoldWitness n)
src/vol-11-completeness-obstructions/Instances.hs-131-  | otherwise = Nothing
src/vol-11-completeness-obstructions/Instances.hs-132-
src/vol-11-completeness-obstructions/Instances.hs-133--- | Paper, Table 4: the regime of each witness system.  Total by
src/vol-11-completeness-obstructions/Instances.hs-134--- construction, mirroring the lean target 'RegimeAssignment'.
src/vol-11-completeness-obstructions/Instances.hs:135:regimeOf :: WitnessSystem -> ClassificationRegime
src/vol-11-completeness-obstructions/Instances.hs-136-regimeOf (FiniteDimCStar _)        = ParameterizedRegime
src/vol-11-completeness-obstructions/Instances.hs-137-regimeOf (SimpleGroupWitness _)    = UnparameterizedRegime
src/vol-11-completeness-obstructions/Instances.hs-138-regimeOf (AmenableFactorWitness _) = ParameterizedRegime
src/vol-11-completeness-obstructions/Instances.hs-139-regimeOf (GeneralII1Witness _)     = ObstructionCompleteRegime
src/vol-11-completeness-obstructions/Instances.hs-140-regimeOf (IsocategoricalPair _ _)  = ObstructionCompleteRegime
src/vol-11-completeness-obstructions/Instances.hs-141-regimeOf (FusionCategoryWitness _) = OpenRegime
src/vol-11-completeness-obstructions/Instances.hs-142-regimeOf (WildModuleWitness _)     = WildRegime
src/vol-11-completeness-obstructions/Instances.hs-143-regimeOf (MarkovGroupWitness _)    = UndecidableRegime
src/vol-11-completeness-obstructions/Instances.hs:144:regimeOf (FourManifoldWitness n)
src/vol-11-completeness-obstructions/Instances.hs-145-  | n >= 9    = UndecidableRegime
src/vol-11-completeness-obstructions/Instances.hs-146-  | otherwise = OpenRegime
src/vol-11-completeness-obstructions/Instances.hs-147-    -- Below the cited n >= 9 threshold no unrecognizability theorem applies.
src/vol-11-completeness-obstructions/Instances.hs-148-regimeOf (UnknotWitness _)         = DecidableButUnclassifiedRegime
src/vol-11-completeness-obstructions/Instances.hs-149-
src/vol-11-completeness-obstructions/Instances.hs-150--- | Operator-algebra structural data, for the 'FamilyHilbertOperatorAlgebras'
src/vol-11-completeness-obstructions/Instances.hs-151--- instance.  'Nothing' at the instance level means the witness carries no
src/vol-11-completeness-obstructions/Instances.hs-152--- operator-algebra data here.
src/vol-11-completeness-obstructions/Instances.hs-153-data OperatorAlgebraWitness
src/vol-11-completeness-obstructions/Instances.hs-154-  = CStarBlocks [Int]
src/vol-11-completeness-obstructions/Instances.hs-155-    -- ^ Dimension vector of a finite-dimensional C*-algebra.
src/vol-11-completeness-obstructions/Instances.hs-156-  | FactorTag String
src/vol-11-completeness-obstructions/Instances.hs-157-    -- ^ Named factor witness.
src/vol-11-completeness-obstructions/Instances.hs-158-  deriving (Eq, Show)
src/vol-11-completeness-obstructions/Instances.hs-159-
src/vol-11-completeness-obstructions/Instances.hs-160--- | Derived and homotopical data, for 'FamilyDerivedHomotopical'.
src/vol-11-completeness-obstructions/Instances.hs-161-data DerivedWitness
src/vol-11-completeness-obstructions/Instances.hs-162-  = DerivedWildTag (Int, Int)
src/vol-11-completeness-obstructions/Instances.hs-163-    -- ^ Rank data of a derived-wild module category witness.
src/vol-11-completeness-obstructions/Instances.hs-164-  deriving (Eq, Show)
src/vol-11-completeness-obstructions/Instances.hs-165-
src/vol-11-completeness-obstructions/Instances.hs-166--- | Tensor-category data, for 'FamilyTensorCategoriesComposition'.
src/vol-11-completeness-obstructions/Instances.hs-167-data TensorCategoryWitness
src/vol-11-completeness-obstructions/Instances.hs-168-  = PlainTensorRep String
--
src/vol-11-completeness-obstructions/Instances.hs-227-  tensorCategoryData (FusionCategoryWitness n) = Just (FusionCategoryTag n)
src/vol-11-completeness-obstructions/Instances.hs-228-  tensorCategoryData (SimpleGroupWitness g) = Just (SymmetricTensorRep g)
src/vol-11-completeness-obstructions/Instances.hs-229-  tensorCategoryData _ = Nothing
src/vol-11-completeness-obstructions/Instances.hs-230-
src/vol-11-completeness-obstructions/Instances.hs-231-instance FamilySmoothGeometric WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs-232-  type GeometricData WitnessSystem = Maybe GeometricWitness
src/vol-11-completeness-obstructions/Instances.hs:233:  geometricData (FourManifoldWitness n) = Just (FourManifoldTag n)
src/vol-11-completeness-obstructions/Instances.hs-234-  geometricData (UnknotWitness n) = Just (KnotDiagramTag n)
src/vol-11-completeness-obstructions/Instances.hs-235-  geometricData _ = Nothing
src/vol-11-completeness-obstructions/Instances.hs-236-
src/vol-11-completeness-obstructions/Instances.hs-237-instance FamilyDiscreteCombinatorial WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs-238-  type CombinatorialData WitnessSystem = Maybe CombinatorialWitness
src/vol-11-completeness-obstructions/Instances.hs-239-  combinatorialData (MarkovGroupWitness p) = Just (MarkovPresentation p)
src/vol-11-completeness-obstructions/Instances.hs-240-  combinatorialData (SimpleGroupWitness g) = Just (FiniteGroupData g)
src/vol-11-completeness-obstructions/Instances.hs-241-  combinatorialData _ = Nothing
src/vol-11-completeness-obstructions/Instances.hs-242-
src/vol-11-completeness-obstructions/Instances.hs-243--- | Direct sum concatenates dimension vectors; every other construction is
src/vol-11-completeness-obstructions/Instances.hs-244--- left unsupplied here, which asserts nothing about its existence.
src/vol-11-completeness-obstructions/Instances.hs-245-instance Constructible WitnessSystem where
src/vol-11-completeness-obstructions/Instances.hs-246-  type Composite WitnessSystem = WitnessSystem
src/vol-11-completeness-obstructions/Instances.hs-247-  tensorProduct _ _ = Nothing
src/vol-11-completeness-obstructions/Instances.hs-248-  directSum (FiniteDimCStar a) (FiniteDimCStar b) =
src/vol-11-completeness-obstructions/Instances.hs-249-    Just (FiniteDimCStar (sortDesc (a ++ b)))
src/vol-11-completeness-obstructions/Instances.hs-250-  directSum _ _ = Nothing
src/vol-11-completeness-obstructions/Instances.hs-251-  extend _ _ _ = Nothing
src/vol-11-completeness-obstructions/Instances.hs-252-  limitHook _ _ = Nothing
src/vol-11-completeness-obstructions/Instances.hs-253-  colimitHook _ _ = Nothing
src/vol-11-completeness-obstructions/Instances.hs-254-  quotientReduction _ _ = Nothing
src/vol-11-completeness-obstructions/Instances.hs-255-
src/vol-11-completeness-obstructions/Instances.hs-256--- | Irreducibility is relative to the named construction, as in the paper:
src/vol-11-completeness-obstructions/Instances.hs-257--- single-block C*-algebras are irreducible for direct sum, and factors are
--
lean/Cmrps/Vol10ObservationalEquivalence.lean-136-    rfl
lean/Cmrps/Vol10ObservationalEquivalence.lean-137-  · intro g hg
lean/Cmrps/Vol10ObservationalEquivalence.lean-138-    funext x
lean/Cmrps/Vol10ObservationalEquivalence.lean-139-    refine Quotient.inductionOn x fun P => ?_
lean/Cmrps/Vol10ObservationalEquivalence.lean-140-    exact hg P
lean/Cmrps/Vol10ObservationalEquivalence.lean-141-
lean/Cmrps/Vol10ObservationalEquivalence.lean:142:/-- Lemma 4.3 (setup): the product of two observation functors is an observation functor
lean/Cmrps/Vol10ObservationalEquivalence.lean:143:into the product of the record categories. -/
lean/Cmrps/Vol10ObservationalEquivalence.lean-144-def ObservationFunctor.prod {S R₁ R₂ : Type*} (F₁ : ObservationFunctor S R₁)
lean/Cmrps/Vol10ObservationalEquivalence.lean-145-    (F₂ : ObservationFunctor S R₂) : ObservationFunctor S (R₁ × R₂) where
lean/Cmrps/Vol10ObservationalEquivalence.lean-146-  obs := fun P => (F₁.obs P, F₂.obs P)
lean/Cmrps/Vol10ObservationalEquivalence.lean-147-  recordIso := fun x y => F₁.recordIso x.1 y.1 ∧ F₂.recordIso x.2 y.2
lean/Cmrps/Vol10ObservationalEquivalence.lean-148-  recordIso_equiv :=
lean/Cmrps/Vol10ObservationalEquivalence.lean-149-    { refl := fun _x => ⟨F₁.recordIso_equiv.refl _, F₂.recordIso_equiv.refl _⟩
lean/Cmrps/Vol10ObservationalEquivalence.lean-150-      symm := fun ⟨h1, h2⟩ => ⟨F₁.recordIso_equiv.symm h1, F₂.recordIso_equiv.symm h2⟩
lean/Cmrps/Vol10ObservationalEquivalence.lean-151-      trans := fun ⟨a, b⟩ ⟨c, d⟩ =>
lean/Cmrps/Vol10ObservationalEquivalence.lean-152-        ⟨F₁.recordIso_equiv.trans a c, F₂.recordIso_equiv.trans b d⟩ }
lean/Cmrps/Vol10ObservationalEquivalence.lean-153-
lean/Cmrps/Vol10ObservationalEquivalence.lean:154:/-- Lemma 4.3 (products of observations): the relation induced by a product of
lean/Cmrps/Vol10ObservationalEquivalence.lean-155-observation functors is the intersection of the relations of the two factors. -/
lean/Cmrps/Vol10ObservationalEquivalence.lean:156:theorem obs_products_intersection {S R₁ R₂ : Type*} (F₁ : ObservationFunctor S R₁)
lean/Cmrps/Vol10ObservationalEquivalence.lean-157-    (F₂ : ObservationFunctor S R₂) (P Q : S) :
lean/Cmrps/Vol10ObservationalEquivalence.lean-158-    obsEquiv (F₁.prod F₂) P Q ↔ obsEquiv F₁ P Q ∧ obsEquiv F₂ P Q :=
lean/Cmrps/Vol10ObservationalEquivalence.lean-159-  Iff.rfl
lean/Cmrps/Vol10ObservationalEquivalence.lean-160-
lean/Cmrps/Vol10ObservationalEquivalence.lean-161-/-! ## Coarse and fine observations (Definition 4.4, Proposition 4.5) -/
lean/Cmrps/Vol10ObservationalEquivalence.lean-162-
lean/Cmrps/Vol10ObservationalEquivalence.lean-163-/-- Definition 4.4 (coarse and fine observations): `Obs_c` is a coarsening of `Obs_f`
lean/Cmrps/Vol10ObservationalEquivalence.lean-164-when a forgetting map `h` on records exists with `Obs_c = h ∘ Obs_f`. -/
lean/Cmrps/Vol10ObservationalEquivalence.lean-165-structure Coarsening {S Rf Rc : Type*} (Ff : ObservationFunctor S Rf) (obsC : S → Rc) where
lean/Cmrps/Vol10ObservationalEquivalence.lean-166-  /-- The comparison map on records that forgets detail. -/
lean/Cmrps/Vol10ObservationalEquivalence.lean-167-  h : Rf → Rc
lean/Cmrps/Vol10ObservationalEquivalence.lean-168-  /-- `Obs_c = h ∘ Obs_f` on systems. -/
lean/Cmrps/Vol10ObservationalEquivalence.lean-169-  factors : obsC = h ∘ Ff.obs
lean/Cmrps/Vol10ObservationalEquivalence.lean-170-
lean/Cmrps/Vol10ObservationalEquivalence.lean-171-/-- Proposition 4.5 (coarse records separate less), inclusion direction: if
lean/Cmrps/Vol10ObservationalEquivalence.lean-172-`Obs_c = h ∘ Obs_f` and `h` carries record isomorphisms to record isomorphisms, then
lean/Cmrps/Vol10ObservationalEquivalence.lean-173-fine equivalence implies coarse equivalence. -/
lean/Cmrps/Vol10ObservationalEquivalence.lean-174-theorem obs_coarse_graining_composition {S Rf Rc : Type*}
lean/Cmrps/Vol10ObservationalEquivalence.lean-175-    (Ff : ObservationFunctor S Rf) (Fc : ObservationFunctor S Rc)
lean/Cmrps/Vol10ObservationalEquivalence.lean-176-    (h : Rf → Rc) (factors : Fc.obs = h ∘ Ff.obs)
lean/Cmrps/Vol10ObservationalEquivalence.lean-177-    (h_mono : ∀ x y, Ff.recordIso x y → Fc.recordIso (h x) (h y))
lean/Cmrps/Vol10ObservationalEquivalence.lean-178-    (P Q : S) (hpq : obsEquiv Ff P Q) : obsEquiv Fc P Q := by
lean/Cmrps/Vol10ObservationalEquivalence.lean-179-  have hP : Fc.obs P = h (Ff.obs P) := by rw [factors]; rfl
lean/Cmrps/Vol10ObservationalEquivalence.lean-180-  have hQ : Fc.obs Q = h (Ff.obs Q) := by rw [factors]; rfl
--
lean/Cmrps/Vol10ObservationalEquivalence.lean-230-    · norm_num [e1Push, pDist, qDist]
lean/Cmrps/Vol10ObservationalEquivalence.lean-231-  · intro h
lean/Cmrps/Vol10ObservationalEquivalence.lean-232-    norm_num [SameRecord, e2Push, pDist, qDist] at h
lean/Cmrps/Vol10ObservationalEquivalence.lean-233-
lean/Cmrps/Vol10ObservationalEquivalence.lean-234-/-! ## Composed experiments (Proposition 4.6) -/
lean/Cmrps/Vol10ObservationalEquivalence.lean-235-
lean/Cmrps/Vol10ObservationalEquivalence.lean:236:/-- The observation functor of a composite system whose record is the product of the
lean/Cmrps/Vol10ObservationalEquivalence.lean-237-factor records (the hypothesis of Proposition 4.6). -/
lean/Cmrps/Vol10ObservationalEquivalence.lean-238-def ObservationFunctor.compProd {S₁ S₂ R₁ R₂ : Type*} (F₁ : ObservationFunctor S₁ R₁)
lean/Cmrps/Vol10ObservationalEquivalence.lean-239-    (F₂ : ObservationFunctor S₂ R₂) : ObservationFunctor (S₁ × S₂) (R₁ × R₂) where
lean/Cmrps/Vol10ObservationalEquivalence.lean-240-  obs := fun PQ => (F₁.obs PQ.1, F₂.obs PQ.2)
lean/Cmrps/Vol10ObservationalEquivalence.lean-241-  recordIso := fun x y => F₁.recordIso x.1 y.1 ∧ F₂.recordIso x.2 y.2
lean/Cmrps/Vol10ObservationalEquivalence.lean-242-  recordIso_equiv :=
lean/Cmrps/Vol10ObservationalEquivalence.lean-243-    { refl := fun _x => ⟨F₁.recordIso_equiv.refl _, F₂.recordIso_equiv.refl _⟩
lean/Cmrps/Vol10ObservationalEquivalence.lean-244-      symm := fun ⟨h1, h2⟩ => ⟨F₁.recordIso_equiv.symm h1, F₂.recordIso_equiv.symm h2⟩
lean/Cmrps/Vol10ObservationalEquivalence.lean-245-      trans := fun ⟨a, b⟩ ⟨c, d⟩ =>
lean/Cmrps/Vol10ObservationalEquivalence.lean-246-        ⟨F₁.recordIso_equiv.trans a c, F₂.recordIso_equiv.trans b d⟩ }
lean/Cmrps/Vol10ObservationalEquivalence.lean-247-
lean/Cmrps/Vol10ObservationalEquivalence.lean:248:/-- Proposition 4.6 (composed experiments), product direction: under product records
lean/Cmrps/Vol10ObservationalEquivalence.lean-249-indistinguishability of the factors is preserved on composites. -/
lean/Cmrps/Vol10ObservationalEquivalence.lean:250:theorem obs_composed_product_preserved {S₁ S₂ R₁ R₂ : Type*}
lean/Cmrps/Vol10ObservationalEquivalence.lean-251-    (F₁ : ObservationFunctor S₁ R₁) (F₂ : ObservationFunctor S₂ R₂)
lean/Cmrps/Vol10ObservationalEquivalence.lean-252-    (P P' : S₁) (Q Q' : S₂)
lean/Cmrps/Vol10ObservationalEquivalence.lean-253-    (hP : obsEquiv F₁ P P') (hQ : obsEquiv F₂ Q Q') :
lean/Cmrps/Vol10ObservationalEquivalence.lean-254-    obsEquiv (F₁.compProd F₂) (P, Q) (P', Q') :=
lean/Cmrps/Vol10ObservationalEquivalence.lean-255-  ⟨hP, hQ⟩
lean/Cmrps/Vol10ObservationalEquivalence.lean-256-
lean/Cmrps/Vol10ObservationalEquivalence.lean-257-/-- Proposition 4.6 (composed experiments), failure witness: the factor records of `p`
lean/Cmrps/Vol10ObservationalEquivalence.lean-258-and `q` under `e1` coincide, yet the diagonal joint experiment on the composite
lean/Cmrps/Vol10ObservationalEquivalence.lean-259-separates `p × p` from `p × q`, reporting `11/32` against `9/32`. -/
lean/Cmrps/Vol10ObservationalEquivalence.lean-260-theorem obs_composed_experiments_failure :
lean/Cmrps/Vol10ObservationalEquivalence.lean-261-    SameRecord e1Push pDist qDist
lean/Cmrps/Vol10ObservationalEquivalence.lean-262-      ∧ diagJoint pDist pDist = 11/32
lean/Cmrps/Vol10ObservationalEquivalence.lean-263-      ∧ diagJoint pDist qDist = 9/32
lean/Cmrps/Vol10ObservationalEquivalence.lean-264-      ∧ (11/32 : ℚ) ≠ 9/32 := by
lean/Cmrps/Vol10ObservationalEquivalence.lean-265-  refine ⟨?_, ?_, ?_, ?_⟩
lean/Cmrps/Vol10ObservationalEquivalence.lean-266-  · exact obs_coarse_witness.1
lean/Cmrps/Vol10ObservationalEquivalence.lean-267-  · norm_num [diagJoint, pDist, qDist]
lean/Cmrps/Vol10ObservationalEquivalence.lean-268-  · norm_num [diagJoint, pDist, qDist]
lean/Cmrps/Vol10ObservationalEquivalence.lean-269-  · norm_num
lean/Cmrps/Vol10ObservationalEquivalence.lean-270-
lean/Cmrps/Vol10ObservationalEquivalence.lean-271-/-! ## Structure preservation and its failure (Theorem 3.1, Corollary 3.2) -/
lean/Cmrps/Vol10ObservationalEquivalence.lean-272-
lean/Cmrps/Vol10ObservationalEquivalence.lean-273-/-- Theorem 3.1 (Etingof–Gelaki) as hypothesis data: non-isomorphic finite groups whose
lean/Cmrps/Vol10ObservationalEquivalence.lean-274-complex representation categories are equivalent as plain tensor categories. The
--
src/vol-12-principia-physica/Instances.hs-93-  [ (r, length (filter ((== r) . snd) rows))
src/vol-12-principia-physica/Instances.hs-94-  | r <- [minBound .. maxBound]
src/vol-12-principia-physica/Instances.hs-95-  , any ((== r) . snd) rows
src/vol-12-principia-physica/Instances.hs-96-  ]
src/vol-12-principia-physica/Instances.hs-97-
src/vol-12-principia-physica/Instances.hs-98--- | The Principia architecture (Definition 2.5): mathematical
src/vol-12-principia-physica/Instances.hs:99:-- classification, physical realization, and empirical selection, with the
src/vol-12-principia-physica/Instances.hs:100:-- realization and selection maps mirroring 'Cmrps.Vol12.PrincipiaLayers'
src/vol-12-principia-physica/Instances.hs-101--- (lean/Cmrps/Vol12PrincipiaPhysica.lean). The non-collapse of the layers is
src/vol-12-principia-physica/Instances.hs-102--- a supplied condition, not a consequence of the record shape: mirroring
src/vol-12-principia-physica/Instances.hs:103:-- Lean's 'NotFactoring', the equivalence relation induced by 'select' must
src/vol-12-principia-physica/Instances.hs-104--- differ from the one induced by classification.
src/vol-12-principia-physica/Instances.hs:105:data PrincipiaLayers m r e = PrincipiaLayers
src/vol-12-principia-physica/Instances.hs-106-  { mathLayer :: m
src/vol-12-principia-physica/Instances.hs-107-    -- ^ Layer M: a classification of admissible structures.
src/vol-12-principia-physica/Instances.hs-108-  , realizationLayer :: r
src/vol-12-principia-physica/Instances.hs-109-    -- ^ Layer R: a physical theory.
src/vol-12-principia-physica/Instances.hs:110:  , selectionLayer :: e
src/vol-12-principia-physica/Instances.hs-111-    -- ^ Layer E: observational data.
src/vol-12-principia-physica/Instances.hs:112:  , realize :: m -> r
src/vol-12-principia-physica/Instances.hs-113-    -- ^ The realization map R : M -> P of Definition 2.5.
src/vol-12-principia-physica/Instances.hs:114:  , select :: r -> e
src/vol-12-principia-physica/Instances.hs:115:    -- ^ The selection map E : P -> Eobs of Definition 2.5.
src/vol-12-principia-physica/Instances.hs-116-  }
src/vol-12-principia-physica/Instances.hs-117-
src/vol-12-principia-physica/Instances.hs-118--- | The worked example of the paper (Section 9.1): the finite-dimensional
src/vol-12-principia-physica/Instances.hs-119--- complex C*-algebra A = C (+) M_2(C), recorded by its dimension vector. The
src/vol-12-principia-physica/Instances.hs-120--- list of block sizes is the multiset that classifies the algebra up to
src/vol-12-principia-physica/Instances.hs-121--- *-isomorphism (T-BG-06); the order of the list carries no meaning.
src/vol-12-principia-physica/Instances.hs-122-newtype FiniteDimQuantumExample = FiniteDimQuantumExample
src/vol-12-principia-physica/Instances.hs-123-  { exampleBlocks :: [Int] }
src/vol-12-principia-physica/Instances.hs-124-  deriving (Eq, Show)
src/vol-12-principia-physica/Instances.hs-125-
src/vol-12-principia-physica/Instances.hs-126--- | An irreducible matrix block M_n(C) of a finite-dimensional C*-algebra.
src/vol-12-principia-physica/Instances.hs-127--- The integer is the block size n.
src/vol-12-principia-physica/Instances.hs-128-newtype MatrixBlock = MatrixBlock
src/vol-12-principia-physica/Instances.hs-129-  { matrixSize :: Int }
src/vol-12-principia-physica/Instances.hs-130-  deriving (Eq, Ord, Show)
src/vol-12-principia-physica/Instances.hs-131-
src/vol-12-principia-physica/Instances.hs-132--- | The dimension vector of the worked example: A = C (+) M_2(C) has
src/vol-12-principia-physica/Instances.hs-133--- dimension vector {1, 2}. Mirrors the paper's Lemma 5.1 statement and the
src/vol-12-principia-physica/Instances.hs-134--- lean target FiniteDimCStarDecomposition.
src/vol-12-principia-physica/Instances.hs-135-dimensionVectorExample :: DimensionVector
src/vol-12-principia-physica/Instances.hs-136-dimensionVectorExample = DimensionVector [1, 2]
src/vol-12-principia-physica/Instances.hs-137-
src/vol-12-principia-physica/Instances.hs-138--- | The decomposition of the worked example into irreducible blocks under
src/vol-12-principia-physica/Instances.hs-139--- the direct-sum construction: one block of size one and one block of size

exec
/usr/local/bin/zsh -lc "rg -n -A 8 -B 5 '9|Tancer|tancer|fourManifold|FourManifold|manifold' lean/Cmrps/Vol11CompletenessObstructions.lean" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
14-* `ObstructionTransport.*`           — paper, Theorem 5.2 (set-level clauses)
15-* `UndecidabilityTransport`          — paper, Proposition 5.5
16-* `FiniteSporadicFails`              — paper, Proposition 5.6 (abstract core)
17-* `TwoRegimeFails`                   — paper, Proposition 5.7 (abstract core)
18-* `IsocategoricalEquivalenceFails`   — paper, Proposition 5.8 (conditional form)
19:* `RegimeAssignment`                 — paper, Table 4 (29 domains, 7 regimes)
20-
21-Clauses requiring descriptive set theory (Borel reductions), matrix-pair wild
22-embeddings, or the external literature inputs (McDuff, Adyan-Rabin,
23:Etingof-Gelaki, Buchweitz-Leuschke, Sasyk-Tørnquist, Tancer) are recorded in
24-`verification/vol-11-completeness-obstructions-conjectures.md`. Nothing in this
25-file uses `sorry` or an axiom.
26--/
27-import Mathlib.Basic.Countable.Defs
28-import Mathlib.Data.Quot
29-
30-namespace Cmrps.Vol11
31-
--
304-    Coarsens iso pt ∧ ¬ Coarsens pt iso :=
305-  ⟨hcoarse, fun hall => hne (hall G H heq)⟩
306-
307-/-! ## Regime assignment (paper, Table 4) -/
308-
309:/-- Paper, Table 4: the 29 surveyed domains of the series literature map. -/
310-inductive SurveyedDomain where
311-  | simpleLieAlgebras
312-  | highestWeightIrreps
313-  | finiteDimCstarAlgebras
314-  | principalGBundles
315-  | classicalMonotoneMetrics
316-  | localSymplecticGerms
317-  | amenableFactors
--
332-  | typeIIIFactors
333-  | wildCMModulesGenericDet
334-  | cpEquivariantModulesOddPrimes
335-  | derivedWildAlgebras
336-  | fpGroupsMarkovProperties
337:  | fourManifoldHomeomorphism
338-  | vNAlgebraIsomorphism
339-  | unknotRecognition
340-  deriving DecidableEq
341-
342-/-- Paper, Table 4 / Section 8 (RegimeAssignment): the assignment of surveyed
343-domains to regimes. The consistency properties below mirror
344-`src/vol-11-completeness-obstructions/regime_inventory.py` (`check_partition`);
345-the mathematical justification of each row is the obstruction register and the
--
370-  | .typeIIIFactors => .open_
371-  | .wildCMModulesGenericDet => .wild
372-  | .cpEquivariantModulesOddPrimes => .wild
373-  | .derivedWildAlgebras => .wild
374-  | .fpGroupsMarkovProperties => .undecidable
375:  | .fourManifoldHomeomorphism => .undecidable
376-  | .unknotRecognition => .decidableButUnclassified
377-
378-/-- Paper, Table 4: the assignment is total — every surveyed domain has a
379-regime. -/
380-theorem RegimeAssignment.total (d : SurveyedDomain) :
381-    ∃ ρ, RegimeAssignment d = ρ :=
382-  ⟨_, rfl⟩
383-

codex
1. **Fix 1 — CORRECT.** `src/vol-10-observational-equivalence/Instances.hs:89` uses `[p * q | p <- ps, q <- qs]`. Composing `[1/2,1/2]` with itself yields four `1/4` entries, summing to `1`.

2. **Fix 2 — CORRECT.** `src/vol-11-completeness-obstructions/Instances.hs:29–33` hides the raw constructor; lines 128–131 admit witnesses only for `n >= 9`. Lines 144–146 additionally restrict `UndecidableRegime` to that threshold.

3. **Fix 3 — CORRECT.** `src/vol-12-principia-physica/Instances.hs:112–115` carries `realize :: m -> r` and `select :: r -> e`, matching `lean/Cmrps/Vol12PrincipiaPhysica.lean:31–33`. Lines 101–104 correctly clarify that non-collapse remains a supplied condition.

VERDICT: PASS
hook: Stop
hook: Stop Completed
tokens used
44,865
1. **Fix 1 — CORRECT.** `src/vol-10-observational-equivalence/Instances.hs:89` uses `[p * q | p <- ps, q <- qs]`. Composing `[1/2,1/2]` with itself yields four `1/4` entries, summing to `1`.

2. **Fix 2 — CORRECT.** `src/vol-11-completeness-obstructions/Instances.hs:29–33` hides the raw constructor; lines 128–131 admit witnesses only for `n >= 9`. Lines 144–146 additionally restrict `UndecidableRegime` to that threshold.

3. **Fix 3 — CORRECT.** `src/vol-12-principia-physica/Instances.hs:112–115` carries `realize :: m -> r` and `select :: r -> e`, matching `lean/Cmrps/Vol12PrincipiaPhysica.lean:31–33`. Lines 101–104 correctly clarify that non-collapse remains a supplied condition.

VERDICT: PASS
