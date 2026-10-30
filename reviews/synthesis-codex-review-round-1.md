---
reviewer: codex (OpenAI) gpt-6.1-sol
type: formatting
paper: synthesis
round: 1
date: 2026-10-30T08:21:11Z
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
session id: 01a18be6-0bca-7910-9b67-1e91b5e53e5d
--------
user
Read ONLY the file papers/latex/synthesis.tex (do not explore other files or directories). HOUSE RULE, apply it before flagging anything: page ranges and name pairs in this series are spelled with single hyphens in the source, never with -- or en dashes, because a separate humanizer check forbids double hyphens and en dashes. Do NOT ask for Murray--von Neumann, page ranges with --, or any en dash. Review the file for LaTeX formatting issues: compilation errors, missing packages, broken references, inconsistent styling, overfull or underfull boxes, table column problems. List all issues with line numbers and concrete fixes. End your response with a VERDICT line - exactly one of: VERDICT: PASS or VERDICT: NEEDS_FIX.
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
I’ll read only `papers/latex/synthesis.tex` and check its LaTeX formatting, applying your single-hyphen rule throughout.
exec
/usr/local/bin/zsh -lc 'nl -ba papers/latex/synthesis.tex' in /Users/mlong/Documents/Development/classification-physical-systems
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
    12	\usepackage{xcolor}
    13	\usepackage{tikz}
    14	\usepackage{booktabs,tabularx,array,longtable}
    15	\newcolumntype{Y}[1]{>{\hsize=#1\hsize\raggedright\arraybackslash}X}
    16	\usepackage[hidelinks]{hyperref}
    17	\usepackage{cleveref}
    18	
    19	\newtheorem{theorem}{Theorem}[section]
    20	\newtheorem{proposition}[theorem]{Proposition}
    21	\newtheorem{lemma}[theorem]{Lemma}
    22	\newtheorem{corollary}[theorem]{Corollary}
    23	\theoremstyle{definition}
    24	\newtheorem{definition}[theorem]{Definition}
    25	\theoremstyle{remark}
    26	\newtheorem{remark}[theorem]{Remark}
    27	\newtheorem{conjecture}[theorem]{Conjecture}
    28	
    29	\title{Structural Synthesis\\[4pt]
    30	  {\normalsize Synthesis of \emph{The Classification of Mathematical Representations of Physical Systems}}}
    31	\author{Matthew Long\\
    32	  \small The YonedaAI Collaboration, YonedaAI Research Collective\\
    33	  \small Chicago, Illinois, USA\\
    34	  \small \texttt{mlong@yonedalabs.ai}\\
    35	  \small \url{https://yonedalabs.ai}}
    36	\date{October 2026}
    37	
    38	\begin{document}
    39	\maketitle
    40	
    41	\begin{abstract}
    42	This paper states the structural picture formed by the twelve parts of the Classification of Mathematical Representations of Physical Systems, a program asking whether mathematical representations of physical systems admit a structural classification analogous to the Classification of Finite Simple Groups. One ontology of forty-two definitions, one dependency graph, and one equivalence discipline run through the series. Three kinds of result organize its classification content. Complete invariants appear wherever the invariant is finite or explicitly parameterized: dimension vectors for finite-dimensional $C^*$-algebras, Dynkin and Satake diagrams for semisimple Lie theory, classifying spaces for principal bundles, and the Murray-von Neumann and Connes data for amenable factors. Reconstruction theorems recover objects from probes under hypotheses that cannot be dropped. Seven obstruction theorems bound the scope of any classification, from uncountably many type $\mathrm{II}_1$ factors to algorithmic unrecognizability in dimension four. Every equivalence in the series declares the structure it preserves, and equivalences that forget the symmetric layer fail in a proved counterexample. The structural classification conjecture is stated as the program's theorem target with its five proof obligations. The cross-volume consistency report records that the twelve parts share definitions, dependency discipline, and claim vocabulary without conflict.
    43	\end{abstract}
    44	
    45	\section{Introduction}
    46	
    47	The Classification of Mathematical Representations of Physical Systems asks whether the mathematical structures that represent physical systems admit a structural classification analogous to the Classification of Finite Simple Groups. The twelve parts of the series answer in pieces. This paper states the structural picture those pieces form: one ontology, one dependency discipline, one equivalence requirement, and one register of obstruction theorems, carried across classical mechanics, quantum theory, gauge fields, spacetime, and gravity.
    48	
    49	The target of the program is the identity
    50	\[
    51	  \mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F}_\alpha \rangle_{\mathfrak{C}},
    52	\]
    53	in which every admissible physical system is generated from a collection of fundamental structural families under admissible constructions. The identity is the program's theorem target and is stated in full in \cref{conj:cmrps}. The results around it are of three kinds: classification theorems that supply complete invariants in restricted sectors, reconstruction theorems that recover objects from probes, and obstruction theorems that mark where no classification of the stated generality can exist.
    54	
    55	Complete invariants appear exactly where the invariant is finite or explicitly parameterized. Dimension vectors classify finite-dimensional $C^*$-algebras \cite{corpus-9}, Dynkin and Satake diagrams classify complex and real semisimple Lie algebras \cite{corpus-4}, classifying spaces classify principal bundles \cite{corpus-17,corpus-18}, and the Murray-von Neumann and Connes data classify amenable factors \cite{corpus-62,corpus-64}. Outside those regimes the series records either a parameterized family of answers or an obstruction theorem.
    56	
    57	Reconstruction is better developed than classification. Gelfand and Neumark \cite{corpus-42}, Gelfand duality \cite{corpus-43}, Stone duality \cite{corpus-44}, Doplicher and Roberts \cite{corpus-12,corpus-67}, and Deligne \cite{corpus-13} each recover an object from a category of probes, and each does so under hypotheses that cannot be dropped. The symmetric tensor structure, the growth condition, and the commutativity assumption are load-bearing in their respective statements.
    58	
    59	Nonclassifiability is a theorem. The construction of uncountably many type $\mathrm{II}_1$ factors \cite{corpus-65}, the undecidability results for finitely presented groups \cite{corpus-53}, the wildness theorems of representation theory \cite{corpus-55,corpus-56,corpus-58}, and the algorithmic unrecognizability of certain four-manifolds \cite{corpus-54} each prove that no classification of the stated kind exists in the stated generality. These results are first-class content of the series. They mark the scope of the classification program rather than its failure.
    60	
    61	\section{The shared framework}
    62	
    63	Every part of the series works in one definitional substrate. The substrate is a category of representations of physical systems, a discipline of morphisms, a physical equivalence, a collection of structural families, and an invariant record. The definitions are stated once in the foundational part and reused across the series; later parts extend the list only by appending new identifiers. The identifiers and their roles appear in \cref{tab:ontology}.
    64	
    65	\subsection{Objects and components}
    66	
    67	\begin{definition}[Representation of a physical system]
    68	\label{def:representation}
    69	A representation of a physical system is a tuple
    70	\[
    71	  P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C}),
    72	\]
    73	carrying a state space or geometric structure, an observable algebra or collection, dynamical laws, symmetry and constraint data, and composition and interaction rules.
    74	\end{definition}
    75	
    76	The five components of \cref{def:representation} record coordinate data whose concrete realization varies across physical regimes. State spaces instantiate as symplectic manifolds \cite{corpus-6,corpus-68}, Hilbert spaces \cite{corpus-9}, probability spaces, smooth manifolds \cite{corpus-50,corpus-51}, and lattice configurations; observable layers instantiate as function algebras, $C^*$-algebras \cite{corpus-9}, von Neumann algebras \cite{corpus-8}, and sheaf-theoretic observable atlases. The components need not be independent. The composition component $\mathcal{C}$ determines the decomposition theory of the representation, because it defines irreducibility as the absence of a nontrivial factorization under the specified composition operation.
    77	
    78	Objects assemble into a category $\mathrm{Phys}$ whose morphisms are admissible relationships between representations. The full subcategory of admissible objects is $\mathrm{Phys}_{\mathrm{adm}}$, defined in \cref{def:admissibility}. Theorems stated over the admissible subcategory are stated relative to the conditions of that definition.
    79	
    80	\subsection{Morphism kinds}
    81	\label{sec:morphisms}
    82	
    83	Five kinds of relationship appear across the series, and they are not all arrows of one 1-category. Coarse-graining forgets microscopic detail while preserving macroscopic observables. Exact equivalence is invertible and represents identity of content up to the chosen relation. Embedding realizes a system as a subsystem, a subtheory, or a sub-structure. These three are arrows in the strict reading of $\mathrm{Phys}$. Duality exchanges structure between differently presented theories and is a functor between category presentations, generally invertible only after passage to an opposite or dual category. Limiting procedures arise from limits and colimits: thermodynamic limits, infinite-volume limits, semiclassical limits, and continuum limits. These last two are universal constructions rather than arrows between two objects.
    84	
    85	The series therefore specifies morphism class by class. Each kind carries a preservation law, the explicit conditions it must satisfy together with the rule under which two such morphisms compose, and a part states which morphism classes are in force whenever it uses the category. The strict reading of $\mathrm{Phys}$ takes coarse-grainings, embeddings, and exact equivalences as its arrows; dualities are realized as functors between category presentations and limiting procedures as universal constructions in $\mathfrak{C}$. That strict reading is the one in which the central conjecture is stated, and whether a single category carries all five kinds at once, or whether several related categories or a higher structure are required, is a research question of the program.
    86	
    87	Continuum limits are the load-bearing instance. Lattice theorems in restricted regimes \cite{corpus-30,corpus-31,corpus-32} do not by themselves close the continuum limit, and the series keeps the two apart.
    88	
    89	\subsection{Equivalence}
    90	
    91	Physical equivalence is a chosen relation on objects; the classification problem is the problem of classifying admissible representations up to that relation. Mathematical equivalence, isomorphism of the five-component tuples in the ambient category of each component, is strictly finer in general. Two mathematical descriptions may be physically equivalent without being mathematically isomorphic.
    92	
    93	The series binds every Yoneda-based argument to one constraint, quoted from the founding document: ``Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.'' The Yoneda embedding sends an object to its functor of relationships,
    94	\[
    95	  P \;\longmapsto\; \mathrm{Hom}_{\mathrm{Phys}}(-, P),
    96	\]
    97	and is faithful as mathematics. The physical interpretation of the resulting categorical structure is established separately.
    98	
    99	A second constraint governs every equivalence used to identify systems. Any such equivalence must state which layer of structure it preserves. Equivalences that forget the monoidal or symmetric layer are provably insufficient: non-isomorphic finite groups carry equivalent representation categories as plain tensor categories \cite{corpus-74}. A classification that discards the symmetric structure is therefore false. This requirement is the discipline the series applies to every equivalence, duality, and identification it records.
   100	
   101	\subsection{Families and invariants}
   102	
   103	The series organizes mathematical structures into ten candidate families, each a full subcategory singled out by its underlying structure. Symplectic and Poisson structures represent classical mechanics. Hilbert spaces and operator algebras represent quantum mechanics. Smooth manifolds and geometric structures represent relativity. Principal bundles and connections represent gauge theories. Probability and measure-theoretic structures represent statistical physics. Topological and higher-categorical structures represent topological field theories. Dynamical systems and operator semigroups represent dissipative and open systems. Tensor categories and compositional structures represent quantum information. Discrete combinatorial structures represent lattice and network models. Derived and homotopical structures represent higher gauge and derived field theories. The families are candidates for the generating collection of the central identity, and the identity asserts that they suffice.
   104	
   105	For a theory $T$ the series records an invariant tuple
   106	\[
   107	  \mathcal{I}(T) = (\mathcal{S}_T, \mathcal{O}_T, \mathcal{D}_T, \mathcal{G}_T, \mathcal{R}_T)
   108	\]
   109	describing states, observables, dynamics, symmetries, and representations. A classifying invariant is one whose value determines the object up to the chosen equivalence. The series uses the following: a Dynkin or Satake diagram \cite{corpus-4}, a dominant integral weight \cite{corpus-5}, a dimension vector \cite{corpus-9}, a Murray-von Neumann type with Connes invariants \cite{corpus-62,corpus-64}, a homotopy class of maps to a classifying space \cite{corpus-17,corpus-18}, a fully dualizable object \cite{corpus-34,corpus-35}, a holonomy group \cite{corpus-51}, a causal class \cite{corpus-50}, a set of entropy inequalities \cite{corpus-47}, and a Fisher metric up to constant \cite{corpus-52}.
   110	
   111	\begin{table}[t]
   112	\centering
   113	\small
   114	\caption{The shared ontology of the series, grouped by role. Identifiers are the stable definition numbers of the foundational part and are reused unchanged by every later part.}
   115	\label{tab:ontology}
   116	\begin{tabularx}{\textwidth}{Y{0.55}Y{1.45}Y{1.0}}
   117	\toprule
   118	Identifiers & Content & Role in the series \\
   119	\midrule
   120	DEF-001 to DEF-007 & The category $\mathrm{Phys}$ and the five components of an object & Definitional root. No part bypasses these definitions. \\
   121	DEF-008 to DEF-014 & Five morphism kinds and the preservation law & Fixes which relationships count as arrows and how they compose. \\
   122	DEF-015 to DEF-018 & Physical equivalence, mathematical equivalence, the Yoneda qualification, and the preserved-layer requirement & Governs every identification the series makes. \\
   123	DEF-019 and DEF-020 & Admissible physical systems and the conditions that define them & Domain of the central conjecture. Theorems over this domain are stated relative to these conditions. \\
   124	DEF-021 to DEF-024 & Irreducibles, decompositions, admissible constructions, and closure & Supplies the generation operation of the central identity. \\
   125	DEF-025 to DEF-035 & The ten structural families & Candidate generating collection for the central identity. \\
   126	DEF-036 to DEF-038 & Invariant records, classifying invariants, and the Yoneda embedding & Carries the data by which objects are recognized. \\
   127	DEF-039 to DEF-042 & The classification problem, the generation statement, the conjectural identity, and the three-layer architecture & States the problem the series attacks and the architecture that separates mathematics from realization and observation. \\
   128	\bottomrule
   129	\end{tabularx}
   130	\end{table}
   131	
   132	The five components supply the bridge between the families. A cotangent bundle, a finite-dimensional operator algebra, and a principal bundle are instances of one tuple shape: each has a state space, an observable layer, a dynamics, a symmetry group, and a composition rule, and the invariant record $\mathcal{I}(T)$ reads the same five slots in every case. The families differ in what fills the slots rather than in the slots themselves, and that common shape is what makes a cross-family classification problem well posed at all.
   133	
   134	\subsection{Admissibility and constructions}
   135	
   136	\Cref{def:admissibility,def:constructions} fix the domain and the generating operations of the structural classification conjecture. The admissible subcategory restricts the classification scope to mutually compatible components, and the construction set defines the inductive closure.
   137	
   138	\begin{definition}[Admissible constructions]
   139	\label{def:constructions}
   140	The set $\mathfrak{C}$ of admissible constructions consists of the tensor product, the direct sum, extension in the group, algebra, and field-theoretic senses, limits and colimits including the thermodynamic, infinite-volume, semiclassical, and continuum limits, and factorization of a representation into factors. These are operations on objects of $\mathrm{Phys}$: each takes one or more systems and builds a new system, so each is a functor or a universal construction on the category rather than a component of any single system.
   141	\end{definition}
   142	
   143	\begin{definition}[Admissibility]
   144	\label{def:admissibility}
   145	An object $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ is admissible when the five components are mutually consistent. Explicitly: the domain of $\mathcal{D}$ is the state space $X$ and its flow preserves the observable algebra $\mathcal{O}$; the action of $\mathcal{S}$ on $X$ preserves $\mathcal{D}$; and the internal composition rule $\mathcal{C}$ is closed under composition of its own morphisms. The component $\mathcal{C}$ is internal to a single system and records how that system composes with others; the construction set $\mathfrak{C}$ of \cref{def:constructions} is external and builds new systems from old ones. The admissible objects form the full subcategory $\mathrm{Phys}_{\mathrm{adm}}$, which is closed under every construction of $\mathfrak{C}$.
   146	\end{definition}
   147	
   148	These two definitions fix the domain and the generating operation of the central conjecture. A part that uses $\mathrm{Phys}_{\mathrm{adm}}$ works relative to the conditions of \cref{def:admissibility}, and a part that decomposes a system uses the operations of \cref{def:constructions}.
   149	
   150	\section{The structural classification conjecture}
   151	
   152	\begin{conjecture}[Structural classification of admissible physical systems]
   153	\label{conj:cmrps}
   154	There exists a collection of fundamental structural families $\mathfrak{F} = \{\mathfrak{F}_\alpha\}_{\alpha \in A}$ such that
   155	\[
   156	  \mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F}_\alpha \rangle_{\mathfrak{C}},
   157	\]
   158	the right side denoting closure of the families under the admissible constructions of \cref{def:constructions}.
   159	\end{conjecture}
   160	
   161	The closure $\langle \mathfrak{F} \rangle_{\mathfrak{C}}$ is the smallest full subcategory of $\mathrm{Phys}$ that contains every $\mathfrak{F}_\alpha$ and is closed under the constructions of \cref{def:constructions}. Its objects are exactly those obtained from the families by a finite iteration of those constructions, and no object outside that inductive closure is included. The conjecture is stated for the strict reading of $\mathrm{Phys}$ described in \cref{sec:morphisms}, whose arrows are coarse-grainings, embeddings, and exact equivalences. In that reading $\simeq$ denotes an equivalence of categories in the symmetric monoidal structure given by the tensor product construction, so the equivalence preserves the composition data of $\mathcal{C}$.
   162	
   163	The conjecture is the organizing statement of the series and enters every part as a declared hypothesis or as an object of study. It carries five proof obligations, each a theorem target.
   164	
   165	Completeness requires that every admissible physical system is represented in the closure $\langle \mathfrak{F} \rangle_{\mathfrak{C}}$. Soundness requires that every generated structure satisfies the admissibility conditions of \cref{def:admissibility}. Equivalence requires that different representations of the same physical system are identified correctly, which is where the preserved-layer requirement \cite{corpus-74} constrains the choice of $\simeq$. Structural characterization requires that the fundamental families have precise mathematical definitions; the ten candidate families of \cref{tab:ontology} are named, and the admissibility conditions of \cref{def:admissibility} select among them. Decomposition requires that systems in the targeted classes can be constructed from the fundamental families by the operations of \cref{def:constructions}; restricted forms of this obligation are established for finite-dimensional $C^*$-algebras \cite{corpus-9}, amenable factors \cite{corpus-62,corpus-64}, and superselection categories \cite{corpus-12,corpus-67}.
   166	
   167	Delivering the five obligations would complete the mathematical classification layer of the architecture. It would leave physical realization and empirical selection as separate problems.
   168	
   169	\section{Composition of the twelve parts}
   170	
   171	The parts compose hierarchically. Each takes the registered definitions and the registered results of the parts before it and adds a structural layer. \Cref{tab:parts} states the contribution of each part and the dependency discipline that governs it.
   172	
   173	\begin{table}[t]
   174	\centering
   175	\small
   176	\caption{The twelve parts of the series, the structural contribution of each, and the hard prohibition that bounds its inputs.}
   177	\label{tab:parts}
   178	\begin{tabularx}{\textwidth}{Y{0.35}Y{1.15}Y{1.55}Y{0.95}}
   179	\toprule
   180	Part & Subject & Structural contribution & Hard prohibition on inputs \\
   181	\midrule
   182	I & Foundations & The category $\mathrm{Phys}$, the morphism kinds, the equivalence discipline, admissibility, irreducibility, and the central conjecture & Any theorem of the series and any claim that a universal classification exists \\
   183	II & Structural families & The invariant discipline and the ten family records & A global periodic table of all physical structures and any completeness claim for the families \\
   184	III & Irreducibility and decomposition & Existence and scope of decomposition, normal forms, admissible constructions & Unique decomposition of interacting systems and classification of general factors \\
   185	IV & Yoneda classification & Relational characterization, supermap representability, and the limits of probe-based identification & Any conclusion of classification, physical equivalence, or empirical adequacy derived from Yoneda alone \\
   186	V & Classical systems & Local symplectic classification, Poisson splitting, global symplectic invariants, and classical information geometry & An equivalence between classical and quantum families via deformation quantization \\
   187	VI & Quantum systems & Dimension-vector classification, the amenable factor list, channels and dilations, superselection categories & The Elliott program, the fusion-category structure conjecture, and classification of non-amenable factors \\
   188	VII & Gauge structures and quantum field theory & Lie theory of gauge groups, bundles, characteristic classes, anomalies as obstructions, and superselection & Four-dimensional existence as proved, the mass gap, and any conflation of the two \\
   189	VIII & Spacetime & Holonomy, the causal ladder, geometrization, the entropy cone, and reconstruction from probes & Holographic entropy relations outside their proved range and tensor-network models as evidence for duality \\
   190	IX & Gravity and information geometry & Monotone metrics, information geometry as invariant data, and the proposed gravity-information correspondence & Uniqueness of the quantum monotone metric and continuum convergence of nerve constructions \\
   191	X & Observational equivalence & Equivalence notions, preserved layers, observation functors, and distinguishability & Tensor equivalence without symmetric structure as a criterion of physical equivalence \\
   192	XI & Completeness and obstructions & The obstruction register, the regime taxonomy, and nonclassification results & The central conjecture as established and any uniform procedure in wild or undecidable sectors \\
   193	XII & Principia Physica & The three-layer assembly of mathematical classification, physical realization, and empirical selection & Physical validation of the architecture and collapse of the three layers \\
   194	\bottomrule
   195	\end{tabularx}
   196	\end{table}
   197	
   198	\subsection{The dependency graph}
   199	
   200	The series organizes as a directed acyclic graph rooted at the foundational ontology of Part~I and terminating at the assembly sink of Part~XII, drawn in \cref{fig:deps}. Every part has a directed path to Part~XII, which takes registered inputs from all eleven earlier parts. No part bypasses the primitive ontology of Part~I, and no part may cite a later one. A part may cite earlier parts for definitions and for registered results only, and no part may introduce an unproved result as a lemma.
   201	
   202	\begin{figure}[t]
   203	\centering
   204	\caption{The permitted dependency edges among the twelve parts. Part~I is the definitional root, Part~XII is the assembly sink and takes registered inputs from all eleven earlier parts, and every edge carries the registered hypotheses of \cref{tab:deps}.}
   205	\label{fig:deps}
   206	\begin{tikzpicture}[font=\small,
   207	  bx/.style={draw, rounded corners=2pt, inner sep=2.5pt, minimum width=8mm, minimum height=5.5mm},
   208	  ar/.style={->, thick}]
   209	\node[bx] (I)    at (0.0, 2.6) {I};
   210	\node[bx] (II)   at (1.7, 2.6) {II};
   211	\node[bx] (III)  at (3.4, 2.6) {III};
   212	\node[bx] (V)    at (5.1, 3.4) {V};
   213	\node[bx] (VI)   at (5.1, 1.8) {VI};
   214	\node[bx] (VII)  at (6.8, 3.4) {VII};
   215	\node[bx] (VIII) at (6.8, 1.8) {VIII};
   216	\node[bx] (IX)   at (8.5, 2.6) {IX};
   217	\node[bx] (IV)   at (1.7, 0.8) {IV};
   218	\node[bx] (X)    at (5.1, 0.1) {X};
   219	\node[bx] (XI)   at (1.7,-1.3) {XI};
   220	\node[bx] (XII)  at (8.5,-1.3) {XII};
   221	\draw[ar] (I) -- (II);
   222	\draw[ar] (II) -- (III);
   223	\draw[ar] (III) -- (V);
   224	\draw[ar] (III) -- (VI);
   225	\draw[ar] (V) -- (VII);
   226	\draw[ar] (VI) -- (VIII);
   227	\draw[ar] (VII) -- (IX);
   228	\draw[ar] (VIII) -- (IX);
   229	\draw[ar] (I) -- (IV);
   230	\draw[ar] (IV) -- (III);
   231	\draw[ar] (IV) -- (V);
   232	\draw[ar] (IV) -- (VI);
   233	\draw[ar] (IV) -- (X);
   234	\draw[ar] (X) -- (IX);
   235	\draw[ar] (I) -- (XI);
   236	\draw[ar] (IX) -- (XII);
   237	\draw[ar] (X) -- (XII);
   238	\draw[ar] (XI) -- (XII);
   239	\end{tikzpicture}
   240	\end{figure}
   241	
   242	\subsection{Registered dependency records}
   243	
   244	Each permitted use of a registered result as an input to another part is recorded with its condition. A use is direct when the supplying result is a completed theorem in the literature, and a use is as hypothesis when the supplying statement is a conjecture, an open problem, or a conditional record. The series registers eight such uses, and each carries a constraint on how the supplying result may be used. \Cref{tab:deps} states the eight and their constraints.
   245	
   246	\begin{table}[t]
   247	\centering
   248	\small
   249	\caption{The registered dependency records of the series. Each row states a permitted use of a registered result and the constraint that use carries.}
   250	\label{tab:deps}
   251	\begin{tabularx}{\textwidth}{Y{0.62}Y{0.95}Y{1.03}Y{1.4}}
   252	\toprule
   253	Supplying result & Consuming parts & Condition & Rule enforced \\
   254	\midrule
   255	Finite-dimensional $C^*$-algebra decomposition \cite{corpus-9} & III, VI & Direct & Decomposition by dimension vector is the first concrete theorem model of the series. \\
   256	Darboux normal form and Weinstein splitting \cite{corpus-6,corpus-68} & V & Direct & Symplectic classification content is global and topological rather than local. \\
   257	Doplicher-Roberts and Deligne \cite{corpus-12,corpus-13,corpus-67} & VI, VII & Direct, under the stated hypotheses & The symmetric structure, conjugates, and $\mathrm{End}(\mathbf{1})=\mathbb{C}$ are declared with the use. \\
   258	The structural classification conjecture & XI, XII & As hypothesis only & The conjecture enters as a declared hypothesis and never as a lemma. \\
   259	The four-dimensional mass gap & VII & As an open problem & Existence and mass gap are never conflated. \\
   260	The McDuff obstruction \cite{corpus-65} & VI, XI & Direct & No global factor classification may enter any part as a dependency. \\
   261	The isocategorical counterexample \cite{corpus-74} & IV, X & Direct & Every equivalence record must declare the structure it preserves. \\
   262	Chentsov and Petz-Sudar \cite{corpus-52} & IX, X & Direct & Quantum monotone metrics are parametric, and uniqueness may not be extended by dependency. \\
   263	\bottomrule
   264	\end{tabularx}
   265	\end{table}
   266	
   267	The series prohibits unproved statements from serving as proved dependencies. Unproved results enter the dependency structure exclusively as registered conjectures, as explicit hypotheses of conditional records, or as objects of study in Part~XI.
   268	
   269	\section{Classification regimes}
   270	
   271	The classification content of the series sorts by the kind of data that classifies. The regimes below are the ones the twelve parts jointly establish, and they are the ones the periodic table of mathematical physics records.
   272	
   273	\subsection{Complete invariants}
   274	
   275	A sector carries a complete classification when a theorem classifies its objects up to the chosen equivalence and the classifying invariant is finite or explicitly parameterized. The objects classified in each entry of \cref{tab:complete} are the objects named in the sector column, and the scope column states the equivalence relation in force.
   276	
   277	\begin{table}[t]
   278	\centering
   279	\small
   280	\caption{Sectors carrying a complete classification. Each entry names the classifying invariant and the scope in which the classification statement holds.}
   281	\label{tab:complete}
   282	\begin{tabularx}{\textwidth}{Y{0.95}Y{1.10}Y{0.95}}
   283	\toprule
   284	Sector & Classifying invariant & Scope of the classification \\
   285	\midrule
   286	Finite simple groups \cite{corpus-1,corpus-3} & Order, character table, Schur multiplier, and outer automorphism group & Up to isomorphism, as families together with the sporadic groups. A uniform parameterization is not known. \\
   287	Complex semisimple Lie algebras \cite{corpus-4} & Dynkin diagram & Up to isomorphism. Real simple algebras are classified by Satake diagrams, and a real semisimple algebra is a direct sum of simple ideals. \\
   288	Irreducible representations of semisimple Lie algebras \cite{corpus-5} & Dominant integral weight & Finite-dimensional irreducibles up to isomorphism. \\
   289	Symplectic manifolds, locally \cite{corpus-6} & Dimension $2n$, and no invariant beyond dimension & Local germs up to symplectomorphism. Darboux normal form removes every local invariant beyond dimension, so all further classification content is global. \\
   290	Poisson manifolds, locally \cite{corpus-68} & Weinstein splitting and symplectic-leaf foliation & Local models near a point of rank $2k$, with global leaf structure. \\
   291	Finite-dimensional $C^*$-algebras \cite{corpus-9} & Dimension vector & Unital finite-dimensional complex algebras up to $*$-isomorphism. \\
   292	Amenable factors \cite{corpus-62,corpus-64} & Murray-von Neumann type and Connes invariants & Types $\mathrm{I}_n$, $\mathrm{I}_\infty$, $\mathrm{II}_1$, $\mathrm{II}_\infty$, and $\mathrm{III}_\lambda$ up to isomorphism. \\
   293	Principal $G$-bundles \cite{corpus-17,corpus-18} & Homotopy class of maps to $BG$, with characteristic classes & Bundles over a base space up to isomorphism. \\
   294	Superselection sectors \cite{corpus-12,corpus-16,corpus-67} & Compact supergroup, unique up to isomorphism & Sectors meeting the Doplicher-Roberts criteria. \\
   295	Symmetric tensor categories of subexponential growth \cite{corpus-13} & Supergroup representation category & Characteristic-zero categories under the stated growth hypothesis. \\
   296	Connected Lorentzian holonomy groups \cite{corpus-51} & Holonomy group & Connected holonomy groups of irreducible and indecomposable Lorentzian structures in signature $(1,n-1)$, with realizing metrics constructed. A local and algebraic classification rather than a classification of Lorentzian manifolds up to isometry. \\
   297	Causality conditions \cite{corpus-50} & Position on the causal ladder & The causality conditions themselves, up to the implication order of the ladder. The rung is a property of a spacetime and does not classify metrics up to isometry. \\
   298	Closed three-manifolds \cite{corpus-60,corpus-70} & Thurston geometry type & Up to homeomorphism, as exactly eight model geometries. \\
   299	Monotone metrics, classical \cite{corpus-52} & Fisher metric up to constant & Metrics monotone under stochastic maps. \\
   300	Holographic entropy relations, five regions and fewer \cite{corpus-47,corpus-73} & Extreme rays of the entropy cone & Two, three, and four regions from subadditivity and monogamy of mutual information, and five regions from a complete graph construction. \\
   301	\bottomrule
   302	\end{tabularx}
   303	\end{table}
   304	
   305	Classification theorems and parameterization schemes are different achievements across the surveyed sectors. The finite simple groups admit an exhaustive classification without a uniform parameterization, so practical identification runs through companion data of the ATLAS kind \cite{corpus-3}. Classification invariants can also be purely global: Darboux normal form removes every local symplectic invariant beyond dimension \cite{corpus-6}, which forces symplectic classification into the global topological regime, the opposite of the Riemannian situation where curvature supplies rich local data.
   306	
   307	\subsection{Parameterized and normal-form results}
   308	
   309	Some sectors admit a parameterized answer rather than a finite list. Monotone metrics on quantum state spaces are classified by operator monotone functions through the Morozova-Chentsov construction \cite{corpus-52}: the answer is a family indexed by a function, and no member of the family is distinguished among all monotone metrics. Every fusion category is the representation category of a weak Hopf algebra \cite{corpus-75}, and the additional structure that supplies canonical traces is the subject of a conjecture of Etingof, Nikshych, and Ostrik \cite{corpus-14}. Every finite-dimensional algebra over an algebraically closed field is derived-tame or derived-wild \cite{corpus-55}, a dichotomy that sorts the field without classifying either side.
   310	
   311	Other sectors carry a normal form rather than an isomorphism classification. Completely positive maps are classified up to minimal Stinespring dilation, unique up to unitary \cite{corpus-10}, and the Choi-Kraus form is a normal form whose Kraus rank is an invariant of the form \cite{corpus-11}. The series treats this data as a normal form and not as an isomorphism classification of channels.
   312	
   313	\subsection{The regime taxonomy}
   314	
   315	Part XI sorts the surveyed domains by the kind of achievement each represents, and the sort is stable across the twelve parts: a domain keeps its regime when a different part studies it. Seven regimes cover the surveyed domains.
   316	
   317	\begin{description}
   318	\item[Complete finite invariant.] A theorem classifies the objects up to the chosen equivalence and the classifying invariant takes finitely many values or is a finite combinatorial datum. The Killing-Cartan classification and the dimension-vector classification live here.
   319	\item[Complete parameterized invariant.] A theorem classifies the objects and the invariant ranges over an explicitly described family. The Petz-Sudar classification of monotone metrics lives here.
   320	\item[Normal form.] A canonical form exists with a stated uniqueness, and the form is not an isomorphism classification of the objects. Stinespring dilation and the Choi-Kraus form live here.
   321	\item[Obstruction classification.] A theorem classifies the obstruction to a property rather than the objects. Anomaly classes live here.
   322	\item[Open regime.] Partial or parametric results exist and no completeness statement is available. Fusion categories and the Elliott program live here.
   323	\item[Claimed regime.] A result has been announced and its supporting artifacts are not publicly checkable. The four-dimensional existence announcement lives here.
   324	\item[Impossibility regime.] A theorem forbids classification of the stated kind. The McDuff obstruction, wildness, and four-manifold unrecognizability live here.
   325	\end{description}
   326	
   327	The taxonomy records boundaries as well as contents. Tame and wild separates the algorithmically tractable domains from the intractable ones \cite{corpus-57}, and dimension three separates from dimension four by the presence of a finite geometry table on one side and unrecognizable manifolds on the other \cite{corpus-54,corpus-60}. Those two boundaries are the ones the regime sort reproduces most sharply.
   328	
   329	\subsection{The periodic table}
   330	
   331	The chart that assembles these regimes is the periodic table of mathematical physics, and \cref{tab:periodic} states its six regions. A periodic table must mark where no table exists, so the sixth region is as much content as the first.
   332	
   333	\begin{table}[t]
   334	\centering
   335	\small
   336	\caption{The periodic table of mathematical physics in six regions. Each region names the content it charts and the mathematical status of that content.}
   337	\label{tab:periodic}
   338	\begin{tabularx}{\textwidth}{Y{0.62}Y{1.38}Y{1.0}}
   339	\toprule
   340	Region & Content & Status of the content \\
   341	\midrule
   342	Families and invariants & The ten structural families with their defining invariants and the regime each occupies & Invariants are finite or parameterized where classification is complete \\
   343	Exceptional structures & The sporadic simple groups \cite{corpus-1,corpus-3}, the exceptional Lie algebras and their real forms \cite{corpus-4}, the amenable type $\mathrm{III}_0$ and $\mathrm{III}_1$ factors \cite{corpus-64}, the eight Thurston geometries \cite{corpus-60}, the isocategorical group pairs \cite{corpus-74} & Each is proved to exist and to be exhaustive in its own domain \\
   344	Reconstruction relationships & Gelfand-Neumark, Gelfand and Stone duality, Doplicher-Roberts, Deligne, Stinespring, the classifying-space construction \cite{corpus-42,corpus-43,corpus-44,corpus-12,corpus-13,corpus-10,corpus-17,corpus-18} & Each holds under the hypotheses stated in \cref{tab:reconstruction} \\
   345	Equivalences and dualities & The identifications the series records, each with the structure it preserves & The preserved layer is named in every entry, and the isocategorical counterexample \cite{corpus-74} records what follows from not naming it \\
   346	Open classification problems & Fusion categories \cite{corpus-14}, the Elliott program \cite{corpus-8}, the holographic entropy cone from six regions \cite{corpus-47}, the four-dimensional mass gap \cite{corpus-23} & Partial and parametric results are on record and no completeness statement is available \\
   347	Obstructions & Adyan-Rabin \cite{corpus-53}, McDuff \cite{corpus-65}, wildness \cite{corpus-55,corpus-56,corpus-58}, tame and wild \cite{corpus-57}, countable invariants \cite{corpus-59}, dimension four \cite{corpus-54}, Etingof-Gelaki \cite{corpus-74} & Each is a theorem forbidding a classification of the stated kind \\
   348	\bottomrule
   349	\end{tabularx}
   350	\end{table}
   351	
   352	The existence of a finite list of exceptional objects in the finite-simple-group template does not transfer to physical theories in general, and the second region records the exceptions the mathematics actually supplies rather than a list the program expects to close. Reading the six regions together gives the summary of the series in one chart: families with invariants, exceptions the invariants must catch, recoveries from probes, identifications with declared scope, open problems, and proved limits.
   353	
   354	\subsection{Sectors outside a finite list}
   355	
   356	Three sectors sit outside any finite classification in their stated generality. General type $\mathrm{II}_1$ and type $\mathrm{III}$ factors carry coarse Connes-spectrum strata and vary in their fundamental groups \cite{corpus-8}. Extended topological quantum field theories are classified by fully dualizable objects \cite{corpus-34}, in a 2009 statement whose proof is an informal sketch \cite{corpus-35}, so the exact range of completed cases is a research question. The four-dimensional Yang-Mills existence problem is the subject of an announced result whose manuscript and formalization are withheld \cite{corpus-24,corpus-25}, and the mass gap is a separate open problem \cite{corpus-23}. The series records the existence claim and the mass gap separately and never merges them.
   357	
   358	\section{Equivalence and preserved structure}
   359	
   360	Every equivalence in the series names the structure it preserves, and the reason is a theorem rather than a preference.
   361	
   362	\subsection{The preserved-layer requirement}
   363	
   364	Two finite groups that are not isomorphic can carry equivalent representation categories as plain tensor categories \cite{corpus-74}. The equivalence is monoidal and does not respect the commutativity constraint, so the symmetric braiding is the layer it fails to preserve. Any criterion of identification that discards the monoidal or symmetric layer therefore identifies distinct groups. The series adopts the resulting requirement: an equivalence used to identify systems must state which layer of structure it preserves, and an equivalence that forgets the symmetric layer is rejected as a criterion.
   365	
   366	The requirement is constructive as well as negative. The Doplicher-Roberts equivalence takes a symmetric tensor $*$-category with conjugates, direct sums, subobjects, and $\mathrm{End}(\mathbf{1})=\mathbb{C}$ to the finite-dimensional unitary representations of a compact supergroup, unique up to isomorphism \cite{corpus-12,corpus-67}. Deligne's theorem takes a characteristic-zero symmetric tensor category of subexponential growth to a supergroup representation category \cite{corpus-13}. Both statements preserve the symmetric structure and both state their hypotheses in full. Müger's Galois theory for braided tensor categories recovers fixed-point data together with additional information that the braided structure alone does not supply \cite{corpus-21}.
   367	
   368	\subsection{Duality and the recovered data}
   369	
   370	Duality exchanges structure between differently presented theories, and each duality in the series states what the exchange recovers. Gelfand duality sends a commutative $C^*$-algebra to a compact Hausdorff space \cite{corpus-43}. Stone duality sends a Boolean algebra to a zero-dimensional compact spectrum \cite{corpus-44}. The classifying-space construction sends a principal $G$-bundle to a homotopy class of maps to $BG$, with characteristic classes as pullbacks of universal classes \cite{corpus-17,corpus-18}. The Yoneda embedding sends an object to its functor of relationships and is faithful as mathematics; the constraint that it does not by itself establish physical equivalence, empirical adequacy, or a classification theorem governs every use of it in the series.
   371	
   372	A duality is not automatically a physical equivalence. The series keeps the two apart: an identification of representations is a mathematical statement, and an identification of physical content requires its own definition and justification. The proposed gravity-information correspondence is a case in point. Ryu-Takayanagi relations are verified exactly in anti-de Sitter space in three dimensions with a two-dimensional conformal field theory dual \cite{corpus-45}, entanglement-wedge reconstruction holds as a physical dictionary result under the semiclassical AdS/CFT assumptions \cite{corpus-46}, and tensor-network models are toys rather than evidence for the duality itself \cite{corpus-48}. The series states each of these at the strength the source supports.
   373	
   374	\subsection{Observation and distinguishability}
   375	
   376	Observation functors formalize what an empirical procedure can separate. Applied to a pair of systems they induce an equivalence relation: systems are observationally equivalent relative to the procedure when no observation in its range separates them. The induced relation is coarse when the functor forgets detail and fine when it resolves it, and it behaves well under composition of procedures.
   377	
   378	The metric content of distinguishability diverges between the classical and quantum cases. On a classical probability simplex the Fisher information metric is the unique Riemannian metric monotone under stochastic transitions up to a positive constant \cite{corpus-52}. On quantum state spaces the monotone metrics form a family parameterized by operator monotone functions, and no member of that family is distinguished \cite{corpus-52}. The series treats the classical uniqueness as the anchor and the quantum parameterization as the reality, and it does not extend uniqueness across the gap between them.
   379	
   380	Mathematical isomorphism and observational indistinguishability are different relations. A mathematical classification would not by itself select a theory empirically, and several mathematically distinct theories produce identical predictions in an experimentally accessible regime. The three-layer architecture of the assembly keeps mathematical classification, physical realization, and empirical selection as separate maps, and no part of the series collapses them.
   381	
   382	\section{Reconstruction from probes}
   383	
   384	Reconstruction theorems recover an object from a category of probes. They are the pattern the series finds better developed than classification, and each carries hypotheses that cannot be dropped. The theorems on record and their hypotheses appear in \cref{tab:reconstruction}.
   385	
   386	\begin{table}[t]
   387	\centering
   388	\small
   389	\caption{Reconstruction theorems on record. Each row names the object recovered, the probe data it is recovered from, and the hypotheses the statement requires.}
   390	\label{tab:reconstruction}
   391	\begin{tabularx}{\textwidth}{Y{0.90}Y{1.05}Y{1.05}}
   392	\toprule
   393	Theorem & Recovers & From and under which hypotheses \\
   394	\midrule
   395	Gelfand-Neumark \cite{corpus-42} & A concrete representation in $B(H)$ & An abstract $C^*$-algebra, as a closed $*$-subalgebra of $B(H)$. A representation theorem; the classification statement it yields is the Gelfand duality of the commutative case. \\
   396	Gelfand duality \cite{corpus-43} & A compact Hausdorff space & A commutative $C^*$-algebra. The commutative side only. \\
   397	Stone duality \cite{corpus-44} & A zero-dimensional compact spectrum & A Boolean algebra. The Boolean side only. \\
   398	Doplicher-Roberts \cite{corpus-12,corpus-67} & A compact supergroup, unique up to isomorphism & A symmetric tensor $*$-category with conjugates, direct sums, subobjects, $\mathrm{End}(\mathbf{1})=\mathbb{C}$, and a symmetric braiding whose square is the identity on each object. \\
   399	Deligne \cite{corpus-13} & A supergroup representation category & A characteristic-zero symmetric tensor category of subexponential growth. \\
   400	Stinespring \cite{corpus-10} & A minimal dilation, unique up to unitary & A completely positive map. A normal form, and not an isomorphism classification of channels. \\
   401	Classifying-space construction \cite{corpus-17,corpus-18} & A principal $G$-bundle & A homotopy class of maps to $BG$. Homotopy-classified, with characteristic classes as pullbacks. \\
   402	Supermap representability \cite{corpus-40,corpus-41} & A concrete representation of categorical supermaps & A theory with suitable channel-state duality. Unification with the Gelfand and Stone pattern is a research question. \\
   403	Entanglement-wedge reconstruction \cite{corpus-46} & Bulk operators inside the entanglement wedge & A physical dictionary reconstruction under the semiclassical AdS/CFT assumptions, stated as a quantum-information theorem with its hypotheses. Not an axiomatic reconstruction in the sense of the preceding rows. \\
   404	\bottomrule
   405	\end{tabularx}
   406	\end{table}
   407	
   408	Reconstruction theorems fail when the probe category loses the hypotheses that carry the determination. The Doplicher-Roberts recovery of a compact supergroup collapses without the symmetric braiding, as non-isomorphic groups with equivalent plain tensor categories show \cite{corpus-74}. Deligne's classification fails without the subexponential growth condition on categorical dimensions \cite{corpus-13}. Gelfand duality ceases to recover a topological spectrum once commutativity is dropped \cite{corpus-43}. Each hypothesis is therefore a boundary of the theorem rather than a technical convenience.
   409	
   410	Whether the 2024 to 2026 supermap-representability line \cite{corpus-40,corpus-41} unifies with the Gelfand, Stone, and Naimark pattern into a single relational principle is a research question. The series records the proved representability results at their stated strength and leaves the unification open.
   411	
   412	\section{Obstruction theorems}
   413	
   414	Obstruction theorems prove that no classification of a stated kind can exist in a stated generality. They are content of the series, and they are what a periodic table must mark in the places where no table exists. The register appears in \cref{tab:obstructions}.
   415	
   416	\begin{table}[t]
   417	\centering
   418	\small
   419	\caption{The obstruction register of the series. Each theorem is a proved statement about the limits of classification in its regime.}
   420	\label{tab:obstructions}
   421	\begin{tabularx}{\textwidth}{Y{0.85}Y{1.10}Y{1.05}}
   422	\toprule
   423	Theorem & Statement & Consequence for classification \\
   424	\midrule
   425	McDuff \cite{corpus-65} & Uncountably many non-isomorphic separable type $\mathrm{II}_1$ factors exist & No total classification of factors outside the amenable case. \\
   426	Etingof-Gelaki \cite{corpus-74} & Non-isomorphic finite groups carry equivalent plain tensor representation categories & Equivalence notions that discard the monoidal or symmetric layer do not determine the group. \\
   427	Adyan-Rabin \cite{corpus-53} & Every Markov property of finitely presentable groups is algorithmically undecidable, including finiteness and simplicity & No uniform recognition procedure for group-flavored sectors. \\
   428	Wildness \cite{corpus-55,corpus-56,corpus-58} & Wild representation categories admit no finite-dimensional-variety parameterization, and wildness is preserved under degeneration & No finite-variety parameterization of wild representation categories. \\
   429	Tame and wild tractability \cite{corpus-57} & Group isomorphism is polynomial-time for tame extensions, and the required bounds fail in the wild case & Tame and wild separates algorithmically tractable from intractable regimes. \\
   430	Countable invariants \cite{corpus-59} & Von Neumann algebra isomorphism admits no classification by countable invariants & No classification of von Neumann algebras by a countable list of invariants. \\
   431	Dimension four \cite{corpus-54} & Deciding whether an arbitrary triangulated four-manifold is homeomorphic to the connected sum $\#_9(S^2 \times S^2)$ is algorithmically undecidable & No effective classification of four-manifolds in general. The construction is in the lineage of Markov's unrecognizable four-manifolds and improves the previous bound $\#_{12}$. \\
   432	\bottomrule
   433	\end{tabularx}
   434	\end{table}
   435	
   436	\subsection{Dimension three and dimension four}
   437	
   438	The clearest scope contrast in the series is dimensional. Closed three-manifolds decompose into exactly eight Thurston geometries \cite{corpus-60,corpus-70}, a finite table with a complete decomposition theorem behind it. In dimension four the model geometries are countably infinite in one family \cite{corpus-60}, only restricted classes decompose, and homeomorphism of a specific four-manifold is algorithmically unrecognizable \cite{corpus-54}. Finite classification tables exist in tame regimes and stop at the dimension where unrecognizability begins. The series states the contrast as a scope boundary and builds its regime taxonomy around it.
   439	
   440	\subsection{Scope effects}
   441	
   442	Each obstruction removes a possibility rather than adding a difficulty. The McDuff construction \cite{corpus-65} leaves the amenable classification intact and closes the non-amenable case. The isocategorical construction \cite{corpus-74} leaves the symmetric theory intact and closes the plain tensor case. The Adyan-Rabin results \cite{corpus-53} close uniform recognition while leaving individual presentations decidable. The wildness theorems \cite{corpus-55,corpus-56,corpus-58} close finite-variety parameterization while leaving the tame side open to classification. Reading the register this way is what allows a classification program to state restricted-class theorems with explicit scope instead of promising a single global table.
   443	
   444	\section{Worked examples}
   445	
   446	Three systems trace the shared framework end to end. Each is an object of the category, each carries an invariant record, and each sits in a regime of the taxonomy.
   447	
   448	\subsection{A finite-dimensional quantum system}
   449	
   450	Take a finite-dimensional quantum system whose observable algebra is a unital finite-dimensional complex $C^*$-algebra. The five components of the representation are immediate: the state space is the set of density operators on the underlying Hilbert space, the observable layer is the algebra $A$, the dynamics is a one-parameter group of $*$-automorphisms, the symmetry data is the group of automorphisms that preserve the dynamics, and the composition rule is the minimal tensor product of algebras.
   451	
   452	The algebra decomposes as
   453	\[
   454	  A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C}),
   455	\]
   456	and the multiset of matrix sizes is the dimension vector. Two such algebras are $*$-isomorphic exactly when their dimension vectors agree \cite{corpus-9}. The dimension vector is therefore a classifying invariant of regime one, and it is finite data. Irreducibility is relative to the composition rule: the simple blocks $M_{n_i}(\mathbb{C})$ are the irreducible objects under direct sum, and the decomposition into blocks is unique up to order.
   457	
   458	Morphisms between such systems are $*$-homomorphisms, and the equivalence that identifies representations is $*$-isomorphism, which preserves the full algebra structure. Channels between systems are completely positive maps; Stinespring dilation classifies them up to minimal dilation and unitary freedom \cite{corpus-10}, and the Kraus rank is an invariant of the normal form \cite{corpus-11}. The example therefore exercises the invariant discipline, the decomposition discipline, and the normal-form regime at once.
   459	
   460	\subsection{A classical mechanical system}
   461	
   462	Take a cotangent bundle $T^*Q$ with its canonical symplectic form. The state space is the symplectic manifold, the observable layer is the algebra of smooth functions with the Poisson bracket, the dynamics is a Hamiltonian vector field, the symmetry data is the group of canonical transformations preserving the Hamiltonian, and the composition rule is the product of symplectic manifolds.
   463	
   464	Darboux normal form shows that all symplectic manifolds of the same dimension are locally symplectomorphic \cite{corpus-6}. Local classification content on the symplectic side is therefore empty, and every invariant is global: the topology of the symplectic form, the Chern classes of the prequantum data, and the coadjoint orbits in the dual of a Lie algebra \cite{corpus-68}. The example shows why the local and global regimes must be separated in the taxonomy. A Poisson manifold splits near a point of rank $2k$ as a symplectic factor times a transverse Poisson factor \cite{corpus-68}, which is the local model the classification uses.
   465	
   466	For a statistical mechanical system the state space is a probability simplex and the invariant data is the Fisher metric, unique up to constant among metrics monotone under stochastic maps \cite{corpus-52}. The classical uniqueness is the anchor for the observational layer, and the quantum analogue is parameterized rather than unique.
   467	
   468	\subsection{A gauge theory}
   469	
   470	Take a principal $G$-bundle $P$ over a base space $X$ with a connection. The state space is the space of connections modulo gauge, the observable layer is the algebra of gauge-invariant functions, the dynamics is the Yang-Mills or Chern-Simons flow, the symmetry data is the gauge group, and the composition rule is the fiber product of bundles.
   471	
   472	Isomorphism classes of principal $G$-bundles over $X$ are homotopy classes of maps from $X$ to the classifying space $BG$ \cite{corpus-17,corpus-18}, and the characteristic classes are pullbacks of universal classes in the cohomology of $BG$. The classification is therefore complete and homotopy-theoretic. Anomalies are classified as obstruction classes in the Chevalley-Eilenberg cohomology of the gauge algebra \cite{corpus-19}: quantization exists exactly when the relevant classes vanish. Superselection sectors of the associated quantum field theory form a symmetric tensor $*$-category, and the Doplicher-Roberts theorem recovers the compact gauge group from that category under its stated hypotheses \cite{corpus-12,corpus-67}.
   473	
   474	The example is the one place in the series where the classification layer, the obstruction layer, and the reconstruction layer all appear in a single system. It also shows the load-bearing character of the preserved-layer requirement: the recovery of the gauge group uses the symmetric structure of the sector category, and discarding that structure admits the isocategorical counterexamples \cite{corpus-74}.
   475	
   476	\section{Emergent structure}
   477	
   478	The twelve parts jointly establish several findings that no single part establishes alone. They are the emergent content of the composition.
   479	
   480	A scope law holds across the aggregate. Complete invariants concentrate where the invariant is finite or explicitly parameterized, and beyond that boundary the series records either a parameterized family or an obstruction theorem. The law is visible only in the aggregate: individual parts classify their own sectors, and the obstruction register appears as a separate part, while the correspondence between the two is a property of the whole.
   481	
   482	An asymmetry separates reconstruction from classification. Reconstruction theorems recur across the series, each recovering an object from probes, and each under hypotheses that cannot be dropped. Complete classifications recur much less often and never outside finite or parametric regimes. The asymmetry is a structural feature of the subject matter rather than an artifact of the survey: the probe categories that reconstruction uses are richer invariants than the finite data that classification needs.
   483	
   484	A preserved-layer law governs the equivalence content. Every equivalence, duality, and identification the series records either states the structure it preserves or records the failure that follows from not stating it. The negative theorem of Etingof and Gelaki \cite{corpus-74} is the reason, and the discipline is uniform across all twelve parts.
   485	
   486	A layer separation holds in the architecture. Mathematical classification, physical realization, and empirical selection are three maps with different domains and codomains. A complete mathematical classification would leave realization and selection unconstrained, because the latter two apply maps that classification does not compute. The separation is stated in the foundational part, instantiated in the observational-equivalence part, and preserved in the assembly part.
   487	
   488	These findings fix the scope of any answer to the program's question. Structural classification of physical systems is realizable as restricted-class classification theorems stated with their invariants and explicit scope, bounded by obstruction theorems that mark where no table exists. Complete classifications succeed where the classifying data reduce to finite invariants or tame parameterizations. Algorithmic undecidability in four-manifold topology and wild representation type rule out a single global table.
   489	
   490	\subsection{Contrasts the series maintains}
   491	
   492	Several pairs of results pull against each other, and the series keeps each pair apart rather than resolving it prematurely.
   493	
   494	Classification and reconstruction are different achievements. Classification is sharp where the invariant is finite or parametric, and reconstruction routinely recovers an object from probes \cite{corpus-42,corpus-43,corpus-44,corpus-12,corpus-13}. The parts that study the two do not merge them.
   495	
   496	Local and global classification content differ by subject. Darboux normal form empties the local symplectic invariant theory \cite{corpus-6}, and Riemannian curvature supplies rich local data. Symplectic classification is therefore global, and the series states the difference as a property of the subject.
   497	
   498	Classical uniqueness and quantum parameterization do not match. The Fisher metric is unique up to constant in the classical case \cite{corpus-52}, and the quantum monotone metrics form a family indexed by operator monotone functions. No part of the series extends the classical uniqueness across that gap.
   499	
   500	Relational determination and physical equivalence do not coincide. The Yoneda embedding determines an object by its relationships, and the qualification attached to every use of it records that physical equivalence, empirical adequacy, and classification do not follow from that determination alone.
   501	
   502	Claim density and claim status are different things. The constructive quantum field theory frontier carries several announced results \cite{corpus-24,corpus-25}, and the series records each at the strength of its publicly checkable evidence, keeping existence and the mass gap separate \cite{corpus-23}.
   503	
   504	Mathematical consistency and empirical selection are different layers. A consistency proof settles the first and leaves the second open, because the empirical layer applies an observation map that mathematical classification does not compute.
   505	
   506	\section{Cross-volume consistency}
   507	
   508	The twelve parts maintain uniform definition identifiers, respect the directed dependency discipline, and enforce the preserved-layer constraint throughout. Eight consistency checks hold across the corpus, seven without qualification and one after a scope correction.
   509	
   510	\begin{description}
   511	\item[Ontology identity.] The forty-two definition identifiers are used with one meaning across all twelve parts, and later parts extend the list only by appending new identifiers.
   512	\item[Definitional root.] Every part works in the ontology of Part~I, and no part redefines an object that Part~I owns.
   513	\item[Dependency discipline.] Every cross-part use of a registered result is a permitted edge of \cref{fig:deps}, and unproven statements enter only as declared hypotheses or as objects of study.
   514	\item[Yoneda qualification.] The constraint on Yoneda-based arguments appears in the same wording in every part that uses Yoneda methods.
   515	\item[Preserved-layer requirement.] Every equivalence and duality recorded across the series names the structure it preserves or records the failure of recovery.
   516	\item[Notation.] The five-component tuple, the invariant record, and the closure notation are used in one form throughout.
   517	\item[Existence and mass gap.] The announced four-dimensional existence result and the mass gap problem are recorded as separate items in every part that mentions them.
   518	\item[Entropy cone range.] The holographic entropy cone is completely characterized for five boundary regions and fewer \cite{corpus-47,corpus-73}, and the open range begins at six regions. This entry is the correction.
   519	\end{description}
   520	
   521	Four of these findings are load-bearing for the series as a whole. The definitional root is what makes the twelve parts one program rather than twelve adjacent papers: a definition introduced in Part~I has one meaning everywhere. The dependency discipline is what makes the composition honest: a part that needs an unproven statement declares it as a hypothesis instead of using it as a lemma. The preserved-layer requirement is what makes the equivalence content of the series correct rather than merely plausible: the counterexample of Etingof and Gelaki \cite{corpus-74} rules out the weaker discipline by theorem. The separation of existence from mass gap is what keeps the constructive quantum field theory material accurate \cite{corpus-23,corpus-24,corpus-25}.
   522	
   523	The corrected entry concerns the holographic entropy cone. The cone for five boundary regions is completely characterized: the cone defined by all proven inequalities admits graph models for every extreme ray orbit, which settles the existence of further five-party inequalities in the negative \cite{corpus-73}. The statement that the cone is open from five regions onward has been replaced by the correct range, which begins at six regions \cite{corpus-47}, and the periodic table of \cref{tab:periodic} records the corrected range.
   524	
   525	\section{Conclusion}
   526	
   527	The structural picture of the series is a classification program with a stated scope. One ontology of forty-two definitions organizes the objects, morphisms, equivalences, families, and invariants. One dependency graph composes the twelve parts. One equivalence requirement forces every identification to name the structure it preserves. Around the central conjecture, the mathematical content sorts into regimes with complete invariants, regimes with parameterized or normal-form answers, and regimes where obstruction theorems prove that no classification of the stated kind exists.
   528	
   529	The regime structure is the durable finding. Complete invariants appear where the invariant is finite or explicitly parameterized. Reconstruction from probes is better developed than classification and carries hypotheses that cannot be dropped. Obstruction theorems mark a sharp scope boundary: dimension three admits a finite table of geometries and dimension four contains unrecognizable manifolds, the amenable factors are classified and the general type $\mathrm{II}_1$ factors are not, the symmetric tensor categories of subexponential growth are classified and the plain tensor categories do not determine their groups.
   530	
   531	The central conjecture states the program's theorem target and carries the five obligations that would discharge it. Restricted forms of the decomposition obligation are established in the sectors where complete invariants exist. The remaining obligations are the research program.
   532	
   533	\begin{thebibliography}{54}
   534	\bibitem{corpus-9} G. J. Murphy, $C^*$-algebras and operator theory, Academic Press (1990). ISBN 978-0-12-511360-1.
   535	
   536	\bibitem{corpus-4} J. E. Humphreys, Introduction to Lie algebras and representation theory, Springer (1972). ISBN 3-540-90052-7.
   537	
   538	\bibitem{corpus-17} D. Husemoller, Fibre bundles, Springer (1966). ISBN 0-387-90103-5.
   539	
   540	\bibitem{corpus-18} J. Milnor and J. Stasheff, Characteristic classes, Princeton University Press (1974). ISBN 1-4008-8182-X.
   541	
   542	\bibitem{corpus-62} F. J. Murray and J. von Neumann, On rings of operators IV, Annals of Mathematics 44 (1943) 716-808. \url{https://doi.org/10.2307/1969107}
   543	
   544	\bibitem{corpus-64} A. Connes, Classification of injective factors, Annals of Mathematics 104 (1976) 73-115. \url{https://doi.org/10.2307/1971057}
   545	
   546	\bibitem{corpus-42} I. M. Gelfand and M. Neumark, On the imbedding of normed rings into the ring of operators in Hilbert space, Matematicheskii Sbornik 12 (1943) 197-213. \url{https://doi.org/10.1090/conm/167/16}
   547	
   548	\bibitem{corpus-43} I. M. Gelfand, Normierte Ringe, Matematicheskii Sbornik 9 (1941) 3-24.
   549	
   550	\bibitem{corpus-44} M. H. Stone, Applications of the theory of Boolean rings to general topology, Transactions of the American Mathematical Society 41 (1937) 375-481. \url{https://doi.org/10.1090/s0002-9947-1937-1501905-7}
   551	
   552	\bibitem{corpus-12} S. Doplicher and J. E. Roberts, Endomorphisms of $C^*$-algebras, cross products and duality for compact groups, Annals of Mathematics 130 (1989). \url{https://doi.org/10.2307/1971477}
   553	
   554	\bibitem{corpus-67} S. Doplicher and J. E. Roberts, A new duality theory for compact groups, Inventiones Mathematicae 98 (1989) 157-218. \url{https://doi.org/10.1007/bf01388849}
   555	
   556	\bibitem{corpus-13} P. Etingof, S. Gelaki, D. Nikshych, and V. Ostrik, Tensor categories, Mathematical Surveys and Monographs 205, American Mathematical Society (2015). ISBN 978-1-4704-2024-6.
   557	
   558	\bibitem{corpus-65} D. McDuff, Uncountably many $\mathrm{II}_1$ factors, Annals of Mathematics 90 (1969) 361-371. \url{https://doi.org/10.2307/1970730}
   559	
   560	\bibitem{corpus-53} M. O. Rabin, Recursive unsolvability of group theoretic problems, Annals of Mathematics 67 (1958) 172-194. \url{https://doi.org/10.2307/1969933}
   561	
   562	\bibitem{corpus-55} V. Bekkert and Y. Drozd, Derived tame and derived wild algebras, arXiv:math/0310352 (2003). \url{https://arxiv.org/abs/math/0310352}
   563	
   564	\bibitem{corpus-56} R.-O. Buchweitz and G. Leuschke, On the generic determinant's Cohen-Macaulay modules, arXiv:math/0505315 (2005). \url{https://arxiv.org/abs/math/0505315}
   565	
   566	\bibitem{corpus-58} J. Grevstad and J. May, On the classification of compact equivariant modules, arXiv:2509.17604 (2025). \url{https://arxiv.org/abs/2509.17604}
   567	
   568	\bibitem{corpus-54} M. Tancer, Simpler algorithmically unrecognizable 4-manifolds, arXiv:2310.07421 (2023). \url{https://arxiv.org/abs/2310.07421}
   569	
   570	\bibitem{corpus-6} V. I. Arnold, Mathematical methods of classical mechanics, Graduate Texts in Mathematics 60, Springer (1978). ISBN 0-387-90314-3.
   571	
   572	\bibitem{corpus-68} A. Weinstein, The local structure of Poisson manifolds, Journal of Differential Geometry 18 (1983) 523-557. \url{https://doi.org/10.4310/jdg/1214437787}
   573	
   574	\bibitem{corpus-50} E. Minguzzi and M. S\'anchez, The causal hierarchy of spacetimes, arXiv:gr-qc/0609119 (2006). \url{https://arxiv.org/abs/gr-qc/0609119}
   575	
   576	\bibitem{corpus-51} A. Galaev, The classification of connected holonomy groups of Lorentzian manifolds, arXiv:1611.01551 (2016). \url{https://arxiv.org/abs/1611.01551}
   577	
   578	\bibitem{corpus-8} M. Takesaki, Theory of operator algebras I, Springer (2001). ISBN 3-540-42248-X.
   579	
   580	\bibitem{corpus-30} A. Nissim, Lattice Yang-Mills in the 't Hooft regime, arXiv:2510.22788 (2025). \url{https://arxiv.org/abs/2510.22788}
   581	
   582	\bibitem{corpus-31} Y. Cao, A. Nissim, and S. Sheffield, Wilson area law in the 't Hooft regime, arXiv:2509.04688 (2025). \url{https://arxiv.org/abs/2509.04688}
   583	
   584	\bibitem{corpus-32} P. Faria da Veiga and M. O'Carroll, Partial results for four-dimensional lattice $\mathrm{SU}(N)$, arXiv:2509.03513 (2025). \url{https://arxiv.org/abs/2509.03513}
   585	
   586	\bibitem{corpus-74} P. Etingof and S. Gelaki, Isocategorical groups, arXiv:math/0007196 (2000). \url{https://arxiv.org/abs/math/0007196}
   587	
   588	\bibitem{corpus-5} W. Fulton and J. Harris, Representation theory, Springer (1991). ISBN 978-1-4612-0979-9.
   589	
   590	\bibitem{corpus-34} J. Baez and J. Dolan, Categorification, arXiv:q-alg/9503002 (1995). \url{https://arxiv.org/abs/q-alg/9503002}
   591	
   592	\bibitem{corpus-35} J. Lurie, On the classification of topological field theories, arXiv:0905.0465 (2009). \url{https://arxiv.org/abs/0905.0465}
   593	
   594	\bibitem{corpus-47} N. Bao, S. Nezami, H. Ooguri, B. Stoica, M. Sully, and B. Walter, The holographic entropy cone, arXiv:1505.07839 (2015). \url{https://arxiv.org/abs/1505.07839}
   595	
   596	\bibitem{corpus-52} D. Petz and C. Sud\'ar, Geometries of quantum states, arXiv:quant-ph/0102132 (2001). \url{https://arxiv.org/abs/quant-ph/0102132}
   597	
   598	\bibitem{corpus-1} D. Gorenstein, R. Lyons, and R. Solomon, The classification of the finite simple groups, Mathematical Surveys and Monographs 40.1, American Mathematical Society (1994). ISBN 0-8218-0960-1.
   599	
   600	\bibitem{corpus-3} J. H. Conway, R. T. Curtis, S. P. Norton, R. A. Parker, and R. A. Wilson, Atlas of finite groups, Clarendon Press (1985). ISBN 0-19-853199-0.
   601	
   602	\bibitem{corpus-16} S. Doplicher, R. Haag, and J. E. Roberts, Local observables and particle statistics I, Communications in Mathematical Physics 23 (1971) 199-230. \url{https://doi.org/10.1007/bf01877742}
   603	
   604	\bibitem{corpus-60} W. P. Thurston, Three dimensional manifolds, Kleinian groups and hyperbolic geometry, Bulletin of the American Mathematical Society 6 (1982) 357-381. \url{https://doi.org/10.1090/s0273-0979-1982-15003-0}
   605	
   606	\bibitem{corpus-70} G. Perelman, The entropy formula for the Ricci flow and its geometric applications, arXiv:math/0211159 (2002). \url{https://arxiv.org/abs/math/0211159}
   607	
   608	\bibitem{corpus-73} S. Hern\'andez-Cuenca, The holographic entropy cone for five regions, Physical Review D 100 (2019) 026004. \url{https://doi.org/10.1103/PhysRevD.100.026004}
   609	
   610	\bibitem{corpus-75} V. Ostrik, Module categories over weak Hopf algebras and Stone's duality transformation, Mathematical Research Letters 9 (2002) 589-605. arXiv:math/0111139.
   611	
   612	\bibitem{corpus-14} P. Etingof, D. Nikshych, and V. Ostrik, On fusion categories, Annals of Mathematics 162 (2005) 581-642. \url{https://doi.org/10.4007/annals.2005.162.581}
   613	
   614	\bibitem{corpus-10} W. F. Stinespring, Positive functions on $C^*$-algebras, Proceedings of the American Mathematical Society 6 (1955) 211-216. \url{https://doi.org/10.2307/2032342}
   615	
   616	\bibitem{corpus-11} A. S. Holevo, Quantum systems, channels, information, De Gruyter (2012). ISBN 3-11-027340-3.
   617	
   618	\bibitem{corpus-57} J. Grochow and Y. Qiao, Algorithms and lower bounds for group isomorphism, arXiv:1507.01917 (2015). \url{https://arxiv.org/abs/1507.01917}
   619	
   620	\bibitem{corpus-24} Building scientific understanding with academic communities, OpenAI (2026). \url{https://openai.com/index/building-scientific-understanding-with-academic-communities/}
   621	
   622	\bibitem{corpus-25} Yang-Mills working group statement, Kavli Institute for Theoretical Physics (2026). \url{https://www.kitp.ucsb.edu/sites/default/files/YM_working_group.pdf}
   623	
   624	\bibitem{corpus-23} Yang-Mills and the mass gap, Clay Mathematics Institute, Millennium Prize Problems (retrieved 2026). \url{https://www.claymath.org/millennium/yang-mills-the-maths-gap/}
   625	
   626	\bibitem{corpus-21} M. M\"uger, Galois theory for braided tensor categories and the modular closure, arXiv:math-ph/0008027 (2000). \url{https://arxiv.org/abs/math-ph/0008027}
   627	
   628	\bibitem{corpus-45} S. Ryu and T. Takayanagi, Holographic derivation of entanglement entropy from AdS/CFT, arXiv:hep-th/0603001 (2006). \url{https://arxiv.org/abs/hep-th/0603001}
   629	
   630	\bibitem{corpus-46} X. Dong, D. Harlow, and A. Wall, Reconstruction of bulk operators within the entanglement wedge in gauge-gravity duality, arXiv:1601.05416 (2016). \url{https://arxiv.org/abs/1601.05416}
   631	
   632	\bibitem{corpus-48} F. Pastawski, H. Yoshida, D. Harlow, and J. Preskill, Holographic quantum error-correcting codes: toy models for the bulk/boundary correspondence, arXiv:1503.06237 (2015). \url{https://arxiv.org/abs/1503.06237}
   633	
   634	\bibitem{corpus-40} M. Wilson, J. Hefford, and T. Hoffreumon, Supermaps on generalised theories, arXiv:2602.23865 (2026). \url{https://arxiv.org/abs/2602.23865}
   635	
   636	\bibitem{corpus-41} J. Hefford and M. Wilson, A profunctorial semantics for quantum supermaps, arXiv:2402.02997 (2024). \url{https://arxiv.org/abs/2402.02997}
   637	
   638	\bibitem{corpus-59} R. Sasyk and A. T\o rnquist, The classification problem for von Neumann algebras, arXiv:0909.2657 (2009). \url{https://arxiv.org/abs/0909.2657}
   639	
   640	\bibitem{corpus-19} R. A. Bertlmann, Anomalies in quantum field theory, Clarendon Press (1996). ISBN 978-0-19-852047-4.
   641	
   642	\end{thebibliography}
   643	
   644	\end{document}

exec
/usr/local/bin/zsh -lc "sed -n '150,360{=;p;}' papers/latex/synthesis.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
150
\section{The structural classification conjecture}
151

152
\begin{conjecture}[Structural classification of admissible physical systems]
153
\label{conj:cmrps}
154
There exists a collection of fundamental structural families $\mathfrak{F} = \{\mathfrak{F}_\alpha\}_{\alpha \in A}$ such that
155
\[
156
  \mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F}_\alpha \rangle_{\mathfrak{C}},
157
\]
158
the right side denoting closure of the families under the admissible constructions of \cref{def:constructions}.
159
\end{conjecture}
160

161
The closure $\langle \mathfrak{F} \rangle_{\mathfrak{C}}$ is the smallest full subcategory of $\mathrm{Phys}$ that contains every $\mathfrak{F}_\alpha$ and is closed under the constructions of \cref{def:constructions}. Its objects are exactly those obtained from the families by a finite iteration of those constructions, and no object outside that inductive closure is included. The conjecture is stated for the strict reading of $\mathrm{Phys}$ described in \cref{sec:morphisms}, whose arrows are coarse-grainings, embeddings, and exact equivalences. In that reading $\simeq$ denotes an equivalence of categories in the symmetric monoidal structure given by the tensor product construction, so the equivalence preserves the composition data of $\mathcal{C}$.
162

163
The conjecture is the organizing statement of the series and enters every part as a declared hypothesis or as an object of study. It carries five proof obligations, each a theorem target.
164

165
Completeness requires that every admissible physical system is represented in the closure $\langle \mathfrak{F} \rangle_{\mathfrak{C}}$. Soundness requires that every generated structure satisfies the admissibility conditions of \cref{def:admissibility}. Equivalence requires that different representations of the same physical system are identified correctly, which is where the preserved-layer requirement \cite{corpus-74} constrains the choice of $\simeq$. Structural characterization requires that the fundamental families have precise mathematical definitions; the ten candidate families of \cref{tab:ontology} are named, and the admissibility conditions of \cref{def:admissibility} select among them. Decomposition requires that systems in the targeted classes can be constructed from the fundamental families by the operations of \cref{def:constructions}; restricted forms of this obligation are established for finite-dimensional $C^*$-algebras \cite{corpus-9}, amenable factors \cite{corpus-62,corpus-64}, and superselection categories \cite{corpus-12,corpus-67}.
166

167
Delivering the five obligations would complete the mathematical classification layer of the architecture. It would leave physical realization and empirical selection as separate problems.
168

169
\section{Composition of the twelve parts}
170

171
The parts compose hierarchically. Each takes the registered definitions and the registered results of the parts before it and adds a structural layer. \Cref{tab:parts} states the contribution of each part and the dependency discipline that governs it.
172

173
\begin{table}[t]
174
\centering
175
\small
176
\caption{The twelve parts of the series, the structural contribution of each, and the hard prohibition that bounds its inputs.}
177
\label{tab:parts}
178
\begin{tabularx}{\textwidth}{Y{0.35}Y{1.15}Y{1.55}Y{0.95}}
179
\toprule
180
Part & Subject & Structural contribution & Hard prohibition on inputs \\
181
\midrule
182
I & Foundations & The category $\mathrm{Phys}$, the morphism kinds, the equivalence discipline, admissibility, irreducibility, and the central conjecture & Any theorem of the series and any claim that a universal classification exists \\
183
II & Structural families & The invariant discipline and the ten family records & A global periodic table of all physical structures and any completeness claim for the families \\
184
III & Irreducibility and decomposition & Existence and scope of decomposition, normal forms, admissible constructions & Unique decomposition of interacting systems and classification of general factors \\
185
IV & Yoneda classification & Relational characterization, supermap representability, and the limits of probe-based identification & Any conclusion of classification, physical equivalence, or empirical adequacy derived from Yoneda alone \\
186
V & Classical systems & Local symplectic classification, Poisson splitting, global symplectic invariants, and classical information geometry & An equivalence between classical and quantum families via deformation quantization \\
187
VI & Quantum systems & Dimension-vector classification, the amenable factor list, channels and dilations, superselection categories & The Elliott program, the fusion-category structure conjecture, and classification of non-amenable factors \\
188
VII & Gauge structures and quantum field theory & Lie theory of gauge groups, bundles, characteristic classes, anomalies as obstructions, and superselection & Four-dimensional existence as proved, the mass gap, and any conflation of the two \\
189
VIII & Spacetime & Holonomy, the causal ladder, geometrization, the entropy cone, and reconstruction from probes & Holographic entropy relations outside their proved range and tensor-network models as evidence for duality \\
190
IX & Gravity and information geometry & Monotone metrics, information geometry as invariant data, and the proposed gravity-information correspondence & Uniqueness of the quantum monotone metric and continuum convergence of nerve constructions \\
191
X & Observational equivalence & Equivalence notions, preserved layers, observation functors, and distinguishability & Tensor equivalence without symmetric structure as a criterion of physical equivalence \\
192
XI & Completeness and obstructions & The obstruction register, the regime taxonomy, and nonclassification results & The central conjecture as established and any uniform procedure in wild or undecidable sectors \\
193
XII & Principia Physica & The three-layer assembly of mathematical classification, physical realization, and empirical selection & Physical validation of the architecture and collapse of the three layers \\
194
\bottomrule
195
\end{tabularx}
196
\end{table}
197

198
\subsection{The dependency graph}
199

200
The series organizes as a directed acyclic graph rooted at the foundational ontology of Part~I and terminating at the assembly sink of Part~XII, drawn in \cref{fig:deps}. Every part has a directed path to Part~XII, which takes registered inputs from all eleven earlier parts. No part bypasses the primitive ontology of Part~I, and no part may cite a later one. A part may cite earlier parts for definitions and for registered results only, and no part may introduce an unproved result as a lemma.
201

202
\begin{figure}[t]
203
\centering
204
\caption{The permitted dependency edges among the twelve parts. Part~I is the definitional root, Part~XII is the assembly sink and takes registered inputs from all eleven earlier parts, and every edge carries the registered hypotheses of \cref{tab:deps}.}
205
\label{fig:deps}
206
\begin{tikzpicture}[font=\small,
207
  bx/.style={draw, rounded corners=2pt, inner sep=2.5pt, minimum width=8mm, minimum height=5.5mm},
208
  ar/.style={->, thick}]
209
\node[bx] (I)    at (0.0, 2.6) {I};
210
\node[bx] (II)   at (1.7, 2.6) {II};
211
\node[bx] (III)  at (3.4, 2.6) {III};
212
\node[bx] (V)    at (5.1, 3.4) {V};
213
\node[bx] (VI)   at (5.1, 1.8) {VI};
214
\node[bx] (VII)  at (6.8, 3.4) {VII};
215
\node[bx] (VIII) at (6.8, 1.8) {VIII};
216
\node[bx] (IX)   at (8.5, 2.6) {IX};
217
\node[bx] (IV)   at (1.7, 0.8) {IV};
218
\node[bx] (X)    at (5.1, 0.1) {X};
219
\node[bx] (XI)   at (1.7,-1.3) {XI};
220
\node[bx] (XII)  at (8.5,-1.3) {XII};
221
\draw[ar] (I) -- (II);
222
\draw[ar] (II) -- (III);
223
\draw[ar] (III) -- (V);
224
\draw[ar] (III) -- (VI);
225
\draw[ar] (V) -- (VII);
226
\draw[ar] (VI) -- (VIII);
227
\draw[ar] (VII) -- (IX);
228
\draw[ar] (VIII) -- (IX);
229
\draw[ar] (I) -- (IV);
230
\draw[ar] (IV) -- (III);
231
\draw[ar] (IV) -- (V);
232
\draw[ar] (IV) -- (VI);
233
\draw[ar] (IV) -- (X);
234
\draw[ar] (X) -- (IX);
235
\draw[ar] (I) -- (XI);
236
\draw[ar] (IX) -- (XII);
237
\draw[ar] (X) -- (XII);
238
\draw[ar] (XI) -- (XII);
239
\end{tikzpicture}
240
\end{figure}
241

242
\subsection{Registered dependency records}
243

244
Each permitted use of a registered result as an input to another part is recorded with its condition. A use is direct when the supplying result is a completed theorem in the literature, and a use is as hypothesis when the supplying statement is a conjecture, an open problem, or a conditional record. The series registers eight such uses, and each carries a constraint on how the supplying result may be used. \Cref{tab:deps} states the eight and their constraints.
245

246
\begin{table}[t]
247
\centering
248
\small
249
\caption{The registered dependency records of the series. Each row states a permitted use of a registered result and the constraint that use carries.}
250
\label{tab:deps}
251
\begin{tabularx}{\textwidth}{Y{0.62}Y{0.95}Y{1.03}Y{1.4}}
252
\toprule
253
Supplying result & Consuming parts & Condition & Rule enforced \\
254
\midrule
255
Finite-dimensional $C^*$-algebra decomposition \cite{corpus-9} & III, VI & Direct & Decomposition by dimension vector is the first concrete theorem model of the series. \\
256
Darboux normal form and Weinstein splitting \cite{corpus-6,corpus-68} & V & Direct & Symplectic classification content is global and topological rather than local. \\
257
Doplicher-Roberts and Deligne \cite{corpus-12,corpus-13,corpus-67} & VI, VII & Direct, under the stated hypotheses & The symmetric structure, conjugates, and $\mathrm{End}(\mathbf{1})=\mathbb{C}$ are declared with the use. \\
258
The structural classification conjecture & XI, XII & As hypothesis only & The conjecture enters as a declared hypothesis and never as a lemma. \\
259
The four-dimensional mass gap & VII & As an open problem & Existence and mass gap are never conflated. \\
260
The McDuff obstruction \cite{corpus-65} & VI, XI & Direct & No global factor classification may enter any part as a dependency. \\
261
The isocategorical counterexample \cite{corpus-74} & IV, X & Direct & Every equivalence record must declare the structure it preserves. \\
262
Chentsov and Petz-Sudar \cite{corpus-52} & IX, X & Direct & Quantum monotone metrics are parametric, and uniqueness may not be extended by dependency. \\
263
\bottomrule
264
\end{tabularx}
265
\end{table}
266

267
The series prohibits unproved statements from serving as proved dependencies. Unproved results enter the dependency structure exclusively as registered conjectures, as explicit hypotheses of conditional records, or as objects of study in Part~XI.
268

269
\section{Classification regimes}
270

271
The classification content of the series sorts by the kind of data that classifies. The regimes below are the ones the twelve parts jointly establish, and they are the ones the periodic table of mathematical physics records.
272

273
\subsection{Complete invariants}
274

275
A sector carries a complete classification when a theorem classifies its objects up to the chosen equivalence and the classifying invariant is finite or explicitly parameterized. The objects classified in each entry of \cref{tab:complete} are the objects named in the sector column, and the scope column states the equivalence relation in force.
276

277
\begin{table}[t]
278
\centering
279
\small
280
\caption{Sectors carrying a complete classification. Each entry names the classifying invariant and the scope in which the classification statement holds.}
281
\label{tab:complete}
282
\begin{tabularx}{\textwidth}{Y{0.95}Y{1.10}Y{0.95}}
283
\toprule
284
Sector & Classifying invariant & Scope of the classification \\
285
\midrule
286
Finite simple groups \cite{corpus-1,corpus-3} & Order, character table, Schur multiplier, and outer automorphism group & Up to isomorphism, as families together with the sporadic groups. A uniform parameterization is not known. \\
287
Complex semisimple Lie algebras \cite{corpus-4} & Dynkin diagram & Up to isomorphism. Real simple algebras are classified by Satake diagrams, and a real semisimple algebra is a direct sum of simple ideals. \\
288
Irreducible representations of semisimple Lie algebras \cite{corpus-5} & Dominant integral weight & Finite-dimensional irreducibles up to isomorphism. \\
289
Symplectic manifolds, locally \cite{corpus-6} & Dimension $2n$, and no invariant beyond dimension & Local germs up to symplectomorphism. Darboux normal form removes every local invariant beyond dimension, so all further classification content is global. \\
290
Poisson manifolds, locally \cite{corpus-68} & Weinstein splitting and symplectic-leaf foliation & Local models near a point of rank $2k$, with global leaf structure. \\
291
Finite-dimensional $C^*$-algebras \cite{corpus-9} & Dimension vector & Unital finite-dimensional complex algebras up to $*$-isomorphism. \\
292
Amenable factors \cite{corpus-62,corpus-64} & Murray-von Neumann type and Connes invariants & Types $\mathrm{I}_n$, $\mathrm{I}_\infty$, $\mathrm{II}_1$, $\mathrm{II}_\infty$, and $\mathrm{III}_\lambda$ up to isomorphism. \\
293
Principal $G$-bundles \cite{corpus-17,corpus-18} & Homotopy class of maps to $BG$, with characteristic classes & Bundles over a base space up to isomorphism. \\
294
Superselection sectors \cite{corpus-12,corpus-16,corpus-67} & Compact supergroup, unique up to isomorphism & Sectors meeting the Doplicher-Roberts criteria. \\
295
Symmetric tensor categories of subexponential growth \cite{corpus-13} & Supergroup representation category & Characteristic-zero categories under the stated growth hypothesis. \\
296
Connected Lorentzian holonomy groups \cite{corpus-51} & Holonomy group & Connected holonomy groups of irreducible and indecomposable Lorentzian structures in signature $(1,n-1)$, with realizing metrics constructed. A local and algebraic classification rather than a classification of Lorentzian manifolds up to isometry. \\
297
Causality conditions \cite{corpus-50} & Position on the causal ladder & The causality conditions themselves, up to the implication order of the ladder. The rung is a property of a spacetime and does not classify metrics up to isometry. \\
298
Closed three-manifolds \cite{corpus-60,corpus-70} & Thurston geometry type & Up to homeomorphism, as exactly eight model geometries. \\
299
Monotone metrics, classical \cite{corpus-52} & Fisher metric up to constant & Metrics monotone under stochastic maps. \\
300
Holographic entropy relations, five regions and fewer \cite{corpus-47,corpus-73} & Extreme rays of the entropy cone & Two, three, and four regions from subadditivity and monogamy of mutual information, and five regions from a complete graph construction. \\
301
\bottomrule
302
\end{tabularx}
303
\end{table}
304

305
Classification theorems and parameterization schemes are different achievements across the surveyed sectors. The finite simple groups admit an exhaustive classification without a uniform parameterization, so practical identification runs through companion data of the ATLAS kind \cite{corpus-3}. Classification invariants can also be purely global: Darboux normal form removes every local symplectic invariant beyond dimension \cite{corpus-6}, which forces symplectic classification into the global topological regime, the opposite of the Riemannian situation where curvature supplies rich local data.
306

307
\subsection{Parameterized and normal-form results}
308

309
Some sectors admit a parameterized answer rather than a finite list. Monotone metrics on quantum state spaces are classified by operator monotone functions through the Morozova-Chentsov construction \cite{corpus-52}: the answer is a family indexed by a function, and no member of the family is distinguished among all monotone metrics. Every fusion category is the representation category of a weak Hopf algebra \cite{corpus-75}, and the additional structure that supplies canonical traces is the subject of a conjecture of Etingof, Nikshych, and Ostrik \cite{corpus-14}. Every finite-dimensional algebra over an algebraically closed field is derived-tame or derived-wild \cite{corpus-55}, a dichotomy that sorts the field without classifying either side.
310

311
Other sectors carry a normal form rather than an isomorphism classification. Completely positive maps are classified up to minimal Stinespring dilation, unique up to unitary \cite{corpus-10}, and the Choi-Kraus form is a normal form whose Kraus rank is an invariant of the form \cite{corpus-11}. The series treats this data as a normal form and not as an isomorphism classification of channels.
312

313
\subsection{The regime taxonomy}
314

315
Part XI sorts the surveyed domains by the kind of achievement each represents, and the sort is stable across the twelve parts: a domain keeps its regime when a different part studies it. Seven regimes cover the surveyed domains.
316

317
\begin{description}
318
\item[Complete finite invariant.] A theorem classifies the objects up to the chosen equivalence and the classifying invariant takes finitely many values or is a finite combinatorial datum. The Killing-Cartan classification and the dimension-vector classification live here.
319
\item[Complete parameterized invariant.] A theorem classifies the objects and the invariant ranges over an explicitly described family. The Petz-Sudar classification of monotone metrics lives here.
320
\item[Normal form.] A canonical form exists with a stated uniqueness, and the form is not an isomorphism classification of the objects. Stinespring dilation and the Choi-Kraus form live here.
321
\item[Obstruction classification.] A theorem classifies the obstruction to a property rather than the objects. Anomaly classes live here.
322
\item[Open regime.] Partial or parametric results exist and no completeness statement is available. Fusion categories and the Elliott program live here.
323
\item[Claimed regime.] A result has been announced and its supporting artifacts are not publicly checkable. The four-dimensional existence announcement lives here.
324
\item[Impossibility regime.] A theorem forbids classification of the stated kind. The McDuff obstruction, wildness, and four-manifold unrecognizability live here.
325
\end{description}
326

327
The taxonomy records boundaries as well as contents. Tame and wild separates the algorithmically tractable domains from the intractable ones \cite{corpus-57}, and dimension three separates from dimension four by the presence of a finite geometry table on one side and unrecognizable manifolds on the other \cite{corpus-54,corpus-60}. Those two boundaries are the ones the regime sort reproduces most sharply.
328

329
\subsection{The periodic table}
330

331
The chart that assembles these regimes is the periodic table of mathematical physics, and \cref{tab:periodic} states its six regions. A periodic table must mark where no table exists, so the sixth region is as much content as the first.
332

333
\begin{table}[t]
334
\centering
335
\small
336
\caption{The periodic table of mathematical physics in six regions. Each region names the content it charts and the mathematical status of that content.}
337
\label{tab:periodic}
338
\begin{tabularx}{\textwidth}{Y{0.62}Y{1.38}Y{1.0}}
339
\toprule
340
Region & Content & Status of the content \\
341
\midrule
342
Families and invariants & The ten structural families with their defining invariants and the regime each occupies & Invariants are finite or parameterized where classification is complete \\
343
Exceptional structures & The sporadic simple groups \cite{corpus-1,corpus-3}, the exceptional Lie algebras and their real forms \cite{corpus-4}, the amenable type $\mathrm{III}_0$ and $\mathrm{III}_1$ factors \cite{corpus-64}, the eight Thurston geometries \cite{corpus-60}, the isocategorical group pairs \cite{corpus-74} & Each is proved to exist and to be exhaustive in its own domain \\
344
Reconstruction relationships & Gelfand-Neumark, Gelfand and Stone duality, Doplicher-Roberts, Deligne, Stinespring, the classifying-space construction \cite{corpus-42,corpus-43,corpus-44,corpus-12,corpus-13,corpus-10,corpus-17,corpus-18} & Each holds under the hypotheses stated in \cref{tab:reconstruction} \\
345
Equivalences and dualities & The identifications the series records, each with the structure it preserves & The preserved layer is named in every entry, and the isocategorical counterexample \cite{corpus-74} records what follows from not naming it \\
346
Open classification problems & Fusion categories \cite{corpus-14}, the Elliott program \cite{corpus-8}, the holographic entropy cone from six regions \cite{corpus-47}, the four-dimensional mass gap \cite{corpus-23} & Partial and parametric results are on record and no completeness statement is available \\
347
Obstructions & Adyan-Rabin \cite{corpus-53}, McDuff \cite{corpus-65}, wildness \cite{corpus-55,corpus-56,corpus-58}, tame and wild \cite{corpus-57}, countable invariants \cite{corpus-59}, dimension four \cite{corpus-54}, Etingof-Gelaki \cite{corpus-74} & Each is a theorem forbidding a classification of the stated kind \\
348
\bottomrule
349
\end{tabularx}
350
\end{table}
351

352
The existence of a finite list of exceptional objects in the finite-simple-group template does not transfer to physical theories in general, and the second region records the exceptions the mathematics actually supplies rather than a list the program expects to close. Reading the six regions together gives the summary of the series in one chart: families with invariants, exceptions the invariants must catch, recoveries from probes, identifications with declared scope, open problems, and proved limits.
353

354
\subsection{Sectors outside a finite list}
355

356
Three sectors sit outside any finite classification in their stated generality. General type $\mathrm{II}_1$ and type $\mathrm{III}$ factors carry coarse Connes-spectrum strata and vary in their fundamental groups \cite{corpus-8}. Extended topological quantum field theories are classified by fully dualizable objects \cite{corpus-34}, in a 2009 statement whose proof is an informal sketch \cite{corpus-35}, so the exact range of completed cases is a research question. The four-dimensional Yang-Mills existence problem is the subject of an announced result whose manuscript and formalization are withheld \cite{corpus-24,corpus-25}, and the mass gap is a separate open problem \cite{corpus-23}. The series records the existence claim and the mass gap separately and never merges them.
357

358
\section{Equivalence and preserved structure}
359

360
Every equivalence in the series names the structure it preserves, and the reason is a theorem rather than a preference.

2026-10-30T08:21:28.234252Z ERROR codex_core::tools::router: error=collab spawn failed: no thread with id: 01a18be6-2e55-7643-8cdc-25dfbfa5cdab
exec
/usr/local/bin/zsh -lc "nl -ba papers/latex/synthesis.tex | sed -n '360,475p'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   360	Every equivalence in the series names the structure it preserves, and the reason is a theorem rather than a preference.
   361	
   362	\subsection{The preserved-layer requirement}
   363	
   364	Two finite groups that are not isomorphic can carry equivalent representation categories as plain tensor categories \cite{corpus-74}. The equivalence is monoidal and does not respect the commutativity constraint, so the symmetric braiding is the layer it fails to preserve. Any criterion of identification that discards the monoidal or symmetric layer therefore identifies distinct groups. The series adopts the resulting requirement: an equivalence used to identify systems must state which layer of structure it preserves, and an equivalence that forgets the symmetric layer is rejected as a criterion.
   365	
   366	The requirement is constructive as well as negative. The Doplicher-Roberts equivalence takes a symmetric tensor $*$-category with conjugates, direct sums, subobjects, and $\mathrm{End}(\mathbf{1})=\mathbb{C}$ to the finite-dimensional unitary representations of a compact supergroup, unique up to isomorphism \cite{corpus-12,corpus-67}. Deligne's theorem takes a characteristic-zero symmetric tensor category of subexponential growth to a supergroup representation category \cite{corpus-13}. Both statements preserve the symmetric structure and both state their hypotheses in full. Müger's Galois theory for braided tensor categories recovers fixed-point data together with additional information that the braided structure alone does not supply \cite{corpus-21}.
   367	
   368	\subsection{Duality and the recovered data}
   369	
   370	Duality exchanges structure between differently presented theories, and each duality in the series states what the exchange recovers. Gelfand duality sends a commutative $C^*$-algebra to a compact Hausdorff space \cite{corpus-43}. Stone duality sends a Boolean algebra to a zero-dimensional compact spectrum \cite{corpus-44}. The classifying-space construction sends a principal $G$-bundle to a homotopy class of maps to $BG$, with characteristic classes as pullbacks of universal classes \cite{corpus-17,corpus-18}. The Yoneda embedding sends an object to its functor of relationships and is faithful as mathematics; the constraint that it does not by itself establish physical equivalence, empirical adequacy, or a classification theorem governs every use of it in the series.
   371	
   372	A duality is not automatically a physical equivalence. The series keeps the two apart: an identification of representations is a mathematical statement, and an identification of physical content requires its own definition and justification. The proposed gravity-information correspondence is a case in point. Ryu-Takayanagi relations are verified exactly in anti-de Sitter space in three dimensions with a two-dimensional conformal field theory dual \cite{corpus-45}, entanglement-wedge reconstruction holds as a physical dictionary result under the semiclassical AdS/CFT assumptions \cite{corpus-46}, and tensor-network models are toys rather than evidence for the duality itself \cite{corpus-48}. The series states each of these at the strength the source supports.
   373	
   374	\subsection{Observation and distinguishability}
   375	
   376	Observation functors formalize what an empirical procedure can separate. Applied to a pair of systems they induce an equivalence relation: systems are observationally equivalent relative to the procedure when no observation in its range separates them. The induced relation is coarse when the functor forgets detail and fine when it resolves it, and it behaves well under composition of procedures.
   377	
   378	The metric content of distinguishability diverges between the classical and quantum cases. On a classical probability simplex the Fisher information metric is the unique Riemannian metric monotone under stochastic transitions up to a positive constant \cite{corpus-52}. On quantum state spaces the monotone metrics form a family parameterized by operator monotone functions, and no member of that family is distinguished \cite{corpus-52}. The series treats the classical uniqueness as the anchor and the quantum parameterization as the reality, and it does not extend uniqueness across the gap between them.
   379	
   380	Mathematical isomorphism and observational indistinguishability are different relations. A mathematical classification would not by itself select a theory empirically, and several mathematically distinct theories produce identical predictions in an experimentally accessible regime. The three-layer architecture of the assembly keeps mathematical classification, physical realization, and empirical selection as separate maps, and no part of the series collapses them.
   381	
   382	\section{Reconstruction from probes}
   383	
   384	Reconstruction theorems recover an object from a category of probes. They are the pattern the series finds better developed than classification, and each carries hypotheses that cannot be dropped. The theorems on record and their hypotheses appear in \cref{tab:reconstruction}.
   385	
   386	\begin{table}[t]
   387	\centering
   388	\small
   389	\caption{Reconstruction theorems on record. Each row names the object recovered, the probe data it is recovered from, and the hypotheses the statement requires.}
   390	\label{tab:reconstruction}
   391	\begin{tabularx}{\textwidth}{Y{0.90}Y{1.05}Y{1.05}}
   392	\toprule
   393	Theorem & Recovers & From and under which hypotheses \\
   394	\midrule
   395	Gelfand-Neumark \cite{corpus-42} & A concrete representation in $B(H)$ & An abstract $C^*$-algebra, as a closed $*$-subalgebra of $B(H)$. A representation theorem; the classification statement it yields is the Gelfand duality of the commutative case. \\
   396	Gelfand duality \cite{corpus-43} & A compact Hausdorff space & A commutative $C^*$-algebra. The commutative side only. \\
   397	Stone duality \cite{corpus-44} & A zero-dimensional compact spectrum & A Boolean algebra. The Boolean side only. \\
   398	Doplicher-Roberts \cite{corpus-12,corpus-67} & A compact supergroup, unique up to isomorphism & A symmetric tensor $*$-category with conjugates, direct sums, subobjects, $\mathrm{End}(\mathbf{1})=\mathbb{C}$, and a symmetric braiding whose square is the identity on each object. \\
   399	Deligne \cite{corpus-13} & A supergroup representation category & A characteristic-zero symmetric tensor category of subexponential growth. \\
   400	Stinespring \cite{corpus-10} & A minimal dilation, unique up to unitary & A completely positive map. A normal form, and not an isomorphism classification of channels. \\
   401	Classifying-space construction \cite{corpus-17,corpus-18} & A principal $G$-bundle & A homotopy class of maps to $BG$. Homotopy-classified, with characteristic classes as pullbacks. \\
   402	Supermap representability \cite{corpus-40,corpus-41} & A concrete representation of categorical supermaps & A theory with suitable channel-state duality. Unification with the Gelfand and Stone pattern is a research question. \\
   403	Entanglement-wedge reconstruction \cite{corpus-46} & Bulk operators inside the entanglement wedge & A physical dictionary reconstruction under the semiclassical AdS/CFT assumptions, stated as a quantum-information theorem with its hypotheses. Not an axiomatic reconstruction in the sense of the preceding rows. \\
   404	\bottomrule
   405	\end{tabularx}
   406	\end{table}
   407	
   408	Reconstruction theorems fail when the probe category loses the hypotheses that carry the determination. The Doplicher-Roberts recovery of a compact supergroup collapses without the symmetric braiding, as non-isomorphic groups with equivalent plain tensor categories show \cite{corpus-74}. Deligne's classification fails without the subexponential growth condition on categorical dimensions \cite{corpus-13}. Gelfand duality ceases to recover a topological spectrum once commutativity is dropped \cite{corpus-43}. Each hypothesis is therefore a boundary of the theorem rather than a technical convenience.
   409	
   410	Whether the 2024 to 2026 supermap-representability line \cite{corpus-40,corpus-41} unifies with the Gelfand, Stone, and Naimark pattern into a single relational principle is a research question. The series records the proved representability results at their stated strength and leaves the unification open.
   411	
   412	\section{Obstruction theorems}
   413	
   414	Obstruction theorems prove that no classification of a stated kind can exist in a stated generality. They are content of the series, and they are what a periodic table must mark in the places where no table exists. The register appears in \cref{tab:obstructions}.
   415	
   416	\begin{table}[t]
   417	\centering
   418	\small
   419	\caption{The obstruction register of the series. Each theorem is a proved statement about the limits of classification in its regime.}
   420	\label{tab:obstructions}
   421	\begin{tabularx}{\textwidth}{Y{0.85}Y{1.10}Y{1.05}}
   422	\toprule
   423	Theorem & Statement & Consequence for classification \\
   424	\midrule
   425	McDuff \cite{corpus-65} & Uncountably many non-isomorphic separable type $\mathrm{II}_1$ factors exist & No total classification of factors outside the amenable case. \\
   426	Etingof-Gelaki \cite{corpus-74} & Non-isomorphic finite groups carry equivalent plain tensor representation categories & Equivalence notions that discard the monoidal or symmetric layer do not determine the group. \\
   427	Adyan-Rabin \cite{corpus-53} & Every Markov property of finitely presentable groups is algorithmically undecidable, including finiteness and simplicity & No uniform recognition procedure for group-flavored sectors. \\
   428	Wildness \cite{corpus-55,corpus-56,corpus-58} & Wild representation categories admit no finite-dimensional-variety parameterization, and wildness is preserved under degeneration & No finite-variety parameterization of wild representation categories. \\
   429	Tame and wild tractability \cite{corpus-57} & Group isomorphism is polynomial-time for tame extensions, and the required bounds fail in the wild case & Tame and wild separates algorithmically tractable from intractable regimes. \\
   430	Countable invariants \cite{corpus-59} & Von Neumann algebra isomorphism admits no classification by countable invariants & No classification of von Neumann algebras by a countable list of invariants. \\
   431	Dimension four \cite{corpus-54} & Deciding whether an arbitrary triangulated four-manifold is homeomorphic to the connected sum $\#_9(S^2 \times S^2)$ is algorithmically undecidable & No effective classification of four-manifolds in general. The construction is in the lineage of Markov's unrecognizable four-manifolds and improves the previous bound $\#_{12}$. \\
   432	\bottomrule
   433	\end{tabularx}
   434	\end{table}
   435	
   436	\subsection{Dimension three and dimension four}
   437	
   438	The clearest scope contrast in the series is dimensional. Closed three-manifolds decompose into exactly eight Thurston geometries \cite{corpus-60,corpus-70}, a finite table with a complete decomposition theorem behind it. In dimension four the model geometries are countably infinite in one family \cite{corpus-60}, only restricted classes decompose, and homeomorphism of a specific four-manifold is algorithmically unrecognizable \cite{corpus-54}. Finite classification tables exist in tame regimes and stop at the dimension where unrecognizability begins. The series states the contrast as a scope boundary and builds its regime taxonomy around it.
   439	
   440	\subsection{Scope effects}
   441	
   442	Each obstruction removes a possibility rather than adding a difficulty. The McDuff construction \cite{corpus-65} leaves the amenable classification intact and closes the non-amenable case. The isocategorical construction \cite{corpus-74} leaves the symmetric theory intact and closes the plain tensor case. The Adyan-Rabin results \cite{corpus-53} close uniform recognition while leaving individual presentations decidable. The wildness theorems \cite{corpus-55,corpus-56,corpus-58} close finite-variety parameterization while leaving the tame side open to classification. Reading the register this way is what allows a classification program to state restricted-class theorems with explicit scope instead of promising a single global table.
   443	
   444	\section{Worked examples}
   445	
   446	Three systems trace the shared framework end to end. Each is an object of the category, each carries an invariant record, and each sits in a regime of the taxonomy.
   447	
   448	\subsection{A finite-dimensional quantum system}
   449	
   450	Take a finite-dimensional quantum system whose observable algebra is a unital finite-dimensional complex $C^*$-algebra. The five components of the representation are immediate: the state space is the set of density operators on the underlying Hilbert space, the observable layer is the algebra $A$, the dynamics is a one-parameter group of $*$-automorphisms, the symmetry data is the group of automorphisms that preserve the dynamics, and the composition rule is the minimal tensor product of algebras.
   451	
   452	The algebra decomposes as
   453	\[
   454	  A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C}),
   455	\]
   456	and the multiset of matrix sizes is the dimension vector. Two such algebras are $*$-isomorphic exactly when their dimension vectors agree \cite{corpus-9}. The dimension vector is therefore a classifying invariant of regime one, and it is finite data. Irreducibility is relative to the composition rule: the simple blocks $M_{n_i}(\mathbb{C})$ are the irreducible objects under direct sum, and the decomposition into blocks is unique up to order.
   457	
   458	Morphisms between such systems are $*$-homomorphisms, and the equivalence that identifies representations is $*$-isomorphism, which preserves the full algebra structure. Channels between systems are completely positive maps; Stinespring dilation classifies them up to minimal dilation and unitary freedom \cite{corpus-10}, and the Kraus rank is an invariant of the normal form \cite{corpus-11}. The example therefore exercises the invariant discipline, the decomposition discipline, and the normal-form regime at once.
   459	
   460	\subsection{A classical mechanical system}
   461	
   462	Take a cotangent bundle $T^*Q$ with its canonical symplectic form. The state space is the symplectic manifold, the observable layer is the algebra of smooth functions with the Poisson bracket, the dynamics is a Hamiltonian vector field, the symmetry data is the group of canonical transformations preserving the Hamiltonian, and the composition rule is the product of symplectic manifolds.
   463	
   464	Darboux normal form shows that all symplectic manifolds of the same dimension are locally symplectomorphic \cite{corpus-6}. Local classification content on the symplectic side is therefore empty, and every invariant is global: the topology of the symplectic form, the Chern classes of the prequantum data, and the coadjoint orbits in the dual of a Lie algebra \cite{corpus-68}. The example shows why the local and global regimes must be separated in the taxonomy. A Poisson manifold splits near a point of rank $2k$ as a symplectic factor times a transverse Poisson factor \cite{corpus-68}, which is the local model the classification uses.
   465	
   466	For a statistical mechanical system the state space is a probability simplex and the invariant data is the Fisher metric, unique up to constant among metrics monotone under stochastic maps \cite{corpus-52}. The classical uniqueness is the anchor for the observational layer, and the quantum analogue is parameterized rather than unique.
   467	
   468	\subsection{A gauge theory}
   469	
   470	Take a principal $G$-bundle $P$ over a base space $X$ with a connection. The state space is the space of connections modulo gauge, the observable layer is the algebra of gauge-invariant functions, the dynamics is the Yang-Mills or Chern-Simons flow, the symmetry data is the gauge group, and the composition rule is the fiber product of bundles.
   471	
   472	Isomorphism classes of principal $G$-bundles over $X$ are homotopy classes of maps from $X$ to the classifying space $BG$ \cite{corpus-17,corpus-18}, and the characteristic classes are pullbacks of universal classes in the cohomology of $BG$. The classification is therefore complete and homotopy-theoretic. Anomalies are classified as obstruction classes in the Chevalley-Eilenberg cohomology of the gauge algebra \cite{corpus-19}: quantization exists exactly when the relevant classes vanish. Superselection sectors of the associated quantum field theory form a symmetric tensor $*$-category, and the Doplicher-Roberts theorem recovers the compact gauge group from that category under its stated hypotheses \cite{corpus-12,corpus-67}.
   473	
   474	The example is the one place in the series where the classification layer, the obstruction layer, and the reconstruction layer all appear in a single system. It also shows the load-bearing character of the preserved-layer requirement: the recovery of the gauge group uses the symmetric structure of the sector category, and discarding that structure admits the isocategorical counterexamples \cite{corpus-74}.
   475	

exec
/usr/local/bin/zsh -lc "python3 -c 'import re,pathlib,collections; s=pathlib.Path(\"papers/latex/synthesis.tex\").read_text(); labels=re.findall(r\"\\\\label\\{(["'^}]+)'"\\}\",s); bibs=re.findall(r\"\\\\bibitem\\{(["'^}]+)'"\\}\",s); print(\"Bibliography entries:\",len(bibs)); print(\"Duplicate labels:\",[k for k,n in collections.Counter(labels).items() if n>1]); print(\"Duplicate bibliography keys:\",[k for k,n in collections.Counter(bibs).items() if n>1]); print(\"Unresolved references:\",[(s.count(chr(10),0,m.start())+1,k) for m in re.finditer(r\"\\\\(?:cref|Cref|ref|eqref)\\{(["'^}]+)'"\\}\",s) for k in m.group(1).split(\",\") if k not in labels]); print(\"Unresolved citations:\",[(s.count(chr(10),0,m.start())+1,k) for m in re.finditer(r\"\\\\cite\\{(["'^}]+)'"\\}\",s) for k in m.group(1).split(\",\") if k not in bibs])'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 45ms:
Bibliography entries: 54
Duplicate labels: []
Duplicate bibliography keys: []
Unresolved references: []
Unresolved citations: []

2026-10-30T08:22:11.067490Z ERROR codex_core::tools::router: error=apply_patch verification failed: invalid patch: multiple operations target /Users/mlong/.codex/memories/MEMORY.md
2026-10-30T08:22:23.041360Z ERROR codex_core::tools::router: error=apply_patch verification failed: Failed to find expected lines in /Users/mlong/.codex/memories/MEMORY.md:
- `yonedalabs.ai`, `yonedalabs.io`, Cloudflare Registrar, auto-renew, production workflow, development infrastructure, container pack-builder, clone-pack creation, large pushes, mirror backfills, Cloudflare Containers

## User preferences
2026-10-30T08:22:29.844158Z ERROR codex_core::tools::router: error=apply_patch verification failed: Failed to find expected lines in /Users/mlong/.codex/memories/MEMORY.md:
## Failures and how to do differently

- Symptom: `failed to create directory .../target: Not a directory (os error 20)`. Cause: `target` is a broken target-cache symlink. Fix: inspect `readlink target` and its destination before retrying; repository guidance now prefers `~/Library/Caches/MDReader/cargo-target-native`, not another project's CatDB cache.
codex
Source-only review of `papers/latex/synthesis.tex`; compilation and rendered box warnings were not verified. Single hyphens are accepted throughout.

1. **Lines 173-196: oversized, unbreakable table.** The twelve-part table combines twelve lengthy rows with four narrow columns. It is very likely taller than the available page height. A `table` containing `tabularx` cannot split across pages, risking a “Float too large for page” warning and content extending below the page.

   **Fix:** Add `\usepackage{xltabular}` and convert this to a multipage `xltabular`, preserving the existing weighted `Y` columns. Remove the outer `table` environment, move the caption and label inside `xltabular`, terminate the caption with `\\`, and repeat the column headings using `\endfirsthead` and `\endhead`.

2. **Lines 277-303: oversized, unbreakable classification table.** Fifteen substantial rows, particularly the long scope descriptions, make this another likely page-height overflow. `[t]` placement cannot solve an oversized table.

   **Fix:** Apply the same multipage conversion, or split the table into two smaller tables with distinct captions and labels.

All citation keys and cross-reference targets resolve within the file, with no duplicate labels or bibliography keys. I found no evident compilation syntax errors or missing packages for the commands used. Overfull and underfull boxes require compilation to establish conclusively.

VERDICT: NEEDS_FIX
hook: Stop
hook: Stop Completed
tokens used
25,676
Source-only review of `papers/latex/synthesis.tex`; compilation and rendered box warnings were not verified. Single hyphens are accepted throughout.

1. **Lines 173-196: oversized, unbreakable table.** The twelve-part table combines twelve lengthy rows with four narrow columns. It is very likely taller than the available page height. A `table` containing `tabularx` cannot split across pages, risking a “Float too large for page” warning and content extending below the page.

   **Fix:** Add `\usepackage{xltabular}` and convert this to a multipage `xltabular`, preserving the existing weighted `Y` columns. Remove the outer `table` environment, move the caption and label inside `xltabular`, terminate the caption with `\\`, and repeat the column headings using `\endfirsthead` and `\endhead`.

2. **Lines 277-303: oversized, unbreakable classification table.** Fifteen substantial rows, particularly the long scope descriptions, make this another likely page-height overflow. `[t]` placement cannot solve an oversized table.

   **Fix:** Apply the same multipage conversion, or split the table into two smaller tables with distinct captions and labels.

All citation keys and cross-reference targets resolve within the file, with no duplicate labels or bibliography keys. I found no evident compilation syntax errors or missing packages for the commands used. Overfull and underfull boxes require compilation to establish conclusively.

VERDICT: NEEDS_FIX
