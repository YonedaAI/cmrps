#!/usr/bin/env python3
"""Phase D experiment for vol-04-yoneda-classification.

Evidences (computational evidence only, never proof):
  - Proposition (fusion rings of two groups of order eight) and the shadow case
    of the Etingof-Gelaki constraint: the fusion rings of D_8 and Q_8 are
    isomorphic while the groups are not.
  Functions: check_fusion_ring_iso, check_groups_distinct.

Run: python3 fusion_rings.py
"""

from collections import Counter
from itertools import product

import numpy as np


def d8_elements():
    """D8 = <r, s | r^4 = s^2 = 1, s r s = r^-1>; elements (a, b) = r^a s^b."""
    return [(a, b) for a in range(4) for b in range(2)]


def d8_mul(x, y):
    a, b = x
    c, d = y
    # (r^a s^b)(r^c s^d) = r^(a + (-1)^b c) s^(b+d)
    return ((a + (c if b == 0 else -c)) % 4, (b + d) % 2)


def q8_elements():
    """Q8 = {+-1, +-i, +-j, +-k} as words in basis (sign, axis)."""
    els = []
    for sign in (1, -1):
        for axis in ("1", "i", "j", "k"):
            els.append((sign, axis))
    return els


def q8_mul(x, y):
    sa, a = x
    sb, b = y
    sign = sa * sb
    # quaternion units: i^2 = j^2 = k^2 = ijk = -1
    table = {
        ("1", "1"): ("1", 1), ("1", "i"): ("i", 1), ("1", "j"): ("j", 1), ("1", "k"): ("k", 1),
        ("i", "1"): ("i", 1), ("j", "1"): ("j", 1), ("k", "1"): ("k", 1),
        ("i", "i"): ("1", -1), ("j", "j"): ("1", -1), ("k", "k"): ("1", -1),
        ("i", "j"): ("k", 1), ("j", "k"): ("i", 1), ("k", "i"): ("j", 1),
        ("j", "i"): ("k", -1), ("k", "j"): ("i", -1), ("i", "k"): ("j", -1),
    }
    axis, s = table[(a, b)]
    return (sign * s, axis)


def element_order(mul, e, identity):
    x = e
    for n in range(1, 25):
        if x == identity:
            return n
        x = mul(x, e)
    return None


def conjugacy_classes(elements, mul, identity):
    classes = []
    seen = set()
    for g in elements:
        if g in seen:
            continue
        cls = set()
        for h in elements:
            # h g h^-1
            hinv = None
            for t in elements:
                if mul(h, t) == identity and mul(t, h) == identity:
                    hinv = t
                    break
            cls.add(mul(mul(h, g), hinv))
        seen |= cls
        classes.append(sorted(cls, key=repr))
    return classes


def d8_chars():
    """Character table of D8: four linear characters and one of degree 2."""
    els = d8_elements()
    r, s = (1, 0), (0, 1)
    linear = []
    for alpha, beta in product((1, -1), repeat=2):
        def chi(x, alpha=alpha, beta=beta):
            a, b = x
            return (alpha ** a) * (beta ** b)
        linear.append(chi)
    # degree-2 representation: rotation and reflection matrices
    R = np.array([[0.0, -1.0], [1.0, 0.0]])
    S = np.array([[1.0, 0.0], [0.0, -1.0]])

    def rep(x):
        a, b = x
        M = np.eye(2)
        for _ in range(a):
            M = M @ R
        if b == 1:
            M = M @ S
        return M

    def chi2(x):
        return complex(np.trace(rep(x)))

    return els, linear + [chi2], d8_mul, (0, 0)


def q8_chars():
    """Character table of Q8: four linear characters and one of degree 2."""
    els = q8_elements()
    identity = (1, "1")
    linear = []
    for alpha, beta in product((1, -1), repeat=2):
        def chi(x, alpha=alpha, beta=beta):
            sign, axis = x
            if axis == "1":
                return 1  # linear characters kill the central involution -1
            if axis == "i":
                return alpha
            if axis == "j":
                return beta
            return alpha * beta
        linear.append(chi)
    # degree-2 representation by 2x2 complex matrices
    I = np.eye(2, dtype=complex)
    IM = np.array([[1j, 0.0], [0.0, -1j]])
    JM = np.array([[0.0, 1.0], [-1.0, 0.0]])
    KM = IM @ JM
    unit = {"1": I, "i": IM, "j": JM, "k": KM}

    def rep(x):
        sign, axis = x
        return sign * unit[axis]

    def chi2(x):
        return complex(np.trace(rep(x)))

    return els, linear + [chi2], q8_mul, identity


def class_values(els, mul, identity, chars, classes):
    """Evaluate each character on one representative per conjugacy class."""
    table = []
    for chi in chars:
        row = []
        for cls in classes:
            rep = cls[0]
            row.append(complex(chi(rep)))
        table.append(row)
    return table


def fusion_coefficients(els, classes, table, i, j, k):
    """N_ij^k = (1/|G|) sum_g chi_i(g) chi_j(g) conj(chi_k(g)), by classes."""
    G = len(els)
    total = 0.0 + 0.0j
    for idx, cls in enumerate(classes):
        s = table[i][idx] * table[j][idx] * np.conj(table[k][idx])
        total += len(cls) * s
    return int(round(total.real / G))


def fusion_ring(els, classes, table):
    r = len(table)
    return [[[fusion_coefficients(els, classes, table, i, j, k) for k in range(r)]
             for j in range(r)] for i in range(r)]


def check_fusion_ring_iso():
    """Fusion rings of D8 and Q8 are isomorphic as multiset-indexed tables."""
    els_d, chis_d, mul_d, id_d = d8_chars()
    els_q, chis_q, mul_q, id_q = q8_chars()
    cls_d = conjugacy_classes(els_d, mul_d, id_d)
    cls_q = conjugacy_classes(els_q, mul_q, id_q)
    tab_d = class_values(els_d, mul_d, id_d, chis_d, cls_d)
    tab_q = class_values(els_q, mul_q, id_q, chis_q, cls_q)

    # order irreps by degree then by character on identity (both tables)
    def order_key(table):
        return sorted(range(len(table)), key=lambda i: (table[i][0].real, table[i][0].imag))

    # canonicalize conjugacy-class order by the full column of character values
    def order_columns(table):
        r = len(table)
        cols = list(range(len(table[0])))
        keys = {c: tuple((round(table[i][c].real, 6), round(table[i][c].imag, 6))
                         for i in range(r)) for c in cols}
        return sorted(cols, key=lambda c: keys[c])

    ord_d = order_key(tab_d)
    ord_q = order_key(tab_q)
    cols_d = order_columns(tab_d)
    cols_q = order_columns(tab_q)
    tab_d_s = [[tab_d[i][c] for c in cols_d] for i in ord_d]
    tab_q_s = [[tab_q[i][c] for c in cols_q] for i in ord_q]
    cls_d_s = [cls_d[c] for c in cols_d]
    cls_q_s = [cls_q[c] for c in cols_q]

    fr_d = fusion_ring(els_d, cls_d_s, tab_d_s)
    fr_q = fusion_ring(els_q, cls_q_s, tab_q_s)
    same = fr_d == fr_q
    # character tables themselves agree numerically
    tab_same = all(
        abs(tab_d_s[i][c] - tab_q_s[i][c]) < 1e-9
        for i in range(len(tab_d_s)) for c in range(len(tab_d_s[0]))
    )
    status = "PASS" if same and tab_same else "FAIL"
    print(f"  fusion rings equal: {same}, character tables equal: {tab_same} [{status}]")
    return same and tab_same


def check_groups_distinct():
    """D8 and Q8 are non-isomorphic: element order profiles differ."""
    els_d, _, mul_d, id_d = d8_chars()
    els_q, _, mul_q, id_q = q8_chars()
    orders_d = Counter(element_order(mul_d, g, id_d) for g in els_d)
    orders_q = Counter(element_order(mul_q, g, id_q) for g in els_q)
    distinct = orders_d != orders_q
    status = "PASS" if distinct else "FAIL"
    print(f"  order profiles: D8 {dict(sorted(orders_d.items()))} vs "
          f"Q8 {dict(sorted(orders_q.items()))} [{status}]")
    return distinct


def main():
    print("fusion_rings.py: fusion data of D8 and Q8 (computational evidence)")
    ok1 = check_fusion_ring_iso()
    ok2 = check_groups_distinct()
    print(f"SUMMARY: check_fusion_ring_iso={'PASS' if ok1 else 'FAIL'} "
          f"check_groups_distinct={'PASS' if ok2 else 'FAIL'}")
    return 0 if (ok1 and ok2) else 1


if __name__ == "__main__":
    raise SystemExit(main())
