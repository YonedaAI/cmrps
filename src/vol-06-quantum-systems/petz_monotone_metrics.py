#!/usr/bin/env python3
"""Phase D experiment for vol-06-quantum-systems.

Evidences (computational evidence only, never proof):
  - Paper Theorem 8.3: the Petz metric built from a normalized operator
    monotone function is a positive definite form on tangent vectors
    (function `check_monotone_positive`).
  - Paper Corollary 8.4: distinct normalized operator monotone functions give
    distinct monotone metrics (function `distinct_functions_distinct_metrics`).
"""

from __future__ import annotations

import numpy as np

TOL = 1e-12

# Operator monotone functions satisfying the Petz conditions:
# symmetry f(t) = t f(1/t) and normalization f(1) = 1 (paper, Theorem 8.3).
OPERATOR_MONOTONE = {
    "f_mid": lambda t: (1.0 + t) / 2.0,
    "f_rec": lambda t: 2.0 * t / (1.0 + t),
    "f_wy": lambda t: (1.0 + t ** 0.5) ** 2 / 4.0,
}


def is_normalized(f, samples=(0.1, 0.5, 1.0, 2.0, 7.0)):
    """Check the Petz conditions f(1) = 1 and f(t) = t f(1/t)."""
    if abs(f(1.0) - 1.0) > 1e-12:
        return False
    return all(abs(f(t) - t * f(1.0 / t)) < 1e-12 for t in samples)


def petz_metric(rho, A, f):
    """Petz metric g_rho^f(A, A) for Hermitian tangent vectors.

    In the eigenbasis of rho with eigenvalues lambda_i the form is
    g(A, A) = sum_ij |A'_ij|^2 / (lambda_j f(lambda_i / lambda_j)),
    with A' = U^* A U (paper, Theorem 8.1).
    """
    lam, U = np.linalg.eigh(rho)
    if np.any(lam <= TOL):
        raise ValueError("rho must be full rank")
    A_prime = U.conj().T @ A @ U
    g = 0.0
    for i in range(len(lam)):
        for j in range(len(lam)):
            weight = lam[j] * f(lam[i] / lam[j])
            g += abs(A_prime[i, j]) ** 2 / weight
    return float(g.real)


def random_density_matrix(dim, rng):
    Z = rng.normal(size=(dim, dim)) + 1j * rng.normal(size=(dim, dim))
    rho = Z @ Z.conj().T
    return rho / np.trace(rho)


def random_hermitian(dim, rng):
    """A random tangent vector: self-adjoint and traceless (paper, Definition 8.1)."""
    Z = rng.normal(size=(dim, dim)) + 1j * rng.normal(size=(dim, dim))
    A = (Z + Z.conj().T) / 2.0
    return A - np.trace(A) / dim * np.eye(dim)


def check_monotone_positive(rng, trials=25):
    """g(A, A) > 0 for every nonzero tangent vector A and every sampled rho.
    Structural support: every Petz weight 1/(lambda_j f(lambda_i/lambda_j)) is
    checked positive on the sampled spectra as well."""
    worst = None
    for name, f in OPERATOR_MONOTONE.items():
        if not is_normalized(f):
            return False, f"{name} fails normalization"
        for _ in range(trials):
            rho = random_density_matrix(2, rng)
            lam = np.linalg.eigvalsh(rho)
            for li in lam:
                for lj in lam:
                    if lj * f(li / lj) <= TOL:
                        return False, f"{name}: non-positive Petz weight"
            A = random_hermitian(2, rng)
            if np.linalg.norm(A) < TOL:
                continue
            g = petz_metric(rho, A, f)
            if worst is None or g < worst:
                worst = g
            if g <= 0:
                return False, f"{name}: non-positive value {g}"
    return True, f"weights positive and minimum sampled value {worst:.6f}"


def distinct_functions_distinct_metrics(rng, trials=10):
    """Distinct normalized operator monotone functions give distinct metrics
    on the same tangent vector (paper, Corollary 8.2)."""
    values = {name: [] for name in OPERATOR_MONOTONE}
    for _ in range(trials):
        rho = random_density_matrix(2, rng)
        A = random_hermitian(2, rng)
        for name, f in OPERATOR_MONOTONE.items():
            values[name].append(petz_metric(rho, A, f))
    distinct = all(
        not np.allclose(values[a], values[b])
        for a, b in (("f_mid", "f_rec"), ("f_mid", "f_wy"), ("f_rec", "f_wy"))
    )
    return distinct, values


def check_claims():
    failures = []
    rng = np.random.default_rng(20261029)

    ok, detail = check_monotone_positive(rng)
    print(f"check_monotone_positive: {detail}")
    if not ok:
        failures.append(detail)

    distinct, values = distinct_functions_distinct_metrics(rng)
    print(f"distinct_functions_distinct_metrics: distinct={distinct}")
    for name, vals in values.items():
        print(f"  {name}: sample values {np.round(vals[:3], 6)}")
    if not distinct:
        failures.append("two operator monotone functions induced the same metric")

    if failures:
        for line in failures:
            print("FAIL:", line)
        raise SystemExit(1)
    print("ALL CHECKS PASSED")


if __name__ == "__main__":
    check_claims()
