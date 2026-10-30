# Theorem Registry — CMRPS

**Program:** CMRPS, a 12-volume series by the YonedaAI Collaboration (PI Matthew Long).
**Status date:** 2026-10-29.
**Role:** single registry of theorem-level claims across the twelve volumes. Definitions live in `docs/ontology.md` (DEF-…); the dependency graph lives in `docs/research-map.md` §4. Citation convention: bracketed numbers resolve to the Sources list of `research/cmrps-research-map/REPORT.md`.

---

## 1. Claim-status labels

Exactly six labels exist. Every theorem record carries exactly one.

| Label | Exact meaning |
|---|---|
| **machine-checked** | A complete formalization exists and has been accepted by a clean kernel-checked Lean build, with the build archived. Nothing else qualifies. A claimed-but-unreleased formalization does **not** qualify [24]. The phrase "Haskell verified by Lean" is prohibited: it is not a status, and no record may be labeled on its basis. Announcing a formalization, describing a formalization, or partially checking a formalization are all outside this label. |
| **complete-informal-proof** | A complete proof exists in the mathematical literature and is accepted by the relevant community; the record cites the literature. Not machine-checked. Completion announcements that were premature (as with CFSG before 2004 [1][2]) do not qualify until the proof is complete. |
| **conditional** | The statement is proved from hypotheses recorded explicitly in the Dependencies field. If any hypothesis is itself unproved (a conjecture, an axiom list in flux [15], Haag duality [16]), the record stays *conditional* and names it. |
| **conjecture** | A precise statement for which no complete proof is known. Not evidence-backed progress toward proof; a conjecture is a conjecture even when widely believed. |
| **computational-evidence** | Support from computation, enumeration, numerical experiment, or computer-assisted verification that does not constitute a proof. Computational evidence is never proof and can never upgrade a record's status. |
| **open-problem** | A stated problem with neither a proof nor substantial evidence. Distinct from *conjecture*: an open problem is a question, not an asserted statement. |

**Claim ladder (for announced results).** For results that are not yet theorems the ladder of the research brief governs: announced ≠ manuscript ≠ machine-checked ≠ independently verified ≠ accepted. Announced results are recorded in the claims ledger (§5), never among theorem records.

## 2. Theorem-record format

```
T-ID          stable identifier (T-BG-nn background; T-OB-nn obstructions;
              T-OP-nn open problems; T-CMRPS-nn program conjectures;
              T-QFT-nn constructive-QFT claims)
Statement     the mathematical statement, in one or two sentences
Status        one of the six labels
Dependencies  DEF-… identifiers, T-… identifiers, and named hypotheses
Volume(s)     the CMRPS volumes where the record is used or established
Lean module   the module path of the formalization when (and only when) one exists;
              otherwise "—". No module names are asserted without a build.
Sources       [n] references resolving to REPORT.md; founding-document citations
```

## 3. Cross-volume dependency record format

Each permitted use of a record in one volume as input to another is logged as:

```
DEP-ID        stable identifier (DEP-001, …)
From          T-ID supplying the result
To            volume (or T-ID) consuming it
Condition     "direct" (record is complete-informal-proof or machine-checked) or
              "as hypothesis" (record is conjecture/conditional/open; must be
              declared in the consumer's Dependencies field)
Rule          the constraint enforcing the graph of docs/research-map.md §4
```

Initial records:

| DEP-ID | From | To | Condition | Rule |
|---|---|---|---|---|
| DEP-001 | T-BG-06 (finite-dim C* decomposition) | vol-03, vol-06 | direct | vol-03's first concrete theorem model; the decomposition is by dimension vector [9] |
| DEP-002 | T-BG-04, T-BG-05 (Darboux, Weinstein) | vol-05 | direct | classification content on the symplectic side is global/topological, not local [6][7] |
| DEP-003 | T-BG-09, T-BG-10 (DR, Deligne) | vol-06, vol-07 | direct, under DHR hypotheses | records used with their hypotheses declared: symmetric structure, conjugates, End(1)=C [12][13][16] |
| DEP-004 | T-CMRPS-01 | vol-11, vol-12 | as hypothesis only | the conjecture may never be a lemma; obligation-by-obstruction study only |
| DEP-005 | T-OP-03 (4D mass gap) | vol-07 | as hypothesis / open problem | never conflated with existence claims [23][26] |
| DEP-006 | T-OB-01 (McDuff) | vol-06, vol-11 | direct | forbids global factor classification from entering any volume as a dependency [8] |
| DEP-007 | T-OB-02 (Etingof–Gelaki) | vol-04, vol-10 | direct | any equivalence record must declare the preserved structure [12] |
| DEP-008 | T-BG-14 (Chentsov) | vol-09, vol-10 | direct | quantum monotone metrics are parametric, not unique [52]; uniqueness may not be extended by dependency |

## 4. Seed entries — background classification theorems

All records in this section are literature results. Status **complete-informal-proof** unless noted; none is machine-checked within the CMRPS formal library (Lean module field therefore reads "—" for all; the field will be populated only where a clean build exists).

| T-ID | Statement | Status | Dependencies | Volume(s) | Lean module | Sources |
|---|---|---|---|---|---|---|
| T-BG-01 | Classification of finite simple groups: every finite simple group is cyclic of prime order, alternating of degree ≥ 5, one of 16 infinite Lie-type families, or one of 26 sporadic groups (27 counting Tits). No uniform parameterization analogous to Dynkin diagrams is known. | complete-informal-proof | — | vol-02, vol-11, vol-12 | — | [1][2][3] |
| T-BG-02 | Killing–Cartan classification: complex semisimple Lie algebras by Dynkin diagrams (A_r, B_r, C_r, D_r; G2, F4, E6, E7, E8); real simple algebras by Satake diagrams; real forms are order-≤2 automorphism classes; groups via central quotients. | complete-informal-proof | — | vol-02, vol-05, vol-07 | — | [4] |
| T-BG-03 | Highest-weight theorem: finite-dimensional irreps of a complex semisimple Lie algebra are in bijection with dominant integral weights; existence is the hard part. | complete-informal-proof | T-BG-02 | vol-02, vol-06, vol-07 | — | [5] |
| T-BG-04 | Darboux's theorem: any two symplectic manifolds of the same dimension are locally symplectomorphic; symplectic geometry has no local invariants. | complete-informal-proof | — | vol-02, vol-05 | — | [6] |
| T-BG-05 | Weinstein splitting: near a rank-2k point a Poisson manifold splits as symplectic × transverse Poisson; symplectic leaves foliate globally; KKS leaves on g* are coadjoint orbits. | complete-informal-proof | — | vol-02, vol-05 | — | [7] |
| T-BG-06 | Finite-dimensional complex C*-algebras: A ≅ ⊕_{i=1}^{k} M_{n_i}(C); the multiset of matrix sizes (dimension vector) determines A up to *-isomorphism. | complete-informal-proof | — | vol-03, vol-06 | — | [9] |
| T-BG-07 | Amenable (hyperfinite/AFD/injective) factors are classified: unique factors of types I_n, I_∞, II₁, II_∞, III_λ (0<λ≤1), III₀ = ergodic flows. Murray–von Neumann 1943 (I, II₁); Connes 1976 for the rest; Haagerup completing III₁. | complete-informal-proof | — | vol-06 | — | [8] |
| T-BG-08 | Principal bundles: GBund(X)₀ ≅ π₀ Top(X, BG) via the Milnor join construction; characteristic classes are exactly pullbacks of universal classes in H*(BG). | complete-informal-proof | — | vol-02, vol-07 | — | [17][18] |
| T-BG-09 | Doplicher–Roberts reconstruction: any symmetric tensor *-category with conjugates, direct sums, subobjects, End(1)=C is equivalent to finite-dimensional unitary representations of a compact supergroup, unique up to isomorphism. | complete-informal-proof | hypotheses of the statement (symmetric structure etc.) | vol-06, vol-07 | — | [12][16] |
| T-BG-10 | Deligne's theorem: characteristic-zero symmetric tensor categories with subexponential growth are supergroup representation categories. | complete-informal-proof | hypotheses of the statement | vol-06, vol-07 | — | [13] |
| T-BG-11 | Lorentzian holonomy classification: connected holonomy groups of Lorentzian manifolds in signature (1,n−1) are fully classified (Berger-list analogue), with realizing metrics constructed. | complete-informal-proof | — | vol-02, vol-08 | — | [51] |
| T-BG-12 | The causal ladder of spacetimes is complete. | complete-informal-proof | — | vol-08 | — | [50] |
| T-BG-13 | Holographic entropy cone, ≤4 regions: strong subadditivity + monogamy of mutual information give the complete RT inequality set for 2, 3, 4 boundary regions. | complete-informal-proof | — | vol-08 | — | [47] |
| T-BG-14 | Chentsov's theorem: the Fisher metric is the unique (up to constant) metric monotone under stochastic maps. | complete-informal-proof | — | vol-05, vol-09, vol-10 | — | [52] |

**Companion records used as constraints elsewhere in the series:**

| T-ID | Statement | Status | Dependencies | Volume(s) | Lean module | Sources |
|---|---|---|---|---|---|---|
| T-BG-15 | Stinespring dilation: completely positive maps are classified up to minimal dilation, unique up to unitary; Choi/Kraus form is a normal form with Kraus rank an invariant. | complete-informal-proof (normal form, not isomorphism classification) | — | vol-03, vol-06 | — | [10][11] |
| T-BG-16 | Gelfand–Naimark: every C*-algebra embeds in B(H); the commutative case is fully classified (Gelfand representation). Gelfand duality reconstructs compact Hausdorff spaces from commutative C*-algebras; Stone duality reconstructs spectra from Boolean algebras. | complete-informal-proof (representation/reconstruction, not classification) | — | vol-03, vol-04, vol-08 | — | [42][43][44] |
| T-BG-17 | Geometrization: closed 3-manifolds decompose into exactly 8 Thurston geometries (Perelman 2003). | complete-informal-proof | — | vol-08, vol-11 | — | [60] |
| T-BG-18 | Petz–Sudar: all quantum monotone metrics are classified by operator monotone functions — a parametric classification, not a finite list; quantum uniqueness fails. | complete-informal-proof | T-BG-14 (for the contrast) | vol-06, vol-09, vol-10 | — | [52] |
| T-BG-19 | Categorical supermaps are concretely representable whenever the theory has suitable channel–state duality (2024–2026); Yoneda representability underlies factorisation theorems for quantum supermaps. | complete-informal-proof (in the stated settings) | hypotheses of the statement | vol-04 | — | [40][41] |
| T-BG-20 | Entanglement-wedge bulk reconstruction is a quantum-information theorem (Dong–Harlow–Wall 2016). | complete-informal-proof | hypotheses of the statement | vol-08, vol-09 | — | [46] |

## 5. Obstruction records

These are theorems. They register where no classification can exist in the stated generality; they are first-class series content, not caveats.

| T-ID | Statement | Status | Dependencies | Volume(s) | Lean module | Sources |
|---|---|---|---|---|---|---|
| T-OB-01 | McDuff (1969): there are uncountably many non-isomorphic separable type II₁ factors. A total classification of factors outside the amenable case is impossible. | complete-informal-proof | T-BG-07 (for the amenable contrast) | vol-06, vol-11 | — | [8] |
| T-OB-02 | Etingof–Gelaki isocategorical groups: non-isomorphic finite groups with equivalent representation categories as plain tensor categories. Tensor-category equivalence without symmetric structure does not recover the group. | complete-informal-proof | — | vol-04, vol-10, vol-11 | — | [12] |
| T-OB-03 | Adyan–Rabin: every Markov property of finitely presentable groups is algorithmically undecidable, including finiteness and simplicity (Collins 1969 extends undecidability beyond Markov properties). | complete-informal-proof | — | vol-11 | — | [53] |
| T-OB-04 | Wildness: every finite-dimensional algebra over an algebraically closed field is derived-tame or derived-wild, wildness degeneration-robust [55]; the generic determinant's Cohen–Macaulay representation theory is "quite wild" — rank-2 isomorphism classes are not parametrizable by a finite-dimensional variety [56]; no meaningful classification of compact C_p-equivariant HF_p-modules exists at odd primes [58]. | complete-informal-proof | — | vol-03, vol-11 | — | [55][56][58] |
| T-OB-05 | Tancer: #₉(S²×S²) homeomorphism is algorithmically unrecognizable (improving Gordon's #₁₂); 4-manifold unrecognizability sets a sharp dimension frontier against the 8-geometry picture in dimension 3. | complete-informal-proof | T-BG-17 (for the contrast) | vol-08, vol-11 | — | [54][60] |
| T-OB-06 | Sasyk–Tørnquist: von Neumann algebra isomorphism admits no classification by countable invariants (Borel reducibility; Hjorth turbulence). | complete-informal-proof (announcement-level in the survey) | — | vol-11 | — | [59] |
| T-OB-07 | Grochow–Qiao: group isomorphism is polynomial-time for tame extensions; the needed bounds fail in the wild case. Tame/wild is an algorithmic tractability boundary. | complete-informal-proof | T-OB-04 (wildness) | vol-11 | — | [57] |

## 6. Open problems

| T-ID | Statement | Status | Dependencies | Volume(s) | Lean module | Sources |
|---|---|---|---|---|---|---|
| T-OP-01 | Fusion categories: every fusion category is Rep of a weak Hopf algebra (Ostrik), but the ENO pivotal-structure conjecture (Annals 162, 2005) is open. | open-problem | — | vol-06 | — | [14] |
| T-OP-02 | Elliott classification of separable simple nuclear C*-algebras (and the UCT) is an unfinished program. | open-problem | — | vol-06, vol-11 | — | [9] |
| T-OP-03 | Yang–Mills mass gap: a positive mass gap for 4D YM is open; Clay lists the problem Unsolved — "no proof of this property is known." | open-problem | — | vol-07 | — | [23][25] |
| T-OP-04 | Holographic entropy cone for n ≥ 5: for fixed n finitely many independent inequalities exist, but only one infinite family is known. | open-problem | T-BG-13 | vol-08 | — | [47] |
| T-OP-05 | Lurie proof gap: the 2009 classification of extended TQFTs is an "informal sketch of a proof"; the exact range of completed cases is unverified. | open-problem (recorded as such rather than downgrading the claim to a label it does not support) | — (claim only; no proved dependencies) | vol-02, vol-07, vol-12 | — | [35] |
| T-OP-06 | Type-III factors: stratified only coarsely by the Connes spectrum; fundamental groups vary (countable for property-(T) group algebras; trivial examples exist). | open-problem | T-BG-07 | vol-06 | — | [8] |
| T-OP-07 | Freed–Hopkins anomaly classification: the cobordism-spectrum statement was not retrieved in the survey; a primary source is needed. | open-problem | T-BG-08 (anomaly obstructions [19]) | vol-07 | — | [19] context |

## 7. The CMRPS conjecture

**T-CMRPS-01 — Structural Classification of Admissible Physical Systems.**

*Statement.* Let Phys_adm be a suitably defined category of mathematically admissible physical systems satisfying explicitly stated consistency conditions (DEF-019, DEF-020). There exists a collection of fundamental structural families 𝔉 = {𝔉_α}_{α∈A} (DEF-025) and a set of admissible constructions 𝔆 (DEF-023) such that
Phys_adm ≃ ⟨𝔉_α⟩_𝔆
(Founding Document §6; DEF-041), the right side denoting closure under the specified constructions.

*Status:* **conjecture.**

*Dependencies:* DEF-001, DEF-015, DEF-017, DEF-019, DEF-020, DEF-021–025, DEF-041. Requires the five obligations below; none is proved.

*Volume(s):* the organizing conjecture of vol-01 through vol-12; studied directly in vol-11; assembled in vol-12.

*Lean module:* —.

*Sources:* Founding Document §3, §4, §6; the periodic-table restatement (Universal Structural Classification Conjecture, Founding Document 02) is the same claim.

*The five proof obligations* (Founding Document §6):

| Obligation | Content | Status |
|---|---|---|
| 1. Completeness | Every admissible physical system is represented in ⟨𝔉⟩_𝔆. | open |
| 2. Soundness | Every generated structure satisfies the stipulated admissibility conditions. | open |
| 3. Equivalence | Different representations of the same physical system are identified correctly (≃ chosen and justified; DEF-015, DEF-017, DEF-018). | open |
| 4. Structural characterization | The fundamental families have precise mathematical definitions. | partial: the ten candidate families are named (DEF-026–035) but the admissibility conditions are unfixed (DEF-020) |
| 5. Decomposition | Systems in the targeted classes can be constructed from the fundamental families. | open in general; proved only in restricted domains (T-BG-06, T-BG-07, T-BG-09) |

*Standing constraints on the record.* The theorem would be meaningful only after the underlying definitions and admissibility axioms are made precise (Founding Document §6). Interacting systems need not admit unique decompositions (DEF-022) [Founding Document §3]. Obligation 3 is constrained by T-OB-02. The conjecture may enter other records only as a declared hypothesis (DEP-004).

**T-CMRPS-02 — Universal Structural Classification Conjecture (periodic-table form).** Every admissible mathematical representation of a physical system belongs, up to a specified notion of equivalence, to a class generated by an explicitly characterized collection of fundamental structural families and admissible constructions. *Status: conjecture.* This is the same claim as T-CMRPS-01 in the notation of Founding Document 02; both forms are registered so that no volume treats them as two independent statements.

## 8. Claims ledger (announced results, not theorem records)

| ID | Claim | Ladder position (2026-10-29) | Registered as | Sources |
|---|---|---|---|---|
| CL-01 | OpenAI 2026-10-26: rigorous existence of QCD, a simplest GUT completion, and pure Yang–Mills as subproblem, Balaban-based | announced + unpublished manuscript (1147 pages) + claimed Lean formalization withheld + verification pending (KITP committee) | **not** machine-checked; **not** complete-informal-proof; existence of the theory and the mass gap are separate questions | [24][25][26] |
| CL-02 | Faizal–Shabir: reflection-positive construction of 4D SU(N) YM with mass gap, confinement, OS reconstruction | journal-published, unverified; not treated by community or Clay as solving the problem | claims ledger only | [28] |
| CL-03 | Jacobsen, arXiv:2506.00284 (existence + mass gap via 5D orbifold regulator) | withdrawn by arXiv administrators for quality standards | closed; carries no status | [29] |
| CL-04 | Lattice YM theorems: mass gap + infinite-volume limit for U(N) in the 't Hooft regime [30]; Wilson area law in the 't Hooft regime [31]; partial 4D lattice SU(N) results [32] | rigorous theorems, regime-restricted | registerable as complete-informal-proof *within their stated regimes*; they do not touch continuum 4D existence or continuum mass gap | [30][31][32] |
| CL-05 | Nair: 3D mass-gap proof outline via Laplacian eigenvalue inequality | 11-page preprint outline, 3d only | outline; no status | [33] |

**Rule.** Never conflate existence with mass gap [23][26]. No record in this registry may cite the withheld Lean formalization of CL-01 as machine-checked [24]. The Clay problem remains Unsolved [23].
