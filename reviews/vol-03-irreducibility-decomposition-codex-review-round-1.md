---
reviewer: codex (OpenAI) gpt-6.1-sol
type: formatting
paper: vol-03-irreducibility-decomposition
round: 1
date: 2026-10-30T05:05:01Z
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
session id: 01a18b32-72b2-7f52-a097-f147ff991f6a
--------
user
Read ONLY the file papers/latex/vol-03-irreducibility-decomposition.tex (do not explore other files or directories). Review it for LaTeX formatting issues: compilation errors, missing packages, broken references, inconsistent styling, overfull/underfull boxes, spacing problems. List all issues with line numbers and concrete fixes. End your response with a VERDICT line — exactly one of: VERDICT: PASS (no issues remain) or VERDICT: NEEDS_FIX (issues listed above must be fixed).
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
/usr/local/bin/zsh -lc 'nl -ba papers/latex/vol-03-irreducibility-decomposition.tex' in /Users/mlong/Documents/Development/classification-physical-systems
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
    17	\usepackage{listings}
    18	\lstset{basicstyle=\ttfamily\footnotesize,breaklines=true,columns=fullflexible,frame=single,framesep=4pt,showstringspaces=false,captionpos=b}
    19	\usepackage[hidelinks]{hyperref}
    20	\usepackage{cleveref}
    21	
    22	\newtheorem{theorem}{Theorem}[section]
    23	\newtheorem{proposition}[theorem]{Proposition}
    24	\newtheorem{lemma}[theorem]{Lemma}
    25	\newtheorem{corollary}[theorem]{Corollary}
    26	\theoremstyle{definition}
    27	\newtheorem{definition}[theorem]{Definition}
    28	\theoremstyle{remark}
    29	\newtheorem{remark}[theorem]{Remark}
    30	\newtheorem{example}[theorem]{Example}
    31	
    32	\title{Irreducibility and Decomposition\\[4pt]
    33	  {\normalsize Part 3 of \emph{The Classification of Mathematical Representations of Physical Systems}}}
    34	\author{Matthew Long\\
    35	  \small The YonedaAI Collaboration, YonedaAI Research Collective\\
    36	  \small Chicago, Illinois, USA\\
    37	  \small \texttt{mlong@yonedalabs.ai}\\
    38	  \small \texttt{https://yonedalabs.ai}}
    39	\date{October 2026}
    40	
    41	\begin{document}
    42	
    43	\maketitle
    44	
    45	\begin{abstract}
    46	Structural classification of physical systems requires a precise account of irreducibility: the objects counted as basic, the constructions that assemble systems from them, and the uniqueness, or absence of uniqueness, of the resulting decomposition. This paper develops that account within a categorical schema of physical systems whose composition data determine what irreducibility means. The central positive result is the complete decomposition theory of unital finite-dimensional complex C*-algebras: every such algebra is a finite direct sum of matrix algebras, the multiset of matrix sizes classifies it up to *-isomorphism, and unital *-homomorphisms between decomposed algebras are classified exactly by multiplicity matrices with explicit arithmetic constraints. The paper then maps the limits of this pattern. Kraus rank is an invariant of the Stinespring normal form and not an isomorphism invariant of channels. Interacting systems admit no unique decomposition outside restricted subclasses. Wild representation categories forbid finite-dimensional parameterization of their indecomposables. Reconstruction theorems recover objects from probes under stated hypotheses, and those hypotheses carry the content. Computational evidence in an executable taxonomy layer and in enumeration experiments is recorded as evidence and never as proof. The results support decomposition theorems only in restricted, tame regimes.
    47	\end{abstract}
    48	
    49	\section{Introduction}
    50	
    51	Classification programs in mathematics succeed where three conditions hold at once: the objects are well defined, the equivalence is fixed, and a finite or parametric invariant separates the objects up to that equivalence. The classification of finite simple groups is the model case, and it is also a warning, because the classification is complete while a clean uniform parameterization of the simple groups remains out of reach~\cite{solomon}. A structural classification of mathematical representations of physical systems would need all three conditions, and the third is where decomposition enters: a classification by constituents presumes that systems decompose into irreducibles, that the decomposition is unique enough to define invariants, and that the constructions assembling systems from irreducibles are understood.
    52	
    53	A physical system is recorded as a tuple $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ of state space, observables, dynamics, symmetry data, and composition rules, and the classification problem is $\mathrm{Classify}(\mathrm{Ob}(\mathrm{Phys})/{\simeq})$ for a chosen equivalence $\simeq$. The present paper develops the machinery that turns candidate structural families into a classification: irreducibility, decomposition, admissible constructions, and closure under those constructions.
    54	
    55	The program's long-term target is the identity $\mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F}_1, \dots, \mathfrak{F}_n \rangle_{\mathcal{C}}$, the statement that every admissible system is assembled from the fundamental families by the admissible constructions. That identity is a research objective and not an assumed result. The results below are narrower and concrete: existence and uniqueness of decomposition in one tame class, and theorem-marked boundaries beyond it.
    56	
    57	Irreducibility depends strictly on the composition operation assigned to a system, and the relativity is visible in concrete examples. Under direct sum, unital finite-dimensional complex C*-algebras decompose uniquely into simple matrix blocks classified completely by their dimension vectors, and their unital *-homomorphisms correspond bijectively to integer multiplicity matrices with explicit arithmetic constraints. This decomposition theory is an isolated tame regime. The Stinespring and Kraus descriptions of completely positive maps yield normal forms rather than isomorphism classifications. Interacting systems admit no unique decomposition outside restricted subclasses. Wild representation categories forbid finite-dimensional parameterization of their indecomposables. The reconstruction pattern, in which an object is recovered from its probes, is developed and separated from classification: commutative C*-algebras are recovered from their spectra, and symmetry data from superselection categories, both under hypotheses that cannot be dropped.
    58	
    59	The technical development concerns the observable-algebra layer of the tuple: the classification theorems below classify algebras and their morphisms, and the state-space layer enters only where decomposition acts on states. Dynamics, symmetry actions, and coupling data are named in the definitions and left untreated here. Every statement about interacting systems is restricted to subclasses, and every result that leans on an unproved premise is marked conditional. A rigorous impossibility theorem is as valuable here as a classification theorem, and both kinds of content appear below.
    60	
    61	\section{Mathematical framework}
    62	
    63	The definitions below fix the notation used throughout. They are stipulative where no theorem is cited: they are vocabulary adopted for this analysis rather than consequences of deeper axioms.
    64	
    65	\begin{definition}[Physical system, composition data]
    66	A physical system is a tuple $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ consisting of a state space $X$, an observable algebra or collection $\mathcal{O}$, dynamical laws $\mathcal{D}$, symmetry and constraint data $\mathcal{S}$, and composition and interaction rules $\mathcal{C}$. The component $\mathcal{C}$ specifies how $P$ composes with other systems: tensor products, coupling terms, interfacing rules.
    67	\end{definition}
    68	
    69	The five components need not be independent, and the tuple is a candidate schema rather than a settled definition of every possible physical system. The choice of $\mathcal{C}$ determines everything that follows.
    70	
    71	\begin{definition}[Irreducibility relative to $\mathcal{C}$]
    72	Fix a composition operation $\ast$ named by $\mathcal{C}$, with its unit object: the zero system for direct sum, the one-dimensional system for tensor product. A system $P$ is \emph{irreducible relative to $\ast$} when $P$ admits no decomposition $P \simeq \ast(P_1, P_2)$ with both $P_1$ and $P_2$ nonisomorphic to the unit. The class of irreducibles for $\ast$ is
    73	\[
    74	\mathfrak{J}_{\ast} = \{ P : P \text{ is irreducible relative to } \ast \}.
    75	\]
    76	\end{definition}
    77	
    78	Irreducibility is therefore never an absolute property of a tuple. It is a property of the pair $(P, \ast)$, and changing the composition operation changes the class of basic objects. Section~\ref{sec:decomp-existence} exhibits a concrete pair of systems on which two natural composition operations return opposite answers.
    79	
    80	\begin{definition}[Decomposition]
    81	A \emph{decomposition} of $P$ is an expression $P \simeq \mathcal{F}(I_1, \dots, I_n)$ with each $I_i$ irreducible relative to the composition operation in force and $\mathcal{F}$ an admissible construction. A decomposition is \emph{unique in a class} when any two decompositions of a system in that class differ by a permutation of isomorphic factors and by the ambient equivalence $\simeq$.
    82	\end{definition}
    83	
    84	\begin{definition}[Admissible constructions]
    85	The admissible constructions $\mathcal{F}$ are the permitted operations assembling systems from simpler ones: tensor product, direct sum, extension (group, algebra, field-theoretic), limits and colimits including the limiting procedures of the morphism layer, factorization of a representation into factors, and quotient or symmetry reduction. Each use of a construction must state the composition data it contributes to $\mathcal{C}$.
    86	\end{definition}
    87	
    88	The list is stipulative, and every uniqueness claim in this paper is uniqueness relative to a named construction. The direct sum and the tensor product behave differently in every respect that follows.
    89	
    90	\begin{definition}[Closure]
    91	Given a collection $\mathfrak{F}$ of families and a set of constructions $\mathcal{C}$, the closure $\langle \mathfrak{F} \rangle_{\mathcal{C}}$ is the smallest class of systems containing $\mathfrak{F}$ and closed under the constructions $\mathcal{C}$.
    92	\end{definition}
    93	
    94	The long-term structural generation statement is the identity $\mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F} \rangle_{\mathcal{C}}$. Its status is conjectural. The proved domains in which generation statements hold are the restricted ones treated below.
    95	
    96	\begin{definition}[Dimension vector]
    97	For a unital finite-dimensional complex C*-algebra presented as a direct sum $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$, the \emph{dimension vector} of $A$ is the multiset $\mathbf{n}(A) = \{n_1, \dots, n_k\}$ of matrix sizes, equivalently the unordered list of the dimensions of the simple $A$-modules.
    98	\end{definition}
    99	
   100	\begin{remark}[Two composition operations on operator-algebra systems]
   101	For systems whose observable algebra is a unital finite-dimensional complex C*-algebra, two composition operations are natural: the direct sum $A \oplus B$ of observable algebras, which models superselection, and the tensor product $A \otimes B$, which models subsystems. The irreducibles of the first operation are the simple blocks $M_n(\mathbb{C})$. The irreducibles of the second are different. The distinction is not cosmetic; it decides what counts as a basic object.
   102	\end{remark}
   103	
   104	\begin{remark}[Equivalence discipline]
   105	Any equivalence $\simeq$ used to identify systems or factors in this paper is a *-isomorphism of observable algebras, unless another relation is named. In concrete terms for the classes at hand: two decomposed algebras are identified exactly when a bijection of their block lists matches matrix sizes blockwise and implements a *-isomorphism. Equivalences that forget algebraic structure are not used to establish classification statements, and no identification of mathematical isomorphism with physical or empirical equivalence is attempted here.
   106	\end{remark}
   107	
   108	\subsection{Classification, parameterization, recognition}
   109	
   110	Three achievements are separated throughout this paper because the classification of finite simple groups separates them in practice. A classification is an exhaustive list of isomorphism types. A parameterization is a uniform finite or algebraic description of those types, in the style of Dynkin diagrams for semisimple Lie algebras. A recognition procedure is an algorithm that identifies a presented object by computing its invariants. The finite simple groups are classified, are not uniformly parameterized in the Dynkin sense~\cite{solomon}, and are recognized in practice by companion data of the kind recorded in group atlases: order, character table, outer automorphism group, presentations. The decomposition theorem of the next section delivers all three achievements at once for its class.
   111	
   112	\section{Decomposition existence}
   113	\label{sec:decomp-existence}
   114	
   115	The central positive result of this paper is the block decomposition of unital finite-dimensional complex C*-algebras. This section proves it in full, because the classification package built on it needs both halves: existence of the decomposition and uniqueness of the invariants.
   116	
   117	\subsection{Semisimplicity and blocks}
   118	
   119	The block decomposition combines two facts from different centuries. Artin-Wedderburn reduces a semisimple Artinian algebra to matrix algebras over division algebras; the C*-structure then forces the division algebras to be $\mathbb{C}$ and the central idempotents to be self-adjoint. The first fact is algebra, the second is analysis, and the block decomposition sits exactly at their join~\cite{murphy}.
   120	
   121	\begin{lemma}[No nilpotent radical]
   122	\label{lem:radical}
   123	Let $A$ be a finite-dimensional C*-algebra over $\mathbb{C}$. The Jacobson radical $J(A)$ is zero.
   124	\end{lemma}
   125	
   126	\begin{proof}
   127	$A$ is finite-dimensional, hence Artinian, and $J(A)$ is a nilpotent ideal. The radical of a C*-algebra is a *-ideal, so it is closed under adjoints, and every $x \in J(A)$ has a Cartesian decomposition $x = a + ib$ with $a = (x + x^*)/2$ and $b = (x - x^*)/(2i)$, both self-adjoint elements of $J(A)$, since $a^* = a$, $b^* = b$, and $a + ib = x$. The radical of an Artinian ring consists of nilpotent elements, and a sum or scalar multiple of nilpotent elements in a nilpotent ideal is nilpotent, so $a$ and $b$ are nilpotent. A self-adjoint nilpotent element of a C*-algebra is zero: by the spectral theorem the spectrum of $a$ is $\{0\}$, and a self-adjoint element equals its spectral integral, so $a = 0$. Thus $a = b = 0$ and $x = 0$.
   128	\end{proof}
   129	
   130	\begin{lemma}[Simple blocks are matrix algebras]
   131	\label{lem:simple-blocks}
   132	Let $B$ be a finite-dimensional simple C*-algebra over $\mathbb{C}$. Then $B \cong M_n(\mathbb{C})$ for some $n \geq 1$.
   133	\end{lemma}
   134	
   135	\begin{proof}
   136	By the Artin-Wedderburn theorem~\cite{murphy} $B \cong M_n(D)$ for a finite-dimensional division algebra $D$ over $\mathbb{C}$. Every element $d \in D$ generates a commutative subalgebra $\mathbb{C}[d]$, which is a finite field extension of $\mathbb{C}$ and therefore equals $\mathbb{C}$, because $\mathbb{C}$ is algebraically closed. Hence $D = \mathbb{C} \cdot 1$ and $B \cong M_n(\mathbb{C})$.
   137	\end{proof}
   138	
   139	\begin{theorem}[Block decomposition]
   140	\label{thm:block-decomposition}
   141	Let $A$ be a unital finite-dimensional complex C*-algebra of dimension $d$. Then there exist $k \geq 1$ and integers $n_1, \dots, n_k \geq 1$ with $\sum_{i=1}^{k} n_i^2 = d$ and a *-isomorphism
   142	\[
   143	A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C}).
   144	\]
   145	The multiset $\mathbf{n}(A) = \{n_1, \dots, n_k\}$ is unique up to permutation, and $k = \dim_{\mathbb{C}} Z(A)$.
   146	\end{theorem}
   147	
   148	\begin{proof}
   149	By \cref{lem:radical} the algebra $A$ is semisimple, so by Artin-Wedderburn $A \cong \bigoplus_{i=1}^{k} M_{n_i}(D_i)$ with $D_i$ finite-dimensional division algebras over $\mathbb{C}$. The decomposition is given by the primitive central idempotents $e_1, \dots, e_k$ of $A$, which are uniquely determined by $A$. Each $e_i$ is self-adjoint: it is central, so $e_i^*$ is also a central idempotent and $e_i$ is normal; a normal idempotent of a C*-algebra has spectrum contained in $\{0, 1\}$ and equals its spectral integral $e_i = 0 \cdot P_0 + 1 \cdot P_1 = P_1$, a projection. Then $A = \bigoplus_i e_i A e_i$ is a direct sum of *-ideals, each simple as an algebra, and \cref{lem:simple-blocks} identifies $e_i A e_i \cong M_{n_i}(\mathbb{C})$ as algebras. It remains to match the involutions: every C*-involution on $M_n(\mathbb{C})$ is unitarily conjugate to the standard conjugate transpose, so composing each block isomorphism with a blockwise unitary adjustment yields a *-isomorphism $A \cong \bigoplus_i M_{n_i}(\mathbb{C})$ with the adjoint taken blockwise. Counting dimensions gives $\sum_i n_i^2 = \dim_{\mathbb{C}} A = d$, and the center is $\bigoplus_i \mathbb{C} e_i$, so $k = \dim_{\mathbb{C}} Z(A)$.
   150	
   151	For uniqueness, the simple left $A$-modules are exactly the modules $\mathbb{C}^{n_i}$ obtained by composing a projection $A \to M_{n_i}(\mathbb{C})$ with the standard module of $M_{n_i}(\mathbb{C})$. Distinct blocks give non-isomorphic simple modules because a simple module kills all but one primitive central idempotent. Hence the multiset of simple module dimensions is $\{n_1, \dots, n_k\}$, and it is an isomorphism invariant. Any *-isomorphism $A \cong A'$ carries simple modules to simple modules, so $\mathbf{n}(A) = \mathbf{n}(A')$ as multisets.
   152	\end{proof}
   153	
   154	\begin{corollary}[Classification of the class]
   155	\label{cor:classification}
   156	Two unital finite-dimensional complex C*-algebras are *-isomorphic if and only if their dimension vectors agree as multisets. The dimension vector is a complete invariant of the class.
   157	\end{corollary}
   158	
   159	The corollary is the strongest classification statement this paper offers for a whole class of systems. It classifies unital finite-dimensional complex C*-algebras up to *-isomorphism of observable algebras. It classifies neither states nor dynamics nor symmetry actions nor composition, and the distinction is essential: an observable algebra is one component of the tuple $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$, and which additional structures are needed to classify physical systems rather than observable algebras remains open.
   160	
   161	\begin{remark}[Unique decomposition in the categorical sense]
   162	\label{rem:krull-schmidt}
   163	\cref{thm:block-decomposition} places the category of unital finite-dimensional complex C*-algebras among the additive categories with the Krull-Schmidt property: every object is a finite direct sum of indecomposable objects, and the decomposition is unique up to permutation and isomorphism of summands. The property is special. Tensor decomposition of objects in the same category does not inherit it: $M_4(\mathbb{C})$ factors as $M_2 \otimes M_2$ and as $M_4 \otimes \mathbb{C}$, and uniqueness statements about tensor factors live in the monoidal structure, not in the additive one.
   164	\end{remark}
   165	
   166	\subsection{Relativity of irreducibility}
   167	
   168	The block decomposition settles irreducibility for the direct sum. The tensor product asks a different question, and the answers differ.
   169	
   170	\begin{example}[One system, two answers]
   171	\label{ex:two-answers}
   172	Consider a two-qubit system with observable algebra $M_4(\mathbb{C})$. Under the direct sum composition, $M_4(\mathbb{C})$ is irreducible: it is simple, it has no nontrivial central idempotent, and its dimension vector is $\{4\}$. Under the tensor product composition, the same algebra factors as $M_2(\mathbb{C}) \otimes M_2(\mathbb{C}) \cong M_4(\mathbb{C})$ with two irreducible tensor factors. The dimension vector of the tensor product is the pairwise product multiset of the factor vectors: the product multiset of $\{2\}$ and $\{2\}$ is $\{4\}$, and the tensor factorization is invisible to the direct-sum invariant. Irreducibility is a property of the pair $(P, \ast)$.
   173	\end{example}
   174	
   175	\begin{example}[Superselection and subsystems]
   176	\label{ex:superselection}
   177	The algebra $M_2(\mathbb{C}) \oplus M_2(\mathbb{C})$ decomposes as a direct sum into two simple blocks, the standard model of two superselection sectors, each carrying a qubit observable algebra. The same algebra is not a tensor product of two matrix algebras of equal size: a tensor decomposition $M_a \otimes M_b \cong M_{ab}$ is simple and has dimension vector $\{ab\}$, while $M_2 \oplus M_2$ has dimension vector $\{2,2\}$ and total dimension $8 = 2^2 + 2^2 \neq 2^3$. Direct-sum decomposition detects superselection, tensor decomposition detects subsystems, and neither detects the other.
   178	\end{example}
   179	
   180	\subsection{States across blocks}
   181	
   182	The decomposition of an observable algebra induces a decomposition of its state space, and the induced decomposition is unique in the same restricted sense.
   183	
   184	\begin{definition}[State]
   185	A state on a unital C*-algebra $A$ is a linear functional $\omega \colon A \to \mathbb{C}$ that is positive and normalized by $\omega(1) = 1$. Write $S(A)$ for the set of states of $A$.
   186	\end{definition}
   187	
   188	\begin{proposition}[States on a direct sum]
   189	\label{prop:states-direct-sum}
   190	Let $A = A_1 \oplus A_2$ with unital summands $A_1, A_2$ and central block projections $p_1, p_2$. Every state $\omega$ of $A$ has a unique expression
   191	\[
   192	\omega = \lambda \, \omega_1 + (1 - \lambda) \, \omega_2
   193	\]
   194	where $\lambda = \omega(p_1) \in [0,1]$, where $\omega_i$ is the restriction of $\omega$ to $A_i$ normalized to a state of $A_i$ when $\omega(p_i) > 0$, and the term is omitted when its weight is zero. Consequently $S(A)$ is the convex join of $S(A_1)$ and $S(A_2)$.
   195	\end{proposition}
   196	
   197	\begin{proof}
   198	Write $a = p_1 a p_1 + p_2 a p_2$ for $a \in A$. Positivity of $\omega$ gives $0 \leq \omega(p_i) \leq 1$ and $\omega(p_1) + \omega(p_2) = 1$. Set $\lambda = \omega(p_1)$; when $\lambda \in (0,1)$ define $\omega_i(a) = \omega(p_i a p_i)/\lambda_i$ with $\lambda_1 = \lambda$ and $\lambda_2 = 1 - \lambda$. Each $\omega_i$ is positive and normalized, and $\omega$ is recovered as the convex combination above. Uniqueness of the weights follows from $\omega(p_1) = \lambda$ and uniqueness of the normalized restrictions follows from the formula. The convex-join description is the standard identification of a convex set built by joining two convex sets along their extreme points.
   199	\end{proof}
   200	
   201	\begin{example}[State space of two superselection sectors]
   202	For $A = M_2(\mathbb{C}) \oplus M_2(\mathbb{C})$, each block state space is a Bloch ball and $S(A)$ is the join of two Bloch balls: a state is a choice of sector weight $\lambda \in [0,1]$ and a Bloch vector in each sector. The direct-sum decomposition of the algebra is exactly the superselection decomposition of the state space, and no information is lost or doubled in passing between the two descriptions.
   203	\end{example}
   204	
   205	\subsection{Existence beyond the finite-dimensional case}
   206	
   207	Two further existence results are recorded because the later sections compare against them. They are background theorems of operator algebra, used here as reference points and not as dependencies of the classification statements above.
   208	
   209	The first is the direct-integral decomposition of von Neumann algebras: every von Neumann algebra is a direct integral of factors over a measure space, and the decomposition is essentially unique up to measure-class isomorphism of the base~\cite{murray-vonneumann}. Existence of a decomposition into indecomposable pieces is therefore available in that setting. The second is the negative theorem that closes the classification story for the indecomposable pieces: there are uncountably many pairwise non-isomorphic separable type $\mathrm{II}_1$ factors~\cite{mcduff}. A global classification of factors is therefore impossible in the stated generality, and any decomposition program that hopes to finish with a parameterized list of indecomposables must restrict its class. Existence of a decomposition and classification of its pieces are different achievements, and the second one fails here.
   210	
   211	\section{Morphisms and multiplicity data}
   212	
   213	A classification of objects is worth little if the morphisms between them are opaque. For decomposed finite-dimensional C*-algebras the morphisms admit an exact combinatorial description, and the description is a second existence-and-uniqueness theorem in a restricted setting.
   214	
   215	\begin{definition}[Multiplicity matrix]
   216	\label{def:multiplicity-matrix}
   217	Let $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ and $B \cong \bigoplus_{j=1}^{\ell} M_{m_j}(\mathbb{C})$. A \emph{multiplicity matrix} from $A$ to $B$ is a matrix $R = (r^{(i)}_j)$ of nonnegative integers with
   218	\[
   219	k^{(i)}_j = n_i \, r^{(i)}_j \qquad \text{and} \qquad \sum_{i=1}^{k} k^{(i)}_j = m_j \quad \text{for each } j.
   220	\]
   221	Write $k(R) = (k^{(i)}_j)$ for the induced rank matrix.
   222	\end{definition}
   223	
   224	\begin{theorem}[Classification of unital *-homomorphisms]
   225	\label{thm:homs}
   226	Let $A$ and $B$ be unital finite-dimensional complex C*-algebras with fixed block presentations as above. Unital *-homomorphisms $\varphi \colon A \to B$, up to unitary conjugacy in $B$, correspond bijectively to multiplicity matrices $R$ from $A$ to $B$. The correspondence sends $\varphi$ to the rank matrix $k^{(i)}_j = \operatorname{rank}(\varphi(p_i) q_j)$, where $p_i$ is the $i$-th block projection of $A$ and $q_j$ the $j$-th block projection of $B$. Two unital *-homomorphisms are unitarily conjugate in $B$ if and only if their multiplicity matrices agree.
   227	\end{theorem}
   228	
   229	\begin{proof}
   230	Let $\varphi \colon A \to B$ be a unital *-homomorphism. Set $e_i = \varphi(p_i)$; these are orthogonal projections of $B$ with $\sum_i e_i = 1$, and each $e_i$ commutes with $Z(B)$, so $e_i = \bigoplus_j e_i^{(j)}$ with $e_i^{(j)} \in M_{m_j}(\mathbb{C})$ a projection. Put $k^{(i)}_j = \operatorname{rank}(e_i^{(j)})$; then $\sum_i k^{(i)}_j = m_j$.
   231	
   232	The restriction $\varphi_i \colon p_i A p_i \to e_i B e_i$ is a unital *-homomorphism from $M_{n_i}(\mathbb{C})$ onto a subalgebra of $\bigoplus_j M_{k^{(i)}_j}(\mathbb{C})$, hence it is a tuple of *-homomorphisms $\psi^{(i)}_j \colon M_{n_i}(\mathbb{C}) \to M_{m_j}(\mathbb{C})$ with $\psi^{(i)}_j(1) = e_i^{(j)}$. A nonzero *-homomorphism out of a simple algebra is injective, and an injective *-homomorphism $M_{n}(\mathbb{C}) \to M_{m}(\mathbb{C})$ with $\psi(1)$ of rank $k$ exists only when $k = n r$ for some $r \geq 0$, in which case $\psi(M_n)$ is unitarily conjugate inside $M_m$ to $M_n \otimes 1_r$ acting on $\mathbb{C}^n \otimes \mathbb{C}^r$. Thus $k^{(i)}_j = n_i r^{(i)}_j$ for a unique $r^{(i)}_j \in \mathbb{N}$.
   233	
   234	Conversely, given a multiplicity matrix $R$, choose for each $j$ a decomposition $\mathbb{C}^{m_j} \cong \bigoplus_i (\mathbb{C}^{n_i} \otimes \mathbb{C}^{r^{(i)}_j})$; the summands have total dimension $\sum_i n_i r^{(i)}_j = m_j$, so the decomposition exists. Define $\varphi$ blockwise by letting $p_i A p_i$ act on the $i$-th summand and as zero elsewhere. This is a unital *-homomorphism with rank matrix $k(R)$.
   235	
   236	Unitary conjugacy preserves ranks of projections, so distinct multiplicity matrices give non-conjugate homomorphisms. Two homomorphisms with the same multiplicity matrix are conjugate: for each $j$ choose a unitary of $M_{m_j}$ carrying the chosen decomposition of $\mathbb{C}^{m_j}$ of the first homomorphism to that of the second; the direct sum of these unitaries conjugates the homomorphisms in $B$.
   237	\end{proof}
   238	
   239	\begin{corollary}[Outer automorphisms]
   240	\label{cor:outer-aut}
   241	Let $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$. Automorphisms of $A$, modulo inner automorphisms, are classified by permutations of the blocks with equal dimension vector entries. Concretely, $\mathrm{Aut}(A)/\mathrm{Inn}(A)$ is isomorphic to the group of permutations $\sigma$ of $\{1, \dots, k\}$ with $n_{\sigma(i)} = n_i$ for all $i$.
   242	\end{corollary}
   243	
   244	\begin{proof}
   245	By \cref{thm:homs} a unital *-endomorphism of $A$ is a multiplicity matrix $R$ with $\sum_i n_i r^{(i)}_j = n_j$ for all $j$. An automorphism is invertible, so the induced map on $K_0$, which sends the $i$-th basis element to $\sum_j r^{(i)}_j$ times the $j$-th, is a permutation matrix; hence $R$ is a permutation matrix $\delta_{j, \sigma(i)}$ with $n_i = n_{\sigma(i)}$. Every such $R$ is realized by the homomorphism permuting equal blocks, and such homomorphisms are outer unless $\sigma$ is the identity and the homomorphism is inner.
   246	\end{proof}
   247	
   248	\begin{example}[Two homomorphisms into $M_3$]
   249	\label{ex:two-homs}
   250	Take $A = \mathbb{C} \oplus M_2(\mathbb{C})$ and $B = M_3(\mathbb{C})$. A multiplicity matrix is a pair $(r^{(1)}, r^{(2)}) \in \mathbb{N}^2$ with $1 \cdot r^{(1)} + 2 \cdot r^{(2)} = 3$. The solutions are $(3, 0)$ and $(1, 1)$. There are exactly two conjugacy classes of unital *-homomorphisms $A \to M_3(\mathbb{C})$: one in which the $M_2$ summand acts as zero, and one in which the scalar summand acts on a one-dimensional summand and the $M_2$ block acts on the remaining $\mathbb{C}^2$. The classification is exact, small, and verifiable by hand.
   251	\end{example}
   252	
   253	\begin{table}[ht]
   254	\centering
   255	\small
   256	\begin{tabularx}{\textwidth}{@{}L{0.18\textwidth}L{0.16\textwidth}L{0.26\textwidth}X@{}}
   257	\toprule
   258	Domain & Codomain & Multiplicity data & Conjugacy classes \\
   259	\midrule
   260	$\mathbb{C} \oplus M_2$ & $M_3$ & $r^{(1)}_1 + 2 r^{(2)}_1 = 3$ & Exactly two, given by $(3,0)$ and $(1,1)$ \\
   261	$M_2$ & $M_2 \oplus M_2$ & $2 r^{(1)}_1 = 2$ and $2 r^{(1)}_2 = 2$ & Exactly one, the diagonal embedding \\
   262	$\mathbb{C} \oplus \mathbb{C}$ & $\mathbb{C} \oplus M_2$ & Column sums $(1, 2)$ of nonnegative integers & Exactly six, two choices in column one and three in column two \\
   263	\bottomrule
   264	\end{tabularx}
   265	\caption{Multiplicity matrices for three small block pairs. Each row of the table is an exact count of conjugacy classes of unital *-homomorphisms.}
   266	\label{tab:homs}
   267	\end{table}
   268	
   269	The theorem and its corollary give a restricted existence-and-uniqueness package for morphisms. The restriction is essential: the classification is of *-homomorphisms of observable algebras up to unitary conjugacy in the codomain. Nothing is claimed about morphisms of states, channels, or dynamics, where the later sections show that the analogous uniqueness statements fail.
   270	
   271	\subsection{Modules and factorization}
   272	
   273	The factorization construction of the admissible list has a complete finite-dimensional form: modules over a decomposed algebra decompose into blocks.
   274	
   275	\begin{proposition}[Module factorization]
   276	\label{prop:module-factorization}
   277	Let $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ and let $M$ be a finite-dimensional left $A$-module. Then $M = \bigoplus_{i=1}^{k} p_i M$ uniquely as $A$-modules, each summand $p_i M$ is a module over the simple block $M_{n_i}(\mathbb{C})$, and $p_i M \cong (\mathbb{C}^{n_i})^{\oplus r_i}$ for a unique multiplicity $r_i \geq 0$. Two modules are isomorphic if and only if their multiplicity vectors agree.
   278	\end{proposition}
   279	
   280	\begin{proof}
   281	The projections $p_i$ are central and orthogonal with $\sum_i p_i = 1$, so $M = \bigoplus_i p_i M$ as vector spaces, and each summand is stable under $A$ because $p_i$ is central. A module over $M_{n_i}(\mathbb{C})$ is semisimple with unique simple module $\mathbb{C}^{n_i}$, so $p_i M \cong (\mathbb{C}^{n_i})^{\oplus r_i}$ with $r_i = \dim p_i M / n_i$ determined by the module. Isomorphism of modules preserves the central idempotent decomposition and the multiplicities, and conversely equal multiplicity vectors give isomorphic modules.
   282	\end{proof}
   283	
   284	The proposition is the representation-theoretic face of \cref{thm:homs}: the multiplicity vector of a module is the column of a multiplicity matrix in the endomorphism case. It also states the uniqueness of factorization in the module category, and the uniqueness is total in this regime: unlike the multipartite state decompositions of the next section, the module decomposition of a semisimple algebra has no nonunique cases.
   285	
   286	\begin{remark}[$K$-theoretic bookkeeping]
   287	\label{rem:k-theory}
   288	The multiplicity vector of a module, the dimension vector of an algebra, and the rank matrix of a homomorphism are three views of the same combinatorics. Formally, the Grothendieck group $K_0(A)$ of a unital finite-dimensional complex C*-algebra is the free abelian group on the $k$ simple classes, $K_0(A) \cong \mathbb{Z}^k$, the tensor product induces the pairwise product of basis indices via $M_{n_i} \otimes M_{m_j} \cong M_{n_i m_j}$, and a unital *-homomorphism acts on $K_0$ by the transpose of its multiplicity matrix: the image of a minimal projection of block $i$ has rank $r^{(i)}_j$ in block $j$. The classification of \cref{thm:homs} is therefore a statement about morphisms of free abelian groups with nonnegativity constraints, which is one reason the result is computable.
   289	\end{remark}
   290	
   291	\section{Uniqueness of decomposition}
   292	
   293	This section collects the positive uniqueness statements available in the finite-dimensional setting and states, at the level the evidence supports, where uniqueness stops.
   294	
   295	\subsection{Where uniqueness holds}
   296	
   297	\begin{proposition}[Uniqueness in the restricted classes]
   298	\label{prop:unique-restricted}
   299	Uniqueness of decomposition up to permutation of isomorphic factors holds in each of the following restricted classes.
   300	\begin{enumerate}
   301	\item Unital finite-dimensional complex C*-algebras under direct sum: \cref{thm:block-decomposition}.
   302	\item Unital *-homomorphisms of such algebras up to unitary conjugacy: \cref{thm:homs}.
   303	\item Tensor factorizations into prime-dimensional factors: if a finite-dimensional Hilbert space is written as a tensor product of factors of prime dimension, the multiset of factor dimensions is unique up to permutation, by unique prime factorization of the total dimension.
   304	\item Bipartite pure states of a finite-dimensional bipartite system, up to the Schmidt decomposition: the Schmidt coefficients are unique, and the left and right Schmidt subspaces are unique as subspaces.
   305	\end{enumerate}
   306	\end{proposition}
   307	
   308	The third and fourth items are the tame corners of quantum theory: a fixed tensor structure with finitely many factors. Factorizations into composite dimensions are not unique, as $\mathbb{C}^2 \otimes \mathbb{C}^6 \cong \mathbb{C}^3 \otimes \mathbb{C}^4$ shows, so the third item restricts to prime dimensions on purpose. The fourth is the strongest state-level uniqueness statement available without further structure, and it fails as soon as the state is multipartite with more than two factors or mixed, as the next subsection records.
   309	
   310	\subsection{Where uniqueness fails}
   311	
   312	\begin{remark}[Multipartite and mixed states]
   313	Tensor decomposition of a multipartite pure state is not unique in general: distinct sets of factor vectors can realize the same state, and the minimal number of product terms is not a complete invariant. For mixed states the situation is worse, as the following proposition records. Any decomposition claim about states must therefore name its class, and the restricted classes of \cref{prop:unique-restricted} are the ones the evidence supports.
   314	\end{remark}
   315	
   316	\begin{proposition}[Ensemble nonuniqueness]
   317	\label{prop:ensemble}
   318	Every mixed density operator $\rho$, that is, every density operator of rank at least two, admits infinitely many distinct decompositions into pure states. Pure states are the only exceptions: a rank-one projector is an extreme point of the state space and admits no nontrivial decomposition.
   319	\end{proposition}
   320	
   321	\begin{proof}
   322	Let $\rho = \sum_{k=1}^{r} \lambda_k |v_k\rangle\langle v_k|$ be the spectral decomposition with $r \geq 2$ and all $\lambda_k > 0$. Every choice of an isometry $U \colon \mathbb{C}^{r} \to \mathbb{C}^{m}$ with $m \geq r$ produces a pure-state ensemble of $\rho$ through the unitary-mixing construction: the unnormalized vectors $|\phi_j\rangle = \sum_{k=1}^{r} U_{jk} \sqrt{\lambda_k} |v_k\rangle$ for $j = 1, \dots, m$ satisfy $\sum_j |\phi_j\rangle\langle\phi_j| = \rho$, because $U^* U = I_r$ rearranges the spectral sum. The corresponding ensemble consists of the normalized pure states $|\phi_j\rangle/\|\phi_j\|$ with probabilities $p_j = \|\phi_j\|^2$. Varying $U$ over the unitary group gives continuously many distinct ensembles, and two ensembles related by no unitary mixing differ as decompositions. In the qubit case $\rho = I/2$ the construction reads $I/2 = \frac{1}{2}(|0\rangle\langle 0| + |1\rangle\langle 1|) = \frac{1}{2}(|+\rangle\langle +| + |-\rangle\langle -|)$, and every orthonormal basis of $\mathbb{C}^2$ gives a new decomposition.
   323	\end{proof}
   324	
   325	The proposition is the state-level counterpart of the normal-form warning: every mixed state has a canonical spectral decomposition, and no decomposition into pure states is unique. Uniqueness returns only in the restricted bipartite case of \cref{prop:unique-restricted}.
   326	
   327	\begin{remark}[Interacting systems]
   328	Interacting physical systems need not admit unique decompositions. Entanglement, emergent phenomena, gauge redundancy, and nontrivial interactions each break naive decomposability: a gauge-invariant state does not split along the subsystem decomposition of the underlying Hilbert space; a coupled system's observable algebra need not be the tensor product of the factor algebras; and emergent degrees of freedom need not appear as factors of any microscopic decomposition. Existence-and-uniqueness theorems are realistic only in carefully restricted subclasses: finite-dimensional quantum systems with fixed tensor structure, finite groupoid models, and selected classes of topological field theories. This paper proves uniqueness in the first of those regimes at the level of observable algebras and morphisms and claims nothing for the others.
   329	\end{remark}
   330	
   331	\begin{remark}[Gauge redundancy]
   332	Under a gauge quotient, the decomposition of a system depends on the choice of subalgebra retained after reduction. Two systems with isomorphic reduced observable algebras can carry non-isomorphic unreduced data, and the reduction map does not preserve tensor decompositions in general. Decomposition after quotient is therefore a different problem from decomposition before quotient, and the admissible construction list marks quotient as a construction whose contribution to $\mathcal{C}$ must be stated case by case.
   333	\end{remark}
   334	
   335	\section{Normal forms and channels}
   336	\label{sec:normal-forms}
   337	
   338	Normal form theorems describe every object of a class in a canonical way without classifying the objects up to isomorphism. The distinction is sharp in the theory of completely positive maps, and this section states the results with the distinction in force.
   339	
   340	\subsection{Stinespring dilation}
   341	
   342	\begin{theorem}[Stinespring]
   343	\label{thm:stinespring}
   344	Let $A$ be a unital C*-algebra, $H$ a Hilbert space, and $\Phi \colon A \to B(H)$ completely positive. Then there exist a Hilbert space $K$, a *-representation $\pi \colon A \to B(K)$, and a bounded operator $V \colon H \to K$ with $\Phi(a) = V^* \pi(a) V$ for all $a \in A$. Among such dilations the minimal one, in which $K = \overline{\pi(A) V H}$, is unique up to a unitary intertwiner.
   345	\end{theorem}
   346	
   347	The construction~\cite{stinespring} is the GNS construction adapted to a completely positive map. On the algebraic tensor product $A \otimes H$ define the semidefinite form
   348	\[
   349	\langle a \otimes \xi, a' \otimes \xi' \rangle_\Phi = \langle \xi, \Phi(a^* a') \xi' \rangle,
   350	\]
   351	quotient by the null space, and complete to obtain $K_0$ with $\pi(a)(b \otimes \xi) = ab \otimes \xi$ and $V \xi = 1 \otimes \xi$. Complete positivity is exactly the condition that makes the form positive semidefinite and $\pi$ multiplicative; for general positive maps the construction breaks at this step. Minimality replaces $K_0$ by the closed span $\overline{\pi(A) V H}$, and any two minimal dilations are intertwined by a unitary, because both realize the same GNS pair up to the universal property of the construction. The theorem is a normal form for completely positive maps: every completely positive map has a canonical representation-theoretic envelope, and the minimal envelope is unique.
   352	
   353	\subsection{Kraus form and its status}
   354	
   355	In finite dimension the dilation theorem has a matrix form.
   356	
   357	\begin{theorem}[Kraus normal form]
   358	\label{thm:kraus}
   359	Every completely positive map $\Phi \colon M_n(\mathbb{C}) \to M_m(\mathbb{C})$ can be written $\Phi(X) = \sum_{s=1}^{r} K_s X K_s^*$ with Kraus operators $K_s \colon \mathbb{C}^n \to \mathbb{C}^m$. The minimal number $r$ of Kraus operators equals the rank of the Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$. Two Kraus families $(K_s)_{s=1}^{r}$ and $(L_t)_{t=1}^{r}$ of minimal size represent the same map if and only if $L_t = \sum_s u_{ts} K_s$ for a unitary $u \in U(r)$.
   360	\end{theorem}
   361	
   362	\begin{proof}
   363	The Choi matrix~\cite{choi,kraus} of a completely positive map is positive semidefinite, and a spectral decomposition $J(\Phi) = \sum_{s=1}^{r} \lambda_s v_s v_s^*$ with $\lambda_s > 0$ yields Kraus operators $K_s = \sqrt{\lambda_s} \, \mathrm{mat}(v_s)$ of minimal count $r = \operatorname{rank}(J(\Phi))$, where vec stacks the columns of a matrix and mat is its inverse; conversely any Kraus family of size $r$ produces $J(\Phi) = \sum_s \mathrm{vec}(K_s) \mathrm{vec}(K_s)^*$ of rank at most $r$. Equality of two maps is equality of their Choi matrices, and two positive semidefinite factorizations $J = \sum_s v_s v_s^* = \sum_t w_t w_t^*$ of the same rank are related by a unitary change of frame $w_t = \sum_s u_{ts} v_s$. Unpacking $\mathrm{vec}$ gives the statement on Kraus operators.
   364	\end{proof}
   365	
   366	Minimal Kraus rank does not separate isomorphism classes of channels. Every unitary channel has minimal Kraus rank one, and distinct unitaries give non-isomorphic channels with fixed-point algebras of different dimensions (\cref{ex:equal-count}). Non-minimal dilations inflate the presented family size without changing the map. Kraus rank therefore classifies minimal dilations of individual maps and nothing more.
   367	
   368	\begin{example}[Equal count, different channels]
   369	\label{ex:equal-count}
   370	Both $\Phi(X) = X$ and $\Psi(X) = Z X Z$ on $M_2(\mathbb{C})$, with $Z$ the Pauli $Z$ operator, have minimal Kraus count one. They are not unitarily equivalent channels: the fixed-point algebra of $\Phi$ is all of $M_2(\mathbb{C})$, of complex dimension four, while the fixed-point algebra of $\Psi$ is the diagonal algebra $\mathbb{C} \oplus \mathbb{C}$, of dimension two, and unitary conjugation preserves the dimension of the fixed-point algebra. The invariant $r = 1$ does not separate the two channels.
   371	\end{example}
   372	
   373	\subsection{Channels as morphisms}
   374	
   375	Channels are the morphisms of the quantum setting: completely positive trace-preserving maps composed in sequence and combined in parallel. The normal form composes poorly. The minimal Kraus count of a composition satisfies $\operatorname{rank}(J(\Psi \circ \Phi)) \leq \operatorname{rank}(J(\Phi)) \cdot \operatorname{rank}(J(\Psi))$ by the factorization of the Choi matrix through the composition, and the inequality is strict in general, so the normal-form invariant does not even add along composition. Parallel composition multiplies counts on the tensor product. No classification of channels up to isomorphism follows from the normal form, and no such classification appears in the literature on open quantum systems. The normal form delivers a canonical minimal realization of each individual map.
   376	
   377	\begin{remark}[Inflation under dilation]
   378	A single channel arises from dilations of every environment dimension above the minimal one: adjoining an ancilla of dimension $a$ to a minimal realization of rank $r$ produces a family of Kraus operators of size $r + a$ describing the same map. The ambient count is therefore not an invariant of the channel at all; only the minimal count is, and the minimal count is an invariant of the normal form.
   379	\end{remark}
   380	
   381	\section{Reconstruction from constituents}
   382	
   383	Classification asks which invariants separate objects. Reconstruction asks which probes determine an object. The two patterns are distinct in status and in content, and reconstruction is the better developed of the two.
   384	
   385	\subsection{Commutative C*-algebras}
   386	
   387	\begin{theorem}[Gelfand-Naimark]
   388	\label{thm:gelfand-naimark}
   389	Every C*-algebra admits a faithful isometric *-representation on a Hilbert space~\cite{gelfand-naimark}. In the commutative case, every unital commutative C*-algebra is isometrically *-isomorphic to $C(X)$ for a compact Hausdorff space $X$ given by its character space, and $X$ is recovered from $A$ as the set of multiplicative linear functionals with the weak-* topology.
   390	\end{theorem}
   391	
   392	The theorem is a representation and reconstruction result. In the commutative case it is also a classification: commutative unital C*-algebras are classified by their spectra. In the noncommutative case it is not a classification, and the block decomposition of \cref{thm:block-decomposition} is what classifies the finite-dimensional noncommutative objects. The contrast is the structural lesson: reconstruction of an object from its probes is a different achievement from a list of isomorphism classes, and the first pattern is the one that generalizes.
   393	
   394	\subsection{Symmetry data from superselection categories}
   395	
   396	The second reconstruction template recovers symmetry data from categorical data.
   397	
   398	\begin{theorem}[Doplicher-Roberts reconstruction]
   399	\label{thm:dr-reconstruction}
   400	Let $\mathcal{C}$ be a symmetric tensor *-category with conjugates, direct sums and subobjects, with $\mathrm{End}(\mathbf{1}) = \mathbb{C}$, satisfying the selection criteria of the DHR analysis of a local net of observable algebras~\cite{dhr}. Then $\mathcal{C}$ is equivalent to the category of finite-dimensional unitary representations of a compact supergroup $G$, and $G$ is unique up to isomorphism~\cite{dr-duality,dr-endomorphisms}.
   401	\end{theorem}
   402	
   403	The hypotheses travel with the theorem and are part of its statement: symmetric structure, conjugates, direct sums, subobjects, $\mathrm{End}(\mathbf{1}) = \mathbb{C}$, and the DHR selection criteria, which in particular involve Haag duality and exclude long-range forces in their standard form. The reconstruction is a decomposition-and-recovery template: the superselection sectors compose into a tensor category, and the symmetry group is read back from the category.
   404	
   405	The uniqueness clause is where hypotheses bite. When the setting is relaxed from the symmetric DHR situation to a braided Galois one, the representation category of the fixed-point theory is not determined by the original category alone, and additional data, expressible as soliton representations, are required~\cite{muger}. The uniqueness in \cref{thm:dr-reconstruction} therefore does not survive hypothesis change, and any use of the theorem outside its stated hypotheses is conditional.
   406	
   407	\begin{remark}[Probes and classification]
   408	\label{rem:yoneda}
   409	The reconstruction pattern is an instance of the general principle that objects can be probed by the morphisms into or out of them. A standing qualification governs any argument of this form: Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem. Faithfulness of a probe functor is a mathematical statement about a category. Whether the probes carry physical content depends on data outside the functor.
   410	\end{remark}
   411	
   412	\section{Admissible constructions and closure}
   413	
   414	The construction list of the framework section becomes computable in the finite-dimensional setting: the effect of each construction on dimension vectors is arithmetic.
   415	
   416	\begin{proposition}[Construction arithmetic]
   417	\label{prop:construction-arithmetic}
   418	Let $A$ and $B$ be unital finite-dimensional complex C*-algebras with dimension vectors $\mathbf{n}(A)$ and $\mathbf{n}(B)$. Then:
   419	\begin{enumerate}
   420	\item $\mathbf{n}(A \oplus B) = \mathbf{n}(A) \uplus \mathbf{n}(B)$, the multiset union.
   421	\item $\mathbf{n}(A \otimes B) = \{ n m : n \in \mathbf{n}(A),\, m \in \mathbf{n}(B) \}$, the pairwise product multiset.
   422	\item $A \oplus B$ is irreducible under direct sum if and only if one summand is zero and the other is simple.
   423	\end{enumerate}
   424	\end{proposition}
   425	
   426	\begin{proof}
   427	Direct sum concatenates block lists and matrix algebras satisfy $M_n(\mathbb{C}) \otimes M_m(\mathbb{C}) \cong M_{nm}(\mathbb{C})$, which gives the two computations. The third clause restates simplicity of the blocks: a direct sum is reducible exactly when both summands are nonzero, and the irreducible objects are the simple algebras $M_n(\mathbb{C})$.
   428	\end{proof}
   429	
   430	\begin{corollary}[Closure of a finite set of blocks]
   431	\label{cor:closure}
   432	Let $S = \{M_{n_1}(\mathbb{C}), \dots, M_{n_k}(\mathbb{C})\}$ and let $\mathcal{C} = \{\oplus, \otimes\}$. The closure $\langle S \rangle_{\mathcal{C}}$ is the class of unital finite-dimensional complex C*-algebras whose dimension vector entries lie in the multiplicative semigroup generated by $n_1, \dots, n_k$ in $\mathbb{N}_{\geq 1}$.
   433	\end{corollary}
   434	
   435	\begin{proof}
   436	By \cref{prop:construction-arithmetic} every element of the closure has dimension vector entries built from the $n_i$ by multiplication, and every finite multiset of such products is realized by taking direct sums of tensor products of generators.
   437	\end{proof}
   438	
   439	\begin{table}[ht]
   440	\centering
   441	\small
   442	\begin{tabularx}{\textwidth}{@{}L{0.2\textwidth}L{0.24\textwidth}X@{}}
   443	\toprule
   444	Construction & Effect on dimension vectors & Composition data it contributes \\
   445	\midrule
   446	Direct sum & Multiset union of the two vectors & Superselection structure of the combined system \\
   447	Tensor product & Pairwise product multiset & Subsystem structure of the combined system \\
   448	Extension & Not determined by dimension vectors alone & Coupling data that must be stated case by case \\
   449	Quotient and symmetry reduction & Not determined by dimension vectors alone & Gauge identification data that must be stated case by case \\
   450	Factorization & Splits a module into block summands & Central projections of the observable algebra \\
   451	\bottomrule
   452	\end{tabularx}
   453	\caption{Effect of the admissible constructions on dimension vectors, with the composition data each construction contributes. The two computable rows are the ones the closure argument uses.}
   454	\label{tab:constructions}
   455	\end{table}
   456	
   457	\begin{example}[Qubit closure]
   458	\label{ex:qubit-closure}
   459	For $S = \{ \mathbb{C}, M_2(\mathbb{C}) \}$ under direct sum and tensor product, the multiplicative semigroup generated by $1$ and $2$ is $\{1, 2, 4, 8, \dots\}$, and the closure is the class of algebras whose dimension vectors have entries that are powers of two. The algebras $M_3(\mathbb{C})$ and $M_2(\mathbb{C}) \oplus M_3(\mathbb{C})$ are outside the closure. The enumeration of \cref{sec:computation} checks this arithmetic.
   460	\end{example}
   461	
   462	The closure of a finite set of blocks under direct sum and tensor product is always infinite as a class, because tensor powers keep producing new sizes, and the closure is always decidable at the level of individual dimension vectors: entry size belongs to a finitely generated multiplicative semigroup of the positive integers, and membership in such a semigroup is decidable. The computability of the closure is a peculiarity of the finite-dimensional regime, where the constructions act on integer vectors; nothing here extends it to closure taken over the full admissible construction list of the framework section.
   463	
   464	\subsection{Worked example: two qubits}
   465	
   466	A single system runs through every construction of this volume and shows what each layer of the machinery returns.
   467	
   468	Observable-algebra decompositions do not extend to the underlying state space of a two-qubit system. Let $P$ have observable algebra $\mathcal{O} = M_4(\mathbb{C})$ and state space the density operators of $\mathbb{C}^4$, with both tensor product and direct sum named as composition operations. Under direct sum, $\mathcal{O}$ is simple with dimension vector $\{4\}$, so the algebraic system is irreducible; the endomorphism multiplicity data of \cref{cor:outer-aut} give a trivial outer automorphism group. Under tensor product, $\mathcal{O} \cong M_2(\mathbb{C}) \otimes M_2(\mathbb{C})$ factors into two qubit blocks of dimension vector $\{2\}$. Restricting to $M_2(\mathbb{C}) \oplus M_2(\mathbb{C})$ inside a superselection model produces two sectors whose state space is the join of two Bloch balls by \cref{prop:states-direct-sum}. At the state level, bipartite pure states of two qubits have unique Schmidt decompositions, while mixed states have no unique decomposition into pure states: the maximally mixed state $I/4$ admits continuously many pure-state ensembles by \cref{prop:ensemble}. The algebraic layer supports a complete existence-and-uniqueness theory for observable algebras and morphisms; the state layer in the mixed regime admits no unique representation into extremal components.
   469	
   470	\begin{remark}[The generation identity]
   471	The structural generation statement of the program, that every admissible system is of the form $\mathcal{F}(I_1, \dots, I_n)$ with $I_i$ irreducible, is proved in the restricted regime of this section: every unital finite-dimensional complex C*-algebra is a direct sum of irreducible blocks, the construction $\mathcal{F}$ is the direct sum, and the irreducibles are the $M_n(\mathbb{C})$. The identity $\mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F} \rangle_{\mathcal{C}}$ for general admissible systems remains conjectural, and nothing in this volume upgrades its status.
   472	\end{remark}
   473	
   474	\section{Decomposition and morphisms}
   475	
   476	The morphism layer of the schema distinguishes coarse-grainings, embeddings, dualities, equivalence morphisms, and limiting procedures. Decomposition interacts with each of them differently, and two of the interactions are exact.
   477	
   478	\begin{proposition}[Embeddings and multiplicity matrices]
   479	\label{prop:embeddings}
   480	In the setting of \cref{thm:homs}, a unital *-homomorphism $\varphi \colon A \to B$ is injective if and only if its multiplicity matrix has no zero row. Injective unital *-homomorphisms are the embeddings of the finite-dimensional C*-category.
   481	\end{proposition}
   482	
   483	\begin{proof}
   484	The restriction of $\varphi$ to the $i$-th block is a *-homomorphism out of the simple algebra $M_{n_i}(\mathbb{C})$ with unit $e_i = \varphi(p_i)$. If the $i$-th row of the multiplicity matrix is zero then $e_i = 0$ and $\varphi$ kills the $i$-th block. If some entry $r^{(i)}_j$ is positive then $e_i \neq 0$ and the homomorphism is injective on the simple block, because the kernel of a *-homomorphism out of a simple algebra is zero or everything.
   485	\end{proof}
   486	
   487	\begin{proposition}[Spectra of direct sums]
   488	\label{prop:spectrum-sum}
   489	Let $A$ and $B$ be unital commutative C*-algebras with spectra $X$ and $Y$. Then $A \oplus B \cong C(X \sqcup Y)$ and the spectrum of a direct sum is the disjoint union of the spectra.
   490	\end{proposition}
   491	
   492	\begin{proof}
   493	Characters of $A \oplus B$ are unital *-homomorphisms to $\mathbb{C}$. The identity splits as $1 = 1_A + 1_B$ with $1_A 1_B = 0$, so $\chi(1_A) = \chi(1_A)^2$ in $\mathbb{C}$ and $\chi(1_A) \in \{0, 1\}$: every character restricts to a character of exactly one summand and vanishes on the other. The character space is therefore the disjoint union of the character spaces of the summands, and the Gelfand isomorphism $A \oplus B \cong C(X \sqcup Y)$ follows.
   494	\end{proof}
   495	
   496	Coarse-grainings behave in the opposite way. A coarse-graining can merge blocks and forget the decomposition: the map $M_2(\mathbb{C}) \oplus M_2(\mathbb{C}) \to M_2(\mathbb{C})$ sending $(x,y)$ to $(x+y)/2$ is positive and unital, and it destroys the superselection decomposition of its domain. Irreducibility is not preserved by coarse-graining, and a decomposition statement about coarse-grained systems must be justified for the target system, not inherited from the source.
   497	
   498	Limiting procedures are the least controlled interaction. Direct sums of finite-dimensional blocks pass to direct integrals of factors in infinite-volume or continuum limits, and the block structure of the approximating algebras need not survive the limit. The decomposition theorems of this volume are finite-dimensional statements; their behavior under the limiting procedures named in the construction list is a separate problem, and nothing here claims continuity of decomposition under limit.
   499	
   500	Dualities commute with decomposition in the commutative case by \cref{prop:spectrum-sum}, and Doplicher-Roberts reconstruction (\cref{thm:dr-reconstruction}) recovers symmetry data from decomposed sector categories. Equivalence morphisms preserve decomposition when they are *-isomorphisms of observable algebras, and only for those is the dimension vector invariant.
   501	
   502	\section{Decomposition across the families}
   503	
   504	The block decomposition is one row of a larger chart. The table below records the established position, for each domain in which a decomposition question is live, on the three questions this paper keeps separate: existence of a decomposition, uniqueness of the decomposition, and parameterization of the pieces. The sources are the same that supply the theorems cited in the preceding sections.
   505	
   506	\begin{table}[ht]
   507	\centering
   508	\small
   509	\begin{tabularx}{\textwidth}{@{}L{0.2\textwidth}L{0.22\textwidth}L{0.2\textwidth}X@{}}
   510	\toprule
   511	Domain & Existence & Uniqueness & Parameterization of the pieces \\
   512	\midrule
   513	Finite-dimensional C*-algebras & Direct sum into matrix blocks & Dimension vector unique up to permutation & Dimension vector is complete \\
   514	Commutative C*-algebras & Spectrum of characters & Spectrum is unique & The spectrum itself \\
   515	Von Neumann algebras & Direct integral into factors & Essentially unique up to measure class & No parameterization of the factors in general \\
   516	Completely positive maps & Stinespring dilation and Kraus form & Minimal dilation unique up to unitary & Kraus rank is a normal-form invariant only \\
   517	Bipartite pure states & Schmidt decomposition & Coefficients unique & Schmidt coefficients \\
   518	Interacting systems & No general theorem & Fails in general & Not available \\
   519	Wild representation categories & Indecomposable decompositions may exist & Not controlled & Finite-dimensional parameterization is impossible \\
   520	\bottomrule
   521	\end{tabularx}
   522	\caption{Decomposition status by domain. The first and fifth rows are the complete cases, the fourth row is a normal form and not a classification, and the last two rows record where the pattern stops.}
   523	\label{tab:domains}
   524	\end{table}
   525	
   526	The comparison makes the volume's shape visible. The complete rows are exactly the rows with a finite or parametric invariant, and every one of them is a restricted class: semisimple finite-dimensional algebras, commutative algebras, bipartite pure states. The normal-form row is the trap this volume documents at length: a canonical description that does not classify. The last two rows are theorems, not disappointments: nonunique decomposition for interacting systems and the impossibility of finite-dimensional parameterization in wild regimes are proved statements about the boundary of decomposition programs.
   527	
   528	The von Neumann row deserves one sentence of its own. Decomposition into factors exists, and the pieces resist classification: uncountably many pairwise non-isomorphic separable type $\mathrm{II}_1$ factors sit in a single type class~\cite{mcduff}. Any program that decomposes systems and then classifies the indecomposables therefore needs its own restriction hypothesis, and the restriction is not a technical convenience.
   529	
   530	\section{Wildness and the parameterization boundary}
   531	
   532	The finite-dimensional decomposition theorem classifies its objects by a finite invariant. The expectation that similar parameterizations exist beyond tame regimes is false, and the falsity is a theorem.
   533	
   534	\begin{theorem}[Tame-wild dichotomy]
   535	\label{thm:tame-wild}
   536	Every finite-dimensional algebra over an algebraically closed field is either derived tame or derived wild~\cite{bekkert-drozd}. Derived wildness is preserved under degeneration, and derived tameness is preserved under deformation.
   537	\end{theorem}
   538	
   539	\begin{theorem}[Wildness of the generic determinant]
   540	\label{thm:wild-generic-det}
   541	The maximal Cohen-Macaulay module theory of the generic determinant is wild~\cite{buchweitz-leuschke}: already in rank two, the isomorphism classes of modules cannot be parametrized by a finite-dimensional variety over the coefficients.
   542	\end{theorem}
   543	
   544	The phrase used for this phenomenon in the literature is that the representation theory is quite wild: the wildness is not merely an absence of known invariants, it is the proven absence of finite-dimensional parameterization. The technique behind the dichotomy is the theory of matrix problems, in which representations are reduced by an algorithm to normal forms for boxes and arrows; derived tameness means the reduction terminates with a one-parameter-family description of indecomposables, and derived wildness means the reduction embeds an arbitrary matrix problem, after which no finite-dimensional parameterization can exist. A parallel obstruction in equivariant stable homotopy~\cite{grevstad-may} shows that no meaningful classification of compact $C_p$-equivariant $H\underline{\mathbb{F}}_p$-modules at odd primes is to be expected, so the boundary is not confined to representation theory of algebras.
   545	
   546	\begin{corollary}[Boundary on decomposition programs]
   547	\label{cor:boundary}
   548	Any program that decomposes systems into irreducibles and then parametrizes the irreducibles by finite-dimensional data is confined to tame regimes. In wild regimes the decomposition step may still exist while the parameterization step is provably unavailable.
   549	\end{corollary}
   550	
   551	The corollary is the volume's impossibility content. It does not contradict \cref{thm:block-decomposition}, which lives in the tamest possible regime: finite-dimensional algebras over $\mathbb{C}$ with semisimple radical-free structure. It marks the edge of the pattern. The tame-wild distinction also appears algorithmically: group isomorphism for extensions with tame quotient admits polynomial-time algorithms whose bounds fail in the wild case~\cite{grochow-qiao}, so the boundary is visible to computation as well as to parameterization.
   552	
   553	For the structural generation program the consequence is precise. A generation theorem of the form $P \simeq \mathcal{F}(I_1, \dots, I_n)$ is achievable where the irreducibles $I_i$ come from a tame class with finite or parametric invariants. Where the irreducibles are wild, the generation step may still succeed while the classification of the generators fails, and the long-term target $\mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F} \rangle_{\mathcal{C}}$ inherits the restriction. The candidate subclasses for existence-and-uniqueness theorems, finite-dimensional quantum systems, finite groupoid models, and selected classes of topological field theories, are all tame in this sense, and the tameness of each candidate must be made explicit wherever the candidate is used.
   554	
   555	\section{Counterexamples and boundary cases}
   556	
   557	Three natural strengthenings of the results above fail, and the failures locate their hypotheses.
   558	
   559	\subsection{Uniqueness without parameterization}
   560	
   561	A tempting inference runs: decomposition is unique, therefore the irreducibles can be parametrized. The inference is false in general. Finite-dimensional algebras over an algebraically closed field satisfy the Krull-Schmidt theorem, so every such algebra decomposes uniquely into indecomposable summands up to permutation, and \cref{thm:wild-generic-det} shows that in wild regimes the indecomposables still admit no finite-dimensional parameterization. Unique decomposition and parameterization of the pieces are different achievements; the finite-dimensional C*-case of \cref{thm:block-decomposition} has both only because its indecomposables are the matrix algebras $M_n(\mathbb{C})$, indexed by a single integer.
   562	
   563	\subsection{The C*-hypothesis}
   564	
   565	Drop the C*-structure and \cref{thm:block-decomposition} fails at the first step. The dual numbers $\mathbb{C}[x]/(x^2)$ form a two-dimensional algebra with Jacobson radical the span of $x$, which is nonzero; the algebra is indecomposable and not simple. \cref{lem:radical} used positivity through the spectral theorem, and without positivity nothing forces the radical to vanish. Boundary case: the class of unital finite-dimensional complex C*-algebras is exactly the class where the block decomposition with matrix blocks holds; widening to finite-dimensional algebras requires the semisimplicity hypothesis, and widening to infinite-dimensional C*-algebras replaces direct sums by the direct-integral machinery of the contrast theorem.
   566	
   567	\subsection{Normal-form invariants}
   568	
   569	A second tempting inference runs: every map has a canonical normal form with an invariant, therefore the maps are classified. \cref{ex:equal-count} refutes it: two channels with minimal Kraus count one differ on a single matrix, and the invariant cannot see the difference. The general lesson is that an invariant of a normal form is not an isomorphism invariant of the classified objects. The decomposition theorems of this volume avoid the trap because their invariants are complete: the dimension vector decides isomorphism of algebras (\cref{cor:classification}), and the multiplicity matrix decides conjugacy of homomorphisms (\cref{thm:homs}). Completeness is the property the normal forms lack.
   570	
   571	\subsection{Interacting systems}
   572	
   573	The counterexample search found no interacting system outside the restricted subclasses with a uniqueness theorem, and none is claimed here. The failure modes named earlier, entanglement, gauge redundancy, emergence, and coupling, are open problems rather than refuted conjectures: no theorem states that interacting systems admit unique decompositions, and existence-and-uniqueness theorems are realistic only in restricted subclasses. Any analysis that needs uniqueness for an interacting system must restrict the class and prove the restriction suffices.
   574	
   575	\section{Computational evidence}
   576	\label{sec:computation}
   577	
   578	Three computational artifacts accompany this paper. They are evidence about the combinatorics of the theorems above; no statement in this volume is established by them.
   579	
   580	The first artifact is an executable taxonomy layer in Haskell. Its module declares instances of the shared family, invariant, construction, and decomposition classes for the physical systems treated here: matrix blocks and their direct sums, tensor products of blocks, multiplicity matrices of *-homomorphisms, and Kraus normal form data. The names mirror the definitions of this paper and the mechanization targets listed in the accompanying verification record. The Haskell layer is computational evidence, validated against kernel-checked specifications through cross-audit, and it is not verified by any proof assistant.
   581	
   582	The second artifact is a set of enumeration experiments in Python. One experiment enumerates dimension vectors of the closure of $\{\mathbb{C}, M_2(\mathbb{C})\}$ under direct sum and tensor product up to total dimension $64$ and checks the arithmetic of \cref{prop:construction-arithmetic}. It returns $1085$ dimension vectors, all of whose entries lie in the multiplicative semigroup $\{1, 2, 4, 8, 16, 32, 64\}$ generated by $1$ and $2$, and it confirms that $M_3(\mathbb{C})$ lies outside the closure. A second experiment enumerates multiplicity matrices for the three block pairs of \cref{tab:homs} and returns exactly $2$, $1$, and $6$ solutions, matching the conjugacy-class counts of the table entry by entry. A third computes Choi ranks of completely positive maps: for a random map of minimal rank $1$, presented Kraus families of sizes $1$, $2$, $3$, $5$, and $8$ all return Choi rank $1$ and reproduce the same map, while the identity channel and conjugation by the Pauli $Z$ operator both have rank $1$ and differ on the Pauli $X$ operator. The experiments run in seconds on ordinary hardware and record their seeds in the source.
   583	
   584	The third artifact is a code evidence table, given in the appendix, that maps each computational claim to the file and function that exhibits it.
   585	
   586	\section{Limitations}
   587	
   588	The classification package of this volume has four sharp limits.
   589	
   590	Uniqueness is a restricted phenomenon. The existence-and-uniqueness statements hold for unital finite-dimensional complex C*-algebras and their *-homomorphisms, and for the tame corners of tensor decomposition named in \cref{prop:unique-restricted}. For interacting systems only restricted-subclass realism is available: unique decomposition is not assumed anywhere in this paper.
   591	
   592	Normal forms are not classifications. The Stinespring and Kraus results describe maps canonically; they do not classify channels up to isomorphism, and no such classification is on record.
   593	
   594	The wildness results of \cref{thm:wild-generic-det} confine finite-dimensional parameterization to tame regimes, and the tame-wild boundary for the representation categories of physical interest, as opposed to generic algebras, is unstudied.
   595	
   596	The structural generation identity is conjectural, the admissibility conditions that would define $\mathrm{Phys}_{\mathrm{adm}}$ are unfixed, and no result here depends on either. Doplicher-Roberts reconstruction is available only under hypotheses that include symmetric structure and the DHR selection criteria; relaxing them destroys the uniqueness clause.
   597	
   598	No part of the mathematical content of this volume is machine-checked.
   599	
   600	Two premises are unfixed, and no theorem above depends on them. The admissibility conditions defining $\mathrm{Phys}_{\mathrm{adm}}$ do not exist yet, so every statement quantified over admissible systems is conditional. The equivalence $\simeq$ for physical systems is open as well; this volume uses *-isomorphism of observable algebras and claims nothing about coarser identifications. Probe-based arguments carry a standing qualification, that Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem; no reconstruction result here is read as a classification result.
   601	
   602	\section{Conclusion}
   603	
   604	Irreducibility is relative to the composition data of a system, and the relativity is visible in concrete examples: one algebra is irreducible for the direct sum and reducible for the tensor product. Within the tamest regime, unital finite-dimensional complex C*-algebras, the decomposition theory is complete: blocks exist, the dimension vector classifies, and unital *-homomorphisms are classified by multiplicity matrices with explicit arithmetic constraints. That package is exactly as large as advertised: it classifies observable algebras and their morphisms, not states, dynamics, or composition.
   605	
   606	Beyond the tame regime the pattern breaks in three directions, each with a theorem behind it. Normal forms do not classify: Kraus rank is an invariant of the normal form and not an isomorphism invariant of channels. Interacting systems admit no unique decomposition outside restricted subclasses. Wild representation categories forbid finite-dimensional parameterization of their indecomposables. A program that assembles systems from fundamental families by admissible constructions must therefore state its regime, and the regime that admits existence-and-uniqueness theorems is restricted, tame, and finite.
   607	
   608	Reconstruction from probes generalizes better than classification by invariants: commutative C*-algebras are recovered from their spectra, and symmetry data are recovered from superselection categories under hypotheses that cannot be dropped. Whether the probe pattern can be unified with the reconstruction theorems into a single principle is open. What is established now is a division of labor: classification where the invariant is finite or parametric, reconstruction where probes suffice, and impossibility theorems where neither holds.
   609	
   610	\appendix
   611	\section{Code evidence}
   612	
   613	The table maps each computational claim of \cref{sec:computation} to the file and function that exhibits it. Every row names code under \texttt{src/vol-03-irreducibility-decomposition/}, which accompanies this paper in the project source tree.
   614	
   615	\begin{table}[ht]
   616	\centering
   617	\footnotesize
   618	\begin{tabularx}{\textwidth}{@{}L{0.2\textwidth}L{0.18\textwidth}L{0.16\textwidth}X@{}}
   619	\toprule
   620	Claim & File & Function & What the code shows \\
   621	\midrule
   622	Dimension vector arithmetic under direct sum and tensor product & \path{exp\_closure.py} & \path{closure\_enumeration} & Enumerated closures match pairwise product and multiset union \\
   623	Multiplicity matrices classify homomorphism conjugacy classes & \path{exp\_multiplicity.py} & \path{enumerate\_multiplicity} & Small block pairs return exactly the integer solutions of the rank constraints \\
   624	Kraus rank is fixed by the map and inflated by non-minimal dilation & \path{exp\_kraus.py} & \path{choi\_rank\_dilation} & Choi rank of a map stays constant while dilated copies of it rank higher \\
   625	Taxonomy instances cover the volume systems & \path{Instances.hs} & \path{dimVector} and \path{decomposeBlocks} & Instances implement decomposition and irreducibility hooks for blocks \\
   626	Constructible instances compute the two constructions & \path{Instances.hs} & \path{tensorProduct} and \path{directSum} & Construction hooks agree with the arithmetic of the paper \\
   627	\bottomrule
   628	\end{tabularx}
   629	\caption{Code evidence for the computational claims of this volume. Each row is judged against the named file and function.}
   630	\label{tab:code-evidence}
   631	\end{table}
   632	
   633	\begin{thebibliography}{20}
   634	
   635	\bibitem{bekkert-drozd}
   636	V.~I. Bekkert and Y.~A. Drozd,
   637	\emph{Tame-wild dichotomy for derived categories},
   638	arXiv:math/0310352 (2003), doi:10.48550/arXiv.math/0310352.
   639	
   640	\bibitem{buchweitz-leuschke}
   641	R.-O. Buchweitz and G.~J. Leuschke,
   642	\emph{Factoring the adjoint and maximal Cohen-Macaulay modules over the generic determinant},
   643	arXiv:math/0505315 (2005), doi:10.48550/arXiv.math/0505315; American Journal of Mathematics \textbf{129} (2007), 943-981, doi:10.1353/ajm.2007.0022.
   644	
   645	\bibitem{choi}
   646	M.-D. Choi,
   647	\emph{Completely positive linear maps on complex matrices},
   648	Linear Algebra and its Applications \textbf{10} (1975), 285-290, doi:10.1016/0024-3795(75)90075-0.
   649	
   650	\bibitem{dhr}
   651	S. Doplicher, R. Haag, and J.~E. Roberts,
   652	\emph{Local observables and particle statistics. I},
   653	Communications in Mathematical Physics \textbf{23} (1971), 199-230, doi:10.1007/BF01877742.
   654	
   655	\bibitem{dr-duality}
   656	S. Doplicher and J.~E. Roberts,
   657	\emph{A new duality theory for compact groups},
   658	Inventiones Mathematicae \textbf{98} (1989), 157-218, doi:10.1007/BF01388849.
   659	
   660	\bibitem{dr-endomorphisms}
   661	S. Doplicher and J.~E. Roberts,
   662	\emph{Endomorphisms of C*-algebras, cross products and duality for compact groups},
   663	Annals of Mathematics \textbf{130} (1989), 75-119, doi:10.2307/1971477.
   664	
   665	\bibitem{gelfand-naimark}
   666	I. Gelfand and M. Naimark,
   667	\emph{On the imbedding of normed rings into the ring of operators in Hilbert space},
   668	Matematicheskii Sbornik \textbf{12} (1943), 197-213, English translation doi:10.1090/conm/167/16.
   669	
   670	\bibitem{grevstad-may}
   671	J.~F. Grevstad and C. May,
   672	\emph{Equivariant $H\underline{\mathbb{F}}_p$-modules are wild},
   673	arXiv:2509.17604 (2025), doi:10.48550/arXiv.2509.17604.
   674	
   675	\bibitem{grochow-qiao}
   676	J.~A. Grochow and Y. Qiao,
   677	\emph{Polynomial-time isomorphism test of groups that are tame extensions},
   678	arXiv:1507.01917 (2015), doi:10.48550/arXiv.1507.01917.
   679	
   680	\bibitem{kraus}
   681	K. Kraus,
   682	\emph{General state changes in quantum theory},
   683	Annals of Physics \textbf{64} (1971), 311-335, doi:10.1016/0003-4916(71)90108-4.
   684	
   685	\bibitem{mcduff}
   686	D. McDuff,
   687	\emph{Uncountably many $\mathrm{II}_1$ factors},
   688	Annals of Mathematics \textbf{90} (1969), 372-377, doi:10.2307/1970730.
   689	
   690	\bibitem{muger}
   691	M. M\"uger,
   692	\emph{Conformal field theory and Doplicher-Roberts reconstruction},
   693	arXiv:math-ph/0008027 (2000), doi:10.48550/arXiv.math-ph/0008027; Fields Institute Communications \textbf{30} (2001), 297-319.
   694	
   695	\bibitem{murray-vonneumann}
   696	F.~J. Murray and J. von Neumann,
   697	\emph{On rings of operators. IV},
   698	Annals of Mathematics \textbf{44} (1943), 716-808, doi:10.2307/1969107.
   699	
   700	\bibitem{murphy}
   701	G.~J. Murphy,
   702	\emph{C*-Algebras and Operator Theory},
   703	Academic Press, Boston (1990), ISBN 0-12-511360-9.
   704	
   705	\bibitem{solomon}
   706	R. Solomon,
   707	\emph{A brief history of the classification of the finite simple groups},
   708	Bulletin of the American Mathematical Society \textbf{38} (2001), 315-352, doi:10.1090/S0273-0979-01-00909-0.
   709	
   710	\bibitem{stinespring}
   711	W.~F. Stinespring,
   712	\emph{Positive functions on C*-algebras},
   713	Proceedings of the American Mathematical Society \textbf{6} (1955), 211-216, doi:10.1090/S0002-9939-1955-0069403-4.
   714	
   715	\end{thebibliography}
   716	
   717	\end{document}

exec
/usr/local/bin/zsh -lc "sed -n '160,360p' papers/latex/vol-03-irreducibility-decomposition.tex | nl -ba -v 160" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   160	
   161	\begin{remark}[Unique decomposition in the categorical sense]
   162	\label{rem:krull-schmidt}
   163	\cref{thm:block-decomposition} places the category of unital finite-dimensional complex C*-algebras among the additive categories with the Krull-Schmidt property: every object is a finite direct sum of indecomposable objects, and the decomposition is unique up to permutation and isomorphism of summands. The property is special. Tensor decomposition of objects in the same category does not inherit it: $M_4(\mathbb{C})$ factors as $M_2 \otimes M_2$ and as $M_4 \otimes \mathbb{C}$, and uniqueness statements about tensor factors live in the monoidal structure, not in the additive one.
   164	\end{remark}
   165	
   166	\subsection{Relativity of irreducibility}
   167	
   168	The block decomposition settles irreducibility for the direct sum. The tensor product asks a different question, and the answers differ.
   169	
   170	\begin{example}[One system, two answers]
   171	\label{ex:two-answers}
   172	Consider a two-qubit system with observable algebra $M_4(\mathbb{C})$. Under the direct sum composition, $M_4(\mathbb{C})$ is irreducible: it is simple, it has no nontrivial central idempotent, and its dimension vector is $\{4\}$. Under the tensor product composition, the same algebra factors as $M_2(\mathbb{C}) \otimes M_2(\mathbb{C}) \cong M_4(\mathbb{C})$ with two irreducible tensor factors. The dimension vector of the tensor product is the pairwise product multiset of the factor vectors: the product multiset of $\{2\}$ and $\{2\}$ is $\{4\}$, and the tensor factorization is invisible to the direct-sum invariant. Irreducibility is a property of the pair $(P, \ast)$.
   173	\end{example}
   174	
   175	\begin{example}[Superselection and subsystems]
   176	\label{ex:superselection}
   177	The algebra $M_2(\mathbb{C}) \oplus M_2(\mathbb{C})$ decomposes as a direct sum into two simple blocks, the standard model of two superselection sectors, each carrying a qubit observable algebra. The same algebra is not a tensor product of two matrix algebras of equal size: a tensor decomposition $M_a \otimes M_b \cong M_{ab}$ is simple and has dimension vector $\{ab\}$, while $M_2 \oplus M_2$ has dimension vector $\{2,2\}$ and total dimension $8 = 2^2 + 2^2 \neq 2^3$. Direct-sum decomposition detects superselection, tensor decomposition detects subsystems, and neither detects the other.
   178	\end{example}
   179	
   180	\subsection{States across blocks}
   181	
   182	The decomposition of an observable algebra induces a decomposition of its state space, and the induced decomposition is unique in the same restricted sense.
   183	
   184	\begin{definition}[State]
   185	A state on a unital C*-algebra $A$ is a linear functional $\omega \colon A \to \mathbb{C}$ that is positive and normalized by $\omega(1) = 1$. Write $S(A)$ for the set of states of $A$.
   186	\end{definition}
   187	
   188	\begin{proposition}[States on a direct sum]
   189	\label{prop:states-direct-sum}
   190	Let $A = A_1 \oplus A_2$ with unital summands $A_1, A_2$ and central block projections $p_1, p_2$. Every state $\omega$ of $A$ has a unique expression
   191	\[
   192	\omega = \lambda \, \omega_1 + (1 - \lambda) \, \omega_2
   193	\]
   194	where $\lambda = \omega(p_1) \in [0,1]$, where $\omega_i$ is the restriction of $\omega$ to $A_i$ normalized to a state of $A_i$ when $\omega(p_i) > 0$, and the term is omitted when its weight is zero. Consequently $S(A)$ is the convex join of $S(A_1)$ and $S(A_2)$.
   195	\end{proposition}
   196	
   197	\begin{proof}
   198	Write $a = p_1 a p_1 + p_2 a p_2$ for $a \in A$. Positivity of $\omega$ gives $0 \leq \omega(p_i) \leq 1$ and $\omega(p_1) + \omega(p_2) = 1$. Set $\lambda = \omega(p_1)$; when $\lambda \in (0,1)$ define $\omega_i(a) = \omega(p_i a p_i)/\lambda_i$ with $\lambda_1 = \lambda$ and $\lambda_2 = 1 - \lambda$. Each $\omega_i$ is positive and normalized, and $\omega$ is recovered as the convex combination above. Uniqueness of the weights follows from $\omega(p_1) = \lambda$ and uniqueness of the normalized restrictions follows from the formula. The convex-join description is the standard identification of a convex set built by joining two convex sets along their extreme points.
   199	\end{proof}
   200	
   201	\begin{example}[State space of two superselection sectors]
   202	For $A = M_2(\mathbb{C}) \oplus M_2(\mathbb{C})$, each block state space is a Bloch ball and $S(A)$ is the join of two Bloch balls: a state is a choice of sector weight $\lambda \in [0,1]$ and a Bloch vector in each sector. The direct-sum decomposition of the algebra is exactly the superselection decomposition of the state space, and no information is lost or doubled in passing between the two descriptions.
   203	\end{example}
   204	
   205	\subsection{Existence beyond the finite-dimensional case}
   206	
   207	Two further existence results are recorded because the later sections compare against them. They are background theorems of operator algebra, used here as reference points and not as dependencies of the classification statements above.
   208	
   209	The first is the direct-integral decomposition of von Neumann algebras: every von Neumann algebra is a direct integral of factors over a measure space, and the decomposition is essentially unique up to measure-class isomorphism of the base~\cite{murray-vonneumann}. Existence of a decomposition into indecomposable pieces is therefore available in that setting. The second is the negative theorem that closes the classification story for the indecomposable pieces: there are uncountably many pairwise non-isomorphic separable type $\mathrm{II}_1$ factors~\cite{mcduff}. A global classification of factors is therefore impossible in the stated generality, and any decomposition program that hopes to finish with a parameterized list of indecomposables must restrict its class. Existence of a decomposition and classification of its pieces are different achievements, and the second one fails here.
   210	
   211	\section{Morphisms and multiplicity data}
   212	
   213	A classification of objects is worth little if the morphisms between them are opaque. For decomposed finite-dimensional C*-algebras the morphisms admit an exact combinatorial description, and the description is a second existence-and-uniqueness theorem in a restricted setting.
   214	
   215	\begin{definition}[Multiplicity matrix]
   216	\label{def:multiplicity-matrix}
   217	Let $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ and $B \cong \bigoplus_{j=1}^{\ell} M_{m_j}(\mathbb{C})$. A \emph{multiplicity matrix} from $A$ to $B$ is a matrix $R = (r^{(i)}_j)$ of nonnegative integers with
   218	\[
   219	k^{(i)}_j = n_i \, r^{(i)}_j \qquad \text{and} \qquad \sum_{i=1}^{k} k^{(i)}_j = m_j \quad \text{for each } j.
   220	\]
   221	Write $k(R) = (k^{(i)}_j)$ for the induced rank matrix.
   222	\end{definition}
   223	
   224	\begin{theorem}[Classification of unital *-homomorphisms]
   225	\label{thm:homs}
   226	Let $A$ and $B$ be unital finite-dimensional complex C*-algebras with fixed block presentations as above. Unital *-homomorphisms $\varphi \colon A \to B$, up to unitary conjugacy in $B$, correspond bijectively to multiplicity matrices $R$ from $A$ to $B$. The correspondence sends $\varphi$ to the rank matrix $k^{(i)}_j = \operatorname{rank}(\varphi(p_i) q_j)$, where $p_i$ is the $i$-th block projection of $A$ and $q_j$ the $j$-th block projection of $B$. Two unital *-homomorphisms are unitarily conjugate in $B$ if and only if their multiplicity matrices agree.
   227	\end{theorem}
   228	
   229	\begin{proof}
   230	Let $\varphi \colon A \to B$ be a unital *-homomorphism. Set $e_i = \varphi(p_i)$; these are orthogonal projections of $B$ with $\sum_i e_i = 1$, and each $e_i$ commutes with $Z(B)$, so $e_i = \bigoplus_j e_i^{(j)}$ with $e_i^{(j)} \in M_{m_j}(\mathbb{C})$ a projection. Put $k^{(i)}_j = \operatorname{rank}(e_i^{(j)})$; then $\sum_i k^{(i)}_j = m_j$.
   231	
   232	The restriction $\varphi_i \colon p_i A p_i \to e_i B e_i$ is a unital *-homomorphism from $M_{n_i}(\mathbb{C})$ onto a subalgebra of $\bigoplus_j M_{k^{(i)}_j}(\mathbb{C})$, hence it is a tuple of *-homomorphisms $\psi^{(i)}_j \colon M_{n_i}(\mathbb{C}) \to M_{m_j}(\mathbb{C})$ with $\psi^{(i)}_j(1) = e_i^{(j)}$. A nonzero *-homomorphism out of a simple algebra is injective, and an injective *-homomorphism $M_{n}(\mathbb{C}) \to M_{m}(\mathbb{C})$ with $\psi(1)$ of rank $k$ exists only when $k = n r$ for some $r \geq 0$, in which case $\psi(M_n)$ is unitarily conjugate inside $M_m$ to $M_n \otimes 1_r$ acting on $\mathbb{C}^n \otimes \mathbb{C}^r$. Thus $k^{(i)}_j = n_i r^{(i)}_j$ for a unique $r^{(i)}_j \in \mathbb{N}$.
   233	
   234	Conversely, given a multiplicity matrix $R$, choose for each $j$ a decomposition $\mathbb{C}^{m_j} \cong \bigoplus_i (\mathbb{C}^{n_i} \otimes \mathbb{C}^{r^{(i)}_j})$; the summands have total dimension $\sum_i n_i r^{(i)}_j = m_j$, so the decomposition exists. Define $\varphi$ blockwise by letting $p_i A p_i$ act on the $i$-th summand and as zero elsewhere. This is a unital *-homomorphism with rank matrix $k(R)$.
   235	
   236	Unitary conjugacy preserves ranks of projections, so distinct multiplicity matrices give non-conjugate homomorphisms. Two homomorphisms with the same multiplicity matrix are conjugate: for each $j$ choose a unitary of $M_{m_j}$ carrying the chosen decomposition of $\mathbb{C}^{m_j}$ of the first homomorphism to that of the second; the direct sum of these unitaries conjugates the homomorphisms in $B$.
   237	\end{proof}
   238	
   239	\begin{corollary}[Outer automorphisms]
   240	\label{cor:outer-aut}
   241	Let $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$. Automorphisms of $A$, modulo inner automorphisms, are classified by permutations of the blocks with equal dimension vector entries. Concretely, $\mathrm{Aut}(A)/\mathrm{Inn}(A)$ is isomorphic to the group of permutations $\sigma$ of $\{1, \dots, k\}$ with $n_{\sigma(i)} = n_i$ for all $i$.
   242	\end{corollary}
   243	
   244	\begin{proof}
   245	By \cref{thm:homs} a unital *-endomorphism of $A$ is a multiplicity matrix $R$ with $\sum_i n_i r^{(i)}_j = n_j$ for all $j$. An automorphism is invertible, so the induced map on $K_0$, which sends the $i$-th basis element to $\sum_j r^{(i)}_j$ times the $j$-th, is a permutation matrix; hence $R$ is a permutation matrix $\delta_{j, \sigma(i)}$ with $n_i = n_{\sigma(i)}$. Every such $R$ is realized by the homomorphism permuting equal blocks, and such homomorphisms are outer unless $\sigma$ is the identity and the homomorphism is inner.
   246	\end{proof}
   247	
   248	\begin{example}[Two homomorphisms into $M_3$]
   249	\label{ex:two-homs}
   250	Take $A = \mathbb{C} \oplus M_2(\mathbb{C})$ and $B = M_3(\mathbb{C})$. A multiplicity matrix is a pair $(r^{(1)}, r^{(2)}) \in \mathbb{N}^2$ with $1 \cdot r^{(1)} + 2 \cdot r^{(2)} = 3$. The solutions are $(3, 0)$ and $(1, 1)$. There are exactly two conjugacy classes of unital *-homomorphisms $A \to M_3(\mathbb{C})$: one in which the $M_2$ summand acts as zero, and one in which the scalar summand acts on a one-dimensional summand and the $M_2$ block acts on the remaining $\mathbb{C}^2$. The classification is exact, small, and verifiable by hand.
   251	\end{example}
   252	
   253	\begin{table}[ht]
   254	\centering
   255	\small
   256	\begin{tabularx}{\textwidth}{@{}L{0.18\textwidth}L{0.16\textwidth}L{0.26\textwidth}X@{}}
   257	\toprule
   258	Domain & Codomain & Multiplicity data & Conjugacy classes \\
   259	\midrule
   260	$\mathbb{C} \oplus M_2$ & $M_3$ & $r^{(1)}_1 + 2 r^{(2)}_1 = 3$ & Exactly two, given by $(3,0)$ and $(1,1)$ \\
   261	$M_2$ & $M_2 \oplus M_2$ & $2 r^{(1)}_1 = 2$ and $2 r^{(1)}_2 = 2$ & Exactly one, the diagonal embedding \\
   262	$\mathbb{C} \oplus \mathbb{C}$ & $\mathbb{C} \oplus M_2$ & Column sums $(1, 2)$ of nonnegative integers & Exactly six, two choices in column one and three in column two \\
   263	\bottomrule
   264	\end{tabularx}
   265	\caption{Multiplicity matrices for three small block pairs. Each row of the table is an exact count of conjugacy classes of unital *-homomorphisms.}
   266	\label{tab:homs}
   267	\end{table}
   268	
   269	The theorem and its corollary give a restricted existence-and-uniqueness package for morphisms. The restriction is essential: the classification is of *-homomorphisms of observable algebras up to unitary conjugacy in the codomain. Nothing is claimed about morphisms of states, channels, or dynamics, where the later sections show that the analogous uniqueness statements fail.
   270	
   271	\subsection{Modules and factorization}
   272	
   273	The factorization construction of the admissible list has a complete finite-dimensional form: modules over a decomposed algebra decompose into blocks.
   274	
   275	\begin{proposition}[Module factorization]
   276	\label{prop:module-factorization}
   277	Let $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ and let $M$ be a finite-dimensional left $A$-module. Then $M = \bigoplus_{i=1}^{k} p_i M$ uniquely as $A$-modules, each summand $p_i M$ is a module over the simple block $M_{n_i}(\mathbb{C})$, and $p_i M \cong (\mathbb{C}^{n_i})^{\oplus r_i}$ for a unique multiplicity $r_i \geq 0$. Two modules are isomorphic if and only if their multiplicity vectors agree.
   278	\end{proposition}
   279	
   280	\begin{proof}
   281	The projections $p_i$ are central and orthogonal with $\sum_i p_i = 1$, so $M = \bigoplus_i p_i M$ as vector spaces, and each summand is stable under $A$ because $p_i$ is central. A module over $M_{n_i}(\mathbb{C})$ is semisimple with unique simple module $\mathbb{C}^{n_i}$, so $p_i M \cong (\mathbb{C}^{n_i})^{\oplus r_i}$ with $r_i = \dim p_i M / n_i$ determined by the module. Isomorphism of modules preserves the central idempotent decomposition and the multiplicities, and conversely equal multiplicity vectors give isomorphic modules.
   282	\end{proof}
   283	
   284	The proposition is the representation-theoretic face of \cref{thm:homs}: the multiplicity vector of a module is the column of a multiplicity matrix in the endomorphism case. It also states the uniqueness of factorization in the module category, and the uniqueness is total in this regime: unlike the multipartite state decompositions of the next section, the module decomposition of a semisimple algebra has no nonunique cases.
   285	
   286	\begin{remark}[$K$-theoretic bookkeeping]
   287	\label{rem:k-theory}
   288	The multiplicity vector of a module, the dimension vector of an algebra, and the rank matrix of a homomorphism are three views of the same combinatorics. Formally, the Grothendieck group $K_0(A)$ of a unital finite-dimensional complex C*-algebra is the free abelian group on the $k$ simple classes, $K_0(A) \cong \mathbb{Z}^k$, the tensor product induces the pairwise product of basis indices via $M_{n_i} \otimes M_{m_j} \cong M_{n_i m_j}$, and a unital *-homomorphism acts on $K_0$ by the transpose of its multiplicity matrix: the image of a minimal projection of block $i$ has rank $r^{(i)}_j$ in block $j$. The classification of \cref{thm:homs} is therefore a statement about morphisms of free abelian groups with nonnegativity constraints, which is one reason the result is computable.
   289	\end{remark}
   290	
   291	\section{Uniqueness of decomposition}
   292	
   293	This section collects the positive uniqueness statements available in the finite-dimensional setting and states, at the level the evidence supports, where uniqueness stops.
   294	
   295	\subsection{Where uniqueness holds}
   296	
   297	\begin{proposition}[Uniqueness in the restricted classes]
   298	\label{prop:unique-restricted}
   299	Uniqueness of decomposition up to permutation of isomorphic factors holds in each of the following restricted classes.
   300	\begin{enumerate}
   301	\item Unital finite-dimensional complex C*-algebras under direct sum: \cref{thm:block-decomposition}.
   302	\item Unital *-homomorphisms of such algebras up to unitary conjugacy: \cref{thm:homs}.
   303	\item Tensor factorizations into prime-dimensional factors: if a finite-dimensional Hilbert space is written as a tensor product of factors of prime dimension, the multiset of factor dimensions is unique up to permutation, by unique prime factorization of the total dimension.
   304	\item Bipartite pure states of a finite-dimensional bipartite system, up to the Schmidt decomposition: the Schmidt coefficients are unique, and the left and right Schmidt subspaces are unique as subspaces.
   305	\end{enumerate}
   306	\end{proposition}
   307	
   308	The third and fourth items are the tame corners of quantum theory: a fixed tensor structure with finitely many factors. Factorizations into composite dimensions are not unique, as $\mathbb{C}^2 \otimes \mathbb{C}^6 \cong \mathbb{C}^3 \otimes \mathbb{C}^4$ shows, so the third item restricts to prime dimensions on purpose. The fourth is the strongest state-level uniqueness statement available without further structure, and it fails as soon as the state is multipartite with more than two factors or mixed, as the next subsection records.
   309	
   310	\subsection{Where uniqueness fails}
   311	
   312	\begin{remark}[Multipartite and mixed states]
   313	Tensor decomposition of a multipartite pure state is not unique in general: distinct sets of factor vectors can realize the same state, and the minimal number of product terms is not a complete invariant. For mixed states the situation is worse, as the following proposition records. Any decomposition claim about states must therefore name its class, and the restricted classes of \cref{prop:unique-restricted} are the ones the evidence supports.
   314	\end{remark}
   315	
   316	\begin{proposition}[Ensemble nonuniqueness]
   317	\label{prop:ensemble}
   318	Every mixed density operator $\rho$, that is, every density operator of rank at least two, admits infinitely many distinct decompositions into pure states. Pure states are the only exceptions: a rank-one projector is an extreme point of the state space and admits no nontrivial decomposition.
   319	\end{proposition}
   320	
   321	\begin{proof}
   322	Let $\rho = \sum_{k=1}^{r} \lambda_k |v_k\rangle\langle v_k|$ be the spectral decomposition with $r \geq 2$ and all $\lambda_k > 0$. Every choice of an isometry $U \colon \mathbb{C}^{r} \to \mathbb{C}^{m}$ with $m \geq r$ produces a pure-state ensemble of $\rho$ through the unitary-mixing construction: the unnormalized vectors $|\phi_j\rangle = \sum_{k=1}^{r} U_{jk} \sqrt{\lambda_k} |v_k\rangle$ for $j = 1, \dots, m$ satisfy $\sum_j |\phi_j\rangle\langle\phi_j| = \rho$, because $U^* U = I_r$ rearranges the spectral sum. The corresponding ensemble consists of the normalized pure states $|\phi_j\rangle/\|\phi_j\|$ with probabilities $p_j = \|\phi_j\|^2$. Varying $U$ over the unitary group gives continuously many distinct ensembles, and two ensembles related by no unitary mixing differ as decompositions. In the qubit case $\rho = I/2$ the construction reads $I/2 = \frac{1}{2}(|0\rangle\langle 0| + |1\rangle\langle 1|) = \frac{1}{2}(|+\rangle\langle +| + |-\rangle\langle -|)$, and every orthonormal basis of $\mathbb{C}^2$ gives a new decomposition.
   323	\end{proof}
   324	
   325	The proposition is the state-level counterpart of the normal-form warning: every mixed state has a canonical spectral decomposition, and no decomposition into pure states is unique. Uniqueness returns only in the restricted bipartite case of \cref{prop:unique-restricted}.
   326	
   327	\begin{remark}[Interacting systems]
   328	Interacting physical systems need not admit unique decompositions. Entanglement, emergent phenomena, gauge redundancy, and nontrivial interactions each break naive decomposability: a gauge-invariant state does not split along the subsystem decomposition of the underlying Hilbert space; a coupled system's observable algebra need not be the tensor product of the factor algebras; and emergent degrees of freedom need not appear as factors of any microscopic decomposition. Existence-and-uniqueness theorems are realistic only in carefully restricted subclasses: finite-dimensional quantum systems with fixed tensor structure, finite groupoid models, and selected classes of topological field theories. This paper proves uniqueness in the first of those regimes at the level of observable algebras and morphisms and claims nothing for the others.
   329	\end{remark}
   330	
   331	\begin{remark}[Gauge redundancy]
   332	Under a gauge quotient, the decomposition of a system depends on the choice of subalgebra retained after reduction. Two systems with isomorphic reduced observable algebras can carry non-isomorphic unreduced data, and the reduction map does not preserve tensor decompositions in general. Decomposition after quotient is therefore a different problem from decomposition before quotient, and the admissible construction list marks quotient as a construction whose contribution to $\mathcal{C}$ must be stated case by case.
   333	\end{remark}
   334	
   335	\section{Normal forms and channels}
   336	\label{sec:normal-forms}
   337	
   338	Normal form theorems describe every object of a class in a canonical way without classifying the objects up to isomorphism. The distinction is sharp in the theory of completely positive maps, and this section states the results with the distinction in force.
   339	
   340	\subsection{Stinespring dilation}
   341	
   342	\begin{theorem}[Stinespring]
   343	\label{thm:stinespring}
   344	Let $A$ be a unital C*-algebra, $H$ a Hilbert space, and $\Phi \colon A \to B(H)$ completely positive. Then there exist a Hilbert space $K$, a *-representation $\pi \colon A \to B(K)$, and a bounded operator $V \colon H \to K$ with $\Phi(a) = V^* \pi(a) V$ for all $a \in A$. Among such dilations the minimal one, in which $K = \overline{\pi(A) V H}$, is unique up to a unitary intertwiner.
   345	\end{theorem}
   346	
   347	The construction~\cite{stinespring} is the GNS construction adapted to a completely positive map. On the algebraic tensor product $A \otimes H$ define the semidefinite form
   348	\[
   349	\langle a \otimes \xi, a' \otimes \xi' \rangle_\Phi = \langle \xi, \Phi(a^* a') \xi' \rangle,
   350	\]
   351	quotient by the null space, and complete to obtain $K_0$ with $\pi(a)(b \otimes \xi) = ab \otimes \xi$ and $V \xi = 1 \otimes \xi$. Complete positivity is exactly the condition that makes the form positive semidefinite and $\pi$ multiplicative; for general positive maps the construction breaks at this step. Minimality replaces $K_0$ by the closed span $\overline{\pi(A) V H}$, and any two minimal dilations are intertwined by a unitary, because both realize the same GNS pair up to the universal property of the construction. The theorem is a normal form for completely positive maps: every completely positive map has a canonical representation-theoretic envelope, and the minimal envelope is unique.
   352	
   353	\subsection{Kraus form and its status}
   354	
   355	In finite dimension the dilation theorem has a matrix form.
   356	
   357	\begin{theorem}[Kraus normal form]
   358	\label{thm:kraus}
   359	Every completely positive map $\Phi \colon M_n(\mathbb{C}) \to M_m(\mathbb{C})$ can be written $\Phi(X) = \sum_{s=1}^{r} K_s X K_s^*$ with Kraus operators $K_s \colon \mathbb{C}^n \to \mathbb{C}^m$. The minimal number $r$ of Kraus operators equals the rank of the Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$. Two Kraus families $(K_s)_{s=1}^{r}$ and $(L_t)_{t=1}^{r}$ of minimal size represent the same map if and only if $L_t = \sum_s u_{ts} K_s$ for a unitary $u \in U(r)$.
   360	\end{theorem}

exec
/usr/local/bin/zsh -lc "sed -n '361,530p' papers/latex/vol-03-irreducibility-decomposition.tex | nl -ba -v 361" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   361	
   362	\begin{proof}
   363	The Choi matrix~\cite{choi,kraus} of a completely positive map is positive semidefinite, and a spectral decomposition $J(\Phi) = \sum_{s=1}^{r} \lambda_s v_s v_s^*$ with $\lambda_s > 0$ yields Kraus operators $K_s = \sqrt{\lambda_s} \, \mathrm{mat}(v_s)$ of minimal count $r = \operatorname{rank}(J(\Phi))$, where vec stacks the columns of a matrix and mat is its inverse; conversely any Kraus family of size $r$ produces $J(\Phi) = \sum_s \mathrm{vec}(K_s) \mathrm{vec}(K_s)^*$ of rank at most $r$. Equality of two maps is equality of their Choi matrices, and two positive semidefinite factorizations $J = \sum_s v_s v_s^* = \sum_t w_t w_t^*$ of the same rank are related by a unitary change of frame $w_t = \sum_s u_{ts} v_s$. Unpacking $\mathrm{vec}$ gives the statement on Kraus operators.
   364	\end{proof}
   365	
   366	Minimal Kraus rank does not separate isomorphism classes of channels. Every unitary channel has minimal Kraus rank one, and distinct unitaries give non-isomorphic channels with fixed-point algebras of different dimensions (\cref{ex:equal-count}). Non-minimal dilations inflate the presented family size without changing the map. Kraus rank therefore classifies minimal dilations of individual maps and nothing more.
   367	
   368	\begin{example}[Equal count, different channels]
   369	\label{ex:equal-count}
   370	Both $\Phi(X) = X$ and $\Psi(X) = Z X Z$ on $M_2(\mathbb{C})$, with $Z$ the Pauli $Z$ operator, have minimal Kraus count one. They are not unitarily equivalent channels: the fixed-point algebra of $\Phi$ is all of $M_2(\mathbb{C})$, of complex dimension four, while the fixed-point algebra of $\Psi$ is the diagonal algebra $\mathbb{C} \oplus \mathbb{C}$, of dimension two, and unitary conjugation preserves the dimension of the fixed-point algebra. The invariant $r = 1$ does not separate the two channels.
   371	\end{example}
   372	
   373	\subsection{Channels as morphisms}
   374	
   375	Channels are the morphisms of the quantum setting: completely positive trace-preserving maps composed in sequence and combined in parallel. The normal form composes poorly. The minimal Kraus count of a composition satisfies $\operatorname{rank}(J(\Psi \circ \Phi)) \leq \operatorname{rank}(J(\Phi)) \cdot \operatorname{rank}(J(\Psi))$ by the factorization of the Choi matrix through the composition, and the inequality is strict in general, so the normal-form invariant does not even add along composition. Parallel composition multiplies counts on the tensor product. No classification of channels up to isomorphism follows from the normal form, and no such classification appears in the literature on open quantum systems. The normal form delivers a canonical minimal realization of each individual map.
   376	
   377	\begin{remark}[Inflation under dilation]
   378	A single channel arises from dilations of every environment dimension above the minimal one: adjoining an ancilla of dimension $a$ to a minimal realization of rank $r$ produces a family of Kraus operators of size $r + a$ describing the same map. The ambient count is therefore not an invariant of the channel at all; only the minimal count is, and the minimal count is an invariant of the normal form.
   379	\end{remark}
   380	
   381	\section{Reconstruction from constituents}
   382	
   383	Classification asks which invariants separate objects. Reconstruction asks which probes determine an object. The two patterns are distinct in status and in content, and reconstruction is the better developed of the two.
   384	
   385	\subsection{Commutative C*-algebras}
   386	
   387	\begin{theorem}[Gelfand-Naimark]
   388	\label{thm:gelfand-naimark}
   389	Every C*-algebra admits a faithful isometric *-representation on a Hilbert space~\cite{gelfand-naimark}. In the commutative case, every unital commutative C*-algebra is isometrically *-isomorphic to $C(X)$ for a compact Hausdorff space $X$ given by its character space, and $X$ is recovered from $A$ as the set of multiplicative linear functionals with the weak-* topology.
   390	\end{theorem}
   391	
   392	The theorem is a representation and reconstruction result. In the commutative case it is also a classification: commutative unital C*-algebras are classified by their spectra. In the noncommutative case it is not a classification, and the block decomposition of \cref{thm:block-decomposition} is what classifies the finite-dimensional noncommutative objects. The contrast is the structural lesson: reconstruction of an object from its probes is a different achievement from a list of isomorphism classes, and the first pattern is the one that generalizes.
   393	
   394	\subsection{Symmetry data from superselection categories}
   395	
   396	The second reconstruction template recovers symmetry data from categorical data.
   397	
   398	\begin{theorem}[Doplicher-Roberts reconstruction]
   399	\label{thm:dr-reconstruction}
   400	Let $\mathcal{C}$ be a symmetric tensor *-category with conjugates, direct sums and subobjects, with $\mathrm{End}(\mathbf{1}) = \mathbb{C}$, satisfying the selection criteria of the DHR analysis of a local net of observable algebras~\cite{dhr}. Then $\mathcal{C}$ is equivalent to the category of finite-dimensional unitary representations of a compact supergroup $G$, and $G$ is unique up to isomorphism~\cite{dr-duality,dr-endomorphisms}.
   401	\end{theorem}
   402	
   403	The hypotheses travel with the theorem and are part of its statement: symmetric structure, conjugates, direct sums, subobjects, $\mathrm{End}(\mathbf{1}) = \mathbb{C}$, and the DHR selection criteria, which in particular involve Haag duality and exclude long-range forces in their standard form. The reconstruction is a decomposition-and-recovery template: the superselection sectors compose into a tensor category, and the symmetry group is read back from the category.
   404	
   405	The uniqueness clause is where hypotheses bite. When the setting is relaxed from the symmetric DHR situation to a braided Galois one, the representation category of the fixed-point theory is not determined by the original category alone, and additional data, expressible as soliton representations, are required~\cite{muger}. The uniqueness in \cref{thm:dr-reconstruction} therefore does not survive hypothesis change, and any use of the theorem outside its stated hypotheses is conditional.
   406	
   407	\begin{remark}[Probes and classification]
   408	\label{rem:yoneda}
   409	The reconstruction pattern is an instance of the general principle that objects can be probed by the morphisms into or out of them. A standing qualification governs any argument of this form: Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem. Faithfulness of a probe functor is a mathematical statement about a category. Whether the probes carry physical content depends on data outside the functor.
   410	\end{remark}
   411	
   412	\section{Admissible constructions and closure}
   413	
   414	The construction list of the framework section becomes computable in the finite-dimensional setting: the effect of each construction on dimension vectors is arithmetic.
   415	
   416	\begin{proposition}[Construction arithmetic]
   417	\label{prop:construction-arithmetic}
   418	Let $A$ and $B$ be unital finite-dimensional complex C*-algebras with dimension vectors $\mathbf{n}(A)$ and $\mathbf{n}(B)$. Then:
   419	\begin{enumerate}
   420	\item $\mathbf{n}(A \oplus B) = \mathbf{n}(A) \uplus \mathbf{n}(B)$, the multiset union.
   421	\item $\mathbf{n}(A \otimes B) = \{ n m : n \in \mathbf{n}(A),\, m \in \mathbf{n}(B) \}$, the pairwise product multiset.
   422	\item $A \oplus B$ is irreducible under direct sum if and only if one summand is zero and the other is simple.
   423	\end{enumerate}
   424	\end{proposition}
   425	
   426	\begin{proof}
   427	Direct sum concatenates block lists and matrix algebras satisfy $M_n(\mathbb{C}) \otimes M_m(\mathbb{C}) \cong M_{nm}(\mathbb{C})$, which gives the two computations. The third clause restates simplicity of the blocks: a direct sum is reducible exactly when both summands are nonzero, and the irreducible objects are the simple algebras $M_n(\mathbb{C})$.
   428	\end{proof}
   429	
   430	\begin{corollary}[Closure of a finite set of blocks]
   431	\label{cor:closure}
   432	Let $S = \{M_{n_1}(\mathbb{C}), \dots, M_{n_k}(\mathbb{C})\}$ and let $\mathcal{C} = \{\oplus, \otimes\}$. The closure $\langle S \rangle_{\mathcal{C}}$ is the class of unital finite-dimensional complex C*-algebras whose dimension vector entries lie in the multiplicative semigroup generated by $n_1, \dots, n_k$ in $\mathbb{N}_{\geq 1}$.
   433	\end{corollary}
   434	
   435	\begin{proof}
   436	By \cref{prop:construction-arithmetic} every element of the closure has dimension vector entries built from the $n_i$ by multiplication, and every finite multiset of such products is realized by taking direct sums of tensor products of generators.
   437	\end{proof}
   438	
   439	\begin{table}[ht]
   440	\centering
   441	\small
   442	\begin{tabularx}{\textwidth}{@{}L{0.2\textwidth}L{0.24\textwidth}X@{}}
   443	\toprule
   444	Construction & Effect on dimension vectors & Composition data it contributes \\
   445	\midrule
   446	Direct sum & Multiset union of the two vectors & Superselection structure of the combined system \\
   447	Tensor product & Pairwise product multiset & Subsystem structure of the combined system \\
   448	Extension & Not determined by dimension vectors alone & Coupling data that must be stated case by case \\
   449	Quotient and symmetry reduction & Not determined by dimension vectors alone & Gauge identification data that must be stated case by case \\
   450	Factorization & Splits a module into block summands & Central projections of the observable algebra \\
   451	\bottomrule
   452	\end{tabularx}
   453	\caption{Effect of the admissible constructions on dimension vectors, with the composition data each construction contributes. The two computable rows are the ones the closure argument uses.}
   454	\label{tab:constructions}
   455	\end{table}
   456	
   457	\begin{example}[Qubit closure]
   458	\label{ex:qubit-closure}
   459	For $S = \{ \mathbb{C}, M_2(\mathbb{C}) \}$ under direct sum and tensor product, the multiplicative semigroup generated by $1$ and $2$ is $\{1, 2, 4, 8, \dots\}$, and the closure is the class of algebras whose dimension vectors have entries that are powers of two. The algebras $M_3(\mathbb{C})$ and $M_2(\mathbb{C}) \oplus M_3(\mathbb{C})$ are outside the closure. The enumeration of \cref{sec:computation} checks this arithmetic.
   460	\end{example}
   461	
   462	The closure of a finite set of blocks under direct sum and tensor product is always infinite as a class, because tensor powers keep producing new sizes, and the closure is always decidable at the level of individual dimension vectors: entry size belongs to a finitely generated multiplicative semigroup of the positive integers, and membership in such a semigroup is decidable. The computability of the closure is a peculiarity of the finite-dimensional regime, where the constructions act on integer vectors; nothing here extends it to closure taken over the full admissible construction list of the framework section.
   463	
   464	\subsection{Worked example: two qubits}
   465	
   466	A single system runs through every construction of this volume and shows what each layer of the machinery returns.
   467	
   468	Observable-algebra decompositions do not extend to the underlying state space of a two-qubit system. Let $P$ have observable algebra $\mathcal{O} = M_4(\mathbb{C})$ and state space the density operators of $\mathbb{C}^4$, with both tensor product and direct sum named as composition operations. Under direct sum, $\mathcal{O}$ is simple with dimension vector $\{4\}$, so the algebraic system is irreducible; the endomorphism multiplicity data of \cref{cor:outer-aut} give a trivial outer automorphism group. Under tensor product, $\mathcal{O} \cong M_2(\mathbb{C}) \otimes M_2(\mathbb{C})$ factors into two qubit blocks of dimension vector $\{2\}$. Restricting to $M_2(\mathbb{C}) \oplus M_2(\mathbb{C})$ inside a superselection model produces two sectors whose state space is the join of two Bloch balls by \cref{prop:states-direct-sum}. At the state level, bipartite pure states of two qubits have unique Schmidt decompositions, while mixed states have no unique decomposition into pure states: the maximally mixed state $I/4$ admits continuously many pure-state ensembles by \cref{prop:ensemble}. The algebraic layer supports a complete existence-and-uniqueness theory for observable algebras and morphisms; the state layer in the mixed regime admits no unique representation into extremal components.
   469	
   470	\begin{remark}[The generation identity]
   471	The structural generation statement of the program, that every admissible system is of the form $\mathcal{F}(I_1, \dots, I_n)$ with $I_i$ irreducible, is proved in the restricted regime of this section: every unital finite-dimensional complex C*-algebra is a direct sum of irreducible blocks, the construction $\mathcal{F}$ is the direct sum, and the irreducibles are the $M_n(\mathbb{C})$. The identity $\mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F} \rangle_{\mathcal{C}}$ for general admissible systems remains conjectural, and nothing in this volume upgrades its status.
   472	\end{remark}
   473	
   474	\section{Decomposition and morphisms}
   475	
   476	The morphism layer of the schema distinguishes coarse-grainings, embeddings, dualities, equivalence morphisms, and limiting procedures. Decomposition interacts with each of them differently, and two of the interactions are exact.
   477	
   478	\begin{proposition}[Embeddings and multiplicity matrices]
   479	\label{prop:embeddings}
   480	In the setting of \cref{thm:homs}, a unital *-homomorphism $\varphi \colon A \to B$ is injective if and only if its multiplicity matrix has no zero row. Injective unital *-homomorphisms are the embeddings of the finite-dimensional C*-category.
   481	\end{proposition}
   482	
   483	\begin{proof}
   484	The restriction of $\varphi$ to the $i$-th block is a *-homomorphism out of the simple algebra $M_{n_i}(\mathbb{C})$ with unit $e_i = \varphi(p_i)$. If the $i$-th row of the multiplicity matrix is zero then $e_i = 0$ and $\varphi$ kills the $i$-th block. If some entry $r^{(i)}_j$ is positive then $e_i \neq 0$ and the homomorphism is injective on the simple block, because the kernel of a *-homomorphism out of a simple algebra is zero or everything.
   485	\end{proof}
   486	
   487	\begin{proposition}[Spectra of direct sums]
   488	\label{prop:spectrum-sum}
   489	Let $A$ and $B$ be unital commutative C*-algebras with spectra $X$ and $Y$. Then $A \oplus B \cong C(X \sqcup Y)$ and the spectrum of a direct sum is the disjoint union of the spectra.
   490	\end{proposition}
   491	
   492	\begin{proof}
   493	Characters of $A \oplus B$ are unital *-homomorphisms to $\mathbb{C}$. The identity splits as $1 = 1_A + 1_B$ with $1_A 1_B = 0$, so $\chi(1_A) = \chi(1_A)^2$ in $\mathbb{C}$ and $\chi(1_A) \in \{0, 1\}$: every character restricts to a character of exactly one summand and vanishes on the other. The character space is therefore the disjoint union of the character spaces of the summands, and the Gelfand isomorphism $A \oplus B \cong C(X \sqcup Y)$ follows.
   494	\end{proof}
   495	
   496	Coarse-grainings behave in the opposite way. A coarse-graining can merge blocks and forget the decomposition: the map $M_2(\mathbb{C}) \oplus M_2(\mathbb{C}) \to M_2(\mathbb{C})$ sending $(x,y)$ to $(x+y)/2$ is positive and unital, and it destroys the superselection decomposition of its domain. Irreducibility is not preserved by coarse-graining, and a decomposition statement about coarse-grained systems must be justified for the target system, not inherited from the source.
   497	
   498	Limiting procedures are the least controlled interaction. Direct sums of finite-dimensional blocks pass to direct integrals of factors in infinite-volume or continuum limits, and the block structure of the approximating algebras need not survive the limit. The decomposition theorems of this volume are finite-dimensional statements; their behavior under the limiting procedures named in the construction list is a separate problem, and nothing here claims continuity of decomposition under limit.
   499	
   500	Dualities commute with decomposition in the commutative case by \cref{prop:spectrum-sum}, and Doplicher-Roberts reconstruction (\cref{thm:dr-reconstruction}) recovers symmetry data from decomposed sector categories. Equivalence morphisms preserve decomposition when they are *-isomorphisms of observable algebras, and only for those is the dimension vector invariant.
   501	
   502	\section{Decomposition across the families}
   503	
   504	The block decomposition is one row of a larger chart. The table below records the established position, for each domain in which a decomposition question is live, on the three questions this paper keeps separate: existence of a decomposition, uniqueness of the decomposition, and parameterization of the pieces. The sources are the same that supply the theorems cited in the preceding sections.
   505	
   506	\begin{table}[ht]
   507	\centering
   508	\small
   509	\begin{tabularx}{\textwidth}{@{}L{0.2\textwidth}L{0.22\textwidth}L{0.2\textwidth}X@{}}
   510	\toprule
   511	Domain & Existence & Uniqueness & Parameterization of the pieces \\
   512	\midrule
   513	Finite-dimensional C*-algebras & Direct sum into matrix blocks & Dimension vector unique up to permutation & Dimension vector is complete \\
   514	Commutative C*-algebras & Spectrum of characters & Spectrum is unique & The spectrum itself \\
   515	Von Neumann algebras & Direct integral into factors & Essentially unique up to measure class & No parameterization of the factors in general \\
   516	Completely positive maps & Stinespring dilation and Kraus form & Minimal dilation unique up to unitary & Kraus rank is a normal-form invariant only \\
   517	Bipartite pure states & Schmidt decomposition & Coefficients unique & Schmidt coefficients \\
   518	Interacting systems & No general theorem & Fails in general & Not available \\
   519	Wild representation categories & Indecomposable decompositions may exist & Not controlled & Finite-dimensional parameterization is impossible \\
   520	\bottomrule
   521	\end{tabularx}
   522	\caption{Decomposition status by domain. The first and fifth rows are the complete cases, the fourth row is a normal form and not a classification, and the last two rows record where the pattern stops.}
   523	\label{tab:domains}
   524	\end{table}
   525	
   526	The comparison makes the volume's shape visible. The complete rows are exactly the rows with a finite or parametric invariant, and every one of them is a restricted class: semisimple finite-dimensional algebras, commutative algebras, bipartite pure states. The normal-form row is the trap this volume documents at length: a canonical description that does not classify. The last two rows are theorems, not disappointments: nonunique decomposition for interacting systems and the impossibility of finite-dimensional parameterization in wild regimes are proved statements about the boundary of decomposition programs.
   527	
   528	The von Neumann row deserves one sentence of its own. Decomposition into factors exists, and the pieces resist classification: uncountably many pairwise non-isomorphic separable type $\mathrm{II}_1$ factors sit in a single type class~\cite{mcduff}. Any program that decomposes systems and then classifies the indecomposables therefore needs its own restriction hypothesis, and the restriction is not a technical convenience.
   529	
   530	\section{Wildness and the parameterization boundary}

exec
/usr/local/bin/zsh -lc "sed -n '320,365p' papers/latex/vol-03-irreducibility-decomposition.tex | nl -ba -v 320" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   320	
   321	\begin{proof}
   322	Let $\rho = \sum_{k=1}^{r} \lambda_k |v_k\rangle\langle v_k|$ be the spectral decomposition with $r \geq 2$ and all $\lambda_k > 0$. Every choice of an isometry $U \colon \mathbb{C}^{r} \to \mathbb{C}^{m}$ with $m \geq r$ produces a pure-state ensemble of $\rho$ through the unitary-mixing construction: the unnormalized vectors $|\phi_j\rangle = \sum_{k=1}^{r} U_{jk} \sqrt{\lambda_k} |v_k\rangle$ for $j = 1, \dots, m$ satisfy $\sum_j |\phi_j\rangle\langle\phi_j| = \rho$, because $U^* U = I_r$ rearranges the spectral sum. The corresponding ensemble consists of the normalized pure states $|\phi_j\rangle/\|\phi_j\|$ with probabilities $p_j = \|\phi_j\|^2$. Varying $U$ over the unitary group gives continuously many distinct ensembles, and two ensembles related by no unitary mixing differ as decompositions. In the qubit case $\rho = I/2$ the construction reads $I/2 = \frac{1}{2}(|0\rangle\langle 0| + |1\rangle\langle 1|) = \frac{1}{2}(|+\rangle\langle +| + |-\rangle\langle -|)$, and every orthonormal basis of $\mathbb{C}^2$ gives a new decomposition.
   323	\end{proof}
   324	
   325	The proposition is the state-level counterpart of the normal-form warning: every mixed state has a canonical spectral decomposition, and no decomposition into pure states is unique. Uniqueness returns only in the restricted bipartite case of \cref{prop:unique-restricted}.
   326	
   327	\begin{remark}[Interacting systems]
   328	Interacting physical systems need not admit unique decompositions. Entanglement, emergent phenomena, gauge redundancy, and nontrivial interactions each break naive decomposability: a gauge-invariant state does not split along the subsystem decomposition of the underlying Hilbert space; a coupled system's observable algebra need not be the tensor product of the factor algebras; and emergent degrees of freedom need not appear as factors of any microscopic decomposition. Existence-and-uniqueness theorems are realistic only in carefully restricted subclasses: finite-dimensional quantum systems with fixed tensor structure, finite groupoid models, and selected classes of topological field theories. This paper proves uniqueness in the first of those regimes at the level of observable algebras and morphisms and claims nothing for the others.
   329	\end{remark}
   330	
   331	\begin{remark}[Gauge redundancy]
   332	Under a gauge quotient, the decomposition of a system depends on the choice of subalgebra retained after reduction. Two systems with isomorphic reduced observable algebras can carry non-isomorphic unreduced data, and the reduction map does not preserve tensor decompositions in general. Decomposition after quotient is therefore a different problem from decomposition before quotient, and the admissible construction list marks quotient as a construction whose contribution to $\mathcal{C}$ must be stated case by case.
   333	\end{remark}
   334	
   335	\section{Normal forms and channels}
   336	\label{sec:normal-forms}
   337	
   338	Normal form theorems describe every object of a class in a canonical way without classifying the objects up to isomorphism. The distinction is sharp in the theory of completely positive maps, and this section states the results with the distinction in force.
   339	
   340	\subsection{Stinespring dilation}
   341	
   342	\begin{theorem}[Stinespring]
   343	\label{thm:stinespring}
   344	Let $A$ be a unital C*-algebra, $H$ a Hilbert space, and $\Phi \colon A \to B(H)$ completely positive. Then there exist a Hilbert space $K$, a *-representation $\pi \colon A \to B(K)$, and a bounded operator $V \colon H \to K$ with $\Phi(a) = V^* \pi(a) V$ for all $a \in A$. Among such dilations the minimal one, in which $K = \overline{\pi(A) V H}$, is unique up to a unitary intertwiner.
   345	\end{theorem}
   346	
   347	The construction~\cite{stinespring} is the GNS construction adapted to a completely positive map. On the algebraic tensor product $A \otimes H$ define the semidefinite form
   348	\[
   349	\langle a \otimes \xi, a' \otimes \xi' \rangle_\Phi = \langle \xi, \Phi(a^* a') \xi' \rangle,
   350	\]
   351	quotient by the null space, and complete to obtain $K_0$ with $\pi(a)(b \otimes \xi) = ab \otimes \xi$ and $V \xi = 1 \otimes \xi$. Complete positivity is exactly the condition that makes the form positive semidefinite and $\pi$ multiplicative; for general positive maps the construction breaks at this step. Minimality replaces $K_0$ by the closed span $\overline{\pi(A) V H}$, and any two minimal dilations are intertwined by a unitary, because both realize the same GNS pair up to the universal property of the construction. The theorem is a normal form for completely positive maps: every completely positive map has a canonical representation-theoretic envelope, and the minimal envelope is unique.
   352	
   353	\subsection{Kraus form and its status}
   354	
   355	In finite dimension the dilation theorem has a matrix form.
   356	
   357	\begin{theorem}[Kraus normal form]
   358	\label{thm:kraus}
   359	Every completely positive map $\Phi \colon M_n(\mathbb{C}) \to M_m(\mathbb{C})$ can be written $\Phi(X) = \sum_{s=1}^{r} K_s X K_s^*$ with Kraus operators $K_s \colon \mathbb{C}^n \to \mathbb{C}^m$. The minimal number $r$ of Kraus operators equals the rank of the Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$. Two Kraus families $(K_s)_{s=1}^{r}$ and $(L_t)_{t=1}^{r}$ of minimal size represent the same map if and only if $L_t = \sum_s u_{ts} K_s$ for a unitary $u \in U(r)$.
   360	\end{theorem}
   361	
   362	\begin{proof}
   363	The Choi matrix~\cite{choi,kraus} of a completely positive map is positive semidefinite, and a spectral decomposition $J(\Phi) = \sum_{s=1}^{r} \lambda_s v_s v_s^*$ with $\lambda_s > 0$ yields Kraus operators $K_s = \sqrt{\lambda_s} \, \mathrm{mat}(v_s)$ of minimal count $r = \operatorname{rank}(J(\Phi))$, where vec stacks the columns of a matrix and mat is its inverse; conversely any Kraus family of size $r$ produces $J(\Phi) = \sum_s \mathrm{vec}(K_s) \mathrm{vec}(K_s)^*$ of rank at most $r$. Equality of two maps is equality of their Choi matrices, and two positive semidefinite factorizations $J = \sum_s v_s v_s^* = \sum_t w_t w_t^*$ of the same rank are related by a unitary change of frame $w_t = \sum_s u_{ts} v_s$. Unpacking $\mathrm{vec}$ gives the statement on Kraus operators.
   364	\end{proof}
   365	

exec
/usr/local/bin/zsh -lc "python3 -c 'import re,pathlib,collections; s=pathlib.Path(\"papers/latex/vol-03-irreducibility-decomposition.tex\").read_text(); labels=re.findall(r\"\\\\label\\{(["'^}]+)'"\\}\",s); refs=[k for x in re.findall(r\"\\\\(?:ref|cref|Cref|eqref)\\{(["'^}]+)'"\\}\",s) for k in x.split(\",\")]; bib=set(re.findall(r\"\\\\bibitem\\{(["'^}]+)'"\\}\",s)); cites=[k for x in re.findall(r\"\\\\cite\\{(["'^}]+)'"\\}\",s) for k in x.split(\",\")]; print(\"Missing references:\", sorted(set(refs)-set(labels))); print(\"Duplicate labels:\",[k for k,v in collections.Counter(labels).items() if v>1]); print(\"Missing citations:\",sorted(set(cites)-bib)); print(\"Non-ASCII:\", sorted(set(c for c in s if ord(c)>127))); print(\"Sentence-start lowercase references:\"); [print(i,l) for i,l in enumerate(s.splitlines(),1) if re.search(r\"(?:"'^|[.!?] )'"\\\\cref\",l)]'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 29ms:
Missing references: []
Duplicate labels: []
Missing citations: []
Non-ASCII: []
Sentence-start lowercase references:
163 \cref{thm:block-decomposition} places the category of unital finite-dimensional complex C*-algebras among the additive categories with the Krull-Schmidt property: every object is a finite direct sum of indecomposable objects, and the decomposition is unique up to permutation and isomorphism of summands. The property is special. Tensor decomposition of objects in the same category does not inherit it: $M_4(\mathbb{C})$ factors as $M_2 \otimes M_2$ and as $M_4 \otimes \mathbb{C}$, and uniqueness statements about tensor factors live in the monoidal structure, not in the additive one.
565 Drop the C*-structure and \cref{thm:block-decomposition} fails at the first step. The dual numbers $\mathbb{C}[x]/(x^2)$ form a two-dimensional algebra with Jacobson radical the span of $x$, which is nonzero; the algebra is indecomposable and not simple. \cref{lem:radical} used positivity through the spectral theorem, and without positivity nothing forces the radical to vanish. Boundary case: the class of unital finite-dimensional complex C*-algebras is exactly the class where the block decomposition with matrix blocks holds; widening to finite-dimensional algebras requires the semisimplicity hypothesis, and widening to infinite-dimensional C*-algebras replaces direct sums by the direct-integral machinery of the contrast theorem.
569 A second tempting inference runs: every map has a canonical normal form with an invariant, therefore the maps are classified. \cref{ex:equal-count} refutes it: two channels with minimal Kraus count one differ on a single matrix, and the invariant cannot see the difference. The general lesson is that an invariant of a normal form is not an isomorphism invariant of the classified objects. The decomposition theorems of this volume avoid the trap because their invariants are complete: the dimension vector decides isomorphism of algebras (\cref{cor:classification}), and the multiplicity matrix decides conjugacy of homomorphisms (\cref{thm:homs}). Completeness is the property the normal forms lack.

codex
Reviewed only `papers/latex/vol-03-irreducibility-decomposition.tex`. This is a source-only review; compilation and box warnings were not verified.

1. **Lines 622–624 — escaped underscores inside `\path`.** `\path` reads its argument verbatim, so `\_` introduces unwanted backslashes into the printed filenames and function names. Use:
   ```latex
   \path{exp_closure.py}
   \path{closure_enumeration}
   \path{exp_multiplicity.py}
   \path{enumerate_multiplicity}
   \path{exp_kraus.py}
   \path{choi_rank_dilation}
   ```

2. **Lines 163, 565, 569 — lowercase references begin sentences.** Replace the sentence-initial `\cref` with `\Cref`. At line 565, change only `\cref{lem:radical}`; at line 569, change only `\cref{ex:equal-count}`.

3. **Lines 643, 648, 653, 658, 663, 668, 683, 688, 693, 698, 708, 713 — page ranges use hyphens.** Replace page-range hyphens with LaTeX en dashes, for example `943--981`, `285--290`, and `297--319`.

4. **Lines 638, 643, 648, 653, 658, 663, 668, 673, 678, 683, 688, 693, 698, 708, 713 — long DOI strings lack reliable line-breaking support.** These are potential overfull-box locations, especially lines 708 and 713. Format DOI identifiers with `\nolinkurl`, retaining clickable links through `\href`:
   ```latex
   doi:\href{https://doi.org/10.1090/S0273-0979-01-00909-0}
     {\nolinkurl{10.1090/S0273-0979-01-00909-0}}
   ```
   For more flexible URL breaking, add `\usepackage{xurl}` before `hyperref` at line 19. Actual overflow requires compilation to confirm.

All referenced labels and citation keys resolve within this file, and no duplicate labels were found. No definite compilation error or missing required package was identified. Underfull/overfull boxes and float placement remain unverified without a build.

VERDICT: NEEDS_FIX
hook: Stop
hook: Stop Completed
tokens used
45,026
Reviewed only `papers/latex/vol-03-irreducibility-decomposition.tex`. This is a source-only review; compilation and box warnings were not verified.

1. **Lines 622–624 — escaped underscores inside `\path`.** `\path` reads its argument verbatim, so `\_` introduces unwanted backslashes into the printed filenames and function names. Use:
   ```latex
   \path{exp_closure.py}
   \path{closure_enumeration}
   \path{exp_multiplicity.py}
   \path{enumerate_multiplicity}
   \path{exp_kraus.py}
   \path{choi_rank_dilation}
   ```

2. **Lines 163, 565, 569 — lowercase references begin sentences.** Replace the sentence-initial `\cref` with `\Cref`. At line 565, change only `\cref{lem:radical}`; at line 569, change only `\cref{ex:equal-count}`.

3. **Lines 643, 648, 653, 658, 663, 668, 683, 688, 693, 698, 708, 713 — page ranges use hyphens.** Replace page-range hyphens with LaTeX en dashes, for example `943--981`, `285--290`, and `297--319`.

4. **Lines 638, 643, 648, 653, 658, 663, 668, 673, 678, 683, 688, 693, 698, 708, 713 — long DOI strings lack reliable line-breaking support.** These are potential overfull-box locations, especially lines 708 and 713. Format DOI identifiers with `\nolinkurl`, retaining clickable links through `\href`:
   ```latex
   doi:\href{https://doi.org/10.1090/S0273-0979-01-00909-0}
     {\nolinkurl{10.1090/S0273-0979-01-00909-0}}
   ```
   For more flexible URL breaking, add `\usepackage{xurl}` before `hyperref` at line 19. Actual overflow requires compilation to confirm.

All referenced labels and citation keys resolve within this file, and no duplicate labels were found. No definite compilation error or missing required package was identified. Underfull/overfull boxes and float placement remain unverified without a build.

VERDICT: NEEDS_FIX
