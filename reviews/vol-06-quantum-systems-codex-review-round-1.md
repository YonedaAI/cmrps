---
reviewer: codex (OpenAI) gpt-6.1-sol
type: formatting
paper: vol-06-quantum-systems
round: 1
date: 2026-10-30T06:30:15Z
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
session id: 01a18b80-7de6-7af2-a2b0-afc1458f2196
--------
user
Read ONLY the file papers/latex/vol-06-quantum-systems.tex (do not explore other files or directories). Review it for LaTeX formatting issues: compilation errors, missing packages, broken references, inconsistent styling, overfull/underfull boxes, spacing problems. List all issues with line numbers and concrete fixes. End your response with a VERDICT line - exactly one of: VERDICT: PASS (no issues remain) or VERDICT: NEEDS_FIX (issues listed above must be fixed).
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
I’ll read only the specified LaTeX file and check for formatting issues, with line numbers and concrete fixes.
exec
/usr/local/bin/zsh -lc 'nl -ba papers/latex/vol-06-quantum-systems.tex' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
     1	\documentclass[11pt,letterpaper]{article}
     2	
     3	\usepackage[T1]{fontenc}
     4	\usepackage{lmodern}
     5	\usepackage{microtype}
     6	\usepackage[margin=1in]{geometry}      % one-inch margins, as the writing standard specifies
     7	\linespread{1.0}
     8	\setlength{\parskip}{0pt}          % conventional article: indent, no vertical gap
     9	\setlength{\parindent}{1.5em}
    10	
    11	\usepackage{amsmath,amssymb,amsthm}
    12	\usepackage{graphicx}
    13	\usepackage{xcolor}
    14	\usepackage{tikz}                  % and tikz-cd when commutative diagrams are used
    15	\usepackage{booktabs,tabularx,array,longtable}
    16	\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
    17	\usepackage[hidelinks]{hyperref}
    18	\usepackage{cleveref}
    19	
    20	\newtheorem{theorem}{Theorem}[section]
    21	\newtheorem{proposition}[theorem]{Proposition}
    22	\newtheorem{lemma}[theorem]{Lemma}
    23	\newtheorem{corollary}[theorem]{Corollary}
    24	\theoremstyle{definition}
    25	\newtheorem{definition}[theorem]{Definition}
    26	\newtheorem{example}[theorem]{Example}
    27	\theoremstyle{remark}
    28	\newtheorem{remark}[theorem]{Remark}
    29	
    30	\crefname{theorem}{theorem}{theorems}
    31	\Crefname{theorem}{Theorem}{Theorems}
    32	\crefname{proposition}{proposition}{propositions}
    33	\Crefname{proposition}{Proposition}{Propositions}
    34	\crefname{lemma}{lemma}{lemmas}
    35	\crefname{corollary}{corollary}{corollaries}
    36	\crefname{definition}{definition}{definitions}
    37	\Crefname{definition}{Definition}{Definitions}
    38	\crefname{example}{example}{examples}
    39	\Crefname{example}{Example}{Examples}
    40	\crefname{remark}{remark}{remarks}
    41	\crefname{section}{section}{sections}
    42	\Crefname{section}{Section}{Sections}
    43	\crefname{table}{table}{tables}
    44	\Crefname{table}{Table}{Tables}
    45	
    46	\title{Classification of Quantum Physical Systems\\[4pt]
    47	  {\normalsize Part VI of \emph{The Classification of Mathematical Representations of Physical Systems}}}
    48	\author{Matthew Long\\
    49	  \small The YonedaAI Collaboration, YonedaAI Research Collective\\
    50	  \small Chicago, Illinois, USA\\
    51	  \small \texttt{matthew@yonedaai.com}\\
    52	  \small \texttt{https://yonedaai.com}}
    53	\date{29 October 2026}
    54	
    55	\begin{document}
    56	
    57	\maketitle
    58	
    59	\begin{abstract}
    60	Quantum physical systems admit a complete structural classification only in restricted regimes, and this paper records where those regimes begin and end. Finite-dimensional observable algebras are classified by one combinatorial invariant, the dimension vector of the block decomposition. Amenable operator-algebraic models are classified by Murray-von Neumann type together with Connes invariants. Completely positive maps admit a canonical normal form through minimal Stinespring dilations, unique up to unitary equivalence, and the Kraus rank of that normal form is not an isomorphism invariant of channels. Beyond the amenable class no finite answer is possible: uncountably many pairwise non-isomorphic separable $\mathrm{II}_1$ factors exist, so no finite list of factor types can be exhaustive. On the categorical side, the Doplicher-Roberts reconstruction theorem and Deligne's theorem classify superselection and symmetric tensor categories under explicit hypotheses, and the Etingof-Gelaki examples show that any equivalence forgetting the symmetric structure fails to recover its group. Quantum monotone metrics form a parametric family rather than a unique choice. The paper separates classified islands from proved impossibilities and open problems, and reports executable models of the finite-dimensional taxonomy as computational evidence only.
    61	\end{abstract}
    62	
    63	\section{Introduction}
    64	
    65	Three kinds of result organize the classification of quantum physical systems: complete classification theorems, proved non-classification theorems, and open problems. The finite-dimensional theory is complete and combinatorial. The amenable operator-algebraic theory is complete and analytic. Outside the amenable class, McDuff's theorem of 1969 rules out any finite list of factor types, and this negative result is content of the theory, not a temporary difficulty. The categorical theory is complete under explicit hypotheses and open without them.
    66	
    67	The classification question follows the program of this series. Fix a category of mathematical representations of physical systems and an equivalence relation on its objects; classify the objects up to that equivalence. For quantum systems the representations are operator-algebraic and categorical: Hilbert spaces, $C^*$-algebras and von Neumann algebras of observables, completely positive maps between them, and tensor categories of superselection sectors. The equivalence relations that appear in established results are exact: $*$-isomorphism of algebras, unitary equivalence of dilations, monoidal equivalence of categories, each with the structure it preserves made explicit.
    68	
    69	Three structural families carry the quantum material: Hilbert spaces and operator algebras, probability and measure structure on the quantum side, and tensor categories with compositional structure. The classifying invariants in force are correspondingly three kinds: a discrete invariant (the dimension vector), a pair of analytic invariants (Murray-von Neumann type and Connes invariants), and a parametric invariant (an operator monotone function classifying a monotone metric). The families are candidate organizing families, and no independence or completeness claim about them is used here.
    70	
    71	Two scope restrictions hold throughout. The long-term classification target of the program is a research objective and is never assumed as a hypothesis; every statement proved here is proved from its own hypotheses. The paper classifies mathematical representations of physical systems.
    72	
    73	\section{Mathematical framework}
    74	
    75	\begin{definition}[Quantum system record]
    76	\label{def:system}
    77	A quantum system record is a tuple $P = (H, A, D, S, C)$ where $H$ is a complex Hilbert space, $A$ is a $C^*$-algebra of observables represented on $H$, $D$ is the dynamical data (a flow, a semigroup of endomorphisms, or a generator), $S$ is the symmetry and constraint data (a group or groupoid action with its fixed-point structure), and $C$ is the composition data (tensor product or another monoidal operation on records of the same kind). The five components need not be independent.
    78	\end{definition}
    79	
    80	A morphism of records commutes with the data it claims to preserve, and every equivalence statement below names the preserved layers on its face. The classification results below concern projections of the record: the observable algebra, the channel data, the sector category, and the state-space metric. \Cref{rem:dimvec} states what that projection costs for the full tuple.
    81	
    82	\begin{definition}[Classification problem]
    83	\label{def:classproblem}
    84	Fix a class $\mathcal{Q}$ of quantum system records and an equivalence relation $\approx$ on $\mathcal{Q}$ declared with its preserved layers as in \cref{def:preserved}. The classification problem for $(\mathcal{Q}, \approx)$ is to construct an invariant $I$ on $\mathcal{Q}$ with $I(P) = I(Q)$ exactly when $P \approx Q$. The equivalences in force below are $*$-isomorphism for observable algebras, unitary equivalence for minimal dilations, symmetric tensor equivalence for superselection categories, and equality of the operator monotone parameter for monotone metrics.
    85	\end{definition}
    86	
    87	\begin{definition}[Observable algebras]
    88	\label{def:observables}
    89	A finite-dimensional quantum system is a record with $\dim H = n < \infty$ and $A \subseteq B(H)$ a $C^*$-subalgebra of the algebra of bounded operators on $H$. As an abstract $C^*$-algebra $A$ is finite-dimensional and unital, with a unit that need not be the identity of $B(H)$; \cref{thm:findim} applies to $A$ as an abstract algebra. An operator-algebraic system is a record whose observable algebra $A$ is a $C^*$-algebra or a von Neumann algebra of arbitrary dimension. A factor is a von Neumann algebra with trivial center.
    90	\end{definition}
    91	
    92	\begin{definition}[States and channels]
    93	\label{def:channels}
    94	A state on a $C^*$-algebra $A$ is a positive linear functional $\rho$ of norm one. A channel between matrix algebras $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ is a linear map that is completely positive and trace preserving. A Stinespring dilation of a channel $\Phi$ is a pair $(K, V)$ with $K$ a finite-dimensional Hilbert space (the environment) and $V: \mathbb{C}^n \to \mathbb{C}^m \otimes K$ an isometry such that
    95	\[
    96	\Phi(X) = \operatorname{Tr}_K\bigl(V X V^*\bigr) \qquad \text{for all } X \in M_n(\mathbb{C}).
    97	\]
    98	The dilation is minimal when no proper subspace of $K$ carries a dilation of $\Phi$.
    99	\end{definition}
   100	
   101	\begin{definition}[Dimension vector]
   102	\label{def:dimvec}
   103	Let $A$ be a finite-dimensional $C^*$-algebra. The dimension vector of $A$ is the multiset of matrix block sizes appearing in the decomposition of \cref{thm:findim}, written $\mathbf{d}(A) = \{n_1, \dots, n_k\}$ with each $n_i \geq 1$ and repetition allowed.
   104	\end{definition}
   105	
   106	\begin{definition}[Preserved structure of an equivalence]
   107	\label{def:preserved}
   108	An equivalence used to identify two quantum system records must state which layers it preserves. The layers named in this paper are the $*$-structure of observable algebras, the monoidal structure of tensor products, the symmetric structure of a tensor category, and the complete positivity of channels. An identification that does not name its preserved layers is inadmissible.
   109	\end{definition}
   110	
   111	The counterexample of \cref{sec:tensor} shows that an equivalence of tensor categories which forgets the symmetric layer cannot recover the group it classifies, so a classification built on such an equivalence is false.
   112	
   113	\begin{example}[Qubit composite systems]
   114	\label{ex:qubits}
   115	A single qubit record has $H = \mathbb{C}^2$ and observables $M_2(\mathbb{C})$. An $N$-qubit record has $H = (\mathbb{C}^2)^{\otimes N}$ and observables $M_{2^N}(\mathbb{C})$ or a subalgebra of it, with composition data the tensor product of \cref{prop:tensor}. The dimension vector of the full observable algebra is $\{2^N\}$, and subalgebras correspond to blocks of smaller size in the sense of \cref{thm:findim}. Symmetry actions such as the Pauli group permute and mix the blocks, and that action is data the dimension vector does not carry.
   116	\end{example}
   117	
   118	\begin{definition}[Invariants]
   119	\label{def:invariants}
   120	A classifying invariant for a class of records is a map $I$ such that $I(P) = I(Q)$ if and only if $P$ and $Q$ are equivalent under the relation in force. The classifying invariants of this paper are the dimension vector (\cref{def:dimvec}), the Murray-von Neumann type and the Connes invariants of a factor, and the operator monotone function classifying a monotone metric on quantum states. The Kraus rank of a minimal dilation is a normal-form dimension and not a classifying invariant for channels (\cref{rem:normalform}).
   121	\end{definition}
   122	
   123	Classification invariants separate at three levels of resolution. The dimension vector completely separates finite-dimensional observable algebras up to $*$-isomorphism (\cref{thm:findim}). Operator monotone functions parameterize the monotone metrics of quantum states without singling out a unique metric (\cref{thm:petz}). Minimal Stinespring dilations give canonical normal forms for completely positive maps while failing to separate unitarily inequivalent channels (\cref{prop:krausrank}).
   124	
   125	\Cref{tab:families} records the families in force, their defining invariants, and what the established theorems say about each.
   126	
   127	\begin{table}[ht]
   128	\centering
   129	\caption{Structural families carrying quantum systems, with the classifying data each family actually admits in the established literature.}
   130	\label{tab:families}
   131	\small
   132	\begin{tabularx}{\textwidth}{@{}X X X X@{}}
   133	\toprule
   134	Family & Object & Classifying invariant & Status \\
   135	\midrule
   136	II, Hilbert spaces and operator algebras & Finite-dimensional $C^*$-algebras & Dimension vector & Complete classification \\
   137	II, Hilbert spaces and operator algebras & Amenable factors & Murray-von Neumann type and Connes invariants & Complete classification \\
   138	II, Hilbert spaces and operator algebras & General $\mathrm{II}_1$ factors & No parametric invariant can suffice & Proved non-classifiable \\
   139	V, probability and measure structure & Monotone metrics on density matrices & Operator monotone function & Parametric classification \\
   140	VIII, tensor categories and composition & Symmetric tensor categories under the hypotheses of \cref{thm:deligne} & Underlying supergroup & Complete under stated hypotheses \\
   141	VIII, tensor categories and composition & Fusion categories & Weak Hopf presentation only & Open \\
   142	\bottomrule
   143	\end{tabularx}
   144	\end{table}
   145	
   146	The classes covered below are fixed here: finite-dimensional quantum systems with observable $C^*$-algebras, operator-algebraic systems with factor observable algebras, channels between matrix algebras, superselection categories of local nets under the DHR selection criterion, and density-matrix state spaces with monotone metrics. Gauge-theoretic and gravitational systems lie outside this scope.
   147	
   148	\section{Finite-dimensional quantum systems}
   149	\label{sec:findim}
   150	
   151	Finite-dimensional quantum systems are the reference case for the whole program: the classification is complete, the invariant is discrete, and the proofs are self-contained. The observable algebra of such a system is a finite-dimensional $C^*$-algebra, and the structure theorem below reduces every such algebra to matrix blocks.
   152	
   153	\begin{theorem}[Structure of finite-dimensional $C^*$-algebras]
   154	\label{thm:findim}
   155	Let $A$ be a finite-dimensional complex $C^*$-algebra. Then there are integers $n_1, \dots, n_k \geq 1$ and a $*$-isomorphism
   156	\[
   157	A \cong M_{n_1}(\mathbb{C}) \oplus \cdots \oplus M_{n_k}(\mathbb{C}).
   158	\]
   159	The multiset $\{n_1, \dots, n_k\}$ determines $A$ up to $*$-isomorphism, and two finite-dimensional $C^*$-algebras are $*$-isomorphic if and only if their dimension vectors agree as multisets.
   160	\end{theorem}
   161	
   162	\begin{proof}
   163	The Jacobson radical $J(A)$ of the finite-dimensional algebra $A$ is nilpotent: $J(A)^k = \{0\}$ for some $k$, so every element of $J(A)$ is nilpotent. For $x \in J(A)$ the element $x^* x$ lies in $J(A)$ and is self-adjoint and nilpotent, hence has spectrum $\{0\}$, and the $C^*$-identity $\|x\|^2 = \|x^* x\| = r(x^* x)$ gives $x = 0$. Thus $J(A) = \{0\}$ and $A$ is semisimple. By the Artin-Wedderburn theorem over the algebraically closed field $\mathbb{C}$ the algebra decomposes as $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ with each summand a simple two-sided ideal. Each simple ideal is stable under the involution: if an ideal $I$ satisfied $I \cap I^* = \{0\}$, then every $y \in I$ would satisfy $y^* y \in I \cap I^* = \{0\}$, forcing $y = 0$. Because every conjugate-linear anti-automorphism of $M_{n_i}(\mathbb{C})$ that makes it a $C^*$-algebra is conjugate through an inner automorphism to the standard adjoint, the algebraic direct sum lifts to a $*$-isomorphism $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ with the adjoint taken blockwise. Every finite-dimensional $C^*$-algebra is unital: the unit is the sum $\sum_i I_{n_i}$ of the block identity matrices, so no unitization step is needed.
   164	
   165	For the classification statement, a $*$-isomorphism carries minimal central projections to minimal central projections and block sizes to block sizes, so the dimension vector is an isomorphism invariant. Conversely, equality of dimension vectors gives a blockwise unitary identification, and this identification intertwines the adjoints blockwise. The dimension vector is therefore a classifying invariant in the sense of \cref{def:invariants} for the equivalence relation of $*$-isomorphism.
   166	\end{proof}
   167	
   168	\begin{corollary}[Classification by dimension vector]
   169	\label{cor:findimclass}
   170	Up to $*$-isomorphism the finite-dimensional complex $C^*$-algebras are in bijection with finite multisets of positive integers, and every such algebra is unital with $\dim A = \sum_i n_i^2$ the sum of squares of its block sizes.
   171	\end{corollary}
   172	
   173	\begin{remark}[What the dimension vector does not classify]
   174	\label{rem:dimvec}
   175	\Cref{thm:findim} classifies the observable algebra only. A designated state, the dynamics implemented by one-parameter groups of automorphisms, symmetry actions, and the composition data of a quantum system record are not determined by the dimension vector. Two system records with isomorphic observable algebras may carry different dynamics and different composition data. The classification of representations is the first layer of the program, not the last.
   176	\end{remark}
   177	
   178	\begin{example}[Qubit observables]
   179	\label{ex:qubit}
   180	For $H = \mathbb{C}^2$ the full observable algebra is $M_2(\mathbb{C})$ with dimension vector $\{2\}$. The commutative algebra of diagonal observables is $\mathbb{C} \oplus \mathbb{C}$ with dimension vector $\{1, 1\}$. The two algebras have equal vector-space dimension $4$ and are not $*$-isomorphic, so vector-space dimension is not a classifying invariant while the dimension vector is. Up to $*$-isomorphism there are exactly two $C^*$-algebras of complex dimension $4$: $M_2(\mathbb{C})$ and $\mathbb{C}^4$, since $4 = 2^2 = 1^2 + 1^2 + 1^2 + 1^2$ are the two partitions of $4$ into perfect squares.
   181	\end{example}
   182	
   183	\begin{example}[Two presentations of one algebra]
   184	\label{ex:iso}
   185	Let $A \subseteq M_3(\mathbb{C})$ consist of the block matrices $\operatorname{diag}(M, \lambda)$ with $M \in M_2(\mathbb{C})$ and $\lambda \in \mathbb{C}$, and let $B = U A U^*$ for a unitary $U \in M_3(\mathbb{C})$. The algebras are $*$-isomorphic by construction and have the same dimension vector $\{1, 2\}$, while their matrix representations in $\mathbb{C}^3$ differ. The algebra $M_2(\mathbb{C}) \oplus \mathbb{C}$ carries the same dimension vector, and a unitary carrying the block decomposition of $A$ to the standard one exhibits the $*$-isomorphism of \cref{thm:findim} explicitly. The invariant sees the blocks and the presentation hides them.
   186	\end{example}
   187	
   188	\begin{corollary}[Counting small algebras]
   189	\label{cor:count}
   190	For each $d \geq 1$ the $*$-isomorphism classes of finite-dimensional $C^*$-algebras of complex dimension $d$ are in bijection with the partitions of $d$ into perfect squares. In particular the number of such algebras grows as the number of such partitions.
   191	\end{corollary}
   192	
   193	We write a multiset such as eight $1$s and one $2$ as $\{1^8, 2\}$. Table \ref{tab:counts} lists the block multisets for small $d$.
   194	
   195	\begin{table}[ht]
   196	\centering
   197	\caption{Dimension vectors of finite-dimensional $C^*$-algebras of complex dimension $d$, written as multisets of block sizes.}
   198	\label{tab:counts}
   199	\small
   200	\begin{tabularx}{\textwidth}{@{}c X c@{}}
   201	\toprule
   202	$d$ & Dimension vectors & Count \\
   203	\midrule
   204	1 & $\{1\}$ & 1 \\
   205	2 & $\{1^2\}$ & 1 \\
   206	3 & $\{1^3\}$ & 1 \\
   207	4 & $\{1^4\}$ and $\{2\}$ & 2 \\
   208	5 & $\{1^5\}$ and $\{1, 2\}$ & 2 \\
   209	6 & $\{1^6\}$ and $\{1^2, 2\}$ & 2 \\
   210	7 & $\{1^7\}$ and $\{1^3, 2\}$ & 2 \\
   211	8 & $\{1^8\}$, $\{1^4, 2\}$, and $\{2^2\}$ & 3 \\
   212	9 & $\{1^9\}$, $\{1^5, 2\}$, $\{1, 2^2\}$, and $\{3\}$ & 4 \\
   213	10 & $\{1^{10}\}$, $\{1^6, 2\}$, $\{1^2, 2^2\}$, and $\{1, 3\}$ & 4 \\
   214	11 & $\{1^{11}\}$, $\{1^7, 2\}$, $\{1^3, 2^2\}$, and $\{1^2, 3\}$ & 4 \\
   215	12 & $\{1^{12}\}$, $\{1^8, 2\}$, $\{1^4, 2^2\}$, $\{2^3\}$, and $\{1^3, 3\}$ & 5 \\
   216	\bottomrule
   217	\end{tabularx}
   218	\end{table}
   219	
   220	\begin{remark}[Recognition]
   221	\label{rem:recognition}
   222	The dimension vector solves the recognition problem for this class as well as the classification problem: given matrix blocks, comparing their size multisets decides $*$-isomorphism directly, and the comparison is a sort. In the finite-dimensional regime classification, parameterization, and recognition therefore coincide. The classification of finite simple groups separates the three: it delivers the list, partially solves recognition through atlas data, and supplies no uniform parameterization. The separation reappears, in worse form, in \cref{sec:mcduff}.
   223	\end{remark}
   224	
   225	\subsection{States and state spaces}
   226	
   227	The observable algebra of \cref{thm:findim} carries state space data that the classification records.
   228	
   229	\begin{proposition}[States of a block algebra]
   230	\label{prop:states}
   231	Let $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$. Every state $\rho$ on $A$ is of the form
   232	\[
   233	\rho(X_1, \dots, X_k) = \sum_{i=1}^{k} \operatorname{Tr}(\sigma_i X_i)
   234	\]
   235	for positive matrices $\sigma_i \in M_{n_i}(\mathbb{C})$ with $\sum_i \operatorname{Tr} \sigma_i = 1$, and this correspondence is bijective. The pure states of $A$ are the vector states of individual blocks, so the pure state space is the disjoint union of complex projective spaces $\mathbb{CP}^{n_i - 1}$.
   236	\end{proposition}
   237	
   238	\begin{proof}
   239	A positive functional on a direct sum is blockwise positive, so it suffices to treat one block. On $M_n(\mathbb{C})$ every positive functional is a trace against a positive matrix: the matrix $\sigma$ with entries $\sigma_{ji} = \rho(E_{ij})$ satisfies $\rho(X) = \operatorname{Tr}(\sigma X)$ for all $X$ by linearity on matrix units, and positivity of $\rho$ gives $\sigma \geq 0$. Normalization of $\rho$ on $A$ reads $\sum_i \operatorname{Tr} \sigma_i = 1$. Purity forces all but one $\sigma_i$ to vanish and that $\sigma_i$ to have rank one, which is a vector state of block $i$.
   240	\end{proof}
   241	
   242	The state space of $A$, as a compact convex body, is therefore determined by the dimension vector: it is the join of the density-matrix bodies of the blocks.
   243	
   244	\begin{proposition}[Automorphisms of block algebras]
   245	\label{prop:aut}
   246	Every $*$-automorphism of $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ is the composition of a blockwise inner automorphism and a permutation of blocks of equal size. The dynamics of a finite-dimensional quantum system is therefore a unitary path inside blocks together with block permutations of equal size, and none of it is recorded by the dimension vector beyond the block sizes themselves.
   247	\end{proposition}
   248	
   249	\begin{proof}
   250	By \cref{thm:findim} every $*$-automorphism permutes the simple ideals of $A$, and it can permute only ideals of equal size, being a $*$-isomorphism. On a single block every $*$-automorphism of $M_n(\mathbb{C})$ is inner, so after choosing the permutation the automorphism is blockwise conjugation by unitaries. The second statement collects the description.
   251	\end{proof}
   252	
   253	\begin{proposition}[Unique decomposition in the finite-dimensional class]
   254	\label{prop:unique}
   255	Decompositions of a finite-dimensional $C^*$-algebra $A$ into irreducible summands under direct sum exist and are unique up to order and unitary equivalence. The dimension vector is therefore complete data for the decomposition as well as for the isomorphism class, and the uniqueness that fails for interacting systems in general holds in this restricted class.
   256	\end{proposition}
   257	
   258	\begin{proof}
   259	Existence is \cref{thm:findim}. Uniqueness holds because the summands are the simple ideals of the semisimple algebra $A$, and the minimal nonzero two-sided ideals of a semisimple algebra are unique. Any decomposition into irreducible summands exhibits exactly these ideals, and the order of the summands is not part of the data, matching the multiset form of the dimension vector.
   260	\end{proof}
   261	
   262	\begin{proposition}[Tensor products of block algebras]
   263	\label{prop:tensor}
   264	Let $A = \bigoplus_i M_{n_i}(\mathbb{C})$ and $B = \bigoplus_j M_{m_j}(\mathbb{C})$. Then $A \otimes B \cong \bigoplus_{i,j} M_{n_i m_j}(\mathbb{C})$, and the dimension vector of $A \otimes B$ is the multiset of products $\{n_i m_j\}$. In particular the dimension vector of a tensor product is computed from the factor dimension vectors without reference to any presentation.
   265	\end{proposition}
   266	
   267	\begin{proof}
   268	The tensor product of matrix algebras satisfies $M_n(\mathbb{C}) \otimes M_m(\mathbb{C}) \cong M_{nm}(\mathbb{C})$ as $C^*$-algebras, and the tensor product of direct sums distributes: $A \otimes B \cong \bigoplus_{i,j} M_{n_i}(\mathbb{C}) \otimes M_{m_j}(\mathbb{C})$. \Cref{thm:findim} then identifies the result blockwise.
   269	\end{proof}
   270	
   271	\section{Operator algebras and factors}
   272	\label{sec:factors}
   273	
   274	Infinite-dimensional quantum systems require operator-algebraic observables. The classification of von Neumann algebras reduces to factors, and the classification of factors is complete on the amenable side and out of reach of any finite list of types on the general side.
   275	
   276	\begin{definition}[Factor types]
   277	\label{def:factortype}
   278	A factor $M$ is of type $\mathrm{I}$ if it contains minimal projections, of type $\mathrm{II}_1$ if it is infinite-dimensional with a finite faithful normal trace, of type $\mathrm{II}_\infty$ if it is properly infinite with a semifinite trace, and of type $\mathrm{III}$ if it admits no nonzero finite trace. The type $\mathrm{III}$ factors are stratified by the Connes spectrum of the modular automorphism group, with parameters $\lambda \in (0,1)$ and the two endpoint cases $\mathrm{III}_0$ and $\mathrm{III}_1$.
   279	\end{definition}
   280	
   281	Murray-von Neumann comparison theory is the tool behind the trichotomy. Two projections $p$ and $q$ of a von Neumann algebra are equivalent when a partial isometry $u$ with $u^* u = p$ and $u u^* = q$ exists, and in a factor any two projections are comparable: either $p$ is equivalent to a subprojection of $q$ or conversely. Type $I$ factors contain minimal projections, type $\mathrm{II}$ factors contain no minimal projections but do contain nonzero finite projections, and type $\mathrm{III}$ factors have every nonzero projection infinite. The type of a factor is therefore the first invariant of \cref{thm:amenable}.
   282	
   283	The reduction to factors is the operator-algebraic analogue of block decomposition.
   284	
   285	\begin{definition}[Amenable factors]
   286	\label{def:amenable}
   287	All factors in this section have separable predual. A factor is hyperfinite, or approximately finite-dimensional, when it is the norm closure of an increasing union of finite-dimensional subalgebras, and injective when a norm-one projection of $B(H)$ onto it exists. For factors with separable predual the two conditions coincide, and a factor satisfying them is amenable. The unique amenable factor of type $\mathrm{II}_1$ with separable predual is the hyperfinite factor $R$.
   288	\end{definition}
   289	
   290	\begin{theorem}[Central decomposition]
   291	\label{thm:central}
   292	Every von Neumann algebra $M$ is a direct integral of factors over a measure space, unique up to measure-class isomorphism of the base. The isomorphism classification of von Neumann algebras therefore reduces to the classification of factors together with the measure-theoretic data of the decomposition.
   293	\end{theorem}
   294	
   295	\Cref{thm:central} is the Murray-von Neumann direct-integral decomposition; we refer to the original work and to the standard accounts for the proof. The classification content sits in the factors.
   296	
   297	\begin{theorem}[Classification of amenable factors]
   298	\label{thm:amenable}
   299	Among factors with separable predual the amenable (equivalently injective, equivalently hyperfinite) factors are classified as follows. For each $n \geq 1$ there is a unique factor of type $\mathrm{I}_n$ and a unique factor of type $\mathrm{I}_\infty$. There is a unique amenable factor of type $\mathrm{II}_1$, the hyperfinite factor, and a unique amenable factor of type $\mathrm{II}_\infty$. For each $\lambda \in (0,1)$ there is a unique amenable factor of type $\mathrm{III}_\lambda$, and a unique amenable factor of type $\mathrm{III}_1$. Amenable factors of type $\mathrm{III}_0$ are classified by the ergodic flow of weights. The invariants in force are the Murray-von Neumann type together with the Connes invariants. Separable predual is essential: among non-separable injective $\mathrm{II}_1$ factors uniqueness fails, and there are $2^{\mathfrak{c}}$ pairwise non-isomorphic ones.
   300	\end{theorem}
   301	
   302	\begin{proof}[Status of the proof]
   303	The type $\mathrm{I}$ and type $\mathrm{II}$ cases are Murray-von Neumann's, together with the existence and uniqueness of the hyperfinite $\mathrm{II}_1$ factor. The classification of injective factors, including the type $\mathrm{III}_\lambda$ cases for $\lambda \neq 0$, is Connes's theorem of 1976, building on his 1973 classification of type $\mathrm{III}$ factors by the invariants of \cref{def:factortype}. Uniqueness of the injective factor of type $\mathrm{III}_1$ was completed by Haagerup in 1987 through the bicentralizer problem. The statements are established theorems of the literature; the proofs are deep analytic arguments in von Neumann algebra theory and are not reproduced here. What is proved in this paper is the finite-dimensional content of \cref{sec:findim} and the channel content of \cref{sec:channels}, each in full.
   304	\end{proof}
   305	
   306	\subsection{The hyperfinite factor}
   307	
   308	In type $\mathrm{II}_1$ the hyperfinite factor $R$ is the norm closure of an increasing union of full matrix algebras $M_{2^k}(\mathbb{C})$ along the embeddings $A \mapsto A \otimes I_2$, and every amenable $\mathrm{II}_1$ factor with separable predual is isomorphic to $R$. The type $\mathrm{III}_\lambda$ factors for $\lambda \in (0,1)$ arise differently: as infinite tensor products of finite type I factors carrying non-tracial product states (the Powers factors), not as inductive limits of matrix algebras along unital embeddings. The unique amenable factor of type $\mathrm{III}_1$ is the limit case completed by Haagerup's theorem.
   309	
   310	Within type $\mathrm{III}_0$ the amenable factors are classified by the ergodic flow of weights up to conjugacy of the flow, and this is the one stratum whose invariant is an ergodic object rather than a number.
   311	
   312	The factor $R$ is the reference object of the classification. It lies inside the classified regime of \cref{thm:amenable}, it is the unique separable injective $\mathrm{II}_1$ factor, and the uncountable family of \cref{thm:mcduff} is produced by varying the central-sequence structure of algebras built from it. The boundary between the amenable side and the general side is therefore a boundary inside the separable $\mathrm{II}_1$ factors themselves.
   313	
   314	\begin{remark}[Type $\mathrm{III}$ strata]
   315	\label{rem:typeIII}
   316	The Connes spectrum $S(M) = \bigcap_{\varphi} \operatorname{Sp}(\Delta_\varphi)$ is the intersection over normal faithful states $\varphi$ of the spectra of the modular operators $\Delta_\varphi$, a subset of $[0, \infty)$, and the flow of weights is the ergodic flow attached to the modular automorphism group through the central decomposition. The stratum data are read off from $S(M) \cap \mathbb{R}_+^*$: it is $\{1\}$ in type $\mathrm{III}_0$, $\lambda^{\mathbb{Z}}$ in type $\mathrm{III}_\lambda$ for $\lambda \in (0,1)$, and $(0, \infty)$ in type $\mathrm{III}_1$. \Cref{thm:amenable} classifies the amenable factors through these invariants and the ergodic flow of weights in type $\mathrm{III}_0$. Beyond the amenable class the strata are coarse: fundamental groups of type $\mathrm{III}$ factors vary widely, and the structure theory past the Connes spectrum is open. No completeness claim for non-amenable type $\mathrm{III}$ factors is used anywhere in this paper.
   317	\end{remark}
   318	
   319	\begin{remark}[The Elliott program]
   320	\label{rem:elliott}
   321	For separable simple nuclear $C^*$-algebras the analogous program classifies algebras by $K$-theoretic and tracial data. The program is unfinished. Toms constructed a simple unital algebra shape equivalent to its tensor product with an infinite-dimensional UHF algebra and with the same tracial simplex, yet not isomorphic to it, so $K$-theory and traces together do not complete the classification without further hypotheses. This paper draws no classification conclusion from the Elliott program.
   322	\end{remark}
   323	
   324	\section{The McDuff obstruction}
   325	\label{sec:mcduff}
   326	
   327	The most consequential theorem for the classification program is negative.
   328	
   329	\begin{theorem}[McDuff 1969]
   330	\label{thm:mcduff}
   331	There exist uncountably many pairwise non-isomorphic separable type $\mathrm{II}_1$ factors.
   332	\end{theorem}
   333	
   334	\begin{proof}[Consequence for classification]
   335	The theorem asserts continuum many isomorphism classes: the separable $\mathrm{II}_1$ factors form an uncountable family with no repetitions up to isomorphism. Two consequences follow. No finite or countable list of factor types can exhaust the family, so a CFSG-style list of types cannot be complete outside a restricted class, and any classification theorem for $\mathrm{II}_1$ factors must restrict its class (for instance to the amenable factors of \cref{thm:amenable}) or weaken its conclusion to a coarser equivalence. The theorem by itself does not decide whether a classification by continuous parameters exists; that question belongs to the descriptive set theory of von Neumann algebra isomorphism and is not settled here. What the theorem does settle is that the separation is visible in the operator-algebraic structure itself: the construction separates factors through their central sequences.
   336	\end{proof}
   337	
   338	\begin{corollary}[No finite list of factor types]
   339	\label{cor:nofinite}
   340	No finite or countable list of pairwise non-isomorphic factor types exhausts the separable $\mathrm{II}_1$ factors, and no CFSG-style list of factor types is complete outside a restricted class such as the amenable factors.
   341	\end{corollary}
   342	
   343	\begin{proof}
   344	A finite or countable list covers countably many isomorphism classes, and \cref{thm:mcduff} supplies continuum many. The second statement is the first applied to the CFSG shape of a classification theorem.
   345	\end{proof}
   346	
   347	\begin{remark}[Honest record]
   348	\label{rem:mcduff}
   349	\Cref{thm:mcduff} marks the boundary of the classifiable territory: it is a classification result of the same standing as the positive theorems, not a difficulty to be engineered around. The amenable factors lie inside the boundary by \cref{thm:amenable}, and the general $\mathrm{II}_1$ factors lie outside it.
   350	\end{remark}
   351	
   352	Inside the amenable class the classification has the shape of a CFSG-style theorem: a list of types, a complete set of invariants, and a uniqueness statement for each type. The obstruction says this shape cannot extend to all separable $\mathrm{II}_1$ factors, so the shape must be sought in restricted classes or with weakened equivalences. The amenable classification is one instance of the pattern; whether rigidity hypotheses on non-amenable factors define another instance is one of the open problems of \cref{sec:regimes}.
   353	
   354	\section{Channels and dilations}
   355	\label{sec:channels}
   356	
   357	
   358	\subsection{Choi-Kraus normal form}
   359	
   360	The morphisms of finite-dimensional quantum systems that appear in measurement and evolution are channels (\cref{def:channels}). Their normal form is the first of the two canonical-form theorems of the paper.
   361	
   362	\begin{lemma}[Choi correspondence]
   363	\label{lem:choi}
   364	For a linear map $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ with Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$ the following hold: $\Phi$ is completely positive if and only if $J(\Phi) \geq 0$, and $\Phi$ is trace preserving if and only if $\operatorname{Tr}_m J(\Phi) = I_n$, where $\operatorname{Tr}_m$ is the partial trace over the second tensor factor.
   365	\end{lemma}
   366	
   367	\begin{proof}
   368	Complete positivity is tested on positive elements of $M_n(\mathbb{C}) \otimes M_k(\mathbb{C})$ for all $k$, and for $k = n$ the condition $(\operatorname{id} \otimes \Phi)(P) \geq 0$ on rank-one projections $P = |\psi\rangle\langle\psi|$ with $|\psi\rangle = \sum_i e_i \otimes e_i$ reads $J(\Phi) \geq 0$; the general case follows by direct sums. For the trace condition, $\operatorname{Tr}_m J(\Phi)$ has $(i,j)$ entry $\operatorname{Tr}(\Phi(E_{ij}))$, and $\Phi$ preserves trace exactly when $\operatorname{Tr}(\Phi(E_{ij})) = \delta_{ij}$, which is $\operatorname{Tr}_m J(\Phi) = I_n$.
   369	\end{proof}
   370	
   371	\begin{example}[A family of one Kraus rank]
   372	\label{ex:depol}
   373	For $p \in (0,1)$ set $A_0 = \sqrt{1 - p} \, I_2$ and $A_i = \sqrt{p/3} \, \sigma_i$ for the three Pauli matrices $\sigma_i$. The map $\Phi_p(X) = \sum_{k=0}^{3} A_k X A_k^*$ satisfies $\sum_k A_k^* A_k = I_2$, so it is a qubit channel. Its Choi matrix has eigenvalues $2(1 - p)$ and $2p/3$ with multiplicity three, all positive, so the Kraus rank is $4$ for every $p \in (0,1)$. The Choi spectrum varies with $p$, and unitary equivalence of channels preserves the Choi spectrum, so the family consists of pairwise unitarily inequivalent channels sharing one Kraus rank.
   374	\end{example}
   375	
   376	\begin{example}[Choi matrix of a qubit channel]
   377	\label{ex:choi}
   378	For the channel $\Phi_p$ of \cref{ex:depol} the Kraus vectors are the vectorizations of $I_2$ and of the Pauli matrices, which are orthogonal for the Hilbert-Schmidt pairing. The Choi matrix is therefore diagonal in the basis these vectors span, with eigenvalues $2(1 - p)$ and $2p/3$ with multiplicity three. Trace preservation reads $\operatorname{Tr}_m J(\Phi_p) = I_2$ on these eigenvalues, and complete positivity reads $J(\Phi_p) \geq 0$, which holds for $p \in (0,1)$. The eigenvalue list is the input of the minimization statement of \cref{prop:krausrank}.
   379	\end{example}
   380	
   381	\begin{theorem}[Choi-Kraus normal form]
   382	\label{thm:kraus}
   383	Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be linear. Then $\Phi$ is completely positive if and only if there are matrices $A_1, \dots, A_r \in M_{m \times n}(\mathbb{C})$ with
   384	\[
   385	\Phi(X) = \sum_{i=1}^{r} A_i X A_i^* \qquad \text{for all } X \in M_n(\mathbb{C}),
   386	\]
   387	and one may take $r$ equal to the rank of the Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$. The minimal such $r$ is the Kraus rank of $\Phi$ and equals the rank of $J(\Phi)$.
   388	\end{theorem}
   389	
   390	\begin{proof}
   391	Write $J(\Phi) \in M_{nm}(\mathbb{C})$ in block form as the $n \times n$ block matrix with blocks $\Phi(E_{ij})$. Complete positivity of $\Phi$ is equivalent to positivity of $J(\Phi)$, and positivity is equivalent to a factorization $J(\Phi) = \sum_{k=1}^{r} v_k v_k^*$ with $r = \operatorname{rank} J(\Phi)$ and vectors $v_k \in \mathbb{C}^n \otimes \mathbb{C}^m$. Fix an orthonormal basis $e_1, \dots, e_n$ of $\mathbb{C}^n$ and decompose each $v_k = \sum_{j=1}^{n} e_j \otimes w_{kj}$ with $w_{kj} \in \mathbb{C}^m$. Let $A_k \in M_{m \times n}(\mathbb{C})$ be the matrix whose $j$-th column is $w_{kj}$. The $(i,j)$ block of $J(\Phi)$ is then $\sum_{k=1}^{r} w_{ki} w_{kj}^* = \sum_{k=1}^{r} A_k E_{ij} A_k^*$, so $\Phi(E_{ij}) = \sum_{k} A_k E_{ij} A_k^*$ for all $i, j$ and by linearity $\Phi(X) = \sum_{k} A_k X A_k^*$ for all $X$. Conversely any such representation writes $J(\Phi)$ as a sum of $s$ rank-one positive terms, so $s \geq \operatorname{rank} J(\Phi)$ and the minimal number of Kraus operators equals $r$.
   392	\end{proof}
   393	
   394	\begin{remark}[Normal form versus classification]
   395	\label{rem:normalform}
   396	\Cref{thm:kraus} is a normal-form theorem, not a classification of channels up to isomorphism. The Kraus rank is an invariant of the minimal presentation of one channel. \Cref{sec:channels} exhibits channels with equal Kraus rank that no unitary change of presentation identifies, and the literature records no isomorphism classification of channels beyond the normal form.
   397	\end{remark}
   398	
   399	\subsection{Stinespring dilations}
   400	
   401	Stinespring's theorem gives every channel a canonical dilation through an environment, and a minimal dilation is unique up to unitary. The statement is the second canonical-form theorem of the paper.
   402	
   403	\begin{theorem}[Stinespring dilation]
   404	\label{thm:stinespring}
   405	Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be a channel. Then $\Phi$ admits a Stinespring dilation $(K, V)$ in the sense of \cref{def:channels}, and minimal dilations exist. Any two minimal dilations $(K, V)$ and $(K', V')$ of $\Phi$ are unitarily equivalent: there is a unitary $U: K \to K'$ with $(I_m \otimes U) V = V'$. The dimension $\dim K$ of a minimal dilation equals the Kraus rank of $\Phi$.
   406	\end{theorem}
   407	
   408	\begin{proof}
   409	Take a Kraus presentation $\Phi(X) = \sum_{k=1}^{r} A_k X A_k^*$ as in \cref{thm:kraus}, with $r$ the Choi rank. Set $K = \mathbb{C}^r$ and define $V: \mathbb{C}^n \to \mathbb{C}^m \otimes K$ by $V \psi = \sum_{k=1}^{r} (A_k \psi) \otimes e_k$ for the standard basis $e_k$ of $K$. Then $V^* V = \sum_k A_k^* A_k = I_n$ because $\Phi$ preserves trace, so $V$ is an isometry, and $\operatorname{Tr}_K(V X V^*) = \sum_k A_k X A_k^* = \Phi(X)$. A dilation on a space of dimension less than $r$ would yield a Kraus presentation with fewer than $r$ operators, which \cref{thm:kraus} forbids, so this dilation is minimal. For uniqueness, both $K$ and $K'$ are spanned by vectors of the form $(w^* \otimes I) V \psi$ and $(w^* \otimes I) V' \psi$ with $w \in \mathbb{C}^m$ and $\psi \in \mathbb{C}^n$, the correspondence between these vectors preserves inner products because both dilations realize the same map $\Phi$, and it extends to a unitary $U: K \to K'$ with $(I_m \otimes U) V = V'$. For completely positive unital maps on a general $C^*$-algebra the dual picture holds: $\Phi(a) = V^* \pi(a) V$ with $\pi$ a unital $*$-representation and $V$ an isometry, which is Stinespring's original form.
   410	\end{proof}
   411	
   412	\begin{remark}[Two pictures]
   413	\label{rem:pictures}
   414	Channels appear in two standard forms. In the Schr\"odinger picture a channel is completely positive and trace preserving, acting on states and dilating through an environment as in \cref{def:channels}. In the Heisenberg picture a channel is a unital completely positive map of observable algebras, and its Stinespring form is the compression $\Phi(a) = V^* \pi(a) V$ named at the end of \cref{thm:stinespring}. The two pictures are related by adjunction, the dilation statements hold in either, and the invariant content is the same.
   415	\end{remark}
   416	
   417	For channels on matrix algebras the minimal dilation is finite-dimensional and the unitary freedom of \cref{thm:stinespring} is exactly the change-of-presentation freedom of Kraus operators.
   418	
   419	\begin{proposition}[Kraus rank is a normal-form invariant]
   420	\label{prop:krausrank}
   421	Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be a channel. The Kraus rank of $\Phi$ equals the rank of its Choi matrix, equals the minimal number of Kraus operators in any representation of $\Phi$, and equals the dimension of the environment $K$ in a minimal Stinespring dilation. The Kraus rank is preserved by unitary changes of Kraus presentation and by composition of $\Phi$ with unitary conjugations of domain and codomain. It is not a complete invariant of channels: two channels with equal Kraus rank need not be unitarily equivalent.
   422	\end{proposition}
   423	
   424	\begin{proof}
   425	The equalities with the Choi rank and the minimal Kraus number are \cref{thm:kraus}; the equality with the minimal dilation dimension is the construction of \cref{thm:stinespring} specialized to matrix algebras. Unitary conjugation of the Kraus operators replaces each $A_i$ by $W A_i U^*$ with $U, W$ unitary and does not change the rank of the Choi matrix. For the negative statement take the channel family $\Phi_p$ of \cref{ex:depol}. Its Kraus rank is $4$ for every $p \in (0,1)$, its Choi eigenvalues $2(1-p)$ and $2p/3$ vary with $p$, and unitary equivalence of channels preserves the Choi spectrum. Distinct values of $p$ give inequivalent channels with equal Kraus rank.
   426	\end{proof}
   427	
   428	\begin{remark}[Prohibition recorded]
   429	\label{rem:prohibition}
   430	\Cref{prop:krausrank} records the exact boundary. Kraus rank may be used to compare normal forms of one channel and to detect minimality of a dilation. It may not be used as an isomorphism classification of channels, and no theorem of this paper treats it as one. The Kraus rank is an invariant of the minimal dilation layer of structure and carries no classification claim for the channel layer.
   431	\end{remark}
   432	
   433	\begin{proposition}[Composition of channels]
   434	\label{prop:compose}
   435	Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ and $\Psi: M_m(\mathbb{C}) \to M_p(\mathbb{C})$ be linear. Then
   436	\[
   437	J(\Psi \circ \Phi)_{(i\alpha),(j\beta)} = \sum_{k,l=1}^{m} J(\Phi)_{(ik),(jl)} \, J(\Psi)_{(k\alpha),(l\beta)},
   438	\]
   439	with composite indices as in \cref{lem:choi}. The right-hand side is the link product of $J(\Phi)$ and $J(\Psi)$: matrix multiplication of $J(\Phi)$ after partial transpose on the shared subsystem, contracted with $J(\Psi)$ along that subsystem. Composition of channels is therefore a link-product contraction, and the Choi matrix of a composite is determined by the Choi matrices of the factors.
   440	\end{proposition}
   441	
   442	\begin{proof}
   443	Write $\Phi(E_{ij}) = \sum_{k,l} c^{ij}_{kl} E_{kl}$ and read $J(\Phi)_{(ik),(jl)} = c^{ij}_{kl}$ and $J(\Psi)_{(k\alpha),(l\beta)} = \Psi(E_{kl})_{\alpha\beta}$. The right-hand side of the claimed identity is then $\sum_{k,l} c^{ij}_{kl} \Psi(E_{kl})_{\alpha\beta} = \Psi(\Phi(E_{ij}))_{\alpha\beta}$, which is $J(\Psi \circ \Phi)_{(i\alpha),(j\beta)}$ by definition.
   444	\end{proof}
   445	
   446	\begin{remark}[What a channel classification would need]
   447	\label{rem:channelclass}
   448	A classification of channels up to unitary equivalence would need invariants separating the orbits of the unitary action $\{A_k\} \mapsto \{W A_k U^*\}$ on Kraus presentations. The Choi spectrum is one such invariant and is not complete, as \cref{ex:depol} shows at the level of spectra alone; the orbit data of a presentation involves the arrangement of its Kraus vectors in $\mathbb{C}^n \otimes \mathbb{C}^m$ beyond their Gram matrix. No complete set of orbit invariants is on record, and this is the fourth open problem of \cref{sec:regimes}.
   449	\end{remark}
   450	
   451	\section{Tensor categories and superselection}
   452	\label{sec:tensor}
   453	
   454	Superselection sectors of a quantum field theory organize into tensor categories, and two reconstruction theorems classify such categories under explicit hypotheses. The hypotheses are load-bearing: both theorems fail or become open when they are dropped, and one equivalence-negligible layer turns out to carry the group.
   455	
   456	\begin{definition}[Superselection category]
   457	\label{def:dhr}
   458	Fix a local net of observable algebras satisfying the Haag-Kastler axioms and the DHR selection criterion: representations that are equivalent to the vacuum representation on the algebra of every causally disconnected region. Under Haag duality these representations correspond to localized transportable endomorphisms of the observable algebra, and their intertwiners form a symmetric tensor $*$-category with conjugates, direct sums, and subobjects.
   459	\end{definition}
   460	
   461	The tensor structure of that category is concrete. Composition of endomorphisms supplies the tensor product, intertwiners supply the morphisms, conjugate endomorphisms supply duals, and the statistics of composing an endomorphism with itself distinguishes bosonic from fermionic sectors. Haag duality is the step that passes from representations to endomorphisms, and the selection criterion is what bounds the sectors; modified selection rules change the category.
   462	
   463	\begin{theorem}[Doplicher-Roberts reconstruction]
   464	\label{thm:dr}
   465	Let $\mathcal{C}$ be a symmetric tensor $*$-category with conjugates, direct sums, and subobjects, and with $\operatorname{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent, as a symmetric tensor $*$-category, to the category of finite-dimensional unitary representations of a compact supergroup $G$, and $G$ is unique up to isomorphism.
   466	\end{theorem}
   467	
   468	\Cref{thm:dr} is stated with its hypotheses on the face of the statement. The symmetric structure, the existence of conjugates, and the scalar endomorphism ring of the unit are each used in the proof; a category missing them lies outside the theorem. The reconstruction of the gauge group from superselection data is the completion of the Doplicher-Haag-Roberts analysis, and the supergroup grading accounts for fermionic sectors.
   469	
   470	\begin{remark}[Selection criteria matter]
   471	\label{rem:selection}
   472	The DHR criterion selects representations with trivial behaviour at infinity. Long-range forces such as electromagnetism violate the criterion, and the resulting categories fall outside \cref{thm:dr} unless the analysis is redone with modified selection rules. A classification claim for superselection categories is therefore always relative to the selection criterion in force.
   473	\end{remark}
   474	
   475	\begin{remark}[What reconstruction does not do]
   476	\label{rem:scope}
   477	The Doplicher-Roberts theorem recovers a symmetry group from sector data. It does not recover spacetime, dynamics, or states, and it does not classify the systems whose sectors are being read.
   478	\end{remark}
   479	
   480	\begin{theorem}[Deligne]
   481	\label{thm:deligne}
   482	Let $\mathcal{C}$ be a $\mathbb{C}$-linear, abelian, rigid symmetric tensor category over $\mathbb{C}$ of subexponential growth, with $\operatorname{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent, as a symmetric tensor category, to the category of finite-dimensional representations of an affine supergroup scheme. In particular the category is Tannakian in the super sense.
   483	\end{theorem}
   484	
   485	Deligne's theorem classifies a purely categorical hypothesis class, without reference to any net of observables. The two reconstruction theorems differ in their inputs and agree in their outputs. The Doplicher-Roberts theorem starts from the sectors of a net of observables, so its hypotheses are analytic as well as categorical: Haag duality, the selection criterion, and the tensor structure of intertwiners. Deligne's theorem starts from $\mathbb{C}$-linearity, abelianness, rigidity, symmetry, and subexponential growth. Both conclusions are representation categories of supergroups, so the two theorems are the analytic and the categorical face of one reconstruction pattern, and neither classifies the systems whose sectors or categories are being read. Together \cref{thm:dr,thm:deligne} settle the classification of the symmetric categories that appear as superselection data, and of the finite-growth categories that appear in low-dimensional and combinatorial models. The case of fusion categories (finitely many simple objects, semisimple, finite categorical dimension) is open beyond these hypotheses.
   486	
   487	\begin{proposition}[Etingof-Gelaki counterexample]
   488	\label{prop:eg}
   489	There exist finite non-isomorphic groups $G_1$ and $G_2$ whose representation categories over $\mathbb{C}$ are equivalent as tensor categories, but not as symmetric tensor categories. Consequently an equivalence of tensor categories that forgets the symmetric structure cannot recover the group, and any classification of such categories built on that equivalence is false.
   490	\end{proposition}
   491	
   492	\begin{proof}
   493	Etingof and Gelaki exhibit the affine symplectic group of a vector space over the field of two elements and a corresponding affine pseudosymplectic group: these are non-isomorphic and isocategorical, meaning their representation categories are monoidally equivalent. The symmetric structure of the two categories differs, and Tannaka reconstruction for symmetric tensor categories recovers the group from the symmetric structure alone. The symmetric layer is therefore load-bearing in the sense of \cref{def:preserved}, and an equivalence that discards it identifies objects that the classification must separate.
   494	\end{proof}
   495	
   496	\begin{remark}[Equivalence discipline]
   497	\label{rem:egdiscipline}
   498	Any equivalence of tensor categories must declare the layers it preserves. The standing qualification on relational characterizations applies in full: ``Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.''
   499	\end{remark}
   500	
   501	\begin{remark}[Fusion categories]
   502	\label{rem:fusion}
   503	Every fusion category is the representation category of a weak Hopf algebra, a result obtained through the module-category machinery of Ostrik, and this gives a presentation theorem rather than a classification. The structural conjectures of Etingof, Nikshych, and Ostrik, in particular the existence of a coherent monoidal isomorphism $A \cong A^{**}$ for every fusion category $A$, remain open, and this paper states all fusion-category claims as conditional on those conjectures.
   504	\end{remark}
   505	
   506	\section{Monotone metrics on quantum states}
   507	\label{sec:metrics}
   508	
   509	The measure-theoretic family contributes the third invariant type of the paper, and the quantum case is where a classical uniqueness theorem becomes a parametric classification.
   510	
   511	\begin{definition}[Monotone metric]
   512	\label{def:monotone}
   513	Let $\mathcal{D}_n$ denote the manifold of strictly positive density matrices of $M_n(\mathbb{C})$, an open subset of the affine space of self-adjoint trace-one matrices, with tangent space $T_\rho \mathcal{D}_n$ the space of self-adjoint traceless matrices at $\rho$. A monotone metric assigns to each $\rho \in \mathcal{D}_n$ an inner product on $T_\rho \mathcal{D}_n$ such that the metric decreases under every completely positive trace-preserving map. In the classical setting the corresponding notion is monotonicity under stochastic maps.
   514	\end{definition}
   515	
   516	\begin{remark}[Classical uniqueness]
   517	\label{rem:chentsov}
   518	Chentsov's theorem classifies monotone metrics on the simplex of probability distributions: the Fisher metric is the unique metric, up to a positive constant, that decreases under every stochastic map. The quantum statement of \cref{thm:petz} replaces uniqueness by a parametric family, and no rescaling recovers a unique quantum metric. The contrast is the quantum instance of a classical-to-quantum gap that runs through the series: uniqueness statements on the classical side do not transfer.
   519	\end{remark}
   520	
   521	\begin{theorem}[Petz]
   522	\label{thm:petz}
   523	Monotone metrics on $\mathcal{D}_n$ are in bijection with operator monotone functions $f: (0,\infty) \to (0,\infty)$ that satisfy the symmetry condition $f(t) = t f(1/t)$ and the normalization $f(1) = 1$. Given such a function $f$, the corresponding metric on the tangent space $T_\rho \mathcal{D}_n$ is
   524	\[
   525	g_\rho^f(A, B) = \operatorname{Tr}\Bigl(A^* \bigl[R_\rho \, f(L_\rho R_\rho^{-1})\bigr]^{-1}(B)\Bigr),
   526	\]
   527	where $L_\rho$ and $R_\rho$ are the left and right multiplication operators by $\rho$ on $M_n(\mathbb{C})$. Distinct normalized operator monotone functions give distinct monotone metrics.
   528	\end{theorem}
   529	
   530	\begin{proof}[Status of the proof]
   531	The classification is Petz's theorem. The condition $f(t) = t f(1/t)$ is the symmetry of the resulting form under exchange of $A$ and $B$, and the normalization $f(1) = 1$ fixes the scale: without it every positive scalar multiple of $f$ satisfies the symmetry condition and rescales the metric, and the correspondence is not a bijection. Distinct normalized functions give distinct metrics already on $2 \times 2$ density matrices. The proof is an operator-geometric argument in monotone matrix theory and is not reproduced here. The parametric conclusion is recorded in the sources of Petz and of Petz-Sudar, who construct and compare explicit members of the family and state the contrast with Chentsov uniqueness outright.
   532	\end{proof}
   533	
   534	\begin{corollary}[Parametricity of the quantum invariant]
   535	\label{cor:parametric}
   536	The monotone metrics of quantum states are classified by a continuous parameter (the normalized operator monotone function), not by a discrete choice. There is no quantum analogue of Chentsov uniqueness, and any classification statement for quantum monotone metrics must accept a parametric invariant in place of a unique object.
   537	\end{corollary}
   538	
   539	\begin{example}[Two standard metrics]
   540	\label{ex:metrics}
   541	The function $f(t) = (1 + t)/2$ is operator monotone and satisfies $f(1) = 1$ and $f(t) = t f(1/t)$. In the eigenbasis of $\rho$ with eigenvalues $\lambda_i$ its metric reads $g_\rho(A, A) = \sum_{i,j} 2 |A'_{ij}|^2 / (\lambda_i + \lambda_j)$ with $A' = U^* A U$, which is the metric of the symmetric logarithmic derivative. The function $f(t) = (1 + \sqrt{t})^2 / 4$ again satisfies both conditions and yields the Wigner-Yanase metric. The two metrics coincide on tangent directions commuting with $\rho$ and differ on every self-adjoint traceless direction with an off-diagonal entry in the eigenbasis of $\rho$, which is \cref{cor:parametric} in concrete form.
   542	\end{example}
   543	
   544	\begin{remark}[Distinguishability]
   545	\label{rem:distinguish}
   546	A monotone metric measures how fast nearby states separate under measurements, and monotonicity makes the separation decrease under every channel. Choosing a metric amounts to choosing a convention for statistical distance on quantum states, and \cref{thm:petz} shows the choice is a continuous parameter. Any classification or equivalence statement that uses statistical distance on quantum states must carry the parameter of \cref{cor:parametric} or fix it explicitly.
   547	\end{remark}
   548	
   549	\section{Classification regimes}
   550	\label{sec:regimes}
   551	
   552	Three regimes hold among the quantum classification problems: complete classification under stated hypotheses, uncountably many classes admitting no finite list of types, and open problems. \Cref{tab:regimes} records each domain with its invariant and source theorem.
   553	
   554	\begin{table}[ht]
   555	\centering
   556	\caption{Classification regimes for quantum systems, with the invariant in force and the standing of each row.}
   557	\label{tab:regimes}
   558	\small
   559	\begin{tabularx}{\textwidth}{@{}X X X X@{}}
   560	\toprule
   561	Domain & Invariant & Standing & Source \\
   562	\midrule
   563	Finite-dimensional $C^*$-algebras & Dimension vector & Classified completely & \Cref{thm:findim} \\
   564	Completely positive maps & Kraus rank and Choi matrix & Normal form only & \Cref{thm:kraus} \\
   565	Minimal dilations & Unitary class of the dilation & Classified completely & \Cref{thm:stinespring} \\
   566	Amenable factors & Murray-von Neumann type and Connes invariants & Classified completely & \Cref{thm:amenable} \\
   567	General $\mathrm{II}_1$ factors & Continuum many isomorphism classes & No finite list of types & \Cref{thm:mcduff} \\
   568	Symmetric tensor categories under the hypotheses of \cref{thm:deligne} & Underlying supergroup & Classified completely & \Cref{thm:dr,thm:deligne} \\
   569	Tensor equivalence without symmetric structure & None can recover the group & Proved insufficient & \Cref{prop:eg} \\
   570	Monotone metrics on quantum states & Operator monotone function & Parametric classification & \Cref{thm:petz} \\
   571	Fusion categories & Weak Hopf presentation & Open & \Cref{rem:fusion} \\
   572	Non-amenable type $\mathrm{III}$ factors & Connes strata only & Open & \Cref{rem:typeIII} \\
   573	Channels up to isomorphism & Kraus rank is not complete & Open & \Cref{rem:prohibition} \\
   574	\bottomrule
   575	\end{tabularx}
   576	\end{table}
   577	
   578	The regimes show a pattern the rest of the series exploits. Classification is complete exactly where the invariant is discrete or parametric and the hypotheses are stated; finite lists stop where the structure theory manufactures uncountably many non-isomorphic objects; and the question is open where a presentation theorem exists but the invariants do not separate. The finite-dimensional theory and the amenable theory differ in technique but agree in shape: both reduce a system to a list of standard pieces plus invariant data. The McDuff obstruction marks where that shape cannot persist.
   579	
   580	Five kinds of classification result appear in \cref{tab:regimes}. The dimension-vector classification is complete and parameterized, in the manner of the Dynkin classification of semisimple Lie algebras. The amenable factor classification is complete and analytic, its invariants computed from operator-algebraic structure rather than read off combinatorial data. The monotone-metric classification is parametric, in the manner of a classification by continuous parameters.
   581	
   582	The McDuff corollary is a complete obstruction: its classification content is the proof that no finite list exists. The remaining rows are open problems with presentation theorems but no separating invariants. These five kinds separate cleanly, and a quantum classification claim that mixes two of them is misstated.
   583	
   584	Five open problems bound the current frontier.
   585	\begin{enumerate}
   586	\item The Elliott program for separable simple nuclear $C^*$-algebras lacks a finished classification statement with its universal coefficient theorem resolved.
   587	\item The structural conjectures for fusion categories, beginning with coherent double-dual isomorphisms, are unproved, and every fusion-category claim in this paper is conditional on them.
   588	\item The structure of non-amenable type $\mathrm{III}$ factors beyond the Connes strata is open.
   589	\item No isomorphism classification of quantum channels exists beyond the Stinespring normal form, and \cref{prop:krausrank} shows that the obvious invariant does not provide one.
   590	\item Whether any restricted classification of non-amenable $\mathrm{II}_1$ factors survives under rigidity hypotheses is not addressed by the sources consulted here and is recorded as open.
   591	\end{enumerate}
   592	
   593	\section{Computational evidence}
   594	\label{sec:computation}
   595	
   596	The source files that accompany this paper as supplementary material contain executable models and three experiment scripts; they live in the directory \path{src/vol-06-quantum-systems/}. They are computational evidence for the finite-dimensional and channel statements. They are not proofs, and no part of the paper rests on them for validity.
   597	
   598	The Haskell module \path{Instances.hs} instantiates the taxonomy classes for this paper's physical systems: finite-dimensional block algebras, Hilbert-space systems with observable algebras, operator-algebra systems with factor data, quantum channels with Kraus data, and superselection categories with tensor data. The instances cover the system-record class, the Hilbert-space and operator-algebra family class, the probability and measure family class on the quantum side, the tensor-category family class, the construction and decomposition hooks, irreducibility of matrix blocks under direct sum, and mathematical equivalence of block algebras by dimension vector. The instances name their methods after the definitions and theorem targets of this paper (dimension vector, minimal Kraus rank, Stinespring minimal dilation, operator monotone parameter). These are executable models of the taxonomy, validated against the statements of the paper; no machine-checked formalization is claimed for them.
   599	
   600	Three Python scripts carry the finite-dimensional experiments. The first enumerates small finite-dimensional $C^*$-algebras by dimension vector and checks the counting statement of \cref{cor:count} and the isomorphism criterion of \cref{thm:findim}. The second constructs Choi matrices of sample channels, computes Kraus ranks, minimizes Kraus presentations, and exhibits channels of equal Kraus rank that no unitary identification matches, evidencing \cref{prop:krausrank}. The third builds monotone metrics from normalized operator monotone functions on $2 \times 2$ density matrices, checks positivity of the resulting forms, and confirms that distinct functions give distinct metrics, evidencing \cref{thm:petz} and \cref{cor:parametric}. Each script prints its checks and exits nonzero on failure. Table \ref{tab:results} records the checks of a recorded run.
   601	
   602	\begin{table}[ht]
   603	\centering
   604	\caption{Checks and recorded outputs of the three experiment scripts in a single run.}
   605	\label{tab:results}
   606	\small
   607	\begin{tabularx}{\textwidth}{@{}X X X@{}}
   608	\toprule
   609	Script & Check & Recorded output \\
   610	\midrule
   611	\path{finite_dim_cstar_decomposition.py} & Isomorphism criterion on all algebras up to dimension 16 & No failures \\
   612	\path{finite_dim_cstar_decomposition.py} & Algebra counts per dimension & Matches \cref{tab:counts} through $d = 12$ \\
   613	\path{finite_dim_cstar_decomposition.py} & Tensor products multiply block sizes & $\{2, 3\} \otimes \{2\} = \{4, 6\}$ \\
   614	\path{stinespring_kraus_rank.py} & Choi rank of the channel family of \cref{ex:depol} & Rank 4 at all sampled $p$ \\
   615	\path{stinespring_kraus_rank.py} & Minimal Kraus presentation preserves the channel & Four operators, channel preserved \\
   616	\path{stinespring_kraus_rank.py} & Unitary invariance of Kraus rank & Rank preserved \\
   617	\path{petz_monotone_metrics.py} & Positivity of Petz forms on sampled tangent vectors & Minimum sampled value 0.5755 \\
   618	\path{petz_monotone_metrics.py} & Distinct functions give distinct metrics & Distinct on all samples \\
   619	\bottomrule
   620	\end{tabularx}
   621	\end{table}
   622	
   623	Appendix~\ref{app:code} maps every computational claim of the paper to the file and function that evidences it.
   624	
   625	\section{Discussion}
   626	\label{sec:discussion}
   627	
   628	Three complete classifications cover finite-dimensional observable algebras, amenable factors, and symmetric tensor categories under stated hypotheses. Finite-dimensional observable algebras are classified by dimension vector with a self-contained proof. Amenable factors are classified by Murray-von Neumann type and Connes invariants with proofs in the literature of Murray-von Neumann, Connes, and Haagerup. Symmetric tensor categories under the hypotheses of Deligne and Doplicher-Roberts are classified by the underlying supergroup. Beyond these, the general $\mathrm{II}_1$ factors admit no finite list of types, and the classification question changes shape there from listing objects to delimiting the classifiable classes.
   629	
   630	Three limitations bound the results. The first is exactness of equivalence. Every classification here is up to an equivalence that preserves named layers of structure, and \cref{prop:eg} shows that dropping the symmetric layer changes the answer. The classification of mathematical representations is therefore always relative to the preserved structure, and none of it establishes physical equivalence of the systems the representations describe. The second limitation is hypothesis dependence. \Cref{thm:dr,thm:deligne} hold under conjugates, direct sums, subobjects, scalar endomorphisms of the unit, and in Deligne's case $\mathbb{C}$-linearity, abelianness, rigidity, and subexponential growth in characteristic zero; relaxed selection criteria or growth hypotheses leave the classified regime. The third limitation is depth of the record. The finite-dimensional proofs are given in full here; the operator-algebraic and categorical proofs are established in the sources cited and are not reproduced, and the claim on each is only as strong as those sources.
   631	
   632	The parametric result of \cref{sec:metrics} deserves separate emphasis because it constrains future work. Quantum monotone metrics are classified by a continuous parameter, so any proposed uniqueness statement for quantum information geometry must either fix the parameter or weaken to the parametric family. Extending classical uniqueness statements across the classical-to-quantum boundary is not a defensible move.
   633	
   634	The three complete classifications instantiate the three structural families of the quantum domain with their classifying invariants in place: Hilbert spaces and operator algebras through the dimension vector and the Murray-von Neumann type with Connes invariants, probability and measure structure through the operator monotone parameter, and tensor categories through the underlying supergroup of a symmetric tensor category. The McDuff obstruction joins the register of non-classification theorems, and the Etingof-Gelaki counterexample fixes the equivalence discipline for any later classification by tensor data. The evidence for the program's target statement is therefore mixed: restricted-class theorems exist in quantum theory, and obstruction theorems mark exactly where they stop.
   635	
   636	No theorem here states that any two of the structural families used above are logically independent, and no theorem here establishes physical or empirical equivalence of any two systems. The long-term classification target of the program remains a research objective; the results of this paper are consistent with it in the classified islands and constrain it by theorem in the non-classifiable ocean. The open problems of \cref{sec:regimes} are the natural restricted-class targets next, and each has the shape of a solved problem: a named class, a declared equivalence, and an invariant that either separates or provably cannot.
   637	
   638	\section{Conclusion}
   639	
   640	Quantum physical systems admit classification by dimension vector in finite dimension, by Murray-von Neumann type and Connes invariants on the amenable side of operator algebra, and by underlying supergroup in the symmetric tensor categories of superselection theory. Completely positive maps admit a minimal Stinespring normal form whose Kraus rank is not a channel classification. Quantum monotone metrics are parametric, classified by operator monotone functions rather than by a unique metric. Against these classifications stands the McDuff obstruction: uncountably many separable $\mathrm{II}_1$ factors exist, so no finite list of factor types is exhaustive and no CFSG-style list exists outside restricted classes. The open problems of the Elliott program, fusion-category structure, non-amenable type $\mathrm{III}$ strata, and channel isomorphism define the current frontier. The supplementary code records the finite-dimensional content as computational evidence and nothing more.
   641	
   642	The negative results are part of the answer. The McDuff obstruction and the Etingof-Gelaki counterexample say where classification stops and which layers of structure carry it, and a classification program that records only its successes would misreport the state of the subject.
   643	
   644	\appendix
   645	\section{Code evidence}
   646	\label{app:code}
   647	
   648	\Cref{tab:code} maps each computational claim of the paper to the file and function that evidences it in \path{src/vol-06-quantum-systems/}.
   649	
   650	\begin{table}[ht]
   651	\centering
   652	\caption{Code evidence for the computational claims, with the file and function that demonstrate each claim.}
   653	\label{tab:code}
   654	\small
   655	\begin{tabularx}{\textwidth}{@{}X X X@{}}
   656	\toprule
   657	Claim & File & Function \\
   658	\midrule
   659	Dimension vector classifies block algebras & \path{finite_dim_cstar_decomposition.py} & \path{isomorphism_criterion} \\
   660	Algebra counts match \cref{cor:count} & \path{finite_dim_cstar_decomposition.py} & \path{classify_by_dimension} \\
   661	Tensor products multiply block sizes & \path{finite_dim_cstar_decomposition.py} & \path{tensor_dimension_vector} \\
   662	Kraus rank equals Choi rank & \path{stinespring_kraus_rank.py} & \path{kraus_rank} \\
   663	Minimal Kraus presentations reduce correctly & \path{stinespring_kraus_rank.py} & \path{minimize_kraus} \\
   664	Equal Kraus rank does not classify channels & \path{stinespring_kraus_rank.py} & \path{same_rank_distinct_channels} \\
   665	Petz metrics are positive definite & \path{petz_monotone_metrics.py} & \path{check_monotone_positive} \\
   666	Distinct functions give distinct metrics & \path{petz_monotone_metrics.py} & \path{distinct_functions_distinct_metrics} \\
   667	Taxonomy instances cover the volume's systems & \path{Instances.hs} & instance declarations \\
   668	\bottomrule
   669	\end{tabularx}
   670	\end{table}
   671	
   672	The experiments reproduce by running each script under \path{src/vol-06-quantum-systems/} with Python 3, and the taxonomy layer compiles against the shared classes in \path{src/Taxonomy/}.
   673	
   674	\begin{thebibliography}{20}
   675	
   676	\bibitem{murphy1990}
   677	G. J. Murphy, \emph{C*-Algebras and Operator Theory}, Academic Press, Boston, 1990.
   678	
   679	\bibitem{mvn1943}
   680	F. J. Murray and J. von Neumann, On rings of operators. IV, \emph{Ann. of Math.} \textbf{44} (1943), 716-808. DOI 10.2307/1969107.
   681	
   682	\bibitem{connes1973}
   683	A. Connes, Une classification des facteurs de type III, \emph{Ann. Sci. \'Ecole Norm. Sup.} \textbf{6} (1973), 133-252. DOI 10.24033/asens.1247.
   684	
   685	\bibitem{connes1976}
   686	A. Connes, Classification of injective factors. Cases $\mathrm{II}_1$, $\mathrm{II}_\infty$, $\mathrm{III}_\lambda$, $\lambda \neq 1$, \emph{Ann. of Math.} \textbf{104} (1976), 73-115. DOI 10.2307/1971057.
   687	
   688	\bibitem{haagerup1987}
   689	U. Haagerup, Connes' bicentralizer problem and uniqueness of the injective factor of type $\mathrm{III}_1$, \emph{Acta Math.} \textbf{158} (1987), 95-148. DOI 10.1007/BF02392257.
   690	
   691	\bibitem{toms2008}
   692	A. S. Toms, On the classification problem for nuclear $C^*$-algebras, arXiv:math/0509103; \emph{Ann. of Math.} \textbf{167} (2008), 1029-1044.
   693	
   694	\bibitem{mcduff1969}
   695	D. McDuff, Uncountably many $\mathrm{II}_1$ factors, \emph{Ann. of Math.} \textbf{90} (1969), 372-377. DOI 10.2307/1970730.
   696	
   697	\bibitem{stinespring1955}
   698	W. F. Stinespring, Positive functions on $C^*$-algebras, \emph{Proc. Amer. Math. Soc.} \textbf{6} (1955), 211-216. DOI 10.1090/S0002-9939-1955-0069403-4.
   699	
   700	\bibitem{choi1975}
   701	M.-D. Choi, Completely positive linear maps on complex matrices, \emph{Linear Algebra Appl.} \textbf{10} (1975), 285-290. DOI 10.1016/0024-3795(75)90075-0.
   702	
   703	\bibitem{kraus1983}
   704	K. Kraus, \emph{States, Effects, and Operations: Fundamental Notions of Quantum Theory}, Lecture Notes in Physics, vol. 190, Springer, Berlin, 1983. DOI 10.1007/3-540-12732-1.
   705	
   706	\bibitem{dhr1969a}
   707	S. Doplicher, R. Haag, and J. E. Roberts, Fields, observables and gauge transformations. I, \emph{Comm. Math. Phys.} \textbf{13} (1969), 1-23. DOI 10.1007/BF01645267.
   708	
   709	\bibitem{dhr1969b}
   710	S. Doplicher, R. Haag, and J. E. Roberts, Fields, observables and gauge transformations. II, \emph{Comm. Math. Phys.} \textbf{15} (1969), 173-200. DOI 10.1007/BF01645674.
   711	
   712	\bibitem{dr1989}
   713	S. Doplicher and J. E. Roberts, A new duality theory for compact groups, \emph{Invent. Math.} \textbf{98} (1989), 157-218. DOI 10.1007/BF01388849.
   714	
   715	\bibitem{dr1990}
   716	S. Doplicher and J. E. Roberts, Why there is a field algebra with a compact gauge group describing the superselection structure in particle physics, \emph{Comm. Math. Phys.} \textbf{131} (1990), 51-107. DOI 10.1007/BF02097680.
   717	
   718	\bibitem{deligne2002}
   719	P. Deligne, Cat\'egories tensorielles, \emph{Mosc. Math. J.} \textbf{2} (2002), 227-248. DOI 10.17323/1609-4514-2002-2-2-227-248.
   720	
   721	\bibitem{eg2001}
   722	P. Etingof and S. Gelaki, Isocategorical groups, arXiv:math/0007196.
   723	
   724	\bibitem{ostrik2003}
   725	V. Ostrik, Module categories, weak Hopf algebras and modular invariants, arXiv:math/0111139; \emph{Transform. Groups} \textbf{8} (2003), 177-206. DOI 10.1007/s00031-003-0515-6.
   726	
   727	\bibitem{eno2005}
   728	P. Etingof, D. Nikshych, and V. Ostrik, On fusion categories, arXiv:math/0203060; \emph{Ann. of Math.} \textbf{162} (2005), no. 2, 581-642. DOI 10.4007/annals.2005.162.581.
   729	
   730	\bibitem{petz1996}
   731	D. Petz, Monotone metrics on matrix spaces, \emph{Linear Algebra Appl.} \textbf{244} (1996), 81-96. DOI 10.1016/0024-3795(94)00211-8.
   732	
   733	\bibitem{petzsudar2001}
   734	D. Petz and Cs. Sud\'ar, Extending the Fisher metric to density matrices, in \emph{Geometry in Present Days Science} (O. E. Barndorff-Nielsen and E. B. Vendel Jensen, eds.), World Scientific, 1999, pp. 21-34; arXiv:quant-ph/0102132.
   735	
   736	\end{thebibliography}
   737	
   738	\end{document}

exec
/usr/local/bin/zsh -lc "sed -n '188,390{=;p;}' papers/latex/vol-06-quantum-systems.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
188
\begin{corollary}[Counting small algebras]
189
\label{cor:count}
190
For each $d \geq 1$ the $*$-isomorphism classes of finite-dimensional $C^*$-algebras of complex dimension $d$ are in bijection with the partitions of $d$ into perfect squares. In particular the number of such algebras grows as the number of such partitions.
191
\end{corollary}
192

193
We write a multiset such as eight $1$s and one $2$ as $\{1^8, 2\}$. Table \ref{tab:counts} lists the block multisets for small $d$.
194

195
\begin{table}[ht]
196
\centering
197
\caption{Dimension vectors of finite-dimensional $C^*$-algebras of complex dimension $d$, written as multisets of block sizes.}
198
\label{tab:counts}
199
\small
200
\begin{tabularx}{\textwidth}{@{}c X c@{}}
201
\toprule
202
$d$ & Dimension vectors & Count \\
203
\midrule
204
1 & $\{1\}$ & 1 \\
205
2 & $\{1^2\}$ & 1 \\
206
3 & $\{1^3\}$ & 1 \\
207
4 & $\{1^4\}$ and $\{2\}$ & 2 \\
208
5 & $\{1^5\}$ and $\{1, 2\}$ & 2 \\
209
6 & $\{1^6\}$ and $\{1^2, 2\}$ & 2 \\
210
7 & $\{1^7\}$ and $\{1^3, 2\}$ & 2 \\
211
8 & $\{1^8\}$, $\{1^4, 2\}$, and $\{2^2\}$ & 3 \\
212
9 & $\{1^9\}$, $\{1^5, 2\}$, $\{1, 2^2\}$, and $\{3\}$ & 4 \\
213
10 & $\{1^{10}\}$, $\{1^6, 2\}$, $\{1^2, 2^2\}$, and $\{1, 3\}$ & 4 \\
214
11 & $\{1^{11}\}$, $\{1^7, 2\}$, $\{1^3, 2^2\}$, and $\{1^2, 3\}$ & 4 \\
215
12 & $\{1^{12}\}$, $\{1^8, 2\}$, $\{1^4, 2^2\}$, $\{2^3\}$, and $\{1^3, 3\}$ & 5 \\
216
\bottomrule
217
\end{tabularx}
218
\end{table}
219

220
\begin{remark}[Recognition]
221
\label{rem:recognition}
222
The dimension vector solves the recognition problem for this class as well as the classification problem: given matrix blocks, comparing their size multisets decides $*$-isomorphism directly, and the comparison is a sort. In the finite-dimensional regime classification, parameterization, and recognition therefore coincide. The classification of finite simple groups separates the three: it delivers the list, partially solves recognition through atlas data, and supplies no uniform parameterization. The separation reappears, in worse form, in \cref{sec:mcduff}.
223
\end{remark}
224

225
\subsection{States and state spaces}
226

227
The observable algebra of \cref{thm:findim} carries state space data that the classification records.
228

229
\begin{proposition}[States of a block algebra]
230
\label{prop:states}
231
Let $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$. Every state $\rho$ on $A$ is of the form
232
\[
233
\rho(X_1, \dots, X_k) = \sum_{i=1}^{k} \operatorname{Tr}(\sigma_i X_i)
234
\]
235
for positive matrices $\sigma_i \in M_{n_i}(\mathbb{C})$ with $\sum_i \operatorname{Tr} \sigma_i = 1$, and this correspondence is bijective. The pure states of $A$ are the vector states of individual blocks, so the pure state space is the disjoint union of complex projective spaces $\mathbb{CP}^{n_i - 1}$.
236
\end{proposition}
237

238
\begin{proof}
239
A positive functional on a direct sum is blockwise positive, so it suffices to treat one block. On $M_n(\mathbb{C})$ every positive functional is a trace against a positive matrix: the matrix $\sigma$ with entries $\sigma_{ji} = \rho(E_{ij})$ satisfies $\rho(X) = \operatorname{Tr}(\sigma X)$ for all $X$ by linearity on matrix units, and positivity of $\rho$ gives $\sigma \geq 0$. Normalization of $\rho$ on $A$ reads $\sum_i \operatorname{Tr} \sigma_i = 1$. Purity forces all but one $\sigma_i$ to vanish and that $\sigma_i$ to have rank one, which is a vector state of block $i$.
240
\end{proof}
241

242
The state space of $A$, as a compact convex body, is therefore determined by the dimension vector: it is the join of the density-matrix bodies of the blocks.
243

244
\begin{proposition}[Automorphisms of block algebras]
245
\label{prop:aut}
246
Every $*$-automorphism of $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ is the composition of a blockwise inner automorphism and a permutation of blocks of equal size. The dynamics of a finite-dimensional quantum system is therefore a unitary path inside blocks together with block permutations of equal size, and none of it is recorded by the dimension vector beyond the block sizes themselves.
247
\end{proposition}
248

249
\begin{proof}
250
By \cref{thm:findim} every $*$-automorphism permutes the simple ideals of $A$, and it can permute only ideals of equal size, being a $*$-isomorphism. On a single block every $*$-automorphism of $M_n(\mathbb{C})$ is inner, so after choosing the permutation the automorphism is blockwise conjugation by unitaries. The second statement collects the description.
251
\end{proof}
252

253
\begin{proposition}[Unique decomposition in the finite-dimensional class]
254
\label{prop:unique}
255
Decompositions of a finite-dimensional $C^*$-algebra $A$ into irreducible summands under direct sum exist and are unique up to order and unitary equivalence. The dimension vector is therefore complete data for the decomposition as well as for the isomorphism class, and the uniqueness that fails for interacting systems in general holds in this restricted class.
256
\end{proposition}
257

258
\begin{proof}
259
Existence is \cref{thm:findim}. Uniqueness holds because the summands are the simple ideals of the semisimple algebra $A$, and the minimal nonzero two-sided ideals of a semisimple algebra are unique. Any decomposition into irreducible summands exhibits exactly these ideals, and the order of the summands is not part of the data, matching the multiset form of the dimension vector.
260
\end{proof}
261

262
\begin{proposition}[Tensor products of block algebras]
263
\label{prop:tensor}
264
Let $A = \bigoplus_i M_{n_i}(\mathbb{C})$ and $B = \bigoplus_j M_{m_j}(\mathbb{C})$. Then $A \otimes B \cong \bigoplus_{i,j} M_{n_i m_j}(\mathbb{C})$, and the dimension vector of $A \otimes B$ is the multiset of products $\{n_i m_j\}$. In particular the dimension vector of a tensor product is computed from the factor dimension vectors without reference to any presentation.
265
\end{proposition}
266

267
\begin{proof}
268
The tensor product of matrix algebras satisfies $M_n(\mathbb{C}) \otimes M_m(\mathbb{C}) \cong M_{nm}(\mathbb{C})$ as $C^*$-algebras, and the tensor product of direct sums distributes: $A \otimes B \cong \bigoplus_{i,j} M_{n_i}(\mathbb{C}) \otimes M_{m_j}(\mathbb{C})$. \Cref{thm:findim} then identifies the result blockwise.
269
\end{proof}
270

271
\section{Operator algebras and factors}
272
\label{sec:factors}
273

274
Infinite-dimensional quantum systems require operator-algebraic observables. The classification of von Neumann algebras reduces to factors, and the classification of factors is complete on the amenable side and out of reach of any finite list of types on the general side.
275

276
\begin{definition}[Factor types]
277
\label{def:factortype}
278
A factor $M$ is of type $\mathrm{I}$ if it contains minimal projections, of type $\mathrm{II}_1$ if it is infinite-dimensional with a finite faithful normal trace, of type $\mathrm{II}_\infty$ if it is properly infinite with a semifinite trace, and of type $\mathrm{III}$ if it admits no nonzero finite trace. The type $\mathrm{III}$ factors are stratified by the Connes spectrum of the modular automorphism group, with parameters $\lambda \in (0,1)$ and the two endpoint cases $\mathrm{III}_0$ and $\mathrm{III}_1$.
279
\end{definition}
280

281
Murray-von Neumann comparison theory is the tool behind the trichotomy. Two projections $p$ and $q$ of a von Neumann algebra are equivalent when a partial isometry $u$ with $u^* u = p$ and $u u^* = q$ exists, and in a factor any two projections are comparable: either $p$ is equivalent to a subprojection of $q$ or conversely. Type $I$ factors contain minimal projections, type $\mathrm{II}$ factors contain no minimal projections but do contain nonzero finite projections, and type $\mathrm{III}$ factors have every nonzero projection infinite. The type of a factor is therefore the first invariant of \cref{thm:amenable}.
282

283
The reduction to factors is the operator-algebraic analogue of block decomposition.
284

285
\begin{definition}[Amenable factors]
286
\label{def:amenable}
287
All factors in this section have separable predual. A factor is hyperfinite, or approximately finite-dimensional, when it is the norm closure of an increasing union of finite-dimensional subalgebras, and injective when a norm-one projection of $B(H)$ onto it exists. For factors with separable predual the two conditions coincide, and a factor satisfying them is amenable. The unique amenable factor of type $\mathrm{II}_1$ with separable predual is the hyperfinite factor $R$.
288
\end{definition}
289

290
\begin{theorem}[Central decomposition]
291
\label{thm:central}
292
Every von Neumann algebra $M$ is a direct integral of factors over a measure space, unique up to measure-class isomorphism of the base. The isomorphism classification of von Neumann algebras therefore reduces to the classification of factors together with the measure-theoretic data of the decomposition.
293
\end{theorem}
294

295
\Cref{thm:central} is the Murray-von Neumann direct-integral decomposition; we refer to the original work and to the standard accounts for the proof. The classification content sits in the factors.
296

297
\begin{theorem}[Classification of amenable factors]
298
\label{thm:amenable}
299
Among factors with separable predual the amenable (equivalently injective, equivalently hyperfinite) factors are classified as follows. For each $n \geq 1$ there is a unique factor of type $\mathrm{I}_n$ and a unique factor of type $\mathrm{I}_\infty$. There is a unique amenable factor of type $\mathrm{II}_1$, the hyperfinite factor, and a unique amenable factor of type $\mathrm{II}_\infty$. For each $\lambda \in (0,1)$ there is a unique amenable factor of type $\mathrm{III}_\lambda$, and a unique amenable factor of type $\mathrm{III}_1$. Amenable factors of type $\mathrm{III}_0$ are classified by the ergodic flow of weights. The invariants in force are the Murray-von Neumann type together with the Connes invariants. Separable predual is essential: among non-separable injective $\mathrm{II}_1$ factors uniqueness fails, and there are $2^{\mathfrak{c}}$ pairwise non-isomorphic ones.
300
\end{theorem}
301

302
\begin{proof}[Status of the proof]
303
The type $\mathrm{I}$ and type $\mathrm{II}$ cases are Murray-von Neumann's, together with the existence and uniqueness of the hyperfinite $\mathrm{II}_1$ factor. The classification of injective factors, including the type $\mathrm{III}_\lambda$ cases for $\lambda \neq 0$, is Connes's theorem of 1976, building on his 1973 classification of type $\mathrm{III}$ factors by the invariants of \cref{def:factortype}. Uniqueness of the injective factor of type $\mathrm{III}_1$ was completed by Haagerup in 1987 through the bicentralizer problem. The statements are established theorems of the literature; the proofs are deep analytic arguments in von Neumann algebra theory and are not reproduced here. What is proved in this paper is the finite-dimensional content of \cref{sec:findim} and the channel content of \cref{sec:channels}, each in full.
304
\end{proof}
305

306
\subsection{The hyperfinite factor}
307

308
In type $\mathrm{II}_1$ the hyperfinite factor $R$ is the norm closure of an increasing union of full matrix algebras $M_{2^k}(\mathbb{C})$ along the embeddings $A \mapsto A \otimes I_2$, and every amenable $\mathrm{II}_1$ factor with separable predual is isomorphic to $R$. The type $\mathrm{III}_\lambda$ factors for $\lambda \in (0,1)$ arise differently: as infinite tensor products of finite type I factors carrying non-tracial product states (the Powers factors), not as inductive limits of matrix algebras along unital embeddings. The unique amenable factor of type $\mathrm{III}_1$ is the limit case completed by Haagerup's theorem.
309

310
Within type $\mathrm{III}_0$ the amenable factors are classified by the ergodic flow of weights up to conjugacy of the flow, and this is the one stratum whose invariant is an ergodic object rather than a number.
311

312
The factor $R$ is the reference object of the classification. It lies inside the classified regime of \cref{thm:amenable}, it is the unique separable injective $\mathrm{II}_1$ factor, and the uncountable family of \cref{thm:mcduff} is produced by varying the central-sequence structure of algebras built from it. The boundary between the amenable side and the general side is therefore a boundary inside the separable $\mathrm{II}_1$ factors themselves.
313

314
\begin{remark}[Type $\mathrm{III}$ strata]
315
\label{rem:typeIII}
316
The Connes spectrum $S(M) = \bigcap_{\varphi} \operatorname{Sp}(\Delta_\varphi)$ is the intersection over normal faithful states $\varphi$ of the spectra of the modular operators $\Delta_\varphi$, a subset of $[0, \infty)$, and the flow of weights is the ergodic flow attached to the modular automorphism group through the central decomposition. The stratum data are read off from $S(M) \cap \mathbb{R}_+^*$: it is $\{1\}$ in type $\mathrm{III}_0$, $\lambda^{\mathbb{Z}}$ in type $\mathrm{III}_\lambda$ for $\lambda \in (0,1)$, and $(0, \infty)$ in type $\mathrm{III}_1$. \Cref{thm:amenable} classifies the amenable factors through these invariants and the ergodic flow of weights in type $\mathrm{III}_0$. Beyond the amenable class the strata are coarse: fundamental groups of type $\mathrm{III}$ factors vary widely, and the structure theory past the Connes spectrum is open. No completeness claim for non-amenable type $\mathrm{III}$ factors is used anywhere in this paper.
317
\end{remark}
318

319
\begin{remark}[The Elliott program]
320
\label{rem:elliott}
321
For separable simple nuclear $C^*$-algebras the analogous program classifies algebras by $K$-theoretic and tracial data. The program is unfinished. Toms constructed a simple unital algebra shape equivalent to its tensor product with an infinite-dimensional UHF algebra and with the same tracial simplex, yet not isomorphic to it, so $K$-theory and traces together do not complete the classification without further hypotheses. This paper draws no classification conclusion from the Elliott program.
322
\end{remark}
323

324
\section{The McDuff obstruction}
325
\label{sec:mcduff}
326

327
The most consequential theorem for the classification program is negative.
328

329
\begin{theorem}[McDuff 1969]
330
\label{thm:mcduff}
331
There exist uncountably many pairwise non-isomorphic separable type $\mathrm{II}_1$ factors.
332
\end{theorem}
333

334
\begin{proof}[Consequence for classification]
335
The theorem asserts continuum many isomorphism classes: the separable $\mathrm{II}_1$ factors form an uncountable family with no repetitions up to isomorphism. Two consequences follow. No finite or countable list of factor types can exhaust the family, so a CFSG-style list of types cannot be complete outside a restricted class, and any classification theorem for $\mathrm{II}_1$ factors must restrict its class (for instance to the amenable factors of \cref{thm:amenable}) or weaken its conclusion to a coarser equivalence. The theorem by itself does not decide whether a classification by continuous parameters exists; that question belongs to the descriptive set theory of von Neumann algebra isomorphism and is not settled here. What the theorem does settle is that the separation is visible in the operator-algebraic structure itself: the construction separates factors through their central sequences.
336
\end{proof}
337

338
\begin{corollary}[No finite list of factor types]
339
\label{cor:nofinite}
340
No finite or countable list of pairwise non-isomorphic factor types exhausts the separable $\mathrm{II}_1$ factors, and no CFSG-style list of factor types is complete outside a restricted class such as the amenable factors.
341
\end{corollary}
342

343
\begin{proof}
344
A finite or countable list covers countably many isomorphism classes, and \cref{thm:mcduff} supplies continuum many. The second statement is the first applied to the CFSG shape of a classification theorem.
345
\end{proof}
346

347
\begin{remark}[Honest record]
348
\label{rem:mcduff}
349
\Cref{thm:mcduff} marks the boundary of the classifiable territory: it is a classification result of the same standing as the positive theorems, not a difficulty to be engineered around. The amenable factors lie inside the boundary by \cref{thm:amenable}, and the general $\mathrm{II}_1$ factors lie outside it.
350
\end{remark}
351

352
Inside the amenable class the classification has the shape of a CFSG-style theorem: a list of types, a complete set of invariants, and a uniqueness statement for each type. The obstruction says this shape cannot extend to all separable $\mathrm{II}_1$ factors, so the shape must be sought in restricted classes or with weakened equivalences. The amenable classification is one instance of the pattern; whether rigidity hypotheses on non-amenable factors define another instance is one of the open problems of \cref{sec:regimes}.
353

354
\section{Channels and dilations}
355
\label{sec:channels}
356

357

358
\subsection{Choi-Kraus normal form}
359

360
The morphisms of finite-dimensional quantum systems that appear in measurement and evolution are channels (\cref{def:channels}). Their normal form is the first of the two canonical-form theorems of the paper.
361

362
\begin{lemma}[Choi correspondence]
363
\label{lem:choi}
364
For a linear map $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ with Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$ the following hold: $\Phi$ is completely positive if and only if $J(\Phi) \geq 0$, and $\Phi$ is trace preserving if and only if $\operatorname{Tr}_m J(\Phi) = I_n$, where $\operatorname{Tr}_m$ is the partial trace over the second tensor factor.
365
\end{lemma}
366

367
\begin{proof}
368
Complete positivity is tested on positive elements of $M_n(\mathbb{C}) \otimes M_k(\mathbb{C})$ for all $k$, and for $k = n$ the condition $(\operatorname{id} \otimes \Phi)(P) \geq 0$ on rank-one projections $P = |\psi\rangle\langle\psi|$ with $|\psi\rangle = \sum_i e_i \otimes e_i$ reads $J(\Phi) \geq 0$; the general case follows by direct sums. For the trace condition, $\operatorname{Tr}_m J(\Phi)$ has $(i,j)$ entry $\operatorname{Tr}(\Phi(E_{ij}))$, and $\Phi$ preserves trace exactly when $\operatorname{Tr}(\Phi(E_{ij})) = \delta_{ij}$, which is $\operatorname{Tr}_m J(\Phi) = I_n$.
369
\end{proof}
370

371
\begin{example}[A family of one Kraus rank]
372
\label{ex:depol}
373
For $p \in (0,1)$ set $A_0 = \sqrt{1 - p} \, I_2$ and $A_i = \sqrt{p/3} \, \sigma_i$ for the three Pauli matrices $\sigma_i$. The map $\Phi_p(X) = \sum_{k=0}^{3} A_k X A_k^*$ satisfies $\sum_k A_k^* A_k = I_2$, so it is a qubit channel. Its Choi matrix has eigenvalues $2(1 - p)$ and $2p/3$ with multiplicity three, all positive, so the Kraus rank is $4$ for every $p \in (0,1)$. The Choi spectrum varies with $p$, and unitary equivalence of channels preserves the Choi spectrum, so the family consists of pairwise unitarily inequivalent channels sharing one Kraus rank.
374
\end{example}
375

376
\begin{example}[Choi matrix of a qubit channel]
377
\label{ex:choi}
378
For the channel $\Phi_p$ of \cref{ex:depol} the Kraus vectors are the vectorizations of $I_2$ and of the Pauli matrices, which are orthogonal for the Hilbert-Schmidt pairing. The Choi matrix is therefore diagonal in the basis these vectors span, with eigenvalues $2(1 - p)$ and $2p/3$ with multiplicity three. Trace preservation reads $\operatorname{Tr}_m J(\Phi_p) = I_2$ on these eigenvalues, and complete positivity reads $J(\Phi_p) \geq 0$, which holds for $p \in (0,1)$. The eigenvalue list is the input of the minimization statement of \cref{prop:krausrank}.
379
\end{example}
380

381
\begin{theorem}[Choi-Kraus normal form]
382
\label{thm:kraus}
383
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be linear. Then $\Phi$ is completely positive if and only if there are matrices $A_1, \dots, A_r \in M_{m \times n}(\mathbb{C})$ with
384
\[
385
\Phi(X) = \sum_{i=1}^{r} A_i X A_i^* \qquad \text{for all } X \in M_n(\mathbb{C}),
386
\]
387
and one may take $r$ equal to the rank of the Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$. The minimal such $r$ is the Kraus rank of $\Phi$ and equals the rank of $J(\Phi)$.
388
\end{theorem}
389

390
\begin{proof}

exec
/usr/local/bin/zsh -lc "sed -n '391,548{=;p;}' papers/latex/vol-06-quantum-systems.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
391
Write $J(\Phi) \in M_{nm}(\mathbb{C})$ in block form as the $n \times n$ block matrix with blocks $\Phi(E_{ij})$. Complete positivity of $\Phi$ is equivalent to positivity of $J(\Phi)$, and positivity is equivalent to a factorization $J(\Phi) = \sum_{k=1}^{r} v_k v_k^*$ with $r = \operatorname{rank} J(\Phi)$ and vectors $v_k \in \mathbb{C}^n \otimes \mathbb{C}^m$. Fix an orthonormal basis $e_1, \dots, e_n$ of $\mathbb{C}^n$ and decompose each $v_k = \sum_{j=1}^{n} e_j \otimes w_{kj}$ with $w_{kj} \in \mathbb{C}^m$. Let $A_k \in M_{m \times n}(\mathbb{C})$ be the matrix whose $j$-th column is $w_{kj}$. The $(i,j)$ block of $J(\Phi)$ is then $\sum_{k=1}^{r} w_{ki} w_{kj}^* = \sum_{k=1}^{r} A_k E_{ij} A_k^*$, so $\Phi(E_{ij}) = \sum_{k} A_k E_{ij} A_k^*$ for all $i, j$ and by linearity $\Phi(X) = \sum_{k} A_k X A_k^*$ for all $X$. Conversely any such representation writes $J(\Phi)$ as a sum of $s$ rank-one positive terms, so $s \geq \operatorname{rank} J(\Phi)$ and the minimal number of Kraus operators equals $r$.
392
\end{proof}
393

394
\begin{remark}[Normal form versus classification]
395
\label{rem:normalform}
396
\Cref{thm:kraus} is a normal-form theorem, not a classification of channels up to isomorphism. The Kraus rank is an invariant of the minimal presentation of one channel. \Cref{sec:channels} exhibits channels with equal Kraus rank that no unitary change of presentation identifies, and the literature records no isomorphism classification of channels beyond the normal form.
397
\end{remark}
398

399
\subsection{Stinespring dilations}
400

401
Stinespring's theorem gives every channel a canonical dilation through an environment, and a minimal dilation is unique up to unitary. The statement is the second canonical-form theorem of the paper.
402

403
\begin{theorem}[Stinespring dilation]
404
\label{thm:stinespring}
405
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be a channel. Then $\Phi$ admits a Stinespring dilation $(K, V)$ in the sense of \cref{def:channels}, and minimal dilations exist. Any two minimal dilations $(K, V)$ and $(K', V')$ of $\Phi$ are unitarily equivalent: there is a unitary $U: K \to K'$ with $(I_m \otimes U) V = V'$. The dimension $\dim K$ of a minimal dilation equals the Kraus rank of $\Phi$.
406
\end{theorem}
407

408
\begin{proof}
409
Take a Kraus presentation $\Phi(X) = \sum_{k=1}^{r} A_k X A_k^*$ as in \cref{thm:kraus}, with $r$ the Choi rank. Set $K = \mathbb{C}^r$ and define $V: \mathbb{C}^n \to \mathbb{C}^m \otimes K$ by $V \psi = \sum_{k=1}^{r} (A_k \psi) \otimes e_k$ for the standard basis $e_k$ of $K$. Then $V^* V = \sum_k A_k^* A_k = I_n$ because $\Phi$ preserves trace, so $V$ is an isometry, and $\operatorname{Tr}_K(V X V^*) = \sum_k A_k X A_k^* = \Phi(X)$. A dilation on a space of dimension less than $r$ would yield a Kraus presentation with fewer than $r$ operators, which \cref{thm:kraus} forbids, so this dilation is minimal. For uniqueness, both $K$ and $K'$ are spanned by vectors of the form $(w^* \otimes I) V \psi$ and $(w^* \otimes I) V' \psi$ with $w \in \mathbb{C}^m$ and $\psi \in \mathbb{C}^n$, the correspondence between these vectors preserves inner products because both dilations realize the same map $\Phi$, and it extends to a unitary $U: K \to K'$ with $(I_m \otimes U) V = V'$. For completely positive unital maps on a general $C^*$-algebra the dual picture holds: $\Phi(a) = V^* \pi(a) V$ with $\pi$ a unital $*$-representation and $V$ an isometry, which is Stinespring's original form.
410
\end{proof}
411

412
\begin{remark}[Two pictures]
413
\label{rem:pictures}
414
Channels appear in two standard forms. In the Schr\"odinger picture a channel is completely positive and trace preserving, acting on states and dilating through an environment as in \cref{def:channels}. In the Heisenberg picture a channel is a unital completely positive map of observable algebras, and its Stinespring form is the compression $\Phi(a) = V^* \pi(a) V$ named at the end of \cref{thm:stinespring}. The two pictures are related by adjunction, the dilation statements hold in either, and the invariant content is the same.
415
\end{remark}
416

417
For channels on matrix algebras the minimal dilation is finite-dimensional and the unitary freedom of \cref{thm:stinespring} is exactly the change-of-presentation freedom of Kraus operators.
418

419
\begin{proposition}[Kraus rank is a normal-form invariant]
420
\label{prop:krausrank}
421
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be a channel. The Kraus rank of $\Phi$ equals the rank of its Choi matrix, equals the minimal number of Kraus operators in any representation of $\Phi$, and equals the dimension of the environment $K$ in a minimal Stinespring dilation. The Kraus rank is preserved by unitary changes of Kraus presentation and by composition of $\Phi$ with unitary conjugations of domain and codomain. It is not a complete invariant of channels: two channels with equal Kraus rank need not be unitarily equivalent.
422
\end{proposition}
423

424
\begin{proof}
425
The equalities with the Choi rank and the minimal Kraus number are \cref{thm:kraus}; the equality with the minimal dilation dimension is the construction of \cref{thm:stinespring} specialized to matrix algebras. Unitary conjugation of the Kraus operators replaces each $A_i$ by $W A_i U^*$ with $U, W$ unitary and does not change the rank of the Choi matrix. For the negative statement take the channel family $\Phi_p$ of \cref{ex:depol}. Its Kraus rank is $4$ for every $p \in (0,1)$, its Choi eigenvalues $2(1-p)$ and $2p/3$ vary with $p$, and unitary equivalence of channels preserves the Choi spectrum. Distinct values of $p$ give inequivalent channels with equal Kraus rank.
426
\end{proof}
427

428
\begin{remark}[Prohibition recorded]
429
\label{rem:prohibition}
430
\Cref{prop:krausrank} records the exact boundary. Kraus rank may be used to compare normal forms of one channel and to detect minimality of a dilation. It may not be used as an isomorphism classification of channels, and no theorem of this paper treats it as one. The Kraus rank is an invariant of the minimal dilation layer of structure and carries no classification claim for the channel layer.
431
\end{remark}
432

433
\begin{proposition}[Composition of channels]
434
\label{prop:compose}
435
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ and $\Psi: M_m(\mathbb{C}) \to M_p(\mathbb{C})$ be linear. Then
436
\[
437
J(\Psi \circ \Phi)_{(i\alpha),(j\beta)} = \sum_{k,l=1}^{m} J(\Phi)_{(ik),(jl)} \, J(\Psi)_{(k\alpha),(l\beta)},
438
\]
439
with composite indices as in \cref{lem:choi}. The right-hand side is the link product of $J(\Phi)$ and $J(\Psi)$: matrix multiplication of $J(\Phi)$ after partial transpose on the shared subsystem, contracted with $J(\Psi)$ along that subsystem. Composition of channels is therefore a link-product contraction, and the Choi matrix of a composite is determined by the Choi matrices of the factors.
440
\end{proposition}
441

442
\begin{proof}
443
Write $\Phi(E_{ij}) = \sum_{k,l} c^{ij}_{kl} E_{kl}$ and read $J(\Phi)_{(ik),(jl)} = c^{ij}_{kl}$ and $J(\Psi)_{(k\alpha),(l\beta)} = \Psi(E_{kl})_{\alpha\beta}$. The right-hand side of the claimed identity is then $\sum_{k,l} c^{ij}_{kl} \Psi(E_{kl})_{\alpha\beta} = \Psi(\Phi(E_{ij}))_{\alpha\beta}$, which is $J(\Psi \circ \Phi)_{(i\alpha),(j\beta)}$ by definition.
444
\end{proof}
445

446
\begin{remark}[What a channel classification would need]
447
\label{rem:channelclass}
448
A classification of channels up to unitary equivalence would need invariants separating the orbits of the unitary action $\{A_k\} \mapsto \{W A_k U^*\}$ on Kraus presentations. The Choi spectrum is one such invariant and is not complete, as \cref{ex:depol} shows at the level of spectra alone; the orbit data of a presentation involves the arrangement of its Kraus vectors in $\mathbb{C}^n \otimes \mathbb{C}^m$ beyond their Gram matrix. No complete set of orbit invariants is on record, and this is the fourth open problem of \cref{sec:regimes}.
449
\end{remark}
450

451
\section{Tensor categories and superselection}
452
\label{sec:tensor}
453

454
Superselection sectors of a quantum field theory organize into tensor categories, and two reconstruction theorems classify such categories under explicit hypotheses. The hypotheses are load-bearing: both theorems fail or become open when they are dropped, and one equivalence-negligible layer turns out to carry the group.
455

456
\begin{definition}[Superselection category]
457
\label{def:dhr}
458
Fix a local net of observable algebras satisfying the Haag-Kastler axioms and the DHR selection criterion: representations that are equivalent to the vacuum representation on the algebra of every causally disconnected region. Under Haag duality these representations correspond to localized transportable endomorphisms of the observable algebra, and their intertwiners form a symmetric tensor $*$-category with conjugates, direct sums, and subobjects.
459
\end{definition}
460

461
The tensor structure of that category is concrete. Composition of endomorphisms supplies the tensor product, intertwiners supply the morphisms, conjugate endomorphisms supply duals, and the statistics of composing an endomorphism with itself distinguishes bosonic from fermionic sectors. Haag duality is the step that passes from representations to endomorphisms, and the selection criterion is what bounds the sectors; modified selection rules change the category.
462

463
\begin{theorem}[Doplicher-Roberts reconstruction]
464
\label{thm:dr}
465
Let $\mathcal{C}$ be a symmetric tensor $*$-category with conjugates, direct sums, and subobjects, and with $\operatorname{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent, as a symmetric tensor $*$-category, to the category of finite-dimensional unitary representations of a compact supergroup $G$, and $G$ is unique up to isomorphism.
466
\end{theorem}
467

468
\Cref{thm:dr} is stated with its hypotheses on the face of the statement. The symmetric structure, the existence of conjugates, and the scalar endomorphism ring of the unit are each used in the proof; a category missing them lies outside the theorem. The reconstruction of the gauge group from superselection data is the completion of the Doplicher-Haag-Roberts analysis, and the supergroup grading accounts for fermionic sectors.
469

470
\begin{remark}[Selection criteria matter]
471
\label{rem:selection}
472
The DHR criterion selects representations with trivial behaviour at infinity. Long-range forces such as electromagnetism violate the criterion, and the resulting categories fall outside \cref{thm:dr} unless the analysis is redone with modified selection rules. A classification claim for superselection categories is therefore always relative to the selection criterion in force.
473
\end{remark}
474

475
\begin{remark}[What reconstruction does not do]
476
\label{rem:scope}
477
The Doplicher-Roberts theorem recovers a symmetry group from sector data. It does not recover spacetime, dynamics, or states, and it does not classify the systems whose sectors are being read.
478
\end{remark}
479

480
\begin{theorem}[Deligne]
481
\label{thm:deligne}
482
Let $\mathcal{C}$ be a $\mathbb{C}$-linear, abelian, rigid symmetric tensor category over $\mathbb{C}$ of subexponential growth, with $\operatorname{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent, as a symmetric tensor category, to the category of finite-dimensional representations of an affine supergroup scheme. In particular the category is Tannakian in the super sense.
483
\end{theorem}
484

485
Deligne's theorem classifies a purely categorical hypothesis class, without reference to any net of observables. The two reconstruction theorems differ in their inputs and agree in their outputs. The Doplicher-Roberts theorem starts from the sectors of a net of observables, so its hypotheses are analytic as well as categorical: Haag duality, the selection criterion, and the tensor structure of intertwiners. Deligne's theorem starts from $\mathbb{C}$-linearity, abelianness, rigidity, symmetry, and subexponential growth. Both conclusions are representation categories of supergroups, so the two theorems are the analytic and the categorical face of one reconstruction pattern, and neither classifies the systems whose sectors or categories are being read. Together \cref{thm:dr,thm:deligne} settle the classification of the symmetric categories that appear as superselection data, and of the finite-growth categories that appear in low-dimensional and combinatorial models. The case of fusion categories (finitely many simple objects, semisimple, finite categorical dimension) is open beyond these hypotheses.
486

487
\begin{proposition}[Etingof-Gelaki counterexample]
488
\label{prop:eg}
489
There exist finite non-isomorphic groups $G_1$ and $G_2$ whose representation categories over $\mathbb{C}$ are equivalent as tensor categories, but not as symmetric tensor categories. Consequently an equivalence of tensor categories that forgets the symmetric structure cannot recover the group, and any classification of such categories built on that equivalence is false.
490
\end{proposition}
491

492
\begin{proof}
493
Etingof and Gelaki exhibit the affine symplectic group of a vector space over the field of two elements and a corresponding affine pseudosymplectic group: these are non-isomorphic and isocategorical, meaning their representation categories are monoidally equivalent. The symmetric structure of the two categories differs, and Tannaka reconstruction for symmetric tensor categories recovers the group from the symmetric structure alone. The symmetric layer is therefore load-bearing in the sense of \cref{def:preserved}, and an equivalence that discards it identifies objects that the classification must separate.
494
\end{proof}
495

496
\begin{remark}[Equivalence discipline]
497
\label{rem:egdiscipline}
498
Any equivalence of tensor categories must declare the layers it preserves. The standing qualification on relational characterizations applies in full: ``Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.''
499
\end{remark}
500

501
\begin{remark}[Fusion categories]
502
\label{rem:fusion}
503
Every fusion category is the representation category of a weak Hopf algebra, a result obtained through the module-category machinery of Ostrik, and this gives a presentation theorem rather than a classification. The structural conjectures of Etingof, Nikshych, and Ostrik, in particular the existence of a coherent monoidal isomorphism $A \cong A^{**}$ for every fusion category $A$, remain open, and this paper states all fusion-category claims as conditional on those conjectures.
504
\end{remark}
505

506
\section{Monotone metrics on quantum states}
507
\label{sec:metrics}
508

509
The measure-theoretic family contributes the third invariant type of the paper, and the quantum case is where a classical uniqueness theorem becomes a parametric classification.
510

511
\begin{definition}[Monotone metric]
512
\label{def:monotone}
513
Let $\mathcal{D}_n$ denote the manifold of strictly positive density matrices of $M_n(\mathbb{C})$, an open subset of the affine space of self-adjoint trace-one matrices, with tangent space $T_\rho \mathcal{D}_n$ the space of self-adjoint traceless matrices at $\rho$. A monotone metric assigns to each $\rho \in \mathcal{D}_n$ an inner product on $T_\rho \mathcal{D}_n$ such that the metric decreases under every completely positive trace-preserving map. In the classical setting the corresponding notion is monotonicity under stochastic maps.
514
\end{definition}
515

516
\begin{remark}[Classical uniqueness]
517
\label{rem:chentsov}
518
Chentsov's theorem classifies monotone metrics on the simplex of probability distributions: the Fisher metric is the unique metric, up to a positive constant, that decreases under every stochastic map. The quantum statement of \cref{thm:petz} replaces uniqueness by a parametric family, and no rescaling recovers a unique quantum metric. The contrast is the quantum instance of a classical-to-quantum gap that runs through the series: uniqueness statements on the classical side do not transfer.
519
\end{remark}
520

521
\begin{theorem}[Petz]
522
\label{thm:petz}
523
Monotone metrics on $\mathcal{D}_n$ are in bijection with operator monotone functions $f: (0,\infty) \to (0,\infty)$ that satisfy the symmetry condition $f(t) = t f(1/t)$ and the normalization $f(1) = 1$. Given such a function $f$, the corresponding metric on the tangent space $T_\rho \mathcal{D}_n$ is
524
\[
525
g_\rho^f(A, B) = \operatorname{Tr}\Bigl(A^* \bigl[R_\rho \, f(L_\rho R_\rho^{-1})\bigr]^{-1}(B)\Bigr),
526
\]
527
where $L_\rho$ and $R_\rho$ are the left and right multiplication operators by $\rho$ on $M_n(\mathbb{C})$. Distinct normalized operator monotone functions give distinct monotone metrics.
528
\end{theorem}
529

530
\begin{proof}[Status of the proof]
531
The classification is Petz's theorem. The condition $f(t) = t f(1/t)$ is the symmetry of the resulting form under exchange of $A$ and $B$, and the normalization $f(1) = 1$ fixes the scale: without it every positive scalar multiple of $f$ satisfies the symmetry condition and rescales the metric, and the correspondence is not a bijection. Distinct normalized functions give distinct metrics already on $2 \times 2$ density matrices. The proof is an operator-geometric argument in monotone matrix theory and is not reproduced here. The parametric conclusion is recorded in the sources of Petz and of Petz-Sudar, who construct and compare explicit members of the family and state the contrast with Chentsov uniqueness outright.
532
\end{proof}
533

534
\begin{corollary}[Parametricity of the quantum invariant]
535
\label{cor:parametric}
536
The monotone metrics of quantum states are classified by a continuous parameter (the normalized operator monotone function), not by a discrete choice. There is no quantum analogue of Chentsov uniqueness, and any classification statement for quantum monotone metrics must accept a parametric invariant in place of a unique object.
537
\end{corollary}
538

539
\begin{example}[Two standard metrics]
540
\label{ex:metrics}
541
The function $f(t) = (1 + t)/2$ is operator monotone and satisfies $f(1) = 1$ and $f(t) = t f(1/t)$. In the eigenbasis of $\rho$ with eigenvalues $\lambda_i$ its metric reads $g_\rho(A, A) = \sum_{i,j} 2 |A'_{ij}|^2 / (\lambda_i + \lambda_j)$ with $A' = U^* A U$, which is the metric of the symmetric logarithmic derivative. The function $f(t) = (1 + \sqrt{t})^2 / 4$ again satisfies both conditions and yields the Wigner-Yanase metric. The two metrics coincide on tangent directions commuting with $\rho$ and differ on every self-adjoint traceless direction with an off-diagonal entry in the eigenbasis of $\rho$, which is \cref{cor:parametric} in concrete form.
542
\end{example}
543

544
\begin{remark}[Distinguishability]
545
\label{rem:distinguish}
546
A monotone metric measures how fast nearby states separate under measurements, and monotonicity makes the separation decrease under every channel. Choosing a metric amounts to choosing a convention for statistical distance on quantum states, and \cref{thm:petz} shows the choice is a continuous parameter. Any classification or equivalence statement that uses statistical distance on quantum states must carry the parameter of \cref{cor:parametric} or fix it explicitly.
547
\end{remark}
548


2026-10-30T06:30:40.767147Z ERROR codex_core::tools::router: error=collab spawn failed: no thread with id: 01a18b80-80fb-72e2-a0c6-9e58c0c3d6f0
exec
/usr/local/bin/zsh -lc "sed -n '376,392{=;p;}' papers/latex/vol-06-quantum-systems.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
376
\begin{example}[Choi matrix of a qubit channel]
377
\label{ex:choi}
378
For the channel $\Phi_p$ of \cref{ex:depol} the Kraus vectors are the vectorizations of $I_2$ and of the Pauli matrices, which are orthogonal for the Hilbert-Schmidt pairing. The Choi matrix is therefore diagonal in the basis these vectors span, with eigenvalues $2(1 - p)$ and $2p/3$ with multiplicity three. Trace preservation reads $\operatorname{Tr}_m J(\Phi_p) = I_2$ on these eigenvalues, and complete positivity reads $J(\Phi_p) \geq 0$, which holds for $p \in (0,1)$. The eigenvalue list is the input of the minimization statement of \cref{prop:krausrank}.
379
\end{example}
380

381
\begin{theorem}[Choi-Kraus normal form]
382
\label{thm:kraus}
383
Let $\Phi: M_n(\mathbb{C}) \to M_m(\mathbb{C})$ be linear. Then $\Phi$ is completely positive if and only if there are matrices $A_1, \dots, A_r \in M_{m \times n}(\mathbb{C})$ with
384
\[
385
\Phi(X) = \sum_{i=1}^{r} A_i X A_i^* \qquad \text{for all } X \in M_n(\mathbb{C}),
386
\]
387
and one may take $r$ equal to the rank of the Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$. The minimal such $r$ is the Kraus rank of $\Phi$ and equals the rank of $J(\Phi)$.
388
\end{theorem}
389

390
\begin{proof}
391
Write $J(\Phi) \in M_{nm}(\mathbb{C})$ in block form as the $n \times n$ block matrix with blocks $\Phi(E_{ij})$. Complete positivity of $\Phi$ is equivalent to positivity of $J(\Phi)$, and positivity is equivalent to a factorization $J(\Phi) = \sum_{k=1}^{r} v_k v_k^*$ with $r = \operatorname{rank} J(\Phi)$ and vectors $v_k \in \mathbb{C}^n \otimes \mathbb{C}^m$. Fix an orthonormal basis $e_1, \dots, e_n$ of $\mathbb{C}^n$ and decompose each $v_k = \sum_{j=1}^{n} e_j \otimes w_{kj}$ with $w_{kj} \in \mathbb{C}^m$. Let $A_k \in M_{m \times n}(\mathbb{C})$ be the matrix whose $j$-th column is $w_{kj}$. The $(i,j)$ block of $J(\Phi)$ is then $\sum_{k=1}^{r} w_{ki} w_{kj}^* = \sum_{k=1}^{r} A_k E_{ij} A_k^*$, so $\Phi(E_{ij}) = \sum_{k} A_k E_{ij} A_k^*$ for all $i, j$ and by linearity $\Phi(X) = \sum_{k} A_k X A_k^*$ for all $X$. Conversely any such representation writes $J(\Phi)$ as a sum of $s$ rank-one positive terms, so $s \geq \operatorname{rank} J(\Phi)$ and the minimal number of Kraus operators equals $r$.
392
\end{proof}

exec
/usr/local/bin/zsh -lc "python3 -c 'import re; from pathlib import Path; from collections import Counter; s=Path(\"papers/latex/vol-06-quantum-systems.tex\").read_text(); labels=re.findall(r\"\\\\label\\{(["'^}]+)'"\\}\",s); refs=[(s.count(\"\\n\",0,m.start())+1,k.strip()) for m in re.finditer(r\"\\\\(?:[cC]ref|ref|eqref)\\{(["'^}]+)'"\\}\",s) for k in m.group(1).split(\",\")]; print(\"Missing targets:\",[(n,k) for n,k in refs if k not in labels]); print(\"Duplicate labels:\",[k for k,v in Counter(labels).items() if v>1]); print(\"Commands:\",\" \".join(sorted(set(re.findall(r\"\\\\([A-Za-z]+)\",s)))))'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 37ms:
Missing targets: []
Duplicate labels: []
Commands: Bigl Bigr Cref Crefname Delta Phi Psi alpha appendix approx arraybackslash author begin beta bibitem bigcap bigl bigoplus bigr bottomrule cap caption cdots centering circ cong cref crefname date delta dim documentclass dots emph end geq in infty item label lambda langle linespread maketitle mapsto mathbb mathbf mathcal mathfrak mathrm midrule neq newcolumntype newtheorem normalsize operatorname oplus otimes parindent parskip path pi psi qquad raggedright rangle ref rho section setlength sigma small sqrt subsection subseteq sum text textbf texttt textwidth theoremstyle times title to toprule usepackage varphi

codex
Reviewed only `papers/latex/vol-06-quantum-systems.tex`. This was a source review; compilation and actual overfull/underfull box warnings were not verified.

1. **Line 281 — inconsistent factor-type styling.** `Type $I$` uses an italic numeral, whereas the other factor types use upright Roman numerals.  
   **Fix:** change it to `Type $\mathrm{I}$`.

2. **Lines 680, 683, 686, 689, 692, 695, 698, 701, 707, 710, 713, 716, 719, 725, 728, 731, 734 — incorrect page-range typography.** Page ranges use single hyphens.  
   **Fix:** use LaTeX en dashes, e.g. `716--808` and `pp. 21--34`. Preserve hyphens within DOI identifiers.

3. **Lines 132–141, 559–573, 607–618, 655–667 — narrow justified table columns risk uneven spacing and underfull boxes.** These tables use fully justified `X` columns for short phrases, long technical terms, and filenames. This is a layout risk, not a confirmed compiler warning.  
   **Fix:** define a ragged-right variant:
   ```latex
   \newcolumntype{Y}{>{\raggedright\arraybackslash}X}
   ```
   Replace the affected `X` columns with `Y`; give filename columns more width if needed after rendering.

4. **Lines 193 and 600 — inconsistent cross-reference styling.** `Table \ref{...}` bypasses the `cleveref` convention used elsewhere and permits a line break between “Table” and its number.  
   **Fix:** use `\Cref{tab:counts}` and `\Cref{tab:results}`.

No missing reference targets, duplicate labels, or obvious missing command-providing packages were found.

VERDICT: NEEDS_FIX
hook: Stop
hook: Stop Completed
tokens used
44,859
Reviewed only `papers/latex/vol-06-quantum-systems.tex`. This was a source review; compilation and actual overfull/underfull box warnings were not verified.

1. **Line 281 — inconsistent factor-type styling.** `Type $I$` uses an italic numeral, whereas the other factor types use upright Roman numerals.  
   **Fix:** change it to `Type $\mathrm{I}$`.

2. **Lines 680, 683, 686, 689, 692, 695, 698, 701, 707, 710, 713, 716, 719, 725, 728, 731, 734 — incorrect page-range typography.** Page ranges use single hyphens.  
   **Fix:** use LaTeX en dashes, e.g. `716--808` and `pp. 21--34`. Preserve hyphens within DOI identifiers.

3. **Lines 132–141, 559–573, 607–618, 655–667 — narrow justified table columns risk uneven spacing and underfull boxes.** These tables use fully justified `X` columns for short phrases, long technical terms, and filenames. This is a layout risk, not a confirmed compiler warning.  
   **Fix:** define a ragged-right variant:
   ```latex
   \newcolumntype{Y}{>{\raggedright\arraybackslash}X}
   ```
   Replace the affected `X` columns with `Y`; give filename columns more width if needed after rendering.

4. **Lines 193 and 600 — inconsistent cross-reference styling.** `Table \ref{...}` bypasses the `cleveref` convention used elsewhere and permits a line break between “Table” and its number.  
   **Fix:** use `\Cref{tab:counts}` and `\Cref{tab:results}`.

No missing reference targets, duplicate labels, or obvious missing command-providing packages were found.

VERDICT: NEEDS_FIX
