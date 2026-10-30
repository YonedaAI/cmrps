# Lean targets — vol-01-foundations

**Paper:** papers/latex/vol-01-foundations.tex. **Status of this file:** target list
only. No .lean files are written and no lake build is run at this stage; a later phase
builds the Lean package. Nothing in this list is machine-checked. The names mirror the
Haskell instance layer in src/vol-01-foundations/Instances.hs and the paper's statements.

At most ten targets.

| # | Target name | Informal statement (matching the paper) |
|---|---|---|
| 1 | vol01.morphisms.composition_not_typed | Proposition 4.4: there are finite classical records and an embedding and a coarse-graining whose composite satisfies none of the five preservation laws of Definition 4.3. |
| 2 | vol01.morphisms.self_composition | Proposition 4.6: coarse-grainings, embeddings, and equivalence morphisms are each closed under self-composition under the laws of Definition 4.3. |
| 3 | vol01.admissibility.kind_category | Proposition 6.4: admissible records (AC-1 to AC-4) with the morphisms of one kind closed under self-composition form a category. |
| 4 | vol01.admissibility.conditional_statements | Proposition 6.5: the sentence that the observable collection is closed under addition holds with AC-2 and fails on an admitted record without it. |
| 5 | vol01.finiteState.irreducible_iff_card_eq_one | Theorem 8.1 claim 1: a finite classical record is irreducible under disjoint union exactly when its state space has one element. |
| 6 | vol01.finiteState.classify_iff_card_eq | Theorem 8.1 claims 2 to 4: the decomposition into one-point records is unique up to order, isomorphism is equality of cardinality, and cardinality classifies the quotient. |
| 7 | vol01.dynamics.irreducible_iff_connected | Theorem 8.2 claim 1: a finite dynamical record is irreducible under disjoint union exactly when its functional graph is weakly connected. |
| 8 | vol01.dynamics.connected_components_unique | Theorem 8.2 claims 2 and 3: the connected-component decomposition is unique up to order and isomorphism, and component multisets classify records. |
| 9 | vol01.product.irreducible_iff_prime_card | Example 7.5: under the product rule the unit is the empty product and the irreducibles are the records of prime cardinality, with unique factorization. |
| 10 | vol01.qubit.factorization_nonunique | Proposition 7.6: there are two factorizations of a four-dimensional Hilbert space and a unit vector whose entanglement entropy is 0 in one and log 2 in the other. |

Not targeted: Theorem 8.3 (generation) is a direct corollary of targets 6 and 8;
Theorem 8.4 (finite symmetric records) is standard orbit-stabilizer theory and is
excluded to keep the list at ten; Conjecture 9.2 is a conjecture and is never a target.
