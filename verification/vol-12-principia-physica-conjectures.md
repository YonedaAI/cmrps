# Conjectures — vol-12-principia-physica

Unproved statements of the volume, as text. None is used as a lemma in
lean/Cmrps/Vol12PrincipiaPhysica.lean.

## C-1 — Structural classification of admissible physical systems (Conjecture 7.1)

Let `Phys_adm` denote the class of mathematically admissible physical systems satisfying
explicitly stated consistency conditions. There exists a collection of fundamental
structural families `𝔉 = {𝔉_α}_{α ∈ A}` and a set of admissible constructions `𝔘` such that
`Phys_adm ≃ ⟨𝔉_α⟩_𝔘`. Five proof obligations: completeness, soundness, equivalence,
structural characterization (partial), decomposition (open in general).

## C-2 — Completeness of the constituent record beyond the two covered constructions

For the admissible constructions other than direct sums of finite-dimensional complex
C*-algebras and group extensions with fixed action, the constituent invariant record
`μ(P) = (F, {I(Iᵢ)}, g_P)` of Definition 8.2 is complete up to the stated equivalences.
Conditional on the five obligations of C-1 and on uniqueness of decomposition.

## C-3 — Four-dimensional Yang–Mills existence and mass gap (Clay problem)

A four-dimensional SU(N) quantum field theory exists (reflection positivity, continuum
limit) and its mass gap is strictly positive. The two conjuncts are separate: the
announced 2026 existence claim (CL-01) explicitly omits the mass gap and carries the
status "existence claimed; manuscript and formalization withheld; verification pending";
the Clay problem page lists the problem as unsolved.

## C-4 — Unification of the reconstruction patterns

Concrete representability of categorical supermaps (settings with channel-state duality)
and the classical reconstruction pattern of Gelfand, Stone, and Naimark join into a single
relational principle recovering objects from their probes.

## C-5 — Logical independence of the ten structural families

Whether any two of the ten candidate structural families of Table 1 are logically
independent. No theorem on record settles it; the families may later be unified.

## C-6 — Composition of observational equivalence in interacting regimes

Whether the observational equivalence `∼_E` of Definition 2.10 composes in interacting
regimes. The record contains no observation functor: domain, codomain, composition rule
with coarse-graining, and induced equivalence classes are all missing.
