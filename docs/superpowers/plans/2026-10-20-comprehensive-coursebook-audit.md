# Comprehensive EDO guide implementation plan

> **For agentic workers:** Use executing-plans for bounded implementation and preserve the checkpoint after each pass.

**Goal:** Update the guide in place against all available coursebooks and current official sources.

**Architecture:** Retain the canonical LaTeX chapters, macros, bibliography, and existing verified work.
Independent research batches write evidence; the primary worker reconciles and integrates edits.

**Tech Stack:** LuaLaTeX, latexmk, Biber, repository checks, PyMuPDF for PDF review.

**Spec:** User request in this session; durable scope and status in
`docs/reference/2026-10-comprehensive-audit/checkpoint.md`.

## Global constraints

- Preserve prior and unrelated changes; do not reset, clean, push, publish, or release.
- Review all retained coursebooks, including visual material, without a page-count target.
- Distinguish verified current rules, future reforms, historical context, and missing evidence.
- Keep exact source-to-section traceability and record validation after each pass.

## Review focus

- Image-only slides omitted by text extraction.
- Announced reorganizations mistaken for completed transfers.
- Legacy program names used as current ownership evidence.
- Catalog/version checks mistaken for reading a full controlling issuance.
- Tables, captions, sources, labels, and answer keys drifting from canonical explanations.

## Tasks

- [x] Inspect baseline, instructions, prior audits, inventory, and toolchain.
- [x] Create the complete file inventory and durable checkpoint.
- [ ] Correct Weeks rank and the three figures after source verification.
- [ ] Reconcile NAVSEA, PAEs, ALs, DRPMs, offices, and ACAT I mappings.
- [ ] Reconcile JFRP, PPBE, and DAS content with current authorities.
- [ ] Complete page-level review and integrate the remaining coursebook batches.
- [ ] Run source/acronym/structure/Markdown checks and the documented PDF build.
- [ ] Inspect changed rendered pages and cross-references; record exact remaining gaps.

Research artifacts live in `docs/reference/2026-10-comprehensive-audit/batches/`.
The final guide remains `artifacts/out/main.pdf`. No release step is included.
