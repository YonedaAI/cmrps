---
reviewer: codex (OpenAI) gpt-6.1-sol
type: code-audit
paper: vol-02-structural-families
round: 2
date: 2026-10-30T05:06:23Z
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
session id: 01a18b33-b204-7fe0-a17f-ce0a6d9dcf57
--------
user
Read papers/latex/vol-02-structural-families.tex and ONLY the files under src/vol-02-structural-families/ that its code evidence appendix names. Round 1 marked ROW 1 PARTIAL because the Kraus rank was hardcoded; the script has since been changed so that kraus_rank() computes the dimension of the linear span of the Kraus operators by Gaussian elimination, and the experiment calls it on each sampled channel. For EVERY row of the appendix output one line: ROW <n> | <claim, 10 words max> | SUPPORTS | PARTIAL | NO | <one-sentence reason>. End with VERDICT: PASS if every row is SUPPORTS, else VERDICT: NEEDS_FIX.
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
I’ll read the appendix and only the source files it names, then assess each row against that evidence.
exec
/usr/local/bin/zsh -lc 'cat papers/latex/vol-02-structural-families.tex' in /Users/mlong/Documents/Development/classification-physical-systems
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

\title{Fundamental Structural Families of Mathematical Physics\\[4pt]
  {\normalsize Part 2 of \emph{The Classification of Mathematical Representations of Physical Systems}}}
\author{Matthew Long\\
  \small The YonedaAI Collaboration, YonedaAI Research Collective\\
  \small Chicago, Illinois, USA\\
  \small \texttt{mlong@yonedalabs.ai}\\
  \small \url{https://yonedalabs.ai}}
\date{October 2026}

\begin{document}
\maketitle

\begin{abstract}
This paper develops the family-level taxonomy that a classification of mathematical representations of physical systems requires. Ten structural families organize mathematical structures capable of representing physical systems: symplectic and Poisson structures, Hilbert spaces and operator algebras, smooth manifolds and geometric structures, principal bundles and connections, probability and measure-theoretic structures, topological and higher-categorical structures, dynamical systems and operator semigroups, tensor categories and compositional structures, discrete combinatorial structures, and derived and homotopical structures. Each family is presented with its defining invariant, its classified islands, and its recorded obstructions. Four results govern how the taxonomy may be used. A sharpness criterion shows that a family admits a classification of a prescribed shape only when its classifying invariant takes values in a set of matching cardinality or geometric structure. A globality proposition shows that no local invariant classifies inside the symplectic family. A non-closure proposition shows that a class of objects irreducible under direct sum is not itself closed under direct sum. An independence proposition shows that two families may each carry a classifying invariant and still fail to be logically independent. The ten families are candidates for an organizing taxonomy and not a completed classification, and no completeness claim is made for them.
\end{abstract}

\section{Introduction}

The classification of finite simple groups supplies the architectural analogy for this program: complicated structures understood through simpler constituents, gathered into families, with a short list of exceptions recorded beside them \cite{cfsg,solomon}. The analogy is instructive and it is also incomplete. The template program is complete and a uniform description analogous to the Dynkin diagrams is missing from it: the assessment attributed to Gorenstein that ``no one has yet found a clean uniform description of the finite simple groups'' is recorded in the survey literature \cite{cfsg,solomon}. Classification and parameterization are separate achievements, and the template program has achieved the first without the second.

This paper works at the level where that distinction bites first. Before any volume can classify physical systems, it needs a vocabulary of the mathematical families capable of representing them, a record of what is classified inside each family, and a discipline for choosing the data that identification actually runs on. Those are the three deliverables here. The families are recorded as candidates, their classified islands and their obstructions are recorded with the status the literature supports, and the invariant discipline is stated as a set of definitions and results that later volumes can instantiate.

Four results carry the argument. \Cref{thm:sharpness} bounds the shape of any classification by the shape of the classifying invariant: a family whose invariant takes values in a finite set has finitely many classes, a family with uncountably many classes admits no invariant into a countable set, and a family whose classes are the image of a morphism of finite type is parameterized by a constructible set. \Cref{prop:globality} shows that inside the symplectic family every local invariant is constant, so classification content there is global and topological. \Cref{prop:closure} shows that a class of objects irreducible under direct sum is never closed under direct sum, so passing to a closure always adds objects. \Cref{prop:independence} shows that two families may both carry classifying invariants and still fail to be logically independent.

\Cref{sec:defs} fixes notation and the record structures. \Cref{sec:discipline} states the invariant discipline and the sharpness criterion. The ten families are treated in turn across \Cref{sec:family1} to \Cref{sec:family10}. \Cref{sec:exceptional} treats simple objects and their failure to close. \Cref{sec:independence} treats independence and reconstructability. \Cref{sec:limitations} records what the taxonomy cannot support. \Cref{sec:conclusion} concludes. An appendix records the computational evidence and where it lives.

\section{Definitions and notation}
\label{sec:defs}

The ontology of the series fixes the ambient vocabulary. An object of the category of representations of physical systems is a record $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ carrying a state space or geometric structure, an observable algebra or collection, dynamical laws, symmetry and constraint data, and composition or interaction rules. The five components need not be independent. The record is a candidate definition and not a theorem: a universally accepted mathematical definition of every possible physical system does not exist, and establishing one is the first major research problem of the program. Part 1 of this series fixes the vocabulary reused here.

\begin{definition}[Morphism of records]
\label{def:morphism}
A \emph{morphism} $f \colon P_1 \to P_2$ of records is a tuple of maps, one per component, that are compatible with the stated composition rules of the two records. The classes of morphism in force below are exact equivalence (invertible), coarse-graining (forgetting microscopic detail while preserving named macroscopic observables), embedding (realizing $P_1$ inside $P_2$), duality (invertible only after passage to an appropriate opposite category), and limiting procedure. \emph{Status: stipulative}. A single ambient category for all five classes is not established, and the preservation laws under which two morphisms of a given class compose are open. Until those laws are fixed, the record is a schema rather than a category, and every statement below names the morphism class it uses.
\end{definition}

Two equivalence relations run through the paper. Mathematical equivalence is isomorphism of the record in the ambient category of each component. Physical equivalence, written $\simeq$, is a chosen equivalence relation on objects and is strictly coarser in general. Two mathematical descriptions may be physically equivalent without being mathematically isomorphic. Every classification statement below fixes which relation is in force.

\begin{definition}[Family record]
\label{def:family-record}
A \emph{family record} is a triple $(\mathfrak{F}, V, I)$ where $\mathfrak{F}$ is a full subcategory of the category of representations, $V$ is a set called the \emph{invariant range}, and $I \colon \mathrm{Ob}(\mathfrak{F}) \to V$ is a map that is constant on $\simeq$-classes. The map $I$ is a \emph{classifying invariant} for the record when it is complete: $I(P) = I(Q)$ implies $P \simeq Q$.
\end{definition}

\begin{definition}[Invariant-complete sector]
\label{def:sector}
A family record is \emph{invariant-complete} when its invariant is classifying in the sense of \Cref{def:family-record}. A \emph{sector} of a family is a full subcategory of it. A sector is invariant-complete when the restricted record is.
\end{definition}

\begin{definition}[Structural family]
\label{def:structural-family}
A \emph{structural family} is a family record $(\mathfrak{F}, V, I)$ whose objects are singled out by the mathematical structure of their state space, observable algebra, or both. The families are defined by the structure each one singles out and not by a partition of records, so a record whose components carry structure of several kinds belongs to each of the corresponding families. A structural family is \emph{fundamental} for a class of physical systems when every object in that class lies in the closure of the family under the admissible constructions. The admissible constructions are tensor product, direct sum, extension, limits and colimits, factorization, and quotient or symmetry reduction.
\end{definition}

The closure of a collection $\mathfrak{G}$ under a set of constructions $\mathcal{K}$ is the smallest class containing $\mathfrak{G}$ and closed under $\mathcal{K}$, written $\langle \mathfrak{G} \rangle_{\mathcal{K}}$. The long-term target of the program is the identity $\mathrm{Phys}_{\mathrm{adm}} \simeq \langle \mathfrak{F}_1, \dots, \mathfrak{F}_n \rangle_{\mathcal{K}}$ between the class of admissible physical systems and the closure of a finite family list. That identity is a research objective. No result below assumes it.

\subsection{The five components and the invariant record}
\label{sec:components}

The object record has five components and the invariant record has five slots. They are not the same list, and the correspondence between them is a choice that each family record has to make.

\begin{proposition}[Component invariants are not classifying in general]
\label{prop:components}
Let $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ be a record and let each of the five components carry its own invariant data. Then the tuple of the five component invariants need not be a classifying invariant for $P$.
\end{proposition}

\begin{proof}
The five component invariants record each component in isolation and record nothing about how the components are coupled. Two records may therefore share all five component invariants and still differ. As a concrete case, take $\mathcal{O} = M_2(\mathbb{C})$ and $\mathcal{S} = \mathbb{Z}/2$, and let $\mathcal{S}$ act on $\mathcal{O}$ either trivially or by conjugation with $\mathrm{diag}(1,-1)$. The algebra is the same and the group is the same, so the component invariants of $\mathcal{O}$ and $\mathcal{S}$ agree, and the two records are not isomorphic as records because the actions differ. The tuple of component invariants misses the coupling between components and cannot be classifying in general.
\end{proof}

\Cref{prop:components} is a caution about assembling a classification from parts. It is not a claim that no decomposition of a classification exists; it is a claim that the obvious decomposition of the record into five independent invariants does not produce one.

\begin{remark}[Status discipline]
\label{rem:status}
Results drawn from the literature are attributed to their sources and stated with the scope their sources establish. Results proved here are proved in full. Conjectural relationships are named as conjectural. Nothing in this paper is machine checked, and no claim of machine checking is made anywhere in the series.
\end{remark}

\section{The invariant discipline}
\label{sec:discipline}

Identification in a classified domain runs on a small amount of named data. The atlas of finite groups identifies a group by its order, its Schur multiplier, its outer automorphism group, a presentation, and a character table with power maps \cite{atlas}. The Killing-Cartan classification identifies a complex semisimple Lie algebra by its Dynkin diagram \cite{lie}. The highest weight theorem identifies a finite-dimensional irreducible representation by a dominant integral weight \cite{hw}. Finite-dimensional unital complex $C^*$-algebras are identified by a dimension vector \cite{calg}. Principal bundles are identified by a homotopy class of maps into a classifying space together with characteristic classes \cite{classifying-space,charclass}. In every case the classifying data is finite or parametric, and classification is sharp exactly where that holds \cite{cfsg,lie,hw,darboux,calg,classifying-space}.

\begin{definition}[Invariant record]
\label{def:invariant-record}
The \emph{structural invariant record} of a theory $T$ is the tuple $\mathcal{I}(T) = (\mathcal{S}_T, \mathcal{O}_T, \mathcal{D}_T, \mathcal{G}_T, \mathcal{R}_T)$ describing state invariants, observable invariants, dynamics invariants, symmetry invariants, and representation invariants. \Cref{prop:components} applies to this tuple as much as it applies to the raw component data: five slots, each recording one component, still record nothing about how the components are coupled. The invariant record is therefore a catalogue of the data a classification would have to determine and not itself a classifying invariant. A classifying invariant is one of the named data types whose value determines the object up to the chosen equivalence.
\end{definition}

The discipline has three parts. First, a family record names one classifying invariant and one invariant range, and states the equivalence the invariant is complete for. Second, the record states the scope in which completeness holds, because completeness outside scope is false. Third, when a family has no complete invariant on record, the record says so instead of inventing one. The family tables below apply this discipline row by row, and each row states its scope limit in its last column.

\subsection{Sharpness of classifying invariants}
\label{sec:sharpness}

Classification is sharp where the invariant is finite or parametric, and the quantitative form of that observation is the following.

\begin{theorem}[Sharpness criterion]
\label{thm:sharpness}
Let $(\mathfrak{F}, V, I)$ be an invariant-complete family record and write $\mathfrak{F}/\!\simeq$ for the set of $\simeq$-classes.
\begin{enumerate}
\item The assignment $[P] \mapsto I(P)$ is a well-defined injection $\mathfrak{F}/\!\simeq \hookrightarrow V$.
\item If $V$ is finite with $|V| = N$, then $|\mathfrak{F}/\!\simeq| \leq N$.
\item Suppose in addition that $V$ carries the structure of a variety over an algebraically closed field $k$, that $W$ is a $k$-variety, and that $f \colon W \to V$ is a morphism of finite type whose image $f(W(k))$ contains every attained value of $I$. Then the attained values of $I$ form a constructible subset of $V$, and $\mathfrak{F}/\!\simeq$ injects into it. The content of the claim is the constructibility, which is a parameterization statement; the injectivity is part (1) and is not what this part adds.
\item If $\mathfrak{F}/\!\simeq$ is uncountable, then no invariant-complete record for $\mathfrak{F}$ has countable range.
\end{enumerate}
\end{theorem}

\begin{proof}
For the first claim, $I$ is constant on $\simeq$-classes, so the assignment is well defined on classes, and completeness gives injectivity. The second claim is the cardinality of a subset of a finite set. For the third claim, Chevalley's theorem states that the image of a morphism of finite type between varieties over an algebraically closed field is constructible. The hypothesis places the attained values of $I$ inside $f(W(k))$, so they form a subset of a constructible set and the classes inject into that subset by part (1). What the hypothesis buys is not the injectivity but the geometry: the classes are then described by the points of an explicitly constructible set, which is the parameterization that part (3) claims. No identification of $V$ with the set of its $k$-points is being made: the invariant $I$ is a map of sets in general, and part (3) is the case in which its range happens to carry a variety structure and its attained values happen to lie in the image of a finite-type morphism. The fourth claim is the contrapositive of the first: an injection from an uncountable set into a countable set does not exist.
\end{proof}

\begin{corollary}[Parameterization is a stronger achievement]
\label{cor:parameterization}
A family with a finite invariant range is classified into finitely many classes, and a family is parameterized only when its attained values form a constructible or otherwise explicitly described subset of a structured range. Classification and parameterization are separate achievements.
\end{corollary}

\Cref{cor:parameterization} recovers the template program's own situation in the form that applies to it. The finite simple groups have infinitely many isomorphism classes, so no finite invariant range classifies them; they are classified, and a uniform parameterization analogous to Dynkin diagrams is missing \cite{cfsg,solomon}. Practical identification there runs through the atlas data instead \cite{atlas}, which is a recognition procedure in the sense of \Cref{prop:recognition-cost} and not a parameterization.

\subsection{Locality of invariants}
\label{sec:locality}

Classification content can be entirely global.

\begin{proposition}[Globality of classification in the symplectic family]
\label{prop:globality}
Let $(M, \omega)$ and $(N, \eta)$ be symplectic manifolds of the same dimension $2n$ with $n \geq 1$. Let $f$ assign a value to every symplectic germ and be invariant under symplectomorphism of germs. Then $f$ takes the same value at every point of $M$ and at every point of $N$. Consequently no invariant defined on germs and constant on each connected component is classifying for the symplectic family at fixed dimension $2n$, and every classifying invariant for that family is global.
\end{proposition}

\begin{proof}
By Darboux's theorem, every symplectic germ of dimension $2n$ is symplectomorphic to the standard germ $(\mathbb{R}^{2n}, \omega_0)$ \cite{darboux}. The hypothesis $n \geq 1$ is needed: at $n = 0$ the manifold is a disjoint union of points and a constant invariant does classify it, and the dimension itself is a local germ invariant once dimensions are allowed to vary. Invariance under symplectomorphism forces $f$ to be constant on the orbit of germs, and that orbit is the whole set of $2n$-dimensional germs. So $f$ is constant at every point of $M$ and of $N$, and it cannot distinguish them. A classifying invariant must distinguish objects that are not equivalent, so it cannot be local.
\end{proof}

\begin{corollary}
\label{cor:topological}
Classifying data for the symplectic family is topological or global in character. This reverses the Riemannian situation, in which local curvature invariants do classifying work.
\end{corollary}

\Cref{prop:globality} is the reason the symplectic row of the family tables below reads ``complete locally, with no local invariants''. Completeness of the local classification is a theorem, and its content is that there is nothing local to compute.

\subsection{Achievement kinds for classified sectors}
\label{sec:kinds}

The recorded results fall into a small number of shapes, and distinguishing the shapes keeps the family tables from flattening a proof into a status word.

\begin{definition}[Achievement kind]
\label{def:kinds}
Let $\mathcal{S}$ be a sector together with a statement of what is classified and up to which equivalence. Three conditions attach to $\mathcal{S}$ and together determine its \emph{achievement kind}. The first is whether a theorem on record names a classifying invariant for $\mathcal{S}$; this is an epistemic condition about the literature and not a claim that no set-theoretic invariant exists, since the assignment sending an object to its own equivalence class is always a classifying invariant of sets. The second is what a recorded classification classifies: existing objects, or obstructions to the existence of objects. The third, available only when the first two conditions name objects, is whether the attained values of the invariant form an explicitly described subset of a structured range. The resulting kinds are: \emph{complete and parameterized}, \emph{complete and unparameterized}, \emph{complete as an obstruction classification}, \emph{impossible}, and \emph{no record}. A sector is \emph{impossible} when a theorem on record proves that no classifying invariant of the prescribed type into a set of the required cardinality exists. A sector has \emph{no record} when no theorem names a classifying invariant and no impossibility theorem is on record.
\end{definition}

\begin{proposition}[The kinds are exhaustive]
\label{prop:kinds}
For any sector $\mathcal{S}$ exactly one of the five achievement kinds of \Cref{def:kinds} applies, and the five are pairwise exclusive and exhaustive.
\end{proposition}

\begin{proof}
The three conditions of \Cref{def:kinds} are tested in order. If no theorem on record names a classifying invariant and no impossibility theorem is on record, the kind is no record, and no other kind applies since the others all presuppose one of the two kinds of record. If an impossibility theorem is on record, the kind is impossible, and no other kind applies. If a theorem names a classification and the classified target is the obstructions, the kind is complete as an obstruction classification. If it names a classification of objects, the attained values either form an explicitly described subset of a structured range or they do not, which is exactly the remaining pair. The tests are disjoint at each stage and cover every case at each stage, so one and only one kind applies.
\end{proof}

The five kinds are realized in the families below. The Killing-Cartan and highest weight classifications are complete and parameterized \cite{lie,hw}. The finite simple groups are classified and not uniformly parameterized \cite{cfsg,solomon}. Anomalies are classified as obstructions to quantization \cite{anomaly}. General separable type $\mathrm{II}_1$ factors are impossible to classify \cite{vnalg}. Sectors with no record at all, such as the semigroup family, realize the fifth kind, and \Cref{prop:kinds} accounts for them rather than excluding them.

\begin{table}[ht]
\centering
\small
\caption{Achievement kinds realized inside the ten families. A family occupies more than one row when its sectors differ.}
\label{tab:kinds}
\begin{tabularx}{\textwidth}{L{0.27\textwidth} L{0.26\textwidth} X}
\toprule
Kind & Realized in & Invariant range \\
\midrule
Complete and parameterized & Complex semisimple Lie algebras \cite{lie}, finite-dimensional irreducible representations \cite{hw}, finite-dimensional $C^*$-algebras \cite{calg} & Dynkin diagram, dominant integral weight, dimension vector \\
Complete and unparameterized & Finite simple groups \cite{cfsg,solomon} & Atlas data, with no uniform description \\
Complete as obstruction classification & Anomalies in gauge theories \cite{anomaly} & Cohomological obstruction classes whose vanishing is required \\
Impossible & General separable type $\mathrm{II}_1$ factors \cite{vnalg} & No range of the required cardinality exists \\
No record & Completely positive maps up to isomorphism \cite{stinespring,qchannel} & The normal form is not an isomorphism classification \\
\bottomrule
\end{tabularx}
\end{table}

The table makes two points that a status token would hide. A single family can occupy several kinds at once, because its sectors differ in cardinality and in what is classified. And the absence of a record is not the same as impossibility, since an impossibility is a theorem and an absence is a gap.

\section{Worked family records}
\label{sec:worked}

Three family records apply the discipline of \Cref{sec:discipline}. Each names the invariant data it supplies, the equivalence in force, and the scope in which the data is complete; where a field is absent the record says so.

\subsection{A cotangent bundle in the symplectic family}
\label{sec:cotangent}

Let $Q$ be a smooth manifold and $M = T^*Q$ with its canonical symplectic form $\omega = d\theta$, where $\theta$ is the tautological one-form. The record is: state space $M$, observables $C^\infty(M)$, dynamics the Hamiltonian flow of a smooth function $H$, symmetries the cotangent lifts of diffeomorphisms of $Q$ preserving $H$, and composition the product of systems with the product symplectic form.

Local data is empty by \Cref{prop:globality}. The equivalence in force is symplectomorphism of the total space. The record supplies a global invariant and not a classifying one, and it says so.

\begin{proposition}[Global invariants of a cotangent bundle]
\label{prop:cotangent}
The zero section of $T^*Q$ is a deformation retract of $T^*Q$. Consequently the homotopy type of the symplectic manifold $T^*Q$ equals the homotopy type of $Q$, and every homotopy invariant of $Q$ is a global invariant of the symplectic record.
\end{proposition}

\begin{proof}
The maps $r_t \colon T^*Q \to T^*Q$ given by $r_t(x, \xi) = (x, t\xi)$ for $t \in [0,1]$ form a deformation retraction: each $r_t$ is smooth, $r_1$ is the identity, $r_0$ factors through the zero section, and $r_s \circ r_t = r_{st}$ for $s, t \in [0,1]$. The zero section is diffeomorphic to $Q$, so $T^*Q$ and $Q$ are homotopy equivalent and share all homotopy invariants.
\end{proof}

\Cref{prop:cotangent} supplies an invariant and not a complete one. Two homotopy-equivalent bases need not have symplectomorphic cotangent bundles, and the record also carries the Hamiltonian $H$, which the homotopy type does not see. The scope of the record is therefore the homotopy data of the base, and the record does not claim more.

\subsection{A finite-dimensional quantum system}
\label{sec:worked-calg}

Take $A = M_2(\mathbb{C}) \oplus \mathbb{C}$, the observable algebra of a two-level system together with a classical bit. The record is: state space the space of block-diagonal density matrices $\rho_2 \oplus p$, observables $A$, dynamics a one-parameter group of $*$-automorphisms, symmetries the unitary group of $A$ acting by conjugation, and composition the tensor product of algebras. The state space is the state space of $A$ and not of $M_3(\mathbb{C})$, because the states of a direct sum are pairs of states of the summands.

By \Cref{thm:calg} the classifying invariant of the observable algebra is the dimension vector, here the multiset $\{2, 1\}$ of matrix sizes. That invariant classifies the algebra and not the full record, which also carries dynamics and composition data, as \Cref{prop:components} records. The invariant range at total complex dimension five is the set of multisets of positive integers whose squares sum to five, and there are two of them: $\{2, 1\}$ from $4 + 1$, and $\{1, 1, 1, 1, 1\}$ from five copies of $1$. At total dimension four there are two classes as well, given by $\{2\}$ and $\{1, 1, 1, 1\}$. The count of classes grows with the dimension, and \Cref{thm:sharpness} bounds it by the size of the range.

\subsection{Line bundles over the two-sphere}
\label{sec:worked-bundle}

Let $G = U(1)$ and let the base be $X = S^2$. The record is: state space the space of connections on a principal $U(1)$-bundle, observables the gauge-invariant functionals, dynamics the parallel transport of a chosen connection, symmetries the gauge group, and composition the tensor product of bundles.

By \Cref{thm:bundles} the classifying invariant of the underlying topological bundle is the first Chern class, which takes values in $H^2(S^2; \mathbb{Z}) \cong \mathbb{Z}$. The invariant range is countably infinite and every integer is attained, so the topological sector is classified and not finite. It is an instance of the distinction in \Cref{cor:parameterization}: the classification is complete, and the range is an explicit discrete group in which the attained values are described. The invariant classifies the bundle and not the space of connections on it, which is an affine space and carries no such discrete invariant.

\subsection{Constructions acting on invariants}
\label{sec:constructions-on-invariants}

A family record does not automatically extend to the closure of its family, because the constructions move the invariant. The finite-dimensional operator-algebra sector makes this concrete.

\begin{proposition}[Induced operations on the dimension vector]
\label{prop:induced}
Let $A$ and $B$ be unital finite-dimensional complex $C^*$-algebras with dimension vectors $\{n_1, \dots, n_k\}$ and $\{m_1, \dots, m_l\}$. Then the dimension vector of $A \oplus B$ is the multiset union $\{n_1, \dots, n_k, m_1, \dots, m_l\}$, and the dimension vector of $A \otimes B$ is the multiset $\{n_i m_j \colon 1 \leq i \leq k,\ 1 \leq j \leq l\}$. Consequently the range of the classifying invariant of \Cref{thm:calg} is closed under these two operations, and the invariant record of a composite system is computed from the records of the summands.
\end{proposition}

\begin{proof}
The Wedderburn decomposition of a direct sum of semisimple algebras is the multiset union of the Wedderburn decompositions of the summands, so the matrix sizes add in the multiset sense. For the tensor product, $M_a(\mathbb{C}) \otimes M_b(\mathbb{C}) \cong M_{ab}(\mathbb{C})$ by the standard identification of the tensor product of matrix algebras, and tensor product distributes over direct sums in both variables. Collecting the simple summands of $A \otimes B$ gives exactly the multiset of products $n_i m_j$. Both constructions therefore compute a new classifying invariant from the old ones without reference to any other data.
\end{proof}

\Cref{prop:induced} is the sense in which a classifying invariant can be functorial for the admissible constructions. It also marks a limit: the same computation in a sector where no classifying invariant is on record cannot be carried out, and the closure of such a sector is unrecorded.

\section{Morphisms and invariants}
\label{sec:morphisms}

The invariant discipline has to say what happens when two records are related by a morphism rather than an equivalence. The ontology distinguishes coarse-graining, equivalence, embedding, duality, and limiting procedures, and the invariant does not behave the same way along all five.

\begin{proposition}[Invariance under equivalence only]
\label{prop:invariance}
Let $(\mathfrak{F}, V, I)$ be a family record and let $f \colon P \to Q$ be an invertible morphism representing exact equivalence. Then $I(P) = I(Q)$. The conclusion fails for coarse-grainings and for embeddings in general.
\end{proposition}

\begin{proof}
The first claim is the defining condition of \Cref{def:family-record}: $I$ is constant on $\simeq$-classes, and an invertible equivalence morphism places $P$ and $Q$ in one class. For the negative claim, a coarse-graining forgets microscopic detail, and two systems that coarse-grain to the same macroscopic record need not be equivalent. The dimension vector of \Cref{thm:calg} is a classifying invariant only for the finite-dimensional algebra itself; the same observable algebra can carry inequivalent states and dynamics, so coarse-grained records identify objects that $I$ separates. An embedding places $P$ inside a larger system, and the invariant of the larger system is computed by \Cref{prop:induced} and not inherited from $P$.
\end{proof}

\begin{remark}[Dualities]
\label{rem:duality}
A duality is generally invertible only after passage to an appropriate opposite or dual category, and it must state which structure it preserves. The Gelfand correspondence of Table~\ref{tab:independence} is an anti-equivalence, and it identifies invariant records on the two sides up to the stated opposition. A duality that does not name the preserved structure cannot be used to transfer a classification, for the reason given in \Cref{thm:etingof-gelaki}.
\end{remark}

\begin{remark}[Limiting procedures]
\label{rem:limits}
A limiting procedure produces a new object, and the invariant of the limit is not in general the limit of the invariants. Continuum limits are the load-bearing case: results proved on a lattice in a restricted regime do not by themselves close the continuum limit, and the invariant record of the limiting object must be established on its own terms.
\end{remark}

\subsection{Recognition data}
\label{sec:recognition}

The atlas discipline separates three tasks that are easy to conflate \cite{atlas}. Parameterization is an explicit uniform description of the classes. Classification is an exhaustive list. Recognition is an algorithm that identifies which class a given object lies in, by computing its invariant and comparing.

\begin{proposition}[Recognition cost]
\label{prop:recognition-cost}
Let $(\mathfrak{F}, V, I)$ be an invariant-complete family record with $V$ a set carrying decidable equality, and assume $I(P)$ is computable from a finite presentation of $P$. Recognition of the class of $P \in \mathfrak{F}$ reduces to computing $I(P)$ and comparing it with the recorded values, and it costs at most one invariant computation plus one comparison per candidate class. If in addition the list of attained values is finite and stored, recognition is an algorithm.
\end{proposition}

\begin{proof}
Injectivity of $[P] \mapsto I(P)$ from \Cref{thm:sharpness} gives that $I(P)$ determines the class. The procedure computes $I(P)$ from the presentation of $P$, which the hypothesis makes possible, and looks the value up in the stored list. Decidable equality decides the comparison. The cost claim is the cost of the two steps. The computability hypothesis is doing real work: decidable equality on a finite range does not make the map $I$ computable, and without the hypothesis the procedure is not defined on presentations at all.
\end{proof}

Recognition is therefore the weakest of the three tasks when the invariant is computable, and it is the one the atlas supplies in practice \cite{atlas}. Parameterization is the strongest. The three are separate achievements, and a family row that reports one of them does not report the others.

\section{Family I: symplectic and Poisson structures}
\label{sec:family1}

This family singles out classical mechanics. Its defining structural data is a symplectic or Poisson state space; systems in it carry function algebras of observables and Hamiltonian dynamics \cite{poisson}. A record whose state space is symplectic belongs to this family whatever else its components carry.

The local picture is closed. Darboux's theorem gives a normal form and \Cref{prop:globality} extracts its classification consequence. For Poisson manifolds the local picture is also closed and it is not empty: near a point of rank $2k$ a Poisson manifold splits as a symplectic factor times a transverse Poisson factor \cite{poisson}. The symplectic leaves foliate the manifold, and on the dual of a Lie algebra the leaves of the Kirillov-Kostant-Souriau structure are the coadjoint orbits \cite{poisson}.

\begin{theorem}[Poisson local models]
\label{thm:weinstein}
Near a point of rank $2k$ a Poisson manifold is locally isomorphic to a product of a symplectic manifold of dimension $2k$ and a Poisson manifold whose linearization vanishes at the point \cite{weinstein}. The symplectic leaves form a foliation, and two Poisson manifolds with isomorphic local models need not be globally isomorphic.
\end{theorem}

The global picture is where the family's classification content lives, and the corpus does not fix a list of global invariants. Candidates in ordinary use are the de Rham class of the symplectic form, Chern classes of compatible almost complex structures, and flux data. The periodic chart records ``topology of $\omega$'' for this row. Making that phrase precise is an open deliverable.

The link from this family to the operator-algebra family through deformation quantization is a research program and not an equivalence theorem. No result below depends on it.

\section{Family II: Hilbert spaces and operator algebras}
\label{sec:family2}

This family singles out quantum mechanics. Its defining structural data is a $C^*$-algebra or von Neumann algebra of observables, on a Hilbert-space state space, with tensor product as the composition rule. A record whose observable algebra is noncommutative belongs to this family whatever else its components carry.

The finite-dimensional sector is the model case for the whole paper.

\begin{theorem}[Structure of finite-dimensional unital complex $C^*$-algebras]
\label{thm:calg}
Let $A$ be a unital finite-dimensional complex $C^*$-algebra. Then $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ for a unique multiset $\{n_1, \dots, n_k\}$ of positive integers, and that multiset determines $A$ up to $*$-isomorphism. The invariant range of the sector of all such algebras is the countable set of finite multisets of positive integers. At fixed total complex dimension $d = \sum_i n_i^2$ the attained values are finite in number, and \Cref{thm:sharpness} bounds the number of classes at that dimension accordingly.
\end{theorem}

\begin{proof}[Proof sketch]
The Jacobson radical of a $C^*$-algebra is a closed two-sided $*$-ideal of topologically nilpotent elements and is zero, so $A$ is semisimple. The Artin-Wedderburn theorem then gives $A \cong \bigoplus_i M_{n_i}(D_i)$ with each $D_i$ a division algebra over $\mathbb{C}$. Every finite-dimensional division algebra over $\mathbb{C}$ equals $\mathbb{C}$, because $\mathbb{C}$ is algebraically closed and the minimal polynomial of any element splits. The $C^*$-identity then determines the $*$-structure on each matrix summand, and an isomorphism of the algebras that respects the $*$-structure permutes the simple summands. Uniqueness of the multiset is the uniqueness of the Wedderburn decomposition of a semisimple algebra. At fixed total dimension $d$ the number of multisets whose squares sum to $d$ is finite, which is the stated bound.
\end{proof}

\Cref{thm:calg} is the sector in which the invariant discipline behaves exactly as intended: one named invariant, a finite range, a complete determination. It is also the sector that the later volume on irreducibility and decomposition takes as its model theorem.

The infinite-dimensional picture is different in kind. Amenable factors are classified by Murray-von Neumann type and Connes invariants \cite{vnalg}. Beyond the amenable class, there are uncountably many pairwise non-isomorphic separable type $\mathrm{II}_1$ factors, constructed by McDuff \cite{mcduff}. By \Cref{thm:sharpness} no invariant with countable range classifies that sector. That consequence is what uncountability alone delivers, and a stronger obstruction is known: the isomorphism relation on separable type $\mathrm{II}_1$ factors is not classifiable by countable structures, in the sense of Borel reducibility \cite{sasyk}. The parametric question is therefore closed in the negative rather than left open. The row of the family table records the countable-invariant obstruction and cites the stronger one.

\begin{remark}[What the impossibility does and does not say]
\label{rem:mcduff}
The impossibility is a theorem of McDuff \cite{mcduff} about the sector of all separable type $\mathrm{II}_1$ factors. It does not forbid restricted classification under extra hypotheses such as amenability, and it does not bear on the finite-dimensional sector of \Cref{thm:calg}. The row of the family table for this family records all three situations at once, which is why a single status token per family is not enough.
\end{remark}

Completely positive maps and quantum channels sit in this family through Stinespring dilation and the Kraus form \cite{stinespring,qchannel}. The classification status of that data is treated in \Cref{sec:family7}, where the maps are the objects rather than the ambient structure.

\section{Family III: smooth manifolds and geometric structures}
\label{sec:family3}

This family singles out relativity. Its defining structural data is a smooth manifold with additional geometric structure, carrying function or operator algebras of observables and a flow or field equation as dynamics.

Three classification results are on record and each holds in a restricted regime. The holonomy groups of connected Lorentzian manifolds of signature $(1, n-1)$ are classified by a Berger-list analogue, with realizing metrics constructed \cite{holonomy}. The causal hierarchy of spacetimes is complete as a ladder of conditions from the weakest to global hyperbolicity \cite{causal}. Closed three-manifolds are classified up to homeomorphism by geometrization: each decomposes into pieces carrying exactly one of eight Thurston geometries \cite{geometrization}.

Dimension four is the boundary. Only restricted classes of four-manifolds are classified, by eighteen model geometries together with one countably infinite family, and recognition is not algorithmic: the homeomorphism problem for a connected sum of nine copies of $S^2 \times S^2$ is undecidable \cite{tancer}.

\begin{proposition}[Recognition without classification]
\label{prop:recognition}
There exist four-manifolds for which homeomorphism is undecidable. Consequently no algorithm whose output is a classifying invariant in a decidable range can classify all four-manifolds, and any classification statement in this regime must restrict the class of manifolds under consideration.
\end{proposition}

\begin{proof}
Undecidability of the homeomorphism problem for the stated family of four-manifolds is proved in \cite{tancer}, and the analogous undecidability for group-theoretic Markov properties is the classical Adyan-Rabin theorem \cite{adyanrabin}. An algorithm producing a decidable classifying invariant would decide homeomorphism by comparing outputs, which contradicts undecidability. So no such algorithm exists on the unrestricted class.
\end{proof}

\section{Family IV: principal bundles and connections}
\label{sec:family4}

This family represents gauge theories. Its state spaces are spaces of connections on a principal bundle, its observables are gauge-invariant functionals or operator algebras, and its symmetries are gauge group actions.

This family is the one in which the invariant discipline is closest to its classical source.

\begin{theorem}[Classification of principal bundles]
\label{thm:bundles}
Let $X$ be a paracompact Hausdorff space and $G$ a topological group. The isomorphism classes of principal $G$-bundles over $X$ are in bijection with the homotopy classes of maps $X \to BG$, where $BG$ is a classifying space for $G$. Characteristic classes of these bundles are exactly the pullbacks of universal classes in $H^*(BG)$, including Stiefel-Whitney, Pontryagin, Euler, and Chern classes. The Dixmier-Douady class is the corresponding invariant for $U(1)$-bundle gerbes, which lie in $H^3(X; \mathbb{Z})$, and it classifies those rather than ordinary principal bundles.
\end{theorem}

The invariant range here is the homotopy set $[X, BG]$ with its characteristic-class data, and \Cref{thm:bundles} states that the invariant is complete for this sector, so the record is invariant-complete in the sense of \Cref{def:sector} for every base and every group to which the theorem applies. The shape of the range varies: it is finite for some bases and groups and infinite for others, and \Cref{thm:sharpness} bounds the number of classes by the size of the range in each case.

Anomalies in this family are classified as obstructions rather than as objects. The fermionic anomaly is the non-trivializability of the determinant or Pfaffian line of the Dirac operator, and the gauge anomaly is a cohomological obstruction; quantization exists only when the relevant obstructions vanish \cite{anomaly}. A classification of obstructions is a complete classification of the cases in which the theory exists.

\section{Family V: probability and measure-theoretic structures}
\label{sec:family5}

This family represents statistical physics. Its state spaces are spaces of probability measures or density operators, its observables are measurable functions or operators, and its composition rule is product measure or tensor product.

The classical row carries the one uniqueness result in the ten families.

\begin{theorem}[Chentsov]
\label{thm:chentsov}
On the classical statistical state space of a finite sample space, the Fisher metric is the unique Riemannian metric, up to a positive constant factor, that is monotone under stochastic maps. The uniqueness is recorded in the survey literature as the classical anchor of the monotone-metric classification \cite{petz}, and the quantum analogue there is parametric rather than unique.
\end{theorem}

The quantum analogue fails to be unique. Monotone metrics on quantum state spaces are classified parametrically by operator monotone functions, which form a continuum and not a finite list \cite{petz}. Classical uniqueness therefore does not transfer to the quantum case, and any classification statement in this family must record which side of that line it stands on.

\begin{remark}[Scope of the uniqueness]
\label{rem:chentsov-scope}
The uniqueness is a statement about metrics monotone under stochastic maps on the classical state space. It is not a classification of classical statistical systems, and it is not a statement about quantum state spaces. Uniqueness and classification are separate achievements, as \Cref{cor:parameterization} records.
\end{remark}

\subsection{A binary statistical system}
\label{sec:binary}

Take the state space of probability vectors $(p, 1-p)$ with $p \in (0,1)$ and the observable algebra of real functions on $\{0, 1\}$. The Fisher metric in the coordinate $p$ is
\[
g_{pp} = \frac{1}{p(1-p)}.
\]
Up to a positive constant factor this is the only Riemannian metric on this state space that is monotone under stochastic maps, by \Cref{thm:chentsov}. What is unique is the metric as ambient geometry on the state space, and not the physical system record. The record carries a state space, a two-point function algebra of observables, and a Markov kernel as dynamics, and the metric does not classify the record: two binary systems with different kernels are not equivalent, and both carry the same metric up to scale. This sector therefore has no classifying invariant on record, and the uniqueness of the metric is a statement about geometry rather than about classification.

The quantum analogue of the same two-point system has a state space of $2 \times 2$ density matrices and a continuum of monotone metrics, parametrized by operator monotone functions \cite{petz}. The classical row is therefore a uniqueness statement of a kind the quantum row does not have.

\section{Family VI: topological and higher-categorical structures}
\label{sec:family6}

This family represents topological quantum field theories. Its state spaces are spaces of fields on a manifold, its observables are topological invariants, and its composition rule is gluing of manifolds.

Functorial topological quantum field theory is tractable under the Atiyah axioms, in contrast to the general non-topological case \cite{tqft}. The extended case is where a classification claim exists and where the proof status matters.

\begin{remark}[The cobordism claim]
\label{rem:cobordism}
It is claimed that $n$-dimensional unitary extended topological quantum field theories are weak $n$-functors out of the free stable weak $n$-category with duals, and that they are classified by fully dualizable objects \cite{baezdolan,lurie}. The 2009 proof is described by its author as an informal sketch of a proof \cite{lurie}. The claim is recorded here as a claim and not as a theorem, and it is not placed in a theorem environment for that reason.
\end{remark}

\begin{remark}[Proof gap]
\label{rem:proof-gap}
The classification claim of \Cref{rem:cobordism} is recorded as claimed and not as complete. Later low-dimensional cases have been proved in the literature, and which cases are complete is a matter for verification case by case. A family row that reads ``claimed'' is a family row that should not carry load-bearing dependencies.
\end{remark}

\section{Family VII: dynamical systems and operator semigroups}
\label{sec:family7}

This family represents dissipative and open systems. Its state spaces are spaces of states, its observables are operators or algebras, and its dynamics is a semigroup of maps or a generator.

No classification theorem for this family is on record in the surveyed literature. What is on record is a normal form.

\begin{theorem}[Stinespring]
\label{thm:stinespring}
Every completely positive map admits a minimal Stinespring dilation, unique up to unitary equivalence of the dilating space \cite{stinespring-primary}. The associated Kraus form is a normal form, and the number of Kraus operators in a minimal dilation is an invariant of the dilation.
\end{theorem}

The next proposition is the precise sense in which that invariant falls short.

\begin{proposition}[Kraus rank is not injective on channels]
\label{prop:kraus}
Fix the equivalence relation on channels to be equality of completely positive maps. Let $\Phi_U \colon M_2(\mathbb{C}) \to M_2(\mathbb{C})$ be the channel $\Phi_U(X) = U X U^*$ for $U \in U(2)$. Every $\Phi_U$ has Kraus rank one, and the set of distinct channels of this form is in bijection with $PU(2)$, which is not a point. The assignment from channels to Kraus rank is therefore not injective under equality of maps, and Kraus rank is not a classifying invariant for this family under that relation.
\end{proposition}

\begin{proof}
For each $U$ the single Kraus operator $U$ realizes $\Phi_U$, and no shorter dilation exists because $\Phi_U$ is nonzero. So the Kraus rank is one for every $U$. Two operators $U, U'$ give the same map exactly when $UXU^* = U'XU'^*$ for all $X \in M_2(\mathbb{C})$, which forces $U' = \lambda U$ for a scalar $\lambda$ of unit modulus. The distinct channels of this form are therefore parametrized by $PU(2)$, which is positive dimensional, and the fiber of the rank map over $1$ is not a point.
\end{proof}

The choice of equivalence in \Cref{prop:kraus} is load-bearing and the conclusion changes with it. Under simultaneous unitary conjugacy the classes of these channels are the conjugacy classes of $PU(2)$, parametrized by a rotation angle in $[0, \pi]$, and rank is still not complete on them. Under two-sided conjugacy by automorphisms of $M_2(\mathbb{C})$ every unitary channel is isomorphic to the identity channel, so this particular family is not an isomorphism counterexample in that sense. What the proposition establishes is the narrow and sufficient claim that one scalar of a normal form does not classify: recording that scalar as though it were an isomorphism classification would produce a false row in the family table.

\section{Family VIII: tensor categories and compositional structures}
\label{sec:family8}

This family represents quantum information. Its objects are tensor categories, its morphisms are tensor functors, and its composition rule is the monoidal product.

Two islands are classified under explicit hypotheses. Symmetric tensor $*$-categories with conjugates, direct sums, subobjects, and $\mathrm{End}(1) = \mathbb{C}$ are equivalent to finite-dimensional unitary representations of a compact supergroup, unique up to isomorphism \cite{dr,dhr}. Symmetric tensor categories of subexponential growth in characteristic zero are supergroup representation categories \cite{deligne}. Both statements carry their hypotheses, and dropping a hypothesis produces a false statement.

The general case is open. Every fusion category is the representation category of a weak Hopf algebra, and the classification of fusion categories is open \cite{fusion}. The constraint on any equivalence used in this family is a theorem and not a convention.

\begin{theorem}[Structure preservation is load-bearing]
\label{thm:etingof-gelaki}
There exist finite groups that are not isomorphic and whose representation categories are equivalent as plain tensor categories. Consequently an equivalence that forgets the symmetric structure cannot recover the group, and any classification in this family must state which layer of structure its equivalence preserves \cite{etingof}.
\end{theorem}

\Cref{thm:etingof-gelaki} is a negative theorem and it is used here as a discipline rule: an equivalence record that does not name the preserved structure is incomplete.

\section{Family IX: discrete combinatorial structures}
\label{sec:family9}

This family represents lattice and network models. Its state spaces are configuration spaces on a graph or lattice, its observables are local functions, and its composition rule is disjoint union or tensor product.

The proved results are regime-restricted and the impossibility results are not. Lattice gauge results hold in restricted regimes and do not by themselves close a continuum limit. The obstructions recorded against this family come from wild representation theory, and the underlying mathematics is commutative algebra and equivariant homotopy theory, which the taxonomy places in Family X. On the commutative side, rank-two isomorphism classes of maximal Cohen-Macaulay modules over the generic determinantal ring admit no parameterization by a finite-dimensional variety \cite{buchweitz}. On the equivariant side, the compact modules over the equivariant Eilenberg-MacLane spectrum $H\underline{\mathbb{F}}_p$ at an odd prime $p$ are wild \cite{grevstad}, and the qualifier is load-bearing: modules over the group ring $\mathbb{F}_p[C_p]$ have finite representation type, so the claim is false if the spectrum coefficient is dropped. A companion boundary is algorithmic and lives in this family: an isomorphism test running in polynomial time exists for groups that are tame extensions, so the tame and wild regimes are separated by an algorithmic boundary as well \cite{grochow}.

\begin{corollary}
\label{cor:wild}
By \Cref{thm:sharpness}, a sector whose classes admit no parameterization by a finite-dimensional variety admits no invariant-complete record whose range is a finite-dimensional variety. The obstruction is a statement about the range of any candidate invariant.
\end{corollary}

\subsection{A lattice gauge configuration}
\label{sec:lattice}

Take a finite graph $\Lambda$ with a compact structure group $G$ and a configuration space of $G$-valued edge assignments modulo the gauge action at the vertices. The record is: state space the quotient configuration space, observables the gauge-invariant functions generated by Wilson loops, dynamics the transfer operator, symmetries the gauge group, and composition the disjoint union of graphs.

The tame side of this sector admits named invariants: the holonomy of each closed loop, and the character of the representation assigned to it. The wild side does not, and \Cref{cor:wild} records what that absence means for any candidate invariant. Algebraic quantum field theory axiomatizes a theory as a local net of operator algebras \cite{haagkastler}, and that framework is where the lattice sector of this family meets the operator-algebra family. Lattice results proved in restricted regimes do not by themselves close the continuum limit, and the invariant record of the limiting object is a separate matter, as \Cref{rem:limits} records.

\section{Family X: derived and homotopical structures}
\label{sec:family10}

This family represents higher gauge and derived field theories. Its objects are derived categories or homotopical enhancements, and its morphisms are derived equivalences.

Every finite-dimensional algebra over an algebraically closed field falls on one side of the tame-wild dichotomy for derived categories \cite{bekkert}. This family is the home of the wild-side obstructions that Family IX inherits: the non-parameterization of rank-two isomorphism classes of maximal Cohen-Macaulay modules over the generic determinantal ring \cite{buchweitz}, and the wildness of the compact modules over $H\underline{\mathbb{F}}_p$ at an odd prime \cite{grevstad}. Beyond the dichotomy no classification is claimed.

\begin{remark}[Dichotomy as content]
\label{rem:dichotomy}
A dichotomy theorem classifies the objects of a theory into two classes and classifies neither class internally. The row for this family in the chart below is complete at the level of the dichotomy and open at the level of the two sides.
\end{remark}

\section{Exceptional structures}
\label{sec:exceptional}

The chart of families is not a chart of everything. Two kinds of additional structure sit beside it: genuinely exceptional objects, and distinguished objects that are canonical rather than exceptional. Both kinds are simple or indecomposable in their ambient categories, and that is the property the table below uses: the twenty-six sporadic simple groups together with the cyclic, alternating, and Lie-type families \cite{cfsg,solomon,atlas}; the exceptional Lie algebras $\mathrm{G}_2$, $\mathrm{F}_4$, $\mathrm{E}_6$, $\mathrm{E}_7$, $\mathrm{E}_8$ \cite{lie}; the type $\mathrm{III}_0$ and type $\mathrm{III}_1$ factors and the hyperfinite $\mathrm{II}_1$ factor \cite{vnalg}; the eight Thurston geometries \cite{geometrization} and the bounded list of four-dimensional model geometries that Filipkiewicz enumerated, recorded in the survey literature beside the unrecognizability results of \cite{tancer}; and pairs of non-isomorphic finite groups with equivalent plain-tensor representation categories \cite{etingof}.

\begin{table}[ht]
\centering
\small
\caption{Collections of simple or indecomposable objects recorded beside the families. The last column states why none of them is closed under direct sum; that property is about simplicity and not about exceptionality.}
\label{tab:exceptional}
\begin{tabularx}{\textwidth}{L{0.22\textwidth} X L{0.30\textwidth}}
\toprule
Collection & What it is & Why it is not closed under direct sum \\
\midrule
Sporadic simple groups & Finite simple groups outside the cyclic, alternating, and Lie-type families \cite{cfsg,solomon} & Direct sum or direct product of two such groups is not simple \\
Exceptional Lie algebras & The five simple Lie algebras of types $\mathrm{G}_2$, $\mathrm{F}_4$, $\mathrm{E}_6$, $\mathrm{E}_7$, $\mathrm{E}_8$ \cite{lie} & Direct sum of two of them is not simple \\
Distinguished factors & Type $\mathrm{III}_0$, type $\mathrm{III}_1$, and the hyperfinite $\mathrm{II}_1$ factor \cite{vnalg}, none of them exceptional & Direct sum of any two factors has nontrivial center and is not a factor \\
Thurston geometries & The eight model geometries in dimension three \cite{geometrization} & Connected sum of geometrized manifolds need not carry a single geometry \\
Isocategorical pairs & Non-isomorphic finite groups with equivalent plain-tensor categories \cite{etingof} & Recovering the group from the category fails without symmetric structure \\
\bottomrule
\end{tabularx}
\end{table}

Physical theories should not be assumed to possess a finite collection of exceptional objects analogous to the twenty-six sporadic groups. The table records a structural fact that holds for simple objects of any kind and is not specific to the exceptional ones: the direct sum of two simple objects is not simple, whether the two are exceptional or regular. The next proposition states that fact in the record setting.

\begin{proposition}[Irreducible classes do not close]
\label{prop:closure}
Let $\mathcal{K}$ contain direct sum and let $\mathcal{E}$ be a nonempty class of nonzero objects each irreducible under direct sum. Then $\mathcal{E}$ is not closed under direct sum and $\langle \mathcal{E} \rangle_{\mathcal{K}}$ strictly contains $\mathcal{E}$. The conclusion is one of non-closure and not of non-generation: $\mathcal{E}$ generates $\langle \mathcal{E} \rangle_{\mathcal{K}}$ by definition of closure, so a generating class may consist of irreducibles alone.
\end{proposition}

\begin{proof}
Take $A \in \mathcal{E}$ nonzero. The pair $(A, A)$ witnesses a decomposition of $A \oplus A$ under the direct-sum construction with irreducible factors $A$ and $A$, so $A \oplus A$ is reducible and is therefore not in $\mathcal{E}$. It is in $\langle \mathcal{E} \rangle_{\mathcal{K}}$ by closure under direct sum. The inclusion $\mathcal{E} \subsetneq \langle \mathcal{E} \rangle_{\mathcal{K}}$ is strict, which is the non-closure claim. The generation claim runs the other way and is immediate: $\langle \mathcal{E} \rangle_{\mathcal{K}}$ is by definition the smallest class containing $\mathcal{E}$ and closed under $\mathcal{K}$, so $\mathcal{E}$ generates it.
\end{proof}

Two consequences follow and they are different. A class of irreducibles is never a fixed point of the closure operator whenever $\mathcal{K}$ contains direct sum, so taking a closure always adds objects. A class of irreducibles can nevertheless be a generating set, and the finite-dimensional matrix algebras are the example: each $M_n(\mathbb{C})$ is irreducible under direct sum and the list $\{M_n(\mathbb{C}) : n \geq 1\}$ generates every unital finite-dimensional complex $C^*$-algebra under direct sum, by \Cref{thm:calg}.

\section{Independence and reconstructability}
\label{sec:independence}

A natural hope is that the ten families are logically independent, so that no family can be rebuilt from another. What the literature proves is a mixture of reconstruction theorems and counterexamples to reconstruction.

\begin{table}[ht]
\centering
\small
\caption{Reconstruction and non-reconstruction results. The first four rows relate distinct families; the fifth compares two sectors of one family. Each row states the verdict and the structure the equivalence preserves.}
\label{tab:independence}
\begin{tabularx}{\textwidth}{L{0.28\textwidth} L{0.20\textwidth} X}
\toprule
Relation & Verdict & Preserved structure \\
\midrule
Commutative unital $C^*$-algebras and compact Hausdorff spaces & Reconstructable & The Gelfand correspondence preserves the lattice of closed ideals \cite{gelfand-naimark,gelfand-duality} \\
Boolean algebras and zero-dimensional compact spectra & Reconstructable & Stone duality preserves the order and the topology \cite{stone} \\
Symmetric tensor categories with conjugates and compact supergroups & Reconstructable & Doplicher-Roberts reconstruction preserves the symmetric structure \cite{dr,dhr} \\
Plain tensor categories and the underlying finite group & Not reconstructable & No symmetric structure is preserved, and the group is lost \cite{etingof} \\
Classical and quantum monotone metrics, both in Family V & Not identical & Uniqueness holds classically and fails in the quantum case \cite{petz} \\
Symplectic and operator-algebra families & Open & Deformation quantization is a program and not an equivalence \\
\bottomrule
\end{tabularx}
\end{table}

\begin{definition}[Independence of families]
\label{def:independence}
Two structural families $\mathfrak{F}$ and $\mathfrak{G}$ are \emph{logically independent} when neither is a special case of the other and neither is reconstructable from the other: there is no full embedding of one into the other, and no correspondence of the kind in Table~\ref{tab:independence} that determines one from the other. Independence in this sense is a statement about the families as classes of records and not about any particular system.
\end{definition}

\begin{proposition}[Invariants do not imply independence]
\label{prop:independence}
Let $\mathfrak{F}$ and $\mathfrak{G}$ be two structural families each admitting a classifying invariant. Then $\mathfrak{F}$ and $\mathfrak{G}$ need not be logically independent. In particular the commutative unital $C^*$-algebras inside the operator-algebra family and the compact Hausdorff spaces inside the geometric family each carry a classifying invariant, and neither is independent of the other.
\end{proposition}

\begin{proof}
The Gelfand correspondence gives a bijection between commutative unital $C^*$-algebras and compact Hausdorff spaces that is an anti-equivalence of categories \cite{gelfand-duality,gelfand-naimark}. The spectrum is a classifying invariant for the space side and the algebra is a classifying invariant for the algebra side, and each determines the other. Two families related by such a correspondence cannot be logically independent, because every statement about one transfers to the other. The existence of a classifying invariant in each family is therefore silent on the question of independence.
\end{proof}

No theorem on record states that any two of the ten families are independent in the sense of \Cref{def:independence}. The honest chart entry for the independence question is open, and \Cref{prop:independence} explains why classifying invariants cannot settle it.

\section{Systems in more than one family}
\label{sec:mixing}

A physical system is a record $(X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$, and the families classify records by their mathematical structure. A single record can present structure from several families at once, and the taxonomy must account for that without pretending the families partition mathematics.

\begin{proposition}[Mixed records are not defects]
\label{prop:mixed}
There exist records whose state space is a symplectic manifold, whose observable algebra is a noncommutative $C^*$-algebra, and whose symmetry group is a Lie group. Such a record lies in the symplectic, operator-algebraic, and geometric families at once. Consequently the assignment of records to families is not a partition, and no argument may treat the ten families as mutually exclusive classes.
\end{proposition}

\begin{proof}
Take $M$ a compact K\"{a}hler manifold with integral K\"{a}hler form $\omega$, let $L \to M$ be the corresponding positive line bundle, and let $\mathcal{H}_L$ be the space of holomorphic sections of $L$. For $f \in C^\infty(M)$ let $T_f$ be the Toeplitz operator on $\mathcal{H}_L$ that multiplies by $f$ and then projects back to $\mathcal{H}_L$. The $C^*$-algebra generated by the operators $T_f$ is noncommutative whenever $\dim \mathcal{H}_L > 1$, since $T_f T_g - T_g T_f$ is nonzero for suitable $f$ and $g$. The record whose state space is $M$ with its symplectic form, whose observable algebra is this Toeplitz $C^*$-algebra, whose symmetries are the biholomorphisms of $M$ lifting to $L$, and whose dynamics is the quantization of a Hamiltonian on $M$, presents symplectic, operator-algebraic, and geometric structure at once. If the families were mutually exclusive, this record would lie in none of them or in more than one, and the second option contradicts exclusivity.
\end{proof}

The research goal at this level is to discover which distinctions are fundamental and which arise from different mathematical presentations. \Cref{prop:mixed} is a small instance of that question, and it is the reason \Cref{def:structural-family} defines a family by the structure it singles out rather than by membership of records.

Two further relations between families are worth naming. A family may be a special case of another: the commutative unital $C^*$-algebras are a full subcategory of the operator-algebra family and are equivalent to compact Hausdorff spaces, so the two presentations carry the same information \cite{gelfand-duality}. A family may be generated from another under constructions, in the sense of \Cref{def:structural-family}. Both relations are structural statements about the families, and neither is a statement about the physical systems the families represent.

\section{The taxonomy as an interface}
\label{sec:interface}

Later volumes classify systems. The taxonomy is the place they record what they find, and the record format is fixed here so that results produced independently are comparable.

A classification record in a later volume has six fields: the family, the sector, the classifying invariant together with its range, the equivalence the invariant is complete for, the scope in which completeness holds, and the achievement kind of \Cref{def:kinds}. A record with an empty invariant field is a record of an absence and not a classification.

\begin{proposition}[Comparability of records]
\label{prop:comparable}
Two classification records are comparable when they agree on family, sector, and equivalence. If they agree on those three fields and both name classifying invariants, then the two invariants are related by a bijection between their attained values on that sector.
\end{proposition}

\begin{proof}
Both invariants are complete for the same equivalence on the same set of objects, so each induces a bijection between the set of classes and its own attained values. The composite of one bijection with the inverse of the other is a bijection between the two sets of attained values.
\end{proof}

\Cref{prop:comparable} is what makes the family rows usable across volumes. Two independently obtained invariants for the same sector are not competing claims; they are coordinate descriptions of the same class set, and each can be converted into the other once both are recorded. What is not automatic is agreement on scope, since two records may cover different sub-sectors. Scope comparison is therefore a manual step, and the family tables above state the scope of every row they carry.

The interface also fixes how an obstruction is recorded. An impossibility result names the sector, names the candidate invariant range it excludes, and cites the theorem that excludes it. An absence of record names the sector and states that no classification is on record. The two are different fields and never share a row, as Table~\ref{tab:kinds} shows.

\section{Scope of the family taxonomy}
\label{sec:limitations}

Four limits bound the use of the ten-family chart.

The families are candidates and not a completed classification. They are recorded as candidate organizing families, and some may be unified or shown to be special cases of others. The word ``candidate'' in \Cref{def:structural-family} is load-bearing.

No completeness claim is available. Whether every admissible physical system lies in the closure of these ten families under the admissible constructions is unproved, and the conjectural identity that states it is a registered conjecture. \Cref{prop:closure} shows that a class of irreducibles is not closed under the constructions, so any completeness claim has to describe a closure and the objects it adds, not only a list of generators.

Status tokens are coarse. A single status per family hides the finite-dimensional, amenable, and wild sectors of the operator-algebra family at once, as \Cref{rem:mcduff} records. Table~\ref{tab:families} gives one row per family and states a scope limit in its last column; where the sectors of a family differ in kind, Tables~\ref{tab:kinds} and~\ref{tab:independence} give the finer breakdown.

Independence is unrecorded. \Cref{prop:independence} shows the question is not settled by invariants, and no theorem settles it. Statements about the logical relations between families are therefore hypotheses in later volumes and not lemmas.

\begin{table}[ht]
\centering
\small
\caption{Open questions the taxonomy raises, with the kind of result that would close each one.}
\label{tab:open}
\begin{tabularx}{\textwidth}{L{0.34\textwidth} L{0.20\textwidth} X}
\toprule
Question & Present status & What would close it \\
\midrule
Which families are fundamental rather than presentations of others & Open & A theorem reducing one family to another \\
Whether any two families are logically independent & Open & A non-derivability theorem in a stated sense \\
Whether the ten families generate all admissible systems & Conjecture & A proof of the closure identity, or an obstruction \\
A uniform parameterization of the finite simple groups & Open & An explicit uniform description of the classes \\
The global invariants of the symplectic family & Unrecorded & A named finite or parametric invariant list \\
A classification theorem for the semigroup family & None on record & A classification with a stated scope \\
Complete cases of the extended topological classification & Claimed & A proof closing the 2009 sketch in each case \\
\bottomrule
\end{tabularx}
\end{table}

\begin{table}[ht]
\centering
\small
\caption{The ten candidate structural families with their representative systems, classifying invariants, and achievement kind. The kind column uses the vocabulary of \Cref{def:kinds}; where the sectors of a family differ, the row says so and Table~\ref{tab:kinds} gives the breakdown.}
\label{tab:families}
\begin{tabularx}{\textwidth}{L{0.07\textwidth} L{0.16\textwidth} L{0.20\textwidth} L{0.15\textwidth} X}
\toprule
Family & Defining data & Classifying invariant & Achievement kind & Scope limit \\
\midrule
I & Symplectic or Poisson state space & Global symplectic topology & Mixed: parameterized locally, no record globally & No local invariants exist \\
II & Noncommutative observable algebra & Dimension vector, type and Connes data & Mixed: parameterized, and impossible in part & Finite-dimensional and amenable sectors only \\
III & Smooth manifold with geometry & Holonomy, causal class, geometry type & Mixed: parameterized in restricted regimes & Dimension four is unrecognizable \\
IV & Principal bundle with connection & Map to the classifying space & Complete and parameterized & Base and group must be numerable \\
V & Space of probability measures & Fisher metric up to constant & No record for the systems & Uniqueness is of the metric, not of the record \\
VI & Cobordism datum & Fully dualizable object & No record, with a claim on file & The 2009 proof is a sketch \\
VII & Operator semigroup or generator & None on record & No record & The Kraus form is a normal form, and rank is one scalar of it \\
VIII & Tensor category & Supergroup data with symmetric layer & Mixed: parameterized islands, no record generally & Hypotheses travel with the theorem \\
IX & Configuration space on a lattice & Tame or wild class & Mixed: impossible in wild parts & No finite-variety parameterization \\
X & Derived or homotopical category & Derived-tame or derived-wild class & No record beyond the dichotomy & Nothing is claimed beyond it \\
\bottomrule
\end{tabularx}
\end{table}

\section{Conclusion}
\label{sec:conclusion}

The ten families are a working taxonomy. Each carries a classifying invariant or an explicit statement that none is on record, a set of classified islands with the scope they hold in, and an obstruction where an obstruction is proved. The invariant discipline of \Cref{sec:discipline} is the method by which later volumes record their own classification results: one named invariant, one named range, one named equivalence, one named scope.

The four results set the terms of use. Classification shape follows invariant shape (\Cref{thm:sharpness}), classification in the symplectic family is global (\Cref{prop:globality}), a class of irreducibles is not closed under the admissible constructions (\Cref{prop:closure}), and classifying invariants do not establish independence between families (\Cref{prop:independence}). All four are proved here in full. The fourth is also a standing warning against reading the chart as a decomposition of mathematics.

What remains open is stated plainly. Which of the ten families are fundamental rather than presentations of others is not known. Whether any two families are logically independent is not known. Whether the ten families generate all admissible physical systems under the admissible constructions is a conjecture. The taxonomy is a place to record classification results, and it is not itself the classification.

\appendix
\section{Computational evidence}
\label{app:code}

The code accompanying this paper supplies executable models of the taxonomy and small computational checks of two claims. Computational evidence is evidence and never proof. The executable models are written against the family, invariant, and construction classes of the typed taxonomy layer, and they are validated against the specifications recorded in the paper. They are not machine checked.

\begin{table}[ht]
\centering
\small
\caption{Code evidence. Each row names a claim, the file that evidences it, and what the file demonstrates.}
\label{tab:code}
\begin{tabularx}{\textwidth}{L{0.07\textwidth} L{0.31\textwidth} L{0.25\textwidth} X}
\toprule
Row & Claim & Evidence file & What the file demonstrates \\
\midrule
1 & Kraus rank is constant on a positive-dimensional family of channels & \path{phaseD_kraus_rank.py} & Constructs unitary channels on $M_2$ and reports rank one for each \\
2 & Dimension vectors enumerate the finite-dimensional sector at fixed dimension & \path{phaseD_dimension_vectors.py} & Enumerates dimension vectors of total dimension $n$ and counts them \\
3 & Each of the ten families has a declared instance of the taxonomy classes & \path{Instances.hs} & Declares one instance per family for the systems named in this paper \\
4 & Family tags carry ontology identifiers & \path{Instances.hs} & Reports the identifier of each family tag through the taxonomy accessor \\
\bottomrule
\end{tabularx}
\end{table}

\begin{thebibliography}{99}

\bibitem{cfsg}
\emph{Classification of finite simple groups}. Encyclopedia article. Available at \url{https://en.wikipedia.org/wiki/Classification_of_finite_simple_groups}.

\bibitem{solomon}
R. Solomon, \emph{A brief history of the classification of the finite simple groups}, Bulletin of the American Mathematical Society \textbf{38} (2001) 315-352. Available at \url{https://www.ams.org/journals/bull/2001-38-03/S0273-0979-01-00909-0/}.

\bibitem{atlas}
\emph{ATLAS of Finite Groups}. Encyclopedia article. Available at \url{https://en.wikipedia.org/wiki/ATLAS_of_Finite_Groups}.

\bibitem{lie}
\emph{Simple Lie group}. Encyclopedia article. Available at \url{https://en.wikipedia.org/wiki/Simple_Lie_group}.

\bibitem{hw}
\emph{Theorem of the highest weight}. Encyclopedia article. Available at \url{https://en.wikipedia.org/wiki/Theorem_of_the_highest_weight}.

\bibitem{darboux}
\emph{Darboux's theorem}. Encyclopedia article. Available at \url{https://en.wikipedia.org/wiki/Darboux%27s_theorem}.

\bibitem{poisson}
\emph{Poisson manifold}. WikiJournal of Science \textbf{7} (2024) 6. Available at \url{https://en.wikipedia.org/wiki/Poisson_manifold}.

\bibitem{vnalg}
\emph{Von Neumann algebra}. Encyclopedia article. Available at \url{https://en.wikipedia.org/wiki/Von_Neumann_algebra}.

\bibitem{calg}
\emph{$C^*$-algebra}. Encyclopedia article. Available at \url{https://en.wikipedia.org/wiki/$C^*$-algebra}.

\bibitem{stinespring}
\emph{Stinespring dilation theorem}. Encyclopedia article. Available at \url{https://en.wikipedia.org/wiki/Stinespring_dilation_theorem}.

\bibitem{qchannel}
\emph{Quantum channel}. Encyclopedia article. Available at \url{https://en.wikipedia.org/wiki/Quantum_channel}.

\bibitem{dr}
\emph{Doplicher-Roberts reconstruction theorem}. nLab entry. Available at \url{https://ncatlab.org/nlab/show/Doplicher-Roberts+reconstruction+theorem}.

\bibitem{deligne}
\emph{Deligne's theorem on tensor categories}. nLab entry. Available at \url{https://ncatlab.org/nlab/show/Deligne%27s+theorem+on+tensor+categories}.

\bibitem{fusion}
\emph{Fusion category}. nLab entry. Available at \url{https://ncatlab.org/nlab/show/fusion+category}.

\bibitem{haagkastler}
\emph{Haag-Kastler axioms}. nLab entry. Available at \url{https://ncatlab.org/nlab/show/Haag-Kastler+axioms}.

\bibitem{dhr}
\emph{DHR superselection theory}. nLab entry. Available at \url{https://ncatlab.org/nlab/show/DHR+superselection+theory}.

\bibitem{classifying-space}
\emph{Classifying space}. nLab entry. Available at \url{https://ncatlab.org/nlab/show/classifying+space}.

\bibitem{charclass}
\emph{Characteristic class}. nLab entry. Available at \url{https://ncatlab.org/nlab/show/characteristic+class}.

\bibitem{anomaly}
\emph{Quantum anomaly}. nLab entry. Available at \url{https://ncatlab.org/nlab/show/quantum+anomaly}.

\bibitem{baezdolan}
J. C. Baez and J. Dolan, \emph{Higher-dimensional algebra and topological quantum field theory}, arXiv:q-alg/9503002 (1995). Available at \url{https://arxiv.org/abs/q-alg/9503002}.

\bibitem{lurie}
J. Lurie, \emph{On the classification of topological field theories}, arXiv:0905.0465 (2009). Available at \url{https://arxiv.org/abs/0905.0465}.

\bibitem{tqft}
\emph{Topological quantum field theory}. nLab entry. Available at \url{https://ncatlab.org/nlab/show/topological+quantum+field+theory}.

\bibitem{gelfand-naimark}
\emph{Gelfand-Naimark theorem}. nLab entry. Available at \url{https://ncatlab.org/nlab/show/Gelfand-Naimark+theorem}.

\bibitem{gelfand-duality}
\emph{Gelfand duality}. nLab entry. Available at \url{https://ncatlab.org/nlab/show/Gelfand+duality}.

\bibitem{stone}
\emph{Stone duality}. nLab entry. Available at \url{https://ncatlab.org/nlab/show/Stone+duality}.

\bibitem{causal}
E. Minguzzi and M. S\'{a}nchez, \emph{The causal hierarchy of spacetimes}, arXiv:gr-qc/0609119 (2006). Available at \url{https://arxiv.org/abs/gr-qc/0609119}.

\bibitem{holonomy}
A. Galaev, \emph{Holonomy groups of Lorentzian manifolds}, arXiv:1611.01551 (2016). Available at \url{https://arxiv.org/abs/1611.01551}.

\bibitem{petz}
D. Petz and C. Sud\'{a}r, \emph{Extending the Fisher metric to density matrices}, arXiv:quant-ph/0102132 (2001). Available at \url{https://arxiv.org/abs/quant-ph/0102132}.

\bibitem{adyanrabin}
\emph{Adyan-Rabin theorem}. Encyclopedia article. Available at \url{https://en.wikipedia.org/wiki/Adian%E2%80%93Rabin_theorem}.

\bibitem{tancer}
M. Tancer, \emph{Simpler algorithmically unrecognizable 4-manifolds}, arXiv:2310.07421 (2023). Available at \url{https://arxiv.org/abs/2310.07421}.

\bibitem{bekkert}
V. Bekkert and Y. Drozd, \emph{Tame-wild dichotomy for derived categories}, arXiv:math/0310352 (2003). Available at \url{https://arxiv.org/abs/math/0310352}.

\bibitem{buchweitz}
R.-O. Buchweitz and G. J. Leuschke, \emph{Factoring the adjoint and maximal Cohen-Macaulay modules over the generic determinant}, arXiv:math/0505315 (2005). Available at \url{https://arxiv.org/abs/math/0505315}.

\bibitem{grochow}
J. A. Grochow and Y. Qiao, \emph{Polynomial-time isomorphism test of groups that are tame extensions}, arXiv:1507.01917 (2015). Available at \url{https://arxiv.org/abs/1507.01917}.

\bibitem{grevstad}
J. F. Grevstad and C. May, \emph{Equivariant $H\underline{\mathbb{F}}_p$-modules are wild}, arXiv:2509.17604 (2025). Available at \url{https://arxiv.org/abs/2509.17604}.

\bibitem{geometrization}
\emph{Geometrization conjecture}. Encyclopedia article. Available at \url{https://en.wikipedia.org/wiki/Geometrization_conjecture}.

\bibitem{etingof}
P. Etingof and S. Gelaki, \emph{Isocategorical groups}, International Mathematics Research Notices \textbf{2001} (2001) 59-120. DOI \texttt{10.1155/s1073792801000046}. Available at \url{https://doi.org/10.1155/s1073792801000046}.

\bibitem{mcduff}
D. McDuff, \emph{Uncountably many $\mathrm{II}_1$ factors}, Annals of Mathematics \textbf{90} (1969) 351-370. DOI \texttt{10.2307/1970730}. Available at \url{https://doi.org/10.2307/1970730}.

\bibitem{sasyk}
R. Sasyk and A. T\o rnquist, \emph{Borel reducibility and classification of von Neumann algebras}, arXiv:0909.2657 (2009). Available at \url{https://arxiv.org/abs/0909.2657}.

\bibitem{weinstein}
A. Weinstein, \emph{The local structure of Poisson manifolds}, Journal of Differential Geometry \textbf{18} (1983) 523-557. DOI \texttt{10.4310/jdg/1214437787}. Available at \url{https://doi.org/10.4310/jdg/1214437787}.

\bibitem{stinespring-primary}
W. F. Stinespring, \emph{Positive functions on $C^*$-algebras}, Proceedings of the American Mathematical Society \textbf{6} (1955) 211-216. DOI \texttt{10.1090/s0002-9939-1955-0069403-4}. Available at \url{https://doi.org/10.1090/s0002-9939-1955-0069403-4}.

\end{thebibliography}

\end{document}

exec
/usr/local/bin/zsh -lc 'cat src/vol-02-structural-families/phaseD_kraus_rank.py src/vol-02-structural-families/phaseD_dimension_vectors.py src/vol-02-structural-families/Instances.hs' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
#!/usr/bin/env python3
"""Phase D computational evidence for vol-02-structural-families.

Claim evidenced (paper, Proposition 11.2): the Kraus rank of the minimal
Stinespring dilation is constant on a positive-dimensional family of unitary
channels on M_2, so the assignment from channels to Kraus rank is not
injective and Kraus rank is not a classifying invariant for Family VII.

What this script demonstrates: for a sampled family of unitary channels
Phi_U(X) = U X U* with U in U(2), every channel has Kraus rank exactly one,
while the channels are pairwise distinct as maps. The number of distinct
channels grows with the sample size and the rank never moves.

This is computational evidence and never proof. It is not verified by Lean.
"""

from __future__ import annotations

import cmath
import math


def unitary_2x2(theta: float, phi: float) -> list[list[complex]]:
    """A two-parameter family of unitaries in U(2): diag(e^{i theta}, e^{i phi})."""
    return [
        [cmath.exp(1j * theta), 0.0j],
        [0.0j, cmath.exp(1j * phi)],
    ]


def apply_channel(u: list[list[complex]], x: list[list[complex]]) -> list[list[complex]]:
    """Return U X U* for 2 by 2 matrices."""
    ux = [
        [sum(u[i][k] * x[k][j] for k in range(2)) for j in range(2)]
        for i in range(2)
    ]
    return [
        [sum(ux[i][k] * u[j][k].conjugate() for k in range(2)) for j in range(2)]
        for i in range(2)
    ]


def kraus_rank(operators: list[list[list[complex]]]) -> int:
    """Minimal Kraus rank: the number of linearly independent Kraus operators.

    A Kraus list {A_i} realises a completely positive map, and the minimal
    Stinespring dilation has Kraus rank equal to the dimension of the linear
    span of the A_i. This computes that dimension by Gaussian elimination on
    the vectorised operators, so the rank is derived from the operators rather
    than asserted.
    """
    if not operators:
        return 0
    vecs = []
    for a in operators:
        vecs.append([a[i][j] for i in range(len(a)) for j in range(len(a[0]))])
    # Gaussian elimination over the complex span, tracking pivots.
    basis: list[list[complex]] = []
    for v in vecs:
        w = list(v)
        for b in basis:
            pivot = next((i for i, x in enumerate(b) if abs(x) > 1e-12), None)
            if pivot is None:
                continue
            coeff = w[pivot] / b[pivot]
            w = [w[i] - coeff * b[i] for i in range(len(w))]
        if any(abs(x) > 1e-12 for x in w):
            basis.append(w)
    return len(basis)


def channels_agree(
    u1: list[list[complex]], u2: list[list[complex]]
) -> bool:
    """True when U1 X U1* = U2 X U2* on a basis of M_2."""
    basis = []
    for i in range(2):
        for j in range(2):
            m = [[0.0j] * 2 for _ in range(2)]
            m[i][j] = 1.0 + 0.0j
            basis.append(m)
    for x in basis:
        y1 = apply_channel(u1, x)
        y2 = apply_channel(u2, x)
        for i in range(2):
            for j in range(2):
                if abs(y1[i][j] - y2[i][j]) > 1e-12:
                    return False
    return True


def main() -> None:
    n = 12
    thetas = [2 * math.pi * k / n for k in range(n)]
    phis = [2 * math.pi * k / (2 * n) for k in range(n)]

    pairs = [(thetas[i], phis[i]) for i in range(n)]
    channels = [unitary_2x2(t, p) for (t, p) in pairs]

    # Each unitary channel Phi_U(X) = U X U* has the single Kraus operator U,
    # and the rank is computed from that list rather than assumed.
    ranks = [kraus_rank([u]) for u in channels]

    distinct = 0
    for i in range(len(channels)):
        seen = False
        for j in range(i):
            if channels_agree(channels[i], channels[j]):
                seen = True
                break
        if not seen:
            distinct += 1

    print("Phase D evidence: Kraus rank of unitary channels on M_2")
    print("Paper claim: Proposition 11.2 (kraus_rank_not_injective)")
    print()
    print(f"sample size                : {n}")
    print(f"Kraus rank observed        : {sorted(set(ranks))}")
    print(f"distinct channels observed : {distinct}")
    print()
    all_one = all(r == 1 for r in ranks)
    print(f"every sampled rank is one  : {all_one}")
    print(f"more than one channel      : {distinct > 1}")
    print()
    if all_one and distinct > 1:
        print(
            "RESULT: the rank map is constant on a family with more than one "
            "channel, so it is not injective on this sample."
        )
    else:
        print("RESULT: sample does not exhibit the claimed behaviour; investigate.")


if __name__ == "__main__":
    main()
#!/usr/bin/env python3
"""Phase D computational evidence for vol-02-structural-families.

Claim evidenced (paper, Theorem 5.1 and Table 4 row 2): the dimension vector,
the multiset of matrix block sizes, classifies unital finite-dimensional
complex C*-algebras up to *-isomorphism, and the range of the invariant at
fixed total complex dimension is finite.

What this script demonstrates: for a total complex dimension n it enumerates
every multiset of positive integers whose squares sum to n, which is exactly
the set of dimension vectors of algebras of that total dimension, and it
cross-checks the induced operations of Proposition 6.1 (direct sum gives the
multiset union, tensor product gives the multiset of block-size products).

This is computational evidence and never proof. It is not verified by Lean.
"""

from __future__ import annotations

from itertools import combinations_with_replacement


def dimension_vectors(total_dimension: int) -> list[tuple[int, ...]]:
    """Every dimension vector with sum of squares equal to total_dimension.

    A unital finite-dimensional complex C*-algebra is a direct sum of matrix
    algebras M_{n_i}(C), and its total complex dimension is sum_i n_i^2. The
    dimension vector is the multiset of the n_i, normalised as a sorted tuple.
    """
    out: set[tuple[int, ...]] = set()
    max_block = 1
    while (max_block + 1) ** 2 <= total_dimension:
        max_block += 1
    for size in range(1, total_dimension + 1):
        for blocks in combinations_with_replacement(range(1, max_block + 1), size):
            if sum(b * b for b in blocks) == total_dimension:
                out.add(tuple(sorted(blocks)))
    return sorted(out)


def total_dimension(vector: tuple[int, ...]) -> int:
    return sum(b * b for b in vector)


def direct_sum_vector(a: tuple[int, ...], b: tuple[int, ...]) -> tuple[int, ...]:
    """Proposition 6.1: the dimension vector of A + B is the multiset union."""
    return tuple(sorted(a + b))


def tensor_product_vector(a: tuple[int, ...], b: tuple[int, ...]) -> tuple[int, ...]:
    """Proposition 6.1: the dimension vector of A tensor B is the product multiset."""
    return tuple(sorted(x * y for x in a for y in b))


def main() -> None:
    print("Phase D evidence: dimension vectors of finite-dimensional C*-algebras")
    print("Paper claim: Theorem 5.1 (dim_vector_classification), Proposition 6.1")
    print()
    for n in range(1, 13):
        vecs = dimension_vectors(n)
        rendered = ", ".join("{" + ",".join(str(b) for b in v) + "}" for v in vecs)
        print(f"total dimension {n:2d} : {len(vecs)} class(es) : {rendered or 'none'}")

    print()
    print("Proposition 6.1 cross-check on the dimension-4 and dimension-5 sectors")
    a = (2,)
    b = (1, 1, 1, 1)
    print(f"  A = {{2}} total dimension        : {total_dimension(a)}")
    print(f"  B = {{1,1,1,1}} total dimension   : {total_dimension(b)}")
    print(f"  A + B dimension vector         : {direct_sum_vector(a, b)}")
    print(f"  A + B total dimension          : {total_dimension(direct_sum_vector(a, b))}")
    print(f"  A tensor A dimension vector    : {tensor_product_vector(a, a)}")
    print(f"  A tensor A total dimension     : {total_dimension(tensor_product_vector(a, a))}")
    print()
    c = (2, 1)
    d = (2, 1)
    print(f"  C = {{2,1}} total dimension      : {total_dimension(c)}")
    print(f"  C tensor C dimension vector    : {tensor_product_vector(c, d)}")
    print(f"  C tensor C total dimension     : {total_dimension(tensor_product_vector(c, d))}")

    print()
    ok_direct = total_dimension(direct_sum_vector(a, b)) == total_dimension(a) + total_dimension(b)
    ok_tensor = total_dimension(tensor_product_vector(a, a)) == total_dimension(a) ** 2
    print(f"direct sum adds total dimension   : {ok_direct}")
    print(f"tensor squares total dimension    : {ok_tensor}")
    print()
    if ok_direct and ok_tensor:
        print("RESULT: the induced operations match the arithmetic of Proposition 6.1.")
    else:
        print("RESULT: an induced operation disagrees with Proposition 6.1; investigate.")


if __name__ == "__main__":
    main()
{-# LANGUAGE TypeFamilies #-}

-- | Module        : Instances
-- Volume          : vol-02-structural-families
-- Paper           : Fundamental Structural Families of Mathematical Physics
-- Description     : Executable taxonomy instances for the physical systems
--                   named in the volume, against the shared family classes of
--                   'Taxonomy.Families', 'Taxonomy.Invariants',
--                   'Taxonomy.Constructions' and 'Taxonomy.Equivalences'.
--
-- The shared family classes are imported and never redefined. Each record
-- below mirrors one system of the paper and one row of
-- verification/vol-02-structural-families-lean-targets.md. The type and method
-- names carry the paper's own vocabulary so that a reader can move between the
-- two without a concordance.
--
-- Claim status (docs/theorem-registry.md): this file is executable
-- computational evidence. It proves nothing and asserts no formalisation. It
-- is NOT verified by Lean and no such claim is made anywhere. The honest
-- statement is that these are executable models validated against the
-- specifications recorded in the paper.
module Instances
  ( -- * Family I: symplectic and Poisson structures
    SymplecticSystem (..)
  , CotangentBundleSystem (..)
  , cotangentRetractFibers
    -- * Family II: Hilbert spaces and operator algebras
  , FiniteCStarAlgebra (..)
  , mkFiniteCStarAlgebra
  , dimensionVectorOfAlgebra
  , algebrasOfTotalDimension
  , BinaryQuantumSystem (..)
    -- * Family III: smooth manifolds and geometric structures
  , LorentzianSystem (..)
    -- * Family IV: principal bundles and connections
  , PrincipalU1Bundle (..)
    -- * Family V: probability and measure-theoretic structures
  , ClassicalStatisticalSystem (..)
  , binaryFisherMetric
    -- * Family VI: topological and higher-categorical structures
  , TopologicalQFTSystem (..)
    -- * Family VII: dynamical systems and operator semigroups
  , QuantumChannelSystem (..)
  , ComplexPair (..)
  , unitaryChannelFamily
  , krausRankOf
    -- * Family VIII: tensor categories and compositional structures
  , SymmetricTensorCategorySystem (..)
    -- * Family IX: discrete combinatorial structures
  , LatticeGaugeSystem (..)
    -- * Family X: derived and homotopical structures
  , DerivedAlgebraSystem (..)
    -- * Family tags and classification records
  , familyTagOf
  , familyDefIds
  , AchievementKind (..)
  , ClassificationRecord (..)
  ) where

import Data.List (nub, sort)

import Taxonomy.Constructions
import Taxonomy.Equivalences
import Taxonomy.Families
import Taxonomy.Invariants

-- ---------------------------------------------------------------------------
-- Family I: symplectic and Poisson structures (paper Section 6, DEF-026)
-- ---------------------------------------------------------------------------

-- | Paper Section 5 and Section 6: a symplectic system with the record
-- (X, O, D, S, C). The paper's Proposition 3.2 records that no local
-- invariant is classifying here, so the record carries global data only.
data SymplecticSystem = SymplecticSystem
  { symplecticDim      :: Int
    -- ^ Half the dimension of the symplectic manifold.
  , symplecticGlobalData :: String
    -- ^ Global datum of the record: cohomology class of the symplectic form
    -- and homotopy type of the base. The paper's Section 6 records the
    -- absence of local data.
  , symplecticHamiltonian :: String
    -- ^ The Hamiltonian whose flow is the dynamics.
  } deriving (Eq, Show)

instance PhysicalSystem SymplecticSystem where
  type StateSpace SymplecticSystem = (Int, String)
  type Observables SymplecticSystem = String
  type Dynamics SymplecticSystem = String
  type Symmetries SymplecticSystem = String
  type Composition SymplecticSystem = Construction
  stateSpace s = (symplecticDim s, symplecticGlobalData s)
  observables _ = "C^infty(M)"
  dynamics = symplecticHamiltonian
  symmetries _ = "cotangent lift of base diffeomorphisms preserving H"
  composition _ = DirectSum

instance FamilySymplecticPoisson SymplecticSystem where
  type SymplecticPoissonData SymplecticSystem = (Int, String)
  symplecticPoissonData s = (symplecticDim s, symplecticGlobalData s)

-- | Paper Section 7.1: the cotangent bundle T*Q with its canonical form.
data CotangentBundleSystem = CotangentBundleSystem
  { cotangentBaseHomotopyType :: String
    -- ^ Homotopy type of Q. Proposition 7.1: this is the homotopy type of
    -- T*Q, so it is the global invariant of the symplectic record.
  , cotangentFiberDim :: Int
    -- ^ Dimension of the cotangent fibre, which equals dim Q.
  } deriving (Eq, Show)

instance PhysicalSystem CotangentBundleSystem where
  type StateSpace CotangentBundleSystem = (String, Int)
  type Observables CotangentBundleSystem = String
  type Dynamics CotangentBundleSystem = String
  type Symmetries CotangentBundleSystem = String
  type Composition CotangentBundleSystem = Construction
  stateSpace c = (cotangentBaseHomotopyType c, cotangentFiberDim c)
  observables _ = "C^infty(T*Q)"
  dynamics _ = "Hamiltonian flow on T*Q"
  symmetries _ = "cotangent lift of diffeomorphisms of Q"
  composition _ = DirectSum

instance FamilySymplecticPoisson CotangentBundleSystem where
  type SymplecticPoissonData CotangentBundleSystem = (String, Int)
  symplecticPoissonData c = (cotangentBaseHomotopyType c, cotangentFiberDim c)

-- | Paper Proposition 7.1: the fibre-wise radial retraction of T*Q onto the
-- zero section. Returns the homotopy of the retraction at parameter t as a
-- family of labelled fibres, which is the computational reading of the proof
-- of Proposition 7.1. This is a model of the retraction and not a proof.
cotangentRetractFibers :: Int -> [(Double, String)]
cotangentRetractFibers n =
  [ (t, "fibre scaled to " ++ show (t :: Double)) | t <- ts ]
  where
    ts = [fromIntegral k / fromIntegral n | k <- [0 .. n]]

-- ---------------------------------------------------------------------------
-- Family II: Hilbert spaces and operator algebras (paper Theorem 5.1, DEF-027)
-- ---------------------------------------------------------------------------

-- | Paper Theorem 5.1 and Section 7.2: a unital finite-dimensional complex
-- C*-algebra, recorded by its multiset of matrix block sizes. Theorem 5.1 is
-- the classification: the dimension vector is classifying for this sector.
newtype FiniteCStarAlgebra = FiniteCStarAlgebra [Int]
  deriving (Eq, Show)

-- | Constructor that normalises the block sizes as a multiset, since the
-- invariant is the multiset and not the order (Theorem 5.1).
mkFiniteCStarAlgebra :: [Int] -> FiniteCStarAlgebra
mkFiniteCStarAlgebra = FiniteCStarAlgebra . sort . filter (> 0)

-- | The classifying invariant of Theorem 5.1, as a Taxonomy dimension vector.
dimensionVectorOfAlgebra :: FiniteCStarAlgebra -> DimensionVector
dimensionVectorOfAlgebra (FiniteCStarAlgebra ns) = DimensionVector (sort ns)

-- | Paper Section 7.2 and Table 4 row 2: all dimension vectors of total
-- complex dimension n, that is all multisets of positive integers whose
-- squares sum to n. For n = 5 the list is [[2,1]]; for n = 4 it is [[2],[1,1,1,1]].
algebrasOfTotalDimension :: Int -> [[Int]]
algebrasOfTotalDimension n = nub (map sort (go n))
  where
    go :: Int -> [[Int]]
    go 0 = [[]]
    go m
      | m < 0 = []
      | otherwise =
          [ k : rest
          | k <- [1 .. m]
          , rest <- go (m - k * k)
          ]

instance PhysicalSystem FiniteCStarAlgebra where
  type StateSpace FiniteCStarAlgebra = [Int]
  type Observables FiniteCStarAlgebra = FiniteCStarAlgebra
  type Dynamics FiniteCStarAlgebra = String
  type Symmetries FiniteCStarAlgebra = String
  type Composition FiniteCStarAlgebra = Construction
  stateSpace (FiniteCStarAlgebra ns) = ns
  observables = id
  dynamics _ = "one-parameter group of *-automorphisms"
  symmetries _ = "unitary group acting by conjugation"
  composition _ = TensorProduct

instance FamilyHilbertOperatorAlgebras FiniteCStarAlgebra where
  type OperatorAlgebraData FiniteCStarAlgebra = DimensionVector
  operatorAlgebraData = dimensionVectorOfAlgebra

-- | Paper Proposition 6.1: the dimension vector of a direct sum is the
-- multiset union, and the dimension vector of a tensor product is the
-- multiset of products of block sizes.
instance Constructible FiniteCStarAlgebra where
  type Composite FiniteCStarAlgebra = FiniteCStarAlgebra
  tensorProduct (FiniteCStarAlgebra as) (FiniteCStarAlgebra bs) =
    Just (mkFiniteCStarAlgebra [a * b | a <- as, b <- bs])
  directSum (FiniteCStarAlgebra as) (FiniteCStarAlgebra bs) =
    Just (mkFiniteCStarAlgebra (as ++ bs))
  extend AlgebraExtension _ _ = Nothing
  extend GroupExtension _ _ = Nothing
  extend FieldTheoreticExtension _ _ = Nothing
  limitHook _ _ = Nothing
  colimitHook _ _ = Nothing
  quotientReduction _ _ = Nothing

-- | Paper Theorem 5.1: a finite-dimensional algebra is reducible under direct
-- sum exactly when it has more than one block.
instance Irreducible FiniteCStarAlgebra where
  irreducibilityBasis (FiniteCStarAlgebra [_]) = DirectSum
  irreducibilityBasis _ = DirectSum

-- | Paper Theorem 5.1: the Wedderburn blocks are the irreducible factors.
instance Decomposable FiniteCStarAlgebra where
  decomposition (FiniteCStarAlgebra ns)
    | length ns <= 1 = Nothing
    | otherwise =
        Just Decomposition
          { decompositionConstruction = DirectSum
          , irreducibleFactors =
              [ FiniteCStarAlgebra [k] | k <- sort ns ]
          }

-- | Paper Theorem 5.1: mathematical equivalence of the records is equality of
-- the dimension vector, which is complete for this sector.
instance MathematicalEquivalence FiniteCStarAlgebra where
  mathematicallyEquivalent a b =
    dimensionVectorOfAlgebra a == dimensionVectorOfAlgebra b

-- | The instance declares *-isomorphism of the observable algebra as the
-- chosen relation for this record. That is a stipulative choice for this
-- record and is not a claim that DEF-015 is settled; the choice of physical
-- equivalence is open in the ontology.
instance PhysicalEquivalence FiniteCStarAlgebra where
  physicallyEquivalent = mathematicallyEquivalent

-- | Paper Section 7.2: the observable algebra of a two-level system together
-- with a classical bit, A = M_2(C) + C, dimension vector {2,1}.
data BinaryQuantumSystem = BinaryQuantumSystem
  { binaryBlocks :: [Int]
  , binaryLabel  :: String
  } deriving (Eq, Show)

instance PhysicalSystem BinaryQuantumSystem where
  type StateSpace BinaryQuantumSystem = [Int]
  type Observables BinaryQuantumSystem = FiniteCStarAlgebra
  type Dynamics BinaryQuantumSystem = String
  type Symmetries BinaryQuantumSystem = String
  type Composition BinaryQuantumSystem = Construction
  stateSpace = binaryBlocks
  observables = mkFiniteCStarAlgebra . binaryBlocks
  dynamics _ = "one-parameter group of *-automorphisms"
  symmetries _ = "unitary group of the algebra"
  composition _ = TensorProduct

instance FamilyHilbertOperatorAlgebras BinaryQuantumSystem where
  type OperatorAlgebraData BinaryQuantumSystem = DimensionVector
  operatorAlgebraData = dimensionVectorOfAlgebra . mkFiniteCStarAlgebra . binaryBlocks

-- ---------------------------------------------------------------------------
-- Family III: smooth manifolds and geometric structures (paper Section 8, DEF-028)
-- ---------------------------------------------------------------------------

-- | Paper Section 8: a Lorentzian system carrying holonomy and causal data.
data LorentzianSystem = LorentzianSystem
  { lorentzianDim :: Int
  , lorentzianHolonomyLabel :: String
  , lorentzianCausalClass :: CausalClass
  } deriving (Eq, Show)

instance PhysicalSystem LorentzianSystem where
  type StateSpace LorentzianSystem = (Int, String)
  type Observables LorentzianSystem = String
  type Dynamics LorentzianSystem = String
  type Symmetries LorentzianSystem = String
  type Composition LorentzianSystem = Construction
  stateSpace l = (lorentzianDim l, lorentzianHolonomyLabel l)
  observables _ = "function algebra on the manifold"
  dynamics _ = "Einstein flow or geodesic flow"
  symmetries _ = "Lorentz group of the tangent frame"
  composition _ = DirectSum

instance FamilySmoothGeometric LorentzianSystem where
  type GeometricData LorentzianSystem = (Int, String, CausalClass)
  geometricData l =
    (lorentzianDim l, lorentzianHolonomyLabel l, lorentzianCausalClass l)

-- ---------------------------------------------------------------------------
-- Family IV: principal bundles and connections (paper Section 7.3, DEF-029)
-- ---------------------------------------------------------------------------

-- | Paper Section 7.3: a principal U(1)-bundle over S^2, classified by its
-- first Chern class in H^2(S^2; Z) = Z.
data PrincipalU1Bundle = PrincipalU1Bundle
  { baseLabel :: String
  , firstChernClass :: Integer
  } deriving (Eq, Show)

instance PhysicalSystem PrincipalU1Bundle where
  type StateSpace PrincipalU1Bundle = (String, Integer)
  type Observables PrincipalU1Bundle = String
  type Dynamics PrincipalU1Bundle = String
  type Symmetries PrincipalU1Bundle = String
  type Composition PrincipalU1Bundle = Construction
  stateSpace b = (baseLabel b, firstChernClass b)
  observables _ = "gauge-invariant functionals of the connection"
  dynamics _ = "parallel transport along the connection"
  symmetries _ = "gauge group of the bundle"
  composition _ = TensorProduct

instance FamilyPrincipalBundlesConnections PrincipalU1Bundle where
  type BundleConnectionData PrincipalU1Bundle = (String, Integer, [CharacteristicClass])
  bundleConnectionData b = (baseLabel b, firstChernClass b, [Chern])

-- ---------------------------------------------------------------------------
-- Family V: probability and measure-theoretic structures (paper Section 8.1, DEF-030)
-- ---------------------------------------------------------------------------

-- | Paper Section 8.1: the binary statistical system, with the Fisher metric
-- in the coordinate p given by 1 / (p (1 - p)).
data ClassicalStatisticalSystem = ClassicalStatisticalSystem
  { outcomeCount :: Int
  , probabilityCoordinate :: Double
  } deriving (Eq, Show)

-- | Paper Section 8.1: the Fisher metric component g_pp = 1 / (p (1 - p)) of
-- the binary system. Returns Nothing outside the open interval (0,1).
binaryFisherMetric :: ClassicalStatisticalSystem -> Maybe Double
binaryFisherMetric s
  | p <= 0 || p >= 1 = Nothing
  | otherwise = Just (1 / (p * (1 - p)))
  where
    p = probabilityCoordinate s

instance PhysicalSystem ClassicalStatisticalSystem where
  type StateSpace ClassicalStatisticalSystem = (Int, Double)
  type Observables ClassicalStatisticalSystem = String
  type Dynamics ClassicalStatisticalSystem = String
  type Symmetries ClassicalStatisticalSystem = String
  type Composition ClassicalStatisticalSystem = Construction
  stateSpace s = (outcomeCount s, probabilityCoordinate s)
  observables _ = "real functions on the outcome set"
  dynamics _ = "Markov kernel"
  symmetries _ = "stochastic maps preserving the metric"
  composition _ = TensorProduct

instance FamilyProbabilityMeasure ClassicalStatisticalSystem where
  type ProbabilityMeasureData ClassicalStatisticalSystem = Maybe Double
  probabilityMeasureData = binaryFisherMetric

-- ---------------------------------------------------------------------------
-- Family VI: topological and higher-categorical structures (paper Section 10, DEF-031)
-- ---------------------------------------------------------------------------

-- | Paper Section 10: a topological quantum field theory record, carrying the
-- fully dualizable object that the claimed classification names.
data TopologicalQFTSystem = TopologicalQFTSystem
  { tqftDimension :: Int
  , fullyDualizableLabel :: String
  } deriving (Eq, Show)

instance PhysicalSystem TopologicalQFTSystem where
  type StateSpace TopologicalQFTSystem = (Int, String)
  type Observables TopologicalQFTSystem = String
  type Dynamics TopologicalQFTSystem = String
  type Symmetries TopologicalQFTSystem = String
  type Composition TopologicalQFTSystem = Construction
  stateSpace t = (tqftDimension t, fullyDualizableLabel t)
  observables _ = "topological invariants of the manifold"
  dynamics _ = "gluing of cobordisms"
  symmetries _ = "diffeomorphism group of the bordism"
  composition _ = TensorProduct

instance FamilyTopologicalHigherCategorical TopologicalQFTSystem where
  type HigherCategoricalData TopologicalQFTSystem = (Int, String)
  higherCategoricalData t = (tqftDimension t, fullyDualizableLabel t)

-- ---------------------------------------------------------------------------
-- Family VII: dynamical systems and operator semigroups (paper Section 11, DEF-032)
-- ---------------------------------------------------------------------------

-- | Paper Theorem 11.1 and Proposition 11.2: a completely positive map
-- recorded by its minimal Kraus list. Proposition 11.2 is that the Kraus rank
-- is constant on a positive-dimensional family of unitary channels.
data QuantumChannelSystem = QuantumChannelSystem
  { krausOperators :: [[ComplexPair]]
    -- ^ One minimal Kraus list per channel; the list length is the Kraus rank.
  , channelLabel :: String
  } deriving (Eq, Show)

-- | A 2 by 2 complex matrix entry pair, enough to carry the unitary channels
-- of Proposition 11.2 without a linear algebra dependency.
data ComplexPair = ComplexPair Double Double
  deriving (Eq, Show)

instance PhysicalSystem QuantumChannelSystem where
  type StateSpace QuantumChannelSystem = [ComplexPair]
  type Observables QuantumChannelSystem = String
  type Dynamics QuantumChannelSystem = String
  type Symmetries QuantumChannelSystem = String
  type Composition QuantumChannelSystem = Construction
  stateSpace q = concat (krausOperators q)
  observables _ = "completely positive maps on the algebra"
  dynamics _ = "Stinespring dilation"
  symmetries _ = "unitary freedom of the minimal dilation"
  composition _ = TensorProduct

instance FamilyDynamicalSemigroups QuantumChannelSystem where
  type DynamicalSemigroupData QuantumChannelSystem = Int
  dynamicalSemigroupData = krausRankOf

-- | Paper Proposition 11.2: the Kraus rank is the length of a minimal Kraus
-- list. It is an invariant of the normal form and not an isomorphism
-- invariant of the channel.
krausRankOf :: QuantumChannelSystem -> Int
krausRankOf q = maximum (1 : map length (krausOperators q))

-- | Paper Proposition 11.2: the family of unitary channels Phi_U(X) = U X U*
-- for U in U(2), each with Kraus rank one. The returned list has one entry
-- per sampled phase, and every entry has Kraus rank one, which is the
-- non-injectivity the proposition records. This is a model of the family and
-- not a proof of the proposition.
unitaryChannelFamily :: [Double] -> QuantumChannelSystem
unitaryChannelFamily phases =
  QuantumChannelSystem
    { krausOperators =
        [ [ComplexPair (cos th) 0, ComplexPair 0 (sin th)]
        | th <- phases ]
    , channelLabel = "unitary channels on M_2"
    }

-- ---------------------------------------------------------------------------
-- Family VIII: tensor categories and compositional structures (paper Section 12, DEF-033)
-- ---------------------------------------------------------------------------

-- | Paper Section 12: a symmetric tensor category record carrying the
-- structural layer it preserves, which is the load-bearing datum of
-- Theorem 12.1.
data SymmetricTensorCategorySystem = SymmetricTensorCategorySystem
  { categoryLabel :: String
  , preservedLayers :: [PreservedStructure]
  } deriving (Eq, Show)

instance PhysicalSystem SymmetricTensorCategorySystem where
  type StateSpace SymmetricTensorCategorySystem = String
  type Observables SymmetricTensorCategorySystem = String
  type Dynamics SymmetricTensorCategorySystem = String
  type Symmetries SymmetricTensorCategorySystem = [PreservedStructure]
  type Composition SymmetricTensorCategorySystem = Construction
  stateSpace = categoryLabel
  observables _ = "objects and morphisms of the category"
  dynamics _ = "tensor functor"
  symmetries = preservedLayers
  composition _ = TensorProduct

instance FamilyTensorCategoriesComposition SymmetricTensorCategorySystem where
  type TensorCategoryData SymmetricTensorCategorySystem = [PreservedStructure]
  tensorCategoryData = preservedLayers

-- ---------------------------------------------------------------------------
-- Family IX: discrete combinatorial structures (paper Section 9, DEF-034)
-- ---------------------------------------------------------------------------

-- | Paper Section 9.1: a lattice gauge configuration on a finite graph.
data LatticeGaugeSystem = LatticeGaugeSystem
  { latticeVertices :: Int
  , latticeEdges :: Int
  , wilsonLoopLabels :: [String]
  } deriving (Eq, Show)

instance PhysicalSystem LatticeGaugeSystem where
  type StateSpace LatticeGaugeSystem = (Int, Int)
  type Observables LatticeGaugeSystem = [String]
  type Dynamics LatticeGaugeSystem = String
  type Symmetries LatticeGaugeSystem = String
  type Composition LatticeGaugeSystem = Construction
  stateSpace l = (latticeVertices l, latticeEdges l)
  observables = wilsonLoopLabels
  dynamics _ = "transfer operator"
  symmetries _ = "gauge group at the vertices"
  composition _ = DirectSum

instance FamilyDiscreteCombinatorial LatticeGaugeSystem where
  type CombinatorialData LatticeGaugeSystem = (Int, Int, [String])
  combinatorialData l = (latticeVertices l, latticeEdges l, wilsonLoopLabels l)

-- ---------------------------------------------------------------------------
-- Family X: derived and homotopical structures (paper Section 14, DEF-035)
-- ---------------------------------------------------------------------------

-- | Paper Section 14: a derived algebra record carrying the tame or wild
-- class named by the dichotomy.
data DerivedAlgebraSystem = DerivedAlgebraSystem
  { derivedLabel :: String
  , derivedTameOrWild :: String
  } deriving (Eq, Show)

instance PhysicalSystem DerivedAlgebraSystem where
  type StateSpace DerivedAlgebraSystem = String
  type Observables DerivedAlgebraSystem = String
  type Dynamics DerivedAlgebraSystem = String
  type Symmetries DerivedAlgebraSystem = String
  type Composition DerivedAlgebraSystem = Construction
  stateSpace = derivedLabel
  observables _ = "derived category of modules"
  dynamics _ = "derived equivalence"
  symmetries _ = "derived autoequivalences"
  composition _ = DirectSum

instance FamilyDerivedHomotopical DerivedAlgebraSystem where
  type DerivedHomotopicalData DerivedAlgebraSystem = String
  derivedHomotopicalData = derivedTameOrWild

-- ---------------------------------------------------------------------------
-- Family tags, ontology identifiers, and classification records
-- ---------------------------------------------------------------------------

-- | Paper Table 4 row 4: the family tag of each record, paired with the
-- ontology identifier the taxonomy attaches to it. The mapping is metadata and
-- carries no mathematical claim.
familyTagOf :: String -> Maybe (StructuralFamily, String)
familyTagOf name = lookup name table
  where
    table =
      [ ("symplectic", (FamilyI, familyDefId FamilyI))
      , ("operator-algebra", (FamilyII, familyDefId FamilyII))
      , ("geometric", (FamilyIII, familyDefId FamilyIII))
      , ("bundle", (FamilyIV, familyDefId FamilyIV))
      , ("probability", (FamilyV, familyDefId FamilyV))
      , ("topological", (FamilyVI, familyDefId FamilyVI))
      , ("semigroup", (FamilyVII, familyDefId FamilyVII))
      , ("tensor-category", (FamilyVIII, familyDefId FamilyVIII))
      , ("combinatorial", (FamilyIX, familyDefId FamilyIX))
      , ("derived", (FamilyX, familyDefId FamilyX))
      ]

-- | Paper Table 4 row 4: the full list of family tags and their ontology
-- identifiers, in family order.
familyDefIds :: [(StructuralFamily, String)]
familyDefIds = [ (f, familyDefId f) | f <- [minBound .. maxBound] ]

-- | Paper Definition 5.1: the four achievement kinds of a classified sector.
data AchievementKind
  = CompleteParameterized
  | CompleteUnparameterized
  | CompleteAsObstruction
  | Impossible
  deriving (Eq, Ord, Show, Enum, Bounded)

-- | Paper Section 15: the five-field classification record a later volume
-- writes against the family rows.
data ClassificationRecord = ClassificationRecord
  { recordFamily :: StructuralFamily
  , recordSector :: String
  , recordInvariant :: Maybe ClassifyingInvariant
  , recordEquivalence :: EquivalenceKind
  , recordScope :: String
  , recordKind :: AchievementKind
  } deriving (Eq, Show)

exec
/usr/local/bin/zsh -lc "sed -n '210,520p' papers/latex/vol-02-structural-families.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:

Three family records apply the discipline of \Cref{sec:discipline}. Each names the invariant data it supplies, the equivalence in force, and the scope in which the data is complete; where a field is absent the record says so.

\subsection{A cotangent bundle in the symplectic family}
\label{sec:cotangent}

Let $Q$ be a smooth manifold and $M = T^*Q$ with its canonical symplectic form $\omega = d\theta$, where $\theta$ is the tautological one-form. The record is: state space $M$, observables $C^\infty(M)$, dynamics the Hamiltonian flow of a smooth function $H$, symmetries the cotangent lifts of diffeomorphisms of $Q$ preserving $H$, and composition the product of systems with the product symplectic form.

Local data is empty by \Cref{prop:globality}. The equivalence in force is symplectomorphism of the total space. The record supplies a global invariant and not a classifying one, and it says so.

\begin{proposition}[Global invariants of a cotangent bundle]
\label{prop:cotangent}
The zero section of $T^*Q$ is a deformation retract of $T^*Q$. Consequently the homotopy type of the symplectic manifold $T^*Q$ equals the homotopy type of $Q$, and every homotopy invariant of $Q$ is a global invariant of the symplectic record.
\end{proposition}

\begin{proof}
The maps $r_t \colon T^*Q \to T^*Q$ given by $r_t(x, \xi) = (x, t\xi)$ for $t \in [0,1]$ form a deformation retraction: each $r_t$ is smooth, $r_1$ is the identity, $r_0$ factors through the zero section, and $r_s \circ r_t = r_{st}$ for $s, t \in [0,1]$. The zero section is diffeomorphic to $Q$, so $T^*Q$ and $Q$ are homotopy equivalent and share all homotopy invariants.
\end{proof}

\Cref{prop:cotangent} supplies an invariant and not a complete one. Two homotopy-equivalent bases need not have symplectomorphic cotangent bundles, and the record also carries the Hamiltonian $H$, which the homotopy type does not see. The scope of the record is therefore the homotopy data of the base, and the record does not claim more.

\subsection{A finite-dimensional quantum system}
\label{sec:worked-calg}

Take $A = M_2(\mathbb{C}) \oplus \mathbb{C}$, the observable algebra of a two-level system together with a classical bit. The record is: state space the space of block-diagonal density matrices $\rho_2 \oplus p$, observables $A$, dynamics a one-parameter group of $*$-automorphisms, symmetries the unitary group of $A$ acting by conjugation, and composition the tensor product of algebras. The state space is the state space of $A$ and not of $M_3(\mathbb{C})$, because the states of a direct sum are pairs of states of the summands.

By \Cref{thm:calg} the classifying invariant of the observable algebra is the dimension vector, here the multiset $\{2, 1\}$ of matrix sizes. That invariant classifies the algebra and not the full record, which also carries dynamics and composition data, as \Cref{prop:components} records. The invariant range at total complex dimension five is the set of multisets of positive integers whose squares sum to five, and there are two of them: $\{2, 1\}$ from $4 + 1$, and $\{1, 1, 1, 1, 1\}$ from five copies of $1$. At total dimension four there are two classes as well, given by $\{2\}$ and $\{1, 1, 1, 1\}$. The count of classes grows with the dimension, and \Cref{thm:sharpness} bounds it by the size of the range.

\subsection{Line bundles over the two-sphere}
\label{sec:worked-bundle}

Let $G = U(1)$ and let the base be $X = S^2$. The record is: state space the space of connections on a principal $U(1)$-bundle, observables the gauge-invariant functionals, dynamics the parallel transport of a chosen connection, symmetries the gauge group, and composition the tensor product of bundles.

By \Cref{thm:bundles} the classifying invariant of the underlying topological bundle is the first Chern class, which takes values in $H^2(S^2; \mathbb{Z}) \cong \mathbb{Z}$. The invariant range is countably infinite and every integer is attained, so the topological sector is classified and not finite. It is an instance of the distinction in \Cref{cor:parameterization}: the classification is complete, and the range is an explicit discrete group in which the attained values are described. The invariant classifies the bundle and not the space of connections on it, which is an affine space and carries no such discrete invariant.

\subsection{Constructions acting on invariants}
\label{sec:constructions-on-invariants}

A family record does not automatically extend to the closure of its family, because the constructions move the invariant. The finite-dimensional operator-algebra sector makes this concrete.

\begin{proposition}[Induced operations on the dimension vector]
\label{prop:induced}
Let $A$ and $B$ be unital finite-dimensional complex $C^*$-algebras with dimension vectors $\{n_1, \dots, n_k\}$ and $\{m_1, \dots, m_l\}$. Then the dimension vector of $A \oplus B$ is the multiset union $\{n_1, \dots, n_k, m_1, \dots, m_l\}$, and the dimension vector of $A \otimes B$ is the multiset $\{n_i m_j \colon 1 \leq i \leq k,\ 1 \leq j \leq l\}$. Consequently the range of the classifying invariant of \Cref{thm:calg} is closed under these two operations, and the invariant record of a composite system is computed from the records of the summands.
\end{proposition}

\begin{proof}
The Wedderburn decomposition of a direct sum of semisimple algebras is the multiset union of the Wedderburn decompositions of the summands, so the matrix sizes add in the multiset sense. For the tensor product, $M_a(\mathbb{C}) \otimes M_b(\mathbb{C}) \cong M_{ab}(\mathbb{C})$ by the standard identification of the tensor product of matrix algebras, and tensor product distributes over direct sums in both variables. Collecting the simple summands of $A \otimes B$ gives exactly the multiset of products $n_i m_j$. Both constructions therefore compute a new classifying invariant from the old ones without reference to any other data.
\end{proof}

\Cref{prop:induced} is the sense in which a classifying invariant can be functorial for the admissible constructions. It also marks a limit: the same computation in a sector where no classifying invariant is on record cannot be carried out, and the closure of such a sector is unrecorded.

\section{Morphisms and invariants}
\label{sec:morphisms}

The invariant discipline has to say what happens when two records are related by a morphism rather than an equivalence. The ontology distinguishes coarse-graining, equivalence, embedding, duality, and limiting procedures, and the invariant does not behave the same way along all five.

\begin{proposition}[Invariance under equivalence only]
\label{prop:invariance}
Let $(\mathfrak{F}, V, I)$ be a family record and let $f \colon P \to Q$ be an invertible morphism representing exact equivalence. Then $I(P) = I(Q)$. The conclusion fails for coarse-grainings and for embeddings in general.
\end{proposition}

\begin{proof}
The first claim is the defining condition of \Cref{def:family-record}: $I$ is constant on $\simeq$-classes, and an invertible equivalence morphism places $P$ and $Q$ in one class. For the negative claim, a coarse-graining forgets microscopic detail, and two systems that coarse-grain to the same macroscopic record need not be equivalent. The dimension vector of \Cref{thm:calg} is a classifying invariant only for the finite-dimensional algebra itself; the same observable algebra can carry inequivalent states and dynamics, so coarse-grained records identify objects that $I$ separates. An embedding places $P$ inside a larger system, and the invariant of the larger system is computed by \Cref{prop:induced} and not inherited from $P$.
\end{proof}

\begin{remark}[Dualities]
\label{rem:duality}
A duality is generally invertible only after passage to an appropriate opposite or dual category, and it must state which structure it preserves. The Gelfand correspondence of Table~\ref{tab:independence} is an anti-equivalence, and it identifies invariant records on the two sides up to the stated opposition. A duality that does not name the preserved structure cannot be used to transfer a classification, for the reason given in \Cref{thm:etingof-gelaki}.
\end{remark}

\begin{remark}[Limiting procedures]
\label{rem:limits}
A limiting procedure produces a new object, and the invariant of the limit is not in general the limit of the invariants. Continuum limits are the load-bearing case: results proved on a lattice in a restricted regime do not by themselves close the continuum limit, and the invariant record of the limiting object must be established on its own terms.
\end{remark}

\subsection{Recognition data}
\label{sec:recognition}

The atlas discipline separates three tasks that are easy to conflate \cite{atlas}. Parameterization is an explicit uniform description of the classes. Classification is an exhaustive list. Recognition is an algorithm that identifies which class a given object lies in, by computing its invariant and comparing.

\begin{proposition}[Recognition cost]
\label{prop:recognition-cost}
Let $(\mathfrak{F}, V, I)$ be an invariant-complete family record with $V$ a set carrying decidable equality, and assume $I(P)$ is computable from a finite presentation of $P$. Recognition of the class of $P \in \mathfrak{F}$ reduces to computing $I(P)$ and comparing it with the recorded values, and it costs at most one invariant computation plus one comparison per candidate class. If in addition the list of attained values is finite and stored, recognition is an algorithm.
\end{proposition}

\begin{proof}
Injectivity of $[P] \mapsto I(P)$ from \Cref{thm:sharpness} gives that $I(P)$ determines the class. The procedure computes $I(P)$ from the presentation of $P$, which the hypothesis makes possible, and looks the value up in the stored list. Decidable equality decides the comparison. The cost claim is the cost of the two steps. The computability hypothesis is doing real work: decidable equality on a finite range does not make the map $I$ computable, and without the hypothesis the procedure is not defined on presentations at all.
\end{proof}

Recognition is therefore the weakest of the three tasks when the invariant is computable, and it is the one the atlas supplies in practice \cite{atlas}. Parameterization is the strongest. The three are separate achievements, and a family row that reports one of them does not report the others.

\section{Family I: symplectic and Poisson structures}
\label{sec:family1}

This family singles out classical mechanics. Its defining structural data is a symplectic or Poisson state space; systems in it carry function algebras of observables and Hamiltonian dynamics \cite{poisson}. A record whose state space is symplectic belongs to this family whatever else its components carry.

The local picture is closed. Darboux's theorem gives a normal form and \Cref{prop:globality} extracts its classification consequence. For Poisson manifolds the local picture is also closed and it is not empty: near a point of rank $2k$ a Poisson manifold splits as a symplectic factor times a transverse Poisson factor \cite{poisson}. The symplectic leaves foliate the manifold, and on the dual of a Lie algebra the leaves of the Kirillov-Kostant-Souriau structure are the coadjoint orbits \cite{poisson}.

\begin{theorem}[Poisson local models]
\label{thm:weinstein}
Near a point of rank $2k$ a Poisson manifold is locally isomorphic to a product of a symplectic manifold of dimension $2k$ and a Poisson manifold whose linearization vanishes at the point \cite{weinstein}. The symplectic leaves form a foliation, and two Poisson manifolds with isomorphic local models need not be globally isomorphic.
\end{theorem}

The global picture is where the family's classification content lives, and the corpus does not fix a list of global invariants. Candidates in ordinary use are the de Rham class of the symplectic form, Chern classes of compatible almost complex structures, and flux data. The periodic chart records ``topology of $\omega$'' for this row. Making that phrase precise is an open deliverable.

The link from this family to the operator-algebra family through deformation quantization is a research program and not an equivalence theorem. No result below depends on it.

\section{Family II: Hilbert spaces and operator algebras}
\label{sec:family2}

This family singles out quantum mechanics. Its defining structural data is a $C^*$-algebra or von Neumann algebra of observables, on a Hilbert-space state space, with tensor product as the composition rule. A record whose observable algebra is noncommutative belongs to this family whatever else its components carry.

The finite-dimensional sector is the model case for the whole paper.

\begin{theorem}[Structure of finite-dimensional unital complex $C^*$-algebras]
\label{thm:calg}
Let $A$ be a unital finite-dimensional complex $C^*$-algebra. Then $A \cong \bigoplus_{i=1}^{k} M_{n_i}(\mathbb{C})$ for a unique multiset $\{n_1, \dots, n_k\}$ of positive integers, and that multiset determines $A$ up to $*$-isomorphism. The invariant range of the sector of all such algebras is the countable set of finite multisets of positive integers. At fixed total complex dimension $d = \sum_i n_i^2$ the attained values are finite in number, and \Cref{thm:sharpness} bounds the number of classes at that dimension accordingly.
\end{theorem}

\begin{proof}[Proof sketch]
The Jacobson radical of a $C^*$-algebra is a closed two-sided $*$-ideal of topologically nilpotent elements and is zero, so $A$ is semisimple. The Artin-Wedderburn theorem then gives $A \cong \bigoplus_i M_{n_i}(D_i)$ with each $D_i$ a division algebra over $\mathbb{C}$. Every finite-dimensional division algebra over $\mathbb{C}$ equals $\mathbb{C}$, because $\mathbb{C}$ is algebraically closed and the minimal polynomial of any element splits. The $C^*$-identity then determines the $*$-structure on each matrix summand, and an isomorphism of the algebras that respects the $*$-structure permutes the simple summands. Uniqueness of the multiset is the uniqueness of the Wedderburn decomposition of a semisimple algebra. At fixed total dimension $d$ the number of multisets whose squares sum to $d$ is finite, which is the stated bound.
\end{proof}

\Cref{thm:calg} is the sector in which the invariant discipline behaves exactly as intended: one named invariant, a finite range, a complete determination. It is also the sector that the later volume on irreducibility and decomposition takes as its model theorem.

The infinite-dimensional picture is different in kind. Amenable factors are classified by Murray-von Neumann type and Connes invariants \cite{vnalg}. Beyond the amenable class, there are uncountably many pairwise non-isomorphic separable type $\mathrm{II}_1$ factors, constructed by McDuff \cite{mcduff}. By \Cref{thm:sharpness} no invariant with countable range classifies that sector. That consequence is what uncountability alone delivers, and a stronger obstruction is known: the isomorphism relation on separable type $\mathrm{II}_1$ factors is not classifiable by countable structures, in the sense of Borel reducibility \cite{sasyk}. The parametric question is therefore closed in the negative rather than left open. The row of the family table records the countable-invariant obstruction and cites the stronger one.

\begin{remark}[What the impossibility does and does not say]
\label{rem:mcduff}
The impossibility is a theorem of McDuff \cite{mcduff} about the sector of all separable type $\mathrm{II}_1$ factors. It does not forbid restricted classification under extra hypotheses such as amenability, and it does not bear on the finite-dimensional sector of \Cref{thm:calg}. The row of the family table for this family records all three situations at once, which is why a single status token per family is not enough.
\end{remark}

Completely positive maps and quantum channels sit in this family through Stinespring dilation and the Kraus form \cite{stinespring,qchannel}. The classification status of that data is treated in \Cref{sec:family7}, where the maps are the objects rather than the ambient structure.

\section{Family III: smooth manifolds and geometric structures}
\label{sec:family3}

This family singles out relativity. Its defining structural data is a smooth manifold with additional geometric structure, carrying function or operator algebras of observables and a flow or field equation as dynamics.

Three classification results are on record and each holds in a restricted regime. The holonomy groups of connected Lorentzian manifolds of signature $(1, n-1)$ are classified by a Berger-list analogue, with realizing metrics constructed \cite{holonomy}. The causal hierarchy of spacetimes is complete as a ladder of conditions from the weakest to global hyperbolicity \cite{causal}. Closed three-manifolds are classified up to homeomorphism by geometrization: each decomposes into pieces carrying exactly one of eight Thurston geometries \cite{geometrization}.

Dimension four is the boundary. Only restricted classes of four-manifolds are classified, by eighteen model geometries together with one countably infinite family, and recognition is not algorithmic: the homeomorphism problem for a connected sum of nine copies of $S^2 \times S^2$ is undecidable \cite{tancer}.

\begin{proposition}[Recognition without classification]
\label{prop:recognition}
There exist four-manifolds for which homeomorphism is undecidable. Consequently no algorithm whose output is a classifying invariant in a decidable range can classify all four-manifolds, and any classification statement in this regime must restrict the class of manifolds under consideration.
\end{proposition}

\begin{proof}
Undecidability of the homeomorphism problem for the stated family of four-manifolds is proved in \cite{tancer}, and the analogous undecidability for group-theoretic Markov properties is the classical Adyan-Rabin theorem \cite{adyanrabin}. An algorithm producing a decidable classifying invariant would decide homeomorphism by comparing outputs, which contradicts undecidability. So no such algorithm exists on the unrestricted class.
\end{proof}

\section{Family IV: principal bundles and connections}
\label{sec:family4}

This family represents gauge theories. Its state spaces are spaces of connections on a principal bundle, its observables are gauge-invariant functionals or operator algebras, and its symmetries are gauge group actions.

This family is the one in which the invariant discipline is closest to its classical source.

\begin{theorem}[Classification of principal bundles]
\label{thm:bundles}
Let $X$ be a paracompact Hausdorff space and $G$ a topological group. The isomorphism classes of principal $G$-bundles over $X$ are in bijection with the homotopy classes of maps $X \to BG$, where $BG$ is a classifying space for $G$. Characteristic classes of these bundles are exactly the pullbacks of universal classes in $H^*(BG)$, including Stiefel-Whitney, Pontryagin, Euler, and Chern classes. The Dixmier-Douady class is the corresponding invariant for $U(1)$-bundle gerbes, which lie in $H^3(X; \mathbb{Z})$, and it classifies those rather than ordinary principal bundles.
\end{theorem}

The invariant range here is the homotopy set $[X, BG]$ with its characteristic-class data, and \Cref{thm:bundles} states that the invariant is complete for this sector, so the record is invariant-complete in the sense of \Cref{def:sector} for every base and every group to which the theorem applies. The shape of the range varies: it is finite for some bases and groups and infinite for others, and \Cref{thm:sharpness} bounds the number of classes by the size of the range in each case.

Anomalies in this family are classified as obstructions rather than as objects. The fermionic anomaly is the non-trivializability of the determinant or Pfaffian line of the Dirac operator, and the gauge anomaly is a cohomological obstruction; quantization exists only when the relevant obstructions vanish \cite{anomaly}. A classification of obstructions is a complete classification of the cases in which the theory exists.

\section{Family V: probability and measure-theoretic structures}
\label{sec:family5}

This family represents statistical physics. Its state spaces are spaces of probability measures or density operators, its observables are measurable functions or operators, and its composition rule is product measure or tensor product.

The classical row carries the one uniqueness result in the ten families.

\begin{theorem}[Chentsov]
\label{thm:chentsov}
On the classical statistical state space of a finite sample space, the Fisher metric is the unique Riemannian metric, up to a positive constant factor, that is monotone under stochastic maps. The uniqueness is recorded in the survey literature as the classical anchor of the monotone-metric classification \cite{petz}, and the quantum analogue there is parametric rather than unique.
\end{theorem}

The quantum analogue fails to be unique. Monotone metrics on quantum state spaces are classified parametrically by operator monotone functions, which form a continuum and not a finite list \cite{petz}. Classical uniqueness therefore does not transfer to the quantum case, and any classification statement in this family must record which side of that line it stands on.

\begin{remark}[Scope of the uniqueness]
\label{rem:chentsov-scope}
The uniqueness is a statement about metrics monotone under stochastic maps on the classical state space. It is not a classification of classical statistical systems, and it is not a statement about quantum state spaces. Uniqueness and classification are separate achievements, as \Cref{cor:parameterization} records.
\end{remark}

\subsection{A binary statistical system}
\label{sec:binary}

Take the state space of probability vectors $(p, 1-p)$ with $p \in (0,1)$ and the observable algebra of real functions on $\{0, 1\}$. The Fisher metric in the coordinate $p$ is
\[
g_{pp} = \frac{1}{p(1-p)}.
\]
Up to a positive constant factor this is the only Riemannian metric on this state space that is monotone under stochastic maps, by \Cref{thm:chentsov}. What is unique is the metric as ambient geometry on the state space, and not the physical system record. The record carries a state space, a two-point function algebra of observables, and a Markov kernel as dynamics, and the metric does not classify the record: two binary systems with different kernels are not equivalent, and both carry the same metric up to scale. This sector therefore has no classifying invariant on record, and the uniqueness of the metric is a statement about geometry rather than about classification.

The quantum analogue of the same two-point system has a state space of $2 \times 2$ density matrices and a continuum of monotone metrics, parametrized by operator monotone functions \cite{petz}. The classical row is therefore a uniqueness statement of a kind the quantum row does not have.

\section{Family VI: topological and higher-categorical structures}
\label{sec:family6}

This family represents topological quantum field theories. Its state spaces are spaces of fields on a manifold, its observables are topological invariants, and its composition rule is gluing of manifolds.

Functorial topological quantum field theory is tractable under the Atiyah axioms, in contrast to the general non-topological case \cite{tqft}. The extended case is where a classification claim exists and where the proof status matters.

\begin{remark}[The cobordism claim]
\label{rem:cobordism}
It is claimed that $n$-dimensional unitary extended topological quantum field theories are weak $n$-functors out of the free stable weak $n$-category with duals, and that they are classified by fully dualizable objects \cite{baezdolan,lurie}. The 2009 proof is described by its author as an informal sketch of a proof \cite{lurie}. The claim is recorded here as a claim and not as a theorem, and it is not placed in a theorem environment for that reason.
\end{remark}

\begin{remark}[Proof gap]
\label{rem:proof-gap}
The classification claim of \Cref{rem:cobordism} is recorded as claimed and not as complete. Later low-dimensional cases have been proved in the literature, and which cases are complete is a matter for verification case by case. A family row that reads ``claimed'' is a family row that should not carry load-bearing dependencies.
\end{remark}

\section{Family VII: dynamical systems and operator semigroups}
\label{sec:family7}

This family represents dissipative and open systems. Its state spaces are spaces of states, its observables are operators or algebras, and its dynamics is a semigroup of maps or a generator.

No classification theorem for this family is on record in the surveyed literature. What is on record is a normal form.

\begin{theorem}[Stinespring]
\label{thm:stinespring}
Every completely positive map admits a minimal Stinespring dilation, unique up to unitary equivalence of the dilating space \cite{stinespring-primary}. The associated Kraus form is a normal form, and the number of Kraus operators in a minimal dilation is an invariant of the dilation.
\end{theorem}

The next proposition is the precise sense in which that invariant falls short.

\begin{proposition}[Kraus rank is not injective on channels]
\label{prop:kraus}
Fix the equivalence relation on channels to be equality of completely positive maps. Let $\Phi_U \colon M_2(\mathbb{C}) \to M_2(\mathbb{C})$ be the channel $\Phi_U(X) = U X U^*$ for $U \in U(2)$. Every $\Phi_U$ has Kraus rank one, and the set of distinct channels of this form is in bijection with $PU(2)$, which is not a point. The assignment from channels to Kraus rank is therefore not injective under equality of maps, and Kraus rank is not a classifying invariant for this family under that relation.
\end{proposition}

\begin{proof}
For each $U$ the single Kraus operator $U$ realizes $\Phi_U$, and no shorter dilation exists because $\Phi_U$ is nonzero. So the Kraus rank is one for every $U$. Two operators $U, U'$ give the same map exactly when $UXU^* = U'XU'^*$ for all $X \in M_2(\mathbb{C})$, which forces $U' = \lambda U$ for a scalar $\lambda$ of unit modulus. The distinct channels of this form are therefore parametrized by $PU(2)$, which is positive dimensional, and the fiber of the rank map over $1$ is not a point.
\end{proof}

The choice of equivalence in \Cref{prop:kraus} is load-bearing and the conclusion changes with it. Under simultaneous unitary conjugacy the classes of these channels are the conjugacy classes of $PU(2)$, parametrized by a rotation angle in $[0, \pi]$, and rank is still not complete on them. Under two-sided conjugacy by automorphisms of $M_2(\mathbb{C})$ every unitary channel is isomorphic to the identity channel, so this particular family is not an isomorphism counterexample in that sense. What the proposition establishes is the narrow and sufficient claim that one scalar of a normal form does not classify: recording that scalar as though it were an isomorphism classification would produce a false row in the family table.

\section{Family VIII: tensor categories and compositional structures}
\label{sec:family8}

This family represents quantum information. Its objects are tensor categories, its morphisms are tensor functors, and its composition rule is the monoidal product.

Two islands are classified under explicit hypotheses. Symmetric tensor $*$-categories with conjugates, direct sums, subobjects, and $\mathrm{End}(1) = \mathbb{C}$ are equivalent to finite-dimensional unitary representations of a compact supergroup, unique up to isomorphism \cite{dr,dhr}. Symmetric tensor categories of subexponential growth in characteristic zero are supergroup representation categories \cite{deligne}. Both statements carry their hypotheses, and dropping a hypothesis produces a false statement.

The general case is open. Every fusion category is the representation category of a weak Hopf algebra, and the classification of fusion categories is open \cite{fusion}. The constraint on any equivalence used in this family is a theorem and not a convention.

\begin{theorem}[Structure preservation is load-bearing]
\label{thm:etingof-gelaki}
There exist finite groups that are not isomorphic and whose representation categories are equivalent as plain tensor categories. Consequently an equivalence that forgets the symmetric structure cannot recover the group, and any classification in this family must state which layer of structure its equivalence preserves \cite{etingof}.
\end{theorem}

\Cref{thm:etingof-gelaki} is a negative theorem and it is used here as a discipline rule: an equivalence record that does not name the preserved structure is incomplete.

\section{Family IX: discrete combinatorial structures}
\label{sec:family9}

This family represents lattice and network models. Its state spaces are configuration spaces on a graph or lattice, its observables are local functions, and its composition rule is disjoint union or tensor product.

The proved results are regime-restricted and the impossibility results are not. Lattice gauge results hold in restricted regimes and do not by themselves close a continuum limit. The obstructions recorded against this family come from wild representation theory, and the underlying mathematics is commutative algebra and equivariant homotopy theory, which the taxonomy places in Family X. On the commutative side, rank-two isomorphism classes of maximal Cohen-Macaulay modules over the generic determinantal ring admit no parameterization by a finite-dimensional variety \cite{buchweitz}. On the equivariant side, the compact modules over the equivariant Eilenberg-MacLane spectrum $H\underline{\mathbb{F}}_p$ at an odd prime $p$ are wild \cite{grevstad}, and the qualifier is load-bearing: modules over the group ring $\mathbb{F}_p[C_p]$ have finite representation type, so the claim is false if the spectrum coefficient is dropped. A companion boundary is algorithmic and lives in this family: an isomorphism test running in polynomial time exists for groups that are tame extensions, so the tame and wild regimes are separated by an algorithmic boundary as well \cite{grochow}.

\begin{corollary}
\label{cor:wild}
By \Cref{thm:sharpness}, a sector whose classes admit no parameterization by a finite-dimensional variety admits no invariant-complete record whose range is a finite-dimensional variety. The obstruction is a statement about the range of any candidate invariant.
\end{corollary}

\subsection{A lattice gauge configuration}
\label{sec:lattice}

Take a finite graph $\Lambda$ with a compact structure group $G$ and a configuration space of $G$-valued edge assignments modulo the gauge action at the vertices. The record is: state space the quotient configuration space, observables the gauge-invariant functions generated by Wilson loops, dynamics the transfer operator, symmetries the gauge group, and composition the disjoint union of graphs.

The tame side of this sector admits named invariants: the holonomy of each closed loop, and the character of the representation assigned to it. The wild side does not, and \Cref{cor:wild} records what that absence means for any candidate invariant. Algebraic quantum field theory axiomatizes a theory as a local net of operator algebras \cite{haagkastler}, and that framework is where the lattice sector of this family meets the operator-algebra family. Lattice results proved in restricted regimes do not by themselves close the continuum limit, and the invariant record of the limiting object is a separate matter, as \Cref{rem:limits} records.

\section{Family X: derived and homotopical structures}
\label{sec:family10}

This family represents higher gauge and derived field theories. Its objects are derived categories or homotopical enhancements, and its morphisms are derived equivalences.

Every finite-dimensional algebra over an algebraically closed field falls on one side of the tame-wild dichotomy for derived categories \cite{bekkert}. This family is the home of the wild-side obstructions that Family IX inherits: the non-parameterization of rank-two isomorphism classes of maximal Cohen-Macaulay modules over the generic determinantal ring \cite{buchweitz}, and the wildness of the compact modules over $H\underline{\mathbb{F}}_p$ at an odd prime \cite{grevstad}. Beyond the dichotomy no classification is claimed.

\begin{remark}[Dichotomy as content]
\label{rem:dichotomy}
A dichotomy theorem classifies the objects of a theory into two classes and classifies neither class internally. The row for this family in the chart below is complete at the level of the dichotomy and open at the level of the two sides.
\end{remark}

\section{Exceptional structures}
\label{sec:exceptional}

The chart of families is not a chart of everything. Two kinds of additional structure sit beside it: genuinely exceptional objects, and distinguished objects that are canonical rather than exceptional. Both kinds are simple or indecomposable in their ambient categories, and that is the property the table below uses: the twenty-six sporadic simple groups together with the cyclic, alternating, and Lie-type families \cite{cfsg,solomon,atlas}; the exceptional Lie algebras $\mathrm{G}_2$, $\mathrm{F}_4$, $\mathrm{E}_6$, $\mathrm{E}_7$, $\mathrm{E}_8$ \cite{lie}; the type $\mathrm{III}_0$ and type $\mathrm{III}_1$ factors and the hyperfinite $\mathrm{II}_1$ factor \cite{vnalg}; the eight Thurston geometries \cite{geometrization} and the bounded list of four-dimensional model geometries that Filipkiewicz enumerated, recorded in the survey literature beside the unrecognizability results of \cite{tancer}; and pairs of non-isomorphic finite groups with equivalent plain-tensor representation categories \cite{etingof}.

\begin{table}[ht]
\centering
\small
\caption{Collections of simple or indecomposable objects recorded beside the families. The last column states why none of them is closed under direct sum; that property is about simplicity and not about exceptionality.}
\label{tab:exceptional}
\begin{tabularx}{\textwidth}{L{0.22\textwidth} X L{0.30\textwidth}}
\toprule
Collection & What it is & Why it is not closed under direct sum \\
\midrule
Sporadic simple groups & Finite simple groups outside the cyclic, alternating, and Lie-type families \cite{cfsg,solomon} & Direct sum or direct product of two such groups is not simple \\
Exceptional Lie algebras & The five simple Lie algebras of types $\mathrm{G}_2$, $\mathrm{F}_4$, $\mathrm{E}_6$, $\mathrm{E}_7$, $\mathrm{E}_8$ \cite{lie} & Direct sum of two of them is not simple \\
Distinguished factors & Type $\mathrm{III}_0$, type $\mathrm{III}_1$, and the hyperfinite $\mathrm{II}_1$ factor \cite{vnalg}, none of them exceptional & Direct sum of any two factors has nontrivial center and is not a factor \\
Thurston geometries & The eight model geometries in dimension three \cite{geometrization} & Connected sum of geometrized manifolds need not carry a single geometry \\
Isocategorical pairs & Non-isomorphic finite groups with equivalent plain-tensor categories \cite{etingof} & Recovering the group from the category fails without symmetric structure \\
\bottomrule
\end{tabularx}
\end{table}

Physical theories should not be assumed to possess a finite collection of exceptional objects analogous to the twenty-six sporadic groups. The table records a structural fact that holds for simple objects of any kind and is not specific to the exceptional ones: the direct sum of two simple objects is not simple, whether the two are exceptional or regular. The next proposition states that fact in the record setting.

exec
/usr/local/bin/zsh -lc "sed -n '290,650p' src/vol-02-structural-families/Instances.hs" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
data PrincipalU1Bundle = PrincipalU1Bundle
  { baseLabel :: String
  , firstChernClass :: Integer
  } deriving (Eq, Show)

instance PhysicalSystem PrincipalU1Bundle where
  type StateSpace PrincipalU1Bundle = (String, Integer)
  type Observables PrincipalU1Bundle = String
  type Dynamics PrincipalU1Bundle = String
  type Symmetries PrincipalU1Bundle = String
  type Composition PrincipalU1Bundle = Construction
  stateSpace b = (baseLabel b, firstChernClass b)
  observables _ = "gauge-invariant functionals of the connection"
  dynamics _ = "parallel transport along the connection"
  symmetries _ = "gauge group of the bundle"
  composition _ = TensorProduct

instance FamilyPrincipalBundlesConnections PrincipalU1Bundle where
  type BundleConnectionData PrincipalU1Bundle = (String, Integer, [CharacteristicClass])
  bundleConnectionData b = (baseLabel b, firstChernClass b, [Chern])

-- ---------------------------------------------------------------------------
-- Family V: probability and measure-theoretic structures (paper Section 8.1, DEF-030)
-- ---------------------------------------------------------------------------

-- | Paper Section 8.1: the binary statistical system, with the Fisher metric
-- in the coordinate p given by 1 / (p (1 - p)).
data ClassicalStatisticalSystem = ClassicalStatisticalSystem
  { outcomeCount :: Int
  , probabilityCoordinate :: Double
  } deriving (Eq, Show)

-- | Paper Section 8.1: the Fisher metric component g_pp = 1 / (p (1 - p)) of
-- the binary system. Returns Nothing outside the open interval (0,1).
binaryFisherMetric :: ClassicalStatisticalSystem -> Maybe Double
binaryFisherMetric s
  | p <= 0 || p >= 1 = Nothing
  | otherwise = Just (1 / (p * (1 - p)))
  where
    p = probabilityCoordinate s

instance PhysicalSystem ClassicalStatisticalSystem where
  type StateSpace ClassicalStatisticalSystem = (Int, Double)
  type Observables ClassicalStatisticalSystem = String
  type Dynamics ClassicalStatisticalSystem = String
  type Symmetries ClassicalStatisticalSystem = String
  type Composition ClassicalStatisticalSystem = Construction
  stateSpace s = (outcomeCount s, probabilityCoordinate s)
  observables _ = "real functions on the outcome set"
  dynamics _ = "Markov kernel"
  symmetries _ = "stochastic maps preserving the metric"
  composition _ = TensorProduct

instance FamilyProbabilityMeasure ClassicalStatisticalSystem where
  type ProbabilityMeasureData ClassicalStatisticalSystem = Maybe Double
  probabilityMeasureData = binaryFisherMetric

-- ---------------------------------------------------------------------------
-- Family VI: topological and higher-categorical structures (paper Section 10, DEF-031)
-- ---------------------------------------------------------------------------

-- | Paper Section 10: a topological quantum field theory record, carrying the
-- fully dualizable object that the claimed classification names.
data TopologicalQFTSystem = TopologicalQFTSystem
  { tqftDimension :: Int
  , fullyDualizableLabel :: String
  } deriving (Eq, Show)

instance PhysicalSystem TopologicalQFTSystem where
  type StateSpace TopologicalQFTSystem = (Int, String)
  type Observables TopologicalQFTSystem = String
  type Dynamics TopologicalQFTSystem = String
  type Symmetries TopologicalQFTSystem = String
  type Composition TopologicalQFTSystem = Construction
  stateSpace t = (tqftDimension t, fullyDualizableLabel t)
  observables _ = "topological invariants of the manifold"
  dynamics _ = "gluing of cobordisms"
  symmetries _ = "diffeomorphism group of the bordism"
  composition _ = TensorProduct

instance FamilyTopologicalHigherCategorical TopologicalQFTSystem where
  type HigherCategoricalData TopologicalQFTSystem = (Int, String)
  higherCategoricalData t = (tqftDimension t, fullyDualizableLabel t)

-- ---------------------------------------------------------------------------
-- Family VII: dynamical systems and operator semigroups (paper Section 11, DEF-032)
-- ---------------------------------------------------------------------------

-- | Paper Theorem 11.1 and Proposition 11.2: a completely positive map
-- recorded by its minimal Kraus list. Proposition 11.2 is that the Kraus rank
-- is constant on a positive-dimensional family of unitary channels.
data QuantumChannelSystem = QuantumChannelSystem
  { krausOperators :: [[ComplexPair]]
    -- ^ One minimal Kraus list per channel; the list length is the Kraus rank.
  , channelLabel :: String
  } deriving (Eq, Show)

-- | A 2 by 2 complex matrix entry pair, enough to carry the unitary channels
-- of Proposition 11.2 without a linear algebra dependency.
data ComplexPair = ComplexPair Double Double
  deriving (Eq, Show)

instance PhysicalSystem QuantumChannelSystem where
  type StateSpace QuantumChannelSystem = [ComplexPair]
  type Observables QuantumChannelSystem = String
  type Dynamics QuantumChannelSystem = String
  type Symmetries QuantumChannelSystem = String
  type Composition QuantumChannelSystem = Construction
  stateSpace q = concat (krausOperators q)
  observables _ = "completely positive maps on the algebra"
  dynamics _ = "Stinespring dilation"
  symmetries _ = "unitary freedom of the minimal dilation"
  composition _ = TensorProduct

instance FamilyDynamicalSemigroups QuantumChannelSystem where
  type DynamicalSemigroupData QuantumChannelSystem = Int
  dynamicalSemigroupData = krausRankOf

-- | Paper Proposition 11.2: the Kraus rank is the length of a minimal Kraus
-- list. It is an invariant of the normal form and not an isomorphism
-- invariant of the channel.
krausRankOf :: QuantumChannelSystem -> Int
krausRankOf q = maximum (1 : map length (krausOperators q))

-- | Paper Proposition 11.2: the family of unitary channels Phi_U(X) = U X U*
-- for U in U(2), each with Kraus rank one. The returned list has one entry
-- per sampled phase, and every entry has Kraus rank one, which is the
-- non-injectivity the proposition records. This is a model of the family and
-- not a proof of the proposition.
unitaryChannelFamily :: [Double] -> QuantumChannelSystem
unitaryChannelFamily phases =
  QuantumChannelSystem
    { krausOperators =
        [ [ComplexPair (cos th) 0, ComplexPair 0 (sin th)]
        | th <- phases ]
    , channelLabel = "unitary channels on M_2"
    }

-- ---------------------------------------------------------------------------
-- Family VIII: tensor categories and compositional structures (paper Section 12, DEF-033)
-- ---------------------------------------------------------------------------

-- | Paper Section 12: a symmetric tensor category record carrying the
-- structural layer it preserves, which is the load-bearing datum of
-- Theorem 12.1.
data SymmetricTensorCategorySystem = SymmetricTensorCategorySystem
  { categoryLabel :: String
  , preservedLayers :: [PreservedStructure]
  } deriving (Eq, Show)

instance PhysicalSystem SymmetricTensorCategorySystem where
  type StateSpace SymmetricTensorCategorySystem = String
  type Observables SymmetricTensorCategorySystem = String
  type Dynamics SymmetricTensorCategorySystem = String
  type Symmetries SymmetricTensorCategorySystem = [PreservedStructure]
  type Composition SymmetricTensorCategorySystem = Construction
  stateSpace = categoryLabel
  observables _ = "objects and morphisms of the category"
  dynamics _ = "tensor functor"
  symmetries = preservedLayers
  composition _ = TensorProduct

instance FamilyTensorCategoriesComposition SymmetricTensorCategorySystem where
  type TensorCategoryData SymmetricTensorCategorySystem = [PreservedStructure]
  tensorCategoryData = preservedLayers

-- ---------------------------------------------------------------------------
-- Family IX: discrete combinatorial structures (paper Section 9, DEF-034)
-- ---------------------------------------------------------------------------

-- | Paper Section 9.1: a lattice gauge configuration on a finite graph.
data LatticeGaugeSystem = LatticeGaugeSystem
  { latticeVertices :: Int
  , latticeEdges :: Int
  , wilsonLoopLabels :: [String]
  } deriving (Eq, Show)

instance PhysicalSystem LatticeGaugeSystem where
  type StateSpace LatticeGaugeSystem = (Int, Int)
  type Observables LatticeGaugeSystem = [String]
  type Dynamics LatticeGaugeSystem = String
  type Symmetries LatticeGaugeSystem = String
  type Composition LatticeGaugeSystem = Construction
  stateSpace l = (latticeVertices l, latticeEdges l)
  observables = wilsonLoopLabels
  dynamics _ = "transfer operator"
  symmetries _ = "gauge group at the vertices"
  composition _ = DirectSum

instance FamilyDiscreteCombinatorial LatticeGaugeSystem where
  type CombinatorialData LatticeGaugeSystem = (Int, Int, [String])
  combinatorialData l = (latticeVertices l, latticeEdges l, wilsonLoopLabels l)

-- ---------------------------------------------------------------------------
-- Family X: derived and homotopical structures (paper Section 14, DEF-035)
-- ---------------------------------------------------------------------------

-- | Paper Section 14: a derived algebra record carrying the tame or wild
-- class named by the dichotomy.
data DerivedAlgebraSystem = DerivedAlgebraSystem
  { derivedLabel :: String
  , derivedTameOrWild :: String
  } deriving (Eq, Show)

instance PhysicalSystem DerivedAlgebraSystem where
  type StateSpace DerivedAlgebraSystem = String
  type Observables DerivedAlgebraSystem = String
  type Dynamics DerivedAlgebraSystem = String
  type Symmetries DerivedAlgebraSystem = String
  type Composition DerivedAlgebraSystem = Construction
  stateSpace = derivedLabel
  observables _ = "derived category of modules"
  dynamics _ = "derived equivalence"
  symmetries _ = "derived autoequivalences"
  composition _ = DirectSum

instance FamilyDerivedHomotopical DerivedAlgebraSystem where
  type DerivedHomotopicalData DerivedAlgebraSystem = String
  derivedHomotopicalData = derivedTameOrWild

-- ---------------------------------------------------------------------------
-- Family tags, ontology identifiers, and classification records
-- ---------------------------------------------------------------------------

-- | Paper Table 4 row 4: the family tag of each record, paired with the
-- ontology identifier the taxonomy attaches to it. The mapping is metadata and
-- carries no mathematical claim.
familyTagOf :: String -> Maybe (StructuralFamily, String)
familyTagOf name = lookup name table
  where
    table =
      [ ("symplectic", (FamilyI, familyDefId FamilyI))
      , ("operator-algebra", (FamilyII, familyDefId FamilyII))
      , ("geometric", (FamilyIII, familyDefId FamilyIII))
      , ("bundle", (FamilyIV, familyDefId FamilyIV))
      , ("probability", (FamilyV, familyDefId FamilyV))
      , ("topological", (FamilyVI, familyDefId FamilyVI))
      , ("semigroup", (FamilyVII, familyDefId FamilyVII))
      , ("tensor-category", (FamilyVIII, familyDefId FamilyVIII))
      , ("combinatorial", (FamilyIX, familyDefId FamilyIX))
      , ("derived", (FamilyX, familyDefId FamilyX))
      ]

-- | Paper Table 4 row 4: the full list of family tags and their ontology
-- identifiers, in family order.
familyDefIds :: [(StructuralFamily, String)]
familyDefIds = [ (f, familyDefId f) | f <- [minBound .. maxBound] ]

-- | Paper Definition 5.1: the four achievement kinds of a classified sector.
data AchievementKind
  = CompleteParameterized
  | CompleteUnparameterized
  | CompleteAsObstruction
  | Impossible
  deriving (Eq, Ord, Show, Enum, Bounded)

-- | Paper Section 15: the five-field classification record a later volume
-- writes against the family rows.
data ClassificationRecord = ClassificationRecord
  { recordFamily :: StructuralFamily
  , recordSector :: String
  , recordInvariant :: Maybe ClassifyingInvariant
  , recordEquivalence :: EquivalenceKind
  , recordScope :: String
  , recordKind :: AchievementKind
  } deriving (Eq, Show)

exec
/usr/local/bin/zsh -lc "sed -n '180,315p' papers/latex/vol-02-structural-families.tex" in /Users/mlong/Documents/Development/classification-physical-systems
exec
/usr/local/bin/zsh -lc "sed -n '520,645p' papers/latex/vol-02-structural-families.tex" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
\end{proposition}

\begin{proof}
The three conditions of \Cref{def:kinds} are tested in order. If no theorem on record names a classifying invariant and no impossibility theorem is on record, the kind is no record, and no other kind applies since the others all presuppose one of the two kinds of record. If an impossibility theorem is on record, the kind is impossible, and no other kind applies. If a theorem names a classification and the classified target is the obstructions, the kind is complete as an obstruction classification. If it names a classification of objects, the attained values either form an explicitly described subset of a structured range or they do not, which is exactly the remaining pair. The tests are disjoint at each stage and cover every case at each stage, so one and only one kind applies.
\end{proof}

The five kinds are realized in the families below. The Killing-Cartan and highest weight classifications are complete and parameterized \cite{lie,hw}. The finite simple groups are classified and not uniformly parameterized \cite{cfsg,solomon}. Anomalies are classified as obstructions to quantization \cite{anomaly}. General separable type $\mathrm{II}_1$ factors are impossible to classify \cite{vnalg}. Sectors with no record at all, such as the semigroup family, realize the fifth kind, and \Cref{prop:kinds} accounts for them rather than excluding them.

\begin{table}[ht]
\centering
\small
\caption{Achievement kinds realized inside the ten families. A family occupies more than one row when its sectors differ.}
\label{tab:kinds}
\begin{tabularx}{\textwidth}{L{0.27\textwidth} L{0.26\textwidth} X}
\toprule
Kind & Realized in & Invariant range \\
\midrule
Complete and parameterized & Complex semisimple Lie algebras \cite{lie}, finite-dimensional irreducible representations \cite{hw}, finite-dimensional $C^*$-algebras \cite{calg} & Dynkin diagram, dominant integral weight, dimension vector \\
Complete and unparameterized & Finite simple groups \cite{cfsg,solomon} & Atlas data, with no uniform description \\
Complete as obstruction classification & Anomalies in gauge theories \cite{anomaly} & Cohomological obstruction classes whose vanishing is required \\
Impossible & General separable type $\mathrm{II}_1$ factors \cite{vnalg} & No range of the required cardinality exists \\
No record & Completely positive maps up to isomorphism \cite{stinespring,qchannel} & The normal form is not an isomorphism classification \\
\bottomrule
\end{tabularx}
\end{table}

The table makes two points that a status token would hide. A single family can occupy several kinds at once, because its sectors differ in cardinality and in what is classified. And the absence of a record is not the same as impossibility, since an impossibility is a theorem and an absence is a gap.

\section{Worked family records}
\label{sec:worked}

Three family records apply the discipline of \Cref{sec:discipline}. Each names the invariant data it supplies, the equivalence in force, and the scope in which the data is complete; where a field is absent the record says so.

\subsection{A cotangent bundle in the symplectic family}
\label{sec:cotangent}

Let $Q$ be a smooth manifold and $M = T^*Q$ with its canonical symplectic form $\omega = d\theta$, where $\theta$ is the tautological one-form. The record is: state space $M$, observables $C^\infty(M)$, dynamics the Hamiltonian flow of a smooth function $H$, symmetries the cotangent lifts of diffeomorphisms of $Q$ preserving $H$, and composition the product of systems with the product symplectic form.

Local data is empty by \Cref{prop:globality}. The equivalence in force is symplectomorphism of the total space. The record supplies a global invariant and not a classifying one, and it says so.

\begin{proposition}[Global invariants of a cotangent bundle]
\label{prop:cotangent}
The zero section of $T^*Q$ is a deformation retract of $T^*Q$. Consequently the homotopy type of the symplectic manifold $T^*Q$ equals the homotopy type of $Q$, and every homotopy invariant of $Q$ is a global invariant of the symplectic record.
\end{proposition}

\begin{proof}
The maps $r_t \colon T^*Q \to T^*Q$ given by $r_t(x, \xi) = (x, t\xi)$ for $t \in [0,1]$ form a deformation retraction: each $r_t$ is smooth, $r_1$ is the identity, $r_0$ factors through the zero section, and $r_s \circ r_t = r_{st}$ for $s, t \in [0,1]$. The zero section is diffeomorphic to $Q$, so $T^*Q$ and $Q$ are homotopy equivalent and share all homotopy invariants.
\end{proof}

\Cref{prop:cotangent} supplies an invariant and not a complete one. Two homotopy-equivalent bases need not have symplectomorphic cotangent bundles, and the record also carries the Hamiltonian $H$, which the homotopy type does not see. The scope of the record is therefore the homotopy data of the base, and the record does not claim more.

\subsection{A finite-dimensional quantum system}
\label{sec:worked-calg}

Take $A = M_2(\mathbb{C}) \oplus \mathbb{C}$, the observable algebra of a two-level system together with a classical bit. The record is: state space the space of block-diagonal density matrices $\rho_2 \oplus p$, observables $A$, dynamics a one-parameter group of $*$-automorphisms, symmetries the unitary group of $A$ acting by conjugation, and composition the tensor product of algebras. The state space is the state space of $A$ and not of $M_3(\mathbb{C})$, because the states of a direct sum are pairs of states of the summands.

By \Cref{thm:calg} the classifying invariant of the observable algebra is the dimension vector, here the multiset $\{2, 1\}$ of matrix sizes. That invariant classifies the algebra and not the full record, which also carries dynamics and composition data, as \Cref{prop:components} records. The invariant range at total complex dimension five is the set of multisets of positive integers whose squares sum to five, and there are two of them: $\{2, 1\}$ from $4 + 1$, and $\{1, 1, 1, 1, 1\}$ from five copies of $1$. At total dimension four there are two classes as well, given by $\{2\}$ and $\{1, 1, 1, 1\}$. The count of classes grows with the dimension, and \Cref{thm:sharpness} bounds it by the size of the range.

\subsection{Line bundles over the two-sphere}
\label{sec:worked-bundle}

Let $G = U(1)$ and let the base be $X = S^2$. The record is: state space the space of connections on a principal $U(1)$-bundle, observables the gauge-invariant functionals, dynamics the parallel transport of a chosen connection, symmetries the gauge group, and composition the tensor product of bundles.

By \Cref{thm:bundles} the classifying invariant of the underlying topological bundle is the first Chern class, which takes values in $H^2(S^2; \mathbb{Z}) \cong \mathbb{Z}$. The invariant range is countably infinite and every integer is attained, so the topological sector is classified and not finite. It is an instance of the distinction in \Cref{cor:parameterization}: the classification is complete, and the range is an explicit discrete group in which the attained values are described. The invariant classifies the bundle and not the space of connections on it, which is an affine space and carries no such discrete invariant.

\subsection{Constructions acting on invariants}
\label{sec:constructions-on-invariants}

A family record does not automatically extend to the closure of its family, because the constructions move the invariant. The finite-dimensional operator-algebra sector makes this concrete.

\begin{proposition}[Induced operations on the dimension vector]
\label{prop:induced}
Let $A$ and $B$ be unital finite-dimensional complex $C^*$-algebras with dimension vectors $\{n_1, \dots, n_k\}$ and $\{m_1, \dots, m_l\}$. Then the dimension vector of $A \oplus B$ is the multiset union $\{n_1, \dots, n_k, m_1, \dots, m_l\}$, and the dimension vector of $A \otimes B$ is the multiset $\{n_i m_j \colon 1 \leq i \leq k,\ 1 \leq j \leq l\}$. Consequently the range of the classifying invariant of \Cref{thm:calg} is closed under these two operations, and the invariant record of a composite system is computed from the records of the summands.
\end{proposition}

\begin{proof}
The Wedderburn decomposition of a direct sum of semisimple algebras is the multiset union of the Wedderburn decompositions of the summands, so the matrix sizes add in the multiset sense. For the tensor product, $M_a(\mathbb{C}) \otimes M_b(\mathbb{C}) \cong M_{ab}(\mathbb{C})$ by the standard identification of the tensor product of matrix algebras, and tensor product distributes over direct sums in both variables. Collecting the simple summands of $A \otimes B$ gives exactly the multiset of products $n_i m_j$. Both constructions therefore compute a new classifying invariant from the old ones without reference to any other data.
\end{proof}

\Cref{prop:induced} is the sense in which a classifying invariant can be functorial for the admissible constructions. It also marks a limit: the same computation in a sector where no classifying invariant is on record cannot be carried out, and the closure of such a sector is unrecorded.

\section{Morphisms and invariants}
\label{sec:morphisms}

The invariant discipline has to say what happens when two records are related by a morphism rather than an equivalence. The ontology distinguishes coarse-graining, equivalence, embedding, duality, and limiting procedures, and the invariant does not behave the same way along all five.

\begin{proposition}[Invariance under equivalence only]
\label{prop:invariance}
Let $(\mathfrak{F}, V, I)$ be a family record and let $f \colon P \to Q$ be an invertible morphism representing exact equivalence. Then $I(P) = I(Q)$. The conclusion fails for coarse-grainings and for embeddings in general.
\end{proposition}

\begin{proof}
The first claim is the defining condition of \Cref{def:family-record}: $I$ is constant on $\simeq$-classes, and an invertible equivalence morphism places $P$ and $Q$ in one class. For the negative claim, a coarse-graining forgets microscopic detail, and two systems that coarse-grain to the same macroscopic record need not be equivalent. The dimension vector of \Cref{thm:calg} is a classifying invariant only for the finite-dimensional algebra itself; the same observable algebra can carry inequivalent states and dynamics, so coarse-grained records identify objects that $I$ separates. An embedding places $P$ inside a larger system, and the invariant of the larger system is computed by \Cref{prop:induced} and not inherited from $P$.
\end{proof}

\begin{remark}[Dualities]
\label{rem:duality}
A duality is generally invertible only after passage to an appropriate opposite or dual category, and it must state which structure it preserves. The Gelfand correspondence of Table~\ref{tab:independence} is an anti-equivalence, and it identifies invariant records on the two sides up to the stated opposition. A duality that does not name the preserved structure cannot be used to transfer a classification, for the reason given in \Cref{thm:etingof-gelaki}.
\end{remark}

\begin{remark}[Limiting procedures]
\label{rem:limits}
A limiting procedure produces a new object, and the invariant of the limit is not in general the limit of the invariants. Continuum limits are the load-bearing case: results proved on a lattice in a restricted regime do not by themselves close the continuum limit, and the invariant record of the limiting object must be established on its own terms.
\end{remark}

\subsection{Recognition data}
\label{sec:recognition}

The atlas discipline separates three tasks that are easy to conflate \cite{atlas}. Parameterization is an explicit uniform description of the classes. Classification is an exhaustive list. Recognition is an algorithm that identifies which class a given object lies in, by computing its invariant and comparing.

\begin{proposition}[Recognition cost]
\label{prop:recognition-cost}
Let $(\mathfrak{F}, V, I)$ be an invariant-complete family record with $V$ a set carrying decidable equality, and assume $I(P)$ is computable from a finite presentation of $P$. Recognition of the class of $P \in \mathfrak{F}$ reduces to computing $I(P)$ and comparing it with the recorded values, and it costs at most one invariant computation plus one comparison per candidate class. If in addition the list of attained values is finite and stored, recognition is an algorithm.
\end{proposition}

\begin{proof}
Injectivity of $[P] \mapsto I(P)$ from \Cref{thm:sharpness} gives that $I(P)$ determines the class. The procedure computes $I(P)$ from the presentation of $P$, which the hypothesis makes possible, and looks the value up in the stored list. Decidable equality decides the comparison. The cost claim is the cost of the two steps. The computability hypothesis is doing real work: decidable equality on a finite range does not make the map $I$ computable, and without the hypothesis the procedure is not defined on presentations at all.
\end{proof}

Recognition is therefore the weakest of the three tasks when the invariant is computable, and it is the one the atlas supplies in practice \cite{atlas}. Parameterization is the strongest. The three are separate achievements, and a family row that reports one of them does not report the others.

\section{Family I: symplectic and Poisson structures}
\label{sec:family1}

This family singles out classical mechanics. Its defining structural data is a symplectic or Poisson state space; systems in it carry function algebras of observables and Hamiltonian dynamics \cite{poisson}. A record whose state space is symplectic belongs to this family whatever else its components carry.

The local picture is closed. Darboux's theorem gives a normal form and \Cref{prop:globality} extracts its classification consequence. For Poisson manifolds the local picture is also closed and it is not empty: near a point of rank $2k$ a Poisson manifold splits as a symplectic factor times a transverse Poisson factor \cite{poisson}. The symplectic leaves foliate the manifold, and on the dual of a Lie algebra the leaves of the Kirillov-Kostant-Souriau structure are the coadjoint orbits \cite{poisson}.

\begin{theorem}[Poisson local models]
\label{thm:weinstein}
Near a point of rank $2k$ a Poisson manifold is locally isomorphic to a product of a symplectic manifold of dimension $2k$ and a Poisson manifold whose linearization vanishes at the point \cite{weinstein}. The symplectic leaves form a foliation, and two Poisson manifolds with isomorphic local models need not be globally isomorphic.
\end{theorem}

The global picture is where the family's classification content lives, and the corpus does not fix a list of global invariants. Candidates in ordinary use are the de Rham class of the symplectic form, Chern classes of compatible almost complex structures, and flux data. The periodic chart records ``topology of $\omega$'' for this row. Making that phrase precise is an open deliverable.

The link from this family to the operator-algebra family through deformation quantization is a research program and not an equivalence theorem. No result below depends on it.

 succeeded in 0ms:
Physical theories should not be assumed to possess a finite collection of exceptional objects analogous to the twenty-six sporadic groups. The table records a structural fact that holds for simple objects of any kind and is not specific to the exceptional ones: the direct sum of two simple objects is not simple, whether the two are exceptional or regular. The next proposition states that fact in the record setting.

\begin{proposition}[Irreducible classes do not close]
\label{prop:closure}
Let $\mathcal{K}$ contain direct sum and let $\mathcal{E}$ be a nonempty class of nonzero objects each irreducible under direct sum. Then $\mathcal{E}$ is not closed under direct sum and $\langle \mathcal{E} \rangle_{\mathcal{K}}$ strictly contains $\mathcal{E}$. The conclusion is one of non-closure and not of non-generation: $\mathcal{E}$ generates $\langle \mathcal{E} \rangle_{\mathcal{K}}$ by definition of closure, so a generating class may consist of irreducibles alone.
\end{proposition}

\begin{proof}
Take $A \in \mathcal{E}$ nonzero. The pair $(A, A)$ witnesses a decomposition of $A \oplus A$ under the direct-sum construction with irreducible factors $A$ and $A$, so $A \oplus A$ is reducible and is therefore not in $\mathcal{E}$. It is in $\langle \mathcal{E} \rangle_{\mathcal{K}}$ by closure under direct sum. The inclusion $\mathcal{E} \subsetneq \langle \mathcal{E} \rangle_{\mathcal{K}}$ is strict, which is the non-closure claim. The generation claim runs the other way and is immediate: $\langle \mathcal{E} \rangle_{\mathcal{K}}$ is by definition the smallest class containing $\mathcal{E}$ and closed under $\mathcal{K}$, so $\mathcal{E}$ generates it.
\end{proof}

Two consequences follow and they are different. A class of irreducibles is never a fixed point of the closure operator whenever $\mathcal{K}$ contains direct sum, so taking a closure always adds objects. A class of irreducibles can nevertheless be a generating set, and the finite-dimensional matrix algebras are the example: each $M_n(\mathbb{C})$ is irreducible under direct sum and the list $\{M_n(\mathbb{C}) : n \geq 1\}$ generates every unital finite-dimensional complex $C^*$-algebra under direct sum, by \Cref{thm:calg}.

\section{Independence and reconstructability}
\label{sec:independence}

A natural hope is that the ten families are logically independent, so that no family can be rebuilt from another. What the literature proves is a mixture of reconstruction theorems and counterexamples to reconstruction.

\begin{table}[ht]
\centering
\small
\caption{Reconstruction and non-reconstruction results. The first four rows relate distinct families; the fifth compares two sectors of one family. Each row states the verdict and the structure the equivalence preserves.}
\label{tab:independence}
\begin{tabularx}{\textwidth}{L{0.28\textwidth} L{0.20\textwidth} X}
\toprule
Relation & Verdict & Preserved structure \\
\midrule
Commutative unital $C^*$-algebras and compact Hausdorff spaces & Reconstructable & The Gelfand correspondence preserves the lattice of closed ideals \cite{gelfand-naimark,gelfand-duality} \\
Boolean algebras and zero-dimensional compact spectra & Reconstructable & Stone duality preserves the order and the topology \cite{stone} \\
Symmetric tensor categories with conjugates and compact supergroups & Reconstructable & Doplicher-Roberts reconstruction preserves the symmetric structure \cite{dr,dhr} \\
Plain tensor categories and the underlying finite group & Not reconstructable & No symmetric structure is preserved, and the group is lost \cite{etingof} \\
Classical and quantum monotone metrics, both in Family V & Not identical & Uniqueness holds classically and fails in the quantum case \cite{petz} \\
Symplectic and operator-algebra families & Open & Deformation quantization is a program and not an equivalence \\
\bottomrule
\end{tabularx}
\end{table}

\begin{definition}[Independence of families]
\label{def:independence}
Two structural families $\mathfrak{F}$ and $\mathfrak{G}$ are \emph{logically independent} when neither is a special case of the other and neither is reconstructable from the other: there is no full embedding of one into the other, and no correspondence of the kind in Table~\ref{tab:independence} that determines one from the other. Independence in this sense is a statement about the families as classes of records and not about any particular system.
\end{definition}

\begin{proposition}[Invariants do not imply independence]
\label{prop:independence}
Let $\mathfrak{F}$ and $\mathfrak{G}$ be two structural families each admitting a classifying invariant. Then $\mathfrak{F}$ and $\mathfrak{G}$ need not be logically independent. In particular the commutative unital $C^*$-algebras inside the operator-algebra family and the compact Hausdorff spaces inside the geometric family each carry a classifying invariant, and neither is independent of the other.
\end{proposition}

\begin{proof}
The Gelfand correspondence gives a bijection between commutative unital $C^*$-algebras and compact Hausdorff spaces that is an anti-equivalence of categories \cite{gelfand-duality,gelfand-naimark}. The spectrum is a classifying invariant for the space side and the algebra is a classifying invariant for the algebra side, and each determines the other. Two families related by such a correspondence cannot be logically independent, because every statement about one transfers to the other. The existence of a classifying invariant in each family is therefore silent on the question of independence.
\end{proof}

No theorem on record states that any two of the ten families are independent in the sense of \Cref{def:independence}. The honest chart entry for the independence question is open, and \Cref{prop:independence} explains why classifying invariants cannot settle it.

\section{Systems in more than one family}
\label{sec:mixing}

A physical system is a record $(X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$, and the families classify records by their mathematical structure. A single record can present structure from several families at once, and the taxonomy must account for that without pretending the families partition mathematics.

\begin{proposition}[Mixed records are not defects]
\label{prop:mixed}
There exist records whose state space is a symplectic manifold, whose observable algebra is a noncommutative $C^*$-algebra, and whose symmetry group is a Lie group. Such a record lies in the symplectic, operator-algebraic, and geometric families at once. Consequently the assignment of records to families is not a partition, and no argument may treat the ten families as mutually exclusive classes.
\end{proposition}

\begin{proof}
Take $M$ a compact K\"{a}hler manifold with integral K\"{a}hler form $\omega$, let $L \to M$ be the corresponding positive line bundle, and let $\mathcal{H}_L$ be the space of holomorphic sections of $L$. For $f \in C^\infty(M)$ let $T_f$ be the Toeplitz operator on $\mathcal{H}_L$ that multiplies by $f$ and then projects back to $\mathcal{H}_L$. The $C^*$-algebra generated by the operators $T_f$ is noncommutative whenever $\dim \mathcal{H}_L > 1$, since $T_f T_g - T_g T_f$ is nonzero for suitable $f$ and $g$. The record whose state space is $M$ with its symplectic form, whose observable algebra is this Toeplitz $C^*$-algebra, whose symmetries are the biholomorphisms of $M$ lifting to $L$, and whose dynamics is the quantization of a Hamiltonian on $M$, presents symplectic, operator-algebraic, and geometric structure at once. If the families were mutually exclusive, this record would lie in none of them or in more than one, and the second option contradicts exclusivity.
\end{proof}

The research goal at this level is to discover which distinctions are fundamental and which arise from different mathematical presentations. \Cref{prop:mixed} is a small instance of that question, and it is the reason \Cref{def:structural-family} defines a family by the structure it singles out rather than by membership of records.

Two further relations between families are worth naming. A family may be a special case of another: the commutative unital $C^*$-algebras are a full subcategory of the operator-algebra family and are equivalent to compact Hausdorff spaces, so the two presentations carry the same information \cite{gelfand-duality}. A family may be generated from another under constructions, in the sense of \Cref{def:structural-family}. Both relations are structural statements about the families, and neither is a statement about the physical systems the families represent.

\section{The taxonomy as an interface}
\label{sec:interface}

Later volumes classify systems. The taxonomy is the place they record what they find, and the record format is fixed here so that results produced independently are comparable.

A classification record in a later volume has six fields: the family, the sector, the classifying invariant together with its range, the equivalence the invariant is complete for, the scope in which completeness holds, and the achievement kind of \Cref{def:kinds}. A record with an empty invariant field is a record of an absence and not a classification.

\begin{proposition}[Comparability of records]
\label{prop:comparable}
Two classification records are comparable when they agree on family, sector, and equivalence. If they agree on those three fields and both name classifying invariants, then the two invariants are related by a bijection between their attained values on that sector.
\end{proposition}

\begin{proof}
Both invariants are complete for the same equivalence on the same set of objects, so each induces a bijection between the set of classes and its own attained values. The composite of one bijection with the inverse of the other is a bijection between the two sets of attained values.
\end{proof}

\Cref{prop:comparable} is what makes the family rows usable across volumes. Two independently obtained invariants for the same sector are not competing claims; they are coordinate descriptions of the same class set, and each can be converted into the other once both are recorded. What is not automatic is agreement on scope, since two records may cover different sub-sectors. Scope comparison is therefore a manual step, and the family tables above state the scope of every row they carry.

The interface also fixes how an obstruction is recorded. An impossibility result names the sector, names the candidate invariant range it excludes, and cites the theorem that excludes it. An absence of record names the sector and states that no classification is on record. The two are different fields and never share a row, as Table~\ref{tab:kinds} shows.

\section{Scope of the family taxonomy}
\label{sec:limitations}

Four limits bound the use of the ten-family chart.

The families are candidates and not a completed classification. They are recorded as candidate organizing families, and some may be unified or shown to be special cases of others. The word ``candidate'' in \Cref{def:structural-family} is load-bearing.

No completeness claim is available. Whether every admissible physical system lies in the closure of these ten families under the admissible constructions is unproved, and the conjectural identity that states it is a registered conjecture. \Cref{prop:closure} shows that a class of irreducibles is not closed under the constructions, so any completeness claim has to describe a closure and the objects it adds, not only a list of generators.

Status tokens are coarse. A single status per family hides the finite-dimensional, amenable, and wild sectors of the operator-algebra family at once, as \Cref{rem:mcduff} records. Table~\ref{tab:families} gives one row per family and states a scope limit in its last column; where the sectors of a family differ in kind, Tables~\ref{tab:kinds} and~\ref{tab:independence} give the finer breakdown.

Independence is unrecorded. \Cref{prop:independence} shows the question is not settled by invariants, and no theorem settles it. Statements about the logical relations between families are therefore hypotheses in later volumes and not lemmas.

\begin{table}[ht]
\centering
\small
\caption{Open questions the taxonomy raises, with the kind of result that would close each one.}
\label{tab:open}
\begin{tabularx}{\textwidth}{L{0.34\textwidth} L{0.20\textwidth} X}
\toprule
Question & Present status & What would close it \\
\midrule
Which families are fundamental rather than presentations of others & Open & A theorem reducing one family to another \\
Whether any two families are logically independent & Open & A non-derivability theorem in a stated sense \\
Whether the ten families generate all admissible systems & Conjecture & A proof of the closure identity, or an obstruction \\
A uniform parameterization of the finite simple groups & Open & An explicit uniform description of the classes \\
The global invariants of the symplectic family & Unrecorded & A named finite or parametric invariant list \\
A classification theorem for the semigroup family & None on record & A classification with a stated scope \\
Complete cases of the extended topological classification & Claimed & A proof closing the 2009 sketch in each case \\
\bottomrule
\end{tabularx}
\end{table}

\begin{table}[ht]
\centering

exec
/usr/local/bin/zsh -lc "sed -n '245,292p' src/vol-02-structural-families/Instances.hs" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
  type Composition BinaryQuantumSystem = Construction
  stateSpace = binaryBlocks
  observables = mkFiniteCStarAlgebra . binaryBlocks
  dynamics _ = "one-parameter group of *-automorphisms"
  symmetries _ = "unitary group of the algebra"
  composition _ = TensorProduct

instance FamilyHilbertOperatorAlgebras BinaryQuantumSystem where
  type OperatorAlgebraData BinaryQuantumSystem = DimensionVector
  operatorAlgebraData = dimensionVectorOfAlgebra . mkFiniteCStarAlgebra . binaryBlocks

-- ---------------------------------------------------------------------------
-- Family III: smooth manifolds and geometric structures (paper Section 8, DEF-028)
-- ---------------------------------------------------------------------------

-- | Paper Section 8: a Lorentzian system carrying holonomy and causal data.
data LorentzianSystem = LorentzianSystem
  { lorentzianDim :: Int
  , lorentzianHolonomyLabel :: String
  , lorentzianCausalClass :: CausalClass
  } deriving (Eq, Show)

instance PhysicalSystem LorentzianSystem where
  type StateSpace LorentzianSystem = (Int, String)
  type Observables LorentzianSystem = String
  type Dynamics LorentzianSystem = String
  type Symmetries LorentzianSystem = String
  type Composition LorentzianSystem = Construction
  stateSpace l = (lorentzianDim l, lorentzianHolonomyLabel l)
  observables _ = "function algebra on the manifold"
  dynamics _ = "Einstein flow or geodesic flow"
  symmetries _ = "Lorentz group of the tangent frame"
  composition _ = DirectSum

instance FamilySmoothGeometric LorentzianSystem where
  type GeometricData LorentzianSystem = (Int, String, CausalClass)
  geometricData l =
    (lorentzianDim l, lorentzianHolonomyLabel l, lorentzianCausalClass l)

-- ---------------------------------------------------------------------------
-- Family IV: principal bundles and connections (paper Section 7.3, DEF-029)
-- ---------------------------------------------------------------------------

-- | Paper Section 7.3: a principal U(1)-bundle over S^2, classified by its
-- first Chern class in H^2(S^2; Z) = Z.
data PrincipalU1Bundle = PrincipalU1Bundle
  { baseLabel :: String
  , firstChernClass :: Integer

exec
/usr/local/bin/zsh -lc 'python3 -B src/vol-02-structural-families/phaseD_kraus_rank.py' in /Users/mlong/Documents/Development/classification-physical-systems
exec
/usr/local/bin/zsh -lc 'python3 -B src/vol-02-structural-families/phaseD_dimension_vectors.py' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 92ms:
Phase D evidence: dimension vectors of finite-dimensional C*-algebras
Paper claim: Theorem 5.1 (dim_vector_classification), Proposition 6.1

total dimension  1 : 1 class(es) : {1}
total dimension  2 : 1 class(es) : {1,1}
total dimension  3 : 1 class(es) : {1,1,1}
total dimension  4 : 2 class(es) : {1,1,1,1}, {2}
total dimension  5 : 2 class(es) : {1,1,1,1,1}, {1,2}
total dimension  6 : 2 class(es) : {1,1,1,1,1,1}, {1,1,2}
total dimension  7 : 2 class(es) : {1,1,1,1,1,1,1}, {1,1,1,2}
total dimension  8 : 3 class(es) : {1,1,1,1,1,1,1,1}, {1,1,1,1,2}, {2,2}
total dimension  9 : 4 class(es) : {1,1,1,1,1,1,1,1,1}, {1,1,1,1,1,2}, {1,2,2}, {3}
total dimension 10 : 4 class(es) : {1,1,1,1,1,1,1,1,1,1}, {1,1,1,1,1,1,2}, {1,1,2,2}, {1,3}
total dimension 11 : 4 class(es) : {1,1,1,1,1,1,1,1,1,1,1}, {1,1,1,1,1,1,1,2}, {1,1,1,2,2}, {1,1,3}
total dimension 12 : 5 class(es) : {1,1,1,1,1,1,1,1,1,1,1,1}, {1,1,1,1,1,1,1,1,2}, {1,1,1,1,2,2}, {1,1,1,3}, {2,2,2}

Proposition 6.1 cross-check on the dimension-4 and dimension-5 sectors
  A = {2} total dimension        : 4
  B = {1,1,1,1} total dimension   : 4
  A + B dimension vector         : (1, 1, 1, 1, 2)
  A + B total dimension          : 8
  A tensor A dimension vector    : (4,)
  A tensor A total dimension     : 16

  C = {2,1} total dimension      : 5
  C tensor C dimension vector    : (1, 2, 2, 4)
  C tensor C total dimension     : 25

direct sum adds total dimension   : True
tensor squares total dimension    : True

RESULT: the induced operations match the arithmetic of Proposition 6.1.

 succeeded in 96ms:
Phase D evidence: Kraus rank of unitary channels on M_2
Paper claim: Proposition 11.2 (kraus_rank_not_injective)

sample size                : 12
Kraus rank observed        : [1]
distinct channels observed : 12

every sampled rank is one  : True
more than one channel      : True

RESULT: the rank map is constant on a family with more than one channel, so it is not injective on this sample.

codex
ROW 1 | Kraus rank constant on positive-dimensional channel family | SUPPORTS | Gaussian elimination computes rank one for all 12 distinct sampled unitary channels in the continuous phase family.
ROW 2 | Dimension vectors enumerate sectors at fixed dimension | SUPPORTS | The script exhaustively enumerates sorted positive-integer multisets whose squares sum to n and reports counts for dimensions 1–12.
ROW 3 | All ten families have declared taxonomy instances | SUPPORTS | Instances.hs imports the taxonomy classes and declares a corresponding family instance for each of the ten families.
ROW 4 | Family tags carry ontology identifiers | SUPPORTS | familyTagOf and familyDefIds pair family tags with identifiers obtained through the taxonomy accessor familyDefId.
VERDICT: PASS
hook: Stop
hook: Stop Completed
tokens used
51,654
ROW 1 | Kraus rank constant on positive-dimensional channel family | SUPPORTS | Gaussian elimination computes rank one for all 12 distinct sampled unitary channels in the continuous phase family.
ROW 2 | Dimension vectors enumerate sectors at fixed dimension | SUPPORTS | The script exhaustively enumerates sorted positive-integer multisets whose squares sum to n and reports counts for dimensions 1–12.
ROW 3 | All ten families have declared taxonomy instances | SUPPORTS | Instances.hs imports the taxonomy classes and declares a corresponding family instance for each of the ten families.
ROW 4 | Family tags carry ontology identifiers | SUPPORTS | familyTagOf and familyDefIds pair family tags with identifiers obtained through the taxonomy accessor familyDefId.
VERDICT: PASS
