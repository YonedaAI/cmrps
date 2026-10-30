# CMRPS research perspective — binding directive for every volume

This file is the perspective handed to every agent in the run. It is the YONEDAAI RESEARCH
DIRECTIVE (deduplicated) plus the binding rules for this series. It overrides nothing in
references/ — where a reference standard conflicts with prose style, the reference wins.

## Primary objective

Develop the research program: The Classification of Mathematical Representations of Physical
Systems (CMRPS). Determine whether mathematical representations of physical systems admit a
rigorous structural classification analogous to the Classification of Finite Simple Groups:
(1) the fundamental mathematical families capable of representing physical systems; (2) the
irreducible structures underlying physical theories; (3) the operations through which complex
systems are constructed; (4) the equivalences and dualities connecting apparently different
theories; (5) the conditions under which spacetime, quantum mechanics, gauge fields, matter,
and gravity can be reconstructed; (6) whether an exhaustive classification theorem is possible
for appropriately defined classes.

The long-term target statement (a research objective, NOT an assumed result):

    Phys_adm ≃ ⟨𝔉_1,…,𝔉_n⟩_𝒞

The program must determine whether such a classification exists, what restrictions are
necessary, and whether completeness can be proven.

## Series and volume map

Author block for EVERY manuscript (use \maketitle template in references/paper-format.md):

    Matthew Long
    The YonedaAI Collaboration
    YonedaAI Research Collective
    Chicago, Illinois, USA
    mlong@yonedalabs.ai
    https://yonedalabs.ai

Publication date for this run: October 2026 (use the actual date, not "Month YYYY" literally).

Volumes (topic slug — full title):

- vol-01-foundations — Foundations of the Classification of Mathematical Physical Systems
- vol-02-structural-families — Fundamental Structural Families of Mathematical Physics
- vol-03-irreducibility-decomposition — Irreducibility, Decomposition, and Universal Constructions
- vol-04-yoneda-classification — The Yoneda Classification Principle
- vol-05-classical-systems — Classification of Classical Physical Systems
- vol-06-quantum-systems — Classification of Quantum Physical Systems
- vol-07-gauge-qft — Classification of Gauge Structures and Quantum Field Theories
- vol-08-spacetime-reconstruction — Classification and Reconstruction of Spacetime
- vol-09-gravity-information-geometry — Gravity, Information, and Geometric Correspondence
- vol-10-observational-equivalence — Observational Equivalence and Physical Distinguishability
- vol-11-completeness-obstructions — Completeness, Obstructions, and the Universal Classification Problem
- vol-12-principia-physica — Principia Physica: Toward a Unified Structural Theory of Mathematical Physics

## Research context (six YonedaAI programs — research inputs, not established results)

Yoneda Constraint (category theory, representability, relational structure, Yoneda embeddings);
Emergent Spacetime (information geometry, weighted nerves, groupoids, entanglement, geometric
reconstruction); Gravity–Information–Geometry (curvature, gravitational dynamics, information
geometry, reconstruction); Condensed Representation Theory (sheaves, representation theory,
topology, condensed mathematics, emergent observables); Information Geometry Correspondence
(observation functors, empirical equivalence, observational distinguishability); Principia
Physica (unified mathematical foundations: quantum theory, spacetime, matter, gravity).

Treat existing YonedaAI manuscripts as research inputs, not established mathematics unless
independently verified. Shared documents for all volumes: docs/ontology.md (common ontology,
DEF-IDs), docs/theorem-registry.md (claim-status vocabulary and records), docs/research-map.md
(literature map and cross-volume dependency graph — obey its "may NOT depend on" column),
docs/periodic-table.md (status of every family/domain: PROVEN / CLAIMED / OPEN / IMPOSSIBLE).

## Methodology (per volume)

Phase A — Literature: established results, major classification theorems, foundational papers;
primary sources; complete bibliographic references; verify claims against originals.
Phase B — Formal definitions: objects, morphisms, equivalences, invariants, admissibility.
Undefined notions such as "universal physical structure" are forbidden.
Phase C — Theorem development: state assumptions; specify domain; complete proof or explicit
missing steps; boundary cases; counterexample search; literature comparison. Never label a
conjecture a theorem without a complete valid proof.
Phase D — Computational investigation: Python/SageMath experiments in src/<topic>/; computational
evidence is NEVER presented as proof.
Phase E — Formal verification: Lean 4 + Mathlib (lean/Cmrps/ modules) with per-claim status.
"Machine-checked" ONLY after a clean Lean kernel build. Haskell under src/ is the executable
taxonomy layer (instances of src/Taxonomy/ classes): computational evidence, validated against
kernel-checked specifications via cross-audit — NEVER "verified by Lean".
Phase F — Adversarial review: incorrect assumptions, circular reasoning, invalid equivalences,
missing hypotheses, counterexamples, unsupported novelty, unjustified physical interpretation.

Claim-status labels (verification/ artifacts, never inside .tex prose beyond ordinary
mathematical phrasing like "conditional on Conjecture 3.2"): machine-checked |
complete-informal-proof | conditional | conjecture | computational-evidence | open-problem.

## Cross-volume consistency

docs/ontology.md definitions are reused consistently; later volumes may generalize only
explicitly. Never depend on an unproven conjecture without marking the result conditional
(see docs/research-map.md dependency graph). The Yoneda qualification, verbatim: "Yoneda does
not, by itself, establish physical equivalence, empirical adequacy, or a classification
theorem." Physical-equivalence claims require their own definition and justification.

## Known claim-status facts as of 2026-10-29 (from docs/research-map.md)

Clay Yang–Mills: Unsolved. OpenAI (2026-10-26) claims rigorous EXISTENCE for QCD, a simplest GUT
completion, and pure YM as subproblem (Balaban-based); 1147-page manuscript and claimed Lean
formalization are WITHHELD pending KITP committee review. The MASS GAP remains open. Never
conflate existence with mass gap. Never cite the OpenAI formalization as machine-checked —
"claimed, not released". Journal-published rival mass-gap claims (Faizal–Shabir) are unverified;
one earlier preprint was withdrawn. Lattice theorems in the 't Hooft regime are rigorous but do
not address continuum 4D existence or the continuum mass gap.

## Success criteria

Precision and consistency of definitions; correctness of proofs; coverage of established
classification results; new restricted classification theorems; new reconstruction results;
genuine obstructions identified; honest formal verification; strict separation of mathematical
and empirical claims. A rigorous impossibility or nonclassification theorem is an acceptable
and valuable result. Do NOT optimize for paper count, claimed breakthroughs, or apparent
novelty. Optimize for mathematical correctness, depth, and cumulative progress.
