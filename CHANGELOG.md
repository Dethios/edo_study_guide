# Changelog

All notable changes to this project will be documented in this file.

This format is based on Keep a Changelog, and this project uses date-based
release tags (release-YYYYMMDD).

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
