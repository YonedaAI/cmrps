{-# LANGUAGE TypeFamilies #-}

-- | Module        : Taxonomy.Families
-- Description     : Object schema of Phys and the ten structural families.
-- Ontology source : docs/ontology.md (DEF-002..DEF-007, DEF-025..DEF-035).
--
-- The typed taxonomy of the CMRPS program (the 'typed Periodic Table').
-- Objects of Phys are tuples P = (X, O, D, S, C) (DEF-002); the ten candidate
-- structural families (DEF-026..DEF-035) are encoded as type classes carrying
-- each family's defining structural data. Family tags exist at the value level
-- as 'StructuralFamily' for mechanical cross-audit against other formal names.
--
-- Claim status (docs/theorem-registry.md): this module encodes vocabulary
-- only. It proves nothing and asserts no formalisation; the definitions are
-- stipulative unless a cited background record says otherwise. Instances for
-- concrete per-volume physical systems are supplied elsewhere, never here.
module Taxonomy.Families
  ( -- * Object schema of Phys (DEF-002)
    PhysicalSystem (..)
  , SystemRecord (..)
    -- * Structural family tags (DEF-025)
  , StructuralFamily (..)
  , familyDefId
    -- * Family I: symplectic and Poisson structures (DEF-026)
  , FamilySymplecticPoisson (..)
    -- * Family II: Hilbert spaces and operator algebras (DEF-027)
  , FamilyHilbertOperatorAlgebras (..)
    -- * Family III: smooth manifolds and geometric structures (DEF-028)
  , FamilySmoothGeometric (..)
    -- * Family IV: principal bundles and connections (DEF-029)
  , FamilyPrincipalBundlesConnections (..)
    -- * Family V: probability and measure-theoretic structures (DEF-030)
  , FamilyProbabilityMeasure (..)
    -- * Family VI: topological and higher-categorical structures (DEF-031)
  , FamilyTopologicalHigherCategorical (..)
    -- * Family VII: dynamical systems and operator semigroups (DEF-032)
  , FamilyDynamicalSemigroups (..)
    -- * Family VIII: tensor categories and compositional structures (DEF-033)
  , FamilyTensorCategoriesComposition (..)
    -- * Family IX: discrete combinatorial structures (DEF-034)
  , FamilyDiscreteCombinatorial (..)
    -- * Family X: derived and homotopical structures (DEF-035)
  , FamilyDerivedHomotopical (..)
  ) where

-- | DEF-002 — an object of Phys is a tuple P = (X, O, D, S, C): a state space,
-- an observable algebra or collection, dynamical laws, symmetry and constraint
-- data, and composition\/interaction rules. The five components need not be
-- independent; the schema is a candidate definition, not a theorem (DEF-002,
-- status stipulative).
class PhysicalSystem p where
  -- | DEF-003 — the state space or geometric structure X of P. Instances in
  -- the founding text range over symplectic manifolds, Hilbert spaces,
  -- probability spaces, smooth manifolds, and lattice configurations.
  type StateSpace p
  stateSpace :: p -> StateSpace p

  -- | DEF-004 — the algebra or collection of observables O of P.
  type Observables p
  observables :: p -> Observables p

  -- | DEF-005 — the dynamical laws D of P: Hamiltonian or vector-field data,
  -- operator semigroups, flows, or evolution functors.
  type Dynamics p
  dynamics :: p -> Dynamics p

  -- | DEF-006 — the symmetry and constraint data S of P: group or groupoid
  -- actions, gauge constraints, constraint surfaces.
  type Symmetries p
  symmetries :: p -> Symmetries p

  -- | DEF-007 — the composition and interaction rules C of P: tensor products,
  -- coupling terms, interfacing rules. C fixes the meaning of irreducibility
  -- (DEF-021).
  type Composition p
  composition :: p -> Composition p

-- | DEF-002 — the coordinate record form of P = (X, O, D, S, C): the same five
-- components as fields, for systems whose components are given as plain data.
-- This is a generic record instance of the schema, not a claim that any
-- particular physical system is fully captured by it.
data SystemRecord x o d s c = SystemRecord
  { stateSpaceData :: x
    -- ^ DEF-003 — state space X.
  , observablesData :: o
    -- ^ DEF-004 — observables O.
  , dynamicsData :: d
    -- ^ DEF-005 — dynamics D.
  , symmetriesData :: s
    -- ^ DEF-006 — symmetries and constraints S.
  , compositionData :: c
    -- ^ DEF-007 — composition and interaction rules C.
  }
  deriving (Eq, Show)

instance PhysicalSystem (SystemRecord x o d s c) where
  type StateSpace (SystemRecord x o d s c) = x
  type Observables (SystemRecord x o d s c) = o
  type Dynamics (SystemRecord x o d s c) = d
  type Symmetries (SystemRecord x o d s c) = s
  type Composition (SystemRecord x o d s c) = c
  stateSpace = stateSpaceData
  observables = observablesData
  dynamics = dynamicsData
  symmetries = symmetriesData
  composition = compositionData

-- | DEF-025 — value-level tags for the ten candidate structural families.
-- The families are full subcategories of Phys singled out by their underlying
-- mathematical structure; they are candidate organising families, not a
-- completed classification, and some may later be unified (DEF-025).
data StructuralFamily
  = FamilyI
    -- ^ DEF-026 — symplectic and Poisson structures.
  | FamilyII
    -- ^ DEF-027 — Hilbert spaces and operator algebras.
  | FamilyIII
    -- ^ DEF-028 — smooth manifolds and geometric structures.
  | FamilyIV
    -- ^ DEF-029 — principal bundles and connections.
  | FamilyV
    -- ^ DEF-030 — probability and measure-theoretic structures.
  | FamilyVI
    -- ^ DEF-031 — topological and higher-categorical structures.
  | FamilyVII
    -- ^ DEF-032 — dynamical systems and operator semigroups.
  | FamilyVIII
    -- ^ DEF-033 — tensor categories and compositional structures.
  | FamilyIX
    -- ^ DEF-034 — discrete combinatorial structures.
  | FamilyX
    -- ^ DEF-035 — derived and homotopical structures.
  deriving (Eq, Ord, Show, Enum, Bounded)

-- | The ontology identifier of each family, for mechanical cross-audit against
-- names used in other formal layers. Pure metadata; no mathematical claim.
familyDefId :: StructuralFamily -> String
familyDefId FamilyI = "DEF-026"
familyDefId FamilyII = "DEF-027"
familyDefId FamilyIII = "DEF-028"
familyDefId FamilyIV = "DEF-029"
familyDefId FamilyV = "DEF-030"
familyDefId FamilyVI = "DEF-031"
familyDefId FamilyVII = "DEF-032"
familyDefId FamilyVIII = "DEF-033"
familyDefId FamilyIX = "DEF-034"
familyDefId FamilyX = "DEF-035"

-- | DEF-026 — Family I: symplectic and Poisson structures. Representative
-- systems: classical mechanics. Local classification is trivial (Darboux
-- normal form: no local invariants); global content is topological. Poisson
-- data includes Weinstein splitting (symplectic x transverse), the
-- symplectic-leaf foliation, and coadjoint orbits for KKS leaves. The link to
-- Family II via deformation quantization is conjectural (DEF-026).
class FamilySymplecticPoisson p where
  -- | The symplectic or Poisson structural data of the system (symplectic
  -- form, Poisson bivector, leaf data). Abstract here; volumes fix the type.
  type SymplecticPoissonData p
  symplecticPoissonData :: p -> SymplecticPoissonData p

-- | DEF-027 — Family II: Hilbert spaces and operator algebras. Representative
-- systems: quantum mechanics. Finite-dimensional C*-algebras are classified by
-- dimension vector; amenable factors are classified; a general classification
-- of II_1\/III factors is impossible in the stated generality (T-OB-01).
class FamilyHilbertOperatorAlgebras p where
  -- | The Hilbert-space or operator-algebra structural data of the system
  -- (Hilbert space, C*- or von Neumann algebra, channel data). Abstract here.
  type OperatorAlgebraData p
  operatorAlgebraData :: p -> OperatorAlgebraData p

-- | DEF-028 — Family III: smooth manifolds and geometric structures.
-- Representative systems: relativity. Proven in restricted regimes (Lorentzian
-- holonomy, complete causal ladder, 8 Thurston geometries in dimension 3);
-- dimension 4 contains algorithmically unrecognizable instances (T-OB-05).
class FamilySmoothGeometric p where
  -- | The smooth or geometric structural data of the system (manifold,
  -- metric, connection-independent geometry). Abstract here.
  type GeometricData p
  geometricData :: p -> GeometricData p

-- | DEF-029 — Family IV: principal bundles and connections. Representative
-- systems: gauge theories. Bundles are classified by maps into BG and
-- characteristic classes; anomalies are classified as cohomological
-- obstructions. See Taxonomy.Invariants for the classifying data.
class FamilyPrincipalBundlesConnections p where
  -- | The principal-bundle and connection data of the system (bundle,
  -- structure group, connection, gauge data). Abstract here.
  type BundleConnectionData p
  bundleConnectionData :: p -> BundleConnectionData p

-- | DEF-030 — Family V: probability and measure-theoretic structures.
-- Representative systems: statistical physics. The Fisher metric is uniquely
-- monotone under stochastic maps in the classical case (Chentsov, T-BG-14);
-- quantum monotone metrics form a parametric family, not a finite list
-- (T-BG-18). Uniqueness does not extend to the quantum case.
class FamilyProbabilityMeasure p where
  -- | The probability or measure-theoretic data of the system (state space of
  -- measures, monotone metrics). Abstract here.
  type ProbabilityMeasureData p
  probabilityMeasureData :: p -> ProbabilityMeasureData p

-- | DEF-031 — Family VI: topological and higher-categorical structures.
-- Representative systems: TQFTs. Functorial TQFT is tractable under the Atiyah
-- axioms; the cobordism-hypothesis classification of extended TQFTs is
-- recorded as CLAIMED with a proof gap (T-OP-05), not as a completed theorem.
class FamilyTopologicalHigherCategorical p where
  -- | The topological or higher-categorical data of the system (cobordism
  -- datum, extended-TQFT structure). Abstract here.
  type HigherCategoricalData p
  higherCategoricalData :: p -> HigherCategoricalData p

-- | DEF-032 — Family VII: dynamical systems and operator semigroups.
-- Representative systems: dissipative and open systems. Stinespring gives a
-- minimal dilation of completely positive maps (a normal form, not an
-- isomorphism classification, T-BG-15); no classification theorem for the
-- family is on record.
class FamilyDynamicalSemigroups p where
  -- | The dynamical-semigroup data of the system (generator, semigroup,
  -- dilation data). Abstract here.
  type DynamicalSemigroupData p
  dynamicalSemigroupData :: p -> DynamicalSemigroupData p

-- | DEF-033 — Family VIII: tensor categories and compositional structures.
-- Representative systems: quantum information. Established islands (DR
-- reconstruction, Deligne's theorem) but open in general (fusion categories,
-- T-OP-01). The symmetric layer is load-bearing: tensor equivalence without
-- it cannot recover the group (DEF-018, T-OB-02).
class FamilyTensorCategoriesComposition p where
  -- | The tensor-category or compositional data of the system (tensor
  -- category, conjugates, pivotal structure). Abstract here.
  type TensorCategoryData p
  tensorCategoryData :: p -> TensorCategoryData p

-- | DEF-034 — Family IX: discrete combinatorial structures. Representative
-- systems: lattice and network models. Lattice theorems hold only in
-- restricted regimes; wild sectors forbid finite-variety parameterization
-- (T-OB-04) and sit beyond an algorithmic tractability boundary (T-OB-07).
class FamilyDiscreteCombinatorial p where
  -- | The lattice or combinatorial data of the system (graph, lattice,
  -- network, tame/wild class). Abstract here.
  type CombinatorialData p
  combinatorialData :: p -> CombinatorialData p

-- | DEF-035 — Family X: derived and homotopical structures. Representative
-- systems: higher gauge and derived field theories. Every finite-dimensional
-- algebra over an algebraically closed field is derived-tame or derived-wild,
-- wildness degeneration-robust (T-OB-04); no classification beyond that
-- dichotomy is claimed.
class FamilyDerivedHomotopical p where
  -- | The derived or homotopical data of the system (derived category,
  -- homotopical enhancement, derived-tame/wild class). Abstract here.
  type DerivedHomotopicalData p
  derivedHomotopicalData :: p -> DerivedHomotopicalData p
