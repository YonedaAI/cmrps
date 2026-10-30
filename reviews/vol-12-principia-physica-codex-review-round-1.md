---
reviewer: codex (OpenAI) gpt-6.1-sol
type: formatting
paper: vol-12-principia-physica
round: 1
date: 2026-10-30T05:20:41Z
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
session id: 01a18b40-ccec-7070-9894-f693fae35c74
--------
user
Read ONLY the file papers/latex/vol-12-principia-physica.tex (do not explore other files or directories). Review it for LaTeX formatting issues: compilation errors, missing packages, broken references, inconsistent styling, overfull/underfull boxes, spacing problems. List all issues with line numbers and concrete fixes. End your response with a VERDICT line — exactly one of: VERDICT: PASS (no issues remain) or VERDICT: NEEDS_FIX (issues listed above must be fixed).
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
I’ll read only the specified TeX file and review it for formatting issues, with line numbers and concrete fixes.
exec
/usr/local/bin/zsh -lc 'nl -ba papers/latex/vol-12-principia-physica.tex' in /Users/mlong/Documents/Development/classification-physical-systems
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
    15	\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
    16	\usepackage[hidelinks]{hyperref}
    17	\usepackage{cleveref}
    18	
    19	\newtheorem{theorem}{Theorem}[section]
    20	\newtheorem{proposition}[theorem]{Proposition}
    21	\newtheorem{lemma}[theorem]{Lemma}
    22	\newtheorem{corollary}[theorem]{Corollary}
    23	\theoremstyle{definition}
    24	\newtheorem{definition}[theorem]{Definition}
    25	\newtheorem{remark}[theorem]{Remark}
    26	\newtheorem{conjecture}[theorem]{Conjecture}
    27	
    28	\title{Principia Physica\\[4pt]
    29	  {\normalsize Volume 12 of \emph{The Classification of Mathematical Representations of Physical Systems}}}
    30	\author{Matthew Long\\
    31	  \small The YonedaAI Collaboration, YonedaAI Research Collective\\
    32	  \small Chicago, Illinois, USA\\
    33	  \small \texttt{mlong@yonedalabs.ai}\\
    34	  \small \url{https://yonedalabs.ai}}
    35	\date{October 2026}
    36	
    37	\begin{document}
    38	\maketitle
    39	
    40	\begin{abstract}
    41	This paper assembles the registered results of the Classification of Mathematical Representations of Physical Systems into the three-layer architecture of Principia Physica: mathematical classification, physical realization, and empirical selection. The assembly keeps the three layers apart and separates proved statements from conjectural ones. Twenty background classification theorems and seven obstruction theorems are organized into seven classification regimes; a finite case analysis of the twenty-eight domains of the program comparison spine, with one boundary case, shows that fifteen carry a classification theorem with a finite or explicitly parameterized invariant, one is complete but unparameterized, one is a complete obstruction classification, seven remain open or claimed, three are impossible in the stated generality, one is undecidable, and one is decidable but unclassified. Eight reconstruction theorems recover objects from probes, each under hypotheses that cannot be dropped. The empirical layer admits no unique monotone metric in the quantum case, and no record validates the physical layer: the announced four-dimensional existence result carries the status existence claimed; manuscript and formalization withheld; verification pending, and the mass gap problem remains open. The structural classification statement enters only as a declared hypothesis, and a conditional reduction records what its five proof obligations would deliver. No record in the series carries a completed computer-checked proof.
    42	\end{abstract}
    43	
    44	\section{Introduction}
    45	
    46	A unified structural theory of mathematical physics would answer three questions at once: which mathematical structures can represent physical systems, how those structures realize concrete physical theories, and how observation selects among the theories that survive. The Classification of Mathematical Representations of Physical Systems (CMRPS) program treats the three questions as three layers of a single architecture and studies them separately. This paper is the assembly layer of that program. It takes the registered results of the eleven preceding volumes and states, at exactly the strength the evidence supports, what a unified structural theory would require. It proves no new classification theorem; its formal statements are deductions about the assembled evidence and about what the central conjecture would deliver. The program documents and the eleven preceding volumes are works of this series and are available from the program site \url{https://yonedaai.com}. They organize citations and claim statuses and add no authority of their own: every mathematical statement used below is cited to the external literature, with a resolvable primary source for each citation.
    47	
    48	The assembly reveals that empirical validation remains unachieved. The program has established mathematical formulations and rigorous theorems; it has not established physical validation of the architecture itself. Three levels of mathematical achievement separate formulation, rigorous theorem, and physical validation, and the evidence base reaches the second level only. Every claim below is calibrated to that ladder.
    49	
    50	The central object is the identity
    51	\[
    52	  \mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F}_\alpha \rangle_{\mathfrak{C}},
    53	\]
    54	which asserts that every admissible physical system is generated from a collection of fundamental structural families under admissible constructions. The identity is a conjecture and is never used here as a lemma. The results assembled around it are the classification regimes where theorems exist, the obstruction theorems that forbid classification elsewhere, the reconstruction theorems that recover objects from probes, and the empirical constraints that no mathematical classification can discharge.
    55	
    56	This assembly establishes four results. Twenty-eight mathematical domains fall into six realized classification regimes, with complete invariants appearing only where the invariant is finite or explicitly parameterized. Seven impossibility theorems show that wild representation categories, non-amenable factors, and generic four-manifolds admit no uniform classification. Every reconstruction theorem on record requires its full algebraic hypotheses, and dropping the symmetric or monoidal structure admits non-isomorphic counterexamples. Resolving the structural classification conjecture would complete the mathematical classification alone, leaving physical realization and empirical selection unconstrained.
    57	
    58	A mathematical classification is never stated as a physical realization, and neither is ever stated as empirical selection. The strongest defensible claim on record is the founding program's own calibration: the architecture is precise enough to organize a substantial, long-term mathematical research program, and its individual components produce valuable results even if a universal classification theorem ultimately proves unattainable.
    59	
    60	\section{Definitions}
    61	
    62	Stipulated notions are marked as such; established mathematics is cited to primary sources.
    63	
    64	\begin{definition}[Representation of a physical system]
    65	\label{def:representation}
    66	A representation of a physical system is a tuple
    67	\[
    68	  P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C}),
    69	\]
    70	comprising a state space or geometric structure $X$, an observable algebra or collection $\mathcal{O}$, dynamical laws $\mathcal{D}$, symmetry and constraint data $\mathcal{S}$, and composition rules $\mathcal{C}$. The five components need not be independent.
    71	\end{definition}
    72	
    73	\Cref{def:representation} is a stipulative schema, not a theorem. Instances of $X$ range over symplectic manifolds \cite{corpus-6,corpus-7}, Hilbert spaces \cite{corpus-9}, probability spaces, smooth manifolds \cite{corpus-50,corpus-51}, and lattice configurations. The intended ambient structure $\mathrm{Phys}$ takes these representations as objects and admissible relationships as morphisms. Coarse-graining, equivalences, embeddings, dualities, and limiting procedures are candidate morphism kinds, and their preservation laws and composition rules are not fixed. Until they are fixed, $\mathrm{Phys}$ is a schema rather than a category, and every construction below is read at the level of object classes: no categorical subcategory, limit, or colimit construction is invoked.
    74	
    75	\begin{definition}[Equivalences]
    76	\label{def:equivalence}
    77	Mathematical equivalence is isomorphism of the tuples of \cref{def:representation} in the ambient category of each component. Physical equivalence $\simeq$ is a chosen equivalence relation on the objects of $\mathrm{Phys}$; the classification problem is $\mathrm{Classify}(\mathrm{Ob}(\mathrm{Phys})/\simeq)$.
    78	\end{definition}
    79	
    80	Physical equivalence is stipulative and the choice is open. Two mathematical descriptions may be physically equivalent without being mathematically isomorphic. Any equivalence used to identify systems must state which layer of structure it preserves; equivalences that forget the monoidal or symmetric layer are provably insufficient \cite{corpus-12}.
    81	
    82	\begin{definition}[Admissible systems and family closure]
    83	\label{def:admissible}
    84	An admissible physical system is an object of the schema of \cref{def:representation} satisfying explicitly stated consistency conditions; $\mathrm{Phys}_{\mathrm{adm}}$ denotes the class of such objects. A structural family collection $\mathfrak{F} = \{\mathfrak{F}_\alpha\}_{\alpha \in A}$ is a collection of classes of objects singled out by their underlying mathematical structure, and $\langle \mathfrak{F} \rangle_{\mathfrak{C}}$ denotes the smallest class of objects containing $\mathfrak{F}$ and closed under a set of admissible constructions $\mathfrak{C}$: tensor product, direct sum, extension, limits and colimits, and factorization.
    85	\end{definition}
    86	
    87	The admissibility conditions are the first deliverable of the foundations volume and remain unfixed. Every statement quantified over $\mathrm{Phys}_{\mathrm{adm}}$ is therefore conditional on the chosen conditions. The ten candidate structural families are named in the shared ontology and range from symplectic and Poisson structures through operator algebras, manifolds, bundles, probability, higher categories, dynamical systems, tensor categories, combinatorial structures, and derived structures. They are candidate organizing families, and some may later be unified.
    88	
    89	\begin{definition}[Irreducibility and decomposition]
    90	\label{def:irreducible}
    91	An object $P$ is irreducible relative to a specified composition operation when it admits no nontrivial decomposition under that operation. A decomposition is an expression $P \simeq \mathcal{F}(I_1, \ldots, I_n)$ with each $I_i$ irreducible and $\mathcal{F}$ an admissible construction. Irreducibility is always relative to the composition data $\mathcal{C}$ and to the decomposition notion in force.
    92	\end{definition}
    93	
    94	Interacting physical systems need not admit unique decompositions. Entanglement, emergence, gauge redundancy, and nontrivial interactions all complicate the notion, so existence-and-uniqueness theorems belong only to restricted subclasses.
    95	
    96	\begin{definition}[The three layers]
    97	\label{def:layers}
    98	The Principia architecture consists of three layers. The mathematical layer is $\mathcal{M} = \mathrm{Classify}(\text{admissible structures})$. The realization layer is a map $\mathcal{R} : \mathcal{M} \to \mathcal{P}$ into physical theories. The selection layer is a map $\mathcal{E} : \mathcal{P} \to \mathcal{E}_{\mathrm{obs}}$ into observational constraints or predictions. The object $\mathcal{E}_{\mathrm{obs}}$ records observational data; the map $\mathcal{E}$ does not assert that every model maps to a single observational object.
    99	\end{definition}
   100	
   101	\begin{definition}[Evidence grades]
   102	\label{def:grades}
   103	A statement carries grade 1 when it is a mathematical formulation, grade 2 when a rigorous proof exists in the literature, and grade 3 when the statement has achieved physical validation, meaning that its physical realization and its empirical selection have been established for the systems it describes.
   104	\end{definition}
   105	
   106	\begin{definition}[Classification regimes]
   107	\label{def:regimes}
   108	A domain of mathematical structures is assigned to exactly one of seven regimes. Regime 1 is complete and parameterized: a classification theorem exists and a finite or explicitly described parameter class determines the object. Parameter classes range from finite data such as dimension vectors to infinite function classes such as operator monotone functions, and the classification is a bijection with the parameter class in either case. Regime 2 is complete but unparameterized: a classification theorem exists and no uniform parameterization is known. Regime 3 is complete as obstruction: the classification content is the obstruction itself. Regime 4 is open: partial results, normal forms, or claims only. Regime 5 is impossible in the stated generality: a theorem forbids the classification. Regime 6 is undecidable: no algorithm can carry the classification. Regime 7 is decidable but unclassified.
   109	\end{definition}
   110	
   111	\begin{remark}
   112	The regime assignment is an organizing device for the evidence base. It does not assert that the regimes are mathematically exhaustive of all possible classification situations. The unknot recognition problem, in $\mathrm{NP}$ and co-$\mathrm{NP}$ with the complexity-class membership open \cite{corpus-61}, is the registered instance of regime 7, and \cref{tab:regimes} carries it as a boundary case beyond the twenty-eight spine domains.
   113	\end{remark}
   114	
   115	\begin{definition}[Structural invariant record]
   116	\label{def:invariants}
   117	For a theory $T$, the structural invariant record is the tuple
   118	\[
   119	  \mathcal{I}(T) = (\mathcal{S}_T, \mathcal{O}_T, \mathcal{D}_T, \mathcal{G}_T, \mathcal{R}_T),
   120	\]
   121	describing states, observables, dynamics, symmetries, and representations. The classification question is which of these invariants suffice to distinguish theories up to the chosen equivalence of \cref{def:equivalence}.
   122	\end{definition}
   123	
   124	\begin{definition}[Observational equivalence]
   125	\label{def:observational}
   126	Given a regime $E$ of accessible experiments, two theories satisfy $T_1 \sim_E T_2$ when they give identical predictions in $E$. The relation $\sim_E$ is an equivalence relation on theories, and the selection layer $\mathcal{E}$ is the map whose induced quotient computes it.
   127	\end{definition}
   128	
   129	\begin{table}[htbp]
   130	\caption{The ten candidate structural families with representative systems and defining invariants. The families are candidates and some may later be unified.}
   131	\label{tab:families}
   132	\small
   133	\begin{tabularx}{\textwidth}{>{\hsize=0.35\hsize\raggedright\arraybackslash}X >{\hsize=1.4\hsize\raggedright\arraybackslash}X >{\hsize=0.95\hsize\raggedright\arraybackslash}X >{\hsize=1.3\hsize\raggedright\arraybackslash}X}
   134	\toprule
   135	Family & Underlying structure & Representative systems & Defining invariants \\
   136	\midrule
   137	I & Symplectic and Poisson structures & Classical mechanics & Symplectic form and splitting data \\
   138	II & Hilbert spaces and operator algebras & Quantum mechanics & Dimension vector and factor type \\
   139	III & Smooth manifolds and geometry & Relativity & Holonomy group and causal class \\
   140	IV & Principal bundles and connections & Gauge theories & Characteristic and obstruction classes \\
   141	V & Probability and measure theory & Statistical physics & Fisher metric up to constant \\
   142	VI & Topological and higher categories & Topological field theories & Fully dualizable objects \\
   143	VII & Dynamical systems and semigroups & Dissipative systems & Normal-form dilation data \\
   144	VIII & Tensor categories and composition & Quantum information & Symmetric structure and conjugates \\
   145	IX & Discrete combinatorial structures & Lattice models & Lattice data and tame or wild class \\
   146	X & Derived and homotopical structures & Higher gauge theories & Derived-tame or wild class \\
   147	\bottomrule
   148	\end{tabularx}
   149	\end{table}
   150	
   151	\section{The three layers of the assembly}
   152	
   153	The three layers of \cref{def:layers} are stipulated as separate maps, and the evidence base treats them as separate.
   154	
   155	Under the architecture of \cref{def:layers}, classification data determines neither realization nor selection. The architecture stipulates $\mathcal{R}$ and $\mathcal{E}$ as maps with separate domains and codomains, and the founding documents stipulate that several mathematically distinct theories may produce identical predictions within an experimentally accessible regime. The registry of the program, examined record by record, contains classification theorems, reconstruction theorems, and obstruction theorems, and it contains no observation functor and no construction of $\mathcal{E}$: every record lives at the mathematical layer or at the interface between the mathematical and realization layers. Classification data therefore underdetermines empirical selection.
   156	
   157	Empirical selection is not a corollary of classification. Let $T_1$ and $T_2$ be mathematically distinct theories whose predictions agree in an accessible regime $E$, as the architecture stipulates; write $T_1 \sim_E T_2$ for that agreement. A classification at $\mathcal{M}$ distinguishes $T_1$ from $T_2$, so the classification map is not constant on $\sim_E$-classes and cannot compute them. Deciding $\sim_E$ requires the map $\mathcal{E}$, which the classification layer does not supply.
   158	
   159	\Cref{tab:grades} places the record types of the program at the evidence grades of \cref{def:grades}. The grade-3 column is empty.
   160	
   161	\begin{table}[htbp]
   162	\caption{Evidence grades of the record types of the program registry. Physical validation is empty for every record type.}
   163	\label{tab:grades}
   164	\small
   165	\begin{tabularx}{\textwidth}{>{\hsize=1.11\hsize\raggedright\arraybackslash}X >{\hsize=0.26\hsize\raggedright\arraybackslash}X >{\hsize=1.63\hsize\raggedright\arraybackslash}X}
   166	\toprule
   167	Record type & Grade & Example \\
   168	\midrule
   169	Stipulated definitions and architecture & 1 & The three layers of \cref{def:layers} \\
   170	Classification theorems & 2 & Dimension vector classification of finite-dimensional C*-algebras \\
   171	Reconstruction theorems & 2 & Doplicher-Roberts reconstruction under its hypotheses \\
   172	Obstruction theorems & 2 & Uncountably many non-isomorphic separable type~$\mathrm{II}_1$ factors \\
   173	Claim-ledger entries & 1 & The announced existence claim of \cref{tab:claims} \\
   174	Physical validation of the architecture & 3 & No record on file \\
   175	\bottomrule
   176	\end{tabularx}
   177	\end{table}
   178	
   179	A complete mathematical classification $\mathcal{M}$ leaves empirical selection $\mathcal{E}$ underdetermined whenever distinct mathematical models yield identical observational predictions. Because the mathematical, realization, and empirical layers possess distinct domains and quotient structures, each layer imposes independent constraints on physical admissibility.
   180	
   181	\section{The mathematical layer}
   182	\label{sec:mathlayer}
   183	
   184	The mathematical layer $\mathcal{M}$ is where the evidence base is strongest. It is also where the limits of classification are theorems rather than difficulties. \Cref{tab:regimes} assigns every domain of the program comparison spine to a regime of \cref{def:regimes}.
   185	
   186	\begin{table}[htbp]
   187	\caption{The twenty-eight domains of the program comparison spine and the unknot-recognition boundary case, with classifying invariant and classification regime. Regime 1 is complete and parameterized, 2 is complete but unparameterized, 3 is complete as obstruction, 4 is open or claimed, 5 is impossible in the stated generality, 6 is undecidable, and 7 is decidable but unclassified.}
   188	\label{tab:regimes}
   189	\small
   190	\begin{tabularx}{\textwidth}{>{\hsize=0.94\hsize\raggedright\arraybackslash}X >{\hsize=1.06\hsize\raggedright\arraybackslash}X c}
   191	\toprule
   192	Domain & Classifying invariant & Regime \\
   193	\midrule
   194	Finite simple groups & Character table and companion atlas data & 2 \\
   195	Simple Lie groups and Lie algebras & Dynkin and Satake diagrams & 1 \\
   196	Irreducible representations of semisimple Lie algebras & Dominant integral weights & 1 \\
   197	Symplectic manifolds in the local category & The empty local invariant & 1 \\
   198	Poisson manifolds in the local category & Weinstein splitting data & 1 \\
   199	Finite-dimensional complex C*-algebras & Dimension vector & 1 \\
   200	Amenable factors & Murray-von Neumann type and Connes invariants & 1 \\
   201	General type~$\mathrm{II}$ and type~$\mathrm{III}$ factors & Coarse Connes-spectrum strata only & 5 \\
   202	Quantum channels & Kraus rank as normal-form data & 4 \\
   203	Principal $G$-bundles & Homotopy classes of maps into the classifying space & 1 \\
   204	Anomalies & Cohomological obstruction classes & 3 \\
   205	DHR superselection sectors & Compact supergroup from the reconstruction & 1 \\
   206	Symmetric tensor categories of subexponential growth & Supergroup representation category & 1 \\
   207	Fusion categories & Weak Hopf algebra presentation & 4 \\
   208	Extended topological quantum field theories & Fully dualizable objects & 4 \\
   209	Lorentzian holonomy groups & Holonomy group & 1 \\
   210	Spacetime causality conditions & Causal class on the causal ladder & 1 \\
   211	Holographic entropy cone with at most four regions & Subadditivity and monogamy inequality data & 1 \\
   212	Holographic entropy cone with five or more regions & One infinite inequality family known & 4 \\
   213	Monotone metrics in the classical case & Fisher metric up to constant & 1 \\
   214	Monotone metrics in the quantum case & Operator monotone functions (infinite parameter class) & 1 \\
   215	Emergent spacetime and the Ryu-Takayanagi formula & No established invariant & 4 \\
   216	Four-dimensional Yang-Mills and QCD existence & Balaban-program methods & 4 \\
   217	Four-dimensional Yang-Mills mass gap & No invariant established & 4 \\
   218	Closed three-manifolds & Thurston geometry type & 1 \\
   219	Four-manifolds & Restricted classes only & 5 \\
   220	Finitely presented groups under Markov properties & No invariant can exist & 6 \\
   221	Wild representation categories & No finite-variety parameterization exists & 5 \\
   222	Unknot recognition & Decidable with complexity class open & 7 \\
   223	\bottomrule
   224	\end{tabularx}
   225	\end{table}
   226	
   227	The twenty-nine rows of \cref{tab:regimes} carry the regime counts $15, 1, 1, 7, 3, 1, 1$ over regimes 1 to 7. Every regime-1 domain carries a finite or explicitly parameterized classifying invariant; parameter classes range from dimension vectors to the infinite class of operator monotone functions. Every domain whose objects include wild, non-amenable, or algorithmically unrecognizable sectors lies in regime 4, 5, or 6, and none of those domains carries a classification theorem. The counts hold by inspection of the table, where row 29 carries regime 7. Regime~1 contains the rows for simple Lie theory \cite{corpus-4}, its representation theory \cite{corpus-5}, local symplectic and Poisson geometry, finite-dimensional C*-algebras, amenable factors, principal bundles, DHR sectors, subexponential symmetric tensor categories, Lorentzian holonomy, the causal ladder, the at-most-four-region entropy cone, monotone metrics, and closed three-manifolds. Each invariant listed for those rows is finite data or parametric data: diagrams, weights, dimension vectors, types and Connes invariants, homotopy-class data, supergroup data, holonomy groups, causal classes, inequality data, metrics up to constant, and geometry type. Regime~2 is finite simple groups, where the classification theorem exists and no uniform parameterization is known. Regime~3 is anomalies, where the classification content is the obstruction classes. Regime~4 contains quantum channels, fusion categories, extended topological field theories, the entropy cone from five regions up, emergent spacetime, and the two Yang-Mills rows. Regime~5 contains general type~$\mathrm{II}$ and type~$\mathrm{III}$ factors \cite{corpus-8}, four-manifolds \cite{corpus-54}, and wild representation categories \cite{corpus-55,corpus-56,corpus-58}. Regime~6 contains Markov properties of finitely presented groups \cite{corpus-53}. The wild, non-amenable, and unrecognizable sectors appear exactly in rows that \cref{thm:obstructions} below covers, and those rows carry partial data or nothing at all where a classification theorem would sit.
   228	
   229	The regime-4 rows are partial in four distinct ways. Quantum channels carry only normal-form data \cite{corpus-10,corpus-11}. Fusion categories are open \cite{corpus-14}. Extended topological quantum field theories are claimed through the cobordism hypothesis \cite{corpus-34}, whose 2009 proof is an informal sketch \cite{corpus-35}, while functorial topological field theory is tractable under the Atiyah axioms \cite{corpus-36}. The entropy cone from five regions up has one infinite inequality family and no complete list \cite{corpus-47}. The two Yang-Mills rows carry the claim register of \cref{tab:claims}.
   230	
   231	\begin{remark}
   232	Row 21 records a proved parametric classification: quantum monotone metrics are classified by operator monotone functions \cite{corpus-52}. The parameter class here is an infinite-dimensional class of functions, not the finite or discrete data of the other regime-1 rows, and uniqueness fails in the quantum case. The program periodic table lists the same domain among open classification problems because the classification is not a finite list. Both statements stand together: the classification theorem is proved, and the classification is not finite.
   233	\end{remark}
   234	
   235	Within the evidence base, classification is sharp exactly where the invariant is finite or explicitly parameterized, and the classification content can be entirely global. Every regime-1 and regime-2 row of \cref{tab:regimes} has a finite or explicitly parameterized invariant, and the domains without such invariants are exactly the domains with no classification theorem. The global character of symplectic classification is Darboux's theorem \cite{corpus-6}: any two symplectic manifolds of the same dimension are locally symplectomorphic, so the local invariant is empty and the classifying data must be global. The contrast with Riemannian geometry, where curvature supplies local invariants, is structural rather than incidental.
   236	
   237	\subsection{Classification, parameterization, and recognition}
   238	
   239	Three classification achievements are often conflated. A parameterization assigns uniform finite data to each object. A classification lists the objects exhaustively. A recognition procedure identifies an object algorithmically from companion data.
   240	
   241	The classification of finite simple groups delivers the second achievement and only part of the third. The list of families and sporadic groups is complete \cite{corpus-1,corpus-2}, and practical identification runs through companion data of atlas type: order, Schur multiplier, outer automorphism group, presentations, and character tables with power maps \cite{corpus-3}. No clean uniform parameterization analogous to Dynkin diagrams is known \cite{corpus-1}. The template program itself therefore sits in regime 2 of \cref{def:regimes}, and a periodic table of physical structures cannot expect more from its analogy than the template delivers.
   242	
   243	The analogy between the two classification problems is architectural rather than evidentiary. The finite simple groups share one definition; physical systems have no universally accepted mathematical definition, and the schema of \cref{def:representation} is a candidate. The founding documents warn against assuming that physical theories possess a finite collection of exceptional objects analogous to the twenty-six sporadic groups \cite{corpus-1}. Exceptional mathematics exists and the taxonomy must accommodate it: the exceptional Lie algebras \cite{corpus-4}, the type~$\mathrm{III}$ factors and the hyperfinite II$_1$ factor \cite{corpus-8}, the eight Thurston geometries \cite{corpus-60}, and the isocategorical group pairs \cite{corpus-12}. Whether any two of the ten families of \cref{tab:families} are logically independent is open, and no theorem on record settles it.
   244	
   245	\section{Obstruction theorems}
   246	\label{sec:obstructions}
   247	
   248	Obstructions are theorems. Seven of them are registered, and each forbids a classification objective that one might otherwise pursue.
   249	
   250	\begin{theorem}[Survey: non-classification outside tame regimes, assembled from McDuff, Adyan-Rabin, the wildness results, Tancer, Etingof-Gelaki, and Grochow-Qiao]
   251	\label{thm:obstructions}
   252	The following classification objectives are forbidden by proved results. Separable type~$\mathrm{II}_1$ factors admit no total classification outside the amenable case, and their isomorphism relation admits no classification by countable invariants. Wild representation categories admit no finite-variety parameterization. Markov properties of finitely presented groups, including finiteness and simplicity, are algorithmically undecidable. Homeomorphism of compact four-manifolds is algorithmically unrecognizable in general. A finite group is not determined by its representation category as a plain tensor category. Group isomorphism admits no polynomial-time algorithm in wild regimes under standard complexity assumptions, while tame extensions do. Consequently any classification theorem in the program must either restrict its class to a tame regime or weaken its invariant notion, and a global periodic table covering all families cannot exist outside tame regimes.
   253	\end{theorem}
   254	
   255	\begin{proof}
   256	The first statement is McDuff's theorem: there are uncountably many non-isomorphic separable type~$\mathrm{II}_1$ factors \cite{corpus-8,corpus-65}. A total classification by a countable list of invariants would inject that uncountable family into a countable product of invariant values, which is impossible, and the Borel-reducibility analysis makes the failure precise for isomorphism of von Neumann algebras \cite{corpus-59}. The second statement is the wildness line: every finite-dimensional algebra over an algebraically closed field is derived-tame or derived-wild with wildness preserved under degeneration \cite{corpus-55}, the rank-2 isomorphism classes of the generic determinant's Cohen-Macaulay modules admit no finite-dimensional-variety parameterization \cite{corpus-56}, and no meaningful classification of compact $C_p$-equivariant $H\mathbb{F}_p$-modules exists at odd primes \cite{corpus-58}. The third statement is the Adyan-Rabin theorem with the Collins extension \cite{corpus-53}. The fourth statement is the unrecognizability of connected-sum homeomorphism for a specific four-manifold \cite{corpus-54}, set against the eight-geometry decomposition of closed three-manifolds \cite{corpus-60,corpus-70}. The fifth statement is the isocategorical-group construction: non-isomorphic finite groups carry equivalent representation categories as plain tensor categories \cite{corpus-12}. The sixth statement is the tame/wild tractability boundary \cite{corpus-57}. Each forbidden objective is a classification covering one of the named sectors, so each such classification would contradict the corresponding theorem. The conjunctive conclusion follows.
   257	\end{proof}
   258	
   259	\subsection{What the obstructions permit}
   260	
   261	\Cref{thm:obstructions} does not say that classification fails everywhere. It says that classification objectives must match regimes.
   262	
   263	The amenable factors are completely classified by Murray-von Neumann type and Connes invariants \cite{corpus-8,corpus-62,corpus-64}, and the obstruction concerns only the non-amenable remainder. The classification theorem and the impossibility theorem sit side by side and refer to different classes. The anomaly sector is classified completely in regime 3: quantization exists exactly when the relevant cohomological obstruction classes vanish \cite{corpus-19}, so the classification content is the obstruction itself. An impossibility statement of this shape is a finished classification, not a gap. Dimension three admits a finite table of Thurston geometries \cite{corpus-60,corpus-70} while dimension four contains algorithmically unrecognizable instances \cite{corpus-54}, so finite tables exist only in tame regimes. The same contrast appears inside group theory: tame extensions admit polynomial-time isomorphism tests while wild regimes do not \cite{corpus-57}, and unknot recognition is decidable in principle with its complexity-class membership open \cite{corpus-61}, which places it in regime 7 and separates decidability from classification.
   264	
   265	The register therefore has a constructive use. An obstruction names the restriction a classification theorem needs. McDuff's theorem tells a would-be factor classification to restrict to the amenable class, and that restricted classification exists. Wildness tells a would-be module classification to restrict to the derived-tame side. The unrecognizability theorem tells a would-be four-manifold classification to restrict to decomposable classes. Each obstruction pairs with a restricted positive theorem, and that pairing is the working form of the program's negative results.
   266	
   267	\begin{remark}
   268	The program founding documents warn against assuming that physical theories possess a finite collection of exceptional objects analogous to the twenty-six sporadic groups \cite{corpus-1}. The sporadic groups exist and are exhaustive in the finite-simple setting, and the corresponding question for physical theories is open. The obstruction register shows what a periodic table must record where no table exists.
   269	\end{remark}
   270	
   271	\section{The realization layer}
   272	\label{sec:realization}
   273	
   274	The realization layer $\mathcal{R}$ asks which structures, once classified, are realized as physical theories. The proved content of this layer is reconstruction: objects recovered from their probes. Eight reconstruction theorems are registered.
   275	
   276	\begin{table}[htbp]
   277	\caption{The eight registered reconstruction theorems, with recovered object and scope limits. Each theorem is proved under the hypotheses stated in the source.}
   278	\label{tab:reconstruction}
   279	\small
   280	\begin{tabularx}{\textwidth}{>{\hsize=0.70\hsize\raggedright\arraybackslash}X >{\hsize=1.12\hsize\raggedright\arraybackslash}X >{\hsize=1.18\hsize\raggedright\arraybackslash}X}
   281	\toprule
   282	Theorem & Recovers & Scope limits \\
   283	\midrule
   284	Gelfand-Naimark \cite{corpus-9,corpus-42} & A concrete representation of a C*-algebra & A representation theorem, not a classification \\
   285	Gelfand duality \cite{corpus-42} & A compact Hausdorff space & The commutative side only \\
   286	Stone duality \cite{corpus-44} & A spectrum from a Boolean algebra & The Boolean side only \\
   287	Doplicher-Roberts \cite{corpus-12,corpus-15,corpus-16,corpus-67} & A compact supergroup, unique up to isomorphism & Symmetric structure, conjugates, subobjects, and $\mathrm{End}(\mathbf{1})$ equal to the scalars \\
   288	Deligne \cite{corpus-13} & A supergroup representation category & Characteristic zero and subexponential growth \\
   289	Stinespring \cite{corpus-10,corpus-11} & A minimal dilation, unique up to unitary & Normal form only, not an isomorphism classification \\
   290	Classifying-space construction \cite{corpus-17,corpus-18} & A principal bundle from a map to the classifying space & Homotopy classification \\
   291	Supermap representability \cite{corpus-40,corpus-41} & Concrete representations of categorical supermaps & Settings with channel-state duality \\
   292	\bottomrule
   293	\end{tabularx}
   294	\end{table}
   295	
   296	Reconstruction is better developed than classification. The pattern is uniform: probe data determines the object. Gelfand duality recovers a space from its commutative C*-algebra \cite{corpus-42}, Stone duality recovers a spectrum from a Boolean algebra \cite{corpus-44}, and Doplicher-Roberts reconstruction recovers a compact supergroup from a symmetric tensor *-category with the stated hypotheses \cite{corpus-12,corpus-16}. The 2024 to 2026 supermap line establishes concrete representability of categorical supermaps whenever suitable channel-state duality holds \cite{corpus-40,corpus-41}. Whether that line unifies with the Gelfand, Stone, and Naimark pattern into a single relational principle is open.
   297	
   298	\subsection{Relational characterization}
   299	
   300	Reconstruction from probes has a categorical form. The Yoneda embedding sends an object $P$ to the functor $\mathrm{Hom}(-, P)$, and the Yoneda lemma shows that an object of a locally small category is determined up to isomorphism by its relationships. The embedding is therefore a faithful mathematical representation of objects of $\mathrm{Phys}$ through their relational profiles. Its physical interpretation is open.
   301	
   302	The constraint on every relational argument in the program is stated verbatim: \emph{Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.} The embedding supplies representability and nothing else. Physical equivalence requires the chosen relation of \cref{def:equivalence}, empirical adequacy requires the selection layer, and a classification theorem requires invariants with completeness statements.
   303	
   304	Two islands support the relational program. Concrete representability of categorical supermaps is proved whenever the theory admits suitable channel-state duality \cite{corpus-40,corpus-41}. The classical reconstruction pattern of Gelfand, Stone, and Naimark recovers objects from their probe algebras \cite{corpus-42,corpus-42,corpus-44}. Whether the two islands join into one principle is open, and no argument in this paper crosses that gap.
   305	
   306	\begin{theorem}[Survey: necessity of the structure hypotheses, assembled from Etingof-Gelaki, Doplicher-Roberts, Stinespring, and the supermap results]
   307	\label{thm:hypotheses}
   308	Every registered realization or identification theorem fails or becomes open as soon as its structure hypotheses are dropped. In particular: plain tensor equivalence of representation categories does not determine the finite group; Doplicher-Roberts reconstruction requires the symmetric structure and its companion hypotheses; Stinespring data is a normal form and its Kraus rank is not an isomorphism invariant of channels; supermap representability requires channel-state duality. Consequently any identification of systems in the program must declare the layers of structure it preserves, and an identification that forgets the monoidal or symmetric layer is refuted.
   309	\end{theorem}
   310	
   311	\begin{proof}
   312	Isocategorical finite groups are non-isomorphic groups whose representation categories are equivalent as plain tensor categories \cite{corpus-12}, which refutes recovery of the group from plain tensor data and proves the last clause for that case. The Doplicher-Roberts statement is a theorem under its hypotheses, and no theorem on record covers the hypothesis-free version; the symmetric layer is load-bearing because its removal is exactly the case refuted by the counterexample. The Stinespring statement classifies completely positive maps up to minimal dilation, unique up to unitary, and Kraus rank is an invariant of that normal form only \cite{corpus-10,corpus-11}, so any claim that treats it as an isomorphism invariant of channels asserts more than the theorem. Supermap representability is proved in settings with channel-state duality \cite{corpus-40,corpus-41}, and the general case is open. Each clause is therefore either a counterexample or a recorded hypothesis gap, and the conjunctive conclusion follows.
   313	\end{proof}
   314	
   315	\Cref{thm:hypotheses} is the realization-layer form of the discipline that any equivalence record must state the structure it preserves. The braided case adds a further warning: fixed-point-net representation categories in braided Galois theory require extra soliton data beyond the braiding \cite{corpus-21}, so even a braided equivalence is not automatically sufficient.
   316	
   317	\subsection{The central test}
   318	
   319	The realization layer carries a central unanswered test. Can the proposed foundational structures reconstruct gauge connections and curvature, quantum states and observables, interacting Yang-Mills dynamics, and spacetime geometry together with gravitational dynamics, without assuming at the outset the spacetime geometry they aim to explain? Four constraints bound the current answer.
   320	
   321	The finite-groupoid and weighted-nerve constructions of emergent spacetime are concrete, and their continuum convergence conditions are not established without complete proofs. The Ryu-Takayanagi formula is a proposal argued from the AdS/CFT correspondence and verified exactly only in the three-dimensional anti-de Sitter setting with two-dimensional conformal field theory \cite{corpus-45}. Entanglement-wedge bulk reconstruction is a proved quantum-information theorem \cite{corpus-46}, so it lives at the interface of the mathematical and realization layers and is not a theorem about gravity. Tensor-network constructions prove entropy relations inside exactly solvable toys and not inside the physical duality \cite{corpus-48}, and the statement that entanglement builds spacetime is an argument rather than a theorem \cite{corpus-49}.
   322	
   323	The honest summary of the realization layer is therefore asymmetric. Reconstruction from probes is strong where the probes are algebraic or categorical. Reconstruction of interacting dynamics and of spacetime itself from primitive data remains open.
   324	
   325	\section{The empirical layer}
   326	\label{sec:empirical}
   327	
   328	The empirical layer $\mathcal{E}$ is where mathematical classification stops and observational selection begins.
   329	
   330	\begin{theorem}[Survey: classical uniqueness and quantum parametricity, assembled from Chentsov and Petz-Sudar]
   331	\label{thm:monotone}
   332	The Fisher metric is the unique Riemannian metric, up to constant factor, that is monotone under stochastic maps. Quantum monotone metrics are classified by operator monotone functions, a parametric family containing more than one element. Classical uniqueness therefore does not extend to the quantum case, and any quantum distinguishability criterion must either select within the parametric family and justify the selection or carry the family as data.
   333	\end{theorem}
   334	
   335	\begin{proof}
   336	The first statement is Chentsov's theorem \cite{corpus-52}. The second is the Petz-Sudar classification \cite{corpus-52}. The parameterizing class of operator monotone functions contains more than one element; for instance the identity function and the affine function $f(x) = (x+1)/2$ are both operator monotone and give different metrics. The uniqueness statement is therefore false in the quantum case, and the last clause follows: a criterion that names a single quantum monotone metric makes an additional choice beyond the classification theorem.
   337	\end{proof}
   338	
   339	\Cref{thm:monotone} fixes what empirical distinguishability can borrow from information geometry. In the classical case the statistical distance is canonical. In the quantum case the statistical distance is a choice inside a proved parameterization, so an observational equivalence relation built on such distances must state the choice.
   340	
   341	\subsection{Observational equivalence}
   342	
   343	Two theories that differ as mathematical descriptions may be empirically indistinguishable in an accessible regime, so observational equivalence is a further quotient that the mathematical classification does not compute. Conversely an equivalence that forgets the monoidal or symmetric layer is too coarse to be a correct identification at all, because isocategorical groups refute it \cite{corpus-12}. Any observational criterion must therefore be fine enough to respect the preserved-structure requirement and coarse enough to quotient the empirically indistinguishable.
   344	
   345	Formalizing that criterion needs an observation functor with four pieces of data: a domain of theories, a codomain of observational constraints or predictions, a composition rule with coarse-graining, and the induced equivalence classes of \cref{def:observational}. The record contains none of the four. Whether observational equivalence composes in interacting regimes is unstudied, and the positive question of what makes two descriptions one physical system is open: the isocategorical counterexample shows what is insufficient, and no reconstruction criterion for sameness exists.
   346	
   347	\subsection{The claim register}
   348	
   349	The empirical record of the realization layer is currently claim-dense, and the claim ladder keeps the rungs apart: announced, manuscript, verified, and accepted are different positions.
   350	
   351	\begin{table}[htbp]
   352	\caption{The five claim-ledger entries of the program registry, with ladder position at the status date of the registry. None is a theorem record.}
   353	\label{tab:claims}
   354	\small
   355	\begin{tabularx}{\textwidth}{>{\hsize=0.17\hsize\raggedright\arraybackslash}X >{\hsize=1.26\hsize\raggedright\arraybackslash}X >{\hsize=1.57\hsize\raggedright\arraybackslash}X}
   356	\toprule
   357	Entry & Claim & Ladder position \\
   358	\midrule
   359	CL-01 & Rigorous existence of QCD, a simplest GUT completion, and pure Yang-Mills as subproblem, Balaban-based \cite{corpus-24,corpus-25,corpus-26} & Announced, manuscript unpublished, formalization withheld, verification pending \\
   360	CL-02 & Reflection-positive four-dimensional SU(N) construction with mass gap and confinement \cite{corpus-28} & Journal-published and unverified \\
   361	CL-03 & Existence and mass gap via a five-dimensional orbifold regulator \cite{corpus-29} & Withdrawn for quality standards, no status \\
   362	CL-04 & Lattice Yang-Mills theorems in restricted regimes \cite{corpus-30,corpus-31,corpus-32} & Rigorous within stated regimes only \\
   363	CL-05 & Three-dimensional mass-gap proof outline \cite{corpus-33} & Preprint outline, no status \\
   364	\bottomrule
   365	\end{tabularx}
   366	\end{table}
   367	
   368	None of the registered claim entries resolves the four-dimensional Yang-Mills Millennium problem, which requires proving both existence of the quantum field theory and a strictly positive mass gap \cite{corpus-23}. The announced existence work explicitly omits the mass gap, lacks public artifacts, and awaits independent verification \cite{corpus-24,corpus-25,corpus-26}; it carries the status existence claimed; manuscript and formalization withheld; verification pending. The remaining entries restrict their scope to lattice approximations without establishing the continuum limit \cite{corpus-30,corpus-31,corpus-32}, confine their arguments to three dimensions \cite{corpus-33}, or remain unverified or retracted \cite{corpus-28,corpus-29}. The Clay problem page lists the problem as unsolved \cite{corpus-23}. Because constructive field theory currently lacks a demonstrated continuum mass gap, the realization layer for four-dimensional non-Abelian gauge theory remains open.
   369	
   370	A pre-claim baseline makes the ladder vivid. The 2026 survey of rigorous approaches to quantum field theory records that rigorous renormalization has never been made rigorous in the needed generality and that on the mass gap no clear path is known \cite{corpus-27}. The October 2026 existence announcement postdates that survey, contradicts its existence-side assessment, and confirms its mass-gap-side assessment \cite{corpus-24}. Independent verification before a standing committee is the step that would move the claim up the ladder \cite{corpus-25}.
   371	
   372	The register also contains frontier items with lighter status. Higher-form DHR theory exhibits an extra $Z_2$ sector not realizable by Lagrangian gauge models, recorded from a single source \cite{corpus-20}. A braided Doplicher-Roberts program constructs a global quantum gauge group \cite{corpus-22}. Braided Galois theory requires soliton data beyond the braiding \cite{corpus-21}. Each is research input, and none is load-bearing in this assembly.
   373	
   374	\section{The structural classification conjecture}
   375	\label{sec:conjecture}
   376	
   377	The organizing statement of the program is the following.
   378	
   379	\begin{conjecture}[Structural classification of admissible physical systems]
   380	\label{conj:structural}
   381	Let $\mathrm{Phys}_{\mathrm{adm}}$ denote the class of mathematically admissible physical systems satisfying explicitly stated consistency conditions. There exists a collection of fundamental structural families $\mathfrak{F} = \{\mathfrak{F}_\alpha\}_{\alpha \in A}$ and a set of admissible constructions $\mathfrak{C}$ such that
   382	\[
   383	  \mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F}_\alpha \rangle_{\mathfrak{C}}.
   384	\]
   385	\end{conjecture}
   386	
   387	The conjecture carries five proof obligations; the scoreboard in \cref{tab:obligations} is the state of the program.
   388	
   389	\begin{table}[htbp]
   390	\caption{The five proof obligations of \cref{conj:structural} and their state. Four are open and one is partial.}
   391	\label{tab:obligations}
   392	\small
   393	\begin{tabularx}{\textwidth}{>{\hsize=0.77\hsize\raggedright\arraybackslash}X >{\hsize=1.67\hsize\raggedright\arraybackslash}X >{\hsize=0.56\hsize\raggedright\arraybackslash}X}
   394	\toprule
   395	Obligation & Content & State \\
   396	\midrule
   397	Completeness & Every admissible system is represented in the family closure & Open \\
   398	Soundness & Every generated structure satisfies the admissibility conditions & Open \\
   399	Equivalence & Different representations of one system are identified correctly & Open \\
   400	Structural characterization & The fundamental families have precise definitions & Partial \\
   401	Decomposition & Systems in the targeted classes are built from the families & Open in general \\
   402	\bottomrule
   403	\end{tabularx}
   404	\end{table}
   405	
   406	\begin{definition}[Constituent invariant record]
   407	\label{def:constituent}
   408	Let $P$ admit a decomposition $P \simeq \mathcal{F}(I_1, \ldots, I_n)$ with irreducible constituents. The constituent invariant record is $\mu(P) = (\mathcal{F}, \{\mathcal{I}(I_i)\}, g_P)$: the construction data, the multiset of invariant records of \cref{def:invariants} of the constituents, and the gluing datum $g_P$ that $\mathcal{F}$ requires to assemble them. The gluing datum is extension data of the construction: a group extension $1 \to N \to G \to Q \to 1$ is recorded by a class in $H^2(Q, Z(N))$ in addition to the invariant records of $N$ and $Q$, and other constructions carry the analogous clutching or k-invariant data. Where the decomposition is unique up to order and up to equivalence of constituents, $\mu$ is well defined on $\simeq$-classes.
   409	\end{definition}
   410	
   411	\begin{proposition}[Completeness of the constituent record for two constructions]
   412	\label{thm:conditional}
   413	Let $P$ be an object assembled by one of two operations. In case (a) $P$ is a finite-dimensional complex C*-algebra written as a direct sum $P \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$, with constituents classified by their block sizes. In case (b) $P$ is a group extension $1 \to N \to P \to Q \to 1$ with a fixed action of $Q$ on $N$, with $N$ and $Q$ classified up to isomorphism and the extension class $g_P$ recorded in $H^2(Q, Z(N))$. In case (a) the multiset of block sizes is a complete invariant of $P$ up to *-isomorphism. In case (b) the pair consisting of the invariant records of $N$ and $Q$ and the extension class $g_P$ is a complete invariant of $P$ up to isomorphism of extensions. In both cases the constituent record of \cref{def:constituent} is complete, and the construction maps neither into theories nor into observation data.
   414	\end{proposition}
   415	
   416	\begin{proof}
   417	In case (a) the block sizes are the dimensions of the simple modules of $P$, which are invariant under *-isomorphism, and they determine the algebra by the structure theorem \cite{corpus-9,corpus-42}; this is \cref{lem:blocks}. In case (b) the classification of group extensions with a fixed action states that isomorphism classes of extensions of $Q$ by $N$ correspond bijectively to classes in $H^2(Q, Z(N))$, and an isomorphism of extensions preserves the class while a shared class builds an isomorphism of extensions \cite{corpus-72}. In both cases the record $\mu(P)$ therefore determines $P$ up to the stated equivalence. Neither construction outputs a theory or an observation, so the non-collapse argument of Section~3 leaves realization and selection unconstructed.
   418	\end{proof}
   419	
   420	\begin{remark}[Generation and classification]
   421	\label{rem:incompat}
   422	The five obligations concern generation, admissibility, identification, family definitions, and decomposition, and \cref{thm:obstructions} concerns classification by finite or parametric invariants and by algorithms. The two objectives do not contradict each other: finitely presented groups are generated from cyclic groups by free products and quotients, and their Markov properties are algorithmically undecidable \cite{corpus-53}. The objectives meet only in regimes 1 and 2 of \cref{tab:regimes}, where constituents carry classifying invariants and \cref{thm:conditional} applies. In the sectors of \cref{thm:obstructions} the classification-layer objective of \cref{def:layers} is unattainable without restricting the class or weakening the invariant notion.
   423	\end{remark}
   424	
   425	\Cref{thm:conditional} covers the two constructions where extension theory is established. The analogous completeness statement for the remaining admissible constructions is conditional on the five obligations of \cref{conj:structural}, of which one is partial and four are open, and on uniqueness of decomposition, which the program leaves open; it is not claimed here. Its conclusion would stop at the mathematical layer. The regime analysis of \cref{sec:mathlayer} bounds its scope further: inside a target class, the classifying data must live in a regime of \cref{tab:regimes} where invariants are finite or explicitly parameterized, and outside those regimes \cref{thm:obstructions} forbids the classification the conjecture would deliver.
   426	
   427	\begin{remark}
   428	The conjecture may also fail. The founding program records that proving either a complete classification of a specified class or the impossibility of natural classification objectives without additional restrictions is a meaningful mathematical result. The obstruction register already delivers the second kind of result in six sectors.
   429	\end{remark}
   430	
   431	\section{Worked examples}
   432	\label{sec:examples}
   433	
   434	The examples trace one classical, one quantum, and one gauge system through the three layers. Each separates $\mathcal{M}$, $\mathcal{R}$, and $\mathcal{E}$ and shows where the proved content ends.
   435	
   436	\subsection{Finite-dimensional quantum systems}
   437	
   438	Let $A = \mathbb{C} \oplus M_2(\mathbb{C})$, the complex C*-algebra with one one-dimensional block and one two-dimensional block. At the mathematical layer, $A$ is classified by its dimension vector, the multiset of matrix sizes, here $\{1, 2\}$: any finite-dimensional complex C*-algebra is isomorphic to a direct sum of matrix blocks, and the multiset of block sizes determines the algebra up to *-isomorphism \cite{corpus-9,corpus-42}.
   439	
   440	\begin{lemma}[Uniqueness of the block decomposition]
   441	\label{lem:blocks}
   442	Every finite-dimensional complex C*-algebra $A$ admits a decomposition $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ with the multiset $\{n_1, \ldots, n_k\}$ uniquely determined by $A$. For the example algebra the multiset is $\{1, 2\}$, and any decomposition into irreducible blocks realizes it.
   443	\end{lemma}
   444	
   445	\begin{proof}
   446	Existence is the structure theorem for finite-dimensional C*-algebras \cite{corpus-9}. Uniqueness of the multiset follows because the block sizes are recovered from $A$ as the dimensions of its simple modules, and simple modules are invariant under *-isomorphism. For $A = \mathbb{C} \oplus M_2(\mathbb{C})$ the simple modules have dimensions one and two, so every decomposition into irreducible summands has block sizes $\{1, 2\}$ up to order.
   447	\end{proof}
   448	
   449	The blocks $M_{n_i}(\mathbb{C})$ are the irreducible constituents under the direct-sum construction, so this example displays decomposition and irreducibility exactly as \cref{def:irreducible} requires, and \cref{lem:blocks} shows the decomposition unique in this restricted class.
   450	
   451	At the realization layer, $A$ acts on a Hilbert space and states are density matrices on $\mathbb{C} \oplus \mathbb{C}^2$. The representation is the standard one from the Gelfand-Naimark embedding \cite{corpus-42}, which is a representation theorem and not a classification theorem; the classification content is the dimension vector from the layer above.
   452	
   453	At the empirical layer, measurement statistics on states define distinguishability. The classical statistical distance is canonical by \cref{thm:monotone}, and the quantum statistical distance is one choice inside the parametric family of operator monotone functions. Two admissible choices give two inequivalent distinguishability structures on the same classified algebra, so the empirical layer carries data the mathematical layer does not determine.
   454	
   455	\subsection{Classical mechanics}
   456	
   457	Let $(M, \omega)$ be a symplectic manifold with Hamiltonian dynamics. At the mathematical layer, Darboux's theorem removes all local invariants \cite{corpus-6}, so the classifying data is global: the topology of $\omega$ and its cohomology class are candidate data, and Poisson geometry adds Weinstein splitting, the symplectic-leaf foliation, and coadjoint orbits for the Kirillov-Kostant-Souriau case \cite{corpus-7,corpus-68}. Local classification is complete and trivial, and the classification content is entirely global.
   458	
   459	At the realization layer, Hamiltonian vector fields realize the dynamics and the observable algebra is the algebra of smooth functions on $M$. At the empirical layer, the Fisher metric is the unique monotone metric up to constant factor \cite{corpus-52}, so classical statistical distinguishability is canonical. The bridge from this family to the quantum family through deformation quantization is a programmatic link and not an equivalence theorem, so no classical-to-quantum conclusion crosses the layer boundary.
   460	
   461	\subsection{Gauge theory and the claim register}
   462	
   463	Let $P \to X$ be a principal $G$-bundle with connection. At the mathematical layer, principal bundles are classified by homotopy classes of maps into the classifying space $BG$, and characteristic classes are pullbacks of universal classes \cite{corpus-17,corpus-18}. Anomalies are classified as obstruction classes: quantization exists exactly when the relevant classes vanish \cite{corpus-19}. This is regime 3, complete as obstruction, and it is the volume's sharpest example of classification content that is an impossibility statement.
   464	
   465	At the realization layer, the reconstruction of an interacting four-dimensional quantum field theory from such data is claimed rather than established. The announced existence result carries the status existence claimed; manuscript and formalization withheld; verification pending \cite{corpus-24,corpus-25}. At the empirical layer, the mass gap remains open \cite{corpus-23}, lattice theorems hold only in restricted regimes \cite{corpus-30,corpus-31,corpus-32}, and no entry of \cref{tab:claims} closes the continuum limit. The example therefore shows the three layers in three different states: proved at $\mathcal{M}$, claimed at $\mathcal{R}$, open at $\mathcal{E}$.
   466	
   467	\section{Requirements for a unified framework}
   468	\label{sec:requirements}
   469	
   470	A unified structural theory of mathematical physics would need eight deliverables, and the assembly names each one precisely.
   471	
   472	\begin{table}[htbp]
   473	\caption{The eight deliverables a unified framework requires, with the current state of each.}
   474	\label{tab:requirements}
   475	\small
   476	\begin{tabularx}{\textwidth}{>{\hsize=0.74\hsize\raggedright\arraybackslash}X >{\hsize=1.26\hsize\raggedright\arraybackslash}X}
   477	\toprule
   478	Deliverable & Current state \\
   479	\midrule
   480	Admissibility conditions defining the target class & Unfixed, so statements over the class are conditional \\
   481	Preservation laws and composition rules for morphisms & Unfixed, so the ambient category is a schema \\
   482	A chosen physical equivalence with declared preserved structure & Open, constrained by the isocategorical counterexample \\
   483	A constructed realization map from structures to theories & Stipulated only \\
   484	A constructed selection map from theories to observations & Not constructed in the record \\
   485	Regime-appropriate objectives & Established by the regime analysis of \cref{tab:regimes} and by \cref{thm:obstructions} \\
   486	A verification layer for the registered proofs & No record carries a completed proof-assistant check \\
   487	Criteria for physical validation of the architecture & Open, level named but its criteria unstated \\
   488	\bottomrule
   489	\end{tabularx}
   490	\end{table}
   491	
   492	The first three deliverables are definitional. Until the admissibility conditions are fixed, every theorem over the admissible class is conditional on the chosen conditions. Until the morphism rules are fixed, the ambient category is a schema, and any theorem must state which morphism classes are in force. The equivalence must name the structure it preserves, and the isocategorical counterexample shows what happens otherwise \cite{corpus-12}.
   493	
   494	The fourth and fifth deliverables are constructions, and neither exists in the record. The realization map is stipulated as an arrow in the architecture and never built; the selection map has no definition of its observation object, no domain, no codomain, and no composition rule with coarse-graining. Until both are built, the identity of \cref{thm:conditional} stops at the mathematical layer.
   495	
   496	The sixth deliverable is what this paper supplies. Restricted classification theorems are the right objective where invariants are finite or explicitly parameterized, and obstruction theorems are the right objective everywhere else. A rigorous impossibility result is a valuable outcome of the program, not a consolation.
   497	
   498	The seventh deliverable is verification. No proof in the series has been checked by a proof-assistant kernel. The executable taxonomy code in the source directory is computational evidence: it is validated against stated specifications and has not been checked by a kernel. The verification directory records ten mechanization targets matching the definitions and theorems above. Mechanization is future work.
   499	
   500	The eighth deliverable is the hardest. Physical validation would require empirical criteria that the architecture could pass and its rivals fail. The corpus names the level and does not fix its criteria. Until those criteria exist, the architecture is a mathematical research program with proved components and an unvalidated assembly.
   501	
   502	\section{Limitations}
   503	\label{sec:limitations}
   504	
   505	Four limitations bound this synthesis. The assembly inherits the statuses of the program registry, and any status revision propagates. Three entries rest on single sources and were not independently re-verified here: the extra $Z_2$ sector of higher-form DHR theory \cite{corpus-20}, the journal-published mass-gap claim \cite{corpus-28}, and the Borel-reducibility obstruction announced at the survey level \cite{corpus-59}. The literature survey behind the registry ran on the arXiv API plus known-URL fetches, so non-arXiv venues may be under-covered, and absence of a citation here is not evidence of absence. The regime taxonomy organizes the registered domains and proves a coverage statement about them; it does not classify all of mathematics.
   506	
   507	The formal statements of this paper are assembly results: coverage statements about a finite registry, reductions to the registered impossibility theorems, necessity statements about structure hypotheses, and one conditional reduction. No new classifying invariant is introduced.
   508	
   509	\section{Conclusion}
   510	
   511	The assembly establishes four things. Every domain of the program comparison spine sits in exactly one classification regime, fifteen of them with finite or explicitly parameterized invariants and complete classification theorems. Seven obstruction theorems forbid classification in the wild, non-amenable, and undecidable sectors, so classification objectives must match regimes. Every realization and identification theorem fails or becomes open when its structure hypotheses are dropped, so identifications must declare preserved structure. And the structural classification conjecture, under its five obligations, would complete the mathematical layer for a targeted class while leaving realization and selection untouched.
   512	
   513	What remains uncertain is equally sharp. The admissibility conditions are unfixed. The physical equivalence is unchosen. The realization and selection maps are stipulated and not constructed. The announced four-dimensional existence result carries the status existence claimed; manuscript and formalization withheld; verification pending, and the mass gap is open. No record carries a completed computer-checked proof. The central test of the realization layer, reconstruction of interacting dynamics and spacetime without presupposing spacetime, is unanswered.
   514	
   515	What follows is the founding program's own calibration. The architecture is precise enough to organize a substantial long-term mathematical research program, and its components produce valuable results even if a universal classification theorem proves unattainable. The program should be prepared to prove either that a specified class admits a complete classification or that certain natural classification objectives are impossible without additional restrictions. Both are meaningful mathematical results, and the obstruction register has already begun to deliver the second.
   516	
   517	\appendix
   518	\section{Code evidence}
   519	\label{app:code}
   520	
   521	The computational artifacts of this volume record the bookkeeping claims of the assembly and the finite-dimensional example of \cref{sec:examples}. The two files perform automated registry auditing and bookkeeping and exercise the worked example; they verify no mathematics. Both files accompany this paper in the CMRPS project repository at \url{https://github.com/YonedaAI/cmrps}, under \texttt{src/vol-12-principia-physica}. \Cref{tab:code} maps each computational claim to the file and function that exercises it.
   522	
   523	\begin{table}[htbp]
   524	\caption{Code evidence for the computational claims of this paper. Each row names the file and function under the computational source directory of this volume.}
   525	\label{tab:code}
   526	\footnotesize
   527	\begin{tabularx}{\textwidth}{>{\hsize=1.02\hsize\raggedright\arraybackslash}X >{\hsize=0.99\hsize\raggedright\arraybackslash}X >{\hsize=0.99\hsize\raggedright\arraybackslash}X}
   528	\toprule
   529	Computational claim & Function & File \\
   530	\midrule
   531	Regime counts of \cref{tab:regimes} are 15, 1, 1, 7, 3, 1, 1 & \texttt{regime\_counts} & \texttt{phase\_d\_registry\_audit.py} \\
   532	The obligation scoreboard of \cref{tab:obligations} is four open and one partial & \texttt{obligation\_scoreboard} & \texttt{phase\_d\_registry\_audit.py} \\
   533	Registry record counts are 20 background, 7 obstruction, 7 open problem, and 5 claim-ledger entries & \texttt{record\_counts} & \texttt{phase\_d\_registry\_audit.py} \\
   534	No registry record reaches evidence grade 3 & \texttt{layer\_separation} & \texttt{phase\_d\_registry\_audit.py} \\
   535	The dimension vector $\{1,2\}$ classifies the example algebra up to block order & \texttt{dimensionVectorExample} & \texttt{Instances.hs} \\
   536	The example algebra decomposes into two irreducible matrix blocks & \texttt{decompositionExample} & \texttt{Instances.hs} \\
   537	\bottomrule
   538	\end{tabularx}
   539	\end{table}
   540	
   541	\begin{thebibliography}{72}
   542	\small
   543	
   544	\bibitem[1]{corpus-1} D. Gorenstein, R. Lyons, and R. Solomon, The classification of the finite simple groups, Mathematical Surveys and Monographs 40.1, American Mathematical Society (1994). ISBN 0-8218-0960-1.
   545	
   546	\bibitem[2]{corpus-2} R. Solomon, A brief history of the classification of the finite simple groups, Bulletin of the American Mathematical Society 38 (2001) 315-352. \url{https://www.ams.org/journals/bull/2001-38-03/S0273-0979-01-00909-0/}
   547	
   548	\bibitem[3]{corpus-3} J. H. Conway, R. T. Curtis, S. P. Norton, R. A. Parker, and R. A. Wilson, Atlas of finite groups, Clarendon Press (1985). ISBN 0-19-853199-0.
   549	
   550	\bibitem[4]{corpus-4} J. E. Humphreys, Introduction to Lie algebras and representation theory, Springer (1972). ISBN 3-540-90052-7.
   551	
   552	\bibitem[5]{corpus-5} W. Fulton and J. Harris, Representation theory, Springer (1991). ISBN 978-1-4612-0979-9.
   553	
   554	\bibitem[6]{corpus-6} V. I. Arnold, Mathematical methods of classical mechanics, Springer (1980).
   555	
   556	\bibitem[7]{corpus-7} J. E. Marsden and T. S. Ratiu, Introduction to mechanics and symmetry, Springer (1994). ISBN 978-1-4757-5587-9.
   557	
   558	\bibitem[8]{corpus-8} M. Takesaki, Theory of operator algebras I, Springer (2001). ISBN 3-540-42248-X.
   559	
   560	\bibitem[9]{corpus-9} G. J. Murphy, C*-algebras and operator theory, Academic Press (1990). ISBN 978-0-12-511360-1.
   561	
   562	\bibitem[10]{corpus-10} W. F. Stinespring, Positive functions on C*-algebras, Proceedings of the American Mathematical Society 6 (1955) 211-216. DOI 10.2307/2032342.
   563	
   564	\bibitem[11]{corpus-11} A. S. Holevo, Quantum systems, channels, information, De Gruyter (2012). ISBN 3-11-027340-3.
   565	
   566	\bibitem[12]{corpus-12} S. Doplicher and J. E. Roberts, Endomorphisms of C*-algebras, cross products and duality for compact groups, Annals of Mathematics 130 (1989). DOI 10.2307/1971477.
   567	
   568	\bibitem[13]{corpus-13} P. Etingof, S. Gelaki, D. Nikshych, and V. Ostrik, Tensor categories, Mathematical Surveys and Monographs 205, American Mathematical Society (2015). ISBN 978-1-4704-2024-6.
   569	
   570	\bibitem[14]{corpus-14} P. Etingof, D. Nikshych, and V. Ostrik, On fusion categories, Annals of Mathematics 162 (2005) 581-642. DOI 10.4007/annals.2005.162.581.
   571	
   572	\bibitem[15]{corpus-15} R. Haag and D. Kastler, An algebraic approach to quantum field theory, Journal of Mathematical Physics 5 (1964) 848-861. DOI 10.1063/1.1704187.
   573	
   574	\bibitem[16]{corpus-16} S. Doplicher, R. Haag, and J. E. Roberts, Local observables and particle statistics I, Communications in Mathematical Physics 23 (1971) 199-230. DOI 10.1007/bf01877742.
   575	
   576	\bibitem[17]{corpus-17} D. Husemoller, Fibre bundles, Springer (1966). ISBN 0-387-90103-5.
   577	
   578	\bibitem[18]{corpus-18} J. Milnor and J. Stasheff, Characteristic classes, Princeton University Press (1974). ISBN 1-4008-8182-X.
   579	
   580	\bibitem[19]{corpus-19} R. A. Bertlmann, Anomalies in quantum field theory, Clarendon Press (1996). ISBN 978-0-19-852047-4.
   581	
   582	\bibitem[20]{corpus-20} H. Casini and N. Magan, arXiv:2511.21810 (2025). \url{https://arxiv.org/abs/2511.21810}
   583	
   584	\bibitem[21]{corpus-21} M. M\"uger, arXiv:math-ph/0008027 (2000). \url{https://arxiv.org/abs/math-ph/0008027}
   585	
   586	\bibitem[22]{corpus-22} G. Pinzari, arXiv:2502.06229 (2026). \url{https://arxiv.org/abs/2502.06229}
   587	
   588	\bibitem[23]{corpus-23} Yang-Mills and the mass gap, Clay Mathematics Institute. \url{https://www.claymath.org/millennium/yang-mills-the-maths-gap/}
   589	
   590	\bibitem[24]{corpus-24} Building scientific understanding with academic communities, OpenAI (2026). \url{https://openai.com/index/building-scientific-understanding-with-academic-communities/}
   591	
   592	\bibitem[25]{corpus-25} Yang-Mills working group statement, Kavli Institute for Theoretical Physics (2026). \url{https://www.kitp.ucsb.edu/sites/default/files/YM_working_group.pdf}
   593	
   594	\bibitem[26]{corpus-26} Dueling proofs from OpenAI and Anthropic astound scientists, Scientific American (2026). \url{https://www.scientificamerican.com/article/dueling-proofs-from-openai-and-anthropic-astound-scientists/}
   595	
   596	\bibitem[27]{corpus-27} M. Douglas, Nature Reviews Physics 8 (2026) 86-97. \url{https://www.nature.com/articles/s42254-025-00909-2}
   597	
   598	\bibitem[28]{corpus-28} M. Faizal and A. Shabir, arXiv:2606.19362 (2026). \url{https://arxiv.org/abs/2606.19362}
   599	
   600	\bibitem[29]{corpus-29} A. Jacobsen, arXiv:2506.00284 (2025), withdrawn. \url{https://arxiv.org/abs/2506.00284}
   601	
   602	\bibitem[30]{corpus-30} A. Nissim, arXiv:2510.22788 (2025). \url{https://arxiv.org/abs/2510.22788}
   603	
   604	\bibitem[31]{corpus-31} Y. Cao, A. Nissim, and S. Sheffield, arXiv:2509.04688 (2025). \url{https://arxiv.org/abs/2509.04688}
   605	
   606	\bibitem[32]{corpus-32} P. Faria da Veiga and M. O'Carroll, arXiv:2509.03513 (2025). \url{https://arxiv.org/abs/2509.03513}
   607	
   608	\bibitem[33]{corpus-33} S. Nair, arXiv:2608.10133 (2026). \url{https://arxiv.org/abs/2608.10133}
   609	
   610	\bibitem[34]{corpus-34} J. Baez and J. Dolan, arXiv:q-alg/9503002 (1995). \url{https://arxiv.org/abs/q-alg/9503002}
   611	
   612	\bibitem[35]{corpus-35} J. Lurie, arXiv:0905.0465 (2009). \url{https://arxiv.org/abs/0905.0465}
   613	
   614	\bibitem[36]{corpus-36} M. Atiyah, Topological quantum field theory, Publications Math\'ematiques de l'IH\'ES 68 (1988) 175-186. DOI 10.1007/bf02698547.
   615	
   616	\bibitem[40]{corpus-40} Wilson, Hefford, and Hoffreumon, Supermaps on generalised theories, arXiv:2602.23865 (2026). \url{https://arxiv.org/abs/2602.23865}
   617	
   618	\bibitem[41]{corpus-41} Hefford and Wilson, A profunctorial semantics for quantum supermaps, arXiv:2402.02997 (2024). \url{https://arxiv.org/abs/2402.02997}
   619	
   620	\bibitem[42]{corpus-42} I. M. Gelfand and M. Neumark, On the imbedding of normed rings into the ring of operators in Hilbert space, Matematicheskii Sbornik 12 (1943) 197-213, reprinted in Contemporary Mathematics 167 (1994) 213-216. DOI 10.1090/conm/167/16.
   621	
   622	
   623	\bibitem[44]{corpus-44} M. H. Stone, Applications of the theory of Boolean rings to general topology, Transactions of the American Mathematical Society 41 (1937) 375-481. DOI 10.1090/s0002-9947-1937-1501905-7.
   624	
   625	\bibitem[45]{corpus-45} Ryu and Takayanagi, Holographic derivation of entanglement entropy from AdS/CFT, arXiv:hep-th/0603001 (2006). \url{https://arxiv.org/abs/hep-th/0603001}
   626	
   627	\bibitem[46]{corpus-46} Dong, Harlow, and Wall, Reconstruction of bulk operators within the entanglement wedge in gauge-gravity duality, arXiv:1601.05416 (2016). \url{https://arxiv.org/abs/1601.05416}
   628	
   629	\bibitem[47]{corpus-47} Bao, Nezami, Ooguri, Stoica, Sully, and Walter, The holographic entropy cone, arXiv:1505.07839 (2015). \url{https://arxiv.org/abs/1505.07839}
   630	
   631	\bibitem[48]{corpus-48} Pastawski, Yoshida, Harlow, and Preskill, Holographic quantum error-correcting codes: toy models for the bulk/boundary correspondence, arXiv:1503.06237 (2015). \url{https://arxiv.org/abs/1503.06237}
   632	
   633	\bibitem[49]{corpus-49} M. Van Raamsdonk, Building up spacetime with quantum entanglement, arXiv:1005.3035 (2010). \url{https://arxiv.org/abs/1005.3035}
   634	
   635	\bibitem[50]{corpus-50} E. Minguzzi and M. S\'anchez, arXiv:gr-qc/0609119 (2006). \url{https://arxiv.org/abs/gr-qc/0609119}
   636	
   637	\bibitem[51]{corpus-51} A. Galaev, arXiv:1611.01551 (2016). \url{https://arxiv.org/abs/1611.01551}
   638	
   639	\bibitem[52]{corpus-52} D. Petz and C. Sud\'ar, arXiv:quant-ph/0102132 (2001). \url{https://arxiv.org/abs/quant-ph/0102132}
   640	
   641	\bibitem[53]{corpus-53} M. O. Rabin, Recursive unsolvability of group theoretic problems, Annals of Mathematics 67 (1958) 172-194. DOI 10.2307/1969933.
   642	
   643	\bibitem[54]{corpus-54} M. Tancer, arXiv:2310.07421 (2023). \url{https://arxiv.org/abs/2310.07421}
   644	
   645	\bibitem[55]{corpus-55} V. Bekkert and Y. Drozd, arXiv:math/0310352 (2003). \url{https://arxiv.org/abs/math/0310352}
   646	
   647	\bibitem[56]{corpus-56} R.-O. Buchweitz and G. Leuschke, arXiv:math/0505315 (2005). \url{https://arxiv.org/abs/math/0505315}
   648	
   649	\bibitem[57]{corpus-57} J. Grochow and Y. Qiao, arXiv:1507.01917 (2015). \url{https://arxiv.org/abs/1507.01917}
   650	
   651	\bibitem[58]{corpus-58} J. Grevstad and J. May, arXiv:2509.17604 (2025). \url{https://arxiv.org/abs/2509.17604}
   652	
   653	\bibitem[59]{corpus-59} R. Sasyk and A. T\o rnquist, arXiv:0909.2657 (2009). \url{https://arxiv.org/abs/0909.2657}
   654	
   655	\bibitem[60]{corpus-60} W. P. Thurston, Three dimensional manifolds, Kleinian groups and hyperbolic geometry, Bulletin of the American Mathematical Society 6 (1982) 357-381. DOI 10.1090/s0273-0979-1982-15003-0.
   656	
   657	\bibitem[61]{corpus-61} J. Hass, J. C. Lagarias, and N. Pippenger, The computational complexity of knot and link problems, Journal of the ACM 46 (1999). DOI 10.1145/301970.301971.
   658	
   659	
   660	
   661	\bibitem[62]{corpus-62} F. J. Murray and J. von Neumann, On rings of operators IV, Annals of Mathematics 44 (1943) 716-808. DOI 10.2307/1969107.
   662	
   663	
   664	\bibitem[64]{corpus-64} A. Connes, Classification of injective factors, Annals of Mathematics 104 (1976) 73-115. DOI 10.2307/1971057.
   665	
   666	\bibitem[65]{corpus-65} D. McDuff, Uncountably many II$_1$ factors, Annals of Mathematics 90 (1969) 361-371. DOI 10.2307/1970730.
   667	
   668	
   669	\bibitem[67]{corpus-67} S. Doplicher and J. E. Roberts, A new duality theory for compact groups, Inventiones Mathematicae 98 (1989) 157-218. DOI 10.1007/bf01388849.
   670	
   671	\bibitem[68]{corpus-68} A. Weinstein, The local structure of Poisson manifolds, Journal of Differential Geometry 18 (1983) 523-557. DOI 10.4310/jdg/1214437787.
   672	
   673	
   674	\bibitem[70]{corpus-70} G. Perelman, The entropy formula for the Ricci flow and its geometric applications, arXiv:math/0211159 (2002). \url{https://arxiv.org/abs/math/0211159}
   675	
   676	
   677	\bibitem[71]{corpus-71} M. Lackenby, The efficient certification of knottedness and Thurston norm, Advances in Mathematics 389 (2021). DOI 10.1016/j.aim.2021.107796.
   678	
   679	\bibitem[72]{corpus-72} K. S. Brown, Cohomology of groups, Springer (1982). ISBN 978-1-4684-9328-3.
   680	
   681	\end{thebibliography}
   682	
   683	\end{document}

exec
/usr/local/bin/zsh -lc "sed -n '179,467{=;p;}' papers/latex/vol-12-principia-physica.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
179
A complete mathematical classification $\mathcal{M}$ leaves empirical selection $\mathcal{E}$ underdetermined whenever distinct mathematical models yield identical observational predictions. Because the mathematical, realization, and empirical layers possess distinct domains and quotient structures, each layer imposes independent constraints on physical admissibility.
180

181
\section{The mathematical layer}
182
\label{sec:mathlayer}
183

184
The mathematical layer $\mathcal{M}$ is where the evidence base is strongest. It is also where the limits of classification are theorems rather than difficulties. \Cref{tab:regimes} assigns every domain of the program comparison spine to a regime of \cref{def:regimes}.
185

186
\begin{table}[htbp]
187
\caption{The twenty-eight domains of the program comparison spine and the unknot-recognition boundary case, with classifying invariant and classification regime. Regime 1 is complete and parameterized, 2 is complete but unparameterized, 3 is complete as obstruction, 4 is open or claimed, 5 is impossible in the stated generality, 6 is undecidable, and 7 is decidable but unclassified.}
188
\label{tab:regimes}
189
\small
190
\begin{tabularx}{\textwidth}{>{\hsize=0.94\hsize\raggedright\arraybackslash}X >{\hsize=1.06\hsize\raggedright\arraybackslash}X c}
191
\toprule
192
Domain & Classifying invariant & Regime \\
193
\midrule
194
Finite simple groups & Character table and companion atlas data & 2 \\
195
Simple Lie groups and Lie algebras & Dynkin and Satake diagrams & 1 \\
196
Irreducible representations of semisimple Lie algebras & Dominant integral weights & 1 \\
197
Symplectic manifolds in the local category & The empty local invariant & 1 \\
198
Poisson manifolds in the local category & Weinstein splitting data & 1 \\
199
Finite-dimensional complex C*-algebras & Dimension vector & 1 \\
200
Amenable factors & Murray-von Neumann type and Connes invariants & 1 \\
201
General type~$\mathrm{II}$ and type~$\mathrm{III}$ factors & Coarse Connes-spectrum strata only & 5 \\
202
Quantum channels & Kraus rank as normal-form data & 4 \\
203
Principal $G$-bundles & Homotopy classes of maps into the classifying space & 1 \\
204
Anomalies & Cohomological obstruction classes & 3 \\
205
DHR superselection sectors & Compact supergroup from the reconstruction & 1 \\
206
Symmetric tensor categories of subexponential growth & Supergroup representation category & 1 \\
207
Fusion categories & Weak Hopf algebra presentation & 4 \\
208
Extended topological quantum field theories & Fully dualizable objects & 4 \\
209
Lorentzian holonomy groups & Holonomy group & 1 \\
210
Spacetime causality conditions & Causal class on the causal ladder & 1 \\
211
Holographic entropy cone with at most four regions & Subadditivity and monogamy inequality data & 1 \\
212
Holographic entropy cone with five or more regions & One infinite inequality family known & 4 \\
213
Monotone metrics in the classical case & Fisher metric up to constant & 1 \\
214
Monotone metrics in the quantum case & Operator monotone functions (infinite parameter class) & 1 \\
215
Emergent spacetime and the Ryu-Takayanagi formula & No established invariant & 4 \\
216
Four-dimensional Yang-Mills and QCD existence & Balaban-program methods & 4 \\
217
Four-dimensional Yang-Mills mass gap & No invariant established & 4 \\
218
Closed three-manifolds & Thurston geometry type & 1 \\
219
Four-manifolds & Restricted classes only & 5 \\
220
Finitely presented groups under Markov properties & No invariant can exist & 6 \\
221
Wild representation categories & No finite-variety parameterization exists & 5 \\
222
Unknot recognition & Decidable with complexity class open & 7 \\
223
\bottomrule
224
\end{tabularx}
225
\end{table}
226

227
The twenty-nine rows of \cref{tab:regimes} carry the regime counts $15, 1, 1, 7, 3, 1, 1$ over regimes 1 to 7. Every regime-1 domain carries a finite or explicitly parameterized classifying invariant; parameter classes range from dimension vectors to the infinite class of operator monotone functions. Every domain whose objects include wild, non-amenable, or algorithmically unrecognizable sectors lies in regime 4, 5, or 6, and none of those domains carries a classification theorem. The counts hold by inspection of the table, where row 29 carries regime 7. Regime~1 contains the rows for simple Lie theory \cite{corpus-4}, its representation theory \cite{corpus-5}, local symplectic and Poisson geometry, finite-dimensional C*-algebras, amenable factors, principal bundles, DHR sectors, subexponential symmetric tensor categories, Lorentzian holonomy, the causal ladder, the at-most-four-region entropy cone, monotone metrics, and closed three-manifolds. Each invariant listed for those rows is finite data or parametric data: diagrams, weights, dimension vectors, types and Connes invariants, homotopy-class data, supergroup data, holonomy groups, causal classes, inequality data, metrics up to constant, and geometry type. Regime~2 is finite simple groups, where the classification theorem exists and no uniform parameterization is known. Regime~3 is anomalies, where the classification content is the obstruction classes. Regime~4 contains quantum channels, fusion categories, extended topological field theories, the entropy cone from five regions up, emergent spacetime, and the two Yang-Mills rows. Regime~5 contains general type~$\mathrm{II}$ and type~$\mathrm{III}$ factors \cite{corpus-8}, four-manifolds \cite{corpus-54}, and wild representation categories \cite{corpus-55,corpus-56,corpus-58}. Regime~6 contains Markov properties of finitely presented groups \cite{corpus-53}. The wild, non-amenable, and unrecognizable sectors appear exactly in rows that \cref{thm:obstructions} below covers, and those rows carry partial data or nothing at all where a classification theorem would sit.
228

229
The regime-4 rows are partial in four distinct ways. Quantum channels carry only normal-form data \cite{corpus-10,corpus-11}. Fusion categories are open \cite{corpus-14}. Extended topological quantum field theories are claimed through the cobordism hypothesis \cite{corpus-34}, whose 2009 proof is an informal sketch \cite{corpus-35}, while functorial topological field theory is tractable under the Atiyah axioms \cite{corpus-36}. The entropy cone from five regions up has one infinite inequality family and no complete list \cite{corpus-47}. The two Yang-Mills rows carry the claim register of \cref{tab:claims}.
230

231
\begin{remark}
232
Row 21 records a proved parametric classification: quantum monotone metrics are classified by operator monotone functions \cite{corpus-52}. The parameter class here is an infinite-dimensional class of functions, not the finite or discrete data of the other regime-1 rows, and uniqueness fails in the quantum case. The program periodic table lists the same domain among open classification problems because the classification is not a finite list. Both statements stand together: the classification theorem is proved, and the classification is not finite.
233
\end{remark}
234

235
Within the evidence base, classification is sharp exactly where the invariant is finite or explicitly parameterized, and the classification content can be entirely global. Every regime-1 and regime-2 row of \cref{tab:regimes} has a finite or explicitly parameterized invariant, and the domains without such invariants are exactly the domains with no classification theorem. The global character of symplectic classification is Darboux's theorem \cite{corpus-6}: any two symplectic manifolds of the same dimension are locally symplectomorphic, so the local invariant is empty and the classifying data must be global. The contrast with Riemannian geometry, where curvature supplies local invariants, is structural rather than incidental.
236

237
\subsection{Classification, parameterization, and recognition}
238

239
Three classification achievements are often conflated. A parameterization assigns uniform finite data to each object. A classification lists the objects exhaustively. A recognition procedure identifies an object algorithmically from companion data.
240

241
The classification of finite simple groups delivers the second achievement and only part of the third. The list of families and sporadic groups is complete \cite{corpus-1,corpus-2}, and practical identification runs through companion data of atlas type: order, Schur multiplier, outer automorphism group, presentations, and character tables with power maps \cite{corpus-3}. No clean uniform parameterization analogous to Dynkin diagrams is known \cite{corpus-1}. The template program itself therefore sits in regime 2 of \cref{def:regimes}, and a periodic table of physical structures cannot expect more from its analogy than the template delivers.
242

243
The analogy between the two classification problems is architectural rather than evidentiary. The finite simple groups share one definition; physical systems have no universally accepted mathematical definition, and the schema of \cref{def:representation} is a candidate. The founding documents warn against assuming that physical theories possess a finite collection of exceptional objects analogous to the twenty-six sporadic groups \cite{corpus-1}. Exceptional mathematics exists and the taxonomy must accommodate it: the exceptional Lie algebras \cite{corpus-4}, the type~$\mathrm{III}$ factors and the hyperfinite II$_1$ factor \cite{corpus-8}, the eight Thurston geometries \cite{corpus-60}, and the isocategorical group pairs \cite{corpus-12}. Whether any two of the ten families of \cref{tab:families} are logically independent is open, and no theorem on record settles it.
244

245
\section{Obstruction theorems}
246
\label{sec:obstructions}
247

248
Obstructions are theorems. Seven of them are registered, and each forbids a classification objective that one might otherwise pursue.
249

250
\begin{theorem}[Survey: non-classification outside tame regimes, assembled from McDuff, Adyan-Rabin, the wildness results, Tancer, Etingof-Gelaki, and Grochow-Qiao]
251
\label{thm:obstructions}
252
The following classification objectives are forbidden by proved results. Separable type~$\mathrm{II}_1$ factors admit no total classification outside the amenable case, and their isomorphism relation admits no classification by countable invariants. Wild representation categories admit no finite-variety parameterization. Markov properties of finitely presented groups, including finiteness and simplicity, are algorithmically undecidable. Homeomorphism of compact four-manifolds is algorithmically unrecognizable in general. A finite group is not determined by its representation category as a plain tensor category. Group isomorphism admits no polynomial-time algorithm in wild regimes under standard complexity assumptions, while tame extensions do. Consequently any classification theorem in the program must either restrict its class to a tame regime or weaken its invariant notion, and a global periodic table covering all families cannot exist outside tame regimes.
253
\end{theorem}
254

255
\begin{proof}
256
The first statement is McDuff's theorem: there are uncountably many non-isomorphic separable type~$\mathrm{II}_1$ factors \cite{corpus-8,corpus-65}. A total classification by a countable list of invariants would inject that uncountable family into a countable product of invariant values, which is impossible, and the Borel-reducibility analysis makes the failure precise for isomorphism of von Neumann algebras \cite{corpus-59}. The second statement is the wildness line: every finite-dimensional algebra over an algebraically closed field is derived-tame or derived-wild with wildness preserved under degeneration \cite{corpus-55}, the rank-2 isomorphism classes of the generic determinant's Cohen-Macaulay modules admit no finite-dimensional-variety parameterization \cite{corpus-56}, and no meaningful classification of compact $C_p$-equivariant $H\mathbb{F}_p$-modules exists at odd primes \cite{corpus-58}. The third statement is the Adyan-Rabin theorem with the Collins extension \cite{corpus-53}. The fourth statement is the unrecognizability of connected-sum homeomorphism for a specific four-manifold \cite{corpus-54}, set against the eight-geometry decomposition of closed three-manifolds \cite{corpus-60,corpus-70}. The fifth statement is the isocategorical-group construction: non-isomorphic finite groups carry equivalent representation categories as plain tensor categories \cite{corpus-12}. The sixth statement is the tame/wild tractability boundary \cite{corpus-57}. Each forbidden objective is a classification covering one of the named sectors, so each such classification would contradict the corresponding theorem. The conjunctive conclusion follows.
257
\end{proof}
258

259
\subsection{What the obstructions permit}
260

261
\Cref{thm:obstructions} does not say that classification fails everywhere. It says that classification objectives must match regimes.
262

263
The amenable factors are completely classified by Murray-von Neumann type and Connes invariants \cite{corpus-8,corpus-62,corpus-64}, and the obstruction concerns only the non-amenable remainder. The classification theorem and the impossibility theorem sit side by side and refer to different classes. The anomaly sector is classified completely in regime 3: quantization exists exactly when the relevant cohomological obstruction classes vanish \cite{corpus-19}, so the classification content is the obstruction itself. An impossibility statement of this shape is a finished classification, not a gap. Dimension three admits a finite table of Thurston geometries \cite{corpus-60,corpus-70} while dimension four contains algorithmically unrecognizable instances \cite{corpus-54}, so finite tables exist only in tame regimes. The same contrast appears inside group theory: tame extensions admit polynomial-time isomorphism tests while wild regimes do not \cite{corpus-57}, and unknot recognition is decidable in principle with its complexity-class membership open \cite{corpus-61}, which places it in regime 7 and separates decidability from classification.
264

265
The register therefore has a constructive use. An obstruction names the restriction a classification theorem needs. McDuff's theorem tells a would-be factor classification to restrict to the amenable class, and that restricted classification exists. Wildness tells a would-be module classification to restrict to the derived-tame side. The unrecognizability theorem tells a would-be four-manifold classification to restrict to decomposable classes. Each obstruction pairs with a restricted positive theorem, and that pairing is the working form of the program's negative results.
266

267
\begin{remark}
268
The program founding documents warn against assuming that physical theories possess a finite collection of exceptional objects analogous to the twenty-six sporadic groups \cite{corpus-1}. The sporadic groups exist and are exhaustive in the finite-simple setting, and the corresponding question for physical theories is open. The obstruction register shows what a periodic table must record where no table exists.
269
\end{remark}
270

271
\section{The realization layer}
272
\label{sec:realization}
273

274
The realization layer $\mathcal{R}$ asks which structures, once classified, are realized as physical theories. The proved content of this layer is reconstruction: objects recovered from their probes. Eight reconstruction theorems are registered.
275

276
\begin{table}[htbp]
277
\caption{The eight registered reconstruction theorems, with recovered object and scope limits. Each theorem is proved under the hypotheses stated in the source.}
278
\label{tab:reconstruction}
279
\small
280
\begin{tabularx}{\textwidth}{>{\hsize=0.70\hsize\raggedright\arraybackslash}X >{\hsize=1.12\hsize\raggedright\arraybackslash}X >{\hsize=1.18\hsize\raggedright\arraybackslash}X}
281
\toprule
282
Theorem & Recovers & Scope limits \\
283
\midrule
284
Gelfand-Naimark \cite{corpus-9,corpus-42} & A concrete representation of a C*-algebra & A representation theorem, not a classification \\
285
Gelfand duality \cite{corpus-42} & A compact Hausdorff space & The commutative side only \\
286
Stone duality \cite{corpus-44} & A spectrum from a Boolean algebra & The Boolean side only \\
287
Doplicher-Roberts \cite{corpus-12,corpus-15,corpus-16,corpus-67} & A compact supergroup, unique up to isomorphism & Symmetric structure, conjugates, subobjects, and $\mathrm{End}(\mathbf{1})$ equal to the scalars \\
288
Deligne \cite{corpus-13} & A supergroup representation category & Characteristic zero and subexponential growth \\
289
Stinespring \cite{corpus-10,corpus-11} & A minimal dilation, unique up to unitary & Normal form only, not an isomorphism classification \\
290
Classifying-space construction \cite{corpus-17,corpus-18} & A principal bundle from a map to the classifying space & Homotopy classification \\
291
Supermap representability \cite{corpus-40,corpus-41} & Concrete representations of categorical supermaps & Settings with channel-state duality \\
292
\bottomrule
293
\end{tabularx}
294
\end{table}
295

296
Reconstruction is better developed than classification. The pattern is uniform: probe data determines the object. Gelfand duality recovers a space from its commutative C*-algebra \cite{corpus-42}, Stone duality recovers a spectrum from a Boolean algebra \cite{corpus-44}, and Doplicher-Roberts reconstruction recovers a compact supergroup from a symmetric tensor *-category with the stated hypotheses \cite{corpus-12,corpus-16}. The 2024 to 2026 supermap line establishes concrete representability of categorical supermaps whenever suitable channel-state duality holds \cite{corpus-40,corpus-41}. Whether that line unifies with the Gelfand, Stone, and Naimark pattern into a single relational principle is open.
297

298
\subsection{Relational characterization}
299

300
Reconstruction from probes has a categorical form. The Yoneda embedding sends an object $P$ to the functor $\mathrm{Hom}(-, P)$, and the Yoneda lemma shows that an object of a locally small category is determined up to isomorphism by its relationships. The embedding is therefore a faithful mathematical representation of objects of $\mathrm{Phys}$ through their relational profiles. Its physical interpretation is open.
301

302
The constraint on every relational argument in the program is stated verbatim: \emph{Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.} The embedding supplies representability and nothing else. Physical equivalence requires the chosen relation of \cref{def:equivalence}, empirical adequacy requires the selection layer, and a classification theorem requires invariants with completeness statements.
303

304
Two islands support the relational program. Concrete representability of categorical supermaps is proved whenever the theory admits suitable channel-state duality \cite{corpus-40,corpus-41}. The classical reconstruction pattern of Gelfand, Stone, and Naimark recovers objects from their probe algebras \cite{corpus-42,corpus-42,corpus-44}. Whether the two islands join into one principle is open, and no argument in this paper crosses that gap.
305

306
\begin{theorem}[Survey: necessity of the structure hypotheses, assembled from Etingof-Gelaki, Doplicher-Roberts, Stinespring, and the supermap results]
307
\label{thm:hypotheses}
308
Every registered realization or identification theorem fails or becomes open as soon as its structure hypotheses are dropped. In particular: plain tensor equivalence of representation categories does not determine the finite group; Doplicher-Roberts reconstruction requires the symmetric structure and its companion hypotheses; Stinespring data is a normal form and its Kraus rank is not an isomorphism invariant of channels; supermap representability requires channel-state duality. Consequently any identification of systems in the program must declare the layers of structure it preserves, and an identification that forgets the monoidal or symmetric layer is refuted.
309
\end{theorem}
310

311
\begin{proof}
312
Isocategorical finite groups are non-isomorphic groups whose representation categories are equivalent as plain tensor categories \cite{corpus-12}, which refutes recovery of the group from plain tensor data and proves the last clause for that case. The Doplicher-Roberts statement is a theorem under its hypotheses, and no theorem on record covers the hypothesis-free version; the symmetric layer is load-bearing because its removal is exactly the case refuted by the counterexample. The Stinespring statement classifies completely positive maps up to minimal dilation, unique up to unitary, and Kraus rank is an invariant of that normal form only \cite{corpus-10,corpus-11}, so any claim that treats it as an isomorphism invariant of channels asserts more than the theorem. Supermap representability is proved in settings with channel-state duality \cite{corpus-40,corpus-41}, and the general case is open. Each clause is therefore either a counterexample or a recorded hypothesis gap, and the conjunctive conclusion follows.
313
\end{proof}
314

315
\Cref{thm:hypotheses} is the realization-layer form of the discipline that any equivalence record must state the structure it preserves. The braided case adds a further warning: fixed-point-net representation categories in braided Galois theory require extra soliton data beyond the braiding \cite{corpus-21}, so even a braided equivalence is not automatically sufficient.
316

317
\subsection{The central test}
318

319
The realization layer carries a central unanswered test. Can the proposed foundational structures reconstruct gauge connections and curvature, quantum states and observables, interacting Yang-Mills dynamics, and spacetime geometry together with gravitational dynamics, without assuming at the outset the spacetime geometry they aim to explain? Four constraints bound the current answer.
320

321
The finite-groupoid and weighted-nerve constructions of emergent spacetime are concrete, and their continuum convergence conditions are not established without complete proofs. The Ryu-Takayanagi formula is a proposal argued from the AdS/CFT correspondence and verified exactly only in the three-dimensional anti-de Sitter setting with two-dimensional conformal field theory \cite{corpus-45}. Entanglement-wedge bulk reconstruction is a proved quantum-information theorem \cite{corpus-46}, so it lives at the interface of the mathematical and realization layers and is not a theorem about gravity. Tensor-network constructions prove entropy relations inside exactly solvable toys and not inside the physical duality \cite{corpus-48}, and the statement that entanglement builds spacetime is an argument rather than a theorem \cite{corpus-49}.
322

323
The honest summary of the realization layer is therefore asymmetric. Reconstruction from probes is strong where the probes are algebraic or categorical. Reconstruction of interacting dynamics and of spacetime itself from primitive data remains open.
324

325
\section{The empirical layer}
326
\label{sec:empirical}
327

328
The empirical layer $\mathcal{E}$ is where mathematical classification stops and observational selection begins.
329

330
\begin{theorem}[Survey: classical uniqueness and quantum parametricity, assembled from Chentsov and Petz-Sudar]
331
\label{thm:monotone}
332
The Fisher metric is the unique Riemannian metric, up to constant factor, that is monotone under stochastic maps. Quantum monotone metrics are classified by operator monotone functions, a parametric family containing more than one element. Classical uniqueness therefore does not extend to the quantum case, and any quantum distinguishability criterion must either select within the parametric family and justify the selection or carry the family as data.
333
\end{theorem}
334

335
\begin{proof}
336
The first statement is Chentsov's theorem \cite{corpus-52}. The second is the Petz-Sudar classification \cite{corpus-52}. The parameterizing class of operator monotone functions contains more than one element; for instance the identity function and the affine function $f(x) = (x+1)/2$ are both operator monotone and give different metrics. The uniqueness statement is therefore false in the quantum case, and the last clause follows: a criterion that names a single quantum monotone metric makes an additional choice beyond the classification theorem.
337
\end{proof}
338

339
\Cref{thm:monotone} fixes what empirical distinguishability can borrow from information geometry. In the classical case the statistical distance is canonical. In the quantum case the statistical distance is a choice inside a proved parameterization, so an observational equivalence relation built on such distances must state the choice.
340

341
\subsection{Observational equivalence}
342

343
Two theories that differ as mathematical descriptions may be empirically indistinguishable in an accessible regime, so observational equivalence is a further quotient that the mathematical classification does not compute. Conversely an equivalence that forgets the monoidal or symmetric layer is too coarse to be a correct identification at all, because isocategorical groups refute it \cite{corpus-12}. Any observational criterion must therefore be fine enough to respect the preserved-structure requirement and coarse enough to quotient the empirically indistinguishable.
344

345
Formalizing that criterion needs an observation functor with four pieces of data: a domain of theories, a codomain of observational constraints or predictions, a composition rule with coarse-graining, and the induced equivalence classes of \cref{def:observational}. The record contains none of the four. Whether observational equivalence composes in interacting regimes is unstudied, and the positive question of what makes two descriptions one physical system is open: the isocategorical counterexample shows what is insufficient, and no reconstruction criterion for sameness exists.
346

347
\subsection{The claim register}
348

349
The empirical record of the realization layer is currently claim-dense, and the claim ladder keeps the rungs apart: announced, manuscript, verified, and accepted are different positions.
350

351
\begin{table}[htbp]
352
\caption{The five claim-ledger entries of the program registry, with ladder position at the status date of the registry. None is a theorem record.}
353
\label{tab:claims}
354
\small
355
\begin{tabularx}{\textwidth}{>{\hsize=0.17\hsize\raggedright\arraybackslash}X >{\hsize=1.26\hsize\raggedright\arraybackslash}X >{\hsize=1.57\hsize\raggedright\arraybackslash}X}
356
\toprule
357
Entry & Claim & Ladder position \\
358
\midrule
359
CL-01 & Rigorous existence of QCD, a simplest GUT completion, and pure Yang-Mills as subproblem, Balaban-based \cite{corpus-24,corpus-25,corpus-26} & Announced, manuscript unpublished, formalization withheld, verification pending \\
360
CL-02 & Reflection-positive four-dimensional SU(N) construction with mass gap and confinement \cite{corpus-28} & Journal-published and unverified \\
361
CL-03 & Existence and mass gap via a five-dimensional orbifold regulator \cite{corpus-29} & Withdrawn for quality standards, no status \\
362
CL-04 & Lattice Yang-Mills theorems in restricted regimes \cite{corpus-30,corpus-31,corpus-32} & Rigorous within stated regimes only \\
363
CL-05 & Three-dimensional mass-gap proof outline \cite{corpus-33} & Preprint outline, no status \\
364
\bottomrule
365
\end{tabularx}
366
\end{table}
367

368
None of the registered claim entries resolves the four-dimensional Yang-Mills Millennium problem, which requires proving both existence of the quantum field theory and a strictly positive mass gap \cite{corpus-23}. The announced existence work explicitly omits the mass gap, lacks public artifacts, and awaits independent verification \cite{corpus-24,corpus-25,corpus-26}; it carries the status existence claimed; manuscript and formalization withheld; verification pending. The remaining entries restrict their scope to lattice approximations without establishing the continuum limit \cite{corpus-30,corpus-31,corpus-32}, confine their arguments to three dimensions \cite{corpus-33}, or remain unverified or retracted \cite{corpus-28,corpus-29}. The Clay problem page lists the problem as unsolved \cite{corpus-23}. Because constructive field theory currently lacks a demonstrated continuum mass gap, the realization layer for four-dimensional non-Abelian gauge theory remains open.
369

370
A pre-claim baseline makes the ladder vivid. The 2026 survey of rigorous approaches to quantum field theory records that rigorous renormalization has never been made rigorous in the needed generality and that on the mass gap no clear path is known \cite{corpus-27}. The October 2026 existence announcement postdates that survey, contradicts its existence-side assessment, and confirms its mass-gap-side assessment \cite{corpus-24}. Independent verification before a standing committee is the step that would move the claim up the ladder \cite{corpus-25}.
371

372
The register also contains frontier items with lighter status. Higher-form DHR theory exhibits an extra $Z_2$ sector not realizable by Lagrangian gauge models, recorded from a single source \cite{corpus-20}. A braided Doplicher-Roberts program constructs a global quantum gauge group \cite{corpus-22}. Braided Galois theory requires soliton data beyond the braiding \cite{corpus-21}. Each is research input, and none is load-bearing in this assembly.
373

374
\section{The structural classification conjecture}
375
\label{sec:conjecture}
376

377
The organizing statement of the program is the following.
378

379
\begin{conjecture}[Structural classification of admissible physical systems]
380
\label{conj:structural}
381
Let $\mathrm{Phys}_{\mathrm{adm}}$ denote the class of mathematically admissible physical systems satisfying explicitly stated consistency conditions. There exists a collection of fundamental structural families $\mathfrak{F} = \{\mathfrak{F}_\alpha\}_{\alpha \in A}$ and a set of admissible constructions $\mathfrak{C}$ such that
382
\[
383
  \mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F}_\alpha \rangle_{\mathfrak{C}}.
384
\]
385
\end{conjecture}
386

387
The conjecture carries five proof obligations; the scoreboard in \cref{tab:obligations} is the state of the program.
388

389
\begin{table}[htbp]
390
\caption{The five proof obligations of \cref{conj:structural} and their state. Four are open and one is partial.}
391
\label{tab:obligations}
392
\small
393
\begin{tabularx}{\textwidth}{>{\hsize=0.77\hsize\raggedright\arraybackslash}X >{\hsize=1.67\hsize\raggedright\arraybackslash}X >{\hsize=0.56\hsize\raggedright\arraybackslash}X}
394
\toprule
395
Obligation & Content & State \\
396
\midrule
397
Completeness & Every admissible system is represented in the family closure & Open \\
398
Soundness & Every generated structure satisfies the admissibility conditions & Open \\
399
Equivalence & Different representations of one system are identified correctly & Open \\
400
Structural characterization & The fundamental families have precise definitions & Partial \\
401
Decomposition & Systems in the targeted classes are built from the families & Open in general \\
402
\bottomrule
403
\end{tabularx}
404
\end{table}
405

406
\begin{definition}[Constituent invariant record]
407
\label{def:constituent}
408
Let $P$ admit a decomposition $P \simeq \mathcal{F}(I_1, \ldots, I_n)$ with irreducible constituents. The constituent invariant record is $\mu(P) = (\mathcal{F}, \{\mathcal{I}(I_i)\}, g_P)$: the construction data, the multiset of invariant records of \cref{def:invariants} of the constituents, and the gluing datum $g_P$ that $\mathcal{F}$ requires to assemble them. The gluing datum is extension data of the construction: a group extension $1 \to N \to G \to Q \to 1$ is recorded by a class in $H^2(Q, Z(N))$ in addition to the invariant records of $N$ and $Q$, and other constructions carry the analogous clutching or k-invariant data. Where the decomposition is unique up to order and up to equivalence of constituents, $\mu$ is well defined on $\simeq$-classes.
409
\end{definition}
410

411
\begin{proposition}[Completeness of the constituent record for two constructions]
412
\label{thm:conditional}
413
Let $P$ be an object assembled by one of two operations. In case (a) $P$ is a finite-dimensional complex C*-algebra written as a direct sum $P \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$, with constituents classified by their block sizes. In case (b) $P$ is a group extension $1 \to N \to P \to Q \to 1$ with a fixed action of $Q$ on $N$, with $N$ and $Q$ classified up to isomorphism and the extension class $g_P$ recorded in $H^2(Q, Z(N))$. In case (a) the multiset of block sizes is a complete invariant of $P$ up to *-isomorphism. In case (b) the pair consisting of the invariant records of $N$ and $Q$ and the extension class $g_P$ is a complete invariant of $P$ up to isomorphism of extensions. In both cases the constituent record of \cref{def:constituent} is complete, and the construction maps neither into theories nor into observation data.
414
\end{proposition}
415

416
\begin{proof}
417
In case (a) the block sizes are the dimensions of the simple modules of $P$, which are invariant under *-isomorphism, and they determine the algebra by the structure theorem \cite{corpus-9,corpus-42}; this is \cref{lem:blocks}. In case (b) the classification of group extensions with a fixed action states that isomorphism classes of extensions of $Q$ by $N$ correspond bijectively to classes in $H^2(Q, Z(N))$, and an isomorphism of extensions preserves the class while a shared class builds an isomorphism of extensions \cite{corpus-72}. In both cases the record $\mu(P)$ therefore determines $P$ up to the stated equivalence. Neither construction outputs a theory or an observation, so the non-collapse argument of Section~3 leaves realization and selection unconstructed.
418
\end{proof}
419

420
\begin{remark}[Generation and classification]
421
\label{rem:incompat}
422
The five obligations concern generation, admissibility, identification, family definitions, and decomposition, and \cref{thm:obstructions} concerns classification by finite or parametric invariants and by algorithms. The two objectives do not contradict each other: finitely presented groups are generated from cyclic groups by free products and quotients, and their Markov properties are algorithmically undecidable \cite{corpus-53}. The objectives meet only in regimes 1 and 2 of \cref{tab:regimes}, where constituents carry classifying invariants and \cref{thm:conditional} applies. In the sectors of \cref{thm:obstructions} the classification-layer objective of \cref{def:layers} is unattainable without restricting the class or weakening the invariant notion.
423
\end{remark}
424

425
\Cref{thm:conditional} covers the two constructions where extension theory is established. The analogous completeness statement for the remaining admissible constructions is conditional on the five obligations of \cref{conj:structural}, of which one is partial and four are open, and on uniqueness of decomposition, which the program leaves open; it is not claimed here. Its conclusion would stop at the mathematical layer. The regime analysis of \cref{sec:mathlayer} bounds its scope further: inside a target class, the classifying data must live in a regime of \cref{tab:regimes} where invariants are finite or explicitly parameterized, and outside those regimes \cref{thm:obstructions} forbids the classification the conjecture would deliver.
426

427
\begin{remark}
428
The conjecture may also fail. The founding program records that proving either a complete classification of a specified class or the impossibility of natural classification objectives without additional restrictions is a meaningful mathematical result. The obstruction register already delivers the second kind of result in six sectors.
429
\end{remark}
430

431
\section{Worked examples}
432
\label{sec:examples}
433

434
The examples trace one classical, one quantum, and one gauge system through the three layers. Each separates $\mathcal{M}$, $\mathcal{R}$, and $\mathcal{E}$ and shows where the proved content ends.
435

436
\subsection{Finite-dimensional quantum systems}
437

438
Let $A = \mathbb{C} \oplus M_2(\mathbb{C})$, the complex C*-algebra with one one-dimensional block and one two-dimensional block. At the mathematical layer, $A$ is classified by its dimension vector, the multiset of matrix sizes, here $\{1, 2\}$: any finite-dimensional complex C*-algebra is isomorphic to a direct sum of matrix blocks, and the multiset of block sizes determines the algebra up to *-isomorphism \cite{corpus-9,corpus-42}.
439

440
\begin{lemma}[Uniqueness of the block decomposition]
441
\label{lem:blocks}
442
Every finite-dimensional complex C*-algebra $A$ admits a decomposition $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ with the multiset $\{n_1, \ldots, n_k\}$ uniquely determined by $A$. For the example algebra the multiset is $\{1, 2\}$, and any decomposition into irreducible blocks realizes it.
443
\end{lemma}
444

445
\begin{proof}
446
Existence is the structure theorem for finite-dimensional C*-algebras \cite{corpus-9}. Uniqueness of the multiset follows because the block sizes are recovered from $A$ as the dimensions of its simple modules, and simple modules are invariant under *-isomorphism. For $A = \mathbb{C} \oplus M_2(\mathbb{C})$ the simple modules have dimensions one and two, so every decomposition into irreducible summands has block sizes $\{1, 2\}$ up to order.
447
\end{proof}
448

449
The blocks $M_{n_i}(\mathbb{C})$ are the irreducible constituents under the direct-sum construction, so this example displays decomposition and irreducibility exactly as \cref{def:irreducible} requires, and \cref{lem:blocks} shows the decomposition unique in this restricted class.
450

451
At the realization layer, $A$ acts on a Hilbert space and states are density matrices on $\mathbb{C} \oplus \mathbb{C}^2$. The representation is the standard one from the Gelfand-Naimark embedding \cite{corpus-42}, which is a representation theorem and not a classification theorem; the classification content is the dimension vector from the layer above.
452

453
At the empirical layer, measurement statistics on states define distinguishability. The classical statistical distance is canonical by \cref{thm:monotone}, and the quantum statistical distance is one choice inside the parametric family of operator monotone functions. Two admissible choices give two inequivalent distinguishability structures on the same classified algebra, so the empirical layer carries data the mathematical layer does not determine.
454

455
\subsection{Classical mechanics}
456

457
Let $(M, \omega)$ be a symplectic manifold with Hamiltonian dynamics. At the mathematical layer, Darboux's theorem removes all local invariants \cite{corpus-6}, so the classifying data is global: the topology of $\omega$ and its cohomology class are candidate data, and Poisson geometry adds Weinstein splitting, the symplectic-leaf foliation, and coadjoint orbits for the Kirillov-Kostant-Souriau case \cite{corpus-7,corpus-68}. Local classification is complete and trivial, and the classification content is entirely global.
458

459
At the realization layer, Hamiltonian vector fields realize the dynamics and the observable algebra is the algebra of smooth functions on $M$. At the empirical layer, the Fisher metric is the unique monotone metric up to constant factor \cite{corpus-52}, so classical statistical distinguishability is canonical. The bridge from this family to the quantum family through deformation quantization is a programmatic link and not an equivalence theorem, so no classical-to-quantum conclusion crosses the layer boundary.
460

461
\subsection{Gauge theory and the claim register}
462

463
Let $P \to X$ be a principal $G$-bundle with connection. At the mathematical layer, principal bundles are classified by homotopy classes of maps into the classifying space $BG$, and characteristic classes are pullbacks of universal classes \cite{corpus-17,corpus-18}. Anomalies are classified as obstruction classes: quantization exists exactly when the relevant classes vanish \cite{corpus-19}. This is regime 3, complete as obstruction, and it is the volume's sharpest example of classification content that is an impossibility statement.
464

465
At the realization layer, the reconstruction of an interacting four-dimensional quantum field theory from such data is claimed rather than established. The announced existence result carries the status existence claimed; manuscript and formalization withheld; verification pending \cite{corpus-24,corpus-25}. At the empirical layer, the mass gap remains open \cite{corpus-23}, lattice theorems hold only in restricted regimes \cite{corpus-30,corpus-31,corpus-32}, and no entry of \cref{tab:claims} closes the continuum limit. The example therefore shows the three layers in three different states: proved at $\mathcal{M}$, claimed at $\mathcal{R}$, open at $\mathcal{E}$.
466

467
\section{Requirements for a unified framework}

2026-10-30T05:21:24.135823Z ERROR codex_core::tools::router: error=collab spawn failed: no thread with id: 01a18b41-44d9-7353-8a1b-d44d42bc4b6b
codex
All cited keys and cross-reference targets appear to be defined. I found a duplicate citation and some typographic inconsistencies; the large regime table also looks likely to exceed a page. Box warnings will remain unverified because I’m limiting this review to the source file.
exec
/usr/local/bin/zsh -lc "python3 -c 'import re; from pathlib import Path; s=Path(\"papers/latex/vol-12-principia-physica.tex\").read_text(); labels=re.findall(r\"\\\\label\\{(["'^}]+)'"\\}\",s); bibs=re.findall(r\"\\\\bibitem(?:\\[["'^]]*'"\\])?\\{(["'^}]+)'"\\}\",s); print(\"Missing references:\",[(s.count(chr(10),0,m.start())+1,k) for m in re.finditer(r\"\\\\(?:[cC]ref|ref|eqref|autoref)\\{(["'^}]+)'"\\}\",s) for k in m.group(1).split(\",\") if k not in labels]); print(\"Missing citations:\",[(s.count(chr(10),0,m.start())+1,k) for m in re.finditer(r\"\\\\cite\\{(["'^}]+)'"\\}\",s) for k in m.group(1).split(\",\") if k not in bibs]); print(\"Duplicate labels:\",sorted({k for k in labels if labels.count(k)>1})); print(\"Duplicate bibliography keys:\",sorted({k for k in bibs if bibs.count(k)>1})); print(\"Page-range lines:\",[i for i,l in enumerate(s.splitlines(),1) if re.search(r\"\\b[0-9]+-[0-9]+\\.\",l) and \"bibitem\" in l])'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 37ms:
Missing references: []
Missing citations: []
Duplicate labels: []
Duplicate bibliography keys: []
Page-range lines: [544, 546, 548, 550, 552, 556, 560, 562, 564, 568, 570, 572, 574, 576, 580, 596, 614, 620, 623, 641, 655, 661, 664, 666, 669, 671, 679]

codex
Source-only review of the requested file. No undefined citation keys, missing reference targets, duplicate labels, or obvious missing packages were found. Compilation and box warnings were not verified.

1. **Lines 186–225 — likely oversized table.** The 29-row regime table and long caption are inside an indivisible `table`/`tabularx`; wrapped rows likely exceed the page height. Convert it to a multipage `longtable` with repeated headings and explicit column widths. `longtable` is already loaded.

2. **Lines 355–363 — claim-ID column is too narrow.** Its `0.17\hsize` allocation provides approximately 24.6 pt, forcing identifiers such as `CL-01` to wrap at the hyphen. Increase the first weight, for example to `0.25`, and change the remaining weights to `1.23` and `1.52`, preserving their total of 3.

3. **Line 304 — duplicate citation.**  
   Replace `\cite{corpus-42,corpus-42,corpus-44}` with `\cite{corpus-42,corpus-44}` to avoid printing reference 42 twice.

4. **Lines 546, 562, 570, 572, 574, 596, 614, 620, 623, 641, 655, 661, 664, 666, 669, 671 — incorrect page-range punctuation.**  
   Replace single hyphens in page ranges with `--`, such as `315--352`. Line 620 contains two ranges requiring this fix. Preserve hyphens in identifiers and URLs.

5. **Lines 170, 199, 227, 284, 296, 413, 438, 442, 446, 560, 562, 566 — algebra notation uses a baseline asterisk.**  
   Replace textual `C*-algebra` with `$C^*$-algebra`, retaining the appropriate plural. Likewise, typeset mathematical star notation consistently in `*-isomorphism` and `*-category`, rather than using a text asterisk.

6. **Lines 243 and 666 — inconsistent factor-type typography.**  
   `II$_1$` mixes text letters with a mathematical subscript, unlike the consistent notation elsewhere, for example line 172. Replace it with `$\mathrm{II}_1$`.

VERDICT: NEEDS_FIX
hook: Stop
hook: Stop Completed
tokens used
43,818
Source-only review of the requested file. No undefined citation keys, missing reference targets, duplicate labels, or obvious missing packages were found. Compilation and box warnings were not verified.

1. **Lines 186–225 — likely oversized table.** The 29-row regime table and long caption are inside an indivisible `table`/`tabularx`; wrapped rows likely exceed the page height. Convert it to a multipage `longtable` with repeated headings and explicit column widths. `longtable` is already loaded.

2. **Lines 355–363 — claim-ID column is too narrow.** Its `0.17\hsize` allocation provides approximately 24.6 pt, forcing identifiers such as `CL-01` to wrap at the hyphen. Increase the first weight, for example to `0.25`, and change the remaining weights to `1.23` and `1.52`, preserving their total of 3.

3. **Line 304 — duplicate citation.**  
   Replace `\cite{corpus-42,corpus-42,corpus-44}` with `\cite{corpus-42,corpus-44}` to avoid printing reference 42 twice.

4. **Lines 546, 562, 570, 572, 574, 596, 614, 620, 623, 641, 655, 661, 664, 666, 669, 671 — incorrect page-range punctuation.**  
   Replace single hyphens in page ranges with `--`, such as `315--352`. Line 620 contains two ranges requiring this fix. Preserve hyphens in identifiers and URLs.

5. **Lines 170, 199, 227, 284, 296, 413, 438, 442, 446, 560, 562, 566 — algebra notation uses a baseline asterisk.**  
   Replace textual `C*-algebra` with `$C^*$-algebra`, retaining the appropriate plural. Likewise, typeset mathematical star notation consistently in `*-isomorphism` and `*-category`, rather than using a text asterisk.

6. **Lines 243 and 666 — inconsistent factor-type typography.**  
   `II$_1$` mixes text letters with a mathematical subscript, unlike the consistent notation elsewhere, for example line 172. Replace it with `$\mathrm{II}_1$`.

VERDICT: NEEDS_FIX
