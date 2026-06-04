# EDO Study Memory Index

Current as of 2026-06-04.

## Latest Session

- Session: `2026-06-04-end-to-end-study-guide-audit`
- Date: 2026-06-04
- Mode: editor-in-chief study-guide audit with structure, consistency, and official-source review.
- Latest repository work: June 4 audit closeouts refreshed the ASN(RD\&A)/PAE chart, current-organization and
  fleet-maintenance source basis, NAVWAR/PEO C4I mappings, IWS 6.0 vs PMW 150 distinction, AWP/SOVT quick review,
  JFRP/LFT&E/NAVWAR source grounding, contracting/RFO and certified cost/pricing cues, T&E organization
  currentness, NAVSEA non-EDO leader/source-ledger cleanup, standalone chapter flow, appendix standalone
  titles/glossaries, structure-guard coverage, PAE chart connector routing and clearance follow-up,
  SE technical-review baseline cleanup, EDO flag/billet source hygiene, CIVPERS source-fidelity cleanup, OPNAV resource-sponsor map cleanup,
  NAVWAR/PEO C4I official-source hygiene refresh, and study-memory/source-ledger state.
- Result: the guide is in an active audit state, not a completed end-to-end certification. Continue slice-by-slice
  source/currentness checks and keep study-memory records aligned after each applied correction.

## Current Priorities

- Continue the end-to-end guide audit across remaining chapters and appendices, using official/current sources for
  time-sensitive facts.
- Keep the one-question board-drill cadence when study flow resumes; do not let background maintenance interrupt the
  active drill.
- Preserve spaced review for SE baselines, C4I product-to-office recall, DCGS-N, PMW 790/DJC2, resource sponsor mapping,
  CIVPERS removal paths, WG/WL/WS distinctions, and source-version-sensitive EDO flag billets.
- Before adding or changing current org, billet, program-manager, ACAT, policy, law, budget, or threshold details,
  verify against live official or primary sources and record the source basis.

## Active Weak Areas

- Systems engineering - SE review baselines: active, medium severity.
- NAVWAR / PEO C4I - PEO C4I program office products: active, medium severity.
- NAVWAR / PEO C4I - DCGS-N acronym and product identity: active, medium severity.
- NAVWAR / PEO C4I - PMW 790 product: active, medium severity.
- OPNAV organization - resource sponsor mapping: active, medium severity.
- CIVPERS - Chapter 43 vs Chapter 75 removal paths: active, medium severity.
- Current EDO organization - current EDO flags and billets: active, medium severity and source-version sensitive.
- NAVWAR / PEO C4I - CANES vs ADNS vs MIDS/Link 16: improving, medium severity.
- Program baselines - APB vs PMB, PPBE POM/BES, required KPPs, and IWS 6.0 vs PMW 150 remain improving/low severity
  but should stay on spaced review.

See `weak_areas.md` for the readable tracker and `weak_areas.jsonl` for append-only records.

## Open Study-Guide Updates

The original May 30 imported records are preserved as historical `proposed` entries in `study_guide_audit.md` and
`guide_changes.jsonl`. June 4 closeout records supersede the NAVWAR/C4I, IWS 6.0 vs PMW 150, acronym, CIVPERS,
current-organization, fleet-maintenance, current-events, strategy-baseline, flow, and source-integrity items that have
since been verified and applied.

Recent applied updates:

- Current organization / fleet-maintenance source drift closeout across Chapter 1, PAE mapping, EDO flags, RMC/JFMM
  material, and the June 2 reference study material.
- Strategy-baseline and flow cleanup for the 2025 NSS / 2026 NDS baseline, JCIDS/JFRP caveats, and AWP/SOVT structure.
- Current-events official-source hardening for Columbia-class delays, amphibious block buy, and SIOP status.
- Flow, study-memory, and PAE chart closeout, including the Q18 Net-Ready question-bank entry.
- Standalone chapter flow cleanup for CIVPERS, NAVWAR FRD, Milestones, and AWP/SOVT.
- Consistency/source-integrity cleanup for SOVT expansion, DASD(T\&E), and stale audit paths.
- CIVPERS source-fidelity cleanup for Chapter 43/75, DPMAP, WGI/QSI, FLSA, and standalone chapter titles.
- Systems-engineering review/baseline cleanup for the SRR/SFR trap and SFR/PDR/CDR baseline mapping.
- EDO flag/billet source-hygiene cleanup for PAE Maritime deputy lanes, stale bio citations, and weak-area state.
- OPNAV resource-sponsor map cleanup for the N3/N5 vs N7 board trap and N8 integrator vs N9 sponsor distinction.
- NAVWAR/PEO C4I source-hygiene refresh for PMW/A 170 naming, C4I fast-cue citations, and CEC article date alignment.

## Next Review Plan

- Continue the next audit slice with current-fact and source-grounding checks before marking the broader guide audit
  complete.
- When returning to drills, ask exactly one board-style question and grade the answer before asking the next one.
- Update `learning_log.jsonl`, `weak_areas.jsonl`, `study_guide_audit.md`, `guide_changes.jsonl`, and this index after
  substantive graded answers or applied guide corrections.
- Validate with `make check-study-memory`, `make check-acronyms`, `make check-tex-structure`, `git diff --check`, and a
  Docker PDF build after substantive LaTeX edits.

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
