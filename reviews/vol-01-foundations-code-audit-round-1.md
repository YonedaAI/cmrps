---
reviewer: codex (OpenAI) gpt-6.1-sol
type: code-audit
paper: vol-01-foundations
round: 1
date: 2026-10-30T03:01:35Z
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
session id: 01a18ac1-70b8-7f41-bc29-994da5c68376
--------
user
Read papers/latex/vol-01-foundations.tex and ONLY the files under src/vol-01-foundations/ that its code evidence appendix names (do not explore anything else). For EVERY row of the appendix output one line: ROW <n> | <claim, 10 words max> | SUPPORTS | PARTIAL | NO | <one-sentence reason>. SUPPORTS means the named code actually demonstrates or tests the claim as stated. End with VERDICT: PASS if every row is SUPPORTS, else VERDICT: NEEDS_FIX.
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
I’ll read the appendix, check only the source files it names, and assess every row against its stated claim.
exec
/usr/local/bin/zsh -lc 'cat papers/latex/vol-01-foundations.tex' in /Users/mlong/Documents/Development/classification-physical-systems
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
\usepackage{enumitem}
\usepackage{listings}
\lstset{basicstyle=\ttfamily\footnotesize,breaklines=true,columns=fullflexible,frame=single,framesep=4pt,showstringspaces=false,captionpos=b}
\usepackage[hidelinks]{hyperref}
\usepackage{cleveref}

\newtheorem{theorem}{Theorem}[section]
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{conjecture}[theorem]{Conjecture}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{example}[theorem]{Example}
\theoremstyle{remark}
\newtheorem{remark}[theorem]{Remark}

\title{Foundations of Structural Classification\\[4pt]
  {\normalsize Part 1 of \emph{The Classification of Mathematical Representations of Physical Systems}}}
\author{Matthew Long\\
  \small The YonedaAI Collaboration, YonedaAI Research Collective\\
  \small Chicago, Illinois, USA\\
  \small \texttt{matthew@yonedaai.com}\\
  \small \texttt{https://yonedaai.com}}
\date{October 2026}

\begin{document}
\maketitle

\begin{abstract}
The classification of mathematical representations of physical systems is a structural problem before it is a physical one, and this paper establishes the foundations that the problem requires. A representation is recorded as a five-part tuple of state space, observables, dynamics, symmetries, and composition rules. Morphisms are admitted in five named kinds, each with an explicit preservation law, and admissibility is fixed by six stated conditions that single out admissible records and admissible class specifications. Several results give the framework content. The five morphism kinds are not closed under composition: an explicit counterexample shows that the composite of an embedding and a coarse-graining can satisfy no listed preservation law, so the morphism schema is not yet a category. Three restricted classes are then classified in full: finite classical systems under disjoint union are classified by cardinality with one-point systems as the unique irreducibles, finite dynamical systems decompose uniquely into connected components, and finite symmetric systems are classified by orbit type. Irreducibility is shown to depend on the chosen composition rule, and a two-qubit example shows that decomposition requires factorization data beyond the bare record. The structural classification conjecture of the program is recorded with its five proof obligations, none of them proved. The chief limitation of the paper is that the admissibility conditions and the preservation laws are proposals, so every statement about admissible systems is conditional on them.
\end{abstract}

\section{Introduction}

Classifying the mathematical representations of physical systems is a structural question. It asks which representations exist, which of them describe the same system, and which are assembled from simpler ones. The Classification of Finite Simple Groups shows how much a completed structural classification can deliver and how much it can withhold. The classification is complete, every finite simple group belongs to a named family or is a sporadic group, and no uniform parameterization analogous to Dynkin diagrams is known \cite{gorenstein1982,solomon2001}. Practical identification runs through companion data of the ATLAS kind, order, Schur multiplier, outer automorphism group, presentations, and character tables with power maps \cite{atlas-book}. A completed classification and a usable parameterization are separate achievements.

Three notions must be kept apart from the start. A \emph{classification} is an exhaustive list of objects up to a stated equivalence. A \emph{parameterization} is a uniform finite or continuous datum whose value identifies the object. A \emph{recognition procedure} is an algorithm that decides identity from recorded invariants. The finite simple groups deliver the first, partially the third, and not the second. Complex semisimple Lie algebras deliver all three, since Dynkin diagrams parameterize them \cite{humphreys1972}. A foundation for a classification program of physical systems has to state which of the three it pursues.

The foundations needed here are definitional. Before a classification theorem can be stated, the program needs a mathematical notion of a physical system, a notion of morphism, a notion of equivalence, and a condition that separates admissible records from arbitrary ones. The difficulty is that no universally accepted mathematical definition of every possible physical system exists. This paper does not remove that difficulty. It makes the difficulty explicit and workable: it fixes a record schema, a morphism vocabulary with preservation laws, an equivalence discipline, and a list of admissibility conditions, and it proves results about that framework rather than about any physical theory.

This paper contributes a five-component record for a representation with each component given a precise mathematical role, carried by worked classes of records that support every later construction. Preservation laws for the five named morphism kinds come with a proof that the kinds do not compose across kinds (Proposition~\ref{prop:composition-not-typed}), so the morphism vocabulary is a schema and not yet a category, and with a proof that each kind is closed under self-composition (Proposition~\ref{prop:self-composition}). Four conditions single out admissible records, two further conditions single out admissible class specifications, and under a closed morphism kind the admissible records form a category (Propositions~\ref{prop:schema-category} and \ref{prop:conditional}). Three restricted classes receive complete classification (Theorems~\ref{thm:finite-state-classification}, \ref{thm:dynamical-decomposition}, and \ref{thm:symmetric-classification}), and an explicit two-qubit computation shows that decomposition needs factorization data beyond the record (Proposition~\ref{prop:factorization-nonunique}). The structural classification conjecture is stated with its five proof obligations, and a claim-status discipline keeps announced results, complete proofs, and machine-checked statements apart.

The scope of the program follows a founding distinction. Classifying mathematical representations of physical systems is a mathematical problem that can be formalized at once. Classifying physical systems themselves additionally requires a justified notion of physical equivalence and an empirical interpretation. This paper works entirely on the first side of that line. It also adopts the program's three levels of mathematical achievement, mathematical formulation, rigorous theorem, and physical validation, and it places its own results on the first two. Nothing in this paper reaches physical validation.

\section{The classification problem}
\label{sec:problem}

Completed classifications in mathematics fall into regimes, and the regimes determine what a classification program for physics can honestly promise. Table~\ref{tab:regimes} collects representative cases on which the program relies as background. The rows are established mathematics, cited here as registered background; no theorem of this paper depends on them, and the comparison with finite simple groups is the only one of them that shapes the constructions below.

\begin{table}[ht]
\centering
\small
\caption{Regimes of completed classification. Each row records what is classified, the identifying invariant data, and the kind of achievement the result represents.}
\label{tab:regimes}
\begin{tabularx}{\textwidth}{L{0.18\textwidth} X L{0.24\textwidth} L{0.16\textwidth}}
\toprule
Domain & What is classified & Identifying data & Achievement \\
\midrule
Finite simple groups & Simple groups up to isomorphism & Family name or sporadic name & Complete, unparameterized \cite{gorenstein1982,solomon2001} \\
Complex semisimple Lie algebras & Algebras up to isomorphism & Dynkin diagram & Complete and parameterized \cite{humphreys1972} \\
Finite-dimensional $C^*$-algebras & Unital algebras up to *-isomorphism & Dimension vector of matrix blocks \cite{dixmier1977} & Complete and parameterized \\
Amenable factors & Hyperfinite factors of all types & Murray-von Neumann type and Connes invariants \cite{connes1976} & Complete in the amenable class \\
General type II$_1$ factors & Nothing beyond coarse strata & No countable invariant set & Impossible by theorem \cite{mcduff1969} \\
Principal $G$-bundles & Bundles over a paracompact base up to bundle isomorphism & Homotopy classes of maps into the classifying space \cite{milnor1956} & Complete \\
Closed 3-manifolds & Manifolds up to homeomorphism & Decomposition into geometric pieces & Complete by geometrization \cite{scott1983} \\
4-manifolds & Restricted classes only & No general invariant set & Partly unrecognizable \cite{tancer} \\
\bottomrule
\end{tabularx}
\end{table}

Classification is sharp exactly where the identifying invariant is finite or parametric. Classification content can be entirely global, since Darboux's theorem removes all local invariants from symplectic geometry, so the classifying data of a classical system has to be topological \cite{arnold1978}. Non-classifiability is itself a theorem rather than a difficulty, as the impossibility of classifying general type II$_1$ factors \cite{mcduff1969}, the undecidability of Markov properties of finitely presented groups \cite{rabin1958}, the wildness of large representation categories \cite{buchweitz-leuschke}, and the unrecognizability of certain four-manifolds \cite{tancer} all show.

Reconstruction is better developed than classification. Gelfand duality reconstructs compact Hausdorff spaces from commutative $C^*$-algebras, and the Gelfand-Naimark theorem embeds every $C^*$-algebra into an algebra of operators \cite{gelfand-naimark1943}. Stone duality reconstructs spectra from Boolean algebras \cite{stone1936}. The Doplicher-Roberts theorem reconstructs a compact supergroup from symmetric tensor categories under explicit hypotheses \cite{doplicher-roberts}, and Deligne's theorem identifies characteristic-zero symmetric tensor categories of subexponential growth as supergroup representation categories \cite{deligne2002}. These are results about recovering objects from probes, and they are proof templates for the series. They are not classification theorems, and they do not make classification unnecessary.

Classification and reconstruction both rest on explicit mathematical primitives. Classification demands an object class, an equivalence relation, and a composable morphism vocabulary; reconstruction demands structured probes and preservation laws. This paper fixes those primitives and proves results about them, and it separates the representation of a system from any empirical realization of it.

This paper depends on no theorem of the series and on no classification theorem beyond the architectural comparison with finite simple groups. The classification theorems of Table~\ref{tab:regimes} are registered background, and the conjecture below may enter later work only as a declared hypothesis. Nor does the paper claim that a universal classification exists. These prohibitions make the definitions reusable: a definitional root that smuggled in results would make every dependent statement conditional on them.

\section{Mathematical framework}
\label{sec:framework}

A representation of a physical system is a piece of mathematical data, and the schema below records that data in five components. The schema is a stipulation. It is proposed as a working definition, it is the definitional root of the series, and it is not claimed to capture every system anyone would call physical.

\begin{definition}[System record]
\label{def:record}
A system record is a tuple
\[
P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})
\]
with the following components. The component $X$ is the state space or geometric structure of $P$. The component $\mathcal{O}$ is the algebra or collection of observables of $P$. The component $\mathcal{D}$ holds the evolution laws of $P$, given as Hamiltonian or vector-field data, an operator semigroup, a flow, or an evolution functor. The component $\mathcal{S}$ holds the symmetry and constraint data of $P$, the group or groupoid actions, gauge constraints, and constraint surfaces. The component $\mathcal{C}$ declares how $P$ is to be combined with other systems, through tensor products, coupling terms, or interfacing rules.
\end{definition}

Each component is a mathematical object of some ambient category, and the schema does not fix which. The state space may be a set, a symplectic or smooth manifold, a Hilbert space, or a lattice configuration. The observables may be real functions on a state space, a $C^*$-algebra, a von Neumann algebra, or a sheaf of observable collections. The composition component is the load-bearing one for the later sections: it fixes what counts as a decomposition, so irreducibility is always relative to $\mathcal{C}$. The five components need not be independent, and the record is a candidate definition rather than a theorem. Table~\ref{tab:notation} fixes the notation of the paper.

The composition component needs a typing statement, since composition is an operation on several systems at once. The component $\mathcal{C}$ of a record is a declaration: it names the construction under which the record is to be combined with other records of its class. The construction itself is class-level data, a binary operation on records with the induced transport on the remaining components. Two records combine exactly when they declare the same construction, and the result of the combination is a record of the same class. In the restricted classes below the declaration is the choice of disjoint union or of product, and the operation acts on state spaces with the induced maps on observables, dynamics, and symmetry data.

\begin{table}[ht]
\centering
\small
\caption{Notation of the paper. Each symbol names one piece of the record schema or one relation on records.}
\label{tab:notation}
\begin{tabularx}{\textwidth}{L{0.22\textwidth} X}
\toprule
Symbol & Meaning \\
\midrule
$P$ & A system record of Definition~\ref{def:record}: a tuple of state space $X$, observables $\mathcal{O}$, dynamics $\mathcal{D}$, symmetries $\mathcal{S}$, and composition data $\mathcal{C}$ \\
$\mathrm{Phys}_{\mathrm{fin}}$ & The finite classical records of Definition~\ref{def:finite-classical} \\
$\mathrm{Phys}_{\mathrm{dyn}}$ & The finite dynamical records of Definition~\ref{def:finite-dynamical} \\
$\mathrm{Phys}_{\mathrm{qub}}$ & The bipartite qubit records of Definition~\ref{def:qubit} \\
$\mathrm{Phys}_{\mathrm{adm}}$ & The admissible subcategory of Definition~\ref{def:phys-adm} \\
$\cong$ & Mathematical equivalence of records, Definition~\ref{def:math-equiv} \\
$\simeq$ & The declared physical equivalence, Definition~\ref{def:phys-equiv} \\
$\mathfrak{J}_{\mathcal{C}}$ & The class of records irreducible relative to $\mathcal{C}$ \\
$\langle \mathfrak{F} \rangle_{\mathfrak{C}}$ & Closure of a family collection under the constructions $\mathfrak{C}$ \\
$\mathbf{1}_{\mathcal{C}}$ & The neutral record of the composition rule $\mathcal{C}$ \\
\bottomrule
\end{tabularx}
\end{table}

\begin{remark}[Scope of the schema]
\label{rem:scope}
The schema records representations, not the systems they represent, and it treats gauge orbits, superselection sectors, and state spaces with constraints at the level of the components that carry them rather than resolving them into separate object types. Two records may describe one physical system at different levels of coarse-graining, and the schema does not decide when. The remark is a boundary of Definition~\ref{def:record}, not a defect to be patched silently in later sections.
\end{remark}

\begin{example}[Classical Hamiltonian record]
\label{ex:hamiltonian}
Let $X$ be a symplectic manifold, let $\mathcal{O} = C^\infty(X)$, let $\mathcal{D}$ be the Hamiltonian flow of a chosen Hamiltonian $H \in C^\infty(X)$, let $\mathcal{S}$ be the group of symplectomorphisms preserving $H$, and let $\mathcal{C}$ be the product of symplectic manifolds with coupled Hamiltonians. Poisson manifolds give the wider family, whose local models are supplied by Weinstein splitting \cite{weinstein1983}.
\end{example}

\begin{example}[Quantum record]
\label{ex:quantum}
Let $X$ be a Hilbert space, let $\mathcal{O} = B(X)$ or a $C^*$-subalgebra of it, let $\mathcal{D}$ be a strongly continuous one-parameter unitary group or a semigroup of completely positive maps, let $\mathcal{S}$ be the unitary group commuting with $\mathcal{D}$, and let $\mathcal{C}$ be the Hilbert-space tensor product with tensor-product dynamics.
\end{example}

\begin{example}[Lattice record]
\label{ex:lattice}
Let $X$ be the set of vertices of a finite lattice, let $\mathcal{O}$ be the algebra of functions on $X$ generated by local gauge-invariant operators, let $\mathcal{D}$ be the update rule of a lattice gauge model, let $\mathcal{S}$ be the local gauge group acting on the links, and let $\mathcal{C}$ be the gluing of lattices along shared boundaries. Lattice models of gauge theory are the class where restricted theorems of the series have proved attainable and where the continuum limit remains a limiting procedure in the sense of Definition~\ref{def:morphism-kind}.
\end{example}

These classes are deliberately small. Section~\ref{sec:restricted} classifies the first two in full and adds a variant of the first with symmetry data.

\begin{definition}[Finite classical record]
\label{def:finite-classical}
Let $\mathrm{Phys}_{\mathrm{fin}}$ be the class of records $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ with $X$ a finite set, $\mathcal{O} = \mathbb{R}^{X}$ the algebra of all real functions on $X$, $\mathcal{D}$ the identity dynamics, $\mathcal{S}$ the trivial symmetry group, and $\mathcal{C}$ the disjoint union of state spaces. The empty record is admitted and is the neutral record for disjoint union, the $\mathbf{1}_{\mathcal{C}}$ of Definition~\ref{def:irreducible}. The set $X$ ranges over finite sets in a fixed countable universe, so the class is a set rather than a proper class, and isomorphic records with different underlying sets are identified in the quotient of Theorem~\ref{thm:finite-state-classification}.
\end{definition}

\begin{definition}[Finite dynamical record]
\label{def:finite-dynamical}
Let $\mathrm{Phys}_{\mathrm{dyn}}$ be the class of records $P = (X, \mathcal{O}, f, \mathcal{S}, \mathcal{C})$ with $X$ a finite set, $\mathcal{O} = \mathbb{R}^{X}$, dynamics given by a self-map $f \colon X \to X$ of discrete time, $\mathcal{S}$ trivial, and $\mathcal{C}$ the disjoint union of state spaces with the map that acts componentwise. The empty record is admitted and is the neutral record for disjoint union. An invariant subsystem of $P$ is a nonempty subset $Y \subseteq X$ with $f(Y) \subseteq Y$, carrying the restricted record.
\end{definition}

\begin{definition}[Bipartite qubit record]
\label{def:qubit}
Let $\mathrm{Phys}_{\mathrm{qub}}$ be the class of records with $X = \mathbb{C}^2 \otimes \mathbb{C}^2$ carrying a chosen factorization of the four-dimensional space into two qubit factors, $\mathcal{O} = B(X)$, $\mathcal{D}$ the identity, $\mathcal{S}$ the group $U(2) \times U(2)$ of local unitaries, and $\mathcal{C}$ the tensor product of factors. The factorization is part of the record, and Section~\ref{sec:irreducibility} shows what fails when it is left out.
\end{definition}

These classes are records, not physical theories. They exist to make every definition of the paper checkable on explicit objects.

\section{Morphisms and preservation laws}
\label{sec:morphisms}

A classification problem needs morphisms as much as objects. The morphism vocabulary below names five kinds of admissible relationship, and each kind is given a preservation law: the conditions a map of records must meet to count as a morphism of that kind. Without such laws the vocabulary is a list of words.

\begin{definition}[Morphism kind]
\label{def:morphism-kind}
A morphism of records is declared in exactly one of five kinds. A \emph{coarse-graining} forgets microscopic detail while preserving macroscopic observables. An \emph{equivalence morphism} is invertible and represents exact equivalence of representations. An \emph{embedding} realizes $P_1$ as a subsystem, subtheory, or substructure of $P_2$. A \emph{duality} is a contravariant equivalence between two record presentations: invertible as a correspondence between distinct presentations rather than as an arrow of one category. A \emph{limiting procedure} arises from a limit or colimit process, and the named processes of the program are the thermodynamic limit, the infinite-volume limit, the semiclassical limit, and the continuum limit.
\end{definition}

\begin{definition}[Preservation law]
\label{def:preservation-law}
A \emph{morphism of records} $g \colon P_1 \to P_2$ is a tuple $(g_X, g_{\mathcal{O}}, g_{\mathcal{D}}, g_{\mathcal{S}}, g_{\mathcal{C}})$ of maps in the ambient categories of the five components, with $g_X \colon X_1 \to X_2$, with $g_{\mathcal{O}} \colon \mathcal{O}_2 \to \mathcal{O}_1$ contravariant on observables, and with the remaining components transported compatibly with their declared structure; on records carrying dynamics the tuple intertwines the dynamics. Morphisms of records compose componentwise. On point-set records whose observables are functions on the state space, the tuple is determined by the state map through precomposition, and the laws of Definition~\ref{def:concrete-laws} are stated in that specialization. A preservation law for a morphism kind assigns to each declared morphism of that kind explicit conditions on the tuple, and a composition rule stating which kind, if any, the composite of two declared morphisms belongs to. A morphism is admissible when its declared preservation law is stated. The morphism schema is the collection of all admissible morphisms over all kinds.
\end{definition}

The laws used in this paper are the following. Two of the five kinds carry structure beyond a map of records: a duality is a contravariant equivalence between record presentations, and a limiting procedure is the leg of a cone on a diagram of records. Neither is an arrow of an ordinary record category in its own right, and the schema records both as morphism kinds whose preservation law carries the extra structure; the underlying map is the part that composes. The laws are stated for point-set records, and the quantum records of Example~\ref{ex:quantum} require the algebraic form of the same laws: there a coarse-graining is a unital *-homomorphism of observable algebras, as in the partial trace on a tensor factor, and an embedding is an inclusion of algebras, rather than a surjection or an injection of points.

\begin{definition}[Concrete preservation laws]
\label{def:concrete-laws}
\begin{enumerate}
\item \emph{Coarse-graining.} The state map $\hat g \colon X_1 \to X_2$ is surjective, and every observable of $\mathcal{O}_2$ pulls back along $\hat g$ to an observable of $\mathcal{O}_1$. Surjectivity records that every macro-state of $P_2$ is realized by a micro-state of $P_1$.
\item \emph{Embedding.} The state map is injective, every observable of $\mathcal{O}_1$ extends to an observable of $\mathcal{O}_2$ on the embedded states, and the dynamics of $P_1$ is the restriction of the dynamics of $P_2$ to the embedded subsystem.
\item \emph{Equivalence morphism.} The state map is a bijection and carries $\mathcal{O}$, $\mathcal{D}$, $\mathcal{S}$, and $\mathcal{C}$ across, so the map is invertible and its inverse satisfies the same conditions.
\item \emph{Duality.} The declared morphism is the underlying map of a contravariant equivalence between two record presentations. The law names the two presentations, the direction of the correspondence, and the layers of structure preserved in the sense of Definition~\ref{def:preserved-structure}. Invertibility in an opposite category adds nothing to invertibility, since the isomorphisms of a category and of its opposite coincide; the content of the law is the pairing of presentations and the naming of preserved layers.
\item \emph{Limiting procedure.} The declared morphism is the leg map of a cone or cocone of a diagram of records under one of the four named limit processes, and the law carries the diagram data. The diagram is indexed by a directed parameter with no terminal object, a family growing without bound or a parameter approaching a limiting value. A map between two fixed finite records is never a limiting procedure of this kind.
\end{enumerate}
\end{definition}

A coarse-graining of finite classical records is worth writing out once. Let $X_1 = \{1, 2, 3, 4\}$ and $X_2 = \{p, q\}$ with $\hat g$ given by $1 \mapsto p$, $2 \mapsto q$, $3 \mapsto p$, $4 \mapsto q$. Every function $h$ on $X_2$ pulls back to $h \circ \hat g$ on $X_1$, so the observable condition holds, and $\hat g$ is surjective. The fiber over $p$ is $\{1, 3\}$ and the fiber over $q$ is $\{2, 4\}$: the coarse-graining identifies states within a fiber and the pulled-back observables are exactly those that are constant on fibers. This is the classical picture of a macro-state. The same construction on quantum records replaces precomposition by an algebra map, and the partial trace on a tensor factor is its standard instance.

The point-set laws above are specializations. Records whose state space is a Hilbert space carry observables that are operators rather than scalar functions, and their morphisms are algebra homomorphisms contravariant on observables and, where states are the primitive data, maps on density matrices. The five kinds and their preservation discipline survive the change of ambient category; only the form of the state map changes.

\begin{table}[ht]
\centering
\small
\caption{The five morphism kinds and the preservation conditions of Definition~\ref{def:concrete-laws}. The composition rule of each law is separate data, and Proposition~\ref{prop:composition-not-typed} shows that the kinds as listed do not carry one.}
\label{tab:morphisms}
\begin{tabularx}{\textwidth}{L{0.18\textwidth} X L{0.32\textwidth}}
\toprule
Kind & State-level condition & Observable-level condition \\
\midrule
Coarse-graining & Surjective map of state spaces & Every target observable pulls back to a source observable \\
Embedding & Injective map of state spaces & Every source observable extends along the embedding \\
Equivalence morphism & Bijection of state spaces & The whole record is carried across \\
Duality & Contravariant equivalence between record presentations & Preserved layers are named explicitly \\
Limiting procedure & Leg map of a cone on a limit diagram & The index has no terminal object \\
\bottomrule
\end{tabularx}
\end{table}

The composition rule is where the vocabulary breaks. The five kinds are not closed under composition, and the failure is visible on the smallest records in the paper.

\begin{proposition}[Composition is not typed]
\label{prop:composition-not-typed}
There are records $P_1, P_2, P_3$ and morphisms $e \colon P_1 \to P_2$ of embedding kind and $g \colon P_2 \to P_3$ of coarse-graining kind whose composite satisfies none of the five preservation laws of Definition~\ref{def:concrete-laws}.
\end{proposition}

\begin{proof}
Take finite classical records with $X_1 = \{a, b\}$, $X_2 = \{1, 2, 3, 4\}$, $X_3 = \{p, q\}$. Let $e$ have state map $a \mapsto 1$ and $b \mapsto 3$, and let $g$ have state map $1 \mapsto p$, $2 \mapsto q$, $3 \mapsto p$, $4 \mapsto q$. Both are admissible: $e$ is injective and every function on $X_1$ extends to $X_2$, and $g$ is surjective and every function on $X_3$ pulls back to $X_2$. The composite $g \circ e$ is the constant state map $a \mapsto p$ and $b \mapsto p$. The constant map is not surjective, so it fails the coarse-graining law. It is not injective, so it fails the embedding law. It is not bijective, so it fails the equivalence law, and it is not invertible in any pairing of record presentations, so it fails the duality law. It is not a limiting procedure, since a map between two fixed finite records is excluded from that law by Definition~\ref{def:concrete-laws}. The composite therefore satisfies no law in the list.
\end{proof}

\begin{corollary}[Schema, not category]
\label{cor:schema-not-category}
The morphism schema of Definition~\ref{def:preservation-law} is not a category. Turning it into one requires one of three decisions: enlarge the kind vocabulary so that composites are retyped, restrict admissible morphisms to those whose composites stay inside the list, or replace the single collection by a multi-category whose composition is typed in each slot. Whether one category suffices at all is open.
\end{corollary}

The composition failure constrains every later statement about morphisms. Any classification theorem that speaks about morphisms of $\mathrm{Phys}$ has to state which of the three decisions it has taken, and any theorem about composition of coarse-grainings, embeddings, or dualities is conditional on that choice.

The obstruction concerns composites of different kinds. Within a single kind the laws are closed.

\begin{proposition}[Self-composition within a kind]
\label{prop:self-composition}
Coarse-grainings compose to coarse-grainings, embeddings compose to embeddings, and equivalence morphisms compose to equivalence morphisms, under the laws of Definition~\ref{def:concrete-laws}.
\end{proposition}

\begin{proof}
Surjective state maps compose to surjective maps, and pullbacks along a composite are the composite of the pullbacks, so a composite of coarse-grainings meets the coarse-graining law. Injective state maps compose to injective maps, and extensions along a composite are the composite of the extensions, so a composite of embeddings meets the embedding law. Bijections carrying the record across compose to bijections carrying the record across. Duality and limiting procedures require the extra data of their laws, and nothing here asserts closure for them.
\end{proof}

Proposition~\ref{prop:composition-not-typed} and Proposition~\ref{prop:self-composition} together locate the difficulty: typed composition holds inside each kind and fails across kinds. Physical modeling composes kinds freely, an embedding followed by a coarse-graining being the common case, so the single-kind restriction of Corollary~\ref{cor:schema-not-category} loses expressiveness, and this paper adopts it only as a working convention: admissible morphisms are restricted to one kind at a time, and Section~\ref{sec:admissibility} builds the resulting categories. A native treatment of inter-kind composition would use a bicategory of spans or cospans, or a typed multicategory, in which a composite carries its two kinds as typing data; that construction is not carried out here, and the inter-kind question stays open.

\section{Equivalence and structural discipline}
\label{sec:equivalence}

The classification problem is a quotient problem: classify objects up to some equivalence. Which equivalence is chosen decides what the classification means, and the two notions the program needs are different in strength.

\begin{definition}[Mathematical equivalence]
\label{def:math-equiv}
Two records $P_1$ and $P_2$ are mathematically equivalent, written $P_1 \cong P_2$, when there is a bijection of state spaces carrying $\mathcal{O}$, $\mathcal{D}$, $\mathcal{S}$, and $\mathcal{C}$ across in the ambient category of each component. Mathematical equivalence is isomorphism of records.
\end{definition}

\begin{definition}[Physical equivalence]
\label{def:phys-equiv}
Physical equivalence $\simeq$ is a chosen equivalence relation on records, declared per class of systems, that identifies representations describing the same physical system. The choice is open. Two mathematical descriptions may be physically equivalent without being mathematically isomorphic.
\end{definition}

The second definition is a stipulation, and its content is that the choice carries weight. Dual theories can describe the same observable physics through different mathematical structures, so a classification that uses isomorphism in place of $\simeq$ classifies representations rather than systems. The program therefore requires that every use of $\simeq$ be declared, and Section~\ref{sec:restricted} declares it explicitly for the restricted classes it classifies.

\begin{definition}[Preserved-structure record]
\label{def:preserved-structure}
An identification of two records must name the layers of structure it preserves. The layers are the symmetric monoidal layer, the monoidal layer without symmetry, the braided layer, the plain tensor layer, the *-structure of operator-algebraic data, the algebraic structure, the topological structure, complete positivity of channels, and the unitary freedom of dilations. An identification that names no preserved layer is not admissible.
\end{definition}

The requirement is a discipline with a proved reason. Tensor-category equivalence that discards the symmetric layer does not determine the group: non-isomorphic finite groups can carry equivalent plain tensor representation categories \cite{etingof-gelaki}. Any classification built on an equivalence that forgets the monoidal or symmetric layer is therefore false as a classification of the underlying structures, and every equivalence record in the series must state what it preserves.

\begin{remark}[The Yoneda qualification]
\label{rem:yoneda}
The Yoneda embedding $P \mapsto \mathrm{Hom}(-, P)$ is established mathematics: in a locally small category an object is determined up to isomorphism by its representable functor \cite{maclane1971}. The physical interpretation of that embedding is open, and the program adopts the following constraint verbatim. ``Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.'' Relational data alone settles none of the three, and a later volume that derives any of the three from representability alone has derived nothing.
\end{remark}

Physical equivalence is also distinct from empirical indistinguishability, and the program keeps the two apart by construction.

\begin{definition}[Three layers]
\label{def:three-layers}
The program separates three layers of achievement. The mathematical layer classifies admissible structures up to the chosen equivalence. The realization layer assigns to classified structures physical systems. The selection layer assigns to physical systems the observational constraints or predictions that experiments bear on. A complete solution of the first layer would not by itself solve the second or the third.
\end{definition}

The separation has two consequences that later volumes inherit. A mathematical structure can be consistent without describing the observed world, and several mathematically distinct theories can produce identical predictions in an experimentally accessible regime. The layers belong to the assembly stage of the series, and the present paper works on the first of them only.

\begin{remark}[Observational equivalence]
\label{rem:observational}
A third relation is often confused with the first two. Two records are observationally equivalent when no measurement available to a stated observer distinguishes them, which is a relation on records relative to a measurement class and an observer, and not an intrinsic relation on mathematical structures. The implication pattern is one-way in each direction that matters: mathematical equivalence implies observational equivalence for any fixed measurement class, while observational equivalence does not imply mathematical equivalence, and physical equivalence is asserted on physical grounds rather than derived from either. Identifying mathematical isomorphism with empirical indistinguishability is therefore a category error, and no classification statement in this series is allowed to make that identification.
\end{remark}

\section{Admissible physical systems}
\label{sec:admissibility}

Arbitrary records are not physical systems. A record with contradictory components, an observable collection that is not closed under its own operations, or dynamics that is not defined on the whole state space is a formal tuple and nothing more. The program needs an explicit list of consistency conditions, and the list below is what this paper must fix.

\begin{definition}[Admissible record]
\label{def:admissibility}
A record $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ is admissible when it satisfies the following four conditions.
\begin{enumerate}[label=AC-\arabic*.,widest=AC-6.,leftmargin=*]
\item \emph{Total record.} All five components are defined, and each is an object of a stated ambient category.
\item \emph{Observable closure.} The collection $\mathcal{O}$ is closed under the operations of its ambient algebra.
\item \emph{Well-posed dynamics.} The dynamics $\mathcal{D}$ acts on the whole state space or observable collection, as a flow, a semigroup action, or an evolution functor.
\item \emph{Symmetry compatibility.} The symmetries and constraints $\mathcal{S}$ act on $X$ preserving the declared structure, and $\mathcal{O}$ is invariant or equivariant under that action.
\end{enumerate}
\end{definition}

\begin{definition}[Admissible class specification]
\label{def:admissible-spec}
A class specification $(\mathcal{K}, \mathrm{Mor}_{\mathcal{K}}, \simeq_{\mathcal{K}})$ is admissible when its records satisfy Definition~\ref{def:admissibility} and the specification itself satisfies the following two conditions.
\begin{enumerate}[label=AC-\arabic*.,widest=AC-6.,leftmargin=*,start=5]
\item \emph{Composition closure.} The class $\mathcal{K}$ is closed under the construction of $\mathcal{C}$ wherever that construction is defined, and the composition rule declares its domain of composability as part of $\mathcal{C}$.
\item \emph{Declared equivalence.} The specification states which equivalence relation of Definition~\ref{def:phys-equiv} is in force and which preservation laws of Definition~\ref{def:concrete-laws} its morphisms obey.
\end{enumerate}
\end{definition}

\begin{definition}[Admissible subcategory]
\label{def:phys-adm}
Let $\mathrm{Phys}_{\mathrm{adm}}$ be the class of records satisfying Definition~\ref{def:admissibility}, inside a class specification satisfying Definition~\ref{def:admissible-spec}. Statements about morphisms are made in one of the categories $\mathrm{Phys}^{K}_{\mathrm{adm}}$, whose objects are the records of $\mathrm{Phys}_{\mathrm{adm}}$ and whose morphisms are those of a single kind $K$ closed under self-composition, together with the identities; Proposition~\ref{prop:schema-category} supplies these categories. The five-kind schema is not one category, by Proposition~\ref{prop:composition-not-typed}, and a morphism statement that crosses kinds has no ambient category until one of the resolutions of Corollary~\ref{cor:schema-not-category} is adopted.
\end{definition}

\begin{table}[ht]
\centering
\small
\caption{The six admissibility conditions: AC-1 to AC-4 constrain a record (Definition~\ref{def:admissibility}) and AC-5 to AC-6 constrain a class specification (Definition~\ref{def:admissible-spec}), with the subject each condition constrains and the failure it excludes.}
\label{tab:admissibility}
\begin{tabularx}{\textwidth}{L{0.16\textwidth} L{0.20\textwidth} X}
\toprule
Condition & Subject & Failure excluded \\
\midrule
AC-1 Total record & A record & A component left implicit or undefined \\
AC-2 Observable closure & A record & An observable collection not closed under its own operations \\
AC-3 Well-posed dynamics & A record & An evolution that does not act on the whole record \\
AC-4 Symmetry compatibility & A record & A symmetry action that breaks the observables or the constraints \\
AC-5 Composition closure & A class specification & A composition rule with an undeclared domain of composability \\
AC-6 Declared equivalence & A class specification & An identification with no stated equivalence or preservation law \\
\bottomrule
\end{tabularx}
\end{table}

The conditions are proposals. They are strong enough to yield a category and weak enough to admit the restricted classes of Definition~\ref{def:finite-classical} through \ref{def:qubit}, and they are open to revision. What the series may not do is leave them implicit, since every theorem over $\mathrm{Phys}_{\mathrm{adm}}$ is conditional on them.

\begin{proposition}[Admissible morphisms form a category]
\label{prop:schema-category}
Fix a morphism kind whose preservation law contains the identities and is closed under self-composition, and take the admissible morphisms to be those of the chosen kind. Then the admissible records of Definition~\ref{def:phys-adm} together with these morphisms form a category. For the laws of Definition~\ref{def:concrete-laws} the coarse-graining kind, the embedding kind, and the equivalence kind qualify, by Proposition~\ref{prop:self-composition}.
\end{proposition}

\begin{proof}
Composition of admissible morphisms is admissible by hypothesis, and the identity on a record satisfies the identity conditions of each law. Associativity and the identity laws hold because the morphisms are maps of records and composition of maps is associative. The composition rule of Definition~\ref{def:preservation-law} is exactly the hypothesis needed, which is why the open status of that rule is the open status of the category structure.
\end{proof}

\begin{proposition}[Conditionality over admissible systems]
\label{prop:conditional}
Every statement quantified over $\mathrm{Phys}_{\mathrm{adm}}$ is conditional on the chosen admissibility conditions and the chosen preservation laws. Removing a condition enlarges the class and can falsify statements that hold for the smaller class.
\end{proposition}

\begin{proof}
Consider the sentence $\Phi$: for every record $P$ in the class with $\mathcal{O}(P) \subseteq \mathbb{R}^{X}$ and all $f, h \in \mathcal{O}(P)$, the sum $f + h$ lies in $\mathcal{O}(P)$. With AC-2 in force, $\Phi$ holds on $\mathrm{Phys}_{\mathrm{adm}}$, because AC-2 requires $\mathcal{O}$ to be closed under the operations of its ambient algebra and addition is one of them. With AC-2 dropped and the remaining conditions kept, the record with $X = \{1, 2\}$, $\mathcal{O} = \{\delta_1, \delta_2\}$ of point masses, trivial dynamics, and trivial symmetries is admitted, and $\Phi$ fails on it since $\delta_1 + \delta_2$ is the constant function $1$ and is not in $\mathcal{O}$. The class of true statements therefore depends on the list.
\end{proof}

The word conditional is used here in the technical sense of the claim-status discipline of Section~\ref{sec:claims}. Until the list is accepted or replaced, results about $\mathrm{Phys}_{\mathrm{adm}}$ are conditional statements and are recorded as such.

Each condition excludes a concrete pathology, and the list can be tested record by record. A tuple with a component named but not defined fails AC-1. An observable collection such as the two point masses on a two-point state space fails AC-2. A Hamiltonian vector field defined only on an open subset of the state space fails AC-3. A symmetry action that moves an observable outside the observable collection fails AC-4. A composition rule that produces records with undefined components on some inputs, with no declared domain, fails AC-5. A class of records with no declared equivalence relation fails AC-6. The conditions are strong enough to rule these out and weak enough to admit the restricted classes of Section~\ref{sec:restricted}, and that pairing is the design criterion for any revision of the list.

\section{Irreducibility and decomposition}
\label{sec:irreducibility}

Which systems are simple is not a property of a record alone. It is a property of a record together with the composition rule $\mathcal{C}$, and the same object can be irreducible under one rule and decomposable under another.

\begin{definition}[Irreducibility]
\label{def:irreducible}
Fix a composition rule $\mathcal{C}$ and write $\mathbf{1}_{\mathcal{C}}$ for its neutral record, the unit of $\mathcal{C}$ when one exists. A record $P$ is irreducible relative to $\mathcal{C}$ when $P$ is not isomorphic to $\mathbf{1}_{\mathcal{C}}$ and admits no decomposition $P \cong \mathcal{F}(P_1, P_2)$ with $\mathcal{F}$ the composition construction of $\mathcal{C}$ and neither $P_1$ nor $P_2$ isomorphic to $\mathbf{1}_{\mathcal{C}}$. The class of irreducibles is $\mathfrak{J}_{\mathcal{C}}$.
\end{definition}

\begin{definition}[Decomposition]
\label{def:decomposition}
A decomposition of $P$ is an expression $P \cong \mathcal{F}(I_1, \dots, I_n)$ with each $I_i$ in $\mathfrak{J}_{\mathcal{C}}$ and $\mathcal{F}$ an admissible construction. The unit record is the empty decomposition. Uniqueness of decomposition is open in general.
\end{definition}

\begin{definition}[Closure]
\label{def:closure}
For a collection $\mathfrak{F}$ of records and a set $\mathfrak{C}$ of admissible constructions, the closure $\langle \mathfrak{F} \rangle_{\mathfrak{C}}$ is the smallest class of records containing $\mathfrak{F}$ and closed under the constructions of $\mathfrak{C}$. The symbol $\mathcal{C}$ stays reserved for the composition coordinate of an individual record, and the set $\mathfrak{C}$ is program-level data.
\end{definition}

The constructions of the program are the tensor product, the direct sum, extension, limits and colimits, and factorization of a representation into factors, and each use of a construction must state the composition data it contributes to $\mathcal{C}$. In the restricted classes below only two of these are active: disjoint union, which is a direct sum of state spaces, and the cartesian product, which is a tensor product of finite sets. The restriction is deliberate. A framework that cannot state and prove a theorem about its simplest constructions has no standing to state one about tensor products of quantum field theories.

The dependence of irreducibility on $\mathcal{C}$ is checkable on the finite classical records in two ways.

\begin{example}[Irreducibles under disjoint union]
\label{ex:union-irreducibles}
In $\mathrm{Phys}_{\mathrm{fin}}$ with $\mathcal{C}$ the disjoint union of state spaces, the neutral record is the empty record, and Definition~\ref{def:irreducible} excludes it from the irreducibles. The irreducibles are exactly the one-point records. A record with more than one point splits as $X = \{x\} \cup (X \setminus \{x\})$ into two nonempty records, and a one-point record admits no split into two nonempty parts.
\end{example}

\begin{example}[Irreducibles under product]
\label{ex:product-irreducibles}
Take the same records with $\mathcal{C}$ the cartesian product of state spaces and product composition rules. The neutral record is the one-point record, and it is the empty product. The irreducibles are the records of prime cardinality. A record of cardinality $n$ decomposes as a product of records of prime cardinality, and the multiset of prime factors is unique up to order by unique prime factorization.
\end{example}

The two examples classify the same class of records and disagree on the irreducibles. Irreducibility is relative to $\mathcal{C}$, and no statement about simple systems is meaningful until the composition rule is part of the record.

Uniqueness of decomposition fails as soon as the record carries less than the composition data. The smallest instance is two qubits.

\begin{proposition}[Factorization is extra data]
\label{prop:factorization-nonunique}
For any four-dimensional complex Hilbert space $H$ there exist two factorizations $H \cong \mathbb{C}^2 \otimes \mathbb{C}^2$ and a unit vector $\psi \in H$ whose entanglement entropy is $0$ in one factorization and $\log 2$ in the other. The bare record $(H, B(H), \mathrm{id}_H, U(H))$ does not determine the decomposition of $H$ into factors.
\end{proposition}

\begin{proof}
Write $v_1 = e_1 \otimes e_1$ and $v_2 = e_2 \otimes e_2$. In the standard factorization $\psi = v_1$ is a product vector, its Schmidt rank is one, and its entanglement entropy is $0$. Let $W$ be the unitary of $H$ that acts on the span of $v_1, v_2$ by the rotation $W v_1 = (v_1 + v_2)/\sqrt{2}$ and $W v_2 = (v_1 - v_2)/\sqrt{2}$, and acts as the identity on the orthogonal complement. Then $W$ is self-adjoint and unitary on that span, so $W^2$ is the identity there. Write $\Phi_1 \colon H \to \mathbb{C}^2 \otimes \mathbb{C}^2$ for the standard factorization, so that $\psi = v_1$ has coordinate vector $v_1$. The second factorization is the pullback $\Phi_2 = \Phi_1 \circ W^{-1}$: the vector $\psi$ is unchanged and the factorizing isomorphism changes. In the coordinates of $\Phi_2$ the fixed vector $\psi$ is represented by $\Phi_2(\psi) = \Phi_1(W^{-1} \psi)$, and since $W^2$ is the identity on the span of $v_1, v_2$ we have $W^{-1} = W$ there, so the coordinate vector is $W \psi = (v_1 + v_2)/\sqrt{2} = (e_1 \otimes e_1 + e_2 \otimes e_2)/\sqrt{2}$. Its Schmidt coefficients are $1/\sqrt{2}$ and $1/\sqrt{2}$ and its entanglement entropy is $\log 2$. Both factorizations are legitimate structures on $H$, so the decomposition into factors is not a function of the bare Hilbert space.
\end{proof}

Two qualifications bound the claim. Factorizations related by a local unitary or by the swap of the two factors give the same entanglement entropy for every vector, so the proposition asserts the existence of a differing pair of factorizations and does not claim that every pair differs. When the symmetry data $\mathcal{S}$ of the record is fixed as a concrete subgroup $U(2) \times U(2)$ of $U(4)$, as in Definition~\ref{def:qubit}, that subgroup does pick out a tensor factorization up to factor swap, which is why Definition~\ref{def:qubit} makes the factorization part of the record.

Entanglement is a relation between a vector and a chosen tensor structure, and a classification of quantum systems that forgets the tensor structure classifies vectors in a bare space. The non-uniqueness visible here is the smallest member of the family of phenomena, entanglement, emergence, and gauge redundancy among them, that make decomposition uniqueness open for interacting systems in general.

\section{Classification in restricted classes}
\label{sec:restricted}

A framework for classification is worth having when classification theorems can be stated and proved inside it. Two restricted classes admit complete classification, and the theorems below give the series its smallest worked instances: an irreducible list, a decomposition theorem, a complete invariant, and a proof.

\begin{theorem}[Finite classical classification]
\label{thm:finite-state-classification}
Let $P$ and $Q$ be records of $\mathrm{Phys}_{\mathrm{fin}}$ with state spaces of cardinality $m$ and $n$, with composition rule the disjoint union, and with mathematical equivalence as the declared equivalence relation. Then:
\begin{enumerate}
\item $P$ is irreducible if and only if $m = 1$;
\item $P$ decomposes as a disjoint union of $m$ one-point records, and this decomposition is unique up to order and isomorphism of factors;
\item $P \cong Q$ if and only if $m = n$;
\item the cardinality $|X|$ is a complete invariant, and the quotient $\mathrm{Ob}(\mathrm{Phys}_{\mathrm{fin}})/\cong$ is in bijection with the nonnegative integers, the empty record corresponding to zero.
\end{enumerate}
\end{theorem}

\begin{proof}
Claim 1 is Example~\ref{ex:union-irreducibles}. For claim 2, the state space is the disjoint union of its points, each point carries a one-point record, and cardinality is additive under disjoint union, so any decomposition into irreducibles has exactly $m$ one-point factors. For claim 3, an isomorphism of records in this class is a bijection of state spaces, since the observable algebra is the full algebra of functions, the dynamics is the identity, and the symmetry data is trivial; finite sets are in bijection exactly when their cardinalities agree. Claim 4 restates claim 3 as the classification of the quotient.
\end{proof}

The classification is complete and parameterized, in the regime of Table~\ref{tab:regimes} where classifications are sharp. It is also close to trivial, which is the point: the framework supports a full theorem with a proof, and the theorem's simplicity is measured evidence that the definitions are well formed rather than evidence about physics.

\begin{theorem}[Finite dynamical decomposition]
\label{thm:dynamical-decomposition}
Let $P$ be a record of $\mathrm{Phys}_{\mathrm{dyn}}$ with state space $X$ and dynamics $f \colon X \to X$, and call two states adjacent when one is the image of the other under $f$. Then:
\begin{enumerate}
\item $P$ is irreducible if and only if the functional graph of $f$ is weakly connected;
\item $P$ decomposes as the disjoint union of the records on its connected components, and this decomposition is unique up to order and isomorphism of factors;
\item $P \cong Q$ if and only if the multisets of connected-component isomorphism classes of $P$ and $Q$ agree.
\end{enumerate}
\end{theorem}

\begin{proof}
A decomposition $P \cong P_1 \sqcup P_2$ corresponds to a partition $X = X_1 \cup X_2$ with $f(X_i) \subseteq X_i$ for both parts. If the functional graph is disconnected, the parts of a disconnection are invariant and give a decomposition into two non-unit records. If the graph is weakly connected and such a partition existed, then for every edge $(x, f(x))$ the point $x$ lies in some part $X_i$ and invariance forces $f(x)$ into the same part, so no edge crosses the partition and the graph would be disconnected, which is a contradiction. This proves claim 1. For claim 2, every connected component is invariant, so the components give a decomposition, and each component is irreducible by claim 1. Any decomposition into irreducibles is a partition of $X$ in which every block is invariant, and the argument just given shows that no edge crosses between blocks, so every block is a union of connected components; irreducibility of a block forces it to be exactly one component. The multiset of factors is therefore the multiset of components and does not depend on the decomposition. For claim 3, an isomorphism of records is a bijection $\varphi \colon X \to Y$ with $\varphi \circ f = g \circ \varphi$, and such a bijection carries components bijectively to components, preserving the isomorphism class of each. Conversely, isomorphisms between matched components patch to an isomorphism of records.
\end{proof}

Irreducibility in Definition~\ref{def:irreducible} is indecomposability under $\mathcal{C}$, and it is weaker than the absence of invariant subsystems. On $X = \{1, 2\}$ with $f(1) = 1$ and $f(2) = 1$, the functional graph is weakly connected, so the record is irreducible, while $Y = \{1\}$ is a proper invariant subsystem whose complement $\{2\}$ is not invariant. The distinction runs parallel to the one between simple and indecomposable modules when Maschke's theorem fails, and it keeps claim 2 of Theorem~\ref{thm:dynamical-decomposition} from being read as a statement about subobjects.

The second theorem is complete without being parameterized. The classifying datum of a connected component is the isomorphism class of its functional graph, a directed cycle with rooted trees attached to its vertices, and no single integer records that datum. The class is decidable and enumerable, and the classification runs through graph isomorphism of the components rather than through a finite invariant list. The regime distinction of Table~\ref{tab:regimes} reappears inside one restricted class.

The theorems of this section verify the combinatorial scaffolding of the framework and nothing beyond it. The observable algebra in these classes is the full function algebra, which does no work beyond carrying across bijections, and the theorems do not test how nontrivial observables, Hamiltonian dynamics, or gauge constraints interact under morphisms. Their evidential value is narrower and firmer: on records where every claim is decidable, the definitions of irreducibility, decomposition, generation, and classification compose correctly and are proved in full.

Both theorems declare their equivalence relation explicitly, as condition AC-6 requires: the declared relation is mathematical equivalence of records. A different declared relation would give a different quotient, and the program records the choice rather than assuming it.

\begin{theorem}[Generation in the restricted classes]
\label{thm:generation}
Let $P$ be a record of one of the two restricted classes.
\begin{enumerate}
\item If $P$ is in $\mathrm{Phys}_{\mathrm{fin}}$, then $P$ is a disjoint union of one-point records, and under the product rule $P$ is a product of prime-cardinality records.
\item If $P$ is in $\mathrm{Phys}_{\mathrm{dyn}}$, then $P$ is a disjoint union of records on weakly connected functional graphs.
\item In both cases the generation is effective: the irreducible factors are computed from the state space and the dynamics by finite enumeration.
\end{enumerate}
\end{theorem}

\begin{proof}
Claim 1 restates Theorem~\ref{thm:finite-state-classification} claim 2 and Example~\ref{ex:product-irreducibles}. Claim 2 restates Theorem~\ref{thm:dynamical-decomposition} claim 2. Claim 3 holds because both classes are finite by definition: listing the points of $X$ produces the one-point factors, prime factorization produces the product factors, and breadth-first search in the functional graph produces the components.
\end{proof}

Theorem~\ref{thm:generation} is the structural generation statement of the program proved for two restricted classes. It settles the generation obligation in these classes and nowhere else, and it is one more instance of the pattern recorded for the program at large: generation is proved in restricted domains and open in general.

Symmetry data can be added without losing classification. The third restricted class takes a finite symmetry group acting on the state space.

\begin{theorem}[Finite symmetric classification]
\label{thm:symmetric-classification}
Fix a finite group $G$, and let $\mathrm{Phys}^{G}_{\mathrm{fin}}$ be the records of $\mathrm{Phys}_{\mathrm{fin}}$ with $\mathcal{S} = G$ acting on $X$ by permutations, with $\mathcal{O} = \mathbb{R}^{X}$ carrying the induced action, and with $\mathcal{C}$ the disjoint union of $G$-sets. Then:
\begin{enumerate}
\item $P$ is irreducible if and only if the action of $G$ on $X$ is transitive;
\item $P$ decomposes as the disjoint union of its orbit records, and this decomposition is unique up to order and isomorphism of factors;
\item $P \cong Q$ if and only if for every conjugacy class of subgroups of $G$ the number of orbits with stabilizer in that class agrees;
\item the resulting orbit-counting function is a complete invariant with finite range.
\end{enumerate}
\end{theorem}

\begin{proof}
A partition of $X$ into invariant nonempty parts exists exactly when the action is not transitive, which proves claim 1 in the same way as Theorem~\ref{thm:dynamical-decomposition} claim 1. The orbits are invariant and give a decomposition into transitive records, and any decomposition into irreducibles is a partition into invariant parts, each of which is a single orbit by claim 1, so the multiset of orbits is the multiset of factors and is independent of the decomposition; this proves claim 2. Two transitive $G$-sets are isomorphic exactly when their stabilizer subgroups are conjugate, so an isomorphism of records matches orbits by stabilizer class, and matched orbits patch to an isomorphism of records; this proves claim 3. Claim 4 follows because a finite group has finitely many conjugacy classes of subgroups and each orbit count is bounded by $|X|$.
\end{proof}

Theorem~\ref{thm:symmetric-classification} sits in the parameterized regime of Table~\ref{tab:regimes} and shows that symmetry does not by itself push a restricted class out of it. Its invariant is already a function on conjugacy classes rather than a single number, which is the shape that classifying data takes as soon as group actions enter.

These results do not touch the candidate structural families of Section~\ref{sec:conjecture}, interacting systems, or any physical theory. What they establish is that the framework of Sections \ref{sec:framework} to \ref{sec:admissibility} supports complete restricted classification with proofs, which is a first success criterion of the program.

\section{The structural classification conjecture}
\label{sec:conjecture}

The classification problem of the program is now definable.

\begin{definition}[Classification problem]
\label{def:classification-problem}
The classification problem is $\mathrm{Classify}(\mathrm{Ob}(\mathrm{Phys}_{\mathrm{adm}})/\simeq)$, the classification of admissible records up to the declared physical equivalence. The problem is stated on objects and the declared equivalence; it does not require the five-kind morphism schema to be a category, and morphism statements enter it only through the kind-relative categories of Definition~\ref{def:phys-adm}.
\end{definition}

The program's organizing conjecture asserts that this problem has an answer built from fundamental families and constructions. The families in question are the ten candidate organizing families named in the series ontology: symplectic and Poisson structures, Hilbert spaces and operator algebras, smooth manifolds and geometric structures, principal bundles and connections, probability and measure-theoretic structures, topological and higher-categorical structures, dynamical systems and operator semigroups, tensor categories and compositional structures, discrete combinatorial structures, and derived and homotopical structures. They are candidates, not a completed taxonomy, and some may turn out to be special cases of others.

\begin{conjecture}[Structural classification]
\label{conj:structural}
There is a collection of fundamental structural families $\mathfrak{F} = \{\mathfrak{F}_\alpha\}_{\alpha \in A}$ and a set $\mathfrak{C}$ of admissible constructions such that
\[
\mathrm{Ob}(\mathrm{Phys}_{\mathrm{adm}})/\simeq \;=\; \mathrm{Ob}(\langle \mathfrak{F} \rangle_{\mathfrak{C}})/\simeq ,
\]
where $\langle \mathfrak{F} \rangle_{\mathfrak{C}}$ is the closure of Definition~\ref{def:closure} and the equality means that the two classes of records agree up to the declared physical equivalence. The notation $\mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F} \rangle_{\mathfrak{C}}$ abbreviates this equality of quotients.
\end{conjecture}

The conjecture is registered as a conjecture, and it may enter later volumes only as a declared hypothesis, never as a lemma. Five obligations would turn it into a theorem, and Table~\ref{tab:obligations} records the status of each.

\begin{table}[ht]
\centering
\small
\caption{The five proof obligations of Conjecture~\ref{conj:structural} and their status. Only the fourth has partial content, and that content is a candidate family list together with the admissibility proposal of Definition~\ref{def:admissibility}.}
\label{tab:obligations}
\begin{tabularx}{\textwidth}{L{0.16\textwidth} X L{0.20\textwidth}}
\toprule
Obligation & Content & Status \\
\midrule
Completeness & Every admissible record lies in the closure of the families & Open \\
Soundness & Every generated record satisfies the admissibility conditions & Open \\
Equivalence & Different representations of one system are identified correctly & Open \\
Structural characterization & The families have precise mathematical definitions & Partial \\
Decomposition & Targeted classes are constructed from the families & Open in general \\
\bottomrule
\end{tabularx}
\end{table}

The third obligation is constrained by the preserved-structure discipline of Definition~\ref{def:preserved-structure}: an equivalence that discards the symmetric layer cannot identify the systems correctly, and counterexamples are proved \cite{etingof-gelaki}. The fifth obligation has complete instances in restricted domains and none in general.

Each obligation has a concrete target. Completeness asks for a construction of every admissible record from family data, which in the restricted classes of Section~\ref{sec:restricted} is Theorem~\ref{thm:generation}. Soundness asks for proofs that the constructions preserve the conditions of Definitions~\ref{def:admissibility} and \ref{def:admissible-spec}, which is a question about the constructions and the conditions together. Equivalence asks for a justified choice of $\simeq$ together with proofs that the identification respects the preserved layers. Structural characterization asks for mathematical definitions of the families precise enough to decide membership, and the ten candidates of Section~\ref{sec:conjecture} are named but not yet defined at that precision. Decomposition asks for existence and, in restricted subclasses, uniqueness of the factorization into family data. The evidence in hand is that each of the five has restricted instances and none has a general proof.

The program accepts a negative outcome as a result. A proof that a specified class admits a complete classification, and a proof that certain natural classification objectives are impossible without additional restrictions, count equally as mathematical progress. The obstruction theorems surveyed in Section~\ref{sec:problem} set the expectation: outside tame regimes a total theorem of the finite-simple-group kind is implausible, and the honest synthesis is that restricted-class classification theorems and explicit obstruction theorems together are the realistic output of the program. That synthesis is itself a conjectural expectation and is not proved here.

\section{Claim-status discipline}
\label{sec:claims}

The value of a classification program depends on the honesty of its claim labels. The series uses exactly six, and every theorem-level statement carries exactly one.

\begin{definition}[Claim-status labels]
\label{def:claim-status}
The claim-status labels are the following. \emph{Machine-checked}: a complete formalization has been accepted by a clean kernel-checked build, with the build archived. \emph{Complete-informal-proof}: a complete mathematical proof exists, given in full in the record or cited from the mathematical literature. \emph{Conditional}: the statement is proved from hypotheses recorded explicitly, and some hypothesis is itself unproved. \emph{Conjecture}: a precise statement with no complete proof. \emph{Computational-evidence}: support from computation that is not a proof. \emph{Open-problem}: a stated question with neither proof nor substantial evidence.
\end{definition}

\begin{table}[ht]
\centering
\small
\caption{The six claim-status labels and what each one requires. No label may be upgraded by prose, and computational evidence never upgrades a record.}
\label{tab:claims}
\begin{tabularx}{\textwidth}{L{0.24\textwidth} X}
\toprule
Label & Requirement \\
\midrule
Machine-checked & A complete formalization accepted by a clean kernel-checked build \\
Complete-informal-proof & A complete proof, given here or cited from the literature \\
Conditional & A proof from hypotheses that include unproved statements \\
Conjecture & A precise statement with no complete proof \\
Computational-evidence & Computation that supports a statement without proving it \\
Open-problem & A question with neither proof nor substantial evidence \\
\bottomrule
\end{tabularx}
\end{table}

The discipline applies to this paper's own statements. Proposition~\ref{prop:composition-not-typed}, Proposition~\ref{prop:self-composition}, Corollary~\ref{cor:schema-not-category}, and Theorems~\ref{thm:finite-state-classification}, \ref{thm:dynamical-decomposition}, \ref{thm:generation}, and \ref{thm:symmetric-classification} are complete-informal-proofs proved in full above. Propositions~\ref{prop:schema-category}, \ref{prop:conditional}, and \ref{prop:factorization-nonunique} are complete-informal-proofs over the classes of Definitions~\ref{def:finite-classical} to \ref{def:qubit}, each proved from the definitions given here. Conjecture~\ref{conj:structural} is a conjecture. The experiments of the appendix carry the label computational-evidence and nothing else.

Nothing in the program is machine-checked at the time of writing: no formalization of any record has been accepted by a clean kernel-checked build, and a formalization that is announced but withheld does not qualify for the first label. The record of the announced existence result in constructive quantum field theory reads ``existence claimed; manuscript and formalization withheld; verification pending'' \cite{openai-claim,kitp}, and an existence result and a mass-gap result are separate claims, the Yang-Mills mass gap remaining an open problem \cite{clay}.

Computational evidence is a label, not a step toward the first one. The executable models of the taxonomy layer for this volume are written in Haskell and are computational evidence: they instantiate the definitions of Sections \ref{sec:framework} to \ref{sec:irreducibility}, and they are checked against the statements of Section~\ref{sec:restricted} by executable tests. No such model is verified by Lean, and no claim in this paper rests on a computation rather than on a proof.

The program also separates three levels of mathematical achievement: mathematical formulation, rigorous theorem, and physical validation. The definitions of this paper sit on the first level, the classification theorems of Section~\ref{sec:restricted} sit on the second, and nothing in the program has reached the third.

\section{Limitations}
\label{sec:limitations}

The framework has deliberate gaps, and each one constrains what may be claimed from it. The preservation laws are proposals. The five morphism kinds are not closed under composition (Proposition~\ref{prop:composition-not-typed}), the one-category question is open, and any theorem that composes morphisms is conditional on the repair chosen from Corollary~\ref{cor:schema-not-category}. The admissibility conditions are proposals as well, and Proposition~\ref{prop:conditional} shows that statements over $\mathrm{Phys}_{\mathrm{adm}}$ change when the list changes.

The equivalence relation is declared per class and is not derived. For the restricted classes of Section~\ref{sec:restricted} the declared relation is mathematical equivalence, and a physical classification of the same objects would need a different relation with its own justification. The choice of physical equivalence for realistic systems is open, and the preserved-structure discipline of Definition~\ref{def:preserved-structure} rules out candidate choices without supplying a positive criterion.

The classification theorems are toy theorems. They classify finite classical and finite dynamical records, they say nothing about the candidate structural families, about interacting systems, or about any physical theory, and they do not touch quantum field theory, spacetime, or gravity. Their role is to certify that the definitions support real classification statements, not to advance physics.

No universal classification is claimed. The structural classification conjecture is a conjecture, its five obligations are open except for partial structural characterization, and the finiteness of a generating family set is unproved. The literature surveyed in Section~\ref{sec:problem} is registered background of the series, and the survey that registered it searched primarily arXiv and known sources, so citations absent from this paper are not evidence of absence in the literature.

A revision of the framework has a clear path. The preservation laws need completion in three directions: the inter-kind composition rule of Corollary~\ref{cor:schema-not-category}, the algebraic form of the laws for quantum and gauge records, and the status of dualities as equivalences between record presentations. The admissibility list needs testing against records the paper does not treat, in particular gauge records with constraints and lattice records with a continuum limit. The equivalence relation needs a positive criterion rather than only the negative constraint of Definition~\ref{def:preserved-structure}. Each of these is a stated task with a stated failure mode, and none of them is settled by the present definitions.

\section{Conclusion}
\label{sec:conclusion}

The paper established the definitional layer the classification program needs. A representation is a five-component record, morphisms are declared in five kinds with explicit preservation laws, admissibility is fixed by four record conditions and two class-level conditions, and physical equivalence is a declared choice with a preserved-structure discipline. Inside that framework the morphism kinds are proved not to compose across kinds while each kind is closed under self-composition, so the morphism vocabulary is a schema rather than a category. Finite classical records are classified by cardinality, finite dynamical records decompose uniquely into connected components, finite symmetric records are classified by orbit type, and each class satisfies the generation statement from its irreducibles. A four-dimensional example shows that decomposition requires factorization data the bare record does not carry.

The preservation laws, the admissibility conditions, and the equivalence relation are proposals, and every statement over admissible systems is conditional on them. Four of the five obligations of the structural classification conjecture are open and the fifth is only partial, and a negative outcome for the conjecture would be a result of equal value.

What follows is that the definitions are precise enough to be refutable, the classification problem is now statable, the obligations are tracked, and the restricted theorems set a standard of proof that any claim of classification in this program will have to meet.

\begin{thebibliography}{23}

\bibitem{gorenstein1982}
D. Gorenstein, Finite Simple Groups: An Introduction to Their Classification, Plenum Press (1982).

\bibitem{solomon2001}
R. Solomon, ``A brief history of the classification of the finite simple groups,'' Bulletin of the American Mathematical Society 38 (2001) 315--352. DOI: \url{https://doi.org/10.1090/S0273-0979-01-00909-0}.

\bibitem{atlas-book}
J. H. Conway, R. T. Curtis, S. P. Norton, R. A. Parker, and R. A. Wilson, ATLAS of Finite Groups, Oxford University Press (1985).

\bibitem{humphreys1972}
J. E. Humphreys, Introduction to Lie Algebras and Representation Theory, Springer (1972). DOI: \url{https://doi.org/10.1007/978-1-4612-6398-2}.

\bibitem{dixmier1977}
J. Dixmier, $C^*$-Algebras, North-Holland (1977).

\bibitem{connes1976}
A. Connes, ``Classification of injective factors,'' Annals of Mathematics 104 (1976) 73--115. DOI: \url{https://doi.org/10.2307/1971057}.

\bibitem{mcduff1969}
D. McDuff, ``Uncountably many II$_1$ factors,'' Annals of Mathematics 90 (1969) 372--377. DOI: \url{https://doi.org/10.2307/1970730}.

\bibitem{milnor1956}
J. Milnor, ``Construction of universal bundles I,'' Annals of Mathematics 63 (1956) 430--436. DOI: \url{https://doi.org/10.2307/1969609}.

\bibitem{scott1983}
G. P. Scott, ``The geometries of 3-manifolds,'' Bulletin of the London Mathematical Society 15 (1983) 401--487. DOI: \url{https://doi.org/10.1112/blms/15.5.401}.

\bibitem{tancer}
M. Tancer, ``Simpler algorithmically unrecognizable 4-manifolds,'' arXiv:2310.07421 (2023). URL: \url{https://arxiv.org/abs/2310.07421}.

\bibitem{arnold1978}
V. I. Arnold, Mathematical Methods of Classical Mechanics, Springer (1978). DOI: \url{https://doi.org/10.1007/978-1-4757-2063-1}.

\bibitem{rabin1958}
M. O. Rabin, ``Recursive unsolvability of group theoretic problems,'' Annals of Mathematics 67 (1958) 172--194. DOI: \url{https://doi.org/10.2307/1969933}.

\bibitem{buchweitz-leuschke}
R.-O. Buchweitz and G. J. Leuschke, ``Factoring the adjoint and maximal Cohen-Macaulay modules over the generic determinant,'' arXiv:math/0505315 (2005). URL: \url{https://arxiv.org/abs/math/0505315}.

\bibitem{gelfand-naimark1943}
I. M. Gelfand and M. A. Naimark, ``On the imbedding of normed rings into the ring of operators in Hilbert space,'' Matematicheskii Sbornik 12 (1943) 197--213. Reprint DOI: \url{https://doi.org/10.1090/conm/167/16}.

\bibitem{stone1936}
M. H. Stone, ``The theory of representations for Boolean algebras,'' Transactions of the American Mathematical Society 40 (1936) 37--111. DOI: \url{https://doi.org/10.1090/S0002-9947-1936-1501865-8}.

\bibitem{doplicher-roberts}
S. Doplicher and J. E. Roberts, ``A new duality theory for compact groups,'' Inventiones Mathematicae 98 (1989) 157--218. DOI: \url{https://doi.org/10.1007/BF01388849}.

\bibitem{deligne2002}
P. Deligne, ``Cat\'egories tensorielles,'' Moscow Mathematical Journal 2 (2002) 227--248. DOI: \url{https://doi.org/10.17323/1609-4514-2002-2-2-227-248}.

\bibitem{weinstein1983}
A. Weinstein, ``The local structure of Poisson manifolds,'' Journal of Differential Geometry 18 (1983) 523--557. DOI: \url{https://doi.org/10.4310/jdg/1214437787}.

\bibitem{etingof-gelaki}
P. Etingof and S. Gelaki, ``Isocategorical groups,'' arXiv:math/0007196 (2000). URL: \url{https://arxiv.org/abs/math/0007196}.

\bibitem{maclane1971}
S. Mac Lane, Categories for the Working Mathematician, Springer (1971). DOI: \url{https://doi.org/10.1007/978-1-4757-4721-8}.

\bibitem{openai-claim}
OpenAI, ``Building scientific understanding with academic communities,'' October 2026. URL: \url{https://openai.com/index/building-scientific-understanding-with-academic-communities/}.

\bibitem{kitp}
Kavli Institute for Theoretical Physics, Yang-Mills working group statement, October 2026. URL: \url{https://www.kitp.ucsb.edu/sites/default/files/YM_working_group.pdf}.

\bibitem{clay}
Clay Mathematics Institute, Yang-Mills millennium problem page, accessed October 2026. URL: \url{https://www.claymath.org/millennium/yang-mills-the-maths-gap/}.

\end{thebibliography}

\appendix
\section{Code evidence}
\label{app:code}

Every computational claim of this paper is listed in Table~\ref{tab:code-evidence} with the file that carries the computation and the check that runs it. The files live under \texttt{src/vol-01-foundations/}. The Haskell module instantiates the shared taxonomy classes for the records of Definitions~\ref{def:finite-classical} to \ref{def:qubit}; the Python experiments enumerate the finite cases and evaluate the two-qubit example. Computational evidence is not proof. The proofs of Section~\ref{sec:restricted} stand on their own, and the experiments exist to catch disagreements between the statements and their models.

One simplification in the instance layer should be recorded. The Haskell record for Definition~\ref{def:qubit} carries a state vector and a factorization tag, and it records the observable algebra of $B(\mathbb{C}^4)$ by dimension only; the factorization tag stores the factor dimensions and not the basis change of Proposition~\ref{prop:factorization-nonunique}. The two factorizations of that proposition are realized in the Python experiment, which computes the Schmidt entropy in each. The instance layer therefore demonstrates the record schema and the equivalence declarations, and the two-qubit computation is carried by the experiment file.

\begin{table}[ht]
\centering
\small
\caption{Code evidence for the computational claims of the paper. Each row names the claim, the artifact that carries the computation, and the check performed.}
\label{tab:code-evidence}
\begin{tabularx}{\textwidth}{L{0.30\textwidth} L{0.34\textwidth} X}
\toprule
Claim & Artifact & Check \\
\midrule
Irreducibles under disjoint union are one-point records & \path{exp_disjoint_union_irreducibles.py} & Exhaustive enumeration up to eight points \\
Cardinality classifies finite classical records & \path{exp_disjoint_union_irreducibles.py} & Brute-force isomorphism counting between labeled records \\
Irreducibles under product are prime-cardinality records & \path{exp_product_irreducibles.py} & Factorization enumeration up to sixty points \\
Finite dynamical records decompose uniquely into components & \path{exp_finite_dynamics_decomposition.py} & Enumeration of all maps on up to four points \\
Composite of embedding and coarse-graining is untyped & \path{exp_morphism_composition.py} & Exhaustive check of the stated counterexample \\
Factorization changes the entanglement entropy & \path{exp_qubit_factorization.py} & Numerical Schmidt entropy in both factorizations \\
Taxonomy instances type-check against the shared classes & \path{Instances.hs} & Compilation of the instance layer \\
\bottomrule
\end{tabularx}
\end{table}

\end{document}

exec
/usr/local/bin/zsh -lc 'cat src/vol-01-foundations/exp_disjoint_union_irreducibles.py' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
# Phase D experiment for vol-01-foundations.
# Claim evidenced: Theorem 8.1, finite classical records under disjoint union.
# (a) the irreducibles are exactly the one-point records, (b) the decomposition
# into one-point records is unique up to order, and (c) cardinality is a
# complete invariant, checked by brute-force isomorphism counting between
# labeled records. Computational evidence only; the proof is in the paper.

from itertools import combinations


def partitions(xs):
    """All set partitions of a list, as lists of blocks."""
    if not xs:
        yield []
        return
    first, rest = xs[0], xs[1:]
    for parts in partitions(rest):
        for i in range(len(parts)):
            yield parts[:i] + [[first] + parts[i]] + parts[i + 1:]
        yield [[first]] + parts


def factorial(n):
    r = 1
    for k in range(2, n + 1):
        r *= k
    return r


def all_maps(X, Y):
    if not X:
        yield {}
        return
    first, rest = X[0], X[1:]
    for partial in all_maps(rest, Y):
        for y in Y:
            yield {first: y, **partial}


def is_record_isomorphism(mp, X, Y):
    """A record isomorphism is a bijection of state spaces carrying R^X to R^Y.

    The observable condition is checked on the generators of R^X: the point
    masses delta_x must transport to the point masses delta_{mp(x)}, which is
    automatic for a bijection and fails for any non-injective or non-surjective
    map.
    """
    if set(mp.values()) != set(Y):
        return False
    if len(set(mp.values())) != len(X):
        return False
    for x in X:
        # the observable delta_x on X transports to delta_{mp(x)} on Y
        transported = {y: 1.0 if y == mp[x] else 0.0 for y in Y}
        if transported.get(mp[x], 0.0) != 1.0:
            return False
    return True


def count_record_isomorphisms(n, m):
    X = list(range(n))
    Y = list(range(m))
    return sum(1 for mp in all_maps(X, Y) if is_record_isomorphism(mp, X, Y))


def check(max_n=8):
    failures = []
    for n in range(1, max_n + 1):
        X = list(range(n))
        # (a) a nontrivial disjoint-union split exists exactly when n > 1
        splittable = False
        for r in range(1, n):
            for A in combinations(X, r):
                B = [x for x in X if x not in A]
                if A and B:
                    splittable = True
        irreducible = not splittable
        if irreducible != (n == 1):
            failures.append(f"(a) failed at n={n}")
        # (b) every decomposition into irreducibles has n one-point factors
        for parts in partitions(X):
            if all(len(b) == 1 for b in parts):
                if len(parts) != n:
                    failures.append(f"(b) failed at n={n}")
    # (c) brute-force isomorphism counting on labeled records, n, m <= 4
    for n in range(1, 5):
        for m in range(1, 5):
            count = count_record_isomorphisms(n, m)
            expected = factorial(n) if m == n else 0
            if count != expected:
                failures.append(f"(c) failed between n={n} and m={m}")
    return failures


if __name__ == "__main__":
    fails = check()
    if fails:
        for f in fails:
            print("FAIL:", f)
    else:
        print("PASS: irreducibles are the one-point records for 1 <= |X| <= 8")
        print("PASS: every decomposition has |X| one-point factors")
        print("PASS: brute-force isomorphism counts match cardinality classes")

exec
/usr/local/bin/zsh -lc 'cat src/vol-01-foundations/exp_product_irreducibles.py' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
# Phase D experiment for vol-01-foundations.
# Claim evidenced: Example 7.5, finite classical records with composition rule
# the cartesian product. The unit is the one-point record (the empty product),
# the irreducibles are the records of prime cardinality, and every record
# decomposes into prime cardinality factors unique up to order.
# Computational evidence only.


def prime_factors(n):
    if n <= 1:
        return []
    out = []
    d = 2
    m = n
    while d * d <= m:
        while m % d == 0:
            out.append(d)
            m //= d
        d += 1
    if m > 1:
        out.append(m)
    return out


def nontrivial_product_splits(n):
    """Pairs (a, b) with a, b >= 2 and a * b = n."""
    return [(a, n // a) for a in range(2, n) if n % a == 0]


def check(max_n=60):
    failures = []
    for n in range(1, max_n + 1):
        splits = nontrivial_product_splits(n)
        # irreducible exactly when n is not the unit and has no split
        # into non-unit factors
        irreducible = n != 1 and not splits
        expected = is_prime(n)
        if irreducible != expected:
            failures.append(f"irreducibility failed at n={n}")
        factors = prime_factors(n)
        product = 1
        for p in factors:
            product *= p
        if product != n:
            failures.append(f"factorization failed at n={n}")
        if n > 1 and sorted(factors) != sorted(prime_factors(n)):
            failures.append(f"uniqueness check failed at n={n}")
        if n > 1 and not all(is_prime(p) for p in factors):
            failures.append(f"non-prime factor at n={n}")
    return failures


def is_prime(p):
    if p < 2:
        return False
    d = 2
    while d * d <= p:
        if p % d == 0:
            return False
        d += 1
    return True


if __name__ == "__main__":
    fails = check()
    if fails:
        for f in fails:
            print("FAIL:", f)
    else:
        print("PASS: unit is the one-point record and irreducibles are prime cardinalities")
        print("PASS: every cardinality factors into primes, unique up to order")
        print("PASS: exhaustive over 1 <= n <= 60")

exec
/usr/local/bin/zsh -lc 'cat src/vol-01-foundations/exp_finite_dynamics_decomposition.py' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
# Phase D experiment for vol-01-foundations.
# Claim evidenced: Theorem 8.2, finite dynamical records under disjoint union.
# (a) irreducibility equals connectedness of the functional graph,
# (b) the connected-component decomposition is the unique finest invariant
# partition, and (c) isomorphism is decided by the multiset of component
# isomorphism classes. Computational evidence only; the proof is in the paper.

from itertools import permutations, product as iproduct


def set_partitions(xs):
    if not xs:
        yield []
        return
    first, rest = xs[0], xs[1:]
    for parts in set_partitions(rest):
        for i in range(len(parts)):
            yield parts[:i] + [[first] + parts[i]] + parts[i + 1:]
        yield [[first]] + parts


def components_of(n, fmap):
    neigh = {x: set() for x in range(n)}
    for x in range(n):
        y = fmap[x]
        neigh[x].add(y)
        neigh[y].add(x)
    seen, comps = set(), []
    for x in range(n):
        if x in seen:
            continue
        stack, comp = [x], []
        while stack:
            u = stack.pop()
            if u in seen:
                continue
            seen.add(u)
            comp.append(u)
            stack.extend(neigh[u] - seen)
        comps.append(sorted(comp))
    return comps


def invariant_partitions(n, fmap):
    out = []
    for parts in set_partitions(list(range(n))):
        if all(all(fmap[x] in block for x in block) for block in parts):
            out.append([sorted(b) for b in parts])
    return out


def canonical_component(fmap, comp):
    best = None
    for perm in permutations(comp):
        relabel = {old: i for i, old in enumerate(perm)}
        signature = tuple(
            sorted((relabel[x], relabel[fmap[x]]) for x in comp)
        )
        if best is None or signature < best:
            best = signature
    return best


def check_structure(max_n=4):
    failures = []
    for n in range(1, max_n + 1):
        for fmap in iproduct(range(n), repeat=n):
            comps = components_of(n, fmap)
            parts = invariant_partitions(n, fmap)
            irreducible = len(comps) == 1
            splittable = any(len(p) > 1 for p in parts)
            if irreducible == splittable:
                failures.append(f"(a) failed at n={n} f={fmap}")
            comp_sets = [frozenset(c) for c in comps]
            for p in parts:
                p_sets = [frozenset(b) for b in p]
                for c in comp_sets:
                    if not any(c <= q for q in p_sets):
                        failures.append(f"(b) failed at n={n} f={fmap}")
    return failures


def check_conjugacy(max_n=4):
    systems = list(iproduct(range(max_n), repeat=max_n))
    sigs = {
        f: sorted(
            canonical_component(f, c) for c in components_of(max_n, f)
        )
        for f in systems
    }
    checked = 0
    for a in systems:
        for b in systems:
            checked += 1
            same_sig = sigs[a] == sigs[b]
            conj = any(
                all(perm[a[x]] == b[perm[x]] for x in range(max_n))
                for perm in permutations(range(max_n))
            )
            if same_sig != conj:
                return [f"(c) failed at f={a} g={b}"], checked
    return [], checked


if __name__ == "__main__":
    fails = check_structure()
    cfails, pairs = check_conjugacy()
    fails.extend(cfails)
    if fails:
        for f in fails[:20]:
            print("FAIL:", f)
    else:
        print("PASS: irreducible equals connected for all maps on <= 4 points")
        print("PASS: component partition is the finest invariant partition")
        print(f"PASS: conjugacy matches component signatures on {pairs} pairs")

exec
/usr/local/bin/zsh -lc 'cat src/vol-01-foundations/exp_morphism_composition.py' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
# Phase D experiment for vol-01-foundations.
# Claim evidenced: Proposition 4.4, composition of morphism kinds is not
# typed. The composite of an admissible embedding and an admissible
# coarse-graining on finite classical records is a constant state map that
# satisfies none of the five preservation laws. Computational evidence only.

SOURCE = {"a": 0, "b": 1}
MID = {"1": 0, "2": 1, "3": 2, "4": 3}
TARGET = {"p": 0, "q": 1}

E_STATE = {"a": "1", "b": "3"}
G_STATE = {"1": "p", "2": "q", "3": "p", "4": "q"}


def compose(g, f):
    return {x: g[f[x]] for x in f}


def is_injective(m):
    return len(set(m.values())) == len(m)


def is_surjective(m, codomain):
    return set(m.values()) == set(codomain)


def is_bijective(m, codomain):
    return is_injective(m) and is_surjective(m, codomain)


def preserves_laws(composite, source, target):
    """Check the five preservation laws of Definition 4.3 on a state map."""
    results = {}
    results["coarse-graining (surjective state map)"] = is_surjective(
        composite, target
    )
    results["embedding (injective state map)"] = is_injective(composite)
    results["equivalence (bijective state map)"] = is_bijective(
        composite, target
    )
    results["duality (invertible after opposite)"] = is_bijective(
        composite, target
    )
    results["limiting procedure (named limit process)"] = False
    return results


if __name__ == "__main__":
    composite = compose(G_STATE, E_STATE)
    e_ok = is_injective(E_STATE) and set(E_STATE.values()) <= set(MID)
    g_ok = is_surjective(G_STATE, TARGET)
    laws = preserves_laws(composite, SOURCE, TARGET)
    print("embedding admissible:", e_ok)
    print("coarse-graining admissible:", g_ok)
    print("composite state map:", composite)
    for law, holds in laws.items():
        print(f"  {law}: {'holds' if holds else 'fails'}")
    if e_ok and g_ok and not any(laws.values()):
        print("PASS: composite satisfies no listed preservation law")
    else:
        print("FAIL: counterexample did not behave as Proposition 4.4 states")

exec
/usr/local/bin/zsh -lc 'cat src/vol-01-foundations/exp_qubit_factorization.py' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
# Phase D experiment for vol-01-foundations.
# Claim evidenced: Proposition 7.6, factorization is extra data. A fixed
# unit vector of a four-dimensional Hilbert space has entanglement entropy 0
# in one factorization and log 2 in the other. Computational evidence only;
# the proof is in the paper.

import numpy as np

LOG2 = np.log(2.0)


def schmidt_coefficients(psi):
    """Schmidt coefficients of a two-qubit pure state (four amplitudes)."""
    M = np.asarray(psi, dtype=complex).reshape(2, 2)
    return np.linalg.svd(M, compute_uv=False)


def entanglement_entropy(psi):
    s = schmidt_coefficients(psi)
    probs = s ** 2
    probs = probs[probs > 1e-12]
    return float(-np.sum(probs * np.log(probs)))


if __name__ == "__main__":
    v1 = np.array([1.0, 0.0, 0.0, 0.0], dtype=complex)
    v2 = np.array([0.0, 0.0, 0.0, 1.0], dtype=complex)

    # rotation W on span{v1, v2} used in the proof of Proposition 7.6
    psi_product = v1
    psi_rotated = (v1 + v2) / np.sqrt(2.0)

    e0 = entanglement_entropy(psi_product)
    e1 = entanglement_entropy(psi_rotated)

    print(f"standard factorization: entropy {e0:.12f}")
    print(f"rotated factorization:  entropy {e1:.12f}")
    print(f"schmidt coefficients:   {schmidt_coefficients(psi_rotated)}")

    ok0 = abs(e0 - 0.0) < 1e-9
    ok1 = abs(e1 - LOG2) < 1e-9
    if ok0 and ok1:
        print("PASS: entropy is 0 in one factorization and log 2 in the other")
    else:
        print("FAIL: entropies did not match Proposition 7.6")

exec
/usr/local/bin/zsh -lc 'cat src/vol-01-foundations/Instances.hs' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
{-# LANGUAGE TypeFamilies #-}

{-|
Module      : Instances
Description : Taxonomy instances for the records of vol-01-foundations.
Copyright   : (c) Matthew Long, 2026
License     : MIT
Maintainer  : matthew@yonedaai.com
Stability   : experimental

Executable instance layer for "Foundations of Structural Classification"
(Part 1 of The Classification of Mathematical Representations of Physical
Systems). The shared family classes live in "Taxonomy.Families",
"Taxonomy.Constructions", and "Taxonomy.Equivalences"; this module imports
them and declares instances for the physical systems of Definitions 3.4 to 3.6
of the paper, with names mirroring the paper and the Lean targets of
verification/vol-01-foundations-lean-targets.md.

Claim status (docs/theorem-registry.md): this module is computational
evidence, never proof. Nothing here is machine-checked, and no executable
model is verified by Lean. The Lean targets are statements only; no Lean
build exists for this program.
-}
module Instances
  ( -- * Record component data (Definitions 3.1 to 3.6)
    FiniteStateSpace (..)
  , FullFunctionAlgebra (..)
  , IdentityDynamics (..)
  , TrivialSymmetry (..)
  , DisjointUnionComposition (..)
  , CartesianProductComposition (..)
  , DiscreteTimeMap (..)
  , Factorization (..)
    -- * Systems (Definitions 3.4 to 3.6)
  , FiniteStateSystem (..)
  , FiniteProductSystem (..)
  , FiniteDynamicalSystem (..)
  , BipartiteQubitSystem (..)
    -- * Computations mirroring the paper
  , primeFactors
  , functionalGraphComponents
  , conjugateMaps
  , schmidtCoefficients
  , schmidtRank
    -- * Demonstration
  , demo
  ) where

import Data.Complex (Complex (..), magnitude)
import Data.List (nub, permutations, sort)

import Taxonomy.Constructions
  ( Construction (..)
  , Constructible (..)
  , Decomposable (..)
  , Decomposition (..)
  , Irreducible (..)
  )
import Taxonomy.Equivalences
  ( MathematicalEquivalence (..)
  , PhysicalEquivalence (..)
  )
import Taxonomy.Families (PhysicalSystem (..))

-- | DEF-003 for the finite classes: the state space X = {0, ..., n-1}.
newtype FiniteStateSpace = FiniteStateSpace [Int]
  deriving (Eq, Show)

-- | DEF-004 for the finite classes: the full algebra O = R^X, recorded by
-- the cardinality of X since the algebra is determined by it.
newtype FullFunctionAlgebra = FullFunctionAlgebra Int
  deriving (Eq, Show)

-- | DEF-005 in the trivial case: identity dynamics.
data IdentityDynamics = IdentityDynamics
  deriving (Eq, Show)

-- | DEF-006 in the trivial case: the trivial symmetry group.
data TrivialSymmetry = TrivialSymmetry
  deriving (Eq, Show)

-- | DEF-007 for Definition 3.4: C is the disjoint union of state spaces.
data DisjointUnionComposition = DisjointUnionComposition
  deriving (Eq, Show)

-- | DEF-007 for Example 7.5: C is the cartesian product of state spaces.
data CartesianProductComposition = CartesianProductComposition
  deriving (Eq, Show)

-- | DEF-005 for Definition 3.5: dynamics given by a self-map f, recorded as
-- its graph.
newtype DiscreteTimeMap = DiscreteTimeMap [(Int, Int)]
  deriving (Eq, Show)

-- | DEF-007 for Definition 3.6: a chosen factorization of a four-dimensional
-- space into two qubit factors. Proposition 7.6 shows this data is not
-- recoverable from the bare record. The tag stores the factor dimensions;
-- the basis change of Proposition 7.6 is realized in the Phase D experiment.
data Factorization = Factorization
  { factorDimA :: Int
  , factorDimB :: Int
  }
  deriving (Eq, Show)

-- | Definition 3.4 (Lean target vol01.finiteState.classify_iff_card_eq):
-- finite classical records P = (X, R^X, id, trivial, disjoint union).
data FiniteStateSystem = FiniteStateSystem
  { fsCardinality :: Int
  }
  deriving (Eq, Show)

-- | Example 7.5 (Lean target vol01.product.irreducible_iff_prime_card): the
-- same records with composition rule the cartesian product.
data FiniteProductSystem = FiniteProductSystem
  { fpsCardinality :: Int
  }
  deriving (Eq, Show)

-- | Definition 3.5 (Lean targets vol01.dynamics.irreducible_iff_connected
-- and vol01.dynamics.connected_components_unique): finite dynamical records
-- with a self-map of discrete time.
data FiniteDynamicalSystem = FiniteDynamicalSystem
  { fdsStates :: [Int]
  , fdsMap :: [(Int, Int)]
  }
  deriving (Eq, Show)

-- | Definition 3.6 (Lean target vol01.qubit.factorization_nonunique):
-- bipartite qubit records, carrying a chosen factorization.
data BipartiteQubitSystem = BipartiteQubitSystem
  { bqsAmplitudes :: [(Double, Double)]
    -- ^ Four complex amplitudes of the state vector, as (real, imaginary).
  , bqsFactorization :: Factorization
  }
  deriving (Eq, Show)

-- | DEF-002 record schema: finite classical systems.
instance PhysicalSystem FiniteStateSystem where
  type StateSpace FiniteStateSystem = FiniteStateSpace
  type Observables FiniteStateSystem = FullFunctionAlgebra
  type Dynamics FiniteStateSystem = IdentityDynamics
  type Symmetries FiniteStateSystem = TrivialSymmetry
  type Composition FiniteStateSystem = DisjointUnionComposition
  stateSpace p = FiniteStateSpace [0 .. fsCardinality p - 1]
  observables p = FullFunctionAlgebra (fsCardinality p)
  dynamics _ = IdentityDynamics
  symmetries _ = TrivialSymmetry
  composition _ = DisjointUnionComposition

-- | DEF-002 record schema: finite systems with product composition.
instance PhysicalSystem FiniteProductSystem where
  type StateSpace FiniteProductSystem = FiniteStateSpace
  type Observables FiniteProductSystem = FullFunctionAlgebra
  type Dynamics FiniteProductSystem = IdentityDynamics
  type Symmetries FiniteProductSystem = TrivialSymmetry
  type Composition FiniteProductSystem = CartesianProductComposition
  stateSpace p = FiniteStateSpace [0 .. fpsCardinality p - 1]
  observables p = FullFunctionAlgebra (fpsCardinality p)
  dynamics _ = IdentityDynamics
  symmetries _ = TrivialSymmetry
  composition _ = CartesianProductComposition

-- | DEF-002 record schema: finite dynamical systems.
instance PhysicalSystem FiniteDynamicalSystem where
  type StateSpace FiniteDynamicalSystem = FiniteStateSpace
  type Observables FiniteDynamicalSystem = FullFunctionAlgebra
  type Dynamics FiniteDynamicalSystem = DiscreteTimeMap
  type Symmetries FiniteDynamicalSystem = TrivialSymmetry
  type Composition FiniteDynamicalSystem = DisjointUnionComposition
  stateSpace p = FiniteStateSpace (fdsStates p)
  observables p = FullFunctionAlgebra (length (fdsStates p))
  dynamics p = DiscreteTimeMap (fdsMap p)
  symmetries _ = TrivialSymmetry
  composition _ = DisjointUnionComposition

-- | DEF-002 record schema: bipartite qubit systems.
instance PhysicalSystem BipartiteQubitSystem where
  type StateSpace BipartiteQubitSystem = [(Double, Double)]
  type Observables BipartiteQubitSystem = FullFunctionAlgebra
  type Dynamics BipartiteQubitSystem = IdentityDynamics
  type Symmetries BipartiteQubitSystem = Factorization
  type Composition BipartiteQubitSystem = Factorization
  stateSpace = bqsAmplitudes
  observables _ = FullFunctionAlgebra 4
  dynamics _ = IdentityDynamics
  symmetries = bqsFactorization
  composition = bqsFactorization

-- | DEF-016 on Definition 3.4: Theorem 8.1, claim 3. Two finite classical
-- records are isomorphic exactly when their cardinalities agree.
instance MathematicalEquivalence FiniteStateSystem where
  mathematicallyEquivalent a b = fsCardinality a == fsCardinality b

-- | DEF-016 on Example 7.5: isomorphism is still a bijection of state spaces.
instance MathematicalEquivalence FiniteProductSystem where
  mathematicallyEquivalent a b = fpsCardinality a == fpsCardinality b

-- | DEF-016 on Definition 3.5: Theorem 8.2, claim 3. Isomorphism of dynamical
-- records is conjugacy of the self-maps. Decided by brute force on the
-- symmetric group for up to eight states, which covers the Phase D
-- enumerations; larger systems are outside the scope of this instance.
instance MathematicalEquivalence FiniteDynamicalSystem where
  mathematicallyEquivalent a b =
    length (fdsStates a) == length (fdsStates b)
      && length (fdsStates a) <= 8
      && conjugateMaps a b

-- | DEF-016 on Definition 3.6: isomorphism of qubit records is local-unitary
-- equivalence, decided by equality of Schmidt coefficient lists.
instance MathematicalEquivalence BipartiteQubitSystem where
  mathematicallyEquivalent a b =
    map round6 (schmidtCoefficients (bqsAmplitudes a))
      == map round6 (schmidtCoefficients (bqsAmplitudes b))
    where
      round6 x = fromIntegral (round (x * 1.0e6) :: Integer) / 1.0e6

-- | DEF-015 on Definition 3.4: the declared equivalence for the restricted
-- class is mathematical equivalence (condition AC-6 of the paper).
instance PhysicalEquivalence FiniteStateSystem where
  physicallyEquivalent = mathematicallyEquivalent

-- | DEF-015 on Definition 3.5: the declared equivalence is mathematical
-- equivalence.
instance PhysicalEquivalence FiniteDynamicalSystem where
  physicallyEquivalent = mathematicallyEquivalent

-- | DEF-015 on Definition 3.6: the declared relation compares local-unitary
-- classes through Schmidt coefficients. The declaration is a choice, and the
-- choice of physical equivalence is open in general.
instance PhysicalEquivalence BipartiteQubitSystem where
  physicallyEquivalent = mathematicallyEquivalent

-- | DEF-023 hooks for Definition 3.4: the composition rule is disjoint union
-- (direct sum). The product hook is not supplied on this type, which is what
-- makes irreducibility relative to the composition rule.
instance Constructible FiniteStateSystem where
  type Composite FiniteStateSystem = FiniteStateSystem
  tensorProduct _ _ = Nothing
  directSum a b = Just (FiniteStateSystem (fsCardinality a + fsCardinality b))
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

-- | DEF-023 hooks for Example 7.5: the composition rule is the cartesian
-- product.
instance Constructible FiniteProductSystem where
  type Composite FiniteProductSystem = FiniteProductSystem
  tensorProduct a b =
    Just (FiniteProductSystem (fpsCardinality a * fpsCardinality b))
  directSum _ _ = Nothing
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

-- | DEF-023 hooks for Definition 3.5: disjoint union of dynamical records,
-- acting componentwise on the self-maps.
instance Constructible FiniteDynamicalSystem where
  type Composite FiniteDynamicalSystem = FiniteDynamicalSystem
  tensorProduct _ _ = Nothing
  directSum a b =
    Just FiniteDynamicalSystem
      { fdsStates = fdsStates a ++ map (+ offset) (fdsStates b)
      , fdsMap =
          fdsMap a ++ [(x + offset, y + offset) | (x, y) <- fdsMap b]
      }
    where
      offset = maximum (0 : fdsStates a) + 1
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

-- | DEF-023 hooks for Definition 3.6: the record carries one factorization
-- and no composite construction is supplied here. Proposition 7.6 is the
-- reason a composite cannot be read off the bare record.
instance Constructible BipartiteQubitSystem where
  type Composite BipartiteQubitSystem = BipartiteQubitSystem
  tensorProduct _ _ = Nothing
  directSum _ _ = Nothing
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

-- | DEF-021 for Definition 3.4: irreducibility is relative to disjoint
-- union. Lean target vol01.finiteState.irreducible_iff_card_eq_one.
instance Irreducible FiniteStateSystem where
  irreducibilityBasis _ = DirectSum

-- | DEF-021 for Example 7.5: irreducibility is relative to the product.
instance Irreducible FiniteProductSystem where
  irreducibilityBasis _ = TensorProduct

-- | DEF-021 for Definition 3.5: irreducibility is relative to disjoint
-- union, and equals connectedness of the functional graph.
instance Irreducible FiniteDynamicalSystem where
  irreducibilityBasis _ = DirectSum

-- | DEF-021 for Definition 3.6: irreducibility is relative to the tensor
-- product of factors.
instance Irreducible BipartiteQubitSystem where
  irreducibilityBasis _ = TensorProduct

-- | DEF-022 for Definition 3.4: Theorem 8.1, claim 2. The decomposition is
-- into one-point records, unique up to order.
instance Decomposable FiniteStateSystem where
  decomposition p =
    Just Decomposition
      { decompositionConstruction = DirectSum
      , irreducibleFactors =
          replicate (fsCardinality p) (FiniteStateSystem 1)
      }

-- | DEF-022 for Example 7.5: decomposition into prime-cardinality factors.
-- Lean target vol01.product.irreducible_iff_prime_card.
instance Decomposable FiniteProductSystem where
  decomposition p =
    Just Decomposition
      { decompositionConstruction = TensorProduct
      , irreducibleFactors =
          map FiniteProductSystem (primeFactors (fpsCardinality p))
      }

-- | DEF-022 for Definition 3.5: Theorem 8.2, claim 2. The decomposition is
-- into the records on the connected components of the functional graph.
instance Decomposable FiniteDynamicalSystem where
  decomposition p =
    Just Decomposition
      { decompositionConstruction = DirectSum
      , irreducibleFactors =
          [ FiniteDynamicalSystem
              { fdsStates = comp
              , fdsMap = [(x, y) | (x, y) <- fdsMap p, x `elem` comp]
              }
          | comp <- functionalGraphComponents (fdsStates p) (fdsMap p)
          ]
      }

-- | DEF-022 for Definition 3.6: no decomposition is supplied from the bare
-- record, and Proposition 7.6 shows none can be.
instance Decomposable BipartiteQubitSystem where
  decomposition _ = Nothing

-- | Example 7.5: prime factorization of a positive integer. The empty list
-- is the unit, the empty product.
primeFactors :: Int -> [Int]
primeFactors n
  | n <= 1 = []
  | otherwise = go n 2
  where
    go 1 _ = []
    go m d
      | m `mod` d == 0 = d : go (m `div` d) d
      | d * d > m = [m]
      | otherwise = go m (d + 1)

-- | Theorem 8.2: connected components of a functional graph, computed as the
-- weakly connected components of the undirected edge set {x, f(x)}.
functionalGraphComponents :: [Int] -> [(Int, Int)] -> [[Int]]
functionalGraphComponents states edges = go [] states
  where
    neighbours x =
      nub ([y | (a, y) <- edges, a == x] ++ [a | (a, y) <- edges, y == x])
    reachableFrom start = sort (walk [start] [start])
      where
        walk [] seen = seen
        walk (x : rest) seen =
          let nxt = [y | y <- neighbours x, y `notElem` seen]
           in walk (rest ++ nxt) (seen ++ nxt)
    go _ [] = []
    go visited (x : xs)
      | x `elem` visited = go visited xs
      | otherwise =
          let c = reachableFrom x
           in c : go (visited ++ c) xs

-- | Theorem 8.2, claim 3: conjugacy of two self-maps, decided by testing all
-- relabelings for systems of at most eight states.
conjugateMaps :: FiniteDynamicalSystem -> FiniteDynamicalSystem -> Bool
conjugateMaps a b
  | length sa /= length sb = False
  | length sa > 8 = False
  | otherwise = any works (permutations sb)
  where
    sa = fdsStates a
    sb = fdsStates b
    lookupA = fdsMap a
    lookupB = fdsMap b
    app m x = case lookup x m of
      Just y -> y
      Nothing -> x
    works phi =
      and [ app lookupB (phiOf phi x) == phiOf phi (app lookupA x)
          | x <- sa
          ]
    phiOf phi x = case [i | (i, s) <- zip [0 ..] sa, s == x] of
      (i : _) -> phi !! i
      [] -> x

-- | Proposition 7.6: Schmidt coefficients of a two-qubit pure state given by
-- four complex amplitudes, computed as the singular values of the reshaped
-- 2 by 2 amplitude matrix.
schmidtCoefficients :: [(Double, Double)] -> [Double]
schmidtCoefficients amps =
  case map toComplex amps of
    [a, b, c, d] ->
      let row1 = [a, b]
          row2 = [c, d]
          mm x y = sum (zipWith (\u v -> magnitude u * magnitude v) x y)
          t = mm row1 row1 + mm row2 row2
          detSq = magnitude (a * d - b * c) ^ (2 :: Int)
          disc = max 0 (t * t - 4 * detSq)
          s1 = sqrt (max 0 ((t + sqrt disc) / 2))
          s2 = sqrt (max 0 ((t - sqrt disc) / 2))
       in sort [s1, s2]
    _ -> error "schmidtCoefficients: expected four amplitudes"
  where
    toComplex (x, y) = x :+ y

-- | Proposition 7.6: Schmidt rank of a two-qubit pure state.
schmidtRank :: [(Double, Double)] -> Int
schmidtRank amps = length (filter (> 1.0e-9) (schmidtCoefficients amps))

-- | Executable evidence for the statements of the paper. Computation is
-- never proof; the proofs live in the paper.
demo :: IO ()
demo = do
  putStrLn "=== vol-01-foundations: taxonomy instance demo ==="
  putStrLn ""
  putStrLn "-- Theorem 8.1 (a): irreducible under disjoint union iff |X| = 1"
  let states = [FiniteStateSystem n | n <- [1 .. 8]]
  mapM_
    ( \p ->
        putStrLn
          ( "  |X| = "
              ++ show (fsCardinality p)
              ++ ", irreducible: "
              ++ show (fsCardinality p == 1)
          )
    )
    states
  putStrLn ""
  putStrLn "-- Theorem 8.1 (b): decomposition into one-point records"
  print (decomposition (FiniteStateSystem 5))
  putStrLn ""
  putStrLn "-- Theorem 8.1 (c): isomorphism exactly when cardinalities agree"
  print (mathematicallyEquivalent (FiniteStateSystem 3) (FiniteStateSystem 3))
  print (mathematicallyEquivalent (FiniteStateSystem 3) (FiniteStateSystem 4))
  putStrLn ""
  putStrLn "-- Example 7.5: irreducibles under product are prime cardinalities"
  mapM_
    ( \n ->
        putStrLn
          ( "  "
              ++ show n
              ++ " = "
              ++ show (primeFactors n)
          )
    )
    [1, 2, 4, 6, 12, 30, 97]
  putStrLn ""
  putStrLn "-- Theorem 8.2: components of a functional graph"
  let dyn =
        FiniteDynamicalSystem
          { fdsStates = [0, 1, 2, 3, 4, 5]
          , fdsMap = [(0, 1), (1, 2), (2, 0), (3, 3), (4, 5), (5, 4)]
          }
  print (decomposition dyn)
  putStrLn ""
  putStrLn "-- Theorem 8.2 (c): conjugacy of self-maps"
  let dynB =
        FiniteDynamicalSystem
          { fdsStates = [0, 1, 2, 3, 4, 5]
          , fdsMap = [(0, 0), (1, 2), (2, 3), (3, 1), (4, 5), (5, 4)]
          }
      dynC =
        FiniteDynamicalSystem
          { fdsStates = [0, 1, 2, 3, 4, 5]
          , fdsMap = [(0, 1), (1, 0), (2, 3), (3, 2), (4, 5), (5, 4)]
          }
  putStrLn
    ( "  relabeled cycles: "
        ++ show (mathematicallyEquivalent dyn dynB)
    )
  putStrLn
    ( "  different cycle type: "
        ++ show (mathematicallyEquivalent dyn dynC)
    )
  putStrLn ""
  putStrLn "-- Proposition 7.6: factorization changes entanglement"
  let psi0 = [(1, 0), (0, 0), (0, 0), (0, 0)]
      psi1 = [(1 / sqrt 2, 0), (0, 0), (0, 0), (1 / sqrt 2, 0)]
  putStrLn
    ( "  product vector: Schmidt rank "
        ++ show (schmidtRank psi0)
        ++ ", coefficients "
        ++ show (schmidtCoefficients psi0)
    )
  putStrLn
    ( "  rotated vector: Schmidt rank "
        ++ show (schmidtRank psi1)
        ++ ", coefficients "
        ++ show (schmidtCoefficients psi1)
    )
  putStrLn ""
  putStrLn "All demonstrations completed."

exec
/usr/local/bin/zsh -lc "sed -n '200,480p' papers/latex/vol-01-foundations.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
\item \emph{Limiting procedure.} The declared morphism is the leg map of a cone or cocone of a diagram of records under one of the four named limit processes, and the law carries the diagram data. The diagram is indexed by a directed parameter with no terminal object, a family growing without bound or a parameter approaching a limiting value. A map between two fixed finite records is never a limiting procedure of this kind.
\end{enumerate}
\end{definition}

A coarse-graining of finite classical records is worth writing out once. Let $X_1 = \{1, 2, 3, 4\}$ and $X_2 = \{p, q\}$ with $\hat g$ given by $1 \mapsto p$, $2 \mapsto q$, $3 \mapsto p$, $4 \mapsto q$. Every function $h$ on $X_2$ pulls back to $h \circ \hat g$ on $X_1$, so the observable condition holds, and $\hat g$ is surjective. The fiber over $p$ is $\{1, 3\}$ and the fiber over $q$ is $\{2, 4\}$: the coarse-graining identifies states within a fiber and the pulled-back observables are exactly those that are constant on fibers. This is the classical picture of a macro-state. The same construction on quantum records replaces precomposition by an algebra map, and the partial trace on a tensor factor is its standard instance.

The point-set laws above are specializations. Records whose state space is a Hilbert space carry observables that are operators rather than scalar functions, and their morphisms are algebra homomorphisms contravariant on observables and, where states are the primitive data, maps on density matrices. The five kinds and their preservation discipline survive the change of ambient category; only the form of the state map changes.

\begin{table}[ht]
\centering
\small
\caption{The five morphism kinds and the preservation conditions of Definition~\ref{def:concrete-laws}. The composition rule of each law is separate data, and Proposition~\ref{prop:composition-not-typed} shows that the kinds as listed do not carry one.}
\label{tab:morphisms}
\begin{tabularx}{\textwidth}{L{0.18\textwidth} X L{0.32\textwidth}}
\toprule
Kind & State-level condition & Observable-level condition \\
\midrule
Coarse-graining & Surjective map of state spaces & Every target observable pulls back to a source observable \\
Embedding & Injective map of state spaces & Every source observable extends along the embedding \\
Equivalence morphism & Bijection of state spaces & The whole record is carried across \\
Duality & Contravariant equivalence between record presentations & Preserved layers are named explicitly \\
Limiting procedure & Leg map of a cone on a limit diagram & The index has no terminal object \\
\bottomrule
\end{tabularx}
\end{table}

The composition rule is where the vocabulary breaks. The five kinds are not closed under composition, and the failure is visible on the smallest records in the paper.

\begin{proposition}[Composition is not typed]
\label{prop:composition-not-typed}
There are records $P_1, P_2, P_3$ and morphisms $e \colon P_1 \to P_2$ of embedding kind and $g \colon P_2 \to P_3$ of coarse-graining kind whose composite satisfies none of the five preservation laws of Definition~\ref{def:concrete-laws}.
\end{proposition}

\begin{proof}
Take finite classical records with $X_1 = \{a, b\}$, $X_2 = \{1, 2, 3, 4\}$, $X_3 = \{p, q\}$. Let $e$ have state map $a \mapsto 1$ and $b \mapsto 3$, and let $g$ have state map $1 \mapsto p$, $2 \mapsto q$, $3 \mapsto p$, $4 \mapsto q$. Both are admissible: $e$ is injective and every function on $X_1$ extends to $X_2$, and $g$ is surjective and every function on $X_3$ pulls back to $X_2$. The composite $g \circ e$ is the constant state map $a \mapsto p$ and $b \mapsto p$. The constant map is not surjective, so it fails the coarse-graining law. It is not injective, so it fails the embedding law. It is not bijective, so it fails the equivalence law, and it is not invertible in any pairing of record presentations, so it fails the duality law. It is not a limiting procedure, since a map between two fixed finite records is excluded from that law by Definition~\ref{def:concrete-laws}. The composite therefore satisfies no law in the list.
\end{proof}

\begin{corollary}[Schema, not category]
\label{cor:schema-not-category}
The morphism schema of Definition~\ref{def:preservation-law} is not a category. Turning it into one requires one of three decisions: enlarge the kind vocabulary so that composites are retyped, restrict admissible morphisms to those whose composites stay inside the list, or replace the single collection by a multi-category whose composition is typed in each slot. Whether one category suffices at all is open.
\end{corollary}

The composition failure constrains every later statement about morphisms. Any classification theorem that speaks about morphisms of $\mathrm{Phys}$ has to state which of the three decisions it has taken, and any theorem about composition of coarse-grainings, embeddings, or dualities is conditional on that choice.

The obstruction concerns composites of different kinds. Within a single kind the laws are closed.

\begin{proposition}[Self-composition within a kind]
\label{prop:self-composition}
Coarse-grainings compose to coarse-grainings, embeddings compose to embeddings, and equivalence morphisms compose to equivalence morphisms, under the laws of Definition~\ref{def:concrete-laws}.
\end{proposition}

\begin{proof}
Surjective state maps compose to surjective maps, and pullbacks along a composite are the composite of the pullbacks, so a composite of coarse-grainings meets the coarse-graining law. Injective state maps compose to injective maps, and extensions along a composite are the composite of the extensions, so a composite of embeddings meets the embedding law. Bijections carrying the record across compose to bijections carrying the record across. Duality and limiting procedures require the extra data of their laws, and nothing here asserts closure for them.
\end{proof}

Proposition~\ref{prop:composition-not-typed} and Proposition~\ref{prop:self-composition} together locate the difficulty: typed composition holds inside each kind and fails across kinds. Physical modeling composes kinds freely, an embedding followed by a coarse-graining being the common case, so the single-kind restriction of Corollary~\ref{cor:schema-not-category} loses expressiveness, and this paper adopts it only as a working convention: admissible morphisms are restricted to one kind at a time, and Section~\ref{sec:admissibility} builds the resulting categories. A native treatment of inter-kind composition would use a bicategory of spans or cospans, or a typed multicategory, in which a composite carries its two kinds as typing data; that construction is not carried out here, and the inter-kind question stays open.

\section{Equivalence and structural discipline}
\label{sec:equivalence}

The classification problem is a quotient problem: classify objects up to some equivalence. Which equivalence is chosen decides what the classification means, and the two notions the program needs are different in strength.

\begin{definition}[Mathematical equivalence]
\label{def:math-equiv}
Two records $P_1$ and $P_2$ are mathematically equivalent, written $P_1 \cong P_2$, when there is a bijection of state spaces carrying $\mathcal{O}$, $\mathcal{D}$, $\mathcal{S}$, and $\mathcal{C}$ across in the ambient category of each component. Mathematical equivalence is isomorphism of records.
\end{definition}

\begin{definition}[Physical equivalence]
\label{def:phys-equiv}
Physical equivalence $\simeq$ is a chosen equivalence relation on records, declared per class of systems, that identifies representations describing the same physical system. The choice is open. Two mathematical descriptions may be physically equivalent without being mathematically isomorphic.
\end{definition}

The second definition is a stipulation, and its content is that the choice carries weight. Dual theories can describe the same observable physics through different mathematical structures, so a classification that uses isomorphism in place of $\simeq$ classifies representations rather than systems. The program therefore requires that every use of $\simeq$ be declared, and Section~\ref{sec:restricted} declares it explicitly for the restricted classes it classifies.

\begin{definition}[Preserved-structure record]
\label{def:preserved-structure}
An identification of two records must name the layers of structure it preserves. The layers are the symmetric monoidal layer, the monoidal layer without symmetry, the braided layer, the plain tensor layer, the *-structure of operator-algebraic data, the algebraic structure, the topological structure, complete positivity of channels, and the unitary freedom of dilations. An identification that names no preserved layer is not admissible.
\end{definition}

The requirement is a discipline with a proved reason. Tensor-category equivalence that discards the symmetric layer does not determine the group: non-isomorphic finite groups can carry equivalent plain tensor representation categories \cite{etingof-gelaki}. Any classification built on an equivalence that forgets the monoidal or symmetric layer is therefore false as a classification of the underlying structures, and every equivalence record in the series must state what it preserves.

\begin{remark}[The Yoneda qualification]
\label{rem:yoneda}
The Yoneda embedding $P \mapsto \mathrm{Hom}(-, P)$ is established mathematics: in a locally small category an object is determined up to isomorphism by its representable functor \cite{maclane1971}. The physical interpretation of that embedding is open, and the program adopts the following constraint verbatim. ``Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.'' Relational data alone settles none of the three, and a later volume that derives any of the three from representability alone has derived nothing.
\end{remark}

Physical equivalence is also distinct from empirical indistinguishability, and the program keeps the two apart by construction.

\begin{definition}[Three layers]
\label{def:three-layers}
The program separates three layers of achievement. The mathematical layer classifies admissible structures up to the chosen equivalence. The realization layer assigns to classified structures physical systems. The selection layer assigns to physical systems the observational constraints or predictions that experiments bear on. A complete solution of the first layer would not by itself solve the second or the third.
\end{definition}

The separation has two consequences that later volumes inherit. A mathematical structure can be consistent without describing the observed world, and several mathematically distinct theories can produce identical predictions in an experimentally accessible regime. The layers belong to the assembly stage of the series, and the present paper works on the first of them only.

\begin{remark}[Observational equivalence]
\label{rem:observational}
A third relation is often confused with the first two. Two records are observationally equivalent when no measurement available to a stated observer distinguishes them, which is a relation on records relative to a measurement class and an observer, and not an intrinsic relation on mathematical structures. The implication pattern is one-way in each direction that matters: mathematical equivalence implies observational equivalence for any fixed measurement class, while observational equivalence does not imply mathematical equivalence, and physical equivalence is asserted on physical grounds rather than derived from either. Identifying mathematical isomorphism with empirical indistinguishability is therefore a category error, and no classification statement in this series is allowed to make that identification.
\end{remark}

\section{Admissible physical systems}
\label{sec:admissibility}

Arbitrary records are not physical systems. A record with contradictory components, an observable collection that is not closed under its own operations, or dynamics that is not defined on the whole state space is a formal tuple and nothing more. The program needs an explicit list of consistency conditions, and the list below is what this paper must fix.

\begin{definition}[Admissible record]
\label{def:admissibility}
A record $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ is admissible when it satisfies the following four conditions.
\begin{enumerate}[label=AC-\arabic*.,widest=AC-6.,leftmargin=*]
\item \emph{Total record.} All five components are defined, and each is an object of a stated ambient category.
\item \emph{Observable closure.} The collection $\mathcal{O}$ is closed under the operations of its ambient algebra.
\item \emph{Well-posed dynamics.} The dynamics $\mathcal{D}$ acts on the whole state space or observable collection, as a flow, a semigroup action, or an evolution functor.
\item \emph{Symmetry compatibility.} The symmetries and constraints $\mathcal{S}$ act on $X$ preserving the declared structure, and $\mathcal{O}$ is invariant or equivariant under that action.
\end{enumerate}
\end{definition}

\begin{definition}[Admissible class specification]
\label{def:admissible-spec}
A class specification $(\mathcal{K}, \mathrm{Mor}_{\mathcal{K}}, \simeq_{\mathcal{K}})$ is admissible when its records satisfy Definition~\ref{def:admissibility} and the specification itself satisfies the following two conditions.
\begin{enumerate}[label=AC-\arabic*.,widest=AC-6.,leftmargin=*,start=5]
\item \emph{Composition closure.} The class $\mathcal{K}$ is closed under the construction of $\mathcal{C}$ wherever that construction is defined, and the composition rule declares its domain of composability as part of $\mathcal{C}$.
\item \emph{Declared equivalence.} The specification states which equivalence relation of Definition~\ref{def:phys-equiv} is in force and which preservation laws of Definition~\ref{def:concrete-laws} its morphisms obey.
\end{enumerate}
\end{definition}

\begin{definition}[Admissible subcategory]
\label{def:phys-adm}
Let $\mathrm{Phys}_{\mathrm{adm}}$ be the class of records satisfying Definition~\ref{def:admissibility}, inside a class specification satisfying Definition~\ref{def:admissible-spec}. Statements about morphisms are made in one of the categories $\mathrm{Phys}^{K}_{\mathrm{adm}}$, whose objects are the records of $\mathrm{Phys}_{\mathrm{adm}}$ and whose morphisms are those of a single kind $K$ closed under self-composition, together with the identities; Proposition~\ref{prop:schema-category} supplies these categories. The five-kind schema is not one category, by Proposition~\ref{prop:composition-not-typed}, and a morphism statement that crosses kinds has no ambient category until one of the resolutions of Corollary~\ref{cor:schema-not-category} is adopted.
\end{definition}

\begin{table}[ht]
\centering
\small
\caption{The six admissibility conditions: AC-1 to AC-4 constrain a record (Definition~\ref{def:admissibility}) and AC-5 to AC-6 constrain a class specification (Definition~\ref{def:admissible-spec}), with the subject each condition constrains and the failure it excludes.}
\label{tab:admissibility}
\begin{tabularx}{\textwidth}{L{0.16\textwidth} L{0.20\textwidth} X}
\toprule
Condition & Subject & Failure excluded \\
\midrule
AC-1 Total record & A record & A component left implicit or undefined \\
AC-2 Observable closure & A record & An observable collection not closed under its own operations \\
AC-3 Well-posed dynamics & A record & An evolution that does not act on the whole record \\
AC-4 Symmetry compatibility & A record & A symmetry action that breaks the observables or the constraints \\
AC-5 Composition closure & A class specification & A composition rule with an undeclared domain of composability \\
AC-6 Declared equivalence & A class specification & An identification with no stated equivalence or preservation law \\
\bottomrule
\end{tabularx}
\end{table}

The conditions are proposals. They are strong enough to yield a category and weak enough to admit the restricted classes of Definition~\ref{def:finite-classical} through \ref{def:qubit}, and they are open to revision. What the series may not do is leave them implicit, since every theorem over $\mathrm{Phys}_{\mathrm{adm}}$ is conditional on them.

\begin{proposition}[Admissible morphisms form a category]
\label{prop:schema-category}
Fix a morphism kind whose preservation law contains the identities and is closed under self-composition, and take the admissible morphisms to be those of the chosen kind. Then the admissible records of Definition~\ref{def:phys-adm} together with these morphisms form a category. For the laws of Definition~\ref{def:concrete-laws} the coarse-graining kind, the embedding kind, and the equivalence kind qualify, by Proposition~\ref{prop:self-composition}.
\end{proposition}

\begin{proof}
Composition of admissible morphisms is admissible by hypothesis, and the identity on a record satisfies the identity conditions of each law. Associativity and the identity laws hold because the morphisms are maps of records and composition of maps is associative. The composition rule of Definition~\ref{def:preservation-law} is exactly the hypothesis needed, which is why the open status of that rule is the open status of the category structure.
\end{proof}

\begin{proposition}[Conditionality over admissible systems]
\label{prop:conditional}
Every statement quantified over $\mathrm{Phys}_{\mathrm{adm}}$ is conditional on the chosen admissibility conditions and the chosen preservation laws. Removing a condition enlarges the class and can falsify statements that hold for the smaller class.
\end{proposition}

\begin{proof}
Consider the sentence $\Phi$: for every record $P$ in the class with $\mathcal{O}(P) \subseteq \mathbb{R}^{X}$ and all $f, h \in \mathcal{O}(P)$, the sum $f + h$ lies in $\mathcal{O}(P)$. With AC-2 in force, $\Phi$ holds on $\mathrm{Phys}_{\mathrm{adm}}$, because AC-2 requires $\mathcal{O}$ to be closed under the operations of its ambient algebra and addition is one of them. With AC-2 dropped and the remaining conditions kept, the record with $X = \{1, 2\}$, $\mathcal{O} = \{\delta_1, \delta_2\}$ of point masses, trivial dynamics, and trivial symmetries is admitted, and $\Phi$ fails on it since $\delta_1 + \delta_2$ is the constant function $1$ and is not in $\mathcal{O}$. The class of true statements therefore depends on the list.
\end{proof}

The word conditional is used here in the technical sense of the claim-status discipline of Section~\ref{sec:claims}. Until the list is accepted or replaced, results about $\mathrm{Phys}_{\mathrm{adm}}$ are conditional statements and are recorded as such.

Each condition excludes a concrete pathology, and the list can be tested record by record. A tuple with a component named but not defined fails AC-1. An observable collection such as the two point masses on a two-point state space fails AC-2. A Hamiltonian vector field defined only on an open subset of the state space fails AC-3. A symmetry action that moves an observable outside the observable collection fails AC-4. A composition rule that produces records with undefined components on some inputs, with no declared domain, fails AC-5. A class of records with no declared equivalence relation fails AC-6. The conditions are strong enough to rule these out and weak enough to admit the restricted classes of Section~\ref{sec:restricted}, and that pairing is the design criterion for any revision of the list.

\section{Irreducibility and decomposition}
\label{sec:irreducibility}

Which systems are simple is not a property of a record alone. It is a property of a record together with the composition rule $\mathcal{C}$, and the same object can be irreducible under one rule and decomposable under another.

\begin{definition}[Irreducibility]
\label{def:irreducible}
Fix a composition rule $\mathcal{C}$ and write $\mathbf{1}_{\mathcal{C}}$ for its neutral record, the unit of $\mathcal{C}$ when one exists. A record $P$ is irreducible relative to $\mathcal{C}$ when $P$ is not isomorphic to $\mathbf{1}_{\mathcal{C}}$ and admits no decomposition $P \cong \mathcal{F}(P_1, P_2)$ with $\mathcal{F}$ the composition construction of $\mathcal{C}$ and neither $P_1$ nor $P_2$ isomorphic to $\mathbf{1}_{\mathcal{C}}$. The class of irreducibles is $\mathfrak{J}_{\mathcal{C}}$.
\end{definition}

\begin{definition}[Decomposition]
\label{def:decomposition}
A decomposition of $P$ is an expression $P \cong \mathcal{F}(I_1, \dots, I_n)$ with each $I_i$ in $\mathfrak{J}_{\mathcal{C}}$ and $\mathcal{F}$ an admissible construction. The unit record is the empty decomposition. Uniqueness of decomposition is open in general.
\end{definition}

\begin{definition}[Closure]
\label{def:closure}
For a collection $\mathfrak{F}$ of records and a set $\mathfrak{C}$ of admissible constructions, the closure $\langle \mathfrak{F} \rangle_{\mathfrak{C}}$ is the smallest class of records containing $\mathfrak{F}$ and closed under the constructions of $\mathfrak{C}$. The symbol $\mathcal{C}$ stays reserved for the composition coordinate of an individual record, and the set $\mathfrak{C}$ is program-level data.
\end{definition}

The constructions of the program are the tensor product, the direct sum, extension, limits and colimits, and factorization of a representation into factors, and each use of a construction must state the composition data it contributes to $\mathcal{C}$. In the restricted classes below only two of these are active: disjoint union, which is a direct sum of state spaces, and the cartesian product, which is a tensor product of finite sets. The restriction is deliberate. A framework that cannot state and prove a theorem about its simplest constructions has no standing to state one about tensor products of quantum field theories.

The dependence of irreducibility on $\mathcal{C}$ is checkable on the finite classical records in two ways.

\begin{example}[Irreducibles under disjoint union]
\label{ex:union-irreducibles}
In $\mathrm{Phys}_{\mathrm{fin}}$ with $\mathcal{C}$ the disjoint union of state spaces, the neutral record is the empty record, and Definition~\ref{def:irreducible} excludes it from the irreducibles. The irreducibles are exactly the one-point records. A record with more than one point splits as $X = \{x\} \cup (X \setminus \{x\})$ into two nonempty records, and a one-point record admits no split into two nonempty parts.
\end{example}

\begin{example}[Irreducibles under product]
\label{ex:product-irreducibles}
Take the same records with $\mathcal{C}$ the cartesian product of state spaces and product composition rules. The neutral record is the one-point record, and it is the empty product. The irreducibles are the records of prime cardinality. A record of cardinality $n$ decomposes as a product of records of prime cardinality, and the multiset of prime factors is unique up to order by unique prime factorization.
\end{example}

The two examples classify the same class of records and disagree on the irreducibles. Irreducibility is relative to $\mathcal{C}$, and no statement about simple systems is meaningful until the composition rule is part of the record.

Uniqueness of decomposition fails as soon as the record carries less than the composition data. The smallest instance is two qubits.

\begin{proposition}[Factorization is extra data]
\label{prop:factorization-nonunique}
For any four-dimensional complex Hilbert space $H$ there exist two factorizations $H \cong \mathbb{C}^2 \otimes \mathbb{C}^2$ and a unit vector $\psi \in H$ whose entanglement entropy is $0$ in one factorization and $\log 2$ in the other. The bare record $(H, B(H), \mathrm{id}_H, U(H))$ does not determine the decomposition of $H$ into factors.
\end{proposition}

\begin{proof}
Write $v_1 = e_1 \otimes e_1$ and $v_2 = e_2 \otimes e_2$. In the standard factorization $\psi = v_1$ is a product vector, its Schmidt rank is one, and its entanglement entropy is $0$. Let $W$ be the unitary of $H$ that acts on the span of $v_1, v_2$ by the rotation $W v_1 = (v_1 + v_2)/\sqrt{2}$ and $W v_2 = (v_1 - v_2)/\sqrt{2}$, and acts as the identity on the orthogonal complement. Then $W$ is self-adjoint and unitary on that span, so $W^2$ is the identity there. Write $\Phi_1 \colon H \to \mathbb{C}^2 \otimes \mathbb{C}^2$ for the standard factorization, so that $\psi = v_1$ has coordinate vector $v_1$. The second factorization is the pullback $\Phi_2 = \Phi_1 \circ W^{-1}$: the vector $\psi$ is unchanged and the factorizing isomorphism changes. In the coordinates of $\Phi_2$ the fixed vector $\psi$ is represented by $\Phi_2(\psi) = \Phi_1(W^{-1} \psi)$, and since $W^2$ is the identity on the span of $v_1, v_2$ we have $W^{-1} = W$ there, so the coordinate vector is $W \psi = (v_1 + v_2)/\sqrt{2} = (e_1 \otimes e_1 + e_2 \otimes e_2)/\sqrt{2}$. Its Schmidt coefficients are $1/\sqrt{2}$ and $1/\sqrt{2}$ and its entanglement entropy is $\log 2$. Both factorizations are legitimate structures on $H$, so the decomposition into factors is not a function of the bare Hilbert space.
\end{proof}

Two qualifications bound the claim. Factorizations related by a local unitary or by the swap of the two factors give the same entanglement entropy for every vector, so the proposition asserts the existence of a differing pair of factorizations and does not claim that every pair differs. When the symmetry data $\mathcal{S}$ of the record is fixed as a concrete subgroup $U(2) \times U(2)$ of $U(4)$, as in Definition~\ref{def:qubit}, that subgroup does pick out a tensor factorization up to factor swap, which is why Definition~\ref{def:qubit} makes the factorization part of the record.

Entanglement is a relation between a vector and a chosen tensor structure, and a classification of quantum systems that forgets the tensor structure classifies vectors in a bare space. The non-uniqueness visible here is the smallest member of the family of phenomena, entanglement, emergence, and gauge redundancy among them, that make decomposition uniqueness open for interacting systems in general.

\section{Classification in restricted classes}
\label{sec:restricted}

A framework for classification is worth having when classification theorems can be stated and proved inside it. Two restricted classes admit complete classification, and the theorems below give the series its smallest worked instances: an irreducible list, a decomposition theorem, a complete invariant, and a proof.

\begin{theorem}[Finite classical classification]
\label{thm:finite-state-classification}
Let $P$ and $Q$ be records of $\mathrm{Phys}_{\mathrm{fin}}$ with state spaces of cardinality $m$ and $n$, with composition rule the disjoint union, and with mathematical equivalence as the declared equivalence relation. Then:
\begin{enumerate}
\item $P$ is irreducible if and only if $m = 1$;
\item $P$ decomposes as a disjoint union of $m$ one-point records, and this decomposition is unique up to order and isomorphism of factors;
\item $P \cong Q$ if and only if $m = n$;
\item the cardinality $|X|$ is a complete invariant, and the quotient $\mathrm{Ob}(\mathrm{Phys}_{\mathrm{fin}})/\cong$ is in bijection with the nonnegative integers, the empty record corresponding to zero.
\end{enumerate}
\end{theorem}

\begin{proof}
Claim 1 is Example~\ref{ex:union-irreducibles}. For claim 2, the state space is the disjoint union of its points, each point carries a one-point record, and cardinality is additive under disjoint union, so any decomposition into irreducibles has exactly $m$ one-point factors. For claim 3, an isomorphism of records in this class is a bijection of state spaces, since the observable algebra is the full algebra of functions, the dynamics is the identity, and the symmetry data is trivial; finite sets are in bijection exactly when their cardinalities agree. Claim 4 restates claim 3 as the classification of the quotient.
\end{proof}

The classification is complete and parameterized, in the regime of Table~\ref{tab:regimes} where classifications are sharp. It is also close to trivial, which is the point: the framework supports a full theorem with a proof, and the theorem's simplicity is measured evidence that the definitions are well formed rather than evidence about physics.

\begin{theorem}[Finite dynamical decomposition]
\label{thm:dynamical-decomposition}
Let $P$ be a record of $\mathrm{Phys}_{\mathrm{dyn}}$ with state space $X$ and dynamics $f \colon X \to X$, and call two states adjacent when one is the image of the other under $f$. Then:
\begin{enumerate}
\item $P$ is irreducible if and only if the functional graph of $f$ is weakly connected;
\item $P$ decomposes as the disjoint union of the records on its connected components, and this decomposition is unique up to order and isomorphism of factors;
\item $P \cong Q$ if and only if the multisets of connected-component isomorphism classes of $P$ and $Q$ agree.
\end{enumerate}
\end{theorem}

\begin{proof}
A decomposition $P \cong P_1 \sqcup P_2$ corresponds to a partition $X = X_1 \cup X_2$ with $f(X_i) \subseteq X_i$ for both parts. If the functional graph is disconnected, the parts of a disconnection are invariant and give a decomposition into two non-unit records. If the graph is weakly connected and such a partition existed, then for every edge $(x, f(x))$ the point $x$ lies in some part $X_i$ and invariance forces $f(x)$ into the same part, so no edge crosses the partition and the graph would be disconnected, which is a contradiction. This proves claim 1. For claim 2, every connected component is invariant, so the components give a decomposition, and each component is irreducible by claim 1. Any decomposition into irreducibles is a partition of $X$ in which every block is invariant, and the argument just given shows that no edge crosses between blocks, so every block is a union of connected components; irreducibility of a block forces it to be exactly one component. The multiset of factors is therefore the multiset of components and does not depend on the decomposition. For claim 3, an isomorphism of records is a bijection $\varphi \colon X \to Y$ with $\varphi \circ f = g \circ \varphi$, and such a bijection carries components bijectively to components, preserving the isomorphism class of each. Conversely, isomorphisms between matched components patch to an isomorphism of records.
\end{proof}

Irreducibility in Definition~\ref{def:irreducible} is indecomposability under $\mathcal{C}$, and it is weaker than the absence of invariant subsystems. On $X = \{1, 2\}$ with $f(1) = 1$ and $f(2) = 1$, the functional graph is weakly connected, so the record is irreducible, while $Y = \{1\}$ is a proper invariant subsystem whose complement $\{2\}$ is not invariant. The distinction runs parallel to the one between simple and indecomposable modules when Maschke's theorem fails, and it keeps claim 2 of Theorem~\ref{thm:dynamical-decomposition} from being read as a statement about subobjects.

The second theorem is complete without being parameterized. The classifying datum of a connected component is the isomorphism class of its functional graph, a directed cycle with rooted trees attached to its vertices, and no single integer records that datum. The class is decidable and enumerable, and the classification runs through graph isomorphism of the components rather than through a finite invariant list. The regime distinction of Table~\ref{tab:regimes} reappears inside one restricted class.

The theorems of this section verify the combinatorial scaffolding of the framework and nothing beyond it. The observable algebra in these classes is the full function algebra, which does no work beyond carrying across bijections, and the theorems do not test how nontrivial observables, Hamiltonian dynamics, or gauge constraints interact under morphisms. Their evidential value is narrower and firmer: on records where every claim is decidable, the definitions of irreducibility, decomposition, generation, and classification compose correctly and are proved in full.

Both theorems declare their equivalence relation explicitly, as condition AC-6 requires: the declared relation is mathematical equivalence of records. A different declared relation would give a different quotient, and the program records the choice rather than assuming it.

\begin{theorem}[Generation in the restricted classes]
\label{thm:generation}
Let $P$ be a record of one of the two restricted classes.
\begin{enumerate}
\item If $P$ is in $\mathrm{Phys}_{\mathrm{fin}}$, then $P$ is a disjoint union of one-point records, and under the product rule $P$ is a product of prime-cardinality records.
\item If $P$ is in $\mathrm{Phys}_{\mathrm{dyn}}$, then $P$ is a disjoint union of records on weakly connected functional graphs.
\item In both cases the generation is effective: the irreducible factors are computed from the state space and the dynamics by finite enumeration.
\end{enumerate}
\end{theorem}

\begin{proof}
Claim 1 restates Theorem~\ref{thm:finite-state-classification} claim 2 and Example~\ref{ex:product-irreducibles}. Claim 2 restates Theorem~\ref{thm:dynamical-decomposition} claim 2. Claim 3 holds because both classes are finite by definition: listing the points of $X$ produces the one-point factors, prime factorization produces the product factors, and breadth-first search in the functional graph produces the components.
\end{proof}

exec
/usr/local/bin/zsh -lc "sed -n '130,199p' papers/latex/vol-01-foundations.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
$\mathfrak{J}_{\mathcal{C}}$ & The class of records irreducible relative to $\mathcal{C}$ \\
$\langle \mathfrak{F} \rangle_{\mathfrak{C}}$ & Closure of a family collection under the constructions $\mathfrak{C}$ \\
$\mathbf{1}_{\mathcal{C}}$ & The neutral record of the composition rule $\mathcal{C}$ \\
\bottomrule
\end{tabularx}
\end{table}

\begin{remark}[Scope of the schema]
\label{rem:scope}
The schema records representations, not the systems they represent, and it treats gauge orbits, superselection sectors, and state spaces with constraints at the level of the components that carry them rather than resolving them into separate object types. Two records may describe one physical system at different levels of coarse-graining, and the schema does not decide when. The remark is a boundary of Definition~\ref{def:record}, not a defect to be patched silently in later sections.
\end{remark}

\begin{example}[Classical Hamiltonian record]
\label{ex:hamiltonian}
Let $X$ be a symplectic manifold, let $\mathcal{O} = C^\infty(X)$, let $\mathcal{D}$ be the Hamiltonian flow of a chosen Hamiltonian $H \in C^\infty(X)$, let $\mathcal{S}$ be the group of symplectomorphisms preserving $H$, and let $\mathcal{C}$ be the product of symplectic manifolds with coupled Hamiltonians. Poisson manifolds give the wider family, whose local models are supplied by Weinstein splitting \cite{weinstein1983}.
\end{example}

\begin{example}[Quantum record]
\label{ex:quantum}
Let $X$ be a Hilbert space, let $\mathcal{O} = B(X)$ or a $C^*$-subalgebra of it, let $\mathcal{D}$ be a strongly continuous one-parameter unitary group or a semigroup of completely positive maps, let $\mathcal{S}$ be the unitary group commuting with $\mathcal{D}$, and let $\mathcal{C}$ be the Hilbert-space tensor product with tensor-product dynamics.
\end{example}

\begin{example}[Lattice record]
\label{ex:lattice}
Let $X$ be the set of vertices of a finite lattice, let $\mathcal{O}$ be the algebra of functions on $X$ generated by local gauge-invariant operators, let $\mathcal{D}$ be the update rule of a lattice gauge model, let $\mathcal{S}$ be the local gauge group acting on the links, and let $\mathcal{C}$ be the gluing of lattices along shared boundaries. Lattice models of gauge theory are the class where restricted theorems of the series have proved attainable and where the continuum limit remains a limiting procedure in the sense of Definition~\ref{def:morphism-kind}.
\end{example}

These classes are deliberately small. Section~\ref{sec:restricted} classifies the first two in full and adds a variant of the first with symmetry data.

\begin{definition}[Finite classical record]
\label{def:finite-classical}
Let $\mathrm{Phys}_{\mathrm{fin}}$ be the class of records $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ with $X$ a finite set, $\mathcal{O} = \mathbb{R}^{X}$ the algebra of all real functions on $X$, $\mathcal{D}$ the identity dynamics, $\mathcal{S}$ the trivial symmetry group, and $\mathcal{C}$ the disjoint union of state spaces. The empty record is admitted and is the neutral record for disjoint union, the $\mathbf{1}_{\mathcal{C}}$ of Definition~\ref{def:irreducible}. The set $X$ ranges over finite sets in a fixed countable universe, so the class is a set rather than a proper class, and isomorphic records with different underlying sets are identified in the quotient of Theorem~\ref{thm:finite-state-classification}.
\end{definition}

\begin{definition}[Finite dynamical record]
\label{def:finite-dynamical}
Let $\mathrm{Phys}_{\mathrm{dyn}}$ be the class of records $P = (X, \mathcal{O}, f, \mathcal{S}, \mathcal{C})$ with $X$ a finite set, $\mathcal{O} = \mathbb{R}^{X}$, dynamics given by a self-map $f \colon X \to X$ of discrete time, $\mathcal{S}$ trivial, and $\mathcal{C}$ the disjoint union of state spaces with the map that acts componentwise. The empty record is admitted and is the neutral record for disjoint union. An invariant subsystem of $P$ is a nonempty subset $Y \subseteq X$ with $f(Y) \subseteq Y$, carrying the restricted record.
\end{definition}

\begin{definition}[Bipartite qubit record]
\label{def:qubit}
Let $\mathrm{Phys}_{\mathrm{qub}}$ be the class of records with $X = \mathbb{C}^2 \otimes \mathbb{C}^2$ carrying a chosen factorization of the four-dimensional space into two qubit factors, $\mathcal{O} = B(X)$, $\mathcal{D}$ the identity, $\mathcal{S}$ the group $U(2) \times U(2)$ of local unitaries, and $\mathcal{C}$ the tensor product of factors. The factorization is part of the record, and Section~\ref{sec:irreducibility} shows what fails when it is left out.
\end{definition}

These classes are records, not physical theories. They exist to make every definition of the paper checkable on explicit objects.

\section{Morphisms and preservation laws}
\label{sec:morphisms}

A classification problem needs morphisms as much as objects. The morphism vocabulary below names five kinds of admissible relationship, and each kind is given a preservation law: the conditions a map of records must meet to count as a morphism of that kind. Without such laws the vocabulary is a list of words.

\begin{definition}[Morphism kind]
\label{def:morphism-kind}
A morphism of records is declared in exactly one of five kinds. A \emph{coarse-graining} forgets microscopic detail while preserving macroscopic observables. An \emph{equivalence morphism} is invertible and represents exact equivalence of representations. An \emph{embedding} realizes $P_1$ as a subsystem, subtheory, or substructure of $P_2$. A \emph{duality} is a contravariant equivalence between two record presentations: invertible as a correspondence between distinct presentations rather than as an arrow of one category. A \emph{limiting procedure} arises from a limit or colimit process, and the named processes of the program are the thermodynamic limit, the infinite-volume limit, the semiclassical limit, and the continuum limit.
\end{definition}

\begin{definition}[Preservation law]
\label{def:preservation-law}
A \emph{morphism of records} $g \colon P_1 \to P_2$ is a tuple $(g_X, g_{\mathcal{O}}, g_{\mathcal{D}}, g_{\mathcal{S}}, g_{\mathcal{C}})$ of maps in the ambient categories of the five components, with $g_X \colon X_1 \to X_2$, with $g_{\mathcal{O}} \colon \mathcal{O}_2 \to \mathcal{O}_1$ contravariant on observables, and with the remaining components transported compatibly with their declared structure; on records carrying dynamics the tuple intertwines the dynamics. Morphisms of records compose componentwise. On point-set records whose observables are functions on the state space, the tuple is determined by the state map through precomposition, and the laws of Definition~\ref{def:concrete-laws} are stated in that specialization. A preservation law for a morphism kind assigns to each declared morphism of that kind explicit conditions on the tuple, and a composition rule stating which kind, if any, the composite of two declared morphisms belongs to. A morphism is admissible when its declared preservation law is stated. The morphism schema is the collection of all admissible morphisms over all kinds.
\end{definition}

The laws used in this paper are the following. Two of the five kinds carry structure beyond a map of records: a duality is a contravariant equivalence between record presentations, and a limiting procedure is the leg of a cone on a diagram of records. Neither is an arrow of an ordinary record category in its own right, and the schema records both as morphism kinds whose preservation law carries the extra structure; the underlying map is the part that composes. The laws are stated for point-set records, and the quantum records of Example~\ref{ex:quantum} require the algebraic form of the same laws: there a coarse-graining is a unital *-homomorphism of observable algebras, as in the partial trace on a tensor factor, and an embedding is an inclusion of algebras, rather than a surjection or an injection of points.

\begin{definition}[Concrete preservation laws]
\label{def:concrete-laws}
\begin{enumerate}
\item \emph{Coarse-graining.} The state map $\hat g \colon X_1 \to X_2$ is surjective, and every observable of $\mathcal{O}_2$ pulls back along $\hat g$ to an observable of $\mathcal{O}_1$. Surjectivity records that every macro-state of $P_2$ is realized by a micro-state of $P_1$.
\item \emph{Embedding.} The state map is injective, every observable of $\mathcal{O}_1$ extends to an observable of $\mathcal{O}_2$ on the embedded states, and the dynamics of $P_1$ is the restriction of the dynamics of $P_2$ to the embedded subsystem.
\item \emph{Equivalence morphism.} The state map is a bijection and carries $\mathcal{O}$, $\mathcal{D}$, $\mathcal{S}$, and $\mathcal{C}$ across, so the map is invertible and its inverse satisfies the same conditions.
\item \emph{Duality.} The declared morphism is the underlying map of a contravariant equivalence between two record presentations. The law names the two presentations, the direction of the correspondence, and the layers of structure preserved in the sense of Definition~\ref{def:preserved-structure}. Invertibility in an opposite category adds nothing to invertibility, since the isomorphisms of a category and of its opposite coincide; the content of the law is the pairing of presentations and the naming of preserved layers.

exec
/usr/local/bin/zsh -lc "sed -n '480,640p' papers/latex/vol-01-foundations.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
\end{proof}

Theorem~\ref{thm:generation} is the structural generation statement of the program proved for two restricted classes. It settles the generation obligation in these classes and nowhere else, and it is one more instance of the pattern recorded for the program at large: generation is proved in restricted domains and open in general.

Symmetry data can be added without losing classification. The third restricted class takes a finite symmetry group acting on the state space.

\begin{theorem}[Finite symmetric classification]
\label{thm:symmetric-classification}
Fix a finite group $G$, and let $\mathrm{Phys}^{G}_{\mathrm{fin}}$ be the records of $\mathrm{Phys}_{\mathrm{fin}}$ with $\mathcal{S} = G$ acting on $X$ by permutations, with $\mathcal{O} = \mathbb{R}^{X}$ carrying the induced action, and with $\mathcal{C}$ the disjoint union of $G$-sets. Then:
\begin{enumerate}
\item $P$ is irreducible if and only if the action of $G$ on $X$ is transitive;
\item $P$ decomposes as the disjoint union of its orbit records, and this decomposition is unique up to order and isomorphism of factors;
\item $P \cong Q$ if and only if for every conjugacy class of subgroups of $G$ the number of orbits with stabilizer in that class agrees;
\item the resulting orbit-counting function is a complete invariant with finite range.
\end{enumerate}
\end{theorem}

\begin{proof}
A partition of $X$ into invariant nonempty parts exists exactly when the action is not transitive, which proves claim 1 in the same way as Theorem~\ref{thm:dynamical-decomposition} claim 1. The orbits are invariant and give a decomposition into transitive records, and any decomposition into irreducibles is a partition into invariant parts, each of which is a single orbit by claim 1, so the multiset of orbits is the multiset of factors and is independent of the decomposition; this proves claim 2. Two transitive $G$-sets are isomorphic exactly when their stabilizer subgroups are conjugate, so an isomorphism of records matches orbits by stabilizer class, and matched orbits patch to an isomorphism of records; this proves claim 3. Claim 4 follows because a finite group has finitely many conjugacy classes of subgroups and each orbit count is bounded by $|X|$.
\end{proof}

Theorem~\ref{thm:symmetric-classification} sits in the parameterized regime of Table~\ref{tab:regimes} and shows that symmetry does not by itself push a restricted class out of it. Its invariant is already a function on conjugacy classes rather than a single number, which is the shape that classifying data takes as soon as group actions enter.

These results do not touch the candidate structural families of Section~\ref{sec:conjecture}, interacting systems, or any physical theory. What they establish is that the framework of Sections \ref{sec:framework} to \ref{sec:admissibility} supports complete restricted classification with proofs, which is a first success criterion of the program.

\section{The structural classification conjecture}
\label{sec:conjecture}

The classification problem of the program is now definable.

\begin{definition}[Classification problem]
\label{def:classification-problem}
The classification problem is $\mathrm{Classify}(\mathrm{Ob}(\mathrm{Phys}_{\mathrm{adm}})/\simeq)$, the classification of admissible records up to the declared physical equivalence. The problem is stated on objects and the declared equivalence; it does not require the five-kind morphism schema to be a category, and morphism statements enter it only through the kind-relative categories of Definition~\ref{def:phys-adm}.
\end{definition}

The program's organizing conjecture asserts that this problem has an answer built from fundamental families and constructions. The families in question are the ten candidate organizing families named in the series ontology: symplectic and Poisson structures, Hilbert spaces and operator algebras, smooth manifolds and geometric structures, principal bundles and connections, probability and measure-theoretic structures, topological and higher-categorical structures, dynamical systems and operator semigroups, tensor categories and compositional structures, discrete combinatorial structures, and derived and homotopical structures. They are candidates, not a completed taxonomy, and some may turn out to be special cases of others.

\begin{conjecture}[Structural classification]
\label{conj:structural}
There is a collection of fundamental structural families $\mathfrak{F} = \{\mathfrak{F}_\alpha\}_{\alpha \in A}$ and a set $\mathfrak{C}$ of admissible constructions such that
\[
\mathrm{Ob}(\mathrm{Phys}_{\mathrm{adm}})/\simeq \;=\; \mathrm{Ob}(\langle \mathfrak{F} \rangle_{\mathfrak{C}})/\simeq ,
\]
where $\langle \mathfrak{F} \rangle_{\mathfrak{C}}$ is the closure of Definition~\ref{def:closure} and the equality means that the two classes of records agree up to the declared physical equivalence. The notation $\mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F} \rangle_{\mathfrak{C}}$ abbreviates this equality of quotients.
\end{conjecture}

The conjecture is registered as a conjecture, and it may enter later volumes only as a declared hypothesis, never as a lemma. Five obligations would turn it into a theorem, and Table~\ref{tab:obligations} records the status of each.

\begin{table}[ht]
\centering
\small
\caption{The five proof obligations of Conjecture~\ref{conj:structural} and their status. Only the fourth has partial content, and that content is a candidate family list together with the admissibility proposal of Definition~\ref{def:admissibility}.}
\label{tab:obligations}
\begin{tabularx}{\textwidth}{L{0.16\textwidth} X L{0.20\textwidth}}
\toprule
Obligation & Content & Status \\
\midrule
Completeness & Every admissible record lies in the closure of the families & Open \\
Soundness & Every generated record satisfies the admissibility conditions & Open \\
Equivalence & Different representations of one system are identified correctly & Open \\
Structural characterization & The families have precise mathematical definitions & Partial \\
Decomposition & Targeted classes are constructed from the families & Open in general \\
\bottomrule
\end{tabularx}
\end{table}

The third obligation is constrained by the preserved-structure discipline of Definition~\ref{def:preserved-structure}: an equivalence that discards the symmetric layer cannot identify the systems correctly, and counterexamples are proved \cite{etingof-gelaki}. The fifth obligation has complete instances in restricted domains and none in general.

Each obligation has a concrete target. Completeness asks for a construction of every admissible record from family data, which in the restricted classes of Section~\ref{sec:restricted} is Theorem~\ref{thm:generation}. Soundness asks for proofs that the constructions preserve the conditions of Definitions~\ref{def:admissibility} and \ref{def:admissible-spec}, which is a question about the constructions and the conditions together. Equivalence asks for a justified choice of $\simeq$ together with proofs that the identification respects the preserved layers. Structural characterization asks for mathematical definitions of the families precise enough to decide membership, and the ten candidates of Section~\ref{sec:conjecture} are named but not yet defined at that precision. Decomposition asks for existence and, in restricted subclasses, uniqueness of the factorization into family data. The evidence in hand is that each of the five has restricted instances and none has a general proof.

The program accepts a negative outcome as a result. A proof that a specified class admits a complete classification, and a proof that certain natural classification objectives are impossible without additional restrictions, count equally as mathematical progress. The obstruction theorems surveyed in Section~\ref{sec:problem} set the expectation: outside tame regimes a total theorem of the finite-simple-group kind is implausible, and the honest synthesis is that restricted-class classification theorems and explicit obstruction theorems together are the realistic output of the program. That synthesis is itself a conjectural expectation and is not proved here.

\section{Claim-status discipline}
\label{sec:claims}

The value of a classification program depends on the honesty of its claim labels. The series uses exactly six, and every theorem-level statement carries exactly one.

\begin{definition}[Claim-status labels]
\label{def:claim-status}
The claim-status labels are the following. \emph{Machine-checked}: a complete formalization has been accepted by a clean kernel-checked build, with the build archived. \emph{Complete-informal-proof}: a complete mathematical proof exists, given in full in the record or cited from the mathematical literature. \emph{Conditional}: the statement is proved from hypotheses recorded explicitly, and some hypothesis is itself unproved. \emph{Conjecture}: a precise statement with no complete proof. \emph{Computational-evidence}: support from computation that is not a proof. \emph{Open-problem}: a stated question with neither proof nor substantial evidence.
\end{definition}

\begin{table}[ht]
\centering
\small
\caption{The six claim-status labels and what each one requires. No label may be upgraded by prose, and computational evidence never upgrades a record.}
\label{tab:claims}
\begin{tabularx}{\textwidth}{L{0.24\textwidth} X}
\toprule
Label & Requirement \\
\midrule
Machine-checked & A complete formalization accepted by a clean kernel-checked build \\
Complete-informal-proof & A complete proof, given here or cited from the literature \\
Conditional & A proof from hypotheses that include unproved statements \\
Conjecture & A precise statement with no complete proof \\
Computational-evidence & Computation that supports a statement without proving it \\
Open-problem & A question with neither proof nor substantial evidence \\
\bottomrule
\end{tabularx}
\end{table}

The discipline applies to this paper's own statements. Proposition~\ref{prop:composition-not-typed}, Proposition~\ref{prop:self-composition}, Corollary~\ref{cor:schema-not-category}, and Theorems~\ref{thm:finite-state-classification}, \ref{thm:dynamical-decomposition}, \ref{thm:generation}, and \ref{thm:symmetric-classification} are complete-informal-proofs proved in full above. Propositions~\ref{prop:schema-category}, \ref{prop:conditional}, and \ref{prop:factorization-nonunique} are complete-informal-proofs over the classes of Definitions~\ref{def:finite-classical} to \ref{def:qubit}, each proved from the definitions given here. Conjecture~\ref{conj:structural} is a conjecture. The experiments of the appendix carry the label computational-evidence and nothing else.

Nothing in the program is machine-checked at the time of writing: no formalization of any record has been accepted by a clean kernel-checked build, and a formalization that is announced but withheld does not qualify for the first label. The record of the announced existence result in constructive quantum field theory reads ``existence claimed; manuscript and formalization withheld; verification pending'' \cite{openai-claim,kitp}, and an existence result and a mass-gap result are separate claims, the Yang-Mills mass gap remaining an open problem \cite{clay}.

Computational evidence is a label, not a step toward the first one. The executable models of the taxonomy layer for this volume are written in Haskell and are computational evidence: they instantiate the definitions of Sections \ref{sec:framework} to \ref{sec:irreducibility}, and they are checked against the statements of Section~\ref{sec:restricted} by executable tests. No such model is verified by Lean, and no claim in this paper rests on a computation rather than on a proof.

The program also separates three levels of mathematical achievement: mathematical formulation, rigorous theorem, and physical validation. The definitions of this paper sit on the first level, the classification theorems of Section~\ref{sec:restricted} sit on the second, and nothing in the program has reached the third.

\section{Limitations}
\label{sec:limitations}

The framework has deliberate gaps, and each one constrains what may be claimed from it. The preservation laws are proposals. The five morphism kinds are not closed under composition (Proposition~\ref{prop:composition-not-typed}), the one-category question is open, and any theorem that composes morphisms is conditional on the repair chosen from Corollary~\ref{cor:schema-not-category}. The admissibility conditions are proposals as well, and Proposition~\ref{prop:conditional} shows that statements over $\mathrm{Phys}_{\mathrm{adm}}$ change when the list changes.

The equivalence relation is declared per class and is not derived. For the restricted classes of Section~\ref{sec:restricted} the declared relation is mathematical equivalence, and a physical classification of the same objects would need a different relation with its own justification. The choice of physical equivalence for realistic systems is open, and the preserved-structure discipline of Definition~\ref{def:preserved-structure} rules out candidate choices without supplying a positive criterion.

The classification theorems are toy theorems. They classify finite classical and finite dynamical records, they say nothing about the candidate structural families, about interacting systems, or about any physical theory, and they do not touch quantum field theory, spacetime, or gravity. Their role is to certify that the definitions support real classification statements, not to advance physics.

No universal classification is claimed. The structural classification conjecture is a conjecture, its five obligations are open except for partial structural characterization, and the finiteness of a generating family set is unproved. The literature surveyed in Section~\ref{sec:problem} is registered background of the series, and the survey that registered it searched primarily arXiv and known sources, so citations absent from this paper are not evidence of absence in the literature.

A revision of the framework has a clear path. The preservation laws need completion in three directions: the inter-kind composition rule of Corollary~\ref{cor:schema-not-category}, the algebraic form of the laws for quantum and gauge records, and the status of dualities as equivalences between record presentations. The admissibility list needs testing against records the paper does not treat, in particular gauge records with constraints and lattice records with a continuum limit. The equivalence relation needs a positive criterion rather than only the negative constraint of Definition~\ref{def:preserved-structure}. Each of these is a stated task with a stated failure mode, and none of them is settled by the present definitions.

\section{Conclusion}
\label{sec:conclusion}

The paper established the definitional layer the classification program needs. A representation is a five-component record, morphisms are declared in five kinds with explicit preservation laws, admissibility is fixed by four record conditions and two class-level conditions, and physical equivalence is a declared choice with a preserved-structure discipline. Inside that framework the morphism kinds are proved not to compose across kinds while each kind is closed under self-composition, so the morphism vocabulary is a schema rather than a category. Finite classical records are classified by cardinality, finite dynamical records decompose uniquely into connected components, finite symmetric records are classified by orbit type, and each class satisfies the generation statement from its irreducibles. A four-dimensional example shows that decomposition requires factorization data the bare record does not carry.

The preservation laws, the admissibility conditions, and the equivalence relation are proposals, and every statement over admissible systems is conditional on them. Four of the five obligations of the structural classification conjecture are open and the fifth is only partial, and a negative outcome for the conjecture would be a result of equal value.

What follows is that the definitions are precise enough to be refutable, the classification problem is now statable, the obligations are tracked, and the restricted theorems set a standard of proof that any claim of classification in this program will have to meet.

\begin{thebibliography}{23}

\bibitem{gorenstein1982}
D. Gorenstein, Finite Simple Groups: An Introduction to Their Classification, Plenum Press (1982).

\bibitem{solomon2001}
R. Solomon, ``A brief history of the classification of the finite simple groups,'' Bulletin of the American Mathematical Society 38 (2001) 315--352. DOI: \url{https://doi.org/10.1090/S0273-0979-01-00909-0}.

\bibitem{atlas-book}
J. H. Conway, R. T. Curtis, S. P. Norton, R. A. Parker, and R. A. Wilson, ATLAS of Finite Groups, Oxford University Press (1985).

\bibitem{humphreys1972}
J. E. Humphreys, Introduction to Lie Algebras and Representation Theory, Springer (1972). DOI: \url{https://doi.org/10.1007/978-1-4612-6398-2}.

\bibitem{dixmier1977}
J. Dixmier, $C^*$-Algebras, North-Holland (1977).

\bibitem{connes1976}
A. Connes, ``Classification of injective factors,'' Annals of Mathematics 104 (1976) 73--115. DOI: \url{https://doi.org/10.2307/1971057}.

\bibitem{mcduff1969}
D. McDuff, ``Uncountably many II$_1$ factors,'' Annals of Mathematics 90 (1969) 372--377. DOI: \url{https://doi.org/10.2307/1970730}.

\bibitem{milnor1956}
J. Milnor, ``Construction of universal bundles I,'' Annals of Mathematics 63 (1956) 430--436. DOI: \url{https://doi.org/10.2307/1969609}.

\bibitem{scott1983}
G. P. Scott, ``The geometries of 3-manifolds,'' Bulletin of the London Mathematical Society 15 (1983) 401--487. DOI: \url{https://doi.org/10.1112/blms/15.5.401}.

\bibitem{tancer}

codex
ROW 1 | Disjoint-union irreducibles are one-point records | SUPPORTS | Enumerates all nontrivial subset splits for cardinalities one through eight and checks irreducibility exactly at one.
ROW 2 | Cardinality classifies finite classical records | SUPPORTS | Counts bijective record maps for every pair of cardinalities one through four and checks the expected factorial counts.
ROW 3 | Product irreducibles have prime cardinality | SUPPORTS | Enumerates all nonunit factor pairs for cardinalities one through sixty and compares indecomposability with primality.
ROW 4 | Finite dynamical records decompose uniquely into components | SUPPORTS | Enumerates all self-maps on one through four points and checks connectedness against splittability and refinement of every invariant partition.
ROW 5 | Embedding followed by coarse-graining can be untyped | SUPPORTS | Constructs the stated constant composite and checks the necessary injectivity, surjectivity, and invertibility conditions, with fixed finite maps excluded from limits.
ROW 6 | Factorization changes entanglement entropy | SUPPORTS | Computes Schmidt entropies zero and log two for the coordinate vectors representing the fixed state in the paper’s two factorizations.
ROW 7 | Taxonomy instances type-check against shared classes | PARTIAL | The file declares instances importing shared classes, but successful compilation cannot be established from the permitted files alone.
VERDICT: NEEDS_FIX
hook: Stop
hook: Stop Completed
tokens used
52,885
ROW 1 | Disjoint-union irreducibles are one-point records | SUPPORTS | Enumerates all nontrivial subset splits for cardinalities one through eight and checks irreducibility exactly at one.
ROW 2 | Cardinality classifies finite classical records | SUPPORTS | Counts bijective record maps for every pair of cardinalities one through four and checks the expected factorial counts.
ROW 3 | Product irreducibles have prime cardinality | SUPPORTS | Enumerates all nonunit factor pairs for cardinalities one through sixty and compares indecomposability with primality.
ROW 4 | Finite dynamical records decompose uniquely into components | SUPPORTS | Enumerates all self-maps on one through four points and checks connectedness against splittability and refinement of every invariant partition.
ROW 5 | Embedding followed by coarse-graining can be untyped | SUPPORTS | Constructs the stated constant composite and checks the necessary injectivity, surjectivity, and invertibility conditions, with fixed finite maps excluded from limits.
ROW 6 | Factorization changes entanglement entropy | SUPPORTS | Computes Schmidt entropies zero and log two for the coordinate vectors representing the fixed state in the paper’s two factorizations.
ROW 7 | Taxonomy instances type-check against shared classes | PARTIAL | The file declares instances importing shared classes, but successful compilation cannot be established from the permitted files alone.
VERDICT: NEEDS_FIX
