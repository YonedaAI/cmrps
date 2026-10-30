# Lean consolidated Codex review (final)

Package `Cmrps` (12 volume modules + `Cmrps.lean`), Lean 4.35.0, Mathlib pinned at
rev `56a005855ea17e0b0958f73ec801ae140b0a1679`. Reviews run through the Codex lane
protocol (`env -u OPENAI_API_KEY`, read-only, slot `#1`), scope `lean/` +
`papers/latex/*.tex`, house rule: no style nits on dashes. Review budget used:
3 invocations (rounds 1-3 = 2 fix passes), as specified.

## Round 1 — VERDICT: NEEDS_FIX (8 issues)

Full transcript: `reviews/lean-codex-review-round-1.md`. Issues and disposition:

1. **High — Vol11 undecidability transport vacuous** (`DecidableProblem` classically
   trivial). FIXED: scope caveats added to `Recognizer`, `DecidableProblem`,
   `UndecidabilityTransport`; claim rows demoted to `complete-informal-proof` /
   `conditional` (named hypothesis `hmarkov`: Adyan-Rabin; computability of `φ`
   unformalized).
2. **High — Vol10 Petz skeleton** omitted operator monotonicity and had false cases.
   FIXED (round 1): `SelfReciprocal` restricted to `x > 0`; skeleton caveats. (See
   round 2/3 for the remaining hypothesis work, also applied.)
3. **High — Vol02 `Independent`** collapses to cardinality comparison. FIXED:
   object-level-shadow caveats on `SpecialCase`/`Reconstructable`/`Independent`;
   claim row 9.0 demoted to `complete-informal-proof`.
4. **Medium — Vol08 `IsDistinguishing`** weaker than the paper. FIXED: redefined as
   `Function.Injective (Past r) ∧ Function.Injective (Future r)`; antichain and
   ladder proofs updated; claim row updated.
5. **Medium — Vol04 limits theorem** stated for the wrong functor. FIXED: added
   `yoneda_embedding_preserves_limits` (the paper's Prop 3.7) via Mathlib's
   `yonedaFunctor_preservesLimits`; `profile_limit_preservation` re-documented as the
   representable form.
6. **Medium — Vol12 `NotFactoring`** did not express failure of factorization. FIXED:
   docstrings rescope the claim to inequality of induced equivalence relations; claim
   rows rescoped.
7. **Medium — Vol12 `MonotoneMetricGapQuantum`** over-claimed metric conclusions.
   FIXED: docstring + claim row now state function distinctness only; metric-level
   conclusion pointed at Vol09 `quantum_monotone_metrics_not_unique` (informal).
8. **Medium — Mathlib reimplementation** (3 spots). PARTIALLY FIXED: see round 3.

## Round 2 — VERDICT: NEEDS_FIX (5 issues)

Full transcript: `reviews/lean-codex-review-round-2.md`. Round-1 fixes verified by the
reviewer. Issues and disposition:

1. **Petz skeleton** still lacked operator monotonicity / `n ≥ 2` / positivity.
   FIXED: `petz_sudar_parametricity` now takes an explicit `OperatorMonotone`
   parameter, requires `2 ≥ n`, positive eigenvalues and symmetric tangents.
2. **Vol02 cotangent** only a trivial-bundle model. FIXED: rescope to the
   product-bundle fragment (`Q × V`); full `T*Q` statement marked unformalized in
   docstring + claim row 7.3 demoted to `complete-informal-proof`.
3. **Vol02 no-local-classifier** only germ constancy. FIXED: docstring + claim row
   2.1 rescoped to germ constancy (paper reading marked `complete-informal-proof`).
4. **Vol03 block closure** silently adjoins the tensor unit. FIXED: `sizeSemigroup` /
   `ClosedVectors` docstrings and claim rows D6/D7 document the unit-adjoined closure.
5. **Mathlib reuse** incomplete. FIXED (round 2): `mem_product` is now a thin alias of
   `Multiset.mem_product`; `subtypeEquivOfEq` aliases `Set.equivOfEq`.

## Round 3 — VERDICT: NEEDS_FIX (3 issues)

Full transcript: `reviews/lean-codex-review-round-3.md`. Round-2 fixes (2)-(5)
verified; `CategoryData` in Vol01 accepted as the deliberately retained paper-facing
model. Issues and disposition (applied post-round; see residual risk below):

1. **Petz injectivity compared functions off-domain.** FIXED: the injectivity clause
   now uses `¬ Set.EqOn f g (Set.Ioi 0)`.
2. **Classification specifications quantified beyond valid states/tangents.** FIXED:
   `chentsov_fisher_uniqueness` and the Petz skeleton now restrict equalities to
   positive normalized states and, for Petz, symmetric zero-trace tangent directions.
   NOT ADDED: explicit cross-dimension compatibility for the Chentsov statement
   (requires a multi-`n` packaging; logged as remaining).
3. **Mathlib reuse** (3 spots). FIXED: Vol04 `sum_single_smul` now uses
   `Matrix.matrix_eq_sum_single`; Vol07 `map_list_sum` now uses
   `_root_.map_list_sum`. NOT REFACTORED: Vol08's `upSetTopology` section is kept as
   the paper-facing model (same rationale as `CategoryData`), rather than aliasing
   `Topology.upperSet`.

## Residual risk (logged honestly)

- All post-round-3 fixes were applied and `lake build` exits 0 with no `sorry` and no
  project axioms, but they were **not re-reviewed** (the 3-invocation budget was
  exhausted). Two of the three proof replacements were pre-verified to compile by the
  reviewer.
- Remaining unformalized paper content is labelled in
  `verification/claim-status-registry.md` and `verification/conjecture-registry.md`;
  no file claims more than the kernel granted.

VERDICT: NEEDS_FIX
