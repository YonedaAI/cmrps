# Lean mechanization targets: vol-11-completeness-obstructions

Paper: Completeness and Obstructions (Part 11 of The Classification of Mathematical
Representations of Physical Systems). Ten targets at most; each name matches the
paper's definition, lemma, proposition, or theorem. Statements are informal
sketches for a later Lean 4 + Mathlib phase; no .lean file is written here and no
kernel build exists, so no claim in this list is machine-checked.

## Targets

1. `ClassificationProgram` (paper, Definition 4.1).
   For a domain `D` with an equivalence `≃`, a classification program is a triple
   `(ι, Π, R)`: `ι` complete (`ι x = ι y ↔ x ≃ y`), `Π` a structured parameter space
   (algebraic family on a finite-dimensional variety, standard Borel parametrization,
   or finite combinatorial set) with a structure-compatible surjection onto the
   `≃`-classes, `R` a decision procedure for `x ≃ y` on finite presentations.

2. `FiniteVarietyParametrization` (paper, Definition 4.2).
   The isomorphism classes of a category `A` over a field `k` are parametrized by a
   finite-dimensional variety when a finite-dimensional `k`-variety `V` carries an
   algebraic family of objects whose fibers exhaust the isomorphism classes. A bare
   set-theoretic surjection from `V(k)` is explicitly not a parametrization.

3. `Regime` (paper, Definition 4.5).
   A seven-valued type: Parameterized, Unparameterized, ObstructionComplete, Open,
   Wild, Undecidable, DecidableButUnclassified, with the predicate that a domain
   occupies exactly one regime.

4. `CountableInvariantImpossibility` (paper, Lemma 4.3).
   If the isomorphism relation on `D` is not Borel reducible to the isomorphism of
   any class of countable structures, then no complete invariant of `D` takes values
   in a space of countable structures; if `D` has uncountably many classes, no
   complete invariant takes values in a countable set.

5. `ObstructionTransport` (paper, Theorem 5.2).
   For a fully faithful functor `F : A → C` injective on isomorphism classes:
   uncountability of classes and absence of countable-valued complete invariants
   transport from `A` to `C`; when the object spaces are standard Borel and `F` acts
   Borel-measurably, absence of classification by countable structures transports as
   well; a wild embedding transports composed with `F`, and non-parametrization holds
   for the essential image of the wild module category.

6. `UndecidabilityTransport` (paper, Proposition 5.5).
   If a recognition problem `Q` for a class `C` many-one reduces from a Markov
   property of finitely presentable groups via a computable map `φ`, then `Q` is
   algorithmically undecidable.

7. `FiniteSporadicFails` (paper, Proposition 5.6).
   The separable II₁ factors and the four-dimensional maximal model geometries
   refute any decomposition of a completed classification into infinite families
   plus finitely many exceptional objects.

8. `TwoRegimeFails` (paper, Proposition 5.7).
   Unknot recognition (decidable, unclassified) and the finite simple groups
   (classified, unparameterized) refute a two-regime classified/impossible taxonomy.

9. `IsocategoricalEquivalenceFails` (paper, Proposition 5.8).
   Plain tensor equivalence of finite-group representation categories is strictly
   coarser than isomorphism on groups, so classification at that layer merges
   distinct systems.

10. `RegimeAssignment` (paper, Table 4 and the regime inventory script).
    The assignment of the 29 surveyed domains to the seven regimes is a total
    single-valued function, checked mechanically by
    `src/vol-11-completeness-obstructions/regime_inventory.py` (`check_partition`).

## Status discipline

Every target above is a statement to be formalized later. Targets 5 and 6 have
complete informal proofs in the paper; targets 4, 7, 8, 9 have complete informal
proofs with inputs cited to the mathematical literature; targets 1, 2, 3, 10 are
definitions or data properties. None is machine-checked. The executable Haskell
and Python artifacts of the volume are computational evidence only.
