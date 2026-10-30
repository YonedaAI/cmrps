#!/usr/bin/env python3
"""Phase D experiment for vol-03-irreducibility-decomposition.

Evidences: Theorem 4.2 and Table 6 of the paper (unital *-homomorphisms
between decomposed finite-dimensional C*-algebras correspond to multiplicity
matrices; the conjugacy-class counts for the three small block pairs of the
table are 2, 1, and 6). Computational evidence only, never proof.
"""

from itertools import product

import numpy as np


def multiplicity_solutions(dom_sizes, cod_sizes):
    """All multiplicity matrices r[i][j] >= 0 with
    k[i][j] = dom_sizes[i] * r[i][j] and sum_i k[i][j] = cod_sizes[j]
    (Definition 4.1 of the paper)."""
    k = len(dom_sizes)
    l = len(cod_sizes)
    solutions = []
    for flat in product(range(0, max(cod_sizes) + 1), repeat=k * l):
        rows = [list(flat[i * l:(i + 1) * l]) for i in range(k)]
        ok = True
        for j in range(l):
            total = sum(dom_sizes[i] * rows[i][j] for i in range(k))
            if total != cod_sizes[j]:
                ok = False
                break
        if ok:
            solutions.append(rows)
    return solutions


def enumerate_multiplicity():
    """The three block pairs of the paper's Table 6, followed by the explicit
    homomorphism and conjugacy checks of Theorem 4.2."""
    cases = [
        ("C + M_2 -> M_3", [1, 2], [3], 2),
        ("M_2 -> M_2 + M_2", [2], [2, 2], 1),
        ("C + C -> C + M_2", [1, 1], [1, 2], 6),
    ]
    results = []
    for name, dom, cod, expected in cases:
        sols = multiplicity_solutions(dom, cod)
        observed = len(sols)
        match = observed == expected
        results.append((name, dom, cod, observed, expected, match, sols))
        print(f"{name}: solutions={observed} expected={expected} match={match}")
        for s in sols:
            print(f"    r = {s}")
    hom_ok = hom_property_tests()
    results.append(("homomorphism and conjugacy checks", [], [], int(hom_ok), 1, hom_ok, []))
    return results


def hom_property_tests():
    """Construct explicit homomorphisms from multiplicity matrices and test the
    *-homomorphism and conjugacy statements of Theorem 4.2."""
    print("=== Explicit homomorphisms from multiplicity matrices ===")
    ok = True

    # Case C + M_2 -> M_3, solution (1,1): scalar on coord 0, M_2 on coords 1,2.
    def phi_case11(a, b):
        # a is scalar (1x1), b is 2x2
        out = np.zeros((3, 3), dtype=complex)
        out[0, 0] = a[0, 0]
        out[1:3, 1:3] = b
        return out

    rng = np.random.default_rng(20261029)
    for _ in range(5):
        a = rng.normal(size=(1, 1)) + 1j * rng.normal(size=(1, 1))
        a2 = rng.normal(size=(1, 1)) + 1j * rng.normal(size=(1, 1))
        b = rng.normal(size=(2, 2)) + 1j * rng.normal(size=(2, 2))
        b2 = rng.normal(size=(2, 2)) + 1j * rng.normal(size=(2, 2))
        lhs = phi_case11(a @ a2, b @ b2)
        rhs = phi_case11(a, b) @ phi_case11(a2, b2)
        adj = phi_case11(a.conj().T, b.conj().T)
        if not (np.allclose(lhs, rhs) and np.allclose(adj, phi_case11(a, b).conj().T)):
            ok = False
    print("*-homomorphism laws for the (1,1) class: checked on 5 random pairs")

    # Conjugacy: same multiplicity matrix, different decompositions -> conjugate.
    # Diagonal embedding M_2 -> M_2 + M_2 realized with random unitaries.
    U1 = np.linalg.qr(rng.normal(size=(2, 2)) + 1j * rng.normal(size=(2, 2)))[0]
    U2 = np.linalg.qr(rng.normal(size=(2, 2)) + 1j * rng.normal(size=(2, 2)))[0]
    U = np.block([[U1, np.zeros((2, 2), dtype=complex)],
                  [np.zeros((2, 2), dtype=complex), U2]])
    for _ in range(5):
        x = rng.normal(size=(2, 2)) + 1j * rng.normal(size=(2, 2))
        phi1 = np.block([[x, np.zeros((2, 2), dtype=complex)],
                         [np.zeros((2, 2), dtype=complex), x]])
        phi2 = np.block([[U1 @ x @ U1.conj().T, np.zeros((2, 2), dtype=complex)],
                         [np.zeros((2, 2), dtype=complex), U2 @ x @ U2.conj().T]])
        conj = U.conj().T @ phi2 @ U
        if not np.allclose(conj, phi1):
            ok = False
    print("conjugacy of two realizations of the diagonal embedding: checked on 5 random x")

    # Distinct multiplicity matrices give non-conjugate maps: the rank of the
    # image of the M_2 block projection p_2 is a conjugacy invariant.
    phi_p2_class11 = phi_case11(np.zeros((1, 1)), np.eye(2))
    phi_p2_class30 = np.zeros((3, 3), dtype=complex)
    k1 = np.linalg.matrix_rank(phi_p2_class11)
    k2 = np.linalg.matrix_rank(phi_p2_class30)
    print(f"rank of image of the M_2 block projection: class (1,1) gives {k1}, class (3,0) gives {k2}")
    if k1 == k2:
        ok = False
    return ok


def main():
    print("=== Multiplicity matrices for small block pairs ===")
    results = enumerate_multiplicity()
    all_match = all(r[5] for r in results)

    # Rank-matrix consistency for one solution of the first case.
    dom, sol = [1, 2], [[3], [0]]
    k_matrix = [[dom[i] * sol[i][j] for j in range(len(sol[0]))] for i in range(len(dom))]
    print(f"rank matrix k for r = {sol}: {k_matrix}, column sums "
          f"{[sum(row[j] for row in k_matrix) for j in range(len(sol[0]))]}")
    hom_ok = hom_property_tests()
    print("RESULT: PASS" if all_match and hom_ok else "RESULT: FAIL")


if __name__ == "__main__":
    main()
