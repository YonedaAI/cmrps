# Claim status: vol-06-quantum-systems

Verification artifact for `papers/latex/vol-06-quantum-systems.tex` and
`verification/vol-06-quantum-systems-lean-targets.md`. Module:
`lean/Cmrps/Vol06QuantumSystems.lean`, namespace `Cmrps.Vol06`.

Status labels: `machine-checked` (elaborated and proved in the
module with no `sorry`; promoted to `machine-checked` only when the assembler's
`lake build` exits 0), `complete-informal-proof` (established result with proof
in the paper or the cited source, not formalized), `conditional` (depends on
unproved conjectures), `conjecture`, `computational-evidence`, `open-problem`.

Model-scope note. The module formalizes the block-size combinatorics of the
finite-dimensional theory (dimension vectors as `List ℕ` up to `List.Perm`), the
vector-space dimension of block algebras, and the entrywise trace-preserving half
of the Choi correspondence. The C*-algebraic lifting (Jacobson radical,
Artin-Wedderburn, *-isomorphism) is NOT formalized; statements about actual
C*-algebras keep their informal status and are listed as conjectures `C-*` for a
future development.

## A. Claims formalized in the module

| Name | Statement (one line) | Status |
|---|---|---|
| `DimensionVector` (def) | A dimension vector is a multiset of block sizes, represented as `List ℕ` up to `List.Perm` (Definition 2.4) | machine-checked |
| `ValidDimvec` (def) | A dimension vector is valid when every block size is positive (Definition 2.4) | machine-checked |
| `algebraDim` (def) | `algebraDim l = Σ n²` over the block sizes of `l` (Corollary 3.2, `dim A = Σ n_i²`) | machine-checked |
| `tensorDimvec` (def) | Dimension vector of a tensor product is the multiset of pairwise products of block sizes (Proposition 3.11) | machine-checked |
| `sum_map_product` | Sum over a product list splits as the product of the sums | machine-checked |
| `algebraDim_tensor` | `algebraDim (tensorDimvec l₁ l₂) = algebraDim l₁ * algebraDim l₂` (Proposition 3.11, `dim(A ⊗ B) = dim A · dim B`) | machine-checked |
| `tensorDimvec_perm` | `tensorDimvec` is permutation-invariant in both arguments (Proposition 3.11, multiset form) | machine-checked |
| `tensorDimvec_valid` | Validity of block sizes passes to tensor products | machine-checked |
| `dimvec_classifies_sorted` | Two sorted dimension vectors are permutation-equivalent iff they are equal, i.e. the multiset is complete data up to order (Theorem 3.1 / Corollary 3.2, combinatorial content) | machine-checked |
| `dim4_vector_dimension_not_classifying` | `[2]` and `[1,1,1,1]` have equal `algebraDim` but are not permutation-equivalent, so vector-space dimension is not a classifying invariant (Example 3.4) | machine-checked |
| `dimVecs`, `dimVectorsOfDim` (defs) | Enumeration of all dimension vectors of complex dimension `d` (Corollary 3.6, Table 2) | machine-checked |
| `algebraDim_eq_of_mem_dimVecs` | Every enumerated vector has algebra dimension `d` (Corollary 3.6, soundness) | machine-checked |
| `algebraDim_eq_of_mem_dimVectorsOfDim` | Same, specialized to `dimVectorsOfDim` | machine-checked |
| `dimVectorsOfDim_four` | `dimVectorsOfDim 4 = [[1,1,1,1],[2]]` (Table 2, `d = 4`) | machine-checked |
| `dimVectorsOfDim_eight` | `dimVectorsOfDim 8 = [[1^8],[2,1,1,1,1],[2,2]]` (Table 2, `d = 8`) | machine-checked |
| `dimVectorsOfDim_twelve` | `dimVectorsOfDim 12 = [[1^12],[2,1^8],[2,2,1^4],[2,2,2],[3,1,1,1]]` (Table 2, `d = 12`) | machine-checked |
| `BlockAlgebra` (def) | The block algebra of sizes `s : Fin k → ℕ` is the product of matrix spaces `Matrix (Fin (s i)) (Fin (s i)) ℂ` (Definition 2.3, Theorem 3.1 block form) | machine-checked |
| `finrank_blockAlgebra` | `finrank ℂ (BlockAlgebra s) = Σ (s i)²` (Corollary 3.2, `dim A = Σ n_i²`) | machine-checked |
| `algebraDim_ofFn` | `algebraDim (List.ofFn s) = Σ (s i)²` (bridge, list form to family form) | machine-checked |
| `algebraDim_eq_finrank_ofFn` | List combinatorics agrees with the vector-space dimension of the block algebra | machine-checked |
| `matrixUnit` (def) | Matrix unit `E_{ij}` of `M_n(ℂ)` (Lemma 6.1 setup) | machine-checked |
| `choi` (def) | Choi matrix `J(Φ)_{(i,a),(j,b)} = Φ(E_{ij})_{a b}`, i.e. `Σ E_ij ⊗ Φ(E_ij)` (Lemma 6.1) | machine-checked |
| `partialTrace₂` (def) | Partial trace over the second tensor factor (Lemma 6.1, `Tr_m`) | machine-checked |
| `trace_eq_sum_apply` | `Matrix.trace A = Σ_i A i i` | machine-checked |
| `partialTrace₂_choi_apply` | `(Tr_m J(Φ))_{ij} = Tr(Φ(E_{ij}))` | machine-checked |
| `choi_tracePreserving` | `Tr_m J(Φ) = I_n` iff `Tr(Φ(E_{ij})) = δ_{ij}` (Lemma 6.1, trace-preserving equivalence, entrywise form) | machine-checked |
| `choi_id` | The Choi matrix of the identity map has entries `δ_{ai} δ_{bj}` (sanity check) | machine-checked |

## B. Mechanization targets (`verification/vol-06-quantum-systems-lean-targets.md`)

| Target | Statement (one line) | Coverage in the module | Status |
|---|---|---|---|
| `finite_dim_cstar_decomposition` | Every finite-dimensional complex C*-algebra is *-isomorphic to a finite direct sum of full matrix algebras (Thm 3.1) | Model-level only: `BlockAlgebra`, `finrank_blockAlgebra`; no C*-algebra or *-isomorphism development | complete-informal-proof (paper, Thm 3.1 proof; see C-1) |
| `finite_dim_cstar_dimensionVector_classifies` | Two finite-dimensional complex C*-algebras are *-isomorphic exactly when their dimension vectors agree as multisets (Thm 3.1, Cor 3.2) | Combinatorial half machine-checked: `dimvec_classifies_sorted`, `algebraDim_*`, `dim4_vector_dimension_not_classifying`; the *-isomorphism lifting is not | complete-informal-proof (paper; combinatorial content machine-checked; see C-2) |
| `findim_unique_decomposition` | Decompositions into irreducible direct summands exist and are unique up to order and unitary equivalence (Prop 3.10) | Up-to-order uniqueness of presentations machine-checked (`dimvec_classifies_sorted`); ideal-theoretic existence/uniqueness and unitary equivalence not | complete-informal-proof (paper; see C-3) |
| `choi_kraus_normal_form` | Φ is CP iff J(Φ) ≥ 0, and CP maps are sums of conjugations with minimal count the Choi rank (Lem 6.1, Thm 6.4) | Trace-preserving half of Lemma 6.1 machine-checked (`choi_tracePreserving`); CP half and Kraus normal form not | complete-informal-proof (paper; see C-4, C-5) |
| `stinespring_minimal_dilation_unique` | Every channel has a dilation, minimal dilations are unique up to unitary, minimal environment dimension equals the Kraus rank (Thm 6.6) | Not formalized | complete-informal-proof (paper; see C-6) |
| `kraus_rank_normal_form` | Kraus rank is preserved by unitary changes of presentation and is not a complete invariant of channels (Prop 6.8) | Not formalized (the negative half is witnessed by the executable model only) | complete-informal-proof (paper; see C-7) |
| `mcduff_uncountable_II1` | There exist uncountably many pairwise non-isomorphic separable type II_1 factors (Thm 5.1) | Not formalized (no von Neumann algebra development) | complete-informal-proof (McDuff 1969, cited; see C-8) |
| `dr_reconstruction` | Symmetric tensor *-category with conjugates, direct sums, subobjects, scalar endomorphisms of the unit = representations of a compact supergroup, unique up to isomorphism (Thm 7.2) | Not formalized (no tensor category development) | complete-informal-proof (Doplicher-Roberts 1989/1990, cited; see C-9) |
| `deligne_symmetric_tensor` | C-linear abelian rigid symmetric tensor category of subexponential growth in char. 0 = representations of an affine supergroup scheme (Thm 7.5) | Not formalized (no tensor category development) | complete-informal-proof (Deligne 2002, cited; see C-10) |
| `petz_monotone_metrics` | Monotone metrics on density matrices correspond bijectively to operator monotone functions with `f(t) = t f(1/t)`, `f(1) = 1` (Thm 8.3) | Not formalized (no operator-monotone development) | complete-informal-proof (Petz 1996, Petz-Sudar 1999, cited; see C-11) |

## C. Remaining paper claims not formalized here

| Name | Statement (one line) | Status |
|---|---|---|
| Corollary 3.2 (dimension counting, full) | `*`-iso classes of finite-dimensional C*-algebras of dim `d` ↔ partitions of `d` into perfect squares | complete-informal-proof (paper; enumeration of rows `d = 4, 8, 12` machine-checked) |
| Proposition 3.8 (states of a block algebra) | States are tuples of positive matrices of trace sum one; pure states are vector states of single blocks | complete-informal-proof (paper) |
| Proposition 3.9 (automorphisms of block algebras) | Every `*`-automorphism is blockwise inner composed with a permutation of equal-size blocks | complete-informal-proof (paper) |
| Theorem 4.3 (central decomposition) | Every von Neumann algebra is a direct integral of factors, unique up to measure-class isomorphism | complete-informal-proof (Murray-von Neumann, cited) |
| Theorem 4.4 (amenable factors) | Amenable factors are classified by Murray-von Neumann type and Connes invariants | complete-informal-proof (Murray-von Neumann, Connes, Haagerup, cited) |
| Corollary 5.2 (no finite list of factor types) | No finite or countable list of factor types exhausts the separable II_1 factors | complete-informal-proof (from McDuff 1969) |
| Proposition 6.10 (composition of channels) | The Choi matrix of a composite is the link product of the Choi matrices of the factors | complete-informal-proof (paper) |
| Proposition 7.6 (Etingof-Gelaki) | Non-isomorphic finite groups with monoidally equivalent representation categories exist; the symmetric layer is load-bearing | complete-informal-proof (Etingof-Gelaki, cited) |
| Corollary 8.4 (parametricity) | Quantum monotone metrics are classified by a continuous parameter; no Chentsov uniqueness | complete-informal-proof (from Petz) |
| Computational rows (Table 3, Appendix A) | Finite-dimensional and channel checks of the three experiment scripts in `src/vol-06-quantum-systems/` | computational-evidence |
| Five open problems (Section 9) | Elliott program; fusion-category structure conjectures; non-amenable type III strata; channel isomorphism; rigidity-restricted II_1 classification | open-problem (see C-13..C-17) |
| Fusion-category claims (Remark 7.8) | Weak Hopf presentation; coherent double-dual conjectures | conditional (on Etingof-Nikshych-Ostrik conjectures; see C-18) |
