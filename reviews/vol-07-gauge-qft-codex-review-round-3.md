---
reviewer: codex (OpenAI) gpt-6.1-sol
type: formatting
paper: vol-07-gauge-qft
round: 3
date: 2026-10-30T04:57:38Z
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
session id: 01a18b2b-af79-7c43-bd9c-fcf6f2a6cd73
--------
user
Read ONLY the file papers/latex/vol-07-gauge-qft.tex (do not explore other files or directories). Review it for LaTeX formatting issues: compilation errors, missing packages, broken references, inconsistent styling, overfull/underfull boxes, spacing problems. Note: this project's house style deliberately renders paired-surname compounds and page ranges with \textendash (an en dash) rather than the -- shorthand, because an automated gate forbids -- sequences in source; treat \textendash as satisfying en-dash typography and do not re-raise it. List remaining issues with line numbers and concrete fixes. End your response with a VERDICT line — exactly one of: VERDICT: PASS (no issues remain) or VERDICT: NEEDS_FIX (issues listed above must be fixed).
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
I’ll read only the specified file and check for LaTeX formatting issues, treating `\textendash` as the intended house style.
exec
/usr/local/bin/zsh -lc 'nl -ba papers/latex/vol-07-gauge-qft.tex' in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
     1	\documentclass[11pt,letterpaper]{article}
     2	
     3	\usepackage[T1]{fontenc}
     4	\usepackage{lmodern}
     5	\usepackage{microtype}
     6	\usepackage[margin=1in]{geometry}
     7	\linespread{1.0}
     8	\setlength{\parskip}{0pt}
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
    21	
    22	\newtheorem{theorem}{Theorem}[section]
    23	\newtheorem{proposition}[theorem]{Proposition}
    24	\newtheorem{lemma}[theorem]{Lemma}
    25	\newtheorem{corollary}[theorem]{Corollary}
    26	\theoremstyle{definition}
    27	\newtheorem{definition}[theorem]{Definition}
    28	\theoremstyle{remark}
    29	\newtheorem{remark}[theorem]{Remark}
    30	\newtheorem{example}[theorem]{Example}
    31	\newtheorem{conjecture}[theorem]{Conjecture}
    32	
    33	\title{Gauge Structures and Quantum Field Theories\\[4pt]
    34	  {\normalsize Part 7 of \emph{The Classification of Mathematical Representations of Physical Systems}}}
    35	\author{Matthew Long\\
    36	  \small The YonedaAI Collaboration, YonedaAI Research Collective\\
    37	  \small Chicago, Illinois, USA\\
    38	  \small \href{mailto:matthew@yonedaai.com}{matthew@yonedaai.com}\\
    39	  \small \url{https://yonedaai.com}}
    40	\date{October 2026}
    41	
    42	\begin{document}
    43	
    44	\maketitle
    45	
    46	\begin{abstract}
    47	We develop the classification of gauge structures and quantum field theories within the CMRPS program. The subject divides into two territories of unequal evidential standing. The established territory contains the Killing\textendash{}Cartan classification of semisimple Lie algebras, the highest-weight classification of their finite-dimensional representations, the classification of principal $G$-bundles by homotopy classes of maps into the classifying space $BG$, characteristic classes as pullbacks of universal classes, and anomalies as cohomological obstructions that gate quantization. The restricted territory contains functorial topological field theories under the Atiyah axioms and the Doplicher\textendash{}Roberts reconstruction of superselection sectors under the Haag\textendash{}Kastler framework. Beyond these islands the evidence is claimed rather than proved. The cobordism hypothesis classifies extended topological field theories by fully dualizable objects, yet the 2009 writeup is an informal proof sketch. The October 2026 four-dimensional quantum chromodynamics claim stands at existence claimed with manuscript and formalization withheld and verification pending, and the Yang-Mills mass gap remains open. We present the classification results with their hypotheses and keep proved, claimed, and open statements apart throughout.
    48	\end{abstract}
    49	
    50	\section{Introduction}
    51	
    52	Gauge theories and quantum field theories occupy the point in the CMRPS program where classification is strongest on the geometric side and weakest on the analytic side. This volume takes the classification problem for its subject: which gauge structures and which quantum field theories are determined, up to a stated equivalence, by an explicit and computable invariant, and which are not. The answer splits sharply. For principal bundles, semisimple Lie algebras, their finite-dimensional representations, and the obstruction content of anomalies, complete classification theorems exist and are proved in the standard literature. For functorial topological field theories in low dimensions the position is similar. For extended topological field theories the classification is claimed on the strength of a proof sketch. For four-dimensional interacting quantum field theories the position is a claims register: one existence result is announced with its artifacts withheld, the mass gap is open, and several lower-rung claims carry statuses ranging from journal-published-and-unverified to withdrawn.
    53	
    54	A mature classification of mathematical representations of physical systems must record, for each domain, whether the invariant is complete and parameterized, complete but unparameterized, complete as an obstruction, claimed with a proof gap, open, or impossible. This volume records those regimes for the gauge and quantum field theory domains and states each result at exactly the strength the sources support. The split between proved and claimed is itself classification data, and Table~\ref{tab:invariants} is its record for this volume.
    55	
    56	Gauge structures and topological field theories classify under three kinds of invariant. Homotopy classes of classifying maps $[X, BG]$ determine principal bundle topologies. Root diagrams and dominant integral weights determine Lie symmetries and matter representations. Fully dualizable objects name the extended topological field theories. Principal bundles with connection form the differential-geometric substrate, and operator algebras and tensor categories parameterize localized superselection sectors. In the terms of the series, the structural families in force are the principal-bundle family and the topological and higher-categorical family, with the tensor-category family wherever superselection sectors are in play.
    57	
    58	The classification template of the finite simple groups is instructive in one respect and misleading in another. It is instructive because it separates three achievements that are often conflated: a parameterization by uniform data, an exhaustive list up to isomorphism, and a recognition procedure driven by companion invariants. The finite simple groups have the list, lack the uniform parameterization, and carry a practical recognition apparatus. This volume keeps the same separation: the Dynkin diagram is a uniform parameterization, the homotopy-class description of bundles is both a parameterization and a list, and the anomaly classes are a recognition test. The template is misleading if it suggests that a gauge theory or a quantum field theory will be organized by a finite set of families with finitely many exceptions. The classification data of this volume shows instead that the topological and algebraic layers are tame and the analytic layer is open or claimed, and no finite exception list is in evidence.
    59	
    60	Throughout the series an announced result, a manuscript, a machine-checked formalization, an independently verified proof, and an accepted theorem are five different things. The constructive quantum field theory frontier of 2024 to 2026 is dense with announcements, and the ladder is what keeps them from being absorbed into the proved core. An existence theorem for a four-dimensional interacting theory would not settle the Yang-Mills mass gap problem, which requires existence together with a positive mass gap. No withheld formalization may be described as machine-checked.
    61	
    62	The mathematical classification of gauge and quantum field theories splits into an established topological and algebraic core and an unverified analytic frontier. Complete classification invariants characterize Lie symmetries, bundle topologies, two-dimensional topological field theories, and localized superselection sectors: Dynkin diagrams, universal characteristic classes, Frobenius algebras, and unitary tensor categories do this work. The classification of four-dimensional continuum field theories, connection moduli spaces, and non-perturbative mass spectra remains conditional, claimed without public proof artifacts, or open.
    63	
    64	\section{Mathematical framework}
    65	\label{sec:framework}
    66	
    67	We work inside the series ontology. An object of the category $\mathrm{Phys}$ is recorded as a tuple $P = (X, \mathcal{O}, \mathcal{D}, \mathcal{S}, \mathcal{C})$ carrying a state space, an observable collection, dynamical laws, symmetry and constraint data, and composition rules. The schema is a candidate definition and not a settled one; we use it as a filing system for the structures in this volume.
    68	
    69	\begin{definition}[Structural family IV]
    70	\label{def:family-iv}
    71	Family IV is the full subcategory of $\mathrm{Phys}$ whose systems carry principal bundles and connections: a principal $G$-bundle $P \to X$ with structure group $G$, a connection form $\omega$ with curvature $\Omega$, and the gauge data that acts on the pair. Representative systems are gauge theories. The established classification content of the family is the classification of bundles by homotopy classes of maps into $BG$ and the characteristic classes in $H^*(BG)$.
    72	\end{definition}
    73	
    74	\begin{definition}[Structural family VI]
    75	\label{def:family-vi}
    76	Family VI is the full subcategory of $\mathrm{Phys}$ whose systems carry topological or higher-categorical structure: a symmetric monoidal functor from a cobordism category to vector spaces, or an extended version landing in higher categories. Representative systems are topological quantum field theories. The established content is the functorial theory under the Atiyah axioms; the extended classification is claimed on the strength of the cobordism hypothesis and carries a proof gap.
    77	\end{definition}
    78	
    79	\begin{definition}[Classification data for gauge systems]
    80	\label{def:classdata}
    81	A gauge system is classified, up to isomorphism of principal bundles, by the homotopy class of a map $f: X \to BG$; the characteristic classes of the bundle are the pullbacks $f^*(\kappa)$ of universal classes $\kappa \in H^*(BG)$. For a semisimple gauge algebra the Lie-theoretic datum is the Dynkin diagram, and for a finite-dimensional matter representation the datum is a dominant integral weight.
    82	\end{definition}
    83	
    84	Three equivalence notions must be kept apart. Mathematical equivalence is isomorphism of the tuples in the ambient category of each component. Physical equivalence is the chosen relation on objects of $\mathrm{Phys}$; its correct choice is an open problem of the series. Observational equivalence belongs to the empirical layer and is not under discussion here.
    85	
    86	\begin{definition}[Etingof\textendash{}Gelaki constraint]
    87	\label{def:etingof-gelaki}
    88	Any equivalence used to identify systems must state which layers of structure it preserves. Equivalences that forget the monoidal or symmetric layer are provably insufficient to recover the group. The counterexample behind the constraint: there exist non-isomorphic finite groups whose representation categories are equivalent as plain tensor categories, while an equivalence of symmetric tensor categories does recover the group~\cite{etingof-gelaki}. Every duality and equivalence recorded in this volume names its preserved structure.
    89	\end{definition}
    90	
    91	Two admissible constructions appear. The product construction sends a principal $G$-bundle $P_G$ and a principal $H$-bundle $P_H$ over the same base to the principal $(G \times H)$-bundle $P_G \times P_H$, with connection the pair of connections. The quotient construction passes to the quotient of the connection space by the gauge group, identifying fields that differ by gauge transformations. Each use of a construction records the composition data it contributes.
    92	
    93	\begin{example}[A gauge theory as an object of $\mathrm{Phys}$]
    94	\label{ex:tuple}
    95	A classical Yang-Mills system over a compact oriented four-manifold $X$ with gauge group $G$ is recorded as follows. The state space component $X_P$ is the space of connections on a fixed principal $G$-bundle $P \to X$ modulo the gauge group $\mathcal{G}$ of vertical automorphisms. The observable component $\mathcal{O}_P$ is the algebra of gauge-invariant polynomial functions of the curvature, together with the Wilson loops on a fixed class of loops when those are taken as the observable set. The dynamical component $\mathcal{D}_P$ is the Yang-Mills functional $F \mapsto \int_X |F_\omega|^2$ and its gradient flow or Hamiltonian formulation. The symmetry component $\mathcal{S}_P$ is the gauge group $\mathcal{G}$ acting on connections with the Gauss law constraint surface as the reduced phase space. The composition component $\mathcal{C}_P$ is the product of bundles and the coupling of matter fields in representations of $G$. The tuple is an instance of the schema. The bundle is classified by Theorem~\ref{thm:bundles}, and the gauge algebra and the matter representations by Theorems~\ref{thm:killing-cartan} and~\ref{thm:highest-weight}. The dynamics, the state quotient, and the observable algebra lie outside those theorems.
    96	\end{example}
    97	
    98	We say a classification statement is \emph{complete} for a domain when an invariant is named, the classification theorem is proved, and the theorem's hypotheses are stated in full. We say it is \emph{complete as an obstruction} when the classification content is itself the vanishing of obstruction classes. We reserve \emph{claimed} for statements supported by an announcement, a manuscript, or a proof sketch without a complete proof on the public record, and \emph{open} for problems with no resolution on the record. These labels are used in prose only in their ordinary mathematical sense; the formal claim ledger records the status of each statement.
    99	
   100	\begin{table}[ht]
   101	\centering
   102	\small
   103	\caption{Classifying invariants of the gauge and topological subdomains, with the equivalence each classification is taken under and its regime.}
   104	\label{tab:invariants}
   105	\begin{tabularx}{\textwidth}{L{0.20\textwidth} X L{0.24\textwidth} L{0.20\textwidth}}
   106	\toprule
   107	Subdomain & Classifying invariant & Equivalence in force & Regime \\
   108	\midrule
   109	Semisimple gauge algebras & Dynkin diagram & Lie algebra isomorphism & Complete and parameterized \\
   110	\addlinespace
   111	Real simple gauge algebras & Satake diagram & Lie algebra isomorphism & Complete and parameterized \\
   112	\addlinespace
   113	Finite-dimensional matter representations & Dominant integral weight & Representation isomorphism & Complete and parameterized \\
   114	\addlinespace
   115	Principal bundles over a paracompact base & Homotopy class of $X \to BG$ & Bundle isomorphism & Complete and parameterized \\
   116	\addlinespace
   117	Characteristic classes & Pullbacks of universal classes in $H^*(BG)$ & Natural in the base map & Complete and parameterized \\
   118	\addlinespace
   119	Anomaly-free configurations & Trivial determinant line and vanishing BRST class & Gauge equivalence of configurations & Complete as obstruction \\
   120	\addlinespace
   121	Two-dimensional topological theories & Commutative Frobenius algebra & Monoidal natural isomorphism of functors & Complete and parameterized \\
   122	\addlinespace
   123	Sectors of nets under Haag duality & Compact supergroup from sector category & Symmetric monoidal equivalence & Complete under stated hypotheses \\
   124	\addlinespace
   125	Extended topological theories & Fully dualizable object & Monoidal equivalence of theories & Claimed with a proof gap \\
   126	\addlinespace
   127	Connections modulo gauge & None known in general & Gauge equivalence of connections & Open in general \\
   128	\addlinespace
   129	Four-dimensional interacting theories & Balaban-program methods as announced & Not established & Claimed with artifacts withheld \\
   130	\addlinespace
   131	Four-dimensional mass gap & None known & Not applicable & Open \\
   132	\bottomrule
   133	\end{tabularx}
   134	\end{table}
   135	
   136	\section{Lie theory of gauge groups}
   137	\label{sec:lie}
   138	
   139	The structure group of a gauge theory is a Lie group, and the first classification question is which Lie groups may serve. The answer is complete on the algebra side.
   140	
   141	\begin{theorem}[Killing\textendash{}Cartan classification]
   142	\label{thm:killing-cartan}
   143	Complex semisimple Lie algebras are classified up to isomorphism by Dynkin diagrams of types $A_r$, $B_r$, $C_r$, $D_r$, $G_2$, $F_4$, $E_6$, $E_7$, $E_8$~\cite{humphreys, serre}. Real simple Lie algebras are classified by Satake diagrams; the real forms of a given complex simple algebra $\mathfrak{g}$ correspond to the conjugacy classes of involutive automorphisms of $\mathfrak{g}$, equivalently to conjugacy classes of Cartan involutions. Connected Lie groups with Lie algebra $\mathfrak{g}$ are classified by discrete subgroups $Z'$ of the center of the universal covering group $\widetilde{G}$: each such group is a quotient $\widetilde{G}/Z'$.
   144	\end{theorem}
   145	
   146	\begin{proof}
   147	The complex case is the classification of root systems up to isomorphism. A root system spans a rational Euclidean space, and the integrality conditions force the Cartan integers $\langle \alpha_i, \alpha_j^\vee \rangle = 2(\alpha_i, \alpha_j)/(\alpha_j, \alpha_j)$ to lie in the list of Cartan matrices of finite type. Simplicity of the algebra corresponds to connectedness of the diagram, and the Serre presentation recovers the isomorphism class from the diagram. For the real case Cartan's theorem assigns to each real form its conjugacy class of involutive automorphisms of the complex algebra, and the Satake diagram records the induced diagram involution together with the split between compact and noncompact simple roots. For the group statement, every connected Lie group with Lie algebra $\mathfrak{g}$ is a quotient of the universal covering group $\widetilde{G}$ by a discrete subgroup of its center, and every such quotient is a connected Lie group with algebra $\mathfrak{g}$.
   148	\end{proof}
   149	
   150	The theorem classifies the gauge algebra; the simply connected group and its central quotients then classify the connected gauge group. It does not classify the bundle, the connection, the dynamics, or the matter content.
   151	
   152	\begin{theorem}[Highest-weight classification]
   153	\label{thm:highest-weight}
   154	Let $\mathfrak{g}$ be a complex semisimple Lie algebra. Finite-dimensional irreducible representations of $\mathfrak{g}$ are in bijection with dominant integral weights; the representation with highest weight $\lambda$ exists and is unique up to isomorphism~\cite{humphreys}.
   155	\end{theorem}
   156	
   157	\begin{proof}
   158	Uniqueness is the classification of a representation by its highest weight: the weight strings of a finite-dimensional irreducible are determined by the action of the raising and lowering operators, and the highest weight is annihilated by every raising operator and integral in the weight lattice. Existence is the content of the Borel-Weil construction, or equivalently of the Verma module with the maximal proper submodule quotiented out; the quotient is finite-dimensional exactly when the highest weight is dominant integral. Irreducibility follows because every nonzero submodule contains a highest weight vector, and the highest weight space of an irreducible is one-dimensional.
   159	\end{proof}
   160	
   161	Together these two theorems give the complete Lie-theoretic layer of a gauge theory: the gauge algebra by its Dynkin diagram, the real form by its Satake diagram, the connected gauge group by central quotient data, and the finite-dimensional matter representations by dominant integral weights. Example instantiations of the invariant record appear in the code evidence of Section~\ref{sec:experiments}.
   162	
   163	\begin{example}[The gauge algebra of quantum chromodynamics]
   164	\label{ex:su3}
   165	Take $\mathfrak{g} = \mathfrak{su}(3)$, the Lie algebra of $\mathrm{SU}(3)$. Its Dynkin diagram is $A_2$, two nodes joined by a single edge, and the Killing\textendash{}Cartan theorem records that no other complex simple algebra carries this diagram. The real form is compact, and the corresponding real simple algebra is the compact $\mathfrak{su}(3)$ itself; the split real form $\mathfrak{sl}(3, \mathbb{R})$ is a different real form of the same complex algebra and is distinguished by its Satake diagram. The fundamental weights $\lambda_1$ and $\lambda_2$ label the defining representation $\mathbf{3}$ and its conjugate $\bar{\mathbf{3}}$, and the highest weight of the adjoint representation is $\lambda_1 + \lambda_2$, giving the octet $\mathbf{8}$. Quarks in the defining representation, antiquarks in the conjugate, and gluons in the adjoint are therefore classified as representations by the dominant integral weights of $A_2$, and the matter content of the theory is a list of weights. The classification stops there: the interaction, the renormalization, and the spectrum of bound states are outside the highest-weight theorem.
   166	\end{example}
   167	
   168	\begin{remark}
   169	The classification does not reach the dynamics of a gauge theory. Infinite-dimensional representations of the gauge group, the spectrum of the covariant Laplacian on a bundle, the Yang-Mills functional, and the quantum theory built from them are outside the scope of the Killing\textendash{}Cartan and highest-weight statements. A gauge theory is not classified by its gauge algebra alone.
   170	\end{remark}
   171	
   172	\begin{remark}[Reductive groups and the center]
   173	\label{rem:reductive}
   174	A reductive gauge group is a central product of a semisimple group with a torus, so the classification extends by adjoining the rank of the torus to the Dynkin datum. The datum that distinguishes the global forms is the discrete central subgroup of the universal cover, and it is not visible in the Dynkin diagram: $\mathrm{SU}(2)$ is the universal cover of $\mathrm{SO}(3)$ and has center $\mathbb{Z}/2$, while $\mathrm{SO}(3)$ has trivial center, and both share the diagram $A_1$. The classification of gauge groups up to isomorphism therefore requires both the diagram and the quotient data of Theorem~\ref{thm:killing-cartan}, and the bundle classification records the difference, as Example~\ref{ex:global-form} shows.
   175	\end{remark}
   176	
   177	\section{Bundles and characteristic classes}
   178	\label{sec:bundles}
   179	
   180	Let $G$ be a Lie group and $X$ a paracompact Hausdorff space. Write $\mathrm{GBund}(X)$ for the set of isomorphism classes of principal $G$-bundles over $X$. Over a paracompact base every principal $G$-bundle with Lie structure group is numerable, so no further restriction on the bundles is needed.
   181	
   182	\begin{theorem}[Classification by the classifying space]
   183	\label{thm:bundles}
   184	Let $G$ be a Lie group and $X$ a paracompact Hausdorff space. The map that sends a principal $G$-bundle to its classifying map induces a bijection~\cite{milnor, dold, steenrod}
   185	\[
   186	\mathrm{GBund}(X) \cong [X, BG],
   187	\]
   188	and the characteristic classes of a bundle are exactly the pullbacks along its classifying map of the universal characteristic classes in $H^*(BG)$~\cite{milnor-stasheff}.
   189	\end{theorem}
   190	
   191	\begin{proof}
   192	The Milnor infinite join construction builds a numerable universal bundle $EG \to BG$ for any topological group $G$~\cite{milnor}. The universal property states that a principal $G$-bundle $P \to X$ is classified by a map $f: X \to BG$, with $P \cong f^*(EG)$, exactly when $P$ is numerable; two classifying maps for the same bundle are homotopic, and homotopic maps have isomorphic pullbacks~\cite{dold, steenrod}. Over a paracompact base every principal $G$-bundle with Lie structure group is numerable, so the universal property applies to every bundle of $\mathrm{GBund}(X)$ and the map is a bijection. For the second statement, a universal characteristic class is a cohomology class $\kappa \in H^*(BG)$, and the characteristic class of a bundle with classifying map $f$ is defined as $f^*(\kappa)$. The definition is stable under bundle isomorphism, and every natural characteristic class arises this way, since a natural transformation on homotopy classes is determined by its value on the universal bundle~\cite{milnor-stasheff}.
   193	\end{proof}
   194	
   195	The theorem is the complete classification of principal bundles. Two consequences follow.
   196	
   197	\begin{proposition}[Bundles over spheres]
   198	\label{prop:spheres}
   199	Let $G$ be a connected Lie group and $n \geq 1$. Isomorphism classes of principal $G$-bundles over $S^n$ are in bijection with $\pi_{n-1}(G)$.
   200	\end{proposition}
   201	
   202	\begin{proof}
   203	By Theorem~\ref{thm:bundles} the classes form $[S^n, BG] = \pi_n(BG)$, since $BG$ is connected. The fibration $G \to EG \to BG$ with contractible total space has long exact homotopy sequence
   204	\[
   205	\cdots \to \pi_n(EG) \to \pi_n(BG) \to \pi_{n-1}(G) \to \pi_{n-1}(EG) \to \cdots,
   206	\]
   207	and both homotopy groups of $EG$ vanish, so $\pi_n(BG) \cong \pi_{n-1}(G)$.
   208	\end{proof}
   209	
   210	\begin{example}[Line bundles over the sphere]
   211	\label{ex:line}
   212	For $G = \mathrm{U}(1)$ and $n = 2$, Proposition~\ref{prop:spheres} gives $\pi_1(\mathrm{U}(1)) \cong \mathbb{Z}$, and the isomorphism class is detected by the first Chern class $c_1 \in H^2(S^2; \mathbb{Z})$. Every complex line bundle over $S^2$ is a power of the Hopf bundle, and the classification is complete and parameterized by an integer.
   213	\end{example}
   214	
   215	\begin{example}[Instantons over the four-sphere]
   216	\label{ex:instanton}
   217	For $G = \mathrm{SU}(2)$ and $n = 4$, Proposition~\ref{prop:spheres} gives $\pi_3(\mathrm{SU}(2)) \cong \mathbb{Z}$, and the integer is the instanton number, computed as the second Chern class of the associated complex vector bundle. For $n = 2$ and $n = 3$ the groups $\pi_1(\mathrm{SU}(2))$ and $\pi_2(\mathrm{SU}(2))$ vanish, so every principal $\mathrm{SU}(2)$-bundle over $S^2$ or $S^3$ is trivial. The nontrivial topology appears only in the dimension where the third homotopy group of the gauge group is nontrivial.
   218	\end{example}
   219	
   220	\begin{example}[Global forms and the second Stiefel-Whitney class]
   221	\label{ex:global-form}
   222	The choice of global form of the gauge group changes the bundle classification. For $G = \mathrm{SO}(3)$ the first homotopy group is $\pi_1(\mathrm{SO}(3)) \cong \mathbb{Z}/2$, so Proposition~\ref{prop:spheres} gives two isomorphism classes of principal $\mathrm{SO}(3)$-bundles over $S^2$, detected by the second Stiefel-Whitney class $w_2$. The nontrivial class is the bundle of tangent 2-planes, and it admits no lift to a principal $\mathrm{SU}(2)$-bundle, since $\pi_1(\mathrm{SU}(2)) = 0$ forces every $\mathrm{SU}(2)$-bundle over $S^2$ to be trivial. Matter fields in a spinorial representation therefore distinguish the global form $\mathrm{SU}(2)$ from $\mathrm{SO}(3)$, and the classification of bundles records that distinction as a cohomology class rather than as a property of the Lie algebra.
   223	\end{example}
   224	
   225	\begin{remark}[Local models carry no classification content]
   226	\label{rem:local}
   227	Principal bundles carry only global topological invariants. Locally every principal bundle is trivial, so no local invariant of a bundle exists; the invariants are homotopy-theoretic and cohomological. This is the same phenomenon that Darboux's theorem displays in symplectic geometry, and it marks the contrast with Riemannian geometry, where curvature supplies local invariants.
   228	\end{remark}
   229	
   230	Connections on a classified bundle add analytic data. The Chern\textendash{}Weil homomorphism assigns to an invariant polynomial on the Lie algebra the cohomology class of its evaluation on the curvature of any connection, and the class is independent of the connection. In the case $G = \mathrm{U}(1)$ the class $[\Omega/2\pi]$ of the curvature two-form is the first Chern class of the line bundle, so the connection refines, but does not extend, the classification. The classification theorem for bundles is unaffected by connection data. Connections are classified only modulo gauge in restricted settings, and we record no general classification theorem for connections.
   231	
   232	\begin{definition}[Gauge equivalence of connections]
   233	\label{def:gauge-equivalence}
   234	Two connections $\omega_1$ and $\omega_2$ on a principal $G$-bundle $P \to X$ are gauge equivalent when a bundle automorphism $g: P \to P$ over the identity of $X$ satisfies $g^*\omega_2 = \omega_1$. The moduli space of connections on a fixed bundle is the quotient of the affine space of connections by this gauge action. Its singularities are the reducible connections, whose stabilizer is larger than the center of $G$, and those points obstruct a smooth quotient description.
   235	\end{definition}
   236	
   237	No classification of the moduli space of connections is on the record. The bundle classification delivers its topological stratification: each bundle isomorphism class carries its own moduli space of connections, and the Chern\textendash{}Weil map sends each to the same characteristic classes. The instanton number of Example~\ref{ex:instanton} is constant on the connected components of a moduli space, so the topological classification is the first invariant of the analytic one.
   238	
   239	\begin{proposition}[Characteristic classes of the classical groups]
   240	\label{prop:classical-classes}
   241	For $G = \mathrm{U}(n)$ the classifying cohomology $H^*(B\mathrm{U}(n); \mathbb{Z})$ is a polynomial ring on the Chern classes $c_1, \ldots, c_n$. For $G = \mathrm{SO}(2k+1)$ the rational cohomology $H^*(B\mathrm{SO}(2k+1); \mathbb{Q})$ is a polynomial ring on the Pontryagin classes $p_1, \ldots, p_k$. For $G = \mathrm{SO}(2k)$ the rational cohomology $H^*(B\mathrm{SO}(2k); \mathbb{Q})$ is the free polynomial ring $\mathbb{Q}[p_1, \ldots, p_{k-1}, e]$; the top Pontryagin class is the element $p_k = e^2$ and is not an independent generator. For $G = \mathrm{SU}(n)$ the class $c_1$ vanishes and $H^*(B\mathrm{SU}(n); \mathbb{Z})$ is a polynomial ring on $c_2, \ldots, c_n$.
   242	\end{proposition}
   243	
   244	\begin{proof}
   245	Each statement is the computation of the cohomology of the classifying space for the given group. For the unitary group one pulls back the tautological bundle over the Grassmannian, splits it formally into Chern roots, and reads off the elementary symmetric polynomials; the splitting principle shows that the Chern classes generate the ring. For the special unitary group the determinant line is trivial, which sets $c_1$ to zero and leaves the remaining classes free. For the special orthogonal group the Pontryagin classes are the Chern classes of the complexification, the rational statement drops the torsion, and in even rank the top Pontryagin class equals the square of the Euler class, so $e$ replaces $p_k$ among the generators.
   246	\end{proof}
   247	
   248	The proposition gives the universal class ring whose pullbacks classify bundles in each classical case. The table of sphere bundles in Example~\ref{ex:line} and Example~\ref{ex:instanton} is the shadow of these rings on low-dimensional bases.
   249	
   250	\section{Anomalies as obstructions}
   251	\label{sec:anomalies}
   252	
   253	An anomaly is the failure of a classical gauge symmetry to survive quantization. Its mathematical signature is the nontriviality of a line or of a cohomology class, and its classification content is the vanishing test for those classes.
   254	
   255	\begin{definition}[Fermionic anomaly]
   256	\label{def:fermionic-anomaly}
   257	Let $M$ be a compact spin manifold, $P \to M$ a principal $G$-bundle with $G$ a compact Lie group, $\mathcal{A}$ the space of connections on $P$, and $\mathcal{G}$ the gauge group acting on $\mathcal{A}$. The determinant line of a family of Dirac operators assigns to each connection $A$ the determinant line of $D_A$, and these lines assemble into a complex line bundle $\lambda_{\mathrm{det}}$ over the gauge orbit space $\mathcal{A}/\mathcal{G}$, or over $\mathcal{A}$ when the family is lifted~\cite{quillen, atiyah-singer}. The fermionic anomaly is the obstruction to trivializing $\lambda_{\mathrm{det}}$, or its Pfaffian square root in the Majorana case. The theory is consistent only where the line bundle is trivializable.
   258	\end{definition}
   259	
   260	\begin{definition}[BV-BRST gauge anomaly]
   261	\label{def:bvbrst-anomaly}
   262	Let $n$ be the spacetime dimension. The BV-BRST gauge anomaly is the obstruction class in the local BRST cohomology $H^{1,n}(s\mid d)$: the cohomology of the BRST differential $s$ on local functionals of the fields and ghosts, modulo total spacetime derivatives $d$, at ghost number one and form degree $n$. The class satisfies the Wess\textendash{}Zumino consistency condition~\cite{wess-zumino, bbh}. The Chevalley\textendash{}Eilenberg complex $\mathrm{CE}(\mathfrak{g})$ of the gauge algebra computes the zero-form part of the BRST double complex: $H^1(\mathrm{CE}(\mathfrak{g}))$ classifies the abelian quotients of $\mathfrak{g}$, and $H^2(\mathrm{CE}(\mathfrak{g}))$ its central extensions.
   263	\end{definition}
   264	
   265	\begin{proposition}[Quantization gate]
   266	\label{prop:anomaly}
   267	A gauge theory admits a consistent quantization only where the determinant line $\lambda_{\mathrm{det}}$ of the Dirac family is trivializable and its anomaly cocycle $[a]$ vanishes in the local BRST cohomology $H^{1,n}(s\mid d)$. The group $H^{1,n}(s\mid d)$ is the space of candidate anomalies of the theory; the specific cocycle $[a]$ is the anomaly of the theory at hand. These two vanishing conditions are the classification content of the anomaly: the obstruction classes are natural in the gauge configuration and classify the inconsistent directions.
   268	\end{proposition}
   269	
   270	\begin{proof}
   271	If the determinant line of the family is nontrivial, the path integral measure is a section of a nontrivial line bundle rather than a measure, and gauge transformations multiply the partition function by a nontrivial phase; gauge invariance of the measure fails exactly then. The measure exists exactly when $\lambda_{\mathrm{det}}$ is trivializable. The BRST anomaly class is the obstruction to the nilpotency of the quantized BRST charge: the classical BRST differential satisfies $s^2 = 0$, and the quantum deformation fails to be nilpotent exactly when the anomaly cocycle $[a]$ is nonzero in $H^{1,n}(s\mid d)$. The Wess\textendash{}Zumino consistency condition is the integrability condition for this class and holds by construction~\cite{bbh}. Both constructions are functorial in the gauge configuration, so the obstruction classes are natural and the vanishing test is a classification of the inconsistent directions.
   272	\end{proof}
   273	
   274	The anomaly statement is the model of a complete obstruction classification: the classification content of the theory is the vanishing of the obstruction. No list of consistent theories is asserted; what is asserted is a necessary and sufficient condition for consistency. Anomaly cancellation conditions then become computable inputs to the classification of matter content: a matter representation contributes to the anomaly classes, and only the representations whose contributions cancel are admissible.
   275	
   276	\begin{example}[Algebraic obstruction data of a gauge algebra]
   277	\label{ex:abelian-anomaly}
   278	Take the gauge algebra to be the two-dimensional non-abelian algebra with basis $e_1, e_2$ and bracket $[e_1, e_2] = e_2$. The Chevalley\textendash{}Eilenberg differential on the dual basis $e^1, e^2$ is $d e^1 = 0$ and $d e^2 = -e^1 \wedge e^2$. The class of $e^1$ in $H^1(\mathrm{CE}(\mathfrak{g}))$ is closed and not exact, so $H^1$ is nonzero and the algebra has a nontrivial abelian quotient; $H^2$ vanishes because $d$ maps the span of $e^2$ onto the whole of $\Lambda^2$. This computation is the algebraic shadow of Definition~\ref{def:bvbrst-anomaly}: the full field-theory anomaly of a gauge theory over a spacetime is computed in the local cohomology $H^{1,n}(s\mid d)$, and the Chevalley\textendash{}Eilenberg classes record the abelian-quotient and central-extension data of the gauge algebra alone. The computation is reproduced by the Chevalley\textendash{}Eilenberg experiment of Section~\ref{sec:experiments}.
   279	\end{example}
   280	
   281	Two limitations bound this obstruction statement. The cohomological statement classifies the obstruction and does not by itself construct the quantized theory in the cases where the obstructions vanish. A global anomaly may also remain after the local obstruction classes vanish; the analysis above is the local layer, and the full classification of global anomalies is a further problem on our open list.
   282	
   283	\begin{proposition}[Anomaly cancellation as a linear condition]
   284	\label{prop:cancellation}
   285	Fix a compact simple gauge group $G$ and let the matter content be a finite list of finite-dimensional irreducible representations $R_1, \ldots, R_k$ with highest weights $\lambda_1, \ldots, \lambda_k$. The contribution of each representation to a fixed anomaly class is additive, so there is a homomorphism of abelian groups
   286	\[
   287	\alpha \colon R(G) \longrightarrow A,
   288	\]
   289	from the representation ring of $G$ to the coefficient group $A$ of the anomaly in question, and the anomaly-free matter lists form $\ker \alpha$. For the four-dimensional perturbative gauge anomaly $A = \mathbb{Z}$ and $\alpha(R)$ is the anomaly coefficient of $R$; for global anomalies $A$ is the relevant cobordism group of $G$. The admissible matter lists are cut out by linear conditions on the weight data, computable from Theorem~\ref{thm:highest-weight} and Proposition~\ref{prop:anomaly} together.
   290	\end{proposition}
   291	
   292	\begin{proof}
   293	The anomaly classes of a direct sum of representations add, since the determinant line of a direct sum is the tensor product of the determinant lines and the BRST differential is linear in the representation data. The assignment $\alpha$ is therefore a homomorphism of abelian groups, and its kernel is the set of virtual representations whose anomaly vanishes. The physical condition restricts to actual representations, so the admissible lists are the nonnegative elements of $\ker \alpha$ in the basis of irreducibles. The highest-weight theorem supplies the basis, and the anomaly computation of Proposition~\ref{prop:anomaly} supplies $\alpha$.
   294	\end{proof}
   295	
   296	The proposition turns the anomaly condition into a classification problem for matter content: once the gauge algebra is fixed by its Dynkin diagram, the admissible representations are a computable submonoid of the representation ring. Whether that submonoid is finite or infinite depends on the group and on the anomaly in question, and we record no general finiteness statement.
   297	
   298	\section{Functorial and extended topological field theory}
   299	\label{sec:tqft}
   300	
   301	The Atiyah axioms package a $d$-dimensional topological quantum field theory as a symmetric monoidal functor $Z$ from the cobordism category $\mathrm{Cob}_d$ to vector spaces: a closed $(d-1)$-manifold $\Sigma$ maps to a vector space $Z(\Sigma)$, a cobordism $M: \Sigma_1 \to \Sigma_2$ maps to a linear map $Z(M): Z(\Sigma_1) \to Z(\Sigma_2)$, composition is preserved, disjoint union is tensor product, and the empty manifold maps to the unit field. The axioms make the topological case tractable in contrast to the general non-topological case, where no comparable functorial formulation is available.
   302	
   303	\begin{theorem}[Two-dimensional topological field theories]
   304	\label{thm:frobenius}
   305	The category of two-dimensional Atiyah topological quantum field theories with values in vector spaces is equivalent to the category of commutative Frobenius algebras~\cite{atiyah-tqft}.
   306	\end{theorem}
   307	
   308	\begin{proof}
   309	Given a theory $Z$, the circle maps to the algebra $A = Z(S^1)$, the pair of pants with two incoming circles and one outgoing circle gives multiplication $m: A \otimes A \to A$, the reversed pair of pants gives comultiplication $\Delta: A \to A \otimes A$, the disc with one outgoing circle gives the counit, and the reversed disc gives the unit. The Atiyah gluing axioms say precisely that $m$ is associative and unital and that $\Delta$ is coassociative and counital. The Frobenius condition is that $\Delta$ is a homomorphism of $A$-bimodules:
   310	\[
   311	\Delta \circ m = (m \otimes \mathrm{id}_A) \circ (\mathrm{id}_A \otimes \Delta) = (\mathrm{id}_A \otimes m) \circ (\Delta \otimes \mathrm{id}_A),
   312	\]
   313	as maps $A \otimes A \to A \otimes A$; it is the statement that a cylinder cut along a circle decomposes in either order. Commutativity of $m$ is the invariance of the pair of pants under rotation of its incoming boundary. The Euler element $e = m(\Delta(1)) \in A$ is the state assigned to the punctured torus, and the closed genus-one surface evaluates to the scalar $Z(\Sigma_1) = \varepsilon(e)$. Conversely a commutative Frobenius algebra $A$ extends to a functor on two-dimensional cobordisms by cutting each surface along circles into elementary pieces, mapping each piece to the corresponding tensor built from $m$, $\Delta$, the unit, and the counit; the cutting invariance follows from the Frobenius identity, so the value of $Z(M)$ is independent of the chosen decomposition. Both constructions are inverse to each other up to natural isomorphism.
   314	\end{proof}
   315	
   316	The theorem is a complete and parameterized classification of two-dimensional functorial theories, and it illustrates the general pattern of this volume: classification succeeds precisely where the physics is topological, because the topological invariance reduces the object to finite-dimensional algebra. Higher-dimensional functorial theories admit analogous invariants built from dualizability data, and we state no classification theorem for them here.
   317	
   318	The Frobenius algebra computes every invariant of the theory. The cylinder gives the identity map, the pair of pants gives multiplication, the disc gives unit and counit, and a closed oriented surface of genus $g$ evaluates to the $g$-th power of the Euler element $e = m \circ \Delta(1)$ composed with the counit, so the partition function of the theory is determined by one element of the algebra. Cutting a surface along any circle and reassembling gives the same value, and that cutting independence is the Frobenius identity. The classification is therefore effective: write down a commutative Frobenius algebra, and every observable of the two-dimensional theory is computed from its structure constants.
   319	
   320	The extended version asks for a symmetric monoidal higher functor on the fully extended cobordism category, assigning data not only to closed manifolds and cobordisms but to corners and deeper strata. The Baez\textendash{}Dolan cobordism hypothesis proposes the classification.
   321	
   322	\begin{conjecture}[Cobordism hypothesis]
   323	\label{conj:cobordism}
   324	The $n$-dimensional extended unitary topological quantum field theories valued in a symmetric monoidal $(\infty, n)$-category are classified by fully dualizable objects of the target with an $O(n)$-action. A fully extended theory is a symmetric monoidal $n$-functor out of the free stable weak $n$-category with duals on a point~\cite{baez-dolan, lurie}.
   325	\end{conjecture}
   326	
   327	The status of this statement is a claim with a proof gap. The 1995 paper states the hypothesis; the 2009 work describes itself as an informal sketch of a proof, and the range of cases in which the classification is complete is not settled on the public record. We therefore record the extended classification as claimed rather than proved, and no result in this volume depends on it as a theorem. Low-dimensional cases are the subject of later work; resolving which of those cases carry complete proofs is an open item.
   328	
   329	\begin{remark}[What topological classification does not give]
   330	\label{rem:tqft-scope}
   331	A topological quantum field theory is a functorial invariant of manifolds up to cobordism, not a quantum field theory on a fixed spacetime with local degrees of freedom. The classification results in this section say nothing about Yang-Mills theory, quantum chromodynamics, or any theory with a metric and a renormalization problem. The line between the topological and the local is the line between classification and the claims register.
   332	\end{remark}
   333	
   334	\section{Algebraic quantum field theory and superselection}
   335	\label{sec:aqft}
   336	
   337	The algebraic framework postulates the observables of a quantum field theory as a local net: an assignment of a $\mathrm{C}^*$-algebra $\mathcal{A}(\mathcal{O})$ to each open region $\mathcal{O}$ of spacetime, with isotony for nested regions, graded commutation for spacelike separated regions, covariance under the Poincar\'e group, a spectrum condition, and the existence of a vacuum. The axiom list has evolved and remains under discussion, so the framework is conditional on the axiom set in force.
   338	
   339	\begin{definition}[Local net]
   340	\label{def:local-net}
   341	A local net on Minkowski spacetime assigns to each double cone $\mathcal{O}$ a unital $\mathrm{C}^*$-algebra $\mathcal{A}(\mathcal{O})$ such that isotony holds for inclusions $\mathcal{O}_1 \subset \mathcal{O}_2$, graded locality holds for spacelike separation, the Poincar\'e group acts by automorphisms covariantly, the spectrum of the generator of time translations is contained in the closed forward cone, and a vacuum state exists~\cite{haag-kastler}. A representation of the net is a representation of the quasilocal algebra $\mathcal{A}$ that is generated by the local algebras.
   342	\end{definition}
   343	
   344	\begin{definition}[DHR criterion]
   345	\label{def:dhr}
   346	A representation $\pi$ of a local net satisfies the DHR criterion when its restriction to the algebra of the causal complement of every bounded region is equivalent to the vacuum representation~\cite{dhr}. Two such representations are equivalent when a unitary intertwiner exists.
   347	\end{definition}
   348	
   349	The reconstruction theorem holds in Minkowski spacetime of dimension at least $2+1$, where the causal complement of a double cone is connected and locality supplies the permutation symmetry of localized endomorphisms. In spacetime dimension $1+1$ the causal complement of a double cone is disconnected, the braid group replaces the permutation group, and the sector category is braided rather than symmetric; the compact group of Theorem~\ref{thm:dr} is then replaced by quantum-group data.
   350	
   351	The DHR selection criterion isolates the representations that arise from local degrees of freedom. Under the additional hypothesis of Haag duality the selected representations correspond to localized transportable endomorphisms of the observable net, and the sectors form a tensor category under composition of endomorphisms.
   352	
   353	\begin{theorem}[Doplicher\textendash{}Roberts reconstruction]
   354	\label{thm:dr}
   355	Let $\mathcal{C}$ be a symmetric tensor $\mathrm{C}^*$-category with conjugates, direct sums, subobjects, and $\mathrm{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent to the category of finite-dimensional unitary representations of a compact group $G$ equipped with a distinguished central element $k$ of order at most two, $k^2 = e$, whose adjoint action implements the $\mathbb{Z}/2$ grading of the statistics; in the graded language this data is a compact supergroup. The pair $(G, k)$ is unique up to isomorphism~\cite{dr, dhr}. Applied to the DHR category of a local net satisfying Haag duality, the theorem reconstructs a compact gauge group from the superselection sectors.
   356	\end{theorem}
   357	
   358	\begin{proof}
   359	The proof has three stages. The existence of conjugates and subobjects gives the category the structure of a rigid $\mathrm{C}^*$-tensor category; the symmetric structure supplies a dimension function and the categorical traces that make the abstract notion of dimension well-defined. The reconstruction of the group proceeds by taking the endomorphisms of the forgetful functor on the representation category and recovering $G$ as the group of natural automorphisms of the identity on the completed category; the $\mathrm{C}^*$-structure identifies the completed category with the unitary representations of the compact group. Uniqueness follows because a compact group is determined up to isomorphism by its finite-dimensional unitary representation category together with the symmetric monoidal structure.
   360	\end{proof}
   361	
   362	The hypotheses travel with the theorem. Dropping the symmetric structure invalidates the recovery: there exist non-isomorphic finite groups with equivalent representation categories as plain tensor categories~\cite{etingof-gelaki}, so any equivalence that forgets the symmetric layer cannot recover the group, and any classification built on such an equivalence is false. Braided variants require additional data; in the braided Galois setting the fixed-point-net representation categories need extra soliton data beyond the braiding~\cite{mueger}.
   363	
   364	Deligne's theorem supplies the abstract classification of the symmetric tensor categories that the reconstruction produces.
   365	
   366	\begin{theorem}[Deligne's theorem]
   367	\label{thm:deligne}
   368	An abelian, $k$-linear, rigid symmetric monoidal category over an algebraically closed field of characteristic zero, with $\mathrm{End}(\mathbf{1}) = k$ and subexponential growth, is equivalent to the category of representations of an affine supergroup scheme~\cite{deligne}.
   369	\end{theorem}
   370	
   371	\begin{proof}
   372	The proof exhibits a fiber functor by a Tannakian argument: the subexponential growth condition bounds the dimensions of simple objects, the symmetric structure gives the braiding needed for a faithful tensor functor to super vector spaces, and the resulting fiber functor presents the category as representations of its automorphism group scheme. The supergrading arises from the possible nontriviality of the symmetry on odd parts.
   373	\end{proof}
   374	
   375	The reconstruction results classify the sector categories of nets that satisfy the hypotheses. Three frontier directions are on the record and none of them is settled. The first generalizes the DHR analysis to higher-form symmetries and notes that an extra factor of order two is not ruled out and would not be realizable by Lagrangian gauge models~\cite{casini-magan}; this is a single-source claim and we record it without weight. The second constructs a global quantum gauge group through a braided Doplicher\textendash{}Roberts program~\cite{pinzari}; it is work in progress at the preprint stage. The third is the soliton-data warning already cited~\cite{mueger}, which is proved and shows that fixed-point-net sector categories need data beyond the braiding.
   376	
   377	\begin{remark}[Long-range forces]
   378	\label{rem:long-range}
   379	The DHR criterion selects representations whose deviations from the vacuum are localized. Electromagnetism has long-range fields and its charged representations violate the strict localization hypothesis, so the DHR analysis as stated does not cover quantum electrodynamics without modification. The classification of sectors is therefore a classification within a restricted hypothesis class, not of all quantum field theories.
   380	\end{remark}
   381	
   382	\section{Reconstruction and classification}
   383	\label{sec:reconstruction}
   384	
   385	The Doplicher\textendash{}Roberts theorem is a reconstruction theorem: it recovers a group from the probe data of its representation category. A second line of reconstruction results runs through commutative and topological probes, and comparing the two clarifies what the gauge classification of this volume does and does not achieve.
   386	
   387	\begin{theorem}[Reconstruction from commutative probes]
   388	\label{thm:gelfand}
   389	The Gelfand\textendash{}Naimark theorem embeds every $\mathrm{C}^*$-algebra in an algebra of operators on a Hilbert space, and for commutative $\mathrm{C}^*$-algebras the Gelfand transform is an isomorphism onto the continuous functions on the Gelfand spectrum~\cite{gelfand-naimark}. Stone duality is the Boolean analogue: a Boolean algebra is recovered from its space of ultrafilters~\cite{stone}. In each case the object is determined by its commutative or Boolean probe data.
   390	\end{theorem}
   391	
   392	\begin{proof}
   393	The Gelfand transform sends an element of a commutative unital $\mathrm{C}^*$-algebra to the function on the maximal ideal space given by evaluation; the spectral radius formula gives continuity, multiplicativity is immediate, and the $\mathrm{C}^*$-identity supplies the isometry property that makes the transform injective and surjective onto $C_0(\Omega)$. The noncommutative embedding is the GNS construction applied to a separating family of states. Stone's theorem is the categorical equivalence between Boolean algebras and the totally disconnected compact Hausdorff spaces, with ultrafilter spaces as the spectrum functor.
   394	\end{proof}
   395	
   396	Reconstruction and classification answer different questions. A classification theorem names an invariant whose value determines the object up to a stated equivalence, and its output is a parameter space. A reconstruction theorem recovers the object from a class of probes, and its output is a functor that rebuilds the object. Theorem~\ref{thm:gelfand} rebuilds an algebra from its commutative probes, Theorem~\ref{thm:dr} rebuilds a gauge group from its representation-category probes, and Theorem~\ref{thm:bundles} classifies bundles by homotopy-class data without rebuilding them. The gauge group recovered by Doplicher\textendash{}Roberts is the global form data of Example~\ref{ex:global-form}, which the local algebra of observables cannot see; the reconstruction is therefore genuinely recovering structure rather than reparameterizing it.
   397	
   398	The pattern matters for the series program because reconstruction is better developed than classification in several domains. Where a classification is open, a reconstruction result may still recover the object from probes, and where a reconstruction exists, the recovered data becomes a candidate classifying invariant. We record both kinds of result for the gauge and topological domains and mark the boundary between them: bundles are classified, gauge groups are reconstructed from sectors, and the analytic moduli spaces of connections are neither.
   399	
   400	\section{Invariant records for gauge theories}
   401	\label{sec:invariants}
   402	
   403	The series records the structural invariant record of a theory $T$ as a five-tuple
   404	\[
   405	\mathcal{I}(T) = (\mathcal{S}_T, \mathcal{O}_T, \mathcal{D}_T, \mathcal{G}_T, \mathcal{R}_T),
   406	\]
   407	describing states, observables, dynamics, symmetries, and representations. Instantiating the record for the gauge and topological theories of this volume shows exactly which components the classification results reach.
   408	
   409	For a Yang-Mills system on a four-manifold with gauge group $G$, the state component $\mathcal{S}_T$ is the moduli space of connections modulo gauge, classified only in its topological stratification by the bundle data. The observable component $\mathcal{O}_T$ is generated by Wilson loops and curvature polynomials, with no classification theorem in this volume. The dynamics component $\mathcal{D}_T$ is the Yang-Mills functional, outside all our theorems. The symmetry component $\mathcal{G}_T$ is the gauge group together with its global form, classified by Theorem~\ref{thm:killing-cartan} and Example~\ref{ex:global-form}. The representation component $\mathcal{R}_T$ is the matter content, classified by Theorem~\ref{thm:highest-weight} and constrained by Proposition~\ref{prop:cancellation}.
   410	
   411	For a two-dimensional topological theory the record is sharper. The state component is the vector space assigned to the circle, the observable component is the Frobenius algebra of Theorem~\ref{thm:frobenius}, the dynamics is empty because the theory has no local degrees of freedom, the symmetry is the mapping-class action on the assigned spaces, and the representations are the modules over the Frobenius algebra. All five components are determined by the commutative Frobenius algebra, which is why the classification is complete in this case.
   412	
   413	For a local net satisfying the DHR hypotheses, the representation component $\mathcal{R}_T$ is the sector category, classified by Theorem~\ref{thm:dr} up to symmetric monoidal equivalence, and the symmetry component $\mathcal{G}_T$ is recovered from it by reconstruction. The state, observable, and dynamics components are those of the net itself and are not classified here.
   414	
   415	The classification results of this volume cover the symmetry and representation components of the gauge record and all components of the topological record. The analytic components are open, and the constructive quantum field theory claims of Section~\ref{sec:claims} are attempts to reach them that have not yet arrived.
   416	
   417	\section{Claims in constructive quantum field theory}
   418	\label{sec:claims}
   419	
   420	The claim ladder separates an announced result, a manuscript, a machine-checked formalization, an independently verified proof, and an accepted theorem; a result moves up the ladder only by an artifact that can be checked, and each row of the register below keeps its current rung. Table~\ref{tab:rigorous} collects rigorous results in restricted regimes and the official problem status. Table~\ref{tab:claims} collects claims that lack public proof artifacts.
   421	
   422	\begin{table}[ht]
   423	\centering
   424	\small
   425	\caption{Rigorous results in restricted regimes and the official problem status, as of 29 October 2026. Each row is proved or official within its stated scope.}
   426	\label{tab:rigorous}
   427	\begin{tabularx}{\textwidth}{L{0.20\textwidth} X L{0.30\textwidth}}
   428	\toprule
   429	Entry & Content & Status on the record \\
   430	\midrule
   431	Clay problem status & A positive mass gap for four-dimensional Yang-Mills theory & Open. The Clay Mathematics Institute lists the problem as unsolved and records that no proof of the property is known~\cite{clay} \\
   432	\addlinespace
   433	Nissim lattice theorem & Mass gap, unique infinite-volume limit, and large-$N$ limit for $\mathrm{U}(N)$ lattice Yang-Mills in the 't Hooft regime~\cite{nissim} & Rigorous theorem restricted to its regime. It does not address continuum four-dimensional existence or the continuum mass gap \\
   434	\addlinespace
   435	Cao\textendash{}Nissim\textendash{}Sheffield lattice theorem & Wilson area law in the 't Hooft regime by the dynamical approach~\cite{cns} & Rigorous theorem restricted to its regime, with the same limitation \\
   436	\addlinespace
   437	Faria da Veiga\textendash{}O'Carroll lattice analysis & Charge-conjugation decomposition, Elitzur theorem, and mass-term analysis for lattice $\mathrm{SU}(N)$ in four dimensions~\cite{fdv} & Rigorous results on the lattice model. They do not close the continuum limit \\
   438	\addlinespace
   439	Douglas survey & Pre-claim survey of the rigorous status: renormalization has never been made rigorous in the needed generality, and no clear path to the mass gap is known~\cite{douglas} & Published assessment, January 2026 \\
   440	\bottomrule
   441	\end{tabularx}
   442	\end{table}
   443	
   444	\begin{table}[ht]
   445	\centering
   446	\small
   447	\caption{Claims without public proof artifacts, as of 29 October 2026. None of these rows is a theorem of this volume or of the public record.}
   448	\label{tab:claims}
   449	\begin{tabularx}{\textwidth}{L{0.18\textwidth} X L{0.30\textwidth}}
   450	\toprule
   451	Claim & Content & Status on the record \\
   452	\midrule
   453	OpenAI existence claim & Rigorous existence of quantum chromodynamics, a simplest grand unified completion, and pure Yang-Mills theory as a subproblem, by Balaban-program methods~\cite{openai, kitp} & Existence claimed. Manuscript and formalization withheld. Verification pending before a committee chaired by Gross with Douglas, Jaffe, Klebanov, and Nekrasov \\
   454	\addlinespace
   455	Faizal\textendash{}Shabir construction & Reflection-positive four-dimensional $\mathrm{SU}(N)$ Yang-Mills theory with mass gap, confinement, and Osterwalder\textendash{}Schrader reconstruction~\cite{faizal} & Journal-published and unverified. Not treated as solving the Clay problem \\
   456	\addlinespace
   457	Jacobsen preprint & Existence and mass gap by a five-dimensional orbifold regulator~\cite{jacobsen} & Withdrawn by arXiv administrators for quality standards. Carries no status \\
   458	\addlinespace
   459	Nair outline & Three-dimensional mass-gap proof outline by a Laplacian eigenvalue inequality~\cite{nair} & Eleven-page preprint outline in three dimensions. No status assigned \\
   460	\bottomrule
   461	\end{tabularx}
   462	\end{table}
   463	
   464	The OpenAI claim carries the strongest external attention and the weakest public evidence. Its status string, binding on every mention of the work, is: existence claimed; manuscript and formalization withheld; verification pending~\cite{openai, kitp}. Nothing withheld from the public record can be machine-checked. The release of the artifacts is a tracked event; until then the entry belongs to the claims register and not among theorems.
   465	
   466	The mass-gap row is the hard constraint. The Clay problem requires existence and a positive mass gap together~\cite{clay}. An existence theorem alone does not settle it, so the two entries are never merged. The pre-claim survey of the field, published in January 2026~\cite{douglas}, records that rigorous renormalization has never been made rigorous in the needed generality and that no clear path to the mass gap is known; the October 2026 announcement postdates that survey, challenges its pessimism on the existence side, and confirms its assessment on the mass-gap side.
   467	
   468	The remaining rows fix the other rungs. A journal-published claim that the community has not verified stays at its rung. A withdrawn preprint leaves the ladder. An outline without proof carries no status. The lattice rows of Table~\ref{tab:rigorous} are rigorous within their regimes and say nothing about the continuum limits the classification needs.
   469	
   470	The program these claims enter has foundations older than the claims. The Osterwalder\textendash{}Schrader axioms fix the passage from Euclidean correlation functions to a Minkowski theory~\cite{osterwalder-schrader}. The renormalization-group program for lattice gauge theories that the existence claims invoke descends from Balaban's multiscale cluster expansions~\cite{balaban}. Glimm and Jaffe's text is the standard reference for constructive field theory~\cite{glimm-jaffe}. The register above is the current frontier of that program, and the classification question is which of its eventual members the invariants of the proved core will reach.
   471	
   472	If the OpenAI claim is validated, the admissible set of four-dimensional interacting theories will contain at least one rigorous member, and the classification will record where it sits relative to the known families. Until the artifacts are released, no result of this volume depends on the claim. Classifying the structures that are already proved does not wait on the verdict.
   473	
   474	A validated existence claim would establish less than it might appear. It would show that a four-dimensional interacting quantum field theory can be constructed with the stated properties, and it would settle the existence half of the Clay problem. It would not give a mass gap, it would not classify the set of such theories, and it would not place the constructed theory inside the classification of gauge structures of Sections~\ref{sec:lie} to~\ref{sec:anomalies} without further work on its gauge group, its bundle data, and its matter representations. The classification program would then face a concrete object in the claimed regime and the question of which invariants reach it. That is the practical shape of the boundary between the proved core and the claims register.
   475	
   476	\section{Computational experiments}
   477	\label{sec:experiments}
   478	
   479	Four finite-instance checks accompany this volume. They compute small examples and do not test the full domains of the theorems above, whose content is topological, continuous, or infinite-dimensional. The theorems stand on the proofs in Sections~\ref{sec:lie} to~\ref{sec:tqft}.
   480	
   481	The first group reproduces the classification table of principal bundles over spheres on small examples. For gauge groups $\mathrm{U}(1)$, $\mathrm{SU}(2)$, $\mathrm{SO}(3)$, and $\mathrm{U}(2)$ and base spheres of dimensions one to four, the script writes the homotopy group $\pi_{n-1}(G)$ that Proposition~\ref{prop:spheres} identifies, and records the characteristic class that detects the generator where one is standard. The output reproduces the known values: $\mathrm{U}(1)$-bundles over $S^2$ form a copy of $\mathbb{Z}$ detected by $c_1$, $\mathrm{SU}(2)$-bundles over $S^2$ and $S^3$ are trivial, and $\mathrm{SU}(2)$-bundles over $S^4$ form a copy of $\mathbb{Z}$ detected by $c_2$. The $\mathrm{SO}(3)$ column reproduces Example~\ref{ex:global-form}: a copy of $\mathbb{Z}/2$ over $S^2$ detected by $w_2$, which is the global-form distinction the Lie algebra cannot see.
   482	
   483	The second group computes Chevalley\textendash{}Eilenberg cohomology for two small gauge algebras. For the two-dimensional non-abelian algebra of Example~\ref{ex:abelian-anomaly} and for $\mathfrak{su}(2)$ the script constructs the differential exactly over the rationals, computes $H^1$ and $H^2$, and reports the algebraic obstruction data. The non-abelian case displays the nonzero first class that records its nontrivial abelian quotient, and the semisimple case displays the vanishing consistent with the absence of abelian quotients. The script checks Example~\ref{ex:abelian-anomaly} on the nose; the field-theory anomaly of Definition~\ref{def:bvbrst-anomaly} lives in the local BRST cohomology and is not computed here.
   484	
   485	The third group tests the Frobenius correspondence of Theorem~\ref{thm:frobenius} on one finite-dimensional algebra. For the group algebra of $\mathbb{Z}/2$ the script builds the functor on two-dimensional cobordisms cut into elementary pieces and verifies that the value of a closed surface is independent of the decomposition and that the gluing axioms hold. The failure mode it guards against is a degenerate counit on an otherwise well-behaved algebra; the script constructs one and shows that the dual-basis construction of the comultiplication fails there, so the Frobenius condition is doing real work in the correspondence.
   486	
   487	The fourth group enumerates connected Dynkin diagrams up to rank eight. By testing the Cartan-matrix conditions of positive definiteness and integrality on the finite set of candidate graphs of rank at most eight, the script recovers exactly the finite-type lists $A_r$, $B_r$, $C_r$, $D_r$, $G_2$, $F_4$, $E_6$, $E_7$, $E_8$ and no others. The enumeration is a check on the classification rather than a proof of it, since the argument that no other diagrams exist is the mathematical content of Theorem~\ref{thm:killing-cartan}.
   488	
   489	The code evidence appendix maps each finite-instance check to its file and function.
   490	
   491	\begin{table}[ht]
   492	\centering
   493	\small
   494	\caption{Code evidence for the finite-instance checks of Section~\ref{sec:experiments}. Each row names the check and the file that performs it.}
   495	\label{tab:code}
   496	\begin{tabularx}{\textwidth}{X L{0.30\textwidth} L{0.18\textwidth}}
   497	\toprule
   498	Finite-instance check & File and function & Statement illustrated \\
   499	\midrule
   500	The sphere-bundle classification table holds on the listed groups and dimensions & bundle\_classification.py, function classify\_sphere\_bundles & Proposition~\ref{prop:spheres} \\
   501	\addlinespace
   502	The Chevalley\textendash{}Eilenberg classes of Example~\ref{ex:abelian-anomaly} compute as stated & anomaly\_cohomology.py, function ce\_obstruction\_pair & Example~\ref{ex:abelian-anomaly} \\
   503	\addlinespace
   504	A commutative Frobenius algebra yields a decomposition-independent two-dimensional theory on the tested algebra & tqft\_frobenius.py, function verify\_atiyah\_gluing & Theorem~\ref{thm:frobenius} \\
   505	\addlinespace
   506	Connected Dynkin diagrams of rank up to eight are exactly the finite-type Cartan lists & dynkin\_enumeration.py, function enumerate\_finite\_type & Theorem~\ref{thm:killing-cartan} \\
   507	\bottomrule
   508	\end{tabularx}
   509	\end{table}
   510	
   511	\section{Open problems}
   512	\label{sec:open}
   513	
   514	Six problems bound the classification in this volume and each is stated at the strength the record supports.
   515	
   516	The proof status of the extended topological field theory classification is the first. The cobordism hypothesis is stated and the 2009 writeup is an informal sketch; which cases of the classification carry complete proofs, and in which dimensions, is not settled on the public record. Low-dimensional cases are the subject of later work, and resolving which of them are complete is the open item that would move the extended classification from claimed to proved.
   517	
   518	The anomaly classification has its own gap. The local and algebraic obstruction classes are computed, and the global anomaly question has a partial theory, but the general cobordism-spectrum statement that would classify all anomalies uniformly is not on the record in a form we can verify. A primary source is needed before any statement of that classification may be used.
   519	
   520	The constructive quantum field theory claims have a tracked event. The release of the withheld manuscript and the claimed formalization behind the October 2026 existence announcement would move that row of Table~\ref{tab:claims} from withheld to publicly checkable, and a committee verdict would move it further. Until the release, no result of this volume depends on it. The competing journal-published construction of a four-dimensional Yang-Mills theory with a mass gap carries a second question: where its continuum limit is closed and where it is assumed. An audit of that construction is the sharpest available test of the mass-gap claim, and the audit has not been done.
   521	
   522	The algebraic framework has an open foundation. The Haag\textendash{}Kastler axiom list is under discussion, and the sector classification of Section~\ref{sec:aqft} is conditional on the axiom set in force and on Haag duality. Whether the Doplicher\textendash{}Roberts uniqueness statement survives the relaxation of those hypotheses is open; the braided setting already shows that extra data can appear.
   523	
   524	A single-source frontier claim needs verification. The possible extra factor of order two in the sector data of higher-form symmetric theories is noted in one preprint, and the classification of higher-form sectors would change if the possibility is realized. We record it and do not build on it.
   525	
   526	The classification of connections modulo gauge is open outside restricted cases. The bundle is classified, the gauge algebra is classified, and the matter representations are classified; the moduli space of connections carries the analytic theory and no classification theorem in the sense of this volume reaches it. A classification restricted to flat connections, or to self-dual connections in dimension four, is the natural next restricted-class result.
   527	
   528	\section{Limitations}
   529	\label{sec:limitations}
   530	
   531	This volume classifies structures, not physical theories in full. Four limitations bound the conclusions.
   532	
   533	The classification of principal bundles is classification of the bundle. Connections are classified only modulo gauge in restricted settings, and no general classification theorem for connections is recorded. The dynamics of a gauge theory, the quantum state space, and the observable algebra are outside the classification results of Sections~\ref{sec:lie} and~\ref{sec:bundles}.
   534	
   535	The superselection analysis is restricted to nets satisfying the DHR criterion and Haag duality. Long-range forces such as electromagnetism fall outside the criterion as stated, and the Haag\textendash{}Kastler axiom list itself is under discussion. The Doplicher\textendash{}Roberts theorem reconstructs a gauge group from the sectors of a net that satisfies its hypotheses; it does not classify nets.
   536	
   537	The extended topological field theory classification is claimed and not proved, so no conclusion of this volume may rest on it. The four-dimensional constructive claims are registered at their rungs and are not used as premises. The Clay mass gap problem is open and is recorded as open.
   538	
   539	The computational experiments are evidence. They reproduce known classification tables and test obstruction conditions on small examples, and they do not establish any theorem. The phrase used elsewhere in the series applies here as well: executable models validated against specifications, never machine-checked proofs.
   540	
   541	A further limitation is inherited from the series. The choice of physical equivalence is not settled, so every classification statement here is classification up to an explicitly named equivalence: isomorphism of principal bundles, isomorphism of Lie algebras, equivalence of categories preserving the symmetric monoidal structure, or unitary equivalence of representations. Statements that would require a stronger or weaker equivalence are marked by the structure they preserve. The Etingof\textendash{}Gelaki constraint is the standing warning: an equivalence that forgets the symmetric monoidal layer cannot recover the group, so no classification record in this volume identifies systems by an equivalence without naming the layers it keeps.
   542	
   543	\section{Conclusion}
   544	\label{sec:conclusion}
   545	
   546	Rigorous classification of gauge and quantum field theories succeeds where topological or algebraic data decouple from continuum dynamics. The Killing\textendash{}Cartan root diagrams parameterize complex semisimple Lie algebras. Dominant integral weights classify the finite-dimensional irreducible representations. Homotopy classes $[X, BG]$ classify principal $G$-bundles, with characteristic classes in $H^*(BG)$ as computable invariants. Commutative Frobenius algebras classify two-dimensional functorial field theories. For gauge theories with fermions, anomaly cancellation is a complete cohomological obstruction: the theory is consistent exactly where the Dirac determinant line bundle is trivializable and the local BRST class in $H^{1,n}(s\mid d)$ vanishes. Outside these topological and algebraic domains, the classification of four-dimensional continuum field theories lacks a non-perturbative construction, the gauge connection moduli spaces are unclassified, and the mass spectrum is open.
   547	
   548	The two incomplete places are the extended topological field theory classification and four-dimensional constructive quantum field theory. The first is claimed on the strength of a proof sketch and registered as such. The second is a claims register: one existence result announced with its artifacts withheld, one mass gap open, one journal-published unverified construction, one withdrawn preprint, regime-restricted lattice theorems, and one outline. The ladder keeps them apart, and the classification program does not import any of them as a dependency.
   549	
   550	The structural lesson is the one the series draws from Darboux as well. Classification content is exactly where the invariant is finite or parameterized, which for gauge structures means the topological and the algebraic layers. The analytic layer, where a metric, a renormalization group, and a continuum limit are in play, is where classification is claimed or open. A complete classification of mathematical representations of gauge theories would therefore proceed from the proved islands outward, and the boundary of the proved region is now recorded precisely.
   551	
   552	Two outcomes of the continuing program are both acceptable results. One is a classification of a restricted class: flat connections on a fixed bundle, self-dual connections in a fixed topological class, or the sectors of nets satisfying a fixed axiom list. The other is an impossibility theorem showing that a natural classification objective cannot be met without additional restrictions. The obstruction results already in evidence, from the anomaly classes to the global-form distinctions to the extra data in braided sector categories, are of the second kind and are theorems rather than caveats.
   553	
   554	The volume closes where the classification is sharp. Gauge algebras, matter representations, bundles, anomaly-free configurations, and two-dimensional topological theories are classified by explicit invariants under stated equivalences. The extended topological classification is claimed and registered as claimed. Four-dimensional existence is claimed with its artifacts withheld and the mass gap is open. The claim ladder keeps those rows apart, and the classification program carries the proved rows forward without waiting on the others.
   555	
   556	\begin{thebibliography}{36}
   557	
   558	\bibitem{atiyah-tqft}
   559	M. Atiyah, \emph{Topological quantum field theories}. Publications Math\'ematiques de l'IH\'ES 68 (1988) 175\textendash186.
   560	
   561	\bibitem{atiyah-singer}
   562	M. Atiyah and I. Singer, \emph{The index of elliptic operators IV}. Annals of Mathematics 93 (1971) 119\textendash138.
   563	
   564	\bibitem{baez-dolan}
   565	J. Baez and J. Dolan, \emph{Higher-dimensional algebra and topological quantum field theory}. arXiv:q-alg/9503002, 1995. \url{https://arxiv.org/abs/q-alg/9503002}
   566	
   567	\bibitem{balaban}
   568	T. Balaban, \emph{Renormalization group approach to lattice gauge field theories I}. Communications in Mathematical Physics 109 (1987) 249\textendash301.
   569	
   570	\bibitem{bbh}
   571	G. Barnich, F. Brandt, and M. Henneaux, \emph{Local BRST cohomology in gauge theories}. Physics Reports 338 (2000) 439\textendash569. arXiv:hep-th/0002245.
   572	
   573	\bibitem{cns}
   574	S. Cao, R. Nissim, and S. Sheffield, \emph{Dynamical approach to area law for lattice Yang-Mills}. arXiv:2509.04688, 2025. \url{https://arxiv.org/abs/2509.04688}
   575	
   576	\bibitem{casini-magan}
   577	H. Casini and J. M. Magan, \emph{A generalization of the DHR theorem for higher form symmetries}. arXiv:2511.21810, 2025. \url{https://arxiv.org/abs/2511.21810}
   578	
   579	\bibitem{clay}
   580	Clay Mathematics Institute, \emph{Yang-Mills and the mass gap}. \url{https://www.claymath.org/millennium/yang-mills-the-maths-gap/} (accessed 2026-10-29).
   581	
   582	\bibitem{deligne}
   583	P. Deligne, \emph{Cat\'egories tensorielles}. Moscow Mathematical Journal 2 (2002) 227\textendash248.
   584	
   585	\bibitem{dold}
   586	A. Dold, \emph{Partitions of unity in the theory of fibrations}. Annals of Mathematics 78 (1963) 223\textendash255.
   587	
   588	\bibitem{dhr}
   589	S. Doplicher, R. Haag, and J. Roberts, \emph{Local observables and particle statistics I}. Communications in Mathematical Physics 15 (1969) 173\textendash200.
   590	
   591	\bibitem{dr}
   592	S. Doplicher and J. E. Roberts, \emph{A new duality theory for compact groups}. Inventiones Mathematicae 98 (1989) 157\textendash218.
   593	
   594	\bibitem{douglas}
   595	M. R. Douglas, \emph{The Yang-Mills Millennium problem}. Nature Reviews Physics 8 (2026) 86\textendash97. \url{https://www.nature.com/articles/s42254-025-00909-2}
   596	
   597	\bibitem{etingof-gelaki}
   598	P. Etingof and S. Gelaki, \emph{Isocategorical groups}. International Mathematics Research Notices 2001, 59\textendash77. arXiv:math/0007196.
   599	
   600	\bibitem{faizal}
   601	M. Faizal and A. Shabir, \emph{Reflection-Positive Construction of a Four-Dimensional SU(N) Yang-Mills Theory with Mass Gap and Confinement}. arXiv:2606.19362, 2026. \url{https://arxiv.org/abs/2606.19362}
   602	
   603	\bibitem{fdv}
   604	P. A. Faria da Veiga and M. O'Carroll, \emph{On Charge Conjugation, Correlations, Elitzur's Theorem and the Mass Gap Problem in Lattice $\mathrm{SU}(N)$ Yang-Mills Models in $d=4$ Dimensions}. arXiv:2509.03513, 2025. \url{https://arxiv.org/abs/2509.03513}
   605	
   606	\bibitem{gelfand-naimark}
   607	I. Gelfand and M. Naimark, \emph{On the imbedding of normed rings into the ring of operators in Hilbert space}. Matematicheskii Sbornik 12 (1943) 197\textendash213.
   608	
   609	\bibitem{glimm-jaffe}
   610	J. Glimm and A. Jaffe, \emph{Quantum Physics: A Functional Integral Point of View}. Springer, 1981.
   611	
   612	\bibitem{haag-kastler}
   613	R. Haag and D. Kastler, \emph{An algebraic approach to quantum field theory}. Journal of Mathematical Physics 5 (1964) 915\textendash922.
   614	
   615	\bibitem{humphreys}
   616	J. E. Humphreys, \emph{Introduction to Lie Algebras and Representation Theory}. Graduate Texts in Mathematics 9, Springer, 1972.
   617	
   618	\bibitem{jacobsen}
   619	D. C. Jacobsen, \emph{A Constructive Proof of Existence and Mass Gap for Pure $\mathrm{SU}(3)$ Yang-Mills in Four-Dimensional Space-Time}. arXiv:2506.00284, withdrawn by arXiv administrators in 2025. \url{https://arxiv.org/abs/2506.00284}
   620	
   621	\bibitem{kitp}
   622	KITP Yang-Mills working group statement, 2026-10. \url{https://www.kitp.ucsb.edu/sites/default/files/YM_working_group.pdf}
   623	
   624	\bibitem{lurie}
   625	J. Lurie, \emph{On the Classification of Topological Field Theories}. arXiv:0905.0465, 2009. \url{https://arxiv.org/abs/0905.0465}
   626	
   627	\bibitem{milnor}
   628	J. Milnor, \emph{The construction of universal bundles I, II}. Annals of Mathematics 63 (1956) 272\textendash284 and 65 (1957) 430\textendash436.
   629	
   630	\bibitem{milnor-stasheff}
   631	J. Milnor and J. Stasheff, \emph{Characteristic Classes}. Princeton University Press, 1974.
   632	
   633	\bibitem{mueger}
   634	M. M\"uger, \emph{Conformal Field Theory and Doplicher\textendash{}Roberts Reconstruction}. arXiv:math-ph/0008027, 2000. \url{https://arxiv.org/abs/math-ph/0008027}
   635	
   636	\bibitem{nair}
   637	V. P. Nair, \emph{Towards a Proof of Mass Gap in 3d Yang-Mills Theory}. arXiv:2608.10133, 2026. \url{https://arxiv.org/abs/2608.10133}
   638	
   639	\bibitem{nissim}
   640	R. Nissim, \emph{$\mathrm{U}(N)$ lattice Yang-Mills in the 't Hooft regime}. arXiv:2510.22788, 2025. \url{https://arxiv.org/abs/2510.22788}
   641	
   642	\bibitem{openai}
   643	OpenAI, \emph{Building scientific understanding with academic communities}, 2026-10-26. \url{https://openai.com/index/building-scientific-understanding-with-academic-communities/}
   644	
   645	\bibitem{osterwalder-schrader}
   646	K. Osterwalder and R. Schrader, \emph{Axioms for Euclidean Green's functions II}. Communications in Mathematical Physics 42 (1975) 281\textendash305.
   647	
   648	\bibitem{pinzari}
   649	C. Pinzari, \emph{Uniqueness of braided tensor structures and the Huang-Lepowsky structure on affine vertex operator algebras in the classical Lie types and G2}. arXiv:2502.06229, version 8 dated 2026-09-19. \url{https://arxiv.org/abs/2502.06229}
   650	
   651	\bibitem{quillen}
   652	D. Quillen, \emph{Determinants of Cauchy-Riemann operators on Riemann surfaces}. Functional Analysis and its Applications 19 (1985) 31\textendash34.
   653	
   654	\bibitem{serre}
   655	J.-P. Serre, \emph{Complex Semisimple Lie Algebras}. Springer, 1987.
   656	
   657	\bibitem{steenrod}
   658	N. Steenrod, \emph{The Topology of Fibre Bundles}. Princeton University Press, 1951.
   659	
   660	\bibitem{stone}
   661	M. H. Stone, \emph{The theory of representations for Boolean algebras}. Transactions of the American Mathematical Society 40 (1936) 37\textendash111.
   662	
   663	\bibitem{wess-zumino}
   664	J. Wess and B. Zumino, \emph{Consequences of anomalous Ward identities}. Physics Letters B 37 (1971) 95\textendash99.
   665	
   666	\end{thebibliography}
   667	
   668	\end{document}

exec
/usr/local/bin/zsh -lc "sed -n '150,390p' papers/latex/vol-07-gauge-qft.tex | nl -ba -v 150" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   150	The theorem classifies the gauge algebra; the simply connected group and its central quotients then classify the connected gauge group. It does not classify the bundle, the connection, the dynamics, or the matter content.
   151	
   152	\begin{theorem}[Highest-weight classification]
   153	\label{thm:highest-weight}
   154	Let $\mathfrak{g}$ be a complex semisimple Lie algebra. Finite-dimensional irreducible representations of $\mathfrak{g}$ are in bijection with dominant integral weights; the representation with highest weight $\lambda$ exists and is unique up to isomorphism~\cite{humphreys}.
   155	\end{theorem}
   156	
   157	\begin{proof}
   158	Uniqueness is the classification of a representation by its highest weight: the weight strings of a finite-dimensional irreducible are determined by the action of the raising and lowering operators, and the highest weight is annihilated by every raising operator and integral in the weight lattice. Existence is the content of the Borel-Weil construction, or equivalently of the Verma module with the maximal proper submodule quotiented out; the quotient is finite-dimensional exactly when the highest weight is dominant integral. Irreducibility follows because every nonzero submodule contains a highest weight vector, and the highest weight space of an irreducible is one-dimensional.
   159	\end{proof}
   160	
   161	Together these two theorems give the complete Lie-theoretic layer of a gauge theory: the gauge algebra by its Dynkin diagram, the real form by its Satake diagram, the connected gauge group by central quotient data, and the finite-dimensional matter representations by dominant integral weights. Example instantiations of the invariant record appear in the code evidence of Section~\ref{sec:experiments}.
   162	
   163	\begin{example}[The gauge algebra of quantum chromodynamics]
   164	\label{ex:su3}
   165	Take $\mathfrak{g} = \mathfrak{su}(3)$, the Lie algebra of $\mathrm{SU}(3)$. Its Dynkin diagram is $A_2$, two nodes joined by a single edge, and the Killing\textendash{}Cartan theorem records that no other complex simple algebra carries this diagram. The real form is compact, and the corresponding real simple algebra is the compact $\mathfrak{su}(3)$ itself; the split real form $\mathfrak{sl}(3, \mathbb{R})$ is a different real form of the same complex algebra and is distinguished by its Satake diagram. The fundamental weights $\lambda_1$ and $\lambda_2$ label the defining representation $\mathbf{3}$ and its conjugate $\bar{\mathbf{3}}$, and the highest weight of the adjoint representation is $\lambda_1 + \lambda_2$, giving the octet $\mathbf{8}$. Quarks in the defining representation, antiquarks in the conjugate, and gluons in the adjoint are therefore classified as representations by the dominant integral weights of $A_2$, and the matter content of the theory is a list of weights. The classification stops there: the interaction, the renormalization, and the spectrum of bound states are outside the highest-weight theorem.
   166	\end{example}
   167	
   168	\begin{remark}
   169	The classification does not reach the dynamics of a gauge theory. Infinite-dimensional representations of the gauge group, the spectrum of the covariant Laplacian on a bundle, the Yang-Mills functional, and the quantum theory built from them are outside the scope of the Killing\textendash{}Cartan and highest-weight statements. A gauge theory is not classified by its gauge algebra alone.
   170	\end{remark}
   171	
   172	\begin{remark}[Reductive groups and the center]
   173	\label{rem:reductive}
   174	A reductive gauge group is a central product of a semisimple group with a torus, so the classification extends by adjoining the rank of the torus to the Dynkin datum. The datum that distinguishes the global forms is the discrete central subgroup of the universal cover, and it is not visible in the Dynkin diagram: $\mathrm{SU}(2)$ is the universal cover of $\mathrm{SO}(3)$ and has center $\mathbb{Z}/2$, while $\mathrm{SO}(3)$ has trivial center, and both share the diagram $A_1$. The classification of gauge groups up to isomorphism therefore requires both the diagram and the quotient data of Theorem~\ref{thm:killing-cartan}, and the bundle classification records the difference, as Example~\ref{ex:global-form} shows.
   175	\end{remark}
   176	
   177	\section{Bundles and characteristic classes}
   178	\label{sec:bundles}
   179	
   180	Let $G$ be a Lie group and $X$ a paracompact Hausdorff space. Write $\mathrm{GBund}(X)$ for the set of isomorphism classes of principal $G$-bundles over $X$. Over a paracompact base every principal $G$-bundle with Lie structure group is numerable, so no further restriction on the bundles is needed.
   181	
   182	\begin{theorem}[Classification by the classifying space]
   183	\label{thm:bundles}
   184	Let $G$ be a Lie group and $X$ a paracompact Hausdorff space. The map that sends a principal $G$-bundle to its classifying map induces a bijection~\cite{milnor, dold, steenrod}
   185	\[
   186	\mathrm{GBund}(X) \cong [X, BG],
   187	\]
   188	and the characteristic classes of a bundle are exactly the pullbacks along its classifying map of the universal characteristic classes in $H^*(BG)$~\cite{milnor-stasheff}.
   189	\end{theorem}
   190	
   191	\begin{proof}
   192	The Milnor infinite join construction builds a numerable universal bundle $EG \to BG$ for any topological group $G$~\cite{milnor}. The universal property states that a principal $G$-bundle $P \to X$ is classified by a map $f: X \to BG$, with $P \cong f^*(EG)$, exactly when $P$ is numerable; two classifying maps for the same bundle are homotopic, and homotopic maps have isomorphic pullbacks~\cite{dold, steenrod}. Over a paracompact base every principal $G$-bundle with Lie structure group is numerable, so the universal property applies to every bundle of $\mathrm{GBund}(X)$ and the map is a bijection. For the second statement, a universal characteristic class is a cohomology class $\kappa \in H^*(BG)$, and the characteristic class of a bundle with classifying map $f$ is defined as $f^*(\kappa)$. The definition is stable under bundle isomorphism, and every natural characteristic class arises this way, since a natural transformation on homotopy classes is determined by its value on the universal bundle~\cite{milnor-stasheff}.
   193	\end{proof}
   194	
   195	The theorem is the complete classification of principal bundles. Two consequences follow.
   196	
   197	\begin{proposition}[Bundles over spheres]
   198	\label{prop:spheres}
   199	Let $G$ be a connected Lie group and $n \geq 1$. Isomorphism classes of principal $G$-bundles over $S^n$ are in bijection with $\pi_{n-1}(G)$.
   200	\end{proposition}
   201	
   202	\begin{proof}
   203	By Theorem~\ref{thm:bundles} the classes form $[S^n, BG] = \pi_n(BG)$, since $BG$ is connected. The fibration $G \to EG \to BG$ with contractible total space has long exact homotopy sequence
   204	\[
   205	\cdots \to \pi_n(EG) \to \pi_n(BG) \to \pi_{n-1}(G) \to \pi_{n-1}(EG) \to \cdots,
   206	\]
   207	and both homotopy groups of $EG$ vanish, so $\pi_n(BG) \cong \pi_{n-1}(G)$.
   208	\end{proof}
   209	
   210	\begin{example}[Line bundles over the sphere]
   211	\label{ex:line}
   212	For $G = \mathrm{U}(1)$ and $n = 2$, Proposition~\ref{prop:spheres} gives $\pi_1(\mathrm{U}(1)) \cong \mathbb{Z}$, and the isomorphism class is detected by the first Chern class $c_1 \in H^2(S^2; \mathbb{Z})$. Every complex line bundle over $S^2$ is a power of the Hopf bundle, and the classification is complete and parameterized by an integer.
   213	\end{example}
   214	
   215	\begin{example}[Instantons over the four-sphere]
   216	\label{ex:instanton}
   217	For $G = \mathrm{SU}(2)$ and $n = 4$, Proposition~\ref{prop:spheres} gives $\pi_3(\mathrm{SU}(2)) \cong \mathbb{Z}$, and the integer is the instanton number, computed as the second Chern class of the associated complex vector bundle. For $n = 2$ and $n = 3$ the groups $\pi_1(\mathrm{SU}(2))$ and $\pi_2(\mathrm{SU}(2))$ vanish, so every principal $\mathrm{SU}(2)$-bundle over $S^2$ or $S^3$ is trivial. The nontrivial topology appears only in the dimension where the third homotopy group of the gauge group is nontrivial.
   218	\end{example}
   219	
   220	\begin{example}[Global forms and the second Stiefel-Whitney class]
   221	\label{ex:global-form}
   222	The choice of global form of the gauge group changes the bundle classification. For $G = \mathrm{SO}(3)$ the first homotopy group is $\pi_1(\mathrm{SO}(3)) \cong \mathbb{Z}/2$, so Proposition~\ref{prop:spheres} gives two isomorphism classes of principal $\mathrm{SO}(3)$-bundles over $S^2$, detected by the second Stiefel-Whitney class $w_2$. The nontrivial class is the bundle of tangent 2-planes, and it admits no lift to a principal $\mathrm{SU}(2)$-bundle, since $\pi_1(\mathrm{SU}(2)) = 0$ forces every $\mathrm{SU}(2)$-bundle over $S^2$ to be trivial. Matter fields in a spinorial representation therefore distinguish the global form $\mathrm{SU}(2)$ from $\mathrm{SO}(3)$, and the classification of bundles records that distinction as a cohomology class rather than as a property of the Lie algebra.
   223	\end{example}
   224	
   225	\begin{remark}[Local models carry no classification content]
   226	\label{rem:local}
   227	Principal bundles carry only global topological invariants. Locally every principal bundle is trivial, so no local invariant of a bundle exists; the invariants are homotopy-theoretic and cohomological. This is the same phenomenon that Darboux's theorem displays in symplectic geometry, and it marks the contrast with Riemannian geometry, where curvature supplies local invariants.
   228	\end{remark}
   229	
   230	Connections on a classified bundle add analytic data. The Chern\textendash{}Weil homomorphism assigns to an invariant polynomial on the Lie algebra the cohomology class of its evaluation on the curvature of any connection, and the class is independent of the connection. In the case $G = \mathrm{U}(1)$ the class $[\Omega/2\pi]$ of the curvature two-form is the first Chern class of the line bundle, so the connection refines, but does not extend, the classification. The classification theorem for bundles is unaffected by connection data. Connections are classified only modulo gauge in restricted settings, and we record no general classification theorem for connections.
   231	
   232	\begin{definition}[Gauge equivalence of connections]
   233	\label{def:gauge-equivalence}
   234	Two connections $\omega_1$ and $\omega_2$ on a principal $G$-bundle $P \to X$ are gauge equivalent when a bundle automorphism $g: P \to P$ over the identity of $X$ satisfies $g^*\omega_2 = \omega_1$. The moduli space of connections on a fixed bundle is the quotient of the affine space of connections by this gauge action. Its singularities are the reducible connections, whose stabilizer is larger than the center of $G$, and those points obstruct a smooth quotient description.
   235	\end{definition}
   236	
   237	No classification of the moduli space of connections is on the record. The bundle classification delivers its topological stratification: each bundle isomorphism class carries its own moduli space of connections, and the Chern\textendash{}Weil map sends each to the same characteristic classes. The instanton number of Example~\ref{ex:instanton} is constant on the connected components of a moduli space, so the topological classification is the first invariant of the analytic one.
   238	
   239	\begin{proposition}[Characteristic classes of the classical groups]
   240	\label{prop:classical-classes}
   241	For $G = \mathrm{U}(n)$ the classifying cohomology $H^*(B\mathrm{U}(n); \mathbb{Z})$ is a polynomial ring on the Chern classes $c_1, \ldots, c_n$. For $G = \mathrm{SO}(2k+1)$ the rational cohomology $H^*(B\mathrm{SO}(2k+1); \mathbb{Q})$ is a polynomial ring on the Pontryagin classes $p_1, \ldots, p_k$. For $G = \mathrm{SO}(2k)$ the rational cohomology $H^*(B\mathrm{SO}(2k); \mathbb{Q})$ is the free polynomial ring $\mathbb{Q}[p_1, \ldots, p_{k-1}, e]$; the top Pontryagin class is the element $p_k = e^2$ and is not an independent generator. For $G = \mathrm{SU}(n)$ the class $c_1$ vanishes and $H^*(B\mathrm{SU}(n); \mathbb{Z})$ is a polynomial ring on $c_2, \ldots, c_n$.
   242	\end{proposition}
   243	
   244	\begin{proof}
   245	Each statement is the computation of the cohomology of the classifying space for the given group. For the unitary group one pulls back the tautological bundle over the Grassmannian, splits it formally into Chern roots, and reads off the elementary symmetric polynomials; the splitting principle shows that the Chern classes generate the ring. For the special unitary group the determinant line is trivial, which sets $c_1$ to zero and leaves the remaining classes free. For the special orthogonal group the Pontryagin classes are the Chern classes of the complexification, the rational statement drops the torsion, and in even rank the top Pontryagin class equals the square of the Euler class, so $e$ replaces $p_k$ among the generators.
   246	\end{proof}
   247	
   248	The proposition gives the universal class ring whose pullbacks classify bundles in each classical case. The table of sphere bundles in Example~\ref{ex:line} and Example~\ref{ex:instanton} is the shadow of these rings on low-dimensional bases.
   249	
   250	\section{Anomalies as obstructions}
   251	\label{sec:anomalies}
   252	
   253	An anomaly is the failure of a classical gauge symmetry to survive quantization. Its mathematical signature is the nontriviality of a line or of a cohomology class, and its classification content is the vanishing test for those classes.
   254	
   255	\begin{definition}[Fermionic anomaly]
   256	\label{def:fermionic-anomaly}
   257	Let $M$ be a compact spin manifold, $P \to M$ a principal $G$-bundle with $G$ a compact Lie group, $\mathcal{A}$ the space of connections on $P$, and $\mathcal{G}$ the gauge group acting on $\mathcal{A}$. The determinant line of a family of Dirac operators assigns to each connection $A$ the determinant line of $D_A$, and these lines assemble into a complex line bundle $\lambda_{\mathrm{det}}$ over the gauge orbit space $\mathcal{A}/\mathcal{G}$, or over $\mathcal{A}$ when the family is lifted~\cite{quillen, atiyah-singer}. The fermionic anomaly is the obstruction to trivializing $\lambda_{\mathrm{det}}$, or its Pfaffian square root in the Majorana case. The theory is consistent only where the line bundle is trivializable.
   258	\end{definition}
   259	
   260	\begin{definition}[BV-BRST gauge anomaly]
   261	\label{def:bvbrst-anomaly}
   262	Let $n$ be the spacetime dimension. The BV-BRST gauge anomaly is the obstruction class in the local BRST cohomology $H^{1,n}(s\mid d)$: the cohomology of the BRST differential $s$ on local functionals of the fields and ghosts, modulo total spacetime derivatives $d$, at ghost number one and form degree $n$. The class satisfies the Wess\textendash{}Zumino consistency condition~\cite{wess-zumino, bbh}. The Chevalley\textendash{}Eilenberg complex $\mathrm{CE}(\mathfrak{g})$ of the gauge algebra computes the zero-form part of the BRST double complex: $H^1(\mathrm{CE}(\mathfrak{g}))$ classifies the abelian quotients of $\mathfrak{g}$, and $H^2(\mathrm{CE}(\mathfrak{g}))$ its central extensions.
   263	\end{definition}
   264	
   265	\begin{proposition}[Quantization gate]
   266	\label{prop:anomaly}
   267	A gauge theory admits a consistent quantization only where the determinant line $\lambda_{\mathrm{det}}$ of the Dirac family is trivializable and its anomaly cocycle $[a]$ vanishes in the local BRST cohomology $H^{1,n}(s\mid d)$. The group $H^{1,n}(s\mid d)$ is the space of candidate anomalies of the theory; the specific cocycle $[a]$ is the anomaly of the theory at hand. These two vanishing conditions are the classification content of the anomaly: the obstruction classes are natural in the gauge configuration and classify the inconsistent directions.
   268	\end{proposition}
   269	
   270	\begin{proof}
   271	If the determinant line of the family is nontrivial, the path integral measure is a section of a nontrivial line bundle rather than a measure, and gauge transformations multiply the partition function by a nontrivial phase; gauge invariance of the measure fails exactly then. The measure exists exactly when $\lambda_{\mathrm{det}}$ is trivializable. The BRST anomaly class is the obstruction to the nilpotency of the quantized BRST charge: the classical BRST differential satisfies $s^2 = 0$, and the quantum deformation fails to be nilpotent exactly when the anomaly cocycle $[a]$ is nonzero in $H^{1,n}(s\mid d)$. The Wess\textendash{}Zumino consistency condition is the integrability condition for this class and holds by construction~\cite{bbh}. Both constructions are functorial in the gauge configuration, so the obstruction classes are natural and the vanishing test is a classification of the inconsistent directions.
   272	\end{proof}
   273	
   274	The anomaly statement is the model of a complete obstruction classification: the classification content of the theory is the vanishing of the obstruction. No list of consistent theories is asserted; what is asserted is a necessary and sufficient condition for consistency. Anomaly cancellation conditions then become computable inputs to the classification of matter content: a matter representation contributes to the anomaly classes, and only the representations whose contributions cancel are admissible.
   275	
   276	\begin{example}[Algebraic obstruction data of a gauge algebra]
   277	\label{ex:abelian-anomaly}
   278	Take the gauge algebra to be the two-dimensional non-abelian algebra with basis $e_1, e_2$ and bracket $[e_1, e_2] = e_2$. The Chevalley\textendash{}Eilenberg differential on the dual basis $e^1, e^2$ is $d e^1 = 0$ and $d e^2 = -e^1 \wedge e^2$. The class of $e^1$ in $H^1(\mathrm{CE}(\mathfrak{g}))$ is closed and not exact, so $H^1$ is nonzero and the algebra has a nontrivial abelian quotient; $H^2$ vanishes because $d$ maps the span of $e^2$ onto the whole of $\Lambda^2$. This computation is the algebraic shadow of Definition~\ref{def:bvbrst-anomaly}: the full field-theory anomaly of a gauge theory over a spacetime is computed in the local cohomology $H^{1,n}(s\mid d)$, and the Chevalley\textendash{}Eilenberg classes record the abelian-quotient and central-extension data of the gauge algebra alone. The computation is reproduced by the Chevalley\textendash{}Eilenberg experiment of Section~\ref{sec:experiments}.
   279	\end{example}
   280	
   281	Two limitations bound this obstruction statement. The cohomological statement classifies the obstruction and does not by itself construct the quantized theory in the cases where the obstructions vanish. A global anomaly may also remain after the local obstruction classes vanish; the analysis above is the local layer, and the full classification of global anomalies is a further problem on our open list.
   282	
   283	\begin{proposition}[Anomaly cancellation as a linear condition]
   284	\label{prop:cancellation}
   285	Fix a compact simple gauge group $G$ and let the matter content be a finite list of finite-dimensional irreducible representations $R_1, \ldots, R_k$ with highest weights $\lambda_1, \ldots, \lambda_k$. The contribution of each representation to a fixed anomaly class is additive, so there is a homomorphism of abelian groups
   286	\[
   287	\alpha \colon R(G) \longrightarrow A,
   288	\]
   289	from the representation ring of $G$ to the coefficient group $A$ of the anomaly in question, and the anomaly-free matter lists form $\ker \alpha$. For the four-dimensional perturbative gauge anomaly $A = \mathbb{Z}$ and $\alpha(R)$ is the anomaly coefficient of $R$; for global anomalies $A$ is the relevant cobordism group of $G$. The admissible matter lists are cut out by linear conditions on the weight data, computable from Theorem~\ref{thm:highest-weight} and Proposition~\ref{prop:anomaly} together.
   290	\end{proposition}
   291	
   292	\begin{proof}
   293	The anomaly classes of a direct sum of representations add, since the determinant line of a direct sum is the tensor product of the determinant lines and the BRST differential is linear in the representation data. The assignment $\alpha$ is therefore a homomorphism of abelian groups, and its kernel is the set of virtual representations whose anomaly vanishes. The physical condition restricts to actual representations, so the admissible lists are the nonnegative elements of $\ker \alpha$ in the basis of irreducibles. The highest-weight theorem supplies the basis, and the anomaly computation of Proposition~\ref{prop:anomaly} supplies $\alpha$.
   294	\end{proof}
   295	
   296	The proposition turns the anomaly condition into a classification problem for matter content: once the gauge algebra is fixed by its Dynkin diagram, the admissible representations are a computable submonoid of the representation ring. Whether that submonoid is finite or infinite depends on the group and on the anomaly in question, and we record no general finiteness statement.
   297	
   298	\section{Functorial and extended topological field theory}
   299	\label{sec:tqft}
   300	
   301	The Atiyah axioms package a $d$-dimensional topological quantum field theory as a symmetric monoidal functor $Z$ from the cobordism category $\mathrm{Cob}_d$ to vector spaces: a closed $(d-1)$-manifold $\Sigma$ maps to a vector space $Z(\Sigma)$, a cobordism $M: \Sigma_1 \to \Sigma_2$ maps to a linear map $Z(M): Z(\Sigma_1) \to Z(\Sigma_2)$, composition is preserved, disjoint union is tensor product, and the empty manifold maps to the unit field. The axioms make the topological case tractable in contrast to the general non-topological case, where no comparable functorial formulation is available.
   302	
   303	\begin{theorem}[Two-dimensional topological field theories]
   304	\label{thm:frobenius}
   305	The category of two-dimensional Atiyah topological quantum field theories with values in vector spaces is equivalent to the category of commutative Frobenius algebras~\cite{atiyah-tqft}.
   306	\end{theorem}
   307	
   308	\begin{proof}
   309	Given a theory $Z$, the circle maps to the algebra $A = Z(S^1)$, the pair of pants with two incoming circles and one outgoing circle gives multiplication $m: A \otimes A \to A$, the reversed pair of pants gives comultiplication $\Delta: A \to A \otimes A$, the disc with one outgoing circle gives the counit, and the reversed disc gives the unit. The Atiyah gluing axioms say precisely that $m$ is associative and unital and that $\Delta$ is coassociative and counital. The Frobenius condition is that $\Delta$ is a homomorphism of $A$-bimodules:
   310	\[
   311	\Delta \circ m = (m \otimes \mathrm{id}_A) \circ (\mathrm{id}_A \otimes \Delta) = (\mathrm{id}_A \otimes m) \circ (\Delta \otimes \mathrm{id}_A),
   312	\]
   313	as maps $A \otimes A \to A \otimes A$; it is the statement that a cylinder cut along a circle decomposes in either order. Commutativity of $m$ is the invariance of the pair of pants under rotation of its incoming boundary. The Euler element $e = m(\Delta(1)) \in A$ is the state assigned to the punctured torus, and the closed genus-one surface evaluates to the scalar $Z(\Sigma_1) = \varepsilon(e)$. Conversely a commutative Frobenius algebra $A$ extends to a functor on two-dimensional cobordisms by cutting each surface along circles into elementary pieces, mapping each piece to the corresponding tensor built from $m$, $\Delta$, the unit, and the counit; the cutting invariance follows from the Frobenius identity, so the value of $Z(M)$ is independent of the chosen decomposition. Both constructions are inverse to each other up to natural isomorphism.
   314	\end{proof}
   315	
   316	The theorem is a complete and parameterized classification of two-dimensional functorial theories, and it illustrates the general pattern of this volume: classification succeeds precisely where the physics is topological, because the topological invariance reduces the object to finite-dimensional algebra. Higher-dimensional functorial theories admit analogous invariants built from dualizability data, and we state no classification theorem for them here.
   317	
   318	The Frobenius algebra computes every invariant of the theory. The cylinder gives the identity map, the pair of pants gives multiplication, the disc gives unit and counit, and a closed oriented surface of genus $g$ evaluates to the $g$-th power of the Euler element $e = m \circ \Delta(1)$ composed with the counit, so the partition function of the theory is determined by one element of the algebra. Cutting a surface along any circle and reassembling gives the same value, and that cutting independence is the Frobenius identity. The classification is therefore effective: write down a commutative Frobenius algebra, and every observable of the two-dimensional theory is computed from its structure constants.
   319	
   320	The extended version asks for a symmetric monoidal higher functor on the fully extended cobordism category, assigning data not only to closed manifolds and cobordisms but to corners and deeper strata. The Baez\textendash{}Dolan cobordism hypothesis proposes the classification.
   321	
   322	\begin{conjecture}[Cobordism hypothesis]
   323	\label{conj:cobordism}
   324	The $n$-dimensional extended unitary topological quantum field theories valued in a symmetric monoidal $(\infty, n)$-category are classified by fully dualizable objects of the target with an $O(n)$-action. A fully extended theory is a symmetric monoidal $n$-functor out of the free stable weak $n$-category with duals on a point~\cite{baez-dolan, lurie}.
   325	\end{conjecture}
   326	
   327	The status of this statement is a claim with a proof gap. The 1995 paper states the hypothesis; the 2009 work describes itself as an informal sketch of a proof, and the range of cases in which the classification is complete is not settled on the public record. We therefore record the extended classification as claimed rather than proved, and no result in this volume depends on it as a theorem. Low-dimensional cases are the subject of later work; resolving which of those cases carry complete proofs is an open item.
   328	
   329	\begin{remark}[What topological classification does not give]
   330	\label{rem:tqft-scope}
   331	A topological quantum field theory is a functorial invariant of manifolds up to cobordism, not a quantum field theory on a fixed spacetime with local degrees of freedom. The classification results in this section say nothing about Yang-Mills theory, quantum chromodynamics, or any theory with a metric and a renormalization problem. The line between the topological and the local is the line between classification and the claims register.
   332	\end{remark}
   333	
   334	\section{Algebraic quantum field theory and superselection}
   335	\label{sec:aqft}
   336	
   337	The algebraic framework postulates the observables of a quantum field theory as a local net: an assignment of a $\mathrm{C}^*$-algebra $\mathcal{A}(\mathcal{O})$ to each open region $\mathcal{O}$ of spacetime, with isotony for nested regions, graded commutation for spacelike separated regions, covariance under the Poincar\'e group, a spectrum condition, and the existence of a vacuum. The axiom list has evolved and remains under discussion, so the framework is conditional on the axiom set in force.
   338	
   339	\begin{definition}[Local net]
   340	\label{def:local-net}
   341	A local net on Minkowski spacetime assigns to each double cone $\mathcal{O}$ a unital $\mathrm{C}^*$-algebra $\mathcal{A}(\mathcal{O})$ such that isotony holds for inclusions $\mathcal{O}_1 \subset \mathcal{O}_2$, graded locality holds for spacelike separation, the Poincar\'e group acts by automorphisms covariantly, the spectrum of the generator of time translations is contained in the closed forward cone, and a vacuum state exists~\cite{haag-kastler}. A representation of the net is a representation of the quasilocal algebra $\mathcal{A}$ that is generated by the local algebras.
   342	\end{definition}
   343	
   344	\begin{definition}[DHR criterion]
   345	\label{def:dhr}
   346	A representation $\pi$ of a local net satisfies the DHR criterion when its restriction to the algebra of the causal complement of every bounded region is equivalent to the vacuum representation~\cite{dhr}. Two such representations are equivalent when a unitary intertwiner exists.
   347	\end{definition}
   348	
   349	The reconstruction theorem holds in Minkowski spacetime of dimension at least $2+1$, where the causal complement of a double cone is connected and locality supplies the permutation symmetry of localized endomorphisms. In spacetime dimension $1+1$ the causal complement of a double cone is disconnected, the braid group replaces the permutation group, and the sector category is braided rather than symmetric; the compact group of Theorem~\ref{thm:dr} is then replaced by quantum-group data.
   350	
   351	The DHR selection criterion isolates the representations that arise from local degrees of freedom. Under the additional hypothesis of Haag duality the selected representations correspond to localized transportable endomorphisms of the observable net, and the sectors form a tensor category under composition of endomorphisms.
   352	
   353	\begin{theorem}[Doplicher\textendash{}Roberts reconstruction]
   354	\label{thm:dr}
   355	Let $\mathcal{C}$ be a symmetric tensor $\mathrm{C}^*$-category with conjugates, direct sums, subobjects, and $\mathrm{End}(\mathbf{1}) = \mathbb{C}$. Then $\mathcal{C}$ is equivalent to the category of finite-dimensional unitary representations of a compact group $G$ equipped with a distinguished central element $k$ of order at most two, $k^2 = e$, whose adjoint action implements the $\mathbb{Z}/2$ grading of the statistics; in the graded language this data is a compact supergroup. The pair $(G, k)$ is unique up to isomorphism~\cite{dr, dhr}. Applied to the DHR category of a local net satisfying Haag duality, the theorem reconstructs a compact gauge group from the superselection sectors.
   356	\end{theorem}
   357	
   358	\begin{proof}
   359	The proof has three stages. The existence of conjugates and subobjects gives the category the structure of a rigid $\mathrm{C}^*$-tensor category; the symmetric structure supplies a dimension function and the categorical traces that make the abstract notion of dimension well-defined. The reconstruction of the group proceeds by taking the endomorphisms of the forgetful functor on the representation category and recovering $G$ as the group of natural automorphisms of the identity on the completed category; the $\mathrm{C}^*$-structure identifies the completed category with the unitary representations of the compact group. Uniqueness follows because a compact group is determined up to isomorphism by its finite-dimensional unitary representation category together with the symmetric monoidal structure.
   360	\end{proof}
   361	
   362	The hypotheses travel with the theorem. Dropping the symmetric structure invalidates the recovery: there exist non-isomorphic finite groups with equivalent representation categories as plain tensor categories~\cite{etingof-gelaki}, so any equivalence that forgets the symmetric layer cannot recover the group, and any classification built on such an equivalence is false. Braided variants require additional data; in the braided Galois setting the fixed-point-net representation categories need extra soliton data beyond the braiding~\cite{mueger}.
   363	
   364	Deligne's theorem supplies the abstract classification of the symmetric tensor categories that the reconstruction produces.
   365	
   366	\begin{theorem}[Deligne's theorem]
   367	\label{thm:deligne}
   368	An abelian, $k$-linear, rigid symmetric monoidal category over an algebraically closed field of characteristic zero, with $\mathrm{End}(\mathbf{1}) = k$ and subexponential growth, is equivalent to the category of representations of an affine supergroup scheme~\cite{deligne}.
   369	\end{theorem}
   370	
   371	\begin{proof}
   372	The proof exhibits a fiber functor by a Tannakian argument: the subexponential growth condition bounds the dimensions of simple objects, the symmetric structure gives the braiding needed for a faithful tensor functor to super vector spaces, and the resulting fiber functor presents the category as representations of its automorphism group scheme. The supergrading arises from the possible nontriviality of the symmetry on odd parts.
   373	\end{proof}
   374	
   375	The reconstruction results classify the sector categories of nets that satisfy the hypotheses. Three frontier directions are on the record and none of them is settled. The first generalizes the DHR analysis to higher-form symmetries and notes that an extra factor of order two is not ruled out and would not be realizable by Lagrangian gauge models~\cite{casini-magan}; this is a single-source claim and we record it without weight. The second constructs a global quantum gauge group through a braided Doplicher\textendash{}Roberts program~\cite{pinzari}; it is work in progress at the preprint stage. The third is the soliton-data warning already cited~\cite{mueger}, which is proved and shows that fixed-point-net sector categories need data beyond the braiding.
   376	
   377	\begin{remark}[Long-range forces]
   378	\label{rem:long-range}
   379	The DHR criterion selects representations whose deviations from the vacuum are localized. Electromagnetism has long-range fields and its charged representations violate the strict localization hypothesis, so the DHR analysis as stated does not cover quantum electrodynamics without modification. The classification of sectors is therefore a classification within a restricted hypothesis class, not of all quantum field theories.
   380	\end{remark}
   381	
   382	\section{Reconstruction and classification}
   383	\label{sec:reconstruction}
   384	
   385	The Doplicher\textendash{}Roberts theorem is a reconstruction theorem: it recovers a group from the probe data of its representation category. A second line of reconstruction results runs through commutative and topological probes, and comparing the two clarifies what the gauge classification of this volume does and does not achieve.
   386	
   387	\begin{theorem}[Reconstruction from commutative probes]
   388	\label{thm:gelfand}
   389	The Gelfand\textendash{}Naimark theorem embeds every $\mathrm{C}^*$-algebra in an algebra of operators on a Hilbert space, and for commutative $\mathrm{C}^*$-algebras the Gelfand transform is an isomorphism onto the continuous functions on the Gelfand spectrum~\cite{gelfand-naimark}. Stone duality is the Boolean analogue: a Boolean algebra is recovered from its space of ultrafilters~\cite{stone}. In each case the object is determined by its commutative or Boolean probe data.
   390	\end{theorem}

exec
/usr/local/bin/zsh -lc "sed -n '390,490p' papers/latex/vol-07-gauge-qft.tex | nl -ba -v 390" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 0ms:
   390	\end{theorem}
   391	
   392	\begin{proof}
   393	The Gelfand transform sends an element of a commutative unital $\mathrm{C}^*$-algebra to the function on the maximal ideal space given by evaluation; the spectral radius formula gives continuity, multiplicativity is immediate, and the $\mathrm{C}^*$-identity supplies the isometry property that makes the transform injective and surjective onto $C_0(\Omega)$. The noncommutative embedding is the GNS construction applied to a separating family of states. Stone's theorem is the categorical equivalence between Boolean algebras and the totally disconnected compact Hausdorff spaces, with ultrafilter spaces as the spectrum functor.
   394	\end{proof}
   395	
   396	Reconstruction and classification answer different questions. A classification theorem names an invariant whose value determines the object up to a stated equivalence, and its output is a parameter space. A reconstruction theorem recovers the object from a class of probes, and its output is a functor that rebuilds the object. Theorem~\ref{thm:gelfand} rebuilds an algebra from its commutative probes, Theorem~\ref{thm:dr} rebuilds a gauge group from its representation-category probes, and Theorem~\ref{thm:bundles} classifies bundles by homotopy-class data without rebuilding them. The gauge group recovered by Doplicher\textendash{}Roberts is the global form data of Example~\ref{ex:global-form}, which the local algebra of observables cannot see; the reconstruction is therefore genuinely recovering structure rather than reparameterizing it.
   397	
   398	The pattern matters for the series program because reconstruction is better developed than classification in several domains. Where a classification is open, a reconstruction result may still recover the object from probes, and where a reconstruction exists, the recovered data becomes a candidate classifying invariant. We record both kinds of result for the gauge and topological domains and mark the boundary between them: bundles are classified, gauge groups are reconstructed from sectors, and the analytic moduli spaces of connections are neither.
   399	
   400	\section{Invariant records for gauge theories}
   401	\label{sec:invariants}
   402	
   403	The series records the structural invariant record of a theory $T$ as a five-tuple
   404	\[
   405	\mathcal{I}(T) = (\mathcal{S}_T, \mathcal{O}_T, \mathcal{D}_T, \mathcal{G}_T, \mathcal{R}_T),
   406	\]
   407	describing states, observables, dynamics, symmetries, and representations. Instantiating the record for the gauge and topological theories of this volume shows exactly which components the classification results reach.
   408	
   409	For a Yang-Mills system on a four-manifold with gauge group $G$, the state component $\mathcal{S}_T$ is the moduli space of connections modulo gauge, classified only in its topological stratification by the bundle data. The observable component $\mathcal{O}_T$ is generated by Wilson loops and curvature polynomials, with no classification theorem in this volume. The dynamics component $\mathcal{D}_T$ is the Yang-Mills functional, outside all our theorems. The symmetry component $\mathcal{G}_T$ is the gauge group together with its global form, classified by Theorem~\ref{thm:killing-cartan} and Example~\ref{ex:global-form}. The representation component $\mathcal{R}_T$ is the matter content, classified by Theorem~\ref{thm:highest-weight} and constrained by Proposition~\ref{prop:cancellation}.
   410	
   411	For a two-dimensional topological theory the record is sharper. The state component is the vector space assigned to the circle, the observable component is the Frobenius algebra of Theorem~\ref{thm:frobenius}, the dynamics is empty because the theory has no local degrees of freedom, the symmetry is the mapping-class action on the assigned spaces, and the representations are the modules over the Frobenius algebra. All five components are determined by the commutative Frobenius algebra, which is why the classification is complete in this case.
   412	
   413	For a local net satisfying the DHR hypotheses, the representation component $\mathcal{R}_T$ is the sector category, classified by Theorem~\ref{thm:dr} up to symmetric monoidal equivalence, and the symmetry component $\mathcal{G}_T$ is recovered from it by reconstruction. The state, observable, and dynamics components are those of the net itself and are not classified here.
   414	
   415	The classification results of this volume cover the symmetry and representation components of the gauge record and all components of the topological record. The analytic components are open, and the constructive quantum field theory claims of Section~\ref{sec:claims} are attempts to reach them that have not yet arrived.
   416	
   417	\section{Claims in constructive quantum field theory}
   418	\label{sec:claims}
   419	
   420	The claim ladder separates an announced result, a manuscript, a machine-checked formalization, an independently verified proof, and an accepted theorem; a result moves up the ladder only by an artifact that can be checked, and each row of the register below keeps its current rung. Table~\ref{tab:rigorous} collects rigorous results in restricted regimes and the official problem status. Table~\ref{tab:claims} collects claims that lack public proof artifacts.
   421	
   422	\begin{table}[ht]
   423	\centering
   424	\small
   425	\caption{Rigorous results in restricted regimes and the official problem status, as of 29 October 2026. Each row is proved or official within its stated scope.}
   426	\label{tab:rigorous}
   427	\begin{tabularx}{\textwidth}{L{0.20\textwidth} X L{0.30\textwidth}}
   428	\toprule
   429	Entry & Content & Status on the record \\
   430	\midrule
   431	Clay problem status & A positive mass gap for four-dimensional Yang-Mills theory & Open. The Clay Mathematics Institute lists the problem as unsolved and records that no proof of the property is known~\cite{clay} \\
   432	\addlinespace
   433	Nissim lattice theorem & Mass gap, unique infinite-volume limit, and large-$N$ limit for $\mathrm{U}(N)$ lattice Yang-Mills in the 't Hooft regime~\cite{nissim} & Rigorous theorem restricted to its regime. It does not address continuum four-dimensional existence or the continuum mass gap \\
   434	\addlinespace
   435	Cao\textendash{}Nissim\textendash{}Sheffield lattice theorem & Wilson area law in the 't Hooft regime by the dynamical approach~\cite{cns} & Rigorous theorem restricted to its regime, with the same limitation \\
   436	\addlinespace
   437	Faria da Veiga\textendash{}O'Carroll lattice analysis & Charge-conjugation decomposition, Elitzur theorem, and mass-term analysis for lattice $\mathrm{SU}(N)$ in four dimensions~\cite{fdv} & Rigorous results on the lattice model. They do not close the continuum limit \\
   438	\addlinespace
   439	Douglas survey & Pre-claim survey of the rigorous status: renormalization has never been made rigorous in the needed generality, and no clear path to the mass gap is known~\cite{douglas} & Published assessment, January 2026 \\
   440	\bottomrule
   441	\end{tabularx}
   442	\end{table}
   443	
   444	\begin{table}[ht]
   445	\centering
   446	\small
   447	\caption{Claims without public proof artifacts, as of 29 October 2026. None of these rows is a theorem of this volume or of the public record.}
   448	\label{tab:claims}
   449	\begin{tabularx}{\textwidth}{L{0.18\textwidth} X L{0.30\textwidth}}
   450	\toprule
   451	Claim & Content & Status on the record \\
   452	\midrule
   453	OpenAI existence claim & Rigorous existence of quantum chromodynamics, a simplest grand unified completion, and pure Yang-Mills theory as a subproblem, by Balaban-program methods~\cite{openai, kitp} & Existence claimed. Manuscript and formalization withheld. Verification pending before a committee chaired by Gross with Douglas, Jaffe, Klebanov, and Nekrasov \\
   454	\addlinespace
   455	Faizal\textendash{}Shabir construction & Reflection-positive four-dimensional $\mathrm{SU}(N)$ Yang-Mills theory with mass gap, confinement, and Osterwalder\textendash{}Schrader reconstruction~\cite{faizal} & Journal-published and unverified. Not treated as solving the Clay problem \\
   456	\addlinespace
   457	Jacobsen preprint & Existence and mass gap by a five-dimensional orbifold regulator~\cite{jacobsen} & Withdrawn by arXiv administrators for quality standards. Carries no status \\
   458	\addlinespace
   459	Nair outline & Three-dimensional mass-gap proof outline by a Laplacian eigenvalue inequality~\cite{nair} & Eleven-page preprint outline in three dimensions. No status assigned \\
   460	\bottomrule
   461	\end{tabularx}
   462	\end{table}
   463	
   464	The OpenAI claim carries the strongest external attention and the weakest public evidence. Its status string, binding on every mention of the work, is: existence claimed; manuscript and formalization withheld; verification pending~\cite{openai, kitp}. Nothing withheld from the public record can be machine-checked. The release of the artifacts is a tracked event; until then the entry belongs to the claims register and not among theorems.
   465	
   466	The mass-gap row is the hard constraint. The Clay problem requires existence and a positive mass gap together~\cite{clay}. An existence theorem alone does not settle it, so the two entries are never merged. The pre-claim survey of the field, published in January 2026~\cite{douglas}, records that rigorous renormalization has never been made rigorous in the needed generality and that no clear path to the mass gap is known; the October 2026 announcement postdates that survey, challenges its pessimism on the existence side, and confirms its assessment on the mass-gap side.
   467	
   468	The remaining rows fix the other rungs. A journal-published claim that the community has not verified stays at its rung. A withdrawn preprint leaves the ladder. An outline without proof carries no status. The lattice rows of Table~\ref{tab:rigorous} are rigorous within their regimes and say nothing about the continuum limits the classification needs.
   469	
   470	The program these claims enter has foundations older than the claims. The Osterwalder\textendash{}Schrader axioms fix the passage from Euclidean correlation functions to a Minkowski theory~\cite{osterwalder-schrader}. The renormalization-group program for lattice gauge theories that the existence claims invoke descends from Balaban's multiscale cluster expansions~\cite{balaban}. Glimm and Jaffe's text is the standard reference for constructive field theory~\cite{glimm-jaffe}. The register above is the current frontier of that program, and the classification question is which of its eventual members the invariants of the proved core will reach.
   471	
   472	If the OpenAI claim is validated, the admissible set of four-dimensional interacting theories will contain at least one rigorous member, and the classification will record where it sits relative to the known families. Until the artifacts are released, no result of this volume depends on the claim. Classifying the structures that are already proved does not wait on the verdict.
   473	
   474	A validated existence claim would establish less than it might appear. It would show that a four-dimensional interacting quantum field theory can be constructed with the stated properties, and it would settle the existence half of the Clay problem. It would not give a mass gap, it would not classify the set of such theories, and it would not place the constructed theory inside the classification of gauge structures of Sections~\ref{sec:lie} to~\ref{sec:anomalies} without further work on its gauge group, its bundle data, and its matter representations. The classification program would then face a concrete object in the claimed regime and the question of which invariants reach it. That is the practical shape of the boundary between the proved core and the claims register.
   475	
   476	\section{Computational experiments}
   477	\label{sec:experiments}
   478	
   479	Four finite-instance checks accompany this volume. They compute small examples and do not test the full domains of the theorems above, whose content is topological, continuous, or infinite-dimensional. The theorems stand on the proofs in Sections~\ref{sec:lie} to~\ref{sec:tqft}.
   480	
   481	The first group reproduces the classification table of principal bundles over spheres on small examples. For gauge groups $\mathrm{U}(1)$, $\mathrm{SU}(2)$, $\mathrm{SO}(3)$, and $\mathrm{U}(2)$ and base spheres of dimensions one to four, the script writes the homotopy group $\pi_{n-1}(G)$ that Proposition~\ref{prop:spheres} identifies, and records the characteristic class that detects the generator where one is standard. The output reproduces the known values: $\mathrm{U}(1)$-bundles over $S^2$ form a copy of $\mathbb{Z}$ detected by $c_1$, $\mathrm{SU}(2)$-bundles over $S^2$ and $S^3$ are trivial, and $\mathrm{SU}(2)$-bundles over $S^4$ form a copy of $\mathbb{Z}$ detected by $c_2$. The $\mathrm{SO}(3)$ column reproduces Example~\ref{ex:global-form}: a copy of $\mathbb{Z}/2$ over $S^2$ detected by $w_2$, which is the global-form distinction the Lie algebra cannot see.
   482	
   483	The second group computes Chevalley\textendash{}Eilenberg cohomology for two small gauge algebras. For the two-dimensional non-abelian algebra of Example~\ref{ex:abelian-anomaly} and for $\mathfrak{su}(2)$ the script constructs the differential exactly over the rationals, computes $H^1$ and $H^2$, and reports the algebraic obstruction data. The non-abelian case displays the nonzero first class that records its nontrivial abelian quotient, and the semisimple case displays the vanishing consistent with the absence of abelian quotients. The script checks Example~\ref{ex:abelian-anomaly} on the nose; the field-theory anomaly of Definition~\ref{def:bvbrst-anomaly} lives in the local BRST cohomology and is not computed here.
   484	
   485	The third group tests the Frobenius correspondence of Theorem~\ref{thm:frobenius} on one finite-dimensional algebra. For the group algebra of $\mathbb{Z}/2$ the script builds the functor on two-dimensional cobordisms cut into elementary pieces and verifies that the value of a closed surface is independent of the decomposition and that the gluing axioms hold. The failure mode it guards against is a degenerate counit on an otherwise well-behaved algebra; the script constructs one and shows that the dual-basis construction of the comultiplication fails there, so the Frobenius condition is doing real work in the correspondence.
   486	
   487	The fourth group enumerates connected Dynkin diagrams up to rank eight. By testing the Cartan-matrix conditions of positive definiteness and integrality on the finite set of candidate graphs of rank at most eight, the script recovers exactly the finite-type lists $A_r$, $B_r$, $C_r$, $D_r$, $G_2$, $F_4$, $E_6$, $E_7$, $E_8$ and no others. The enumeration is a check on the classification rather than a proof of it, since the argument that no other diagrams exist is the mathematical content of Theorem~\ref{thm:killing-cartan}.
   488	
   489	The code evidence appendix maps each finite-instance check to its file and function.
   490	

exec
/usr/local/bin/zsh -lc "python3 -c 'import re,collections,pathlib; s=pathlib.Path(\"papers/latex/vol-07-gauge-qft.tex\").read_text(); labels=re.findall(r\"\\\\label\\{(["'^}]+)'"\\}\",s); bibs=re.findall(r\"\\\\bibitem\\{(["'^}]+)'"\\}\",s); refs=[x.strip() for m in re.findall(r\"\\\\(?:ref|eqref|cref|Cref)\\{(["'^}]+)'"\\}\",s) for x in m.split(\",\")]; cites=[x.strip() for m in re.findall(r\"\\\\cite\\{(["'^}]+)'"\\}\",s) for x in m.split(\",\")]; print(\"Undefined references:\",sorted(set(refs)-set(labels))); print(\"Undefined citations:\",sorted(set(cites)-set(bibs))); print(\"Duplicate labels:\",[x for x,n in collections.Counter(labels).items() if n>1]); print(\"Duplicate bibliography keys:\",[x for x,n in collections.Counter(bibs).items() if n>1])'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 17ms:
Undefined references: []
Undefined citations: []
Duplicate labels: []
Duplicate bibliography keys: []

exec
/usr/local/bin/zsh -lc "python3 -c 'import pathlib; lines=pathlib.Path(\"papers/latex/vol-07-gauge-qft.tex\").read_text().splitlines(); names=[\"Yang-Mills\",\"Borel-Weil\",\"Stiefel-Whitney\",\"Huang-Lepowsky\",\"Cauchy-Riemann\"]; print(\"\\n\".join(n+\": \"+\", \".join(str(i) for i,s in enumerate(lines,1) if n in s) for n in names))'" in /Users/mlong/Documents/Development/classification-physical-systems
 succeeded in 23ms:
Yang-Mills: 47, 60, 95, 169, 331, 409, 431, 433, 453, 455, 520, 574, 580, 595, 601, 604, 619, 622, 637, 640
Borel-Weil: 158
Stiefel-Whitney: 220, 222
Huang-Lepowsky: 649
Cauchy-Riemann: 652

codex
Source-only review of `papers/latex/vol-07-gauge-qft.tex`; compilation and resulting box warnings were not verified. No undefined references, missing citation keys, or duplicate labels were found.

One styling issue remains: some paired-surname compounds still use ordinary hyphens, inconsistently with the stated house style. Replace them with `\textendash{}`:

- **Lines 158:** `Borel-Weil` → `Borel\textendash{}Weil`.
- **Lines 220, 222:** `Stiefel-Whitney` → `Stiefel\textendash{}Whitney`.
- **Line 649:** `Huang-Lepowsky` → `Huang\textendash{}Lepowsky`.
- **Line 652:** `Cauchy-Riemann` → `Cauchy\textendash{}Riemann`.
- **Lines 47, 60, 95, 169, 331, 409, 431, 433, 453, 455, 520, 574, 580, 595, 601, 604, 619, 622, 637, 640:** `Yang-Mills` → `Yang\textendash{}Mills`.

VERDICT: NEEDS_FIX (issues listed above must be fixed)
hook: Stop
hook: Stop Completed
tokens used
44,572
Source-only review of `papers/latex/vol-07-gauge-qft.tex`; compilation and resulting box warnings were not verified. No undefined references, missing citation keys, or duplicate labels were found.

One styling issue remains: some paired-surname compounds still use ordinary hyphens, inconsistently with the stated house style. Replace them with `\textendash{}`:

- **Lines 158:** `Borel-Weil` → `Borel\textendash{}Weil`.
- **Lines 220, 222:** `Stiefel-Whitney` → `Stiefel\textendash{}Whitney`.
- **Line 649:** `Huang-Lepowsky` → `Huang\textendash{}Lepowsky`.
- **Line 652:** `Cauchy-Riemann` → `Cauchy\textendash{}Riemann`.
- **Lines 47, 60, 95, 169, 331, 409, 431, 433, 453, 455, 520, 574, 580, 595, 601, 604, 619, 622, 637, 640:** `Yang-Mills` → `Yang\textendash{}Mills`.

VERDICT: NEEDS_FIX (issues listed above must be fixed)
