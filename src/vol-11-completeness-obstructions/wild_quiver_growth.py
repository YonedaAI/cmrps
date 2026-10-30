# wild_quiver_growth.py
# Claim evidenced (paper, Section 8): the generic quotient dimension for the
# m-Kronecker quiver at dimension vector (n, n) grows linearly in n for the
# tame two-Kronecker case and quadratically for the wild three-Kronecker case.
# The quotient dimension is m*a*b minus the generic orbit dimension
# a^2 + b^2 - stab_dim, where stab_dim is the dimension of the generic
# stabilizer: for m = 2 at (n, n) the stabilizer is the centralizer of a
# generic matrix (dimension n), and for m >= 3 it is the scalar matrices
# (dimension 1).  This is a growth pattern only; the non-parametrization
# theorem it illustrates is proved by Buchweitz and Leuschke.
# Computational evidence, never proof.


def stabilizer_dim(m, n):
    """Generic stabilizer dimension of GL_n x GL_n on m-tuples of n x n maps."""
    if m <= 1:
        return 2 * n - n  # rank strata: generic orbit is open, quotient dim 0
    if m == 2:
        return n  # centralizer of a generic matrix (polynomials in it)
    return 1  # scalar matrices for m >= 3


def quotient_dim(m, a, b):
    """Generic quotient dimension for the m-Kronecker quiver at (a, b)."""
    assert a == b, "diagonal dimension vectors only"
    n = a
    return m * n * n - (n * n + n * n - stabilizer_dim(m, n))


def diagonal_profile(m, max_n):
    """Quotient dimensions along a = b = n for n = 1..max_n."""
    return [quotient_dim(m, n, n) for n in range(1, max_n + 1)]


if __name__ == "__main__":
    max_n = 8
    tame = diagonal_profile(2, max_n)
    wild = diagonal_profile(3, max_n)
    print(f"m=2 (tame side) diagonal:  {tame}")
    print(f"m=3 (wild side) diagonal:  {wild}")
    for i, v in enumerate(tame, start=1):
        assert v == i, f"m=2 at n={i} should be {i}, got {v}"
    for i, v in enumerate(wild, start=1):
        assert v == i * i + 1, f"m=3 at n={i} should be {i*i+1}, got {v}"
    assert wild[-1] > tame[-1], "wild profile should exceed tame profile"
    print("growth-pattern check: PASS (linear vs quadratic)")
