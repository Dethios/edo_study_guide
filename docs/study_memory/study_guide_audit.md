# Study Guide Audit Log

Current as of 2026-05-30.

This file records readable correction and audit entries for study-guide claims,
answer keys, outdated material, and doctrine-sensitive updates. Append the
machine-readable companion record to `guide_changes.jsonl`.

## Imported From May 30 Package

### 2026-05-30 - NAVWAR / PEO C4I Products

- ID: `gc-20260530-navwar-c4i-products`
- Original claim: NAVWAR product ownership and product expansions needed correction or enrichment.
- Location: `tex/chapters/4_NAVWAR.tex`, `tex/acronyms.def`, `tex/edo.bib`
- Verdict: `Needs source`
- Corrected answer: package reports updates for PEO MLB portfolio, PMA/PMW 101 MIDS/Link 16, PMW 120/DCGS-N, PMW
  160/CANES and ADNS, afloat email path, and PMW 790/DJC2.
- Source basis: PEO C4I, PEO MLB, and PEO Digital official public sources listed in `sources.md`.
- Explanation: imported as a proposed current-checkout record because the package reports parent-session edits but this
  implementation did not verify those LaTeX diffs.
- Confidence: `Medium`
- Status: `proposed`

### 2026-05-30 - NAVSEA IWS 6.0 vs PMW 150

- ID: `gc-20260530-iws6-pmw150`
- Original claim: IWS 6.0 and PMW 150 lanes needed a clearer board-ready distinction.
- Location: `tex/chapters/3_NAVSEA.tex`, `tex/chapters/4_NAVWAR.tex`
- Verdict: `Needs source`
- Corrected answer: IWS 6.0 is combat-system C2 and CEC/sensor-netting; PMW 150 is operational/tactical C2 applications
  such as GCCS-M, MTC2, C2P, and Link 16 modernization.
- Source basis: NAVSEA PEO IWS and PEO C4I sources listed in `sources.md`.
- Explanation: imported as proposed until the current checkout and live source basis are reverified.
- Confidence: `Medium`
- Status: `proposed`

### 2026-05-30 - CIVPERS Removal Routes

- ID: `gc-20260530-civpers-removal`
- Original claim: non-probationary poor-performance removal paths needed clarification.
- Location: `tex/chapters/27_CIVPERS.tex`
- Verdict: `Needs source`
- Corrected answer: Chapter 75 can be used for unacceptable performance without a PIP, but requires due process,
  preponderance of evidence, efficiency-of-service nexus, and Douglas Factor analysis; Chapter 43 requires an
  opportunity period/PIP.
- Source basis: OPM and eCFR sources listed in `sources.md`.
- Explanation: imported as proposed until the current checkout and live source basis are reverified.
- Confidence: `Medium`
- Status: `proposed`

### 2026-05-30 - Acronym Additions

- ID: `gc-20260530-acronyms`
- Original claim: several acronyms were missing or needed correction.
- Location: `tex/acronyms.def`
- Verdict: `Needs source`
- Corrected answer: package reports additions for WL, WS, ADNS, DCGS-N, DJC2, LNS, and ISNS.
- Source basis: package provenance and official source list in `sources.md`.
- Explanation: imported as proposed until the current checkout is verified.
- Confidence: `Medium`
- Status: `proposed`

## Active Session Findings

### 2026-05-31 - CIVPERS Chapter 43 / Chapter 75 Standards

- ID: `gc-20260531-civpers-ch43-ch75-standards`
- Original claim: In `tex/chapters/27_CIVPERS.tex`, the performance-vs-conduct comparison table lists unacceptable
  performance with a `Substantial evidence` proof standard while the same row also notes that unacceptable performance
  may proceed through either Chapter 43 PIP procedures or a current Chapter 75 unacceptable-performance removal process.
- Location: `tex/chapters/27_CIVPERS.tex`, table `tab:performance_conduct_comparison`
- Verdict: `Ambiguous`
- Corrected answer: Chapter 43 unacceptable-performance actions require an opportunity period/PIP and use the
  substantial-evidence standard on appeal; Chapter 75 adverse actions for unacceptable performance do not require a PIP
  but require efficiency-of-service nexus, preponderance of evidence, due process, and Douglas Factor penalty analysis.
- Source basis: 5 U.S.C. 4303, 5 U.S.C. 7513, 5 U.S.C. 7701, 5 CFR parts 432 and 752, OPM performance-management
  guidance, MSPB performance-based-action material, DoDI 1400.25 Volume 431, and the September 30, 2025 Under Secretary
  of War Personnel and Readiness memo listed in `sources.md`.
- Explanation: The guide paragraph below the table is directionally correct, but the table can be read as assigning the
  Chapter 43 proof standard to all unacceptable-performance routes, including Chapter 75. This should remain a proposed
  guide clarification until the user explicitly agrees to edit the LaTeX source.
- Confidence: `High`
- Status: `proposed`

### 2026-05-31 - Applied CIVPERS Chapter 43 / Chapter 75 Clarification

- IDs: `gc-20260530-civpers-removal`, `gc-20260531-civpers-ch43-ch75-standards`
- Location: `tex/chapters/27_CIVPERS.tex`, table `tab:performance_conduct_comparison` and paragraph
  `Handling unacceptable performance`
- Verdict: `Ambiguous`
- Correction applied: clarified that Chapter 43 uses an opportunity period/\ac{pip}-style route and substantial-evidence
  review, while Chapter 75 unacceptable-performance removals do not require a \ac{pip} but require preponderance,
  efficiency-of-service nexus, due process, and Douglas Factor penalty analysis.
- Source basis: 5 U.S.C. 4303, 5 U.S.C. 7513, 5 U.S.C. 7701, 5 CFR parts 432 and 752, OPM/MSPB comparison material, DoDI
  1400.25 Volume 431, and the September 30, 2025 Under Secretary of War Personnel and Readiness memo listed in
  `sources.md`.
- Confidence: `High`
- Status: `applied`
