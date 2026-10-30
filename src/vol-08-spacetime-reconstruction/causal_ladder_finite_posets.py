#!/usr/bin/env python3
"""Phase D experiment: causal-ladder rungs on finite orders.

Evidences (computational evidence, never proof):
  Proposition: finite orders satisfy the compactness rung (intervals finite)
  and chronology (no increasing loop).
  Proposition: distinguishing fails on the two-point antichain, so the
  causal ladder does not transfer verbatim to finite orders.
  Corollary: rung membership varies across finite orders (a census of which
  rungs hold on all enumerated orders).

The interval-finiteness clause is definitional on a finite ground set; the
census reports it as such. The load-bearing computations are the loop check
and the distinguishing check, which are real tests.

Run: python3 causal_ladder_finite_posets.py
"""

import itertools


def is_partial_order(le, n):
    for x in range(n):
        if not le[x][x]:
            return False
    for x in range(n):
        for y in range(n):
            if le[x][y] and le[y][x] and x != y:
                return False
            for z in range(n):
                if le[x][y] and le[y][z] and not le[x][z]:
                    return False
    return True


def has_increasing_loop(le, n):
    """A strictly increasing loop x0 < x1 < ... < xk < x0 (real test)."""
    strict = [[le[x][y] and x != y for y in range(n)] for x in range(n)]
    for start in range(n):
        stack = [(start, frozenset({start}))]
        while stack:
            node, seen = stack.pop()
            for nxt in range(n):
                if not strict[node][nxt]:
                    continue
                if nxt == start:
                    return True
                if nxt not in seen:
                    stack.append((nxt, seen | {nxt}))
    return False


def intervals_finite(le, n):
    """Order intervals are finite. On a finite ground set this is definitional;
    the check records the maximum interval size so the definitional content is
    explicit rather than hidden."""
    largest = 0
    for x in range(n):
        for y in range(n):
            interval = [z for z in range(n) if le[x][z] and le[z][y]]
            largest = max(largest, len(interval))
    return largest <= n


def past_future(le, x, n):
    past = frozenset(z for z in range(n) if le[z][x] and z != x)
    future = frozenset(z for z in range(n) if le[x][z] and z != x)
    return past, future


def is_distinguishing(le, n):
    """Past-distinguishing and future-distinguishing: for x != y both the
    pasts and the futures differ (matches Definition 2.3 of the paper)."""
    for x in range(n):
        for y in range(n):
            if x == y:
                continue
            px, fx = past_future(le, x, n)
            py, fy = past_future(le, y, n)
            if px == py or fx == fy:
                return False
    return True


def rung_census(max_n=4):
    """Enumerate every partial order on n labeled points for n <= max_n and
    record which ladder rungs (chronology, compactness, distinguishing) hold.
    Returns per-rung failure counts plus the total number of orders."""
    total = 0
    loop_fail = 0
    interval_fail = 0
    distinguishing_pass = 0
    for n in range(1, max_n + 1):
        pairs = [(x, y) for x in range(n) for y in range(n) if x != y]
        for bits in range(1 << len(pairs)):
            le = [[x == y for y in range(n)] for x in range(n)]
            for k, (x, y) in enumerate(pairs):
                if bits >> k & 1:
                    le[x][y] = True
            if not is_partial_order(le, n):
                continue
            total += 1
            if has_increasing_loop(le, n):
                loop_fail += 1
            if not intervals_finite(le, n):
                interval_fail += 1
            if is_distinguishing(le, n):
                distinguishing_pass += 1
    return total, loop_fail, interval_fail, distinguishing_pass


def check_antichain():
    """Two incomparable points: equal empty pasts and equal empty futures, so
    both past- and future-distinguishing fail while compactness holds."""
    n = 2
    le = [[x == y for y in range(n)] for x in range(n)]
    return (not is_distinguishing(le, n)) and intervals_finite(le, n)


if __name__ == "__main__":
    print("=== causal_ladder_finite_posets: Phase D evidence (not proof) ===")
    total, loop_fail, interval_fail, distinguishing_pass = rung_census(max_n=4)
    print(f"partial orders enumerated (n <= 4): {total}")
    print("orders with an increasing loop:", loop_fail)
    print("orders failing interval finiteness:", interval_fail)
    print("orders that are distinguishing:", distinguishing_pass)
    ok = check_antichain()
    print("antichain passes compactness and fails distinguishing:", ok)
    assert loop_fail == 0 and interval_fail == 0 and ok
    assert distinguishing_pass < total  # some finite orders fail distinguishing
    print("finite-order checks: PASS")
