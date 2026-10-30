# Research Map — The Classification of Mathematical Representations of Physical Systems (CMRPS)

**Program:** CMRPS, a 12-volume series by the YonedaAI Collaboration (PI Matthew Long).
**Status date:** 2026-10-29.
**Citation convention:** bracketed numbers, e.g. [47], resolve to the Sources list of `research/cmrps-research-map/REPORT.md`. Claims drawn from the founding documents are cited as (Founding Document, §n) or (YonedaAI Summary). Inferences beyond those sources are marked *conjectural* or *open*.

---

## 1. Established classification theorems by domain

The table below is the comparison spine of the field survey [1]–[61], expanded to record, for each domain, what is actually classified and by which invariants. Status vocabulary follows the theorem registry (`docs/theorem-registry.md`): a domain is *complete* only where a classification theorem with a completeness statement exists; *impossible* where a theorem proves that no classification of the stated generality can exist.

| Domain | What is classified (objects, up to what) | Classifying invariants | Status | Sources |
|---|---|---|---|---|
| Finite simple groups | Finite simple groups, up to isomorphism (families + sporadics: cyclic of prime order, alternating of degree ≥ 5, 16 infinite Lie-type families, and 26 sporadic groups — 27 counting Tits) | order, character table, Schur multiplier, Out(G) in the ATLAS companion; no uniform parameterization known | Complete; parameterization open | [1][2][3] |
| Simple Lie groups / Lie algebras | Complex semisimple Lie algebras up to isomorphism; real simple algebras up to isomorphism; groups via central quotients | Dynkin diagrams (A_r, B_r, C_r, D_r; G2, F4, E6, E7, E8); Satake diagrams for real forms; real forms = order-≤2 automorphism classes | Complete | [4] |
| Irreps of semisimple Lie algebras | Finite-dimensional irreducible representations up to isomorphism | dominant integral weights (existence is the hard part of the three-part proof) | Complete | [5] |
| Symplectic manifolds (local) | Local symplectic germs up to symplectomorphism | none: Darboux normal form — symplectic geometry has no local invariants | Complete (trivially local) | [6] |
| Poisson manifolds (local) | Local Poisson models near a rank-2k point; global leaf structure | Weinstein splitting (symplectic × transverse Poisson); symplectic-leaf foliation; coadjoint orbits for KKS structures on g* | Complete local models | [7] |
| Finite-dimensional C*-algebras | Unital finite-dimensional complex C*-algebras up to *-isomorphism: A ≅ ⊕_{i=1}^{k} M_{n_i}(C) | the dimension vector (n_1, …, n_k), i.e. the multiset of matrix sizes | Complete | [9] |
| Amenable (hyperfinite/AFD/injective) factors | Factors of types I_n, I_∞, II₁, II_∞, III_λ (0<λ≤1), III₀, up to isomorphism | Murray–von Neumann type; Connes invariants; type III₀ = ergodic flows; Haagerup completed III₁ | Complete | [8] |
| General II₁ / III factors | — | coarse Connes-spectrum strata only | Impossible globally: uncountably many separable II₁ factors (McDuff 1969) | [8] |
| Quantum channels | Completely positive maps up to minimal Stinespring dilation (unique up to unitary); Choi/Kraus normal form | Kraus rank (Kraus index N ≤ nm) | Normal form only, not an isomorphism classification | [10][11] |
| Principal G-bundles | Principal G-bundles over X up to isomorphism: GBund(X)₀ ≅ π₀ Top(X, BG) | [X, BG]; characteristic classes = pullbacks of universal classes in H*(BG) (Stiefel–Whitney, Pontryagin, Euler, Chern; Dixmier–Douady for gerbes) | Complete | [17][18] |
| Anomalies | — (classified as obstructions) | non-trivializability of the determinant/Pfaffian line of the Dirac/Fredholm operator; gauge anomaly = H¹(CE(P)) ⊕ H²(CE(P)); quantization exists only when both vanish | Complete as obstruction classification | [19] |
| DHR superselection sectors | Representations satisfying DHR criteria, up to equivalence: symmetric tensor *-categories with conjugates, direct sums, subobjects, End(1)=C | equivalence to finite-dimensional unitary representations of a compact supergroup, unique up to isomorphism (DR reconstruction) | Complete (under the DHR/Haag-duality hypotheses) | [12][16] |
| Symmetric tensor categories (char 0, subexponential growth) | Such categories up to equivalence | supergroup representation categories (Deligne 2002) | Complete within stated hypotheses | [13] |
| Fusion categories | — | every fusion category is Rep of a weak Hopf algebra (Ostrik); ENO pivotal-structure conjecture open | Open | [14] |
| Extended TQFTs | n-dimensional unitary extended TQFTs, proposed as weak n-functors out of the free stable weak n-category with duals | fully dualizable objects (cobordism hypothesis, Baez–Dolan 1995; Lurie 2009) | Claimed; the 2009 proof is an "informal sketch of a proof" | [34][35] |
| Lorentzian holonomy groups | Connected holonomy groups of Lorentzian manifolds in signature (1,n−1), with realizing metrics constructed | Berger-list analogue in Lorentzian signature | Complete | [51] |
| Spacetime causality conditions | The causal hierarchy of spacetimes | the causal ladder (closed chronological → … → globally hyperbolic) | Complete | [50] |
| Holographic entropy cone, ≤4 regions | RT-inequality sets for 2, 3, 4 boundary regions | strong subadditivity + monogamy of mutual information give the complete inequality set | Complete | [47] |
| Holographic entropy cone, n ≥ 5 | — | only one infinite inequality family known; finitely many independent inequalities exist for fixed n, but the list is unknown | Open | [47] |
| Monotone metrics (classical) | Riemannian metrics monotone under stochastic maps | Fisher metric, unique up to constant (Chentsov) | Complete, unique | [52] |
| Monotone metrics (quantum) | Monotone metrics on quantum state spaces | operator monotone functions (Petz–Sudar) | Parametric classification, not a finite list | [52] |
| Emergent spacetime / RT | — | — | Conjectural; proved exactly only in AdS₃/2D CFT [45]; tensor-network toys only [48] | [45][48][49] |
| 4D YM/QCD existence | — | Balaban-program methods | Claimed, unverified: manuscript and formalization withheld | [24][25][26] |
| 4D YM mass gap | — | — | Open | [23][25] |
| 3-manifolds | Closed 3-manifolds up to homeomorphism (geometrization, Perelman 2003) | decomposition into exactly 8 Thurston geometries | Complete | [60] |
| 4-manifolds | — (restricted classes only) | Filipkiewicz: 18 + one countably infinite family of model geometries | Unrecognizable instances: #₉(S²×S²) homeomorphism undecidable | [54][60] |
| Finitely presented groups (Markov properties) | — | — | Undecidable: every Markov property, including finiteness and simplicity (Adyan–Rabin; Collins extension) | [53] |
| Wild representation categories | — | — | Non-parametrizable: rank-2 isomorphism classes of the generic determinant's Cohen–Macaulay modules admit no finite-dimensional-variety parameterization | [55][56][58] |

**What the table shows.** Classification is sharp exactly where the invariant is finite or parametric [1][4][5][6][9][17]. Three structural lessons carry directly into the series:

1. The classification and its parameterization are different achievements. CFSG is complete, yet "no one has yet found a clean uniform description of the finite simple groups" analogous to Dynkin diagrams [1]; practical identification runs through the ATLAS companion data (order, Schur multiplier, Out(G), presentations, character tables with power maps) [3].
2. Classification content can be entirely global. By Darboux's theorem the local symplectic category has *no* invariants [6], so family-I classification must be topological/global, the opposite of the Riemannian-curvature situation.
3. Non-classifiability is itself a theorem, not a matter of difficulty: McDuff [8], Adyan–Rabin [53], wildness [55][56][58], and 4-manifold unrecognizability [54] are proved results and are registered as such in `docs/theorem-registry.md`.

**Reconstruction is better developed than classification.** Gelfand–Naimark [42], Gelfand duality [43], Stone duality [44], and Doplicher–Roberts [12][15][16] recover structure from probes; a 2024–2026 line establishes representability of categorical supermaps whenever suitable channel–state duality holds [40][41]. Whether that line unifies with the Gelfand/Stone/Naimark pattern into a single Yoneda-principle account is *open* [40][41].

---

## 2. The six YonedaAI programs and their relation to the CMRPS volumes

The YonedaAI Physics Research Summary (2026-10-27) records six research programs (YonedaAI Summary). They are research directions over potentially overlapping structures, not a partition of mathematics (Founding Document 02–03); the volumes classify mathematical objects independently of which program studies them.

| Program | Mathematical approach (YonedaAI Summary) | Primary volume(s) | Relation to the classification |
|---|---|---|---|
| Yoneda Constraint | Category theory, representability, relational structure | vol-04; foundations in vol-01 | Supplies relational characterization: objects probed by Hom(−,P) (Founding Document §5). Yoneda qualification applies verbatim (see `docs/ontology.md`, DEF-017). |
| Emergent Spacetime | Information geometry, quantum entanglement, reconstruction | vol-08, vol-09 | Weighted-nerve / finite-groupoid constructions are concrete but their continuum convergence conditions are *not established* without complete proofs (YonedaAI Summary). |
| Gravity–Information–Geometry | Curvature and gravitational dynamics from informational relationships | vol-09 | Conjectural core: RT is a proposal verified exactly only in AdS₃ [45]; "entanglement builds spacetime" is an argument [49]. |
| Condensed Representation Theory | Sheaves, representations, topology, emergent physical observables | vol-02, vol-03, vol-06 | Feeds representation-level invariants; DR/Deligne reconstruction [12][13][16] is the proved template. |
| Information Geometry Correspondence | Observation functors, equivalence classes of empirically distinguishable systems | vol-10 | Formalizes observational equivalence; Chentsov [52] is the proved classical anchor, Petz–Sudar [52] the quantum reality. |
| Principia Physica | Unified mathematical foundation for spacetime, matter, quantum theory, gravity | vol-12 | Assembly layer. Physical validation of Principia Physica is not established (YonedaAI Summary). |

The proposed progression Relational Structure → Representation → Observation → Geometric Reconstruction → Physical Dynamics (Founding Document 02) is a research architecture, not a demonstrated derivation, and is marked *conjectural* wherever used.

The three levels of mathematical achievement (YonedaAI Summary) govern every volume: (1) mathematical formulation; (2) rigorous theorem; (3) physical validation. The program contains levels (1)–(2); it has not established level (3).

---

## 3. Unresolved foundational questions

All items are *open* unless stated otherwise.

1. **Definition of admissible physical systems.** There is no universally accepted mathematical definition of every possible physical system; establishing one is the first major research problem (Founding Document, preamble). The P = (X, O, D, S, C) schema is a stipulative candidate, not a settled definition.
2. **Choice of equivalence ≃.** Two mathematical descriptions may be physically equivalent without being mathematically isomorphic (Founding Document §2). The correct ≃ is load-bearing: Etingof–Gelaki isocategorical groups prove that tensor-category equivalence without symmetric structure fails to recover the group [12].
3. **Uniqueness of decomposition.** Interacting systems need not admit unique decompositions; entanglement, emergence, gauge redundancy, and interactions complicate irreducibility (Founding Document §3). Existence-and-uniqueness theorems are realistic only in restricted subclasses.
4. **Finite generation.** Whether a finite (or explicitly describable) family set generates all admissible systems is unproved (Founding Document §3–4).
5. **Whether any universal classification exists at all.** Obstruction theorems [8][53][54][56] make a CFSG-style total theorem implausible outside tame regimes; the report's synthesis is that a CMRPS-style program should expect restricted-class classification theorems plus explicit obstruction theorems — not one global periodic table (marked *conjectural* there and here).
6. **Freed–Hopkins anomaly classification.** The cobordism-spectrum statement of anomaly classification was not retrieved in the survey; a primary source is needed [19] context.
7. **Lurie proof gap.** The 2009 classification of extended TQFTs is an "informal sketch of a proof" [35]; which cases are complete (e.g. via Schommer-Pries) is unverified here.
8. **Elliott program / UCT status.** Rests on secondary summaries [9]; a primary survey is needed.
9. **Holographic entropy cone for n ≥ 5.** Only an infinite family of inequalities is known [47]; a 2026 "multi-entropy cone" preprint claiming a rational polyhedral cone is unverified and unreconciled with the Bao et al. gap.
10. **Faizal–Shabir series audit.** Where the continuum limit is actually closed versus assumed is unverified; this is the strongest journal-published mass-gap claim on record [28].
11. **OpenAI artifact release.** The KITP committee verdict and release of the 1147-page manuscript and claimed Lean formalization will decide the claim-status chapter; tracked event [24][25].
12. **Sussman–Alpöge Balaban-program derivations.** Whether the parallel LLM-assisted effort published independently is unknown [26].
13. **Coverage.** Survey discovery ran on the arXiv API plus known-URL fetches; non-arXiv venues may be under-covered.
14. **Named follow-ups.** Kirillov orbit-method scope; Jones subfactor index/ADE classification; Kerr uniqueness/stability theorems; Bohrification; the full Sasyk–Tørnquist conclusion [59]; knot-census methodology as "classification by enumeration" [61].
15. **Synthesis question (Yoneda principle).** Whether categorical-supermap representability [40][41] unifies with Gelfand/Stone/Naimark reconstruction [42][43][44] into one principle is *open*.

---

## 4. Cross-volume dependency graph

**Canonical volume titles.**

| ID | Title |
|---|---|
| vol-01 | Foundations of the Classification of Mathematical Physical Systems |
| vol-02 | Fundamental Structural Families of Mathematical Physics |
| vol-03 | Irreducibility, Decomposition, and Universal Constructions |
| vol-04 | The Yoneda Classification Principle |
| vol-05 | Classification of Classical Physical Systems |
| vol-06 | Classification of Quantum Physical Systems |
| vol-07 | Classification of Gauge Structures and Quantum Field Theories |
| vol-08 | Classification and Reconstruction of Spacetime |
| vol-09 | Gravity, Information, and Geometric Correspondence |
| vol-10 | Observational Equivalence and Physical Distinguishability |
| vol-11 | Completeness, Obstructions, and the Universal Classification Problem |
| vol-12 | Principia Physica: Toward a Unified Structural Theory of Mathematical Physics |

**Allowed dependency edges** (a volume may cite earlier volumes for definitions and for registered theorems only):

```
vol-01 ──► vol-02 ──► vol-03 ──► vol-05, vol-06 ──► vol-07, vol-08 ──► vol-09
   │                      ▲              │                │
   ├────► vol-04 ─────────┴──────────────┴──► vol-10 ─────┤
   │                                                      ▼
   └──────────────────────────────────────────────────► vol-11 ──► vol-12
```

vol-01 is the definitional root: no volume may bypass its ontology (`docs/ontology.md`). vol-12 is the synthesis sink.

**Per-volume admissible inputs and hard prohibitions.** The right-hand column states results a volume may *not* depend on. Where an unproven result must be mentioned, it is recorded as an explicit hypothesis in a conditional theorem record, never as a lemma.

| Volume | May depend on (established) | May NOT depend on (unproven / impossible) | Status of the forbidden dependency |
|---|---|---|---|
| vol-01 | Definitions only; CFSG as architectural analogy [1][2] | Any theorem of the series; any claim that a universal classification exists | Conjecture (T-CMRPS-01) |
| vol-02 | vol-01; Killing–Cartan [4]; highest weight [5]; Darboux [6]; Weinstein [7]; finite-dim C* [9]; bundles [17][18]; the ATLAS-style invariant discipline [3] | A global periodic table of all physical structures; any completeness claim for the ten families | Open / conjectural |
| vol-03 | vol-01–02; finite-dim C* decomposition A ≅ ⊕ M_{n_i}(C) [9]; DR reconstruction [12][16]; Stinespring normal form [10] | Unique decomposition of interacting systems; classification of general factors | Open (Founding Document §3); impossible [8] |
| vol-04 | vol-01; Yoneda lemma (pure mathematics); supermap representability results as stated [40][41] | Any conclusion of classification, physical equivalence, or empirical adequacy derived from Yoneda alone | Yoneda qualification (verbatim, DEF-017); also open [40][41] synthesis |
| vol-05 | vol-01–03; Darboux [6]; Weinstein splitting [7]; Chentsov [52] | An equivalence between classical and quantum families via deformation quantization; classification beyond local models and global topological invariants | Conjectural (Founding Document §4) |
| vol-06 | vol-01–03; finite-dim C* [9]; amenable factors [8]; Stinespring [10][11]; DHR/DR [12][16]; Deligne [13] | The Elliott program [9]; the ENO pivotal conjecture [14]; classification of non-amenable II₁/III factors; treatment of Kraus rank as an isomorphism invariant | Open [9][14]; impossible [8]; normal form only [10][11] |
| vol-07 | vol-01–03, vol-06; principal bundles [17][18]; anomaly obstructions [19]; Haag–Kastler/DHR frameworks [15][16]; Deligne [13] | 4D YM/QCD existence as proved; the 4D mass gap; any conflation of existence with mass gap; the withheld Lean formalization as machine-checked; the cobordism hypothesis without the proof-gap qualification | Claimed, unverified [24][25][26]; open [23][25]; claimed-withheld [24]; informal sketch [35] |
| vol-08 | vol-01–03; Lorentzian holonomy [51]; causal ladder [50]; geometrization [60]; entropy cone ≤4 [47]; entanglement-wedge reconstruction [46] | Ryu–Takayanagi as a theorem outside AdS₃ [45]; HaPPY codes as evidence for actual AdS/CFT [48]; any statement about the entropy cone for n ≥ 5 | Conjectural [45]; toy models [48]; open [47] |
| vol-09 | vol-04, vol-08; Chentsov (classical) [52]; proven reconstruction pattern [42][43][44] | "Entanglement builds spacetime" as more than an argument [49]; extension of Chentsov uniqueness to the quantum case [52]; continuum convergence of weighted-nerve constructions | Conjectural [49]; parametric, not unique [52]; not established (YonedaAI Summary) |
| vol-10 | vol-01 (≃, DEF-015–017); vol-04 (Yoneda qualification); observation-functor formalism; Etingof–Gelaki counterexample as a constraint [12] | Tensor-category equivalence without symmetric structure as a criterion of physical equivalence; any identification of mathematical isomorphism with empirical indistinguishability | Impossible [12]; open by founding-document §2 |
| vol-11 | vol-01; obstruction theorems [8][53][54][56][57][58][59]; registered results of vol-02–10 as objects of analysis | The CMRPS conjecture as true or false; any promise of a uniform classification procedure in wild or undecidable sectors | Conjecture (T-CMRPS-01); impossible [53][56][58] |
| vol-12 | vol-01–11 as registered inputs | Physical validation of Principia Physica; collapse of the three layers M, R, E into one; empirical selection as a corollary of mathematical classification | Not established (YonedaAI Summary); Founding Document §7 |

**Global rule.** No volume may carry any unproven statement as a proved dependency. Unproven statements may appear only as (a) registered conjectures, (b) hypotheses of conditional records, or (c) objects of study in vol-11. Dependency usage is recorded in the cross-volume dependency record format of `docs/theorem-registry.md`.

---

## 5. Claim-status note

**Recovered YonedaAI summary.** The YonedaAI Physics Research Summary (dated 2026-10-27), formerly missing from the workspace, was recovered on 2026-10-29 and is staged at `sources/context/yonedaai_physics_research_summary.md`. It records the six research programs of §2; the three levels of mathematical achievement (formulation, rigorous theorem, physical validation); the assessment that the program has not established full physical validation of Principia Physica; and the caution that the finite-groupoid emergent-spacetime constructions' continuum convergence conditions should not be treated as established without complete proofs.

**OpenAI Yang–Mills claim, status as of 2026-10-29.**

| Item | Status |
|---|---|
| Rigorous existence of QCD, a simplest GUT completion, and pure Yang–Mills as subproblem | **Claimed** (announcement 2026-10-26), Balaban-based [24][25][26] |
| 1147-page supporting manuscript | **Unpublished** [24] |
| Lean formalization (claimed 2026-10-16) | **Withheld — not released**; therefore not machine-checked [24] |
| Independent verification | **Pending** before a KITP working-group committee (Gross chair; Douglas, Jaffe, Klebanov, Nekrasov) [25] |
| Yang–Mills mass gap | **Open**; explicitly not claimed; "confinement and the mass gap remain very important open challenges" [25][26] |
| Clay Millennium Prize problem status | **Unsolved**; "no proof of this property is known" [23] |

**Rule: never conflate existence with mass gap** [23][26]. An existence proof alone does not resolve the Clay problem, which requires existence *and* a positive mass gap [23]. Pre-claim baseline for comparison: Douglas (Nat. Rev. Phys. 8:86–97, 2026-01-12) records that rigorous renormalization "has never been made rigorous in the needed generality" and that on the mass gap "no clear path is known" [27]; the October 2026 claim postdates this survey, contradicts its existence-side pessimism, and confirms its mass-gap-side assessment [24][25].

Rival lower-rung claims on record: a journal-published but unverified reflection-positive construction claiming mass gap and confinement [28]; a withdrawn preprint (arXiv:2506.00284, withdrawn for quality standards) [29]; rigorous lattice theorems in restricted regimes (U(N) 't Hooft regime mass gap and infinite-volume limit [30]; Wilson area law in the 't Hooft regime [31]; partial 4D lattice SU(N) results [32]) that do not touch continuum 4D existence or continuum mass gap; a 3-dimensional mass-gap proof outline [33]. None of these alters the Clay status [23].

**Citation rule for vol-07.** Any mention of the OpenAI work must read "existence claimed; manuscript and formalization withheld; verification pending" [24][25]. The release of the artifacts is a tracked event that will move the claim from withheld to publicly checkable; until then it is registered under the claims ledger of `docs/theorem-registry.md`, not among theorems.
