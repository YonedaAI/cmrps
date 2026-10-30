# Claim status — vol-04-yoneda-classification

**Module:** `lean/Cmrps/Vol04YonedaClassification.lean`
**Date:** 2026-10-30. Every claim below is labeled `machine-checked` only when it
appears in the module with a complete proof containing no `sorry`; the assembler promotes these
labels after `lake build` exits 0. Nothing in this file asserts kernel acceptance before that build.

Namespace: `Cmrps.Vol04`.

## Definitions

| Name | Statement | Status |
|---|---|---|
| `relationalProfile` | `relationalProfile P = yoneda.obj P : Cᵒᵖ ⥤ Type v` — the relational profile `y(P) = Hom(-, P)` (paper Definition 2.2) | machine-checked |
| `restrictedProfile` | `restrictedProfile ι P = ι.op ⋙ yoneda.obj P` — the `R`-restricted profile along a probe class `ι : S ⥤ C` (Definition 2.2) | machine-checked |
| `restrictedYoneda` | the restricted comparison `y_R : C ⥤ [S^op, Type]` (Proposition 3.6) | machine-checked |
| `RelationalEquivalence` | `RelationalEquivalence P Q := Nonempty (relationalProfile P ≅ relationalProfile Q)` (Definition 2.4) | machine-checked |
| `RestrictedRelationalEquivalence` | isomorphism of `R`-restricted profiles (Definition 2.4) | machine-checked |
| `Invariant` | a map `C → S` constant on isomorphism classes (Definition 3.8) | machine-checked |
| `Invariant.Classifies` | `I(P) = I(Q) → P ≅ Q` (Definition 3.8) | machine-checked |
| `FiniteVarietyType` | `S` is the set of `k`-points of an affine variety of finite type, encoded as `S ≃ {x : Fin n → k // ∀ f ∈ p, f(x) = 0}` for a finite set of polynomials `p` (Definition 3.8) | machine-checked |
| `ClassifyingInvariantOfFiniteVarietyType` | classifying invariant whose parameter set is of finite-variety type (Definition 3.8) | machine-checked |
| `ParametrizedByFiniteVariety` | existence of a classifying invariant of finite-variety type (Definition 3.8) | machine-checked |

## Targets

| # | Name | Statement | Status |
|---|---|---|---|
| 1 | `yoneda_nat_iso` | For `A : C` and `F : Cᵒᵖ ⥤ Type v`, `α ↦ α_A(id_A)` is a bijection `(y(A) ⟶ F) ≃ F(A)` (Theorem 3.1) | machine-checked |
| 1 | `yoneda_nat_iso_apply` | the bijection evaluates as `α.app (op A) (𝟙 A)` | machine-checked |
| 2 | `yoneda_fully_faithful` | `Hom(A, B) ≃ Nat(y(A), y(B))`, `φ ↦ (g ↦ φ ∘ g)` (Corollary 3.2) | machine-checked |
| 2 | `yoneda_fully_faithful_apply` | the bijection sends `φ` to postcomposition with `φ` | machine-checked |
| 2 | `yoneda_reflects_iso` | `y(A) ≅ y(B) ↔ A ≅ B` (Corollary 3.2) | machine-checked |
| 3 | `relational_characterization` | `P ~_rel Q ↔ P ≅ Q` in the declared category (Corollary 3.4) | machine-checked |
| 4 | `profile_restriction_gap` | three-object discrete witness: `R = {C}` gives isomorphic restricted profiles of `A ≇ B` (Proposition 3.6, first half) | machine-checked |
| 4 | `restricted_faithful_separates` | full faithfulness of `y_R` suffices for separation (Proposition 3.6, second half) | machine-checked |
| 5 | `profile_limit_preservation`, `yoneda_embedding_preserves_limits` | Proposition 3.7: the Yoneda embedding `y : C ⥤ (Cᵒᵖ ⥤ Type v)` preserves limits of all shapes and sizes (functor form); the representable form `yoneda.obj P` is machine-checked as well | machine-checked |
| 5 | `profile_prod_iso` | `y(A ⨯ B) ≅ y(A) ⨯ y(B)` (Proposition 3.7) | machine-checked |
| 5 | `profile_terminal_iso` | `y(⊤) ≅ ⊤` in the presheaf category (Proposition 3.7) | machine-checked |
| 6 | `representability_not_classification` | rank-two MCM modules over `k[x_ij]/(det)` for `n ≥ 3`: `y` fully faithful, no finite-variety parametrization (Theorem 3.9) | conjecture (C-1) — the Buchweitz–Leuschke wildness input is a literature theorem not mechanized; the Lean-side definitional language (`ParametrizedByFiniteVariety`) is machine-checked |
| 7 | `choi_correspondence` | `Φ ↦ J(Φ)` is a linear bijection `L(M_n, M_m) ≃ M_n ⊗ M_m` (Proposition 4.1) | machine-checked |
| 7 | `choi_trace_preserving` | `Φ` trace preserving ↔ `Tr_m J(Φ) = I_n` (Proposition 4.1) | machine-checked |
| 7 | (complete positivity ↔ `J(Φ) ≥ 0`) | `Φ` completely positive ↔ positive semidefinite Choi matrix (Proposition 4.1) | complete-informal-proof (Choi 1975; paper's proof) — not formalized: a Lean definition of complete positivity for the non-square block maps was out of scope for this module |
| 8 | `choi_composition` | `J(Ψ ∘ Φ)_{(iα),(jβ)} = Σ_{k,l} J(Φ)_{(ik),(jl)} J(Ψ)_{(kα),(lβ)}` (Equation (1)) | machine-checked |
| 9 | `supermap_representability` | in a symmetric monoidal process category with channel-state duality preserved by composition, categorical supermaps are concretely representable (Theorem 4.3) | conditional — registered input of the series (Wilson–Hefford–Hoffreumon 2026; Hefford–Wilson 2024), hypothesis: channel-state duality; not formalized (see C-2) |
| 10 | `monoidal_layer_insufficiency` | non-isomorphic finite groups with monoidally equivalent representation categories (Theorem 6.1) | conjecture (C-3) — Etingof–Gelaki isocategorical groups not mechanized |
| 10 | (fusion-ring shadow) | `D₈` and `Q₈` have isomorphic fusion rings but are non-isomorphic (Proposition 6.2) | computational-evidence (`src/vol-04-yoneda-classification/fusion_rings.py`) — the character-table computation is not mechanized (see C-4) |

## Supporting lemmas (module-internal)

| Name | Statement | Status |
|---|---|---|
| `sum_single_smul` | `X = Σ_{i,j} X_ij • E_ij` (matrix-unit expansion) | machine-checked |
| `map_eq_sum_single` | `Ψ(Y)_{αβ} = Σ_{i,j} Y_ij Ψ(E_ij)_{αβ}` | machine-checked |
| `partialTrace` | `(Tr_m J)_{ij} = Σ_α J_{(i,α),(j,α)}` | machine-checked |
| `ofChoi` | inverse assignment `J ↦ (X ↦ Σ_{i,j} X_ij J_{(i,α),(j,β)})` | machine-checked |

## Skipped targets (secondary list of the targets file)

| Name | Statement | Status |
|---|---|---|
| `gelfand_duality` | equivalence `KHausᵒᵖ ≃ CCStar` (Theorem 5.1) | complete-informal-proof (Gelfand–Naimark 1943) — C*-algebra machinery out of scope |
| `stone_duality` | equivalence `Boolᵒᵖ ≃ KHaus₀` (Theorem 5.2) | complete-informal-proof (Stone 1936) — not formalized |
| `doplicher_roberts_reconstruction` | symmetric tensor C*-category with conjugates ≃ unitary reps of a compact supergroup (Theorem 5.3) | complete-informal-proof (Doplicher–Roberts 1989) — not formalized |
| `fusion_ring_separation` | fusion-ring data does not determine the group (Proposition 6.4/6.2) | computational-evidence — see C-4 |
