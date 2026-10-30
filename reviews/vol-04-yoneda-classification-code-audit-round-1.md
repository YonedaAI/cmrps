---
reviewer: codex (OpenAI) gpt-6.1-sol
type: code-audit
paper: vol-04-yoneda-classification
round: 1
date: 2026-10-30T05:22:48Z
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
session id: 01a18b42-bb83-7233-9c84-22d535e74704
--------
user
Read papers/latex/vol-04-yoneda-classification.tex and ONLY the files under src/vol-04-yoneda-classification/ that its code evidence appendix names (do not explore anything else). For EVERY row of the appendix output one line: ROW <n> | <claim, 10 words max> | SUPPORTS | PARTIAL | NO | <one-sentence reason>. SUPPORTS means the named code actually demonstrates or tests the claim as stated. End with VERDICT: PASS if every row is SUPPORTS, else VERDICT: NEEDS_FIX.
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
I’ll read the appendix and its named source files, then assess each row against the code.
exec
/usr/local/bin/zsh -lc 'cat papers/latex/vol-04-yoneda-classification.tex' in /Users/mlong/Documents/Development/classification-physical-systems
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

\DeclareMathOperator{\Hom}{Hom}
\DeclareMathOperator{\Nat}{Nat}
\DeclareMathOperator{\End}{End}
\DeclareMathOperator{\Tr}{Tr}
\DeclareMathOperator{\Sp}{Sp}

\newtheorem{theorem}{Theorem}[section]
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\theoremstyle{remark}
\newtheorem{remark}[theorem]{Remark}

\title{The Yoneda Classification Principle\\[4pt]
  {\normalsize Part 4 of \emph{The Classification of Mathematical Representations of Physical Systems}}}
\author{Matthew Long\\
  \small The YonedaAI Collaboration, YonedaAI Research Collective\\
  \small Chicago, Illinois, USA\\
  \small \texttt{mlong@yonedalabs.ai}\\
  \small \url{https://yonedalabs.ai}}
\date{October 2026}

\begin{document}

\maketitle

\begin{abstract}
The Yoneda embedding sends each object of a category to the functor it represents through its relationships with all other objects. This paper develops the relational characterization of mathematical representations of physical systems that the embedding supplies, and it states precisely what the embedding does not supply. The Yoneda lemma determines an object up to isomorphism by its relational profile, and the embedding is fully faithful on any locally small category of representations once the admissible morphisms are fixed. Concrete representability results for quantum supermaps show that in settings with channel-state duality the relational content is not merely formal, and the classical reconstruction theorems of Gelfand, Stone, and Doplicher and Roberts recover objects from categories of probes. Against these results stands a governing constraint: Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem. A non-implication theorem makes the third denial precise, because full faithfulness holds in categories where isomorphism classes admit no finite-variety parametrization, so representability cannot be the source of a classification theorem. The paper separates established mathematics from conjectural physical interpretation throughout and records the open problem of unifying the supermap line with the reconstruction pattern.
\end{abstract}

\section{Introduction}
\label{sec:intro}

A mathematical representation of a physical system is a tuple of data: a state space, an observable algebra, dynamical laws, symmetry and constraint data, and composition rules. Two questions about such a tuple are easy to confuse. The first asks which equations describe the system. The second asks what relationships the system admits with every other system. Its formal home is the Yoneda embedding
\[
y \colon \mathcal{C} \longrightarrow [\mathcal{C}^{\mathrm{op}}, \mathbf{Set}],
\qquad
y(P) = \Hom_{\mathcal{C}}(-, P),
\]
which sends an object $P$ to the presheaf of its incoming morphisms. The embedding is a theorem of pure category theory: it is fully faithful on every locally small category, and an object is determined up to isomorphism by the presheaf $y(P)$.

The research program of this series asks whether mathematical representations of physical systems admit a structural classification analogous to the classification of finite simple groups. The Yoneda embedding is the natural formal home for one part of that question, because it replaces intrinsic descriptions of objects by relational data. The assignment $P \mapsto y(P)$ turns the question of what $P$ is into the question of which admissible relationships $P$ has with every probe. That shift is exact mathematics. What it is not is a classification, a theory of physical equivalence, or a theory of empirical adequacy. A standing constraint of the series states the limit in one sentence, in its exact words: ``Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem.'' The sentence governs everything that follows.

The relational profile of a representation determines that representation up to isomorphism in a declared category of morphisms, and it determines nothing beyond that isomorphism. Full faithfulness preserves isomorphism classes without constraining how those classes are parameterized, so relational data yields no classification invariants on its own. Concrete physical recovery happens only where extra structure is assumed: channel-state duality for quantum supermaps, symmetric monoidal structure for Doplicher-Roberts reconstruction. On the positive side stand the Yoneda lemma and its corollaries, the Choi correspondence and the supermap representability it supports \cite{whh, hw}, and the probe reconstruction theorems with their declared hypotheses \cite{gn, stone, dr}. On the negative side stands a non-implication theorem: full faithfulness holds in categories where isomorphism classes admit no finite-variety parametrization \cite{buchweitz}, so representability cannot be the source of a classification theorem. No theorem joins the two sides; \cref{sec:synthesis} records the open problem that would.

The classification problem of the program asks for the fundamental structural families of mathematical physics, the operations that assemble systems from them, and the equivalences that connect presentations. The Yoneda embedding lets the third question be phrased without choosing a presentation: an object is what it does to probes. A classification theorem built on relational data must supply invariants beyond representability, because representability delivers determination up to isomorphism and no parameterization of isomorphism classes. A physical reading of relational data must pass the qualification quoted above, because the morphisms defining the profiles are mathematical choices rather than physical identifications. Restricted regimes remain the available home for classification theorems.

Three distinctions organize the results. Mathematical equivalence, isomorphism of representations, is not physical equivalence, the chosen identification of systems in the world. Relational characterization establishes the first and touches the second only through the morphisms one feeds to it. Neither notion is empirical adequacy, which lives in a separate layer of the architecture.

\section{Mathematical framework}
\label{sec:framework}

The definitions below match the shared ontology of the series: an object of the category $\mathrm{Phys}$ is a tuple $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{K})$ comprising a state space or geometric structure $X$, an observable algebra or collection $\mathcal{O}$, dynamical laws $\mathcal{D}$, symmetry and constraint data $\mathcal{S}$, and composition and interaction rules $\mathcal{K}$. The series ontology writes the fifth component as $\mathcal{C}$; it is written $\mathcal{K}$ here to keep the symbol $\mathcal{C}$ available for an ambient category. The five components are a coordinate record for a representation; they need not be independent, and the schema is a candidate definition rather than a theorem.

The founding analysis of $\mathrm{Phys}$ names coarse-grainings, exact equivalences, embeddings, dualities, and limiting procedures as admissible relationships, and it does not fix their preservation laws or composition rules. Until those laws are fixed, $\mathrm{Phys}$ is a schema and not a category, and each use of the Yoneda embedding must declare which class of morphisms is in force. Accordingly, all relational statements in this paper are relative to a fixed category $\mathcal{C}$ of representations with declared morphisms. Changing the morphisms changes the relational content; nothing in the paper licenses reading a statement proved for one class of morphisms as a statement about another.

\begin{definition}[Object schema of a representation]
\label{def:schema}
An \emph{object schema} is a tuple $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{K})$ where $X$ is a state space or geometric structure, $\mathcal{O}$ is an observable algebra or collection, $\mathcal{D}$ is dynamical data, $\mathcal{S}$ is symmetry and constraint data, and $\mathcal{K}$ is composition and interaction data. A category of such tuples is \emph{schema-faithful} when each morphism acts on the five components compatibly with the declared structure of each.
\end{definition}

\begin{definition}[Probe class and relational profile]
\label{def:profile}
Let $\mathcal{C}$ be a locally small category of mathematical representations of physical systems, with the morphism classes in force declared. The \emph{relational profile} of an object $P \in \mathrm{Ob}(\mathcal{C})$ is the presheaf
\[
y(P) = \Hom_{\mathcal{C}}(-, P) \in [\mathcal{C}^{\mathrm{op}}, \mathbf{Set}],
\]
so that for every probe $R \in \mathrm{Ob}(\mathcal{C})$ the set $y(P)(R) = \Hom_{\mathcal{C}}(R, P)$ is the collection of admissible relationships from $R$ to $P$, and for every morphism $f \colon R \to R'$ the action $y(P)(f) \colon \Hom(R', P) \to \Hom(R, P)$ is precomposition. For a restricted probe class $\mathcal{R} \subseteq \mathrm{Ob}(\mathcal{C})$, the \emph{$\mathcal{R}$-restricted profile} is the family $\big(\Hom_{\mathcal{C}}(R, P)\big)_{R \in \mathcal{R}}$ together with the induced actions of morphisms between probes in $\mathcal{R}$.
\end{definition}

\begin{definition}[Relational equivalence]
\label{def:releq}
Two objects $P, Q \in \mathrm{Ob}(\mathcal{C})$ are \emph{relationally equivalent}, written $P \sim_{\mathrm{rel}} Q$, when $y(P) \cong y(Q)$ as presheaves on $\mathcal{C}$. They are \emph{$\mathcal{R}$-relationally equivalent} when their restricted profiles are naturally isomorphic as functors on $\mathcal{R}$.
\end{definition}

The two equivalence notions of the series must be kept apart. \emph{Mathematical equivalence} is isomorphism of the tuples $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{K})$ in the ambient category of each component. \emph{Physical equivalence} is a carefully chosen equivalence relation on representations, motivated by the observation that two mathematical descriptions may describe the same physics without being isomorphic; the choice of that relation is itself open and is load-bearing for the classification problem $\mathrm{Classify}(\mathrm{Ob}(\mathrm{Phys})/{\simeq})$. Relational equivalence is a third notion, defined relative to a declared category $\mathcal{C}$, and its relationship to the first two is the subject of the next section.

\begin{definition}[Equivalence notions and preserved layers]
\label{def:equiv}
An \emph{identification} of two representations $P$ and $Q$ consists of an equivalence notion, being mathematical isomorphism or a declared physical equivalence relation, a morphism kind realizing it, and a declaration of the layers of structure the identification preserves among the symmetric monoidal, braided, monoidal, $*$-structure, algebraic, and topological layers. An identification that omits the declaration is inadmissible.
\end{definition}

Definition~\ref{def:equiv} is the equivalence discipline of the series in miniature. \Cref{sec:equivalence} shows that the discipline is forced by theorems rather than chosen for tidiness: identifications that forget the monoidal or symmetric layer fail to recover groups even in the finite case.

Two properties of the framework control later claims. First, the relational profile is a function of the morphisms in force and of nothing else; a profile computed in a category of coarse-grainings is a different mathematical object from a profile computed in a category of isomorphisms. Second, the profile is relational data rather than parameter data: it assigns to each probe a set of relationships, and it does not take values in any fixed parameter space of invariants. Classification theorems in the sense of the series demand invariants whose values determine objects up to the chosen equivalence; profiles determine objects up to isomorphism by a different mechanism entirely.

\begin{remark}[Finite-dimensional quantum systems]
\label{ex:quantum}
Fix $n \geq 1$ and let $\mathcal{C}_n$ be the category whose objects are pairs $(H, A)$ of a finite-dimensional complex Hilbert space $H$ with $\dim H \leq n$ and a unital $*$-subalgebra $A \subseteq B(H)$, with morphisms the $*$-homomorphisms. The tuple data of the series is recovered by taking $X = H$ as state space, $\mathcal{O} = A$ as observables, $\mathcal{D}$ the specified Hamiltonian or semigroup dynamics when present, $\mathcal{S}$ the specified symmetry action when present, and $\mathcal{K}$ the tensor product of systems. The relational profile of $(H, A)$ records, for each probe $(H', A')$, the set of unital $*$-homomorphisms $A' \to A$ together with their compatibilities. This category is locally small, and the Yoneda embedding applies to it as to any other.
\end{remark}

\begin{remark}[Classical probe systems]
\label{ex:classical}
Let $\mathcal{C}_{\mathrm{cl}}$ be the category of compact Hausdorff spaces with continuous maps, regarded as the geometric side of classical representations, and let the observable side be the commutative $C^*$-algebra $C(X)$ of continuous complex-valued functions. A probe $R$ contributes the set $\Hom(R, X)$ of continuous maps, equivalently the unital $*$-homomorphisms $C(X) \to C(R)$ through Gelfand duality. \Cref{sec:reconstruction} shows that on the commutative side the probe data reconstructs the object itself.
\end{remark}

\begin{remark}[Process categories]
\label{ex:process}
Fix finite-dimensional systems and let $\mathcal{C}_{\mathrm{ch}}$ have as objects the completely positive trace-preserving maps $\Phi \colon M_n \to M_m$ for varying $n$ and $m$. A morphism from $\Phi \colon A \to B$ to $\Psi \colon C \to D$ is a pair of channels $(E \colon C \to A,\ L \colon B \to D)$ with $\Psi = L \circ \Phi \circ E$; composition is componentwise, and the identity on $\Phi$ is $(\mathrm{id}, \mathrm{id})$. These pairs are the pre- and post-processings without auxiliary memory. General supermaps admit ancillary systems that bridge input and output, and the representability theorem of Section~\ref{sec:supermap} covers that wider setting. Supermaps are the transformations of the processes this category treats as objects, and the relational content in this setting is concretely computable through channel-state duality, because a channel is a state of the composed system.
\end{remark}

\section{Relational characterization}
\label{sec:relational}

The Yoneda lemma and its corollaries \cite{maclane} hold in every locally small category, and their application to $\mathrm{Phys}$ is conditional on the declaration of morphisms recorded in \cref{sec:framework}.

\begin{theorem}[Yoneda lemma]
\label{thm:yoneda}
Let $\mathcal{C}$ be a locally small category and let $A \in \mathrm{Ob}(\mathcal{C})$. For every functor $F \colon \mathcal{C}^{\mathrm{op}} \to \mathbf{Set}$ the evaluation map
\[
\mathrm{ev}_A \colon \Nat\big(\Hom_{\mathcal{C}}(-, A), F\big) \longrightarrow F(A),
\qquad
\alpha \longmapsto \alpha_A(\mathrm{id}_A),
\]
is a bijection.
\end{theorem}

\begin{proof}
Injectivity first. Suppose $\alpha, \beta \colon \Hom(-, A) \to F$ satisfy $\alpha_A(\mathrm{id}_A) = \beta_A(\mathrm{id}_A)$. For any object $X$ and any $f \in \Hom(X, A)$ the naturality square at $f \colon X \to A$ gives $\alpha_X(f) = F(f)(\alpha_A(\mathrm{id}_A))$ and likewise for $\beta$, so $\alpha_X = \beta_X$ for every $X$, and $\alpha = \beta$.

Surjectivity next. Given $a \in F(A)$, define $\alpha^{a}_X \colon \Hom(X, A) \to F(X)$ by $\alpha^{a}_X(f) = F(f)(a)$. Naturality holds: for $g \colon Y \to X$ and $f \in \Hom(X, A)$ one has $\alpha^{a}_Y(f \circ g) = F(f \circ g)(a) = F(g)(F(f)(a)) = F(g)(\alpha^{a}_X(f))$, which is exactly the required square. Finally $\alpha^{a}_A(\mathrm{id}_A) = F(\mathrm{id}_A)(a) = a$, so $\mathrm{ev}_A(\alpha^{a}) = a$. The two constructions are mutually inverse, and local smallness guarantees that each $\Hom(X, A)$ is a set on which $F$ acts.
\end{proof}

\begin{corollary}[Full faithfulness]
\label{cor:faithful}
For all objects $A, B$ of a locally small category $\mathcal{C}$ the map
\[
\Hom_{\mathcal{C}}(A, B) \longrightarrow \Nat\big(y(A), y(B)\big),
\qquad
\varphi \longmapsto \big(g \mapsto \varphi \circ g\big),
\]
is a bijection. In particular $y$ is faithful and full, and $y(A) \cong y(B)$ holds if and only if $A \cong B$.
\end{corollary}

\begin{proof}
Apply Theorem~\ref{thm:yoneda} with $F = \Hom(-, B)$; the bijection sends the natural transformation $\alpha$ to $\alpha_A(\mathrm{id}_A)$, and its inverse sends $\varphi$ to $(g \mapsto \varphi \circ g)$. Faithfulness and fullness are the statement that this map is bijective on hom-sets. If $\theta \colon y(A) \to y(B)$ is a natural isomorphism, the corresponding $\varphi = \theta_A(\mathrm{id}_A)$ is an isomorphism in $\mathcal{C}$, with inverse induced by $\theta^{-1}$; conversely an isomorphism $A \cong B$ induces one of profiles by precomposition.
\end{proof}

Corollary~\ref{cor:faithful} is the exact content of the relational shift. An object $P$ is fully described, up to isomorphism in $\mathcal{C}$, by the totality of its admissible relationships $\Hom(R, P)$ with all probes $R$, together with the compatibility of those relationships along morphisms of probes. No intrinsic presentation of $P$ is needed to recover $P$ up to isomorphism.

\begin{proposition}[Probe content of a profile]
\label{prop:probe}
Let $P \in \mathrm{Ob}(\mathcal{C})$ with $\mathcal{C}$ locally small. For each probe $R$ the value $y(P)(R) = \Hom(R, P)$ is the set of admissible relationships from $R$ to $P$, and the action of $y(P)$ along $f \colon R \to R'$ is the composition law of $\mathcal{C}$. Consequently the profile $y(P)$ is determined by, and determines, the system's interaction with every probe in $\mathcal{C}$, and two systems have isomorphic profiles exactly when those interactions coincide up to relabelling by isomorphisms of the probes' targets.
\end{proposition}

\begin{proof}
The value statement is the definition of $y$. The action statement is precomposition, which is the composition law of $\mathcal{C}$ by definition. The last claim is Corollary~\ref{cor:faithful}.
\end{proof}

\begin{corollary}[Relational equivalence is isomorphism]
\label{cor:releq}
For a declared category $\mathcal{C}$ of representations one has $P \sim_{\mathrm{rel}} Q$ if and only if $P$ and $Q$ are mathematically equivalent in the sense of isomorphism in $\mathcal{C}$. Relational equivalence therefore refines or coincides with mathematical equivalence according to the morphisms in force, and it implies physical equivalence only when the declared morphisms have themselves been justified as physical equivalences.
\end{corollary}

\begin{proof}
The first sentence is Corollary~\ref{cor:faithful}. The second holds because $\sim_{\mathrm{rel}}$ is by definition isomorphism in the declared category, while physical equivalence is a chosen relation on representations whose correctness is a separate question; the two coincide only if the morphisms of $\mathcal{C}$ were chosen to encode exactly the justified physical identifications.
\end{proof}

Relational characterization is rigorous, and it delivers mathematical equivalence in the category one declares. It reaches physical equivalence only through a justified choice of morphisms, and no such choice is fixed by the embedding itself. The denial concerning classification takes the form of a non-implication: full faithfulness of the embedding does not imply that isomorphism classes admit separating invariants.

The presheaf acts on each probe morphism $f \colon R \to R'$ by precomposition, sending a relationship in $\Hom(R', P)$ to its composite with $f$ in $\Hom(R, P)$, so relational data is only as fine as the probe class allows. Two representations whose hom-sets agree on a subcategory $\mathcal{R} \subseteq \mathcal{C}$ are indistinguishable to those probes, and restricting the probe class can destroy separation entirely, as Proposition~\ref{prop:restriction} records. Distinguishability through profiles is therefore bounded by what the chosen probes can ask, and the fragment of probes is part of every determination claim.

\subsection{Restricted probes}
\label{sec:restricted}

The full profile uses every object of $\mathcal{C}$ as a probe. In practice one computes with a probe class $\mathcal{R}$, and the question is what the restriction loses.

\begin{remark}[A small computation]
\label{ex:small}
Representable presheaves distinguish non-isomorphic objects on finite categories. Let $\mathcal{C}$ have objects $A, B$ and morphisms $\mathrm{id}_A, \mathrm{id}_B$, and one non-identity morphism $f \colon A \to B$. The presheaves evaluate on objects to $y(A)(A) = \{\mathrm{id}_A\}$, $y(A)(B) = \varnothing$, $y(B)(A) = \{f\}$, and $y(B)(B) = \{\mathrm{id}_B\}$. By Corollary~\ref{cor:faithful} the arrow $f \in \Hom(A, B)$ induces a unique natural transformation $\theta \colon y(A) \to y(B)$ with components $\theta_A(\mathrm{id}_A) = f$ and $\theta_B \colon \varnothing \to \{\mathrm{id}_B\}$. Naturality on the probe morphism $f \colon A \to B$ demands $\theta_A \circ y(A)(f) = y(B)(f) \circ \theta_B$; both composite maps go from $y(A)(B) = \Hom(B, A) = \varnothing$ to $\Hom(A, B) = \{f\}$ and therefore coincide vacuously. The values of the two profiles on the probe $B$ differ, being $\varnothing$ and $\{\mathrm{id}_B\}$, so $y(A) \not\cong y(B)$, matching $A \not\cong B$.
\end{remark}

\begin{proposition}[What restriction loses]
\label{prop:restriction}
Let $\mathcal{R} \subseteq \mathrm{Ob}(\mathcal{C})$ be a probe class. Isomorphic restricted profiles do not imply isomorphic objects in general. If the restricted Yoneda comparison $y_{\mathcal{R}} \colon \mathcal{C} \to [\mathcal{R}^{\mathrm{op}}, \mathbf{Set}]$ is fully faithful, then $\mathcal{R}$-relationally equivalent objects are isomorphic, and the argument of Corollary~\ref{cor:faithful} applies verbatim.
\end{proposition}

\begin{proof}
For the first claim take $\mathcal{C}$ with three objects $A, B, C$, no morphisms between distinct objects, and $\mathcal{R} = \{C\}$. Then $\Hom(C, A) = \Hom(C, B) = \varnothing$, so the restricted profiles of $A$ and $B$ agree, while $A \not\cong B$. For the second claim, full faithfulness of $y_{\mathcal{R}}$ means $\Hom(A, B) \cong \Nat(y_{\mathcal{R}}(A), y_{\mathcal{R}}(B))$ for all $A, B$, so a natural isomorphism of restricted profiles induces an isomorphism of objects exactly as in Corollary~\ref{cor:faithful}.
\end{proof}

Proposition~\ref{prop:restriction} makes the probe class part of the hypothesis. A profile computed on an arbitrary small probe class carries no more content than that class exposes, and the condition that the comparison be fully faithful is the standard density requirement on $\mathcal{R}$. Any physical claim about determination by probes must therefore state the probes.

\subsection{Composition of systems}
\label{sec:composition}

Physical systems compose, through tensor products, direct sums, and the other constructions that generate complex systems from simple ones. The behavior of relational profiles under composition is therefore a question the classification program cannot avoid.

\begin{proposition}[Profiles respect limits]
\label{prop:limits}
Let $\mathcal{C}$ be a locally small category in which a diagram $D$ has a limit $L = \lim D$. Then $y(L)$ is the limit of the diagram $y \circ D$ in $[\mathcal{C}^{\mathrm{op}}, \mathbf{Set}]$. In particular $y$ preserves terminal objects and binary products: $y(A \times B) \cong y(A) \times y(B)$ canonically whenever the product exists.
\end{proposition}

\begin{proof}
Limits of presheaves are computed pointwise, so for each probe $R$ one must show
\[
\Hom(R, \lim D) \cong \lim \Hom(R, D),
\]
which is the defining universal property of the limit applied to the probe $R$. For binary products the statement reads $\Hom(R, A \times B) \cong \Hom(R, A) \times \Hom(R, B)$, which is the universal property of the product.
\end{proof}

Tensor products behave differently. There is in general no canonical map relating $\Hom(R, P \otimes Q)$ to $\Hom(R, P) \otimes \Hom(R, Q)$, and the profile of a composite system is not assembled from the profiles of its factors by any universal construction available to the embedding. Determination of composites from relational data is therefore not a formal consequence of Yoneda; where it holds, it holds by a further theorem. The factorisation results of \cref{sec:supermap} are exactly such a theorem for the composition of processes under a causal-order hypothesis, and the decomposition theory of representation categories is such a theory for tensor structure. This asymmetry is a design fact of the relational program: limits are transparent to probes, monoidal composition is not.

\subsection{The classification question}
\label{sec:classification}

\begin{definition}[Classification by invariants]
\label{def:classify}
Let $\mathcal{C}$ be a category of representations and let $S$ be a parameter set. An \emph{invariant} is a map $I \colon \mathrm{Ob}(\mathcal{C}) \to S$ constant on isomorphism classes. The invariant $I$ \emph{classifies} $\mathcal{C}$ up to isomorphism when $I(P) = I(Q)$ implies $P \cong Q$; a family of invariants classifies when the joint map does. A classification is \emph{of finite-variety type} over a field $k$ when the parameter set $S$ is the set of $k$-points of a finite-dimensional algebraic variety over $k$. A class of objects is \emph{parametrized by a finite-dimensional variety over $k$} when such a classifying invariant of finite-variety type exists.
\end{definition}

In the series vocabulary a classifying invariant is an invariant of this kind whose value determines the object up to the chosen equivalence, in the manner of a Dynkin diagram for semisimple Lie algebras or a dimension vector for finite-dimensional $C^*$-algebras. The Yoneda embedding supplies no such data: $y(P)$ is a functor rather than a value in a parameter space, and deciding $y(P) \cong y(Q)$ is in general as hard as deciding $P \cong Q$. The temptation the governing constraint guards against is to read determination by relationships as classification. The next theorem separates the two notions formally; its witness is the boundary of representability itself rather than a counterexample to any published claim.

\begin{theorem}[Representability does not imply classifiability]
\label{thm:noimplication}
Let $n \geq 3$, let $S = k[x_{ij}]$ be the polynomial ring over a field $k$ in the entries of a generic $n \times n$ matrix, let $R = S/(\det(x_{ij}))$ be the coordinate ring of the generic determinant hypersurface, and let $\mathcal{C}$ be the category of finitely generated maximal Cohen-Macaulay $R$-modules of rank two, with $R$-module homomorphisms as morphisms. The objects of $\mathcal{C}$ admit no parametrization by a finite-dimensional variety over $k$ in the sense of Definition~\ref{def:classify}, while $y$ is fully faithful on $\mathcal{C}$. Full faithfulness of the Yoneda embedding therefore does not imply the existence of a classification theorem.
\end{theorem}

\begin{proof}
The category $\mathcal{C}$ is locally small, so Theorem~\ref{thm:yoneda} and Corollary~\ref{cor:faithful} apply: $y$ is fully faithful on $\mathcal{C}$. The non-parametrization is the classification result of Buchweitz and Leuschke \cite{buchweitz} for modules over the generic determinant of an $n \times n$ matrix with $n \geq 3$; the bound on $n$ is part of their setting, since the small cases are tame. Their conclusion is exact: the Cohen-Macaulay representation theory of the generic determinant is wild in the tame-wild dichotomy, and in their words it is quite wild, since even in rank two the isomorphism classes cannot be parametrized by a finite-dimensional variety over the coefficients. Rank two is precisely the case their statement covers, which is why $\mathcal{C}$ is defined there. Both statements hold in the same category: a classification in the sense of Definition~\ref{def:classify} is absent for $\mathcal{C}$, while full faithfulness of $y$ on $\mathcal{C}$ is complete. If full faithfulness implied classifiability, no such category would exist; the category exists; so the implication fails.
\end{proof}

\begin{remark}[Scope of the non-implication]
\label{rem:scope}
Theorem~\ref{thm:noimplication} denies an implication; it does not deny that relational data is useful. In tame regimes relational methods convert into invariants, and Sections~\ref{sec:supermap} and~\ref{sec:reconstruction} exhibit settings where they do. The theorem says that the conversion is a further theorem, with hypotheses, and that it cannot be smuggled in as a consequence of representability. The wider wildness literature reinforces the point: every finite-dimensional algebra over an algebraically closed field is derived tame or derived wild, and wildness is preserved under degeneration \cite{bekkert}, so the failure pattern is structural rather than isolated.
\end{remark}

The three denials of the governing constraint now have their mathematical content. Physical equivalence is a choice of morphisms or relations that the embedding does not make. Empirical adequacy is a property of how a representation meets observation, a separate layer of the architecture from mathematical classification. A classification theorem is a supply of separating invariants, and Theorem~\ref{thm:noimplication} shows that representability is logically independent of such a supply. What Yoneda does establish is Corollary~\ref{cor:releq}: objects are determined by their relationships, up to the isomorphism encoded in the declared morphisms.

\subsection{Determination and classification}
\label{sec:regimes}

Structural knowledge of a family falls into one of four regimes, recorded in Table~\ref{tab:regimes}; the Yoneda embedding belongs to the third.

\begin{table}[t]
\centering
\small
\caption{Four regimes of structural knowledge. The Yoneda embedding supplies determination; classification content comes from the invariants of each family; the wild regimes forbid finite-variety classification outright.}
\label{tab:regimes}
\begin{tabular}{@{} L{3.8cm} L{4.2cm} L{3.2cm} L{3.2cm} @{}}
\toprule
Regime & Example & Invariant & What is missing \\
\midrule
Complete and parameterized & Semisimple Lie algebras & Dynkin diagram & Nothing in scope \\
Complete without parameters & Finite simple groups & Atlas data & A uniform parameterization \\
Determination only & Any locally small category & Relational profile & Separating invariants \\
Forbidden in the stated generality & Modules over the generic determinant & None of finite-variety type & Classification itself \\
\bottomrule
\end{tabular}
\end{table}

The second regime is the reminder that even a completed classification can lack a uniform parameterization, which is why the classification problem of this series asks for families and constructions rather than for a single list. The third regime is where this paper lives: determination is available everywhere, and classification content is a further achievement of particular families. The fourth regime is the boundary drawn by Theorem~\ref{thm:noimplication}: in wild settings determination persists and classification does not, and no amount of representability changes that. A relational program for classification must therefore work through the second regime, converting determination into family-specific invariants wherever tame structure allows.

\section{Supermap representability}
\label{sec:supermap}

Formal category theory gives relational profiles no matter what the objects are. The question of whether relational content is ever concretely computational, rather than formal, has a positive answer in one corner of quantum theory: quantum supermaps, the transformations of quantum channels. The representability theorems of 2024 to 2026 show that in settings with channel-state duality, categorical supermaps are concretely representable, and that Yoneda representability underlies factorisation theorems for them \cite{whh, hw}.

A \emph{supermap} is a transformation $\Psi$ that assigns to each channel $\Phi \colon M_n \to M_m$ of an admissible class a channel $\Psi(\Phi) \colon M_{n'} \to M_{m'}$, compatibly with composition of channels and with the tensor product of systems. Supermaps are therefore second-order processes: processes whose inputs and outputs are themselves processes. The relational question for them is concrete. Which transformations count as processes in their own right, and can the answer be read off from the relationships the channel admits? The channel-state duality answers both questions at once, because it identifies a channel with a state of the composed system.

Let $M_n$ denote the $n \times n$ complex matrices, and let $\Phi \colon M_n \to M_m$ be a linear map. The \emph{Choi matrix} of $\Phi$ \cite{choi} is
\[
J(\Phi) \;=\; \sum_{i,j=1}^{n} E_{ij} \otimes \Phi(E_{ij}) \;\in\; M_n \otimes M_m,
\]
where $E_{ij}$ are the matrix units of $M_n$. A linear map is completely positive if and only if $J(\Phi) \geq 0$, and it is trace preserving if and only if $\Tr_m\, J(\Phi) = I_n$, the partial trace over the second tensor factor. The normalized Choi matrix of a channel is a state on $M_n \otimes M_m$, and this correspondence between channels and states is \emph{channel-state duality}.

\begin{proposition}[Choi correspondence and composition]
\label{prop:choi}
For fixed $n, m \geq 1$ the assignment $\Phi \mapsto J(\Phi)$ is a linear bijection $L(M_n, M_m) \to M_n \otimes M_m$. It restricts to a bijection between completely positive maps and positive semidefinite Choi matrices, and $\Phi$ is trace preserving if and only if $\Tr_m J(\Phi) = I_n$. If $\Phi \colon M_n \to M_m$ and $\Psi \colon M_m \to M_p$ are linear, then
\begin{equation}
\label{eq:choi-comp}
J(\Psi \circ \Phi)_{(i\alpha),(j\beta)}
\;=\;
\sum_{k,l=1}^{m} J(\Phi)_{(ik),(jl)}\, J(\Psi)_{(k\alpha),(l\beta)},
\end{equation}
where composite indices label rows and columns of $M_n \otimes M_m$ and $M_m \otimes M_p$. Composition of channels is therefore a contraction of Choi indices along the shared system. In the link-product notation of quantum information the same identity appears as $J(\Psi \circ \Phi) = J(\Phi) \ast J(\Psi)$, where the standard convention places a partial transpose on the contracted factor; the component formula displayed here pairs row with row and column with column indices of the shared system, which absorbs that transposition into the index placement.
\end{proposition}

\begin{proof}
The assignment is linear in $\Phi$ by construction. Write $\Phi^{ij,kl}$ for the elementary linear maps $\Phi^{ij,kl}(X) = \Tr(E_{ji} X)\, E_{kl}$; these form a basis of $L(M_n, M_m)$, and $J(\Phi^{ij,kl}) = E_{ij} \otimes E_{kl}$. The elements $E_{ij} \otimes E_{kl}$ form a basis of $M_n \otimes M_m$, so the assignment carries a basis to a basis between vector spaces of the same dimension $n^2 m^2$ and is therefore bijective. Complete positivity corresponds to positivity of $J(\Phi)$, which is the standard matrix-unit characterization. For the trace condition, the partial trace $\Tr_m J(\Phi)$ has entries $\Tr(\Phi(E_{ij}))$, and $\Phi$ is trace preserving exactly when $\Tr(\Phi(E_{ij})) = \Tr(E_{ij}) = \delta_{ij}$ for all $i, j$, which says $\Tr_m J(\Phi) = \sum_i E_{ii} = I_n$. For the composition identity, write $\Phi(E_{ij}) = \sum_{k,l} c^{ij}_{kl} E_{kl}$. Then $J(\Phi)_{(ik),(jl)} = c^{ij}_{kl}$ and $J(\Psi)_{(k\alpha),(l\beta)} = \Psi(E_{kl})_{\alpha\beta}$. The right-hand side of the claimed identity is $\sum_{k,l} c^{ij}_{kl} \Psi(E_{kl})_{\alpha\beta} = \Psi(\Phi(E_{ij}))_{\alpha\beta}$, which is $J(\Psi \circ \Phi)_{(i\alpha),(j\beta)}$ by definition.
\end{proof}

\begin{remark}[Worked instance of the contraction]
\label{rem:worked}
Take $n = m = 2$, let $\Phi$ be the completely depolarizing channel $\Phi(X) = \Tr(X)\, I/2$, and let $\Psi$ be the identity channel. Then $J(\Phi) = \tfrac{1}{2} I \otimes I$ and $J(\Psi) = |\Omega\rangle\langle\Omega|$ with $|\Omega\rangle = \sum_{k} |kk\rangle$ the unnormalized maximally entangled vector; both are positive semidefinite with $\Tr_m J = I$. The contraction of \eqref{eq:choi-comp} reads $\sum_{k,l} J(\Phi)_{(ik),(jl)} \delta_{k\alpha} \delta_{l\beta} = \tfrac{1}{2} \delta_{ij} \delta_{\alpha\beta}$, which is $J(\Psi \circ \Phi) = J(\Phi)$, since $\Psi \circ \Phi = \Phi$. The experiment of \cref{sec:computation} checks the same identity on sampled channels with random Kraus operators.
\end{remark}

Proposition~\ref{prop:choi} is the concrete setting in which channel-state duality is exact: the channel is a state on the composed system, and composition is an index contraction. The category of Remark~\ref{ex:process} records the fragment of process morphisms without auxiliary memory; the theorem below covers supermaps in the full sense of \cite{whh, hw}, where ancillary systems may bridge input and output, and the presheaf of the restricted category is the fragment of that structure on pre- and post-processings.

\begin{theorem}[Supermap representability]
\label{thm:supermap}
Let $\mathcal{T}$ be a theory of processes whose processes form a symmetric monoidal category under sequential and parallel composition, and suppose $\mathcal{T}$ is equipped with a channel-state duality: a natural identification of each process $\Phi \colon A \to B$ with a state of the composite system $A \otimes B$, preserved by composition. Then the categorical supermaps of $\mathcal{T}$ are concretely representable through that duality: every supermap corresponds to a process of the composite system, and representability yields the factorisation theorems for causally ordered supermaps.
\end{theorem}

\begin{proof}
The statement is the representability lemma established in \cite{whh}; the factorisation theorems are proved in \cite{hw}. We record the result as a registered input of the series and do not reproduce the arguments there. Proposition~\ref{prop:choi} verifies the hypothesis in the finite-dimensional matrix setting: the Choi matrix identifies each channel with a state of the composite system, and composition of channels matches contraction of Choi indices, so the duality is preserved by composition as the hypothesis requires.
\end{proof}

\begin{remark}[What the theorem shows]
\label{rem:supermap}
Theorem~\ref{thm:supermap} is the one recorded setting where relational representability is concretely computational: the relationships between processes are themselves processes, and factorisation statements follow. The hypotheses travel with the theorem. Channel-state duality of the required kind is a property of particular frameworks, and no claim is made here that every setting of interest has it, or that the result extends from quantum processes to mathematical representations of physical systems at large. Wilson, Hefford, and Hoffreumon \cite{whh} apply the same lemma to generalised circuit theories, including boxworld and real quantum theory, which shows the hypothesis is checkable theory by theory rather than automatic.
\end{remark}

The supermap setting supports one precise reading of the relational program: once the morphisms are fixed as process transformations and a channel-state duality is available, the profile of a process is not formal data but computable data. That is genuine content, and it is narrower than the slogan of a Yoneda lemma for physics. \Cref{sec:synthesis} records how much narrower.

\subsection{Factorisation theorems}
\label{sec:factorisation}

The representability statement is not the end of the supermap line. The same authors use it to prove factorisation theorems \cite{hw}, and the shape of those theorems is the clearest existing instance of relational structure producing concrete process structure.

The 2024 work \cite{hw} identifies morphisms of strong profunctors as a categorification of quantum supermaps, which places these black-box generalisations of diagrams with holes inside the theory of profunctor optics. From this vantage it constructs abstract logical connectives for supermaps, including tensor products and negations, in a theory-independent setting. Three structural features of quantum supermaps are then modelled by these connectives alone: black-box indefinite causal order, black-box definite causal order, and the factorisation of definitely causally ordered supermaps into concrete circuit diagrams. The 2026 work \cite{whh} states the mechanism as the lemma of Theorem~\ref{thm:supermap}, and the lemma eliminates guesswork in defining supermaps for a given theory.

Two features of this line matter for the classification program. The factorisation theorems are classification-like results for a restricted class: under a causal-order hypothesis, supermaps decompose into circuit data, which is determination by constituents in the sense of decomposition rather than determination by probes. The hypotheses are physical and checkable per theory, and \cite{whh} applies them to generalised theories, including boxworld and real quantum theory, rather than to quantum theory alone. The relational principle has so far earned its keep as a method with hypotheses, not as a universal law.

\section{Reconstruction from probes}
\label{sec:reconstruction}

A second family of results shares the shape of the relational program: reconstruction theorems, which recover an object from a category of probes attached to it. The pattern is older than the supermap line and its settings are exact.

\begin{theorem}[Gelfand duality]
\label{thm:gelfand}
Let $\mathbf{KHaus}$ be the category of compact Hausdorff spaces with continuous maps, and let $\mathbf{CCStar}$ be the category of unital commutative complex $C^*$-algebras with unital $*$-homomorphisms. The assignment $X \mapsto C(X)$ and $A \mapsto \Sp(A)$ extends to an equivalence of categories $\mathbf{KHaus}^{\mathrm{op}} \simeq \mathbf{CCStar}$, a contravariant equivalence between $\mathbf{KHaus}$ and $\mathbf{CCStar}$; equivalently, every unital commutative $C^*$-algebra is isometrically $*$-isomorphic to $C(X)$ for $X$ its character space. More generally, the Gelfand-Naimark theorem \cite{gn} embeds every $C^*$-algebra in the bounded operators of a Hilbert space, and the commutative case is the fully classified one.
\end{theorem}

\begin{proof}
The proofs are the standard ones \cite{gn}: characters of $A$ separate points and give the Gelfand transform $A \to C(\Sp(A))$, which is an isometric $*$-isomorphism for unital commutative $A$; the inverse sends $X$ to $C(X)$ with $\Sp(C(X)) \cong X$ by evaluation. The general embedding result is the Gelfand-Naimark theorem.
\end{proof}

\begin{theorem}[Stone duality]
\label{thm:stone}
Let $\mathbf{Bool}$ be the category of Boolean algebras with homomorphisms, and let $\mathbf{KHaus}_0$ be the category of zero-dimensional compact Hausdorff spaces with continuous maps. The Stone space construction $B \mapsto \mathrm{St}(B)$ and the algebra of clopen sets $X \mapsto \mathrm{Clop}(X)$ extend to an equivalence of categories $\mathbf{Bool}^{\mathrm{op}} \simeq \mathbf{KHaus}_0$, a contravariant equivalence between $\mathbf{Bool}$ and $\mathbf{KHaus}_0$ \cite{stone}.
\end{theorem}

\begin{proof}
Ultrafilters of a Boolean algebra $B$ form a compact zero-dimensional space with the topology generated by the sets of ultrafilters containing each element; the clopen algebra of that space recovers $B$. The two constructions are mutually inverse up to natural isomorphism \cite{stone}.
\end{proof}

\begin{theorem}[Doplicher-Roberts reconstruction]
\label{thm:dr}
Let $\mathcal{T}$ be a symmetric tensor $C^*$-category with conjugates, direct sums, subobjects, and $\End(\mathbf{1}) \cong \mathbb{C}$. Then $\mathcal{T}$ is equivalent, as a symmetric tensor $*$-category, to the category of finite-dimensional unitary representations of a compact supergroup $G$, and $G$ is unique up to isomorphism \cite{dr}. The hypotheses are not decorative: symmetric structure, conjugates, direct sums, subobjects, and the scalar endomorphism condition are all used.
\end{theorem}

\begin{proof}
The reconstruction is that of \cite{dr}, applied in its original setting to the representations selected by the DHR criteria of a local net \cite{dhr}; the uniqueness statement is part of the same theorem. The hypotheses of the statement are exactly those listed; dropping any of them invalidates the conclusion, and \cref{sec:equivalence} records the constraint that dropping the symmetric layer is provably insufficient in any case.
\end{proof}

\begin{remark}[The DHR setting]
\label{rem:dhr}
The Doplicher-Roberts theorem arises from a net of local observables on spacetime: representations of the net are selected by their behavior on the causal complements of regions \cite{dhr}, and the selected representations form exactly the symmetric tensor $C^*$-category of Theorem~\ref{thm:dr}. The probes are the localized endomorphisms, and the recovered object is the compact supergroup implementing the superselection sectors. When the parity twist is trivial, the recovered object is an ordinary compact group; the supergroup form records a non-trivial parity in the symmetric structure. The finite-group statements of \cref{sec:equivalence} are the trivial-twist case, where a symmetric representation category recovers the group itself. This is the sense in which a physical setting supplies a probe category by construction; it is also the reason the hypotheses are physical, not just technical.
\end{remark}

Each theorem has the same shape: a category of probes determines the object. For Gelfand, the probes are characters; for Stone, the probes are ultrafilters; for Doplicher-Roberts, the probes are the localized endomorphisms of a net of observables. In each case the recovering functor is contravariant, and in each case the statement is an equivalence of categories, which is stronger than determination of a single object. Table~\ref{tab:islands} collects the data.

\begin{table}[t]
\centering
\small
\caption{Probe reconstruction islands: each row recovers an object from a category of probes, with the hypotheses that make the recovery exact.}
\label{tab:islands}
\begin{tabular}{@{} L{3.2cm} L{3.6cm} L{4.2cm} L{3.6cm} @{}}
\toprule
Result & Probe category & Recovered object & Hypotheses in force \\
\midrule
Gelfand duality & Characters of a commutative algebra & Compact Hausdorff spectrum & Unital commutative $C^*$-algebra \\
Stone duality & Ultrafilters of a Boolean algebra & Zero-dimensional compact space & Boolean algebra \\
Doplicher-Roberts & Localized endomorphisms of a net & Compact supergroup & Symmetric tensor $C^*$-category with conjugates \\
\bottomrule
\end{tabular}
\end{table}

\begin{proposition}[Probe reconstruction on the commutative side]
\label{prop:commprobe}
Let $A$ be a unital commutative $C^*$-algebra with character space $X = \Sp(A)$. The Gelfand transform $a \mapsto \hat{a}$ is the map that assembles the probe values of $a$, that is, the numbers $\chi(a)$ for the characters $\chi \in \Hom(A, \mathbb{C})$, and the statement of Theorem~\ref{thm:gelfand} is that these probe values determine $A$ up to isometric $*$-isomorphism. The probe data is thus the relational data of $A$ against the one-dimensional representations, and the reconstruction theorem upgrades the determination to an equivalence of categories.
\end{proposition}

\begin{proof}
By definition $\hat{a}(\chi) = \chi(a)$, so the Gelfand transform is the assembly of probe values. Theorem~\ref{thm:gelfand} states that the transform is an isometric $*$-isomorphism onto $C(X)$, which is the determination claim; the contravariant equivalence of categories is the upgrade.
\end{proof}

The relationship of these theorems to Theorem~\ref{thm:supermap} is the open question of \cref{sec:synthesis}. Structurally, each is a relational determination result, and Proposition~\ref{prop:commprobe} shows how literally the probe reading can be taken in the commutative case. Whether the supermap representability line and these reconstruction theorems are instances of one principle is not settled by the present evidence. The resemblance is a research observation; no unifying theorem is claimed in this paper, and the qualification of the governing constraint applies to every attempt to synthesize them.

The boundaries of the islands are as informative as their statements. Gelfand duality classifies the commutative unital part of the operator-algebra family and stops at noncommutativity, where the Gelfand-Naimark theorem supplies an embedding but no classification. Stone duality reaches exactly the zero-dimensional compact spaces and the Boolean algebras, and no further. Doplicher-Roberts reconstruction is available only under symmetric tensor hypotheses, and \cref{sec:equivalence} shows that weakening the symmetric layer destroys the recovery of the group in general. Each theorem is an equivalence of categories with a domain of validity, and the domains do not presently overlap into one principle. A further distinction runs through all three: they determine objects by an equivalent category of probes, which is not parametric classification in the sense of Definition~\ref{def:classify}, since the probe objects are as varied as the objects determined.

\begin{remark}[Finite Stone duality]
\label{rem:finestone}
A finite instance makes the probe reading concrete. Let $X$ be a finite discrete space of $n$ points. Its clopen algebra is the full power set $2^X$, a Boolean algebra with $2^{n}$ elements, and the Stone space of $2^{X}$ is the set of ultrafilters, one per point of $X$, recovering $X$ exactly. The probes are the ultrafilters, equivalently the two-valued homomorphisms $2^X \to 2$, and the recovery is the statement that a finite set is determined by its maps into the two-element set. This is the smallest instance of Theorem~\ref{thm:stone}, and the experiment of \cref{sec:computation} computes its probe data directly.
\end{remark}

\section{Equivalence and preserved structure}
\label{sec:equivalence}

Relational data distinguishes objects up to isomorphism in the declared category. Which layers of structure that isomorphism preserves is not a bookkeeping question: there are theorems forbidding the naive answers.

\begin{theorem}[Etingof-Gelaki constraint]
\label{thm:eg}
There exist non-isomorphic finite groups $G$ and $H$ whose categories $\mathrm{Rep}(G)$ and $\mathrm{Rep}(H)$ of finite-dimensional complex representations are equivalent as monoidal categories, with the commutativity constraint ignored, while the symmetric structures of the two categories differ. A monoidal equivalence of representation categories therefore does not recover the group; the symmetric monoidal layer is required, and any identification that relies on the monoidal layer alone is provably insufficient.
\end{theorem}

\begin{proof}
The existence of such isocategorical groups is proved in \cite{eg}: the paper constructs non-isomorphic groups whose representation categories over $\mathbb{C}$ are equivalent as tensor categories without regard for the commutativity constraint, and records at the same time that symmetric tensor categories of representations do determine a finite group. The negative content for this series is that the monoidal layer is not enough.
\end{proof}

Theorem~\ref{thm:eg} is a constraint on every equivalence proposed in this series: any equivalence used to identify systems must state which layer of structure it preserves. The constraint reaches relational profiles directly.

The construction behind the theorem explains where the failure lives. Starting from a finite group $G$ and a suitable cohomological twist of the symmetry, one obtains non-isomorphic groups whose representation categories carry the same monoidal structure while the symmetric structure differs. The group data is therefore not readable from the monoidal layer even when that layer is read in full, and no choice of relational probes computed in a category of monoidal equivalences can recover it. This is the precise reason the declaration of preserved layers is mandatory rather than advisory.

\begin{proposition}[Preserved-layer discipline for profiles]
\label{prop:discipline}
Let $\mathcal{C}$ be a category of representations whose morphisms preserve a layer $L$ of structure and forget a layer $L'$. If $P \sim_{\mathrm{rel}} Q$ in $\mathcal{C}$, then $P$ and $Q$ are equivalent at layer $L$, and no claim about layer $L'$ follows. In particular, profiles computed in a category of monoidal equivalences that ignore the commutativity constraint cannot support identifications that require the symmetric layer, and every use of the relational profile must declare the layers its morphisms preserve.
\end{proposition}

\begin{proof}
By Corollary~\ref{cor:releq} relational equivalence is isomorphism in $\mathcal{C}$, which preserves exactly the structure the morphisms of $\mathcal{C}$ preserve. Theorem~\ref{thm:eg} exhibits non-isomorphic groups whose representation categories are equivalent as monoidal categories, so no inference about the forgotten symmetric layer is available from layer-$L$ equivalence alone. The declaration requirement is the same constraint applied to the morphisms of $\mathcal{C}$.
\end{proof}

\begin{corollary}[Constraint inheritance]
\label{cor:inherit}
The Yoneda embedding does not weaken the structure-preserving requirement on equivalences. Every relational identification inherits, through its morphisms, the preserved-layer declaration of the equivalence notion in force; a profile computed for one declaration is not evidence for an identification requiring another.
\end{corollary}

\begin{proof}
Proposition~\ref{prop:discipline} with $L$ and $L'$ read as the declared and forgotten layers.
\end{proof}

A computable shadow sits two decategorification steps below Theorem~\ref{thm:eg}: the fusion ring of a representation category. Let $\mathrm{Rep}(G)$ have irreducible objects $V_1, \dots, V_r$ with fusion multiplicities $N_{ij}^{k}$ defined by $V_i \otimes V_j \cong \bigoplus_k N_{ij}^{k} V_k$. The resulting fusion ring records only the tensor multiplicities, not the associator of the monoidal category.

\begin{table}[t]
\centering
\small
\caption{Layers of structure an identification may preserve, and what each layer recovers. The second row is the content of the Etingof-Gelaki constraint: the monoidal layer loses the group.}
\label{tab:layers}
\begin{tabular}{@{} L{4.6cm} L{5.2cm} L{4.4cm} @{}}
\toprule
Layer & Recovers & Status \\
\midrule
Symmetric monoidal & The finite group of a representation category & Sufficient for finite groups \\
Monoidal (tensor) & Tensor structure without the commutativity constraint & Provably insufficient for the group \\
Fusion ring & Fusion multiplicities and dimensions only & Insufficient (Proposition~\ref{prop:fusion}) \\
Algebraic and $*$-structure & The operator-algebraic presentation & Independent of the tensor layers \\
\bottomrule
\end{tabular}
\end{table}

\begin{proposition}[Fusion rings of two groups of order eight]
\label{prop:fusion}
Let $D_8$ be the dihedral group of order eight and $Q_8$ the quaternion group. Their character tables and their representation fusion rings are isomorphic, and the groups are not isomorphic. Fusion-ring data therefore does not determine the group.
\end{proposition}

\begin{proof}
Each group has four one-dimensional irreducible representations and one two-dimensional representation $V$, and the conjugacy classes have sizes $1, 1, 2, 2, 2$ in both cases. Table~\ref{tab:characters} records the character tables; they coincide after matching the central involution $r^2$ of $D_8$ with $-1 \in Q_8$ and the three classes of size two in order. In both cases the one-dimensional representations form the character group of the abelianization $\mathbb{Z}/2 \times \mathbb{Z}/2$, so their fusion is the group law of $\mathbb{Z}/2 \times \mathbb{Z}/2$ in both cases. In both cases $V \otimes V$ is the sum of the four one-dimensional representations: the character computation gives $\chi_{V \otimes V} = \chi_V^2$, which has inner product one with each linear character and zero with $V$. Finally $V \otimes \chi \cong V$ for every linear $\chi$ in both cases. The fusion rings are therefore isomorphic. The groups are not isomorphic: $D_8$ has elements of order two outside its center, while every element of $Q_8$ outside the center has order four.
\end{proof}

\begin{table}[t]
\centering
\small
\caption{Character tables of $D_8$ and $Q_8$, with conjugacy classes listed as identity, central involution, and the three classes of size two. The tables and the fusion rings coincide, and the groups do not.}
\label{tab:characters}
\begin{tabular}{@{} L{4.2cm} c c @{}}
\toprule
Representation & Character on $D_8$ & Character on $Q_8$ \\
\midrule
Linear, trivial & $1,\ 1,\ 1,\ 1,\ 1$ & $1,\ 1,\ 1,\ 1,\ 1$ \\
Linear & $1,\ 1,\ 1,\ -1,\ -1$ & $1,\ 1,\ 1,\ -1,\ -1$ \\
Linear & $1,\ 1,\ -1,\ 1,\ -1$ & $1,\ 1,\ -1,\ 1,\ -1$ \\
Linear & $1,\ 1,\ -1,\ -1,\ 1$ & $1,\ 1,\ -1,\ -1,\ 1$ \\
Two-dimensional & $2,\ -2,\ 0,\ 0,\ 0$ & $2,\ -2,\ 0,\ 0,\ 0$ \\
\bottomrule
\end{tabular}
\end{table}

Proposition~\ref{prop:fusion} is strictly weaker than Theorem~\ref{thm:eg} and says something different. It settles only the fusion-ring shadow: $\mathrm{Rep}(D_8)$ and $\mathrm{Rep}(Q_8)$ are not equivalent as monoidal categories, since their associator data differ, so the example does not reach the monoidal layer at all. Theorem~\ref{thm:eg} asserts the stronger failure for its isocategorical pairs, whose representation categories are equivalent as monoidal categories and still fail to recover the group. The symmetric layer carries what both the fusion ring and the monoidal layer lose.

\section{Computational evidence}
\label{sec:computation}

Three claims of this paper have computational evidence and none has a computational proof. The experiment files in \texttt{src/vol-04-yoneda-classification/} run the checks, and the module \texttt{Instances.hs} records the taxonomy declarations for the volume's four systems: a commutative probe system in the sense of Remark~\ref{ex:classical}, a Boolean probe system, a finite-group representation system, and a quantum channel system in the sense of Remark~\ref{ex:quantum}. The profile data of Definition~\ref{def:profile} appears in the module in the following executable shape, where the action field is the presheaf action of the definition: precomposition of a relationship along a probe morphism.

\begin{lstlisting}
data RelationalProfile probe probeMor rel = RelationalProfile
  { profileProbe     :: probe
  , profileRelations :: [rel]
  , profileAction    :: probeMor -> rel -> rel
  }
\end{lstlisting}

The channel fragment of the module carries typed process data and computes with it: a channel is a list of Kraus operators between spaces of recorded dimensions, and the Choi matrix of Proposition~\ref{prop:choi} is computed from that data.

\begin{lstlisting}
data KrausChannel = KrausChannel
  { kcInputDim  :: Int
  , kcOutputDim :: Int
  , kcOperators :: [Matrix]
  }

data QuantumChannelSystem = QuantumChannelSystem
  { qcsChannel      :: KrausChannel
  , qcsSymmetries   :: String
  , qcsComposition  :: String
  , qcsIsoKey       :: String
  , qcsPhysicalKey  :: String
  }
\end{lstlisting}

\begin{itemize}
\item The module \texttt{src/vol-04-yoneda-classification/Instances.hs} declares the taxonomy instances for the four systems and computes with the typed channel fragment. The family instances record the defining structural data of each family; the equivalence instances implement mathematical equivalence as equality of the recorded isomorphism data and physical equivalence as equality of the declared physical-equivalence key. The declaration of physical equivalence is stipulative in exactly the sense of the framework: the key is the relation the instance declares, and the open choice of physical equivalence is not settled by the declaration.
\item The experiment \texttt{yoneda\_profiles.py} evidences Corollary~\ref{cor:faithful} and Corollary~\ref{cor:releq} on a finite test category: it computes profile values $\Hom(R, P)$, the induced actions, and the bijection $\Hom(A, B) \cong \Nat(y(A), y(B))$ on the tested hom-sets, and it computes the ultrafilter probe data of Remark~\ref{rem:finestone}.
\item The experiment \texttt{choi\_duality.py} evidences Proposition~\ref{prop:choi}: it checks the Choi bijection, the positivity and trace conditions, and the composition identity on sampled completely positive maps.
\item The experiment \texttt{fusion\_rings.py} evidences Proposition~\ref{prop:fusion} and the shadow case of Theorem~\ref{thm:eg}: it computes the fusion rings of $D_8$ and $Q_8$, verifies that they are isomorphic, and verifies that the groups are not.
\end{itemize}

Computational evidence is not proof, and none of the claims of this paper rests on these experiments. The experiments check that the formal statements behave as stated on finite instances, which is the role computational work can honestly play. Each experiment is deterministic, prints the outcome of each check, and terminates with a summary line naming the claims it evidences; the runs behind this paper check all rows of Table~\ref{tab:code}. Table~\ref{tab:code} is the code evidence appendix: each row names a computational claim and the file and function that evidences it.

\begin{table}[t]
\centering
\small
\caption{Code evidence appendix: each computational claim of \cref{sec:computation} mapped to the file and function that evidences it in the source tree.}
\label{tab:code}
\begin{tabular}{@{} L{5.4cm} L{4.6cm} L{4.6cm} @{}}
\toprule
Computational claim & File & Function or test \\
\midrule
Taxonomy instances for the volume's systems & \texttt{Instances.hs} & instance declarations for the four system types \\
Relational profile is executable data & \texttt{Instances.hs} & \texttt{yonedaProfile} \\
Choi matrix computable from Kraus data & \texttt{Instances.hs} & \texttt{choiMatrix} and \texttt{applyChannel} \\
Profile bijection on the test category & \texttt{yoneda\_profiles.py} & \texttt{check\_yoneda\_bijection} \\
Distinct objects have distinct profiles & \texttt{yoneda\_profiles.py} & \texttt{check\_faithfulness} \\
Finite Stone space recovers the set & \texttt{yoneda\_profiles.py} & \texttt{check\_stone\_finite} \\
Choi bijection and positivity & \texttt{choi\_duality.py} & \texttt{check\_choi\_bijection} \\
Composition as index contraction & \texttt{choi\_duality.py} & \texttt{check\_composition} \\
Fusion rings of $D_8$ and $Q_8$ agree & \texttt{fusion\_rings.py} & \texttt{check\_fusion\_ring\_iso} \\
$D_8$ and $Q_8$ are non-isomorphic & \texttt{fusion\_rings.py} & \texttt{check\_groups\_distinct} \\
\bottomrule
\end{tabular}
\end{table}

The taxonomy declarations record vocabulary: the abstract components of the probe system and the group system are opaque identifiers, so those declarations index the definitions of the taxonomy rather than encode mathematics at the type level. The typed channel fragment and the Python experiments are the computational evidence proper. No claim of machine verification is made anywhere in this volume; a later mechanization could audit the executable models against kernel-checked specifications, which would be a cross-audit of models rather than a verification of the claims.

\section{Limitations}
\label{sec:limitations}

Each denial of the governing constraint is a precise limitation. They are stated below in the order the constraint lists them.

\emph{Physical equivalence.} Corollary~\ref{cor:releq} shows that relational equivalence is isomorphism in the declared category. Physical equivalence is a chosen relation on representations, motivated by the observation that two mathematical descriptions may describe the same physics without being isomorphic, and the correct choice of that relation is open. The Yoneda embedding neither supplies the choice nor validates one. Any claim that two systems are physically equivalent because their relational profiles agree is therefore unsupported unless the morphisms in force have themselves been justified as physical equivalences.

\emph{Empirical adequacy.} A mathematical structure can be consistent without describing our universe, and several mathematically distinct theories can produce identical predictions in an experimentally accessible regime. Empirical selection is a separate layer of the architecture from mathematical classification, and the Yoneda embedding lives entirely on the mathematical side. The layer is left unformalized here by design: its mathematical content is the subject of observational equivalence, and the claim of this paper is only that relational data does not supply it.

\emph{Classification.} Theorem~\ref{thm:noimplication} shows that full faithfulness of $y$ is logically compatible with the absence of any finite-variety parametrization of isomorphism classes. The classification problem of the series asks for invariants separating objects up to a chosen equivalence; profiles separate objects up to isomorphism by a different mechanism, and the two must not be confused. Where classification content exists for a family of systems, it comes from the invariants of that family, not from representability.

\emph{Morphisms in force.} All relational statements of this paper are conditional on a declared category of representations. The preservation laws and composition rules for the full morphism vocabulary of $\mathrm{Phys}$ are not fixed. Until they are, statements about $\Hom_{\mathrm{Phys}}(-, P)$ are conditional on the chosen fragment, and the one-category assumption itself is open.

\emph{Probe classes.} Proposition~\ref{prop:restriction} shows that restricted profiles determine objects only when the probe class is adequate. Every claim of determination by probes carries the probe class as a hypothesis.

\emph{The unification.} The resemblance between the supermap representability theorem and the reconstruction islands is real and it is unproved as a principle. \Cref{sec:synthesis} states the problem; this paper does not assume its solution.

\emph{Evidence discipline.} The computational layer of \cref{sec:computation} evidences statements already proved in the paper or cited from the literature; it proves nothing on its own, and no claim of the paper is promoted by computation. The taxonomy declarations of \cref{sec:computation} are executable models of the definitions, not verified artifacts, and no claim of machine verification is made anywhere in this volume. Should a later mechanization check these models against kernel-checked specifications, the result would be a cross-audit of executable models, not a verification of the mathematical claims.

What would change the picture is equally precise. A fixed list of preservation laws for morphisms would turn the schema into a category and make $\Hom_{\mathrm{Phys}}(-, P)$ a defined object rather than a family of declared fragments. A justified physical equivalence would tell one which morphisms deserve to be called identifications of systems, and would convert relational equivalence into a physical statement in the cases where the two coincide. Family-specific invariants would supply classification data where it exists, with the relational profile playing the role of a determination principle rather than a source of parameters. Each of these is a theorem to be proved or a definition to be fixed; none follows from the embedding.

\section{Yoneda-principle synthesis}
\label{sec:synthesis}

The open problems of this volume cluster around one question: is there a single principle behind relational representation of physical systems, covering the supermap line, the reconstruction theorems, and the formal Yoneda embedding at once? The problems below are stated in order of centrality. None is solved here.

\begin{description}
\item[The synthesis problem] Does categorical supermap representability, which holds under channel-state duality, unify with the Gelfand, Stone, and Doplicher-Roberts reconstruction pattern into one Yoneda-principle account? A solution would exhibit one statement covering all three islands with explicit hypotheses, and would say what the probe categories have in common beyond their shape. A plausible starting point is to ask whether each island is an instance of one density or representability statement for a probe category attached to the object, with channel-state duality playing the role that characters play in the Gelfand case.

\item[Physical content of profiles] What additional structure on $\mathrm{Phys}$, beyond local smallness of a declared fragment, is needed for $\Hom_{\mathrm{Phys}}(-, P)$ to carry physical content rather than purely mathematical content? The open status of the preservation laws is the concrete gap. Candidate answers include equipping morphisms with operational semantics, or restricting attention to fragments whose morphisms are already justified identifications.

\item[Range of channel-state duality] Which supermap settings admit a channel-state duality of the kind Theorem~\ref{thm:supermap} requires, and how restrictive is that hypothesis in physical terms? Proposition~\ref{prop:choi} settles the finite-dimensional matrix case; the boundary of the hypothesis is unmapped. The applications in \cite{whh} show that the hypothesis is checkable theory by theory.

\item[Symmetric layer in profiles] Does the relational profile interact with the structure-preserving requirement in a positive way? Concretely: does the symmetric monoidal layer of a representation category appear as computable data in the presheaf $y(P)$, in a manner that recovers what Theorem~\ref{thm:eg} shows the monoidal layer loses? A positive answer would make relational data compatible with the constraint of \cref{sec:equivalence} rather than merely subject to it.

\item[Status of the slogan] A Yoneda lemma for physics is a slogan until it is a theorem with hypotheses. What precise statement would earn the name? A candidate must specify the category of representations, the morphisms in force, the notion of determination, and the layer of physical structure it addresses; the slogan alone supports none of these. Theorem~\ref{thm:supermap} is the closest existing statement, and it is a theorem about processes in frameworks with duality, not about physics at large.
\end{description}

The first problem is the volume's headline: the two islands of concrete relational results, quantum supermaps and probe reconstruction, have never been shown to be instances of one theorem. Marking the synthesis as open is not a rhetorical hedge. A unification theorem would be a substantial result, and its absence bounds every claim this paper makes about a general relational principle.

\section{Conclusion}
\label{sec:conclusion}

The Yoneda embedding gives mathematical representations of physical systems a rigorous relational characterization. Objects are determined up to isomorphism by their admissible relationships with all probes; the determination is exact, and it is what the embedding establishes. In two concrete corners the relational content does more than hold formally: supermaps are representable in settings with channel-state duality, and reconstruction theorems recover objects from probe categories exactly. In exchange for these results one must state the declared category and its morphisms, declare the layers of structure an identification preserves, and accept that none of this yields physical equivalence, empirical adequacy, or a classification theorem.

The non-implication theorem of \cref{sec:relational} is the load-bearing negative result: representability holds in categories where no classification exists, so the classification content of any relational program must be proved separately, in tame regimes, from family-specific invariants. That is a narrow statement and an exact one. It leaves the research program of this series intact, because the program asks for restricted classification theorems and explicit obstructions rather than for a single global table, and it places relational characterization in its correct role: a determination principle whose physical and classificatory content are further theorems, each with hypotheses of its own.

The balance of the volume is therefore asymmetric in a deliberate way. On the positive side stand three exact results: the Yoneda lemma with its corollaries, the Choi correspondence and the supermap representability it supports, and the probe reconstruction theorems with their declared hypotheses. On the negative side stand three refusals: relational equivalence is not physical equivalence, representability is not classification, and equivalence at one layer of structure is not equivalence at another. The refusals are not caveats appended to the results; they are theorems about what the results cannot deliver, and together they state the scope of the relational program with a precision that the slogan alone lacks. Within that scope, objects are determined by their relationships, and the remaining questions of the classification program are open in exactly the places \cref{sec:synthesis} names.

The title of the volume names a principle, and the sense of the name should be exact. The Yoneda classification principle is a principle about determination: objects of a declared category of representations are classified by their relational profiles up to isomorphism of that category. It is not a classification theorem in the sense of the program, and this paper has proved that it cannot be one without further input. Read in the determination sense, the principle is a theorem today; read in the classification sense, it is a research direction whose progress runs through tame families, declared equivalences, and the open synthesis of \cref{sec:synthesis}.

\appendix
\section{Fusion computation in detail}
\label{sec:fusion-app}

This appendix records the computation used in Proposition~\ref{prop:fusion}, so that the claim about fusion rings can be checked by hand. Write the irreducible representations of either group as $1, \varepsilon_1, \varepsilon_2, \varepsilon_3, V$, where the $\varepsilon_i$ are the nontrivial linear characters and $\dim V = 2$. The tensor multiplicities are as follows in both cases.

Linear times linear is the group law of the character group $\mathbb{Z}/2 \times \mathbb{Z}/2$:
\[
\varepsilon_i \otimes \varepsilon_j \cong
\begin{cases}
1 & \text{if } i = j, \\
\varepsilon_k & \text{if } \{i, j, k\} = \{1, 2, 3\},
\end{cases}
\]
and $1$ is the unit. Linear times the two-dimensional representation is rigid:
\[
\varepsilon_i \otimes V \cong V \qquad (i = 1, 2, 3).
\]
Finally the square of the two-dimensional representation is the sum of the linear ones:
\[
V \otimes V \cong 1 \oplus \varepsilon_1 \oplus \varepsilon_2 \oplus \varepsilon_3.
\]
The identity follows from the character computation: $\chi_V$ takes values $2, -2, 0, 0, 0$ on the five classes, so $\chi_V^2$ takes values $4, 4, 0, 0, 0$, whose inner product with each linear character is one and whose inner product with $\chi_V$ is zero. Dimensions agree, since $4 = 1 + 1 + 1 + 1$. The two groups give identical multiplicity data $N_{ij}^{k}$, which is the claim that their fusion rings are isomorphic. The failure of the data to distinguish the groups is then a property of the groups: element orders outside the center differ, so no ring isomorphism of fusion data can be induced by a group isomorphism.

The same computation is performed by the experiment \texttt{fusion\_rings.py}, which constructs both character tables from the group presentations, computes the multiplicities by inner products, and compares the results.

\begin{thebibliography}{11}

\bibitem{whh}
Wilson, M., Hefford, J., Hoffreumon, T. \emph{Supermaps on generalised theories}. arXiv:2602.23865 (2026), preprint.
\url{https://arxiv.org/abs/2602.23865}.

\bibitem{hw}
Hefford, J., Wilson, M. \emph{A profunctorial semantics for quantum supermaps}. Proceedings of the 39th Annual ACM/IEEE Symposium on Logic in Computer Science (2024) 1-15.
DOI 10.1145/3661814.3662123. Preprint arXiv:2402.02997.

\bibitem{gn}
Gelfand, I., Neumark, M. \emph{On the imbedding of normed rings into the ring of operators in Hilbert space}. Matematicheskii Sbornik 12 (1943) 197-213. Reprinted in \emph{$C^*$-Algebras: 1943-1993}, Contemporary Mathematics 167 (1994) 403-419.
DOI 10.1090/conm/167/16.

\bibitem{stone}
Stone, M. H. \emph{The theory of representations for Boolean algebras}. Transactions of the American Mathematical Society 40 (1936) 37-111.
DOI 10.1090/S0002-9947-1936-1501865-8.

\bibitem{dr}
Doplicher, S., Roberts, J. E. \emph{A new duality theory for compact groups}. Inventiones mathematicae 98 (1989) 157-218.
\url{https://eudml.org/doc/143725}.

\bibitem{buchweitz}
Buchweitz, R.-O., Leuschke, G. J. \emph{Factoring the adjoint and maximal Cohen-Macaulay modules over the generic determinant}. American Journal of Mathematics 129 (2007) 943-981.
DOI 10.1353/ajm.2007.0022. Preprint arXiv:math/0505315.

\bibitem{maclane}
Mac Lane, S. \emph{Categories for the Working Mathematician}. Graduate Texts in Mathematics, Springer, 2nd ed. (1998).
DOI 10.1007/978-1-4757-4721-8.

\bibitem{bekkert}
Bekkert, V. I., Drozd, Y. A. \emph{Tame-wild dichotomy for derived categories}. arXiv:math/0310352 (2003), preprint.
\url{https://arxiv.org/abs/math/0310352}.

\bibitem{choi}
Choi, M.-D. \emph{Completely positive linear maps on complex matrices}. Linear Algebra and its Applications 10 (1975) 285-290.
DOI 10.1016/0024-3795(75)90075-0.

\bibitem{dhr}
Doplicher, S., Haag, R., Roberts, J. E. \emph{Fields, observables and gauge transformations I}. Communications in Mathematical Physics 13 (1969) 1-23.
DOI 10.1007/BF01645267.

\bibitem{eg}
Etingof, P., Gelaki, S. \emph{Isocategorical groups}. arXiv:math/0007196 (2000), preprint.
\url{https://arxiv.org/abs/math/0007196}.

\end{thebibliography}

\end{document}

exec
/usr/local/bin/zsh -lc "sed -n '230,510p' papers/latex/vol-04-yoneda-classification.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
\begin{definition}[Classification by invariants]
\label{def:classify}
Let $\mathcal{C}$ be a category of representations and let $S$ be a parameter set. An \emph{invariant} is a map $I \colon \mathrm{Ob}(\mathcal{C}) \to S$ constant on isomorphism classes. The invariant $I$ \emph{classifies} $\mathcal{C}$ up to isomorphism when $I(P) = I(Q)$ implies $P \cong Q$; a family of invariants classifies when the joint map does. A classification is \emph{of finite-variety type} over a field $k$ when the parameter set $S$ is the set of $k$-points of a finite-dimensional algebraic variety over $k$. A class of objects is \emph{parametrized by a finite-dimensional variety over $k$} when such a classifying invariant of finite-variety type exists.
\end{definition}

In the series vocabulary a classifying invariant is an invariant of this kind whose value determines the object up to the chosen equivalence, in the manner of a Dynkin diagram for semisimple Lie algebras or a dimension vector for finite-dimensional $C^*$-algebras. The Yoneda embedding supplies no such data: $y(P)$ is a functor rather than a value in a parameter space, and deciding $y(P) \cong y(Q)$ is in general as hard as deciding $P \cong Q$. The temptation the governing constraint guards against is to read determination by relationships as classification. The next theorem separates the two notions formally; its witness is the boundary of representability itself rather than a counterexample to any published claim.

\begin{theorem}[Representability does not imply classifiability]
\label{thm:noimplication}
Let $n \geq 3$, let $S = k[x_{ij}]$ be the polynomial ring over a field $k$ in the entries of a generic $n \times n$ matrix, let $R = S/(\det(x_{ij}))$ be the coordinate ring of the generic determinant hypersurface, and let $\mathcal{C}$ be the category of finitely generated maximal Cohen-Macaulay $R$-modules of rank two, with $R$-module homomorphisms as morphisms. The objects of $\mathcal{C}$ admit no parametrization by a finite-dimensional variety over $k$ in the sense of Definition~\ref{def:classify}, while $y$ is fully faithful on $\mathcal{C}$. Full faithfulness of the Yoneda embedding therefore does not imply the existence of a classification theorem.
\end{theorem}

\begin{proof}
The category $\mathcal{C}$ is locally small, so Theorem~\ref{thm:yoneda} and Corollary~\ref{cor:faithful} apply: $y$ is fully faithful on $\mathcal{C}$. The non-parametrization is the classification result of Buchweitz and Leuschke \cite{buchweitz} for modules over the generic determinant of an $n \times n$ matrix with $n \geq 3$; the bound on $n$ is part of their setting, since the small cases are tame. Their conclusion is exact: the Cohen-Macaulay representation theory of the generic determinant is wild in the tame-wild dichotomy, and in their words it is quite wild, since even in rank two the isomorphism classes cannot be parametrized by a finite-dimensional variety over the coefficients. Rank two is precisely the case their statement covers, which is why $\mathcal{C}$ is defined there. Both statements hold in the same category: a classification in the sense of Definition~\ref{def:classify} is absent for $\mathcal{C}$, while full faithfulness of $y$ on $\mathcal{C}$ is complete. If full faithfulness implied classifiability, no such category would exist; the category exists; so the implication fails.
\end{proof}

\begin{remark}[Scope of the non-implication]
\label{rem:scope}
Theorem~\ref{thm:noimplication} denies an implication; it does not deny that relational data is useful. In tame regimes relational methods convert into invariants, and Sections~\ref{sec:supermap} and~\ref{sec:reconstruction} exhibit settings where they do. The theorem says that the conversion is a further theorem, with hypotheses, and that it cannot be smuggled in as a consequence of representability. The wider wildness literature reinforces the point: every finite-dimensional algebra over an algebraically closed field is derived tame or derived wild, and wildness is preserved under degeneration \cite{bekkert}, so the failure pattern is structural rather than isolated.
\end{remark}

The three denials of the governing constraint now have their mathematical content. Physical equivalence is a choice of morphisms or relations that the embedding does not make. Empirical adequacy is a property of how a representation meets observation, a separate layer of the architecture from mathematical classification. A classification theorem is a supply of separating invariants, and Theorem~\ref{thm:noimplication} shows that representability is logically independent of such a supply. What Yoneda does establish is Corollary~\ref{cor:releq}: objects are determined by their relationships, up to the isomorphism encoded in the declared morphisms.

\subsection{Determination and classification}
\label{sec:regimes}

Structural knowledge of a family falls into one of four regimes, recorded in Table~\ref{tab:regimes}; the Yoneda embedding belongs to the third.

\begin{table}[t]
\centering
\small
\caption{Four regimes of structural knowledge. The Yoneda embedding supplies determination; classification content comes from the invariants of each family; the wild regimes forbid finite-variety classification outright.}
\label{tab:regimes}
\begin{tabular}{@{} L{3.8cm} L{4.2cm} L{3.2cm} L{3.2cm} @{}}
\toprule
Regime & Example & Invariant & What is missing \\
\midrule
Complete and parameterized & Semisimple Lie algebras & Dynkin diagram & Nothing in scope \\
Complete without parameters & Finite simple groups & Atlas data & A uniform parameterization \\
Determination only & Any locally small category & Relational profile & Separating invariants \\
Forbidden in the stated generality & Modules over the generic determinant & None of finite-variety type & Classification itself \\
\bottomrule
\end{tabular}
\end{table}

The second regime is the reminder that even a completed classification can lack a uniform parameterization, which is why the classification problem of this series asks for families and constructions rather than for a single list. The third regime is where this paper lives: determination is available everywhere, and classification content is a further achievement of particular families. The fourth regime is the boundary drawn by Theorem~\ref{thm:noimplication}: in wild settings determination persists and classification does not, and no amount of representability changes that. A relational program for classification must therefore work through the second regime, converting determination into family-specific invariants wherever tame structure allows.

\section{Supermap representability}
\label{sec:supermap}

Formal category theory gives relational profiles no matter what the objects are. The question of whether relational content is ever concretely computational, rather than formal, has a positive answer in one corner of quantum theory: quantum supermaps, the transformations of quantum channels. The representability theorems of 2024 to 2026 show that in settings with channel-state duality, categorical supermaps are concretely representable, and that Yoneda representability underlies factorisation theorems for them \cite{whh, hw}.

A \emph{supermap} is a transformation $\Psi$ that assigns to each channel $\Phi \colon M_n \to M_m$ of an admissible class a channel $\Psi(\Phi) \colon M_{n'} \to M_{m'}$, compatibly with composition of channels and with the tensor product of systems. Supermaps are therefore second-order processes: processes whose inputs and outputs are themselves processes. The relational question for them is concrete. Which transformations count as processes in their own right, and can the answer be read off from the relationships the channel admits? The channel-state duality answers both questions at once, because it identifies a channel with a state of the composed system.

Let $M_n$ denote the $n \times n$ complex matrices, and let $\Phi \colon M_n \to M_m$ be a linear map. The \emph{Choi matrix} of $\Phi$ \cite{choi} is
\[
J(\Phi) \;=\; \sum_{i,j=1}^{n} E_{ij} \otimes \Phi(E_{ij}) \;\in\; M_n \otimes M_m,
\]
where $E_{ij}$ are the matrix units of $M_n$. A linear map is completely positive if and only if $J(\Phi) \geq 0$, and it is trace preserving if and only if $\Tr_m\, J(\Phi) = I_n$, the partial trace over the second tensor factor. The normalized Choi matrix of a channel is a state on $M_n \otimes M_m$, and this correspondence between channels and states is \emph{channel-state duality}.

\begin{proposition}[Choi correspondence and composition]
\label{prop:choi}
For fixed $n, m \geq 1$ the assignment $\Phi \mapsto J(\Phi)$ is a linear bijection $L(M_n, M_m) \to M_n \otimes M_m$. It restricts to a bijection between completely positive maps and positive semidefinite Choi matrices, and $\Phi$ is trace preserving if and only if $\Tr_m J(\Phi) = I_n$. If $\Phi \colon M_n \to M_m$ and $\Psi \colon M_m \to M_p$ are linear, then
\begin{equation}
\label{eq:choi-comp}
J(\Psi \circ \Phi)_{(i\alpha),(j\beta)}
\;=\;
\sum_{k,l=1}^{m} J(\Phi)_{(ik),(jl)}\, J(\Psi)_{(k\alpha),(l\beta)},
\end{equation}
where composite indices label rows and columns of $M_n \otimes M_m$ and $M_m \otimes M_p$. Composition of channels is therefore a contraction of Choi indices along the shared system. In the link-product notation of quantum information the same identity appears as $J(\Psi \circ \Phi) = J(\Phi) \ast J(\Psi)$, where the standard convention places a partial transpose on the contracted factor; the component formula displayed here pairs row with row and column with column indices of the shared system, which absorbs that transposition into the index placement.
\end{proposition}

\begin{proof}
The assignment is linear in $\Phi$ by construction. Write $\Phi^{ij,kl}$ for the elementary linear maps $\Phi^{ij,kl}(X) = \Tr(E_{ji} X)\, E_{kl}$; these form a basis of $L(M_n, M_m)$, and $J(\Phi^{ij,kl}) = E_{ij} \otimes E_{kl}$. The elements $E_{ij} \otimes E_{kl}$ form a basis of $M_n \otimes M_m$, so the assignment carries a basis to a basis between vector spaces of the same dimension $n^2 m^2$ and is therefore bijective. Complete positivity corresponds to positivity of $J(\Phi)$, which is the standard matrix-unit characterization. For the trace condition, the partial trace $\Tr_m J(\Phi)$ has entries $\Tr(\Phi(E_{ij}))$, and $\Phi$ is trace preserving exactly when $\Tr(\Phi(E_{ij})) = \Tr(E_{ij}) = \delta_{ij}$ for all $i, j$, which says $\Tr_m J(\Phi) = \sum_i E_{ii} = I_n$. For the composition identity, write $\Phi(E_{ij}) = \sum_{k,l} c^{ij}_{kl} E_{kl}$. Then $J(\Phi)_{(ik),(jl)} = c^{ij}_{kl}$ and $J(\Psi)_{(k\alpha),(l\beta)} = \Psi(E_{kl})_{\alpha\beta}$. The right-hand side of the claimed identity is $\sum_{k,l} c^{ij}_{kl} \Psi(E_{kl})_{\alpha\beta} = \Psi(\Phi(E_{ij}))_{\alpha\beta}$, which is $J(\Psi \circ \Phi)_{(i\alpha),(j\beta)}$ by definition.
\end{proof}

\begin{remark}[Worked instance of the contraction]
\label{rem:worked}
Take $n = m = 2$, let $\Phi$ be the completely depolarizing channel $\Phi(X) = \Tr(X)\, I/2$, and let $\Psi$ be the identity channel. Then $J(\Phi) = \tfrac{1}{2} I \otimes I$ and $J(\Psi) = |\Omega\rangle\langle\Omega|$ with $|\Omega\rangle = \sum_{k} |kk\rangle$ the unnormalized maximally entangled vector; both are positive semidefinite with $\Tr_m J = I$. The contraction of \eqref{eq:choi-comp} reads $\sum_{k,l} J(\Phi)_{(ik),(jl)} \delta_{k\alpha} \delta_{l\beta} = \tfrac{1}{2} \delta_{ij} \delta_{\alpha\beta}$, which is $J(\Psi \circ \Phi) = J(\Phi)$, since $\Psi \circ \Phi = \Phi$. The experiment of \cref{sec:computation} checks the same identity on sampled channels with random Kraus operators.
\end{remark}

Proposition~\ref{prop:choi} is the concrete setting in which channel-state duality is exact: the channel is a state on the composed system, and composition is an index contraction. The category of Remark~\ref{ex:process} records the fragment of process morphisms without auxiliary memory; the theorem below covers supermaps in the full sense of \cite{whh, hw}, where ancillary systems may bridge input and output, and the presheaf of the restricted category is the fragment of that structure on pre- and post-processings.

\begin{theorem}[Supermap representability]
\label{thm:supermap}
Let $\mathcal{T}$ be a theory of processes whose processes form a symmetric monoidal category under sequential and parallel composition, and suppose $\mathcal{T}$ is equipped with a channel-state duality: a natural identification of each process $\Phi \colon A \to B$ with a state of the composite system $A \otimes B$, preserved by composition. Then the categorical supermaps of $\mathcal{T}$ are concretely representable through that duality: every supermap corresponds to a process of the composite system, and representability yields the factorisation theorems for causally ordered supermaps.
\end{theorem}

\begin{proof}
The statement is the representability lemma established in \cite{whh}; the factorisation theorems are proved in \cite{hw}. We record the result as a registered input of the series and do not reproduce the arguments there. Proposition~\ref{prop:choi} verifies the hypothesis in the finite-dimensional matrix setting: the Choi matrix identifies each channel with a state of the composite system, and composition of channels matches contraction of Choi indices, so the duality is preserved by composition as the hypothesis requires.
\end{proof}

\begin{remark}[What the theorem shows]
\label{rem:supermap}
Theorem~\ref{thm:supermap} is the one recorded setting where relational representability is concretely computational: the relationships between processes are themselves processes, and factorisation statements follow. The hypotheses travel with the theorem. Channel-state duality of the required kind is a property of particular frameworks, and no claim is made here that every setting of interest has it, or that the result extends from quantum processes to mathematical representations of physical systems at large. Wilson, Hefford, and Hoffreumon \cite{whh} apply the same lemma to generalised circuit theories, including boxworld and real quantum theory, which shows the hypothesis is checkable theory by theory rather than automatic.
\end{remark}

The supermap setting supports one precise reading of the relational program: once the morphisms are fixed as process transformations and a channel-state duality is available, the profile of a process is not formal data but computable data. That is genuine content, and it is narrower than the slogan of a Yoneda lemma for physics. \Cref{sec:synthesis} records how much narrower.

\subsection{Factorisation theorems}
\label{sec:factorisation}

The representability statement is not the end of the supermap line. The same authors use it to prove factorisation theorems \cite{hw}, and the shape of those theorems is the clearest existing instance of relational structure producing concrete process structure.

The 2024 work \cite{hw} identifies morphisms of strong profunctors as a categorification of quantum supermaps, which places these black-box generalisations of diagrams with holes inside the theory of profunctor optics. From this vantage it constructs abstract logical connectives for supermaps, including tensor products and negations, in a theory-independent setting. Three structural features of quantum supermaps are then modelled by these connectives alone: black-box indefinite causal order, black-box definite causal order, and the factorisation of definitely causally ordered supermaps into concrete circuit diagrams. The 2026 work \cite{whh} states the mechanism as the lemma of Theorem~\ref{thm:supermap}, and the lemma eliminates guesswork in defining supermaps for a given theory.

Two features of this line matter for the classification program. The factorisation theorems are classification-like results for a restricted class: under a causal-order hypothesis, supermaps decompose into circuit data, which is determination by constituents in the sense of decomposition rather than determination by probes. The hypotheses are physical and checkable per theory, and \cite{whh} applies them to generalised theories, including boxworld and real quantum theory, rather than to quantum theory alone. The relational principle has so far earned its keep as a method with hypotheses, not as a universal law.

\section{Reconstruction from probes}
\label{sec:reconstruction}

A second family of results shares the shape of the relational program: reconstruction theorems, which recover an object from a category of probes attached to it. The pattern is older than the supermap line and its settings are exact.

\begin{theorem}[Gelfand duality]
\label{thm:gelfand}
Let $\mathbf{KHaus}$ be the category of compact Hausdorff spaces with continuous maps, and let $\mathbf{CCStar}$ be the category of unital commutative complex $C^*$-algebras with unital $*$-homomorphisms. The assignment $X \mapsto C(X)$ and $A \mapsto \Sp(A)$ extends to an equivalence of categories $\mathbf{KHaus}^{\mathrm{op}} \simeq \mathbf{CCStar}$, a contravariant equivalence between $\mathbf{KHaus}$ and $\mathbf{CCStar}$; equivalently, every unital commutative $C^*$-algebra is isometrically $*$-isomorphic to $C(X)$ for $X$ its character space. More generally, the Gelfand-Naimark theorem \cite{gn} embeds every $C^*$-algebra in the bounded operators of a Hilbert space, and the commutative case is the fully classified one.
\end{theorem}

\begin{proof}
The proofs are the standard ones \cite{gn}: characters of $A$ separate points and give the Gelfand transform $A \to C(\Sp(A))$, which is an isometric $*$-isomorphism for unital commutative $A$; the inverse sends $X$ to $C(X)$ with $\Sp(C(X)) \cong X$ by evaluation. The general embedding result is the Gelfand-Naimark theorem.
\end{proof}

\begin{theorem}[Stone duality]
\label{thm:stone}
Let $\mathbf{Bool}$ be the category of Boolean algebras with homomorphisms, and let $\mathbf{KHaus}_0$ be the category of zero-dimensional compact Hausdorff spaces with continuous maps. The Stone space construction $B \mapsto \mathrm{St}(B)$ and the algebra of clopen sets $X \mapsto \mathrm{Clop}(X)$ extend to an equivalence of categories $\mathbf{Bool}^{\mathrm{op}} \simeq \mathbf{KHaus}_0$, a contravariant equivalence between $\mathbf{Bool}$ and $\mathbf{KHaus}_0$ \cite{stone}.
\end{theorem}

\begin{proof}
Ultrafilters of a Boolean algebra $B$ form a compact zero-dimensional space with the topology generated by the sets of ultrafilters containing each element; the clopen algebra of that space recovers $B$. The two constructions are mutually inverse up to natural isomorphism \cite{stone}.
\end{proof}

\begin{theorem}[Doplicher-Roberts reconstruction]
\label{thm:dr}
Let $\mathcal{T}$ be a symmetric tensor $C^*$-category with conjugates, direct sums, subobjects, and $\End(\mathbf{1}) \cong \mathbb{C}$. Then $\mathcal{T}$ is equivalent, as a symmetric tensor $*$-category, to the category of finite-dimensional unitary representations of a compact supergroup $G$, and $G$ is unique up to isomorphism \cite{dr}. The hypotheses are not decorative: symmetric structure, conjugates, direct sums, subobjects, and the scalar endomorphism condition are all used.
\end{theorem}

\begin{proof}
The reconstruction is that of \cite{dr}, applied in its original setting to the representations selected by the DHR criteria of a local net \cite{dhr}; the uniqueness statement is part of the same theorem. The hypotheses of the statement are exactly those listed; dropping any of them invalidates the conclusion, and \cref{sec:equivalence} records the constraint that dropping the symmetric layer is provably insufficient in any case.
\end{proof}

\begin{remark}[The DHR setting]
\label{rem:dhr}
The Doplicher-Roberts theorem arises from a net of local observables on spacetime: representations of the net are selected by their behavior on the causal complements of regions \cite{dhr}, and the selected representations form exactly the symmetric tensor $C^*$-category of Theorem~\ref{thm:dr}. The probes are the localized endomorphisms, and the recovered object is the compact supergroup implementing the superselection sectors. When the parity twist is trivial, the recovered object is an ordinary compact group; the supergroup form records a non-trivial parity in the symmetric structure. The finite-group statements of \cref{sec:equivalence} are the trivial-twist case, where a symmetric representation category recovers the group itself. This is the sense in which a physical setting supplies a probe category by construction; it is also the reason the hypotheses are physical, not just technical.
\end{remark}

Each theorem has the same shape: a category of probes determines the object. For Gelfand, the probes are characters; for Stone, the probes are ultrafilters; for Doplicher-Roberts, the probes are the localized endomorphisms of a net of observables. In each case the recovering functor is contravariant, and in each case the statement is an equivalence of categories, which is stronger than determination of a single object. Table~\ref{tab:islands} collects the data.

\begin{table}[t]
\centering
\small
\caption{Probe reconstruction islands: each row recovers an object from a category of probes, with the hypotheses that make the recovery exact.}
\label{tab:islands}
\begin{tabular}{@{} L{3.2cm} L{3.6cm} L{4.2cm} L{3.6cm} @{}}
\toprule
Result & Probe category & Recovered object & Hypotheses in force \\
\midrule
Gelfand duality & Characters of a commutative algebra & Compact Hausdorff spectrum & Unital commutative $C^*$-algebra \\
Stone duality & Ultrafilters of a Boolean algebra & Zero-dimensional compact space & Boolean algebra \\
Doplicher-Roberts & Localized endomorphisms of a net & Compact supergroup & Symmetric tensor $C^*$-category with conjugates \\
\bottomrule
\end{tabular}
\end{table}

\begin{proposition}[Probe reconstruction on the commutative side]
\label{prop:commprobe}
Let $A$ be a unital commutative $C^*$-algebra with character space $X = \Sp(A)$. The Gelfand transform $a \mapsto \hat{a}$ is the map that assembles the probe values of $a$, that is, the numbers $\chi(a)$ for the characters $\chi \in \Hom(A, \mathbb{C})$, and the statement of Theorem~\ref{thm:gelfand} is that these probe values determine $A$ up to isometric $*$-isomorphism. The probe data is thus the relational data of $A$ against the one-dimensional representations, and the reconstruction theorem upgrades the determination to an equivalence of categories.
\end{proposition}

\begin{proof}
By definition $\hat{a}(\chi) = \chi(a)$, so the Gelfand transform is the assembly of probe values. Theorem~\ref{thm:gelfand} states that the transform is an isometric $*$-isomorphism onto $C(X)$, which is the determination claim; the contravariant equivalence of categories is the upgrade.
\end{proof}

The relationship of these theorems to Theorem~\ref{thm:supermap} is the open question of \cref{sec:synthesis}. Structurally, each is a relational determination result, and Proposition~\ref{prop:commprobe} shows how literally the probe reading can be taken in the commutative case. Whether the supermap representability line and these reconstruction theorems are instances of one principle is not settled by the present evidence. The resemblance is a research observation; no unifying theorem is claimed in this paper, and the qualification of the governing constraint applies to every attempt to synthesize them.

The boundaries of the islands are as informative as their statements. Gelfand duality classifies the commutative unital part of the operator-algebra family and stops at noncommutativity, where the Gelfand-Naimark theorem supplies an embedding but no classification. Stone duality reaches exactly the zero-dimensional compact spaces and the Boolean algebras, and no further. Doplicher-Roberts reconstruction is available only under symmetric tensor hypotheses, and \cref{sec:equivalence} shows that weakening the symmetric layer destroys the recovery of the group in general. Each theorem is an equivalence of categories with a domain of validity, and the domains do not presently overlap into one principle. A further distinction runs through all three: they determine objects by an equivalent category of probes, which is not parametric classification in the sense of Definition~\ref{def:classify}, since the probe objects are as varied as the objects determined.

\begin{remark}[Finite Stone duality]
\label{rem:finestone}
A finite instance makes the probe reading concrete. Let $X$ be a finite discrete space of $n$ points. Its clopen algebra is the full power set $2^X$, a Boolean algebra with $2^{n}$ elements, and the Stone space of $2^{X}$ is the set of ultrafilters, one per point of $X$, recovering $X$ exactly. The probes are the ultrafilters, equivalently the two-valued homomorphisms $2^X \to 2$, and the recovery is the statement that a finite set is determined by its maps into the two-element set. This is the smallest instance of Theorem~\ref{thm:stone}, and the experiment of \cref{sec:computation} computes its probe data directly.
\end{remark}

\section{Equivalence and preserved structure}
\label{sec:equivalence}

Relational data distinguishes objects up to isomorphism in the declared category. Which layers of structure that isomorphism preserves is not a bookkeeping question: there are theorems forbidding the naive answers.

\begin{theorem}[Etingof-Gelaki constraint]
\label{thm:eg}
There exist non-isomorphic finite groups $G$ and $H$ whose categories $\mathrm{Rep}(G)$ and $\mathrm{Rep}(H)$ of finite-dimensional complex representations are equivalent as monoidal categories, with the commutativity constraint ignored, while the symmetric structures of the two categories differ. A monoidal equivalence of representation categories therefore does not recover the group; the symmetric monoidal layer is required, and any identification that relies on the monoidal layer alone is provably insufficient.
\end{theorem}

\begin{proof}
The existence of such isocategorical groups is proved in \cite{eg}: the paper constructs non-isomorphic groups whose representation categories over $\mathbb{C}$ are equivalent as tensor categories without regard for the commutativity constraint, and records at the same time that symmetric tensor categories of representations do determine a finite group. The negative content for this series is that the monoidal layer is not enough.
\end{proof}

Theorem~\ref{thm:eg} is a constraint on every equivalence proposed in this series: any equivalence used to identify systems must state which layer of structure it preserves. The constraint reaches relational profiles directly.

The construction behind the theorem explains where the failure lives. Starting from a finite group $G$ and a suitable cohomological twist of the symmetry, one obtains non-isomorphic groups whose representation categories carry the same monoidal structure while the symmetric structure differs. The group data is therefore not readable from the monoidal layer even when that layer is read in full, and no choice of relational probes computed in a category of monoidal equivalences can recover it. This is the precise reason the declaration of preserved layers is mandatory rather than advisory.

\begin{proposition}[Preserved-layer discipline for profiles]
\label{prop:discipline}
Let $\mathcal{C}$ be a category of representations whose morphisms preserve a layer $L$ of structure and forget a layer $L'$. If $P \sim_{\mathrm{rel}} Q$ in $\mathcal{C}$, then $P$ and $Q$ are equivalent at layer $L$, and no claim about layer $L'$ follows. In particular, profiles computed in a category of monoidal equivalences that ignore the commutativity constraint cannot support identifications that require the symmetric layer, and every use of the relational profile must declare the layers its morphisms preserve.
\end{proposition}

\begin{proof}
By Corollary~\ref{cor:releq} relational equivalence is isomorphism in $\mathcal{C}$, which preserves exactly the structure the morphisms of $\mathcal{C}$ preserve. Theorem~\ref{thm:eg} exhibits non-isomorphic groups whose representation categories are equivalent as monoidal categories, so no inference about the forgotten symmetric layer is available from layer-$L$ equivalence alone. The declaration requirement is the same constraint applied to the morphisms of $\mathcal{C}$.
\end{proof}

\begin{corollary}[Constraint inheritance]
\label{cor:inherit}
The Yoneda embedding does not weaken the structure-preserving requirement on equivalences. Every relational identification inherits, through its morphisms, the preserved-layer declaration of the equivalence notion in force; a profile computed for one declaration is not evidence for an identification requiring another.
\end{corollary}

\begin{proof}
Proposition~\ref{prop:discipline} with $L$ and $L'$ read as the declared and forgotten layers.
\end{proof}

A computable shadow sits two decategorification steps below Theorem~\ref{thm:eg}: the fusion ring of a representation category. Let $\mathrm{Rep}(G)$ have irreducible objects $V_1, \dots, V_r$ with fusion multiplicities $N_{ij}^{k}$ defined by $V_i \otimes V_j \cong \bigoplus_k N_{ij}^{k} V_k$. The resulting fusion ring records only the tensor multiplicities, not the associator of the monoidal category.

\begin{table}[t]
\centering
\small
\caption{Layers of structure an identification may preserve, and what each layer recovers. The second row is the content of the Etingof-Gelaki constraint: the monoidal layer loses the group.}
\label{tab:layers}
\begin{tabular}{@{} L{4.6cm} L{5.2cm} L{4.4cm} @{}}
\toprule
Layer & Recovers & Status \\
\midrule
Symmetric monoidal & The finite group of a representation category & Sufficient for finite groups \\
Monoidal (tensor) & Tensor structure without the commutativity constraint & Provably insufficient for the group \\
Fusion ring & Fusion multiplicities and dimensions only & Insufficient (Proposition~\ref{prop:fusion}) \\
Algebraic and $*$-structure & The operator-algebraic presentation & Independent of the tensor layers \\
\bottomrule
\end{tabular}
\end{table}

\begin{proposition}[Fusion rings of two groups of order eight]
\label{prop:fusion}
Let $D_8$ be the dihedral group of order eight and $Q_8$ the quaternion group. Their character tables and their representation fusion rings are isomorphic, and the groups are not isomorphic. Fusion-ring data therefore does not determine the group.
\end{proposition}

\begin{proof}
Each group has four one-dimensional irreducible representations and one two-dimensional representation $V$, and the conjugacy classes have sizes $1, 1, 2, 2, 2$ in both cases. Table~\ref{tab:characters} records the character tables; they coincide after matching the central involution $r^2$ of $D_8$ with $-1 \in Q_8$ and the three classes of size two in order. In both cases the one-dimensional representations form the character group of the abelianization $\mathbb{Z}/2 \times \mathbb{Z}/2$, so their fusion is the group law of $\mathbb{Z}/2 \times \mathbb{Z}/2$ in both cases. In both cases $V \otimes V$ is the sum of the four one-dimensional representations: the character computation gives $\chi_{V \otimes V} = \chi_V^2$, which has inner product one with each linear character and zero with $V$. Finally $V \otimes \chi \cong V$ for every linear $\chi$ in both cases. The fusion rings are therefore isomorphic. The groups are not isomorphic: $D_8$ has elements of order two outside its center, while every element of $Q_8$ outside the center has order four.
\end{proof}

\begin{table}[t]
\centering
\small
\caption{Character tables of $D_8$ and $Q_8$, with conjugacy classes listed as identity, central involution, and the three classes of size two. The tables and the fusion rings coincide, and the groups do not.}
\label{tab:characters}
\begin{tabular}{@{} L{4.2cm} c c @{}}
\toprule
Representation & Character on $D_8$ & Character on $Q_8$ \\
\midrule
Linear, trivial & $1,\ 1,\ 1,\ 1,\ 1$ & $1,\ 1,\ 1,\ 1,\ 1$ \\
Linear & $1,\ 1,\ 1,\ -1,\ -1$ & $1,\ 1,\ 1,\ -1,\ -1$ \\
Linear & $1,\ 1,\ -1,\ 1,\ -1$ & $1,\ 1,\ -1,\ 1,\ -1$ \\
Linear & $1,\ 1,\ -1,\ -1,\ 1$ & $1,\ 1,\ -1,\ -1,\ 1$ \\
Two-dimensional & $2,\ -2,\ 0,\ 0,\ 0$ & $2,\ -2,\ 0,\ 0,\ 0$ \\
\bottomrule
\end{tabular}
\end{table}

Proposition~\ref{prop:fusion} is strictly weaker than Theorem~\ref{thm:eg} and says something different. It settles only the fusion-ring shadow: $\mathrm{Rep}(D_8)$ and $\mathrm{Rep}(Q_8)$ are not equivalent as monoidal categories, since their associator data differ, so the example does not reach the monoidal layer at all. Theorem~\ref{thm:eg} asserts the stronger failure for its isocategorical pairs, whose representation categories are equivalent as monoidal categories and still fail to recover the group. The symmetric layer carries what both the fusion ring and the monoidal layer lose.

\section{Computational evidence}
\label{sec:computation}

Three claims of this paper have computational evidence and none has a computational proof. The experiment files in \texttt{src/vol-04-yoneda-classification/} run the checks, and the module \texttt{Instances.hs} records the taxonomy declarations for the volume's four systems: a commutative probe system in the sense of Remark~\ref{ex:classical}, a Boolean probe system, a finite-group representation system, and a quantum channel system in the sense of Remark~\ref{ex:quantum}. The profile data of Definition~\ref{def:profile} appears in the module in the following executable shape, where the action field is the presheaf action of the definition: precomposition of a relationship along a probe morphism.

\begin{lstlisting}
data RelationalProfile probe probeMor rel = RelationalProfile
  { profileProbe     :: probe
  , profileRelations :: [rel]
  , profileAction    :: probeMor -> rel -> rel
  }
\end{lstlisting}

The channel fragment of the module carries typed process data and computes with it: a channel is a list of Kraus operators between spaces of recorded dimensions, and the Choi matrix of Proposition~\ref{prop:choi} is computed from that data.

\begin{lstlisting}

exec
/usr/local/bin/zsh -lc 'cat src/vol-04-yoneda-classification/fusion_rings.py' in /Users/mlong/Documents/Development/classification-physical-systems
exec
/usr/local/bin/zsh -lc 'cat src/vol-04-yoneda-classification/yoneda_profiles.py' in /Users/mlong/Documents/Development/classification-physical-systems
exec
/usr/local/bin/zsh -lc 'cat src/vol-04-yoneda-classification/Instances.hs' in /Users/mlong/Documents/Development/classification-physical-systems
exec
/usr/local/bin/zsh -lc 'cat src/vol-04-yoneda-classification/choi_duality.py' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D experiment for vol-04-yoneda-classification.

Evidences (computational evidence only, never proof):
  - Proposition (fusion rings of two groups of order eight) and the shadow case
    of the Etingof-Gelaki constraint: the fusion rings of D_8 and Q_8 are
    isomorphic while the groups are not.
  Functions: check_fusion_ring_iso, check_groups_distinct.

Run: python3 fusion_rings.py
"""

from collections import Counter
from itertools import product

import numpy as np


def d8_elements():
    """D8 = <r, s | r^4 = s^2 = 1, s r s = r^-1>; elements (a, b) = r^a s^b."""
    return [(a, b) for a in range(4) for b in range(2)]


def d8_mul(x, y):
    a, b = x
    c, d = y
    # (r^a s^b)(r^c s^d) = r^(a + (-1)^b c) s^(b+d)
    return ((a + (c if b == 0 else -c)) % 4, (b + d) % 2)


def q8_elements():
    """Q8 = {+-1, +-i, +-j, +-k} as words in basis (sign, axis)."""
    els = []
    for sign in (1, -1):
        for axis in ("1", "i", "j", "k"):
            els.append((sign, axis))
    return els


def q8_mul(x, y):
    sa, a = x
    sb, b = y
    sign = sa * sb
    # quaternion units: i^2 = j^2 = k^2 = ijk = -1
    table = {
        ("1", "1"): ("1", 1), ("1", "i"): ("i", 1), ("1", "j"): ("j", 1), ("1", "k"): ("k", 1),
        ("i", "1"): ("i", 1), ("j", "1"): ("j", 1), ("k", "1"): ("k", 1),
        ("i", "i"): ("1", -1), ("j", "j"): ("1", -1), ("k", "k"): ("1", -1),
        ("i", "j"): ("k", 1), ("j", "k"): ("i", 1), ("k", "i"): ("j", 1),
        ("j", "i"): ("k", -1), ("k", "j"): ("i", -1), ("i", "k"): ("j", -1),
    }
    axis, s = table[(a, b)]
    return (sign * s, axis)


def element_order(mul, e, identity):
    x = e
    for n in range(1, 25):
        if x == identity:
            return n
        x = mul(x, e)
    return None


def conjugacy_classes(elements, mul, identity):
    classes = []
    seen = set()
    for g in elements:
        if g in seen:
            continue
        cls = set()
        for h in elements:
            # h g h^-1
            hinv = None
            for t in elements:
                if mul(h, t) == identity and mul(t, h) == identity:
                    hinv = t
                    break
            cls.add(mul(mul(h, g), hinv))
        seen |= cls
        classes.append(sorted(cls, key=repr))
    return classes


def d8_chars():
    """Character table of D8: four linear characters and one of degree 2."""
    els = d8_elements()
    r, s = (1, 0), (0, 1)
    linear = []
    for alpha, beta in product((1, -1), repeat=2):
        def chi(x, alpha=alpha, beta=beta):
            a, b = x
            return (alpha ** a) * (beta ** b)
        linear.append(chi)
    # degree-2 representation: rotation and reflection matrices
    R = np.array([[0.0, -1.0], [1.0, 0.0]])
    S = np.array([[1.0, 0.0], [0.0, -1.0]])

    def rep(x):
        a, b = x
        M = np.eye(2)
        for _ in range(a):
            M = M @ R
        if b == 1:
            M = M @ S
        return M

    def chi2(x):
        return complex(np.trace(rep(x)))

    return els, linear + [chi2], d8_mul, (0, 0)


def q8_chars():
    """Character table of Q8: four linear characters and one of degree 2."""
    els = q8_elements()
    identity = (1, "1")
    linear = []
    for alpha, beta in product((1, -1), repeat=2):
        def chi(x, alpha=alpha, beta=beta):
            sign, axis = x
            if axis == "1":
                return 1  # linear characters kill the central involution -1
            if axis == "i":
                return alpha
            if axis == "j":
                return beta
            return alpha * beta
        linear.append(chi)
    # degree-2 representation by 2x2 complex matrices
    I = np.eye(2, dtype=complex)
    IM = np.array([[1j, 0.0], [0.0, -1j]])
    JM = np.array([[0.0, 1.0], [-1.0, 0.0]])
    KM = IM @ JM
    unit = {"1": I, "i": IM, "j": JM, "k": KM}

    def rep(x):
        sign, axis = x
        return sign * unit[axis]

    def chi2(x):
        return complex(np.trace(rep(x)))

    return els, linear + [chi2], q8_mul, identity


def class_values(els, mul, identity, chars, classes):
    """Evaluate each character on one representative per conjugacy class."""
    table = []
    for chi in chars:
        row = []
        for cls in classes:
            rep = cls[0]
            row.append(complex(chi(rep)))
        table.append(row)
    return table


def fusion_coefficients(els, classes, table, i, j, k):
    """N_ij^k = (1/|G|) sum_g chi_i(g) chi_j(g) conj(chi_k(g)), by classes."""
    G = len(els)
    total = 0.0 + 0.0j
    for idx, cls in enumerate(classes):
        s = table[i][idx] * table[j][idx] * np.conj(table[k][idx])
        total += len(cls) * s
    return int(round(total.real / G))


def fusion_ring(els, classes, table):
    r = len(table)
    return [[[fusion_coefficients(els, classes, table, i, j, k) for k in range(r)]
             for j in range(r)] for i in range(r)]


def check_fusion_ring_iso():
    """Fusion rings of D8 and Q8 are isomorphic as multiset-indexed tables."""
    els_d, chis_d, mul_d, id_d = d8_chars()
    els_q, chis_q, mul_q, id_q = q8_chars()
    cls_d = conjugacy_classes(els_d, mul_d, id_d)
    cls_q = conjugacy_classes(els_q, mul_q, id_q)
    tab_d = class_values(els_d, mul_d, id_d, chis_d, cls_d)
    tab_q = class_values(els_q, mul_q, id_q, chis_q, cls_q)

    # order irreps by degree then by character on identity (both tables)
    def order_key(table):
        return sorted(range(len(table)), key=lambda i: (table[i][0].real, table[i][0].imag))

    # canonicalize conjugacy-class order by the full column of character values
    def order_columns(table):
        r = len(table)
        cols = list(range(len(table[0])))
        keys = {c: tuple((round(table[i][c].real, 6), round(table[i][c].imag, 6))
                         for i in range(r)) for c in cols}
        return sorted(cols, key=lambda c: keys[c])

    ord_d = order_key(tab_d)
    ord_q = order_key(tab_q)
    cols_d = order_columns(tab_d)
    cols_q = order_columns(tab_q)
    tab_d_s = [[tab_d[i][c] for c in cols_d] for i in ord_d]
    tab_q_s = [[tab_q[i][c] for c in cols_q] for i in ord_q]
    cls_d_s = [cls_d[c] for c in cols_d]
    cls_q_s = [cls_q[c] for c in cols_q]

    fr_d = fusion_ring(els_d, cls_d_s, tab_d_s)
    fr_q = fusion_ring(els_q, cls_q_s, tab_q_s)
    same = fr_d == fr_q
    # character tables themselves agree numerically
    tab_same = all(
        abs(tab_d_s[i][c] - tab_q_s[i][c]) < 1e-9
        for i in range(len(tab_d_s)) for c in range(len(tab_d_s[0]))
    )
    status = "PASS" if same and tab_same else "FAIL"
    print(f"  fusion rings equal: {same}, character tables equal: {tab_same} [{status}]")
    return same and tab_same


def check_groups_distinct():
    """D8 and Q8 are non-isomorphic: element order profiles differ."""
    els_d, _, mul_d, id_d = d8_chars()
    els_q, _, mul_q, id_q = q8_chars()
    orders_d = Counter(element_order(mul_d, g, id_d) for g in els_d)
    orders_q = Counter(element_order(mul_q, g, id_q) for g in els_q)
    distinct = orders_d != orders_q
    status = "PASS" if distinct else "FAIL"
    print(f"  order profiles: D8 {dict(sorted(orders_d.items()))} vs "
          f"Q8 {dict(sorted(orders_q.items()))} [{status}]")
    return distinct


def main():
    print("fusion_rings.py: fusion data of D8 and Q8 (computational evidence)")
    ok1 = check_fusion_ring_iso()
    ok2 = check_groups_distinct()
    print(f"SUMMARY: check_fusion_ring_iso={'PASS' if ok1 else 'FAIL'} "
          f"check_groups_distinct={'PASS' if ok2 else 'FAIL'}")
    return 0 if (ok1 and ok2) else 1


if __name__ == "__main__":
    raise SystemExit(main())

 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D experiment for vol-04-yoneda-classification.

Evidences (computational evidence only, never proof):
  - Corollary (full faithfulness): Hom(A,B) <-> Nat(y(A), y(B)) on a finite
    test category. Function: check_yoneda_bijection.
  - Corollary (relational equivalence is isomorphism): distinct objects of the
    test category have distinct relational profiles. Function: check_faithfulness.
  - Remark (finite Stone duality): the Stone space of the power set of a finite
    set X recovers X from ultrafilter probes. Function: check_stone_finite.

Run: python3 yoneda_profiles.py
"""

from itertools import product


def make_category():
    """Finite category: objects A, B, C; morphisms idA, idB, idC, f: A -> B."""
    objs = ["A", "B", "C"]
    hom = {
        ("A", "A"): ["idA"],
        ("B", "B"): ["idB"],
        ("C", "C"): ["idC"],
        ("A", "B"): ["f"],
    }
    # composition table: (g: X->Y, f: Y->Z) -> g ; f
    comp = {
        ("idA", "f"): "f",
        ("f", "idB"): "f",
        ("idA", "idA"): "idA",
        ("idB", "idB"): "idB",
        ("idC", "idC"): "idC",
    }
    return objs, hom, comp


def profile(objs, hom, comp, P):
    """Relational profile y(P): values Hom(R,P) and action along probe morphisms."""
    values = {R: list(hom.get((R, P), [])) for R in objs}
    # action of y(P) along u: R->R' is precomposition: Hom(R',P) -> Hom(R,P)
    actions = {}
    for (R, Rp), us in hom.items():
        for u in us:
            for g in values[Rp]:
                # precomposition: y(P)(u)(g) = g . u
                actions[(u, g)] = comp.get((u, g), None)
    return values, actions


def natural_transformations(objs, hom, comp, P, Q):
    """All natural transformations y(P) -> y(Q) as per-object function choices."""
    yP = profile(objs, hom, comp, P)[0]
    yQ = profile(objs, hom, comp, Q)[0]
    choices = []
    for R in objs:
        src, dst = yP[R], yQ[R]
        if not src:
            choices.append([dict()])
        else:
            maps = []
            for images in product(dst, repeat=len(src)):
                maps.append(dict(zip(src, images)))
            choices.append(maps)
    naturals = []
    for combo in product(*choices):
        theta = dict(zip(objs, combo))
        ok = True
        for (R, Rp), us in hom.items():
            for u in us:
                for g in yP[Rp]:
                    through_u = comp.get((u, g), None)
                    if through_u is None or through_u not in yP[R]:
                        continue
                    left = theta[R].get(through_u, None)
                    # precompose in Q: y(Q)(u)(theta[Rp](g)) = theta[Rp](g) . u
                    img = theta[Rp].get(g, None)
                    if img is None:
                        continue
                    right = comp.get((u, img), None)
                    if left != right:
                        ok = False
                        break
                if not ok:
                    break
            if not ok:
                break
        if ok:
            naturals.append(theta)
    return naturals


def check_yoneda_bijection():
    """Hom(A,B) <-> Nat(y(A), y(B)) is a bijection (Yoneda, full faithfulness)."""
    objs, hom, comp = make_category()
    pairs = [("A", "A"), ("A", "B"), ("B", "A"), ("B", "B"), ("A", "C"), ("C", "C")]
    all_ok = True
    for (P, Q) in pairs:
        homs = hom.get((P, Q), [])
        nats = natural_transformations(objs, hom, comp, P, Q)
        # the bijection sends alpha to alpha_P(id_P)
        images = []
        for theta in nats:
            idP = "id" + P
            images.append(theta[P].get(idP, None))
        bijective = sorted(images) == sorted(homs) and len(set(images)) == len(homs)
        status = "PASS" if bijective and len(nats) == len(homs) else "FAIL"
        if status == "FAIL":
            all_ok = False
        print(f"  yoneda bijection {P}->{Q}: |Hom|={len(homs)} |Nat|={len(nats)} "
              f"images={sorted(set(images))} [{status}]")
    return all_ok


def check_faithfulness():
    """Distinct objects of the test category have distinct relational profiles."""
    objs, hom, comp = make_category()
    profiles = {P: profile(objs, hom, comp, P)[0] for P in objs}
    ok = True
    for P, Q in [("A", "B"), ("A", "C"), ("B", "C")]:
        distinct = profiles[P] != profiles[Q]
        status = "PASS" if distinct else "FAIL"
        if not distinct:
            ok = False
        print(f"  profiles of {P} and {Q} differ: {profiles[P]} vs {profiles[Q]} [{status}]")
    return ok


def check_stone_finite():
    """Stone space of 2^X recovers X from ultrafilter probes (finite Stone)."""
    X = [0, 1, 2]
    # Boolean algebra B = power set of X
    B = [frozenset(s) for r in range(len(X) + 1)
         for s in __import__("itertools").combinations(X, r)]
    # ultrafilters of a finite Boolean algebra are principal: F_x = {b : x in b}
    ultrafilters = []
    for x in X:
        uf = frozenset(b for b in B if x in b)
        ultrafilters.append(uf)
    # distinct ultrafilters, one per point
    distinct = len(set(ultrafilters)) == len(X)
    # clopen recovery: each point recovered as the intersection of its filter
    recovered = []
    for uf in ultrafilters:
        pt = frozenset.intersection(*[b for b in uf]) if uf else frozenset()
        recovered.append(tuple(sorted(pt)))
    rec_ok = sorted(recovered) == [tuple([x]) for x in X]
    status = "PASS" if distinct and rec_ok else "FAIL"
    print(f"  Stone(2^X) has {len(ultrafilters)} ultrafilters for |X|={len(X)}, "
          f"recovered points={sorted(recovered)} [{status}]")
    return distinct and rec_ok


def main():
    print("yoneda_profiles.py: relational profile experiments (computational evidence)")
    ok1 = check_yoneda_bijection()
    ok2 = check_faithfulness()
    ok3 = check_stone_finite()
    print(f"SUMMARY: check_yoneda_bijection={'PASS' if ok1 else 'FAIL'} "
          f"check_faithfulness={'PASS' if ok2 else 'FAIL'} "
          f"check_stone_finite={'PASS' if ok3 else 'FAIL'}")
    return 0 if (ok1 and ok2 and ok3) else 1


if __name__ == "__main__":
    raise SystemExit(main())

 succeeded in 0ms:
{-# LANGUAGE TypeFamilies #-}

-- | Module        : Instances
-- Description     : Taxonomy instances for the physical systems of vol-04,
--                   The Yoneda Classification Principle.
-- Paper source    : papers/latex/vol-04-yoneda-classification.tex
-- Ontology source : docs/ontology.md (DEF-002, DEF-015, DEF-017, DEF-038).
--
-- Two kinds of content live here. First, declarations of instances of the
-- shared classes in src/Taxonomy/ for the volume's four systems; the abstract
-- components of those systems are recorded as opaque identifiers, so the
-- declarations index the definitions and carry no type-level guarantee.
-- Second, a typed fragment for quantum channels: Kraus data as matrices,
-- channel application, and the Choi matrix of the paper's Proposition
-- (Choi correspondence and composition). That fragment, and the Python
-- experiments in this directory, are the computational evidence; the
-- declarations are records of vocabulary.
--
-- Claim status (docs/theorem-registry.md): computational evidence only.
-- Nothing here is proof, and no claim of machine verification is made: the
-- executable models are stated against the same definitions the paper states,
-- and a later mechanization may audit them against kernel-checked
-- specifications.
module Instances
  ( -- * Systems of the volume
    CompactHausdorffSystem (..)
  , BooleanAlgebraSystem (..)
  , FiniteGroupRepSystem (..)
  , QuantumChannelSystem (..)
    -- * Relational profile (paper, probe class and relational profile)
  , RelationalProfile (..)
  , yonedaProfile
    -- * Typed channel fragment
  , Matrix (..)
  , KrausChannel (..)
  , applyChannel
  , choiMatrix
  ) where

import Data.Complex (Complex, conjugate)

import Taxonomy.Families
  ( PhysicalSystem (..)
  , FamilyHilbertOperatorAlgebras (..)
  , FamilySmoothGeometric (..)
  , FamilyDynamicalSemigroups (..)
  , FamilyTensorCategoriesComposition (..)
  , FamilyDiscreteCombinatorial (..)
  )
import Taxonomy.Equivalences
  ( MathematicalEquivalence (..)
  , PhysicalEquivalence (..)
  )
import Taxonomy.Constructions
  ( Construction (..)
  , Constructible (..)
  , Irreducible (..)
  , Decomposable (..)
  )

-- | The relational profile of the paper's definition: the probe R, the set of
-- admissible relationships from R to P, and the presheaf action along probe
-- morphisms, which precomposes a relationship with the probe morphism.
data RelationalProfile probe probeMor rel = RelationalProfile
  { profileProbe     :: probe
  , profileRelations :: [rel]
  , profileAction    :: probeMor -> rel -> rel
  }

-- | Assemble the relational profile of a system against one probe. Executable
-- form of y(P)(R) = Hom(R, P) with its precomposition action along probe
-- morphisms; the action is the functorial transport of the presheaf.
yonedaProfile
  :: probe -> [rel] -> (probeMor -> rel -> rel) -> RelationalProfile probe probeMor rel
yonedaProfile p rs act = RelationalProfile p rs act

-- | Classical probe system of the paper's classical example: a compact
-- Hausdorff state space with commutative observable algebra C(X). The fields
-- are opaque identifiers; the instance declarations below record which family
-- data and which equivalence keys the system carries.
data CompactHausdorffSystem = CompactHausdorffSystem
  { chsSpace        :: String
  , chsObservables  :: String
  , chsDynamics     :: String
  , chsSymmetries   :: String
  , chsComposition  :: String
  , chsIsoKey       :: String
  , chsPhysicalKey  :: String
  }
  deriving (Eq, Show)

instance PhysicalSystem CompactHausdorffSystem where
  type StateSpace   CompactHausdorffSystem = String
  type Observables  CompactHausdorffSystem = String
  type Dynamics     CompactHausdorffSystem = String
  type Symmetries   CompactHausdorffSystem = String
  type Composition  CompactHausdorffSystem = String
  stateSpace  = chsSpace
  observables = chsObservables
  dynamics    = chsDynamics
  symmetries  = chsSymmetries
  composition = chsComposition

instance FamilySmoothGeometric CompactHausdorffSystem where
  type GeometricData CompactHausdorffSystem = String
  geometricData = chsSpace

instance FamilyHilbertOperatorAlgebras CompactHausdorffSystem where
  type OperatorAlgebraData CompactHausdorffSystem = String
  operatorAlgebraData = chsObservables

instance MathematicalEquivalence CompactHausdorffSystem where
  mathematicallyEquivalent a b = chsIsoKey a == chsIsoKey b

instance PhysicalEquivalence CompactHausdorffSystem where
  physicallyEquivalent a b = chsPhysicalKey a == chsPhysicalKey b

-- | Boolean probe system of the paper's finite Stone remark: a Boolean
-- algebra of probes with its Stone spectrum.
data BooleanAlgebraSystem = BooleanAlgebraSystem
  { basAlgebra      :: String
  , basSpectrum     :: String
  , basIsoKey       :: String
  , basPhysicalKey  :: String
  }
  deriving (Eq, Show)

instance PhysicalSystem BooleanAlgebraSystem where
  type StateSpace   BooleanAlgebraSystem = String
  type Observables  BooleanAlgebraSystem = String
  type Dynamics     BooleanAlgebraSystem = String
  type Symmetries   BooleanAlgebraSystem = String
  type Composition  BooleanAlgebraSystem = String
  stateSpace  = basSpectrum
  observables = basAlgebra
  dynamics    = const "none"
  symmetries  = const "none"
  composition = const "direct sum of clopen data"

instance FamilyDiscreteCombinatorial BooleanAlgebraSystem where
  type CombinatorialData BooleanAlgebraSystem = String
  combinatorialData = basAlgebra

instance MathematicalEquivalence BooleanAlgebraSystem where
  mathematicallyEquivalent a b = basIsoKey a == basIsoKey b

instance PhysicalEquivalence BooleanAlgebraSystem where
  physicallyEquivalent a b = basPhysicalKey a == basPhysicalKey b

-- | Finite-group representation system of the paper's fusion computation:
-- the representation category of a finite group, named by its group label and
-- fusion-ring label.
data FiniteGroupRepSystem = FiniteGroupRepSystem
  { fgrGroup        :: String
  , fgrCategory     :: String
  , fgrFusionRing   :: String
  , fgrIsoKey       :: String
  , fgrPhysicalKey  :: String
  }
  deriving (Eq, Show)

instance PhysicalSystem FiniteGroupRepSystem where
  type StateSpace   FiniteGroupRepSystem = String
  type Observables  FiniteGroupRepSystem = String
  type Dynamics     FiniteGroupRepSystem = String
  type Symmetries   FiniteGroupRepSystem = String
  type Composition  FiniteGroupRepSystem = String
  stateSpace  = fgrCategory
  observables = fgrFusionRing
  dynamics    = const "none"
  symmetries  = fgrGroup
  composition = const "tensor product of representations"

instance FamilyTensorCategoriesComposition FiniteGroupRepSystem where
  type TensorCategoryData FiniteGroupRepSystem = String
  tensorCategoryData = fgrCategory

instance MathematicalEquivalence FiniteGroupRepSystem where
  mathematicallyEquivalent a b = fgrIsoKey a == fgrIsoKey b

instance PhysicalEquivalence FiniteGroupRepSystem where
  physicallyEquivalent a b = fgrPhysicalKey a == fgrPhysicalKey b

instance Constructible FiniteGroupRepSystem where
  type Composite FiniteGroupRepSystem = FiniteGroupRepSystem
  tensorProduct a b = Just a { fgrFusionRing = fgrFusionRing a ++ " (x) " ++ fgrFusionRing b }
  directSum _ _ = Nothing
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

instance Irreducible FiniteGroupRepSystem where
  irreducibilityBasis _ = TensorProduct

instance Decomposable FiniteGroupRepSystem where
  decomposition _ = Nothing

-- | A complex matrix, given as a list of rows. Used for the typed channel
-- fragment below.
newtype Matrix = Matrix { entries :: [[Complex Double]] }
  deriving (Eq, Show)

matRows :: Matrix -> Int
matRows (Matrix m) = length m

matCols :: Matrix -> Int
matCols (Matrix []) = 0
matCols (Matrix (r : _)) = length r

matAdd :: Matrix -> Matrix -> Matrix
matAdd (Matrix a) (Matrix b) = Matrix (zipWith (zipWith (+)) a b)

matScale :: Complex Double -> Matrix -> Matrix
matScale s (Matrix m) = Matrix (map (map (s *)) m)

conjTranspose :: Matrix -> Matrix
conjTranspose (Matrix []) = Matrix []
conjTranspose (Matrix rs@(r : _)) =
  Matrix [ [ conjugate ((rs !! j) !! i) | j <- [0 .. length rs - 1] ]
         | i <- [0 .. length r - 1] ]

transposeMat :: Matrix -> Matrix
transposeMat (Matrix []) = Matrix []
transposeMat (Matrix rs@(r : _)) =
  Matrix [ [ (rs !! j) !! i | j <- [0 .. length rs - 1] ]
         | i <- [0 .. length r - 1] ]

matMul :: Matrix -> Matrix -> Matrix
matMul (Matrix a) b =
  let bt = entries (transposeMat b)
  in Matrix [ [ sum (zipWith (*) row col) | col <- bt ] | row <- a ]

-- | Kronecker product.
kron :: Matrix -> Matrix -> Matrix
kron (Matrix a) (Matrix b) =
  Matrix [ concat [ map ((ar !! k) *) brow | k <- [0 .. length ar - 1] ]
         | ar <- a
         , j  <- [0 .. length b - 1]
         , let brow = b !! j ]

-- | The matrix unit E_ij of size n.
basisMatrix :: Int -> Int -> Int -> Matrix
basisMatrix n i j =
  Matrix [ [ if r == i && c == j then 1 else 0 | c <- [0 .. n - 1] ]
         | r <- [0 .. n - 1] ]

-- | A quantum channel given by Kraus operators K_s : C^n -> C^m, acting as
-- X |-> sum_s K_s X K_s^*.
data KrausChannel = KrausChannel
  { kcInputDim   :: Int
  , kcOutputDim  :: Int
  , kcOperators  :: [Matrix]
  }
  deriving (Eq, Show)

-- | Apply a Kraus channel to a matrix.
applyChannel :: KrausChannel -> Matrix -> Matrix
applyChannel ch x =
  let zero = matScale 0 x
  in foldr matAdd zero [ matMul (matMul k x) (conjTranspose k) | k <- kcOperators ch ]

-- | The Choi matrix J(Phi) = sum_ij E_ij (x) Phi(E_ij) of the paper's
-- proposition on the Choi correspondence.
choiMatrix :: KrausChannel -> Matrix
choiMatrix ch =
  let n = kcInputDim ch
      zero = matScale 0 (kron (basisMatrix n 0 0) (applyChannel ch (basisMatrix n 0 0)))
  in foldr matAdd zero
       [ kron (basisMatrix n i j) (applyChannel ch (basisMatrix n i j))
       | i <- [0 .. n - 1], j <- [0 .. n - 1] ]

-- | Quantum channel system of the paper's process example. The process data
-- is typed (dimensions and Kraus operators); the equivalence keys are
-- declared data.
data QuantumChannelSystem = QuantumChannelSystem
  { qcsChannel      :: KrausChannel
  , qcsSymmetries   :: String
  , qcsComposition  :: String
  , qcsIsoKey       :: String
  , qcsPhysicalKey  :: String
  }
  deriving (Eq, Show)

instance PhysicalSystem QuantumChannelSystem where
  type StateSpace   QuantumChannelSystem = (Int, Int)
  type Observables  QuantumChannelSystem = Matrix
  type Dynamics     QuantumChannelSystem = KrausChannel
  type Symmetries   QuantumChannelSystem = String
  type Composition  QuantumChannelSystem = String
  stateSpace q  = (kcInputDim (qcsChannel q), kcOutputDim (qcsChannel q))
  observables   = choiMatrix . qcsChannel
  dynamics      = qcsChannel
  symmetries    = qcsSymmetries
  composition   = qcsComposition

instance FamilyHilbertOperatorAlgebras QuantumChannelSystem where
  type OperatorAlgebraData QuantumChannelSystem = Matrix
  operatorAlgebraData = choiMatrix . qcsChannel

instance FamilyDynamicalSemigroups QuantumChannelSystem where
  type DynamicalSemigroupData QuantumChannelSystem = KrausChannel
  dynamicalSemigroupData = qcsChannel

instance MathematicalEquivalence QuantumChannelSystem where
  mathematicallyEquivalent a b = qcsIsoKey a == qcsIsoKey b

instance PhysicalEquivalence QuantumChannelSystem where
  physicallyEquivalent a b = qcsPhysicalKey a == qcsPhysicalKey b

instance Constructible QuantumChannelSystem where
  type Composite QuantumChannelSystem = QuantumChannelSystem
  tensorProduct a b =
    let ca = qcsChannel a
        cb = qcsChannel b
        combined = KrausChannel
          { kcInputDim  = kcInputDim ca * kcInputDim cb
          , kcOutputDim = kcOutputDim ca * kcOutputDim cb
          , kcOperators = [ kron ka kb | ka <- kcOperators ca, kb <- kcOperators cb ]
          }
    in Just a { qcsChannel = combined }
  directSum _ _ = Nothing
  extend _ _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

instance Irreducible QuantumChannelSystem where
  irreducibilityBasis _ = TensorProduct

instance Decomposable QuantumChannelSystem where
  decomposition _ = Nothing

 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D experiment for vol-04-yoneda-classification.

Evidences (computational evidence only, never proof):
  - Proposition (Choi correspondence and composition): the Choi assignment is
    a linear bijection, complete positivity corresponds to positivity of the
    Choi matrix, trace preservation corresponds to Tr_m J = I, and composition
    of channels is the index contraction of the proposition.
  Functions: check_choi_bijection, check_composition.

Run: python3 choi_duality.py
"""

import numpy as np

rng = np.random.default_rng(20261029)


def random_kraus(n, m, k=None):
    """Random completely positive map M_n -> M_m via Kraus operators."""
    if k is None:
        k = m * n
    ks = [rng.normal(size=(m, n)) + 1j * rng.normal(size=(m, n)) for _ in range(k)]
    return ks


def apply_kraus(ks, X):
    return sum(K @ X @ K.conj().T for K in ks)


def choi_matrix(ks, n, m):
    """J(Phi) = sum_ij E_ij (x) Phi(E_ij) in M_n (x) M_m."""
    J = np.zeros((n * m, n * m), dtype=complex)
    for i in range(n):
        for j in range(n):
            E = np.zeros((n, n), dtype=complex)
            E[i, j] = 1.0
            J += np.kron(E, apply_kraus(ks, E))
    return J


def partial_trace_m(J, n, m):
    """Trace over the second tensor factor of M_n (x) M_m."""
    T = np.zeros((n, n), dtype=complex)
    Jb = J.reshape(n, m, n, m)
    for a in range(m):
        T += Jb[:, a, :, a]
    return T


def make_trace_preserving(ks, n, m):
    """Renormalize Kraus data so the map is trace preserving (Stinespring form)."""
    S = sum(K.conj().T @ K for K in ks)
    vals, vecs = np.linalg.eigh(S)
    vals = np.clip(vals.real, 1e-12, None)
    W = vecs @ np.diag(vals ** -0.5) @ vecs.conj().T
    return [K @ W for K in ks]


def choi_to_map(J, n, m):
    """Recover Phi from J: Phi(E_ij) is the (i,j) block of J."""
    Jb = J.reshape(n, m, n, m)
    def phi(X):
        out = np.zeros((m, m), dtype=complex)
        for i in range(n):
            for j in range(n):
                out += X[i, j] * Jb[i, :, j, :]
        return out
    return phi


def check_choi_bijection():
    """Choi assignment: bijection, positivity <-> CP, Tr_m J = I <-> TP."""
    n, m = 2, 3
    ks = make_trace_preserving(random_kraus(n, m), n, m)
    J = choi_matrix(ks, n, m)

    # positivity of J (completely positive map)
    eig = np.linalg.eigvalsh(J)
    pos_ok = eig.min() > -1e-10

    # trace-preserving condition
    T = partial_trace_m(J, n, m)
    tp_ok = np.allclose(T, np.eye(n), atol=1e-8)

    # bijection: reconstruct Phi from J and compare on random matrices
    phi = choi_to_map(J, n, m)
    rec_ok = True
    for _ in range(5):
        X = rng.normal(size=(n, n)) + 1j * rng.normal(size=(n, n))
        if not np.allclose(phi(X), apply_kraus(ks, X), atol=1e-8):
            rec_ok = False

    status = "PASS" if (pos_ok and tp_ok and rec_ok) else "FAIL"
    print(f"  Choi bijection n={n} m={m}: min eig(J)={eig.min():.2e}, "
          f"Tr_m J == I: {tp_ok}, reconstruction: {rec_ok} [{status}]")
    return pos_ok and tp_ok and rec_ok


def check_composition():
    """J(Psi o Phi) equals the index contraction of the proposition."""
    n, m, p = 2, 2, 3
    phi_ks = make_trace_preserving(random_kraus(n, m), n, m)
    psi_ks = make_trace_preserving(random_kraus(m, p), m, p)

    Jphi = choi_matrix(phi_ks, n, m)
    Jpsi = choi_matrix(psi_ks, m, p)

    # composed map
    comp_ks = [A @ B for A in psi_ks for B in phi_ks]
    Jcomp = choi_matrix(comp_ks, n, p)

    # contraction: Jcomp_(i alpha),(j beta) = sum_{k,l} Jphi_(i k),(j l) Jpsi_(k alpha),(l beta)
    A = Jphi.reshape(n, m, n, m)
    B = Jpsi.reshape(m, p, m, p)
    C = np.zeros((n, p, n, p), dtype=complex)
    for i in range(n):
        for alpha in range(p):
            for j in range(n):
                for beta in range(p):
                    s = 0.0
                    for k in range(m):
                        for l in range(m):
                            s += A[i, k, j, l] * B[k, alpha, l, beta]
                    C[i, alpha, j, beta] = s
    contract_ok = np.allclose(C, Jcomp.reshape(n, p, n, p), atol=1e-8)
    status = "PASS" if contract_ok else "FAIL"
    err = float(np.max(np.abs(C - Jcomp.reshape(n, p, n, p))))
    print(f"  composition contraction n={n} m={m} p={p}: max error {err:.2e} [{status}]")
    return contract_ok


def main():
    print("choi_duality.py: channel-state duality experiments (computational evidence)")
    ok1 = check_choi_bijection()
    ok2 = check_composition()
    print(f"SUMMARY: check_choi_bijection={'PASS' if ok1 else 'FAIL'} "
          f"check_composition={'PASS' if ok2 else 'FAIL'}")
    return 0 if (ok1 and ok2) else 1


if __name__ == "__main__":
    raise SystemExit(main())

exec
/usr/local/bin/zsh -lc 'cat src/vol-04-yoneda-classification/fusion_rings.py' in /Users/mlong/Documents/Development/classification-physical-systems
exec
/usr/local/bin/zsh -lc "sed -n '1,150p' src/vol-04-yoneda-classification/Instances.hs" in /Users/mlong/Documents/Development/classification-physical-systems
exec
/usr/local/bin/zsh -lc "sed -n '200,230p' papers/latex/vol-04-yoneda-classification.tex; sed -n '405,475p' papers/latex/vol-04-yoneda-classification.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D experiment for vol-04-yoneda-classification.

Evidences (computational evidence only, never proof):
  - Proposition (fusion rings of two groups of order eight) and the shadow case
    of the Etingof-Gelaki constraint: the fusion rings of D_8 and Q_8 are
    isomorphic while the groups are not.
  Functions: check_fusion_ring_iso, check_groups_distinct.

Run: python3 fusion_rings.py
"""

from collections import Counter
from itertools import product

import numpy as np


def d8_elements():
    """D8 = <r, s | r^4 = s^2 = 1, s r s = r^-1>; elements (a, b) = r^a s^b."""
    return [(a, b) for a in range(4) for b in range(2)]


def d8_mul(x, y):
    a, b = x
    c, d = y
    # (r^a s^b)(r^c s^d) = r^(a + (-1)^b c) s^(b+d)
    return ((a + (c if b == 0 else -c)) % 4, (b + d) % 2)


def q8_elements():
    """Q8 = {+-1, +-i, +-j, +-k} as words in basis (sign, axis)."""
    els = []
    for sign in (1, -1):
        for axis in ("1", "i", "j", "k"):
            els.append((sign, axis))
    return els


def q8_mul(x, y):
    sa, a = x
    sb, b = y
    sign = sa * sb
    # quaternion units: i^2 = j^2 = k^2 = ijk = -1
    table = {
        ("1", "1"): ("1", 1), ("1", "i"): ("i", 1), ("1", "j"): ("j", 1), ("1", "k"): ("k", 1),
        ("i", "1"): ("i", 1), ("j", "1"): ("j", 1), ("k", "1"): ("k", 1),
        ("i", "i"): ("1", -1), ("j", "j"): ("1", -1), ("k", "k"): ("1", -1),
        ("i", "j"): ("k", 1), ("j", "k"): ("i", 1), ("k", "i"): ("j", 1),
        ("j", "i"): ("k", -1), ("k", "j"): ("i", -1), ("i", "k"): ("j", -1),
    }
    axis, s = table[(a, b)]
    return (sign * s, axis)


def element_order(mul, e, identity):
    x = e
    for n in range(1, 25):
        if x == identity:
            return n
        x = mul(x, e)
    return None


def conjugacy_classes(elements, mul, identity):
    classes = []
    seen = set()
    for g in elements:
        if g in seen:
            continue
        cls = set()
        for h in elements:
            # h g h^-1
            hinv = None
            for t in elements:
                if mul(h, t) == identity and mul(t, h) == identity:
                    hinv = t
                    break
            cls.add(mul(mul(h, g), hinv))
        seen |= cls
        classes.append(sorted(cls, key=repr))
    return classes


def d8_chars():
    """Character table of D8: four linear characters and one of degree 2."""
    els = d8_elements()
    r, s = (1, 0), (0, 1)
    linear = []
    for alpha, beta in product((1, -1), repeat=2):
        def chi(x, alpha=alpha, beta=beta):
            a, b = x
            return (alpha ** a) * (beta ** b)
        linear.append(chi)
    # degree-2 representation: rotation and reflection matrices
    R = np.array([[0.0, -1.0], [1.0, 0.0]])
    S = np.array([[1.0, 0.0], [0.0, -1.0]])

    def rep(x):
        a, b = x
        M = np.eye(2)
        for _ in range(a):
            M = M @ R
        if b == 1:
            M = M @ S
        return M

    def chi2(x):
        return complex(np.trace(rep(x)))

    return els, linear + [chi2], d8_mul, (0, 0)


def q8_chars():
    """Character table of Q8: four linear characters and one of degree 2."""
    els = q8_elements()
    identity = (1, "1")
    linear = []
    for alpha, beta in product((1, -1), repeat=2):
        def chi(x, alpha=alpha, beta=beta):
            sign, axis = x
            if axis == "1":
                return 1  # linear characters kill the central involution -1
            if axis == "i":
                return alpha
            if axis == "j":
                return beta
            return alpha * beta
        linear.append(chi)
    # degree-2 representation by 2x2 complex matrices
    I = np.eye(2, dtype=complex)
    IM = np.array([[1j, 0.0], [0.0, -1j]])
    JM = np.array([[0.0, 1.0], [-1.0, 0.0]])
    KM = IM @ JM
    unit = {"1": I, "i": IM, "j": JM, "k": KM}

    def rep(x):
        sign, axis = x
        return sign * unit[axis]

    def chi2(x):
        return complex(np.trace(rep(x)))

    return els, linear + [chi2], q8_mul, identity


def class_values(els, mul, identity, chars, classes):
    """Evaluate each character on one representative per conjugacy class."""
    table = []
    for chi in chars:
        row = []
        for cls in classes:
            rep = cls[0]
            row.append(complex(chi(rep)))
        table.append(row)
    return table


def fusion_coefficients(els, classes, table, i, j, k):
    """N_ij^k = (1/|G|) sum_g chi_i(g) chi_j(g) conj(chi_k(g)), by classes."""
    G = len(els)
    total = 0.0 + 0.0j
    for idx, cls in enumerate(classes):
        s = table[i][idx] * table[j][idx] * np.conj(table[k][idx])
        total += len(cls) * s
    return int(round(total.real / G))


def fusion_ring(els, classes, table):
    r = len(table)
    return [[[fusion_coefficients(els, classes, table, i, j, k) for k in range(r)]
             for j in range(r)] for i in range(r)]


def check_fusion_ring_iso():
    """Fusion rings of D8 and Q8 are isomorphic as multiset-indexed tables."""
    els_d, chis_d, mul_d, id_d = d8_chars()
    els_q, chis_q, mul_q, id_q = q8_chars()
    cls_d = conjugacy_classes(els_d, mul_d, id_d)
    cls_q = conjugacy_classes(els_q, mul_q, id_q)
    tab_d = class_values(els_d, mul_d, id_d, chis_d, cls_d)
    tab_q = class_values(els_q, mul_q, id_q, chis_q, cls_q)

    # order irreps by degree then by character on identity (both tables)
    def order_key(table):
        return sorted(range(len(table)), key=lambda i: (table[i][0].real, table[i][0].imag))

    # canonicalize conjugacy-class order by the full column of character values
    def order_columns(table):
        r = len(table)
        cols = list(range(len(table[0])))
        keys = {c: tuple((round(table[i][c].real, 6), round(table[i][c].imag, 6))
                         for i in range(r)) for c in cols}
        return sorted(cols, key=lambda c: keys[c])

    ord_d = order_key(tab_d)
    ord_q = order_key(tab_q)
    cols_d = order_columns(tab_d)
    cols_q = order_columns(tab_q)
    tab_d_s = [[tab_d[i][c] for c in cols_d] for i in ord_d]
    tab_q_s = [[tab_q[i][c] for c in cols_q] for i in ord_q]
    cls_d_s = [cls_d[c] for c in cols_d]
    cls_q_s = [cls_q[c] for c in cols_q]

    fr_d = fusion_ring(els_d, cls_d_s, tab_d_s)
    fr_q = fusion_ring(els_q, cls_q_s, tab_q_s)
    same = fr_d == fr_q
    # character tables themselves agree numerically
    tab_same = all(
        abs(tab_d_s[i][c] - tab_q_s[i][c]) < 1e-9
        for i in range(len(tab_d_s)) for c in range(len(tab_d_s[0]))
    )
    status = "PASS" if same and tab_same else "FAIL"
    print(f"  fusion rings equal: {same}, character tables equal: {tab_same} [{status}]")
    return same and tab_same


def check_groups_distinct():
    """D8 and Q8 are non-isomorphic: element order profiles differ."""
    els_d, _, mul_d, id_d = d8_chars()
    els_q, _, mul_q, id_q = q8_chars()
    orders_d = Counter(element_order(mul_d, g, id_d) for g in els_d)
    orders_q = Counter(element_order(mul_q, g, id_q) for g in els_q)
    distinct = orders_d != orders_q
    status = "PASS" if distinct else "FAIL"
    print(f"  order profiles: D8 {dict(sorted(orders_d.items()))} vs "
          f"Q8 {dict(sorted(orders_q.items()))} [{status}]")
    return distinct


def main():
    print("fusion_rings.py: fusion data of D8 and Q8 (computational evidence)")
    ok1 = check_fusion_ring_iso()
    ok2 = check_groups_distinct()
    print(f"SUMMARY: check_fusion_ring_iso={'PASS' if ok1 else 'FAIL'} "
          f"check_groups_distinct={'PASS' if ok2 else 'FAIL'}")
    return 0 if (ok1 and ok2) else 1


if __name__ == "__main__":
    raise SystemExit(main())

 succeeded in 0ms:
{-# LANGUAGE TypeFamilies #-}

-- | Module        : Instances
-- Description     : Taxonomy instances for the physical systems of vol-04,
--                   The Yoneda Classification Principle.
-- Paper source    : papers/latex/vol-04-yoneda-classification.tex
-- Ontology source : docs/ontology.md (DEF-002, DEF-015, DEF-017, DEF-038).
--
-- Two kinds of content live here. First, declarations of instances of the
-- shared classes in src/Taxonomy/ for the volume's four systems; the abstract
-- components of those systems are recorded as opaque identifiers, so the
-- declarations index the definitions and carry no type-level guarantee.
-- Second, a typed fragment for quantum channels: Kraus data as matrices,
-- channel application, and the Choi matrix of the paper's Proposition
-- (Choi correspondence and composition). That fragment, and the Python
-- experiments in this directory, are the computational evidence; the
-- declarations are records of vocabulary.
--
-- Claim status (docs/theorem-registry.md): computational evidence only.
-- Nothing here is proof, and no claim of machine verification is made: the
-- executable models are stated against the same definitions the paper states,
-- and a later mechanization may audit them against kernel-checked
-- specifications.
module Instances
  ( -- * Systems of the volume
    CompactHausdorffSystem (..)
  , BooleanAlgebraSystem (..)
  , FiniteGroupRepSystem (..)
  , QuantumChannelSystem (..)
    -- * Relational profile (paper, probe class and relational profile)
  , RelationalProfile (..)
  , yonedaProfile
    -- * Typed channel fragment
  , Matrix (..)
  , KrausChannel (..)
  , applyChannel
  , choiMatrix
  ) where

import Data.Complex (Complex, conjugate)

import Taxonomy.Families
  ( PhysicalSystem (..)
  , FamilyHilbertOperatorAlgebras (..)
  , FamilySmoothGeometric (..)
  , FamilyDynamicalSemigroups (..)
  , FamilyTensorCategoriesComposition (..)
  , FamilyDiscreteCombinatorial (..)
  )
import Taxonomy.Equivalences
  ( MathematicalEquivalence (..)
  , PhysicalEquivalence (..)
  )
import Taxonomy.Constructions
  ( Construction (..)
  , Constructible (..)
  , Irreducible (..)
  , Decomposable (..)
  )

-- | The relational profile of the paper's definition: the probe R, the set of
-- admissible relationships from R to P, and the presheaf action along probe
-- morphisms, which precomposes a relationship with the probe morphism.
data RelationalProfile probe probeMor rel = RelationalProfile
  { profileProbe     :: probe
  , profileRelations :: [rel]
  , profileAction    :: probeMor -> rel -> rel
  }

-- | Assemble the relational profile of a system against one probe. Executable
-- form of y(P)(R) = Hom(R, P) with its precomposition action along probe
-- morphisms; the action is the functorial transport of the presheaf.
yonedaProfile
  :: probe -> [rel] -> (probeMor -> rel -> rel) -> RelationalProfile probe probeMor rel
yonedaProfile p rs act = RelationalProfile p rs act

-- | Classical probe system of the paper's classical example: a compact
-- Hausdorff state space with commutative observable algebra C(X). The fields
-- are opaque identifiers; the instance declarations below record which family
-- data and which equivalence keys the system carries.
data CompactHausdorffSystem = CompactHausdorffSystem
  { chsSpace        :: String
  , chsObservables  :: String
  , chsDynamics     :: String
  , chsSymmetries   :: String
  , chsComposition  :: String
  , chsIsoKey       :: String
  , chsPhysicalKey  :: String
  }
  deriving (Eq, Show)

instance PhysicalSystem CompactHausdorffSystem where
  type StateSpace   CompactHausdorffSystem = String
  type Observables  CompactHausdorffSystem = String
  type Dynamics     CompactHausdorffSystem = String
  type Symmetries   CompactHausdorffSystem = String
  type Composition  CompactHausdorffSystem = String
  stateSpace  = chsSpace
  observables = chsObservables
  dynamics    = chsDynamics
  symmetries  = chsSymmetries
  composition = chsComposition

instance FamilySmoothGeometric CompactHausdorffSystem where
  type GeometricData CompactHausdorffSystem = String
  geometricData = chsSpace

instance FamilyHilbertOperatorAlgebras CompactHausdorffSystem where
  type OperatorAlgebraData CompactHausdorffSystem = String
  operatorAlgebraData = chsObservables

instance MathematicalEquivalence CompactHausdorffSystem where
  mathematicallyEquivalent a b = chsIsoKey a == chsIsoKey b

instance PhysicalEquivalence CompactHausdorffSystem where
  physicallyEquivalent a b = chsPhysicalKey a == chsPhysicalKey b

-- | Boolean probe system of the paper's finite Stone remark: a Boolean
-- algebra of probes with its Stone spectrum.
data BooleanAlgebraSystem = BooleanAlgebraSystem
  { basAlgebra      :: String
  , basSpectrum     :: String
  , basIsoKey       :: String
  , basPhysicalKey  :: String
  }
  deriving (Eq, Show)

instance PhysicalSystem BooleanAlgebraSystem where
  type StateSpace   BooleanAlgebraSystem = String
  type Observables  BooleanAlgebraSystem = String
  type Dynamics     BooleanAlgebraSystem = String
  type Symmetries   BooleanAlgebraSystem = String
  type Composition  BooleanAlgebraSystem = String
  stateSpace  = basSpectrum
  observables = basAlgebra
  dynamics    = const "none"
  symmetries  = const "none"
  composition = const "direct sum of clopen data"

instance FamilyDiscreteCombinatorial BooleanAlgebraSystem where
  type CombinatorialData BooleanAlgebraSystem = String
  combinatorialData = basAlgebra

instance MathematicalEquivalence BooleanAlgebraSystem where
  mathematicallyEquivalent a b = basIsoKey a == basIsoKey b

instance PhysicalEquivalence BooleanAlgebraSystem where
  physicallyEquivalent a b = basPhysicalKey a == basPhysicalKey b

-- | Finite-group representation system of the paper's fusion computation:

 succeeded in 0ms:

\begin{proof}
For the first claim take $\mathcal{C}$ with three objects $A, B, C$, no morphisms between distinct objects, and $\mathcal{R} = \{C\}$. Then $\Hom(C, A) = \Hom(C, B) = \varnothing$, so the restricted profiles of $A$ and $B$ agree, while $A \not\cong B$. For the second claim, full faithfulness of $y_{\mathcal{R}}$ means $\Hom(A, B) \cong \Nat(y_{\mathcal{R}}(A), y_{\mathcal{R}}(B))$ for all $A, B$, so a natural isomorphism of restricted profiles induces an isomorphism of objects exactly as in Corollary~\ref{cor:faithful}.
\end{proof}

Proposition~\ref{prop:restriction} makes the probe class part of the hypothesis. A profile computed on an arbitrary small probe class carries no more content than that class exposes, and the condition that the comparison be fully faithful is the standard density requirement on $\mathcal{R}$. Any physical claim about determination by probes must therefore state the probes.

\subsection{Composition of systems}
\label{sec:composition}

Physical systems compose, through tensor products, direct sums, and the other constructions that generate complex systems from simple ones. The behavior of relational profiles under composition is therefore a question the classification program cannot avoid.

\begin{proposition}[Profiles respect limits]
\label{prop:limits}
Let $\mathcal{C}$ be a locally small category in which a diagram $D$ has a limit $L = \lim D$. Then $y(L)$ is the limit of the diagram $y \circ D$ in $[\mathcal{C}^{\mathrm{op}}, \mathbf{Set}]$. In particular $y$ preserves terminal objects and binary products: $y(A \times B) \cong y(A) \times y(B)$ canonically whenever the product exists.
\end{proposition}

\begin{proof}
Limits of presheaves are computed pointwise, so for each probe $R$ one must show
\[
\Hom(R, \lim D) \cong \lim \Hom(R, D),
\]
which is the defining universal property of the limit applied to the probe $R$. For binary products the statement reads $\Hom(R, A \times B) \cong \Hom(R, A) \times \Hom(R, B)$, which is the universal property of the product.
\end{proof}

Tensor products behave differently. There is in general no canonical map relating $\Hom(R, P \otimes Q)$ to $\Hom(R, P) \otimes \Hom(R, Q)$, and the profile of a composite system is not assembled from the profiles of its factors by any universal construction available to the embedding. Determination of composites from relational data is therefore not a formal consequence of Yoneda; where it holds, it holds by a further theorem. The factorisation results of \cref{sec:supermap} are exactly such a theorem for the composition of processes under a causal-order hypothesis, and the decomposition theory of representation categories is such a theory for tensor structure. This asymmetry is a design fact of the relational program: limits are transparent to probes, monoidal composition is not.

\subsection{The classification question}
\label{sec:classification}

\begin{definition}[Classification by invariants]

\begin{remark}[Finite Stone duality]
\label{rem:finestone}
A finite instance makes the probe reading concrete. Let $X$ be a finite discrete space of $n$ points. Its clopen algebra is the full power set $2^X$, a Boolean algebra with $2^{n}$ elements, and the Stone space of $2^{X}$ is the set of ultrafilters, one per point of $X$, recovering $X$ exactly. The probes are the ultrafilters, equivalently the two-valued homomorphisms $2^X \to 2$, and the recovery is the statement that a finite set is determined by its maps into the two-element set. This is the smallest instance of Theorem~\ref{thm:stone}, and the experiment of \cref{sec:computation} computes its probe data directly.
\end{remark}

\section{Equivalence and preserved structure}
\label{sec:equivalence}

Relational data distinguishes objects up to isomorphism in the declared category. Which layers of structure that isomorphism preserves is not a bookkeeping question: there are theorems forbidding the naive answers.

\begin{theorem}[Etingof-Gelaki constraint]
\label{thm:eg}
There exist non-isomorphic finite groups $G$ and $H$ whose categories $\mathrm{Rep}(G)$ and $\mathrm{Rep}(H)$ of finite-dimensional complex representations are equivalent as monoidal categories, with the commutativity constraint ignored, while the symmetric structures of the two categories differ. A monoidal equivalence of representation categories therefore does not recover the group; the symmetric monoidal layer is required, and any identification that relies on the monoidal layer alone is provably insufficient.
\end{theorem}

\begin{proof}
The existence of such isocategorical groups is proved in \cite{eg}: the paper constructs non-isomorphic groups whose representation categories over $\mathbb{C}$ are equivalent as tensor categories without regard for the commutativity constraint, and records at the same time that symmetric tensor categories of representations do determine a finite group. The negative content for this series is that the monoidal layer is not enough.
\end{proof}

Theorem~\ref{thm:eg} is a constraint on every equivalence proposed in this series: any equivalence used to identify systems must state which layer of structure it preserves. The constraint reaches relational profiles directly.

The construction behind the theorem explains where the failure lives. Starting from a finite group $G$ and a suitable cohomological twist of the symmetry, one obtains non-isomorphic groups whose representation categories carry the same monoidal structure while the symmetric structure differs. The group data is therefore not readable from the monoidal layer even when that layer is read in full, and no choice of relational probes computed in a category of monoidal equivalences can recover it. This is the precise reason the declaration of preserved layers is mandatory rather than advisory.

\begin{proposition}[Preserved-layer discipline for profiles]
\label{prop:discipline}
Let $\mathcal{C}$ be a category of representations whose morphisms preserve a layer $L$ of structure and forget a layer $L'$. If $P \sim_{\mathrm{rel}} Q$ in $\mathcal{C}$, then $P$ and $Q$ are equivalent at layer $L$, and no claim about layer $L'$ follows. In particular, profiles computed in a category of monoidal equivalences that ignore the commutativity constraint cannot support identifications that require the symmetric layer, and every use of the relational profile must declare the layers its morphisms preserve.
\end{proposition}

\begin{proof}
By Corollary~\ref{cor:releq} relational equivalence is isomorphism in $\mathcal{C}$, which preserves exactly the structure the morphisms of $\mathcal{C}$ preserve. Theorem~\ref{thm:eg} exhibits non-isomorphic groups whose representation categories are equivalent as monoidal categories, so no inference about the forgotten symmetric layer is available from layer-$L$ equivalence alone. The declaration requirement is the same constraint applied to the morphisms of $\mathcal{C}$.
\end{proof}

\begin{corollary}[Constraint inheritance]
\label{cor:inherit}
The Yoneda embedding does not weaken the structure-preserving requirement on equivalences. Every relational identification inherits, through its morphisms, the preserved-layer declaration of the equivalence notion in force; a profile computed for one declaration is not evidence for an identification requiring another.
\end{corollary}

\begin{proof}
Proposition~\ref{prop:discipline} with $L$ and $L'$ read as the declared and forgotten layers.
\end{proof}

A computable shadow sits two decategorification steps below Theorem~\ref{thm:eg}: the fusion ring of a representation category. Let $\mathrm{Rep}(G)$ have irreducible objects $V_1, \dots, V_r$ with fusion multiplicities $N_{ij}^{k}$ defined by $V_i \otimes V_j \cong \bigoplus_k N_{ij}^{k} V_k$. The resulting fusion ring records only the tensor multiplicities, not the associator of the monoidal category.

\begin{table}[t]
\centering
\small
\caption{Layers of structure an identification may preserve, and what each layer recovers. The second row is the content of the Etingof-Gelaki constraint: the monoidal layer loses the group.}
\label{tab:layers}
\begin{tabular}{@{} L{4.6cm} L{5.2cm} L{4.4cm} @{}}
\toprule
Layer & Recovers & Status \\
\midrule
Symmetric monoidal & The finite group of a representation category & Sufficient for finite groups \\
Monoidal (tensor) & Tensor structure without the commutativity constraint & Provably insufficient for the group \\
Fusion ring & Fusion multiplicities and dimensions only & Insufficient (Proposition~\ref{prop:fusion}) \\
Algebraic and $*$-structure & The operator-algebraic presentation & Independent of the tensor layers \\
\bottomrule
\end{tabular}
\end{table}

\begin{proposition}[Fusion rings of two groups of order eight]
\label{prop:fusion}
Let $D_8$ be the dihedral group of order eight and $Q_8$ the quaternion group. Their character tables and their representation fusion rings are isomorphic, and the groups are not isomorphic. Fusion-ring data therefore does not determine the group.
\end{proposition}

\begin{proof}
Each group has four one-dimensional irreducible representations and one two-dimensional representation $V$, and the conjugacy classes have sizes $1, 1, 2, 2, 2$ in both cases. Table~\ref{tab:characters} records the character tables; they coincide after matching the central involution $r^2$ of $D_8$ with $-1 \in Q_8$ and the three classes of size two in order. In both cases the one-dimensional representations form the character group of the abelianization $\mathbb{Z}/2 \times \mathbb{Z}/2$, so their fusion is the group law of $\mathbb{Z}/2 \times \mathbb{Z}/2$ in both cases. In both cases $V \otimes V$ is the sum of the four one-dimensional representations: the character computation gives $\chi_{V \otimes V} = \chi_V^2$, which has inner product one with each linear character and zero with $V$. Finally $V \otimes \chi \cong V$ for every linear $\chi$ in both cases. The fusion rings are therefore isomorphic. The groups are not isomorphic: $D_8$ has elements of order two outside its center, while every element of $Q_8$ outside the center has order four.
\end{proof}

\begin{table}[t]

codex
ROW 1 | Taxonomy instances for four systems | SUPPORTS | Instances.hs declares taxonomy and equivalence instances for all four system types.
ROW 2 | Relational profile is executable data | SUPPORTS | yonedaProfile constructs a record containing a probe, relationships, and an executable action.
ROW 3 | Choi matrix computable from Kraus data | PARTIAL | applyChannel initializes its accumulator with input dimensions, truncating outputs and corrupting Choi matrices when output dimension exceeds input dimension.
ROW 4 | Profile bijection on the test category | PARTIAL | check_yoneda_bijection verifies the evaluation bijection for six of the category’s nine ordered object pairs.
ROW 5 | Distinct objects have distinct profiles | SUPPORTS | check_faithfulness compares every distinct object pair, whose profiles differ in component cardinalities.
ROW 6 | Finite Stone space recovers the set | PARTIAL | check_stone_finite recovers points from constructed principal filters but does not establish that these exhaust the ultrafilters.
ROW 7 | Choi bijection and positivity | PARTIAL | check_choi_bijection tests reconstruction and positivity for one sampled channel without testing the reverse correspondence from arbitrary positive Choi matrices.
ROW 8 | Composition as index contraction | SUPPORTS | check_composition compares explicit Choi index contraction with the Choi matrix computed from composed Kraus operators.
ROW 9 | Fusion rings of D8 and Q8 agree | SUPPORTS | check_fusion_ring_iso computes character inner-product multiplicities for both groups and compares their full multiplication tables.
ROW 10 | D8 and Q8 are non-isomorphic | SUPPORTS | check_groups_distinct computes different element-order distributions, which preclude a group isomorphism.
VERDICT: NEEDS_FIX
hook: Stop
hook: Stop Completed
tokens used
45,900
ROW 1 | Taxonomy instances for four systems | SUPPORTS | Instances.hs declares taxonomy and equivalence instances for all four system types.
ROW 2 | Relational profile is executable data | SUPPORTS | yonedaProfile constructs a record containing a probe, relationships, and an executable action.
ROW 3 | Choi matrix computable from Kraus data | PARTIAL | applyChannel initializes its accumulator with input dimensions, truncating outputs and corrupting Choi matrices when output dimension exceeds input dimension.
ROW 4 | Profile bijection on the test category | PARTIAL | check_yoneda_bijection verifies the evaluation bijection for six of the category’s nine ordered object pairs.
ROW 5 | Distinct objects have distinct profiles | SUPPORTS | check_faithfulness compares every distinct object pair, whose profiles differ in component cardinalities.
ROW 6 | Finite Stone space recovers the set | PARTIAL | check_stone_finite recovers points from constructed principal filters but does not establish that these exhaust the ultrafilters.
ROW 7 | Choi bijection and positivity | PARTIAL | check_choi_bijection tests reconstruction and positivity for one sampled channel without testing the reverse correspondence from arbitrary positive Choi matrices.
ROW 8 | Composition as index contraction | SUPPORTS | check_composition compares explicit Choi index contraction with the Choi matrix computed from composed Kraus operators.
ROW 9 | Fusion rings of D8 and Q8 agree | SUPPORTS | check_fusion_ring_iso computes character inner-product multiplicities for both groups and compares their full multiplication tables.
ROW 10 | D8 and Q8 are non-isomorphic | SUPPORTS | check_groups_distinct computes different element-order distributions, which preclude a group isomorphism.
VERDICT: NEEDS_FIX
