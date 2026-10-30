# Bibliography check — vol-04-yoneda-classification

**Paper:** papers/latex/vol-04-yoneda-classification.tex
**Run:** 2026-10-30 (post round-1 revision; replaces the first check, which covered the pre-review bibliography)
**Gate:** BIB_GATE ON. Every entry of the paper's `thebibliography` is listed below with its resolved locator. No entry is UNVERIFIED. `[SOURCE REQUIRED]` and `[VERIFY VALUE]` greps on the `.tex`: 0 hits.

Bibliography policy after round-1 review: foundational theorems are cited to primary peer-reviewed literature (Wikipedia and nLab entries removed); every in-text claim carries an explicit `\cite{}`. Order of entries is order of first citation.

| Cite key | Entry as printed | Resolved URL / DOI | Evidence |
|---|---|---|---|
| whh | Wilson, M., Hefford, J., Hoffreumon, T. Supermaps on generalised theories. arXiv:2602.23865 (2026) | https://arxiv.org/abs/2602.23865 (DOI 10.48550/arXiv.2602.23865) | Resolved live 2026-10-30: arXiv abstract page, title "Supermaps on generalised theories", v3 2026-06-21. Corpus [40] |
| hw | Hefford, J., Wilson, M. A profunctorial semantics for quantum supermaps. arXiv:2402.02997 (2024) | https://arxiv.org/abs/2402.02997 (DOI 10.48550/arXiv.2402.02997) | Resolved live 2026-10-30: arXiv abstract page, title "A Profunctorial Semantics for Quantum Supermaps", v2 2024-05-23. Corpus [41] |
| gn | Gelfand, I., Neumark, M. On the imbedding of normed rings into the ring of operators in Hilbert space. Mat. Sb. 12 (1943) 197-213; reprint Contemp. Math. 167 (1994) 403-419 | DOI 10.1090/conm/167/16 | Resolved live 2026-10-30 via Crossref query (Gelfand/Neumark, C*-Algebras: 1943-1993 reprint). Replaces nLab entry [42] |
| stone | Stone, M. H. The theory of representations for Boolean algebras. Trans. Amer. Math. Soc. 40 (1936) 37-111 | DOI 10.1090/S0002-9947-1936-1501865-8 | Resolved live 2026-10-30 via Crossref query (title "The theory of representations for Boolean algebras"). Replaces nLab entry [44] |
| dr | Doplicher, S., Roberts, J. E. A new duality theory for compact groups. Invent. Math. 98 (1989) 157-218 | https://eudml.org/doc/143725 | Resolved live 2026-10-30: EuDML record, Invent. Math. 98.1 (1989) 157-218. Replaces nLab entry [12] |
| buchweitz | Buchweitz, R.-O., Leuschke, G. J. Factoring the adjoint and maximal Cohen-Macaulay modules over the generic determinant. arXiv:math/0505315 (2005) | https://arxiv.org/abs/math/0505315 (DOI 10.48550/arXiv.math/0505315) | Resolved live 2026-10-30: arXiv abstract page. Corpus [56] |
| maclane | Mac Lane, S. Categories for the Working Mathematician. Springer GTM, 2nd ed. (1998) | DOI 10.1007/978-1-4757-4721-8 | Resolved live 2026-10-30 via doi.org (Springer record). Standard reference for the Yoneda lemma |
| bekkert | Bekkert, V. I., Drozd, Y. A. Tame-wild dichotomy for derived categories. arXiv:math/0310352 (2003) | https://arxiv.org/abs/math/0310352 (DOI 10.48550/arXiv.math/0310352) | Resolved live 2026-10-30: arXiv abstract page. Corpus [55] |
| choi | Choi, M.-D. Completely positive linear maps on complex matrices. Linear Algebra Appl. 10 (1975) 285-290 | DOI 10.1016/0024-3795(75)90075-0 | Resolved live 2026-10-30 via doi.org (Elsevier record) |
| dhr | Doplicher, S., Haag, R., Roberts, J. E. Fields, observables and gauge transformations I. Comm. Math. Phys. 13 (1969) 1-23 | DOI 10.1007/BF01645267 | Resolved live 2026-10-30 via Crossref query. Replaces nLab entry [16] as the primary DHR source |
| eg | Etingof, P., Gelaki, S. Isocategorical groups. arXiv:math/0007196 (2000) | https://arxiv.org/abs/math/0007196 (DOI 10.48550/arXiv.math/0007196) | Resolved live 2026-10-30: arXiv abstract page, title "Isocategorical groups"; abstract confirms tensor equivalence without the commutativity constraint does not recover the group. Source of Theorem 6.1 (round-1 review required this primary citation) |

## Checks

- Entries listed: 11. Resolved: 11. UNVERIFIED: 0.
- `[SOURCE REQUIRED]` / `[VERIFY VALUE]` grep on the `.tex`: 0 hits.
- In-text `\cite` commands present: 20 (round-1 review's critical finding fixed; every literature claim carries an explicit citation).
- Load-bearing claims mapped: Theorem 3.1 (maclane), Theorem 3.5 (buchweitz), Remark 3.8 (bekkert), Proposition 4.1 (choi), Theorem 4.2 (whh, hw), Theorem 5.1 (gn), Theorem 5.2 (stone), Theorem 5.3 (dr, dhr), Theorem 6.1 (eg).
- The Yoneda qualification quoted verbatim is program-internal (DEF-017 of the series ontology) and is not presented as a literature citation.

**Result: BIB OK.**
