# Acquisition Policy Audit Implementation Plan

> Execute the source audit inline using the executing-plans workflow.

**Goal:** Reconcile the study guide with current official DoD and Navy acquisition policy.

**Architecture:** Inventory policy claims and compare them with primary issuances and applicable statutes.
Correct source text and linked study answers together, retain historical context with explicit labels,
and record verification limits rather than inferring changes from strategy announcements.

**Tech Stack:** LaTeX, BibTeX, Python inspection, official public sources, native LuaLaTeX fallback.

**Spec:** User request to audit against DoDI and acquisition information and update outdated content.

## Global Constraints

- Current as of 2026-10-20; do not apply a future effective date as current policy.
- Use authoritative sources and preserve statutory, regulatory, and policy distinctions.
- Log original claim, status, correction, source, explanation, and confidence.
- Preserve the previously corrected TOC hierarchy and inspect changed PDF pages.
- Standing user authorization permits committing and pushing verified updates to origin/main.

## Review Focus

- A strategy announcement is not an automatic cancellation of an instruction or statute.
- Constant-year acquisition thresholds are not interchangeable with current-year contracting thresholds.
- Obsolete technical-review and requirements documents may remain only with clear historical labels.
- Changes to instruction dates must come from the actual issuance or official catalog.
- Unavailable source bodies must be recorded as limitations, not marked fully verified.

## Task 1: Inventory and Source Review

- [x] Inventory cited acquisition issuances and claims across the guide.
- [x] Verify pathway, engineering, cyber, sustainment, cost, and T&E issuance versions and relevant requirements.
- [x] Verify acquisition thresholds, FAR/DFARS changes, JFRP, and workforce policy.
- [x] Record a topic-level coverage matrix and limitations in the audit report.

## Task 2: Apply Corrections

- [x] Update affected chapters, bibliography metadata, and contradictory study answers.
- [x] Record source-ledger, audit-log, and append-only guide-change entries.
- [x] Run source, acronym, structure, memory, and Markdown checks.

## Task 3: Deliver Verified PDF

- [x] Build once source changes are complete; resolve real build errors.
- [x] Inspect affected rendered pages and scan the PDF for clipping and unresolved citations.
- [x] Record checks, residual limitations, and PDF checksum.
- [x] Prepare the validated changes for commit and push to origin/main; verify the remote commit after pushing.

## Execution Notes

This is a factual document audit, not a software feature. Existing document validation and rendered-PDF
checks are the relevant verification; no implementation-mirroring tests are added. Proceed inline under
the user's authorized scope without an intermediate approval gate. Use work/ for research snapshots.
