# Lean targets: vol-07-gauge-qft

**Paper:** papers/latex/vol-07-gauge-qft.tex
**Date:** 2026-10-30
**Scope:** mechanization targets only. No .lean files are written in this phase and no `lake` command is run. Target names mirror the Haskell method names in src/vol-07-gauge-qft/Instances.hs. Nothing in this file is machine-checked; the Haskell models are computational evidence cross-audited against these targets, never "verified by Lean".

## Targets (10)

| # | Target name | Informal statement (matching the paper) | Paper location |
|---|---|---|---|
| 1 | `killing_cartan_classification` | Complex semisimple Lie algebras are classified up to isomorphism by Dynkin diagrams of types A_r, B_r, C_r, D_r, G2, F4, E6, E7, E8, and real simple Lie algebras by Satake diagrams; connected Lie groups with given algebra are central quotients of the simply connected group. | Theorem (Killing-Cartan classification) |
| 2 | `highest_weight_classification` | Finite-dimensional irreducible representations of a complex semisimple Lie algebra are in bijection with dominant integral weights, existence and uniqueness included. | Theorem (Highest-weight classification) |
| 3 | `principal_bundle_classification` | For a Lie group G and a paracompact Hausdorff space X, the classifying map induces a bijection between isomorphism classes of principal G-bundles over X and homotopy classes of maps X to BG; characteristic classes are pullbacks of universal classes in H*(BG). | Theorem (Classification by the classifying space) |
| 4 | `bundle_sphere_classification` | For a connected Lie group G and n >= 1, isomorphism classes of principal G-bundles over the n-sphere are in bijection with pi_{n-1}(G). | Proposition (Bundles over spheres) |
| 5 | `characteristic_classes_pullback` | For the classical groups: H*(BU(n); Z) is polynomial on Chern classes c_1..c_n; H*(BSO(n); Q) is polynomial on Pontryagin classes with the Euler class in even rank; H*(BSU(n); Z) is polynomial on c_2..c_n. | Proposition (Characteristic classes of the classical groups) |
| 6 | `global_form_distinction` | The global form of the gauge group is not determined by the Dynkin diagram: the classification of principal SO(3)-bundles over S^2 has two classes detected by w_2 while every SU(2)-bundle over S^2 is trivial. | Example (Global forms and the second Stiefel-Whitney class) |
| 7 | `anomaly_obstruction_vanishing` | A gauge theory admits a consistent quantization exactly where the determinant line of the Dirac family over the gauge orbit space is trivializable and the local BRST anomaly class in H^{1,n}(s|d) vanishes; anomaly-free matter lists form the kernel of the additivity homomorphism alpha: R(G) -> A. | Definition (Fermionic anomaly), Definition (BV-BRST gauge anomaly), Proposition (Quantization gate), Proposition (Anomaly cancellation as a linear condition) |
| 8 | `frobenius_correspondence` | The category of two-dimensional Atiyah topological quantum field theories valued in vector spaces is equivalent to the category of commutative Frobenius algebras. | Theorem (Two-dimensional topological field theories) |
| 9 | `dr_reconstruction_hypotheses` | Under the DHR hypotheses in Minkowski spacetime of dimension at least 2+1: a symmetric tensor C*-category with conjugates, direct sums, subobjects, and End(1) = C is equivalent to finite-dimensional unitary representations of a compact supergroup, unique up to isomorphism. | Theorem (Doplicher-Roberts reconstruction), Definition (DHR criterion) |
| 10 | `deligne_supergroup` | A symmetric tensor category over a field of characteristic zero with subexponential growth is equivalent to the category of representations of an affine supergroup scheme. | Theorem (Deligne's theorem) |

## Not targeted here

The cobordism hypothesis is a registered conjecture with a proof gap (the 2009 writeup is an informal sketch) and is deliberately absent from this list. The four-dimensional constructive quantum field theory claims are claims-ledger rows and are not targets. The classification of connections modulo gauge is open and is not a target.
