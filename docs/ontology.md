# Common Mathematical Ontology — CMRPS

**Program:** CMRPS, a 12-volume series by the YonedaAI Collaboration (PI Matthew Long).
**Status date:** 2026-10-29.
**Role:** this file is the shared definitional substrate of all twelve volumes. Every definition carries a stable identifier (DEF-001, DEF-002, …) and an honest status. Volumes may refine or extend these definitions only by appending new DEF identifiers, never by silently changing existing ones.

**Status vocabulary for definitions.** *Stipulative* — fixed by the founding documents as a proposal, not settled mathematics. *Established* — standard mathematics, cited. *Conjectural* — proposed relationship or property not proved. *Open* — a question the definition raises that is unresolved. *Impossible* — a theorem forbids the property one might hope for.

**Citation convention.** Bracketed numbers resolve to the Sources list of `research/cmrps-research-map/REPORT.md`. Founding-document references are to `context/classify-physical-systems/01-…` (the founding document, cited by section) and to the YonedaAI Physics Research Summary (`sources/context/yonedaai_physics_research_summary.md`, cited as YonedaAI Summary).

---

## 1. The category Phys

**DEF-001 — Category Phys.** The category whose objects are mathematically specified representations of physical systems and whose morphisms are admissible relationships between them. *Status: stipulative* (Founding Document §2). The founding text introduces Phys as a proposed category; a universally accepted mathematical definition of every possible physical system does not yet exist, and establishing one is the first major research problem of the program.

**DEF-002 — Object.** An object of Phys is a tuple
P = (X, 𝒪, 𝒟, 𝒮, 𝒞)
comprising a state space or geometric structure, an observable algebra or collection, dynamical laws, symmetries and constraints, and composition/interaction rules. *Status: stipulative* (Founding Document §2). The five components are the canonical coordinate record of a representation; they need not be independent, and the schema is a candidate definition, not a theorem.

**DEF-003 — State space X.** The underlying state space or geometric structure of P. *Status: stipulative*. Instances range over symplectic manifolds [6][7], Hilbert spaces [9], probability spaces, smooth manifolds [50][51], and lattice configurations, among others.

**DEF-004 — Observables 𝒪.** The algebra or collection of observables of P. *Status: stipulative*. Standard instances: function algebras on symplectic manifolds, C*-algebras [9], von Neumann algebras [8], sheaf-theoretic observable atlases.

**DEF-005 — Dynamics 𝒟.** The dynamical laws of P: Hamiltonian/vector-field data, operator semigroups, flows, or evolution functors. *Status: stipulative*.

**DEF-006 — Symmetries and constraints 𝒮.** The symmetry data of P: group or groupoid actions, gauge constraints, constraint surfaces. *Status: stipulative*. Lie-theoretic classification of the symmetry layer is available in the semisimple case [4][5].

**DEF-007 — Composition and interaction rules 𝒞.** The data specifying how P composes with other systems: tensor products, coupling terms, interfacing rules. *Status: stipulative*. It is 𝒞 that fixes the meaning of irreducibility (DEF-020).

## 2. Morphisms

**DEF-008 — Morphism.** A morphism f : P₁ → P₂ of Phys is an admissible relationship between physical systems. *Status: stipulative* (Founding Document §2). Examples named in the founding document: coarse-graining, exact equivalences, embeddings, dualities, and certain limiting procedures. These are not automatically compatible as ordinary categorical morphisms; their domains, preservation laws, and composition rules must be specified, potentially using several related categories or a higher category. *Status of the one-category assumption: open* (Founding Document §2).

**DEF-009 — Coarse-graining.** A morphism that forgets microscopic detail while preserving macroscopic observables. *Status: stipulative*. Preservation law to be fixed per application: which observables of P₂ lift to P₁, and which states are identified.

**DEF-010 — Equivalence morphism.** An invertible morphism representing exact equivalence of representations. *Status: stipulative*. The corresponding relation on objects is DEF-015.

**DEF-011 — Embedding.** A morphism realizing P₁ as a subsystem, subtheory, or sub-structure of P₂. *Status: stipulative*. Example in the literature: Gelfand–Naimark embeds every C*-algebra in B(H) [42] — a representation theorem, not a classification [9].

**DEF-012 — Duality.** A morphism, generally invertible only after passage to an appropriate opposite or dual category, that exchanges structure between differently presented theories. *Status: stipulative*. Proven instances and their scope limits are listed in `docs/periodic-table.md`, Table D. A duality must state which structure it preserves; see DEF-018 (the Etingof–Gelaki constraint).

**DEF-013 — Limiting procedure.** A morphism arising from a limit or colimit process: thermodynamic limit, infinite-volume limit, semiclassical limit, continuum limit. *Status: stipulative*. Continuum limits in constructive QFT are the load-bearing case: lattice theorems in restricted regimes [30][31][32] do not by themselves close the continuum limit.

**DEF-014 — Preservation law.** The explicitly stated conditions a morphism of a given kind must satisfy, and the composition rule under which two such morphisms compose. *Status: open* (Founding Document §2). Until fixed, Phys is a schema, not a category; volumes that use Phys must state which morphism classes are in force.

## 3. Equivalence

**DEF-015 — Physical equivalence ≃.** A carefully chosen equivalence relation on Ob(Phys); the classification problem is Classify(Ob(Phys)/≃). *Status: stipulative; the choice is open* (Founding Document §2). "The choice of equivalence is essential. Two mathematical descriptions may be physically equivalent without being mathematically isomorphic." Dual theories may describe the same observable physics through very different mathematical structures.

**DEF-016 — Mathematical equivalence.** Isomorphism of representations in the mathematical sense (isomorphism of the tuples P = (X, 𝒪, 𝒟, 𝒮, 𝒞) in the ambient category of each component). *Status: established* as a notion; strictly finer than physical equivalence in general (DEF-015).

**DEF-017 — The Yoneda qualification.** The constraint governing all Yoneda-based arguments in the series, quoted verbatim from the founding document (§5): **"Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem."** *Status: stipulative as a governing constraint; binding on every volume.* The Yoneda embedding P ↦ Hom_Phys(−, P) (DEF-034) is a faithful mathematical representation of objects of a locally small Phys; the physical interpretation of the categorical structure must be established separately (Founding Document §5).

**DEF-018 — Structure-preserving requirement on equivalences (Etingof–Gelaki constraint).** Any equivalence used to identify systems must state which layer of structure it preserves; equivalences that forget the monoidal/symmetric layer are provably insufficient. *Status: established as a negative theorem*: non-isomorphic finite groups can have equivalent representation categories as plain tensor categories (isocategorical groups) [12]; any CMRPS classification that forgets the symmetric structure is false.

## 4. Admissibility

**DEF-019 — Admissible physical system.** An object P of Phys satisfying explicitly stated consistency conditions; the full subcategory of such objects is Phys_adm. *Status: stipulative* (Founding Document §6). The founding conjecture is stated over Phys_adm, "a suitably defined category of mathematically admissible physical systems satisfying explicitly stated consistency conditions." Candidate conditions include: internal consistency of the five components of DEF-002; closure of the observable algebra under the stated operations; existence of a well-posed dynamics; compatibility of symmetries with composition.

**DEF-020 — Admissibility conditions.** The explicit list of consistency conditions defining Phys_adm. *Status: open* — this list is the first deliverable of vol-01 and is not fixed by the founding document. Until it is fixed, every theorem over Phys_adm is conditional on the chosen conditions (theorem-registry status: *conditional*).

## 5. Irreducibles and decomposition

**DEF-021 — Irreducible.** An object P ∈ Phys is irreducible relative to a specified composition operation when it admits no nontrivial decomposition under that operation. The class of irreducibles is
𝔍 = {P ∈ Phys : P is irreducible}. *Status: stipulative* (Founding Document §3). Irreducibility is always relative to 𝒞 (DEF-007) and to the decomposition notion in force.

**DEF-022 — Decomposition.** An expression P ≃ ℱ(I₁, …, I_n) with I_i ∈ 𝔍 and ℱ an admissible construction (DEF-023). *Status: stipulative; uniqueness open.* Unlike finite groups, interacting physical systems do not necessarily admit unique decompositions: entanglement, emergent phenomena, gauge redundancy, and nontrivial interactions complicate the notion of irreducibility; existence and uniqueness theorems should be pursued only within carefully restricted subclasses (Founding Document §3).

**DEF-023 — Admissible construction ℱ.** A permitted operation assembling systems from simpler ones. *Status: stipulative*. Canonical list for the series: tensor product; direct sum; extension (group, algebra, and field-theoretic extension); limits and colimits (including the limiting procedures of DEF-013); factorization (decomposition of a representation into factors, cf. the direct-integral decomposition into factors [8]). Each use must state the composition data it contributes to 𝒞.

**DEF-024 — Closure ⟨𝔉⟩_𝒞.** The class of objects generated from a family collection 𝔉 under the constructions 𝒞 (equivalently, the smallest class containing 𝔉 and closed under the admissible constructions). *Status: stipulative* (Founding Document §6, notation ⟨𝔉_α⟩_𝔆). The conjectural objective is Phys_adm ≃ ⟨𝔉⟩_𝒞 (DEF-036).

## 6. Structural families

**DEF-025 — Structural family collection 𝔉.** A collection 𝔉 = {𝔉_α}_{α∈A} of fundamental structural families: full subcategories of Phys singled out by their underlying mathematical structure. *Status: stipulative* (Founding Document §6). The ten candidate families below (DEF-026–035) are candidate organizing families, not a completed classification (Founding Document §4); some may be unified or shown to be special cases of others.

**DEF-026 — Family I: Symplectic and Poisson structures.** Underlying structure: symplectic manifolds and Poisson manifolds; representative systems: classical mechanics. *Status: established mathematics within the family; local classification complete* — Darboux normal form, no local invariants [6]; Weinstein splitting and symplectic leaves [7]. Cross-reference: REPORT domains "Symplectic manifolds (local)", "Poisson manifolds (local)". Relation to Family II via deformation quantization is *conjectural* (Founding Document §4).

**DEF-027 — Family II: Hilbert spaces and operator algebras.** Representative systems: quantum mechanics. *Status: established islands; partially impossible.* Finite-dimensional C*-algebras classified by dimension vector [9]; amenable factors classified [8]; general II₁/III factor classification impossible (McDuff) [8]; fusion categories open [14]; quantum channels normal form only [10][11]. Cross-references: REPORT domains "Finite-dim C*-algebras", "Amenable factors", "General II₁/III factors", "Quantum channels".

**DEF-028 — Family III: Smooth manifolds and geometric structures.** Representative systems: relativity. *Status: established in restricted regimes.* Lorentzian holonomy classified [51]; causal ladder complete [50]; 3-manifolds geometrized into 8 Thurston geometries [60]; dimension 4 contains unrecognizable instances [54]. Cross-references: REPORT domains "Lorentzian holonomy groups", "Spacetime causality conditions", "3-manifolds", "4-manifolds".

**DEF-029 — Family IV: Principal bundles and connections.** Representative systems: gauge theories. *Status: established* — bundles classified by [X, BG] and characteristic classes [17][18]; anomalies classified as cohomological obstructions [19]. Cross-references: REPORT domains "Principal G-bundles", "Anomalies".

**DEF-030 — Family V: Probability and measure-theoretic structures.** Representative systems: statistical physics. *Status: established (classical), parametric (quantum)* — Fisher metric uniquely monotone under stochastic maps (Chentsov) [52]; quantum monotone metrics classified parametrically by operator monotone functions (Petz–Sudar) [52], not by a finite list.

**DEF-031 — Family VI: Topological and higher-categorical structures.** Representative systems: TQFTs. *Status: claimed in the classification direction* — Atiyah axioms make functorial TQFT tractable "in notorious contrast to the situation for general non-topological QFTs" [36]; the cobordism hypothesis classifies extended TQFTs by fully dualizable objects [34], but the 2009 proof is an "informal sketch of a proof" [35]. Cross-references: REPORT domains "Extended TQFTs".

**DEF-032 — Family VII: Dynamical systems and operator semigroups.** Representative systems: dissipative and open systems. *Status: open as a classification* — Stinespring classifies completely positive maps up to minimal dilation [10]; Kraus form is a normal form, not an isomorphism classification [11]. No classification theorem for this family is on record in the survey.

**DEF-033 — Family VIII: Tensor categories and compositional structures.** Representative systems: quantum information. *Status: established islands; open in general.* DHR/DR: symmetric tensor *-categories with conjugates, direct sums, subobjects, End(1)=C are equivalent to representations of a compact supergroup [12][16]; Deligne: char-0 symmetric tensor categories of subexponential growth are supergroup representation categories [13]; fusion categories open (ENO pivotal conjecture) [14]; Etingof–Gelaki constraint binding (DEF-018) [12]. Cross-references: REPORT domains "DHR superselection", "Symmetric tensor cats", "Fusion categories".

**DEF-034 — Family IX: Discrete combinatorial structures.** Representative systems: lattice and network models. *Status: partial; wild sectors impossible.* Lattice YM theorems hold only in restricted regimes [30][31][32]; wildness results forbid finite-variety parameterization in general [55][56][58]; tame/wild is also an algorithmic boundary [57].

**DEF-035 — Family X: Derived and homotopical structures.** Representative systems: higher gauge and derived field theories. *Status: partial.* Every finite-dimensional algebra over an algebraically closed field is derived-tame or derived-wild, with wildness degeneration-robust [55]; beyond that dichotomy no classification is claimed.

**Independence versus reconstructability (honest status).** Strict independence (non-derivability) between families is rarely proved; what the literature proves are reconstruction theorems and counterexamples to reconstruction:

| Relation | Verdict | Source |
|---|---|---|
| Family II (commutative part) ↔ Family III (compact Hausdorff spaces) | **Reconstructable** — Gelfand duality | [43] |
| Boolean algebras ↔ zero-dimensional compact spectra | **Reconstructable** — Stone duality | [44] |
| Family VIII with symmetric structure → compact supergroups | **Reconstructable** — DR reconstruction | [12][16] |
| Family VIII (char 0, subexponential growth) → supergroup representations | **Reconstructable** — Deligne | [13] |
| Tensor categories without symmetric structure → the underlying group | **Not reconstructable** — Etingof–Gelaki isocategorical groups | [12] |
| Family I ↔ Family II | **Open** — deformation quantization is a programmatic link, not an equivalence theorem | Founding Document §4 |
| Classical (Family V) vs quantum monotone metrics | **Not identical** — uniqueness fails in the quantum case; parametric family instead | [52] |
| Families as a whole | **Open** — no theorem states that any two of the ten families are logically independent | — |

## 7. Invariants

**DEF-036 — Structural invariant record.** For a theory T, the tuple
ℐ(T) = (𝒮_T, 𝒪_T, 𝒟_T, 𝒢_T, ℛ_T)
describing states, observables, dynamics, symmetries, and representations. *Status: stipulative* (Founding Document 04). The classification question is which invariants suffice to distinguish theories up to the chosen ≃ (DEF-015). Practically, identification runs through companion-atlas data of the ATLAS kind: order, Schur multiplier, Out(G), presentations, character tables with power maps [3].

**DEF-037 — Classifying invariant.** For a domain with a completed classification, the invariant whose value determines the object up to the chosen equivalence: Dynkin/Satake diagram [4]; dominant integral weight [5]; dimension vector [9]; Murray–von Neumann type and Connes invariants [8]; [X, BG] and characteristic classes [17][18]; fully dualizable object [34][35]; holonomy group [51]; causal class [50]; SSA+MMI inequality data for ≤4 regions [47]; Fisher metric up to constant [52]. *Status: established* within each domain's stated scope.

**DEF-038 — Yoneda embedding.** The assignment P ↦ Hom_Phys(−, P), providing a faithful mathematical representation of objects of a locally small Phys through their relationships. *Status: established mathematics; physical interpretation open* (Founding Document §5), subject to the Yoneda qualification (DEF-017). The 2024–2026 categorical-supermap line shows concrete representability when suitable channel–state duality holds [40][41]; the unification with Gelfand/Stone/Naimark reconstruction is *open*.

## 8. Classification problem and the three layers

**DEF-039 — Classification problem.** The problem Classify(Ob(Phys)/≃) of classifying admissible representations of physical systems up to physical equivalence (Founding Document §2). *Status: open as a universal problem.*

**DEF-040 — Structural generation statement.** The statement ∀P ∈ Phys_adm : P ≃ ℱ(I₁, …, I_n) with I_i ∈ 𝔍 (Founding Document §3). *Status: conjectural.*

**DEF-041 — Structural Classification of Admissible Physical Systems (form).** The conjectural identity Phys_adm ≃ ⟨𝔉_α⟩_𝔆 (Founding Document §6), requiring proofs of completeness, soundness, equivalence, structural characterization, and decomposition. *Status: conjecture* (registered as T-CMRPS-01 in `docs/theorem-registry.md`).

**DEF-042 — Principia Physica, three layers.** Layer 1: mathematical classification, ℳ = Classify(admissible structures). Layer 2: physical realization, ℛ : ℳ → 𝒫. Layer 3: empirical selection, ℰ : 𝒫 → 𝒪, where 𝒪 represents observational constraints or predictions, not a claim that every model maps to a single observational object. *Status: stipulative architecture* (Founding Document §7). A mathematical structure can be consistent without describing our universe; several mathematically distinct theories may produce identical predictions in an experimentally accessible regime. A complete mathematical classification would not automatically solve the empirical problem. Physical validation of Principia Physica is not established (YonedaAI Summary).

---

## Definition index

| ID | Term | Status |
|---|---|---|
| DEF-001 | Category Phys | Stipulative |
| DEF-002 | Object P = (X, 𝒪, 𝒟, 𝒮, 𝒞) | Stipulative |
| DEF-003 | State space X | Stipulative |
| DEF-004 | Observables 𝒪 | Stipulative |
| DEF-005 | Dynamics 𝒟 | Stipulative |
| DEF-006 | Symmetries and constraints 𝒮 | Stipulative |
| DEF-007 | Composition and interaction rules 𝒞 | Stipulative |
| DEF-008 | Morphism | Stipulative; one-category assumption open |
| DEF-009 | Coarse-graining | Stipulative |
| DEF-010 | Equivalence morphism | Stipulative |
| DEF-011 | Embedding | Stipulative |
| DEF-012 | Duality | Stipulative |
| DEF-013 | Limiting procedure | Stipulative |
| DEF-014 | Preservation law | Open |
| DEF-015 | Physical equivalence ≃ | Stipulative; choice open |
| DEF-016 | Mathematical equivalence | Established notion |
| DEF-017 | Yoneda qualification | Binding constraint (verbatim) |
| DEF-018 | Etingof–Gelaki structure-preserving requirement | Established (negative theorem) |
| DEF-019 | Admissible physical system / Phys_adm | Stipulative |
| DEF-020 | Admissibility conditions | Open |
| DEF-021 | Irreducible 𝔍 | Stipulative |
| DEF-022 | Decomposition | Stipulative; uniqueness open |
| DEF-023 | Admissible construction ℱ | Stipulative |
| DEF-024 | Closure ⟨𝔉⟩_𝒞 | Stipulative |
| DEF-025 | Structural family collection 𝔉 | Stipulative |
| DEF-026 | Family I: Symplectic/Poisson | Established within family |
| DEF-027 | Family II: Hilbert/operator algebras | Established islands; impossible in part |
| DEF-028 | Family III: Manifolds/geometric | Established in restricted regimes |
| DEF-029 | Family IV: Bundles/connections | Established |
| DEF-030 | Family V: Probability/measure | Established (classical); parametric (quantum) |
| DEF-031 | Family VI: Topological/higher-categorical | Claimed (proof gap) |
| DEF-032 | Family VII: Dynamical systems/semigroups | Open |
| DEF-033 | Family VIII: Tensor categories/compositional | Established islands; open in general |
| DEF-034 | Family IX: Discrete combinatorial | Partial; wild sectors impossible |
| DEF-035 | Family X: Derived/homotopical | Partial |
| DEF-036 | Structural invariant record ℐ(T) | Stipulative |
| DEF-037 | Classifying invariant | Established (per domain) |
| DEF-038 | Yoneda embedding | Established mathematics; interpretation open |
| DEF-039 | Classification problem Classify(Ob(Phys)/≃) | Open |
| DEF-040 | Structural generation statement | Conjectural |
| DEF-041 | Structural Classification conjecture form | Conjecture |
| DEF-042 | Principia Physica layers ℳ, ℛ, ℰ | Stipulative architecture |
