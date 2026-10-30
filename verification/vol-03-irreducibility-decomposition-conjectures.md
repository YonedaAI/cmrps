# Conjectures and open problems: vol-03-irreducibility-decomposition

**Paper:** `papers/latex/vol-03-irreducibility-decomposition.tex`
**Module:** `lean/Cmrps/Vol03IrreducibilityDecomposition.lean`
**Date:** 2026-10-30
**Role of this file:** unproved statements of this volume, recorded as text. None of
these appears as a Lean declaration; none is claimed as proved. Numbered `C-<n>`.
Statements proved in the paper but not mechanized are NOT listed here — they appear
in `vol-03-irreducibility-decomposition-claim-status.md` with label
`complete-informal-proof` (partial mechanization where it exists).

---

**C-1** (paper `rem:generation`; ledger 8.3; label: `conjecture`)
**Structural generation identity.** Every admissible physical system is of the form
`P ≃ F(I_1, …, I_n)` with `I_i` irreducible relative to the composition data of `P`,
i.e. `Phys_adm ≃ ⟨𝔉⟩_𝒞` for the fundamental families `𝔉` and admissible constructions
`𝒞`. Proved only in the restricted regime of this volume: unital finite-dimensional
complex C*-algebras are direct sums of the irreducible blocks `M_n(ℂ)` (paper Thm 3.3).
In general the admissibility conditions defining `Phys_adm` are not yet fixed, so the
identity is not even fully formulated; nothing in this volume depends on it.

**C-2** (paper `rem:interacting`; ledger 5.3; label: `open-problem`)
**Unique decomposition of interacting systems.** Whether interacting physical
systems admit unique decompositions outside restricted subclasses (finite-dimensional
quantum systems with fixed tensor structure, finite groupoid models, selected classes
of topological field theories). Entanglement, gauge redundancy, emergence, and
coupling each obstruct naive decomposability. No theorem states uniqueness in
general; the failure modes are open problems rather than refuted conjectures.

**C-3** (paper `rem:prohibition`; ledger 6.3; label: `open-problem`)
**Channels are not classified by normal-form invariants.** Kraus rank is an invariant
of the Stinespring/Kraus normal form and not an isomorphism invariant of channels:
the identity channel and conjugation by Pauli `Z` on `M_2(ℂ)` both have minimal Kraus
count 1 and are not unitarily equivalent (fixed-point algebras have dimensions 4 and 2).
No isomorphism classification of channels up to unitary equivalence appears in the
open-quantum-systems literature; whether any complete finite-parameter invariant
exists is open. The prohibition itself (Kraus rank separates nothing) is proved in
the paper (Thm 6.2 + `ex:equal-count`); what is open is the nonexistence of any
replacement classification.

---

## Mechanization goals (not conjectures)

The following are proved in the paper but not mechanized in this module. They are
recorded here only as a work queue; their status remains
`complete-informal-proof` in the claim-status file.

- **M-1.** Abstract block decomposition (paper Thm 3.3) for arbitrary unital
  finite-dimensional complex C*-algebras: needs Jacobson-radical vanishing for
  C*-algebras, Artin–Wedderburn, and unitary conjugacy of C*-involutions on `M_n(ℂ)`.
- **M-2.** Dimension vector as a complete invariant (Cor. 3.4): depends on M-1.
- **M-3.** Unital *-homomorphisms up to unitary conjugacy ↔ multiplicity matrices
  (Thm 4.2): needs blockwise unitary conjugation of matrix embeddings.
- **M-4.** `Aut(A)/Inn(A)` = block permutations (Cor. 4.3): depends on M-3.
- **M-5.** Tensor block `*`-isomorphism `M_n(ℂ) ⊗ M_m(ℂ) ≅ M_{nm}(ℂ)` as an `AlgEquiv`
  (Prop. 8.1): only dimension arithmetic is mechanized here.
- **M-6.** Completeness direction of `cor:closure`: every multiset of products of the
  generators is realized by direct sums of tensor products of generator blocks.
- **M-7.** States on a direct sum (Prop. 3.7): needs positivity of matrix blocks;
  the commutative case (states on `ℂ^k` = probability vectors) is the tractable entry.
- **M-8.** Module factorization (Prop. 4.5): needs semisimple module theory over
  product rings.
- **M-9.** Kraus normal form (Thm 6.2): needs PSD factorizations of the Choi matrix
  and unitary mixing of minimal Kraus families.
