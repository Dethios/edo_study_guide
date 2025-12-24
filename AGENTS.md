# AGENTS.md — EDO Acquisition Tutor

## Read First

- Read this file and `Other/project_export.json` before starting any task. Use `Other/project_export.md` only as a brief reference.
- `AGENTS.md` is the authoritative instruction/task list. `Other/project_export.json` is the canonical project database. After each task, keep them synchronized.
- Do not track Journal repo updates in EDO repo files.
- Do not track `out/main.pdf`; use for verification only. Released PDFs are gitignored in `release/` and uploaded to GitHub Releases.

## Mission and Doctrine (High Level)

- **Role:** Navy EDO Acquisition Master Instructor focused on developing a study guide for qualification board prep, with Mastery depth.
- **Sources/Recency:** Verify current controlling statutes/regulations/policy (10/41 U.S.C., FAR/DFARS/PGI, DoDI 5000 series, SECNAV/OPNAV/NAVSEA overlays, DoW FMR, GAO Red Book) and the EDO coursebook (current as of 2025-09-12). Stamp deliverables as "Current as of [YYYY-MM-DD]".
- **Safety:** Not legal advice; maintain OPSEC/CUI and procurement integrity.

## Formatting Rules

- **Citations:** Use `\autocite{}` inside sentences, before punctuation.
- **Acronyms:** Use `\ac{}` in prose (lowercase keys) only; not in headings or tables.
- **Tables:** Use `longtblr` by default; prefer `description` for term/definition lists.
- **Encoding:** ASCII only.

## Workflow for Every Task

- **Start:** Read `AGENTS.md` and `Other/project_export.json`; use `Other/project_export.md` if a quick snapshot is needed. Note assumptions.
- **Finish:**
  - Write a brief summary of completed work and current chat context.
  - Update `Other/project_export.json` with new context, added instructions, and current status.
- Update this file with status changes and new/recommended tasks or directives.
- If the task changes any `tex/` files or tooling config for the LaTeX build:
  - Run `latexmk -shell-escape` (using project `latexmkrc`); record warnings/errors.
- After each test/build, delete SAVE-ERROR files, temp files, and lock files (`*.lock`, `*.lck`, `*.auxlock`).
- Mark off completed TODOs; search LaTeX sources (`tex/main.tex`, `tex/chapters/`, `tex/tikz/`, `tex/templates/`) for outstanding TODOs.
- Proceed with all next recommended tasks, up to three at a time.

## Lookups

- [X] Review ADM Caudle's message to the fleet
- [X] Specifics of CAPE duties and responsibilities
- [X] OMB execution limits
- [X] OMB Roles and Responsibilities
- [X] POM and BES document examples
- [X] All OPNAV N codes for N8 and N9, describe each (partial: N80/N81/N82, N9I, N95–N98)
- [X] Description of Marks and Reclama Process
- [X] CIVPERs: conduct/performance issue handling and differences
- [X] GS Steps: timeline for 1–10 to take 18 years
- [ ] NRO specifics for promotion in GS ranks
- [X] COC: new OIC time to make changes before union actions become permanent
- [ ] Proposed changes to streamline GS pay scales
- [X] Expenditure tracking and spending pace
- [ ] ATR windows to request reprogramming
- [X] Who finalizes/writes NDAA and Appropriations Bills
- [X] Items in NDAA beyond spending authorizations
- [X] Current NDAA and NSS
- [ ] IWS test methods for terminal defense weapons (e.g., CIWS)
- [X] ASN(RD&A) office structure, job titles, and functions
- [X] Further flag review

## Current Jobs

- [X] Review project scope; update `Other/project_export.json` to current status
- [X] Acronym audit: run replacements with `\ac{}` in prose and fill acronyms.def (skip tables/headings)
- [X] Refactor sectional tables to `longtblr`
- [X] Add CIVPERs content as new section using subfile template
- [X] Adjust List of Tables/Figures formatting to match ToC
- [X] Resolve latexmk unreferenced citation warnings
- [X] Add labels to all chapters/sections/subsections
- [X] Audit acronyms.def grouping/plurals
- [X] Update flag appendix and billet callouts per Dec 2025 org chart; remove non-EDO PEO billets (note PEO USC is SES; RDML Smith relieved)
- [X] Add PPBE graphics (Platinum Card) into Chapter 6
- [X] Fix hyperlinks/hyperrefs for clickable PDF links
- [X] Resolve excess subsection label reference noise
- [X] Fix latexmk failure after clean build (longtblr runaway arg, missing bcf/bbl)
- [X] Restore table column types: F→l, L/W→X; remove unused custom types
- [X] Determine why IfSubFileClass functions didn't activate
- [X] Update subfile_template.tex guidance (remove stale placeholders)
- [X] Table: link \ac{opnavinst} 4700.7M, \ac{opnavnote} 4700, \ac{jfmm}, \ac{cbmp} w/ owners, impacts, talking points
- [X] Add `\ac{opm}` acronym and update CIVPERS guidance
- [X] CNO Availability Execution phase table: phases → deliverables/docs/leads
- [X] Build A-36/A-21/A-12/A-3 availability timeline graphic
- [X] Add nuclear waterfront project-team schematic
- [X] BDAR continuum figure with orgs
- [X] Maintenance level coverage figure mapping orgs and tasks
- [X] DoW-wide test and eval org graphic
- [X] Modernization doc ownership/timing/funding table
- [X] AIT swim-lane diagram: Sponsor, AIT Manager, \ac{rmmco}, \ac{nsa}
- [X] NAVSEA Org Chart Dec 2025 cite and bibliography
- [X] Resolve duplicate labels from subfile-generated labels
- [X] Ensure first table label is present
- [X] Set `linkcolor=black` for hyperref, not AccentBlue
- [X] Insert NAVWAR enterprise structure graphic in Chapter 4
- [X] Codex Cloud: add TeX Live/bin install scripts
- [X] Remove minibib from templates/study guide
- [X] Appendix with Cannon Cocker/IWE rosters/pyramids
- [X] Repo layout: move LaTeX sources under `tex/`; align output/scripts/tool config.
- [X] Merge Current Events chapter into appendix and remove the redundant chapter file
