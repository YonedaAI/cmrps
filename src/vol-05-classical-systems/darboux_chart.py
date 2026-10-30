#!/usr/bin/env python3
"""Phase D experiment (computational evidence, never proof).

Claim evidenced: the Moser homotopy of Lemma "moser-ball" produces a Darboux
chart for a perturbed symplectic form on a ball in R^4, as used in the proof of
Darboux's theorem (Theorem "darboux" in papers/latex/vol-05-classical-systems.tex).

The experiment integrates the Moser vector field X_t solving
    iota_{X_t} omega_t = -alpha,   omega_t = omega_0 + t*(omega - omega_0),
flows it from t=0 to t=1 with RK4, and reports the max residual
    || J^T omega(phi(x)) J - omega_0 ||_max
over sample points, where J is the numerical Jacobian of the time-1 flow.
"""

import numpy as np

rng = np.random.default_rng(7)
DIM = 4  # n = 2
EPS = 0.05


def omega_0(_x):
    I = np.eye(2)
    Z = np.zeros((2, 2))
    top = np.hstack([Z, I])
    bot = np.hstack([-I, Z])
    return np.vstack([top, bot])


# Perturbation: omega = omega_0 + d(alpha) with quadratic alpha, so d(alpha)
# has linear coefficients and the form is genuinely position dependent.
B = rng.normal(scale=0.4, size=(DIM, DIM, DIM))  # alpha_i = B[i,k,l] x_k x_l


def alpha(x):
    return np.einsum("ikl,k,l->i", B, x, x)


def d_alpha(x):
    # (d alpha)_{ij} = d_i alpha_j - d_j alpha_i, alpha_j = B[j,k,l] x_k x_l
    # d_i alpha_j = (B[j,i,l] + B[j,k,i]) x_k x_l  (symmetrized in k,l)
    G = np.zeros((DIM, DIM), dtype=np.result_type(x, float))
    for j in range(DIM):
        for i in range(DIM):
            M = 0.5 * (B[j, i, :] + B[j, :, i])
            G[j, i] = 2.0 * np.einsum("k,k->", M, x)
    out = np.zeros((DIM, DIM), dtype=np.result_type(x, float))
    for i in range(DIM):
        for j in range(DIM):
            out[i, j] = G[j, i] - G[i, j]
    return out


def omega(x):
    return omega_0(x) + EPS * d_alpha(x)


def omega_t(x, t):
    return omega_0(x) + t * EPS * d_alpha(x)


def moser_field(x, t):
    """Solve omega_t(x) X = alpha(x) (equivalent to iota_X omega_t = -alpha)."""
    M = omega_t(x, t)
    a = EPS * alpha(x)
    return np.linalg.solve(M, a)


def rk4_step(x, t, h):
    k1 = moser_field(x, t)
    k2 = moser_field(x + 0.5 * h * k1, t + 0.5 * h)
    k3 = moser_field(x + 0.5 * h * k2, t + 0.5 * h)
    k4 = moser_field(x + h * k3, t + h)
    return x + (h / 6.0) * (k1 + 2 * k2 + 2 * k3 + k4)


def flow_time1(x, steps=400):
    h = 1.0 / steps
    t, y = 0.0, x.copy()
    for _ in range(steps):
        y = rk4_step(y, t, h)
        t += h
    return y


def test_chart_pullback(n_samples=12, h=1e-20):
    """Residual test: J^T omega(phi(x0)) J should equal omega_0(x0), with J
    the Jacobian of the time-1 flow at x0 from complex-step differentiation."""
    worst = 0.0
    for _ in range(n_samples):
        x0 = rng.normal(scale=0.3, size=DIM)
        x1 = flow_time1(x0)
        J = np.zeros((DIM, DIM))
        for k in range(DIM):
            e = np.zeros(DIM, dtype=complex)
            e[k] = 1j * h
            J[:, k] = np.imag(flow_time1(x0.astype(complex) + e)) / h
        resid = J.T @ omega(x1) @ J - omega_0(x0)
        worst = max(worst, np.max(np.abs(resid)))
    return worst


def main():
    worst = test_chart_pullback()
    print("darboux_chart.py: Moser homotopy on a perturbed form in R^4")
    print(f"  perturbation scale EPS = {EPS}")
    print(f"  max residual |J^T omega(phi(x)) J - omega_0| = {worst:.3e}")
    ok = worst < 1e-4
    print(f"  test_chart_pullback: {'PASS' if ok else 'FAIL'}")
    return 0 if ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
