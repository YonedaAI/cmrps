#!/usr/bin/env python3
"""Phase D experiment (computational evidence, never proof).

Claim evidenced: the Poisson rank stratification of the Lie-Poisson structure on
so(3)* (Example "lie-poisson" in papers/latex/vol-05-classical-systems.tex), the
explicit case of the Weinstein splitting theorem: rank 2 on the coadjoint
orbits (spheres) and rank 0 at the origin, with symplectic leaf dimension equal
to the rank of the Poisson tensor.
"""

import numpy as np


def poisson_tensor(xi):
    """Poisson tensor of so(3)*: {x_i, x_j} = eps_{ijk} x_k."""
    x, y, z = xi
    return np.array([[0.0, z, -y], [-z, 0.0, x], [y, -x, 0.0]])


def split_bivector(xi):
    """Return (rank, leaf_dim, transverse_dim) of the Poisson tensor at xi."""
    P = poisson_tensor(xi)
    rank = int(np.linalg.matrix_rank(P, tol=1e-10))
    return rank, rank, 3 - rank


def test_rank_stratification():
    """Check rank 2 on spheres, rank 0 at the origin."""
    ok = True
    for r in (0.5, 1.0, 2.7):
        xi = np.array([r, 0.0, 0.0])
        rank, leaf, trans = split_bivector(xi)
        good = (rank == 2 and leaf == 2 and trans == 1)
        ok = ok and good
        print(f"  |xi| = {r}: rank = {rank}, leaf dim = {leaf}, transverse dim = {trans} "
              f"({'ok' if good else 'WRONG'})")
    xi0 = np.zeros(3)
    rank, leaf, trans = split_bivector(xi0)
    good = (rank == 0 and leaf == 0 and trans == 3)
    ok = ok and good
    print(f"  |xi| = 0: rank = {rank}, leaf dim = {leaf}, transverse dim = {trans} "
          f"({'ok' if good else 'WRONG'})")
    return ok


def main():
    print("weinstein_splitting.py: rank stratification on so(3)*")
    ok = test_rank_stratification()
    print(f"  test_rank_stratification: {'PASS' if ok else 'FAIL'}")
    return 0 if ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
