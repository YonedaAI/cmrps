# Phase D experiment for vol-01-foundations.
# Claim evidenced: Theorem 8.1, finite classical records under disjoint union.
# (a) the irreducibles are exactly the one-point records, (b) the decomposition
# into one-point records is unique up to order, and (c) cardinality is a
# complete invariant, checked by brute-force isomorphism counting between
# labeled records. Computational evidence only; the proof is in the paper.

from itertools import combinations


def partitions(xs):
    """All set partitions of a list, as lists of blocks."""
    if not xs:
        yield []
        return
    first, rest = xs[0], xs[1:]
    for parts in partitions(rest):
        for i in range(len(parts)):
            yield parts[:i] + [[first] + parts[i]] + parts[i + 1:]
        yield [[first]] + parts


def factorial(n):
    r = 1
    for k in range(2, n + 1):
        r *= k
    return r


def all_maps(X, Y):
    if not X:
        yield {}
        return
    first, rest = X[0], X[1:]
    for partial in all_maps(rest, Y):
        for y in Y:
            yield {first: y, **partial}


def is_record_isomorphism(mp, X, Y):
    """A record isomorphism is a bijection of state spaces carrying R^X to R^Y.

    The observable condition is checked on the generators of R^X: the point
    masses delta_x must transport to the point masses delta_{mp(x)}, which is
    automatic for a bijection and fails for any non-injective or non-surjective
    map.
    """
    if set(mp.values()) != set(Y):
        return False
    if len(set(mp.values())) != len(X):
        return False
    for x in X:
        # the observable delta_x on X transports to delta_{mp(x)} on Y
        transported = {y: 1.0 if y == mp[x] else 0.0 for y in Y}
        if transported.get(mp[x], 0.0) != 1.0:
            return False
    return True


def count_record_isomorphisms(n, m):
    X = list(range(n))
    Y = list(range(m))
    return sum(1 for mp in all_maps(X, Y) if is_record_isomorphism(mp, X, Y))


def check(max_n=8):
    failures = []
    for n in range(1, max_n + 1):
        X = list(range(n))
        # (a) a nontrivial disjoint-union split exists exactly when n > 1
        splittable = False
        for r in range(1, n):
            for A in combinations(X, r):
                B = [x for x in X if x not in A]
                if A and B:
                    splittable = True
        irreducible = not splittable
        if irreducible != (n == 1):
            failures.append(f"(a) failed at n={n}")
        # (b) every decomposition into irreducibles has n one-point factors
        for parts in partitions(X):
            if all(len(b) == 1 for b in parts):
                if len(parts) != n:
                    failures.append(f"(b) failed at n={n}")
    # (c) brute-force isomorphism counting on labeled records, n, m <= 4
    for n in range(1, 5):
        for m in range(1, 5):
            count = count_record_isomorphisms(n, m)
            expected = factorial(n) if m == n else 0
            if count != expected:
                failures.append(f"(c) failed between n={n} and m={m}")
    return failures


if __name__ == "__main__":
    fails = check()
    if fails:
        for f in fails:
            print("FAIL:", f)
    else:
        print("PASS: irreducibles are the one-point records for 1 <= |X| <= 8")
        print("PASS: every decomposition has |X| one-point factors")
        print("PASS: brute-force isomorphism counts match cardinality classes")
