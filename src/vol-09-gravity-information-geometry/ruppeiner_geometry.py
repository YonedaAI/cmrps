#!/usr/bin/env python3
"""Phase D experiment for vol-09-gravity-information-geometry.

Claims evidenced (never proved) here:
  1. Proposition "Ideal gas": the Ruppeiner metric of the ideal gas is flat
     (scalar curvature zero), checked symbolically and at sample points.
  2. Thermodynamic curvature reading: the van der Waals Ruppeiner scalar
     curvature is nonzero away from the critical point and grows toward it
     in the sampled states (Ruppeiner's proposed interaction diagnostic).

Computational evidence only. This script is not a proof.
"""

import sympy as sp


def scalar_curvature(coords, metric):
    """Ricci scalar of a 2-dimensional metric given as a sympy Matrix."""
    n = len(coords)
    g = metric
    ginv = g.inv()
    gamma = [[[0] * n for _ in range(n)] for _ in range(n)]
    for k in range(n):
        for i in range(n):
            for j in range(n):
                s = 0
                for l in range(n):
                    s += ginv[k, l] * (
                        sp.diff(g[l, j], coords[i])
                        + sp.diff(g[l, i], coords[j])
                        - sp.diff(g[i, j], coords[l])
                    )
                gamma[k][i][j] = sp.simplify(s / 2)
    ricci = sp.zeros(n, n)
    for i in range(n):
        for j in range(n):
            s = 0
            for k in range(n):
                s += (
                    sp.diff(gamma[k][i][j], coords[k])
                    - sp.diff(gamma[k][i][k], coords[j])
                )
                for l in range(n):
                    s += gamma[l][i][j] * gamma[k][k][l] - gamma[l][i][k] * gamma[k][j][l]
            ricci[i, j] = sp.simplify(s)
    r = 0
    for i in range(n):
        for j in range(n):
            r += ginv[i, j] * ricci[i, j]
    return sp.simplify(r)


def ideal_gas_curvature() -> bool:
    u, v = sp.symbols("u v", positive=True)
    # S = Nk (ln U + ln V - c ln N + const) at fixed N = k = 1
    s = sp.log(u) + sp.log(v)
    g = sp.simplify(-sp.hessian(s, (u, v)))
    r = scalar_curvature((u, v), g)
    at_point = r.subs({u: 2.0, v: 3.0})
    print(f"  ideal gas metric:\n{g}")
    print(f"  scalar curvature R = {r}, R(2,3) = {at_point}")
    return r == 0


def vanderwaals_curvature() -> bool:
    u, v = sp.symbols("u v", positive=True)
    a, b, cv = 1, 1, sp.Rational(3, 2)
    # S = ln[(v - b) (u + a/v)^cv] per particle, k = 1
    s = sp.log(v - b) + cv * sp.log(u + a / v)
    g = sp.simplify(-sp.hessian(s, (u, v)))
    r = scalar_curvature((u, v), g)
    print(f"  van der Waals scalar curvature R(u,v) = {r}")
    # critical point of van der Waals with a = b = 1: v_c = 3, T_c = 8/27,
    # u_c = cv T_c - a / v_c
    t_c = sp.Rational(8, 27)
    u_c = float(cv * t_c - a / 3.0)
    samples = [(2.0, 2.0), (2.0, 3.5), (1.0, 3.0), (u_c + 0.5, 3.0), (u_c + 0.1, 3.0), (u_c + 0.02, 3.0)]
    ok = True
    vals = []
    for uu, vv in samples:
        val = complex(r.subs({u: uu, v: vv})).real
        print(f"  R({uu:.3f}, {vv:.3f}) = {val:.6f}")
        if abs(val) < 1e-6:
            ok = False  # nonzero at every sampled point
        vals.append(val)
    # growth along v = 3 toward the critical energy: last three samples
    if not (abs(vals[-3]) < abs(vals[-2]) < abs(vals[-1])):
        ok = False
    print(f"  critical point at u_c = {u_c:.6f}, v_c = 3.0")
    return ok


def main() -> None:
    ok1 = ideal_gas_curvature()
    print("PASS" if ok1 else "FAIL",
          ": ideal gas Ruppeiner curvature vanishes (Prop. 8.1)")
    ok2 = vanderwaals_curvature()
    print("PASS" if ok2 else "FAIL",
          ": van der Waals curvature nonzero away from critical point")


if __name__ == "__main__":
    main()
