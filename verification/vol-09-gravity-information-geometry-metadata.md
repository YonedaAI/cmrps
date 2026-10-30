# Metadata — vol-09-gravity-information-geometry

**Volume:** Part 9, Gravity, Information, and Geometric Correspondence (October 2026)
**Author block:** Matthew Long / The YonedaAI Collaboration / YonedaAI Research Collective / Chicago, Illinois, USA.

## Novelty assessment

The paper is deliberately conservative about novelty. Its proved results (Propositions 3.2, 4.2, 4.4, 5.1, 5.2, 9.1, Lemma 3.1, Corollary 6.1) are finite-dimensional computations that make the volume's classification boundary explicit; they are expository with respect to the information-geometric literature (Chentsov, Petz 1996, Petz-Sudar 1996/1999, Hübner 1992, Braunstein-Caves 1994, Ruppeiner 1979) and are attributed as such at the point of statement. The contribution the paper claims is organizational and diagnostic: (i) the uniqueness-then-failure pattern of monotone metrics is exhibited as a constraint on gravity-information dictionaries; (ii) the surviving uniqueness is localized exactly to the commutative locus; (iii) the three dictionaries (state-space, thermodynamic, spacetime) are separated and graded by evidence. No claim of first proof is made anywhere.

## Literature coverage

Core coverage: Chentsov's theorem and the Petz-Sudar classification (with the 1996 Journal of Mathematical Physics primary paper); quantum estimation (Braunstein-Caves 1994; Hübner 1992); reconstruction (Gelfand-Naimark 1943, Stone 1937); entanglement-wedge reconstruction (Dong-Harlow-Wall 2016); the holographic entropy cone (Bao et al. 2015; Hernández-Cuenca 2019 for five regions); the entropy formula with its derived special cases (Ryu-Takayanagi 2006; Casini-Huerta-Myers 2011; Lewkowycz-Maldacena 2013; Dong-Lewkowycz-Rangamani 2016; Engelhardt-Wall 2015); thermodynamic geometry (Weinhold 1975; Ruppeiner 1979; Jacobson 1995, 2016); linearized dynamics from entanglement (Faulkner et al. 2014; Lashkari-McDermott-Van Raamsdonk 2014); holographic Petz-family selection (Lashkari-Van Raamsdonk 2016); supermap representability (Hefford-Wilson 2024; Wilson-Hefford-Hoffreumon 2026). All 30 bibliography entries were resolved against arXiv, Crossref, doi.org, or OpenAlex records before the first review round; resolution evidence is in reviews/vol-09-gravity-information-geometry-bib-check.md.

Known coverage gaps: the information-geometric monograph literature (Amari-Nagaoka) is not cited; the nLab entries were replaced by primary sources at reviewer request; the staged corpus status for the holographic entropy cone at n ≥ 5 was corrected against the 2019 primary source (Hernández-Cuenca) during review.

## Proof-status summary

- Proved in this paper (complete-informal-proof): 11 numbered results; all computational checks in Section 11 are computational-evidence only.
- Quoted literature results (complete-informal-proof at source, hypotheses stated in the paper): Theorems 3.4, 4.1, 7.1, 7.2, 7.5, 8.4.
- Proposals and arguments (conjecture / argument, never stated as proved): Ryu-Takayanagi in general settings; emergence of spacetime from entanglement; gravity from information geometry; weighted-nerve continuum convergence.
- Nothing machine-checked. The Haskell module is executable vocabulary validated against the paper's statements, never "verified by Lean".

## Open problems

1. Selection of a Petz-family member f for gravity-information dictionaries (partial selections exist: BKM from relative entropy, SLD from estimation).
2. Continuum convergence of finite-groupoid and weighted-nerve constructions.
3. Status of the entropy formula for general regions and excited states; replacements where extremal surfaces fail.
4. Hypotheses under which information-geometric curvature corresponds to physical or spacetime curvature.
5. The Petz family and the uniqueness locus in infinite dimensions (quantum field theory state spaces).
6. Reconstruction of interacting dynamics from probe data.

## Connections to other volumes

- Part 1 (Foundations): the object schema P = (X,O,D,S,C) and the classification problem Classify(Ob(Phys)/≃) are referenced (Definition 2.12 of this paper is self-contained).
- Part 4 (Yoneda classification): the Yoneda qualification is quoted verbatim and governs Section 7; nothing in this volume derives physical equivalence from Yoneda.
- Part 5 (Classical systems): shares Chentsov (classical monotone metric) as a registered input; this volume develops the uniqueness-failure contrast that Part 5 flags.
- Part 8 (Spacetime reconstruction): shares the proved islands (entanglement-wedge reconstruction, the entropy cone) and the conjectural core (RT, Van Raamsdonk); this volume adds the information-geometric constraint (metric ambiguity).
- Part 10 (Observational equivalence): the metric-ambiguity result (Proposition 4.2) is input material for any equivalence criterion built on monotone metrics; the structure-preserving discipline of Remark 10.2 is the shared constraint (Etingof-Gelaki line).
- Part 11 (Completeness and obstructions): the volume supplies one positive boundary (uniqueness exactly on the commutative locus) and one obstruction-style constraint (no canonical quantum monotone metric) as raw material.
- Dependency discipline honored: this volume depends on registered results of Parts 4 and 8 and on background literature only; no unproven statement of the series is used as a premise.
