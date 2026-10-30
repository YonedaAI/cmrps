# Phase D computational evidence for vol-10-observational-equivalence.
# Claim evidenced: the character tables of the dihedral group of order 8 and
# the quaternion group of order 8 agree as matrices of numbers while the
# element-order data differs, so the character table does not separate the
# groups (paper Section 8.3). This is a shadow of the Etingof-Gelaki
# counterexample (paper Theorem 3.1), not the theorem itself.
# File: src/vol-10-observational-equivalence/invariant_coarseness.py
# Computational evidence is never proof.

from itertools import product


def dihedral8():
    """Multiplication table of D8 = <r, s | r^4 = s^2 = 1, s r s = r^-1>.
    Elements are pairs (i, j) with r^i s^j, encoded as 2*i + j in 0..7."""
    def mul(x, y):
        ix, jx = divmod(x, 2)
        iy, jy = divmod(y, 2)
        # (r^ix s^jx)(r^iy s^jy) = r^(ix + (-1)^jx iy) s^(jx + jy)
        i = (ix + (iy if jx == 0 else -iy)) % 4
        j = (jx + jy) % 2
        return 2 * i + j
    return list(range(8)), mul


def quaternion8():
    """Multiplication table of Q8 = {1, -1, i, -i, j, -j, k, -k}.
    Encoding: 0:1, 1:-1, 2:i, 3:-i, 4:j, 5:-j, 6:k, 7:-k."""
    def sign_of(x):
        return -1 if x % 2 == 1 else 1

    def unit(x):
        return x // 2  # 0:1, 1:i, 2:j, 3:k

    def unit_mul(a, b):
        table = {
            (0, 0): (1, 0), (0, 1): (1, 1), (0, 2): (1, 2), (0, 3): (1, 3),
            (1, 0): (1, 1), (1, 1): (-1, 0), (1, 2): (1, 3), (1, 3): (-1, 2),
            (2, 0): (1, 2), (2, 1): (-1, 3), (2, 2): (-1, 0), (2, 3): (1, 1),
            (3, 0): (1, 3), (3, 1): (1, 2), (3, 2): (-1, 1), (3, 3): (-1, 0),
        }
        return table[(a, b)]

    def mul(x, y):
        sgn, u = unit_mul(unit(x), unit(y))
        sgn = sgn * sign_of(x) * sign_of(y)
        return 2 * u + (1 if sgn == -1 else 0)

    return list(range(8)), mul


def conjugacy_classes(elements, mul):
    """Conjugacy classes by brute force over all pairs."""
    seen = set()
    classes = []
    for g in elements:
        if g in seen:
            continue
        cls = set()
        for x in elements:
            # x g x^{-1}; find inverse by search
            xinv = next(y for y in elements if mul(x, y) == elements[0])
            cls.add(mul(mul(x, g), xinv))
        seen |= cls
        classes.append(sorted(cls))
    return classes


def element_orders(elements, mul):
    """Order of each element by repeated multiplication."""
    orders = {}
    for g in elements:
        n = 1
        x = g
        while x != elements[0]:
            x = mul(x, g)
            n += 1
        orders[g] = n
    return orders


def linear_characters(elements, mul):
    """All one-dimensional characters: homomorphisms G -> {+1, -1}."""
    e = elements[0]
    rest = elements[1:]
    chars = []
    for signs in product([1, -1], repeat=len(rest)):
        chi = {e: 1}
        chi.update(dict(zip(rest, signs)))
        ok = all(chi[mul(x, y)] == chi[x] * chi[y] for x in elements for y in elements)
        if ok:
            chars.append(chi)
    return chars


def full_character_table(elements, mul):
    """Character table via the regular character: chi_2dim = (chi_reg - sum chi_1dim)/2."""
    e = elements[0]
    classes = conjugacy_classes(elements, mul)
    lin = linear_characters(elements, mul)
    degree2 = {}
    for g in elements:
        reg = len(elements) if g == e else 0
        s = sum(c[g] for c in lin)
        val = (reg - s) // 2
        assert 2 * val == reg - s  # integrality
        degree2[g] = val
    # Column value of a class: a character is constant on classes.
    def class_value(chi, cls):
        vals = {chi[g] for g in cls}
        assert len(vals) == 1
        return vals.pop()

    table = []
    for chi in lin:
        table.append([class_value(chi, cls) for cls in classes])
    table.append([class_value(degree2, cls) for cls in classes])
    return classes, table


def canonicalize(classes, table):
    """Order classes: identity class first, other singleton second, then by
    column signature. Returns the table with columns in canonical order."""
    # The identity class is the class containing element 0 in both encodings.
    identity_idx = next(j for j, cls in enumerate(classes) if 0 in cls and len(cls) == 1)
    singleton_idx = [j for j, cls in enumerate(classes) if len(cls) == 1 and j != identity_idx]
    others = [j for j in range(len(classes)) if j != identity_idx and j not in singleton_idx]
    order = [identity_idx] + sorted(singleton_idx) + sorted(
        others, key=lambda j: tuple(row[j] for row in table)
    )
    new_table = [[row[j] for j in order] for row in table]
    new_classes = [classes[j] for j in order]
    return new_classes, new_table


def compare_character_tables():
    """Compute both tables from multiplication tables and compare."""
    results = {}
    for name, (elements, mul) in [("D8", dihedral8()), ("Q8", quaternion8())]:
        classes, table = full_character_table(elements, mul)
        classes, table = canonicalize(classes, table)
        orders = element_orders(elements, mul)
        order_counts = {}
        for o in orders.values():
            order_counts[o] = order_counts.get(o, 0) + 1
        results[name] = {
            "classes": [len(c) for c in classes],
            "table": table,
            "order_counts": order_counts,
        }
        print(name, "class sizes:", results[name]["classes"])
        for row in table:
            print("   ", row)
        print(name, "element-order counts:", order_counts)

    tables_equal = results["D8"]["table"] == results["Q8"]["table"]
    orders_differ = results["D8"]["order_counts"] != results["Q8"]["order_counts"]
    return {
        "tables_equal": tables_equal,
        "orders_differ": orders_differ,
        "D8": results["D8"],
        "Q8": results["Q8"],
    }


def main():
    outcome = compare_character_tables()
    print("tables_equal:", outcome["tables_equal"])
    print("orders_differ:", outcome["orders_differ"])
    assert outcome["tables_equal"]
    assert outcome["orders_differ"]
    assert outcome["D8"]["order_counts"] == {1: 1, 2: 5, 4: 2}
    assert outcome["Q8"]["order_counts"] == {1: 1, 2: 1, 4: 6}
    print("PASS: character tables coincide as matrices of numbers")
    print("PASS: element-order data separates the two groups")


if __name__ == "__main__":
    main()
