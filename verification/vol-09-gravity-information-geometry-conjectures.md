# Conjectures — vol-09-gravity-information-geometry

Unproved statements of the volume, as text, numbered `C-<n>`. None is used as a lemma
in `lean/Cmrps/Vol09GravityInformationGeometry.lean`. Section A records the genuinely
open statements of the paper (label `conjecture` / `open-problem`). Section B records
statements the paper or the cited literature proves but this module could not complete
in Lean (label `complete-informal-proof`); they are listed here per the module-writer
protocol so that no unproved Lean statement enters the module.

## A. Genuinely open statements

## C-1 — Which monotone metric? (Open question 1)

Does a physical principle independent of gravity select a member `f` of the Petz family
for a general gravity-information dictionary, or does the metric ambiguity of
Proposition 4.2 persist in every such application? Partial selections exist (BKM from
the relative-entropy expansion of Lemma 3.1; SLD from quantum estimation), and no
general principle is on record. Label: `open-problem`.

## C-2 — Continuum convergence of weighted-nerve constructions (Open question 2)

Do the finite-groupoid and weighted-nerve constructions of the emergent-spacetime
program converge to a continuum geometry, and under which conditions? No convergence
estimates are on record. Label: `open-problem`.

## C-3 — The entropy formula in general settings (Open question 3)

What replaces the Ryu–Takayanagi formula where extremal surfaces fail, and what is its
status for general excited states? Derived only for spherical vacuum regions and by
replica methods in static/covariant form. Label: `conjecture` (proposal with derived
special cases).

## C-4 — Curvature as physics (Open question 4)

Under what hypotheses does the curvature of an information-geometric metric correspond
to a physical interaction or to spacetime curvature? The thermodynamic reading holds in
the two computed models (ideal gas flat, van der Waals curved) and is a proposed
correspondence beyond them. Label: `conjecture`.

## C-5 — Petz family in infinite dimensions (Open question 5)

How do the Petz family and the commutative-locus uniqueness behave on state spaces of
quantum field theory (type III factors, modular theory)? The finite-dimensional proofs
of this paper do not apply. Label: `open-problem`.

## C-6 — Reconstruction of interacting dynamics (Open question 6)

Can a reconstruction theorem in the sense of Definition 2.10 recover interacting
dynamics from probe data? Every reconstruction result on record recovers structure, not
evolution. Label: `open-problem`.

## C-7 — The gravity–information correspondence (Remark 10.1)

The three-entry dictionary (boundary entropy → bulk geometry; state-space metric →
physical geometry; entanglement structure → gravitational dynamics) is proposed, not
proved. No unconditional derivation of Einstein's equations from information-theoretic
axioms is on record; the conditional derivations (Jacobson 1995; Faulkner et al. 2014;
Lashkari et al. 2014; Jacobson 2016) each assume geometric input. Label: `conjecture`.

## C-8 — Emergence of spacetime connectivity from entanglement (Remark 8.2)

Van Raamsdonk's argument (disentangling boundary degrees of freedom pinches the bulk)
is an argument from controlled examples; it does not derive the metric from
entanglement data. Label: `conjecture`.

## B. Proved but not mechanized here (text only; see claim-status for labels)

## C-9 — Chentsov uniqueness (Target 3, Thm 3.4)

On the probability simplices, the Fisher family is the unique family of Riemannian
metrics, up to a single positive constant shared across dimensions, that is monotone
under stochastic maps. Proved by Chentsov (1982); Petz–Sudar (1999) give the
contraction form. Not mechanized. Label: `complete-informal-proof`.

## C-10 — Petz–Sudar classification (Target 4, Thm 4.1)

Monotone metric families on finite-dimensional state spaces correspond exactly to
operator monotone `f : (0,∞) → (0,∞)` with `f(t) = t f(1/t)`, normalized by `f 1 = 1`,
via Eq. (2.7). Proved by Petz (1996), Petz–Sudar (1996, 1999). Not mechanized.
Label: `complete-informal-proof`.

## C-11 — Qubit SLD geometry is an open hemisphere (Target 7, Prop. 5.1 conclusion)

With `g^sld = |dr|² + (r·dr)²/(1-|r|²)` the open qubit state space is isometric to an
open hemisphere of the round three-sphere of radius one (`r = sin χ`). Only the radial
and transverse components are mechanized (`sld_qubit_transverse`, `sld_qubit_radial`,
`sldBlochForm_*`). Label: `complete-informal-proof`.

## C-12 — Fidelity metric equals one quarter SLD (Target 8, Def. 2.8 / Prop. 5.2)

In the normalization `d_B² = 2(1-√F)` the fidelity metric equals `¼ g^sld` in every
dimension (Hübner 1992; Braunstein–Caves 1994), verified computationally in dimensions
two to four. Not mechanized. Label: `complete-informal-proof` (qubit proof) plus
`computational-evidence` (d = 2–4).

## C-13 — Ideal-gas Ruppeiner scalar curvature vanishes (Target 9, Prop. 9.1)

The Ricci scalar of the ideal-gas Ruppeiner metric vanishes identically. The
log-coordinate form is mechanized (`ideal_gas_ruppeiner_flat`); the curvature
conclusion is the paper's coordinate-change argument. Label: `complete-informal-proof`.

## C-14 — Holographic entropy cone for N ≤ 4 (Target 10, Thm 8.4)

For `N = 2, 3, 4` boundary subregions of a static holographic state purified by a
complement, subadditivity, Araki–Lieb, and monogamy of mutual information generate the
complete set of linear entropy inequalities (Bao et al. 2015; Hernández-Cuenca 2019 for
`N = 5` and the `N ≥ 6` open case). Not mechanized. Label: `complete-informal-proof`.
