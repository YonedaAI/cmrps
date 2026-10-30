#!/usr/bin/env python3
"""Phase D experiment for vol-09-gravity-information-geometry.

Claims evidenced (never proved) here:
  1. Proposition "Non-uniqueness on qubit states": the Petz metrics of two
     distinct normalized operator monotone functions are not proportional on
     qubit states (different radial-to-transverse ratios at diag(3/4, 1/4)).
  2. Proposition "Commutative locus": all normalized monotone metrics agree
     with the Fisher metric on diagonal (commuting) tangent vectors.
  3. Qutrit cross-check: the same two metrics differ at a full-rank qutrit
     state and agree on diagonal tangents there.

Computational evidence only. This script is not a proof.
"""

import math

import numpy as np


def f_sld(t: np.ndarray) -> np.ndarray:
    """Normalized operator monotone function giving the SLD metric: (1+t)/2."""
    return (1.0 + t) / 2.0


def f_wy(t: np.ndarray) -> np.ndarray:
    """Normalized operator monotone function giving the Wigner-Yanase metric."""
    return (1.0 + np.sqrt(t)) ** 2 / 4.0


def petz_metric(rho: np.ndarray, x: np.ndarray, f) -> float:
    """Petz formula g^f_rho(X, X) = sum_ij |X_ij|^2 / (lambda_i f(lambda_j/lambda_i))."""
    lam, u = np.linalg.eigh(rho)
    if np.any(lam <= 0):
        raise ValueError("petz_metric needs full-rank rho")
    xd = u.conj().T @ x @ u
    val = 0.0
    for i in range(len(lam)):
        for j in range(len(lam)):
            val += abs(xd[i, j]) ** 2 / (lam[i] * f(lam[j] / lam[i]))
    return float(val)


def fisher_value(lam: np.ndarray, diag_x: np.ndarray) -> float:
    """Classical Fisher value sum_i X_ii^2 / lambda_i for diagonal X."""
    return float(np.sum(diag_x**2 / lam))


def compare_metrics() -> None:
    rho = np.diag([0.75, 0.25])
    x_trans = np.array([[0.0, 0.5], [0.5, 0.0]])
    x_rad = np.diag([0.5, -0.5])

    g_sld_t = petz_metric(rho, x_trans, f_sld)
    g_sld_r = petz_metric(rho, x_rad, f_sld)
    g_wy_t = petz_metric(rho, x_trans, f_wy)
    g_wy_r = petz_metric(rho, x_rad, f_wy)

    print(f"qubit rho=diag(3/4,1/4)")
    print(f"  SLD  transverse={g_sld_t:.6f}  radial={g_sld_r:.6f}  ratio={g_sld_r / g_sld_t:.6f}")
    print(f"  WY   transverse={g_wy_t:.6f}  radial={g_wy_r:.6f}  ratio={g_wy_r / g_wy_t:.6f}")
    ratio_sld = g_sld_r / g_sld_t
    ratio_wy = g_wy_r / g_wy_t
    expect_sld = 4.0 / 3.0
    expect_wy = (2.0 + np.sqrt(3.0)) / 3.0
    ok = (abs(ratio_sld - expect_sld) < 1e-12
          and abs(ratio_wy - expect_wy) < 1e-12
          and abs(ratio_sld - ratio_wy) > 1e-6)
    print(f"  expected ratios: SLD={expect_sld:.6f} WY={expect_wy:.6f}")
    print("PASS" if ok else "FAIL",
          ": metrics not proportional on qubit states (Prop. 4.2)")


def f_bkm(t):
    """Normalized operator monotone function of the BKM metric, continuous at 1."""
    t = float(t)
    if abs(t - 1.0) < 1e-12:
        return 1.0
    return (t - 1.0) / math.log(t)


def commutative_locus_check() -> None:
    """All normalized Petz metrics equal the Fisher value on diagonal tangents.

    Checked for three metric members (SLD, Wigner-Yanase, BKM), on qubit and
    qutrit diagonal states, with random diagonal tangent vectors.
    """
    rng = np.random.default_rng(20261029)
    ok = True
    for d in (2, 3, 4):
        for _ in range(20):
            w = rng.random(d) + 0.1
            lam = w / w.sum()
            rho = np.diag(lam)
            y = np.diag(rng.normal(size=d))
            y = y - np.trace(y) / d * np.eye(d)
            v_fisher = fisher_value(lam, np.diag(y))
            for name, f in (("SLD", f_sld), ("WY", f_wy), ("BKM", f_bkm)):
                v = petz_metric(rho, y, f)
                if abs(v - v_fisher) > 1e-10:
                    ok = False
    lam = np.array([0.5, 0.3, 0.2])
    y = np.diag([0.2, -0.1, -0.1])
    v_fisher = fisher_value(lam, np.diag(y))
    print(f"qutrit diagonal tangent: SLD={petz_metric(np.diag(lam), y, f_sld):.6f} "
          f"WY={petz_metric(np.diag(lam), y, f_wy):.6f} Fisher={v_fisher:.6f}")
    print("PASS" if ok else "FAIL",
          ": all monotone metrics equal Fisher on commuting states (Prop. 4.3)")


def qutrit_check() -> None:
    lam = np.array([0.5, 0.3, 0.2])
    rho = np.diag(lam)
    x = np.zeros((3, 3))
    x[0, 2] = x[2, 0] = 0.5
    v_sld = petz_metric(rho, x, f_sld)
    v_wy = petz_metric(rho, x, f_wy)
    print(f"qutrit off-diagonal tangent: SLD={v_sld:.6f} WY={v_wy:.6f}")
    ok = abs(v_sld - v_wy) > 1e-6
    print("PASS" if ok else "FAIL",
          ": metrics differ on qutrit off-diagonal tangents")


def main() -> None:
    compare_metrics()
    commutative_locus_check()
    qutrit_check()


if __name__ == "__main__":
    main()
