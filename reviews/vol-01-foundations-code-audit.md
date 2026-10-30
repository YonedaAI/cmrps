---
reviewer: codex (OpenAI) gpt-6.1-sol
type: code-audit
paper: vol-01-foundations
round: 2
date: 2026-10-30T03:03:18Z
---
--------
--------

ROW 1 | Disjoint-union irreducibles are one-point records | SUPPORTS | Enumerates every nontrivial split for cardinalities one through eight and checks that only singletons are irreducible.
ROW 2 | Cardinality classifies finite classical records | SUPPORTS | Counts bijective record maps for every pair of cardinalities one through four and checks the expected isomorphism counts.
ROW 3 | Product irreducibles have prime cardinality | SUPPORTS | Enumerates nonunit factor pairs through cardinality sixty and compares irreducibility with primality.
ROW 4 | Finite dynamical records decompose uniquely into components | SUPPORTS | Enumerates all self-maps on one through four points and checks that every invariant partition coarsens the connected-component partition.
ROW 5 | Embedding followed by coarse-graining can be untyped | SUPPORTS | Constructs the stated constant composite, checks its failed injectivity and surjectivity, and excludes limiting procedures by the stipulated finite-map restriction.
ROW 7 | Taxonomy instances compile and run their demo | SUPPORTS | The named transcript records compilation against the shared taxonomy modules and completed demo output matching the instance implementation.

VERDICT: PASS

---
PIPELINE LOG: code-audit cap of 2 invocations reached. Row 6 of the appendix (two-qubit factorization entropy) was assessed not fully supported in round 2, was removed from the paper together with its claim, and is not listed as computational evidence; Proposition 7.6 remains in the paper with its proof. WARN: code-audit removed 1 rows. The six surviving rows of round 2 were each assessed SUPPORTS and are reproduced above verbatim.
