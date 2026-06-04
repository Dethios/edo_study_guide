# EDO Study Memory Index

Current as of 2026-05-31.

## Latest Session

- Session: `2026-05-31-apa-milestone-c-q16`
- Date: 2026-05-31
- Mode: active board drill with memory update.
- Latest graded answers: KPP/KSA/APA hierarchy and APA missed-in-test consequence at Milestone C.
- Result: KPP/KSA/APB basics are improving; APA definition and mandatory performance-attribute recall remain active, and
  Milestone C should be stated as entry into Production and Deployment/LRIP or limited deployment rather than final
  production approval.

## Current Priorities

- Continue current drill: mandatory performance-attribute areas for a shipboard C4I system entering Milestone B.
- Drill post-CDR change control on spaced review: CCB/ECP, cost/schedule/interface/test/logistics/risk impact analysis.
- Tighten KPP/KSA/APA language: APA is below KPP/KSA criticality but still measurable, testable, documented, and
  relevant to milestone risk.
- Tighten SE baseline language: baselines are controlled technical definitions, not the review event or test result.
- Continue spaced review for APB vs PMB, especially IBR role and control-account/work-package terminology.
- Continue spaced review for PPBE POM/BES, especially avoiding "POM proves funding" and "BES is allocated budget."
- Continue CIVPERS Chapter 43 vs Chapter 75 route-selection tradeoff.
- Drill PEO C4I, PEO IWS, and PEO MLB product-to-office recall.
- Verify current org structures, billets, program managers, ACAT status, and policy/law against live official sources
  before treating details as current.

## Active Weak Areas

- Systems engineering - SE review baselines: active, medium severity.
- JCIDS and requirements - KPP/KSA/APA hierarchy and required performance attributes: active/improving, medium severity.
- CIVPERS - Chapter 43 vs Chapter 75 removal paths: active/improving, medium severity.
- NAVWAR / PEO C4I - PEO C4I program office products: active, high severity.
- Current EDO organization - current EDO flags and billets: active, high severity and source-version sensitive.
- NAVWAR / PEO C4I - CANES vs ADNS vs MIDS/Link 16: improving, medium severity.
- Program baselines - APB vs PMB: improving, low severity.
- PPBE - POM/BES decision documents: improving, low severity.
- Program baselines - APB vs PMB, SE review baselines, required performance attributes, IWS 6.0 vs PMW 150, DCGS-N, PMW
  790/DJC2, OPNAV resource sponsor mapping, and WG/WL/WS distinctions remain on spaced review.

See `weak_areas.md` for the readable tracker and `weak_areas.jsonl` for append-only records.

## Open Study-Guide Updates

The imported May 30 package reports completed parent-session updates in NAVWAR, NAVSEA, CIVPERS, acronyms, bibliography,
and changelog files. These remain imported as `proposed` guide-change records until the current checkout is verified
directly.

Applied update:

- CIVPERS Chapter 43 / Chapter 75 clarification in `tex/chapters/27_CIVPERS.tex`, recorded in `study_guide_audit.md` and
  `guide_changes.jsonl`.

No LaTeX update was warranted from the APB/PMB, SE-baseline, or KPP/KSA/APA drills because the current guide already
separates the relevant concepts and the observed misses were recall/framing issues rather than confirmed guide defects.

## Next Review Plan

- Continue current drill: mandatory performance-attribute areas for shipboard C4I at Milestone B.
- Grade responses as Strong, Adequate, Incomplete, or Incorrect.
- Update `learning_log.jsonl`, `weak_areas.jsonl`, and this index after substantive graded answers.
- Validate memory files with `make check-study-memory` when shell/tooling permits.

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
