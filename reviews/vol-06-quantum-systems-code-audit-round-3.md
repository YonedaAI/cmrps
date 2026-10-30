---
reviewer: codex (OpenAI) gpt-6.1-sol
type: code-audit
paper: vol-06-quantum-systems
round: 1
date: 2026-10-30T06:40:17Z
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
session id: 01a18b89-a96a-7ee3-8bb0-fd436ee7f8e1
--------
user
Read papers/latex/vol-06-quantum-systems.tex and ONLY the files under src/vol-06-quantum-systems/ that its code evidence appendix names (do not explore anything else). This is a re-audit after narrowing. Round 2 left row 1 PARTIAL because the claim text overreached the code. The claim text of row 1 has now been narrowed to exactly what the script demonstrates: that the isomorphism criterion matches the enumerated isomorphism classes up to dimension 16, with witnesses and independently computed ideal-dimension invariants on every pair. All other rows were SUPPORTS in round 2. For EVERY row of the appendix output one line: ROW <n> | <claim, 10 words max> | SUPPORTS | PARTIAL | NO | <one-sentence reason>. End with VERDICT: PASS if every row is SUPPORTS, else VERDICT: NEEDS_FIX.
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
I’ll read the paper and only the source files named in its code evidence appendix, then assess every row against the code.
exec
/usr/local/bin/zsh -lc 'cat papers/latex/vol-06-quantum-systems.tex' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
\documentclass[11pt,letterpaper]{article}

\usepackage[T1]{fontenc}
\usepackage{lmodern}
\usepackage{microtype}
\usepackage[margin=1in]{geometry}      % one-inch margins, as the writing standard specifies
\linespread{1.0}
\setlength{\parskip}{0pt}          % conventional article: indent, no vertical gap
\setlength{\parindent}{1.5em}

\usepackage{amsmath,amssymb,amsthm}
\usepackage{graphicx}
\usepackage{xcolor}
\usepackage{tikz}                  % and tikz-cd when commutative diagrams are used
\usepackage{booktabs,tabularx,array,longtable}
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{Y}{>{\raggedright\arraybackslash}X}
\usepackage[hidelinks]{hyperref}
\usepackage{cleveref}

\newtheorem{theorem}{Theorem}[section]
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{example}[theorem]{Example}
\theoremstyle{remark}
\newtheorem{remark}[theorem]{Remark}

\crefname{theorem}{theorem}{theorems}
\Crefname{theorem}{Theorem}{Theorems}
\crefname{proposition}{proposition}{propositions}
\Crefname{proposition}{Proposition}{Propositions}
\crefname{lemma}{lemma}{lemmas}
\crefname{corollary}{corollary}{corollaries}
\crefname{definition}{definition}{definitions}
\Crefname{definition}{Definition}{Definitions}
\crefname{example}{example}{examples}
\Crefname{example}{Example}{Examples}
\crefname{remark}{remark}{remarks}
\crefname{section}{section}{sections}
\Crefname{section}{Section}{Sections}
\crefname{table}{table}{tables}
\Crefname{table}{Table}{Tables}

\title{Classification of Quantum Physical Systems\\[4pt]
  {\normalsize Part VI of \emph{The Classification of Mathematical Representations of Physical Systems}}}
\author{Matthew Long\\
  \small The YonedaAI Collaboration, YonedaAI Research Collective\\
  \small Chicago, Illinois, USA\\
  \small \texttt{matthew@yonedaai.com}\\
  \small \texttt{https://yonedaai.com}}
\date{29 October 2026}

\begin{document}

\maketitle

\begin{abstract}
Quantum physical systems admit a complete structural classification only in restricted regimes, and this paper records where those regimes begin and end. Finite-dimensional observable algebras are classified by one combinatorial invariant, the dimension vector of the block decomposition. Amenable operator-algebraic models are classified by Murray-von Neumann type together with Connes invariants. Completely positive maps admit a canonical normal form through minimal Stinespring dilations, unique up to unitary equivalence, and the Kraus rank of that normal form is not an isomorphism invariant of channels. Beyond the amenable class no finite answer is possible: uncountably many pairwise non-isomorphic separable $\mathrm{II}_1$ factors exist, so no finite list of factor types can be exhaustive. On the categorical side, the Doplicher-Roberts reconstruction theorem and Deligne's theorem classify superselection and symmetric tensor categories under explicit hypotheses, and the Etingof-Gelaki examples show that any equivalence forgetting the symmetric structure fails to recover its group. Quantum monotone metrics form a parametric family rather than a unique choice. The paper separates classified islands from proved impossibilities and open problems, and reports executable models of the finite-dimensional taxonomy as computational evidence only.
\end{abstract}

\section{Introduction}

Three kinds of result organize the classification of quantum physical systems: complete classification theorems, proved non-classification theorems, and open problems. The finite-dimensional theory is complete and combinatorial. The amenable operator-algebraic theory is complete and analytic. Outside the amenable class, McDuff's theorem of 1969 rules out any finite list of factor types, and this negative result is content of the theory, not a temporary difficulty. The categorical theory is complete under explicit hypotheses and open without them.

The classification question follows the program of this series. Fix a category of mathematical representations of physical systems and an equivalence relation on its objects; classify the objects up to that equivalence. For quantum systems the representations are operator-algebraic and categorical: Hilbert spaces, $C^*$-algebras and von Neumann algebras of observables, completely positive maps between them, and tensor categories of superselection sectors. The equivalence relations that appear in established results are exact: $*$-isomorphism of algebras, unitary equivalence of dilations, monoidal equivalence of categories, each with the structure it preserves made explicit.

Three structural families carry the quantum material: Hilbert spaces and operator algebras, probability and measure structure on the quantum side, and tensor categories with compositional structure. The classifying invariants in force are correspondingly three kinds: a discrete invariant (the dimension vector), a pair of analytic invariants (Murray-von Neumann type and Connes invariants), and a parametric invariant (an operator monotone function classifying a monotone metric). The families are candidate organizing families, and no independence or completeness claim about them is used here.

Two scope restrictions hold throughout. The long-term classification target of the program is a research objective and is never assumed as a hypothesis; every statement proved here is proved from its own hypotheses. The paper classifies mathematical representations of physical systems.

\section{Mathematical framework}

\begin{definition}[Quantum system record]
\label{def:system}
A quantum system record is a tuple $P = (H, A, D, S, C)$ where $H$ is a complex Hilbert space, $A$ is a $C^*$-algebra of observables represented on $H$, $D$ is the dynamical data (a flow, a semigroup of endomorphisms, or a generator), $S$ is the symmetry and constraint data (a group or groupoid action with its fixed-point structure), and $C$ is the composition data (tensor product or another monoidal operation on records of the same kind). The five components need not be independent.
\end{definition}

A morphism of records commutes with the data it claims to preserve, and every equivalence statement below names the preserved layers on its face. The classification results below concern projections of the record: the observable algebra, the channel data, the sector category, and the state-space metric. \Cref{rem:dimvec} states what that projection costs for the full tuple.

\begin{definition}[Classification problem]
\label{def:classproblem}
Fix a class $\mathcal{Q}$ of quantum system records and an equivalence relation $\approx$ on $\mathcal{Q}$ declared with its preserved layers as in \cref{def:preserved}. The classification problem for $(\mathcal{Q}, \approx)$ is to construct an invariant $I$ on $\mathcal{Q}$ with $I(P) = I(Q)$ exactly when $P \approx Q$. The equivalences in force below are $*$-isomorphism for observable algebras, unitary equivalence for minimal dilations, symmetric tensor equivalence for superselection categories, and equality of the operator monotone parameter for monotone metrics.
\end{definition}

\begin{definition}[Observable algebras]
\label{def:observables}
A finite-dimensional quantum system is a record with $\dim H = n < \infty$ and $A \subseteq B(H)$ a $C^*$-subalgebra of the algebra of bounded operators on $H$. As an abstract $C^*$-algebra $A$ is finite-dimensional and unital, with a unit that need not be the identity of $B(H)$; \cref{thm:findim} applies to $A$ as an abstract algebra. An operator-algebraic system is a record whose observable algebra $A$ is a $C^*$-algebra or a von Neumann algebra of arbitrary dimension. A factor is a von Neumann algebra with trivial center.
\end{definition}

\begin{definition}[States and channels]
\label{def:channels}
A state on a $C^*$-algebra $A$ is a positive linear functional $\rho$ of norm one. A channel between matrix algebras $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ is a linear map that is completely positive and trace preserving. A Stinespring dilation of a channel $\Phi$ is a pair $(K, V)$ with $K$ a finite-dimensional Hilbert space (the environment) and $V: \mathbb{C}^n \to \mathbb{C}^m \otimes K$ an isometry such that
\[
\Phi(X) = \operatorname{Tr}_K\bigl(V X V^*\bigr) \qquad \text{for all } X \in M_n(\mathbb{C}).
\]
The dilation is minimal when no proper subspace of $K$ carries a dilation of $\Phi$.
\end{definition}

\begin{definition}[Dimension vector]
\label{def:dimvec}
Let $A$ be a finite-dimensional $C^*$-algebra. The dimension vector of $A$ is the multiset of matrix block sizes appearing in the decomposition of \cref{thm:findim}, written $\mathbf{d}(A) = \{n_1, \dots, n_k\}$ with each $n_i \geq 1$ and repetition allowed.
\end{definition}

\begin{definition}[Preserved structure of an equivalence]
\label{def:preserved}
An equivalence used to identify two quantum system records must state which layers it preserves. The layers named in this paper are the $*$-structure of observable algebras, the monoidal structure of tensor products, the symmetric structure of a tensor category, and the complete positivity of channels. An identification that does not name its preserved layers is inadmissible.
\end{definition}

The counterexample of \cref{sec:tensor} shows that an equivalence of tensor categories which forgets the symmetric layer cannot recover the group it classifies, so a classification built on such an equivalence is false.

\begin{example}[Qubit composite systems]
\label{ex:qubits}
A single qubit record has $H = \mathbb{C}^2$ and observables $M_2(\mathbb{C})$. An $N$-qubit record has $H = (\mathbb{C}^2)^{\otimes N}$ and observables $M_{2^N}(\mathbb{C})$ or a subalgebra of it, with composition data the tensor product of \cref{prop:tensor}. The dimension vector of the full observable algebra is $\{2^N\}$, and subalgebras correspond to blocks of smaller size in the sense of \cref{thm:findim}. Symmetry actions such as the Pauli group permute and mix the blocks, and that action is data the dimension vector does not carry.
\end{example}

\begin{definition}[Invariants]
\label{def:invariants}
A classifying invariant for a class of records is a map $I$ such that $I(P) = I(Q)$ if and only if $P$ and $Q$ are equivalent under the relation in force. The classifying invariants of this paper are the dimension vector (\cref{def:dimvec}), the Murray-von Neumann type and the Connes invariants of a factor, and the operator monotone function classifying a monotone metric on quantum states. The Kraus rank of a minimal dilation is a normal-form dimension and not a classifying invariant for channels (\cref{rem:normalform}).
\end{definition}

Classification invariants separate at three levels of resolution. The dimension vector completely separates finite-dimensional observable algebras up to $*$-isomorphism (\cref{thm:findim}). Operator monotone functions parameterize the monotone metrics of quantum states without singling out a unique metric (\cref{thm:petz}). Minimal Stinespring dilations give canonical normal forms for completely positive maps while failing to separate unitarily inequivalent channels (\cref{prop:krausrank}).

\Cref{tab:families} records the families in force, their defining invariants, and what the established theorems say about each.

\begin{table}[ht]
\centering
\caption{Structural families carrying quantum systems, with the classifying data each family actually admits in the established literature.}
\label{tab:families}
\small
\begin{tabularx}{\textwidth}{@{}Y Y Y Y@{}}
\toprule
Family & Object & Classifying invariant & Status \\
\midrule
II, Hilbert spaces and operator algebras & Finite-dimensional $C^*$-algebras & Dimension vector & Complete classification \\
II, Hilbert spaces and operator algebras & Amenable factors & Murray-von Neumann type and Connes invariants & Complete classification \\
II, Hilbert spaces and operator algebras & General $\mathrm{II}_1$ factors & No parametric invariant can suffice & Proved non-classifiable \\
V, probability and measure structure & Monotone metrics on density matrices & Operator monotone function & Parametric classification \\
VIII, tensor categories and composition & Symmetric tensor categories under the hypotheses of \cref{thm:deligne} & Underlying supergroup & Complete under stated hypotheses \\
VIII, tensor categories and composition & Fusion categories & Weak Hopf presentation only & Open \\
\bottomrule
\end{tabularx}
\end{table}

The classes covered below are fixed here: finite-dimensional quantum systems with observable $C^*$-algebras, operator-algebraic systems with factor observable algebras, channels between matrix algebras, superselection categories of local nets under the DHR selection criterion, and density-matrix state spaces with monotone metrics. Gauge-theoretic and gravitational systems lie outside this scope.

\section{Finite-dimensional quantum systems}
\label{sec:findim}

Finite-dimensional quantum systems are the reference case for the whole program: the classification is complete, the invariant is discrete, and the proofs are self-contained. The observable algebra of such a system is a finite-dimensional $C^*$-algebra, and the structure theorem below reduces every such algebra to matrix blocks.

\begin{theorem}[Structure of finite-dimensional $C^*$-algebras]
\label{thm:findim}
Let $A$ be a finite-dimensional complex $C^*$-algebra. Then there are integers $n_1, \dots, n_k \geq 1$ and a $*$-isomorphism
\[
A \cong M_{n_1}(\mathbb{C}) \oplus \cdots \oplus M_{n_k}(\mathbb{C}).
\]
The multiset $\{n_1, \dots, n_k\}$ determines $A$ up to $*$-isomorphism, and two finite-dimensional $C^*$-algebras are $*$-isomorphic if and only if their dimension vectors agree as multisets.
\end{theorem}

\begin{proof}
The Jacobson radical $J(A)$ of the finite-dimensional algebra $A$ is nilpotent: $J(A)^k = \{0\}$ for some $k$, so every element of $J(A)$ is nilpotent. For $x \in J(A)$ the element $x^* x$ lies in $J(A)$ and is self-adjoint and nilpotent, hence has spectrum $\{0\}$, and the $C^*$-identity $\|x\|^2 = \|x^* x\| = r(x^* x)$ gives $x = 0$. Thus $J(A) = \{0\}$ and $A$ is semisimple. By the Artin-Wedderburn theorem over the algebraically closed field $\mathbb{C}$ the algebra decomposes as $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ with each summand a simple two-sided ideal. Each simple ideal is stable under the involution: if an ideal $I$ satisfied $I \cap I^* = \{0\}$, then every $y \in I$ would satisfy $y^* y \in I \cap I^* = \{0\}$, forcing $y = 0$. Because every conjugate-linear anti-automorphism of $M_{n_i}(\mathbb{C})$ that makes it a $C^*$-algebra is conjugate through an inner automorphism to the standard adjoint, the algebraic direct sum lifts to a $*$-isomorphism $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ with the adjoint taken blockwise. Every finite-dimensional $C^*$-algebra is unital: the unit is the sum $\sum_i I_{n_i}$ of the block identity matrices, so no unitization step is needed.

For the classification statement, a $*$-isomorphism carries minimal central projections to minimal central projections and block sizes to block sizes, so the dimension vector is an isomorphism invariant. Conversely, equality of dimension vectors gives a blockwise unitary identification, and this identification intertwines the adjoints blockwise. The dimension vector is therefore a classifying invariant in the sense of \cref{def:invariants} for the equivalence relation of $*$-isomorphism.
\end{proof}

\begin{corollary}[Classification by dimension vector]
\label{cor:findimclass}
Up to $*$-isomorphism the finite-dimensional complex $C^*$-algebras are in bijection with finite multisets of positive integers, and every such algebra is unital with $\dim A = \sum_i n_i^2$ the sum of squares of its block sizes.
\end{corollary}

\begin{remark}[What the dimension vector does not classify]
\label{rem:dimvec}
\Cref{thm:findim} classifies the observable algebra only. A designated state, the dynamics implemented by one-parameter groups of automorphisms, symmetry actions, and the composition data of a quantum system record are not determined by the dimension vector. Two system records with isomorphic observable algebras may carry different dynamics and different composition data. The classification of representations is the first layer of the program, not the last.
\end{remark}

\begin{example}[Qubit observables]
\label{ex:qubit}
For $H = \mathbb{C}^2$ the full observable algebra is $M_2(\mathbb{C})$ with dimension vector $\{2\}$. The commutative algebra of diagonal observables is $\mathbb{C} \oplus \mathbb{C}$ with dimension vector $\{1, 1\}$. The two algebras have equal vector-space dimension $4$ and are not $*$-isomorphic, so vector-space dimension is not a classifying invariant while the dimension vector is. Up to $*$-isomorphism there are exactly two $C^*$-algebras of complex dimension $4$: $M_2(\mathbb{C})$ and $\mathbb{C}^4$, since $4 = 2^2 = 1^2 + 1^2 + 1^2 + 1^2$ are the two partitions of $4$ into perfect squares.
\end{example}

\begin{example}[Two presentations of one algebra]
\label{ex:iso}
Let $A \subseteq M_3(\mathbb{C})$ consist of the block matrices $\operatorname{diag}(M, \lambda)$ with $M \in M_2(\mathbb{C})$ and $\lambda \in \mathbb{C}$, and let $B = U A U^*$ for a unitary $U \in M_3(\mathbb{C})$. The algebras are $*$-isomorphic by construction and have the same dimension vector $\{1, 2\}$, while their matrix representations in $\mathbb{C}^3$ differ. The algebra $M_2(\mathbb{C}) \oplus \mathbb{C}$ carries the same dimension vector, and a unitary carrying the block decomposition of $A$ to the standard one exhibits the $*$-isomorphism of \cref{thm:findim} explicitly. The invariant sees the blocks and the presentation hides them.
\end{example}

\begin{corollary}[Counting small algebras]
\label{cor:count}
For each $d \geq 1$ the $*$-isomorphism classes of finite-dimensional $C^*$-algebras of complex dimension $d$ are in bijection with the partitions of $d$ into perfect squares. In particular the number of such algebras grows as the number of such partitions.
\end{corollary}

We write a multiset such as eight $1$s and one $2$ as $\{1^8, 2\}$. \Cref{tab:counts} lists the block multisets for small $d$.

\begin{table}[ht]
\centering
\caption{Dimension vectors of finite-dimensional $C^*$-algebras of complex dimension $d$, written as multisets of block sizes.}
\label{tab:counts}
\small
\begin{tabularx}{\textwidth}{@{}c Y c@{}}
\toprule
$d$ & Dimension vectors & Count \\
\midrule
1 & $\{1\}$ & 1 \\
2 & $\{1^2\}$ & 1 \\
3 & $\{1^3\}$ & 1 \\
4 & $\{1^4\}$ and $\{2\}$ & 2 \\
5 & $\{1^5\}$ and $\{1, 2\}$ & 2 \\
6 & $\{1^6\}$ and $\{1^2, 2\}$ & 2 \\
7 & $\{1^7\}$ and $\{1^3, 2\}$ & 2 \\
8 & $\{1^8\}$, $\{1^4, 2\}$, and $\{2^2\}$ & 3 \\
9 & $\{1^9\}$, $\{1^5, 2\}$, $\{1, 2^2\}$, and $\{3\}$ & 4 \\
10 & $\{1^{10}\}$, $\{1^6, 2\}$, $\{1^2, 2^2\}$, and $\{1, 3\}$ & 4 \\
11 & $\{1^{11}\}$, $\{1^7, 2\}$, $\{1^3, 2^2\}$, and $\{1^2, 3\}$ & 4 \\
12 & $\{1^{12}\}$, $\{1^8, 2\}$, $\{1^4, 2^2\}$, $\{2^3\}$, and $\{1^3, 3\}$ & 5 \\
\bottomrule
\end{tabularx}
\end{table}

\begin{remark}[Recognition]
\label{rem:recognition}
The dimension vector solves the recognition problem for this class as well as the classification problem: given matrix blocks, comparing their size multisets decides $*$-isomorphism directly, and the comparison is a sort. In the finite-dimensional regime classification, parameterization, and recognition therefore coincide. The classification of finite simple groups separates the three: it delivers the list, partially solves recognition through atlas data, and supplies no uniform parameterization. The separation reappears, in worse form, in \cref{sec:mcduff}. For channels the recognition problem is open in the same way the classification problem is: comparing Choi spectra decides nothing beyond the orbit invariants of \cref{prop:krausrank}, and no recognition procedure for unitary equivalence of channels is on record.
\end{remark}

\subsection{States and state spaces}

The observable algebra of \cref{thm:findim} carries state space data that the classification records.

\begin{proposition}[States of a block algebra]
\label{prop:states}
Let $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$. Every state $\rho$ on $A$ is of the form
\[
\rho(X_1, \dots, X_k) = \sum_{i=1}^{k} \operatorname{Tr}(\sigma_i X_i)
\]
for positive matrices $\sigma_i \in M_{n_i}(\mathbb{C})$ with $\sum_i \operatorname{Tr} \sigma_i = 1$, and this correspondence is bijective. The pure states of $A$ are the vector states of individual blocks, so the pure state space is the disjoint union of complex projective spaces $\mathbb{CP}^{n_i - 1}$.
\end{proposition}

\begin{proof}
A positive functional on a direct sum is blockwise positive, so it suffices to treat one block. On $M_n(\mathbb{C})$ every positive functional is a trace against a positive matrix: the matrix $\sigma$ with entries $\sigma_{ji} = \rho(E_{ij})$ satisfies $\rho(X) = \operatorname{Tr}(\sigma X)$ for all $X$ by linearity on matrix units, and positivity of $\rho$ gives $\sigma \geq 0$. Normalization of $\rho$ on $A$ reads $\sum_i \operatorname{Tr} \sigma_i = 1$. Purity forces all but one $\sigma_i$ to vanish and that $\sigma_i$ to have rank one, which is a vector state of block $i$.
\end{proof}

The state space of $A$, as a compact convex body, is therefore determined by the dimension vector: it is the join of the density-matrix bodies of the blocks.

\begin{proposition}[Automorphisms of block algebras]
\label{prop:aut}
Every $*$-automorphism of $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ is the composition of a blockwise inner automorphism and a permutation of blocks of equal size. The dynamics of a finite-dimensional quantum system is therefore a unitary path inside blocks together with block permutations of equal size, and none of it is recorded by the dimension vector beyond the block sizes themselves.
\end{proposition}

\begin{proof}
By \cref{thm:findim} every $*$-automorphism permutes the simple ideals of $A$, and it can permute only ideals of equal size, being a $*$-isomorphism. On a single block every $*$-automorphism of $M_n(\mathbb{C})$ is inner, so after choosing the permutation the automorphism is blockwise conjugation by unitaries. The second statement collects the description.
\end{proof}

\begin{proposition}[Unique decomposition in the finite-dimensional class]
\label{prop:unique}
Decompositions of a finite-dimensional $C^*$-algebra $A$ into irreducible summands under direct sum exist and are unique up to order and unitary equivalence. The dimension vector is therefore complete data for the decomposition as well as for the isomorphism class, and the uniqueness that fails for interacting systems in general holds in this restricted class.
\end{proposition}

\begin{proof}
Existence is \cref{thm:findim}. Uniqueness holds because the summands are the simple ideals of the semisimple algebra $A$, and the minimal nonzero two-sided ideals of a semisimple algebra are unique. Any decomposition into irreducible summands exhibits exactly these ideals, and the order of the summands is not part of the data, matching the multiset form of the dimension vector.
\end{proof}

\begin{proposition}[Tensor products of block algebras]
\label{prop:tensor}
Let $A = \bigoplus_i M_{n_i}(\mathbb{C})$ and $B = \bigoplus_j M_{m_j}(\mathbb{C})$. Then $A \otimes B \cong \bigoplus_{i,j} M_{n_i m_j}(\mathbb{C})$, and the dimension vector of $A \otimes B$ is the multiset of products $\{n_i m_j\}$. In particular the dimension vector of a tensor product is computed from the factor dimension vectors without reference to any presentation.
\end{proposition}

\begin{proof}
The tensor product of matrix algebras satisfies $M_n(\mathbb{C}) \otimes M_m(\mathbb{C}) \cong M_{nm}(\mathbb{C})$ as $C^*$-algebras, and the tensor product of direct sums distributes: $A \otimes B \cong \bigoplus_{i,j} M_{n_i}(\mathbb{C}) \otimes M_{m_j}(\mathbb{C})$. \Cref{thm:findim} then identifies the result blockwise.
\end{proof}

\section{Operator algebras and factors}
\label{sec:factors}

Infinite-dimensional quantum systems require operator-algebraic observables. The classification of von Neumann algebras reduces to factors, and the classification of factors is complete on the amenable side and out of reach of any finite list of types on the general side.

\begin{definition}[Factor types]
\label{def:factortype}
A factor $M$ is of type $\mathrm{I}$ if it contains minimal projections, of type $\mathrm{II}_1$ if it is infinite-dimensional with a finite faithful normal trace, of type $\mathrm{II}_\infty$ if it is properly infinite with a semifinite trace, and of type $\mathrm{III}$ if it admits no nonzero finite trace. The type $\mathrm{III}$ factors are stratified by the Connes spectrum of the modular automorphism group, with parameters $\lambda \in (0,1)$ and the two endpoint cases $\mathrm{III}_0$ and $\mathrm{III}_1$.
\end{definition}

Murray-von Neumann comparison theory is the tool behind the trichotomy. Two projections $p$ and $q$ of a von Neumann algebra are equivalent when a partial isometry $u$ with $u^* u = p$ and $u u^* = q$ exists, and in a factor any two projections are comparable: either $p$ is equivalent to a subprojection of $q$ or conversely. Type $\mathrm{I}$ factors contain minimal projections, type $\mathrm{II}$ factors contain no minimal projections but do contain nonzero finite projections, and type $\mathrm{III}$ factors have every nonzero projection infinite. The type of a factor is therefore the first invariant of \cref{thm:amenable}.

The reduction to factors is the operator-algebraic analogue of block decomposition.

\begin{definition}[Amenable factors]
\label{def:amenable}
All factors in this section have separable predual. A factor is hyperfinite, or approximately finite-dimensional, when it is the norm closure of an increasing union of finite-dimensional subalgebras, and injective when a norm-one projection of $B(H)$ onto it exists. For factors with separable predual the two conditions coincide, and a factor satisfying them is amenable. The unique amenable factor of type $\mathrm{II}_1$ with separable predual is the hyperfinite factor $R$.
\end{definition}

\begin{theorem}[Central decomposition]
\label{thm:central}
Every von Neumann algebra $M$ is a direct integral of factors over a measure space, unique up to measure-class isomorphism of the base. The isomorphism classification of von Neumann algebras therefore reduces to the classification of factors together with the measure-theoretic data of the decomposition.
\end{theorem}

\Cref{thm:central} is the Murray-von Neumann direct-integral decomposition; we refer to the original work and to the standard accounts for the proof. The classification content sits in the factors.

\begin{theorem}[Classification of amenable factors]
\label{thm:amenable}
Among factors with separable predual the amenable (equivalently injective, equivalently hyperfinite) factors are classified as follows. For each $n \geq 1$ there is a unique factor of type $\mathrm{I}_n$ and a unique factor of type $\mathrm{I}_\infty$. There is a unique amenable factor of type $\mathrm{II}_1$, the hyperfinite factor, and a unique amenable factor of type $\mathrm{II}_\infty$. For each $\lambda \in (0,1)$ there is a unique amenable factor of type $\mathrm{III}_\lambda$, and a unique amenable factor of type $\mathrm{III}_1$. Amenable factors of type $\mathrm{III}_0$ are classified by the ergodic flow of weights. The invariants in force are the Murray-von Neumann type together with the Connes invariants. Separable predual is essential: among non-separable injective $\mathrm{II}_1$ factors uniqueness fails, and there are $2^{\mathfrak{c}}$ pairwise non-isomorphic ones.
\end{theorem}

\begin{proof}[Status of the proof]
The type $\mathrm{I}$ and type $\mathrm{II}$ cases are Murray-von Neumann's, together with the existence and uniqueness of the hyperfinite $\mathrm{II}_1$ factor. The classification of injective factors, including the type $\mathrm{III}_\lambda$ cases for $\lambda \neq 0$, is Connes's theorem of 1976, building on his 1973 classification of type $\mathrm{III}$ factors by the invariants of \cref{def:factortype}. Uniqueness of the injective factor of type $\mathrm{III}_1$ was completed by Haagerup in 1987 through the bicentralizer problem. The statements are established theorems of the literature; the proofs are deep analytic arguments in von Neumann algebra theory and are not reproduced here. What is proved in this paper is the finite-dimensional content of \cref{sec:findim} and the channel content of \cref{sec:channels}, each in full.
\end{proof}

\subsection{The hyperfinite factor}

In type $\mathrm{II}_1$ the hyperfinite factor $R$ is the norm closure of an increasing union of full matrix algebras $M_{2^k}(\mathbb{C})$ along the embeddings $A \mapsto A \otimes I_2$, and every amenable $\mathrm{II}_1$ factor with separable predual is isomorphic to $R$. The type $\mathrm{III}_\lambda$ factors for $\lambda \in (0,1)$ arise differently: as infinite tensor products of finite type I factors carrying non-tracial product states (the Powers factors), not as inductive limits of matrix algebras along unital embeddings. The unique amenable factor of type $\mathrm{III}_1$ is the limit case completed by Haagerup's theorem.

Within type $\mathrm{III}_0$ the amenable factors are classified by the ergodic flow of weights up to conjugacy of the flow, and this is the one stratum whose invariant is an ergodic object rather than a number.

The factor $R$ is the reference object of the classification. It lies inside the classified regime of \cref{thm:amenable}, it is the unique separable injective $\mathrm{II}_1$ factor, and the uncountable family of \cref{thm:mcduff} is produced by varying the central-sequence structure of algebras built from it. The boundary between the amenable side and the general side is therefore a boundary inside the separable $\mathrm{II}_1$ factors themselves.

\begin{remark}[Type $\mathrm{III}$ strata]
\label{rem:typeIII}
The Connes spectrum $S(M) = \bigcap_{\varphi} \operatorname{Sp}(\Delta_\varphi)$ is the intersection over normal faithful states $\varphi$ of the spectra of the modular operators $\Delta_\varphi$, a subset of $[0, \infty)$, and the flow of weights is the ergodic flow attached to the modular automorphism group through the central decomposition. The stratum data are read off from $S(M) \cap \mathbb{R}_+^*$: it is $\{1\}$ in type $\mathrm{III}_0$, $\lambda^{\mathbb{Z}}$ in type $\mathrm{III}_\lambda$ for $\lambda \in (0,1)$, and $(0, \infty)$ in type $\mathrm{III}_1$. \Cref{thm:amenable} classifies the amenable factors through these invariants and the ergodic flow of weights in type $\mathrm{III}_0$. Beyond the amenable class the strata are coarse: fundamental groups of type $\mathrm{III}$ factors vary widely, and the structure theory past the Connes spectrum is open. No completeness claim for non-amenable type $\mathrm{III}$ factors is used anywhere in this paper.
\end{remark}

\begin{remark}[The Elliott program]
\label{rem:elliott}
For separable simple nuclear $C^*$-algebras the analogous program classifies algebras by $K$-theoretic and tracial data. The program is unfinished. Toms constructed a simple unital algebra shape equivalent to its tensor product with an infinite-dimensional UHF algebra and with the same tracial simplex, yet not isomorphic to it, so $K$-theory and traces together do not complete the classification without further hypotheses. This paper draws no classification conclusion from the Elliott program.
\end{remark}

\section{The McDuff obstruction}
\label{sec:mcduff}

The most consequential theorem for the classification program is negative.

\begin{theorem}[McDuff 1969]
\label{thm:mcduff}
There exist uncountably many pairwise non-isomorphic separable type $\mathrm{II}_1$ factors.
\end{theorem}

\begin{proof}[Consequence for classification]
The theorem asserts continuum many isomorphism classes: the separable $\mathrm{II}_1$ factors form an uncountable family with no repetitions up to isomorphism. Two consequences follow. No finite or countable list of factor types can exhaust the family, so a CFSG-style list of types cannot be complete outside a restricted class, and any classification theorem for $\mathrm{II}_1$ factors must restrict its class (for instance to the amenable factors of \cref{thm:amenable}) or weaken its conclusion to a coarser equivalence. The theorem by itself does not decide whether a classification by continuous parameters exists; that question belongs to the descriptive set theory of von Neumann algebra isomorphism and is not settled here. What the theorem does settle is that the separation is visible in the operator-algebraic structure itself: the construction separates factors through their central sequences.
\end{proof}

\begin{corollary}[No finite list of factor types]
\label{cor:nofinite}
No finite or countable list of pairwise non-isomorphic factor types exhausts the separable $\mathrm{II}_1$ factors, and no CFSG-style list of factor types is complete outside a restricted class such as the amenable factors.
\end{corollary}

\begin{proof}
A finite or countable list covers countably many isomorphism classes, and \cref{thm:mcduff} supplies continuum many. The second statement is the first applied to the CFSG shape of a classification theorem.
\end{proof}

\begin{remark}[Honest record]
\label{rem:mcduff}
\Cref{thm:mcduff} marks the boundary of the classifiable territory: it is a classification result of the same standing as the positive theorems, not a difficulty to be engineered around. The amenable factors lie inside the boundary by \cref{thm:amenable}, and the general $\mathrm{II}_1$ factors lie outside it.
\end{remark}

Inside the amenable class the classification has the shape of a CFSG-style theorem: a list of types, a complete set of invariants, and a uniqueness statement for each type. The obstruction says this shape cannot extend to all separable $\mathrm{II}_1$ factors, so the shape must be sought in restricted classes or with weakened equivalences. The amenable classification is one instance of the pattern; whether rigidity hypotheses on non-amenable factors define another instance is one of the open problems of \cref{sec:regimes}.

\section{Channels and dilations}
\label{sec:channels}


\subsection{Choi-Kraus normal form}

The morphisms of finite-dimensional quantum systems that appear in measurement and evolution are channels (\cref{def:channels}). Their normal form is the first of the two canonical-form theorems of the paper.

\begin{lemma}[Choi correspondence]
\label{lem:choi}
For a linear map $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ with Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$ the following hold: $\Phi$ is completely positive if and only if $J(\Phi) \geq 0$, and $\Phi$ is trace preserving if and only if $\operatorname{Tr}_m J(\Phi) = I_n$, where $\operatorname{Tr}_m$ is the partial trace over the second tensor factor.
\end{lemma}

\begin{proof}
Complete positivity is tested on positive elements of $M_n(\mathbb{C}) \otimes M_k(\mathbb{C})$ for all $k$, and for $k = n$ the condition $(\operatorname{id} \otimes \Phi)(P) \geq 0$ on rank-one projections $P = |\psi\rangle\langle\psi|$ with $|\psi\rangle = \sum_i e_i \otimes e_i$ reads $J(\Phi) \geq 0$; the general case follows by direct sums. For the trace condition, $\operatorname{Tr}_m J(\Phi)$ has $(i,j)$ entry $\operatorname{Tr}(\Phi(E_{ij}))$, and $\Phi$ preserves trace exactly when $\operatorname{Tr}(\Phi(E_{ij})) = \delta_{ij}$, which is $\operatorname{Tr}_m J(\Phi) = I_n$.
\end{proof}

\begin{example}[A family of one Kraus rank]
\label{ex:depol}
For $p \in (0,1)$ set $A_0 = \sqrt{1 - p} \, I_2$ and $A_i = \sqrt{p/3} \, \sigma_i$ for the three Pauli matrices $\sigma_i$. The map $\Phi_p(X) = \sum_{k=0}^{3} A_k X A_k^*$ satisfies $\sum_k A_k^* A_k = I_2$, so it is a qubit channel. Its Choi matrix has eigenvalues $2(1 - p)$ and $2p/3$ with multiplicity three, all positive, so the Kraus rank is $4$ for every $p \in (0,1)$. The Choi spectrum varies with $p$, and unitary equivalence of channels preserves the Choi spectrum, so the family consists of pairwise unitarily inequivalent channels sharing one Kraus rank.
\end{example}

\begin{example}[Choi matrix of a qubit channel]
\label{ex:choi}
For the channel $\Phi_p$ of \cref{ex:depol} the Kraus vectors are the vectorizations of $I_2$ and of the Pauli matrices, which are orthogonal for the Hilbert-Schmidt pairing. The Choi matrix is therefore diagonal in the basis these vectors span, with eigenvalues $2(1 - p)$ and $2p/3$ with multiplicity three. Trace preservation reads $\operatorname{Tr}_m J(\Phi_p) = I_2$ on these eigenvalues, and complete positivity reads $J(\Phi_p) \geq 0$, which holds for $p \in (0,1)$. The eigenvalue list is the input of the minimization statement of \cref{prop:krausrank}.
\end{example}

\begin{theorem}[Choi-Kraus normal form]
\label{thm:kraus}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be linear. Then $\Phi$ is completely positive if and only if there are matrices $A_1, \dots, A_r \in M_{m \times n}(\mathbb{C})$ with
\[
\Phi(X) = \sum_{i=1}^{r} A_i X A_i^* \qquad \text{for all } X \in M_n(\mathbb{C}),
\]
and one may take $r$ equal to the rank of the Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$. The minimal such $r$ is the Kraus rank of $\Phi$ and equals the rank of $J(\Phi)$.
\end{theorem}

\begin{proof}
Write $J(\Phi) \in M_{nm}(\mathbb{C})$ in block form as the $n \times n$ block matrix with blocks $\Phi(E_{ij})$. Complete positivity of $\Phi$ is equivalent to positivity of $J(\Phi)$, and positivity is equivalent to a factorization $J(\Phi) = \sum_{k=1}^{r} v_k v_k^*$ with $r = \operatorname{rank} J(\Phi)$ and vectors $v_k \in \mathbb{C}^n \otimes \mathbb{C}^m$. Fix an orthonormal basis $e_1, \dots, e_n$ of $\mathbb{C}^n$ and decompose each $v_k = \sum_{j=1}^{n} e_j \otimes w_{kj}$ with $w_{kj} \in \mathbb{C}^m$. Let $A_k \in M_{m \times n}(\mathbb{C})$ be the matrix whose $j$-th column is $w_{kj}$. The $(i,j)$ block of $J(\Phi)$ is then $\sum_{k=1}^{r} w_{ki} w_{kj}^* = \sum_{k=1}^{r} A_k E_{ij} A_k^*$, so $\Phi(E_{ij}) = \sum_{k} A_k E_{ij} A_k^*$ for all $i, j$ and by linearity $\Phi(X) = \sum_{k} A_k X A_k^*$ for all $X$. Conversely any such representation writes $J(\Phi)$ as a sum of $s$ rank-one positive terms, so $s \geq \operatorname{rank} J(\Phi)$ and the minimal number of Kraus operators equals $r$.
\end{proof}

\begin{remark}[Normal form versus classification]
\label{rem:normalform}
\Cref{thm:kraus} is a normal-form theorem, not a classification of channels up to isomorphism. The Kraus rank is an invariant of the minimal presentation of one channel. \Cref{sec:channels} exhibits channels with equal Kraus rank that no unitary change of presentation identifies, and the literature records no isomorphism classification of channels beyond the normal form.
\end{remark}

\subsection{Stinespring dilations}

Stinespring's theorem gives every channel a canonical dilation through an environment, and a minimal dilation is unique up to unitary. The statement is the second canonical-form theorem of the paper.

\begin{theorem}[Stinespring dilation]
\label{thm:stinespring}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be a channel. Then $\Phi$ admits a Stinespring dilation $(K, V)$ in the sense of \cref{def:channels}, and minimal dilations exist. Any two minimal dilations $(K, V)$ and $(K', V')$ of $\Phi$ are unitarily equivalent: there is a unitary $U: K \to K'$ with $(I_m \otimes U) V = V'$. The dimension $\dim K$ of a minimal dilation equals the Kraus rank of $\Phi$.
\end{theorem}

\begin{proof}
Take a Kraus presentation $\Phi(X) = \sum_{k=1}^{r} A_k X A_k^*$ as in \cref{thm:kraus}, with $r$ the Choi rank. Set $K = \mathbb{C}^r$ and define $V: \mathbb{C}^n \to \mathbb{C}^m \otimes K$ by $V \psi = \sum_{k=1}^{r} (A_k \psi) \otimes e_k$ for the standard basis $e_k$ of $K$. Then $V^* V = \sum_k A_k^* A_k = I_n$ because $\Phi$ preserves trace, so $V$ is an isometry, and $\operatorname{Tr}_K(V X V^*) = \sum_k A_k X A_k^* = \Phi(X)$. A dilation on a space of dimension less than $r$ would yield a Kraus presentation with fewer than $r$ operators, which \cref{thm:kraus} forbids, so this dilation is minimal. For uniqueness, both $K$ and $K'$ are spanned by vectors of the form $(w^* \otimes I) V \psi$ and $(w^* \otimes I) V' \psi$ with $w \in \mathbb{C}^m$ and $\psi \in \mathbb{C}^n$, the correspondence between these vectors preserves inner products because both dilations realize the same map $\Phi$, and it extends to a unitary $U: K \to K'$ with $(I_m \otimes U) V = V'$. For completely positive unital maps on a general $C^*$-algebra the dual picture holds: $\Phi(a) = V^* \pi(a) V$ with $\pi$ a unital $*$-representation and $V$ an isometry, which is Stinespring's original form.
\end{proof}

\begin{remark}[Two pictures]
\label{rem:pictures}
Channels appear in two standard forms. In the Schr\"odinger picture a channel is completely positive and trace preserving, acting on states and dilating through an environment as in \cref{def:channels}. In the Heisenberg picture a channel is a unital completely positive map of observable algebras, and its Stinespring form is the compression $\Phi(a) = V^* \pi(a) V$ named at the end of \cref{thm:stinespring}. The two pictures are related by adjunction, the dilation statements hold in either, and the invariant content is the same.
\end{remark}

For channels on matrix algebras the minimal dilation is finite-dimensional and the unitary freedom of \cref{thm:stinespring} is exactly the change-of-presentation freedom of Kraus operators.

\begin{proposition}[Kraus rank is a normal-form invariant]
\label{prop:krausrank}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be a channel. The Kraus rank of $\Phi$ equals the rank of its Choi matrix, equals the minimal number of Kraus operators in any representation of $\Phi$, and equals the dimension of the environment $K$ in a minimal Stinespring dilation. The Kraus rank is preserved by unitary changes of Kraus presentation and by composition of $\Phi$ with unitary conjugations of domain and codomain. It is not a complete invariant of channels: two channels with equal Kraus rank need not be unitarily equivalent.
\end{proposition}

\begin{proof}
The equalities with the Choi rank and the minimal Kraus number are \cref{thm:kraus}; the equality with the minimal dilation dimension is the construction of \cref{thm:stinespring} specialized to matrix algebras. Unitary conjugation of the Kraus operators replaces each $A_i$ by $W A_i U^*$ with $U, W$ unitary and does not change the rank of the Choi matrix. For the negative statement take the channel family $\Phi_p$ of \cref{ex:depol}. Its Kraus rank is $4$ for every $p \in (0,1)$, its Choi eigenvalues $2(1-p)$ and $2p/3$ vary with $p$, and unitary equivalence of channels preserves the Choi spectrum. Distinct values of $p$ give inequivalent channels with equal Kraus rank.
\end{proof}

\begin{remark}[Prohibition recorded]
\label{rem:prohibition}
\Cref{prop:krausrank} records the exact boundary. Kraus rank may be used to compare normal forms of one channel and to detect minimality of a dilation. It may not be used as an isomorphism classification of channels, and no theorem of this paper treats it as one. The Kraus rank is an invariant of the minimal dilation layer of structure and carries no classification claim for the channel layer.
\end{remark}

\begin{proposition}[Composition of channels]
\label{prop:compose}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ and $\Psi: M_m(\mathbb{C}) \to M_p(\mathbb{C})$ be linear. Then
\[
J(\Psi \circ \Phi)_{(i\alpha),(j\beta)} = \sum_{k,l=1}^{m} J(\Phi)_{(ik),(jl)} \, J(\Psi)_{(k\alpha),(l\beta)},
\]
with composite indices as in \cref{lem:choi}. The right-hand side is the link product of $J(\Phi)$ and $J(\Psi)$: matrix multiplication of $J(\Phi)$ after partial transpose on the shared subsystem, contracted with $J(\Psi)$ along that subsystem. Composition of channels is therefore a link-product contraction, and the Choi matrix of a composite is determined by the Choi matrices of the factors.
\end{proposition}

\begin{proof}
Write $\Phi(E_{ij}) = \sum_{k,l} c^{ij}_{kl} E_{kl}$ and read $J(\Phi)_{(ik),(jl)} = c^{ij}_{kl}$ and $J(\Psi)_{(k\alpha),(l\beta)} = \Psi(E_{kl})_{\alpha\beta}$. The right-hand side of the claimed identity is then $\sum_{k,l} c^{ij}_{kl} \Psi(E_{kl})_{\alpha\beta} = \Psi(\Phi(E_{ij}))_{\alpha\beta}$, which is $J(\Psi \circ \Phi)_{(i\alpha),(j\beta)}$ by definition.
\end{proof}

\begin{remark}[What a channel classification would need]
\label{rem:channelclass}
A classification of channels up to unitary equivalence would need invariants separating the orbits of the unitary action $\{A_k\} \mapsto \{W A_k U^*\}$ on Kraus presentations. The Choi spectrum is one such invariant and is not complete, as \cref{ex:depol} shows at the level of spectra alone; the orbit data of a presentation involves the arrangement of its Kraus vectors in $\mathbb{C}^n \otimes \mathbb{C}^m$ beyond their Gram matrix. No complete set of orbit invariants is on record, and this is the fourth open problem of \cref{sec:regimes}.
\end{remark}

\section{Tensor categories and superselection}
\label{sec:tensor}

Superselection sectors of a quantum field theory organize into tensor categories, and two reconstruction theorems classify such categories under explicit hypotheses. The hypotheses are load-bearing: both theorems fail or become open when they are dropped, and one equivalence-negligible layer turns out to carry the group.

\begin{definition}[Superselection category]
\label{def:dhr}
Fix a local net of observable algebras satisfying the Haag-Kastler axioms and the DHR selection criterion: representations that are equivalent to the vacuum representation on the algebra of every causally disconnected region. Under Haag duality these representations correspond to localized transportable endomorphisms of the observable algebra, and their intertwiners form a symmetric tensor $*$-category with conjugates, direct sums, and subobjects.
\end{definition}

The tensor structure of that category is concrete. Composition of endomorphisms supplies the tensor product, intertwiners supply the morphisms, conjugate endomorphisms supply duals, and the statistics of composing an endomorphism with itself distinguishes bosonic from fermionic sectors. Haag duality is the step that passes from representations to endomorphisms, and the selection criterion is what bounds the sectors; modified selection rules change the category.

\begin{theorem}[Doplicher-Roberts reconstruction]
\label{thm:dr}
Let $\mathcal{C}$ be a symmetric tensor $*$-category with conjugates, direct sums, and subobjects, and with $\operatorname{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent, as a symmetric tensor $*$-category, to the category of finite-dimensional unitary representations of a compact supergroup $G$, and $G$ is unique up to isomorphism.
\end{theorem}

\Cref{thm:dr} is stated with its hypotheses on the face of the statement. The symmetric structure, the existence of conjugates, and the scalar endomorphism ring of the unit are each used in the proof; a category missing them lies outside the theorem. The reconstruction of the gauge group from superselection data is the completion of the Doplicher-Haag-Roberts analysis, and the supergroup grading accounts for fermionic sectors.

\begin{remark}[Selection criteria matter]
\label{rem:selection}
The DHR criterion selects representations with trivial behaviour at infinity. Long-range forces such as electromagnetism violate the criterion, and the resulting categories fall outside \cref{thm:dr} unless the analysis is redone with modified selection rules. A classification claim for superselection categories is therefore always relative to the selection criterion in force.
\end{remark}

\begin{remark}[What reconstruction does not do]
\label{rem:scope}
The Doplicher-Roberts theorem recovers a symmetry group from sector data. It does not recover spacetime, dynamics, or states, and it does not classify the systems whose sectors are being read.
\end{remark}

\begin{theorem}[Deligne]
\label{thm:deligne}
Let $\mathcal{C}$ be a $\mathbb{C}$-linear, abelian, rigid symmetric tensor category over $\mathbb{C}$ of subexponential growth, with $\operatorname{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent, as a symmetric tensor category, to the category of finite-dimensional representations of an affine supergroup scheme. In particular the category is Tannakian in the super sense.
\end{theorem}

Deligne's theorem classifies a purely categorical hypothesis class, without reference to any net of observables. The two reconstruction theorems differ in their inputs and agree in their outputs. The Doplicher-Roberts theorem starts from the sectors of a net of observables, so its hypotheses are analytic as well as categorical: Haag duality, the selection criterion, and the tensor structure of intertwiners. Deligne's theorem starts from $\mathbb{C}$-linearity, abelianness, rigidity, symmetry, and subexponential growth. Both conclusions are representation categories of supergroups, so the two theorems are the analytic and the categorical face of one reconstruction pattern, and neither classifies the systems whose sectors or categories are being read. Together \cref{thm:dr,thm:deligne} settle the classification of the symmetric categories that appear as superselection data, and of the finite-growth categories that appear in low-dimensional and combinatorial models. The case of fusion categories (finitely many simple objects, semisimple, finite categorical dimension) is open beyond these hypotheses.

\begin{proposition}[Etingof-Gelaki counterexample]
\label{prop:eg}
There exist finite non-isomorphic groups $G_1$ and $G_2$ whose representation categories over $\mathbb{C}$ are equivalent as tensor categories, but not as symmetric tensor categories. Consequently an equivalence of tensor categories that forgets the symmetric structure cannot recover the group, and any classification of such categories built on that equivalence is false.
\end{proposition}

\begin{proof}
Etingof and Gelaki exhibit the affine symplectic group of a vector space over the field of two elements and a corresponding affine pseudosymplectic group: these are non-isomorphic and isocategorical, meaning their representation categories are monoidally equivalent. The symmetric structure of the two categories differs, and Tannaka reconstruction for symmetric tensor categories recovers the group from the symmetric structure alone. The symmetric layer is therefore load-bearing in the sense of \cref{def:preserved}, and an equivalence that discards it identifies objects that the classification must separate.
\end{proof}

\begin{remark}[Equivalence discipline]
\label{rem:egdiscipline}
Any equivalence of tensor categories must declare the layers it preserves. The standing qualification on relational characterizations applies in full: ``Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.''
\end{remark}

\begin{remark}[Fusion categories]
\label{rem:fusion}
Every fusion category is the representation category of a weak Hopf algebra, a result obtained through the module-category machinery of Ostrik, and this gives a presentation theorem rather than a classification. The structural conjectures of Etingof, Nikshych, and Ostrik, in particular the existence of a coherent monoidal isomorphism $A \cong A^{**}$ for every fusion category $A$, remain open, and this paper states all fusion-category claims as conditional on those conjectures.
\end{remark}

\section{Monotone metrics on quantum states}
\label{sec:metrics}

The measure-theoretic family contributes the third invariant type of the paper, and the quantum case is where a classical uniqueness theorem becomes a parametric classification.

\begin{definition}[Monotone metric]
\label{def:monotone}
Let $\mathcal{D}_n$ denote the manifold of strictly positive density matrices of $M_n(\mathbb{C})$, an open subset of the affine space of self-adjoint trace-one matrices, with tangent space $T_\rho \mathcal{D}_n$ the space of self-adjoint traceless matrices at $\rho$. A monotone metric assigns to each $\rho \in \mathcal{D}_n$ an inner product on $T_\rho \mathcal{D}_n$ such that the metric decreases under every completely positive trace-preserving map. In the classical setting the corresponding notion is monotonicity under stochastic maps.
\end{definition}

\begin{remark}[Classical uniqueness]
\label{rem:chentsov}
Chentsov's theorem classifies monotone metrics on the simplex of probability distributions: the Fisher metric is the unique metric, up to a positive constant, that decreases under every stochastic map. The quantum statement of \cref{thm:petz} replaces uniqueness by a parametric family, and no rescaling recovers a unique quantum metric. The contrast is the quantum instance of a classical-to-quantum gap that runs through the series: uniqueness statements on the classical side do not transfer.
\end{remark}

\begin{theorem}[Petz]
\label{thm:petz}
Monotone metrics on $\mathcal{D}_n$ are in bijection with operator monotone functions $f: (0,\infty) \to (0,\infty)$ that satisfy the symmetry condition $f(t) = t f(1/t)$ and the normalization $f(1) = 1$. Given such a function $f$, the corresponding metric on the tangent space $T_\rho \mathcal{D}_n$ is
\[
g_\rho^f(A, B) = \operatorname{Tr}\Bigl(A^* \bigl[R_\rho \, f(L_\rho R_\rho^{-1})\bigr]^{-1}(B)\Bigr),
\]
where $L_\rho$ and $R_\rho$ are the left and right multiplication operators by $\rho$ on $M_n(\mathbb{C})$. Distinct normalized operator monotone functions give distinct monotone metrics.
\end{theorem}

\begin{proof}[Status of the proof]
The classification is Petz's theorem. The condition $f(t) = t f(1/t)$ is the symmetry of the resulting form under exchange of $A$ and $B$, and the normalization $f(1) = 1$ fixes the scale: without it every positive scalar multiple of $f$ satisfies the symmetry condition and rescales the metric, and the correspondence is not a bijection. Distinct normalized functions give distinct metrics already on $2 \times 2$ density matrices. The proof is an operator-geometric argument in monotone matrix theory and is not reproduced here. The parametric conclusion is recorded in the sources of Petz and of Petz-Sudar, who construct and compare explicit members of the family and state the contrast with Chentsov uniqueness outright.
\end{proof}

\begin{corollary}[Parametricity of the quantum invariant]
\label{cor:parametric}
The monotone metrics of quantum states are classified by a continuous parameter (the normalized operator monotone function), not by a discrete choice. There is no quantum analogue of Chentsov uniqueness, and any classification statement for quantum monotone metrics must accept a parametric invariant in place of a unique object.
\end{corollary}

\begin{example}[Two standard metrics]
\label{ex:metrics}
The function $f(t) = (1 + t)/2$ is operator monotone and satisfies $f(1) = 1$ and $f(t) = t f(1/t)$. In the eigenbasis of $\rho$ with eigenvalues $\lambda_i$ its metric reads $g_\rho(A, A) = \sum_{i,j} 2 |A'_{ij}|^2 / (\lambda_i + \lambda_j)$ with $A' = U^* A U$, which is the metric of the symmetric logarithmic derivative. The function $f(t) = (1 + \sqrt{t})^2 / 4$ again satisfies both conditions and yields the Wigner-Yanase metric. The two metrics coincide on tangent directions commuting with $\rho$ and differ on every self-adjoint traceless direction with an off-diagonal entry in the eigenbasis of $\rho$, which is \cref{cor:parametric} in concrete form.
\end{example}

\begin{remark}[Distinguishability]
\label{rem:distinguish}
A monotone metric measures how fast nearby states separate under measurements, and monotonicity makes the separation decrease under every channel. Choosing a metric amounts to choosing a convention for statistical distance on quantum states, and \cref{thm:petz} shows the choice is a continuous parameter. Any classification or equivalence statement that uses statistical distance on quantum states must carry the parameter of \cref{cor:parametric} or fix it explicitly.
\end{remark}

\section{Classification regimes}
\label{sec:regimes}

Three regimes hold among the quantum classification problems: complete classification under stated hypotheses, uncountably many classes admitting no finite list of types, and open problems. \Cref{tab:regimes} records each domain with its invariant and source theorem.

\begin{table}[ht]
\centering
\caption{Classification regimes for quantum systems, with the invariant in force and the standing of each row.}
\label{tab:regimes}
\small
\begin{tabularx}{\textwidth}{@{}Y Y Y Y@{}}
\toprule
Domain & Invariant & Standing & Source \\
\midrule
Finite-dimensional $C^*$-algebras & Dimension vector & Classified completely & \Cref{thm:findim} \\
Completely positive maps & Kraus rank and Choi matrix & Normal form only & \Cref{thm:kraus} \\
Minimal dilations & Unitary class of the dilation & Classified completely & \Cref{thm:stinespring} \\
Amenable factors & Murray-von Neumann type and Connes invariants & Classified completely & \Cref{thm:amenable} \\
General $\mathrm{II}_1$ factors & Continuum many isomorphism classes & No finite list of types & \Cref{thm:mcduff} \\
Symmetric tensor categories under the hypotheses of \cref{thm:deligne} & Underlying supergroup & Classified completely & \Cref{thm:dr,thm:deligne} \\
Tensor equivalence without symmetric structure & None can recover the group & Proved insufficient & \Cref{prop:eg} \\
Monotone metrics on quantum states & Operator monotone function & Parametric classification & \Cref{thm:petz} \\
Fusion categories & Weak Hopf presentation & Open & \Cref{rem:fusion} \\
Non-amenable type $\mathrm{III}$ factors & Connes strata only & Open & \Cref{rem:typeIII} \\
Channels up to isomorphism & Kraus rank is not complete & Open & \Cref{rem:prohibition} \\
\bottomrule
\end{tabularx}
\end{table}

The regimes show a pattern the rest of the series exploits. Classification is complete exactly where the invariant is discrete or parametric and the hypotheses are stated; finite lists stop where the structure theory manufactures uncountably many non-isomorphic objects; and the question is open where a presentation theorem exists but the invariants do not separate. The finite-dimensional theory and the amenable theory differ in technique but agree in shape: both reduce a system to a list of standard pieces plus invariant data. The McDuff obstruction marks where that shape cannot persist.

Five kinds of classification result appear in \cref{tab:regimes}. The dimension-vector classification is complete and parameterized, in the manner of the Dynkin classification of semisimple Lie algebras. The amenable factor classification is complete and analytic, its invariants computed from operator-algebraic structure rather than read off combinatorial data. The monotone-metric classification is parametric, in the manner of a classification by continuous parameters.

The McDuff corollary is a complete obstruction: its classification content is the proof that no finite list exists. The remaining rows are open problems with presentation theorems but no separating invariants. These five kinds separate cleanly, and a quantum classification claim that mixes two of them is misstated.

Five open problems bound the current frontier.
\begin{enumerate}
\item The Elliott program for separable simple nuclear $C^*$-algebras lacks a finished classification statement with its universal coefficient theorem resolved.
\item The structural conjectures for fusion categories, beginning with coherent double-dual isomorphisms, are unproved, and every fusion-category claim in this paper is conditional on them.
\item The structure of non-amenable type $\mathrm{III}$ factors beyond the Connes strata is open.
\item No isomorphism classification of quantum channels exists beyond the Stinespring normal form, and \cref{prop:krausrank} shows that the obvious invariant does not provide one.
\item Whether any restricted classification of non-amenable $\mathrm{II}_1$ factors survives under rigidity hypotheses is not addressed by the sources consulted here and is recorded as open.
\end{enumerate}

\section{Computational evidence}
\label{sec:computation}

The source files that accompany this paper as supplementary material contain executable models and three experiment scripts; they live in the directory \path{src/vol-06-quantum-systems/}. They are computational evidence for the finite-dimensional and channel statements. They are not proofs, and no part of the paper rests on them for validity.

The Haskell module \path{Instances.hs} instantiates the taxonomy classes for this paper's physical systems: finite-dimensional block algebras, Hilbert-space systems with observable algebras, operator-algebra systems with factor data, quantum channels with Kraus data, and superselection categories with tensor data. The instances cover the system-record class, the Hilbert-space and operator-algebra family class, the probability and measure family class on the quantum side, the tensor-category family class, the construction and decomposition hooks, irreducibility of matrix blocks under direct sum, and mathematical equivalence of block algebras by dimension vector. The instances name their methods after the definitions and theorem targets of this paper (dimension vector, minimal Kraus rank, Stinespring minimal dilation, operator monotone parameter). These are executable models of the taxonomy, validated against the statements of the paper; no machine-checked formalization is claimed for them.

Three Python scripts carry the finite-dimensional experiments. The first enumerates small finite-dimensional $C^*$-algebras by dimension vector and checks the counting statement of \cref{cor:count} and the isomorphism criterion of \cref{thm:findim}. The second constructs Choi matrices of sample channels, computes Kraus ranks, minimizes Kraus presentations, and exhibits channels of equal Kraus rank that no unitary identification matches, evidencing \cref{prop:krausrank}. The third builds monotone metrics from normalized operator monotone functions on $2 \times 2$ density matrices, checks positivity of the resulting forms, and confirms that distinct functions give distinct metrics, evidencing \cref{thm:petz} and \cref{cor:parametric}. Each script prints its checks and exits nonzero on failure. \Cref{tab:results} records the checks of a recorded run.

\begin{table}[ht]
\centering
\caption{Checks and recorded outputs of the three experiment scripts in a single run.}
\label{tab:results}
\small
\begin{tabularx}{\textwidth}{@{}Y Y Y@{}}
\toprule
Script & Check & Recorded output \\
\midrule
\path{finite_dim_cstar_decomposition.py} & Isomorphism criterion on all algebras up to dimension 16 & No failures \\
\path{finite_dim_cstar_decomposition.py} & Algebra counts per dimension & Matches \cref{tab:counts} through $d = 12$ \\
\path{finite_dim_cstar_decomposition.py} & Tensor products multiply block sizes & $\{2, 3\} \otimes \{2\} = \{4, 6\}$ \\
\path{stinespring_kraus_rank.py} & Choi rank of the channel family of \cref{ex:depol} & Rank 4 at all sampled $p$ \\
\path{stinespring_kraus_rank.py} & Minimal Kraus presentation preserves the channel & Four operators, channel preserved \\
\path{stinespring_kraus_rank.py} & Unitary invariance of Kraus rank & Rank preserved \\
\path{petz_monotone_metrics.py} & Positivity of Petz forms on sampled tangent vectors & Minimum sampled value 0.5755 \\
\path{petz_monotone_metrics.py} & Distinct functions give distinct metrics & Distinct on all samples \\
\bottomrule
\end{tabularx}
\end{table}

Appendix~\ref{app:code} maps every computational claim of the paper to the file and function that evidences it.

\section{Discussion}
\label{sec:discussion}

Three complete classifications cover finite-dimensional observable algebras, amenable factors, and symmetric tensor categories under stated hypotheses. Finite-dimensional observable algebras are classified by dimension vector with a self-contained proof. Amenable factors are classified by Murray-von Neumann type and Connes invariants with proofs in the literature of Murray-von Neumann, Connes, and Haagerup. Symmetric tensor categories under the hypotheses of Deligne and Doplicher-Roberts are classified by the underlying supergroup. Beyond these, the general $\mathrm{II}_1$ factors admit no finite list of types, and the classification question changes shape there from listing objects to delimiting the classifiable classes.

Three limitations bound the results. The first is exactness of equivalence. Every classification here is up to an equivalence that preserves named layers of structure, and \cref{prop:eg} shows that dropping the symmetric layer changes the answer. The classification of mathematical representations is therefore always relative to the preserved structure, and none of it establishes physical equivalence of the systems the representations describe. The second limitation is hypothesis dependence. \Cref{thm:dr,thm:deligne} hold under conjugates, direct sums, subobjects, scalar endomorphisms of the unit, and in Deligne's case $\mathbb{C}$-linearity, abelianness, rigidity, and subexponential growth in characteristic zero; relaxed selection criteria or growth hypotheses leave the classified regime. The third limitation is depth of the record. The finite-dimensional proofs are given in full here; the operator-algebraic and categorical proofs are established in the sources cited and are not reproduced, and the claim on each is only as strong as those sources.

The parametric result of \cref{sec:metrics} deserves separate emphasis because it constrains future work. Quantum monotone metrics are classified by a continuous parameter, so any proposed uniqueness statement for quantum information geometry must either fix the parameter or weaken to the parametric family. Extending classical uniqueness statements across the classical-to-quantum boundary is not a defensible move.

The three complete classifications instantiate the three structural families of the quantum domain with their classifying invariants in place: Hilbert spaces and operator algebras through the dimension vector and the Murray-von Neumann type with Connes invariants, probability and measure structure through the operator monotone parameter, and tensor categories through the underlying supergroup of a symmetric tensor category. The McDuff obstruction joins the register of non-classification theorems, and the Etingof-Gelaki counterexample fixes the equivalence discipline for any later classification by tensor data. The evidence for the program's target statement is therefore mixed: restricted-class theorems exist in quantum theory, and obstruction theorems mark exactly where they stop.

No theorem here states that any two of the structural families used above are logically independent, and no theorem here establishes physical or empirical equivalence of any two systems. The long-term classification target of the program remains a research objective; the results of this paper are consistent with it in the classified islands and constrain it by theorem in the non-classifiable ocean. The open problems of \cref{sec:regimes} are the natural restricted-class targets next, and each has the shape of a solved problem: a named class, a declared equivalence, and an invariant that either separates or provably cannot.

A complete quantum classification program would need three further deliverables, and this paper supplies none of them. It would need a normal form for channels that upgrades to a classification under a named equivalence, a structure theory for fusion categories that decides the double-dual coherence question, and a restricted classification of non-amenable factors under explicit rigidity hypotheses. Each deliverable is a classification problem of the same shape as the solved ones, and the obstructions recorded here bound what any solution can claim.

\section{Conclusion}

Quantum physical systems admit classification by dimension vector in finite dimension, by Murray-von Neumann type and Connes invariants on the amenable side of operator algebra, and by underlying supergroup in the symmetric tensor categories of superselection theory. Completely positive maps admit a minimal Stinespring normal form whose Kraus rank is not a channel classification. Quantum monotone metrics are parametric, classified by operator monotone functions rather than by a unique metric. Against these classifications stands the McDuff obstruction: uncountably many separable $\mathrm{II}_1$ factors exist, so no finite list of factor types is exhaustive and no CFSG-style list exists outside restricted classes. The open problems of the Elliott program, fusion-category structure, non-amenable type $\mathrm{III}$ strata, and channel isomorphism define the current frontier. The supplementary code records the finite-dimensional content as computational evidence and nothing more.

The negative results are part of the answer. The McDuff obstruction and the Etingof-Gelaki counterexample say where classification stops and which layers of structure carry it, and a classification program that records only its successes would misreport the state of the subject.

\appendix
\section{Code evidence}
\label{app:code}

\Cref{tab:code} maps each computational claim of the paper to the file and function that evidences it in \path{src/vol-06-quantum-systems/}.

\begin{table}[ht]
\centering
\caption{Code evidence for the computational claims, with the file and function that demonstrate each claim.}
\label{tab:code}
\small
\begin{tabularx}{\textwidth}{@{}Y Y Y@{}}
\toprule
Claim & File & Function \\
\midrule
Isomorphism criterion matches enumerated classes up to dimension 16 & \path{finite_dim_cstar_decomposition.py} & \path{isomorphism_criterion} \\
Algebra counts match \cref{cor:count} & \path{finite_dim_cstar_decomposition.py} & \path{classify_by_dimension} \\
Tensor products multiply block sizes & \path{finite_dim_cstar_decomposition.py} & \path{tensor_dimension_vector} \\
Kraus rank equals Choi rank & \path{stinespring_kraus_rank.py} & \path{kraus_rank} \\
Minimal Kraus presentations reduce correctly & \path{stinespring_kraus_rank.py} & \path{minimize_kraus} \\
Equal Kraus rank does not classify channels & \path{stinespring_kraus_rank.py} & \path{same_rank_distinct_channels} \\
Petz forms are positive on sampled tangent vectors & \path{petz_monotone_metrics.py} & \path{check_monotone_positive} \\
Distinct functions give distinct metrics & \path{petz_monotone_metrics.py} & \path{distinct_functions_distinct_metrics} \\
Taxonomy instances cover the volume's systems & \path{Instances.hs} & instance declarations \\
\bottomrule
\end{tabularx}
\end{table}

The experiments reproduce by running each script under \path{src/vol-06-quantum-systems/} with Python 3, and the taxonomy layer compiles against the shared classes in \path{src/Taxonomy/}.

\begin{thebibliography}{20}

\bibitem{murphy1990}
G. J. Murphy, \emph{C*-Algebras and Operator Theory}, Academic Press, Boston, 1990.

\bibitem{mvn1943}
F. J. Murray and J. von Neumann, On rings of operators. IV, \emph{Ann. of Math.} \textbf{44} (1943), 716-808. DOI 10.2307/1969107.

\bibitem{connes1973}
A. Connes, Une classification des facteurs de type III, \emph{Ann. Sci. \'Ecole Norm. Sup.} \textbf{6} (1973), 133-252. DOI 10.24033/asens.1247.

\bibitem{connes1976}
A. Connes, Classification of injective factors. Cases $\mathrm{II}_1$, $\mathrm{II}_\infty$, $\mathrm{III}_\lambda$, $\lambda \neq 1$, \emph{Ann. of Math.} \textbf{104} (1976), 73-115. DOI 10.2307/1971057.

\bibitem{haagerup1987}
U. Haagerup, Connes' bicentralizer problem and uniqueness of the injective factor of type $\mathrm{III}_1$, \emph{Acta Math.} \textbf{158} (1987), 95-148. DOI 10.1007/BF02392257.

\bibitem{toms2008}
A. S. Toms, On the classification problem for nuclear $C^*$-algebras, arXiv:math/0509103; \emph{Ann. of Math.} \textbf{167} (2008), 1029-1044.

\bibitem{mcduff1969}
D. McDuff, Uncountably many $\mathrm{II}_1$ factors, \emph{Ann. of Math.} \textbf{90} (1969), 372-377. DOI 10.2307/1970730.

\bibitem{stinespring1955}
W. F. Stinespring, Positive functions on $C^*$-algebras, \emph{Proc. Amer. Math. Soc.} \textbf{6} (1955), 211-216. DOI 10.1090/S0002-9939-1955-0069403-4.

\bibitem{choi1975}
M.-D. Choi, Completely positive linear maps on complex matrices, \emph{Linear Algebra Appl.} \textbf{10} (1975), 285-290. DOI 10.1016/0024-3795(75)90075-0.

\bibitem{kraus1983}
K. Kraus, \emph{States, Effects, and Operations: Fundamental Notions of Quantum Theory}, Lecture Notes in Physics, vol. 190, Springer, Berlin, 1983. DOI 10.1007/3-540-12732-1.

\bibitem{dhr1969a}
S. Doplicher, R. Haag, and J. E. Roberts, Fields, observables and gauge transformations. I, \emph{Comm. Math. Phys.} \textbf{13} (1969), 1-23. DOI 10.1007/BF01645267.

\bibitem{dhr1969b}
S. Doplicher, R. Haag, and J. E. Roberts, Fields, observables and gauge transformations. II, \emph{Comm. Math. Phys.} \textbf{15} (1969), 173-200. DOI 10.1007/BF01645674.

\bibitem{dr1989}
S. Doplicher and J. E. Roberts, A new duality theory for compact groups, \emph{Invent. Math.} \textbf{98} (1989), 157-218. DOI 10.1007/BF01388849.

\bibitem{dr1990}
S. Doplicher and J. E. Roberts, Why there is a field algebra with a compact gauge group describing the superselection structure in particle physics, \emph{Comm. Math. Phys.} \textbf{131} (1990), 51-107. DOI 10.1007/BF02097680.

\bibitem{deligne2002}
P. Deligne, Cat\'egories tensorielles, \emph{Mosc. Math. J.} \textbf{2} (2002), 227-248. DOI 10.17323/1609-4514-2002-2-2-227-248.

\bibitem{eg2001}
P. Etingof and S. Gelaki, Isocategorical groups, arXiv:math/0007196.

\bibitem{ostrik2003}
V. Ostrik, Module categories, weak Hopf algebras and modular invariants, arXiv:math/0111139; \emph{Transform. Groups} \textbf{8} (2003), 177-206. DOI 10.1007/s00031-003-0515-6.

\bibitem{eno2005}
P. Etingof, D. Nikshych, and V. Ostrik, On fusion categories, arXiv:math/0203060; \emph{Ann. of Math.} \textbf{162} (2005), no. 2, 581-642. DOI 10.4007/annals.2005.162.581.

\bibitem{petz1996}
D. Petz, Monotone metrics on matrix spaces, \emph{Linear Algebra Appl.} \textbf{244} (1996), 81-96. DOI 10.1016/0024-3795(94)00211-8.

\bibitem{petzsudar2001}
D. Petz and Cs. Sud\'ar, Extending the Fisher metric to density matrices, in \emph{Geometry in Present Days Science} (O. E. Barndorff-Nielsen and E. B. Vendel Jensen, eds.), World Scientific, 1999, pp. 21-34; arXiv:quant-ph/0102132.

\end{thebibliography}

\end{document}

exec
/usr/local/bin/zsh -lc 'cat src/vol-06-quantum-systems/petz_monotone_metrics.py' in /Users/mlong/Documents/Development/classification-physical-systems
exec
/usr/local/bin/zsh -lc 'cat src/vol-06-quantum-systems/stinespring_kraus_rank.py' in /Users/mlong/Documents/Development/classification-physical-systems
exec
/usr/local/bin/zsh -lc 'cat src/vol-06-quantum-systems/Instances.hs' in /Users/mlong/Documents/Development/classification-physical-systems
exec
/usr/local/bin/zsh -lc 'cat src/vol-06-quantum-systems/finite_dim_cstar_decomposition.py' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D experiment for vol-06-quantum-systems.

Evidences (computational evidence only, never proof):
  - Paper Theorem 8.3: the Petz metric built from a normalized operator
    monotone function is a positive definite form on tangent vectors
    (function `check_monotone_positive`).
  - Paper Corollary 8.4: distinct normalized operator monotone functions give
    distinct monotone metrics (function `distinct_functions_distinct_metrics`).
"""

from __future__ import annotations

import numpy as np

TOL = 1e-12

# Operator monotone functions satisfying the Petz conditions:
# symmetry f(t) = t f(1/t) and normalization f(1) = 1 (paper, Theorem 8.3).
OPERATOR_MONOTONE = {
    "f_mid": lambda t: (1.0 + t) / 2.0,
    "f_rec": lambda t: 2.0 * t / (1.0 + t),
    "f_wy": lambda t: (1.0 + t ** 0.5) ** 2 / 4.0,
}


def is_normalized(f, samples=(0.1, 0.5, 1.0, 2.0, 7.0)):
    """Check the Petz conditions f(1) = 1 and f(t) = t f(1/t)."""
    if abs(f(1.0) - 1.0) > 1e-12:
        return False
    return all(abs(f(t) - t * f(1.0 / t)) < 1e-12 for t in samples)


def petz_metric(rho, A, f):
    """Petz metric g_rho^f(A, A) for Hermitian tangent vectors.

    In the eigenbasis of rho with eigenvalues lambda_i the form is
    g(A, A) = sum_ij |A'_ij|^2 / (lambda_j f(lambda_i / lambda_j)),
    with A' = U^* A U (paper, Theorem 8.1).
    """
    lam, U = np.linalg.eigh(rho)
    if np.any(lam <= TOL):
        raise ValueError("rho must be full rank")
    A_prime = U.conj().T @ A @ U
    g = 0.0
    for i in range(len(lam)):
        for j in range(len(lam)):
            weight = lam[j] * f(lam[i] / lam[j])
            g += abs(A_prime[i, j]) ** 2 / weight
    return float(g.real)


def random_density_matrix(dim, rng):
    Z = rng.normal(size=(dim, dim)) + 1j * rng.normal(size=(dim, dim))
    rho = Z @ Z.conj().T
    return rho / np.trace(rho)


def random_hermitian(dim, rng):
    """A random tangent vector: self-adjoint and traceless (paper, Definition 8.1)."""
    Z = rng.normal(size=(dim, dim)) + 1j * rng.normal(size=(dim, dim))
    A = (Z + Z.conj().T) / 2.0
    return A - np.trace(A) / dim * np.eye(dim)


def check_monotone_positive(rng, trials=25):
    """g(A, A) > 0 for every nonzero tangent vector A and every sampled rho.
    Structural support: every Petz weight 1/(lambda_j f(lambda_i/lambda_j)) is
    checked positive on the sampled spectra as well."""
    worst = None
    for name, f in OPERATOR_MONOTONE.items():
        if not is_normalized(f):
            return False, f"{name} fails normalization"
        for _ in range(trials):
            rho = random_density_matrix(2, rng)
            lam = np.linalg.eigvalsh(rho)
            for li in lam:
                for lj in lam:
                    if lj * f(li / lj) <= TOL:
                        return False, f"{name}: non-positive Petz weight"
            A = random_hermitian(2, rng)
            if np.linalg.norm(A) < TOL:
                continue
            g = petz_metric(rho, A, f)
            if worst is None or g < worst:
                worst = g
            if g <= 0:
                return False, f"{name}: non-positive value {g}"
    return True, f"weights positive and minimum sampled value {worst:.6f}"


def distinct_functions_distinct_metrics(rng, trials=10):
    """Distinct normalized operator monotone functions give distinct metrics
    on the same tangent vector (paper, Corollary 8.2)."""
    values = {name: [] for name in OPERATOR_MONOTONE}
    for _ in range(trials):
        rho = random_density_matrix(2, rng)
        A = random_hermitian(2, rng)
        for name, f in OPERATOR_MONOTONE.items():
            values[name].append(petz_metric(rho, A, f))
    distinct = all(
        not np.allclose(values[a], values[b])
        for a, b in (("f_mid", "f_rec"), ("f_mid", "f_wy"), ("f_rec", "f_wy"))
    )
    return distinct, values


def check_claims():
    failures = []
    rng = np.random.default_rng(20261029)

    ok, detail = check_monotone_positive(rng)
    print(f"check_monotone_positive: {detail}")
    if not ok:
        failures.append(detail)

    distinct, values = distinct_functions_distinct_metrics(rng)
    print(f"distinct_functions_distinct_metrics: distinct={distinct}")
    for name, vals in values.items():
        print(f"  {name}: sample values {np.round(vals[:3], 6)}")
    if not distinct:
        failures.append("two operator monotone functions induced the same metric")

    if failures:
        for line in failures:
            print("FAIL:", line)
        raise SystemExit(1)
    print("ALL CHECKS PASSED")


if __name__ == "__main__":
    check_claims()

 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D experiment for vol-06-quantum-systems.

Evidences (computational evidence only, never proof):
  - Paper Theorem 6.4 / Proposition 6.8: the Kraus rank of a channel equals
    the rank of its Choi matrix (function `kraus_rank`).
  - Paper Theorem 6.6 / Proposition 6.8: minimal Kraus presentations reduce
    correctly and match the minimal Stinespring dilation dimension
    (function `minimize_kraus`).
  - Paper Proposition 6.2: equal Kraus rank does not classify channels;
    channels of one rank can be inequivalent (function
    `same_rank_distinct_channels`).
"""

from __future__ import annotations

import numpy as np

TOL = 1e-9


def kraus_apply(kraus, X):
    """Phi(X) = sum_k A_k X A_k^*."""
    return sum(A @ X @ A.conj().T for A in kraus)


def choi_matrix(kraus):
    """Choi matrix J(Phi) = sum_ij E_ij tensor Phi(E_ij).

    With column-stacked vectors a_k = vec(A_k) this is J = sum_k a_k a_k^*.
    """
    A0 = np.asarray(kraus[0], dtype=complex)
    m, n = A0.shape
    J = np.zeros((n * m, n * m), dtype=complex)
    for A in kraus:
        a = np.asarray(A, dtype=complex).flatten(order="F")
        J += np.outer(a, a.conj())
    return J


def kraus_rank(kraus):
    """Minimal number of Kraus operators: the rank of the Choi matrix
    (paper, Theorem 6.4)."""
    J = choi_matrix(kraus)
    vals = np.linalg.eigvalsh((J + J.conj().T) / 2)
    return int(np.sum(vals > TOL))


def minimal_kraus_count_independent(kraus):
    """Minimal number of Kraus operators computed independently of the Choi
    matrix: the dimension of the span of the vectorized Kraus operators."""
    rows = np.array([np.asarray(A, dtype=complex).flatten() for A in kraus])
    return int(np.linalg.matrix_rank(rows))


def minimize_kraus(kraus):
    """A minimal Kraus presentation of the same channel, from the spectral
    decomposition of the Choi matrix (paper, Theorem 6.1)."""
    A0 = np.asarray(kraus[0], dtype=complex)
    m, n = A0.shape
    J = choi_matrix(kraus)
    vals, vecs = np.linalg.eigh((J + J.conj().T) / 2)
    out = []
    for lam, v in zip(vals, vecs.T):
        if lam > TOL:
            out.append(np.sqrt(lam) * v.reshape((m, n), order="F"))
    return out


def depolarizing_kraus(p):
    """Kraus presentation of a one-parameter qubit channel family with
    full Choi rank 4 for 0 < p < 1: A0 = sqrt(1-p) I, Ai = sqrt(p/3) sigma_i."""
    I = np.eye(2, dtype=complex)
    sx = np.array([[0, 1], [1, 0]], dtype=complex)
    sy = np.array([[0, -1j], [1j, 0]], dtype=complex)
    sz = np.array([[1, 0], [0, -1]], dtype=complex)
    return [np.sqrt(1 - p) * I] + [np.sqrt(p / 3) * S for S in (sx, sy, sz)]


def choi_spectrum(kraus):
    """Sorted eigenvalues of the Choi matrix; a unitary-equivalence invariant
    of the channel."""
    J = choi_matrix(kraus)
    vals = np.linalg.eigvalsh((J + J.conj().T) / 2)
    return np.sort(vals)


def random_unitary(dim, rng):
    Z = rng.normal(size=(dim, dim)) + 1j * rng.normal(size=(dim, dim))
    Q, R = np.linalg.qr(Z)
    d = np.diagonal(R)
    return Q * (d / np.abs(d))


def check_rank_invariance(rng):
    """Unitary conjugation of Kraus presentations preserves the Choi rank."""
    kraus = depolarizing_kraus(0.37)
    U = random_unitary(2, rng)
    W = random_unitary(2, rng)
    conjugated = [W @ A @ U.conj().T for A in kraus]
    return kraus_rank(kraus) == kraus_rank(conjugated)


def same_rank_distinct_channels():
    """Channels of equal Kraus rank whose Choi spectra differ, hence no unitary
    identification matches them (paper, Proposition 6.8)."""
    profiles = {}
    ranks = {}
    for p in (0.2, 0.5, 0.8):
        kraus = depolarizing_kraus(p)
        ranks[p] = kraus_rank(kraus)
        profiles[p] = choi_spectrum(kraus)
    equal_rank = len(set(ranks.values())) == 1
    distinct = all(
        not np.allclose(profiles[a], profiles[b])
        for a, b in ((0.2, 0.5), (0.2, 0.8), (0.5, 0.8))
    )
    return equal_rank, distinct, ranks, profiles


def check_claims():
    failures = []
    rng = np.random.default_rng(20261029)

    # Claim 1: Kraus rank equals Choi rank on the family and on random
    # presentations with zero operators added (zeros do not change the map).
    # The equality is checked two independent ways: the Choi eigenvalue count
    # and the span dimension of the vectorized Kraus operators.
    for p in (0.1, 0.37, 0.6, 0.9):
        kraus = depolarizing_kraus(p)
        r = kraus_rank(kraus)
        expected = 4 if p < 1.0 else 1
        if r != expected:
            failures.append(f"depolarizing p={p}: rank {r}, expected {expected}")
        if minimal_kraus_count_independent(kraus) != r:
            failures.append(f"independent span count disagrees with Choi rank at p={p}")
        padded = kraus + [np.zeros((2, 2), dtype=complex)]
        if kraus_rank(padded) != r:
            failures.append(f"zero padding changed rank at p={p}")
    print("kraus_rank: Choi eigenvalue count and independent span count agree")

    # Claim 2: minimize_kraus reproduces the channel with exactly rank-many
    # operators.
    kraus = depolarizing_kraus(0.37) + [np.zeros((2, 2), dtype=complex)]
    small = minimize_kraus(kraus)
    if len(small) != kraus_rank(kraus):
        failures.append(
            f"minimize_kraus produced {len(small)} operators for rank "
            f"{kraus_rank(kraus)}"
        )
    for _ in range(5):
        X = rng.normal(size=(2, 2)) + 1j * rng.normal(size=(2, 2))
        if not np.allclose(kraus_apply(kraus, X), kraus_apply(small, X)):
            failures.append("minimize_kraus changed the channel")
    print(f"minimize_kraus: reduced to {len(small)} operators, channel preserved")

    # Claim 3: rank is invariant under unitary change of presentation.
    if not check_rank_invariance(rng):
        failures.append("unitary conjugation changed the Kraus rank")
    print("check_rank_invariance: rank preserved under unitary conjugation")

    # Claim 4: equal Kraus rank does not classify channels.
    equal_rank, distinct, ranks, profiles = same_rank_distinct_channels()
    if not equal_rank:
        failures.append(f"family ranks differ: {ranks}")
    if not distinct:
        failures.append("Choi spectra coincide across the family")
    print(f"same_rank_distinct_channels: ranks={ranks}, spectra distinct={distinct}")
    print("  profile p=0.2:", np.round(profiles[0.2], 6))
    print("  profile p=0.8:", np.round(profiles[0.8], 6))

    if failures:
        for line in failures:
            print("FAIL:", line)
        raise SystemExit(1)
    print("ALL CHECKS PASSED")


if __name__ == "__main__":
    check_claims()

 succeeded in 0ms:
{-# LANGUAGE TypeFamilies #-}

-- | Module      : Instances
-- Description   : Volume 06 instances of the CMRPS taxonomy classes for the
--                 quantum physical systems of the paper "Classification of
--                 Quantum Physical Systems": finite-dimensional block
--                 algebras, Hilbert-space systems, operator-algebra systems
--                 (factors), quantum channels, density-matrix systems, and
--                 superselection categories.
-- Copyright     : (c) Matthew Long, 2026
-- License       : MIT
-- Maintainer    : matthew@yonedaai.com
-- Stability     : experimental
--
-- The shared family classes live in "Taxonomy.Families",
-- "Taxonomy.Invariants", "Taxonomy.Constructions", and
-- "Taxonomy.Equivalences"; this module imports them and supplies only
-- instances, never redefinitions. Method and type names mirror the
-- definitions and theorem targets of the paper and of
-- verification/vol-06-quantum-systems-lean-targets.md (dimension vector,
-- minimal Kraus rank, Stinespring minimal dilation, operator monotone
-- parameter, the McDuff obstruction).
--
-- Claim status (docs/theorem-registry.md): this module is executable
-- taxonomy and computational evidence for the finite-dimensional statements
-- of the paper. It is not a proof and no machine-checked formalization is
-- claimed for it; the Lean targets of the volume state what a future
-- kernel-checked development would have to establish.
module Instances
  ( -- * Finite-dimensional block algebras (paper, Theorem 3.1)
    FiniteDimCStar (..)
  , MatrixBlock (..)
  , dimensionVector
  , tensorBlocks
  , directSumBlocks
  , isomorphicByDimensionVector
  , partitionsIntoSquares
    -- * System records (paper, Definition 2.1)
  , QuantumSystemRecord (..)
  , DynamicsSpec (..)
  , SymmetrySpec (..)
  , CompositionSpec (..)
    -- * Operator-algebraic systems (paper, Section 4)
  , FactorDescriptor (..)
  , Amenability (..)
  , mcduffWitness
    -- * Channels and dilations (paper, Section 6)
  , ChannelDescriptor (..)
  , minimalKrausRank
  , stinespringDilationDim
    -- * Density-matrix systems (paper, Section 8)
  , DensityMatrixSystem (..)
  , OperatorMonotoneParameter (..)
  , petzOperatorMonotone
    -- * Superselection categories (paper, Section 7)
  , SuperselectionSystem (..)
  , SuperselectionDescriptor (..)
  ) where

import Taxonomy.Constructions
  ( Construction (..)
  , Constructible (..)
  , Decomposable (..)
  , Decomposition (..)
  , Irreducible (..)
  )
import Data.List (sort)
import Taxonomy.Equivalences (MathematicalEquivalence (..))
import Taxonomy.Families
  ( FamilyDynamicalSemigroups (..)
  , FamilyHilbertOperatorAlgebras (..)
  , FamilyProbabilityMeasure (..)
  , FamilyTensorCategoriesComposition (..)
  , PhysicalSystem (..)
  )
import Taxonomy.Invariants
  ( DimensionVector (..)
  , MurrayVonNeumannType
  )

-- | Finite-dimensional C*-algebra A = sum_i M_{n_i}(C), given by its block
-- sizes (paper, Theorem 3.1). The list is a multiset: order carries no
-- information.
newtype FiniteDimCStar = FiniteDimCStar { blockSizes :: [Int] }
  deriving (Eq, Ord, Show)

-- | One matrix block M_n(C): an irreducible summand under direct sum
-- (paper, Theorem 3.1; DEF-021 for the direct-sum composition).
newtype MatrixBlock = MatrixBlock { matrixSize :: Int }
  deriving (Eq, Ord, Show)

-- | The dimension vector d(A) = {n_1, ..., n_k}, the classifying invariant of
-- finite-dimensional C*-algebras (paper, Definition 2.3 and Theorem 3.1;
-- lean target finite_dim_cstar_dimensionVector_classifies).
dimensionVector :: FiniteDimCStar -> DimensionVector
dimensionVector (FiniteDimCStar ns) = DimensionVector (sorted ns)

-- | Tensor product of block algebras: A tensor B has blocks {n_i * m_j}
-- (paper, Appendix A).
tensorBlocks :: FiniteDimCStar -> FiniteDimCStar -> FiniteDimCStar
tensorBlocks (FiniteDimCStar ns) (FiniteDimCStar ms) =
  FiniteDimCStar (sorted [n * m | n <- ns, m <- ms])

-- | Direct sum of block algebras: the block multiset union.
directSumBlocks :: FiniteDimCStar -> FiniteDimCStar -> FiniteDimCStar
directSumBlocks (FiniteDimCStar ns) (FiniteDimCStar ms) =
  FiniteDimCStar (sorted (ns ++ ms))

-- | Two finite-dimensional C*-algebras are *-isomorphic exactly when their
-- dimension vectors agree as multisets (paper, Theorem 3.1; lean target
-- finite_dim_cstar_dimensionVector_classifies).
isomorphicByDimensionVector :: FiniteDimCStar -> FiniteDimCStar -> Bool
isomorphicByDimensionVector a b = dimensionVector a == dimensionVector b

-- | Representations of d as a sum of squares of positive integers; each
-- representation is the block multiset of a unital finite-dimensional C*-algebra
-- of complex dimension d (paper, Corollary 3.2).
partitionsIntoSquares :: Int -> [[Int]]
partitionsIntoSquares = go 1
  where
    go _ 0 = [[]]
    go start d =
      [ n : rest
      | n <- [start .. isqrt d]
      , n * n <= d
      , rest <- go n (d - n * n)
      ]
    isqrt d = floor (sqrt (fromIntegral d :: Double))

sorted :: Ord a => [a] -> [a]
sorted = sort

-- | Dynamics data of a quantum system record (paper, Definition 2.1;
-- DEF-005). Abstract specification: kind of evolution and its generator
-- label. No dynamics is computed here.
data DynamicsSpec
  = UnitaryFlow String
  | SemigroupFlow String
  | NoDynamics
  deriving (Eq, Show)

-- | Symmetry and constraint data (DEF-006).
data SymmetrySpec
  = GroupAction String
  | TrivialSymmetry
  deriving (Eq, Show)

-- | Composition and interaction rules (DEF-007); fixes the meaning of
-- irreducibility (DEF-021).
data CompositionSpec
  = TensorComposition
  | DirectSumComposition
  | NoComposition
  deriving (Eq, Show)

-- | A quantum system record P = (H, A, D, S, C) (paper, Definition 2.1):
-- finite-dimensional Hilbert space of the given dimension, finite-dimensional
-- observable C*-algebra, dynamics, symmetries, composition.
data QuantumSystemRecord = QuantumSystemRecord
  { hilbertDim :: Int
  , observablesAlgebra :: FiniteDimCStar
  , dynamicsSpec :: DynamicsSpec
  , symmetriesSpec :: SymmetrySpec
  , compositionSpec :: CompositionSpec
  }
  deriving (Eq, Show)

-- | Amenability status of a factor (paper, Section 4). The amenable factors
-- are classified (Theorem 4.2); the non-amenable ones are not (Theorem 5.1).
data Amenability = Amenable | NonAmenable
  deriving (Eq, Ord, Show)

-- | An operator-algebraic system given as factor data: Murray-von Neumann
-- type (DEF-037), amenability, and a label for any additional Connes data
-- (T-OP-06 keeps the general strata open).
data FactorDescriptor = FactorDescriptor
  { murrayVonNeumannType :: MurrayVonNeumannType
  , factorAmenability :: Amenability
  , connesDataLabel :: String
  }
  deriving (Eq, Show)

-- | Symbolic witness for the McDuff obstruction (paper, Theorem 5.1;
-- lean target mcduff_uncountable_II1): separable type II_1 factors are
-- pairwise non-isomorphic along an uncountable family. No enumeration of the
-- family is possible or attempted; the witness records only that separation
-- data is asserted.
data McDuffWitness = McDuffWitness
  { separationInvariant :: String
  , witnessFamilyIndex :: String
  }
  deriving (Eq, Show)

-- | The McDuff obstruction as taxonomy vocabulary (T-OB-01). This is a
-- declaration, not a computation: uncountably many non-isomorphic separable
-- II_1 factors exist, so no total factor classification can hold.
mcduffWitness :: McDuffWitness
mcduffWitness =
  McDuffWitness
    { separationInvariant = "central-sequence algebra"
    , witnessFamilyIndex = "uncountable"
    }

-- | A quantum channel with its normal-form data (paper, Theorem 3.3 and
-- Section 6): number of Kraus operators in the given presentation, minimal
-- Kraus rank (equal to the Choi rank), and minimal Stinespring dilation
-- dimension.
data ChannelDescriptor = ChannelDescriptor
  { krausCount :: Int
  , krausRank :: Int
  , dilationDim :: Int
  }
  deriving (Eq, Show)

-- | Minimal number of Kraus operators, the normal-form invariant of a
-- channel (paper, Theorem 3.3 and Proposition 6.2; lean target
-- kraus_rank_normal_form). Not an isomorphism invariant of channels.
minimalKrausRank :: ChannelDescriptor -> Int
minimalKrausRank = krausRank

-- | Dimension of a minimal Stinespring dilation (paper, Theorem 6.1; lean
-- target stinespring_minimal_dilation_unique).
stinespringDilationDim :: ChannelDescriptor -> Int
stinespringDilationDim = dilationDim

-- | A normalized operator monotone function parameterizing a monotone metric
-- on density matrices (paper, Theorem 8.1; lean target
-- petz_monotone_metrics). The normalization condition is f(t) = t f(1/t);
-- the function itself is carried as data.
data OperatorMonotoneParameter = OperatorMonotoneParameter
  { monotoneLabel :: String
  , monotoneFunction :: Double -> Double
  , normalizedAt :: Double -> Bool
  }

-- | The operator monotone parameter in force for a density-matrix system
-- (paper, Corollary 8.2).
petzOperatorMonotone :: DensityMatrixSystem -> OperatorMonotoneParameter
petzOperatorMonotone = monotoneParameter

-- | A quantum state space of density matrices with the monotone metric
-- parameter in force (Family V, quantum side; paper, Definition 8.1).
data DensityMatrixSystem = DensityMatrixSystem
  { matrixDim :: Int
  , monotoneParameter :: OperatorMonotoneParameter
  }

-- | Superselection data of a local net (paper, Definition 7.1): symmetric
-- tensor structure flag, conjugates, and the scalar endomorphism ring of the
-- unit, the hypotheses of the Doplicher-Roberts theorem (lean target
-- dr_reconstruction).
data SuperselectionDescriptor = SuperselectionDescriptor
  { symmetricStructure :: Bool
  , hasConjugates :: Bool
  , hasDirectSumsSubobjects :: Bool
  , endOfUnitIsScalar :: Bool
  , selectionCriterion :: String
  }
  deriving (Eq, Show)

-- | A superselection category of a quantum field theory (Family VIII;
-- paper, Section 7).
newtype SuperselectionSystem = SuperselectionSystem
  { superselectionData :: SuperselectionDescriptor
  }
  deriving (Eq, Show)

-- | DEF-002 record instance: state space is the Hilbert dimension, observables
-- are the block algebra, and the remaining components are their spec data.
instance PhysicalSystem QuantumSystemRecord where
  type StateSpace QuantumSystemRecord = Int
  type Observables QuantumSystemRecord = FiniteDimCStar
  type Dynamics QuantumSystemRecord = DynamicsSpec
  type Symmetries QuantumSystemRecord = SymmetrySpec
  type Composition QuantumSystemRecord = CompositionSpec
  stateSpace = hilbertDim
  observables = observablesAlgebra
  dynamics = dynamicsSpec
  symmetries = symmetriesSpec
  composition = compositionSpec

-- | Family II instance for Hilbert-space systems (DEF-027).
instance FamilyHilbertOperatorAlgebras QuantumSystemRecord where
  type OperatorAlgebraData QuantumSystemRecord = FiniteDimCStar
  operatorAlgebraData = observablesAlgebra

-- | Family II instance for factor systems (DEF-027); the classifying data is
-- the factor descriptor, and no claim is made beyond Theorem 4.2.
instance FamilyHilbertOperatorAlgebras FactorDescriptor where
  type OperatorAlgebraData FactorDescriptor = FactorDescriptor
  operatorAlgebraData = id

-- | Family VII instance for open systems given by channels (DEF-032):
-- Stinespring data is normal form (T-BG-15), not an isomorphism
-- classification.
instance FamilyDynamicalSemigroups ChannelDescriptor where
  type DynamicalSemigroupData ChannelDescriptor = ChannelDescriptor
  dynamicalSemigroupData = id

-- | Family V instance for density-matrix systems (DEF-030): the quantum
-- monotone metric is parametric (T-BG-18), and no uniqueness transfers from
-- the classical case.
instance FamilyProbabilityMeasure DensityMatrixSystem where
  type ProbabilityMeasureData DensityMatrixSystem = OperatorMonotoneParameter
  probabilityMeasureData = monotoneParameter

-- | Family VIII instance for superselection categories (DEF-033); the
-- symmetric layer is load-bearing (paper, Proposition 7.5).
instance FamilyTensorCategoriesComposition SuperselectionSystem where
  type TensorCategoryData SuperselectionSystem = SuperselectionDescriptor
  tensorCategoryData = superselectionData

-- | DEF-023 constructions on block algebras: tensor and direct sum are
-- computed; extension and the limit hooks are not supplied here.
instance Constructible FiniteDimCStar where
  type Composite FiniteDimCStar = FiniteDimCStar
  tensorProduct a b = Just (tensorBlocks a b)
  directSum a b = Just (directSumBlocks a b)
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

-- | DEF-022 decomposition of a block algebra into single-block algebras under
-- direct sum (paper, Theorem 3.1); each factor FiniteDimCStar [n] is the
-- irreducible summand of the same size as MatrixBlock n.
instance Decomposable FiniteDimCStar where
  decomposition (FiniteDimCStar ns) =
    Just
      Decomposition
        { decompositionConstruction = DirectSum
        , irreducibleFactors = [FiniteDimCStar [n] | n <- ns]
        }

-- | DEF-021 irreducibility of a single matrix block under direct sum.
instance Irreducible MatrixBlock where
  irreducibilityBasis :: MatrixBlock -> Construction
  irreducibilityBasis _ = DirectSum

-- | DEF-016 mathematical equivalence for block algebras: equality of
-- dimension vectors (paper, Theorem 3.1).
instance MathematicalEquivalence FiniteDimCStar where
  mathematicallyEquivalent = isomorphicByDimensionVector

-- | DEF-016 mathematical equivalence for channels is deliberately absent:
-- Kraus rank is not a complete invariant (paper, Proposition 6.2), and the
-- taxonomy records no channel equivalence here on purpose.

 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D experiment for vol-06-quantum-systems.

Evidences (computational evidence only, never proof):
  - Paper Theorem 3.1: dimension vector classifies finite-dimensional
    C*-algebras up to *-isomorphism (function `isomorphism_criterion`).
  - Paper Corollary 3.2: unital algebras of complex dimension d correspond to
    representations of d as a sum of squares (function `classify_by_dimension`).
  - Paper Appendix A: tensor products multiply block sizes
    (function `tensor_dimension_vector`).
"""

from __future__ import annotations

from itertools import product


def dimension_vector(blocks):
    """Dimension vector d(A) = {n_1, ..., n_k} as a sorted multiset."""
    return tuple(sorted(int(n) for n in blocks if n >= 1))


def isomorphism_criterion(blocks_a, blocks_b):
    """Two finite-dimensional C*-algebras are *-isomorphic iff dimension
    vectors agree as multisets (paper, Theorem 3.1)."""
    return dimension_vector(blocks_a) == dimension_vector(blocks_b)


def ideal_dimensions(blocks):
    """Vector-space dimensions of the simple ideals, computed independently of
    the block-size presentation: each ideal M_n(C) has complex dimension n^2,
    and a *-isomorphism preserves the ideals and their dimensions."""
    return tuple(sorted(n * n for n in blocks))


def isomorphism_witness(blocks_a, blocks_b):
    """An explicit block matching when the algebras are isomorphic: a
    permutation pairing equal block sizes. Returns None otherwise."""
    if not isomorphism_criterion(blocks_a, blocks_b):
        return None
    a = sorted(blocks_a)
    b = sorted(blocks_b)
    return list(zip(a, b))


def separating_invariant(blocks_a, blocks_b):
    """For non-isomorphic algebras, an invariant computed from the ideal
    structure that differs: the multiset of ideal dimensions."""
    if isomorphism_criterion(blocks_a, blocks_b):
        return None
    return (ideal_dimensions(blocks_a), ideal_dimensions(blocks_b))


def tensor_dimension_vector(blocks_a, blocks_b):
    """Block multiset of A tensor B: all products n_i * m_j."""
    return tuple(sorted(n * m for n, m in product(blocks_a, blocks_b)))


def direct_sum_dimension_vector(blocks_a, blocks_b):
    """Block multiset of A direct-sum B: the multiset union."""
    return tuple(sorted(list(blocks_a) + list(blocks_b)))


def _partitions_into_squares(total, start=1):
    """Representations of `total` as a sum of squares, nondecreasing."""
    if total == 0:
        yield ()
        return
    for n in range(start, int(total ** 0.5) + 1):
        if n * n <= total:
            for rest in _partitions_into_squares(total - n * n, n):
                yield (n,) + rest


def classify_by_dimension(d):
    """Block multisets of unital C*-algebras of complex dimension d
    (paper, Corollary 3.2): d = sum n_i^2."""
    return sorted(_partitions_into_squares(d))


def check_claims():
    failures = []

    # Claim 1: the isomorphism criterion holds on the enumerated small algebras,
    # with explicit witnesses for isomorphic pairs and independently computed
    # ideal-dimension invariants for non-isomorphic pairs.
    for d in range(1, 17):
        algebras = classify_by_dimension(d)
        for i, a in enumerate(algebras):
            for j, b in enumerate(algebras):
                expected = i == j
                got = isomorphism_criterion(a, b)
                if got != expected:
                    failures.append(
                        f"isomorphism_criterion({a}, {b}) = {got}, expected {expected}"
                    )
                if expected:
                    witness = isomorphism_witness(a, b)
                    if witness is None or any(x != y for x, y in witness):
                        failures.append(f"witness for {a} malformed: {witness}")
                else:
                    sep = separating_invariant(a, b)
                    if sep is None or sep[0] == sep[1]:
                        failures.append(f"no separating invariant for {a} vs {b}")
        for a in algebras:
            if sum(n * n for n in a) != d:
                failures.append(f"{a} does not have complex dimension {d}")
            if sum(ideal_dimensions(a)) != d:
                failures.append(f"ideal dimensions of {a} do not sum to {d}")
    print("isomorphism_criterion: witnesses and separating invariants checked up to dim 16")

    # Claim 2: counts agree with the sum-of-squares partition function.
    counts = {d: len(classify_by_dimension(d)) for d in range(1, 17)}
    expected_4 = [tuple([1, 1, 1, 1]), tuple([2])]
    if sorted(classify_by_dimension(4)) != sorted(expected_4):
        failures.append(f"dim-4 algebras are {classify_by_dimension(4)}")
    print(f"classify_by_dimension counts: {counts}")

    # Claim 3: tensor products multiply block sizes.
    a, b = (2, 3), (2,)
    expected_tensor = tuple(sorted([4, 6]))
    got = tensor_dimension_vector(a, b)
    if got != expected_tensor:
        failures.append(f"tensor {a} x {b} = {got}, expected {expected_tensor}")
    # The vector-space dimensions multiply: (4+9) * 4 = 52 = 16 + 36.
    if sum(n * n for n in got) != sum(n * n for n in a) * sum(n * n for n in b):
        failures.append("tensor dimension accounting failed")
    print(f"tensor_dimension_vector: {a} x {b} = {got}")

    # Direct sum is multiset union.
    got_sum = direct_sum_dimension_vector(a, b)
    if got_sum != tuple(sorted([2, 3, 2])):
        failures.append(f"direct sum = {got_sum}")
    print(f"direct_sum_dimension_vector: {a} + {b} = {got_sum}")

    if failures:
        for line in failures:
            print("FAIL:", line)
        raise SystemExit(1)
    print("ALL CHECKS PASSED")


if __name__ == "__main__":
    check_claims()

exec
/usr/local/bin/zsh -lc "sed -n '200,620p' papers/latex/vol-06-quantum-systems.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
\small
\begin{tabularx}{\textwidth}{@{}c Y c@{}}
\toprule
$d$ & Dimension vectors & Count \\
\midrule
1 & $\{1\}$ & 1 \\
2 & $\{1^2\}$ & 1 \\
3 & $\{1^3\}$ & 1 \\
4 & $\{1^4\}$ and $\{2\}$ & 2 \\
5 & $\{1^5\}$ and $\{1, 2\}$ & 2 \\
6 & $\{1^6\}$ and $\{1^2, 2\}$ & 2 \\
7 & $\{1^7\}$ and $\{1^3, 2\}$ & 2 \\
8 & $\{1^8\}$, $\{1^4, 2\}$, and $\{2^2\}$ & 3 \\
9 & $\{1^9\}$, $\{1^5, 2\}$, $\{1, 2^2\}$, and $\{3\}$ & 4 \\
10 & $\{1^{10}\}$, $\{1^6, 2\}$, $\{1^2, 2^2\}$, and $\{1, 3\}$ & 4 \\
11 & $\{1^{11}\}$, $\{1^7, 2\}$, $\{1^3, 2^2\}$, and $\{1^2, 3\}$ & 4 \\
12 & $\{1^{12}\}$, $\{1^8, 2\}$, $\{1^4, 2^2\}$, $\{2^3\}$, and $\{1^3, 3\}$ & 5 \\
\bottomrule
\end{tabularx}
\end{table}

\begin{remark}[Recognition]
\label{rem:recognition}
The dimension vector solves the recognition problem for this class as well as the classification problem: given matrix blocks, comparing their size multisets decides $*$-isomorphism directly, and the comparison is a sort. In the finite-dimensional regime classification, parameterization, and recognition therefore coincide. The classification of finite simple groups separates the three: it delivers the list, partially solves recognition through atlas data, and supplies no uniform parameterization. The separation reappears, in worse form, in \cref{sec:mcduff}. For channels the recognition problem is open in the same way the classification problem is: comparing Choi spectra decides nothing beyond the orbit invariants of \cref{prop:krausrank}, and no recognition procedure for unitary equivalence of channels is on record.
\end{remark}

\subsection{States and state spaces}

The observable algebra of \cref{thm:findim} carries state space data that the classification records.

\begin{proposition}[States of a block algebra]
\label{prop:states}
Let $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$. Every state $\rho$ on $A$ is of the form
\[
\rho(X_1, \dots, X_k) = \sum_{i=1}^{k} \operatorname{Tr}(\sigma_i X_i)
\]
for positive matrices $\sigma_i \in M_{n_i}(\mathbb{C})$ with $\sum_i \operatorname{Tr} \sigma_i = 1$, and this correspondence is bijective. The pure states of $A$ are the vector states of individual blocks, so the pure state space is the disjoint union of complex projective spaces $\mathbb{CP}^{n_i - 1}$.
\end{proposition}

\begin{proof}
A positive functional on a direct sum is blockwise positive, so it suffices to treat one block. On $M_n(\mathbb{C})$ every positive functional is a trace against a positive matrix: the matrix $\sigma$ with entries $\sigma_{ji} = \rho(E_{ij})$ satisfies $\rho(X) = \operatorname{Tr}(\sigma X)$ for all $X$ by linearity on matrix units, and positivity of $\rho$ gives $\sigma \geq 0$. Normalization of $\rho$ on $A$ reads $\sum_i \operatorname{Tr} \sigma_i = 1$. Purity forces all but one $\sigma_i$ to vanish and that $\sigma_i$ to have rank one, which is a vector state of block $i$.
\end{proof}

The state space of $A$, as a compact convex body, is therefore determined by the dimension vector: it is the join of the density-matrix bodies of the blocks.

\begin{proposition}[Automorphisms of block algebras]
\label{prop:aut}
Every $*$-automorphism of $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ is the composition of a blockwise inner automorphism and a permutation of blocks of equal size. The dynamics of a finite-dimensional quantum system is therefore a unitary path inside blocks together with block permutations of equal size, and none of it is recorded by the dimension vector beyond the block sizes themselves.
\end{proposition}

\begin{proof}
By \cref{thm:findim} every $*$-automorphism permutes the simple ideals of $A$, and it can permute only ideals of equal size, being a $*$-isomorphism. On a single block every $*$-automorphism of $M_n(\mathbb{C})$ is inner, so after choosing the permutation the automorphism is blockwise conjugation by unitaries. The second statement collects the description.
\end{proof}

\begin{proposition}[Unique decomposition in the finite-dimensional class]
\label{prop:unique}
Decompositions of a finite-dimensional $C^*$-algebra $A$ into irreducible summands under direct sum exist and are unique up to order and unitary equivalence. The dimension vector is therefore complete data for the decomposition as well as for the isomorphism class, and the uniqueness that fails for interacting systems in general holds in this restricted class.
\end{proposition}

\begin{proof}
Existence is \cref{thm:findim}. Uniqueness holds because the summands are the simple ideals of the semisimple algebra $A$, and the minimal nonzero two-sided ideals of a semisimple algebra are unique. Any decomposition into irreducible summands exhibits exactly these ideals, and the order of the summands is not part of the data, matching the multiset form of the dimension vector.
\end{proof}

\begin{proposition}[Tensor products of block algebras]
\label{prop:tensor}
Let $A = \bigoplus_i M_{n_i}(\mathbb{C})$ and $B = \bigoplus_j M_{m_j}(\mathbb{C})$. Then $A \otimes B \cong \bigoplus_{i,j} M_{n_i m_j}(\mathbb{C})$, and the dimension vector of $A \otimes B$ is the multiset of products $\{n_i m_j\}$. In particular the dimension vector of a tensor product is computed from the factor dimension vectors without reference to any presentation.
\end{proposition}

\begin{proof}
The tensor product of matrix algebras satisfies $M_n(\mathbb{C}) \otimes M_m(\mathbb{C}) \cong M_{nm}(\mathbb{C})$ as $C^*$-algebras, and the tensor product of direct sums distributes: $A \otimes B \cong \bigoplus_{i,j} M_{n_i}(\mathbb{C}) \otimes M_{m_j}(\mathbb{C})$. \Cref{thm:findim} then identifies the result blockwise.
\end{proof}

\section{Operator algebras and factors}
\label{sec:factors}

Infinite-dimensional quantum systems require operator-algebraic observables. The classification of von Neumann algebras reduces to factors, and the classification of factors is complete on the amenable side and out of reach of any finite list of types on the general side.

\begin{definition}[Factor types]
\label{def:factortype}
A factor $M$ is of type $\mathrm{I}$ if it contains minimal projections, of type $\mathrm{II}_1$ if it is infinite-dimensional with a finite faithful normal trace, of type $\mathrm{II}_\infty$ if it is properly infinite with a semifinite trace, and of type $\mathrm{III}$ if it admits no nonzero finite trace. The type $\mathrm{III}$ factors are stratified by the Connes spectrum of the modular automorphism group, with parameters $\lambda \in (0,1)$ and the two endpoint cases $\mathrm{III}_0$ and $\mathrm{III}_1$.
\end{definition}

Murray-von Neumann comparison theory is the tool behind the trichotomy. Two projections $p$ and $q$ of a von Neumann algebra are equivalent when a partial isometry $u$ with $u^* u = p$ and $u u^* = q$ exists, and in a factor any two projections are comparable: either $p$ is equivalent to a subprojection of $q$ or conversely. Type $\mathrm{I}$ factors contain minimal projections, type $\mathrm{II}$ factors contain no minimal projections but do contain nonzero finite projections, and type $\mathrm{III}$ factors have every nonzero projection infinite. The type of a factor is therefore the first invariant of \cref{thm:amenable}.

The reduction to factors is the operator-algebraic analogue of block decomposition.

\begin{definition}[Amenable factors]
\label{def:amenable}
All factors in this section have separable predual. A factor is hyperfinite, or approximately finite-dimensional, when it is the norm closure of an increasing union of finite-dimensional subalgebras, and injective when a norm-one projection of $B(H)$ onto it exists. For factors with separable predual the two conditions coincide, and a factor satisfying them is amenable. The unique amenable factor of type $\mathrm{II}_1$ with separable predual is the hyperfinite factor $R$.
\end{definition}

\begin{theorem}[Central decomposition]
\label{thm:central}
Every von Neumann algebra $M$ is a direct integral of factors over a measure space, unique up to measure-class isomorphism of the base. The isomorphism classification of von Neumann algebras therefore reduces to the classification of factors together with the measure-theoretic data of the decomposition.
\end{theorem}

\Cref{thm:central} is the Murray-von Neumann direct-integral decomposition; we refer to the original work and to the standard accounts for the proof. The classification content sits in the factors.

\begin{theorem}[Classification of amenable factors]
\label{thm:amenable}
Among factors with separable predual the amenable (equivalently injective, equivalently hyperfinite) factors are classified as follows. For each $n \geq 1$ there is a unique factor of type $\mathrm{I}_n$ and a unique factor of type $\mathrm{I}_\infty$. There is a unique amenable factor of type $\mathrm{II}_1$, the hyperfinite factor, and a unique amenable factor of type $\mathrm{II}_\infty$. For each $\lambda \in (0,1)$ there is a unique amenable factor of type $\mathrm{III}_\lambda$, and a unique amenable factor of type $\mathrm{III}_1$. Amenable factors of type $\mathrm{III}_0$ are classified by the ergodic flow of weights. The invariants in force are the Murray-von Neumann type together with the Connes invariants. Separable predual is essential: among non-separable injective $\mathrm{II}_1$ factors uniqueness fails, and there are $2^{\mathfrak{c}}$ pairwise non-isomorphic ones.
\end{theorem}

\begin{proof}[Status of the proof]
The type $\mathrm{I}$ and type $\mathrm{II}$ cases are Murray-von Neumann's, together with the existence and uniqueness of the hyperfinite $\mathrm{II}_1$ factor. The classification of injective factors, including the type $\mathrm{III}_\lambda$ cases for $\lambda \neq 0$, is Connes's theorem of 1976, building on his 1973 classification of type $\mathrm{III}$ factors by the invariants of \cref{def:factortype}. Uniqueness of the injective factor of type $\mathrm{III}_1$ was completed by Haagerup in 1987 through the bicentralizer problem. The statements are established theorems of the literature; the proofs are deep analytic arguments in von Neumann algebra theory and are not reproduced here. What is proved in this paper is the finite-dimensional content of \cref{sec:findim} and the channel content of \cref{sec:channels}, each in full.
\end{proof}

\subsection{The hyperfinite factor}

In type $\mathrm{II}_1$ the hyperfinite factor $R$ is the norm closure of an increasing union of full matrix algebras $M_{2^k}(\mathbb{C})$ along the embeddings $A \mapsto A \otimes I_2$, and every amenable $\mathrm{II}_1$ factor with separable predual is isomorphic to $R$. The type $\mathrm{III}_\lambda$ factors for $\lambda \in (0,1)$ arise differently: as infinite tensor products of finite type I factors carrying non-tracial product states (the Powers factors), not as inductive limits of matrix algebras along unital embeddings. The unique amenable factor of type $\mathrm{III}_1$ is the limit case completed by Haagerup's theorem.

Within type $\mathrm{III}_0$ the amenable factors are classified by the ergodic flow of weights up to conjugacy of the flow, and this is the one stratum whose invariant is an ergodic object rather than a number.

The factor $R$ is the reference object of the classification. It lies inside the classified regime of \cref{thm:amenable}, it is the unique separable injective $\mathrm{II}_1$ factor, and the uncountable family of \cref{thm:mcduff} is produced by varying the central-sequence structure of algebras built from it. The boundary between the amenable side and the general side is therefore a boundary inside the separable $\mathrm{II}_1$ factors themselves.

\begin{remark}[Type $\mathrm{III}$ strata]
\label{rem:typeIII}
The Connes spectrum $S(M) = \bigcap_{\varphi} \operatorname{Sp}(\Delta_\varphi)$ is the intersection over normal faithful states $\varphi$ of the spectra of the modular operators $\Delta_\varphi$, a subset of $[0, \infty)$, and the flow of weights is the ergodic flow attached to the modular automorphism group through the central decomposition. The stratum data are read off from $S(M) \cap \mathbb{R}_+^*$: it is $\{1\}$ in type $\mathrm{III}_0$, $\lambda^{\mathbb{Z}}$ in type $\mathrm{III}_\lambda$ for $\lambda \in (0,1)$, and $(0, \infty)$ in type $\mathrm{III}_1$. \Cref{thm:amenable} classifies the amenable factors through these invariants and the ergodic flow of weights in type $\mathrm{III}_0$. Beyond the amenable class the strata are coarse: fundamental groups of type $\mathrm{III}$ factors vary widely, and the structure theory past the Connes spectrum is open. No completeness claim for non-amenable type $\mathrm{III}$ factors is used anywhere in this paper.
\end{remark}

\begin{remark}[The Elliott program]
\label{rem:elliott}
For separable simple nuclear $C^*$-algebras the analogous program classifies algebras by $K$-theoretic and tracial data. The program is unfinished. Toms constructed a simple unital algebra shape equivalent to its tensor product with an infinite-dimensional UHF algebra and with the same tracial simplex, yet not isomorphic to it, so $K$-theory and traces together do not complete the classification without further hypotheses. This paper draws no classification conclusion from the Elliott program.
\end{remark}

\section{The McDuff obstruction}
\label{sec:mcduff}

The most consequential theorem for the classification program is negative.

\begin{theorem}[McDuff 1969]
\label{thm:mcduff}
There exist uncountably many pairwise non-isomorphic separable type $\mathrm{II}_1$ factors.
\end{theorem}

\begin{proof}[Consequence for classification]
The theorem asserts continuum many isomorphism classes: the separable $\mathrm{II}_1$ factors form an uncountable family with no repetitions up to isomorphism. Two consequences follow. No finite or countable list of factor types can exhaust the family, so a CFSG-style list of types cannot be complete outside a restricted class, and any classification theorem for $\mathrm{II}_1$ factors must restrict its class (for instance to the amenable factors of \cref{thm:amenable}) or weaken its conclusion to a coarser equivalence. The theorem by itself does not decide whether a classification by continuous parameters exists; that question belongs to the descriptive set theory of von Neumann algebra isomorphism and is not settled here. What the theorem does settle is that the separation is visible in the operator-algebraic structure itself: the construction separates factors through their central sequences.
\end{proof}

\begin{corollary}[No finite list of factor types]
\label{cor:nofinite}
No finite or countable list of pairwise non-isomorphic factor types exhausts the separable $\mathrm{II}_1$ factors, and no CFSG-style list of factor types is complete outside a restricted class such as the amenable factors.
\end{corollary}

\begin{proof}
A finite or countable list covers countably many isomorphism classes, and \cref{thm:mcduff} supplies continuum many. The second statement is the first applied to the CFSG shape of a classification theorem.
\end{proof}

\begin{remark}[Honest record]
\label{rem:mcduff}
\Cref{thm:mcduff} marks the boundary of the classifiable territory: it is a classification result of the same standing as the positive theorems, not a difficulty to be engineered around. The amenable factors lie inside the boundary by \cref{thm:amenable}, and the general $\mathrm{II}_1$ factors lie outside it.
\end{remark}

Inside the amenable class the classification has the shape of a CFSG-style theorem: a list of types, a complete set of invariants, and a uniqueness statement for each type. The obstruction says this shape cannot extend to all separable $\mathrm{II}_1$ factors, so the shape must be sought in restricted classes or with weakened equivalences. The amenable classification is one instance of the pattern; whether rigidity hypotheses on non-amenable factors define another instance is one of the open problems of \cref{sec:regimes}.

\section{Channels and dilations}
\label{sec:channels}


\subsection{Choi-Kraus normal form}

The morphisms of finite-dimensional quantum systems that appear in measurement and evolution are channels (\cref{def:channels}). Their normal form is the first of the two canonical-form theorems of the paper.

\begin{lemma}[Choi correspondence]
\label{lem:choi}
For a linear map $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ with Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$ the following hold: $\Phi$ is completely positive if and only if $J(\Phi) \geq 0$, and $\Phi$ is trace preserving if and only if $\operatorname{Tr}_m J(\Phi) = I_n$, where $\operatorname{Tr}_m$ is the partial trace over the second tensor factor.
\end{lemma}

\begin{proof}
Complete positivity is tested on positive elements of $M_n(\mathbb{C}) \otimes M_k(\mathbb{C})$ for all $k$, and for $k = n$ the condition $(\operatorname{id} \otimes \Phi)(P) \geq 0$ on rank-one projections $P = |\psi\rangle\langle\psi|$ with $|\psi\rangle = \sum_i e_i \otimes e_i$ reads $J(\Phi) \geq 0$; the general case follows by direct sums. For the trace condition, $\operatorname{Tr}_m J(\Phi)$ has $(i,j)$ entry $\operatorname{Tr}(\Phi(E_{ij}))$, and $\Phi$ preserves trace exactly when $\operatorname{Tr}(\Phi(E_{ij})) = \delta_{ij}$, which is $\operatorname{Tr}_m J(\Phi) = I_n$.
\end{proof}

\begin{example}[A family of one Kraus rank]
\label{ex:depol}
For $p \in (0,1)$ set $A_0 = \sqrt{1 - p} \, I_2$ and $A_i = \sqrt{p/3} \, \sigma_i$ for the three Pauli matrices $\sigma_i$. The map $\Phi_p(X) = \sum_{k=0}^{3} A_k X A_k^*$ satisfies $\sum_k A_k^* A_k = I_2$, so it is a qubit channel. Its Choi matrix has eigenvalues $2(1 - p)$ and $2p/3$ with multiplicity three, all positive, so the Kraus rank is $4$ for every $p \in (0,1)$. The Choi spectrum varies with $p$, and unitary equivalence of channels preserves the Choi spectrum, so the family consists of pairwise unitarily inequivalent channels sharing one Kraus rank.
\end{example}

\begin{example}[Choi matrix of a qubit channel]
\label{ex:choi}
For the channel $\Phi_p$ of \cref{ex:depol} the Kraus vectors are the vectorizations of $I_2$ and of the Pauli matrices, which are orthogonal for the Hilbert-Schmidt pairing. The Choi matrix is therefore diagonal in the basis these vectors span, with eigenvalues $2(1 - p)$ and $2p/3$ with multiplicity three. Trace preservation reads $\operatorname{Tr}_m J(\Phi_p) = I_2$ on these eigenvalues, and complete positivity reads $J(\Phi_p) \geq 0$, which holds for $p \in (0,1)$. The eigenvalue list is the input of the minimization statement of \cref{prop:krausrank}.
\end{example}

\begin{theorem}[Choi-Kraus normal form]
\label{thm:kraus}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be linear. Then $\Phi$ is completely positive if and only if there are matrices $A_1, \dots, A_r \in M_{m \times n}(\mathbb{C})$ with
\[
\Phi(X) = \sum_{i=1}^{r} A_i X A_i^* \qquad \text{for all } X \in M_n(\mathbb{C}),
\]
and one may take $r$ equal to the rank of the Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$. The minimal such $r$ is the Kraus rank of $\Phi$ and equals the rank of $J(\Phi)$.
\end{theorem}

\begin{proof}
Write $J(\Phi) \in M_{nm}(\mathbb{C})$ in block form as the $n \times n$ block matrix with blocks $\Phi(E_{ij})$. Complete positivity of $\Phi$ is equivalent to positivity of $J(\Phi)$, and positivity is equivalent to a factorization $J(\Phi) = \sum_{k=1}^{r} v_k v_k^*$ with $r = \operatorname{rank} J(\Phi)$ and vectors $v_k \in \mathbb{C}^n \otimes \mathbb{C}^m$. Fix an orthonormal basis $e_1, \dots, e_n$ of $\mathbb{C}^n$ and decompose each $v_k = \sum_{j=1}^{n} e_j \otimes w_{kj}$ with $w_{kj} \in \mathbb{C}^m$. Let $A_k \in M_{m \times n}(\mathbb{C})$ be the matrix whose $j$-th column is $w_{kj}$. The $(i,j)$ block of $J(\Phi)$ is then $\sum_{k=1}^{r} w_{ki} w_{kj}^* = \sum_{k=1}^{r} A_k E_{ij} A_k^*$, so $\Phi(E_{ij}) = \sum_{k} A_k E_{ij} A_k^*$ for all $i, j$ and by linearity $\Phi(X) = \sum_{k} A_k X A_k^*$ for all $X$. Conversely any such representation writes $J(\Phi)$ as a sum of $s$ rank-one positive terms, so $s \geq \operatorname{rank} J(\Phi)$ and the minimal number of Kraus operators equals $r$.
\end{proof}

\begin{remark}[Normal form versus classification]
\label{rem:normalform}
\Cref{thm:kraus} is a normal-form theorem, not a classification of channels up to isomorphism. The Kraus rank is an invariant of the minimal presentation of one channel. \Cref{sec:channels} exhibits channels with equal Kraus rank that no unitary change of presentation identifies, and the literature records no isomorphism classification of channels beyond the normal form.
\end{remark}

\subsection{Stinespring dilations}

Stinespring's theorem gives every channel a canonical dilation through an environment, and a minimal dilation is unique up to unitary. The statement is the second canonical-form theorem of the paper.

\begin{theorem}[Stinespring dilation]
\label{thm:stinespring}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be a channel. Then $\Phi$ admits a Stinespring dilation $(K, V)$ in the sense of \cref{def:channels}, and minimal dilations exist. Any two minimal dilations $(K, V)$ and $(K', V')$ of $\Phi$ are unitarily equivalent: there is a unitary $U: K \to K'$ with $(I_m \otimes U) V = V'$. The dimension $\dim K$ of a minimal dilation equals the Kraus rank of $\Phi$.
\end{theorem}

\begin{proof}
Take a Kraus presentation $\Phi(X) = \sum_{k=1}^{r} A_k X A_k^*$ as in \cref{thm:kraus}, with $r$ the Choi rank. Set $K = \mathbb{C}^r$ and define $V: \mathbb{C}^n \to \mathbb{C}^m \otimes K$ by $V \psi = \sum_{k=1}^{r} (A_k \psi) \otimes e_k$ for the standard basis $e_k$ of $K$. Then $V^* V = \sum_k A_k^* A_k = I_n$ because $\Phi$ preserves trace, so $V$ is an isometry, and $\operatorname{Tr}_K(V X V^*) = \sum_k A_k X A_k^* = \Phi(X)$. A dilation on a space of dimension less than $r$ would yield a Kraus presentation with fewer than $r$ operators, which \cref{thm:kraus} forbids, so this dilation is minimal. For uniqueness, both $K$ and $K'$ are spanned by vectors of the form $(w^* \otimes I) V \psi$ and $(w^* \otimes I) V' \psi$ with $w \in \mathbb{C}^m$ and $\psi \in \mathbb{C}^n$, the correspondence between these vectors preserves inner products because both dilations realize the same map $\Phi$, and it extends to a unitary $U: K \to K'$ with $(I_m \otimes U) V = V'$. For completely positive unital maps on a general $C^*$-algebra the dual picture holds: $\Phi(a) = V^* \pi(a) V$ with $\pi$ a unital $*$-representation and $V$ an isometry, which is Stinespring's original form.
\end{proof}

\begin{remark}[Two pictures]
\label{rem:pictures}
Channels appear in two standard forms. In the Schr\"odinger picture a channel is completely positive and trace preserving, acting on states and dilating through an environment as in \cref{def:channels}. In the Heisenberg picture a channel is a unital completely positive map of observable algebras, and its Stinespring form is the compression $\Phi(a) = V^* \pi(a) V$ named at the end of \cref{thm:stinespring}. The two pictures are related by adjunction, the dilation statements hold in either, and the invariant content is the same.
\end{remark}

For channels on matrix algebras the minimal dilation is finite-dimensional and the unitary freedom of \cref{thm:stinespring} is exactly the change-of-presentation freedom of Kraus operators.

\begin{proposition}[Kraus rank is a normal-form invariant]
\label{prop:krausrank}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be a channel. The Kraus rank of $\Phi$ equals the rank of its Choi matrix, equals the minimal number of Kraus operators in any representation of $\Phi$, and equals the dimension of the environment $K$ in a minimal Stinespring dilation. The Kraus rank is preserved by unitary changes of Kraus presentation and by composition of $\Phi$ with unitary conjugations of domain and codomain. It is not a complete invariant of channels: two channels with equal Kraus rank need not be unitarily equivalent.
\end{proposition}

\begin{proof}
The equalities with the Choi rank and the minimal Kraus number are \cref{thm:kraus}; the equality with the minimal dilation dimension is the construction of \cref{thm:stinespring} specialized to matrix algebras. Unitary conjugation of the Kraus operators replaces each $A_i$ by $W A_i U^*$ with $U, W$ unitary and does not change the rank of the Choi matrix. For the negative statement take the channel family $\Phi_p$ of \cref{ex:depol}. Its Kraus rank is $4$ for every $p \in (0,1)$, its Choi eigenvalues $2(1-p)$ and $2p/3$ vary with $p$, and unitary equivalence of channels preserves the Choi spectrum. Distinct values of $p$ give inequivalent channels with equal Kraus rank.
\end{proof}

\begin{remark}[Prohibition recorded]
\label{rem:prohibition}
\Cref{prop:krausrank} records the exact boundary. Kraus rank may be used to compare normal forms of one channel and to detect minimality of a dilation. It may not be used as an isomorphism classification of channels, and no theorem of this paper treats it as one. The Kraus rank is an invariant of the minimal dilation layer of structure and carries no classification claim for the channel layer.
\end{remark}

\begin{proposition}[Composition of channels]
\label{prop:compose}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ and $\Psi: M_m(\mathbb{C}) \to M_p(\mathbb{C})$ be linear. Then
\[
J(\Psi \circ \Phi)_{(i\alpha),(j\beta)} = \sum_{k,l=1}^{m} J(\Phi)_{(ik),(jl)} \, J(\Psi)_{(k\alpha),(l\beta)},
\]
with composite indices as in \cref{lem:choi}. The right-hand side is the link product of $J(\Phi)$ and $J(\Psi)$: matrix multiplication of $J(\Phi)$ after partial transpose on the shared subsystem, contracted with $J(\Psi)$ along that subsystem. Composition of channels is therefore a link-product contraction, and the Choi matrix of a composite is determined by the Choi matrices of the factors.
\end{proposition}

\begin{proof}
Write $\Phi(E_{ij}) = \sum_{k,l} c^{ij}_{kl} E_{kl}$ and read $J(\Phi)_{(ik),(jl)} = c^{ij}_{kl}$ and $J(\Psi)_{(k\alpha),(l\beta)} = \Psi(E_{kl})_{\alpha\beta}$. The right-hand side of the claimed identity is then $\sum_{k,l} c^{ij}_{kl} \Psi(E_{kl})_{\alpha\beta} = \Psi(\Phi(E_{ij}))_{\alpha\beta}$, which is $J(\Psi \circ \Phi)_{(i\alpha),(j\beta)}$ by definition.
\end{proof}

\begin{remark}[What a channel classification would need]
\label{rem:channelclass}
A classification of channels up to unitary equivalence would need invariants separating the orbits of the unitary action $\{A_k\} \mapsto \{W A_k U^*\}$ on Kraus presentations. The Choi spectrum is one such invariant and is not complete, as \cref{ex:depol} shows at the level of spectra alone; the orbit data of a presentation involves the arrangement of its Kraus vectors in $\mathbb{C}^n \otimes \mathbb{C}^m$ beyond their Gram matrix. No complete set of orbit invariants is on record, and this is the fourth open problem of \cref{sec:regimes}.
\end{remark}

\section{Tensor categories and superselection}
\label{sec:tensor}

Superselection sectors of a quantum field theory organize into tensor categories, and two reconstruction theorems classify such categories under explicit hypotheses. The hypotheses are load-bearing: both theorems fail or become open when they are dropped, and one equivalence-negligible layer turns out to carry the group.

\begin{definition}[Superselection category]
\label{def:dhr}
Fix a local net of observable algebras satisfying the Haag-Kastler axioms and the DHR selection criterion: representations that are equivalent to the vacuum representation on the algebra of every causally disconnected region. Under Haag duality these representations correspond to localized transportable endomorphisms of the observable algebra, and their intertwiners form a symmetric tensor $*$-category with conjugates, direct sums, and subobjects.
\end{definition}

The tensor structure of that category is concrete. Composition of endomorphisms supplies the tensor product, intertwiners supply the morphisms, conjugate endomorphisms supply duals, and the statistics of composing an endomorphism with itself distinguishes bosonic from fermionic sectors. Haag duality is the step that passes from representations to endomorphisms, and the selection criterion is what bounds the sectors; modified selection rules change the category.

\begin{theorem}[Doplicher-Roberts reconstruction]
\label{thm:dr}
Let $\mathcal{C}$ be a symmetric tensor $*$-category with conjugates, direct sums, and subobjects, and with $\operatorname{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent, as a symmetric tensor $*$-category, to the category of finite-dimensional unitary representations of a compact supergroup $G$, and $G$ is unique up to isomorphism.
\end{theorem}

\Cref{thm:dr} is stated with its hypotheses on the face of the statement. The symmetric structure, the existence of conjugates, and the scalar endomorphism ring of the unit are each used in the proof; a category missing them lies outside the theorem. The reconstruction of the gauge group from superselection data is the completion of the Doplicher-Haag-Roberts analysis, and the supergroup grading accounts for fermionic sectors.

\begin{remark}[Selection criteria matter]
\label{rem:selection}
The DHR criterion selects representations with trivial behaviour at infinity. Long-range forces such as electromagnetism violate the criterion, and the resulting categories fall outside \cref{thm:dr} unless the analysis is redone with modified selection rules. A classification claim for superselection categories is therefore always relative to the selection criterion in force.
\end{remark}

\begin{remark}[What reconstruction does not do]
\label{rem:scope}
The Doplicher-Roberts theorem recovers a symmetry group from sector data. It does not recover spacetime, dynamics, or states, and it does not classify the systems whose sectors are being read.
\end{remark}

\begin{theorem}[Deligne]
\label{thm:deligne}
Let $\mathcal{C}$ be a $\mathbb{C}$-linear, abelian, rigid symmetric tensor category over $\mathbb{C}$ of subexponential growth, with $\operatorname{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent, as a symmetric tensor category, to the category of finite-dimensional representations of an affine supergroup scheme. In particular the category is Tannakian in the super sense.
\end{theorem}

Deligne's theorem classifies a purely categorical hypothesis class, without reference to any net of observables. The two reconstruction theorems differ in their inputs and agree in their outputs. The Doplicher-Roberts theorem starts from the sectors of a net of observables, so its hypotheses are analytic as well as categorical: Haag duality, the selection criterion, and the tensor structure of intertwiners. Deligne's theorem starts from $\mathbb{C}$-linearity, abelianness, rigidity, symmetry, and subexponential growth. Both conclusions are representation categories of supergroups, so the two theorems are the analytic and the categorical face of one reconstruction pattern, and neither classifies the systems whose sectors or categories are being read. Together \cref{thm:dr,thm:deligne} settle the classification of the symmetric categories that appear as superselection data, and of the finite-growth categories that appear in low-dimensional and combinatorial models. The case of fusion categories (finitely many simple objects, semisimple, finite categorical dimension) is open beyond these hypotheses.

\begin{proposition}[Etingof-Gelaki counterexample]
\label{prop:eg}
There exist finite non-isomorphic groups $G_1$ and $G_2$ whose representation categories over $\mathbb{C}$ are equivalent as tensor categories, but not as symmetric tensor categories. Consequently an equivalence of tensor categories that forgets the symmetric structure cannot recover the group, and any classification of such categories built on that equivalence is false.
\end{proposition}

\begin{proof}
Etingof and Gelaki exhibit the affine symplectic group of a vector space over the field of two elements and a corresponding affine pseudosymplectic group: these are non-isomorphic and isocategorical, meaning their representation categories are monoidally equivalent. The symmetric structure of the two categories differs, and Tannaka reconstruction for symmetric tensor categories recovers the group from the symmetric structure alone. The symmetric layer is therefore load-bearing in the sense of \cref{def:preserved}, and an equivalence that discards it identifies objects that the classification must separate.
\end{proof}

\begin{remark}[Equivalence discipline]
\label{rem:egdiscipline}
Any equivalence of tensor categories must declare the layers it preserves. The standing qualification on relational characterizations applies in full: ``Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.''
\end{remark}

\begin{remark}[Fusion categories]
\label{rem:fusion}
Every fusion category is the representation category of a weak Hopf algebra, a result obtained through the module-category machinery of Ostrik, and this gives a presentation theorem rather than a classification. The structural conjectures of Etingof, Nikshych, and Ostrik, in particular the existence of a coherent monoidal isomorphism $A \cong A^{**}$ for every fusion category $A$, remain open, and this paper states all fusion-category claims as conditional on those conjectures.
\end{remark}

\section{Monotone metrics on quantum states}
\label{sec:metrics}

The measure-theoretic family contributes the third invariant type of the paper, and the quantum case is where a classical uniqueness theorem becomes a parametric classification.

\begin{definition}[Monotone metric]
\label{def:monotone}
Let $\mathcal{D}_n$ denote the manifold of strictly positive density matrices of $M_n(\mathbb{C})$, an open subset of the affine space of self-adjoint trace-one matrices, with tangent space $T_\rho \mathcal{D}_n$ the space of self-adjoint traceless matrices at $\rho$. A monotone metric assigns to each $\rho \in \mathcal{D}_n$ an inner product on $T_\rho \mathcal{D}_n$ such that the metric decreases under every completely positive trace-preserving map. In the classical setting the corresponding notion is monotonicity under stochastic maps.
\end{definition}

\begin{remark}[Classical uniqueness]
\label{rem:chentsov}
Chentsov's theorem classifies monotone metrics on the simplex of probability distributions: the Fisher metric is the unique metric, up to a positive constant, that decreases under every stochastic map. The quantum statement of \cref{thm:petz} replaces uniqueness by a parametric family, and no rescaling recovers a unique quantum metric. The contrast is the quantum instance of a classical-to-quantum gap that runs through the series: uniqueness statements on the classical side do not transfer.
\end{remark}

\begin{theorem}[Petz]
\label{thm:petz}
Monotone metrics on $\mathcal{D}_n$ are in bijection with operator monotone functions $f: (0,\infty) \to (0,\infty)$ that satisfy the symmetry condition $f(t) = t f(1/t)$ and the normalization $f(1) = 1$. Given such a function $f$, the corresponding metric on the tangent space $T_\rho \mathcal{D}_n$ is
\[
g_\rho^f(A, B) = \operatorname{Tr}\Bigl(A^* \bigl[R_\rho \, f(L_\rho R_\rho^{-1})\bigr]^{-1}(B)\Bigr),
\]
where $L_\rho$ and $R_\rho$ are the left and right multiplication operators by $\rho$ on $M_n(\mathbb{C})$. Distinct normalized operator monotone functions give distinct monotone metrics.
\end{theorem}

\begin{proof}[Status of the proof]
The classification is Petz's theorem. The condition $f(t) = t f(1/t)$ is the symmetry of the resulting form under exchange of $A$ and $B$, and the normalization $f(1) = 1$ fixes the scale: without it every positive scalar multiple of $f$ satisfies the symmetry condition and rescales the metric, and the correspondence is not a bijection. Distinct normalized functions give distinct metrics already on $2 \times 2$ density matrices. The proof is an operator-geometric argument in monotone matrix theory and is not reproduced here. The parametric conclusion is recorded in the sources of Petz and of Petz-Sudar, who construct and compare explicit members of the family and state the contrast with Chentsov uniqueness outright.
\end{proof}

\begin{corollary}[Parametricity of the quantum invariant]
\label{cor:parametric}
The monotone metrics of quantum states are classified by a continuous parameter (the normalized operator monotone function), not by a discrete choice. There is no quantum analogue of Chentsov uniqueness, and any classification statement for quantum monotone metrics must accept a parametric invariant in place of a unique object.
\end{corollary}

\begin{example}[Two standard metrics]
\label{ex:metrics}
The function $f(t) = (1 + t)/2$ is operator monotone and satisfies $f(1) = 1$ and $f(t) = t f(1/t)$. In the eigenbasis of $\rho$ with eigenvalues $\lambda_i$ its metric reads $g_\rho(A, A) = \sum_{i,j} 2 |A'_{ij}|^2 / (\lambda_i + \lambda_j)$ with $A' = U^* A U$, which is the metric of the symmetric logarithmic derivative. The function $f(t) = (1 + \sqrt{t})^2 / 4$ again satisfies both conditions and yields the Wigner-Yanase metric. The two metrics coincide on tangent directions commuting with $\rho$ and differ on every self-adjoint traceless direction with an off-diagonal entry in the eigenbasis of $\rho$, which is \cref{cor:parametric} in concrete form.
\end{example}

\begin{remark}[Distinguishability]
\label{rem:distinguish}
A monotone metric measures how fast nearby states separate under measurements, and monotonicity makes the separation decrease under every channel. Choosing a metric amounts to choosing a convention for statistical distance on quantum states, and \cref{thm:petz} shows the choice is a continuous parameter. Any classification or equivalence statement that uses statistical distance on quantum states must carry the parameter of \cref{cor:parametric} or fix it explicitly.
\end{remark}

\section{Classification regimes}
\label{sec:regimes}

Three regimes hold among the quantum classification problems: complete classification under stated hypotheses, uncountably many classes admitting no finite list of types, and open problems. \Cref{tab:regimes} records each domain with its invariant and source theorem.

\begin{table}[ht]
\centering
\caption{Classification regimes for quantum systems, with the invariant in force and the standing of each row.}
\label{tab:regimes}
\small
\begin{tabularx}{\textwidth}{@{}Y Y Y Y@{}}
\toprule
Domain & Invariant & Standing & Source \\
\midrule
Finite-dimensional $C^*$-algebras & Dimension vector & Classified completely & \Cref{thm:findim} \\
Completely positive maps & Kraus rank and Choi matrix & Normal form only & \Cref{thm:kraus} \\
Minimal dilations & Unitary class of the dilation & Classified completely & \Cref{thm:stinespring} \\
Amenable factors & Murray-von Neumann type and Connes invariants & Classified completely & \Cref{thm:amenable} \\
General $\mathrm{II}_1$ factors & Continuum many isomorphism classes & No finite list of types & \Cref{thm:mcduff} \\
Symmetric tensor categories under the hypotheses of \cref{thm:deligne} & Underlying supergroup & Classified completely & \Cref{thm:dr,thm:deligne} \\
Tensor equivalence without symmetric structure & None can recover the group & Proved insufficient & \Cref{prop:eg} \\
Monotone metrics on quantum states & Operator monotone function & Parametric classification & \Cref{thm:petz} \\
Fusion categories & Weak Hopf presentation & Open & \Cref{rem:fusion} \\
Non-amenable type $\mathrm{III}$ factors & Connes strata only & Open & \Cref{rem:typeIII} \\
Channels up to isomorphism & Kraus rank is not complete & Open & \Cref{rem:prohibition} \\
\bottomrule
\end{tabularx}
\end{table}

The regimes show a pattern the rest of the series exploits. Classification is complete exactly where the invariant is discrete or parametric and the hypotheses are stated; finite lists stop where the structure theory manufactures uncountably many non-isomorphic objects; and the question is open where a presentation theorem exists but the invariants do not separate. The finite-dimensional theory and the amenable theory differ in technique but agree in shape: both reduce a system to a list of standard pieces plus invariant data. The McDuff obstruction marks where that shape cannot persist.

Five kinds of classification result appear in \cref{tab:regimes}. The dimension-vector classification is complete and parameterized, in the manner of the Dynkin classification of semisimple Lie algebras. The amenable factor classification is complete and analytic, its invariants computed from operator-algebraic structure rather than read off combinatorial data. The monotone-metric classification is parametric, in the manner of a classification by continuous parameters.

The McDuff corollary is a complete obstruction: its classification content is the proof that no finite list exists. The remaining rows are open problems with presentation theorems but no separating invariants. These five kinds separate cleanly, and a quantum classification claim that mixes two of them is misstated.

Five open problems bound the current frontier.
\begin{enumerate}
\item The Elliott program for separable simple nuclear $C^*$-algebras lacks a finished classification statement with its universal coefficient theorem resolved.
\item The structural conjectures for fusion categories, beginning with coherent double-dual isomorphisms, are unproved, and every fusion-category claim in this paper is conditional on them.
\item The structure of non-amenable type $\mathrm{III}$ factors beyond the Connes strata is open.
\item No isomorphism classification of quantum channels exists beyond the Stinespring normal form, and \cref{prop:krausrank} shows that the obvious invariant does not provide one.
\item Whether any restricted classification of non-amenable $\mathrm{II}_1$ factors survives under rigidity hypotheses is not addressed by the sources consulted here and is recorded as open.
\end{enumerate}

\section{Computational evidence}
\label{sec:computation}

The source files that accompany this paper as supplementary material contain executable models and three experiment scripts; they live in the directory \path{src/vol-06-quantum-systems/}. They are computational evidence for the finite-dimensional and channel statements. They are not proofs, and no part of the paper rests on them for validity.

The Haskell module \path{Instances.hs} instantiates the taxonomy classes for this paper's physical systems: finite-dimensional block algebras, Hilbert-space systems with observable algebras, operator-algebra systems with factor data, quantum channels with Kraus data, and superselection categories with tensor data. The instances cover the system-record class, the Hilbert-space and operator-algebra family class, the probability and measure family class on the quantum side, the tensor-category family class, the construction and decomposition hooks, irreducibility of matrix blocks under direct sum, and mathematical equivalence of block algebras by dimension vector. The instances name their methods after the definitions and theorem targets of this paper (dimension vector, minimal Kraus rank, Stinespring minimal dilation, operator monotone parameter). These are executable models of the taxonomy, validated against the statements of the paper; no machine-checked formalization is claimed for them.

Three Python scripts carry the finite-dimensional experiments. The first enumerates small finite-dimensional $C^*$-algebras by dimension vector and checks the counting statement of \cref{cor:count} and the isomorphism criterion of \cref{thm:findim}. The second constructs Choi matrices of sample channels, computes Kraus ranks, minimizes Kraus presentations, and exhibits channels of equal Kraus rank that no unitary identification matches, evidencing \cref{prop:krausrank}. The third builds monotone metrics from normalized operator monotone functions on $2 \times 2$ density matrices, checks positivity of the resulting forms, and confirms that distinct functions give distinct metrics, evidencing \cref{thm:petz} and \cref{cor:parametric}. Each script prints its checks and exits nonzero on failure. \Cref{tab:results} records the checks of a recorded run.

\begin{table}[ht]
\centering
\caption{Checks and recorded outputs of the three experiment scripts in a single run.}
\label{tab:results}
\small
\begin{tabularx}{\textwidth}{@{}Y Y Y@{}}
\toprule
Script & Check & Recorded output \\
\midrule
\path{finite_dim_cstar_decomposition.py} & Isomorphism criterion on all algebras up to dimension 16 & No failures \\
\path{finite_dim_cstar_decomposition.py} & Algebra counts per dimension & Matches \cref{tab:counts} through $d = 12$ \\
\path{finite_dim_cstar_decomposition.py} & Tensor products multiply block sizes & $\{2, 3\} \otimes \{2\} = \{4, 6\}$ \\
\path{stinespring_kraus_rank.py} & Choi rank of the channel family of \cref{ex:depol} & Rank 4 at all sampled $p$ \\
\path{stinespring_kraus_rank.py} & Minimal Kraus presentation preserves the channel & Four operators, channel preserved \\
\path{stinespring_kraus_rank.py} & Unitary invariance of Kraus rank & Rank preserved \\
\path{petz_monotone_metrics.py} & Positivity of Petz forms on sampled tangent vectors & Minimum sampled value 0.5755 \\
\path{petz_monotone_metrics.py} & Distinct functions give distinct metrics & Distinct on all samples \\
\bottomrule

exec
/usr/local/bin/zsh -lc 'python3 -B src/vol-06-quantum-systems/finite_dim_cstar_decomposition.py' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 17ms:
isomorphism_criterion: witnesses and separating invariants checked up to dim 16
classify_by_dimension counts: {1: 1, 2: 1, 3: 1, 4: 2, 5: 2, 6: 2, 7: 2, 8: 3, 9: 4, 10: 4, 11: 4, 12: 5, 13: 6, 14: 6, 15: 6, 16: 8}
tensor_dimension_vector: (2, 3) x (2,) = (4, 6)
direct_sum_dimension_vector: (2, 3) + (2,) = (2, 2, 3)
ALL CHECKS PASSED

exec
/usr/local/bin/zsh -lc 'python3 -B src/vol-06-quantum-systems/stinespring_kraus_rank.py' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 67ms:
kraus_rank: Choi eigenvalue count and independent span count agree
minimize_kraus: reduced to 4 operators, channel preserved
check_rank_invariance: rank preserved under unitary conjugation
same_rank_distinct_channels: ranks={0.2: 4, 0.5: 4, 0.8: 4}, spectra distinct=True
  profile p=0.2: [0.133333 0.133333 0.133333 1.6     ]
  profile p=0.8: [0.4      0.533333 0.533333 0.533333]
ALL CHECKS PASSED

exec
/usr/local/bin/zsh -lc 'python3 -B src/vol-06-quantum-systems/petz_monotone_metrics.py' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 40ms:
check_monotone_positive: weights positive and minimum sampled value 0.575496
distinct_functions_distinct_metrics: distinct=True
  f_mid: sample values [2.145149 5.712563 2.775101]
  f_rec: sample values [16.490821  6.498195  3.787825]
  f_wy: sample values [3.129544 5.796595 2.977492]
ALL CHECKS PASSED

exec
/usr/local/bin/zsh -lc "sed -n '420,495p' papers/latex/vol-06-quantum-systems.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
\begin{proposition}[Kraus rank is a normal-form invariant]
\label{prop:krausrank}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be a channel. The Kraus rank of $\Phi$ equals the rank of its Choi matrix, equals the minimal number of Kraus operators in any representation of $\Phi$, and equals the dimension of the environment $K$ in a minimal Stinespring dilation. The Kraus rank is preserved by unitary changes of Kraus presentation and by composition of $\Phi$ with unitary conjugations of domain and codomain. It is not a complete invariant of channels: two channels with equal Kraus rank need not be unitarily equivalent.
\end{proposition}

\begin{proof}
The equalities with the Choi rank and the minimal Kraus number are \cref{thm:kraus}; the equality with the minimal dilation dimension is the construction of \cref{thm:stinespring} specialized to matrix algebras. Unitary conjugation of the Kraus operators replaces each $A_i$ by $W A_i U^*$ with $U, W$ unitary and does not change the rank of the Choi matrix. For the negative statement take the channel family $\Phi_p$ of \cref{ex:depol}. Its Kraus rank is $4$ for every $p \in (0,1)$, its Choi eigenvalues $2(1-p)$ and $2p/3$ vary with $p$, and unitary equivalence of channels preserves the Choi spectrum. Distinct values of $p$ give inequivalent channels with equal Kraus rank.
\end{proof}

\begin{remark}[Prohibition recorded]
\label{rem:prohibition}
\Cref{prop:krausrank} records the exact boundary. Kraus rank may be used to compare normal forms of one channel and to detect minimality of a dilation. It may not be used as an isomorphism classification of channels, and no theorem of this paper treats it as one. The Kraus rank is an invariant of the minimal dilation layer of structure and carries no classification claim for the channel layer.
\end{remark}

\begin{proposition}[Composition of channels]
\label{prop:compose}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ and $\Psi: M_m(\mathbb{C}) \to M_p(\mathbb{C})$ be linear. Then
\[
J(\Psi \circ \Phi)_{(i\alpha),(j\beta)} = \sum_{k,l=1}^{m} J(\Phi)_{(ik),(jl)} \, J(\Psi)_{(k\alpha),(l\beta)},
\]
with composite indices as in \cref{lem:choi}. The right-hand side is the link product of $J(\Phi)$ and $J(\Psi)$: matrix multiplication of $J(\Phi)$ after partial transpose on the shared subsystem, contracted with $J(\Psi)$ along that subsystem. Composition of channels is therefore a link-product contraction, and the Choi matrix of a composite is determined by the Choi matrices of the factors.
\end{proposition}

\begin{proof}
Write $\Phi(E_{ij}) = \sum_{k,l} c^{ij}_{kl} E_{kl}$ and read $J(\Phi)_{(ik),(jl)} = c^{ij}_{kl}$ and $J(\Psi)_{(k\alpha),(l\beta)} = \Psi(E_{kl})_{\alpha\beta}$. The right-hand side of the claimed identity is then $\sum_{k,l} c^{ij}_{kl} \Psi(E_{kl})_{\alpha\beta} = \Psi(\Phi(E_{ij}))_{\alpha\beta}$, which is $J(\Psi \circ \Phi)_{(i\alpha),(j\beta)}$ by definition.
\end{proof}

\begin{remark}[What a channel classification would need]
\label{rem:channelclass}
A classification of channels up to unitary equivalence would need invariants separating the orbits of the unitary action $\{A_k\} \mapsto \{W A_k U^*\}$ on Kraus presentations. The Choi spectrum is one such invariant and is not complete, as \cref{ex:depol} shows at the level of spectra alone; the orbit data of a presentation involves the arrangement of its Kraus vectors in $\mathbb{C}^n \otimes \mathbb{C}^m$ beyond their Gram matrix. No complete set of orbit invariants is on record, and this is the fourth open problem of \cref{sec:regimes}.
\end{remark}

\section{Tensor categories and superselection}
\label{sec:tensor}

Superselection sectors of a quantum field theory organize into tensor categories, and two reconstruction theorems classify such categories under explicit hypotheses. The hypotheses are load-bearing: both theorems fail or become open when they are dropped, and one equivalence-negligible layer turns out to carry the group.

\begin{definition}[Superselection category]
\label{def:dhr}
Fix a local net of observable algebras satisfying the Haag-Kastler axioms and the DHR selection criterion: representations that are equivalent to the vacuum representation on the algebra of every causally disconnected region. Under Haag duality these representations correspond to localized transportable endomorphisms of the observable algebra, and their intertwiners form a symmetric tensor $*$-category with conjugates, direct sums, and subobjects.
\end{definition}

The tensor structure of that category is concrete. Composition of endomorphisms supplies the tensor product, intertwiners supply the morphisms, conjugate endomorphisms supply duals, and the statistics of composing an endomorphism with itself distinguishes bosonic from fermionic sectors. Haag duality is the step that passes from representations to endomorphisms, and the selection criterion is what bounds the sectors; modified selection rules change the category.

\begin{theorem}[Doplicher-Roberts reconstruction]
\label{thm:dr}
Let $\mathcal{C}$ be a symmetric tensor $*$-category with conjugates, direct sums, and subobjects, and with $\operatorname{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent, as a symmetric tensor $*$-category, to the category of finite-dimensional unitary representations of a compact supergroup $G$, and $G$ is unique up to isomorphism.
\end{theorem}

\Cref{thm:dr} is stated with its hypotheses on the face of the statement. The symmetric structure, the existence of conjugates, and the scalar endomorphism ring of the unit are each used in the proof; a category missing them lies outside the theorem. The reconstruction of the gauge group from superselection data is the completion of the Doplicher-Haag-Roberts analysis, and the supergroup grading accounts for fermionic sectors.

\begin{remark}[Selection criteria matter]
\label{rem:selection}
The DHR criterion selects representations with trivial behaviour at infinity. Long-range forces such as electromagnetism violate the criterion, and the resulting categories fall outside \cref{thm:dr} unless the analysis is redone with modified selection rules. A classification claim for superselection categories is therefore always relative to the selection criterion in force.
\end{remark}

\begin{remark}[What reconstruction does not do]
\label{rem:scope}
The Doplicher-Roberts theorem recovers a symmetry group from sector data. It does not recover spacetime, dynamics, or states, and it does not classify the systems whose sectors are being read.
\end{remark}

\begin{theorem}[Deligne]
\label{thm:deligne}
Let $\mathcal{C}$ be a $\mathbb{C}$-linear, abelian, rigid symmetric tensor category over $\mathbb{C}$ of subexponential growth, with $\operatorname{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent, as a symmetric tensor category, to the category of finite-dimensional representations of an affine supergroup scheme. In particular the category is Tannakian in the super sense.
\end{theorem}

Deligne's theorem classifies a purely categorical hypothesis class, without reference to any net of observables. The two reconstruction theorems differ in their inputs and agree in their outputs. The Doplicher-Roberts theorem starts from the sectors of a net of observables, so its hypotheses are analytic as well as categorical: Haag duality, the selection criterion, and the tensor structure of intertwiners. Deligne's theorem starts from $\mathbb{C}$-linearity, abelianness, rigidity, symmetry, and subexponential growth. Both conclusions are representation categories of supergroups, so the two theorems are the analytic and the categorical face of one reconstruction pattern, and neither classifies the systems whose sectors or categories are being read. Together \cref{thm:dr,thm:deligne} settle the classification of the symmetric categories that appear as superselection data, and of the finite-growth categories that appear in low-dimensional and combinatorial models. The case of fusion categories (finitely many simple objects, semisimple, finite categorical dimension) is open beyond these hypotheses.

\begin{proposition}[Etingof-Gelaki counterexample]
\label{prop:eg}
There exist finite non-isomorphic groups $G_1$ and $G_2$ whose representation categories over $\mathbb{C}$ are equivalent as tensor categories, but not as symmetric tensor categories. Consequently an equivalence of tensor categories that forgets the symmetric structure cannot recover the group, and any classification of such categories built on that equivalence is false.
\end{proposition}

\begin{proof}
Etingof and Gelaki exhibit the affine symplectic group of a vector space over the field of two elements and a corresponding affine pseudosymplectic group: these are non-isomorphic and isocategorical, meaning their representation categories are monoidally equivalent. The symmetric structure of the two categories differs, and Tannaka reconstruction for symmetric tensor categories recovers the group from the symmetric structure alone. The symmetric layer is therefore load-bearing in the sense of \cref{def:preserved}, and an equivalence that discards it identifies objects that the classification must separate.
\end{proof}

exec
/usr/local/bin/zsh -lc "sed -n '394,420p' papers/latex/vol-06-quantum-systems.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:

\begin{remark}[Normal form versus classification]
\label{rem:normalform}
\Cref{thm:kraus} is a normal-form theorem, not a classification of channels up to isomorphism. The Kraus rank is an invariant of the minimal presentation of one channel. \Cref{sec:channels} exhibits channels with equal Kraus rank that no unitary change of presentation identifies, and the literature records no isomorphism classification of channels beyond the normal form.
\end{remark}

\subsection{Stinespring dilations}

Stinespring's theorem gives every channel a canonical dilation through an environment, and a minimal dilation is unique up to unitary. The statement is the second canonical-form theorem of the paper.

\begin{theorem}[Stinespring dilation]
\label{thm:stinespring}
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be a channel. Then $\Phi$ admits a Stinespring dilation $(K, V)$ in the sense of \cref{def:channels}, and minimal dilations exist. Any two minimal dilations $(K, V)$ and $(K', V')$ of $\Phi$ are unitarily equivalent: there is a unitary $U: K \to K'$ with $(I_m \otimes U) V = V'$. The dimension $\dim K$ of a minimal dilation equals the Kraus rank of $\Phi$.
\end{theorem}

\begin{proof}
Take a Kraus presentation $\Phi(X) = \sum_{k=1}^{r} A_k X A_k^*$ as in \cref{thm:kraus}, with $r$ the Choi rank. Set $K = \mathbb{C}^r$ and define $V: \mathbb{C}^n \to \mathbb{C}^m \otimes K$ by $V \psi = \sum_{k=1}^{r} (A_k \psi) \otimes e_k$ for the standard basis $e_k$ of $K$. Then $V^* V = \sum_k A_k^* A_k = I_n$ because $\Phi$ preserves trace, so $V$ is an isometry, and $\operatorname{Tr}_K(V X V^*) = \sum_k A_k X A_k^* = \Phi(X)$. A dilation on a space of dimension less than $r$ would yield a Kraus presentation with fewer than $r$ operators, which \cref{thm:kraus} forbids, so this dilation is minimal. For uniqueness, both $K$ and $K'$ are spanned by vectors of the form $(w^* \otimes I) V \psi$ and $(w^* \otimes I) V' \psi$ with $w \in \mathbb{C}^m$ and $\psi \in \mathbb{C}^n$, the correspondence between these vectors preserves inner products because both dilations realize the same map $\Phi$, and it extends to a unitary $U: K \to K'$ with $(I_m \otimes U) V = V'$. For completely positive unital maps on a general $C^*$-algebra the dual picture holds: $\Phi(a) = V^* \pi(a) V$ with $\pi$ a unital $*$-representation and $V$ an isometry, which is Stinespring's original form.
\end{proof}

\begin{remark}[Two pictures]
\label{rem:pictures}
Channels appear in two standard forms. In the Schr\"odinger picture a channel is completely positive and trace preserving, acting on states and dilating through an environment as in \cref{def:channels}. In the Heisenberg picture a channel is a unital completely positive map of observable algebras, and its Stinespring form is the compression $\Phi(a) = V^* \pi(a) V$ named at the end of \cref{thm:stinespring}. The two pictures are related by adjunction, the dilation statements hold in either, and the invariant content is the same.
\end{remark}

For channels on matrix algebras the minimal dilation is finite-dimensional and the unitary freedom of \cref{thm:stinespring} is exactly the change-of-presentation freedom of Kraus operators.

\begin{proposition}[Kraus rank is a normal-form invariant]

codex
ROW 1 | Isomorphism criterion matches enumerated classes through dimension 16 | SUPPORTS | Every enumerated pair passes, with block-matching witnesses or independently computed separating ideal dimensions.
ROW 2 | Algebra counts match square partitions | SUPPORTS | Square-partition enumeration produces counts matching the paper’s table through dimension 12.
ROW 3 | Tensor products multiply block sizes | SUPPORTS | The function computes all pairwise block-size products and passes the example and dimension-accounting checks.
ROW 4 | Kraus rank equals Choi rank | SUPPORTS | Choi eigenvalue counts agree with independently computed Kraus-vector span dimensions on the sampled channels.
ROW 5 | Minimal Kraus presentations reduce correctly | SUPPORTS | Spectral reconstruction removes the padded zero operator, produces four operators, and preserves sampled channel evaluations.
ROW 6 | Equal Kraus rank does not classify channels | SUPPORTS | Three sampled channels have rank four and pairwise distinct Choi spectra, obstructing unitary equivalence.
ROW 7 | Petz forms are positive on sampled tangent vectors | SUPPORTS | All sampled weights and nonzero tangent-vector evaluations are positive, with minimum value 0.575496.
ROW 8 | Distinct functions give distinct metrics | SUPPORTS | The three implemented functions produce pairwise distinct metric-value arrays on shared samples.
ROW 9 | Taxonomy instances cover the volume’s systems | SUPPORTS | Instance declarations cover system records, factors, channels, density matrices, superselection categories, and block-algebra constructions and equivalence.
VERDICT: PASS
hook: Stop
hook: Stop Completed
tokens used
54,359
ROW 1 | Isomorphism criterion matches enumerated classes through dimension 16 | SUPPORTS | Every enumerated pair passes, with block-matching witnesses or independently computed separating ideal dimensions.
ROW 2 | Algebra counts match square partitions | SUPPORTS | Square-partition enumeration produces counts matching the paper’s table through dimension 12.
ROW 3 | Tensor products multiply block sizes | SUPPORTS | The function computes all pairwise block-size products and passes the example and dimension-accounting checks.
ROW 4 | Kraus rank equals Choi rank | SUPPORTS | Choi eigenvalue counts agree with independently computed Kraus-vector span dimensions on the sampled channels.
ROW 5 | Minimal Kraus presentations reduce correctly | SUPPORTS | Spectral reconstruction removes the padded zero operator, produces four operators, and preserves sampled channel evaluations.
ROW 6 | Equal Kraus rank does not classify channels | SUPPORTS | Three sampled channels have rank four and pairwise distinct Choi spectra, obstructing unitary equivalence.
ROW 7 | Petz forms are positive on sampled tangent vectors | SUPPORTS | All sampled weights and nonzero tangent-vector evaluations are positive, with minimum value 0.575496.
ROW 8 | Distinct functions give distinct metrics | SUPPORTS | The three implemented functions produce pairwise distinct metric-value arrays on shared samples.
ROW 9 | Taxonomy instances cover the volume’s systems | SUPPORTS | Instance declarations cover system records, factors, channels, density matrices, superselection categories, and block-algebra constructions and equivalence.
VERDICT: PASS
