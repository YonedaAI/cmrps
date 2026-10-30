---
reviewer: codex (OpenAI) code evidence audit
type: code-audit
paper: vol-06-quantum-systems
round: 3 (final; rounds 1 and 2 in code-audit-round-1.md and -2.md)
date: 2026-10-30T06:42:40Z
---

ROW 1 | Isomorphism criterion matches enumerated classes through dimension 16 | SUPPORTS | Every enumerated pair passes, with block-matching witnesses or independently computed separating ideal dimensions.
ROW 2 | Algebra counts match square partitions | SUPPORTS | Square-partition enumeration produces counts matching the paper’s table through dimension 12.
ROW 3 | Tensor products multiply block sizes | SUPPORTS | The function computes all pairwise block-size products and passes the example and dimension-accounting checks.
ROW 4 | Kraus rank equals Choi rank | SUPPORTS | Choi eigenvalue counts agree with independently computed Kraus-vector span dimensions on the sampled channels.
ROW 5 | Minimal Kraus presentations reduce correctly | SUPPORTS | Spectral reconstruction removes the padded zero operator, produces four operators, and preserves sampled channel evaluations.
ROW 6 | Equal Kraus rank does not classify channels | SUPPORTS | Three sampled channels have rank four and pairwise distinct Choi spectra, obstructing unitary equivalence.
ROW 7 | Petz forms are positive on sampled tangent vectors | SUPPORTS | All sampled weights and nonzero tangent-vector evaluations are positive, with minimum value 0.575496.
ROW 8 | Distinct functions give distinct metrics | SUPPORTS | The three implemented functions produce pairwise distinct metric-value arrays on shared samples.
ROW 9 | Taxonomy instances cover the volume’s systems | SUPPORTS | Instance declarations cover system records, factors, channels, density matrices, superselection categories, and block-algebra constructions and equivalence.
ROW 1 | Isomorphism criterion matches enumerated classes through dimension 16 | SUPPORTS | Every enumerated pair passes, with block-matching witnesses or independently computed separating ideal dimensions.
ROW 2 | Algebra counts match square partitions | SUPPORTS | Square-partition enumeration produces counts matching the paper’s table through dimension 12.
ROW 3 | Tensor products multiply block sizes | SUPPORTS | The function computes all pairwise block-size products and passes the example and dimension-accounting checks.
ROW 4 | Kraus rank equals Choi rank | SUPPORTS | Choi eigenvalue counts agree with independently computed Kraus-vector span dimensions on the sampled channels.
ROW 5 | Minimal Kraus presentations reduce correctly | SUPPORTS | Spectral reconstruction removes the padded zero operator, produces four operators, and preserves sampled channel evaluations.
ROW 6 | Equal Kraus rank does not classify channels | SUPPORTS | Three sampled channels have rank four and pairwise distinct Choi spectra, obstructing unitary equivalence.
ROW 7 | Petz forms are positive on sampled tangent vectors | SUPPORTS | All sampled weights and nonzero tangent-vector evaluations are positive, with minimum value 0.575496.
ROW 8 | Distinct functions give distinct metrics | SUPPORTS | The three implemented functions produce pairwise distinct metric-value arrays on shared samples.
ROW 9 | Taxonomy instances cover the volume’s systems | SUPPORTS | Instance declarations cover system records, factors, channels, density matrices, superselection categories, and block-algebra constructions and equivalence.

VERDICT: PASS
