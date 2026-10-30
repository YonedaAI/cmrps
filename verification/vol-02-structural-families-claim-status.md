# Claim status: vol-02-structural-families

**Paper:** `papers/latex/vol-02-structural-families.tex`
**Module:** `lean/Cmrps/Vol02StructuralFamilies.lean` (namespace `Cmrps.Vol02`)
**Date:** 2026-07-11
**Status vocabulary** (exactly six, `docs/theorem-registry.md` §1):
`machine-checked` | `complete-informal-proof` | `conditional` | `conjecture` |
`computational-evidence` | `open-problem`.

`machine-checked` means the Lean kernel accepted the statement and proof in a
single-file typecheck (`lake env lean`); the assembler promotes the label to `machine-checked`
after the package build. No `sorry`, no `axiom` occurs in the module.

## Target 1 — `sharpness_criterion` (paper Theorem 3.2)

| # | Name | Statement (one line) | Status |
|---|---|---|---|
| 1.0a | `FamilyRecord` | A family record is a triple (objects, invariant range, invariant) with the invariant constant on `≃`-classes (paper Def. 2.1) | machine-checked |
| 1.0b | `FamilyRecord.Classifying` | The invariant is classifying when `I(P) = I(Q) → P ≃ Q`; invariant-complete records are those with a classifying invariant (paper Def. 2.1–2.2) | machine-checked |
| 1.1a | `FamilyRecord.inducedMap`, `inducedMap_mk`, `sharpness_well_defined` | The assignment `[P] ↦ I(P)` is well defined on `≃`-classes (Thm 3.2(1), well-definedness half) | machine-checked |
| 1.1b | `FamilyRecord.inducedMap_injective`, `classifying_iff` | For an invariant-complete record the induced map `F/≃ → V` is injective; completeness is exactly this injectivity (Thm 3.2(1)) | machine-checked |
| 1.2 | `FamilyRecord.sharpness_card_bound` | If `V` is finite with `|V| = N` then `|F/≃| ≤ N` (Thm 3.2(2)) | machine-checked |
| 1.3a | `FamilyRecord.sharpness_injects_into_superset` | The classes inject into any subset of the range containing the attained values of `I`, e.g. the `k`-points of a finite-type image (Thm 3.2(3), set-theoretic content) | machine-checked |
| 1.3b | Chevalley constructibility | The image of a morphism of finite type between varieties over an algebraically closed field is constructible, so the attained values of `I` form a constructible subset (Thm 3.2(3), geometric content) | conditional (on Chevalley; see C-1) |
| 1.4 | `FamilyRecord.sharpness_uncountable` | If `F/≃` is uncountable, no invariant-complete record for `F` has countable range (Thm 3.2(4)) | machine-checked |

## Target 2 — `globality_symplectic` (paper Proposition 3.4)

| # | Name | Statement (one line) | Status |
|---|---|---|---|
| 2.0 | `SymplecticGermField` | Symplectic germs of fixed dimension `2n` with symplectomorphism as equivalence; Darboux's theorem recorded as an input field | machine-checked |
| 2.1 | `globality_symplectic`, `GermInvariant`, `globality_no_local_classifier` | Every germ invariant (map on germs constant on symplectomorphism classes) is constant at every point of `M` and `N` (Prop. 3.4, constancy consequence) | machine-checked (germ constancy only; the paper reading "no local classifier" needs global objects, non-equivalent witnesses and a classifier predicate — `complete-informal-proof`, Codex review round 2) |
| 2.2 | Darboux's theorem | Every symplectic germ of dimension `2n` is symplectomorphic to the standard germ (input to 2.1, `n ≥ 1` hypothesis) | conditional (literature input; see C-6) |
| 2.3 | No germ invariant is classifying | Consequently classifying data for the symplectic family is global/topological (Prop. 3.4 conclusion, Cor. 3.5) | complete-informal-proof |

## Target 3 — `achievement_kinds_exhaustive` (paper Proposition 3.7)

| # | Name | Statement (one line) | Status |
|---|---|---|---|
| 3.0 | `AchievementKind`, `Sector`, `kindOf`, `KindApplies` | The five achievement kinds of paper Def. 3.6, determined by the three ordered conditions on a sector | machine-checked |
| 3.1 | `kindOf_applies`, `kindOf_unique`, `achievement_kinds_exhaustive` | Exactly one of the five achievement kinds applies to any sector; the five are pairwise exclusive and exhaustive (Prop. 3.7) | machine-checked |

## Target 4 — `dim_vector_classification` (paper Theorem 7.1)

| # | Name | Statement (one line) | Status |
|---|---|---|---|
| 4.0 | `DimensionVector`, `DimensionVector.Pos`, `DimensionVector.totalDim` | A dimension vector is a finite multiset of positive integers; total dimension is `Σ nᵢ²` (Thm 7.1 vocabulary) | machine-checked |
| 4.1 | Wedderburn structure theorem | Every unital finite-dimensional complex C*-algebra is `*`-isomorphic to `⊕ᵢ M_{nᵢ}(ℂ)` for a unique multiset `{nᵢ}` (Thm 7.1, structure + uniqueness) | conditional (literature input; see C-4) |
| 4.2 | `DimensionVector.dimVector_finite` | At fixed total complex dimension `d` the set of dimension vectors is finite (Thm 7.1, finiteness of the range) | machine-checked |
| 4.3 | Concrete counts | At total dimension 5 there are exactly 2 dimension vectors (`{2,1}`, `{1⁵}`); at dimension 4 exactly 2 (`{2}`, `{1⁴}`) | computational-evidence (`src/vol-02-structural-families/phaseD_dimension_vectors.py`) |

## Target 5 — `induced_dimension_vector` (paper Proposition 4.2)

| # | Name | Statement (one line) | Status |
|---|---|---|---|
| 5.0 | `DimensionVector.sum`, `DimensionVector.tensor` | The induced dimension-vector operations: multiset union for direct sum, multiset of pairwise products for tensor product (Prop. 4.2, invariant side) | machine-checked |
| 5.1 | `DimensionVector.totalDim_sum`, `DimensionVector.pos_sum` | Total dimension of a direct sum is the sum of total dimensions; positivity is preserved | machine-checked |
| 5.2 | `DimensionVector.totalDim_tensor`, `DimensionVector.pos_tensor` | Total dimension of a tensor product is the product of total dimensions; positivity is preserved | machine-checked |
| 5.3 | Algebra-side identification | The dimension vector of `A ⊕ B` is the multiset union and of `A ⊗ B` the multiset of products, for actual C*-algebras (Prop. 4.2 as stated) | conditional (on Wedderburn and `M_a(ℂ) ⊗ M_b(ℂ) ≅ M_{ab}(ℂ)`; see C-4, C-5) |

## Target 6 — `kraus_rank_not_injective` (paper Proposition 11.2)

| # | Name | Statement (one line) | Status |
|---|---|---|---|
| 6.0 | `Kraus.φ`, `Kraus.SameChannel`, `Kraus.IsUnitary`, `Kraus.KrausRep`, `Kraus.IsKrausRank` | Unitary channels `Φ_U(X) = U X U*`; equality of maps as the equivalence in force; Kraus rank as minimal representation length (Prop. 11.2 vocabulary) | machine-checked |
| 6.1 | `Kraus.kraus_rank_one`, `kraus_rep_one`, `not_kraus_rep_zero` | Every unitary channel of `M₂(ℂ)` has Kraus rank one (Prop. 11.2) | machine-checked |
| 6.2 | `Kraus.kraus_rank_not_injective` | Two distinct unitary channels (`1` and `diag(1,-1)`) both have Kraus rank one, so the assignment from channels to Kraus rank is not injective under equality of maps (Prop. 11.2) | machine-checked |
| 6.3 | PU(2) parametrization | `Φ_U = Φ_{U'}` as maps iff `U' = λU` with `|λ| = 1`; distinct unitary channels are in bijection with `PU(2)`, which is not a point (Prop. 11.2, remaining content) | complete-informal-proof (paper proof); Lean statement recorded as C-2 |
| 6.4 | Kraus rank is not classifying | One scalar of the Kraus normal form does not classify channels (Prop. 11.2 conclusion, remark) | complete-informal-proof |

## Target 7 — `cotangent_retract` (paper Proposition 4.1)

| # | Name | Statement (one line) | Status |
|---|---|---|---|
| 7.0 | `retraction` | The deformation `r_t(x, ξ) = (x, tξ)` of the total space `Q × V` onto its zero section (Prop. 4.1) | machine-checked |
| 7.1 | `retraction_one`, `retraction_comp`, `retraction_fixes_zero_section`, `retraction_zero_eq`, `retraction_zero_mem_zeroSection` | `r_1 = id`, `r_s ∘ r_t = r_{st}`, `r_t` fixes the zero section, `r_0` maps into the zero section | machine-checked |
| 7.2 | `continuous_retraction`, `continuous_retraction₂` | Each `r_t` is continuous; the deformation is jointly continuous in `t` and the point | machine-checked |
| 7.3 | `cotangent_retract` | The zero section is a deformation retract (Prop. 4.1 as formalized on the trivial product bundle `Q × V`) | complete-informal-proof (full `T*Q` version; the product-bundle fragment `Q × V` is machine-checked — Codex review round 2) |
| 7.4 | Homotopy-type consequence | Consequently the homotopy type of `T*Q` equals that of `Q`, and every homotopy invariant of `Q` is a global invariant of the symplectic record (Prop. 4.1 conclusion) | complete-informal-proof |

## Target 8 — `exceptional_not_closed` (paper Proposition 15.1)

| # | Name | Statement (one line) | Status |
|---|---|---|---|
| 8.0 | `ClosedUnder`, `closure`, `mem_closure`, `subset_closure`, `closedUnder_closure`, `closure_minimal` | `⟨E⟩_K` is the smallest class containing `E` and closed under the constructions `K` (paper §2) | machine-checked |
| 8.1 | `Irreducible` | An object irreducible under direct sum is not a sum of two nonzero objects | machine-checked |
| 8.2 | `exceptional_not_closed` | A nonempty class of nonzero objects each irreducible under direct sum is not closed under direct sum and `⟨E⟩_K` strictly contains `E` (Prop. 15.1) | machine-checked |
| 8.3 | `closure_generation` | `E` still generates its closure: the conclusion is non-closure, not non-generation (Prop. 15.1 distinction) | machine-checked |

## Target 9 — `invariants_not_independence` (paper Proposition 16.2)

| # | Name | Statement (one line) | Status |
|---|---|---|---|
| 9.0 | `StructuralFamily`, `SpecialCase`, `Reconstructable`, `Independent` | Logical independence of families per paper Def. 16.1: neither is a special case of the other and neither is reconstructable from the other | complete-informal-proof (paper Def. 16.1 is category-level; the formalized object-level shadows are machine-checked but classically degenerate — `Independent` is always false — see module scope note, Codex review round 1) |
| 9.1 | `HasClassifyingInvariant` | A family admits a classifying invariant when some map on its objects is injective | machine-checked |
| 9.2 | `not_independent_of_reconstructable` | Families related by a correspondence are not logically independent (Prop. 16.2 schema) | machine-checked |
| 9.3 | `invariants_not_independence` | Two families may each admit a classifying invariant and still fail to be independent: classifying invariants are silent on independence (Prop. 16.2) | machine-checked |
| 9.4 | Gelfand instance | Commutative unital C*-algebras and compact Hausdorff spaces each carry a classifying invariant and neither is independent of the other (Prop. 16.2, concrete witness) | conditional (on the Gelfand anti-equivalence; see C-3) |
| 9.5 | Independence of the ten families | Whether any two of the ten structural families are independent in the sense of Def. 16.1 | open-problem |

## Target 10 — `comparability_of_records` (paper Proposition 18.1)

| # | Name | Statement (one line) | Status |
|---|---|---|---|
| 10.0 | `subtypeEquivOfEq` | Subtype equivalence along an equality of sets (thin alias of Mathlib `Set.equivOfEq`) | machine-checked |
| 10.1 | `comparability_of_records` | Two classification records agreeing on family, sector, and equivalence and both naming classifying invariants have invariants related by a bijection between their attained values (Prop. 18.1) | machine-checked |

## Skipped targets (recorded, not formalized)

| Name | Statement (one line) | Status |
|---|---|---|
| `prop:components` (paper 2.5) | The five-tuple of component invariants need not classify a record (misses coupling) | complete-informal-proof (not a mechanization target this run) |
| `cor:parameterization` (paper 3.3) | Classification and parameterization are separate achievements | complete-informal-proof (follows from Thm 3.2(3) + C-1) |
| `thm:calg` structure existence | Existence of the Wedderburn decomposition `A ≅ ⊕ᵢ M_{nᵢ}(ℂ)` | conditional (literature input, C-4) |
| `prop:invariance`, `prop:recognition-cost` | Invariance under equivalence only; recognition cost | complete-informal-proof (not targets this run) |
| `prop:recognition` | Four-manifold homeomorphism undecidability excludes decidable classifying invariants | complete-informal-proof (from Tancer; not a target this run) |
| `prop:mixed` | Records may present structure from several families at once | complete-informal-proof (not a target this run) |
| `rem:cobordism` | Extended TQFTs classified by fully dualizable objects | conjecture (2009 proof is an informal sketch; recorded as a claim in the paper) |
| Fusion category classification | Classification of fusion categories | open-problem |
| Global symplectic invariants | A named finite or parametric list of global invariants of the symplectic family | open-problem |
| Closure identity | `Phys_adm ≃ ⟨F₁, …, F₁₀⟩_K` (ten families generate all admissible systems) | conjecture (research objective; used nowhere as a lemma) |
