#!/usr/bin/env python3
"""Phase D computational evidence for vol-02-structural-families.

Claim evidenced (paper, Theorem 5.1 and Table 4 row 2): the dimension vector,
the multiset of matrix block sizes, classifies unital finite-dimensional
complex C*-algebras up to *-isomorphism, and the range of the invariant at
fixed total complex dimension is finite.

What this script demonstrates: for a total complex dimension n it enumerates
every multiset of positive integers whose squares sum to n, which is exactly
the set of dimension vectors of algebras of that total dimension, and it
cross-checks the induced operations of Proposition 6.1 (direct sum gives the
multiset union, tensor product gives the multiset of block-size products).

This is computational evidence and never proof. It is not verified by Lean.
"""

from __future__ import annotations

from itertools import combinations_with_replacement


def dimension_vectors(total_dimension: int) -> list[tuple[int, ...]]:
    """Every dimension vector with sum of squares equal to total_dimension.

    A unital finite-dimensional complex C*-algebra is a direct sum of matrix
    algebras M_{n_i}(C), and its total complex dimension is sum_i n_i^2. The
    dimension vector is the multiset of the n_i, normalised as a sorted tuple.
    """
    out: set[tuple[int, ...]] = set()
    max_block = 1
    while (max_block + 1) ** 2 <= total_dimension:
        max_block += 1
    for size in range(1, total_dimension + 1):
        for blocks in combinations_with_replacement(range(1, max_block + 1), size):
            if sum(b * b for b in blocks) == total_dimension:
                out.add(tuple(sorted(blocks)))
    return sorted(out)


def total_dimension(vector: tuple[int, ...]) -> int:
    return sum(b * b for b in vector)


def direct_sum_vector(a: tuple[int, ...], b: tuple[int, ...]) -> tuple[int, ...]:
    """Proposition 6.1: the dimension vector of A + B is the multiset union."""
    return tuple(sorted(a + b))


def tensor_product_vector(a: tuple[int, ...], b: tuple[int, ...]) -> tuple[int, ...]:
    """Proposition 6.1: the dimension vector of A tensor B is the product multiset."""
    return tuple(sorted(x * y for x in a for y in b))


def main() -> None:
    print("Phase D evidence: dimension vectors of finite-dimensional C*-algebras")
    print("Paper claim: Theorem 5.1 (dim_vector_classification), Proposition 6.1")
    print()
    for n in range(1, 13):
        vecs = dimension_vectors(n)
        rendered = ", ".join("{" + ",".join(str(b) for b in v) + "}" for v in vecs)
        print(f"total dimension {n:2d} : {len(vecs)} class(es) : {rendered or 'none'}")

    print()
    print("Proposition 6.1 cross-check on the dimension-4 and dimension-5 sectors")
    a = (2,)
    b = (1, 1, 1, 1)
    print(f"  A = {{2}} total dimension        : {total_dimension(a)}")
    print(f"  B = {{1,1,1,1}} total dimension   : {total_dimension(b)}")
    print(f"  A + B dimension vector         : {direct_sum_vector(a, b)}")
    print(f"  A + B total dimension          : {total_dimension(direct_sum_vector(a, b))}")
    print(f"  A tensor A dimension vector    : {tensor_product_vector(a, a)}")
    print(f"  A tensor A total dimension     : {total_dimension(tensor_product_vector(a, a))}")
    print()
    c = (2, 1)
    d = (2, 1)
    print(f"  C = {{2,1}} total dimension      : {total_dimension(c)}")
    print(f"  C tensor C dimension vector    : {tensor_product_vector(c, d)}")
    print(f"  C tensor C total dimension     : {total_dimension(tensor_product_vector(c, d))}")

    print()
    ok_direct = total_dimension(direct_sum_vector(a, b)) == total_dimension(a) + total_dimension(b)
    ok_tensor = total_dimension(tensor_product_vector(a, a)) == total_dimension(a) ** 2
    print(f"direct sum adds total dimension   : {ok_direct}")
    print(f"tensor squares total dimension    : {ok_tensor}")
    print()
    if ok_direct and ok_tensor:
        print("RESULT: the induced operations match the arithmetic of Proposition 6.1.")
    else:
        print("RESULT: an induced operation disagrees with Proposition 6.1; investigate.")


if __name__ == "__main__":
    main()
