# Claim ledger — vol-04-yoneda-classification

**Paper:** papers/latex/vol-04-yoneda-classification.tex (final state post review rounds 1-4)
**Date:** 2026-10-30
**Status vocabulary:** proved-in-paper (complete proof in this paper) | complete-informal-proof (literature result cited with source; the series' sixth label) | conditional (proved from stated hypotheses, which include cited results) | computational-evidence | open-problem | conjecture.

This ledger is a verification artifact and is not part of the LaTeX. The paper itself carries no status labels in prose.

| Result | Statement (one line) | Status | Where used |
|---|---|---|---|
| Theorem 3.1 (Yoneda lemma) | For A in a locally small C and F : C^op -> Set, ev_A : Nat(Hom(-,A), F) -> F(A) is a bijection | proved-in-paper (standard argument, full proof given) | Cor. 3.2, 3.4, 3.6, 3.7, Thm 3.9 |
| Corollary 3.2 (Full faithfulness) | Hom(A,B) -> Nat(y(A), y(B)) is a bijection; y(A) = y(B) implies A = B up to isomorphism | proved-in-paper | Prop. 3.3, Cor. 3.4, Rem. 3.5, Prop. 3.6, Thm 3.9, Sec. 7 |
| Proposition 3.3 (Probe content) | y(P)(R) = Hom(R,P) with precomposition action; a profile is the system's interaction with every probe | proved-in-paper | Sec. 5, Sec. 8 |
| Corollary 3.4 (Relational equivalence is isomorphism) | P ~_rel Q iff P and Q are isomorphic in the declared category; physical equivalence only if morphisms are justified | proved-in-paper | Prop. 6.2, Sec. 8 |
| Proposition 3.6 (What restriction loses) | Isomorphic restricted profiles do not imply isomorphic objects in general; full faithfulness of y_R suffices | proved-in-paper | Sec. 8, Sec. 9 |
| Proposition 3.7 (Profiles respect limits) | y preserves existing limits; y(A x B) = y(A) x y(B) canonically | proved-in-paper | Sec. 8 |
| Theorem 3.9 (Representability does not imply classifiability) | Rank-2 MCM modules over the generic determinant ring (n >= 3): full faithfulness of y with no finite-variety parametrization of isomorphism classes | proved-in-paper for the non-implication; witness non-parametrization is complete-informal-proof in the literature (Buchweitz-Leuschke) | Sec. 8, Conclusion |
| Proposition 4.1 (Choi correspondence and composition) | Phi -> J(Phi) is a linear bijection L(M_n,M_m) -> M_n tensor M_m; CP iff J >= 0; TP iff Tr_m J = I; composition is the index contraction of equation (1) | proved-in-paper (full proof; elementary-map basis) | Rem. 4.2, Thm 4.3, Sec. 7 |
| Theorem 4.3 (Supermap representability) | With a channel-state duality on a symmetric monoidal process category, categorical supermaps are concretely representable and factorisation theorems follow | conditional (hypotheses: process category + channel-state duality; complete-informal-proof in the cited settings, Wilson-Hefford-Hoffreumon and Hefford-Wilson) | Sec. 4.1, Sec. 8, Sec. 9 |
| Theorem 5.1 (Gelfand duality) | KHaus^op = CCStar as categories; every unital commutative C*-algebra is C(X) for X its character space | complete-informal-proof (literature, Gelfand-Neumark) | Prop. 5.5, Sec. 8, Sec. 9 |
| Theorem 5.2 (Stone duality) | Bool^op = KHaus_0 as categories; Boolean algebras recovered from their Stone spaces | complete-informal-proof (literature, Stone) | Rem. 5.6, Sec. 9 |
| Theorem 5.3 (Doplicher-Roberts reconstruction) | Symmetric tensor C*-categories with conjugates, direct sums, subobjects, End(1)=C are representation categories of a compact supergroup, unique up to isomorphism | complete-informal-proof (literature, Doplicher-Roberts; hypotheses of the statement required) | Sec. 6, Sec. 9 |
| Proposition 5.5 (Probe reconstruction, commutative side) | The Gelfand transform assembles probe values chi(a) and the reconstruction upgrades determination to an equivalence of categories | proved-in-paper (restatement of Thm 5.1 content) | Sec. 5 |
| Theorem 6.1 (Etingof-Gelaki constraint) | Non-isomorphic finite groups with representation categories equivalent as monoidal categories; the symmetric layer is required to recover the group | complete-informal-proof (literature, Etingof-Gelaki) | Prop. 6.2, Cor. 6.3, Prop. 6.4, Sec. 9 |
| Proposition 6.2 (Preserved-layer discipline) | Relational equivalence in C implies equivalence only at the layers C's morphisms preserve | proved-in-paper | Cor. 6.3, Sec. 8 |
| Corollary 6.3 (Constraint inheritance) | The Yoneda embedding does not weaken the structure-preservation requirement on equivalences | proved-in-paper | Sec. 8 |
| Proposition 6.4 (Fusion rings of D8 and Q8) | Character tables and fusion rings of D8 and Q8 are isomorphic while the groups are not; fusion-ring data does not determine the group | proved-in-paper (hand computation in Appendix A; computational evidence in fusion_rings.py) | Sec. 6, Sec. 7 |
| Experiments (Sec. 7) | Yoneda bijection on all 9 pairs of a test category; profile separation; exhaustive finite Stone ultrafilters; Choi bijection and PSD round-trip; Choi contraction; D8/Q8 fusion | computational-evidence (all checks pass; never proof) | Table 5 (code evidence appendix) |
| Problems 9.1-9.5 | Yoneda-principle synthesis; physical content of profiles; range of channel-state duality; symmetric layer in profiles; status of the slogan | open-problem | Sec. 9 (the volume's research program) |
