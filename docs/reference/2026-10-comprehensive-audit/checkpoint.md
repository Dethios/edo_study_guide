# Comprehensive coursebook and official-source audit

Current as of 2026-10-20. Baseline: `e8b2ef1a10271b1e6e64bb717a70b1707b57b11e`.

## Resume here

Read this checkpoint, `inventory.json`, and the reports in `batches/` before doing more work.
Do not restart the completed October refresh or acquisition-policy audit. Preserve existing changes.
The audit is **in progress**, not a certification that all material is current.

Execution is paused for a recovery snapshot. Read root `RECOVERY_HANDOFF.md` and `recovery-state.json` first.
Next concrete step: reconcile the nine undefined bibliography keys in the ten preserved chapter edits using the
saved batch evidence. Do not restart workers or the whole audit. The figures remain unfinished.

## Recovery reconciliation

Recovered on branch `recovery/edo-source-update-20261020T162032Z` from the unchanged baseline HEAD.
All six workers ended with stream errors; no active TeX/Biber/Python/PDF-rendering process was found.
There were no staged changes at recovery. Ten edited chapter files and all surviving research notes are preserved.
The 71 source PDFs are tracked and match their inventory hashes. Saved module reports cover 29 modules; the remaining
42 have no durable module review record. These counts describe saved evidence, not independent certification.

`recovery-state.json` maps all modules to surviving reports and records edited-file hashes and missing citation keys.
There is no saved organizations report. Only the GAO glossary bibliography fragment survived; the other requested
new-bibliography fragments were not written. No figure or leadership corrections were applied.

No new build was attempted. The guide PDF still matches the baseline SHA-256 recorded in `RECOVERY_HANDOFF.md`.
The October 16 build log predates these changes. `git diff --check` passed before recovery-document edits;
all saved audit JSON parsed, and source inventory integrity checks passed.
The initial remote read failed at the sandbox proxy; retry with explicit tool network permission succeeded.
This is an incomplete preservation commit, not a validated release.
Focused Markdown checks pass for the handoff, checkpoint, saved original request, and plan. Inherited research-note
formatting failures in `requirements.md` and `maintenance_civpers.md` remain; no content/build validation was attempted.

## Baseline and completed work

- Working tree and index were clean at entry; recent commits and saved October audits were inspected.
- Existing JFRP chapter, acquisition-policy corrections, September roster, TOC redesign, and PDF layout work
  are retained. The obsolete filename `17K_jcids.tex` contains JFRP teaching, not a standalone JCIDS chapter.
- Read `AGENTS.md`, `README.md`, `CONTRIBUTING.md`, build scripts, source-ledger conventions, and prior audit notes.
- The previous 70-file inventory was a text-comparison inventory, not an all-slide visual review.
- Enumerated **71 retained coursebooks / 2,805 PDF pages**. The additional source is the 90-page
  `5.1.1 Naval Justice & Standards.pdf`; its embedded title is *Intermediate Leader Legal Course*.
  Edition/date remain to be established.
- `inventory.json` records actual file paths, hashes, page counts, and inherited edition metadata.
  `artifacts/audit/text/` contains page-delimited extraction for navigation, not evidence of visual review.
- No reset, clean, push, publication, release, or commit was performed.

## Bounded passes

| Pass | Scope                                                   | Status                      | Evidence / next action                                       |
| ---- | ------------------------------------------------------- | --------------------------- | ------------------------------------------------------------ |
| 0    | Baseline and inventory                                  | Complete                    | Clean baseline; 71 files; coverage certification pending     |
| 1    | Weeks rank; command, ASN, NAVSEA figures                | Paused; no edits applied    | Verify roster and chart; use labels, not numbers             |
| 2    | Organizations, offices, ACAT I mapping                  | Interrupted; report missing | Contact sheets exist but do not prove review                 |
| 3    | Requirements, PPBE, DAS                                 | Partial edits; unvalidated  | Four saved module records; bibliography integration pending  |
| 4a   | Contracting, software, cost                             | Partial edits; unvalidated  | Seven saved module records; bibliography integration pending |
| 4b   | Engineering, quality, case study                        | Research only; paused       | Four saved module records; proposals not applied             |
| 4c   | Maintenance and CIVPERS                                 | Research only; paused       | Seven saved module records; proposals not applied            |
| 4d   | Leadership, legal, career, administration               | Research only; paused       | Seven saved module records; proposals not applied            |
| 5    | Integration, source/term checks, build, rendered review | Pending                     | Run documented checks after integration                      |

## Coverage rules and conflict decisions

- A module is fully reviewed only after every page's substantive text and visual content has been read.
  Contact sheets must be legible; dense tables and image-only material require enlarged inspection.
- Existing manifest `covered`/`updated` statuses describe prior content availability, not this audit's completion.
- Each batch records objective/topic, exact PDF page range, guide section/label, required change, evidence,
  reviewed ranges, remaining gaps, and next action. No unreviewed page is marked complete.
- Coursebooks establish instructional scope; governing official authorities control current facts.
  Publication, effective, and access dates are distinct. A source catalog is not the full issuance.
- User-directed in-place execution overrides skill defaults to create another worktree, pause for approval,
  or delete audit records. Validation uses existing content/build checks rather than artificial prose tests.
- No release is authorized; `AGENTS.md` explicitly prohibits running `scripts/release.sh` without a request.

## Validation and access

Baseline PDF and earlier reports are preserved. A fresh build is pending.
The existing local toolchain is available through `/workspace/edo-toolchain/activate.sh`.
Check for active TeX processes before building; use the documented local fallback if Docker is unavailable.

The shell network policy allows package services but excludes Navy/DoD sites. Official-source research uses
the available Search Service connector. Tool discovery via `tool_search` returned unsupported; its callable
web tool was discovered in `functions.exec` tool metadata. Do not treat a search snippet as a full PDF read.

## Unresolved items at this checkpoint

- All-page review, integration, and current-source checks remain incomplete; workers are stopped.
- Naval Justice & Standards has no edition/date in the previous inventory.
- Prior audit gaps remain open until actually retrieved: full current JFRP issuances, DoWI 8430.01,
  revised RFO attachments, and detailed MSAR preparation guidance.
- Existing bibliography metadata backlog is not evidence that every underlying claim is incorrect or current.
