---
reviewer: codex (OpenAI) gpt-6.1-sol
type: code-audit
paper: vol-09-gravity-information-geometry
round: 1
date: 2026-10-30T05:13:10Z
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
session id: 01a18b39-eb0f-7200-b56a-2b354adb244d
--------
user
Read papers/latex/vol-09-gravity-information-geometry.tex and ONLY the files under src/vol-09-gravity-information-geometry/ that its code evidence appendix names (do not explore anything else). For EVERY row of the appendix output one line: ROW <n> | <claim, 10 words max> | SUPPORTS | PARTIAL | NO | <one-sentence reason>. SUPPORTS means the named code actually demonstrates or tests the claim as stated. End with VERDICT: PASS if every row is SUPPORTS, else VERDICT: NEEDS_FIX.
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
I’ll read the paper and the source files named in its code evidence appendix, then assess each row against the code.
exec
/usr/local/bin/zsh -lc 'cat papers/latex/vol-09-gravity-information-geometry.tex' in /Users/mlong/Documents/Development/classification-physical-systems
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

\title{Gravity, Information, and Geometric Correspondence\\[4pt]
  {\normalsize Part 9 of \emph{The Classification of Mathematical Representations of Physical Systems}}}
\author{Matthew Long\\
  \small The YonedaAI Collaboration, YonedaAI Research Collective\\
  \small Chicago, Illinois, USA\\
  \small \texttt{mlong@yonedalabs.ai}\\
  \small \texttt{https://yonedalabs.ai}}
\date{October 2026}

\begin{document}

\maketitle

\begin{abstract}
This paper examines the relationship between information geometry and gravity from the viewpoint of classification: which geometric structures on state spaces are established mathematics, and which proposed correspondences remain conjectural. Six results are established in finite dimensions. The Fisher family is unique up to a positive constant among metric families on the probability simplices that are monotone under stochastic maps, and monotonicity is proved directly. On quantum state spaces uniqueness fails: monotone metrics form the Petz family of operator monotone functions, and the symmetric logarithmic derivative and Wigner-Yanase metrics are not proportional on qubit states. Every metric of the family restricts to the Fisher metric on commuting states, so uniqueness holds exactly on the commutative locus. The symmetric logarithmic derivative metric makes the open qubit state space an open hemisphere of the round three-sphere of radius one. Thermodynamic Ruppeiner geometry of the ideal gas is flat, and a van der Waals model has nonzero scalar curvature away from the critical region. Entanglement-wedge reconstruction and the holographic entropy cone for at most five regions are theorems; the entropy formula and the emergence of spacetime from entanglement are proposals, and the correspondence between gravity and information geometry is proposed, not proved.
\end{abstract}

\section{Introduction}

Two research programs meet at the phrase ``gravity from information.'' One asks how statistical structure on spaces of states acquires Riemannian geometry. The other asks how spacetime geometry, and eventually gravitational dynamics, could be reconstructed from quantum information. The first program contains complete theorems. The second contains proposals, one reconstruction theorem of quantum information theory, and a central question that is open. This paper develops the first program in finite dimensions, records exactly what the second program has and has not established, and identifies the point where the two touch: the choice of metric on a space of quantum states.

The information-geometric side is sharp. Chentsov's theorem \cite{chentsov, petz-sudar} says that on the probability simplex there is, up to a positive constant, exactly one Riemannian metric that decreases under stochastic maps, the Fisher metric. Petz and Sud\'ar \cite{petz-sudar} extended the question to density matrices and found the opposite of uniqueness: the monotone metrics on finite-dimensional state spaces are classified by operator monotone functions, an infinite family. This uniqueness-then-failure pattern is the spine of the paper. It is also a constraint on classification: a proposed dictionary that assigns geometry to quantum states has to name which member of the Petz family it uses, and the classical uniqueness that motivates such a dictionary does not transfer.

The holographic side is graded. Within quantum information theory, the entanglement-wedge reconstruction theorem of Dong, Harlow, and Wall \cite{dhw} is proved, and the holographic entropy cone is complete for at most five boundary regions \cite{bao, hc5}. The Ryu-Takayanagi formula \cite{rt} is argued from AdS/CFT and derived for spherical vacuum regions in any dimension \cite{chc}; the static formula follows from replica methods \cite{lm}, and the covariant formula with extremal surfaces was proposed in \cite{hrt} and derived in \cite{dlr}. For general regions and states it remains a proposal. Van Raamsdonk's suggestion that entanglement builds spacetime \cite{vr} is an argument from limiting cases.

The thermodynamic side supplies the oldest working dictionary between information metrics and physical curvature. The Ruppeiner metric, the negative Hessian of entropy, is flat for the ideal gas and develops curvature in interacting models \cite{ruppeiner}. A separate thermodynamic route derives the Einstein equation of state from local horizon thermodynamics \cite{jacobson}; it does not use Ruppeiner curvature, and the relation between the two thermodynamic constructions is itself a proposed correspondence.

The paper proves six results. Fisher monotonicity is proved directly, and the classical uniqueness of Chentsov is recorded with its exact scope. The Petz family is recorded, and non-uniqueness is exhibited by explicit computation: on the qubit state space the symmetric logarithmic derivative metric and the Wigner-Yanase metric have different radial-to-transverse ratios. Uniqueness is then localized: every metric of the family restricts to the Fisher metric on commuting states, by a computation on diagonal tangent vectors together with Chentsov's theorem. The symmetric logarithmic derivative metric on the open qubit state space is computed in Bloch coordinates and identified with an open hemisphere of the round three-sphere of radius one. Finally the Ruppeiner metric of the ideal gas is proved flat by an explicit coordinate change, and the van der Waals scalar curvature is computed away from the critical point.

This paper treats information geometry as an invariant discipline for spaces of statistical and quantum states and tests whether it can support a geometric correspondence with gravity. On the commutative locus the invariant metric is unique. Off it, the metric is parametric, and any correspondence of the form ``state space geometry equals physical geometry'' inherits that parameter. Reconstruction results (Gelfand, Stone, Naimark) and entanglement-wedge reconstruction recover structure from probes; they do not by themselves produce gravitational dynamics. Whether the proposed structures recover an interacting physical theory without assuming at the outset the spacetime geometry they aim to explain remains open.

The phrase ``geometric correspondence'' hides three different dictionaries, and the paper keeps them apart. The state-space dictionary assigns Riemannian geometry to spaces of statistical or quantum states, and is a theorem. The thermodynamic dictionary assigns curvature to equilibrium manifolds and reads it as an interaction diagnostic, and is a working practice with computed examples. The spacetime dictionary assigns bulk geometry to boundary entanglement, and is a proposal with derived special cases. Only the first is established without qualification, and only the first is used as a premise below.

\section{Definitions}
\label{sec:definitions}

\begin{definition}[Statistical model]
\label{def:stat-model}
A statistical model is a finite set $\Omega = \{1, \dots, n\}$ and an open subset $M$ of the interior of the probability simplex $\Delta_{n-1}$. A point $p \in M$ is a strictly positive probability vector, and the tangent space at $p$ is identified with the subspace of $\mathbb{R}^n$ of vectors $u$ with $\sum_i u_i = 0$.
\end{definition}

\begin{definition}[Fisher metric]
\label{def:fisher}
The Fisher metric of a statistical model $M$ assigns to each $p \in M$ the bilinear form
\begin{equation}
g_p(u, v) = \sum_{i=1}^{n} \frac{u_i v_i}{p_i}.
\end{equation}
It is a Riemannian metric on $M$, positive definite on tangent vectors.
\end{definition}

\begin{definition}[Stochastic map and monotone metric]
\label{def:stochastic}
A stochastic map is an $m \times n$ matrix $\varphi$ with $\varphi_{ji} \geq 0$ and $\sum_{j} \varphi_{ji} = 1$ for every $i$, acting on distributions by $p \mapsto \varphi p$ where $(\varphi p)_j = \sum_i \varphi_{ji} p_i$. A monotone metric is a family $\{g^{(n)}\}_{n \geq 2}$ of smooth Riemannian metrics, one on each open simplex $\Delta_{n-1}^{\circ}$, such that for every stochastic map $\varphi$ and every tangent vector $u$ at $p \in \Delta_{n-1}^{\circ}$ with $\varphi p \in \Delta_{m-1}^{\circ}$,
\begin{equation}
g^{(m)}_{\varphi p}(D\varphi \cdot u, \; D\varphi \cdot u) \leq g^{(n)}_p(u, u).
\end{equation}
Monotonicity says that processing cannot increase statistical distinguishability. The Fisher family of \cref{def:fisher}, one Fisher metric per simplex, is monotone by \cref{prop:monotone}. The cross-dimensional quantifier is essential: on a fixed simplex alone, uniqueness of the monotone metric fails already at $n = 2$, where the flat metric $g_p(u,u) = u_1^2 + u_2^2$ on $\Delta_1^{\circ}$ also satisfies the inequality, and stochastic maps between simplices of different sizes are what eliminate it.
\end{definition}

\begin{definition}[Quantum state space]
\label{def:quantum-states}
For $d \geq 2$ let $\mathcal{D}_d$ be the set of density operators on $\mathbb{C}^d$, that is, the positive semidefinite Hermitian matrices of trace one. The interior $\mathcal{D}_d^{\circ}$ consists of the full-rank states; it is a smooth manifold of dimension $d^2 - 1$. A tangent vector at $\rho$ is a traceless Hermitian matrix $X$. A completely positive trace-preserving map (channel) $\Phi : \mathcal{D}_d \to \mathcal{D}_{m}$ acts on states in the usual way and is the quantum image of a stochastic map.
\end{definition}

\begin{definition}[Monotone metric on quantum states]
\label{def:quantum-monotone}
A monotone metric is a family $\{g^{(d)}\}$ of Riemannian metrics, one on each $\mathcal{D}_d^{\circ}$, such that for every channel $\Phi : \mathcal{D}_d \to \mathcal{D}_m$, every full-rank state $\rho \in \mathcal{D}_d^{\circ}$ with $\Phi(\rho) \in \mathcal{D}_m^{\circ}$, and every tangent vector $X$ at $\rho$,
\begin{equation}
g^{(m)}_{\Phi(\rho)}(D\Phi \cdot X, \; D\Phi \cdot X) \leq g^{(d)}_{\rho}(X, X).
\end{equation}
Invariance under unitary conjugation is not an extra hypothesis: $\rho \mapsto U \rho U^{\dagger}$ is a channel with channel inverse $\rho \mapsto U^{\dagger} \rho U$, so monotonicity in both directions forces invariance. The same argument applies to permutations of coordinates in \cref{def:stochastic}.
\end{definition}

\begin{definition}[Symmetric logarithmic derivative]
\label{def:sld}
Let $\rho \in \mathcal{D}_d^{\circ}$ and let $X$ be a tangent vector at $\rho$. The symmetric logarithmic derivative of $X$ at $\rho$ is the unique Hermitian matrix $L$ with
\begin{equation}
X = \frac{\rho L + L \rho}{2}.
\end{equation}
The symmetric logarithmic derivative metric is $g^{\mathrm{sld}}_{\rho}(X, X) = \operatorname{Tr}(X L)$.
\end{definition}

\begin{definition}[Operator monotone function and the Petz family]
\label{def:petz}
A function $f : (0, \infty) \to (0, \infty)$ is normalized operator monotone when it is operator monotone (the Loewner order is preserved on positive matrices), and satisfies $f(1) = 1$ and $f(t) = t f(1/t)$ for all $t > 0$. For such an $f$, the Petz metric \cite{petz-1996} $g^{f}$ on $\mathcal{D}_d^{\circ}$ is given in an orthonormal eigenbasis $\rho = \sum_i \lambda_i |i\rangle\langle i|$ by
\begin{equation}
\label{eq:petz}
g^{f}_{\rho}(X, X) = \sum_{i,j} \frac{|X_{ij}|^2}{\lambda_i f(\lambda_j / \lambda_i)},
\end{equation}
where $X_{ij} = \langle i | X | j \rangle$. The condition $f(1) = 1$ fixes the scale: it is equivalent to the metric restricting to the classical Fisher value on diagonal tangent vectors. Without that condition the formula is homogeneous of degree $-1$ in $f$ and classifies metrics only up to a positive constant.
\end{definition}

\begin{definition}[Fidelity metric]
\label{def:fidelity}
The Uhlmann fidelity \cite{uhlmann} of two states is
\begin{equation}
F(\rho, \sigma) = \bigl(\operatorname{Tr}\sqrt{\sqrt{\rho}\, \sigma \sqrt{\rho}}\bigr)^2.
\end{equation}
The fidelity distance $d_B$ is defined by $d_B(\rho, \sigma)^2 = 2\bigl(1 - \sqrt{F(\rho, \sigma)}\bigr)$. Where the induced Riemannian metric exists we call it the fidelity metric $g^{\mathrm{fid}}$. In this normalization $g^{\mathrm{fid}}$ equals one quarter of the symmetric logarithmic derivative metric in every dimension. The identity follows by expanding $d_B^2(\rho, \rho + d\rho) = 2(1 - \operatorname{Tr}\sqrt{\sqrt{\rho}(\rho + d\rho)\sqrt{\rho}})$ to second order and solving the Lyapunov equation $(\rho + d\rho) L + L (\rho + d\rho) = 2 \, d\rho$ for the symmetric logarithmic derivative of $d\rho$: the expansion yields $\tfrac{1}{4} \operatorname{Tr}(\rho L^2)$ at any full-rank state \cite{hubner, braunstein-caves}. \Cref{prop:qubit-fid} verifies the identity by direct computation on qubit states, and the code of \cref{sec:computation} checks it numerically in dimensions two to four. The fidelity metric is therefore not a member of the normalized Petz family but a positive multiple of one.
\end{definition}

\begin{definition}[Ruppeiner metric]
\label{def:ruppeiner}
Let $S(U, V, N)$ be the entropy of a thermodynamic system with internal energy $U$, volume $V$, and particle number $N$. Physical entropy is homogeneous of degree one in its extensive variables, so the full Hessian in $(U, V, N)$ is singular along the extensive direction by the Gibbs-Duhem relation, and strict concavity in all extensive variables cannot hold. The Ruppeiner metric is defined on a two-dimensional slice: fix $N$ (as this paper does) or pass to specific variables, and set
\begin{equation}
g^{\mathrm{rup}}_{ij} = -\frac{\partial^2 S}{\partial X^i \partial X^j}
\end{equation}
in the remaining extensive coordinates $X^i$. Its scalar curvature $R$ is computed with the standard Ricci convention, in which the round two-sphere has $R = +2$; the convention of Ruppeiner \cite{ruppeiner} carries the opposite sign. The construction is that of Ruppeiner \cite{ruppeiner}; the metric of Weinhold \cite{weinhold} is the Hessian of internal energy and differs by a conformal factor in the standard thermodynamic setting.
\end{definition}

\begin{definition}[Entanglement wedge]
\label{def:wedge}
Fix a boundary spatial region $A$ of a conformal field theory state dual to a bulk asymptotically anti-de Sitter spacetime, and a Cauchy slice $\Sigma$. The surface $A \cup \gamma_A$ bounds a spatial homology region $\Sigma_A \subset \Sigma$, where $\gamma_A$ is the extremal surface homologous to $A$ (minimal in static slices) \cite{hrt}. The entanglement wedge $W(A)$ is the domain of dependence of $\Sigma_A$. Entanglement-wedge reconstruction is the statement that bulk operators localized in $W(A)$ can be represented by operators of the boundary subregion $A$.
\end{definition}

\begin{definition}[Geometric correspondence]
\label{def:correspondence}
A geometric correspondence assigns to data $D$ of a physical or statistical system a Riemannian geometry $G(D)$, and optionally a relation between the curvature of $G(D)$ and physical quantities of the system. The correspondence is a proposed dictionary until both assignments are theorems; each assignment must state its domain, its codomain, and the structure it preserves.
\end{definition}

\begin{remark}[Object schema]
\label{rem:schema}
A physical system is often recorded as a tuple $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ of state space, observables, dynamics, symmetry data, and composition rules. The statistical models and state spaces of this paper instantiate $X$ and, in the quantum setting, $\mathcal{O}$; the constructions of \cref{sec:reconstruction} concern recovery of $(X, \mathcal{O})$ from probe data. The tuple is a convenient schema, not a theorem, and no result below depends on its completeness.
\end{remark}

The information-geometric assignment $D \mapsto G(D)$ is a theorem in the settings of \crefrange{sec:classical}{sec:invariants}: statistical data carries a canonical or a chosen metric. The reverse assignment, curvature to physics, is a proposal in every setting examined here, and \cref{sec:correspondence} studies the pair.

\section{Classical information geometry}
\label{sec:classical}

The Fisher metric of \cref{def:fisher} is the unique metric that is monotone in the sense of \cref{def:stochastic}. Monotonicity is elementary to prove; uniqueness is Chentsov's theorem and is recorded with its scope.

\begin{lemma}[Fisher metric and relative entropy]
\label{lem:kl}
Let $p$ be an interior point of the simplex and let $u$ be a tangent vector at $p$ with $\sum_i u_i = 0$. For the Kullback-Leibler divergence $D(p + u \,\|\, p) = \sum_i (p_i + u_i) \log \frac{p_i + u_i}{p_i}$ one has
\begin{equation}
D(p + u \,\|\, p) = \frac{1}{2} g_p(u, u) + O(\|u\|^3).
\end{equation}
The Fisher metric is the second-order term of the relative entropy at the diagonal.
\end{lemma}

\begin{proof}
Expand $\log(1 + u_i/p_i) = u_i/p_i - u_i^2 / (2 p_i^2) + O(\|u\|^3)$ in
$D = \sum_i (p_i + u_i) \log(1 + u_i/p_i)$. The first-order terms cancel because $\sum_i u_i = 0$, and the second-order terms give $\sum_i (u_i^2/p_i - u_i^2 / (2 p_i)) = \frac{1}{2} \sum_i u_i^2 / p_i = \frac{1}{2} g_p(u, u)$.
\end{proof}

\Cref{lem:kl} explains the role of the Fisher metric as a ruler of distinguishability: it is the quadratic term of the divergence that measures how far a perturbed distribution is from the reference. The same quadratic form appears in the statistical estimation problem as the inverse asymptotic variance of efficient estimators. The quantum analogue of the lemma produces one specific member of the Petz family, not the whole family: expanding the Umegaki quantum relative entropy $D(\rho + X \,\|\, \rho)$ to second order gives the metric of the member $f_{\mathrm{bkm}}(t) = (t-1)/\log t$ (with $f_{\mathrm{bkm}}(1) = 1$ by continuity), the Bogoliubov-Kubo-Mori metric, while the quantum Cram\'er-Rao bound of quantum estimation singles out the symmetric logarithmic derivative member $f(t) = (1+t)/2$ \cite{braunstein-caves, petz-1996}.

\begin{proposition}[Monotonicity of the Fisher metric]
\label{prop:monotone}
The Fisher metric is monotone under stochastic maps.
\end{proposition}

\begin{proof}
Let $\varphi$ be stochastic and let $u$ be tangent at $p$, so $\sum_i u_i = 0$. The derivative of $p \mapsto \varphi p$ is $u \mapsto \varphi u$, and $\sum_j (\varphi u)_j = \sum_i u_i \sum_j \varphi_{ji} = 0$, so $D\varphi \cdot u = \varphi u$ is tangent at $\varphi p$. Write $q = \varphi p$, so $q_j = \sum_i \varphi_{ji} p_i$. Fix $j$ with $q_j > 0$ (if $q_j = 0$ then $\varphi_{ji} = 0$ for all $i$ and the term below is zero on both sides). By the Cauchy-Schwarz inequality applied with weights $\varphi_{ji}$,
\begin{equation}
(\varphi u)_j^2 = \Bigl(\sum_i \varphi_{ji} \frac{u_i}{\sqrt{p_i}} \sqrt{p_i}\Bigr)^2
\leq \Bigl(\sum_i \varphi_{ji} \frac{u_i^2}{p_i}\Bigr) \Bigl(\sum_i \varphi_{ji} p_i\Bigr).
\end{equation}
Dividing by $q_j = \sum_i \varphi_{ji} p_i$ and summing over $j$ with $q_j > 0$ gives
\begin{equation}
\sum_j \frac{(\varphi u)_j^2}{q_j}
\leq \sum_j \sum_i \varphi_{ji} \frac{u_i^2}{p_i}
= \sum_i \frac{u_i^2}{p_i} \sum_j \varphi_{ji}
= \sum_i \frac{u_i^2}{p_i},
\end{equation}
which is $g_{\varphi p}(\varphi u, \varphi u) \leq g_p(u, u)$.
\end{proof}

\begin{remark}[Worked monotonicity]
\label{rem:worked-monotone}
Take three outcomes, $p = (0.5, 0.3, 0.2)$, and the stochastic map $\varphi = \left(\begin{smallmatrix} 0.7 & 0.1 & 0.2 \\ 0.3 & 0.9 & 0.8 \end{smallmatrix}\right)$, which sends three outcomes to two and has unit column sums. Then $q = \varphi p = (0.42, 0.58)$, and for the tangent vector $u = (0.1, -0.05, -0.05)$ one computes
\begin{equation}
g_p(u, u) = \frac{0.01}{0.5} + \frac{0.0025}{0.3} + \frac{0.0025}{0.2} = \frac{49}{1200} \approx 0.040833,
\end{equation}
while $\varphi u = (0.055, -0.055)$ and $g_q(\varphi u, \varphi u) = 0.055^2 (1/0.42 + 1/0.58) = 121/9744 \approx 0.012418$. The map costs distinguishability, and the deficit is the slack in the Cauchy-Schwarz step of \cref{prop:monotone}. The computational check in \cref{sec:computation} repeats this comparison for two thousand random trials.
\end{remark}

\begin{theorem}[Chentsov]
\label{thm:chentsov}
On the probability simplices, the Fisher family is the unique family of Riemannian metrics, up to a single positive constant shared across dimensions, that is monotone under stochastic maps.
\end{theorem}

Chentsov proved this theorem in the formulation: smooth metric families invariant under congruent embeddings (Markov morphisms) are unique up to constant; Petz and Sud\'ar \cite{petz-sudar} state the equivalent contraction form used here, monotone under general stochastic maps. The two formulations are connected as follows: a congruent embedding and its stochastic inverse force invariance under invertible stochastic maps (permutations included), and the contraction inequality for general stochastic maps is the monotonicity of \cref{def:stochastic}. Smoothness of the metric tensor is assumed throughout, as in Chentsov's statement. Two scope points are essential. The constant is undetermined and shared: monotonicity pins the metric only up to scale, and the cross-dimensional maps of \cref{def:stochastic} are what force one constant across all $n$. The classical uniqueness has an operational reading. Monotonicity says statistical distinguishability does not increase under processing; uniqueness says there is one ruler for that distinguishability. A classification program for statistical systems can therefore treat the Fisher metric as classifying data without a choice problem. \Cref{sec:quantum} shows that this comfort does not survive quantization.

\begin{remark}[Fisher geometry of the simplex]
\label{rem:bernoulli}
The Fisher metric on the interior of $\Delta_{n-1}$ is, up to scale, the round-sphere metric. Substitute $p_i = y_i^2$ with $y_i > 0$; the constraint $\sum_i p_i = 1$ becomes $\sum_i y_i^2 = 1$, and $\sum_i (dp_i)^2 / p_i = 4 \sum_i (dy_i)^2$, so the metric is four times the round metric of the unit sphere restricted to the positive orthant of $S^{n-1}$. For $n \geq 3$ the sectional curvature is $1/4$ in this normalization, and the geodesic distance between $p$ and $p'$ is $2 \arccos \sum_i \sqrt{p_i p'_i}$. For the Bernoulli model ($n = 2$) the state space is an arc of a circle of radius 2, and in the coordinate $q = \log(p_1/p_2)$ the line element is $(dq)^2 / (4 \cosh^2(q/2))$.
\end{remark}

\section{Quantum monotone metrics}
\label{sec:quantum}

Petz and Sud\'ar \cite{petz-sudar} classified the monotone metrics of \cref{def:quantum-monotone} on finite-dimensional state spaces. The answer is parametric, not unique.

\begin{theorem}[Petz-Sud\'ar]
\label{thm:petz-sudar}
Monotone metric families $\{g^{(d)}\}_{d \geq 2}$ in the sense of \cref{def:quantum-monotone} correspond exactly to functions $f : (0, \infty) \to (0, \infty)$ that are operator monotone of all matrix orders and satisfy $f(t) = t f(1/t)$, by the formula \eqref{eq:petz} in each dimension \cite{petz-1996, petz-sudar-jmp}. The correspondence is a bijection after the normalization $f(1) = 1$, which is equivalent to restricting to the Fisher value on diagonal tangent vectors; without the normalization, metrics correspond to $f$ only up to a positive constant. In particular the symmetric logarithmic derivative metric of \cref{def:sld} corresponds to $f(t) = (1+t)/2$, and there are infinitely many monotone metrics.
\end{theorem}

The correspondence in this normalization is the one computed below: for $f(t) = (1+t)/2$ the formula \eqref{eq:petz} gives $g_{\rho}^{f}(X,X) = \sum_{i,j} 2 |X_{ij}|^2 / (\lambda_i + \lambda_j)$, which is exactly $\operatorname{Tr}(X L)$ with $X = (\rho L + L\rho)/2$, since in the eigenbasis the defining equation reads $X_{ij} = L_{ij} (\lambda_i + \lambda_j)/2$. The word ``correspond'' in the theorem is exact in both directions: every operator monotone $f$ with $f(t) = t f(1/t)$ produces a monotone metric, and every monotone metric arises this way. The classification is complete as a parameterization, and the parameter is a function rather than a finite list.

\begin{proposition}[Non-uniqueness on qubit states]
\label{prop:nonunique}
Let $\rho = \operatorname{diag}(3/4, 1/4)$ and let $X = \sigma_x / 2$, $Y = \sigma_z / 2$ be the transverse and radial tangent vectors at $\rho$ in Bloch coordinates. For the symmetric logarithmic derivative metric,
\begin{equation}
g^{\mathrm{sld}}_{\rho}(X, X) = 1, \qquad g^{\mathrm{sld}}_{\rho}(Y, Y) = \frac{4}{3}.
\end{equation}
For the Wigner-Yanase metric, given by \eqref{eq:petz} with $f_{\mathrm{wy}}(t) = \tfrac{1}{4}(1 + \sqrt{t})^2$,
\begin{equation}
g^{\mathrm{wy}}_{\rho}(X, X) = 4(2 - \sqrt{3}), \qquad g^{\mathrm{wy}}_{\rho}(Y, Y) = \frac{4}{3}.
\end{equation}
The radial-to-transverse ratio is $4/3$ for the symmetric logarithmic derivative metric and $(2 + \sqrt{3})/3 \neq 4/3$ for the Wigner-Yanase metric, so the two metrics are not proportional. Quantum monotone metrics are not unique, even up to a constant.
\end{proposition}

\begin{proof}
For $X = \sigma_x / 2$ the matrix entries are $X_{12} = X_{21} = 1/2$ and $X_{11} = X_{22} = 0$. The symmetric logarithmic derivative equation $X = (\rho L + L \rho)/2$ for off-diagonal entries reads $X_{ij} = L_{ij}(\lambda_i + \lambda_j)/2$, so $L_{12} = L_{21} = 1/2 \cdot 2 / 1 = 1$ and $L = \sigma_x$. Then $g^{\mathrm{sld}}(X, X) = \operatorname{Tr}(X L) = \operatorname{Tr}(\sigma_x^2 / 2) = 1$. For $Y = \sigma_z / 2$ the derivative is diagonal and $L = \operatorname{diag}\bigl((1/2)/(3/4), (-1/2)/(1/4)\bigr) = \operatorname{diag}(2/3, -2)$, so $g^{\mathrm{sld}}(Y, Y) = \operatorname{Tr}(Y L) = (1/2)(2/3) + (-1/2)(-2) = 4/3$.

For the Wigner-Yanase metric the coefficient of $|X_{ij}|^2$ in \eqref{eq:petz} is $1/(\lambda_i f_{\mathrm{wy}}(\lambda_j/\lambda_i)) = 4/(\sqrt{\lambda_i} + \sqrt{\lambda_j})^2$. With $\lambda_1 = 3/4$, $\lambda_2 = 1/4$ the transverse value is $2 \cdot (1/4) \cdot 4 / (\sqrt{3}/2 + 1/2)^2 = 4 / (2 + \sqrt{3}) = 4(2 - \sqrt{3})$, where $(\sqrt{3}+1)^2 = 4 + 2\sqrt{3}$ and $4 - 3 = 1$ were used. For diagonal $Y$ the two diagonal terms give $4(1/2)^2 / (2\sqrt{3}/2)^2 + 4(-1/2)^2 / (2 \cdot 1/2)^2 = 1/3 + 1 = 4/3$. The ratio $(4/3)/(4(2-\sqrt{3})) = (2+\sqrt{3})/3$ is not $4/3$, since $2 + \sqrt{3} \neq 4$.
\end{proof}

The failure of uniqueness is structural, not an artifact of the qubit. The Petz family is infinite in every dimension $d \geq 2$, and the ambiguity appears already in the two-level system. Any physical statement of the form ``the geometry of the quantum state space is $G$'' must therefore name $f$, or must derive $f$ from independent principles. This constraint carries into every proposed gravity-information dictionary in \cref{sec:correspondence}.

\begin{remark}[The parameter as data]
\label{rem:parameter}
The classifying datum of a monotone metric is the function $f$, subject to $f(t) = t f(1/t)$; the condition is the symmetry of the Petz formula under $i \leftrightarrow j$, and the normalization $f(1) = 1$ fixes the scale that Chentsov's theorem leaves free. Three members of the family recur in this paper: $f(t) = (1+t)/2$ (symmetric logarithmic derivative), $f_{\mathrm{wy}}(t) = \tfrac{1}{4}(1+\sqrt{t})^2$ (Wigner-Yanase), and $f_{\mathrm{bkm}}(t) = (t-1)/\log t$ (Bogoliubov-Kubo-Mori). Distinct $f$ give distinct metrics, so the parameter is invariant content of a quantum state system, in the same sense that the dimension vector is invariant content of a finite-dimensional $C^*$-algebra. Partial selection principles exist: the expansion of \cref{lem:kl} selects $f_{\mathrm{bkm}}$, and quantum estimation selects $f(t) = (1+t)/2$ \cite{braunstein-caves}. In holography the second-order relative entropy of boundary perturbations equals the bulk canonical energy \cite{lashkari-vr}, which by \cref{lem:kl} selects the Bogoliubov-Kubo-Mori member for that quantity; distinct holographic questions can invoke distinct members. No principle selects a member for a general gravity-information dictionary.
\end{remark}

Uniqueness has one sharp surviving locus.

\begin{proposition}[Commutative locus]
\label{prop:commutative}
For every normalized operator monotone $f$ and every full-rank diagonal $\rho = \sum_i \lambda_i |i\rangle\langle i|$, the restriction of $g^{f}$ to diagonal tangent vectors is the Fisher value:
\begin{equation}
g^{f}_{\rho}(X, X) = \sum_i \frac{X_{ii}^2}{\lambda_i}.
\end{equation}
More generally the restriction of any monotone metric to commuting states is a classical monotone metric, hence $c \cdot g^{\mathrm{fisher}}$ for some $c > 0$ by Chentsov's theorem (\cref{thm:chentsov}); in the Petz family $c = 1/f(1)$, so the normalization $f(1) = 1$ forces $c = 1$. Every normalized monotone metric restricts to the Fisher metric on the commutative locus.
\end{proposition}

\begin{proof}
For diagonal $X$ only the terms $i = j$ survive in \eqref{eq:petz}, and $f(1) = 1$ gives $g^f(X,X) = \sum_i X_{ii}^2 / (\lambda_i f(1)) = \sum_i X_{ii}^2 / \lambda_i$, for every dimension $d$. For the general statement, let $\varphi$ be a stochastic map of diagonal distributions. The pinching channel $\Phi(A) = \sum_{i,j} \varphi_{ji} \langle i | A | i \rangle |j\rangle\langle j|$, with Kraus operators $K_{ji} = \sqrt{\varphi_{ji}} |j\rangle\langle i|$, is completely positive and trace-preserving, maps diagonal states to diagonal states, and restricts to $p \mapsto \varphi p$. Monotonicity of the quantum metric under $\Phi$ restricts to monotonicity of the induced classical metric, so Chentsov's theorem applies and the restriction is $c \cdot g^{\mathrm{fisher}}$. The direct computation above fixes $c = 1/f(1)$ for the Petz family.
\end{proof}

\begin{remark}[Commutative values]
\label{rem:commutative}
For $\rho = \operatorname{diag}(3/4, 1/4)$ and $Y = \sigma_z/2$ the value $g(Y, Y) = 4/3$ of \cref{prop:nonunique} is the Fisher value $\sum_i X_{ii}^2 / \lambda_i = (1/2)^2/(3/4) + (-1/2)^2/(1/4) = 4/3$, for both normalized metrics. The two computations agree on the diagonal, as \cref{prop:commutative} requires, and disagree off it.
\end{remark}

\begin{remark}[Qutrit values]
\label{rem:qutrit}
At the qutrit state $\rho = \operatorname{diag}(0.5, 0.3, 0.2)$ with the off-diagonal tangent $X_{13} = X_{31} = 1/2$, the Petz formula gives $g^{\mathrm{sld}}(X, X) = 10/7 \approx 1.4286$ and $g^{\mathrm{wy}}(X, X) \approx 1.5010$, while the fidelity metric gives $\approx 0.3571$ by the identity of \cref{def:fidelity}. On the diagonal tangent $Y = \operatorname{diag}(0.2, -0.1, -0.1)$ both normalized metrics give the Fisher value $0.04/0.5 + 0.01/0.3 + 0.01/0.2 = 49/300 \approx 0.163333$, while the fidelity metric gives $\approx 0.040833$. The pattern of \cref{prop:nonunique,prop:commutative} holds one dimension up, and the computations of \cref{sec:computation} verify both statements numerically.
\end{remark}

\section{Geometry of the qubit state space}
\label{sec:qubit}

The qubit state space is the smallest quantum system and the smallest place where the Petz family is nontrivial. Its geometry is computable in closed form, and it exhibits the two themes of the paper: a quantum state space carries a canonical constant-curvature geometry once $f$ is chosen, and the choice of $f$ matters off the commutative locus. The computations of this section are expository; the geometry of state spaces and the fidelity constructions are documented in the information-geometric literature \cite{hubner, braunstein-caves, petz-1996}, and the proofs are given in full because the paper uses the statements as premises.

Write $\rho = (I + \vec{r} \cdot \vec{\sigma})/2$ with $|\vec{r}| < 1$, so $\mathcal{D}_2^{\circ}$ is the open unit ball of $\mathbb{R}^3$ and the eigenvalues are $\lambda_{\pm} = (1 \pm |\vec{r}|)/2$.

\begin{proposition}[Symmetric logarithmic derivative geometry of the qubit]
\label{prop:qubit-sld}
In Bloch coordinates the symmetric logarithmic derivative metric is
\begin{equation}
\label{eq:qubit-sld}
g^{\mathrm{sld}} = |d\vec{r}|^2 + \frac{(\vec{r} \cdot d\vec{r})^2}{1 - |\vec{r}|^2}.
\end{equation}
In spherical coordinates $|\vec{r}| = r = \sin\chi$ this becomes $g^{\mathrm{sld}} = (d\chi)^2 + \sin^2\!\chi \, (d\Omega)^2$ with $\chi \in (0, \pi/2)$: the open state space $\mathcal{D}_2^{\circ}$ is isometric to an open hemisphere of the round three-sphere of radius one, of constant sectional curvature one.
\end{proposition}

\begin{proof}
By rotational invariance of $g^{\mathrm{sld}}$ it suffices to evaluate radial and transverse directions at $\vec{r} = (0, 0, r)$. A tangent vector $X = (d\vec{r} \cdot \vec{\sigma})/2$ has entries $X_{11} = dr_3/2$, $X_{22} = -dr_3/2$, $X_{12} = (dr_1 - i\, dr_2)/2$, $X_{21} = (dr_1 + i\, dr_2)/2$ in the orthonormal eigenbasis of $\rho$. From \cref{thm:petz-sudar} the diagonal entries of $g^{\mathrm{sld}}$ contribute $X_{11}^2 / \lambda_+ + X_{22}^2 / \lambda_-$ and the off-diagonal entries contribute $2 \cdot 2 |X_{12}|^2 / (\lambda_+ + \lambda_-)$. With $\lambda_{\pm} = (1 \pm r)/2$ one gets $1/\lambda_+ + 1/\lambda_- = 4/(1 - r^2)$ and $\lambda_+ + \lambda_- = 1$, so
\begin{equation}
g^{\mathrm{sld}} = (dr_1^2 + dr_2^2) + \frac{dr_3^2}{1 - r^2} = |d\vec{r}|^2 + \frac{(\vec{r} \cdot d\vec{r})^2}{1 - |\vec{r}|^2}.
\end{equation}
Setting $r = \sin\chi$ turns $(dr)^2/(1 - r^2) + r^2 (d\Omega)^2$ into $(d\chi)^2 + \sin^2\!\chi \, (d\Omega)^2$, the round metric of radius one, on the chart $\chi \in (0, \pi/2)$; the spherical chart is singular at the center, which is covered by the smooth embedding $\vec{r} \mapsto (\vec{r}, \sqrt{1 - |\vec{r}|^2}) \in S^3 \subset \mathbb{R}^4$. The distance from the center to the pure-state boundary is $\pi/2$.
\end{proof}

The fidelity metric of \cref{def:fidelity} is one quarter of this metric on the qubit.

\begin{proposition}[Fidelity metric of the qubit]
\label{prop:qubit-fid}
On $\mathcal{D}_2^{\circ}$ the fidelity metric satisfies $g^{\mathrm{fid}} = \tfrac{1}{4} g^{\mathrm{sld}}$. Consequently the open state space with the fidelity metric is an open hemisphere of the round three-sphere of radius one half, of constant sectional curvature four.
\end{proposition}

\begin{proof}
Both metrics are invariant under the rotations of the Bloch ball induced by unitary conjugation, so at each $\vec{r}$ the rotation group fixing $\vec{r}$ forces the cross term between radial and transverse directions to vanish and fixes transverse isotropy, and the quadratic form is determined by its radial and transverse values. For the transverse direction, set $\sigma = \rho + \varepsilon X$ with $X = \sigma_x/2$ and $\rho = \operatorname{diag}(\lambda_+, \lambda_-)$. Then $\sqrt{\rho}\, \sigma \sqrt{\rho} = \left(\begin{smallmatrix} \lambda_+^2 & \tfrac{\varepsilon}{2}\sqrt{\lambda_+ \lambda_-} \\ \tfrac{\varepsilon}{2}\sqrt{\lambda_+ \lambda_-} & \lambda_-^2 \end{smallmatrix}\right)$, whose determinant is $\lambda_+ \lambda_- (\lambda_+ \lambda_- - \varepsilon^2/4)$. Since $(\operatorname{Tr}\sqrt{M})^2 = \operatorname{Tr} M + 2\sqrt{\det M}$, one gets $\operatorname{Tr}\sqrt{\sqrt{\rho}\,\sigma\sqrt{\rho}} = 1 - \varepsilon^2/8 + O(\|\varepsilon X\|^3)$ and $d_B^2 = 2(1 - \sqrt{F}) = \varepsilon^2/4 + O(\|\varepsilon X\|^3)$, matching $\tfrac{1}{4} g^{\mathrm{sld}}(X, X) = 1/4$ from \cref{prop:qubit-sld} at every $r$. For the radial direction the states commute and the fidelity reduces to the classical affinity $\sum_i \sqrt{p_i q_i}$ on the Bernoulli pair $p = ((1+r)/2, (1-r)/2)$; the expansion $\sum_i \sqrt{p_i (p_i + \delta_i)} = 1 - \sum_i \delta_i^2 / (8 p_i) + O(\|\delta\|^3)$ for $\sum_i \delta_i = 0$ gives $d_B^2 = \sum_i \delta_i^2 / (4 p_i)$, one quarter of the classical Fisher value, and the classical Fisher value is $g^{\mathrm{sld}}$ on the diagonal by \cref{prop:commutative}. The curvature claim follows from \cref{prop:qubit-sld} and the constant factor $1/4$, which multiplies sectional curvatures by $4$.
\end{proof}

\begin{remark}[Normalization conventions]
\label{rem:conventions}
The factor between the fidelity metric and the symmetric logarithmic derivative metric depends on the normalization of the fidelity, and conventions differ across sources. In the convention of \cref{def:fidelity}, where $d_B^2 = 2(1-\sqrt{F})$, the fidelity metric of the qubit is one quarter of the symmetric logarithmic derivative metric, and the corresponding sphere has radius $1/2$ rather than $1$. The intrinsic statements of \cref{prop:qubit-sld,prop:qubit-fid} are convention-free up to this constant: both geometries are round three-spheres up to the open-hemisphere restriction, and the constant relates their radii. Any comparison of curvature values across sources must first fix the normalization.
\end{remark}

\begin{remark}[Constant curvature without spacetime]
\label{rem:sphere}
\Cref{prop:qubit-sld,prop:qubit-fid} are statements about information geometry. The round three-sphere appearing here is the geometry of statistical distinguishability on a two-level quantum system; it is not a spacetime and no claim about spacetime dimension or signature follows. The example exists to separate the two readings of ``geometric correspondence'': state spaces carry Riemannian geometry by construction, and whether that geometry is physical is a further question.
\end{remark}

\begin{remark}[Geodesic distance on the qubit]
\label{rem:distance}
In the coordinates of \cref{prop:qubit-sld} the geodesic distance from the maximally mixed state $\vec{r} = 0$ to the state $\vec{r} = r \vec{n}$ is $\chi = \arcsin r$, since $g^{\mathrm{sld}} = (d\chi)^2 + \sin^2\!\chi \, (d\Omega)^2$ and radial geodesics of the round sphere have length equal to the angle. Pure states sit at distance $\pi/2$ from the center, and the diameter of the interior is $\pi$: the space of qubit states is a hemisphere of finite diameter carried by statistical distinguishability, not by any spacetime interpretation. The computational check in \cref{sec:computation} compares this distance profile against the closed form.
\end{remark}

\section{Information geometry as invariant data}
\label{sec:invariants}

The classification program identifies objects by invariants, in the spirit of the companion data that practitioners use to tell objects apart in a completed classification. For statistical systems the candidate invariants are the sample-space size, the isometry class of the Fisher geometry, and the curvature data of statistical submodels.

\begin{corollary}[Fisher geometry of the full simplex]
\label{cor:homogeneity}
The Fisher metric on the interior of $\Delta_{n-1}$ is locally isometric to the round sphere of radius two, with sectional curvature $1/4$ for $n \geq 3$, and the arc of \cref{rem:bernoulli} for $n = 2$. The isometry group of the full model is the finite group of coordinate permutations. Two statistical models defined on the full simplex with the same number of outcomes are isometric as Riemannian manifolds, and a permutation of outcomes is an isometry.
\end{corollary}

\begin{proof}
The substitution $p_i = y_i^2$ of \cref{rem:bernoulli} is an isometry onto the positive orthant of the round sphere of radius two. A global isometry of the connected constant-curvature orthant extends uniquely to an ambient isometry of its metric completion $S^{n-1}(2)$, and such an isometry permutes the $n$ extreme rays of the orthant; the orthogonal maps permuting those rays are exactly the permutation matrices. Permutations preserve $\sum_i p_i = 1$ and the metric $\sum_i (dp_i)^2 / p_i$ directly, so the isometry group is the permutation group.
\end{proof}

\Cref{cor:homogeneity} is a classification statement of the trivial kind: the full models of a fixed sample size form one isometry class, and the only invariant is $n$. The classification content of information geometry therefore lives in statistical submodels.

\begin{definition}[Statistical submodel]
\label{def:submodel}
A statistical submodel is a smooth embedding $i : M' \to \Delta_{n-1}^{\circ}$ of a lower-dimensional manifold $M'$ into the simplex, with the pullback metric $g' = i^{*} g^{\mathrm{fisher}}$. The intrinsic and extrinsic curvature invariants of $(M', g')$ are invariants of the model. Exponential families are the canonical submodels.
\end{definition}

\begin{remark}[Embedded two-outcome model]
\label{rem:embedded}
Inside the three-outcome simplex consider $p(\theta) = (\theta, (1-\theta)/2, (1-\theta)/2)$ for $\theta \in (0, 1)$. The tangent vector is $p'(\theta) = (1, -1/2, -1/2)$, and the induced metric is
\begin{equation}
g' = \Bigl( \frac{1}{\theta} + \frac{1/4}{(1-\theta)/2} + \frac{1/4}{(1-\theta)/2} \Bigr) d\theta^2
= \frac{(d\theta)^2}{\theta(1-\theta)},
\end{equation}
exactly the Fisher metric of the standalone two-outcome model of \cref{rem:bernoulli}. The embedding is isometric onto its image, so intrinsic geometry cannot detect the sample-space size: two models with different numbers of outcomes can share a submodel geometry. The induced metric is unchanged here because the embedding is a sufficient-statistic Markov map. Among linear stochastic maps, pullback preserves the Fisher metric exactly when the map is a sufficient-statistic embedding, and general smooth embeddings can reproduce the same intrinsic metric without being Markov maps, so intrinsic geometry alone does not detect the embedding. Extrinsic data of the embedding is additional invariant content.
\end{remark}

\begin{remark}[Classifying data for statistical models]
\label{rem:family-v}
For statistical models (probability and measure structures), the Fisher metric is the natural classifying invariant in the classical case. \Cref{cor:homogeneity} and \cref{def:submodel} make that naming precise: the invariant is the metric up to isometry, trivial on full models and rich on submodels. This is the opposite of the symplectic situation, where local classification is trivial by Darboux's theorem and all content is global. Information geometry has local content and uses it. On the quantum side the invariant data must additionally name the member $f$ of the Petz family (\cref{prop:nonunique}), so the classifying data of a quantum state system is the pair (state space, $f$) and never the state space alone.
\end{remark}

\begin{remark}[Classification status of statistical models]
\label{rem:status}
The evidence of this paper supports the following summary. Classical statistical models of fixed sample size are classified by \cref{cor:homogeneity} up to isometry of their full Fisher geometry, and statistical submodels carry curvature invariants without a complete classification being on record. Quantum state systems are classified as metric spaces only after the parameter $f$ is fixed, and no physical principle in this paper fixes it. Statistical models are therefore a worked example of a general pattern in classification: a complete island (Chentsov, Petz-Sud\'ar), a trivial stratum (full simplices), and open content (submodels, quantum parameter selection).
\end{remark}

\section{Reconstruction from probes}
\label{sec:reconstruction}

The second proved pattern available to a gravity-information program is reconstruction: an object recovered from data about its relationships. Three classical results fix the pattern, and one quantum-information result applies it to entanglement.

\begin{theorem}[Gelfand-Naimark and Gelfand duality]
\label{thm:gelfand}
Every commutative unital $C^*$-algebra is isometrically $*$-isomorphic to $C(X)$ for a compact Hausdorff space $X$, its Gelfand spectrum; contravariantly, the categories of commutative unital $C^*$-algebras and of compact Hausdorff spaces are dual \cite{gn}. In particular the space $X$ is recovered from the algebra of observables $\mathcal{O} = C(X)$ alone.
\end{theorem}

\begin{theorem}[Stone duality]
\label{thm:stone}
Boolean algebras are dual to compact totally disconnected Hausdorff spaces \cite{stone}; the space is recovered from the algebra of clopen sets.
\end{theorem}

These theorems are classification-grade only in the commutative setting: there $X$ is determined by $\mathcal{O}$ up to homeomorphism. The noncommutative Gelfand-Naimark theorem embeds an arbitrary $C^*$-algebra into the operators of some Hilbert space, which is a representation theorem, not a classification. Reconstruction of a state space from probe data is weaker than classification of all state spaces, and this distinction is the one the classification program must preserve.

\begin{definition}[Probe data and reconstruction]
\label{def:probe}
Probe data of an object $P$ is a family of measurements or relationships $\{\phi_i(P)\}$ indexed by probes $\phi_i$; a reconstruction theorem assigns to the probe data an object $\hat{P}$ together with an isomorphism $\hat{P} \cong P$ in a stated category. The theorem is classification-grade only when the probes are a complete invariant, that is, when $\hat{P} \cong \hat{Q}$ implies $P \cong Q$ in the stated category for all objects in scope.
\end{definition}

\begin{remark}[Reconstruction pattern]
\label{rem:pattern}
\Cref{thm:gelfand,thm:stone,thm:dhw} are instances of \cref{def:probe}: Gelfand spectrum from characters, Stone space from clopen sets, bulk operators from boundary subregion algebras. In each case the probes are exact within scope, and in each case the theorem recovers structure rather than producing it. No instance recovers dynamics, and none is a classification theorem for the ambient category.
\end{remark}

\begin{theorem}[Entanglement-wedge reconstruction, Dong-Harlow-Wall]
\label{thm:dhw}
Let a boundary region $A$ and a code subspace of states be given in the holographic setting, with bulk geometry dual to a state in that subspace. Every bulk operator localized in the entanglement wedge $W(A)$ can be reconstructed as an operator of the boundary subregion $A$ acting on the code subspace; the reconstruction preserves expectation values on that subspace \cite{dhw}. The result is a theorem of quantum information theory (quantum error correction and relative entropy), proved under the stated hypotheses of the holographic code setup.
\end{theorem}

The theorem assumes its hypotheses strictly: a code subspace and an entanglement-wedge structure are given, and no bulk geometry, field equation, or code subspace is derived from boundary data. It proves exact operator recovery inside a specified wedge, which is a reconstruction theorem in the sense of \cref{def:probe} (structure recovered from probe data, here boundary subregion algebras). The mechanism is quantum error correction: the same bulk operator is represented on several boundary subregions and the representations agree on the code subspace, the algebraic content of complementary recovery. The recovery is exact within the assumed setting.

\begin{remark}[Yoneda qualification]
\label{rem:yoneda}
Relational determination of objects is the categorical form of the reconstruction pattern: the functor of points $\operatorname{Hom}(-, P)$ determines $P$ up to isomorphism in a locally small category. A standing qualification governs all such arguments here: ``Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.'' Nothing in \cref{thm:gelfand,thm:stone,thm:dhw} lifts object recovery to physical equivalence or to a classification of physical systems.
\end{remark}

A parallel line of work establishes representability of categorical supermaps whenever a theory has suitable channel-state duality \cite{hefford-wilson, whh}. Whether that line unifies with the Gelfand-Stone-Naimark pattern into one principle is open, and nothing here depends on such a unification.

\section{Entanglement and emergent geometry}
\label{sec:entanglement}

The proposals connecting entanglement to geometry come in three strengths, and keeping them apart is the substance of this section.

\begin{remark}[Ryu-Takayanagi proposal]
\label{rem:rt}
For a boundary region $A$ in a state dual to a bulk, the entanglement entropy $S(A)$ is proposed \cite{rt} to equal the area of the extremal surface homologous to $A$, in natural units $\hbar = c = 1$ reading $S(A) = \operatorname{Area}(\gamma_A)/(4G_N)$, with quantum corrections given by the generalized entropy. The formula is proposed in \cite{rt}, where it is checked exactly in AdS$_3$ with a two-dimensional conformal field theory, and derived for spherical vacuum regions in any dimension by replica and modular methods \cite{chc}. The static formula follows from gravitational replica methods \cite{lm}; the covariant formula with extremal surfaces was proposed in \cite{hrt} and derived in \cite{dlr}; quantum extremal surfaces extend the prescription beyond the classical regime \cite{ew}. For general regions and excited states the formula remains a proposal, and no derivation independent of AdS/CFT is on record.
\end{remark}

\begin{remark}[Entanglement and connectivity]
\label{rem:vr}
Van Raamsdonk's argument \cite{vr} observes that disentangling two boundary degrees of freedom in a holographic state pinches the bulk geometry apart, and proposes that spacetime connectivity is built from entanglement. The reasoning is an argument from controlled examples and limiting cases; it is not a derivation of the metric from entanglement data.
\end{remark}

\begin{remark}[Tensor-network models]
\label{rem:happy}
The holographic error-correcting codes of Pastawski, Yoshida, Harlow, and Preskill \cite{happy} realize a discrete analogue of the Ryu-Takayanagi formula and of negative tripartite information inside exactly solvable tensor networks. These are toy models: they demonstrate that the information-theoretic mechanisms are internally consistent, and they carry no evidential weight about actual AdS/CFT.
\end{remark}

The entropy quantities in these remarks are the standard ones. For a boundary state $\rho$ on a union of pairwise disjoint regions and a subregion $A$, the reduced state is $\rho_A = \operatorname{Tr}_{\bar{A}} \rho$ and the entanglement entropy is $S(A) = -\operatorname{Tr}(\rho_A \log \rho_A)$; the mutual information is $I(A:B) = S(A) + S(B) - S(A \cup B)$; the tripartite information is $I(A:B:C) = I(A:B) + I(A:C) - I(A:BC)$, which expands to $S(A) + S(B) + S(C) - S(A \cup B) - S(A \cup C) - S(B \cup C) + S(A \cup B \cup C)$ and is invariant under all permutations of $A$, $B$, $C$. Strong subadditivity reads $S(A \cup B) + S(B \cup C) \geq S(B) + S(A \cup B \cup C)$, and the monogamy of mutual information reads $I(A:B:C) \leq 0$. In the holographic setting the entropies are the areas of minimal surfaces, and the question of which linear inequalities those areas satisfy is the question of the entropy cone.

\begin{theorem}[Holographic entropy cone]
\label{thm:cone}
In static holographic settings with $N$ boundary subregions of a state purified by a complement \cite{bao}, the complete linear entropy inequalities for $N = 2, 3, 4$ are generated by subadditivity, the Araki-Lieb inequalities, and monogamy of mutual information. For $N = 5$ five further symmetry orbits of five-party inequalities, including the cyclic five-party inequality, are required, and the resulting description is complete \cite{hc5}. For six and more regions the complete inequality set is unknown. For each fixed $N$ there are only finitely many independent inequalities.
\end{theorem}

\Cref{thm:cone} is a classification result of the kind the program seeks: finite, complete lists of constraints, proved, with sharp scope boundaries. Completeness holds for at most five regions and is open beyond.

\begin{remark}[Worked cone constraints]
\label{rem:cone-worked}
Consider four regions with entropies $S(A) = S(B) = S(C) = S(D) = 2.0$, every two-region union $3.5$, every three-region union $4.5$, and $S(A \cup B \cup C \cup D) = 5.0$, in arbitrary units. The four-region state is mixed and is purified by an environment region of entropy $5.0$, so the Araki-Lieb inequality $|S(A \cup B \cup C) - S(D)| \leq S(A \cup B \cup C \cup D)$ reads $2.5 \leq 5.0$ and holds. Strong subadditivity in the form $S(A \cup B) + S(B \cup C) \geq S(B) + S(A \cup B \cup C)$ reads $3.5 + 3.5 \geq 2.0 + 4.5$, which holds. The monogamy of mutual information in the form $I(A:B) + I(A:C) \leq I(A:BC)$ reads $(2.0 + 2.0 - 3.5) + (2.0 + 2.0 - 3.5) \leq 2.0 + 3.5 - 4.5$, that is $0.5 + 0.5 \leq 1.0$, which holds at equality. The cone of \cref{thm:cone} is exactly the set of entropy vectors satisfying all such inequalities simultaneously; the example illustrates the constraints and proves nothing.
\end{remark}

What the section establishes is a gradient. Entanglement-wedge reconstruction (\cref{thm:dhw}) and the entropy cone (\cref{thm:cone}) are theorems. The entropy formula itself (\cref{rem:rt}) is a proposal with derived special cases. The emergence of geometry from entanglement (\cref{rem:vr}) is an argument. Toy models (\cref{rem:happy}) demonstrate mechanisms, not nature.

\section{Thermodynamic geometry}
\label{sec:thermo}

The oldest working dictionary between information metrics and physical curvature is thermodynamic. Weinhold proposed the Hessian of internal energy as a metric on equilibrium states \cite{weinhold}; Ruppeiner proposed the negative Hessian of entropy and read its curvature as a measure of microscopic interaction \cite{ruppeiner}. The Ruppeiner metric of \cref{def:ruppeiner} is, up to sign convention and a conformal factor, the Fisher metric of thermodynamic fluctuation theory, so the dictionary is an instance of information geometry in physical coordinates. The proposal that Einstein's equations are an equation of state of this thermodynamic structure \cite{jacobson} is the sharpest form of the gravity-thermodynamics link on record, and it is a derivation conditional on the horizon thermodynamics it assumes.

\begin{proposition}[Ideal gas]
\label{prop:ideal-gas}
For the ideal gas with entropy $S(U, V, N) = Nk \bigl(c_v \log U + \log V - (c_v + 1) \log N + \text{const}\bigr)$ at fixed $N$ and heat capacity coefficient $c_v$, the Ruppeiner metric in the coordinates $(U, V)$ is
\begin{equation}
g^{\mathrm{rup}} = Nk \left( c_v \frac{(dU)^2}{U^2} + \frac{(dV)^2}{V^2} \right),
\end{equation}
which is flat: its scalar curvature vanishes identically.
\end{proposition}

\begin{proof}
The mixed second derivatives of $S$ vanish, $-\partial^2 S / \partial U^2 = Nk c_v/U^2$, and $-\partial^2 S / \partial V^2 = Nk/V^2$. In the coordinates $y = \sqrt{c_v} \log U$ and $z = \log V$ the metric becomes $Nk ((dy)^2 + (dz)^2)$, the Euclidean metric, so the Riemann tensor vanishes and $R = 0$.
\end{proof}

\Cref{prop:ideal-gas} is the flat baseline of the dictionary: the ideal gas has no microscopic interactions to diagnose, its entropy is separable in the coordinates $(U, V)$ at fixed $N$, and its Ruppeiner geometry is Euclidean in logarithmic coordinates. Interacting models have nonzero Ruppeiner curvature.

Interacting thermodynamic models have nonzero Ruppeiner scalar curvature that grows sharply near the critical region. For the van der Waals entropy $S(u, v) = \log\bigl((v - b)(u + a/v)^{c_v}\bigr)$ per particle in reduced units $a = b = N = k = 1$ and $c_v = 3/2$ (whose noninteracting limit is the ideal gas of \cref{prop:ideal-gas}), direct computation of the Hessian and the Christoffel symbols gives the closed form
\begin{equation}
\label{eq:vdw-curvature}
R(u, v) = \frac{2uv^5 - 4uv^4 + 2uv^3 - v^4 + 8v^3 - 16v^2 + 12v - 3}{u^2 v^6 - 4uv^5 + 12uv^4 - 6uv^3 + 4v^4 - 24v^3 + 48v^2 - 36v + 9},
\end{equation}
in the convention of \cref{def:ruppeiner} (in Ruppeiner's convention the sign is opposite). The numerator and denominator share no common factor in $(u, v)$, and $R$ vanishes only where the numerator does. Evaluations along the supercritical isochore $v = 3$ give $R \approx 0.417$ at $u = 1$, $R \approx 9.55$ at $u = 0.211$, and $R \approx 179.4$ at $u = 0.131$, a growth of more than two orders of magnitude as the internal energy approaches the critical value $u_c = 1/9 \approx 0.111$, where the denominator also vanishes. The pattern is consistent with Ruppeiner's proposal that flatness marks noninteracting constituents and curvature marks interactions: it holds in the two models computed here, and beyond them it remains a proposed correspondence supported by examples.

\begin{remark}[Two directions of the dictionary]
\label{rem:dictionary}
Thermodynamic geometry instantiates both directions of the correspondence examined in this paper. Information determines geometry: the entropy function, an information-theoretic object, determines the metric by a Hessian. Geometry diagnoses physics: the curvature of that metric is read as an interaction diagnostic. What thermodynamic geometry does not provide is gravity: the metric here is on the space of equilibrium states, not on a spacetime, and no Einstein equation relating it to matter is derived in this paper.
\end{remark}

\section{The proposed gravity-information correspondence}
\label{sec:correspondence}

The Gravity-Information-Geometry research program proposes that curvature and gravitational dynamics arise from informational relationships. This section states the correspondence as precisely as the current evidence allows and separates what is proved from what is proposed.

\begin{remark}[Proposed correspondence]
\label{rem:correspondence}
The proposed dictionary has three entries. First, entropy of boundary subregions determines bulk geometry, as in the Ryu-Takayanagi formula and its quantum corrections (\cref{rem:rt}). Second, information-geometric metrics on state spaces are candidate sources of physical geometry, as in thermodynamic geometry (\cref{sec:thermo}). Third, gravitational dynamics is proposed to arise from the entanglement structure of microscopic degrees of freedom (\cref{rem:vr}). Entries one and two are precise formulas; entry three is a programmatic direction. None of the three is established as a derivation of Einstein's equations from information-theoretic axioms. Conditional derivations exist and each assumes geometric input: the Einstein equation of state from local horizon thermodynamics \cite{jacobson}, linearized dynamics around AdS from the entropy formula and the entanglement first law \cite{fgkmv, lmvr}, and the full equation from an entanglement-equilibrium condition \cite{jac2016}.
\end{remark}

Three constraints follow from the analysis.

\begin{description}
\item[Metric ambiguity] By \cref{prop:nonunique} quantum state spaces carry no canonical monotone metric. A dictionary that assigns geometry to quantum states must select a member $f$ of the Petz family or derive the selection from independent principles. The classical uniqueness of Chentsov (\cref{thm:chentsov}) cannot be invoked past the commutative locus (\cref{prop:commutative}).
\item[Reconstruction scope] \Cref{thm:gelfand,thm:dhw} recover structure from probes. Recovery is not dynamics: no reconstruction theorem on record recovers interacting gravitational dynamics from entanglement data.
\item[Provenance of curvature] The curvature computed in \cref{prop:qubit-sld,prop:ideal-gas} is intrinsic to a state space or to an equilibrium manifold. The proposed identification of such curvature with spacetime curvature is a further hypothesis, and the computations here neither support nor refute it.
\end{description}

The metric ambiguity is the sharpest of the three. In classical statistical mechanics the ruler is unique, so a correspondence of the form ``statistical geometry equals physical geometry'' has no normalization freedom beyond a constant. In quantum statistical mechanics the ruler is a function $f$, and two different rulers give genuinely different geometries on the same state space, as \cref{prop:nonunique} exhibits. Any claim that a quantum state space ``has'' a geometry must therefore answer: which monotone metric, and why.

The emergent-spacetime program states a central test with four targets: recover, from primitive categorical or informational objects, (i) gauge connections and curvature, (ii) quantum states and observables, (iii) interacting gauge-field dynamics, and (iv) spacetime geometry and gravitational dynamics, without assuming at the outset the spacetime geometry the reconstruction is meant to explain. Each target sits at a different point of the proved-to-proposed gradient.

\begin{description}
\item[Connections and curvature] Thermodynamic geometry shows that curvature can be computed from an information object (the entropy function) in equilibrium settings, and the qubit computations show that a state space can carry constant-curvature geometry. The proposed identification of such curvature with physical or spacetime curvature is unestablished.
\item[States and observables] The reconstruction pattern proves recovery of $(X, \mathcal{O})$ from probe data in the commutative setting (\cref{thm:gelfand,thm:stone}) and of bulk operators from boundary subregions in the holographic code setting (\cref{thm:dhw}). Both recover structure; neither delivers dynamics.
\item[Gauge dynamics] No reconstruction theorem on record in the setting of this paper recovers interacting gauge dynamics from information-geometric data. The status of rigorous four-dimensional gauge dynamics is tracked separately in the series and is not used as a premise here.
\item[Spacetime and gravity] The entropy formula is a proposal with derived special cases, the emergence of connectivity is an argument, and the conditional derivations of \cite{jacobson, fgkmv, lmvr, jac2016} each assume geometric input; no unconditional derivation of Einstein's equations from information-theoretic axioms is on record.
\end{description}

\begin{remark}[Structure-preserving discipline]
\label{rem:preservation}
Any proposed identification of systems should state which layers of structure it preserves; equivalences that forget the monoidal or symmetric layer are provably insufficient to recover the underlying group (a constraint from tensor-category theory). The same discipline applies to the proposed correspondences of this section. A dictionary that identifies information-geometric data with physical geometry must state what the identification preserves: the state space, the algebra of observables, the metric class, the dynamics, or some combination. No proposed correspondence examined here states its preserved layers, and none of them is presented as an equivalence.
\end{remark}


Deriving gravitational dynamics from quantum state spaces requires three steps that current theorems do not supply. First, a physical principle independent of gravity must select one metric from the Petz family, whereas channel monotonicity leaves an infinite functional parameter $f$ undetermined (\cref{prop:nonunique}). Second, a construction must map Riemannian geometry on state space to a Lorentzian metric on spacetime; the Ryu-Takayanagi formula instead relates bulk areas to subregion entropies of a fixed state, and its derivations cover only symmetric or semiclassical regimes \cite{chc, lm, dlr}. Third, the induced spacetime metric must satisfy Einstein's equations without assuming horizon thermodynamics at the outset \cite{jacobson}.

The three dictionaries can be compared side by side.

\begin{table}[ht]
\centering
\small
\begin{tabular}{L{0.19\textwidth} L{0.24\textwidth} L{0.24\textwidth} L{0.21\textwidth}}
\toprule
Dictionary & Data taken & Geometry produced & Status in this paper \\
\midrule
State space & Statistical or quantum state data & Fisher or Petz metric on the state space & Theorem, with a metric parameter in the quantum case \\
Thermodynamic & Entropy function of an equilibrium system & Ruppeiner metric on the equilibrium manifold & Computed in two models and proposed beyond them \\
Spacetime & Boundary entanglement entropies & Bulk metric via minimal-surface areas & Proposal with derived special cases \\
\bottomrule
\end{tabular}
\caption{The three geometric correspondences of this paper, with the data each takes and the status each holds. Only the first row is established without qualification.}
\label{tab:dictionaries}
\end{table}

The three dictionaries of \cref{tab:dictionaries} are therefore not steps of one derivation. The entropy formula takes subregion entropies of a single state, which carry no Petz parameter, and relates them to areas of a posited bulk geometry; it does not convert a state-space metric into a spacetime metric. The steps a genuine derivation would need are those of the preceding paragraph, and each is open in the sense of \cref{sec:open}.

\section{Computational evidence}
\label{sec:computation}

Four computational experiments accompany the paper. They are evidence for the computations above and are never proofs. The scripts live in \texttt{src/vol-09-gravity-information-geometry/} and each header names the claim it evidences.

The monotonicity experiment verifies \cref{prop:monotone} numerically. For two thousand random interior points $p$ of the four-outcome simplex and random stochastic maps from four outcomes to three, the smallest eigenvalue of $g_p - (D\varphi)^{\mathsf{T}} g_{\varphi p} (D\varphi)$ restricted to the tangent space was $1.028$ at worst. The eigenvalues are taken in the ambient Euclidean metric on an orthonormal tangent basis, since a difference of metric tensors has no canonical eigenvalues without a reference metric; the positive floor is a sampling artifact of random maps avoiding the coarse-grainings where equality holds.

The monotone-metric experiment verifies \cref{prop:nonunique,prop:commutative} and \cref{rem:qutrit}. At the qubit state $\operatorname{diag}(3/4, 1/4)$ the radial-to-transverse ratio is $1.333333$ for the symmetric logarithmic derivative metric and $1.244017$ for the Wigner-Yanase metric, matching the closed forms $4/3$ and $(2+\sqrt{3})/3$ to twelve decimal places. At the qutrit state $\operatorname{diag}(0.5, 0.3, 0.2)$ the off-diagonal tangent $X_{13} = 1/2$ gives $1.428571$ and $1.500988$, and the diagonal tangent gives $0.163333$ for both normalized metrics and for the Fisher value.

The qubit-geometry experiment verifies \cref{prop:qubit-sld,prop:qubit-fid}. Metric evaluations from the symmetric logarithmic derivative equation match the closed form $|d\vec{r}|^2 + (\vec{r} \cdot d\vec{r})^2 / (1 - |\vec{r}|^2)$ in two hundred random trials to within $10^{-9}$, and the metric tensor in $(\chi, \theta, \varphi)$ coordinates matches $\operatorname{diag}(1, \sin^2\!\chi, \sin^2\!\chi \sin^2\!\theta)$ to within $10^{-10}$ at sampled points, which is the round three-sphere of radius one. Finite-difference fidelity evaluations give $g^{\mathrm{fid}} = g^{\mathrm{sld}}/4$ in dimensions two to four, with worst relative error $3.2 \times 10^{-4}$ over one hundred and eighty random full-rank states and directions. The geodesic distance from the center, obtained by numerical quadrature of the closed-form radial element, matches $\arcsin r$ to within $10^{-6}$ at five sampled radii.

The thermodynamic experiment verifies \cref{prop:ideal-gas} and the van der Waals computation. The symbolic Ricci scalar of the ideal gas metric $\operatorname{diag}(c_v/u^2, 1/v^2)$ at $N = k = 1$ is exactly zero, and the numeric evaluation agrees (the constants $Nk$ and $c_v$ do not affect the vanishing). The van der Waals Ricci scalar is a rational function of $(u, v)$ whose sampled values are those recorded in \cref{sec:thermo}: nonzero away from the critical point, growing from $0.128$ at $(2, 2)$ to $179.4$ at $(0.131, 3)$ near the critical internal energy $u_c = 0.111$.

\section{Code evidence}
\label{sec:code-appendix}

Each computational claim of \cref{sec:computation} maps to a function in the accompanying code.

\begin{table}[ht]
\centering
\small
\begin{tabular}{L{0.30\textwidth} L{0.32\textwidth} L{0.28\textwidth}}
\toprule
Claim & File & Function \\
\midrule
Fisher metric is monotone under stochastic maps & \texttt{fisher\_monotonicity.py} & \texttt{check\_monotonicity} \\
Monotone metrics differ on qubit states & \texttt{quantum\_monotone\_metrics.py} & \texttt{petz\_metric} and \texttt{compare\_metrics} \\
Monotone metrics differ on qutrit states & \texttt{quantum\_monotone\_metrics.py} & \texttt{qutrit\_check} \\
Monotone metrics agree on diagonal states & \texttt{quantum\_monotone\_metrics.py} & \texttt{commutative\_locus\_check} \\
Symmetric logarithmic derivative metric of the qubit is round & \texttt{bures\_qubit\_geometry.py} & \texttt{sld\_closed\_form\_check} and \texttt{round\_sphere\_check} \\
Fidelity metric is one quarter of the symmetric logarithmic derivative metric in dimensions two to four & \texttt{bures\_qubit\_geometry.py} & \texttt{fidelity\_metric\_check} \\
Geodesic distance from the center equals arcsin of the radius & \texttt{bures\_qubit\_geometry.py} & \texttt{distance\_profile\_check} \\
Ideal gas Ruppeiner curvature vanishes & \texttt{ruppeiner\_geometry.py} & \texttt{ideal\_gas\_curvature} \\
Van der Waals curvature is nonzero away from the critical point & \texttt{ruppeiner\_geometry.py} & \texttt{vanderwaals\_curvature} \\
\bottomrule
\end{tabular}
\caption{Computational claims and the functions that demonstrate them. Each function prints its own pass condition; the outputs are evidence, not proofs.}
\label{tab:code}
\end{table}

The Haskell module \texttt{src/vol-09-gravity-information-geometry/Instances.hs} declares instances of shared taxonomy classes (structural families, invariant records, decomposition hooks) for the systems of this paper (classical statistical models, quantum state systems, entanglement-wedge data, thermodynamic systems, weighted-nerve models). The module is executable vocabulary validated against the statements above; it is not machine-checked, and no claim of formal verification is made for it. The paths in this section are relative to the manuscript source tree; no permanent archival identifier for the code is available at the time of writing, and none is invented here.

\section{Open questions}
\label{sec:open}

Six questions follow from the results and constraints of this paper. Each is open in the sense that no theorem cited here resolves it.

\begin{enumerate}
\item \emph{Which monotone metric?} Partial selection principles exist: the expansion of the Umegaki relative entropy selects the Bogoliubov-Kubo-Mori member, quantum estimation selects the symmetric logarithmic derivative member \cite{braunstein-caves, petz-1996}, and the holographic canonical-energy analysis selects the Bogoliubov-Kubo-Mori member for that quantity \cite{lashkari-vr}. Does a physical principle select a member $f$ for a general gravity-information dictionary, or does the metric ambiguity of \cref{prop:nonunique} persist in every such application?
\item \emph{Continuum convergence.} Do the finite-groupoid and weighted-nerve constructions of the emergent-spacetime program (combinatorial objects assembled from a finite groupoid with weights, proposed as discrete models of continuum geometry) converge to a continuum geometry, and under which conditions? Their convergence conditions are not established without complete proofs, and every result in that setting is a hypothesis until the limit is taken with estimates.
\item \emph{The entropy formula in general settings.} The Ryu-Takayanagi formula is derived for spherical vacuum regions and by replica methods in static and covariant form \cite{chc, lm, dlr}. What replaces it where extremal surfaces fail (quantum extremal surfaces being one candidate \cite{ew}), and what is its status for general excited states? The proved quantum-information content (entanglement-wedge reconstruction, the entropy cone for at most five regions) does not settle the status of the formula itself.
\item \emph{Curvature as physics.} Under what hypotheses does the curvature of an information-geometric metric correspond to a physical interaction or to spacetime curvature? The thermodynamic reading works in the two models computed here and is a proposed correspondence beyond them. The step from equilibrium curvature to spacetime curvature is unmade.
\item \emph{Infinite dimensions.} How do the Petz family and the uniqueness locus behave on the state spaces of quantum field theory, where the finite-dimensional proofs of this paper do not apply? The monotone-metric classification in that setting is a different problem from the one solved by Petz and Sud\'ar.
\item \emph{Reconstruction of dynamics.} Can a reconstruction theorem in the sense of \cref{def:probe} recover interacting dynamics from probe data? Every reconstruction result on record recovers structure, not evolution.
\end{enumerate}

\section{Limitations}
\label{sec:limitations}

Everything computed here is finite-dimensional. The infinite-dimensional state spaces of quantum field theory, including type III factors with their non-type-I modular theory, are outside the proofs of this paper, and the behavior of the Petz family there is a different question.

\Cref{thm:chentsov,thm:petz-sudar,thm:gelfand,thm:stone,thm:dhw,thm:cone} are quoted from the literature with their hypotheses and are not reproved here. The proofs given in this paper are those of \cref{prop:monotone,prop:nonunique,prop:commutative,prop:qubit-sld,prop:qubit-fid,prop:ideal-gas}, and the computations of \cref{sec:computation} are numerical checks of exactly those statements.

The van der Waals curvature values are numerical. They are computed away from the critical point and are consistent with the interaction reading of the Ruppeiner curvature; no theorem here connects thermodynamic curvature to microscopic dynamics in general systems. The parameter $f$ of the Petz family is not derived from physical principles in this paper beyond the partial selections of \cref{lem:kl}, so the metric ambiguity of \cref{prop:nonunique} is exhibited, not resolved.

No statement of this paper derives Einstein's equations, or any gravitational dynamics, from information-theoretic axioms. The entropy formula remains a proposal outside its derived special cases, and the continuum convergence of weighted-nerve constructions is unestablished and unused.

The status of the correspondence is mathematical, not empirical. Nothing here is a claim about measured physics, about the value of any physical constant, or about the correctness of any experiment. On the scale of mathematical achievement (formulation, rigorous theorem, physical validation) the results of this paper sit on the first two levels: the formulations are precise, the theorems are proved or quoted with hypotheses, and physical validation of any gravity-information correspondence is not part of this paper.

\section{Conclusion}
\label{sec:conclusion}

The relationship between information geometry and gravity is a correspondence of two very different evidential statuses, and the classification viewpoint makes the boundary precise. Classical statistical geometry is rigid: the Fisher metric is the unique monotone ruler, and the simplex carries a round-sphere geometry. Quantum statistical geometry is parametric: the Petz family is infinite, the ambiguity appears already on qubits, and any dictionary that assigns geometry to quantum states must name its metric. Uniqueness survives exactly on the commutative locus, where every normalized monotone metric restricts to the Fisher metric.

The proofs contributed here fix that boundary at six points. Fisher monotonicity is proved by a Cauchy-Schwarz argument and checked against two thousand random trials. The non-proportionality of the symmetric logarithmic derivative and Wigner-Yanase metrics on qubit states is an explicit computation at one state, and it settles the uniqueness question for the quantum case in the negative. The commutative-locus statement localizes the surviving uniqueness with a diagonal computation and Chentsov's theorem. The symmetric logarithmic derivative metric of the open qubit state space is an open hemisphere of the round three-sphere of radius one, computed in Bloch coordinates and identified by the substitution $r = \sin \chi$; the fidelity metric is one quarter of it. The ideal gas Ruppeiner metric is flat by an explicit coordinate change, and the van der Waals curvature is nonzero away from the critical point and grows toward it.

The geometric side of the correspondence is graded the same way. Entanglement-wedge reconstruction and the entropy cone for at most five regions are theorems. The qubit computations show that constant-curvature geometry arises from state spaces by construction. The entropy formula in general settings, the emergence of spacetime from entanglement, and gravity from information geometry are proposals and arguments, and this paper has kept them at that status.

What follows for the classification program is a concrete constraint. Information-geometric invariants classify classical statistical systems without a choice problem and quantum systems only after a choice of $f$. A restricted classification statement in this area must therefore fix the monotone metric as part of its data. The three dictionaries of \cref{tab:dictionaries} are not interchangeable, and only the state-space dictionary is established without qualification. The central question of the emergent-spacetime program stays open: whether the structures examined here recover an interacting physical theory without assuming the spacetime geometry they aim to explain. The evidence assembled here locates that question rather than answers it.

\begin{thebibliography}{99}
\small

\bibitem{bao}
N. Bao, S. Nezami, H. Ooguri, B. Stoica, J. Sully, and M. Walter,
``The holographic entropy cone,''
\emph{Journal of High Energy Physics} 09 (2015) 130.
arXiv:1505.07839.

\bibitem{braunstein-caves}
S. L. Braunstein and C. M. Caves,
``Statistical distance and the geometry of quantum states,''
\emph{Physical Review Letters} 72 (1994) 3439\textendash 3443.
DOI: 10.1103/PhysRevLett.72.3439.

\bibitem{chc}
H. Casini, M. Huerta, and R. C. Myers,
``Towards a derivation of holographic entanglement entropy,''
\emph{Journal of High Energy Physics} 05 (2011) 036.
DOI: 10.1007/JHEP05(2011)036.

\bibitem{chentsov}
N. N. Chentsov,
\emph{Statistical Decision Rules and Optimal Inference},
Translations of Mathematical Monographs 53, American Mathematical Society, 1982.
DOI: 10.1090/mmono/053.

\bibitem{dhw}
X. Dong, D. Harlow, and A. C. Wall,
``Reconstruction of bulk operators within the entanglement wedge in gauge-gravity duality,''
\emph{Physical Review Letters} 117 (2016) 021601.
arXiv:1601.05416.

\bibitem{dlr}
X. Dong, A. Lewkowycz, and M. Rangamani,
``Deriving covariant holographic entanglement,''
\emph{Journal of High Energy Physics} 11 (2016) 028.
DOI: 10.1007/JHEP11(2016)028.

\bibitem{ew}
N. Engelhardt and A. C. Wall,
``Quantum extremal surfaces: holographic entanglement entropy beyond the classical regime,''
\emph{Journal of High Energy Physics} 01 (2015) 073.
DOI: 10.1007/JHEP01(2015)073.

\bibitem{fgkmv}
T. Faulkner, M. Guica, T. Hartman, R. C. Myers, and M. Van Raamsdonk,
``Gravitation from entanglement in holographic CFTs,''
\emph{Journal of High Energy Physics} 03 (2014) 051.
DOI: 10.1007/JHEP03(2014)051.

\bibitem{gn}
I. M. Gelfand and M. A. Naimark,
``On the imbedding of normed rings into the ring of operators in Hilbert space,''
\emph{Matematicheskii Sbornik} 12 (1943) 197\textendash 213.
Reprinted in \emph{Contemporary Mathematics} 167, American Mathematical Society, 1994, pp. 403\textendash 419.
DOI: 10.1090/conm/167/16.

\bibitem{hefford-wilson}
J. Hefford and M. Wilson,
``A profunctorial semantics for quantum supermaps,''
arXiv:2402.02997 (2024).

\bibitem{hc5}
S. Hern\'andez-Cuenca,
``Holographic entropy cone for five regions,''
\emph{Physical Review D} 100 (2019) 026004.
DOI: 10.1103/PhysRevD.100.026004.

\bibitem{hrt}
V. E. Hubeny, M. Rangamani, and T. Takayanagi,
``A covariant holographic entanglement entropy proposal,''
\emph{Journal of High Energy Physics} 07 (2007) 062.
DOI: 10.1088/1126-6708/2007/07/062.

\bibitem{hubner}
M. H\"ubner,
``Explicit computation of the Bures distance for density matrices,''
\emph{Physics Letters A} 163 (1992) 239\textendash 242.
DOI: 10.1016/0375-9601(92)91004-B.

\bibitem{jacobson}
T. Jacobson,
``Thermodynamics of spacetime: the Einstein equation of state,''
\emph{Physical Review Letters} 75 (1995) 1260\textendash 1263.
DOI: 10.1103/PhysRevLett.75.1260.

\bibitem{jac2016}
T. Jacobson,
``Entanglement equilibrium and the Einstein equation,''
\emph{Physical Review Letters} 116 (2016) 201101.
DOI: 10.1103/PhysRevLett.116.201101.

\bibitem{lmvr}
N. Lashkari, M. B. McDermott, and M. Van Raamsdonk,
``Gravitational dynamics from entanglement thermodynamics,''
\emph{Journal of High Energy Physics} 04 (2014) 195.
DOI: 10.1007/JHEP04(2014)195.

\bibitem{lashkari-vr}
N. Lashkari and M. Van Raamsdonk,
``Canonical energy is quantum Fisher information,''
\emph{Journal of High Energy Physics} 04 (2016) 153.
DOI: 10.1007/JHEP04(2016)153.

\bibitem{lm}
A. Lewkowycz and J. Maldacena,
``Generalized gravitational entropy,''
\emph{Journal of High Energy Physics} 08 (2013) 090.
DOI: 10.1007/JHEP08(2013)090.

\bibitem{happy}
F. Pastawski, B. Yoshida, D. Harlow, and J. Preskill,
``Holographic quantum error-correcting codes: toy models for the bulk/boundary correspondence,''
\emph{Journal of High Energy Physics} 06 (2015) 149.
arXiv:1503.06237.

\bibitem{petz-1996}
D. Petz,
``Monotone metrics on matrix spaces,''
\emph{Linear Algebra and its Applications} 244 (1996) 81\textendash 96.
DOI: 10.1016/0024-3795(94)00211-8.

\bibitem{petz-sudar-jmp}
D. Petz and Cs. Sud\'ar,
``Geometries of quantum states,''
\emph{Journal of Mathematical Physics} 37 (1996) 2662\textendash 2673.
DOI: 10.1063/1.531535.

\bibitem{petz-sudar}
D. Petz and Cs. Sud\'ar,
``Extending the Fisher metric to density matrices,''
in \emph{Geometry in Present Days Science}, eds.\ O. E. Barndorff-Nielsen and B. Vendel Jensen, World Scientific, 1999, pp. 21\textendash 34.
arXiv:quant-ph/0102132.

\bibitem{ruppeiner}
G. Ruppeiner,
``Thermodynamics: a Riemannian geometric model,''
\emph{Physical Review A} 20 (1979) 1608\textendash 1613.
DOI: 10.1103/PhysRevA.20.1608.

\bibitem{rt}
S. Ryu and T. Takayanagi,
``Holographic derivation of entanglement entropy from AdS/CFT,''
\emph{Physical Review Letters} 96 (2006) 181602.
arXiv:hep-th/0603001.

\bibitem{stone}
M. H. Stone,
``Applications of the theory of Boolean rings to general topology,''
\emph{Transactions of the American Mathematical Society} 41 (1937) 375\textendash 481.
DOI: 10.1090/S0002-9947-1937-1501905-7.

\bibitem{uhlmann}
A. Uhlmann,
``The transition probability in the state space of a $*$-algebra,''
\emph{Reports on Mathematical Physics} 9 (1976) 273\textendash 279.
DOI: 10.1016/0034-4877(76)90060-4.

\bibitem{vr}
M. Van Raamsdonk,
``Building up spacetime with quantum entanglement,''
\emph{General Relativity and Gravitation} 42 (2010) 2323\textendash 2329.
arXiv:1005.3035.

\bibitem{weinhold}
F. Weinhold,
``Metric geometry of equilibrium thermodynamics,''
\emph{Journal of Chemical Physics} 63 (1975) 2479\textendash 2483.
DOI: 10.1063/1.431689.

\bibitem{whh}
M. Wilson, J. Hefford, and T. Hoffreumon,
``Supermaps on generalised theories,''
arXiv:2602.23865 (2026).

\end{thebibliography}

\end{document}

exec
/usr/local/bin/zsh -lc 'cat src/vol-09-gravity-information-geometry/fisher_monotonicity.py' in /Users/mlong/Documents/Development/classification-physical-systems
exec
/usr/local/bin/zsh -lc 'cat src/vol-09-gravity-information-geometry/Instances.hs' in /Users/mlong/Documents/Development/classification-physical-systems
exec
/usr/local/bin/zsh -lc 'cat src/vol-09-gravity-information-geometry/ruppeiner_geometry.py' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D experiment for vol-09-gravity-information-geometry.

Claim evidenced (never proved) here: Proposition "Monotonicity of the Fisher
metric" of the paper -- the Fisher metric on the probability simplex decreases
under stochastic maps, i.e. g_p - (D phi)^T g_{phi p} (D phi) is positive
semidefinite for random interior points p and random stochastic maps phi.

Computational evidence only. This script is not a proof.
"""

import numpy as np

RNG = np.random.default_rng(20261029)


def fisher_metric(p: np.ndarray) -> np.ndarray:
    """Fisher metric g_p = diag(1/p_i) restricted to sum u_i = 0."""
    return np.diag(1.0 / p)


def random_stochastic(n_out: int, n_in: int) -> np.ndarray:
    """Random n_out x n_in matrix with nonnegative entries and unit column sums."""
    m = RNG.random((n_out, n_in))
    return m / m.sum(axis=0, keepdims=True)


def pullback_matrix(phi: np.ndarray, q: np.ndarray) -> np.ndarray:
    """D phi^T g_q D phi for q = phi p, in ambient coordinates."""
    g_q = fisher_metric(q)
    return phi.T @ g_q @ phi


def check_monotonicity(trials: int = 2000, n_in: int = 4, n_out: int = 3,
                       tol: float = 1e-9) -> bool:
    """Return True iff g_p - (D phi)^T g_q (D phi) is PSD in every trial.

    Tangent space is sum u_i = 0, so PSD-ness is checked on the restriction
    to that subspace (ambient PSD implies the restriction; we additionally
    report the smallest restricted eigenvalue).
    """
    ok = True
    worst = np.inf
    for _ in range(trials):
        p = RNG.random(n_in) + 0.05
        p = p / p.sum()
        phi = random_stochastic(n_out, n_in)
        q = phi @ p
        g_p = fisher_metric(p)
        diff = g_p - pullback_matrix(phi, q)
        # restrict to the tangent space {u : sum u_i = 0} via an orthonormal basis
        _, _, vh = np.linalg.svd(np.ones((1, n_in)))
        a = vh[1:, :].T
        diff_t = a.T @ diff @ a
        lam = np.linalg.eigvalsh(diff_t).min()
        worst = min(worst, lam)
        if lam < -tol:
            ok = False
    print(f"trials={trials}  worst restricted eigenvalue={worst:.3e}")
    return ok


def main() -> None:
    ok = check_monotonicity()
    print("PASS" if ok else "FAIL",
          ": Fisher monotonicity under stochastic maps (Prop. 3.1)")


if __name__ == "__main__":
    main()

 succeeded in 0ms:
{-# LANGUAGE TypeFamilies #-}

-- | Module        : Vol09GravityInformationGeometry.Instances
-- Description     : Taxonomy instances for the physical systems of
--                   vol-09-gravity-information-geometry (Gravity, Information,
--                   and Geometric Correspondence).
-- Paper source    : papers/latex/vol-09-gravity-information-geometry.tex
-- Taxonomy source : src/Taxonomy/ (imported classes, never redefined).
--
-- Declares instances of the shared taxonomy classes for this volume's
-- systems: classical statistical models (Fisher geometry), quantum state
-- systems (Petz monotone metrics), entanglement-wedge data, thermodynamic
-- systems (Ruppeiner geometry), and weighted-nerve models. Type and method
-- names mirror the paper's definitions and the mechanization targets in
-- verification/vol-09-gravity-information-geometry-lean-targets.md.
--
-- Claim status (docs/theorem-registry.md): this module is executable
-- vocabulary validated against the paper's statements. It is computational
-- evidence only. It is NOT machine-checked and is never 'verified by Lean';
-- the honest statement is 'executable models validated against kernel-checked
-- specifications' once the Lean layer exists.
module Vol09GravityInformationGeometry.Instances
  ( -- * Systems of the paper
    ClassicalStatisticalModel (..)
  , QuantumStateSystem (..)
  , EntanglementWedgeSystem (..)
  , ThermodynamicGeometrySystem (..)
  , WeightedNerveModel (..)
    -- * Metric data mirroring the paper's definitions
  , FisherMetricData (..)
  , PetzMetricData (..)
  , RuppeinerMetricData (..)
  , EntropyWedgeData (..)
    -- * Invariant record shape (DEF-036)
  , quantumInvariantRecord
  ) where

import Taxonomy.Families
  ( PhysicalSystem (..)
  , FamilyProbabilityMeasure (..)
  , FamilyHilbertOperatorAlgebras (..)
  , FamilySmoothGeometric (..)
  , FamilyTensorCategoriesComposition (..)
  , FamilyDiscreteCombinatorial (..)
  )
import Taxonomy.Invariants (InvariantRecord (..))
import Taxonomy.Constructions (Decomposable (..), Decomposition (..), Construction (..))

-- | Fisher metric data of a classical statistical model (paper, Definition
-- 'Fisher metric'). The sample size and the probability vector are recorded
-- as plain data; no metric is computed here.
data FisherMetricData = FisherMetricData
  { sampleSize :: Int
    -- ^ n = |Omega| of Definition 'Statistical model'.
  , probabilityVector :: [Double]
    -- ^ Interior point p of the simplex.
  }
  deriving (Eq, Show)

-- | Petz monotone metric data of a quantum state system (paper, Definition
-- 'Operator monotone function and the Petz family'). The tag names which
-- normalized operator monotone function is in force; the family is
-- parametric and the choice is load-bearing (paper, Proposition
-- 'Non-uniqueness on qubit states').
data PetzMetricData
  = SymmetricLogarithmicDerivative
    -- ^ f(t) = (1+t)/2; lean target petz_metric_sld.
  | WignerYanase
    -- ^ f(t) = (1/4)(1 + sqrt t)^2; lean target petz_metric_wy.
  | FidelityNormalization
    -- ^ Fidelity metric, one quarter of the SLD metric on qubits; lean
    -- target bures_qubit_round_sphere.
  deriving (Eq, Ord, Show)

-- | Ruppeiner metric data of a thermodynamic system (paper, Definition
-- 'Ruppeiner metric'). The equation of state is recorded as plain data.
data RuppeinerMetricData = RuppeinerMetricData
  { entropyFunction :: String
    -- ^ Name of the entropy function in force (ideal gas or van der Waals).
  , extensiveCoordinates :: [String]
    -- ^ Names of the extensive variables, e.g. ["U", "V"].
  }
  deriving (Eq, Show)

-- | Entanglement wedge data (paper, Definition 'Entanglement wedge'). The
-- region list and wedge assignment are plain data; nothing is derived here.
data EntropyWedgeData = EntropyWedgeData
  { boundaryRegions :: [String]
    -- ^ Boundary region labels A, B, C, ...
  , wedgeAssignments :: [(String, String)]
    -- ^ Pairs (region, bulk operator label) localized in the wedge.
  , regionCount :: Int
    -- ^ Number of boundary regions; the proved entropy-cone range is <= 5.
  }
  deriving (Eq, Show)

-- | A classical statistical model: state space is a finite probability
-- simplex, observables are functions on the sample space, dynamics and
-- symmetry data are recorded as the model declares them.
data ClassicalStatisticalModel = ClassicalStatisticalModel
  { statisticalModelName :: String
  , statisticalData :: FisherMetricData
  }
  deriving (Eq, Show)

-- | A quantum state system: states are density operators on C^d, observables
-- are the matrix algebra, and the monotone metric in force is named by a
-- 'PetzMetricData' tag (the choice cannot be suppressed: quantum monotone
-- metrics are parametric).
data QuantumStateSystem = QuantumStateSystem
  { quantumDimension :: Int
  , monotoneMetricTag :: PetzMetricData
  }
  deriving (Eq, Show)

-- | Entanglement-wedge system: boundary subregion structure together with
-- the entropy-cone range in force (at most 5 regions is the proved range of
-- the paper's Theorem 'Holographic entropy cone').
data EntanglementWedgeSystem = EntanglementWedgeSystem
  { wedgeName :: String
  , wedgeData :: EntropyWedgeData
  }
  deriving (Eq, Show)

-- | Thermodynamic geometry system: an equilibrium manifold with a Ruppeiner
-- metric. Ideal gas instances are flat (paper, Proposition 'Ideal gas');
-- interacting instances are not.
data ThermodynamicGeometrySystem = ThermodynamicGeometrySystem
  { thermoName :: String
  , thermoData :: RuppeinerMetricData
  }
  deriving (Eq, Show)

-- | Weighted-nerve model: finite combinatorial data proposed to converge to
-- a continuum geometry. The convergence condition is a hypothesis of this
-- volume, not an established fact; the Boolean records whether a convergence
-- claim is attached.
data WeightedNerveModel = WeightedNerveModel
  { nerveName :: String
  , groupoidObjects :: Int
  , continuumConvergenceClaimed :: Bool
    -- ^ Always False in honest instances: convergence is not established.
  }
  deriving (Eq, Show)

-- | Family V instance: classical statistical models carry probability and
-- measure structure (DEF-030).
instance FamilyProbabilityMeasure ClassicalStatisticalModel where
  type ProbabilityMeasureData ClassicalStatisticalModel = FisherMetricData
  probabilityMeasureData = statisticalData

-- | Family V instance: quantum state systems carry measure structure through
-- their monotone metrics (DEF-030).
instance FamilyProbabilityMeasure QuantumStateSystem where
  type ProbabilityMeasureData QuantumStateSystem = PetzMetricData
  probabilityMeasureData = monotoneMetricTag

-- | Family II instance: quantum state systems are operator-algebraic
-- (DEF-027).
instance FamilyHilbertOperatorAlgebras QuantumStateSystem where
  type OperatorAlgebraData QuantumStateSystem = Int
  operatorAlgebraData = quantumDimension

-- | Family II instance: entanglement wedges live over boundary operator
-- algebras (DEF-027).
instance FamilyHilbertOperatorAlgebras EntanglementWedgeSystem where
  type OperatorAlgebraData EntanglementWedgeSystem = EntropyWedgeData
  operatorAlgebraData = wedgeData

-- | Family VIII instance: entanglement data is compositional structure
-- (DEF-033).
instance FamilyTensorCategoriesComposition EntanglementWedgeSystem where
  type TensorCategoryData EntanglementWedgeSystem = [String]
  tensorCategoryData = boundaryRegions . wedgeData

-- | Family V instance: thermodynamic equilibrium manifolds carry measure
-- structure through fluctuation theory (DEF-030).
instance FamilyProbabilityMeasure ThermodynamicGeometrySystem where
  type ProbabilityMeasureData ThermodynamicGeometrySystem = RuppeinerMetricData
  probabilityMeasureData = thermoData

-- | Family III instance: thermodynamic systems carry smooth geometric
-- structure (DEF-028), the Ruppeiner metric.
instance FamilySmoothGeometric ThermodynamicGeometrySystem where
  type GeometricData ThermodynamicGeometrySystem = RuppeinerMetricData
  geometricData = thermoData

-- | Family IX instance: weighted-nerve models are discrete combinatorial
-- data (DEF-034).
instance FamilyDiscreteCombinatorial WeightedNerveModel where
  type CombinatorialData WeightedNerveModel = (Int, Bool)
  combinatorialData m = (groupoidObjects m, continuumConvergenceClaimed m)

-- | Family III instance: weighted-nerve models propose a smooth geometry
-- (DEF-028) only through an unestablished continuum limit.
instance FamilySmoothGeometric WeightedNerveModel where
  type GeometricData WeightedNerveModel = String
  geometricData = nerveName

-- | DEF-002 instance: the classical statistical model as an object of the
-- schema P = (X, O, D, S, C). Dynamics and symmetries are the trivial ones
-- declared here; the instance records shape, not content.
instance PhysicalSystem ClassicalStatisticalModel where
  type StateSpace ClassicalStatisticalModel = FisherMetricData
  type Observables ClassicalStatisticalModel = [String]
  type Dynamics ClassicalStatisticalModel = ()
  type Symmetries ClassicalStatisticalModel = [String]
  type Composition ClassicalStatisticalModel = ()
  stateSpace = statisticalData
  observables _ = ["functions on Omega"]
  dynamics _ = ()
  symmetries _ = ["permutations of outcomes"]
  composition _ = ()

-- | DEF-002 instance: the quantum state system.
instance PhysicalSystem QuantumStateSystem where
  type StateSpace QuantumStateSystem = Int
  type Observables QuantumStateSystem = String
  type Dynamics QuantumStateSystem = ()
  type Symmetries QuantumStateSystem = String
  type Composition QuantumStateSystem = ()
  stateSpace = quantumDimension
  observables _ = "matrix algebra M_d(C)"
  dynamics _ = ()
  symmetries _ = "unitary group U(d)"
  composition _ = ()

-- | DEF-002 instance: the entanglement-wedge system.
instance PhysicalSystem EntanglementWedgeSystem where
  type StateSpace EntanglementWedgeSystem = EntropyWedgeData
  type Observables EntanglementWedgeSystem = [(String, String)]
  type Dynamics EntanglementWedgeSystem = ()
  type Symmetries EntanglementWedgeSystem = [String]
  type Composition EntanglementWedgeSystem = [String]
  stateSpace = wedgeData
  observables = wedgeAssignments . wedgeData
  dynamics _ = ()
  symmetries = boundaryRegions . wedgeData
  composition = boundaryRegions . wedgeData

-- | DEF-002 instance: the thermodynamic geometry system.
instance PhysicalSystem ThermodynamicGeometrySystem where
  type StateSpace ThermodynamicGeometrySystem = RuppeinerMetricData
  type Observables ThermodynamicGeometrySystem = [String]
  type Dynamics ThermodynamicGeometrySystem = ()
  type Symmetries ThermodynamicGeometrySystem = [String]
  type Composition ThermodynamicGeometrySystem = ()
  stateSpace = thermoData
  observables _ = ["equilibrium observables"]
  dynamics _ = ()
  symmetries _ = []
  composition _ = ()

-- | DEF-002 instance: the weighted-nerve model. Composition is the monoidal
-- product of the underlying combinatorial data.
instance PhysicalSystem WeightedNerveModel where
  type StateSpace WeightedNerveModel = Int
  type Observables WeightedNerveModel = String
  type Dynamics WeightedNerveModel = ()
  type Symmetries WeightedNerveModel = String
  type Composition WeightedNerveModel = String
  stateSpace = groupoidObjects
  observables _ = "nerve functions"
  dynamics _ = ()
  symmetries _ = "groupoid automorphisms"
  composition _ = "tensor product of nerves"

-- | DEF-022 instance: a classical statistical model decomposes over the
-- outcomes of Omega when the composition rule is direct sum of the outcome
-- branches. Uniqueness of decomposition is not claimed (paper, Section 2).
instance Decomposable ClassicalStatisticalModel where
  decomposition m =
    Just Decomposition
      { decompositionConstruction = DirectSum
      , irreducibleFactors = [m]
      }

-- | A model does not supply a decomposition of its entanglement wedge data
-- here; Nothing records that none is supplied, not that none exists.
instance Decomposable EntanglementWedgeSystem where
  decomposition _ = Nothing

-- | Invariant record shape for a quantum state system (DEF-036). The fields
-- carry the classification data the paper discusses: the Petz family member
-- as state-side invariant data. No classification is computed.
quantumInvariantRecord :: QuantumStateSystem -> InvariantRecord PetzMetricData Int () String Int
quantumInvariantRecord q =
  InvariantRecord
    { stateInvariants = monotoneMetricTag q
    , observableInvariants = quantumDimension q
    , dynamicsInvariants = ()
    , symmetryInvariants = "U(d)"
    , representationInvariants = quantumDimension q
    }

 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D experiment for vol-09-gravity-information-geometry.

Claims evidenced (never proved) here:
  1. Proposition "Ideal gas": the Ruppeiner metric of the ideal gas is flat
     (scalar curvature zero), checked symbolically and at sample points.
  2. Thermodynamic curvature reading: the van der Waals Ruppeiner scalar
     curvature is nonzero away from the critical point and grows toward it
     in the sampled states (Ruppeiner's proposed interaction diagnostic).

Computational evidence only. This script is not a proof.
"""

import sympy as sp


def scalar_curvature(coords, metric):
    """Ricci scalar of a 2-dimensional metric given as a sympy Matrix."""
    n = len(coords)
    g = metric
    ginv = g.inv()
    gamma = [[[0] * n for _ in range(n)] for _ in range(n)]
    for k in range(n):
        for i in range(n):
            for j in range(n):
                s = 0
                for l in range(n):
                    s += ginv[k, l] * (
                        sp.diff(g[l, j], coords[i])
                        + sp.diff(g[l, i], coords[j])
                        - sp.diff(g[i, j], coords[l])
                    )
                gamma[k][i][j] = sp.simplify(s / 2)
    ricci = sp.zeros(n, n)
    for i in range(n):
        for j in range(n):
            s = 0
            for k in range(n):
                s += (
                    sp.diff(gamma[k][i][j], coords[k])
                    - sp.diff(gamma[k][i][k], coords[j])
                )
                for l in range(n):
                    s += gamma[l][i][j] * gamma[k][k][l] - gamma[l][i][k] * gamma[k][j][l]
            ricci[i, j] = sp.simplify(s)
    r = 0
    for i in range(n):
        for j in range(n):
            r += ginv[i, j] * ricci[i, j]
    return sp.simplify(r)


def ideal_gas_curvature() -> bool:
    u, v = sp.symbols("u v", positive=True)
    # S = Nk (ln U + ln V - c ln N + const) at fixed N = k = 1
    s = sp.log(u) + sp.log(v)
    g = sp.simplify(-sp.hessian(s, (u, v)))
    r = scalar_curvature((u, v), g)
    at_point = r.subs({u: 2.0, v: 3.0})
    print(f"  ideal gas metric:\n{g}")
    print(f"  scalar curvature R = {r}, R(2,3) = {at_point}")
    return r == 0


def vanderwaals_curvature() -> bool:
    u, v = sp.symbols("u v", positive=True)
    a, b, cv = 1, 1, sp.Rational(3, 2)
    # S = ln[(v - b) (u + a/v)^cv] per particle, k = 1
    s = sp.log(v - b) + cv * sp.log(u + a / v)
    g = sp.simplify(-sp.hessian(s, (u, v)))
    r = scalar_curvature((u, v), g)
    print(f"  van der Waals scalar curvature R(u,v) = {r}")
    # critical point of van der Waals with a = b = 1: v_c = 3, T_c = 8/27,
    # u_c = cv T_c - a / v_c
    t_c = sp.Rational(8, 27)
    u_c = float(cv * t_c - a / 3.0)
    samples = [(2.0, 2.0), (2.0, 3.5), (1.0, 3.0), (u_c + 0.5, 3.0), (u_c + 0.1, 3.0), (u_c + 0.02, 3.0)]
    ok = True
    prev = None
    for uu, vv in samples:
        val = complex(r.subs({u: uu, v: vv})).real
        print(f"  R({uu:.3f}, {vv:.3f}) = {val:.6f}")
        if uu == 2.0 and vv == 2.0:
            if abs(val) < 1e-9:
                ok = False
        if prev is not None and uu < 1.0:
            if abs(val) < abs(prev):
                ok = False
        prev = val
    print(f"  critical point at u_c = {u_c:.6f}, v_c = 3.0")
    return ok


def main() -> None:
    ok1 = ideal_gas_curvature()
    print("PASS" if ok1 else "FAIL",
          ": ideal gas Ruppeiner curvature vanishes (Prop. 8.1)")
    ok2 = vanderwaals_curvature()
    print("PASS" if ok2 else "FAIL",
          ": van der Waals curvature nonzero away from critical point")


if __name__ == "__main__":
    main()

exec
/usr/local/bin/zsh -lc 'cat src/vol-09-gravity-information-geometry/bures_qubit_geometry.py' in /Users/mlong/Documents/Development/classification-physical-systems
exec
/usr/local/bin/zsh -lc 'cat src/vol-09-gravity-information-geometry/quantum_monotone_metrics.py' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D experiment for vol-09-gravity-information-geometry.

Claims evidenced (never proved) here:
  1. Proposition "Symmetric logarithmic derivative geometry of the qubit":
     the SLD metric in Bloch coordinates equals |dr|^2 + (r.dr)^2/(1-|r|^2),
     and in chi coordinates (r = sin chi) is the round metric of radius one.
  2. Proposition "Fidelity metric of the qubit": the fidelity metric equals
     one quarter of the SLD metric at sampled states and directions.

Computational evidence only. This script is not a proof.
"""

import numpy as np

SIGMA_X = np.array([[0.0, 1.0], [1.0, 0.0]])
SIGMA_Y = np.array([[0.0, -1.0j], [1.0j, 0.0]])
SIGMA_Z = np.array([[1.0, 0.0], [0.0, -1.0]])


def bloch_state(r: np.ndarray) -> np.ndarray:
    """rho = (I + r . sigma) / 2."""
    return (np.eye(2) + r[0] * SIGMA_X + r[1] * SIGMA_Y + r[2] * SIGMA_Z) / 2.0


def sld_solve(rho: np.ndarray, x: np.ndarray) -> np.ndarray:
    """Solve X = (rho L + L rho) / 2 for Hermitian L, in the eigenbasis."""
    lam, u = np.linalg.eigh(rho)
    xd = u.conj().T @ x @ u
    ld = np.zeros_like(xd)
    for i in range(len(lam)):
        for j in range(len(lam)):
            ld[i, j] = xd[i, j] * 2.0 / (lam[i] + lam[j])
    return u @ ld @ u.conj().T


def sld_value(rho: np.ndarray, x: np.ndarray) -> float:
    """g_sld(X, X) = Tr(X L)."""
    l = sld_solve(rho, x)
    return float(np.real(np.trace(x @ l)))


def sld_metric_bloch(r: np.ndarray, dr: np.ndarray) -> float:
    """Closed form |dr|^2 + (r.dr)^2 / (1 - |r|^2)."""
    r = np.asarray(r, dtype=float)
    dr = np.asarray(dr, dtype=float)
    return float(dr @ dr + (r @ dr) ** 2 / (1.0 - r @ r))


def fidelity(rho: np.ndarray, sigma: np.ndarray) -> float:
    """Uhlmann fidelity (Tr sqrt(sqrt(rho) sigma sqrt(rho)))^2."""
    def sqrtm_h(a: np.ndarray) -> np.ndarray:
        lam, u = np.linalg.eigh(a)
        return u @ np.diag(np.sqrt(np.maximum(lam, 0.0))) @ u.conj().T

    sr = sqrtm_h(rho)
    inner = sr @ sigma @ sr
    t = np.real(np.trace(sqrtm_h(inner)))
    return float(t**2)


def fidelity_value(rho: np.ndarray, x: np.ndarray, eps: float = 1e-4) -> float:
    """Second-order fidelity metric value from d_B^2 = 2(1 - sqrt(F))."""
    sigma = rho + eps * x
    db2 = 2.0 * (1.0 - np.sqrt(fidelity(rho, sigma)))
    return float(db2 / eps**2)


def round_sphere_check() -> bool:
    """Verify the closed-form metric is the round metric after r = sin chi.

    Works in spherical coordinates: builds G = I + r r^T/(1-|r|^2) on the
    Bloch ball, transforms to (chi, theta, phi) with r = sin chi, and compares
    with diag(1, sin^2 chi, sin^2 chi sin^2 theta), the round metric of
    radius one.
    """
    ok = True
    for chi, theta, phi in [(0.2, 0.7, 1.1), (0.5, 1.2, 0.3), (1.0, 0.9, 2.2), (1.3, 1.9, 0.6)]:
        r = np.sin(chi)
        rvec = r * np.array([
            np.sin(theta) * np.cos(phi),
            np.sin(theta) * np.sin(phi),
            np.cos(theta),
        ])
        g_cart = np.eye(3) + np.outer(rvec, rvec) / (1.0 - rvec @ rvec)
        # Jacobian drvec/d(chi, theta, phi), with r = sin chi
        dr_dchi = np.cos(chi) * np.array([
            np.sin(theta) * np.cos(phi),
            np.sin(theta) * np.sin(phi),
            np.cos(theta),
        ])
        dr_dtheta = r * np.array([
            np.cos(theta) * np.cos(phi),
            np.cos(theta) * np.sin(phi),
            -np.sin(theta),
        ])
        dr_dphi = r * np.array([
            -np.sin(theta) * np.sin(phi),
            np.sin(theta) * np.cos(phi),
            0.0,
        ])
        j = np.column_stack([dr_dchi, dr_dtheta, dr_dphi])
        g_sph = j.T @ g_cart @ j
        g_round = np.diag([1.0, np.sin(chi) ** 2, (np.sin(chi) * np.sin(theta)) ** 2])
        if np.max(np.abs(g_sph - g_round)) > 1e-10:
            ok = False
    return ok


def sld_closed_form_check() -> bool:
    ok = True
    rng = np.random.default_rng(20261029)
    for _ in range(200):
        r = rng.normal(size=3)
        r = 0.8 * r / np.linalg.norm(r) * rng.random() ** (1 / 3)
        rho = bloch_state(r)
        dr = rng.normal(size=3)
        x = (dr[0] * SIGMA_X + dr[1] * SIGMA_Y + dr[2] * SIGMA_Z) / 2.0
        v_direct = sld_value(rho, x)
        v_closed = sld_metric_bloch(r, dr)
        if abs(v_direct - v_closed) > 1e-9:
            ok = False
    return ok


def fidelity_metric_check() -> bool:
    """g_fid = g_sld / 4 at random states and directions, for d = 2, 3, 4."""
    ok = True
    rng = np.random.default_rng(20261029)
    worst = 0.0
    for d in (2, 3, 4):
        for _ in range(60):
            a = rng.normal(size=(d, d)) + 1j * rng.normal(size=(d, d))
            rho = a @ a.conj().T
            rho = rho / np.trace(rho)
            if np.linalg.eigvalsh(rho).min() < 0.05:
                continue
            b = rng.normal(size=(d, d)) + 1j * rng.normal(size=(d, d))
            x = (b + b.conj().T) / 2
            x = x - np.trace(x) / d * np.eye(d)
            v_fid = fidelity_value(rho, x)
            v_sld = sld_value(rho, x)
            err = abs(v_fid - v_sld / 4.0) / max(abs(v_sld), 1e-12)
            worst = max(worst, err)
            if err > 1e-3:
                ok = False
    print(f"  worst relative error g_fid vs g_sld/4 (d = 2, 3, 4): {worst:.3e}")
    return ok


def distance_profile_check() -> bool:
    """Geodesic distance from the center of the Bloch ball is arcsin(r).

    Integrates the closed-form radial metric element dr / sqrt(1 - r^2)
    numerically and compares with arcsin(r) at sampled radii.
    """
    ok = True
    for r in [0.1, 0.3, 0.5, 0.8, 0.95]:
        # midpoint-rule integral of 1/sqrt(1 - x^2) from 0 to r
        n = 20000
        h = r / n
        total = 0.0
        for k in range(n):
            x = (k + 0.5) * h
            total += h / np.sqrt(1.0 - x * x)
        if abs(total - np.arcsin(r)) > 1e-6:
            ok = False
    return ok


def main() -> None:
    ok1 = sld_closed_form_check()
    print("PASS" if ok1 else "FAIL",
          ": SLD metric equals closed form in Bloch coordinates (Prop. 5.1)")
    ok2 = round_sphere_check()
    print("PASS" if ok2 else "FAIL",
          ": closed form is round S^3 of radius one after r = sin chi")
    ok3 = fidelity_metric_check()
    print("PASS" if ok3 else "FAIL",
          ": fidelity metric equals one quarter of SLD metric (Prop. 5.2)")
    ok4 = distance_profile_check()
    print("PASS" if ok4 else "FAIL",
          ": geodesic distance from the center equals arcsin(r)")


if __name__ == "__main__":
    main()

 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D experiment for vol-09-gravity-information-geometry.

Claims evidenced (never proved) here:
  1. Proposition "Non-uniqueness on qubit states": the Petz metrics of two
     distinct normalized operator monotone functions are not proportional on
     qubit states (different radial-to-transverse ratios at diag(3/4, 1/4)).
  2. Proposition "Commutative locus": all normalized monotone metrics agree
     with the Fisher metric on diagonal (commuting) tangent vectors.
  3. Qutrit cross-check: the same two metrics differ at a full-rank qutrit
     state and agree on diagonal tangents there.

Computational evidence only. This script is not a proof.
"""

import numpy as np


def f_sld(t: np.ndarray) -> np.ndarray:
    """Normalized operator monotone function giving the SLD metric: (1+t)/2."""
    return (1.0 + t) / 2.0


def f_wy(t: np.ndarray) -> np.ndarray:
    """Normalized operator monotone function giving the Wigner-Yanase metric."""
    return (1.0 + np.sqrt(t)) ** 2 / 4.0


def petz_metric(rho: np.ndarray, x: np.ndarray, f) -> float:
    """Petz formula g^f_rho(X, X) = sum_ij |X_ij|^2 / (lambda_i f(lambda_j/lambda_i))."""
    lam, u = np.linalg.eigh(rho)
    if np.any(lam <= 0):
        raise ValueError("petz_metric needs full-rank rho")
    xd = u.conj().T @ x @ u
    val = 0.0
    for i in range(len(lam)):
        for j in range(len(lam)):
            val += abs(xd[i, j]) ** 2 / (lam[i] * f(lam[j] / lam[i]))
    return float(val)


def fisher_value(lam: np.ndarray, diag_x: np.ndarray) -> float:
    """Classical Fisher value sum_i X_ii^2 / lambda_i for diagonal X."""
    return float(np.sum(diag_x**2 / lam))


def compare_metrics() -> None:
    rho = np.diag([0.75, 0.25])
    x_trans = np.array([[0.0, 0.5], [0.5, 0.0]])
    x_rad = np.diag([0.5, -0.5])

    g_sld_t = petz_metric(rho, x_trans, f_sld)
    g_sld_r = petz_metric(rho, x_rad, f_sld)
    g_wy_t = petz_metric(rho, x_trans, f_wy)
    g_wy_r = petz_metric(rho, x_rad, f_wy)

    print(f"qubit rho=diag(3/4,1/4)")
    print(f"  SLD  transverse={g_sld_t:.6f}  radial={g_sld_r:.6f}  ratio={g_sld_r / g_sld_t:.6f}")
    print(f"  WY   transverse={g_wy_t:.6f}  radial={g_wy_r:.6f}  ratio={g_wy_r / g_wy_t:.6f}")
    ratio_sld = g_sld_r / g_sld_t
    ratio_wy = g_wy_r / g_wy_t
    expect_sld = 4.0 / 3.0
    expect_wy = (2.0 + np.sqrt(3.0)) / 3.0
    ok = (abs(ratio_sld - expect_sld) < 1e-12
          and abs(ratio_wy - expect_wy) < 1e-12
          and abs(ratio_sld - ratio_wy) > 1e-6)
    print(f"  expected ratios: SLD={expect_sld:.6f} WY={expect_wy:.6f}")
    print("PASS" if ok else "FAIL",
          ": metrics not proportional on qubit states (Prop. 4.2)")


def commutative_locus_check() -> None:
    lam = np.array([0.5, 0.3, 0.2])
    rho = np.diag(lam)
    y = np.diag([0.2, -0.1, -0.1])
    v_sld = petz_metric(rho, y, f_sld)
    v_wy = petz_metric(rho, y, f_wy)
    v_fisher = fisher_value(lam, np.diag(y))
    print(f"qutrit diagonal tangent: SLD={v_sld:.6f} WY={v_wy:.6f} Fisher={v_fisher:.6f}")
    ok = (abs(v_sld - v_fisher) < 1e-12 and abs(v_wy - v_fisher) < 1e-12)
    print("PASS" if ok else "FAIL",
          ": all monotone metrics equal Fisher on commuting states (Prop. 4.3)")


def qutrit_check() -> None:
    lam = np.array([0.5, 0.3, 0.2])
    rho = np.diag(lam)
    x = np.zeros((3, 3))
    x[0, 2] = x[2, 0] = 0.5
    v_sld = petz_metric(rho, x, f_sld)
    v_wy = petz_metric(rho, x, f_wy)
    print(f"qutrit off-diagonal tangent: SLD={v_sld:.6f} WY={v_wy:.6f}")
    ok = abs(v_sld - v_wy) > 1e-6
    print("PASS" if ok else "FAIL",
          ": metrics differ on qutrit off-diagonal tangents")


def main() -> None:
    compare_metrics()
    commutative_locus_check()
    qutrit_check()


if __name__ == "__main__":
    main()

exec
/usr/local/bin/zsh -lc "sed -n '200,510p' papers/latex/vol-09-gravity-information-geometry.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
\begin{remark}[Worked monotonicity]
\label{rem:worked-monotone}
Take three outcomes, $p = (0.5, 0.3, 0.2)$, and the stochastic map $\varphi = \left(\begin{smallmatrix} 0.7 & 0.1 & 0.2 \\ 0.3 & 0.9 & 0.8 \end{smallmatrix}\right)$, which sends three outcomes to two and has unit column sums. Then $q = \varphi p = (0.42, 0.58)$, and for the tangent vector $u = (0.1, -0.05, -0.05)$ one computes
\begin{equation}
g_p(u, u) = \frac{0.01}{0.5} + \frac{0.0025}{0.3} + \frac{0.0025}{0.2} = \frac{49}{1200} \approx 0.040833,
\end{equation}
while $\varphi u = (0.055, -0.055)$ and $g_q(\varphi u, \varphi u) = 0.055^2 (1/0.42 + 1/0.58) = 121/9744 \approx 0.012418$. The map costs distinguishability, and the deficit is the slack in the Cauchy-Schwarz step of \cref{prop:monotone}. The computational check in \cref{sec:computation} repeats this comparison for two thousand random trials.
\end{remark}

\begin{theorem}[Chentsov]
\label{thm:chentsov}
On the probability simplices, the Fisher family is the unique family of Riemannian metrics, up to a single positive constant shared across dimensions, that is monotone under stochastic maps.
\end{theorem}

Chentsov proved this theorem in the formulation: smooth metric families invariant under congruent embeddings (Markov morphisms) are unique up to constant; Petz and Sud\'ar \cite{petz-sudar} state the equivalent contraction form used here, monotone under general stochastic maps. The two formulations are connected as follows: a congruent embedding and its stochastic inverse force invariance under invertible stochastic maps (permutations included), and the contraction inequality for general stochastic maps is the monotonicity of \cref{def:stochastic}. Smoothness of the metric tensor is assumed throughout, as in Chentsov's statement. Two scope points are essential. The constant is undetermined and shared: monotonicity pins the metric only up to scale, and the cross-dimensional maps of \cref{def:stochastic} are what force one constant across all $n$. The classical uniqueness has an operational reading. Monotonicity says statistical distinguishability does not increase under processing; uniqueness says there is one ruler for that distinguishability. A classification program for statistical systems can therefore treat the Fisher metric as classifying data without a choice problem. \Cref{sec:quantum} shows that this comfort does not survive quantization.

\begin{remark}[Fisher geometry of the simplex]
\label{rem:bernoulli}
The Fisher metric on the interior of $\Delta_{n-1}$ is, up to scale, the round-sphere metric. Substitute $p_i = y_i^2$ with $y_i > 0$; the constraint $\sum_i p_i = 1$ becomes $\sum_i y_i^2 = 1$, and $\sum_i (dp_i)^2 / p_i = 4 \sum_i (dy_i)^2$, so the metric is four times the round metric of the unit sphere restricted to the positive orthant of $S^{n-1}$. For $n \geq 3$ the sectional curvature is $1/4$ in this normalization, and the geodesic distance between $p$ and $p'$ is $2 \arccos \sum_i \sqrt{p_i p'_i}$. For the Bernoulli model ($n = 2$) the state space is an arc of a circle of radius 2, and in the coordinate $q = \log(p_1/p_2)$ the line element is $(dq)^2 / (4 \cosh^2(q/2))$.
\end{remark}

\section{Quantum monotone metrics}
\label{sec:quantum}

Petz and Sud\'ar \cite{petz-sudar} classified the monotone metrics of \cref{def:quantum-monotone} on finite-dimensional state spaces. The answer is parametric, not unique.

\begin{theorem}[Petz-Sud\'ar]
\label{thm:petz-sudar}
Monotone metric families $\{g^{(d)}\}_{d \geq 2}$ in the sense of \cref{def:quantum-monotone} correspond exactly to functions $f : (0, \infty) \to (0, \infty)$ that are operator monotone of all matrix orders and satisfy $f(t) = t f(1/t)$, by the formula \eqref{eq:petz} in each dimension \cite{petz-1996, petz-sudar-jmp}. The correspondence is a bijection after the normalization $f(1) = 1$, which is equivalent to restricting to the Fisher value on diagonal tangent vectors; without the normalization, metrics correspond to $f$ only up to a positive constant. In particular the symmetric logarithmic derivative metric of \cref{def:sld} corresponds to $f(t) = (1+t)/2$, and there are infinitely many monotone metrics.
\end{theorem}

The correspondence in this normalization is the one computed below: for $f(t) = (1+t)/2$ the formula \eqref{eq:petz} gives $g_{\rho}^{f}(X,X) = \sum_{i,j} 2 |X_{ij}|^2 / (\lambda_i + \lambda_j)$, which is exactly $\operatorname{Tr}(X L)$ with $X = (\rho L + L\rho)/2$, since in the eigenbasis the defining equation reads $X_{ij} = L_{ij} (\lambda_i + \lambda_j)/2$. The word ``correspond'' in the theorem is exact in both directions: every operator monotone $f$ with $f(t) = t f(1/t)$ produces a monotone metric, and every monotone metric arises this way. The classification is complete as a parameterization, and the parameter is a function rather than a finite list.

\begin{proposition}[Non-uniqueness on qubit states]
\label{prop:nonunique}
Let $\rho = \operatorname{diag}(3/4, 1/4)$ and let $X = \sigma_x / 2$, $Y = \sigma_z / 2$ be the transverse and radial tangent vectors at $\rho$ in Bloch coordinates. For the symmetric logarithmic derivative metric,
\begin{equation}
g^{\mathrm{sld}}_{\rho}(X, X) = 1, \qquad g^{\mathrm{sld}}_{\rho}(Y, Y) = \frac{4}{3}.
\end{equation}
For the Wigner-Yanase metric, given by \eqref{eq:petz} with $f_{\mathrm{wy}}(t) = \tfrac{1}{4}(1 + \sqrt{t})^2$,
\begin{equation}
g^{\mathrm{wy}}_{\rho}(X, X) = 4(2 - \sqrt{3}), \qquad g^{\mathrm{wy}}_{\rho}(Y, Y) = \frac{4}{3}.
\end{equation}
The radial-to-transverse ratio is $4/3$ for the symmetric logarithmic derivative metric and $(2 + \sqrt{3})/3 \neq 4/3$ for the Wigner-Yanase metric, so the two metrics are not proportional. Quantum monotone metrics are not unique, even up to a constant.
\end{proposition}

\begin{proof}
For $X = \sigma_x / 2$ the matrix entries are $X_{12} = X_{21} = 1/2$ and $X_{11} = X_{22} = 0$. The symmetric logarithmic derivative equation $X = (\rho L + L \rho)/2$ for off-diagonal entries reads $X_{ij} = L_{ij}(\lambda_i + \lambda_j)/2$, so $L_{12} = L_{21} = 1/2 \cdot 2 / 1 = 1$ and $L = \sigma_x$. Then $g^{\mathrm{sld}}(X, X) = \operatorname{Tr}(X L) = \operatorname{Tr}(\sigma_x^2 / 2) = 1$. For $Y = \sigma_z / 2$ the derivative is diagonal and $L = \operatorname{diag}\bigl((1/2)/(3/4), (-1/2)/(1/4)\bigr) = \operatorname{diag}(2/3, -2)$, so $g^{\mathrm{sld}}(Y, Y) = \operatorname{Tr}(Y L) = (1/2)(2/3) + (-1/2)(-2) = 4/3$.

For the Wigner-Yanase metric the coefficient of $|X_{ij}|^2$ in \eqref{eq:petz} is $1/(\lambda_i f_{\mathrm{wy}}(\lambda_j/\lambda_i)) = 4/(\sqrt{\lambda_i} + \sqrt{\lambda_j})^2$. With $\lambda_1 = 3/4$, $\lambda_2 = 1/4$ the transverse value is $2 \cdot (1/4) \cdot 4 / (\sqrt{3}/2 + 1/2)^2 = 4 / (2 + \sqrt{3}) = 4(2 - \sqrt{3})$, where $(\sqrt{3}+1)^2 = 4 + 2\sqrt{3}$ and $4 - 3 = 1$ were used. For diagonal $Y$ the two diagonal terms give $4(1/2)^2 / (2\sqrt{3}/2)^2 + 4(-1/2)^2 / (2 \cdot 1/2)^2 = 1/3 + 1 = 4/3$. The ratio $(4/3)/(4(2-\sqrt{3})) = (2+\sqrt{3})/3$ is not $4/3$, since $2 + \sqrt{3} \neq 4$.
\end{proof}

The failure of uniqueness is structural, not an artifact of the qubit. The Petz family is infinite in every dimension $d \geq 2$, and the ambiguity appears already in the two-level system. Any physical statement of the form ``the geometry of the quantum state space is $G$'' must therefore name $f$, or must derive $f$ from independent principles. This constraint carries into every proposed gravity-information dictionary in \cref{sec:correspondence}.

\begin{remark}[The parameter as data]
\label{rem:parameter}
The classifying datum of a monotone metric is the function $f$, subject to $f(t) = t f(1/t)$; the condition is the symmetry of the Petz formula under $i \leftrightarrow j$, and the normalization $f(1) = 1$ fixes the scale that Chentsov's theorem leaves free. Three members of the family recur in this paper: $f(t) = (1+t)/2$ (symmetric logarithmic derivative), $f_{\mathrm{wy}}(t) = \tfrac{1}{4}(1+\sqrt{t})^2$ (Wigner-Yanase), and $f_{\mathrm{bkm}}(t) = (t-1)/\log t$ (Bogoliubov-Kubo-Mori). Distinct $f$ give distinct metrics, so the parameter is invariant content of a quantum state system, in the same sense that the dimension vector is invariant content of a finite-dimensional $C^*$-algebra. Partial selection principles exist: the expansion of \cref{lem:kl} selects $f_{\mathrm{bkm}}$, and quantum estimation selects $f(t) = (1+t)/2$ \cite{braunstein-caves}. In holography the second-order relative entropy of boundary perturbations equals the bulk canonical energy \cite{lashkari-vr}, which by \cref{lem:kl} selects the Bogoliubov-Kubo-Mori member for that quantity; distinct holographic questions can invoke distinct members. No principle selects a member for a general gravity-information dictionary.
\end{remark}

Uniqueness has one sharp surviving locus.

\begin{proposition}[Commutative locus]
\label{prop:commutative}
For every normalized operator monotone $f$ and every full-rank diagonal $\rho = \sum_i \lambda_i |i\rangle\langle i|$, the restriction of $g^{f}$ to diagonal tangent vectors is the Fisher value:
\begin{equation}
g^{f}_{\rho}(X, X) = \sum_i \frac{X_{ii}^2}{\lambda_i}.
\end{equation}
More generally the restriction of any monotone metric to commuting states is a classical monotone metric, hence $c \cdot g^{\mathrm{fisher}}$ for some $c > 0$ by Chentsov's theorem (\cref{thm:chentsov}); in the Petz family $c = 1/f(1)$, so the normalization $f(1) = 1$ forces $c = 1$. Every normalized monotone metric restricts to the Fisher metric on the commutative locus.
\end{proposition}

\begin{proof}
For diagonal $X$ only the terms $i = j$ survive in \eqref{eq:petz}, and $f(1) = 1$ gives $g^f(X,X) = \sum_i X_{ii}^2 / (\lambda_i f(1)) = \sum_i X_{ii}^2 / \lambda_i$, for every dimension $d$. For the general statement, let $\varphi$ be a stochastic map of diagonal distributions. The pinching channel $\Phi(A) = \sum_{i,j} \varphi_{ji} \langle i | A | i \rangle |j\rangle\langle j|$, with Kraus operators $K_{ji} = \sqrt{\varphi_{ji}} |j\rangle\langle i|$, is completely positive and trace-preserving, maps diagonal states to diagonal states, and restricts to $p \mapsto \varphi p$. Monotonicity of the quantum metric under $\Phi$ restricts to monotonicity of the induced classical metric, so Chentsov's theorem applies and the restriction is $c \cdot g^{\mathrm{fisher}}$. The direct computation above fixes $c = 1/f(1)$ for the Petz family.
\end{proof}

\begin{remark}[Commutative values]
\label{rem:commutative}
For $\rho = \operatorname{diag}(3/4, 1/4)$ and $Y = \sigma_z/2$ the value $g(Y, Y) = 4/3$ of \cref{prop:nonunique} is the Fisher value $\sum_i X_{ii}^2 / \lambda_i = (1/2)^2/(3/4) + (-1/2)^2/(1/4) = 4/3$, for both normalized metrics. The two computations agree on the diagonal, as \cref{prop:commutative} requires, and disagree off it.
\end{remark}

\begin{remark}[Qutrit values]
\label{rem:qutrit}
At the qutrit state $\rho = \operatorname{diag}(0.5, 0.3, 0.2)$ with the off-diagonal tangent $X_{13} = X_{31} = 1/2$, the Petz formula gives $g^{\mathrm{sld}}(X, X) = 10/7 \approx 1.4286$ and $g^{\mathrm{wy}}(X, X) \approx 1.5010$, while the fidelity metric gives $\approx 0.3571$ by the identity of \cref{def:fidelity}. On the diagonal tangent $Y = \operatorname{diag}(0.2, -0.1, -0.1)$ both normalized metrics give the Fisher value $0.04/0.5 + 0.01/0.3 + 0.01/0.2 = 49/300 \approx 0.163333$, while the fidelity metric gives $\approx 0.040833$. The pattern of \cref{prop:nonunique,prop:commutative} holds one dimension up, and the computations of \cref{sec:computation} verify both statements numerically.
\end{remark}

\section{Geometry of the qubit state space}
\label{sec:qubit}

The qubit state space is the smallest quantum system and the smallest place where the Petz family is nontrivial. Its geometry is computable in closed form, and it exhibits the two themes of the paper: a quantum state space carries a canonical constant-curvature geometry once $f$ is chosen, and the choice of $f$ matters off the commutative locus. The computations of this section are expository; the geometry of state spaces and the fidelity constructions are documented in the information-geometric literature \cite{hubner, braunstein-caves, petz-1996}, and the proofs are given in full because the paper uses the statements as premises.

Write $\rho = (I + \vec{r} \cdot \vec{\sigma})/2$ with $|\vec{r}| < 1$, so $\mathcal{D}_2^{\circ}$ is the open unit ball of $\mathbb{R}^3$ and the eigenvalues are $\lambda_{\pm} = (1 \pm |\vec{r}|)/2$.

\begin{proposition}[Symmetric logarithmic derivative geometry of the qubit]
\label{prop:qubit-sld}
In Bloch coordinates the symmetric logarithmic derivative metric is
\begin{equation}
\label{eq:qubit-sld}
g^{\mathrm{sld}} = |d\vec{r}|^2 + \frac{(\vec{r} \cdot d\vec{r})^2}{1 - |\vec{r}|^2}.
\end{equation}
In spherical coordinates $|\vec{r}| = r = \sin\chi$ this becomes $g^{\mathrm{sld}} = (d\chi)^2 + \sin^2\!\chi \, (d\Omega)^2$ with $\chi \in (0, \pi/2)$: the open state space $\mathcal{D}_2^{\circ}$ is isometric to an open hemisphere of the round three-sphere of radius one, of constant sectional curvature one.
\end{proposition}

\begin{proof}
By rotational invariance of $g^{\mathrm{sld}}$ it suffices to evaluate radial and transverse directions at $\vec{r} = (0, 0, r)$. A tangent vector $X = (d\vec{r} \cdot \vec{\sigma})/2$ has entries $X_{11} = dr_3/2$, $X_{22} = -dr_3/2$, $X_{12} = (dr_1 - i\, dr_2)/2$, $X_{21} = (dr_1 + i\, dr_2)/2$ in the orthonormal eigenbasis of $\rho$. From \cref{thm:petz-sudar} the diagonal entries of $g^{\mathrm{sld}}$ contribute $X_{11}^2 / \lambda_+ + X_{22}^2 / \lambda_-$ and the off-diagonal entries contribute $2 \cdot 2 |X_{12}|^2 / (\lambda_+ + \lambda_-)$. With $\lambda_{\pm} = (1 \pm r)/2$ one gets $1/\lambda_+ + 1/\lambda_- = 4/(1 - r^2)$ and $\lambda_+ + \lambda_- = 1$, so
\begin{equation}
g^{\mathrm{sld}} = (dr_1^2 + dr_2^2) + \frac{dr_3^2}{1 - r^2} = |d\vec{r}|^2 + \frac{(\vec{r} \cdot d\vec{r})^2}{1 - |\vec{r}|^2}.
\end{equation}
Setting $r = \sin\chi$ turns $(dr)^2/(1 - r^2) + r^2 (d\Omega)^2$ into $(d\chi)^2 + \sin^2\!\chi \, (d\Omega)^2$, the round metric of radius one, on the chart $\chi \in (0, \pi/2)$; the spherical chart is singular at the center, which is covered by the smooth embedding $\vec{r} \mapsto (\vec{r}, \sqrt{1 - |\vec{r}|^2}) \in S^3 \subset \mathbb{R}^4$. The distance from the center to the pure-state boundary is $\pi/2$.
\end{proof}

The fidelity metric of \cref{def:fidelity} is one quarter of this metric on the qubit.

\begin{proposition}[Fidelity metric of the qubit]
\label{prop:qubit-fid}
On $\mathcal{D}_2^{\circ}$ the fidelity metric satisfies $g^{\mathrm{fid}} = \tfrac{1}{4} g^{\mathrm{sld}}$. Consequently the open state space with the fidelity metric is an open hemisphere of the round three-sphere of radius one half, of constant sectional curvature four.
\end{proposition}

\begin{proof}
Both metrics are invariant under the rotations of the Bloch ball induced by unitary conjugation, so at each $\vec{r}$ the rotation group fixing $\vec{r}$ forces the cross term between radial and transverse directions to vanish and fixes transverse isotropy, and the quadratic form is determined by its radial and transverse values. For the transverse direction, set $\sigma = \rho + \varepsilon X$ with $X = \sigma_x/2$ and $\rho = \operatorname{diag}(\lambda_+, \lambda_-)$. Then $\sqrt{\rho}\, \sigma \sqrt{\rho} = \left(\begin{smallmatrix} \lambda_+^2 & \tfrac{\varepsilon}{2}\sqrt{\lambda_+ \lambda_-} \\ \tfrac{\varepsilon}{2}\sqrt{\lambda_+ \lambda_-} & \lambda_-^2 \end{smallmatrix}\right)$, whose determinant is $\lambda_+ \lambda_- (\lambda_+ \lambda_- - \varepsilon^2/4)$. Since $(\operatorname{Tr}\sqrt{M})^2 = \operatorname{Tr} M + 2\sqrt{\det M}$, one gets $\operatorname{Tr}\sqrt{\sqrt{\rho}\,\sigma\sqrt{\rho}} = 1 - \varepsilon^2/8 + O(\|\varepsilon X\|^3)$ and $d_B^2 = 2(1 - \sqrt{F}) = \varepsilon^2/4 + O(\|\varepsilon X\|^3)$, matching $\tfrac{1}{4} g^{\mathrm{sld}}(X, X) = 1/4$ from \cref{prop:qubit-sld} at every $r$. For the radial direction the states commute and the fidelity reduces to the classical affinity $\sum_i \sqrt{p_i q_i}$ on the Bernoulli pair $p = ((1+r)/2, (1-r)/2)$; the expansion $\sum_i \sqrt{p_i (p_i + \delta_i)} = 1 - \sum_i \delta_i^2 / (8 p_i) + O(\|\delta\|^3)$ for $\sum_i \delta_i = 0$ gives $d_B^2 = \sum_i \delta_i^2 / (4 p_i)$, one quarter of the classical Fisher value, and the classical Fisher value is $g^{\mathrm{sld}}$ on the diagonal by \cref{prop:commutative}. The curvature claim follows from \cref{prop:qubit-sld} and the constant factor $1/4$, which multiplies sectional curvatures by $4$.
\end{proof}

\begin{remark}[Normalization conventions]
\label{rem:conventions}
The factor between the fidelity metric and the symmetric logarithmic derivative metric depends on the normalization of the fidelity, and conventions differ across sources. In the convention of \cref{def:fidelity}, where $d_B^2 = 2(1-\sqrt{F})$, the fidelity metric of the qubit is one quarter of the symmetric logarithmic derivative metric, and the corresponding sphere has radius $1/2$ rather than $1$. The intrinsic statements of \cref{prop:qubit-sld,prop:qubit-fid} are convention-free up to this constant: both geometries are round three-spheres up to the open-hemisphere restriction, and the constant relates their radii. Any comparison of curvature values across sources must first fix the normalization.
\end{remark}

\begin{remark}[Constant curvature without spacetime]
\label{rem:sphere}
\Cref{prop:qubit-sld,prop:qubit-fid} are statements about information geometry. The round three-sphere appearing here is the geometry of statistical distinguishability on a two-level quantum system; it is not a spacetime and no claim about spacetime dimension or signature follows. The example exists to separate the two readings of ``geometric correspondence'': state spaces carry Riemannian geometry by construction, and whether that geometry is physical is a further question.
\end{remark}

\begin{remark}[Geodesic distance on the qubit]
\label{rem:distance}
In the coordinates of \cref{prop:qubit-sld} the geodesic distance from the maximally mixed state $\vec{r} = 0$ to the state $\vec{r} = r \vec{n}$ is $\chi = \arcsin r$, since $g^{\mathrm{sld}} = (d\chi)^2 + \sin^2\!\chi \, (d\Omega)^2$ and radial geodesics of the round sphere have length equal to the angle. Pure states sit at distance $\pi/2$ from the center, and the diameter of the interior is $\pi$: the space of qubit states is a hemisphere of finite diameter carried by statistical distinguishability, not by any spacetime interpretation. The computational check in \cref{sec:computation} compares this distance profile against the closed form.
\end{remark}

\section{Information geometry as invariant data}
\label{sec:invariants}

The classification program identifies objects by invariants, in the spirit of the companion data that practitioners use to tell objects apart in a completed classification. For statistical systems the candidate invariants are the sample-space size, the isometry class of the Fisher geometry, and the curvature data of statistical submodels.

\begin{corollary}[Fisher geometry of the full simplex]
\label{cor:homogeneity}
The Fisher metric on the interior of $\Delta_{n-1}$ is locally isometric to the round sphere of radius two, with sectional curvature $1/4$ for $n \geq 3$, and the arc of \cref{rem:bernoulli} for $n = 2$. The isometry group of the full model is the finite group of coordinate permutations. Two statistical models defined on the full simplex with the same number of outcomes are isometric as Riemannian manifolds, and a permutation of outcomes is an isometry.
\end{corollary}

\begin{proof}
The substitution $p_i = y_i^2$ of \cref{rem:bernoulli} is an isometry onto the positive orthant of the round sphere of radius two. A global isometry of the connected constant-curvature orthant extends uniquely to an ambient isometry of its metric completion $S^{n-1}(2)$, and such an isometry permutes the $n$ extreme rays of the orthant; the orthogonal maps permuting those rays are exactly the permutation matrices. Permutations preserve $\sum_i p_i = 1$ and the metric $\sum_i (dp_i)^2 / p_i$ directly, so the isometry group is the permutation group.
\end{proof}

\Cref{cor:homogeneity} is a classification statement of the trivial kind: the full models of a fixed sample size form one isometry class, and the only invariant is $n$. The classification content of information geometry therefore lives in statistical submodels.

\begin{definition}[Statistical submodel]
\label{def:submodel}
A statistical submodel is a smooth embedding $i : M' \to \Delta_{n-1}^{\circ}$ of a lower-dimensional manifold $M'$ into the simplex, with the pullback metric $g' = i^{*} g^{\mathrm{fisher}}$. The intrinsic and extrinsic curvature invariants of $(M', g')$ are invariants of the model. Exponential families are the canonical submodels.
\end{definition}

\begin{remark}[Embedded two-outcome model]
\label{rem:embedded}
Inside the three-outcome simplex consider $p(\theta) = (\theta, (1-\theta)/2, (1-\theta)/2)$ for $\theta \in (0, 1)$. The tangent vector is $p'(\theta) = (1, -1/2, -1/2)$, and the induced metric is
\begin{equation}
g' = \Bigl( \frac{1}{\theta} + \frac{1/4}{(1-\theta)/2} + \frac{1/4}{(1-\theta)/2} \Bigr) d\theta^2
= \frac{(d\theta)^2}{\theta(1-\theta)},
\end{equation}
exactly the Fisher metric of the standalone two-outcome model of \cref{rem:bernoulli}. The embedding is isometric onto its image, so intrinsic geometry cannot detect the sample-space size: two models with different numbers of outcomes can share a submodel geometry. The induced metric is unchanged here because the embedding is a sufficient-statistic Markov map. Among linear stochastic maps, pullback preserves the Fisher metric exactly when the map is a sufficient-statistic embedding, and general smooth embeddings can reproduce the same intrinsic metric without being Markov maps, so intrinsic geometry alone does not detect the embedding. Extrinsic data of the embedding is additional invariant content.
\end{remark}

\begin{remark}[Classifying data for statistical models]
\label{rem:family-v}
For statistical models (probability and measure structures), the Fisher metric is the natural classifying invariant in the classical case. \Cref{cor:homogeneity} and \cref{def:submodel} make that naming precise: the invariant is the metric up to isometry, trivial on full models and rich on submodels. This is the opposite of the symplectic situation, where local classification is trivial by Darboux's theorem and all content is global. Information geometry has local content and uses it. On the quantum side the invariant data must additionally name the member $f$ of the Petz family (\cref{prop:nonunique}), so the classifying data of a quantum state system is the pair (state space, $f$) and never the state space alone.
\end{remark}

\begin{remark}[Classification status of statistical models]
\label{rem:status}
The evidence of this paper supports the following summary. Classical statistical models of fixed sample size are classified by \cref{cor:homogeneity} up to isometry of their full Fisher geometry, and statistical submodels carry curvature invariants without a complete classification being on record. Quantum state systems are classified as metric spaces only after the parameter $f$ is fixed, and no physical principle in this paper fixes it. Statistical models are therefore a worked example of a general pattern in classification: a complete island (Chentsov, Petz-Sud\'ar), a trivial stratum (full simplices), and open content (submodels, quantum parameter selection).
\end{remark}

\section{Reconstruction from probes}
\label{sec:reconstruction}

The second proved pattern available to a gravity-information program is reconstruction: an object recovered from data about its relationships. Three classical results fix the pattern, and one quantum-information result applies it to entanglement.

\begin{theorem}[Gelfand-Naimark and Gelfand duality]
\label{thm:gelfand}
Every commutative unital $C^*$-algebra is isometrically $*$-isomorphic to $C(X)$ for a compact Hausdorff space $X$, its Gelfand spectrum; contravariantly, the categories of commutative unital $C^*$-algebras and of compact Hausdorff spaces are dual \cite{gn}. In particular the space $X$ is recovered from the algebra of observables $\mathcal{O} = C(X)$ alone.
\end{theorem}

\begin{theorem}[Stone duality]
\label{thm:stone}
Boolean algebras are dual to compact totally disconnected Hausdorff spaces \cite{stone}; the space is recovered from the algebra of clopen sets.
\end{theorem}

These theorems are classification-grade only in the commutative setting: there $X$ is determined by $\mathcal{O}$ up to homeomorphism. The noncommutative Gelfand-Naimark theorem embeds an arbitrary $C^*$-algebra into the operators of some Hilbert space, which is a representation theorem, not a classification. Reconstruction of a state space from probe data is weaker than classification of all state spaces, and this distinction is the one the classification program must preserve.

\begin{definition}[Probe data and reconstruction]
\label{def:probe}
Probe data of an object $P$ is a family of measurements or relationships $\{\phi_i(P)\}$ indexed by probes $\phi_i$; a reconstruction theorem assigns to the probe data an object $\hat{P}$ together with an isomorphism $\hat{P} \cong P$ in a stated category. The theorem is classification-grade only when the probes are a complete invariant, that is, when $\hat{P} \cong \hat{Q}$ implies $P \cong Q$ in the stated category for all objects in scope.
\end{definition}

\begin{remark}[Reconstruction pattern]
\label{rem:pattern}
\Cref{thm:gelfand,thm:stone,thm:dhw} are instances of \cref{def:probe}: Gelfand spectrum from characters, Stone space from clopen sets, bulk operators from boundary subregion algebras. In each case the probes are exact within scope, and in each case the theorem recovers structure rather than producing it. No instance recovers dynamics, and none is a classification theorem for the ambient category.
\end{remark}

\begin{theorem}[Entanglement-wedge reconstruction, Dong-Harlow-Wall]
\label{thm:dhw}
Let a boundary region $A$ and a code subspace of states be given in the holographic setting, with bulk geometry dual to a state in that subspace. Every bulk operator localized in the entanglement wedge $W(A)$ can be reconstructed as an operator of the boundary subregion $A$ acting on the code subspace; the reconstruction preserves expectation values on that subspace \cite{dhw}. The result is a theorem of quantum information theory (quantum error correction and relative entropy), proved under the stated hypotheses of the holographic code setup.
\end{theorem}

The theorem assumes its hypotheses strictly: a code subspace and an entanglement-wedge structure are given, and no bulk geometry, field equation, or code subspace is derived from boundary data. It proves exact operator recovery inside a specified wedge, which is a reconstruction theorem in the sense of \cref{def:probe} (structure recovered from probe data, here boundary subregion algebras). The mechanism is quantum error correction: the same bulk operator is represented on several boundary subregions and the representations agree on the code subspace, the algebraic content of complementary recovery. The recovery is exact within the assumed setting.

\begin{remark}[Yoneda qualification]
\label{rem:yoneda}
Relational determination of objects is the categorical form of the reconstruction pattern: the functor of points $\operatorname{Hom}(-, P)$ determines $P$ up to isomorphism in a locally small category. A standing qualification governs all such arguments here: ``Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.'' Nothing in \cref{thm:gelfand,thm:stone,thm:dhw} lifts object recovery to physical equivalence or to a classification of physical systems.
\end{remark}

A parallel line of work establishes representability of categorical supermaps whenever a theory has suitable channel-state duality \cite{hefford-wilson, whh}. Whether that line unifies with the Gelfand-Stone-Naimark pattern into one principle is open, and nothing here depends on such a unification.

\section{Entanglement and emergent geometry}
\label{sec:entanglement}

The proposals connecting entanglement to geometry come in three strengths, and keeping them apart is the substance of this section.

\begin{remark}[Ryu-Takayanagi proposal]
\label{rem:rt}
For a boundary region $A$ in a state dual to a bulk, the entanglement entropy $S(A)$ is proposed \cite{rt} to equal the area of the extremal surface homologous to $A$, in natural units $\hbar = c = 1$ reading $S(A) = \operatorname{Area}(\gamma_A)/(4G_N)$, with quantum corrections given by the generalized entropy. The formula is proposed in \cite{rt}, where it is checked exactly in AdS$_3$ with a two-dimensional conformal field theory, and derived for spherical vacuum regions in any dimension by replica and modular methods \cite{chc}. The static formula follows from gravitational replica methods \cite{lm}; the covariant formula with extremal surfaces was proposed in \cite{hrt} and derived in \cite{dlr}; quantum extremal surfaces extend the prescription beyond the classical regime \cite{ew}. For general regions and excited states the formula remains a proposal, and no derivation independent of AdS/CFT is on record.
\end{remark}

\begin{remark}[Entanglement and connectivity]
\label{rem:vr}
Van Raamsdonk's argument \cite{vr} observes that disentangling two boundary degrees of freedom in a holographic state pinches the bulk geometry apart, and proposes that spacetime connectivity is built from entanglement. The reasoning is an argument from controlled examples and limiting cases; it is not a derivation of the metric from entanglement data.
\end{remark}

\begin{remark}[Tensor-network models]
\label{rem:happy}
The holographic error-correcting codes of Pastawski, Yoshida, Harlow, and Preskill \cite{happy} realize a discrete analogue of the Ryu-Takayanagi formula and of negative tripartite information inside exactly solvable tensor networks. These are toy models: they demonstrate that the information-theoretic mechanisms are internally consistent, and they carry no evidential weight about actual AdS/CFT.
\end{remark}

The entropy quantities in these remarks are the standard ones. For a boundary state $\rho$ on a union of pairwise disjoint regions and a subregion $A$, the reduced state is $\rho_A = \operatorname{Tr}_{\bar{A}} \rho$ and the entanglement entropy is $S(A) = -\operatorname{Tr}(\rho_A \log \rho_A)$; the mutual information is $I(A:B) = S(A) + S(B) - S(A \cup B)$; the tripartite information is $I(A:B:C) = I(A:B) + I(A:C) - I(A:BC)$, which expands to $S(A) + S(B) + S(C) - S(A \cup B) - S(A \cup C) - S(B \cup C) + S(A \cup B \cup C)$ and is invariant under all permutations of $A$, $B$, $C$. Strong subadditivity reads $S(A \cup B) + S(B \cup C) \geq S(B) + S(A \cup B \cup C)$, and the monogamy of mutual information reads $I(A:B:C) \leq 0$. In the holographic setting the entropies are the areas of minimal surfaces, and the question of which linear inequalities those areas satisfy is the question of the entropy cone.

\begin{theorem}[Holographic entropy cone]
\label{thm:cone}
In static holographic settings with $N$ boundary subregions of a state purified by a complement \cite{bao}, the complete linear entropy inequalities for $N = 2, 3, 4$ are generated by subadditivity, the Araki-Lieb inequalities, and monogamy of mutual information. For $N = 5$ five further symmetry orbits of five-party inequalities, including the cyclic five-party inequality, are required, and the resulting description is complete \cite{hc5}. For six and more regions the complete inequality set is unknown. For each fixed $N$ there are only finitely many independent inequalities.
\end{theorem}

\Cref{thm:cone} is a classification result of the kind the program seeks: finite, complete lists of constraints, proved, with sharp scope boundaries. Completeness holds for at most five regions and is open beyond.

\begin{remark}[Worked cone constraints]
\label{rem:cone-worked}
Consider four regions with entropies $S(A) = S(B) = S(C) = S(D) = 2.0$, every two-region union $3.5$, every three-region union $4.5$, and $S(A \cup B \cup C \cup D) = 5.0$, in arbitrary units. The four-region state is mixed and is purified by an environment region of entropy $5.0$, so the Araki-Lieb inequality $|S(A \cup B \cup C) - S(D)| \leq S(A \cup B \cup C \cup D)$ reads $2.5 \leq 5.0$ and holds. Strong subadditivity in the form $S(A \cup B) + S(B \cup C) \geq S(B) + S(A \cup B \cup C)$ reads $3.5 + 3.5 \geq 2.0 + 4.5$, which holds. The monogamy of mutual information in the form $I(A:B) + I(A:C) \leq I(A:BC)$ reads $(2.0 + 2.0 - 3.5) + (2.0 + 2.0 - 3.5) \leq 2.0 + 3.5 - 4.5$, that is $0.5 + 0.5 \leq 1.0$, which holds at equality. The cone of \cref{thm:cone} is exactly the set of entropy vectors satisfying all such inequalities simultaneously; the example illustrates the constraints and proves nothing.
\end{remark}

What the section establishes is a gradient. Entanglement-wedge reconstruction (\cref{thm:dhw}) and the entropy cone (\cref{thm:cone}) are theorems. The entropy formula itself (\cref{rem:rt}) is a proposal with derived special cases. The emergence of geometry from entanglement (\cref{rem:vr}) is an argument. Toy models (\cref{rem:happy}) demonstrate mechanisms, not nature.

\section{Thermodynamic geometry}
\label{sec:thermo}

The oldest working dictionary between information metrics and physical curvature is thermodynamic. Weinhold proposed the Hessian of internal energy as a metric on equilibrium states \cite{weinhold}; Ruppeiner proposed the negative Hessian of entropy and read its curvature as a measure of microscopic interaction \cite{ruppeiner}. The Ruppeiner metric of \cref{def:ruppeiner} is, up to sign convention and a conformal factor, the Fisher metric of thermodynamic fluctuation theory, so the dictionary is an instance of information geometry in physical coordinates. The proposal that Einstein's equations are an equation of state of this thermodynamic structure \cite{jacobson} is the sharpest form of the gravity-thermodynamics link on record, and it is a derivation conditional on the horizon thermodynamics it assumes.

\begin{proposition}[Ideal gas]
\label{prop:ideal-gas}
For the ideal gas with entropy $S(U, V, N) = Nk \bigl(c_v \log U + \log V - (c_v + 1) \log N + \text{const}\bigr)$ at fixed $N$ and heat capacity coefficient $c_v$, the Ruppeiner metric in the coordinates $(U, V)$ is
\begin{equation}
g^{\mathrm{rup}} = Nk \left( c_v \frac{(dU)^2}{U^2} + \frac{(dV)^2}{V^2} \right),
\end{equation}
which is flat: its scalar curvature vanishes identically.
\end{proposition}

\begin{proof}
The mixed second derivatives of $S$ vanish, $-\partial^2 S / \partial U^2 = Nk c_v/U^2$, and $-\partial^2 S / \partial V^2 = Nk/V^2$. In the coordinates $y = \sqrt{c_v} \log U$ and $z = \log V$ the metric becomes $Nk ((dy)^2 + (dz)^2)$, the Euclidean metric, so the Riemann tensor vanishes and $R = 0$.
\end{proof}

\Cref{prop:ideal-gas} is the flat baseline of the dictionary: the ideal gas has no microscopic interactions to diagnose, its entropy is separable in the coordinates $(U, V)$ at fixed $N$, and its Ruppeiner geometry is Euclidean in logarithmic coordinates. Interacting models have nonzero Ruppeiner curvature.

Interacting thermodynamic models have nonzero Ruppeiner scalar curvature that grows sharply near the critical region. For the van der Waals entropy $S(u, v) = \log\bigl((v - b)(u + a/v)^{c_v}\bigr)$ per particle in reduced units $a = b = N = k = 1$ and $c_v = 3/2$ (whose noninteracting limit is the ideal gas of \cref{prop:ideal-gas}), direct computation of the Hessian and the Christoffel symbols gives the closed form
\begin{equation}
\label{eq:vdw-curvature}
R(u, v) = \frac{2uv^5 - 4uv^4 + 2uv^3 - v^4 + 8v^3 - 16v^2 + 12v - 3}{u^2 v^6 - 4uv^5 + 12uv^4 - 6uv^3 + 4v^4 - 24v^3 + 48v^2 - 36v + 9},
\end{equation}
in the convention of \cref{def:ruppeiner} (in Ruppeiner's convention the sign is opposite). The numerator and denominator share no common factor in $(u, v)$, and $R$ vanishes only where the numerator does. Evaluations along the supercritical isochore $v = 3$ give $R \approx 0.417$ at $u = 1$, $R \approx 9.55$ at $u = 0.211$, and $R \approx 179.4$ at $u = 0.131$, a growth of more than two orders of magnitude as the internal energy approaches the critical value $u_c = 1/9 \approx 0.111$, where the denominator also vanishes. The pattern is consistent with Ruppeiner's proposal that flatness marks noninteracting constituents and curvature marks interactions: it holds in the two models computed here, and beyond them it remains a proposed correspondence supported by examples.

\begin{remark}[Two directions of the dictionary]
\label{rem:dictionary}
Thermodynamic geometry instantiates both directions of the correspondence examined in this paper. Information determines geometry: the entropy function, an information-theoretic object, determines the metric by a Hessian. Geometry diagnoses physics: the curvature of that metric is read as an interaction diagnostic. What thermodynamic geometry does not provide is gravity: the metric here is on the space of equilibrium states, not on a spacetime, and no Einstein equation relating it to matter is derived in this paper.
\end{remark}

\section{The proposed gravity-information correspondence}
\label{sec:correspondence}

The Gravity-Information-Geometry research program proposes that curvature and gravitational dynamics arise from informational relationships. This section states the correspondence as precisely as the current evidence allows and separates what is proved from what is proposed.

\begin{remark}[Proposed correspondence]
\label{rem:correspondence}
The proposed dictionary has three entries. First, entropy of boundary subregions determines bulk geometry, as in the Ryu-Takayanagi formula and its quantum corrections (\cref{rem:rt}). Second, information-geometric metrics on state spaces are candidate sources of physical geometry, as in thermodynamic geometry (\cref{sec:thermo}). Third, gravitational dynamics is proposed to arise from the entanglement structure of microscopic degrees of freedom (\cref{rem:vr}). Entries one and two are precise formulas; entry three is a programmatic direction. None of the three is established as a derivation of Einstein's equations from information-theoretic axioms. Conditional derivations exist and each assumes geometric input: the Einstein equation of state from local horizon thermodynamics \cite{jacobson}, linearized dynamics around AdS from the entropy formula and the entanglement first law \cite{fgkmv, lmvr}, and the full equation from an entanglement-equilibrium condition \cite{jac2016}.
\end{remark}

Three constraints follow from the analysis.

\begin{description}
\item[Metric ambiguity] By \cref{prop:nonunique} quantum state spaces carry no canonical monotone metric. A dictionary that assigns geometry to quantum states must select a member $f$ of the Petz family or derive the selection from independent principles. The classical uniqueness of Chentsov (\cref{thm:chentsov}) cannot be invoked past the commutative locus (\cref{prop:commutative}).
\item[Reconstruction scope] \Cref{thm:gelfand,thm:dhw} recover structure from probes. Recovery is not dynamics: no reconstruction theorem on record recovers interacting gravitational dynamics from entanglement data.
\item[Provenance of curvature] The curvature computed in \cref{prop:qubit-sld,prop:ideal-gas} is intrinsic to a state space or to an equilibrium manifold. The proposed identification of such curvature with spacetime curvature is a further hypothesis, and the computations here neither support nor refute it.
\end{description}

The metric ambiguity is the sharpest of the three. In classical statistical mechanics the ruler is unique, so a correspondence of the form ``statistical geometry equals physical geometry'' has no normalization freedom beyond a constant. In quantum statistical mechanics the ruler is a function $f$, and two different rulers give genuinely different geometries on the same state space, as \cref{prop:nonunique} exhibits. Any claim that a quantum state space ``has'' a geometry must therefore answer: which monotone metric, and why.

The emergent-spacetime program states a central test with four targets: recover, from primitive categorical or informational objects, (i) gauge connections and curvature, (ii) quantum states and observables, (iii) interacting gauge-field dynamics, and (iv) spacetime geometry and gravitational dynamics, without assuming at the outset the spacetime geometry the reconstruction is meant to explain. Each target sits at a different point of the proved-to-proposed gradient.

\begin{description}
\item[Connections and curvature] Thermodynamic geometry shows that curvature can be computed from an information object (the entropy function) in equilibrium settings, and the qubit computations show that a state space can carry constant-curvature geometry. The proposed identification of such curvature with physical or spacetime curvature is unestablished.
\item[States and observables] The reconstruction pattern proves recovery of $(X, \mathcal{O})$ from probe data in the commutative setting (\cref{thm:gelfand,thm:stone}) and of bulk operators from boundary subregions in the holographic code setting (\cref{thm:dhw}). Both recover structure; neither delivers dynamics.
\item[Gauge dynamics] No reconstruction theorem on record in the setting of this paper recovers interacting gauge dynamics from information-geometric data. The status of rigorous four-dimensional gauge dynamics is tracked separately in the series and is not used as a premise here.

exec
/usr/local/bin/zsh -lc "sed -n '200,360p' papers/latex/vol-09-gravity-information-geometry.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
\begin{remark}[Worked monotonicity]
\label{rem:worked-monotone}
Take three outcomes, $p = (0.5, 0.3, 0.2)$, and the stochastic map $\varphi = \left(\begin{smallmatrix} 0.7 & 0.1 & 0.2 \\ 0.3 & 0.9 & 0.8 \end{smallmatrix}\right)$, which sends three outcomes to two and has unit column sums. Then $q = \varphi p = (0.42, 0.58)$, and for the tangent vector $u = (0.1, -0.05, -0.05)$ one computes
\begin{equation}
g_p(u, u) = \frac{0.01}{0.5} + \frac{0.0025}{0.3} + \frac{0.0025}{0.2} = \frac{49}{1200} \approx 0.040833,
\end{equation}
while $\varphi u = (0.055, -0.055)$ and $g_q(\varphi u, \varphi u) = 0.055^2 (1/0.42 + 1/0.58) = 121/9744 \approx 0.012418$. The map costs distinguishability, and the deficit is the slack in the Cauchy-Schwarz step of \cref{prop:monotone}. The computational check in \cref{sec:computation} repeats this comparison for two thousand random trials.
\end{remark}

\begin{theorem}[Chentsov]
\label{thm:chentsov}
On the probability simplices, the Fisher family is the unique family of Riemannian metrics, up to a single positive constant shared across dimensions, that is monotone under stochastic maps.
\end{theorem}

Chentsov proved this theorem in the formulation: smooth metric families invariant under congruent embeddings (Markov morphisms) are unique up to constant; Petz and Sud\'ar \cite{petz-sudar} state the equivalent contraction form used here, monotone under general stochastic maps. The two formulations are connected as follows: a congruent embedding and its stochastic inverse force invariance under invertible stochastic maps (permutations included), and the contraction inequality for general stochastic maps is the monotonicity of \cref{def:stochastic}. Smoothness of the metric tensor is assumed throughout, as in Chentsov's statement. Two scope points are essential. The constant is undetermined and shared: monotonicity pins the metric only up to scale, and the cross-dimensional maps of \cref{def:stochastic} are what force one constant across all $n$. The classical uniqueness has an operational reading. Monotonicity says statistical distinguishability does not increase under processing; uniqueness says there is one ruler for that distinguishability. A classification program for statistical systems can therefore treat the Fisher metric as classifying data without a choice problem. \Cref{sec:quantum} shows that this comfort does not survive quantization.

\begin{remark}[Fisher geometry of the simplex]
\label{rem:bernoulli}
The Fisher metric on the interior of $\Delta_{n-1}$ is, up to scale, the round-sphere metric. Substitute $p_i = y_i^2$ with $y_i > 0$; the constraint $\sum_i p_i = 1$ becomes $\sum_i y_i^2 = 1$, and $\sum_i (dp_i)^2 / p_i = 4 \sum_i (dy_i)^2$, so the metric is four times the round metric of the unit sphere restricted to the positive orthant of $S^{n-1}$. For $n \geq 3$ the sectional curvature is $1/4$ in this normalization, and the geodesic distance between $p$ and $p'$ is $2 \arccos \sum_i \sqrt{p_i p'_i}$. For the Bernoulli model ($n = 2$) the state space is an arc of a circle of radius 2, and in the coordinate $q = \log(p_1/p_2)$ the line element is $(dq)^2 / (4 \cosh^2(q/2))$.
\end{remark}

\section{Quantum monotone metrics}
\label{sec:quantum}

Petz and Sud\'ar \cite{petz-sudar} classified the monotone metrics of \cref{def:quantum-monotone} on finite-dimensional state spaces. The answer is parametric, not unique.

\begin{theorem}[Petz-Sud\'ar]
\label{thm:petz-sudar}
Monotone metric families $\{g^{(d)}\}_{d \geq 2}$ in the sense of \cref{def:quantum-monotone} correspond exactly to functions $f : (0, \infty) \to (0, \infty)$ that are operator monotone of all matrix orders and satisfy $f(t) = t f(1/t)$, by the formula \eqref{eq:petz} in each dimension \cite{petz-1996, petz-sudar-jmp}. The correspondence is a bijection after the normalization $f(1) = 1$, which is equivalent to restricting to the Fisher value on diagonal tangent vectors; without the normalization, metrics correspond to $f$ only up to a positive constant. In particular the symmetric logarithmic derivative metric of \cref{def:sld} corresponds to $f(t) = (1+t)/2$, and there are infinitely many monotone metrics.
\end{theorem}

The correspondence in this normalization is the one computed below: for $f(t) = (1+t)/2$ the formula \eqref{eq:petz} gives $g_{\rho}^{f}(X,X) = \sum_{i,j} 2 |X_{ij}|^2 / (\lambda_i + \lambda_j)$, which is exactly $\operatorname{Tr}(X L)$ with $X = (\rho L + L\rho)/2$, since in the eigenbasis the defining equation reads $X_{ij} = L_{ij} (\lambda_i + \lambda_j)/2$. The word ``correspond'' in the theorem is exact in both directions: every operator monotone $f$ with $f(t) = t f(1/t)$ produces a monotone metric, and every monotone metric arises this way. The classification is complete as a parameterization, and the parameter is a function rather than a finite list.

\begin{proposition}[Non-uniqueness on qubit states]
\label{prop:nonunique}
Let $\rho = \operatorname{diag}(3/4, 1/4)$ and let $X = \sigma_x / 2$, $Y = \sigma_z / 2$ be the transverse and radial tangent vectors at $\rho$ in Bloch coordinates. For the symmetric logarithmic derivative metric,
\begin{equation}
g^{\mathrm{sld}}_{\rho}(X, X) = 1, \qquad g^{\mathrm{sld}}_{\rho}(Y, Y) = \frac{4}{3}.
\end{equation}
For the Wigner-Yanase metric, given by \eqref{eq:petz} with $f_{\mathrm{wy}}(t) = \tfrac{1}{4}(1 + \sqrt{t})^2$,
\begin{equation}
g^{\mathrm{wy}}_{\rho}(X, X) = 4(2 - \sqrt{3}), \qquad g^{\mathrm{wy}}_{\rho}(Y, Y) = \frac{4}{3}.
\end{equation}
The radial-to-transverse ratio is $4/3$ for the symmetric logarithmic derivative metric and $(2 + \sqrt{3})/3 \neq 4/3$ for the Wigner-Yanase metric, so the two metrics are not proportional. Quantum monotone metrics are not unique, even up to a constant.
\end{proposition}

\begin{proof}
For $X = \sigma_x / 2$ the matrix entries are $X_{12} = X_{21} = 1/2$ and $X_{11} = X_{22} = 0$. The symmetric logarithmic derivative equation $X = (\rho L + L \rho)/2$ for off-diagonal entries reads $X_{ij} = L_{ij}(\lambda_i + \lambda_j)/2$, so $L_{12} = L_{21} = 1/2 \cdot 2 / 1 = 1$ and $L = \sigma_x$. Then $g^{\mathrm{sld}}(X, X) = \operatorname{Tr}(X L) = \operatorname{Tr}(\sigma_x^2 / 2) = 1$. For $Y = \sigma_z / 2$ the derivative is diagonal and $L = \operatorname{diag}\bigl((1/2)/(3/4), (-1/2)/(1/4)\bigr) = \operatorname{diag}(2/3, -2)$, so $g^{\mathrm{sld}}(Y, Y) = \operatorname{Tr}(Y L) = (1/2)(2/3) + (-1/2)(-2) = 4/3$.

For the Wigner-Yanase metric the coefficient of $|X_{ij}|^2$ in \eqref{eq:petz} is $1/(\lambda_i f_{\mathrm{wy}}(\lambda_j/\lambda_i)) = 4/(\sqrt{\lambda_i} + \sqrt{\lambda_j})^2$. With $\lambda_1 = 3/4$, $\lambda_2 = 1/4$ the transverse value is $2 \cdot (1/4) \cdot 4 / (\sqrt{3}/2 + 1/2)^2 = 4 / (2 + \sqrt{3}) = 4(2 - \sqrt{3})$, where $(\sqrt{3}+1)^2 = 4 + 2\sqrt{3}$ and $4 - 3 = 1$ were used. For diagonal $Y$ the two diagonal terms give $4(1/2)^2 / (2\sqrt{3}/2)^2 + 4(-1/2)^2 / (2 \cdot 1/2)^2 = 1/3 + 1 = 4/3$. The ratio $(4/3)/(4(2-\sqrt{3})) = (2+\sqrt{3})/3$ is not $4/3$, since $2 + \sqrt{3} \neq 4$.
\end{proof}

The failure of uniqueness is structural, not an artifact of the qubit. The Petz family is infinite in every dimension $d \geq 2$, and the ambiguity appears already in the two-level system. Any physical statement of the form ``the geometry of the quantum state space is $G$'' must therefore name $f$, or must derive $f$ from independent principles. This constraint carries into every proposed gravity-information dictionary in \cref{sec:correspondence}.

\begin{remark}[The parameter as data]
\label{rem:parameter}
The classifying datum of a monotone metric is the function $f$, subject to $f(t) = t f(1/t)$; the condition is the symmetry of the Petz formula under $i \leftrightarrow j$, and the normalization $f(1) = 1$ fixes the scale that Chentsov's theorem leaves free. Three members of the family recur in this paper: $f(t) = (1+t)/2$ (symmetric logarithmic derivative), $f_{\mathrm{wy}}(t) = \tfrac{1}{4}(1+\sqrt{t})^2$ (Wigner-Yanase), and $f_{\mathrm{bkm}}(t) = (t-1)/\log t$ (Bogoliubov-Kubo-Mori). Distinct $f$ give distinct metrics, so the parameter is invariant content of a quantum state system, in the same sense that the dimension vector is invariant content of a finite-dimensional $C^*$-algebra. Partial selection principles exist: the expansion of \cref{lem:kl} selects $f_{\mathrm{bkm}}$, and quantum estimation selects $f(t) = (1+t)/2$ \cite{braunstein-caves}. In holography the second-order relative entropy of boundary perturbations equals the bulk canonical energy \cite{lashkari-vr}, which by \cref{lem:kl} selects the Bogoliubov-Kubo-Mori member for that quantity; distinct holographic questions can invoke distinct members. No principle selects a member for a general gravity-information dictionary.
\end{remark}

Uniqueness has one sharp surviving locus.

\begin{proposition}[Commutative locus]
\label{prop:commutative}
For every normalized operator monotone $f$ and every full-rank diagonal $\rho = \sum_i \lambda_i |i\rangle\langle i|$, the restriction of $g^{f}$ to diagonal tangent vectors is the Fisher value:
\begin{equation}
g^{f}_{\rho}(X, X) = \sum_i \frac{X_{ii}^2}{\lambda_i}.
\end{equation}
More generally the restriction of any monotone metric to commuting states is a classical monotone metric, hence $c \cdot g^{\mathrm{fisher}}$ for some $c > 0$ by Chentsov's theorem (\cref{thm:chentsov}); in the Petz family $c = 1/f(1)$, so the normalization $f(1) = 1$ forces $c = 1$. Every normalized monotone metric restricts to the Fisher metric on the commutative locus.
\end{proposition}

\begin{proof}
For diagonal $X$ only the terms $i = j$ survive in \eqref{eq:petz}, and $f(1) = 1$ gives $g^f(X,X) = \sum_i X_{ii}^2 / (\lambda_i f(1)) = \sum_i X_{ii}^2 / \lambda_i$, for every dimension $d$. For the general statement, let $\varphi$ be a stochastic map of diagonal distributions. The pinching channel $\Phi(A) = \sum_{i,j} \varphi_{ji} \langle i | A | i \rangle |j\rangle\langle j|$, with Kraus operators $K_{ji} = \sqrt{\varphi_{ji}} |j\rangle\langle i|$, is completely positive and trace-preserving, maps diagonal states to diagonal states, and restricts to $p \mapsto \varphi p$. Monotonicity of the quantum metric under $\Phi$ restricts to monotonicity of the induced classical metric, so Chentsov's theorem applies and the restriction is $c \cdot g^{\mathrm{fisher}}$. The direct computation above fixes $c = 1/f(1)$ for the Petz family.
\end{proof}

\begin{remark}[Commutative values]
\label{rem:commutative}
For $\rho = \operatorname{diag}(3/4, 1/4)$ and $Y = \sigma_z/2$ the value $g(Y, Y) = 4/3$ of \cref{prop:nonunique} is the Fisher value $\sum_i X_{ii}^2 / \lambda_i = (1/2)^2/(3/4) + (-1/2)^2/(1/4) = 4/3$, for both normalized metrics. The two computations agree on the diagonal, as \cref{prop:commutative} requires, and disagree off it.
\end{remark}

\begin{remark}[Qutrit values]
\label{rem:qutrit}
At the qutrit state $\rho = \operatorname{diag}(0.5, 0.3, 0.2)$ with the off-diagonal tangent $X_{13} = X_{31} = 1/2$, the Petz formula gives $g^{\mathrm{sld}}(X, X) = 10/7 \approx 1.4286$ and $g^{\mathrm{wy}}(X, X) \approx 1.5010$, while the fidelity metric gives $\approx 0.3571$ by the identity of \cref{def:fidelity}. On the diagonal tangent $Y = \operatorname{diag}(0.2, -0.1, -0.1)$ both normalized metrics give the Fisher value $0.04/0.5 + 0.01/0.3 + 0.01/0.2 = 49/300 \approx 0.163333$, while the fidelity metric gives $\approx 0.040833$. The pattern of \cref{prop:nonunique,prop:commutative} holds one dimension up, and the computations of \cref{sec:computation} verify both statements numerically.
\end{remark}

\section{Geometry of the qubit state space}
\label{sec:qubit}

The qubit state space is the smallest quantum system and the smallest place where the Petz family is nontrivial. Its geometry is computable in closed form, and it exhibits the two themes of the paper: a quantum state space carries a canonical constant-curvature geometry once $f$ is chosen, and the choice of $f$ matters off the commutative locus. The computations of this section are expository; the geometry of state spaces and the fidelity constructions are documented in the information-geometric literature \cite{hubner, braunstein-caves, petz-1996}, and the proofs are given in full because the paper uses the statements as premises.

Write $\rho = (I + \vec{r} \cdot \vec{\sigma})/2$ with $|\vec{r}| < 1$, so $\mathcal{D}_2^{\circ}$ is the open unit ball of $\mathbb{R}^3$ and the eigenvalues are $\lambda_{\pm} = (1 \pm |\vec{r}|)/2$.

\begin{proposition}[Symmetric logarithmic derivative geometry of the qubit]
\label{prop:qubit-sld}
In Bloch coordinates the symmetric logarithmic derivative metric is
\begin{equation}
\label{eq:qubit-sld}
g^{\mathrm{sld}} = |d\vec{r}|^2 + \frac{(\vec{r} \cdot d\vec{r})^2}{1 - |\vec{r}|^2}.
\end{equation}
In spherical coordinates $|\vec{r}| = r = \sin\chi$ this becomes $g^{\mathrm{sld}} = (d\chi)^2 + \sin^2\!\chi \, (d\Omega)^2$ with $\chi \in (0, \pi/2)$: the open state space $\mathcal{D}_2^{\circ}$ is isometric to an open hemisphere of the round three-sphere of radius one, of constant sectional curvature one.
\end{proposition}

\begin{proof}
By rotational invariance of $g^{\mathrm{sld}}$ it suffices to evaluate radial and transverse directions at $\vec{r} = (0, 0, r)$. A tangent vector $X = (d\vec{r} \cdot \vec{\sigma})/2$ has entries $X_{11} = dr_3/2$, $X_{22} = -dr_3/2$, $X_{12} = (dr_1 - i\, dr_2)/2$, $X_{21} = (dr_1 + i\, dr_2)/2$ in the orthonormal eigenbasis of $\rho$. From \cref{thm:petz-sudar} the diagonal entries of $g^{\mathrm{sld}}$ contribute $X_{11}^2 / \lambda_+ + X_{22}^2 / \lambda_-$ and the off-diagonal entries contribute $2 \cdot 2 |X_{12}|^2 / (\lambda_+ + \lambda_-)$. With $\lambda_{\pm} = (1 \pm r)/2$ one gets $1/\lambda_+ + 1/\lambda_- = 4/(1 - r^2)$ and $\lambda_+ + \lambda_- = 1$, so
\begin{equation}
g^{\mathrm{sld}} = (dr_1^2 + dr_2^2) + \frac{dr_3^2}{1 - r^2} = |d\vec{r}|^2 + \frac{(\vec{r} \cdot d\vec{r})^2}{1 - |\vec{r}|^2}.
\end{equation}
Setting $r = \sin\chi$ turns $(dr)^2/(1 - r^2) + r^2 (d\Omega)^2$ into $(d\chi)^2 + \sin^2\!\chi \, (d\Omega)^2$, the round metric of radius one, on the chart $\chi \in (0, \pi/2)$; the spherical chart is singular at the center, which is covered by the smooth embedding $\vec{r} \mapsto (\vec{r}, \sqrt{1 - |\vec{r}|^2}) \in S^3 \subset \mathbb{R}^4$. The distance from the center to the pure-state boundary is $\pi/2$.
\end{proof}

The fidelity metric of \cref{def:fidelity} is one quarter of this metric on the qubit.

\begin{proposition}[Fidelity metric of the qubit]
\label{prop:qubit-fid}
On $\mathcal{D}_2^{\circ}$ the fidelity metric satisfies $g^{\mathrm{fid}} = \tfrac{1}{4} g^{\mathrm{sld}}$. Consequently the open state space with the fidelity metric is an open hemisphere of the round three-sphere of radius one half, of constant sectional curvature four.
\end{proposition}

\begin{proof}
Both metrics are invariant under the rotations of the Bloch ball induced by unitary conjugation, so at each $\vec{r}$ the rotation group fixing $\vec{r}$ forces the cross term between radial and transverse directions to vanish and fixes transverse isotropy, and the quadratic form is determined by its radial and transverse values. For the transverse direction, set $\sigma = \rho + \varepsilon X$ with $X = \sigma_x/2$ and $\rho = \operatorname{diag}(\lambda_+, \lambda_-)$. Then $\sqrt{\rho}\, \sigma \sqrt{\rho} = \left(\begin{smallmatrix} \lambda_+^2 & \tfrac{\varepsilon}{2}\sqrt{\lambda_+ \lambda_-} \\ \tfrac{\varepsilon}{2}\sqrt{\lambda_+ \lambda_-} & \lambda_-^2 \end{smallmatrix}\right)$, whose determinant is $\lambda_+ \lambda_- (\lambda_+ \lambda_- - \varepsilon^2/4)$. Since $(\operatorname{Tr}\sqrt{M})^2 = \operatorname{Tr} M + 2\sqrt{\det M}$, one gets $\operatorname{Tr}\sqrt{\sqrt{\rho}\,\sigma\sqrt{\rho}} = 1 - \varepsilon^2/8 + O(\|\varepsilon X\|^3)$ and $d_B^2 = 2(1 - \sqrt{F}) = \varepsilon^2/4 + O(\|\varepsilon X\|^3)$, matching $\tfrac{1}{4} g^{\mathrm{sld}}(X, X) = 1/4$ from \cref{prop:qubit-sld} at every $r$. For the radial direction the states commute and the fidelity reduces to the classical affinity $\sum_i \sqrt{p_i q_i}$ on the Bernoulli pair $p = ((1+r)/2, (1-r)/2)$; the expansion $\sum_i \sqrt{p_i (p_i + \delta_i)} = 1 - \sum_i \delta_i^2 / (8 p_i) + O(\|\delta\|^3)$ for $\sum_i \delta_i = 0$ gives $d_B^2 = \sum_i \delta_i^2 / (4 p_i)$, one quarter of the classical Fisher value, and the classical Fisher value is $g^{\mathrm{sld}}$ on the diagonal by \cref{prop:commutative}. The curvature claim follows from \cref{prop:qubit-sld} and the constant factor $1/4$, which multiplies sectional curvatures by $4$.
\end{proof}

\begin{remark}[Normalization conventions]
\label{rem:conventions}
The factor between the fidelity metric and the symmetric logarithmic derivative metric depends on the normalization of the fidelity, and conventions differ across sources. In the convention of \cref{def:fidelity}, where $d_B^2 = 2(1-\sqrt{F})$, the fidelity metric of the qubit is one quarter of the symmetric logarithmic derivative metric, and the corresponding sphere has radius $1/2$ rather than $1$. The intrinsic statements of \cref{prop:qubit-sld,prop:qubit-fid} are convention-free up to this constant: both geometries are round three-spheres up to the open-hemisphere restriction, and the constant relates their radii. Any comparison of curvature values across sources must first fix the normalization.
\end{remark}

\begin{remark}[Constant curvature without spacetime]
\label{rem:sphere}
\Cref{prop:qubit-sld,prop:qubit-fid} are statements about information geometry. The round three-sphere appearing here is the geometry of statistical distinguishability on a two-level quantum system; it is not a spacetime and no claim about spacetime dimension or signature follows. The example exists to separate the two readings of ``geometric correspondence'': state spaces carry Riemannian geometry by construction, and whether that geometry is physical is a further question.
\end{remark}

\begin{remark}[Geodesic distance on the qubit]
\label{rem:distance}
In the coordinates of \cref{prop:qubit-sld} the geodesic distance from the maximally mixed state $\vec{r} = 0$ to the state $\vec{r} = r \vec{n}$ is $\chi = \arcsin r$, since $g^{\mathrm{sld}} = (d\chi)^2 + \sin^2\!\chi \, (d\Omega)^2$ and radial geodesics of the round sphere have length equal to the angle. Pure states sit at distance $\pi/2$ from the center, and the diameter of the interior is $\pi$: the space of qubit states is a hemisphere of finite diameter carried by statistical distinguishability, not by any spacetime interpretation. The computational check in \cref{sec:computation} compares this distance profile against the closed form.
\end{remark}

\section{Information geometry as invariant data}
\label{sec:invariants}

The classification program identifies objects by invariants, in the spirit of the companion data that practitioners use to tell objects apart in a completed classification. For statistical systems the candidate invariants are the sample-space size, the isometry class of the Fisher geometry, and the curvature data of statistical submodels.

\begin{corollary}[Fisher geometry of the full simplex]
\label{cor:homogeneity}
The Fisher metric on the interior of $\Delta_{n-1}$ is locally isometric to the round sphere of radius two, with sectional curvature $1/4$ for $n \geq 3$, and the arc of \cref{rem:bernoulli} for $n = 2$. The isometry group of the full model is the finite group of coordinate permutations. Two statistical models defined on the full simplex with the same number of outcomes are isometric as Riemannian manifolds, and a permutation of outcomes is an isometry.
\end{corollary}

\begin{proof}
The substitution $p_i = y_i^2$ of \cref{rem:bernoulli} is an isometry onto the positive orthant of the round sphere of radius two. A global isometry of the connected constant-curvature orthant extends uniquely to an ambient isometry of its metric completion $S^{n-1}(2)$, and such an isometry permutes the $n$ extreme rays of the orthant; the orthogonal maps permuting those rays are exactly the permutation matrices. Permutations preserve $\sum_i p_i = 1$ and the metric $\sum_i (dp_i)^2 / p_i$ directly, so the isometry group is the permutation group.
\end{proof}

\Cref{cor:homogeneity} is a classification statement of the trivial kind: the full models of a fixed sample size form one isometry class, and the only invariant is $n$. The classification content of information geometry therefore lives in statistical submodels.

\begin{definition}[Statistical submodel]
\label{def:submodel}
A statistical submodel is a smooth embedding $i : M' \to \Delta_{n-1}^{\circ}$ of a lower-dimensional manifold $M'$ into the simplex, with the pullback metric $g' = i^{*} g^{\mathrm{fisher}}$. The intrinsic and extrinsic curvature invariants of $(M', g')$ are invariants of the model. Exponential families are the canonical submodels.
\end{definition}

\begin{remark}[Embedded two-outcome model]
\label{rem:embedded}
Inside the three-outcome simplex consider $p(\theta) = (\theta, (1-\theta)/2, (1-\theta)/2)$ for $\theta \in (0, 1)$. The tangent vector is $p'(\theta) = (1, -1/2, -1/2)$, and the induced metric is
\begin{equation}
g' = \Bigl( \frac{1}{\theta} + \frac{1/4}{(1-\theta)/2} + \frac{1/4}{(1-\theta)/2} \Bigr) d\theta^2

exec
/usr/local/bin/zsh -lc 'cat src/vol-09-gravity-information-geometry/Instances.hs' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
{-# LANGUAGE TypeFamilies #-}

-- | Module        : Vol09GravityInformationGeometry.Instances
-- Description     : Taxonomy instances for the physical systems of
--                   vol-09-gravity-information-geometry (Gravity, Information,
--                   and Geometric Correspondence).
-- Paper source    : papers/latex/vol-09-gravity-information-geometry.tex
-- Taxonomy source : src/Taxonomy/ (imported classes, never redefined).
--
-- Declares instances of the shared taxonomy classes for this volume's
-- systems: classical statistical models (Fisher geometry), quantum state
-- systems (Petz monotone metrics), entanglement-wedge data, thermodynamic
-- systems (Ruppeiner geometry), and weighted-nerve models. Type and method
-- names mirror the paper's definitions and the mechanization targets in
-- verification/vol-09-gravity-information-geometry-lean-targets.md.
--
-- Claim status (docs/theorem-registry.md): this module is executable
-- vocabulary validated against the paper's statements. It is computational
-- evidence only. It is NOT machine-checked and is never 'verified by Lean';
-- the honest statement is 'executable models validated against kernel-checked
-- specifications' once the Lean layer exists.
module Vol09GravityInformationGeometry.Instances
  ( -- * Systems of the paper
    ClassicalStatisticalModel (..)
  , QuantumStateSystem (..)
  , EntanglementWedgeSystem (..)
  , ThermodynamicGeometrySystem (..)
  , WeightedNerveModel (..)
    -- * Metric data mirroring the paper's definitions
  , FisherMetricData (..)
  , PetzMetricData (..)
  , RuppeinerMetricData (..)
  , EntropyWedgeData (..)
    -- * Invariant record shape (DEF-036)
  , quantumInvariantRecord
  ) where

import Taxonomy.Families
  ( PhysicalSystem (..)
  , FamilyProbabilityMeasure (..)
  , FamilyHilbertOperatorAlgebras (..)
  , FamilySmoothGeometric (..)
  , FamilyTensorCategoriesComposition (..)
  , FamilyDiscreteCombinatorial (..)
  )
import Taxonomy.Invariants (InvariantRecord (..))
import Taxonomy.Constructions (Decomposable (..), Decomposition (..), Construction (..))

-- | Fisher metric data of a classical statistical model (paper, Definition
-- 'Fisher metric'). The sample size and the probability vector are recorded
-- as plain data; no metric is computed here.
data FisherMetricData = FisherMetricData
  { sampleSize :: Int
    -- ^ n = |Omega| of Definition 'Statistical model'.
  , probabilityVector :: [Double]
    -- ^ Interior point p of the simplex.
  }
  deriving (Eq, Show)

-- | Petz monotone metric data of a quantum state system (paper, Definition
-- 'Operator monotone function and the Petz family'). The tag names which
-- normalized operator monotone function is in force; the family is
-- parametric and the choice is load-bearing (paper, Proposition
-- 'Non-uniqueness on qubit states').
data PetzMetricData
  = SymmetricLogarithmicDerivative
    -- ^ f(t) = (1+t)/2; lean target petz_metric_sld.
  | WignerYanase
    -- ^ f(t) = (1/4)(1 + sqrt t)^2; lean target petz_metric_wy.
  | FidelityNormalization
    -- ^ Fidelity metric, one quarter of the SLD metric on qubits; lean
    -- target bures_qubit_round_sphere.
  deriving (Eq, Ord, Show)

-- | Ruppeiner metric data of a thermodynamic system (paper, Definition
-- 'Ruppeiner metric'). The equation of state is recorded as plain data.
data RuppeinerMetricData = RuppeinerMetricData
  { entropyFunction :: String
    -- ^ Name of the entropy function in force (ideal gas or van der Waals).
  , extensiveCoordinates :: [String]
    -- ^ Names of the extensive variables, e.g. ["U", "V"].
  }
  deriving (Eq, Show)

-- | Entanglement wedge data (paper, Definition 'Entanglement wedge'). The
-- region list and wedge assignment are plain data; nothing is derived here.
data EntropyWedgeData = EntropyWedgeData
  { boundaryRegions :: [String]
    -- ^ Boundary region labels A, B, C, ...
  , wedgeAssignments :: [(String, String)]
    -- ^ Pairs (region, bulk operator label) localized in the wedge.
  , regionCount :: Int
    -- ^ Number of boundary regions; the proved entropy-cone range is <= 5.
  }
  deriving (Eq, Show)

-- | A classical statistical model: state space is a finite probability
-- simplex, observables are functions on the sample space, dynamics and
-- symmetry data are recorded as the model declares them.
data ClassicalStatisticalModel = ClassicalStatisticalModel
  { statisticalModelName :: String
  , statisticalData :: FisherMetricData
  }
  deriving (Eq, Show)

-- | A quantum state system: states are density operators on C^d, observables
-- are the matrix algebra, and the monotone metric in force is named by a
-- 'PetzMetricData' tag (the choice cannot be suppressed: quantum monotone
-- metrics are parametric).
data QuantumStateSystem = QuantumStateSystem
  { quantumDimension :: Int
  , monotoneMetricTag :: PetzMetricData
  }
  deriving (Eq, Show)

-- | Entanglement-wedge system: boundary subregion structure together with
-- the entropy-cone range in force (at most 5 regions is the proved range of
-- the paper's Theorem 'Holographic entropy cone').
data EntanglementWedgeSystem = EntanglementWedgeSystem
  { wedgeName :: String
  , wedgeData :: EntropyWedgeData
  }
  deriving (Eq, Show)

-- | Thermodynamic geometry system: an equilibrium manifold with a Ruppeiner
-- metric. Ideal gas instances are flat (paper, Proposition 'Ideal gas');
-- interacting instances are not.
data ThermodynamicGeometrySystem = ThermodynamicGeometrySystem
  { thermoName :: String
  , thermoData :: RuppeinerMetricData
  }
  deriving (Eq, Show)

-- | Weighted-nerve model: finite combinatorial data proposed to converge to
-- a continuum geometry. The convergence condition is a hypothesis of this
-- volume, not an established fact; the Boolean records whether a convergence
-- claim is attached.
data WeightedNerveModel = WeightedNerveModel
  { nerveName :: String
  , groupoidObjects :: Int
  , continuumConvergenceClaimed :: Bool
    -- ^ Always False in honest instances: convergence is not established.
  }
  deriving (Eq, Show)

-- | Family V instance: classical statistical models carry probability and
-- measure structure (DEF-030).
instance FamilyProbabilityMeasure ClassicalStatisticalModel where
  type ProbabilityMeasureData ClassicalStatisticalModel = FisherMetricData
  probabilityMeasureData = statisticalData

-- | Family V instance: quantum state systems carry measure structure through
-- their monotone metrics (DEF-030).
instance FamilyProbabilityMeasure QuantumStateSystem where
  type ProbabilityMeasureData QuantumStateSystem = PetzMetricData
  probabilityMeasureData = monotoneMetricTag

-- | Family II instance: quantum state systems are operator-algebraic
-- (DEF-027).
instance FamilyHilbertOperatorAlgebras QuantumStateSystem where
  type OperatorAlgebraData QuantumStateSystem = Int
  operatorAlgebraData = quantumDimension

-- | Family II instance: entanglement wedges live over boundary operator
-- algebras (DEF-027).
instance FamilyHilbertOperatorAlgebras EntanglementWedgeSystem where
  type OperatorAlgebraData EntanglementWedgeSystem = EntropyWedgeData
  operatorAlgebraData = wedgeData

-- | Family VIII instance: entanglement data is compositional structure
-- (DEF-033).
instance FamilyTensorCategoriesComposition EntanglementWedgeSystem where
  type TensorCategoryData EntanglementWedgeSystem = [String]
  tensorCategoryData = boundaryRegions . wedgeData

-- | Family V instance: thermodynamic equilibrium manifolds carry measure
-- structure through fluctuation theory (DEF-030).
instance FamilyProbabilityMeasure ThermodynamicGeometrySystem where
  type ProbabilityMeasureData ThermodynamicGeometrySystem = RuppeinerMetricData
  probabilityMeasureData = thermoData

-- | Family III instance: thermodynamic systems carry smooth geometric
-- structure (DEF-028), the Ruppeiner metric.
instance FamilySmoothGeometric ThermodynamicGeometrySystem where
  type GeometricData ThermodynamicGeometrySystem = RuppeinerMetricData
  geometricData = thermoData

-- | Family IX instance: weighted-nerve models are discrete combinatorial
-- data (DEF-034).
instance FamilyDiscreteCombinatorial WeightedNerveModel where
  type CombinatorialData WeightedNerveModel = (Int, Bool)
  combinatorialData m = (groupoidObjects m, continuumConvergenceClaimed m)

-- | Family III instance: weighted-nerve models propose a smooth geometry
-- (DEF-028) only through an unestablished continuum limit.
instance FamilySmoothGeometric WeightedNerveModel where
  type GeometricData WeightedNerveModel = String
  geometricData = nerveName

-- | DEF-002 instance: the classical statistical model as an object of the
-- schema P = (X, O, D, S, C). Dynamics and symmetries are the trivial ones
-- declared here; the instance records shape, not content.
instance PhysicalSystem ClassicalStatisticalModel where
  type StateSpace ClassicalStatisticalModel = FisherMetricData
  type Observables ClassicalStatisticalModel = [String]
  type Dynamics ClassicalStatisticalModel = ()
  type Symmetries ClassicalStatisticalModel = [String]
  type Composition ClassicalStatisticalModel = ()
  stateSpace = statisticalData
  observables _ = ["functions on Omega"]
  dynamics _ = ()
  symmetries _ = ["permutations of outcomes"]
  composition _ = ()

-- | DEF-002 instance: the quantum state system.
instance PhysicalSystem QuantumStateSystem where
  type StateSpace QuantumStateSystem = Int
  type Observables QuantumStateSystem = String
  type Dynamics QuantumStateSystem = ()
  type Symmetries QuantumStateSystem = String
  type Composition QuantumStateSystem = ()
  stateSpace = quantumDimension
  observables _ = "matrix algebra M_d(C)"
  dynamics _ = ()
  symmetries _ = "unitary group U(d)"
  composition _ = ()

-- | DEF-002 instance: the entanglement-wedge system.
instance PhysicalSystem EntanglementWedgeSystem where
  type StateSpace EntanglementWedgeSystem = EntropyWedgeData
  type Observables EntanglementWedgeSystem = [(String, String)]
  type Dynamics EntanglementWedgeSystem = ()
  type Symmetries EntanglementWedgeSystem = [String]
  type Composition EntanglementWedgeSystem = [String]
  stateSpace = wedgeData
  observables = wedgeAssignments . wedgeData
  dynamics _ = ()
  symmetries = boundaryRegions . wedgeData
  composition = boundaryRegions . wedgeData

-- | DEF-002 instance: the thermodynamic geometry system.
instance PhysicalSystem ThermodynamicGeometrySystem where
  type StateSpace ThermodynamicGeometrySystem = RuppeinerMetricData
  type Observables ThermodynamicGeometrySystem = [String]
  type Dynamics ThermodynamicGeometrySystem = ()
  type Symmetries ThermodynamicGeometrySystem = [String]
  type Composition ThermodynamicGeometrySystem = ()
  stateSpace = thermoData
  observables _ = ["equilibrium observables"]
  dynamics _ = ()
  symmetries _ = []
  composition _ = ()

-- | DEF-002 instance: the weighted-nerve model. Composition is the monoidal
-- product of the underlying combinatorial data.
instance PhysicalSystem WeightedNerveModel where
  type StateSpace WeightedNerveModel = Int
  type Observables WeightedNerveModel = String
  type Dynamics WeightedNerveModel = ()
  type Symmetries WeightedNerveModel = String
  type Composition WeightedNerveModel = String
  stateSpace = groupoidObjects
  observables _ = "nerve functions"
  dynamics _ = ()
  symmetries _ = "groupoid automorphisms"
  composition _ = "tensor product of nerves"

-- | DEF-022 instance: a classical statistical model decomposes over the
-- outcomes of Omega when the composition rule is direct sum of the outcome
-- branches. Uniqueness of decomposition is not claimed (paper, Section 2).
instance Decomposable ClassicalStatisticalModel where
  decomposition m =
    Just Decomposition
      { decompositionConstruction = DirectSum
      , irreducibleFactors = [m]
      }

-- | A model does not supply a decomposition of its entanglement wedge data
-- here; Nothing records that none is supplied, not that none exists.
instance Decomposable EntanglementWedgeSystem where
  decomposition _ = Nothing

-- | Invariant record shape for a quantum state system (DEF-036). The fields
-- carry the classification data the paper discusses: the Petz family member
-- as state-side invariant data. No classification is computed.
quantumInvariantRecord :: QuantumStateSystem -> InvariantRecord PetzMetricData Int () String Int
quantumInvariantRecord q =
  InvariantRecord
    { stateInvariants = monotoneMetricTag q
    , observableInvariants = quantumDimension q
    , dynamicsInvariants = ()
    , symmetryInvariants = "U(d)"
    , representationInvariants = quantumDimension q
    }

codex
The diagonal-state check compares only diagonal tangent vectors, and the van der Waals check asserts nonzero curvature at only one sampled point. I’ll also check how many fidelity trials survive the eigenvalue filter in each dimension.
exec
/usr/local/bin/zsh -lc "python3 -B -c 'import numpy as np
rng = np.random.default_rng(20261029)
for d in (2,3,4):
 count=0
 for _ in range(60):
  a=rng.normal(size=(d,d))+1j*rng.normal(size=(d,d))
  rho=a@a.conj().T
  rho=rho/np.trace(rho)
  if np.linalg.eigvalsh(rho).min()<0.05: continue
  count+=1
  b=rng.normal(size=(d,d))+1j*rng.normal(size=(d,d))
 print(d,count)'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 88ms:
2 50
3 17
4 2

exec
/usr/local/bin/zsh -lc "sed -n '360,380p' papers/latex/vol-09-gravity-information-geometry.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
g' = \Bigl( \frac{1}{\theta} + \frac{1/4}{(1-\theta)/2} + \frac{1/4}{(1-\theta)/2} \Bigr) d\theta^2
= \frac{(d\theta)^2}{\theta(1-\theta)},
\end{equation}
exactly the Fisher metric of the standalone two-outcome model of \cref{rem:bernoulli}. The embedding is isometric onto its image, so intrinsic geometry cannot detect the sample-space size: two models with different numbers of outcomes can share a submodel geometry. The induced metric is unchanged here because the embedding is a sufficient-statistic Markov map. Among linear stochastic maps, pullback preserves the Fisher metric exactly when the map is a sufficient-statistic embedding, and general smooth embeddings can reproduce the same intrinsic metric without being Markov maps, so intrinsic geometry alone does not detect the embedding. Extrinsic data of the embedding is additional invariant content.
\end{remark}

\begin{remark}[Classifying data for statistical models]
\label{rem:family-v}
For statistical models (probability and measure structures), the Fisher metric is the natural classifying invariant in the classical case. \Cref{cor:homogeneity} and \cref{def:submodel} make that naming precise: the invariant is the metric up to isometry, trivial on full models and rich on submodels. This is the opposite of the symplectic situation, where local classification is trivial by Darboux's theorem and all content is global. Information geometry has local content and uses it. On the quantum side the invariant data must additionally name the member $f$ of the Petz family (\cref{prop:nonunique}), so the classifying data of a quantum state system is the pair (state space, $f$) and never the state space alone.
\end{remark}

\begin{remark}[Classification status of statistical models]
\label{rem:status}
The evidence of this paper supports the following summary. Classical statistical models of fixed sample size are classified by \cref{cor:homogeneity} up to isometry of their full Fisher geometry, and statistical submodels carry curvature invariants without a complete classification being on record. Quantum state systems are classified as metric spaces only after the parameter $f$ is fixed, and no physical principle in this paper fixes it. Statistical models are therefore a worked example of a general pattern in classification: a complete island (Chentsov, Petz-Sud\'ar), a trivial stratum (full simplices), and open content (submodels, quantum parameter selection).
\end{remark}

\section{Reconstruction from probes}
\label{sec:reconstruction}

The second proved pattern available to a gravity-information program is reconstruction: an object recovered from data about its relationships. Three classical results fix the pattern, and one quantum-information result applies it to entanglement.


codex
ROW 1 | Fisher metric contracts under stochastic maps | SUPPORTS | Checks positive semidefiniteness of the metric difference on tangent spaces across 2,000 random trials.
ROW 2 | Monotone metrics differ on qubit states | SUPPORTS | Computes SLD and Wigner–Yanase radial-to-transverse ratios and checks their distinct expected values.
ROW 3 | Monotone metrics differ on qutrit states | SUPPORTS | Checks that SLD and Wigner–Yanase values differ for an explicit off-diagonal qutrit tangent.
ROW 4 | Monotone metrics agree on diagonal states | PARTIAL | Checks only two normalized metrics on one diagonal tangent, whereas agreement at diagonal states requires restricting tangent directions.
ROW 5 | Qubit SLD metric is round | SUPPORTS | Checks the SLD solution against the Bloch formula and its coordinate transformation against the round sphere metric.
ROW 6 | Fidelity metric equals one quarter SLD in dimensions two–four | SUPPORTS | Compares finite-difference fidelity values against SLD/4 in all three dimensions, retaining 50, 17, and 2 trials respectively.
ROW 7 | Center geodesic distance equals arcsin radius | SUPPORTS | Numerically integrates the radial length element and checks agreement with arcsin at five radii.
ROW 8 | Ideal gas Ruppeiner curvature vanishes | SUPPORTS | Constructs the entropy Hessian and checks that its symbolic Ricci scalar vanishes identically.
ROW 9 | Van der Waals curvature is nonzero away from criticality | PARTIAL | Computes symbolic curvature but checks nonvanishing only at (2,2), with remaining assertions testing sampled growth.

VERDICT: NEEDS_FIX
hook: Stop
hook: Stop Completed
tokens used
54,064
ROW 1 | Fisher metric contracts under stochastic maps | SUPPORTS | Checks positive semidefiniteness of the metric difference on tangent spaces across 2,000 random trials.
ROW 2 | Monotone metrics differ on qubit states | SUPPORTS | Computes SLD and Wigner–Yanase radial-to-transverse ratios and checks their distinct expected values.
ROW 3 | Monotone metrics differ on qutrit states | SUPPORTS | Checks that SLD and Wigner–Yanase values differ for an explicit off-diagonal qutrit tangent.
ROW 4 | Monotone metrics agree on diagonal states | PARTIAL | Checks only two normalized metrics on one diagonal tangent, whereas agreement at diagonal states requires restricting tangent directions.
ROW 5 | Qubit SLD metric is round | SUPPORTS | Checks the SLD solution against the Bloch formula and its coordinate transformation against the round sphere metric.
ROW 6 | Fidelity metric equals one quarter SLD in dimensions two–four | SUPPORTS | Compares finite-difference fidelity values against SLD/4 in all three dimensions, retaining 50, 17, and 2 trials respectively.
ROW 7 | Center geodesic distance equals arcsin radius | SUPPORTS | Numerically integrates the radial length element and checks agreement with arcsin at five radii.
ROW 8 | Ideal gas Ruppeiner curvature vanishes | SUPPORTS | Constructs the entropy Hessian and checks that its symbolic Ricci scalar vanishes identically.
ROW 9 | Van der Waals curvature is nonzero away from criticality | PARTIAL | Computes symbolic curvature but checks nonvanishing only at (2,2), with remaining assertions testing sampled growth.

VERDICT: NEEDS_FIX
