# Conjectures and open problems: vol-08-spacetime-reconstruction

Unproved statements of `papers/latex/vol-08-spacetime-reconstruction.tex`, as
text, numbered `C-<n>`. These are NOT in `lean/Cmrps/Vol08SpacetimeReconstruction.lean`;
none of them is claimed as machine-checked. Labels follow `docs/theorem-registry.md`.

## Conjectures

**C-1 (conjecture).** Ryu-Takayanagi prescription. For a conformal field theory
with a classical Einstein dual, the entanglement entropy of a boundary region A
equals the area of a minimal bulk surface homologous to A in a static slice, in
units of 4G_N: S(A) = min_{γ_A ∼ A} Area(γ_A) / (4 G_N). Exact agreement is
known in AdS₃/2D CFT and for spherical entangling surfaces; a replica derivation
exists at the physics level for static bulk geometries. Not a theorem of
constructive quantum field theory. (Paper Remark 10.1, rem:rt.) The holographic
entropy cone of Theorem 8.1 is defined through this prescription, so Theorem 8.1
is a completeness statement about the cone of this proposal.

**C-2 (conjecture).** Entanglement-induced connectedness (van Raamsdonk).
Disentangling the degrees of freedom of two regions makes the regions pinch off
from each other, so the emergence of classically connected spacetime is tied to
quantum entanglement. Status: argument from examples, not a theorem. (Paper
Remark 10.3, rem:vanraamsdonk.)

**C-3 (conjecture / evidence scope).** HaPPY tensor-network codes realize the
Ryu-Takayanagi formula and negativity of tripartite information exactly inside
the toy models; this is evidence about tensor networks only, not about
gravity. (Paper Remark 10.2, rem:happy.) No claim here exceeds the toy models.

## Open problems

**C-4 (open-problem).** Entropy cone facets for n ≥ 6 regions. For fixed n ≥ 6
the number of independent RT inequalities is finite but the facet lists are
open; for general n only one infinite family of inequalities is known. (n = 5 is
settled by Hernández-Cuenca 2019; Remark 8.7, op:cone5. No verified resolution
found in sources reviewed, cutoff 2026-10-29.)

**C-5 (open-problem).** Completing the invariant list. The invariants of Table 1
(holonomy group, causal class, dimension) do not separate isometry classes
(Corollary 4.2, cor:notclassifies); which additional global invariants (topology,
global curvature data) complete such a classification is open.

**C-6 (open-problem).** The conformal factor. The chronological order leaves the
conformal factor undetermined (Corollary 9.2, cor:confactor). Whether the factor
is physically irrelevant or recoverable from additional probe data (volume form,
normalized time function, stress-energy) is not decided by any theorem in the
paper.

**C-7 (open-problem).** A determination theorem for spacetime from entanglement
data. Three items are needed (Remark 10.4, rem:upgrade): a probe datum of
entanglement data only, a proof that it determines a spacetime up to a declared
equivalence, and a demonstration that the geometry is not smuggled in at the
start. None of the three is established in the sources reviewed (cutoff
2026-10-29). Malament's theorem (Theorem 9.1) achieves the second item when the
probe datum is the causal order and the equivalence is conformal.

**C-8 (open-problem).** Recognition of S⁴. The recognition problem for S⁴ from
finite triangulations remains open (Introduction); Tancer's theorem covers
connected sums of nine copies of S² × S² only.

**C-9 (open-problem).** Classification of Lorentzian spacetimes up to isometry.
No complete classification by invariants is known; the volume's negative results
(Corollary 4.2, Theorem 7.3, Corollary 6.5) delimit what such a classification
can honestly claim.

## Formalization notes (not conjectures)

- The entropic realization of `correlatedTripleWitness` in Lean (that the vector
  is the Shannon-entropy vector of a uniform shared bit) is a formalization gap,
  not a mathematical conjecture: the identity is proved in the paper (Prop 8.2)
  and recorded as `complete-informal-proof` in the claim-status registry.
- Statements C-1 through C-9 are never used as premises of the module's theorems;
  the module's proofs are self-contained over Mathlib.
