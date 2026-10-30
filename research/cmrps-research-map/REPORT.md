# The Structural Classification of Mathematical Representations of Physical Systems: what is classified, what is claimed, and what is provably unclassifiable

> Generated 2026-10-29 · depth: deep · 61 sources · workspace: research/cmrps-research-map/

## Executive summary

- CFSG itself is a "families + sporadics" theorem: 18 infinite families plus 26 sporadic groups, proved across roughly 100 authors and tens of thousands of pages, completed only in 2004 [1][2]. But Gorenstein's own verdict is load-bearing for CMRPS: **no clean uniform description of the finite simple groups analogous to Dynkin diagrams is known** [1]. The model classification program lacks the uniform parameterization a "periodic table" would want.
- Classification theorems exist and are sharp exactly where the invariant is finite or parametric: Dynkin/Satake classification of simple Lie groups [4], highest-weight classification of irreps (existence is the hard part) [5], Darboux normal form (symplectic geometry has NO local invariants) [6], Weinstein splitting for Poisson manifolds [7], finite-dimensional C*-algebras by dimension vector [9], amenable/hyperfinite factors [8], principal bundles via classifying spaces [17].
- Classification already fails in central quantum territory: McDuff (1969) gives uncountably many separable II₁ factors [8]; fusion categories remain unclassified with the Etingof–Nikshych–Ostrik pivotal conjecture open [14]; the Elliott nuclear program is explicitly unfinished [9].
- Reconstruction is better developed than classification: Gelfand–Naimark [42], Gelfand duality [43], Stone duality [44], and Doplicher–Roberts superselection reconstruction [12][15][16] all recover structure from probes. A 2024–2026 line establishes a literal "Yoneda lemma for physics" (categorical supermaps) [40][41].
- The choice of equivalence is mathematically load-bearing: Etingof–Gelaki isocategorical groups show that tensor-category equivalence WITHOUT symmetric structure provably fails to recover the group [12]. Any CMRPS classification that forgets the monoidal/symmetric layer is false.
- The 2024–2026 constructive-QFT claims sit on a strict ladder: Clay still lists Yang–Mills "Unsolved" as of 2026-10-29 [23]; OpenAI's 2026-10-26 announcement claims **existence only** (QCD, a GUT completion, pure YM as subproblem) on a Balaban-based 1147-page unpublished manuscript with a claimed-but-withheld Lean formalization, verification pending before a KITP committee [24][25][26]. The mass gap remains open [25][26]; rival mass-gap claims exist at lower rungs, including a journal-published but unverified construction [28] and a withdrawn preprint [29].
- Spacetime research splits cleanly: PROVED islands (Lorentzian holonomy classification [51], complete causal ladder [50], holographic entropy cone complete for ≤4 regions [47], entanglement-wedge reconstruction [46]) versus a CONJECTURAL core (Ryu–Takayanagi is a proposal verified exactly only in AdS3 [45]; "entanglement builds spacetime" is explicitly an argument [49]).
- Obstructions are theorems, not moods: Adyan–Rabin undecidability of Markov properties (including finiteness and simplicity) [53], genuine wildness non-classifiability results [56][58], Borel-reducibility/turbulence machinery against countable invariants [59], and 4-manifold unrecognizability already for #₉(S²×S²) [54]. Geometrization's 8 geometries [60] show finite tables exist — but only in tame regimes (dimension 3, not 4 [60][54]).
- Synthesis [speculative]: a CMRPS-style program should expect restricted-class classification theorems plus explicit obstruction theorems — not one global periodic table. This matches the evidence landscape and the program's own staged design.

## Background & scope

The CMRPS program asks whether mathematical representations of physical systems admit a structural classification analogous to CFSG: fundamental families, irreducible building blocks, admissible constructions, and equivalences/dualities (brief.md). In scope: established classification theorems and their invariants, reconstruction theorems, category-/topos-/groupoid approaches, AQFT and constructive-QFT frameworks, the precise status of 2024–2026 constructive-QFT existence claims, spacetime/information-geometry reconstruction, and non-classifiability obstructions. Out of scope: phenomenology and claims without mathematical content. Claim-status discipline: announced ≠ manuscript ≠ machine-checked ≠ independently verified ≠ accepted. The program's own six internal research programs are handled from local context files, not this web research.

## 1. The CFSG template: what a classification theorem actually looks like

The CFSG statement has the "families + sporadics" architecture: every finite simple group is cyclic of prime order, alternating of degree ≥ 5, one of 16 infinite Lie-type families, or one of 26 sporadic groups (27 counting Tits) [1]. The proof spans tens of thousands of pages in several hundred articles by about 100 authors (1955–2004); Gorenstein's 1983 completion announcement was premature, and completion was only announced after Aschbacher–Smith's 1221-page quasithin case in 2004 [1][2]. The proof architecture is Gorenstein's 16-step 1972 program: a case division by local 2-structure (small 2-rank first, then component type vs characteristic 2 type) [1].

Three structural lessons for CMRPS:

1. **The classification and its parameterization are different achievements.** Gorenstein explicitly contrasted CFSG with compact Lie groups: unlike the Dynkin-diagram parameterization, "no one has yet found a clean uniform description of the finite simple groups" [1]. The GLS second-generation rewrite (~5,000 pages projected, 10 volumes as of 2023) exists precisely to reorganize, not to simplify the statement [1].
2. **Practical classification invariants live in a companion atlas.** The ATLAS of Finite Groups (1985, 93 groups) records order, Schur multiplier, outer automorphism group, presentations, maximal subgroups, and character tables with power maps — the invariants practitioners actually identify groups by [3].
3. **A historical baseline exists for citation discipline**: Solomon's survey (Bull. AMS 38, 2001, 315–352) [2].

## 2. Classical structural families: complete local normal forms

The classical side supplies the cleanest "classification theorem" prototypes:

- **Killing–Cartan** is layered: complex semisimple Lie algebras by Dynkin diagrams (A_r, B_r, C_r, D_r + G2, F4, E6, E7, E8); real simple algebras by Satake diagrams (split and compact forms always exist; real forms = order-≤2 automorphism classes); groups follow via central quotients [4].
- **Highest-weight theorem**: finite-dimensional irreps of a complex semisimple Lie algebra are in bijection with dominant integral weights; the three-part proof makes existence the hardest part (Cartan 1913; Weyl for compact groups) [5].
- **Darboux (1882)**: any two symplectic manifolds of the same dimension are locally symplectomorphic — symplectic geometry has NO local invariants, the exact opposite of Riemannian curvature [6]. Classification content on the symplectic side is therefore global/topological, not local.
- **Weinstein splitting**: near a rank-2k point a Poisson manifold splits as symplectic × transverse Poisson; globally, symplectic leaves foliate; for Lie–Poisson (KKS) structures on g* the leaves are the coadjoint orbits [7].

## 3. Quantum side: classified islands, open seas, and one impossibility theorem

The quantum landscape splits three ways.

**Fully classified:**
- Murray–von Neumann reduce von Neumann algebras to factors via essentially-unique direct-integral decomposition; every factor is type I, II, or III [8].
- Amenable (hyperfinite/AFD/injective) factors: unique factors of types I_n, I_∞, II₁, II_∞, III_λ (0<λ≤1), type III₀ = ergodic flows; Murray–von Neumann 1943 (I, II₁), Connes 1976 (Ann. Math. 104:73–115) for the rest, Haagerup completing III₁ [8].
- Finite-dimensional C*-algebras: A ≅ ⊕ matrix algebras, classified by the dimension vector — the program's designated "first concrete theorem" model [9].
- DHR superselection (Doplicher–Roberts 1989, Invent. Math. 98:157–218): any symmetric tensor *-category with conjugates, direct sums, subobjects, End(1)=C is equivalent to finite-dimensional unitary representations of a compact supergroup, unique up to isomorphism [12][16].
- Deligne 2002: characteristic-zero symmetric tensor categories with subexponential growth are supergroup representation categories [13].

**Proved impossibility / non-classifiability:**
- McDuff (1969): uncountably many non-isomorphic separable type II₁ factors [8]. A CFSG-style total classification of factors is already impossible outside the amenable case.
- Etingof–Gelaki isocategorical groups: non-isomorphic finite groups with equivalent representation categories as plain tensor categories — classification must retain symmetric structure [12].

**Partial or open:**
- Type-III factors stratified only coarsely by the Connes spectrum; fundamental groups vary (Connes: countable for property-(T) group algebras; Popa: trivial examples) [8].
- Gelfand–Naimark (1943) is a representation theorem, not a classification; only the commutative case (Gelfand representation) is fully classified [9][42].
- Quantum channels: Stinespring (1955) classifies completely positive maps via minimal dilations unique up to unitary [10]; Choi/Kraus form (N ≤ nm) is normal form, Kraus rank an invariant — not an isomorphism classification [11].
- Fusion categories: every fusion category is Rep of a weak Hopf algebra (Ostrik), but the ENO pivotal-structure conjecture (Annals 162, 2005) remains open [14].
- Elliott classification of separable simple nuclear C*-algebras is an active unfinished program [9].

## 4. Gauge structures and AQFT: bundles are clean, anomalies are obstructions

- **Principal bundles are classified**: GBund(X)₀ ≅ π₀ Top(X, BG) via the Milnor join construction; characteristic classes are exactly pullbacks of universal classes in H*(BG) (Stiefel–Whitney/Pontryagin/Euler/Chern, Dixmier–Douady for gerbes) [17][18].
- **Anomalies are cohomological obstructions**: the fermionic anomaly is non-trivializability of the determinant (or Pfaffian) line bundle of the Dirac/Fredholm operator (Freed 1986) [19]; in BV-BRST the gauge anomaly is the pair H¹(CE(P)) ⊕ H²(CE(P)), and quantization exists only when both vanish [19].
- **Haag–Kastler axiomatizes QFT as local nets of C*-algebras** (isotony, graded commutation, covariance; the exact axiom list "is in flux") [15]. DHR selects admissible representations by vacuum-equivalence on causal complements; under Haag duality these come from localized transportable endomorphisms; long-range forces like electromagnetism are excluded [16].
- **Current frontier (2025–2026)**: Casini–Magan generalize DHR reconstruction to higher-form symmetries, with an open extra Z₂ factor not realizable by Lagrangian gauge models [20] [single source]; Pinzari's braided DR program constructs a global quantum gauge group unifying compact gauge-group reconstruction with Huang–Lepowsky braided structures (arXiv:2502.06229, v8 2026-09-19) [22]; Müger's Galois theory for braided tensor categories shows fixed-point-net representation categories need extra "soliton" data [21].

## 5. Constructive QFT 2024–2026: the claim-status ladder

The ladder discipline matters because the field is currently claim-dense:

| Rung | Claim | Status (2026-10-29) |
|---|---|---|
| Prize body | Clay Yang–Mills problem (existence + mass gap) | **Unsolved**; "no proof of this property is known" [23] |
| Press + unpublished manuscript + withheld formalization | OpenAI 2026-10-26: rigorous **existence** of QCD, a simplest GUT completion, pure YM as subproblem; Balaban-based | 1147-page manuscript unpublished; claimed Lean formalization (2026-10-16) **not released**; KITP committee (Gross chair; Douglas, Jaffe, Klebanov, Nekrasov) verification pending; mass gap explicitly not claimed [24][25][26] |
| Journal-published, unverified | Faizal–Shabir: reflection-positive construction of 4D SU(N) YM with mass gap + confinement + OS reconstruction (Fortsch. Phys. 2026 + 4 IJGMMP companions) | Journal-refereed claim; not treated by community or Clay as solving the problem [28] [single source] |
| Withdrawn | Jacobsen arXiv:2506.00284 (existence + mass gap via 5D orbifold regulator) | Withdrawn by arXiv admins for quality standards [29] |
| Rigorous but regime-restricted | Lattice YM theorems: mass gap + infinite-volume limit for U(N) in the 't Hooft regime (Nissim) [30]; Wilson area law in the 't Hooft regime (Cao–Nissim–Sheffield) [31]; partial 4D lattice SU(N) results (Faria da Veiga–O'Carroll) [32] | Real theorems; do NOT touch continuum 4D existence or continuum mass gap |
| Outline | Nair: 3D mass-gap proof outline via Laplacian eigenvalue inequality | 11-page preprint outline, 3d only [33] |

Pre-claim baseline for comparison (Douglas, Nat. Rev. Phys. 8:86–97, published 2026-01-12): rigorous renormalization "has never been made rigorous in the needed generality" and on the mass gap "no clear path is known" [27]. The OpenAI claim (2026-10) postdates this survey and contradicts its existence-side pessimism while confirming its mass-gap-side assessment [24][25]. The KITP statement credits Balaban's 1980s RG ideas as "among the important elements" and states flatly that "confinement and the mass gap remain very important open challenges" [25]. A parallel LLM-assisted effort (Sussman/Alpöge) to complete Balaban's program believed it was near completion when the unpublished claim "beat them to the finish line" [26].

**Consequences for CMRPS citation policy:** (a) never conflate existence with mass gap [23][26]; (b) any "machine-checked" citation about the OpenAI work must read "claimed Lean formalization, not released" as of 2026-10-29 [24]; (c) the KITP release of the manuscript and formalization is a tracked event that will decide the claim-status chapter.

## 6. Categorical and reconstruction approaches: the closest thing to a CFSG-analogue

- **The cobordism hypothesis is the only physics-side classification program in CFSG's shape.** Baez–Dolan (1995) propose that n-dimensional unitary extended TQFTs are weak n-functors out of the free stable weak n-category with duals [34]; Lurie (2009) supplies — in his own words — "an informal sketch of a proof" classifying extended TQFTs by fully dualizable objects [35]. The proof-status gap is real: any CMRPS claim of "classification achieved" for extended TQFT must be qualified.
- **Atiyah's 1988 axioms** make functorial TQFT tractable "in notorious contrast to the situation for general non-topological QFTs" [36]. Classification succeeds precisely where physics is topological [36].
- **Topos quantum mechanics**: Butterfield–Isham (1998) prove Kochen–Specker equivalent to a presheaf on self-adjoint operators having no global elements [37]; Isham–Döring (2007/08) contend that constructing a physical theory is representing a formal language in a topos, with Set recovering classical physics [38]; Isham's 2010 review is the canonical introduction [39].
- **Reconstruction theorems** (the "objects determined by probes" pattern): Gelfand–Naimark embeds every C*-algebra in B(H) [42]; Gelfand duality reconstructs compact Hausdorff spaces from commutative C*-algebras [43]; Stone duality reconstructs spectra from Boolean algebras [44].
- **A literal Yoneda lemma for physics (2024–2026)**: Hefford–Wilson identify Yoneda representability as the mechanism behind factorisation theorems for quantum supermaps [41]; Wilson–Hefford–Hoffreumon establish that categorical supermaps are concretely representable whenever the theory has suitable channel-state duality [40]. Open synthesis question: whether this line unifies with the Gelfand/Stone/Naimark reconstruction pattern into a single Yoneda-principle account.

## 7. Spacetime and information geometry: proved islands, conjectural sea

**Proved:**
- Connected holonomy groups of Lorentzian manifolds are fully classified (Berger-list analogue in signature (1,n−1)), with realizing metrics constructed (Galaev survey, Russian Math. Surveys 70, 2015) [51].
- The causal ladder of spacetimes is complete (Minguzzi–Sánchez, ESI Lect. 2008) [50].
- The holographic entropy cone is completely classified for 2, 3, and 4 boundary regions: strong subadditivity + monogamy of mutual information give the complete RT inequality set (Bao–Nezami–Ooguri–Stoica–Sully–Walter 2015) [47]; for fixed n there are finitely many independent inequalities, but for n ≥ 5 only an infinite family is known [47].
- Entanglement-wedge bulk reconstruction is a proved quantum-information theorem (Dong–Harlow–Wall 2016) [46].

**Conjectural or model-only:**
- Ryu–Takayanagi is a proposal argued from AdS/CFT and verified exactly only in AdS3/2D CFT [45].
- HaPPY codes prove RT and tripartite-information negativity inside exactly solvable tensor-network toys — not for actual AdS/CFT [48].
- "Entanglement builds spacetime" (Van Raamsdonk 2010) is explicitly an argument: disentangling causes pinch-off [49].

**Information geometry exhibits a sharp uniqueness-then-failure pattern:** Chentsov's theorem makes the Fisher metric the unique (up to constant) metric monotone under stochastic maps; the quantum analogue is NOT unique — Petz–Sudar classify all monotone metrics by operator monotone functions, a parametric classification rather than a finite list [52].

## 8. Obstructions: non-classifiability is itself a theorem

- **Adyan–Rabin (1955/1958)**: every Markov property of finitely presentable groups is algorithmically undecidable — including finiteness and simplicity [53]. No uniform recognition procedure can exist for group-flavored sectors. Collins (1969) extends undecidability beyond Markov properties (Hopfian) [53].
- **Wildness is a true non-classifiability result**, not a complexity complaint: Bekkert–Drozd prove every finite-dimensional algebra over an algebraically closed field is derived-tame or derived-wild, with wildness degeneration-robust [55]; Buchweitz–Leuschke show the generic determinant's Cohen–Macaulay representation theory is "quite wild" — even rank-2 isomorphism classes cannot be parametrized by a finite-dimensional variety [56]; Grevstad–May (2025) conclude "no meaningful classification" of compact C_p-equivariant HF_p-modules exists at odd primes [58].
- **Tame/wild is also an algorithmic tractability boundary**: Grochow–Qiao give polynomial-time group isomorphism for tame extensions and show the needed bounds fail in the wild case [57].
- **Descriptive-set-theoretic machinery** exists to prove that no classification by countable invariants is possible: Sasyk–Tørnquist apply Borel reducibility and Hjorth turbulence to von Neumann algebra isomorphism [59] [single source; announcement-level].
- **Dimension is a sharp frontier**: geometrization decomposes 3-manifolds into exactly 8 Thurston geometries (Perelman 2003) [60]; in dimension 4 only restricted classes decompose, Filipkiewicz found 18 + one countably infinite family of model geometries [60], and Tancer (2023/2025) shows #₉(S²×S²) is algorithmically unrecognizable (improving Gordon's #₁₂) [54]. Knots show a "decidable but unclassified" middle regime: unknot recognition is in NP and coNP but P-membership is open [61].

## 9. Comparison table: classification completeness by domain

| Domain | Status | Classifying invariant(s) | Sources |
|---|---|---|---|
| Finite simple groups | **Complete** (families + 26 sporadics) | order, character table, Schur multiplier, Out(G) (ATLAS); no uniform parameterization known | [1][2][3] |
| Simple Lie groups/algebras | **Complete** | Dynkin diagrams; Satake diagrams for real forms | [4] |
| Irreps of semisimple Lie algebras | **Complete** | dominant integral weights (existence hardest) | [5] |
| Symplectic manifolds (local) | **Complete, trivial locally** | Darboux normal form; no local invariants | [6] |
| Poisson manifolds (local) | **Complete local models** | Weinstein splitting; symplectic leaves | [7] |
| Finite-dim C*-algebras | **Complete** | dimension vector (⊕ matrix blocks) | [9] |
| Amenable/hyperfinite factors | **Complete** | Murray–von Neumann type + Connes invariants | [8] |
| General II₁ / III factors | **Impossible globally** | uncountably many (McDuff); coarse Connes-spectrum strata | [8] |
| Quantum channels | **Normal form only** | Stinespring minimal dilation; Kraus rank | [10][11] |
| Principal G-bundles | **Complete** | [X, BG]; characteristic classes in H*(BG) | [17][18] |
| Anomalies | **Complete as obstructions** | determinant-line triviality; H¹⊕H²(CE(P)) | [19] |
| DHR superselection | **Complete** | Rep of compact supergroup (DR reconstruction) | [12][16] |
| Symmetric tensor cats (char 0, subexp.) | **Complete** | supergroup representations (Deligne) | [13] |
| Fusion categories | **Open** | weak Hopf algebra (Ostrik); ENO pivotal conjecture | [14] |
| Extended TQFTs | **Claimed; informal proof sketch** | fully dualizable objects (cobordism hypothesis) | [34][35] |
| Lorentzian holonomy groups | **Complete** | Berger-list analogue + realizing metrics | [51] |
| Spacetime causality conditions | **Complete** | causal ladder | [50] |
| Holographic entropy cone, ≤4 regions | **Complete** | SSA + MMI inequalities | [47] |
| Holographic entropy cone, n ≥ 5 | **Open** | infinite inequality family only | [47] |
| Monotone metrics (classical) | **Complete, unique** | Fisher metric (Chentsov) | [52] |
| Monotone metrics (quantum) | **Parametric, not finite** | operator monotone functions (Petz–Sudar) | [52] |
| Emergent spacetime / RT | **Conjectural** (proved in toy models) | — | [45][48][49] |
| 4D YM/QCD existence | **Claimed, unverified** | Balaban program (withheld manuscript + formalization) | [24][25][26] |
| 4D YM mass gap | **Open** | — | [23][25] |
| 3-manifolds | **Complete** (geometrization) | 8 Thurston geometries | [60] |
| 4-manifolds | **Unrecognizable instances** | #₉(S²×S²) undecidable homeomorphism | [54][60] |
| F.p. groups (Markov properties) | **Undecidable** | Adyan–Rabin | [53] |
| Wild representation categories | **Non-parametrizable** | Buchweitz–Leuschke rank-2 | [55][56][58] |

## Open questions

1. **Freed–Hopkins anomaly classification** could not be retrieved (wrong arXiv hit discarded); the precise cobordism-spectrum statement of anomaly classification is a needed primary source [19] context.
2. **Lurie's proof gap**: the 2009 text is an "informal sketch"; Schommer-Pries (arXiv:1112.1000) and later full proofs in low dimensions should be checked for exactly which cases are complete [35].
3. **Elliott program / UCT status** rests on secondary summaries [9]; a primary survey is needed.
4. **Holographic entropy cone for 5 parties**: a 2026 "multi-entropy cone" preprint claims a rational polyhedral cone — unverified here; reconcile with the Bao et al. gap [47].
5. **Faizal–Shabir series audit**: where is the continuum limit actually closed vs assumed? Strongest journal-published mass-gap claim on record [28].
6. **OpenAI artifact release**: the KITP committee's verdict and the release of the 1147-page manuscript + Lean formalization will move the claim from "withheld" to "public, checkable" — track before any Volume VII write-up [24][25].
7. **Sussman–Alpöge Balaban-program derivations**: did the scooped effort publish independently? [26].
8. **Coverage bias**: WebSearch was unavailable platform-wide; discovery ran on the arXiv API plus known-URL fetches. Blind spots possible in non-arXiv venues.
9. Follow-ups named by sub-agents: Kirillov orbit method scope; Jones subfactor index/ADE classification; Kerr uniqueness/stability theorems; Bohrification; Sasyk–Tørnquist's full conclusion; knot-census methodology as "classification by enumeration".

## Sources

[1] Classification of finite simple groups — https://en.wikipedia.org/wiki/Classification_of_finite_simple_groups (accessed 2026-10-29)
[2] Solomon, "A brief history of the classification of the finite simple groups", Bull. AMS 38 (2001) 315–352 — https://www.ams.org/journals/bull/2001-38-03/S0273-0979-01-00909-0/ (published 2001-03-27, accessed 2026-10-29)
[3] ATLAS of Finite Groups — https://en.wikipedia.org/wiki/ATLAS_of_Finite_Groups (accessed 2026-10-29)
[4] Simple Lie group — https://en.wikipedia.org/wiki/Simple_Lie_group (accessed 2026-10-29)
[5] Theorem of the highest weight — https://en.wikipedia.org/wiki/Theorem_of_the_highest_weight (accessed 2026-10-29)
[6] Darboux's theorem — https://en.wikipedia.org/wiki/Darboux%27s_theorem (accessed 2026-10-29)
[7] Poisson manifold (WikiJournal of Science 7(1):6, 2024) — https://en.wikipedia.org/wiki/Poisson_manifold (accessed 2026-10-29)
[8] Von Neumann algebra — https://en.wikipedia.org/wiki/Von_Neumann_algebra (accessed 2026-10-29)
[9] C*-algebra — https://en.wikipedia.org/wiki/C*-algebra (accessed 2026-10-29)
[10] Stinespring dilation theorem — https://en.wikipedia.org/wiki/Stinespring_dilation_theorem (accessed 2026-10-29)
[11] Quantum channel — https://en.wikipedia.org/wiki/Quantum_channel (accessed 2026-10-29)
[12] Doplicher–Roberts reconstruction theorem (nLab) — https://ncatlab.org/nlab/show/Doplicher-Roberts+reconstruction+theorem (accessed 2026-10-29)
[13] Deligne's theorem on tensor categories (nLab) — https://ncatlab.org/nlab/show/Deligne%27s+theorem+on+tensor_categories (accessed 2026-10-29)
[14] Fusion category (nLab) — https://ncatlab.org/nlab/show/fusion+category (accessed 2026-10-29)
[15] Haag–Kastler axioms (nLab) — https://ncatlab.org/nlab/show/Haag-Kastler+axioms (accessed 2026-10-29)
[16] DHR superselection theory (nLab) — https://ncatlab.org/nlab/show/DHR+superselection+theory (accessed 2026-10-29)
[17] Classifying space (nLab) — https://ncatlab.org/nlab/show/classifying+space (accessed 2026-10-29)
[18] Characteristic class (nLab) — https://ncatlab.org/nlab/show/characteristic+class (accessed 2026-10-29)
[19] Quantum anomaly (nLab) — https://ncatlab.org/nlab/show/quantum+anomaly (accessed 2026-10-29)
[20] Casini–Magan, arXiv:2511.21810 — https://arxiv.org/abs/2511.21810 (published 2025-11-26, accessed 2026-10-29)
[21] Müger, arXiv:math-ph/0008027 — http://export.arxiv.org/api/query?search_query=all:%22Doplicher-Roberts%22&start=0&max_results=15 (entry arXiv:math-ph/0008027; published 2000-08-21, accessed 2026-10-29)
[22] Pinzari, arXiv:2502.06229 — https://arxiv.org/abs/2502.06229 (v8 2026-09-19, accessed 2026-10-29)
[23] Clay Mathematics Institute, Yang–Mills problem page — https://www.claymath.org/millennium/yang-mills-the-maths-gap/ (accessed 2026-10-29)
[24] OpenAI, "Building scientific understanding with academic communities" — https://openai.com/index/building-scientific-understanding-with-academic-communities/ (published 2026-10-26, accessed 2026-10-29)
[25] KITP Yang–Mills working group statement — https://www.kitp.ucsb.edu/sites/default/files/YM_working_group.pdf (published 2026-10, accessed 2026-10-29)
[26] Scientific American, "Dueling proofs from OpenAI and Anthropic astound scientists" — https://www.scientificamerican.com/article/dueling-proofs-from-openai-and-anthropic-astound-scientists/ (published 2026-10-27, accessed 2026-10-29)
[27] Douglas, Nat. Rev. Phys. 8, 86–97 — https://www.nature.com/articles/s42254-025-00909-2 (published 2026-01-12, accessed 2026-10-29)
[28] Faizal–Shabir, arXiv:2606.19362 — https://arxiv.org/abs/2606.19362 (published 2026-06-09, accessed 2026-10-29)
[29] Jacobsen, arXiv:2506.00284 (withdrawn) — https://arxiv.org/abs/2506.00284 (published 2025-05-30, accessed 2026-10-29)
[30] Nissim, arXiv:2510.22788 — https://arxiv.org/abs/2510.22788 (published 2025-10-26, accessed 2026-10-29)
[31] Cao–Nissim–Sheffield, arXiv:2509.04688 — https://arxiv.org/abs/2509.04688 (published 2025-09-04, accessed 2026-10-29)
[32] Faria da Veiga–O'Carroll, arXiv:2509.03513 — https://arxiv.org/abs/2509.03513 (published 2025-09-03, accessed 2026-10-29)
[33] Nair, arXiv:2608.10133 — https://arxiv.org/abs/2608.10133 (published 2026-08-10, accessed 2026-10-29)
[34] Baez–Dolan, arXiv:q-alg/9503002 — https://arxiv.org/abs/q-alg/9503002 (published 1995-03-05, accessed 2026-10-29)
[35] Lurie, arXiv:0905.0465 — https://arxiv.org/abs/0905.0465 (published 2009-05-04, accessed 2026-10-29)
[36] Topological quantum field theory (nLab) — https://ncatlab.org/nlab/show/topological+quantum+field+theory (accessed 2026-10-29)
[37] Butterfield–Isham, arXiv:quant-ph/9803055 — https://arxiv.org/abs/quant-ph/9803055 (published 1998-03-20, accessed 2026-10-29)
[38] Isham–Döring, arXiv:quant-ph/0703060 — https://arxiv.org/abs/quant-ph/0703060 (published 2007-03-07, accessed 2026-10-29)
[39] Isham, arXiv:1004.3564 — https://arxiv.org/abs/1004.3564 (published 2010-04-20, accessed 2026-10-29)
[40] Wilson–Hefford–Hoffreumon, arXiv:2602.23865 — https://arxiv.org/abs/2602.23865 (published 2026-02-27, accessed 2026-10-29)
[41] Hefford–Wilson, arXiv:2402.02997 — https://arxiv.org/abs/2402.02997 (published 2024-02-05, accessed 2026-10-29)
[42] Gelfand–Naimark theorem (nLab) — https://ncatlab.org/nlab/show/Gelfand-Naimark+theorem (accessed 2026-10-29)
[43] Gelfand duality (nLab) — https://ncatlab.org/nlab/show/Gelfand+duality (accessed 2026-10-29)
[44] Stone duality (nLab) — https://ncatlab.org/nlab/show/Stone+duality (accessed 2026-10-29)
[45] Ryu–Takayanagi, arXiv:hep-th/0603001 — https://arxiv.org/abs/hep-th/0603001 (published 2006-02-28, accessed 2026-10-29)
[46] Dong–Harlow–Wall, arXiv:1601.05416 — https://arxiv.org/abs/1601.05416 (published 2016-01-20, accessed 2026-10-29)
[47] Bao–Nezami–Ooguri–Stoica–Sully–Walter, arXiv:1505.07839 — https://arxiv.org/abs/1505.07839 (published 2015-05-28, accessed 2026-10-29)
[48] Pastawski–Yoshida–Harlow–Preskill, arXiv:1503.06237 — https://arxiv.org/abs/1503.06237 (published 2015-03-20, accessed 2026-10-29)
[49] Van Raamsdonk, arXiv:1005.3035 — https://arxiv.org/abs/1005.3035 (published 2010-05-17, accessed 2026-10-29)
[50] Minguzzi–Sánchez, arXiv:gr-qc/0609119 — https://arxiv.org/abs/gr-qc/0609119 (published 2006-09-26, accessed 2026-10-29)
[51] Galaev, arXiv:1611.01551 — https://arxiv.org/abs/1611.01551 (published 2016-11-04, accessed 2026-10-29)
[52] Petz–Sudar, arXiv:quant-ph/0102132 — https://arxiv.org/abs/quant-ph/0102132 (published 2001-02-27, accessed 2026-10-29)
[53] Adyan–Rabin theorem — https://en.wikipedia.org/wiki/Adian%E2%80%93Rabin_theorem (accessed 2026-10-29)
[54] Tancer, arXiv:2310.07421 — https://arxiv.org/abs/2310.07421 (published 2023-10-11, accessed 2026-10-29)
[55] Bekkert–Drozd, arXiv:math/0310352 — https://arxiv.org/abs/math/0310352 (published 2003-10-22, accessed 2026-10-29)
[56] Buchweitz–Leuschke, arXiv:math/0505315 — https://arxiv.org/abs/math/0505315 (published 2005-05-15, accessed 2026-10-29)
[57] Grochow–Qiao, arXiv:1507.01917 — https://arxiv.org/abs/1507.01917 (published 2015-07-07, accessed 2026-10-29)
[58] Grevstad–May, arXiv:2509.17604 — https://arxiv.org/abs/2509.17604 (published 2025-09-22, accessed 2026-10-29)
[59] Sasyk–Tørnquist, arXiv:0909.2657 — https://arxiv.org/abs/0909.2657 (published 2009-09-14, accessed 2026-10-29)
[60] Geometrization conjecture — https://en.wikipedia.org/wiki/Geometrization_conjecture (accessed 2026-10-29)
[61] Unknotting problem — https://en.wikipedia.org/wiki/Unknotting_problem (accessed 2026-10-29)
