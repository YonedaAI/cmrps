#!/usr/bin/env python3
"""Phase D experiment for vol-04-yoneda-classification.

Evidences (computational evidence only, never proof):
  - Proposition (Choi correspondence and composition): the Choi assignment is
    a linear bijection, complete positivity corresponds to positivity of the
    Choi matrix, trace preservation corresponds to Tr_m J = I, and composition
    of channels is the index contraction of the proposition.
  Functions: check_choi_bijection, check_composition.

Run: python3 choi_duality.py
"""

import numpy as np

rng = np.random.default_rng(20261029)


def random_kraus(n, m, k=None):
    """Random completely positive map M_n -> M_m via Kraus operators."""
    if k is None:
        k = m * n
    ks = [rng.normal(size=(m, n)) + 1j * rng.normal(size=(m, n)) for _ in range(k)]
    return ks


def apply_kraus(ks, X):
    return sum(K @ X @ K.conj().T for K in ks)


def choi_matrix(ks, n, m):
    """J(Phi) = sum_ij E_ij (x) Phi(E_ij) in M_n (x) M_m."""
    J = np.zeros((n * m, n * m), dtype=complex)
    for i in range(n):
        for j in range(n):
            E = np.zeros((n, n), dtype=complex)
            E[i, j] = 1.0
            J += np.kron(E, apply_kraus(ks, E))
    return J


def partial_trace_m(J, n, m):
    """Trace over the second tensor factor of M_n (x) M_m."""
    T = np.zeros((n, n), dtype=complex)
    Jb = J.reshape(n, m, n, m)
    for a in range(m):
        T += Jb[:, a, :, a]
    return T


def make_trace_preserving(ks, n, m):
    """Renormalize Kraus data so the map is trace preserving (Stinespring form)."""
    S = sum(K.conj().T @ K for K in ks)
    vals, vecs = np.linalg.eigh(S)
    vals = np.clip(vals.real, 1e-12, None)
    W = vecs @ np.diag(vals ** -0.5) @ vecs.conj().T
    return [K @ W for K in ks]


def choi_to_map(J, n, m):
    """Recover Phi from J: Phi(E_ij) is the (i,j) block of J."""
    Jb = J.reshape(n, m, n, m)
    def phi(X):
        out = np.zeros((m, m), dtype=complex)
        for i in range(n):
            for j in range(n):
                out += X[i, j] * Jb[i, :, j, :]
        return out
    return phi


def check_choi_bijection():
    """Choi assignment: bijection, positivity <-> CP, Tr_m J = I <-> TP.

    Tests several sampled channels and the reverse direction: an arbitrary
    positive semidefinite Choi matrix with Tr_m J = I is factored into Kraus
    operators and rebuilt, recovering the same matrix.
    """
    ok = True
    for trial in range(4):
        n, m = 2, 3
        ks = make_trace_preserving(random_kraus(n, m), n, m)
        J = choi_matrix(ks, n, m)

        eig = np.linalg.eigvalsh(J)
        pos_ok = eig.min() > -1e-10

        T = partial_trace_m(J, n, m)
        tp_ok = np.allclose(T, np.eye(n), atol=1e-8)

        phi = choi_to_map(J, n, m)
        rec_ok = True
        for _ in range(5):
            X = rng.normal(size=(n, n)) + 1j * rng.normal(size=(n, n))
            if not np.allclose(phi(X), apply_kraus(ks, X), atol=1e-8):
                rec_ok = False

        # reverse direction: arbitrary PSD Choi matrix with Tr_m J = I
        A = rng.normal(size=(n * m, n * m)) + 1j * rng.normal(size=(n * m, n * m))
        J0 = A @ A.conj().T
        # normalize so that Tr_m J0 = I_n: apply (W kron I) on both sides
        Jb = J0.reshape(n, m, n, m)
        T0 = np.zeros((n, n), dtype=complex)
        for a in range(m):
            T0 += Jb[:, a, :, a]
        w, U = np.linalg.eigh(T0)
        W = U @ np.diag(w ** -0.5) @ U.conj().T
        Wbig = np.kron(W, np.eye(m))
        J0 = Wbig @ J0 @ Wbig
        # factor J0 into Kraus operators and rebuild
        evals, evecs = np.linalg.eigh(J0)
        ks_rev = []
        for t in range(n * m):
            if evals[t] > 1e-10:
                v = evecs[:, t] * np.sqrt(evals[t])
                ks_rev.append(v.reshape(n, m).T)  # vec convention: m x n
        J_rev = choi_matrix(ks_rev, n, m)
        rev_ok = np.allclose(J_rev, J0, atol=1e-8)
        rev_tp = np.allclose(partial_trace_m(J0, n, m), np.eye(n), atol=1e-8)

        trial_ok = pos_ok and tp_ok and rec_ok and rev_ok and rev_tp
        ok = ok and trial_ok
        status = "PASS" if trial_ok else "FAIL"
        print(f"  Choi trial {trial}: min eig={eig.min():.2e} tp={tp_ok} "
              f"reconstruction={rec_ok} psd-roundtrip={rev_ok} [{status}]")
    return ok


def check_composition():
    """J(Psi o Phi) equals the index contraction of the proposition."""
    n, m, p = 2, 2, 3
    phi_ks = make_trace_preserving(random_kraus(n, m), n, m)
    psi_ks = make_trace_preserving(random_kraus(m, p), m, p)

    Jphi = choi_matrix(phi_ks, n, m)
    Jpsi = choi_matrix(psi_ks, m, p)

    # composed map
    comp_ks = [A @ B for A in psi_ks for B in phi_ks]
    Jcomp = choi_matrix(comp_ks, n, p)

    # contraction: Jcomp_(i alpha),(j beta) = sum_{k,l} Jphi_(i k),(j l) Jpsi_(k alpha),(l beta)
    A = Jphi.reshape(n, m, n, m)
    B = Jpsi.reshape(m, p, m, p)
    C = np.zeros((n, p, n, p), dtype=complex)
    for i in range(n):
        for alpha in range(p):
            for j in range(n):
                for beta in range(p):
                    s = 0.0
                    for k in range(m):
                        for l in range(m):
                            s += A[i, k, j, l] * B[k, alpha, l, beta]
                    C[i, alpha, j, beta] = s
    contract_ok = np.allclose(C, Jcomp.reshape(n, p, n, p), atol=1e-8)
    status = "PASS" if contract_ok else "FAIL"
    err = float(np.max(np.abs(C - Jcomp.reshape(n, p, n, p))))
    print(f"  composition contraction n={n} m={m} p={p}: max error {err:.2e} [{status}]")
    return contract_ok


def main():
    print("choi_duality.py: channel-state duality experiments (computational evidence)")
    ok1 = check_choi_bijection()
    ok2 = check_composition()
    print(f"SUMMARY: check_choi_bijection={'PASS' if ok1 else 'FAIL'} "
          f"check_composition={'PASS' if ok2 else 'FAIL'}")
    return 0 if (ok1 and ok2) else 1


if __name__ == "__main__":
    raise SystemExit(main())
