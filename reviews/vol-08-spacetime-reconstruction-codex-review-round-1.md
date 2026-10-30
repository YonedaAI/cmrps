---
reviewer: codex (OpenAI) gpt-6.1-sol
type: formatting
paper: vol-08-spacetime-reconstruction
round: 1
date: 2026-10-30T05:06:27Z
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
session id: 01a18b33-c39d-76f1-9e99-4aefea676365
--------
user
Read ONLY the file papers/latex/vol-08-spacetime-reconstruction.tex (do not explore other files or directories). Review it for LaTeX formatting issues: compilation errors, missing packages, broken references, inconsistent styling, overfull/underfull boxes, spacing problems. List all issues with line numbers and concrete fixes. End your response with a VERDICT line - exactly one of: VERDICT: PASS (no issues remain) or VERDICT: NEEDS_FIX (issues listed above must be fixed).
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
I’ll review only the specified LaTeX file and report issues with line numbers and concrete fixes.
exec
/usr/local/bin/zsh -lc 'nl -ba papers/latex/vol-08-spacetime-reconstruction.tex' in /Users/mlong/Documents/Development/classification-physical-systems
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
    31	\title{Classification and Reconstruction of Spacetime\\[4pt]
    32	  {\normalsize Part 8 of \emph{The Classification of Mathematical Representations of Physical Systems}}}
    33	\author{Matthew Long\\
    34	  \small The YonedaAI Collaboration, YonedaAI Research Collective\\
    35	  \small Chicago, Illinois, USA\\
    36	  \small \texttt{mlong@yonedalabs.ai}\\
    37	  \small \texttt{https://yonedalabs.ai}}
    38	\date{29 October 2026}
    39	
    40	\begin{document}
    41	
    42	\maketitle
    43	
    44	\begin{abstract}
    45	This paper classifies and reconstructs spacetime and separates what is proved from what is proposed. Four results are complete within their stated hypotheses: connected holonomy groups of Lorentzian manifolds in signature $(1,n-1)$ are classified and realized by explicit metrics; the causal ladder of spacetimes is complete as a hierarchy of causality conditions; closed 3-manifolds decompose into exactly eight Thurston geometries; and for two, three, and four boundary regions the holographic entropy cone is cut out by strong subadditivity together with monogamy of mutual information. Against these islands, the homeomorphism problem for closed 4-manifolds is algorithmically undecidable, so finite classification tables exist only in tame regimes. Reconstruction recovers a target geometry from relational probe data: the chronological order determines the topology and the conformal class of a distinguishing spacetime, and entanglement-wedge reconstruction recovers bulk operators from boundary subregions in a quantum-information setting. The Ryu-Takayanagi formula remains a proposal, with exact agreement in AdS$_3$/2D CFT and for spherical regions in higher dimensions, HaPPY codes realize it in toy models only, and entanglement-induced geometry is an argument. Two boundary statements delimit the subject: monogamy of mutual information is independent of strong subadditivity over entropic vectors, and the ladder depends on how its rungs are translated to discrete orders.
    46	\end{abstract}
    47	
    48	\section{Introduction}
    49	
    50	Lorentzian geometry admits no uniform classification by local invariants: the causal, metric, and holonomic structures of a spacetime constrain its metric only up to large equivalence classes. Riemannian manifolds and Lie algebras carry discrete or rigid classification invariants. Lorentzian spacetimes offer global invariants instead: holonomy groups, causal ladder rungs, Thurston model geometries. Each of these determines geometry only within a restricted class or up to conformal rescaling. The questions are which of these invariants classify their stated targets, which of them reconstruct a geometry from relational data, and where the classification runs out.
    51	
    52	The evidence divides cleanly. On one side stand four complete results inside their hypotheses. Connected holonomy groups of Lorentzian manifolds are classified and every entry is realized by a metric \cite{galaev}. The causal ladder of spacetimes is complete: each rung strengthens the previous one and strict counterexamples separate the rungs \cite{minguzzisanchez}. Closed 3-manifolds decompose into exactly eight model geometries \cite{perelman,thurston1982}. For at most four boundary regions the holographic entropy cone is cut out by two named inequalities \cite{baoetal}. On the other side stands a sharp failure: the homeomorphism problem for closed 4-manifolds is algorithmically undecidable, and Tancer's construction needs as few as nine summands of $\mathbb{S}^2 \times \mathbb{S}^2$ \cite{tancer}. That bound limits the topological complexity an undecidability proof requires; it does not separate decidable from undecidable manifolds, and the recognition problem for $\mathbb{S}^4$ itself remains open. Finite tables of model geometries therefore exist in dimension three and not in dimension four.
    53	
    54	Metric reconstruction from non-metric data succeeds classically up to a conformal factor and remains partially conjectural in the quantum setting. In distinguishing spacetimes of dimension $n \ge 3$ the chronological order determines the manifold topology and the conformal metric class \cite{malament,hkm}. Holographic reconstruction operates rigorously only inside restricted code subspaces: boundary subregions reconstruct bulk operators in their entanglement wedge \cite{dongharlowwall}, while the identification of bulk areas with boundary entropies remains an unproved variational prescription \cite{ryutakayanagi}, its toy-model realizations \cite{haappy} and its entanglement arguments \cite{vanraamsdonk} notwithstanding. The proved determination theorems and the proposals are kept in separate sections below, and the proposals never carry the theorems' authority.
    55	
    56	This paper classifies mathematical representations of physical systems rather than physical systems themselves. A system is recorded as a tuple $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ of state space, observables, dynamics, symmetries, and composition rules; spacetime systems carry manifolds, metrics, causal relations, and holonomy groups in the state-space slot. Theorems cited from the literature appear with their hypotheses and their scope. Proposals and arguments are labeled as such in every section where they appear. Statements proved here carry complete proofs, and standard counterexamples are attributed to their sources.
    57	
    58	The relation to prior work is one of scope. The classification theorems used here are complete results about narrow targets: holonomy groups \cite{galaev}, causality conditions \cite{minguzzisanchez}, model geometries \cite{perelman,thurston1982}, and entropy cones \cite{baoetal}. The reconstruction theorems determine geometry from relational data \cite{malament} and represent bulk operators on boundary regions \cite{dongharlowwall}. The holographic literature adds a prescription \cite{ryutakayanagi}, solvable models \cite{haappy}, and a research argument \cite{vanraamsdonk}. What no source supplies is a classification of Lorentzian spacetimes up to isometry, and what this paper adds is a set of boundary results: invariants that fail to be complete (\Cref{prop:incomplete}), inequalities that fail to be redundant (\Cref{prop:mmi}), and a ladder that fails to transfer to discrete models (\Cref{cor:notransfer}). Boundaries of this kind are what a classification program needs before it can state honest targets.
    59	
    60	Two boundary statements are made precise here. Monogamy of mutual information is not implied by strong subadditivity even over classical entropic vectors; the perfectly correlated triple of \Cref{prop:mmi} is the standard counterexample of the holographic-entropy literature \cite{hhm,baoetal}, recorded with a short self-contained derivation. The causal ladder, read as a hierarchy of order-theoretic conditions, depends on how its rungs are translated to discrete orders: the compactness rung holds universally in finite orders while the strict-chronology reading of distinguishing fails there (\Cref{prop:finiteposet}, \Cref{prop:distinguish}).
    61	
    62	The paper also separates three notions that are routinely conflated in emergent-spacetime discussions: classification of geometries by invariants, reconstruction of geometry from probe data, and derivation of a theory's dynamics from information. The first two have proved instances in this volume and the third does not. Executable checks of the entropy inequalities, finite-order causal checks, and a typed taxonomy of the volume's systems accompany the arguments as computational evidence.
    63	
    64	\section{Definitions}
    65	
    66	The definitions state each notion explicitly; classical notions follow standard usage.
    67	
    68	\begin{definition}[Lorentzian spacetime]\label{def:spacetime}
    69	A \emph{Lorentzian spacetime} is a connected, time-orientable smooth manifold $M$ of dimension $n \ge 2$ equipped with a Lorentzian metric $g$ of signature $(1, n-1)$. The points of $M$ are events. Two spacetimes $(M,g)$ and $(M',g')$ are \emph{conformally equivalent} when a diffeomorphism pulls one metric back to a positive conformal multiple $e^{2f} g'$ of the other. They are \emph{isometric} when the conformal factor is constant equal to one.
    70	\end{definition}
    71	
    72	\begin{definition}[Causal relations]\label{def:causal}
    73	For events $p, q \in M$ write $p \prec q$ when a future-directed timelike curve joins $p$ to $q$, and $p \le q$ when a future-directed causal curve joins them. Write $I^+(p) = \{ q : p \prec q \}$ and $J^+(p) = \{ q : p \le q \}$, and symmetrically for the pasts. The relations $\prec$ and $\le$ are the \emph{causal order} of the spacetime.
    74	\end{definition}
    75	
    76	\begin{definition}[The causal ladder]\label{def:ladder}
    77	A Lorentzian spacetime is \emph{chronological} when no closed timelike curve exists, \emph{causal} when no closed causal curve exists, \emph{distinguishing} when $I^-(p) = I^-(q)$ implies $p = q$ and $I^+(p) = I^+(q)$ implies $p = q$ (past-distinguishing and future-distinguishing), \emph{strongly causal} when every event has a neighborhood base of causally convex open sets, \emph{stably causal} when a time function exists, \emph{causally continuous} when distinguishing and the maps $p \mapsto I^{\pm}(p)$ are outer continuous (the spacetime is reflecting), \emph{causally simple} when distinguishing and each $J^+(p)$, $J^-(p)$ is closed, and \emph{globally hyperbolic} when the spacetime is causal and $J^+(p) \cap J^-(q)$ is compact for all $p, q$. These conditions form the \emph{causal ladder}, ordered from chronology to global hyperbolicity \cite{minguzzisanchez}. Causality is part of the definition of global hyperbolicity: compact diamonds alone do not exclude closed causal curves.
    78	\end{definition}
    79	
    80	\begin{definition}[Holonomy]\label{def:holonomy}
    81	For a Lorentzian spacetime $(M,g)$ the \emph{holonomy group} $\mathrm{Hol}(g)$ is the subgroup of $\mathrm{O}(1,n-1)$ obtained by parallel transport of the Levi-Civita connection along piecewise smooth loops at a base point; the \emph{restricted holonomy} $\mathrm{Hol}^0(g)$ is the identity component. The metric $g$ is \emph{decomposable} when the tangent bundle splits as an orthogonal direct sum of proper nondegenerate subspaces that are parallel for the connection, equivalently when $\mathrm{Hol}(g)$ preserves such a splitting; a Lorentzian splitting consists of a Lorentzian factor and one or more Riemannian factors. Otherwise $g$ is \emph{indecomposable}.
    82	\end{definition}
    83	
    84	\begin{definition}[Entropy vectors]\label{def:entropy}
    85	Let $A_1, \dots, A_n$ be boundary regions and let $S$ assign a nonnegative real number $S(A)$ to every nonempty union $A = A_{i_1} \cup \cdots \cup A_{i_k}$, with $S(\emptyset) = 0$. The tuple $S \in \mathbb{R}^{2^n - 1}$ is an \emph{entropy vector}. An entropy vector is \emph{entropic} when it is realized by the von Neumann entropy of some quantum state on the tensor product of the region Hilbert spaces. Standard inequalities include subadditivity $S(A) + S(B) \ge S(AB)$, the Araki-Lieb bound $|S(A) - S(B)| \le S(AB)$, and strong subadditivity
    86	\begin{equation}\label{eq:ssa}
    87	S(U) + S(V) \ge S(U \cup V) + S(U \cap V)
    88	\end{equation}
    89	for all unions $U, V$ of the $A_i$. Mutual information is $I(A{:}B) = S(A) + S(B) - S(AB)$, and conditional mutual information is $I(A{:}B \mid C) = S(AC) + S(BC) - S(ABC) - S(C)$. Monogamy of mutual information for three disjoint regions $A$, $B$, $C$ (single or composite unions of the $A_i$) is the inequality
    90	\begin{equation}\label{eq:mmi}
    91	S(A) + S(B) + S(C) + S(ABC) \le S(AB) + S(AC) + S(BC).
    92	\end{equation}
    93	The inequality applies to every choice of disjoint $A$, $B$, $C$; for single regions it reads as stated, and for composite regions it gives the coarse-grained instances used at $n = 4$.
    94	\end{definition}
    95	
    96	\begin{definition}[Holographic entropy cone]\label{def:cone}
    97	Fix $n$ boundary regions of a conformal field theory with a smooth static classical Einstein dual. The Ryu-Takayanagi prescription assigns each region $A$ the area of a minimal bulk surface homologous to $A$ in a static slice; the resulting vectors $S$ lie in the \emph{holographic entropy cone} $\mathcal{H}_n \subseteq \mathbb{R}^{2^n-1}$, the closure of vectors realized by such surfaces. An \emph{RT inequality} is a linear inequality valid on $\mathcal{H}_n$ \cite{baoetal}. Staticity keeps the minimal-area prescription of \cite{ryutakayanagi} in force; a covariant extremal-surface prescription exists \cite{hrt} and is not used in this paper.
    98	\end{definition}
    99	
   100	\begin{definition}[Reconstruction from probes]\label{def:reconstruction}
   101	A \emph{probe datum} for a class of spacetimes is a rule assigning to each spacetime relational data $D(M,g)$ that does not name the metric: a causal order, a family of curves, an algebra of observables, a set of entropies. A \emph{reconstruction} of a target $T$ from $D$ is a procedure which recovers $T$ from $D(M,g)$ for every spacetime in a stated class, together with a proof that the recovery is faithful for a stated equivalence: isometry, conformal isometry, or isomorphism. A reconstruction theorem must state its class, its datum, and its equivalence; a reconstruction claim without all three is incomplete.
   102	\end{definition}
   103	
   104	\begin{definition}[Systems of this volume]\label{def:systems}
   105	The physical systems of this volume are tuples $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ in which $X$ carries geometric data: a smooth manifold with a Lorentzian metric, a causal relation, a holonomy group, or one of the Thurston geometry types. Entropy-vector systems carry measure-theoretic data and are included because the holographic cone is defined on them. All equivalences used in this volume are stated in the results that use them; none is assumed silently.
   106	\end{definition}
   107	
   108	\begin{definition}[Spacetime classification problem]\label{def:classify}
   109	Fix a dimension $n$ and an equivalence $\simeq$ among isometry, conformal equivalence, and diffeomorphism. The \emph{classification problem} $\mathrm{Class}(\mathrm{Lor}_n / \simeq)$ is the problem of describing the equivalence classes of Lorentzian spacetimes of dimension $n$ by a complete set of invariants: a list of values such that two spacetimes carry the same values exactly when they are $\simeq$-equivalent. A solution must state the equivalence, the invariant, and the class; a list of invariants that is constant on classes but not separating on them is a partial solution only.
   110	\end{definition}
   111	
   112	\begin{remark}[Claim status]\label{rem:status}
   113	The program distinguishes a proved theorem from a proposal and an argument. In this paper, theorems are cited with their hypotheses and their sources, propositions proved here carry complete proofs, and the conjectural holographic material is marked as proposal or argument in every section where it appears. Computational evidence is evidence and is never presented as proof.
   114	\end{remark}
   115	
   116	\section{Classification invariants}
   117	
   118	A classification is only as sharp as the invariant it uses. \Cref{tab:invariants} records the invariants in force for this volume: five rows classify their stated targets completely within stated classes, and one row records the open reconstruction problem.
   119	
   120	\begin{table}[t]
   121	\centering
   122	\caption{Classification invariants of this volume. ``Scope'' names the class the invariant classifies; ``Status'' records whether the classification is complete, partial, or open.}
   123	\label{tab:invariants}
   124	\small
   125	\begin{tabularx}{\textwidth}{L{0.20\textwidth}L{0.26\textwidth}L{0.30\textwidth}X}
   126	\toprule
   127	Invariant & Classifies & Scope & Status \\
   128	\midrule
   129	Holonomy group & Connected holonomy types & Indecomposable Lorentzian metrics & Complete \\
   130	Causal class & Rung of the causal ladder & Lorentzian spacetimes & Complete \\
   131	Thurston geometry type & Geometry type of each piece & Pieces of a closed 3-manifold decomposition & Complete \\
   132	RT inequality data & Facets of the entropy cone & At most 4 boundary regions & Complete \\
   133	Conformal class & Metric up to conformal factor & Distinguishing spacetimes & Complete \\
   134	Entanglement data & Bulk geometry & Holographic code subspaces & Open \\
   135	\bottomrule
   136	\end{tabularx}
   137	\end{table}
   138	
   139	The rows attach data to a spacetime without fixing its isometry class, as \Cref{prop:incomplete} shows. The last row states the reconstruction problem in the language of invariants. The conformal class is recovered from the chronological order (\Cref{thm:malament}) and the isometry class is not (\Cref{cor:confactor}). Bulk geometry is recovered inside a code subspace from boundary operator data (\Cref{thm:dhw}) and is not known to be recovered from entanglement data alone. Classification and reconstruction use the same rows of the table and ask different questions of them.
   140	
   141	\section{Incomplete invariants}
   142	
   143	Invariants do not classify unless they are complete. The holonomy group, the causal class, and the dimension fail to be complete: an explicit pair of spacetimes shares all three and is not isometric.
   144	
   145	\begin{proposition}[Shared invariants, distinct spacetimes]\label{prop:incomplete}
   146	There exist two Lorentzian spacetimes with the same dimension, the same holonomy group, and the same causal class, which are not isometric. Concretely, the flat plane $\mathbb{R}^{1,1}$ with metric $-dt^2 + dx^2$ and the flat cylinder $\mathbb{R} \times \mathbb{S}^1$ with metric $-dt^2 + d\theta^2$ both have trivial holonomy and are both globally hyperbolic, and no isometry exists between them.
   147	\end{proposition}
   148	
   149	\begin{proof}
   150	Both metrics are flat: the Riemann tensor vanishes in the coordinates displayed, so parallel transport is path-independent and the holonomy group of each is the identity. Both are globally hyperbolic: $t$ is a time function on each space, every inextendible causal curve meets each level set of $t$ exactly once, the level sets are Cauchy surfaces, and each causal diamond is closed with $t$ bounded and with spatial coordinate in a compact circle or an interval, hence compact. The two spaces are not diffeomorphic: the fundamental group of the cylinder is $\mathbb{Z}$ and the fundamental group of the plane is trivial, and an isometry would in particular be a diffeomorphism. Hence the listed invariants do not determine the isometry class.
   151	\end{proof}
   152	
   153	\begin{corollary}[Classification by these invariants is not classification]\label{cor:notclassifies}
   154	No classification of Lorentzian spacetimes up to isometry can be read off the holonomy group, the causal class, and the dimension alone. Any complete classification must add global invariants, such as topology or global curvature data, and the list of \Cref{tab:invariants} must be read as a list of attached data rather than as a complete set of coordinates.
   155	\end{corollary}
   156	
   157	\begin{proof}
   158	\Cref{prop:incomplete} exhibits two non-isometric spacetimes with identical values of every listed invariant, so the map from spacetimes to invariant values is not injective on isometry classes.
   159	\end{proof}
   160	
   161	The holonomy classification of \Cref{thm:holonomy} and the ladder of \Cref{thm:ladder} are sharp exactly because their targets are narrow: possible holonomy groups, and possible causality regimes. \Cref{cor:notclassifies} states the complementary limit: a sharp invariant classification of a feature is not a classification of the object. A complete classification in this sense would need additional global invariants, such as topology or global curvature data, in addition to the rows of \Cref{tab:invariants}.
   162	
   163	\section{Lorentzian holonomy}
   164	
   165	Holonomy is the classical invariant of a metric connection. For Lorentzian metrics it is completely classified \cite{galaev}, and this section records the classification together with two proved structural properties of the invariant.
   166	
   167	\begin{theorem}[Lorentzian holonomy classification]\label{thm:holonomy}
   168	Let $(M,g)$ be a connected, simply connected Lorentzian manifold of signature $(1,n-1)$ with $g$ indecomposable. Then the connected holonomy group $\mathrm{Hol}^0(g)$ is one of the following: the full group $\mathrm{SO}(1,n-1)^{\uparrow}$; a special holonomy group whose algebra stabilizes a null line and embeds in the similarity algebra $\mathfrak{sim}(n-2) = (\mathbb{R} \oplus \mathfrak{so}(n-2)) \ltimes \mathbb{R}^{n-2}$; or, when $g$ is locally symmetric, the isotropy holonomy of a symmetric space. Every entry of the list is the holonomy group of an explicitly constructed Lorentzian metric \cite{galaev}.
   169	\end{theorem}
   170	
   171	\par\medskip\noindent\emph{Argument structure.}\,
   172	The classification proceeds in three steps. First, the holonomy algebra embeds in $\mathfrak{so}(1,n-1)$ and is restricted by Berger's criterion in its Lorentzian form: an algebra acting irreducibly is all of $\mathfrak{so}(1,n-1)$, while a reducible indecomposable algebra must stabilize a null line, since a subalgebra preserving a timelike direction would split the metric. Second, the null-line-stabilizing case is classified by prolongation: the algebra embeds in $\mathfrak{sim}(n-2)$ and its screen projection in $\mathfrak{so}(n-2)$ is a Riemannian holonomy algebra, so the candidate list reduces to the Riemannian Berger list with the extra similarity data. Third, realization constructs a Walker or plane-wave type metric for each admitted algebra and checks its holonomy by direct computation of the curvature and its parallel translates. The complete argument, including the full entry-by-entry table and the realizing metrics, is in the survey of Galaev \cite{galaev}, which supplies the complete proof.
   173	\par\medskip
   174	
   175	\begin{remark}[Invariant, not classifier]\label{rem:holonomyinvariant}
   176	The holonomy group classifies holonomy groups, not spacetimes. Many non-isometric metrics share a holonomy type, and the classification of \Cref{thm:holonomy} is a classification of the invariant recorded in \Cref{tab:invariants}. It is the spacetime analogue of classifying the possible values of an invariant, which is a different achievement from classifying the objects on which the invariant is evaluated.
   177	\end{remark}
   178	
   179	\begin{proposition}[Holonomy of a product]\label{prop:product}
   180	Let $(M_1, g_1)$ and $(M_2, g_2)$ be connected pseudo-Riemannian manifolds. On the product $M_1 \times M_2$ with the product metric $g_1 \oplus g_2$, the restricted holonomy satisfies
   181	\[
   182	\mathrm{Hol}^0(g_1 \oplus g_2) = \mathrm{Hol}^0(g_1) \times \mathrm{Hol}^0(g_2).
   183	\]
   184	\end{proposition}
   185	
   186	\begin{proof}
   187	The Levi-Civita connection of a product metric is the direct sum of the factor connections, so parallel transport preserves the splitting $T(M_1 \times M_2) = TM_1 \oplus TM_2$ of tangent spaces into horizontal and vertical parts. By the Ambrose-Singer theorem the restricted holonomy algebra is generated by parallel translates of curvature endomorphisms. The curvature of the product splits as $R = R_1 \oplus R_2$, each factor curvature acting only on its own summand, so the generated algebra is $\mathfrak{hol}^0(g_1) \oplus \mathfrak{hol}^0(g_2)$. Exponentiating gives the group identity for restricted holonomy. No completeness assumption is used; the identity concerns the restricted group, which is generated by contractible loops.
   188	\end{proof}
   189	
   190	\Cref{prop:product} is the invariant-level statement of what it means for a metric to decompose. Indecomposability in \Cref{def:holonomy} is exactly the failure of this splitting, and the holonomy classification of \Cref{thm:holonomy} is a classification of the indecomposable case.
   191	
   192	\begin{lemma}[Restricted holonomy]\label{lem:restricted}
   193	For every Lorentzian spacetime the restricted holonomy $\mathrm{Hol}^0(g)$ is a connected Lie subgroup of $\mathrm{SO}(1,n-1)^{\uparrow}$, and time-orientability places the full holonomy $\mathrm{Hol}(g)$ in the orthochronous group $\mathrm{O}(1,n-1)^{\uparrow}$. The quotient $\mathrm{Hol}(g)/\mathrm{Hol}^0(g)$ is countable in its intrinsic topology, and the classification of \Cref{thm:holonomy} concerns the connected part.
   194	\end{lemma}
   195	
   196	\begin{proof}
   197	$\mathrm{Hol}^0(g)$ is generated by parallel transport along contractible loops, hence connected and contained in the identity component $\mathrm{SO}(1,n-1)^{\uparrow}$ on every Lorentzian manifold, independently of orientability. Time-orientability is exactly the condition that parallel transport preserves time-orientation on all loops, so $\mathrm{Hol}(g)$ lies in the orthochronous group. The quotient of a Lie group by its identity component is countable in the intrinsic topology of the quotient, though it need not be discrete in the subspace topology of $\mathrm{O}(1,n-1)$.
   198	\end{proof}
   199	
   200	\begin{remark}[Two standard examples]\label{rem:holonomyexamples}
   201	Two metrics illustrate the cases of \Cref{thm:holonomy}. The flat metric on Minkowski space has trivial holonomy and is both decomposable and locally symmetric, so it sits outside the indecomposable list of the theorem: its trivial holonomy is an instance of \Cref{prop:product} applied to flat factors. A plane-wave metric (a Walker metric with parallel null vector) is indecomposable with a special holonomy group obtained by the prolongation construction, and its holonomy is the proper null-line-stabilizing entry predicted by \Cref{thm:holonomy} and realized by the metric itself \cite{galaev}. The special entries of the list are attained by such metrics rather than merely possible.
   202	\end{remark}
   203	
   204	\begin{table}[t]
   205	\centering
   206	\caption{Coarse strata of the Lorentzian holonomy classification. The entry-by-entry table with realizing metrics is in the cited survey; the strata record how the cases are organized.}
   207	\label{tab:holonomy}
   208	\small
   209	\begin{tabularx}{\textwidth}{L{0.24\textwidth}L{0.34\textwidth}X}
   210	\toprule
   211	Stratum & Holonomy type & Scope \\
   212	\midrule
   213	Generic & Full group $\mathrm{SO}(1,n-1)^{\uparrow}$ & Indecomposable metrics without special structure \\
   214	Special & Null-line-stabilizing algebras inside $\mathfrak{sim}(n-2)$ & Plane waves and Walker metrics realizing each entry \\
   215	Symmetric & Isotropy of a symmetric space & Locally symmetric Lorentzian metrics \\
   216	Decomposable & Products of factor holonomy groups & Split metrics, by \Cref{prop:product} \\
   217	\bottomrule
   218	\end{tabularx}
   219	\end{table}
   220	
   221	\Cref{tab:holonomy} is an organization of \Cref{thm:holonomy}, not a second classification: the proved statement is the entry-by-entry list with realizing metrics \cite{galaev}, and the strata record the three constructions used in the proof plus the decomposable case excluded from it. Read as classification data, the table says which construction a given holonomy group came from; it does not say which spacetime carries it.
   222	
   223	\section{The causal ladder}
   224	
   225	Causality conditions order spacetimes by how badly causal curves misbehave. The ladder is complete as a classification of these conditions \cite{minguzzisanchez}, and its rungs do not survive translation to discrete orders.
   226	
   227	\begin{theorem}[Completeness of the causal ladder]\label{thm:ladder}
   228	For Lorentzian spacetimes the causality conditions of \Cref{def:ladder} form a strict chain: global hyperbolicity implies causal simplicity, which implies causal continuity, which implies stable causality, which implies strong causality, which implies distinguishing, which implies causality, which implies chronology. Each implication is strict: for each pair of adjacent rungs there exists a spacetime satisfying the lower rung and violating the higher one. Global hyperbolicity is the strongest of the standard causality conditions, and it is equivalent to the compactness of causal diamonds $J^+(p) \cap J^-(q)$ together with the absence of closed causal curves \cite{minguzzisanchez}.
   229	\end{theorem}
   230	
   231	\par\medskip\noindent\emph{Argument structure.}\,
   232	The implications are proved in the source in a single framework with minimal hypotheses; the strictness is proved by constructing, for each pair of adjacent rungs, a separating spacetime, and the equivalences at the top rung are proved by the compactness characterization of global hyperbolicity. The survey of Minguzzi and S\'{a}nchez also records the alternative definitions of each rung and the smoothability results needed to make the examples smooth. The contribution of this paper begins at \Cref{prop:finiteposet}, where the ladder is tested against a different category of causal models.
   233	\par\medskip
   234	
   235	\begin{remark}[Separating examples]\label{rem:separating}
   236	The strictness of \Cref{thm:ladder} is witnessed by standard examples catalogued in \cite{minguzzisanchez}: spacetimes with closed timelike curves fail chronology, quotients with closed causal curves but no closed timelike curve fail causality only, and each higher rung has a separating example in which the lower rung holds and the higher one fails. The existence of these examples is what makes the ladder a classification of causality conditions rather than a list of definitions: each name refers to a genuinely distinct regime.
   237	\end{remark}
   238	
   239	\begin{table}[t]
   240	\centering
   241	\caption{Rungs of the causal ladder and the pathology each excludes. The chain of implications is strict; \Cref{thm:ladder} and \Cref{rem:separating} give the implications and the separating examples.}
   242	\label{tab:ladder}
   243	\small
   244	\begin{tabularx}{\textwidth}{L{0.26\textwidth}X}
   245	\toprule
   246	Rung & Pathology excluded \\
   247	\midrule
   248	Chronological & Closed timelike curves \\
   249	Causal & Closed causal curves \\
   250	Distinguishing & Distinct events with identical pasts or identical futures \\
   251	Strong causality & Causal curves returning arbitrarily close to their starting event \\
   252	Stable causality & The absence of a global time function \\
   253	Causal continuity & The failure of outer continuity for pasts and futures \\
   254	Causal simplicity & Causal futures and pasts that are not closed sets \\
   255	Global hyperbolicity & Closed causal curves or noncompact causal diamonds \\
   256	\bottomrule
   257	\end{tabularx}
   258	\end{table}
   259	
   260	\Cref{tab:ladder} doubles as the checklist used by the finite-order tests of \Cref{prop:finiteposet} and \Cref{prop:distinguish}: the compactness rung passes on every finite order and the distinguishing rung fails on the antichain, which is the first row where the discrete translation breaks.
   261	
   262	The ladder is a theorem about the category of Lorentzian manifolds. Causal set models and other discrete approaches to spacetime replace the manifold by a partially ordered set. The next two propositions show that the ladder's rungs do not transfer to that regime.
   263	
   264	\begin{proposition}[Finite orders satisfy the compactness rung]\label{prop:finiteposet}
   265	Let $(X, \le)$ be a finite partially ordered set, read as a causal model with $x < y$ meaning that $x$ precedes $y$. Then no strictly increasing loop $x_1 < x_2 < \cdots < x_k < x_1$ exists, and every order interval $[x,y] = \{ z : x \le z \le y \}$ is a finite set. Consequently the order-theoretic analogues of chronology and of compact causal diamonds hold for every finite order.
   266	\end{proposition}
   267	
   268	\begin{proof}
   269	A strictly increasing loop would give $x_1 < x_1$ by transitivity, contradicting irreflexivity of a partial order. Every order interval is a subset of the finite set $X$, hence finite, and a finite set is compact in every topology. Both claims use only the order axioms and finiteness.
   270	\end{proof}
   271	
   272	\begin{proposition}[Distinguishing fails in finite orders under the strict reading]\label{prop:distinguish}
   273	Read the ladder rungs on an order by translating the open futures and pasts literally: $I^+(x) = \{ y : x < y \}$ and $I^-(x) = \{ y : y < x \}$. Under this translation there exists a finite order satisfying the conclusions of \Cref{prop:finiteposet} and failing distinguishing: for the two-element antichain $X = \{a, b\}$ with $a$ and $b$ incomparable, one has $I^-(a) = I^-(b) = \emptyset$ and $I^+(a) = I^+(b) = \emptyset$ for distinct points.
   274	\end{proposition}
   275	
   276	\begin{proof}
   277	In an antichain no two distinct points are related, so every chronological future and past is empty. Distinct points therefore carry identical pasts and identical futures, while the order-theoretic compactness of intervals holds vacuously. This is exactly the failure mode \Cref{def:ladder} forbids at the distinguishing rung.
   278	\end{proof}
   279	
   280	\begin{corollary}[Translation dependence of the ladder on finite orders]\label{cor:notransfer}
   281	Rung membership of the causal ladder is not invariant under the translation from continuum definitions to orders. The strict reading of \Cref{prop:distinguish} fails on finite orders while the compactness rung holds universally there, and the reflexive reading built from causal futures $J^{\pm}(x) = \{ y : y \le x \}$ is distinguishing on every antisymmetric order by construction. A discrete causality theory must therefore state which translation it uses, and the rungs cannot be carried over verbatim from the manifold category.
   282	\end{corollary}
   283	
   284	\begin{proof}
   285	Combine \Cref{prop:finiteposet} and \Cref{prop:distinguish} with \Cref{thm:ladder}. In the manifold category global hyperbolicity implies distinguishing. In the finite-order reading, the analogue of global hyperbolicity holds on the antichain and the analogue of distinguishing fails. The implication structure therefore differs between the two categories.
   286	\end{proof}
   287	
   288	The result does not say that discrete models of spacetime are unreasonable. It says that a classification invariant proved in the manifold category is not automatically an invariant of the discrete one, and any program that imports the ladder into causal set theory must prove new theorems rather than cite \cite{minguzzisanchez}. The finite orders studied here carry no additional structure. Causal-set formulations of discrete spacetime impose local finiteness and a natural measure in addition to the order and define their own discrete causality conditions; those formulations lie outside the scope of this volume.
   289	
   290	\section{Geometrization in low dimensions}
   291	
   292	Dimension three admits a finite table of model geometries. Dimension four does not admit an algorithmic classification. This contrast is the sharpest classification boundary in the volume.
   293	
   294	\begin{theorem}[Geometrization of closed 3-manifolds]\label{thm:geometrization}
   295	Every closed 3-manifold decomposes along a canonical family of spheres and tori into pieces, each of which admits one of exactly eight Thurston model geometries: $\mathbb{E}^3$, $\mathbb{S}^3$, $\mathbb{H}^3$, $\mathbb{S}^2 \times \mathbb{R}$, $\mathbb{H}^2 \times \mathbb{R}$, $\mathrm{Nil}$, $\mathrm{Sol}$, and $\widetilde{\mathrm{SL}}(2, \mathbb{R})$. The decomposition is unique up to isotopy, and each geometry is realized by a homogeneous metric on its model space \cite{perelman,thurston1982}.
   296	\end{theorem}
   297	
   298	\par\medskip\noindent\emph{Argument structure.}\,
   299	Thurston reduced the classification of closed 3-manifolds to the geometrization statement, proved by Perelman through Ricci flow with surgery: the flow breaks the manifold at controlled singularities, and the surgery pieces are precisely the pieces carrying one of the eight model geometries. The list of eight is exhaustive because a model geometry is a maximal simply connected homogeneous geometry, and the classification of such geometries in dimension three gives eight \cite{thurston1982,perelman}.
   300	\par\medskip
   301	
   302	\begin{table}[t]
   303	\centering
   304	\caption{The eight Thurston geometries of dimension three and the dimensions of their isometry groups. Each geometry is realized on its model space by a homogeneous metric; the list is exhaustive by \Cref{thm:geometrization}.}
   305	\label{tab:geometries}
   306	\small
   307	\begin{tabular}{llr}
   308	\toprule
   309	Geometry & Model space & Isometry dimension \\
   310	\midrule
   311	Euclidean & $\mathbb{E}^3$ & 6 \\
   312	Spherical & $\mathbb{S}^3$ & 6 \\
   313	Hyperbolic & $\mathbb{H}^3$ & 6 \\
   314	Spherical times line & $\mathbb{S}^2 \times \mathbb{R}$ & 4 \\
   315	Hyperbolic times line & $\mathbb{H}^2 \times \mathbb{R}$ & 4 \\
   316	Nil & Heisenberg group & 4 \\
   317	Sol & Solvable Lie group & 3 \\
   318	Universal cover of $\mathrm{SL}(2, \mathbb{R})$ & $\widetilde{\mathrm{SL}}(2, \mathbb{R})$ & 4 \\
   319	\bottomrule
   320	\end{tabular}
   321	\end{table}
   322	
   323	\begin{proposition}[Homogeneity of the model geometries]\label{prop:homogeneous}
   324	Each of the eight geometries of \Cref{tab:geometries} is homogeneous: its isometry group acts transitively on the model space. The maximal isometry dimension in dimension three is six, attained by exactly the constant-curvature geometries $\mathbb{E}^3$, $\mathbb{S}^3$, and $\mathbb{H}^3$.
   325	\end{proposition}
   326	
   327	\begin{proof}
   328	Each model space is a simply connected Lie group or a symmetric space carrying an invariant metric of the stated signature (Riemannian here), and the isometry group of an invariant metric on a Lie group contains the left translations, which act transitively. The dimension counts in \Cref{tab:geometries} are the dimensions of the full isometry groups of the model metrics, computed from the Killing fields of the corresponding homogeneous structures. In dimension three the isotropy of a homogeneous geometry is a subgroup of $\mathrm{O}(3)$ of dimension at most three, so the isometry dimension is at most six, and the three constant-curvature geometries attain the bound because their isotropy is all of $\mathrm{O}(3)$. The eight entries are precisely the maximal such geometries; maximality is the classification input of \Cref{thm:geometrization} \cite{thurston1982}.
   329	\end{proof}
   330	
   331	\begin{theorem}[Unrecognizability in dimension four]\label{thm:tancer}
   332	The recognition problem for closed 4-manifolds is algorithmically undecidable: there is no algorithm that takes as input a finite triangulation of a closed 4-manifold and decides whether it is homeomorphic to $\#_9(\mathbb{S}^2 \times \mathbb{S}^2)$. The connected sum $\#_9(\mathbb{S}^2 \times \mathbb{S}^2)$ is therefore unrecognizable, improving the previous bound $\#_{12}(\mathbb{S}^2 \times \mathbb{S}^2)$ of Gordon \cite{tancer}.
   333	\end{theorem}
   334	
   335	\par\medskip\noindent\emph{Argument structure.}\,
   336	The construction encodes the Adian-Rabin set of a group presentation into the topology of a simply connected 4-manifold built from the presentation, and shows that the homeomorphism type of the resulting connected sum of copies of $\mathbb{S}^2 \times \mathbb{S}^2$ decides a property of the presentation that is known to be undecidable. Removing Markov's trick and reducing the deficiency of the presentation lowers the number of summands from twelve to nine \cite{tancer}.
   337	\par\medskip
   338	
   339	\begin{corollary}[Dimension contrast]\label{cor:dimcontrast}
   340	A finite table of model geometries with a canonical decomposition theorem exists for closed 3-manifolds and cannot exist, in the algorithmic sense, for closed 4-manifolds. Classification of closed manifolds by a finite table of models is a tame-regime phenomenon.
   341	\end{corollary}
   342	
   343	\begin{proof}
   344	\Cref{thm:geometrization} supplies the finite table and the decomposition in dimension three. \Cref{thm:tancer} shows that no algorithm can recognize the members of even a single infinite family of closed 4-manifolds, so no finite table can be accompanied by an algorithmic identification procedure in dimension four.
   345	\end{proof}
   346	
   347	\begin{remark}[Model geometries in dimension four]\label{rem:filipkiewicz}
   348	Four-dimensional model geometries do exist as a list: Filipkiewicz classified them into eighteen geometries together with one countably infinite family \cite{hillman}. The existence of a list of homogeneous models is not a classification of manifolds, and \Cref{thm:tancer} shows that recognition of manifolds carrying those geometries is undecidable in general. Restricted classes do decompose; the unrestricted classification does not exist.
   349	\end{remark}
   350	
   351	\section{The holographic entropy cone}
   352	
   353	The holographic entropy cone is the one classification result on the quantum-information side of this volume whose completeness is proved in a bounded range. The bound matters: for two, three, and four regions the inequality set is known and small; five regions are settled by a later enumeration; from six regions on the facet lists are open. The explosion of facets from five regions on tracks the proliferation of minimal-graph topologies that minimal surfaces can realize \cite{baoetal}.
   354	
   355	\begin{theorem}[Entropy cone for at most four regions]\label{thm:cone}
   356	Fix $n \in \{2, 3, 4\}$ boundary regions of a conformal field theory with a smooth static classical Einstein dual. The holographic entropy cone $\mathcal{H}_n$ coincides with the polyhedral cone cut out by the RT inequalities, and these are exactly the strong subadditivity inequalities \eqref{eq:ssa} together with the monogamy-of-mutual-information inequalities \eqref{eq:mmi} in all their instances, including composite regions at $n = 4$. Monogamy is a three-region inequality: it is already facet-defining at $n = 3$ and is vacuous only at $n = 2$. For every fixed $n$ the number of independent RT inequalities is finite \cite{baoetal}.
   357	\end{theorem}
   358	
   359	\par\medskip\noindent\emph{Argument structure.}\,
   360	The proof reduces classical Einstein geometries to minimal graph models encoding the cutting and gluing relations of minimal surfaces, enumerates the extreme rays of the resulting cone for $n \le 4$, and identifies the facet inequalities with strong subadditivity and monogamy of mutual information. The finiteness for fixed $n$ follows from the finite combinatorial types of the graph models \cite{baoetal}.
   361	\par\medskip
   362	
   363	\Cref{thm:cone} is a completeness statement, and completeness statements invite over-reading. The cone $\mathcal{H}_n$ is defined through the Ryu-Takayanagi prescription, which is a proposal (\Cref{sec:conjectural}). What is proved is the combinatorial geometry of the set of vectors the prescription can produce in the classical limit. The next proposition shows that the second inequality family of \Cref{thm:cone} is genuinely additional.
   364	
   365	\begin{proposition}[Monogamy is independent of strong subadditivity]\label{prop:mmi}
   366	The monogamy-of-mutual-information inequality \eqref{eq:mmi} for three single regions is not implied by strong subadditivity \eqref{eq:ssa} over entropic vectors. An explicit witness is the entropy vector of a perfectly correlated triple, the standard counterexample of the holographic-entropy literature \cite{hhm,baoetal}: let $X$ be a uniform bit and set $A = B = C = X$. Then
   367	\[
   368	S(A) = S(B) = S(C) = S(AB) = S(AC) = S(BC) = S(ABC) = 1,
   369	\]
   370	all strong subadditivity inequalities \eqref{eq:ssa} hold, and \eqref{eq:mmi} is violated: the left side equals $4$ and the right side equals $3$.
   371	\end{proposition}
   372	
   373	\begin{proof}
   374	The vector is entropic: it is realized by the classical state of the random variable $X$, so every entropy is the Shannon entropy of the indicated marginal, and each listed value equals $1$. Strong subadditivity takes the form $S(U) + S(V) \ge S(U \cup V) + S(U \cap V)$ for unions $U, V$ of $\{A,B,C\}$. If $U \cap V = \emptyset$ then the right side is $S(U \cup V) \le 1$ and the left side is $2$. If $U \cap V \ne \emptyset$ then both sides equal $2$. So \eqref{eq:ssa} holds in every case. Monogamy of mutual information reads $S(A) + S(B) + S(C) + S(ABC) \le S(AB) + S(AC) + S(BC)$, that is $4 \le 3$ on this vector, which is false. An entropic vector satisfying strong subadditivity and violating monogamy proves independence.
   375	\end{proof}
   376	
   377	\begin{corollary}[Classical correlations violate monogamy]\label{cor:classicalmmi}
   378	The witness of \Cref{prop:mmi} is a classical random variable, so monogamy of mutual information is not valid for general quantum states, classical or otherwise. Its validity inside $\mathcal{H}_n$ is a property of minimal surfaces in classical Einstein gravity, not a property of entropy theory. The completeness of \Cref{thm:cone} needs the monogamy family in addition to strong subadditivity already at $n = 3$, because strong subadditivity alone leaves room for the witness.
   379	\end{corollary}
   380	
   381	\begin{proof}
   382	The witness is classical by construction. Substituting it into \eqref{eq:mmi} violates the inequality, so the inequality is not universally valid. \Cref{thm:cone} therefore cannot be stated with strong subadditivity alone.
   383	\end{proof}
   384	
   385	\begin{proposition}[Two forms of monogamy]\label{prop:mmiform}
   386	For three single regions, \eqref{eq:mmi} is equivalent to the information form
   387	\[
   388	I(A{:}B) + I(A{:}C) \le I(A{:}BC),
   389	\]
   390	and both are equivalent to the negativity statement that the tripartite information $I_3(A{:}B{:}C) = I(A{:}B) + I(A{:}C) - I(A{:}BC)$ is nonpositive.
   391	\end{proposition}
   392	
   393	\begin{proof}
   394	Expand the mutual informations: $I(A{:}B) + I(A{:}C) = 2S(A) + S(B) + S(C) - S(AB) - S(AC)$ and $I(A{:}BC) = S(A) + S(BC) - S(ABC)$. The inequality $I(A{:}B) + I(A{:}C) \le I(A{:}BC)$ rearranges to $S(A) + S(B) + S(C) + S(ABC) \le S(AB) + S(AC) + S(BC)$, which is \eqref{eq:mmi}. The tripartite form is the same inequality moved to one side.
   395	\end{proof}
   396	
   397	\begin{lemma}[Strong subadditivity from subadditivity and monogamy]\label{lem:ssaredundant}
   398	For three single regions, strong subadditivity follows from subadditivity together with monogamy of mutual information. At $n = 3$ the strong subadditivity family is therefore a consequence rather than an independent input. This argument covers three-region instances only: at $n = 2$ monogamy is vacuous, and at $n = 4$ the strong subadditivity instances involving four regions are not generated by three-region monogamy and remain independent inputs of \Cref{thm:cone}.
   399	\end{lemma}
   400	
   401	\begin{proof}
   402	The conditional mutual information factors as $I(A{:}C \mid B) = I(A{:}BC) - I(A{:}B)$. Monogamy \eqref{eq:mmi} in the form of \Cref{prop:mmiform} gives $I(A{:}BC) - I(A{:}B) \ge I(A{:}C)$, and subadditivity gives $I(A{:}C) \ge 0$. Hence $I(A{:}C \mid B) \ge 0$, which is strong subadditivity for the triple.
   403	\end{proof}
   404	
   405	\begin{lemma}[The witness satisfies every other standard inequality]\label{lem:witnessclean}
   406	The entropy vector of \Cref{prop:mmi} is nonnegative, is zero on $\emptyset$, and satisfies subadditivity, the Araki-Lieb bound, and strong subadditivity. It violates only \eqref{eq:mmi}. Hence the independence of \Cref{prop:mmi} is not caused by any other failure.
   407	\end{lemma}
   408	
   409	\begin{proof}
   410	All entries are $0$ or $1$, so nonnegativity holds and $S(\emptyset) = 0$ by convention. Subadditivity reads $1 + 1 \ge 1$ on any pair and $1 + 1 \ge 1$ with the triple, and the Araki-Lieb bound reads $0 \le 1$; both hold. Strong subadditivity holds by the case analysis of \Cref{prop:mmi}. Monogamy is the only violated inequality, by the computation there.
   411	\end{proof}
   412	
   413	The margin is worth recording numerically. On the witness vector the monogamy left side $S(A) + S(B) + S(C) + S(ABC)$ equals $4$ and the right side $S(AB) + S(AC) + S(BC)$ equals $3$, so the violation is $1$ in entropy units, while every strong subadditivity slack is $0$. The computational check of \Cref{tab:checks} reproduces these numbers from the joint distribution of $X$, and the sampled classical experiments reproduce the same pattern: strong subadditivity never fails, monogamy fails on a positive fraction of draws.
   414	
   415	\begin{remark}[Open problem: entropy cone for six or more regions]\label{op:cone5}
   416	The enumeration gap that \cite{baoetal} left at five regions has since been closed: the complete facet list for $n = 5$ is known \cite{hernandezcuenca}. For fixed $n \ge 6$ the number of independent RT inequalities is finite, but the facet lists are open, and for general $n$ only one infinite family of inequalities is known \cite{baoetal}. No verified resolution of the $n \ge 6$ gap was found in the sources reviewed (cutoff 2026-10-29).
   417	\end{remark}
   418	
   419	\begin{remark}[What the cone classifies]\label{rem:coneclassifies}
   420	$\mathcal{H}_n$ classifies entropy vectors, not spacetimes. A point of the cone records the entropies an RT surface assignment can produce for $n$ regions; recovering a bulk geometry from a point of the cone is a reconstruction problem of a different kind, taken up in \Cref{sec:reconstruction}. The two problems share vocabulary and do not share theorems.
   421	\end{remark}
   422	
   423	\section{Reconstruction from probes}\label{sec:reconstruction}
   424	
   425	Reconstruction in the sense of \Cref{def:reconstruction} asks what relational data suffices to determine a geometry. A classical pattern governs such results: an object is recovered from its probes, as commutative algebras are recovered from their characters. The two spacetime instances of the pattern that are theorems follow, one classical and one quantum-information-theoretic.
   426	
   427	\begin{theorem}[Causal reconstruction of conformal geometry]\label{thm:malament}
   428	Let $(M,g)$ and $(M',g')$ be time-oriented distinguishing spacetimes of dimension $n \ge 3$ and let $\varphi \colon M \to M'$ be a bijection preserving the chronological order: $p \prec q$ if and only if $\varphi(p) \prec' \varphi(q)$ for all $p, q$. Then $\varphi$ is a diffeomorphism and a conformal isometry. Consequently the chronological order determines the topology of $M$ and the conformal class $[g]$ of the metric \cite{malament,hkm}.
   429	\end{theorem}
   430	
   431	\par\medskip\noindent\emph{Argument structure.}\,
   432	The argument has two stages. First, the chronological order determines the topology: Malament shows that an order-preserving bijection between distinguishing spacetimes is a homeomorphism, using order arguments on chains of timelike curves rather than any metric. Second, a homeomorphism that maps timelike curves to timelike curves preserves the conformal class, and in dimension $n \ge 3$ the causal, differential, and conformal structures of a spacetime determine each other, so the homeomorphism upgrades to a smooth conformal isometry \cite{hkm}. The complete argument is Malament's \cite{malament} with the smooth upgrade of \cite{hkm}. In dimension $n = 2$ the conclusion fails: in null coordinates $(u,v)$ on $\mathbb{R}^{1,1}$ the map $(u,v) \mapsto (u^3, v)$ preserves the chronological order but its inverse is not smooth at $u = 0$.
   433	\par\medskip
   434	
   435	\Cref{thm:malament} is the strongest reconstruction statement in this volume, and its scope is exactly the scope of \Cref{def:reconstruction}: the probe datum is the chronological order, the class is the distinguishing spacetimes, and the equivalence is the conformal isometry class. The next corollary records the boundary of the theorem.
   436	
   437	\begin{corollary}[The order does not fix the conformal factor]\label{cor:confactor}
   438	No reconstruction of a metric from the chronological order alone can determine the conformal factor: distinct metrics $g$ and $e^{2f} g$ on the same manifold carry the same chronological order and are not isometric unless $f$ is constant. Recovering the conformal factor requires additional probe data, such as a volume form, a time function normalized by matter, or stress-energy data.
   439	\end{corollary}
   440	
   441	\begin{proof}
   442	Conformal rescaling of a metric by a positive function $e^{2f}$ preserves the timelike cones of every tangent space, hence preserves the chronological order. Distinct conformal factors give distinct metrics with the same probe datum, so no procedure reading the order can distinguish them. Any reconstruction of the full metric must add data that breaks the conformal freedom.
   443	\end{proof}
   444	
   445	Two unrelated topologies share the name Alexandrov in English transliteration. The open-diamond topology on a spacetime, due to A. D. Alexandrov, is generated by the sets $I^+(p) \cap I^-(q)$ and is sensitive to causality; the up-set topology on a poset, due to P. S. Alexandroff, is generated by up-sets and is generally not $T_1$. The two are distinguished by name throughout what follows.
   446	
   447	\begin{lemma}[The order determines the diamond topology]\label{lem:alexandrov}
   448	The chronological order of a spacetime determines the open-diamond topology of A. D. Alexandrov: the sets $I^+(p) \cap I^-(q)$ form a basis whose lattice structure is a function of the order alone. This diamond topology coincides with the manifold topology exactly when the spacetime is strongly causal \cite{minguzzisanchez}, so on a strongly causal spacetime the order determines the topology of $M$ without reference to the metric.
   449	\end{lemma}
   450	
   451	\begin{proof}
   452	Each diamond $I^+(p) \cap I^-(q)$ is defined by two order relations, so the family of diamonds is a function of the order, and the intersection of two diamonds is a union of diamonds. The identification of the diamond topology with the manifold topology under strong causality is the standard characterization recorded in the causal-hierarchy survey \cite{minguzzisanchez}. For merely distinguishing spacetimes the coincidence can fail, which is why \Cref{thm:malament} uses Malament's order-continuity argument instead of this topological shortcut.
   453	\end{proof}
   454	
   455	\begin{proposition}[Finite orders recover their order from their topology]\label{prop:specialization}
   456	Let $(X, \le)$ be a finite order and give $X$ the up-set topology of P. S. Alexandroff, whose open sets are the up-sets. Then $X$ is $T_0$, the closure of a singleton is its down-set $\mathrm{cl}(\{x\}) = \{ y : y \le x \}$, and the order is read off the topology by $x \le y$ if and only if $x \in \mathrm{cl}(\{y\})$.
   457	\end{proposition}
   458	
   459	\begin{proof}
   460	The closed sets of the up-set topology are the down-sets. The closure of $\{x\}$ is the intersection of all down-sets containing $x$, which is the smallest such down-set $\{y : y \le x\}$. For $T_0$, take $x \ne y$. Not both $x \le y$ and $y \le x$ hold. If $x \not\le y$ then $X \setminus \{z : z \le y\}$ is an up-set containing $x$ and not $y$; if $y \not\le x$ the symmetric set separates $y$ from $x$. In either case an open set distinguishes the pair. The order is then recovered from the closures as stated.
   461	\end{proof}
   462	
   463	\Cref{prop:specialization} is the order-theoretic analogue of the topological step in \Cref{thm:malament}, but it is not the same topology: \Cref{lem:alexandrov} concerns the open-diamond topology of A. D. Alexandrov on a spacetime, while \Cref{prop:specialization} concerns the up-set topology of P. S. Alexandroff on a poset. In both cases a topology built from the order recovers the order. What \Cref{prop:distinguish} blocks is the next step, the passage from order to geometry; that passage uses smoothness in \Cref{thm:malament} and has no finite-order analogue.
   464	
   465	\begin{theorem}[Entanglement-wedge reconstruction]\label{thm:dhw}
   466	In the holographic correspondence, let $A$ be a boundary subregion of a code subspace of states with a smooth classical dual, and let $W(A)$ be its entanglement wedge. Bulk operators supported in $W(A)$ can be reconstructed as operators acting on $A$ alone, within the code subspace. The result is a theorem of quantum information theory: its hypotheses are stated in the language of quantum error correction and quantum relative entropy, and its proof combines the relative-entropy argument for subregions with the error-correcting structure of the correspondence \cite{dongharlowwall}.
   467	\end{theorem}
   468	
   469	\par\medskip\noindent\emph{Argument structure.}\,
   470	The argument has two inputs. First, the quantum relative entropy of the subregion's state equals a bulk relative entropy in the wedge, which fixes the modular Hamiltonian data of the bulk region. Second, the error-correcting properties of the code subspace allow bulk operators in the wedge to be represented on $A$ without disturbing states outside the code subspace. Combining the two gives a boundary representation of each bulk operator in $W(A)$, with the hypotheses of the cited source \cite{dongharlowwall}.
   471	\par\medskip
   472	
   473	\begin{remark}[Layers]\label{rem:layers}
   474	\Cref{thm:dhw} is a quantum-information theorem and \Cref{thm:malament} is a differential-geometric theorem. Neither is a theorem of gravity. \Cref{thm:dhw} speaks of a code subspace in a holographic correspondence; the interpretation of that code subspace as a theory of quantum gravity is the conjectural layer of \Cref{sec:conjectural}. Keeping the layers apart is the discipline that makes the claims checkable.
   475	\end{remark}
   476	
   477	Probe data recovers a space only where distinct spaces produce distinct probe structures. The classical instance is the Gelfand representation theorem: a compact Hausdorff space is recovered up to homeomorphism from its commutative unital $C^*$-algebra of continuous functions, through the Gelfand spectrum of characters in the weak-* topology. \Cref{thm:malament} is the spacetime instance, recovering conformal geometry in dimension $n \ge 3$ from chronological order, and \Cref{thm:dhw} is the quantum-information instance, representing wedge operators on boundary subregions. Category theory names the general pattern: the Yoneda embedding characterizes an object by the totality of its probes. The pattern alone establishes nothing physical. The qualification binding this program is stated once here and applies throughout: Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.
   478	
   479	\begin{table}[t]
   480	\centering
   481	\caption{Three reconstruction theorems compared by \Cref{def:reconstruction}: probe datum, recovered target, equivalence, and hypotheses. The pattern is constant and the hypotheses are not; each theorem stands on its own row.}
   482	\label{tab:reconstruction}
   483	\footnotesize
   484	\begin{tabularx}{\textwidth}{L{0.13\textwidth}L{0.20\textwidth}L{0.20\textwidth}L{0.15\textwidth}X}
   485	\toprule
   486	Theorem & Probe datum & Target & Equivalence & Hypotheses \\
   487	\midrule
   488	Gelfand duality & Gelfand spectrum (characters, weak-* topology) & Compact Hausdorff space & Homeomorphism & Commutative unital $C^*$-algebra \\
   489	Malament & Chronological order & Topology and conformal class & Conformal isometry & Distinguishing, $n \ge 3$ \\
   490	Entanglement wedge & Boundary subregion algebra & Bulk operators in the wedge & Code equality & Code subspace \\
   491	\bottomrule
   492	\end{tabularx}
   493	\end{table}
   494	
   495	\Cref{tab:reconstruction} makes the boundaries visible. Gelfand duality and Malament are determination theorems: the probe datum fixes the target up to the declared equivalence. Entanglement-wedge reconstruction is a representation theorem instead. Operators on a target region are representable on a probe region inside a restricted class of states. The distinction matters for the conjectural layer. A claim that entanglement determines spacetime would need to be a determination theorem of the Malament type, with entanglement data as probes. No such theorem is on the shelf.
   496	
   497	\section{The conjectural core}\label{sec:conjectural}
   498	
   499	Everything in this section is a proposal or an argument. Nothing here is used as a premise of a theorem elsewhere in the paper.
   500	
   501	\begin{remark}[The Ryu-Takayanagi proposal]\label{rem:rt}
   502	The Ryu-Takayanagi prescription \cite{ryutakayanagi} proposes that the entanglement entropy of a boundary region $A$ equals the area of a minimal bulk surface homologous to $A$, in units of $4G_N$:
   503	\begin{equation}\label{eq:rt}
   504	S(A) = \min_{\gamma_A \, \sim \, A} \frac{\mathrm{Area}(\gamma_A)}{4 G_N},
   505	\end{equation}
   506	where the minimum runs over bulk surfaces $\gamma_A$ homologous to $A$ in the spatial slice. The proposal is argued from the AdS/CFT correspondence. Exact agreement holds in the AdS$_3$/2D CFT case of the original statement \cite{ryutakayanagi} and for spherical entangling surfaces in arbitrary dimension, where a conformal mapping argument derives the formula \cite{casinimyers}; a replica derivation for static bulk geometries explains the prescription at the physics level \cite{lewkowyczmaldacena}, and a covariant extremal-surface generalization is proposed in \cite{hrt}. None of these arguments is a theorem of constructive quantum field theory, and the prescription remains a proposal. The holographic entropy cone of \Cref{thm:cone} is defined through this prescription, so the completeness of that theorem is a completeness statement about the cone of a proposal. What is proved there is the combinatorial enumeration of the inequalities the proposal produces in the classical limit; what is not proved is that the prescription holds in any given theory.
   507	\end{remark}
   508	
   509	\begin{remark}[Toy models]\label{rem:happy}
   510	The HaPPY codes \cite{haappy} are exactly solvable tensor-network models built from perfect tensors. Inside these models the Ryu-Takayanagi formula and the negativity of tripartite information hold exactly, and bulk logical operators admit multiple boundary representations that mimic wedge reconstruction. The models prove statements about tensor networks. They are not evidence about actual AdS/CFT beyond the analogy they are designed to exhibit, and no result of this paper treats them as evidence about gravity.
   511	\end{remark}
   512	
   513	\begin{remark}[Entanglement and connectedness]\label{rem:vanraamsdonk}
   514	Van Raamsdonk's essay \cite{vanraamsdonk} argues that the emergence of classically connected spacetime is tied to quantum entanglement: disentangling the degrees of freedom of two regions makes the regions pinch off from each other, quantified by standard entanglement measures. The status of the statement is an argument based on examples, not a theorem. It states a research direction for reconstruction: if entanglement builds connectedness, then entanglement data should determine geometric data. \Cref{thm:malament} shows what such a determination would have to look like as a theorem, with class, datum, and equivalence declared. No such theorem is claimed here.
   515	\end{remark}
   516	
   517	The gap between these remarks and a reconstruction theorem of quantum gravity is not a technicality. \Cref{thm:malament} recovers a conformal class from a causal order; it does not derive a metric from entanglement. \Cref{thm:dhw} recovers operators inside a code subspace; it does not derive the code subspace from first principles. A derivation of spacetime geometry from informational data without assuming the geometry at the start would need both steps in reverse order and is not on the shelf.
   518	
   519	\begin{remark}[What an upgrade would require]\label{rem:upgrade}
   520	To promote the entanglement-connectedness argument \cite{vanraamsdonk} to a theorem of the kind \Cref{def:reconstruction} asks for, three things would be needed: a probe datum consisting only of entanglement data on a declared family of subsystems, a proof that the datum determines a spacetime up to a declared equivalence, and a demonstration that the construction does not smuggle in the geometry at the start. \Cref{thm:malament} shows the second item is achievable when the probe datum is a causal order and the equivalence is conformal. \Cref{cor:confactor} shows that even then a conformal factor remains undetermined, so the third item requires either additional data or a theorem that the factor is physically irrelevant. None of the three items is established in the sources reviewed (cutoff 2026-10-29).
   521	\end{remark}
   522	
   523	\section{Computational evidence}
   524	
   525	Three experiments accompany the claims above. They are recorded as evidence, run from \texttt{src/vol-08-spacetime-reconstruction/}, and checked by the paper's code evidence appendix. None of them proves anything: they test that the definitions behave as the proofs say on finite instances. The claims each experiment probes are listed in \Cref{tab:checks} and \Cref{tab:code}.
   526	
   527	The entropy experiment evaluates \eqref{eq:ssa} and \eqref{eq:mmi} on the witness vector of \Cref{prop:mmi} and on random classical distributions of three binary variables. The witness reproduces the proof exactly: every strong subadditivity inequality holds and monogamy fails by a margin of one. The random samples never violate strong subadditivity and violate monogamy in a positive fraction of cases, which is the computational shape of \Cref{cor:classicalmmi}. The finite-order experiment enumerates the 242 partial orders on at most four labeled points and takes a census of the ladder rungs: no order carries an increasing loop, only 33 of the orders are distinguishing, and the antichain of two points is the witness of \Cref{prop:distinguish}. The Alexandroff experiment builds the up-set topology on each enumerated order and verifies \Cref{prop:specialization}: the closure of each singleton is its down-set and the topology recovers the order.
   528	
   529	The Haskell layer records the same objects as typed instances of family classes defined outside this volume: Lorentzian spacetime systems with holonomy and causal-rung data, entropy-vector systems, and Thurston geometry types. The family classes are imported, never redefined. The Haskell code is executable modeling evidence. It has not been checked by a proof assistant, and the honest statement about its status is that the executable models are validated against the informal specifications in this paper, not that anything here is machine-checked.
   530	
   531	\begin{table}[t]
   532	\centering
   533	\caption{Typed instances of the volume's systems against the shared family classes. Each row names the Haskell type, the instance declared, and the paper definition the type mirrors.}
   534	\label{tab:haskell}
   535	\footnotesize
   536	\begin{tabularx}{\textwidth}{L{0.24\textwidth}L{0.32\textwidth}X}
   537	\toprule
   538	Haskell type & Instance & Paper definition \\
   539	\midrule
   540	\texttt{LorentzianSpacetime} & \texttt{PhysicalSystem}, \texttt{FamilySmoothGeometric} & \Cref{def:spacetime}, \Cref{def:systems} \\
   541	\texttt{LorentzianHolonomyType} & Data mirroring the classification & \Cref{def:holonomy}, \Cref{thm:holonomy} \\
   542	\texttt{CausalRung} & Data mirroring the ladder rungs & \Cref{def:ladder}, \Cref{thm:ladder} \\
   543	\texttt{HolographicEntropyVector} & \texttt{PhysicalSystem}, \texttt{FamilyProbabilityMeasure} & \Cref{def:entropy}, \Cref{def:cone} \\
   544	\texttt{ThurstonGeometry3} & \texttt{FamilySmoothGeometric} & \Cref{thm:geometrization}, \Cref{tab:geometries} \\
   545	\bottomrule
   546	\end{tabularx}
   547	\end{table}
   548	
   549	\begin{table}[t]
   550	\centering
   551	\caption{Executable checks and the exact claims they probe. The verdict column records what the run shows; no entry is a proof.}
   552	\label{tab:checks}
   553	\footnotesize
   554	\begin{tabularx}{\textwidth}{L{0.30\textwidth}L{0.32\textwidth}X}
   555	\toprule
   556	Check & Command & Result \\
   557	\midrule
   558	Witness inequalities & \texttt{check\_witness()} & Strong subadditivity holds, monogamy fails \\
   559	Classical sampling & \texttt{sample\_classical(200)} & No subadditivity failure, monogamy failures present \\
   560	Order loop check & \texttt{has\_increasing\_loop()} over orders to 4 points & No increasing loops \\
   561	Distinguishing census & \texttt{is\_distinguishing()} over orders to 4 points & 33 of 242 orders are distinguishing \\
   562	Antichain distinguishing & \texttt{check\_antichain()} & Equal empty pasts and equal empty futures \\
   563	Alexandroff recovery & \texttt{alexandrov\_topology()} & Closures equal down-sets, order recovered \\
   564	Taxonomy load & \texttt{ghc -fno-code Instances.hs} & Instances compile against the shared classes \\
   565	\bottomrule
   566	\end{tabularx}
   567	\end{table}
   568	
   569	\Cref{tab:haskell} states which formal object each Haskell type stands for, and \Cref{tab:checks} states what each run demonstrates; every file is rerunnable and its output comparable with the propositions in the body. A row that fails to match its claim is removed together with the claim.
   570	
   571	\begin{lstlisting}[language=Python,caption={The inequality checks from \texttt{entropy\_inequalities.py}: the functions that evaluate strong subadditivity and monogamy on an entropy vector.},label=lst:witness]
   572	def ssa_holds(ent):
   573	    # Strong subadditivity S(U) + S(V) >= S(U+V) + S(U*V).
   574	    for u, v in itertools.product(range(8), repeat=2):
   575	        lhs = ent[u] + ent[v]
   576	        rhs = ent[u | v] + ent[u & v]
   577	        if lhs + 1e-12 < rhs:
   578	            return False
   579	    return True
   580	
   581	def mmi_holds(ent):
   582	    # Monogamy S(A)+S(B)+S(C)+S(ABC) <= S(AB)+S(AC)+S(BC).
   583	    A, B, C = 1, 2, 4
   584	    lhs = ent[A] + ent[B] + ent[C] + ent[A | B | C]
   585	    rhs = ent[A | B] + ent[A | C] + ent[B | C]
   586	    return lhs <= rhs + 1e-12
   587	
   588	def check_witness():
   589	    # Perfectly correlated triple A = B = C = X, X a uniform bit.
   590	    ent = [0.0] * 8
   591	    for m in range(1, 8):
   592	        ent[m] = 1.0
   593	    ssa = ssa_holds(ent)
   594	    mmi = mmi_holds(ent)
   595	    assert ssa and not mmi
   596	    return ssa and not mmi
   597	\end{lstlisting}
   598	
   599	The finite-order experiment enumerates every partial order on at most four labeled points and takes a census of the ladder rungs. The loop check of \Cref{prop:finiteposet} and the interval check are definitional on a finite ground set and are reported as such; the informative output is the distinguishing census: only 33 of the 242 enumerated orders are distinguishing, and the antichain of two points fails distinguishing while passing the interval check, as \Cref{prop:distinguish} states. The companion Alexandroff experiment rebuilds each order from its up-set topology and verifies \Cref{prop:specialization}: the closure of each singleton is its down-set, so the topology recovers the order.
   600	
   601	\begin{lstlisting}[language=Python,caption={The rung checks from \texttt{causal\_ladder\_finite\_posets.py}: loop detection, the distinguishing census, and the antichain witness.},label=lst:posets]
   602	def has_increasing_loop(le, n):
   603	    # Strictly increasing loop x0 < x1 < ... < x0 (real test).
   604	    strict = [[le[x][y] and x != y for y in range(n)] for x in range(n)]
   605	    for start in range(n):
   606	        stack = [(start, frozenset({start}))]
   607	        while stack:
   608	            node, seen = stack.pop()
   609	            for nxt in range(n):
   610	                if not strict[node][nxt]:
   611	                    continue
   612	                if nxt == start:
   613	                    return True
   614	                if nxt not in seen:
   615	                    stack.append((nxt, seen | {nxt}))
   616	    return False
   617	
   618	def is_distinguishing(le, n):
   619	    # Past- and future-distinguishing (Definition 2.3).
   620	    for x in range(n):
   621	        for y in range(n):
   622	            if x == y:
   623	                continue
   624	            px, fx = past_future(le, x, n)
   625	            py, fy = past_future(le, y, n)
   626	            if px == py or fx == fy:
   627	                return False
   628	    return True
   629	\end{lstlisting}
   630	
   631	\section{Limitations}
   632	
   633	Every proved result here classifies a narrow target rather than spacetime itself. The holonomy classification \cite{galaev} classifies holonomy groups and not spacetimes. The causal ladder \cite{minguzzisanchez} classifies causality conditions and not geometries. Geometrization \cite{perelman,thurston1982} classifies closed 3-manifolds, and \Cref{thm:tancer} shows there is no algorithmic analogue in dimension four. The entropy cone theorem \Cref{thm:cone} classifies entropy vectors produced by a proposal. No theorem in this paper classifies Lorentzian spacetimes themselves up to isometry, and no such theorem is claimed.
   634	
   635	The holographic material is a proposal in all of its parts. The Ryu-Takayanagi formula has exact checks in special settings \cite{ryutakayanagi,casinimyers} and a physics-level replica derivation for static bulk geometries \cite{lewkowyczmaldacena}, and it is not a theorem. The HaPPY codes prove statements about toy models \cite{haappy}. The entanglement-connectedness statement is an argument \cite{vanraamsdonk}. Every result of this paper that touches holography is stated conditionally on the prescription, and the conditionality is written where the result is used.
   636	
   637	The reconstruction theorems recover different objects. The causal theorem \Cref{thm:malament} recovers a conformal class from an order. The entanglement-wedge theorem \Cref{thm:dhw} recovers operators inside a code subspace from boundary algebras. Neither recovers a metric from entanglement data, and the distance between these results and a derivation of gravity from information is a research program, not a step.
   638	
   639	The Python experiments test finite instances of the propositions proved in \Cref{prop:mmi}, \Cref{prop:finiteposet}, and \Cref{prop:distinguish}; the Haskell instances type the objects of \Cref{def:systems}. The evidence is reproducible from the files in the appendix and is not proof. Nothing in this volume has been checked by a proof assistant, and the mechanization targets are recorded separately as targets. This volume depends on the shared definitions and on the registered background results it cites. It does not depend on any statement about the entropy cone for six or more regions, on the Ryu-Takayanagi formula outside its stated settings, or on tensor-network toy models as evidence about gravity; where a result needs those inputs, the conditional phrasing appears in the statement.
   640	
   641	\section{Conclusion}
   642	
   643	Spacetime admits classification exactly where its invariants are finite or parametric and reconstruction exactly where probes determine a target up to a stated equivalence. Lorentzian holonomy groups form a classified list with realizing metrics \cite{galaev}. Causality conditions form a complete ladder \cite{minguzzisanchez}. Closed 3-manifolds form a finite table of eight geometries \cite{perelman,thurston1982}, and closed 4-manifolds do not admit algorithmic recognition \cite{tancer}. The holographic entropy cone is a complete polyhedral calculation for at most four regions \cite{baoetal}, probed here by a witness showing that its two inequality families are independent (\Cref{prop:mmi}).
   644	
   645	Reconstruction has one proved classical form: the chronological order determines the topology and the conformal class \cite{malament}, and the conformal factor is exactly the undetermined freedom (\Cref{cor:confactor}). It has one proved quantum-information form: bulk operators in an entanglement wedge are boundary-representable in the code subspace \cite{dongharlowwall}. Between them lies the conjecture that entanglement determines geometry \cite{ryutakayanagi,haappy,vanraamsdonk}, presented here with its status on every appearance.
   646	
   647	The negative results are part of the answer. The causal ladder rungs depend on their translation to finite orders (\Cref{cor:notransfer}), so a discrete quantum-gravity model that uses its rungs must state its definitions and prove its own causality theorems. Monogamy of mutual information is not free from strong subadditivity (\Cref{prop:mmi}), so from three regions on the entropy cone genuinely needs both inequality families. Dimension four has no algorithmic classification (\Cref{thm:tancer}), so a classification chart of this kind has rows that end in impossibility results rather than in lists. Each of these is a boundary, and each boundary narrows the targets a classification can honestly claim.
   648	
   649	Four open problems delimit the next stage. The complete RT facet lists for six and more boundary regions are unknown; five regions are settled \cite{hernandezcuenca}, and for general $n$ only one infinite family of inequalities is known \cite{baoetal}. The invariants of \Cref{tab:invariants} do not separate isometry classes (\Cref{cor:notclassifies}), and which additional global invariants complete such a classification is open. The conformal factor left undetermined by \Cref{cor:confactor} is either physically irrelevant or recoverable from additional probes, and the choice is not made by any theorem here. A determination theorem for spacetime from entanglement data would need the three items of \Cref{rem:upgrade}, and none is established in the sources reviewed (cutoff 2026-10-29). The classification of Lorentzian spacetimes up to isometry remains, as this paper has tried to make precise, exactly where its invariants stop.
   650	
   651	\begin{thebibliography}{99}\small
   652	
   653	\bibitem{galaev}
   654	A.~S. Galaev, \emph{Holonomy groups of Lorentzian manifolds}, arXiv:1611.01551; Russian Math. Surveys 70 (2015) 249-298, DOI 10.1070/RM2015v070n02ABEH004947.
   655	
   656	\bibitem{minguzzisanchez}
   657	E.~Minguzzi and M.~S\'{a}nchez, \emph{The causal hierarchy of spacetimes}, arXiv:gr-qc/0609119; in Recent developments in pseudo-Riemannian geometry, ESI Lect. Math. Phys., European Mathematical Society, Zurich, 2008, pp. 299-358.
   658	
   659	\bibitem{perelman}
   660	G.~Perelman, \emph{The entropy formula for the Ricci flow and its geometric applications}, arXiv:math/0211159, 2002; \emph{Ricci flow with surgery on three-manifolds}, arXiv:math/0303109, 2003; \emph{Finite extinction time for the solutions to the Ricci flow on certain three-manifolds}, arXiv:math/0307245, 2003.
   661	
   662	\bibitem{thurston1982}
   663	W.~P. Thurston, \emph{Three-dimensional manifolds, Kleinian groups and hyperbolic geometry}, Bull. Amer. Math. Soc. 6 (1982) 357-381, DOI 10.1090/S0273-0979-1982-15003-0.
   664	
   665	\bibitem{tancer}
   666	M.~Tancer, \emph{Simpler algorithmically unrecognizable 4-manifolds}, arXiv:2310.07421, 2023 (v2 2025).
   667	
   668	\bibitem{baoetal}
   669	N.~Bao, S.~Nezami, H.~Ooguri, B.~Stoica, J.~Sully, and M.~Walter, \emph{The holographic entropy cone}, arXiv:1505.07839; JHEP 09 (2015) 130, DOI 10.1007/JHEP09(2015)130.
   670	
   671	\bibitem{hhm}
   672	P.~Hayden, M.~Headrick, and A.~Maloney, \emph{Holographic mutual information is monogamous}, arXiv:1107.2940; Phys. Rev. D 87 (2013) 046003, DOI 10.1103/PhysRevD.87.046003.
   673	
   674	\bibitem{malament}
   675	D.~B. Malament, \emph{The class of continuous timelike curves determines the topology of spacetime}, J. Math. Phys. 18 (1977) 1399-1404, DOI 10.1063/1.523436.
   676	
   677	\bibitem{hkm}
   678	S.~W. Hawking, A.~R. King, and P.~J. McCarthy, \emph{A new topology for curved space-time which incorporates the causal, differential, and conformal structures}, J. Math. Phys. 17 (1976) 174-181, DOI 10.1063/1.522874.
   679	
   680	\bibitem{ryutakayanagi}
   681	S.~Ryu and T.~Takayanagi, \emph{Holographic derivation of entanglement entropy from AdS/CFT}, arXiv:hep-th/0603001; Phys. Rev. Lett. 96 (2006) 181602, DOI 10.1103/PhysRevLett.96.181602.
   682	
   683	\bibitem{dongharlowwall}
   684	X.~Dong, D.~Harlow, and A.~C. Wall, \emph{Reconstruction of bulk operators within the entanglement wedge in gauge-gravity duality}, arXiv:1601.05416; Phys. Rev. Lett. 117 (2016) 021601, DOI 10.1103/PhysRevLett.117.021601.
   685	
   686	\bibitem{haappy}
   687	F.~Pastawski, B.~Yoshida, D.~Harlow, and J.~Preskill, \emph{Holographic quantum error-correcting codes: toy models for the bulk/boundary correspondence}, arXiv:1503.06237; JHEP 06 (2015) 149, DOI 10.1007/JHEP06(2015)149.
   688	
   689	\bibitem{vanraamsdonk}
   690	M.~Van Raamsdonk, \emph{Building up spacetime with quantum entanglement}, arXiv:1005.3035; Gen. Rel. Grav. 42 (2010) 2323-2329, DOI 10.1007/s10714-010-1034-0.
   691	
   692	\bibitem{hrt}
   693	V.~E. Hubeny, M.~Rangamani, and T.~Takayanagi, \emph{A covariant holographic entanglement entropy proposal}, arXiv:0705.0016; JHEP 07 (2007) 062, DOI 10.1088/1126-6708/2007/07/062.
   694	
   695	\bibitem{hillman}
   696	J.~A. Hillman, \emph{Four-manifolds, geometries and knots}, arXiv:math/0212142; Geom. Topol. Monogr. 5 (2002), DOI 10.2140/gtm.2002.5.
   697	
   698	\bibitem{hernandezcuenca}
   699	S.~Hern\'{a}ndez-Cuenca, \emph{The holographic entropy cone for five regions}, Phys. Rev. D 100 (2019) 026004, DOI 10.1103/PhysRevD.100.026004.
   700	
   701	\bibitem{casinimyers}
   702	H.~Casini, M.~Huerta, and R.~C. Myers, \emph{Towards a derivation of holographic entanglement entropy}, arXiv:1102.0440; JHEP 05 (2011) 036, DOI 10.1007/JHEP05(2011)036.
   703	
   704	\bibitem{lewkowyczmaldacena}
   705	A.~Lewkowycz and J.~Maldacena, \emph{Generalized gravitational entropy}, arXiv:1304.4926; JHEP 08 (2013) 090, DOI 10.1007/JHEP08(2013)090.
   706	
   707	\end{thebibliography}
   708	
   709	\appendix
   710	\section{Code evidence}
   711	
   712	The table records what each file in \texttt{src/vol-08-spacetime-reconstruction/} demonstrates. The claim column names the statement the code probes. No row claims proof by computation.
   713	
   714	\begin{table}[t]
   715	\centering
   716	\caption{Code evidence: claim, file, and the function or declaration that probes it. The audit of this table is recorded with the paper's verification artifacts.}
   717	\label{tab:code}
   718	\footnotesize
   719	\begin{tabularx}{\textwidth}{L{0.32\textwidth}L{0.28\textwidth}X}
   720	\toprule
   721	Claim probed & File & Function or declaration \\
   722	\midrule
   723	\Cref{prop:mmi} holds on the witness vector & \path{entropy_inequalities.py} & \texttt{check\_witness()} \\
   724	\Cref{cor:classicalmmi} on random classical states & \path{entropy_inequalities.py} & \texttt{sample\_classical()} \\
   725	\Cref{prop:finiteposet} on enumerated orders & \path{causal_ladder_finite_posets.py} & \texttt{has\_increasing\_loop()}, \texttt{intervals\_finite()} \\
   726	\Cref{prop:distinguish} on the antichain & \path{causal_ladder_finite_posets.py} & \texttt{check\_antichain()} \\
   727	Order recovery of \Cref{prop:specialization} & \path{alexandrov_reconstruction.py} & \texttt{alexandrov\_topology()} \\
   728	\Cref{def:systems} typed against the family classes & \path{Instances.hs} & Class instance declarations \\
   729	\bottomrule
   730	\end{tabularx}
   731	\end{table}
   732	
   733	\end{document}

exec
/usr/local/bin/zsh -lc "sed -n '140,390p' papers/latex/vol-08-spacetime-reconstruction.tex | nl -ba -v 140" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   140	
   141	\section{Incomplete invariants}
   142	
   143	Invariants do not classify unless they are complete. The holonomy group, the causal class, and the dimension fail to be complete: an explicit pair of spacetimes shares all three and is not isometric.
   144	
   145	\begin{proposition}[Shared invariants, distinct spacetimes]\label{prop:incomplete}
   146	There exist two Lorentzian spacetimes with the same dimension, the same holonomy group, and the same causal class, which are not isometric. Concretely, the flat plane $\mathbb{R}^{1,1}$ with metric $-dt^2 + dx^2$ and the flat cylinder $\mathbb{R} \times \mathbb{S}^1$ with metric $-dt^2 + d\theta^2$ both have trivial holonomy and are both globally hyperbolic, and no isometry exists between them.
   147	\end{proposition}
   148	
   149	\begin{proof}
   150	Both metrics are flat: the Riemann tensor vanishes in the coordinates displayed, so parallel transport is path-independent and the holonomy group of each is the identity. Both are globally hyperbolic: $t$ is a time function on each space, every inextendible causal curve meets each level set of $t$ exactly once, the level sets are Cauchy surfaces, and each causal diamond is closed with $t$ bounded and with spatial coordinate in a compact circle or an interval, hence compact. The two spaces are not diffeomorphic: the fundamental group of the cylinder is $\mathbb{Z}$ and the fundamental group of the plane is trivial, and an isometry would in particular be a diffeomorphism. Hence the listed invariants do not determine the isometry class.
   151	\end{proof}
   152	
   153	\begin{corollary}[Classification by these invariants is not classification]\label{cor:notclassifies}
   154	No classification of Lorentzian spacetimes up to isometry can be read off the holonomy group, the causal class, and the dimension alone. Any complete classification must add global invariants, such as topology or global curvature data, and the list of \Cref{tab:invariants} must be read as a list of attached data rather than as a complete set of coordinates.
   155	\end{corollary}
   156	
   157	\begin{proof}
   158	\Cref{prop:incomplete} exhibits two non-isometric spacetimes with identical values of every listed invariant, so the map from spacetimes to invariant values is not injective on isometry classes.
   159	\end{proof}
   160	
   161	The holonomy classification of \Cref{thm:holonomy} and the ladder of \Cref{thm:ladder} are sharp exactly because their targets are narrow: possible holonomy groups, and possible causality regimes. \Cref{cor:notclassifies} states the complementary limit: a sharp invariant classification of a feature is not a classification of the object. A complete classification in this sense would need additional global invariants, such as topology or global curvature data, in addition to the rows of \Cref{tab:invariants}.
   162	
   163	\section{Lorentzian holonomy}
   164	
   165	Holonomy is the classical invariant of a metric connection. For Lorentzian metrics it is completely classified \cite{galaev}, and this section records the classification together with two proved structural properties of the invariant.
   166	
   167	\begin{theorem}[Lorentzian holonomy classification]\label{thm:holonomy}
   168	Let $(M,g)$ be a connected, simply connected Lorentzian manifold of signature $(1,n-1)$ with $g$ indecomposable. Then the connected holonomy group $\mathrm{Hol}^0(g)$ is one of the following: the full group $\mathrm{SO}(1,n-1)^{\uparrow}$; a special holonomy group whose algebra stabilizes a null line and embeds in the similarity algebra $\mathfrak{sim}(n-2) = (\mathbb{R} \oplus \mathfrak{so}(n-2)) \ltimes \mathbb{R}^{n-2}$; or, when $g$ is locally symmetric, the isotropy holonomy of a symmetric space. Every entry of the list is the holonomy group of an explicitly constructed Lorentzian metric \cite{galaev}.
   169	\end{theorem}
   170	
   171	\par\medskip\noindent\emph{Argument structure.}\,
   172	The classification proceeds in three steps. First, the holonomy algebra embeds in $\mathfrak{so}(1,n-1)$ and is restricted by Berger's criterion in its Lorentzian form: an algebra acting irreducibly is all of $\mathfrak{so}(1,n-1)$, while a reducible indecomposable algebra must stabilize a null line, since a subalgebra preserving a timelike direction would split the metric. Second, the null-line-stabilizing case is classified by prolongation: the algebra embeds in $\mathfrak{sim}(n-2)$ and its screen projection in $\mathfrak{so}(n-2)$ is a Riemannian holonomy algebra, so the candidate list reduces to the Riemannian Berger list with the extra similarity data. Third, realization constructs a Walker or plane-wave type metric for each admitted algebra and checks its holonomy by direct computation of the curvature and its parallel translates. The complete argument, including the full entry-by-entry table and the realizing metrics, is in the survey of Galaev \cite{galaev}, which supplies the complete proof.
   173	\par\medskip
   174	
   175	\begin{remark}[Invariant, not classifier]\label{rem:holonomyinvariant}
   176	The holonomy group classifies holonomy groups, not spacetimes. Many non-isometric metrics share a holonomy type, and the classification of \Cref{thm:holonomy} is a classification of the invariant recorded in \Cref{tab:invariants}. It is the spacetime analogue of classifying the possible values of an invariant, which is a different achievement from classifying the objects on which the invariant is evaluated.
   177	\end{remark}
   178	
   179	\begin{proposition}[Holonomy of a product]\label{prop:product}
   180	Let $(M_1, g_1)$ and $(M_2, g_2)$ be connected pseudo-Riemannian manifolds. On the product $M_1 \times M_2$ with the product metric $g_1 \oplus g_2$, the restricted holonomy satisfies
   181	\[
   182	\mathrm{Hol}^0(g_1 \oplus g_2) = \mathrm{Hol}^0(g_1) \times \mathrm{Hol}^0(g_2).
   183	\]
   184	\end{proposition}
   185	
   186	\begin{proof}
   187	The Levi-Civita connection of a product metric is the direct sum of the factor connections, so parallel transport preserves the splitting $T(M_1 \times M_2) = TM_1 \oplus TM_2$ of tangent spaces into horizontal and vertical parts. By the Ambrose-Singer theorem the restricted holonomy algebra is generated by parallel translates of curvature endomorphisms. The curvature of the product splits as $R = R_1 \oplus R_2$, each factor curvature acting only on its own summand, so the generated algebra is $\mathfrak{hol}^0(g_1) \oplus \mathfrak{hol}^0(g_2)$. Exponentiating gives the group identity for restricted holonomy. No completeness assumption is used; the identity concerns the restricted group, which is generated by contractible loops.
   188	\end{proof}
   189	
   190	\Cref{prop:product} is the invariant-level statement of what it means for a metric to decompose. Indecomposability in \Cref{def:holonomy} is exactly the failure of this splitting, and the holonomy classification of \Cref{thm:holonomy} is a classification of the indecomposable case.
   191	
   192	\begin{lemma}[Restricted holonomy]\label{lem:restricted}
   193	For every Lorentzian spacetime the restricted holonomy $\mathrm{Hol}^0(g)$ is a connected Lie subgroup of $\mathrm{SO}(1,n-1)^{\uparrow}$, and time-orientability places the full holonomy $\mathrm{Hol}(g)$ in the orthochronous group $\mathrm{O}(1,n-1)^{\uparrow}$. The quotient $\mathrm{Hol}(g)/\mathrm{Hol}^0(g)$ is countable in its intrinsic topology, and the classification of \Cref{thm:holonomy} concerns the connected part.
   194	\end{lemma}
   195	
   196	\begin{proof}
   197	$\mathrm{Hol}^0(g)$ is generated by parallel transport along contractible loops, hence connected and contained in the identity component $\mathrm{SO}(1,n-1)^{\uparrow}$ on every Lorentzian manifold, independently of orientability. Time-orientability is exactly the condition that parallel transport preserves time-orientation on all loops, so $\mathrm{Hol}(g)$ lies in the orthochronous group. The quotient of a Lie group by its identity component is countable in the intrinsic topology of the quotient, though it need not be discrete in the subspace topology of $\mathrm{O}(1,n-1)$.
   198	\end{proof}
   199	
   200	\begin{remark}[Two standard examples]\label{rem:holonomyexamples}
   201	Two metrics illustrate the cases of \Cref{thm:holonomy}. The flat metric on Minkowski space has trivial holonomy and is both decomposable and locally symmetric, so it sits outside the indecomposable list of the theorem: its trivial holonomy is an instance of \Cref{prop:product} applied to flat factors. A plane-wave metric (a Walker metric with parallel null vector) is indecomposable with a special holonomy group obtained by the prolongation construction, and its holonomy is the proper null-line-stabilizing entry predicted by \Cref{thm:holonomy} and realized by the metric itself \cite{galaev}. The special entries of the list are attained by such metrics rather than merely possible.
   202	\end{remark}
   203	
   204	\begin{table}[t]
   205	\centering
   206	\caption{Coarse strata of the Lorentzian holonomy classification. The entry-by-entry table with realizing metrics is in the cited survey; the strata record how the cases are organized.}
   207	\label{tab:holonomy}
   208	\small
   209	\begin{tabularx}{\textwidth}{L{0.24\textwidth}L{0.34\textwidth}X}
   210	\toprule
   211	Stratum & Holonomy type & Scope \\
   212	\midrule
   213	Generic & Full group $\mathrm{SO}(1,n-1)^{\uparrow}$ & Indecomposable metrics without special structure \\
   214	Special & Null-line-stabilizing algebras inside $\mathfrak{sim}(n-2)$ & Plane waves and Walker metrics realizing each entry \\
   215	Symmetric & Isotropy of a symmetric space & Locally symmetric Lorentzian metrics \\
   216	Decomposable & Products of factor holonomy groups & Split metrics, by \Cref{prop:product} \\
   217	\bottomrule
   218	\end{tabularx}
   219	\end{table}
   220	
   221	\Cref{tab:holonomy} is an organization of \Cref{thm:holonomy}, not a second classification: the proved statement is the entry-by-entry list with realizing metrics \cite{galaev}, and the strata record the three constructions used in the proof plus the decomposable case excluded from it. Read as classification data, the table says which construction a given holonomy group came from; it does not say which spacetime carries it.
   222	
   223	\section{The causal ladder}
   224	
   225	Causality conditions order spacetimes by how badly causal curves misbehave. The ladder is complete as a classification of these conditions \cite{minguzzisanchez}, and its rungs do not survive translation to discrete orders.
   226	
   227	\begin{theorem}[Completeness of the causal ladder]\label{thm:ladder}
   228	For Lorentzian spacetimes the causality conditions of \Cref{def:ladder} form a strict chain: global hyperbolicity implies causal simplicity, which implies causal continuity, which implies stable causality, which implies strong causality, which implies distinguishing, which implies causality, which implies chronology. Each implication is strict: for each pair of adjacent rungs there exists a spacetime satisfying the lower rung and violating the higher one. Global hyperbolicity is the strongest of the standard causality conditions, and it is equivalent to the compactness of causal diamonds $J^+(p) \cap J^-(q)$ together with the absence of closed causal curves \cite{minguzzisanchez}.
   229	\end{theorem}
   230	
   231	\par\medskip\noindent\emph{Argument structure.}\,
   232	The implications are proved in the source in a single framework with minimal hypotheses; the strictness is proved by constructing, for each pair of adjacent rungs, a separating spacetime, and the equivalences at the top rung are proved by the compactness characterization of global hyperbolicity. The survey of Minguzzi and S\'{a}nchez also records the alternative definitions of each rung and the smoothability results needed to make the examples smooth. The contribution of this paper begins at \Cref{prop:finiteposet}, where the ladder is tested against a different category of causal models.
   233	\par\medskip
   234	
   235	\begin{remark}[Separating examples]\label{rem:separating}
   236	The strictness of \Cref{thm:ladder} is witnessed by standard examples catalogued in \cite{minguzzisanchez}: spacetimes with closed timelike curves fail chronology, quotients with closed causal curves but no closed timelike curve fail causality only, and each higher rung has a separating example in which the lower rung holds and the higher one fails. The existence of these examples is what makes the ladder a classification of causality conditions rather than a list of definitions: each name refers to a genuinely distinct regime.
   237	\end{remark}
   238	
   239	\begin{table}[t]
   240	\centering
   241	\caption{Rungs of the causal ladder and the pathology each excludes. The chain of implications is strict; \Cref{thm:ladder} and \Cref{rem:separating} give the implications and the separating examples.}
   242	\label{tab:ladder}
   243	\small
   244	\begin{tabularx}{\textwidth}{L{0.26\textwidth}X}
   245	\toprule
   246	Rung & Pathology excluded \\
   247	\midrule
   248	Chronological & Closed timelike curves \\
   249	Causal & Closed causal curves \\
   250	Distinguishing & Distinct events with identical pasts or identical futures \\
   251	Strong causality & Causal curves returning arbitrarily close to their starting event \\
   252	Stable causality & The absence of a global time function \\
   253	Causal continuity & The failure of outer continuity for pasts and futures \\
   254	Causal simplicity & Causal futures and pasts that are not closed sets \\
   255	Global hyperbolicity & Closed causal curves or noncompact causal diamonds \\
   256	\bottomrule
   257	\end{tabularx}
   258	\end{table}
   259	
   260	\Cref{tab:ladder} doubles as the checklist used by the finite-order tests of \Cref{prop:finiteposet} and \Cref{prop:distinguish}: the compactness rung passes on every finite order and the distinguishing rung fails on the antichain, which is the first row where the discrete translation breaks.
   261	
   262	The ladder is a theorem about the category of Lorentzian manifolds. Causal set models and other discrete approaches to spacetime replace the manifold by a partially ordered set. The next two propositions show that the ladder's rungs do not transfer to that regime.
   263	
   264	\begin{proposition}[Finite orders satisfy the compactness rung]\label{prop:finiteposet}
   265	Let $(X, \le)$ be a finite partially ordered set, read as a causal model with $x < y$ meaning that $x$ precedes $y$. Then no strictly increasing loop $x_1 < x_2 < \cdots < x_k < x_1$ exists, and every order interval $[x,y] = \{ z : x \le z \le y \}$ is a finite set. Consequently the order-theoretic analogues of chronology and of compact causal diamonds hold for every finite order.
   266	\end{proposition}
   267	
   268	\begin{proof}
   269	A strictly increasing loop would give $x_1 < x_1$ by transitivity, contradicting irreflexivity of a partial order. Every order interval is a subset of the finite set $X$, hence finite, and a finite set is compact in every topology. Both claims use only the order axioms and finiteness.
   270	\end{proof}
   271	
   272	\begin{proposition}[Distinguishing fails in finite orders under the strict reading]\label{prop:distinguish}
   273	Read the ladder rungs on an order by translating the open futures and pasts literally: $I^+(x) = \{ y : x < y \}$ and $I^-(x) = \{ y : y < x \}$. Under this translation there exists a finite order satisfying the conclusions of \Cref{prop:finiteposet} and failing distinguishing: for the two-element antichain $X = \{a, b\}$ with $a$ and $b$ incomparable, one has $I^-(a) = I^-(b) = \emptyset$ and $I^+(a) = I^+(b) = \emptyset$ for distinct points.
   274	\end{proposition}
   275	
   276	\begin{proof}
   277	In an antichain no two distinct points are related, so every chronological future and past is empty. Distinct points therefore carry identical pasts and identical futures, while the order-theoretic compactness of intervals holds vacuously. This is exactly the failure mode \Cref{def:ladder} forbids at the distinguishing rung.
   278	\end{proof}
   279	
   280	\begin{corollary}[Translation dependence of the ladder on finite orders]\label{cor:notransfer}
   281	Rung membership of the causal ladder is not invariant under the translation from continuum definitions to orders. The strict reading of \Cref{prop:distinguish} fails on finite orders while the compactness rung holds universally there, and the reflexive reading built from causal futures $J^{\pm}(x) = \{ y : y \le x \}$ is distinguishing on every antisymmetric order by construction. A discrete causality theory must therefore state which translation it uses, and the rungs cannot be carried over verbatim from the manifold category.
   282	\end{corollary}
   283	
   284	\begin{proof}
   285	Combine \Cref{prop:finiteposet} and \Cref{prop:distinguish} with \Cref{thm:ladder}. In the manifold category global hyperbolicity implies distinguishing. In the finite-order reading, the analogue of global hyperbolicity holds on the antichain and the analogue of distinguishing fails. The implication structure therefore differs between the two categories.
   286	\end{proof}
   287	
   288	The result does not say that discrete models of spacetime are unreasonable. It says that a classification invariant proved in the manifold category is not automatically an invariant of the discrete one, and any program that imports the ladder into causal set theory must prove new theorems rather than cite \cite{minguzzisanchez}. The finite orders studied here carry no additional structure. Causal-set formulations of discrete spacetime impose local finiteness and a natural measure in addition to the order and define their own discrete causality conditions; those formulations lie outside the scope of this volume.
   289	
   290	\section{Geometrization in low dimensions}
   291	
   292	Dimension three admits a finite table of model geometries. Dimension four does not admit an algorithmic classification. This contrast is the sharpest classification boundary in the volume.
   293	
   294	\begin{theorem}[Geometrization of closed 3-manifolds]\label{thm:geometrization}
   295	Every closed 3-manifold decomposes along a canonical family of spheres and tori into pieces, each of which admits one of exactly eight Thurston model geometries: $\mathbb{E}^3$, $\mathbb{S}^3$, $\mathbb{H}^3$, $\mathbb{S}^2 \times \mathbb{R}$, $\mathbb{H}^2 \times \mathbb{R}$, $\mathrm{Nil}$, $\mathrm{Sol}$, and $\widetilde{\mathrm{SL}}(2, \mathbb{R})$. The decomposition is unique up to isotopy, and each geometry is realized by a homogeneous metric on its model space \cite{perelman,thurston1982}.
   296	\end{theorem}
   297	
   298	\par\medskip\noindent\emph{Argument structure.}\,
   299	Thurston reduced the classification of closed 3-manifolds to the geometrization statement, proved by Perelman through Ricci flow with surgery: the flow breaks the manifold at controlled singularities, and the surgery pieces are precisely the pieces carrying one of the eight model geometries. The list of eight is exhaustive because a model geometry is a maximal simply connected homogeneous geometry, and the classification of such geometries in dimension three gives eight \cite{thurston1982,perelman}.
   300	\par\medskip
   301	
   302	\begin{table}[t]
   303	\centering
   304	\caption{The eight Thurston geometries of dimension three and the dimensions of their isometry groups. Each geometry is realized on its model space by a homogeneous metric; the list is exhaustive by \Cref{thm:geometrization}.}
   305	\label{tab:geometries}
   306	\small
   307	\begin{tabular}{llr}
   308	\toprule
   309	Geometry & Model space & Isometry dimension \\
   310	\midrule
   311	Euclidean & $\mathbb{E}^3$ & 6 \\
   312	Spherical & $\mathbb{S}^3$ & 6 \\
   313	Hyperbolic & $\mathbb{H}^3$ & 6 \\
   314	Spherical times line & $\mathbb{S}^2 \times \mathbb{R}$ & 4 \\
   315	Hyperbolic times line & $\mathbb{H}^2 \times \mathbb{R}$ & 4 \\
   316	Nil & Heisenberg group & 4 \\
   317	Sol & Solvable Lie group & 3 \\
   318	Universal cover of $\mathrm{SL}(2, \mathbb{R})$ & $\widetilde{\mathrm{SL}}(2, \mathbb{R})$ & 4 \\
   319	\bottomrule
   320	\end{tabular}
   321	\end{table}
   322	
   323	\begin{proposition}[Homogeneity of the model geometries]\label{prop:homogeneous}
   324	Each of the eight geometries of \Cref{tab:geometries} is homogeneous: its isometry group acts transitively on the model space. The maximal isometry dimension in dimension three is six, attained by exactly the constant-curvature geometries $\mathbb{E}^3$, $\mathbb{S}^3$, and $\mathbb{H}^3$.
   325	\end{proposition}
   326	
   327	\begin{proof}
   328	Each model space is a simply connected Lie group or a symmetric space carrying an invariant metric of the stated signature (Riemannian here), and the isometry group of an invariant metric on a Lie group contains the left translations, which act transitively. The dimension counts in \Cref{tab:geometries} are the dimensions of the full isometry groups of the model metrics, computed from the Killing fields of the corresponding homogeneous structures. In dimension three the isotropy of a homogeneous geometry is a subgroup of $\mathrm{O}(3)$ of dimension at most three, so the isometry dimension is at most six, and the three constant-curvature geometries attain the bound because their isotropy is all of $\mathrm{O}(3)$. The eight entries are precisely the maximal such geometries; maximality is the classification input of \Cref{thm:geometrization} \cite{thurston1982}.
   329	\end{proof}
   330	
   331	\begin{theorem}[Unrecognizability in dimension four]\label{thm:tancer}
   332	The recognition problem for closed 4-manifolds is algorithmically undecidable: there is no algorithm that takes as input a finite triangulation of a closed 4-manifold and decides whether it is homeomorphic to $\#_9(\mathbb{S}^2 \times \mathbb{S}^2)$. The connected sum $\#_9(\mathbb{S}^2 \times \mathbb{S}^2)$ is therefore unrecognizable, improving the previous bound $\#_{12}(\mathbb{S}^2 \times \mathbb{S}^2)$ of Gordon \cite{tancer}.
   333	\end{theorem}
   334	
   335	\par\medskip\noindent\emph{Argument structure.}\,
   336	The construction encodes the Adian-Rabin set of a group presentation into the topology of a simply connected 4-manifold built from the presentation, and shows that the homeomorphism type of the resulting connected sum of copies of $\mathbb{S}^2 \times \mathbb{S}^2$ decides a property of the presentation that is known to be undecidable. Removing Markov's trick and reducing the deficiency of the presentation lowers the number of summands from twelve to nine \cite{tancer}.
   337	\par\medskip
   338	
   339	\begin{corollary}[Dimension contrast]\label{cor:dimcontrast}
   340	A finite table of model geometries with a canonical decomposition theorem exists for closed 3-manifolds and cannot exist, in the algorithmic sense, for closed 4-manifolds. Classification of closed manifolds by a finite table of models is a tame-regime phenomenon.
   341	\end{corollary}
   342	
   343	\begin{proof}
   344	\Cref{thm:geometrization} supplies the finite table and the decomposition in dimension three. \Cref{thm:tancer} shows that no algorithm can recognize the members of even a single infinite family of closed 4-manifolds, so no finite table can be accompanied by an algorithmic identification procedure in dimension four.
   345	\end{proof}
   346	
   347	\begin{remark}[Model geometries in dimension four]\label{rem:filipkiewicz}
   348	Four-dimensional model geometries do exist as a list: Filipkiewicz classified them into eighteen geometries together with one countably infinite family \cite{hillman}. The existence of a list of homogeneous models is not a classification of manifolds, and \Cref{thm:tancer} shows that recognition of manifolds carrying those geometries is undecidable in general. Restricted classes do decompose; the unrestricted classification does not exist.
   349	\end{remark}
   350	
   351	\section{The holographic entropy cone}
   352	
   353	The holographic entropy cone is the one classification result on the quantum-information side of this volume whose completeness is proved in a bounded range. The bound matters: for two, three, and four regions the inequality set is known and small; five regions are settled by a later enumeration; from six regions on the facet lists are open. The explosion of facets from five regions on tracks the proliferation of minimal-graph topologies that minimal surfaces can realize \cite{baoetal}.
   354	
   355	\begin{theorem}[Entropy cone for at most four regions]\label{thm:cone}
   356	Fix $n \in \{2, 3, 4\}$ boundary regions of a conformal field theory with a smooth static classical Einstein dual. The holographic entropy cone $\mathcal{H}_n$ coincides with the polyhedral cone cut out by the RT inequalities, and these are exactly the strong subadditivity inequalities \eqref{eq:ssa} together with the monogamy-of-mutual-information inequalities \eqref{eq:mmi} in all their instances, including composite regions at $n = 4$. Monogamy is a three-region inequality: it is already facet-defining at $n = 3$ and is vacuous only at $n = 2$. For every fixed $n$ the number of independent RT inequalities is finite \cite{baoetal}.
   357	\end{theorem}
   358	
   359	\par\medskip\noindent\emph{Argument structure.}\,
   360	The proof reduces classical Einstein geometries to minimal graph models encoding the cutting and gluing relations of minimal surfaces, enumerates the extreme rays of the resulting cone for $n \le 4$, and identifies the facet inequalities with strong subadditivity and monogamy of mutual information. The finiteness for fixed $n$ follows from the finite combinatorial types of the graph models \cite{baoetal}.
   361	\par\medskip
   362	
   363	\Cref{thm:cone} is a completeness statement, and completeness statements invite over-reading. The cone $\mathcal{H}_n$ is defined through the Ryu-Takayanagi prescription, which is a proposal (\Cref{sec:conjectural}). What is proved is the combinatorial geometry of the set of vectors the prescription can produce in the classical limit. The next proposition shows that the second inequality family of \Cref{thm:cone} is genuinely additional.
   364	
   365	\begin{proposition}[Monogamy is independent of strong subadditivity]\label{prop:mmi}
   366	The monogamy-of-mutual-information inequality \eqref{eq:mmi} for three single regions is not implied by strong subadditivity \eqref{eq:ssa} over entropic vectors. An explicit witness is the entropy vector of a perfectly correlated triple, the standard counterexample of the holographic-entropy literature \cite{hhm,baoetal}: let $X$ be a uniform bit and set $A = B = C = X$. Then
   367	\[
   368	S(A) = S(B) = S(C) = S(AB) = S(AC) = S(BC) = S(ABC) = 1,
   369	\]
   370	all strong subadditivity inequalities \eqref{eq:ssa} hold, and \eqref{eq:mmi} is violated: the left side equals $4$ and the right side equals $3$.
   371	\end{proposition}
   372	
   373	\begin{proof}
   374	The vector is entropic: it is realized by the classical state of the random variable $X$, so every entropy is the Shannon entropy of the indicated marginal, and each listed value equals $1$. Strong subadditivity takes the form $S(U) + S(V) \ge S(U \cup V) + S(U \cap V)$ for unions $U, V$ of $\{A,B,C\}$. If $U \cap V = \emptyset$ then the right side is $S(U \cup V) \le 1$ and the left side is $2$. If $U \cap V \ne \emptyset$ then both sides equal $2$. So \eqref{eq:ssa} holds in every case. Monogamy of mutual information reads $S(A) + S(B) + S(C) + S(ABC) \le S(AB) + S(AC) + S(BC)$, that is $4 \le 3$ on this vector, which is false. An entropic vector satisfying strong subadditivity and violating monogamy proves independence.
   375	\end{proof}
   376	
   377	\begin{corollary}[Classical correlations violate monogamy]\label{cor:classicalmmi}
   378	The witness of \Cref{prop:mmi} is a classical random variable, so monogamy of mutual information is not valid for general quantum states, classical or otherwise. Its validity inside $\mathcal{H}_n$ is a property of minimal surfaces in classical Einstein gravity, not a property of entropy theory. The completeness of \Cref{thm:cone} needs the monogamy family in addition to strong subadditivity already at $n = 3$, because strong subadditivity alone leaves room for the witness.
   379	\end{corollary}
   380	
   381	\begin{proof}
   382	The witness is classical by construction. Substituting it into \eqref{eq:mmi} violates the inequality, so the inequality is not universally valid. \Cref{thm:cone} therefore cannot be stated with strong subadditivity alone.
   383	\end{proof}
   384	
   385	\begin{proposition}[Two forms of monogamy]\label{prop:mmiform}
   386	For three single regions, \eqref{eq:mmi} is equivalent to the information form
   387	\[
   388	I(A{:}B) + I(A{:}C) \le I(A{:}BC),
   389	\]
   390	and both are equivalent to the negativity statement that the tripartite information $I_3(A{:}B{:}C) = I(A{:}B) + I(A{:}C) - I(A{:}BC)$ is nonpositive.

exec
/usr/local/bin/zsh -lc "sed -n '390,548p' papers/latex/vol-08-spacetime-reconstruction.tex | nl -ba -v 390" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   390	and both are equivalent to the negativity statement that the tripartite information $I_3(A{:}B{:}C) = I(A{:}B) + I(A{:}C) - I(A{:}BC)$ is nonpositive.
   391	\end{proposition}
   392	
   393	\begin{proof}
   394	Expand the mutual informations: $I(A{:}B) + I(A{:}C) = 2S(A) + S(B) + S(C) - S(AB) - S(AC)$ and $I(A{:}BC) = S(A) + S(BC) - S(ABC)$. The inequality $I(A{:}B) + I(A{:}C) \le I(A{:}BC)$ rearranges to $S(A) + S(B) + S(C) + S(ABC) \le S(AB) + S(AC) + S(BC)$, which is \eqref{eq:mmi}. The tripartite form is the same inequality moved to one side.
   395	\end{proof}
   396	
   397	\begin{lemma}[Strong subadditivity from subadditivity and monogamy]\label{lem:ssaredundant}
   398	For three single regions, strong subadditivity follows from subadditivity together with monogamy of mutual information. At $n = 3$ the strong subadditivity family is therefore a consequence rather than an independent input. This argument covers three-region instances only: at $n = 2$ monogamy is vacuous, and at $n = 4$ the strong subadditivity instances involving four regions are not generated by three-region monogamy and remain independent inputs of \Cref{thm:cone}.
   399	\end{lemma}
   400	
   401	\begin{proof}
   402	The conditional mutual information factors as $I(A{:}C \mid B) = I(A{:}BC) - I(A{:}B)$. Monogamy \eqref{eq:mmi} in the form of \Cref{prop:mmiform} gives $I(A{:}BC) - I(A{:}B) \ge I(A{:}C)$, and subadditivity gives $I(A{:}C) \ge 0$. Hence $I(A{:}C \mid B) \ge 0$, which is strong subadditivity for the triple.
   403	\end{proof}
   404	
   405	\begin{lemma}[The witness satisfies every other standard inequality]\label{lem:witnessclean}
   406	The entropy vector of \Cref{prop:mmi} is nonnegative, is zero on $\emptyset$, and satisfies subadditivity, the Araki-Lieb bound, and strong subadditivity. It violates only \eqref{eq:mmi}. Hence the independence of \Cref{prop:mmi} is not caused by any other failure.
   407	\end{lemma}
   408	
   409	\begin{proof}
   410	All entries are $0$ or $1$, so nonnegativity holds and $S(\emptyset) = 0$ by convention. Subadditivity reads $1 + 1 \ge 1$ on any pair and $1 + 1 \ge 1$ with the triple, and the Araki-Lieb bound reads $0 \le 1$; both hold. Strong subadditivity holds by the case analysis of \Cref{prop:mmi}. Monogamy is the only violated inequality, by the computation there.
   411	\end{proof}
   412	
   413	The margin is worth recording numerically. On the witness vector the monogamy left side $S(A) + S(B) + S(C) + S(ABC)$ equals $4$ and the right side $S(AB) + S(AC) + S(BC)$ equals $3$, so the violation is $1$ in entropy units, while every strong subadditivity slack is $0$. The computational check of \Cref{tab:checks} reproduces these numbers from the joint distribution of $X$, and the sampled classical experiments reproduce the same pattern: strong subadditivity never fails, monogamy fails on a positive fraction of draws.
   414	
   415	\begin{remark}[Open problem: entropy cone for six or more regions]\label{op:cone5}
   416	The enumeration gap that \cite{baoetal} left at five regions has since been closed: the complete facet list for $n = 5$ is known \cite{hernandezcuenca}. For fixed $n \ge 6$ the number of independent RT inequalities is finite, but the facet lists are open, and for general $n$ only one infinite family of inequalities is known \cite{baoetal}. No verified resolution of the $n \ge 6$ gap was found in the sources reviewed (cutoff 2026-10-29).
   417	\end{remark}
   418	
   419	\begin{remark}[What the cone classifies]\label{rem:coneclassifies}
   420	$\mathcal{H}_n$ classifies entropy vectors, not spacetimes. A point of the cone records the entropies an RT surface assignment can produce for $n$ regions; recovering a bulk geometry from a point of the cone is a reconstruction problem of a different kind, taken up in \Cref{sec:reconstruction}. The two problems share vocabulary and do not share theorems.
   421	\end{remark}
   422	
   423	\section{Reconstruction from probes}\label{sec:reconstruction}
   424	
   425	Reconstruction in the sense of \Cref{def:reconstruction} asks what relational data suffices to determine a geometry. A classical pattern governs such results: an object is recovered from its probes, as commutative algebras are recovered from their characters. The two spacetime instances of the pattern that are theorems follow, one classical and one quantum-information-theoretic.
   426	
   427	\begin{theorem}[Causal reconstruction of conformal geometry]\label{thm:malament}
   428	Let $(M,g)$ and $(M',g')$ be time-oriented distinguishing spacetimes of dimension $n \ge 3$ and let $\varphi \colon M \to M'$ be a bijection preserving the chronological order: $p \prec q$ if and only if $\varphi(p) \prec' \varphi(q)$ for all $p, q$. Then $\varphi$ is a diffeomorphism and a conformal isometry. Consequently the chronological order determines the topology of $M$ and the conformal class $[g]$ of the metric \cite{malament,hkm}.
   429	\end{theorem}
   430	
   431	\par\medskip\noindent\emph{Argument structure.}\,
   432	The argument has two stages. First, the chronological order determines the topology: Malament shows that an order-preserving bijection between distinguishing spacetimes is a homeomorphism, using order arguments on chains of timelike curves rather than any metric. Second, a homeomorphism that maps timelike curves to timelike curves preserves the conformal class, and in dimension $n \ge 3$ the causal, differential, and conformal structures of a spacetime determine each other, so the homeomorphism upgrades to a smooth conformal isometry \cite{hkm}. The complete argument is Malament's \cite{malament} with the smooth upgrade of \cite{hkm}. In dimension $n = 2$ the conclusion fails: in null coordinates $(u,v)$ on $\mathbb{R}^{1,1}$ the map $(u,v) \mapsto (u^3, v)$ preserves the chronological order but its inverse is not smooth at $u = 0$.
   433	\par\medskip
   434	
   435	\Cref{thm:malament} is the strongest reconstruction statement in this volume, and its scope is exactly the scope of \Cref{def:reconstruction}: the probe datum is the chronological order, the class is the distinguishing spacetimes, and the equivalence is the conformal isometry class. The next corollary records the boundary of the theorem.
   436	
   437	\begin{corollary}[The order does not fix the conformal factor]\label{cor:confactor}
   438	No reconstruction of a metric from the chronological order alone can determine the conformal factor: distinct metrics $g$ and $e^{2f} g$ on the same manifold carry the same chronological order and are not isometric unless $f$ is constant. Recovering the conformal factor requires additional probe data, such as a volume form, a time function normalized by matter, or stress-energy data.
   439	\end{corollary}
   440	
   441	\begin{proof}
   442	Conformal rescaling of a metric by a positive function $e^{2f}$ preserves the timelike cones of every tangent space, hence preserves the chronological order. Distinct conformal factors give distinct metrics with the same probe datum, so no procedure reading the order can distinguish them. Any reconstruction of the full metric must add data that breaks the conformal freedom.
   443	\end{proof}
   444	
   445	Two unrelated topologies share the name Alexandrov in English transliteration. The open-diamond topology on a spacetime, due to A. D. Alexandrov, is generated by the sets $I^+(p) \cap I^-(q)$ and is sensitive to causality; the up-set topology on a poset, due to P. S. Alexandroff, is generated by up-sets and is generally not $T_1$. The two are distinguished by name throughout what follows.
   446	
   447	\begin{lemma}[The order determines the diamond topology]\label{lem:alexandrov}
   448	The chronological order of a spacetime determines the open-diamond topology of A. D. Alexandrov: the sets $I^+(p) \cap I^-(q)$ form a basis whose lattice structure is a function of the order alone. This diamond topology coincides with the manifold topology exactly when the spacetime is strongly causal \cite{minguzzisanchez}, so on a strongly causal spacetime the order determines the topology of $M$ without reference to the metric.
   449	\end{lemma}
   450	
   451	\begin{proof}
   452	Each diamond $I^+(p) \cap I^-(q)$ is defined by two order relations, so the family of diamonds is a function of the order, and the intersection of two diamonds is a union of diamonds. The identification of the diamond topology with the manifold topology under strong causality is the standard characterization recorded in the causal-hierarchy survey \cite{minguzzisanchez}. For merely distinguishing spacetimes the coincidence can fail, which is why \Cref{thm:malament} uses Malament's order-continuity argument instead of this topological shortcut.
   453	\end{proof}
   454	
   455	\begin{proposition}[Finite orders recover their order from their topology]\label{prop:specialization}
   456	Let $(X, \le)$ be a finite order and give $X$ the up-set topology of P. S. Alexandroff, whose open sets are the up-sets. Then $X$ is $T_0$, the closure of a singleton is its down-set $\mathrm{cl}(\{x\}) = \{ y : y \le x \}$, and the order is read off the topology by $x \le y$ if and only if $x \in \mathrm{cl}(\{y\})$.
   457	\end{proposition}
   458	
   459	\begin{proof}
   460	The closed sets of the up-set topology are the down-sets. The closure of $\{x\}$ is the intersection of all down-sets containing $x$, which is the smallest such down-set $\{y : y \le x\}$. For $T_0$, take $x \ne y$. Not both $x \le y$ and $y \le x$ hold. If $x \not\le y$ then $X \setminus \{z : z \le y\}$ is an up-set containing $x$ and not $y$; if $y \not\le x$ the symmetric set separates $y$ from $x$. In either case an open set distinguishes the pair. The order is then recovered from the closures as stated.
   461	\end{proof}
   462	
   463	\Cref{prop:specialization} is the order-theoretic analogue of the topological step in \Cref{thm:malament}, but it is not the same topology: \Cref{lem:alexandrov} concerns the open-diamond topology of A. D. Alexandrov on a spacetime, while \Cref{prop:specialization} concerns the up-set topology of P. S. Alexandroff on a poset. In both cases a topology built from the order recovers the order. What \Cref{prop:distinguish} blocks is the next step, the passage from order to geometry; that passage uses smoothness in \Cref{thm:malament} and has no finite-order analogue.
   464	
   465	\begin{theorem}[Entanglement-wedge reconstruction]\label{thm:dhw}
   466	In the holographic correspondence, let $A$ be a boundary subregion of a code subspace of states with a smooth classical dual, and let $W(A)$ be its entanglement wedge. Bulk operators supported in $W(A)$ can be reconstructed as operators acting on $A$ alone, within the code subspace. The result is a theorem of quantum information theory: its hypotheses are stated in the language of quantum error correction and quantum relative entropy, and its proof combines the relative-entropy argument for subregions with the error-correcting structure of the correspondence \cite{dongharlowwall}.
   467	\end{theorem}
   468	
   469	\par\medskip\noindent\emph{Argument structure.}\,
   470	The argument has two inputs. First, the quantum relative entropy of the subregion's state equals a bulk relative entropy in the wedge, which fixes the modular Hamiltonian data of the bulk region. Second, the error-correcting properties of the code subspace allow bulk operators in the wedge to be represented on $A$ without disturbing states outside the code subspace. Combining the two gives a boundary representation of each bulk operator in $W(A)$, with the hypotheses of the cited source \cite{dongharlowwall}.
   471	\par\medskip
   472	
   473	\begin{remark}[Layers]\label{rem:layers}
   474	\Cref{thm:dhw} is a quantum-information theorem and \Cref{thm:malament} is a differential-geometric theorem. Neither is a theorem of gravity. \Cref{thm:dhw} speaks of a code subspace in a holographic correspondence; the interpretation of that code subspace as a theory of quantum gravity is the conjectural layer of \Cref{sec:conjectural}. Keeping the layers apart is the discipline that makes the claims checkable.
   475	\end{remark}
   476	
   477	Probe data recovers a space only where distinct spaces produce distinct probe structures. The classical instance is the Gelfand representation theorem: a compact Hausdorff space is recovered up to homeomorphism from its commutative unital $C^*$-algebra of continuous functions, through the Gelfand spectrum of characters in the weak-* topology. \Cref{thm:malament} is the spacetime instance, recovering conformal geometry in dimension $n \ge 3$ from chronological order, and \Cref{thm:dhw} is the quantum-information instance, representing wedge operators on boundary subregions. Category theory names the general pattern: the Yoneda embedding characterizes an object by the totality of its probes. The pattern alone establishes nothing physical. The qualification binding this program is stated once here and applies throughout: Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.
   478	
   479	\begin{table}[t]
   480	\centering
   481	\caption{Three reconstruction theorems compared by \Cref{def:reconstruction}: probe datum, recovered target, equivalence, and hypotheses. The pattern is constant and the hypotheses are not; each theorem stands on its own row.}
   482	\label{tab:reconstruction}
   483	\footnotesize
   484	\begin{tabularx}{\textwidth}{L{0.13\textwidth}L{0.20\textwidth}L{0.20\textwidth}L{0.15\textwidth}X}
   485	\toprule
   486	Theorem & Probe datum & Target & Equivalence & Hypotheses \\
   487	\midrule
   488	Gelfand duality & Gelfand spectrum (characters, weak-* topology) & Compact Hausdorff space & Homeomorphism & Commutative unital $C^*$-algebra \\
   489	Malament & Chronological order & Topology and conformal class & Conformal isometry & Distinguishing, $n \ge 3$ \\
   490	Entanglement wedge & Boundary subregion algebra & Bulk operators in the wedge & Code equality & Code subspace \\
   491	\bottomrule
   492	\end{tabularx}
   493	\end{table}
   494	
   495	\Cref{tab:reconstruction} makes the boundaries visible. Gelfand duality and Malament are determination theorems: the probe datum fixes the target up to the declared equivalence. Entanglement-wedge reconstruction is a representation theorem instead. Operators on a target region are representable on a probe region inside a restricted class of states. The distinction matters for the conjectural layer. A claim that entanglement determines spacetime would need to be a determination theorem of the Malament type, with entanglement data as probes. No such theorem is on the shelf.
   496	
   497	\section{The conjectural core}\label{sec:conjectural}
   498	
   499	Everything in this section is a proposal or an argument. Nothing here is used as a premise of a theorem elsewhere in the paper.
   500	
   501	\begin{remark}[The Ryu-Takayanagi proposal]\label{rem:rt}
   502	The Ryu-Takayanagi prescription \cite{ryutakayanagi} proposes that the entanglement entropy of a boundary region $A$ equals the area of a minimal bulk surface homologous to $A$, in units of $4G_N$:
   503	\begin{equation}\label{eq:rt}
   504	S(A) = \min_{\gamma_A \, \sim \, A} \frac{\mathrm{Area}(\gamma_A)}{4 G_N},
   505	\end{equation}
   506	where the minimum runs over bulk surfaces $\gamma_A$ homologous to $A$ in the spatial slice. The proposal is argued from the AdS/CFT correspondence. Exact agreement holds in the AdS$_3$/2D CFT case of the original statement \cite{ryutakayanagi} and for spherical entangling surfaces in arbitrary dimension, where a conformal mapping argument derives the formula \cite{casinimyers}; a replica derivation for static bulk geometries explains the prescription at the physics level \cite{lewkowyczmaldacena}, and a covariant extremal-surface generalization is proposed in \cite{hrt}. None of these arguments is a theorem of constructive quantum field theory, and the prescription remains a proposal. The holographic entropy cone of \Cref{thm:cone} is defined through this prescription, so the completeness of that theorem is a completeness statement about the cone of a proposal. What is proved there is the combinatorial enumeration of the inequalities the proposal produces in the classical limit; what is not proved is that the prescription holds in any given theory.
   507	\end{remark}
   508	
   509	\begin{remark}[Toy models]\label{rem:happy}
   510	The HaPPY codes \cite{haappy} are exactly solvable tensor-network models built from perfect tensors. Inside these models the Ryu-Takayanagi formula and the negativity of tripartite information hold exactly, and bulk logical operators admit multiple boundary representations that mimic wedge reconstruction. The models prove statements about tensor networks. They are not evidence about actual AdS/CFT beyond the analogy they are designed to exhibit, and no result of this paper treats them as evidence about gravity.
   511	\end{remark}
   512	
   513	\begin{remark}[Entanglement and connectedness]\label{rem:vanraamsdonk}
   514	Van Raamsdonk's essay \cite{vanraamsdonk} argues that the emergence of classically connected spacetime is tied to quantum entanglement: disentangling the degrees of freedom of two regions makes the regions pinch off from each other, quantified by standard entanglement measures. The status of the statement is an argument based on examples, not a theorem. It states a research direction for reconstruction: if entanglement builds connectedness, then entanglement data should determine geometric data. \Cref{thm:malament} shows what such a determination would have to look like as a theorem, with class, datum, and equivalence declared. No such theorem is claimed here.
   515	\end{remark}
   516	
   517	The gap between these remarks and a reconstruction theorem of quantum gravity is not a technicality. \Cref{thm:malament} recovers a conformal class from a causal order; it does not derive a metric from entanglement. \Cref{thm:dhw} recovers operators inside a code subspace; it does not derive the code subspace from first principles. A derivation of spacetime geometry from informational data without assuming the geometry at the start would need both steps in reverse order and is not on the shelf.
   518	
   519	\begin{remark}[What an upgrade would require]\label{rem:upgrade}
   520	To promote the entanglement-connectedness argument \cite{vanraamsdonk} to a theorem of the kind \Cref{def:reconstruction} asks for, three things would be needed: a probe datum consisting only of entanglement data on a declared family of subsystems, a proof that the datum determines a spacetime up to a declared equivalence, and a demonstration that the construction does not smuggle in the geometry at the start. \Cref{thm:malament} shows the second item is achievable when the probe datum is a causal order and the equivalence is conformal. \Cref{cor:confactor} shows that even then a conformal factor remains undetermined, so the third item requires either additional data or a theorem that the factor is physically irrelevant. None of the three items is established in the sources reviewed (cutoff 2026-10-29).
   521	\end{remark}
   522	
   523	\section{Computational evidence}
   524	
   525	Three experiments accompany the claims above. They are recorded as evidence, run from \texttt{src/vol-08-spacetime-reconstruction/}, and checked by the paper's code evidence appendix. None of them proves anything: they test that the definitions behave as the proofs say on finite instances. The claims each experiment probes are listed in \Cref{tab:checks} and \Cref{tab:code}.
   526	
   527	The entropy experiment evaluates \eqref{eq:ssa} and \eqref{eq:mmi} on the witness vector of \Cref{prop:mmi} and on random classical distributions of three binary variables. The witness reproduces the proof exactly: every strong subadditivity inequality holds and monogamy fails by a margin of one. The random samples never violate strong subadditivity and violate monogamy in a positive fraction of cases, which is the computational shape of \Cref{cor:classicalmmi}. The finite-order experiment enumerates the 242 partial orders on at most four labeled points and takes a census of the ladder rungs: no order carries an increasing loop, only 33 of the orders are distinguishing, and the antichain of two points is the witness of \Cref{prop:distinguish}. The Alexandroff experiment builds the up-set topology on each enumerated order and verifies \Cref{prop:specialization}: the closure of each singleton is its down-set and the topology recovers the order.
   528	
   529	The Haskell layer records the same objects as typed instances of family classes defined outside this volume: Lorentzian spacetime systems with holonomy and causal-rung data, entropy-vector systems, and Thurston geometry types. The family classes are imported, never redefined. The Haskell code is executable modeling evidence. It has not been checked by a proof assistant, and the honest statement about its status is that the executable models are validated against the informal specifications in this paper, not that anything here is machine-checked.
   530	
   531	\begin{table}[t]
   532	\centering
   533	\caption{Typed instances of the volume's systems against the shared family classes. Each row names the Haskell type, the instance declared, and the paper definition the type mirrors.}
   534	\label{tab:haskell}
   535	\footnotesize
   536	\begin{tabularx}{\textwidth}{L{0.24\textwidth}L{0.32\textwidth}X}
   537	\toprule
   538	Haskell type & Instance & Paper definition \\
   539	\midrule
   540	\texttt{LorentzianSpacetime} & \texttt{PhysicalSystem}, \texttt{FamilySmoothGeometric} & \Cref{def:spacetime}, \Cref{def:systems} \\
   541	\texttt{LorentzianHolonomyType} & Data mirroring the classification & \Cref{def:holonomy}, \Cref{thm:holonomy} \\
   542	\texttt{CausalRung} & Data mirroring the ladder rungs & \Cref{def:ladder}, \Cref{thm:ladder} \\
   543	\texttt{HolographicEntropyVector} & \texttt{PhysicalSystem}, \texttt{FamilyProbabilityMeasure} & \Cref{def:entropy}, \Cref{def:cone} \\
   544	\texttt{ThurstonGeometry3} & \texttt{FamilySmoothGeometric} & \Cref{thm:geometrization}, \Cref{tab:geometries} \\
   545	\bottomrule
   546	\end{tabularx}
   547	\end{table}
   548	

codex
The main layout risks are long math expressions and unbreakable type names in narrow table columns. I’m also checking reference and citation keys within this file. Box warnings cannot be confirmed without compiling.
exec
/usr/local/bin/zsh -lc "python3 -c 'import re,collections; from pathlib import Path; s=Path(\"papers/latex/vol-08-spacetime-reconstruction.tex\").read_text(); labels=re.findall(r\"\\\\label\\{(["'^}]+)'"\\}\",s); refs=[(i,k) for i,l in enumerate(s.splitlines(),1) for r in re.findall(r\"\\\\(?:Cref|cref|ref|eqref)\\{(["'^}]+)'"\\}\",l) for k in r.split(\",\")]; bibs=set(re.findall(r\"\\\\bibitem\\{(["'^}]+)'"\\}\",s)); print(\"Missing labels:\",[(i,k) for i,k in refs if k not in labels]); print(\"Duplicate labels:\",[k for k,v in collections.Counter(labels).items() if v>1]); print(\"Missing citations:\",[(i,k) for i,l in enumerate(s.splitlines(),1) for c in re.findall(r\"\\\\cite\\{(["'^}]+)'"\\}\",l) for k in c.split(\",\") if k not in bibs]); print(\"Environment counts match:\",collections.Counter(re.findall(r\"\\\\begin\\{(["'^}]+)'"\\}\",s))==collections.Counter(re.findall(r\"\\\\end\\{(["'^}]+)'"\\}\",s))); print([(x,len(x)) for x in [\"LorentzianHolonomyType\",\"HolographicEntropyVector\",\"FamilyProbabilityMeasure\"]])'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 40ms:
Missing labels: []
Duplicate labels: []
Missing citations: []
Environment counts match: True
[('LorentzianHolonomyType', 22), ('HolographicEntropyVector', 24), ('FamilyProbabilityMeasure', 24)]

codex
Reviewed only `papers/latex/vol-08-spacetime-reconstruction.tex`. Static checks found no missing reference/citation keys, duplicate labels, unmatched environment counts, or obvious missing packages. Compilation and box warnings were not verified.

1. **Line 543 — table-cell overflow.** `\texttt{HolographicEntropyVector}` is unbreakable and approximately 113.4 pt wide at `\footnotesize`, slightly exceeding the first column’s approximately 112.7 pt width (line 536).
   **Fix:** widen that column from `0.24\textwidth` to `0.26\textwidth`; the final `X` column will absorb the adjustment. Alternatively, insert a permissible break:
   ```latex
   \texttt{Holographic\allowbreak EntropyVector}
   ```

2. **Line 87 — missing display punctuation.** The equation continues into “for all unions” on line 89 but lacks the separating comma.
   **Fix:**
   ```latex
   S(U) + S(V) \ge S(U \cup V) + S(U \cap V),
   ```

3. **Lines 654, 657, 663, 675, 678, 690 — hyphens used for page ranges.** Bibliographic page ranges should use en dashes.
   **Fix:** replace `249-298`, `299-358`, `357-381`, `1399-1404`, `174-181`, and `2323-2329` with `249--298`, `299--358`, `357--381`, `1399--1404`, `174--181`, and `2323--2329`, respectively. Preserve hyphens within identifiers and DOIs.

VERDICT: NEEDS_FIX (issues listed above must be fixed)
hook: Stop
hook: Stop Completed
tokens used
46,896
Reviewed only `papers/latex/vol-08-spacetime-reconstruction.tex`. Static checks found no missing reference/citation keys, duplicate labels, unmatched environment counts, or obvious missing packages. Compilation and box warnings were not verified.

1. **Line 543 — table-cell overflow.** `\texttt{HolographicEntropyVector}` is unbreakable and approximately 113.4 pt wide at `\footnotesize`, slightly exceeding the first column’s approximately 112.7 pt width (line 536).
   **Fix:** widen that column from `0.24\textwidth` to `0.26\textwidth`; the final `X` column will absorb the adjustment. Alternatively, insert a permissible break:
   ```latex
   \texttt{Holographic\allowbreak EntropyVector}
   ```

2. **Line 87 — missing display punctuation.** The equation continues into “for all unions” on line 89 but lacks the separating comma.
   **Fix:**
   ```latex
   S(U) + S(V) \ge S(U \cup V) + S(U \cap V),
   ```

3. **Lines 654, 657, 663, 675, 678, 690 — hyphens used for page ranges.** Bibliographic page ranges should use en dashes.
   **Fix:** replace `249-298`, `299-358`, `357-381`, `1399-1404`, `174-181`, and `2323-2329` with `249--298`, `299--358`, `357--381`, `1399--1404`, `174--181`, and `2323--2329`, respectively. Preserve hyphens within identifiers and DOIs.

VERDICT: NEEDS_FIX (issues listed above must be fixed)
