---
reviewer: codex (OpenAI) gpt-6.1-sol
type: code-audit
paper: vol-07-gauge-qft
round: 2
date: 2026-10-30T05:08:07Z
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
session id: 01a18b35-47f2-7a30-8c7f-7f6657f81c73
--------
user
Read papers/latex/vol-07-gauge-qft.tex and ONLY the files under src/vol-07-gauge-qft/ that its code evidence appendix names (do not explore anything else). For EVERY row of the appendix output one line: ROW <n> | <claim, 10 words max> | SUPPORTS | PARTIAL | NO | <one-sentence reason>. SUPPORTS means the named code actually demonstrates or tests the claim as stated. End with VERDICT: PASS if every row is SUPPORTS, else VERDICT: NEEDS_FIX.
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
I’ll read the appendix, check only the source files it names, and assess each row against its stated claim.
exec
/usr/local/bin/zsh -lc 'cat papers/latex/vol-07-gauge-qft.tex' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
\documentclass[11pt,letterpaper]{article}

\usepackage[T1]{fontenc}
\usepackage{lmodern}
\usepackage{microtype}
\usepackage[margin=1in]{geometry}
\linespread{1.0}
\setlength{\parskip}{0pt}
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

\newtheorem{theorem}{Theorem}[section]
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\theoremstyle{remark}
\newtheorem{remark}[theorem]{Remark}
\newtheorem{example}[theorem]{Example}
\newtheorem{conjecture}[theorem]{Conjecture}

\title{Gauge Structures and Quantum Field Theories\\[4pt]
  {\normalsize Part 7 of \emph{The Classification of Mathematical Representations of Physical Systems}}}
\author{Matthew Long\\
  \small The YonedaAI Collaboration, YonedaAI Research Collective\\
  \small Chicago, Illinois, USA\\
  \small \href{mailto:mlong@yonedalabs.ai}{mlong@yonedalabs.ai}\\
  \small \url{https://yonedalabs.ai}}
\date{October 2026}

\begin{document}

\maketitle

\begin{abstract}
We develop the classification of gauge structures and quantum field theories within the CMRPS program. The subject divides into two territories of unequal evidential standing. The established territory contains the Killing\textendash{}Cartan classification of semisimple Lie algebras, the highest-weight classification of their finite-dimensional representations, the classification of principal $G$-bundles by homotopy classes of maps into the classifying space $BG$, characteristic classes as pullbacks of universal classes, and anomalies as cohomological obstructions that gate quantization. The restricted territory contains functorial topological field theories under the Atiyah axioms and the Doplicher\textendash{}Roberts reconstruction of superselection sectors under the Haag\textendash{}Kastler framework. Beyond these islands the evidence is claimed rather than proved. The cobordism hypothesis classifies extended topological field theories by fully dualizable objects, yet the 2009 writeup is an informal proof sketch. The October 2026 four-dimensional quantum chromodynamics claim stands at existence claimed with manuscript and formalization withheld and verification pending, and the Yang\textendash{}Mills mass gap remains open. We present the classification results with their hypotheses and keep proved, claimed, and open statements apart throughout.
\end{abstract}

\section{Introduction}

Gauge theories and quantum field theories occupy the point in the CMRPS program where classification is strongest on the geometric side and weakest on the analytic side. This volume takes the classification problem for its subject: which gauge structures and which quantum field theories are determined, up to a stated equivalence, by an explicit and computable invariant, and which are not. The answer splits sharply. For principal bundles, semisimple Lie algebras, their finite-dimensional representations, and the obstruction content of anomalies, complete classification theorems exist and are proved in the standard literature. For functorial topological field theories in low dimensions the position is similar. For extended topological field theories the classification is claimed on the strength of a proof sketch. For four-dimensional interacting quantum field theories the position is a claims register: one existence result is announced with its artifacts withheld, the mass gap is open, and several lower-rung claims carry statuses ranging from journal-published-and-unverified to withdrawn.

A mature classification of mathematical representations of physical systems must record, for each domain, whether the invariant is complete and parameterized, complete but unparameterized, complete as an obstruction, claimed with a proof gap, open, or impossible. This volume records those regimes for the gauge and quantum field theory domains and states each result at exactly the strength the sources support. The split between proved and claimed is itself classification data, and Table~\ref{tab:invariants} is its record for this volume.

Gauge structures and topological field theories classify under three kinds of invariant. Homotopy classes of classifying maps $[X, BG]$ determine principal bundle topologies. Root diagrams and dominant integral weights determine Lie symmetries and matter representations. Fully dualizable objects name the extended topological field theories. Principal bundles with connection form the differential-geometric substrate, and operator algebras and tensor categories parameterize localized superselection sectors. In the terms of the series, the structural families in force are the principal-bundle family and the topological and higher-categorical family, with the tensor-category family wherever superselection sectors are in play.

The classification template of the finite simple groups is instructive in one respect and misleading in another. It is instructive because it separates three achievements that are often conflated: a parameterization by uniform data, an exhaustive list up to isomorphism, and a recognition procedure driven by companion invariants. The finite simple groups have the list, lack the uniform parameterization, and carry a practical recognition apparatus. This volume keeps the same separation: the Dynkin diagram is a uniform parameterization, the homotopy-class description of bundles is both a parameterization and a list, and the anomaly classes are a recognition test. The template is misleading if it suggests that a gauge theory or a quantum field theory will be organized by a finite set of families with finitely many exceptions. The classification data of this volume shows instead that the topological and algebraic layers are tame and the analytic layer is open or claimed, and no finite exception list is in evidence.

Throughout the series an announced result, a manuscript, a machine-checked formalization, an independently verified proof, and an accepted theorem are five different things. The constructive quantum field theory frontier of 2024 to 2026 is dense with announcements, and the ladder is what keeps them from being absorbed into the proved core. An existence theorem for a four-dimensional interacting theory would not settle the Yang\textendash{}Mills mass gap problem, which requires existence together with a positive mass gap. No withheld formalization may be described as machine-checked.

The mathematical classification of gauge and quantum field theories splits into an established topological and algebraic core and an unverified analytic frontier. Complete classification invariants characterize Lie symmetries, bundle topologies, two-dimensional topological field theories, and localized superselection sectors: Dynkin diagrams, universal characteristic classes, Frobenius algebras, and unitary tensor categories do this work. The classification of four-dimensional continuum field theories, connection moduli spaces, and non-perturbative mass spectra remains conditional, claimed without public proof artifacts, or open.

\section{Mathematical framework}
\label{sec:framework}

We work inside the series ontology. An object of the category $\mathrm{Phys}$ is recorded as a tuple $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ carrying a state space, an observable collection, dynamical laws, symmetry and constraint data, and composition rules. The schema is a candidate definition and not a settled one; we use it as a filing system for the structures in this volume.

\begin{definition}[Structural family IV]
\label{def:family-iv}
Family IV is the full subcategory of $\mathrm{Phys}$ whose systems carry principal bundles and connections: a principal $G$-bundle $P \to X$ with structure group $G$, a connection form $\omega$ with curvature $\Omega$, and the gauge data that acts on the pair. Representative systems are gauge theories. The established classification content of the family is the classification of bundles by homotopy classes of maps into $BG$ and the characteristic classes in $H^*(BG)$.
\end{definition}

\begin{definition}[Structural family VI]
\label{def:family-vi}
Family VI is the full subcategory of $\mathrm{Phys}$ whose systems carry topological or higher-categorical structure: a symmetric monoidal functor from a cobordism category to vector spaces, or an extended version landing in higher categories. Representative systems are topological quantum field theories. The established content is the functorial theory under the Atiyah axioms; the extended classification is claimed on the strength of the cobordism hypothesis and carries a proof gap.
\end{definition}

\begin{definition}[Classification data for gauge systems]
\label{def:classdata}
A gauge system is classified, up to isomorphism of principal bundles, by the homotopy class of a map $f: X \to BG$; the characteristic classes of the bundle are the pullbacks $f^*(\kappa)$ of universal classes $\kappa \in H^*(BG)$. For a semisimple gauge algebra the Lie-theoretic datum is the Dynkin diagram, and for a finite-dimensional matter representation the datum is a dominant integral weight.
\end{definition}

Three equivalence notions must be kept apart. Mathematical equivalence is isomorphism of the tuples in the ambient category of each component. Physical equivalence is the chosen relation on objects of $\mathrm{Phys}$; its correct choice is an open problem of the series. Observational equivalence belongs to the empirical layer and is not under discussion here.

\begin{definition}[Etingof\textendash{}Gelaki constraint]
\label{def:etingof-gelaki}
Any equivalence used to identify systems must state which layers of structure it preserves. Equivalences that forget the monoidal or symmetric layer are provably insufficient to recover the group. The counterexample behind the constraint: there exist non-isomorphic finite groups whose representation categories are equivalent as plain tensor categories, while an equivalence of symmetric tensor categories does recover the group~\cite{etingof-gelaki}. Every duality and equivalence recorded in this volume names its preserved structure.
\end{definition}

Two admissible constructions appear. The product construction sends a principal $G$-bundle $P_G$ and a principal $H$-bundle $P_H$ over the same base to the principal $(G \times H)$-bundle $P_G \times P_H$, with connection the pair of connections. The quotient construction passes to the quotient of the connection space by the gauge group, identifying fields that differ by gauge transformations. Each use of a construction records the composition data it contributes.

\begin{example}[A gauge theory as an object of $\mathrm{Phys}$]
\label{ex:tuple}
A classical Yang\textendash{}Mills system over a compact oriented four-manifold $X$ with gauge group $G$ is recorded as follows. The state space component $X_P$ is the space of connections on a fixed principal $G$-bundle $P \to X$ modulo the gauge group $\mathcal{G}$ of vertical automorphisms. The observable component $\mathcal{O}_P$ is the algebra of gauge-invariant polynomial functions of the curvature, together with the Wilson loops on a fixed class of loops when those are taken as the observable set. The dynamical component $\mathcal{D}_P$ is the Yang\textendash{}Mills functional $F \mapsto \int_X |F_\omega|^2$ and its gradient flow or Hamiltonian formulation. The symmetry component $\mathcal{S}_P$ is the gauge group $\mathcal{G}$ acting on connections with the Gauss law constraint surface as the reduced phase space. The composition component $\mathcal{C}_P$ is the product of bundles and the coupling of matter fields in representations of $G$. The tuple is an instance of the schema. The bundle is classified by Theorem~\ref{thm:bundles}, and the gauge algebra and the matter representations by Theorems~\ref{thm:killing-cartan} and~\ref{thm:highest-weight}. The dynamics, the state quotient, and the observable algebra lie outside those theorems.
\end{example}

We say a classification statement is \emph{complete} for a domain when an invariant is named, the classification theorem is proved, and the theorem's hypotheses are stated in full. We say it is \emph{complete as an obstruction} when the classification content is itself the vanishing of obstruction classes. We reserve \emph{claimed} for statements supported by an announcement, a manuscript, or a proof sketch without a complete proof on the public record, and \emph{open} for problems with no resolution on the record. These labels are used in prose only in their ordinary mathematical sense; the formal claim ledger records the status of each statement.

\begin{table}[ht]
\centering
\small
\caption{Classifying invariants of the gauge and topological subdomains, with the equivalence each classification is taken under and its regime.}
\label{tab:invariants}
\begin{tabularx}{\textwidth}{L{0.20\textwidth} X L{0.24\textwidth} L{0.20\textwidth}}
\toprule
Subdomain & Classifying invariant & Equivalence in force & Regime \\
\midrule
Semisimple gauge algebras & Dynkin diagram & Lie algebra isomorphism & Complete and parameterized \\
\addlinespace
Real simple gauge algebras & Satake diagram & Lie algebra isomorphism & Complete and parameterized \\
\addlinespace
Finite-dimensional matter representations & Dominant integral weight & Representation isomorphism & Complete and parameterized \\
\addlinespace
Principal bundles over a paracompact base & Homotopy class of $X \to BG$ & Bundle isomorphism & Complete and parameterized \\
\addlinespace
Characteristic classes & Pullbacks of universal classes in $H^*(BG)$ & Natural in the base map & Complete and parameterized \\
\addlinespace
Anomaly-free configurations & Trivial determinant line and vanishing BRST class & Gauge equivalence of configurations & Complete as obstruction \\
\addlinespace
Two-dimensional topological theories & Commutative Frobenius algebra & Monoidal natural isomorphism of functors & Complete and parameterized \\
\addlinespace
Sectors of nets under Haag duality & Compact supergroup from sector category & Symmetric monoidal equivalence & Complete under stated hypotheses \\
\addlinespace
Extended topological theories & Fully dualizable object & Monoidal equivalence of theories & Claimed with a proof gap \\
\addlinespace
Connections modulo gauge & None known in general & Gauge equivalence of connections & Open in general \\
\addlinespace
Four-dimensional interacting theories & Balaban-program methods as announced & Not established & Claimed with artifacts withheld \\
\addlinespace
Four-dimensional mass gap & None known & Not applicable & Open \\
\bottomrule
\end{tabularx}
\end{table}

\section{Lie theory of gauge groups}
\label{sec:lie}

The structure group of a gauge theory is a Lie group, and the first classification question is which Lie groups may serve. The answer is complete on the algebra side.

\begin{theorem}[Killing\textendash{}Cartan classification]
\label{thm:killing-cartan}
Complex semisimple Lie algebras are classified up to isomorphism by Dynkin diagrams of types $A_r$, $B_r$, $C_r$, $D_r$, $G_2$, $F_4$, $E_6$, $E_7$, $E_8$~\cite{humphreys, serre}. Real simple Lie algebras are classified by Satake diagrams; the real forms of a given complex simple algebra $\mathfrak{g}$ correspond to the conjugacy classes of involutive automorphisms of $\mathfrak{g}$, equivalently to conjugacy classes of Cartan involutions. Connected Lie groups with Lie algebra $\mathfrak{g}$ are classified by discrete subgroups $Z'$ of the center of the universal covering group $\widetilde{G}$: each such group is a quotient $\widetilde{G}/Z'$.
\end{theorem}

\begin{proof}
The complex case is the classification of root systems up to isomorphism. A root system spans a rational Euclidean space, and the integrality conditions force the Cartan integers $\langle \alpha_i, \alpha_j^\vee \rangle = 2(\alpha_i, \alpha_j)/(\alpha_j, \alpha_j)$ to lie in the list of Cartan matrices of finite type. Simplicity of the algebra corresponds to connectedness of the diagram, and the Serre presentation recovers the isomorphism class from the diagram. For the real case Cartan's theorem assigns to each real form its conjugacy class of involutive automorphisms of the complex algebra, and the Satake diagram records the induced diagram involution together with the split between compact and noncompact simple roots. For the group statement, every connected Lie group with Lie algebra $\mathfrak{g}$ is a quotient of the universal covering group $\widetilde{G}$ by a discrete subgroup of its center, and every such quotient is a connected Lie group with algebra $\mathfrak{g}$.
\end{proof}

The theorem classifies the gauge algebra; the simply connected group and its central quotients then classify the connected gauge group. It does not classify the bundle, the connection, the dynamics, or the matter content.

\begin{theorem}[Highest-weight classification]
\label{thm:highest-weight}
Let $\mathfrak{g}$ be a complex semisimple Lie algebra. Finite-dimensional irreducible representations of $\mathfrak{g}$ are in bijection with dominant integral weights; the representation with highest weight $\lambda$ exists and is unique up to isomorphism~\cite{humphreys}.
\end{theorem}

\begin{proof}
Uniqueness is the classification of a representation by its highest weight: the weight strings of a finite-dimensional irreducible are determined by the action of the raising and lowering operators, and the highest weight is annihilated by every raising operator and integral in the weight lattice. Existence is the content of the Borel\textendash{}Weil construction, or equivalently of the Verma module with the maximal proper submodule quotiented out; the quotient is finite-dimensional exactly when the highest weight is dominant integral. Irreducibility follows because every nonzero submodule contains a highest weight vector, and the highest weight space of an irreducible is one-dimensional.
\end{proof}

Together these two theorems give the complete Lie-theoretic layer of a gauge theory: the gauge algebra by its Dynkin diagram, the real form by its Satake diagram, the connected gauge group by central quotient data, and the finite-dimensional matter representations by dominant integral weights. Example instantiations of the invariant record appear in the code evidence of Section~\ref{sec:experiments}.

\begin{example}[The gauge algebra of quantum chromodynamics]
\label{ex:su3}
Take $\mathfrak{g} = \mathfrak{su}(3)$, the Lie algebra of $\mathrm{SU}(3)$. Its Dynkin diagram is $A_2$, two nodes joined by a single edge, and the Killing\textendash{}Cartan theorem records that no other complex simple algebra carries this diagram. The real form is compact, and the corresponding real simple algebra is the compact $\mathfrak{su}(3)$ itself; the split real form $\mathfrak{sl}(3, \mathbb{R})$ is a different real form of the same complex algebra and is distinguished by its Satake diagram. The fundamental weights $\lambda_1$ and $\lambda_2$ label the defining representation $\mathbf{3}$ and its conjugate $\bar{\mathbf{3}}$, and the highest weight of the adjoint representation is $\lambda_1 + \lambda_2$, giving the octet $\mathbf{8}$. Quarks in the defining representation, antiquarks in the conjugate, and gluons in the adjoint are therefore classified as representations by the dominant integral weights of $A_2$, and the matter content of the theory is a list of weights. The classification stops there: the interaction, the renormalization, and the spectrum of bound states are outside the highest-weight theorem.
\end{example}

\begin{remark}
The classification does not reach the dynamics of a gauge theory. Infinite-dimensional representations of the gauge group, the spectrum of the covariant Laplacian on a bundle, the Yang\textendash{}Mills functional, and the quantum theory built from them are outside the scope of the Killing\textendash{}Cartan and highest-weight statements. A gauge theory is not classified by its gauge algebra alone.
\end{remark}

\begin{remark}[Reductive groups and the center]
\label{rem:reductive}
A reductive gauge group is a central product of a semisimple group with a torus, so the classification extends by adjoining the rank of the torus to the Dynkin datum. The datum that distinguishes the global forms is the discrete central subgroup of the universal cover, and it is not visible in the Dynkin diagram: $\mathrm{SU}(2)$ is the universal cover of $\mathrm{SO}(3)$ and has center $\mathbb{Z}/2$, while $\mathrm{SO}(3)$ has trivial center, and both share the diagram $A_1$. The classification of gauge groups up to isomorphism therefore requires both the diagram and the quotient data of Theorem~\ref{thm:killing-cartan}, and the bundle classification records the difference, as Example~\ref{ex:global-form} shows.
\end{remark}

\section{Bundles and characteristic classes}
\label{sec:bundles}

Let $G$ be a Lie group and $X$ a paracompact Hausdorff space. Write $\mathrm{GBund}(X)$ for the set of isomorphism classes of principal $G$-bundles over $X$. Over a paracompact base every principal $G$-bundle with Lie structure group is numerable, so no further restriction on the bundles is needed.

\begin{theorem}[Classification by the classifying space]
\label{thm:bundles}
Let $G$ be a Lie group and $X$ a paracompact Hausdorff space. The map that sends a principal $G$-bundle to its classifying map induces a bijection~\cite{milnor, dold, steenrod}
\[
\mathrm{GBund}(X) \cong [X, BG],
\]
and the characteristic classes of a bundle are exactly the pullbacks along its classifying map of the universal characteristic classes in $H^*(BG)$~\cite{milnor-stasheff}.
\end{theorem}

\begin{proof}
The Milnor infinite join construction builds a numerable universal bundle $EG \to BG$ for any topological group $G$~\cite{milnor}. The universal property states that a principal $G$-bundle $P \to X$ is classified by a map $f: X \to BG$, with $P \cong f^*(EG)$, exactly when $P$ is numerable; two classifying maps for the same bundle are homotopic, and homotopic maps have isomorphic pullbacks~\cite{dold, steenrod}. Over a paracompact base every principal $G$-bundle with Lie structure group is numerable, so the universal property applies to every bundle of $\mathrm{GBund}(X)$ and the map is a bijection. For the second statement, a universal characteristic class is a cohomology class $\kappa \in H^*(BG)$, and the characteristic class of a bundle with classifying map $f$ is defined as $f^*(\kappa)$. The definition is stable under bundle isomorphism, and every natural characteristic class arises this way, since a natural transformation on homotopy classes is determined by its value on the universal bundle~\cite{milnor-stasheff}.
\end{proof}

The theorem is the complete classification of principal bundles. Two consequences follow.

\begin{proposition}[Bundles over spheres]
\label{prop:spheres}
Let $G$ be a connected Lie group and $n \geq 1$. Isomorphism classes of principal $G$-bundles over $S^n$ are in bijection with $\pi_{n-1}(G)$.
\end{proposition}

\begin{proof}
By Theorem~\ref{thm:bundles} the classes form $[S^n, BG] = \pi_n(BG)$, since $BG$ is connected. The fibration $G \to EG \to BG$ with contractible total space has long exact homotopy sequence
\[
\cdots \to \pi_n(EG) \to \pi_n(BG) \to \pi_{n-1}(G) \to \pi_{n-1}(EG) \to \cdots,
\]
and both homotopy groups of $EG$ vanish, so $\pi_n(BG) \cong \pi_{n-1}(G)$.
\end{proof}

\begin{example}[Line bundles over the sphere]
\label{ex:line}
For $G = \mathrm{U}(1)$ and $n = 2$, Proposition~\ref{prop:spheres} gives $\pi_1(\mathrm{U}(1)) \cong \mathbb{Z}$, and the isomorphism class is detected by the first Chern class $c_1 \in H^2(S^2; \mathbb{Z})$. Every complex line bundle over $S^2$ is a power of the Hopf bundle, and the classification is complete and parameterized by an integer.
\end{example}

\begin{example}[Instantons over the four-sphere]
\label{ex:instanton}
For $G = \mathrm{SU}(2)$ and $n = 4$, Proposition~\ref{prop:spheres} gives $\pi_3(\mathrm{SU}(2)) \cong \mathbb{Z}$, and the integer is the instanton number, computed as the second Chern class of the associated complex vector bundle. For $n = 2$ and $n = 3$ the groups $\pi_1(\mathrm{SU}(2))$ and $\pi_2(\mathrm{SU}(2))$ vanish, so every principal $\mathrm{SU}(2)$-bundle over $S^2$ or $S^3$ is trivial. The nontrivial topology appears only in the dimension where the third homotopy group of the gauge group is nontrivial.
\end{example}

\begin{example}[Global forms and the second Stiefel\textendash{}Whitney class]
\label{ex:global-form}
The choice of global form of the gauge group changes the bundle classification. For $G = \mathrm{SO}(3)$ the first homotopy group is $\pi_1(\mathrm{SO}(3)) \cong \mathbb{Z}/2$, so Proposition~\ref{prop:spheres} gives two isomorphism classes of principal $\mathrm{SO}(3)$-bundles over $S^2$, detected by the second Stiefel\textendash{}Whitney class $w_2$. The nontrivial class is the bundle of tangent 2-planes, and it admits no lift to a principal $\mathrm{SU}(2)$-bundle, since $\pi_1(\mathrm{SU}(2)) = 0$ forces every $\mathrm{SU}(2)$-bundle over $S^2$ to be trivial. Matter fields in a spinorial representation therefore distinguish the global form $\mathrm{SU}(2)$ from $\mathrm{SO}(3)$, and the classification of bundles records that distinction as a cohomology class rather than as a property of the Lie algebra.
\end{example}

\begin{remark}[Local models carry no classification content]
\label{rem:local}
Principal bundles carry only global topological invariants. Locally every principal bundle is trivial, so no local invariant of a bundle exists; the invariants are homotopy-theoretic and cohomological. This is the same phenomenon that Darboux's theorem displays in symplectic geometry, and it marks the contrast with Riemannian geometry, where curvature supplies local invariants.
\end{remark}

Connections on a classified bundle add analytic data. The Chern\textendash{}Weil homomorphism assigns to an invariant polynomial on the Lie algebra the cohomology class of its evaluation on the curvature of any connection, and the class is independent of the connection. In the case $G = \mathrm{U}(1)$ the class $[\Omega/2\pi]$ of the curvature two-form is the first Chern class of the line bundle, so the connection refines, but does not extend, the classification. The classification theorem for bundles is unaffected by connection data. Connections are classified only modulo gauge in restricted settings, and we record no general classification theorem for connections.

\begin{definition}[Gauge equivalence of connections]
\label{def:gauge-equivalence}
Two connections $\omega_1$ and $\omega_2$ on a principal $G$-bundle $P \to X$ are gauge equivalent when a bundle automorphism $g: P \to P$ over the identity of $X$ satisfies $g^*\omega_2 = \omega_1$. The moduli space of connections on a fixed bundle is the quotient of the affine space of connections by this gauge action. Its singularities are the reducible connections, whose stabilizer is larger than the center of $G$, and those points obstruct a smooth quotient description.
\end{definition}

No classification of the moduli space of connections is on the record. The bundle classification delivers its topological stratification: each bundle isomorphism class carries its own moduli space of connections, and the Chern\textendash{}Weil map sends each to the same characteristic classes. The instanton number of Example~\ref{ex:instanton} is constant on the connected components of a moduli space, so the topological classification is the first invariant of the analytic one.

\begin{proposition}[Characteristic classes of the classical groups]
\label{prop:classical-classes}
For $G = \mathrm{U}(n)$ the classifying cohomology $H^*(B\mathrm{U}(n); \mathbb{Z})$ is a polynomial ring on the Chern classes $c_1, \ldots, c_n$. For $G = \mathrm{SO}(2k+1)$ the rational cohomology $H^*(B\mathrm{SO}(2k+1); \mathbb{Q})$ is a polynomial ring on the Pontryagin classes $p_1, \ldots, p_k$. For $G = \mathrm{SO}(2k)$ the rational cohomology $H^*(B\mathrm{SO}(2k); \mathbb{Q})$ is the free polynomial ring $\mathbb{Q}[p_1, \ldots, p_{k-1}, e]$; the top Pontryagin class is the element $p_k = e^2$ and is not an independent generator. For $G = \mathrm{SU}(n)$ the class $c_1$ vanishes and $H^*(B\mathrm{SU}(n); \mathbb{Z})$ is a polynomial ring on $c_2, \ldots, c_n$.
\end{proposition}

\begin{proof}
Each statement is the computation of the cohomology of the classifying space for the given group. For the unitary group one pulls back the tautological bundle over the Grassmannian, splits it formally into Chern roots, and reads off the elementary symmetric polynomials; the splitting principle shows that the Chern classes generate the ring. For the special unitary group the determinant line is trivial, which sets $c_1$ to zero and leaves the remaining classes free. For the special orthogonal group the Pontryagin classes are the Chern classes of the complexification, the rational statement drops the torsion, and in even rank the top Pontryagin class equals the square of the Euler class, so $e$ replaces $p_k$ among the generators.
\end{proof}

The proposition gives the universal class ring whose pullbacks classify bundles in each classical case. The table of sphere bundles in Example~\ref{ex:line} and Example~\ref{ex:instanton} is the shadow of these rings on low-dimensional bases.

\section{Anomalies as obstructions}
\label{sec:anomalies}

An anomaly is the failure of a classical gauge symmetry to survive quantization. Its mathematical signature is the nontriviality of a line or of a cohomology class, and its classification content is the vanishing test for those classes.

\begin{definition}[Fermionic anomaly]
\label{def:fermionic-anomaly}
Let $M$ be a compact spin manifold, $P \to M$ a principal $G$-bundle with $G$ a compact Lie group, $\mathcal{A}$ the space of connections on $P$, and $\mathcal{G}$ the gauge group acting on $\mathcal{A}$. The determinant line of a family of Dirac operators assigns to each connection $A$ the determinant line of $D_A$, and these lines assemble into a complex line bundle $\lambda_{\mathrm{det}}$ over the gauge orbit space $\mathcal{A}/\mathcal{G}$, or over $\mathcal{A}$ when the family is lifted~\cite{quillen, atiyah-singer}. The fermionic anomaly is the obstruction to trivializing $\lambda_{\mathrm{det}}$, or its Pfaffian square root in the Majorana case. The theory is consistent only where the line bundle is trivializable.
\end{definition}

\begin{definition}[BV-BRST gauge anomaly]
\label{def:bvbrst-anomaly}
Let $n$ be the spacetime dimension. The BV-BRST gauge anomaly is the obstruction class in the local BRST cohomology $H^{1,n}(s\mid d)$: the cohomology of the BRST differential $s$ on local functionals of the fields and ghosts, modulo total spacetime derivatives $d$, at ghost number one and form degree $n$. The class satisfies the Wess\textendash{}Zumino consistency condition~\cite{wess-zumino, bbh}. The Chevalley\textendash{}Eilenberg complex $\mathrm{CE}(\mathfrak{g})$ of the gauge algebra computes the zero-form part of the BRST double complex: $H^1(\mathrm{CE}(\mathfrak{g}))$ classifies the abelian quotients of $\mathfrak{g}$, and $H^2(\mathrm{CE}(\mathfrak{g}))$ its central extensions.
\end{definition}

\begin{proposition}[Quantization gate]
\label{prop:anomaly}
A gauge theory admits a consistent quantization only where the determinant line $\lambda_{\mathrm{det}}$ of the Dirac family is trivializable and its anomaly cocycle $[a]$ vanishes in the local BRST cohomology $H^{1,n}(s\mid d)$. The group $H^{1,n}(s\mid d)$ is the space of candidate anomalies of the theory; the specific cocycle $[a]$ is the anomaly of the theory at hand. These two vanishing conditions are the classification content of the anomaly: the obstruction classes are natural in the gauge configuration and classify the inconsistent directions.
\end{proposition}

\begin{proof}
If the determinant line of the family is nontrivial, the path integral measure is a section of a nontrivial line bundle rather than a measure, and gauge transformations multiply the partition function by a nontrivial phase; gauge invariance of the measure fails exactly then. The measure exists exactly when $\lambda_{\mathrm{det}}$ is trivializable. The BRST anomaly class is the obstruction to the nilpotency of the quantized BRST charge: the classical BRST differential satisfies $s^2 = 0$, and the quantum deformation fails to be nilpotent exactly when the anomaly cocycle $[a]$ is nonzero in $H^{1,n}(s\mid d)$. The Wess\textendash{}Zumino consistency condition is the integrability condition for this class and holds by construction~\cite{bbh}. Both constructions are functorial in the gauge configuration, so the obstruction classes are natural and the vanishing test is a classification of the inconsistent directions.
\end{proof}

The anomaly statement is the model of a complete obstruction classification: the classification content of the theory is the vanishing of the obstruction. No list of consistent theories is asserted; what is asserted is a necessary and sufficient condition for consistency. Anomaly cancellation conditions then become computable inputs to the classification of matter content: a matter representation contributes to the anomaly classes, and only the representations whose contributions cancel are admissible.

\begin{example}[Algebraic obstruction data of a gauge algebra]
\label{ex:abelian-anomaly}
Take the gauge algebra to be the two-dimensional non-abelian algebra with basis $e_1, e_2$ and bracket $[e_1, e_2] = e_2$. The Chevalley\textendash{}Eilenberg differential on the dual basis $e^1, e^2$ is $d e^1 = 0$ and $d e^2 = -e^1 \wedge e^2$. The class of $e^1$ in $H^1(\mathrm{CE}(\mathfrak{g}))$ is closed and not exact, so $H^1$ is nonzero and the algebra has a nontrivial abelian quotient; $H^2$ vanishes because $d$ maps the span of $e^2$ onto the whole of $\Lambda^2$. This computation is the algebraic shadow of Definition~\ref{def:bvbrst-anomaly}: the full field-theory anomaly of a gauge theory over a spacetime is computed in the local cohomology $H^{1,n}(s\mid d)$, and the Chevalley\textendash{}Eilenberg classes record the abelian-quotient and central-extension data of the gauge algebra alone. The computation is reproduced by the Chevalley\textendash{}Eilenberg experiment of Section~\ref{sec:experiments}.
\end{example}

Two limitations bound this obstruction statement. The cohomological statement classifies the obstruction and does not by itself construct the quantized theory in the cases where the obstructions vanish. A global anomaly may also remain after the local obstruction classes vanish; the analysis above is the local layer, and the full classification of global anomalies is a further problem on our open list.

\begin{proposition}[Anomaly cancellation as a linear condition]
\label{prop:cancellation}
Fix a compact simple gauge group $G$ and let the matter content be a finite list of finite-dimensional irreducible representations $R_1, \ldots, R_k$ with highest weights $\lambda_1, \ldots, \lambda_k$. The contribution of each representation to a fixed anomaly class is additive, so there is a homomorphism of abelian groups
\[
\alpha \colon R(G) \longrightarrow A,
\]
from the representation ring of $G$ to the coefficient group $A$ of the anomaly in question, and the anomaly-free matter lists form $\ker \alpha$. For the four-dimensional perturbative gauge anomaly $A = \mathbb{Z}$ and $\alpha(R)$ is the anomaly coefficient of $R$; for global anomalies $A$ is the relevant cobordism group of $G$. The admissible matter lists are cut out by linear conditions on the weight data, computable from Theorem~\ref{thm:highest-weight} and Proposition~\ref{prop:anomaly} together.
\end{proposition}

\begin{proof}
The anomaly classes of a direct sum of representations add, since the determinant line of a direct sum is the tensor product of the determinant lines and the BRST differential is linear in the representation data. The assignment $\alpha$ is therefore a homomorphism of abelian groups, and its kernel is the set of virtual representations whose anomaly vanishes. The physical condition restricts to actual representations, so the admissible lists are the nonnegative elements of $\ker \alpha$ in the basis of irreducibles. The highest-weight theorem supplies the basis, and the anomaly computation of Proposition~\ref{prop:anomaly} supplies $\alpha$.
\end{proof}

The proposition turns the anomaly condition into a classification problem for matter content: once the gauge algebra is fixed by its Dynkin diagram, the admissible representations are a computable submonoid of the representation ring. Whether that submonoid is finite or infinite depends on the group and on the anomaly in question, and we record no general finiteness statement.

\section{Functorial and extended topological field theory}
\label{sec:tqft}

The Atiyah axioms package a $d$-dimensional topological quantum field theory as a symmetric monoidal functor $Z$ from the cobordism category $\mathrm{Cob}_d$ to vector spaces: a closed $(d-1)$-manifold $\Sigma$ maps to a vector space $Z(\Sigma)$, a cobordism $M: \Sigma_1 \to \Sigma_2$ maps to a linear map $Z(M): Z(\Sigma_1) \to Z(\Sigma_2)$, composition is preserved, disjoint union is tensor product, and the empty manifold maps to the unit field. The axioms make the topological case tractable in contrast to the general non-topological case, where no comparable functorial formulation is available.

\begin{theorem}[Two-dimensional topological field theories]
\label{thm:frobenius}
The category of two-dimensional Atiyah topological quantum field theories with values in vector spaces is equivalent to the category of commutative Frobenius algebras~\cite{atiyah-tqft}.
\end{theorem}

\begin{proof}
Given a theory $Z$, the circle maps to the algebra $A = Z(S^1)$, the pair of pants with two incoming circles and one outgoing circle gives multiplication $m: A \otimes A \to A$, the reversed pair of pants gives comultiplication $\Delta: A \to A \otimes A$, the disc with one outgoing circle gives the counit, and the reversed disc gives the unit. The Atiyah gluing axioms say precisely that $m$ is associative and unital and that $\Delta$ is coassociative and counital. The Frobenius condition is that $\Delta$ is a homomorphism of $A$-bimodules:
\[
\Delta \circ m = (m \otimes \mathrm{id}_A) \circ (\mathrm{id}_A \otimes \Delta) = (\mathrm{id}_A \otimes m) \circ (\Delta \otimes \mathrm{id}_A),
\]
as maps $A \otimes A \to A \otimes A$; it is the statement that a cylinder cut along a circle decomposes in either order. Commutativity of $m$ is the invariance of the pair of pants under rotation of its incoming boundary. The Euler element $e = m(\Delta(1)) \in A$ is the state assigned to the punctured torus, and the closed genus-one surface evaluates to the scalar $Z(\Sigma_1) = \varepsilon(e)$. Conversely a commutative Frobenius algebra $A$ extends to a functor on two-dimensional cobordisms by cutting each surface along circles into elementary pieces, mapping each piece to the corresponding tensor built from $m$, $\Delta$, the unit, and the counit; the cutting invariance follows from the Frobenius identity, so the value of $Z(M)$ is independent of the chosen decomposition. Both constructions are inverse to each other up to natural isomorphism.
\end{proof}

The theorem is a complete and parameterized classification of two-dimensional functorial theories, and it illustrates the general pattern of this volume: classification succeeds precisely where the physics is topological, because the topological invariance reduces the object to finite-dimensional algebra. Higher-dimensional functorial theories admit analogous invariants built from dualizability data, and we state no classification theorem for them here.

The Frobenius algebra computes every invariant of the theory. The cylinder gives the identity map, the pair of pants gives multiplication, the disc gives unit and counit, and a closed oriented surface of genus $g$ evaluates to the $g$-th power of the Euler element $e = m \circ \Delta(1)$ composed with the counit, so the partition function of the theory is determined by one element of the algebra. Cutting a surface along any circle and reassembling gives the same value, and that cutting independence is the Frobenius identity. The classification is therefore effective: write down a commutative Frobenius algebra, and every observable of the two-dimensional theory is computed from its structure constants.

The extended version asks for a symmetric monoidal higher functor on the fully extended cobordism category, assigning data not only to closed manifolds and cobordisms but to corners and deeper strata. The Baez\textendash{}Dolan cobordism hypothesis proposes the classification.

\begin{conjecture}[Cobordism hypothesis]
\label{conj:cobordism}
The $n$-dimensional extended unitary topological quantum field theories valued in a symmetric monoidal $(\infty, n)$-category are classified by fully dualizable objects of the target with an $O(n)$-action. A fully extended theory is a symmetric monoidal $n$-functor out of the free stable weak $n$-category with duals on a point~\cite{baez-dolan, lurie}.
\end{conjecture}

The status of this statement is a claim with a proof gap. The 1995 paper states the hypothesis; the 2009 work describes itself as an informal sketch of a proof, and the range of cases in which the classification is complete is not settled on the public record. We therefore record the extended classification as claimed rather than proved, and no result in this volume depends on it as a theorem. Low-dimensional cases are the subject of later work; resolving which of those cases carry complete proofs is an open item.

\begin{remark}[What topological classification does not give]
\label{rem:tqft-scope}
A topological quantum field theory is a functorial invariant of manifolds up to cobordism, not a quantum field theory on a fixed spacetime with local degrees of freedom. The classification results in this section say nothing about Yang\textendash{}Mills theory, quantum chromodynamics, or any theory with a metric and a renormalization problem. The line between the topological and the local is the line between classification and the claims register.
\end{remark}

\section{Algebraic quantum field theory and superselection}
\label{sec:aqft}

The algebraic framework postulates the observables of a quantum field theory as a local net: an assignment of a $\mathrm{C}^*$-algebra $\mathcal{A}(\mathcal{O})$ to each open region $\mathcal{O}$ of spacetime, with isotony for nested regions, graded commutation for spacelike separated regions, covariance under the Poincar\'e group, a spectrum condition, and the existence of a vacuum. The axiom list has evolved and remains under discussion, so the framework is conditional on the axiom set in force.

\begin{definition}[Local net]
\label{def:local-net}
A local net on Minkowski spacetime assigns to each double cone $\mathcal{O}$ a unital $\mathrm{C}^*$-algebra $\mathcal{A}(\mathcal{O})$ such that isotony holds for inclusions $\mathcal{O}_1 \subset \mathcal{O}_2$, graded locality holds for spacelike separation, the Poincar\'e group acts by automorphisms covariantly, the spectrum of the generator of time translations is contained in the closed forward cone, and a vacuum state exists~\cite{haag-kastler}. A representation of the net is a representation of the quasilocal algebra $\mathcal{A}$ that is generated by the local algebras.
\end{definition}

\begin{definition}[DHR criterion]
\label{def:dhr}
A representation $\pi$ of a local net satisfies the DHR criterion when its restriction to the algebra of the causal complement of every bounded region is equivalent to the vacuum representation~\cite{dhr}. Two such representations are equivalent when a unitary intertwiner exists.
\end{definition}

The reconstruction theorem holds in Minkowski spacetime of dimension at least $2+1$, where the causal complement of a double cone is connected and locality supplies the permutation symmetry of localized endomorphisms. In spacetime dimension $1+1$ the causal complement of a double cone is disconnected, the braid group replaces the permutation group, and the sector category is braided rather than symmetric; the compact group of Theorem~\ref{thm:dr} is then replaced by quantum-group data.

The DHR selection criterion isolates the representations that arise from local degrees of freedom. Under the additional hypothesis of Haag duality the selected representations correspond to localized transportable endomorphisms of the observable net, and the sectors form a tensor category under composition of endomorphisms.

\begin{theorem}[Doplicher\textendash{}Roberts reconstruction]
\label{thm:dr}
Let $\mathcal{C}$ be a symmetric tensor $\mathrm{C}^*$-category with conjugates, direct sums, subobjects, and $\mathrm{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent to the category of finite-dimensional unitary representations of a compact group $G$ equipped with a distinguished central element $k$ of order at most two, $k^2 = e$, whose adjoint action implements the $\mathbb{Z}/2$ grading of the statistics; in the graded language this data is a compact supergroup. The pair $(G, k)$ is unique up to isomorphism~\cite{dr, dhr}. Applied to the DHR category of a local net satisfying Haag duality, the theorem reconstructs a compact gauge group from the superselection sectors.
\end{theorem}

\begin{proof}
The proof has three stages. The existence of conjugates and subobjects gives the category the structure of a rigid $\mathrm{C}^*$-tensor category; the symmetric structure supplies a dimension function and the categorical traces that make the abstract notion of dimension well-defined. The reconstruction of the group proceeds by taking the endomorphisms of the forgetful functor on the representation category and recovering $G$ as the group of natural automorphisms of the identity on the completed category; the $\mathrm{C}^*$-structure identifies the completed category with the unitary representations of the compact group. Uniqueness follows because a compact group is determined up to isomorphism by its finite-dimensional unitary representation category together with the symmetric monoidal structure.
\end{proof}

The hypotheses travel with the theorem. Dropping the symmetric structure invalidates the recovery: there exist non-isomorphic finite groups with equivalent representation categories as plain tensor categories~\cite{etingof-gelaki}, so any equivalence that forgets the symmetric layer cannot recover the group, and any classification built on such an equivalence is false. Braided variants require additional data; in the braided Galois setting the fixed-point-net representation categories need extra soliton data beyond the braiding~\cite{mueger}.

Deligne's theorem supplies the abstract classification of the symmetric tensor categories that the reconstruction produces.

\begin{theorem}[Deligne's theorem]
\label{thm:deligne}
An abelian, $k$-linear, rigid symmetric monoidal category over an algebraically closed field of characteristic zero, with $\mathrm{End}(\mathbf{1}) = k$ and subexponential growth, is equivalent to the category of representations of an affine supergroup scheme~\cite{deligne}.
\end{theorem}

\begin{proof}
The proof exhibits a fiber functor by a Tannakian argument: the subexponential growth condition bounds the dimensions of simple objects, the symmetric structure gives the braiding needed for a faithful tensor functor to super vector spaces, and the resulting fiber functor presents the category as representations of its automorphism group scheme. The supergrading arises from the possible nontriviality of the symmetry on odd parts.
\end{proof}

The reconstruction results classify the sector categories of nets that satisfy the hypotheses. Three frontier directions are on the record and none of them is settled. The first generalizes the DHR analysis to higher-form symmetries and notes that an extra factor of order two is not ruled out and would not be realizable by Lagrangian gauge models~\cite{casini-magan}; this is a single-source claim and we record it without weight. The second constructs a global quantum gauge group through a braided Doplicher\textendash{}Roberts program~\cite{pinzari}; it is work in progress at the preprint stage. The third is the soliton-data warning already cited~\cite{mueger}, which is proved and shows that fixed-point-net sector categories need data beyond the braiding.

\begin{remark}[Long-range forces]
\label{rem:long-range}
The DHR criterion selects representations whose deviations from the vacuum are localized. Electromagnetism has long-range fields and its charged representations violate the strict localization hypothesis, so the DHR analysis as stated does not cover quantum electrodynamics without modification. The classification of sectors is therefore a classification within a restricted hypothesis class, not of all quantum field theories.
\end{remark}

\section{Reconstruction and classification}
\label{sec:reconstruction}

The Doplicher\textendash{}Roberts theorem is a reconstruction theorem: it recovers a group from the probe data of its representation category. A second line of reconstruction results runs through commutative and topological probes, and comparing the two clarifies what the gauge classification of this volume does and does not achieve.

\begin{theorem}[Reconstruction from commutative probes]
\label{thm:gelfand}
The Gelfand\textendash{}Naimark theorem embeds every $\mathrm{C}^*$-algebra in an algebra of operators on a Hilbert space, and for commutative $\mathrm{C}^*$-algebras the Gelfand transform is an isomorphism onto the continuous functions on the Gelfand spectrum~\cite{gelfand-naimark}. Stone duality is the Boolean analogue: a Boolean algebra is recovered from its space of ultrafilters~\cite{stone}. In each case the object is determined by its commutative or Boolean probe data.
\end{theorem}

\begin{proof}
The Gelfand transform sends an element of a commutative unital $\mathrm{C}^*$-algebra to the function on the maximal ideal space given by evaluation; the spectral radius formula gives continuity, multiplicativity is immediate, and the $\mathrm{C}^*$-identity supplies the isometry property that makes the transform injective and surjective onto $C_0(\Omega)$. The noncommutative embedding is the GNS construction applied to a separating family of states. Stone's theorem is the categorical equivalence between Boolean algebras and the totally disconnected compact Hausdorff spaces, with ultrafilter spaces as the spectrum functor.
\end{proof}

Reconstruction and classification answer different questions. A classification theorem names an invariant whose value determines the object up to a stated equivalence, and its output is a parameter space. A reconstruction theorem recovers the object from a class of probes, and its output is a functor that rebuilds the object. Theorem~\ref{thm:gelfand} rebuilds an algebra from its commutative probes, Theorem~\ref{thm:dr} rebuilds a gauge group from its representation-category probes, and Theorem~\ref{thm:bundles} classifies bundles by homotopy-class data without rebuilding them. The gauge group recovered by Doplicher\textendash{}Roberts is the global form data of Example~\ref{ex:global-form}, which the local algebra of observables cannot see; the reconstruction is therefore genuinely recovering structure rather than reparameterizing it.

The pattern matters for the series program because reconstruction is better developed than classification in several domains. Where a classification is open, a reconstruction result may still recover the object from probes, and where a reconstruction exists, the recovered data becomes a candidate classifying invariant. We record both kinds of result for the gauge and topological domains and mark the boundary between them: bundles are classified, gauge groups are reconstructed from sectors, and the analytic moduli spaces of connections are neither.

\section{Invariant records for gauge theories}
\label{sec:invariants}

The series records the structural invariant record of a theory $T$ as a five-tuple
\[
\mathcal{I}(T) = (\mathcal{S}_T, \mathcal{O}_T, \mathcal{D}_T, \mathcal{G}_T, \mathcal{R}_T),
\]
describing states, observables, dynamics, symmetries, and representations. Instantiating the record for the gauge and topological theories of this volume shows exactly which components the classification results reach.

For a Yang\textendash{}Mills system on a four-manifold with gauge group $G$, the state component $\mathcal{S}_T$ is the moduli space of connections modulo gauge, classified only in its topological stratification by the bundle data. The observable component $\mathcal{O}_T$ is generated by Wilson loops and curvature polynomials, with no classification theorem in this volume. The dynamics component $\mathcal{D}_T$ is the Yang\textendash{}Mills functional, outside all our theorems. The symmetry component $\mathcal{G}_T$ is the gauge group together with its global form, classified by Theorem~\ref{thm:killing-cartan} and Example~\ref{ex:global-form}. The representation component $\mathcal{R}_T$ is the matter content, classified by Theorem~\ref{thm:highest-weight} and constrained by Proposition~\ref{prop:cancellation}.

For a two-dimensional topological theory the record is sharper. The state component is the vector space assigned to the circle, the observable component is the Frobenius algebra of Theorem~\ref{thm:frobenius}, the dynamics is empty because the theory has no local degrees of freedom, the symmetry is the mapping-class action on the assigned spaces, and the representations are the modules over the Frobenius algebra. All five components are determined by the commutative Frobenius algebra, which is why the classification is complete in this case.

For a local net satisfying the DHR hypotheses, the representation component $\mathcal{R}_T$ is the sector category, classified by Theorem~\ref{thm:dr} up to symmetric monoidal equivalence, and the symmetry component $\mathcal{G}_T$ is recovered from it by reconstruction. The state, observable, and dynamics components are those of the net itself and are not classified here.

The classification results of this volume cover the symmetry and representation components of the gauge record and all components of the topological record. The analytic components are open, and the constructive quantum field theory claims of Section~\ref{sec:claims} are attempts to reach them that have not yet arrived.

\section{Claims in constructive quantum field theory}
\label{sec:claims}

The claim ladder separates an announced result, a manuscript, a machine-checked formalization, an independently verified proof, and an accepted theorem; a result moves up the ladder only by an artifact that can be checked, and each row of the register below keeps its current rung. Table~\ref{tab:rigorous} collects rigorous results in restricted regimes and the official problem status. Table~\ref{tab:claims} collects claims that lack public proof artifacts.

\begin{table}[ht]
\centering
\small
\caption{Rigorous results in restricted regimes and the official problem status, as of 29 October 2026. Each row is proved or official within its stated scope.}
\label{tab:rigorous}
\begin{tabularx}{\textwidth}{L{0.20\textwidth} X L{0.30\textwidth}}
\toprule
Entry & Content & Status on the record \\
\midrule
Clay problem status & A positive mass gap for four-dimensional Yang\textendash{}Mills theory & Open. The Clay Mathematics Institute lists the problem as unsolved and records that no proof of the property is known~\cite{clay} \\
\addlinespace
Nissim lattice theorem & Mass gap, unique infinite-volume limit, and large-$N$ limit for $\mathrm{U}(N)$ lattice Yang\textendash{}Mills in the 't Hooft regime~\cite{nissim} & Rigorous theorem restricted to its regime. It does not address continuum four-dimensional existence or the continuum mass gap \\
\addlinespace
Cao\textendash{}Nissim\textendash{}Sheffield lattice theorem & Wilson area law in the 't Hooft regime by the dynamical approach~\cite{cns} & Rigorous theorem restricted to its regime, with the same limitation \\
\addlinespace
Faria da Veiga\textendash{}O'Carroll lattice analysis & Charge-conjugation decomposition, Elitzur theorem, and mass-term analysis for lattice $\mathrm{SU}(N)$ in four dimensions~\cite{fdv} & Rigorous results on the lattice model. They do not close the continuum limit \\
\addlinespace
Douglas survey & Pre-claim survey of the rigorous status: renormalization has never been made rigorous in the needed generality, and no clear path to the mass gap is known~\cite{douglas} & Published assessment, January 2026 \\
\bottomrule
\end{tabularx}
\end{table}

\begin{table}[ht]
\centering
\small
\caption{Claims without public proof artifacts, as of 29 October 2026. None of these rows is a theorem of this volume or of the public record.}
\label{tab:claims}
\begin{tabularx}{\textwidth}{L{0.18\textwidth} X L{0.30\textwidth}}
\toprule
Claim & Content & Status on the record \\
\midrule
OpenAI existence claim & Rigorous existence of quantum chromodynamics, a simplest grand unified completion, and pure Yang\textendash{}Mills theory as a subproblem, by Balaban-program methods~\cite{openai, kitp} & Existence claimed. Manuscript and formalization withheld. Verification pending before a committee chaired by Gross with Douglas, Jaffe, Klebanov, and Nekrasov \\
\addlinespace
Faizal\textendash{}Shabir construction & Reflection-positive four-dimensional $\mathrm{SU}(N)$ Yang\textendash{}Mills theory with mass gap, confinement, and Osterwalder\textendash{}Schrader reconstruction~\cite{faizal} & Journal-published and unverified. Not treated as solving the Clay problem \\
\addlinespace
Jacobsen preprint & Existence and mass gap by a five-dimensional orbifold regulator~\cite{jacobsen} & Withdrawn by arXiv administrators for quality standards. Carries no status \\
\addlinespace
Nair outline & Three-dimensional mass-gap proof outline by a Laplacian eigenvalue inequality~\cite{nair} & Eleven-page preprint outline in three dimensions. No status assigned \\
\bottomrule
\end{tabularx}
\end{table}

The OpenAI claim carries the strongest external attention and the weakest public evidence. Its status string, binding on every mention of the work, is: existence claimed; manuscript and formalization withheld; verification pending~\cite{openai, kitp}. Nothing withheld from the public record can be machine-checked. The release of the artifacts is a tracked event; until then the entry belongs to the claims register and not among theorems.

The mass-gap row is the hard constraint. The Clay problem requires existence and a positive mass gap together~\cite{clay}. An existence theorem alone does not settle it, so the two entries are never merged. The pre-claim survey of the field, published in January 2026~\cite{douglas}, records that rigorous renormalization has never been made rigorous in the needed generality and that no clear path to the mass gap is known; the October 2026 announcement postdates that survey, challenges its pessimism on the existence side, and confirms its assessment on the mass-gap side.

The remaining rows fix the other rungs. A journal-published claim that the community has not verified stays at its rung. A withdrawn preprint leaves the ladder. An outline without proof carries no status. The lattice rows of Table~\ref{tab:rigorous} are rigorous within their regimes and say nothing about the continuum limits the classification needs.

The program these claims enter has foundations older than the claims. The Osterwalder\textendash{}Schrader axioms fix the passage from Euclidean correlation functions to a Minkowski theory~\cite{osterwalder-schrader}. The renormalization-group program for lattice gauge theories that the existence claims invoke descends from Balaban's multiscale cluster expansions~\cite{balaban}. Glimm and Jaffe's text is the standard reference for constructive field theory~\cite{glimm-jaffe}. The register above is the current frontier of that program, and the classification question is which of its eventual members the invariants of the proved core will reach.

If the OpenAI claim is validated, the admissible set of four-dimensional interacting theories will contain at least one rigorous member, and the classification will record where it sits relative to the known families. Until the artifacts are released, no result of this volume depends on the claim. Classifying the structures that are already proved does not wait on the verdict.

A validated existence claim would establish less than it might appear. It would show that a four-dimensional interacting quantum field theory can be constructed with the stated properties, and it would settle the existence half of the Clay problem. It would not give a mass gap, it would not classify the set of such theories, and it would not place the constructed theory inside the classification of gauge structures of Sections~\ref{sec:lie} to~\ref{sec:anomalies} without further work on its gauge group, its bundle data, and its matter representations. The classification program would then face a concrete object in the claimed regime and the question of which invariants reach it. That is the practical shape of the boundary between the proved core and the claims register.

\section{Computational experiments}
\label{sec:experiments}

Four finite-instance checks accompany this volume. They compute small examples and do not test the full domains of the theorems above, whose content is topological, continuous, or infinite-dimensional. The theorems stand on the proofs in Sections~\ref{sec:lie} to~\ref{sec:tqft}.

The first group reproduces the classification table of principal bundles over spheres on small examples. For gauge groups $\mathrm{U}(1)$, $\mathrm{SU}(2)$, $\mathrm{SO}(3)$, and $\mathrm{U}(2)$ and base spheres of dimensions one to four, the script writes the homotopy group $\pi_{n-1}(G)$ that Proposition~\ref{prop:spheres} identifies, and records the characteristic class that detects the generator where one is standard. The output reproduces the known values: $\mathrm{U}(1)$-bundles over $S^2$ form a copy of $\mathbb{Z}$ detected by $c_1$, $\mathrm{SU}(2)$-bundles over $S^2$ and $S^3$ are trivial, and $\mathrm{SU}(2)$-bundles over $S^4$ form a copy of $\mathbb{Z}$ detected by $c_2$. The $\mathrm{SO}(3)$ column reproduces Example~\ref{ex:global-form}: a copy of $\mathbb{Z}/2$ over $S^2$ detected by $w_2$, which is the global-form distinction the Lie algebra cannot see.

The second group computes Chevalley\textendash{}Eilenberg cohomology for two small gauge algebras. For the two-dimensional non-abelian algebra of Example~\ref{ex:abelian-anomaly} and for $\mathfrak{su}(2)$ the script constructs the differential exactly over the rationals, computes $H^1$ and $H^2$, and reports the algebraic obstruction data. The non-abelian case displays the nonzero first class that records its nontrivial abelian quotient, and the semisimple case displays the vanishing consistent with the absence of abelian quotients. The script checks Example~\ref{ex:abelian-anomaly} on the nose; the field-theory anomaly of Definition~\ref{def:bvbrst-anomaly} lives in the local BRST cohomology and is not computed here.

The third group tests the Frobenius correspondence of Theorem~\ref{thm:frobenius} on one finite-dimensional algebra. For the group algebra of $\mathbb{Z}/2$ the script builds the functor on two-dimensional cobordisms cut into elementary pieces and verifies that the value of a closed surface is independent of the decomposition and that the gluing axioms hold. The failure mode it guards against is a degenerate counit on an otherwise well-behaved algebra; the script constructs one and shows that the dual-basis construction of the comultiplication fails there, so the Frobenius condition is doing real work in the correspondence.

The fourth group enumerates connected Dynkin diagrams up to rank eight. By testing the Cartan-matrix conditions of positive definiteness and integrality on the finite set of candidate graphs of rank at most eight, the script recovers exactly the finite-type lists $A_r$, $B_r$, $C_r$, $D_r$, $G_2$, $F_4$, $E_6$, $E_7$, $E_8$ and no others. The enumeration is a check on the classification rather than a proof of it, since the argument that no other diagrams exist is the mathematical content of Theorem~\ref{thm:killing-cartan}.

The code evidence appendix maps each finite-instance check to its file and function.

\begin{table}[ht]
\centering
\small
\caption{Code evidence for the finite-instance checks of Section~\ref{sec:experiments}. Each row names the check and the file that performs it.}
\label{tab:code}
\begin{tabularx}{\textwidth}{X L{0.30\textwidth} L{0.18\textwidth}}
\toprule
Finite-instance check & File and function & Statement illustrated \\
\midrule
The classification values of Proposition~\ref{prop:spheres} and their standard detectors reproduce on the listed groups and dimensions & bundle\_classification.py, function classify\_sphere\_bundles & Proposition~\ref{prop:spheres} \\
\addlinespace
The Chevalley\textendash{}Eilenberg classes of Example~\ref{ex:abelian-anomaly} compute as stated & anomaly\_cohomology.py, function ce\_obstruction\_pair & Example~\ref{ex:abelian-anomaly} \\
\addlinespace
A commutative Frobenius algebra yields a decomposition-independent two-dimensional theory on the tested algebra & tqft\_frobenius.py, function verify\_atiyah\_gluing & Theorem~\ref{thm:frobenius} \\
\addlinespace
Connected Dynkin diagrams of rank up to eight are exactly the finite-type Cartan lists & dynkin\_enumeration.py, function enumerate\_finite\_type & Theorem~\ref{thm:killing-cartan} \\
\bottomrule
\end{tabularx}
\end{table}

\section{Open problems}
\label{sec:open}

Six problems bound the classification in this volume and each is stated at the strength the record supports.

The proof status of the extended topological field theory classification is the first. The cobordism hypothesis is stated and the 2009 writeup is an informal sketch; which cases of the classification carry complete proofs, and in which dimensions, is not settled on the public record. Low-dimensional cases are the subject of later work, and resolving which of them are complete is the open item that would move the extended classification from claimed to proved.

The anomaly classification has its own gap. The local and algebraic obstruction classes are computed, and the global anomaly question has a partial theory, but the general cobordism-spectrum statement that would classify all anomalies uniformly is not on the record in a form we can verify. A primary source is needed before any statement of that classification may be used.

The constructive quantum field theory claims have a tracked event. The release of the withheld manuscript and the claimed formalization behind the October 2026 existence announcement would move that row of Table~\ref{tab:claims} from withheld to publicly checkable, and a committee verdict would move it further. Until the release, no result of this volume depends on it. The competing journal-published construction of a four-dimensional Yang\textendash{}Mills theory with a mass gap carries a second question: where its continuum limit is closed and where it is assumed. An audit of that construction is the sharpest available test of the mass-gap claim, and the audit has not been done.

The algebraic framework has an open foundation. The Haag\textendash{}Kastler axiom list is under discussion, and the sector classification of Section~\ref{sec:aqft} is conditional on the axiom set in force and on Haag duality. Whether the Doplicher\textendash{}Roberts uniqueness statement survives the relaxation of those hypotheses is open; the braided setting already shows that extra data can appear.

A single-source frontier claim needs verification. The possible extra factor of order two in the sector data of higher-form symmetric theories is noted in one preprint, and the classification of higher-form sectors would change if the possibility is realized. We record it and do not build on it.

The classification of connections modulo gauge is open outside restricted cases. The bundle is classified, the gauge algebra is classified, and the matter representations are classified; the moduli space of connections carries the analytic theory and no classification theorem in the sense of this volume reaches it. A classification restricted to flat connections, or to self-dual connections in dimension four, is the natural next restricted-class result.

\section{Limitations}
\label{sec:limitations}

This volume classifies structures, not physical theories in full. Four limitations bound the conclusions.

The classification of principal bundles is classification of the bundle. Connections are classified only modulo gauge in restricted settings, and no general classification theorem for connections is recorded. The dynamics of a gauge theory, the quantum state space, and the observable algebra are outside the classification results of Sections~\ref{sec:lie} and~\ref{sec:bundles}.

The superselection analysis is restricted to nets satisfying the DHR criterion and Haag duality. Long-range forces such as electromagnetism fall outside the criterion as stated, and the Haag\textendash{}Kastler axiom list itself is under discussion. The Doplicher\textendash{}Roberts theorem reconstructs a gauge group from the sectors of a net that satisfies its hypotheses; it does not classify nets.

The extended topological field theory classification is claimed and not proved, so no conclusion of this volume may rest on it. The four-dimensional constructive claims are registered at their rungs and are not used as premises. The Clay mass gap problem is open and is recorded as open.

The computational experiments are evidence. They reproduce known classification tables and test obstruction conditions on small examples, and they do not establish any theorem. The phrase used elsewhere in the series applies here as well: executable models validated against specifications, never machine-checked proofs.

A further limitation is inherited from the series. The choice of physical equivalence is not settled, so every classification statement here is classification up to an explicitly named equivalence: isomorphism of principal bundles, isomorphism of Lie algebras, equivalence of categories preserving the symmetric monoidal structure, or unitary equivalence of representations. Statements that would require a stronger or weaker equivalence are marked by the structure they preserve. The Etingof\textendash{}Gelaki constraint is the standing warning: an equivalence that forgets the symmetric monoidal layer cannot recover the group, so no classification record in this volume identifies systems by an equivalence without naming the layers it keeps.

\section{Conclusion}
\label{sec:conclusion}

Rigorous classification of gauge and quantum field theories succeeds where topological or algebraic data decouple from continuum dynamics. The Killing\textendash{}Cartan root diagrams parameterize complex semisimple Lie algebras. Dominant integral weights classify the finite-dimensional irreducible representations. Homotopy classes $[X, BG]$ classify principal $G$-bundles, with characteristic classes in $H^*(BG)$ as computable invariants. Commutative Frobenius algebras classify two-dimensional functorial field theories. For gauge theories with fermions, anomaly cancellation is a complete cohomological obstruction: the theory is consistent exactly where the Dirac determinant line bundle is trivializable and the local BRST class in $H^{1,n}(s\mid d)$ vanishes. Outside these topological and algebraic domains, the classification of four-dimensional continuum field theories lacks a non-perturbative construction, the gauge connection moduli spaces are unclassified, and the mass spectrum is open.

The two incomplete places are the extended topological field theory classification and four-dimensional constructive quantum field theory. The first is claimed on the strength of a proof sketch and registered as such. The second is a claims register: one existence result announced with its artifacts withheld, one mass gap open, one journal-published unverified construction, one withdrawn preprint, regime-restricted lattice theorems, and one outline. The ladder keeps them apart, and the classification program does not import any of them as a dependency.

The structural lesson is the one the series draws from Darboux as well. Classification content is exactly where the invariant is finite or parameterized, which for gauge structures means the topological and the algebraic layers. The analytic layer, where a metric, a renormalization group, and a continuum limit are in play, is where classification is claimed or open. A complete classification of mathematical representations of gauge theories would therefore proceed from the proved islands outward, and the boundary of the proved region is now recorded precisely.

Two outcomes of the continuing program are both acceptable results. One is a classification of a restricted class: flat connections on a fixed bundle, self-dual connections in a fixed topological class, or the sectors of nets satisfying a fixed axiom list. The other is an impossibility theorem showing that a natural classification objective cannot be met without additional restrictions. The obstruction results already in evidence, from the anomaly classes to the global-form distinctions to the extra data in braided sector categories, are of the second kind and are theorems rather than caveats.

The volume closes where the classification is sharp. Gauge algebras, matter representations, bundles, anomaly-free configurations, and two-dimensional topological theories are classified by explicit invariants under stated equivalences. The extended topological classification is claimed and registered as claimed. Four-dimensional existence is claimed with its artifacts withheld and the mass gap is open. The claim ladder keeps those rows apart, and the classification program carries the proved rows forward without waiting on the others.

\begin{thebibliography}{36}

\bibitem{atiyah-tqft}
M. Atiyah, \emph{Topological quantum field theories}. Publications Math\'ematiques de l'IH\'ES 68 (1988) 175\textendash186.

\bibitem{atiyah-singer}
M. Atiyah and I. Singer, \emph{The index of elliptic operators IV}. Annals of Mathematics 93 (1971) 119\textendash138.

\bibitem{baez-dolan}
J. Baez and J. Dolan, \emph{Higher-dimensional algebra and topological quantum field theory}. arXiv:q-alg/9503002, 1995. \url{https://arxiv.org/abs/q-alg/9503002}

\bibitem{balaban}
T. Balaban, \emph{Renormalization group approach to lattice gauge field theories I}. Communications in Mathematical Physics 109 (1987) 249\textendash301.

\bibitem{bbh}
G. Barnich, F. Brandt, and M. Henneaux, \emph{Local BRST cohomology in gauge theories}. Physics Reports 338 (2000) 439\textendash569. arXiv:hep-th/0002245.

\bibitem{cns}
S. Cao, R. Nissim, and S. Sheffield, \emph{Dynamical approach to area law for lattice Yang\textendash{}Mills}. arXiv:2509.04688, 2025. \url{https://arxiv.org/abs/2509.04688}

\bibitem{casini-magan}
H. Casini and J. M. Magan, \emph{A generalization of the DHR theorem for higher form symmetries}. arXiv:2511.21810, 2025. \url{https://arxiv.org/abs/2511.21810}

\bibitem{clay}
Clay Mathematics Institute, \emph{Yang\textendash{}Mills and the mass gap}. \url{https://www.claymath.org/millennium/yang-mills-the-maths-gap/} (accessed 2026-10-29).

\bibitem{deligne}
P. Deligne, \emph{Cat\'egories tensorielles}. Moscow Mathematical Journal 2 (2002) 227\textendash248.

\bibitem{dold}
A. Dold, \emph{Partitions of unity in the theory of fibrations}. Annals of Mathematics 78 (1963) 223\textendash255.

\bibitem{dhr}
S. Doplicher, R. Haag, and J. Roberts, \emph{Local observables and particle statistics I}. Communications in Mathematical Physics 15 (1969) 173\textendash200.

\bibitem{dr}
S. Doplicher and J. E. Roberts, \emph{A new duality theory for compact groups}. Inventiones Mathematicae 98 (1989) 157\textendash218.

\bibitem{douglas}
M. R. Douglas, \emph{The Yang\textendash{}Mills Millennium problem}. Nature Reviews Physics 8 (2026) 86\textendash97. \url{https://www.nature.com/articles/s42254-025-00909-2}

\bibitem{etingof-gelaki}
P. Etingof and S. Gelaki, \emph{Isocategorical groups}. International Mathematics Research Notices 2001, 59\textendash77. arXiv:math/0007196.

\bibitem{faizal}
M. Faizal and A. Shabir, \emph{Reflection-Positive Construction of a Four-Dimensional SU(N) Yang\textendash{}Mills Theory with Mass Gap and Confinement}. arXiv:2606.19362, 2026. \url{https://arxiv.org/abs/2606.19362}

\bibitem{fdv}
P. A. Faria da Veiga and M. O'Carroll, \emph{On Charge Conjugation, Correlations, Elitzur's Theorem and the Mass Gap Problem in Lattice $\mathrm{SU}(N)$ Yang\textendash{}Mills Models in $d=4$ Dimensions}. arXiv:2509.03513, 2025. \url{https://arxiv.org/abs/2509.03513}

\bibitem{gelfand-naimark}
I. Gelfand and M. Naimark, \emph{On the imbedding of normed rings into the ring of operators in Hilbert space}. Matematicheskii Sbornik 12 (1943) 197\textendash213.

\bibitem{glimm-jaffe}
J. Glimm and A. Jaffe, \emph{Quantum Physics: A Functional Integral Point of View}. Springer, 1981.

\bibitem{haag-kastler}
R. Haag and D. Kastler, \emph{An algebraic approach to quantum field theory}. Journal of Mathematical Physics 5 (1964) 915\textendash922.

\bibitem{humphreys}
J. E. Humphreys, \emph{Introduction to Lie Algebras and Representation Theory}. Graduate Texts in Mathematics 9, Springer, 1972.

\bibitem{jacobsen}
D. C. Jacobsen, \emph{A Constructive Proof of Existence and Mass Gap for Pure $\mathrm{SU}(3)$ Yang\textendash{}Mills in Four-Dimensional Space-Time}. arXiv:2506.00284, withdrawn by arXiv administrators in 2025. \url{https://arxiv.org/abs/2506.00284}

\bibitem{kitp}
KITP Yang\textendash{}Mills working group statement, 2026-10. \url{https://www.kitp.ucsb.edu/sites/default/files/YM_working_group.pdf}

\bibitem{lurie}
J. Lurie, \emph{On the Classification of Topological Field Theories}. arXiv:0905.0465, 2009. \url{https://arxiv.org/abs/0905.0465}

\bibitem{milnor}
J. Milnor, \emph{The construction of universal bundles I, II}. Annals of Mathematics 63 (1956) 272\textendash284 and 65 (1957) 430\textendash436.

\bibitem{milnor-stasheff}
J. Milnor and J. Stasheff, \emph{Characteristic Classes}. Princeton University Press, 1974.

\bibitem{mueger}
M. M\"uger, \emph{Conformal Field Theory and Doplicher\textendash{}Roberts Reconstruction}. arXiv:math-ph/0008027, 2000. \url{https://arxiv.org/abs/math-ph/0008027}

\bibitem{nair}
V. P. Nair, \emph{Towards a Proof of Mass Gap in 3d Yang\textendash{}Mills Theory}. arXiv:2608.10133, 2026. \url{https://arxiv.org/abs/2608.10133}

\bibitem{nissim}
R. Nissim, \emph{$\mathrm{U}(N)$ lattice Yang\textendash{}Mills in the 't Hooft regime}. arXiv:2510.22788, 2025. \url{https://arxiv.org/abs/2510.22788}

\bibitem{openai}
OpenAI, \emph{Building scientific understanding with academic communities}, 2026-10-26. \url{https://openai.com/index/building-scientific-understanding-with-academic-communities/}

\bibitem{osterwalder-schrader}
K. Osterwalder and R. Schrader, \emph{Axioms for Euclidean Green's functions II}. Communications in Mathematical Physics 42 (1975) 281\textendash305.

\bibitem{pinzari}
C. Pinzari, \emph{Uniqueness of braided tensor structures and the Huang\textendash{}Lepowsky structure on affine vertex operator algebras in the classical Lie types and G2}. arXiv:2502.06229, version 8 dated 2026-09-19. \url{https://arxiv.org/abs/2502.06229}

\bibitem{quillen}
D. Quillen, \emph{Determinants of Cauchy\textendash{}Riemann operators on Riemann surfaces}. Functional Analysis and its Applications 19 (1985) 31\textendash34.

\bibitem{serre}
J.-P. Serre, \emph{Complex Semisimple Lie Algebras}. Springer, 1987.

\bibitem{steenrod}
N. Steenrod, \emph{The Topology of Fibre Bundles}. Princeton University Press, 1951.

\bibitem{stone}
M. H. Stone, \emph{The theory of representations for Boolean algebras}. Transactions of the American Mathematical Society 40 (1936) 37\textendash111.

\bibitem{wess-zumino}
J. Wess and B. Zumino, \emph{Consequences of anomalous Ward identities}. Physics Letters B 37 (1971) 95\textendash99.

\end{thebibliography}

\end{document}

exec
/usr/local/bin/zsh -lc 'cat src/vol-07-gauge-qft/bundle_classification.py' in /Users/mlong/Documents/Development/classification-physical-systems
exec
/usr/local/bin/zsh -lc 'cat src/vol-07-gauge-qft/dynkin_enumeration.py' in /Users/mlong/Documents/Development/classification-physical-systems
exec
/usr/local/bin/zsh -lc "sed -n '180,430p' papers/latex/vol-07-gauge-qft.tex" in /Users/mlong/Documents/Development/classification-physical-systems
exec
/usr/local/bin/zsh -lc 'cat src/vol-07-gauge-qft/anomaly_cohomology.py' in /Users/mlong/Documents/Development/classification-physical-systems
exec
/usr/local/bin/zsh -lc 'cat src/vol-07-gauge-qft/tqft_frobenius.py' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D experiment: classification of principal bundles over spheres.

Claim evidenced (paper, Proposition 4.3 and Examples 4.1 to 4.4):
isomorphism classes of principal G-bundles over S^n are classified by
pi_{n-1}(G), and the listed characteristic class detects the class where one
is standard. This is computational evidence for the classification table,
never proof; the proof is the long exact homotopy sequence of the universal
bundle in the paper.

Module: bundle_classification.py
Function named in the code evidence appendix: classify_sphere_bundles
"""

from dataclasses import dataclass


@dataclass(frozen=True)
class HomotopyGroup:
    """Homotopy group of a Lie group at a given degree, as an abstract label."""

    degree: int
    label: str  # "0", "Z", "Z/2", ...


# Standard homotopy groups of the compact classical groups in the range the
# experiment needs (degrees 0 to 3). Sources: standard textbooks; the labels
# match the values used in Examples 4.1 to 4.4 of the paper.
HOMOTOPY = {
    "U(1)": [HomotopyGroup(0, "0"), HomotopyGroup(1, "Z"),
             HomotopyGroup(2, "0"), HomotopyGroup(3, "0")],
    "SU(2)": [HomotopyGroup(0, "0"), HomotopyGroup(1, "0"),
              HomotopyGroup(2, "0"), HomotopyGroup(3, "Z")],
    "SO(3)": [HomotopyGroup(0, "0"), HomotopyGroup(1, "Z/2"),
              HomotopyGroup(2, "0"), HomotopyGroup(3, "Z")],
    "U(2)": [HomotopyGroup(0, "0"), HomotopyGroup(1, "Z"),
             HomotopyGroup(2, "0"), HomotopyGroup(3, "Z")],
    "SU(3)": [HomotopyGroup(0, "0"), HomotopyGroup(1, "0"),
              HomotopyGroup(2, "0"), HomotopyGroup(3, "Z")],
}

# Characteristic class that detects the generator in each nontrivial case.
DETECTOR = {
    ("U(1)", 2): "c1 (first Chern class)",
    ("SO(3)", 2): "w2 (second Stiefel-Whitney class)",
    ("SO(3)", 4): "p1 (first Pontryagin number)",
    ("SU(2)", 4): "c2 (instanton number)",
    ("U(2)", 2): "c1 (first Chern class)",
    ("U(2)", 4): "c2 (instanton number)",
    ("SU(3)", 4): "c2 (instanton number)",
}


def classify_sphere_bundles(groups=None, dimensions=(1, 2, 3, 4)):
    """Classify principal G-bundles over spheres by pi_{n-1}(G).

    Returns a list of rows (group, sphere dimension, pi_{n-1} label, detector)
    and checks the values against the known classification recorded in
    Examples 4.1 to 4.4 of the paper.
    """
    if groups is None:
        groups = ["U(1)", "SU(2)", "SO(3)", "U(2)", "SU(3)"]
    rows = []
    for group in groups:
        for n in dimensions:
            hg = HOMOTOPY[group][n - 1]
            detector = DETECTOR.get((group, n), "trivial class" if hg.label == "0" else "-")
            rows.append((group, n, hg.label, detector))

    # Assertions against the paper's stated values.
    lookup = {(g, n): lbl for g, n, lbl, _ in rows}
    assert lookup[("U(1)", 2)] == "Z", "Example 4.1: U(1)-bundles over S^2 form Z"
    assert lookup[("SU(2)", 2)] == "0", "Example 4.3: SU(2)-bundles over S^2 are trivial"
    assert lookup[("SU(2)", 3)] == "0", "Example 4.3: SU(2)-bundles over S^3 are trivial"
    assert lookup[("SU(2)", 4)] == "Z", "Example 4.3: SU(2)-bundles over S^4 form Z"
    assert lookup[("SO(3)", 2)] == "Z/2", "Example 4.4: SO(3)-bundles over S^2 form Z/2"
    assert lookup[("U(1)", 1)] == "0", "connected group: bundles over S^1 are trivial"
    return rows


def format_table(rows):
    header = f"{'group':<8} {'sphere':<8} {'pi_{n-1}(G)':<14} {'detector':<32}"
    lines = [header, "-" * len(header)]
    for group, n, label, detector in rows:
        lines.append(f"{group:<8} S^{n:<6} {label:<14} {detector:<32}")
    return "\n".join(lines)


if __name__ == "__main__":
    print("=== Phase D: principal G-bundles over spheres (computational evidence) ===")
    print("Classification claim: GBund(S^n) = pi_{n-1}(G) (paper, Proposition 4.3).")
    print()
    result = classify_sphere_bundles()
    print(format_table(result))
    print()
    print("All known-value assertions passed.")
    print("Status: computational evidence only; the theorem is proved in the paper.")

 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D experiment: finite-type Dynkin diagrams up to rank eight.

Claim evidenced (paper, Theorem 3.1): the connected Dynkin diagrams of finite
type are exactly the lists A_r, B_r, C_r, D_r, G2, F4, E6, E7, E8. The
experiment enumerates all edge-labelled trees up to eight nodes, builds the
corresponding Cartan matrices, keeps the positive definite ones, and checks
that the surviving isomorphism classes are exactly the standard finite-type
list. Computational evidence only; the classification theorem is Theorem 3.1
of the paper.

Module: dynkin_enumeration.py
Function named in the code evidence appendix: enumerate_finite_type
"""

# Label convention for adjacency entries (node -> [(neighbor, label)]):
#   1 = single edge (a_ij = a_ji = -1)
#   2 = double edge, arrow at `node` (a_node,other = -2)
#   3 = double edge, arrow at `neighbor` (a_node,other = -1, a_other,node = -2)
#   4 = triple-edge form of G2, arrow at `node` (a_node,other = -3)
#   5 = triple-edge form of G2, arrow at `neighbor`
# A multiple edge is stored with complementary labels at its two endpoints:
# 2 with 3, and 4 with 5.

from fractions import Fraction


def canonical_form(adj):
    """AHU canonical string of an edge-labelled unrooted tree.

    The mark of a parent-child edge records its shape as seen in that
    direction. The string is an isomorphism invariant of the labelled tree.
    """

    def rooted_encoding(root, parent):
        parts = []
        for neighbor, label in adj[root]:
            if neighbor == parent:
                continue
            if label == 1:
                mark = "s"
            elif label in (2, 4):
                # arrow points at root, i.e. at the parent side of this edge.
                mark = "d3" if label == 4 else "d2"
            else:
                mark = "D3" if label == 5 else "D2"
            parts.append(mark + rooted_encoding(neighbor, root))
        return "(" + "".join(sorted(parts)) + ")"

    degree = {node: sum(1 for _ in adj[node]) for node in adj}
    current = dict(degree)
    leaves = [node for node, d in current.items() if d <= 1]
    remaining = len(adj)
    while remaining > 2:
        next_leaves = []
        for node in leaves:
            current[node] = -1
            remaining -= 1
            for neighbor, _ in adj[node]:
                if current[neighbor] >= 0:
                    current[neighbor] -= 1
                    if current[neighbor] == 1:
                        next_leaves.append(neighbor)
        leaves = next_leaves
    centers = [node for node in adj if current[node] >= 0]
    return min(rooted_encoding(center, None) for center in centers)


def enumerate_unlabelled_trees(n):
    """All unlabelled trees on n nodes as adjacency dicts with label 1."""
    if n == 1:
        return [{0: []}]
    seen = {}
    for smaller in enumerate_unlabelled_trees(n - 1):
        for attach_to in smaller:
            candidate = {node: list(neigh) for node, neigh in smaller.items()}
            new_node = n - 1
            candidate[new_node] = []
            candidate[attach_to].append((new_node, 1))
            candidate[new_node].append((attach_to, 1))
            key = canonical_form(candidate)
            if key not in seen:
                seen[key] = candidate
    return list(seen.values())


def edge_list(adj):
    edges = []
    for node, neigh in adj.items():
        for nb, label in neigh:
            if node < nb:
                edges.append((node, nb, label))
    return edges


def apply_labels(tree, labels):
    """Labelled copy of `tree` for a per-edge label tuple.

    For a multiple edge, the arrow target is the endpoint named by the label:
    labels 2 and 4 put the arrow at the lower-index endpoint, labels 3 and 5
    at the higher-index endpoint.
    """
    adj = {node: [] for node in tree}
    for (u, v, _), label in zip(edge_list(tree), labels):
        if label == 1:
            adj[u].append((v, 1))
            adj[v].append((u, 1))
        elif label == 2:
            adj[u].append((v, 2))
            adj[v].append((u, 3))
        elif label == 3:
            adj[u].append((v, 3))
            adj[v].append((u, 2))
        elif label == 4:
            adj[u].append((v, 4))
            adj[v].append((u, 5))
        else:
            adj[u].append((v, 5))
            adj[v].append((u, 4))
    return adj


def cartan_matrix(adj):
    """Cartan matrix of the labelled tree: 2 on the diagonal, -1 or -2 or -3
    off it, with the short root's row carrying the larger entry."""
    nodes = sorted(adj)
    index = {node: i for i, node in enumerate(nodes)}
    n = len(nodes)
    matrix = [[2 if i == j else 0 for j in range(n)] for i in range(n)]
    for node, neigh in adj.items():
        for nb, label in neigh:
            i, j = index[node], index[nb]
            if label == 1:
                matrix[i][j] = -1
            elif label == 2:
                matrix[i][j] = -2
            elif label == 4:
                matrix[i][j] = -3
            else:
                matrix[i][j] = -1
    return matrix


def det_exact(matrix):
    """Exact determinant of a matrix over Q by Bareiss elimination."""
    n = len(matrix)
    mat = [[Fraction(v) for v in row] for row in matrix]
    sign = 1
    prev = Fraction(1)
    for k in range(n - 1):
        if mat[k][k] == 0:
            swap = None
            for r in range(k + 1, n):
                if mat[r][k] != 0:
                    swap = r
                    break
            if swap is None:
                return Fraction(0)
            mat[k], mat[swap] = mat[swap], mat[k]
            sign = -sign
        for i in range(k + 1, n):
            for j in range(k + 1, n):
                mat[i][j] = (mat[i][j] * mat[k][k] - mat[i][k] * mat[k][j]) / prev
        prev = mat[k][k]
    return sign * mat[n - 1][n - 1]


def symmetrized_form(cartan, adj):
    """The symmetric bilinear form of the root system.

    The Cartan matrix is symmetrizable: with positive weights d_i such that
    d_i a_ij = d_j a_ji the matrix B_ij = d_i a_ij is symmetric, and B is the
    form whose positive definiteness is the finite-type condition. The weights
    are propagated by breadth-first search over the tree.
    """
    nodes = sorted(adj)
    index = {node: i for i, node in enumerate(nodes)}
    n = len(nodes)
    weights = {nodes[0]: Fraction(1)}
    queue = [nodes[0]]
    while queue:
        node = queue.pop()
        for nb, _ in adj[node]:
            if nb in weights:
                continue
            i, j = index[node], index[nb]
            weights[nb] = weights[node] * Fraction(cartan[i][j], cartan[j][i])
            queue.append(nb)
    b = [[Fraction(0)] * n for _ in range(n)]
    for i, node_i in enumerate(nodes):
        for j, node_j in enumerate(nodes):
            b[i][j] = weights[node_i] * cartan[i][j]
    return b


def is_positive_definite(cartan, adj):
    """Sylvester's criterion on the symmetrized Cartan form."""
    n = len(cartan)
    b = symmetrized_form(cartan, adj)
    for k in range(1, n + 1):
        minor = [row[:k] for row in b[:k]]
        if det_exact(minor) <= 0:
            return False
    return True


def arm_lengths(adj, center):
    lengths = []
    for neighbor, _ in adj[center]:
        length = 1
        prev, cur = center, neighbor
        while len(adj[cur]) > 1:
            for nb, _ in adj[cur]:
                if nb != prev:
                    prev, cur = cur, nb
                    length += 1
                    break
        lengths.append(length)
    return sorted(lengths)


def name_diagram(adj):
    """Human-readable name of a connected edge-labelled tree."""
    n = len(adj)
    degrees = sorted(len(neigh) for neigh in adj.values())
    multiples = [edge for edge in edge_list(adj) if edge[2] != 1]
    if n == 1:
        return "A1"
    if n == 2:
        label = multiples[0][2] if multiples else 1
        if label in (4, 5):
            return "G2"
        return "B2 (same class as C2)" if multiples else "A2"
    if not multiples and max(degrees) == 2:
        return f"A{n}"
    if not multiples and max(degrees) == 3:
        center = max(adj, key=lambda node: len(adj[node]))
        arm = arm_lengths(adj, center)
        if arm == [1, 1, n - 3]:
            return f"D{n}"
        if arm == [1, 2, n - 4] and n in (6, 7, 8):
            return f"E{n}"
        return f"unnamed fork of rank {n}"
    if len(multiples) == 1 and max(degrees) == 2 and multiples[0][2] in (2, 3):
        u, v, _ = multiples[0]
        endpoint = u if len(adj[u]) == 1 else v if len(adj[v]) == 1 else None
        if endpoint is not None:
            return f"B{n} or C{n}"
        return "F4" if n == 4 else f"unnamed inner double edge of rank {n}"
    return f"unnamed diagram of rank {n}"


def pruned_labelings(edge_count):
    """Label tuples with at most one non-single edge.

    A diagram with two multiple edges is never positive definite; the
    unpruned cross-check at rank at most 4 below verifies this pruning does
    not change the finite-type output.
    """
    yield tuple(1 for _ in range(edge_count))
    for pos in range(edge_count):
        for label in (2, 3, 4, 5):
            labels = [1] * edge_count
            labels[pos] = label
            yield tuple(labels)


def full_labelings(edge_count):
    if edge_count == 0:
        yield ()
        return
    for rest in full_labelings(edge_count - 1):
        for label in (1, 2, 3, 4, 5):
            yield rest + (label,)


def enumerate_finite_type(max_rank=8, cross_check_rank=8):
    """Enumerate positive definite edge-labelled trees up to `max_rank` nodes.

    Returns (rows, forms) where rows are (rank, name, canonical form) of each
    isomorphism class found and forms is the set of canonical strings. Every
    rank up to `cross_check_rank` is enumerated WITHOUT pruning: all 5^(n-1)
    arrow assignments of every unlabelled tree are tested for positive
    definiteness, so no candidate with two or more multiple edges is skipped.
    """
    rows = []
    found = {}
    for n in range(1, max_rank + 1):
        for tree in enumerate_unlabelled_trees(n):
            edges = edge_list(tree)
            if n <= cross_check_rank:
                pruned = set()
                for labels in pruned_labelings(len(edges)):
                    adj = apply_labels(tree, labels)
                    if is_positive_definite(cartan_matrix(adj), adj):
                        pruned.add(canonical_form(adj))
                unpruned = set()
                for labels in full_labelings(len(edges)):
                    adj = apply_labels(tree, labels)
                    if is_positive_definite(cartan_matrix(adj), adj):
                        unpruned.add(canonical_form(adj))
                assert pruned == unpruned, (
                    f"pruning changed the output at rank {n}: {pruned ^ unpruned}"
                )
            for labels in full_labelings(len(edges)):
                adj = apply_labels(tree, labels)
                if not is_positive_definite(cartan_matrix(adj), adj):
                    continue
                key = canonical_form(adj)
                if key in found:
                    continue
                found[key] = n
                rows.append((n, name_diagram(adj), key))
    return rows, set(found)


def fork_tree(arms):
    """Tree with a center and arms of the given leaf counts."""
    adj = {0: []}
    nxt = 1
    for arm in arms:
        prev = 0
        for _ in range(arm):
            adj[prev].append((nxt, 1))
            adj[nxt] = [(prev, 1)]
            prev = nxt
            nxt += 1
    return adj


def path_tree(n):
    path = {i: [] for i in range(n)}
    for i in range(n - 1):
        path[i].append((i + 1, 1))
        path[i + 1].append((i, 1))
    return path


def expected_finite_type():
    """Canonical forms of the standard finite-type diagrams up to rank 8.

    Built from the standard shapes without any positive-definiteness test, so
    the comparison against the enumeration verifies that these shapes are
    exactly the positive definite ones.
    """
    expected = {}
    for n in range(1, 9):
        expected[f"A{n}"] = canonical_form(path_tree(n))
    expected["B2"] = canonical_form({0: [(1, 2)], 1: [(0, 3)]})
    expected["G2"] = canonical_form({0: [(1, 4)], 1: [(0, 5)]})
    for n in range(3, 9):
        for arrow in (2, 3):
            labelled = path_tree(n)
            labelled[n - 2] = [(nb, l) for nb, l in labelled[n - 2] if nb != n - 1]
            labelled[n - 1] = [(nb, l) for nb, l in labelled[n - 1] if nb != n - 2]
            if arrow == 2:
                labelled[n - 2].append((n - 1, 2))
                labelled[n - 1].append((n - 2, 3))
            else:
                labelled[n - 2].append((n - 1, 3))
                labelled[n - 1].append((n - 2, 2))
            expected[f"BC{n}:{arrow}"] = canonical_form(labelled)
    for n in range(4, 9):
        expected[f"D{n}"] = canonical_form(fork_tree([1, 1, n - 3]))
    for n in (6, 7, 8):
        expected[f"E{n}"] = canonical_form(fork_tree([1, 2, n - 4]))
    expected["F4"] = canonical_form(
        {0: [(1, 1)], 1: [(0, 1), (2, 2)], 2: [(1, 3), (3, 1)], 3: [(2, 1)]})
    return expected


if __name__ == "__main__":
    print("=== Phase D: finite-type Dynkin diagrams up to rank 8 ===")
    print("Claim (paper, Theorem 3.1): finite type = A, B, C, D, G2, F4, E6, E7, E8.")
    print()
    rows, found = enumerate_finite_type(8)
    print(f"{'rank':<6} {'name':<16}")
    print("-" * 24)
    for rank, name, _ in sorted(rows):
        print(f"{rank:<6} {name:<16}")

    expected = expected_finite_type()
    expected_forms = set(expected.values())
    print()
    print(f"isomorphism classes found:    {len(found)}")
    print(f"standard finite-type classes: {len(expected_forms)}")
    assert found == expected_forms, (
        f"mismatch: unexpected {found - expected_forms}, "
        f"missing {expected_forms - found}"
    )
    names = sorted({name for _, name, _ in rows})
    print(f"names found: {', '.join(names)}")
    print()
    print("All known-value assertions passed.")
    print("Status: computational evidence only; the classification is Theorem 3.1.")

 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D experiment: Chevalley-Eilenberg obstruction classes of gauge algebras.

Claim evidenced (paper, Proposition 5.3 and Example 5.2): the BV-BRST gauge
anomaly is the pair of classes in H^1(CE(P)) and H^2(CE(P)), and the
quantization gate passes exactly when both vanish. The experiment computes
the cohomology exactly over the rationals for small gauge algebras and
reports the obstruction pair. Computational evidence only; the proof of the
obstruction statement is Proposition 5.3 of the paper.

Module: anomaly_cohomology.py
Function named in the code evidence appendix: ce_obstruction_pair
"""

from fractions import Fraction
from itertools import combinations

# A k-form is a dict: tuple of strictly increasing basis indices -> coefficient.


def wedge(alpha, beta):
    """Exterior product of two forms, with coefficients in Q."""
    result = {}
    for inds_a, coef_a in alpha.items():
        for inds_b, coef_b in beta.items():
            if set(inds_a) & set(inds_b):
                continue
            merged = list(inds_a + inds_b)
            inversions = sum(
                1 for i, j in combinations(range(len(merged)), 2) if merged[i] > merged[j]
            )
            merged.sort()
            key = tuple(merged)
            signed = coef_a * coef_b * (-1) ** inversions
            result[key] = result.get(key, Fraction(0)) + signed
    return {k: v for k, v in result.items() if v != 0}


def ce_differential(form, dim, structure):
    """Chevalley-Eilenberg differential of a form.

    structure is the list of structure constants: structure[k][i][j] is the
    coefficient of e_k in [e_i, e_j]. On the dual basis,
    d e^k = -sum_{i<j} c^k_{ij} e^i ^ e^j, extended as an antiderivation:
    d(a ^ b) = d a ^ b + (-1)^deg(a) a ^ d b.
    """
    result = {}
    for inds, coef in form.items():
        if not inds:
            continue  # d of a scalar is zero
        head, tail = inds[0], inds[1:]
        # d(e^head ^ tail) = d e^head ^ tail - e^head ^ d(tail).
        d_head = {}
        for i in range(dim):
            for j in range(i + 1, dim):
                c = structure[head][i][j]
                if c != 0:
                    key = (i, j)
                    d_head[key] = d_head.get(key, Fraction(0)) + Fraction(-c)
        term1 = wedge(d_head, {tail: Fraction(1)}) if tail else d_head
        d_tail = ce_differential({tail: Fraction(1)}, dim, structure) if tail else {}
        term2 = wedge({(head,): Fraction(-1)}, d_tail)
        for term in (term1, term2):
            for key, val in term.items():
                result[key] = result.get(key, Fraction(0)) + val * coef
    return {k: v for k, v in result.items() if v != 0}


def basis_of_degree(dim, degree):
    return [tuple(c) for c in combinations(range(dim), degree)]


def matrix_of_map(dim, src_degree, structure):
    """Matrix of d: Lambda^src_degree -> Lambda^(src_degree+1) on the basis."""
    src = basis_of_degree(dim, src_degree)
    dst = basis_of_degree(dim, src_degree + 1)
    dst_index = {b: i for i, b in enumerate(dst)}
    matrix = [[Fraction(0) for _ in src] for _ in dst]
    for col, elem in enumerate(src):
        image = ce_differential({elem: Fraction(1)}, dim, structure)
        for key, val in image.items():
            matrix[dst_index[key]][col] = val
    return matrix


def rank(matrix):
    """Exact row rank over Q by Gaussian elimination."""
    mat = [row[:] for row in matrix]
    if not mat:
        return 0
    rows, cols = len(mat), len(mat[0])
    rank_value = 0
    for col in range(cols):
        pivot = None
        for row in range(rank_value, rows):
            if mat[row][col] != 0:
                pivot = row
                break
        if pivot is None:
            continue
        mat[rank_value], mat[pivot] = mat[pivot], mat[rank_value]
        scale = mat[rank_value][col]
        mat[rank_value] = [v / scale for v in mat[rank_value]]
        for row in range(rows):
            if row != rank_value and mat[row][col] != 0:
                factor = mat[row][col]
                mat[row] = [a - factor * b for a, b in zip(mat[row], mat[rank_value])]
        rank_value += 1
    return rank_value


def ce_betti(dim, degree, structure):
    """dim H^degree of the Chevalley-Eilenberg complex."""
    ker = len(basis_of_degree(dim, degree)) - rank(matrix_of_map(dim, degree, structure))
    if degree == 0:
        return ker  # no incoming differential
    im = rank(matrix_of_map(dim, degree - 1, structure))
    return ker - im


def ce_obstruction_pair(name, dim, structure):
    """Return (dim H^1, dim H^2) and whether the obstruction pair vanishes."""
    h1 = ce_betti(dim, 1, structure)
    h2 = ce_betti(dim, 2, structure)
    return {
        "algebra": name,
        "dim H^1": h1,
        "dim H^2": h2,
        "obstruction_pair_vanishes": h1 == 0 and h2 == 0,
    }


def algebra_2d_nonabelian():
    """Example 5.2: [e1, e2] = e2. Expected: dim H^1 = 1, dim H^2 = 0."""
    dim = 2
    structure = [[[Fraction(0) for _ in range(dim)] for _ in range(dim)] for _ in range(dim)]
    structure[1][0][1] = Fraction(1)  # [e0, e1] = e1
    structure[1][1][0] = Fraction(-1)
    return dim, structure


def algebra_su2():
    """su(2): [e1,e2]=e3, [e2,e3]=e1, [e3,e1]=e2. Expected: H^1 = H^2 = 0."""
    dim = 3
    structure = [[[Fraction(0) for _ in range(dim)] for _ in range(dim)] for _ in range(dim)]
    pairs = {(0, 1): 2, (1, 2): 0, (2, 0): 1}
    for (i, j), k in pairs.items():
        structure[k][i][j] = Fraction(1)
        structure[k][j][i] = Fraction(-1)
    return dim, structure


def algebra_abelian():
    """Two-dimensional abelian algebra. Expected: dim H^1 = 2, dim H^2 = 1."""
    dim = 2
    structure = [[[Fraction(0) for _ in range(dim)] for _ in range(dim)] for _ in range(dim)]
    return dim, structure


if __name__ == "__main__":
    print("=== Phase D: Chevalley-Eilenberg obstruction pair (computational evidence) ===")
    print("Obstruction claim (paper, Proposition 5.3): quantization requires")
    print("dim H^1 = dim H^2 = 0 for the gauge algebra.")
    print()
    cases = [
        ("2d non-abelian (Example 5.2)", *algebra_2d_nonabelian()),
        ("su(2)", *algebra_su2()),
        ("2d abelian", *algebra_abelian()),
    ]
    results = [ce_obstruction_pair(name, dim, structure) for name, dim, structure in cases]
    header = f"{'algebra':<30} {'dim H^1':<9} {'dim H^2':<9} {'gate passes':<12}"
    print(header)
    print("-" * len(header))
    for row in results:
        print(f"{row['algebra']:<30} {row['dim H^1']:<9} {row['dim H^2']:<9} "
              f"{str(row['obstruction_pair_vanishes']):<12}")

    lookup = {r["algebra"]: r for r in results}
    assert lookup["2d non-abelian (Example 5.2)"]["dim H^1"] == 1, "Example 5.2: H^1 nonzero"
    assert lookup["2d non-abelian (Example 5.2)"]["dim H^2"] == 0, "Example 5.2: H^2 vanishes"
    assert lookup["su(2)"]["obstruction_pair_vanishes"], "su(2): anomaly-free at the algebraic level"
    print()
    print("All known-value assertions passed.")
    print("Status: computational evidence only; the obstruction theorem is in the paper.")

 succeeded in 0ms:
Let $G$ be a Lie group and $X$ a paracompact Hausdorff space. Write $\mathrm{GBund}(X)$ for the set of isomorphism classes of principal $G$-bundles over $X$. Over a paracompact base every principal $G$-bundle with Lie structure group is numerable, so no further restriction on the bundles is needed.

\begin{theorem}[Classification by the classifying space]
\label{thm:bundles}
Let $G$ be a Lie group and $X$ a paracompact Hausdorff space. The map that sends a principal $G$-bundle to its classifying map induces a bijection~\cite{milnor, dold, steenrod}
\[
\mathrm{GBund}(X) \cong [X, BG],
\]
and the characteristic classes of a bundle are exactly the pullbacks along its classifying map of the universal characteristic classes in $H^*(BG)$~\cite{milnor-stasheff}.
\end{theorem}

\begin{proof}
The Milnor infinite join construction builds a numerable universal bundle $EG \to BG$ for any topological group $G$~\cite{milnor}. The universal property states that a principal $G$-bundle $P \to X$ is classified by a map $f: X \to BG$, with $P \cong f^*(EG)$, exactly when $P$ is numerable; two classifying maps for the same bundle are homotopic, and homotopic maps have isomorphic pullbacks~\cite{dold, steenrod}. Over a paracompact base every principal $G$-bundle with Lie structure group is numerable, so the universal property applies to every bundle of $\mathrm{GBund}(X)$ and the map is a bijection. For the second statement, a universal characteristic class is a cohomology class $\kappa \in H^*(BG)$, and the characteristic class of a bundle with classifying map $f$ is defined as $f^*(\kappa)$. The definition is stable under bundle isomorphism, and every natural characteristic class arises this way, since a natural transformation on homotopy classes is determined by its value on the universal bundle~\cite{milnor-stasheff}.
\end{proof}

The theorem is the complete classification of principal bundles. Two consequences follow.

\begin{proposition}[Bundles over spheres]
\label{prop:spheres}
Let $G$ be a connected Lie group and $n \geq 1$. Isomorphism classes of principal $G$-bundles over $S^n$ are in bijection with $\pi_{n-1}(G)$.
\end{proposition}

\begin{proof}
By Theorem~\ref{thm:bundles} the classes form $[S^n, BG] = \pi_n(BG)$, since $BG$ is connected. The fibration $G \to EG \to BG$ with contractible total space has long exact homotopy sequence
\[
\cdots \to \pi_n(EG) \to \pi_n(BG) \to \pi_{n-1}(G) \to \pi_{n-1}(EG) \to \cdots,
\]
and both homotopy groups of $EG$ vanish, so $\pi_n(BG) \cong \pi_{n-1}(G)$.
\end{proof}

\begin{example}[Line bundles over the sphere]
\label{ex:line}
For $G = \mathrm{U}(1)$ and $n = 2$, Proposition~\ref{prop:spheres} gives $\pi_1(\mathrm{U}(1)) \cong \mathbb{Z}$, and the isomorphism class is detected by the first Chern class $c_1 \in H^2(S^2; \mathbb{Z})$. Every complex line bundle over $S^2$ is a power of the Hopf bundle, and the classification is complete and parameterized by an integer.
\end{example}

\begin{example}[Instantons over the four-sphere]
\label{ex:instanton}
For $G = \mathrm{SU}(2)$ and $n = 4$, Proposition~\ref{prop:spheres} gives $\pi_3(\mathrm{SU}(2)) \cong \mathbb{Z}$, and the integer is the instanton number, computed as the second Chern class of the associated complex vector bundle. For $n = 2$ and $n = 3$ the groups $\pi_1(\mathrm{SU}(2))$ and $\pi_2(\mathrm{SU}(2))$ vanish, so every principal $\mathrm{SU}(2)$-bundle over $S^2$ or $S^3$ is trivial. The nontrivial topology appears only in the dimension where the third homotopy group of the gauge group is nontrivial.
\end{example}

\begin{example}[Global forms and the second Stiefel\textendash{}Whitney class]
\label{ex:global-form}
The choice of global form of the gauge group changes the bundle classification. For $G = \mathrm{SO}(3)$ the first homotopy group is $\pi_1(\mathrm{SO}(3)) \cong \mathbb{Z}/2$, so Proposition~\ref{prop:spheres} gives two isomorphism classes of principal $\mathrm{SO}(3)$-bundles over $S^2$, detected by the second Stiefel\textendash{}Whitney class $w_2$. The nontrivial class is the bundle of tangent 2-planes, and it admits no lift to a principal $\mathrm{SU}(2)$-bundle, since $\pi_1(\mathrm{SU}(2)) = 0$ forces every $\mathrm{SU}(2)$-bundle over $S^2$ to be trivial. Matter fields in a spinorial representation therefore distinguish the global form $\mathrm{SU}(2)$ from $\mathrm{SO}(3)$, and the classification of bundles records that distinction as a cohomology class rather than as a property of the Lie algebra.
\end{example}

\begin{remark}[Local models carry no classification content]
\label{rem:local}
Principal bundles carry only global topological invariants. Locally every principal bundle is trivial, so no local invariant of a bundle exists; the invariants are homotopy-theoretic and cohomological. This is the same phenomenon that Darboux's theorem displays in symplectic geometry, and it marks the contrast with Riemannian geometry, where curvature supplies local invariants.
\end{remark}

Connections on a classified bundle add analytic data. The Chern\textendash{}Weil homomorphism assigns to an invariant polynomial on the Lie algebra the cohomology class of its evaluation on the curvature of any connection, and the class is independent of the connection. In the case $G = \mathrm{U}(1)$ the class $[\Omega/2\pi]$ of the curvature two-form is the first Chern class of the line bundle, so the connection refines, but does not extend, the classification. The classification theorem for bundles is unaffected by connection data. Connections are classified only modulo gauge in restricted settings, and we record no general classification theorem for connections.

\begin{definition}[Gauge equivalence of connections]
\label{def:gauge-equivalence}
Two connections $\omega_1$ and $\omega_2$ on a principal $G$-bundle $P \to X$ are gauge equivalent when a bundle automorphism $g: P \to P$ over the identity of $X$ satisfies $g^*\omega_2 = \omega_1$. The moduli space of connections on a fixed bundle is the quotient of the affine space of connections by this gauge action. Its singularities are the reducible connections, whose stabilizer is larger than the center of $G$, and those points obstruct a smooth quotient description.
\end{definition}

No classification of the moduli space of connections is on the record. The bundle classification delivers its topological stratification: each bundle isomorphism class carries its own moduli space of connections, and the Chern\textendash{}Weil map sends each to the same characteristic classes. The instanton number of Example~\ref{ex:instanton} is constant on the connected components of a moduli space, so the topological classification is the first invariant of the analytic one.

\begin{proposition}[Characteristic classes of the classical groups]
\label{prop:classical-classes}
For $G = \mathrm{U}(n)$ the classifying cohomology $H^*(B\mathrm{U}(n); \mathbb{Z})$ is a polynomial ring on the Chern classes $c_1, \ldots, c_n$. For $G = \mathrm{SO}(2k+1)$ the rational cohomology $H^*(B\mathrm{SO}(2k+1); \mathbb{Q})$ is a polynomial ring on the Pontryagin classes $p_1, \ldots, p_k$. For $G = \mathrm{SO}(2k)$ the rational cohomology $H^*(B\mathrm{SO}(2k); \mathbb{Q})$ is the free polynomial ring $\mathbb{Q}[p_1, \ldots, p_{k-1}, e]$; the top Pontryagin class is the element $p_k = e^2$ and is not an independent generator. For $G = \mathrm{SU}(n)$ the class $c_1$ vanishes and $H^*(B\mathrm{SU}(n); \mathbb{Z})$ is a polynomial ring on $c_2, \ldots, c_n$.
\end{proposition}

\begin{proof}
Each statement is the computation of the cohomology of the classifying space for the given group. For the unitary group one pulls back the tautological bundle over the Grassmannian, splits it formally into Chern roots, and reads off the elementary symmetric polynomials; the splitting principle shows that the Chern classes generate the ring. For the special unitary group the determinant line is trivial, which sets $c_1$ to zero and leaves the remaining classes free. For the special orthogonal group the Pontryagin classes are the Chern classes of the complexification, the rational statement drops the torsion, and in even rank the top Pontryagin class equals the square of the Euler class, so $e$ replaces $p_k$ among the generators.
\end{proof}

The proposition gives the universal class ring whose pullbacks classify bundles in each classical case. The table of sphere bundles in Example~\ref{ex:line} and Example~\ref{ex:instanton} is the shadow of these rings on low-dimensional bases.

\section{Anomalies as obstructions}
\label{sec:anomalies}

An anomaly is the failure of a classical gauge symmetry to survive quantization. Its mathematical signature is the nontriviality of a line or of a cohomology class, and its classification content is the vanishing test for those classes.

\begin{definition}[Fermionic anomaly]
\label{def:fermionic-anomaly}
Let $M$ be a compact spin manifold, $P \to M$ a principal $G$-bundle with $G$ a compact Lie group, $\mathcal{A}$ the space of connections on $P$, and $\mathcal{G}$ the gauge group acting on $\mathcal{A}$. The determinant line of a family of Dirac operators assigns to each connection $A$ the determinant line of $D_A$, and these lines assemble into a complex line bundle $\lambda_{\mathrm{det}}$ over the gauge orbit space $\mathcal{A}/\mathcal{G}$, or over $\mathcal{A}$ when the family is lifted~\cite{quillen, atiyah-singer}. The fermionic anomaly is the obstruction to trivializing $\lambda_{\mathrm{det}}$, or its Pfaffian square root in the Majorana case. The theory is consistent only where the line bundle is trivializable.
\end{definition}

\begin{definition}[BV-BRST gauge anomaly]
\label{def:bvbrst-anomaly}
Let $n$ be the spacetime dimension. The BV-BRST gauge anomaly is the obstruction class in the local BRST cohomology $H^{1,n}(s\mid d)$: the cohomology of the BRST differential $s$ on local functionals of the fields and ghosts, modulo total spacetime derivatives $d$, at ghost number one and form degree $n$. The class satisfies the Wess\textendash{}Zumino consistency condition~\cite{wess-zumino, bbh}. The Chevalley\textendash{}Eilenberg complex $\mathrm{CE}(\mathfrak{g})$ of the gauge algebra computes the zero-form part of the BRST double complex: $H^1(\mathrm{CE}(\mathfrak{g}))$ classifies the abelian quotients of $\mathfrak{g}$, and $H^2(\mathrm{CE}(\mathfrak{g}))$ its central extensions.
\end{definition}

\begin{proposition}[Quantization gate]
\label{prop:anomaly}
A gauge theory admits a consistent quantization only where the determinant line $\lambda_{\mathrm{det}}$ of the Dirac family is trivializable and its anomaly cocycle $[a]$ vanishes in the local BRST cohomology $H^{1,n}(s\mid d)$. The group $H^{1,n}(s\mid d)$ is the space of candidate anomalies of the theory; the specific cocycle $[a]$ is the anomaly of the theory at hand. These two vanishing conditions are the classification content of the anomaly: the obstruction classes are natural in the gauge configuration and classify the inconsistent directions.
\end{proposition}

\begin{proof}
If the determinant line of the family is nontrivial, the path integral measure is a section of a nontrivial line bundle rather than a measure, and gauge transformations multiply the partition function by a nontrivial phase; gauge invariance of the measure fails exactly then. The measure exists exactly when $\lambda_{\mathrm{det}}$ is trivializable. The BRST anomaly class is the obstruction to the nilpotency of the quantized BRST charge: the classical BRST differential satisfies $s^2 = 0$, and the quantum deformation fails to be nilpotent exactly when the anomaly cocycle $[a]$ is nonzero in $H^{1,n}(s\mid d)$. The Wess\textendash{}Zumino consistency condition is the integrability condition for this class and holds by construction~\cite{bbh}. Both constructions are functorial in the gauge configuration, so the obstruction classes are natural and the vanishing test is a classification of the inconsistent directions.
\end{proof}

The anomaly statement is the model of a complete obstruction classification: the classification content of the theory is the vanishing of the obstruction. No list of consistent theories is asserted; what is asserted is a necessary and sufficient condition for consistency. Anomaly cancellation conditions then become computable inputs to the classification of matter content: a matter representation contributes to the anomaly classes, and only the representations whose contributions cancel are admissible.

\begin{example}[Algebraic obstruction data of a gauge algebra]
\label{ex:abelian-anomaly}
Take the gauge algebra to be the two-dimensional non-abelian algebra with basis $e_1, e_2$ and bracket $[e_1, e_2] = e_2$. The Chevalley\textendash{}Eilenberg differential on the dual basis $e^1, e^2$ is $d e^1 = 0$ and $d e^2 = -e^1 \wedge e^2$. The class of $e^1$ in $H^1(\mathrm{CE}(\mathfrak{g}))$ is closed and not exact, so $H^1$ is nonzero and the algebra has a nontrivial abelian quotient; $H^2$ vanishes because $d$ maps the span of $e^2$ onto the whole of $\Lambda^2$. This computation is the algebraic shadow of Definition~\ref{def:bvbrst-anomaly}: the full field-theory anomaly of a gauge theory over a spacetime is computed in the local cohomology $H^{1,n}(s\mid d)$, and the Chevalley\textendash{}Eilenberg classes record the abelian-quotient and central-extension data of the gauge algebra alone. The computation is reproduced by the Chevalley\textendash{}Eilenberg experiment of Section~\ref{sec:experiments}.
\end{example}

Two limitations bound this obstruction statement. The cohomological statement classifies the obstruction and does not by itself construct the quantized theory in the cases where the obstructions vanish. A global anomaly may also remain after the local obstruction classes vanish; the analysis above is the local layer, and the full classification of global anomalies is a further problem on our open list.

\begin{proposition}[Anomaly cancellation as a linear condition]
\label{prop:cancellation}
Fix a compact simple gauge group $G$ and let the matter content be a finite list of finite-dimensional irreducible representations $R_1, \ldots, R_k$ with highest weights $\lambda_1, \ldots, \lambda_k$. The contribution of each representation to a fixed anomaly class is additive, so there is a homomorphism of abelian groups
\[
\alpha \colon R(G) \longrightarrow A,
\]
from the representation ring of $G$ to the coefficient group $A$ of the anomaly in question, and the anomaly-free matter lists form $\ker \alpha$. For the four-dimensional perturbative gauge anomaly $A = \mathbb{Z}$ and $\alpha(R)$ is the anomaly coefficient of $R$; for global anomalies $A$ is the relevant cobordism group of $G$. The admissible matter lists are cut out by linear conditions on the weight data, computable from Theorem~\ref{thm:highest-weight} and Proposition~\ref{prop:anomaly} together.
\end{proposition}

\begin{proof}
The anomaly classes of a direct sum of representations add, since the determinant line of a direct sum is the tensor product of the determinant lines and the BRST differential is linear in the representation data. The assignment $\alpha$ is therefore a homomorphism of abelian groups, and its kernel is the set of virtual representations whose anomaly vanishes. The physical condition restricts to actual representations, so the admissible lists are the nonnegative elements of $\ker \alpha$ in the basis of irreducibles. The highest-weight theorem supplies the basis, and the anomaly computation of Proposition~\ref{prop:anomaly} supplies $\alpha$.
\end{proof}

The proposition turns the anomaly condition into a classification problem for matter content: once the gauge algebra is fixed by its Dynkin diagram, the admissible representations are a computable submonoid of the representation ring. Whether that submonoid is finite or infinite depends on the group and on the anomaly in question, and we record no general finiteness statement.

\section{Functorial and extended topological field theory}
\label{sec:tqft}

The Atiyah axioms package a $d$-dimensional topological quantum field theory as a symmetric monoidal functor $Z$ from the cobordism category $\mathrm{Cob}_d$ to vector spaces: a closed $(d-1)$-manifold $\Sigma$ maps to a vector space $Z(\Sigma)$, a cobordism $M: \Sigma_1 \to \Sigma_2$ maps to a linear map $Z(M): Z(\Sigma_1) \to Z(\Sigma_2)$, composition is preserved, disjoint union is tensor product, and the empty manifold maps to the unit field. The axioms make the topological case tractable in contrast to the general non-topological case, where no comparable functorial formulation is available.

\begin{theorem}[Two-dimensional topological field theories]
\label{thm:frobenius}
The category of two-dimensional Atiyah topological quantum field theories with values in vector spaces is equivalent to the category of commutative Frobenius algebras~\cite{atiyah-tqft}.
\end{theorem}

\begin{proof}
Given a theory $Z$, the circle maps to the algebra $A = Z(S^1)$, the pair of pants with two incoming circles and one outgoing circle gives multiplication $m: A \otimes A \to A$, the reversed pair of pants gives comultiplication $\Delta: A \to A \otimes A$, the disc with one outgoing circle gives the counit, and the reversed disc gives the unit. The Atiyah gluing axioms say precisely that $m$ is associative and unital and that $\Delta$ is coassociative and counital. The Frobenius condition is that $\Delta$ is a homomorphism of $A$-bimodules:
\[
\Delta \circ m = (m \otimes \mathrm{id}_A) \circ (\mathrm{id}_A \otimes \Delta) = (\mathrm{id}_A \otimes m) \circ (\Delta \otimes \mathrm{id}_A),
\]
as maps $A \otimes A \to A \otimes A$; it is the statement that a cylinder cut along a circle decomposes in either order. Commutativity of $m$ is the invariance of the pair of pants under rotation of its incoming boundary. The Euler element $e = m(\Delta(1)) \in A$ is the state assigned to the punctured torus, and the closed genus-one surface evaluates to the scalar $Z(\Sigma_1) = \varepsilon(e)$. Conversely a commutative Frobenius algebra $A$ extends to a functor on two-dimensional cobordisms by cutting each surface along circles into elementary pieces, mapping each piece to the corresponding tensor built from $m$, $\Delta$, the unit, and the counit; the cutting invariance follows from the Frobenius identity, so the value of $Z(M)$ is independent of the chosen decomposition. Both constructions are inverse to each other up to natural isomorphism.
\end{proof}

The theorem is a complete and parameterized classification of two-dimensional functorial theories, and it illustrates the general pattern of this volume: classification succeeds precisely where the physics is topological, because the topological invariance reduces the object to finite-dimensional algebra. Higher-dimensional functorial theories admit analogous invariants built from dualizability data, and we state no classification theorem for them here.

The Frobenius algebra computes every invariant of the theory. The cylinder gives the identity map, the pair of pants gives multiplication, the disc gives unit and counit, and a closed oriented surface of genus $g$ evaluates to the $g$-th power of the Euler element $e = m \circ \Delta(1)$ composed with the counit, so the partition function of the theory is determined by one element of the algebra. Cutting a surface along any circle and reassembling gives the same value, and that cutting independence is the Frobenius identity. The classification is therefore effective: write down a commutative Frobenius algebra, and every observable of the two-dimensional theory is computed from its structure constants.

The extended version asks for a symmetric monoidal higher functor on the fully extended cobordism category, assigning data not only to closed manifolds and cobordisms but to corners and deeper strata. The Baez\textendash{}Dolan cobordism hypothesis proposes the classification.

\begin{conjecture}[Cobordism hypothesis]
\label{conj:cobordism}
The $n$-dimensional extended unitary topological quantum field theories valued in a symmetric monoidal $(\infty, n)$-category are classified by fully dualizable objects of the target with an $O(n)$-action. A fully extended theory is a symmetric monoidal $n$-functor out of the free stable weak $n$-category with duals on a point~\cite{baez-dolan, lurie}.
\end{conjecture}

The status of this statement is a claim with a proof gap. The 1995 paper states the hypothesis; the 2009 work describes itself as an informal sketch of a proof, and the range of cases in which the classification is complete is not settled on the public record. We therefore record the extended classification as claimed rather than proved, and no result in this volume depends on it as a theorem. Low-dimensional cases are the subject of later work; resolving which of those cases carry complete proofs is an open item.

\begin{remark}[What topological classification does not give]
\label{rem:tqft-scope}
A topological quantum field theory is a functorial invariant of manifolds up to cobordism, not a quantum field theory on a fixed spacetime with local degrees of freedom. The classification results in this section say nothing about Yang\textendash{}Mills theory, quantum chromodynamics, or any theory with a metric and a renormalization problem. The line between the topological and the local is the line between classification and the claims register.
\end{remark}

\section{Algebraic quantum field theory and superselection}
\label{sec:aqft}

The algebraic framework postulates the observables of a quantum field theory as a local net: an assignment of a $\mathrm{C}^*$-algebra $\mathcal{A}(\mathcal{O})$ to each open region $\mathcal{O}$ of spacetime, with isotony for nested regions, graded commutation for spacelike separated regions, covariance under the Poincar\'e group, a spectrum condition, and the existence of a vacuum. The axiom list has evolved and remains under discussion, so the framework is conditional on the axiom set in force.

\begin{definition}[Local net]
\label{def:local-net}
A local net on Minkowski spacetime assigns to each double cone $\mathcal{O}$ a unital $\mathrm{C}^*$-algebra $\mathcal{A}(\mathcal{O})$ such that isotony holds for inclusions $\mathcal{O}_1 \subset \mathcal{O}_2$, graded locality holds for spacelike separation, the Poincar\'e group acts by automorphisms covariantly, the spectrum of the generator of time translations is contained in the closed forward cone, and a vacuum state exists~\cite{haag-kastler}. A representation of the net is a representation of the quasilocal algebra $\mathcal{A}$ that is generated by the local algebras.
\end{definition}

\begin{definition}[DHR criterion]
\label{def:dhr}
A representation $\pi$ of a local net satisfies the DHR criterion when its restriction to the algebra of the causal complement of every bounded region is equivalent to the vacuum representation~\cite{dhr}. Two such representations are equivalent when a unitary intertwiner exists.
\end{definition}

The reconstruction theorem holds in Minkowski spacetime of dimension at least $2+1$, where the causal complement of a double cone is connected and locality supplies the permutation symmetry of localized endomorphisms. In spacetime dimension $1+1$ the causal complement of a double cone is disconnected, the braid group replaces the permutation group, and the sector category is braided rather than symmetric; the compact group of Theorem~\ref{thm:dr} is then replaced by quantum-group data.

The DHR selection criterion isolates the representations that arise from local degrees of freedom. Under the additional hypothesis of Haag duality the selected representations correspond to localized transportable endomorphisms of the observable net, and the sectors form a tensor category under composition of endomorphisms.

\begin{theorem}[Doplicher\textendash{}Roberts reconstruction]
\label{thm:dr}
Let $\mathcal{C}$ be a symmetric tensor $\mathrm{C}^*$-category with conjugates, direct sums, subobjects, and $\mathrm{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent to the category of finite-dimensional unitary representations of a compact group $G$ equipped with a distinguished central element $k$ of order at most two, $k^2 = e$, whose adjoint action implements the $\mathbb{Z}/2$ grading of the statistics; in the graded language this data is a compact supergroup. The pair $(G, k)$ is unique up to isomorphism~\cite{dr, dhr}. Applied to the DHR category of a local net satisfying Haag duality, the theorem reconstructs a compact gauge group from the superselection sectors.
\end{theorem}

\begin{proof}
The proof has three stages. The existence of conjugates and subobjects gives the category the structure of a rigid $\mathrm{C}^*$-tensor category; the symmetric structure supplies a dimension function and the categorical traces that make the abstract notion of dimension well-defined. The reconstruction of the group proceeds by taking the endomorphisms of the forgetful functor on the representation category and recovering $G$ as the group of natural automorphisms of the identity on the completed category; the $\mathrm{C}^*$-structure identifies the completed category with the unitary representations of the compact group. Uniqueness follows because a compact group is determined up to isomorphism by its finite-dimensional unitary representation category together with the symmetric monoidal structure.
\end{proof}

The hypotheses travel with the theorem. Dropping the symmetric structure invalidates the recovery: there exist non-isomorphic finite groups with equivalent representation categories as plain tensor categories~\cite{etingof-gelaki}, so any equivalence that forgets the symmetric layer cannot recover the group, and any classification built on such an equivalence is false. Braided variants require additional data; in the braided Galois setting the fixed-point-net representation categories need extra soliton data beyond the braiding~\cite{mueger}.

Deligne's theorem supplies the abstract classification of the symmetric tensor categories that the reconstruction produces.

\begin{theorem}[Deligne's theorem]
\label{thm:deligne}
An abelian, $k$-linear, rigid symmetric monoidal category over an algebraically closed field of characteristic zero, with $\mathrm{End}(\mathbf{1}) = k$ and subexponential growth, is equivalent to the category of representations of an affine supergroup scheme~\cite{deligne}.
\end{theorem}

\begin{proof}
The proof exhibits a fiber functor by a Tannakian argument: the subexponential growth condition bounds the dimensions of simple objects, the symmetric structure gives the braiding needed for a faithful tensor functor to super vector spaces, and the resulting fiber functor presents the category as representations of its automorphism group scheme. The supergrading arises from the possible nontriviality of the symmetry on odd parts.
\end{proof}

The reconstruction results classify the sector categories of nets that satisfy the hypotheses. Three frontier directions are on the record and none of them is settled. The first generalizes the DHR analysis to higher-form symmetries and notes that an extra factor of order two is not ruled out and would not be realizable by Lagrangian gauge models~\cite{casini-magan}; this is a single-source claim and we record it without weight. The second constructs a global quantum gauge group through a braided Doplicher\textendash{}Roberts program~\cite{pinzari}; it is work in progress at the preprint stage. The third is the soliton-data warning already cited~\cite{mueger}, which is proved and shows that fixed-point-net sector categories need data beyond the braiding.

\begin{remark}[Long-range forces]
\label{rem:long-range}
The DHR criterion selects representations whose deviations from the vacuum are localized. Electromagnetism has long-range fields and its charged representations violate the strict localization hypothesis, so the DHR analysis as stated does not cover quantum electrodynamics without modification. The classification of sectors is therefore a classification within a restricted hypothesis class, not of all quantum field theories.
\end{remark}

\section{Reconstruction and classification}
\label{sec:reconstruction}

The Doplicher\textendash{}Roberts theorem is a reconstruction theorem: it recovers a group from the probe data of its representation category. A second line of reconstruction results runs through commutative and topological probes, and comparing the two clarifies what the gauge classification of this volume does and does not achieve.

\begin{theorem}[Reconstruction from commutative probes]
\label{thm:gelfand}
The Gelfand\textendash{}Naimark theorem embeds every $\mathrm{C}^*$-algebra in an algebra of operators on a Hilbert space, and for commutative $\mathrm{C}^*$-algebras the Gelfand transform is an isomorphism onto the continuous functions on the Gelfand spectrum~\cite{gelfand-naimark}. Stone duality is the Boolean analogue: a Boolean algebra is recovered from its space of ultrafilters~\cite{stone}. In each case the object is determined by its commutative or Boolean probe data.
\end{theorem}

\begin{proof}
The Gelfand transform sends an element of a commutative unital $\mathrm{C}^*$-algebra to the function on the maximal ideal space given by evaluation; the spectral radius formula gives continuity, multiplicativity is immediate, and the $\mathrm{C}^*$-identity supplies the isometry property that makes the transform injective and surjective onto $C_0(\Omega)$. The noncommutative embedding is the GNS construction applied to a separating family of states. Stone's theorem is the categorical equivalence between Boolean algebras and the totally disconnected compact Hausdorff spaces, with ultrafilter spaces as the spectrum functor.
\end{proof}

Reconstruction and classification answer different questions. A classification theorem names an invariant whose value determines the object up to a stated equivalence, and its output is a parameter space. A reconstruction theorem recovers the object from a class of probes, and its output is a functor that rebuilds the object. Theorem~\ref{thm:gelfand} rebuilds an algebra from its commutative probes, Theorem~\ref{thm:dr} rebuilds a gauge group from its representation-category probes, and Theorem~\ref{thm:bundles} classifies bundles by homotopy-class data without rebuilding them. The gauge group recovered by Doplicher\textendash{}Roberts is the global form data of Example~\ref{ex:global-form}, which the local algebra of observables cannot see; the reconstruction is therefore genuinely recovering structure rather than reparameterizing it.

The pattern matters for the series program because reconstruction is better developed than classification in several domains. Where a classification is open, a reconstruction result may still recover the object from probes, and where a reconstruction exists, the recovered data becomes a candidate classifying invariant. We record both kinds of result for the gauge and topological domains and mark the boundary between them: bundles are classified, gauge groups are reconstructed from sectors, and the analytic moduli spaces of connections are neither.

\section{Invariant records for gauge theories}
\label{sec:invariants}

The series records the structural invariant record of a theory $T$ as a five-tuple
\[
\mathcal{I}(T) = (\mathcal{S}_T, \mathcal{O}_T, \mathcal{D}_T, \mathcal{G}_T, \mathcal{R}_T),
\]
describing states, observables, dynamics, symmetries, and representations. Instantiating the record for the gauge and topological theories of this volume shows exactly which components the classification results reach.

For a Yang\textendash{}Mills system on a four-manifold with gauge group $G$, the state component $\mathcal{S}_T$ is the moduli space of connections modulo gauge, classified only in its topological stratification by the bundle data. The observable component $\mathcal{O}_T$ is generated by Wilson loops and curvature polynomials, with no classification theorem in this volume. The dynamics component $\mathcal{D}_T$ is the Yang\textendash{}Mills functional, outside all our theorems. The symmetry component $\mathcal{G}_T$ is the gauge group together with its global form, classified by Theorem~\ref{thm:killing-cartan} and Example~\ref{ex:global-form}. The representation component $\mathcal{R}_T$ is the matter content, classified by Theorem~\ref{thm:highest-weight} and constrained by Proposition~\ref{prop:cancellation}.

For a two-dimensional topological theory the record is sharper. The state component is the vector space assigned to the circle, the observable component is the Frobenius algebra of Theorem~\ref{thm:frobenius}, the dynamics is empty because the theory has no local degrees of freedom, the symmetry is the mapping-class action on the assigned spaces, and the representations are the modules over the Frobenius algebra. All five components are determined by the commutative Frobenius algebra, which is why the classification is complete in this case.

For a local net satisfying the DHR hypotheses, the representation component $\mathcal{R}_T$ is the sector category, classified by Theorem~\ref{thm:dr} up to symmetric monoidal equivalence, and the symmetry component $\mathcal{G}_T$ is recovered from it by reconstruction. The state, observable, and dynamics components are those of the net itself and are not classified here.

The classification results of this volume cover the symmetry and representation components of the gauge record and all components of the topological record. The analytic components are open, and the constructive quantum field theory claims of Section~\ref{sec:claims} are attempts to reach them that have not yet arrived.

\section{Claims in constructive quantum field theory}
\label{sec:claims}

The claim ladder separates an announced result, a manuscript, a machine-checked formalization, an independently verified proof, and an accepted theorem; a result moves up the ladder only by an artifact that can be checked, and each row of the register below keeps its current rung. Table~\ref{tab:rigorous} collects rigorous results in restricted regimes and the official problem status. Table~\ref{tab:claims} collects claims that lack public proof artifacts.

\begin{table}[ht]
\centering
\small
\caption{Rigorous results in restricted regimes and the official problem status, as of 29 October 2026. Each row is proved or official within its stated scope.}
\label{tab:rigorous}
\begin{tabularx}{\textwidth}{L{0.20\textwidth} X L{0.30\textwidth}}
\toprule
Entry & Content & Status on the record \\
\midrule

 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D experiment: the Frobenius correspondence for 2d topological theories.

Claim evidenced (paper, Theorem 6.1): two-dimensional Atiyah topological
quantum field theories correspond to commutative Frobenius algebras, and the
value assigned to a closed surface is independent of how the surface is cut
along circles. The experiment verifies the Atiyah gluing axioms for a concrete
commutative Frobenius algebra, computes genus-g partition functions by two
routes, and exhibits a degenerate counit where the dual-basis construction of
the comultiplication fails. Computational evidence only; the proof of the
correspondence is Theorem 6.1 of the paper.

Module: tqft_frobenius.py
Function named in the code evidence appendix: verify_atiyah_gluing
"""

from fractions import Fraction
from itertools import product as iproduct


class FrobeniusAlgebra:
    """Finite-dimensional commutative Frobenius algebra over Q.

    Multiplication is given by structure constants and the counit by a row
    vector. The comultiplication is derived from the dual basis whenever the
    Frobenius map is invertible.
    """

    def __init__(self, name, dim, multiplication, counit, basis_names):
        self.name = name
        self.dim = dim
        self.multiplication = multiplication  # mult[i][j] is the vector e_i * e_j
        self.counit = counit
        self.basis_names = basis_names

    def mul_vec(self, left, right):
        out = [Fraction(0)] * self.dim
        for i, j in iproduct(range(self.dim), repeat=2):
            if left[i] == 0 or right[j] == 0:
                continue
            prod = self.multiplication[i][j]
            for k in range(self.dim):
                out[k] += left[i] * right[j] * prod[k]
        return out

    def eps(self, vec):
        return sum(c * e for c, e in zip(vec, self.counit))

    def unit_vec(self):
        return unit(self.dim, 0)

    def frobenius_matrix(self):
        """Matrix F_ij = eps(e_i * e_j); invertible exactly in the Frobenius case."""
        return [[self.eps(self.multiplication[i][j]) for j in range(self.dim)]
                for i in range(self.dim)]

    def is_frobenius(self):
        return invert(self.frobenius_matrix()) is not None

    def comultiplication(self):
        """Delta(a) = sum_j (a * e_j) tensor dual_j when the Frobenius map
        inverts; None when the counit is degenerate."""
        finv = invert(self.frobenius_matrix())
        if finv is None:
            return None

        def delta(vec):
            out = [[Fraction(0)] * self.dim for _ in range(self.dim)]
            for j in range(self.dim):
                a_times_ej = self.mul_vec(vec, unit(self.dim, j))
                for i in range(self.dim):
                    if a_times_ej[i] == 0:
                        continue
                    for m in range(self.dim):
                        out[i][m] += a_times_ej[i] * finv[j][m]
            return out

        return delta

    def euler_element(self):
        """e = m(Delta(1))."""
        delta = self.comultiplication()
        if delta is None:
            return None
        out = [Fraction(0)] * self.dim
        for (i, j), coef in flatten(delta(self.unit_vec())).items():
            prod = self.multiplication[i][j]
            for k in range(self.dim):
                out[k] += coef * prod[k]
        return out

    def genus_partition(self, genus):
        """Z(Sigma_g) = eps(e^g) with e the Euler element."""
        euler = self.euler_element()
        if euler is None:
            return None
        power = self.unit_vec()
        for _ in range(genus):
            power = self.mul_vec(power, euler)
        return self.eps(power)


def unit(dim, index):
    out = [Fraction(0)] * dim
    out[index] = Fraction(1)
    return out


def flatten(tensor2):
    out = {}
    for i, row in enumerate(tensor2):
        for j, val in enumerate(row):
            if val != 0:
                out[(i, j)] = val
    return out


def invert(matrix):
    """Exact inverse over Q, or None when the matrix is singular."""
    n = len(matrix)
    aug = [row[:] + [Fraction(1) if i == j else Fraction(0) for j in range(n)]
           for i, row in enumerate(matrix)]
    for col in range(n):
        pivot = None
        for row in range(col, n):
            if aug[row][col] != 0:
                pivot = row
                break
        if pivot is None:
            return None
        aug[col], aug[pivot] = aug[pivot], aug[col]
        scale = aug[col][col]
        aug[col] = [v / scale for v in aug[col]]
        for row in range(n):
            if row != col and aug[row][col] != 0:
                factor = aug[row][col]
                aug[row] = [a - factor * b for a, b in zip(aug[row], aug[col])]
    return [row[n:] for row in aug]


def verify_atiyah_gluing(algebra):
    """Check the Atiyah gluing axioms and decomposition independence.

    Checks associativity and unitality of multiplication, coassociativity and
    counitality of the derived comultiplication, the Frobenius identity in the
    module-map form Delta(ab) = (a tensor 1) Delta(b) = (1 tensor b) Delta(a),
    and equality of the genus-g partition function computed through the Euler
    element and through repeated pair-of-pants gluings.
    """
    dim = algebra.dim
    checks = {}

    checks["associative"] = all(
        algebra.mul_vec(algebra.mul_vec(unit(dim, i), unit(dim, j)), unit(dim, k))
        == algebra.mul_vec(unit(dim, i), algebra.mul_vec(unit(dim, j), unit(dim, k)))
        for i, j, k in iproduct(range(dim), repeat=3)
    )

    one = algebra.unit_vec()
    checks["unital"] = all(algebra.mul_vec(one, unit(dim, i)) == unit(dim, i)
                           for i in range(dim))

    delta = algebra.comultiplication()
    checks["frobenius_map_invertible"] = delta is not None
    if delta is None:
        checks["coassociative"] = False
        checks["counital"] = False
        checks["frobenius_identity"] = False
        checks["decomposition_independent"] = False
        checks["genus_values"] = {}
        return checks

    def delta_on_basis(i):
        return delta(unit(dim, i))

    def left_assoc(i):
        out = {}
        for (a, b), coef in flatten(delta_on_basis(i)).items():
            for (c, d), coef2 in flatten(delta_on_basis(a)).items():
                key = (c, d, b)
                out[key] = out.get(key, Fraction(0)) + coef * coef2
        return out

    def right_assoc(i):
        out = {}
        for (a, b), coef in flatten(delta_on_basis(i)).items():
            for (c, d), coef2 in flatten(delta_on_basis(b)).items():
                key = (a, c, d)
                out[key] = out.get(key, Fraction(0)) + coef * coef2
        return out

    checks["coassociative"] = all(left_assoc(i) == right_assoc(i) for i in range(dim))

    def counit_check(i):
        out = [Fraction(0)] * dim
        for (a, b), coef in flatten(delta_on_basis(i)).items():
            out[b] += algebra.eps(unit(dim, a)) * coef
        return out

    checks["counital"] = all(counit_check(i) == unit(dim, i) for i in range(dim))

    # Frobenius identity in the module-map form.
    def act_left(x, tensor):
        """(x tensor 1) applied to a tensor sum u tensor v."""
        out = [[Fraction(0)] * dim for _ in range(dim)]
        for (u, v), coef in flatten(tensor).items():
            prod = algebra.mul_vec(x, unit(dim, u))
            for w in range(dim):
                out[w][v] += coef * prod[w]
        return out

    def act_right(y, tensor):
        out = [[Fraction(0)] * dim for _ in range(dim)]
        for (u, v), coef in flatten(tensor).items():
            prod = algebra.mul_vec(y, unit(dim, v))
            for w in range(dim):
                out[u][w] += coef * prod[w]
        return out

    frob_ok = True
    for a, b in iproduct(range(dim), repeat=2):
        lhs = flatten(delta(algebra.mul_vec(unit(dim, a), unit(dim, b))))
        rhs_left = flatten(act_left(unit(dim, a), delta_on_basis(b)))
        rhs_right = flatten(act_right(unit(dim, b), delta_on_basis(a)))
        if not (lhs == rhs_left == rhs_right):
            frob_ok = False
    checks["frobenius_identity"] = frob_ok

    genus_values = {}
    ok = True
    for genus in (0, 1, 2, 3):
        via_euler = algebra.genus_partition(genus)
        via_gluing = genus_by_repeated_gluing(algebra, delta, genus)
        genus_values[genus] = (via_euler, via_gluing)
        if via_euler != via_gluing:
            ok = False
    checks["decomposition_independent"] = ok
    checks["genus_values"] = genus_values
    return checks


def genus_by_repeated_gluing(algebra, delta, genus):
    """Z(Sigma_g) by gluing g handles as pair-of-pants composites."""
    if genus == 0:
        return algebra.eps(algebra.unit_vec())
    dim = algebra.dim
    state = algebra.unit_vec()
    for _ in range(genus):
        new_state = [Fraction(0)] * dim
        for (a, b), coef in flatten(delta(state)).items():
            prod = algebra.mul_vec(unit(dim, a), unit(dim, b))
            for k in range(dim):
                new_state[k] += coef * prod[k]
        state = new_state
    return algebra.eps(state)


def group_algebra_z2():
    """The group algebra Q[Z/2] with its trace-form Frobenius structure."""
    mult = [[[Fraction(0), Fraction(0)], [Fraction(0), Fraction(0)]]
            for _ in range(2)]
    mult[0][0] = [Fraction(1), Fraction(0)]   # 1 * 1 = 1
    mult[0][1] = [Fraction(0), Fraction(1)]   # 1 * g = g
    mult[1][0] = [Fraction(0), Fraction(1)]   # g * 1 = g
    mult[1][1] = [Fraction(1), Fraction(0)]   # g * g = 1
    return FrobeniusAlgebra("Q[Z/2]", 2, mult, [Fraction(1), Fraction(0)],
                            ["1", "g"])


def degenerate_counit_algebra():
    """Dual numbers k[x]/(x^2) with the evaluation counit.

    The algebra is associative, commutative and unital, but eps(a + b x) = a
    kills the radical, so the Frobenius matrix is singular and the dual-basis
    construction of Delta is unavailable. The experiment shows the failure of
    the correspondence at exactly this point.
    """
    mult = [[[Fraction(0), Fraction(0)], [Fraction(0), Fraction(0)]]
            for _ in range(2)]
    mult[0][0] = [Fraction(1), Fraction(0)]   # 1 * 1 = 1
    mult[0][1] = [Fraction(0), Fraction(1)]   # 1 * x = x
    mult[1][0] = [Fraction(0), Fraction(1)]   # x * 1 = x
    mult[1][1] = [Fraction(0), Fraction(0)]   # x * x = 0
    return FrobeniusAlgebra("k[x]/(x^2) with evaluation counit", 2, mult,
                            [Fraction(1), Fraction(0)], ["1", "x"])


if __name__ == "__main__":
    print("=== Phase D: Atiyah gluing and the Frobenius correspondence ===")
    print("Claim (paper, Theorem 6.1): 2d Atiyah TQFTs = commutative Frobenius algebras.")
    print()

    algebra = group_algebra_z2()
    checks = verify_atiyah_gluing(algebra)
    for name, value in checks.items():
        if name != "genus_values":
            print(f"  {name:<28} {value}")
    print("  genus partition functions:")
    for genus, (via_euler, via_gluing) in checks["genus_values"].items():
        print(f"    g = {genus}: euler route {via_euler}, gluing route {via_gluing}")

    assert checks["associative"] and checks["unital"]
    assert checks["frobenius_map_invertible"]
    assert checks["coassociative"] and checks["counital"]
    assert checks["frobenius_identity"]
    assert checks["decomposition_independent"]

    print()
    degenerate = degenerate_counit_algebra()
    deg_checks = verify_atiyah_gluing(degenerate)
    print(f"Negative control ({degenerate.name}):")
    print(f"  frobenius_map_invertible {deg_checks['frobenius_map_invertible']}")
    assert not deg_checks["frobenius_map_invertible"], \
        "degenerate counit must break the dual-basis construction"

    print()
    print("All known-value assertions passed.")
    print("Status: computational evidence only; the correspondence is Theorem 6.1.")

exec
/usr/local/bin/zsh -lc 'cat src/vol-07-gauge-qft/bundle_classification.py' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D experiment: classification of principal bundles over spheres.

Claim evidenced (paper, Proposition 4.3 and Examples 4.1 to 4.4):
isomorphism classes of principal G-bundles over S^n are classified by
pi_{n-1}(G), and the listed characteristic class detects the class where one
is standard. This is computational evidence for the classification table,
never proof; the proof is the long exact homotopy sequence of the universal
bundle in the paper.

Module: bundle_classification.py
Function named in the code evidence appendix: classify_sphere_bundles
"""

from dataclasses import dataclass


@dataclass(frozen=True)
class HomotopyGroup:
    """Homotopy group of a Lie group at a given degree, as an abstract label."""

    degree: int
    label: str  # "0", "Z", "Z/2", ...


# Standard homotopy groups of the compact classical groups in the range the
# experiment needs (degrees 0 to 3). Sources: standard textbooks; the labels
# match the values used in Examples 4.1 to 4.4 of the paper.
HOMOTOPY = {
    "U(1)": [HomotopyGroup(0, "0"), HomotopyGroup(1, "Z"),
             HomotopyGroup(2, "0"), HomotopyGroup(3, "0")],
    "SU(2)": [HomotopyGroup(0, "0"), HomotopyGroup(1, "0"),
              HomotopyGroup(2, "0"), HomotopyGroup(3, "Z")],
    "SO(3)": [HomotopyGroup(0, "0"), HomotopyGroup(1, "Z/2"),
              HomotopyGroup(2, "0"), HomotopyGroup(3, "Z")],
    "U(2)": [HomotopyGroup(0, "0"), HomotopyGroup(1, "Z"),
             HomotopyGroup(2, "0"), HomotopyGroup(3, "Z")],
    "SU(3)": [HomotopyGroup(0, "0"), HomotopyGroup(1, "0"),
              HomotopyGroup(2, "0"), HomotopyGroup(3, "Z")],
}

# Characteristic class that detects the generator in each nontrivial case.
DETECTOR = {
    ("U(1)", 2): "c1 (first Chern class)",
    ("SO(3)", 2): "w2 (second Stiefel-Whitney class)",
    ("SO(3)", 4): "p1 (first Pontryagin number)",
    ("SU(2)", 4): "c2 (instanton number)",
    ("U(2)", 2): "c1 (first Chern class)",
    ("U(2)", 4): "c2 (instanton number)",
    ("SU(3)", 4): "c2 (instanton number)",
}


def classify_sphere_bundles(groups=None, dimensions=(1, 2, 3, 4)):
    """Classify principal G-bundles over spheres by pi_{n-1}(G).

    Returns a list of rows (group, sphere dimension, pi_{n-1} label, detector)
    and checks the values against the known classification recorded in
    Examples 4.1 to 4.4 of the paper.
    """
    if groups is None:
        groups = ["U(1)", "SU(2)", "SO(3)", "U(2)", "SU(3)"]
    rows = []
    for group in groups:
        for n in dimensions:
            hg = HOMOTOPY[group][n - 1]
            detector = DETECTOR.get((group, n), "trivial class" if hg.label == "0" else "-")
            rows.append((group, n, hg.label, detector))

    # Assertions against the paper's stated values.
    lookup = {(g, n): lbl for g, n, lbl, _ in rows}
    assert lookup[("U(1)", 2)] == "Z", "Example 4.1: U(1)-bundles over S^2 form Z"
    assert lookup[("SU(2)", 2)] == "0", "Example 4.3: SU(2)-bundles over S^2 are trivial"
    assert lookup[("SU(2)", 3)] == "0", "Example 4.3: SU(2)-bundles over S^3 are trivial"
    assert lookup[("SU(2)", 4)] == "Z", "Example 4.3: SU(2)-bundles over S^4 form Z"
    assert lookup[("SO(3)", 2)] == "Z/2", "Example 4.4: SO(3)-bundles over S^2 form Z/2"
    assert lookup[("U(1)", 1)] == "0", "connected group: bundles over S^1 are trivial"
    return rows


def format_table(rows):
    header = f"{'group':<8} {'sphere':<8} {'pi_{n-1}(G)':<14} {'detector':<32}"
    lines = [header, "-" * len(header)]
    for group, n, label, detector in rows:
        lines.append(f"{group:<8} S^{n:<6} {label:<14} {detector:<32}")
    return "\n".join(lines)


if __name__ == "__main__":
    print("=== Phase D: principal G-bundles over spheres (computational evidence) ===")
    print("Classification claim: GBund(S^n) = pi_{n-1}(G) (paper, Proposition 4.3).")
    print()
    result = classify_sphere_bundles()
    print(format_table(result))
    print()
    print("All known-value assertions passed.")
    print("Status: computational evidence only; the theorem is proved in the paper.")

exec
/usr/local/bin/zsh -lc 'cat src/vol-07-gauge-qft/anomaly_cohomology.py' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D experiment: Chevalley-Eilenberg obstruction classes of gauge algebras.

Claim evidenced (paper, Proposition 5.3 and Example 5.2): the BV-BRST gauge
anomaly is the pair of classes in H^1(CE(P)) and H^2(CE(P)), and the
quantization gate passes exactly when both vanish. The experiment computes
the cohomology exactly over the rationals for small gauge algebras and
reports the obstruction pair. Computational evidence only; the proof of the
obstruction statement is Proposition 5.3 of the paper.

Module: anomaly_cohomology.py
Function named in the code evidence appendix: ce_obstruction_pair
"""

from fractions import Fraction
from itertools import combinations

# A k-form is a dict: tuple of strictly increasing basis indices -> coefficient.


def wedge(alpha, beta):
    """Exterior product of two forms, with coefficients in Q."""
    result = {}
    for inds_a, coef_a in alpha.items():
        for inds_b, coef_b in beta.items():
            if set(inds_a) & set(inds_b):
                continue
            merged = list(inds_a + inds_b)
            inversions = sum(
                1 for i, j in combinations(range(len(merged)), 2) if merged[i] > merged[j]
            )
            merged.sort()
            key = tuple(merged)
            signed = coef_a * coef_b * (-1) ** inversions
            result[key] = result.get(key, Fraction(0)) + signed
    return {k: v for k, v in result.items() if v != 0}


def ce_differential(form, dim, structure):
    """Chevalley-Eilenberg differential of a form.

    structure is the list of structure constants: structure[k][i][j] is the
    coefficient of e_k in [e_i, e_j]. On the dual basis,
    d e^k = -sum_{i<j} c^k_{ij} e^i ^ e^j, extended as an antiderivation:
    d(a ^ b) = d a ^ b + (-1)^deg(a) a ^ d b.
    """
    result = {}
    for inds, coef in form.items():
        if not inds:
            continue  # d of a scalar is zero
        head, tail = inds[0], inds[1:]
        # d(e^head ^ tail) = d e^head ^ tail - e^head ^ d(tail).
        d_head = {}
        for i in range(dim):
            for j in range(i + 1, dim):
                c = structure[head][i][j]
                if c != 0:
                    key = (i, j)
                    d_head[key] = d_head.get(key, Fraction(0)) + Fraction(-c)
        term1 = wedge(d_head, {tail: Fraction(1)}) if tail else d_head
        d_tail = ce_differential({tail: Fraction(1)}, dim, structure) if tail else {}
        term2 = wedge({(head,): Fraction(-1)}, d_tail)
        for term in (term1, term2):
            for key, val in term.items():
                result[key] = result.get(key, Fraction(0)) + val * coef
    return {k: v for k, v in result.items() if v != 0}


def basis_of_degree(dim, degree):
    return [tuple(c) for c in combinations(range(dim), degree)]


def matrix_of_map(dim, src_degree, structure):
    """Matrix of d: Lambda^src_degree -> Lambda^(src_degree+1) on the basis."""
    src = basis_of_degree(dim, src_degree)
    dst = basis_of_degree(dim, src_degree + 1)
    dst_index = {b: i for i, b in enumerate(dst)}
    matrix = [[Fraction(0) for _ in src] for _ in dst]
    for col, elem in enumerate(src):
        image = ce_differential({elem: Fraction(1)}, dim, structure)
        for key, val in image.items():
            matrix[dst_index[key]][col] = val
    return matrix


def rank(matrix):
    """Exact row rank over Q by Gaussian elimination."""
    mat = [row[:] for row in matrix]
    if not mat:
        return 0
    rows, cols = len(mat), len(mat[0])
    rank_value = 0
    for col in range(cols):
        pivot = None
        for row in range(rank_value, rows):
            if mat[row][col] != 0:
                pivot = row
                break
        if pivot is None:
            continue
        mat[rank_value], mat[pivot] = mat[pivot], mat[rank_value]
        scale = mat[rank_value][col]
        mat[rank_value] = [v / scale for v in mat[rank_value]]
        for row in range(rows):
            if row != rank_value and mat[row][col] != 0:
                factor = mat[row][col]
                mat[row] = [a - factor * b for a, b in zip(mat[row], mat[rank_value])]
        rank_value += 1
    return rank_value


def ce_betti(dim, degree, structure):
    """dim H^degree of the Chevalley-Eilenberg complex."""
    ker = len(basis_of_degree(dim, degree)) - rank(matrix_of_map(dim, degree, structure))
    if degree == 0:
        return ker  # no incoming differential
    im = rank(matrix_of_map(dim, degree - 1, structure))
    return ker - im


def ce_obstruction_pair(name, dim, structure):
    """Return (dim H^1, dim H^2) and whether the obstruction pair vanishes."""
    h1 = ce_betti(dim, 1, structure)
    h2 = ce_betti(dim, 2, structure)
    return {
        "algebra": name,
        "dim H^1": h1,
        "dim H^2": h2,
        "obstruction_pair_vanishes": h1 == 0 and h2 == 0,
    }


def algebra_2d_nonabelian():
    """Example 5.2: [e1, e2] = e2. Expected: dim H^1 = 1, dim H^2 = 0."""
    dim = 2
    structure = [[[Fraction(0) for _ in range(dim)] for _ in range(dim)] for _ in range(dim)]
    structure[1][0][1] = Fraction(1)  # [e0, e1] = e1
    structure[1][1][0] = Fraction(-1)
    return dim, structure


def algebra_su2():
    """su(2): [e1,e2]=e3, [e2,e3]=e1, [e3,e1]=e2. Expected: H^1 = H^2 = 0."""
    dim = 3
    structure = [[[Fraction(0) for _ in range(dim)] for _ in range(dim)] for _ in range(dim)]
    pairs = {(0, 1): 2, (1, 2): 0, (2, 0): 1}
    for (i, j), k in pairs.items():
        structure[k][i][j] = Fraction(1)
        structure[k][j][i] = Fraction(-1)
    return dim, structure


def algebra_abelian():
    """Two-dimensional abelian algebra. Expected: dim H^1 = 2, dim H^2 = 1."""
    dim = 2
    structure = [[[Fraction(0) for _ in range(dim)] for _ in range(dim)] for _ in range(dim)]
    return dim, structure


if __name__ == "__main__":
    print("=== Phase D: Chevalley-Eilenberg obstruction pair (computational evidence) ===")
    print("Obstruction claim (paper, Proposition 5.3): quantization requires")
    print("dim H^1 = dim H^2 = 0 for the gauge algebra.")
    print()
    cases = [
        ("2d non-abelian (Example 5.2)", *algebra_2d_nonabelian()),
        ("su(2)", *algebra_su2()),
        ("2d abelian", *algebra_abelian()),
    ]
    results = [ce_obstruction_pair(name, dim, structure) for name, dim, structure in cases]
    header = f"{'algebra':<30} {'dim H^1':<9} {'dim H^2':<9} {'gate passes':<12}"
    print(header)
    print("-" * len(header))
    for row in results:
        print(f"{row['algebra']:<30} {row['dim H^1']:<9} {row['dim H^2']:<9} "
              f"{str(row['obstruction_pair_vanishes']):<12}")

    lookup = {r["algebra"]: r for r in results}
    assert lookup["2d non-abelian (Example 5.2)"]["dim H^1"] == 1, "Example 5.2: H^1 nonzero"
    assert lookup["2d non-abelian (Example 5.2)"]["dim H^2"] == 0, "Example 5.2: H^2 vanishes"
    assert lookup["su(2)"]["obstruction_pair_vanishes"], "su(2): anomaly-free at the algebraic level"
    print()
    print("All known-value assertions passed.")
    print("Status: computational evidence only; the obstruction theorem is in the paper.")

exec
/usr/local/bin/zsh -lc 'cat src/vol-07-gauge-qft/tqft_frobenius.py' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D experiment: the Frobenius correspondence for 2d topological theories.

Claim evidenced (paper, Theorem 6.1): two-dimensional Atiyah topological
quantum field theories correspond to commutative Frobenius algebras, and the
value assigned to a closed surface is independent of how the surface is cut
along circles. The experiment verifies the Atiyah gluing axioms for a concrete
commutative Frobenius algebra, computes genus-g partition functions by two
routes, and exhibits a degenerate counit where the dual-basis construction of
the comultiplication fails. Computational evidence only; the proof of the
correspondence is Theorem 6.1 of the paper.

Module: tqft_frobenius.py
Function named in the code evidence appendix: verify_atiyah_gluing
"""

from fractions import Fraction
from itertools import product as iproduct


class FrobeniusAlgebra:
    """Finite-dimensional commutative Frobenius algebra over Q.

    Multiplication is given by structure constants and the counit by a row
    vector. The comultiplication is derived from the dual basis whenever the
    Frobenius map is invertible.
    """

    def __init__(self, name, dim, multiplication, counit, basis_names):
        self.name = name
        self.dim = dim
        self.multiplication = multiplication  # mult[i][j] is the vector e_i * e_j
        self.counit = counit
        self.basis_names = basis_names

    def mul_vec(self, left, right):
        out = [Fraction(0)] * self.dim
        for i, j in iproduct(range(self.dim), repeat=2):
            if left[i] == 0 or right[j] == 0:
                continue
            prod = self.multiplication[i][j]
            for k in range(self.dim):
                out[k] += left[i] * right[j] * prod[k]
        return out

    def eps(self, vec):
        return sum(c * e for c, e in zip(vec, self.counit))

    def unit_vec(self):
        return unit(self.dim, 0)

    def frobenius_matrix(self):
        """Matrix F_ij = eps(e_i * e_j); invertible exactly in the Frobenius case."""
        return [[self.eps(self.multiplication[i][j]) for j in range(self.dim)]
                for i in range(self.dim)]

    def is_frobenius(self):
        return invert(self.frobenius_matrix()) is not None

    def comultiplication(self):
        """Delta(a) = sum_j (a * e_j) tensor dual_j when the Frobenius map
        inverts; None when the counit is degenerate."""
        finv = invert(self.frobenius_matrix())
        if finv is None:
            return None

        def delta(vec):
            out = [[Fraction(0)] * self.dim for _ in range(self.dim)]
            for j in range(self.dim):
                a_times_ej = self.mul_vec(vec, unit(self.dim, j))
                for i in range(self.dim):
                    if a_times_ej[i] == 0:
                        continue
                    for m in range(self.dim):
                        out[i][m] += a_times_ej[i] * finv[j][m]
            return out

        return delta

    def euler_element(self):
        """e = m(Delta(1))."""
        delta = self.comultiplication()
        if delta is None:
            return None
        out = [Fraction(0)] * self.dim
        for (i, j), coef in flatten(delta(self.unit_vec())).items():
            prod = self.multiplication[i][j]
            for k in range(self.dim):
                out[k] += coef * prod[k]
        return out

    def genus_partition(self, genus):
        """Z(Sigma_g) = eps(e^g) with e the Euler element."""
        euler = self.euler_element()
        if euler is None:
            return None
        power = self.unit_vec()
        for _ in range(genus):
            power = self.mul_vec(power, euler)
        return self.eps(power)


def unit(dim, index):
    out = [Fraction(0)] * dim
    out[index] = Fraction(1)
    return out


def flatten(tensor2):
    out = {}
    for i, row in enumerate(tensor2):
        for j, val in enumerate(row):
            if val != 0:
                out[(i, j)] = val
    return out


def invert(matrix):
    """Exact inverse over Q, or None when the matrix is singular."""
    n = len(matrix)
    aug = [row[:] + [Fraction(1) if i == j else Fraction(0) for j in range(n)]
           for i, row in enumerate(matrix)]
    for col in range(n):
        pivot = None
        for row in range(col, n):
            if aug[row][col] != 0:
                pivot = row
                break
        if pivot is None:
            return None
        aug[col], aug[pivot] = aug[pivot], aug[col]
        scale = aug[col][col]
        aug[col] = [v / scale for v in aug[col]]
        for row in range(n):
            if row != col and aug[row][col] != 0:
                factor = aug[row][col]
                aug[row] = [a - factor * b for a, b in zip(aug[row], aug[col])]
    return [row[n:] for row in aug]


def verify_atiyah_gluing(algebra):
    """Check the Atiyah gluing axioms and decomposition independence.

    Checks associativity and unitality of multiplication, coassociativity and
    counitality of the derived comultiplication, the Frobenius identity in the
    module-map form Delta(ab) = (a tensor 1) Delta(b) = (1 tensor b) Delta(a),
    and equality of the genus-g partition function computed through the Euler
    element and through repeated pair-of-pants gluings.
    """
    dim = algebra.dim
    checks = {}

    checks["associative"] = all(
        algebra.mul_vec(algebra.mul_vec(unit(dim, i), unit(dim, j)), unit(dim, k))
        == algebra.mul_vec(unit(dim, i), algebra.mul_vec(unit(dim, j), unit(dim, k)))
        for i, j, k in iproduct(range(dim), repeat=3)
    )

    one = algebra.unit_vec()
    checks["unital"] = all(algebra.mul_vec(one, unit(dim, i)) == unit(dim, i)
                           for i in range(dim))

    delta = algebra.comultiplication()
    checks["frobenius_map_invertible"] = delta is not None
    if delta is None:
        checks["coassociative"] = False
        checks["counital"] = False
        checks["frobenius_identity"] = False
        checks["decomposition_independent"] = False
        checks["genus_values"] = {}
        return checks

    def delta_on_basis(i):
        return delta(unit(dim, i))

    def left_assoc(i):
        out = {}
        for (a, b), coef in flatten(delta_on_basis(i)).items():
            for (c, d), coef2 in flatten(delta_on_basis(a)).items():
                key = (c, d, b)
                out[key] = out.get(key, Fraction(0)) + coef * coef2
        return out

    def right_assoc(i):
        out = {}
        for (a, b), coef in flatten(delta_on_basis(i)).items():
            for (c, d), coef2 in flatten(delta_on_basis(b)).items():
                key = (a, c, d)
                out[key] = out.get(key, Fraction(0)) + coef * coef2
        return out

    checks["coassociative"] = all(left_assoc(i) == right_assoc(i) for i in range(dim))

    def counit_check(i):
        out = [Fraction(0)] * dim
        for (a, b), coef in flatten(delta_on_basis(i)).items():
            out[b] += algebra.eps(unit(dim, a)) * coef
        return out

    checks["counital"] = all(counit_check(i) == unit(dim, i) for i in range(dim))

    # Frobenius identity in the module-map form.
    def act_left(x, tensor):
        """(x tensor 1) applied to a tensor sum u tensor v."""
        out = [[Fraction(0)] * dim for _ in range(dim)]
        for (u, v), coef in flatten(tensor).items():
            prod = algebra.mul_vec(x, unit(dim, u))
            for w in range(dim):
                out[w][v] += coef * prod[w]
        return out

    def act_right(y, tensor):
        out = [[Fraction(0)] * dim for _ in range(dim)]
        for (u, v), coef in flatten(tensor).items():
            prod = algebra.mul_vec(y, unit(dim, v))
            for w in range(dim):
                out[u][w] += coef * prod[w]
        return out

    frob_ok = True
    for a, b in iproduct(range(dim), repeat=2):
        lhs = flatten(delta(algebra.mul_vec(unit(dim, a), unit(dim, b))))
        rhs_left = flatten(act_left(unit(dim, a), delta_on_basis(b)))
        rhs_right = flatten(act_right(unit(dim, b), delta_on_basis(a)))
        if not (lhs == rhs_left == rhs_right):
            frob_ok = False
    checks["frobenius_identity"] = frob_ok

    genus_values = {}
    ok = True
    for genus in (0, 1, 2, 3):
        via_euler = algebra.genus_partition(genus)
        via_gluing = genus_by_repeated_gluing(algebra, delta, genus)
        genus_values[genus] = (via_euler, via_gluing)
        if via_euler != via_gluing:
            ok = False
    checks["decomposition_independent"] = ok
    checks["genus_values"] = genus_values
    return checks


def genus_by_repeated_gluing(algebra, delta, genus):
    """Z(Sigma_g) by gluing g handles as pair-of-pants composites."""
    if genus == 0:
        return algebra.eps(algebra.unit_vec())
    dim = algebra.dim
    state = algebra.unit_vec()
    for _ in range(genus):
        new_state = [Fraction(0)] * dim
        for (a, b), coef in flatten(delta(state)).items():
            prod = algebra.mul_vec(unit(dim, a), unit(dim, b))
            for k in range(dim):
                new_state[k] += coef * prod[k]
        state = new_state
    return algebra.eps(state)


def group_algebra_z2():
    """The group algebra Q[Z/2] with its trace-form Frobenius structure."""
    mult = [[[Fraction(0), Fraction(0)], [Fraction(0), Fraction(0)]]
            for _ in range(2)]
    mult[0][0] = [Fraction(1), Fraction(0)]   # 1 * 1 = 1
    mult[0][1] = [Fraction(0), Fraction(1)]   # 1 * g = g
    mult[1][0] = [Fraction(0), Fraction(1)]   # g * 1 = g
    mult[1][1] = [Fraction(1), Fraction(0)]   # g * g = 1
    return FrobeniusAlgebra("Q[Z/2]", 2, mult, [Fraction(1), Fraction(0)],
                            ["1", "g"])


def degenerate_counit_algebra():
    """Dual numbers k[x]/(x^2) with the evaluation counit.

    The algebra is associative, commutative and unital, but eps(a + b x) = a
    kills the radical, so the Frobenius matrix is singular and the dual-basis
    construction of Delta is unavailable. The experiment shows the failure of
    the correspondence at exactly this point.
    """
    mult = [[[Fraction(0), Fraction(0)], [Fraction(0), Fraction(0)]]
            for _ in range(2)]
    mult[0][0] = [Fraction(1), Fraction(0)]   # 1 * 1 = 1
    mult[0][1] = [Fraction(0), Fraction(1)]   # 1 * x = x
    mult[1][0] = [Fraction(0), Fraction(1)]   # x * 1 = x
    mult[1][1] = [Fraction(0), Fraction(0)]   # x * x = 0
    return FrobeniusAlgebra("k[x]/(x^2) with evaluation counit", 2, mult,
                            [Fraction(1), Fraction(0)], ["1", "x"])


if __name__ == "__main__":
    print("=== Phase D: Atiyah gluing and the Frobenius correspondence ===")
    print("Claim (paper, Theorem 6.1): 2d Atiyah TQFTs = commutative Frobenius algebras.")
    print()

    algebra = group_algebra_z2()
    checks = verify_atiyah_gluing(algebra)
    for name, value in checks.items():
        if name != "genus_values":
            print(f"  {name:<28} {value}")
    print("  genus partition functions:")
    for genus, (via_euler, via_gluing) in checks["genus_values"].items():
        print(f"    g = {genus}: euler route {via_euler}, gluing route {via_gluing}")

    assert checks["associative"] and checks["unital"]
    assert checks["frobenius_map_invertible"]
    assert checks["coassociative"] and checks["counital"]
    assert checks["frobenius_identity"]
    assert checks["decomposition_independent"]

    print()
    degenerate = degenerate_counit_algebra()
    deg_checks = verify_atiyah_gluing(degenerate)
    print(f"Negative control ({degenerate.name}):")
    print(f"  frobenius_map_invertible {deg_checks['frobenius_map_invertible']}")
    assert not deg_checks["frobenius_map_invertible"], \
        "degenerate counit must break the dual-basis construction"

    print()
    print("All known-value assertions passed.")
    print("Status: computational evidence only; the correspondence is Theorem 6.1.")

exec
/usr/local/bin/zsh -lc "sed -n '100,179p' papers/latex/vol-07-gauge-qft.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
\begin{table}[ht]
\centering
\small
\caption{Classifying invariants of the gauge and topological subdomains, with the equivalence each classification is taken under and its regime.}
\label{tab:invariants}
\begin{tabularx}{\textwidth}{L{0.20\textwidth} X L{0.24\textwidth} L{0.20\textwidth}}
\toprule
Subdomain & Classifying invariant & Equivalence in force & Regime \\
\midrule
Semisimple gauge algebras & Dynkin diagram & Lie algebra isomorphism & Complete and parameterized \\
\addlinespace
Real simple gauge algebras & Satake diagram & Lie algebra isomorphism & Complete and parameterized \\
\addlinespace
Finite-dimensional matter representations & Dominant integral weight & Representation isomorphism & Complete and parameterized \\
\addlinespace
Principal bundles over a paracompact base & Homotopy class of $X \to BG$ & Bundle isomorphism & Complete and parameterized \\
\addlinespace
Characteristic classes & Pullbacks of universal classes in $H^*(BG)$ & Natural in the base map & Complete and parameterized \\
\addlinespace
Anomaly-free configurations & Trivial determinant line and vanishing BRST class & Gauge equivalence of configurations & Complete as obstruction \\
\addlinespace
Two-dimensional topological theories & Commutative Frobenius algebra & Monoidal natural isomorphism of functors & Complete and parameterized \\
\addlinespace
Sectors of nets under Haag duality & Compact supergroup from sector category & Symmetric monoidal equivalence & Complete under stated hypotheses \\
\addlinespace
Extended topological theories & Fully dualizable object & Monoidal equivalence of theories & Claimed with a proof gap \\
\addlinespace
Connections modulo gauge & None known in general & Gauge equivalence of connections & Open in general \\
\addlinespace
Four-dimensional interacting theories & Balaban-program methods as announced & Not established & Claimed with artifacts withheld \\
\addlinespace
Four-dimensional mass gap & None known & Not applicable & Open \\
\bottomrule
\end{tabularx}
\end{table}

\section{Lie theory of gauge groups}
\label{sec:lie}

The structure group of a gauge theory is a Lie group, and the first classification question is which Lie groups may serve. The answer is complete on the algebra side.

\begin{theorem}[Killing\textendash{}Cartan classification]
\label{thm:killing-cartan}
Complex semisimple Lie algebras are classified up to isomorphism by Dynkin diagrams of types $A_r$, $B_r$, $C_r$, $D_r$, $G_2$, $F_4$, $E_6$, $E_7$, $E_8$~\cite{humphreys, serre}. Real simple Lie algebras are classified by Satake diagrams; the real forms of a given complex simple algebra $\mathfrak{g}$ correspond to the conjugacy classes of involutive automorphisms of $\mathfrak{g}$, equivalently to conjugacy classes of Cartan involutions. Connected Lie groups with Lie algebra $\mathfrak{g}$ are classified by discrete subgroups $Z'$ of the center of the universal covering group $\widetilde{G}$: each such group is a quotient $\widetilde{G}/Z'$.
\end{theorem}

\begin{proof}
The complex case is the classification of root systems up to isomorphism. A root system spans a rational Euclidean space, and the integrality conditions force the Cartan integers $\langle \alpha_i, \alpha_j^\vee \rangle = 2(\alpha_i, \alpha_j)/(\alpha_j, \alpha_j)$ to lie in the list of Cartan matrices of finite type. Simplicity of the algebra corresponds to connectedness of the diagram, and the Serre presentation recovers the isomorphism class from the diagram. For the real case Cartan's theorem assigns to each real form its conjugacy class of involutive automorphisms of the complex algebra, and the Satake diagram records the induced diagram involution together with the split between compact and noncompact simple roots. For the group statement, every connected Lie group with Lie algebra $\mathfrak{g}$ is a quotient of the universal covering group $\widetilde{G}$ by a discrete subgroup of its center, and every such quotient is a connected Lie group with algebra $\mathfrak{g}$.
\end{proof}

The theorem classifies the gauge algebra; the simply connected group and its central quotients then classify the connected gauge group. It does not classify the bundle, the connection, the dynamics, or the matter content.

\begin{theorem}[Highest-weight classification]
\label{thm:highest-weight}
Let $\mathfrak{g}$ be a complex semisimple Lie algebra. Finite-dimensional irreducible representations of $\mathfrak{g}$ are in bijection with dominant integral weights; the representation with highest weight $\lambda$ exists and is unique up to isomorphism~\cite{humphreys}.
\end{theorem}

\begin{proof}
Uniqueness is the classification of a representation by its highest weight: the weight strings of a finite-dimensional irreducible are determined by the action of the raising and lowering operators, and the highest weight is annihilated by every raising operator and integral in the weight lattice. Existence is the content of the Borel\textendash{}Weil construction, or equivalently of the Verma module with the maximal proper submodule quotiented out; the quotient is finite-dimensional exactly when the highest weight is dominant integral. Irreducibility follows because every nonzero submodule contains a highest weight vector, and the highest weight space of an irreducible is one-dimensional.
\end{proof}

Together these two theorems give the complete Lie-theoretic layer of a gauge theory: the gauge algebra by its Dynkin diagram, the real form by its Satake diagram, the connected gauge group by central quotient data, and the finite-dimensional matter representations by dominant integral weights. Example instantiations of the invariant record appear in the code evidence of Section~\ref{sec:experiments}.

\begin{example}[The gauge algebra of quantum chromodynamics]
\label{ex:su3}
Take $\mathfrak{g} = \mathfrak{su}(3)$, the Lie algebra of $\mathrm{SU}(3)$. Its Dynkin diagram is $A_2$, two nodes joined by a single edge, and the Killing\textendash{}Cartan theorem records that no other complex simple algebra carries this diagram. The real form is compact, and the corresponding real simple algebra is the compact $\mathfrak{su}(3)$ itself; the split real form $\mathfrak{sl}(3, \mathbb{R})$ is a different real form of the same complex algebra and is distinguished by its Satake diagram. The fundamental weights $\lambda_1$ and $\lambda_2$ label the defining representation $\mathbf{3}$ and its conjugate $\bar{\mathbf{3}}$, and the highest weight of the adjoint representation is $\lambda_1 + \lambda_2$, giving the octet $\mathbf{8}$. Quarks in the defining representation, antiquarks in the conjugate, and gluons in the adjoint are therefore classified as representations by the dominant integral weights of $A_2$, and the matter content of the theory is a list of weights. The classification stops there: the interaction, the renormalization, and the spectrum of bound states are outside the highest-weight theorem.
\end{example}

\begin{remark}
The classification does not reach the dynamics of a gauge theory. Infinite-dimensional representations of the gauge group, the spectrum of the covariant Laplacian on a bundle, the Yang\textendash{}Mills functional, and the quantum theory built from them are outside the scope of the Killing\textendash{}Cartan and highest-weight statements. A gauge theory is not classified by its gauge algebra alone.
\end{remark}

\begin{remark}[Reductive groups and the center]
\label{rem:reductive}
A reductive gauge group is a central product of a semisimple group with a torus, so the classification extends by adjoining the rank of the torus to the Dynkin datum. The datum that distinguishes the global forms is the discrete central subgroup of the universal cover, and it is not visible in the Dynkin diagram: $\mathrm{SU}(2)$ is the universal cover of $\mathrm{SO}(3)$ and has center $\mathbb{Z}/2$, while $\mathrm{SO}(3)$ has trivial center, and both share the diagram $A_1$. The classification of gauge groups up to isomorphism therefore requires both the diagram and the quotient data of Theorem~\ref{thm:killing-cartan}, and the bundle classification records the difference, as Example~\ref{ex:global-form} shows.
\end{remark}

\section{Bundles and characteristic classes}
\label{sec:bundles}


exec
/usr/local/bin/zsh -lc "sed -n '330,455p' papers/latex/vol-07-gauge-qft.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
\label{rem:tqft-scope}
A topological quantum field theory is a functorial invariant of manifolds up to cobordism, not a quantum field theory on a fixed spacetime with local degrees of freedom. The classification results in this section say nothing about Yang\textendash{}Mills theory, quantum chromodynamics, or any theory with a metric and a renormalization problem. The line between the topological and the local is the line between classification and the claims register.
\end{remark}

\section{Algebraic quantum field theory and superselection}
\label{sec:aqft}

The algebraic framework postulates the observables of a quantum field theory as a local net: an assignment of a $\mathrm{C}^*$-algebra $\mathcal{A}(\mathcal{O})$ to each open region $\mathcal{O}$ of spacetime, with isotony for nested regions, graded commutation for spacelike separated regions, covariance under the Poincar\'e group, a spectrum condition, and the existence of a vacuum. The axiom list has evolved and remains under discussion, so the framework is conditional on the axiom set in force.

\begin{definition}[Local net]
\label{def:local-net}
A local net on Minkowski spacetime assigns to each double cone $\mathcal{O}$ a unital $\mathrm{C}^*$-algebra $\mathcal{A}(\mathcal{O})$ such that isotony holds for inclusions $\mathcal{O}_1 \subset \mathcal{O}_2$, graded locality holds for spacelike separation, the Poincar\'e group acts by automorphisms covariantly, the spectrum of the generator of time translations is contained in the closed forward cone, and a vacuum state exists~\cite{haag-kastler}. A representation of the net is a representation of the quasilocal algebra $\mathcal{A}$ that is generated by the local algebras.
\end{definition}

\begin{definition}[DHR criterion]
\label{def:dhr}
A representation $\pi$ of a local net satisfies the DHR criterion when its restriction to the algebra of the causal complement of every bounded region is equivalent to the vacuum representation~\cite{dhr}. Two such representations are equivalent when a unitary intertwiner exists.
\end{definition}

The reconstruction theorem holds in Minkowski spacetime of dimension at least $2+1$, where the causal complement of a double cone is connected and locality supplies the permutation symmetry of localized endomorphisms. In spacetime dimension $1+1$ the causal complement of a double cone is disconnected, the braid group replaces the permutation group, and the sector category is braided rather than symmetric; the compact group of Theorem~\ref{thm:dr} is then replaced by quantum-group data.

The DHR selection criterion isolates the representations that arise from local degrees of freedom. Under the additional hypothesis of Haag duality the selected representations correspond to localized transportable endomorphisms of the observable net, and the sectors form a tensor category under composition of endomorphisms.

\begin{theorem}[Doplicher\textendash{}Roberts reconstruction]
\label{thm:dr}
Let $\mathcal{C}$ be a symmetric tensor $\mathrm{C}^*$-category with conjugates, direct sums, subobjects, and $\mathrm{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent to the category of finite-dimensional unitary representations of a compact group $G$ equipped with a distinguished central element $k$ of order at most two, $k^2 = e$, whose adjoint action implements the $\mathbb{Z}/2$ grading of the statistics; in the graded language this data is a compact supergroup. The pair $(G, k)$ is unique up to isomorphism~\cite{dr, dhr}. Applied to the DHR category of a local net satisfying Haag duality, the theorem reconstructs a compact gauge group from the superselection sectors.
\end{theorem}

\begin{proof}
The proof has three stages. The existence of conjugates and subobjects gives the category the structure of a rigid $\mathrm{C}^*$-tensor category; the symmetric structure supplies a dimension function and the categorical traces that make the abstract notion of dimension well-defined. The reconstruction of the group proceeds by taking the endomorphisms of the forgetful functor on the representation category and recovering $G$ as the group of natural automorphisms of the identity on the completed category; the $\mathrm{C}^*$-structure identifies the completed category with the unitary representations of the compact group. Uniqueness follows because a compact group is determined up to isomorphism by its finite-dimensional unitary representation category together with the symmetric monoidal structure.
\end{proof}

The hypotheses travel with the theorem. Dropping the symmetric structure invalidates the recovery: there exist non-isomorphic finite groups with equivalent representation categories as plain tensor categories~\cite{etingof-gelaki}, so any equivalence that forgets the symmetric layer cannot recover the group, and any classification built on such an equivalence is false. Braided variants require additional data; in the braided Galois setting the fixed-point-net representation categories need extra soliton data beyond the braiding~\cite{mueger}.

Deligne's theorem supplies the abstract classification of the symmetric tensor categories that the reconstruction produces.

\begin{theorem}[Deligne's theorem]
\label{thm:deligne}
An abelian, $k$-linear, rigid symmetric monoidal category over an algebraically closed field of characteristic zero, with $\mathrm{End}(\mathbf{1}) = k$ and subexponential growth, is equivalent to the category of representations of an affine supergroup scheme~\cite{deligne}.
\end{theorem}

\begin{proof}
The proof exhibits a fiber functor by a Tannakian argument: the subexponential growth condition bounds the dimensions of simple objects, the symmetric structure gives the braiding needed for a faithful tensor functor to super vector spaces, and the resulting fiber functor presents the category as representations of its automorphism group scheme. The supergrading arises from the possible nontriviality of the symmetry on odd parts.
\end{proof}

The reconstruction results classify the sector categories of nets that satisfy the hypotheses. Three frontier directions are on the record and none of them is settled. The first generalizes the DHR analysis to higher-form symmetries and notes that an extra factor of order two is not ruled out and would not be realizable by Lagrangian gauge models~\cite{casini-magan}; this is a single-source claim and we record it without weight. The second constructs a global quantum gauge group through a braided Doplicher\textendash{}Roberts program~\cite{pinzari}; it is work in progress at the preprint stage. The third is the soliton-data warning already cited~\cite{mueger}, which is proved and shows that fixed-point-net sector categories need data beyond the braiding.

\begin{remark}[Long-range forces]
\label{rem:long-range}
The DHR criterion selects representations whose deviations from the vacuum are localized. Electromagnetism has long-range fields and its charged representations violate the strict localization hypothesis, so the DHR analysis as stated does not cover quantum electrodynamics without modification. The classification of sectors is therefore a classification within a restricted hypothesis class, not of all quantum field theories.
\end{remark}

\section{Reconstruction and classification}
\label{sec:reconstruction}

The Doplicher\textendash{}Roberts theorem is a reconstruction theorem: it recovers a group from the probe data of its representation category. A second line of reconstruction results runs through commutative and topological probes, and comparing the two clarifies what the gauge classification of this volume does and does not achieve.

\begin{theorem}[Reconstruction from commutative probes]
\label{thm:gelfand}
The Gelfand\textendash{}Naimark theorem embeds every $\mathrm{C}^*$-algebra in an algebra of operators on a Hilbert space, and for commutative $\mathrm{C}^*$-algebras the Gelfand transform is an isomorphism onto the continuous functions on the Gelfand spectrum~\cite{gelfand-naimark}. Stone duality is the Boolean analogue: a Boolean algebra is recovered from its space of ultrafilters~\cite{stone}. In each case the object is determined by its commutative or Boolean probe data.
\end{theorem}

\begin{proof}
The Gelfand transform sends an element of a commutative unital $\mathrm{C}^*$-algebra to the function on the maximal ideal space given by evaluation; the spectral radius formula gives continuity, multiplicativity is immediate, and the $\mathrm{C}^*$-identity supplies the isometry property that makes the transform injective and surjective onto $C_0(\Omega)$. The noncommutative embedding is the GNS construction applied to a separating family of states. Stone's theorem is the categorical equivalence between Boolean algebras and the totally disconnected compact Hausdorff spaces, with ultrafilter spaces as the spectrum functor.
\end{proof}

Reconstruction and classification answer different questions. A classification theorem names an invariant whose value determines the object up to a stated equivalence, and its output is a parameter space. A reconstruction theorem recovers the object from a class of probes, and its output is a functor that rebuilds the object. Theorem~\ref{thm:gelfand} rebuilds an algebra from its commutative probes, Theorem~\ref{thm:dr} rebuilds a gauge group from its representation-category probes, and Theorem~\ref{thm:bundles} classifies bundles by homotopy-class data without rebuilding them. The gauge group recovered by Doplicher\textendash{}Roberts is the global form data of Example~\ref{ex:global-form}, which the local algebra of observables cannot see; the reconstruction is therefore genuinely recovering structure rather than reparameterizing it.

The pattern matters for the series program because reconstruction is better developed than classification in several domains. Where a classification is open, a reconstruction result may still recover the object from probes, and where a reconstruction exists, the recovered data becomes a candidate classifying invariant. We record both kinds of result for the gauge and topological domains and mark the boundary between them: bundles are classified, gauge groups are reconstructed from sectors, and the analytic moduli spaces of connections are neither.

\section{Invariant records for gauge theories}
\label{sec:invariants}

The series records the structural invariant record of a theory $T$ as a five-tuple
\[
\mathcal{I}(T) = (\mathcal{S}_T, \mathcal{O}_T, \mathcal{D}_T, \mathcal{G}_T, \mathcal{R}_T),
\]
describing states, observables, dynamics, symmetries, and representations. Instantiating the record for the gauge and topological theories of this volume shows exactly which components the classification results reach.

For a Yang\textendash{}Mills system on a four-manifold with gauge group $G$, the state component $\mathcal{S}_T$ is the moduli space of connections modulo gauge, classified only in its topological stratification by the bundle data. The observable component $\mathcal{O}_T$ is generated by Wilson loops and curvature polynomials, with no classification theorem in this volume. The dynamics component $\mathcal{D}_T$ is the Yang\textendash{}Mills functional, outside all our theorems. The symmetry component $\mathcal{G}_T$ is the gauge group together with its global form, classified by Theorem~\ref{thm:killing-cartan} and Example~\ref{ex:global-form}. The representation component $\mathcal{R}_T$ is the matter content, classified by Theorem~\ref{thm:highest-weight} and constrained by Proposition~\ref{prop:cancellation}.

For a two-dimensional topological theory the record is sharper. The state component is the vector space assigned to the circle, the observable component is the Frobenius algebra of Theorem~\ref{thm:frobenius}, the dynamics is empty because the theory has no local degrees of freedom, the symmetry is the mapping-class action on the assigned spaces, and the representations are the modules over the Frobenius algebra. All five components are determined by the commutative Frobenius algebra, which is why the classification is complete in this case.

For a local net satisfying the DHR hypotheses, the representation component $\mathcal{R}_T$ is the sector category, classified by Theorem~\ref{thm:dr} up to symmetric monoidal equivalence, and the symmetry component $\mathcal{G}_T$ is recovered from it by reconstruction. The state, observable, and dynamics components are those of the net itself and are not classified here.

The classification results of this volume cover the symmetry and representation components of the gauge record and all components of the topological record. The analytic components are open, and the constructive quantum field theory claims of Section~\ref{sec:claims} are attempts to reach them that have not yet arrived.

\section{Claims in constructive quantum field theory}
\label{sec:claims}

The claim ladder separates an announced result, a manuscript, a machine-checked formalization, an independently verified proof, and an accepted theorem; a result moves up the ladder only by an artifact that can be checked, and each row of the register below keeps its current rung. Table~\ref{tab:rigorous} collects rigorous results in restricted regimes and the official problem status. Table~\ref{tab:claims} collects claims that lack public proof artifacts.

\begin{table}[ht]
\centering
\small
\caption{Rigorous results in restricted regimes and the official problem status, as of 29 October 2026. Each row is proved or official within its stated scope.}
\label{tab:rigorous}
\begin{tabularx}{\textwidth}{L{0.20\textwidth} X L{0.30\textwidth}}
\toprule
Entry & Content & Status on the record \\
\midrule
Clay problem status & A positive mass gap for four-dimensional Yang\textendash{}Mills theory & Open. The Clay Mathematics Institute lists the problem as unsolved and records that no proof of the property is known~\cite{clay} \\
\addlinespace
Nissim lattice theorem & Mass gap, unique infinite-volume limit, and large-$N$ limit for $\mathrm{U}(N)$ lattice Yang\textendash{}Mills in the 't Hooft regime~\cite{nissim} & Rigorous theorem restricted to its regime. It does not address continuum four-dimensional existence or the continuum mass gap \\
\addlinespace
Cao\textendash{}Nissim\textendash{}Sheffield lattice theorem & Wilson area law in the 't Hooft regime by the dynamical approach~\cite{cns} & Rigorous theorem restricted to its regime, with the same limitation \\
\addlinespace
Faria da Veiga\textendash{}O'Carroll lattice analysis & Charge-conjugation decomposition, Elitzur theorem, and mass-term analysis for lattice $\mathrm{SU}(N)$ in four dimensions~\cite{fdv} & Rigorous results on the lattice model. They do not close the continuum limit \\
\addlinespace
Douglas survey & Pre-claim survey of the rigorous status: renormalization has never been made rigorous in the needed generality, and no clear path to the mass gap is known~\cite{douglas} & Published assessment, January 2026 \\
\bottomrule
\end{tabularx}
\end{table}

\begin{table}[ht]
\centering
\small
\caption{Claims without public proof artifacts, as of 29 October 2026. None of these rows is a theorem of this volume or of the public record.}
\label{tab:claims}
\begin{tabularx}{\textwidth}{L{0.18\textwidth} X L{0.30\textwidth}}
\toprule
Claim & Content & Status on the record \\
\midrule
OpenAI existence claim & Rigorous existence of quantum chromodynamics, a simplest grand unified completion, and pure Yang\textendash{}Mills theory as a subproblem, by Balaban-program methods~\cite{openai, kitp} & Existence claimed. Manuscript and formalization withheld. Verification pending before a committee chaired by Gross with Douglas, Jaffe, Klebanov, and Nekrasov \\
\addlinespace
Faizal\textendash{}Shabir construction & Reflection-positive four-dimensional $\mathrm{SU}(N)$ Yang\textendash{}Mills theory with mass gap, confinement, and Osterwalder\textendash{}Schrader reconstruction~\cite{faizal} & Journal-published and unverified. Not treated as solving the Clay problem \\

codex
ROW 1 | Sphere bundle classifications and characteristic detectors reproduce | PARTIAL | The function copies hardcoded homotopy labels and detector names, checking selected labels without computing or testing characteristic detectors.
ROW 2 | Example’s Chevalley–Eilenberg cohomology computes as stated | SUPPORTS | Exact rational differentials and matrix ranks compute and assert the example’s H¹ dimension one and H² dimension zero.
ROW 3 | Tested Frobenius algebra yields decomposition-independent two-dimensional theory | PARTIAL | The code checks algebraic gluing identities and two evaluation routes for genera zero through three, without constructing or testing arbitrary cobordism decompositions.
ROW 4 | Rank-eight connected Dynkin enumeration exactly matches finite-type lists | PARTIAL | Enumeration tests all supported edge labelings of trees, but excludes cyclic graphs without checking that exclusion.
VERDICT: NEEDS_FIX
hook: Stop
hook: Stop Completed
tokens used
52,946
ROW 1 | Sphere bundle classifications and characteristic detectors reproduce | PARTIAL | The function copies hardcoded homotopy labels and detector names, checking selected labels without computing or testing characteristic detectors.
ROW 2 | Example’s Chevalley–Eilenberg cohomology computes as stated | SUPPORTS | Exact rational differentials and matrix ranks compute and assert the example’s H¹ dimension one and H² dimension zero.
ROW 3 | Tested Frobenius algebra yields decomposition-independent two-dimensional theory | PARTIAL | The code checks algebraic gluing identities and two evaluation routes for genera zero through three, without constructing or testing arbitrary cobordism decompositions.
ROW 4 | Rank-eight connected Dynkin enumeration exactly matches finite-type lists | PARTIAL | Enumeration tests all supported edge labelings of trees, but excludes cyclic graphs without checking that exclusion.
VERDICT: NEEDS_FIX
