---
reviewer: codex (OpenAI) gpt-6.1-sol
type: code-audit
paper: vol-03-irreducibility-decomposition
round: 4
date: 2026-10-30T05:13:31Z
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
session id: 01a18b3a-39cd-7721-b127-2e9eeb1bf859
--------
user
Read papers/latex/vol-03-irreducibility-decomposition.tex and ONLY the files under src/vol-03-irreducibility-decomposition/ that its code evidence appendix names (do not explore anything else). For EVERY row of the appendix output one line: ROW <n> | <claim, 10 words max> | SUPPORTS | PARTIAL | NO | <one-sentence reason>. SUPPORTS means the named code actually demonstrates or tests the claim as stated. End with VERDICT: PASS if every row is SUPPORTS, else VERDICT: NEEDS_FIX.
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
I’ll read the appendix, inspect only the source files it names, and assess each row against the code evidence.
exec
/usr/local/bin/zsh -lc 'cat papers/latex/vol-03-irreducibility-decomposition.tex' in /Users/mlong/Documents/Development/classification-physical-systems
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
\usepackage{listings}
\lstset{basicstyle=\ttfamily\footnotesize,breaklines=true,columns=fullflexible,frame=single,framesep=4pt,showstringspaces=false,captionpos=b}
\usepackage[hidelinks]{hyperref}
\usepackage{cleveref}

\newtheorem{theorem}{Theorem}[section]
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\theoremstyle{remark}
\newtheorem{remark}[theorem]{Remark}
\newtheorem{example}[theorem]{Example}

\title{Irreducibility and Decomposition\\[4pt]
  {\normalsize Part 3 of \emph{The Classification of Mathematical Representations of Physical Systems}}}
\author{Matthew Long\\
  \small The YonedaAI Collaboration, YonedaAI Research Collective\\
  \small Chicago, Illinois, USA\\
  \small \texttt{mlong@yonedalabs.ai}\\
  \small \texttt{https://yonedalabs.ai}}
\date{October 2026}

\begin{document}

\maketitle

\begin{abstract}
Structural classification of physical systems requires a precise account of irreducibility: the objects counted as basic, the constructions that assemble systems from them, and the uniqueness, or absence of uniqueness, of the resulting decomposition. This paper develops that account within a categorical schema of physical systems whose composition data determine what irreducibility means. The central positive result is the complete decomposition theory of unital finite-dimensional complex C*-algebras: every such algebra is a finite direct sum of matrix algebras, the multiset of matrix sizes classifies it up to *-isomorphism, and unital *-homomorphisms between decomposed algebras are classified exactly by multiplicity matrices with explicit arithmetic constraints. The paper then maps the limits of this pattern. Kraus rank is an invariant of the Stinespring normal form and not an isomorphism invariant of channels. Interacting systems admit no unique decomposition outside restricted subclasses. Wild representation categories forbid finite-dimensional parameterization of their indecomposables. Reconstruction theorems recover objects from probes under stated hypotheses, and those hypotheses carry the content. Computational evidence in an executable taxonomy layer and in enumeration experiments is recorded as evidence and never as proof. The results support decomposition theorems only in restricted, tame regimes.
\end{abstract}

\section{Introduction}

Classification programs in mathematics succeed where three conditions hold at once: the objects are well defined, the equivalence is fixed, and a finite or parametric invariant separates the objects up to that equivalence. The classification of finite simple groups is the model case, and it is also a warning, because the classification is complete while a clean uniform parameterization of the simple groups remains out of reach~\cite{solomon}. A structural classification of mathematical representations of physical systems would need all three conditions, and the third is where decomposition enters: a classification by constituents presumes that systems decompose into irreducibles, that the decomposition is unique enough to define invariants, and that the constructions assembling systems from irreducibles are understood.

A physical system is recorded as a tuple $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ of state space, observables, dynamics, symmetry data, and composition rules, and the classification problem is $\mathrm{Classify}(\mathrm{Ob}(\mathrm{Phys})/{\simeq})$ for a chosen equivalence $\simeq$. The present paper develops the machinery that turns candidate structural families into a classification: irreducibility, decomposition, admissible constructions, and closure under those constructions.

The program's long-term target is the identity $\mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F}_1, \dots, \mathfrak{F}_n \rangle_{\mathcal{C}}$, the statement that every admissible system is assembled from the fundamental families by the admissible constructions. That identity is a research objective and not an assumed result. The results below are narrower and concrete: existence and uniqueness of decomposition in one tame class, and theorem-marked boundaries beyond it.

Irreducibility depends strictly on the composition operation assigned to a system, and the relativity is visible in concrete examples. Under direct sum, unital finite-dimensional complex C*-algebras decompose uniquely into simple matrix blocks classified completely by their dimension vectors, and their unital *-homomorphisms correspond bijectively to integer multiplicity matrices with explicit arithmetic constraints. This decomposition theory is an isolated tame regime. The Stinespring and Kraus descriptions of completely positive maps yield normal forms rather than isomorphism classifications. Interacting systems admit no unique decomposition outside restricted subclasses. Wild representation categories forbid finite-dimensional parameterization of their indecomposables. The reconstruction pattern, in which an object is recovered from its probes, is developed and separated from classification: commutative C*-algebras are recovered from their spectra, and symmetry data from superselection categories, both under hypotheses that cannot be dropped.

The technical development concerns the observable-algebra layer of the tuple: the classification theorems below classify algebras and their morphisms, and the state-space layer enters only where decomposition acts on states. Dynamics, symmetry actions, and coupling data are named in the definitions and left untreated here. Every statement about interacting systems is restricted to subclasses, and every result that leans on an unproved premise is marked conditional. A rigorous impossibility theorem is as valuable here as a classification theorem, and both kinds of content appear below.

\section{Mathematical framework}

The definitions below fix the notation used throughout. They are stipulative where no theorem is cited: they are vocabulary adopted for this analysis rather than consequences of deeper axioms.

\begin{definition}[Physical system, composition data]
A physical system is a tuple $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ consisting of a state space $X$, an observable algebra or collection $\mathcal{O}$, dynamical laws $\mathcal{D}$, symmetry and constraint data $\mathcal{S}$, and composition and interaction rules $\mathcal{C}$. The component $\mathcal{C}$ specifies how $P$ composes with other systems: tensor products, coupling terms, interfacing rules.
\end{definition}

The five components need not be independent, and the tuple is a candidate schema rather than a settled definition of every possible physical system. The choice of $\mathcal{C}$ determines everything that follows.

\begin{definition}[Irreducibility relative to $\mathcal{C}$]
Fix a composition operation $\ast$ named by $\mathcal{C}$, with its unit object: the zero system for direct sum, the one-dimensional system for tensor product. A system $P$ is \emph{irreducible relative to $\ast$} when $P$ admits no decomposition $P \simeq \ast(P_1, P_2)$ with both $P_1$ and $P_2$ nonisomorphic to the unit. The class of irreducibles for $\ast$ is
\[
\mathfrak{J}_{\ast} = \{ P : P \text{ is irreducible relative to } \ast \}.
\]
\end{definition}

Irreducibility is therefore never an absolute property of a tuple. It is a property of the pair $(P, \ast)$, and changing the composition operation changes the class of basic objects. Section~\ref{sec:decomp-existence} exhibits a concrete pair of systems on which two natural composition operations return opposite answers.

\begin{definition}[Decomposition]
A \emph{decomposition} of $P$ is an expression $P \simeq \mathcal{F}(I_1, \dots, I_n)$ with each $I_i$ irreducible relative to the composition operation in force and $\mathcal{F}$ an admissible construction. A decomposition is \emph{unique in a class} when any two decompositions of a system in that class differ by a permutation of isomorphic factors and by the ambient equivalence $\simeq$.
\end{definition}

\begin{definition}[Admissible constructions]
The admissible constructions $\mathcal{F}$ are the permitted operations assembling systems from simpler ones: tensor product, direct sum, extension (group, algebra, field-theoretic), limits and colimits including the limiting procedures of the morphism layer, factorization of a representation into factors, and quotient or symmetry reduction. Each use of a construction must state the composition data it contributes to $\mathcal{C}$.
\end{definition}

The list is stipulative, and every uniqueness claim in this paper is uniqueness relative to a named construction. The direct sum and the tensor product behave differently in every respect that follows.

\begin{definition}[Closure]
Given a collection $\mathfrak{F}$ of families and a set of constructions $\mathcal{C}$, the closure $\langle \mathfrak{F} \rangle_{\mathcal{C}}$ is the smallest class of systems containing $\mathfrak{F}$ and closed under the constructions $\mathcal{C}$.
\end{definition}

The long-term structural generation statement is the identity $\mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F} \rangle_{\mathcal{C}}$. Its status is conjectural. The proved domains in which generation statements hold are the restricted ones treated below.

\begin{definition}[Dimension vector]
For a unital finite-dimensional complex C*-algebra presented as a direct sum $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$, the \emph{dimension vector} of $A$ is the multiset $\mathbf{n}(A) = \{n_1, \dots, n_k\}$ of matrix sizes, equivalently the unordered list of the dimensions of the simple $A$-modules.
\end{definition}

\begin{remark}[Two composition operations on operator-algebra systems]
For systems whose observable algebra is a unital finite-dimensional complex C*-algebra, two composition operations are natural: the direct sum $A \oplus B$ of observable algebras, which models superselection, and the tensor product $A \otimes B$, which models subsystems. The irreducibles of the first operation are the simple blocks $M_n(\mathbb{C})$. The irreducibles of the second are different. The distinction is not cosmetic; it decides what counts as a basic object.
\end{remark}

\begin{remark}[Equivalence discipline]
Any equivalence $\simeq$ used to identify systems or factors in this paper is a *-isomorphism of observable algebras, unless another relation is named. In concrete terms for the classes at hand: two decomposed algebras are identified exactly when a bijection of their block lists matches matrix sizes blockwise and implements a *-isomorphism. Equivalences that forget algebraic structure are not used to establish classification statements, and no identification of mathematical isomorphism with physical or empirical equivalence is attempted here.
\end{remark}

\subsection{Classification, parameterization, recognition}

Three achievements are separated throughout this paper because the classification of finite simple groups separates them in practice. A classification is an exhaustive list of isomorphism types. A parameterization is a uniform finite or algebraic description of those types, in the style of Dynkin diagrams for semisimple Lie algebras. A recognition procedure is an algorithm that identifies a presented object by computing its invariants. The finite simple groups are classified, are not uniformly parameterized in the Dynkin sense~\cite{solomon}, and are recognized in practice by companion data of the kind recorded in group atlases: order, character table, outer automorphism group, presentations. The decomposition theorem of the next section delivers all three achievements at once for its class.

\section{Decomposition existence}
\label{sec:decomp-existence}

The central positive result of this paper is the block decomposition of unital finite-dimensional complex C*-algebras. This section proves it in full, because the classification package built on it needs both halves: existence of the decomposition and uniqueness of the invariants.

\subsection{Semisimplicity and blocks}

The block decomposition combines two facts from different centuries. Artin-Wedderburn reduces a semisimple Artinian algebra to matrix algebras over division algebras; the C*-structure then forces the division algebras to be $\mathbb{C}$ and the central idempotents to be self-adjoint. The first fact is algebra, the second is analysis, and the block decomposition sits exactly at their join~\cite{murphy}.

\begin{lemma}[No nilpotent radical]
\label{lem:radical}
Let $A$ be a finite-dimensional C*-algebra over $\mathbb{C}$. The Jacobson radical $J(A)$ is zero.
\end{lemma}

\begin{proof}
$A$ is finite-dimensional, hence Artinian, and $J(A)$ is a nilpotent ideal. The radical of a C*-algebra is a *-ideal, so it is closed under adjoints, and every $x \in J(A)$ has a Cartesian decomposition $x = a + ib$ with $a = (x + x^*)/2$ and $b = (x - x^*)/(2i)$, both self-adjoint elements of $J(A)$, since $a^* = a$, $b^* = b$, and $a + ib = x$. The radical of an Artinian ring consists of nilpotent elements, and a sum or scalar multiple of nilpotent elements in a nilpotent ideal is nilpotent, so $a$ and $b$ are nilpotent. A self-adjoint nilpotent element of a C*-algebra is zero: by the spectral theorem the spectrum of $a$ is $\{0\}$, and a self-adjoint element equals its spectral integral, so $a = 0$. Thus $a = b = 0$ and $x = 0$.
\end{proof}

\begin{lemma}[Simple blocks are matrix algebras]
\label{lem:simple-blocks}
Let $B$ be a finite-dimensional simple C*-algebra over $\mathbb{C}$. Then $B \cong M_n(\mathbb{C})$ for some $n \geq 1$.
\end{lemma}

\begin{proof}
By the Artin-Wedderburn theorem~\cite{murphy} $B \cong M_n(D)$ for a finite-dimensional division algebra $D$ over $\mathbb{C}$. Every element $d \in D$ generates a commutative subalgebra $\mathbb{C}[d]$, which is a finite field extension of $\mathbb{C}$ and therefore equals $\mathbb{C}$, because $\mathbb{C}$ is algebraically closed. Hence $D = \mathbb{C} \cdot 1$ and $B \cong M_n(\mathbb{C})$.
\end{proof}

\begin{theorem}[Block decomposition]
\label{thm:block-decomposition}
Let $A$ be a unital finite-dimensional complex C*-algebra of dimension $d$. Then there exist $k \geq 1$ and integers $n_1, \dots, n_k \geq 1$ with $\sum_{i=1}^{k} n_i^2 = d$ and a *-isomorphism
\[
A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C}).
\]
The multiset $\mathbf{n}(A) = \{n_1, \dots, n_k\}$ is unique up to permutation, and $k = \dim_{\mathbb{C}} Z(A)$.
\end{theorem}

\begin{proof}
By \cref{lem:radical} the algebra $A$ is semisimple, so by Artin-Wedderburn $A \cong \bigoplus_{i=1}^{k} M_{n_i}(D_i)$ with $D_i$ finite-dimensional division algebras over $\mathbb{C}$. The decomposition is given by the primitive central idempotents $e_1, \dots, e_k$ of $A$, which are uniquely determined by $A$. Each $e_i$ is self-adjoint: it is central, so $e_i^*$ is also a central idempotent and $e_i$ is normal; a normal idempotent of a C*-algebra has spectrum contained in $\{0, 1\}$ and equals its spectral integral $e_i = 0 \cdot P_0 + 1 \cdot P_1 = P_1$, a projection. Then $A = \bigoplus_i e_i A e_i$ is a direct sum of *-ideals, each simple as an algebra, and \cref{lem:simple-blocks} identifies $e_i A e_i \cong M_{n_i}(\mathbb{C})$ as algebras. It remains to match the involutions: every C*-involution on $M_n(\mathbb{C})$ is unitarily conjugate to the standard conjugate transpose, so composing each block isomorphism with a blockwise unitary adjustment yields a *-isomorphism $A \cong \bigoplus_i M_{n_i}(\mathbb{C})$ with the adjoint taken blockwise. Counting dimensions gives $\sum_i n_i^2 = \dim_{\mathbb{C}} A = d$, and the center is $\bigoplus_i \mathbb{C} e_i$, so $k = \dim_{\mathbb{C}} Z(A)$.

For uniqueness, the simple left $A$-modules are exactly the modules $\mathbb{C}^{n_i}$ obtained by composing a projection $A \to M_{n_i}(\mathbb{C})$ with the standard module of $M_{n_i}(\mathbb{C})$. Distinct blocks give non-isomorphic simple modules because a simple module kills all but one primitive central idempotent. Hence the multiset of simple module dimensions is $\{n_1, \dots, n_k\}$, and it is an isomorphism invariant. Any *-isomorphism $A \cong A'$ carries simple modules to simple modules, so $\mathbf{n}(A) = \mathbf{n}(A')$ as multisets.
\end{proof}

\begin{corollary}[Classification of the class]
\label{cor:classification}
Two unital finite-dimensional complex C*-algebras are *-isomorphic if and only if their dimension vectors agree as multisets. The dimension vector is a complete invariant of the class.
\end{corollary}

The corollary is the strongest classification statement this paper offers for a whole class of systems. It classifies unital finite-dimensional complex C*-algebras up to *-isomorphism of observable algebras. It classifies neither states nor dynamics nor symmetry actions nor composition, and the distinction is essential: an observable algebra is one component of the tuple $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$, and which additional structures are needed to classify physical systems rather than observable algebras remains open.

\begin{remark}[Unique decomposition in the categorical sense]
\label{rem:krull-schmidt}
\Cref{thm:block-decomposition} places the category of unital finite-dimensional complex C*-algebras among the additive categories with the Krull-Schmidt property: every object is a finite direct sum of indecomposable objects, and the decomposition is unique up to permutation and isomorphism of summands. The property is special. Tensor decomposition of objects in the same category does not inherit it: $M_4(\mathbb{C})$ factors as $M_2 \otimes M_2$ and as $M_4 \otimes \mathbb{C}$, and uniqueness statements about tensor factors live in the monoidal structure, not in the additive one.
\end{remark}

\subsection{Relativity of irreducibility}

The block decomposition settles irreducibility for the direct sum. The tensor product asks a different question, and the answers differ.

\begin{example}[One system, two answers]
\label{ex:two-answers}
Consider a two-qubit system with observable algebra $M_4(\mathbb{C})$. Under the direct sum composition, $M_4(\mathbb{C})$ is irreducible: it is simple, it has no nontrivial central idempotent, and its dimension vector is $\{4\}$. Under the tensor product composition, the same algebra factors as $M_2(\mathbb{C}) \otimes M_2(\mathbb{C}) \cong M_4(\mathbb{C})$ with two irreducible tensor factors. The dimension vector of the tensor product is the pairwise product multiset of the factor vectors: the product multiset of $\{2\}$ and $\{2\}$ is $\{4\}$, and the tensor factorization is invisible to the direct-sum invariant. Irreducibility is a property of the pair $(P, \ast)$.
\end{example}

\begin{example}[Superselection and subsystems]
\label{ex:superselection}
The algebra $M_2(\mathbb{C}) \oplus M_2(\mathbb{C})$ decomposes as a direct sum into two simple blocks, the standard model of two superselection sectors, each carrying a qubit observable algebra. The same algebra is not a tensor product of two matrix algebras of equal size: a tensor decomposition $M_a \otimes M_b \cong M_{ab}$ is simple and has dimension vector $\{ab\}$, while $M_2 \oplus M_2$ has dimension vector $\{2,2\}$ and total dimension $8 = 2^2 + 2^2 \neq 2^3$. Direct-sum decomposition detects superselection, tensor decomposition detects subsystems, and neither detects the other.
\end{example}

\subsection{States across blocks}

The decomposition of an observable algebra induces a decomposition of its state space, and the induced decomposition is unique in the same restricted sense.

\begin{definition}[State]
A state on a unital C*-algebra $A$ is a linear functional $\omega \colon A \to \mathbb{C}$ that is positive and normalized by $\omega(1) = 1$. Write $S(A)$ for the set of states of $A$.
\end{definition}

\begin{proposition}[States on a direct sum]
\label{prop:states-direct-sum}
Let $A = A_1 \oplus A_2$ with unital summands $A_1, A_2$ and central block projections $p_1, p_2$. Every state $\omega$ of $A$ has a unique expression
\[
\omega = \lambda \, \omega_1 + (1 - \lambda) \, \omega_2
\]
where $\lambda = \omega(p_1) \in [0,1]$, where $\omega_i$ is the restriction of $\omega$ to $A_i$ normalized to a state of $A_i$ when $\omega(p_i) > 0$, and the term is omitted when its weight is zero. Consequently $S(A)$ is the convex join of $S(A_1)$ and $S(A_2)$.
\end{proposition}

\begin{proof}
Write $a = p_1 a p_1 + p_2 a p_2$ for $a \in A$. Positivity of $\omega$ gives $0 \leq \omega(p_i) \leq 1$ and $\omega(p_1) + \omega(p_2) = 1$. Set $\lambda = \omega(p_1)$; when $\lambda \in (0,1)$ define $\omega_i(a) = \omega(p_i a p_i)/\lambda_i$ with $\lambda_1 = \lambda$ and $\lambda_2 = 1 - \lambda$. Each $\omega_i$ is positive and normalized, and $\omega$ is recovered as the convex combination above. Uniqueness of the weights follows from $\omega(p_1) = \lambda$ and uniqueness of the normalized restrictions follows from the formula. The convex-join description is the standard identification of a convex set built by joining two convex sets along their extreme points.
\end{proof}

\begin{example}[State space of two superselection sectors]
For $A = M_2(\mathbb{C}) \oplus M_2(\mathbb{C})$, each block state space is a Bloch ball and $S(A)$ is the join of two Bloch balls: a state is a choice of sector weight $\lambda \in [0,1]$ and a Bloch vector in each sector. The direct-sum decomposition of the algebra is exactly the superselection decomposition of the state space, and no information is lost or doubled in passing between the two descriptions.
\end{example}

\subsection{Existence beyond the finite-dimensional case}

Two further existence results are recorded because the later sections compare against them. They are background theorems of operator algebra, used here as reference points and not as dependencies of the classification statements above.

The first is the direct-integral decomposition of von Neumann algebras: every von Neumann algebra is a direct integral of factors over a measure space, and the decomposition is essentially unique up to measure-class isomorphism of the base~\cite{murray-vonneumann}. Existence of a decomposition into indecomposable pieces is therefore available in that setting. The second is the negative theorem that closes the classification story for the indecomposable pieces: there are uncountably many pairwise non-isomorphic separable type $\mathrm{II}_1$ factors~\cite{mcduff}. A global classification of factors is therefore impossible in the stated generality, and any decomposition program that hopes to finish with a parameterized list of indecomposables must restrict its class. Existence of a decomposition and classification of its pieces are different achievements, and the second one fails here.

\section{Morphisms and multiplicity data}

A classification of objects is worth little if the morphisms between them are opaque. For decomposed finite-dimensional C*-algebras the morphisms admit an exact combinatorial description, and the description is a second existence-and-uniqueness theorem in a restricted setting.

\begin{definition}[Multiplicity matrix]
\label{def:multiplicity-matrix}
Let $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ and $B \cong \bigoplus_{j=1}^{\ell} M_{m_j}(\mathbb{C})$. A \emph{multiplicity matrix} from $A$ to $B$ is a matrix $R = (r^{(i)}_j)$ of nonnegative integers with
\[
k^{(i)}_j = n_i \, r^{(i)}_j \qquad \text{and} \qquad \sum_{i=1}^{k} k^{(i)}_j = m_j \quad \text{for each } j.
\]
Write $k(R) = (k^{(i)}_j)$ for the induced rank matrix.
\end{definition}

\begin{theorem}[Classification of unital *-homomorphisms]
\label{thm:homs}
Let $A$ and $B$ be unital finite-dimensional complex C*-algebras with fixed block presentations as above. Unital *-homomorphisms $\varphi \colon A \to B$, up to unitary conjugacy in $B$, correspond bijectively to multiplicity matrices $R$ from $A$ to $B$. The correspondence sends $\varphi$ to the rank matrix $k^{(i)}_j = \operatorname{rank}(\varphi(p_i) q_j)$, where $p_i$ is the $i$-th block projection of $A$ and $q_j$ the $j$-th block projection of $B$. Two unital *-homomorphisms are unitarily conjugate in $B$ if and only if their multiplicity matrices agree.
\end{theorem}

\begin{proof}
Let $\varphi \colon A \to B$ be a unital *-homomorphism. Set $e_i = \varphi(p_i)$; these are orthogonal projections of $B$ with $\sum_i e_i = 1$, and each $e_i$ commutes with $Z(B)$, so $e_i = \bigoplus_j e_i^{(j)}$ with $e_i^{(j)} \in M_{m_j}(\mathbb{C})$ a projection. Put $k^{(i)}_j = \operatorname{rank}(e_i^{(j)})$; then $\sum_i k^{(i)}_j = m_j$.

The restriction $\varphi_i \colon p_i A p_i \to e_i B e_i$ is a unital *-homomorphism from $M_{n_i}(\mathbb{C})$ onto a subalgebra of $\bigoplus_j M_{k^{(i)}_j}(\mathbb{C})$, hence it is a tuple of *-homomorphisms $\psi^{(i)}_j \colon M_{n_i}(\mathbb{C}) \to M_{m_j}(\mathbb{C})$ with $\psi^{(i)}_j(1) = e_i^{(j)}$. A nonzero *-homomorphism out of a simple algebra is injective, and an injective *-homomorphism $M_{n}(\mathbb{C}) \to M_{m}(\mathbb{C})$ with $\psi(1)$ of rank $k$ exists only when $k = n r$ for some $r \geq 0$, in which case $\psi(M_n)$ is unitarily conjugate inside $M_m$ to $M_n \otimes 1_r$ acting on $\mathbb{C}^n \otimes \mathbb{C}^r$. Thus $k^{(i)}_j = n_i r^{(i)}_j$ for a unique $r^{(i)}_j \in \mathbb{N}$.

Conversely, given a multiplicity matrix $R$, choose for each $j$ a decomposition $\mathbb{C}^{m_j} \cong \bigoplus_i (\mathbb{C}^{n_i} \otimes \mathbb{C}^{r^{(i)}_j})$; the summands have total dimension $\sum_i n_i r^{(i)}_j = m_j$, so the decomposition exists. Define $\varphi$ blockwise by letting $p_i A p_i$ act on the $i$-th summand and as zero elsewhere. This is a unital *-homomorphism with rank matrix $k(R)$.

Unitary conjugacy preserves ranks of projections, so distinct multiplicity matrices give non-conjugate homomorphisms. Two homomorphisms with the same multiplicity matrix are conjugate: for each $j$ choose a unitary of $M_{m_j}$ carrying the chosen decomposition of $\mathbb{C}^{m_j}$ of the first homomorphism to that of the second; the direct sum of these unitaries conjugates the homomorphisms in $B$.
\end{proof}

\begin{corollary}[Outer automorphisms]
\label{cor:outer-aut}
Let $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$. Automorphisms of $A$, modulo inner automorphisms, are classified by permutations of the blocks with equal dimension vector entries. Concretely, $\mathrm{Aut}(A)/\mathrm{Inn}(A)$ is isomorphic to the group of permutations $\sigma$ of $\{1, \dots, k\}$ with $n_{\sigma(i)} = n_i$ for all $i$.
\end{corollary}

\begin{proof}
By \cref{thm:homs} a unital *-endomorphism of $A$ is a multiplicity matrix $R$ with $\sum_i n_i r^{(i)}_j = n_j$ for all $j$. An automorphism is invertible, so the induced map on $K_0$, which sends the $i$-th basis element to $\sum_j r^{(i)}_j$ times the $j$-th, is a permutation matrix; hence $R$ is a permutation matrix $\delta_{j, \sigma(i)}$ with $n_i = n_{\sigma(i)}$. Every such $R$ is realized by the homomorphism permuting equal blocks, and such homomorphisms are outer unless $\sigma$ is the identity and the homomorphism is inner.
\end{proof}

\begin{example}[Two homomorphisms into $M_3$]
\label{ex:two-homs}
Take $A = \mathbb{C} \oplus M_2(\mathbb{C})$ and $B = M_3(\mathbb{C})$. A multiplicity matrix is a pair $(r^{(1)}, r^{(2)}) \in \mathbb{N}^2$ with $1 \cdot r^{(1)} + 2 \cdot r^{(2)} = 3$. The solutions are $(3, 0)$ and $(1, 1)$. There are exactly two conjugacy classes of unital *-homomorphisms $A \to M_3(\mathbb{C})$: one in which the $M_2$ summand acts as zero, and one in which the scalar summand acts on a one-dimensional summand and the $M_2$ block acts on the remaining $\mathbb{C}^2$. The classification is exact, small, and verifiable by hand.
\end{example}

\begin{table}[ht]
\centering
\small
\begin{tabularx}{\textwidth}{@{}L{0.18\textwidth}L{0.16\textwidth}L{0.26\textwidth}X@{}}
\toprule
Domain & Codomain & Multiplicity data & Conjugacy classes \\
\midrule
$\mathbb{C} \oplus M_2$ & $M_3$ & $r^{(1)}_1 + 2 r^{(2)}_1 = 3$ & Exactly two, given by $(3,0)$ and $(1,1)$ \\
$M_2$ & $M_2 \oplus M_2$ & $2 r^{(1)}_1 = 2$ and $2 r^{(1)}_2 = 2$ & Exactly one, the diagonal embedding \\
$\mathbb{C} \oplus \mathbb{C}$ & $\mathbb{C} \oplus M_2$ & Column sums $(1, 2)$ of nonnegative integers & Exactly six, two choices in column one and three in column two \\
\bottomrule
\end{tabularx}
\caption{Multiplicity matrices for three small block pairs. Each row of the table is an exact count of conjugacy classes of unital *-homomorphisms.}
\label{tab:homs}
\end{table}

The theorem and its corollary give a restricted existence-and-uniqueness package for morphisms. The restriction is essential: the classification is of *-homomorphisms of observable algebras up to unitary conjugacy in the codomain. Nothing is claimed about morphisms of states, channels, or dynamics, where the later sections show that the analogous uniqueness statements fail.

\subsection{Modules and factorization}

The factorization construction of the admissible list has a complete finite-dimensional form: modules over a decomposed algebra decompose into blocks.

\begin{proposition}[Module factorization]
\label{prop:module-factorization}
Let $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ and let $M$ be a finite-dimensional left $A$-module. Then $M = \bigoplus_{i=1}^{k} p_i M$ uniquely as $A$-modules, each summand $p_i M$ is a module over the simple block $M_{n_i}(\mathbb{C})$, and $p_i M \cong (\mathbb{C}^{n_i})^{\oplus r_i}$ for a unique multiplicity $r_i \geq 0$. Two modules are isomorphic if and only if their multiplicity vectors agree.
\end{proposition}

\begin{proof}
The projections $p_i$ are central and orthogonal with $\sum_i p_i = 1$, so $M = \bigoplus_i p_i M$ as vector spaces, and each summand is stable under $A$ because $p_i$ is central. A module over $M_{n_i}(\mathbb{C})$ is semisimple with unique simple module $\mathbb{C}^{n_i}$, so $p_i M \cong (\mathbb{C}^{n_i})^{\oplus r_i}$ with $r_i = \dim p_i M / n_i$ determined by the module. Isomorphism of modules preserves the central idempotent decomposition and the multiplicities, and conversely equal multiplicity vectors give isomorphic modules.
\end{proof}

The proposition is the representation-theoretic face of \cref{thm:homs}: the multiplicity vector of a module is the column of a multiplicity matrix in the endomorphism case. It also states the uniqueness of factorization in the module category, and the uniqueness is total in this regime: unlike the multipartite state decompositions of the next section, the module decomposition of a semisimple algebra has no nonunique cases.

\begin{remark}[$K$-theoretic bookkeeping]
\label{rem:k-theory}
The multiplicity vector of a module, the dimension vector of an algebra, and the rank matrix of a homomorphism are three views of the same combinatorics. Formally, the Grothendieck group $K_0(A)$ of a unital finite-dimensional complex C*-algebra is the free abelian group on the $k$ simple classes, $K_0(A) \cong \mathbb{Z}^k$, the tensor product induces the pairwise product of basis indices via $M_{n_i} \otimes M_{m_j} \cong M_{n_i m_j}$, and a unital *-homomorphism acts on $K_0$ by the transpose of its multiplicity matrix: the image of a minimal projection of block $i$ has rank $r^{(i)}_j$ in block $j$. The classification of \cref{thm:homs} is therefore a statement about morphisms of free abelian groups with nonnegativity constraints, which is one reason the result is computable.
\end{remark}

\section{Uniqueness of decomposition}

This section collects the positive uniqueness statements available in the finite-dimensional setting and states, at the level the evidence supports, where uniqueness stops.

\subsection{Where uniqueness holds}

\begin{proposition}[Uniqueness in the restricted classes]
\label{prop:unique-restricted}
Uniqueness of decomposition up to permutation of isomorphic factors holds in each of the following restricted classes.
\begin{enumerate}
\item Unital finite-dimensional complex C*-algebras under direct sum: \cref{thm:block-decomposition}.
\item Unital *-homomorphisms of such algebras up to unitary conjugacy: \cref{thm:homs}.
\item Tensor factorizations into prime-dimensional factors: if a finite-dimensional Hilbert space is written as a tensor product of factors of prime dimension, the multiset of factor dimensions is unique up to permutation, by unique prime factorization of the total dimension.
\item Bipartite pure states of a finite-dimensional bipartite system, up to the Schmidt decomposition: the Schmidt coefficients are unique, and the left and right Schmidt subspaces are unique as subspaces.
\end{enumerate}
\end{proposition}

The third and fourth items are the tame corners of quantum theory: a fixed tensor structure with finitely many factors. Factorizations into composite dimensions are not unique, as $\mathbb{C}^2 \otimes \mathbb{C}^6 \cong \mathbb{C}^3 \otimes \mathbb{C}^4$ shows, so the third item restricts to prime dimensions on purpose. The fourth is the strongest state-level uniqueness statement available without further structure, and it fails as soon as the state is multipartite with more than two factors or mixed, as the next subsection records.

\subsection{Where uniqueness fails}

\begin{remark}[Multipartite and mixed states]
Tensor decomposition of a multipartite pure state is not unique in general: distinct sets of factor vectors can realize the same state, and the minimal number of product terms is not a complete invariant. For mixed states the situation is worse, as the following proposition records. Any decomposition claim about states must therefore name its class, and the restricted classes of \cref{prop:unique-restricted} are the ones the evidence supports.
\end{remark}

\begin{proposition}[Ensemble nonuniqueness]
\label{prop:ensemble}
Every mixed density operator $\rho$, that is, every density operator of rank at least two, admits infinitely many distinct decompositions into pure states. Pure states are the only exceptions: a rank-one projector is an extreme point of the state space and admits no nontrivial decomposition.
\end{proposition}

\begin{proof}
Let $\rho = \sum_{k=1}^{r} \lambda_k |v_k\rangle\langle v_k|$ be the spectral decomposition with $r \geq 2$ and all $\lambda_k > 0$. Every choice of an isometry $U \colon \mathbb{C}^{r} \to \mathbb{C}^{m}$ with $m \geq r$ produces a pure-state ensemble of $\rho$ through the unitary-mixing construction: the unnormalized vectors $|\phi_j\rangle = \sum_{k=1}^{r} U_{jk} \sqrt{\lambda_k} |v_k\rangle$ for $j = 1, \dots, m$ satisfy $\sum_j |\phi_j\rangle\langle\phi_j| = \rho$, because $U^* U = I_r$ rearranges the spectral sum. The corresponding ensemble consists of the normalized pure states $|\phi_j\rangle/\|\phi_j\|$ with probabilities $p_j = \|\phi_j\|^2$. Varying $U$ over the unitary group gives continuously many distinct ensembles, and two ensembles related by no unitary mixing differ as decompositions. In the qubit case $\rho = I/2$ the construction reads $I/2 = \frac{1}{2}(|0\rangle\langle 0| + |1\rangle\langle 1|) = \frac{1}{2}(|+\rangle\langle +| + |-\rangle\langle -|)$, and every orthonormal basis of $\mathbb{C}^2$ gives a new decomposition.
\end{proof}

The proposition is the state-level counterpart of the normal-form warning: every mixed state has a canonical spectral decomposition, and no decomposition into pure states is unique. Uniqueness returns only in the restricted bipartite case of \cref{prop:unique-restricted}.

\begin{remark}[Interacting systems]
Interacting physical systems need not admit unique decompositions. Entanglement, emergent phenomena, gauge redundancy, and nontrivial interactions each break naive decomposability: a gauge-invariant state does not split along the subsystem decomposition of the underlying Hilbert space; a coupled system's observable algebra need not be the tensor product of the factor algebras; and emergent degrees of freedom need not appear as factors of any microscopic decomposition. Existence-and-uniqueness theorems are realistic only in carefully restricted subclasses: finite-dimensional quantum systems with fixed tensor structure, finite groupoid models, and selected classes of topological field theories. This paper proves uniqueness in the first of those regimes at the level of observable algebras and morphisms and claims nothing for the others.
\end{remark}

\begin{remark}[Gauge redundancy]
Under a gauge quotient, the decomposition of a system depends on the choice of subalgebra retained after reduction. Two systems with isomorphic reduced observable algebras can carry non-isomorphic unreduced data, and the reduction map does not preserve tensor decompositions in general. Decomposition after quotient is therefore a different problem from decomposition before quotient, and the admissible construction list marks quotient as a construction whose contribution to $\mathcal{C}$ must be stated case by case.
\end{remark}

\section{Normal forms and channels}
\label{sec:normal-forms}

Normal form theorems describe every object of a class in a canonical way without classifying the objects up to isomorphism. The distinction is sharp in the theory of completely positive maps, and this section states the results with the distinction in force.

\subsection{Stinespring dilation}

\begin{theorem}[Stinespring]
\label{thm:stinespring}
Let $A$ be a unital C*-algebra, $H$ a Hilbert space, and $\Phi \colon A \to B(H)$ completely positive. Then there exist a Hilbert space $K$, a *-representation $\pi \colon A \to B(K)$, and a bounded operator $V \colon H \to K$ with $\Phi(a) = V^* \pi(a) V$ for all $a \in A$. Among such dilations the minimal one, in which $K = \overline{\pi(A) V H}$, is unique up to a unitary intertwiner.
\end{theorem}

The construction~\cite{stinespring} is the GNS construction adapted to a completely positive map. On the algebraic tensor product $A \otimes H$ define the semidefinite form
\[
\langle a \otimes \xi, a' \otimes \xi' \rangle_\Phi = \langle \xi, \Phi(a^* a') \xi' \rangle,
\]
quotient by the null space, and complete to obtain $K_0$ with $\pi(a)(b \otimes \xi) = ab \otimes \xi$ and $V \xi = 1 \otimes \xi$. Complete positivity is exactly the condition that makes the form positive semidefinite and $\pi$ multiplicative; for general positive maps the construction breaks at this step. Minimality replaces $K_0$ by the closed span $\overline{\pi(A) V H}$, and any two minimal dilations are intertwined by a unitary, because both realize the same GNS pair up to the universal property of the construction. The theorem is a normal form for completely positive maps: every completely positive map has a canonical representation-theoretic envelope, and the minimal envelope is unique.

\subsection{Kraus form and its status}

In finite dimension the dilation theorem has a matrix form.

\begin{theorem}[Kraus normal form]
\label{thm:kraus}
Every completely positive map $\Phi \colon M_n(\mathbb{C}) \to M_m(\mathbb{C})$ can be written $\Phi(X) = \sum_{s=1}^{r} K_s X K_s^*$ with Kraus operators $K_s \colon \mathbb{C}^n \to \mathbb{C}^m$. The minimal number $r$ of Kraus operators equals the rank of the Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$. Two Kraus families $(K_s)_{s=1}^{r}$ and $(L_t)_{t=1}^{r}$ of minimal size represent the same map if and only if $L_t = \sum_s u_{ts} K_s$ for a unitary $u \in U(r)$.
\end{theorem}

\begin{proof}
The Choi matrix~\cite{choi,kraus} of a completely positive map is positive semidefinite, and a spectral decomposition $J(\Phi) = \sum_{s=1}^{r} \lambda_s v_s v_s^*$ with $\lambda_s > 0$ yields Kraus operators $K_s = \sqrt{\lambda_s} \, \mathrm{mat}(v_s)$ of minimal count $r = \operatorname{rank}(J(\Phi))$, where vec stacks the columns of a matrix and mat is its inverse; conversely any Kraus family of size $r$ produces $J(\Phi) = \sum_s \mathrm{vec}(K_s) \mathrm{vec}(K_s)^*$ of rank at most $r$. Equality of two maps is equality of their Choi matrices, and two positive semidefinite factorizations $J = \sum_s v_s v_s^* = \sum_t w_t w_t^*$ of the same rank are related by a unitary change of frame $w_t = \sum_s u_{ts} v_s$. Unpacking $\mathrm{vec}$ gives the statement on Kraus operators.
\end{proof}

Minimal Kraus rank does not separate isomorphism classes of channels. Every unitary channel has minimal Kraus rank one, and distinct unitaries give non-isomorphic channels with fixed-point algebras of different dimensions (\cref{ex:equal-count}). Non-minimal dilations inflate the presented family size without changing the map. Kraus rank therefore classifies minimal dilations of individual maps and nothing more.

\begin{example}[Equal count, different channels]
\label{ex:equal-count}
Both $\Phi(X) = X$ and $\Psi(X) = Z X Z$ on $M_2(\mathbb{C})$, with $Z$ the Pauli $Z$ operator, have minimal Kraus count one. They are not unitarily equivalent channels: the fixed-point algebra of $\Phi$ is all of $M_2(\mathbb{C})$, of complex dimension four, while the fixed-point algebra of $\Psi$ is the diagonal algebra $\mathbb{C} \oplus \mathbb{C}$, of dimension two, and unitary conjugation preserves the dimension of the fixed-point algebra. The invariant $r = 1$ does not separate the two channels.
\end{example}

\subsection{Channels as morphisms}

Channels are the morphisms of the quantum setting: completely positive trace-preserving maps composed in sequence and combined in parallel. The normal form composes poorly. The minimal Kraus count of a composition satisfies $\operatorname{rank}(J(\Psi \circ \Phi)) \leq \operatorname{rank}(J(\Phi)) \cdot \operatorname{rank}(J(\Psi))$ by the factorization of the Choi matrix through the composition, and the inequality is strict in general, so the normal-form invariant does not even add along composition. Parallel composition multiplies counts on the tensor product. No classification of channels up to isomorphism follows from the normal form, and no such classification appears in the literature on open quantum systems. The normal form delivers a canonical minimal realization of each individual map.

\begin{remark}[Inflation under dilation]
A single channel arises from dilations of every environment dimension above the minimal one: adjoining an ancilla of dimension $a$ to a minimal realization of rank $r$ produces a family of Kraus operators of size $r + a$ describing the same map. The ambient count is therefore not an invariant of the channel at all; only the minimal count is, and the minimal count is an invariant of the normal form.
\end{remark}

\section{Reconstruction from constituents}

Classification asks which invariants separate objects. Reconstruction asks which probes determine an object. The two patterns are distinct in status and in content, and reconstruction is the better developed of the two.

\subsection{Commutative C*-algebras}

\begin{theorem}[Gelfand-Naimark]
\label{thm:gelfand-naimark}
Every C*-algebra admits a faithful isometric *-representation on a Hilbert space~\cite{gelfand-naimark}. In the commutative case, every unital commutative C*-algebra is isometrically *-isomorphic to $C(X)$ for a compact Hausdorff space $X$ given by its character space, and $X$ is recovered from $A$ as the set of multiplicative linear functionals with the weak-* topology.
\end{theorem}

The theorem is a representation and reconstruction result. In the commutative case it is also a classification: commutative unital C*-algebras are classified by their spectra. In the noncommutative case it is not a classification, and the block decomposition of \cref{thm:block-decomposition} is what classifies the finite-dimensional noncommutative objects. The contrast is the structural lesson: reconstruction of an object from its probes is a different achievement from a list of isomorphism classes, and the first pattern is the one that generalizes.

\subsection{Symmetry data from superselection categories}

The second reconstruction template recovers symmetry data from categorical data.

\begin{theorem}[Doplicher-Roberts reconstruction]
\label{thm:dr-reconstruction}
Let $\mathcal{C}$ be a symmetric tensor *-category with conjugates, direct sums and subobjects, with $\mathrm{End}(\mathbf{1}) = \mathbb{C}$, satisfying the selection criteria of the DHR analysis of a local net of observable algebras~\cite{dhr}. Then $\mathcal{C}$ is equivalent to the category of finite-dimensional unitary representations of a compact supergroup $G$, and $G$ is unique up to isomorphism~\cite{dr-duality,dr-endomorphisms}.
\end{theorem}

The hypotheses travel with the theorem and are part of its statement: symmetric structure, conjugates, direct sums, subobjects, $\mathrm{End}(\mathbf{1}) = \mathbb{C}$, and the DHR selection criteria, which in particular involve Haag duality and exclude long-range forces in their standard form. The reconstruction is a decomposition-and-recovery template: the superselection sectors compose into a tensor category, and the symmetry group is read back from the category.

The uniqueness clause is where hypotheses bite. When the setting is relaxed from the symmetric DHR situation to a braided Galois one, the representation category of the fixed-point theory is not determined by the original category alone, and additional data, expressible as soliton representations, are required~\cite{muger}. The uniqueness in \cref{thm:dr-reconstruction} therefore does not survive hypothesis change, and any use of the theorem outside its stated hypotheses is conditional.

\begin{remark}[Probes and classification]
\label{rem:yoneda}
The reconstruction pattern is an instance of the general principle that objects can be probed by the morphisms into or out of them. A standing qualification governs any argument of this form: Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem. Faithfulness of a probe functor is a mathematical statement about a category. Whether the probes carry physical content depends on data outside the functor.
\end{remark}

\section{Admissible constructions and closure}

The construction list of the framework section becomes computable in the finite-dimensional setting: the effect of each construction on dimension vectors is arithmetic.

\begin{proposition}[Construction arithmetic]
\label{prop:construction-arithmetic}
Let $A$ and $B$ be unital finite-dimensional complex C*-algebras with dimension vectors $\mathbf{n}(A)$ and $\mathbf{n}(B)$. Then:
\begin{enumerate}
\item $\mathbf{n}(A \oplus B) = \mathbf{n}(A) \uplus \mathbf{n}(B)$, the multiset union.
\item $\mathbf{n}(A \otimes B) = \{ n m : n \in \mathbf{n}(A),\, m \in \mathbf{n}(B) \}$, the pairwise product multiset.
\item $A \oplus B$ is irreducible under direct sum if and only if one summand is zero and the other is simple.
\end{enumerate}
\end{proposition}

\begin{proof}
Direct sum concatenates block lists and matrix algebras satisfy $M_n(\mathbb{C}) \otimes M_m(\mathbb{C}) \cong M_{nm}(\mathbb{C})$, which gives the two computations. The third clause restates simplicity of the blocks: a direct sum is reducible exactly when both summands are nonzero, and the irreducible objects are the simple algebras $M_n(\mathbb{C})$.
\end{proof}

\begin{corollary}[Closure of a finite set of blocks]
\label{cor:closure}
Let $S = \{M_{n_1}(\mathbb{C}), \dots, M_{n_k}(\mathbb{C})\}$ and let $\mathcal{C} = \{\oplus, \otimes\}$. The closure $\langle S \rangle_{\mathcal{C}}$ is the class of unital finite-dimensional complex C*-algebras whose dimension vector entries lie in the multiplicative semigroup generated by $n_1, \dots, n_k$ in $\mathbb{N}_{\geq 1}$.
\end{corollary}

\begin{proof}
By \cref{prop:construction-arithmetic} every element of the closure has dimension vector entries built from the $n_i$ by multiplication, and every finite multiset of such products is realized by taking direct sums of tensor products of generators.
\end{proof}

\begin{table}[ht]
\centering
\small
\begin{tabularx}{\textwidth}{@{}L{0.2\textwidth}L{0.24\textwidth}X@{}}
\toprule
Construction & Effect on dimension vectors & Composition data it contributes \\
\midrule
Direct sum & Multiset union of the two vectors & Superselection structure of the combined system \\
Tensor product & Pairwise product multiset & Subsystem structure of the combined system \\
Extension & Not determined by dimension vectors alone & Coupling data that must be stated case by case \\
Quotient and symmetry reduction & Not determined by dimension vectors alone & Gauge identification data that must be stated case by case \\
Factorization & Splits a module into block summands & Central projections of the observable algebra \\
\bottomrule
\end{tabularx}
\caption{Effect of the admissible constructions on dimension vectors, with the composition data each construction contributes. The two computable rows are the ones the closure argument uses.}
\label{tab:constructions}
\end{table}

\begin{example}[Qubit closure]
\label{ex:qubit-closure}
For $S = \{ \mathbb{C}, M_2(\mathbb{C}) \}$ under direct sum and tensor product, the multiplicative semigroup generated by $1$ and $2$ is $\{1, 2, 4, 8, \dots\}$, and the closure is the class of algebras whose dimension vectors have entries that are powers of two. The algebras $M_3(\mathbb{C})$ and $M_2(\mathbb{C}) \oplus M_3(\mathbb{C})$ are outside the closure. The enumeration of \cref{sec:computation} checks this arithmetic.
\end{example}

The closure of a finite set of blocks under direct sum and tensor product is always infinite as a class, because tensor powers keep producing new sizes, and the closure is always decidable at the level of individual dimension vectors: entry size belongs to a finitely generated multiplicative semigroup of the positive integers, and membership in such a semigroup is decidable. The computability of the closure is a peculiarity of the finite-dimensional regime, where the constructions act on integer vectors; nothing here extends it to closure taken over the full admissible construction list of the framework section.

\subsection{Worked example: two qubits}

A single system runs through every construction of this volume and shows what each layer of the machinery returns.

Observable-algebra decompositions do not extend to the underlying state space of a two-qubit system. Let $P$ have observable algebra $\mathcal{O} = M_4(\mathbb{C})$ and state space the density operators of $\mathbb{C}^4$, with both tensor product and direct sum named as composition operations. Under direct sum, $\mathcal{O}$ is simple with dimension vector $\{4\}$, so the algebraic system is irreducible; the endomorphism multiplicity data of \cref{cor:outer-aut} give a trivial outer automorphism group. Under tensor product, $\mathcal{O} \cong M_2(\mathbb{C}) \otimes M_2(\mathbb{C})$ factors into two qubit blocks of dimension vector $\{2\}$. Restricting to $M_2(\mathbb{C}) \oplus M_2(\mathbb{C})$ inside a superselection model produces two sectors whose state space is the join of two Bloch balls by \cref{prop:states-direct-sum}. At the state level, bipartite pure states of two qubits have unique Schmidt decompositions, while mixed states have no unique decomposition into pure states: the maximally mixed state $I/4$ admits continuously many pure-state ensembles by \cref{prop:ensemble}. The algebraic layer supports a complete existence-and-uniqueness theory for observable algebras and morphisms; the state layer in the mixed regime admits no unique representation into extremal components.

\begin{remark}[The generation identity]
The structural generation statement of the program, that every admissible system is of the form $\mathcal{F}(I_1, \dots, I_n)$ with $I_i$ irreducible, is proved in the restricted regime of this section: every unital finite-dimensional complex C*-algebra is a direct sum of irreducible blocks, the construction $\mathcal{F}$ is the direct sum, and the irreducibles are the $M_n(\mathbb{C})$. The identity $\mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F} \rangle_{\mathcal{C}}$ for general admissible systems remains conjectural, and nothing in this volume upgrades its status.
\end{remark}

\section{Decomposition and morphisms}

The morphism layer of the schema distinguishes coarse-grainings, embeddings, dualities, equivalence morphisms, and limiting procedures. Decomposition interacts with each of them differently, and two of the interactions are exact.

\begin{proposition}[Embeddings and multiplicity matrices]
\label{prop:embeddings}
In the setting of \cref{thm:homs}, a unital *-homomorphism $\varphi \colon A \to B$ is injective if and only if its multiplicity matrix has no zero row. Injective unital *-homomorphisms are the embeddings of the finite-dimensional C*-category.
\end{proposition}

\begin{proof}
The restriction of $\varphi$ to the $i$-th block is a *-homomorphism out of the simple algebra $M_{n_i}(\mathbb{C})$ with unit $e_i = \varphi(p_i)$. If the $i$-th row of the multiplicity matrix is zero then $e_i = 0$ and $\varphi$ kills the $i$-th block. If some entry $r^{(i)}_j$ is positive then $e_i \neq 0$ and the homomorphism is injective on the simple block, because the kernel of a *-homomorphism out of a simple algebra is zero or everything.
\end{proof}

\begin{proposition}[Spectra of direct sums]
\label{prop:spectrum-sum}
Let $A$ and $B$ be unital commutative C*-algebras with spectra $X$ and $Y$. Then $A \oplus B \cong C(X \sqcup Y)$ and the spectrum of a direct sum is the disjoint union of the spectra.
\end{proposition}

\begin{proof}
Characters of $A \oplus B$ are unital *-homomorphisms to $\mathbb{C}$. The identity splits as $1 = 1_A + 1_B$ with $1_A 1_B = 0$, so $\chi(1_A) = \chi(1_A)^2$ in $\mathbb{C}$ and $\chi(1_A) \in \{0, 1\}$: every character restricts to a character of exactly one summand and vanishes on the other. The character space is therefore the disjoint union of the character spaces of the summands, and the Gelfand isomorphism $A \oplus B \cong C(X \sqcup Y)$ follows.
\end{proof}

Coarse-grainings behave in the opposite way. A coarse-graining can merge blocks and forget the decomposition: the map $M_2(\mathbb{C}) \oplus M_2(\mathbb{C}) \to M_2(\mathbb{C})$ sending $(x,y)$ to $(x+y)/2$ is positive and unital, and it destroys the superselection decomposition of its domain. Irreducibility is not preserved by coarse-graining, and a decomposition statement about coarse-grained systems must be justified for the target system, not inherited from the source.

Limiting procedures are the least controlled interaction. Direct sums of finite-dimensional blocks pass to direct integrals of factors in infinite-volume or continuum limits, and the block structure of the approximating algebras need not survive the limit. The decomposition theorems of this volume are finite-dimensional statements; their behavior under the limiting procedures named in the construction list is a separate problem, and nothing here claims continuity of decomposition under limit.

Dualities commute with decomposition in the commutative case by \cref{prop:spectrum-sum}, and Doplicher-Roberts reconstruction (\cref{thm:dr-reconstruction}) recovers symmetry data from decomposed sector categories. Equivalence morphisms preserve decomposition when they are *-isomorphisms of observable algebras, and only for those is the dimension vector invariant.

\section{Decomposition across the families}

The block decomposition is one row of a larger chart. The table below records the established position, for each domain in which a decomposition question is live, on the three questions this paper keeps separate: existence of a decomposition, uniqueness of the decomposition, and parameterization of the pieces. The sources are the same that supply the theorems cited in the preceding sections.

\begin{table}[ht]
\centering
\small
\begin{tabularx}{\textwidth}{@{}L{0.2\textwidth}L{0.22\textwidth}L{0.2\textwidth}X@{}}
\toprule
Domain & Existence & Uniqueness & Parameterization of the pieces \\
\midrule
Finite-dimensional C*-algebras & Direct sum into matrix blocks & Dimension vector unique up to permutation & Dimension vector is complete \\
Commutative C*-algebras & Spectrum of characters & Spectrum is unique & The spectrum itself \\
Von Neumann algebras & Direct integral into factors & Essentially unique up to measure class & No parameterization of the factors in general \\
Completely positive maps & Stinespring dilation and Kraus form & Minimal dilation unique up to unitary & Kraus rank is a normal-form invariant only \\
Bipartite pure states & Schmidt decomposition & Coefficients unique & Schmidt coefficients \\
Interacting systems & No general theorem & Fails in general & Not available \\
Wild representation categories & Indecomposable decompositions may exist & Not controlled & Finite-dimensional parameterization is impossible \\
\bottomrule
\end{tabularx}
\caption{Decomposition status by domain. The first and fifth rows are the complete cases, the fourth row is a normal form and not a classification, and the last two rows record where the pattern stops.}
\label{tab:domains}
\end{table}

The comparison makes the volume's shape visible. The complete rows are exactly the rows with a finite or parametric invariant, and every one of them is a restricted class: semisimple finite-dimensional algebras, commutative algebras, bipartite pure states. The normal-form row is the trap this volume documents at length: a canonical description that does not classify. The last two rows are theorems, not disappointments: nonunique decomposition for interacting systems and the impossibility of finite-dimensional parameterization in wild regimes are proved statements about the boundary of decomposition programs.

The von Neumann row deserves one sentence of its own. Decomposition into factors exists, and the pieces resist classification: uncountably many pairwise non-isomorphic separable type $\mathrm{II}_1$ factors sit in a single type class~\cite{mcduff}. Any program that decomposes systems and then classifies the indecomposables therefore needs its own restriction hypothesis, and the restriction is not a technical convenience.

\section{Wildness and the parameterization boundary}

The finite-dimensional decomposition theorem classifies its objects by a finite invariant. The expectation that similar parameterizations exist beyond tame regimes is false, and the falsity is a theorem.

\begin{theorem}[Tame-wild dichotomy]
\label{thm:tame-wild}
Every finite-dimensional algebra over an algebraically closed field is either derived tame or derived wild~\cite{bekkert-drozd}. Derived wildness is preserved under degeneration, and derived tameness is preserved under deformation.
\end{theorem}

\begin{theorem}[Wildness of the generic determinant]
\label{thm:wild-generic-det}
The maximal Cohen-Macaulay module theory of the generic determinant is wild~\cite{buchweitz-leuschke}: already in rank two, the isomorphism classes of modules cannot be parametrized by a finite-dimensional variety over the coefficients.
\end{theorem}

The phrase used for this phenomenon in the literature is that the representation theory is quite wild: the wildness is not merely an absence of known invariants, it is the proven absence of finite-dimensional parameterization. The technique behind the dichotomy is the theory of matrix problems, in which representations are reduced by an algorithm to normal forms for boxes and arrows; derived tameness means the reduction terminates with a one-parameter-family description of indecomposables, and derived wildness means the reduction embeds an arbitrary matrix problem, after which no finite-dimensional parameterization can exist. A parallel obstruction in equivariant stable homotopy~\cite{grevstad-may} shows that no meaningful classification of compact $C_p$-equivariant $H\underline{\mathbb{F}}_p$-modules at odd primes is to be expected, so the boundary is not confined to representation theory of algebras.

\begin{corollary}[Boundary on decomposition programs]
\label{cor:boundary}
Any program that decomposes systems into irreducibles and then parametrizes the irreducibles by finite-dimensional data is confined to tame regimes. In wild regimes the decomposition step may still exist while the parameterization step is provably unavailable.
\end{corollary}

The corollary is the volume's impossibility content. It does not contradict \cref{thm:block-decomposition}, which lives in the tamest possible regime: finite-dimensional algebras over $\mathbb{C}$ with semisimple radical-free structure. It marks the edge of the pattern. The tame-wild distinction also appears algorithmically: group isomorphism for extensions with tame quotient admits polynomial-time algorithms whose bounds fail in the wild case~\cite{grochow-qiao}, so the boundary is visible to computation as well as to parameterization.

For the structural generation program the consequence is precise. A generation theorem of the form $P \simeq \mathcal{F}(I_1, \dots, I_n)$ is achievable where the irreducibles $I_i$ come from a tame class with finite or parametric invariants. Where the irreducibles are wild, the generation step may still succeed while the classification of the generators fails, and the long-term target $\mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F} \rangle_{\mathcal{C}}$ inherits the restriction. The candidate subclasses for existence-and-uniqueness theorems, finite-dimensional quantum systems, finite groupoid models, and selected classes of topological field theories, are all tame in this sense, and the tameness of each candidate must be made explicit wherever the candidate is used.

\section{Counterexamples and boundary cases}

Three natural strengthenings of the results above fail, and the failures locate their hypotheses.

\subsection{Uniqueness without parameterization}

A tempting inference runs: decomposition is unique, therefore the irreducibles can be parametrized. The inference is false in general. Finite-dimensional algebras over an algebraically closed field satisfy the Krull-Schmidt theorem, so every such algebra decomposes uniquely into indecomposable summands up to permutation, and \cref{thm:wild-generic-det} shows that in wild regimes the indecomposables still admit no finite-dimensional parameterization. Unique decomposition and parameterization of the pieces are different achievements; the finite-dimensional C*-case of \cref{thm:block-decomposition} has both only because its indecomposables are the matrix algebras $M_n(\mathbb{C})$, indexed by a single integer.

\subsection{The C*-hypothesis}

Drop the C*-structure and \cref{thm:block-decomposition} fails at the first step. The dual numbers $\mathbb{C}[x]/(x^2)$ form a two-dimensional algebra with Jacobson radical the span of $x$, which is nonzero; the algebra is indecomposable and not simple. \Cref{lem:radical} used positivity through the spectral theorem, and without positivity nothing forces the radical to vanish. Boundary case: the class of unital finite-dimensional complex C*-algebras is exactly the class where the block decomposition with matrix blocks holds; widening to finite-dimensional algebras requires the semisimplicity hypothesis, and widening to infinite-dimensional C*-algebras replaces direct sums by the direct-integral machinery of the contrast theorem.

\subsection{Normal-form invariants}

A second tempting inference runs: every map has a canonical normal form with an invariant, therefore the maps are classified. \Cref{ex:equal-count} refutes it: two channels with minimal Kraus count one differ on a single matrix, and the invariant cannot see the difference. The general lesson is that an invariant of a normal form is not an isomorphism invariant of the classified objects. The decomposition theorems of this volume avoid the trap because their invariants are complete: the dimension vector decides isomorphism of algebras (\cref{cor:classification}), and the multiplicity matrix decides conjugacy of homomorphisms (\cref{thm:homs}). Completeness is the property the normal forms lack.

\subsection{Interacting systems}

The counterexample search found no interacting system outside the restricted subclasses with a uniqueness theorem, and none is claimed here. The failure modes named earlier, entanglement, gauge redundancy, emergence, and coupling, are open problems rather than refuted conjectures: no theorem states that interacting systems admit unique decompositions, and existence-and-uniqueness theorems are realistic only in restricted subclasses. Any analysis that needs uniqueness for an interacting system must restrict the class and prove the restriction suffices.

\section{Computational evidence}
\label{sec:computation}

Three computational artifacts accompany this paper. They are evidence about the combinatorics of the theorems above; no statement in this volume is established by them.

The first artifact is an executable taxonomy layer in Haskell. Its module declares instances of the shared family, construction, and decomposition classes for the systems treated here: matrix blocks and their direct sums, tensor products of blocks, and Kraus normal form data. Multiplicity matrices appear as data types mirroring \cref{def:multiplicity-matrix}. The names mirror the definitions of this paper and the mechanization targets listed in the accompanying verification record. The Haskell layer is computational evidence, validated against kernel-checked specifications through cross-audit, and it is not verified by any proof assistant.

The second artifact is a set of enumeration experiments in Python. One experiment enumerates dimension vectors of the closure of $\{\mathbb{C}, M_2(\mathbb{C})\}$ under direct sum and tensor product up to total dimension $64$ and checks the arithmetic of \cref{prop:construction-arithmetic}. It returns $1085$ dimension vectors, all of whose entries lie in the multiplicative semigroup $\{1, 2, 4, 8, 16, 32, 64\}$ generated by $1$ and $2$, and it confirms that $M_3(\mathbb{C})$ lies outside the closure. A second experiment enumerates multiplicity matrices for the three block pairs of \cref{tab:homs} and returns exactly $2$, $1$, and $6$ solutions, matching the conjugacy-class counts of the table entry by entry. A third computes Choi ranks of completely positive maps: for a random map of minimal rank $1$, presented Kraus families of sizes $1$, $2$, $3$, $5$, and $8$ all return Choi rank $1$ and reproduce the same map, while the identity channel and conjugation by the Pauli $Z$ operator both have rank $1$ and differ on the Pauli $X$ operator. The experiments run in seconds on ordinary hardware and record their seeds in the source.

The third artifact is a code evidence table, given in the appendix, that maps each computational claim to the file and function that exhibits it.

\section{Limitations}

The classification package of this volume has four sharp limits.

Uniqueness is a restricted phenomenon. The existence-and-uniqueness statements hold for unital finite-dimensional complex C*-algebras and their *-homomorphisms, and for the tame corners of tensor decomposition named in \cref{prop:unique-restricted}. For interacting systems only restricted-subclass realism is available: unique decomposition is not assumed anywhere in this paper.

Normal forms are not classifications. The Stinespring and Kraus results describe maps canonically; they do not classify channels up to isomorphism, and no such classification is on record.

The wildness results of \cref{thm:wild-generic-det} confine finite-dimensional parameterization to tame regimes, and the tame-wild boundary for the representation categories of physical interest, as opposed to generic algebras, is unstudied.

The structural generation identity is conjectural, the admissibility conditions that would define $\mathrm{Phys}_{\mathrm{adm}}$ are unfixed, and no result here depends on either. Doplicher-Roberts reconstruction is available only under hypotheses that include symmetric structure and the DHR selection criteria; relaxing them destroys the uniqueness clause.

No part of the mathematical content of this volume is machine-checked.

Two premises are unfixed, and no theorem above depends on them. The admissibility conditions defining $\mathrm{Phys}_{\mathrm{adm}}$ do not exist yet, so every statement quantified over admissible systems is conditional. The equivalence $\simeq$ for physical systems is open as well; this volume uses *-isomorphism of observable algebras and claims nothing about coarser identifications. Probe-based arguments carry a standing qualification, that Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem; no reconstruction result here is read as a classification result.

\section{Conclusion}

Irreducibility is relative to the composition data of a system, and the relativity is visible in concrete examples: one algebra is irreducible for the direct sum and reducible for the tensor product. Within the tamest regime, unital finite-dimensional complex C*-algebras, the decomposition theory is complete: blocks exist, the dimension vector classifies, and unital *-homomorphisms are classified by multiplicity matrices with explicit arithmetic constraints. That package is exactly as large as advertised: it classifies observable algebras and their morphisms, not states, dynamics, or composition.

Beyond the tame regime the pattern breaks in three directions, each with a theorem behind it. Normal forms do not classify: Kraus rank is an invariant of the normal form and not an isomorphism invariant of channels. Interacting systems admit no unique decomposition outside restricted subclasses. Wild representation categories forbid finite-dimensional parameterization of their indecomposables. A program that assembles systems from fundamental families by admissible constructions must therefore state its regime, and the regime that admits existence-and-uniqueness theorems is restricted, tame, and finite.

Reconstruction from probes generalizes better than classification by invariants: commutative C*-algebras are recovered from their spectra, and symmetry data are recovered from superselection categories under hypotheses that cannot be dropped. Whether the probe pattern can be unified with the reconstruction theorems into a single principle is open. What is established now is a division of labor: classification where the invariant is finite or parametric, reconstruction where probes suffice, and impossibility theorems where neither holds.

\appendix
\section{Code evidence}

The table maps each computational claim of \cref{sec:computation} to the file and function that exhibits it. Every row names code under \texttt{src/vol-03-irreducibility-decomposition/}, which accompanies this paper in the project source tree.

\begin{table}[ht]
\centering
\footnotesize
\begin{tabularx}{\textwidth}{@{}L{0.2\textwidth}L{0.18\textwidth}L{0.16\textwidth}X@{}}
\toprule
Claim & File & Function & What the code shows \\
\midrule
Dimension vector arithmetic under direct sum and tensor product & \path{exp_closure.py} & \path{closure_enumeration} & Enumerated closures match pairwise product and multiset union \\
Multiplicity matrices classify homomorphism conjugacy classes & \path{exp_multiplicity.py} & \path{enumerate_multiplicity} & Solution counts match the table, explicit homomorphisms obey the *-laws, and realizations of one matrix are conjugate \\
Kraus rank is fixed by the map while family size grows under dilation & \path{exp_kraus.py} & \path{choi_rank_dilation} & Choi rank stays constant across presented families of size 1 to 8 \\
Taxonomy instances cover blocks and decomposed algebras & \path{Instances.hs} & \path{dimVector} and \path{blockDecomposition} & Family, construction, and decomposition hooks are instantiated for blocks and decomposed algebras \\
Constructible instances compute the two constructions & \path{Instances.hs} & \path{tensorProduct} and \path{directSum} & Construction hooks agree with the arithmetic of the paper \\
\bottomrule
\end{tabularx}
\caption{Code evidence for the computational claims of this volume. Each row is judged against the named file and function.}
\label{tab:code-evidence}
\end{table}

\begin{thebibliography}{20}

\bibitem{bekkert-drozd}
V.~I. Bekkert and Y.~A. Drozd,
\emph{Tame-wild dichotomy for derived categories},
arXiv:math/0310352 (2003), doi:10.48550/arXiv.math/0310352.

\bibitem{buchweitz-leuschke}
R.-O. Buchweitz and G.~J. Leuschke,
\emph{Factoring the adjoint and maximal Cohen-Macaulay modules over the generic determinant},
arXiv:math/0505315 (2005), doi:10.48550/arXiv.math/0505315; American Journal of Mathematics \textbf{129} (2007), 943-981, doi:10.1353/ajm.2007.0022.

\bibitem{choi}
M.-D. Choi,
\emph{Completely positive linear maps on complex matrices},
Linear Algebra and its Applications \textbf{10} (1975), 285-290, doi:10.1016/0024-3795(75)90075-0.

\bibitem{dhr}
S. Doplicher, R. Haag, and J.~E. Roberts,
\emph{Local observables and particle statistics. I},
Communications in Mathematical Physics \textbf{23} (1971), 199-230, doi:10.1007/BF01877742.

\bibitem{dr-duality}
S. Doplicher and J.~E. Roberts,
\emph{A new duality theory for compact groups},
Inventiones Mathematicae \textbf{98} (1989), 157-218, doi:10.1007/BF01388849.

\bibitem{dr-endomorphisms}
S. Doplicher and J.~E. Roberts,
\emph{Endomorphisms of C*-algebras, cross products and duality for compact groups},
Annals of Mathematics \textbf{130} (1989), 75-119, doi:10.2307/1971477.

\bibitem{gelfand-naimark}
I. Gelfand and M. Naimark,
\emph{On the imbedding of normed rings into the ring of operators in Hilbert space},
Matematicheskii Sbornik \textbf{12} (1943), 197-213, English translation doi:10.1090/conm/167/16.

\bibitem{grevstad-may}
J.~F. Grevstad and C. May,
\emph{Equivariant $H\underline{\mathbb{F}}_p$-modules are wild},
arXiv:2509.17604 (2025), doi:10.48550/arXiv.2509.17604.

\bibitem{grochow-qiao}
J.~A. Grochow and Y. Qiao,
\emph{Polynomial-time isomorphism test of groups that are tame extensions},
arXiv:1507.01917 (2015), doi:10.48550/arXiv.1507.01917.

\bibitem{kraus}
K. Kraus,
\emph{General state changes in quantum theory},
Annals of Physics \textbf{64} (1971), 311-335, doi:10.1016/0003-4916(71)90108-4.

\bibitem{mcduff}
D. McDuff,
\emph{Uncountably many $\mathrm{II}_1$ factors},
Annals of Mathematics \textbf{90} (1969), 372-377, doi:10.2307/1970730.

\bibitem{muger}
M. M\"uger,
\emph{Conformal field theory and Doplicher-Roberts reconstruction},
arXiv:math-ph/0008027 (2000), doi:10.48550/arXiv.math-ph/0008027; Fields Institute Communications \textbf{30} (2001), 297-319.

\bibitem{murray-vonneumann}
F.~J. Murray and J. von Neumann,
\emph{On rings of operators. IV},
Annals of Mathematics \textbf{44} (1943), 716-808, doi:10.2307/1969107.

\bibitem{murphy}
G.~J. Murphy,
\emph{C*-Algebras and Operator Theory},
Academic Press, Boston (1990), ISBN 0-12-511360-9.

\bibitem{solomon}
R. Solomon,
\emph{A brief history of the classification of the finite simple groups},
Bulletin of the American Mathematical Society \textbf{38} (2001), 315-352, doi:10.1090/S0273-0979-01-00909-0.

\bibitem{stinespring}
W.~F. Stinespring,
\emph{Positive functions on C*-algebras},
Proceedings of the American Mathematical Society \textbf{6} (1955), 211-216, doi:10.1090/S0002-9939-1955-0069403-4.

\end{thebibliography}

\end{document}

exec
/usr/local/bin/zsh -lc 'cat src/vol-03-irreducibility-decomposition/exp_closure.py' in /Users/mlong/Documents/Development/classification-physical-systems
exec
/usr/local/bin/zsh -lc 'cat src/vol-03-irreducibility-decomposition/exp_kraus.py' in /Users/mlong/Documents/Development/classification-physical-systems
exec
/usr/local/bin/zsh -lc 'cat src/vol-03-irreducibility-decomposition/Instances.hs' in /Users/mlong/Documents/Development/classification-physical-systems
exec
/usr/local/bin/zsh -lc 'cat src/vol-03-irreducibility-decomposition/exp_multiplicity.py' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D experiment for vol-03-irreducibility-decomposition.

Evidences: Proposition 8.1 and Corollary 8.2 of the paper (dimension-vector
arithmetic for direct sum and tensor product; closure of {C, M_2} under the
two constructions equals dimension-vector entries in the multiplicative
semigroup generated by the seeds). Computational evidence only, never proof.
"""

from itertools import combinations_with_replacement


def dim_vector_total(dim_vector):
    """Total algebra dimension of a dimension vector: sum of n_i squared."""
    return sum(n * n for n in dim_vector)


def tensor_vectors(v, w):
    """Pairwise product multiset of two dimension vectors (Proposition 8.1)."""
    return sorted(n * m for n in v for m in w)


def direct_sum_vectors(v, w):
    """Multiset union of two dimension vectors (Proposition 8.1)."""
    return sorted(v + w)


def closure_enumeration(seeds, bound):
    """Enumerate dimension vectors of the closure under direct sum and tensor
    product whose total dimension is at most `bound` (Corollary 8.2)."""
    found = {tuple([s]) for s in seeds}
    found.add((1,))
    changed = True
    while changed:
        changed = False
        current = list(found)
        for v in current:
            for s in seeds:
                for cand in (tensor_vectors(list(v), [s]), direct_sum_vectors(list(v), [s])):
                    key = tuple(cand)
                    if key not in found and dim_vector_total(cand) <= bound:
                        found.add(key)
                        changed = True
    return sorted(found, key=lambda v: (dim_vector_total(v), v))


def semigroup_check(seeds, bound):
    """The multiplicative semigroup generated by the seeds, up to `bound`."""
    semigroup = {1}
    changed = True
    while changed:
        changed = False
        for n in list(semigroup):
            for s in seeds:
                if n * s <= bound and n * s not in semigroup:
                    semigroup.add(n * s)
                    changed = True
    return sorted(semigroup)


def main():
    bound = 64
    seeds = [1, 2]
    vecs = closure_enumeration(seeds, bound)
    semigroup = semigroup_check(seeds, bound)

    print("=== Closure of {C, M_2} under direct sum and tensor product ===")
    print(f"total-dimension bound: {bound}")
    print(f"dimension vectors found: {len(vecs)}")
    print(f"multiplicative semigroup of entry sizes: {semigroup}")

    # Every closure entry has sizes in the semigroup (Corollary 8.2).
    entry_ok = all(n in semigroup for v in vecs for n in v)
    print(f"all entries in semigroup: {entry_ok}")

    # Construction arithmetic on sample pairs (Proposition 8.1).
    samples = [([2], [2]), ([1, 2], [2]), ([2, 2], [2, 2]), ([1], [4])]
    for v, w in samples:
        t = tensor_vectors(v, w)
        d = direct_sum_vectors(v, w)
        print(
            f"tensor {v} x {w} -> {t} (total {dim_vector_total(t)}), "
            f"direct sum -> {d} (total {dim_vector_total(d)})"
        )

    # M_3 is outside the closure: 3 is not in the semigroup.
    print(f"M_3 in closure: {tuple([3]) in set(vecs)}")
    print("RESULT: PASS" if entry_ok and tuple([3]) not in set(vecs) else "RESULT: FAIL")


if __name__ == "__main__":
    main()

 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D experiment for vol-03-irreducibility-decomposition.

Evidences: Theorem 6.2 and the dilation remark of the paper (the minimal
Kraus rank of a completely positive map is an invariant of the normal form,
fixed by the Choi rank of the map, while non-minimal Kraus families of the
same map have inflated family size). Computational evidence only, never
proof.
"""

import numpy as np


def choi_matrix(kraus_ops):
    """Choi matrix of the map X -> sum_s K_s X K_s^*, shape (m*m? no):
    J = sum_s vec(K_s) vec(K_s)^* with vec stacking rows."""
    m, n = kraus_ops[0].shape
    vecs = [K.reshape(m * n) for K in kraus_ops]
    J = np.zeros((m * n, m * n), dtype=complex)
    for v in vecs:
        J += np.outer(v, v.conj())
    return J


def choi_rank(kraus_ops, tol=1e-9):
    """Rank of the Choi matrix: the minimal Kraus rank of the map."""
    J = choi_matrix(kraus_ops)
    vals = np.linalg.eigvalsh(J)
    return int(np.sum(vals > tol))


def apply_map(kraus_ops, X):
    return sum(K @ X @ K.conj().T for K in kraus_ops)


def nonminimal_family(K, family_size, rng):
    """A non-minimal Kraus family for the same map X -> K X K^*:
    split K into `family_size` operators K_s = a_s K with sum |a_s|^2 = 1."""
    coeffs = rng.normal(size=family_size) + 1j * rng.normal(size=family_size)
    coeffs = coeffs / np.linalg.norm(coeffs)
    return [a * K for a in coeffs]


def choi_rank_dilation():
    rng = np.random.default_rng(20261029)
    m, n = 2, 2
    K = rng.normal(size=(m, n)) + 1j * rng.normal(size=(m, n))

    print("=== Kraus rank under non-minimal dilation ===")
    base = [K]
    base_rank = choi_rank(base)
    print(f"minimal family size 1, Choi rank of the map: {base_rank}")

    X = rng.normal(size=(n, n)) + 1j * rng.normal(size=(n, n))
    X = X + X.conj().T
    ref = apply_map(base, X)

    stable = True
    for family_size in (1, 2, 3, 5, 8):
        family = nonminimal_family(K, family_size, rng)
        rank = choi_rank(family)
        same_map = np.allclose(apply_map(family, X), ref)
        print(
            f"presented family size {family_size}: Choi rank {rank}, "
            f"same map: {same_map}"
        )
        if rank != base_rank or not same_map:
            stable = False

    # Two channels with equal minimal rank are not the same map.
    I2 = np.eye(2, dtype=complex)
    Z = np.array([[1, 0], [0, -1]], dtype=complex)
    Xp = np.array([[0, 1], [1, 0]], dtype=complex)
    phi = [I2]
    psi = [Z]
    same = np.allclose(apply_map(phi, Xp), apply_map(psi, Xp))
    print(f"identity and conjugation by Z: both rank 1, same map: {same}")
    return stable and not same


def main():
    ok = choi_rank_dilation()
    print("RESULT: PASS" if ok else "RESULT: FAIL")


if __name__ == "__main__":
    main()

 succeeded in 0ms:
{-# LANGUAGE TypeFamilies #-}

-- | Module        : Instances
-- Description     : Taxonomy instances of vol-03 (irreducibility, decomposition,
--                   universal constructions) for the volume's physical systems.
-- Paper source    : papers/latex/vol-03-irreducibility-decomposition.tex
-- Taxonomy source : src/Taxonomy/ (imported, never redefined).
--
-- Instances of the family, invariant, construction, irreducibility, and
-- decomposition classes of the shared taxonomy for the systems this volume
-- classifies: matrix blocks and their direct sums (unital finite-dimensional
-- complex C*-algebras), tensor products of blocks, multiplicity matrices of
-- unital *-homomorphisms, Kraus normal-form data of completely positive maps,
-- and the two-qubit worked example. Type and method names mirror the paper's
-- definitions and the mechanization targets of
-- verification/vol-03-irreducibility-decomposition-lean-targets.md.
--
-- Claim status (docs/theorem-registry.md): this module is executable
-- computational evidence. It proves nothing; it is validated against
-- kernel-checked specifications through cross-audit and is NEVER "verified by
-- Lean".
module Instances
  ( -- * Matrix blocks and finite-dimensional C*-algebras
    MatrixBlock (..)
  , FiniteDimCStar (..)
  , DimensionVector (..)
  , dimVector
  , blockDecomposition
  , dimensionVectorComplete
    -- * Constructions on blocks
  , tensorBlock
  , directSumBlocks
  , closureSemigroup
    -- * Morphisms and multiplicity matrices
  , MultiplicityMatrix (..)
  , unitalStarHoms
  , outerAutomorphisms
    -- * States and modules
  , statesDirectSum
  , moduleFactorization
    -- * Channels and Kraus normal form
  , KrausNormalForm (..)
  , krausNormalForm
    -- * Worked example systems
  , TwoQubitSystem (..)
  , SuperselectionPair (..)
  ) where

import Taxonomy.Constructions
  ( Construction (..)
  , Constructible (..)
  , Decomposable (..)
  , Decomposition (..)
  , ExtensionKind (..)
  , Irreducible (..)
  , LimitKind (..)
  , QuotientKind (..)
  )
import Taxonomy.Equivalences (MathematicalEquivalence (..))
import Taxonomy.Families
  ( FamilyDynamicalSemigroups (..)
  , FamilyHilbertOperatorAlgebras (..)
  , FamilyTensorCategoriesComposition (..)
  )
import Taxonomy.Invariants (DimensionVector (..))

-- | A simple block M_n(C) of a unital finite-dimensional complex C*-algebra.
-- The parameter is the matrix size n >= 1. Mirrors the blocks of the paper's
-- Theorem 3.2 (block decomposition) and lean target
-- finite_dim_cstar_block_decomposition.
newtype MatrixBlock = MatrixBlock { blockSize :: Int }
  deriving (Eq, Ord, Show)

-- | A unital finite-dimensional complex C*-algebra presented by its block
-- list, that is, by a direct sum of matrix blocks. Mirrors Definition 2.6
-- (dimension vector) and lean targets dimension_vector_complete_invariant and
-- dimension_vector_uniqueness.
newtype FiniteDimCStar = FiniteDimCStar { blocks :: [MatrixBlock] }
  deriving (Eq, Show)

-- | The multiset of matrix sizes of a decomposed algebra, unordered. The
-- construction from a block list sorts the sizes so that equality of
-- dimension vectors is equality of sorted lists, the paper's permutation
-- uniqueness.
dimVector :: FiniteDimCStar -> DimensionVector
dimVector (FiniteDimCStar bs) = DimensionVector (sorted (map blockSize bs))
  where
    sorted [] = []
    sorted (x : xs) = sorted [y | y <- xs, y < x] ++ [x] ++ sorted [y | y <- xs, y >= x]

-- | The block decomposition of a decomposed algebra: the factors of
-- DEF-022 with construction DirectSum. Mirrors Theorem 3.2.
blockDecomposition :: FiniteDimCStar -> [MatrixBlock]
blockDecomposition = blocks

-- | Complete-invariant check of Corollary 3.3: two algebras are
-- *-isomorphic exactly when their dimension vectors agree as multisets.
-- Computational evidence for lean target dimension_vector_complete_invariant.
dimensionVectorComplete :: FiniteDimCStar -> FiniteDimCStar -> Bool
dimensionVectorComplete a b = dimVector a == dimVector b

-- | Tensor product of blocks: M_n (x) M_m = M_{nm}. Mirrors
-- Proposition 8.1 and lean target tensor_block_product.
tensorBlock :: MatrixBlock -> MatrixBlock -> MatrixBlock
tensorBlock (MatrixBlock n) (MatrixBlock m) = MatrixBlock (n * m)

-- | Direct sum of decomposed algebras: concatenation of block lists.
-- Mirrors Proposition 8.1.
directSumBlocks :: FiniteDimCStar -> FiniteDimCStar -> FiniteDimCStar
directSumBlocks (FiniteDimCStar as) (FiniteDimCStar bs) = FiniteDimCStar (as ++ bs)

-- | Closure of a set of block sizes under direct sum and tensor product:
-- the dimension-vector entries of the closure lie in the multiplicative
-- semigroup generated by the seeds. Mirrors Corollary 8.2 and lean target
-- closure_semigroup.
closureSemigroup :: [Int] -> Int -> [Int]
closureSemigroup seeds bound = go [1]
  where
    go acc =
      let next = [n * s | n <- acc, s <- seeds, n * s <= bound, n * s `notElem` acc]
      in if null next then filter (/= 0) acc else go (acc ++ next)

-- | A multiplicity matrix R = (r_i^j) of unital *-homomorphisms: rows are
-- indexed by domain blocks, columns by codomain blocks. Mirrors Definition
-- 4.1 and lean target unital_star_hom_classification.
newtype MultiplicityMatrix = MultiplicityMatrix { multRows :: [[Int]] }
  deriving (Eq, Show)

-- | Constraint check of Definition 4.1: k_i^j = n_i * r_i^j with
-- sum_i k_i^j = m_j for every codomain block j. When the constraints hold,
-- the matrix names one conjugacy class of unital *-homomorphisms by
-- Theorem 4.2.
unitalStarHoms :: FiniteDimCStar -> FiniteDimCStar -> MultiplicityMatrix -> Bool
unitalStarHoms dom cod (MultiplicityMatrix rows) =
  length rows == length (blocks dom)
    && all (\r -> length r == length (blocks cod)) rows
    && and [ sum [ blockSize (blocks dom !! i) * (rows !! i !! j) | i <- [0 .. k - 1] ]
             == blockSize (blocks cod !! j)
           | j <- [0 .. l - 1] ]
  where
    k = length (blocks dom)
    l = length (blocks cod)

-- | Outer automorphisms of a decomposed algebra: permutations of blocks with
-- equal size. Mirrors Corollary 4.3 and lean target
-- outer_automorphism_permutation. The result lists the admissible
-- permutations of the block index set as index maps.
outerAutomorphisms :: FiniteDimCStar -> [[Int]]
outerAutomorphisms (FiniteDimCStar bs) =
  [ perm
  | perm <- permutations [0 .. length bs - 1]
  , and [ blockSize (bs !! i) == blockSize (bs !! (perm !! i)) | i <- [0 .. length bs - 1] ]
  ]
  where
    permutations [] = [[]]
    permutations xs = [y : zs | (y, rest) <- picks xs, zs <- permutations rest]
    picks [] = []
    picks (y : ys) = (y, ys) : [(z, y : zs) | (z, zs) <- picks ys]

-- | States on a direct sum: the weight of the first block and the normalized
-- restrictions determine the state uniquely (convex join). Represented here
-- by the weight data. Mirrors Proposition 3.7 and lean target
-- states_direct_sum_join.
statesDirectSum :: Double -> FiniteDimCStar -> Maybe (Double, [Double])
statesDirectSum lambda (FiniteDimCStar bs)
  | lambda < 0 || lambda > 1 = Nothing
  | otherwise = Just (lambda, replicate (length bs) (1 / fromIntegral (length bs)))

-- | Factorization of modules over a decomposed algebra: a module is the
-- direct sum of its block summands, with multiplicities r_i = dim(p_i M)/n_i.
-- Represented by the multiplicity vector. Mirrors Proposition 4.5 and lean
-- target module_factorization.
moduleFactorization :: FiniteDimCStar -> [Int] -> Maybe [Int]
moduleFactorization (FiniteDimCStar bs) dims
  | length dims /= length bs = Nothing
  | any (< 0) dims = Nothing
  | otherwise = Just [d `div` n | (MatrixBlock n, d) <- zip bs dims, d `mod` n == 0]

-- | Kraus normal-form data of a completely positive map: the operator family
-- size together with the minimal count (Choi rank). Mirrors Theorem 6.2 and
-- lean target kraus_normal_form_uniqueness. The two fields differ exactly
-- when the dilation is non-minimal.
data KrausNormalForm = KrausNormalForm
  { familySize :: Int
    -- ^ Number of Kraus operators in the presented family.
  , minimalKrausRank :: Int
    -- ^ Choi rank of the underlying map; invariant of the normal form.
  }
  deriving (Eq, Show)

-- | The invariant of the normal form: the minimal count is fixed by the map,
-- the family size is inflated by non-minimal dilation. The output records
-- whether the presented family is minimal.
krausNormalForm :: KrausNormalForm -> (Int, Bool)
krausNormalForm knf = (minimalKrausRank knf, familySize knf == minimalKrausRank knf)

-- | The two-qubit worked example of the paper: observable algebra M_4 with
-- both composition data available. Under DirectSum the system is
-- irreducible; under TensorProduct it factors as M_2 (x) M_2.
data TwoQubitSystem = TwoQubitSystem
  { twoQubitAlgebra :: FiniteDimCStar
    -- ^ The observable algebra M_4, a single block.
  , tensorFactors :: [MatrixBlock]
    -- ^ The tensor factorization into two blocks of size 2.
  }
  deriving (Eq, Show)

-- | The superselection pair M_2 + M_2 of the paper's worked example: two
-- sectors, each a qubit block.
newtype SuperselectionPair = SuperselectionPair (FiniteDimCStar, FiniteDimCStar)
  deriving (Eq, Show)

-- | DEF-021: a matrix block is irreducible relative to DirectSum. The
-- instance asserts the composition operation relative to which irreducibility
-- is judged, exactly as the paper's Definition 2.2 requires.
instance Irreducible MatrixBlock where
  irreducibilityBasis _ = DirectSum

-- | DEF-021: a decomposed algebra is judged for irreducibility relative to
-- DirectSum; decomposition is supplied by 'Decomposable' below.
instance Irreducible FiniteDimCStar where
  irreducibilityBasis _ = DirectSum

-- | DEF-022: the decomposition of a decomposed algebra into simple blocks.
-- Each factor is packaged as a single-block algebra, the irreducible object
-- of the direct-sum composition.
instance Decomposable FiniteDimCStar where
  decomposition (FiniteDimCStar []) = Nothing
  decomposition (FiniteDimCStar bs) =
    Just (Decomposition DirectSum [FiniteDimCStar [b] | b <- bs])

-- | DEF-022: no decomposition of a simple block under DirectSum is supplied;
-- by the paper's Theorem 3.2 none exists when the block is nonzero.
instance Decomposable MatrixBlock where
  decomposition _ = Nothing

-- | DEF-023: the two computable admissible constructions on decomposed
-- algebras. The hooks for extension, limits, colimits, and quotient return
-- Nothing, matching the paper's Table 7 record that these constructions are
-- not determined by dimension vectors alone.
instance Constructible FiniteDimCStar where
  type Composite FiniteDimCStar = FiniteDimCStar
  tensorProduct (FiniteDimCStar as) (FiniteDimCStar bs) =
    Just (FiniteDimCStar [tensorBlock a b | a <- as, b <- bs])
  directSum a b = Just (directSumBlocks a b)
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

-- | DEF-023: constructions on a single block.
instance Constructible MatrixBlock where
  type Composite MatrixBlock = FiniteDimCStar
  tensorProduct a b = Just (FiniteDimCStar [tensorBlock a b])
  directSum a b = Just (FiniteDimCStar [a, b])
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

-- | DEF-027: operator-algebra data of a decomposed system is its dimension
-- vector, the paper's complete invariant.
instance FamilyHilbertOperatorAlgebras FiniteDimCStar where
  type OperatorAlgebraData FiniteDimCStar = DimensionVector
  operatorAlgebraData = dimVector

-- | DEF-032: dynamical-semigroup data of a completely positive map is its
-- Kraus normal form; the instance carries the normal-form data named in the
-- paper's Theorem 6.2.
instance FamilyDynamicalSemigroups KrausNormalForm where
  type DynamicalSemigroupData KrausNormalForm = KrausNormalForm
  dynamicalSemigroupData = id

-- | DEF-033: compositional data of the two-qubit system is its tensor
-- factorization into blocks.
instance FamilyTensorCategoriesComposition TwoQubitSystem where
  type TensorCategoryData TwoQubitSystem = [MatrixBlock]
  tensorCategoryData = tensorFactors

-- | Corollary 3.3 at the value level: mathematical equivalence of decomposed
-- algebras is equality of dimension vectors.
instance MathematicalEquivalence FiniteDimCStar where
  mathematicallyEquivalent = dimensionVectorComplete

 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D experiment for vol-03-irreducibility-decomposition.

Evidences: Theorem 4.2 and Table 6 of the paper (unital *-homomorphisms
between decomposed finite-dimensional C*-algebras correspond to multiplicity
matrices; the conjugacy-class counts for the three small block pairs of the
table are 2, 1, and 6). Computational evidence only, never proof.
"""

from itertools import product

import numpy as np


def multiplicity_solutions(dom_sizes, cod_sizes):
    """All multiplicity matrices r[i][j] >= 0 with
    k[i][j] = dom_sizes[i] * r[i][j] and sum_i k[i][j] = cod_sizes[j]
    (Definition 4.1 of the paper)."""
    k = len(dom_sizes)
    l = len(cod_sizes)
    solutions = []
    for flat in product(range(0, max(cod_sizes) + 1), repeat=k * l):
        rows = [list(flat[i * l:(i + 1) * l]) for i in range(k)]
        ok = True
        for j in range(l):
            total = sum(dom_sizes[i] * rows[i][j] for i in range(k))
            if total != cod_sizes[j]:
                ok = False
                break
        if ok:
            solutions.append(rows)
    return solutions


def enumerate_multiplicity():
    """The three block pairs of the paper's Table 6, followed by the explicit
    homomorphism and conjugacy checks of Theorem 4.2."""
    cases = [
        ("C + M_2 -> M_3", [1, 2], [3], 2),
        ("M_2 -> M_2 + M_2", [2], [2, 2], 1),
        ("C + C -> C + M_2", [1, 1], [1, 2], 6),
    ]
    results = []
    for name, dom, cod, expected in cases:
        sols = multiplicity_solutions(dom, cod)
        observed = len(sols)
        match = observed == expected
        results.append((name, dom, cod, observed, expected, match, sols))
        print(f"{name}: solutions={observed} expected={expected} match={match}")
        for s in sols:
            print(f"    r = {s}")
    hom_ok = hom_property_tests()
    results.append(("homomorphism and conjugacy checks", [], [], int(hom_ok), 1, hom_ok, []))
    return results


def hom_property_tests():
    """Construct explicit homomorphisms from multiplicity matrices and test the
    *-homomorphism and conjugacy statements of Theorem 4.2."""
    print("=== Explicit homomorphisms from multiplicity matrices ===")
    ok = True

    # Case C + M_2 -> M_3, solution (1,1): scalar on coord 0, M_2 on coords 1,2.
    def phi_case11(a, b):
        # a is scalar (1x1), b is 2x2
        out = np.zeros((3, 3), dtype=complex)
        out[0, 0] = a[0, 0]
        out[1:3, 1:3] = b
        return out

    rng = np.random.default_rng(20261029)
    for _ in range(5):
        a = rng.normal(size=(1, 1)) + 1j * rng.normal(size=(1, 1))
        a2 = rng.normal(size=(1, 1)) + 1j * rng.normal(size=(1, 1))
        b = rng.normal(size=(2, 2)) + 1j * rng.normal(size=(2, 2))
        b2 = rng.normal(size=(2, 2)) + 1j * rng.normal(size=(2, 2))
        lhs = phi_case11(a @ a2, b @ b2)
        rhs = phi_case11(a, b) @ phi_case11(a2, b2)
        adj = phi_case11(a.conj().T, b.conj().T)
        if not (np.allclose(lhs, rhs) and np.allclose(adj, phi_case11(a, b).conj().T)):
            ok = False
    print("*-homomorphism laws for the (1,1) class: checked on 5 random pairs")

    # Conjugacy: same multiplicity matrix, different decompositions -> conjugate.
    # Diagonal embedding M_2 -> M_2 + M_2 realized with random unitaries.
    U1 = np.linalg.qr(rng.normal(size=(2, 2)) + 1j * rng.normal(size=(2, 2)))[0]
    U2 = np.linalg.qr(rng.normal(size=(2, 2)) + 1j * rng.normal(size=(2, 2)))[0]
    U = np.block([[U1, np.zeros((2, 2), dtype=complex)],
                  [np.zeros((2, 2), dtype=complex), U2]])
    for _ in range(5):
        x = rng.normal(size=(2, 2)) + 1j * rng.normal(size=(2, 2))
        phi1 = np.block([[x, np.zeros((2, 2), dtype=complex)],
                         [np.zeros((2, 2), dtype=complex), x]])
        phi2 = np.block([[U1 @ x @ U1.conj().T, np.zeros((2, 2), dtype=complex)],
                         [np.zeros((2, 2), dtype=complex), U2 @ x @ U2.conj().T]])
        conj = U.conj().T @ phi2 @ U
        if not np.allclose(conj, phi1):
            ok = False
    print("conjugacy of two realizations of the diagonal embedding: checked on 5 random x")

    # Distinct multiplicity matrices give non-conjugate maps: the rank of the
    # image of the M_2 block projection p_2 is a conjugacy invariant.
    phi_p2_class11 = phi_case11(np.zeros((1, 1)), np.eye(2))
    phi_p2_class30 = np.zeros((3, 3), dtype=complex)
    k1 = np.linalg.matrix_rank(phi_p2_class11)
    k2 = np.linalg.matrix_rank(phi_p2_class30)
    print(f"rank of image of the M_2 block projection: class (1,1) gives {k1}, class (3,0) gives {k2}")
    if k1 == k2:
        ok = False
    return ok


def main():
    print("=== Multiplicity matrices for small block pairs ===")
    results = enumerate_multiplicity()
    all_match = all(r[5] for r in results)

    # Rank-matrix consistency for one solution of the first case.
    dom, sol = [1, 2], [[3], [0]]
    k_matrix = [[dom[i] * sol[i][j] for j in range(len(sol[0]))] for i in range(len(dom))]
    print(f"rank matrix k for r = {sol}: {k_matrix}, column sums "
          f"{[sum(row[j] for row in k_matrix) for j in range(len(sol[0]))]}")
    hom_ok = hom_property_tests()
    print("RESULT: PASS" if all_match and hom_ok else "RESULT: FAIL")


if __name__ == "__main__":
    main()

exec
/usr/local/bin/zsh -lc "sed -n '220,480p' papers/latex/vol-03-irreducibility-decomposition.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
\]
Write $k(R) = (k^{(i)}_j)$ for the induced rank matrix.
\end{definition}

\begin{theorem}[Classification of unital *-homomorphisms]
\label{thm:homs}
Let $A$ and $B$ be unital finite-dimensional complex C*-algebras with fixed block presentations as above. Unital *-homomorphisms $\varphi \colon A \to B$, up to unitary conjugacy in $B$, correspond bijectively to multiplicity matrices $R$ from $A$ to $B$. The correspondence sends $\varphi$ to the rank matrix $k^{(i)}_j = \operatorname{rank}(\varphi(p_i) q_j)$, where $p_i$ is the $i$-th block projection of $A$ and $q_j$ the $j$-th block projection of $B$. Two unital *-homomorphisms are unitarily conjugate in $B$ if and only if their multiplicity matrices agree.
\end{theorem}

\begin{proof}
Let $\varphi \colon A \to B$ be a unital *-homomorphism. Set $e_i = \varphi(p_i)$; these are orthogonal projections of $B$ with $\sum_i e_i = 1$, and each $e_i$ commutes with $Z(B)$, so $e_i = \bigoplus_j e_i^{(j)}$ with $e_i^{(j)} \in M_{m_j}(\mathbb{C})$ a projection. Put $k^{(i)}_j = \operatorname{rank}(e_i^{(j)})$; then $\sum_i k^{(i)}_j = m_j$.

The restriction $\varphi_i \colon p_i A p_i \to e_i B e_i$ is a unital *-homomorphism from $M_{n_i}(\mathbb{C})$ onto a subalgebra of $\bigoplus_j M_{k^{(i)}_j}(\mathbb{C})$, hence it is a tuple of *-homomorphisms $\psi^{(i)}_j \colon M_{n_i}(\mathbb{C}) \to M_{m_j}(\mathbb{C})$ with $\psi^{(i)}_j(1) = e_i^{(j)}$. A nonzero *-homomorphism out of a simple algebra is injective, and an injective *-homomorphism $M_{n}(\mathbb{C}) \to M_{m}(\mathbb{C})$ with $\psi(1)$ of rank $k$ exists only when $k = n r$ for some $r \geq 0$, in which case $\psi(M_n)$ is unitarily conjugate inside $M_m$ to $M_n \otimes 1_r$ acting on $\mathbb{C}^n \otimes \mathbb{C}^r$. Thus $k^{(i)}_j = n_i r^{(i)}_j$ for a unique $r^{(i)}_j \in \mathbb{N}$.

Conversely, given a multiplicity matrix $R$, choose for each $j$ a decomposition $\mathbb{C}^{m_j} \cong \bigoplus_i (\mathbb{C}^{n_i} \otimes \mathbb{C}^{r^{(i)}_j})$; the summands have total dimension $\sum_i n_i r^{(i)}_j = m_j$, so the decomposition exists. Define $\varphi$ blockwise by letting $p_i A p_i$ act on the $i$-th summand and as zero elsewhere. This is a unital *-homomorphism with rank matrix $k(R)$.

Unitary conjugacy preserves ranks of projections, so distinct multiplicity matrices give non-conjugate homomorphisms. Two homomorphisms with the same multiplicity matrix are conjugate: for each $j$ choose a unitary of $M_{m_j}$ carrying the chosen decomposition of $\mathbb{C}^{m_j}$ of the first homomorphism to that of the second; the direct sum of these unitaries conjugates the homomorphisms in $B$.
\end{proof}

\begin{corollary}[Outer automorphisms]
\label{cor:outer-aut}
Let $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$. Automorphisms of $A$, modulo inner automorphisms, are classified by permutations of the blocks with equal dimension vector entries. Concretely, $\mathrm{Aut}(A)/\mathrm{Inn}(A)$ is isomorphic to the group of permutations $\sigma$ of $\{1, \dots, k\}$ with $n_{\sigma(i)} = n_i$ for all $i$.
\end{corollary}

\begin{proof}
By \cref{thm:homs} a unital *-endomorphism of $A$ is a multiplicity matrix $R$ with $\sum_i n_i r^{(i)}_j = n_j$ for all $j$. An automorphism is invertible, so the induced map on $K_0$, which sends the $i$-th basis element to $\sum_j r^{(i)}_j$ times the $j$-th, is a permutation matrix; hence $R$ is a permutation matrix $\delta_{j, \sigma(i)}$ with $n_i = n_{\sigma(i)}$. Every such $R$ is realized by the homomorphism permuting equal blocks, and such homomorphisms are outer unless $\sigma$ is the identity and the homomorphism is inner.
\end{proof}

\begin{example}[Two homomorphisms into $M_3$]
\label{ex:two-homs}
Take $A = \mathbb{C} \oplus M_2(\mathbb{C})$ and $B = M_3(\mathbb{C})$. A multiplicity matrix is a pair $(r^{(1)}, r^{(2)}) \in \mathbb{N}^2$ with $1 \cdot r^{(1)} + 2 \cdot r^{(2)} = 3$. The solutions are $(3, 0)$ and $(1, 1)$. There are exactly two conjugacy classes of unital *-homomorphisms $A \to M_3(\mathbb{C})$: one in which the $M_2$ summand acts as zero, and one in which the scalar summand acts on a one-dimensional summand and the $M_2$ block acts on the remaining $\mathbb{C}^2$. The classification is exact, small, and verifiable by hand.
\end{example}

\begin{table}[ht]
\centering
\small
\begin{tabularx}{\textwidth}{@{}L{0.18\textwidth}L{0.16\textwidth}L{0.26\textwidth}X@{}}
\toprule
Domain & Codomain & Multiplicity data & Conjugacy classes \\
\midrule
$\mathbb{C} \oplus M_2$ & $M_3$ & $r^{(1)}_1 + 2 r^{(2)}_1 = 3$ & Exactly two, given by $(3,0)$ and $(1,1)$ \\
$M_2$ & $M_2 \oplus M_2$ & $2 r^{(1)}_1 = 2$ and $2 r^{(1)}_2 = 2$ & Exactly one, the diagonal embedding \\
$\mathbb{C} \oplus \mathbb{C}$ & $\mathbb{C} \oplus M_2$ & Column sums $(1, 2)$ of nonnegative integers & Exactly six, two choices in column one and three in column two \\
\bottomrule
\end{tabularx}
\caption{Multiplicity matrices for three small block pairs. Each row of the table is an exact count of conjugacy classes of unital *-homomorphisms.}
\label{tab:homs}
\end{table}

The theorem and its corollary give a restricted existence-and-uniqueness package for morphisms. The restriction is essential: the classification is of *-homomorphisms of observable algebras up to unitary conjugacy in the codomain. Nothing is claimed about morphisms of states, channels, or dynamics, where the later sections show that the analogous uniqueness statements fail.

\subsection{Modules and factorization}

The factorization construction of the admissible list has a complete finite-dimensional form: modules over a decomposed algebra decompose into blocks.

\begin{proposition}[Module factorization]
\label{prop:module-factorization}
Let $A = \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ and let $M$ be a finite-dimensional left $A$-module. Then $M = \bigoplus_{i=1}^{k} p_i M$ uniquely as $A$-modules, each summand $p_i M$ is a module over the simple block $M_{n_i}(\mathbb{C})$, and $p_i M \cong (\mathbb{C}^{n_i})^{\oplus r_i}$ for a unique multiplicity $r_i \geq 0$. Two modules are isomorphic if and only if their multiplicity vectors agree.
\end{proposition}

\begin{proof}
The projections $p_i$ are central and orthogonal with $\sum_i p_i = 1$, so $M = \bigoplus_i p_i M$ as vector spaces, and each summand is stable under $A$ because $p_i$ is central. A module over $M_{n_i}(\mathbb{C})$ is semisimple with unique simple module $\mathbb{C}^{n_i}$, so $p_i M \cong (\mathbb{C}^{n_i})^{\oplus r_i}$ with $r_i = \dim p_i M / n_i$ determined by the module. Isomorphism of modules preserves the central idempotent decomposition and the multiplicities, and conversely equal multiplicity vectors give isomorphic modules.
\end{proof}

The proposition is the representation-theoretic face of \cref{thm:homs}: the multiplicity vector of a module is the column of a multiplicity matrix in the endomorphism case. It also states the uniqueness of factorization in the module category, and the uniqueness is total in this regime: unlike the multipartite state decompositions of the next section, the module decomposition of a semisimple algebra has no nonunique cases.

\begin{remark}[$K$-theoretic bookkeeping]
\label{rem:k-theory}
The multiplicity vector of a module, the dimension vector of an algebra, and the rank matrix of a homomorphism are three views of the same combinatorics. Formally, the Grothendieck group $K_0(A)$ of a unital finite-dimensional complex C*-algebra is the free abelian group on the $k$ simple classes, $K_0(A) \cong \mathbb{Z}^k$, the tensor product induces the pairwise product of basis indices via $M_{n_i} \otimes M_{m_j} \cong M_{n_i m_j}$, and a unital *-homomorphism acts on $K_0$ by the transpose of its multiplicity matrix: the image of a minimal projection of block $i$ has rank $r^{(i)}_j$ in block $j$. The classification of \cref{thm:homs} is therefore a statement about morphisms of free abelian groups with nonnegativity constraints, which is one reason the result is computable.
\end{remark}

\section{Uniqueness of decomposition}

This section collects the positive uniqueness statements available in the finite-dimensional setting and states, at the level the evidence supports, where uniqueness stops.

\subsection{Where uniqueness holds}

\begin{proposition}[Uniqueness in the restricted classes]
\label{prop:unique-restricted}
Uniqueness of decomposition up to permutation of isomorphic factors holds in each of the following restricted classes.
\begin{enumerate}
\item Unital finite-dimensional complex C*-algebras under direct sum: \cref{thm:block-decomposition}.
\item Unital *-homomorphisms of such algebras up to unitary conjugacy: \cref{thm:homs}.
\item Tensor factorizations into prime-dimensional factors: if a finite-dimensional Hilbert space is written as a tensor product of factors of prime dimension, the multiset of factor dimensions is unique up to permutation, by unique prime factorization of the total dimension.
\item Bipartite pure states of a finite-dimensional bipartite system, up to the Schmidt decomposition: the Schmidt coefficients are unique, and the left and right Schmidt subspaces are unique as subspaces.
\end{enumerate}
\end{proposition}

The third and fourth items are the tame corners of quantum theory: a fixed tensor structure with finitely many factors. Factorizations into composite dimensions are not unique, as $\mathbb{C}^2 \otimes \mathbb{C}^6 \cong \mathbb{C}^3 \otimes \mathbb{C}^4$ shows, so the third item restricts to prime dimensions on purpose. The fourth is the strongest state-level uniqueness statement available without further structure, and it fails as soon as the state is multipartite with more than two factors or mixed, as the next subsection records.

\subsection{Where uniqueness fails}

\begin{remark}[Multipartite and mixed states]
Tensor decomposition of a multipartite pure state is not unique in general: distinct sets of factor vectors can realize the same state, and the minimal number of product terms is not a complete invariant. For mixed states the situation is worse, as the following proposition records. Any decomposition claim about states must therefore name its class, and the restricted classes of \cref{prop:unique-restricted} are the ones the evidence supports.
\end{remark}

\begin{proposition}[Ensemble nonuniqueness]
\label{prop:ensemble}
Every mixed density operator $\rho$, that is, every density operator of rank at least two, admits infinitely many distinct decompositions into pure states. Pure states are the only exceptions: a rank-one projector is an extreme point of the state space and admits no nontrivial decomposition.
\end{proposition}

\begin{proof}
Let $\rho = \sum_{k=1}^{r} \lambda_k |v_k\rangle\langle v_k|$ be the spectral decomposition with $r \geq 2$ and all $\lambda_k > 0$. Every choice of an isometry $U \colon \mathbb{C}^{r} \to \mathbb{C}^{m}$ with $m \geq r$ produces a pure-state ensemble of $\rho$ through the unitary-mixing construction: the unnormalized vectors $|\phi_j\rangle = \sum_{k=1}^{r} U_{jk} \sqrt{\lambda_k} |v_k\rangle$ for $j = 1, \dots, m$ satisfy $\sum_j |\phi_j\rangle\langle\phi_j| = \rho$, because $U^* U = I_r$ rearranges the spectral sum. The corresponding ensemble consists of the normalized pure states $|\phi_j\rangle/\|\phi_j\|$ with probabilities $p_j = \|\phi_j\|^2$. Varying $U$ over the unitary group gives continuously many distinct ensembles, and two ensembles related by no unitary mixing differ as decompositions. In the qubit case $\rho = I/2$ the construction reads $I/2 = \frac{1}{2}(|0\rangle\langle 0| + |1\rangle\langle 1|) = \frac{1}{2}(|+\rangle\langle +| + |-\rangle\langle -|)$, and every orthonormal basis of $\mathbb{C}^2$ gives a new decomposition.
\end{proof}

The proposition is the state-level counterpart of the normal-form warning: every mixed state has a canonical spectral decomposition, and no decomposition into pure states is unique. Uniqueness returns only in the restricted bipartite case of \cref{prop:unique-restricted}.

\begin{remark}[Interacting systems]
Interacting physical systems need not admit unique decompositions. Entanglement, emergent phenomena, gauge redundancy, and nontrivial interactions each break naive decomposability: a gauge-invariant state does not split along the subsystem decomposition of the underlying Hilbert space; a coupled system's observable algebra need not be the tensor product of the factor algebras; and emergent degrees of freedom need not appear as factors of any microscopic decomposition. Existence-and-uniqueness theorems are realistic only in carefully restricted subclasses: finite-dimensional quantum systems with fixed tensor structure, finite groupoid models, and selected classes of topological field theories. This paper proves uniqueness in the first of those regimes at the level of observable algebras and morphisms and claims nothing for the others.
\end{remark}

\begin{remark}[Gauge redundancy]
Under a gauge quotient, the decomposition of a system depends on the choice of subalgebra retained after reduction. Two systems with isomorphic reduced observable algebras can carry non-isomorphic unreduced data, and the reduction map does not preserve tensor decompositions in general. Decomposition after quotient is therefore a different problem from decomposition before quotient, and the admissible construction list marks quotient as a construction whose contribution to $\mathcal{C}$ must be stated case by case.
\end{remark}

\section{Normal forms and channels}
\label{sec:normal-forms}

Normal form theorems describe every object of a class in a canonical way without classifying the objects up to isomorphism. The distinction is sharp in the theory of completely positive maps, and this section states the results with the distinction in force.

\subsection{Stinespring dilation}

\begin{theorem}[Stinespring]
\label{thm:stinespring}
Let $A$ be a unital C*-algebra, $H$ a Hilbert space, and $\Phi \colon A \to B(H)$ completely positive. Then there exist a Hilbert space $K$, a *-representation $\pi \colon A \to B(K)$, and a bounded operator $V \colon H \to K$ with $\Phi(a) = V^* \pi(a) V$ for all $a \in A$. Among such dilations the minimal one, in which $K = \overline{\pi(A) V H}$, is unique up to a unitary intertwiner.
\end{theorem}

The construction~\cite{stinespring} is the GNS construction adapted to a completely positive map. On the algebraic tensor product $A \otimes H$ define the semidefinite form
\[
\langle a \otimes \xi, a' \otimes \xi' \rangle_\Phi = \langle \xi, \Phi(a^* a') \xi' \rangle,
\]
quotient by the null space, and complete to obtain $K_0$ with $\pi(a)(b \otimes \xi) = ab \otimes \xi$ and $V \xi = 1 \otimes \xi$. Complete positivity is exactly the condition that makes the form positive semidefinite and $\pi$ multiplicative; for general positive maps the construction breaks at this step. Minimality replaces $K_0$ by the closed span $\overline{\pi(A) V H}$, and any two minimal dilations are intertwined by a unitary, because both realize the same GNS pair up to the universal property of the construction. The theorem is a normal form for completely positive maps: every completely positive map has a canonical representation-theoretic envelope, and the minimal envelope is unique.

\subsection{Kraus form and its status}

In finite dimension the dilation theorem has a matrix form.

\begin{theorem}[Kraus normal form]
\label{thm:kraus}
Every completely positive map $\Phi \colon M_n(\mathbb{C}) \to M_m(\mathbb{C})$ can be written $\Phi(X) = \sum_{s=1}^{r} K_s X K_s^*$ with Kraus operators $K_s \colon \mathbb{C}^n \to \mathbb{C}^m$. The minimal number $r$ of Kraus operators equals the rank of the Choi matrix $J(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij})$. Two Kraus families $(K_s)_{s=1}^{r}$ and $(L_t)_{t=1}^{r}$ of minimal size represent the same map if and only if $L_t = \sum_s u_{ts} K_s$ for a unitary $u \in U(r)$.
\end{theorem}

\begin{proof}
The Choi matrix~\cite{choi,kraus} of a completely positive map is positive semidefinite, and a spectral decomposition $J(\Phi) = \sum_{s=1}^{r} \lambda_s v_s v_s^*$ with $\lambda_s > 0$ yields Kraus operators $K_s = \sqrt{\lambda_s} \, \mathrm{mat}(v_s)$ of minimal count $r = \operatorname{rank}(J(\Phi))$, where vec stacks the columns of a matrix and mat is its inverse; conversely any Kraus family of size $r$ produces $J(\Phi) = \sum_s \mathrm{vec}(K_s) \mathrm{vec}(K_s)^*$ of rank at most $r$. Equality of two maps is equality of their Choi matrices, and two positive semidefinite factorizations $J = \sum_s v_s v_s^* = \sum_t w_t w_t^*$ of the same rank are related by a unitary change of frame $w_t = \sum_s u_{ts} v_s$. Unpacking $\mathrm{vec}$ gives the statement on Kraus operators.
\end{proof}

Minimal Kraus rank does not separate isomorphism classes of channels. Every unitary channel has minimal Kraus rank one, and distinct unitaries give non-isomorphic channels with fixed-point algebras of different dimensions (\cref{ex:equal-count}). Non-minimal dilations inflate the presented family size without changing the map. Kraus rank therefore classifies minimal dilations of individual maps and nothing more.

\begin{example}[Equal count, different channels]
\label{ex:equal-count}
Both $\Phi(X) = X$ and $\Psi(X) = Z X Z$ on $M_2(\mathbb{C})$, with $Z$ the Pauli $Z$ operator, have minimal Kraus count one. They are not unitarily equivalent channels: the fixed-point algebra of $\Phi$ is all of $M_2(\mathbb{C})$, of complex dimension four, while the fixed-point algebra of $\Psi$ is the diagonal algebra $\mathbb{C} \oplus \mathbb{C}$, of dimension two, and unitary conjugation preserves the dimension of the fixed-point algebra. The invariant $r = 1$ does not separate the two channels.
\end{example}

\subsection{Channels as morphisms}

Channels are the morphisms of the quantum setting: completely positive trace-preserving maps composed in sequence and combined in parallel. The normal form composes poorly. The minimal Kraus count of a composition satisfies $\operatorname{rank}(J(\Psi \circ \Phi)) \leq \operatorname{rank}(J(\Phi)) \cdot \operatorname{rank}(J(\Psi))$ by the factorization of the Choi matrix through the composition, and the inequality is strict in general, so the normal-form invariant does not even add along composition. Parallel composition multiplies counts on the tensor product. No classification of channels up to isomorphism follows from the normal form, and no such classification appears in the literature on open quantum systems. The normal form delivers a canonical minimal realization of each individual map.

\begin{remark}[Inflation under dilation]
A single channel arises from dilations of every environment dimension above the minimal one: adjoining an ancilla of dimension $a$ to a minimal realization of rank $r$ produces a family of Kraus operators of size $r + a$ describing the same map. The ambient count is therefore not an invariant of the channel at all; only the minimal count is, and the minimal count is an invariant of the normal form.
\end{remark}

\section{Reconstruction from constituents}

Classification asks which invariants separate objects. Reconstruction asks which probes determine an object. The two patterns are distinct in status and in content, and reconstruction is the better developed of the two.

\subsection{Commutative C*-algebras}

\begin{theorem}[Gelfand-Naimark]
\label{thm:gelfand-naimark}
Every C*-algebra admits a faithful isometric *-representation on a Hilbert space~\cite{gelfand-naimark}. In the commutative case, every unital commutative C*-algebra is isometrically *-isomorphic to $C(X)$ for a compact Hausdorff space $X$ given by its character space, and $X$ is recovered from $A$ as the set of multiplicative linear functionals with the weak-* topology.
\end{theorem}

The theorem is a representation and reconstruction result. In the commutative case it is also a classification: commutative unital C*-algebras are classified by their spectra. In the noncommutative case it is not a classification, and the block decomposition of \cref{thm:block-decomposition} is what classifies the finite-dimensional noncommutative objects. The contrast is the structural lesson: reconstruction of an object from its probes is a different achievement from a list of isomorphism classes, and the first pattern is the one that generalizes.

\subsection{Symmetry data from superselection categories}

The second reconstruction template recovers symmetry data from categorical data.

\begin{theorem}[Doplicher-Roberts reconstruction]
\label{thm:dr-reconstruction}
Let $\mathcal{C}$ be a symmetric tensor *-category with conjugates, direct sums and subobjects, with $\mathrm{End}(\mathbf{1}) = \mathbb{C}$, satisfying the selection criteria of the DHR analysis of a local net of observable algebras~\cite{dhr}. Then $\mathcal{C}$ is equivalent to the category of finite-dimensional unitary representations of a compact supergroup $G$, and $G$ is unique up to isomorphism~\cite{dr-duality,dr-endomorphisms}.
\end{theorem}

The hypotheses travel with the theorem and are part of its statement: symmetric structure, conjugates, direct sums, subobjects, $\mathrm{End}(\mathbf{1}) = \mathbb{C}$, and the DHR selection criteria, which in particular involve Haag duality and exclude long-range forces in their standard form. The reconstruction is a decomposition-and-recovery template: the superselection sectors compose into a tensor category, and the symmetry group is read back from the category.

The uniqueness clause is where hypotheses bite. When the setting is relaxed from the symmetric DHR situation to a braided Galois one, the representation category of the fixed-point theory is not determined by the original category alone, and additional data, expressible as soliton representations, are required~\cite{muger}. The uniqueness in \cref{thm:dr-reconstruction} therefore does not survive hypothesis change, and any use of the theorem outside its stated hypotheses is conditional.

\begin{remark}[Probes and classification]
\label{rem:yoneda}
The reconstruction pattern is an instance of the general principle that objects can be probed by the morphisms into or out of them. A standing qualification governs any argument of this form: Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem. Faithfulness of a probe functor is a mathematical statement about a category. Whether the probes carry physical content depends on data outside the functor.
\end{remark}

\section{Admissible constructions and closure}

The construction list of the framework section becomes computable in the finite-dimensional setting: the effect of each construction on dimension vectors is arithmetic.

\begin{proposition}[Construction arithmetic]
\label{prop:construction-arithmetic}
Let $A$ and $B$ be unital finite-dimensional complex C*-algebras with dimension vectors $\mathbf{n}(A)$ and $\mathbf{n}(B)$. Then:
\begin{enumerate}
\item $\mathbf{n}(A \oplus B) = \mathbf{n}(A) \uplus \mathbf{n}(B)$, the multiset union.
\item $\mathbf{n}(A \otimes B) = \{ n m : n \in \mathbf{n}(A),\, m \in \mathbf{n}(B) \}$, the pairwise product multiset.
\item $A \oplus B$ is irreducible under direct sum if and only if one summand is zero and the other is simple.
\end{enumerate}
\end{proposition}

\begin{proof}
Direct sum concatenates block lists and matrix algebras satisfy $M_n(\mathbb{C}) \otimes M_m(\mathbb{C}) \cong M_{nm}(\mathbb{C})$, which gives the two computations. The third clause restates simplicity of the blocks: a direct sum is reducible exactly when both summands are nonzero, and the irreducible objects are the simple algebras $M_n(\mathbb{C})$.
\end{proof}

\begin{corollary}[Closure of a finite set of blocks]
\label{cor:closure}
Let $S = \{M_{n_1}(\mathbb{C}), \dots, M_{n_k}(\mathbb{C})\}$ and let $\mathcal{C} = \{\oplus, \otimes\}$. The closure $\langle S \rangle_{\mathcal{C}}$ is the class of unital finite-dimensional complex C*-algebras whose dimension vector entries lie in the multiplicative semigroup generated by $n_1, \dots, n_k$ in $\mathbb{N}_{\geq 1}$.
\end{corollary}

\begin{proof}
By \cref{prop:construction-arithmetic} every element of the closure has dimension vector entries built from the $n_i$ by multiplication, and every finite multiset of such products is realized by taking direct sums of tensor products of generators.
\end{proof}

\begin{table}[ht]
\centering
\small
\begin{tabularx}{\textwidth}{@{}L{0.2\textwidth}L{0.24\textwidth}X@{}}
\toprule
Construction & Effect on dimension vectors & Composition data it contributes \\
\midrule
Direct sum & Multiset union of the two vectors & Superselection structure of the combined system \\
Tensor product & Pairwise product multiset & Subsystem structure of the combined system \\
Extension & Not determined by dimension vectors alone & Coupling data that must be stated case by case \\
Quotient and symmetry reduction & Not determined by dimension vectors alone & Gauge identification data that must be stated case by case \\
Factorization & Splits a module into block summands & Central projections of the observable algebra \\
\bottomrule
\end{tabularx}
\caption{Effect of the admissible constructions on dimension vectors, with the composition data each construction contributes. The two computable rows are the ones the closure argument uses.}
\label{tab:constructions}
\end{table}

\begin{example}[Qubit closure]
\label{ex:qubit-closure}
For $S = \{ \mathbb{C}, M_2(\mathbb{C}) \}$ under direct sum and tensor product, the multiplicative semigroup generated by $1$ and $2$ is $\{1, 2, 4, 8, \dots\}$, and the closure is the class of algebras whose dimension vectors have entries that are powers of two. The algebras $M_3(\mathbb{C})$ and $M_2(\mathbb{C}) \oplus M_3(\mathbb{C})$ are outside the closure. The enumeration of \cref{sec:computation} checks this arithmetic.
\end{example}

The closure of a finite set of blocks under direct sum and tensor product is always infinite as a class, because tensor powers keep producing new sizes, and the closure is always decidable at the level of individual dimension vectors: entry size belongs to a finitely generated multiplicative semigroup of the positive integers, and membership in such a semigroup is decidable. The computability of the closure is a peculiarity of the finite-dimensional regime, where the constructions act on integer vectors; nothing here extends it to closure taken over the full admissible construction list of the framework section.

\subsection{Worked example: two qubits}

A single system runs through every construction of this volume and shows what each layer of the machinery returns.

Observable-algebra decompositions do not extend to the underlying state space of a two-qubit system. Let $P$ have observable algebra $\mathcal{O} = M_4(\mathbb{C})$ and state space the density operators of $\mathbb{C}^4$, with both tensor product and direct sum named as composition operations. Under direct sum, $\mathcal{O}$ is simple with dimension vector $\{4\}$, so the algebraic system is irreducible; the endomorphism multiplicity data of \cref{cor:outer-aut} give a trivial outer automorphism group. Under tensor product, $\mathcal{O} \cong M_2(\mathbb{C}) \otimes M_2(\mathbb{C})$ factors into two qubit blocks of dimension vector $\{2\}$. Restricting to $M_2(\mathbb{C}) \oplus M_2(\mathbb{C})$ inside a superselection model produces two sectors whose state space is the join of two Bloch balls by \cref{prop:states-direct-sum}. At the state level, bipartite pure states of two qubits have unique Schmidt decompositions, while mixed states have no unique decomposition into pure states: the maximally mixed state $I/4$ admits continuously many pure-state ensembles by \cref{prop:ensemble}. The algebraic layer supports a complete existence-and-uniqueness theory for observable algebras and morphisms; the state layer in the mixed regime admits no unique representation into extremal components.

\begin{remark}[The generation identity]
The structural generation statement of the program, that every admissible system is of the form $\mathcal{F}(I_1, \dots, I_n)$ with $I_i$ irreducible, is proved in the restricted regime of this section: every unital finite-dimensional complex C*-algebra is a direct sum of irreducible blocks, the construction $\mathcal{F}$ is the direct sum, and the irreducibles are the $M_n(\mathbb{C})$. The identity $\mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F} \rangle_{\mathcal{C}}$ for general admissible systems remains conjectural, and nothing in this volume upgrades its status.
\end{remark}

\section{Decomposition and morphisms}

The morphism layer of the schema distinguishes coarse-grainings, embeddings, dualities, equivalence morphisms, and limiting procedures. Decomposition interacts with each of them differently, and two of the interactions are exact.

\begin{proposition}[Embeddings and multiplicity matrices]
\label{prop:embeddings}
In the setting of \cref{thm:homs}, a unital *-homomorphism $\varphi \colon A \to B$ is injective if and only if its multiplicity matrix has no zero row. Injective unital *-homomorphisms are the embeddings of the finite-dimensional C*-category.

exec
/usr/local/bin/zsh -lc "sed -n '160,220p;480,560p' papers/latex/vol-03-irreducibility-decomposition.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:

\begin{remark}[Unique decomposition in the categorical sense]
\label{rem:krull-schmidt}
\Cref{thm:block-decomposition} places the category of unital finite-dimensional complex C*-algebras among the additive categories with the Krull-Schmidt property: every object is a finite direct sum of indecomposable objects, and the decomposition is unique up to permutation and isomorphism of summands. The property is special. Tensor decomposition of objects in the same category does not inherit it: $M_4(\mathbb{C})$ factors as $M_2 \otimes M_2$ and as $M_4 \otimes \mathbb{C}$, and uniqueness statements about tensor factors live in the monoidal structure, not in the additive one.
\end{remark}

\subsection{Relativity of irreducibility}

The block decomposition settles irreducibility for the direct sum. The tensor product asks a different question, and the answers differ.

\begin{example}[One system, two answers]
\label{ex:two-answers}
Consider a two-qubit system with observable algebra $M_4(\mathbb{C})$. Under the direct sum composition, $M_4(\mathbb{C})$ is irreducible: it is simple, it has no nontrivial central idempotent, and its dimension vector is $\{4\}$. Under the tensor product composition, the same algebra factors as $M_2(\mathbb{C}) \otimes M_2(\mathbb{C}) \cong M_4(\mathbb{C})$ with two irreducible tensor factors. The dimension vector of the tensor product is the pairwise product multiset of the factor vectors: the product multiset of $\{2\}$ and $\{2\}$ is $\{4\}$, and the tensor factorization is invisible to the direct-sum invariant. Irreducibility is a property of the pair $(P, \ast)$.
\end{example}

\begin{example}[Superselection and subsystems]
\label{ex:superselection}
The algebra $M_2(\mathbb{C}) \oplus M_2(\mathbb{C})$ decomposes as a direct sum into two simple blocks, the standard model of two superselection sectors, each carrying a qubit observable algebra. The same algebra is not a tensor product of two matrix algebras of equal size: a tensor decomposition $M_a \otimes M_b \cong M_{ab}$ is simple and has dimension vector $\{ab\}$, while $M_2 \oplus M_2$ has dimension vector $\{2,2\}$ and total dimension $8 = 2^2 + 2^2 \neq 2^3$. Direct-sum decomposition detects superselection, tensor decomposition detects subsystems, and neither detects the other.
\end{example}

\subsection{States across blocks}

The decomposition of an observable algebra induces a decomposition of its state space, and the induced decomposition is unique in the same restricted sense.

\begin{definition}[State]
A state on a unital C*-algebra $A$ is a linear functional $\omega \colon A \to \mathbb{C}$ that is positive and normalized by $\omega(1) = 1$. Write $S(A)$ for the set of states of $A$.
\end{definition}

\begin{proposition}[States on a direct sum]
\label{prop:states-direct-sum}
Let $A = A_1 \oplus A_2$ with unital summands $A_1, A_2$ and central block projections $p_1, p_2$. Every state $\omega$ of $A$ has a unique expression
\[
\omega = \lambda \, \omega_1 + (1 - \lambda) \, \omega_2
\]
where $\lambda = \omega(p_1) \in [0,1]$, where $\omega_i$ is the restriction of $\omega$ to $A_i$ normalized to a state of $A_i$ when $\omega(p_i) > 0$, and the term is omitted when its weight is zero. Consequently $S(A)$ is the convex join of $S(A_1)$ and $S(A_2)$.
\end{proposition}

\begin{proof}
Write $a = p_1 a p_1 + p_2 a p_2$ for $a \in A$. Positivity of $\omega$ gives $0 \leq \omega(p_i) \leq 1$ and $\omega(p_1) + \omega(p_2) = 1$. Set $\lambda = \omega(p_1)$; when $\lambda \in (0,1)$ define $\omega_i(a) = \omega(p_i a p_i)/\lambda_i$ with $\lambda_1 = \lambda$ and $\lambda_2 = 1 - \lambda$. Each $\omega_i$ is positive and normalized, and $\omega$ is recovered as the convex combination above. Uniqueness of the weights follows from $\omega(p_1) = \lambda$ and uniqueness of the normalized restrictions follows from the formula. The convex-join description is the standard identification of a convex set built by joining two convex sets along their extreme points.
\end{proof}

\begin{example}[State space of two superselection sectors]
For $A = M_2(\mathbb{C}) \oplus M_2(\mathbb{C})$, each block state space is a Bloch ball and $S(A)$ is the join of two Bloch balls: a state is a choice of sector weight $\lambda \in [0,1]$ and a Bloch vector in each sector. The direct-sum decomposition of the algebra is exactly the superselection decomposition of the state space, and no information is lost or doubled in passing between the two descriptions.
\end{example}

\subsection{Existence beyond the finite-dimensional case}

Two further existence results are recorded because the later sections compare against them. They are background theorems of operator algebra, used here as reference points and not as dependencies of the classification statements above.

The first is the direct-integral decomposition of von Neumann algebras: every von Neumann algebra is a direct integral of factors over a measure space, and the decomposition is essentially unique up to measure-class isomorphism of the base~\cite{murray-vonneumann}. Existence of a decomposition into indecomposable pieces is therefore available in that setting. The second is the negative theorem that closes the classification story for the indecomposable pieces: there are uncountably many pairwise non-isomorphic separable type $\mathrm{II}_1$ factors~\cite{mcduff}. A global classification of factors is therefore impossible in the stated generality, and any decomposition program that hopes to finish with a parameterized list of indecomposables must restrict its class. Existence of a decomposition and classification of its pieces are different achievements, and the second one fails here.

\section{Morphisms and multiplicity data}

A classification of objects is worth little if the morphisms between them are opaque. For decomposed finite-dimensional C*-algebras the morphisms admit an exact combinatorial description, and the description is a second existence-and-uniqueness theorem in a restricted setting.

\begin{definition}[Multiplicity matrix]
\label{def:multiplicity-matrix}
Let $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ and $B \cong \bigoplus_{j=1}^{\ell} M_{m_j}(\mathbb{C})$. A \emph{multiplicity matrix} from $A$ to $B$ is a matrix $R = (r^{(i)}_j)$ of nonnegative integers with
\[
k^{(i)}_j = n_i \, r^{(i)}_j \qquad \text{and} \qquad \sum_{i=1}^{k} k^{(i)}_j = m_j \quad \text{for each } j.
\]
In the setting of \cref{thm:homs}, a unital *-homomorphism $\varphi \colon A \to B$ is injective if and only if its multiplicity matrix has no zero row. Injective unital *-homomorphisms are the embeddings of the finite-dimensional C*-category.
\end{proposition}

\begin{proof}
The restriction of $\varphi$ to the $i$-th block is a *-homomorphism out of the simple algebra $M_{n_i}(\mathbb{C})$ with unit $e_i = \varphi(p_i)$. If the $i$-th row of the multiplicity matrix is zero then $e_i = 0$ and $\varphi$ kills the $i$-th block. If some entry $r^{(i)}_j$ is positive then $e_i \neq 0$ and the homomorphism is injective on the simple block, because the kernel of a *-homomorphism out of a simple algebra is zero or everything.
\end{proof}

\begin{proposition}[Spectra of direct sums]
\label{prop:spectrum-sum}
Let $A$ and $B$ be unital commutative C*-algebras with spectra $X$ and $Y$. Then $A \oplus B \cong C(X \sqcup Y)$ and the spectrum of a direct sum is the disjoint union of the spectra.
\end{proposition}

\begin{proof}
Characters of $A \oplus B$ are unital *-homomorphisms to $\mathbb{C}$. The identity splits as $1 = 1_A + 1_B$ with $1_A 1_B = 0$, so $\chi(1_A) = \chi(1_A)^2$ in $\mathbb{C}$ and $\chi(1_A) \in \{0, 1\}$: every character restricts to a character of exactly one summand and vanishes on the other. The character space is therefore the disjoint union of the character spaces of the summands, and the Gelfand isomorphism $A \oplus B \cong C(X \sqcup Y)$ follows.
\end{proof}

Coarse-grainings behave in the opposite way. A coarse-graining can merge blocks and forget the decomposition: the map $M_2(\mathbb{C}) \oplus M_2(\mathbb{C}) \to M_2(\mathbb{C})$ sending $(x,y)$ to $(x+y)/2$ is positive and unital, and it destroys the superselection decomposition of its domain. Irreducibility is not preserved by coarse-graining, and a decomposition statement about coarse-grained systems must be justified for the target system, not inherited from the source.

Limiting procedures are the least controlled interaction. Direct sums of finite-dimensional blocks pass to direct integrals of factors in infinite-volume or continuum limits, and the block structure of the approximating algebras need not survive the limit. The decomposition theorems of this volume are finite-dimensional statements; their behavior under the limiting procedures named in the construction list is a separate problem, and nothing here claims continuity of decomposition under limit.

Dualities commute with decomposition in the commutative case by \cref{prop:spectrum-sum}, and Doplicher-Roberts reconstruction (\cref{thm:dr-reconstruction}) recovers symmetry data from decomposed sector categories. Equivalence morphisms preserve decomposition when they are *-isomorphisms of observable algebras, and only for those is the dimension vector invariant.

\section{Decomposition across the families}

The block decomposition is one row of a larger chart. The table below records the established position, for each domain in which a decomposition question is live, on the three questions this paper keeps separate: existence of a decomposition, uniqueness of the decomposition, and parameterization of the pieces. The sources are the same that supply the theorems cited in the preceding sections.

\begin{table}[ht]
\centering
\small
\begin{tabularx}{\textwidth}{@{}L{0.2\textwidth}L{0.22\textwidth}L{0.2\textwidth}X@{}}
\toprule
Domain & Existence & Uniqueness & Parameterization of the pieces \\
\midrule
Finite-dimensional C*-algebras & Direct sum into matrix blocks & Dimension vector unique up to permutation & Dimension vector is complete \\
Commutative C*-algebras & Spectrum of characters & Spectrum is unique & The spectrum itself \\
Von Neumann algebras & Direct integral into factors & Essentially unique up to measure class & No parameterization of the factors in general \\
Completely positive maps & Stinespring dilation and Kraus form & Minimal dilation unique up to unitary & Kraus rank is a normal-form invariant only \\
Bipartite pure states & Schmidt decomposition & Coefficients unique & Schmidt coefficients \\
Interacting systems & No general theorem & Fails in general & Not available \\
Wild representation categories & Indecomposable decompositions may exist & Not controlled & Finite-dimensional parameterization is impossible \\
\bottomrule
\end{tabularx}
\caption{Decomposition status by domain. The first and fifth rows are the complete cases, the fourth row is a normal form and not a classification, and the last two rows record where the pattern stops.}
\label{tab:domains}
\end{table}

The comparison makes the volume's shape visible. The complete rows are exactly the rows with a finite or parametric invariant, and every one of them is a restricted class: semisimple finite-dimensional algebras, commutative algebras, bipartite pure states. The normal-form row is the trap this volume documents at length: a canonical description that does not classify. The last two rows are theorems, not disappointments: nonunique decomposition for interacting systems and the impossibility of finite-dimensional parameterization in wild regimes are proved statements about the boundary of decomposition programs.

The von Neumann row deserves one sentence of its own. Decomposition into factors exists, and the pieces resist classification: uncountably many pairwise non-isomorphic separable type $\mathrm{II}_1$ factors sit in a single type class~\cite{mcduff}. Any program that decomposes systems and then classifies the indecomposables therefore needs its own restriction hypothesis, and the restriction is not a technical convenience.

\section{Wildness and the parameterization boundary}

The finite-dimensional decomposition theorem classifies its objects by a finite invariant. The expectation that similar parameterizations exist beyond tame regimes is false, and the falsity is a theorem.

\begin{theorem}[Tame-wild dichotomy]
\label{thm:tame-wild}
Every finite-dimensional algebra over an algebraically closed field is either derived tame or derived wild~\cite{bekkert-drozd}. Derived wildness is preserved under degeneration, and derived tameness is preserved under deformation.
\end{theorem}

\begin{theorem}[Wildness of the generic determinant]
\label{thm:wild-generic-det}
The maximal Cohen-Macaulay module theory of the generic determinant is wild~\cite{buchweitz-leuschke}: already in rank two, the isomorphism classes of modules cannot be parametrized by a finite-dimensional variety over the coefficients.
\end{theorem}

The phrase used for this phenomenon in the literature is that the representation theory is quite wild: the wildness is not merely an absence of known invariants, it is the proven absence of finite-dimensional parameterization. The technique behind the dichotomy is the theory of matrix problems, in which representations are reduced by an algorithm to normal forms for boxes and arrows; derived tameness means the reduction terminates with a one-parameter-family description of indecomposables, and derived wildness means the reduction embeds an arbitrary matrix problem, after which no finite-dimensional parameterization can exist. A parallel obstruction in equivariant stable homotopy~\cite{grevstad-may} shows that no meaningful classification of compact $C_p$-equivariant $H\underline{\mathbb{F}}_p$-modules at odd primes is to be expected, so the boundary is not confined to representation theory of algebras.

\begin{corollary}[Boundary on decomposition programs]
\label{cor:boundary}
Any program that decomposes systems into irreducibles and then parametrizes the irreducibles by finite-dimensional data is confined to tame regimes. In wild regimes the decomposition step may still exist while the parameterization step is provably unavailable.
\end{corollary}

The corollary is the volume's impossibility content. It does not contradict \cref{thm:block-decomposition}, which lives in the tamest possible regime: finite-dimensional algebras over $\mathbb{C}$ with semisimple radical-free structure. It marks the edge of the pattern. The tame-wild distinction also appears algorithmically: group isomorphism for extensions with tame quotient admits polynomial-time algorithms whose bounds fail in the wild case~\cite{grochow-qiao}, so the boundary is visible to computation as well as to parameterization.

For the structural generation program the consequence is precise. A generation theorem of the form $P \simeq \mathcal{F}(I_1, \dots, I_n)$ is achievable where the irreducibles $I_i$ come from a tame class with finite or parametric invariants. Where the irreducibles are wild, the generation step may still succeed while the classification of the generators fails, and the long-term target $\mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F} \rangle_{\mathcal{C}}$ inherits the restriction. The candidate subclasses for existence-and-uniqueness theorems, finite-dimensional quantum systems, finite groupoid models, and selected classes of topological field theories, are all tame in this sense, and the tameness of each candidate must be made explicit wherever the candidate is used.

\section{Counterexamples and boundary cases}

Three natural strengthenings of the results above fail, and the failures locate their hypotheses.

\subsection{Uniqueness without parameterization}


codex
ROW 1 | Dimension-vector arithmetic under direct sum and tensor product | SUPPORTS | The enumeration uses multiset union for direct sums and pairwise products for tensor products.
ROW 2 | Multiplicity matrices classify homomorphism conjugacy classes | SUPPORTS | The code checks counts 2, 1, and 6, explicit multiplication and adjoint laws, same-matrix conjugacy, and distinct-matrix rank separation.
ROW 3 | Kraus rank stays fixed while presented families grow | SUPPORTS | Normalized scalar splittings preserve the map and test constant Choi rank for family sizes 1, 2, 3, 5, and 8.
ROW 4 | Taxonomy instances cover blocks and decomposed algebras | PARTIAL | Both types have construction and decomposition instances, but the operator-algebra family instance exists only for FiniteDimCStar.
ROW 5 | Constructible instances compute tensor products and direct sums | SUPPORTS | Both types implement tensor products by multiplying block sizes and direct sums by concatenating block lists.
VERDICT: NEEDS_FIX
hook: Stop
hook: Stop Completed
tokens used
49,137
ROW 1 | Dimension-vector arithmetic under direct sum and tensor product | SUPPORTS | The enumeration uses multiset union for direct sums and pairwise products for tensor products.
ROW 2 | Multiplicity matrices classify homomorphism conjugacy classes | SUPPORTS | The code checks counts 2, 1, and 6, explicit multiplication and adjoint laws, same-matrix conjugacy, and distinct-matrix rank separation.
ROW 3 | Kraus rank stays fixed while presented families grow | SUPPORTS | Normalized scalar splittings preserve the map and test constant Choi rank for family sizes 1, 2, 3, 5, and 8.
ROW 4 | Taxonomy instances cover blocks and decomposed algebras | PARTIAL | Both types have construction and decomposition instances, but the operator-algebra family instance exists only for FiniteDimCStar.
ROW 5 | Constructible instances compute tensor products and direct sums | SUPPORTS | Both types implement tensor products by multiplying block sizes and direct sums by concatenating block lists.
VERDICT: NEEDS_FIX
