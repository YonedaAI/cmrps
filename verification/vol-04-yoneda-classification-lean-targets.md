# Lean targets — vol-04-yoneda-classification

**Paper:** papers/latex/vol-04-yoneda-classification.tex
**Date:** 2026-10-30. **Status of this file:** target list for a later mechanization phase. No .lean files are written here and no build is claimed. Nothing in this volume is machine-checked.

Rule of the series: names below are the exact target names for the later Lean 4 + Mathlib build (lean/Cmrps/ modules). Each target's informal statement matches the paper's numbered result and, where present, the Haskell name in src/vol-04-yoneda-classification/Instances.hs. Haskell in this volume is computational evidence and is never "verified by Lean"; the relationship a mechanization would establish is a cross-audit of executable models against kernel-checked specifications.

| # | Target name | Paper result | Informal statement | Haskell mirror |
|---|---|---|---|---|
| 1 | yoneda_nat_iso | Theorem 3.1 | For a locally small category C, object A, and F : C^op -> Set, the evaluation map Nat(Hom(-,A), F) -> F(A), alpha |-> alpha_A(id_A), is a bijection | (pure math; none) |
| 2 | yoneda_fully_faithful | Corollary 3.2 | Hom(A,B) -> Nat(y(A), y(B)) is a bijection for all A, B; hence y(A) iso y(B) iff A iso B | yonedaProfile (profile data) |
| 3 | relational_characterization | Corollary 3.4 | P and Q are relationally equivalent (isomorphic profiles) iff they are isomorphic in the declared category of representations | (instances' mathematicallyEquivalent keys) |
| 4 | profile_restriction_gap | Proposition 3.6 | For a probe class R the restricted comparison is not fully faithful in general: non-isomorphic objects can have isomorphic R-restricted profiles; full faithfulness of y_R suffices for separation | (yoneda_profiles.py witness) |
| 5 | profile_limit_preservation | Proposition 3.7 | y preserves limits that exist in C; in particular y(A x B) iso y(A) x y(B) and y preserves terminal objects | (pure math; none) |
| 6 | representability_not_classification | Theorem 3.9 | In the category of rank-two MCM modules over k[x_ij]/(det) for n >= 3, y is fully faithful while no invariant of finite-variety type classifies objects up to isomorphism; full faithfulness does not imply classifiability | (pure math; witness from literature) |
| 7 | choi_correspondence | Proposition 4.1 | The Choi assignment L(M_n, M_m) -> M_n tensor M_m is a linear bijection; complete positivity corresponds to positivity of J; trace preservation to Tr_m J = I | choiMatrix, applyChannel |
| 8 | choi_composition | Equation (1) | J(Psi o Phi) equals the double index contraction of J(Phi) and J(Psi) along the shared system | choiMatrix (tested by choi_duality.py) |
| 9 | supermap_representability | Theorem 4.3 (conditional) | In a symmetric monoidal process category with a channel-state duality preserved by composition, categorical supermaps are concretely representable through the duality (hypothesis: channel-state duality) | KrausChannel fragment (finite-dimensional instance) |
| 10 | monoidal_layer_insufficiency | Theorem 6.1 and Proposition 6.2 | Non-isomorphic finite groups have monoidally equivalent representation categories, so monoidal equivalence does not recover the group; relational equivalence preserves only the layers the declared morphisms preserve | (fusion_rings.py shadow case) |

Secondary targets a later phase may add (beyond the ten above): gelfand_duality (Theorem 5.1), stone_duality (Theorem 5.2), doplicher_roberts_reconstruction (Theorem 5.3, hypotheses of the statement), fusion_ring_separation (Proposition 6.4).

Conventions for the later build: the presheaf y(P) = Hom(-, P) is the target's central definition (paper Definition 2.2, Haskell RelationalProfile); equivalence notions follow Definition 2.4; the classification-by-invariants notion of Definition 3.8 is the meaning of "classification" in target 6.
