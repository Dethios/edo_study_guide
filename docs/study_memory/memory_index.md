# EDO Study Memory Index

Current as of 2026-05-30.

## Latest Session

- Session: `2026-05-30-import`
- Date: 2026-05-30
- Mode: imported long session
- Provenance: `/home/victor/dev-workspace/EDO_Study_Guide_Chat_Session_Package_2026-05-30`
- Import status: initial package inventory extracted into this memory system.

The May 30 package is the initial source of truth for this memory system. The
package has not been copied into the repository. Imported state comes from the
package files `README.md`, `session_context.md`, `study_state.md`,
`guide_update_status.md`, `lookup_deck.md`, `source_notes.md`, and
`handoff_prompt.md`.

## Current Priorities

- Drill PEO C4I, PEO IWS, and PEO MLB product-to-office recall.
- Tighten the IWS 6.0 vs PMW 150 distinction.
- Drill CANES vs ADNS vs MIDS/Link 16 and the afloat email path.
- Drill CIVPERS poor-performer removal routes, especially Chapter 75 vs
  Chapter 43.
- Verify current org structures, billets, program managers, ACAT status, and
  policy/law against live official sources before treating details as current.

## Active Weak Areas

Imported active weak areas:

- PEO C4I program office products.
- CANES vs ADNS vs MIDS/Link 16.
- Current EDO flags and billets.
- PPBE POM/BES decision documents.
- APB vs PMB.
- SE review baselines and required KPPs.
- IWS 6.0 vs PMW 150.
- DCGS-N, PMW 790/DJC2, and OPNAV resource sponsor mapping.
- CIVPERS removal paths and WG/WL/WS pay-plan distinctions.

See `weak_areas.md` for the full readable tracker and `weak_areas.jsonl` for
append-only records.

## Open Study-Guide Updates

The package reports completed parent-session updates in NAVWAR, NAVSEA,
CIVPERS, acronyms, bibliography, and changelog files. These are imported as
`proposed` guide-change records until the current checkout is verified directly.
Do not mark them `applied` unless the corresponding study-guide file is present
in this checkout and validation was run.

See `study_guide_audit.md` and `guide_changes.jsonl` for correction records.

## Next Review Plan

- Ask one drill question at a time from `question_bank.jsonl`.
- Start with PEO C4I/NAVWAR product ownership or IWS 6.0 vs PMW 150.
- Grade responses as Strong, Adequate, Incomplete, or Incorrect.
- Update `learning_log.jsonl` and weak-area records after each graded answer.
- Validate memory files with `make check-study-memory`.

## Memory Files

- `README.md`: operating instructions.
- `sessions.jsonl`: append-only session summaries.
- `weak_areas.md`: readable weak-area tracker.
- `weak_areas.jsonl`: append-only weak-area records.
- `study_guide_audit.md`: readable correction and audit log.
- `guide_changes.jsonl`: append-only guide-change records.
- `sources.md`: source inventory.
- `question_bank.jsonl`: generated or validated questions.
- `learning_log.jsonl`: graded-answer outcomes.
- `schemas.md`: JSONL field definitions and examples.

## 2026-05-31 Active Update

- Session: `2026-05-31-c4i-afloat-email-civpers`
- Mode: active board drill with memory update.
- Latest graded answer: afloat email path from DDG sailor to shore.
- Result: Adequate; CANES/ADNS/MIDS relationship weak area is improving.
- Next recommended drill: CIVPERS Chapter 75 vs Chapter 43 removal paths.
- Open guide-update item: proposed clarification to `tex/chapters/27_CIVPERS.tex` so the Chapter 43 substantial-evidence/PIP route is not conflated with the Chapter 75 preponderance/no-PIP/Douglas-factor route.

## 2026-05-31 CIVPERS Applied Update

- Session: `2026-05-31-civpers-ch43-ch75-application`
- Latest graded answer: Chapter 43 vs Chapter 75 unacceptable-performance removal path.
- Result: Incomplete; CIVPERS removal-path weak area remains active at high severity.
- Guide update: applied authorized clarification to `tex/chapters/27_CIVPERS.tex` separating Chapter 43 substantial-evidence/PIP requirements from Chapter 75 preponderance/no-PIP/Douglas-factor requirements.
- Next recommended drill: redrill Chapter 43 vs Chapter 75 in a concise CO-advice format before rotating back to PPBE or APB vs PMB.

## 2026-05-31 CIVPERS Redrill Update

- Session: `2026-05-31-civpers-redrill-q7`
- Latest graded answer: Chapter 43 vs Chapter 75 30-second redrill.
- Result: Adequate; CIVPERS removal-path weak area improved to medium severity but remains active.
- Next active drill: route-selection tradeoff for Chapter 43 vs Chapter 75.
- Next verified topic in progress: PPBE POM vs BES distinction.

## 2026-05-31 CIVPERS Route-Trade Update

- Session: `2026-05-31-civpers-route-trade-q8`
- Latest graded answer: Chapter 43 vs Chapter 75 route-selection tradeoff.
- Result: Incomplete; user knows mechanics but needs to state route-selection tradeoffs crisply.
- Next active drill: PPBE Program Objective Memorandum vs Budget Estimate Submission, source-verified before asking.

## 2026-05-31 PPBE POM/BES Update

- Session: `2026-05-31-ppbe-pom-bes-q9`
- Latest graded answer: Program Objective Memorandum vs Budget Estimate Submission.
- Result: Adequate; user has phase/time horizon mostly correct but must avoid saying POM proves funding.
- Next active drill: correct a PM who conflates POM and BES.
- Next verified topic in progress: APB vs PMB.

## 2026-05-31 PPBE Correction Update

- Session: `2026-05-31-ppbe-pom-bes-correction-q10`
- Latest graded answer: corrected PM statement that POM proves five-year funding and BES is the same document.
- Result: Strong; POM/BES weak area improved to low severity.
- Next active drill: APB vs PMB, source-verified before asking.
- Next verified topic in progress: SE review baselines.

## 2026-05-31 APB/PMB Update

- Session: `2026-05-31-apb-pmb-q11`
- Latest graded answer: corrected PM statement that worsening contract EVM CPI/SPI automatically means the APB was breached and should be revised.
- Result: Strong; APB vs PMB weak area improved to low severity.
- Key residual precision: avoid saying the PMB is approved at the IBR; the IBR jointly assesses PMB realism and risks after contract award. Use control accounts and work packages rather than control packages.
- Study-guide impact: no LaTeX update warranted because `tex/chapters/16_Milestones.tex` and `tex/chapters/14_EVM.tex` already separate APB from PMB without duplicating content.
- Next active drill: SE review baselines, source-verified before asking.
