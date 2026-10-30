#!/usr/bin/env python3
"""Phase D experiment: the Frobenius correspondence for 2d topological theories.

Claim evidenced (paper, Theorem 6.1): two-dimensional Atiyah topological
quantum field theories correspond to commutative Frobenius algebras, and the
value assigned to a closed surface is independent of how the surface is cut
along circles. The experiment verifies the Atiyah gluing axioms for a concrete
commutative Frobenius algebra, computes genus-g partition functions by two
routes, and exhibits a degenerate counit where the dual-basis construction of
the comultiplication fails. Computational evidence only; the proof of the
correspondence is Theorem 6.1 of the paper.

Module: tqft_frobenius.py
Function named in the code evidence appendix: verify_atiyah_gluing
"""

from fractions import Fraction
from itertools import product as iproduct


class FrobeniusAlgebra:
    """Finite-dimensional commutative Frobenius algebra over Q.

    Multiplication is given by structure constants and the counit by a row
    vector. The comultiplication is derived from the dual basis whenever the
    Frobenius map is invertible.
    """

    def __init__(self, name, dim, multiplication, counit, basis_names):
        self.name = name
        self.dim = dim
        self.multiplication = multiplication  # mult[i][j] is the vector e_i * e_j
        self.counit = counit
        self.basis_names = basis_names

    def mul_vec(self, left, right):
        out = [Fraction(0)] * self.dim
        for i, j in iproduct(range(self.dim), repeat=2):
            if left[i] == 0 or right[j] == 0:
                continue
            prod = self.multiplication[i][j]
            for k in range(self.dim):
                out[k] += left[i] * right[j] * prod[k]
        return out

    def eps(self, vec):
        return sum(c * e for c, e in zip(vec, self.counit))

    def unit_vec(self):
        return unit(self.dim, 0)

    def frobenius_matrix(self):
        """Matrix F_ij = eps(e_i * e_j); invertible exactly in the Frobenius case."""
        return [[self.eps(self.multiplication[i][j]) for j in range(self.dim)]
                for i in range(self.dim)]

    def is_frobenius(self):
        return invert(self.frobenius_matrix()) is not None

    def comultiplication(self):
        """Delta(a) = sum_j (a * e_j) tensor dual_j when the Frobenius map
        inverts; None when the counit is degenerate."""
        finv = invert(self.frobenius_matrix())
        if finv is None:
            return None

        def delta(vec):
            out = [[Fraction(0)] * self.dim for _ in range(self.dim)]
            for j in range(self.dim):
                a_times_ej = self.mul_vec(vec, unit(self.dim, j))
                for i in range(self.dim):
                    if a_times_ej[i] == 0:
                        continue
                    for m in range(self.dim):
                        out[i][m] += a_times_ej[i] * finv[j][m]
            return out

        return delta

    def euler_element(self):
        """e = m(Delta(1))."""
        delta = self.comultiplication()
        if delta is None:
            return None
        out = [Fraction(0)] * self.dim
        for (i, j), coef in flatten(delta(self.unit_vec())).items():
            prod = self.multiplication[i][j]
            for k in range(self.dim):
                out[k] += coef * prod[k]
        return out

    def genus_partition(self, genus):
        """Z(Sigma_g) = eps(e^g) with e the Euler element."""
        euler = self.euler_element()
        if euler is None:
            return None
        power = self.unit_vec()
        for _ in range(genus):
            power = self.mul_vec(power, euler)
        return self.eps(power)


def unit(dim, index):
    out = [Fraction(0)] * dim
    out[index] = Fraction(1)
    return out


def flatten(tensor2):
    out = {}
    for i, row in enumerate(tensor2):
        for j, val in enumerate(row):
            if val != 0:
                out[(i, j)] = val
    return out


def invert(matrix):
    """Exact inverse over Q, or None when the matrix is singular."""
    n = len(matrix)
    aug = [row[:] + [Fraction(1) if i == j else Fraction(0) for j in range(n)]
           for i, row in enumerate(matrix)]
    for col in range(n):
        pivot = None
        for row in range(col, n):
            if aug[row][col] != 0:
                pivot = row
                break
        if pivot is None:
            return None
        aug[col], aug[pivot] = aug[pivot], aug[col]
        scale = aug[col][col]
        aug[col] = [v / scale for v in aug[col]]
        for row in range(n):
            if row != col and aug[row][col] != 0:
                factor = aug[row][col]
                aug[row] = [a - factor * b for a, b in zip(aug[row], aug[col])]
    return [row[n:] for row in aug]


def verify_atiyah_gluing(algebra):
    """Check the Atiyah gluing axioms and decomposition independence.

    Checks associativity and unitality of multiplication, coassociativity and
    counitality of the derived comultiplication, the Frobenius identity in the
    module-map form Delta(ab) = (a tensor 1) Delta(b) = (1 tensor b) Delta(a),
    and equality of the genus-g partition function computed through the Euler
    element and through repeated pair-of-pants gluings.
    """
    dim = algebra.dim
    checks = {}

    checks["associative"] = all(
        algebra.mul_vec(algebra.mul_vec(unit(dim, i), unit(dim, j)), unit(dim, k))
        == algebra.mul_vec(unit(dim, i), algebra.mul_vec(unit(dim, j), unit(dim, k)))
        for i, j, k in iproduct(range(dim), repeat=3)
    )

    one = algebra.unit_vec()
    checks["unital"] = all(algebra.mul_vec(one, unit(dim, i)) == unit(dim, i)
                           for i in range(dim))

    delta = algebra.comultiplication()
    checks["frobenius_map_invertible"] = delta is not None
    if delta is None:
        checks["coassociative"] = False
        checks["counital"] = False
        checks["frobenius_identity"] = False
        checks["decomposition_independent"] = False
        checks["genus_values"] = {}
        return checks

    def delta_on_basis(i):
        return delta(unit(dim, i))

    def left_assoc(i):
        out = {}
        for (a, b), coef in flatten(delta_on_basis(i)).items():
            for (c, d), coef2 in flatten(delta_on_basis(a)).items():
                key = (c, d, b)
                out[key] = out.get(key, Fraction(0)) + coef * coef2
        return out

    def right_assoc(i):
        out = {}
        for (a, b), coef in flatten(delta_on_basis(i)).items():
            for (c, d), coef2 in flatten(delta_on_basis(b)).items():
                key = (a, c, d)
                out[key] = out.get(key, Fraction(0)) + coef * coef2
        return out

    checks["coassociative"] = all(left_assoc(i) == right_assoc(i) for i in range(dim))

    def counit_check(i):
        out = [Fraction(0)] * dim
        for (a, b), coef in flatten(delta_on_basis(i)).items():
            out[b] += algebra.eps(unit(dim, a)) * coef
        return out

    checks["counital"] = all(counit_check(i) == unit(dim, i) for i in range(dim))

    # Frobenius identity in the module-map form.
    def act_left(x, tensor):
        """(x tensor 1) applied to a tensor sum u tensor v."""
        out = [[Fraction(0)] * dim for _ in range(dim)]
        for (u, v), coef in flatten(tensor).items():
            prod = algebra.mul_vec(x, unit(dim, u))
            for w in range(dim):
                out[w][v] += coef * prod[w]
        return out

    def act_right(y, tensor):
        out = [[Fraction(0)] * dim for _ in range(dim)]
        for (u, v), coef in flatten(tensor).items():
            prod = algebra.mul_vec(y, unit(dim, v))
            for w in range(dim):
                out[u][w] += coef * prod[w]
        return out

    frob_ok = True
    for a, b in iproduct(range(dim), repeat=2):
        lhs = flatten(delta(algebra.mul_vec(unit(dim, a), unit(dim, b))))
        rhs_left = flatten(act_left(unit(dim, a), delta_on_basis(b)))
        rhs_right = flatten(act_right(unit(dim, b), delta_on_basis(a)))
        if not (lhs == rhs_left == rhs_right):
            frob_ok = False
    checks["frobenius_identity"] = frob_ok

    genus_values = {}
    ok = True
    for genus in (0, 1, 2, 3):
        via_euler = algebra.genus_partition(genus)
        via_gluing = genus_by_repeated_gluing(algebra, delta, genus)
        genus_values[genus] = (via_euler, via_gluing)
        if via_euler != via_gluing:
            ok = False
    checks["decomposition_independent"] = ok
    checks["genus_values"] = genus_values
    return checks


def genus_by_repeated_gluing(algebra, delta, genus):
    """Z(Sigma_g) by gluing g handles as pair-of-pants composites."""
    if genus == 0:
        return algebra.eps(algebra.unit_vec())
    dim = algebra.dim
    state = algebra.unit_vec()
    for _ in range(genus):
        new_state = [Fraction(0)] * dim
        for (a, b), coef in flatten(delta(state)).items():
            prod = algebra.mul_vec(unit(dim, a), unit(dim, b))
            for k in range(dim):
                new_state[k] += coef * prod[k]
        state = new_state
    return algebra.eps(state)


def group_algebra_z2():
    """The group algebra Q[Z/2] with its trace-form Frobenius structure."""
    mult = [[[Fraction(0), Fraction(0)], [Fraction(0), Fraction(0)]]
            for _ in range(2)]
    mult[0][0] = [Fraction(1), Fraction(0)]   # 1 * 1 = 1
    mult[0][1] = [Fraction(0), Fraction(1)]   # 1 * g = g
    mult[1][0] = [Fraction(0), Fraction(1)]   # g * 1 = g
    mult[1][1] = [Fraction(1), Fraction(0)]   # g * g = 1
    return FrobeniusAlgebra("Q[Z/2]", 2, mult, [Fraction(1), Fraction(0)],
                            ["1", "g"])


def degenerate_counit_algebra():
    """Dual numbers k[x]/(x^2) with the evaluation counit.

    The algebra is associative, commutative and unital, but eps(a + b x) = a
    kills the radical, so the Frobenius matrix is singular and the dual-basis
    construction of Delta is unavailable. The experiment shows the failure of
    the correspondence at exactly this point.
    """
    mult = [[[Fraction(0), Fraction(0)], [Fraction(0), Fraction(0)]]
            for _ in range(2)]
    mult[0][0] = [Fraction(1), Fraction(0)]   # 1 * 1 = 1
    mult[0][1] = [Fraction(0), Fraction(1)]   # 1 * x = x
    mult[1][0] = [Fraction(0), Fraction(1)]   # x * 1 = x
    mult[1][1] = [Fraction(0), Fraction(0)]   # x * x = 0
    return FrobeniusAlgebra("k[x]/(x^2) with evaluation counit", 2, mult,
                            [Fraction(1), Fraction(0)], ["1", "x"])


if __name__ == "__main__":
    print("=== Phase D: Atiyah gluing and the Frobenius correspondence ===")
    print("Claim (paper, Theorem 6.1): 2d Atiyah TQFTs = commutative Frobenius algebras.")
    print()

    algebra = group_algebra_z2()
    checks = verify_atiyah_gluing(algebra)
    for name, value in checks.items():
        if name != "genus_values":
            print(f"  {name:<28} {value}")
    print("  genus partition functions:")
    for genus, (via_euler, via_gluing) in checks["genus_values"].items():
        print(f"    g = {genus}: euler route {via_euler}, gluing route {via_gluing}")

    assert checks["associative"] and checks["unital"]
    assert checks["frobenius_map_invertible"]
    assert checks["coassociative"] and checks["counital"]
    assert checks["frobenius_identity"]
    assert checks["decomposition_independent"]

    print()
    degenerate = degenerate_counit_algebra()
    deg_checks = verify_atiyah_gluing(degenerate)
    print(f"Negative control ({degenerate.name}):")
    print(f"  frobenius_map_invertible {deg_checks['frobenius_map_invertible']}")
    assert not deg_checks["frobenius_map_invertible"], \
        "degenerate counit must break the dual-basis construction"

    print()
    print("All known-value assertions passed.")
    print("Status: computational evidence only; the correspondence is Theorem 6.1.")
