#!/usr/bin/env python3
"""Phase D experiment for vol-03-irreducibility-decomposition.

Evidences: Theorem 6.2 and the dilation remark of the paper (the minimal
Kraus rank of a completely positive map is an invariant of the normal form,
fixed by the Choi rank of the map, while non-minimal Kraus families of the
same map have inflated family size). Computational evidence only, never
proof.
"""

import numpy as np


def choi_matrix(kraus_ops):
    """Choi matrix of the map X -> sum_s K_s X K_s^*, shape (m*m? no):
    J = sum_s vec(K_s) vec(K_s)^* with vec stacking rows."""
    m, n = kraus_ops[0].shape
    vecs = [K.reshape(m * n) for K in kraus_ops]
    J = np.zeros((m * n, m * n), dtype=complex)
    for v in vecs:
        J += np.outer(v, v.conj())
    return J


def choi_rank(kraus_ops, tol=1e-9):
    """Rank of the Choi matrix: the minimal Kraus rank of the map."""
    J = choi_matrix(kraus_ops)
    vals = np.linalg.eigvalsh(J)
    return int(np.sum(vals > tol))


def apply_map(kraus_ops, X):
    return sum(K @ X @ K.conj().T for K in kraus_ops)


def nonminimal_family(K, family_size, rng):
    """A non-minimal Kraus family for the same map X -> K X K^*:
    split K into `family_size` operators K_s = a_s K with sum |a_s|^2 = 1."""
    coeffs = rng.normal(size=family_size) + 1j * rng.normal(size=family_size)
    coeffs = coeffs / np.linalg.norm(coeffs)
    return [a * K for a in coeffs]


def choi_rank_dilation():
    rng = np.random.default_rng(20261029)
    m, n = 2, 2
    K = rng.normal(size=(m, n)) + 1j * rng.normal(size=(m, n))

    print("=== Kraus rank under non-minimal dilation ===")
    base = [K]
    base_rank = choi_rank(base)
    print(f"minimal family size 1, Choi rank of the map: {base_rank}")

    X = rng.normal(size=(n, n)) + 1j * rng.normal(size=(n, n))
    X = X + X.conj().T
    ref = apply_map(base, X)

    stable = True
    for family_size in (1, 2, 3, 5, 8):
        family = nonminimal_family(K, family_size, rng)
        rank = choi_rank(family)
        same_map = np.allclose(apply_map(family, X), ref)
        print(
            f"presented family size {family_size}: Choi rank {rank}, "
            f"same map: {same_map}"
        )
        if rank != base_rank or not same_map:
            stable = False

    # Two channels with equal minimal rank are not the same map.
    I2 = np.eye(2, dtype=complex)
    Z = np.array([[1, 0], [0, -1]], dtype=complex)
    Xp = np.array([[0, 1], [1, 0]], dtype=complex)
    phi = [I2]
    psi = [Z]
    same = np.allclose(apply_map(phi, Xp), apply_map(psi, Xp))
    print(f"identity and conjugation by Z: both rank 1, same map: {same}")
    return stable and not same


def main():
    ok = choi_rank_dilation()
    print("RESULT: PASS" if ok else "RESULT: FAIL")


if __name__ == "__main__":
    main()
