---
reviewer: Gemini 3.8 Flash (Medium) (fallback Gemini 4 Argon (High))
paper: vol-10-observational-equivalence
round: 2
date: 2026-10-30T03:09:15Z
---


# Peer Review: Observational Equivalence and Physical Distinguishability (Part 10)

## Executive Summary

This paper investigates the empirical and observational foundation of the classification program for physical system representations ($\mathrm{Ob}(\mathrm{Phys})/{\simeq}$). Its principal objectives are:
1. Distinguishing mathematical equivalence ($\cong$), physical equivalence ($\simeq$), and observational equivalence ($\approx_{\mathrm{Obs}}$);
2. Formalizing observational equivalence via observation functors into record categories;
3. Analyzing the non-canonicity of quantum distinguishability metrics via the Petz–Sudar classification;
4. Establishing that plain monoidal (tensor) equivalence of representation categories fails to recover underlying symmetry groups (citing Etingof–Gelaki isocategorical groups).

The conceptual core is sound and philosophically valuable. However, the manuscript suffers from an arithmetic contradiction in an explicit calculation, significant structural forward references, reliance on non-public internal series ontologies, and pervasive signposting that breaches the required house style.

---

## Detailed Evaluation

### 1. Mathematical Correctness
* **Elementary Arithmetic Inconsistency (Line 468):** In Section 9.2, when evaluating the off-diagonal contribution of the Morozova–Chentsov form for $f(x) = \frac{2x}{1+x}$, the text states:
  $$\text{The off-diagonal summands contribute } \tfrac{2}{3}a^2 + \tfrac{10}{3}a^2 = \tfrac{16}{3}a^2 \text{ for } f \text{ (the two terms are } \tfrac{8}{3}a^2 \text{ each)}$$
  The sum $\frac{2}{3} + \frac{10}{3} = \frac{12}{3} = 4 \neq \frac{16}{3}$. The parenthetical statement that each of the two off-diagonal terms equals $\frac{8}{3}a^2$ is mathematically correct (since $\lambda_2 f(\lambda_1/\lambda_2) = \frac{1}{4} f(3) = \frac{3}{8}$, giving $a^2 / (3/8) = \frac{8}{3}a^2$, and symmetrically for the transpose), but the preceding text gives erroneous numerators ($2$ and $10$) and asserts an impossible equality.
* **Pullback Truism as Core Result (Proposition 4.2, Lines 211–220):** Proposition 4.2 states that the relation induced by an observation functor is an equivalence relation whose classes are the fibers of the record isomorphism map. This is mathematically correct, but it is an immediate consequence of the fact that isomorphism in any category is an equivalence relation. The manuscript should be candid that this is a definitional consequence rather than a deep structural theorem.
* **Theorem Citations (Theorems 3.1, 5.1, 5.2):** The mathematical invocations of Chentsov’s theorem, the Petz–Sudar classification, and Etingof–Gelaki isocategorical groups are technically sound and applied within their established hypotheses.

### 2. Completeness and Self-Containment
* **Dependence on Internal Registries:** The paper relies heavily on unresolvable internal identifiers (e.g., Footnote 1, DEF-002, DEF-008–013, DEF-014, DEF-015, DEF-016, DEF-018, DEF-042, T-OB-02, T-BG-14, T-BG-18, DEP-008). A standalone research paper cannot outsource its definitions, dependency rules, and premises to internal corporate/lab repositories.
* **Under-specified Observation Category:** Definition 4.1 introduces the observation functor $\mathrm{Obs} \colon \mathrm{Phys}_{\mathrm{adm}} \to \mathsf{Obs}$, but leaves $\mathsf{Obs}$ almost entirely abstract. While Section 8.2 outlines necessary contents, no concrete category of records is defined outside the finite toy model in Section 9.1.
* **Incomplete Counterexample Row (Table 4, Line 368):** The first row of Table 4 ("Mathematical isomorphism as physical equivalence") notes that a system-level pair is not constructed here. Admitting the limitation is transparent, but it leaves the foundational motivation unformalized.

### 3. Logical Structure and Flow
* **Severe Forward References:** 
  - Line 387 (Section 6.1) explicitly instructs the reader to compare candidates against "the band of Definition \ref{def:band}", which is not introduced until Section 11 (Line 553)—five sections later.
  - Section 4.2 (Line 249), Section 4.3 (Line 264), and Section 6.1 (Line 387) all forward-reference the worked examples of Section 9 (`\Cref{sec:examples}`) to explain foundational concepts. The worked examples should either precede these sections or the definitions should be self-contained.

### 4. LaTeX and Typesetting Quality
* **Non-consecutive Bibliography Labels:** The bibliography keys are manually numbered with arbitrary gaps (`[12]`, `[21]`, `[40]`, `[41]`, `[42]`, `[43]`, `[44]`, `[52]`, `[62]`), evidently leftover artifacts from a master bibliography. Citations should be sequentially ordered $[1]–[9]$ or rendered in author-year format.
* **Substandard Scholarly Citations:** References `[12]`, `[42]`, `[43]`, and `[44]` cite anonymous *nLab* wiki articles for classical mathematics (Doplicher–Roberts, Gelfand–Naimark, Gelfand duality, Stone duality). These must be replaced with canonical primary sources or standard reference monographs.
* **Inconsistent Cross-Referencing:** The paper alternates arbitrarily between `\Cref{sec:...}` and `Definition \ref{def:...}` or `Theorem \ref{thm:...}`.

### 5. Prose Quality and House Style Adherence
The manuscript frequently departs from the stated house style:
* **Filler and Anthropomorphism:** Phrases like *"This volume owns the empirical side of that quotient"* (Line 57) and *"Collapsing the three is the error this volume exists to prevent"* (Line 61) introduce colloquial self-importance.
* **Signposting and Meta-commentary:** Pervasive announcements of what sections will do, what the program intends, and how the argument is structured.
* **Qualification Before Finding:** Several paragraphs open with methodological disclaimers rather than the substantive claim.

---

## Weakest Paragraphs & Model Rewrite

### Weakest Paragraph 1 (Lines 57–58)
> *"This volume owns the empirical side of that quotient. Its subject is observational equivalence: the relation that identifies two systems exactly when no admissible observation separates them. The formal object is the observation functor named by the Information Geometry Correspondence program of the YonedaAI research summary. That program names the object and does not define it. Defining it, testing its properties, and locating the boundaries of what it supports is the work of this paper."*

* **Critique:** Breaches house style on multiple fronts. Opens with colloquial anthropomorphism ("owns the empirical side"). Contains procedural signposting ("Defining it, testing its properties... is the work of this paper") and relies on inaccessible internal project jargon ("Information Geometry Correspondence program of the YonedaAI research summary").

---

### Weakest Paragraph 2 (Lines 387–389)
> *"The counterexample search above can be repeated for any future criterion, and the protocol matters more than any single outcome. A candidate is stated as a relation on system records together with the morphism kind realizing its identifications. The candidate is then attacked in three steps. The preserved layers are read off from the morphism kind and checked against Table \ref{tab:layers}; a witness naming the monoidal layer without symmetry is rejected on the strength of Theorem \ref{thm:eg} before any further work. The candidate is then instantiated on the worked examples of \Cref{sec:examples}: the finite classical pair, the qubit computation, the two groups of order 8, and the product computation. A criterion that misidentifies any of them is false; a criterion that identifies all of them is untested and must be pushed further. The candidate is then compared against the band of Definition \ref{def:band}: it must be at least as coarse as isomorphism and no coarser than admissible observation."*

* **Critique:** Violates the single-claim rule by combining a general methodology, an attack procedure, an example checklist, and an out-of-order definition. Contains violent/colloquial phrasing ("attacked in three steps"), repetitive signposting ("The candidate is then..."), and an egregious forward reference to Definition 11.1 (`\ref{def:band}`).

---

### Weakest Paragraph 3 (Lines 468–469)
> *"Both identities are arithmetic. The diagonal summands contribute $\tfrac{4}{3}b^2 + 4b^2 = \tfrac{16}{3}b^2$ in both cases. The off-diagonal summands contribute $\tfrac{2}{3}a^2 + \tfrac{10}{3}a^2 = \tfrac{16}{3}a^2$ for $f$ (the two terms are $\tfrac{8}{3}a^2$ each) and $2a^2 + 2a^2 = 4a^2$ for $h$. Proposition \ref{prop:commutative} is the case $a = 0$, where the two agree; Example \ref{ex:monotone} is the case $b = 0$, where they differ by the factor $4/3$."*

* **Critique:** Contains a direct arithmetic contradiction ($\frac{2}{3} + \frac{10}{3} = \frac{16}{3}$). Opens with empty filler ("Both identities are arithmetic") rather than the direct substantive result.

---

### Model Rewrite (Weakest Paragraph 3, Line 468)

> The quadratic forms for $f$ and $h$ diverge exclusively on the non-commuting off-diagonal components. At state $\rho = \mathrm{diag}(3/4, 1/4)$ with perturbation $A = a\sigma_x + b\sigma_z$, both metrics yield identical diagonal contributions of $\frac{4}{3}b^2 + 4b^2 = \frac{16}{3}b^2$. On the off-diagonal entries, each term in the sum for $f(x) = \frac{2x}{1+x}$ contributes $\frac{a^2}{\lambda_2 f(\lambda_1/\lambda_2)} = \frac{8}{3}a^2$, yielding an off-diagonal total of $\frac{16}{3}a^2$, whereas $h(x) = \frac{1+x}{2}$ yields $2a^2 + 2a^2 = 4a^2$. Consequently, the metrics coincide when $a=0$ (the commutative slice) and diverge by a factor of $4/3$ when $b=0$ (purely non-commuting variations).

---

## Structured Feedback by Severity

### Critical Issues
1. **Arithmetic Error and False Equality in Section 9.2 (Line 468):**
   - *Location:* Page 10, Line 468.
   - *Problem:* $\frac{2}{3}a^2 + \frac{10}{3}a^2 = \frac{16}{3}a^2$ is mathematically incorrect ($\frac{2}{3} + \frac{10}{3} = 4$).
   - *Remediation:* Correct the text to state that each of the two off-diagonal terms contributes $\frac{8}{3}a^2$, summing to $\frac{16}{3}a^2$.

### Major Issues
1. **Critical Forward Reference to Core Definition (Lines 387 vs 553):**
   - *Location:* Section 6.1 (Line 387) referencing Definition 11.1 (`\ref{def:band}`, Line 553).
   - *Problem:* A core screening criterion in Section 6 depends on a concept not defined until Section 11.
   - *Remediation:* Move Section 11 ("Constraints on the classification quotient" and Definition 11.1) to precede Section 6, or introduce the bounding relation $\cong \;\subseteq\; \simeq \;\subseteq\; \bigcap \approx_{\mathrm{Obs}}$ directly in Section 2 alongside the three equivalence relations.
2. **Structural Forward References to Examples (Lines 249, 264, 387):**
   - *Location:* Sections 4.2, 4.3, and 6.1 all refer to Section 9 (`\Cref{sec:examples}`) for proofs or essential definitions.
   - *Problem:* Makes earlier theoretical sections non-self-contained and forces circular reading.
   - *Remediation:* Place the worked examples in Section 5 or inline the necessary mini-constructions directly into the proofs of Propositions 4.5 and 4.6.
3. **Inaccessible Internal series Dependencies:**
   - *Location:* Lines 55, 72, 75, 81, 86, 116, 128, 131, 144, 152, 282, 303, 407, 418.
   - *Problem:* Persistent appeals to unpublished ontology codes (DEF-002 through DEF-042, T-OB-02, T-BG-14, DEP-008) and internal summaries violate scholarly standards of completeness.
   - *Remediation:* Strip internal registry codes from the published prose; state definitions and theorem conditions explicitly within the paper.

### Minor Issues
1. **Defective Bibliography Enumeration and Citing Web Wikis (Lines 613–647):**
   - *Location:* `\begin{thebibliography}{99}`, references `[12]` through `[62]`.
   - *Problem:* The bibliography keys have arbitrary numerical gaps. Furthermore, references `[12]`, `[42]`, `[43]`, and `[44]` cite the *nLab* website for classical results.
   - *Remediation:* Renumber entries sequentially $[1]–[9]$. Replace *nLab* URLs with authoritative primary sources: Doplicher & Roberts (1989/1990), Gelfand (1941), Gelfand & Naimark (1943), Stone (1936).
2. **House Style Violations (Signposting and Jargon):**
   - *Location:* Lines 57, 61, 119, 144, 207, 348, 590.
   - *Problem:* Frequent use of throat-clearing, meta-commentary, and programmatic slogans ("Yoneda does not, by itself...").
   - *Remediation:* Eliminate signposting phrases. Open paragraphs with direct findings and concrete mathematical claims.
3. **Inconsistent Environment Cross-Referencing:**
   - *Location:* Throughout text (e.g., Line 63 uses `Definition \ref{def:obs}` while Line 110 uses `\Cref{tab:relations}`).
   - *Problem:* Mixed referencing styles.
   - *Remediation:* Standardize on `\Cref{...}` across all environments.

---

VERDICT: MAJOR REVISIONS (major issues remain)
