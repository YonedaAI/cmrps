#!/usr/bin/env python3
"""Phase D experiment: Chevalley-Eilenberg obstruction classes of gauge algebras.

Claim evidenced (paper, Proposition 5.3 and Example 5.2): the BV-BRST gauge
anomaly is the pair of classes in H^1(CE(P)) and H^2(CE(P)), and the
quantization gate passes exactly when both vanish. The experiment computes
the cohomology exactly over the rationals for small gauge algebras and
reports the obstruction pair. Computational evidence only; the proof of the
obstruction statement is Proposition 5.3 of the paper.

Module: anomaly_cohomology.py
Function named in the code evidence appendix: ce_obstruction_pair
"""

from fractions import Fraction
from itertools import combinations

# A k-form is a dict: tuple of strictly increasing basis indices -> coefficient.


def wedge(alpha, beta):
    """Exterior product of two forms, with coefficients in Q."""
    result = {}
    for inds_a, coef_a in alpha.items():
        for inds_b, coef_b in beta.items():
            if set(inds_a) & set(inds_b):
                continue
            merged = list(inds_a + inds_b)
            inversions = sum(
                1 for i, j in combinations(range(len(merged)), 2) if merged[i] > merged[j]
            )
            merged.sort()
            key = tuple(merged)
            signed = coef_a * coef_b * (-1) ** inversions
            result[key] = result.get(key, Fraction(0)) + signed
    return {k: v for k, v in result.items() if v != 0}


def ce_differential(form, dim, structure):
    """Chevalley-Eilenberg differential of a form.

    structure is the list of structure constants: structure[k][i][j] is the
    coefficient of e_k in [e_i, e_j]. On the dual basis,
    d e^k = -sum_{i<j} c^k_{ij} e^i ^ e^j, extended as an antiderivation:
    d(a ^ b) = d a ^ b + (-1)^deg(a) a ^ d b.
    """
    result = {}
    for inds, coef in form.items():
        if not inds:
            continue  # d of a scalar is zero
        head, tail = inds[0], inds[1:]
        # d(e^head ^ tail) = d e^head ^ tail - e^head ^ d(tail).
        d_head = {}
        for i in range(dim):
            for j in range(i + 1, dim):
                c = structure[head][i][j]
                if c != 0:
                    key = (i, j)
                    d_head[key] = d_head.get(key, Fraction(0)) + Fraction(-c)
        term1 = wedge(d_head, {tail: Fraction(1)}) if tail else d_head
        d_tail = ce_differential({tail: Fraction(1)}, dim, structure) if tail else {}
        term2 = wedge({(head,): Fraction(-1)}, d_tail)
        for term in (term1, term2):
            for key, val in term.items():
                result[key] = result.get(key, Fraction(0)) + val * coef
    return {k: v for k, v in result.items() if v != 0}


def basis_of_degree(dim, degree):
    return [tuple(c) for c in combinations(range(dim), degree)]


def matrix_of_map(dim, src_degree, structure):
    """Matrix of d: Lambda^src_degree -> Lambda^(src_degree+1) on the basis."""
    src = basis_of_degree(dim, src_degree)
    dst = basis_of_degree(dim, src_degree + 1)
    dst_index = {b: i for i, b in enumerate(dst)}
    matrix = [[Fraction(0) for _ in src] for _ in dst]
    for col, elem in enumerate(src):
        image = ce_differential({elem: Fraction(1)}, dim, structure)
        for key, val in image.items():
            matrix[dst_index[key]][col] = val
    return matrix


def rank(matrix):
    """Exact row rank over Q by Gaussian elimination."""
    mat = [row[:] for row in matrix]
    if not mat:
        return 0
    rows, cols = len(mat), len(mat[0])
    rank_value = 0
    for col in range(cols):
        pivot = None
        for row in range(rank_value, rows):
            if mat[row][col] != 0:
                pivot = row
                break
        if pivot is None:
            continue
        mat[rank_value], mat[pivot] = mat[pivot], mat[rank_value]
        scale = mat[rank_value][col]
        mat[rank_value] = [v / scale for v in mat[rank_value]]
        for row in range(rows):
            if row != rank_value and mat[row][col] != 0:
                factor = mat[row][col]
                mat[row] = [a - factor * b for a, b in zip(mat[row], mat[rank_value])]
        rank_value += 1
    return rank_value


def ce_betti(dim, degree, structure):
    """dim H^degree of the Chevalley-Eilenberg complex."""
    ker = len(basis_of_degree(dim, degree)) - rank(matrix_of_map(dim, degree, structure))
    if degree == 0:
        return ker  # no incoming differential
    im = rank(matrix_of_map(dim, degree - 1, structure))
    return ker - im


def ce_obstruction_pair(name, dim, structure):
    """Return (dim H^1, dim H^2) and whether the obstruction pair vanishes."""
    h1 = ce_betti(dim, 1, structure)
    h2 = ce_betti(dim, 2, structure)
    return {
        "algebra": name,
        "dim H^1": h1,
        "dim H^2": h2,
        "obstruction_pair_vanishes": h1 == 0 and h2 == 0,
    }


def algebra_2d_nonabelian():
    """Example 5.2: [e1, e2] = e2. Expected: dim H^1 = 1, dim H^2 = 0."""
    dim = 2
    structure = [[[Fraction(0) for _ in range(dim)] for _ in range(dim)] for _ in range(dim)]
    structure[1][0][1] = Fraction(1)  # [e0, e1] = e1
    structure[1][1][0] = Fraction(-1)
    return dim, structure


def algebra_su2():
    """su(2): [e1,e2]=e3, [e2,e3]=e1, [e3,e1]=e2. Expected: H^1 = H^2 = 0."""
    dim = 3
    structure = [[[Fraction(0) for _ in range(dim)] for _ in range(dim)] for _ in range(dim)]
    pairs = {(0, 1): 2, (1, 2): 0, (2, 0): 1}
    for (i, j), k in pairs.items():
        structure[k][i][j] = Fraction(1)
        structure[k][j][i] = Fraction(-1)
    return dim, structure


def algebra_abelian():
    """Two-dimensional abelian algebra. Expected: dim H^1 = 2, dim H^2 = 1."""
    dim = 2
    structure = [[[Fraction(0) for _ in range(dim)] for _ in range(dim)] for _ in range(dim)]
    return dim, structure


if __name__ == "__main__":
    print("=== Phase D: Chevalley-Eilenberg obstruction pair (computational evidence) ===")
    print("Obstruction claim (paper, Proposition 5.3): quantization requires")
    print("dim H^1 = dim H^2 = 0 for the gauge algebra.")
    print()
    cases = [
        ("2d non-abelian (Example 5.2)", *algebra_2d_nonabelian()),
        ("su(2)", *algebra_su2()),
        ("2d abelian", *algebra_abelian()),
    ]
    results = [ce_obstruction_pair(name, dim, structure) for name, dim, structure in cases]
    header = f"{'algebra':<30} {'dim H^1':<9} {'dim H^2':<9} {'gate passes':<12}"
    print(header)
    print("-" * len(header))
    for row in results:
        print(f"{row['algebra']:<30} {row['dim H^1']:<9} {row['dim H^2']:<9} "
              f"{str(row['obstruction_pair_vanishes']):<12}")

    lookup = {r["algebra"]: r for r in results}
    assert lookup["2d non-abelian (Example 5.2)"]["dim H^1"] == 1, "Example 5.2: H^1 nonzero"
    assert lookup["2d non-abelian (Example 5.2)"]["dim H^2"] == 0, "Example 5.2: H^2 vanishes"
    assert lookup["su(2)"]["obstruction_pair_vanishes"], "su(2): anomaly-free at the algebraic level"
    print()
    print("All known-value assertions passed.")
    print("Status: computational evidence only; the obstruction theorem is in the paper.")
