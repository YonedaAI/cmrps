# Conjectures and open problems: vol-07-gauge-qft

**Module:** lean/Cmrps/Vol07GaugeQft.lean
**Paper:** papers/latex/vol-07-gauge-qft.tex
**Date:** 2026-10-30

Statements below are unproved on the public record (or proved only informally in the paper's
cited literature). None is claimed as machine-checked. Cross-references: verification/vol-07-gauge-qft-claim-status.md.

The ten mechanization targets are NOT listed here: each has a complete informal proof in the
paper (or its cited literature), so their Lean status is `complete-informal-proof`, not
`conjecture`. What is listed here is what has no complete proof anywhere in the record.

## C-1. Cobordism hypothesis (paper `conj:cobordism`)

The n-dimensional extended unitary topological quantum field theories valued in a symmetric
monoidal (∞, n)-category are classified by fully dualizable objects of the target equipped with
an O(n)-action. A fully extended theory is a symmetric monoidal n-functor out of the free stable
weak n-category with duals on a point.

Status: conjecture. The 1995 paper states the hypothesis; the 2009 writeup describes itself as
an informal sketch of a proof; the range of cases with complete proofs is not settled on the
public record. No result in vol-07 depends on it as a theorem. Deliberately absent from the
Lean targets file.

## C-2. Classification of connections modulo gauge

There is no known invariant that classifies the moduli space of connections on a fixed
principal G-bundle modulo the gauge group, in general. The bundle classification gives only the
topological stratification; the analytic moduli spaces of connections are neither classified
nor reconstructed.

Status: open-problem. The paper records no classification theorem (Table `tab:invariants`,
"Connections modulo gauge — None known in general"). Not a Lean target.

## C-3. Global anomalies after local obstruction classes vanish

A global anomaly may remain after the local obstruction classes (determinant line
trivializability, vanishing of the BRST class in H^{1,n}(s|d)) vanish. A full classification of
global anomalies is a further open problem; the paper's Proposition `prop:anomaly` covers the
local layer only.

Status: open-problem. Not a Lean target. The Lean rows `QuantizationGate` / `not_quantization_gate_*`
machine-check the local vanishing logic only and say nothing about global anomalies.

## C-4. Yang–Mills mass gap (Clay, series row T-OP-03)

Prove that for any compact simple gauge group G (e.g. SU(3)) the four-dimensional quantum
Yang–Mills theory exists and has a positive mass gap.

Status: open-problem (Clay Mathematics Institute lists it as Unsolved). Existence and mass gap
are never conflated in this series: an existence theorem alone would not settle this conjecture.

## C-5. Existence of a four-dimensional interacting theory (series row CL-01)

A 4d QCD, a simplest GUT completion, and the pure Yang–Mills subproblem have been announced as
solved by Balaban-program methods.

Status: conjecture. The manuscript and formalization are withheld; verification is pending.
Never machine-checked. No withheld formalization may be described as machine-checked.

## C-6. Reflection-positive 4d SU(N) with mass gap and confinement (series row CL-02)

A construction of a reflection-positive four-dimensional SU(N) gauge theory with a mass gap and
confinement has been published in a journal.

Status: conditional. Journal-published but unverified on the series' record. Registered here as
an unverified claim, not as a theorem.

## C-7. Existence and mass gap via a 5d orbifold regulator (series row CL-03)

An existence-and-mass-gap construction for 4d gauge theory via a five-dimensional orbifold
regulator was announced.

Status: conjecture (withdrawn). The preprint was withdrawn and the row carries no status; it is
recorded only to keep the claims landscape complete.

## C-8. Three-dimensional mass-gap proof outline (series row CL-05)

A proof outline for a mass gap in three-dimensional gauge theory.

Status: conjecture. A preprint outline with no complete proof and no status on the record.
