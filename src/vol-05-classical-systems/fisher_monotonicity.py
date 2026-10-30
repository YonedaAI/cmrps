#!/usr/bin/env python3
"""Phase D experiment (computational evidence, never proof).

Claim evidenced: the Fisher metric is monotone under stochastic maps, the
hypothesis side of Chentsov's theorem (Theorem "chentsov" in
papers/latex/vol-05-classical-systems.tex). The experiment samples random
probability vectors p and column-stochastic matrices T, forms the pullback
T^* g_{Tp} of the Fisher metric, and verifies g_p - T^* g_{Tp} is positive
semidefinite. It does not evidence the uniqueness direction of the theorem.
"""

import numpy as np

rng = np.random.default_rng(11)
N = 5
TRIALS = 200


def fisher_matrix(p):
    """Fisher metric g_p = diag(1/p) on the simplex tangent space."""
    return np.diag(1.0 / np.asarray(p, dtype=float))


def random_stochastic(n=N, m=N):
    """Column-stochastic matrix (columns sum to one)."""
    X = rng.random((n, m))
    return X / X.sum(axis=0, keepdims=True)


def pullback_comparison(p, T):
    """Return min eigenvalue of g_p - T^* g_{Tp} and the worst slack over
    random tangent vectors (u with sum u = 0)."""
    p = np.asarray(p, dtype=float)
    Tp = T @ p
    g = fisher_matrix(p)
    g_pull = T.T @ fisher_matrix(Tp) @ T
    diff = g - g_pull
    w = np.linalg.eigvalsh(0.5 * (diff + diff.T))
    worst_slack = np.inf
    for _ in range(50):
        u = rng.normal(size=N)
        u = u - u.mean()
        slack = float(u @ g @ u - (T @ u) @ fisher_matrix(Tp) @ (T @ u))
        worst_slack = min(worst_slack, slack)
    return float(w.min()), worst_slack


def test_monotonicity():
    min_eig = np.inf
    min_slack = np.inf
    for _ in range(TRIALS):
        p = rng.random(N) + 0.05
        p = p / p.sum()
        T = random_stochastic()
        e, s = pullback_comparison(p, T)
        min_eig = min(min_eig, e)
        min_slack = min(min_slack, s)
    ok = min_eig > -1e-10 and min_slack > -1e-10
    print(f"  trials = {TRIALS}, n = {N}")
    print(f"  min eigenvalue of g_p - T^* g_Tp = {min_eig:.3e}")
    print(f"  min slack over random tangent vectors = {min_slack:.3e}")
    return ok


def main():
    print("fisher_monotonicity.py: monotonicity of the Fisher metric")
    ok = test_monotonicity()
    print(f"  test_monotonicity: {'PASS' if ok else 'FAIL'}")
    return 0 if ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
