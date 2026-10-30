# Claim ledger: vol-03-irreducibility-decomposition

**Paper:** `papers/latex/vol-03-irreducibility-decomposition.tex`
**Volume:** Irreducibility, Decomposition, and Universal Constructions (CMRPS Part 3)
**Date:** 2026-10-30
**Role of this file:** verification artifact. The status labels below do not appear in the
`.tex` prose; the paper carries only ordinary mathematical phrasing.

**Status vocabulary** (exactly six, `docs/theorem-registry.md` §1):
`machine-checked` | `complete-informal-proof` | `conditional` | `conjecture` | `computational-evidence` | `open-problem`.

**Nothing in this paper is machine-checked.** All Lean module fields are em dashes. The
Haskell and Python under `src/vol-03-irreducibility-decomposition/` is computational evidence only.

## Definitions

| # | Label | Statement (one line) | Status | Used in |
|---|---|---|---|---|
| 2.1 | `def:system` | Physical system is a tuple (X, O, D, S, C) of state space, observables, dynamics, symmetry data, composition rules | stipulative | Sections 2, 3, 12 |
| 2.2 | `def:irreducible` | Irreducible relative to a composition operation means no nontrivial binary decomposition under it; class J_ast | stipulative | Sections 2, 3, 8, 9 |
| 2.3 | `def:decomposition` | Decomposition is P = F(I_1,...,I_n) with F an admissible construction and the I_i irreducible; unique up to permutation of isomorphic factors | stipulative; uniqueness open in general | Sections 2, 5 |
| 2.4 | `def:constructions` | Admissible constructions: tensor product, direct sum, extension, limits and colimits, factorization, quotient | stipulative | Sections 2, 8, 9 |
| 2.5 | `def:closure` | Closure of a family collection under the constructions is the smallest class containing it and closed under them | stipulative | Section 8 |
| 2.6 | `def:dim-vector` | Dimension vector of a decomposed algebra is the multiset of matrix block sizes | stipulative | Sections 3, 4, 8 |
| 2.7 | `def:state` | A state is a positive normalized linear functional on a unital C*-algebra | stipulative | Section 3.3 |
| 4.1 | `def:multiplicity-matrix` | Multiplicity matrix R = (r_i^j) with rank matrix k_i^j = n_i r_i^j and column sums k = m_j | stipulative | Sections 4, 9 |

## Results proved in this paper

| # | Label | Statement (one line) | Status | Used in |
|---|---|---|---|---|
| 3.1 | `lem:radical` | The Jacobson radical of a finite-dimensional C*-algebra is zero | complete-informal-proof | Theorem 3.3 |
| 3.2 | `lem:simple-blocks` | A finite-dimensional simple C*-algebra is a matrix algebra M_n(C) | complete-informal-proof | Theorem 3.3 |
| 3.3 | `thm:block-decomposition` | A unital finite-dimensional complex C*-algebra is a direct sum of matrix blocks; the dimension vector is unique up to permutation and k = dim Z(A) | complete-informal-proof | Sections 3-5, 8-12 |
| 3.4 | `cor:classification` | Dimension vector equality is equivalent to *-isomorphism for the class | complete-informal-proof | Sections 4, 11, 12 |
| 3.5 | `rem:krull-schmidt` | The category has unique decomposition in the Krull-Schmidt sense; tensor factorization does not inherit it | complete-informal-proof | Section 3.1 |
| 3.7 | `prop:states-direct-sum` | States of a direct sum are convex combinations of normalized block states with weights omega(p_i); S(A) is the convex join | complete-informal-proof | Worked example (Section 8) |
| 4.2 | `thm:homs` | Unital *-homomorphisms up to unitary conjugacy correspond bijectively to multiplicity matrices | complete-informal-proof | Corollary 4.3, Sections 9, 12 |
| 4.3 | `cor:outer-aut` | Aut(A)/Inn(A) is the permutation group of blocks with equal size | complete-informal-proof | Worked example (Section 8) |
| 4.5 | `prop:module-factorization` | Modules over a decomposed algebra split uniquely into block summands with multiplicities r_i = dim(p_i M)/n_i | complete-informal-proof | Section 4 |
| 5.1 | `prop:unique-restricted` | Uniqueness of decomposition holds in four restricted classes (blocks, homomorphisms, prime-dimensional tensor factorizations, bipartite Schmidt) | complete-informal-proof | Sections 5, 12 |
| 5.2 | `prop:ensemble` | Every mixed density operator admits infinitely many pure-state decompositions; pure states are the exceptions | complete-informal-proof | Section 5 |
| 6.2 | `thm:kraus` | Kraus normal form with minimal count equal to Choi rank; minimal families unique up to unitary mixing | complete-informal-proof | Sections 6, 12 |
| 8.1 | `prop:construction-arithmetic` | Dimension vectors add by multiset union and multiply by pairwise product; a direct sum is irreducible exactly when one summand is simple | complete-informal-proof | Section 8, code evidence |
| 8.2 | `cor:closure` | Closure of finitely many blocks under direct sum and tensor has entries in the multiplicative semigroup of the sizes | complete-informal-proof | Section 8, code evidence |
| 9.1 | `prop:embeddings` | A unital *-homomorphism is injective exactly when its multiplicity matrix has no zero row | complete-informal-proof | Section 9 |
| 9.2 | `prop:spectrum-sum` | The spectrum of a direct sum is the disjoint union of spectra | complete-informal-proof | Section 9 |
| 11.3 | `cor:boundary` | Decomposition programs with finite-dimensional parameterization of irreducibles are confined to tame regimes | complete-informal-proof (from the wildness theorems) | Sections 11, 12 |

## Results cited from the literature

Each is stated with the scope its source establishes. None is machine-checked inside this program.

| # | Label | Statement (one line) | Status | Source |
|---|---|---|---|---|
| 3.6 | `thm:mvn-central` | Von Neumann algebras decompose as direct integrals of factors, essentially unique up to measure class | complete-informal-proof (contrast; no factor classification used) | `murray-vonneumann` |
| 3.8 | `thm:mcduff` | Uncountably many pairwise non-isomorphic separable type II_1 factors exist | complete-informal-proof (obstruction content) | `mcduff` |
| 6.1 | `thm:stinespring` | Completely positive maps admit a minimal Stinespring dilation, unique up to unitary intertwiner | complete-informal-proof (GNS construction given) | `stinespring` |
| 7.1 | `thm:gelfand-naimark` | Every C*-algebra embeds in B(H); commutative unital C*-algebras are C(X) for their character space | complete-informal-proof (reconstruction, not classification) | `gelfand-naimark` |
| 7.2 | `thm:dr-reconstruction` | Symmetric tensor *-categories with conjugates, sums, subobjects, End(1)=C under the DHR criteria are representations of a compact supergroup, unique up to isomorphism | conditional (on the DHR hypotheses; unique clause fails when they are relaxed) | `dhr`, `dr-duality`, `dr-endomorphisms`, `muger` |
| 11.1 | `thm:tame-wild` | Every finite-dimensional algebra over an algebraically closed field is derived tame or derived wild | complete-informal-proof | `bekkert-drozd` |
| 11.2 | `thm:wild-generic-det` | The Cohen-Macaulay modules of the generic determinant are wild; rank-2 classes admit no finite-dimensional parameterization | complete-informal-proof | `buchweitz-leuschke` |
| 11.4 | `thm:grochow-qiao` | Group isomorphism for tame extensions is polynomial time; the bounds fail in the wild case | complete-informal-proof (algorithmic boundary) | `grochow-qiao` |
| 11.5 | `thm:grevstad-may` | No meaningful classification of compact C_p-equivariant HF_p-modules at odd primes | complete-informal-proof (parallel obstruction) | `grevstad-may` |

## Conjectural and open items

| # | Label | Statement (one line) | Status | Used in |
|---|---|---|---|---|
| 8.3 | `rem:generation` | Structural generation: every admissible system is F(I_1,...,I_n) with I_i irreducible; proved only for the finite-dimensional C*-regime | conjecture (DEF-040 identity open in general) | Sections 8, 12 |
| 5.3 | `rem:interacting` | Unique decomposition of interacting systems outside restricted subclasses | open-problem (existence-and-uniqueness only in restricted subclasses) | Sections 5, 11, 12 |
| 6.3 | `rem:prohibition` | Kraus rank is an invariant of the normal form, not an isomorphism invariant of channels | open-problem (no channel isomorphism classification on record) | Sections 6, 12 |
| 13 | `sec:computation` | Closure enumeration (1085 vectors), multiplicity counts (2, 1, 6), Choi-rank stability | computational-evidence | Section 13, code evidence appendix |

## Code evidence cross-audit

The Haskell module `src/vol-03-irreducibility-decomposition/Instances.hs` and the Python
experiments `exp_closure.py`, `exp_multiplicity.py`, `exp_kraus.py` implement the hooks and
enumerations named in the appendix table of the paper. They are computational evidence,
validated against the statements above by cross-audit. They are NOT verified by Lean or by
any proof assistant.
