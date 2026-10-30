---
reviewer: codex (OpenAI) gpt-6.1-sol
type: formatting
paper: vol-09-gravity-information-geometry
round: 4
date: 2026-10-30T05:11:40Z
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
session id: 01a18b38-88ae-7a00-95c2-64a752b3d573
--------
user
Read ONLY the file papers/latex/vol-09-gravity-information-geometry.tex (do not explore other files or directories). Review it for LaTeX formatting issues: compilation errors, missing packages, broken references, inconsistent styling, overfull/underfull boxes, spacing problems. List all issues with line numbers and concrete fixes. End your response with a VERDICT line — exactly one of: VERDICT: PASS (no issues remain) or VERDICT: NEEDS_FIX (issues listed above must be fixed).
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
/usr/local/bin/zsh -lc 'nl -ba papers/latex/vol-09-gravity-information-geometry.tex' in /Users/mlong/Documents/Development/classification-physical-systems
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
    31	\title{Gravity, Information, and Geometric Correspondence\\[4pt]
    32	  {\normalsize Part 9 of \emph{The Classification of Mathematical Representations of Physical Systems}}}
    33	\author{Matthew Long\\
    34	  \small The YonedaAI Collaboration, YonedaAI Research Collective\\
    35	  \small Chicago, Illinois, USA\\
    36	  \small \texttt{mlong@yonedalabs.ai}\\
    37	  \small \texttt{https://yonedalabs.ai}}
    38	\date{October 2026}
    39	
    40	\begin{document}
    41	
    42	\maketitle
    43	
    44	\begin{abstract}
    45	This paper examines the relationship between information geometry and gravity from the viewpoint of classification: which geometric structures on state spaces are established mathematics, and which proposed correspondences remain conjectural. Six results are established in finite dimensions. The Fisher family is unique up to a positive constant among metric families on the probability simplices that are monotone under stochastic maps, and monotonicity is proved directly. On quantum state spaces uniqueness fails: monotone metrics form the Petz family of operator monotone functions, and the symmetric logarithmic derivative and Wigner-Yanase metrics are not proportional on qubit states. Every metric of the family restricts to the Fisher metric on commuting states, so uniqueness holds exactly on the commutative locus. The symmetric logarithmic derivative metric makes the open qubit state space an open hemisphere of the round three-sphere of radius one. Thermodynamic Ruppeiner geometry of the ideal gas is flat, and a van der Waals model has nonzero scalar curvature away from the critical region. Entanglement-wedge reconstruction and the holographic entropy cone for at most five regions are theorems; the entropy formula and the emergence of spacetime from entanglement are proposals, and the correspondence between gravity and information geometry is proposed, not proved.
    46	\end{abstract}
    47	
    48	\section{Introduction}
    49	
    50	Two research programs meet at the phrase ``gravity from information.'' One asks how statistical structure on spaces of states acquires Riemannian geometry. The other asks how spacetime geometry, and eventually gravitational dynamics, could be reconstructed from quantum information. The first program contains complete theorems. The second contains proposals, one reconstruction theorem of quantum information theory, and a central question that is open. This paper develops the first program in finite dimensions, records exactly what the second program has and has not established, and identifies the point where the two touch: the choice of metric on a space of quantum states.
    51	
    52	The information-geometric side is sharp. Chentsov's theorem \cite{chentsov, petz-sudar} says that on the probability simplex there is, up to a positive constant, exactly one Riemannian metric that decreases under stochastic maps, the Fisher metric. Petz and Sud\'ar \cite{petz-sudar} extended the question to density matrices and found the opposite of uniqueness: the monotone metrics on finite-dimensional state spaces are classified by operator monotone functions, an infinite family. This uniqueness-then-failure pattern is the spine of the paper. It is also a constraint on classification: a proposed dictionary that assigns geometry to quantum states has to name which member of the Petz family it uses, and the classical uniqueness that motivates such a dictionary does not transfer.
    53	
    54	The holographic side is graded. Within quantum information theory, the entanglement-wedge reconstruction theorem of Dong, Harlow, and Wall \cite{dhw} is proved, and the holographic entropy cone is complete for at most five boundary regions \cite{bao, hc5}. The Ryu-Takayanagi formula \cite{rt} is argued from AdS/CFT and derived for spherical vacuum regions in any dimension \cite{chc}; the static formula follows from replica methods \cite{lm}, and the covariant formula with extremal surfaces was proposed in \cite{hrt} and derived in \cite{dlr}. For general regions and states it remains a proposal. Van Raamsdonk's suggestion that entanglement builds spacetime \cite{vr} is an argument from limiting cases.
    55	
    56	The thermodynamic side supplies the oldest working dictionary between information metrics and physical curvature. The Ruppeiner metric, the negative Hessian of entropy, is flat for the ideal gas and develops curvature in interacting models \cite{ruppeiner}. A separate thermodynamic route derives the Einstein equation of state from local horizon thermodynamics \cite{jacobson}; it does not use Ruppeiner curvature, and the relation between the two thermodynamic constructions is itself a proposed correspondence.
    57	
    58	The paper proves six results. Fisher monotonicity is proved directly, and the classical uniqueness of Chentsov is recorded with its exact scope. The Petz family is recorded, and non-uniqueness is exhibited by explicit computation: on the qubit state space the symmetric logarithmic derivative metric and the Wigner-Yanase metric have different radial-to-transverse ratios. Uniqueness is then localized: every metric of the family restricts to the Fisher metric on commuting states, by a computation on diagonal tangent vectors together with Chentsov's theorem. The symmetric logarithmic derivative metric on the open qubit state space is computed in Bloch coordinates and identified with an open hemisphere of the round three-sphere of radius one. Finally the Ruppeiner metric of the ideal gas is proved flat by an explicit coordinate change, and the van der Waals scalar curvature is computed away from the critical point.
    59	
    60	This paper treats information geometry as an invariant discipline for spaces of statistical and quantum states and tests whether it can support a geometric correspondence with gravity. On the commutative locus the invariant metric is unique. Off it, the metric is parametric, and any correspondence of the form ``state space geometry equals physical geometry'' inherits that parameter. Reconstruction results (Gelfand, Stone, Naimark) and entanglement-wedge reconstruction recover structure from probes; they do not by themselves produce gravitational dynamics. Whether the proposed structures recover an interacting physical theory without assuming at the outset the spacetime geometry they aim to explain remains open.
    61	
    62	The phrase ``geometric correspondence'' hides three different dictionaries, and the paper keeps them apart. The state-space dictionary assigns Riemannian geometry to spaces of statistical or quantum states, and is a theorem. The thermodynamic dictionary assigns curvature to equilibrium manifolds and reads it as an interaction diagnostic, and is a working practice with computed examples. The spacetime dictionary assigns bulk geometry to boundary entanglement, and is a proposal with derived special cases. Only the first is established without qualification, and only the first is used as a premise below.
    63	
    64	\section{Definitions}
    65	\label{sec:definitions}
    66	
    67	\begin{definition}[Statistical model]
    68	\label{def:stat-model}
    69	A statistical model is a finite set $\Omega = \{1, \dots, n\}$ and an open subset $M$ of the interior of the probability simplex $\Delta_{n-1}$. A point $p \in M$ is a strictly positive probability vector, and the tangent space at $p$ is identified with the subspace of $\mathbb{R}^n$ of vectors $u$ with $\sum_i u_i = 0$.
    70	\end{definition}
    71	
    72	\begin{definition}[Fisher metric]
    73	\label{def:fisher}
    74	The Fisher metric of a statistical model $M$ assigns to each $p \in M$ the bilinear form
    75	\begin{equation}
    76	g_p(u, v) = \sum_{i=1}^{n} \frac{u_i v_i}{p_i}.
    77	\end{equation}
    78	It is a Riemannian metric on $M$, positive definite on tangent vectors.
    79	\end{definition}
    80	
    81	\begin{definition}[Stochastic map and monotone metric]
    82	\label{def:stochastic}
    83	A stochastic map is an $m \times n$ matrix $\varphi$ with $\varphi_{ji} \geq 0$ and $\sum_{j} \varphi_{ji} = 1$ for every $i$, acting on distributions by $p \mapsto \varphi p$ where $(\varphi p)_j = \sum_i \varphi_{ji} p_i$. A monotone metric is a family $\{g^{(n)}\}_{n \geq 2}$ of smooth Riemannian metrics, one on each open simplex $\Delta_{n-1}^{\circ}$, such that for every stochastic map $\varphi$ and every tangent vector $u$ at $p \in \Delta_{n-1}^{\circ}$ with $\varphi p \in \Delta_{m-1}^{\circ}$,
    84	\begin{equation}
    85	g^{(m)}_{\varphi p}(D\varphi \cdot u, \; D\varphi \cdot u) \leq g^{(n)}_p(u, u).
    86	\end{equation}
    87	Monotonicity says that processing cannot increase statistical distinguishability. The Fisher family of \cref{def:fisher}, one Fisher metric per simplex, is monotone by \cref{prop:monotone}. The cross-dimensional quantifier is essential: on a fixed simplex alone, uniqueness of the monotone metric fails already at $n = 2$, where the flat metric $g_p(u,u) = u_1^2 + u_2^2$ on $\Delta_1^{\circ}$ also satisfies the inequality, and stochastic maps between simplices of different sizes are what eliminate it.
    88	\end{definition}
    89	
    90	\begin{definition}[Quantum state space]
    91	\label{def:quantum-states}
    92	For $d \geq 2$ let $\mathcal{D}_d$ be the set of density operators on $\mathbb{C}^d$, that is, the positive semidefinite Hermitian matrices of trace one. The interior $\mathcal{D}_d^{\circ}$ consists of the full-rank states; it is a smooth manifold of dimension $d^2 - 1$. A tangent vector at $\rho$ is a traceless Hermitian matrix $X$. A completely positive trace-preserving map (channel) $\Phi : \mathcal{D}_d \to \mathcal{D}_{m}$ acts on states in the usual way and is the quantum image of a stochastic map.
    93	\end{definition}
    94	
    95	\begin{definition}[Monotone metric on quantum states]
    96	\label{def:quantum-monotone}
    97	A monotone metric is a family $\{g^{(d)}\}$ of Riemannian metrics, one on each $\mathcal{D}_d^{\circ}$, such that for every channel $\Phi : \mathcal{D}_d \to \mathcal{D}_m$, every full-rank state $\rho \in \mathcal{D}_d^{\circ}$ with $\Phi(\rho) \in \mathcal{D}_m^{\circ}$, and every tangent vector $X$ at $\rho$,
    98	\begin{equation}
    99	g^{(m)}_{\Phi(\rho)}(D\Phi \cdot X, \; D\Phi \cdot X) \leq g^{(d)}_{\rho}(X, X).
   100	\end{equation}
   101	Invariance under unitary conjugation is not an extra hypothesis: $\rho \mapsto U \rho U^{\dagger}$ is a channel with channel inverse $\rho \mapsto U^{\dagger} \rho U$, so monotonicity in both directions forces invariance. The same argument applies to permutations of coordinates in \cref{def:stochastic}.
   102	\end{definition}
   103	
   104	\begin{definition}[Symmetric logarithmic derivative]
   105	\label{def:sld}
   106	Let $\rho \in \mathcal{D}_d^{\circ}$ and let $X$ be a tangent vector at $\rho$. The symmetric logarithmic derivative of $X$ at $\rho$ is the unique Hermitian matrix $L$ with
   107	\begin{equation}
   108	X = \frac{\rho L + L \rho}{2}.
   109	\end{equation}
   110	The symmetric logarithmic derivative metric is $g^{\mathrm{sld}}_{\rho}(X, X) = \operatorname{Tr}(X L)$.
   111	\end{definition}
   112	
   113	\begin{definition}[Operator monotone function and the Petz family]
   114	\label{def:petz}
   115	A function $f : (0, \infty) \to (0, \infty)$ is normalized operator monotone when it is operator monotone (the Loewner order is preserved on positive matrices), and satisfies $f(1) = 1$ and $f(t) = t f(1/t)$ for all $t > 0$. For such an $f$, the Petz metric \cite{petz-1996} $g^{f}$ on $\mathcal{D}_d^{\circ}$ is given in an orthonormal eigenbasis $\rho = \sum_i \lambda_i |i\rangle\langle i|$ by
   116	\begin{equation}
   117	\label{eq:petz}
   118	g^{f}_{\rho}(X, X) = \sum_{i,j} \frac{|X_{ij}|^2}{\lambda_i f(\lambda_j / \lambda_i)},
   119	\end{equation}
   120	where $X_{ij} = \langle i | X | j \rangle$. The condition $f(1) = 1$ fixes the scale: it is equivalent to the metric restricting to the classical Fisher value on diagonal tangent vectors. Without that condition the formula is homogeneous of degree $-1$ in $f$ and classifies metrics only up to a positive constant.
   121	\end{definition}
   122	
   123	\begin{definition}[Fidelity metric]
   124	\label{def:fidelity}
   125	The Uhlmann fidelity \cite{uhlmann} of two states is
   126	\begin{equation}
   127	F(\rho, \sigma) = \bigl(\operatorname{Tr}\sqrt{\sqrt{\rho}\, \sigma \sqrt{\rho}}\bigr)^2.
   128	\end{equation}
   129	The fidelity distance $d_B$ is defined by $d_B(\rho, \sigma)^2 = 2\bigl(1 - \sqrt{F(\rho, \sigma)}\bigr)$. Where the induced Riemannian metric exists we call it the fidelity metric $g^{\mathrm{fid}}$. In this normalization $g^{\mathrm{fid}}$ equals one quarter of the symmetric logarithmic derivative metric in every dimension. The identity follows by expanding $d_B^2(\rho, \rho + d\rho) = 2(1 - \operatorname{Tr}\sqrt{\sqrt{\rho}(\rho + d\rho)\sqrt{\rho}})$ to second order and solving the Lyapunov equation $(\rho + d\rho) L + L (\rho + d\rho) = 2 \, d\rho$ for the symmetric logarithmic derivative of $d\rho$: the expansion yields $\tfrac{1}{4} \operatorname{Tr}(\rho L^2)$ at any full-rank state \cite{hubner, braunstein-caves}. \Cref{prop:qubit-fid} verifies the identity by direct computation on qubit states, and the code of \cref{sec:computation} checks it numerically in dimensions two to four. The fidelity metric is therefore not a member of the normalized Petz family but a positive multiple of one.
   130	\end{definition}
   131	
   132	\begin{definition}[Ruppeiner metric]
   133	\label{def:ruppeiner}
   134	Let $S(U, V, N)$ be the entropy of a thermodynamic system with internal energy $U$, volume $V$, and particle number $N$. Physical entropy is homogeneous of degree one in its extensive variables, so the full Hessian in $(U, V, N)$ is singular along the extensive direction by the Gibbs-Duhem relation, and strict concavity in all extensive variables cannot hold. The Ruppeiner metric is defined on a two-dimensional slice: fix $N$ (as this paper does) or pass to specific variables, and set
   135	\begin{equation}
   136	g^{\mathrm{rup}}_{ij} = -\frac{\partial^2 S}{\partial X^i \partial X^j}
   137	\end{equation}
   138	in the remaining extensive coordinates $X^i$. Its scalar curvature $R$ is computed with the standard Ricci convention, in which the round two-sphere has $R = +2$; the convention of Ruppeiner \cite{ruppeiner} carries the opposite sign. The construction is that of Ruppeiner \cite{ruppeiner}; the metric of Weinhold \cite{weinhold} is the Hessian of internal energy and differs by a conformal factor in the standard thermodynamic setting.
   139	\end{definition}
   140	
   141	\begin{definition}[Entanglement wedge]
   142	\label{def:wedge}
   143	Fix a boundary spatial region $A$ of a conformal field theory state dual to a bulk asymptotically anti-de Sitter spacetime, and a Cauchy slice $\Sigma$. The surface $A \cup \gamma_A$ bounds a spatial homology region $\Sigma_A \subset \Sigma$, where $\gamma_A$ is the extremal surface homologous to $A$ (minimal in static slices) \cite{hrt}. The entanglement wedge $W(A)$ is the domain of dependence of $\Sigma_A$. Entanglement-wedge reconstruction is the statement that bulk operators localized in $W(A)$ can be represented by operators of the boundary subregion $A$.
   144	\end{definition}
   145	
   146	\begin{definition}[Geometric correspondence]
   147	\label{def:correspondence}
   148	A geometric correspondence assigns to data $D$ of a physical or statistical system a Riemannian geometry $G(D)$, and optionally a relation between the curvature of $G(D)$ and physical quantities of the system. The correspondence is a proposed dictionary until both assignments are theorems; each assignment must state its domain, its codomain, and the structure it preserves.
   149	\end{definition}
   150	
   151	\begin{remark}[Object schema]
   152	\label{rem:schema}
   153	A physical system is often recorded as a tuple $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ of state space, observables, dynamics, symmetry data, and composition rules. The statistical models and state spaces of this paper instantiate $X$ and, in the quantum setting, $\mathcal{O}$; the constructions of \cref{sec:reconstruction} concern recovery of $(X, \mathcal{O})$ from probe data. The tuple is a convenient schema, not a theorem, and no result below depends on its completeness.
   154	\end{remark}
   155	
   156	The information-geometric assignment $D \mapsto G(D)$ is a theorem in the settings of \crefrange{sec:classical}{sec:invariants}: statistical data carries a canonical or a chosen metric. The reverse assignment, curvature to physics, is a proposal in every setting examined here, and \cref{sec:correspondence} studies the pair.
   157	
   158	\section{Classical information geometry}
   159	\label{sec:classical}
   160	
   161	The Fisher metric of \cref{def:fisher} is the unique metric that is monotone in the sense of \cref{def:stochastic}. Monotonicity is elementary to prove; uniqueness is Chentsov's theorem and is recorded with its scope.
   162	
   163	\begin{lemma}[Fisher metric and relative entropy]
   164	\label{lem:kl}
   165	Let $p$ be an interior point of the simplex and let $u$ be a tangent vector at $p$ with $\sum_i u_i = 0$. For the Kullback-Leibler divergence $D(p + u \,\|\, p) = \sum_i (p_i + u_i) \log \frac{p_i + u_i}{p_i}$ one has
   166	\begin{equation}
   167	D(p + u \,\|\, p) = \frac{1}{2} g_p(u, u) + O(\|u\|^3).
   168	\end{equation}
   169	The Fisher metric is the second-order term of the relative entropy at the diagonal.
   170	\end{lemma}
   171	
   172	\begin{proof}
   173	Expand $\log(1 + u_i/p_i) = u_i/p_i - u_i^2 / (2 p_i^2) + O(\|u\|^3)$ in
   174	$D = \sum_i (p_i + u_i) \log(1 + u_i/p_i)$. The first-order terms cancel because $\sum_i u_i = 0$, and the second-order terms give $\sum_i (u_i^2/p_i - u_i^2 / (2 p_i)) = \frac{1}{2} \sum_i u_i^2 / p_i = \frac{1}{2} g_p(u, u)$.
   175	\end{proof}
   176	
   177	\Cref{lem:kl} explains the role of the Fisher metric as a ruler of distinguishability: it is the quadratic term of the divergence that measures how far a perturbed distribution is from the reference. The same quadratic form appears in the statistical estimation problem as the inverse asymptotic variance of efficient estimators. The quantum analogue of the lemma produces one specific member of the Petz family, not the whole family: expanding the Umegaki quantum relative entropy $D(\rho + X \,\|\, \rho)$ to second order gives the metric of the member $f_{\mathrm{bkm}}(t) = (t-1)/\log t$ (with $f_{\mathrm{bkm}}(1) = 1$ by continuity), the Bogoliubov-Kubo-Mori metric, while the quantum Cram\'er-Rao bound of quantum estimation singles out the symmetric logarithmic derivative member $f(t) = (1+t)/2$ \cite{braunstein-caves, petz-1996}.
   178	
   179	\begin{proposition}[Monotonicity of the Fisher metric]
   180	\label{prop:monotone}
   181	The Fisher metric is monotone under stochastic maps.
   182	\end{proposition}
   183	
   184	\begin{proof}
   185	Let $\varphi$ be stochastic and let $u$ be tangent at $p$, so $\sum_i u_i = 0$. The derivative of $p \mapsto \varphi p$ is $u \mapsto \varphi u$, and $\sum_j (\varphi u)_j = \sum_i u_i \sum_j \varphi_{ji} = 0$, so $D\varphi \cdot u = \varphi u$ is tangent at $\varphi p$. Write $q = \varphi p$, so $q_j = \sum_i \varphi_{ji} p_i$. Fix $j$ with $q_j > 0$ (if $q_j = 0$ then $\varphi_{ji} = 0$ for all $i$ and the term below is zero on both sides). By the Cauchy-Schwarz inequality applied with weights $\varphi_{ji}$,
   186	\begin{equation}
   187	(\varphi u)_j^2 = \Bigl(\sum_i \varphi_{ji} \frac{u_i}{\sqrt{p_i}} \sqrt{p_i}\Bigr)^2
   188	\leq \Bigl(\sum_i \varphi_{ji} \frac{u_i^2}{p_i}\Bigr) \Bigl(\sum_i \varphi_{ji} p_i\Bigr).
   189	\end{equation}
   190	Dividing by $q_j = \sum_i \varphi_{ji} p_i$ and summing over $j$ with $q_j > 0$ gives
   191	\begin{equation}
   192	\sum_j \frac{(\varphi u)_j^2}{q_j}
   193	\leq \sum_j \sum_i \varphi_{ji} \frac{u_i^2}{p_i}
   194	= \sum_i \frac{u_i^2}{p_i} \sum_j \varphi_{ji}
   195	= \sum_i \frac{u_i^2}{p_i},
   196	\end{equation}
   197	which is $g_{\varphi p}(\varphi u, \varphi u) \leq g_p(u, u)$.
   198	\end{proof}
   199	
   200	\begin{remark}[Worked monotonicity]
   201	\label{rem:worked-monotone}
   202	Take three outcomes, $p = (0.5, 0.3, 0.2)$, and the stochastic map $\varphi = \left(\begin{smallmatrix} 0.7 & 0.1 & 0.2 \\ 0.3 & 0.9 & 0.8 \end{smallmatrix}\right)$, which sends three outcomes to two and has unit column sums. Then $q = \varphi p = (0.42, 0.58)$, and for the tangent vector $u = (0.1, -0.05, -0.05)$ one computes
   203	\begin{equation}
   204	g_p(u, u) = \frac{0.01}{0.5} + \frac{0.0025}{0.3} + \frac{0.0025}{0.2} = \frac{49}{1200} \approx 0.040833,
   205	\end{equation}
   206	while $\varphi u = (0.055, -0.055)$ and $g_q(\varphi u, \varphi u) = 0.055^2 (1/0.42 + 1/0.58) = 121/9744 \approx 0.012418$. The map costs distinguishability, and the deficit is the slack in the Cauchy-Schwarz step of \cref{prop:monotone}. The computational check in \cref{sec:computation} repeats this comparison for two thousand random trials.
   207	\end{remark}
   208	
   209	\begin{theorem}[Chentsov]
   210	\label{thm:chentsov}
   211	On the probability simplices, the Fisher family is the unique family of Riemannian metrics, up to a single positive constant shared across dimensions, that is monotone under stochastic maps.
   212	\end{theorem}
   213	
   214	Chentsov proved this theorem in the formulation: smooth metric families invariant under congruent embeddings (Markov morphisms) are unique up to constant; Petz and Sud\'ar \cite{petz-sudar} state the equivalent contraction form used here, monotone under general stochastic maps. The two formulations are connected as follows: a congruent embedding and its stochastic inverse force invariance under invertible stochastic maps (permutations included), and the contraction inequality for general stochastic maps is the monotonicity of \cref{def:stochastic}. Smoothness of the metric tensor is assumed throughout, as in Chentsov's statement. Two scope points are essential. The constant is undetermined and shared: monotonicity pins the metric only up to scale, and the cross-dimensional maps of \cref{def:stochastic} are what force one constant across all $n$. The classical uniqueness has an operational reading. Monotonicity says statistical distinguishability does not increase under processing; uniqueness says there is one ruler for that distinguishability. A classification program for statistical systems can therefore treat the Fisher metric as classifying data without a choice problem. \Cref{sec:quantum} shows that this comfort does not survive quantization.
   215	
   216	\begin{remark}[Fisher geometry of the simplex]
   217	\label{rem:bernoulli}
   218	The Fisher metric on the interior of $\Delta_{n-1}$ is, up to scale, the round-sphere metric. Substitute $p_i = y_i^2$ with $y_i > 0$; the constraint $\sum_i p_i = 1$ becomes $\sum_i y_i^2 = 1$, and $\sum_i (dp_i)^2 / p_i = 4 \sum_i (dy_i)^2$, so the metric is four times the round metric of the unit sphere restricted to the positive orthant of $S^{n-1}$. For $n \geq 3$ the sectional curvature is $1/4$ in this normalization, and the geodesic distance between $p$ and $p'$ is $2 \arccos \sum_i \sqrt{p_i p'_i}$. For the Bernoulli model ($n = 2$) the state space is an arc of a circle of radius 2, and in the coordinate $q = \log(p_1/p_2)$ the line element is $(dq)^2 / (4 \cosh^2(q/2))$.
   219	\end{remark}
   220	
   221	\section{Quantum monotone metrics}
   222	\label{sec:quantum}
   223	
   224	Petz and Sud\'ar \cite{petz-sudar} classified the monotone metrics of \cref{def:quantum-monotone} on finite-dimensional state spaces. The answer is parametric, not unique.
   225	
   226	\begin{theorem}[Petz-Sud\'ar]
   227	\label{thm:petz-sudar}
   228	Monotone metric families $\{g^{(d)}\}_{d \geq 2}$ in the sense of \cref{def:quantum-monotone} correspond exactly to functions $f : (0, \infty) \to (0, \infty)$ that are operator monotone of all matrix orders and satisfy $f(t) = t f(1/t)$, by the formula \eqref{eq:petz} in each dimension \cite{petz-1996, petz-sudar-jmp}. The correspondence is a bijection after the normalization $f(1) = 1$, which is equivalent to restricting to the Fisher value on diagonal tangent vectors; without the normalization, metrics correspond to $f$ only up to a positive constant. In particular the symmetric logarithmic derivative metric of \cref{def:sld} corresponds to $f(t) = (1+t)/2$, and there are infinitely many monotone metrics.
   229	\end{theorem}
   230	
   231	The correspondence in this normalization is the one computed below: for $f(t) = (1+t)/2$ the formula \eqref{eq:petz} gives $g_{\rho}^{f}(X,X) = \sum_{i,j} 2 |X_{ij}|^2 / (\lambda_i + \lambda_j)$, which is exactly $\operatorname{Tr}(X L)$ with $X = (\rho L + L\rho)/2$, since in the eigenbasis the defining equation reads $X_{ij} = L_{ij} (\lambda_i + \lambda_j)/2$. The word ``correspond'' in the theorem is exact in both directions: every operator monotone $f$ with $f(t) = t f(1/t)$ produces a monotone metric, and every monotone metric arises this way. The classification is complete as a parameterization, and the parameter is a function rather than a finite list.
   232	
   233	\begin{proposition}[Non-uniqueness on qubit states]
   234	\label{prop:nonunique}
   235	Let $\rho = \operatorname{diag}(3/4, 1/4)$ and let $X = \sigma_x / 2$, $Y = \sigma_z / 2$ be the transverse and radial tangent vectors at $\rho$ in Bloch coordinates. For the symmetric logarithmic derivative metric,
   236	\begin{equation}
   237	g^{\mathrm{sld}}_{\rho}(X, X) = 1, \qquad g^{\mathrm{sld}}_{\rho}(Y, Y) = \frac{4}{3}.
   238	\end{equation}
   239	For the Wigner-Yanase metric, given by \eqref{eq:petz} with $f_{\mathrm{wy}}(t) = \tfrac{1}{4}(1 + \sqrt{t})^2$,
   240	\begin{equation}
   241	g^{\mathrm{wy}}_{\rho}(X, X) = 4(2 - \sqrt{3}), \qquad g^{\mathrm{wy}}_{\rho}(Y, Y) = \frac{4}{3}.
   242	\end{equation}
   243	The radial-to-transverse ratio is $4/3$ for the symmetric logarithmic derivative metric and $(2 + \sqrt{3})/3 \neq 4/3$ for the Wigner-Yanase metric, so the two metrics are not proportional. Quantum monotone metrics are not unique, even up to a constant.
   244	\end{proposition}
   245	
   246	\begin{proof}
   247	For $X = \sigma_x / 2$ the matrix entries are $X_{12} = X_{21} = 1/2$ and $X_{11} = X_{22} = 0$. The symmetric logarithmic derivative equation $X = (\rho L + L \rho)/2$ for off-diagonal entries reads $X_{ij} = L_{ij}(\lambda_i + \lambda_j)/2$, so $L_{12} = L_{21} = 1/2 \cdot 2 / 1 = 1$ and $L = \sigma_x$. Then $g^{\mathrm{sld}}(X, X) = \operatorname{Tr}(X L) = \operatorname{Tr}(\sigma_x^2 / 2) = 1$. For $Y = \sigma_z / 2$ the derivative is diagonal and $L = \operatorname{diag}\bigl((1/2)/(3/4), (-1/2)/(1/4)\bigr) = \operatorname{diag}(2/3, -2)$, so $g^{\mathrm{sld}}(Y, Y) = \operatorname{Tr}(Y L) = (1/2)(2/3) + (-1/2)(-2) = 4/3$.
   248	
   249	For the Wigner-Yanase metric the coefficient of $|X_{ij}|^2$ in \eqref{eq:petz} is $1/(\lambda_i f_{\mathrm{wy}}(\lambda_j/\lambda_i)) = 4/(\sqrt{\lambda_i} + \sqrt{\lambda_j})^2$. With $\lambda_1 = 3/4$, $\lambda_2 = 1/4$ the transverse value is $2 \cdot (1/4) \cdot 4 / (\sqrt{3}/2 + 1/2)^2 = 4 / (2 + \sqrt{3}) = 4(2 - \sqrt{3})$, where $(\sqrt{3}+1)^2 = 4 + 2\sqrt{3}$ and $4 - 3 = 1$ were used. For diagonal $Y$ the two diagonal terms give $4(1/2)^2 / (2\sqrt{3}/2)^2 + 4(-1/2)^2 / (2 \cdot 1/2)^2 = 1/3 + 1 = 4/3$. The ratio $(4/3)/(4(2-\sqrt{3})) = (2+\sqrt{3})/3$ is not $4/3$, since $2 + \sqrt{3} \neq 4$.
   250	\end{proof}
   251	
   252	The failure of uniqueness is structural, not an artifact of the qubit. The Petz family is infinite in every dimension $d \geq 2$, and the ambiguity appears already in the two-level system. Any physical statement of the form ``the geometry of the quantum state space is $G$'' must therefore name $f$, or must derive $f$ from independent principles. This constraint carries into every proposed gravity-information dictionary in \cref{sec:correspondence}.
   253	
   254	\begin{remark}[The parameter as data]
   255	\label{rem:parameter}
   256	The classifying datum of a monotone metric is the function $f$, subject to $f(t) = t f(1/t)$; the condition is the symmetry of the Petz formula under $i \leftrightarrow j$, and the normalization $f(1) = 1$ fixes the scale that Chentsov's theorem leaves free. Three members of the family recur in this paper: $f(t) = (1+t)/2$ (symmetric logarithmic derivative), $f_{\mathrm{wy}}(t) = \tfrac{1}{4}(1+\sqrt{t})^2$ (Wigner-Yanase), and $f_{\mathrm{bkm}}(t) = (t-1)/\log t$ (Bogoliubov-Kubo-Mori). Distinct $f$ give distinct metrics, so the parameter is invariant content of a quantum state system, in the same sense that the dimension vector is invariant content of a finite-dimensional $C^*$-algebra. Partial selection principles exist: the expansion of \cref{lem:kl} selects $f_{\mathrm{bkm}}$, and quantum estimation selects $f(t) = (1+t)/2$ \cite{braunstein-caves}. In holography the second-order relative entropy of boundary perturbations equals the bulk canonical energy \cite{lashkari-vr}, which by \cref{lem:kl} selects the Bogoliubov-Kubo-Mori member for that quantity; distinct holographic questions can invoke distinct members. No principle selects a member for a general gravity-information dictionary.
   257	\end{remark}
   258	
   259	Uniqueness has one sharp surviving locus.
   260	
   261	\begin{proposition}[Commutative locus]
   262	\label{prop:commutative}
   263	For every normalized operator monotone $f$ and every full-rank diagonal $\rho = \sum_i \lambda_i |i\rangle\langle i|$, the restriction of $g^{f}$ to diagonal tangent vectors is the Fisher value:
   264	\begin{equation}
   265	g^{f}_{\rho}(X, X) = \sum_i \frac{X_{ii}^2}{\lambda_i}.
   266	\end{equation}
   267	More generally the restriction of any monotone metric to commuting states is a classical monotone metric, hence $c \cdot g^{\mathrm{fisher}}$ for some $c > 0$ by Chentsov's theorem (\cref{thm:chentsov}); in the Petz family $c = 1/f(1)$, so the normalization $f(1) = 1$ forces $c = 1$. Every normalized monotone metric restricts to the Fisher metric on the commutative locus.
   268	\end{proposition}
   269	
   270	\begin{proof}
   271	For diagonal $X$ only the terms $i = j$ survive in \eqref{eq:petz}, and $f(1) = 1$ gives $g^f(X,X) = \sum_i X_{ii}^2 / (\lambda_i f(1)) = \sum_i X_{ii}^2 / \lambda_i$, for every dimension $d$. For the general statement, let $\varphi$ be a stochastic map of diagonal distributions. The pinching channel $\Phi(A) = \sum_{i,j} \varphi_{ji} \langle i | A | i \rangle |j\rangle\langle j|$, with Kraus operators $K_{ji} = \sqrt{\varphi_{ji}} |j\rangle\langle i|$, is completely positive and trace-preserving, maps diagonal states to diagonal states, and restricts to $p \mapsto \varphi p$. Monotonicity of the quantum metric under $\Phi$ restricts to monotonicity of the induced classical metric, so Chentsov's theorem applies and the restriction is $c \cdot g^{\mathrm{fisher}}$. The direct computation above fixes $c = 1/f(1)$ for the Petz family.
   272	\end{proof}
   273	
   274	\begin{remark}[Commutative values]
   275	\label{rem:commutative}
   276	For $\rho = \operatorname{diag}(3/4, 1/4)$ and $Y = \sigma_z/2$ the value $g(Y, Y) = 4/3$ of \cref{prop:nonunique} is the Fisher value $\sum_i X_{ii}^2 / \lambda_i = (1/2)^2/(3/4) + (-1/2)^2/(1/4) = 4/3$, for both normalized metrics. The two computations agree on the diagonal, as \cref{prop:commutative} requires, and disagree off it.
   277	\end{remark}
   278	
   279	\begin{remark}[Qutrit values]
   280	\label{rem:qutrit}
   281	At the qutrit state $\rho = \operatorname{diag}(0.5, 0.3, 0.2)$ with the off-diagonal tangent $X_{13} = X_{31} = 1/2$, the Petz formula gives $g^{\mathrm{sld}}(X, X) = 10/7 \approx 1.4286$ and $g^{\mathrm{wy}}(X, X) \approx 1.5010$, while the fidelity metric gives $\approx 0.3571$ by the identity of \cref{def:fidelity}. On the diagonal tangent $Y = \operatorname{diag}(0.2, -0.1, -0.1)$ both normalized metrics give the Fisher value $0.04/0.5 + 0.01/0.3 + 0.01/0.2 = 49/300 \approx 0.163333$, while the fidelity metric gives $\approx 0.040833$. The pattern of \cref{prop:nonunique,prop:commutative} holds one dimension up, and the computations of \cref{sec:computation} verify both statements numerically.
   282	\end{remark}
   283	
   284	\section{Geometry of the qubit state space}
   285	\label{sec:qubit}
   286	
   287	The qubit state space is the smallest quantum system and the smallest place where the Petz family is nontrivial. Its geometry is computable in closed form, and it exhibits the two themes of the paper: a quantum state space carries a canonical constant-curvature geometry once $f$ is chosen, and the choice of $f$ matters off the commutative locus. The computations of this section are expository; the geometry of state spaces and the fidelity constructions are documented in the information-geometric literature \cite{hubner, braunstein-caves, petz-1996}, and the proofs are given in full because the paper uses the statements as premises.
   288	
   289	Write $\rho = (I + \vec{r} \cdot \vec{\sigma})/2$ with $|\vec{r}| < 1$, so $\mathcal{D}_2^{\circ}$ is the open unit ball of $\mathbb{R}^3$ and the eigenvalues are $\lambda_{\pm} = (1 \pm |\vec{r}|)/2$.
   290	
   291	\begin{proposition}[Symmetric logarithmic derivative geometry of the qubit]
   292	\label{prop:qubit-sld}
   293	In Bloch coordinates the symmetric logarithmic derivative metric is
   294	\begin{equation}
   295	\label{eq:qubit-sld}
   296	g^{\mathrm{sld}} = |d\vec{r}|^2 + \frac{(\vec{r} \cdot d\vec{r})^2}{1 - |\vec{r}|^2}.
   297	\end{equation}
   298	In spherical coordinates $|\vec{r}| = r = \sin\chi$ this becomes $g^{\mathrm{sld}} = (d\chi)^2 + \sin^2\!\chi \, (d\Omega)^2$ with $\chi \in (0, \pi/2)$: the open state space $\mathcal{D}_2^{\circ}$ is isometric to an open hemisphere of the round three-sphere of radius one, of constant sectional curvature one.
   299	\end{proposition}
   300	
   301	\begin{proof}
   302	By rotational invariance of $g^{\mathrm{sld}}$ it suffices to evaluate radial and transverse directions at $\vec{r} = (0, 0, r)$. A tangent vector $X = (d\vec{r} \cdot \vec{\sigma})/2$ has entries $X_{11} = dr_3/2$, $X_{22} = -dr_3/2$, $X_{12} = (dr_1 - i\, dr_2)/2$, $X_{21} = (dr_1 + i\, dr_2)/2$ in the orthonormal eigenbasis of $\rho$. From \cref{thm:petz-sudar} the diagonal entries of $g^{\mathrm{sld}}$ contribute $X_{11}^2 / \lambda_+ + X_{22}^2 / \lambda_-$ and the off-diagonal entries contribute $2 \cdot 2 |X_{12}|^2 / (\lambda_+ + \lambda_-)$. With $\lambda_{\pm} = (1 \pm r)/2$ one gets $1/\lambda_+ + 1/\lambda_- = 4/(1 - r^2)$ and $\lambda_+ + \lambda_- = 1$, so
   303	\begin{equation}
   304	g^{\mathrm{sld}} = (dr_1^2 + dr_2^2) + \frac{dr_3^2}{1 - r^2} = |d\vec{r}|^2 + \frac{(\vec{r} \cdot d\vec{r})^2}{1 - |\vec{r}|^2}.
   305	\end{equation}
   306	Setting $r = \sin\chi$ turns $(dr)^2/(1 - r^2) + r^2 (d\Omega)^2$ into $(d\chi)^2 + \sin^2\!\chi \, (d\Omega)^2$, the round metric of radius one, on the chart $\chi \in (0, \pi/2)$; the spherical chart is singular at the center, which is covered by the smooth embedding $\vec{r} \mapsto (\vec{r}, \sqrt{1 - |\vec{r}|^2}) \in S^3 \subset \mathbb{R}^4$. The distance from the center to the pure-state boundary is $\pi/2$.
   307	\end{proof}
   308	
   309	The fidelity metric of \cref{def:fidelity} is one quarter of this metric on the qubit.
   310	
   311	\begin{proposition}[Fidelity metric of the qubit]
   312	\label{prop:qubit-fid}
   313	On $\mathcal{D}_2^{\circ}$ the fidelity metric satisfies $g^{\mathrm{fid}} = \tfrac{1}{4} g^{\mathrm{sld}}$. Consequently the open state space with the fidelity metric is an open hemisphere of the round three-sphere of radius one half, of constant sectional curvature four.
   314	\end{proposition}
   315	
   316	\begin{proof}
   317	Both metrics are invariant under the rotations of the Bloch ball induced by unitary conjugation, so at each $\vec{r}$ the rotation group fixing $\vec{r}$ forces the cross term between radial and transverse directions to vanish and fixes transverse isotropy, and the quadratic form is determined by its radial and transverse values. For the transverse direction, set $\sigma = \rho + \varepsilon X$ with $X = \sigma_x/2$ and $\rho = \operatorname{diag}(\lambda_+, \lambda_-)$. Then $\sqrt{\rho}\, \sigma \sqrt{\rho} = \left(\begin{smallmatrix} \lambda_+^2 & \tfrac{\varepsilon}{2}\sqrt{\lambda_+ \lambda_-} \\ \tfrac{\varepsilon}{2}\sqrt{\lambda_+ \lambda_-} & \lambda_-^2 \end{smallmatrix}\right)$, whose determinant is $\lambda_+ \lambda_- (\lambda_+ \lambda_- - \varepsilon^2/4)$. Since $(\operatorname{Tr}\sqrt{M})^2 = \operatorname{Tr} M + 2\sqrt{\det M}$, one gets $\operatorname{Tr}\sqrt{\sqrt{\rho}\,\sigma\sqrt{\rho}} = 1 - \varepsilon^2/8 + O(\|\varepsilon X\|^3)$ and $d_B^2 = 2(1 - \sqrt{F}) = \varepsilon^2/4 + O(\|\varepsilon X\|^3)$, matching $\tfrac{1}{4} g^{\mathrm{sld}}(X, X) = 1/4$ from \cref{prop:qubit-sld} at every $r$. For the radial direction the states commute and the fidelity reduces to the classical affinity $\sum_i \sqrt{p_i q_i}$ on the Bernoulli pair $p = ((1+r)/2, (1-r)/2)$; the expansion $\sum_i \sqrt{p_i (p_i + \delta_i)} = 1 - \sum_i \delta_i^2 / (8 p_i) + O(\|\delta\|^3)$ for $\sum_i \delta_i = 0$ gives $d_B^2 = \sum_i \delta_i^2 / (4 p_i)$, one quarter of the classical Fisher value, and the classical Fisher value is $g^{\mathrm{sld}}$ on the diagonal by \cref{prop:commutative}. The curvature claim follows from \cref{prop:qubit-sld} and the constant factor $1/4$, which multiplies sectional curvatures by $4$.
   318	\end{proof}
   319	
   320	\begin{remark}[Normalization conventions]
   321	\label{rem:conventions}
   322	The factor between the fidelity metric and the symmetric logarithmic derivative metric depends on the normalization of the fidelity, and conventions differ across sources. In the convention of \cref{def:fidelity}, where $d_B^2 = 2(1-\sqrt{F})$, the fidelity metric of the qubit is one quarter of the symmetric logarithmic derivative metric, and the corresponding sphere has radius $1/2$ rather than $1$. The intrinsic statements of \cref{prop:qubit-sld,prop:qubit-fid} are convention-free up to this constant: both geometries are round three-spheres up to the open-hemisphere restriction, and the constant relates their radii. Any comparison of curvature values across sources must first fix the normalization.
   323	\end{remark}
   324	
   325	\begin{remark}[Constant curvature without spacetime]
   326	\label{rem:sphere}
   327	\Cref{prop:qubit-sld,prop:qubit-fid} are statements about information geometry. The round three-sphere appearing here is the geometry of statistical distinguishability on a two-level quantum system; it is not a spacetime and no claim about spacetime dimension or signature follows. The example exists to separate the two readings of ``geometric correspondence'': state spaces carry Riemannian geometry by construction, and whether that geometry is physical is a further question.
   328	\end{remark}
   329	
   330	\begin{remark}[Geodesic distance on the qubit]
   331	\label{rem:distance}
   332	In the coordinates of \cref{prop:qubit-sld} the geodesic distance from the maximally mixed state $\vec{r} = 0$ to the state $\vec{r} = r \vec{n}$ is $\chi = \arcsin r$, since $g^{\mathrm{sld}} = (d\chi)^2 + \sin^2\!\chi \, (d\Omega)^2$ and radial geodesics of the round sphere have length equal to the angle. Pure states sit at distance $\pi/2$ from the center, and the diameter of the interior is $\pi$: the space of qubit states is a hemisphere of finite diameter carried by statistical distinguishability, not by any spacetime interpretation. The computational check in \cref{sec:computation} compares this distance profile against the closed form.
   333	\end{remark}
   334	
   335	\section{Information geometry as invariant data}
   336	\label{sec:invariants}
   337	
   338	The classification program identifies objects by invariants, in the spirit of the companion data that practitioners use to tell objects apart in a completed classification. For statistical systems the candidate invariants are the sample-space size, the isometry class of the Fisher geometry, and the curvature data of statistical submodels.
   339	
   340	\begin{corollary}[Fisher geometry of the full simplex]
   341	\label{cor:homogeneity}
   342	The Fisher metric on the interior of $\Delta_{n-1}$ is locally isometric to the round sphere of radius two, with sectional curvature $1/4$ for $n \geq 3$, and the arc of \cref{rem:bernoulli} for $n = 2$. The isometry group of the full model is the finite group of coordinate permutations. Two statistical models defined on the full simplex with the same number of outcomes are isometric as Riemannian manifolds, and a permutation of outcomes is an isometry.
   343	\end{corollary}
   344	
   345	\begin{proof}
   346	The substitution $p_i = y_i^2$ of \cref{rem:bernoulli} is an isometry onto the positive orthant of the round sphere of radius two. A global isometry of the connected constant-curvature orthant extends uniquely to an ambient isometry of its metric completion $S^{n-1}(2)$, and such an isometry permutes the $n$ extreme rays of the orthant; the orthogonal maps permuting those rays are exactly the permutation matrices. Permutations preserve $\sum_i p_i = 1$ and the metric $\sum_i (dp_i)^2 / p_i$ directly, so the isometry group is the permutation group.
   347	\end{proof}
   348	
   349	\Cref{cor:homogeneity} is a classification statement of the trivial kind: the full models of a fixed sample size form one isometry class, and the only invariant is $n$. The classification content of information geometry therefore lives in statistical submodels.
   350	
   351	\begin{definition}[Statistical submodel]
   352	\label{def:submodel}
   353	A statistical submodel is a smooth embedding $i : M' \to \Delta_{n-1}^{\circ}$ of a lower-dimensional manifold $M'$ into the simplex, with the pullback metric $g' = i^{*} g^{\mathrm{fisher}}$. The intrinsic and extrinsic curvature invariants of $(M', g')$ are invariants of the model. Exponential families are the canonical submodels.
   354	\end{definition}
   355	
   356	\begin{remark}[Embedded two-outcome model]
   357	\label{rem:embedded}
   358	Inside the three-outcome simplex consider $p(\theta) = (\theta, (1-\theta)/2, (1-\theta)/2)$ for $\theta \in (0, 1)$. The tangent vector is $p'(\theta) = (1, -1/2, -1/2)$, and the induced metric is
   359	\begin{equation}
   360	g' = \Bigl( \frac{1}{\theta} + \frac{1/4}{(1-\theta)/2} + \frac{1/4}{(1-\theta)/2} \Bigr) d\theta^2
   361	= \frac{(d\theta)^2}{\theta(1-\theta)},
   362	\end{equation}
   363	exactly the Fisher metric of the standalone two-outcome model of \cref{rem:bernoulli}. The embedding is isometric onto its image, so intrinsic geometry cannot detect the sample-space size: two models with different numbers of outcomes can share a submodel geometry. The induced metric is unchanged here because the embedding is a sufficient-statistic Markov map. Among linear stochastic maps, pullback preserves the Fisher metric exactly when the map is a sufficient-statistic embedding, and general smooth embeddings can reproduce the same intrinsic metric without being Markov maps, so intrinsic geometry alone does not detect the embedding. Extrinsic data of the embedding is additional invariant content.
   364	\end{remark}
   365	
   366	\begin{remark}[Classifying data for statistical models]
   367	\label{rem:family-v}
   368	For statistical models (probability and measure structures), the Fisher metric is the natural classifying invariant in the classical case. \Cref{cor:homogeneity} and \cref{def:submodel} make that naming precise: the invariant is the metric up to isometry, trivial on full models and rich on submodels. This is the opposite of the symplectic situation, where local classification is trivial by Darboux's theorem and all content is global. Information geometry has local content and uses it. On the quantum side the invariant data must additionally name the member $f$ of the Petz family (\cref{prop:nonunique}), so the classifying data of a quantum state system is the pair (state space, $f$) and never the state space alone.
   369	\end{remark}
   370	
   371	\begin{remark}[Classification status of statistical models]
   372	\label{rem:status}
   373	The evidence of this paper supports the following summary. Classical statistical models of fixed sample size are classified by \cref{cor:homogeneity} up to isometry of their full Fisher geometry, and statistical submodels carry curvature invariants without a complete classification being on record. Quantum state systems are classified as metric spaces only after the parameter $f$ is fixed, and no physical principle in this paper fixes it. Statistical models are therefore a worked example of a general pattern in classification: a complete island (Chentsov, Petz-Sud\'ar), a trivial stratum (full simplices), and open content (submodels, quantum parameter selection).
   374	\end{remark}
   375	
   376	\section{Reconstruction from probes}
   377	\label{sec:reconstruction}
   378	
   379	The second proved pattern available to a gravity-information program is reconstruction: an object recovered from data about its relationships. Three classical results fix the pattern, and one quantum-information result applies it to entanglement.
   380	
   381	\begin{theorem}[Gelfand-Naimark and Gelfand duality]
   382	\label{thm:gelfand}
   383	Every commutative unital $C^*$-algebra is isometrically $*$-isomorphic to $C(X)$ for a compact Hausdorff space $X$, its Gelfand spectrum; contravariantly, the categories of commutative unital $C^*$-algebras and of compact Hausdorff spaces are dual \cite{gn}. In particular the space $X$ is recovered from the algebra of observables $\mathcal{O} = C(X)$ alone.
   384	\end{theorem}
   385	
   386	\begin{theorem}[Stone duality]
   387	\label{thm:stone}
   388	Boolean algebras are dual to compact totally disconnected Hausdorff spaces \cite{stone}; the space is recovered from the algebra of clopen sets.
   389	\end{theorem}
   390	
   391	These theorems are classification-grade only in the commutative setting: there $X$ is determined by $\mathcal{O}$ up to homeomorphism. The noncommutative Gelfand-Naimark theorem embeds an arbitrary $C^*$-algebra into the operators of some Hilbert space, which is a representation theorem, not a classification. Reconstruction of a state space from probe data is weaker than classification of all state spaces, and this distinction is the one the classification program must preserve.
   392	
   393	\begin{definition}[Probe data and reconstruction]
   394	\label{def:probe}
   395	Probe data of an object $P$ is a family of measurements or relationships $\{\phi_i(P)\}$ indexed by probes $\phi_i$; a reconstruction theorem assigns to the probe data an object $\hat{P}$ together with an isomorphism $\hat{P} \cong P$ in a stated category. The theorem is classification-grade only when the probes are a complete invariant, that is, when $\hat{P} \cong \hat{Q}$ implies $P \cong Q$ in the stated category for all objects in scope.
   396	\end{definition}
   397	
   398	\begin{remark}[Reconstruction pattern]
   399	\label{rem:pattern}
   400	\Cref{thm:gelfand,thm:stone,thm:dhw} are instances of \cref{def:probe}: Gelfand spectrum from characters, Stone space from clopen sets, bulk operators from boundary subregion algebras. In each case the probes are exact within scope, and in each case the theorem recovers structure rather than producing it. No instance recovers dynamics, and none is a classification theorem for the ambient category.
   401	\end{remark}
   402	
   403	\begin{theorem}[Entanglement-wedge reconstruction, Dong-Harlow-Wall]
   404	\label{thm:dhw}
   405	Let a boundary region $A$ and a code subspace of states be given in the holographic setting, with bulk geometry dual to a state in that subspace. Every bulk operator localized in the entanglement wedge $W(A)$ can be reconstructed as an operator of the boundary subregion $A$ acting on the code subspace; the reconstruction preserves expectation values on that subspace \cite{dhw}. The result is a theorem of quantum information theory (quantum error correction and relative entropy), proved under the stated hypotheses of the holographic code setup.
   406	\end{theorem}
   407	
   408	The theorem assumes its hypotheses strictly: a code subspace and an entanglement-wedge structure are given, and no bulk geometry, field equation, or code subspace is derived from boundary data. It proves exact operator recovery inside a specified wedge, which is a reconstruction theorem in the sense of \cref{def:probe} (structure recovered from probe data, here boundary subregion algebras). The mechanism is quantum error correction: the same bulk operator is represented on several boundary subregions and the representations agree on the code subspace, the algebraic content of complementary recovery. The recovery is exact within the assumed setting.
   409	
   410	\begin{remark}[Yoneda qualification]
   411	\label{rem:yoneda}
   412	Relational determination of objects is the categorical form of the reconstruction pattern: the functor of points $\operatorname{Hom}(-, P)$ determines $P$ up to isomorphism in a locally small category. A standing qualification governs all such arguments here: ``Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.'' Nothing in \cref{thm:gelfand,thm:stone,thm:dhw} lifts object recovery to physical equivalence or to a classification of physical systems.
   413	\end{remark}
   414	
   415	A parallel line of work establishes representability of categorical supermaps whenever a theory has suitable channel-state duality \cite{hefford-wilson, whh}. Whether that line unifies with the Gelfand-Stone-Naimark pattern into one principle is open, and nothing here depends on such a unification.
   416	
   417	\section{Entanglement and emergent geometry}
   418	\label{sec:entanglement}
   419	
   420	The proposals connecting entanglement to geometry come in three strengths, and keeping them apart is the substance of this section.
   421	
   422	\begin{remark}[Ryu-Takayanagi proposal]
   423	\label{rem:rt}
   424	For a boundary region $A$ in a state dual to a bulk, the entanglement entropy $S(A)$ is proposed \cite{rt} to equal the area of the extremal surface homologous to $A$, in natural units $\hbar = c = 1$ reading $S(A) = \operatorname{Area}(\gamma_A)/(4G_N)$, with quantum corrections given by the generalized entropy. The formula is proposed in \cite{rt}, where it is checked exactly in AdS$_3$ with a two-dimensional conformal field theory, and derived for spherical vacuum regions in any dimension by replica and modular methods \cite{chc}. The static formula follows from gravitational replica methods \cite{lm}; the covariant formula with extremal surfaces was proposed in \cite{hrt} and derived in \cite{dlr}; quantum extremal surfaces extend the prescription beyond the classical regime \cite{ew}. For general regions and excited states the formula remains a proposal, and no derivation independent of AdS/CFT is on record.
   425	\end{remark}
   426	
   427	\begin{remark}[Entanglement and connectivity]
   428	\label{rem:vr}
   429	Van Raamsdonk's argument \cite{vr} observes that disentangling two boundary degrees of freedom in a holographic state pinches the bulk geometry apart, and proposes that spacetime connectivity is built from entanglement. The reasoning is an argument from controlled examples and limiting cases; it is not a derivation of the metric from entanglement data.
   430	\end{remark}
   431	
   432	\begin{remark}[Tensor-network models]
   433	\label{rem:happy}
   434	The holographic error-correcting codes of Pastawski, Yoshida, Harlow, and Preskill \cite{happy} realize a discrete analogue of the Ryu-Takayanagi formula and of negative tripartite information inside exactly solvable tensor networks. These are toy models: they demonstrate that the information-theoretic mechanisms are internally consistent, and they carry no evidential weight about actual AdS/CFT.
   435	\end{remark}
   436	
   437	The entropy quantities in these remarks are the standard ones. For a boundary state $\rho$ on a union of pairwise disjoint regions and a subregion $A$, the reduced state is $\rho_A = \operatorname{Tr}_{\bar{A}} \rho$ and the entanglement entropy is $S(A) = -\operatorname{Tr}(\rho_A \log \rho_A)$; the mutual information is $I(A:B) = S(A) + S(B) - S(A \cup B)$; the tripartite information is $I(A:B:C) = I(A:B) + I(A:C) - I(A:BC)$, which expands to $S(A) + S(B) + S(C) - S(A \cup B) - S(A \cup C) - S(B \cup C) + S(A \cup B \cup C)$ and is invariant under all permutations of $A$, $B$, $C$. Strong subadditivity reads $S(A \cup B) + S(B \cup C) \geq S(B) + S(A \cup B \cup C)$, and the monogamy of mutual information reads $I(A:B:C) \leq 0$. In the holographic setting the entropies are the areas of minimal surfaces, and the question of which linear inequalities those areas satisfy is the question of the entropy cone.
   438	
   439	\begin{theorem}[Holographic entropy cone]
   440	\label{thm:cone}
   441	In static holographic settings with $N$ boundary subregions of a state purified by a complement \cite{bao}, the complete linear entropy inequalities for $N = 2, 3, 4$ are generated by subadditivity, the Araki-Lieb inequalities, and monogamy of mutual information. For $N = 5$ five further symmetry orbits of five-party inequalities, including the cyclic five-party inequality, are required, and the resulting description is complete \cite{hc5}. For six and more regions the complete inequality set is unknown. For each fixed $N$ there are only finitely many independent inequalities.
   442	\end{theorem}
   443	
   444	\Cref{thm:cone} is a classification result of the kind the program seeks: finite, complete lists of constraints, proved, with sharp scope boundaries. Completeness holds for at most five regions and is open beyond.
   445	
   446	\begin{remark}[Worked cone constraints]
   447	\label{rem:cone-worked}
   448	Consider four regions with entropies $S(A) = S(B) = S(C) = S(D) = 2.0$, every two-region union $3.5$, every three-region union $4.5$, and $S(A \cup B \cup C \cup D) = 5.0$, in arbitrary units. The four-region state is mixed and is purified by an environment region of entropy $5.0$, so the Araki-Lieb inequality $|S(A \cup B \cup C) - S(D)| \leq S(A \cup B \cup C \cup D)$ reads $2.5 \leq 5.0$ and holds. Strong subadditivity in the form $S(A \cup B) + S(B \cup C) \geq S(B) + S(A \cup B \cup C)$ reads $3.5 + 3.5 \geq 2.0 + 4.5$, which holds. The monogamy of mutual information in the form $I(A:B) + I(A:C) \leq I(A:BC)$ reads $(2.0 + 2.0 - 3.5) + (2.0 + 2.0 - 3.5) \leq 2.0 + 3.5 - 4.5$, that is $0.5 + 0.5 \leq 1.0$, which holds at equality. The cone of \cref{thm:cone} is exactly the set of entropy vectors satisfying all such inequalities simultaneously; the example illustrates the constraints and proves nothing.
   449	\end{remark}
   450	
   451	What the section establishes is a gradient. Entanglement-wedge reconstruction (\cref{thm:dhw}) and the entropy cone (\cref{thm:cone}) are theorems. The entropy formula itself (\cref{rem:rt}) is a proposal with derived special cases. The emergence of geometry from entanglement (\cref{rem:vr}) is an argument. Toy models (\cref{rem:happy}) demonstrate mechanisms, not nature.
   452	
   453	\section{Thermodynamic geometry}
   454	\label{sec:thermo}
   455	
   456	The oldest working dictionary between information metrics and physical curvature is thermodynamic. Weinhold proposed the Hessian of internal energy as a metric on equilibrium states \cite{weinhold}; Ruppeiner proposed the negative Hessian of entropy and read its curvature as a measure of microscopic interaction \cite{ruppeiner}. The Ruppeiner metric of \cref{def:ruppeiner} is, up to sign convention and a conformal factor, the Fisher metric of thermodynamic fluctuation theory, so the dictionary is an instance of information geometry in physical coordinates. The proposal that Einstein's equations are an equation of state of this thermodynamic structure \cite{jacobson} is the sharpest form of the gravity-thermodynamics link on record, and it is a derivation conditional on the horizon thermodynamics it assumes.
   457	
   458	\begin{proposition}[Ideal gas]
   459	\label{prop:ideal-gas}
   460	For the ideal gas with entropy $S(U, V, N) = Nk \bigl(c_v \log U + \log V - (c_v + 1) \log N + \text{const}\bigr)$ at fixed $N$ and heat capacity coefficient $c_v$, the Ruppeiner metric in the coordinates $(U, V)$ is
   461	\begin{equation}
   462	g^{\mathrm{rup}} = Nk \left( c_v \frac{(dU)^2}{U^2} + \frac{(dV)^2}{V^2} \right),
   463	\end{equation}
   464	which is flat: its scalar curvature vanishes identically.
   465	\end{proposition}
   466	
   467	\begin{proof}
   468	The mixed second derivatives of $S$ vanish, $-\partial^2 S / \partial U^2 = Nk c_v/U^2$, and $-\partial^2 S / \partial V^2 = Nk/V^2$. In the coordinates $y = \sqrt{c_v} \log U$ and $z = \log V$ the metric becomes $Nk ((dy)^2 + (dz)^2)$, the Euclidean metric, so the Riemann tensor vanishes and $R = 0$.
   469	\end{proof}
   470	
   471	\Cref{prop:ideal-gas} is the flat baseline of the dictionary: the ideal gas has no microscopic interactions to diagnose, its entropy is separable in the coordinates $(U, V)$ at fixed $N$, and its Ruppeiner geometry is Euclidean in logarithmic coordinates. Interacting models have nonzero Ruppeiner curvature.
   472	
   473	Interacting thermodynamic models have nonzero Ruppeiner scalar curvature that grows sharply near the critical region. For the van der Waals entropy $S(u, v) = \log\bigl((v - b)(u + a/v)^{c_v}\bigr)$ per particle in reduced units $a = b = N = k = 1$ and $c_v = 3/2$ (whose noninteracting limit is the ideal gas of \cref{prop:ideal-gas}), direct computation of the Hessian and the Christoffel symbols gives the closed form
   474	\begin{equation}
   475	\label{eq:vdw-curvature}
   476	R(u, v) = \frac{2uv^5 - 4uv^4 + 2uv^3 - v^4 + 8v^3 - 16v^2 + 12v - 3}{u^2 v^6 - 4uv^5 + 12uv^4 - 6uv^3 + 4v^4 - 24v^3 + 48v^2 - 36v + 9},
   477	\end{equation}
   478	in the convention of \cref{def:ruppeiner} (in Ruppeiner's convention the sign is opposite). The numerator and denominator share no common factor in $(u, v)$, and $R$ vanishes only where the numerator does. Evaluations along the supercritical isochore $v = 3$ give $R \approx 0.417$ at $u = 1$, $R \approx 9.55$ at $u = 0.211$, and $R \approx 179.4$ at $u = 0.131$, a growth of more than two orders of magnitude as the internal energy approaches the critical value $u_c = 1/9 \approx 0.111$, where the denominator also vanishes. The pattern is consistent with Ruppeiner's proposal that flatness marks noninteracting constituents and curvature marks interactions: it holds in the two models computed here, and beyond them it remains a proposed correspondence supported by examples.
   479	
   480	\begin{remark}[Two directions of the dictionary]
   481	\label{rem:dictionary}
   482	Thermodynamic geometry instantiates both directions of the correspondence examined in this paper. Information determines geometry: the entropy function, an information-theoretic object, determines the metric by a Hessian. Geometry diagnoses physics: the curvature of that metric is read as an interaction diagnostic. What thermodynamic geometry does not provide is gravity: the metric here is on the space of equilibrium states, not on a spacetime, and no Einstein equation relating it to matter is derived in this paper.
   483	\end{remark}
   484	
   485	\section{The proposed gravity-information correspondence}
   486	\label{sec:correspondence}
   487	
   488	The Gravity-Information-Geometry research program proposes that curvature and gravitational dynamics arise from informational relationships. This section states the correspondence as precisely as the current evidence allows and separates what is proved from what is proposed.
   489	
   490	\begin{remark}[Proposed correspondence]
   491	\label{rem:correspondence}
   492	The proposed dictionary has three entries. First, entropy of boundary subregions determines bulk geometry, as in the Ryu-Takayanagi formula and its quantum corrections (\cref{rem:rt}). Second, information-geometric metrics on state spaces are candidate sources of physical geometry, as in thermodynamic geometry (\cref{sec:thermo}). Third, gravitational dynamics is proposed to arise from the entanglement structure of microscopic degrees of freedom (\cref{rem:vr}). Entries one and two are precise formulas; entry three is a programmatic direction. None of the three is established as a derivation of Einstein's equations from information-theoretic axioms. Conditional derivations exist and each assumes geometric input: the Einstein equation of state from local horizon thermodynamics \cite{jacobson}, linearized dynamics around AdS from the entropy formula and the entanglement first law \cite{fgkmv, lmvr}, and the full equation from an entanglement-equilibrium condition \cite{jac2016}.
   493	\end{remark}
   494	
   495	Three constraints follow from the analysis.
   496	
   497	\begin{description}
   498	\item[Metric ambiguity] By \cref{prop:nonunique} quantum state spaces carry no canonical monotone metric. A dictionary that assigns geometry to quantum states must select a member $f$ of the Petz family or derive the selection from independent principles. The classical uniqueness of Chentsov (\cref{thm:chentsov}) cannot be invoked past the commutative locus (\cref{prop:commutative}).
   499	\item[Reconstruction scope] \Cref{thm:gelfand,thm:dhw} recover structure from probes. Recovery is not dynamics: no reconstruction theorem on record recovers interacting gravitational dynamics from entanglement data.
   500	\item[Provenance of curvature] The curvature computed in \cref{prop:qubit-sld,prop:ideal-gas} is intrinsic to a state space or to an equilibrium manifold. The proposed identification of such curvature with spacetime curvature is a further hypothesis, and the computations here neither support nor refute it.
   501	\end{description}
   502	
   503	The metric ambiguity is the sharpest of the three. In classical statistical mechanics the ruler is unique, so a correspondence of the form ``statistical geometry equals physical geometry'' has no normalization freedom beyond a constant. In quantum statistical mechanics the ruler is a function $f$, and two different rulers give genuinely different geometries on the same state space, as \cref{prop:nonunique} exhibits. Any claim that a quantum state space ``has'' a geometry must therefore answer: which monotone metric, and why.
   504	
   505	The emergent-spacetime program states a central test with four targets: recover, from primitive categorical or informational objects, (i) gauge connections and curvature, (ii) quantum states and observables, (iii) interacting gauge-field dynamics, and (iv) spacetime geometry and gravitational dynamics, without assuming at the outset the spacetime geometry the reconstruction is meant to explain. Each target sits at a different point of the proved-to-proposed gradient.
   506	
   507	\begin{description}
   508	\item[Connections and curvature] Thermodynamic geometry shows that curvature can be computed from an information object (the entropy function) in equilibrium settings, and the qubit computations show that a state space can carry constant-curvature geometry. The proposed identification of such curvature with physical or spacetime curvature is unestablished.
   509	\item[States and observables] The reconstruction pattern proves recovery of $(X, \mathcal{O})$ from probe data in the commutative setting (\cref{thm:gelfand,thm:stone}) and of bulk operators from boundary subregions in the holographic code setting (\cref{thm:dhw}). Both recover structure; neither delivers dynamics.
   510	\item[Gauge dynamics] No reconstruction theorem on record in the setting of this paper recovers interacting gauge dynamics from information-geometric data. The status of rigorous four-dimensional gauge dynamics is tracked separately in the series and is not used as a premise here.
   511	\item[Spacetime and gravity] The entropy formula is a proposal with derived special cases, the emergence of connectivity is an argument, and the conditional derivations of \cite{jacobson, fgkmv, lmvr, jac2016} each assume geometric input; no unconditional derivation of Einstein's equations from information-theoretic axioms is on record.
   512	\end{description}
   513	
   514	\begin{remark}[Structure-preserving discipline]
   515	\label{rem:preservation}
   516	Any proposed identification of systems should state which layers of structure it preserves; equivalences that forget the monoidal or symmetric layer are provably insufficient to recover the underlying group (a constraint from tensor-category theory). The same discipline applies to the proposed correspondences of this section. A dictionary that identifies information-geometric data with physical geometry must state what the identification preserves: the state space, the algebra of observables, the metric class, the dynamics, or some combination. No proposed correspondence examined here states its preserved layers, and none of them is presented as an equivalence.
   517	\end{remark}
   518	
   519	
   520	Deriving gravitational dynamics from quantum state spaces requires three steps that current theorems do not supply. First, a physical principle independent of gravity must select one metric from the Petz family, whereas channel monotonicity leaves an infinite functional parameter $f$ undetermined (\cref{prop:nonunique}). Second, a construction must map Riemannian geometry on state space to a Lorentzian metric on spacetime; the Ryu-Takayanagi formula instead relates bulk areas to subregion entropies of a fixed state, and its derivations cover only symmetric or semiclassical regimes \cite{chc, lm, dlr}. Third, the induced spacetime metric must satisfy Einstein's equations without assuming horizon thermodynamics at the outset \cite{jacobson}.
   521	
   522	The three dictionaries can be compared side by side.
   523	
   524	\begin{table}[ht]
   525	\centering
   526	\small
   527	\begin{tabular}{L{0.19\textwidth} L{0.24\textwidth} L{0.24\textwidth} L{0.21\textwidth}}
   528	\toprule
   529	Dictionary & Data taken & Geometry produced & Status in this paper \\
   530	\midrule
   531	State space & Statistical or quantum state data & Fisher or Petz metric on the state space & Theorem, with a metric parameter in the quantum case \\
   532	Thermodynamic & Entropy function of an equilibrium system & Ruppeiner metric on the equilibrium manifold & Computed in two models and proposed beyond them \\
   533	Spacetime & Boundary entanglement entropies & Bulk metric via minimal-surface areas & Proposal with derived special cases \\
   534	\bottomrule
   535	\end{tabular}
   536	\caption{The three geometric correspondences of this paper, with the data each takes and the status each holds. Only the first row is established without qualification.}
   537	\label{tab:dictionaries}
   538	\end{table}
   539	
   540	The three dictionaries of \cref{tab:dictionaries} are therefore not steps of one derivation. The entropy formula takes subregion entropies of a single state, which carry no Petz parameter, and relates them to areas of a posited bulk geometry; it does not convert a state-space metric into a spacetime metric. The steps a genuine derivation would need are those of the preceding paragraph, and each is open in the sense of \cref{sec:open}.
   541	
   542	\section{Computational evidence}
   543	\label{sec:computation}
   544	
   545	Four computational experiments accompany the paper. They are evidence for the computations above and are never proofs. The scripts live in \texttt{src/vol-09-gravity-information-geometry/} and each header names the claim it evidences.
   546	
   547	The monotonicity experiment verifies \cref{prop:monotone} numerically. For two thousand random interior points $p$ of the four-outcome simplex and random stochastic maps from four outcomes to three, the smallest eigenvalue of $g_p - (D\varphi)^{\mathsf{T}} g_{\varphi p} (D\varphi)$ restricted to the tangent space was $1.028$ at worst. The eigenvalues are taken in the ambient Euclidean metric on an orthonormal tangent basis, since a difference of metric tensors has no canonical eigenvalues without a reference metric; the positive floor is a sampling artifact of random maps avoiding the coarse-grainings where equality holds.
   548	
   549	The monotone-metric experiment verifies \cref{prop:nonunique,prop:commutative} and \cref{rem:qutrit}. At the qubit state $\operatorname{diag}(3/4, 1/4)$ the radial-to-transverse ratio is $1.333333$ for the symmetric logarithmic derivative metric and $1.244017$ for the Wigner-Yanase metric, matching the closed forms $4/3$ and $(2+\sqrt{3})/3$ to twelve decimal places. At the qutrit state $\operatorname{diag}(0.5, 0.3, 0.2)$ the off-diagonal tangent $X_{13} = 1/2$ gives $1.428571$ and $1.500988$, and the diagonal tangent gives $0.163333$ for both normalized metrics and for the Fisher value.
   550	
   551	The qubit-geometry experiment verifies \cref{prop:qubit-sld,prop:qubit-fid}. Metric evaluations from the symmetric logarithmic derivative equation match the closed form $|d\vec{r}|^2 + (\vec{r} \cdot d\vec{r})^2 / (1 - |\vec{r}|^2)$ in two hundred random trials to within $10^{-9}$, and the metric tensor in $(\chi, \theta, \varphi)$ coordinates matches $\operatorname{diag}(1, \sin^2\!\chi, \sin^2\!\chi \sin^2\!\theta)$ to within $10^{-10}$ at sampled points, which is the round three-sphere of radius one. Finite-difference fidelity evaluations give $g^{\mathrm{fid}} = g^{\mathrm{sld}}/4$ in dimensions two to four, with worst relative error $3.2 \times 10^{-4}$ over one hundred and eighty random full-rank states and directions. The geodesic distance from the center, obtained by numerical quadrature of the closed-form radial element, matches $\arcsin r$ to within $10^{-6}$ at five sampled radii.
   552	
   553	The thermodynamic experiment verifies \cref{prop:ideal-gas} and the van der Waals computation. The symbolic Ricci scalar of the ideal gas metric $\operatorname{diag}(c_v/u^2, 1/v^2)$ at $N = k = 1$ is exactly zero, and the numeric evaluation agrees (the constants $Nk$ and $c_v$ do not affect the vanishing). The van der Waals Ricci scalar is a rational function of $(u, v)$ whose sampled values are those recorded in \cref{sec:thermo}: nonzero away from the critical point, growing from $0.128$ at $(2, 2)$ to $179.4$ at $(0.131, 3)$ near the critical internal energy $u_c = 0.111$.
   554	
   555	\section{Code evidence}
   556	\label{sec:code-appendix}
   557	
   558	Each computational claim of \cref{sec:computation} maps to a function in the accompanying code.
   559	
   560	\begin{table}[ht]
   561	\centering
   562	\small
   563	\begin{tabular}{L{0.30\textwidth} L{0.32\textwidth} L{0.28\textwidth}}
   564	\toprule
   565	Claim & File & Function \\
   566	\midrule
   567	Fisher metric is monotone under stochastic maps & \texttt{fisher\_monotonicity.py} & \texttt{check\_monotonicity} \\
   568	Monotone metrics differ on qubit states & \texttt{quantum\_monotone\_metrics.py} & \texttt{petz\_metric} and \texttt{compare\_metrics} \\
   569	Monotone metrics differ on qutrit states & \texttt{quantum\_monotone\_metrics.py} & \texttt{qutrit\_check} \\
   570	Monotone metrics agree on diagonal states & \texttt{quantum\_monotone\_metrics.py} & \texttt{commutative\_locus\_check} \\
   571	Symmetric logarithmic derivative metric of the qubit is round & \texttt{bures\_qubit\_geometry.py} & \texttt{sld\_closed\_form\_check} and \texttt{round\_sphere\_check} \\
   572	Fidelity metric is one quarter of the symmetric logarithmic derivative metric in dimensions two to four & \texttt{bures\_qubit\_geometry.py} & \texttt{fidelity\_metric\_check} \\
   573	Geodesic distance from the center equals arcsin of the radius & \texttt{bures\_qubit\_geometry.py} & \texttt{distance\_profile\_check} \\
   574	Ideal gas Ruppeiner curvature vanishes & \texttt{ruppeiner\_geometry.py} & \texttt{ideal\_gas\_curvature} \\
   575	Van der Waals curvature is nonzero away from the critical point & \texttt{ruppeiner\_geometry.py} & \texttt{vanderwaals\_curvature} \\
   576	\bottomrule
   577	\end{tabular}
   578	\caption{Computational claims and the functions that demonstrate them. Each function prints its own pass condition; the outputs are evidence, not proofs.}
   579	\label{tab:code}
   580	\end{table}
   581	
   582	The Haskell module \texttt{src/vol-09-gravity-information-geometry/Instances.hs} declares instances of shared taxonomy classes (structural families, invariant records, decomposition hooks) for the systems of this paper (classical statistical models, quantum state systems, entanglement-wedge data, thermodynamic systems, weighted-nerve models). The module is executable vocabulary validated against the statements above; it is not machine-checked, and no claim of formal verification is made for it. The paths in this section are relative to the manuscript source tree; no permanent archival identifier for the code is available at the time of writing, and none is invented here.
   583	
   584	\section{Open questions}
   585	\label{sec:open}
   586	
   587	Six questions follow from the results and constraints of this paper. Each is open in the sense that no theorem cited here resolves it.
   588	
   589	\begin{enumerate}
   590	\item \emph{Which monotone metric?} Partial selection principles exist: the expansion of the Umegaki relative entropy selects the Bogoliubov-Kubo-Mori member, quantum estimation selects the symmetric logarithmic derivative member \cite{braunstein-caves, petz-1996}, and the holographic canonical-energy analysis selects the Bogoliubov-Kubo-Mori member for that quantity \cite{lashkari-vr}. Does a physical principle select a member $f$ for a general gravity-information dictionary, or does the metric ambiguity of \cref{prop:nonunique} persist in every such application?
   591	\item \emph{Continuum convergence.} Do the finite-groupoid and weighted-nerve constructions of the emergent-spacetime program (combinatorial objects assembled from a finite groupoid with weights, proposed as discrete models of continuum geometry) converge to a continuum geometry, and under which conditions? Their convergence conditions are not established without complete proofs, and every result in that setting is a hypothesis until the limit is taken with estimates.
   592	\item \emph{The entropy formula in general settings.} The Ryu-Takayanagi formula is derived for spherical vacuum regions and by replica methods in static and covariant form \cite{chc, lm, dlr}. What replaces it where extremal surfaces fail (quantum extremal surfaces being one candidate \cite{ew}), and what is its status for general excited states? The proved quantum-information content (entanglement-wedge reconstruction, the entropy cone for at most five regions) does not settle the status of the formula itself.
   593	\item \emph{Curvature as physics.} Under what hypotheses does the curvature of an information-geometric metric correspond to a physical interaction or to spacetime curvature? The thermodynamic reading works in the two models computed here and is a proposed correspondence beyond them. The step from equilibrium curvature to spacetime curvature is unmade.
   594	\item \emph{Infinite dimensions.} How do the Petz family and the uniqueness locus behave on the state spaces of quantum field theory, where the finite-dimensional proofs of this paper do not apply? The monotone-metric classification in that setting is a different problem from the one solved by Petz and Sud\'ar.
   595	\item \emph{Reconstruction of dynamics.} Can a reconstruction theorem in the sense of \cref{def:probe} recover interacting dynamics from probe data? Every reconstruction result on record recovers structure, not evolution.
   596	\end{enumerate}
   597	
   598	\section{Limitations}
   599	\label{sec:limitations}
   600	
   601	Everything computed here is finite-dimensional. The infinite-dimensional state spaces of quantum field theory, including type III factors with their non-type-I modular theory, are outside the proofs of this paper, and the behavior of the Petz family there is a different question.
   602	
   603	\Cref{thm:chentsov,thm:petz-sudar,thm:gelfand,thm:stone,thm:dhw,thm:cone} are quoted from the literature with their hypotheses and are not reproved here. The proofs given in this paper are those of \cref{prop:monotone,prop:nonunique,prop:commutative,prop:qubit-sld,prop:qubit-fid,prop:ideal-gas}, and the computations of \cref{sec:computation} are numerical checks of exactly those statements.
   604	
   605	The van der Waals curvature values are numerical. They are computed away from the critical point and are consistent with the interaction reading of the Ruppeiner curvature; no theorem here connects thermodynamic curvature to microscopic dynamics in general systems. The parameter $f$ of the Petz family is not derived from physical principles in this paper beyond the partial selections of \cref{lem:kl}, so the metric ambiguity of \cref{prop:nonunique} is exhibited, not resolved.
   606	
   607	No statement of this paper derives Einstein's equations, or any gravitational dynamics, from information-theoretic axioms. The entropy formula remains a proposal outside its derived special cases, and the continuum convergence of weighted-nerve constructions is unestablished and unused.
   608	
   609	The status of the correspondence is mathematical, not empirical. Nothing here is a claim about measured physics, about the value of any physical constant, or about the correctness of any experiment. On the scale of mathematical achievement (formulation, rigorous theorem, physical validation) the results of this paper sit on the first two levels: the formulations are precise, the theorems are proved or quoted with hypotheses, and physical validation of any gravity-information correspondence is not part of this paper.
   610	
   611	\section{Conclusion}
   612	\label{sec:conclusion}
   613	
   614	The relationship between information geometry and gravity is a correspondence of two very different evidential statuses, and the classification viewpoint makes the boundary precise. Classical statistical geometry is rigid: the Fisher metric is the unique monotone ruler, and the simplex carries a round-sphere geometry. Quantum statistical geometry is parametric: the Petz family is infinite, the ambiguity appears already on qubits, and any dictionary that assigns geometry to quantum states must name its metric. Uniqueness survives exactly on the commutative locus, where every normalized monotone metric restricts to the Fisher metric.
   615	
   616	The proofs contributed here fix that boundary at six points. Fisher monotonicity is proved by a Cauchy-Schwarz argument and checked against two thousand random trials. The non-proportionality of the symmetric logarithmic derivative and Wigner-Yanase metrics on qubit states is an explicit computation at one state, and it settles the uniqueness question for the quantum case in the negative. The commutative-locus statement localizes the surviving uniqueness with a diagonal computation and Chentsov's theorem. The symmetric logarithmic derivative metric of the open qubit state space is an open hemisphere of the round three-sphere of radius one, computed in Bloch coordinates and identified by the substitution $r = \sin \chi$; the fidelity metric is one quarter of it. The ideal gas Ruppeiner metric is flat by an explicit coordinate change, and the van der Waals curvature is nonzero away from the critical point and grows toward it.
   617	
   618	The geometric side of the correspondence is graded the same way. Entanglement-wedge reconstruction and the entropy cone for at most five regions are theorems. The qubit computations show that constant-curvature geometry arises from state spaces by construction. The entropy formula in general settings, the emergence of spacetime from entanglement, and gravity from information geometry are proposals and arguments, and this paper has kept them at that status.
   619	
   620	What follows for the classification program is a concrete constraint. Information-geometric invariants classify classical statistical systems without a choice problem and quantum systems only after a choice of $f$. A restricted classification statement in this area must therefore fix the monotone metric as part of its data. The three dictionaries of \cref{tab:dictionaries} are not interchangeable, and only the state-space dictionary is established without qualification. The central question of the emergent-spacetime program stays open: whether the structures examined here recover an interacting physical theory without assuming the spacetime geometry they aim to explain. The evidence assembled here locates that question rather than answers it.
   621	
   622	\begin{thebibliography}{99}
   623	\small
   624	
   625	\bibitem{bao}
   626	N. Bao, S. Nezami, H. Ooguri, B. Stoica, J. Sully, and M. Walter,
   627	``The holographic entropy cone,''
   628	\emph{Journal of High Energy Physics} 09 (2015) 130.
   629	arXiv:1505.07839.
   630	
   631	\bibitem{braunstein-caves}
   632	S. L. Braunstein and C. M. Caves,
   633	``Statistical distance and the geometry of quantum states,''
   634	\emph{Physical Review Letters} 72 (1994) 3439\textendash 3443.
   635	DOI: 10.1103/PhysRevLett.72.3439.
   636	
   637	\bibitem{chc}
   638	H. Casini, M. Huerta, and R. C. Myers,
   639	``Towards a derivation of holographic entanglement entropy,''
   640	\emph{Journal of High Energy Physics} 05 (2011) 036.
   641	DOI: 10.1007/JHEP05(2011)036.
   642	
   643	\bibitem{chentsov}
   644	N. N. Chentsov,
   645	\emph{Statistical Decision Rules and Optimal Inference},
   646	Translations of Mathematical Monographs 53, American Mathematical Society, 1982.
   647	DOI: 10.1090/mmono/053.
   648	
   649	\bibitem{dhw}
   650	X. Dong, D. Harlow, and A. C. Wall,
   651	``Reconstruction of bulk operators within the entanglement wedge in gauge-gravity duality,''
   652	\emph{Physical Review Letters} 117 (2016) 021601.
   653	arXiv:1601.05416.
   654	
   655	\bibitem{dlr}
   656	X. Dong, A. Lewkowycz, and M. Rangamani,
   657	``Deriving covariant holographic entanglement,''
   658	\emph{Journal of High Energy Physics} 11 (2016) 028.
   659	DOI: 10.1007/JHEP11(2016)028.
   660	
   661	\bibitem{ew}
   662	N. Engelhardt and A. C. Wall,
   663	``Quantum extremal surfaces: holographic entanglement entropy beyond the classical regime,''
   664	\emph{Journal of High Energy Physics} 01 (2015) 073.
   665	DOI: 10.1007/JHEP01(2015)073.
   666	
   667	\bibitem{fgkmv}
   668	T. Faulkner, M. Guica, T. Hartman, R. C. Myers, and M. Van Raamsdonk,
   669	``Gravitation from entanglement in holographic CFTs,''
   670	\emph{Journal of High Energy Physics} 03 (2014) 051.
   671	DOI: 10.1007/JHEP03(2014)051.
   672	
   673	\bibitem{gn}
   674	I. M. Gelfand and M. A. Naimark,
   675	``On the imbedding of normed rings into the ring of operators in Hilbert space,''
   676	\emph{Matematicheskii Sbornik} 12 (1943) 197\textendash 213.
   677	Reprinted in \emph{Contemporary Mathematics} 167, American Mathematical Society, 1994, pp. 403\textendash 419.
   678	DOI: 10.1090/conm/167/16.
   679	
   680	\bibitem{hefford-wilson}
   681	J. Hefford and M. Wilson,
   682	``A profunctorial semantics for quantum supermaps,''
   683	arXiv:2402.02997 (2024).
   684	
   685	\bibitem{hc5}
   686	S. Hern\'andez-Cuenca,
   687	``Holographic entropy cone for five regions,''
   688	\emph{Physical Review D} 100 (2019) 026004.
   689	DOI: 10.1103/PhysRevD.100.026004.
   690	
   691	\bibitem{hrt}
   692	V. E. Hubeny, M. Rangamani, and T. Takayanagi,
   693	``A covariant holographic entanglement entropy proposal,''
   694	\emph{Journal of High Energy Physics} 07 (2007) 062.
   695	DOI: 10.1088/1126-6708/2007/07/062.
   696	
   697	\bibitem{hubner}
   698	M. H\"ubner,
   699	``Explicit computation of the Bures distance for density matrices,''
   700	\emph{Physics Letters A} 163 (1992) 239\textendash 242.
   701	DOI: 10.1016/0375-9601(92)91004-B.
   702	
   703	\bibitem{jacobson}
   704	T. Jacobson,
   705	``Thermodynamics of spacetime: the Einstein equation of state,''
   706	\emph{Physical Review Letters} 75 (1995) 1260\textendash 1263.
   707	DOI: 10.1103/PhysRevLett.75.1260.
   708	
   709	\bibitem{jac2016}
   710	T. Jacobson,
   711	``Entanglement equilibrium and the Einstein equation,''
   712	\emph{Physical Review Letters} 116 (2016) 201101.
   713	DOI: 10.1103/PhysRevLett.116.201101.
   714	
   715	\bibitem{lmvr}
   716	N. Lashkari, M. B. McDermott, and M. Van Raamsdonk,
   717	``Gravitational dynamics from entanglement thermodynamics,''
   718	\emph{Journal of High Energy Physics} 04 (2014) 195.
   719	DOI: 10.1007/JHEP04(2014)195.
   720	
   721	\bibitem{lashkari-vr}
   722	N. Lashkari and M. Van Raamsdonk,
   723	``Canonical energy is quantum Fisher information,''
   724	\emph{Journal of High Energy Physics} 04 (2016) 153.
   725	DOI: 10.1007/JHEP04(2016)153.
   726	
   727	\bibitem{lm}
   728	A. Lewkowycz and J. Maldacena,
   729	``Generalized gravitational entropy,''
   730	\emph{Journal of High Energy Physics} 08 (2013) 090.
   731	DOI: 10.1007/JHEP08(2013)090.
   732	
   733	\bibitem{happy}
   734	F. Pastawski, B. Yoshida, D. Harlow, and J. Preskill,
   735	``Holographic quantum error-correcting codes: toy models for the bulk/boundary correspondence,''
   736	\emph{Journal of High Energy Physics} 06 (2015) 149.
   737	arXiv:1503.06237.
   738	
   739	\bibitem{petz-1996}
   740	D. Petz,
   741	``Monotone metrics on matrix spaces,''
   742	\emph{Linear Algebra and its Applications} 244 (1996) 81\textendash 96.
   743	DOI: 10.1016/0024-3795(94)00211-8.
   744	
   745	\bibitem{petz-sudar-jmp}
   746	D. Petz and Cs. Sud\'ar,
   747	``Geometries of quantum states,''
   748	\emph{Journal of Mathematical Physics} 37 (1996) 2662\textendash 2673.
   749	DOI: 10.1063/1.531535.
   750	
   751	\bibitem{petz-sudar}
   752	D. Petz and Cs. Sud\'ar,
   753	``Extending the Fisher metric to density matrices,''
   754	in \emph{Geometry in Present Days Science}, eds.\ O. E. Barndorff-Nielsen and B. Vendel Jensen, World Scientific, 1999, pp. 21\textendash 34.
   755	arXiv:quant-ph/0102132.
   756	
   757	\bibitem{ruppeiner}
   758	G. Ruppeiner,
   759	``Thermodynamics: a Riemannian geometric model,''
   760	\emph{Physical Review A} 20 (1979) 1608\textendash 1613.
   761	DOI: 10.1103/PhysRevA.20.1608.
   762	
   763	\bibitem{rt}
   764	S. Ryu and T. Takayanagi,
   765	``Holographic derivation of entanglement entropy from AdS/CFT,''
   766	\emph{Physical Review Letters} 96 (2006) 181602.
   767	arXiv:hep-th/0603001.
   768	
   769	\bibitem{stone}
   770	M. H. Stone,
   771	``Applications of the theory of Boolean rings to general topology,''
   772	\emph{Transactions of the American Mathematical Society} 41 (1937) 375\textendash 481.
   773	DOI: 10.1090/S0002-9947-1937-1501905-7.
   774	
   775	\bibitem{uhlmann}
   776	A. Uhlmann,
   777	``The transition probability in the state space of a $*$-algebra,''
   778	\emph{Reports on Mathematical Physics} 9 (1976) 273\textendash 279.
   779	DOI: 10.1016/0034-4877(76)90060-4.
   780	
   781	\bibitem{vr}
   782	M. Van Raamsdonk,
   783	``Building up spacetime with quantum entanglement,''
   784	\emph{General Relativity and Gravitation} 42 (2010) 2323\textendash 2329.
   785	arXiv:1005.3035.
   786	
   787	\bibitem{weinhold}
   788	F. Weinhold,
   789	``Metric geometry of equilibrium thermodynamics,''
   790	\emph{Journal of Chemical Physics} 63 (1975) 2479\textendash 2483.
   791	DOI: 10.1063/1.431689.
   792	
   793	\bibitem{whh}
   794	M. Wilson, J. Hefford, and T. Hoffreumon,
   795	``Supermaps on generalised theories,''
   796	arXiv:2602.23865 (2026).
   797	
   798	\end{thebibliography}
   799	
   800	\end{document}

exec
/usr/local/bin/zsh -lc "sed -n '170,390p' papers/latex/vol-09-gravity-information-geometry.tex | nl -ba -v170" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   170	\end{lemma}
   171	
   172	\begin{proof}
   173	Expand $\log(1 + u_i/p_i) = u_i/p_i - u_i^2 / (2 p_i^2) + O(\|u\|^3)$ in
   174	$D = \sum_i (p_i + u_i) \log(1 + u_i/p_i)$. The first-order terms cancel because $\sum_i u_i = 0$, and the second-order terms give $\sum_i (u_i^2/p_i - u_i^2 / (2 p_i)) = \frac{1}{2} \sum_i u_i^2 / p_i = \frac{1}{2} g_p(u, u)$.
   175	\end{proof}
   176	
   177	\Cref{lem:kl} explains the role of the Fisher metric as a ruler of distinguishability: it is the quadratic term of the divergence that measures how far a perturbed distribution is from the reference. The same quadratic form appears in the statistical estimation problem as the inverse asymptotic variance of efficient estimators. The quantum analogue of the lemma produces one specific member of the Petz family, not the whole family: expanding the Umegaki quantum relative entropy $D(\rho + X \,\|\, \rho)$ to second order gives the metric of the member $f_{\mathrm{bkm}}(t) = (t-1)/\log t$ (with $f_{\mathrm{bkm}}(1) = 1$ by continuity), the Bogoliubov-Kubo-Mori metric, while the quantum Cram\'er-Rao bound of quantum estimation singles out the symmetric logarithmic derivative member $f(t) = (1+t)/2$ \cite{braunstein-caves, petz-1996}.
   178	
   179	\begin{proposition}[Monotonicity of the Fisher metric]
   180	\label{prop:monotone}
   181	The Fisher metric is monotone under stochastic maps.
   182	\end{proposition}
   183	
   184	\begin{proof}
   185	Let $\varphi$ be stochastic and let $u$ be tangent at $p$, so $\sum_i u_i = 0$. The derivative of $p \mapsto \varphi p$ is $u \mapsto \varphi u$, and $\sum_j (\varphi u)_j = \sum_i u_i \sum_j \varphi_{ji} = 0$, so $D\varphi \cdot u = \varphi u$ is tangent at $\varphi p$. Write $q = \varphi p$, so $q_j = \sum_i \varphi_{ji} p_i$. Fix $j$ with $q_j > 0$ (if $q_j = 0$ then $\varphi_{ji} = 0$ for all $i$ and the term below is zero on both sides). By the Cauchy-Schwarz inequality applied with weights $\varphi_{ji}$,
   186	\begin{equation}
   187	(\varphi u)_j^2 = \Bigl(\sum_i \varphi_{ji} \frac{u_i}{\sqrt{p_i}} \sqrt{p_i}\Bigr)^2
   188	\leq \Bigl(\sum_i \varphi_{ji} \frac{u_i^2}{p_i}\Bigr) \Bigl(\sum_i \varphi_{ji} p_i\Bigr).
   189	\end{equation}
   190	Dividing by $q_j = \sum_i \varphi_{ji} p_i$ and summing over $j$ with $q_j > 0$ gives
   191	\begin{equation}
   192	\sum_j \frac{(\varphi u)_j^2}{q_j}
   193	\leq \sum_j \sum_i \varphi_{ji} \frac{u_i^2}{p_i}
   194	= \sum_i \frac{u_i^2}{p_i} \sum_j \varphi_{ji}
   195	= \sum_i \frac{u_i^2}{p_i},
   196	\end{equation}
   197	which is $g_{\varphi p}(\varphi u, \varphi u) \leq g_p(u, u)$.
   198	\end{proof}
   199	
   200	\begin{remark}[Worked monotonicity]
   201	\label{rem:worked-monotone}
   202	Take three outcomes, $p = (0.5, 0.3, 0.2)$, and the stochastic map $\varphi = \left(\begin{smallmatrix} 0.7 & 0.1 & 0.2 \\ 0.3 & 0.9 & 0.8 \end{smallmatrix}\right)$, which sends three outcomes to two and has unit column sums. Then $q = \varphi p = (0.42, 0.58)$, and for the tangent vector $u = (0.1, -0.05, -0.05)$ one computes
   203	\begin{equation}
   204	g_p(u, u) = \frac{0.01}{0.5} + \frac{0.0025}{0.3} + \frac{0.0025}{0.2} = \frac{49}{1200} \approx 0.040833,
   205	\end{equation}
   206	while $\varphi u = (0.055, -0.055)$ and $g_q(\varphi u, \varphi u) = 0.055^2 (1/0.42 + 1/0.58) = 121/9744 \approx 0.012418$. The map costs distinguishability, and the deficit is the slack in the Cauchy-Schwarz step of \cref{prop:monotone}. The computational check in \cref{sec:computation} repeats this comparison for two thousand random trials.
   207	\end{remark}
   208	
   209	\begin{theorem}[Chentsov]
   210	\label{thm:chentsov}
   211	On the probability simplices, the Fisher family is the unique family of Riemannian metrics, up to a single positive constant shared across dimensions, that is monotone under stochastic maps.
   212	\end{theorem}
   213	
   214	Chentsov proved this theorem in the formulation: smooth metric families invariant under congruent embeddings (Markov morphisms) are unique up to constant; Petz and Sud\'ar \cite{petz-sudar} state the equivalent contraction form used here, monotone under general stochastic maps. The two formulations are connected as follows: a congruent embedding and its stochastic inverse force invariance under invertible stochastic maps (permutations included), and the contraction inequality for general stochastic maps is the monotonicity of \cref{def:stochastic}. Smoothness of the metric tensor is assumed throughout, as in Chentsov's statement. Two scope points are essential. The constant is undetermined and shared: monotonicity pins the metric only up to scale, and the cross-dimensional maps of \cref{def:stochastic} are what force one constant across all $n$. The classical uniqueness has an operational reading. Monotonicity says statistical distinguishability does not increase under processing; uniqueness says there is one ruler for that distinguishability. A classification program for statistical systems can therefore treat the Fisher metric as classifying data without a choice problem. \Cref{sec:quantum} shows that this comfort does not survive quantization.
   215	
   216	\begin{remark}[Fisher geometry of the simplex]
   217	\label{rem:bernoulli}
   218	The Fisher metric on the interior of $\Delta_{n-1}$ is, up to scale, the round-sphere metric. Substitute $p_i = y_i^2$ with $y_i > 0$; the constraint $\sum_i p_i = 1$ becomes $\sum_i y_i^2 = 1$, and $\sum_i (dp_i)^2 / p_i = 4 \sum_i (dy_i)^2$, so the metric is four times the round metric of the unit sphere restricted to the positive orthant of $S^{n-1}$. For $n \geq 3$ the sectional curvature is $1/4$ in this normalization, and the geodesic distance between $p$ and $p'$ is $2 \arccos \sum_i \sqrt{p_i p'_i}$. For the Bernoulli model ($n = 2$) the state space is an arc of a circle of radius 2, and in the coordinate $q = \log(p_1/p_2)$ the line element is $(dq)^2 / (4 \cosh^2(q/2))$.
   219	\end{remark}
   220	
   221	\section{Quantum monotone metrics}
   222	\label{sec:quantum}
   223	
   224	Petz and Sud\'ar \cite{petz-sudar} classified the monotone metrics of \cref{def:quantum-monotone} on finite-dimensional state spaces. The answer is parametric, not unique.
   225	
   226	\begin{theorem}[Petz-Sud\'ar]
   227	\label{thm:petz-sudar}
   228	Monotone metric families $\{g^{(d)}\}_{d \geq 2}$ in the sense of \cref{def:quantum-monotone} correspond exactly to functions $f : (0, \infty) \to (0, \infty)$ that are operator monotone of all matrix orders and satisfy $f(t) = t f(1/t)$, by the formula \eqref{eq:petz} in each dimension \cite{petz-1996, petz-sudar-jmp}. The correspondence is a bijection after the normalization $f(1) = 1$, which is equivalent to restricting to the Fisher value on diagonal tangent vectors; without the normalization, metrics correspond to $f$ only up to a positive constant. In particular the symmetric logarithmic derivative metric of \cref{def:sld} corresponds to $f(t) = (1+t)/2$, and there are infinitely many monotone metrics.
   229	\end{theorem}
   230	
   231	The correspondence in this normalization is the one computed below: for $f(t) = (1+t)/2$ the formula \eqref{eq:petz} gives $g_{\rho}^{f}(X,X) = \sum_{i,j} 2 |X_{ij}|^2 / (\lambda_i + \lambda_j)$, which is exactly $\operatorname{Tr}(X L)$ with $X = (\rho L + L\rho)/2$, since in the eigenbasis the defining equation reads $X_{ij} = L_{ij} (\lambda_i + \lambda_j)/2$. The word ``correspond'' in the theorem is exact in both directions: every operator monotone $f$ with $f(t) = t f(1/t)$ produces a monotone metric, and every monotone metric arises this way. The classification is complete as a parameterization, and the parameter is a function rather than a finite list.
   232	
   233	\begin{proposition}[Non-uniqueness on qubit states]
   234	\label{prop:nonunique}
   235	Let $\rho = \operatorname{diag}(3/4, 1/4)$ and let $X = \sigma_x / 2$, $Y = \sigma_z / 2$ be the transverse and radial tangent vectors at $\rho$ in Bloch coordinates. For the symmetric logarithmic derivative metric,
   236	\begin{equation}
   237	g^{\mathrm{sld}}_{\rho}(X, X) = 1, \qquad g^{\mathrm{sld}}_{\rho}(Y, Y) = \frac{4}{3}.
   238	\end{equation}
   239	For the Wigner-Yanase metric, given by \eqref{eq:petz} with $f_{\mathrm{wy}}(t) = \tfrac{1}{4}(1 + \sqrt{t})^2$,
   240	\begin{equation}
   241	g^{\mathrm{wy}}_{\rho}(X, X) = 4(2 - \sqrt{3}), \qquad g^{\mathrm{wy}}_{\rho}(Y, Y) = \frac{4}{3}.
   242	\end{equation}
   243	The radial-to-transverse ratio is $4/3$ for the symmetric logarithmic derivative metric and $(2 + \sqrt{3})/3 \neq 4/3$ for the Wigner-Yanase metric, so the two metrics are not proportional. Quantum monotone metrics are not unique, even up to a constant.
   244	\end{proposition}
   245	
   246	\begin{proof}
   247	For $X = \sigma_x / 2$ the matrix entries are $X_{12} = X_{21} = 1/2$ and $X_{11} = X_{22} = 0$. The symmetric logarithmic derivative equation $X = (\rho L + L \rho)/2$ for off-diagonal entries reads $X_{ij} = L_{ij}(\lambda_i + \lambda_j)/2$, so $L_{12} = L_{21} = 1/2 \cdot 2 / 1 = 1$ and $L = \sigma_x$. Then $g^{\mathrm{sld}}(X, X) = \operatorname{Tr}(X L) = \operatorname{Tr}(\sigma_x^2 / 2) = 1$. For $Y = \sigma_z / 2$ the derivative is diagonal and $L = \operatorname{diag}\bigl((1/2)/(3/4), (-1/2)/(1/4)\bigr) = \operatorname{diag}(2/3, -2)$, so $g^{\mathrm{sld}}(Y, Y) = \operatorname{Tr}(Y L) = (1/2)(2/3) + (-1/2)(-2) = 4/3$.
   248	
   249	For the Wigner-Yanase metric the coefficient of $|X_{ij}|^2$ in \eqref{eq:petz} is $1/(\lambda_i f_{\mathrm{wy}}(\lambda_j/\lambda_i)) = 4/(\sqrt{\lambda_i} + \sqrt{\lambda_j})^2$. With $\lambda_1 = 3/4$, $\lambda_2 = 1/4$ the transverse value is $2 \cdot (1/4) \cdot 4 / (\sqrt{3}/2 + 1/2)^2 = 4 / (2 + \sqrt{3}) = 4(2 - \sqrt{3})$, where $(\sqrt{3}+1)^2 = 4 + 2\sqrt{3}$ and $4 - 3 = 1$ were used. For diagonal $Y$ the two diagonal terms give $4(1/2)^2 / (2\sqrt{3}/2)^2 + 4(-1/2)^2 / (2 \cdot 1/2)^2 = 1/3 + 1 = 4/3$. The ratio $(4/3)/(4(2-\sqrt{3})) = (2+\sqrt{3})/3$ is not $4/3$, since $2 + \sqrt{3} \neq 4$.
   250	\end{proof}
   251	
   252	The failure of uniqueness is structural, not an artifact of the qubit. The Petz family is infinite in every dimension $d \geq 2$, and the ambiguity appears already in the two-level system. Any physical statement of the form ``the geometry of the quantum state space is $G$'' must therefore name $f$, or must derive $f$ from independent principles. This constraint carries into every proposed gravity-information dictionary in \cref{sec:correspondence}.
   253	
   254	\begin{remark}[The parameter as data]
   255	\label{rem:parameter}
   256	The classifying datum of a monotone metric is the function $f$, subject to $f(t) = t f(1/t)$; the condition is the symmetry of the Petz formula under $i \leftrightarrow j$, and the normalization $f(1) = 1$ fixes the scale that Chentsov's theorem leaves free. Three members of the family recur in this paper: $f(t) = (1+t)/2$ (symmetric logarithmic derivative), $f_{\mathrm{wy}}(t) = \tfrac{1}{4}(1+\sqrt{t})^2$ (Wigner-Yanase), and $f_{\mathrm{bkm}}(t) = (t-1)/\log t$ (Bogoliubov-Kubo-Mori). Distinct $f$ give distinct metrics, so the parameter is invariant content of a quantum state system, in the same sense that the dimension vector is invariant content of a finite-dimensional $C^*$-algebra. Partial selection principles exist: the expansion of \cref{lem:kl} selects $f_{\mathrm{bkm}}$, and quantum estimation selects $f(t) = (1+t)/2$ \cite{braunstein-caves}. In holography the second-order relative entropy of boundary perturbations equals the bulk canonical energy \cite{lashkari-vr}, which by \cref{lem:kl} selects the Bogoliubov-Kubo-Mori member for that quantity; distinct holographic questions can invoke distinct members. No principle selects a member for a general gravity-information dictionary.
   257	\end{remark}
   258	
   259	Uniqueness has one sharp surviving locus.
   260	
   261	\begin{proposition}[Commutative locus]
   262	\label{prop:commutative}
   263	For every normalized operator monotone $f$ and every full-rank diagonal $\rho = \sum_i \lambda_i |i\rangle\langle i|$, the restriction of $g^{f}$ to diagonal tangent vectors is the Fisher value:
   264	\begin{equation}
   265	g^{f}_{\rho}(X, X) = \sum_i \frac{X_{ii}^2}{\lambda_i}.
   266	\end{equation}
   267	More generally the restriction of any monotone metric to commuting states is a classical monotone metric, hence $c \cdot g^{\mathrm{fisher}}$ for some $c > 0$ by Chentsov's theorem (\cref{thm:chentsov}); in the Petz family $c = 1/f(1)$, so the normalization $f(1) = 1$ forces $c = 1$. Every normalized monotone metric restricts to the Fisher metric on the commutative locus.
   268	\end{proposition}
   269	
   270	\begin{proof}
   271	For diagonal $X$ only the terms $i = j$ survive in \eqref{eq:petz}, and $f(1) = 1$ gives $g^f(X,X) = \sum_i X_{ii}^2 / (\lambda_i f(1)) = \sum_i X_{ii}^2 / \lambda_i$, for every dimension $d$. For the general statement, let $\varphi$ be a stochastic map of diagonal distributions. The pinching channel $\Phi(A) = \sum_{i,j} \varphi_{ji} \langle i | A | i \rangle |j\rangle\langle j|$, with Kraus operators $K_{ji} = \sqrt{\varphi_{ji}} |j\rangle\langle i|$, is completely positive and trace-preserving, maps diagonal states to diagonal states, and restricts to $p \mapsto \varphi p$. Monotonicity of the quantum metric under $\Phi$ restricts to monotonicity of the induced classical metric, so Chentsov's theorem applies and the restriction is $c \cdot g^{\mathrm{fisher}}$. The direct computation above fixes $c = 1/f(1)$ for the Petz family.
   272	\end{proof}
   273	
   274	\begin{remark}[Commutative values]
   275	\label{rem:commutative}
   276	For $\rho = \operatorname{diag}(3/4, 1/4)$ and $Y = \sigma_z/2$ the value $g(Y, Y) = 4/3$ of \cref{prop:nonunique} is the Fisher value $\sum_i X_{ii}^2 / \lambda_i = (1/2)^2/(3/4) + (-1/2)^2/(1/4) = 4/3$, for both normalized metrics. The two computations agree on the diagonal, as \cref{prop:commutative} requires, and disagree off it.
   277	\end{remark}
   278	
   279	\begin{remark}[Qutrit values]
   280	\label{rem:qutrit}
   281	At the qutrit state $\rho = \operatorname{diag}(0.5, 0.3, 0.2)$ with the off-diagonal tangent $X_{13} = X_{31} = 1/2$, the Petz formula gives $g^{\mathrm{sld}}(X, X) = 10/7 \approx 1.4286$ and $g^{\mathrm{wy}}(X, X) \approx 1.5010$, while the fidelity metric gives $\approx 0.3571$ by the identity of \cref{def:fidelity}. On the diagonal tangent $Y = \operatorname{diag}(0.2, -0.1, -0.1)$ both normalized metrics give the Fisher value $0.04/0.5 + 0.01/0.3 + 0.01/0.2 = 49/300 \approx 0.163333$, while the fidelity metric gives $\approx 0.040833$. The pattern of \cref{prop:nonunique,prop:commutative} holds one dimension up, and the computations of \cref{sec:computation} verify both statements numerically.
   282	\end{remark}
   283	
   284	\section{Geometry of the qubit state space}
   285	\label{sec:qubit}
   286	
   287	The qubit state space is the smallest quantum system and the smallest place where the Petz family is nontrivial. Its geometry is computable in closed form, and it exhibits the two themes of the paper: a quantum state space carries a canonical constant-curvature geometry once $f$ is chosen, and the choice of $f$ matters off the commutative locus. The computations of this section are expository; the geometry of state spaces and the fidelity constructions are documented in the information-geometric literature \cite{hubner, braunstein-caves, petz-1996}, and the proofs are given in full because the paper uses the statements as premises.
   288	
   289	Write $\rho = (I + \vec{r} \cdot \vec{\sigma})/2$ with $|\vec{r}| < 1$, so $\mathcal{D}_2^{\circ}$ is the open unit ball of $\mathbb{R}^3$ and the eigenvalues are $\lambda_{\pm} = (1 \pm |\vec{r}|)/2$.
   290	
   291	\begin{proposition}[Symmetric logarithmic derivative geometry of the qubit]
   292	\label{prop:qubit-sld}
   293	In Bloch coordinates the symmetric logarithmic derivative metric is
   294	\begin{equation}
   295	\label{eq:qubit-sld}
   296	g^{\mathrm{sld}} = |d\vec{r}|^2 + \frac{(\vec{r} \cdot d\vec{r})^2}{1 - |\vec{r}|^2}.
   297	\end{equation}
   298	In spherical coordinates $|\vec{r}| = r = \sin\chi$ this becomes $g^{\mathrm{sld}} = (d\chi)^2 + \sin^2\!\chi \, (d\Omega)^2$ with $\chi \in (0, \pi/2)$: the open state space $\mathcal{D}_2^{\circ}$ is isometric to an open hemisphere of the round three-sphere of radius one, of constant sectional curvature one.
   299	\end{proposition}
   300	
   301	\begin{proof}
   302	By rotational invariance of $g^{\mathrm{sld}}$ it suffices to evaluate radial and transverse directions at $\vec{r} = (0, 0, r)$. A tangent vector $X = (d\vec{r} \cdot \vec{\sigma})/2$ has entries $X_{11} = dr_3/2$, $X_{22} = -dr_3/2$, $X_{12} = (dr_1 - i\, dr_2)/2$, $X_{21} = (dr_1 + i\, dr_2)/2$ in the orthonormal eigenbasis of $\rho$. From \cref{thm:petz-sudar} the diagonal entries of $g^{\mathrm{sld}}$ contribute $X_{11}^2 / \lambda_+ + X_{22}^2 / \lambda_-$ and the off-diagonal entries contribute $2 \cdot 2 |X_{12}|^2 / (\lambda_+ + \lambda_-)$. With $\lambda_{\pm} = (1 \pm r)/2$ one gets $1/\lambda_+ + 1/\lambda_- = 4/(1 - r^2)$ and $\lambda_+ + \lambda_- = 1$, so
   303	\begin{equation}
   304	g^{\mathrm{sld}} = (dr_1^2 + dr_2^2) + \frac{dr_3^2}{1 - r^2} = |d\vec{r}|^2 + \frac{(\vec{r} \cdot d\vec{r})^2}{1 - |\vec{r}|^2}.
   305	\end{equation}
   306	Setting $r = \sin\chi$ turns $(dr)^2/(1 - r^2) + r^2 (d\Omega)^2$ into $(d\chi)^2 + \sin^2\!\chi \, (d\Omega)^2$, the round metric of radius one, on the chart $\chi \in (0, \pi/2)$; the spherical chart is singular at the center, which is covered by the smooth embedding $\vec{r} \mapsto (\vec{r}, \sqrt{1 - |\vec{r}|^2}) \in S^3 \subset \mathbb{R}^4$. The distance from the center to the pure-state boundary is $\pi/2$.
   307	\end{proof}
   308	
   309	The fidelity metric of \cref{def:fidelity} is one quarter of this metric on the qubit.
   310	
   311	\begin{proposition}[Fidelity metric of the qubit]
   312	\label{prop:qubit-fid}
   313	On $\mathcal{D}_2^{\circ}$ the fidelity metric satisfies $g^{\mathrm{fid}} = \tfrac{1}{4} g^{\mathrm{sld}}$. Consequently the open state space with the fidelity metric is an open hemisphere of the round three-sphere of radius one half, of constant sectional curvature four.
   314	\end{proposition}
   315	
   316	\begin{proof}
   317	Both metrics are invariant under the rotations of the Bloch ball induced by unitary conjugation, so at each $\vec{r}$ the rotation group fixing $\vec{r}$ forces the cross term between radial and transverse directions to vanish and fixes transverse isotropy, and the quadratic form is determined by its radial and transverse values. For the transverse direction, set $\sigma = \rho + \varepsilon X$ with $X = \sigma_x/2$ and $\rho = \operatorname{diag}(\lambda_+, \lambda_-)$. Then $\sqrt{\rho}\, \sigma \sqrt{\rho} = \left(\begin{smallmatrix} \lambda_+^2 & \tfrac{\varepsilon}{2}\sqrt{\lambda_+ \lambda_-} \\ \tfrac{\varepsilon}{2}\sqrt{\lambda_+ \lambda_-} & \lambda_-^2 \end{smallmatrix}\right)$, whose determinant is $\lambda_+ \lambda_- (\lambda_+ \lambda_- - \varepsilon^2/4)$. Since $(\operatorname{Tr}\sqrt{M})^2 = \operatorname{Tr} M + 2\sqrt{\det M}$, one gets $\operatorname{Tr}\sqrt{\sqrt{\rho}\,\sigma\sqrt{\rho}} = 1 - \varepsilon^2/8 + O(\|\varepsilon X\|^3)$ and $d_B^2 = 2(1 - \sqrt{F}) = \varepsilon^2/4 + O(\|\varepsilon X\|^3)$, matching $\tfrac{1}{4} g^{\mathrm{sld}}(X, X) = 1/4$ from \cref{prop:qubit-sld} at every $r$. For the radial direction the states commute and the fidelity reduces to the classical affinity $\sum_i \sqrt{p_i q_i}$ on the Bernoulli pair $p = ((1+r)/2, (1-r)/2)$; the expansion $\sum_i \sqrt{p_i (p_i + \delta_i)} = 1 - \sum_i \delta_i^2 / (8 p_i) + O(\|\delta\|^3)$ for $\sum_i \delta_i = 0$ gives $d_B^2 = \sum_i \delta_i^2 / (4 p_i)$, one quarter of the classical Fisher value, and the classical Fisher value is $g^{\mathrm{sld}}$ on the diagonal by \cref{prop:commutative}. The curvature claim follows from \cref{prop:qubit-sld} and the constant factor $1/4$, which multiplies sectional curvatures by $4$.
   318	\end{proof}
   319	
   320	\begin{remark}[Normalization conventions]
   321	\label{rem:conventions}
   322	The factor between the fidelity metric and the symmetric logarithmic derivative metric depends on the normalization of the fidelity, and conventions differ across sources. In the convention of \cref{def:fidelity}, where $d_B^2 = 2(1-\sqrt{F})$, the fidelity metric of the qubit is one quarter of the symmetric logarithmic derivative metric, and the corresponding sphere has radius $1/2$ rather than $1$. The intrinsic statements of \cref{prop:qubit-sld,prop:qubit-fid} are convention-free up to this constant: both geometries are round three-spheres up to the open-hemisphere restriction, and the constant relates their radii. Any comparison of curvature values across sources must first fix the normalization.
   323	\end{remark}
   324	
   325	\begin{remark}[Constant curvature without spacetime]
   326	\label{rem:sphere}
   327	\Cref{prop:qubit-sld,prop:qubit-fid} are statements about information geometry. The round three-sphere appearing here is the geometry of statistical distinguishability on a two-level quantum system; it is not a spacetime and no claim about spacetime dimension or signature follows. The example exists to separate the two readings of ``geometric correspondence'': state spaces carry Riemannian geometry by construction, and whether that geometry is physical is a further question.
   328	\end{remark}
   329	
   330	\begin{remark}[Geodesic distance on the qubit]
   331	\label{rem:distance}
   332	In the coordinates of \cref{prop:qubit-sld} the geodesic distance from the maximally mixed state $\vec{r} = 0$ to the state $\vec{r} = r \vec{n}$ is $\chi = \arcsin r$, since $g^{\mathrm{sld}} = (d\chi)^2 + \sin^2\!\chi \, (d\Omega)^2$ and radial geodesics of the round sphere have length equal to the angle. Pure states sit at distance $\pi/2$ from the center, and the diameter of the interior is $\pi$: the space of qubit states is a hemisphere of finite diameter carried by statistical distinguishability, not by any spacetime interpretation. The computational check in \cref{sec:computation} compares this distance profile against the closed form.
   333	\end{remark}
   334	
   335	\section{Information geometry as invariant data}
   336	\label{sec:invariants}
   337	
   338	The classification program identifies objects by invariants, in the spirit of the companion data that practitioners use to tell objects apart in a completed classification. For statistical systems the candidate invariants are the sample-space size, the isometry class of the Fisher geometry, and the curvature data of statistical submodels.
   339	
   340	\begin{corollary}[Fisher geometry of the full simplex]
   341	\label{cor:homogeneity}
   342	The Fisher metric on the interior of $\Delta_{n-1}$ is locally isometric to the round sphere of radius two, with sectional curvature $1/4$ for $n \geq 3$, and the arc of \cref{rem:bernoulli} for $n = 2$. The isometry group of the full model is the finite group of coordinate permutations. Two statistical models defined on the full simplex with the same number of outcomes are isometric as Riemannian manifolds, and a permutation of outcomes is an isometry.
   343	\end{corollary}
   344	
   345	\begin{proof}
   346	The substitution $p_i = y_i^2$ of \cref{rem:bernoulli} is an isometry onto the positive orthant of the round sphere of radius two. A global isometry of the connected constant-curvature orthant extends uniquely to an ambient isometry of its metric completion $S^{n-1}(2)$, and such an isometry permutes the $n$ extreme rays of the orthant; the orthogonal maps permuting those rays are exactly the permutation matrices. Permutations preserve $\sum_i p_i = 1$ and the metric $\sum_i (dp_i)^2 / p_i$ directly, so the isometry group is the permutation group.
   347	\end{proof}
   348	
   349	\Cref{cor:homogeneity} is a classification statement of the trivial kind: the full models of a fixed sample size form one isometry class, and the only invariant is $n$. The classification content of information geometry therefore lives in statistical submodels.
   350	
   351	\begin{definition}[Statistical submodel]
   352	\label{def:submodel}
   353	A statistical submodel is a smooth embedding $i : M' \to \Delta_{n-1}^{\circ}$ of a lower-dimensional manifold $M'$ into the simplex, with the pullback metric $g' = i^{*} g^{\mathrm{fisher}}$. The intrinsic and extrinsic curvature invariants of $(M', g')$ are invariants of the model. Exponential families are the canonical submodels.
   354	\end{definition}
   355	
   356	\begin{remark}[Embedded two-outcome model]
   357	\label{rem:embedded}
   358	Inside the three-outcome simplex consider $p(\theta) = (\theta, (1-\theta)/2, (1-\theta)/2)$ for $\theta \in (0, 1)$. The tangent vector is $p'(\theta) = (1, -1/2, -1/2)$, and the induced metric is
   359	\begin{equation}
   360	g' = \Bigl( \frac{1}{\theta} + \frac{1/4}{(1-\theta)/2} + \frac{1/4}{(1-\theta)/2} \Bigr) d\theta^2
   361	= \frac{(d\theta)^2}{\theta(1-\theta)},
   362	\end{equation}
   363	exactly the Fisher metric of the standalone two-outcome model of \cref{rem:bernoulli}. The embedding is isometric onto its image, so intrinsic geometry cannot detect the sample-space size: two models with different numbers of outcomes can share a submodel geometry. The induced metric is unchanged here because the embedding is a sufficient-statistic Markov map. Among linear stochastic maps, pullback preserves the Fisher metric exactly when the map is a sufficient-statistic embedding, and general smooth embeddings can reproduce the same intrinsic metric without being Markov maps, so intrinsic geometry alone does not detect the embedding. Extrinsic data of the embedding is additional invariant content.
   364	\end{remark}
   365	
   366	\begin{remark}[Classifying data for statistical models]
   367	\label{rem:family-v}
   368	For statistical models (probability and measure structures), the Fisher metric is the natural classifying invariant in the classical case. \Cref{cor:homogeneity} and \cref{def:submodel} make that naming precise: the invariant is the metric up to isometry, trivial on full models and rich on submodels. This is the opposite of the symplectic situation, where local classification is trivial by Darboux's theorem and all content is global. Information geometry has local content and uses it. On the quantum side the invariant data must additionally name the member $f$ of the Petz family (\cref{prop:nonunique}), so the classifying data of a quantum state system is the pair (state space, $f$) and never the state space alone.
   369	\end{remark}
   370	
   371	\begin{remark}[Classification status of statistical models]
   372	\label{rem:status}
   373	The evidence of this paper supports the following summary. Classical statistical models of fixed sample size are classified by \cref{cor:homogeneity} up to isometry of their full Fisher geometry, and statistical submodels carry curvature invariants without a complete classification being on record. Quantum state systems are classified as metric spaces only after the parameter $f$ is fixed, and no physical principle in this paper fixes it. Statistical models are therefore a worked example of a general pattern in classification: a complete island (Chentsov, Petz-Sud\'ar), a trivial stratum (full simplices), and open content (submodels, quantum parameter selection).
   374	\end{remark}
   375	
   376	\section{Reconstruction from probes}
   377	\label{sec:reconstruction}
   378	
   379	The second proved pattern available to a gravity-information program is reconstruction: an object recovered from data about its relationships. Three classical results fix the pattern, and one quantum-information result applies it to entanglement.
   380	
   381	\begin{theorem}[Gelfand-Naimark and Gelfand duality]
   382	\label{thm:gelfand}
   383	Every commutative unital $C^*$-algebra is isometrically $*$-isomorphic to $C(X)$ for a compact Hausdorff space $X$, its Gelfand spectrum; contravariantly, the categories of commutative unital $C^*$-algebras and of compact Hausdorff spaces are dual \cite{gn}. In particular the space $X$ is recovered from the algebra of observables $\mathcal{O} = C(X)$ alone.
   384	\end{theorem}
   385	
   386	\begin{theorem}[Stone duality]
   387	\label{thm:stone}
   388	Boolean algebras are dual to compact totally disconnected Hausdorff spaces \cite{stone}; the space is recovered from the algebra of clopen sets.
   389	\end{theorem}
   390	

exec
/usr/local/bin/zsh -lc "sed -n '391,558p' papers/latex/vol-09-gravity-information-geometry.tex | nl -ba -v391" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   391	These theorems are classification-grade only in the commutative setting: there $X$ is determined by $\mathcal{O}$ up to homeomorphism. The noncommutative Gelfand-Naimark theorem embeds an arbitrary $C^*$-algebra into the operators of some Hilbert space, which is a representation theorem, not a classification. Reconstruction of a state space from probe data is weaker than classification of all state spaces, and this distinction is the one the classification program must preserve.
   392	
   393	\begin{definition}[Probe data and reconstruction]
   394	\label{def:probe}
   395	Probe data of an object $P$ is a family of measurements or relationships $\{\phi_i(P)\}$ indexed by probes $\phi_i$; a reconstruction theorem assigns to the probe data an object $\hat{P}$ together with an isomorphism $\hat{P} \cong P$ in a stated category. The theorem is classification-grade only when the probes are a complete invariant, that is, when $\hat{P} \cong \hat{Q}$ implies $P \cong Q$ in the stated category for all objects in scope.
   396	\end{definition}
   397	
   398	\begin{remark}[Reconstruction pattern]
   399	\label{rem:pattern}
   400	\Cref{thm:gelfand,thm:stone,thm:dhw} are instances of \cref{def:probe}: Gelfand spectrum from characters, Stone space from clopen sets, bulk operators from boundary subregion algebras. In each case the probes are exact within scope, and in each case the theorem recovers structure rather than producing it. No instance recovers dynamics, and none is a classification theorem for the ambient category.
   401	\end{remark}
   402	
   403	\begin{theorem}[Entanglement-wedge reconstruction, Dong-Harlow-Wall]
   404	\label{thm:dhw}
   405	Let a boundary region $A$ and a code subspace of states be given in the holographic setting, with bulk geometry dual to a state in that subspace. Every bulk operator localized in the entanglement wedge $W(A)$ can be reconstructed as an operator of the boundary subregion $A$ acting on the code subspace; the reconstruction preserves expectation values on that subspace \cite{dhw}. The result is a theorem of quantum information theory (quantum error correction and relative entropy), proved under the stated hypotheses of the holographic code setup.
   406	\end{theorem}
   407	
   408	The theorem assumes its hypotheses strictly: a code subspace and an entanglement-wedge structure are given, and no bulk geometry, field equation, or code subspace is derived from boundary data. It proves exact operator recovery inside a specified wedge, which is a reconstruction theorem in the sense of \cref{def:probe} (structure recovered from probe data, here boundary subregion algebras). The mechanism is quantum error correction: the same bulk operator is represented on several boundary subregions and the representations agree on the code subspace, the algebraic content of complementary recovery. The recovery is exact within the assumed setting.
   409	
   410	\begin{remark}[Yoneda qualification]
   411	\label{rem:yoneda}
   412	Relational determination of objects is the categorical form of the reconstruction pattern: the functor of points $\operatorname{Hom}(-, P)$ determines $P$ up to isomorphism in a locally small category. A standing qualification governs all such arguments here: ``Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.'' Nothing in \cref{thm:gelfand,thm:stone,thm:dhw} lifts object recovery to physical equivalence or to a classification of physical systems.
   413	\end{remark}
   414	
   415	A parallel line of work establishes representability of categorical supermaps whenever a theory has suitable channel-state duality \cite{hefford-wilson, whh}. Whether that line unifies with the Gelfand-Stone-Naimark pattern into one principle is open, and nothing here depends on such a unification.
   416	
   417	\section{Entanglement and emergent geometry}
   418	\label{sec:entanglement}
   419	
   420	The proposals connecting entanglement to geometry come in three strengths, and keeping them apart is the substance of this section.
   421	
   422	\begin{remark}[Ryu-Takayanagi proposal]
   423	\label{rem:rt}
   424	For a boundary region $A$ in a state dual to a bulk, the entanglement entropy $S(A)$ is proposed \cite{rt} to equal the area of the extremal surface homologous to $A$, in natural units $\hbar = c = 1$ reading $S(A) = \operatorname{Area}(\gamma_A)/(4G_N)$, with quantum corrections given by the generalized entropy. The formula is proposed in \cite{rt}, where it is checked exactly in AdS$_3$ with a two-dimensional conformal field theory, and derived for spherical vacuum regions in any dimension by replica and modular methods \cite{chc}. The static formula follows from gravitational replica methods \cite{lm}; the covariant formula with extremal surfaces was proposed in \cite{hrt} and derived in \cite{dlr}; quantum extremal surfaces extend the prescription beyond the classical regime \cite{ew}. For general regions and excited states the formula remains a proposal, and no derivation independent of AdS/CFT is on record.
   425	\end{remark}
   426	
   427	\begin{remark}[Entanglement and connectivity]
   428	\label{rem:vr}
   429	Van Raamsdonk's argument \cite{vr} observes that disentangling two boundary degrees of freedom in a holographic state pinches the bulk geometry apart, and proposes that spacetime connectivity is built from entanglement. The reasoning is an argument from controlled examples and limiting cases; it is not a derivation of the metric from entanglement data.
   430	\end{remark}
   431	
   432	\begin{remark}[Tensor-network models]
   433	\label{rem:happy}
   434	The holographic error-correcting codes of Pastawski, Yoshida, Harlow, and Preskill \cite{happy} realize a discrete analogue of the Ryu-Takayanagi formula and of negative tripartite information inside exactly solvable tensor networks. These are toy models: they demonstrate that the information-theoretic mechanisms are internally consistent, and they carry no evidential weight about actual AdS/CFT.
   435	\end{remark}
   436	
   437	The entropy quantities in these remarks are the standard ones. For a boundary state $\rho$ on a union of pairwise disjoint regions and a subregion $A$, the reduced state is $\rho_A = \operatorname{Tr}_{\bar{A}} \rho$ and the entanglement entropy is $S(A) = -\operatorname{Tr}(\rho_A \log \rho_A)$; the mutual information is $I(A:B) = S(A) + S(B) - S(A \cup B)$; the tripartite information is $I(A:B:C) = I(A:B) + I(A:C) - I(A:BC)$, which expands to $S(A) + S(B) + S(C) - S(A \cup B) - S(A \cup C) - S(B \cup C) + S(A \cup B \cup C)$ and is invariant under all permutations of $A$, $B$, $C$. Strong subadditivity reads $S(A \cup B) + S(B \cup C) \geq S(B) + S(A \cup B \cup C)$, and the monogamy of mutual information reads $I(A:B:C) \leq 0$. In the holographic setting the entropies are the areas of minimal surfaces, and the question of which linear inequalities those areas satisfy is the question of the entropy cone.
   438	
   439	\begin{theorem}[Holographic entropy cone]
   440	\label{thm:cone}
   441	In static holographic settings with $N$ boundary subregions of a state purified by a complement \cite{bao}, the complete linear entropy inequalities for $N = 2, 3, 4$ are generated by subadditivity, the Araki-Lieb inequalities, and monogamy of mutual information. For $N = 5$ five further symmetry orbits of five-party inequalities, including the cyclic five-party inequality, are required, and the resulting description is complete \cite{hc5}. For six and more regions the complete inequality set is unknown. For each fixed $N$ there are only finitely many independent inequalities.
   442	\end{theorem}
   443	
   444	\Cref{thm:cone} is a classification result of the kind the program seeks: finite, complete lists of constraints, proved, with sharp scope boundaries. Completeness holds for at most five regions and is open beyond.
   445	
   446	\begin{remark}[Worked cone constraints]
   447	\label{rem:cone-worked}
   448	Consider four regions with entropies $S(A) = S(B) = S(C) = S(D) = 2.0$, every two-region union $3.5$, every three-region union $4.5$, and $S(A \cup B \cup C \cup D) = 5.0$, in arbitrary units. The four-region state is mixed and is purified by an environment region of entropy $5.0$, so the Araki-Lieb inequality $|S(A \cup B \cup C) - S(D)| \leq S(A \cup B \cup C \cup D)$ reads $2.5 \leq 5.0$ and holds. Strong subadditivity in the form $S(A \cup B) + S(B \cup C) \geq S(B) + S(A \cup B \cup C)$ reads $3.5 + 3.5 \geq 2.0 + 4.5$, which holds. The monogamy of mutual information in the form $I(A:B) + I(A:C) \leq I(A:BC)$ reads $(2.0 + 2.0 - 3.5) + (2.0 + 2.0 - 3.5) \leq 2.0 + 3.5 - 4.5$, that is $0.5 + 0.5 \leq 1.0$, which holds at equality. The cone of \cref{thm:cone} is exactly the set of entropy vectors satisfying all such inequalities simultaneously; the example illustrates the constraints and proves nothing.
   449	\end{remark}
   450	
   451	What the section establishes is a gradient. Entanglement-wedge reconstruction (\cref{thm:dhw}) and the entropy cone (\cref{thm:cone}) are theorems. The entropy formula itself (\cref{rem:rt}) is a proposal with derived special cases. The emergence of geometry from entanglement (\cref{rem:vr}) is an argument. Toy models (\cref{rem:happy}) demonstrate mechanisms, not nature.
   452	
   453	\section{Thermodynamic geometry}
   454	\label{sec:thermo}
   455	
   456	The oldest working dictionary between information metrics and physical curvature is thermodynamic. Weinhold proposed the Hessian of internal energy as a metric on equilibrium states \cite{weinhold}; Ruppeiner proposed the negative Hessian of entropy and read its curvature as a measure of microscopic interaction \cite{ruppeiner}. The Ruppeiner metric of \cref{def:ruppeiner} is, up to sign convention and a conformal factor, the Fisher metric of thermodynamic fluctuation theory, so the dictionary is an instance of information geometry in physical coordinates. The proposal that Einstein's equations are an equation of state of this thermodynamic structure \cite{jacobson} is the sharpest form of the gravity-thermodynamics link on record, and it is a derivation conditional on the horizon thermodynamics it assumes.
   457	
   458	\begin{proposition}[Ideal gas]
   459	\label{prop:ideal-gas}
   460	For the ideal gas with entropy $S(U, V, N) = Nk \bigl(c_v \log U + \log V - (c_v + 1) \log N + \text{const}\bigr)$ at fixed $N$ and heat capacity coefficient $c_v$, the Ruppeiner metric in the coordinates $(U, V)$ is
   461	\begin{equation}
   462	g^{\mathrm{rup}} = Nk \left( c_v \frac{(dU)^2}{U^2} + \frac{(dV)^2}{V^2} \right),
   463	\end{equation}
   464	which is flat: its scalar curvature vanishes identically.
   465	\end{proposition}
   466	
   467	\begin{proof}
   468	The mixed second derivatives of $S$ vanish, $-\partial^2 S / \partial U^2 = Nk c_v/U^2$, and $-\partial^2 S / \partial V^2 = Nk/V^2$. In the coordinates $y = \sqrt{c_v} \log U$ and $z = \log V$ the metric becomes $Nk ((dy)^2 + (dz)^2)$, the Euclidean metric, so the Riemann tensor vanishes and $R = 0$.
   469	\end{proof}
   470	
   471	\Cref{prop:ideal-gas} is the flat baseline of the dictionary: the ideal gas has no microscopic interactions to diagnose, its entropy is separable in the coordinates $(U, V)$ at fixed $N$, and its Ruppeiner geometry is Euclidean in logarithmic coordinates. Interacting models have nonzero Ruppeiner curvature.
   472	
   473	Interacting thermodynamic models have nonzero Ruppeiner scalar curvature that grows sharply near the critical region. For the van der Waals entropy $S(u, v) = \log\bigl((v - b)(u + a/v)^{c_v}\bigr)$ per particle in reduced units $a = b = N = k = 1$ and $c_v = 3/2$ (whose noninteracting limit is the ideal gas of \cref{prop:ideal-gas}), direct computation of the Hessian and the Christoffel symbols gives the closed form
   474	\begin{equation}
   475	\label{eq:vdw-curvature}
   476	R(u, v) = \frac{2uv^5 - 4uv^4 + 2uv^3 - v^4 + 8v^3 - 16v^2 + 12v - 3}{u^2 v^6 - 4uv^5 + 12uv^4 - 6uv^3 + 4v^4 - 24v^3 + 48v^2 - 36v + 9},
   477	\end{equation}
   478	in the convention of \cref{def:ruppeiner} (in Ruppeiner's convention the sign is opposite). The numerator and denominator share no common factor in $(u, v)$, and $R$ vanishes only where the numerator does. Evaluations along the supercritical isochore $v = 3$ give $R \approx 0.417$ at $u = 1$, $R \approx 9.55$ at $u = 0.211$, and $R \approx 179.4$ at $u = 0.131$, a growth of more than two orders of magnitude as the internal energy approaches the critical value $u_c = 1/9 \approx 0.111$, where the denominator also vanishes. The pattern is consistent with Ruppeiner's proposal that flatness marks noninteracting constituents and curvature marks interactions: it holds in the two models computed here, and beyond them it remains a proposed correspondence supported by examples.
   479	
   480	\begin{remark}[Two directions of the dictionary]
   481	\label{rem:dictionary}
   482	Thermodynamic geometry instantiates both directions of the correspondence examined in this paper. Information determines geometry: the entropy function, an information-theoretic object, determines the metric by a Hessian. Geometry diagnoses physics: the curvature of that metric is read as an interaction diagnostic. What thermodynamic geometry does not provide is gravity: the metric here is on the space of equilibrium states, not on a spacetime, and no Einstein equation relating it to matter is derived in this paper.
   483	\end{remark}
   484	
   485	\section{The proposed gravity-information correspondence}
   486	\label{sec:correspondence}
   487	
   488	The Gravity-Information-Geometry research program proposes that curvature and gravitational dynamics arise from informational relationships. This section states the correspondence as precisely as the current evidence allows and separates what is proved from what is proposed.
   489	
   490	\begin{remark}[Proposed correspondence]
   491	\label{rem:correspondence}
   492	The proposed dictionary has three entries. First, entropy of boundary subregions determines bulk geometry, as in the Ryu-Takayanagi formula and its quantum corrections (\cref{rem:rt}). Second, information-geometric metrics on state spaces are candidate sources of physical geometry, as in thermodynamic geometry (\cref{sec:thermo}). Third, gravitational dynamics is proposed to arise from the entanglement structure of microscopic degrees of freedom (\cref{rem:vr}). Entries one and two are precise formulas; entry three is a programmatic direction. None of the three is established as a derivation of Einstein's equations from information-theoretic axioms. Conditional derivations exist and each assumes geometric input: the Einstein equation of state from local horizon thermodynamics \cite{jacobson}, linearized dynamics around AdS from the entropy formula and the entanglement first law \cite{fgkmv, lmvr}, and the full equation from an entanglement-equilibrium condition \cite{jac2016}.
   493	\end{remark}
   494	
   495	Three constraints follow from the analysis.
   496	
   497	\begin{description}
   498	\item[Metric ambiguity] By \cref{prop:nonunique} quantum state spaces carry no canonical monotone metric. A dictionary that assigns geometry to quantum states must select a member $f$ of the Petz family or derive the selection from independent principles. The classical uniqueness of Chentsov (\cref{thm:chentsov}) cannot be invoked past the commutative locus (\cref{prop:commutative}).
   499	\item[Reconstruction scope] \Cref{thm:gelfand,thm:dhw} recover structure from probes. Recovery is not dynamics: no reconstruction theorem on record recovers interacting gravitational dynamics from entanglement data.
   500	\item[Provenance of curvature] The curvature computed in \cref{prop:qubit-sld,prop:ideal-gas} is intrinsic to a state space or to an equilibrium manifold. The proposed identification of such curvature with spacetime curvature is a further hypothesis, and the computations here neither support nor refute it.
   501	\end{description}
   502	
   503	The metric ambiguity is the sharpest of the three. In classical statistical mechanics the ruler is unique, so a correspondence of the form ``statistical geometry equals physical geometry'' has no normalization freedom beyond a constant. In quantum statistical mechanics the ruler is a function $f$, and two different rulers give genuinely different geometries on the same state space, as \cref{prop:nonunique} exhibits. Any claim that a quantum state space ``has'' a geometry must therefore answer: which monotone metric, and why.
   504	
   505	The emergent-spacetime program states a central test with four targets: recover, from primitive categorical or informational objects, (i) gauge connections and curvature, (ii) quantum states and observables, (iii) interacting gauge-field dynamics, and (iv) spacetime geometry and gravitational dynamics, without assuming at the outset the spacetime geometry the reconstruction is meant to explain. Each target sits at a different point of the proved-to-proposed gradient.
   506	
   507	\begin{description}
   508	\item[Connections and curvature] Thermodynamic geometry shows that curvature can be computed from an information object (the entropy function) in equilibrium settings, and the qubit computations show that a state space can carry constant-curvature geometry. The proposed identification of such curvature with physical or spacetime curvature is unestablished.
   509	\item[States and observables] The reconstruction pattern proves recovery of $(X, \mathcal{O})$ from probe data in the commutative setting (\cref{thm:gelfand,thm:stone}) and of bulk operators from boundary subregions in the holographic code setting (\cref{thm:dhw}). Both recover structure; neither delivers dynamics.
   510	\item[Gauge dynamics] No reconstruction theorem on record in the setting of this paper recovers interacting gauge dynamics from information-geometric data. The status of rigorous four-dimensional gauge dynamics is tracked separately in the series and is not used as a premise here.
   511	\item[Spacetime and gravity] The entropy formula is a proposal with derived special cases, the emergence of connectivity is an argument, and the conditional derivations of \cite{jacobson, fgkmv, lmvr, jac2016} each assume geometric input; no unconditional derivation of Einstein's equations from information-theoretic axioms is on record.
   512	\end{description}
   513	
   514	\begin{remark}[Structure-preserving discipline]
   515	\label{rem:preservation}
   516	Any proposed identification of systems should state which layers of structure it preserves; equivalences that forget the monoidal or symmetric layer are provably insufficient to recover the underlying group (a constraint from tensor-category theory). The same discipline applies to the proposed correspondences of this section. A dictionary that identifies information-geometric data with physical geometry must state what the identification preserves: the state space, the algebra of observables, the metric class, the dynamics, or some combination. No proposed correspondence examined here states its preserved layers, and none of them is presented as an equivalence.
   517	\end{remark}
   518	
   519	
   520	Deriving gravitational dynamics from quantum state spaces requires three steps that current theorems do not supply. First, a physical principle independent of gravity must select one metric from the Petz family, whereas channel monotonicity leaves an infinite functional parameter $f$ undetermined (\cref{prop:nonunique}). Second, a construction must map Riemannian geometry on state space to a Lorentzian metric on spacetime; the Ryu-Takayanagi formula instead relates bulk areas to subregion entropies of a fixed state, and its derivations cover only symmetric or semiclassical regimes \cite{chc, lm, dlr}. Third, the induced spacetime metric must satisfy Einstein's equations without assuming horizon thermodynamics at the outset \cite{jacobson}.
   521	
   522	The three dictionaries can be compared side by side.
   523	
   524	\begin{table}[ht]
   525	\centering
   526	\small
   527	\begin{tabular}{L{0.19\textwidth} L{0.24\textwidth} L{0.24\textwidth} L{0.21\textwidth}}
   528	\toprule
   529	Dictionary & Data taken & Geometry produced & Status in this paper \\
   530	\midrule
   531	State space & Statistical or quantum state data & Fisher or Petz metric on the state space & Theorem, with a metric parameter in the quantum case \\
   532	Thermodynamic & Entropy function of an equilibrium system & Ruppeiner metric on the equilibrium manifold & Computed in two models and proposed beyond them \\
   533	Spacetime & Boundary entanglement entropies & Bulk metric via minimal-surface areas & Proposal with derived special cases \\
   534	\bottomrule
   535	\end{tabular}
   536	\caption{The three geometric correspondences of this paper, with the data each takes and the status each holds. Only the first row is established without qualification.}
   537	\label{tab:dictionaries}
   538	\end{table}
   539	
   540	The three dictionaries of \cref{tab:dictionaries} are therefore not steps of one derivation. The entropy formula takes subregion entropies of a single state, which carry no Petz parameter, and relates them to areas of a posited bulk geometry; it does not convert a state-space metric into a spacetime metric. The steps a genuine derivation would need are those of the preceding paragraph, and each is open in the sense of \cref{sec:open}.
   541	
   542	\section{Computational evidence}
   543	\label{sec:computation}
   544	
   545	Four computational experiments accompany the paper. They are evidence for the computations above and are never proofs. The scripts live in \texttt{src/vol-09-gravity-information-geometry/} and each header names the claim it evidences.
   546	
   547	The monotonicity experiment verifies \cref{prop:monotone} numerically. For two thousand random interior points $p$ of the four-outcome simplex and random stochastic maps from four outcomes to three, the smallest eigenvalue of $g_p - (D\varphi)^{\mathsf{T}} g_{\varphi p} (D\varphi)$ restricted to the tangent space was $1.028$ at worst. The eigenvalues are taken in the ambient Euclidean metric on an orthonormal tangent basis, since a difference of metric tensors has no canonical eigenvalues without a reference metric; the positive floor is a sampling artifact of random maps avoiding the coarse-grainings where equality holds.
   548	
   549	The monotone-metric experiment verifies \cref{prop:nonunique,prop:commutative} and \cref{rem:qutrit}. At the qubit state $\operatorname{diag}(3/4, 1/4)$ the radial-to-transverse ratio is $1.333333$ for the symmetric logarithmic derivative metric and $1.244017$ for the Wigner-Yanase metric, matching the closed forms $4/3$ and $(2+\sqrt{3})/3$ to twelve decimal places. At the qutrit state $\operatorname{diag}(0.5, 0.3, 0.2)$ the off-diagonal tangent $X_{13} = 1/2$ gives $1.428571$ and $1.500988$, and the diagonal tangent gives $0.163333$ for both normalized metrics and for the Fisher value.
   550	
   551	The qubit-geometry experiment verifies \cref{prop:qubit-sld,prop:qubit-fid}. Metric evaluations from the symmetric logarithmic derivative equation match the closed form $|d\vec{r}|^2 + (\vec{r} \cdot d\vec{r})^2 / (1 - |\vec{r}|^2)$ in two hundred random trials to within $10^{-9}$, and the metric tensor in $(\chi, \theta, \varphi)$ coordinates matches $\operatorname{diag}(1, \sin^2\!\chi, \sin^2\!\chi \sin^2\!\theta)$ to within $10^{-10}$ at sampled points, which is the round three-sphere of radius one. Finite-difference fidelity evaluations give $g^{\mathrm{fid}} = g^{\mathrm{sld}}/4$ in dimensions two to four, with worst relative error $3.2 \times 10^{-4}$ over one hundred and eighty random full-rank states and directions. The geodesic distance from the center, obtained by numerical quadrature of the closed-form radial element, matches $\arcsin r$ to within $10^{-6}$ at five sampled radii.
   552	
   553	The thermodynamic experiment verifies \cref{prop:ideal-gas} and the van der Waals computation. The symbolic Ricci scalar of the ideal gas metric $\operatorname{diag}(c_v/u^2, 1/v^2)$ at $N = k = 1$ is exactly zero, and the numeric evaluation agrees (the constants $Nk$ and $c_v$ do not affect the vanishing). The van der Waals Ricci scalar is a rational function of $(u, v)$ whose sampled values are those recorded in \cref{sec:thermo}: nonzero away from the critical point, growing from $0.128$ at $(2, 2)$ to $179.4$ at $(0.131, 3)$ near the critical internal energy $u_c = 0.111$.
   554	
   555	\section{Code evidence}
   556	\label{sec:code-appendix}
   557	
   558	Each computational claim of \cref{sec:computation} maps to a function in the accompanying code.

exec
/usr/local/bin/zsh -lc "sed -n '316,429p' papers/latex/vol-09-gravity-information-geometry.tex | nl -ba -v316" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   316	\begin{proof}
   317	Both metrics are invariant under the rotations of the Bloch ball induced by unitary conjugation, so at each $\vec{r}$ the rotation group fixing $\vec{r}$ forces the cross term between radial and transverse directions to vanish and fixes transverse isotropy, and the quadratic form is determined by its radial and transverse values. For the transverse direction, set $\sigma = \rho + \varepsilon X$ with $X = \sigma_x/2$ and $\rho = \operatorname{diag}(\lambda_+, \lambda_-)$. Then $\sqrt{\rho}\, \sigma \sqrt{\rho} = \left(\begin{smallmatrix} \lambda_+^2 & \tfrac{\varepsilon}{2}\sqrt{\lambda_+ \lambda_-} \\ \tfrac{\varepsilon}{2}\sqrt{\lambda_+ \lambda_-} & \lambda_-^2 \end{smallmatrix}\right)$, whose determinant is $\lambda_+ \lambda_- (\lambda_+ \lambda_- - \varepsilon^2/4)$. Since $(\operatorname{Tr}\sqrt{M})^2 = \operatorname{Tr} M + 2\sqrt{\det M}$, one gets $\operatorname{Tr}\sqrt{\sqrt{\rho}\,\sigma\sqrt{\rho}} = 1 - \varepsilon^2/8 + O(\|\varepsilon X\|^3)$ and $d_B^2 = 2(1 - \sqrt{F}) = \varepsilon^2/4 + O(\|\varepsilon X\|^3)$, matching $\tfrac{1}{4} g^{\mathrm{sld}}(X, X) = 1/4$ from \cref{prop:qubit-sld} at every $r$. For the radial direction the states commute and the fidelity reduces to the classical affinity $\sum_i \sqrt{p_i q_i}$ on the Bernoulli pair $p = ((1+r)/2, (1-r)/2)$; the expansion $\sum_i \sqrt{p_i (p_i + \delta_i)} = 1 - \sum_i \delta_i^2 / (8 p_i) + O(\|\delta\|^3)$ for $\sum_i \delta_i = 0$ gives $d_B^2 = \sum_i \delta_i^2 / (4 p_i)$, one quarter of the classical Fisher value, and the classical Fisher value is $g^{\mathrm{sld}}$ on the diagonal by \cref{prop:commutative}. The curvature claim follows from \cref{prop:qubit-sld} and the constant factor $1/4$, which multiplies sectional curvatures by $4$.
   318	\end{proof}
   319	
   320	\begin{remark}[Normalization conventions]
   321	\label{rem:conventions}
   322	The factor between the fidelity metric and the symmetric logarithmic derivative metric depends on the normalization of the fidelity, and conventions differ across sources. In the convention of \cref{def:fidelity}, where $d_B^2 = 2(1-\sqrt{F})$, the fidelity metric of the qubit is one quarter of the symmetric logarithmic derivative metric, and the corresponding sphere has radius $1/2$ rather than $1$. The intrinsic statements of \cref{prop:qubit-sld,prop:qubit-fid} are convention-free up to this constant: both geometries are round three-spheres up to the open-hemisphere restriction, and the constant relates their radii. Any comparison of curvature values across sources must first fix the normalization.
   323	\end{remark}
   324	
   325	\begin{remark}[Constant curvature without spacetime]
   326	\label{rem:sphere}
   327	\Cref{prop:qubit-sld,prop:qubit-fid} are statements about information geometry. The round three-sphere appearing here is the geometry of statistical distinguishability on a two-level quantum system; it is not a spacetime and no claim about spacetime dimension or signature follows. The example exists to separate the two readings of ``geometric correspondence'': state spaces carry Riemannian geometry by construction, and whether that geometry is physical is a further question.
   328	\end{remark}
   329	
   330	\begin{remark}[Geodesic distance on the qubit]
   331	\label{rem:distance}
   332	In the coordinates of \cref{prop:qubit-sld} the geodesic distance from the maximally mixed state $\vec{r} = 0$ to the state $\vec{r} = r \vec{n}$ is $\chi = \arcsin r$, since $g^{\mathrm{sld}} = (d\chi)^2 + \sin^2\!\chi \, (d\Omega)^2$ and radial geodesics of the round sphere have length equal to the angle. Pure states sit at distance $\pi/2$ from the center, and the diameter of the interior is $\pi$: the space of qubit states is a hemisphere of finite diameter carried by statistical distinguishability, not by any spacetime interpretation. The computational check in \cref{sec:computation} compares this distance profile against the closed form.
   333	\end{remark}
   334	
   335	\section{Information geometry as invariant data}
   336	\label{sec:invariants}
   337	
   338	The classification program identifies objects by invariants, in the spirit of the companion data that practitioners use to tell objects apart in a completed classification. For statistical systems the candidate invariants are the sample-space size, the isometry class of the Fisher geometry, and the curvature data of statistical submodels.
   339	
   340	\begin{corollary}[Fisher geometry of the full simplex]
   341	\label{cor:homogeneity}
   342	The Fisher metric on the interior of $\Delta_{n-1}$ is locally isometric to the round sphere of radius two, with sectional curvature $1/4$ for $n \geq 3$, and the arc of \cref{rem:bernoulli} for $n = 2$. The isometry group of the full model is the finite group of coordinate permutations. Two statistical models defined on the full simplex with the same number of outcomes are isometric as Riemannian manifolds, and a permutation of outcomes is an isometry.
   343	\end{corollary}
   344	
   345	\begin{proof}
   346	The substitution $p_i = y_i^2$ of \cref{rem:bernoulli} is an isometry onto the positive orthant of the round sphere of radius two. A global isometry of the connected constant-curvature orthant extends uniquely to an ambient isometry of its metric completion $S^{n-1}(2)$, and such an isometry permutes the $n$ extreme rays of the orthant; the orthogonal maps permuting those rays are exactly the permutation matrices. Permutations preserve $\sum_i p_i = 1$ and the metric $\sum_i (dp_i)^2 / p_i$ directly, so the isometry group is the permutation group.
   347	\end{proof}
   348	
   349	\Cref{cor:homogeneity} is a classification statement of the trivial kind: the full models of a fixed sample size form one isometry class, and the only invariant is $n$. The classification content of information geometry therefore lives in statistical submodels.
   350	
   351	\begin{definition}[Statistical submodel]
   352	\label{def:submodel}
   353	A statistical submodel is a smooth embedding $i : M' \to \Delta_{n-1}^{\circ}$ of a lower-dimensional manifold $M'$ into the simplex, with the pullback metric $g' = i^{*} g^{\mathrm{fisher}}$. The intrinsic and extrinsic curvature invariants of $(M', g')$ are invariants of the model. Exponential families are the canonical submodels.
   354	\end{definition}
   355	
   356	\begin{remark}[Embedded two-outcome model]
   357	\label{rem:embedded}
   358	Inside the three-outcome simplex consider $p(\theta) = (\theta, (1-\theta)/2, (1-\theta)/2)$ for $\theta \in (0, 1)$. The tangent vector is $p'(\theta) = (1, -1/2, -1/2)$, and the induced metric is
   359	\begin{equation}
   360	g' = \Bigl( \frac{1}{\theta} + \frac{1/4}{(1-\theta)/2} + \frac{1/4}{(1-\theta)/2} \Bigr) d\theta^2
   361	= \frac{(d\theta)^2}{\theta(1-\theta)},
   362	\end{equation}
   363	exactly the Fisher metric of the standalone two-outcome model of \cref{rem:bernoulli}. The embedding is isometric onto its image, so intrinsic geometry cannot detect the sample-space size: two models with different numbers of outcomes can share a submodel geometry. The induced metric is unchanged here because the embedding is a sufficient-statistic Markov map. Among linear stochastic maps, pullback preserves the Fisher metric exactly when the map is a sufficient-statistic embedding, and general smooth embeddings can reproduce the same intrinsic metric without being Markov maps, so intrinsic geometry alone does not detect the embedding. Extrinsic data of the embedding is additional invariant content.
   364	\end{remark}
   365	
   366	\begin{remark}[Classifying data for statistical models]
   367	\label{rem:family-v}
   368	For statistical models (probability and measure structures), the Fisher metric is the natural classifying invariant in the classical case. \Cref{cor:homogeneity} and \cref{def:submodel} make that naming precise: the invariant is the metric up to isometry, trivial on full models and rich on submodels. This is the opposite of the symplectic situation, where local classification is trivial by Darboux's theorem and all content is global. Information geometry has local content and uses it. On the quantum side the invariant data must additionally name the member $f$ of the Petz family (\cref{prop:nonunique}), so the classifying data of a quantum state system is the pair (state space, $f$) and never the state space alone.
   369	\end{remark}
   370	
   371	\begin{remark}[Classification status of statistical models]
   372	\label{rem:status}
   373	The evidence of this paper supports the following summary. Classical statistical models of fixed sample size are classified by \cref{cor:homogeneity} up to isometry of their full Fisher geometry, and statistical submodels carry curvature invariants without a complete classification being on record. Quantum state systems are classified as metric spaces only after the parameter $f$ is fixed, and no physical principle in this paper fixes it. Statistical models are therefore a worked example of a general pattern in classification: a complete island (Chentsov, Petz-Sud\'ar), a trivial stratum (full simplices), and open content (submodels, quantum parameter selection).
   374	\end{remark}
   375	
   376	\section{Reconstruction from probes}
   377	\label{sec:reconstruction}
   378	
   379	The second proved pattern available to a gravity-information program is reconstruction: an object recovered from data about its relationships. Three classical results fix the pattern, and one quantum-information result applies it to entanglement.
   380	
   381	\begin{theorem}[Gelfand-Naimark and Gelfand duality]
   382	\label{thm:gelfand}
   383	Every commutative unital $C^*$-algebra is isometrically $*$-isomorphic to $C(X)$ for a compact Hausdorff space $X$, its Gelfand spectrum; contravariantly, the categories of commutative unital $C^*$-algebras and of compact Hausdorff spaces are dual \cite{gn}. In particular the space $X$ is recovered from the algebra of observables $\mathcal{O} = C(X)$ alone.
   384	\end{theorem}
   385	
   386	\begin{theorem}[Stone duality]
   387	\label{thm:stone}
   388	Boolean algebras are dual to compact totally disconnected Hausdorff spaces \cite{stone}; the space is recovered from the algebra of clopen sets.
   389	\end{theorem}
   390	
   391	These theorems are classification-grade only in the commutative setting: there $X$ is determined by $\mathcal{O}$ up to homeomorphism. The noncommutative Gelfand-Naimark theorem embeds an arbitrary $C^*$-algebra into the operators of some Hilbert space, which is a representation theorem, not a classification. Reconstruction of a state space from probe data is weaker than classification of all state spaces, and this distinction is the one the classification program must preserve.
   392	
   393	\begin{definition}[Probe data and reconstruction]
   394	\label{def:probe}
   395	Probe data of an object $P$ is a family of measurements or relationships $\{\phi_i(P)\}$ indexed by probes $\phi_i$; a reconstruction theorem assigns to the probe data an object $\hat{P}$ together with an isomorphism $\hat{P} \cong P$ in a stated category. The theorem is classification-grade only when the probes are a complete invariant, that is, when $\hat{P} \cong \hat{Q}$ implies $P \cong Q$ in the stated category for all objects in scope.
   396	\end{definition}
   397	
   398	\begin{remark}[Reconstruction pattern]
   399	\label{rem:pattern}
   400	\Cref{thm:gelfand,thm:stone,thm:dhw} are instances of \cref{def:probe}: Gelfand spectrum from characters, Stone space from clopen sets, bulk operators from boundary subregion algebras. In each case the probes are exact within scope, and in each case the theorem recovers structure rather than producing it. No instance recovers dynamics, and none is a classification theorem for the ambient category.
   401	\end{remark}
   402	
   403	\begin{theorem}[Entanglement-wedge reconstruction, Dong-Harlow-Wall]
   404	\label{thm:dhw}
   405	Let a boundary region $A$ and a code subspace of states be given in the holographic setting, with bulk geometry dual to a state in that subspace. Every bulk operator localized in the entanglement wedge $W(A)$ can be reconstructed as an operator of the boundary subregion $A$ acting on the code subspace; the reconstruction preserves expectation values on that subspace \cite{dhw}. The result is a theorem of quantum information theory (quantum error correction and relative entropy), proved under the stated hypotheses of the holographic code setup.
   406	\end{theorem}
   407	
   408	The theorem assumes its hypotheses strictly: a code subspace and an entanglement-wedge structure are given, and no bulk geometry, field equation, or code subspace is derived from boundary data. It proves exact operator recovery inside a specified wedge, which is a reconstruction theorem in the sense of \cref{def:probe} (structure recovered from probe data, here boundary subregion algebras). The mechanism is quantum error correction: the same bulk operator is represented on several boundary subregions and the representations agree on the code subspace, the algebraic content of complementary recovery. The recovery is exact within the assumed setting.
   409	
   410	\begin{remark}[Yoneda qualification]
   411	\label{rem:yoneda}
   412	Relational determination of objects is the categorical form of the reconstruction pattern: the functor of points $\operatorname{Hom}(-, P)$ determines $P$ up to isomorphism in a locally small category. A standing qualification governs all such arguments here: ``Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.'' Nothing in \cref{thm:gelfand,thm:stone,thm:dhw} lifts object recovery to physical equivalence or to a classification of physical systems.
   413	\end{remark}
   414	
   415	A parallel line of work establishes representability of categorical supermaps whenever a theory has suitable channel-state duality \cite{hefford-wilson, whh}. Whether that line unifies with the Gelfand-Stone-Naimark pattern into one principle is open, and nothing here depends on such a unification.
   416	
   417	\section{Entanglement and emergent geometry}
   418	\label{sec:entanglement}
   419	
   420	The proposals connecting entanglement to geometry come in three strengths, and keeping them apart is the substance of this section.
   421	
   422	\begin{remark}[Ryu-Takayanagi proposal]
   423	\label{rem:rt}
   424	For a boundary region $A$ in a state dual to a bulk, the entanglement entropy $S(A)$ is proposed \cite{rt} to equal the area of the extremal surface homologous to $A$, in natural units $\hbar = c = 1$ reading $S(A) = \operatorname{Area}(\gamma_A)/(4G_N)$, with quantum corrections given by the generalized entropy. The formula is proposed in \cite{rt}, where it is checked exactly in AdS$_3$ with a two-dimensional conformal field theory, and derived for spherical vacuum regions in any dimension by replica and modular methods \cite{chc}. The static formula follows from gravitational replica methods \cite{lm}; the covariant formula with extremal surfaces was proposed in \cite{hrt} and derived in \cite{dlr}; quantum extremal surfaces extend the prescription beyond the classical regime \cite{ew}. For general regions and excited states the formula remains a proposal, and no derivation independent of AdS/CFT is on record.
   425	\end{remark}
   426	
   427	\begin{remark}[Entanglement and connectivity]
   428	\label{rem:vr}
   429	Van Raamsdonk's argument \cite{vr} observes that disentangling two boundary degrees of freedom in a holographic state pinches the bulk geometry apart, and proposes that spacetime connectivity is built from entanglement. The reasoning is an argument from controlled examples and limiting cases; it is not a derivation of the metric from entanglement data.

exec
/usr/local/bin/zsh -lc "python3 -c 'import re,collections; s=open(\"papers/latex/vol-09-gravity-information-geometry.tex\").read(); labels=re.findall(r\"\\\\label\\{(["'^}]+)'"\\}\",s); bibs=re.findall(r\"\\\\bibitem\\{(["'^}]+)'"\\}\",s); refs=[(s.count(\"\\n\",0,m.start())+1,k.strip()) for m in re.finditer(r\"\\\\(?:[cC]ref|[cC]refrange|eqref|ref)\\{(["'^}]+)'"\\}(?:\\{(["'^}]+)'"\\})?\",s) for group in m.groups() if group for k in group.split(\",\")]; cites=[(s.count(\"\\n\",0,m.start())+1,k.strip()) for m in re.finditer(r\"\\\\cite\\{(["'^}]+)'"\\}\",s) for k in m.group(1).split(\",\")]; print(\"Missing references:\",[x for x in refs if x[1] not in labels]); print(\"Missing citations:\",[x for x in cites if x[1] not in bibs]); print(\"Duplicate labels:\",[k for k,v in collections.Counter(labels).items() if v>1]); print(\"Duplicate bibliography keys:\",[k for k,v in collections.Counter(bibs).items() if v>1]); stack=[]; errors=[]
for m in re.finditer(r\"\\\\(begin|end)\\{(["'^}]+)'"\\}\",s):
 if m[1]==\"begin\": stack.append(m[2])
 elif not stack or stack.pop()"'!=m[2]: errors.append(s.count("'"\\n\",0,m.start())+1)
print(\"Environment mismatches:\",errors,\"Unclosed:\",stack); print(\"Non-ASCII characters:\",sorted(set(c for c in s if ord(c)>127)))'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 27ms:
Missing references: []
Missing citations: []
Duplicate labels: []
Duplicate bibliography keys: []
Environment mismatches: [] Unclosed: []
Non-ASCII characters: []

codex
No source-level formatting issues found in the specified file. Package declarations cover the commands used; environments are balanced; all reference and citation keys resolve; labels and bibliography keys are unique. No concrete styling or spacing fixes are required.

This was a source-only review. Compilation and rendered overfull/underfull box warnings were not verified.

VERDICT: PASS (no issues remain)
hook: Stop
hook: Stop Completed
tokens used
33,231
No source-level formatting issues found in the specified file. Package declarations cover the commands used; environments are balanced; all reference and citation keys resolve; labels and bibliography keys are unique. No concrete styling or spacing fixes are required.

This was a source-only review. Compilation and rendered overfull/underfull box warnings were not verified.

VERDICT: PASS (no issues remain)
