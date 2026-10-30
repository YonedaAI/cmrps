# Metadata: vol-05-classical-systems

Paper: Classification of Classical Physical Systems (Part 5 of The Classification of Mathematical Representations of Physical Systems). Compiled from `papers/latex/vol-05-classical-systems.tex`, October 2026.

## Novelty assessment

The paper is a synthesis and systematization volume, not a discovery volume. Its organizing claim, that classification content on the symplectic side is global and topological (an inversion of the Riemannian local-invariant situation), is a structural reading of established results (Darboux, Weinstein, Moser, Gromov) rather than a new theorem. The restricted classification statements it collects (toric manifolds by Delzant polytopes, coadjoint orbits by Weyl-chamber data, classical statistical models by the Fisher metric) are established mathematics presented in one classification-theoretic frame. The internal results proved in the paper are the small ones: the Casimir characterization on so(3)*, the product decomposition of Fisher metrics, the reduction-of-products compatibility, the periods statement for action variables, and the Moser-ball lemma with its corrected flow-domain argument. No claim of priority is made for any of these.

## Literature coverage

Fourteen bibliography entries, all resolved by DOI or arXiv before the first review round (`reviews/vol-05-classical-systems-bib-check.md`). Coverage: symplectic and Poisson geometry (Moser, Weinstein, Gromov, Delzant, Arnold, Marsden-Weinstein, Kirillov, Libermann-grade background via Arnold), Lie theory (Humphreys), information geometry (Chentsov, Amari, Petz-Sudar), integrable dynamics (Duistermaat, Nekhoroshev). Known gaps: the four-manifold gauge-theoretic invariants (Seiberg-Witten, Taubes) are named but not cited, and the orbit-method program beyond coadjoint orbits is referenced only as an open direction. Non-arXiv literature may be under-covered.

## Proof-status summary

Twenty-six formal statements: thirteen proved in the paper with complete proofs, thirteen established in the literature with proofs by reference and citations attached. Three computational claims carry status computational-evidence and are supported by the experiments in `src/vol-05-classical-systems/` (audit verdict: all rows SUPPORTS, `reviews/vol-05-classical-systems-code-audit.md`). Nothing in the paper is machine-checked; the Haskell modules are executable models validated against the paper's statements.

## Open problems

1. Global classification data for closed symplectic manifolds beyond surfaces, toric manifolds, and homogeneous spaces (Section 11).
2. Unique decomposition of classical systems outside restricted subclasses; action-angle monodromy is the worked obstruction (Sections 7 and 9).
3. Classification of Poisson structures with prescribed leaf space beyond the Weinstein local model (Section 4).
4. The deformation-quantization bridge between the symplectic and operator-algebra families; conjectural and used as no dependency (Section 11).
5. The correct physical equivalence for classical systems, including its preserved layers and observational content (Section 2; deferred to Parts 10 and 11 of the series).

## Connections to other volumes

- vol-01 (foundations): the five-component schema (DEF-002) and the equivalence discipline are instantiated, not redefined.
- vol-02 (structural families): Family I (symplectic/Poisson) and Family V (probability/measure) are the two families classified here at the classical level.
- vol-03 (irreducibility/decomposition): product composition and relative irreducibility are the classical instance of the decomposition machinery; uniqueness is shown to fail globally in one subclass.
- vol-04 (Yoneda): no Yoneda argument is used; the paper classifies under mathematical equivalence only.
- vol-06 (quantum systems): the Petz-Sudar contrast is stated to block transfer of Chentsov uniqueness; no quantum classification is claimed here.
- vol-09/vol-10: the classical uniqueness result (Chentsov) is the input whose quantum shadow is parametric; the equivalence question is deferred.
- vol-11: the obstruction pattern (monodromy, triviality of local invariants) is raw material for the completeness analysis.
