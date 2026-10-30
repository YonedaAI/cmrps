# Claim ledger: vol-02-structural-families

**Paper:** `papers/latex/vol-02-structural-families.tex`
**Volume:** Fundamental Structural Families of Mathematical Physics (CMRPS Part 2)
**Date:** 2026-10-29
**Role of this file:** verification artifact. The status labels below do not appear in the
`.tex` prose; the paper carries only ordinary mathematical phrasing.

**Status vocabulary** (exactly six, `docs/theorem-registry.md` §1):
`machine-checked` | `complete-informal-proof` | `conditional` | `conjecture` | `computational-evidence` | `open-problem`.

**Nothing in this paper is machine-checked.** All Lean module fields are em dashes. The
Haskell and Python under `src/vol-02-structural-families/` is computational evidence only.

## Definitions

| # | Label | Statement (one line) | Status | Used in |
|---|---|---|---|---|
| 2.4 | `def:morphism` | A morphism of records is a componentwise compatible tuple; five classes named; one-category assumption and preservation laws open | stipulative | Sections 9, 15, 17 |
| 2.1 | `def:family-record` | A family record is a triple (family, invariant range, invariant map) with the map constant on equivalence classes; classifying when complete | stipulative | everywhere |
| 2.2 | `def:sector` | Invariant-complete record; a sector is a full subcategory, invariant-complete when the restriction is | stipulative | Sections 3, 7.3, 8.1 |
| 2.3 | `def:structural-family` | Family singled out by state-space or observable structure; fundamental when the class lies in the closure under admissible constructions | stipulative | Sections 3, 16, 17 |
| 3.1 | `def:invariant-record` | Invariant record I(T) = (states, observables, dynamics, symmetries, representations) | stipulative | Section 2.5, 3 |
| 3.6 | `def:kinds` | Achievement kind of a sector, five cases on three ordered conditions | stipulative | Section 3.1, 16 |
| 16.1 | `def:independence` | Two families are logically independent when neither is a special case nor reconstructable from the other | stipulative | Section 16, 17 |

## Results proved in this paper

| # | Label | Statement (one line) | Status | Used in |
|---|---|---|---|---|
| 2.5 | `prop:components` | The five-tuple of component invariants need not classify a record: it misses inter-component coupling | complete-informal-proof | Section 3.1, 7.2 |
| 3.2 | `thm:sharpness` | Injection of classes into the range; finite range bounds the class count; constructibility of the image of a finite-type morphism over an algebraically closed field; uncountable class set excludes countable ranges | complete-informal-proof | Sections 3.1, 3.2, 7, 9, 13 |
| 3.3 | `cor:parameterization` | Classification and parameterization are separate achievements | complete-informal-proof | Sections 3.1, 7.3 |
| 3.4 | `prop:globality` | At fixed dimension 2n with n at least 1, no germ invariant is classifying in the symplectic family; classification there is global | complete-informal-proof (from Darboux) | Sections 3.2, 4.1, 6 |
| 3.5 | `cor:topological` | Classifying data for the symplectic family is topological | complete-informal-proof | Section 6 |
| 3.7 | `prop:kinds` | Exactly one of the five achievement kinds applies; the kinds are disjoint and exhaustive | complete-informal-proof | Section 3.1, 16 |
| 4.1 | `prop:cotangent` | The zero section of T*Q is a deformation retract; homotopy type of T*Q equals that of Q | complete-informal-proof | Section 4.1 |
| 4.2 | `prop:induced` | Dimension vector of a direct sum is the multiset union; of a tensor product the multiset of products | complete-informal-proof | Section 4.4, 7 |
| 5.1 | `prop:invariance` | Invariants are preserved under invertible equivalence morphisms and not under coarse-grainings or embeddings | complete-informal-proof | Section 9 |
| 5.2 | `prop:recognition-cost` | With decidable equality and computable invariant, recognition reduces to one computation plus one comparison | complete-informal-proof | Sections 3.1, 8.2 |
| 7.2 | `prop:kraus` | Under equality of completely positive maps, Kraus rank is not injective on the unitary channels of M_2. The Kraus decomposition is the normal form and rank is one scalar of it | complete-informal-proof | Section 11 |
| 8.1 | `prop:recognition` | Undecidability of four-manifold homeomorphism excludes any decidable classifying invariant on the unrestricted class | complete-informal-proof (from Tancer) | Section 8 |
| 15.1 | `prop:closure` | A nonempty class of objects irreducible under direct sum is not closed under direct sum and its closure is strictly larger; the class still generates its closure, so the claim is non-closure and not non-generation | complete-informal-proof | Sections 15, 17 |
| 16.2 | `prop:independence` | Families may both carry classifying invariants and still fail to be independent (Gelfand duality) | complete-informal-proof | Sections 16, 17 |
| 17.1 | `prop:mixed` | A record may present symplectic, operator-algebraic, and geometric structure at once (Berezin-Toeplitz) | complete-informal-proof | Section 17 |
| 18.1 | `prop:comparable` | Two classification records agreeing on family, sector, and equivalence have invariants related by a bijection of attained values | complete-informal-proof | Section 18 |

## Results cited from the literature

Each is stated with the scope its source establishes. None is machine-checked inside this program. Five primary sources have been added and resolved: `etingof`, `mcduff`, `sasyk`, `weinstein`, `stinespring-primary`.

| # | Label | Statement (one line) | Status | Source |
|---|---|---|---|---|
| 6.1 | `thm:weinstein` | Poisson local models: symplectic times transverse Poisson near a rank-2k point | complete-informal-proof | `weinstein` (primary), `poisson` |
| 7.1 | `thm:calg` | Unital finite-dimensional complex C*-algebras are classified by the multiset of matrix block sizes | complete-informal-proof | `calg` |
| 9.1 | `thm:bundles` | Principal G-bundles over a paracompact Hausdorff base are classified by maps into BG | complete-informal-proof | `classifying-space`, `charclass` |
| 10.1 | `thm:chentsov` | The Fisher metric is the unique metric monotone under stochastic maps on a finite classical state space | complete-informal-proof | `petz` |
| 11.1 | `thm:stinespring` | Completely positive maps admit a minimal Stinespring dilation, unique up to unitary | complete-informal-proof | `stinespring-primary` (primary), `stinespring`, `qchannel` |
| 12.1 | `thm:etingof-gelaki` | Tensor equivalence without symmetric structure cannot recover the group | complete-informal-proof (negative theorem) | `etingof` (primary) |

## Claims recorded as claims, not theorems

| # | Label | Statement (one line) | Status | Source |
|---|---|---|---|---|
| 10.2 | `rem:cobordism` | Extended TQFTs are classified by fully dualizable objects | conjecture (recorded as claimed; the 2009 proof is described by its author as an informal sketch) | `baezdolan`, `lurie` |

## Open problems named in the paper

| Location | Question | Status |
|---|---|---|
| Section 6 | Which global invariants of symplectic manifolds serve as classifying data | open-problem |
| Section 8 | The four-dimensional classification beyond restricted classes | open-problem |
| Section 11 | A classification theorem for completely positive maps up to isomorphism | open-problem |
| Section 12 | Classification of fusion categories | open-problem |
| Section 16 | Independence of the ten families in the sense of Definition 16.1 | open-problem |
| Section 7 | A classification theorem for separable type II_1 factors beyond the amenable class | closed in the negative: not classifiable by countable structures (`sasyk`) |
| Section 17 | Whether the ten families are fundamental rather than presentations of others | open-problem |
| Section 17 | Whether the ten families generate all admissible systems under the admissible constructions | conjecture |

## Computational evidence

| File | Claim it evidences | Status |
|---|---|---|
| `src/vol-02-structural-families/phaseD_kraus_rank.py` | Proposition 11.2: Kraus rank is constant on a positive-dimensional family of channels | computational-evidence |
| `src/vol-02-structural-families/phaseD_dimension_vectors.py` | Theorem 7.1 and Proposition 4.2: dimension vectors enumerate the sector and obey the induced operations | computational-evidence |
| `src/vol-02-structural-families/Instances.hs` | Family instance declarations and family-tag ontology identifiers | computational-evidence |

Computational evidence is evidence and never proof. The Haskell is an executable taxonomy
layer validated against the specifications recorded in the paper. It is **not** verified by
Lean, and no such claim is made.

## Cross-volume dependency record

| From | To | Condition | Rule |
|---|---|---|---|
| vol-01 ontology (`docs/ontology.md`) | vol-02 | definitions only | vol-02 is the family-level taxonomy; it may cite vol-01 definitions and registered background theorems |
| vol-02 family rows | vol-03, vol-05 to vol-10 | direct | later volumes instantiate the family rows and record their own classification results against them |

vol-02 does **not** depend on T-CMRPS-01 as a proved statement. The conjectural closure
identity is named as a research objective and is used nowhere as a lemma. vol-02 does not
depend on any completeness claim for the ten families; both prohibitions in
`docs/research-map.md` §4 for vol-02 are honored.
