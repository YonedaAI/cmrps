# Metadata: vol-07-gauge-qft

**Volume:** Classification of Gauge Structures and Quantum Field Theories (Part 7 of CMRPS)
**Author block:** Matthew Long / The YonedaAI Collaboration, YonedaAI Research Collective / Chicago, Illinois, USA
**Date:** October 2026
**Paper:** papers/latex/vol-07-gauge-qft.tex

## Novelty assessment

The volume is a classification survey with restricted new results, in the sense the series prescribes. The classification content it reports (Killing-Cartan, highest weight, bundle classification by [X, BG], characteristic classes, Frobenius correspondence, Doplicher-Roberts reconstruction, Deligne's theorem) is established mathematics; the contribution is the assembly of these results into the CMRPS classification regime table with hypotheses in full and with the claims frontier registered at its exact rungs. The restricted results contributed here are: the explicit instantiation of the series invariant record for gauge systems (which components each theorem reaches), the worked global-forms example showing the Dynkin diagram does not determine the bundle classification, and the exact Chevalley-Eilenberg computations of the algebraic obstruction data. No claim of a new classification theorem is made. Consistent with the program's success criteria, the honest regime map, including the open and claimed rows, is the deliverable.

## Literature coverage

The bibliography has 34 entries, all resolved (reviews/vol-07-gauge-qft-bib-check.md). Foundational mathematics is cited to primary sources and standard monographs (Atiyah, Atiyah-Singer, Baez-Dolan, Barnich-Brandt-Henneaux, Deligne, Dold, Doplicher-Haag-Roberts, Doplicher-Roberts, Etingof-Gelaki, Gelfand-Naimark, Haag-Kastler, Humphreys, Lurie, Milnor, Milnor-Stasheff, Quillen, Serre, Steenrod, Stone, Wess-Zumino). The 2024 to 2026 constructive quantum field theory frontier is cited to its own records (Clay, OpenAI, KITP, Scientific American, Douglas, Faizal-Shabir, Jacobsen, Nissim, Cao-Nissim-Sheffield, Faria da Veiga-O'Carroll, Nair, Casini-Magan, Pinzari, Mueger), each at its status rung. Coverage caveat inherited from the survey: discovery ran on arXiv plus known-URL fetches, so non-arXiv venues may be under-covered; the Freed-Hopkins cobordism-spectrum statement of the general anomaly classification is a named gap and is not cited.

## Proof-status summary

Twelve formal statements: ten proved in the paper (each a standard result with its argument recorded and hypotheses in full), one conjecture (the cobordism hypothesis, registered as claimed with a proof gap), and one theorem pair (Doplicher-Roberts, Deligne) proved under explicitly stated hypotheses. Five computational scripts accompany the volume. After the code evidence audit, one (the Chevalley-Eilenberg computation) is presented as a finite-instance check in the code evidence appendix; the other three are described as worked illustrations with no evidentiary claim (reviews/vol-07-gauge-qft-code-audit.md, WARN: code-audit removed 3 rows). None is presented as proof. Six claim-landscape rows are registered at their rungs on the claim ladder; none is a theorem. Nothing in the series is machine-checked; the Haskell taxonomy instances are executable models cross-audited against the paper's definitions and are never "verified by Lean".

## Open problems recorded

1. Which cases of the extended topological field theory classification carry complete proofs (the Lurie proof gap).
2. The general cobordism-spectrum statement of the anomaly classification (primary source needed).
3. The OpenAI artifact release and the KITP committee verdict (tracked event).
4. The Faizal-Shabir continuum-limit audit (where the limit is closed versus assumed).
5. The Haag-Kastler axiom list and the stability of Doplicher-Roberts uniqueness under relaxed hypotheses.
6. The single-source higher-form extra Z2 possibility (Casini-Magan), recorded without weight.
7. Classification of connections modulo gauge outside restricted cases (flat or self-dual).

## Connections to other volumes

- vol-01 (definitions): the tuple schema, equivalence notions, and claim-status vocabulary are used throughout; the admissibility conditions remain unfixed upstream, so every classification statement is scoped to a named equivalence.
- vol-02 (families, invariants): Family IV and Family VI are instantiated; the classifying-invariant discipline organizes the regime table.
- vol-03 (decomposition): the product and quotient constructions on bundles are used; uniqueness questions are inherited.
- vol-06 (quantum systems): the operator-algebraic input to the superselection analysis (Doplicher-Roberts, Deligne) is shared under the same hypotheses (DEP-003).
- vol-08, vol-09 (spacetime, gravity): this volume supplies the gauge-side classification data those volumes reconstruct from; no claim-ledger result of this volume is exported as a premise.
- vol-11 (obstructions): the Etingof-Gelaki constraint and the anomaly-as-obstruction model are raw material for the obstruction register.
- vol-12 (assembly): the regime table feeds the synthesis; the claim ladder rows keep their rungs.

## Dependency legality

The volume depends only on registered results and definitions of earlier volumes and on established literature. It does not depend on the 4D Yang-Mills existence claim, on the mass gap, or on the withheld formalization. The cobordism hypothesis is used only as a registered conjecture. Existence and mass gap are never conflated.
