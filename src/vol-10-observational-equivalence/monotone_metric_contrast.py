# Phase D computational evidence for vol-10-observational-equivalence.
# Claim evidenced: the Morozova-Chentsov quadratic forms of two admissible
# quantum monotone metrics (self-reciprocal operator monotone f) disagree on
# non-commuting directions and agree on commutative ones (paper Example 5.4,
# Proposition 5.3, Table 4).
# File: src/vol-10-observational-equivalence/monotone_metric_contrast.py
# Computational evidence is never proof.

from fractions import Fraction as F


def f_sym(x):
    """Operator monotone function f(x) = 2x/(1+x), normalized by f(1) = 1 and
    self-reciprocal: f(x) = x f(1/x). The self-reciprocal representative of the
    metric that f(x) = x and f(x) = 1 induce on self-adjoint directions."""
    return 2 * x / (1 + x)


def f_arithmetic(x):
    """Operator monotone function h(x) = (1 + x) / 2, normalized by h(1) = 1 and
    self-reciprocal: h(x) = x h(1/x)."""
    return (1 + x) / 2


def mc_quadratic_form(f, lams, rows):
    """Morozova-Chentsov quadratic form
        g_f(rho, A) = sum_{i,j} |A_ij|^2 / (lambda_j * f(lambda_i / lambda_j))
    for a faithful diagonal rho with eigenvalues lams and self-adjoint A
    given by its matrix rows (paper Section 5)."""
    n = len(lams)
    total = F(0)
    for i in range(n):
        for j in range(n):
            a_ij = rows[i][j]
            total += a_ij * a_ij / (lams[j] * f(lams[i] / lams[j]))
    return total


def direction(a, b):
    """Direction A = a * sigma_x + b * sigma_z on a qubit."""
    return [[b, a], [a, -b]]


def main():
    lams = [F(3, 4), F(1, 4)]

    # Example 5.4: A = sigma_x, the two metrics give 16/3 and 4.
    a_sigma_x = direction(F(1), F(0))
    g_f = mc_quadratic_form(f_sym, lams, a_sigma_x)
    g_h = mc_quadratic_form(f_arithmetic, lams, a_sigma_x)
    print("Example 5.4: g_f =", g_f, " g_h =", g_h)
    assert g_f == F(16, 3) and g_h == F(4)

    # Proposition 5.3: commutative direction A = sigma_z, both agree.
    a_sigma_z = direction(F(0), F(1))
    g_f_diag = mc_quadratic_form(f_sym, lams, a_sigma_z)
    g_h_diag = mc_quadratic_form(f_arithmetic, lams, a_sigma_z)
    print("commutative direction: g_f =", g_f_diag, " g_h =", g_h_diag)
    assert g_f_diag == g_h_diag == F(16, 3)

    # Table 4 of the paper: four directions (a, b).
    cases = [
        (F(1), F(0)),
        (F(0), F(1)),
        (F(1), F(1)),
        (F(1, 2), F(1, 2)),
    ]
    print("Table 4 rows:")
    for (a, b) in cases:
        rows = direction(a, b)
        gf = mc_quadratic_form(f_sym, lams, rows)
        gh = mc_quadratic_form(f_arithmetic, lams, rows)
        agree = gf == gh
        print(f"  (a,b)=({a},{b})  g_f={gf}  g_h={gh}  agree={agree}")
        # Closed forms of the worked example: g_f = (16/3)(a^2+b^2),
        # g_h = (16/3) b^2 + 4 a^2.
        assert gf == F(16, 3) * (a * a + b * b)
        assert gh == F(16, 3) * b * b + 4 * a * a

    assert mc_quadratic_form(f_sym, lams, direction(F(1), F(0))) != \
        mc_quadratic_form(f_arithmetic, lams, direction(F(1), F(0)))
    print("PASS: monotone quadratic forms depend on f off the commutative subalgebra")
    print("PASS: the two metrics agree on commutative directions")


if __name__ == "__main__":
    main()
