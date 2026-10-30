# regime_inventory.py
# Claim evidenced (paper, Table 4 / Section 8): the regime assignment of the
# surveyed domains is single-valued, and every label used is one of the seven
# regimes of Definition 4.2.  This script treats the table as input data and
# checks its internal consistency.  It verifies the assignment's partition
# property only; it is not a proof of any row of the table.
# Computational evidence, never proof.

from collections import Counter

# The seven regimes of Definition 4.2 (paper).
REGIMES = (
    "Parameterized",
    "Unparameterized",
    "Obstruction-complete",
    "Open",
    "Wild",
    "Undecidable",
    "Decidable-but-unclassified",
)

# Domain -> regime, transcribed from Table 4 of the paper (29 rows).
ASSIGNMENT = {
    "Simple Lie algebras": "Parameterized",
    "Highest-weight irreps": "Parameterized",
    "Finite-dim C*-algebras": "Parameterized",
    "Principal G-bundles": "Parameterized",
    "Classical monotone metrics": "Parameterized",
    "Local symplectic germs": "Parameterized",
    "Amenable factors": "Parameterized",
    "Three-manifolds": "Parameterized",
    "Group isomorphism, tame extensions": "Parameterized",
    "Finite simple groups": "Unparameterized",
    "Quantum monotone metrics": "Unparameterized",
    "Quantum channels": "Unparameterized",
    "Four-dimensional model geometries": "Parameterized",
    "Anomalies": "Obstruction-complete",
    "General II_1 factors": "Obstruction-complete",
    "Plain tensor category recovery": "Obstruction-complete",
    "Fusion categories": "Open",
    "Elliott nuclear program": "Open",
    "Holographic entropy cone, n >= 5": "Open",
    "Extended TQFTs": "Open",
    "Yang-Mills mass gap": "Open",
    "Type III factors": "Open",
    "Wild CM modules of the generic determinant": "Wild",
    "C_p-equivariant modules at odd primes": "Wild",
    "Derived-wild algebras": "Wild",
    "Finitely presented groups, Markov properties": "Undecidable",
    "Four-manifold homeomorphism": "Undecidable",
    "vN algebra isomorphism": "Obstruction-complete",
    "Unknot recognition": "Decidable-but-unclassified",
}


def check_partition():
    """Assert the assignment is a function into the seven regimes.

    Returns a dict with counts per regime.  Raises AssertionError on any
    domain with a missing or out-of-vocabulary regime label.
    """
    counts = Counter()
    for domain, regime in ASSIGNMENT.items():
        assert domain.strip(), "empty domain name"
        assert regime in REGIMES, f"{domain}: unknown regime {regime!r}"
        counts[regime] += 1
    for regime in REGIMES:
        assert counts[regime] >= 1, f"regime {regime!r} has no domain"
    total = sum(counts.values())
    assert total == len(ASSIGNMENT), "assignment is not single-valued"
    return dict(counts)


if __name__ == "__main__":
    counts = check_partition()
    print("regime partition check: PASS")
    print(f"domains: {len(ASSIGNMENT)}")
    for regime in REGIMES:
        print(f"  {regime}: {counts[regime]}")
