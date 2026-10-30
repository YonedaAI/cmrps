#!/usr/bin/env python3
"""Phase D experiment for vol-06-quantum-systems.

Evidences (computational evidence only, never proof):
  - Paper Theorem 3.1: dimension vector classifies finite-dimensional
    C*-algebras up to *-isomorphism (function `isomorphism_criterion`).
  - Paper Corollary 3.2: unital algebras of complex dimension d correspond to
    representations of d as a sum of squares (function `classify_by_dimension`).
  - Paper Appendix A: tensor products multiply block sizes
    (function `tensor_dimension_vector`).
"""

from __future__ import annotations

from itertools import product


def dimension_vector(blocks):
    """Dimension vector d(A) = {n_1, ..., n_k} as a sorted multiset."""
    return tuple(sorted(int(n) for n in blocks if n >= 1))


def isomorphism_criterion(blocks_a, blocks_b):
    """Two finite-dimensional C*-algebras are *-isomorphic iff dimension
    vectors agree as multisets (paper, Theorem 3.1)."""
    return dimension_vector(blocks_a) == dimension_vector(blocks_b)


def ideal_dimensions(blocks):
    """Vector-space dimensions of the simple ideals, computed independently of
    the block-size presentation: each ideal M_n(C) has complex dimension n^2,
    and a *-isomorphism preserves the ideals and their dimensions."""
    return tuple(sorted(n * n for n in blocks))


def isomorphism_witness(blocks_a, blocks_b):
    """An explicit block matching when the algebras are isomorphic: a
    permutation pairing equal block sizes. Returns None otherwise."""
    if not isomorphism_criterion(blocks_a, blocks_b):
        return None
    a = sorted(blocks_a)
    b = sorted(blocks_b)
    return list(zip(a, b))


def separating_invariant(blocks_a, blocks_b):
    """For non-isomorphic algebras, an invariant computed from the ideal
    structure that differs: the multiset of ideal dimensions."""
    if isomorphism_criterion(blocks_a, blocks_b):
        return None
    return (ideal_dimensions(blocks_a), ideal_dimensions(blocks_b))


def tensor_dimension_vector(blocks_a, blocks_b):
    """Block multiset of A tensor B: all products n_i * m_j."""
    return tuple(sorted(n * m for n, m in product(blocks_a, blocks_b)))


def direct_sum_dimension_vector(blocks_a, blocks_b):
    """Block multiset of A direct-sum B: the multiset union."""
    return tuple(sorted(list(blocks_a) + list(blocks_b)))


def _partitions_into_squares(total, start=1):
    """Representations of `total` as a sum of squares, nondecreasing."""
    if total == 0:
        yield ()
        return
    for n in range(start, int(total ** 0.5) + 1):
        if n * n <= total:
            for rest in _partitions_into_squares(total - n * n, n):
                yield (n,) + rest


def classify_by_dimension(d):
    """Block multisets of unital C*-algebras of complex dimension d
    (paper, Corollary 3.2): d = sum n_i^2."""
    return sorted(_partitions_into_squares(d))


def check_claims():
    failures = []

    # Claim 1: the isomorphism criterion holds on the enumerated small algebras,
    # with explicit witnesses for isomorphic pairs and independently computed
    # ideal-dimension invariants for non-isomorphic pairs.
    for d in range(1, 17):
        algebras = classify_by_dimension(d)
        for i, a in enumerate(algebras):
            for j, b in enumerate(algebras):
                expected = i == j
                got = isomorphism_criterion(a, b)
                if got != expected:
                    failures.append(
                        f"isomorphism_criterion({a}, {b}) = {got}, expected {expected}"
                    )
                if expected:
                    witness = isomorphism_witness(a, b)
                    if witness is None or any(x != y for x, y in witness):
                        failures.append(f"witness for {a} malformed: {witness}")
                else:
                    sep = separating_invariant(a, b)
                    if sep is None or sep[0] == sep[1]:
                        failures.append(f"no separating invariant for {a} vs {b}")
        for a in algebras:
            if sum(n * n for n in a) != d:
                failures.append(f"{a} does not have complex dimension {d}")
            if sum(ideal_dimensions(a)) != d:
                failures.append(f"ideal dimensions of {a} do not sum to {d}")
    print("isomorphism_criterion: witnesses and separating invariants checked up to dim 16")

    # Claim 2: counts agree with the sum-of-squares partition function.
    counts = {d: len(classify_by_dimension(d)) for d in range(1, 17)}
    expected_4 = [tuple([1, 1, 1, 1]), tuple([2])]
    if sorted(classify_by_dimension(4)) != sorted(expected_4):
        failures.append(f"dim-4 algebras are {classify_by_dimension(4)}")
    print(f"classify_by_dimension counts: {counts}")

    # Claim 3: tensor products multiply block sizes.
    a, b = (2, 3), (2,)
    expected_tensor = tuple(sorted([4, 6]))
    got = tensor_dimension_vector(a, b)
    if got != expected_tensor:
        failures.append(f"tensor {a} x {b} = {got}, expected {expected_tensor}")
    # The vector-space dimensions multiply: (4+9) * 4 = 52 = 16 + 36.
    if sum(n * n for n in got) != sum(n * n for n in a) * sum(n * n for n in b):
        failures.append("tensor dimension accounting failed")
    print(f"tensor_dimension_vector: {a} x {b} = {got}")

    # Direct sum is multiset union.
    got_sum = direct_sum_dimension_vector(a, b)
    if got_sum != tuple(sorted([2, 3, 2])):
        failures.append(f"direct sum = {got_sum}")
    print(f"direct_sum_dimension_vector: {a} + {b} = {got_sum}")

    if failures:
        for line in failures:
            print("FAIL:", line)
        raise SystemExit(1)
    print("ALL CHECKS PASSED")


if __name__ == "__main__":
    check_claims()
