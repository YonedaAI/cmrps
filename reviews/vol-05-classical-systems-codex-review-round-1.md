---
reviewer: codex (OpenAI) gpt-6.1-sol
type: formatting
paper: vol-05-classical-systems
round: 1
date: 2026-10-30T05:04:20Z
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
session id: 01a18b31-d2e5-7e20-94b8-3ec8d22f5322
--------
user
Read ONLY the file papers/latex/vol-05-classical-systems.tex (do not explore other files or directories). Review it for LaTeX formatting issues: compilation errors, missing packages, broken references, inconsistent styling, overfull/underfull boxes, spacing problems. List all issues with line numbers and concrete fixes. End your response with a VERDICT line - exactly one of: VERDICT: PASS (no issues remain) or VERDICT: NEEDS_FIX (issues listed above must be fixed).
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
I’ll read only the specified LaTeX file and check for formatting and source-level compilation issues.
exec
/usr/local/bin/zsh -lc 'nl -ba papers/latex/vol-05-classical-systems.tex' in /Users/mlong/Documents/Development/classification-physical-systems
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
    14	\usepackage{tikz}
    15	\usepackage{booktabs,tabularx,array,longtable}
    16	\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
    17	\usepackage{listings}
    18	\lstset{basicstyle=\ttfamily\footnotesize,breaklines=true,columns=fullflexible,frame=single,framesep=4pt,showstringspaces=false,captionpos=b}
    19	\usepackage[hidelinks]{hyperref}
    20	\usepackage{cleveref}
    21	\crefname{lstlisting}{Listing}{Listings}
    22	
    23	\newtheorem{theorem}{Theorem}[section]
    24	\newtheorem{proposition}[theorem]{Proposition}
    25	\newtheorem{lemma}[theorem]{Lemma}
    26	\newtheorem{corollary}[theorem]{Corollary}
    27	\theoremstyle{definition}
    28	\newtheorem{definition}[theorem]{Definition}
    29	\theoremstyle{remark}
    30	\newtheorem{remark}[theorem]{Remark}
    31	\newtheorem{example}[theorem]{Example}
    32	
    33	\title{Classification of Classical Physical Systems\\[4pt]
    34	  {\normalsize Part 5 of \emph{The Classification of Mathematical Representations of Physical Systems}}}
    35	\author{Matthew Long\\
    36	  \small The YonedaAI Collaboration, YonedaAI Research Collective\\
    37	  \small Chicago, Illinois, USA\\
    38	  \small \texttt{mlong@yonedalabs.ai}\\
    39	  \small \texttt{https://yonedalabs.ai}}
    40	\date{October 2026}
    41	
    42	\begin{document}
    43	
    44	\maketitle
    45	
    46	\begin{abstract}
    47	This paper classifies restricted classes of classical physical systems: symplectic and Poisson systems and classical statistical systems. The central structural fact is an inversion of the Riemannian situation. Darboux's theorem removes every local symplectic invariant, so the classification content of Hamiltonian mechanics is global and topological. On the Poisson side, Weinstein's splitting theorem replaces local rigidity by a rank stratification into symplectic leaves and transverse data, and coadjoint orbits tie the homogeneous case to the Dynkin classification of simple Lie algebras and the highest-weight classification of their finite-dimensional representations. On the statistical side, Chentsov's theorem singles out the Fisher metric as the unique metric monotone under stochastic maps, while the quantum analogue is parametric rather than unique. The results include one complete local classification theorem, one rank normal form, one uniqueness theorem, and two restricted global classification theorems, each stated with hypotheses and proof or proof reference. The limitation that matters most is scope: no global classification theorem for closed symplectic manifolds is claimed or available, decomposition uniqueness is open outside restricted subclasses, and the deformation-quantization bridge to quantum theory remains conjectural. Computational experiments exhibit the local normal forms and supply executable models; they are evidence, not proofs.
    48	\end{abstract}
    49	
    50	\section{Introduction}
    51	
    52	Classical physical systems carry their state, observables, dynamics, symmetries, and composition rules on smooth manifolds and probability simplices, and the relevant mathematical structures are fully developed: symplectic manifolds, Poisson manifolds, probability simplices. A classification of these structures is a question about what the surviving invariants are.
    53	
    54	The answer is shaped by a single theorem. Darboux's theorem states that all symplectic manifolds of a fixed dimension are locally indistinguishable: near every point, a symplectic manifold looks exactly like a standard linear space with a standard two-form. Riemannian geometry classifies locally through curvature, an invariant with content at every point. Symplectic geometry has no local invariants at all. Whatever classification content Hamiltonian mechanics possesses lives in the large, in topology and global geometry. This inversion, recorded as a structural lesson of the research program, organizes the entire paper.
    55	
    56	Three bodies of established mathematics carry the classification effort. The local theory of Poisson manifolds contributes the rank stratification: Weinstein's splitting theorem decomposes a neighborhood of a point into a symplectic factor and a transverse Poisson factor, so Poisson geometry replaces the missing local invariants of the symplectic case by a rank stratification and a foliation into symplectic leaves. The theory of coadjoint orbits contributes the homogeneous case. Coadjoint orbits of a Lie group carry a canonical symplectic form, the Kirillov-Kostant-Souriau form, and for compact semisimple groups the orbits form flag manifolds parameterized by the positive Weyl chamber, with dominant integral weights selecting the integral orbits. The Killing-Cartan classification of simple Lie algebras and the highest-weight classification of their representations therefore enter classical mechanics as the classification of homogeneous symplectic manifolds. Information geometry on the classical side contributes the uniqueness theorem: Chentsov's theorem singles out the Fisher metric, up to a constant, as the unique Riemannian metric monotone under stochastic maps. Classical statistical systems thus possess a uniqueness theorem that their quantum analogues provably lack.
    57	
    58	No global classification theorem for closed symplectic manifolds is known or claimed. Decomposition of classical systems into irreducible factors is unique only in restricted subclasses, and action-angle monodromy is an explicit obstruction to global decomposition in one of those subclasses. The deformation-quantization bridge between classical and quantum families is a programmatic conjecture, and the paper treats it as conditional throughout. Every theorem below is stated with its hypotheses; every computational claim is marked as evidence rather than proof.
    59	
    60	Mathematical equivalence for these systems is structure-preserving isomorphism: symplectomorphisms preserve symplectic forms, Poisson isomorphisms preserve brackets, and reparameterizations preserve probability structure. Physical equivalence is a coarser relation that this paper does not define, and every classification theorem below applies to mathematical structures under these isomorphisms.
    61	
    62	\section{Mathematical framework}
    63	
    64	A classical system in this paper is an instance of the five-component schema of the series: a tuple of state space, observables, dynamics, symmetries, and composition rules, with each component specialized to smooth-geometric or measure-theoretic data.
    65	
    66	\begin{definition}[Classical system]
    67	\label{def:classical-system}
    68	A classical system is a tuple $P = (X, O, D, S, C)$ where $X$ is a smooth state space, $O$ is a distinguished family of observables on $X$, $D$ is a family of admissible state evolutions with their composition rules (vector fields with flows on smooth manifolds, stochastic maps on simplices), $S$ is symmetry data preserving $O$ and $D$ (a Lie group action in the smooth case, outcome permutations and sufficient-statistics embeddings in the statistical case), and $C$ assigns composition data to products of systems. The tuple is the classical instance of the five-component schema of the series.
    69	\end{definition}
    70	
    71	\begin{definition}[Symplectic system]
    72	\label{def:symplectic-system}
    73	A symplectic system is a classical system whose state space is a symplectic manifold $(M, \omega)$ of dimension $2n$, whose observables are $O = C^{\infty}(M)$, and whose dynamics are Hamiltonian vector fields $X_H$ defined by $\iota_{X_H} \omega = dH$ for Hamiltonians $H \in C^{\infty}(M)$. The Poisson bracket is $\{f, g\} = \omega(X_f, X_g)$ and the flow equation reads $\dot{f} = \{f, H\}$.
    74	\end{definition}
    75	
    76	\begin{definition}[Poisson system]
    77	\label{def:poisson-system}
    78	A Poisson system is a classical system whose state space is a Poisson manifold $(M, \pi)$: a smooth manifold with a bivector field $\pi \in \Gamma(\Lambda^2 TM)$ whose Schouten-Nijenhuis bracket satisfies $[\pi, \pi] = 0$. The bracket $\{f, g\} = \pi(df, dg)$ makes $C^{\infty}(M)$ a Lie algebra obeying the Leibniz rule in each argument. Symplectic systems are the special case in which $\pi$ is nondegenerate.
    79	\end{definition}
    80	
    81	\begin{definition}[Classical statistical system]
    82	\label{def:statistical-system}
    83	A classical statistical system is a classical system whose state space is the interior $\Delta^{\circ} = \{ p \in \mathbb{R}^{n} : p_i > 0,\ \sum_i p_i = 1 \}$ of the probability simplex $\Delta^{n-1} = \{ p \in \mathbb{R}^{n} : p_i \geq 0,\ \sum_i p_i = 1 \}$, whose observables are random variables (functions on the outcome set), and whose admissible state changes are the column-stochastic matrices $T$ that map $\Delta^{\circ}$ into itself (columns strictly positive); maps that reach the boundary are excluded because the Fisher metric is singular there. Restriction to submodels is by sufficient statistics, and the symmetries $S$ are the outcome permutations together with those embeddings.
    84	\end{definition}
    85	
    86	The three families in force are the symplectic and Poisson family, the smooth geometric family, and the classical probability and measure family. The quantum side of the probability family appears in Section 8 only as a contrast.
    87	
    88	\begin{definition}[Morphisms and equivalence in force]
    89	\label{def:morphisms}
    90	Between symplectic systems the admissible exact morphisms are symplectomorphisms and, between Poisson systems, Poisson maps (smooth maps pulling Poisson brackets back). Between classical statistical systems the admissible coarse-grainings are stochastic maps. Mathematical equivalence of classical systems is isomorphism in the ambient category fixed here: symplectomorphism, Poisson isomorphism, or diffeomorphism of statistical models carrying the model map. Every such identification preserves the symplectic form or the Poisson bracket or the probability structure, and the paper names the preserved layer whenever an identification is claimed.
    91	\end{definition}
    92	
    93	\begin{definition}[Irreducibility relative to composition]
    94	\label{def:irreducible}
    95	Fix the product composition of Section 9 as the composition data $C$. A classical system is $C$-irreducible if it admits no decomposition $P \simeq P_1 \times P_2$ with both factors of positive dimension. Irreducibility is always relative to the composition data chosen, and the paper never asserts irreducibility without naming that data.
    96	\end{definition}
    97	
    98	Two limitations of the framework are load-bearing. First, the admissibility conditions of the series are not yet fixed, so every statement below quantifies over explicitly listed classes rather than over all admissible systems. Second, mathematical equivalence is strictly finer than physical equivalence, and no physical equivalence for classical systems is fixed here. The standing qualification of the series governs any attempt to derive physical conclusions from relational data: ``Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.''
    99	
   100	\begin{table}[t]
   101	\centering
   102	\small
   103	\begin{tabular}{L{3.2cm}L{9.8cm}}
   104	\toprule
   105	Symbol & Meaning \\
   106	\midrule
   107	$(M, \omega)$ & symplectic manifold of dimension $2n$ with closed nondegenerate two-form \\
   108	$\pi$, $\pi^{\sharp}$ & Poisson bivector and the map $T^{*}M \to TM$ it induces \\
   109	$X_H$ & Hamiltonian vector field defined by $\iota_{X_H} \omega = dH$ \\
   110	$\{f, g\}$ & Poisson bracket of observables \\
   111	$\mathcal{O}_{\xi}$ & coadjoint orbit through $\xi \in \mathfrak{g}^{*}$ \\
   112	$J$ & momentum map of a symplectic group action \\
   113	$\Delta^{\circ}$ & interior of the probability simplex \\
   114	$g_{p}$ & Fisher metric at the probability vector $p$ \\
   115	$T^{*} g_{Tp}$ & pullback of the metric at $Tp$ along a stochastic map \\
   116	$C$ & product composition of classical systems \\
   117	\bottomrule
   118	\end{tabular}
   119	\caption{Notation used throughout the paper. Each symbol is fixed at its first appearance and reused without change.}
   120	\label{tab:notation}
   121	\end{table}
   122	
   123	\begin{definition}[Canonical transformation and coarse-graining]
   124	\label{def:canonical}
   125	A canonical transformation between symplectic systems $(M_1, \omega_1)$ and $(M_2, \omega_2)$ is a diffeomorphism $\varphi : M_1 \to M_2$ with $\varphi^{*} \omega_2 = \omega_1$; it carries Hamiltonian flows to Hamiltonian flows and preserves the Poisson bracket. A coarse-graining of a classical statistical system is a stochastic map $T$; it preserves the probability structure and contracts the Fisher metric by \cref{def:monotone}. The two kinds of morphism implement the two equivalence regimes of this paper: exact mathematical equivalence on the symplectic side and a metric-degrading order relation on the statistical side.
   126	\end{definition}
   127	
   128	\section{Local classification of symplectic systems}
   129	
   130	The classification of symplectic manifolds is locally trivial and globally hard. The local triviality is a theorem.
   131	
   132	\begin{lemma}[Linearization at a point]
   133	\label{lem:linearization}
   134	Let $(M^{2n}, \omega)$ be symplectic and let $p \in M$. There are coordinates $(x_1, y_1, \dots, x_n, y_n)$ centered at $p$ in which $\omega_p = \sum_{i=1}^{n} dx_i \wedge dy_i$ at $p$.
   135	\end{lemma}
   136	
   137	\begin{proof}
   138	Choose any coordinates $u_1, \dots, u_{2n}$ centered at $p$. The matrix $\Omega = (\omega_{ij}(p))$ of $\omega$ at $p$ is skew-symmetric and invertible. Symplectic Gram-Schmidt: pick $u_1$ with $\omega(u_1, \cdot) \neq 0$, set $v_1$ with $\omega(u_1, v_1) = 1$, restrict to the symplectic complement of $\operatorname{span}(u_1, v_1)$, and iterate. The resulting frame $e_1, f_1, \dots, e_n, f_n$ satisfies $\omega(e_i, f_j) = \delta_{ij}$, $\omega(e_i, e_j) = \omega(f_i, f_j) = 0$, and dual coordinates give the claim.
   139	\end{proof}
   140	
   141	\begin{lemma}[Moser trick on a ball]
   142	\label{lem:moser-ball}
   143	Let $B$ be an open ball centered at $p$ in a chart, and let $\omega_t$, $t \in [0, 1]$, be a smooth family of symplectic forms on $B$ with $\omega_t$ nondegenerate for all $t$. If $\dot{\omega}_t$ is exact for each $t$, then there is a concentric ball $B'$ compactly contained in $B$ carrying an isotopy $\varphi_t$ with $\varphi_t^{*} \omega_t = \omega_0$ for all $t$, and $\varphi_1$ maps $B'$ into $B$.
   144	\end{lemma}
   145	
   146	\begin{proof}
   147	Let $Z$ be the radial vector field of $B$ from its center $p$, so $Z(p) = 0$ and $B$ is star-shaped for $Z$. For the closed form $\dot{\omega}_t$ the homotopy operator gives the primitive $\alpha_t = \iota_{Z} \dot{\omega}_t$, which satisfies $d \alpha_t = \dot{\omega}_t$ and $\alpha_t(p) = 0$ because $Z$ vanishes at $p$. Solve $\iota_{X_t} \omega_t = -\alpha_t$; nondegeneracy of $\omega_t$ makes this solvable and $X_t(p) = 0$. Let $L$ be a Lipschitz constant for the field $X_t$ on $B$, uniform in $t \in [0, 1]$, and choose $r > 0$ with $B(p, r)$ compactly contained in $B$ and $e^{L} r$ smaller than the distance from $p$ to the boundary of $B$. Grönwall's inequality gives $|\varphi_t(x) - p| \leq e^{L t} |x - p|$ for as long as the trajectory stays in $B$, so the flow $\varphi_t$ of $X_t$ starting at the identity exists on all of $[0, 1]$ and maps $B' = B(p, r)$ into $B$. Then
   148	\[
   149	\frac{d}{dt} \varphi_t^{*} \omega_t = \varphi_t^{*} \left( \dot{\omega}_t + \mathcal{L}_{X_t} \omega_t \right) = \varphi_t^{*} \left( d\alpha_t + d \iota_{X_t} \omega_t \right) = \varphi_t^{*} (d \alpha_t - d \alpha_t) = 0,
   150	\]
   151	so $\varphi_t^{*} \omega_t$ is constant and equals $\omega_0$.
   152	\end{proof}
   153	
   154	\begin{theorem}[Darboux]
   155	\label{thm:darboux}
   156	Let $(M^{2n}, \omega)$ be a symplectic manifold and $p \in M$. There exists a neighborhood $U$ of $p$ and a diffeomorphism $\varphi : U \to V$ onto an open subset $V \subset \mathbb{R}^{2n}$ such that $\varphi^{*} \omega_0 = \omega|_U$ where $\omega_0 = \sum_{i=1}^{n} dx_i \wedge dy_i$. In particular, any two symplectic manifolds of the same dimension are locally symplectomorphic.
   157	\end{theorem}
   158	
   159	\begin{proof}
   160	By \cref{lem:linearization} choose centered coordinates on a ball $B$ around $p$ in which $\omega_p = \omega_0$ at the center. The family $\omega_t = \omega_0 + t(\omega - \omega_0)$ is a smooth family of closed two-forms with $\omega_t$ nondegenerate on a possibly smaller ball $B' \subset B$ (nondegeneracy is an open condition and holds at $p$ for every $t$). On $B'$ the form $\omega - \omega_0$ is closed, and since $B'$ is contractible its de Rham cohomology vanishes in degree two, so $\omega - \omega_0 = d\alpha$ for a one-form $\alpha$ and $\dot{\omega}_t = d\alpha$ is exact for every $t$. \cref{lem:moser-ball} provides an isotopy $\varphi_t$ of $B'$ with $\varphi_1^{*} \omega_1 = \omega_0$ and $\omega_1 = \omega$. The diffeomorphism $\varphi_1^{-1}$ exhibits $(B', \omega)$ as a symplectomorphic image of an open set in $(\mathbb{R}^{2n}, \omega_0)$.
   161	\end{proof}
   162	
   163	\begin{corollary}[Absence of local invariants]
   164	\label{cor:no-local}
   165	Every local symplectic invariant of a $2n$-dimensional symplectic manifold is constant on connected components. Any classification of symplectic manifolds up to symplectomorphism must be carried by global data.
   166	\end{corollary}
   167	
   168	\begin{proof}
   169	Local symplectic invariants are preserved by symplectomorphisms, and \cref{thm:darboux} supplies a symplectomorphism from a neighborhood of any point onto a neighborhood of any point of the standard space of the same dimension. Two points of a connected manifold are joined by a chain of such neighborhoods.
   170	\end{proof}
   171	
   172	\begin{remark}[The inversion]
   173	\label{rem:inversion}
   174	In Riemannian geometry the curvature tensor is a local invariant with pointwise content, and local normal forms are scarce. In symplectic geometry the local classification has one entry per dimension, and the classification problem moves to global topology.
   175	\end{remark}
   176	
   177	The same argument classifies exact symplectic structures locally in the strongest sense: on a ball, every symplectic form is not merely standardizable but symplectomorphic to the constant standard form. 
   178	
   179	\section{Poisson geometry and local models}
   180	
   181	Poisson manifolds retain local structure where symplectic manifolds have none. The rank of $\pi$ at a point is the invariant Darboux's theorem destroyed for the symplectic case, and a normal form organizes a neighborhood of a point around that rank.
   182	
   183	\begin{theorem}[Weinstein splitting]
   184	\label{thm:weinstein}
   185	Let $(M, \pi)$ be a Poisson manifold and $p \in M$ a point of rank $2k$. There exist a neighborhood $U$ of $p$ and a Poisson diffeomorphism from $U$ onto a product $U_1 \times U_2$ where $U_1$ is a neighborhood of a point in a symplectic manifold $(N^{2k}, \omega)$ and $U_2$ is a neighborhood of a zero $q_0$ of a Poisson structure $\pi_2$ of rank zero at $q_0$.
   186	\end{theorem}
   187	
   188	\begin{proof}[Proof sketch]
   189	The symplectic leaf $S$ through $p$ is an immersed submanifold of dimension $2k$ and carries the induced symplectic form $\omega_S$ characterized by $\omega_S^{\flat} = (\pi|_S)^{-1}$. In coordinates adapted to the leaf the bivector takes the form $\pi = \pi_S + \pi_T$ with $\pi_S$ nondegenerate along $S$ and $\pi_T$ tangent to the transverse fibers and vanishing on the zero section. The transverse factor $\pi_T$ retains its higher-order terms at the zero $q_0$; the splitting theorem does not linearize it, and smooth linearization of transverse Poisson structures fails in general. The full argument appears in Weinstein \cite{weinstein}; the product form stated here is the part used below.
   190	\end{proof}
   191	
   192	\begin{proposition}[Leaf foliation]
   193	\label{prop:leaves}
   194	A Poisson manifold $(M, \pi)$ is foliated by its symplectic leaves: maximal immersed submanifolds $S \subset M$ on which $\pi|_S$ is nondegenerate and which are tangent to the distribution $\operatorname{im} \pi^{\sharp}$. Each leaf is a symplectic manifold, and the restriction of the Poisson bracket of functions to a leaf is the bracket of the leaf symplectic form.
   195	\end{proposition}
   196	
   197	\begin{proof}
   198	The distribution $x \mapsto \operatorname{im} \pi^{\sharp}_x$ is integrable in the sense of Stefan-Sussmann precisely because $[\pi, \pi] = 0$: the vanishing of the Schouten-Nijenhuis bracket is the integrability condition for the associated Lie algebroid, and its leaves are the symplectic leaves. On a leaf $S$ the map $\pi^{\sharp}|_S : T^{*}S \to TS$ is an isomorphism by maximality of the leaf, and its inverse is $\omega_S^{\flat}$; the bracket identity $\{f, g\}|_S = \omega_S(X_f, X_g)$ is then the definition of $\omega_S$.
   199	\end{proof}
   200	
   201	\begin{example}[Lie-Poisson bracket on $\mathfrak{g}^{*}$]
   202	\label{ex:lie-poisson}
   203	For a finite-dimensional Lie algebra $\mathfrak{g}$ the dual space $\mathfrak{g}^{*}$ carries the linear Poisson structure $\pi(\xi)(d f, d g) = \langle \xi, [d f(\xi), d g(\xi)] \rangle$ under the identification $T_{\xi}^{*} \mathfrak{g}^{*} \cong \mathfrak{g}$. Its symplectic leaves are the coadjoint orbits. For $\mathfrak{g} = \mathfrak{so}(3)$ the space $\mathfrak{g}^{*} \cong \mathbb{R}^{3}$ carries the angular momentum bracket $\{x, y\} = z$ and its cyclic permutations; the rank is two away from the origin and zero at the origin, the leaves are the spheres $\{|\xi| = r\}$ together with the origin, and \cref{thm:weinstein} at a point of a sphere recovers a two-dimensional symplectic factor with a one-dimensional transverse Poisson factor.
   204	\end{example}
   205	
   206	\begin{theorem}[Kirillov-Kostant-Souriau form]
   207	\label{thm:kks}
   208	Let $G$ be a Lie group with Lie algebra $\mathfrak{g}$ and let $\mathcal{O} \subset \mathfrak{g}^{*}$ be a coadjoint orbit. The formula
   209	\[
   210	\omega_{\xi}(\operatorname{ad}^{*}_{x} \xi, \operatorname{ad}^{*}_{y} \xi) = \langle \xi, [x, y] \rangle
   211	\]
   212	defines a $G$-invariant symplectic form $\omega_{\xi}$ on $\mathcal{O}$, and the coadjoint action of $G$ on $(\mathcal{O}, \omega_{\xi})$ is by symplectomorphisms. The Poisson structure induced on $\mathfrak{g}^{*}$ by the Lie bracket restricts on each orbit to the inverse of $\omega_{\xi}$.
   213	\end{theorem}
   214	
   215	\begin{proof}
   216	The stabilizer $\mathfrak{g}_{\xi}$ of $\xi$ under the coadjoint action is the kernel of the skew form $(x, y) \mapsto \langle \xi, [x, y] \rangle$, so the form descends to $T_{\xi} \mathcal{O} \cong \mathfrak{g} / \mathfrak{g}_{\xi}$. Nondegeneracy on the orbit follows from this identification, and the identity $T_{\xi} \mathcal{O} = \operatorname{im} \operatorname{ad}^{*}(\xi)$ makes the descended form nondegenerate. Invariance is the identity $\langle \operatorname{Ad}^{*}_{g} \xi, [\operatorname{Ad}_{g} x, \operatorname{Ad}_{g} y] \rangle = \langle \xi, [x, y] \rangle$ under the adjoint action. The relation between the orbit form and the linear Poisson structure is a direct computation in the Lie-Poisson bracket of \cref{ex:lie-poisson}; see Kirillov \cite{kirillov} for the full statement.
   217	\end{proof}
   218	
   219	\begin{proposition}[Casimir functions]
   220	\label{prop:casimirs}
   221	A smooth function $F \in C^{\infty}(M)$ on a Poisson manifold $(M, \pi)$ is constant on the symplectic leaves if and only if $\{F, f\} = 0$ for all $f \in C^{\infty}(M)$. On the Lie-Poisson space $\mathfrak{g}^{*}$ these functions are exactly the coadjoint-invariant functions $F(\xi) = F(\operatorname{Ad}^{*}_{g} \xi)$ for all $g \in G$. For $\mathfrak{g} = \mathfrak{so}(3)$ the Casimir is $F(\xi) = |\xi|^{2}$, and its level sets are the symplectic leaves of \cref{ex:lie-poisson}.
   222	\end{proposition}
   223	
   224	\begin{proof}
   225	The bracket $\{F, f\} = \pi(dF, df)$ vanishes for all $f$ if and only if $dF$ annihilates the image of $\pi^{\sharp}$, and the image of $\pi^{\sharp}$ spans the tangent spaces of the leaves. So $F$ has vanishing differential along the leaves, which on each connected leaf means $F$ is constant. On $\mathfrak{g}^{*}$ the condition $\{F, f\} = 0$ for all linear functions $f(\eta) = \langle \eta, x \rangle$ reads $\langle \xi, [\nabla F(\xi), x] \rangle = 0$ for all $x$, which is the infinitesimal form of coadjoint invariance. For $\mathfrak{so}(3)$ the invariant polynomials are generated by the quadratic form $|\xi|^{2}$, and \cref{ex:lie-poisson} identifies its level sets with the leaves.
   226	\end{proof}
   227	
   228	Casimir functions are the first integral data of Poisson dynamics: a Hamiltonian that is itself a Casimir generates no motion, and a function in involution with the Casimirs descends to a function on the leaf space.
   229	
   230	\cref{thm:kks} is the bridge from classical mechanics to the classification theory of Lie algebras. The symplectic leaves of the Lie-Poisson structure on $\mathfrak{g}^{*}$ are the coadjoint orbits, the orbits of a compact semisimple group are classified by combinatorial data of the Dynkin diagram, and Section 6 makes that classification precise.
   231	
   232	\section{Global invariants of symplectic systems}
   233	
   234	The classification content that survives Darboux's theorem is global.
   235	
   236	\begin{theorem}[Moser stability]
   237	\label{thm:moser-stability}
   238	Let $M$ be a closed manifold and $\omega_t$, $t \in [0, 1]$, a smooth family of symplectic forms with $[\omega_t] \in H^{2}(M; \mathbb{R})$ independent of $t$. Then there is an isotopy $\varphi_t$ of $M$ with $\varphi_t^{*} \omega_t = \omega_0$ for all $t$.
   239	\end{theorem}
   240	
   241	\begin{proof}
   242	Constancy of the cohomology class gives $\dot{\omega}_t = d \alpha_t$ for a smooth family of one-forms $\alpha_t$. Solve $\iota_{X_t} \omega_t = -\alpha_t$ and integrate $X_t$ to an isotopy $\varphi_t$ of the closed manifold $M$. The computation of \cref{lem:moser-ball} gives $\frac{d}{dt} \varphi_t^{*} \omega_t = 0$ without any support condition, so $\varphi_1^{*} \omega_1 = \omega_0$. The argument is due to Moser \cite{moser}.
   243	\end{proof}
   244	
   245	\begin{corollary}[Classification refines diffeomorphism and cohomology]
   246	\label{cor:classification-data}
   247	Let $f : M \to M'$ be a diffeomorphism of closed symplectic manifolds carrying $[\omega]$ to $[\omega']$. If there is a smooth path of symplectic forms $\omega_t$ in the constant class $[\omega]$ connecting $\omega$ to $f^{*} \omega'$, then $(M, \omega)$ and $(M', \omega')$ are symplectomorphic. Symplectomorphism classes therefore form a strictly finer partition than the pairs consisting of a diffeomorphism type and an orbit of $[\omega]$ under the diffeomorphism group.
   248	\end{corollary}
   249	
   250	The cohomology class $[\omega] \in H^{2}(M; \mathbb{R})$ is therefore a classifying invariant in the restricted sense of the series, together with the diffeomorphism invariants of $M$ and the action of $\operatorname{Diff}(M)$ on $H^{2}(M; \mathbb{R})$. For two-dimensional symplectic manifolds this is a complete classification.
   251	
   252	\begin{example}[Surfaces]
   253	\label{ex:surfaces}
   254	A symplectic form on a closed surface is an area form, and the total area $\int_{M} \omega$ is a symplectomorphism invariant. Two closed oriented surfaces with area forms are symplectomorphic if and only if they are diffeomorphic and the areas agree. Classification here is classification of genus and area.
   255	\end{example}
   256	
   257	\begin{example}[Area forms on the sphere]
   258	\label{ex:area-sphere}
   259	Let $\sigma$ and $\sigma'$ be two area forms on $S^{2}$ with the same total area $\int_{S^{2}} \sigma = \int_{S^{2}} \sigma'$. Then $(S^{2}, \sigma)$ and $(S^{2}, \sigma')$ are symplectomorphic. The interpolation $\sigma_t = (1 - t) \sigma + t \sigma'$ consists of area forms of the same total area, hence symplectic forms with constant cohomology class in $H^{2}(S^{2}; \mathbb{R})$, and \cref{thm:moser-stability} below produces the isotopy. The classification of area forms on a fixed surface up to symplectomorphism is therefore the classification of total areas, in agreement with \cref{ex:surfaces}, and the theorem in action is Moser stability rather than any local analysis.
   260	\end{example}
   261	
   262	\begin{example}[Products of spheres]
   263	\label{ex:product-spheres}
   264	On $M = S^{2} \times S^{2}$ with area forms $\sigma_1$ and $\sigma_2$ of total area one on each factor, consider $\omega_{a, b} = a \sigma_1 \oplus b \sigma_2$ with $a, b > 0$. The cohomology class $[\omega_{a, b}] = a [\sigma_1] + b [\sigma_2]$ is a symplectomorphism invariant, and the diffeomorphism group of $S^{2} \times S^{2}$ acts on $H^{2}(M; \mathbb{R})$ by permuting the two factors. Hence $(M, \omega_{a, b})$ is symplectomorphic to $(M, \omega_{a', b'})$ if and only if $\{a, b\} = \{a', b'\}$ as unordered pairs. The classification is the unordered pair of areas, a two-dimensional global invariant with no local content.
   265	\end{example}
   266	
   267	Beyond the cohomology class, the standard global invariants are the characteristic classes of $M$: any symplectic manifold admits an $\omega$-compatible almost complex structure $J$, and the Chern classes $c_i(M, J)$ are independent of the choice of $J$. For closed four-manifolds these classes interact with deep rigidity phenomena, and no complete classification is claimed in this paper.
   268	
   269	In dimension four, global symplectic classification refines smooth four-manifold topology and remains incomplete outside toric and product regimes. De Rham cohomology distinguishes the standard symplectic structures on $\mathbb{CP}^{2}$ with its Fubini-Study form, $T^{4}$ with a constant form, and the products of \cref{ex:product-spheres}, and \cref{thm:delzant} classifies the toric four-manifolds, including the one-point blowup of $\mathbb{CP}^{2}$, by polytopes. For general closed four-manifolds, symplectomorphism classification is finer than the diffeomorphism type together with the action of $\operatorname{Diff}(M)$ on $H^{2}(M; \mathbb{R})$, and distinguishing smooth structures that share these classical invariants uses gauge-theoretic and pseudoholomorphic invariants (Seiberg-Witten and Taubes-type invariants) that this paper does not develop.
   270	
   271	The strongest global rigidity in the symplectic category is metric-free.
   272	
   273	\begin{definition}[Symplectic capacity]
   274	\label{def:capacity}
   275	A symplectic capacity is a rule $c$ assigning to each symplectic manifold $(M^{2n}, \omega)$ a number $c(M, \omega) \in [0, +\infty]$ such that: (i) monotonicity holds, $c(M, \omega) \leq c(M', \omega')$ whenever a symplectomorphism embeds $(M, \omega)$ into $(M', \omega')$; (ii) conformality holds, $c(M, \lambda \omega) = |\lambda| c(M, \omega)$ for $\lambda \neq 0$; (iii) normalization holds, $c(B^{2n}(1)) = c(B^{2}(1) \times \mathbb{R}^{2n-2}) = \pi$ where $B^{2n}(1)$ is the open unit ball and $B^{2}(1)$ the open unit disc.
   276	\end{definition}
   277	
   278	\begin{proposition}[Gromov width]
   279	\label{prop:gromov-width}
   280	The Gromov width
   281	\[
   282	w_G(M, \omega) = \sup \{ \pi r^{2} : B^{2n}(r) \text{ embeds symplectically into } (M, \omega) \}
   283	\]
   284	is a symplectic capacity in the sense of \cref{def:capacity}.
   285	\end{proposition}
   286	
   287	\begin{proof}[Proof reference]
   288	Monotonicity is immediate from composition of embeddings, and conformality from the scaling of the standard form. The normalization and the capacity axiom for disjoint unions of balls follow from the embedding theory of Gromov \cite{gromov-hol}; the width is the first capacity constructed.
   289	\end{proof}
   290	
   291	Gromov's nonsqueezing theorem is the rigidity statement that makes capacities genuine invariants rather than convenient notation.
   292	
   293	\begin{theorem}[Gromov nonsqueezing]
   294	\label{thm:nonsqueezing}
   295	Let $B^{2n}(r)$ be the open ball of radius $r$ in $\mathbb{R}^{2n}$ and $B^{2}(R) \times \mathbb{R}^{2n-2}$ the cylinder of radius $R$. A symplectic embedding $B^{2n}(r) \hookrightarrow B^{2}(R) \times \mathbb{R}^{2n-2}$ exists only if $r \leq R$.
   296	\end{theorem}
   297	
   298	\begin{proof}[Proof reference]
   299	The proof uses $J$-holomorphic curves for a suitable compatible almost complex structure and is due to Gromov \cite{gromov-hol}. The conclusion is the source of genuine global symplectic rigidity and of the capacity invariants.
   300	\end{proof}
   301	
   302	Nonsqueezing has no Riemannian analogue: a round ball embeds into a thin cylinder in ordinary Euclidean geometry at every scale. The invariant content of symplectic geometry is therefore both global and metric-free.
   303	
   304	On open manifolds the situation reverses. By the $h$-principle for symplectic structures on open manifolds, every open manifold admits an exact symplectic form, and open symplectic manifolds are classified up to symplectomorphism by diffeomorphism type \cite{gromov-pdr}. Closed manifolds are rigid; open manifolds are flexible. Any classification theorem for classical systems must state which regime it addresses.
   305	
   306	\section{Coadjoint orbits and homogeneous symplectic manifolds}
   307	
   308	The homogeneous symplectic manifolds of classical mechanics are the coadjoint orbits of \cref{thm:kks}, and their classification inherits the combinatorics of the Killing-Cartan theory of simple Lie algebras and the highest-weight theory of their representations.
   309	
   310	\begin{definition}[Momentum map and homogeneous orbits]
   311	\label{def:momentum}
   312	Let $G$ act symplectically on $(M, \omega)$ with momentum map $J : M \to \mathfrak{g}^{*}$ characterized by $\langle dJ, x \rangle = \iota_{x_M} \omega$ for the fundamental vector fields $x_M$. The fibers and orbits of $J$ are the symmetry-level objects of the classical system, and coadjoint orbits in $\mathfrak{g}^{*}$ are the model homogeneous symplectic manifolds.
   313	\end{definition}
   314	
   315	\begin{theorem}[Coadjoint orbits of compact semisimple groups]
   316	\label{thm:coadjoint-classification}
   317	Let $G$ be compact, connected, and semisimple with complexification $G^{\mathbb{C}}$ and maximal torus $T$ with Lie algebra $\mathfrak{t}$. Every coadjoint orbit of $G$ meets $\mathfrak{t}^{*}$ in a single $W$-orbit, so the orbits are parameterized continuously by points $\xi$ of the closed positive Weyl chamber $\mathfrak{t}^{*}_{+}$. Each orbit is a flag manifold $G^{\mathbb{C}} / P_{\xi}$ where the parabolic $P_{\xi}$ is determined by the support of $\xi$, that is by the subset of Dynkin nodes on whose walls $\xi$ lies; regular $\xi$ gives full flag manifolds and singular $\xi$ gives partial flags. The symplectic form on the orbit is the Kirillov-Kostant-Souriau form of \cref{thm:kks}. The dominant integral weights form the discrete sublattice $\Lambda_{+} \subset \mathfrak{t}^{*}_{+}$ that selects the integral, that is quantizable, orbits; those are the orbits carrying finite-dimensional irreducible representations by the Borel-Weil theorem.
   318	\end{theorem}
   319	
   320	\begin{proof}[Proof reference]
   321	The Killing-Cartan classification of complex simple Lie algebras is the list of Dynkin diagrams $A_n$, $B_n$, $C_n$, $D_n$, $G_2$, $F_4$, $E_6$, $E_7$, $E_8$ \cite{humphreys}. The parameterization of coadjoint orbits by the positive Weyl chamber is the standard maximal-torus argument, and the identification of orbits with $G^{\mathbb{C}} / P_{\xi}$ is the complex-geometric form of the same statement \cite{kirillov}. The highest-weight theorem classifies the finite-dimensional irreducible representations of $\mathfrak{g}^{\mathbb{C}}$ by dominant integral weights \cite{humphreys}, and the Borel-Weil theorem realizes each such representation on the corresponding integral orbit. The paper uses these results as established background and reproduces none of the classification lists.
   322	\end{proof}
   323	
   324	\begin{example}[The spheres as coadjoint orbits]
   325	\label{ex:sphere-orbit}
   326	For $G = SU(2)$ the dual $\mathfrak{su}(2)^{*} \cong \mathbb{R}^{3}$, and the coadjoint orbits are the spheres $\{|\xi| = r\}$ of every radius $r > 0$ together with the degenerate orbit at the origin: a continuous one-parameter family, the Weyl chamber being the half-line $r \geq 0$. The Kirillov-Kostant-Souriau form of \cref{thm:kks} on the sphere of radius $r$ is $1/r$ times the round area form, of total symplectic area $4 \pi r$. The integral orbits are those with $2r$ a nonnegative integer, and the Borel-Weil theorem attaches to the orbit of radius $r = j$ the spin-$j$ representation of dimension $2j + 1$. The example separates the two classification statements: the classical orbit family is continuous in $r$, and the representation labels form the discrete sublattice $r \in \tfrac{1}{2} \mathbb{Z}_{\geq 0}$.
   327	\end{example}
   328	
   329	The classification content of \cref{thm:coadjoint-classification} is finite-dimensional and combinatorial: Dynkin diagram nodes and dominant weights. The theorem classifies homogeneous symplectic manifolds under a group with transitive action, not arbitrary symplectic manifolds. The orbit method program, which seeks to extend this dictionary to general representations of general Lie groups through their coadjoint orbits, is not established at the level of an equivalence and is not used as a dependency here.
   330	
   331	\begin{table}[t]
   332	\centering
   333	\small
   334	\begin{tabular}{L{1.8cm}L{6.2cm}L{3.4cm}}
   335	\toprule
   336	Diagram & Complex simple Lie algebra & Dimension \\
   337	\midrule
   338	$A_n$ & $\mathfrak{sl}(n+1, \mathbb{C})$ & $n(n+2)$ \\
   339	$B_n$ & $\mathfrak{so}(2n+1, \mathbb{C})$ & $n(2n+1)$ \\
   340	$C_n$ & $\mathfrak{sp}(2n, \mathbb{C})$ & $n(2n+1)$ \\
   341	$D_n$ & $\mathfrak{so}(2n, \mathbb{C})$ & $n(2n-1)$ \\
   342	$G_2$ & exceptional algebra of type $G_2$ & $14$ \\
   343	$F_4$ & exceptional algebra of type $F_4$ & $52$ \\
   344	$E_6$ & exceptional algebra of type $E_6$ & $78$ \\
   345	$E_7$ & exceptional algebra of type $E_7$ & $133$ \\
   346	$E_8$ & exceptional algebra of type $E_8$ & $248$ \\
   347	\bottomrule
   348	\end{tabular}
   349	\caption{The Killing-Cartan list of complex simple Lie algebras. The classification of homogeneous symplectic manifolds of \cref{thm:coadjoint-classification} inherits this list and adds, per diagram, the positive Weyl chamber of continuous orbit parameters and the dominant integral weights selecting the integral orbits.}
   350	\label{tab:dynkin}
   351	\end{table}
   352	
   353	\cref{tab:dynkin} is the classification content that flows into classical mechanics: for each simple algebra the coadjoint orbits form a family parameterized by the positive Weyl chamber of \cref{thm:coadjoint-classification}, the dominant integral weights select the integral sublattice of that chamber, and the symplectic geometry of each orbit is fixed by \cref{thm:kks}. The exceptional diagrams show that the classification is not a uniform infinite family alone, and the dimensions record that the homogeneous symplectic manifolds attached to exceptional algebras are concrete finite-dimensional objects.
   354	
   355	\section{Hamiltonian dynamics and integrable systems}
   356	
   357	The dynamical layer of a classical system is the family of Hamiltonian flows. The classification of dynamics is far from complete, but the integrable case admits normal forms with explicit invariants and explicit obstructions to global classification.
   358	
   359	\begin{definition}[Integrable system]
   360	\label{def:integrable}
   361	A Liouville integrable system is a symplectic manifold $(M^{2n}, \omega)$ with $n$ functions $H_1, \dots, H_n \in C^{\infty}(M)$ in involution, $\{H_i, H_j\} = 0$, and with $dH_1 \wedge \dots \wedge dH_n$ nonzero on a dense open subset of $M$.
   362	\end{definition}
   363	
   364	\begin{theorem}[Liouville-Arnold]
   365	\label{thm:liouville-arnold}
   366	Let $(M^{2n}, \omega, H_1, \dots, H_n)$ be a Liouville integrable system and let $M_c = \{ H_1 = c_1, \dots, H_n = c_n \}$ be a compact connected regular level set. Then $M_c$ is diffeomorphic to an $n$-torus $T^{n}$, and a neighborhood of $M_c$ in $M$ carries action-angle coordinates $(I, \theta)$ in which $\omega = \sum_{i} dI_i \wedge d\theta_i$ and the $H_i$ depend on the actions $I_i$ alone.
   367	\end{theorem}
   368	
   369	\begin{proof}[Proof reference]
   370	The Hamiltonian flows of the $H_i$ commute and preserve $M_c$, giving a locally free $T^{n}$-action whose orbits fill $M_c$; compactness and connectedness make the action transitive. The action variables are the periods of $\omega$ over a basis of $H_1(M_c; \mathbb{Z})$, and the angle variables are coordinates on the fibers. The full proof appears in Arnold \cite{arnold}.
   371	\end{proof}
   372	
   373	\begin{proposition}[Action variables are periods]
   374	\label{prop:periods}
   375	In the action-angle coordinates of \cref{thm:liouville-arnold}, the action variables are the periods of the action one-form $\lambda$ with $d\lambda = \omega$ over a basis $\gamma_1, \dots, \gamma_n$ of $H_1(M_c; \mathbb{Z})$:
   376	\[
   377	I_j = \frac{1}{2\pi} \oint_{\gamma_j} \lambda.
   378	\]
   379	The value depends on the choice of primitive $\lambda$: two primitives differ by a closed one-form, and the resulting shift of the actions is the period vector of that form, a vector of $H^{1}(M_c; \mathbb{R}) \cong \mathbb{R}^{n}$. Once $\lambda$ is fixed, the angle variables are fiberwise coordinates normalized so that $\omega = \sum_j dI_j \wedge d\theta_j$.
   380	\end{proposition}
   381	
   382	\begin{proof}
   383	On a neighborhood of $M_c$ the form $\omega$ is exact, $\omega = d\lambda$, and the $n$ commuting flows of the $H_i$ generate a torus action. The periods of $\lambda$ over the cycles $\gamma_j$ are constant on the base of the fibration because the cycles are covariantly constant under the flows, and the identity $I_j = \frac{1}{2\pi} \oint_{\gamma_j} \lambda$ is the normalization that yields $\omega = \sum_j dI_j \wedge d\theta_j$. Replacing $\lambda$ by $\lambda + \eta$ with $\eta$ closed shifts each $I_j$ by $\frac{1}{2\pi} \oint_{\gamma_j} \eta$, and those shifts range over all of $\mathbb{R}^{n}$.
   384	\end{proof}
   385	
   386	Action-angle variables give a local decomposition of an integrable system into $n$ one-degree-of-freedom systems. Global action-angle coordinates need not exist: the period lattice of the torus fibration can have monodromy.
   387	
   388	\begin{proposition}[Monodromy obstruction]
   389	\label{prop:monodromy}
   390	There exist integrable Hamiltonian systems whose regular compact fibers are tori and which admit no global action-angle coordinates; the obstruction is the monodromy representation of $\pi_1$ of the base of the fibration acting on the period lattice $H_1(T^{n}; \mathbb{Z})$.
   391	\end{proposition}
   392	
   393	\begin{proof}[Proof reference]
   394	Duistermaat \cite{duistermaat} computes the monodromy of the period bundle for integrable systems with focus-focus singularities, and the spherical pendulum is the standard example: parallel transport of a fiber around a critical value returns the fiber with its lattice mapped by a nontrivial unipotent matrix. Global action-angle coordinates would trivialize the period bundle, so nontrivial monodromy obstructs them.
   395	\end{proof}
   396	
   397	\begin{example}[Spherical pendulum]
   398	\label{ex:pendulum}
   399	The spherical pendulum on $T^{*} S^{2}$ with Hamiltonian $H = \tfrac{1}{2} (p_{\theta}^{2} + p_{\varphi}^{2} / \sin^{2}\theta) - \cos \theta$ is integrable with the vertical angular momentum $p_{\varphi}$ as second integral. Regular compact fibers are two-tori, and the system has one focus-focus critical point. Parallel transport of the period lattice around the critical value acts on $H_1(T^{2}; \mathbb{Z})$ by the unipotent matrix $\begin{pmatrix} 1 & 1 \\ 0 & 1 \end{pmatrix}$. The local decomposition of \cref{thm:liouville-arnold} holds near every regular fiber, and no global decomposition into action-angle pairs exists on the complement of the critical value.
   400	\end{example}
   401	
   402	\begin{example}[Euler top]
   403	\label{ex:euler-top}
   404	The free rigid body is the Hamiltonian system on the coadjoint orbit $\mathcal{O} \subset \mathfrak{so}(3)^{*}$ of \cref{ex:lie-poisson} with Hamiltonian $H(\xi) = \tfrac{1}{2} (\xi_1^{2} / I_1 + \xi_2^{2} / I_2 + \xi_3^{2} / I_3)$ for positive moments of inertia $I_i$. The Casimir $|\xi|^{2}$ is a second integral in involution with $H$, so the system is integrable on each sphere $|\xi|^{2} = r^{2}$. The regular compact fibers are the intersections of the energy ellipsoids with the momentum spheres, the trajectories are the Euler-Poinsot curves on those spheres, and \cref{thm:liouville-arnold} applies at every regular fiber. The example lives simultaneously in the homogeneous symplectic geometry of Section 6 and in the integrable dynamics of this section: its state space is a coadjoint orbit, its invariant is the Casimir, and its local normal form is action-angle.
   405	\end{example}
   406	
   407	Monodromy is the first genuine obstruction in this paper to decomposition: the local decomposition of \cref{thm:liouville-arnold} into one-degree-of-freedom factors is a statement about a neighborhood of one fiber, and \cref{prop:monodromy} exhibits integrable systems that do not decompose globally. Stability of integrable dynamics is likewise regime-restricted.
   408	
   409	\begin{theorem}[Nekhoroshev estimate]
   410	\label{thm:nekhoroshev}
   411	Let $H = H_0 + \varepsilon H_1$ be a steep integrable Hamiltonian system with $n$ degrees of freedom and let $H_0(I)$ be the integrable part in action variables. There are positive constants $c$, $a$, and $b$ depending on the system such that, for $\varepsilon$ small, every trajectory satisfies
   412	\[
   413	\| I(t) - I(0) \| \leq c \varepsilon^{b}
   414	\qquad \text{for all } 0 \leq t \leq \exp(c \varepsilon^{-a}).
   415	\]
   416	The bound is on the drift of the action variables, not on the energy, which is conserved exactly.
   417	\end{theorem}
   418	
   419	\begin{proof}[Proof reference]
   420	The estimate is due to Nekhoroshev \cite{nekhoroshev}. Steepness is the geometric condition on $H_0$ under which the normal form of the flow is integrable to high order, and it prevents Arnold diffusion across the resonance planes of action space. The exponential time scale follows from that normal form. The theorem is a statement about the action drift of perturbed integrable systems over exponentially long times.
   421	\end{proof}
   422	
   423	\section{Classical statistical systems and information geometry}
   424	
   425	The classical probability family has one uniqueness theorem in the whole inventory of classical classification results. Chentsov's theorem singles out the Fisher metric as the unique metric monotone under stochastic maps, and the quantum analogue of that metric is parametric rather than unique.
   426	
   427	\begin{definition}[Fisher metric]
   428	\label{def:fisher}
   429	On the open simplex $\Delta^{\circ} \subset \mathbb{R}^{n}$ the Fisher metric is the Riemannian metric whose value at $p$ on tangent vectors $u, v$ (with $\sum_i u_i = \sum_i v_i = 0$) is
   430	\[
   431	g_{p}(u, v) = \sum_{i=1}^{n} \frac{u_i v_i}{p_i}.
   432	\]
   433	On a smooth statistical model $\theta \mapsto p_{\theta}$ the Fisher metric is the pullback of this metric, with components $g_{jk}(\theta) = \sum_i \frac{1}{p_i} \partial_j p_i \, \partial_k p_i$.
   434	\end{definition}
   435	
   436	\begin{example}[Fisher metric on three outcomes]
   437	\label{ex:fisher-three}
   438	For $p = (\tfrac{1}{2}, \tfrac{1}{3}, \tfrac{1}{6})$ and the tangent vector $u = (1, -1, 0)$ the Fisher metric evaluates to $g_p(u, u) = \frac{1}{1/2} + \frac{1}{1/3} = 5$. At the uniform point $p = (\tfrac{1}{3}, \tfrac{1}{3}, \tfrac{1}{3})$ the same vector gives $g_p(u, u) = 6$. The metric therefore weights directions by the rarity of the outcomes they move, and the example is the two-dimensional case of \cref{def:fisher}.
   439	\end{example}
   440	
   441	\begin{definition}[Monotone metric]
   442	\label{def:monotone}
   443	A Riemannian metric $g$ on $\Delta^{\circ}$ is monotone under stochastic maps if for every column-stochastic matrix $T$ and every $p$, the pullback $T^{*} g_{Tp}$ at $p$ satisfies $T^{*} g_{Tp} \leq g_{p}$ as quadratic forms. Monotonicity is the requirement that coarse-graining cannot increase distinguishability.
   444	\end{definition}
   445	
   446	\begin{theorem}[Chentsov]
   447	\label{thm:chentsov}
   448	Let $g$ be a family of Riemannian metrics $g^{(n)}$ on the open simplices $\Delta^{\circ} \subset \mathbb{R}^{n}$ for all $n \geq 1$, compatible with Markov embeddings (pullback along every sufficient statistic is an isometry) and monotone under stochastic maps in the sense of \cref{def:monotone}. Then one constant $c > 0$ satisfies $g^{(n)} = c \, g_{\mathrm{Fisher}}^{(n)}$ for every $n$, where $g_{\mathrm{Fisher}}^{(n)}$ is the Fisher metric of \cref{def:fisher}. The cross-dimension compatibility is a hypothesis: monotonicity on a single fixed simplex does not determine the metric up to scale.
   449	\end{theorem}
   450	
   451	\begin{proof}[Proof structure]
   452	Monotonicity forces equality along sufficient statistics, since a sufficient statistic admits a stochastic retraction and monotonicity in both directions along the retraction. Invariance under the sufficient statistics of the simplex reduces the metric to a family $g_p(u, v) = \sum_i \frac{u_i v_i}{p_i} f(p)$ compatible with all embeddings of lower-dimensional simplices, and the compatibility across dimensions forces $f$ to be constant. The complete proof is in Chentsov \cite{chentsov}; the structure stated here is the part that fixes the metric up to scale.
   453	\end{proof}
   454	
   455	\begin{lemma}[Equality along sufficient statistics]
   456	\label{lem:sufficiency}
   457	Let $g$ be a monotone metric on $\Delta^{\circ}$ and let $T$ be a stochastic map with a stochastic left inverse $S$, that is $S T = \mathrm{Id}$. Then $T$ is an isometric embedding for $g$, and for every tangent vector $u$ at $p$,
   458	\[
   459	g_{p}(u, u) = g_{Tp}(Tu, Tu).
   460	\]
   461	\end{lemma}
   462	
   463	\begin{proof}
   464	Monotonicity of $g$ for $T$ gives $g_{p}(u, u) \geq g_{Tp}(Tu, Tu)$, and monotonicity for $S$ gives
   465	\[
   466	g_{Tp}(Tu, Tu) \geq g_{p}(S T u, S T u) = g_{p}(u, u).
   467	\]
   468	The two inequalities sandwich, so equality holds and $T$ preserves $g$ exactly. This is the equality case that \cref{thm:chentsov} uses to reduce the classification to the invariant metrics under the sufficient statistics of the simplex.
   469	\end{proof}
   470	
   471	\begin{example}[Isometries of the Fisher metric]
   472	\label{ex:reparameterization}
   473	Under the square-root map $x_i = \sqrt{p_i}$ the open simplex $\Delta^{\circ}$ maps to the open positive orthant of the unit sphere, and the Fisher metric becomes four times the round metric of that sphere: $dx_i = u_i / (2 \sqrt{p_i})$ gives $\sum_i dx_i^{2} = \tfrac{1}{4} g_{p}(u, u)$. The isometries of the round sphere preserving the positive orthant are the coordinate permutations, so the isometries of the Fisher metric are exactly the relabelings of the outcome set. Stochastic maps that are not invertible on the model are contractions rather than isometries (\cref{def:monotone}), and \cref{lem:sufficiency} identifies the case of equality. The example shows concretely how the preserved layers of \cref{def:canonical} separate exact equivalence from coarse-graining.
   474	\end{example}
   475	
   476	\begin{corollary}[Fisher metric as classifying invariant]
   477	\label{cor:fisher-invariant}
   478	The Fisher metric, up to positive scale, is a classifying invariant of the classical statistical family under stochastic morphisms: it is the unique metric compatible with the coarse-graining order.
   479	\end{corollary}
   480	
   481	\begin{remark}[Connections beside the metric]
   482	\label{rem:connections}
   483	The Fisher metric is the unique monotone Riemannian object, but the statistical manifold carries more structure than its metric. The $\alpha$-connections of Amari \cite{amari} are a one-parameter family of affine connections dual to each other, $\alpha$ and $-\alpha$, with $\alpha = 0$ the Levi-Civita connection of the Fisher metric, and the exponential and mixture families are the $\alpha = 1$ and $\alpha = -1$ flat coordinates. The uniqueness theorem of Chentsov governs the metric alone; the connection family is parametric, and no statement of this paper transfers metric uniqueness to the connections.
   484	\end{remark}
   485	
   486	\begin{proposition}[Product of statistical models]
   487	\label{prop:stat-product}
   488	Let $p \in \Delta^{\circ} \subset \mathbb{R}^{n}$ and $q \in \Delta^{\circ} \subset \mathbb{R}^{m}$ be probability vectors and let $p \otimes q \in \Delta^{\circ} \subset \mathbb{R}^{nm}$ be their product. Then the Fisher metric of the product is the direct sum of the factors:
   489	\[
   490	g_{p \otimes q}(u \otimes q + p \otimes v, u \otimes q + p \otimes v) = g_{p}(u, u) + g_{q}(v, v)
   491	\]
   492	for tangent vectors $u$ at $p$ and $v$ at $q$.
   493	\end{proposition}
   494	
   495	\begin{proof}
   496	Write the tangent vector at $p \otimes q$ in the product chart. The probability of the pair $(i, j)$ is $p_i q_j$, and the displacement in that coordinate is $u_i q_j + p_i v_j$. The Fisher sum becomes
   497	\[
   498	\sum_{i, j} \frac{(u_i q_j + p_i v_j)^{2}}{p_i q_j}
   499	= \sum_{i, j} \frac{u_i^{2} q_j}{p_i} + 2 \sum_{i, j} u_i v_j + \sum_{i, j} \frac{p_i v_j^{2}}{q_j}
   500	= g_{p}(u, u) + 0 + g_{q}(v, v),
   501	\]
   502	where the cross term vanishes because $\sum_i u_i = \sum_j v_j = 0$.
   503	\end{proof}
   504	
   505	\cref{prop:stat-product} is the compositional content of the statistical family: products of systems are products of metrics, and the classifying invariant of a product is the direct sum of the classifying invariants of the factors. The parallel statement for symplectic products is \cref{def:product-composition} and the decomposition analysis of Section 9.
   506	
   507	The uniqueness statement is classical in both senses of the word. The quantum analogue fails.
   508	
   509	\begin{theorem}[Petz-Sudar parametric classification]
   510	\label{thm:petz-sudar}
   511	Monotone metrics on the space of positive definite density matrices, defined by monotonicity under completely positive trace-preserving maps, are classified by operator monotone functions $f : (0, \infty) \to (0, \infty)$ with $f(1) = 1$ and the symmetry $f(t) = t f(1/t)$ that makes the bilinear form symmetric. The family of such metrics is parametric and infinite, and no constant multiple of a single metric exhausts it.
   512	\end{theorem}
   513	
   514	\begin{proof}[Proof reference]
   515	Petz and Sudar \cite{petz-sudar} classify quantum monotone metrics by operator monotone functions. The metric attached to such a function $f$ is $g_{f, \rho}(A, B) = \operatorname{tr} \big( A \, \mathbf{J}_{\rho, f}^{-1}(B) \big)$ where $\mathbf{J}_{\rho, f} = \mathcal{R}_{\rho} f(\mathcal{L}_{\rho} \mathcal{R}_{\rho}^{-1})$ and $\mathcal{L}_{\rho}$ and $\mathcal{R}_{\rho}$ are left and right multiplication by the state $\rho$; the inverse operator carries the $\rho^{-1}$ scaling that reproduces the classical Fisher metric in the commutative case. The paper uses this classification as the contrast that blocks any transfer of Chentsov uniqueness to the quantum case.
   516	\end{proof}
   517	
   518	\cref{thm:petz-sudar} is a warning about scope. Classical uniqueness in the classification of monotone metrics may not be extended to the quantum family by dependency or analogy: the quantum classification is parametric, not unique. Section 11 returns to the boundary between the two.
   519	
   520	\section{Decomposition and restricted classification}
   521	
   522	Complex classical systems are built from simpler ones by products, reductions, and coupling. Irreducibility is relative to the product composition fixed below, and two restricted classification theorems survive for global symplectic objects.
   523	
   524	\begin{definition}[Product composition]
   525	\label{def:product-composition}
   526	The product composition of classical systems is defined componentwise. For symplectic systems, $(M_1 \times M_2, \omega_1 \oplus \omega_2)$ with $\omega_1 \oplus \omega_2 = \operatorname{pr}_1^{*} \omega_1 + \operatorname{pr}_2^{*} \omega_2$ and Hamiltonians $H_1 + H_2$. For Poisson systems, the direct sum of bivectors. For statistical systems, the product of simplices with product measures and product stochastic maps. The composition data $C$ of \cref{def:irreducible} is this product.
   527	\end{definition}
   528	
   529	\begin{proposition}[Irreducibility of symplectic surfaces]
   530	\label{prop:surface-irreducible}
   531	Every closed symplectic surface of genus $g \geq 0$ is $C$-irreducible for the product composition.
   532	\end{proposition}
   533	
   534	\begin{proof}
   535	A product decomposition $(M_1 \times M_2, \omega_1 \oplus \omega_2)$ of a $2$-dimensional symplectic manifold has $\dim M_1 + \dim M_2 = 2$ with both factors even-dimensional and symplectic, hence of dimension $0$ or $2$. Positive dimension forces one factor to be the empty product.
   536	\end{proof}
   537	
   538	\begin{proposition}[Symplectic reduction]
   539	\label{prop:reduction}
   540	Let a compact Lie group $G$ act on a symplectic system $(M, \omega)$ by symplectomorphisms with momentum map $J$. For a regular value $\mu$ of $J$ at which the isotropy group $G_{\mu}$ acts freely and properly on $J^{-1}(\mu)$, the reduced space $J^{-1}(\mu) / G_{\mu}$ carries a unique symplectic form $\omega_{\mu}$ such that the pullback along $J^{-1}(\mu) \to J^{-1}(\mu)/G_{\mu}$ agrees with $\omega|_{J^{-1}(\mu)}$, and the reduced dynamics of an invariant Hamiltonian is Hamiltonian for $\omega_{\mu}$. The reduction is a decomposition construction on classical systems, and its output is again a classical system of \cref{def:classical-system}.
   541	\end{proposition}
   542	
   543	\begin{proof}[Proof reference]
   544	The construction and its compatibility with dynamics are the symplectic reduction theorem of Marsden and Weinstein \cite{marsden-weinstein}. Regularity of $\mu$ gives the manifold structure of $J^{-1}(\mu)$ and of the quotient by the isotropy group $G_{\mu}$, and the uniqueness of $\omega_{\mu}$ is the statement that $\ker (\omega|_{J^{-1}(\mu)})$ is spanned by the infinitesimal action directions.
   545	\end{proof}
   546	
   547	Reduction is the mechanism by which symmetry data enters the composition layer of a classical system: it removes gauge directions and lowers dimension while preserving the symplectic structure. Existence of decompositions is therefore abundant in the presence of symmetry. Decompositions are generally non-unique.
   548	
   549	\begin{example}[Reduction of the plane]
   550	\label{ex:reduction-sphere}
   551	Let $U(1)$ act on $\mathbb{C}^{2} \cong \mathbb{R}^{4}$ with its standard symplectic form by $e^{i\theta} \cdot z = e^{i\theta} z$, with momentum map $J(z) = \tfrac{1}{2} (|z_1|^{2} + |z_2|^{2})$. For $\mu > 0$ the level set $J^{-1}(\mu)$ is the three-sphere of radius $\sqrt{2\mu}$ in $\mathbb{C}^{2}$, and the reduced space $J^{-1}(\mu) / U(1)$ is $\mathbb{CP}^{1}$ with the Fubini-Study symplectic form normalized to total area $2\pi \mu$; the quotient identifies the Hopf fibers of the level set. The reduced dynamics of any rotation-invariant Hamiltonian is Hamiltonian on that sphere. The example is the elementary case of \cref{prop:reduction}: a four-dimensional symplectic system with a one-dimensional symmetry reduces to a two-dimensional one, and the reduction is a decomposition step in the sense of \cref{def:product-composition}.
   552	\end{example}
   553	
   554	\begin{proposition}[Reduction of products]
   555	\label{prop:reduction-products}
   556	Let $G$ act on a symplectic system $(M_1, \omega_1)$ with momentum map $J_1$, let $(M_2, \omega_2)$ carry the trivial $G$-action, and let $\mu$ be a regular value of $J_1$. Then the reduced space of the product $(M_1 \times M_2, \omega_1 \oplus \omega_2)$ at $\mu$ is the product of the reduced space of $M_1$ at $\mu$ with $M_2$:
   557	\[
   558	\big( J_1^{-1}(\mu) / G_{\mu} \big) \times M_2,
   559	\]
   560	with reduced form $\omega_{\mu} \oplus \omega_2$. Reduction commutes with product composition along the factor that carries no symmetry.
   561	\end{proposition}
   562	
   563	\begin{proof}
   564	The momentum map of the product action is $J = J_1 \circ \operatorname{pr}_1$, so $J^{-1}(\mu) = J_1^{-1}(\mu) \times M_2$ and the isotropy group $G_{\mu}$ acts only on the first factor. The quotient is therefore the product of the quotient with $M_2$, and the reduced form is the direct sum because the symplectic form of the product splits along the same factors. Uniqueness of the reduced form from \cref{prop:reduction} finishes the argument.
   565	\end{proof}
   566	
   567	\cref{prop:reduction-products} states the compatibility between the two constructions of this section, product composition and symmetry reduction. What it does not state is any uniqueness for decomposition: the factors of a product can themselves be reducible, and the reduced factor $J_1^{-1}(\mu) / G_{\mu}$ need not be irreducible even when $M_1$ is.
   568	
   569	\begin{remark}[Uniqueness of decomposition]
   570	\label{rem:uniqueness}
   571	No general uniqueness theorem for decomposition of classical systems is claimed. The local decomposition of integrable systems in \cref{thm:liouville-arnold} is unique in the sense of action-angle data near a regular fiber, and \cref{prop:monodromy} shows that even this restricted uniqueness fails to globalize. Existence and uniqueness of decomposition are realistic goals only in restricted subclasses, and the paper states its restricted theorems with that limitation visible.
   572	\end{remark}
   573	
   574	The first restricted global classification theorem in the symplectic category concerns toric manifolds.
   575	
   576	\begin{definition}[Toric symplectic manifold]
   577	\label{def:toric}
   578	A compact connected toric symplectic manifold is a symplectic manifold $(M^{2n}, \omega)$ of dimension $2n$ with an effective Hamiltonian action of the torus $T^{n}$ whose momentum map $J : M \to \mathbb{R}^{n}$ is proper.
   579	\end{definition}
   580	
   581	\begin{theorem}[Delzant]
   582	\label{thm:delzant}
   583	The momentum image $\Delta = J(M) \subset \mathbb{R}^{n}$ of a compact connected toric symplectic manifold is a convex rational Delzant polytope: convex, rational, simple, and Delzant (the normal vectors of the facets meeting at each vertex form a $\mathbb{Z}$-basis of $\mathbb{Z}^{n}$). Two compact connected toric symplectic manifolds are equivariantly symplectomorphic up to an automorphism of the acting torus $T^{n}$ if and only if their Delzant polytopes are related by an element of $GL(n; \mathbb{Z}) \ltimes \mathbb{R}^{n}$. When the torus action is fixed pointwise the equivalence narrows to translations of the polytope in $\mathbb{R}^{n}$ alone. Conversely, every Delzant polytope arises from such a manifold.
   584	\end{theorem}
   585	
   586	\begin{proof}[Proof reference]
   587	Delzant \cite{delzant}. The polytope is the complete invariant: equivariant symplectic classification of toric manifolds is classification of Delzant polytopes. It is the model of a restricted classification theorem with a finite-dimensional combinatorial invariant, the exact analogue on the global symplectic side of the Dynkin list of \cref{thm:coadjoint-classification}.
   588	\end{proof}
   589	
   590	\begin{example}[Toric surfaces]
   591	\label{ex:toric-surfaces}
   592	In dimension two the Delzant polygons are the polygons with rational edge slopes meeting in lattice bases. The moment polygon of $(S^{2}, r \omega_{\text{area}})$ is an interval of length $r$, and the moment polygon of the one-point blowup of $(\mathbb{CP}^{2}, \omega)$ is a triangle with one corner cut. Two toric surfaces are equivariantly symplectomorphic if and only if their polygons coincide up to lattice equivalence, so the classification is a combinatorial list of polygons.
   593	\end{example}
   594	
   595	\begin{table}[t]
   596	\centering
   597	\small
   598	\begin{tabular}{L{4.2cm}L{4.6cm}L{4.6cm}}
   599	\toprule
   600	Class of classical systems & Classifying invariant & Scope of the classification \\
   601	\midrule
   602	Local symplectic manifolds & none (Darboux) & complete at every dimension and trivial \\
   603	Local Poisson manifolds & rank $2k$ and transverse factor & local normal form at every point \\
   604	Coadjoint orbits of compact semisimple $G$ & positive Weyl chamber parameter and flag type & homogeneous symplectic manifolds, integral orbits by weights \\
   605	Toric symplectic manifolds & Delzant polytope & compact connected manifolds with $T^{n}$-action \\
   606	Closed symplectic surfaces & genus and total area & dimension two, complete \\
   607	Classical statistical models & Fisher metric up to scale & monotone metrics under stochastic maps \\
   608	Integrable systems near a regular fiber & action angles and period lattice & local, obstructed globally by monodromy \\
   609	\bottomrule
   610	\end{tabular}
   611	\caption{The classification inventory of classical systems. Each row is a complete theorem inside its stated scope, and no row claims more than that scope.}
   612	\label{tab:inventory}
   613	\end{table}
   614	
   615	\cref{tab:inventory} is the classification inventory the evidence supports. The rows are disjoint regimes, the invariants are finite or parametric data in every case, and the empty row is the global classification of closed symplectic manifolds beyond surfaces and the toric subclass.
   616	
   617	\section{Computational investigation}
   618	
   619	Three computational experiments and the executable taxonomy models accompanying the paper illustrate the normal forms of Sections 3 to 8 and supply checked examples of the invariant computations. Computational evidence is not proof, and the theorems stand on their proofs and citations rather than on these runs.
   620	
   621	The Darboux chart experiment takes a perturbed two-form $\omega = \omega_0 + d\alpha$ on a ball in $\mathbb{R}^{4}$ and integrates the Moser homotopy of \cref{lem:moser-ball}, producing a diffeomorphism that pulls $\omega$ back to $\omega_0$. The residual $\|\varphi^{*} \omega - \omega_0\|$ is computed and reported. On the tested instance (quadratic perturbation with scale $0.05$, twelve sample points, four hundred Runge-Kutta steps, complex-step Jacobians at step $10^{-20}$) the maximum entrywise residual $\|J^{T} \omega(\varphi(x_0)) J - \omega_0(x_0)\|_{\max}$ is $2.4 \times 10^{-15}$, at double precision floor. The experiment evidences the constructive content of the proof of \cref{thm:darboux}: the homotopy exists as an ordinary differential equation and its numerical integration is stable on the tested examples.
   622	
   623	The rank stratification experiment applies the Weinstein splitting of \cref{thm:weinstein} to the Lie-Poisson structure of $\mathfrak{so}(3)^{*}$. The program computes the rank of the Poisson tensor at sample points, extracts the symplectic leaf dimension at each point, and verifies the rank stratification of \cref{ex:lie-poisson}: rank two on the spheres of radii $0.5$, $1.0$, and $2.7$ with a two-dimensional symplectic factor and a one-dimensional transverse factor, and rank zero at the origin with a three-dimensional transverse factor. The experiment evidences the rank stratification claim in one explicit model.
   624	
   625	The Fisher monotonicity experiment checks the monotonicity of the Fisher metric under stochastic maps, the hypothesis of \cref{thm:chentsov}. The program computes $g_p$ and the pullback $T^{*} g_{Tp}$ for random column-stochastic matrices $T$ and verifies $T^{*} g_{Tp} \leq g_{p}$ by comparing the quadratic forms. On two hundred sampled trials with five outcomes, the minimum eigenvalue of $g_p - T^{*} g_{Tp}$ is $-5.6 \times 10^{-15}$, the round-off signature of a positive semidefinite difference, and the minimum slack $g_p(u, u) - g_{Tp}(Tu, Tu)$ over ten thousand random tangent vectors is $5.4 \times 10^{-2}$. The tangent vectors were drawn as Gaussian vectors projected to the tangent space ($\sum_i u_i = 0$) without normalization, so the strictly positive slack reflects that the samples miss the near-null directions of the difference matrix. The experiment evidences the monotonicity direction of Chentsov's theorem on finite samples. It does not evidence the uniqueness direction, and no claim of uniqueness rests on the computation.
   626	
   627	The Haskell models in \texttt{src/vol-05-classical-systems/} declare instances of the shared taxonomy classes for symplectic systems, Poisson systems, Hamiltonian systems, and classical statistical systems, with names mirroring the definitions above and the companion verification targets. They compute witness data for the normal forms: standard symplectic matrices, rank splits of Poisson tensors, the Kirillov-Kostant-Souriau form on a two-dimensional orbit, and the Fisher metric on probability vectors. The models are executable, not machine-checked proofs. Appendix \ref{app:code} maps each computational claim to its file and function.
   628	
   629	The core of the first experiment is short enough to reproduce. The perturbation scale is $\texttt{EPS} = 0.05$, \texttt{alpha} is the one-form with quadratic coefficients whose exterior derivative perturbs $\omega_0$, and \texttt{flow\_time1} integrates the Moser field with fourth-order Runge-Kutta from $t = 0$ to $t = 1$. The Moser field is the pointwise solution of a linear system: with $\iota_{X_t} \omega_t = -\alpha_t$ and the matrix convention $M_{ij} = \omega_t(e_i, e_j)$, the contraction reads $M X = \alpha_t$, so the routine solves $M X = a$ with $a = \texttt{EPS} \cdot \alpha(x)$.
   630	
   631	\begin{lstlisting}[caption={Core of the Darboux chart experiment (darboux\_chart.py).},label=lst:darboux]
   632	def moser_field(x, t):
   633	    # solve omega_t(x) X = alpha(x), the matrix form of
   634	    # iota_X omega_t = -alpha with M skew-symmetric
   635	    M = omega_t(x, t)
   636	    a = EPS * alpha(x)
   637	    return np.linalg.solve(M, a)
   638	
   639	def test_chart_pullback(n_samples=12, h=1e-20):
   640	    worst = 0.0
   641	    for _ in range(n_samples):
   642	        x0 = rng.normal(scale=0.3, size=DIM)
   643	        x1 = flow_time1(x0)
   644	        J = np.zeros((DIM, DIM))
   645	        for k in range(DIM):
   646	            e = np.zeros(DIM, dtype=complex)
   647	            e[k] = 1j * h
   648	            J[:, k] = np.imag(flow_time1(x0.astype(complex) + e)) / h
   649	        resid = J.T @ omega(x1) @ J - omega_0(x0)
   650	        worst = max(worst, np.max(np.abs(resid)))
   651	    return worst
   652	\end{lstlisting}
   653	
   654	\cref{lst:darboux} is the complete pullback test: the flow is integrated with fourth-order Runge-Kutta, the Jacobian of the time-one map is taken by complex-step differentiation so that the residual is not dominated by difference truncation, and the pullback form is compared to $\omega_0$ at the base point $x_0$. The step $h = 10^{-20}$ is representable in IEEE double precision, whose smallest normal number is near $10^{-308}$, so the complex-step quotient does not underflow on the tested platform. The other two experiments follow the same pattern, a direct invariant computation checked against the predicted inequality or rank.
   655	
   656	\section{Limitations and open questions}
   657	
   658	The classification results above hold exactly in the regimes of the established mathematics they rest on.
   659	
   660	Global classification of closed symplectic manifolds is open. The invariants of Section 5 classify in restricted regimes: surfaces by area and genus, toric manifolds by Delzant polytopes, homogeneous manifolds by weight data. Beyond these regimes the diffeomorphism classification of the underlying manifold is itself incomplete in dimension four and above, and the symplectic classification contains it. No claim of the paper addresses that gap.
   661	
   662	The classification of Poisson structures beyond local models is open. The Weinstein splitting theorem classifies the local type at each point, and the leaf foliation organizes the global object, but the topology of leaf spaces, the structure of singular leaves, and the classification of Poisson manifolds with prescribed leaf space are not addressed by the local theory. This paper makes no claim about them.
   663	
   664	Decomposition uniqueness is open in general. \cref{prop:monodromy} exhibits the obstruction inside one of the best behaved subclasses: action-angle monodromy prevents global decomposition of integrable systems whose local decomposition is complete. Characterizing the subclasses with unique decomposition is a genuine gap in the classical theory.
   665	
   666	The bridge between classical and quantum families is conjectural. Deformation quantization associates to a Poisson manifold a family of noncommutative algebras, and it is one of the candidate constructions connecting the symplectic family to the operator-algebra family. No equivalence theorem connects the two families, and the paper treats the connection as a programmatic conjecture: every statement crossing the classical and quantum boundary is conditional on that conjecture and is marked as such. The Petz-Sudar classification of \cref{thm:petz-sudar} shows concretely that uniqueness phenomena do not transfer: the classical uniqueness of the Fisher metric has a parametric quantum shadow.
   667	
   668	The equivalence relation of the series is not fixed here. This paper classifies under mathematical equivalence of \cref{def:morphisms}, which preserves the symplectic form, the Poisson bracket, or the statistical structure exactly. Physical equivalence for classical systems must be coarser, and identifying two classical systems as physically equivalent requires naming the preserved layers and the observational content. The paper does neither, and the classification statements above are statements about mathematical objects.
   669	
   670	The computational experiments of Section 10 demonstrate that the normal forms are computable on examples; no claim of the paper depends on them.
   671	
   672	The open questions the classical sector poses to the series are the following.
   673	
   674	\begin{enumerate}
   675	\item Which global invariants beyond $[\omega]$, the characteristic classes, and the capacities complete the classification of closed symplectic manifolds in dimension four? The inventory of Section 5 is partial in that regime and complete nowhere else.
   676	\item Which subclasses of classical systems admit unique decomposition into $C$-irreducible factors? The integrable subclass admits local decomposition and fails global decomposition by monodromy, and the boundary between the two behaviors is not characterized.
   677	\item What is the classification of Poisson structures with prescribed leaf space? The Weinstein splitting theorem classifies the local type and leaves the global organization of singular leaves open.
   678	\item Does deformation quantization connect the symplectic family to the operator-algebra family in any sense stronger than a programmatic correspondence? Every statement of this paper that crosses that boundary is conditional on the conjecture.
   679	\item Which coarsenings of mathematical equivalence are the physically correct equivalences for classical systems? The answer must name the preserved layers and the observational content, and the paper fixes neither.
   680	\end{enumerate}
   681	
   682	\section{Conclusion}
   683	
   684	Classical physical systems admit classification exactly where the invariants are finite, parametric, or combinatorial, and the paper has exhibited each type of success in this domain. Local symplectic classification is complete and trivial (Darboux), and the classification content is global. Local Poisson classification is a rank stratification with a transverse factor (Weinstein). Homogeneous symplectic classification is the Dynkin and highest-weight theory of Lie algebras (coadjoint orbits). Global classification succeeds for toric manifolds (Delzant polytopes) and for surfaces (genus and area). The classical statistical family carries a unique monotone metric up to scale (Chentsov), and the quantum analogue is parametric rather than unique (Petz-Sudar).
   685	
   686	The negative results are theorems of the same standing. There are no local symplectic invariants. Global action-angle coordinates fail by monodromy. Classical uniqueness phenomena do not extend to the quantum family. These are content, not caveats: they delimit the regimes in which classification theorems can be expected, and they block the false transfers that analogy would suggest.
   687	
   688	The classification inventory of \cref{tab:inventory} is complete for the regimes it names and silent elsewhere, and the next classical results will come either from widening a regime (which subclasses of integrable systems decompose uniquely) or from deepening an obstruction (what exactly monodromy forbids beyond global action-angle coordinates). The evidence supports restricted classification theorems plus explicit obstructions in the classical domain. It does not support a universal periodic table of classical systems, and the paper does not claim one.
   689	
   690	\begin{thebibliography}{14}
   691	
   692	\bibitem{amari}
   693	S. Amari,
   694	\emph{Information Geometry and Its Applications},
   695	Springer, Tokyo, 2016.
   696	
   697	\bibitem{arnold}
   698	V. I. Arnold,
   699	\emph{Mathematical Methods of Classical Mechanics},
   700	Graduate Texts in Mathematics 60, Springer, New York, 1978.
   701	
   702	\bibitem{chentsov}
   703	N. N. Chentsov,
   704	\emph{Statistical Decision Rules and Optimal Inference},
   705	Translations of Mathematical Monographs 53, American Mathematical Society, Providence, 1982.
   706	
   707	\bibitem{delzant}
   708	T. Delzant,
   709	Hamiltoniens p\'{e}riodiques et images convexes de l'application moment,
   710	\emph{Bulletin de la Soci\'{e}t\'{e} Math\'{e}matique de France} \textbf{116} (1988), 315-339.
   711	
   712	\bibitem{duistermaat}
   713	H. H. Duistermaat,
   714	On global action-angle coordinates,
   715	\emph{Communications on Pure and Applied Mathematics} \textbf{33} (1980), 687-706.
   716	
   717	\bibitem{gromov-hol}
   718	M. Gromov,
   719	Pseudo holomorphic curves in symplectic manifolds,
   720	\emph{Inventiones Mathematicae} \textbf{82} (1985), 307-347.
   721	
   722	\bibitem{gromov-pdr}
   723	M. Gromov,
   724	\emph{Partial Differential Relations},
   725	Ergebnisse der Mathematik und ihrer Grenzgebiete 9, Springer, Berlin, 1986.
   726	
   727	\bibitem{humphreys}
   728	J. E. Humphreys,
   729	\emph{Introduction to Lie Algebras and Representation Theory},
   730	Graduate Texts in Mathematics 9, Springer, New York, 1972.
   731	
   732	\bibitem{kirillov}
   733	A. A. Kirillov,
   734	\emph{Elements of the Theory of Representations},
   735	Grundlehren der mathematischen Wissenschaften 220, Springer, Berlin, 1976.
   736	
   737	\bibitem{marsden-weinstein}
   738	J. E. Marsden and A. Weinstein,
   739	Reduction of symplectic manifolds with symmetry,
   740	\emph{Reports on Mathematical Physics} \textbf{5} (1974), 121-130.
   741	
   742	\bibitem{moser}
   743	J. Moser,
   744	On the volume elements on a manifold,
   745	\emph{Transactions of the American Mathematical Society} \textbf{120} (1965), 286-294.
   746	
   747	\bibitem{nekhoroshev}
   748	N. N. Nekhoroshev,
   749	An exponential estimate of the time of stability of nearly integrable Hamiltonian systems,
   750	\emph{Russian Mathematical Surveys} \textbf{32} (1977), 1-65.
   751	
   752	\bibitem{petz-sudar}
   753	D. Petz and Cs. Sudar,
   754	Extending the Fisher metric to density matrices,
   755	arXiv:quant-ph/0102132, 2001.
   756	
   757	\bibitem{weinstein}
   758	A. Weinstein,
   759	The local structure of Poisson manifolds,
   760	\emph{Journal of Differential Geometry} \textbf{18} (1983), 523-557.
   761	
   762	\end{thebibliography}
   763	
   764	\appendix
   765	\section{Code evidence}
   766	\label{app:code}
   767	
   768	\cref{tab:code-evidence} maps each computational claim of Section 10 to the file and function that demonstrates or tests it. Every entry points at code in \texttt{src/vol-05-classical-systems/}. The claims are existence claims about computations, and the code demonstrates exactly the claim stated.
   769	
   770	\begin{table}[h]
   771	\centering
   772	\small
   773	\begin{tabularx}{\textwidth}{L{5.0cm}L{4.2cm}X}
   774	\toprule
   775	Computational claim & File & Function or test \\
   776	\midrule
   777	Moser homotopy produces a Darboux chart & darboux\_chart.py & moser\_homotopy and test\_chart\_pullback \\
   778	Poisson rank stratification on $\mathfrak{so}(3)^{*}$ & weinstein\_splitting.py & split\_bivector and test\_rank\_stratification \\
   779	Fisher metric is monotone under stochastic maps & fisher\_monotonicity.py & pullback\_comparison and test\_monotonicity \\
   780	Standard symplectic data and witness functions & Instances.hs & darboux and weinsteinSplitting \\
   781	KKS form computation on a two-dimensional orbit & Instances.hs & kksSymplecticForm \\
   782	Fisher metric on probability vectors & Instances.hs & fisherMetric \\
   783	\bottomrule
   784	\end{tabularx}
   785	\caption{Code evidence for the computational claims of Section 10. Each row names one claim and the code that demonstrates it.}
   786	\label{tab:code-evidence}
   787	\end{table}
   788	
   789	\end{document}

exec
/usr/local/bin/zsh -lc "sed -n '179,410p' papers/latex/vol-05-classical-systems.tex | nl -ba -v179" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   179	\section{Poisson geometry and local models}
   180	
   181	Poisson manifolds retain local structure where symplectic manifolds have none. The rank of $\pi$ at a point is the invariant Darboux's theorem destroyed for the symplectic case, and a normal form organizes a neighborhood of a point around that rank.
   182	
   183	\begin{theorem}[Weinstein splitting]
   184	\label{thm:weinstein}
   185	Let $(M, \pi)$ be a Poisson manifold and $p \in M$ a point of rank $2k$. There exist a neighborhood $U$ of $p$ and a Poisson diffeomorphism from $U$ onto a product $U_1 \times U_2$ where $U_1$ is a neighborhood of a point in a symplectic manifold $(N^{2k}, \omega)$ and $U_2$ is a neighborhood of a zero $q_0$ of a Poisson structure $\pi_2$ of rank zero at $q_0$.
   186	\end{theorem}
   187	
   188	\begin{proof}[Proof sketch]
   189	The symplectic leaf $S$ through $p$ is an immersed submanifold of dimension $2k$ and carries the induced symplectic form $\omega_S$ characterized by $\omega_S^{\flat} = (\pi|_S)^{-1}$. In coordinates adapted to the leaf the bivector takes the form $\pi = \pi_S + \pi_T$ with $\pi_S$ nondegenerate along $S$ and $\pi_T$ tangent to the transverse fibers and vanishing on the zero section. The transverse factor $\pi_T$ retains its higher-order terms at the zero $q_0$; the splitting theorem does not linearize it, and smooth linearization of transverse Poisson structures fails in general. The full argument appears in Weinstein \cite{weinstein}; the product form stated here is the part used below.
   190	\end{proof}
   191	
   192	\begin{proposition}[Leaf foliation]
   193	\label{prop:leaves}
   194	A Poisson manifold $(M, \pi)$ is foliated by its symplectic leaves: maximal immersed submanifolds $S \subset M$ on which $\pi|_S$ is nondegenerate and which are tangent to the distribution $\operatorname{im} \pi^{\sharp}$. Each leaf is a symplectic manifold, and the restriction of the Poisson bracket of functions to a leaf is the bracket of the leaf symplectic form.
   195	\end{proposition}
   196	
   197	\begin{proof}
   198	The distribution $x \mapsto \operatorname{im} \pi^{\sharp}_x$ is integrable in the sense of Stefan-Sussmann precisely because $[\pi, \pi] = 0$: the vanishing of the Schouten-Nijenhuis bracket is the integrability condition for the associated Lie algebroid, and its leaves are the symplectic leaves. On a leaf $S$ the map $\pi^{\sharp}|_S : T^{*}S \to TS$ is an isomorphism by maximality of the leaf, and its inverse is $\omega_S^{\flat}$; the bracket identity $\{f, g\}|_S = \omega_S(X_f, X_g)$ is then the definition of $\omega_S$.
   199	\end{proof}
   200	
   201	\begin{example}[Lie-Poisson bracket on $\mathfrak{g}^{*}$]
   202	\label{ex:lie-poisson}
   203	For a finite-dimensional Lie algebra $\mathfrak{g}$ the dual space $\mathfrak{g}^{*}$ carries the linear Poisson structure $\pi(\xi)(d f, d g) = \langle \xi, [d f(\xi), d g(\xi)] \rangle$ under the identification $T_{\xi}^{*} \mathfrak{g}^{*} \cong \mathfrak{g}$. Its symplectic leaves are the coadjoint orbits. For $\mathfrak{g} = \mathfrak{so}(3)$ the space $\mathfrak{g}^{*} \cong \mathbb{R}^{3}$ carries the angular momentum bracket $\{x, y\} = z$ and its cyclic permutations; the rank is two away from the origin and zero at the origin, the leaves are the spheres $\{|\xi| = r\}$ together with the origin, and \cref{thm:weinstein} at a point of a sphere recovers a two-dimensional symplectic factor with a one-dimensional transverse Poisson factor.
   204	\end{example}
   205	
   206	\begin{theorem}[Kirillov-Kostant-Souriau form]
   207	\label{thm:kks}
   208	Let $G$ be a Lie group with Lie algebra $\mathfrak{g}$ and let $\mathcal{O} \subset \mathfrak{g}^{*}$ be a coadjoint orbit. The formula
   209	\[
   210	\omega_{\xi}(\operatorname{ad}^{*}_{x} \xi, \operatorname{ad}^{*}_{y} \xi) = \langle \xi, [x, y] \rangle
   211	\]
   212	defines a $G$-invariant symplectic form $\omega_{\xi}$ on $\mathcal{O}$, and the coadjoint action of $G$ on $(\mathcal{O}, \omega_{\xi})$ is by symplectomorphisms. The Poisson structure induced on $\mathfrak{g}^{*}$ by the Lie bracket restricts on each orbit to the inverse of $\omega_{\xi}$.
   213	\end{theorem}
   214	
   215	\begin{proof}
   216	The stabilizer $\mathfrak{g}_{\xi}$ of $\xi$ under the coadjoint action is the kernel of the skew form $(x, y) \mapsto \langle \xi, [x, y] \rangle$, so the form descends to $T_{\xi} \mathcal{O} \cong \mathfrak{g} / \mathfrak{g}_{\xi}$. Nondegeneracy on the orbit follows from this identification, and the identity $T_{\xi} \mathcal{O} = \operatorname{im} \operatorname{ad}^{*}(\xi)$ makes the descended form nondegenerate. Invariance is the identity $\langle \operatorname{Ad}^{*}_{g} \xi, [\operatorname{Ad}_{g} x, \operatorname{Ad}_{g} y] \rangle = \langle \xi, [x, y] \rangle$ under the adjoint action. The relation between the orbit form and the linear Poisson structure is a direct computation in the Lie-Poisson bracket of \cref{ex:lie-poisson}; see Kirillov \cite{kirillov} for the full statement.
   217	\end{proof}
   218	
   219	\begin{proposition}[Casimir functions]
   220	\label{prop:casimirs}
   221	A smooth function $F \in C^{\infty}(M)$ on a Poisson manifold $(M, \pi)$ is constant on the symplectic leaves if and only if $\{F, f\} = 0$ for all $f \in C^{\infty}(M)$. On the Lie-Poisson space $\mathfrak{g}^{*}$ these functions are exactly the coadjoint-invariant functions $F(\xi) = F(\operatorname{Ad}^{*}_{g} \xi)$ for all $g \in G$. For $\mathfrak{g} = \mathfrak{so}(3)$ the Casimir is $F(\xi) = |\xi|^{2}$, and its level sets are the symplectic leaves of \cref{ex:lie-poisson}.
   222	\end{proposition}
   223	
   224	\begin{proof}
   225	The bracket $\{F, f\} = \pi(dF, df)$ vanishes for all $f$ if and only if $dF$ annihilates the image of $\pi^{\sharp}$, and the image of $\pi^{\sharp}$ spans the tangent spaces of the leaves. So $F$ has vanishing differential along the leaves, which on each connected leaf means $F$ is constant. On $\mathfrak{g}^{*}$ the condition $\{F, f\} = 0$ for all linear functions $f(\eta) = \langle \eta, x \rangle$ reads $\langle \xi, [\nabla F(\xi), x] \rangle = 0$ for all $x$, which is the infinitesimal form of coadjoint invariance. For $\mathfrak{so}(3)$ the invariant polynomials are generated by the quadratic form $|\xi|^{2}$, and \cref{ex:lie-poisson} identifies its level sets with the leaves.
   226	\end{proof}
   227	
   228	Casimir functions are the first integral data of Poisson dynamics: a Hamiltonian that is itself a Casimir generates no motion, and a function in involution with the Casimirs descends to a function on the leaf space.
   229	
   230	\cref{thm:kks} is the bridge from classical mechanics to the classification theory of Lie algebras. The symplectic leaves of the Lie-Poisson structure on $\mathfrak{g}^{*}$ are the coadjoint orbits, the orbits of a compact semisimple group are classified by combinatorial data of the Dynkin diagram, and Section 6 makes that classification precise.
   231	
   232	\section{Global invariants of symplectic systems}
   233	
   234	The classification content that survives Darboux's theorem is global.
   235	
   236	\begin{theorem}[Moser stability]
   237	\label{thm:moser-stability}
   238	Let $M$ be a closed manifold and $\omega_t$, $t \in [0, 1]$, a smooth family of symplectic forms with $[\omega_t] \in H^{2}(M; \mathbb{R})$ independent of $t$. Then there is an isotopy $\varphi_t$ of $M$ with $\varphi_t^{*} \omega_t = \omega_0$ for all $t$.
   239	\end{theorem}
   240	
   241	\begin{proof}
   242	Constancy of the cohomology class gives $\dot{\omega}_t = d \alpha_t$ for a smooth family of one-forms $\alpha_t$. Solve $\iota_{X_t} \omega_t = -\alpha_t$ and integrate $X_t$ to an isotopy $\varphi_t$ of the closed manifold $M$. The computation of \cref{lem:moser-ball} gives $\frac{d}{dt} \varphi_t^{*} \omega_t = 0$ without any support condition, so $\varphi_1^{*} \omega_1 = \omega_0$. The argument is due to Moser \cite{moser}.
   243	\end{proof}
   244	
   245	\begin{corollary}[Classification refines diffeomorphism and cohomology]
   246	\label{cor:classification-data}
   247	Let $f : M \to M'$ be a diffeomorphism of closed symplectic manifolds carrying $[\omega]$ to $[\omega']$. If there is a smooth path of symplectic forms $\omega_t$ in the constant class $[\omega]$ connecting $\omega$ to $f^{*} \omega'$, then $(M, \omega)$ and $(M', \omega')$ are symplectomorphic. Symplectomorphism classes therefore form a strictly finer partition than the pairs consisting of a diffeomorphism type and an orbit of $[\omega]$ under the diffeomorphism group.
   248	\end{corollary}
   249	
   250	The cohomology class $[\omega] \in H^{2}(M; \mathbb{R})$ is therefore a classifying invariant in the restricted sense of the series, together with the diffeomorphism invariants of $M$ and the action of $\operatorname{Diff}(M)$ on $H^{2}(M; \mathbb{R})$. For two-dimensional symplectic manifolds this is a complete classification.
   251	
   252	\begin{example}[Surfaces]
   253	\label{ex:surfaces}
   254	A symplectic form on a closed surface is an area form, and the total area $\int_{M} \omega$ is a symplectomorphism invariant. Two closed oriented surfaces with area forms are symplectomorphic if and only if they are diffeomorphic and the areas agree. Classification here is classification of genus and area.
   255	\end{example}
   256	
   257	\begin{example}[Area forms on the sphere]
   258	\label{ex:area-sphere}
   259	Let $\sigma$ and $\sigma'$ be two area forms on $S^{2}$ with the same total area $\int_{S^{2}} \sigma = \int_{S^{2}} \sigma'$. Then $(S^{2}, \sigma)$ and $(S^{2}, \sigma')$ are symplectomorphic. The interpolation $\sigma_t = (1 - t) \sigma + t \sigma'$ consists of area forms of the same total area, hence symplectic forms with constant cohomology class in $H^{2}(S^{2}; \mathbb{R})$, and \cref{thm:moser-stability} below produces the isotopy. The classification of area forms on a fixed surface up to symplectomorphism is therefore the classification of total areas, in agreement with \cref{ex:surfaces}, and the theorem in action is Moser stability rather than any local analysis.
   260	\end{example}
   261	
   262	\begin{example}[Products of spheres]
   263	\label{ex:product-spheres}
   264	On $M = S^{2} \times S^{2}$ with area forms $\sigma_1$ and $\sigma_2$ of total area one on each factor, consider $\omega_{a, b} = a \sigma_1 \oplus b \sigma_2$ with $a, b > 0$. The cohomology class $[\omega_{a, b}] = a [\sigma_1] + b [\sigma_2]$ is a symplectomorphism invariant, and the diffeomorphism group of $S^{2} \times S^{2}$ acts on $H^{2}(M; \mathbb{R})$ by permuting the two factors. Hence $(M, \omega_{a, b})$ is symplectomorphic to $(M, \omega_{a', b'})$ if and only if $\{a, b\} = \{a', b'\}$ as unordered pairs. The classification is the unordered pair of areas, a two-dimensional global invariant with no local content.
   265	\end{example}
   266	
   267	Beyond the cohomology class, the standard global invariants are the characteristic classes of $M$: any symplectic manifold admits an $\omega$-compatible almost complex structure $J$, and the Chern classes $c_i(M, J)$ are independent of the choice of $J$. For closed four-manifolds these classes interact with deep rigidity phenomena, and no complete classification is claimed in this paper.
   268	
   269	In dimension four, global symplectic classification refines smooth four-manifold topology and remains incomplete outside toric and product regimes. De Rham cohomology distinguishes the standard symplectic structures on $\mathbb{CP}^{2}$ with its Fubini-Study form, $T^{4}$ with a constant form, and the products of \cref{ex:product-spheres}, and \cref{thm:delzant} classifies the toric four-manifolds, including the one-point blowup of $\mathbb{CP}^{2}$, by polytopes. For general closed four-manifolds, symplectomorphism classification is finer than the diffeomorphism type together with the action of $\operatorname{Diff}(M)$ on $H^{2}(M; \mathbb{R})$, and distinguishing smooth structures that share these classical invariants uses gauge-theoretic and pseudoholomorphic invariants (Seiberg-Witten and Taubes-type invariants) that this paper does not develop.
   270	
   271	The strongest global rigidity in the symplectic category is metric-free.
   272	
   273	\begin{definition}[Symplectic capacity]
   274	\label{def:capacity}
   275	A symplectic capacity is a rule $c$ assigning to each symplectic manifold $(M^{2n}, \omega)$ a number $c(M, \omega) \in [0, +\infty]$ such that: (i) monotonicity holds, $c(M, \omega) \leq c(M', \omega')$ whenever a symplectomorphism embeds $(M, \omega)$ into $(M', \omega')$; (ii) conformality holds, $c(M, \lambda \omega) = |\lambda| c(M, \omega)$ for $\lambda \neq 0$; (iii) normalization holds, $c(B^{2n}(1)) = c(B^{2}(1) \times \mathbb{R}^{2n-2}) = \pi$ where $B^{2n}(1)$ is the open unit ball and $B^{2}(1)$ the open unit disc.
   276	\end{definition}
   277	
   278	\begin{proposition}[Gromov width]
   279	\label{prop:gromov-width}
   280	The Gromov width
   281	\[
   282	w_G(M, \omega) = \sup \{ \pi r^{2} : B^{2n}(r) \text{ embeds symplectically into } (M, \omega) \}
   283	\]
   284	is a symplectic capacity in the sense of \cref{def:capacity}.
   285	\end{proposition}
   286	
   287	\begin{proof}[Proof reference]
   288	Monotonicity is immediate from composition of embeddings, and conformality from the scaling of the standard form. The normalization and the capacity axiom for disjoint unions of balls follow from the embedding theory of Gromov \cite{gromov-hol}; the width is the first capacity constructed.
   289	\end{proof}
   290	
   291	Gromov's nonsqueezing theorem is the rigidity statement that makes capacities genuine invariants rather than convenient notation.
   292	
   293	\begin{theorem}[Gromov nonsqueezing]
   294	\label{thm:nonsqueezing}
   295	Let $B^{2n}(r)$ be the open ball of radius $r$ in $\mathbb{R}^{2n}$ and $B^{2}(R) \times \mathbb{R}^{2n-2}$ the cylinder of radius $R$. A symplectic embedding $B^{2n}(r) \hookrightarrow B^{2}(R) \times \mathbb{R}^{2n-2}$ exists only if $r \leq R$.
   296	\end{theorem}
   297	
   298	\begin{proof}[Proof reference]
   299	The proof uses $J$-holomorphic curves for a suitable compatible almost complex structure and is due to Gromov \cite{gromov-hol}. The conclusion is the source of genuine global symplectic rigidity and of the capacity invariants.
   300	\end{proof}
   301	
   302	Nonsqueezing has no Riemannian analogue: a round ball embeds into a thin cylinder in ordinary Euclidean geometry at every scale. The invariant content of symplectic geometry is therefore both global and metric-free.
   303	
   304	On open manifolds the situation reverses. By the $h$-principle for symplectic structures on open manifolds, every open manifold admits an exact symplectic form, and open symplectic manifolds are classified up to symplectomorphism by diffeomorphism type \cite{gromov-pdr}. Closed manifolds are rigid; open manifolds are flexible. Any classification theorem for classical systems must state which regime it addresses.
   305	
   306	\section{Coadjoint orbits and homogeneous symplectic manifolds}
   307	
   308	The homogeneous symplectic manifolds of classical mechanics are the coadjoint orbits of \cref{thm:kks}, and their classification inherits the combinatorics of the Killing-Cartan theory of simple Lie algebras and the highest-weight theory of their representations.
   309	
   310	\begin{definition}[Momentum map and homogeneous orbits]
   311	\label{def:momentum}
   312	Let $G$ act symplectically on $(M, \omega)$ with momentum map $J : M \to \mathfrak{g}^{*}$ characterized by $\langle dJ, x \rangle = \iota_{x_M} \omega$ for the fundamental vector fields $x_M$. The fibers and orbits of $J$ are the symmetry-level objects of the classical system, and coadjoint orbits in $\mathfrak{g}^{*}$ are the model homogeneous symplectic manifolds.
   313	\end{definition}
   314	
   315	\begin{theorem}[Coadjoint orbits of compact semisimple groups]
   316	\label{thm:coadjoint-classification}
   317	Let $G$ be compact, connected, and semisimple with complexification $G^{\mathbb{C}}$ and maximal torus $T$ with Lie algebra $\mathfrak{t}$. Every coadjoint orbit of $G$ meets $\mathfrak{t}^{*}$ in a single $W$-orbit, so the orbits are parameterized continuously by points $\xi$ of the closed positive Weyl chamber $\mathfrak{t}^{*}_{+}$. Each orbit is a flag manifold $G^{\mathbb{C}} / P_{\xi}$ where the parabolic $P_{\xi}$ is determined by the support of $\xi$, that is by the subset of Dynkin nodes on whose walls $\xi$ lies; regular $\xi$ gives full flag manifolds and singular $\xi$ gives partial flags. The symplectic form on the orbit is the Kirillov-Kostant-Souriau form of \cref{thm:kks}. The dominant integral weights form the discrete sublattice $\Lambda_{+} \subset \mathfrak{t}^{*}_{+}$ that selects the integral, that is quantizable, orbits; those are the orbits carrying finite-dimensional irreducible representations by the Borel-Weil theorem.
   318	\end{theorem}
   319	
   320	\begin{proof}[Proof reference]
   321	The Killing-Cartan classification of complex simple Lie algebras is the list of Dynkin diagrams $A_n$, $B_n$, $C_n$, $D_n$, $G_2$, $F_4$, $E_6$, $E_7$, $E_8$ \cite{humphreys}. The parameterization of coadjoint orbits by the positive Weyl chamber is the standard maximal-torus argument, and the identification of orbits with $G^{\mathbb{C}} / P_{\xi}$ is the complex-geometric form of the same statement \cite{kirillov}. The highest-weight theorem classifies the finite-dimensional irreducible representations of $\mathfrak{g}^{\mathbb{C}}$ by dominant integral weights \cite{humphreys}, and the Borel-Weil theorem realizes each such representation on the corresponding integral orbit. The paper uses these results as established background and reproduces none of the classification lists.
   322	\end{proof}
   323	
   324	\begin{example}[The spheres as coadjoint orbits]
   325	\label{ex:sphere-orbit}
   326	For $G = SU(2)$ the dual $\mathfrak{su}(2)^{*} \cong \mathbb{R}^{3}$, and the coadjoint orbits are the spheres $\{|\xi| = r\}$ of every radius $r > 0$ together with the degenerate orbit at the origin: a continuous one-parameter family, the Weyl chamber being the half-line $r \geq 0$. The Kirillov-Kostant-Souriau form of \cref{thm:kks} on the sphere of radius $r$ is $1/r$ times the round area form, of total symplectic area $4 \pi r$. The integral orbits are those with $2r$ a nonnegative integer, and the Borel-Weil theorem attaches to the orbit of radius $r = j$ the spin-$j$ representation of dimension $2j + 1$. The example separates the two classification statements: the classical orbit family is continuous in $r$, and the representation labels form the discrete sublattice $r \in \tfrac{1}{2} \mathbb{Z}_{\geq 0}$.
   327	\end{example}
   328	
   329	The classification content of \cref{thm:coadjoint-classification} is finite-dimensional and combinatorial: Dynkin diagram nodes and dominant weights. The theorem classifies homogeneous symplectic manifolds under a group with transitive action, not arbitrary symplectic manifolds. The orbit method program, which seeks to extend this dictionary to general representations of general Lie groups through their coadjoint orbits, is not established at the level of an equivalence and is not used as a dependency here.
   330	
   331	\begin{table}[t]
   332	\centering
   333	\small
   334	\begin{tabular}{L{1.8cm}L{6.2cm}L{3.4cm}}
   335	\toprule
   336	Diagram & Complex simple Lie algebra & Dimension \\
   337	\midrule
   338	$A_n$ & $\mathfrak{sl}(n+1, \mathbb{C})$ & $n(n+2)$ \\
   339	$B_n$ & $\mathfrak{so}(2n+1, \mathbb{C})$ & $n(2n+1)$ \\
   340	$C_n$ & $\mathfrak{sp}(2n, \mathbb{C})$ & $n(2n+1)$ \\
   341	$D_n$ & $\mathfrak{so}(2n, \mathbb{C})$ & $n(2n-1)$ \\
   342	$G_2$ & exceptional algebra of type $G_2$ & $14$ \\
   343	$F_4$ & exceptional algebra of type $F_4$ & $52$ \\
   344	$E_6$ & exceptional algebra of type $E_6$ & $78$ \\
   345	$E_7$ & exceptional algebra of type $E_7$ & $133$ \\
   346	$E_8$ & exceptional algebra of type $E_8$ & $248$ \\
   347	\bottomrule
   348	\end{tabular}
   349	\caption{The Killing-Cartan list of complex simple Lie algebras. The classification of homogeneous symplectic manifolds of \cref{thm:coadjoint-classification} inherits this list and adds, per diagram, the positive Weyl chamber of continuous orbit parameters and the dominant integral weights selecting the integral orbits.}
   350	\label{tab:dynkin}
   351	\end{table}
   352	
   353	\cref{tab:dynkin} is the classification content that flows into classical mechanics: for each simple algebra the coadjoint orbits form a family parameterized by the positive Weyl chamber of \cref{thm:coadjoint-classification}, the dominant integral weights select the integral sublattice of that chamber, and the symplectic geometry of each orbit is fixed by \cref{thm:kks}. The exceptional diagrams show that the classification is not a uniform infinite family alone, and the dimensions record that the homogeneous symplectic manifolds attached to exceptional algebras are concrete finite-dimensional objects.
   354	
   355	\section{Hamiltonian dynamics and integrable systems}
   356	
   357	The dynamical layer of a classical system is the family of Hamiltonian flows. The classification of dynamics is far from complete, but the integrable case admits normal forms with explicit invariants and explicit obstructions to global classification.
   358	
   359	\begin{definition}[Integrable system]
   360	\label{def:integrable}
   361	A Liouville integrable system is a symplectic manifold $(M^{2n}, \omega)$ with $n$ functions $H_1, \dots, H_n \in C^{\infty}(M)$ in involution, $\{H_i, H_j\} = 0$, and with $dH_1 \wedge \dots \wedge dH_n$ nonzero on a dense open subset of $M$.
   362	\end{definition}
   363	
   364	\begin{theorem}[Liouville-Arnold]
   365	\label{thm:liouville-arnold}
   366	Let $(M^{2n}, \omega, H_1, \dots, H_n)$ be a Liouville integrable system and let $M_c = \{ H_1 = c_1, \dots, H_n = c_n \}$ be a compact connected regular level set. Then $M_c$ is diffeomorphic to an $n$-torus $T^{n}$, and a neighborhood of $M_c$ in $M$ carries action-angle coordinates $(I, \theta)$ in which $\omega = \sum_{i} dI_i \wedge d\theta_i$ and the $H_i$ depend on the actions $I_i$ alone.
   367	\end{theorem}
   368	
   369	\begin{proof}[Proof reference]
   370	The Hamiltonian flows of the $H_i$ commute and preserve $M_c$, giving a locally free $T^{n}$-action whose orbits fill $M_c$; compactness and connectedness make the action transitive. The action variables are the periods of $\omega$ over a basis of $H_1(M_c; \mathbb{Z})$, and the angle variables are coordinates on the fibers. The full proof appears in Arnold \cite{arnold}.
   371	\end{proof}
   372	
   373	\begin{proposition}[Action variables are periods]
   374	\label{prop:periods}
   375	In the action-angle coordinates of \cref{thm:liouville-arnold}, the action variables are the periods of the action one-form $\lambda$ with $d\lambda = \omega$ over a basis $\gamma_1, \dots, \gamma_n$ of $H_1(M_c; \mathbb{Z})$:
   376	\[
   377	I_j = \frac{1}{2\pi} \oint_{\gamma_j} \lambda.
   378	\]
   379	The value depends on the choice of primitive $\lambda$: two primitives differ by a closed one-form, and the resulting shift of the actions is the period vector of that form, a vector of $H^{1}(M_c; \mathbb{R}) \cong \mathbb{R}^{n}$. Once $\lambda$ is fixed, the angle variables are fiberwise coordinates normalized so that $\omega = \sum_j dI_j \wedge d\theta_j$.
   380	\end{proposition}
   381	
   382	\begin{proof}
   383	On a neighborhood of $M_c$ the form $\omega$ is exact, $\omega = d\lambda$, and the $n$ commuting flows of the $H_i$ generate a torus action. The periods of $\lambda$ over the cycles $\gamma_j$ are constant on the base of the fibration because the cycles are covariantly constant under the flows, and the identity $I_j = \frac{1}{2\pi} \oint_{\gamma_j} \lambda$ is the normalization that yields $\omega = \sum_j dI_j \wedge d\theta_j$. Replacing $\lambda$ by $\lambda + \eta$ with $\eta$ closed shifts each $I_j$ by $\frac{1}{2\pi} \oint_{\gamma_j} \eta$, and those shifts range over all of $\mathbb{R}^{n}$.
   384	\end{proof}
   385	
   386	Action-angle variables give a local decomposition of an integrable system into $n$ one-degree-of-freedom systems. Global action-angle coordinates need not exist: the period lattice of the torus fibration can have monodromy.
   387	
   388	\begin{proposition}[Monodromy obstruction]
   389	\label{prop:monodromy}
   390	There exist integrable Hamiltonian systems whose regular compact fibers are tori and which admit no global action-angle coordinates; the obstruction is the monodromy representation of $\pi_1$ of the base of the fibration acting on the period lattice $H_1(T^{n}; \mathbb{Z})$.
   391	\end{proposition}
   392	
   393	\begin{proof}[Proof reference]
   394	Duistermaat \cite{duistermaat} computes the monodromy of the period bundle for integrable systems with focus-focus singularities, and the spherical pendulum is the standard example: parallel transport of a fiber around a critical value returns the fiber with its lattice mapped by a nontrivial unipotent matrix. Global action-angle coordinates would trivialize the period bundle, so nontrivial monodromy obstructs them.
   395	\end{proof}
   396	
   397	\begin{example}[Spherical pendulum]
   398	\label{ex:pendulum}
   399	The spherical pendulum on $T^{*} S^{2}$ with Hamiltonian $H = \tfrac{1}{2} (p_{\theta}^{2} + p_{\varphi}^{2} / \sin^{2}\theta) - \cos \theta$ is integrable with the vertical angular momentum $p_{\varphi}$ as second integral. Regular compact fibers are two-tori, and the system has one focus-focus critical point. Parallel transport of the period lattice around the critical value acts on $H_1(T^{2}; \mathbb{Z})$ by the unipotent matrix $\begin{pmatrix} 1 & 1 \\ 0 & 1 \end{pmatrix}$. The local decomposition of \cref{thm:liouville-arnold} holds near every regular fiber, and no global decomposition into action-angle pairs exists on the complement of the critical value.
   400	\end{example}
   401	
   402	\begin{example}[Euler top]
   403	\label{ex:euler-top}
   404	The free rigid body is the Hamiltonian system on the coadjoint orbit $\mathcal{O} \subset \mathfrak{so}(3)^{*}$ of \cref{ex:lie-poisson} with Hamiltonian $H(\xi) = \tfrac{1}{2} (\xi_1^{2} / I_1 + \xi_2^{2} / I_2 + \xi_3^{2} / I_3)$ for positive moments of inertia $I_i$. The Casimir $|\xi|^{2}$ is a second integral in involution with $H$, so the system is integrable on each sphere $|\xi|^{2} = r^{2}$. The regular compact fibers are the intersections of the energy ellipsoids with the momentum spheres, the trajectories are the Euler-Poinsot curves on those spheres, and \cref{thm:liouville-arnold} applies at every regular fiber. The example lives simultaneously in the homogeneous symplectic geometry of Section 6 and in the integrable dynamics of this section: its state space is a coadjoint orbit, its invariant is the Casimir, and its local normal form is action-angle.
   405	\end{example}
   406	
   407	Monodromy is the first genuine obstruction in this paper to decomposition: the local decomposition of \cref{thm:liouville-arnold} into one-degree-of-freedom factors is a statement about a neighborhood of one fiber, and \cref{prop:monodromy} exhibits integrable systems that do not decompose globally. Stability of integrable dynamics is likewise regime-restricted.
   408	
   409	\begin{theorem}[Nekhoroshev estimate]
   410	\label{thm:nekhoroshev}

exec
/usr/local/bin/zsh -lc "sed -n '409,617p' papers/latex/vol-05-classical-systems.tex | nl -ba -v409" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   409	\begin{theorem}[Nekhoroshev estimate]
   410	\label{thm:nekhoroshev}
   411	Let $H = H_0 + \varepsilon H_1$ be a steep integrable Hamiltonian system with $n$ degrees of freedom and let $H_0(I)$ be the integrable part in action variables. There are positive constants $c$, $a$, and $b$ depending on the system such that, for $\varepsilon$ small, every trajectory satisfies
   412	\[
   413	\| I(t) - I(0) \| \leq c \varepsilon^{b}
   414	\qquad \text{for all } 0 \leq t \leq \exp(c \varepsilon^{-a}).
   415	\]
   416	The bound is on the drift of the action variables, not on the energy, which is conserved exactly.
   417	\end{theorem}
   418	
   419	\begin{proof}[Proof reference]
   420	The estimate is due to Nekhoroshev \cite{nekhoroshev}. Steepness is the geometric condition on $H_0$ under which the normal form of the flow is integrable to high order, and it prevents Arnold diffusion across the resonance planes of action space. The exponential time scale follows from that normal form. The theorem is a statement about the action drift of perturbed integrable systems over exponentially long times.
   421	\end{proof}
   422	
   423	\section{Classical statistical systems and information geometry}
   424	
   425	The classical probability family has one uniqueness theorem in the whole inventory of classical classification results. Chentsov's theorem singles out the Fisher metric as the unique metric monotone under stochastic maps, and the quantum analogue of that metric is parametric rather than unique.
   426	
   427	\begin{definition}[Fisher metric]
   428	\label{def:fisher}
   429	On the open simplex $\Delta^{\circ} \subset \mathbb{R}^{n}$ the Fisher metric is the Riemannian metric whose value at $p$ on tangent vectors $u, v$ (with $\sum_i u_i = \sum_i v_i = 0$) is
   430	\[
   431	g_{p}(u, v) = \sum_{i=1}^{n} \frac{u_i v_i}{p_i}.
   432	\]
   433	On a smooth statistical model $\theta \mapsto p_{\theta}$ the Fisher metric is the pullback of this metric, with components $g_{jk}(\theta) = \sum_i \frac{1}{p_i} \partial_j p_i \, \partial_k p_i$.
   434	\end{definition}
   435	
   436	\begin{example}[Fisher metric on three outcomes]
   437	\label{ex:fisher-three}
   438	For $p = (\tfrac{1}{2}, \tfrac{1}{3}, \tfrac{1}{6})$ and the tangent vector $u = (1, -1, 0)$ the Fisher metric evaluates to $g_p(u, u) = \frac{1}{1/2} + \frac{1}{1/3} = 5$. At the uniform point $p = (\tfrac{1}{3}, \tfrac{1}{3}, \tfrac{1}{3})$ the same vector gives $g_p(u, u) = 6$. The metric therefore weights directions by the rarity of the outcomes they move, and the example is the two-dimensional case of \cref{def:fisher}.
   439	\end{example}
   440	
   441	\begin{definition}[Monotone metric]
   442	\label{def:monotone}
   443	A Riemannian metric $g$ on $\Delta^{\circ}$ is monotone under stochastic maps if for every column-stochastic matrix $T$ and every $p$, the pullback $T^{*} g_{Tp}$ at $p$ satisfies $T^{*} g_{Tp} \leq g_{p}$ as quadratic forms. Monotonicity is the requirement that coarse-graining cannot increase distinguishability.
   444	\end{definition}
   445	
   446	\begin{theorem}[Chentsov]
   447	\label{thm:chentsov}
   448	Let $g$ be a family of Riemannian metrics $g^{(n)}$ on the open simplices $\Delta^{\circ} \subset \mathbb{R}^{n}$ for all $n \geq 1$, compatible with Markov embeddings (pullback along every sufficient statistic is an isometry) and monotone under stochastic maps in the sense of \cref{def:monotone}. Then one constant $c > 0$ satisfies $g^{(n)} = c \, g_{\mathrm{Fisher}}^{(n)}$ for every $n$, where $g_{\mathrm{Fisher}}^{(n)}$ is the Fisher metric of \cref{def:fisher}. The cross-dimension compatibility is a hypothesis: monotonicity on a single fixed simplex does not determine the metric up to scale.
   449	\end{theorem}
   450	
   451	\begin{proof}[Proof structure]
   452	Monotonicity forces equality along sufficient statistics, since a sufficient statistic admits a stochastic retraction and monotonicity in both directions along the retraction. Invariance under the sufficient statistics of the simplex reduces the metric to a family $g_p(u, v) = \sum_i \frac{u_i v_i}{p_i} f(p)$ compatible with all embeddings of lower-dimensional simplices, and the compatibility across dimensions forces $f$ to be constant. The complete proof is in Chentsov \cite{chentsov}; the structure stated here is the part that fixes the metric up to scale.
   453	\end{proof}
   454	
   455	\begin{lemma}[Equality along sufficient statistics]
   456	\label{lem:sufficiency}
   457	Let $g$ be a monotone metric on $\Delta^{\circ}$ and let $T$ be a stochastic map with a stochastic left inverse $S$, that is $S T = \mathrm{Id}$. Then $T$ is an isometric embedding for $g$, and for every tangent vector $u$ at $p$,
   458	\[
   459	g_{p}(u, u) = g_{Tp}(Tu, Tu).
   460	\]
   461	\end{lemma}
   462	
   463	\begin{proof}
   464	Monotonicity of $g$ for $T$ gives $g_{p}(u, u) \geq g_{Tp}(Tu, Tu)$, and monotonicity for $S$ gives
   465	\[
   466	g_{Tp}(Tu, Tu) \geq g_{p}(S T u, S T u) = g_{p}(u, u).
   467	\]
   468	The two inequalities sandwich, so equality holds and $T$ preserves $g$ exactly. This is the equality case that \cref{thm:chentsov} uses to reduce the classification to the invariant metrics under the sufficient statistics of the simplex.
   469	\end{proof}
   470	
   471	\begin{example}[Isometries of the Fisher metric]
   472	\label{ex:reparameterization}
   473	Under the square-root map $x_i = \sqrt{p_i}$ the open simplex $\Delta^{\circ}$ maps to the open positive orthant of the unit sphere, and the Fisher metric becomes four times the round metric of that sphere: $dx_i = u_i / (2 \sqrt{p_i})$ gives $\sum_i dx_i^{2} = \tfrac{1}{4} g_{p}(u, u)$. The isometries of the round sphere preserving the positive orthant are the coordinate permutations, so the isometries of the Fisher metric are exactly the relabelings of the outcome set. Stochastic maps that are not invertible on the model are contractions rather than isometries (\cref{def:monotone}), and \cref{lem:sufficiency} identifies the case of equality. The example shows concretely how the preserved layers of \cref{def:canonical} separate exact equivalence from coarse-graining.
   474	\end{example}
   475	
   476	\begin{corollary}[Fisher metric as classifying invariant]
   477	\label{cor:fisher-invariant}
   478	The Fisher metric, up to positive scale, is a classifying invariant of the classical statistical family under stochastic morphisms: it is the unique metric compatible with the coarse-graining order.
   479	\end{corollary}
   480	
   481	\begin{remark}[Connections beside the metric]
   482	\label{rem:connections}
   483	The Fisher metric is the unique monotone Riemannian object, but the statistical manifold carries more structure than its metric. The $\alpha$-connections of Amari \cite{amari} are a one-parameter family of affine connections dual to each other, $\alpha$ and $-\alpha$, with $\alpha = 0$ the Levi-Civita connection of the Fisher metric, and the exponential and mixture families are the $\alpha = 1$ and $\alpha = -1$ flat coordinates. The uniqueness theorem of Chentsov governs the metric alone; the connection family is parametric, and no statement of this paper transfers metric uniqueness to the connections.
   484	\end{remark}
   485	
   486	\begin{proposition}[Product of statistical models]
   487	\label{prop:stat-product}
   488	Let $p \in \Delta^{\circ} \subset \mathbb{R}^{n}$ and $q \in \Delta^{\circ} \subset \mathbb{R}^{m}$ be probability vectors and let $p \otimes q \in \Delta^{\circ} \subset \mathbb{R}^{nm}$ be their product. Then the Fisher metric of the product is the direct sum of the factors:
   489	\[
   490	g_{p \otimes q}(u \otimes q + p \otimes v, u \otimes q + p \otimes v) = g_{p}(u, u) + g_{q}(v, v)
   491	\]
   492	for tangent vectors $u$ at $p$ and $v$ at $q$.
   493	\end{proposition}
   494	
   495	\begin{proof}
   496	Write the tangent vector at $p \otimes q$ in the product chart. The probability of the pair $(i, j)$ is $p_i q_j$, and the displacement in that coordinate is $u_i q_j + p_i v_j$. The Fisher sum becomes
   497	\[
   498	\sum_{i, j} \frac{(u_i q_j + p_i v_j)^{2}}{p_i q_j}
   499	= \sum_{i, j} \frac{u_i^{2} q_j}{p_i} + 2 \sum_{i, j} u_i v_j + \sum_{i, j} \frac{p_i v_j^{2}}{q_j}
   500	= g_{p}(u, u) + 0 + g_{q}(v, v),
   501	\]
   502	where the cross term vanishes because $\sum_i u_i = \sum_j v_j = 0$.
   503	\end{proof}
   504	
   505	\cref{prop:stat-product} is the compositional content of the statistical family: products of systems are products of metrics, and the classifying invariant of a product is the direct sum of the classifying invariants of the factors. The parallel statement for symplectic products is \cref{def:product-composition} and the decomposition analysis of Section 9.
   506	
   507	The uniqueness statement is classical in both senses of the word. The quantum analogue fails.
   508	
   509	\begin{theorem}[Petz-Sudar parametric classification]
   510	\label{thm:petz-sudar}
   511	Monotone metrics on the space of positive definite density matrices, defined by monotonicity under completely positive trace-preserving maps, are classified by operator monotone functions $f : (0, \infty) \to (0, \infty)$ with $f(1) = 1$ and the symmetry $f(t) = t f(1/t)$ that makes the bilinear form symmetric. The family of such metrics is parametric and infinite, and no constant multiple of a single metric exhausts it.
   512	\end{theorem}
   513	
   514	\begin{proof}[Proof reference]
   515	Petz and Sudar \cite{petz-sudar} classify quantum monotone metrics by operator monotone functions. The metric attached to such a function $f$ is $g_{f, \rho}(A, B) = \operatorname{tr} \big( A \, \mathbf{J}_{\rho, f}^{-1}(B) \big)$ where $\mathbf{J}_{\rho, f} = \mathcal{R}_{\rho} f(\mathcal{L}_{\rho} \mathcal{R}_{\rho}^{-1})$ and $\mathcal{L}_{\rho}$ and $\mathcal{R}_{\rho}$ are left and right multiplication by the state $\rho$; the inverse operator carries the $\rho^{-1}$ scaling that reproduces the classical Fisher metric in the commutative case. The paper uses this classification as the contrast that blocks any transfer of Chentsov uniqueness to the quantum case.
   516	\end{proof}
   517	
   518	\cref{thm:petz-sudar} is a warning about scope. Classical uniqueness in the classification of monotone metrics may not be extended to the quantum family by dependency or analogy: the quantum classification is parametric, not unique. Section 11 returns to the boundary between the two.
   519	
   520	\section{Decomposition and restricted classification}
   521	
   522	Complex classical systems are built from simpler ones by products, reductions, and coupling. Irreducibility is relative to the product composition fixed below, and two restricted classification theorems survive for global symplectic objects.
   523	
   524	\begin{definition}[Product composition]
   525	\label{def:product-composition}
   526	The product composition of classical systems is defined componentwise. For symplectic systems, $(M_1 \times M_2, \omega_1 \oplus \omega_2)$ with $\omega_1 \oplus \omega_2 = \operatorname{pr}_1^{*} \omega_1 + \operatorname{pr}_2^{*} \omega_2$ and Hamiltonians $H_1 + H_2$. For Poisson systems, the direct sum of bivectors. For statistical systems, the product of simplices with product measures and product stochastic maps. The composition data $C$ of \cref{def:irreducible} is this product.
   527	\end{definition}
   528	
   529	\begin{proposition}[Irreducibility of symplectic surfaces]
   530	\label{prop:surface-irreducible}
   531	Every closed symplectic surface of genus $g \geq 0$ is $C$-irreducible for the product composition.
   532	\end{proposition}
   533	
   534	\begin{proof}
   535	A product decomposition $(M_1 \times M_2, \omega_1 \oplus \omega_2)$ of a $2$-dimensional symplectic manifold has $\dim M_1 + \dim M_2 = 2$ with both factors even-dimensional and symplectic, hence of dimension $0$ or $2$. Positive dimension forces one factor to be the empty product.
   536	\end{proof}
   537	
   538	\begin{proposition}[Symplectic reduction]
   539	\label{prop:reduction}
   540	Let a compact Lie group $G$ act on a symplectic system $(M, \omega)$ by symplectomorphisms with momentum map $J$. For a regular value $\mu$ of $J$ at which the isotropy group $G_{\mu}$ acts freely and properly on $J^{-1}(\mu)$, the reduced space $J^{-1}(\mu) / G_{\mu}$ carries a unique symplectic form $\omega_{\mu}$ such that the pullback along $J^{-1}(\mu) \to J^{-1}(\mu)/G_{\mu}$ agrees with $\omega|_{J^{-1}(\mu)}$, and the reduced dynamics of an invariant Hamiltonian is Hamiltonian for $\omega_{\mu}$. The reduction is a decomposition construction on classical systems, and its output is again a classical system of \cref{def:classical-system}.
   541	\end{proposition}
   542	
   543	\begin{proof}[Proof reference]
   544	The construction and its compatibility with dynamics are the symplectic reduction theorem of Marsden and Weinstein \cite{marsden-weinstein}. Regularity of $\mu$ gives the manifold structure of $J^{-1}(\mu)$ and of the quotient by the isotropy group $G_{\mu}$, and the uniqueness of $\omega_{\mu}$ is the statement that $\ker (\omega|_{J^{-1}(\mu)})$ is spanned by the infinitesimal action directions.
   545	\end{proof}
   546	
   547	Reduction is the mechanism by which symmetry data enters the composition layer of a classical system: it removes gauge directions and lowers dimension while preserving the symplectic structure. Existence of decompositions is therefore abundant in the presence of symmetry. Decompositions are generally non-unique.
   548	
   549	\begin{example}[Reduction of the plane]
   550	\label{ex:reduction-sphere}
   551	Let $U(1)$ act on $\mathbb{C}^{2} \cong \mathbb{R}^{4}$ with its standard symplectic form by $e^{i\theta} \cdot z = e^{i\theta} z$, with momentum map $J(z) = \tfrac{1}{2} (|z_1|^{2} + |z_2|^{2})$. For $\mu > 0$ the level set $J^{-1}(\mu)$ is the three-sphere of radius $\sqrt{2\mu}$ in $\mathbb{C}^{2}$, and the reduced space $J^{-1}(\mu) / U(1)$ is $\mathbb{CP}^{1}$ with the Fubini-Study symplectic form normalized to total area $2\pi \mu$; the quotient identifies the Hopf fibers of the level set. The reduced dynamics of any rotation-invariant Hamiltonian is Hamiltonian on that sphere. The example is the elementary case of \cref{prop:reduction}: a four-dimensional symplectic system with a one-dimensional symmetry reduces to a two-dimensional one, and the reduction is a decomposition step in the sense of \cref{def:product-composition}.
   552	\end{example}
   553	
   554	\begin{proposition}[Reduction of products]
   555	\label{prop:reduction-products}
   556	Let $G$ act on a symplectic system $(M_1, \omega_1)$ with momentum map $J_1$, let $(M_2, \omega_2)$ carry the trivial $G$-action, and let $\mu$ be a regular value of $J_1$. Then the reduced space of the product $(M_1 \times M_2, \omega_1 \oplus \omega_2)$ at $\mu$ is the product of the reduced space of $M_1$ at $\mu$ with $M_2$:
   557	\[
   558	\big( J_1^{-1}(\mu) / G_{\mu} \big) \times M_2,
   559	\]
   560	with reduced form $\omega_{\mu} \oplus \omega_2$. Reduction commutes with product composition along the factor that carries no symmetry.
   561	\end{proposition}
   562	
   563	\begin{proof}
   564	The momentum map of the product action is $J = J_1 \circ \operatorname{pr}_1$, so $J^{-1}(\mu) = J_1^{-1}(\mu) \times M_2$ and the isotropy group $G_{\mu}$ acts only on the first factor. The quotient is therefore the product of the quotient with $M_2$, and the reduced form is the direct sum because the symplectic form of the product splits along the same factors. Uniqueness of the reduced form from \cref{prop:reduction} finishes the argument.
   565	\end{proof}
   566	
   567	\cref{prop:reduction-products} states the compatibility between the two constructions of this section, product composition and symmetry reduction. What it does not state is any uniqueness for decomposition: the factors of a product can themselves be reducible, and the reduced factor $J_1^{-1}(\mu) / G_{\mu}$ need not be irreducible even when $M_1$ is.
   568	
   569	\begin{remark}[Uniqueness of decomposition]
   570	\label{rem:uniqueness}
   571	No general uniqueness theorem for decomposition of classical systems is claimed. The local decomposition of integrable systems in \cref{thm:liouville-arnold} is unique in the sense of action-angle data near a regular fiber, and \cref{prop:monodromy} shows that even this restricted uniqueness fails to globalize. Existence and uniqueness of decomposition are realistic goals only in restricted subclasses, and the paper states its restricted theorems with that limitation visible.
   572	\end{remark}
   573	
   574	The first restricted global classification theorem in the symplectic category concerns toric manifolds.
   575	
   576	\begin{definition}[Toric symplectic manifold]
   577	\label{def:toric}
   578	A compact connected toric symplectic manifold is a symplectic manifold $(M^{2n}, \omega)$ of dimension $2n$ with an effective Hamiltonian action of the torus $T^{n}$ whose momentum map $J : M \to \mathbb{R}^{n}$ is proper.
   579	\end{definition}
   580	
   581	\begin{theorem}[Delzant]
   582	\label{thm:delzant}
   583	The momentum image $\Delta = J(M) \subset \mathbb{R}^{n}$ of a compact connected toric symplectic manifold is a convex rational Delzant polytope: convex, rational, simple, and Delzant (the normal vectors of the facets meeting at each vertex form a $\mathbb{Z}$-basis of $\mathbb{Z}^{n}$). Two compact connected toric symplectic manifolds are equivariantly symplectomorphic up to an automorphism of the acting torus $T^{n}$ if and only if their Delzant polytopes are related by an element of $GL(n; \mathbb{Z}) \ltimes \mathbb{R}^{n}$. When the torus action is fixed pointwise the equivalence narrows to translations of the polytope in $\mathbb{R}^{n}$ alone. Conversely, every Delzant polytope arises from such a manifold.
   584	\end{theorem}
   585	
   586	\begin{proof}[Proof reference]
   587	Delzant \cite{delzant}. The polytope is the complete invariant: equivariant symplectic classification of toric manifolds is classification of Delzant polytopes. It is the model of a restricted classification theorem with a finite-dimensional combinatorial invariant, the exact analogue on the global symplectic side of the Dynkin list of \cref{thm:coadjoint-classification}.
   588	\end{proof}
   589	
   590	\begin{example}[Toric surfaces]
   591	\label{ex:toric-surfaces}
   592	In dimension two the Delzant polygons are the polygons with rational edge slopes meeting in lattice bases. The moment polygon of $(S^{2}, r \omega_{\text{area}})$ is an interval of length $r$, and the moment polygon of the one-point blowup of $(\mathbb{CP}^{2}, \omega)$ is a triangle with one corner cut. Two toric surfaces are equivariantly symplectomorphic if and only if their polygons coincide up to lattice equivalence, so the classification is a combinatorial list of polygons.
   593	\end{example}
   594	
   595	\begin{table}[t]
   596	\centering
   597	\small
   598	\begin{tabular}{L{4.2cm}L{4.6cm}L{4.6cm}}
   599	\toprule
   600	Class of classical systems & Classifying invariant & Scope of the classification \\
   601	\midrule
   602	Local symplectic manifolds & none (Darboux) & complete at every dimension and trivial \\
   603	Local Poisson manifolds & rank $2k$ and transverse factor & local normal form at every point \\
   604	Coadjoint orbits of compact semisimple $G$ & positive Weyl chamber parameter and flag type & homogeneous symplectic manifolds, integral orbits by weights \\
   605	Toric symplectic manifolds & Delzant polytope & compact connected manifolds with $T^{n}$-action \\
   606	Closed symplectic surfaces & genus and total area & dimension two, complete \\
   607	Classical statistical models & Fisher metric up to scale & monotone metrics under stochastic maps \\
   608	Integrable systems near a regular fiber & action angles and period lattice & local, obstructed globally by monodromy \\
   609	\bottomrule
   610	\end{tabular}
   611	\caption{The classification inventory of classical systems. Each row is a complete theorem inside its stated scope, and no row claims more than that scope.}
   612	\label{tab:inventory}
   613	\end{table}
   614	
   615	\cref{tab:inventory} is the classification inventory the evidence supports. The rows are disjoint regimes, the invariants are finite or parametric data in every case, and the empty row is the global classification of closed symplectic manifolds beyond surfaces and the toric subclass.
   616	
   617	\section{Computational investigation}

exec
/usr/local/bin/zsh -lc "sed -n '1,178p' papers/latex/vol-05-classical-systems.tex | nl -ba" in /Users/mlong/Documents/Development/classification-physical-systems
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
    14	\usepackage{tikz}
    15	\usepackage{booktabs,tabularx,array,longtable}
    16	\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
    17	\usepackage{listings}
    18	\lstset{basicstyle=\ttfamily\footnotesize,breaklines=true,columns=fullflexible,frame=single,framesep=4pt,showstringspaces=false,captionpos=b}
    19	\usepackage[hidelinks]{hyperref}
    20	\usepackage{cleveref}
    21	\crefname{lstlisting}{Listing}{Listings}
    22	
    23	\newtheorem{theorem}{Theorem}[section]
    24	\newtheorem{proposition}[theorem]{Proposition}
    25	\newtheorem{lemma}[theorem]{Lemma}
    26	\newtheorem{corollary}[theorem]{Corollary}
    27	\theoremstyle{definition}
    28	\newtheorem{definition}[theorem]{Definition}
    29	\theoremstyle{remark}
    30	\newtheorem{remark}[theorem]{Remark}
    31	\newtheorem{example}[theorem]{Example}
    32	
    33	\title{Classification of Classical Physical Systems\\[4pt]
    34	  {\normalsize Part 5 of \emph{The Classification of Mathematical Representations of Physical Systems}}}
    35	\author{Matthew Long\\
    36	  \small The YonedaAI Collaboration, YonedaAI Research Collective\\
    37	  \small Chicago, Illinois, USA\\
    38	  \small \texttt{mlong@yonedalabs.ai}\\
    39	  \small \texttt{https://yonedalabs.ai}}
    40	\date{October 2026}
    41	
    42	\begin{document}
    43	
    44	\maketitle
    45	
    46	\begin{abstract}
    47	This paper classifies restricted classes of classical physical systems: symplectic and Poisson systems and classical statistical systems. The central structural fact is an inversion of the Riemannian situation. Darboux's theorem removes every local symplectic invariant, so the classification content of Hamiltonian mechanics is global and topological. On the Poisson side, Weinstein's splitting theorem replaces local rigidity by a rank stratification into symplectic leaves and transverse data, and coadjoint orbits tie the homogeneous case to the Dynkin classification of simple Lie algebras and the highest-weight classification of their finite-dimensional representations. On the statistical side, Chentsov's theorem singles out the Fisher metric as the unique metric monotone under stochastic maps, while the quantum analogue is parametric rather than unique. The results include one complete local classification theorem, one rank normal form, one uniqueness theorem, and two restricted global classification theorems, each stated with hypotheses and proof or proof reference. The limitation that matters most is scope: no global classification theorem for closed symplectic manifolds is claimed or available, decomposition uniqueness is open outside restricted subclasses, and the deformation-quantization bridge to quantum theory remains conjectural. Computational experiments exhibit the local normal forms and supply executable models; they are evidence, not proofs.
    48	\end{abstract}
    49	
    50	\section{Introduction}
    51	
    52	Classical physical systems carry their state, observables, dynamics, symmetries, and composition rules on smooth manifolds and probability simplices, and the relevant mathematical structures are fully developed: symplectic manifolds, Poisson manifolds, probability simplices. A classification of these structures is a question about what the surviving invariants are.
    53	
    54	The answer is shaped by a single theorem. Darboux's theorem states that all symplectic manifolds of a fixed dimension are locally indistinguishable: near every point, a symplectic manifold looks exactly like a standard linear space with a standard two-form. Riemannian geometry classifies locally through curvature, an invariant with content at every point. Symplectic geometry has no local invariants at all. Whatever classification content Hamiltonian mechanics possesses lives in the large, in topology and global geometry. This inversion, recorded as a structural lesson of the research program, organizes the entire paper.
    55	
    56	Three bodies of established mathematics carry the classification effort. The local theory of Poisson manifolds contributes the rank stratification: Weinstein's splitting theorem decomposes a neighborhood of a point into a symplectic factor and a transverse Poisson factor, so Poisson geometry replaces the missing local invariants of the symplectic case by a rank stratification and a foliation into symplectic leaves. The theory of coadjoint orbits contributes the homogeneous case. Coadjoint orbits of a Lie group carry a canonical symplectic form, the Kirillov-Kostant-Souriau form, and for compact semisimple groups the orbits form flag manifolds parameterized by the positive Weyl chamber, with dominant integral weights selecting the integral orbits. The Killing-Cartan classification of simple Lie algebras and the highest-weight classification of their representations therefore enter classical mechanics as the classification of homogeneous symplectic manifolds. Information geometry on the classical side contributes the uniqueness theorem: Chentsov's theorem singles out the Fisher metric, up to a constant, as the unique Riemannian metric monotone under stochastic maps. Classical statistical systems thus possess a uniqueness theorem that their quantum analogues provably lack.
    57	
    58	No global classification theorem for closed symplectic manifolds is known or claimed. Decomposition of classical systems into irreducible factors is unique only in restricted subclasses, and action-angle monodromy is an explicit obstruction to global decomposition in one of those subclasses. The deformation-quantization bridge between classical and quantum families is a programmatic conjecture, and the paper treats it as conditional throughout. Every theorem below is stated with its hypotheses; every computational claim is marked as evidence rather than proof.
    59	
    60	Mathematical equivalence for these systems is structure-preserving isomorphism: symplectomorphisms preserve symplectic forms, Poisson isomorphisms preserve brackets, and reparameterizations preserve probability structure. Physical equivalence is a coarser relation that this paper does not define, and every classification theorem below applies to mathematical structures under these isomorphisms.
    61	
    62	\section{Mathematical framework}
    63	
    64	A classical system in this paper is an instance of the five-component schema of the series: a tuple of state space, observables, dynamics, symmetries, and composition rules, with each component specialized to smooth-geometric or measure-theoretic data.
    65	
    66	\begin{definition}[Classical system]
    67	\label{def:classical-system}
    68	A classical system is a tuple $P = (X, O, D, S, C)$ where $X$ is a smooth state space, $O$ is a distinguished family of observables on $X$, $D$ is a family of admissible state evolutions with their composition rules (vector fields with flows on smooth manifolds, stochastic maps on simplices), $S$ is symmetry data preserving $O$ and $D$ (a Lie group action in the smooth case, outcome permutations and sufficient-statistics embeddings in the statistical case), and $C$ assigns composition data to products of systems. The tuple is the classical instance of the five-component schema of the series.
    69	\end{definition}
    70	
    71	\begin{definition}[Symplectic system]
    72	\label{def:symplectic-system}
    73	A symplectic system is a classical system whose state space is a symplectic manifold $(M, \omega)$ of dimension $2n$, whose observables are $O = C^{\infty}(M)$, and whose dynamics are Hamiltonian vector fields $X_H$ defined by $\iota_{X_H} \omega = dH$ for Hamiltonians $H \in C^{\infty}(M)$. The Poisson bracket is $\{f, g\} = \omega(X_f, X_g)$ and the flow equation reads $\dot{f} = \{f, H\}$.
    74	\end{definition}
    75	
    76	\begin{definition}[Poisson system]
    77	\label{def:poisson-system}
    78	A Poisson system is a classical system whose state space is a Poisson manifold $(M, \pi)$: a smooth manifold with a bivector field $\pi \in \Gamma(\Lambda^2 TM)$ whose Schouten-Nijenhuis bracket satisfies $[\pi, \pi] = 0$. The bracket $\{f, g\} = \pi(df, dg)$ makes $C^{\infty}(M)$ a Lie algebra obeying the Leibniz rule in each argument. Symplectic systems are the special case in which $\pi$ is nondegenerate.
    79	\end{definition}
    80	
    81	\begin{definition}[Classical statistical system]
    82	\label{def:statistical-system}
    83	A classical statistical system is a classical system whose state space is the interior $\Delta^{\circ} = \{ p \in \mathbb{R}^{n} : p_i > 0,\ \sum_i p_i = 1 \}$ of the probability simplex $\Delta^{n-1} = \{ p \in \mathbb{R}^{n} : p_i \geq 0,\ \sum_i p_i = 1 \}$, whose observables are random variables (functions on the outcome set), and whose admissible state changes are the column-stochastic matrices $T$ that map $\Delta^{\circ}$ into itself (columns strictly positive); maps that reach the boundary are excluded because the Fisher metric is singular there. Restriction to submodels is by sufficient statistics, and the symmetries $S$ are the outcome permutations together with those embeddings.
    84	\end{definition}
    85	
    86	The three families in force are the symplectic and Poisson family, the smooth geometric family, and the classical probability and measure family. The quantum side of the probability family appears in Section 8 only as a contrast.
    87	
    88	\begin{definition}[Morphisms and equivalence in force]
    89	\label{def:morphisms}
    90	Between symplectic systems the admissible exact morphisms are symplectomorphisms and, between Poisson systems, Poisson maps (smooth maps pulling Poisson brackets back). Between classical statistical systems the admissible coarse-grainings are stochastic maps. Mathematical equivalence of classical systems is isomorphism in the ambient category fixed here: symplectomorphism, Poisson isomorphism, or diffeomorphism of statistical models carrying the model map. Every such identification preserves the symplectic form or the Poisson bracket or the probability structure, and the paper names the preserved layer whenever an identification is claimed.
    91	\end{definition}
    92	
    93	\begin{definition}[Irreducibility relative to composition]
    94	\label{def:irreducible}
    95	Fix the product composition of Section 9 as the composition data $C$. A classical system is $C$-irreducible if it admits no decomposition $P \simeq P_1 \times P_2$ with both factors of positive dimension. Irreducibility is always relative to the composition data chosen, and the paper never asserts irreducibility without naming that data.
    96	\end{definition}
    97	
    98	Two limitations of the framework are load-bearing. First, the admissibility conditions of the series are not yet fixed, so every statement below quantifies over explicitly listed classes rather than over all admissible systems. Second, mathematical equivalence is strictly finer than physical equivalence, and no physical equivalence for classical systems is fixed here. The standing qualification of the series governs any attempt to derive physical conclusions from relational data: ``Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.''
    99	
   100	\begin{table}[t]
   101	\centering
   102	\small
   103	\begin{tabular}{L{3.2cm}L{9.8cm}}
   104	\toprule
   105	Symbol & Meaning \\
   106	\midrule
   107	$(M, \omega)$ & symplectic manifold of dimension $2n$ with closed nondegenerate two-form \\
   108	$\pi$, $\pi^{\sharp}$ & Poisson bivector and the map $T^{*}M \to TM$ it induces \\
   109	$X_H$ & Hamiltonian vector field defined by $\iota_{X_H} \omega = dH$ \\
   110	$\{f, g\}$ & Poisson bracket of observables \\
   111	$\mathcal{O}_{\xi}$ & coadjoint orbit through $\xi \in \mathfrak{g}^{*}$ \\
   112	$J$ & momentum map of a symplectic group action \\
   113	$\Delta^{\circ}$ & interior of the probability simplex \\
   114	$g_{p}$ & Fisher metric at the probability vector $p$ \\
   115	$T^{*} g_{Tp}$ & pullback of the metric at $Tp$ along a stochastic map \\
   116	$C$ & product composition of classical systems \\
   117	\bottomrule
   118	\end{tabular}
   119	\caption{Notation used throughout the paper. Each symbol is fixed at its first appearance and reused without change.}
   120	\label{tab:notation}
   121	\end{table}
   122	
   123	\begin{definition}[Canonical transformation and coarse-graining]
   124	\label{def:canonical}
   125	A canonical transformation between symplectic systems $(M_1, \omega_1)$ and $(M_2, \omega_2)$ is a diffeomorphism $\varphi : M_1 \to M_2$ with $\varphi^{*} \omega_2 = \omega_1$; it carries Hamiltonian flows to Hamiltonian flows and preserves the Poisson bracket. A coarse-graining of a classical statistical system is a stochastic map $T$; it preserves the probability structure and contracts the Fisher metric by \cref{def:monotone}. The two kinds of morphism implement the two equivalence regimes of this paper: exact mathematical equivalence on the symplectic side and a metric-degrading order relation on the statistical side.
   126	\end{definition}
   127	
   128	\section{Local classification of symplectic systems}
   129	
   130	The classification of symplectic manifolds is locally trivial and globally hard. The local triviality is a theorem.
   131	
   132	\begin{lemma}[Linearization at a point]
   133	\label{lem:linearization}
   134	Let $(M^{2n}, \omega)$ be symplectic and let $p \in M$. There are coordinates $(x_1, y_1, \dots, x_n, y_n)$ centered at $p$ in which $\omega_p = \sum_{i=1}^{n} dx_i \wedge dy_i$ at $p$.
   135	\end{lemma}
   136	
   137	\begin{proof}
   138	Choose any coordinates $u_1, \dots, u_{2n}$ centered at $p$. The matrix $\Omega = (\omega_{ij}(p))$ of $\omega$ at $p$ is skew-symmetric and invertible. Symplectic Gram-Schmidt: pick $u_1$ with $\omega(u_1, \cdot) \neq 0$, set $v_1$ with $\omega(u_1, v_1) = 1$, restrict to the symplectic complement of $\operatorname{span}(u_1, v_1)$, and iterate. The resulting frame $e_1, f_1, \dots, e_n, f_n$ satisfies $\omega(e_i, f_j) = \delta_{ij}$, $\omega(e_i, e_j) = \omega(f_i, f_j) = 0$, and dual coordinates give the claim.
   139	\end{proof}
   140	
   141	\begin{lemma}[Moser trick on a ball]
   142	\label{lem:moser-ball}
   143	Let $B$ be an open ball centered at $p$ in a chart, and let $\omega_t$, $t \in [0, 1]$, be a smooth family of symplectic forms on $B$ with $\omega_t$ nondegenerate for all $t$. If $\dot{\omega}_t$ is exact for each $t$, then there is a concentric ball $B'$ compactly contained in $B$ carrying an isotopy $\varphi_t$ with $\varphi_t^{*} \omega_t = \omega_0$ for all $t$, and $\varphi_1$ maps $B'$ into $B$.
   144	\end{lemma}
   145	
   146	\begin{proof}
   147	Let $Z$ be the radial vector field of $B$ from its center $p$, so $Z(p) = 0$ and $B$ is star-shaped for $Z$. For the closed form $\dot{\omega}_t$ the homotopy operator gives the primitive $\alpha_t = \iota_{Z} \dot{\omega}_t$, which satisfies $d \alpha_t = \dot{\omega}_t$ and $\alpha_t(p) = 0$ because $Z$ vanishes at $p$. Solve $\iota_{X_t} \omega_t = -\alpha_t$; nondegeneracy of $\omega_t$ makes this solvable and $X_t(p) = 0$. Let $L$ be a Lipschitz constant for the field $X_t$ on $B$, uniform in $t \in [0, 1]$, and choose $r > 0$ with $B(p, r)$ compactly contained in $B$ and $e^{L} r$ smaller than the distance from $p$ to the boundary of $B$. Grönwall's inequality gives $|\varphi_t(x) - p| \leq e^{L t} |x - p|$ for as long as the trajectory stays in $B$, so the flow $\varphi_t$ of $X_t$ starting at the identity exists on all of $[0, 1]$ and maps $B' = B(p, r)$ into $B$. Then
   148	\[
   149	\frac{d}{dt} \varphi_t^{*} \omega_t = \varphi_t^{*} \left( \dot{\omega}_t + \mathcal{L}_{X_t} \omega_t \right) = \varphi_t^{*} \left( d\alpha_t + d \iota_{X_t} \omega_t \right) = \varphi_t^{*} (d \alpha_t - d \alpha_t) = 0,
   150	\]
   151	so $\varphi_t^{*} \omega_t$ is constant and equals $\omega_0$.
   152	\end{proof}
   153	
   154	\begin{theorem}[Darboux]
   155	\label{thm:darboux}
   156	Let $(M^{2n}, \omega)$ be a symplectic manifold and $p \in M$. There exists a neighborhood $U$ of $p$ and a diffeomorphism $\varphi : U \to V$ onto an open subset $V \subset \mathbb{R}^{2n}$ such that $\varphi^{*} \omega_0 = \omega|_U$ where $\omega_0 = \sum_{i=1}^{n} dx_i \wedge dy_i$. In particular, any two symplectic manifolds of the same dimension are locally symplectomorphic.
   157	\end{theorem}
   158	
   159	\begin{proof}
   160	By \cref{lem:linearization} choose centered coordinates on a ball $B$ around $p$ in which $\omega_p = \omega_0$ at the center. The family $\omega_t = \omega_0 + t(\omega - \omega_0)$ is a smooth family of closed two-forms with $\omega_t$ nondegenerate on a possibly smaller ball $B' \subset B$ (nondegeneracy is an open condition and holds at $p$ for every $t$). On $B'$ the form $\omega - \omega_0$ is closed, and since $B'$ is contractible its de Rham cohomology vanishes in degree two, so $\omega - \omega_0 = d\alpha$ for a one-form $\alpha$ and $\dot{\omega}_t = d\alpha$ is exact for every $t$. \cref{lem:moser-ball} provides an isotopy $\varphi_t$ of $B'$ with $\varphi_1^{*} \omega_1 = \omega_0$ and $\omega_1 = \omega$. The diffeomorphism $\varphi_1^{-1}$ exhibits $(B', \omega)$ as a symplectomorphic image of an open set in $(\mathbb{R}^{2n}, \omega_0)$.
   161	\end{proof}
   162	
   163	\begin{corollary}[Absence of local invariants]
   164	\label{cor:no-local}
   165	Every local symplectic invariant of a $2n$-dimensional symplectic manifold is constant on connected components. Any classification of symplectic manifolds up to symplectomorphism must be carried by global data.
   166	\end{corollary}
   167	
   168	\begin{proof}
   169	Local symplectic invariants are preserved by symplectomorphisms, and \cref{thm:darboux} supplies a symplectomorphism from a neighborhood of any point onto a neighborhood of any point of the standard space of the same dimension. Two points of a connected manifold are joined by a chain of such neighborhoods.
   170	\end{proof}
   171	
   172	\begin{remark}[The inversion]
   173	\label{rem:inversion}
   174	In Riemannian geometry the curvature tensor is a local invariant with pointwise content, and local normal forms are scarce. In symplectic geometry the local classification has one entry per dimension, and the classification problem moves to global topology.
   175	\end{remark}
   176	
   177	The same argument classifies exact symplectic structures locally in the strongest sense: on a ball, every symplectic form is not merely standardizable but symplectomorphic to the constant standard form. 
   178	

exec
/usr/local/bin/zsh -lc "sed -n '618,789p' papers/latex/vol-05-classical-systems.tex | nl -ba -v618" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   618	
   619	Three computational experiments and the executable taxonomy models accompanying the paper illustrate the normal forms of Sections 3 to 8 and supply checked examples of the invariant computations. Computational evidence is not proof, and the theorems stand on their proofs and citations rather than on these runs.
   620	
   621	The Darboux chart experiment takes a perturbed two-form $\omega = \omega_0 + d\alpha$ on a ball in $\mathbb{R}^{4}$ and integrates the Moser homotopy of \cref{lem:moser-ball}, producing a diffeomorphism that pulls $\omega$ back to $\omega_0$. The residual $\|\varphi^{*} \omega - \omega_0\|$ is computed and reported. On the tested instance (quadratic perturbation with scale $0.05$, twelve sample points, four hundred Runge-Kutta steps, complex-step Jacobians at step $10^{-20}$) the maximum entrywise residual $\|J^{T} \omega(\varphi(x_0)) J - \omega_0(x_0)\|_{\max}$ is $2.4 \times 10^{-15}$, at double precision floor. The experiment evidences the constructive content of the proof of \cref{thm:darboux}: the homotopy exists as an ordinary differential equation and its numerical integration is stable on the tested examples.
   622	
   623	The rank stratification experiment applies the Weinstein splitting of \cref{thm:weinstein} to the Lie-Poisson structure of $\mathfrak{so}(3)^{*}$. The program computes the rank of the Poisson tensor at sample points, extracts the symplectic leaf dimension at each point, and verifies the rank stratification of \cref{ex:lie-poisson}: rank two on the spheres of radii $0.5$, $1.0$, and $2.7$ with a two-dimensional symplectic factor and a one-dimensional transverse factor, and rank zero at the origin with a three-dimensional transverse factor. The experiment evidences the rank stratification claim in one explicit model.
   624	
   625	The Fisher monotonicity experiment checks the monotonicity of the Fisher metric under stochastic maps, the hypothesis of \cref{thm:chentsov}. The program computes $g_p$ and the pullback $T^{*} g_{Tp}$ for random column-stochastic matrices $T$ and verifies $T^{*} g_{Tp} \leq g_{p}$ by comparing the quadratic forms. On two hundred sampled trials with five outcomes, the minimum eigenvalue of $g_p - T^{*} g_{Tp}$ is $-5.6 \times 10^{-15}$, the round-off signature of a positive semidefinite difference, and the minimum slack $g_p(u, u) - g_{Tp}(Tu, Tu)$ over ten thousand random tangent vectors is $5.4 \times 10^{-2}$. The tangent vectors were drawn as Gaussian vectors projected to the tangent space ($\sum_i u_i = 0$) without normalization, so the strictly positive slack reflects that the samples miss the near-null directions of the difference matrix. The experiment evidences the monotonicity direction of Chentsov's theorem on finite samples. It does not evidence the uniqueness direction, and no claim of uniqueness rests on the computation.
   626	
   627	The Haskell models in \texttt{src/vol-05-classical-systems/} declare instances of the shared taxonomy classes for symplectic systems, Poisson systems, Hamiltonian systems, and classical statistical systems, with names mirroring the definitions above and the companion verification targets. They compute witness data for the normal forms: standard symplectic matrices, rank splits of Poisson tensors, the Kirillov-Kostant-Souriau form on a two-dimensional orbit, and the Fisher metric on probability vectors. The models are executable, not machine-checked proofs. Appendix \ref{app:code} maps each computational claim to its file and function.
   628	
   629	The core of the first experiment is short enough to reproduce. The perturbation scale is $\texttt{EPS} = 0.05$, \texttt{alpha} is the one-form with quadratic coefficients whose exterior derivative perturbs $\omega_0$, and \texttt{flow\_time1} integrates the Moser field with fourth-order Runge-Kutta from $t = 0$ to $t = 1$. The Moser field is the pointwise solution of a linear system: with $\iota_{X_t} \omega_t = -\alpha_t$ and the matrix convention $M_{ij} = \omega_t(e_i, e_j)$, the contraction reads $M X = \alpha_t$, so the routine solves $M X = a$ with $a = \texttt{EPS} \cdot \alpha(x)$.
   630	
   631	\begin{lstlisting}[caption={Core of the Darboux chart experiment (darboux\_chart.py).},label=lst:darboux]
   632	def moser_field(x, t):
   633	    # solve omega_t(x) X = alpha(x), the matrix form of
   634	    # iota_X omega_t = -alpha with M skew-symmetric
   635	    M = omega_t(x, t)
   636	    a = EPS * alpha(x)
   637	    return np.linalg.solve(M, a)
   638	
   639	def test_chart_pullback(n_samples=12, h=1e-20):
   640	    worst = 0.0
   641	    for _ in range(n_samples):
   642	        x0 = rng.normal(scale=0.3, size=DIM)
   643	        x1 = flow_time1(x0)
   644	        J = np.zeros((DIM, DIM))
   645	        for k in range(DIM):
   646	            e = np.zeros(DIM, dtype=complex)
   647	            e[k] = 1j * h
   648	            J[:, k] = np.imag(flow_time1(x0.astype(complex) + e)) / h
   649	        resid = J.T @ omega(x1) @ J - omega_0(x0)
   650	        worst = max(worst, np.max(np.abs(resid)))
   651	    return worst
   652	\end{lstlisting}
   653	
   654	\cref{lst:darboux} is the complete pullback test: the flow is integrated with fourth-order Runge-Kutta, the Jacobian of the time-one map is taken by complex-step differentiation so that the residual is not dominated by difference truncation, and the pullback form is compared to $\omega_0$ at the base point $x_0$. The step $h = 10^{-20}$ is representable in IEEE double precision, whose smallest normal number is near $10^{-308}$, so the complex-step quotient does not underflow on the tested platform. The other two experiments follow the same pattern, a direct invariant computation checked against the predicted inequality or rank.
   655	
   656	\section{Limitations and open questions}
   657	
   658	The classification results above hold exactly in the regimes of the established mathematics they rest on.
   659	
   660	Global classification of closed symplectic manifolds is open. The invariants of Section 5 classify in restricted regimes: surfaces by area and genus, toric manifolds by Delzant polytopes, homogeneous manifolds by weight data. Beyond these regimes the diffeomorphism classification of the underlying manifold is itself incomplete in dimension four and above, and the symplectic classification contains it. No claim of the paper addresses that gap.
   661	
   662	The classification of Poisson structures beyond local models is open. The Weinstein splitting theorem classifies the local type at each point, and the leaf foliation organizes the global object, but the topology of leaf spaces, the structure of singular leaves, and the classification of Poisson manifolds with prescribed leaf space are not addressed by the local theory. This paper makes no claim about them.
   663	
   664	Decomposition uniqueness is open in general. \cref{prop:monodromy} exhibits the obstruction inside one of the best behaved subclasses: action-angle monodromy prevents global decomposition of integrable systems whose local decomposition is complete. Characterizing the subclasses with unique decomposition is a genuine gap in the classical theory.
   665	
   666	The bridge between classical and quantum families is conjectural. Deformation quantization associates to a Poisson manifold a family of noncommutative algebras, and it is one of the candidate constructions connecting the symplectic family to the operator-algebra family. No equivalence theorem connects the two families, and the paper treats the connection as a programmatic conjecture: every statement crossing the classical and quantum boundary is conditional on that conjecture and is marked as such. The Petz-Sudar classification of \cref{thm:petz-sudar} shows concretely that uniqueness phenomena do not transfer: the classical uniqueness of the Fisher metric has a parametric quantum shadow.
   667	
   668	The equivalence relation of the series is not fixed here. This paper classifies under mathematical equivalence of \cref{def:morphisms}, which preserves the symplectic form, the Poisson bracket, or the statistical structure exactly. Physical equivalence for classical systems must be coarser, and identifying two classical systems as physically equivalent requires naming the preserved layers and the observational content. The paper does neither, and the classification statements above are statements about mathematical objects.
   669	
   670	The computational experiments of Section 10 demonstrate that the normal forms are computable on examples; no claim of the paper depends on them.
   671	
   672	The open questions the classical sector poses to the series are the following.
   673	
   674	\begin{enumerate}
   675	\item Which global invariants beyond $[\omega]$, the characteristic classes, and the capacities complete the classification of closed symplectic manifolds in dimension four? The inventory of Section 5 is partial in that regime and complete nowhere else.
   676	\item Which subclasses of classical systems admit unique decomposition into $C$-irreducible factors? The integrable subclass admits local decomposition and fails global decomposition by monodromy, and the boundary between the two behaviors is not characterized.
   677	\item What is the classification of Poisson structures with prescribed leaf space? The Weinstein splitting theorem classifies the local type and leaves the global organization of singular leaves open.
   678	\item Does deformation quantization connect the symplectic family to the operator-algebra family in any sense stronger than a programmatic correspondence? Every statement of this paper that crosses that boundary is conditional on the conjecture.
   679	\item Which coarsenings of mathematical equivalence are the physically correct equivalences for classical systems? The answer must name the preserved layers and the observational content, and the paper fixes neither.
   680	\end{enumerate}
   681	
   682	\section{Conclusion}
   683	
   684	Classical physical systems admit classification exactly where the invariants are finite, parametric, or combinatorial, and the paper has exhibited each type of success in this domain. Local symplectic classification is complete and trivial (Darboux), and the classification content is global. Local Poisson classification is a rank stratification with a transverse factor (Weinstein). Homogeneous symplectic classification is the Dynkin and highest-weight theory of Lie algebras (coadjoint orbits). Global classification succeeds for toric manifolds (Delzant polytopes) and for surfaces (genus and area). The classical statistical family carries a unique monotone metric up to scale (Chentsov), and the quantum analogue is parametric rather than unique (Petz-Sudar).
   685	
   686	The negative results are theorems of the same standing. There are no local symplectic invariants. Global action-angle coordinates fail by monodromy. Classical uniqueness phenomena do not extend to the quantum family. These are content, not caveats: they delimit the regimes in which classification theorems can be expected, and they block the false transfers that analogy would suggest.
   687	
   688	The classification inventory of \cref{tab:inventory} is complete for the regimes it names and silent elsewhere, and the next classical results will come either from widening a regime (which subclasses of integrable systems decompose uniquely) or from deepening an obstruction (what exactly monodromy forbids beyond global action-angle coordinates). The evidence supports restricted classification theorems plus explicit obstructions in the classical domain. It does not support a universal periodic table of classical systems, and the paper does not claim one.
   689	
   690	\begin{thebibliography}{14}
   691	
   692	\bibitem{amari}
   693	S. Amari,
   694	\emph{Information Geometry and Its Applications},
   695	Springer, Tokyo, 2016.
   696	
   697	\bibitem{arnold}
   698	V. I. Arnold,
   699	\emph{Mathematical Methods of Classical Mechanics},
   700	Graduate Texts in Mathematics 60, Springer, New York, 1978.
   701	
   702	\bibitem{chentsov}
   703	N. N. Chentsov,
   704	\emph{Statistical Decision Rules and Optimal Inference},
   705	Translations of Mathematical Monographs 53, American Mathematical Society, Providence, 1982.
   706	
   707	\bibitem{delzant}
   708	T. Delzant,
   709	Hamiltoniens p\'{e}riodiques et images convexes de l'application moment,
   710	\emph{Bulletin de la Soci\'{e}t\'{e} Math\'{e}matique de France} \textbf{116} (1988), 315-339.
   711	
   712	\bibitem{duistermaat}
   713	H. H. Duistermaat,
   714	On global action-angle coordinates,
   715	\emph{Communications on Pure and Applied Mathematics} \textbf{33} (1980), 687-706.
   716	
   717	\bibitem{gromov-hol}
   718	M. Gromov,
   719	Pseudo holomorphic curves in symplectic manifolds,
   720	\emph{Inventiones Mathematicae} \textbf{82} (1985), 307-347.
   721	
   722	\bibitem{gromov-pdr}
   723	M. Gromov,
   724	\emph{Partial Differential Relations},
   725	Ergebnisse der Mathematik und ihrer Grenzgebiete 9, Springer, Berlin, 1986.
   726	
   727	\bibitem{humphreys}
   728	J. E. Humphreys,
   729	\emph{Introduction to Lie Algebras and Representation Theory},
   730	Graduate Texts in Mathematics 9, Springer, New York, 1972.
   731	
   732	\bibitem{kirillov}
   733	A. A. Kirillov,
   734	\emph{Elements of the Theory of Representations},
   735	Grundlehren der mathematischen Wissenschaften 220, Springer, Berlin, 1976.
   736	
   737	\bibitem{marsden-weinstein}
   738	J. E. Marsden and A. Weinstein,
   739	Reduction of symplectic manifolds with symmetry,
   740	\emph{Reports on Mathematical Physics} \textbf{5} (1974), 121-130.
   741	
   742	\bibitem{moser}
   743	J. Moser,
   744	On the volume elements on a manifold,
   745	\emph{Transactions of the American Mathematical Society} \textbf{120} (1965), 286-294.
   746	
   747	\bibitem{nekhoroshev}
   748	N. N. Nekhoroshev,
   749	An exponential estimate of the time of stability of nearly integrable Hamiltonian systems,
   750	\emph{Russian Mathematical Surveys} \textbf{32} (1977), 1-65.
   751	
   752	\bibitem{petz-sudar}
   753	D. Petz and Cs. Sudar,
   754	Extending the Fisher metric to density matrices,
   755	arXiv:quant-ph/0102132, 2001.
   756	
   757	\bibitem{weinstein}
   758	A. Weinstein,
   759	The local structure of Poisson manifolds,
   760	\emph{Journal of Differential Geometry} \textbf{18} (1983), 523-557.
   761	
   762	\end{thebibliography}
   763	
   764	\appendix
   765	\section{Code evidence}
   766	\label{app:code}
   767	
   768	\cref{tab:code-evidence} maps each computational claim of Section 10 to the file and function that demonstrates or tests it. Every entry points at code in \texttt{src/vol-05-classical-systems/}. The claims are existence claims about computations, and the code demonstrates exactly the claim stated.
   769	
   770	\begin{table}[h]
   771	\centering
   772	\small
   773	\begin{tabularx}{\textwidth}{L{5.0cm}L{4.2cm}X}
   774	\toprule
   775	Computational claim & File & Function or test \\
   776	\midrule
   777	Moser homotopy produces a Darboux chart & darboux\_chart.py & moser\_homotopy and test\_chart\_pullback \\
   778	Poisson rank stratification on $\mathfrak{so}(3)^{*}$ & weinstein\_splitting.py & split\_bivector and test\_rank\_stratification \\
   779	Fisher metric is monotone under stochastic maps & fisher\_monotonicity.py & pullback\_comparison and test\_monotonicity \\
   780	Standard symplectic data and witness functions & Instances.hs & darboux and weinsteinSplitting \\
   781	KKS form computation on a two-dimensional orbit & Instances.hs & kksSymplecticForm \\
   782	Fisher metric on probability vectors & Instances.hs & fisherMetric \\
   783	\bottomrule
   784	\end{tabularx}
   785	\caption{Code evidence for the computational claims of Section 10. Each row names one claim and the code that demonstrates it.}
   786	\label{tab:code-evidence}
   787	\end{table}
   788	
   789	\end{document}

codex
I found a reference that points in the wrong direction and several typography inconsistencies. Two long display equations also need layout checks; without compiling, I can only flag them as possible overflow risks.
exec
/usr/local/bin/zsh -lc "python3 -c 'import re,collections; s=open(\"papers/latex/vol-05-classical-systems.tex\").read(); labels=re.findall(r\"\\\\label\\{(["'^}]+)'"\\}\",s); refs=[k.strip() for v in re.findall(r\"\\\\(?:[cC]ref|ref|eqref)\\{(["'^}]+)'"\\}\",s) for k in v.split(\",\")]; bibs=re.findall(r\"\\\\bibitem\\{(["'^}]+)'"\\}\",s); cites=[k.strip() for v in re.findall(r\"\\\\cite\\{(["'^}]+)'"\\}\",s) for k in v.split(\",\")]; print(\"Undefined references:\",sorted(set(refs)-set(labels))); print(\"Duplicate labels:\",[k for k,v in collections.Counter(labels).items() if v>1]); print(\"Undefined citations:\",sorted(set(cites)-set(bibs))); print(\"Sentence-initial lowercase cref:\",[i for i,l in enumerate(s.splitlines(),1) if l.startswith(chr(92)+\"cref{\")])'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 23ms:
Undefined references: ['lst:darboux']
Duplicate labels: []
Undefined citations: []
Sentence-initial lowercase cref: [230, 353, 505, 518, 567, 615, 654, 768]

codex
Reviewed only `papers/latex/vol-05-classical-systems.tex`. This was a source-only review; compilation and overfull/underfull box warnings were not verified. No missing packages, unresolved reference/citation keys, or definite compilation errors were found.

1. **Line 259 — incorrect reference direction.**  
   “`\cref{thm:moser-stability} below`” refers to the theorem already appearing at lines 236–243. Remove “below” or replace it with “above.”

2. **Lines 160, 230, 353, 505, 518, 567, 615, 654, 768 — lowercase references begin sentences.**  
   `\cref` produces lowercase names such as “theorem” and “table.” Replace sentence-initial occurrences with `\Cref`. On line 160, change only the occurrence following “every $t$.”

3. **Lines 710, 715, 720, 740, 745, 750, 760 — hyphens used for page ranges.**  
   Use LaTeX en dashes: `315--339`, `687--706`, `307--347`, `121--130`, `286--294`, `1--65`, and `523--557`.

4. **Lines 777–782 — inconsistent formatting of code identifiers.**  
   Filenames and function names use proportional text, whereas related identifiers in lines 627–629 use monospace. Wrap each filename and function name individually in `\texttt{...}`, retaining escaped underscores. For example:
   ```latex
   \texttt{darboux\_chart.py} &
   \texttt{moser\_homotopy} and \texttt{test\_chart\_pullback}
   ```
   Recheck table widths after this change.

The long displays at lines 149 and 498–500 warrant checking in a compiled PDF, but source inspection alone does not establish an overflow defect.

VERDICT: NEEDS_FIX (issues listed above must be fixed)
hook: Stop
hook: Stop Completed
tokens used
73,081
Reviewed only `papers/latex/vol-05-classical-systems.tex`. This was a source-only review; compilation and overfull/underfull box warnings were not verified. No missing packages, unresolved reference/citation keys, or definite compilation errors were found.

1. **Line 259 — incorrect reference direction.**  
   “`\cref{thm:moser-stability} below`” refers to the theorem already appearing at lines 236–243. Remove “below” or replace it with “above.”

2. **Lines 160, 230, 353, 505, 518, 567, 615, 654, 768 — lowercase references begin sentences.**  
   `\cref` produces lowercase names such as “theorem” and “table.” Replace sentence-initial occurrences with `\Cref`. On line 160, change only the occurrence following “every $t$.”

3. **Lines 710, 715, 720, 740, 745, 750, 760 — hyphens used for page ranges.**  
   Use LaTeX en dashes: `315--339`, `687--706`, `307--347`, `121--130`, `286--294`, `1--65`, and `523--557`.

4. **Lines 777–782 — inconsistent formatting of code identifiers.**  
   Filenames and function names use proportional text, whereas related identifiers in lines 627–629 use monospace. Wrap each filename and function name individually in `\texttt{...}`, retaining escaped underscores. For example:
   ```latex
   \texttt{darboux\_chart.py} &
   \texttt{moser\_homotopy} and \texttt{test\_chart\_pullback}
   ```
   Recheck table widths after this change.

The long displays at lines 149 and 498–500 warrant checking in a compiled PDF, but source inspection alone does not establish an overflow defect.

VERDICT: NEEDS_FIX (issues listed above must be fixed)
