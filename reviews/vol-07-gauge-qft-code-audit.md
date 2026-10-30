# Code evidence audit: vol-07-gauge-qft

**Reviewer:** codex (OpenAI) gpt-6.1-sol, read-only, code-audit type
**Paper:** papers/latex/vol-07-gauge-qft.tex
**Rounds:** 2 (Stage 5b invocation cap reached)
**Date:** 2026-10-30

## Outcome

The code evidence appendix in the paper now carries exactly one row, which the auditor judged fully supported:

ROW 2 | Chevalley-Eilenberg classes of Example 5.2 compute as stated | SUPPORTS | Exact rational differentials and matrix ranks compute and assert the example's H^1 dimension one and H^2 dimension zero.

**WARN: code-audit removed 3 rows.** Rows 1, 3, and 4 of the appendix (sphere-bundle table reproduction, Frobenius gluing checks, Dynkin enumeration) were judged not fully supported by the named code at the auditor's bar after two rounds: the scripts compute or reproduce finite data but do not derive the classification theorems they illustrated. Per the Stage 5b protocol those rows and their claims have been removed from the paper. The three scripts remain in src/vol-07-gauge-qft/ as worked illustrations, described as such in Section 9 with no evidentiary claim attached.

## Round record

- Round 1 (reviews/vol-07-gauge-qft-code-audit-round-1.md): two rows fully supported, two rows partially supported (homotopy labels hardcoded and one detector misstated; enumeration pruned above rank four). Fixes applied: the SO(3) over S^4 detector was corrected to the first Pontryagin number, the sphere-bundle claim was scoped to value reproduction, and the Dynkin enumeration was rewritten to test every arrow assignment at every rank up to eight with no pruning (the unpruned run reproduces the same 31 finite-type classes).
- Round 2 (reviews/vol-07-gauge-qft-code-audit-round-2.md): one row fully supported, three rows partially supported (the auditor requires derivation rather than table reproduction, arbitrary cobordism decompositions rather than the tested genera, and explicit treatment of cyclic candidates). At the invocation cap, the three rows and their claims were removed from the paper and this record closes the audit.

## GATE CHECK

```
test -f reviews/vol-07-gauge-qft-code-audit.md && ! grep -qE '\| *(PARTIAL|NO) *\|' reviews/vol-07-gauge-qft-code-audit.md && echo "CODE AUDIT OK" || echo "CODE AUDIT FAIL"
```

CODE AUDIT OK
