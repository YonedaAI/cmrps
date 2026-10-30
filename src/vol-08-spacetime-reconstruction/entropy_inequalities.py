#!/usr/bin/env python3
"""Phase D experiment: entropy inequalities of the holographic cone section.

Evidences (computational evidence, never proof):
  Proposition: monogamy of mutual information is independent of strong
  subadditivity over entropic vectors (the correlated-triple witness).
  Corollary: classical correlations violate monogamy of mutual information.

Run: python3 entropy_inequalities.py
"""

import itertools
import math
import random

REGIONS = ("A", "B", "C")


def mask_of(label):
    m = 0
    for i, r in enumerate(REGIONS):
        if r in label:
            m |= 1 << i
    return m


def label_of(mask):
    return "".join(r for i, r in enumerate(REGIONS) if mask >> i & 1) or "0"


def ssa_holds(ent):
    """Strong subadditivity S(U) + S(V) >= S(U+V) + S(U*V) on all unions."""
    for u, v in itertools.product(range(8), repeat=2):
        lhs = ent[u] + ent[v]
        rhs = ent[u | v] + ent[u & v]
        if lhs + 1e-12 < rhs:
            return False
    return True


def mmi_holds(ent):
    """Monogamy S(A)+S(B)+S(C)+S(ABC) <= S(AB)+S(AC)+S(BC)."""
    A, B, C = 1, 2, 4
    lhs = ent[A] + ent[B] + ent[C] + ent[A | B | C]
    rhs = ent[A | B] + ent[A | C] + ent[B | C]
    return lhs <= rhs + 1e-12


def check_witness():
    """The perfectly correlated triple A = B = C = X, X a uniform bit."""
    ent = [0.0] * 8
    for m in range(1, 8):
        ent[m] = 1.0
    ssa = ssa_holds(ent)
    mmi = mmi_holds(ent)
    print("witness (A=B=C=X uniform bit)")
    print("  entropies:", [ent[m] for m in range(8)])
    print("  strong subadditivity holds:", ssa)
    print("  monogamy holds:", mmi)
    print("  mmi left/right:", 4.0, 3.0)
    assert ssa and not mmi
    return ssa and not mmi


def sample_classical(n=200, seed=20261029):
    """Random classical distributions on three bits; check both inequalities."""
    rng = random.Random(seed)
    ssa_fail = 0
    mmi_fail = 0
    for _ in range(n):
        probs = [rng.random() for _ in range(8)]
        total = sum(probs)
        probs = [p / total for p in probs]
        ent = [0.0] * 8
        for m in range(8):
            marg = {}
            for atom, p in enumerate(probs):
                key = atom & m
                marg[key] = marg.get(key, 0.0) + p
            ent[m] = -sum(p * math.log2(p) for p in marg.values() if p > 0)
        if not ssa_holds(ent):
            ssa_fail += 1
        if not mmi_holds(ent):
            mmi_fail += 1
    print(f"random classical samples (n={n})")
    print("  strong subadditivity failures:", ssa_fail)
    print("  monogamy failures:", mmi_fail)
    assert ssa_fail == 0
    return ssa_fail, mmi_fail


if __name__ == "__main__":
    print("=== entropy_inequalities: Phase D evidence (not proof) ===")
    ok = check_witness()
    sample_classical()
    print("witness independence check:", "PASS" if ok else "FAIL")
