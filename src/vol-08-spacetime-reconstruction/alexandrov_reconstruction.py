#!/usr/bin/env python3
"""Phase D experiment: the Alexandrov (diamond) topology of a finite order.

Evidences (computational evidence, never proof):
  The order-to-topology step of causal reconstruction: the closure of each
  singleton is its down-set, so the topology of a finite order recovers the
  order, and the topology is T0.

Run: python3 alexandrov_reconstruction.py
"""


def upsets(le, n):
    """All up-sets of a finite order (the open sets of the Alexandrov topology)."""
    opens = []
    for bits in range(1 << n):
        s = {x for x in range(n) if bits >> x & 1}
        if all(not (x in s and le[x][y]) or y in s for x in range(n) for y in range(n)):
            opens.append(frozenset(s))
    return opens


def closures(opens, n):
    """Closure of each singleton: the intersection of all closed sets
    containing x, computed as the complement of the union of opens missing x."""
    cl = []
    for x in range(n):
        closed_x = []
        for o in opens:
            if x not in o:
                closed_x.append(frozenset(range(n)) - o)
        inter = frozenset(range(n))
        for c in closed_x:
            inter &= c
        cl.append(inter)
    return cl


def alexandrov_topology(le, n):
    """Check T0 and that closures equal down-sets, so the order is recovered."""
    opens = upsets(le, n)
    cl = closures(opens, n)
    down = [{y for y in range(n) if le[y][x]} for x in range(n)]
    closures_are_downsets = all(cl[x] == frozenset(down[x]) for x in range(n))
    t0 = all(
        any((x in o) != (y in o) for o in opens)
        for x in range(n) for y in range(n) if x != y
    )
    recovered = all((x in cl[y]) == le[x][y] for x in range(n) for y in range(n))
    return t0 and closures_are_downsets and recovered


if __name__ == "__main__":
    print("=== alexandrov_reconstruction: Phase D evidence (not proof) ===")
    cases = {
        "two-point chain (0 <= 1)": (
            [[True, True], [False, True]], 2),
        "two-point antichain": (
            [[True, False], [False, True]], 2),
        "three-point V (0 <= 1, 0 <= 2)": (
            [[True, True, True], [False, True, False], [False, False, True]], 3),
    }
    for name, (le, n) in cases.items():
        ok = alexandrov_topology(le, n)
        print(f"  {name}: recovery check {'PASS' if ok else 'FAIL'}")
        assert ok
    print("alexandrov recovery: PASS")
