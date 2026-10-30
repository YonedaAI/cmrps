---
reviewer: codex (OpenAI) gpt-6.1-sol
type: code-audit
paper: vol-05-classical-systems
round: 2
date: 2026-10-30T05:16:55Z
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
session id: 01a18b3d-5729-7442-a822-b8a2b46fe3e8
--------
user
Read papers/latex/vol-05-classical-systems.tex and ONLY the files under src/vol-05-classical-systems/ that its code evidence appendix names (do not explore anything else). Re-audit after fixes: row 1 now names flow_time1 and test_chart_pullback (the actual functions), and row 4's rank helper was fixed to keep rows before the pivot and gained a rankChecks property test (skew 2x2 ranks two, zero matrix ranks zero). For EVERY row of the appendix output one line: ROW <n> | <claim, 10 words max> | SUPPORTS | PARTIAL | NO | <one-sentence reason>. End with VERDICT: PASS if every row is SUPPORTS, else VERDICT: NEEDS_FIX.
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
I’ll read the appendix and only its named source files, then assess each row against that evidence.
exec
/usr/local/bin/zsh -lc 'cat papers/latex/vol-05-classical-systems.tex' in /Users/mlong/Documents/Development/classification-physical-systems
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
\usepackage{tikz}
\usepackage{booktabs,tabularx,array,longtable}
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\usepackage{listings}
\lstset{basicstyle=\ttfamily\footnotesize,breaklines=true,columns=fullflexible,frame=single,framesep=4pt,showstringspaces=false,captionpos=b}
\usepackage[hidelinks]{hyperref}
\usepackage{cleveref}
\crefname{lstlisting}{Listing}{Listings}

\newtheorem{theorem}{Theorem}[section]
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\theoremstyle{remark}
\newtheorem{remark}[theorem]{Remark}
\newtheorem{example}[theorem]{Example}

\title{Classification of Classical Physical Systems\\[4pt]
  {\normalsize Part 5 of \emph{The Classification of Mathematical Representations of Physical Systems}}}
\author{Matthew Long\\
  \small The YonedaAI Collaboration, YonedaAI Research Collective\\
  \small Chicago, Illinois, USA\\
  \small \texttt{mlong@yonedalabs.ai}\\
  \small \texttt{https://yonedalabs.ai}}
\date{October 2026}

\begin{document}

\maketitle

\begin{abstract}
This paper classifies restricted classes of classical physical systems: symplectic and Poisson systems and classical statistical systems. The central structural fact is an inversion of the Riemannian situation. Darboux's theorem removes every local symplectic invariant, so the classification content of Hamiltonian mechanics is global and topological. On the Poisson side, Weinstein's splitting theorem replaces local rigidity by a rank stratification into symplectic leaves and transverse data, and coadjoint orbits tie the homogeneous case to the Dynkin classification of simple Lie algebras and the highest-weight classification of their finite-dimensional representations. On the statistical side, Chentsov's theorem singles out the Fisher metric as the unique metric monotone under stochastic maps, while the quantum analogue is parametric rather than unique. The results include one complete local classification theorem, one rank normal form, one uniqueness theorem, and two restricted global classification theorems, each stated with hypotheses and proof or proof reference. The limitation that matters most is scope: no global classification theorem for closed symplectic manifolds is claimed or available, decomposition uniqueness is open outside restricted subclasses, and the deformation-quantization bridge to quantum theory remains conjectural. Computational experiments exhibit the local normal forms and supply executable models; they are evidence, not proofs.
\end{abstract}

\section{Introduction}

Classical physical systems carry their state, observables, dynamics, symmetries, and composition rules on smooth manifolds and probability simplices, and the relevant mathematical structures are fully developed: symplectic manifolds, Poisson manifolds, probability simplices. A classification of these structures is a question about what the surviving invariants are.

The answer is shaped by a single theorem. Darboux's theorem states that all symplectic manifolds of a fixed dimension are locally indistinguishable: near every point, a symplectic manifold looks exactly like a standard linear space with a standard two-form. Riemannian geometry classifies locally through curvature, an invariant with content at every point. Symplectic geometry has no local invariants at all. Whatever classification content Hamiltonian mechanics possesses lives in the large, in topology and global geometry. This inversion, recorded as a structural lesson of the research program, organizes the entire paper.

Three bodies of established mathematics carry the classification effort. The local theory of Poisson manifolds contributes the rank stratification: Weinstein's splitting theorem decomposes a neighborhood of a point into a symplectic factor and a transverse Poisson factor, so Poisson geometry replaces the missing local invariants of the symplectic case by a rank stratification and a foliation into symplectic leaves. The theory of coadjoint orbits contributes the homogeneous case. Coadjoint orbits of a Lie group carry a canonical symplectic form, the Kirillov-Kostant-Souriau form, and for compact semisimple groups the orbits form flag manifolds parameterized by the positive Weyl chamber, with dominant integral weights selecting the integral orbits. The Killing-Cartan classification of simple Lie algebras and the highest-weight classification of their representations therefore enter classical mechanics as the classification of homogeneous symplectic manifolds. Information geometry on the classical side contributes the uniqueness theorem: Chentsov's theorem singles out the Fisher metric, up to a constant, as the unique Riemannian metric monotone under stochastic maps. Classical statistical systems thus possess a uniqueness theorem that their quantum analogues provably lack.

No global classification theorem for closed symplectic manifolds is known or claimed. Decomposition of classical systems into irreducible factors is unique only in restricted subclasses, and action-angle monodromy is an explicit obstruction to global decomposition in one of those subclasses. The deformation-quantization bridge between classical and quantum families is a programmatic conjecture, and the paper treats it as conditional throughout. Every theorem below is stated with its hypotheses; every computational claim is marked as evidence rather than proof.

Mathematical equivalence for these systems is structure-preserving isomorphism: symplectomorphisms preserve symplectic forms, Poisson isomorphisms preserve brackets, and reparameterizations preserve probability structure. Physical equivalence is a coarser relation that this paper does not define, and every classification theorem below applies to mathematical structures under these isomorphisms.

\section{Mathematical framework}

A classical system in this paper is an instance of the five-component schema of the series: a tuple of state space, observables, dynamics, symmetries, and composition rules, with each component specialized to smooth-geometric or measure-theoretic data.

\begin{definition}[Classical system]
\label{def:classical-system}
A classical system is a tuple $P = (X, O, D, S, C)$ where $X$ is a smooth state space, $O$ is a distinguished family of observables on $X$, $D$ is a family of admissible state evolutions with their composition rules (vector fields with flows on smooth manifolds, stochastic maps on simplices), $S$ is symmetry data preserving $O$ and $D$ (a Lie group action in the smooth case, outcome permutations and sufficient-statistics embeddings in the statistical case), and $C$ assigns composition data to products of systems. The tuple is the classical instance of the five-component schema of the series.
\end{definition}

\begin{definition}[Symplectic system]
\label{def:symplectic-system}
A symplectic system is a classical system whose state space is a symplectic manifold $(M, \omega)$ of dimension $2n$, whose observables are $O = C^{\infty}(M)$, and whose dynamics are Hamiltonian vector fields $X_H$ defined by $\iota_{X_H} \omega = dH$ for Hamiltonians $H \in C^{\infty}(M)$. The Poisson bracket is $\{f, g\} = \omega(X_f, X_g)$ and the flow equation reads $\dot{f} = \{f, H\}$.
\end{definition}

\begin{definition}[Poisson system]
\label{def:poisson-system}
A Poisson system is a classical system whose state space is a Poisson manifold $(M, \pi)$: a smooth manifold with a bivector field $\pi \in \Gamma(\Lambda^2 TM)$ whose Schouten-Nijenhuis bracket satisfies $[\pi, \pi] = 0$. The bracket $\{f, g\} = \pi(df, dg)$ makes $C^{\infty}(M)$ a Lie algebra obeying the Leibniz rule in each argument. Symplectic systems are the special case in which $\pi$ is nondegenerate.
\end{definition}

\begin{definition}[Classical statistical system]
\label{def:statistical-system}
A classical statistical system is a classical system whose state space is the interior $\Delta^{\circ} = \{ p \in \mathbb{R}^{n} : p_i > 0,\ \sum_i p_i = 1 \}$ of the probability simplex $\Delta^{n-1} = \{ p \in \mathbb{R}^{n} : p_i \geq 0,\ \sum_i p_i = 1 \}$, whose observables are random variables (functions on the outcome set), and whose admissible state changes are the column-stochastic matrices $T$ that map $\Delta^{\circ}$ into itself (columns strictly positive); maps that reach the boundary are excluded because the Fisher metric is singular there. Restriction to submodels is by sufficient statistics, and the symmetries $S$ are the outcome permutations together with those embeddings.
\end{definition}

The three families in force are the symplectic and Poisson family, the smooth geometric family, and the classical probability and measure family. The quantum side of the probability family appears in Section 8 only as a contrast.

\begin{definition}[Morphisms and equivalence in force]
\label{def:morphisms}
Between symplectic systems the admissible exact morphisms are symplectomorphisms and, between Poisson systems, Poisson maps (smooth maps pulling Poisson brackets back). Between classical statistical systems the admissible coarse-grainings are stochastic maps. Mathematical equivalence of classical systems is isomorphism in the ambient category fixed here: symplectomorphism, Poisson isomorphism, or diffeomorphism of statistical models carrying the model map. Every such identification preserves the symplectic form or the Poisson bracket or the probability structure, and the paper names the preserved layer whenever an identification is claimed.
\end{definition}

\begin{definition}[Irreducibility relative to composition]
\label{def:irreducible}
Fix the product composition of Section 9 as the composition data $C$. A classical system is $C$-irreducible if it admits no decomposition $P \simeq P_1 \times P_2$ with both factors of positive dimension. Irreducibility is always relative to the composition data chosen, and the paper never asserts irreducibility without naming that data.
\end{definition}

Two limitations of the framework are load-bearing. First, the admissibility conditions of the series are not yet fixed, so every statement below quantifies over explicitly listed classes rather than over all admissible systems. Second, mathematical equivalence is strictly finer than physical equivalence, and no physical equivalence for classical systems is fixed here. The standing qualification of the series governs any attempt to derive physical conclusions from relational data: ``Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.''

\begin{table}[t]
\centering
\small
\begin{tabular}{L{3.2cm}L{9.8cm}}
\toprule
Symbol & Meaning \\
\midrule
$(M, \omega)$ & symplectic manifold of dimension $2n$ with closed nondegenerate two-form \\
$\pi$, $\pi^{\sharp}$ & Poisson bivector and the map $T^{*}M \to TM$ it induces \\
$X_H$ & Hamiltonian vector field defined by $\iota_{X_H} \omega = dH$ \\
$\{f, g\}$ & Poisson bracket of observables \\
$\mathcal{O}_{\xi}$ & coadjoint orbit through $\xi \in \mathfrak{g}^{*}$ \\
$J$ & momentum map of a symplectic group action \\
$\Delta^{\circ}$ & interior of the probability simplex \\
$g_{p}$ & Fisher metric at the probability vector $p$ \\
$T^{*} g_{Tp}$ & pullback of the metric at $Tp$ along a stochastic map \\
$C$ & product composition of classical systems \\
\bottomrule
\end{tabular}
\caption{Notation used throughout the paper. Each symbol is fixed at its first appearance and reused without change.}
\label{tab:notation}
\end{table}

\begin{definition}[Canonical transformation and coarse-graining]
\label{def:canonical}
A canonical transformation between symplectic systems $(M_1, \omega_1)$ and $(M_2, \omega_2)$ is a diffeomorphism $\varphi : M_1 \to M_2$ with $\varphi^{*} \omega_2 = \omega_1$; it carries Hamiltonian flows to Hamiltonian flows and preserves the Poisson bracket. A coarse-graining of a classical statistical system is a stochastic map $T$; it preserves the probability structure and contracts the Fisher metric by \cref{def:monotone}. The two kinds of morphism implement the two equivalence regimes of this paper: exact mathematical equivalence on the symplectic side and a metric-degrading order relation on the statistical side.
\end{definition}

\section{Local classification of symplectic systems}

The classification of symplectic manifolds is locally trivial and globally hard. The local triviality is a theorem.

\begin{lemma}[Linearization at a point]
\label{lem:linearization}
Let $(M^{2n}, \omega)$ be symplectic and let $p \in M$. There are coordinates $(x_1, y_1, \dots, x_n, y_n)$ centered at $p$ in which $\omega_p = \sum_{i=1}^{n} dx_i \wedge dy_i$ at $p$.
\end{lemma}

\begin{proof}
Choose any coordinates $u_1, \dots, u_{2n}$ centered at $p$. The matrix $\Omega = (\omega_{ij}(p))$ of $\omega$ at $p$ is skew-symmetric and invertible. Symplectic Gram-Schmidt: pick $u_1$ with $\omega(u_1, \cdot) \neq 0$, set $v_1$ with $\omega(u_1, v_1) = 1$, restrict to the symplectic complement of $\operatorname{span}(u_1, v_1)$, and iterate. The resulting frame $e_1, f_1, \dots, e_n, f_n$ satisfies $\omega(e_i, f_j) = \delta_{ij}$, $\omega(e_i, e_j) = \omega(f_i, f_j) = 0$, and dual coordinates give the claim.
\end{proof}

\begin{lemma}[Moser trick on a ball]
\label{lem:moser-ball}
Let $B$ be an open ball centered at $p$ in a chart, and let $\omega_t$, $t \in [0, 1]$, be a smooth family of symplectic forms on $B$ with $\omega_t$ nondegenerate for all $t$. If $\dot{\omega}_t$ is exact for each $t$, then there is a concentric ball $B'$ compactly contained in $B$ carrying an isotopy $\varphi_t$ with $\varphi_t^{*} \omega_t = \omega_0$ for all $t$, and $\varphi_1$ maps $B'$ into $B$.
\end{lemma}

\begin{proof}
Let $Z$ be the radial vector field of $B$ from its center $p$, so $Z(p) = 0$ and $B$ is star-shaped for $Z$. For the closed form $\dot{\omega}_t$ the homotopy operator gives the primitive $\alpha_t = \iota_{Z} \dot{\omega}_t$, which satisfies $d \alpha_t = \dot{\omega}_t$ and $\alpha_t(p) = 0$ because $Z$ vanishes at $p$. Solve $\iota_{X_t} \omega_t = -\alpha_t$; nondegeneracy of $\omega_t$ makes this solvable and $X_t(p) = 0$. Let $L$ be a Lipschitz constant for the field $X_t$ on $B$, uniform in $t \in [0, 1]$, and choose $r > 0$ with $B(p, r)$ compactly contained in $B$ and $e^{L} r$ smaller than the distance from $p$ to the boundary of $B$. Grönwall's inequality gives $|\varphi_t(x) - p| \leq e^{L t} |x - p|$ for as long as the trajectory stays in $B$, so the flow $\varphi_t$ of $X_t$ starting at the identity exists on all of $[0, 1]$ and maps $B' = B(p, r)$ into $B$. Then
\[
\frac{d}{dt} \varphi_t^{*} \omega_t = \varphi_t^{*} \left( \dot{\omega}_t + \mathcal{L}_{X_t} \omega_t \right) = \varphi_t^{*} \left( d\alpha_t + d \iota_{X_t} \omega_t \right) = \varphi_t^{*} (d \alpha_t - d \alpha_t) = 0,
\]
so $\varphi_t^{*} \omega_t$ is constant and equals $\omega_0$.
\end{proof}

\begin{theorem}[Darboux]
\label{thm:darboux}
Let $(M^{2n}, \omega)$ be a symplectic manifold and $p \in M$. There exists a neighborhood $U$ of $p$ and a diffeomorphism $\varphi : U \to V$ onto an open subset $V \subset \mathbb{R}^{2n}$ such that $\varphi^{*} \omega_0 = \omega|_U$ where $\omega_0 = \sum_{i=1}^{n} dx_i \wedge dy_i$. In particular, any two symplectic manifolds of the same dimension are locally symplectomorphic.
\end{theorem}

\begin{proof}
By \Cref{lem:linearization} choose centered coordinates on a ball $B$ around $p$ in which $\omega_p = \omega_0$ at the center. The family $\omega_t = \omega_0 + t(\omega - \omega_0)$ is a smooth family of closed two-forms with $\omega_t$ nondegenerate on a possibly smaller ball $B' \subset B$ (nondegeneracy is an open condition and holds at $p$ for every $t$). On $B'$ the form $\omega - \omega_0$ is closed, and since $B'$ is contractible its de Rham cohomology vanishes in degree two, so $\omega - \omega_0 = d\alpha$ for a one-form $\alpha$ and $\dot{\omega}_t = d\alpha$ is exact for every $t$. \Cref{lem:moser-ball} provides an isotopy $\varphi_t$ of $B'$ with $\varphi_1^{*} \omega_1 = \omega_0$ and $\omega_1 = \omega$. The diffeomorphism $\varphi_1^{-1}$ exhibits $(B', \omega)$ as a symplectomorphic image of an open set in $(\mathbb{R}^{2n}, \omega_0)$.
\end{proof}

\begin{corollary}[Absence of local invariants]
\label{cor:no-local}
Every local symplectic invariant of a $2n$-dimensional symplectic manifold is constant on connected components. Any classification of symplectic manifolds up to symplectomorphism must be carried by global data.
\end{corollary}

\begin{proof}
Local symplectic invariants are preserved by symplectomorphisms, and \cref{thm:darboux} supplies a symplectomorphism from a neighborhood of any point onto a neighborhood of any point of the standard space of the same dimension. Two points of a connected manifold are joined by a chain of such neighborhoods.
\end{proof}

\begin{remark}[The inversion]
\label{rem:inversion}
In Riemannian geometry the curvature tensor is a local invariant with pointwise content, and local normal forms are scarce. In symplectic geometry the local classification has one entry per dimension, and the classification problem moves to global topology.
\end{remark}

The same argument classifies exact symplectic structures locally in the strongest sense: on a ball, every symplectic form is not merely standardizable but symplectomorphic to the constant standard form. 

\section{Poisson geometry and local models}

Poisson manifolds retain local structure where symplectic manifolds have none. The rank of $\pi$ at a point is the invariant Darboux's theorem destroyed for the symplectic case, and a normal form organizes a neighborhood of a point around that rank.

\begin{theorem}[Weinstein splitting]
\label{thm:weinstein}
Let $(M, \pi)$ be a Poisson manifold and $p \in M$ a point of rank $2k$. There exist a neighborhood $U$ of $p$ and a Poisson diffeomorphism from $U$ onto a product $U_1 \times U_2$ where $U_1$ is a neighborhood of a point in a symplectic manifold $(N^{2k}, \omega)$ and $U_2$ is a neighborhood of a zero $q_0$ of a Poisson structure $\pi_2$ of rank zero at $q_0$.
\end{theorem}

\begin{proof}[Proof sketch]
The symplectic leaf $S$ through $p$ is an immersed submanifold of dimension $2k$ and carries the induced symplectic form $\omega_S$ characterized by $\omega_S^{\flat} = (\pi|_S)^{-1}$. In coordinates adapted to the leaf the bivector takes the form $\pi = \pi_S + \pi_T$ with $\pi_S$ nondegenerate along $S$ and $\pi_T$ tangent to the transverse fibers and vanishing on the zero section. The transverse factor $\pi_T$ retains its higher-order terms at the zero $q_0$; the splitting theorem does not linearize it, and smooth linearization of transverse Poisson structures fails in general. The full argument appears in Weinstein \cite{weinstein}; the product form stated here is the part used below.
\end{proof}

\begin{proposition}[Leaf foliation]
\label{prop:leaves}
A Poisson manifold $(M, \pi)$ is foliated by its symplectic leaves: maximal immersed submanifolds $S \subset M$ on which $\pi|_S$ is nondegenerate and which are tangent to the distribution $\operatorname{im} \pi^{\sharp}$. Each leaf is a symplectic manifold, and the restriction of the Poisson bracket of functions to a leaf is the bracket of the leaf symplectic form.
\end{proposition}

\begin{proof}
The distribution $x \mapsto \operatorname{im} \pi^{\sharp}_x$ is integrable in the sense of Stefan-Sussmann precisely because $[\pi, \pi] = 0$: the vanishing of the Schouten-Nijenhuis bracket is the integrability condition for the associated Lie algebroid, and its leaves are the symplectic leaves. On a leaf $S$ the map $\pi^{\sharp}|_S : T^{*}S \to TS$ is an isomorphism by maximality of the leaf, and its inverse is $\omega_S^{\flat}$; the bracket identity $\{f, g\}|_S = \omega_S(X_f, X_g)$ is then the definition of $\omega_S$.
\end{proof}

\begin{example}[Lie-Poisson bracket on $\mathfrak{g}^{*}$]
\label{ex:lie-poisson}
For a finite-dimensional Lie algebra $\mathfrak{g}$ the dual space $\mathfrak{g}^{*}$ carries the linear Poisson structure $\pi(\xi)(d f, d g) = \langle \xi, [d f(\xi), d g(\xi)] \rangle$ under the identification $T_{\xi}^{*} \mathfrak{g}^{*} \cong \mathfrak{g}$. Its symplectic leaves are the coadjoint orbits. For $\mathfrak{g} = \mathfrak{so}(3)$ the space $\mathfrak{g}^{*} \cong \mathbb{R}^{3}$ carries the angular momentum bracket $\{x, y\} = z$ and its cyclic permutations; the rank is two away from the origin and zero at the origin, the leaves are the spheres $\{|\xi| = r\}$ together with the origin, and \cref{thm:weinstein} at a point of a sphere recovers a two-dimensional symplectic factor with a one-dimensional transverse Poisson factor.
\end{example}

\begin{theorem}[Kirillov-Kostant-Souriau form]
\label{thm:kks}
Let $G$ be a Lie group with Lie algebra $\mathfrak{g}$ and let $\mathcal{O} \subset \mathfrak{g}^{*}$ be a coadjoint orbit. The formula
\[
\omega_{\xi}(\operatorname{ad}^{*}_{x} \xi, \operatorname{ad}^{*}_{y} \xi) = \langle \xi, [x, y] \rangle
\]
defines a $G$-invariant symplectic form $\omega_{\xi}$ on $\mathcal{O}$, and the coadjoint action of $G$ on $(\mathcal{O}, \omega_{\xi})$ is by symplectomorphisms. The Poisson structure induced on $\mathfrak{g}^{*}$ by the Lie bracket restricts on each orbit to the inverse of $\omega_{\xi}$.
\end{theorem}

\begin{proof}
The stabilizer $\mathfrak{g}_{\xi}$ of $\xi$ under the coadjoint action is the kernel of the skew form $(x, y) \mapsto \langle \xi, [x, y] \rangle$, so the form descends to $T_{\xi} \mathcal{O} \cong \mathfrak{g} / \mathfrak{g}_{\xi}$. Nondegeneracy on the orbit follows from this identification, and the identity $T_{\xi} \mathcal{O} = \operatorname{im} \operatorname{ad}^{*}(\xi)$ makes the descended form nondegenerate. Invariance is the identity $\langle \operatorname{Ad}^{*}_{g} \xi, [\operatorname{Ad}_{g} x, \operatorname{Ad}_{g} y] \rangle = \langle \xi, [x, y] \rangle$ under the adjoint action. The relation between the orbit form and the linear Poisson structure is a direct computation in the Lie-Poisson bracket of \cref{ex:lie-poisson}; see Kirillov \cite{kirillov} for the full statement.
\end{proof}

\begin{proposition}[Casimir functions]
\label{prop:casimirs}
A smooth function $F \in C^{\infty}(M)$ on a Poisson manifold $(M, \pi)$ is constant on the symplectic leaves if and only if $\{F, f\} = 0$ for all $f \in C^{\infty}(M)$. On the Lie-Poisson space $\mathfrak{g}^{*}$ these functions are exactly the coadjoint-invariant functions $F(\xi) = F(\operatorname{Ad}^{*}_{g} \xi)$ for all $g \in G$. For $\mathfrak{g} = \mathfrak{so}(3)$ the Casimir is $F(\xi) = |\xi|^{2}$, and its level sets are the symplectic leaves of \cref{ex:lie-poisson}.
\end{proposition}

\begin{proof}
The bracket $\{F, f\} = \pi(dF, df)$ vanishes for all $f$ if and only if $dF$ annihilates the image of $\pi^{\sharp}$, and the image of $\pi^{\sharp}$ spans the tangent spaces of the leaves. So $F$ has vanishing differential along the leaves, which on each connected leaf means $F$ is constant. On $\mathfrak{g}^{*}$ the condition $\{F, f\} = 0$ for all linear functions $f(\eta) = \langle \eta, x \rangle$ reads $\langle \xi, [\nabla F(\xi), x] \rangle = 0$ for all $x$, which is the infinitesimal form of coadjoint invariance. For $\mathfrak{so}(3)$ the invariant polynomials are generated by the quadratic form $|\xi|^{2}$, and \cref{ex:lie-poisson} identifies its level sets with the leaves.
\end{proof}

Casimir functions are the first integral data of Poisson dynamics: a Hamiltonian that is itself a Casimir generates no motion, and a function in involution with the Casimirs descends to a function on the leaf space.

\Cref{thm:kks} is the bridge from classical mechanics to the classification theory of Lie algebras. The symplectic leaves of the Lie-Poisson structure on $\mathfrak{g}^{*}$ are the coadjoint orbits, the orbits of a compact semisimple group are classified by combinatorial data of the Dynkin diagram, and Section 6 makes that classification precise.

\section{Global invariants of symplectic systems}

The classification content that survives Darboux's theorem is global.

\begin{theorem}[Moser stability]
\label{thm:moser-stability}
Let $M$ be a closed manifold and $\omega_t$, $t \in [0, 1]$, a smooth family of symplectic forms with $[\omega_t] \in H^{2}(M; \mathbb{R})$ independent of $t$. Then there is an isotopy $\varphi_t$ of $M$ with $\varphi_t^{*} \omega_t = \omega_0$ for all $t$.
\end{theorem}

\begin{proof}
Constancy of the cohomology class gives $\dot{\omega}_t = d \alpha_t$ for a smooth family of one-forms $\alpha_t$. Solve $\iota_{X_t} \omega_t = -\alpha_t$ and integrate $X_t$ to an isotopy $\varphi_t$ of the closed manifold $M$. The computation of \cref{lem:moser-ball} gives $\frac{d}{dt} \varphi_t^{*} \omega_t = 0$ without any support condition, so $\varphi_1^{*} \omega_1 = \omega_0$. The argument is due to Moser \cite{moser}.
\end{proof}

\begin{corollary}[Classification refines diffeomorphism and cohomology]
\label{cor:classification-data}
Let $f : M \to M'$ be a diffeomorphism of closed symplectic manifolds carrying $[\omega]$ to $[\omega']$. If there is a smooth path of symplectic forms $\omega_t$ in the constant class $[\omega]$ connecting $\omega$ to $f^{*} \omega'$, then $(M, \omega)$ and $(M', \omega')$ are symplectomorphic. Symplectomorphism classes therefore form a strictly finer partition than the pairs consisting of a diffeomorphism type and an orbit of $[\omega]$ under the diffeomorphism group.
\end{corollary}

The cohomology class $[\omega] \in H^{2}(M; \mathbb{R})$ is therefore a classifying invariant in the restricted sense of the series, together with the diffeomorphism invariants of $M$ and the action of $\operatorname{Diff}(M)$ on $H^{2}(M; \mathbb{R})$. For two-dimensional symplectic manifolds this is a complete classification.

\begin{example}[Surfaces]
\label{ex:surfaces}
A symplectic form on a closed surface is an area form, and the total area $\int_{M} \omega$ is a symplectomorphism invariant. Two closed oriented surfaces with area forms are symplectomorphic if and only if they are diffeomorphic and the areas agree. Classification here is classification of genus and area.
\end{example}

\begin{example}[Area forms on the sphere]
\label{ex:area-sphere}
Let $\sigma$ and $\sigma'$ be two area forms on $S^{2}$ with the same total area $\int_{S^{2}} \sigma = \int_{S^{2}} \sigma'$. Then $(S^{2}, \sigma)$ and $(S^{2}, \sigma')$ are symplectomorphic. The interpolation $\sigma_t = (1 - t) \sigma + t \sigma'$ consists of area forms of the same total area, hence symplectic forms with constant cohomology class in $H^{2}(S^{2}; \mathbb{R})$, and \cref{thm:moser-stability} above produces the isotopy. The classification of area forms on a fixed surface up to symplectomorphism is therefore the classification of total areas, in agreement with \cref{ex:surfaces}, and the theorem in action is Moser stability rather than any local analysis.
\end{example}

\begin{example}[Products of spheres]
\label{ex:product-spheres}
On $M = S^{2} \times S^{2}$ with area forms $\sigma_1$ and $\sigma_2$ of total area one on each factor, consider $\omega_{a, b} = a \sigma_1 \oplus b \sigma_2$ with $a, b > 0$. The cohomology class $[\omega_{a, b}] = a [\sigma_1] + b [\sigma_2]$ is a symplectomorphism invariant, and the diffeomorphism group of $S^{2} \times S^{2}$ acts on $H^{2}(M; \mathbb{R})$ by permuting the two factors. Hence $(M, \omega_{a, b})$ is symplectomorphic to $(M, \omega_{a', b'})$ if and only if $\{a, b\} = \{a', b'\}$ as unordered pairs. The classification is the unordered pair of areas, a two-dimensional global invariant with no local content.
\end{example}

Beyond the cohomology class, the standard global invariants are the characteristic classes of $M$: any symplectic manifold admits an $\omega$-compatible almost complex structure $J$, and the Chern classes $c_i(M, J)$ are independent of the choice of $J$. For closed four-manifolds these classes interact with deep rigidity phenomena, and no complete classification is claimed in this paper.

In dimension four, global symplectic classification refines smooth four-manifold topology and remains incomplete outside toric and product regimes. De Rham cohomology distinguishes the standard symplectic structures on $\mathbb{CP}^{2}$ with its Fubini-Study form, $T^{4}$ with a constant form, and the products of \cref{ex:product-spheres}, and \cref{thm:delzant} classifies the toric four-manifolds, including the one-point blowup of $\mathbb{CP}^{2}$, by polytopes. For general closed four-manifolds, symplectomorphism classification is finer than the diffeomorphism type together with the action of $\operatorname{Diff}(M)$ on $H^{2}(M; \mathbb{R})$, and distinguishing smooth structures that share these classical invariants uses gauge-theoretic and pseudoholomorphic invariants (Seiberg-Witten and Taubes-type invariants) that this paper does not develop.

The strongest global rigidity in the symplectic category is metric-free.

\begin{definition}[Symplectic capacity]
\label{def:capacity}
A symplectic capacity is a rule $c$ assigning to each symplectic manifold $(M^{2n}, \omega)$ a number $c(M, \omega) \in [0, +\infty]$ such that: (i) monotonicity holds, $c(M, \omega) \leq c(M', \omega')$ whenever a symplectomorphism embeds $(M, \omega)$ into $(M', \omega')$; (ii) conformality holds, $c(M, \lambda \omega) = |\lambda| c(M, \omega)$ for $\lambda \neq 0$; (iii) normalization holds, $c(B^{2n}(1)) = c(B^{2}(1) \times \mathbb{R}^{2n-2}) = \pi$ where $B^{2n}(1)$ is the open unit ball and $B^{2}(1)$ the open unit disc.
\end{definition}

\begin{proposition}[Gromov width]
\label{prop:gromov-width}
The Gromov width
\[
w_G(M, \omega) = \sup \{ \pi r^{2} : B^{2n}(r) \text{ embeds symplectically into } (M, \omega) \}
\]
is a symplectic capacity in the sense of \cref{def:capacity}.
\end{proposition}

\begin{proof}[Proof reference]
Monotonicity is immediate from composition of embeddings, and conformality from the scaling of the standard form. The normalization and the capacity axiom for disjoint unions of balls follow from the embedding theory of Gromov \cite{gromov-hol}; the width is the first capacity constructed.
\end{proof}

Gromov's nonsqueezing theorem is the rigidity statement that makes capacities genuine invariants rather than convenient notation.

\begin{theorem}[Gromov nonsqueezing]
\label{thm:nonsqueezing}
Let $B^{2n}(r)$ be the open ball of radius $r$ in $\mathbb{R}^{2n}$ and $B^{2}(R) \times \mathbb{R}^{2n-2}$ the cylinder of radius $R$. A symplectic embedding $B^{2n}(r) \hookrightarrow B^{2}(R) \times \mathbb{R}^{2n-2}$ exists only if $r \leq R$.
\end{theorem}

\begin{proof}[Proof reference]
The proof uses $J$-holomorphic curves for a suitable compatible almost complex structure and is due to Gromov \cite{gromov-hol}. The conclusion is the source of genuine global symplectic rigidity and of the capacity invariants.
\end{proof}

Nonsqueezing has no Riemannian analogue: a round ball embeds into a thin cylinder in ordinary Euclidean geometry at every scale. The invariant content of symplectic geometry is therefore both global and metric-free.

On open manifolds the situation reverses. By the $h$-principle for symplectic structures on open manifolds, every open manifold admits an exact symplectic form, and open symplectic manifolds are classified up to symplectomorphism by diffeomorphism type \cite{gromov-pdr}. Closed manifolds are rigid; open manifolds are flexible. Any classification theorem for classical systems must state which regime it addresses.

\section{Coadjoint orbits and homogeneous symplectic manifolds}

The homogeneous symplectic manifolds of classical mechanics are the coadjoint orbits of \Cref{thm:kks}, and their classification inherits the combinatorics of the Killing-Cartan theory of simple Lie algebras and the highest-weight theory of their representations.

\begin{definition}[Momentum map and homogeneous orbits]
\label{def:momentum}
Let $G$ act symplectically on $(M, \omega)$ with momentum map $J : M \to \mathfrak{g}^{*}$ characterized by $\langle dJ, x \rangle = \iota_{x_M} \omega$ for the fundamental vector fields $x_M$. The fibers and orbits of $J$ are the symmetry-level objects of the classical system, and coadjoint orbits in $\mathfrak{g}^{*}$ are the model homogeneous symplectic manifolds.
\end{definition}

\begin{theorem}[Coadjoint orbits of compact semisimple groups]
\label{thm:coadjoint-classification}
Let $G$ be compact, connected, and semisimple with complexification $G^{\mathbb{C}}$ and maximal torus $T$ with Lie algebra $\mathfrak{t}$. Every coadjoint orbit of $G$ meets $\mathfrak{t}^{*}$ in a single $W$-orbit, so the orbits are parameterized continuously by points $\xi$ of the closed positive Weyl chamber $\mathfrak{t}^{*}_{+}$. Each orbit is a flag manifold $G^{\mathbb{C}} / P_{\xi}$ where the parabolic $P_{\xi}$ is determined by the support of $\xi$, that is by the subset of Dynkin nodes on whose walls $\xi$ lies; regular $\xi$ gives full flag manifolds and singular $\xi$ gives partial flags. The symplectic form on the orbit is the Kirillov-Kostant-Souriau form of \Cref{thm:kks}. The dominant integral weights form the discrete sublattice $\Lambda_{+} \subset \mathfrak{t}^{*}_{+}$ that selects the integral, that is quantizable, orbits; those are the orbits carrying finite-dimensional irreducible representations by the Borel-Weil theorem.
\end{theorem}

\begin{proof}[Proof reference]
The Killing-Cartan classification of complex simple Lie algebras is the list of Dynkin diagrams $A_n$, $B_n$, $C_n$, $D_n$, $G_2$, $F_4$, $E_6$, $E_7$, $E_8$ \cite{humphreys}. The parameterization of coadjoint orbits by the positive Weyl chamber is the standard maximal-torus argument, and the identification of orbits with $G^{\mathbb{C}} / P_{\xi}$ is the complex-geometric form of the same statement \cite{kirillov}. The highest-weight theorem classifies the finite-dimensional irreducible representations of $\mathfrak{g}^{\mathbb{C}}$ by dominant integral weights \cite{humphreys}, and the Borel-Weil theorem realizes each such representation on the corresponding integral orbit. The paper uses these results as established background and reproduces none of the classification lists.
\end{proof}

\begin{example}[The spheres as coadjoint orbits]
\label{ex:sphere-orbit}
For $G = SU(2)$ the dual $\mathfrak{su}(2)^{*} \cong \mathbb{R}^{3}$, and the coadjoint orbits are the spheres $\{|\xi| = r\}$ of every radius $r > 0$ together with the degenerate orbit at the origin: a continuous one-parameter family, the Weyl chamber being the half-line $r \geq 0$. The Kirillov-Kostant-Souriau form of \Cref{thm:kks} on the sphere of radius $r$ is $1/r$ times the round area form, of total symplectic area $4 \pi r$. The integral orbits are those with $2r$ a nonnegative integer, and the Borel-Weil theorem attaches to the orbit of radius $r = j$ the spin-$j$ representation of dimension $2j + 1$. The example separates the two classification statements: the classical orbit family is continuous in $r$, and the representation labels form the discrete sublattice $r \in \tfrac{1}{2} \mathbb{Z}_{\geq 0}$.
\end{example}

The classification content of \cref{thm:coadjoint-classification} is finite-dimensional and combinatorial: Dynkin diagram nodes and dominant weights. The theorem classifies homogeneous symplectic manifolds under a group with transitive action, not arbitrary symplectic manifolds. The orbit method program, which seeks to extend this dictionary to general representations of general Lie groups through their coadjoint orbits, is not established at the level of an equivalence and is not used as a dependency here.

\begin{table}[t]
\centering
\small
\begin{tabular}{L{1.8cm}L{6.2cm}L{3.4cm}}
\toprule
Diagram & Complex simple Lie algebra & Dimension \\
\midrule
$A_n$ & $\mathfrak{sl}(n+1, \mathbb{C})$ & $n(n+2)$ \\
$B_n$ & $\mathfrak{so}(2n+1, \mathbb{C})$ & $n(2n+1)$ \\
$C_n$ & $\mathfrak{sp}(2n, \mathbb{C})$ & $n(2n+1)$ \\
$D_n$ & $\mathfrak{so}(2n, \mathbb{C})$ & $n(2n-1)$ \\
$G_2$ & exceptional algebra of type $G_2$ & $14$ \\
$F_4$ & exceptional algebra of type $F_4$ & $52$ \\
$E_6$ & exceptional algebra of type $E_6$ & $78$ \\
$E_7$ & exceptional algebra of type $E_7$ & $133$ \\
$E_8$ & exceptional algebra of type $E_8$ & $248$ \\
\bottomrule
\end{tabular}
\caption{The Killing-Cartan list of complex simple Lie algebras. The classification of homogeneous symplectic manifolds of \cref{thm:coadjoint-classification} inherits this list and adds, per diagram, the positive Weyl chamber of continuous orbit parameters and the dominant integral weights selecting the integral orbits.}
\label{tab:dynkin}
\end{table}

\Cref{tab:dynkin} is the classification content that flows into classical mechanics: for each simple algebra the coadjoint orbits form a family parameterized by the positive Weyl chamber of \cref{thm:coadjoint-classification}, the dominant integral weights select the integral sublattice of that chamber, and the symplectic geometry of each orbit is fixed by \Cref{thm:kks}. The exceptional diagrams show that the classification is not a uniform infinite family alone, and the dimensions record that the homogeneous symplectic manifolds attached to exceptional algebras are concrete finite-dimensional objects.

\section{Hamiltonian dynamics and integrable systems}

The dynamical layer of a classical system is the family of Hamiltonian flows. The classification of dynamics is far from complete, but the integrable case admits normal forms with explicit invariants and explicit obstructions to global classification.

\begin{definition}[Integrable system]
\label{def:integrable}
A Liouville integrable system is a symplectic manifold $(M^{2n}, \omega)$ with $n$ functions $H_1, \dots, H_n \in C^{\infty}(M)$ in involution, $\{H_i, H_j\} = 0$, and with $dH_1 \wedge \dots \wedge dH_n$ nonzero on a dense open subset of $M$.
\end{definition}

\begin{theorem}[Liouville-Arnold]
\label{thm:liouville-arnold}
Let $(M^{2n}, \omega, H_1, \dots, H_n)$ be a Liouville integrable system and let $M_c = \{ H_1 = c_1, \dots, H_n = c_n \}$ be a compact connected regular level set. Then $M_c$ is diffeomorphic to an $n$-torus $T^{n}$, and a neighborhood of $M_c$ in $M$ carries action-angle coordinates $(I, \theta)$ in which $\omega = \sum_{i} dI_i \wedge d\theta_i$ and the $H_i$ depend on the actions $I_i$ alone.
\end{theorem}

\begin{proof}[Proof reference]
The Hamiltonian flows of the $H_i$ commute and preserve $M_c$, giving a locally free $T^{n}$-action whose orbits fill $M_c$; compactness and connectedness make the action transitive. The action variables are the periods of $\omega$ over a basis of $H_1(M_c; \mathbb{Z})$, and the angle variables are coordinates on the fibers. The full proof appears in Arnold \cite{arnold}.
\end{proof}

\begin{proposition}[Action variables are periods]
\label{prop:periods}
In the action-angle coordinates of \cref{thm:liouville-arnold}, the action variables are the periods of the action one-form $\lambda$ with $d\lambda = \omega$ over a basis $\gamma_1, \dots, \gamma_n$ of $H_1(M_c; \mathbb{Z})$:
\[
I_j = \frac{1}{2\pi} \oint_{\gamma_j} \lambda.
\]
The value depends on the choice of primitive $\lambda$: two primitives differ by a closed one-form, and the resulting shift of the actions is the period vector of that form, a vector of $H^{1}(M_c; \mathbb{R}) \cong \mathbb{R}^{n}$. Once $\lambda$ is fixed, the angle variables are fiberwise coordinates normalized so that $\omega = \sum_j dI_j \wedge d\theta_j$.
\end{proposition}

\begin{proof}
On a neighborhood of $M_c$ the form $\omega$ is exact, $\omega = d\lambda$, and the $n$ commuting flows of the $H_i$ generate a torus action. The periods of $\lambda$ over the cycles $\gamma_j$ are constant on the base of the fibration because the cycles are covariantly constant under the flows, and the identity $I_j = \frac{1}{2\pi} \oint_{\gamma_j} \lambda$ is the normalization that yields $\omega = \sum_j dI_j \wedge d\theta_j$. Replacing $\lambda$ by $\lambda + \eta$ with $\eta$ closed shifts each $I_j$ by $\frac{1}{2\pi} \oint_{\gamma_j} \eta$, and those shifts range over all of $\mathbb{R}^{n}$.
\end{proof}

Action-angle variables give a local decomposition of an integrable system into $n$ one-degree-of-freedom systems. Global action-angle coordinates need not exist: the period lattice of the torus fibration can have monodromy.

\begin{proposition}[Monodromy obstruction]
\label{prop:monodromy}
There exist integrable Hamiltonian systems whose regular compact fibers are tori and which admit no global action-angle coordinates; the obstruction is the monodromy representation of $\pi_1$ of the base of the fibration acting on the period lattice $H_1(T^{n}; \mathbb{Z})$.
\end{proposition}

\begin{proof}[Proof reference]
Duistermaat \cite{duistermaat} computes the monodromy of the period bundle for integrable systems with focus-focus singularities, and the spherical pendulum is the standard example: parallel transport of a fiber around a critical value returns the fiber with its lattice mapped by a nontrivial unipotent matrix. Global action-angle coordinates would trivialize the period bundle, so nontrivial monodromy obstructs them.
\end{proof}

\begin{example}[Spherical pendulum]
\label{ex:pendulum}
The spherical pendulum on $T^{*} S^{2}$ with Hamiltonian $H = \tfrac{1}{2} (p_{\theta}^{2} + p_{\varphi}^{2} / \sin^{2}\theta) - \cos \theta$ is integrable with the vertical angular momentum $p_{\varphi}$ as second integral. Regular compact fibers are two-tori, and the system has one focus-focus critical point. Parallel transport of the period lattice around the critical value acts on $H_1(T^{2}; \mathbb{Z})$ by the unipotent matrix $\begin{pmatrix} 1 & 1 \\ 0 & 1 \end{pmatrix}$. The local decomposition of \cref{thm:liouville-arnold} holds near every regular fiber, and no global decomposition into action-angle pairs exists on the complement of the critical value.
\end{example}

\begin{example}[Euler top]
\label{ex:euler-top}
The free rigid body is the Hamiltonian system on the coadjoint orbit $\mathcal{O} \subset \mathfrak{so}(3)^{*}$ of \cref{ex:lie-poisson} with Hamiltonian $H(\xi) = \tfrac{1}{2} (\xi_1^{2} / I_1 + \xi_2^{2} / I_2 + \xi_3^{2} / I_3)$ for positive moments of inertia $I_i$. The Casimir $|\xi|^{2}$ is a second integral in involution with $H$, so the system is integrable on each sphere $|\xi|^{2} = r^{2}$. The regular compact fibers are the intersections of the energy ellipsoids with the momentum spheres, the trajectories are the Euler-Poinsot curves on those spheres, and \cref{thm:liouville-arnold} applies at every regular fiber. The example lives simultaneously in the homogeneous symplectic geometry of Section 6 and in the integrable dynamics of this section: its state space is a coadjoint orbit, its invariant is the Casimir, and its local normal form is action-angle.
\end{example}

Monodromy is the first genuine obstruction in this paper to decomposition: the local decomposition of \cref{thm:liouville-arnold} into one-degree-of-freedom factors is a statement about a neighborhood of one fiber, and \Cref{prop:monodromy} exhibits integrable systems that do not decompose globally. Stability of integrable dynamics is likewise regime-restricted.

\begin{theorem}[Nekhoroshev estimate]
\label{thm:nekhoroshev}
Let $H = H_0 + \varepsilon H_1$ be a steep integrable Hamiltonian system with $n$ degrees of freedom and let $H_0(I)$ be the integrable part in action variables. There are positive constants $c$, $a$, and $b$ depending on the system such that, for $\varepsilon$ small, every trajectory satisfies
\[
\| I(t) - I(0) \| \leq c \varepsilon^{b}
\qquad \text{for all } 0 \leq t \leq \exp(c \varepsilon^{-a}).
\]
The bound is on the drift of the action variables, not on the energy, which is conserved exactly.
\end{theorem}

\begin{proof}[Proof reference]
The estimate is due to Nekhoroshev \cite{nekhoroshev}. Steepness is the geometric condition on $H_0$ under which the normal form of the flow is integrable to high order, and it prevents Arnold diffusion across the resonance planes of action space. The exponential time scale follows from that normal form. The theorem is a statement about the action drift of perturbed integrable systems over exponentially long times.
\end{proof}

\section{Classical statistical systems and information geometry}

The classical probability family has one uniqueness theorem in the whole inventory of classical classification results. Chentsov's theorem singles out the Fisher metric as the unique metric monotone under stochastic maps, and the quantum analogue of that metric is parametric rather than unique.

\begin{definition}[Fisher metric]
\label{def:fisher}
On the open simplex $\Delta^{\circ} \subset \mathbb{R}^{n}$ the Fisher metric is the Riemannian metric whose value at $p$ on tangent vectors $u, v$ (with $\sum_i u_i = \sum_i v_i = 0$) is
\[
g_{p}(u, v) = \sum_{i=1}^{n} \frac{u_i v_i}{p_i}.
\]
On a smooth statistical model $\theta \mapsto p_{\theta}$ the Fisher metric is the pullback of this metric, with components $g_{jk}(\theta) = \sum_i \frac{1}{p_i} \partial_j p_i \, \partial_k p_i$.
\end{definition}

\begin{example}[Fisher metric on three outcomes]
\label{ex:fisher-three}
For $p = (\tfrac{1}{2}, \tfrac{1}{3}, \tfrac{1}{6})$ and the tangent vector $u = (1, -1, 0)$ the Fisher metric evaluates to $g_p(u, u) = \frac{1}{1/2} + \frac{1}{1/3} = 5$. At the uniform point $p = (\tfrac{1}{3}, \tfrac{1}{3}, \tfrac{1}{3})$ the same vector gives $g_p(u, u) = 6$. The metric therefore weights directions by the rarity of the outcomes they move, and the example is the two-dimensional case of \cref{def:fisher}.
\end{example}

\begin{definition}[Monotone metric]
\label{def:monotone}
A Riemannian metric $g$ on $\Delta^{\circ}$ is monotone under stochastic maps if for every column-stochastic matrix $T$ and every $p$, the pullback $T^{*} g_{Tp}$ at $p$ satisfies $T^{*} g_{Tp} \leq g_{p}$ as quadratic forms. Monotonicity is the requirement that coarse-graining cannot increase distinguishability.
\end{definition}

\begin{theorem}[Chentsov]
\label{thm:chentsov}
Let $g$ be a family of Riemannian metrics $g^{(n)}$ on the open simplices $\Delta^{\circ} \subset \mathbb{R}^{n}$ for all $n \geq 1$, compatible with Markov embeddings (pullback along every sufficient statistic is an isometry) and monotone under stochastic maps in the sense of \cref{def:monotone}. Then one constant $c > 0$ satisfies $g^{(n)} = c \, g_{\mathrm{Fisher}}^{(n)}$ for every $n$, where $g_{\mathrm{Fisher}}^{(n)}$ is the Fisher metric of \cref{def:fisher}. The cross-dimension compatibility is a hypothesis: monotonicity on a single fixed simplex does not determine the metric up to scale.
\end{theorem}

\begin{proof}[Proof structure]
Monotonicity forces equality along sufficient statistics, since a sufficient statistic admits a stochastic retraction and monotonicity in both directions along the retraction. Invariance under the sufficient statistics of the simplex reduces the metric to a family $g_p(u, v) = \sum_i \frac{u_i v_i}{p_i} f(p)$ compatible with all embeddings of lower-dimensional simplices, and the compatibility across dimensions forces $f$ to be constant. The complete proof is in Chentsov \cite{chentsov}; the structure stated here is the part that fixes the metric up to scale.
\end{proof}

\begin{lemma}[Equality along sufficient statistics]
\label{lem:sufficiency}
Let $g$ be a monotone metric on $\Delta^{\circ}$ and let $T$ be a stochastic map with a stochastic left inverse $S$, that is $S T = \mathrm{Id}$. Then $T$ is an isometric embedding for $g$, and for every tangent vector $u$ at $p$,
\[
g_{p}(u, u) = g_{Tp}(Tu, Tu).
\]
\end{lemma}

\begin{proof}
Monotonicity of $g$ for $T$ gives $g_{p}(u, u) \geq g_{Tp}(Tu, Tu)$, and monotonicity for $S$ gives
\[
g_{Tp}(Tu, Tu) \geq g_{p}(S T u, S T u) = g_{p}(u, u).
\]
The two inequalities sandwich, so equality holds and $T$ preserves $g$ exactly. This is the equality case that \cref{thm:chentsov} uses to reduce the classification to the invariant metrics under the sufficient statistics of the simplex.
\end{proof}

\begin{example}[Isometries of the Fisher metric]
\label{ex:reparameterization}
Under the square-root map $x_i = \sqrt{p_i}$ the open simplex $\Delta^{\circ}$ maps to the open positive orthant of the unit sphere, and the Fisher metric becomes four times the round metric of that sphere: $dx_i = u_i / (2 \sqrt{p_i})$ gives $\sum_i dx_i^{2} = \tfrac{1}{4} g_{p}(u, u)$. The isometries of the round sphere preserving the positive orthant are the coordinate permutations, so the isometries of the Fisher metric are exactly the relabelings of the outcome set. Stochastic maps that are not invertible on the model are contractions rather than isometries (\cref{def:monotone}), and \cref{lem:sufficiency} identifies the case of equality. The example shows concretely how the preserved layers of \cref{def:canonical} separate exact equivalence from coarse-graining.
\end{example}

\begin{corollary}[Fisher metric as classifying invariant]
\label{cor:fisher-invariant}
The Fisher metric, up to positive scale, is a classifying invariant of the classical statistical family under stochastic morphisms: it is the unique metric compatible with the coarse-graining order.
\end{corollary}

\begin{remark}[Connections beside the metric]
\label{rem:connections}
The Fisher metric is the unique monotone Riemannian object, but the statistical manifold carries more structure than its metric. The $\alpha$-connections of Amari \cite{amari} are a one-parameter family of affine connections dual to each other, $\alpha$ and $-\alpha$, with $\alpha = 0$ the Levi-Civita connection of the Fisher metric, and the exponential and mixture families are the $\alpha = 1$ and $\alpha = -1$ flat coordinates. The uniqueness theorem of Chentsov governs the metric alone; the connection family is parametric, and no statement of this paper transfers metric uniqueness to the connections.
\end{remark}

\begin{proposition}[Product of statistical models]
\label{prop:stat-product}
Let $p \in \Delta^{\circ} \subset \mathbb{R}^{n}$ and $q \in \Delta^{\circ} \subset \mathbb{R}^{m}$ be probability vectors and let $p \otimes q \in \Delta^{\circ} \subset \mathbb{R}^{nm}$ be their product. Then the Fisher metric of the product is the direct sum of the factors:
\[
g_{p \otimes q}(u \otimes q + p \otimes v, u \otimes q + p \otimes v) = g_{p}(u, u) + g_{q}(v, v)
\]
for tangent vectors $u$ at $p$ and $v$ at $q$.
\end{proposition}

\begin{proof}
Write the tangent vector at $p \otimes q$ in the product chart. The probability of the pair $(i, j)$ is $p_i q_j$, and the displacement in that coordinate is $u_i q_j + p_i v_j$. The Fisher sum becomes
\[
\sum_{i, j} \frac{(u_i q_j + p_i v_j)^{2}}{p_i q_j}
= \sum_{i, j} \frac{u_i^{2} q_j}{p_i} + 2 \sum_{i, j} u_i v_j + \sum_{i, j} \frac{p_i v_j^{2}}{q_j}
= g_{p}(u, u) + 0 + g_{q}(v, v),
\]
where the cross term vanishes because $\sum_i u_i = \sum_j v_j = 0$.
\end{proof}

\Cref{prop:stat-product} is the compositional content of the statistical family: products of systems are products of metrics, and the classifying invariant of a product is the direct sum of the classifying invariants of the factors. The parallel statement for symplectic products is \cref{def:product-composition} and the decomposition analysis of Section 9.

The uniqueness statement is classical in both senses of the word. The quantum analogue fails.

\begin{theorem}[Petz-Sudar parametric classification]
\label{thm:petz-sudar}
Monotone metrics on the space of positive definite density matrices, defined by monotonicity under completely positive trace-preserving maps, are classified by operator monotone functions $f : (0, \infty) \to (0, \infty)$ with $f(1) = 1$ and the symmetry $f(t) = t f(1/t)$ that makes the bilinear form symmetric. The family of such metrics is parametric and infinite, and no constant multiple of a single metric exhausts it.
\end{theorem}

\begin{proof}[Proof reference]
Petz and Sudar \cite{petz-sudar} classify quantum monotone metrics by operator monotone functions. The metric attached to such a function $f$ is $g_{f, \rho}(A, B) = \operatorname{tr} \big( A \, \mathbf{J}_{\rho, f}^{-1}(B) \big)$ where $\mathbf{J}_{\rho, f} = \mathcal{R}_{\rho} f(\mathcal{L}_{\rho} \mathcal{R}_{\rho}^{-1})$ and $\mathcal{L}_{\rho}$ and $\mathcal{R}_{\rho}$ are left and right multiplication by the state $\rho$; the inverse operator carries the $\rho^{-1}$ scaling that reproduces the classical Fisher metric in the commutative case. The paper uses this classification as the contrast that blocks any transfer of Chentsov uniqueness to the quantum case.
\end{proof}

\Cref{thm:petz-sudar} is a warning about scope. Classical uniqueness in the classification of monotone metrics may not be extended to the quantum family by dependency or analogy: the quantum classification is parametric, not unique. Section 11 returns to the boundary between the two.

\section{Decomposition and restricted classification}

Complex classical systems are built from simpler ones by products, reductions, and coupling. Irreducibility is relative to the product composition fixed below, and two restricted classification theorems survive for global symplectic objects.

\begin{definition}[Product composition]
\label{def:product-composition}
The product composition of classical systems is defined componentwise. For symplectic systems, $(M_1 \times M_2, \omega_1 \oplus \omega_2)$ with $\omega_1 \oplus \omega_2 = \operatorname{pr}_1^{*} \omega_1 + \operatorname{pr}_2^{*} \omega_2$ and Hamiltonians $H_1 + H_2$. For Poisson systems, the direct sum of bivectors. For statistical systems, the product of simplices with product measures and product stochastic maps. The composition data $C$ of \cref{def:irreducible} is this product.
\end{definition}

\begin{proposition}[Irreducibility of symplectic surfaces]
\label{prop:surface-irreducible}
Every closed symplectic surface of genus $g \geq 0$ is $C$-irreducible for the product composition.
\end{proposition}

\begin{proof}
A product decomposition $(M_1 \times M_2, \omega_1 \oplus \omega_2)$ of a $2$-dimensional symplectic manifold has $\dim M_1 + \dim M_2 = 2$ with both factors even-dimensional and symplectic, hence of dimension $0$ or $2$. Positive dimension forces one factor to be the empty product.
\end{proof}

\begin{proposition}[Symplectic reduction]
\label{prop:reduction}
Let a compact Lie group $G$ act on a symplectic system $(M, \omega)$ by symplectomorphisms with momentum map $J$. For a regular value $\mu$ of $J$ at which the isotropy group $G_{\mu}$ acts freely and properly on $J^{-1}(\mu)$, the reduced space $J^{-1}(\mu) / G_{\mu}$ carries a unique symplectic form $\omega_{\mu}$ such that the pullback along $J^{-1}(\mu) \to J^{-1}(\mu)/G_{\mu}$ agrees with $\omega|_{J^{-1}(\mu)}$, and the reduced dynamics of an invariant Hamiltonian is Hamiltonian for $\omega_{\mu}$. The reduction is a decomposition construction on classical systems, and its output is again a classical system of \cref{def:classical-system}.
\end{proposition}

\begin{proof}[Proof reference]
The construction and its compatibility with dynamics are the symplectic reduction theorem of Marsden and Weinstein \cite{marsden-weinstein}. Regularity of $\mu$ gives the manifold structure of $J^{-1}(\mu)$ and of the quotient by the isotropy group $G_{\mu}$, and the uniqueness of $\omega_{\mu}$ is the statement that $\ker (\omega|_{J^{-1}(\mu)})$ is spanned by the infinitesimal action directions.
\end{proof}

Reduction is the mechanism by which symmetry data enters the composition layer of a classical system: it removes gauge directions and lowers dimension while preserving the symplectic structure. Existence of decompositions is therefore abundant in the presence of symmetry. Decompositions are generally non-unique.

\begin{example}[Reduction of the plane]
\label{ex:reduction-sphere}
Let $U(1)$ act on $\mathbb{C}^{2} \cong \mathbb{R}^{4}$ with its standard symplectic form by $e^{i\theta} \cdot z = e^{i\theta} z$, with momentum map $J(z) = \tfrac{1}{2} (|z_1|^{2} + |z_2|^{2})$. For $\mu > 0$ the level set $J^{-1}(\mu)$ is the three-sphere of radius $\sqrt{2\mu}$ in $\mathbb{C}^{2}$, and the reduced space $J^{-1}(\mu) / U(1)$ is $\mathbb{CP}^{1}$ with the Fubini-Study symplectic form normalized to total area $2\pi \mu$; the quotient identifies the Hopf fibers of the level set. The reduced dynamics of any rotation-invariant Hamiltonian is Hamiltonian on that sphere. The example is the elementary case of \cref{prop:reduction}: a four-dimensional symplectic system with a one-dimensional symmetry reduces to a two-dimensional one, and the reduction is a decomposition step in the sense of \cref{def:product-composition}.
\end{example}

\begin{proposition}[Reduction of products]
\label{prop:reduction-products}
Let $G$ act on a symplectic system $(M_1, \omega_1)$ with momentum map $J_1$, let $(M_2, \omega_2)$ carry the trivial $G$-action, and let $\mu$ be a regular value of $J_1$. Then the reduced space of the product $(M_1 \times M_2, \omega_1 \oplus \omega_2)$ at $\mu$ is the product of the reduced space of $M_1$ at $\mu$ with $M_2$:
\[
\big( J_1^{-1}(\mu) / G_{\mu} \big) \times M_2,
\]
with reduced form $\omega_{\mu} \oplus \omega_2$. Reduction commutes with product composition along the factor that carries no symmetry.
\end{proposition}

\begin{proof}
The momentum map of the product action is $J = J_1 \circ \operatorname{pr}_1$, so $J^{-1}(\mu) = J_1^{-1}(\mu) \times M_2$ and the isotropy group $G_{\mu}$ acts only on the first factor. The quotient is therefore the product of the quotient with $M_2$, and the reduced form is the direct sum because the symplectic form of the product splits along the same factors. Uniqueness of the reduced form from \cref{prop:reduction} finishes the argument.
\end{proof}

\Cref{prop:reduction-products} states the compatibility between the two constructions of this section, product composition and symmetry reduction. What it does not state is any uniqueness for decomposition: the factors of a product can themselves be reducible, and the reduced factor $J_1^{-1}(\mu) / G_{\mu}$ need not be irreducible even when $M_1$ is.

\begin{remark}[Uniqueness of decomposition]
\label{rem:uniqueness}
No general uniqueness theorem for decomposition of classical systems is claimed. The local decomposition of integrable systems in \cref{thm:liouville-arnold} is unique in the sense of action-angle data near a regular fiber, and \cref{prop:monodromy} shows that even this restricted uniqueness fails to globalize. Existence and uniqueness of decomposition are realistic goals only in restricted subclasses, and the paper states its restricted theorems with that limitation visible.
\end{remark}

The first restricted global classification theorem in the symplectic category concerns toric manifolds.

\begin{definition}[Toric symplectic manifold]
\label{def:toric}
A compact connected toric symplectic manifold is a symplectic manifold $(M^{2n}, \omega)$ of dimension $2n$ with an effective Hamiltonian action of the torus $T^{n}$ whose momentum map $J : M \to \mathbb{R}^{n}$ is proper.
\end{definition}

\begin{theorem}[Delzant]
\label{thm:delzant}
The momentum image $\Delta = J(M) \subset \mathbb{R}^{n}$ of a compact connected toric symplectic manifold is a convex rational Delzant polytope: convex, rational, simple, and Delzant (the normal vectors of the facets meeting at each vertex form a $\mathbb{Z}$-basis of $\mathbb{Z}^{n}$). Two compact connected toric symplectic manifolds are equivariantly symplectomorphic up to an automorphism of the acting torus $T^{n}$ if and only if their Delzant polytopes are related by an element of $GL(n; \mathbb{Z}) \ltimes \mathbb{R}^{n}$. When the torus action is fixed pointwise the equivalence narrows to translations of the polytope in $\mathbb{R}^{n}$ alone. Conversely, every Delzant polytope arises from such a manifold.
\end{theorem}

\begin{proof}[Proof reference]
Delzant \cite{delzant}. The polytope is the complete invariant: equivariant symplectic classification of toric manifolds is classification of Delzant polytopes. It is the model of a restricted classification theorem with a finite-dimensional combinatorial invariant, the exact analogue on the global symplectic side of the Dynkin list of \cref{thm:coadjoint-classification}.
\end{proof}

\begin{example}[Toric surfaces]
\label{ex:toric-surfaces}
In dimension two the Delzant polygons are the polygons with rational edge slopes meeting in lattice bases. The moment polygon of $(S^{2}, r \omega_{\text{area}})$ is an interval of length $r$, and the moment polygon of the one-point blowup of $(\mathbb{CP}^{2}, \omega)$ is a triangle with one corner cut. Two toric surfaces are equivariantly symplectomorphic if and only if their polygons coincide up to lattice equivalence, so the classification is a combinatorial list of polygons.
\end{example}

\begin{table}[t]
\centering
\small
\begin{tabular}{L{4.2cm}L{4.6cm}L{4.6cm}}
\toprule
Class of classical systems & Classifying invariant & Scope of the classification \\
\midrule
Local symplectic manifolds & none (Darboux) & complete at every dimension and trivial \\
Local Poisson manifolds & rank $2k$ and transverse factor & local normal form at every point \\
Coadjoint orbits of compact semisimple $G$ & positive Weyl chamber parameter and flag type & homogeneous symplectic manifolds, integral orbits by weights \\
Toric symplectic manifolds & Delzant polytope & compact connected manifolds with $T^{n}$-action \\
Closed symplectic surfaces & genus and total area & dimension two, complete \\
Classical statistical models & Fisher metric up to scale & monotone metrics under stochastic maps \\
Integrable systems near a regular fiber & action angles and period lattice & local, obstructed globally by monodromy \\
\bottomrule
\end{tabular}
\caption{The classification inventory of classical systems. Each row is a complete theorem inside its stated scope, and no row claims more than that scope.}
\label{tab:inventory}
\end{table}

\Cref{tab:inventory} is the classification inventory the evidence supports. The rows are disjoint regimes, the invariants are finite or parametric data in every case, and the empty row is the global classification of closed symplectic manifolds beyond surfaces and the toric subclass.

\section{Computational investigation}

Three computational experiments and the executable taxonomy models accompanying the paper illustrate the normal forms of Sections 3 to 8 and supply checked examples of the invariant computations. Computational evidence is not proof, and the theorems stand on their proofs and citations rather than on these runs.

The Darboux chart experiment takes a perturbed two-form $\omega = \omega_0 + d\alpha$ on a ball in $\mathbb{R}^{4}$ and integrates the Moser homotopy of \cref{lem:moser-ball}, producing a diffeomorphism that pulls $\omega$ back to $\omega_0$. The residual $\|\varphi^{*} \omega - \omega_0\|$ is computed and reported. On the tested instance (quadratic perturbation with scale $0.05$, twelve sample points, four hundred Runge-Kutta steps, complex-step Jacobians at step $10^{-20}$) the maximum entrywise residual $\|J^{T} \omega(\varphi(x_0)) J - \omega_0(x_0)\|_{\max}$ is $2.4 \times 10^{-15}$, at double precision floor. The experiment evidences the constructive content of the proof of \cref{thm:darboux}: the homotopy exists as an ordinary differential equation and its numerical integration is stable on the tested examples.

The rank stratification experiment applies the Weinstein splitting of \cref{thm:weinstein} to the Lie-Poisson structure of $\mathfrak{so}(3)^{*}$. The program computes the rank of the Poisson tensor at sample points, extracts the symplectic leaf dimension at each point, and verifies the rank stratification of \cref{ex:lie-poisson}: rank two on the spheres of radii $0.5$, $1.0$, and $2.7$ with a two-dimensional symplectic factor and a one-dimensional transverse factor, and rank zero at the origin with a three-dimensional transverse factor. The experiment evidences the rank stratification claim in one explicit model.

The Fisher monotonicity experiment checks the monotonicity of the Fisher metric under stochastic maps, the hypothesis of \cref{thm:chentsov}. The program computes $g_p$ and the pullback $T^{*} g_{Tp}$ for random column-stochastic matrices $T$ and verifies $T^{*} g_{Tp} \leq g_{p}$ by comparing the quadratic forms. On two hundred sampled trials with five outcomes, the minimum eigenvalue of $g_p - T^{*} g_{Tp}$ is $-5.6 \times 10^{-15}$, the round-off signature of a positive semidefinite difference, and the minimum slack $g_p(u, u) - g_{Tp}(Tu, Tu)$ over ten thousand random tangent vectors is $5.4 \times 10^{-2}$. The tangent vectors were drawn as Gaussian vectors projected to the tangent space ($\sum_i u_i = 0$) without normalization, so the strictly positive slack reflects that the samples miss the near-null directions of the difference matrix. The experiment evidences the monotonicity direction of Chentsov's theorem on finite samples. It does not evidence the uniqueness direction, and no claim of uniqueness rests on the computation.

The Haskell models in \texttt{src/vol-05-classical-systems/} declare instances of the shared taxonomy classes for symplectic systems, Poisson systems, Hamiltonian systems, and classical statistical systems, with names mirroring the definitions above and the companion verification targets. They compute witness data for the normal forms: standard symplectic matrices, rank splits of Poisson tensors, the Kirillov-Kostant-Souriau form on a two-dimensional orbit, and the Fisher metric on probability vectors. The models are executable, not machine-checked proofs. Appendix \ref{app:code} maps each computational claim to its file and function.

The core of the first experiment is short enough to reproduce. The perturbation scale is $\texttt{EPS} = 0.05$, \texttt{alpha} is the one-form with quadratic coefficients whose exterior derivative perturbs $\omega_0$, and \texttt{flow\_time1} integrates the Moser field with fourth-order Runge-Kutta from $t = 0$ to $t = 1$. The Moser field is the pointwise solution of a linear system: with $\iota_{X_t} \omega_t = -\alpha_t$ and the matrix convention $M_{ij} = \omega_t(e_i, e_j)$, the contraction reads $M X = \alpha_t$, so the routine solves $M X = a$ with $a = \texttt{EPS} \cdot \alpha(x)$.

\begin{lstlisting}[caption={Core of the Darboux chart experiment (darboux\_chart.py).},label=lst:darboux]
def moser_field(x, t):
    # solve omega_t(x) X = alpha(x), the matrix form of
    # iota_X omega_t = -alpha with M skew-symmetric
    M = omega_t(x, t)
    a = EPS * alpha(x)
    return np.linalg.solve(M, a)

def test_chart_pullback(n_samples=12, h=1e-20):
    worst = 0.0
    for _ in range(n_samples):
        x0 = rng.normal(scale=0.3, size=DIM)
        x1 = flow_time1(x0)
        J = np.zeros((DIM, DIM))
        for k in range(DIM):
            e = np.zeros(DIM, dtype=complex)
            e[k] = 1j * h
            J[:, k] = np.imag(flow_time1(x0.astype(complex) + e)) / h
        resid = J.T @ omega(x1) @ J - omega_0(x0)
        worst = max(worst, np.max(np.abs(resid)))
    return worst
\end{lstlisting}

\Cref{lst:darboux} is the complete pullback test: the flow is integrated with fourth-order Runge-Kutta, the Jacobian of the time-one map is taken by complex-step differentiation so that the residual is not dominated by difference truncation, and the pullback form is compared to $\omega_0$ at the base point $x_0$. The step $h = 10^{-20}$ is representable in IEEE double precision, whose smallest normal number is near $10^{-308}$, so the complex-step quotient does not underflow on the tested platform. The other two experiments follow the same pattern, a direct invariant computation checked against the predicted inequality or rank.

\section{Limitations and open questions}

The classification results above hold exactly in the regimes of the established mathematics they rest on.

Global classification of closed symplectic manifolds is open. The invariants of Section 5 classify in restricted regimes: surfaces by area and genus, toric manifolds by Delzant polytopes, homogeneous manifolds by weight data. Beyond these regimes the diffeomorphism classification of the underlying manifold is itself incomplete in dimension four and above, and the symplectic classification contains it. No claim of the paper addresses that gap.

The classification of Poisson structures beyond local models is open. The Weinstein splitting theorem classifies the local type at each point, and the leaf foliation organizes the global object, but the topology of leaf spaces, the structure of singular leaves, and the classification of Poisson manifolds with prescribed leaf space are not addressed by the local theory. This paper makes no claim about them.

Decomposition uniqueness is open in general. \Cref{prop:monodromy} exhibits the obstruction inside one of the best behaved subclasses: action-angle monodromy prevents global decomposition of integrable systems whose local decomposition is complete. Characterizing the subclasses with unique decomposition is a genuine gap in the classical theory.

The bridge between classical and quantum families is conjectural. Deformation quantization associates to a Poisson manifold a family of noncommutative algebras, and it is one of the candidate constructions connecting the symplectic family to the operator-algebra family. No equivalence theorem connects the two families, and the paper treats the connection as a programmatic conjecture: every statement crossing the classical and quantum boundary is conditional on that conjecture and is marked as such. The Petz-Sudar classification of \Cref{thm:petz-sudar} shows concretely that uniqueness phenomena do not transfer: the classical uniqueness of the Fisher metric has a parametric quantum shadow.

The equivalence relation of the series is not fixed here. This paper classifies under mathematical equivalence of \cref{def:morphisms}, which preserves the symplectic form, the Poisson bracket, or the statistical structure exactly. Physical equivalence for classical systems must be coarser, and identifying two classical systems as physically equivalent requires naming the preserved layers and the observational content. The paper does neither, and the classification statements above are statements about mathematical objects.

The computational experiments of Section 10 demonstrate that the normal forms are computable on examples; no claim of the paper depends on them.

The open questions the classical sector poses to the series are the following.

\begin{enumerate}
\item Which global invariants beyond $[\omega]$, the characteristic classes, and the capacities complete the classification of closed symplectic manifolds in dimension four? The inventory of Section 5 is partial in that regime and complete nowhere else.
\item Which subclasses of classical systems admit unique decomposition into $C$-irreducible factors? The integrable subclass admits local decomposition and fails global decomposition by monodromy, and the boundary between the two behaviors is not characterized.
\item What is the classification of Poisson structures with prescribed leaf space? The Weinstein splitting theorem classifies the local type and leaves the global organization of singular leaves open.
\item Does deformation quantization connect the symplectic family to the operator-algebra family in any sense stronger than a programmatic correspondence? Every statement of this paper that crosses that boundary is conditional on the conjecture.
\item Which coarsenings of mathematical equivalence are the physically correct equivalences for classical systems? The answer must name the preserved layers and the observational content, and the paper fixes neither.
\end{enumerate}

\section{Conclusion}

Classical physical systems admit classification exactly where the invariants are finite, parametric, or combinatorial, and the paper has exhibited each type of success in this domain. Local symplectic classification is complete and trivial (Darboux), and the classification content is global. Local Poisson classification is a rank stratification with a transverse factor (Weinstein). Homogeneous symplectic classification is the Dynkin and highest-weight theory of Lie algebras (coadjoint orbits). Global classification succeeds for toric manifolds (Delzant polytopes) and for surfaces (genus and area). The classical statistical family carries a unique monotone metric up to scale (Chentsov), and the quantum analogue is parametric rather than unique (Petz-Sudar).

The negative results are theorems of the same standing. There are no local symplectic invariants. Global action-angle coordinates fail by monodromy. Classical uniqueness phenomena do not extend to the quantum family. These are content, not caveats: they delimit the regimes in which classification theorems can be expected, and they block the false transfers that analogy would suggest.

The classification inventory of \Cref{tab:inventory} is complete for the regimes it names and silent elsewhere, and the next classical results will come either from widening a regime (which subclasses of integrable systems decompose uniquely) or from deepening an obstruction (what exactly monodromy forbids beyond global action-angle coordinates). The evidence supports restricted classification theorems plus explicit obstructions in the classical domain. It does not support a universal periodic table of classical systems, and the paper does not claim one.

\begin{thebibliography}{14}

\bibitem{amari}
S. Amari,
\emph{Information Geometry and Its Applications},
Springer, Tokyo, 2016.

\bibitem{arnold}
V. I. Arnold,
\emph{Mathematical Methods of Classical Mechanics},
Graduate Texts in Mathematics 60, Springer, New York, 1978.

\bibitem{chentsov}
N. N. Chentsov,
\emph{Statistical Decision Rules and Optimal Inference},
Translations of Mathematical Monographs 53, American Mathematical Society, Providence, 1982.

\bibitem{delzant}
T. Delzant,
Hamiltoniens p\'{e}riodiques et images convexes de l'application moment,
\emph{Bulletin de la Soci\'{e}t\'{e} Math\'{e}matique de France} \textbf{116} (1988), 315 to 339.

\bibitem{duistermaat}
H. H. Duistermaat,
On global action-angle coordinates,
\emph{Communications on Pure and Applied Mathematics} \textbf{33} (1980), 687 to 706.

\bibitem{gromov-hol}
M. Gromov,
Pseudo holomorphic curves in symplectic manifolds,
\emph{Inventiones Mathematicae} \textbf{82} (1985), 307 to 347.

\bibitem{gromov-pdr}
M. Gromov,
\emph{Partial Differential Relations},
Ergebnisse der Mathematik und ihrer Grenzgebiete 9, Springer, Berlin, 1986.

\bibitem{humphreys}
J. E. Humphreys,
\emph{Introduction to Lie Algebras and Representation Theory},
Graduate Texts in Mathematics 9, Springer, New York, 1972.

\bibitem{kirillov}
A. A. Kirillov,
\emph{Elements of the Theory of Representations},
Grundlehren der mathematischen Wissenschaften 220, Springer, Berlin, 1976.

\bibitem{marsden-weinstein}
J. E. Marsden and A. Weinstein,
Reduction of symplectic manifolds with symmetry,
\emph{Reports on Mathematical Physics} \textbf{5} (1974), 121 to 130.

\bibitem{moser}
J. Moser,
On the volume elements on a manifold,
\emph{Transactions of the American Mathematical Society} \textbf{120} (1965), 286 to 294.

\bibitem{nekhoroshev}
N. N. Nekhoroshev,
An exponential estimate of the time of stability of nearly integrable Hamiltonian systems,
\emph{Russian Mathematical Surveys} \textbf{32} (1977), 1 to 65.

\bibitem{petz-sudar}
D. Petz and Cs. Sudar,
Extending the Fisher metric to density matrices,
arXiv:quant-ph/0102132, 2001.

\bibitem{weinstein}
A. Weinstein,
The local structure of Poisson manifolds,
\emph{Journal of Differential Geometry} \textbf{18} (1983), 523 to 557.

\end{thebibliography}

\appendix
\section{Code evidence}
\label{app:code}

\Cref{tab:code-evidence} maps each computational claim of Section 10 to the file and function that demonstrates or tests it. Every entry points at code in \texttt{src/vol-05-classical-systems/}. The claims are existence claims about computations, and the code demonstrates exactly the claim stated.

\begin{table}[h]
\centering
\small
\begin{tabularx}{\textwidth}{L{5.0cm}L{4.2cm}X}
\toprule
Computational claim & File & Function or test \\
\midrule
Moser homotopy produces a Darboux chart & \texttt{darboux\_chart.py} & \texttt{flow\_time1} and \texttt{test\_chart\_pullback} \\
Poisson rank stratification on $\mathfrak{so}(3)^{*}$ & \texttt{weinstein\_splitting.py} & \texttt{split\_bivector} and \texttt{test\_rank\_stratification} \\
Fisher metric is monotone under stochastic maps & \texttt{fisher\_monotonicity.py} & \texttt{pullback\_comparison} and \texttt{test\_monotonicity} \\
Standard symplectic data and witness functions & \texttt{Instances.hs} & \texttt{darboux}, \texttt{weinsteinSplitting}, and \texttt{rankChecks} \\
KKS form computation on a two-dimensional orbit & \texttt{Instances.hs} & \texttt{kksSymplecticForm} \\
Fisher metric on probability vectors & \texttt{Instances.hs} & \texttt{fisherMetric} \\
\bottomrule
\end{tabularx}
\caption{Code evidence for the computational claims of Section 10. Each row names one claim and the code that demonstrates it.}
\label{tab:code-evidence}
\end{table}

\end{document}

exec
/usr/local/bin/zsh -lc 'cat src/vol-05-classical-systems/darboux_chart.py src/vol-05-classical-systems/weinstein_splitting.py src/vol-05-classical-systems/fisher_monotonicity.py src/vol-05-classical-systems/Instances.hs' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D experiment (computational evidence, never proof).

Claim evidenced: the Moser homotopy of Lemma "moser-ball" produces a Darboux
chart for a perturbed symplectic form on a ball in R^4, as used in the proof of
Darboux's theorem (Theorem "darboux" in papers/latex/vol-05-classical-systems.tex).

The experiment integrates the Moser vector field X_t solving
    iota_{X_t} omega_t = -alpha,   omega_t = omega_0 + t*(omega - omega_0),
flows it from t=0 to t=1 with RK4, and reports the max residual
    || J^T omega(phi(x)) J - omega_0 ||_max
over sample points, where J is the numerical Jacobian of the time-1 flow.
"""

import numpy as np

rng = np.random.default_rng(7)
DIM = 4  # n = 2
EPS = 0.05


def omega_0(_x):
    I = np.eye(2)
    Z = np.zeros((2, 2))
    top = np.hstack([Z, I])
    bot = np.hstack([-I, Z])
    return np.vstack([top, bot])


# Perturbation: omega = omega_0 + d(alpha) with quadratic alpha, so d(alpha)
# has linear coefficients and the form is genuinely position dependent.
B = rng.normal(scale=0.4, size=(DIM, DIM, DIM))  # alpha_i = B[i,k,l] x_k x_l


def alpha(x):
    return np.einsum("ikl,k,l->i", B, x, x)


def d_alpha(x):
    # (d alpha)_{ij} = d_i alpha_j - d_j alpha_i, alpha_j = B[j,k,l] x_k x_l
    # d_i alpha_j = (B[j,i,l] + B[j,k,i]) x_k x_l  (symmetrized in k,l)
    G = np.zeros((DIM, DIM), dtype=np.result_type(x, float))
    for j in range(DIM):
        for i in range(DIM):
            M = 0.5 * (B[j, i, :] + B[j, :, i])
            G[j, i] = 2.0 * np.einsum("k,k->", M, x)
    out = np.zeros((DIM, DIM), dtype=np.result_type(x, float))
    for i in range(DIM):
        for j in range(DIM):
            out[i, j] = G[j, i] - G[i, j]
    return out


def omega(x):
    return omega_0(x) + EPS * d_alpha(x)


def omega_t(x, t):
    return omega_0(x) + t * EPS * d_alpha(x)


def moser_field(x, t):
    """Solve omega_t(x) X = alpha(x) (equivalent to iota_X omega_t = -alpha)."""
    M = omega_t(x, t)
    a = EPS * alpha(x)
    return np.linalg.solve(M, a)


def rk4_step(x, t, h):
    k1 = moser_field(x, t)
    k2 = moser_field(x + 0.5 * h * k1, t + 0.5 * h)
    k3 = moser_field(x + 0.5 * h * k2, t + 0.5 * h)
    k4 = moser_field(x + h * k3, t + h)
    return x + (h / 6.0) * (k1 + 2 * k2 + 2 * k3 + k4)


def flow_time1(x, steps=400):
    h = 1.0 / steps
    t, y = 0.0, x.copy()
    for _ in range(steps):
        y = rk4_step(y, t, h)
        t += h
    return y


def test_chart_pullback(n_samples=12, h=1e-20):
    """Residual test: J^T omega(phi(x0)) J should equal omega_0(x0), with J
    the Jacobian of the time-1 flow at x0 from complex-step differentiation."""
    worst = 0.0
    for _ in range(n_samples):
        x0 = rng.normal(scale=0.3, size=DIM)
        x1 = flow_time1(x0)
        J = np.zeros((DIM, DIM))
        for k in range(DIM):
            e = np.zeros(DIM, dtype=complex)
            e[k] = 1j * h
            J[:, k] = np.imag(flow_time1(x0.astype(complex) + e)) / h
        resid = J.T @ omega(x1) @ J - omega_0(x0)
        worst = max(worst, np.max(np.abs(resid)))
    return worst


def main():
    worst = test_chart_pullback()
    print("darboux_chart.py: Moser homotopy on a perturbed form in R^4")
    print(f"  perturbation scale EPS = {EPS}")
    print(f"  max residual |J^T omega(phi(x)) J - omega_0| = {worst:.3e}")
    ok = worst < 1e-4
    print(f"  test_chart_pullback: {'PASS' if ok else 'FAIL'}")
    return 0 if ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
#!/usr/bin/env python3
"""Phase D experiment (computational evidence, never proof).

Claim evidenced: the Poisson rank stratification of the Lie-Poisson structure on
so(3)* (Example "lie-poisson" in papers/latex/vol-05-classical-systems.tex), the
explicit case of the Weinstein splitting theorem: rank 2 on the coadjoint
orbits (spheres) and rank 0 at the origin, with symplectic leaf dimension equal
to the rank of the Poisson tensor.
"""

import numpy as np


def poisson_tensor(xi):
    """Poisson tensor of so(3)*: {x_i, x_j} = eps_{ijk} x_k."""
    x, y, z = xi
    return np.array([[0.0, z, -y], [-z, 0.0, x], [y, -x, 0.0]])


def split_bivector(xi):
    """Return (rank, leaf_dim, transverse_dim) of the Poisson tensor at xi."""
    P = poisson_tensor(xi)
    rank = int(np.linalg.matrix_rank(P, tol=1e-10))
    return rank, rank, 3 - rank


def test_rank_stratification():
    """Check rank 2 on spheres, rank 0 at the origin."""
    ok = True
    for r in (0.5, 1.0, 2.7):
        xi = np.array([r, 0.0, 0.0])
        rank, leaf, trans = split_bivector(xi)
        good = (rank == 2 and leaf == 2 and trans == 1)
        ok = ok and good
        print(f"  |xi| = {r}: rank = {rank}, leaf dim = {leaf}, transverse dim = {trans} "
              f"({'ok' if good else 'WRONG'})")
    xi0 = np.zeros(3)
    rank, leaf, trans = split_bivector(xi0)
    good = (rank == 0 and leaf == 0 and trans == 3)
    ok = ok and good
    print(f"  |xi| = 0: rank = {rank}, leaf dim = {leaf}, transverse dim = {trans} "
          f"({'ok' if good else 'WRONG'})")
    return ok


def main():
    print("weinstein_splitting.py: rank stratification on so(3)*")
    ok = test_rank_stratification()
    print(f"  test_rank_stratification: {'PASS' if ok else 'FAIL'}")
    return 0 if ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
#!/usr/bin/env python3
"""Phase D experiment (computational evidence, never proof).

Claim evidenced: the Fisher metric is monotone under stochastic maps, the
hypothesis side of Chentsov's theorem (Theorem "chentsov" in
papers/latex/vol-05-classical-systems.tex). The experiment samples random
probability vectors p and column-stochastic matrices T, forms the pullback
T^* g_{Tp} of the Fisher metric, and verifies g_p - T^* g_{Tp} is positive
semidefinite. It does not evidence the uniqueness direction of the theorem.
"""

import numpy as np

rng = np.random.default_rng(11)
N = 5
TRIALS = 200


def fisher_matrix(p):
    """Fisher metric g_p = diag(1/p) on the simplex tangent space."""
    return np.diag(1.0 / np.asarray(p, dtype=float))


def random_stochastic(n=N, m=N):
    """Column-stochastic matrix (columns sum to one)."""
    X = rng.random((n, m))
    return X / X.sum(axis=0, keepdims=True)


def pullback_comparison(p, T):
    """Return min eigenvalue of g_p - T^* g_{Tp} and the worst slack over
    random tangent vectors (u with sum u = 0)."""
    p = np.asarray(p, dtype=float)
    Tp = T @ p
    g = fisher_matrix(p)
    g_pull = T.T @ fisher_matrix(Tp) @ T
    diff = g - g_pull
    w = np.linalg.eigvalsh(0.5 * (diff + diff.T))
    worst_slack = np.inf
    for _ in range(50):
        u = rng.normal(size=N)
        u = u - u.mean()
        slack = float(u @ g @ u - (T @ u) @ fisher_matrix(Tp) @ (T @ u))
        worst_slack = min(worst_slack, slack)
    return float(w.min()), worst_slack


def test_monotonicity():
    min_eig = np.inf
    min_slack = np.inf
    for _ in range(TRIALS):
        p = rng.random(N) + 0.05
        p = p / p.sum()
        T = random_stochastic()
        e, s = pullback_comparison(p, T)
        min_eig = min(min_eig, e)
        min_slack = min(min_slack, s)
    ok = min_eig > -1e-10 and min_slack > -1e-10
    print(f"  trials = {TRIALS}, n = {N}")
    print(f"  min eigenvalue of g_p - T^* g_Tp = {min_eig:.3e}")
    print(f"  min slack over random tangent vectors = {min_slack:.3e}")
    return ok


def main():
    print("fisher_monotonicity.py: monotonicity of the Fisher metric")
    ok = test_monotonicity()
    print(f"  test_monotonicity: {'PASS' if ok else 'FAIL'}")
    return 0 if ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
{-# LANGUAGE TypeFamilies #-}

-- | Module        : Instances
-- Description     : Instance declarations of the shared CMRPS taxonomy classes
--                   for the classical physical systems of vol-05
--                   (Classification of Classical Physical Systems).
-- Paper source    : papers/latex/vol-05-classical-systems.tex
-- Targets mirror  : verification/vol-05-classical-systems-lean-targets.md
--
-- The family classes of 'Taxonomy.Families', the construction hooks of
-- 'Taxonomy.Constructions', and the equivalence hooks of
-- 'Taxonomy.Equivalences' are imported, never redefined. The types and witness
-- functions below carry the names used in the paper and in the Lean
-- mechanization targets (Darboux, WeinsteinSplitting, KKSSymplectic,
-- MoserStability, MonodromyObstruction, ChentsovFisher, FisherExplicit).
--
-- Claim status (docs/theorem-registry.md): this module is executable
-- computational evidence only. It proves nothing and is never "verified by
-- Lean": the honest statement is that these are executable models validated
-- against the informal specifications of the paper.
module Instances
  ( -- * Witness data types
    SymplecticForm (..)
  , PoissonBivector (..)
  , ProbVector (..)
  , StochasticMatrix (..)
  , SymplecticSurface (..)
    -- * Physical systems of this volume
  , SymplecticSystem (..)
  , PoissonSystem (..)
  , HamiltonianSystem (..)
  , ClassicalStatisticalSystem (..)
    -- * Witness functions mirroring the paper's theorems
  , standardSymplecticForm
  , darboux
  , weinsteinSplitting
  , kksSymplecticForm
  , moserStableFamily
  , pendulumMonodromy
  , fisherMetric
  , rankChecks
  ) where

import Taxonomy.Families
import Taxonomy.Constructions
import Taxonomy.Equivalences

-- | Definition 2.2 (paper): a symplectic form as its skew matrix in a chart.
-- Entries are rational for exact computation.
newtype SymplecticForm = SymplecticForm [[Rational]]
  deriving (Eq, Show)

-- | Definition 2.3 (paper): a Poisson bivector as its matrix pi^{ij} in a
-- chart.
newtype PoissonBivector = PoissonBivector [[Rational]]
  deriving (Eq, Show)

-- | Definition 2.4 (paper): a probability vector in the open simplex.
newtype ProbVector = ProbVector [Rational]
  deriving (Eq, Show)

-- | Definition 2.4 (paper): a column-stochastic matrix (columns sum to one).
newtype StochasticMatrix = StochasticMatrix [[Rational]]
  deriving (Eq, Show)

-- | Proposition 9 (paper): a closed symplectic surface, recorded by genus name
-- and total area (the classifying data of Example "surfaces").
newtype SymplecticSurface = SymplecticSurface (String, Rational)
  deriving (Eq, Show)

-- | Definition 2.2 (paper): a symplectic system, recorded by manifold name,
-- symplectic form, and Hamiltonian names.
data SymplecticSystem = SymplecticSystem
  { symplecticManifold :: String
  , symplecticForm :: SymplecticForm
  , symplecticHamiltonians :: [String]
  }
  deriving (Eq, Show)

-- | Definition 2.3 (paper): a Poisson system, recorded by manifold name and
-- Poisson bivector.
data PoissonSystem = PoissonSystem
  { poissonManifold :: String
  , poissonBivector :: PoissonBivector
  }
  deriving (Eq, Show)

-- | Definition 2.2 (paper): a Hamiltonian system: a symplectic system with one
-- distinguished Hamiltonian.
data HamiltonianSystem = HamiltonianSystem
  { hamiltonianBase :: SymplecticSystem
  , hamiltonianFunction :: String
  }
  deriving (Eq, Show)

-- | Definition 2.4 (paper): a classical statistical system, recorded by its
-- probability vector and its stochastic maps.
data ClassicalStatisticalSystem = ClassicalStatisticalSystem
  { statProbabilities :: ProbVector
  , statStochasticMaps :: [StochasticMatrix]
  }
  deriving (Eq, Show)

-- | Definition 2.2 (paper): the standard symplectic matrix
-- omega_0 = sum_i dx_i wedge dy_i in dimension 2n.
standardSymplecticForm :: Int -> SymplecticForm
standardSymplecticForm n = SymplecticForm [[entry i j | j <- [0 .. 2 * n - 1]]
                                         | i <- [0 .. 2 * n - 1]]
  where
    entry i j
      | j == i + n = 1
      | i == j + n = -1
      | otherwise = 0

-- | Lean target 'Darboux': the Darboux normal form at any point is the
-- standard symplectic form. The witness is the standard matrix of dimension
-- 2n; the paper's Theorem 3.1 proves that every symplectic manifold is locally
-- symplectomorphic to it.
darboux :: Int -> SymplecticForm
darboux = standardSymplecticForm

-- | Lean target 'WeinsteinSplitting': the rank split of a Poisson tensor at a
-- point. The witness returns (rank, transverse dimension) for the tensor
-- matrix; the paper's Theorem 4.1 splits a neighborhood into a symplectic
-- factor of dimension rank and a transverse Poisson factor.
weinsteinSplitting :: PoissonBivector -> (Int, Int)
weinsteinSplitting (PoissonBivector m) = (r, length m - r)
  where
    r = rankRational m

-- | Lean target 'KKSSymplectic': the Kirillov-Kostant-Souriau form on the
-- coadjoint orbit of so(3)* through xi = (0, 0, r), in the basis of
-- fundamental vector fields. The value omega_xi(ad*_x xi, ad*_y xi) =
-- <xi, [x, y]> is the area form of magnitude r (paper, Theorem 4.3).
kksSymplecticForm :: Rational -> SymplecticForm
kksSymplecticForm r = SymplecticForm [[0, r], [negate r, 0]]

-- | Lean target 'MoserStability': the hypothesis of the theorem is that the
-- cohomology classes of the family omega_t are constant. The witness checks
-- constancy of recorded class vectors.
moserStableFamily :: [[Rational]] -> Bool
moserStableFamily [] = True
moserStableFamily (c : cs) = all (== c) cs

-- | Lean target 'MonodromyObstruction': the monodromy matrix of the spherical
-- pendulum period lattice, the unipotent matrix computed by Duistermaat
-- (paper, Example "pendulum"). Nontrivial monodromy obstructs global
-- action-angle coordinates.
pendulumMonodromy :: [[Integer]]
pendulumMonodromy = [[1, 1], [0, 1]]

-- | Lean target 'FisherExplicit' and 'ChentsovFisher': the Fisher metric
-- g_p(u, v) = sum_i u_i v_i / p_i on the open simplex (paper, Definition 8.1).
fisherMetric :: ProbVector -> [Rational] -> [Rational] -> Maybe Rational
fisherMetric (ProbVector ps) us vs
  | length ps == length us && length us == length vs =
      Just (sum (zipWith3 (\p u v -> u * v / p) ps us vs))
  | otherwise = Nothing

-- | Gaussian elimination over the rationals; used by 'weinsteinSplitting'.
rankRational :: [[Rational]] -> Int
rankRational [] = 0
rankRational mat = go 0 mat
  where
    ncols = rowLength mat
    go _ [] = 0
    go col rows
      | col >= ncols = 0
      | otherwise =
          case break (\row -> row !! col /= 0) rows of
            (_, []) -> go (col + 1) rows
            (before, pivot : rest) ->
              let piv = pivot !! col
                  norm = map (/ piv) pivot
                  red row = zipWith (\a b -> a - (row !! col) * b) row norm
              in 1 + go (col + 1) (map red (before ++ rest))

-- | Property checks for 'rankRational', the helper behind
-- 'weinsteinSplitting': the skew matrix [[0,1],[-1,0]] has rank two and the
-- zero matrix of any size has rank zero.
rankChecks :: Bool
rankChecks =
  rankRational [[0, 1], [-1, 0]] == 2
    && rankRational [[0, 0], [0, 0]] == 0
    && rankRational [[1, 0], [0, 1]] == 2

-- | Length of the first row of a nonempty matrix.
rowLength :: [[Rational]] -> Int
rowLength (r : _) = length r
rowLength [] = 0

-- | Block-diagonal sum of two matrices (product composition of forms).
blockDiagonal :: [[Rational]] -> [[Rational]] -> [[Rational]]
blockDiagonal a b =
  [row ++ replicate nb 0 | row <- a] ++ [replicate na 0 ++ row | row <- b]
  where
    na = rowLength a
    nb = rowLength b

-- | Product of two symplectic systems (Definition 9.1, paper).
productSystem :: SymplecticSystem -> SymplecticSystem -> SymplecticSystem
productSystem s1 s2 = SymplecticSystem
  { symplecticManifold = symplecticManifold s1 ++ " x " ++ symplecticManifold s2
  , symplecticForm = SymplecticForm
      (blockDiagonal rows1 rows2)
  , symplecticHamiltonians = symplecticHamiltonians s1 ++ symplecticHamiltonians s2
  }
  where
    SymplecticForm rows1 = symplecticForm s1
    SymplecticForm rows2 = symplecticForm s2

-- | DEF-002 instance: symplectic systems are classical systems of the
-- five-component schema (paper, Definition 2.2).
instance PhysicalSystem SymplecticSystem where
  type StateSpace SymplecticSystem = SymplecticForm
  type Observables SymplecticSystem = [String]
  type Dynamics SymplecticSystem = [String]
  type Symmetries SymplecticSystem = [String]
  type Composition SymplecticSystem = Construction
  stateSpace = symplecticForm
  observables _ = ["C^infty(M)"]
  dynamics = symplecticHamiltonians
  symmetries _ = ["Hamiltonian group"]
  composition _ = TensorProduct

-- | DEF-002 instance for Poisson systems (paper, Definition 2.3).
instance PhysicalSystem PoissonSystem where
  type StateSpace PoissonSystem = PoissonBivector
  type Observables PoissonSystem = [String]
  type Dynamics PoissonSystem = [String]
  type Symmetries PoissonSystem = [String]
  type Composition PoissonSystem = Construction
  stateSpace = poissonBivector
  observables _ = ["C^infty(M)"]
  dynamics _ = ["Poisson flow"]
  symmetries _ = ["Poisson automorphisms"]
  composition _ = TensorProduct

-- | DEF-002 instance for Hamiltonian systems (paper, Definition 2.2).
instance PhysicalSystem HamiltonianSystem where
  type StateSpace HamiltonianSystem = SymplecticForm
  type Observables HamiltonianSystem = [String]
  type Dynamics HamiltonianSystem = String
  type Symmetries HamiltonianSystem = [String]
  type Composition HamiltonianSystem = Construction
  stateSpace = symplecticForm . hamiltonianBase
  observables = observables . hamiltonianBase
  dynamics = hamiltonianFunction
  symmetries = symmetries . hamiltonianBase
  composition = composition . hamiltonianBase

-- | DEF-002 instance for classical statistical systems (paper, Definition 2.4).
instance PhysicalSystem ClassicalStatisticalSystem where
  type StateSpace ClassicalStatisticalSystem = ProbVector
  type Observables ClassicalStatisticalSystem = [String]
  type Dynamics ClassicalStatisticalSystem = [StochasticMatrix]
  type Symmetries ClassicalStatisticalSystem = [String]
  type Composition ClassicalStatisticalSystem = Construction
  stateSpace = statProbabilities
  observables _ = ["random variables"]
  dynamics = statStochasticMaps
  symmetries _ = ["sufficient statistics"]
  composition _ = DirectSum

-- | DEF-026 instance: symplectic systems carry Family I data (the symplectic
-- form itself).
instance FamilySymplecticPoisson SymplecticSystem where
  type SymplecticPoissonData SymplecticSystem = SymplecticForm
  symplecticPoissonData = symplecticForm

-- | DEF-026 instance: Poisson systems carry Family I data (the bivector).
instance FamilySymplecticPoisson PoissonSystem where
  type SymplecticPoissonData PoissonSystem = PoissonBivector
  symplecticPoissonData = poissonBivector

-- | DEF-026 instance: Hamiltonian systems carry Family I data through their
-- base symplectic system.
instance FamilySymplecticPoisson HamiltonianSystem where
  type SymplecticPoissonData HamiltonianSystem = SymplecticForm
  symplecticPoissonData = symplecticForm . hamiltonianBase

-- | DEF-030 instance: classical statistical systems carry Family V data (the
-- probability vector; the Fisher metric witness is 'fisherMetric').
instance FamilyProbabilityMeasure ClassicalStatisticalSystem where
  type ProbabilityMeasureData ClassicalStatisticalSystem = ProbVector
  probabilityMeasureData = statProbabilities

-- | DEF-023 instance: product composition of symplectic systems
-- (paper, Definition 9.1). Extension, limit, and colimit hooks are not
-- supplied for this volume.
instance Constructible SymplecticSystem where
  type Composite SymplecticSystem = SymplecticSystem
  tensorProduct s1 s2 = Just (productSystem s1 s2)
  directSum s1 s2 = Just (productSystem s1 s2)
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ s = Just s

-- | DEF-022 hook: no decomposition is supplied by this module. Nothing is not
-- a claim that no decomposition exists (paper, Remark "uniqueness").
instance Decomposable SymplecticSystem where
  decomposition _ = Nothing

-- | DEF-021 instance: closed symplectic surfaces are irreducible relative to
-- the product composition (paper, Proposition "surface-irreducible").
instance Irreducible SymplecticSurface where
  irreducibilityBasis _ = TensorProduct

-- | DEF-016 hook: equality of the recorded chart data is a conservative
-- witness of mathematical equivalence. It is not a decision procedure for
-- symplectomorphism, and the paper's equivalence claims are stated with their
-- preserved layers, not through this hook.
instance MathematicalEquivalence SymplecticSystem where
  mathematicallyEquivalent s1 s2 = symplecticForm s1 == symplecticForm s2

exec
/usr/local/bin/zsh -lc "sed -n '240,510p' papers/latex/vol-05-classical-systems.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:

\begin{proof}
Constancy of the cohomology class gives $\dot{\omega}_t = d \alpha_t$ for a smooth family of one-forms $\alpha_t$. Solve $\iota_{X_t} \omega_t = -\alpha_t$ and integrate $X_t$ to an isotopy $\varphi_t$ of the closed manifold $M$. The computation of \cref{lem:moser-ball} gives $\frac{d}{dt} \varphi_t^{*} \omega_t = 0$ without any support condition, so $\varphi_1^{*} \omega_1 = \omega_0$. The argument is due to Moser \cite{moser}.
\end{proof}

\begin{corollary}[Classification refines diffeomorphism and cohomology]
\label{cor:classification-data}
Let $f : M \to M'$ be a diffeomorphism of closed symplectic manifolds carrying $[\omega]$ to $[\omega']$. If there is a smooth path of symplectic forms $\omega_t$ in the constant class $[\omega]$ connecting $\omega$ to $f^{*} \omega'$, then $(M, \omega)$ and $(M', \omega')$ are symplectomorphic. Symplectomorphism classes therefore form a strictly finer partition than the pairs consisting of a diffeomorphism type and an orbit of $[\omega]$ under the diffeomorphism group.
\end{corollary}

The cohomology class $[\omega] \in H^{2}(M; \mathbb{R})$ is therefore a classifying invariant in the restricted sense of the series, together with the diffeomorphism invariants of $M$ and the action of $\operatorname{Diff}(M)$ on $H^{2}(M; \mathbb{R})$. For two-dimensional symplectic manifolds this is a complete classification.

\begin{example}[Surfaces]
\label{ex:surfaces}
A symplectic form on a closed surface is an area form, and the total area $\int_{M} \omega$ is a symplectomorphism invariant. Two closed oriented surfaces with area forms are symplectomorphic if and only if they are diffeomorphic and the areas agree. Classification here is classification of genus and area.
\end{example}

\begin{example}[Area forms on the sphere]
\label{ex:area-sphere}
Let $\sigma$ and $\sigma'$ be two area forms on $S^{2}$ with the same total area $\int_{S^{2}} \sigma = \int_{S^{2}} \sigma'$. Then $(S^{2}, \sigma)$ and $(S^{2}, \sigma')$ are symplectomorphic. The interpolation $\sigma_t = (1 - t) \sigma + t \sigma'$ consists of area forms of the same total area, hence symplectic forms with constant cohomology class in $H^{2}(S^{2}; \mathbb{R})$, and \cref{thm:moser-stability} above produces the isotopy. The classification of area forms on a fixed surface up to symplectomorphism is therefore the classification of total areas, in agreement with \cref{ex:surfaces}, and the theorem in action is Moser stability rather than any local analysis.
\end{example}

\begin{example}[Products of spheres]
\label{ex:product-spheres}
On $M = S^{2} \times S^{2}$ with area forms $\sigma_1$ and $\sigma_2$ of total area one on each factor, consider $\omega_{a, b} = a \sigma_1 \oplus b \sigma_2$ with $a, b > 0$. The cohomology class $[\omega_{a, b}] = a [\sigma_1] + b [\sigma_2]$ is a symplectomorphism invariant, and the diffeomorphism group of $S^{2} \times S^{2}$ acts on $H^{2}(M; \mathbb{R})$ by permuting the two factors. Hence $(M, \omega_{a, b})$ is symplectomorphic to $(M, \omega_{a', b'})$ if and only if $\{a, b\} = \{a', b'\}$ as unordered pairs. The classification is the unordered pair of areas, a two-dimensional global invariant with no local content.
\end{example}

Beyond the cohomology class, the standard global invariants are the characteristic classes of $M$: any symplectic manifold admits an $\omega$-compatible almost complex structure $J$, and the Chern classes $c_i(M, J)$ are independent of the choice of $J$. For closed four-manifolds these classes interact with deep rigidity phenomena, and no complete classification is claimed in this paper.

In dimension four, global symplectic classification refines smooth four-manifold topology and remains incomplete outside toric and product regimes. De Rham cohomology distinguishes the standard symplectic structures on $\mathbb{CP}^{2}$ with its Fubini-Study form, $T^{4}$ with a constant form, and the products of \cref{ex:product-spheres}, and \cref{thm:delzant} classifies the toric four-manifolds, including the one-point blowup of $\mathbb{CP}^{2}$, by polytopes. For general closed four-manifolds, symplectomorphism classification is finer than the diffeomorphism type together with the action of $\operatorname{Diff}(M)$ on $H^{2}(M; \mathbb{R})$, and distinguishing smooth structures that share these classical invariants uses gauge-theoretic and pseudoholomorphic invariants (Seiberg-Witten and Taubes-type invariants) that this paper does not develop.

The strongest global rigidity in the symplectic category is metric-free.

\begin{definition}[Symplectic capacity]
\label{def:capacity}
A symplectic capacity is a rule $c$ assigning to each symplectic manifold $(M^{2n}, \omega)$ a number $c(M, \omega) \in [0, +\infty]$ such that: (i) monotonicity holds, $c(M, \omega) \leq c(M', \omega')$ whenever a symplectomorphism embeds $(M, \omega)$ into $(M', \omega')$; (ii) conformality holds, $c(M, \lambda \omega) = |\lambda| c(M, \omega)$ for $\lambda \neq 0$; (iii) normalization holds, $c(B^{2n}(1)) = c(B^{2}(1) \times \mathbb{R}^{2n-2}) = \pi$ where $B^{2n}(1)$ is the open unit ball and $B^{2}(1)$ the open unit disc.
\end{definition}

\begin{proposition}[Gromov width]
\label{prop:gromov-width}
The Gromov width
\[
w_G(M, \omega) = \sup \{ \pi r^{2} : B^{2n}(r) \text{ embeds symplectically into } (M, \omega) \}
\]
is a symplectic capacity in the sense of \cref{def:capacity}.
\end{proposition}

\begin{proof}[Proof reference]
Monotonicity is immediate from composition of embeddings, and conformality from the scaling of the standard form. The normalization and the capacity axiom for disjoint unions of balls follow from the embedding theory of Gromov \cite{gromov-hol}; the width is the first capacity constructed.
\end{proof}

Gromov's nonsqueezing theorem is the rigidity statement that makes capacities genuine invariants rather than convenient notation.

\begin{theorem}[Gromov nonsqueezing]
\label{thm:nonsqueezing}
Let $B^{2n}(r)$ be the open ball of radius $r$ in $\mathbb{R}^{2n}$ and $B^{2}(R) \times \mathbb{R}^{2n-2}$ the cylinder of radius $R$. A symplectic embedding $B^{2n}(r) \hookrightarrow B^{2}(R) \times \mathbb{R}^{2n-2}$ exists only if $r \leq R$.
\end{theorem}

\begin{proof}[Proof reference]
The proof uses $J$-holomorphic curves for a suitable compatible almost complex structure and is due to Gromov \cite{gromov-hol}. The conclusion is the source of genuine global symplectic rigidity and of the capacity invariants.
\end{proof}

Nonsqueezing has no Riemannian analogue: a round ball embeds into a thin cylinder in ordinary Euclidean geometry at every scale. The invariant content of symplectic geometry is therefore both global and metric-free.

On open manifolds the situation reverses. By the $h$-principle for symplectic structures on open manifolds, every open manifold admits an exact symplectic form, and open symplectic manifolds are classified up to symplectomorphism by diffeomorphism type \cite{gromov-pdr}. Closed manifolds are rigid; open manifolds are flexible. Any classification theorem for classical systems must state which regime it addresses.

\section{Coadjoint orbits and homogeneous symplectic manifolds}

The homogeneous symplectic manifolds of classical mechanics are the coadjoint orbits of \Cref{thm:kks}, and their classification inherits the combinatorics of the Killing-Cartan theory of simple Lie algebras and the highest-weight theory of their representations.

\begin{definition}[Momentum map and homogeneous orbits]
\label{def:momentum}
Let $G$ act symplectically on $(M, \omega)$ with momentum map $J : M \to \mathfrak{g}^{*}$ characterized by $\langle dJ, x \rangle = \iota_{x_M} \omega$ for the fundamental vector fields $x_M$. The fibers and orbits of $J$ are the symmetry-level objects of the classical system, and coadjoint orbits in $\mathfrak{g}^{*}$ are the model homogeneous symplectic manifolds.
\end{definition}

\begin{theorem}[Coadjoint orbits of compact semisimple groups]
\label{thm:coadjoint-classification}
Let $G$ be compact, connected, and semisimple with complexification $G^{\mathbb{C}}$ and maximal torus $T$ with Lie algebra $\mathfrak{t}$. Every coadjoint orbit of $G$ meets $\mathfrak{t}^{*}$ in a single $W$-orbit, so the orbits are parameterized continuously by points $\xi$ of the closed positive Weyl chamber $\mathfrak{t}^{*}_{+}$. Each orbit is a flag manifold $G^{\mathbb{C}} / P_{\xi}$ where the parabolic $P_{\xi}$ is determined by the support of $\xi$, that is by the subset of Dynkin nodes on whose walls $\xi$ lies; regular $\xi$ gives full flag manifolds and singular $\xi$ gives partial flags. The symplectic form on the orbit is the Kirillov-Kostant-Souriau form of \Cref{thm:kks}. The dominant integral weights form the discrete sublattice $\Lambda_{+} \subset \mathfrak{t}^{*}_{+}$ that selects the integral, that is quantizable, orbits; those are the orbits carrying finite-dimensional irreducible representations by the Borel-Weil theorem.
\end{theorem}

\begin{proof}[Proof reference]
The Killing-Cartan classification of complex simple Lie algebras is the list of Dynkin diagrams $A_n$, $B_n$, $C_n$, $D_n$, $G_2$, $F_4$, $E_6$, $E_7$, $E_8$ \cite{humphreys}. The parameterization of coadjoint orbits by the positive Weyl chamber is the standard maximal-torus argument, and the identification of orbits with $G^{\mathbb{C}} / P_{\xi}$ is the complex-geometric form of the same statement \cite{kirillov}. The highest-weight theorem classifies the finite-dimensional irreducible representations of $\mathfrak{g}^{\mathbb{C}}$ by dominant integral weights \cite{humphreys}, and the Borel-Weil theorem realizes each such representation on the corresponding integral orbit. The paper uses these results as established background and reproduces none of the classification lists.
\end{proof}

\begin{example}[The spheres as coadjoint orbits]
\label{ex:sphere-orbit}
For $G = SU(2)$ the dual $\mathfrak{su}(2)^{*} \cong \mathbb{R}^{3}$, and the coadjoint orbits are the spheres $\{|\xi| = r\}$ of every radius $r > 0$ together with the degenerate orbit at the origin: a continuous one-parameter family, the Weyl chamber being the half-line $r \geq 0$. The Kirillov-Kostant-Souriau form of \Cref{thm:kks} on the sphere of radius $r$ is $1/r$ times the round area form, of total symplectic area $4 \pi r$. The integral orbits are those with $2r$ a nonnegative integer, and the Borel-Weil theorem attaches to the orbit of radius $r = j$ the spin-$j$ representation of dimension $2j + 1$. The example separates the two classification statements: the classical orbit family is continuous in $r$, and the representation labels form the discrete sublattice $r \in \tfrac{1}{2} \mathbb{Z}_{\geq 0}$.
\end{example}

The classification content of \cref{thm:coadjoint-classification} is finite-dimensional and combinatorial: Dynkin diagram nodes and dominant weights. The theorem classifies homogeneous symplectic manifolds under a group with transitive action, not arbitrary symplectic manifolds. The orbit method program, which seeks to extend this dictionary to general representations of general Lie groups through their coadjoint orbits, is not established at the level of an equivalence and is not used as a dependency here.

\begin{table}[t]
\centering
\small
\begin{tabular}{L{1.8cm}L{6.2cm}L{3.4cm}}
\toprule
Diagram & Complex simple Lie algebra & Dimension \\
\midrule
$A_n$ & $\mathfrak{sl}(n+1, \mathbb{C})$ & $n(n+2)$ \\
$B_n$ & $\mathfrak{so}(2n+1, \mathbb{C})$ & $n(2n+1)$ \\
$C_n$ & $\mathfrak{sp}(2n, \mathbb{C})$ & $n(2n+1)$ \\
$D_n$ & $\mathfrak{so}(2n, \mathbb{C})$ & $n(2n-1)$ \\
$G_2$ & exceptional algebra of type $G_2$ & $14$ \\
$F_4$ & exceptional algebra of type $F_4$ & $52$ \\
$E_6$ & exceptional algebra of type $E_6$ & $78$ \\
$E_7$ & exceptional algebra of type $E_7$ & $133$ \\
$E_8$ & exceptional algebra of type $E_8$ & $248$ \\
\bottomrule
\end{tabular}
\caption{The Killing-Cartan list of complex simple Lie algebras. The classification of homogeneous symplectic manifolds of \cref{thm:coadjoint-classification} inherits this list and adds, per diagram, the positive Weyl chamber of continuous orbit parameters and the dominant integral weights selecting the integral orbits.}
\label{tab:dynkin}
\end{table}

\Cref{tab:dynkin} is the classification content that flows into classical mechanics: for each simple algebra the coadjoint orbits form a family parameterized by the positive Weyl chamber of \cref{thm:coadjoint-classification}, the dominant integral weights select the integral sublattice of that chamber, and the symplectic geometry of each orbit is fixed by \Cref{thm:kks}. The exceptional diagrams show that the classification is not a uniform infinite family alone, and the dimensions record that the homogeneous symplectic manifolds attached to exceptional algebras are concrete finite-dimensional objects.

\section{Hamiltonian dynamics and integrable systems}

The dynamical layer of a classical system is the family of Hamiltonian flows. The classification of dynamics is far from complete, but the integrable case admits normal forms with explicit invariants and explicit obstructions to global classification.

\begin{definition}[Integrable system]
\label{def:integrable}
A Liouville integrable system is a symplectic manifold $(M^{2n}, \omega)$ with $n$ functions $H_1, \dots, H_n \in C^{\infty}(M)$ in involution, $\{H_i, H_j\} = 0$, and with $dH_1 \wedge \dots \wedge dH_n$ nonzero on a dense open subset of $M$.
\end{definition}

\begin{theorem}[Liouville-Arnold]
\label{thm:liouville-arnold}
Let $(M^{2n}, \omega, H_1, \dots, H_n)$ be a Liouville integrable system and let $M_c = \{ H_1 = c_1, \dots, H_n = c_n \}$ be a compact connected regular level set. Then $M_c$ is diffeomorphic to an $n$-torus $T^{n}$, and a neighborhood of $M_c$ in $M$ carries action-angle coordinates $(I, \theta)$ in which $\omega = \sum_{i} dI_i \wedge d\theta_i$ and the $H_i$ depend on the actions $I_i$ alone.
\end{theorem}

\begin{proof}[Proof reference]
The Hamiltonian flows of the $H_i$ commute and preserve $M_c$, giving a locally free $T^{n}$-action whose orbits fill $M_c$; compactness and connectedness make the action transitive. The action variables are the periods of $\omega$ over a basis of $H_1(M_c; \mathbb{Z})$, and the angle variables are coordinates on the fibers. The full proof appears in Arnold \cite{arnold}.
\end{proof}

\begin{proposition}[Action variables are periods]
\label{prop:periods}
In the action-angle coordinates of \cref{thm:liouville-arnold}, the action variables are the periods of the action one-form $\lambda$ with $d\lambda = \omega$ over a basis $\gamma_1, \dots, \gamma_n$ of $H_1(M_c; \mathbb{Z})$:
\[
I_j = \frac{1}{2\pi} \oint_{\gamma_j} \lambda.
\]
The value depends on the choice of primitive $\lambda$: two primitives differ by a closed one-form, and the resulting shift of the actions is the period vector of that form, a vector of $H^{1}(M_c; \mathbb{R}) \cong \mathbb{R}^{n}$. Once $\lambda$ is fixed, the angle variables are fiberwise coordinates normalized so that $\omega = \sum_j dI_j \wedge d\theta_j$.
\end{proposition}

\begin{proof}
On a neighborhood of $M_c$ the form $\omega$ is exact, $\omega = d\lambda$, and the $n$ commuting flows of the $H_i$ generate a torus action. The periods of $\lambda$ over the cycles $\gamma_j$ are constant on the base of the fibration because the cycles are covariantly constant under the flows, and the identity $I_j = \frac{1}{2\pi} \oint_{\gamma_j} \lambda$ is the normalization that yields $\omega = \sum_j dI_j \wedge d\theta_j$. Replacing $\lambda$ by $\lambda + \eta$ with $\eta$ closed shifts each $I_j$ by $\frac{1}{2\pi} \oint_{\gamma_j} \eta$, and those shifts range over all of $\mathbb{R}^{n}$.
\end{proof}

Action-angle variables give a local decomposition of an integrable system into $n$ one-degree-of-freedom systems. Global action-angle coordinates need not exist: the period lattice of the torus fibration can have monodromy.

\begin{proposition}[Monodromy obstruction]
\label{prop:monodromy}
There exist integrable Hamiltonian systems whose regular compact fibers are tori and which admit no global action-angle coordinates; the obstruction is the monodromy representation of $\pi_1$ of the base of the fibration acting on the period lattice $H_1(T^{n}; \mathbb{Z})$.
\end{proposition}

\begin{proof}[Proof reference]
Duistermaat \cite{duistermaat} computes the monodromy of the period bundle for integrable systems with focus-focus singularities, and the spherical pendulum is the standard example: parallel transport of a fiber around a critical value returns the fiber with its lattice mapped by a nontrivial unipotent matrix. Global action-angle coordinates would trivialize the period bundle, so nontrivial monodromy obstructs them.
\end{proof}

\begin{example}[Spherical pendulum]
\label{ex:pendulum}
The spherical pendulum on $T^{*} S^{2}$ with Hamiltonian $H = \tfrac{1}{2} (p_{\theta}^{2} + p_{\varphi}^{2} / \sin^{2}\theta) - \cos \theta$ is integrable with the vertical angular momentum $p_{\varphi}$ as second integral. Regular compact fibers are two-tori, and the system has one focus-focus critical point. Parallel transport of the period lattice around the critical value acts on $H_1(T^{2}; \mathbb{Z})$ by the unipotent matrix $\begin{pmatrix} 1 & 1 \\ 0 & 1 \end{pmatrix}$. The local decomposition of \cref{thm:liouville-arnold} holds near every regular fiber, and no global decomposition into action-angle pairs exists on the complement of the critical value.
\end{example}

\begin{example}[Euler top]
\label{ex:euler-top}
The free rigid body is the Hamiltonian system on the coadjoint orbit $\mathcal{O} \subset \mathfrak{so}(3)^{*}$ of \cref{ex:lie-poisson} with Hamiltonian $H(\xi) = \tfrac{1}{2} (\xi_1^{2} / I_1 + \xi_2^{2} / I_2 + \xi_3^{2} / I_3)$ for positive moments of inertia $I_i$. The Casimir $|\xi|^{2}$ is a second integral in involution with $H$, so the system is integrable on each sphere $|\xi|^{2} = r^{2}$. The regular compact fibers are the intersections of the energy ellipsoids with the momentum spheres, the trajectories are the Euler-Poinsot curves on those spheres, and \cref{thm:liouville-arnold} applies at every regular fiber. The example lives simultaneously in the homogeneous symplectic geometry of Section 6 and in the integrable dynamics of this section: its state space is a coadjoint orbit, its invariant is the Casimir, and its local normal form is action-angle.
\end{example}

Monodromy is the first genuine obstruction in this paper to decomposition: the local decomposition of \cref{thm:liouville-arnold} into one-degree-of-freedom factors is a statement about a neighborhood of one fiber, and \Cref{prop:monodromy} exhibits integrable systems that do not decompose globally. Stability of integrable dynamics is likewise regime-restricted.

\begin{theorem}[Nekhoroshev estimate]
\label{thm:nekhoroshev}
Let $H = H_0 + \varepsilon H_1$ be a steep integrable Hamiltonian system with $n$ degrees of freedom and let $H_0(I)$ be the integrable part in action variables. There are positive constants $c$, $a$, and $b$ depending on the system such that, for $\varepsilon$ small, every trajectory satisfies
\[
\| I(t) - I(0) \| \leq c \varepsilon^{b}
\qquad \text{for all } 0 \leq t \leq \exp(c \varepsilon^{-a}).
\]
The bound is on the drift of the action variables, not on the energy, which is conserved exactly.
\end{theorem}

\begin{proof}[Proof reference]
The estimate is due to Nekhoroshev \cite{nekhoroshev}. Steepness is the geometric condition on $H_0$ under which the normal form of the flow is integrable to high order, and it prevents Arnold diffusion across the resonance planes of action space. The exponential time scale follows from that normal form. The theorem is a statement about the action drift of perturbed integrable systems over exponentially long times.
\end{proof}

\section{Classical statistical systems and information geometry}

The classical probability family has one uniqueness theorem in the whole inventory of classical classification results. Chentsov's theorem singles out the Fisher metric as the unique metric monotone under stochastic maps, and the quantum analogue of that metric is parametric rather than unique.

\begin{definition}[Fisher metric]
\label{def:fisher}
On the open simplex $\Delta^{\circ} \subset \mathbb{R}^{n}$ the Fisher metric is the Riemannian metric whose value at $p$ on tangent vectors $u, v$ (with $\sum_i u_i = \sum_i v_i = 0$) is
\[
g_{p}(u, v) = \sum_{i=1}^{n} \frac{u_i v_i}{p_i}.
\]
On a smooth statistical model $\theta \mapsto p_{\theta}$ the Fisher metric is the pullback of this metric, with components $g_{jk}(\theta) = \sum_i \frac{1}{p_i} \partial_j p_i \, \partial_k p_i$.
\end{definition}

\begin{example}[Fisher metric on three outcomes]
\label{ex:fisher-three}
For $p = (\tfrac{1}{2}, \tfrac{1}{3}, \tfrac{1}{6})$ and the tangent vector $u = (1, -1, 0)$ the Fisher metric evaluates to $g_p(u, u) = \frac{1}{1/2} + \frac{1}{1/3} = 5$. At the uniform point $p = (\tfrac{1}{3}, \tfrac{1}{3}, \tfrac{1}{3})$ the same vector gives $g_p(u, u) = 6$. The metric therefore weights directions by the rarity of the outcomes they move, and the example is the two-dimensional case of \cref{def:fisher}.
\end{example}

\begin{definition}[Monotone metric]
\label{def:monotone}
A Riemannian metric $g$ on $\Delta^{\circ}$ is monotone under stochastic maps if for every column-stochastic matrix $T$ and every $p$, the pullback $T^{*} g_{Tp}$ at $p$ satisfies $T^{*} g_{Tp} \leq g_{p}$ as quadratic forms. Monotonicity is the requirement that coarse-graining cannot increase distinguishability.
\end{definition}

\begin{theorem}[Chentsov]
\label{thm:chentsov}
Let $g$ be a family of Riemannian metrics $g^{(n)}$ on the open simplices $\Delta^{\circ} \subset \mathbb{R}^{n}$ for all $n \geq 1$, compatible with Markov embeddings (pullback along every sufficient statistic is an isometry) and monotone under stochastic maps in the sense of \cref{def:monotone}. Then one constant $c > 0$ satisfies $g^{(n)} = c \, g_{\mathrm{Fisher}}^{(n)}$ for every $n$, where $g_{\mathrm{Fisher}}^{(n)}$ is the Fisher metric of \cref{def:fisher}. The cross-dimension compatibility is a hypothesis: monotonicity on a single fixed simplex does not determine the metric up to scale.
\end{theorem}

\begin{proof}[Proof structure]
Monotonicity forces equality along sufficient statistics, since a sufficient statistic admits a stochastic retraction and monotonicity in both directions along the retraction. Invariance under the sufficient statistics of the simplex reduces the metric to a family $g_p(u, v) = \sum_i \frac{u_i v_i}{p_i} f(p)$ compatible with all embeddings of lower-dimensional simplices, and the compatibility across dimensions forces $f$ to be constant. The complete proof is in Chentsov \cite{chentsov}; the structure stated here is the part that fixes the metric up to scale.
\end{proof}

\begin{lemma}[Equality along sufficient statistics]
\label{lem:sufficiency}
Let $g$ be a monotone metric on $\Delta^{\circ}$ and let $T$ be a stochastic map with a stochastic left inverse $S$, that is $S T = \mathrm{Id}$. Then $T$ is an isometric embedding for $g$, and for every tangent vector $u$ at $p$,
\[
g_{p}(u, u) = g_{Tp}(Tu, Tu).
\]
\end{lemma}

\begin{proof}
Monotonicity of $g$ for $T$ gives $g_{p}(u, u) \geq g_{Tp}(Tu, Tu)$, and monotonicity for $S$ gives
\[
g_{Tp}(Tu, Tu) \geq g_{p}(S T u, S T u) = g_{p}(u, u).
\]
The two inequalities sandwich, so equality holds and $T$ preserves $g$ exactly. This is the equality case that \cref{thm:chentsov} uses to reduce the classification to the invariant metrics under the sufficient statistics of the simplex.
\end{proof}

\begin{example}[Isometries of the Fisher metric]
\label{ex:reparameterization}
Under the square-root map $x_i = \sqrt{p_i}$ the open simplex $\Delta^{\circ}$ maps to the open positive orthant of the unit sphere, and the Fisher metric becomes four times the round metric of that sphere: $dx_i = u_i / (2 \sqrt{p_i})$ gives $\sum_i dx_i^{2} = \tfrac{1}{4} g_{p}(u, u)$. The isometries of the round sphere preserving the positive orthant are the coordinate permutations, so the isometries of the Fisher metric are exactly the relabelings of the outcome set. Stochastic maps that are not invertible on the model are contractions rather than isometries (\cref{def:monotone}), and \cref{lem:sufficiency} identifies the case of equality. The example shows concretely how the preserved layers of \cref{def:canonical} separate exact equivalence from coarse-graining.
\end{example}

\begin{corollary}[Fisher metric as classifying invariant]
\label{cor:fisher-invariant}
The Fisher metric, up to positive scale, is a classifying invariant of the classical statistical family under stochastic morphisms: it is the unique metric compatible with the coarse-graining order.
\end{corollary}

\begin{remark}[Connections beside the metric]
\label{rem:connections}
The Fisher metric is the unique monotone Riemannian object, but the statistical manifold carries more structure than its metric. The $\alpha$-connections of Amari \cite{amari} are a one-parameter family of affine connections dual to each other, $\alpha$ and $-\alpha$, with $\alpha = 0$ the Levi-Civita connection of the Fisher metric, and the exponential and mixture families are the $\alpha = 1$ and $\alpha = -1$ flat coordinates. The uniqueness theorem of Chentsov governs the metric alone; the connection family is parametric, and no statement of this paper transfers metric uniqueness to the connections.
\end{remark}

\begin{proposition}[Product of statistical models]
\label{prop:stat-product}
Let $p \in \Delta^{\circ} \subset \mathbb{R}^{n}$ and $q \in \Delta^{\circ} \subset \mathbb{R}^{m}$ be probability vectors and let $p \otimes q \in \Delta^{\circ} \subset \mathbb{R}^{nm}$ be their product. Then the Fisher metric of the product is the direct sum of the factors:
\[
g_{p \otimes q}(u \otimes q + p \otimes v, u \otimes q + p \otimes v) = g_{p}(u, u) + g_{q}(v, v)
\]
for tangent vectors $u$ at $p$ and $v$ at $q$.
\end{proposition}

\begin{proof}
Write the tangent vector at $p \otimes q$ in the product chart. The probability of the pair $(i, j)$ is $p_i q_j$, and the displacement in that coordinate is $u_i q_j + p_i v_j$. The Fisher sum becomes
\[
\sum_{i, j} \frac{(u_i q_j + p_i v_j)^{2}}{p_i q_j}
= \sum_{i, j} \frac{u_i^{2} q_j}{p_i} + 2 \sum_{i, j} u_i v_j + \sum_{i, j} \frac{p_i v_j^{2}}{q_j}
= g_{p}(u, u) + 0 + g_{q}(v, v),
\]
where the cross term vanishes because $\sum_i u_i = \sum_j v_j = 0$.
\end{proof}

\Cref{prop:stat-product} is the compositional content of the statistical family: products of systems are products of metrics, and the classifying invariant of a product is the direct sum of the classifying invariants of the factors. The parallel statement for symplectic products is \cref{def:product-composition} and the decomposition analysis of Section 9.

The uniqueness statement is classical in both senses of the word. The quantum analogue fails.

\begin{theorem}[Petz-Sudar parametric classification]
\label{thm:petz-sudar}

exec
/usr/local/bin/zsh -lc 'python3 -B src/vol-05-classical-systems/fisher_monotonicity.py' in /Users/mlong/Documents/Development/classification-physical-systems
exec
/usr/local/bin/zsh -lc 'python3 -B src/vol-05-classical-systems/weinstein_splitting.py' in /Users/mlong/Documents/Development/classification-physical-systems
exec
/usr/local/bin/zsh -lc 'python3 -B src/vol-05-classical-systems/darboux_chart.py' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 94ms:
weinstein_splitting.py: rank stratification on so(3)*
  |xi| = 0.5: rank = 2, leaf dim = 2, transverse dim = 1 (ok)
  |xi| = 1.0: rank = 2, leaf dim = 2, transverse dim = 1 (ok)
  |xi| = 2.7: rank = 2, leaf dim = 2, transverse dim = 1 (ok)
  |xi| = 0: rank = 0, leaf dim = 0, transverse dim = 3 (ok)
  test_rank_stratification: PASS

 succeeded in 169ms:
fisher_monotonicity.py: monotonicity of the Fisher metric
  trials = 200, n = 5
  min eigenvalue of g_p - T^* g_Tp = -5.565e-15
  min slack over random tangent vectors = 5.393e-02
  test_monotonicity: PASS

 succeeded in 3898ms:
darboux_chart.py: Moser homotopy on a perturbed form in R^4
  perturbation scale EPS = 0.05
  max residual |J^T omega(phi(x)) J - omega_0| = 2.442e-15
  test_chart_pullback: PASS

codex
ROW 1 | Moser homotopy produces a Darboux chart | SUPPORTS | flow_time1 integrates the Moser field, and test_chart_pullback passes with residual 2.442e-15.
ROW 2 | Poisson rank stratification on so(3)* | SUPPORTS | The test passes with rank two at all sampled nonzero points and rank zero at the origin.
ROW 3 | Fisher metric monotonicity under stochastic maps | SUPPORTS | All 200 sampled comparisons pass the positive-semidefinite and tangent-vector slack tolerances.
ROW 4 | Standard symplectic data and witness functions | SUPPORTS | darboux constructs the standard matrix, and weinsteinSplitting uses corrected elimination with rankChecks covering skew, zero, and identity matrices.
ROW 5 | KKS form on a two-dimensional orbit | SUPPORTS | kksSymplecticForm returns the correct skew matrix with coefficient r in the stated fundamental-vector basis.
ROW 6 | Fisher metric on probability vectors | SUPPORTS | fisherMetric computes the exact rational sum of u_i v_i/p_i for matching dimensions and valid open-simplex inputs.
VERDICT: PASS
hook: Stop
hook: Stop Completed
tokens used
27,713
ROW 1 | Moser homotopy produces a Darboux chart | SUPPORTS | flow_time1 integrates the Moser field, and test_chart_pullback passes with residual 2.442e-15.
ROW 2 | Poisson rank stratification on so(3)* | SUPPORTS | The test passes with rank two at all sampled nonzero points and rank zero at the origin.
ROW 3 | Fisher metric monotonicity under stochastic maps | SUPPORTS | All 200 sampled comparisons pass the positive-semidefinite and tangent-vector slack tolerances.
ROW 4 | Standard symplectic data and witness functions | SUPPORTS | darboux constructs the standard matrix, and weinsteinSplitting uses corrected elimination with rankChecks covering skew, zero, and identity matrices.
ROW 5 | KKS form on a two-dimensional orbit | SUPPORTS | kksSymplecticForm returns the correct skew matrix with coefficient r in the stated fundamental-vector basis.
ROW 6 | Fisher metric on probability vectors | SUPPORTS | fisherMetric computes the exact rational sum of u_i v_i/p_i for matching dimensions and valid open-simplex inputs.
VERDICT: PASS
