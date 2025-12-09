# AGENTS Operating Guide

## Read first
- Always read this file and `Other/project_export.json` before starting any task. Use `Other/project_export.md` as a quick snapshot only.
- `AGENTS.md` is the authoritative instruction + task list; `Other/project_export.json` is the canonical project database/context. Keep them in sync after every task.
- Add new user directives and agent-recommended tasks here; mirror context changes in `Other/project_export.json`.

## Mission and doctrine (high-level)
- Role: Navy EDO Acquisition Tutor for board prep (default) with optional Mastery depth on request.
- Style: layered brief → Navy overlays → fiscal/PPBE with SCN/WPN nuance → Decision Trace → citations with dates → assumptions → self-score. Use Mermaid decision flows when requested; otherwise favor concise textual logic plus Decision Trace.
- Sources and recency: verify controlling statutes/regulations/policy (10/41 U.S.C., FAR/DFARS/PGI, DoDI 5000 series, SECNAV/OPNAV/NAVSEA overlays, DoW FMR, GAO Red Book) and EDO coursebook baseline (current as of 2025-09-12). Stamp deliverables with “Current as of [YYYY-MM-DD]”.
- Citation/formatting: place `\autocite{}` inside sentences before punctuation; use `\ac{}` in prose (lowercase keys), not in headings or tables; default tables to `longtblr`; prefer `description` for term/definition lists; keep ASCII.
- Safety: not legal advice; respect OPSEC/CUI and procurement integrity.

## Workflow for every task
- Start: read `AGENTS.md` and `Other/project_export.json`; skim `Other/project_export.md` if you need the snapshot. Note assumptions.
- Finish:
  - Write a short summary of completed work and the context of the current chat.
  - Update `Other/project_export.json` with new context/instructions/status.
- Update this file with task status changes and any new/recommended tasks or directives.
- Run `latexmk -shell-escape` (project `latexmkrc` handles targets) and record warnings/errors.
- Check off any TODOs you completed; search `src` for outstanding TODO comments that can be addressed.
- Proceed with next recommended tasks automatically; if three next steps exist, execute all three.

## Session updates (2025-12-08)
- Acronym audit: cleaned 10\_Cost\_Fundamentals, 12\_Solicitation, 15\_policy, 16\_Milestones; added COTS, COFC, IT, and IRB definitions.
- Added \ac{navseainst} and \ac{opnavnote} definitions; wrapped fleet maintenance policy items and modernization TSRA reference with \ac{} usage; updated Fast Cues (\ac{pta}, \ac{supship}/\ac{navsea}).
- NAVWAR/Modernization touch-ups: wrapped \ac{opnavinst}~3040.2B reference in BDAR; reduced uppercase runs in modernization governance (\ac{nmp}, \ac{jfmm}).
- Build: `latexmk -shell-escape src/main.tex` succeeded after updates; many unreferenced citation warnings remain (see log).

## Session updates (2025-12-09)
- Acronym audit continued: waterfront SUBSAFE/work-control bullets now use \ac{navsea}, \ac{navsup}, \ac{ss800}, \ac{waf}, and \ac{oqe}; AIT section aligns to \ac{ait} roles and \ac{nmp} references; NWCF cash-flow step now uses \ac{eft} and \ac{fmr}.
- New acronyms added: \ac{ss800} (Submergence Systems Certification manual series) and \ac{eft} (Electronic Funds Transfer).
- Build: `latexmk -shell-escape src/main.tex` successful; unreferenced citation warnings persist (see build/main.log).

## Current jobs
- [ ] Review entire scope of project, including every file in all folders and update `Other/project_export.json` to current project status.
- [ ] Check every project section for three or more consecutive capital letters. Assume that would be an acronym. Check `acronyms.def` and add missing entries; replace with `\ac{<lab>}` in prose (skip tables/headings).
- [ ] Refactor all sectional tables to be a formatted `longtblr` in the current house style.
- [x] Add the CIVPERs coursebook content to the study guide in a new section following the subfile template; ensure all learning topics are covered.
- [ ] Adjust the List of Tables and List of Figures formatting to match the Table of Contents.
- [ ] Resolve the unreferenced citation warnings emitted by `latexmk` (see current build log) to clean the PDF cross-references.
- [ ] Complete the remaining acronym audit in prose (avoid tables/headings) to ensure all uppercase runs are covered by `\ac{}` where appropriate.
