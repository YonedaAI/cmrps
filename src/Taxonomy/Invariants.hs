{-# LANGUAGE EmptyDataDecls #-}

-- | Module        : Taxonomy.Invariants
-- Description     : Invariant records, classifying invariants, and invariant
--                   accessors for the typed taxonomy.
-- Ontology source : docs/ontology.md (DEF-036, DEF-037; family DEF-IDs cited
--                   per declaration).
--
-- Mirrors the invariants layer of the ontology: the structural invariant
-- record (DEF-036) and the classifying invariants named in DEF-037. Types
-- whose mathematical content is abstract at this level are honest stubs: their
-- Haddock comments state the semantics a later volume must supply, and no
-- computation of mathematical content happens here.
--
-- Claim status (docs/theorem-registry.md): this module is vocabulary and
-- accessor shape only. It claims no proof and no formalisation; cited
-- classification results carry their registry status in the comments
-- (literature results are 'complete-informal-proof' at best, never
-- machine-checked within this program).
module Taxonomy.Invariants
  ( -- * Structural invariant record (DEF-036)
    InvariantRecord (..)
    -- * Classifying invariants (DEF-037)
  , ClassifyingInvariant (..)
  , dimensionVectorOf
  , lieDiagramOf
  , weightDataOf
  , murrayVonNeumannTypeOf
  , connesInvariantsOf
  , classifyingSpaceMapOf
  , characteristicClassesOf
  , fullyDualizableObjectOf
  , holonomyGroupOf
  , causalClassOf
  , holographicInequalityDataOf
  , fisherMetricOf
  , monotoneMetricOf
    -- * Invariant data types
  , DimensionVector (..)
  , LieDiagram (..)
  , DynkinDiagram (..)
  , SatakeDiagram
  , WeightData (..)
  , CasimirData (..)
  , MurrayVonNeumannType (..)
  , ConnesInvariants
  , ClassifyingSpaceMap
  , CharacteristicClass (..)
  , FullyDualizableObject
  , HolonomyGroup
  , CausalClass (..)
  , HolographicInequalityData (..)
  , EntropyInequality (..)
  , FisherMetric
  , MonotoneMetric
  , EntropyHook (..)
  , entropyUnder
  ) where

-- | DEF-036 — the structural invariant record of a theory T:
-- I(T) = (S_T, O_T, D_T, G_T, R_T), describing states, observables, dynamics,
-- symmetries, and representations. The classification question is which of
-- these invariants suffice to distinguish theories up to the chosen physical
-- equivalence (DEF-015). Status: stipulative.
data InvariantRecord s o d g r = InvariantRecord
  { stateInvariants :: s
    -- ^ State-side invariants S_T.
  , observableInvariants :: o
    -- ^ Observable-side invariants O_T.
  , dynamicsInvariants :: d
    -- ^ Dynamics-side invariants D_T.
  , symmetryInvariants :: g
    -- ^ Symmetry-side invariants G_T.
  , representationInvariants :: r
    -- ^ Representation-side invariants R_T.
  }
  deriving (Eq, Show)

-- | DEF-037 — a classifying invariant: for a domain with a completed
-- classification, the invariant whose value determines the object up to the
-- chosen equivalence. The constructors mirror exactly the list of DEF-037;
-- each carries the data named there. Scope limits of the underlying results
-- are cited per constructor; nothing here extends them.
data ClassifyingInvariant
  = ByLieDiagram LieDiagram
    -- ^ Dynkin\/Satake diagram (Killing-Cartan classification, T-BG-02,
    -- complete-informal-proof).
  | ByDominantIntegralWeight WeightData
    -- ^ Dominant integral weight (highest-weight theorem, T-BG-03).
  | ByDimensionVector DimensionVector
    -- ^ Dimension vector of a finite-dimensional C*-algebra (T-BG-06).
  | ByMurrayVonNeumannType MurrayVonNeumannType
    -- ^ Murray-von Neumann type (T-BG-07; amenable factors only).
  | ByConnesInvariants ConnesInvariants
    -- ^ Connes invariants (T-BG-07, T-OP-06).
  | ByClassifyingSpaceMap ClassifyingSpaceMap
    -- ^ Homotopy-class map X -> BG classifying a principal bundle (T-BG-08).
  | ByCharacteristicClasses [CharacteristicClass]
    -- ^ Characteristic classes in H*(BG), pullbacks of universal classes
    -- (T-BG-08).
  | ByFullyDualizableObject FullyDualizableObject
    -- ^ Fully dualizable object (cobordism hypothesis; the 2009 writeup is an
    -- informal proof sketch, so the classification claim is recorded as
    -- CLAIMED with a proof gap, T-OP-05).
  | ByHolonomyGroup HolonomyGroup
    -- ^ Holonomy group (Lorentzian case classified, T-BG-11).
  | ByCausalClass CausalClass
    -- ^ Causal class on the complete causal ladder (T-BG-12).
  | ByHolographicInequalityData HolographicInequalityData
    -- ^ SSA+MMI inequality data for at most 4 regions (T-BG-13).
  | ByFisherMetric FisherMetric
    -- ^ Fisher metric, unique up to constant in the classical case
    -- (Chentsov, T-BG-14).
  | ByMonotoneMetric MonotoneMetric
    -- ^ Quantum monotone metric; the quantum case is parametric
    -- (operator monotone functions, T-BG-18), not a finite list.
  deriving (Eq, Show)

-- | Accessor (DEF-037): the dimension vector, when that is the invariant in
-- force. Stub semantics: projection only; no classification is computed.
dimensionVectorOf :: ClassifyingInvariant -> Maybe DimensionVector
dimensionVectorOf (ByDimensionVector dv) = Just dv
dimensionVectorOf _ = Nothing

-- | Accessor (DEF-037): the Lie diagram, when that is the invariant in force.
lieDiagramOf :: ClassifyingInvariant -> Maybe LieDiagram
lieDiagramOf (ByLieDiagram d) = Just d
lieDiagramOf _ = Nothing

-- | Accessor (DEF-037): the weight data (dominant weight, Casimirs), when that
-- is the invariant in force.
weightDataOf :: ClassifyingInvariant -> Maybe WeightData
weightDataOf (ByDominantIntegralWeight w) = Just w
weightDataOf _ = Nothing

-- | Accessor (DEF-037): the Murray-von Neumann type, when that is the
-- invariant in force.
murrayVonNeumannTypeOf :: ClassifyingInvariant -> Maybe MurrayVonNeumannType
murrayVonNeumannTypeOf (ByMurrayVonNeumannType t) = Just t
murrayVonNeumannTypeOf _ = Nothing

-- | Accessor (DEF-037): the Connes invariants, when that is the invariant in
-- force.
connesInvariantsOf :: ClassifyingInvariant -> Maybe ConnesInvariants
connesInvariantsOf (ByConnesInvariants c) = Just c
connesInvariantsOf _ = Nothing

-- | Accessor (DEF-037): the classifying-space map X -> BG, when that is the
-- invariant in force.
classifyingSpaceMapOf :: ClassifyingInvariant -> Maybe ClassifyingSpaceMap
classifyingSpaceMapOf (ByClassifyingSpaceMap m) = Just m
classifyingSpaceMapOf _ = Nothing

-- | Accessor (DEF-037): the characteristic classes, when those are the
-- invariant in force.
characteristicClassesOf :: ClassifyingInvariant -> Maybe [CharacteristicClass]
characteristicClassesOf (ByCharacteristicClasses cs) = Just cs
characteristicClassesOf _ = Nothing

-- | Accessor (DEF-037): the fully dualizable object, when that is the
-- invariant in force. See the CLAIMED status note on 'ByFullyDualizableObject'.
fullyDualizableObjectOf :: ClassifyingInvariant -> Maybe FullyDualizableObject
fullyDualizableObjectOf (ByFullyDualizableObject o) = Just o
fullyDualizableObjectOf _ = Nothing

-- | Accessor (DEF-037): the holonomy group, when that is the invariant in
-- force.
holonomyGroupOf :: ClassifyingInvariant -> Maybe HolonomyGroup
holonomyGroupOf (ByHolonomyGroup h) = Just h
holonomyGroupOf _ = Nothing

-- | Accessor (DEF-037): the causal class, when that is the invariant in force.
causalClassOf :: ClassifyingInvariant -> Maybe CausalClass
causalClassOf (ByCausalClass c) = Just c
causalClassOf _ = Nothing

-- | Accessor (DEF-037): the holographic inequality data, when that is the
-- invariant in force.
holographicInequalityDataOf
  :: ClassifyingInvariant -> Maybe HolographicInequalityData
holographicInequalityDataOf (ByHolographicInequalityData h) = Just h
holographicInequalityDataOf _ = Nothing

-- | Accessor (DEF-037): the Fisher metric, when that is the invariant in
-- force.
fisherMetricOf :: ClassifyingInvariant -> Maybe FisherMetric
fisherMetricOf (ByFisherMetric f) = Just f
fisherMetricOf _ = Nothing

-- | Accessor (DEF-037): the quantum monotone metric, when that is the
-- invariant in force.
monotoneMetricOf :: ClassifyingInvariant -> Maybe MonotoneMetric
monotoneMetricOf (ByMonotoneMetric m) = Just m
monotoneMetricOf _ = Nothing

-- | DEF-037 — dimension vector of a finite-dimensional complex C*-algebra:
-- the multiset of matrix block sizes in A ~= sum_i M_{n_i}(C). Within its
-- scope the multiset determines A up to *-isomorphism (T-BG-06,
-- complete-informal-proof). Encoding: the block sizes as a list; the
-- multiset, not the order, is the invariant.
newtype DimensionVector = DimensionVector [Int]
  deriving (Eq, Ord, Show)

-- | DEF-037 — Dynkin or Satake diagram data of a (real or complex) semisimple
-- Lie algebra (T-BG-02).
data LieDiagram
  = Dynkin DynkinDiagram
    -- ^ Complex semisimple case: Dynkin diagram.
  | Satake SatakeDiagram
    -- ^ Real simple case: Satake diagram.
  deriving (Eq, Show)

-- | DEF-037 — Dynkin diagrams of complex simple Lie algebras: the A-D series
-- and the five exceptional diagrams (T-BG-02).
data DynkinDiagram
  = ADyn Int
  | BDyn Int
  | CDyn Int
  | DDyn Int
  | G2Dyn
  | F4Dyn
  | E6Dyn
  | E7Dyn
  | E8Dyn
  deriving (Eq, Ord, Show)

-- | DEF-037 — Satake diagram of a real simple Lie algebra. Stub: the diagram
-- itself is left abstract; a volume that needs its data refines this type.
data SatakeDiagram
  deriving (Eq, Show)

-- | DEF-037 — weight data of a finite-dimensional irrep of a complex
-- semisimple Lie algebra: a dominant integral weight, with the Casimir data
-- recorded alongside (T-BG-03). The weight is given in the fundamental-weight
-- basis; semantics are those of the highest-weight theorem.
data WeightData = WeightData
  { dominantIntegralWeight :: [Rational]
    -- ^ Coordinates in the fundamental-weight basis.
  , casimirData :: CasimirData
    -- ^ Casimir data attached to the weight.
  }
  deriving (Eq, Show)

-- | DEF-037 — Casimir data: eigenvalues of the Casimir operators on the
-- representation, recorded in a fixed basis order. Stub semantics: the list is
-- abstract data; no computation of Casimir elements is claimed here.
newtype CasimirData = CasimirData [Rational]
  deriving (Eq, Ord, Show)

-- | DEF-037 — Murray-von Neumann type of a von Neumann algebra factor. The
-- constructors mirror the amenable classification (T-BG-07,
-- complete-informal-proof): types I_n, I_infinity, II_1, II_infinity,
-- III_lambda (0 < lambda <= 1), III_0, III_1. Outside the amenable class a
-- total classification is impossible (T-OB-01).
data MurrayVonNeumannType
  = TypeI Int
    -- ^ Type I_n, n matrix size.
  | TypeIInfinite
    -- ^ Type I_infinity.
  | TypeII1
    -- ^ Type II_1.
  | TypeIIInfinite
    -- ^ Type II_infinity.
  | TypeIIILambda Rational
    -- ^ Type III_lambda with 0 < lambda <= 1.
  | TypeIII0
    -- ^ Type III_0 (ergodic-flow description).
  | TypeIII1
    -- ^ Type III_1.
  deriving (Eq, Show)

-- | DEF-037 — Connes invariants of a factor. Stub: the invariants (Connes
-- spectrum, fundamental group) are left abstract; only coarse strata are
-- available in general (T-OP-06).
data ConnesInvariants
  deriving (Eq, Show)

-- | DEF-037 — classifying-space map [X, BG]: homotopy classes of maps into
-- the classifying space, classifying principal G-bundles; characteristic
-- classes are pullbacks of universal classes (T-BG-08). Stub: the map is left
-- abstract.
data ClassifyingSpaceMap
  deriving (Eq, Show)

-- | DEF-037 / DEF-029 — named characteristic classes in H*(BG): the standard
-- list used to classify principal bundles and their obstructions (T-BG-08).
data CharacteristicClass
  = StiefelWhitney
    -- ^ Stiefel-Whitney classes.
  | Pontryagin
    -- ^ Pontryagin classes.
  | Euler
    -- ^ Euler class.
  | Chern
    -- ^ Chern classes.
  | DixmierDouady
    -- ^ Dixmier-Douady class.
  deriving (Eq, Ord, Show)

-- | DEF-037 — fully dualizable object, the invariant named by the cobordism
-- hypothesis for extended TQFTs. Stub: the object is left abstract. Status
-- note: the classification statement is recorded as CLAIMED with a proof gap
-- (T-OP-05); nothing here treats it as proved.
data FullyDualizableObject
  deriving (Eq, Show)

-- | DEF-037 — holonomy group of a (here: Lorentzian) geometric structure.
-- Stub: the group is left abstract; the connected Lorentzian case is
-- classified (T-BG-11, complete-informal-proof).
data HolonomyGroup
  deriving (Eq, Show)

-- | DEF-037 — causal class of a spacetime: a rung of the causal ladder, which
-- is complete as a classification of causality conditions (T-BG-12).
data CausalClass
  = Chronological
    -- ^ No closed timelike curves.
  | Causal
    -- ^ No closed causal curves.
  | Distinguishing
  -- ^ Distinguishing spacetime.
  | StrongCausality
  | StableCausality
  | GlobalHyperbolicity
  deriving (Eq, Ord, Show, Enum, Bounded)

-- | DEF-037 — SSA+MMI inequality data for the holographic entropy cone in the
-- proven range of at most 4 boundary regions (T-BG-13). For n >= 5 regions the
-- cone is open (T-OP-04); this record does not extend the proven range.
data HolographicInequalityData = HolographicInequalityData
  { regionCount :: Int
    -- ^ Number of boundary regions; the proven range is <= 4.
  , entropyInequalities :: [EntropyInequality]
    -- ^ The inequality kinds in force for this region count.
  }
  deriving (Eq, Show)

-- | Inequality kinds named in the proven SSA+MMI data (T-BG-13).
data EntropyInequality
  = StrongSubadditivity
  | MonogamyOfMutualInformation
  deriving (Eq, Ord, Show)

-- | DEF-037 — Fisher information metric. Stub: the metric is left abstract.
-- In the classical case it is unique up to constant as the metric monotone
-- under stochastic maps (Chentsov, T-BG-14); uniqueness fails in the quantum
-- case.
data FisherMetric
  deriving (Eq, Show)

-- | DEF-037 — quantum monotone metric. Stub: the metric is left abstract. The
-- quantum case is classified parametrically by operator monotone functions
-- (Petz-Sudar, T-BG-18) — a parametric family, not a finite list; the
-- classical uniqueness may not be extended.
data MonotoneMetric
  deriving (Eq, Show)

-- | DEF-037 — entropy hook: an entropy functional supplied by a volume,
-- mapping a state of type s to an entropy value of type e when defined.
-- Hook semantics: Nothing means the volume does not assign an entropy in that
-- case; no value is computed here.
newtype EntropyHook s e = EntropyHook (s -> Maybe e)

-- | Apply an entropy hook (DEF-037). Pure plumbing; no mathematical content.
entropyUnder :: EntropyHook s e -> s -> Maybe e
entropyUnder (EntropyHook f) = f
