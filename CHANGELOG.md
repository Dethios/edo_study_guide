# Changelog

All notable changes to this project will be documented in this file.

This format is based on Keep a Changelog, and this project uses date-based
release tags (release-YYYYMMDD).

## [Unreleased]

### Changed

- Keep tutor sessions, questions, learning outcomes, weak areas, and imported study handoffs local and Git-ignored;
  retain shared source/correction evidence and validate the boundary on fresh clones.
- Ground board tutoring in guide sections, mapped coursebook objectives/pages, and applicable current official
  sources; refine grading, hidden-answer cadence, adaptive review, and bounded worker responsibilities.
- Remove retired tutor worker model/effort pins so explicit supported dispatch settings can apply.

## [release-20261020] - 2026-10-20

### Fixed

- Remove the redundant acquisition-governance figure and redraw the ASN(RD&A) chart from the supplied official image.
- Audit acquisition instruction versions and statutory boundaries; correct AoA/SEP approvals, cost reporting and LFT
  rules.
- Refresh October CAS/SBIR limits, software/MTA authority, service funding, and nontraditional-contractor exemptions.
- Replace current SAR teaching with the MSAR crosswalk and document blocked-policy verification limits.
- Use the same sans-serif family throughout the TOC, with larger bold ALL CAPS major headings and smaller regular
  entries.
- Replace the June EDO roster with the visually read September roster and verified later duty changes.
- Update Small, Weeks, Williams, Moton and Miller leadership cues; carry NAVSEA-to-PAE transfers through summaries.
- Correct malformed T&E tables caused by literal ampersands; restore usable column widths and pagination.
- Wrap appropriation descriptions, widen compact tables and list-of-tables numbering, and separate diagram labels.
- Update ASN(RD&A) to VADM Seiko Okano performing duties after the September transition; preserve deputy-roster dates.
- Date the revised guide October 20, 2026.

### Validation and Limitations

- Publish the verified 471-page PDF from `main`; TOC and chart changes were visually reviewed.
- Document, source-ledger, and formatting checks pass; citations and major TOC page references resolve.
- Detailed DoWI 8430.01 and current RFO attachment verification limits remain documented in the acquisition audit.

## [release-20261019] - 2026-10-19

### Changed

- Publish the newest checked-in 474-page study guide from `main`.
- Replace default JCIDS teaching with JFRP, including Service approval, SRD documents, CGA/IPLs, JICR,
  and requirements-to-resourcing integration.
- Refresh PAE/PPBE organization material, Warrior Toughness, incentive-contract examples, review questions,
  and provenance for all 70 uploaded coursebooks.
- Publish the exact checked-in PDF; derive the asset date from the release tag rather than the runner clock.

### Validation and Limitations

- PDF build and source-ledger, acronym, structure, and study-memory checks passed. Citations and references resolve.
- Layout/font warnings remain, and 390 older live-source access dates require separate policy revalidation.
  Source ambiguities and verification limits are recorded in `docs/reference/2026-10-coursebook-refresh.md`.

## [Unreleased]

### Added

- Integrated Qual Board study notes from Marci covering public shipyards and
  RMC locations, technical authority escalation paths, AIT product integration
  walkthrough, and class modernization differences.
- Expanded Validation vs. Verification definitions and detailed DOT\&E /
  COMOPTEVFOR roles and responsibilities in testing chapter.
- Added a repo-local acronym hygiene check for duplicate definitions, undefined
  acronym keys, table-body acronym macros, and item-label acronym macros.
- Added a current-events source-ledger check for `tex/current_events.bib`
  citation usage and `docs/study_memory/sources.md` URL coverage.
- Added a coursebook coverage manifest that maps included coursebook modules and
  topic learning objectives to study-guide chapters, citation keys, and coverage
  status.
- Documented the Git-root documentation set and project memory boundaries.

### Changed

- Refreshed all 70 uploaded coursebooks and actual edition metadata; rebuilt JFRP requirements teaching, JICR/SRD
  handoffs, current organization crosswalks, incentive calculations, and Warrior Toughness skills.
- Refreshed root repository documentation to match the current script set,
  tracked `artifacts/out/main.pdf`, and release-script behavior.
- Updated repo-local EDO tutor skills to periodically include rote organization
  recall for NAVSEA/NAVWAR codes, warfare centers, EDO flag officers, PEO
  offices, ACAT program mappings, and OPNAV resource sponsors during mixed
  board prep.
- Integrated murder-board lookup corrections for NAVWAR/PEO C4I product cues,
  PEO MLB portfolios, IWS C2 distinctions, and CIVPERS pay/probation rules.
- Performed a formatting and editorial audit pass for acronym placement,
  citation/table-source consistency, list formatting, and table-of-contents depth.
- Align README and contributing guidance with current build and release scripts.
- Refreshed `AGENTS.md` to remove stale instruction-source references and keep
  active agent guidance focused on source recency, LaTeX conventions, and
  validation.
- Clarified Docker build examples in `README.md`.
- Standardized remaining appendix Summary / Quick Review flow, added official
  combatant-command source support, and rerouted the ASN(RD&A) / PAE TikZ chart
  connectors so lines no longer overlap the boxes in the rendered PDF.

## [release-20251221] - 2025-12-21

### Added

- Public release scaffolding, release automation, and GitHub Releases workflow.
