# Conjectures — vol-04-yoneda-classification

Statements recorded as text because their proofs rest on literature inputs outside the
mechanization budget of `lean/Cmrps/Vol04YonedaClassification.lean`. Numbered `C-<n>` for
the consolidated registry.

## C-1 — Representability does not imply classifiability (paper Theorem 3.9)

Let `n ≥ 3`, `S = k[x_ij]` the polynomial ring over a field `k` in the entries of a generic
`n × n` matrix, `R = S/(det(x_ij))` the coordinate ring of the generic determinant hypersurface,
and `C` the category of finitely generated maximal Cohen-Macaulay `R`-modules of rank two with
`R`-module homomorphisms. Then `y` is fully faithful on `C` (formalized: `yoneda_fully_faithful`),
while `C` admits no parametrization by a finite-dimensional variety over `k` in the sense of
`ParametrizedByFiniteVariety` (paper Definition 3.8). Hence full faithfulness of the Yoneda
embedding does not imply existence of a classification theorem.

Why not formalized: the non-parametrization half is the classification result of Buchweitz and
Leuschke (Amer. J. Math. 129 (2007) 943–981), whose proof is a wildness theorem in the
tame–wild dichotomy for maximal Cohen-Macaulay modules. The definitional apparatus
(`Invariant`, `FiniteVarietyType`, `ParametrizedByFiniteVariety`) is machine-checked in the module;
the witness category and the wildness input are not.

## C-2 — Supermap representability (paper Theorem 4.3, conditional)

Let `T` be a theory of processes whose processes form a symmetric monoidal category under
sequential and parallel composition, equipped with a channel-state duality: a natural
identification of each process `Φ : A → B` with a state of the composite system `A ⊗ B`,
preserved by composition. Then the categorical supermaps of `T` are concretely representable
through that duality: every supermap corresponds to a process of the composite system, and
representability yields the factorisation theorems for causally ordered supermaps.

Why not formalized: registered input of the series (Wilson–Hefford–Hoffreumon, arXiv:2602.23865;
Hefford–Wilson, LICS 2024). The hypothesis (channel-state duality) is verified for finite
dimensional matrices by `choi_correspondence`/`choi_composition` in the module; the general
representability lemma is not re-proved. Status: **conditional** on the stated hypothesis.

## C-3 — Monoidal layer insufficiency (paper Theorem 6.1)

There exist non-isomorphic finite groups `G` and `H` whose categories `Rep(G)`, `Rep(H)` of
finite-dimensional complex representations are equivalent as monoidal categories (commutativity
constraint ignored), while the symmetric structures differ. Hence a monoidal equivalence of
representation categories does not recover the group; the symmetric monoidal layer is required.

Why not formalized: existence of isocategorical groups is Etingof–Gelaki (arXiv:math/0007196),
constructed by cohomological twisting of the symmetry; mechanizing that construction is out of
scope. The consequence for the series (Proposition 6.2, preserved-layer discipline) is stated in
the paper and is not independently formalized.

## C-4 — Fusion rings of `D₈` and `Q₈` (paper Proposition 6.2)

The dihedral group `D₈` of order eight and the quaternion group `Q₈` have isomorphic character
tables and isomorphic representation fusion rings, yet are not isomorphic groups. Fusion-ring
data therefore does not determine the group.

Why not formalized: the claim needs complex representation theory (characters, irreducibles,
fusion multiplicities) for two specific finite groups; the module records no representation
theory. Computational evidence: `src/vol-04-yoneda-classification/fusion_rings.py`
(`check_fusion_ring_iso`, `check_groups_distinct`). The group non-isomorphism half is elementary
(element orders outside the center differ) and could be formalized in a later phase.

## C-5 — The synthesis problem (paper Section 8, open problem)

Does categorical supermap representability (under channel-state duality) unify with the Gelfand,
Stone, and Doplicher–Roberts reconstruction pattern into one Yoneda-principle account, as
instances of a single density or representability statement for a probe category attached to the
object?

Status: **open-problem**. No theorem joins the two lines; the paper records the absence of a
unification theorem as a bound on its claims. Nothing in the module bears on this conjecture.
