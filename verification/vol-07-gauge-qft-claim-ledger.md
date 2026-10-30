# Claim ledger: vol-07-gauge-qft

**Paper:** papers/latex/vol-07-gauge-qft.tex (Classification of Gauge Structures and Quantum Field Theories)
**Date:** 2026-10-30
**Status vocabulary:** proved-in-paper | conditional | conjecture | computational-evidence | open-problem.
This ledger is a verification artifact; the .tex carries no status labels beyond ordinary mathematical phrasing.

## Formal statements

| # | Statement (name, label) | One-line content | Proof status | Where used |
|---|---|---|---|---|
| 1 | Theorem (Killing-Cartan classification), thm:killing-cartan | Complex semisimple Lie algebras are classified by Dynkin diagrams, real simple algebras by Satake diagrams, groups by central quotients | proved-in-paper (standard result; proof argument recorded; literature: Humphreys, Serre) | Sections 3, 8 (invariant records), 9 (dynkin_enumeration.py check), Conclusion |
| 2 | Theorem (Highest-weight classification), thm:highest-weight | Finite-dimensional irreps of a complex semisimple Lie algebra correspond bijectively to dominant integral weights | proved-in-paper (standard result; existence and uniqueness argued; literature: Humphreys) | Sections 3, 5 (Proposition anomaly-cancellation), 8, Conclusion |
| 3 | Theorem (Classification by the classifying space), thm:bundles | For Lie group G and paracompact Hausdorff X, principal G-bundles are classified by homotopy classes of maps X to BG, with characteristic classes the pullbacks of universal classes | proved-in-paper (proof recorded via Milnor join, numerability, Dold) | Sections 4, 8 (invariant records), 9 (bundle_classification.py check), Conclusion |
| 4 | Proposition (Bundles over spheres), prop:spheres | For connected Lie group G, principal G-bundles over S^n are in bijection with pi_{n-1}(G) | proved-in-paper (long exact homotopy sequence argument given) | Section 4 (Examples line/instanton/global-form), Section 9 (check 1) |
| 5 | Proposition (Characteristic classes of the classical groups), prop:classical-classes | H*(BU(n)) is polynomial on Chern classes, H*(BSO(n); Q) on Pontryagin classes plus Euler, H*(BSU(n)) on c_2..c_n | proved-in-paper (splitting-principle argument sketched; literature: Milnor-Stasheff) | Section 4 |
| 6 | Proposition (Quantization gate), prop:anomaly | Consistent quantization requires trivializability of the determinant line of the Dirac family and vanishing of the local BRST anomaly class in H^{1,n}(s|d) | proved-in-paper (argument recorded; literature: Wess-Zumino, Barnich-Brandt-Henneaux, Quillen, Atiyah-Singer) | Sections 5, 8 (invariant records), 9 (algebraic check), Conclusion |
| 7 | Proposition (Anomaly cancellation as a linear condition), prop:cancellation | Anomaly-free matter lists form the kernel of a homomorphism alpha: R(G) to the anomaly cohomology, so admissibility is a linear condition on weight data | proved-in-paper (additivity argument given) | Section 5, Section 8 |
| 8 | Theorem (Two-dimensional topological field theories), thm:frobenius | Two-dimensional Atiyah TQFTs with values in vector spaces correspond to commutative Frobenius algebras | proved-in-paper (both directions argued; literature: Atiyah) | Sections 6, 8, 9 (tqft_frobenius.py check), Conclusion |
| 9 | Conjecture (Cobordism hypothesis), conj:cobordism | Extended unitary TQFTs are classified by fully dualizable objects with O(n)-action | conjecture (2009 writeup is an informal sketch of a proof; registered as claimed with proof gap) | Sections 1, 6, 10 (Limitations), 11 (Open problems), Conclusion |
| 10 | Theorem (Doplicher-Roberts reconstruction), thm:dr | A symmetric tensor C*-category with conjugates, direct sums, subobjects, End(1)=C is equivalent to finite-dimensional unitary representations of a compact supergroup, unique up to isomorphism | proved-in-paper under the stated hypotheses (literature: Doplicher-Roberts, DHR) | Sections 7, 8, 10 (Limitations), Conclusion |
| 11 | Theorem (Deligne's theorem), thm:deligne | Characteristic-zero symmetric tensor categories of subexponential growth are representations of affine supergroup schemes | proved-in-paper under the stated hypotheses (literature: Deligne) | Section 7 |
| 12 | Theorem (Reconstruction from commutative probes), thm:gelfand | Gelfand-Naimark and Stone duality recover algebras from commutative or Boolean probe data | proved-in-paper (standard result; argument recorded) | Section 8 |

## Computational checks (never proof)

| Check | File and function | Status | Statement illustrated |
|---|---|---|---|
| Chevalley-Eilenberg H^1 and H^2 of a two-dimensional non-abelian algebra and of su(2), exact over Q | src/vol-07-gauge-qft/anomaly_cohomology.py, ce_obstruction_pair | computational-evidence (finite-instance sanity check; the only row retained in the code evidence appendix after audit) | Example ex:abelian-anomaly (algebraic shadow data only) |
| Sphere-bundle classification values on U(1), SU(2), SO(3), U(2), SU(3) and S^1 to S^4 | src/vol-07-gauge-qft/bundle_classification.py, classify_sphere_bundles | worked illustration (code-audit removed this row from the evidence appendix; no evidentiary claim) | Proposition prop:spheres |
| Atiyah gluing identities and two evaluation routes for Q[Z/2], with a degenerate-counit negative control | src/vol-07-gauge-qft/tqft_frobenius.py, verify_atiyah_gluing | worked illustration (code-audit removed this row from the evidence appendix; no evidentiary claim) | Theorem thm:frobenius |
| Finite-type Dynkin diagrams up to rank 8 by positive definiteness over all arrow assignments | src/vol-07-gauge-qft/dynkin_enumeration.py, enumerate_finite_type | worked illustration (code-audit removed this row from the evidence appendix; no evidentiary claim) | Theorem thm:killing-cartan |
| Taxonomy instances for gauge groups, bundles, anomaly records, Frobenius and sector data | src/vol-07-gauge-qft/Instances.hs, crossAudit | computational-evidence (executable taxonomy models, cross-audited against the paper's definitions; NOT machine-checked and NOT verified by Lean) | Definitions def:family-iv, def:family-vi, def:fermionic-anomaly, def:bvbrst-anomaly |

**Code audit outcome (reviews/vol-07-gauge-qft-code-audit.md):** WARN, code-audit removed 3 rows. After two rounds the auditor judged the sphere-bundle, Frobenius, and Dynkin scripts not fully evidentiary at its bar; the rows and their claims were removed from the paper and the scripts are described as illustrations only.

## Registered claim-landscape rows (claims ledger objects of the series registry, not theorems)

| Row | Content | Status on the record |
|---|---|---|
| OpenAI existence claim (CL-01) | 4d QCD, simplest GUT completion, pure Yang-Mills subproblem by Balaban-program methods | existence claimed; manuscript and formalization withheld; verification pending. Never machine-checked. |
| Clay Yang-Mills mass gap (T-OP-03) | Positive mass gap for 4d Yang-Mills | open-problem; Clay lists Unsolved |
| Faizal-Shabir construction (CL-02) | Reflection-positive 4d SU(N) with mass gap and confinement | journal-published, unverified |
| Jacobsen preprint (CL-03) | Existence and mass gap via 5d orbifold regulator | withdrawn; carries no status |
| Lattice theorems (CL-04) | Mass gap and infinite-volume limit (Nissim), Wilson area law (Cao-Nissim-Sheffield), partial 4d SU(N) (Faria da Veiga-O'Carroll) | rigorous within stated regimes; do not address continuum 4d existence or continuum mass gap |
| Nair outline (CL-05) | 3d mass-gap proof outline | preprint outline; no status |

**Existence and mass gap are never conflated. No withheld formalization is cited as machine-checked.**
