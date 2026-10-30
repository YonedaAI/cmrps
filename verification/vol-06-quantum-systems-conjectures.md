# Conjectures and unformalized statements: vol-06-quantum-systems

Statements the module `lean/Cmrps/Vol06QuantumSystems.lean` does NOT prove,
recorded as text. Numbered `C-<n>`. "Literature theorem" means the statement is
proved in the paper or the cited source but has no Lean development here;
"open-problem" means the literature itself leaves it open. Nothing in this file
is machine-checked.

## A. Targets of `verification/vol-06-quantum-systems-lean-targets.md` not machine-checked

**C-1** (`finite_dim_cstar_decomposition`, Thm 3.1). Every finite-dimensional
complex C*-algebra is *-isomorphic to a finite direct sum of full matrix
algebras `M_{n_1}(ℂ) ⊕ ⋯ ⊕ M_{n_k}(ℂ)`. (Literature theorem: paper proof via
`J(A) = 0` and Artin-Wedderburn. Only the block-size combinatorics and
`dim A = Σ n_i²` are machine-checked; the C*-algebraic lifting needs a
Jacobson-radical/semisimplicity development not present here.)

**C-2** (`finite_dim_cstar_dimensionVector_classifies`, Thm 3.1 + Cor 3.2). Two
finite-dimensional complex C*-algebras are *-isomorphic if and only if their
dimension vectors agree as multisets. (Literature theorem. The combinatorial
half — sorted presentations equal iff permutation-equivalent — is
machine-checked as `dimvec_classifies_sorted`; the passage from multiset
equality to `*`-isomorphism of algebras is unformalized.)

**C-3** (`findim_unique_decomposition`, Prop 3.10). Decompositions of a
finite-dimensional C*-algebra into irreducible direct summands exist and are
unique up to order and unitary equivalence. (Literature theorem. Up-to-order
uniqueness of block presentations is machine-checked; the ideal-theoretic
statement and unitary equivalence are unformalized.)

**C-4** (Lemma 6.1, complete-positivity half). A linear map
`Φ : M_n(ℂ) → M_m(ℂ)` is completely positive if and only if its Choi matrix
`J(Φ) = Σ_{ij} E_{ij} ⊗ Φ(E_{ij})` is positive semidefinite. (Literature
theorem. Only the trace-preserving equivalence `Tr_m J(Φ) = I_n` is
machine-checked, as `choi_tracePreserving`.)

**C-5** (`choi_kraus_normal_form`, Thm 6.4). `Φ` is completely positive if and
only if `Φ(X) = Σ_{i=1}^r A_i X A_i^*` for some `A_i ∈ M_{m×n}(ℂ)`, and the
minimal such `r` equals the rank of `J(Φ)`. (Literature theorem, paper proof.)

**C-6** (`stinespring_minimal_dilation_unique`, Thm 6.6). Every channel
`Φ : M_n(ℂ) → M_m(ℂ)` admits a Stinespring dilation `(K, V)`; minimal dilations
exist, any two are related by a unitary `U : K → K'` with `(I_m ⊗ U) V = V'`,
and `dim K` of a minimal dilation equals the Kraus rank of `Φ`. (Literature
theorem, paper proof in the matrix case.)

**C-7** (`kraus_rank_normal_form`, Prop 6.8). The Kraus rank of a channel equals
its Choi rank, equals the minimal number of Kraus operators, equals the minimal
environment dimension; it is preserved by unitary changes of Kraus presentation
and by unitary conjugations of domain and codomain; and it is not a complete
invariant of channels (equal Kraus rank does not imply unitary equivalence).
(Literature theorem, paper proof; the negative half is also witnessed
computationally in `src/vol-06-quantum-systems/stinespring_kraus_rank.py`.)

**C-8** (`mcduff_uncountable_II1`, Thm 5.1). There exist uncountably many
pairwise non-isomorphic separable type II_1 factors. (Literature theorem:
McDuff 1969, cited in the paper. Requires a von Neumann algebra development.)

**C-9** (`dr_reconstruction`, Thm 7.2). A symmetric tensor *-category with
conjugates, direct sums, subobjects, and `End(1) = ℂ` is equivalent to the
category of finite-dimensional unitary representations of a compact supergroup,
unique up to isomorphism. (Literature theorem: Doplicher-Roberts 1989/1990,
cited. Requires a tensor-category development.)

**C-10** (`deligne_symmetric_tensor`, Thm 7.5). A C-linear, abelian, rigid
symmetric tensor category of subexponential growth in characteristic zero with
`End(1) = ℂ` is equivalent to the representation category of an affine
supergroup scheme. (Literature theorem: Deligne 2002, cited.)

**C-11** (`petz_monotone_metrics`, Thm 8.3). Monotone metrics on the manifold
`D_n` of strictly positive density matrices are in bijection with operator
monotone functions `f : (0,∞) → (0,∞)` with `f(t) = t f(1/t)` and `f(1) = 1`;
distinct normalized functions give distinct metrics. (Literature theorem: Petz
1996, Petz-Sudar 1999, cited.)

## B. Further paper statements not machine-checked

**C-12** (Prop 3.8). States of `A = ⨁ M_{n_i}(ℂ)` are exactly the tuples of
positive matrices `σ_i` with `Σ Tr σ_i = 1`, and the pure states are the vector
states of single blocks. (Literature theorem, paper proof.)

**C-13** (Prop 3.9). Every `*`-automorphism of a block algebra is the
composition of a blockwise inner automorphism and a permutation of blocks of
equal size. (Literature theorem, paper proof.)

**C-14** (Prop 6.10). The Choi matrix of a composite `Ψ ∘ Φ` is the link
product of `J(Φ)` and `J(Ψ)` contracted along the shared subsystem.
(Literature theorem, paper proof.)

**C-15** (Prop 7.6, Etingof-Gelaki). There exist finite non-isomorphic groups
`G_1`, `G_2` whose representation categories over `ℂ` are equivalent as tensor
categories but not as symmetric tensor categories, so an equivalence forgetting
the symmetric layer cannot recover the group. (Literature theorem: Etingof-
Gelaki, arXiv:math/0007196, cited.)

## C. Open problems (paper Section 9)

**C-16**. The Elliott program for separable simple nuclear C*-algebras lacks a
finished classification statement with its universal coefficient theorem
resolved. (open-problem)

**C-17**. The structural conjectures for fusion categories, beginning with the
existence of a coherent monoidal isomorphism `A ≅ A**` for every fusion
category `A` (Etingof-Nikshych-Ostrik), are unproved; every fusion-category
claim of the paper is conditional on them. (conjecture)

**C-18**. The structure of non-amenable type III factors beyond the Connes
strata is open. (open-problem)

**C-19**. No isomorphism classification of quantum channels exists beyond the
Stinespring normal form; the Choi spectrum is not a complete invariant and no
complete set of orbit invariants is on record. (open-problem)

**C-20**. Whether any restricted classification of non-amenable II_1 factors
survives under rigidity hypotheses is not addressed by the sources consulted in
the paper. (open-problem)
