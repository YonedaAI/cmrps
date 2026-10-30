---
reviewer: codex (OpenAI) gpt-6.1-sol
type: formatting
paper: vol-11-completeness-obstructions
round: 3
date: 2026-10-30T05:30:04Z
---
Notes from the author: (a) single hyphens in page ranges are the mandated house style (references/paper-format.md) and must not be flagged; (b) the round-2 issue about C*-algebra typography has been fixed, every occurrence is now math-mode C-star.

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
session id: 01a18b49-63b3-7483-8abc-d84bd54bd79d
--------
user
Read ONLY the file papers/latex/vol-11-completeness-obstructions.tex (do not explore other files or directories). Review it for LaTeX formatting issues: compilation errors, missing packages, broken references, inconsistent styling, overfull/underfull boxes, spacing problems. Note: single hyphens in page ranges are the mandated house style and must not be flagged; C-star notation is already math-mode. List all remaining issues with line numbers and concrete fixes. End your response with a VERDICT line — exactly one of: VERDICT: PASS (no issues remain) or VERDICT: NEEDS_FIX (issues listed above must be fixed).
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
I’ll read only the specified LaTeX file and check for formatting issues, references, and likely compilation problems.
exec
/usr/local/bin/zsh -lc 'nl -ba papers/latex/vol-11-completeness-obstructions.tex' in /Users/mlong/Documents/Development/classification-physical-systems
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
    30	
    31	\title{Completeness and Obstructions\\[4pt]
    32	  {\normalsize Part 11 of \emph{The Classification of Mathematical Representations of Physical Systems}}}
    33	\author{Matthew Long\\
    34	  \small The YonedaAI Collaboration, YonedaAI Research Collective\\
    35	  \small Chicago, Illinois, USA\\
    36	  \small \texttt{mlong@yonedalabs.ai}\\
    37	  \small \url{https://yonedalabs.ai}}
    38	\date{October 2026}
    39	
    40	\begin{document}
    41	\maketitle
    42	
    43	\begin{abstract}
    44	This paper determines what can be established about the completeness of a classification of mathematical representations of physical systems. Seven proved obstruction theorems are compiled as a register: there are uncountably many separable type $\mathrm{II}_1$ factors; tensor-category equivalence without symmetric structure does not determine the group; every Markov property of finitely presentable groups is algorithmically undecidable; wild representation categories admit no parametrization by a finite-dimensional variety; homeomorphism of a specific closed four-manifold is unrecognizable; isomorphism of separable von Neumann algebras admits no classification by countable invariants; and the tame-wild dichotomy bounds algorithmic tractability. From these results a classification program is defined as a triple of complete invariant, parameter space, and recognition procedure, and each surveyed domain of mathematical physics is assigned to one of seven regimes. A transport theorem shows that wild embeddings and invariant obstructions propagate along fully faithful functors, so such obstructions travel with any fully faithful re-presentation of a domain. Counterexamples refute three natural completions of the universal classification conjecture. The conjecture itself is examined obligation by obligation and is never used as a lemma. Completeness holds in restricted tame regimes and is provably unattainable elsewhere without further restrictions.
    45	\end{abstract}
    46	
    47	\section{Introduction}
    48	
    49	The classification of finite simple groups is the model of what a total classification theorem looks like: every object of the domain falls into an explicitly described list of families and exceptions, and the list is exhaustive \cite{solomon2001}. The research program of this series asks whether mathematical representations of physical systems admit an analogous classification. The question is precise enough to be attacked only after fixing an equivalence relation on representations, a notion of admissible system, and a catalogue of constructions from which complex systems are assembled. The central identity of the program, that every admissible system is generated by a fixed collection of structural families under a fixed set of constructions, remains a registered conjecture.
    50	
    51	Impossibility theorems bound the structure of classification programs as tightly as exhaustive enumerations do. A theorem showing that no complete invariant or parameter space can exist in a stated generality marks the same kind of mathematical boundary as a theorem listing the objects. The analysis below works out those boundaries for mathematical representations of physical systems: it compiles seven proved obstruction theorems, refutes three natural completions of the universal classification conjecture on explicit counterexamples, and keeps the conjecture itself as an object of study rather than a premise.
    52	
    53	Seven proved obstruction theorems forbid specific forms of classification, and a regime taxonomy applies them to every domain surveyed in the series. A transport theorem, proved here, shows the obstructions survive fully faithful re-presentation of a domain, and three counterexamples, also proved here, refute natural completions of the universal classification problem.
    54	
    55	Established results are cited to the mathematical literature and are used at the strength their proofs support. New statements are proved in full or narrowed until they can be. Counterexample search is part of the method and not an afterthought: for every natural completion of the classification picture considered here, an explicit counterexample was sought, and three completions failed the search. Computational experiments accompany the paper as evidence about finite instances; they are never treated as proofs.
    56	
    57	Wild embeddings and invariant obstructions transport along fully faithful functors, so a wild or undecidable sector embedded in the manner of \Cref{thm:transport} carries its obstruction into the larger domain. The surveyed domains occupy seven distinct regimes, and no coarser taxonomy places them all. Three natural strengthenings of the universal classification conjecture are false: the number of exceptional isomorphism classes in the operator-algebra sector is uncountable, the two-regime picture of classified versus impossible is refuted by concrete domains, and equivalence defined at the plain tensor layer fails to identify systems correctly. The universal conjecture itself, examined against its five proof obligations, has four open obligations and one partial obligation, and its statement is conditional on an unfixed admissibility list.
    58	
    59	\section{Definitions and standing constraints}
    60	
    61	\subsection{Classification problem}
    62	
    63	\begin{definition}[Representation]
    64	\label{def:tuple}
    65	A representation of a physical system is a tuple $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ where $X$ is a state space or geometric structure, $\mathcal{O}$ an observable algebra or collection, $\mathcal{D}$ dynamical laws, $\mathcal{S}$ symmetry and constraint data, and $\mathcal{C}$ composition rules. The five components need not be independent. The composition component fixes what irreducibility means for $P$: a system is irreducible relative to a stated composition operation when it admits no nontrivial decomposition under that operation.
    66	\end{definition}
    67	
    68	The tuple of \Cref{def:tuple} is the coordinate record of the series. The classification problem is
    69	\[
    70	\mathrm{Classify}\bigl(\mathrm{Ob}(\mathrm{Phys})/{\simeq}\bigr),
    71	\]
    72	the classification of representations up to a carefully chosen equivalence $\simeq$.
    73	
    74	Notation is fixed as follows. The symbol $\simeq$ stands for an equivalence relation on objects of a category and $\cong$ for isomorphism; when a domain is introduced, its equivalence is named. The letters $\mathcal{A}$ and $\mathcal{C}$ denote categories, $D$ denotes a domain of objects with an equivalence relation, and $k$ denotes a field. Isomorphism classes are written $\mathrm{Ob}(\mathcal{A})/{\cong}$. The symbol $*$ marks the adjoint of operator-algebraic structures. All classification statements in this paper are statements about mathematical representations, and none is a statement about empirical selection among physical theories.
    75	
    76	Two equivalence notions must be kept apart. Mathematical equivalence is isomorphism of the tuples in the ambient category of each component. Physical equivalence is a chosen relation on objects for which two mathematically different descriptions count as the same system; the choice is load-bearing and is not settled. Every equivalence used to identify systems must state which layer of structure it preserves, and equivalences that forget the monoidal or symmetric layer are provably insufficient \cite{eg2000}. The counterexample is recorded in the register and restated as \Cref{prop:equiv}.
    77	
    78	Obstructions proved for mathematical isomorphism constrain physical equivalence directly on every subsector where physical equivalence coincides with isomorphism. On any subsector where two systems are physically equivalent if and only if their representations are isomorphic, wildness, undecidability, and non-classifiability transfer unconditionally. Coarser physical equivalences can identify additional representations globally, but they cannot dissolve proved mathematical obstructions on subsectors where isomorphism is preserved.
    79	
    80	Yoneda embeddings preserve mathematical structure but cannot determine physical equivalence, empirical adequacy, or classification boundaries. Representing a system $P$ through its functor of points $\operatorname{Hom}(-, P)$ provides relational data without identifying which relational differences are physically observable. The standing qualification of the program binds every such use and is quoted verbatim: Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem. Relational embeddings therefore cannot discharge the equivalence and completeness obligations of Section 7.
    81	
    82	\begin{remark}[Schema and category]
    83	The morphisms of the program, coarse-graining, exact equivalence, embedding, duality, and limiting procedures, do not yet carry fixed preservation laws or composition rules. Until they do, the ambient object is a schema rather than a category. This paper therefore runs its arguments on standard mathematical categories with standard isomorphism relations, and it treats the physical reading of those arguments as conditional on the eventual fixings.
    84	\end{remark}
    85	
    86	\subsection{Admissibility}
    87	
    88	\begin{definition}[Admissible class and closure]
    89	\label{def:adm}
    90	An admissible representation is one satisfying four consistency conditions: internal consistency of the five components of \Cref{def:tuple}; closure of the observable algebra under its stated operations; existence of a well-posed dynamics; and compatibility of symmetry data with composition. The full subcategory of admissible representations is $\mathrm{Phys}_{\mathrm{adm}}$. A structural family is a full subcategory of representations singled out by its underlying mathematical structure, and a family collection is a set $\mathfrak{F} = \{\mathfrak{F}_\alpha\}_{\alpha \in A}$ of them. The construction set $\mathfrak{C}$ consists of tensor product, direct sum, extension, limits and colimits, and factorization, and the closure $\langle \mathfrak{F}_\alpha \rangle_{\mathfrak{C}}$ is the smallest class containing $\mathfrak{F}$ and closed under $\mathfrak{C}$.
    91	\end{definition}
    92	
    93	The central conjecture of the program asserts
    94	\[
    95	\mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F}_\alpha \rangle_{\mathfrak{C}}
    96	\]
    97	for some such family collection and construction set. The candidate conditions of \Cref{def:adm} are the ones the program names; the list is not fixed by any settled mathematics, and every statement quantifying over $\mathrm{Phys}_{\mathrm{adm}}$ is therefore conditional on the list one adopts. The conjecture is registered as an object of study and as a declared hypothesis only; it is never used as a lemma in this paper, and no result here assumes it true or false.
    98	
    99	\begin{remark}[Unfixed premise]
   100	\label{rem:unfixed}
   101	Completeness of a classification over $\mathrm{Phys}_{\mathrm{adm}}$ cannot be evaluated against a moving premise. Until the admissibility list is fixed, the first proof obligation of the universal classification conjecture is not merely open; its statement is conditional. This is an obstruction of an internal kind, and it is the reason the analysis below runs on domains with standard mathematical definitions rather than on $\mathrm{Phys}_{\mathrm{adm}}$ itself.
   102	\end{remark}
   103	
   104	\subsection{Claim discipline}
   105	
   106	Three levels of achievement are distinguished throughout: mathematical formulation, rigorous theorem, and physical validation. The results of this paper sit at the second level. Nothing in this paper establishes physical validation of any representation, and no mathematical classification established here is presented as an empirical selection among physical theories. Where a claim rests on an announcement rather than a published proof, the text says so; one such claim is tracked in a remark outside the regime table.
   107	
   108	\section{Obstruction register}
   109	
   110	Each obstruction below is a proved theorem, and it decides a question a classification program would otherwise have to settle by effort. Two conventions govern the collection. Only theorems with complete proofs in the mathematical literature enter; announcements stay out until they are proved. And an obstruction is recorded at the generality its proof supports: an undecidability result about finitely presented groups says nothing about finite groups, and a wildness result about modules over a specific algebra says nothing about modules over algebras on the tame side. Reading the register is a matter of reading the quantifiers.
   111	
   112	Each row is a theorem, and each theorem decides a question that a classification program would otherwise have to decide by effort. The seven rows divide by the component of \Cref{def:program} they destroy: the invariant, the parameter space, the recognizer, or the equivalence itself.
   113	
   114	\subsection{Factor classification}
   115	
   116	The classification of von Neumann algebra factors reduces, by the Murray-von Neumann direct-integral decomposition, to the classification of factors, and the amenable factors are classified: types $\mathrm{I}_n$, $\mathrm{I}_\infty$, $\mathrm{II}_1$, $\mathrm{II}_\infty$, $\mathrm{III}_\lambda$ for $0 < \lambda \leq 1$, and $\mathrm{III}_0$, with the type $\mathrm{III}_0$ case described by ergodic flows \cite{connes1976,vnwiki}. Outside the amenable class the situation changes completely. McDuff proved in 1969 that there are uncountably many non-isomorphic separable type $\mathrm{II}_1$ factors \cite{mcduff1969}.
   117	
   118	What this forbids is a total classification of factors in the style of the classification of finite simple groups: no list of families and finitely many exceptions can exhaust the separable $\mathrm{II}_1$ factors, and no countable table of isomorphism classes can be complete. What it permits is a classification of the amenable class, which exists, and stratification of the general case by invariants of coarser grain, such as the Connes spectrum, which records partial information only \cite{vnwiki}.
   119	
   120	\subsection{Tensor-category recovery}
   121	\label{sec:tensor-recovery}
   122	
   123	A natural proposal for identifying physical systems is to compare their representation categories as tensor categories and declare two systems equivalent when the categories are equivalent. The proposal fails. Etingof and Gelaki constructed pairs of non-isomorphic finite groups whose representation categories are equivalent as plain tensor categories \cite{eg2000}. The symmetric structure of the category is not recoverable from the plain tensor layer, and two different symmetry groups present the same plain tensor representation theory.
   124	
   125	What this forbids is any classification or equivalence criterion that discards the monoidal or symmetric layer: such a criterion is not merely imprecise, it is false on explicit counterexamples. What it permits is the Doplicher-Roberts style of reconstruction, which takes the symmetric tensor structure with its conjugates, direct sums, subobjects, and $\operatorname{End}(1) = \mathbb{C}$ as input and recovers a compact supergroup unique up to isomorphism \cite{eg2000}. The counterexample is the sharpest constraint in the register, and it is applied twice more in this paper: as an impossibility theorem in the transport analysis, and as a counterexample to a natural completion of the universal conjecture.
   126	
   127	\subsection{Markov undecidability}
   128	
   129	A classification program can aim at an algorithm: given a presentation of an object, decide which isomorphism class it lies in. For finitely presented groups this aim fails at the root. Adyan and Rabin proved that every Markov property of finitely presentable groups is algorithmically undecidable \cite{adyan1955,rabin1958}. The list of Markov properties includes being trivial, being finite, and being simple, so even the coarsest structural tests on finitely presented groups admit no uniform decision procedure. Collins extended undecidability beyond Markov properties, proving that the Hopfian property is undecidable even though neither it nor its negation is Markov \cite{collins1969}.
   130	
   131	What this forbids is any uniform recognition procedure for group-flavored sectors of a classification, including recognition of finiteness and simplicity. What it permits is decision of the same properties on restricted subclasses where the Markov construction does not embed, and it permits recognition procedures that are partial or that come with error. The proof reduces the halting problem to the group property through a Markov set construction, and Section 5 builds transport results on the same reduction pattern.
   132	
   133	\subsection{Wildness}
   134	
   135	The tame-wild dichotomy of Drozd is the boundary of parametrizable representation theory. Bekkert and Drozd proved that every finite-dimensional algebra over an algebraically closed field is derived-tame or derived-wild, and that any degeneration of a derived-wild algebra is again derived-wild \cite{bekkert2003}. Wildness is a property of the category of representations, and it is a non-classifiability statement rather than a difficulty rating. Buchweitz and Leuschke showed that the Cohen-Macaulay representation theory of the generic determinant is wild in a strong sense: already in rank two the isomorphism classes cannot be parametrized by a finite-dimensional variety over the coefficients \cite{buchweitz2005}. Grevstad and May proved that the cohomological Mackey algebra is derived-wild whenever the group surjects onto a $p$-group of order greater than two, and concluded that no meaningful classification of compact $C_p$-equivariant $H\underline{\mathbb{F}}_p$-modules exists at odd primes \cite{grevstad2025}.
   136	
   137	What this forbids is any finite-variety parameterization of the isomorphism classes of a wild representation category, and any classification of a domain that contains such a category as an isomorphism-reflecting subcategory. What it permits is a complete classification theory on the tame side, where parametrizations do exist, and partial invariants on the wild side that ignore the wild core.
   138	
   139	\subsection{Four-manifold unrecognizability}
   140	
   141	In dimension three the geometrization theorem decomposes every oriented prime closed 3-manifold into pieces carrying one of exactly eight Thurston geometries \cite{geometrization}. In dimension four the finite-table picture breaks. Markov's construction shows that unrecognizable four-manifolds exist, that is, manifolds for which the homeomorphism problem is undecidable. Tancer sharpened the construction to show that the connected sum of nine copies of $S^2 \times S^2$ is unrecognizable, improving the previous bound of twelve due to Gordon \cite{tancer2023}. Filipkiewicz classified the four-dimensional maximal model geometries and found eighteen of them plus one countably infinite family, against exactly eight in dimension three \cite{geometrization,perelman,hillman}.
   142	
   143	What this forbids is any effective classification of four-manifolds in general, and any assumption that the finite-list paradigm of dimension three persists upward. What it permits is classification of restricted four-manifold classes, and the dimension contrast itself: finite tables exist in tame regimes, and dimension four is not one of them.
   144	
   145	\subsection{Countable invariants}
   146	
   147	Descriptive set theory supplies a machine for proving that no classification by countable invariants can exist. Sasyk and Tørnquist applied Borel reducibility and Hjorth's theory of turbulence to the isomorphism relation for separable von Neumann algebras \cite{sasyk2009}. The result, as recorded in the survey that this series relies on, is that isomorphism of separable von Neumann algebras admits no classification by countable invariants. The result is published in the Bulletin of Symbolic Logic, with the complete proof in Inventiones Mathematicae \cite{sasyk2009}.
   148	
   149	What this forbids is a complete invariant for general von Neumann algebras taking values in a countable set, and any table of countably many labels exhausting the isomorphism classes. What it permits is classification by uncountable invariant sets, and classification by countable invariants on restricted subclasses.
   150	
   151	\subsection{Tractability boundary}
   152	
   153	The tame-wild dichotomy has an algorithmic shadow. Grochow and Qiao gave polynomial-time algorithms for group isomorphism in the tame direction, for groups whose Sylow subgroups are cyclic, dihedral, semi-dihedral, or generalized quaternion, and showed that the representation-theoretic and cohomological bounds their algorithms need fail in the wild case \cite{grochow2015}. Their conclusion is that the tame-wild line of representation theory is a dividing line between the currently tractable and the currently intractable instances of group isomorphism.
   154	
   155	What this forbids is any promise of a uniform polynomial-time classification procedure across the tame-wild boundary. What it permits is efficient recognition on the tame side, and a precise statement of where the known methods stop.
   156	
   157	\subsection{Register summary}
   158	
   159	\Cref{tab:register} lists each theorem with the classification form it rules out in the generality stated.
   160	
   161	\begin{table}[ht]
   162	\centering
   163	\caption{The obstruction register: seven proved theorems and the classification forms they forbid.}
   164	\label{tab:register}
   165	\small
   166	\begin{tabular}{L{3.2cm}L{4.6cm}L{4.6cm}}
   167	\toprule
   168	Obstruction & Statement & Forbidden classification form \\
   169	\midrule
   170	McDuff 1969 & Uncountably many non-isomorphic separable $\mathrm{II}_1$ factors & Total factor classification outside the amenable class \\
   171	Etingof-Gelaki & Non-isomorphic groups with equivalent plain tensor representation categories & Equivalence discarding the symmetric layer \\
   172	Adyan-Rabin & Every Markov property of finitely presentable groups is undecidable & Uniform recognition of group-flavored properties \\
   173	Wildness & Wild categories admit no finite-variety parametrization of isomorphism classes & Finite-variety parameterization of wild sectors \\
   174	Tancer 2023 & Nine-fold connected sum of $S^2 \times S^2$ is unrecognizable & Effective classification of four-manifolds \\
   175	Sasyk-Tørnquist & vN algebra isomorphism admits no classification by countable invariants & Countable-valued complete invariants \\
   176	Grochow-Qiao & Tame extensions tractable, wild bounds fail & Uniform polynomial-time classification across the boundary \\
   177	\bottomrule
   178	\end{tabular}
   179	\end{table}
   180	
   181	\section{Regime taxonomy}
   182	
   183	\subsection{Classification program data}
   184	
   185	The register forbids specific forms of classification. To compare those forms across domains, a classification program is decomposed into three pieces of data.
   186	
   187	\begin{definition}[Classification program]
   188	\label{def:program}
   189	Let $(D, \simeq)$ be a domain of objects with an equivalence relation. A classification program for $(D, \simeq)$ is a triple $(\iota, \Pi, R)$ where $\iota$ is a complete invariant, a map from objects to a set $I$ with $\iota(x) = \iota(y)$ if and only if $x \simeq y$; $\Pi$ is a parameter space, a structured object together with a structure-compatible surjection onto the $\simeq$-classes of $D$; and $R$ is a recognizer, a procedure that decides $x \simeq y$ from finite presentations of $x$ and $y$. The structure of $\Pi$ is part of the data: it is a finite-dimensional $k$-variety with an algebraic family, a standard Borel space with a Borel parametrization, or a finite combinatorial set. Without that structure $\Pi$ is just another name for the class set and carries no content beyond $\iota$.
   190	\end{definition}
   191	
   192	\begin{definition}[Finite-variety parametrization]
   193	\label{def:param}
   194	The isomorphism classes of a category $\mathcal{A}$ over a field $k$ are parametrized by a finite-dimensional variety when there are a finite-dimensional $k$-variety $V$ and an algebraic family of objects $\{A_v\}_{v \in V(k)}$ of $\mathcal{A}$ such that every object of $\mathcal{A}$ is isomorphic to some fiber $A_v$. A bare set-theoretic surjection $V(k) \twoheadrightarrow \mathrm{Ob}(\mathcal{A})/{\cong}$ is not a parametrization: when $k$ is uncountable the cardinality of $V(k)$ exceeds the class set of any tame category, so such maps exist trivially and carry no geometric information.
   195	\end{definition}
   196	
   197	\Cref{def:param} is the notion the wildness results refute. Buchweitz and Leuschke show that in rank two the isomorphism classes of the generic determinant's Cohen-Macaulay modules admit no parametrization by a finite-dimensional variety over the coefficients \cite{buchweitz2005}, in exactly the algebraic-family sense of \Cref{def:param}.
   198	
   199	The classification of finite simple groups delivers an exhaustive list, and practical identification runs through companion data of the Atlas kind: order, Schur multiplier, outer automorphism group, presentations, character tables with power maps \cite{atlaswiki}. What it does not deliver is a uniform parameterization. Gorenstein's verdict is the recorded one: no clean uniform description of the finite simple groups analogous to Dynkin diagrams is known \cite{solomon2001}. The classification is complete and its parameterization is missing, so completeness of the list and existence of a parameter space are different achievements. The Killing-Cartan classification of complex semisimple Lie algebras achieves both: Dynkin diagrams parameterize, the invariant is complete, and recognition is algorithmic \cite{humphreys,fultonharris}. Darboux's theorem shows a third configuration: locally, symplectic manifolds of the same dimension are all equivalent, so the local classification is complete and trivial and its content is entirely global \cite{darboux}.
   200	
   201	\begin{lemma}[Countable invariants]
   202	\label{lem:countable}
   203	If the isomorphism relation on a domain $D$ admits no classification by countable invariants in the descriptive-set-theoretic sense, that is, if it is not Borel reducible to the isomorphism relation of any class of countable structures, then no complete invariant of $D$ takes values in a space of countable structures. If in addition $D$ has more than countably many isomorphism classes, then no complete invariant of $D$ takes values in a countable set.
   204	\end{lemma}
   205	
   206	\begin{proof}
   207	A complete invariant whose values are countable structures, taken with a Borel assignment of the structure to the object, is a classification by countable invariants and would give a Borel reduction to the isomorphism of those structures. For the second claim, a complete invariant with countable range has countably many fibers, so the class set is countable.
   208	\end{proof}
   209	
   210	For the separable $\mathrm{II}_1$ factors the second claim of \Cref{lem:countable} is already settled by McDuff's uncountable family \cite{mcduff1969}. The first claim is stronger: for general separable von Neumann algebras even invariants valued in countable structures, K-theory data of that kind, fail to classify isomorphism \cite{sasyk2009}. A cardinality bound and a Borel-reducibility bound are different statements, and the arguments below invoke each where it applies.
   211	
   212	\begin{remark}[Two instances of the definition]
   213	Finite-dimensional complex $C^*$-algebras instantiate \Cref{def:program} with $\iota$ the dimension vector, $\Pi$ the finite set of multisets of block sizes, and $R$ the block decomposition algorithm. Finitely presented groups under isomorphism instantiate it with the obstruction register in place of the components: $\iota$ exists set-theoretically, no algebraic-family $\Pi$ is expected in the wild sectors, and $R$ does not exist at all in the presence of Markov reductions. The two instances show that the definition is neutral between regimes; the regimes are properties of the evidence, not of the definition.
   214	\end{remark}
   215	
   216	\subsection{The seven regimes}
   217	
   218	\begin{definition}[Regimes]
   219	\label{def:regime}
   220	A domain $(D, \simeq)$ with a classification program lies in one of seven regimes. \emph{Parameterized}: all three components exist and $\Pi$ is one of the structured kinds of \Cref{def:program}, a finite combinatorial set, a finite-dimensional variety with an algebraic family, or a standard Borel space with a Borel parametrization. \emph{Unparameterized}: $\iota$ and $R$ exist, no uniform $\Pi$ is known. \emph{Obstruction-complete}: the classification content is a proved impossibility theorem, so the classification is the obstruction. \emph{Open}: partial results exist and no impossibility theorem applies. \emph{Wild}: finite-variety parametrization is provably impossible and isomorphism classes grow without bound in every proposed parameter dimension. \emph{Undecidable}: $R$ is provably nonexistent in the stated generality. \emph{Decidable-but-unclassified}: $R$ exists and no complete $\iota$ is known.
   221	\end{definition}
   222	
   223	The regimes are not a partition of a single mathematical universe. They are a partition of the surveyed domains of the series by the shape of their classification evidence, and the assignment in \Cref{tab:regimes} is checked computationally in Section 8. The regime vocabulary is the deliverable the periodic table of the program needs: a table must mark where no table can exist, and the seven regimes are the marks available.
   224	
   225	Each regime has an archetype. The Killing-Cartan classification is the archetype of the parameterized regime; the classification of finite simple groups is the archetype of the unparameterized regime; anomaly classification is the archetype of obstruction-complete; fusion categories are the archetype of open; the Cohen-Macaulay modules of the generic determinant are the archetype of wild; Markov properties of finitely presented groups are the archetype of undecidable; and unknot recognition is the archetype of decidable-but-unclassified. The archetypes are proved mathematics in every case, so the taxonomy rests on theorems rather than on analogy.
   226	
   227	\subsection{Assignment of surveyed domains}
   228	
   229	\Cref{tab:regimes} assigns each domain from the literature survey of the series to a regime. The proofs behind the assignments are the register of Section 3 and the classification theorems cited in the survey.
   230	
   231	\begingroup
   232	\small
   233	\begin{longtable}{L{4.2cm}L{3.2cm}L{4.8cm}}
   234	\caption{Regime assignment for the surveyed domains. Each row is a domain of the series literature map, with the regime of \Cref{def:regime} and the deciding evidence.}
   235	\label{tab:regimes}\\
   236	\toprule
   237	Domain & Regime & Deciding evidence \\
   238	\midrule
   239	\endfirsthead
   240	\toprule
   241	Domain & Regime & Deciding evidence \\
   242	\midrule
   243	\endhead
   244	\midrule
   245	\multicolumn{3}{r}{Continued on next page}\\
   246	\endfoot
   247	\bottomrule
   248	\endlastfoot
   249	Simple Lie algebras & Parameterized & Dynkin and Satake diagrams \cite{humphreys,fultonharris} \\
   250	Highest-weight irreps & Parameterized & Dominant integral weights \cite{humphreys,fultonharris} \\
   251	Finite-dim $C^*$-algebras & Parameterized & Dimension vector \cite{cstarwiki} \\
   252	Principal $G$-bundles & Parameterized & Maps into the classifying space \cite{cstarwiki} \\
   253	Classical monotone metrics & Parameterized & Fisher metric unique up to constant \cite{petzsudar} \\
   254	Local symplectic germs & Parameterized & Darboux normal form \cite{darboux} \\
   255	Amenable factors & Parameterized & Type and Connes invariants \cite{vnwiki} \\
   256	Finite simple groups & Unparameterized & Complete list, no uniform parameterization \cite{solomon2001} \\
   257	Quantum monotone metrics & Unparameterized & Operator monotone functions, infinite family \cite{petzsudar} \\
   258	Anomalies & Obstruction-complete & Cohomological obstruction classes \cite{cstarwiki} \\
   259	General $\mathrm{II}_1$ factors & Obstruction-complete & McDuff's theorem \cite{mcduff1969} \\
   260	Plain tensor category recovery & Obstruction-complete & Etingof-Gelaki counterexamples \cite{eg2000} \\
   261	Fusion categories & Open & Weak Hopf algebra presentation known \cite{fusionnlab} \\
   262	Elliott nuclear program & Open & Program unfinished \cite{cstarwiki} \\
   263	Holographic entropy cone, $n \geq 5$ & Open & One inequality family known \cite{cstarwiki} \\
   264	Extended TQFTs & Open & Classification claim carries a proof gap \cite{lurie2009} \\
   265	Yang-Mills mass gap & Open & Clay lists the problem unsolved \cite{clay} \\
   266	Type III factors & Open & Coarse Connes strata only \cite{vnwiki} \\
   267	Wild CM modules of the generic determinant & Wild & No finite-variety parametrization \cite{buchweitz2005} \\
   268	$C_p$-equivariant modules at odd primes & Wild & Derived-wild Mackey algebra \cite{grevstad2025} \\
   269	Derived-wild algebras & Wild & Wildness holds under degeneration \cite{bekkert2003} \\
   270	Finitely presented groups, Markov properties & Undecidable & Adyan-Rabin \cite{rabin1958} \\
   271	Four-manifold homeomorphism & Undecidable & Unrecognizable connected sums \cite{tancer2023} \\
   272	vN algebra isomorphism & Obstruction-complete & No classification by countable structures \cite{sasyk2009} \\
   273	Unknot recognition & Decidable-but-unclassified & In NP and coNP, P open \cite{hass1999,lackenby2021} \\
   274	Three-manifolds & Parameterized & Eight Thurston geometries \cite{geometrization} \\
   275	Four-dimensional model geometries & Parameterized & Eighteen models plus one countable family listed explicitly \cite{geometrization,perelman,hillman} \\
   276	Quantum channels & Unparameterized & Minimal dilation normal form only \cite{cstarwiki} \\
   277	Group isomorphism, tame extensions & Parameterized & Polynomial time on the tame side \cite{grochow2015} \\
   278	\end{longtable}
   279	\endgroup
   280	
   281	\begin{remark}[Assignment is evidence-shaped]
   282	The assignment records where the classification evidence of each domain sits as of October 2026. A domain moves when new theorems arrive: the fusion-category entry moves if the open conjecture closes \cite{fusionnlab}. One tracked claim sits outside the table because it rests on announcements rather than published proofs: an October 2026 existence claim for four-dimensional Yang-Mills and QCD, whose status is exactly the standing one, existence claimed; manuscript and formalization withheld; verification pending \cite{openai,kitp}. Existence and the mass gap are separate questions and are never conflated; the Clay problem remains open \cite{clay,kitp}.
   283	\end{remark}
   284	
   285	\subsection{Lessons from the model program}
   286	
   287	The classification of finite simple groups is the reference point of the series, and three of its lessons structure the regime taxonomy.
   288	
   289	The first lesson is that classification and parameterization are different achievements. The classification is complete, and the recorded verdict is that no clean uniform description of the finite simple groups analogous to Dynkin diagrams is known \cite{solomon2001}. The unparameterized regime exists in the model program itself, which is why the regime taxonomy separates the two components of \Cref{def:program} rather than collapsing them into one verdict of classified.
   290	
   291	The second lesson is that practical identification runs through companion data. Practitioners identify finite groups by order, Schur multiplier, outer automorphism group, presentations, and character tables with power maps \cite{atlaswiki}. These are not the complete invariant of the classification theorem; they are an atlas of computable fingerprints that make the classification usable. A classification program for physical systems will need the same two layers, theorem and atlas, and the regime taxonomy applies to the theorem layer while the atlas layer remains to be built.
   292	
   293	The third lesson is that a completed classification can carry its own gaps and still be complete. The proof of the classification of finite simple groups was announced prematurely and completed only decades later \cite{solomon2001}. Completeness is a property of the final statement and proof, not of announcements, and the claim discipline of the series records this by keeping announced results out of the theorem register until they are proved.
   294	
   295	None of the three lessons is an obstruction. Together they explain why the unparameterized regime is not a failure and why the regime taxonomy records seven shapes of evidence rather than one ladder of success.
   296	
   297	\subsection{Regime stability}
   298	
   299	The regime assignment of \Cref{tab:regimes} is dated evidence, and three kinds of event move rows.
   300	
   301	A new theorem moves a row upward in the table. The fusion-category row moves from open to parameterized or unparameterized if the structural conjecture in that area closes; the Elliott program row moves when the program completes or when a counterexample to its uniqueness conjecture is proved; the four-dimensional existence row moves when the announced manuscript and its formalization are released and verified \cite{openai,kitp,cstarwiki,fusionnlab}.
   302	
   303	A new obstruction moves a row downward. A proof that a recognition problem is unrecognizable, or that a representation category is wild, moves its domain into undecidable or wild and, by \Cref{thm:transport}, moves every domain containing it isomorphism-reflectingly.
   304	
   305	A change of equivalence moves rows sideways. If a domain is redefined under a coarser equivalence, its invariant becomes complete or incomplete for reasons that have nothing to do with new theorems; \Cref{prop:equiv} is exactly such a case at the level of groups. The taxonomy is therefore a record of theorems and of a chosen equivalence, and both must be read with it.
   306	
   307	\section{Nonclassification results}
   308	
   309	Obstructions propagate along embeddings: a wild or undecidable sector carried by a fully faithful functor that is injective on isomorphism classes brings its failure with it into the larger domain, and undecidability transports along computable reductions. Three natural completions of the classification picture fail on explicit counterexamples.
   310	
   311	\subsection{Obstruction transport}
   312	
   313	\begin{definition}[Isomorphism-injective functor]
   314	\label{def:injfun}
   315	A functor $F: \mathcal{A} \to \mathcal{C}$ is isomorphism-injective when $F(A) \cong F(B)$ implies $A \cong B$ for all objects $A, B$ of $\mathcal{A}$. Every fully faithful functor is isomorphism-injective: the inverse of an isomorphism $F(A) \cong F(B)$ lifts to a morphism over $B$, and the lifted composites are identities by uniqueness of preimages.
   316	\end{definition}
   317	
   318	\begin{theorem}[Obstruction transport]
   319	\label{thm:transport}
   320	Let $F: \mathcal{A} \to \mathcal{C}$ be fully faithful.
   321	\begin{enumerate}
   322	\item If $\mathcal{A}$ has uncountably many isomorphism classes, so does $\mathcal{C}$, and if no complete invariant of $\mathcal{A}$ takes values in a countable set, none for $\mathcal{C}$ does either. If $\mathcal{A}$ and $\mathcal{C}$ are categories of structures on standard Borel spaces of objects and $F$ acts Borel-measurably on those spaces, then classification of the isomorphism relation of $\mathcal{C}$ by countable structures implies the same for $\mathcal{A}$; hence non-classifiability by countable structures transports from $\mathcal{A}$ to $\mathcal{C}$.
   323	\item If $\mathcal{A}$ carries a wild embedding, a family of objects with the matrix-pair universality property of the tame-wild dichotomy, then $\mathcal{C}$ carries the same wild embedding composed with $F$. Every non-parametrization or non-classification conclusion whose hypothesis is such an embedding, as in the wildness results of the register, is then available for the embedded family in $\mathcal{C}$ on the same footing as in $\mathcal{A}$.
   324	\end{enumerate}
   325	\end{theorem}
   326	
   327	\begin{proof}
   328	$F$ is isomorphism-injective by \Cref{def:injfun}, so it induces an injection $F_*: \mathrm{Ob}(\mathcal{A})/{\cong} \hookrightarrow \mathrm{Ob}(\mathcal{C})/{\cong}$ on isomorphism classes, and uncountability and the absence of countable-valued complete invariants transport by restriction of any hypothetical invariant to $\mathcal{A}$ along $F$. For the countable-structures claim, a Borel reduction of the isomorphism relation of $\mathcal{C}$ to the isomorphism of countable structures, composed with the Borel map $F$ induces on object spaces, is a Borel reduction for $\mathcal{A}$; contrapositively, none for $\mathcal{A}$ means none for $\mathcal{C}$. The Borel hypotheses are what make this composition legitimate; without them the claim is not asserted. For the wild embedding, the matrix-pair family in $\mathcal{A}$ maps to a family in $\mathcal{C}$ with identical $\operatorname{Hom}$-space dimensions, since $F$ is fully faithful, and identical isomorphism behavior, since $F$ is isomorphism-injective; the universality property is preserved verbatim.
   329	\end{proof}
   330	
   331	The wild-embedding clause transports the obstruction, not the conclusion about a category strictly larger than the embedded family. When a whole category is the wild family, as for the Cohen-Macaulay modules of the generic determinant \cite{buchweitz2005}, non-parametrization of the category follows in the sense of \Cref{def:param}. When the wild family sits inside a larger category, the proved non-parametrization statements apply to the essential image of the wild module category and to any subcategory of $\mathcal{C}$ equivalent to it; no claim is made about parametrizations of a category that strictly contains that image without an explicit moduli framework for the containment.
   332	
   333	\begin{corollary}[Wild embedding]
   334	\label{cor:wild}
   335	Let $\mathcal{C}$ be a category of representations admitting a fully faithful functor $F$ from the module category of a derived-wild finite-dimensional algebra. Then $\mathcal{C}$ carries a wild embedding, the essential image $F(\mathcal{A})$ admits no finite-variety parametrization of its isomorphism classes \cite{bekkert2003,buchweitz2005,grevstad2025}, and the same non-parametrization holds for any subcategory of $\mathcal{C}$ equivalent to that image.
   336	\end{corollary}
   337	
   338	\Cref{cor:wild} is the reason wildness is a structural fact about a domain and not a comment on the state of the art. The generic determinant's Cohen-Macaulay modules in rank two already defeat finite-variety parametrization \cite{buchweitz2005}, and the compact $C_p$-equivariant modules at odd primes carry no meaningful classification at all \cite{grevstad2025}. Any larger domain that embeds either category in the manner of the corollary carries the obstruction on its embedded part. The same pattern with \Cref{lem:countable} shows that a sector with no classification by countable structures forbids such classification for any domain receiving it along a Borel, fully faithful functor.
   339	
   340	\begin{corollary}[Operator-algebra consequence]
   341	\label{cor:opalg}
   342	Let $\mathcal{C}$ be the category of separable von Neumann algebras with normal *-homomorphisms as morphisms, taken with isomorphism as its equivalence. The separable $\mathrm{II}_1$ factors have uncountably many isomorphism classes \cite{mcduff1969}, so no complete invariant of $\mathcal{C}$ takes values in a countable set, and no atlas of countably many computable fingerprints can be complete for $\mathcal{C}$. The stronger statement holds: the isomorphism relation of $\mathcal{C}$ admits no classification by countable structures at all \cite{sasyk2009}.
   343	\end{corollary}
   344	
   345	\begin{proof}
   346	An atlas of countably many computable fingerprints assigns to each algebra a tuple of values from countable sets, and the combined map is a complete invariant with countable range if the atlas is complete; \Cref{lem:countable} and McDuff's uncountable family rule this out \cite{mcduff1969}. The stronger statement is the Borel-reducibility result of Sasyk and Tørnquist \cite{sasyk2009}.
   347	\end{proof}
   348	
   349	\Cref{cor:opalg} fixes the reach of the Atlas discipline of the model program, identification by finite tables of computable data \cite{atlaswiki}. That method is complete exactly where a countable-valued complete invariant exists and provably incomplete where uncountably many classes or the Borel-reducibility obstruction stand. The regime table records which domains admit an atlas at all.
   350	
   351	\subsection{Recognition reductions}
   352	
   353	\begin{proposition}[Undecidability transport]
   354	\label{prop:undec}
   355	Let $Q$ be a recognition problem for a class $\mathcal{C}$, and suppose there is a computable map $\varphi$ from finite group presentations to objects of $\mathcal{C}$ and a Markov property $P$ of finitely presentable groups such that a presentation $G$ has $P$ if and only if $\varphi(G)$ satisfies $Q$. Then $Q$ is algorithmically undecidable.
   356	\end{proposition}
   357	
   358	\begin{proof}
   359	A decision procedure for $Q$, composed with the computable map $\varphi$, decides $P$ on finite presentations. By the Adyan-Rabin theorem no such procedure exists for any Markov property \cite{adyan1955,rabin1958}. Hence none exists for $Q$.
   360	\end{proof}
   361	
   362	\Cref{prop:undec} is the shape of every undecidability entry in the register. Tancer's construction is an instance: the unrecognizability of the nine-fold connected sum of $S^2 \times S^2$ is proved through the Markov set construction carried into four-manifold topology \cite{tancer2023}. The proposition also explains why undecidability is a statement about the recognizer component of \Cref{def:program} and says nothing by itself about invariants or parameter spaces: an undecidable domain may still carry rich complete invariants that no algorithm can compute.
   363	
   364	\subsection{Counterexample catalogue}
   365	\label{sec:counterexamples}
   366	
   367	Each of the three natural strengthenings of the classification picture below fails on an explicit counterexample.
   368	
   369	\begin{proposition}[No finite sporadic list]
   370	\label{prop:sporadic}
   371	The hypothesis that the isomorphism classes of a completed classification decompose into infinite families plus finitely many exceptional objects is false for the operator-algebra sector and for four-dimensional geometry. The separable $\mathrm{II}_1$ factors number uncountably many isomorphism classes \cite{mcduff1969}, and the four-dimensional maximal model geometries number eighteen plus one countably infinite family \cite{geometrization}.
   372	\end{proposition}
   373	
   374	\begin{proof}
   375	Both lower bounds refute finiteness of the exceptional set: uncountably many classes cannot be listed as finitely many sporadics, and a countably infinite family of model geometries is not finite. Any classification whose final form is families plus finitely many sporadics is therefore false in these sectors before its completeness is even considered.
   376	\end{proof}
   377	
   378	\begin{proposition}[The two-regime picture fails]
   379	\label{prop:tworegime}
   380	The taxonomy that sorts domains into classified and impossible misassigns at least two surveyed domains. Unknot recognition is decidable and sits in NP and coNP, while its complexity class is open and no complete invariant is known \cite{hass1999,lackenby2021}. The finite simple groups are completely classified and carry no uniform parameterization \cite{solomon2001}. The first domain is decidable but unclassified; the second is classified but unparameterized. Neither fits a two-regime picture.
   381	\end{proposition}
   382	
   383	\begin{proof}
   384	Decidable-but-unclassified and classified-but-unparameterized are distinct shapes of evidence, exhibited by the two named domains. Any taxonomy with two regimes assigns both domains to the same regime, and in that regime one of the two descriptions of the evidence is wrong. Hence the two-regime picture is refuted, and the seven regimes of \Cref{def:regime} are needed to keep the descriptions straight.
   385	\end{proof}
   386	
   387	\begin{proposition}[Equivalence at the plain tensor layer fails]
   388	\label{prop:equiv}
   389	Let $\simeq_{\mathrm{pt}}$ be the relation on finite groups obtained by declaring $G \simeq_{\mathrm{pt}} H$ when their representation categories are equivalent as plain tensor categories. Then $\simeq_{\mathrm{pt}}$ is strictly coarser than isomorphism, so any classification of systems whose symmetry data is a finite group, conducted at the plain tensor layer, identifies distinct systems.
   390	\end{proposition}
   391	
   392	\begin{proof}
   393	Etingof and Gelaki exhibit non-isomorphic finite groups with equivalent plain tensor representation categories \cite{eg2000}. For such a pair $G \not\cong H$ while $G \simeq_{\mathrm{pt}} H$, so the quotient by $\simeq_{\mathrm{pt}}$ is strictly coarser than the quotient by isomorphism. A classification built on $\simeq_{\mathrm{pt}}$ therefore merges distinct isomorphism classes, and its fibers are not the classes one set out to classify.
   394	\end{proof}
   395	
   396	\Cref{prop:equiv} is the counterexample the register promised for the third proof obligation of the universal conjecture. Choosing an equivalence relation is not a formality: the plain tensor choice is a natural one, it is stated in one line, and it is provably wrong. Every equivalence admitted in the program must name the layers of structure it preserves, and the symmetric layer is the one that recovers the group.
   397	
   398	\subsection{Common consequences}
   399	
   400	The four statements have a common consequence. Non-classifiability in the register is not a set of isolated pathologies; it travels along fully faithful embeddings (\Cref{thm:transport}), along computable maps (\Cref{prop:undec}), and it defeats three natural completion schemes (Propositions \ref{prop:sporadic} to \ref{prop:equiv}). A universal classification theorem for all admissible physical systems cannot be of CFSG form unless every wild, undecidable, and unrecognizable sector is excluded from its quantifiers. The exclusions are restrictions on the domain, and each restriction is a new admissibility condition of the kind that \Cref{rem:unfixed} records as unfixed.
   401	
   402	\subsection{Scope of the transport theorem}
   403	
   404	\Cref{thm:transport} quantifies over functors injective on isomorphism classes, and its hypotheses are mathematical. Three remarks delimit its use.
   405	
   406	The theorem transports refutations, not theorems. It moves wild embeddings and invariant obstructions from a subcategory to a larger category, and it moves undecidability along computable reductions. It does not transport positive classification results: a classification of a subcategory says nothing about the ambient category, which is why the completed islands of Section 6 each restate their own hypotheses.
   407	
   408	Full faithfulness is what carries the wild embedding, because it preserves the Hom-dimensions the universality property is built from; injectivity on isomorphism classes is what carries isomorphism behavior. Physical embeddings that deliberately identify systems fail the second hypothesis, and a coarse-graining map that forgets microscopic detail typically fails it as well, so the theorem is silent about classification programs run on coarse descriptions.
   409	
   410	The theorem applies at the level of domains, not of families. A family such as the operator-algebra family contains parameterized islands and obstruction-complete sectors side by side, and the transport theorem says which ambient domains inherit which failure. Regime assignment remains a domain-level judgment, and the two levels must not be confused.
   411	
   412	\section{Restricted classification results}
   413	
   414	Completed classifications exist on restricted domains under explicit hypotheses, and each is an instance of \Cref{def:program}. The restriction in each of them is load-bearing rather than removable by a better argument, as \Cref{cor:restrict} records.
   415	
   416	\subsection{Completed islands}
   417	\label{sec:completed}
   418	
   419	The finite-dimensional complex $C^*$-algebras are classified completely. Every such algebra is a direct sum $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ of matrix algebras, and the multiset of matrix sizes, the dimension vector, determines $A$ up to *-isomorphism \cite{cstarwiki}. The classification program of \Cref{def:program} is fully realized here: the dimension vector is a complete invariant, the parameter space is the set of finite multisets of positive integers, and recognition is the finite computation of block decomposition. This is the model theorem of the series and the shape every restricted classification aims at.
   420	
   421	The amenable factors are classified as well: types $\mathrm{I}_n$, $\mathrm{I}_\infty$, $\mathrm{II}_1$, $\mathrm{II}_\infty$, $\mathrm{III}_\lambda$ for $0 < \lambda \leq 1$, and $\mathrm{III}_0$, with the invariant given by Murray-von Neumann type and Connes data \cite{connes1976,vnwiki}. The restriction is the word amenable. McDuff's theorem removes it and the classification dies \cite{mcduff1969}.
   422	
   423	Principal $G$-bundles over a base $X$ are classified by homotopy classes of maps into the classifying space, and the characteristic classes are exactly the pullbacks of universal classes \cite{cstarwiki}. The restriction is topological: the classification is up to bundle isomorphism and it records no connection data. Anomalies are classified on the obstruction pattern: the gauge anomaly is a pair of cohomology classes whose vanishing is the condition for quantization, so the classification content is the obstruction itself \cite{cstarwiki}.
   424	
   425	Doplicher-Roberts reconstruction classifies symmetric tensor *-categories with conjugates, direct sums, subobjects, and $\operatorname{End}(1) = \mathbb{C}$: such a category is the representation category of a compact supergroup, unique up to isomorphism \cite{eg2000}. The hypotheses are the restriction, and the Etingof-Gelaki counterexamples show that dropping the symmetric layer destroys the conclusion \cite{eg2000}. Deligne's theorem classifies symmetric tensor categories of subexponential growth in characteristic zero along the same lines \cite{eg2000}.
   426	
   427	Quantum channels occupy a middle position. Stinespring dilation classifies completely positive maps up to minimal dilation, unique up to unitary freedom, and the Choi-Kraus form is a normal form whose Kraus rank is an invariant of the form \cite{stinespring,cstarwiki}. The classification is of dilations, not of channels up to isomorphism, and the Kraus rank of a normal form is not an isomorphism invariant of the channel. This is a classification of a presentation, and the regime table places the domain in the unparameterized regime accordingly.
   428	
   429	The local symplectic classification is complete and trivial: Darboux's theorem gives local normal form with no local invariants, so the classification content of the symplectic side is entirely global and topological \cite{darboux}. In the opposite direction, the Killing-Cartan classification of semisimple Lie algebras and the highest-weight classification of their irreducible representations deliver complete invariants with parameterizations \cite{humphreys,fultonharris}. The geometrization theorem decomposes closed 3-manifolds into exactly eight Thurston geometries \cite{geometrization}, and Chentsov's theorem gives the Fisher metric as the unique metric monotone under stochastic maps, while the quantum analogue is a parametric family indexed by operator monotone functions \cite{petzsudar}. In every row the invariant is finite or parametric, and in every row the domain is stated with its restrictions.
   430	
   431	\subsection{Hypotheses and their cost}
   432	
   433	\begin{corollary}[Quantifier restriction]
   434	\label{cor:restrict}
   435	Under the hypotheses of \Cref{thm:transport}, a completeness statement for $\mathcal{C}$ in the sense of \Cref{def:program} is false. Under the hypotheses of \Cref{prop:undec}, a recognition statement for $\mathcal{C}$ in that sense is false. Any correct completeness or recognition statement about $\mathcal{C}$ restricts its quantifiers to a subdomain that excludes the part carrying the obstruction.
   436	\end{corollary}
   437	
   438	\begin{proof}
   439	\Cref{thm:transport} and \Cref{prop:undec} deny the existence of the parameter space or of the recognizer over all of $\mathcal{C}$. A statement quantified over a subdomain that excludes the obstruction carries no contradiction, and the surveyed theorems of Section 6.1 are all of this form.
   440	\end{proof}
   441	
   442	\Cref{cor:restrict} explains the shape of the completed islands. The restriction in each theorem is not a hedge and it is not removable by a better argument; it is the boundary the obstruction register draws. Two further points about the cost of hypotheses deserve recording. First, hypotheses can be subtle: braided extensions of the Doplicher-Roberts setting can require extra data beyond the braiding for the reconstruction to close, so the hypothesis list of a reconstruction theorem is part of its content and must travel with it. Second, a restriction can hide a boundary rather than a theorem: the tame side of the Grochow-Qiao divide admits polynomial-time isomorphism testing for the groups named, and the wild side fails the bounds their method needs \cite{grochow2015}. A classification program built on the tame side inherits the boundary as a working assumption.
   443	
   444	\subsection{Regime boundaries}
   445	
   446	Where the tame-wild boundary sits for physical representation categories, as opposed to generic algebras, is unstudied. The generic mathematics supplies the dichotomy and the algorithmic shadow \cite{bekkert2003,grochow2015}; no result on record locates the boundary for the tensor categories or representation categories that physical theories actually use. The question matters for the program, because a completeness theorem for a physical class is exactly a theorem that the class sits on the tame side.
   447	
   448	Regime boundaries move in one further way. When an announcement matures into a published proof, its domain enters the table at the regime the proof supports; until then the claim is tracked outside the taxonomy, as in \Cref{tab:regimes}'s companion remark. The taxonomy records theorems, and announcements are not theorems.
   449	
   450	The regime taxonomy records that boundaries are not always sharp walls. Unknot recognition is decidable and sits in NP and coNP, while its complexity class is open and no complete invariant is known \cite{hass1999,lackenby2021}. Between the classified and the impossible there are domains whose status is settled in one component of \Cref{def:program} and unsettled in another. Any periodic table of the program must carry such entries honestly rather than forcing them into a binary verdict.
   451	
   452	\section{The five obligations}
   453	
   454	The universal classification conjecture states that every admissible physical system is generated by a fixed collection of structural families under a fixed set of admissible constructions, up to a justified equivalence. Its proof obligations number five, and \Cref{tab:obligations} gives their status against the evidence of this paper. The conjecture is a registered hypothesis and an object of analysis here; nothing in this section assumes it true or false.
   455	
   456	\begin{table}[ht]
   457	\centering
   458	\caption{The five proof obligations of the universal classification conjecture and their status.}
   459	\label{tab:obligations}
   460	\small
   461	\begin{tabular}{L{3.6cm}L{5.4cm}L{3.2cm}}
   462	\toprule
   463	Obligation & Content & Status \\
   464	\midrule
   465	Completeness & Every admissible system lies in the generated class & Open, conditional on the unfixed admissibility list \\
   466	Soundness & Every generated structure is admissible & Open, same conditionality \\
   467	Equivalence & Distinct presentations of one system are identified correctly & Open; \Cref{prop:equiv} constrains every choice \\
   468	Structural characterization & The families have precise mathematical definitions & Partial: families named, admissibility unfixed \\
   469	Decomposition & Targeted classes assemble from the families & Open in general; proved in restricted domains \\
   470	\bottomrule
   471	\end{tabular}
   472	\end{table}
   473	
   474	The completeness obligation quantifies over $\mathrm{Phys}_{\mathrm{adm}}$ and is therefore conditional on the admissibility list that \Cref{rem:unfixed} records as unfixed. Beyond the conditionality, \Cref{thm:transport} blocks the obligation in any formulation whose generated class contains a wild or undecidable sector isomorphism-reflectingly: the parameter space the classification needs cannot exist there. The obligation is open today and its unrestricted form collides with the register.
   475	
   476	The soundness obligation runs in the other direction, from the generated class to the admissibility conditions. It is vacuous until the conditions are stated, and it becomes checkable only after the list is fixed. No obstruction in the register touches it directly; its difficulty is definitional.
   477	
   478	The equivalence obligation is the one with a proved negative result attached. \Cref{prop:equiv} shows that the natural plain tensor choice of equivalence is strictly coarser than isomorphism and merges distinct systems. Any solution must therefore name the layers of structure it preserves and must recover the group from the preserved layers where a group is present. The solution space is restricted by a counterexample, which is a stronger constraint than mere openness.
   479	
   480	The structural characterization obligation is partial on the evidence of record. The ten candidate families of the program are named with their defining structures and their established islands, and the admissibility conditions that would make the families exhaustive are unfixed. Naming a family is not characterizing it to the precision a completeness proof needs, and the gap between the two is where this obligation lives.
   481	
   482	The decomposition obligation asks that systems of the targeted classes assemble from the families under the admissible constructions. Restricted theorems exist: the finite-dimensional $C^*$-algebra decomposition assembles every algebra of that class from matrix blocks \cite{cstarwiki}, amenable factors decompose by type \cite{vnwiki}, and Doplicher-Roberts reconstruction assembles superselection data from symmetric tensor structure \cite{eg2000}. In general the obligation is open, and uniqueness of decomposition is open even before assembly is considered: interacting systems need not admit unique decompositions at all.
   483	
   484	What survives the register is the restricted form the survey of the series anticipated: classification theorems on tame, restricted classes, plus explicit obstruction theorems where no classification can exist. The regime taxonomy of Section 4 states exactly which domains admit which of the two outcomes today, and Section 6 records the shape of every completed theorem on the positive side.
   485	
   486	The consequences for a periodic table of mathematical physics are direct. A table with only status columns for proved and open is incomplete: it has no cell for the proved impossibilities, and the regime taxonomy supplies one regime per kind of impossibility. A table with a single row per family is too coarse at the boundaries, because a family such as the operator-algebra family contains parameterized islands, an unparameterized island, and an obstruction-complete sector at once. The right grain is the domain, not the family, and the right vocabulary is the seven regimes.
   487	
   488	\subsection{Requirements for a completeness theorem}
   489	
   490	The register and the transport results fix what any future completeness theorem must contain. Four conditions are necessary, and each is drawn from a proved obstruction rather than from preference.
   491	
   492	The quantifier must be restricted. By \Cref{cor:restrict}, a domain carrying a wild or undecidable sector in the manner of \Cref{thm:transport} supports no completeness statement unless the quantifier excludes the part carrying the obstruction. A theorem over a class that embeds the generic determinant's modules, or a Markov construction, is false before its proof begins.
   493	
   494	The equivalence must name its layers. By \Cref{prop:equiv}, any equivalence forgetting the symmetric layer merges distinct systems, so the identification relation of the theorem must state the preserved structure and must recover groups where groups are present.
   495	
   496	The parameter space must be structured. By \Cref{def:param} and \Cref{lem:countable}, a bare set-theoretic indexing carries no content, and countable-valued complete invariants cannot exist where uncountably many classes or Borel non-reducibility stand. The parameterizer must be an algebraic family, a standard Borel parametrization, or a finite combinatorial set of the kind \Cref{def:program} names.
   497	
   498	The premise must be fixed. By \Cref{rem:unfixed}, a theorem over an admissible class whose conditions are unfixed is conditional on the list one adopts. A completeness theorem that quantifies over $\mathrm{Phys}_{\mathrm{adm}}$ waits on \Cref{def:adm} being settled; a theorem over a standard mathematical domain, as in the completed islands of \Cref{sec:completed}, does not.
   499	
   500	Together the four conditions describe the shape of the positive results the program may still earn: restricted-class theorems with stated hypotheses on tame domains, side by side with obstruction theorems registered at their full generality. That is the shape the evidence already has, and the regime table is where each domain's share of it is recorded.
   501	
   502	\section{Computational evidence}
   503	\label{sec:computational}
   504	
   505	The three experiments of this section are evidence about finite instances and growth patterns, not proofs. The claims they support are marked as computational in the code evidence appendix.
   506	
   507	The first experiment enumerates the regime assignment of \Cref{tab:regimes} as data and checks two properties mechanically: every surveyed domain receives exactly one regime label, and every label used is one of the seven of \Cref{def:regime}. The experiment treats the table as input, so it verifies the internal consistency of the assignment and not the mathematical truth of any row.
   508	
   509	The second experiment enumerates unital finite-dimensional complex $C^*$-algebras of a given complex dimension $N$, where $N = \dim_{\mathbb{C}}(A)$ is the vector space dimension over $\mathbb{C}$, by their dimension vectors, the multisets of matrix block sizes with $\sum_i n_i^2 = N$. For each $N$ up to a bound it prints the finite list of vectors, exhibiting on the tame side what a parametrization looks like: finitely many classes per dimension, listed by a finite invariant. For example, dimension $N = 5$ admits exactly two algebras, with block-size multisets $\{\!\{1,1,1,1,1\}\!\}$ and $\{\!\{1,2\}\!\}$, and dimension $N = 8$ admits exactly three, with multisets $\{\!\{1^{(8)}\}\!\}$, $\{\!\{2,1,1,1,1\}\!\}$, and $\{\!\{2,2\}\!\}$. The enumeration is exhaustive within its bound and is a direct check of the finiteness claim for each dimension.
   510	
   511	The third experiment computes the dimension of the quotient of representation varieties for the $m$-Kronecker quiver with dimension vector $(a, b)$, whose generic quotient dimension is $m a b - a^2 - b^2 + 1$. For $m = 2$ this quantity stays constant along $a = b = n$, and for $m = 3$ it grows like $n^2$. The contrast exhibits at the level of dimensions why the wild case resists finite-variety parametrization: the families of isomorphism classes demand unboundedly many parameters. The calculation is a growth pattern, and the non-parametrization theorem it illustrates is the proved result of Buchweitz and Leuschke \cite{buchweitz2005}. The experiment does not prove non-parametrization; it shows the dimension bookkeeping that the theorem rules out.
   512	
   513	A companion Haskell module encodes the taxonomy layer: representative systems of each regime, carrying instances of the shared family classes of the series taxonomy, with a regime tag mirroring \Cref{def:regime}. The module is executable specification, and it is computational evidence of the same standing as the experiments. Its witness systems cover the McDuff sector, the wild module sector, the finite-dimensional $C^*$-algebra sector, and the four-manifold sector, so each regime of \Cref{def:regime} that has a concrete witness in this paper is represented. No artifact in this section is a machine-checked formalization, and none is presented as one.
   514	
   515	The experiments also mark what computation cannot do here. No finite run decides whether an algebraic family exists covering an isomorphism-class set, and no enumeration of small instances distinguishes a tame domain from a wild one at the boundary. The register theorems decide those questions, and the experiments only display their shadow on finite data.
   516	
   517	The experiments are deterministic and self-contained. Each script computes its output from definitions written in the script itself and from no external data, so a reader can rerun them and compare printed values against the claims of this section. The expected outputs are small enough to check by hand: the partition property of the regime table, the lists of dimension vectors at small $N$, and the quotient-dimension values along the diagonal $a = b = n$ for $m = 2$ and $m = 3$. Agreement is evidence for the claims as stated and nothing more.
   518	
   519	\section{Limitations}
   520	
   521	The regime taxonomy covers the domains of the series literature survey, and that survey ran on arXiv plus known-URL discovery; non-arXiv venues may be under-covered, so the taxonomy may meet domains that require an eighth regime. The seven regimes are complete for the surveyed list and are not claimed complete for mathematical physics.
   522	
   523	The Sasyk-Tørnquist result is published in the Bulletin of Symbolic Logic, with the complete proof in Inventiones Mathematicae \cite{sasyk2009}; the series survey recorded it at announcement strength, and the published record is cited here.
   524	
   525	The transport theorem quantifies over fully faithful functors. Physical re-presentation of a domain need not be fully faithful, and when it is not, \Cref{thm:transport} is silent. This is the point at which the choice of equivalence becomes a mathematical hypothesis rather than a formality.
   526	
   527	The universal classification conjecture is neither proved nor refuted here. The analysis shows that its unrestricted form collides with the register and that its restricted forms are where the provable content sits; whether a nontrivial restricted form yields a completeness theorem is open.
   528	
   529	A fifth limitation concerns the counterexamples of Section 5. Each refutes a specific natural completion of the classification picture, and none refutes every completion. The finite sporadic list fails in two sectors, the two-regime picture fails on two domains, and the plain tensor equivalence fails on explicit group pairs; a completion that avoids all three by construction is untouched by these results, and the register bounds it from the other side.
   530	
   531	\section{Conclusion}
   532	
   533	Completeness of a classification is a theorem about a domain and an equivalence relation, and the theorem holds where the invariant is finite or parametric and fails where proved obstructions stand. The register of Section 3 collects seven such obstructions, each forbidding a specific classification form, and the transport theorem shows the obstructions travel along fully faithful embeddings: a domain carrying a wild or undecidable sector in the manner of \Cref{thm:transport} inherits the obstruction. The regime taxonomy of Section 4 assigns the surveyed domains of the series to seven regimes, and the counterexamples of Section 5 refute three natural completions of the universal picture: a finite sporadic list, a two-regime account, and equivalence at the plain tensor layer.
   534	
   535	The strongest defensible conclusion is negative and useful. A universal classification of all mathematical representations of physical systems, in the form of the classification of finite simple groups, is not attainable across the surveyed domains: uncountably many isomorphism classes, unrecognizable instances, and wild sectors forbid it as a matter of theorem. What is attainable, and what the regime table documents, is a program of restricted classification theorems on tame classes together with explicit obstruction theorems everywhere else. That shape of outcome was named as acceptable in the founding documents of the program, and the analysis here shows it is the shape the evidence has.
   536	
   537	The obligations of the universal conjecture remain four open and one partial, and the admissibility conditions that would give the conjecture a fixed premise remain unfixed. Those two facts set the agenda that the closing volume of the series inherits: fix admissibility, fix equivalence at a layer that survives \Cref{prop:equiv}, and then read the regime table as the boundary between what a completeness theorem could cover and what an impossibility theorem already forbids.
   538	
   539	\appendix
   540	\section{Code evidence}
   541	
   542	\Cref{tab:code} maps each computational claim of \Cref{sec:computational} to the file and function that demonstrates it. The artifacts live in \texttt{src/vol-11-completeness-obstructions/}. Each row is checked against the named code before publication.
   543	
   544	\begin{table}[ht]
   545	\centering
   546	\caption{Code evidence for the computational claims. Support means the named code demonstrates the claim as stated.}
   547	\label{tab:code}
   548	\footnotesize
   549	\begin{tabular}{L{4.2cm}L{5.2cm}L{3.4cm}}
   550	\toprule
   551	Claim & File and function & Support \\
   552	\midrule
   553	The regime assignment is single-valued into the seven regimes & \texttt{regime\_inventory.py}, function \texttt{check\_partition} & Enumeration and assertion over the table data \\
   554	Finite-dimensional $C^*$-algebras are finitely many per dimension, listed by dimension vectors & \texttt{dimvec\_enumeration.py}, function \texttt{enumerate\_dimension\_vectors} & Exhaustive enumeration for each dimension bound \\
   555	Quotient-dimension growth contrasts the two-Kronecker and three-Kronecker quivers & \texttt{wild\_quiver\_growth.py}, function \texttt{quotient\_dim} & Closed-form evaluation over a grid of dimension vectors \\
   556	Obstruction witness systems carry taxonomy family instances and regime tags & \texttt{Instances.hs}, type \texttt{WitnessSystem} and function \texttt{regimeOf} & Instance declarations and total tag function \\
   557	\bottomrule
   558	\end{tabular}
   559	\end{table}
   560	
   561	\begin{thebibliography}{99}
   562	\small
   563	
   564	\bibitem{adyan1955}
   565	S. I. Adyan. Algorithmic unsolvability of problems of recognition of certain properties of groups (in Russian). \emph{Doklady Akademii Nauk SSSR} 103 (1955), 533-535.
   566	
   567	\bibitem{rabin1958}
   568	M. O. Rabin. Recursive unsolvability of group theoretic problems. \emph{Annals of Mathematics} (2) 67 (1958), 172-194. \url{https://www.jstor.org/stable/1969933}
   569	
   570	\bibitem{collins1969}
   571	D. J. Collins. On recognizing Hopf groups. \emph{Archiv der Mathematik} 20 (1969), 235-240. \url{https://link.springer.com/article/10.1007/BF01899291}
   572	
   573	\bibitem{mcduff1969}
   574	D. McDuff. Uncountably many $\mathrm{II}_1$ factors. \emph{Annals of Mathematics} (2) 90 (1969), 361-371. \url{https://annals.math.princeton.edu/1969/90-2/p07}
   575	
   576	\bibitem{connes1976}
   577	A. Connes. Classification of injective factors. Cases $\mathrm{II}_1$, $\mathrm{II}_\infty$, $\mathrm{III}_\lambda$, $\lambda \neq 1$. \emph{Annals of Mathematics} (2) 104 (1976), 73-115. \url{https://annals.math.princeton.edu/1976/104-1/p04}
   578	
   579	\bibitem{hass1999}
   580	J. Hass, J. C. Lagarias, and N. Pippenger. The computational complexity of knot and link problems. \emph{Journal of the ACM} 46 (1999), 185-211. \url{https://doi.org/10.1145/301970.301971}
   581	
   582	\bibitem{lackenby2021}
   583	M. Lackenby. The efficient certification of knottedness and Thurston norm. \emph{Advances in Mathematics} 387 (2021), article 107796. \url{https://doi.org/10.1016/j.aim.2021.107796}
   584	
   585	\bibitem{hillman}
   586	J. A. Hillman. Four-manifolds, geometries and knots. arXiv:math/0212142. \url{https://arxiv.org/abs/math/0212142}
   587	
   588	\bibitem{eg2000}
   589	P. Etingof and S. Gelaki. Isocategorical groups. \emph{International Mathematics Research Notices} 2001, no. 2, 59-77. The tensor-category input behind the Doplicher-Roberts hypotheses used here.
   590	
   591	\bibitem{bekkert2003}
   592	V. I. Bekkert and Y. A. Drozd. Tame-wild dichotomy for derived categories. arXiv:math/0310352. \url{https://arxiv.org/abs/math/0310352}
   593	
   594	\bibitem{buchweitz2005}
   595	R.-O. Buchweitz and G. J. Leuschke. Factoring the adjoint and maximal Cohen-Macaulay modules over the generic determinant. arXiv:math/0505315. \url{https://arxiv.org/abs/math/0505315}
   596	
   597	\bibitem{grevstad2025}
   598	J. F. Grevstad and C. May. Equivariant $H\underline{\mathbb{F}}_p$-modules are wild. arXiv:2509.17604. \url{https://arxiv.org/abs/2509.17604}
   599	
   600	\bibitem{grochow2015}
   601	J. A. Grochow and Y. Qiao. Polynomial-time isomorphism test of groups that are tame extensions. arXiv:1507.01917. \url{https://arxiv.org/abs/1507.01917}
   602	
   603	\bibitem{tancer2023}
   604	M. Tancer. Simpler algorithmically unrecognizable 4-manifolds. arXiv:2310.07421. \url{https://arxiv.org/abs/2310.07421}
   605	
   606	\bibitem{sasyk2009}
   607	R. Sasyk and A. Tørnquist. Borel reducibility and classification of von Neumann algebras. arXiv:0909.2657; \emph{Bulletin of Symbolic Logic} 15 (2009), 169-183. Complete proof: \emph{Inventiones Mathematicae} (2011). \url{https://arxiv.org/abs/0909.2657}
   608	
   609	\bibitem{geometrization}
   610	W. P. Thurston. Three-dimensional geometry and topology. Vol. 1. Princeton University Press, 1997.
   611	
   612	\bibitem{perelman}
   613	G. Perelman. Ricci flow with surgery on three-manifolds. arXiv:math/0303109. \url{https://arxiv.org/abs/math/0303109}
   614	
   615	\bibitem{humphreys}
   616	J. E. Humphreys. Introduction to Lie algebras and representation theory. Graduate Texts in Mathematics 9. Springer, 1972.
   617	
   618	\bibitem{fultonharris}
   619	W. Fulton and J. Harris. Representation theory: a first course. Graduate Texts in Mathematics 129. Springer, 1991.
   620	
   621	\bibitem{stinespring}
   622	W. F. Stinespring. Positive functions on $C^*$-algebras. \emph{Proceedings of the American Mathematical Society} 6 (1955), 211-216.
   623	
   624	
   625	
   626	\bibitem{solomon2001}
   627	R. Solomon. A brief history of the classification of the finite simple groups. \emph{Bulletin of the American Mathematical Society} 38 (2001), 315-352.
   628	
   629	\bibitem{atlaswiki}
   630	J. H. Conway, R. T. Curtis, S. P. Norton, R. A. Parker, and R. A. Wilson. An ATLAS of finite groups. Oxford University Press, 1985.
   631	
   632	
   633	
   634	\bibitem{darboux}
   635	A. Cannas da Silva. Lectures on symplectic geometry. Lecture Notes in Mathematics. Springer, 2001.
   636	
   637	\bibitem{vnwiki}
   638	J. Dixmier. Von Neumann algebras. North-Holland, 1981.
   639	
   640	\bibitem{cstarwiki}
   641	G. J. Murphy. $C^*$-algebras and operator theory. Academic Press, 1990.
   642	
   643	\bibitem{fusionnlab}
   644	P. Etingof, D. Nikshych, and V. Ostrik. On fusion categories. \emph{Annals of Mathematics} 162 (2005), 581-642.
   645	
   646	\bibitem{petzsudar}
   647	D. Petz and Cs. Sudar. Extending the Fisher metric to density matrices. arXiv:quant-ph/0102132. \url{https://arxiv.org/abs/quant-ph/0102132}
   648	
   649	\bibitem{lurie2009}
   650	J. Lurie. On the classification of topological field theories. arXiv:0905.0465. \url{https://arxiv.org/abs/0905.0465}
   651	
   652	\bibitem{clay}
   653	Clay Mathematics Institute. Yang-Mills and the mass gap. \url{https://www.claymath.org/millennium/yang-mills-the-maths-gap/}
   654	
   655	\bibitem{openai}
   656	OpenAI. Working with academic communities to build scientific understanding. October 26, 2026. \url{https://openai.com/index/building-scientific-understanding-with-academic-communities/}
   657	
   658	\bibitem{kitp}
   659	KITP Yang-Mills working group statement. October 2026. \url{https://www.kitp.ucsb.edu/sites/default/files/YM_working_group.pdf}
   660	
   661	\end{thebibliography}
   662	
   663	\end{document}

exec
/usr/local/bin/zsh -lc "sed -n '133,340p' papers/latex/vol-11-completeness-obstructions.tex | nl -ba -v133" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   133	\subsection{Wildness}
   134	
   135	The tame-wild dichotomy of Drozd is the boundary of parametrizable representation theory. Bekkert and Drozd proved that every finite-dimensional algebra over an algebraically closed field is derived-tame or derived-wild, and that any degeneration of a derived-wild algebra is again derived-wild \cite{bekkert2003}. Wildness is a property of the category of representations, and it is a non-classifiability statement rather than a difficulty rating. Buchweitz and Leuschke showed that the Cohen-Macaulay representation theory of the generic determinant is wild in a strong sense: already in rank two the isomorphism classes cannot be parametrized by a finite-dimensional variety over the coefficients \cite{buchweitz2005}. Grevstad and May proved that the cohomological Mackey algebra is derived-wild whenever the group surjects onto a $p$-group of order greater than two, and concluded that no meaningful classification of compact $C_p$-equivariant $H\underline{\mathbb{F}}_p$-modules exists at odd primes \cite{grevstad2025}.
   136	
   137	What this forbids is any finite-variety parameterization of the isomorphism classes of a wild representation category, and any classification of a domain that contains such a category as an isomorphism-reflecting subcategory. What it permits is a complete classification theory on the tame side, where parametrizations do exist, and partial invariants on the wild side that ignore the wild core.
   138	
   139	\subsection{Four-manifold unrecognizability}
   140	
   141	In dimension three the geometrization theorem decomposes every oriented prime closed 3-manifold into pieces carrying one of exactly eight Thurston geometries \cite{geometrization}. In dimension four the finite-table picture breaks. Markov's construction shows that unrecognizable four-manifolds exist, that is, manifolds for which the homeomorphism problem is undecidable. Tancer sharpened the construction to show that the connected sum of nine copies of $S^2 \times S^2$ is unrecognizable, improving the previous bound of twelve due to Gordon \cite{tancer2023}. Filipkiewicz classified the four-dimensional maximal model geometries and found eighteen of them plus one countably infinite family, against exactly eight in dimension three \cite{geometrization,perelman,hillman}.
   142	
   143	What this forbids is any effective classification of four-manifolds in general, and any assumption that the finite-list paradigm of dimension three persists upward. What it permits is classification of restricted four-manifold classes, and the dimension contrast itself: finite tables exist in tame regimes, and dimension four is not one of them.
   144	
   145	\subsection{Countable invariants}
   146	
   147	Descriptive set theory supplies a machine for proving that no classification by countable invariants can exist. Sasyk and Tørnquist applied Borel reducibility and Hjorth's theory of turbulence to the isomorphism relation for separable von Neumann algebras \cite{sasyk2009}. The result, as recorded in the survey that this series relies on, is that isomorphism of separable von Neumann algebras admits no classification by countable invariants. The result is published in the Bulletin of Symbolic Logic, with the complete proof in Inventiones Mathematicae \cite{sasyk2009}.
   148	
   149	What this forbids is a complete invariant for general von Neumann algebras taking values in a countable set, and any table of countably many labels exhausting the isomorphism classes. What it permits is classification by uncountable invariant sets, and classification by countable invariants on restricted subclasses.
   150	
   151	\subsection{Tractability boundary}
   152	
   153	The tame-wild dichotomy has an algorithmic shadow. Grochow and Qiao gave polynomial-time algorithms for group isomorphism in the tame direction, for groups whose Sylow subgroups are cyclic, dihedral, semi-dihedral, or generalized quaternion, and showed that the representation-theoretic and cohomological bounds their algorithms need fail in the wild case \cite{grochow2015}. Their conclusion is that the tame-wild line of representation theory is a dividing line between the currently tractable and the currently intractable instances of group isomorphism.
   154	
   155	What this forbids is any promise of a uniform polynomial-time classification procedure across the tame-wild boundary. What it permits is efficient recognition on the tame side, and a precise statement of where the known methods stop.
   156	
   157	\subsection{Register summary}
   158	
   159	\Cref{tab:register} lists each theorem with the classification form it rules out in the generality stated.
   160	
   161	\begin{table}[ht]
   162	\centering
   163	\caption{The obstruction register: seven proved theorems and the classification forms they forbid.}
   164	\label{tab:register}
   165	\small
   166	\begin{tabular}{L{3.2cm}L{4.6cm}L{4.6cm}}
   167	\toprule
   168	Obstruction & Statement & Forbidden classification form \\
   169	\midrule
   170	McDuff 1969 & Uncountably many non-isomorphic separable $\mathrm{II}_1$ factors & Total factor classification outside the amenable class \\
   171	Etingof-Gelaki & Non-isomorphic groups with equivalent plain tensor representation categories & Equivalence discarding the symmetric layer \\
   172	Adyan-Rabin & Every Markov property of finitely presentable groups is undecidable & Uniform recognition of group-flavored properties \\
   173	Wildness & Wild categories admit no finite-variety parametrization of isomorphism classes & Finite-variety parameterization of wild sectors \\
   174	Tancer 2023 & Nine-fold connected sum of $S^2 \times S^2$ is unrecognizable & Effective classification of four-manifolds \\
   175	Sasyk-Tørnquist & vN algebra isomorphism admits no classification by countable invariants & Countable-valued complete invariants \\
   176	Grochow-Qiao & Tame extensions tractable, wild bounds fail & Uniform polynomial-time classification across the boundary \\
   177	\bottomrule
   178	\end{tabular}
   179	\end{table}
   180	
   181	\section{Regime taxonomy}
   182	
   183	\subsection{Classification program data}
   184	
   185	The register forbids specific forms of classification. To compare those forms across domains, a classification program is decomposed into three pieces of data.
   186	
   187	\begin{definition}[Classification program]
   188	\label{def:program}
   189	Let $(D, \simeq)$ be a domain of objects with an equivalence relation. A classification program for $(D, \simeq)$ is a triple $(\iota, \Pi, R)$ where $\iota$ is a complete invariant, a map from objects to a set $I$ with $\iota(x) = \iota(y)$ if and only if $x \simeq y$; $\Pi$ is a parameter space, a structured object together with a structure-compatible surjection onto the $\simeq$-classes of $D$; and $R$ is a recognizer, a procedure that decides $x \simeq y$ from finite presentations of $x$ and $y$. The structure of $\Pi$ is part of the data: it is a finite-dimensional $k$-variety with an algebraic family, a standard Borel space with a Borel parametrization, or a finite combinatorial set. Without that structure $\Pi$ is just another name for the class set and carries no content beyond $\iota$.
   190	\end{definition}
   191	
   192	\begin{definition}[Finite-variety parametrization]
   193	\label{def:param}
   194	The isomorphism classes of a category $\mathcal{A}$ over a field $k$ are parametrized by a finite-dimensional variety when there are a finite-dimensional $k$-variety $V$ and an algebraic family of objects $\{A_v\}_{v \in V(k)}$ of $\mathcal{A}$ such that every object of $\mathcal{A}$ is isomorphic to some fiber $A_v$. A bare set-theoretic surjection $V(k) \twoheadrightarrow \mathrm{Ob}(\mathcal{A})/{\cong}$ is not a parametrization: when $k$ is uncountable the cardinality of $V(k)$ exceeds the class set of any tame category, so such maps exist trivially and carry no geometric information.
   195	\end{definition}
   196	
   197	\Cref{def:param} is the notion the wildness results refute. Buchweitz and Leuschke show that in rank two the isomorphism classes of the generic determinant's Cohen-Macaulay modules admit no parametrization by a finite-dimensional variety over the coefficients \cite{buchweitz2005}, in exactly the algebraic-family sense of \Cref{def:param}.
   198	
   199	The classification of finite simple groups delivers an exhaustive list, and practical identification runs through companion data of the Atlas kind: order, Schur multiplier, outer automorphism group, presentations, character tables with power maps \cite{atlaswiki}. What it does not deliver is a uniform parameterization. Gorenstein's verdict is the recorded one: no clean uniform description of the finite simple groups analogous to Dynkin diagrams is known \cite{solomon2001}. The classification is complete and its parameterization is missing, so completeness of the list and existence of a parameter space are different achievements. The Killing-Cartan classification of complex semisimple Lie algebras achieves both: Dynkin diagrams parameterize, the invariant is complete, and recognition is algorithmic \cite{humphreys,fultonharris}. Darboux's theorem shows a third configuration: locally, symplectic manifolds of the same dimension are all equivalent, so the local classification is complete and trivial and its content is entirely global \cite{darboux}.
   200	
   201	\begin{lemma}[Countable invariants]
   202	\label{lem:countable}
   203	If the isomorphism relation on a domain $D$ admits no classification by countable invariants in the descriptive-set-theoretic sense, that is, if it is not Borel reducible to the isomorphism relation of any class of countable structures, then no complete invariant of $D$ takes values in a space of countable structures. If in addition $D$ has more than countably many isomorphism classes, then no complete invariant of $D$ takes values in a countable set.
   204	\end{lemma}
   205	
   206	\begin{proof}
   207	A complete invariant whose values are countable structures, taken with a Borel assignment of the structure to the object, is a classification by countable invariants and would give a Borel reduction to the isomorphism of those structures. For the second claim, a complete invariant with countable range has countably many fibers, so the class set is countable.
   208	\end{proof}
   209	
   210	For the separable $\mathrm{II}_1$ factors the second claim of \Cref{lem:countable} is already settled by McDuff's uncountable family \cite{mcduff1969}. The first claim is stronger: for general separable von Neumann algebras even invariants valued in countable structures, K-theory data of that kind, fail to classify isomorphism \cite{sasyk2009}. A cardinality bound and a Borel-reducibility bound are different statements, and the arguments below invoke each where it applies.
   211	
   212	\begin{remark}[Two instances of the definition]
   213	Finite-dimensional complex $C^*$-algebras instantiate \Cref{def:program} with $\iota$ the dimension vector, $\Pi$ the finite set of multisets of block sizes, and $R$ the block decomposition algorithm. Finitely presented groups under isomorphism instantiate it with the obstruction register in place of the components: $\iota$ exists set-theoretically, no algebraic-family $\Pi$ is expected in the wild sectors, and $R$ does not exist at all in the presence of Markov reductions. The two instances show that the definition is neutral between regimes; the regimes are properties of the evidence, not of the definition.
   214	\end{remark}
   215	
   216	\subsection{The seven regimes}
   217	
   218	\begin{definition}[Regimes]
   219	\label{def:regime}
   220	A domain $(D, \simeq)$ with a classification program lies in one of seven regimes. \emph{Parameterized}: all three components exist and $\Pi$ is one of the structured kinds of \Cref{def:program}, a finite combinatorial set, a finite-dimensional variety with an algebraic family, or a standard Borel space with a Borel parametrization. \emph{Unparameterized}: $\iota$ and $R$ exist, no uniform $\Pi$ is known. \emph{Obstruction-complete}: the classification content is a proved impossibility theorem, so the classification is the obstruction. \emph{Open}: partial results exist and no impossibility theorem applies. \emph{Wild}: finite-variety parametrization is provably impossible and isomorphism classes grow without bound in every proposed parameter dimension. \emph{Undecidable}: $R$ is provably nonexistent in the stated generality. \emph{Decidable-but-unclassified}: $R$ exists and no complete $\iota$ is known.
   221	\end{definition}
   222	
   223	The regimes are not a partition of a single mathematical universe. They are a partition of the surveyed domains of the series by the shape of their classification evidence, and the assignment in \Cref{tab:regimes} is checked computationally in Section 8. The regime vocabulary is the deliverable the periodic table of the program needs: a table must mark where no table can exist, and the seven regimes are the marks available.
   224	
   225	Each regime has an archetype. The Killing-Cartan classification is the archetype of the parameterized regime; the classification of finite simple groups is the archetype of the unparameterized regime; anomaly classification is the archetype of obstruction-complete; fusion categories are the archetype of open; the Cohen-Macaulay modules of the generic determinant are the archetype of wild; Markov properties of finitely presented groups are the archetype of undecidable; and unknot recognition is the archetype of decidable-but-unclassified. The archetypes are proved mathematics in every case, so the taxonomy rests on theorems rather than on analogy.
   226	
   227	\subsection{Assignment of surveyed domains}
   228	
   229	\Cref{tab:regimes} assigns each domain from the literature survey of the series to a regime. The proofs behind the assignments are the register of Section 3 and the classification theorems cited in the survey.
   230	
   231	\begingroup
   232	\small
   233	\begin{longtable}{L{4.2cm}L{3.2cm}L{4.8cm}}
   234	\caption{Regime assignment for the surveyed domains. Each row is a domain of the series literature map, with the regime of \Cref{def:regime} and the deciding evidence.}
   235	\label{tab:regimes}\\
   236	\toprule
   237	Domain & Regime & Deciding evidence \\
   238	\midrule
   239	\endfirsthead
   240	\toprule
   241	Domain & Regime & Deciding evidence \\
   242	\midrule
   243	\endhead
   244	\midrule
   245	\multicolumn{3}{r}{Continued on next page}\\
   246	\endfoot
   247	\bottomrule
   248	\endlastfoot
   249	Simple Lie algebras & Parameterized & Dynkin and Satake diagrams \cite{humphreys,fultonharris} \\
   250	Highest-weight irreps & Parameterized & Dominant integral weights \cite{humphreys,fultonharris} \\
   251	Finite-dim $C^*$-algebras & Parameterized & Dimension vector \cite{cstarwiki} \\
   252	Principal $G$-bundles & Parameterized & Maps into the classifying space \cite{cstarwiki} \\
   253	Classical monotone metrics & Parameterized & Fisher metric unique up to constant \cite{petzsudar} \\
   254	Local symplectic germs & Parameterized & Darboux normal form \cite{darboux} \\
   255	Amenable factors & Parameterized & Type and Connes invariants \cite{vnwiki} \\
   256	Finite simple groups & Unparameterized & Complete list, no uniform parameterization \cite{solomon2001} \\
   257	Quantum monotone metrics & Unparameterized & Operator monotone functions, infinite family \cite{petzsudar} \\
   258	Anomalies & Obstruction-complete & Cohomological obstruction classes \cite{cstarwiki} \\
   259	General $\mathrm{II}_1$ factors & Obstruction-complete & McDuff's theorem \cite{mcduff1969} \\
   260	Plain tensor category recovery & Obstruction-complete & Etingof-Gelaki counterexamples \cite{eg2000} \\
   261	Fusion categories & Open & Weak Hopf algebra presentation known \cite{fusionnlab} \\
   262	Elliott nuclear program & Open & Program unfinished \cite{cstarwiki} \\
   263	Holographic entropy cone, $n \geq 5$ & Open & One inequality family known \cite{cstarwiki} \\
   264	Extended TQFTs & Open & Classification claim carries a proof gap \cite{lurie2009} \\
   265	Yang-Mills mass gap & Open & Clay lists the problem unsolved \cite{clay} \\
   266	Type III factors & Open & Coarse Connes strata only \cite{vnwiki} \\
   267	Wild CM modules of the generic determinant & Wild & No finite-variety parametrization \cite{buchweitz2005} \\
   268	$C_p$-equivariant modules at odd primes & Wild & Derived-wild Mackey algebra \cite{grevstad2025} \\
   269	Derived-wild algebras & Wild & Wildness holds under degeneration \cite{bekkert2003} \\
   270	Finitely presented groups, Markov properties & Undecidable & Adyan-Rabin \cite{rabin1958} \\
   271	Four-manifold homeomorphism & Undecidable & Unrecognizable connected sums \cite{tancer2023} \\
   272	vN algebra isomorphism & Obstruction-complete & No classification by countable structures \cite{sasyk2009} \\
   273	Unknot recognition & Decidable-but-unclassified & In NP and coNP, P open \cite{hass1999,lackenby2021} \\
   274	Three-manifolds & Parameterized & Eight Thurston geometries \cite{geometrization} \\
   275	Four-dimensional model geometries & Parameterized & Eighteen models plus one countable family listed explicitly \cite{geometrization,perelman,hillman} \\
   276	Quantum channels & Unparameterized & Minimal dilation normal form only \cite{cstarwiki} \\
   277	Group isomorphism, tame extensions & Parameterized & Polynomial time on the tame side \cite{grochow2015} \\
   278	\end{longtable}
   279	\endgroup
   280	
   281	\begin{remark}[Assignment is evidence-shaped]
   282	The assignment records where the classification evidence of each domain sits as of October 2026. A domain moves when new theorems arrive: the fusion-category entry moves if the open conjecture closes \cite{fusionnlab}. One tracked claim sits outside the table because it rests on announcements rather than published proofs: an October 2026 existence claim for four-dimensional Yang-Mills and QCD, whose status is exactly the standing one, existence claimed; manuscript and formalization withheld; verification pending \cite{openai,kitp}. Existence and the mass gap are separate questions and are never conflated; the Clay problem remains open \cite{clay,kitp}.
   283	\end{remark}
   284	
   285	\subsection{Lessons from the model program}
   286	
   287	The classification of finite simple groups is the reference point of the series, and three of its lessons structure the regime taxonomy.
   288	
   289	The first lesson is that classification and parameterization are different achievements. The classification is complete, and the recorded verdict is that no clean uniform description of the finite simple groups analogous to Dynkin diagrams is known \cite{solomon2001}. The unparameterized regime exists in the model program itself, which is why the regime taxonomy separates the two components of \Cref{def:program} rather than collapsing them into one verdict of classified.
   290	
   291	The second lesson is that practical identification runs through companion data. Practitioners identify finite groups by order, Schur multiplier, outer automorphism group, presentations, and character tables with power maps \cite{atlaswiki}. These are not the complete invariant of the classification theorem; they are an atlas of computable fingerprints that make the classification usable. A classification program for physical systems will need the same two layers, theorem and atlas, and the regime taxonomy applies to the theorem layer while the atlas layer remains to be built.
   292	
   293	The third lesson is that a completed classification can carry its own gaps and still be complete. The proof of the classification of finite simple groups was announced prematurely and completed only decades later \cite{solomon2001}. Completeness is a property of the final statement and proof, not of announcements, and the claim discipline of the series records this by keeping announced results out of the theorem register until they are proved.
   294	
   295	None of the three lessons is an obstruction. Together they explain why the unparameterized regime is not a failure and why the regime taxonomy records seven shapes of evidence rather than one ladder of success.
   296	
   297	\subsection{Regime stability}
   298	
   299	The regime assignment of \Cref{tab:regimes} is dated evidence, and three kinds of event move rows.
   300	
   301	A new theorem moves a row upward in the table. The fusion-category row moves from open to parameterized or unparameterized if the structural conjecture in that area closes; the Elliott program row moves when the program completes or when a counterexample to its uniqueness conjecture is proved; the four-dimensional existence row moves when the announced manuscript and its formalization are released and verified \cite{openai,kitp,cstarwiki,fusionnlab}.
   302	
   303	A new obstruction moves a row downward. A proof that a recognition problem is unrecognizable, or that a representation category is wild, moves its domain into undecidable or wild and, by \Cref{thm:transport}, moves every domain containing it isomorphism-reflectingly.
   304	
   305	A change of equivalence moves rows sideways. If a domain is redefined under a coarser equivalence, its invariant becomes complete or incomplete for reasons that have nothing to do with new theorems; \Cref{prop:equiv} is exactly such a case at the level of groups. The taxonomy is therefore a record of theorems and of a chosen equivalence, and both must be read with it.
   306	
   307	\section{Nonclassification results}
   308	
   309	Obstructions propagate along embeddings: a wild or undecidable sector carried by a fully faithful functor that is injective on isomorphism classes brings its failure with it into the larger domain, and undecidability transports along computable reductions. Three natural completions of the classification picture fail on explicit counterexamples.
   310	
   311	\subsection{Obstruction transport}
   312	
   313	\begin{definition}[Isomorphism-injective functor]
   314	\label{def:injfun}
   315	A functor $F: \mathcal{A} \to \mathcal{C}$ is isomorphism-injective when $F(A) \cong F(B)$ implies $A \cong B$ for all objects $A, B$ of $\mathcal{A}$. Every fully faithful functor is isomorphism-injective: the inverse of an isomorphism $F(A) \cong F(B)$ lifts to a morphism over $B$, and the lifted composites are identities by uniqueness of preimages.
   316	\end{definition}
   317	
   318	\begin{theorem}[Obstruction transport]
   319	\label{thm:transport}
   320	Let $F: \mathcal{A} \to \mathcal{C}$ be fully faithful.
   321	\begin{enumerate}
   322	\item If $\mathcal{A}$ has uncountably many isomorphism classes, so does $\mathcal{C}$, and if no complete invariant of $\mathcal{A}$ takes values in a countable set, none for $\mathcal{C}$ does either. If $\mathcal{A}$ and $\mathcal{C}$ are categories of structures on standard Borel spaces of objects and $F$ acts Borel-measurably on those spaces, then classification of the isomorphism relation of $\mathcal{C}$ by countable structures implies the same for $\mathcal{A}$; hence non-classifiability by countable structures transports from $\mathcal{A}$ to $\mathcal{C}$.
   323	\item If $\mathcal{A}$ carries a wild embedding, a family of objects with the matrix-pair universality property of the tame-wild dichotomy, then $\mathcal{C}$ carries the same wild embedding composed with $F$. Every non-parametrization or non-classification conclusion whose hypothesis is such an embedding, as in the wildness results of the register, is then available for the embedded family in $\mathcal{C}$ on the same footing as in $\mathcal{A}$.
   324	\end{enumerate}
   325	\end{theorem}
   326	
   327	\begin{proof}
   328	$F$ is isomorphism-injective by \Cref{def:injfun}, so it induces an injection $F_*: \mathrm{Ob}(\mathcal{A})/{\cong} \hookrightarrow \mathrm{Ob}(\mathcal{C})/{\cong}$ on isomorphism classes, and uncountability and the absence of countable-valued complete invariants transport by restriction of any hypothetical invariant to $\mathcal{A}$ along $F$. For the countable-structures claim, a Borel reduction of the isomorphism relation of $\mathcal{C}$ to the isomorphism of countable structures, composed with the Borel map $F$ induces on object spaces, is a Borel reduction for $\mathcal{A}$; contrapositively, none for $\mathcal{A}$ means none for $\mathcal{C}$. The Borel hypotheses are what make this composition legitimate; without them the claim is not asserted. For the wild embedding, the matrix-pair family in $\mathcal{A}$ maps to a family in $\mathcal{C}$ with identical $\operatorname{Hom}$-space dimensions, since $F$ is fully faithful, and identical isomorphism behavior, since $F$ is isomorphism-injective; the universality property is preserved verbatim.
   329	\end{proof}
   330	
   331	The wild-embedding clause transports the obstruction, not the conclusion about a category strictly larger than the embedded family. When a whole category is the wild family, as for the Cohen-Macaulay modules of the generic determinant \cite{buchweitz2005}, non-parametrization of the category follows in the sense of \Cref{def:param}. When the wild family sits inside a larger category, the proved non-parametrization statements apply to the essential image of the wild module category and to any subcategory of $\mathcal{C}$ equivalent to it; no claim is made about parametrizations of a category that strictly contains that image without an explicit moduli framework for the containment.
   332	
   333	\begin{corollary}[Wild embedding]
   334	\label{cor:wild}
   335	Let $\mathcal{C}$ be a category of representations admitting a fully faithful functor $F$ from the module category of a derived-wild finite-dimensional algebra. Then $\mathcal{C}$ carries a wild embedding, the essential image $F(\mathcal{A})$ admits no finite-variety parametrization of its isomorphism classes \cite{bekkert2003,buchweitz2005,grevstad2025}, and the same non-parametrization holds for any subcategory of $\mathcal{C}$ equivalent to that image.
   336	\end{corollary}
   337	
   338	\Cref{cor:wild} is the reason wildness is a structural fact about a domain and not a comment on the state of the art. The generic determinant's Cohen-Macaulay modules in rank two already defeat finite-variety parametrization \cite{buchweitz2005}, and the compact $C_p$-equivariant modules at odd primes carry no meaningful classification at all \cite{grevstad2025}. Any larger domain that embeds either category in the manner of the corollary carries the obstruction on its embedded part. The same pattern with \Cref{lem:countable} shows that a sector with no classification by countable structures forbids such classification for any domain receiving it along a Borel, fully faithful functor.
   339	
   340	\begin{corollary}[Operator-algebra consequence]

exec
/usr/local/bin/zsh -lc "sed -n '341,479p' papers/latex/vol-11-completeness-obstructions.tex | nl -ba -v341" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   341	\label{cor:opalg}
   342	Let $\mathcal{C}$ be the category of separable von Neumann algebras with normal *-homomorphisms as morphisms, taken with isomorphism as its equivalence. The separable $\mathrm{II}_1$ factors have uncountably many isomorphism classes \cite{mcduff1969}, so no complete invariant of $\mathcal{C}$ takes values in a countable set, and no atlas of countably many computable fingerprints can be complete for $\mathcal{C}$. The stronger statement holds: the isomorphism relation of $\mathcal{C}$ admits no classification by countable structures at all \cite{sasyk2009}.
   343	\end{corollary}
   344	
   345	\begin{proof}
   346	An atlas of countably many computable fingerprints assigns to each algebra a tuple of values from countable sets, and the combined map is a complete invariant with countable range if the atlas is complete; \Cref{lem:countable} and McDuff's uncountable family rule this out \cite{mcduff1969}. The stronger statement is the Borel-reducibility result of Sasyk and Tørnquist \cite{sasyk2009}.
   347	\end{proof}
   348	
   349	\Cref{cor:opalg} fixes the reach of the Atlas discipline of the model program, identification by finite tables of computable data \cite{atlaswiki}. That method is complete exactly where a countable-valued complete invariant exists and provably incomplete where uncountably many classes or the Borel-reducibility obstruction stand. The regime table records which domains admit an atlas at all.
   350	
   351	\subsection{Recognition reductions}
   352	
   353	\begin{proposition}[Undecidability transport]
   354	\label{prop:undec}
   355	Let $Q$ be a recognition problem for a class $\mathcal{C}$, and suppose there is a computable map $\varphi$ from finite group presentations to objects of $\mathcal{C}$ and a Markov property $P$ of finitely presentable groups such that a presentation $G$ has $P$ if and only if $\varphi(G)$ satisfies $Q$. Then $Q$ is algorithmically undecidable.
   356	\end{proposition}
   357	
   358	\begin{proof}
   359	A decision procedure for $Q$, composed with the computable map $\varphi$, decides $P$ on finite presentations. By the Adyan-Rabin theorem no such procedure exists for any Markov property \cite{adyan1955,rabin1958}. Hence none exists for $Q$.
   360	\end{proof}
   361	
   362	\Cref{prop:undec} is the shape of every undecidability entry in the register. Tancer's construction is an instance: the unrecognizability of the nine-fold connected sum of $S^2 \times S^2$ is proved through the Markov set construction carried into four-manifold topology \cite{tancer2023}. The proposition also explains why undecidability is a statement about the recognizer component of \Cref{def:program} and says nothing by itself about invariants or parameter spaces: an undecidable domain may still carry rich complete invariants that no algorithm can compute.
   363	
   364	\subsection{Counterexample catalogue}
   365	\label{sec:counterexamples}
   366	
   367	Each of the three natural strengthenings of the classification picture below fails on an explicit counterexample.
   368	
   369	\begin{proposition}[No finite sporadic list]
   370	\label{prop:sporadic}
   371	The hypothesis that the isomorphism classes of a completed classification decompose into infinite families plus finitely many exceptional objects is false for the operator-algebra sector and for four-dimensional geometry. The separable $\mathrm{II}_1$ factors number uncountably many isomorphism classes \cite{mcduff1969}, and the four-dimensional maximal model geometries number eighteen plus one countably infinite family \cite{geometrization}.
   372	\end{proposition}
   373	
   374	\begin{proof}
   375	Both lower bounds refute finiteness of the exceptional set: uncountably many classes cannot be listed as finitely many sporadics, and a countably infinite family of model geometries is not finite. Any classification whose final form is families plus finitely many sporadics is therefore false in these sectors before its completeness is even considered.
   376	\end{proof}
   377	
   378	\begin{proposition}[The two-regime picture fails]
   379	\label{prop:tworegime}
   380	The taxonomy that sorts domains into classified and impossible misassigns at least two surveyed domains. Unknot recognition is decidable and sits in NP and coNP, while its complexity class is open and no complete invariant is known \cite{hass1999,lackenby2021}. The finite simple groups are completely classified and carry no uniform parameterization \cite{solomon2001}. The first domain is decidable but unclassified; the second is classified but unparameterized. Neither fits a two-regime picture.
   381	\end{proposition}
   382	
   383	\begin{proof}
   384	Decidable-but-unclassified and classified-but-unparameterized are distinct shapes of evidence, exhibited by the two named domains. Any taxonomy with two regimes assigns both domains to the same regime, and in that regime one of the two descriptions of the evidence is wrong. Hence the two-regime picture is refuted, and the seven regimes of \Cref{def:regime} are needed to keep the descriptions straight.
   385	\end{proof}
   386	
   387	\begin{proposition}[Equivalence at the plain tensor layer fails]
   388	\label{prop:equiv}
   389	Let $\simeq_{\mathrm{pt}}$ be the relation on finite groups obtained by declaring $G \simeq_{\mathrm{pt}} H$ when their representation categories are equivalent as plain tensor categories. Then $\simeq_{\mathrm{pt}}$ is strictly coarser than isomorphism, so any classification of systems whose symmetry data is a finite group, conducted at the plain tensor layer, identifies distinct systems.
   390	\end{proposition}
   391	
   392	\begin{proof}
   393	Etingof and Gelaki exhibit non-isomorphic finite groups with equivalent plain tensor representation categories \cite{eg2000}. For such a pair $G \not\cong H$ while $G \simeq_{\mathrm{pt}} H$, so the quotient by $\simeq_{\mathrm{pt}}$ is strictly coarser than the quotient by isomorphism. A classification built on $\simeq_{\mathrm{pt}}$ therefore merges distinct isomorphism classes, and its fibers are not the classes one set out to classify.
   394	\end{proof}
   395	
   396	\Cref{prop:equiv} is the counterexample the register promised for the third proof obligation of the universal conjecture. Choosing an equivalence relation is not a formality: the plain tensor choice is a natural one, it is stated in one line, and it is provably wrong. Every equivalence admitted in the program must name the layers of structure it preserves, and the symmetric layer is the one that recovers the group.
   397	
   398	\subsection{Common consequences}
   399	
   400	The four statements have a common consequence. Non-classifiability in the register is not a set of isolated pathologies; it travels along fully faithful embeddings (\Cref{thm:transport}), along computable maps (\Cref{prop:undec}), and it defeats three natural completion schemes (Propositions \ref{prop:sporadic} to \ref{prop:equiv}). A universal classification theorem for all admissible physical systems cannot be of CFSG form unless every wild, undecidable, and unrecognizable sector is excluded from its quantifiers. The exclusions are restrictions on the domain, and each restriction is a new admissibility condition of the kind that \Cref{rem:unfixed} records as unfixed.
   401	
   402	\subsection{Scope of the transport theorem}
   403	
   404	\Cref{thm:transport} quantifies over functors injective on isomorphism classes, and its hypotheses are mathematical. Three remarks delimit its use.
   405	
   406	The theorem transports refutations, not theorems. It moves wild embeddings and invariant obstructions from a subcategory to a larger category, and it moves undecidability along computable reductions. It does not transport positive classification results: a classification of a subcategory says nothing about the ambient category, which is why the completed islands of Section 6 each restate their own hypotheses.
   407	
   408	Full faithfulness is what carries the wild embedding, because it preserves the Hom-dimensions the universality property is built from; injectivity on isomorphism classes is what carries isomorphism behavior. Physical embeddings that deliberately identify systems fail the second hypothesis, and a coarse-graining map that forgets microscopic detail typically fails it as well, so the theorem is silent about classification programs run on coarse descriptions.
   409	
   410	The theorem applies at the level of domains, not of families. A family such as the operator-algebra family contains parameterized islands and obstruction-complete sectors side by side, and the transport theorem says which ambient domains inherit which failure. Regime assignment remains a domain-level judgment, and the two levels must not be confused.
   411	
   412	\section{Restricted classification results}
   413	
   414	Completed classifications exist on restricted domains under explicit hypotheses, and each is an instance of \Cref{def:program}. The restriction in each of them is load-bearing rather than removable by a better argument, as \Cref{cor:restrict} records.
   415	
   416	\subsection{Completed islands}
   417	\label{sec:completed}
   418	
   419	The finite-dimensional complex $C^*$-algebras are classified completely. Every such algebra is a direct sum $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ of matrix algebras, and the multiset of matrix sizes, the dimension vector, determines $A$ up to *-isomorphism \cite{cstarwiki}. The classification program of \Cref{def:program} is fully realized here: the dimension vector is a complete invariant, the parameter space is the set of finite multisets of positive integers, and recognition is the finite computation of block decomposition. This is the model theorem of the series and the shape every restricted classification aims at.
   420	
   421	The amenable factors are classified as well: types $\mathrm{I}_n$, $\mathrm{I}_\infty$, $\mathrm{II}_1$, $\mathrm{II}_\infty$, $\mathrm{III}_\lambda$ for $0 < \lambda \leq 1$, and $\mathrm{III}_0$, with the invariant given by Murray-von Neumann type and Connes data \cite{connes1976,vnwiki}. The restriction is the word amenable. McDuff's theorem removes it and the classification dies \cite{mcduff1969}.
   422	
   423	Principal $G$-bundles over a base $X$ are classified by homotopy classes of maps into the classifying space, and the characteristic classes are exactly the pullbacks of universal classes \cite{cstarwiki}. The restriction is topological: the classification is up to bundle isomorphism and it records no connection data. Anomalies are classified on the obstruction pattern: the gauge anomaly is a pair of cohomology classes whose vanishing is the condition for quantization, so the classification content is the obstruction itself \cite{cstarwiki}.
   424	
   425	Doplicher-Roberts reconstruction classifies symmetric tensor *-categories with conjugates, direct sums, subobjects, and $\operatorname{End}(1) = \mathbb{C}$: such a category is the representation category of a compact supergroup, unique up to isomorphism \cite{eg2000}. The hypotheses are the restriction, and the Etingof-Gelaki counterexamples show that dropping the symmetric layer destroys the conclusion \cite{eg2000}. Deligne's theorem classifies symmetric tensor categories of subexponential growth in characteristic zero along the same lines \cite{eg2000}.
   426	
   427	Quantum channels occupy a middle position. Stinespring dilation classifies completely positive maps up to minimal dilation, unique up to unitary freedom, and the Choi-Kraus form is a normal form whose Kraus rank is an invariant of the form \cite{stinespring,cstarwiki}. The classification is of dilations, not of channels up to isomorphism, and the Kraus rank of a normal form is not an isomorphism invariant of the channel. This is a classification of a presentation, and the regime table places the domain in the unparameterized regime accordingly.
   428	
   429	The local symplectic classification is complete and trivial: Darboux's theorem gives local normal form with no local invariants, so the classification content of the symplectic side is entirely global and topological \cite{darboux}. In the opposite direction, the Killing-Cartan classification of semisimple Lie algebras and the highest-weight classification of their irreducible representations deliver complete invariants with parameterizations \cite{humphreys,fultonharris}. The geometrization theorem decomposes closed 3-manifolds into exactly eight Thurston geometries \cite{geometrization}, and Chentsov's theorem gives the Fisher metric as the unique metric monotone under stochastic maps, while the quantum analogue is a parametric family indexed by operator monotone functions \cite{petzsudar}. In every row the invariant is finite or parametric, and in every row the domain is stated with its restrictions.
   430	
   431	\subsection{Hypotheses and their cost}
   432	
   433	\begin{corollary}[Quantifier restriction]
   434	\label{cor:restrict}
   435	Under the hypotheses of \Cref{thm:transport}, a completeness statement for $\mathcal{C}$ in the sense of \Cref{def:program} is false. Under the hypotheses of \Cref{prop:undec}, a recognition statement for $\mathcal{C}$ in that sense is false. Any correct completeness or recognition statement about $\mathcal{C}$ restricts its quantifiers to a subdomain that excludes the part carrying the obstruction.
   436	\end{corollary}
   437	
   438	\begin{proof}
   439	\Cref{thm:transport} and \Cref{prop:undec} deny the existence of the parameter space or of the recognizer over all of $\mathcal{C}$. A statement quantified over a subdomain that excludes the obstruction carries no contradiction, and the surveyed theorems of Section 6.1 are all of this form.
   440	\end{proof}
   441	
   442	\Cref{cor:restrict} explains the shape of the completed islands. The restriction in each theorem is not a hedge and it is not removable by a better argument; it is the boundary the obstruction register draws. Two further points about the cost of hypotheses deserve recording. First, hypotheses can be subtle: braided extensions of the Doplicher-Roberts setting can require extra data beyond the braiding for the reconstruction to close, so the hypothesis list of a reconstruction theorem is part of its content and must travel with it. Second, a restriction can hide a boundary rather than a theorem: the tame side of the Grochow-Qiao divide admits polynomial-time isomorphism testing for the groups named, and the wild side fails the bounds their method needs \cite{grochow2015}. A classification program built on the tame side inherits the boundary as a working assumption.
   443	
   444	\subsection{Regime boundaries}
   445	
   446	Where the tame-wild boundary sits for physical representation categories, as opposed to generic algebras, is unstudied. The generic mathematics supplies the dichotomy and the algorithmic shadow \cite{bekkert2003,grochow2015}; no result on record locates the boundary for the tensor categories or representation categories that physical theories actually use. The question matters for the program, because a completeness theorem for a physical class is exactly a theorem that the class sits on the tame side.
   447	
   448	Regime boundaries move in one further way. When an announcement matures into a published proof, its domain enters the table at the regime the proof supports; until then the claim is tracked outside the taxonomy, as in \Cref{tab:regimes}'s companion remark. The taxonomy records theorems, and announcements are not theorems.
   449	
   450	The regime taxonomy records that boundaries are not always sharp walls. Unknot recognition is decidable and sits in NP and coNP, while its complexity class is open and no complete invariant is known \cite{hass1999,lackenby2021}. Between the classified and the impossible there are domains whose status is settled in one component of \Cref{def:program} and unsettled in another. Any periodic table of the program must carry such entries honestly rather than forcing them into a binary verdict.
   451	
   452	\section{The five obligations}
   453	
   454	The universal classification conjecture states that every admissible physical system is generated by a fixed collection of structural families under a fixed set of admissible constructions, up to a justified equivalence. Its proof obligations number five, and \Cref{tab:obligations} gives their status against the evidence of this paper. The conjecture is a registered hypothesis and an object of analysis here; nothing in this section assumes it true or false.
   455	
   456	\begin{table}[ht]
   457	\centering
   458	\caption{The five proof obligations of the universal classification conjecture and their status.}
   459	\label{tab:obligations}
   460	\small
   461	\begin{tabular}{L{3.6cm}L{5.4cm}L{3.2cm}}
   462	\toprule
   463	Obligation & Content & Status \\
   464	\midrule
   465	Completeness & Every admissible system lies in the generated class & Open, conditional on the unfixed admissibility list \\
   466	Soundness & Every generated structure is admissible & Open, same conditionality \\
   467	Equivalence & Distinct presentations of one system are identified correctly & Open; \Cref{prop:equiv} constrains every choice \\
   468	Structural characterization & The families have precise mathematical definitions & Partial: families named, admissibility unfixed \\
   469	Decomposition & Targeted classes assemble from the families & Open in general; proved in restricted domains \\
   470	\bottomrule
   471	\end{tabular}
   472	\end{table}
   473	
   474	The completeness obligation quantifies over $\mathrm{Phys}_{\mathrm{adm}}$ and is therefore conditional on the admissibility list that \Cref{rem:unfixed} records as unfixed. Beyond the conditionality, \Cref{thm:transport} blocks the obligation in any formulation whose generated class contains a wild or undecidable sector isomorphism-reflectingly: the parameter space the classification needs cannot exist there. The obligation is open today and its unrestricted form collides with the register.
   475	
   476	The soundness obligation runs in the other direction, from the generated class to the admissibility conditions. It is vacuous until the conditions are stated, and it becomes checkable only after the list is fixed. No obstruction in the register touches it directly; its difficulty is definitional.
   477	
   478	The equivalence obligation is the one with a proved negative result attached. \Cref{prop:equiv} shows that the natural plain tensor choice of equivalence is strictly coarser than isomorphism and merges distinct systems. Any solution must therefore name the layers of structure it preserves and must recover the group from the preserved layers where a group is present. The solution space is restricted by a counterexample, which is a stronger constraint than mere openness.
   479	

exec
/usr/local/bin/zsh -lc "sed -n '285,340p' papers/latex/vol-11-completeness-obstructions.tex | nl -ba -v285" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   285	\subsection{Lessons from the model program}
   286	
   287	The classification of finite simple groups is the reference point of the series, and three of its lessons structure the regime taxonomy.
   288	
   289	The first lesson is that classification and parameterization are different achievements. The classification is complete, and the recorded verdict is that no clean uniform description of the finite simple groups analogous to Dynkin diagrams is known \cite{solomon2001}. The unparameterized regime exists in the model program itself, which is why the regime taxonomy separates the two components of \Cref{def:program} rather than collapsing them into one verdict of classified.
   290	
   291	The second lesson is that practical identification runs through companion data. Practitioners identify finite groups by order, Schur multiplier, outer automorphism group, presentations, and character tables with power maps \cite{atlaswiki}. These are not the complete invariant of the classification theorem; they are an atlas of computable fingerprints that make the classification usable. A classification program for physical systems will need the same two layers, theorem and atlas, and the regime taxonomy applies to the theorem layer while the atlas layer remains to be built.
   292	
   293	The third lesson is that a completed classification can carry its own gaps and still be complete. The proof of the classification of finite simple groups was announced prematurely and completed only decades later \cite{solomon2001}. Completeness is a property of the final statement and proof, not of announcements, and the claim discipline of the series records this by keeping announced results out of the theorem register until they are proved.
   294	
   295	None of the three lessons is an obstruction. Together they explain why the unparameterized regime is not a failure and why the regime taxonomy records seven shapes of evidence rather than one ladder of success.
   296	
   297	\subsection{Regime stability}
   298	
   299	The regime assignment of \Cref{tab:regimes} is dated evidence, and three kinds of event move rows.
   300	
   301	A new theorem moves a row upward in the table. The fusion-category row moves from open to parameterized or unparameterized if the structural conjecture in that area closes; the Elliott program row moves when the program completes or when a counterexample to its uniqueness conjecture is proved; the four-dimensional existence row moves when the announced manuscript and its formalization are released and verified \cite{openai,kitp,cstarwiki,fusionnlab}.
   302	
   303	A new obstruction moves a row downward. A proof that a recognition problem is unrecognizable, or that a representation category is wild, moves its domain into undecidable or wild and, by \Cref{thm:transport}, moves every domain containing it isomorphism-reflectingly.
   304	
   305	A change of equivalence moves rows sideways. If a domain is redefined under a coarser equivalence, its invariant becomes complete or incomplete for reasons that have nothing to do with new theorems; \Cref{prop:equiv} is exactly such a case at the level of groups. The taxonomy is therefore a record of theorems and of a chosen equivalence, and both must be read with it.
   306	
   307	\section{Nonclassification results}
   308	
   309	Obstructions propagate along embeddings: a wild or undecidable sector carried by a fully faithful functor that is injective on isomorphism classes brings its failure with it into the larger domain, and undecidability transports along computable reductions. Three natural completions of the classification picture fail on explicit counterexamples.
   310	
   311	\subsection{Obstruction transport}
   312	
   313	\begin{definition}[Isomorphism-injective functor]
   314	\label{def:injfun}
   315	A functor $F: \mathcal{A} \to \mathcal{C}$ is isomorphism-injective when $F(A) \cong F(B)$ implies $A \cong B$ for all objects $A, B$ of $\mathcal{A}$. Every fully faithful functor is isomorphism-injective: the inverse of an isomorphism $F(A) \cong F(B)$ lifts to a morphism over $B$, and the lifted composites are identities by uniqueness of preimages.
   316	\end{definition}
   317	
   318	\begin{theorem}[Obstruction transport]
   319	\label{thm:transport}
   320	Let $F: \mathcal{A} \to \mathcal{C}$ be fully faithful.
   321	\begin{enumerate}
   322	\item If $\mathcal{A}$ has uncountably many isomorphism classes, so does $\mathcal{C}$, and if no complete invariant of $\mathcal{A}$ takes values in a countable set, none for $\mathcal{C}$ does either. If $\mathcal{A}$ and $\mathcal{C}$ are categories of structures on standard Borel spaces of objects and $F$ acts Borel-measurably on those spaces, then classification of the isomorphism relation of $\mathcal{C}$ by countable structures implies the same for $\mathcal{A}$; hence non-classifiability by countable structures transports from $\mathcal{A}$ to $\mathcal{C}$.
   323	\item If $\mathcal{A}$ carries a wild embedding, a family of objects with the matrix-pair universality property of the tame-wild dichotomy, then $\mathcal{C}$ carries the same wild embedding composed with $F$. Every non-parametrization or non-classification conclusion whose hypothesis is such an embedding, as in the wildness results of the register, is then available for the embedded family in $\mathcal{C}$ on the same footing as in $\mathcal{A}$.
   324	\end{enumerate}
   325	\end{theorem}
   326	
   327	\begin{proof}
   328	$F$ is isomorphism-injective by \Cref{def:injfun}, so it induces an injection $F_*: \mathrm{Ob}(\mathcal{A})/{\cong} \hookrightarrow \mathrm{Ob}(\mathcal{C})/{\cong}$ on isomorphism classes, and uncountability and the absence of countable-valued complete invariants transport by restriction of any hypothetical invariant to $\mathcal{A}$ along $F$. For the countable-structures claim, a Borel reduction of the isomorphism relation of $\mathcal{C}$ to the isomorphism of countable structures, composed with the Borel map $F$ induces on object spaces, is a Borel reduction for $\mathcal{A}$; contrapositively, none for $\mathcal{A}$ means none for $\mathcal{C}$. The Borel hypotheses are what make this composition legitimate; without them the claim is not asserted. For the wild embedding, the matrix-pair family in $\mathcal{A}$ maps to a family in $\mathcal{C}$ with identical $\operatorname{Hom}$-space dimensions, since $F$ is fully faithful, and identical isomorphism behavior, since $F$ is isomorphism-injective; the universality property is preserved verbatim.
   329	\end{proof}
   330	
   331	The wild-embedding clause transports the obstruction, not the conclusion about a category strictly larger than the embedded family. When a whole category is the wild family, as for the Cohen-Macaulay modules of the generic determinant \cite{buchweitz2005}, non-parametrization of the category follows in the sense of \Cref{def:param}. When the wild family sits inside a larger category, the proved non-parametrization statements apply to the essential image of the wild module category and to any subcategory of $\mathcal{C}$ equivalent to it; no claim is made about parametrizations of a category that strictly contains that image without an explicit moduli framework for the containment.
   332	
   333	\begin{corollary}[Wild embedding]
   334	\label{cor:wild}
   335	Let $\mathcal{C}$ be a category of representations admitting a fully faithful functor $F$ from the module category of a derived-wild finite-dimensional algebra. Then $\mathcal{C}$ carries a wild embedding, the essential image $F(\mathcal{A})$ admits no finite-variety parametrization of its isomorphism classes \cite{bekkert2003,buchweitz2005,grevstad2025}, and the same non-parametrization holds for any subcategory of $\mathcal{C}$ equivalent to that image.
   336	\end{corollary}
   337	
   338	\Cref{cor:wild} is the reason wildness is a structural fact about a domain and not a comment on the state of the art. The generic determinant's Cohen-Macaulay modules in rank two already defeat finite-variety parametrization \cite{buchweitz2005}, and the compact $C_p$-equivariant modules at odd primes carry no meaningful classification at all \cite{grevstad2025}. Any larger domain that embeds either category in the manner of the corollary carries the obstruction on its embedded part. The same pattern with \Cref{lem:countable} shows that a sector with no classification by countable structures forbids such classification for any domain receiving it along a Borel, fully faithful functor.
   339	
   340	\begin{corollary}[Operator-algebra consequence]

exec
/usr/local/bin/zsh -lc "python3 -c 'import re,pathlib,collections; s=pathlib.Path(\"papers/latex/vol-11-completeness-obstructions.tex\").read_text(); labels=re.findall(r\"\\\\label\\{(["'^}]+)'"\\}\",s); bibs=re.findall(r\"\\\\bibitem\\{(["'^}]+)'"\\}\",s); print(\"Duplicate labels:\",[k for k,v in collections.Counter(labels).items() if v>1]); print(\"Duplicate bibliography keys:\",[k for k,v in collections.Counter(bibs).items() if v>1]); print(\"Unresolved references:\",[(s[:m.start()].count(chr(10))+1,k) for m in re.finditer(r\"\\\\(?:Cref|cref|ref|eqref)\\{(["'^}]+)'"\\}\",s) for k in m[1].split(\",\") if k not in labels]); print(\"Unresolved citations:\",[(s[:m.start()].count(chr(10))+1,k) for m in re.finditer(r\"\\\\cite\\{(["'^}]+)'"\\}\",s) for k in m[1].split(\",\") if k not in bibs]); print(\"Environment counts:\",collections.Counter(re.findall(r\"\\\\begin\\{(["'^}]+)'"\\}\",s))==collections.Counter(re.findall(r\"\\\\end\\{(["'^}]+)'"\\}\",s)))'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 10ms:
Duplicate labels: []
Duplicate bibliography keys: []
Unresolved references: []
Unresolved citations: []
Environment counts: True

codex
No formatting issues found in the specified file. References and citation keys resolve; environments are balanced, and the packages cover the commands used. No evident spacing or table-width problems were identified.

This was a source-only review; compilation and overfull/underfull-box warnings were not verified.

VERDICT: PASS
hook: Stop
hook: Stop Completed
tokens used
26,413
No formatting issues found in the specified file. References and citation keys resolve; environments are balanced, and the packages cover the commands used. No evident spacing or table-width problems were identified.

This was a source-only review; compilation and overfull/underfull-box warnings were not verified.

VERDICT: PASS
