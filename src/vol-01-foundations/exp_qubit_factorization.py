# Phase D experiment for vol-01-foundations.
# Companion computation for Proposition 7.6: the experiment constructs the two
# factorization isomorphisms Phi_1 and Phi_2 = Phi_1 composed with W inverse,
# applies both to the one fixed abstract vector psi, and computes the Schmidt
# entropy of the coordinate vector in each factorization. Computational
# evidence only; the proof is in the paper.

import numpy as np

LOG2 = np.log(2.0)


def schmidt_coefficients(coords):
    """Schmidt coefficients of a two-qubit pure state (four amplitudes)."""
    M = np.asarray(coords, dtype=complex).reshape(2, 2)
    return np.linalg.svd(M, compute_uv=False)


def entanglement_entropy(coords):
    s = schmidt_coefficients(coords)
    probs = s ** 2
    probs = probs[probs > 1e-12]
    return float(-np.sum(probs * np.log(probs)))


if __name__ == "__main__":
    # fixed abstract vector in H = C^4, given by its basis coordinates
    psi = np.array([1.0, 0.0, 0.0, 0.0], dtype=complex)
    v1 = np.array([1.0, 0.0, 0.0, 0.0], dtype=complex)
    v2 = np.array([0.0, 0.0, 0.0, 1.0], dtype=complex)

    # unitary W of Proposition 7.6: rotation on span{v1, v2}
    W = np.eye(4, dtype=complex)
    W[:, 0] = (v1 + v2) / np.sqrt(2.0)
    W[:, 3] = (v1 - v2) / np.sqrt(2.0)
    assert np.allclose(W.conj().T @ W, np.eye(4)), "W must be unitary"

    # factorization isomorphisms H -> C^2 tensor C^2, as coordinate maps
    Phi1 = np.eye(4, dtype=complex)            # standard factorization
    Phi2 = Phi1 @ W.conj().T                   # pullback along W

    coords1 = Phi1 @ psi
    coords2 = Phi2 @ psi

    e1 = entanglement_entropy(coords1)
    e2 = entanglement_entropy(coords2)

    print(f"coordinate vector in factorization 1: {np.round(coords1, 6)}")
    print(f"coordinate vector in factorization 2: {np.round(coords2, 6)}")
    print(f"entropy in factorization 1: {e1:.12f}")
    print(f"entropy in factorization 2: {e2:.12f}")
    print(f"schmidt coefficients in factorization 2: {schmidt_coefficients(coords2)}")

    ok1 = abs(e1 - 0.0) < 1e-9
    ok2 = abs(e2 - LOG2) < 1e-9
    if ok1 and ok2:
        print("PASS: the fixed vector has entropy 0 and log 2 in the two factorizations")
    else:
        print("FAIL: entropies did not match Proposition 7.6")
