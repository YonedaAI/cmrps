---
reviewer: codex (OpenAI) gpt-6.1-sol
type: code-audit
paper: vol-05-classical-systems
round: 2
date: 2026-10-30T05:16:55Z

ROW 1 | Moser homotopy produces a Darboux chart | SUPPORTS | flow_time1 integrates the Moser field, and test_chart_pullback passes with residual 2.442e-15.
ROW 2 | Poisson rank stratification on so(3)* | SUPPORTS | The test passes with rank two at all sampled nonzero points and rank zero at the origin.
ROW 3 | Fisher metric monotonicity under stochastic maps | SUPPORTS | All 200 sampled comparisons pass the positive-semidefinite and tangent-vector slack tolerances.
ROW 4 | Standard symplectic data and witness functions | SUPPORTS | darboux constructs the standard matrix, and weinsteinSplitting uses corrected elimination with rankChecks covering skew, zero, and identity matrices.
ROW 5 | KKS form on a two-dimensional orbit | SUPPORTS | kksSymplecticForm returns the correct skew matrix with coefficient r in the stated fundamental-vector basis.
ROW 6 | Fisher metric on probability vectors | SUPPORTS | fisherMetric computes the exact rational sum of u_i v_i/p_i for matching dimensions and valid open-simplex inputs.
ROW 1 | Moser homotopy produces a Darboux chart | SUPPORTS | flow_time1 integrates the Moser field, and test_chart_pullback passes with residual 2.442e-15.
ROW 2 | Poisson rank stratification on so(3)* | SUPPORTS | The test passes with rank two at all sampled nonzero points and rank zero at the origin.
ROW 3 | Fisher metric monotonicity under stochastic maps | SUPPORTS | All 200 sampled comparisons pass the positive-semidefinite and tangent-vector slack tolerances.
ROW 4 | Standard symplectic data and witness functions | SUPPORTS | darboux constructs the standard matrix, and weinsteinSplitting uses corrected elimination with rankChecks covering skew, zero, and identity matrices.
ROW 5 | KKS form on a two-dimensional orbit | SUPPORTS | kksSymplecticForm returns the correct skew matrix with coefficient r in the stated fundamental-vector basis.
ROW 6 | Fisher metric on probability vectors | SUPPORTS | fisherMetric computes the exact rational sum of u_i v_i/p_i for matching dimensions and valid open-simplex inputs.

VERDICT: PASS
