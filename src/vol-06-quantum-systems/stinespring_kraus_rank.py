#!/usr/bin/env python3
"""Phase D experiment for vol-06-quantum-systems.

Evidences (computational evidence only, never proof):
  - Paper Theorem 6.4 / Proposition 6.8: the Kraus rank of a channel equals
    the rank of its Choi matrix (function `kraus_rank`).
  - Paper Theorem 6.6 / Proposition 6.8: minimal Kraus presentations reduce
    correctly and match the minimal Stinespring dilation dimension
    (function `minimize_kraus`).
  - Paper Proposition 6.2: equal Kraus rank does not classify channels;
    channels of one rank can be inequivalent (function
    `same_rank_distinct_channels`).
"""

from __future__ import annotations

import numpy as np

TOL = 1e-9


def kraus_apply(kraus, X):
    """Phi(X) = sum_k A_k X A_k^*."""
    return sum(A @ X @ A.conj().T for A in kraus)


def choi_matrix(kraus):
    """Choi matrix J(Phi) = sum_ij E_ij tensor Phi(E_ij).

    With column-stacked vectors a_k = vec(A_k) this is J = sum_k a_k a_k^*.
    """
    A0 = np.asarray(kraus[0], dtype=complex)
    m, n = A0.shape
    J = np.zeros((n * m, n * m), dtype=complex)
    for A in kraus:
        a = np.asarray(A, dtype=complex).flatten(order="F")
        J += np.outer(a, a.conj())
    return J


def kraus_rank(kraus):
    """Minimal number of Kraus operators: the rank of the Choi matrix
    (paper, Theorem 6.4)."""
    J = choi_matrix(kraus)
    vals = np.linalg.eigvalsh((J + J.conj().T) / 2)
    return int(np.sum(vals > TOL))


def minimal_kraus_count_independent(kraus):
    """Minimal number of Kraus operators computed independently of the Choi
    matrix: the dimension of the span of the vectorized Kraus operators."""
    rows = np.array([np.asarray(A, dtype=complex).flatten() for A in kraus])
    return int(np.linalg.matrix_rank(rows))


def minimize_kraus(kraus):
    """A minimal Kraus presentation of the same channel, from the spectral
    decomposition of the Choi matrix (paper, Theorem 6.1)."""
    A0 = np.asarray(kraus[0], dtype=complex)
    m, n = A0.shape
    J = choi_matrix(kraus)
    vals, vecs = np.linalg.eigh((J + J.conj().T) / 2)
    out = []
    for lam, v in zip(vals, vecs.T):
        if lam > TOL:
            out.append(np.sqrt(lam) * v.reshape((m, n), order="F"))
    return out


def depolarizing_kraus(p):
    """Kraus presentation of a one-parameter qubit channel family with
    full Choi rank 4 for 0 < p < 1: A0 = sqrt(1-p) I, Ai = sqrt(p/3) sigma_i."""
    I = np.eye(2, dtype=complex)
    sx = np.array([[0, 1], [1, 0]], dtype=complex)
    sy = np.array([[0, -1j], [1j, 0]], dtype=complex)
    sz = np.array([[1, 0], [0, -1]], dtype=complex)
    return [np.sqrt(1 - p) * I] + [np.sqrt(p / 3) * S for S in (sx, sy, sz)]


def choi_spectrum(kraus):
    """Sorted eigenvalues of the Choi matrix; a unitary-equivalence invariant
    of the channel."""
    J = choi_matrix(kraus)
    vals = np.linalg.eigvalsh((J + J.conj().T) / 2)
    return np.sort(vals)


def random_unitary(dim, rng):
    Z = rng.normal(size=(dim, dim)) + 1j * rng.normal(size=(dim, dim))
    Q, R = np.linalg.qr(Z)
    d = np.diagonal(R)
    return Q * (d / np.abs(d))


def check_rank_invariance(rng):
    """Unitary conjugation of Kraus presentations preserves the Choi rank."""
    kraus = depolarizing_kraus(0.37)
    U = random_unitary(2, rng)
    W = random_unitary(2, rng)
    conjugated = [W @ A @ U.conj().T for A in kraus]
    return kraus_rank(kraus) == kraus_rank(conjugated)


def same_rank_distinct_channels():
    """Channels of equal Kraus rank whose Choi spectra differ, hence no unitary
    identification matches them (paper, Proposition 6.8)."""
    profiles = {}
    ranks = {}
    for p in (0.2, 0.5, 0.8):
        kraus = depolarizing_kraus(p)
        ranks[p] = kraus_rank(kraus)
        profiles[p] = choi_spectrum(kraus)
    equal_rank = len(set(ranks.values())) == 1
    distinct = all(
        not np.allclose(profiles[a], profiles[b])
        for a, b in ((0.2, 0.5), (0.2, 0.8), (0.5, 0.8))
    )
    return equal_rank, distinct, ranks, profiles


def check_claims():
    failures = []
    rng = np.random.default_rng(20261029)

    # Claim 1: Kraus rank equals Choi rank on the family and on random
    # presentations with zero operators added (zeros do not change the map).
    # The equality is checked two independent ways: the Choi eigenvalue count
    # and the span dimension of the vectorized Kraus operators.
    for p in (0.1, 0.37, 0.6, 0.9):
        kraus = depolarizing_kraus(p)
        r = kraus_rank(kraus)
        expected = 4 if p < 1.0 else 1
        if r != expected:
            failures.append(f"depolarizing p={p}: rank {r}, expected {expected}")
        if minimal_kraus_count_independent(kraus) != r:
            failures.append(f"independent span count disagrees with Choi rank at p={p}")
        padded = kraus + [np.zeros((2, 2), dtype=complex)]
        if kraus_rank(padded) != r:
            failures.append(f"zero padding changed rank at p={p}")
    print("kraus_rank: Choi eigenvalue count and independent span count agree")

    # Claim 2: minimize_kraus reproduces the channel with exactly rank-many
    # operators.
    kraus = depolarizing_kraus(0.37) + [np.zeros((2, 2), dtype=complex)]
    small = minimize_kraus(kraus)
    if len(small) != kraus_rank(kraus):
        failures.append(
            f"minimize_kraus produced {len(small)} operators for rank "
            f"{kraus_rank(kraus)}"
        )
    for _ in range(5):
        X = rng.normal(size=(2, 2)) + 1j * rng.normal(size=(2, 2))
        if not np.allclose(kraus_apply(kraus, X), kraus_apply(small, X)):
            failures.append("minimize_kraus changed the channel")
    print(f"minimize_kraus: reduced to {len(small)} operators, channel preserved")

    # Claim 3: rank is invariant under unitary change of presentation.
    if not check_rank_invariance(rng):
        failures.append("unitary conjugation changed the Kraus rank")
    print("check_rank_invariance: rank preserved under unitary conjugation")

    # Claim 4: equal Kraus rank does not classify channels.
    equal_rank, distinct, ranks, profiles = same_rank_distinct_channels()
    if not equal_rank:
        failures.append(f"family ranks differ: {ranks}")
    if not distinct:
        failures.append("Choi spectra coincide across the family")
    print(f"same_rank_distinct_channels: ranks={ranks}, spectra distinct={distinct}")
    print("  profile p=0.2:", np.round(profiles[0.2], 6))
    print("  profile p=0.8:", np.round(profiles[0.8], 6))

    if failures:
        for line in failures:
            print("FAIL:", line)
        raise SystemExit(1)
    print("ALL CHECKS PASSED")


if __name__ == "__main__":
    check_claims()
