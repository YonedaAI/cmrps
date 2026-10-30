# Claim status: vol-08-spacetime-reconstruction

Module: `lean/Cmrps/Vol08SpacetimeReconstruction.lean` (namespace `Cmrps.Vol08`).
Written 2026-10-30. Labels follow `docs/theorem-registry.md`:
`machine-checked` (formalized in the module; the assembler promotes
to `machine-checked` after a clean `lake build`), `complete-informal-proof`,
`conditional`, `conjecture`, `computational-evidence`, `open-problem`.

Target totals: 10 mechanization targets; 4 with Lean content in the module
(targets 4, 8, 10 fully at the order/entropy-vector level; target 5 partial);
6 recorded below without formalization (deep cited theorems outside Mathlib).

## Formalized claims (all `machine-checked`)

| Claim name | One-line statement | Label | Paper source |
|---|---|---|---|
| `Past` | `Past r x = {y | r y x}`, strict chronological past of a relation | machine-checked | Def 2.2 (strict reading) |
| `Future` | `Future r x = {y | r x y}`, strict chronological future | machine-checked | Def 2.2 (strict reading) |
| `IsDistinguishing` | Past-distinguishing and future-distinguishing hold separately: the past map and the future map are each injective | machine-checked | Def 2.3 |
| `no_increasing_loop` | No chain `g 0 < g 1 < ⋯ < g n < g 0` exists in a preorder | machine-checked | Prop 6.3 (prop:finiteposet) |
| `interval_finite` | Every order interval `{z | x ≤ z ∧ z ≤ y}` of a finite order is finite | machine-checked | Prop 6.3 (prop:finiteposet) |
| `interval_compact` | Order intervals of a finite order are compact in any topology | machine-checked | Prop 6.3 (prop:finiteposet) |
| `antichain_fails_distinguishing` | The two-point antichain has equal empty pasts and equal empty futures for distinct points | machine-checked | Prop 6.4 (prop:distinguish) |
| `ladder_nontransfer_finite_orders` | A finite order (two-point antichain) passes the compactness rung while failing distinguishing | machine-checked | Cor 6.5 (cor:notransfer) |
| `Ssa` | `Ssa S := ∀ u v, S (u ∪ v) + S (u ∩ v) ≤ S u + S v` | machine-checked | Def 2.5 (eq:ssa) |
| `Subadditive` | `Subadditive S := ∀ u v, S (u ∪ v) ≤ S u + S v` | machine-checked | Def 2.5 |
| `ArakiLieb` | `ArakiLieb S := ∀ u v, |S u − S v| ≤ S (u ∪ v)` | machine-checked | Def 2.5 |
| `Mmi` | `Mmi S A B C := S A + S B + S C + S (A ∪ B ∪ C) ≤ S (A ∪ B) + S (A ∪ C) + S (B ∪ C)` | machine-checked | Def 2.5 (eq:mmi) |
| `MutualInfo` | `I(A:B) = S A + S B − S (A ∪ B)` | machine-checked | Def 2.5 |
| `CondMutualInfo` | `I(A:B|C) = S (A ∪ C) + S (B ∪ C) − S (A ∪ B ∪ C) − S C` | machine-checked | Def 2.5 |
| `TripartiteInfo` | `I₃(A:B:C) = I(A:B) + I(A:C) − I(A:BC)` | machine-checked | Def 2.5, Prop 8.4 |
| `correlatedTripleWitness` | Entropy function of the perfectly correlated triple: `S u = 0` if `u = ∅` else `1` | machine-checked | Prop 8.2 (prop:mmi) |
| `correlatedTripleWitness_ssa` | The witness satisfies every strong subadditivity inequality | machine-checked | Prop 8.2 (prop:mmi) |
| `correlatedTripleWitness_mmi_fails` | The witness violates monogamy on the triple of single regions (4 ≰ 3) | machine-checked | Prop 8.2 (prop:mmi) |
| `correlatedTripleWitness_mmi_margin` | On the witness the monogamy left side is 4, the right side is 3 | machine-checked | Prop 8.2 margin paragraph |
| `mmi_independent_of_ssa` | Strong subadditivity holds and monogamy fails on one vector, so monogamy is not implied by strong subadditivity over three-region entropy functions | machine-checked | Prop 8.2 (prop:mmi), target 8 |
| `correlatedTripleWitness_clean` | The witness is nonnegative, zero on ∅, and satisfies subadditivity, Araki-Lieb, and SSA; it violates only monogamy | machine-checked | Lemma 8.6 (lem:witnessclean) |
| `mmi_iff_information_form` | `Mmi S A B C ↔ I(A:B) + I(A:C) ≤ I(A:BC)` | machine-checked | Prop 8.4 (prop:mmiform) |
| `mmi_iff_tripartite_nonpos` | `Mmi S A B C ↔ I₃(A:B:C) ≤ 0` | machine-checked | Prop 8.4 (prop:mmiform) |
| `cmi_factorization` | `I(A:C|B) = I(A:BC) − I(A:B)` | machine-checked | Lemma 8.5 proof step |
| `ssa_of_subadditive_and_mmi` | SSA `I(A:C|B) ≥ 0` follows from subadditivity `I(A:C) ≥ 0` plus monogamy | machine-checked | Lemma 8.5 (lem:ssaredundant) |
| `upSetTopology` | The up-set (Alexandroff) topology: opens = upper sets | machine-checked | Prop 9.4 (prop:specialization) |
| `isOpen_iff_isUpperSet` / `isClosed_iff_isLowerSet` | Opens of the up-set topology are exactly the up-sets; closed sets are exactly the down-sets | machine-checked | Prop 9.4 proof step |
| `exists_upperSet_separating` | Distinct points of a partial order are separated by an up-set | machine-checked | Prop 9.4 (prop:specialization) |
| `closure_singleton_eq_downset` | `cl({x}) = {y | y ≤ x}` in the up-set topology | machine-checked | Prop 9.4 (prop:specialization) |
| `le_iff_mem_closure` | `x ≤ y ↔ x ∈ cl({y})`, the order is recovered from the closures | machine-checked | Prop 9.4 (prop:specialization) |
| `upSetTopology_t0Space` | The up-set topology of a partial order is T₀ | machine-checked | Prop 9.4 (prop:specialization) |
| `specialization_order_recovery` | T₀ + closure-of-singleton = down-set + order recovery, combined | machine-checked | Prop 9.4, target 10 |
| `ThurstonGeometry3` | Inductive type of the eight Thurston model geometries of dimension three | machine-checked | Thm 7.1, Table 4 |
| `card_thurstonGeometry3` | `Fintype.card ThurstonGeometry3 = 8` | machine-checked | Thm 7.1 (type-level fragment) |

## Skipped or partial targets

| Target name | One-line statement | Label | Reason / notes |
|---|---|---|---|
| `lorentzian_holonomy_classification` | Indecomposable Lorentzian `Hol⁰` is the full group, a null-line-stabilizing group inside `sim(n−2)`, or symmetric isotropy; all entries realized | complete-informal-proof | Galaev 2015; requires Lorentzian holonomy theory absent from Mathlib. No Lean statement made. |
| `holonomy_product_rule` | `Hol⁰(g₁ ⊕ g₂) = Hol⁰(g₁) × Hol⁰(g₂)` for product metrics | complete-informal-proof | Paper Prop 5.3 via Ambrose-Singer; needs connections/holonomy, not formalized. |
| `causal_ladder_completeness` | The rung chain chronology ≤ ⋯ ≤ global hyperbolicity is strict with separating spacetimes | complete-informal-proof | Minguzzi-Sánchez 2008; Lorentzian causal theory not in Mathlib. |
| `ladder_nontransfer_finite_orders` | No increasing loop; intervals finite; antichain fails distinguishing; rungs do not transfer | machine-checked | Fully formalized at the order-theoretic level (see claims above). |
| `geometrization_dim3` | Every closed 3-manifold decomposes into pieces carrying one of exactly eight Thurston geometries | complete-informal-proof | Perelman/Thurston; only the eight-geometry type is formalized (`ThurstonGeometry3`, `card_thurstonGeometry3`); the decomposition theorem is not. |
| `tancer_unrecognizability_dim4` | Homeomorphism recognition of `#₉(S² × S²)` from finite triangulations is undecidable | complete-informal-proof | Tancer 2023; would need computability theory over triangulations; no Lean statement made. |
| `entropy_cone_n_le_4` | For n ∈ {2,3,4} the holographic entropy cone is cut out by SSA + MMI, finitely many RT inequalities | complete-informal-proof | Bao et al. 2015; the cone is defined through the RT prescription, so the statement is conditional on a proposal (see C-1). Not formalized. |
| `mmi_independent_of_ssa` | Perfectly correlated triple: all SSA hold, MMI fails (4 > 3); SSA follows from SA + MMI | machine-checked | Formalized over three-region entropy functions. The entropic realization of the witness (uniform bit) is complete-informal-proof (paper Prop 8.2); the SSA-from-SA+MMI step is `ssa_of_subadditive_and_mmi`. |
| `malament_causal_reconstruction` | A chronological-order-preserving bijection of distinguishing spacetimes (n ≥ 3) is a conformal diffeomorphism | complete-informal-proof | Malament 1977 with Hawking-King-McCarthy smooth upgrade; differential geometry not formalized. |
| `specialization_order_recovery` | Up-set topology is T₀; `cl({x}) = ↓x`; order recovered from closures | machine-checked | Fully formalized (for arbitrary partial orders; the paper's finite hypothesis is not needed). |

## Related paper claims outside the target list

| Claim name | One-line statement | Label |
|---|---|---|
| Prop 8.2 entropic realization | The witness vector is the entropy vector of a uniform shared bit | complete-informal-proof |
| Cor 8.3 (cor:classicalmmi) | MMI is not valid for general (even classical) states | complete-informal-proof (follows from Prop 8.2; the Lean theorem `mmi_independent_of_ssa` covers the vector-level independence) |
| `entropy_inequalities.py` probes | Witness SSA/MMI evaluation and classical sampling | computational-evidence |
| `causal_ladder_finite_posets.py` probes | 242 orders to 4 points: 33 distinguishing, no loops, antichain witness | computational-evidence |
| `alexandrov_reconstruction.py` probes | Closures equal down-sets on enumerated orders | computational-evidence |
| Remark 8.7 (op:cone5) | Facet lists of the entropy cone open for n ≥ 6 (n = 5 settled) | open-problem (see C-3) |
| Prop 4.1 (prop:incomplete) | Flat plane and flat cylinder share dimension, trivial holonomy, global hyperbolicity, and are non-isometric | complete-informal-proof (paper proof; not in target list, not formalized) |
