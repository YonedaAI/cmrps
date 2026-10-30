# Claim ledger — vol-01-foundations

**Paper:** papers/latex/vol-01-foundations.tex (Foundations of Structural Classification, Part 1 of CMRPS)
**Date:** 2026-10-30. One row per theorem-level statement of the paper. Definitions,
examples, and remarks are excluded. Proof status uses the paper's own labels
(Definition 10.1): proved-in-paper means a complete proof is given in the paper, which
the label vocabulary records as complete-informal-proof. This ledger is a verification
artifact and no status label appears in the LaTeX prose.

| Item | Statement (one line) | Proof status | Used at |
|---|---|---|---|
| Proposition 4.4 | The five morphism kinds are not closed under composition: an embedding composed with a coarse-graining can satisfy no listed preservation law. | proved-in-paper (explicit counterexample on finite classical records) | Corollary 4.5; Definition 6.3; Section 11; conclusion |
| Corollary 4.5 | The morphism schema is not a category; three named repairs are required before inter-kind composition is defined. | proved-in-paper (from Proposition 4.4) | Definition 4.2 discussion; Proposition 4.6 discussion; Definition 6.3; Section 11 |
| Proposition 4.6 | Coarse-grainings, embeddings, and equivalence morphisms are each closed under self-composition. | proved-in-paper (direct verification of the laws) | Definition 6.3; Proposition 6.4; conclusion |
| Proposition 6.4 | Admissible records with the morphisms of one closed kind form a category. | proved-in-paper (from the closure hypothesis; the three closed kinds are named) | Definition 6.3; Section 11 |
| Proposition 6.5 | Statements quantified over admissible records are conditional on the chosen conditions: removing AC-2 falsifies an explicit sentence. | proved-in-paper (explicit sentence and counterexample record) | Section 10; Section 11 |
| Proposition 7.6 | For any four-dimensional Hilbert space there are two factorizations and a unit vector whose entanglement entropy is 0 in one and log 2 in the other. | proved-in-paper (explicit unitary and Schmidt computation) | Section 7 discussion; Definition 3.8; Section 11 |
| Theorem 8.1 | Finite classical records under disjoint union: irreducibles are the one-point records, decomposition is unique, and cardinality is a complete invariant. | proved-in-paper | Theorem 8.3; Section 8 discussion; Section 10 |
| Theorem 8.2 | Finite dynamical records under disjoint union: irreducibility equals weak connectedness, component decomposition is unique, and component multisets classify. | proved-in-paper | Theorem 8.3; Section 8 discussion; Section 10 |
| Theorem 8.3 | Generation holds in both restricted classes: every record is built from its irreducibles, effectively. | proved-in-paper (from Theorems 8.1 and 8.2) | Section 9 (obligation discussion); conclusion |
| Theorem 8.4 | Finite records with a finite symmetry group: irreducibility equals transitivity, orbits decompose uniquely, and orbit counts on stabilizer classes classify. | proved-in-paper (orbit-stabilizer argument) | Section 8 discussion; Section 10 |
| Conjecture 9.2 | The structural classification identity Ob(Phys_adm)/simeq = Ob(closure of the families)/simeq. | conjecture (five obligations, four open and one partial) | Definition 9.1; Section 11; conclusion |

**Note on computational evidence.** The experiments of Appendix A carry the label
computational-evidence and support no row of this ledger; every row above rests on its
written proof. The code-evidence audit removed the two-qubit computational row, and
Proposition 7.6 is listed here on its proof alone.
