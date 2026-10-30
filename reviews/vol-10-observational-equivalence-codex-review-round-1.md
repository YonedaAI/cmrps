---
reviewer: codex (OpenAI) gpt-6.1-sol
type: formatting
paper: vol-10-observational-equivalence
round: 1
date: 2026-10-30T05:05:00Z
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
session id: 01a18b32-6d49-7953-a8d9-aa32de51e94b
--------
user
Read ONLY the file papers/latex/vol-10-observational-equivalence.tex (do not explore other files or directories). Review it for LaTeX formatting issues: compilation errors, missing packages, broken references, inconsistent styling, overfull/underfull boxes, spacing problems. List all issues with line numbers and concrete fixes. End your response with a VERDICT line — exactly one of: VERDICT: PASS (no issues remain) or VERDICT: NEEDS_FIX (issues listed above must be fixed).
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
I’ll read only the specified LaTeX file and check for formatting issues visible in its source.
exec
/usr/local/bin/zsh -lc 'nl -ba papers/latex/vol-10-observational-equivalence.tex' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
     1	% Preamble follows the series format skeleton (references/paper-format.md) unchanged;
     2	% the package set below is mandated by that standard and is retained as-is.
     3	\documentclass[11pt,letterpaper]{article}
     4	
     5	\usepackage[T1]{fontenc}
     6	\usepackage{lmodern}
     7	\usepackage{microtype}
     8	\usepackage[margin=1in]{geometry}      % one-inch margins, as the writing standard specifies
     9	\linespread{1.0}
    10	\setlength{\parskip}{0pt}          % conventional article: indent, no vertical gap
    11	\setlength{\parindent}{1.5em}
    12	
    13	\usepackage{amsmath,amssymb,amsthm}
    14	\usepackage{graphicx}
    15	\usepackage{xcolor}
    16	\usepackage{tikz}                  % and tikz-cd when commutative diagrams are used
    17	\usepackage{booktabs,tabularx,array,longtable}
    18	\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
    19	\usepackage{listings}
    20	\lstset{basicstyle=\ttfamily\footnotesize,breaklines=true,columns=fullflexible,frame=single,framesep=4pt,showstringspaces=false,captionpos=b}
    21	\usepackage[hidelinks]{hyperref}
    22	\usepackage{cleveref}
    23	
    24	\newtheorem{theorem}{Theorem}[section]
    25	\newtheorem{proposition}[theorem]{Proposition}
    26	\newtheorem{lemma}[theorem]{Lemma}
    27	\newtheorem{corollary}[theorem]{Corollary}
    28	\theoremstyle{definition}
    29	\newtheorem{definition}[theorem]{Definition}
    30	\newtheorem{example}[theorem]{Example}
    31	\theoremstyle{remark}
    32	\newtheorem{remark}[theorem]{Remark}
    33	
    34	\title{Observational Equivalence and Physical Distinguishability\\[4pt]
    35	  {\normalsize Part 10 of \emph{The Classification of Mathematical Representations of Physical Systems}}}
    36	\author{Matthew Long\\
    37	  \small The YonedaAI Collaboration, YonedaAI Research Collective\\
    38	  \small Chicago, Illinois, USA\\
    39	  \small \texttt{mlong@yonedalabs.ai}\\
    40	  \small \texttt{https://yonedalabs.ai}}
    41	\date{October 2026}
    42	
    43	\begin{document}
    44	
    45	\maketitle
    46	
    47	\begin{abstract}
    48	The classification problem of mathematical representations of physical systems is a quotient: classify objects of a category of systems up to an equivalence relation. The quotient is unusable until the relation is chosen, and the choice is decisive. This paper develops the observational side of that choice. It separates three relations: mathematical equivalence, given by isomorphism of the component data of a representation; physical equivalence, an open choice constrained by what the identifying morphism preserves; and observational equivalence, induced by a functor from systems to observation records. Observation functors are defined, their induced relations are proved to be equivalence relations with classes given by record isomorphism classes, and their interaction with coarse-graining is proved monotone in one direction only. Distinguishability is treated through monotone metrics: the Fisher metric is the unique classical choice up to constant, while the quantum case admits a parametric family indexed by operator monotone functions. An explicit two-dimensional computation shows the resulting quadratic forms differ on non-commuting directions, so quantum metric distinguishability is not canonical. The plain tensor-category criterion for physical equivalence fails outright: equivalence of representation categories without the symmetric structure does not recover the group, and every proposed relation must name the layers of structure it preserves. A counterexample search records which candidate criteria fail and why, and the empirical layer of the three-layer architecture is instantiated as a functor and left open where the sources leave it open.
    49	\end{abstract}
    50	
    51	\section{Introduction}
    52	
    53	The program of this series asks whether mathematical representations of physical systems admit a structural classification analogous to the classification of finite simple groups. The question is stated as
    54	\[
    55	\mathrm{Classify}\bigl(\mathrm{Ob}(\mathrm{Phys})/{\simeq}\bigr),
    56	\]
    57	and each term of that expression requires work. The objects are tuples of state space, observable algebra, dynamics, symmetry data, and composition rules. The category they live in is still a schema: the preservation laws and composition rules for its morphisms are not fixed. The relation $\simeq$ is a choice, and the choice is essential. Two mathematical descriptions may be physically equivalent without being mathematically isomorphic; dual theories may describe the same observable physics through very different mathematical structures.\footnote{The founding document of the YonedaAI Collaboration (2026, cited by section throughout this paper) and the YonedaAI physics research summary (2026-10-27) are program documents of the series in which this paper sits. Every mathematical statement used here is defined and stated explicitly in this text.}
    58	
    59	This paper develops the empirical side of that quotient. Observational equivalence identifies two systems exactly when no admissible observation separates them. The formal object is the observation functor named by the Information Geometry Correspondence program of the YonedaAI research summary; that program names the object without defining it, so the definition, its basic properties, and its limits are established here.
    60	
    61	Observation functors are ordinary functors from a category of systems to a category of observation records. The indistinguishability relation they induce is an equivalence relation whose classes are the record isomorphism classes of the functor.
    62	
    63	Coarsening the observations identifies at least as many systems as the fine observations identify, and the inclusion of relations can be strict. The quantitative side of distinguishability splits along the classical and quantum divide: the Fisher metric is unique up to constant among metrics monotone under stochastic maps \cite{b8}, while the quantum monotone metrics form a parametric family indexed by operator monotone functions \cite{b8}. An explicit two-dimensional computation shows the induced quadratic forms disagree on non-commuting directions, so distinguishability read from an unnamed monotone metric is not a function of the states alone.
    64	
    65	A proved counterexample blocks the most natural equivalence criterion of all: equivalence of representation categories as plain tensor categories does not recover the underlying group, so any equivalence used to identify systems must state which layer of structure it preserves.
    66	
    67	The separation between mathematical and physical equivalence runs through every section. Mathematical equivalence is isomorphism of representations. Physical equivalence is a relation to be chosen and defended. Observational equivalence is what an observation functor computes. The three notions must not be conflated. The series qualification on relational arguments binds throughout and is quoted in \Cref{sec:recon}.
    68	
    69	
    70	
    71	\section{Equivalence notions}
    72	\label{sec:notions}
    73	
    74	\subsection{Systems and morphisms}
    75	
    76	\begin{definition}[System record]
    77	\label{def:system}
    78	A physical system representation is a tuple $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ comprising a state space or geometric structure $X$, an observable algebra or collection $\mathcal{O}$, dynamical data $\mathcal{D}$, symmetry and constraint data $\mathcal{S}$, and composition or interaction rules $\mathcal{C}$. This is the object schema used throughout the series. The five components need not be independent.
    79	\end{definition}
    80	
    81	Morphisms between such records are the admissible relationships the program names: coarse-graining, exact equivalences, embeddings, dualities, and limiting procedures (the series morphism kinds). Their preservation laws are not fixed, so any statement below that quantifies over morphisms declares which morphism classes are in force. This paper uses three classes: functors of observation (\Cref{sec:functors}), coarse-graining functors that forget microscopic detail while preserving macroscopic observables, and invertible equivalence morphisms. Set-theoretic size is handled once by convention: the class of admissible systems is assumed small enough for its quotients to be sets, or the arguments are read relative to a fixed universe.
    82	
    83	\subsection{Equivalence relations on systems}
    84	
    85	\begin{definition}[Mathematical equivalence]
    86	\label{def:matheq}
    87	Two system records $P$ and $Q$ are mathematically equivalent, written $P \cong Q$, when their tuples are isomorphic componentwise in the ambient category of each component: a bijection of state spaces carrying observables, dynamics, symmetry data, and composition data across the identification. This is mathematical equivalence in the standard sense of isomorphism of representations.
    88	\end{definition}
    89	
    90	\begin{definition}[Physical equivalence]
    91	\label{def:physeq}
    92	Physical equivalence, written $P \simeq Q$, is a carefully chosen equivalence relation on system records, used to form the quotient $\mathrm{Ob}(\mathrm{Phys})/{\simeq}$ in the classification problem. The relation is stipulated by choice; which choice is correct is open.
    93	\end{definition}
    94	
    95	\begin{definition}[Observational equivalence]
    96	\label{def:obseq}
    97	Given an observation functor $\mathrm{Obs}$ from systems to a category of observation records (\Cref{def:obs}), two systems are observationally equivalent, written $P \approx_{\mathrm{Obs}} Q$, when $\mathrm{Obs}(P) \cong \mathrm{Obs}(Q)$ in the category of observation records.
    98	\end{definition}
    99	
   100	\begin{definition}[Admissible candidate relation]
   101	\label{def:band}
   102	Let $\simeq$ be a candidate relation claimed as physical equivalence, and let $\mathcal{A}$ be a family of admissible observation functors. The candidate is admissible only if
   103	\[
   104	{\cong} \;\subseteq\; {\simeq} \;\subseteq\; \bigcap_{\mathrm{Obs} \in \mathcal{A}} {\approx_{\mathrm{Obs}}}.
   105	\]
   106	The first inclusion states that an isomorphism of tuples is an identification no physical criterion can reject. The second states that physically equivalent systems are not separated by any admissible observation: if some admissible observation separates $P$ and $Q$, the two systems report different outcomes to the same experiment, and declaring them physically equivalent contradicts the requirement that equivalent descriptions carry the same observable physics.
   107	\end{definition}
   108	
   109	\begin{table}[t]
   110	\centering
   111	\small
   112	\begin{tabularx}{\textwidth}{@{} L{0.17\textwidth} L{0.19\textwidth} X L{0.24\textwidth} @{}}
   113	\toprule
   114	Relation & Notation & Identifies systems when & Status \\
   115	\midrule
   116	Mathematical equivalence & $P \cong Q$ & the tuples are isomorphic componentwise & established notion, strictly finer in general \\
   117	Physical equivalence & $P \simeq Q$ & the chosen relation holds & stipulative; the choice is open \\
   118	Observational equivalence & $P \approx_{\mathrm{Obs}} Q$ & the observation records are isomorphic & defined here from an observation functor \\
   119	\bottomrule
   120	\end{tabularx}
   121	\caption{The three relations on system records. Only the first and third are computed from data; the second is a choice the classification problem depends on.}
   122	\label{tab:relations}
   123	\end{table}
   124	
   125	\Cref{tab:relations} summarizes the three relations, and two discipline points govern their use. Mathematical equivalence is strictly finer than physical equivalence in general: distinct mathematical descriptions can present the same observable physics. Observational equivalence is not a synonym for physical equivalence either; it is what one particular observation functor computes, and the choice of functor carries physical content (\Cref{sec:empirical}). The gap between the three relations is where the classification problem lives.
   126	
   127	\subsection{Preserved structure}
   128	
   129	\begin{definition}[Equivalence witness]
   130	\label{def:witness}
   131	An equivalence witness for a proposed identification of $P$ and $Q$ is a record naming the equivalence notion in force (\Cref{def:matheq} or \ref{def:physeq}), the morphism kind realizing the identification, and the layers of structure the identification preserves. The layers available are the symmetric monoidal structure, the monoidal (tensor) structure without symmetry, the braided structure, the $*$-structure, the algebraic structure, the topological structure, complete positivity of channels, and the unitary freedom of minimal dilations. An identification that does not name its preserved layers is not admissible.
   132	\end{definition}
   133	
   134	The requirement is substantive: an equivalence of representation categories that forgets the symmetric monoidal layer fails to recover basic data of the systems it identifies, by a proved counterexample rather than by a gap in technique (\Cref{sec:eg}).
   135	
   136	\subsection{Morphism kinds at the observational level}
   137	\label{sec:morphisms}
   138	
   139	The morphism kinds of the object schema act on observation records in characteristic ways, and stating the action is part of fixing the record category.
   140	
   141	\begin{definition}[Action of the morphism kinds]
   142	\label{def:morphisms}
   143	A coarse-graining is a functor $c$ on the system category; the record of $cP$ is computed by composing the observation functor with $c$. An embedding assigns to a subsystem its record and includes it in the record of the larger system. A duality carries records across presentations and must declare what it preserves (\Cref{sec:eg}). A limiting procedure acts on records by a limit of records: the record of a thermodynamic or continuum limit is the limit of the records, when that limit exists in the record category.
   144	\end{definition}
   145	
   146	Coarse-graining is the case \Cref{sec:coarse} controls. Embeddings are controlled whenever the record of a composite system determines the records of its subsystems, which is a hypothesis on the record category rather than a theorem about observation. Dualities are controlled by the preserved-layer discipline of \Cref{sec:eg}. Limiting procedures are the least settled case: a limit of records exists when the record category admits the relevant limits, and continuum limits in particular are not closed by formal means alone. Constructive quantum field theory treats continuum limits as essential, and nothing in this paper supplies the missing analysis. Any use of \Cref{def:morphisms} must therefore say which morphism class is in force, exactly as the open status of the preservation laws requires.
   147	
   148	\subsection{Standing assumptions}
   149	
   150	The formal results of this paper rest on a short list of assumptions, and each is stated where it is used. The object schema of \Cref{def:system} is taken as the coordinate record of a representation, with the status of a stipulative schema rather than a settled definition of a physical system. The morphism classes in force are the three named at the end of \Cref{sec:notions}. Statements quantified over admissible systems assume some fixed admissibility conditions; the condition list is left open in the series, so every such statement is conditional on the choice, and no result of this paper fixes the list.
   151	
   152	The cited results are used as established mathematics with their hypotheses intact: the plain tensor counterexample (\Cref{thm:eg}) with its construction cited rather than reproduced, the classical monotone-metric uniqueness (\Cref{thm:chentsov}) on spaces of probability distributions, and the quantum parametric classification (\Cref{thm:petzsudar}) for operator monotone functions normalized at $1$ and symmetric under $x \mapsto x^{-1}$ in Petz's sense. Nothing in this paper extends a cited result beyond its hypotheses, and the counterexample search of \Cref{sec:search} keeps extension attempts visible.
   153	
   154	\section{Structure preservation and its failure}
   155	\label{sec:eg}
   156	
   157	\subsection{The preserved-layer requirement}
   158	
   159	Any equivalence used to identify systems in the classification quotient must state which layer of structure it preserves. The requirement exists because one natural criterion is false. The criterion says: identify two systems when their representation categories are equivalent as tensor categories. The criterion is natural, since compositional structure is part of the object schema; it is also insufficient.
   160	
   161	\begin{theorem}[Plain tensor equivalence does not recover the group]
   162	\label{thm:eg}
   163	There exist finite groups $G$ and $H$ that are not isomorphic and whose complex representation categories are equivalent as plain tensor categories, that is, as monoidal categories without regard for the commutativity constraint. Consequently, an equivalence of representation categories that forgets the symmetric structure cannot recover the underlying group, and any classification that identifies systems by such an equivalence is false wherever the group data are observable superselection data of the systems.
   164	\end{theorem}
   165	
   166	\begin{proof}[Proof, by reference]
   167	The construction of isocategorical groups and the proof appear in the original source \cite{b2}, recorded in the series theorem registry as an obstruction result. The example pairs the affine symplectic group of a vector space over the field with two elements with a suitable affine pseudosymplectic group; the proofs run through triangular Hopf algebras \cite{b2}. The tensor-category equivalence is monoidal and does not respect the commutativity constraint \cite{b2}: the symmetric braiding is the layer the equivalence fails to preserve. This paper does not reprove the construction; it uses the statement as a constraint and searches for counterexamples to other criteria in \Cref{sec:search}. The series status of the statement is a complete proof in the mathematical literature, not a machine-checked result.
   168	\end{proof}
   169	
   170	\begin{corollary}[Preserved-layer discipline]
   171	\label{cor:preserved}
   172	Every proposed physical equivalence $\simeq$ entering the quotient $\mathrm{Ob}(\mathrm{Phys})/{\simeq}$ must declare its preserved layers, and a declaration that omits the symmetric monoidal layer cannot justify identifying systems whose observable global symmetry data differ.
   173	\end{corollary}
   174	
   175	\begin{proof}
   176	If two systems were identified by an equivalence of representation categories as plain tensor categories, \Cref{thm:eg} exhibits pairs of groups for which such an identification misreports the systems as alike while their group data differ. When those data are observable (superselection sectors, global symmetry groups), the identification contradicts the observable physics. The declaration of preserved layers is the device that makes the failure visible before the quotient is formed.
   177	\end{proof}
   178	
   179	The qualification in the corollary matters. Dualities of physical theories can identify systems whose presentation-level symmetry groups differ while the observable content agrees; the constraint forbids dropping the symmetric layer when the group data themselves are at stake, which is exactly the setting of \Cref{thm:eg}.
   180	
   181	\begin{remark}[What the counterexample does not say]
   182	\label{rmk:scope}
   183	\Cref{thm:eg} removes the plain tensor layer as a recovery principle; it does not say tensor categories carry no group data. With the symmetric structure restored, representation categories with conjugates, direct sums, subobjects, and endomorphism ring of the tensor unit equal to the complex numbers are equivalent to finite-dimensional unitary representations of a compact supergroup, unique up to isomorphism \cite{b1}. The failure is specific: drop the symmetric layer and the group is no longer determined. The same point governs dualities below.
   184	\end{remark}
   185	
   186	\subsection{Duality and the recovered data}
   187	
   188	Dualities exchange structure between differently presented theories and are invertible only after passage to an appropriate opposite or dual category. \Cref{thm:eg} fixes how they must be recorded. A duality that carries one system to another is admissible as a physical identification only together with a statement of what it preserves; a duality that forgets the monoidal or symmetric layer of the compositional data is not an identification of physical systems, however strong the categorical equivalence. Braided settings need extra care again: the Galois theory of braided tensor categories shows that fixed-point-net representation categories require additional data beyond the braiding, recorded in the literature as soliton data \cite{b7}.
   189	
   190	\Cref{tab:layers} records the layers an equivalence may claim and what each layer determines. The third row is the operative one: the monoidal layer without symmetry is the one \Cref{thm:eg} forbids as a recovery principle, and the table is the checklist an equivalence witness is checked against.
   191	
   192	\begin{table}[t]
   193	\centering
   194	\small
   195	\begin{tabularx}{\textwidth}{@{} L{0.26\textwidth} X L{0.26\textwidth} @{}}
   196	\toprule
   197	Preserved layer & What it determines & Status \\
   198	\midrule
   199	Symmetric monoidal structure & the compact supergroup of the representation category under the stated hypotheses & reconstructible \\
   200	Braided structure & more than the plain tensor layer, with extra soliton data in Galois settings & insufficient alone \\
   201	Monoidal (tensor) structure without symmetry & composition of representations, not the group & provably insufficient \\
   202	$*$-structure and algebraic structure & the operator-algebraic presentation & needed for $C^*$-level statements \\
   203	Complete positivity and unitary freedom & the channel and its minimal dilation up to unitary & normal-form level only \\
   204	\bottomrule
   205	\end{tabularx}
   206	\caption{Layers of structure an equivalence may preserve, and what each layer determines. An equivalence witness is checked against this list (\Cref{sec:notions}).}
   207	\label{tab:layers}
   208	\end{table}
   209	
   210	The reconstruction pattern is the positive counterpart of the constraint. Gelfand duality, Stone duality, and the Gelfand-Naimark theorem recover named objects from named probes under named hypotheses \cite{b3,b4,b6}; \Cref{sec:recon} places that pattern against the observation formalism. None of these results establishes physical equivalence by itself; the series qualification on relational arguments governs every such step and is quoted in \Cref{sec:recon}.
   211	
   212	\section{Observation functors}
   213	\label{sec:functors}
   214	
   215	\subsection{Definition and induced relation}
   216	
   217	\begin{definition}[Observation functor]
   218	\label{def:obs}
   219	An observation functor is a pair $(\mathsf{Obs}, \mathrm{Obs})$ of a category $\mathsf{Obs}$ whose objects are observation records and whose morphisms are comparisons between records, together with a functor $\mathrm{Obs} \colon \mathrm{Phys}_{\mathrm{adm}} \to \mathsf{Obs}$ that assigns to each admissible system its observation record and to each admissible morphism the induced comparison of records. An observation record packages the observational constraints or predictions a system presents to measurement: the family of accessible experiments, the outcomes each experiment reports, and the comparison of records under coarsening.
   220	\end{definition}
   221	
   222	\Cref{def:obs} is a proposal: the Information Geometry Correspondence research program names observation functors as its formal object without defining them. Two choices in the definition are deliberate. The domain is the admissible systems, not all of $\mathrm{Phys}$, because observation presupposes a system one can measure. The codomain is a category of records, not a set of numbers, because experiments compose and compare; a set-valued statistic would discard that structure.
   223	
   224	The functorial framing differs from the decision-theoretic framing in which monotone metrics were first studied, and the difference is structural. The classical uniqueness of \Cref{sec:metrics} originates in a decision-theoretic question about metrics on spaces of probability measures \cite{b8}: which metrics do not increase under stochastic transformations. That question presupposes the probability model and asks about its geometry. \Cref{def:obs} moves one level up: it asks what data a system presents to measurement before any metric is chosen. The two framings meet in \Cref{sec:metrics}, where the metrics are computed on the data \Cref{def:obs} produces.
   225	
   226	\begin{proposition}[Induced relation]
   227	\label{prop:equivrel}
   228	For a fixed observation functor $\mathrm{Obs}$, the relation $P \approx_{\mathrm{Obs}} Q$ defined by $\mathrm{Obs}(P) \cong \mathrm{Obs}(Q)$ is an equivalence relation on admissible systems. The map $P \mapsto [\mathrm{Obs}(P)]$ to record isomorphism classes is constant exactly on the $\approx_{\mathrm{Obs}}$ classes, so the quotient by $\approx_{\mathrm{Obs}}$ injects into the set of record isomorphism classes in the image of $\mathrm{Obs}$, and every map of sets out of the systems that is constant on $\approx_{\mathrm{Obs}}$ classes factors uniquely through that quotient.
   229	\end{proposition}
   230	
   231	\begin{proof}
   232	Isomorphism in $\mathsf{Obs}$ is an equivalence relation, and $\approx_{\mathrm{Obs}}$ is its pullback along $\mathrm{Obs}$: reflexivity, symmetry, and transitivity hold because they hold for isomorphism in $\mathsf{Obs}$. By construction $P \approx_{\mathrm{Obs}} Q$ holds exactly when $[\mathrm{Obs}(P)] = [\mathrm{Obs}(Q)]$, so the fibers of $P \mapsto [\mathrm{Obs}(P)]$ (the record isomorphism classes, not the strict fibers of $\mathrm{Obs}$ on objects) are the $\approx_{\mathrm{Obs}}$ classes, and the induced map on the quotient is injective on the image. Any set map constant on those fibers factors through the quotient by the universal property of quotient sets, and the factorization is unique because the quotient map is surjective.
   233	\end{proof}
   234	
   235	The classes of $\approx_{\mathrm{Obs}}$ are the fibers of the record-isomorphism-class map, sometimes called the essential fibers of $\mathrm{Obs}$. Strict fibers, which fix one record object rather than its isomorphism class, are finer in general and are not the relation of \Cref{prop:equivrel}.
   236	
   237	\begin{lemma}[Products of observations]
   238	\label{lem:products}
   239	Let $\mathrm{Obs}_1$ and $\mathrm{Obs}_2$ be observation functors into record categories $\mathsf{Obs}_1$ and $\mathsf{Obs}_2$. The assignment $P \mapsto (\mathrm{Obs}_1(P), \mathrm{Obs}_2(P))$ is an observation functor into the product category, and its induced relation is the intersection of the relations of the two factors: $P \approx Q$ for the product holds exactly when $P \approx_{\mathrm{Obs}_1} Q$ and $P \approx_{\mathrm{Obs}_2} Q$.
   240	\end{lemma}
   241	
   242	\begin{proof}
   243	The product of functors is a functor into the product category, and an isomorphism of pairs is exactly a pair of isomorphisms. The statement about relations is the definition of isomorphism in a product category.
   244	\end{proof}
   245	
   246	\Cref{lem:products} explains why adding experiments refines observational equivalence: each added observation functor intersects one more relation into the identification. \Cref{sec:metrics} shows that in the quantum case even a single choice of distinguishability ruler is a choice of what counts as one measurement.
   247	
   248	\subsection{Coarse and fine observations}
   249	\label{sec:coarse}
   250	
   251	Each composition of observation with coarse-graining behaves in one direction only.
   252	
   253	\begin{definition}[Coarse and fine observations]
   254	\label{def:coarse}
   255	Let $\mathrm{Obs}_f$ and $\mathrm{Obs}_c$ be observation functors into record categories $\mathsf{Obs}_f$ and $\mathsf{Obs}_c$. The observation $\mathrm{Obs}_c$ is a coarsening of $\mathrm{Obs}_f$ when a functor $h \colon \mathsf{Obs}_f \to \mathsf{Obs}_c$ exists with $\mathrm{Obs}_c = h \circ \mathrm{Obs}_f$ on objects and morphisms. Separately, given a coarse-graining functor $c$ on the system category (\Cref{def:morphisms}), the observation of the coarse-grained system is the composite functor $\mathrm{Obs} \circ c$.
   256	\end{definition}
   257	
   258	\begin{proposition}[Coarse records separate less]
   259	\label{prop:coarse}
   260	If $\mathrm{Obs}_c$ is a coarsening of $\mathrm{Obs}_f$ through $h$, then $P \approx_{\mathrm{Obs}_f} Q$ implies $P \approx_{\mathrm{Obs}_c} Q$, and the inclusion of relations can be strict: two systems with isomorphic fine records are identified by every coarsening, and two systems with the same coarse records can have non-isomorphic fine records.
   261	\end{proposition}
   262	
   263	\begin{proof}
   264	A comparison witnessing $\mathrm{Obs}_f(P) \cong \mathrm{Obs}_f(Q)$ maps under the functor $h$ to a comparison witnessing $\mathrm{Obs}_c(P) \cong \mathrm{Obs}_c(Q)$, which proves the inclusion. For strictness, take $\Omega = \{1,2,3,4\}$ with $p = (\tfrac{1}{2}, \tfrac{1}{4}, \tfrac{1}{8}, \tfrac{1}{8})$ and $q = (\tfrac{1}{4}, \tfrac{1}{2}, \tfrac{1}{8}, \tfrac{1}{8})$. Let $\mathrm{Obs}_f$ report the joint record of two experiments, the partition $\{\{1,2\}, \{3,4\}\}$ with pushforward $(\tfrac{3}{4}, \tfrac{1}{4})$ for both $p$ and $q$, and the partition $\{\{1,3\}, \{2,4\}\}$ with pushforwards $(\tfrac{5}{8}, \tfrac{3}{8})$ and $(\tfrac{3}{8}, \tfrac{5}{8})$. Let $h$ forget the second experiment, so $\mathrm{Obs}_c$ retains only the first. The fine records differ and the coarse records agree, and the coarsening $h$ is exactly the forgetting map of \Cref{def:coarse}. The computation is reproduced in the computational appendix (\texttt{observation\_\allowbreak quotient.py}, function \texttt{coarse\_\allowbreak vs\_\allowbreak fine}).
   265	\end{proof}
   266	
   267	\Cref{prop:coarse} concerns coarsened observations of the same systems. It does not compare the records of $P$ with the records of $cP$. A coarse-graining of systems is a different construction: fine-indistinguishable systems can have coarse-grained images that a fixed observation functor separates, because $c$ need not respect the isomorphism of fine records. No statement of this paper identifies those two constructions.
   268	
   269	\subsection{Interaction and transitivity}
   270	
   271	\Cref{prop:equivrel} settles transitivity for functorially induced observational equivalence. The open question is whether indistinguishability generated by admissible experiments composes in interacting regimes. The series records this as unstudied, and the present paper does not close it. What can be said is conditional, and both regimes of the conditional statement are realistic.
   272	
   273	\begin{proposition}[Composed experiments]
   274	\label{prop:composed}
   275	Suppose the record category carries a product of records and the observation record of a composite system $A \otimes B$ is the product of the records of the factors. If $P \approx P'$ in the first factor relation and $Q \approx Q'$ in the second, then $P \otimes Q \approx P' \otimes Q'$. If instead the record of a composite contains a joint experiment whose outcome distribution is not determined by the factor records, the implication can fail.
   276	\end{proposition}
   277	
   278	\begin{proof}
   279	Under the stated hypothesis the record of a composite is a product of records, and a product of isomorphisms is an isomorphism, so indistinguishability of the factors is preserved. For the failure direction, take $\Omega = \{1,2,3,4\}$ with distributions $p = (\tfrac{1}{2}, \tfrac{1}{4}, \tfrac{1}{8}, \tfrac{1}{8})$ and $q = (\tfrac{1}{4}, \tfrac{1}{2}, \tfrac{1}{8}, \tfrac{1}{8})$. Let the factor observation be the single experiment with outcome blocks $\{\{1,2\}, \{3,4\}\}$, under which $p \approx q$ (both push forward to $(\tfrac{3}{4}, \tfrac{1}{4})$). On the composite state space $\Omega \times \Omega$ the factor-marginal records of $p \times p$ and $p \times q$ coincide, yet the joint event $\omega_1 = \omega_2$ reports $\sum_i p_i^2 = \tfrac{11}{32}$ under $p \times p$ and $\sum_i p_i q_i = \tfrac{9}{32}$ under $p \times q$. The joint experiment separates two composites whose factor relations identify the factors.
   280	\end{proof}
   281	
   282	Which of the two regimes holds is a property of the interaction data, not of the observation formalism. If the accessible experiments of an interacting composite are the products of the accessible experiments of the factors, composition is safe by \Cref{prop:composed}. If the composition rules $\mathcal{C}$ of the object schema contribute experiments that neither factor admits alone, the implication has no reason to survive.
   283	
   284	\section{Information-geometric distinguishability}
   285	\label{sec:metrics}
   286	
   287	\subsection{Classical uniqueness}
   288	
   289	Distinguishability between statistical models has a canonical classical measure. A Riemannian metric on a space of probability distributions is monotone under stochastic maps when no stochastic map increases the metric distance between distributions.
   290	
   291	\begin{theorem}[Chentsov]
   292	\label{thm:chentsov}
   293	Up to a positive constant multiple, the Fisher information metric is the unique Riemannian metric on spaces of probability distributions that is monotone under stochastic maps.
   294	\end{theorem}
   295	
   296	\begin{proof}[Proof, by reference]
   297	The uniqueness statement is Chentsov's theorem, used here in the form stated and applied at \cite{b8}; the proof is a rigidity argument classifying monotone metrics on the classical simplex. This paper uses the statement as the classical anchor of distinguishability and does not reprove it.
   298	\end{proof}
   299	
   300	Concretely, on the open simplex of positive probability vectors $p = (p_1, \ldots, p_n)$, the Fisher form is
   301	\[
   302	g^{\mathrm{Fisher}}_p(a, a) = \sum_{i=1}^{n} \frac{a_i^2}{p_i}
   303	\]
   304	for tangent vectors $a$ with zero sum, and \Cref{thm:chentsov} says every monotone Riemannian metric on the simplex is a positive multiple of this form. The expression is the one that appears in \Cref{prop:commutative} as the commutative restriction of the quantum family: on commuting data the quantum metrics all give the classical answer.
   305	
   306	Classical statistical distance is therefore pinned down: any criterion that reads distinguishability from a monotone Riemannian metric on classical models must be a multiple of the Fisher metric. This is the one uniqueness result among the family of probability and measure-theoretic structures in the series taxonomy.
   307	
   308	\subsection{Quantum parametricity}
   309	
   310	In the quantum case the uniqueness fails. Monotone metrics on quantum state spaces are given by the Morozova-Chentsov construction indexed by operator monotone functions $f$ on the positive reals, normalized by $f(1) = 1$ and self-reciprocal in Petz's sense, $f(x) = x f(x^{-1})$; the self-reciprocity is the symmetry condition that makes the quadratic form well defined on self-adjoint tangent directions, and distinct self-reciprocal $f$ give distinct metrics.
   311	
   312	\begin{theorem}[Petz-Sudar classification]
   313	\label{thm:petzsudar}
   314	Every quantum monotone metric arises from an operator monotone function $f$ with $f(1) = 1$ and $f(x) = x f(x^{-1})$ through the Morozova-Chentsov form, and distinct such $f$ give distinct metrics on self-adjoint directions. The family is parametric, not a finite list, and no member is distinguished among all monotone metrics.
   315	\end{theorem}
   316	
   317	\begin{proof}[Proof, by reference]
   318	The classification of monotone metrics by operator monotone functions is stated and applied at \cite{b8}, where the classical uniqueness and its quantum failure are contrasted. The self-reciprocity condition identifies each metric with a symmetric representative; without it, $f$ and its transpose $f^{\#}(x) = x f(x^{-1})$ yield the same quadratic form on self-adjoint operators and would be double counted. The parametric nature of the family is the reason the classical uniqueness statement may not be extended to the quantum case.
   319	\end{proof}
   320	
   321	Concretely, for a faithful density operator $\rho$ with eigenvalues $\lambda_i$ and a self-adjoint trace-free operator $A = \sum_{i,j} A_{ij} |i\rangle\langle j|$ in an eigenbasis of $\rho$, the quadratic form of the metric $g_f$ is
   322	\[
   323	g_f^{\rho}(A, A) \;=\; \sum_{i,j} \frac{|A_{ij}|^2}{\lambda_j \, f(\lambda_i / \lambda_j)}.
   324	\]
   325	
   326	\begin{proposition}[Commutative restriction]
   327	\label{prop:commutative}
   328	For every operator monotone $f$ with $f(1) = 1$, the quadratic form $g_f^{\rho}$ restricted to operators $A$ that are diagonal in an eigenbasis of $\rho$ equals $\sum_i |A_{ii}|^2 / \lambda_i$, the classical Fisher form on the commutative subalgebra generated by $\rho$. On commutative data the quantum monotone metrics therefore agree, and the parametric freedom of \Cref{thm:petzsudar} is invisible.
   329	\end{proposition}
   330	
   331	\begin{proof}
   332	For $i \neq j$ the summands of the quadratic form carry factors $|A_{ij}|^2 = 0$ when $A$ is diagonal in the chosen basis. The surviving summands are $|A_{ii}|^2 / (\lambda_i f(1)) = |A_{ii}|^2 / \lambda_i$, since $f(1) = 1$.
   333	\end{proof}
   334	
   335	\subsection{Ruler dependence of the metric scale}
   336	
   337	The parametric freedom becomes visible on non-commuting data. Two self-reciprocal representatives suffice to see it: $f(x) = \tfrac{2x}{1+x}$ and $h(x) = \tfrac{1+x}{2}$, both operator monotone with value $1$ at $1$ and both satisfying $f(x) = x f(x^{-1})$.
   338	
   339	\begin{example}[Two monotone metrics disagree]
   340	\label{ex:monotone}
   341	Let $\rho = \mathrm{diag}(3/4, 1/4)$ and $A = \begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix}$. Then
   342	\[
   343	g_f^{\rho}(A, A) = \frac{1}{\tfrac{1}{4} \cdot \tfrac{3}{2}} + \frac{1}{\tfrac{3}{4} \cdot \tfrac{1}{2}} = \frac{16}{3},
   344	\qquad
   345	g_h^{\rho}(A, A) = \frac{2}{\tfrac{3}{4} + \tfrac{1}{4}} + \frac{2}{\tfrac{1}{4} + \tfrac{3}{4}} = 4.
   346	\]
   347	The two admissible monotone metrics give different quadratic forms at the same state and the same direction, by the factor $4/3$.
   348	\end{example}
   349	
   350	\begin{corollary}[Metric-level distinguishability is not canonical]
   351	\label{cor:noncanonical}
   352	Any criterion that reads quantum distinguishability from a monotone metric must name the function $f$. Different admissible choices give different quadratic forms at the same states and directions, so the numerical scale of ``the monotone-metric distance'' is not a function of the states alone.
   353	\end{corollary}
   354	
   355	\begin{proof}
   356	\Cref{ex:monotone} exhibits a single state and a single direction on which two admissible monotone metrics disagree, and \Cref{thm:petzsudar} guarantees the family contains many more. A criterion built on an unnamed member of the family is therefore not a function of the systems alone.
   357	\end{proof}
   358	
   359	The zero-distance relation is the same for every ruler: each $g_f$ is positive definite on faithful states, so $d_f(\rho, \sigma) = 0$ exactly when $\rho = \sigma$, independently of $f$. The ruler-dependence lives in the numerical values of nonzero distances, not in the equality relation.
   360	
   361	\subsection{Distinguishability beyond metrics}
   362	
   363	The question behind the metric analysis is whether statistical distance yields an operational notion of distinguishability strong enough for classification. Of the available positions, the first two fail as routes to an equivalence relation.
   364	
   365	A single monotone metric with a positive threshold $\varepsilon$ defines a tolerance relation $\{(\rho,\sigma) : d_f(\rho,\sigma) \le \varepsilon\}$. On a connected state space that relation is not transitive for any $\varepsilon > 0$, so by \Cref{prop:equivrel} it cannot be the relation of any observation functor, and it cannot enter the classification quotient. At $\varepsilon = 0$ the relation is state equality for every $f$, so the ruler plays no role. A family of rulers, one threshold per admissible $f$, has the same problem per ruler: each positive-threshold relation is non-transitive, and at zero threshold all rulers agree (\Cref{cor:noncanonical} concerns the numerical scales, not the zero-distance relation). \Cref{lem:products} applies to families of observation functors, not to tolerance relations, so it does not rescue the threshold construction.
   366	
   367	Operational distinguishability defined by admissible experiments is the third position and the only one that produces equivalence relations through \Cref{prop:equivrel}. It is also the least formalized: the admissible experiments of a general system class are not fixed. The position adopted here is the third as the construction of \Cref{sec:functors}, with metrics as derived data computed on records rather than as the definition of distinguishability. Metric thresholds remain legitimate as measures of nearness between records; they do not classify.
   368	
   369	The parametricity result also fixes what a classifying invariant can be. A classifying invariant is a value that determines an object up to the chosen equivalence, computed from the object and nothing else. The Fisher metric has that status in the classical case: it is a function of the probability model alone, unique up to constant (\Cref{thm:chentsov}). No quantum monotone metric has that status, because the value of the distance depends on the chosen function $f$ in addition to the states (\Cref{cor:noncanonical}). The pair (state, ruler) can carry the invariant; the state alone cannot. Any classification table that lists a quantum distinguishability distance as an invariant of the states must therefore list the ruler as part of the invariant or drop the entry.
   370	
   371	\section{Counterexample search}
   372	\label{sec:search}
   373	
   374	The methodology of the series requires a counterexample search against each candidate criterion for physical equivalence. \Cref{tab:criteria} records the candidates and the outcome.
   375	
   376	\begin{table}[t]
   377	\centering
   378	\small
   379	\begin{tabularx}{\textwidth}{@{} L{0.28\textwidth} X L{0.28\textwidth} @{}}
   380	\toprule
   381	Candidate criterion & Outcome & Evidence \\
   382	\midrule
   383	Mathematical isomorphism as physical equivalence & fails to identify dual presentations & a space and its function algebra are non-isomorphic records presenting one object \cite{b3}; a system-level pair is not constructed here \\
   384	Plain tensor-category equivalence & false as a recovery principle & \Cref{thm:eg}, a proved counterexample \\
   385	Monotone-metric distance without naming the metric & numerically not well defined in the quantum case & \Cref{ex:monotone}, computed and cross-checked \\
   386	Coarse observation records as the whole record & identifies more than the fine record & \Cref{prop:coarse} and its computational illustration \\
   387	\bottomrule
   388	\end{tabularx}
   389	\caption{Candidate criteria for physical equivalence and the result of the counterexample search.}
   390	\label{tab:criteria}
   391	\end{table}
   392	
   393	The first row is only partially closed. The program's founding document states that two mathematical descriptions may be physically equivalent without being mathematically isomorphic, and dual presentations are the motivating case. The table gives a mathematical illustration of dual presentations: a compact Hausdorff space and the commutative $C^*$-algebra of its continuous functions are distinct objects of their categories, isomorphic to no common record, yet Gelfand duality identifies them as presentations of one object \cite{b3}. A pair of system records inside one formal framework, proved non-isomorphic and declared physically equivalent, would close the row at the system level; the search did not produce one.
   394	
   395	The second row is different in kind. \Cref{thm:eg} is a proved counterexample, and it falsifies the criterion. The third row is computational and analytic: \Cref{ex:monotone} is verifiable by direct computation and is reproduced by the script named in the code appendix. The fourth row is the monotonicity of \Cref{prop:coarse}: a coarse record is computed from a fine one, so it cannot separate what the fine record identifies.
   396	
   397	A further candidate deserves recording because it is tempting. One might define physical equivalence by equality of all observation records of a fixed maximal family of experiments, in the spirit of operational theories. This criterion is well defined once the family of experiments is fixed, and \Cref{prop:equivrel} applies to it directly. The difficulty is that ``maximal family'' is itself a choice: fix a strictly larger family and the relation becomes finer. No argument in the series selects a canonical family for general systems, so the criterion restates the choice of $\simeq$ rather than resolving it.
   398	
   399	\subsection{A search protocol}
   400	\label{sec:protocol}
   401	
   402	The counterexample search above is repeatable for any future criterion. A candidate relation on system records comes with the morphism kind realizing its identifications, and the protocol screens it in three passes.
   403	
   404	The screening pass reads the preserved layers off the morphism kind and checks them against \Cref{tab:layers}; a witness naming the monoidal layer without symmetry fails on the strength of \Cref{thm:eg} immediately. The testing pass runs the candidate on four cases: a finite classical pair separated only by a second experiment, a qubit pair of monotone metrics disagreeing off the commutative slice, two non-isomorphic groups of order 8 with equal character tables, and a product of observations that separates what its factors hide. A criterion that misidentifies any case is false, and a criterion that passes all four is untested.
   405	
   406	The band pass compares the candidate with \Cref{def:band}: the candidate must be at least as coarse as isomorphism and no coarser than admissible observation.
   407	
   408	A criterion that survives all three steps is not thereby correct. It is admissible so far, and the record of the search is part of the argument: which examples were run, which layers were named, which failure modes were ruled out. The series records no positive criterion for physical equivalence; the outcomes of \Cref{tab:criteria} are the first run of the protocol.
   409	
   410	\section{Reconstruction patterns and representability}
   411	\label{sec:recon}
   412	
   413	Observation functors are stipulated here rather than derived, because the two proved reconstruction patterns do not yet connect across general system classes.
   414	
   415	The classic pattern recovers objects from probes. Gelfand duality reconstructs compact Hausdorff spaces from commutative $C^*$-algebras \cite{b3}; Stone duality reconstructs spectra from Boolean algebras \cite{b6}; the Gelfand-Naimark theorem embeds every $C^*$-algebra in an algebra of operators \cite{b4}. Each theorem is a precise statement with named hypotheses: an object is determined by how probes see it. The modern pattern represents higher-order operations. Categorical supermaps on a theory are concretely representable through channel-state duality whenever the theory has such a duality \cite{b5,b9}, and the factorization theorems for supermaps rest on the Yoneda lemma and on representability \cite{b5}.
   416	
   417	Whether the two patterns connect into one principle is open. The series records the question explicitly: whether the categorical-supermap line unifies with the Gelfand, Stone, and Naimark pattern into a single account of objects determined by their relationships is not established, and this paper does not close it. The relevance to observation functors is a hypothesis rather than a result. If representability of higher-order operations extends from supermaps to observation records in general, then records could be defined as representable objects and the functorial account of \Cref{sec:functors} would be derived rather than stipulated. The hypothesis needs a channel-state-duality statement for the systems in question, and no such statement is on record for general system classes.
   418	
   419	What can be used now is narrower. The reconstruction pattern fixes the shape of a legitimate claim about observation: an object recovered from named probes under named hypotheses is a theorem of reconstruction, not a classification and not an empirical adequacy claim. The series qualification applies to both patterns verbatim: ``Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.'' \Cref{sec:functors} defines observation functors as additional structure, and this section records the standing option of deriving them instead. The option is reasonable and unresolved.
   420	
   421	\section{The empirical layer}
   422	\label{sec:empirical}
   423	
   424	\subsection{Instantiation of the layer}
   425	
   426	The three-layer architecture of the program separates mathematical classification, physical realization, and empirical selection. Layer three is a map from theories to observational constraints or predictions; it is not a claim that every model maps to a single observational object. This section instantiates layer three as an observation functor and marks where the instantiation stops.
   427	
   428	\begin{definition}[Empirical layer as observation functor]
   429	\label{def:layer}
   430	The empirical layer is the functor $\mathrm{Obs} \colon \mathrm{Phys}_{\mathrm{adm}} \to \mathsf{Obs}$ of \Cref{def:obs}, and the observational constraints or predictions of a theory are the contents of its observation record. The symbol $\mathcal{O}$ used for the codomain in the architecture collides with the observable-algebra symbol of the object schema; this paper writes $\mathsf{Obs}$ for the record category and keeps $\mathcal{O}$ for the observable algebra.
   431	\end{definition}
   432	
   433	A mathematical structure can be consistent without describing our universe. Several mathematically distinct theories may produce identical predictions inside an experimentally accessible regime. A complete mathematical classification of representations would not by itself solve the empirical problem (founding document, section 7). The quotient $\mathrm{Ob}(\mathrm{Phys})/{\simeq}$ therefore cannot be formed by mathematical equivalence and then declared empirical; the relation must be argued for at the layer where the theories are compared.
   434	
   435	Related work supplies a representability result in an adjacent direction. Categorical supermaps on a physical theory are concretely representable through channel-state duality whenever the theory has such a duality \cite{b5,b9}. That line shows observational structure of the higher-order kind is representable in the stated settings. It does not define observation records for general systems.
   436	
   437	What the layer is mathematically remains open in the series, and the open items are specific. The composition of observation with coarsened observations is settled by functoriality (\Cref{prop:coarse}); the composition of empirical indistinguishability in interacting regimes is conditional (\Cref{prop:composed}). The codomain $\mathsf{Obs}$ is proposed as a category of records here; the architecture allows observational constraints or predictions, and whether records are the right objects is a modeling choice the program has not fixed. The correct relation $\simeq$ is the central open problem of the whole series, and the results of this paper constrain it from three sides: it must be no finer than observation (\Cref{prop:equivrel}), it must name its preserved layers (\Cref{cor:preserved}), and it must not rest on an unnamed monotone metric (\Cref{cor:noncanonical}).
   438	
   439	\subsection{Contents of the record category}
   440	
   441	\Cref{def:obs} names the record category without fixing its objects beyond outcome data. The results of this paper force specific contents of that category, and each forced content names an open condition.
   442	
   443	Experiments and outcomes are forced by \Cref{prop:equivrel}: a record that carries no outcome data induces the universal relation, and every system is indistinguishable from every other. Outcome labels are fixed by calibration of a given experiment: isomorphism of records compares the outcome distributions of the same experiment on the same label set, and a relabeling of outcomes is an isomorphism of experiment presentations rather than of records of one calibrated experiment. Comparison morphisms between records are forced by \Cref{prop:coarse}: coarsening is a functor on records, so the record category must contain the morphisms that forgetting induces. Limits of records are forced only when limiting procedures are in force, and \Cref{sec:morphisms} records that case as the least settled.
   444	
   445	What remains open is the treatment of interaction. The record of a composite system is not determined by the records of the factors unless the record category carries a monoidal structure mirroring the composition rules $\mathcal{C}$ of the object schema, and \Cref{prop:composed} shows both what holds under a product hypothesis and what can fail without it. The series leaves this open, and the record category proposed here inherits the open status.
   446	
   447	\subsection{Empirical selection as a quotient}
   448	
   449	Instantiated as an observation functor, the empirical layer computes a quotient: two theories land in the same class exactly when their records are isomorphic, which is the relation of \Cref{prop:equivrel}. This is the part of empirical selection that observation performs, and its limits are the limits of the records. A class of the quotient contains every theory compatible with the recorded outcomes, and the founding document anticipates exactly this situation: several mathematically distinct theories may produce identical predictions inside an experimentally accessible regime (section 7).
   450	
   451	Selection among the members of one class is not an observation problem in the sense of \Cref{def:obs}. It requires data the records do not carry: the internal structure of the theories, the behavior outside the accessible regime, or criteria of a different kind entirely. The three-layer architecture keeps this separation explicit: the empirical layer maps theories to observational constraints and predictions, and it is not a claim that every model maps to a single observational object. The quotient of \Cref{prop:equivrel} is the observational part of that map, nothing more.
   452	
   453	\section{Worked examples}
   454	\label{sec:examples}
   455	
   456	The constructions of \Cref{sec:functors,sec:metrics} run on explicit data. The explicit data cover a finite classical observation functor with its quotient classes, the qubit computation of \Cref{ex:monotone} in full generality, groups of order 8 whose character tables agree, and a product of observations.
   457	
   458	\subsection{A finite classical observation functor}
   459	
   460	A finite classical system is a probability vector $p$ on a finite microstate set $\Omega$, and its five-tuple of \Cref{def:system} is: $X$ the simplex of distributions on $\Omega$, $\mathcal{O}$ the experiment family, $\mathcal{D}$ trivial (static data), $\mathcal{S}$ trivial, and $\mathcal{C}$ the pointwise product of independent copies. An experiment is a map $e \colon \Omega \to \{1, \ldots, k_e\}$, and its outcome distribution is the pushforward $e_* p$. Fix a family $E = \{e_1, e_2\}$ of experiments; the observation record of the system is the pair of outcome distributions $(e_{1*} p, e_{2*} p)$ with the outcome labels fixed by calibration, and two systems are observationally equivalent over $E$ when these pairs agree. This is an observation functor into the category of finite outcome distributions with fixed labels, and \Cref{prop:equivrel} applies to it as stated.
   461	
   462	Take $\Omega = \{1, 2, 3, 4\}$ and two distributions
   463	\[
   464	p = (\tfrac{1}{2}, \tfrac{1}{4}, \tfrac{1}{8}, \tfrac{1}{8}),
   465	\qquad
   466	q = (\tfrac{1}{4}, \tfrac{1}{2}, \tfrac{1}{8}, \tfrac{1}{8}).
   467	\]
   468	Let $e_1$ partition $\Omega$ as $\{\{1,2\}, \{3,4\}\}$ and $e_2$ as $\{\{1,3\}, \{2,4\}\}$. Then $e_{1*} p = e_{1*} q = (\tfrac{3}{4}, \tfrac{1}{4})$, while $e_{2*} p = (\tfrac{5}{8}, \tfrac{3}{8})$ and $e_{2*} q = (\tfrac{3}{8}, \tfrac{5}{8})$. The coarse record consisting of $e_1$ alone identifies the two systems; the fine record over $E$ separates them. This is the strictness claimed in \Cref{prop:coarse}, computed on four microstates.
   469	
   470	The geometry of the classes is worth stating exactly, because the fine classes are not points. The class of $p$ over the coarse record is the set of distributions with $p_1 + p_2 = \tfrac{3}{4}$, a two-dimensional slice of the simplex $\Delta_3$. The fine class of $p$ over $E$ is the line segment
   471	\[
   472	p(t) = \bigl(\tfrac{1}{2} + t,\; \tfrac{1}{4} - t,\; \tfrac{1}{8} - t,\; \tfrac{1}{8} + t\bigr),
   473	\qquad t \in \bigl[-\tfrac{1}{8}, \tfrac{1}{8}\bigr],
   474	\]
   475	every point of which has $e_{1*} p(t) = (\tfrac{3}{4}, \tfrac{1}{4})$ and $e_{2*} p(t) = (\tfrac{5}{8}, \tfrac{3}{8})$. Adding the third partition $e_3 = \{\{1,4\}, \{2,3\}\}$ separates points of this segment, since $e_{3*} p(t) = (\tfrac{5}{8} + 2t, \tfrac{3}{8} - 2t)$ depends on $t$; with $E' = \{e_1, e_2, e_3\}$ the record determines a distribution on $\Omega$ up to nothing, and the classes are single points.
   476	
   477	\subsection{The qubit computation}
   478	
   479	\Cref{ex:monotone} computed one direction. The general two-dimensional case is closed, and the system tuple is: $X$ the faithful qubit states, $\mathcal{O} = M_2(\mathbb{C})$, $\mathcal{D}$ trivial, $\mathcal{S}$ trivial, $\mathcal{C}$ the tensor product. Let $\rho = \mathrm{diag}(\tfrac{3}{4}, \tfrac{1}{4})$ and $A = a \sigma_x + b \sigma_z$ with real $a, b$, so $A = \begin{pmatrix} b & a \\ a & -b \end{pmatrix}$. For $f(x) = \tfrac{2x}{1+x}$ the quadratic form of \Cref{sec:metrics} is
   480	\[
   481	g_f^{\rho}(A, A) = \tfrac{16}{3}(a^2 + b^2),
   482	\]
   483	and for $h(x) = (1+x)/2$ it is
   484	\[
   485	g_h^{\rho}(A, A) = \tfrac{16}{3} b^2 + 4 a^2.
   486	\]
   487	The two metrics differ only on off-diagonal directions. The diagonal summands contribute $\tfrac{4}{3}b^2 + 4b^2 = \tfrac{16}{3}b^2$ in both cases. For $f(x) = \tfrac{2x}{1+x}$ each of the two off-diagonal summands equals $\tfrac{a^2}{\lambda_2 f(\lambda_1/\lambda_2)} = \tfrac{8}{3}a^2$, so the off-diagonal total is $\tfrac{16}{3}a^2$; for $h(x) = (1+x)/2$ the two summands are $2a^2$ each, for a total of $4a^2$. The metrics coincide when $a = 0$ and differ by the factor $4/3$ when $b = 0$.
   488	
   489	\begin{table}[t]
   490	\centering
   491	\small
   492	\begin{tabular}{@{} lccc @{}}
   493	\toprule
   494	Direction $(a, b)$ & $g_f^{\rho}(A, A)$ & $g_h^{\rho}(A, A)$ & Agreement \\
   495	\midrule
   496	$(1, 0)$ (non-commuting) & $16/3$ & $4$ & no \\
   497	$(0, 1)$ (commutative) & $16/3$ & $16/3$ & yes \\
   498	$(1, 1)$ (mixed) & $32/3$ & $28/3$ & no \\
   499	$(\tfrac{1}{2}, \tfrac{1}{2})$ (mixed) & $8/3$ & $7/3$ & no \\
   500	\bottomrule
   501	\end{tabular}
   502	\caption{Quadratic forms of the two monotone metrics at $\rho = \mathrm{diag}(3/4, 1/4)$ along four directions $A = a\sigma_x + b\sigma_z$. Agreement holds on commutative directions and fails elsewhere.}
   503	\label{tab:qubit}
   504	\end{table}
   505	
   506	\Cref{tab:qubit} records the values on four directions. The pattern is the content of \Cref{prop:commutative} and \Cref{cor:noncanonical} together: the rulers coincide on commutative data and disagree everywhere else, so a distinguishability criterion that reads a monotone metric must name its function $f$.
   507	
   508	\subsection{Groups of order 8}
   509	
   510	Let $D$ be the dihedral group of order 8 with presentation $\langle r, s \mid r^4 = s^2 = 1, \; s r s = r^{-1}\rangle$ and $Q$ the quaternion group $\{\pm 1, \pm i, \pm j, \pm k\}$. Both have five conjugacy classes, class sizes $1, 1, 2, 2, 2$, abelianization $C_2 \times C_2$, and hence four one-dimensional characters; the remaining irreducible character has degree two and values $(2, -2, 0, 0, 0)$ on the classes in the order (identity, central involution, three classes of size two). The two character tables are therefore the same matrix of numbers once characters and the three size-2 classes are ordered; \Cref{tab:chars} displays one such ordering. The groups are not isomorphic: $D$ has five elements of order $2$ and two of order $4$, while $Q$ has one element of order $2$ and six of order $4$.
   511	
   512	\begin{table}[t]
   513	\centering
   514	\small
   515	\begin{tabular}{@{} lccccc @{}}
   516	\toprule
   517	Character & identity & central involution & size-2 class & size-2 class & size-2 class \\
   518	\midrule
   519	$\chi_1$ & $1$ & $1$ & $1$ & $1$ & $1$ \\
   520	$\chi_2$ & $1$ & $1$ & $1$ & $-1$ & $-1$ \\
   521	$\chi_3$ & $1$ & $1$ & $-1$ & $1$ & $-1$ \\
   522	$\chi_4$ & $1$ & $1$ & $-1$ & $-1$ & $1$ \\
   523	$\chi_5$ & $2$ & $-2$ & $0$ & $0$ & $0$ \\
   524	\bottomrule
   525	\end{tabular}
   526	\caption{The character table shared by the dihedral group of order 8 and the quaternion group of order 8, classes ordered as described in the text. Both groups realize this table.}
   527	\label{tab:chars}
   528	\end{table}
   529	
   530	The character table does not separate $D$ and $Q$. The computation in \texttt{invariant\_\allowbreak coarseness.py} derives both tables from the multiplication tables, by enumerating conjugacy classes, extracting the one-dimensional characters from the abelianization, and completing the table against the regular character; it then compares the tables and the element-order data. This finite statement is proved by the computation. It is a shadow of \Cref{thm:eg}, not the theorem itself: the tensor-category counterexample lives at the level of monoidal equivalences that fail to respect the commutativity constraint \cite{b2}, and equality of character tables is a strictly weaker coincidence.
   531	
   532	\subsection{Products of observations}
   533	
   534	\Cref{lem:products} says that adding an experiment intersects a relation into the identification. The four-microstate data of \Cref{sec:examples} shows the mechanism on three systems. Take $p = (\tfrac{1}{2}, \tfrac{1}{4}, \tfrac{1}{8}, \tfrac{1}{8})$, $q = (\tfrac{1}{4}, \tfrac{1}{2}, \tfrac{1}{8}, \tfrac{1}{8})$, and $r = (\tfrac{1}{8}, \tfrac{1}{8}, \tfrac{1}{2}, \tfrac{1}{4})$. Over the single experiment $e_1$ the records of $p$ and $q$ coincide at $(\tfrac{3}{4}, \tfrac{1}{4})$ and the record of $r$ is $(\tfrac{1}{4}, \tfrac{3}{4})$, so the relation identifies $p$ with $q$ and separates $r$. Over the single experiment $e_2$ the records of $p$ and $r$ coincide at $(\tfrac{5}{8}, \tfrac{3}{8})$ and the record of $q$ is $(\tfrac{3}{8}, \tfrac{5}{8})$, so the relation identifies $p$ with $r$ and separates $q$. Over the product of the two experiments the three records are pairwise distinct, and the relation is the intersection of the two single-experiment relations: only the identity remains on the three systems. Each experiment hides one coincidence that the other exposes, and no coincidence survives the product. This example concerns one system under two experiments; the composite-system failure of \Cref{prop:composed} is a different construction, exhibited in its proof.
   535	
   536	\section{Computational evidence}
   537	\label{sec:computations}
   538	
   539	The computational investigations accompany the analytic arguments as evidence, not proof: the claims they support stand or fall on the proofs in \Cref{sec:functors,sec:metrics}, and the computations check the arithmetic and exhibit the constructions on explicit finite data. The scripts live in \texttt{src/vol-10-observational-equivalence/} and are listed in the code evidence appendix (\Cref{tab:code}).
   540	
   541	The first script builds a finite toy category of classical systems with observation maps and checks that the induced indistinguishability is an equivalence relation, that the quotient classes match the fibers of the record map, and that coarse observations separate strictly less than fine ones. This is the finite shadow of \Cref{prop:equivrel,prop:coarse}.
   542	
   543	The second script evaluates the Morozova-Chentsov quadratic form of \Cref{ex:monotone} for the two functions $f(x) = \tfrac{2x}{1+x}$ and $h(x) = (1+x)/2$ at the state $\rho = \mathrm{diag}(3/4, 1/4)$ in the direction $A = \sigma_x$, and reproduces the values $16/3$ and $4$. It also evaluates the four directions of \Cref{tab:qubit} and checks the closed forms of \Cref{sec:examples}.
   544	
   545	The third script computes character tables of the dihedral group of order 8 and the quaternion group of order 8 from their multiplication tables, by brute-force enumeration of conjugacy classes, one-dimensional characters from the abelianization, and completion of the table by orthogonality against the regular character. The two groups are not isomorphic (their element orders differ), and their character tables coincide as tables of numbers. The computation illustrates the failure of coarse representation data to separate groups. It is not the counterexample of \Cref{thm:eg}: that counterexample lives at the level of monoidal categories and their symmetric structure, and the script does not construct it.
   546	
   547	The Haskell module \texttt{Instances.hs} in the same directory declares instances of the shared family classes of the series taxonomy for the systems this paper uses: observation functors over classical and quantum records, the equivalence classes of \Cref{prop:equivrel}, and the witness type that records preserved layers in the sense of \Cref{cor:preserved}. The module is an executable model of the definitions; it proves nothing and is not verified by any proof assistant.
   548	
   549	\begin{table}[t]
   550	\centering
   551	\footnotesize
   552	\begin{tabularx}{\textwidth}{@{} L{0.26\textwidth} L{0.21\textwidth} L{0.17\textwidth} X @{}}
   553	\toprule
   554	Claim supported & File & Function & What it demonstrates \\
   555	\midrule
   556	Induced indistinguishability is an equivalence relation with record-class fibers & \texttt{observation\_\allowbreak quotient.py} & \texttt{check\_\allowbreak axioms} & axiom checks on a finite toy category \\
   557	Coarse observations separate strictly less than fine ones & \texttt{observation\_\allowbreak quotient.py} & \texttt{coarse\_\allowbreak vs\_\allowbreak fine} & an explicit pair identified by coarse records only \\
   558	Monotone quadratic forms depend on $f$ off the commutative subalgebra & \texttt{monotone\_\allowbreak metric\_\allowbreak contrast.py} & \texttt{mc\_\allowbreak quadratic\_\allowbreak form} & reproduces $16/3$ and $4$ of \Cref{ex:monotone} \\
   559	Character tables do not separate the two groups of order 8 & \texttt{invariant\_\allowbreak coarseness.py} & \texttt{compare\_\allowbreak character\_\allowbreak tables} & equal tables, distinct element-order data \\
   560	\bottomrule
   561	\end{tabularx}
   562	\caption{Code evidence appendix. Each row names a claim, the file and function that demonstrates it, and what the demonstration shows. The computational evidence is not proof.}
   563	\label{tab:code}
   564	\end{table}
   565	
   566	\section{Constraints on the classification quotient}
   567	\label{sec:constraints}
   568	
   569	The classification problem is the quotient of admissible systems by $\simeq$. The results of this paper do not determine $\simeq$, and \Cref{def:band} bounds where it can sit.
   570	
   571	\Cref{def:band} is a constraint, not a construction, and both of its failure modes are live. A relation too close to $\cong$ cannot identify dual presentations, and the founding document records such presentations as the reason $\simeq$ is a choice at all. A family $\mathcal{A}$ that is too small over-identifies: the fewer observation functors are admitted, the larger the intersection, and a system class with one weak experiment identifies systems no working physicist would call the same. Enlarging $\mathcal{A}$ shrinks the intersection toward $\cong$ (\Cref{lem:products} is the mechanism), so an oversized family can empty the band for the dual presentations that $\simeq$ is supposed to identify. The band is usable only for families of observations that match the physics in question.
   572	
   573	The counterexample search of \Cref{sec:search} adds a third constraint: a candidate that realizes its identifications by plain tensor equivalence violates \Cref{thm:eg} wherever the group data are observable, and a candidate that reads numerical distances from an unnamed monotone metric is not well defined in the quantum case (\Cref{cor:noncanonical}).
   574	
   575	The preserved-layer discipline is the one constructive tool the paper offers. A candidate $\simeq$ becomes checkable when its proponents file an equivalence witness (\Cref{def:witness}) for each identification: the notion in force, the morphism kind, the preserved layers. Isocategorical groups then serve as the standing test: a witness whose preserved layers omit the symmetric monoidal structure and whose systems carry different observable group data must be rejected before further analysis. The series records no positive reconstruction criterion for ``the same physical system''; the search for one is open, and the constraints above are the admissibility conditions any such criterion must meet.
   576	
   577	The relation to the three-layer architecture is immediate. The band of \Cref{def:band} sits at the empirical layer: the first inclusion is mathematical, the second is empirical, and neither follows from the other. A complete classification of the mathematical representations (layer one) would leave the second inclusion unproved, and a proof of the second inclusion would leave the quotient of layer one uncomputed.
   578	
   579	\subsection{What would settle the choice}
   580	
   581	The choice of $\simeq$ moves from open to fixed only through concrete tasks, each stated so that it can fail. The first task is to fix the record category for a named class of systems: the admissible experiments, the isomorphisms of records, and the composition of records under interaction. Success means a construction to which \Cref{prop:equivrel} applies outside the toy model of \Cref{sec:examples}; failure means the class admits no well-formed observation functor. The second task is to determine whether bounded experimental indistinguishability composes in an interacting regime, the question \Cref{sec:functors} leaves open through \Cref{prop:composed}. Success means a theorem connecting the functorial relation of \Cref{sec:functors} with an operational relation between records; failure means a counterexample in which two systems are indistinguishable by every individual experiment and distinguishable by a joint one. The third task is to state a positive criterion for physical equivalence and run it through the protocol of \Cref{sec:protocol}. Success means a criterion that survives the protocol and is argued for at the empirical layer; failure means another row of \Cref{tab:criteria} closes negatively, which is itself a result the program accepts.
   582	
   583	Until the three tasks are run, the constraints of this section are the result: a band the correct relation must lie in, a discipline for declaring what identifications preserve, and a standing counterexample to the most natural criterion of all.
   584	
   585	\section{Limitations}
   586	\label{sec:limits}
   587	
   588	The observations of this paper are proposals constrained by proved results; they are not a completed formalization of the empirical layer. The domain and codomain of \Cref{def:obs} fix the shape of an observation functor, and the sources do not fix the contents: which experiments are admissible for a given system, how outcome families compose under interaction, and what structure the record category must carry are open. Until they are fixed, \Cref{prop:equivrel} is a statement about a proposed construction, not about physics.
   589	
   590	The counterexample search found one proved falsification (\Cref{thm:eg}) and one computed failure of canonicity (\Cref{ex:monotone}); it did not produce a concrete non-isomorphic pair of system records to close the dual-presentation row of \Cref{tab:criteria} at the system level. The search is bounded by the sources reviewed (cutoff 2026-10-29), and the absence of such a pair in this paper is not evidence that the literature lacks one.
   591	
   592	The metric results carry their own boundary. Theorems \ref{thm:chentsov} and \ref{thm:petzsudar} are used as established mathematics with their hypotheses intact: monotone under stochastic maps in the classical case, operator monotone functions normalized at $1$ and self-reciprocal in the quantum case. Nothing here extends classical uniqueness to the quantum case, and \Cref{cor:noncanonical} is the reason not to. The explicit computation is two-dimensional; the disagreement of the metrics is general (\Cref{thm:petzsudar}) but only the two-dimensional instance is exhibited here.
   593	
   594	The observational equivalence defined here is functorial indistinguishability. Bounded experimental indistinguishability in interacting regimes is not shown to coincide with it (\Cref{prop:composed}), and the empirical layer of the three-layer architecture keeps its full open status wherever the sources keep it.
   595	
   596	\section{Conclusion}
   597	
   598	Observational equivalence can be defined with ordinary categorical tools: an observation functor induces an equivalence relation whose classes are its record isomorphism classes, and coarsening the observations identifies at least what the fine observations identify. Distinguishability has a canonical classical ruler and no canonical quantum one: the Fisher metric is unique among monotone metrics on classical models, while quantum monotone metrics form a parametric family that agrees only on commutative data and disagrees on explicit non-commuting examples. Physical equivalence remains a choice, constrained from three sides by the results of this paper: it cannot be finer than observation, it must name the layers of structure it preserves, and it cannot rest on an unnamed metric. The most natural categorical criterion for it is false by a proved counterexample: plain tensor equivalence does not recover the group.
   599	
   600	What follows is a research program rather than a theorem. Fix the admissible experiments of a system class, build the record category for that class, and ask whether the induced quotient is the one the classification problem needs. Until then, the quotient $\mathrm{Ob}(\mathrm{Phys})/{\simeq}$ carries the equivalence relation as the open choice the quotient turns on, and papers in this series must state which relation they use.
   601	
   602	\section*{Notation}
   603	
   604	\begin{table}[htbp]
   605	\centering
   606	\small
   607	\begin{tabularx}{\textwidth}{@{} L{0.22\textwidth} X @{}}
   608	\toprule
   609	Symbol & Meaning \\
   610	\midrule
   611	$P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ & system record: state space, observables, dynamics, symmetries, composition rules (\Cref{def:system}) \\
   612	$P \cong Q$ & mathematical equivalence: isomorphism of tuples (\Cref{def:matheq}) \\
   613	$P \simeq Q$ & physical equivalence: the chosen relation of the classification quotient (\Cref{def:physeq}) \\
   614	$\mathrm{Obs}, \mathsf{Obs}$ & observation functor and its category of records (\Cref{def:obs}) \\
   615	$P \approx_{\mathrm{Obs}} Q$ & observational equivalence induced by $\mathrm{Obs}$ (\Cref{def:obseq}) \\
   616	$\approx_{\mathrm{Obs}_c}$ & relation of a coarsened observation (\Cref{def:coarse}) \\
   617	$g_f^{\rho}(A, A)$ & Morozova-Chentsov quadratic form of the monotone metric $g_f$ (\Cref{sec:metrics}) \\
   618	$f, h$ & self-reciprocal operator monotone functions normalized at $1$: $f(x) = \tfrac{2x}{1+x}$ and $h(x) = \tfrac{1+x}{2}$ \\
   619	$\mathcal{A}$ & family of admissible observation functors (\Cref{def:band}) \\
   620	\bottomrule
   621	\end{tabularx}
   622	\caption{Notation used throughout the paper.}
   623	\label{tab:notation}
   624	\end{table}
   625	
   626	\begin{thebibliography}{99}
   627	
   628	\bibitem{b1}
   629	S. Doplicher, J. Roberts, \emph{A new duality theory for compact groups}, Inventiones Mathematicae 98 (1989) 157-218.
   630	
   631	\bibitem{b2}
   632	P. Etingof, S. Gelaki, \emph{Isocategorical groups}, arXiv:math/0007196, 2000-07-31.
   633	
   634	\bibitem{b3}
   635	I. Gelfand, \emph{Normierte Ringe}, Recueil Mathematique 9(51):1 (1941) 3-24.
   636	
   637	\bibitem{b4}
   638	I. Gelfand, M. Neumark, \emph{On the imbedding of normed rings into the ring of operators in Hilbert space}, Recueil Mathematique 12(54):2 (1943) 197-217.
   639	
   640	\bibitem{b5}
   641	J. Hefford, M. Wilson, \emph{A Profunctorial Semantics for Quantum Supermaps}, arXiv:2402.02997, 2024-02-05.
   642	
   643	\bibitem{b6}
   644	P. Johnstone, \emph{Stone Spaces}, Cambridge Studies in Advanced Mathematics 3, Cambridge University Press, 1982.
   645	
   646	\bibitem{b7}
   647	M. M{\"u}ger, \emph{Conformal Field Theory and Doplicher-Roberts Reconstruction}, arXiv:math-ph/0008027, 2000-08-21.
   648	
   649	\bibitem{b8}
   650	D. Petz, Cs. Sud{\'a}r, \emph{Extending the Fisher metric to density matrices}, arXiv:quant-ph/0102132, 2001-02-27.
   651	
   652	\bibitem{b9}
   653	M. Wilson, J. Hefford, T. Hoffreumon, \emph{Supermaps on generalised theories}, arXiv:2602.23865, 2026-02-27.
   654	
   655	\end{thebibliography}
   656	
   657	\end{document}

exec
/usr/local/bin/zsh -lc "sed -n '175,455p' papers/latex/vol-10-observational-equivalence.tex | nl -ba -v175" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   175	\begin{proof}
   176	If two systems were identified by an equivalence of representation categories as plain tensor categories, \Cref{thm:eg} exhibits pairs of groups for which such an identification misreports the systems as alike while their group data differ. When those data are observable (superselection sectors, global symmetry groups), the identification contradicts the observable physics. The declaration of preserved layers is the device that makes the failure visible before the quotient is formed.
   177	\end{proof}
   178	
   179	The qualification in the corollary matters. Dualities of physical theories can identify systems whose presentation-level symmetry groups differ while the observable content agrees; the constraint forbids dropping the symmetric layer when the group data themselves are at stake, which is exactly the setting of \Cref{thm:eg}.
   180	
   181	\begin{remark}[What the counterexample does not say]
   182	\label{rmk:scope}
   183	\Cref{thm:eg} removes the plain tensor layer as a recovery principle; it does not say tensor categories carry no group data. With the symmetric structure restored, representation categories with conjugates, direct sums, subobjects, and endomorphism ring of the tensor unit equal to the complex numbers are equivalent to finite-dimensional unitary representations of a compact supergroup, unique up to isomorphism \cite{b1}. The failure is specific: drop the symmetric layer and the group is no longer determined. The same point governs dualities below.
   184	\end{remark}
   185	
   186	\subsection{Duality and the recovered data}
   187	
   188	Dualities exchange structure between differently presented theories and are invertible only after passage to an appropriate opposite or dual category. \Cref{thm:eg} fixes how they must be recorded. A duality that carries one system to another is admissible as a physical identification only together with a statement of what it preserves; a duality that forgets the monoidal or symmetric layer of the compositional data is not an identification of physical systems, however strong the categorical equivalence. Braided settings need extra care again: the Galois theory of braided tensor categories shows that fixed-point-net representation categories require additional data beyond the braiding, recorded in the literature as soliton data \cite{b7}.
   189	
   190	\Cref{tab:layers} records the layers an equivalence may claim and what each layer determines. The third row is the operative one: the monoidal layer without symmetry is the one \Cref{thm:eg} forbids as a recovery principle, and the table is the checklist an equivalence witness is checked against.
   191	
   192	\begin{table}[t]
   193	\centering
   194	\small
   195	\begin{tabularx}{\textwidth}{@{} L{0.26\textwidth} X L{0.26\textwidth} @{}}
   196	\toprule
   197	Preserved layer & What it determines & Status \\
   198	\midrule
   199	Symmetric monoidal structure & the compact supergroup of the representation category under the stated hypotheses & reconstructible \\
   200	Braided structure & more than the plain tensor layer, with extra soliton data in Galois settings & insufficient alone \\
   201	Monoidal (tensor) structure without symmetry & composition of representations, not the group & provably insufficient \\
   202	$*$-structure and algebraic structure & the operator-algebraic presentation & needed for $C^*$-level statements \\
   203	Complete positivity and unitary freedom & the channel and its minimal dilation up to unitary & normal-form level only \\
   204	\bottomrule
   205	\end{tabularx}
   206	\caption{Layers of structure an equivalence may preserve, and what each layer determines. An equivalence witness is checked against this list (\Cref{sec:notions}).}
   207	\label{tab:layers}
   208	\end{table}
   209	
   210	The reconstruction pattern is the positive counterpart of the constraint. Gelfand duality, Stone duality, and the Gelfand-Naimark theorem recover named objects from named probes under named hypotheses \cite{b3,b4,b6}; \Cref{sec:recon} places that pattern against the observation formalism. None of these results establishes physical equivalence by itself; the series qualification on relational arguments governs every such step and is quoted in \Cref{sec:recon}.
   211	
   212	\section{Observation functors}
   213	\label{sec:functors}
   214	
   215	\subsection{Definition and induced relation}
   216	
   217	\begin{definition}[Observation functor]
   218	\label{def:obs}
   219	An observation functor is a pair $(\mathsf{Obs}, \mathrm{Obs})$ of a category $\mathsf{Obs}$ whose objects are observation records and whose morphisms are comparisons between records, together with a functor $\mathrm{Obs} \colon \mathrm{Phys}_{\mathrm{adm}} \to \mathsf{Obs}$ that assigns to each admissible system its observation record and to each admissible morphism the induced comparison of records. An observation record packages the observational constraints or predictions a system presents to measurement: the family of accessible experiments, the outcomes each experiment reports, and the comparison of records under coarsening.
   220	\end{definition}
   221	
   222	\Cref{def:obs} is a proposal: the Information Geometry Correspondence research program names observation functors as its formal object without defining them. Two choices in the definition are deliberate. The domain is the admissible systems, not all of $\mathrm{Phys}$, because observation presupposes a system one can measure. The codomain is a category of records, not a set of numbers, because experiments compose and compare; a set-valued statistic would discard that structure.
   223	
   224	The functorial framing differs from the decision-theoretic framing in which monotone metrics were first studied, and the difference is structural. The classical uniqueness of \Cref{sec:metrics} originates in a decision-theoretic question about metrics on spaces of probability measures \cite{b8}: which metrics do not increase under stochastic transformations. That question presupposes the probability model and asks about its geometry. \Cref{def:obs} moves one level up: it asks what data a system presents to measurement before any metric is chosen. The two framings meet in \Cref{sec:metrics}, where the metrics are computed on the data \Cref{def:obs} produces.
   225	
   226	\begin{proposition}[Induced relation]
   227	\label{prop:equivrel}
   228	For a fixed observation functor $\mathrm{Obs}$, the relation $P \approx_{\mathrm{Obs}} Q$ defined by $\mathrm{Obs}(P) \cong \mathrm{Obs}(Q)$ is an equivalence relation on admissible systems. The map $P \mapsto [\mathrm{Obs}(P)]$ to record isomorphism classes is constant exactly on the $\approx_{\mathrm{Obs}}$ classes, so the quotient by $\approx_{\mathrm{Obs}}$ injects into the set of record isomorphism classes in the image of $\mathrm{Obs}$, and every map of sets out of the systems that is constant on $\approx_{\mathrm{Obs}}$ classes factors uniquely through that quotient.
   229	\end{proposition}
   230	
   231	\begin{proof}
   232	Isomorphism in $\mathsf{Obs}$ is an equivalence relation, and $\approx_{\mathrm{Obs}}$ is its pullback along $\mathrm{Obs}$: reflexivity, symmetry, and transitivity hold because they hold for isomorphism in $\mathsf{Obs}$. By construction $P \approx_{\mathrm{Obs}} Q$ holds exactly when $[\mathrm{Obs}(P)] = [\mathrm{Obs}(Q)]$, so the fibers of $P \mapsto [\mathrm{Obs}(P)]$ (the record isomorphism classes, not the strict fibers of $\mathrm{Obs}$ on objects) are the $\approx_{\mathrm{Obs}}$ classes, and the induced map on the quotient is injective on the image. Any set map constant on those fibers factors through the quotient by the universal property of quotient sets, and the factorization is unique because the quotient map is surjective.
   233	\end{proof}
   234	
   235	The classes of $\approx_{\mathrm{Obs}}$ are the fibers of the record-isomorphism-class map, sometimes called the essential fibers of $\mathrm{Obs}$. Strict fibers, which fix one record object rather than its isomorphism class, are finer in general and are not the relation of \Cref{prop:equivrel}.
   236	
   237	\begin{lemma}[Products of observations]
   238	\label{lem:products}
   239	Let $\mathrm{Obs}_1$ and $\mathrm{Obs}_2$ be observation functors into record categories $\mathsf{Obs}_1$ and $\mathsf{Obs}_2$. The assignment $P \mapsto (\mathrm{Obs}_1(P), \mathrm{Obs}_2(P))$ is an observation functor into the product category, and its induced relation is the intersection of the relations of the two factors: $P \approx Q$ for the product holds exactly when $P \approx_{\mathrm{Obs}_1} Q$ and $P \approx_{\mathrm{Obs}_2} Q$.
   240	\end{lemma}
   241	
   242	\begin{proof}
   243	The product of functors is a functor into the product category, and an isomorphism of pairs is exactly a pair of isomorphisms. The statement about relations is the definition of isomorphism in a product category.
   244	\end{proof}
   245	
   246	\Cref{lem:products} explains why adding experiments refines observational equivalence: each added observation functor intersects one more relation into the identification. \Cref{sec:metrics} shows that in the quantum case even a single choice of distinguishability ruler is a choice of what counts as one measurement.
   247	
   248	\subsection{Coarse and fine observations}
   249	\label{sec:coarse}
   250	
   251	Each composition of observation with coarse-graining behaves in one direction only.
   252	
   253	\begin{definition}[Coarse and fine observations]
   254	\label{def:coarse}
   255	Let $\mathrm{Obs}_f$ and $\mathrm{Obs}_c$ be observation functors into record categories $\mathsf{Obs}_f$ and $\mathsf{Obs}_c$. The observation $\mathrm{Obs}_c$ is a coarsening of $\mathrm{Obs}_f$ when a functor $h \colon \mathsf{Obs}_f \to \mathsf{Obs}_c$ exists with $\mathrm{Obs}_c = h \circ \mathrm{Obs}_f$ on objects and morphisms. Separately, given a coarse-graining functor $c$ on the system category (\Cref{def:morphisms}), the observation of the coarse-grained system is the composite functor $\mathrm{Obs} \circ c$.
   256	\end{definition}
   257	
   258	\begin{proposition}[Coarse records separate less]
   259	\label{prop:coarse}
   260	If $\mathrm{Obs}_c$ is a coarsening of $\mathrm{Obs}_f$ through $h$, then $P \approx_{\mathrm{Obs}_f} Q$ implies $P \approx_{\mathrm{Obs}_c} Q$, and the inclusion of relations can be strict: two systems with isomorphic fine records are identified by every coarsening, and two systems with the same coarse records can have non-isomorphic fine records.
   261	\end{proposition}
   262	
   263	\begin{proof}
   264	A comparison witnessing $\mathrm{Obs}_f(P) \cong \mathrm{Obs}_f(Q)$ maps under the functor $h$ to a comparison witnessing $\mathrm{Obs}_c(P) \cong \mathrm{Obs}_c(Q)$, which proves the inclusion. For strictness, take $\Omega = \{1,2,3,4\}$ with $p = (\tfrac{1}{2}, \tfrac{1}{4}, \tfrac{1}{8}, \tfrac{1}{8})$ and $q = (\tfrac{1}{4}, \tfrac{1}{2}, \tfrac{1}{8}, \tfrac{1}{8})$. Let $\mathrm{Obs}_f$ report the joint record of two experiments, the partition $\{\{1,2\}, \{3,4\}\}$ with pushforward $(\tfrac{3}{4}, \tfrac{1}{4})$ for both $p$ and $q$, and the partition $\{\{1,3\}, \{2,4\}\}$ with pushforwards $(\tfrac{5}{8}, \tfrac{3}{8})$ and $(\tfrac{3}{8}, \tfrac{5}{8})$. Let $h$ forget the second experiment, so $\mathrm{Obs}_c$ retains only the first. The fine records differ and the coarse records agree, and the coarsening $h$ is exactly the forgetting map of \Cref{def:coarse}. The computation is reproduced in the computational appendix (\texttt{observation\_\allowbreak quotient.py}, function \texttt{coarse\_\allowbreak vs\_\allowbreak fine}).
   265	\end{proof}
   266	
   267	\Cref{prop:coarse} concerns coarsened observations of the same systems. It does not compare the records of $P$ with the records of $cP$. A coarse-graining of systems is a different construction: fine-indistinguishable systems can have coarse-grained images that a fixed observation functor separates, because $c$ need not respect the isomorphism of fine records. No statement of this paper identifies those two constructions.
   268	
   269	\subsection{Interaction and transitivity}
   270	
   271	\Cref{prop:equivrel} settles transitivity for functorially induced observational equivalence. The open question is whether indistinguishability generated by admissible experiments composes in interacting regimes. The series records this as unstudied, and the present paper does not close it. What can be said is conditional, and both regimes of the conditional statement are realistic.
   272	
   273	\begin{proposition}[Composed experiments]
   274	\label{prop:composed}
   275	Suppose the record category carries a product of records and the observation record of a composite system $A \otimes B$ is the product of the records of the factors. If $P \approx P'$ in the first factor relation and $Q \approx Q'$ in the second, then $P \otimes Q \approx P' \otimes Q'$. If instead the record of a composite contains a joint experiment whose outcome distribution is not determined by the factor records, the implication can fail.
   276	\end{proposition}
   277	
   278	\begin{proof}
   279	Under the stated hypothesis the record of a composite is a product of records, and a product of isomorphisms is an isomorphism, so indistinguishability of the factors is preserved. For the failure direction, take $\Omega = \{1,2,3,4\}$ with distributions $p = (\tfrac{1}{2}, \tfrac{1}{4}, \tfrac{1}{8}, \tfrac{1}{8})$ and $q = (\tfrac{1}{4}, \tfrac{1}{2}, \tfrac{1}{8}, \tfrac{1}{8})$. Let the factor observation be the single experiment with outcome blocks $\{\{1,2\}, \{3,4\}\}$, under which $p \approx q$ (both push forward to $(\tfrac{3}{4}, \tfrac{1}{4})$). On the composite state space $\Omega \times \Omega$ the factor-marginal records of $p \times p$ and $p \times q$ coincide, yet the joint event $\omega_1 = \omega_2$ reports $\sum_i p_i^2 = \tfrac{11}{32}$ under $p \times p$ and $\sum_i p_i q_i = \tfrac{9}{32}$ under $p \times q$. The joint experiment separates two composites whose factor relations identify the factors.
   280	\end{proof}
   281	
   282	Which of the two regimes holds is a property of the interaction data, not of the observation formalism. If the accessible experiments of an interacting composite are the products of the accessible experiments of the factors, composition is safe by \Cref{prop:composed}. If the composition rules $\mathcal{C}$ of the object schema contribute experiments that neither factor admits alone, the implication has no reason to survive.
   283	
   284	\section{Information-geometric distinguishability}
   285	\label{sec:metrics}
   286	
   287	\subsection{Classical uniqueness}
   288	
   289	Distinguishability between statistical models has a canonical classical measure. A Riemannian metric on a space of probability distributions is monotone under stochastic maps when no stochastic map increases the metric distance between distributions.
   290	
   291	\begin{theorem}[Chentsov]
   292	\label{thm:chentsov}
   293	Up to a positive constant multiple, the Fisher information metric is the unique Riemannian metric on spaces of probability distributions that is monotone under stochastic maps.
   294	\end{theorem}
   295	
   296	\begin{proof}[Proof, by reference]
   297	The uniqueness statement is Chentsov's theorem, used here in the form stated and applied at \cite{b8}; the proof is a rigidity argument classifying monotone metrics on the classical simplex. This paper uses the statement as the classical anchor of distinguishability and does not reprove it.
   298	\end{proof}
   299	
   300	Concretely, on the open simplex of positive probability vectors $p = (p_1, \ldots, p_n)$, the Fisher form is
   301	\[
   302	g^{\mathrm{Fisher}}_p(a, a) = \sum_{i=1}^{n} \frac{a_i^2}{p_i}
   303	\]
   304	for tangent vectors $a$ with zero sum, and \Cref{thm:chentsov} says every monotone Riemannian metric on the simplex is a positive multiple of this form. The expression is the one that appears in \Cref{prop:commutative} as the commutative restriction of the quantum family: on commuting data the quantum metrics all give the classical answer.
   305	
   306	Classical statistical distance is therefore pinned down: any criterion that reads distinguishability from a monotone Riemannian metric on classical models must be a multiple of the Fisher metric. This is the one uniqueness result among the family of probability and measure-theoretic structures in the series taxonomy.
   307	
   308	\subsection{Quantum parametricity}
   309	
   310	In the quantum case the uniqueness fails. Monotone metrics on quantum state spaces are given by the Morozova-Chentsov construction indexed by operator monotone functions $f$ on the positive reals, normalized by $f(1) = 1$ and self-reciprocal in Petz's sense, $f(x) = x f(x^{-1})$; the self-reciprocity is the symmetry condition that makes the quadratic form well defined on self-adjoint tangent directions, and distinct self-reciprocal $f$ give distinct metrics.
   311	
   312	\begin{theorem}[Petz-Sudar classification]
   313	\label{thm:petzsudar}
   314	Every quantum monotone metric arises from an operator monotone function $f$ with $f(1) = 1$ and $f(x) = x f(x^{-1})$ through the Morozova-Chentsov form, and distinct such $f$ give distinct metrics on self-adjoint directions. The family is parametric, not a finite list, and no member is distinguished among all monotone metrics.
   315	\end{theorem}
   316	
   317	\begin{proof}[Proof, by reference]
   318	The classification of monotone metrics by operator monotone functions is stated and applied at \cite{b8}, where the classical uniqueness and its quantum failure are contrasted. The self-reciprocity condition identifies each metric with a symmetric representative; without it, $f$ and its transpose $f^{\#}(x) = x f(x^{-1})$ yield the same quadratic form on self-adjoint operators and would be double counted. The parametric nature of the family is the reason the classical uniqueness statement may not be extended to the quantum case.
   319	\end{proof}
   320	
   321	Concretely, for a faithful density operator $\rho$ with eigenvalues $\lambda_i$ and a self-adjoint trace-free operator $A = \sum_{i,j} A_{ij} |i\rangle\langle j|$ in an eigenbasis of $\rho$, the quadratic form of the metric $g_f$ is
   322	\[
   323	g_f^{\rho}(A, A) \;=\; \sum_{i,j} \frac{|A_{ij}|^2}{\lambda_j \, f(\lambda_i / \lambda_j)}.
   324	\]
   325	
   326	\begin{proposition}[Commutative restriction]
   327	\label{prop:commutative}
   328	For every operator monotone $f$ with $f(1) = 1$, the quadratic form $g_f^{\rho}$ restricted to operators $A$ that are diagonal in an eigenbasis of $\rho$ equals $\sum_i |A_{ii}|^2 / \lambda_i$, the classical Fisher form on the commutative subalgebra generated by $\rho$. On commutative data the quantum monotone metrics therefore agree, and the parametric freedom of \Cref{thm:petzsudar} is invisible.
   329	\end{proposition}
   330	
   331	\begin{proof}
   332	For $i \neq j$ the summands of the quadratic form carry factors $|A_{ij}|^2 = 0$ when $A$ is diagonal in the chosen basis. The surviving summands are $|A_{ii}|^2 / (\lambda_i f(1)) = |A_{ii}|^2 / \lambda_i$, since $f(1) = 1$.
   333	\end{proof}
   334	
   335	\subsection{Ruler dependence of the metric scale}
   336	
   337	The parametric freedom becomes visible on non-commuting data. Two self-reciprocal representatives suffice to see it: $f(x) = \tfrac{2x}{1+x}$ and $h(x) = \tfrac{1+x}{2}$, both operator monotone with value $1$ at $1$ and both satisfying $f(x) = x f(x^{-1})$.
   338	
   339	\begin{example}[Two monotone metrics disagree]
   340	\label{ex:monotone}
   341	Let $\rho = \mathrm{diag}(3/4, 1/4)$ and $A = \begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix}$. Then
   342	\[
   343	g_f^{\rho}(A, A) = \frac{1}{\tfrac{1}{4} \cdot \tfrac{3}{2}} + \frac{1}{\tfrac{3}{4} \cdot \tfrac{1}{2}} = \frac{16}{3},
   344	\qquad
   345	g_h^{\rho}(A, A) = \frac{2}{\tfrac{3}{4} + \tfrac{1}{4}} + \frac{2}{\tfrac{1}{4} + \tfrac{3}{4}} = 4.
   346	\]
   347	The two admissible monotone metrics give different quadratic forms at the same state and the same direction, by the factor $4/3$.
   348	\end{example}
   349	
   350	\begin{corollary}[Metric-level distinguishability is not canonical]
   351	\label{cor:noncanonical}
   352	Any criterion that reads quantum distinguishability from a monotone metric must name the function $f$. Different admissible choices give different quadratic forms at the same states and directions, so the numerical scale of ``the monotone-metric distance'' is not a function of the states alone.
   353	\end{corollary}
   354	
   355	\begin{proof}
   356	\Cref{ex:monotone} exhibits a single state and a single direction on which two admissible monotone metrics disagree, and \Cref{thm:petzsudar} guarantees the family contains many more. A criterion built on an unnamed member of the family is therefore not a function of the systems alone.
   357	\end{proof}
   358	
   359	The zero-distance relation is the same for every ruler: each $g_f$ is positive definite on faithful states, so $d_f(\rho, \sigma) = 0$ exactly when $\rho = \sigma$, independently of $f$. The ruler-dependence lives in the numerical values of nonzero distances, not in the equality relation.
   360	
   361	\subsection{Distinguishability beyond metrics}
   362	
   363	The question behind the metric analysis is whether statistical distance yields an operational notion of distinguishability strong enough for classification. Of the available positions, the first two fail as routes to an equivalence relation.
   364	
   365	A single monotone metric with a positive threshold $\varepsilon$ defines a tolerance relation $\{(\rho,\sigma) : d_f(\rho,\sigma) \le \varepsilon\}$. On a connected state space that relation is not transitive for any $\varepsilon > 0$, so by \Cref{prop:equivrel} it cannot be the relation of any observation functor, and it cannot enter the classification quotient. At $\varepsilon = 0$ the relation is state equality for every $f$, so the ruler plays no role. A family of rulers, one threshold per admissible $f$, has the same problem per ruler: each positive-threshold relation is non-transitive, and at zero threshold all rulers agree (\Cref{cor:noncanonical} concerns the numerical scales, not the zero-distance relation). \Cref{lem:products} applies to families of observation functors, not to tolerance relations, so it does not rescue the threshold construction.
   366	
   367	Operational distinguishability defined by admissible experiments is the third position and the only one that produces equivalence relations through \Cref{prop:equivrel}. It is also the least formalized: the admissible experiments of a general system class are not fixed. The position adopted here is the third as the construction of \Cref{sec:functors}, with metrics as derived data computed on records rather than as the definition of distinguishability. Metric thresholds remain legitimate as measures of nearness between records; they do not classify.
   368	
   369	The parametricity result also fixes what a classifying invariant can be. A classifying invariant is a value that determines an object up to the chosen equivalence, computed from the object and nothing else. The Fisher metric has that status in the classical case: it is a function of the probability model alone, unique up to constant (\Cref{thm:chentsov}). No quantum monotone metric has that status, because the value of the distance depends on the chosen function $f$ in addition to the states (\Cref{cor:noncanonical}). The pair (state, ruler) can carry the invariant; the state alone cannot. Any classification table that lists a quantum distinguishability distance as an invariant of the states must therefore list the ruler as part of the invariant or drop the entry.
   370	
   371	\section{Counterexample search}
   372	\label{sec:search}
   373	
   374	The methodology of the series requires a counterexample search against each candidate criterion for physical equivalence. \Cref{tab:criteria} records the candidates and the outcome.
   375	
   376	\begin{table}[t]
   377	\centering
   378	\small
   379	\begin{tabularx}{\textwidth}{@{} L{0.28\textwidth} X L{0.28\textwidth} @{}}
   380	\toprule
   381	Candidate criterion & Outcome & Evidence \\
   382	\midrule
   383	Mathematical isomorphism as physical equivalence & fails to identify dual presentations & a space and its function algebra are non-isomorphic records presenting one object \cite{b3}; a system-level pair is not constructed here \\
   384	Plain tensor-category equivalence & false as a recovery principle & \Cref{thm:eg}, a proved counterexample \\
   385	Monotone-metric distance without naming the metric & numerically not well defined in the quantum case & \Cref{ex:monotone}, computed and cross-checked \\
   386	Coarse observation records as the whole record & identifies more than the fine record & \Cref{prop:coarse} and its computational illustration \\
   387	\bottomrule
   388	\end{tabularx}
   389	\caption{Candidate criteria for physical equivalence and the result of the counterexample search.}
   390	\label{tab:criteria}
   391	\end{table}
   392	
   393	The first row is only partially closed. The program's founding document states that two mathematical descriptions may be physically equivalent without being mathematically isomorphic, and dual presentations are the motivating case. The table gives a mathematical illustration of dual presentations: a compact Hausdorff space and the commutative $C^*$-algebra of its continuous functions are distinct objects of their categories, isomorphic to no common record, yet Gelfand duality identifies them as presentations of one object \cite{b3}. A pair of system records inside one formal framework, proved non-isomorphic and declared physically equivalent, would close the row at the system level; the search did not produce one.
   394	
   395	The second row is different in kind. \Cref{thm:eg} is a proved counterexample, and it falsifies the criterion. The third row is computational and analytic: \Cref{ex:monotone} is verifiable by direct computation and is reproduced by the script named in the code appendix. The fourth row is the monotonicity of \Cref{prop:coarse}: a coarse record is computed from a fine one, so it cannot separate what the fine record identifies.
   396	
   397	A further candidate deserves recording because it is tempting. One might define physical equivalence by equality of all observation records of a fixed maximal family of experiments, in the spirit of operational theories. This criterion is well defined once the family of experiments is fixed, and \Cref{prop:equivrel} applies to it directly. The difficulty is that ``maximal family'' is itself a choice: fix a strictly larger family and the relation becomes finer. No argument in the series selects a canonical family for general systems, so the criterion restates the choice of $\simeq$ rather than resolving it.
   398	
   399	\subsection{A search protocol}
   400	\label{sec:protocol}
   401	
   402	The counterexample search above is repeatable for any future criterion. A candidate relation on system records comes with the morphism kind realizing its identifications, and the protocol screens it in three passes.
   403	
   404	The screening pass reads the preserved layers off the morphism kind and checks them against \Cref{tab:layers}; a witness naming the monoidal layer without symmetry fails on the strength of \Cref{thm:eg} immediately. The testing pass runs the candidate on four cases: a finite classical pair separated only by a second experiment, a qubit pair of monotone metrics disagreeing off the commutative slice, two non-isomorphic groups of order 8 with equal character tables, and a product of observations that separates what its factors hide. A criterion that misidentifies any case is false, and a criterion that passes all four is untested.
   405	
   406	The band pass compares the candidate with \Cref{def:band}: the candidate must be at least as coarse as isomorphism and no coarser than admissible observation.
   407	
   408	A criterion that survives all three steps is not thereby correct. It is admissible so far, and the record of the search is part of the argument: which examples were run, which layers were named, which failure modes were ruled out. The series records no positive criterion for physical equivalence; the outcomes of \Cref{tab:criteria} are the first run of the protocol.
   409	
   410	\section{Reconstruction patterns and representability}
   411	\label{sec:recon}
   412	
   413	Observation functors are stipulated here rather than derived, because the two proved reconstruction patterns do not yet connect across general system classes.
   414	
   415	The classic pattern recovers objects from probes. Gelfand duality reconstructs compact Hausdorff spaces from commutative $C^*$-algebras \cite{b3}; Stone duality reconstructs spectra from Boolean algebras \cite{b6}; the Gelfand-Naimark theorem embeds every $C^*$-algebra in an algebra of operators \cite{b4}. Each theorem is a precise statement with named hypotheses: an object is determined by how probes see it. The modern pattern represents higher-order operations. Categorical supermaps on a theory are concretely representable through channel-state duality whenever the theory has such a duality \cite{b5,b9}, and the factorization theorems for supermaps rest on the Yoneda lemma and on representability \cite{b5}.
   416	
   417	Whether the two patterns connect into one principle is open. The series records the question explicitly: whether the categorical-supermap line unifies with the Gelfand, Stone, and Naimark pattern into a single account of objects determined by their relationships is not established, and this paper does not close it. The relevance to observation functors is a hypothesis rather than a result. If representability of higher-order operations extends from supermaps to observation records in general, then records could be defined as representable objects and the functorial account of \Cref{sec:functors} would be derived rather than stipulated. The hypothesis needs a channel-state-duality statement for the systems in question, and no such statement is on record for general system classes.
   418	
   419	What can be used now is narrower. The reconstruction pattern fixes the shape of a legitimate claim about observation: an object recovered from named probes under named hypotheses is a theorem of reconstruction, not a classification and not an empirical adequacy claim. The series qualification applies to both patterns verbatim: ``Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.'' \Cref{sec:functors} defines observation functors as additional structure, and this section records the standing option of deriving them instead. The option is reasonable and unresolved.
   420	
   421	\section{The empirical layer}
   422	\label{sec:empirical}
   423	
   424	\subsection{Instantiation of the layer}
   425	
   426	The three-layer architecture of the program separates mathematical classification, physical realization, and empirical selection. Layer three is a map from theories to observational constraints or predictions; it is not a claim that every model maps to a single observational object. This section instantiates layer three as an observation functor and marks where the instantiation stops.
   427	
   428	\begin{definition}[Empirical layer as observation functor]
   429	\label{def:layer}
   430	The empirical layer is the functor $\mathrm{Obs} \colon \mathrm{Phys}_{\mathrm{adm}} \to \mathsf{Obs}$ of \Cref{def:obs}, and the observational constraints or predictions of a theory are the contents of its observation record. The symbol $\mathcal{O}$ used for the codomain in the architecture collides with the observable-algebra symbol of the object schema; this paper writes $\mathsf{Obs}$ for the record category and keeps $\mathcal{O}$ for the observable algebra.
   431	\end{definition}
   432	
   433	A mathematical structure can be consistent without describing our universe. Several mathematically distinct theories may produce identical predictions inside an experimentally accessible regime. A complete mathematical classification of representations would not by itself solve the empirical problem (founding document, section 7). The quotient $\mathrm{Ob}(\mathrm{Phys})/{\simeq}$ therefore cannot be formed by mathematical equivalence and then declared empirical; the relation must be argued for at the layer where the theories are compared.
   434	
   435	Related work supplies a representability result in an adjacent direction. Categorical supermaps on a physical theory are concretely representable through channel-state duality whenever the theory has such a duality \cite{b5,b9}. That line shows observational structure of the higher-order kind is representable in the stated settings. It does not define observation records for general systems.
   436	
   437	What the layer is mathematically remains open in the series, and the open items are specific. The composition of observation with coarsened observations is settled by functoriality (\Cref{prop:coarse}); the composition of empirical indistinguishability in interacting regimes is conditional (\Cref{prop:composed}). The codomain $\mathsf{Obs}$ is proposed as a category of records here; the architecture allows observational constraints or predictions, and whether records are the right objects is a modeling choice the program has not fixed. The correct relation $\simeq$ is the central open problem of the whole series, and the results of this paper constrain it from three sides: it must be no finer than observation (\Cref{prop:equivrel}), it must name its preserved layers (\Cref{cor:preserved}), and it must not rest on an unnamed monotone metric (\Cref{cor:noncanonical}).
   438	
   439	\subsection{Contents of the record category}
   440	
   441	\Cref{def:obs} names the record category without fixing its objects beyond outcome data. The results of this paper force specific contents of that category, and each forced content names an open condition.
   442	
   443	Experiments and outcomes are forced by \Cref{prop:equivrel}: a record that carries no outcome data induces the universal relation, and every system is indistinguishable from every other. Outcome labels are fixed by calibration of a given experiment: isomorphism of records compares the outcome distributions of the same experiment on the same label set, and a relabeling of outcomes is an isomorphism of experiment presentations rather than of records of one calibrated experiment. Comparison morphisms between records are forced by \Cref{prop:coarse}: coarsening is a functor on records, so the record category must contain the morphisms that forgetting induces. Limits of records are forced only when limiting procedures are in force, and \Cref{sec:morphisms} records that case as the least settled.
   444	
   445	What remains open is the treatment of interaction. The record of a composite system is not determined by the records of the factors unless the record category carries a monoidal structure mirroring the composition rules $\mathcal{C}$ of the object schema, and \Cref{prop:composed} shows both what holds under a product hypothesis and what can fail without it. The series leaves this open, and the record category proposed here inherits the open status.
   446	
   447	\subsection{Empirical selection as a quotient}
   448	
   449	Instantiated as an observation functor, the empirical layer computes a quotient: two theories land in the same class exactly when their records are isomorphic, which is the relation of \Cref{prop:equivrel}. This is the part of empirical selection that observation performs, and its limits are the limits of the records. A class of the quotient contains every theory compatible with the recorded outcomes, and the founding document anticipates exactly this situation: several mathematically distinct theories may produce identical predictions inside an experimentally accessible regime (section 7).
   450	
   451	Selection among the members of one class is not an observation problem in the sense of \Cref{def:obs}. It requires data the records do not carry: the internal structure of the theories, the behavior outside the accessible regime, or criteria of a different kind entirely. The three-layer architecture keeps this separation explicit: the empirical layer maps theories to observational constraints and predictions, and it is not a claim that every model maps to a single observational object. The quotient of \Cref{prop:equivrel} is the observational part of that map, nothing more.
   452	
   453	\section{Worked examples}
   454	\label{sec:examples}
   455	

exec
/usr/local/bin/zsh -lc "sed -n '455,488p' papers/latex/vol-10-observational-equivalence.tex | nl -ba -v455" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   455	
   456	The constructions of \Cref{sec:functors,sec:metrics} run on explicit data. The explicit data cover a finite classical observation functor with its quotient classes, the qubit computation of \Cref{ex:monotone} in full generality, groups of order 8 whose character tables agree, and a product of observations.
   457	
   458	\subsection{A finite classical observation functor}
   459	
   460	A finite classical system is a probability vector $p$ on a finite microstate set $\Omega$, and its five-tuple of \Cref{def:system} is: $X$ the simplex of distributions on $\Omega$, $\mathcal{O}$ the experiment family, $\mathcal{D}$ trivial (static data), $\mathcal{S}$ trivial, and $\mathcal{C}$ the pointwise product of independent copies. An experiment is a map $e \colon \Omega \to \{1, \ldots, k_e\}$, and its outcome distribution is the pushforward $e_* p$. Fix a family $E = \{e_1, e_2\}$ of experiments; the observation record of the system is the pair of outcome distributions $(e_{1*} p, e_{2*} p)$ with the outcome labels fixed by calibration, and two systems are observationally equivalent over $E$ when these pairs agree. This is an observation functor into the category of finite outcome distributions with fixed labels, and \Cref{prop:equivrel} applies to it as stated.
   461	
   462	Take $\Omega = \{1, 2, 3, 4\}$ and two distributions
   463	\[
   464	p = (\tfrac{1}{2}, \tfrac{1}{4}, \tfrac{1}{8}, \tfrac{1}{8}),
   465	\qquad
   466	q = (\tfrac{1}{4}, \tfrac{1}{2}, \tfrac{1}{8}, \tfrac{1}{8}).
   467	\]
   468	Let $e_1$ partition $\Omega$ as $\{\{1,2\}, \{3,4\}\}$ and $e_2$ as $\{\{1,3\}, \{2,4\}\}$. Then $e_{1*} p = e_{1*} q = (\tfrac{3}{4}, \tfrac{1}{4})$, while $e_{2*} p = (\tfrac{5}{8}, \tfrac{3}{8})$ and $e_{2*} q = (\tfrac{3}{8}, \tfrac{5}{8})$. The coarse record consisting of $e_1$ alone identifies the two systems; the fine record over $E$ separates them. This is the strictness claimed in \Cref{prop:coarse}, computed on four microstates.
   469	
   470	The geometry of the classes is worth stating exactly, because the fine classes are not points. The class of $p$ over the coarse record is the set of distributions with $p_1 + p_2 = \tfrac{3}{4}$, a two-dimensional slice of the simplex $\Delta_3$. The fine class of $p$ over $E$ is the line segment
   471	\[
   472	p(t) = \bigl(\tfrac{1}{2} + t,\; \tfrac{1}{4} - t,\; \tfrac{1}{8} - t,\; \tfrac{1}{8} + t\bigr),
   473	\qquad t \in \bigl[-\tfrac{1}{8}, \tfrac{1}{8}\bigr],
   474	\]
   475	every point of which has $e_{1*} p(t) = (\tfrac{3}{4}, \tfrac{1}{4})$ and $e_{2*} p(t) = (\tfrac{5}{8}, \tfrac{3}{8})$. Adding the third partition $e_3 = \{\{1,4\}, \{2,3\}\}$ separates points of this segment, since $e_{3*} p(t) = (\tfrac{5}{8} + 2t, \tfrac{3}{8} - 2t)$ depends on $t$; with $E' = \{e_1, e_2, e_3\}$ the record determines a distribution on $\Omega$ up to nothing, and the classes are single points.
   476	
   477	\subsection{The qubit computation}
   478	
   479	\Cref{ex:monotone} computed one direction. The general two-dimensional case is closed, and the system tuple is: $X$ the faithful qubit states, $\mathcal{O} = M_2(\mathbb{C})$, $\mathcal{D}$ trivial, $\mathcal{S}$ trivial, $\mathcal{C}$ the tensor product. Let $\rho = \mathrm{diag}(\tfrac{3}{4}, \tfrac{1}{4})$ and $A = a \sigma_x + b \sigma_z$ with real $a, b$, so $A = \begin{pmatrix} b & a \\ a & -b \end{pmatrix}$. For $f(x) = \tfrac{2x}{1+x}$ the quadratic form of \Cref{sec:metrics} is
   480	\[
   481	g_f^{\rho}(A, A) = \tfrac{16}{3}(a^2 + b^2),
   482	\]
   483	and for $h(x) = (1+x)/2$ it is
   484	\[
   485	g_h^{\rho}(A, A) = \tfrac{16}{3} b^2 + 4 a^2.
   486	\]
   487	The two metrics differ only on off-diagonal directions. The diagonal summands contribute $\tfrac{4}{3}b^2 + 4b^2 = \tfrac{16}{3}b^2$ in both cases. For $f(x) = \tfrac{2x}{1+x}$ each of the two off-diagonal summands equals $\tfrac{a^2}{\lambda_2 f(\lambda_1/\lambda_2)} = \tfrac{8}{3}a^2$, so the off-diagonal total is $\tfrac{16}{3}a^2$; for $h(x) = (1+x)/2$ the two summands are $2a^2$ each, for a total of $4a^2$. The metrics coincide when $a = 0$ and differ by the factor $4/3$ when $b = 0$.
   488	

exec
/usr/local/bin/zsh -lc "python3 -c 'from pathlib import Path; import re; s=Path(\"papers/latex/vol-10-observational-equivalence.tex\").read_text(); labels=re.findall(r\"\\\\label\\{(["'^}]+)'"\\}\",s); bibs=re.findall(r\"\\\\bibitem\\{(["'^}]+)'"\\}\",s); refs=[(s.count(chr(10),0,m.start())+1,k.strip()) for m in re.finditer(r\"\\\\(?:Cref|cref|ref|eqref)\\{(["'^}]+)'"\\}\",s) for k in m.group(1).split(\",\")]; cites=[(s.count(chr(10),0,m.start())+1,k.strip()) for m in re.finditer(r\"\\\\cite\\{(["'^}]+)'"\\}\",s) for k in m.group(1).split(\",\")]; print(\"Undefined references:\",[(i,k) for i,k in refs if k not in labels]); print(\"Duplicate labels:\",sorted({k for k in labels if labels.count(k)>1})); print(\"Undefined citations:\",[(i,k) for i,k in cites if k not in bibs])'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 24ms:
Undefined references: []
Duplicate labels: []
Undefined citations: []

codex
Reviewed only `papers/latex/vol-10-observational-equivalence.tex`. This is a source review; compilation and box warnings were not verified.

1. **Lines 607–611 — notation-table overflow.** The first column is only `0.22\textwidth`, but line 611 contains an unbreakable five-component tuple substantially wider than that column. **Fix:** put only `$P$` in the Symbol column and move the full tuple into the Meaning column.

2. **Lines 341 and 479 — oversized inline matrices.** Full `pmatrix` environments inside paragraphs increase line height and produce uneven spacing. **Fix:** move these matrices into displayed equations, or use inline small matrices:
   ```latex
   $A=\bigl(\begin{smallmatrix}0&1\\1&0\end{smallmatrix}\bigr)$
   ```
   Apply the same treatment to the matrix with entries `b,a,a,-b`.

3. **Line 131 — inconsistent reference formatting.** `\Cref{def:matheq} or \ref{def:physeq}` gives the second reference only a number. **Fix:** use `\Cref{def:matheq,def:physeq}` to format both consistently.

4. **Lines 629, 635, and 638 — incorrect typography for page ranges.** `157-218`, `3-24`, and `197-217` use hyphens instead of en dashes. **Fix:** write `157--218`, `3--24`, and `197--217`.

All explicit cross-reference and citation keys resolve within this file, and no duplicate labels were found. No missing package or definite compilation error was apparent from the source. Underfull boxes and other pagination-dependent problems require compilation to assess.

VERDICT: NEEDS_FIX
hook: Stop
hook: Stop Completed
tokens used
60,660
Reviewed only `papers/latex/vol-10-observational-equivalence.tex`. This is a source review; compilation and box warnings were not verified.

1. **Lines 607–611 — notation-table overflow.** The first column is only `0.22\textwidth`, but line 611 contains an unbreakable five-component tuple substantially wider than that column. **Fix:** put only `$P$` in the Symbol column and move the full tuple into the Meaning column.

2. **Lines 341 and 479 — oversized inline matrices.** Full `pmatrix` environments inside paragraphs increase line height and produce uneven spacing. **Fix:** move these matrices into displayed equations, or use inline small matrices:
   ```latex
   $A=\bigl(\begin{smallmatrix}0&1\\1&0\end{smallmatrix}\bigr)$
   ```
   Apply the same treatment to the matrix with entries `b,a,a,-b`.

3. **Line 131 — inconsistent reference formatting.** `\Cref{def:matheq} or \ref{def:physeq}` gives the second reference only a number. **Fix:** use `\Cref{def:matheq,def:physeq}` to format both consistently.

4. **Lines 629, 635, and 638 — incorrect typography for page ranges.** `157-218`, `3-24`, and `197-217` use hyphens instead of en dashes. **Fix:** write `157--218`, `3--24`, and `197--217`.

All explicit cross-reference and citation keys resolve within this file, and no duplicate labels were found. No missing package or definite compilation error was apparent from the source. Underfull boxes and other pagination-dependent problems require compilation to assess.

VERDICT: NEEDS_FIX
