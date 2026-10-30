# dimvec_enumeration.py
# Claim evidenced (paper, Section 8): unital finite-dimensional complex
# C*-algebras of complex dimension N are finitely many, listed by dimension
# vectors (multisets of matrix block sizes with sum of squares equal to N).
# The script enumerates them exhaustively up to a bound.  Finiteness per
# dimension is the tame-side contrast to the wild non-parametrization results;
# the enumeration is computational evidence, never proof.

def enumerate_dimension_vectors(N):
    """All multisets of block sizes (n_i >= 1) with sum n_i^2 == N.

    Each multiset is returned once, as a descending tuple.  The multiset of
    block sizes is the dimension vector classifying a unital finite-dimensional
    complex C*-algebra up to *-isomorphism.
    """
    results = []

    def extend(prefix, max_size, remaining):
        if remaining == 0:
            results.append(tuple(sorted(prefix, reverse=True)))
            return
        for size in range(min(max_size, int(remaining ** 0.5)), 0, -1):
            square = size * size
            if square <= remaining:
                extend(prefix + [size], size, remaining - square)

    extend([], N, N)
    # Deduplicate: combinations_with_replacement ordering is not used above.
    return sorted(set(results), reverse=True)


def all_dimension_vectors(max_N):
    """Enumerate dimension vectors for every N in 1..max_N."""
    return {N: enumerate_dimension_vectors(N) for N in range(1, max_N + 1)}


if __name__ == "__main__":
    bound = 24
    table = all_dimension_vectors(bound)
    for N, vectors in table.items():
        print(f"N={N}: {len(vectors)} algebra(s)  {list(vectors)}")
    # Paper's worked values: N=5 has exactly two, N=8 exactly three.
    assert len(enumerate_dimension_vectors(5)) == 2, "N=5 count mismatch"
    assert len(enumerate_dimension_vectors(8)) == 3, "N=8 count mismatch"
    for N, vectors in table.items():
        for vec in vectors:
            assert sum(s * s for s in vec) == N, f"{vec} does not sum to {N}"
    print(f"enumeration check: PASS (all dimensions up to {bound} finite)")
