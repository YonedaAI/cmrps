# The Periodic Table of Mathematical Physics

**Program:** CMRPS, a 12-volume series by the YonedaAI Collaboration (PI Matthew Long).
**Status date:** 2026-10-29.
**Nature of this chart.** A research framework for classification, not a completed classification. Completeness is a theorem to investigate (Founding Document 02); the central conjecture it serves is registered as T-CMRPS-01 and remains a **conjecture**.

**Status legend (used in every cell of every Status column).**

| Token | Meaning |
|---|---|
| **PROVEN** | A classification theorem with a completeness statement exists in the stated scope. |
| **CLAIMED** | An announced result whose supporting artifacts are not publicly checkable. |
| **OPEN** | No complete result; partial or parametric results noted in the row. |
| **IMPOSSIBLE** | A theorem proves that no classification of the stated kind can exist. |

Citation convention: bracketed numbers resolve to the Sources list of `research/cmrps-research-map/REPORT.md`. Inferences are marked *conjectural* or *open*.

---

## (a) Fundamental structural families and their defining invariants

Families I–X are the candidate organizing families of the founding document §4 (DEF-026–035). They are candidates, not a completed classification.

| Family | Structure | Representative systems | Defining invariants | Status | Sources |
|---|---|---|---|---|---|
| **I** | Symplectic and Poisson structures | Classical mechanics | Symplectic form ω; **locally: none** (Darboux normal form); globally: topology of ω. Poisson: Weinstein splitting (symplectic × transverse), symplectic-leaf foliation, coadjoint orbits for KKS | **PROVEN** local; global classification topological | [6][7] |
| **II** | Hilbert spaces and operator algebras | Quantum mechanics | Dimension vector (finite-dim C*: A ≅ ⊕ M_{n_i}(C)); Murray–von Neumann type + Connes invariants (amenable factors); Kraus rank (channels) | **PROVEN** islands; general factors **IMPOSSIBLE** [8]; fusion cats **OPEN** [14] | [8][9][10][11][14] |
| **III** | Smooth manifolds and geometric structures | Relativity | Holonomy group (Lorentzian, Berger-list analogue); causal class (complete causal ladder); Thurston geometry type (3-manifolds) | **PROVEN** in stated regimes; dim-4 unrecognizable instances **IMPOSSIBLE** | [50][51][54][60] |
| **IV** | Principal bundles and connections | Gauge theories | [X, BG]; characteristic classes in H*(BG) (SW, Pontryagin, Euler, Chern, DD); anomaly classes H¹⊕H²(CE(P)) | **PROVEN** (bundles; anomalies as obstructions) | [17][18][19] |
| **V** | Probability and measure-theoretic structures | Statistical physics | Fisher metric, unique up to constant (Chentsov, classical) | **PROVEN** unique classical; quantum parametric (Petz–Sudar) | [52] |
| **VI** | Topological and higher-categorical structures | TQFTs | Fully dualizable objects (cobordism hypothesis); Atiyah axioms | **CLAIMED** for extended TQFTs (Lurie proof sketch) [35]; functorial TQFT **PROVEN** tractable [36] | [34][35][36] |
| **VII** | Dynamical systems and operator semigroups | Dissipative and open systems | Generator data; Stinespring minimal dilation of CP maps | **OPEN** as a classification; normal form only | [10][11] |
| **VIII** | Tensor categories and compositional structures | Quantum information | Symmetric structure (load-bearing); conjugates, subobjects, End(1)=C (DR hypotheses); pivotal structure (fusion cats) | **PROVEN** islands (DR, Deligne); fusion cats **OPEN** | [12][13][14][16] |
| **IX** | Discrete combinatorial structures | Lattice and network models | Lattice data; tame/wild class | **PROVEN** regime-restricted theorems [30][31][32]; wild sectors **IMPOSSIBLE** to classify | [30][31][32][55][56][57][58] |
| **X** | Derived and homotopical structures | Higher gauge and derived field theories | Derived-tame vs derived-wild dichotomy | **OPEN** beyond the dichotomy | [55] |

**Cross-family correspondences.** Classical–quantum connection via deformation quantization is *conjectural* (Founding Document §4). Gelfand/Stone/DR/Deligne links are proved — see region (c). The 2024–2026 supermap-representability line [40][41] and its possible unification with Gelfand/Stone/Naimark is *open*.

---

## (b) Exceptional structures

The CFSG template suggests families + sporadics. The founding document warns: one should not assume that physical theories possess a finite collection of exceptional objects analogous to the 26 sporadic groups (Founding Document 03). The entries below are the proven exceptional mathematics the table must accommodate.

| Exceptional object | Region | Defining data | Status | Sources |
|---|---|---|---|---|
| 26 sporadic finite simple groups (27 counting Tits) | Family II/group theory | Order, Schur multiplier, Out(G), presentations, character tables with power maps (ATLAS companions) | **PROVEN** to exist and be exhaustive (CFSG); no uniform parameterization known | [1][2][3] |
| Exceptional Lie algebras G2, F4, E6, E7, E8 | Family I–II boundary (symmetry) | Dynkin diagrams outside A–D series; Satake diagrams for their real forms | **PROVEN** (Killing–Cartan complete) | [4] |
| Real forms and compact/split forms | Family III (symmetry layer) | Order-≤2 automorphism classes; split and compact forms always exist | **PROVEN** | [4] |
| Amenable type III₀ and III₁ factors | Family II | III₀ = ergodic flows; III₁ completed by Haagerup; III_λ (0<λ≤1) continuous parameter | **PROVEN** within the amenable class | [8] |
| Hyperfinite (AFD) II₁ factor | Family II | Unique amenable II₁ factor | **PROVEN**; contrast: uncountably many non-amenable separable II₁ factors | [8] |
| Thurston's 8 model geometries | Family III | S³, E³, H³, S²×R, H²×R, Nil, Sol, SL₂(R)~ | **PROVEN** (geometrization) | [60] |
| Filipkiewicz's dim-4 model geometries | Family III | 18 + one countably infinite family | **PROVEN** to exist; only restricted 4-manifold classes decompose | [60] |
| Isocategorical group pairs (Etingof–Gelaki) | Family VIII | Non-isomorphic groups with equivalent plain tensor representation categories | **PROVEN** to exist — the symmetric layer is not recoverable without them | [12] |
| Extra Z₂ factor in higher-form DHR (Casini–Magan) | Families IV, VIII | Sector not realizable by Lagrangian gauge models | **OPEN** [single source] | [20] |

---

## (c) Proven reconstruction relationships

Objects determined by probes — the pattern CFSG-class classification rarely achieves but reconstruction theorems routinely do.

| Reconstruction theorem | Recovers | From | Scope limits | Status | Sources |
|---|---|---|---|---|---|
| Gelfand–Naimark | A concrete representation of a C*-algebra in B(H) | Abstract C*-algebra | Representation theorem, **not** a classification; only the commutative case is fully classified | **PROVEN** | [9][42] |
| Gelfand duality | Compact Hausdorff space | Commutative C*-algebra | Commutative side only | **PROVEN** | [43] |
| Stone duality | Spectrum (zero-dimensional compact space) | Boolean algebra | Boolean side only | **PROVEN** | [44] |
| Doplicher–Roberts reconstruction | Compact supergroup (unique up to isomorphism) | Symmetric tensor *-category with conjugates, direct sums, subobjects, End(1)=C | Requires the symmetric structure; DHR selection criteria; Haag duality in the QFT reading | **PROVEN** under stated hypotheses | [12][15][16] |
| Deligne's theorem | Supergroup representation category | Char-0 symmetric tensor category of subexponential growth | Hypotheses essential | **PROVEN** | [13] |
| Stinespring dilation | Minimal dilation (unique up to unitary) | Completely positive map | Normal form; not an isomorphism classification of channels | **PROVEN** | [10][11] |
| Classifying-space construction | Principal G-bundle from a map X → BG | Map to classifying space | Homotopy-classified; characteristic classes are pullbacks | **PROVEN** | [17][18] |
| Supermap representability | Concrete representation of categorical supermaps | Theory with suitable channel–state duality (2024–2026) | Settings with channel–state duality; unification with Gelfand/Stone/Naimark **open** | **PROVEN** in stated settings | [40][41] |

---

## (d) Established equivalences and dualities

**Standing warning (Etingof–Gelaki).** Tensor-category equivalence **without symmetric structure** provably fails to recover the group: non-isomorphic finite groups can carry equivalent plain tensor representation categories [12]. Any equivalence, duality, or classification in the series that forgets the monoidal/symmetric layer is **false** (DEF-018). The table marks this row **IMPOSSIBLE** as a recovery principle.

| Equivalence / duality | Identifies | Preserves | Status | Sources |
|---|---|---|---|---|
| Tensor-cat equivalence without symmetric structure → group recovery | — | nothing usable | **IMPOSSIBLE** (Etingof–Gelaki isocategorical groups) | [12] |
| DR equivalence: symmetric tensor *-cat ≃ Rep(compact supergroup) | Superselection data and compact supergroup | Symmetric tensor structure, conjugates, End(1)=C | **PROVEN** | [12][16] |
| Deligne equivalence: subexponential char-0 symmetric tensor cats ≃ supergroup reps | Tensor category and supergroup representations | Symmetric structure, growth condition | **PROVEN** | [13] |
| Gelfand duality | Commutative C*-algebras and compact Hausdorff spaces | Algebraic/topological structure | **PROVEN** | [43] |
| Stone duality | Boolean algebras and zero-dimensional compact spectra | Boolean structure | **PROVEN** | [44] |
| *-isomorphism of finite-dim C*-algebras | Dimension vectors and algebras | *-algebra structure | **PROVEN** | [9] |
| Channel equivalence via minimal Stinespring dilation | CP maps and dilations | Complete positivity; unitary freedom | **PROVEN** (up to unitary) | [10] |
| Müger's Galois theory for braided tensor categories | Fixed-point-net representation categories | Braided structure **plus extra "soliton" data** | **PROVEN**; extra data required | [21] |
| Holographic duality (AdS/CFT) as applied to RT | Bulk geometry and boundary entanglement | — | **OPEN** — RT verified exactly only in AdS₃/2D CFT [45]; entanglement-wedge reconstruction is a **PROVEN** quantum-information theorem [46]; HaPPY codes are tensor-network toys, not AdS/CFT [48] | [45][46][48] |
| Yoneda embedding Hom(−, P) | Objects and their relational profiles | Categorical structure | **PROVEN** mathematically; the Yoneda qualification binds: **"Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem."** | Founding Document §5 |

---

## (e) Open classification problems

| Problem | Region | What is known | Status | Sources |
|---|---|---|---|---|
| Fusion categories | Family VIII | Every fusion category is Rep of a weak Hopf algebra (Ostrik); ENO pivotal-structure conjecture (Annals 162, 2005) | **OPEN** | [14] |
| Elliott program (simple nuclear C*-algebras, UCT) | Family II | Active unfinished program | **OPEN** | [9] |
| Holographic entropy cone, n ≥ 5 | Families III, VI | For fixed n finitely many independent inequalities exist; only one infinite family known; a 2026 "multi-entropy cone" preprint is unverified | **OPEN** | [47] |
| Lurie proof gap (extended TQFTs) | Family VI | Baez–Dolan proposal [34]; Lurie 2009 is an "informal sketch of a proof" [35]; exact range of completed cases unverified | **OPEN** (claim **CLAIMED**) | [34][35] |
| Yang–Mills mass gap | Family VII/QFT | Clay: "no proof of this property is known"; explicitly not claimed in the 2026 announcements | **OPEN** | [23][25][26] |
| 4D YM/QCD existence | Family VII/QFT | Existence claimed 2026-10-26 (QCD, GUT completion, pure YM subproblem, Balaban-based); 1147-page manuscript unpublished; claimed Lean formalization withheld; KITP verification pending | **CLAIMED** — never conflated with mass gap | [24][25][26] |
| Quantum monotone metrics | Family V | Classified parametrically by operator monotone functions (Petz–Sudar) — not a finite list | **OPEN** (classification not finite) | [52] |
| General II₁ / III factors | Family II | Coarse Connes-spectrum strata only; fundamental groups vary | **IMPOSSIBLE** globally [8]; residual strata **OPEN** | [8] |
| Uniform parameterization of finite simple groups | Group theory | CFSG complete; "no clean uniform description… is known" [1] | **OPEN** | [1] |
| Freed–Hopkins anomaly classification statement | Family IV | Cobordism-spectrum statement not retrieved; primary source needed | **OPEN** | [19] context |
| Type-III factor structure beyond Connes spectrum | Family II | Coarse strata; examples with countable and trivial fundamental groups | **OPEN** | [8] |

---

## (f) Obstructions region — where no table exists

A periodic table must mark where no table can exist. Each entry below is a **theorem**, not a difficulty.

| Obstruction | Statement | What it forbids | Status | Sources |
|---|---|---|---|---|
| Adyan–Rabin | Every Markov property of finitely presentable groups is algorithmically undecidable — including finiteness and simplicity (Collins extended beyond Markov properties) | Any uniform recognition procedure for group-flavored sectors | **IMPOSSIBLE** | [53] |
| McDuff | Uncountably many non-isomorphic separable type II₁ factors | CFSG-style total classification of factors outside the amenable case | **IMPOSSIBLE** | [8] |
| Wildness (derived-wild; Buchweitz–Leuschke; Grevstad–May) | Rank-2 isomorphism classes of the generic determinant's Cohen–Macaulay modules are not parametrizable by a finite-dimensional variety; "no meaningful classification" of compact C_p-equivariant HF_p-modules at odd primes; wildness is degeneration-robust | Finite-variety parameterization of wild representation categories | **IMPOSSIBLE** | [55][56][58] |
| Tame/wild tractability boundary (Grochow–Qiao) | Polynomial-time group isomorphism for tame extensions; required bounds fail in the wild case | Algorithmic classification in wild regimes | **IMPOSSIBLE** (wild side) | [57] |
| Borel reducibility / turbulence (Sasyk–Tørnquist) | Von Neumann algebra isomorphism admits no classification by countable invariants | Countable-invariant classifications of vN algebras | **IMPOSSIBLE** [single source; announcement-level] | [59] |
| Dimension-4 unrecognizability (Tancer; Gordon) | #₉(S²×S²) homeomorphism is algorithmically unrecognizable (improving #₁₂) | Effective classification of 4-manifolds in general | **IMPOSSIBLE** | [54][60] |
| Etingof–Gelaki | Isocategorical groups: tensor equivalence without symmetric structure does not determine the group | Equivalence notions that discard the monoidal/symmetric layer | **IMPOSSIBLE** | [12] |
| Unknotting problem | Unknot recognition is in NP and coNP; P-membership open | — (a "decidable but unclassified" middle regime) | **OPEN** | [61] |
| Darboux triviality | Symplectic geometry has no local invariants | Local classification content on the symplectic side (classification must be global) | **PROVEN** (trivially classified locally) | [6] |

**Regime contrast.** Geometrization decomposes 3-manifolds into exactly 8 Thurston geometries [60] — finite tables exist, but only in tame regimes (dimension 3, not 4 [54][60]). The synthesis offered to the program is that one should expect restricted-class classification theorems plus explicit obstruction theorems, not one global periodic table; this synthesis is *conjectural*.

---

## Reading the table

1. **PROVEN** cells are citations to completed theorems; **IMPOSSIBLE** cells are citations to impossibility theorems — both are knowledge.
2. **CLAIMED** appears exactly once as a classification-status cell (4D YM/QCD existence) [24][25][26]; existence and mass gap are never conflated [23][26].
3. **OPEN** cells mark where the series' own conjecture (T-CMRPS-01) and its five obligations live; the table is the chart that conjecture would complete.
4. Every equivalences entry names the structure it preserves, or records the failure that follows from not naming it [12].
