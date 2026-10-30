---
reviewer: Gemini 3.8 Flash (Medium) (fallback Gemini 4 Argon (High))
paper: vol-10-observational-equivalence
round: 3
date: 2026-10-30T03:37:15Z
---


# Peer Review: Observational Equivalence and Physical Distinguishability (Part 10)

## Executive Summary

This manuscript addresses the observational foundation of the classification problem for mathematical representations of physical systems, $\mathrm{Classify}(\mathrm{Ob}(\mathrm{Phys})/{\simeq})$. Its principal aims are:
1. Delineating three distinct relations on system representations: mathematical equivalence ($\cong$), physical equivalence ($\simeq$), and observational equivalence ($\approx_{\mathrm{Obs}}$);
2. Formalizing observational equivalence via observation functors into record categories and proving basic preservation and coarsening properties;
3. Analyzing distinguishability through monotone metrics, contrasting classical uniqueness (Chentsov) with quantum parametricity (Petz–Sudár) and demonstrating ruler-dependence in dimension two;
4. Establishing constraints on proposed physical equivalence relations, specifically demonstrating that plain monoidal (tensor) equivalence of representation categories fails to recover underlying symmetry groups (citing Etingof–Gelaki).

The paper provides significant conceptual clarification, and the previous round's arithmetic error in the qubit off-diagonal calculation has been successfully corrected. However, a mathematical imprecision remains in the proof of Proposition 4.5 (where two mutually non-refining partitions are mischaracterized as a fine/coarse pair), lingering internal project registry keys compromise self-containment, several hardcoded cross-references degrade LaTeX quality, and recurrent signposting, meta-commentary, and repetitive aphorisms violate the specified house style.

---

## Detailed Evaluation

### 1. Mathematical Correctness
* **Coarsening Mismatch in Proposition 4.5 Proof (Lines 242–247):** Definition 4.4 defines $\mathrm{Obs}_c$ as a coarsening of $\mathrm{Obs}_f$ when there exists a functor $h \colon \mathsf{Obs}_f \to \mathsf{Obs}_c$ such that $\mathrm{Obs}_c = h \circ \mathrm{Obs}_f$. In the proof of Proposition 4.5, strictness is illustrated on $\Omega = \{1,2,3,4\}$ using partition $\{\{1,2\}, \{3,4\}\}$ as the coarse record and partition $\{\{1,3\}, \{2,4\}\}$ as the fine record. However, partition $\{\{1,2\}, \{3,4\}\}$ is **not** a coarsening of $\{\{1,3\}, \{2,4\}\}$; neither partition refines the other, and no factoring map $h$ exists between their pushforward distributions. In Section 9.1 (Lines 452–458), the author correctly treats the fine record as the pair of experiments $E = \{e_1, e_2\}$ with coarsening given by projection onto $e_1$. The proof of Proposition 4.5 must be brought into alignment with Definition 4.4 by explicitly identifying the fine observation as the joint observation (or the discrete partition).
* **Qubit Monotone Metric Calculations (Section 5.3 & Section 9.2):** The evaluation of the Morozova–Chentsov form at $\rho = \mathrm{diag}(3/4, 1/4)$ and $A = a\sigma_x + b\sigma_z$ is mathematically correct. For $f(x) = \frac{2x}{1+x}$, each off-diagonal summand yields $\frac{8}{3}a^2$ (summing to $\frac{16}{3}a^2$), whereas $h(x) = \frac{1+x}{2}$ yields $2a^2$ (summing to $4a^2$). The diagonal sum $\frac{16}{3}b^2$ is identical for both. The values in Table 4 and Example 5.4 are exact.
* **Composed Experiments Counterexample (Proposition 4.6, Lines 275–278):** The joint event $\omega_1 = \omega_2$ on $\Omega \times \Omega$ yields $\sum p_i^2 = 11/32$ under $p \times p$ and $\sum p_i q_i = 9/32$ under $p \times q$. The arithmetic is completely accurate and establishes that indistinguishability under factor-marginal measurements does not compose to joint measurements.
* **Character Table Calculation (Section 9.3, Table 5):** The character table for $D_8$ and $Q_8$ correctly verifies the non-separation of non-isomorphic groups by 1D and 2D character data.

### 2. Clarity and Completeness
* **Self-Containment and Registry Identifiers:** The text continues to incorporate internal registry identifiers (Footnote 1, Lines 55, 75, 86, 161, 182, 245, 291, 312, 433, 612): e.g., `DEF-009`, `DEF-010`, `DEF-012`, `DEF-013`, `DEF-015`, `T-OB-02`, `T-BG-14`, `T-BG-18`, `DEP-008`. In an archival scholarly paper, external readers cannot resolve these internal project keys. All mathematical prerequisites must be named by standard mathematical terminology.
* **Orphan Identifier in Table 7 Caption (Line 612):** The caption of Table 7 states: *"Ontology identifiers (DEF-002 and the rest) refer to the series ontology."* However, `DEF-002` appears nowhere in Table 7 (nor anywhere else in the document), and Table 7 contains no ontology identifiers at all.
* **Abstract Nature of the Record Category:** Definition 4.1 defines $\mathrm{Obs} \colon \mathrm{Phys}_{\mathrm{adm}} \to \mathsf{Obs}$, but $\mathsf{Obs}$ remains largely unspecified outside the finite toy model of Section 9.1. While Section 8.2 outlines the minimal required contents, a concrete non-toy example (e.g., in quantum mechanics or classical field theory) would substantially strengthen completeness.

### 3. Logical Structure
* **Forward References to Worked Examples:** Although the placement of Definition 2.5 (`\label{def:band}`) in Section 2.2 resolved the major structural inversion of earlier drafts, the text still contains forward references from foundational sections to the worked examples: Line 231 references "Section 9" to explain Lemma 4.3, and Line 433 references "Section 9" to justify label calibration conventions.
* **Verbatim Repetitive Aphorisms:** The exact sentence: *"Yoneda does not, by itself, establish physical equivalence, empirical adequacy, or a classification theorem"* is quoted verbatim twice: at Line 204 (end of Section 3) and at Line 409 (Section 7). Furthermore, Line 61 in the Introduction announces that this aphorism is quoted in Section 3, even though Section 3 discusses Gelfand and Stone dualities rather than Yoneda embedding (which is only introduced in Section 7).

### 4. LaTeX and Typesetting Quality
* **Unused Packages:** The preamble imports `graphicx`, `listings`, and `tikz` (Lines 12, 14, 17), yet the document contains no external graphics, code listings environments, or TikZ diagrams.
* **Hardcoded Cross-References:** The document contains several hardcoded section strings instead of using dynamic `\Cref`:
  - Line 61: `(Section 3)`
  - Line 125: `(Section 3)`
  - Line 231: `Section 9`
  - Line 433: `Section 9`
* **Notation Consistency:** The text formats $C^*$-algebras as raw text `C*-algebra` (Lines 196, 363, 398, 400) rather than standard LaTeX math mode `$C^*$-algebra`.

### 5. Prose Quality and House Style Adherence
* **Signposting and List-Announcing:** The text repeatedly announces paragraph counts and roadmap items:
  - Line 59: *"Three results organize the discussion."*
  - Line 63: *"The contributions are five."*
  - Line 508: *"Three computational investigations accompany the analytic arguments."*
  - Line 562: *"Three concrete tasks would move the choice of $\simeq$ from open to fixed..."*
* **Colloquial and Promotional Jargon:** Lines 378 and 388 repeat the self-congratulatory catchphrase: *"the protocol is the durable product of this section"* and *"so the search protocol is the durable product of this section"*.
* **Paragraph Structure:** Several paragraphs combine multiple distinct claims, procedural protocols, and retrospective qualifications, violating the house style rule of one claim per paragraph stated directly before qualification.

---

## Weakest Three Paragraphs & Model Rewrite

### Weakest Paragraph 1 (Lines 242–247)
> *"A comparison witnessing $\mathrm{Obs}_f(P) \cong \mathrm{Obs}_f(Q)$ maps under the functor $h$ to a comparison witnessing $\mathrm{Obs}_c(P) \cong \mathrm{Obs}_c(Q)$. For strictness, take $\Omega = \{1,2,3,4\}$ with $p = (\tfrac{1}{2}, \tfrac{1}{4}, \tfrac{1}{8}, \tfrac{1}{8})$ and $q = (\tfrac{1}{4}, \tfrac{1}{2}, \tfrac{1}{8}, \tfrac{1}{8})$. Over the partition $\{\{1,2\}, \{3,4\}\}$ both push forward to $(\tfrac{3}{4}, \tfrac{1}{4})$, so the coarse records agree; over the partition $\{\{1,3\}, \{2,4\}\}$ the pushforwards are $(\tfrac{5}{8}, \tfrac{3}{8})$ and $(\tfrac{3}{8}, \tfrac{5}{8})$, so the fine records differ. The computation is reproduced in the computational appendix (\texttt{observation\_\allowbreak quotient.py}, function \texttt{coarse\_\allowbreak vs\_\allowbreak fine})."*

* **Critique:** Contains a mathematical definition mismatch. The partition $\{\{1,2\}, \{3,4\}\}$ is not a coarsening of $\{\{1,3\}, \{2,4\}\}$ because neither partition refines the other; thus no functor $h$ exists satisfying $\mathrm{Obs}_c = h \circ \mathrm{Obs}_f$ between these two single-experiment pushforwards. The text also defers the proof's validity to a script citation rather than constructing a valid nested observation pair directly.

---

### Weakest Paragraph 2 (Lines 378–386)
> *"The counterexample search above is repeatable for any future criterion, and the protocol is the durable product of this section. A candidate is stated as a relation on system records together with the morphism kind realizing its identifications, then screened in three passes. The screening pass reads the preserved layers off the morphism kind and checks them against \Cref{tab:layers}; a witness naming the monoidal layer without symmetry fails on the strength of \Cref{thm:eg} immediately. The testing pass runs the candidate on four cases: a finite classical pair separated only by a second experiment, a qubit pair of monotone metrics disagreeing off the commutative slice, two non-isomorphic groups of order 8 with equal character tables, and a product of observations that separates what its factors hide. A criterion that misidentifies any case is false, and a criterion that passes all four is untested. The band pass compares the candidate with \Cref{def:band}: the candidate must be at least as coarse as isomorphism and no coarser than admissible observation."*

* **Critique:** Violates the house style by packing multiple procedural steps into a single dense paragraph. Employs promotional jargon (*"durable product of this section"*), which it unnecessarily repeats ten lines later (Line 388). Relies on passive mechanical signposting (*"A candidate is stated...", "The screening pass reads...", "The testing pass runs..."*).

---

### Weakest Paragraph 3 (Lines 59–60)
> *"Three results organize the discussion. Observation functors can be defined as ordinary functors from a category of systems to a category of observation records, and the indistinguishability relation they induce is an equivalence relation whose classes are the fibers of the map from systems to record isomorphism classes. Coarsening the observations identifies at least as many systems as the fine observations identify, and the inclusion of relations can be strict. The quantitative side of distinguishability runs through monotone metrics, and here the classical and quantum cases split. The Fisher metric is unique up to constant among metrics monotone under stochastic maps \cite{b8}; in the quantum case the monotone metrics form a parametric family indexed by operator monotone functions \cite{b8}, and an explicit two-dimensional computation shows the induced quadratic forms disagree on non-commuting directions. Distinguishability read from an unnamed monotone metric is not a function of the states alone. A proved counterexample blocks the most natural equivalence criterion of all: equivalence of representation categories as plain tensor categories does not recover the underlying group, so any equivalence used to identify systems must state which layer of structure it preserves."*

* **Critique:** Opens with meta-signposting (*"Three results organize the discussion"*), but then enumerates four or five distinct narrative threads, confusing the reader. The prose relies heavily on chained clauses and coordination rather than developing one clear claim supported by direct reasoning.

---

### Model Rewrite (Weakest Paragraph 1, Lines 242–247)

> Functoriality ensures that fine observational equivalence implies coarse observational equivalence, whereas the converse fails. If $h \colon \mathsf{Obs}_f \to \mathsf{Obs}_c$ is a coarsening functor, any record isomorphism $\alpha \colon \mathrm{Obs}_f(P) \xrightarrow{\cong} \mathrm{Obs}_f(Q)$ induces an isomorphism $h(\alpha) \colon \mathrm{Obs}_c(P) \xrightarrow{\cong} \mathrm{Obs}_c(Q)$, proving that $P \approx_{\mathrm{Obs}_f} Q$ implies $P \approx_{\mathrm{Obs}_c} Q$. The inclusion of relations is strictly one-sided. On the sample space $\Omega = \{1,2,3,4\}$, define two distinct probability measures $p = (\tfrac{1}{2}, \tfrac{1}{4}, \tfrac{1}{8}, \tfrac{1}{8})$ and $q = (\tfrac{1}{4}, \tfrac{1}{2}, \tfrac{1}{8}, \tfrac{1}{8})$. Let $\mathrm{Obs}_f$ be the fine observation reporting probabilities on the discrete partition $\{\{1\},\{2\},\{3\},\{4\}\}$, which separates $p$ and $q$, and let $\mathrm{Obs}_c = h \circ \mathrm{Obs}_f$ aggregate outcomes into the two-block partition $\{\{1,2\}, \{3,4\}\}$. Under $h$, both distributions collapse to $(\tfrac{3}{4}, \tfrac{1}{4})$, establishing $\mathrm{Obs}_c(p) \cong \mathrm{Obs}_c(q)$ despite $\mathrm{Obs}_f(p) \not\cong \mathrm{Obs}_f(q)$.

---

## Structured Feedback by Severity

### Critical Issues
*None remain.* The arithmetic inconsistency in Section 9.2 from the earlier round has been resolved, and the primary theorems are mathematically sound.

### Major Issues
1. **Mathematical Inconsistency in Proof of Proposition 4.5 (Lines 242–247):**
   - *Location:* Section 4.2, Lines 242–247.
   - *Problem:* Partition $\{\{1,2\}, \{3,4\}\}$ is not a coarsening of $\{\{1,3\}, \{2,4\}\}$. Definition 4.4 requires a functor $h$ such that $\mathrm{Obs}_c = h \circ \mathrm{Obs}_f$.
   - *Remediation:* Redefine $\mathrm{Obs}_f$ in the proof as the discrete partition $\{\{1\}, \{2\}, \{3\}, \{4\}\}$ (or as the joint experiment pair $E = \{e_1, e_2\}$ as done in Section 9.1), from which the two-block partition genuinely factors via a projection/aggregation map.
2. **Persistent Internal Registry Identifiers:**
   - *Location:* Lines 55, 75, 86, 161, 182, 245, 291, 312, 433, 612.
   - *Problem:* Invocations of internal project tags (`DEF-009`, `DEF-010`, `DEF-012`, `DEF-013`, `DEF-015`, `T-OB-02`, `T-BG-14`, `T-BG-18`, `DEP-008`) undermine the self-containment of an independent scholarly article.
   - *Remediation:* Remove all corporate/lab ontology tags. Refer directly to standard mathematical concepts (e.g., "stochastic coarse-graining", "Etingof–Gelaki isocategorical groups", "Petz–Sudár classification").
3. **Spurious Caption Reference in Table 7 (Line 612):**
   - *Location:* Section 13, Table 7, Line 612.
   - *Problem:* Caption states that *"Ontology identifiers (DEF-002 and the rest) refer to the series ontology"*, but no such identifiers exist in the table.
   - *Remediation:* Delete the sentence from the caption.

### Minor Issues
1. **Hardcoded Section Numbers:**
   - *Location:* Lines 61, 125, 231, 433.
   - *Problem:* Text uses literal strings `"Section 3"` and `"Section 9"` instead of dynamic `\Cref{sec:...}`.
   - *Remediation:* Replace all manual section references with `\Cref{sec:eg}` and `\Cref{sec:examples}`.
2. **Unused Preamble Imports:**
   - *Location:* Lines 12, 14, 17–18 (`graphicx`, `tikz`, `listings`).
   - *Problem:* Adds compilation overhead without being utilized.
   - *Remediation:* Remove unused package declarations from the preamble.
3. **Misattributed Yoneda Citation in Introduction (Line 61):**
   - *Location:* Section 1, Line 61.
   - *Problem:* States that the Yoneda aphorism is quoted in Section 3, but Section 3 deals with Gelfand and Stone dualities; the Yoneda lemma is only discussed in Section 7.
   - *Remediation:* Update the reference to cite Section 7 (`\Cref{sec:recon}`) or clarify that Section 3 introduces operator-algebraic dualities.
4. **Formatting of $C^*$-Algebras:**
   - *Location:* Lines 196, 363, 398, 400.
   - *Problem:* Written as raw text `C*-algebra` rather than math-mode `$C^*$-algebra`.
   - *Remediation:* Standardize to `$C^*$-algebra` across all instances.
5. **Repetitive Catchphrase and Boilerplate Prose:**
   - *Location:* Lines 204 & 409 (verbatim Yoneda aphorism); Lines 378 & 388 (*"durable product of this section"*).
   - *Problem:* Breaches house style against repetitive filler and promotional rhetoric.
   - *Remediation:* Remove the duplicate quote in Section 7 and excise the colloquial "durable product" phrase.

---

VERDICT: MAJOR REVISIONS (major issues remain)
