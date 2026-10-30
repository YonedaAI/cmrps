# Code evidence audit: vol-02-structural-families

**Paper:** `papers/latex/vol-02-structural-families.tex`
**Source round:** `reviews/vol-02-structural-families-code-audit-round-2.md` (round 2 of 2; round 1 marked row 1 PARTIAL and the script was strengthened so the Kraus rank is computed rather than asserted)
**Rows audited:** 4

ROW 1 | Kraus rank constant on positive-dimensional channel family | SUPPORTS | Gaussian elimination computes rank one for all 12 distinct sampled unitary channels in the continuous phase family.
ROW 2 | Dimension vectors enumerate sectors at fixed dimension | SUPPORTS | The script exhaustively enumerates sorted positive-integer multisets whose squares sum to n and reports counts for dimensions 1–12.
ROW 3 | All ten families have declared taxonomy instances | SUPPORTS | Instances.hs imports the taxonomy classes and declares a corresponding family instance for each of the ten families.
ROW 4 | Family tags carry ontology identifiers | SUPPORTS | familyTagOf and familyDefIds pair family tags with identifiers obtained through the taxonomy accessor familyDefId.

VERDICT: PASS

Every row is SUPPORTS. The gate condition is met.
