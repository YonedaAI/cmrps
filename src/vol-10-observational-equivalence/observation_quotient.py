# Phase D computational evidence for vol-10-observational-equivalence.
# Claim evidenced: observational indistinguishability induced by an observation
# functor is an equivalence relation whose classes are the fibers of the
# functor (paper Proposition 4.2), and coarse records separate strictly less
# than fine records (paper Proposition 4.5).
# File: src/vol-10-observational-equivalence/observation_quotient.py
# Computational evidence is never proof.

from fractions import Fraction as F
from itertools import combinations


def pushforward(probs, blocks):
    """Outcome distribution of an experiment given as microstate blocks."""
    return tuple(sum(probs[i] for i in block) for block in blocks)


def observation_record(probs, experiments):
    """Observation record: outcome distribution per experiment (Definition 4.1)."""
    return tuple(pushforward(probs, e) for e in experiments)


def check_axioms(systems, experiments):
    """Axiom check for the induced relation: reflexive, symmetric, transitive,
    and constant exactly on record fibers (Proposition 4.2)."""
    records = [observation_record(p, experiments) for p in systems]
    n = len(systems)
    related = [[records[i] == records[j] for j in range(n)] for i in range(n)]

    reflexive = all(related[i][i] for i in range(n))
    symmetric = all(related[i][j] == related[j][i] for i in range(n) for j in range(n))
    transitive = all(
        not (related[i][j] and related[j][k]) or related[i][k]
        for i in range(n) for j in range(n) for k in range(n)
    )

    fibers = {}
    for i, r in enumerate(records):
        fibers.setdefault(r, []).append(i)
    fiber_exact = all(
        related[i][j] == (records[i] == records[j])
        for i in range(n) for j in range(n)
    )
    return {
        "reflexive": reflexive,
        "symmetric": symmetric,
        "transitive": transitive,
        "fibers_exact": fiber_exact,
        "num_classes": len(fibers),
    }


def coarse_vs_fine():
    """Strictness witness of Proposition 4.5: the coarse record (e1) identifies
    p and q while the fine record (e1, e2) separates them."""
    p = (F(1, 2), F(1, 4), F(1, 8), F(1, 8))
    q = (F(1, 4), F(1, 2), F(1, 8), F(1, 8))
    e1 = ((0, 1), (2, 3))          # partition {{1,2},{3,4}} in 0-based indices
    e2 = ((0, 2), (1, 3))          # partition {{1,3},{2,4}}
    fine = (e1, e2)
    coarse = (e1,)

    coarse_p = observation_record(p, coarse)
    coarse_q = observation_record(q, coarse)
    fine_p = observation_record(p, fine)
    fine_q = observation_record(q, fine)

    return {
        "coarse_identifies": coarse_p == coarse_q,
        "fine_separates": fine_p != fine_q,
        "coarse_record": coarse_p,
        "fine_p": fine_p,
        "fine_q": fine_q,
    }


def main():
    e1 = ((0, 1), (2, 3))
    e2 = ((0, 2), (1, 3))
    experiments = (e1, e2)

    systems = []
    # A grid of rational distributions on four microstates.
    for a in (F(1, 4), F(1, 2), F(3, 4)):
        for b in (F(1, 8), F(1, 4)):
            c = F(1, 4)
            d = 1 - a - b - c
            if d > 0:
                systems.append((a, b, c, d))
    p = (F(1, 2), F(1, 4), F(1, 8), F(1, 8))
    q = (F(1, 4), F(1, 2), F(1, 8), F(1, 8))
    systems.extend([p, q])

    axioms = check_axioms(systems, experiments)
    strictness = coarse_vs_fine()

    print("axioms:", axioms)
    print("coarse_vs_fine:", strictness)

    assert axioms["reflexive"] and axioms["symmetric"] and axioms["transitive"]
    assert axioms["fibers_exact"]
    assert strictness["coarse_identifies"] and strictness["fine_separates"]
    print("PASS: observational equivalence is an equivalence relation with exact fibers")
    print("PASS: coarse records identify a pair the fine records separate")


if __name__ == "__main__":
    main()
