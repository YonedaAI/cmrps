# Metadata: vol-03-irreducibility-decomposition

**Paper:** `papers/latex/vol-03-irreducibility-decomposition.tex` (Irreducibility and Decomposition, CMRPS Part 3)
**Date:** 2026-10-30

## Novelty assessment

The paper's classification content (block decomposition of unital finite-dimensional complex
C*-algebras, dimension vector as complete invariant, multiplicity-matrix classification of
unital *-homomorphisms) is established mathematics assembled and proved in one place as the
series' designated first concrete theorem model (DEP-001). The multiplicity-matrix formulation
of the homomorphism classification (Theorem 4.2) with its explicit arithmetic constraints and
the resulting exact conjugacy-class counts for small block pairs is a formulation chosen for the
program's decomposition language; the underlying classification of *-homomorphisms of matrix
blocks is standard. The paper's original contribution is architectural: it separates
decomposition existence, decomposition uniqueness, reconstruction from constituents, and
impossibility of unrestricted uniqueness into distinct regimes, and it marks each boundary with
a theorem (ensemble nonuniqueness, Kraus normal form without classification, wildness
forbidding parameterization). No claim of first discovery is made anywhere.

## Literature coverage

Primary sources cited and resolved (see `reviews/vol-03-irreducibility-decomposition-bib-check.md`):
Bekkert-Drozd, Buchweitz-Leuschke (arXiv and published Amer. J. Math. 129 (2007)),
Choi, DHR, Doplicher-Roberts (two papers), Gelfand-Naimark, Grevstad-May, Grochow-Qiao,
Kraus, McDuff, Muger, Murray-von Neumann, Murphy (monograph), Solomon, Stinespring.
Coverage matches the corpus entries [2], [8]-[12], [16], [21], [42], [55]-[58]. Known gap:
the survey that organizes the series ran on arXiv plus known-URL discovery, so non-arXiv
operator-algebra literature may be under-covered; the entries used here were resolved against
Crossref, arXiv, and journal tables of contents independently.

## Proof-status summary

- Proved in full in the paper: Lemma 3.1, Lemma 3.2, Theorem 3.3, Corollary 3.4,
  Proposition 3.7, Theorem 4.2, Corollary 4.3, Proposition 4.5, Proposition 5.1,
  Proposition 5.2 (mixed case), Theorem 6.2, Proposition 8.1, Corollary 8.2,
  Proposition 9.1, Proposition 9.2, Corollary 11.3.
- Established in the literature, stated with hypotheses: Stinespring (Theorem 6.1),
  Gelfand-Naimark (Theorem 7.1), direct-integral decomposition, McDuff's theorem,
  tame-wild dichotomy, wildness of the generic determinant, Grochow-Qiao, Grevstad-May.
- Conditional: Doplicher-Roberts reconstruction (Theorem 7.2) on the DHR hypotheses;
  the uniqueness clause fails when the hypotheses are relaxed (Muger).
- Conjectural: the structural generation identity Phys_adm = <F>_C (Section 8 remark).
- Open: unique decomposition of interacting systems; any isomorphism classification of channels.
- Computational evidence: the Haskell instances and Python experiments; nothing is machine-checked.

## Open problems recorded

1. Uniqueness of decomposition for interacting systems outside restricted subclasses
   (finite-dimensional quantum systems with fixed tensor structure, finite groupoid models,
   selected TQFT classes are the named candidates).
2. Tameness of the physical representation categories as opposed to generic algebras
   (where exactly the wild boundary sits for physical models).
3. Whether the probe/reconstruction pattern unifies with the relational characterization of
   objects into one principle (open in the series).
4. Behavior of decomposition under the limiting procedures of the construction list
   (blocks can pass to direct integrals; continuity of decomposition is not claimed).
5. The admissibility conditions (DEF-020) and the physical equivalence relation remain unfixed;
   every theorem here is written not to depend on them.

## Connections to other volumes

- vol-01 (foundations): definitions of the tuple, morphisms, equivalence, admissibility are
  reused; this volume adds the decomposition layer (DEF-021 to DEF-024 instantiated).
- vol-02 (structural families): the dimension vector is the classifying invariant of Family II
  in the finite-dimensional regime; construction arithmetic feeds the closure question.
- vol-05, vol-06 (per-family volumes): the block decomposition is the input theorem model
  (DEP-001) for vol-06; the normal-form prohibition (Kraus rank) is honored there too.
- vol-11 (completeness and obstructions): the wildness results and McDuff's theorem are raw
  material for the obstruction register; the counterexample section here (uniqueness does not
  imply parameterization) is the kind of boundary statement vol-11 collects.
- vol-12 (assembly): the division of labor stated in the conclusion (classification where
  invariants are finite or parametric, reconstruction where probes suffice, impossibility
  where neither) feeds the assembly layer.

## Dependency legality

May-depend-on inputs used: vol-01-02 definitions; T-BG-06 (finite-dim C* decomposition,
DEP-001 direct); T-BG-09 (DR under DHR hypotheses, DEP-003); T-BG-15 (Stinespring as normal
form); T-BG-16 (Gelfand-Naimark as reconstruction contrast); T-OB-04 (wildness boundary).
Mcduff's impossibility (T-OB-01) is used only as obstruction content (existence of
non-classifiable factors), never as a factor classification; no result depends on classifying
general factors. Unique decomposition of interacting systems is never assumed; all statements
are restricted-subclass. The CMRPS conjecture appears only as a conjectural identity.
