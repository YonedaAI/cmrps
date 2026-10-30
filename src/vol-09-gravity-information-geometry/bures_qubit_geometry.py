#!/usr/bin/env python3
"""Phase D experiment for vol-09-gravity-information-geometry.

Claims evidenced (never proved) here:
  1. Proposition "Symmetric logarithmic derivative geometry of the qubit":
     the SLD metric in Bloch coordinates equals |dr|^2 + (r.dr)^2/(1-|r|^2),
     and in chi coordinates (r = sin chi) is the round metric of radius one.
  2. Proposition "Fidelity metric of the qubit": the fidelity metric equals
     one quarter of the SLD metric at sampled states and directions.

Computational evidence only. This script is not a proof.
"""

import numpy as np

SIGMA_X = np.array([[0.0, 1.0], [1.0, 0.0]])
SIGMA_Y = np.array([[0.0, -1.0j], [1.0j, 0.0]])
SIGMA_Z = np.array([[1.0, 0.0], [0.0, -1.0]])


def bloch_state(r: np.ndarray) -> np.ndarray:
    """rho = (I + r . sigma) / 2."""
    return (np.eye(2) + r[0] * SIGMA_X + r[1] * SIGMA_Y + r[2] * SIGMA_Z) / 2.0


def sld_solve(rho: np.ndarray, x: np.ndarray) -> np.ndarray:
    """Solve X = (rho L + L rho) / 2 for Hermitian L, in the eigenbasis."""
    lam, u = np.linalg.eigh(rho)
    xd = u.conj().T @ x @ u
    ld = np.zeros_like(xd)
    for i in range(len(lam)):
        for j in range(len(lam)):
            ld[i, j] = xd[i, j] * 2.0 / (lam[i] + lam[j])
    return u @ ld @ u.conj().T


def sld_value(rho: np.ndarray, x: np.ndarray) -> float:
    """g_sld(X, X) = Tr(X L)."""
    l = sld_solve(rho, x)
    return float(np.real(np.trace(x @ l)))


def sld_metric_bloch(r: np.ndarray, dr: np.ndarray) -> float:
    """Closed form |dr|^2 + (r.dr)^2 / (1 - |r|^2)."""
    r = np.asarray(r, dtype=float)
    dr = np.asarray(dr, dtype=float)
    return float(dr @ dr + (r @ dr) ** 2 / (1.0 - r @ r))


def fidelity(rho: np.ndarray, sigma: np.ndarray) -> float:
    """Uhlmann fidelity (Tr sqrt(sqrt(rho) sigma sqrt(rho)))^2."""
    def sqrtm_h(a: np.ndarray) -> np.ndarray:
        lam, u = np.linalg.eigh(a)
        return u @ np.diag(np.sqrt(np.maximum(lam, 0.0))) @ u.conj().T

    sr = sqrtm_h(rho)
    inner = sr @ sigma @ sr
    t = np.real(np.trace(sqrtm_h(inner)))
    return float(t**2)


def fidelity_value(rho: np.ndarray, x: np.ndarray, eps: float = 1e-4) -> float:
    """Second-order fidelity metric value from d_B^2 = 2(1 - sqrt(F))."""
    sigma = rho + eps * x
    db2 = 2.0 * (1.0 - np.sqrt(fidelity(rho, sigma)))
    return float(db2 / eps**2)


def round_sphere_check() -> bool:
    """Verify the closed-form metric is the round metric after r = sin chi.

    Works in spherical coordinates: builds G = I + r r^T/(1-|r|^2) on the
    Bloch ball, transforms to (chi, theta, phi) with r = sin chi, and compares
    with diag(1, sin^2 chi, sin^2 chi sin^2 theta), the round metric of
    radius one.
    """
    ok = True
    for chi, theta, phi in [(0.2, 0.7, 1.1), (0.5, 1.2, 0.3), (1.0, 0.9, 2.2), (1.3, 1.9, 0.6)]:
        r = np.sin(chi)
        rvec = r * np.array([
            np.sin(theta) * np.cos(phi),
            np.sin(theta) * np.sin(phi),
            np.cos(theta),
        ])
        g_cart = np.eye(3) + np.outer(rvec, rvec) / (1.0 - rvec @ rvec)
        # Jacobian drvec/d(chi, theta, phi), with r = sin chi
        dr_dchi = np.cos(chi) * np.array([
            np.sin(theta) * np.cos(phi),
            np.sin(theta) * np.sin(phi),
            np.cos(theta),
        ])
        dr_dtheta = r * np.array([
            np.cos(theta) * np.cos(phi),
            np.cos(theta) * np.sin(phi),
            -np.sin(theta),
        ])
        dr_dphi = r * np.array([
            -np.sin(theta) * np.sin(phi),
            np.sin(theta) * np.cos(phi),
            0.0,
        ])
        j = np.column_stack([dr_dchi, dr_dtheta, dr_dphi])
        g_sph = j.T @ g_cart @ j
        g_round = np.diag([1.0, np.sin(chi) ** 2, (np.sin(chi) * np.sin(theta)) ** 2])
        if np.max(np.abs(g_sph - g_round)) > 1e-10:
            ok = False
    return ok


def sld_closed_form_check() -> bool:
    ok = True
    rng = np.random.default_rng(20261029)
    for _ in range(200):
        r = rng.normal(size=3)
        r = 0.8 * r / np.linalg.norm(r) * rng.random() ** (1 / 3)
        rho = bloch_state(r)
        dr = rng.normal(size=3)
        x = (dr[0] * SIGMA_X + dr[1] * SIGMA_Y + dr[2] * SIGMA_Z) / 2.0
        v_direct = sld_value(rho, x)
        v_closed = sld_metric_bloch(r, dr)
        if abs(v_direct - v_closed) > 1e-9:
            ok = False
    return ok


def fidelity_metric_check() -> bool:
    """g_fid = g_sld / 4 at random states and directions, for d = 2, 3, 4."""
    ok = True
    rng = np.random.default_rng(20261029)
    worst = 0.0
    for d in (2, 3, 4):
        for _ in range(60):
            a = rng.normal(size=(d, d)) + 1j * rng.normal(size=(d, d))
            rho = a @ a.conj().T
            rho = rho / np.trace(rho)
            if np.linalg.eigvalsh(rho).min() < 0.05:
                continue
            b = rng.normal(size=(d, d)) + 1j * rng.normal(size=(d, d))
            x = (b + b.conj().T) / 2
            x = x - np.trace(x) / d * np.eye(d)
            v_fid = fidelity_value(rho, x)
            v_sld = sld_value(rho, x)
            err = abs(v_fid - v_sld / 4.0) / max(abs(v_sld), 1e-12)
            worst = max(worst, err)
            if err > 1e-3:
                ok = False
    print(f"  worst relative error g_fid vs g_sld/4 (d = 2, 3, 4): {worst:.3e}")
    return ok


def distance_profile_check() -> bool:
    """Geodesic distance from the center of the Bloch ball is arcsin(r).

    Integrates the closed-form radial metric element dr / sqrt(1 - r^2)
    numerically and compares with arcsin(r) at sampled radii.
    """
    ok = True
    for r in [0.1, 0.3, 0.5, 0.8, 0.95]:
        # midpoint-rule integral of 1/sqrt(1 - x^2) from 0 to r
        n = 20000
        h = r / n
        total = 0.0
        for k in range(n):
            x = (k + 0.5) * h
            total += h / np.sqrt(1.0 - x * x)
        if abs(total - np.arcsin(r)) > 1e-6:
            ok = False
    return ok


def main() -> None:
    ok1 = sld_closed_form_check()
    print("PASS" if ok1 else "FAIL",
          ": SLD metric equals closed form in Bloch coordinates (Prop. 5.1)")
    ok2 = round_sphere_check()
    print("PASS" if ok2 else "FAIL",
          ": closed form is round S^3 of radius one after r = sin chi")
    ok3 = fidelity_metric_check()
    print("PASS" if ok3 else "FAIL",
          ": fidelity metric equals one quarter of SLD metric (Prop. 5.2)")
    ok4 = distance_profile_check()
    print("PASS" if ok4 else "FAIL",
          ": geodesic distance from the center equals arcsin(r)")


if __name__ == "__main__":
    main()
