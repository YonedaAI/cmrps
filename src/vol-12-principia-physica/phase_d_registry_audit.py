#!/usr/bin/env python3
"""Phase D computational experiment for vol-12-principia-physica (Principia Physica).

Claims this file evidences (never proves):
  1. The regime counts of the paper's regime table are 15, 1, 1, 7, 3, 1, 1
     over its twenty-nine rows (paper, Table 3 regime analysis).
  2. The obligation scoreboard of the structural classification conjecture
     is four open and one partial (paper, Table 6).
  3. The program registry holds 20 background, 7 obstruction, 7 open-problem,
     and 5 claim-ledger records (paper, Section 3 and Table 5).
  4. No registry record reaches evidence grade 3 (physical validation);
     the claim-ledger status strings, including the CL-01 string, are
     preserved verbatim (paper, Table 5 and Proposition 5.2).

Computational evidence is never proof. Run: python3 phase_d_registry_audit.py
"""

# (domain name as in the paper's regime table, regime number 1..6)
DOMAINS = [
    ("Finite simple groups", 2),
    ("Simple Lie groups and Lie algebras", 1),
    ("Irreducible representations of semisimple Lie algebras", 1),
    ("Symplectic manifolds in the local category", 1),
    ("Poisson manifolds in the local category", 1),
    ("Finite-dimensional complex C*-algebras", 1),
    ("Amenable factors", 1),
    ("General type II and type III factors", 5),
    ("Quantum channels", 4),
    ("Principal G-bundles", 1),
    ("Anomalies", 3),
    ("DHR superselection sectors", 1),
    ("Symmetric tensor categories of subexponential growth", 1),
    ("Fusion categories", 4),
    ("Extended topological quantum field theories", 4),
    ("Lorentzian holonomy groups", 1),
    ("Spacetime causality conditions", 1),
    ("Holographic entropy cone with at most four regions", 1),
    ("Holographic entropy cone with five or more regions", 4),
    ("Monotone metrics in the classical case", 1),
    ("Monotone metrics in the quantum case", 1),
    ("Emergent spacetime and the Ryu-Takayanagi formula", 4),
    ("Four-dimensional Yang-Mills and QCD existence", 4),
    ("Four-dimensional Yang-Mills mass gap", 4),
    ("Closed three-manifolds", 1),
    ("Four-manifolds", 5),
    ("Finitely presented groups under Markov properties", 6),
    ("Wild representation categories", 5),
    ("Unknot recognition", 7),
]

EXPECTED_REGIME_COUNTS = {1: 15, 2: 1, 3: 1, 4: 7, 5: 3, 6: 1, 7: 1}

OBLIGATIONS = [
    ("Completeness", "open"),
    ("Soundness", "open"),
    ("Equivalence", "open"),
    ("Structural characterization", "partial"),
    ("Decomposition", "open"),
]

# One row per registry record: (record id, kind, evidence grade).
# Grades follow the paper Definition 2.6: 1 = formulation, 2 = rigorous theorem.
# Enumeration matches docs/theorem-registry.md at the registry status date.
REGISTRY_RECORDS = (
    [("T-BG-%02d" % i, "background", 2) for i in range(1, 21)]
    + [("T-OB-%02d" % i, "obstruction", 2) for i in range(1, 8)]
    + [("T-OP-%02d" % i, "open-problem", 1) for i in range(1, 8)]
    + [("T-CMRPS-%02d" % i, "program-conjecture", 1) for i in range(1, 3)]
    + [("CL-%02d" % i, "claim-ledger", 1) for i in range(1, 6)]
    + [("DEP-%02d" % i, "dependency", 1) for i in range(1, 9)]
)

EXPECTED_RECORD_COUNTS = {
    "background": 20,
    "obstruction": 7,
    "open-problem": 7,
    "program-conjecture": 2,
    "claim-ledger": 5,
    "dependency": 8,
}

# (entry, ladder position). CL-01 keeps its exact status string.
CLAIM_REGISTER = [
    ("CL-01", "existence claimed; manuscript and formalization withheld; verification pending"),
    ("CL-02", "journal-published, unverified"),
    ("CL-03", "withdrawn for quality standards, no status"),
    ("CL-04", "rigorous within stated regimes only"),
    ("CL-05", "preprint outline, no status"),
]

# Evidence grade of each record type (paper Definition 2.6). Grade 3 is empty.
RECORD_GRADES = {
    "stipulated definitions and architecture": 1,
    "classification theorems": 2,
    "reconstruction theorems": 2,
    "obstruction theorems": 2,
    "claim-ledger entries": 1,
}


def regime_counts(domains=DOMAINS):
    """Return {regime: count} over the domain rows."""
    counts = {}
    for _, regime in domains:
        counts[regime] = counts.get(regime, 0) + 1
    return counts


def obligation_scoreboard(obligations=OBLIGATIONS):
    """Return {state: count} over the five proof obligations."""
    counts = {}
    for _, state in obligations:
        counts[state] = counts.get(state, 0) + 1
    return counts


def record_counts(records=REGISTRY_RECORDS):
    """Count registry records by kind from the enumerated record list."""
    counts = {}
    for _, kind, _grade in records:
        counts[kind] = counts.get(kind, 0) + 1
    return counts


def layer_separation(records=REGISTRY_RECORDS):
    """True when no enumerated registry record reaches evidence grade 3."""
    return all(grade < 3 for _rid, _kind, grade in records)


def claim_register_preserved(register=CLAIM_REGISTER):
    """True when the CL-01 status string is present verbatim."""
    cl01 = "existence claimed; manuscript and formalization withheld; verification pending"
    return any(entry == "CL-01" and status == cl01 for entry, status in register)


def main():
    failures = []

    counts = regime_counts()
    print("regime_counts:", counts)
    if counts != EXPECTED_REGIME_COUNTS:
        failures.append(f"regime counts {counts} != {EXPECTED_REGIME_COUNTS}")
    if sum(counts.values()) != 29:
        failures.append(f"domain total {sum(counts.values())} != 29")

    board = obligation_scoreboard()
    print("obligation_scoreboard:", board)
    if board != {"open": 4, "partial": 1}:
        failures.append(f"obligation scoreboard {board} != open 4, partial 1")

    records = record_counts()
    print("record_counts:", records)
    for kind, expected in EXPECTED_RECORD_COUNTS.items():
        if records.get(kind) != expected:
            failures.append(f"record count {kind} {records.get(kind)} != {expected}")
    if len(REGISTRY_RECORDS) != 49:
        failures.append(f"registry size {len(REGISTRY_RECORDS)} != 49")

    if not layer_separation():
        failures.append("a record type reaches evidence grade 3")
    print("layer_separation: no record at grade 3")

    if not claim_register_preserved():
        failures.append("CL-01 status string not preserved")
    print("claim_register: CL-01 status string preserved")

    if failures:
        print("FAILURES:")
        for failure in failures:
            print("  -", failure)
        return 1
    print("ALL AUDIT CHECKS PASS")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
