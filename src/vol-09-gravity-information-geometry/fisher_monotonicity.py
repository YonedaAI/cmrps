#!/usr/bin/env python3
"""Phase D experiment for vol-09-gravity-information-geometry.

Claim evidenced (never proved) here: Proposition "Monotonicity of the Fisher
metric" of the paper -- the Fisher metric on the probability simplex decreases
under stochastic maps, i.e. g_p - (D phi)^T g_{phi p} (D phi) is positive
semidefinite for random interior points p and random stochastic maps phi.

Computational evidence only. This script is not a proof.
"""

import numpy as np

RNG = np.random.default_rng(20261029)


def fisher_metric(p: np.ndarray) -> np.ndarray:
    """Fisher metric g_p = diag(1/p_i) restricted to sum u_i = 0."""
    return np.diag(1.0 / p)


def random_stochastic(n_out: int, n_in: int) -> np.ndarray:
    """Random n_out x n_in matrix with nonnegative entries and unit column sums."""
    m = RNG.random((n_out, n_in))
    return m / m.sum(axis=0, keepdims=True)


def pullback_matrix(phi: np.ndarray, q: np.ndarray) -> np.ndarray:
    """D phi^T g_q D phi for q = phi p, in ambient coordinates."""
    g_q = fisher_metric(q)
    return phi.T @ g_q @ phi


def check_monotonicity(trials: int = 2000, n_in: int = 4, n_out: int = 3,
                       tol: float = 1e-9) -> bool:
    """Return True iff g_p - (D phi)^T g_q (D phi) is PSD in every trial.

    Tangent space is sum u_i = 0, so PSD-ness is checked on the restriction
    to that subspace (ambient PSD implies the restriction; we additionally
    report the smallest restricted eigenvalue).
    """
    ok = True
    worst = np.inf
    for _ in range(trials):
        p = RNG.random(n_in) + 0.05
        p = p / p.sum()
        phi = random_stochastic(n_out, n_in)
        q = phi @ p
        g_p = fisher_metric(p)
        diff = g_p - pullback_matrix(phi, q)
        # restrict to the tangent space {u : sum u_i = 0} via an orthonormal basis
        _, _, vh = np.linalg.svd(np.ones((1, n_in)))
        a = vh[1:, :].T
        diff_t = a.T @ diff @ a
        lam = np.linalg.eigvalsh(diff_t).min()
        worst = min(worst, lam)
        if lam < -tol:
            ok = False
    print(f"trials={trials}  worst restricted eigenvalue={worst:.3e}")
    return ok


def main() -> None:
    ok = check_monotonicity()
    print("PASS" if ok else "FAIL",
          ": Fisher monotonicity under stochastic maps (Prop. 3.1)")


if __name__ == "__main__":
    main()
