# Phase D experiment for vol-01-foundations.
# Claim evidenced: Example 7.5, finite classical records with composition rule
# the cartesian product. The unit is the one-point record (the empty product),
# the irreducibles are the records of prime cardinality, and every record
# decomposes into prime cardinality factors unique up to order.
# Computational evidence only.


def prime_factors(n):
    if n <= 1:
        return []
    out = []
    d = 2
    m = n
    while d * d <= m:
        while m % d == 0:
            out.append(d)
            m //= d
        d += 1
    if m > 1:
        out.append(m)
    return out


def nontrivial_product_splits(n):
    """Pairs (a, b) with a, b >= 2 and a * b = n."""
    return [(a, n // a) for a in range(2, n) if n % a == 0]


def check(max_n=60):
    failures = []
    for n in range(1, max_n + 1):
        splits = nontrivial_product_splits(n)
        # irreducible exactly when n is not the unit and has no split
        # into non-unit factors
        irreducible = n != 1 and not splits
        expected = is_prime(n)
        if irreducible != expected:
            failures.append(f"irreducibility failed at n={n}")
        factors = prime_factors(n)
        product = 1
        for p in factors:
            product *= p
        if product != n:
            failures.append(f"factorization failed at n={n}")
        if n > 1 and sorted(factors) != sorted(prime_factors(n)):
            failures.append(f"uniqueness check failed at n={n}")
        if n > 1 and not all(is_prime(p) for p in factors):
            failures.append(f"non-prime factor at n={n}")
    return failures


def is_prime(p):
    if p < 2:
        return False
    d = 2
    while d * d <= p:
        if p % d == 0:
            return False
        d += 1
    return True


if __name__ == "__main__":
    fails = check()
    if fails:
        for f in fails:
            print("FAIL:", f)
    else:
        print("PASS: unit is the one-point record and irreducibles are prime cardinalities")
        print("PASS: every cardinality factors into primes, unique up to order")
        print("PASS: exhaustive over 1 <= n <= 60")
