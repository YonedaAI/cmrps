# CMRPS — The Classification of Mathematical Representations of Physical Systems

A 12-volume research series plus a structural synthesis — the *Principia Physica*
program of the YonedaAI Collaboration. The program asks one question: do
mathematical representations of physical systems admit a structural
classification analogous to the Classification of Finite Simple Groups? The
series answers it with three kinds of content: classified islands where a
complete invariant exists, reconstruction theorems that recover objects from
probes, and obstruction theorems proving that no classification of the stated
kind can exist in the stated generality.

**Site:** <https://cmrps.vercel.app>

## The volumes

Verdict column: final editorial review verdict of the paper (rounds recorded in
`reviews/`). Format verdicts: Codex formatting review PASS on 12 of 13; the
vol-04 loop closed with only house-style-blocked residuals (all fixable items
fixed — see `reviews/vol-04-yoneda-classification-codex-review.md`).

| # | Volume | Title | Verdict |
|---|---|---|---|
| 1 | vol-01-foundations | Foundations of Structural Classification | ACCEPT |
| 2 | vol-02-structural-families | Fundamental Structural Families of Mathematical Physics | ACCEPT |
| 3 | vol-03-irreducibility-decomposition | Irreducibility and Decomposition | PASS |
| 4 | vol-04-yoneda-classification | The Yoneda Classification Principle | ACCEPT |
| 5 | vol-05-classical-systems | Classification of Classical Physical Systems | MINOR REVISIONS |
| 6 | vol-06-quantum-systems | Classification of Quantum Physical Systems | ACCEPT |
| 7 | vol-07-gauge-qft | Gauge Structures and Quantum Field Theories | ACCEPT |
| 8 | vol-08-spacetime-reconstruction | Classification and Reconstruction of Spacetime | ACCEPT |
| 9 | vol-09-gravity-information-geometry | Gravity, Information, and Geometric Correspondence | ACCEPT |
| 10 | vol-10-observational-equivalence | Observational Equivalence and Physical Distinguishability | MINOR REVISIONS |
| 11 | vol-11-completeness-obstructions | Completeness and Obstructions | ACCEPT |
| 12 | vol-12-principia-physica | Principia Physica | ACCEPT |
| — | synthesis | Structural Synthesis | ACCEPT |

## Artifact map

| Path | What lives there |
|---|---|
| `papers/latex/` | LaTeX sources for the 12 volumes + synthesis (13 papers) |
| `papers/pdf/` | Compiled PDFs, one per paper |
| `docs/papers/` | HTML renderings of every paper + `manifest.json` |
| `lean/` | Lean 4 package `Cmrps` — 12 volume modules, kernel-checked formalization (`lake build` clean; no `sorry`, no new axioms) |
| `verification/` | Claim-status registry (280 machine-checked claims, 7 conditional, 11 conjecture), claim ledgers, cross-audit records, dependency notes, `lean-build.log` |
| `src/` | Executable Haskell taxonomy (`src/Taxonomy/`) + per-volume computational evidence — evidence, never proof |
| `docs/` | Shared substrate: `ontology.md` (DEF-001..042), `theorem-registry.md`, `research-map.md`, `periodic-table.md`, `perspective.md` |
| `reviews/` | Editorial reviews, Codex formatting reviews, style greps, code audits, bibliography checks |
| `website/` | Next.js site (published at the link above), theme, per-paper OG cards in `website/public/og/` |

## Verification status

- **Lean:** package `Cmrps` (12 modules) builds clean — 280 machine-checked
  claims per `verification/claim-status-registry.md`.
- **Taxonomy cross-audit:** 153 rows checked against the Lean layer —
  0 MISMATCH (36 MIRRORED, 117 PARTIAL with one-line fixes noted); Codex
  review of the Haskell layer PASS. Haskell is computational evidence
  validated against kernel-checked specifications — never "verified by Lean".
- **Claim discipline:** six status labels only; no volume carries an unproven
  statement as a proved dependency. Yoneda qualification, binding on every
  volume: Yoneda does not, by itself, establish physical equivalence, empirical
  adequacy, or a classification theorem.

---

**Matthew Long**
The YonedaAI Collaboration
YonedaAI Research Collective
Chicago, Illinois, USA
mlong@yonedalabs.ai
https://yonedalabs.ai
