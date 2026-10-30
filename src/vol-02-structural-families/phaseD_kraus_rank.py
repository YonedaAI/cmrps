#!/usr/bin/env python3
"""Phase D computational evidence for vol-02-structural-families.

Claim evidenced (paper, Proposition 11.2): the Kraus rank of the minimal
Stinespring dilation is constant on a positive-dimensional family of unitary
channels on M_2, so the assignment from channels to Kraus rank is not
injective and Kraus rank is not a classifying invariant for Family VII.

What this script demonstrates: for a sampled family of unitary channels
Phi_U(X) = U X U* with U in U(2), every channel has Kraus rank exactly one,
while the channels are pairwise distinct as maps. The number of distinct
channels grows with the sample size and the rank never moves.

This is computational evidence and never proof. It is not verified by Lean.
"""

from __future__ import annotations

import cmath
import math


def unitary_2x2(theta: float, phi: float) -> list[list[complex]]:
    """A two-parameter family of unitaries in U(2): diag(e^{i theta}, e^{i phi})."""
    return [
        [cmath.exp(1j * theta), 0.0j],
        [0.0j, cmath.exp(1j * phi)],
    ]


def apply_channel(u: list[list[complex]], x: list[list[complex]]) -> list[list[complex]]:
    """Return U X U* for 2 by 2 matrices."""
    ux = [
        [sum(u[i][k] * x[k][j] for k in range(2)) for j in range(2)]
        for i in range(2)
    ]
    return [
        [sum(ux[i][k] * u[j][k].conjugate() for k in range(2)) for j in range(2)]
        for i in range(2)
    ]


def kraus_rank(operators: list[list[list[complex]]]) -> int:
    """Minimal Kraus rank: the number of linearly independent Kraus operators.

    A Kraus list {A_i} realises a completely positive map, and the minimal
    Stinespring dilation has Kraus rank equal to the dimension of the linear
    span of the A_i. This computes that dimension by Gaussian elimination on
    the vectorised operators, so the rank is derived from the operators rather
    than asserted.
    """
    if not operators:
        return 0
    vecs = []
    for a in operators:
        vecs.append([a[i][j] for i in range(len(a)) for j in range(len(a[0]))])
    # Gaussian elimination over the complex span, tracking pivots.
    basis: list[list[complex]] = []
    for v in vecs:
        w = list(v)
        for b in basis:
            pivot = next((i for i, x in enumerate(b) if abs(x) > 1e-12), None)
            if pivot is None:
                continue
            coeff = w[pivot] / b[pivot]
            w = [w[i] - coeff * b[i] for i in range(len(w))]
        if any(abs(x) > 1e-12 for x in w):
            basis.append(w)
    return len(basis)


def channels_agree(
    u1: list[list[complex]], u2: list[list[complex]]
) -> bool:
    """True when U1 X U1* = U2 X U2* on a basis of M_2."""
    basis = []
    for i in range(2):
        for j in range(2):
            m = [[0.0j] * 2 for _ in range(2)]
            m[i][j] = 1.0 + 0.0j
            basis.append(m)
    for x in basis:
        y1 = apply_channel(u1, x)
        y2 = apply_channel(u2, x)
        for i in range(2):
            for j in range(2):
                if abs(y1[i][j] - y2[i][j]) > 1e-12:
                    return False
    return True


def main() -> None:
    n = 12
    thetas = [2 * math.pi * k / n for k in range(n)]
    phis = [2 * math.pi * k / (2 * n) for k in range(n)]

    pairs = [(thetas[i], phis[i]) for i in range(n)]
    channels = [unitary_2x2(t, p) for (t, p) in pairs]

    # Each unitary channel Phi_U(X) = U X U* has the single Kraus operator U,
    # and the rank is computed from that list rather than assumed.
    ranks = [kraus_rank([u]) for u in channels]

    distinct = 0
    for i in range(len(channels)):
        seen = False
        for j in range(i):
            if channels_agree(channels[i], channels[j]):
                seen = True
                break
        if not seen:
            distinct += 1

    print("Phase D evidence: Kraus rank of unitary channels on M_2")
    print("Paper claim: Proposition 11.2 (kraus_rank_not_injective)")
    print()
    print(f"sample size                : {n}")
    print(f"Kraus rank observed        : {sorted(set(ranks))}")
    print(f"distinct channels observed : {distinct}")
    print()
    all_one = all(r == 1 for r in ranks)
    print(f"every sampled rank is one  : {all_one}")
    print(f"more than one channel      : {distinct > 1}")
    print()
    if all_one and distinct > 1:
        print(
            "RESULT: the rank map is constant on a family with more than one "
            "channel, so it is not injective on this sample."
        )
    else:
        print("RESULT: sample does not exhibit the claimed behaviour; investigate.")


if __name__ == "__main__":
    main()
