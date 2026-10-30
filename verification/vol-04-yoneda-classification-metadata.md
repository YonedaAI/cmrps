# Metadata — vol-04-yoneda-classification

**Paper:** papers/latex/vol-04-yoneda-classification.tex
**Volume:** Part 4 of The Classification of Mathematical Representations of Physical Systems
**Date:** 2026-10-30. **Pages:** 20. **Review:** AGY rounds 1-4, final VERDICT: ACCEPT (publishable as-is, focused round 4). **Code audit:** 10/10 rows SUPPORTS, PASS.

## Novelty assessment

The volume's original content is expository-synthetic rather than a new classification theorem, in line with its mandate (develop the relational characterization under the binding Yoneda qualification). Three contributions are new in the sense of not appearing as packaged results in the cited sources:

1. **The non-implication theorem (3.9)** makes the third denial of the Yoneda qualification precise: full faithfulness of the Yoneda embedding is exhibited alongside the absence of any finite-variety classification in one category (rank-two maximal Cohen-Macaulay modules over the generic determinant ring, n >= 3). The witness is the Buchweitz-Leuschke wildness result; the logical separation of determination from classification is the paper's own argument. The theorem denies an implication rather than refuting a published claim; it fixes the boundary of what representability delivers.
2. **The layer separation of Section 6** (fusion ring below monoidal category below symmetric monoidal category), stated with the Etingof-Gelaki counterexample at the middle layer and the D8/Q8 fusion computation at the bottom layer, corrects a conflation common in informal discussions ("tensor data determines the group") and gives the preserved-layer discipline (Prop. 6.2) a precise content.
3. **The finite-dimensional worked Choi instance (4.2)** and the typed executable fragment (Instances.hs choiMatrix/applyChannel) pin the supermap representability hypothesis to a computation rather than a slogan.

Everything else (Yoneda lemma, Gelfand/Stone/Doplicher-Roberts reconstruction, Etingof-Gelaki, Buchweitz-Leuschke, supermap representability) is cited literature with hypotheses attached.

## Literature coverage

11 bibliography entries, all resolved (reviews/vol-04-yoneda-classification-bib-check.md): primary sources for every foundational theorem (Mac Lane; Gelfand-Neumark 1943 with the Contemp. Math. reprint; Stone 1936; Doplicher-Roberts 1989; Doplicher-Haag-Roberts 1969; Choi 1975; Etingof-Gelaki 2000; Buchweitz-Leuschke 2007 AJM; Bekkert-Drozd 2003; plus the two supermap papers Hefford-Wilson LICS 2024 and Wilson-Hefford-Hoffreumon 2026 preprint). Wikipedia and nLab entries from the first draft were replaced after round-1 review. Coverage caveat: the supermap line rests on two papers; no further 2024-2026 representability literature was surveyed beyond the staged corpus.

## Proof-status summary

- Proved in paper: Theorem 3.1, Corollaries 3.2 and 3.4, Propositions 3.3, 3.6, 3.7, Proposition 4.1 (with equation 1), Theorem 3.9's non-implication (given the cited witness), Proposition 5.5, Theorem 6.1's negative reading is literature but Propositions 6.2 and Corollary 6.3 and Proposition 6.4 are proved in paper.
- Complete-informal-proof (literature, hypotheses attached): Theorems 5.1, 5.2, 5.3, 6.1; the non-parametrization input of 3.9.
- Conditional: Theorem 4.3 (channel-state duality hypothesis; the finite-dimensional instance is verified).
- Computational-evidence: Section 7 experiments (all passing; code audit PASS).
- Open problems: the five of Section 9. No conjecture is asserted as a theorem anywhere in the paper.

## Open problems carried forward

1. The Yoneda-principle synthesis (supermap line vs Gelfand/Stone/Doplicher-Roberts): open (the volume's headline).
2. Physical content of Hom_Phys(-,P) beyond local smallness: open (premised on the unfixed preservation laws).
3. Range of channel-state duality across theories: open beyond the finite-dimensional case and the cited applications.
4. Positive appearance of the symmetric layer in presheaf data: open.
5. A precise statement worthy of "Yoneda lemma for physics": open.

## Connections to other volumes

- vol-01 (foundations): supplies the object schema, the equivalence notions (DEF-015/016), and the unfixed preservation laws (DEF-014) that this paper's conditional statements rest on; the Yoneda qualification (DEF-017) is developed here and is binding everywhere.
- vol-02/03 (families, decomposition): the fusion-ring layer of Section 6 is the decategorified shadow of Family VIII data; the composition/limit behavior of Section 3.3 touches DEF-022/023 decomposition without importing unproven claims.
- vol-05/06 (classical/quantum systems): the Choi/channel fragment and the Gelfand instance are inputs for quantum-side relational statements; the non-implication theorem warns any classification attempt built on representability alone.
- vol-07 (gauge/QFT): the Doplicher-Roberts island and its DHR hypotheses (including the long-range caveat) are stated here with the same hypotheses vol-07 requires (DEP-007 discipline).
- vol-08/09 (spacetime, gravity): the probe-reconstruction pattern is the template those volumes use; this paper separates it from classification.
- vol-10 (observational equivalence): owns the empirical layer this paper declines to formalize; the Etingof-Gelaki constraint (DEP-007) is the shared equivalence discipline.
- vol-11/12 (completeness, synthesis): the non-implication theorem and the four-regime table are raw material for the completeness analysis; the volume delivers relational determination only, exactly as the program's dependency rules require.

## Constraint compliance

- Yoneda qualification quoted verbatim (DEF-017); no conclusion of physical equivalence, empirical adequacy, or classification from Yoneda alone; the open synthesis is marked open and is not assumed.
- DEP-007 (Etingof-Gelaki) honored: every equivalence discussed names its preserved layers.
- No claim is labeled machine-checked; Haskell is computational evidence, never "verified by Lean".
- Claim ledger matches the final paper; no [SOURCE REQUIRED] or [VERIFY VALUE] markers remain.
