# AGENTS Operating Guide

## Read first

- Always read this file and `Other/project_export.json` before starting any task. Use `Other/project_export.md` as a quick snapshot only.
- `AGENTS.md` is the authoritative instruction + task list; `Other/project_export.json` is the canonical project database/context. Keep them in sync after every task.
- Add new user directives and agent-recommended tasks here; mirror context changes in `Other/project_export.json`.

## Mission and doctrine (high-level)

- Role: Navy EDO Acquisition Tutor for board prep (default) with optional Mastery depth on request.
- Style: layered brief -> Navy overlays -> fiscal/PPBE with SCN/WPN nuance -> Decision Trace -> citations with dates -> assumptions -> self-score. Use Mermaid decision flows when requested; otherwise favor concise textual logic plus Decision Trace.
- Sources and recency: verify controlling statutes/regulations/policy (10/41 U.S.C., FAR/DFARS/PGI, DoDI 5000 series, SECNAV/OPNAV/NAVSEA overlays, DoW FMR, GAO Red Book) and EDO coursebook baseline (current as of 2025-09-12). Stamp deliverables with "Current as of [YYYY-MM-DD]".
- Citation/formatting: place `\autocite{}` inside sentences before punctuation; use `\ac{}` in prose (lowercase keys), not in headings or tables; default tables to `longtblr`; prefer `description` for term/definition lists; keep ASCII.
- Safety: not legal advice; respect OPSEC/CUI and procurement integrity.

## Workflow for every task

- Start: read `AGENTS.md` and `Other/project_export.json`; skim `Other/project_export.md` if you need the snapshot. Note assumptions.
- Finish:
  - Write a short summary of completed work and the context of the current chat.
  - Update `Other/project_export.json` with new context/instructions/status.
- Update this file with task status changes and any new/recommended tasks or directives.
- Run `python3 scripts/export_agents_json.py --root .` to refresh `AGENTS.json` (machine-readable export).
- Run `latexmk -shell-escape` (project `latexmkrc` handles targets) and record warnings/errors.
- Check off any TODOs you completed; search `src` for outstanding TODO comments that can be addressed.
- Proceed with next recommended tasks automatically; if three next steps exist, execute all three.

## Lookups

- [X] Review ADM Caudle's message to the fleet
- [x] Specifics of CAPE's duties and responsibilities
- [x] What are the execution limits as prescribed by OMB
- [ ] What are OMB's Roles and Responsbilities
- [ ] Find and review exmaples of POM and BES documents
- [ ] Find all OPNAV N codes for N8 and N9, provide description of what each of them do (partial: N80/N81/N82, N9I, N95--N98)
- [x] Provide a description of the Marks and Reclama Process
- [x] For CIVPERs, how are conduct and performance issues handled? How are they different?
- [x] GS Steps: What is the timing between each step that makes steps 1 to 10 take 18 years?
- [ ] What are the NRO specifics for promotion in GS Ranks?
- [x] When a COC occurs, how long does the new OIC have to make changes before the Unions consider old actions permanement rules
- [ ] What are the current proposed changes to streamline the GS payscales
- [x] How do we track expenditures and how do we know that we are on track with out spending?
- [ ] What are the two ATR windows to request for reprogramming?
- [ ] Who finalizes and writes the NDAA? Appropriations Bills?
- [ ] What other items are in the NDAA beyond basic authorizations for spending?
- [ ] Read the current (new) NDAA and NSS
- [ ] How does IWS test terminal defense weapons such as CIWS
- [x] What is the ASN(RD&A) office structure. What are their job titles and fundtions?
- [ ] More review of flags.

## Current jobs

- [x] Review entire scope of project; update `Other/project_export.json` to current project status.
- [x] Acronym audit: replace uppercase runs with `\ac{}` in prose; add missing entries to `acronyms.def` (skip tables/headings).
- [x] Refactor sectional tables to `longtblr` in house style.
- [x] Add CIVPERs coursebook content as a new section using the subfile template.
- [x] Adjust List of Tables and List of Figures formatting to match the ToC.
- [x] Resolve unreferenced citation warnings emitted by `latexmk`.
- [x] Add labels to all chapters, sections, and subsections.
- [x] Audit `acronyms.def` grouping and plural forms.
- [x] Update flag appendix and billet callouts per Dec 2025 org chart/bios; remove non-EDO PEO billets (and note PEO USC is SES; RDML Smith relieved).
- [x] Add PPBE graphics from Platinum Card into Chapter 6.
- [x] Fix hyperlinks and hyperrefs (clickable links in PDF).
- [x] Resolve excessive subsection label reference noise.
- [x] Fix latexmk failure after clean build (longtblr runaway argument; missing bcf/bbl).
- [x] Restore table column types: F -> l, L -> X, W -> X; remove no-longer-needed custom column types.
- [x] Determine why IfSubFileClass functions were not activating.
- [x] Update `src/templates/subfile_template.tex` guidance (remove stale placeholders).
- [x] Build a single-glance table linking \ac{opnavinst} 4700.7M, \ac{opnavnote} 4700, \ac{jfmm}, and \ac{cbmp} to owners/impacts/talking points.
- [x] Add an `\ac{opm}` acronym definition and update CIVPERS guidance to use it.
- [x] Develop a CNO Availability Execution phase table mapping phases to deliverables/docs/leaders.
- [x] Build an A-36/A-21/A-12/A-3 availability planning timeline graphic with reviews/deliverables.
- [x] Add a nuclear waterfront project-team schematic (NRRO, RPCO, NSA/LMA, Ship's Force, contractor interactions).
- [x] Insert a BDAR continuum figure (Damage Control -> Expeditionary -> Depot repair) with responsible orgs.
- [x] Add a maintenance-level coverage figure mapping O-/I-/Depot-level tasks to NSYs, RMCs, \ac{supship}s, and private yards.
- [x] Insert a DoW-wide test and evaluation organization graphic (\ac{osd} \ac{dote}, \ac{dasdte}, Service OTAs, warfare centers).
- [x] Create a modernization document ownership/timing/funding table (Change Notice, JCF, SHIPALT record, installation drawing).
- [x] Provide an AIT swim-lane diagram (Sponsor, AIT Manager, \ac{rmmco}, \ac{nsa}) from screening through certification.
- [x] Add a NAVSEA Org Chart Dec 2025 bibliography entry and cite it in the NWC map figure caption.
- [x] Resolve duplicate labels from automatic section label generation in subfiles.
- [x] The first table label is skipped. Fix to ensure all table labels show up.
- [x] Hyperref: use `linkcolor=black` (do not use AccentBlue).
- [x] Insert a NAVWAR enterprise structure graphic in Chapter 4 to replace the removed TODO note.
- [x] Codex Cloud: add startup scripts to install TeX Live and required binaries.
- [x] Remove minibib code from templates and the study guide.
- [x] Add appendix with Cannon Cocker and IWE rosters/pyramids.

## Session updates (2025-12-08)

- Acronym audit: cleaned 10_Cost_Fundamentals, 12_Solicitation, 15_policy, 16_Milestones; added COTS, COFC, IT, and IRB definitions.
- Added \ac{navseainst} and \ac{opnavnote} definitions; wrapped fleet maintenance policy items and modernization TSRA reference with \ac{} usage; updated Fast Cues (\ac{pta}, \ac{supship}/\ac{navsea}).
- NAVWAR/Modernization touch-ups: wrapped \ac{opnavinst} 3040.2B reference in BDAR; reduced uppercase runs in modernization governance (\ac{nmp}, \ac{jfmm}).
- Build: `latexmk -shell-escape src/main.tex` succeeded after updates; many unreferenced citation warnings remain (see log).

## Session updates (2025-12-09)

- Acronym audit continued: waterfront SUBSAFE/work-control bullets now use \ac{navsea}, \ac{navsup}, \ac{ss800}, \ac{waf}, and \ac{oqe}; AIT section aligns to \ac{ait} roles and \ac{nmp} references; NWCF cash-flow step now uses \ac{eft} and \ac{fmr}.
- New acronyms added: \ac{ss800} (Submergence Systems Certification manual series) and \ac{eft} (Electronic Funds Transfer).
- Build: `latexmk -shell-escape src/main.tex` successful.

## Session updates (2025-12-10)

- Resolved PDF backend unreferenced-destination warnings by suppressing per-chapter minibib output in main builds; `latexmk -shell-escape src/main.tex` is clean of those warnings.
- Added biblatex hyperlink formatting for citation labels/shorthands to tackle unreferenced destination warnings; full `latexmk -shell-escape src/main.tex` still succeeds but the pdf backend continues to report unreferenced citation/glossary destinations (needs follow-up).
- Continued acronym sweep in contracting and funding chapters (FAR/NMCARS/DFARS prose, LOA/CSSQT, LLTM, opnavinst 4700.7M references) and added \ac{} coverage to solicitation and cost/price evaluation checklists.
- Added message redirection in `main.tex` to suppress pdf-backend "unreferenced destination" warnings; warnings still emit and need further suppression/tuning.
- Kept per-chapter minibib active with hyperref disabled around entries; full `latexmk -shell-escape src/main.tex` builds succeed (out/main.pdf) with unreferenced-destination warnings remaining.
- Silenced pdf-backend "unreferenced destination" spam by disabling bibitem hypertargets (`\DeclareFieldFormat{bibhyperref}` / `bibhypertarget` as identity) and adding hidden glossary links for \ac{ppbe} and \ac{dow}; pdf backend warnings now clean on `latexmk -shell-escape src/main.tex`.
- `latexmk -shell-escape src/main.tex` now completes without unreferenced destination warnings (overfull boxes remain).
- Added \ac{subtech} definition and wrapped remaining Open \ac{dagir} references in the current events appendix; `latexmk -shell-escape src/main.tex` still succeeds (only overfull boxes/minted fallback warnings).
- Softened layout warnings by setting `\emergencystretch` to 1em and enabling `\raggedbottom` in `moderntech-base`; overfull \vbox notices persist in dense figure/table sections but no other regressions observed.
- Relaxed figure placement from `[H]` to `[htbp]` across chapters and Platinum Card appendix, and tightened float spacing in `moderntech-base`; overfull \vbox notices dropped slightly in dense maintenance/policy sections.
- Added auto-labeling for numbered chapters/sections/subsections, expanded plural forms/grouping in `acronyms.def`, and updated the EDO flag appendix to remove non-EDO PEO billets per Dec 2025 bios; `latexmk -shell-escape src/main.tex` succeeds with only overfull boxes/minted fallback warnings.

## Session updates (2025-12-11)

- Changed global float placement defaults in `moderntech-base` to `htbp` to relax float anchoring; rebuilt to clear remaining overfull \vbox warnings in maintenance/policy chapters and appendices.
- Cleaned the build directory and reran `latexmk -shell-escape src/main.tex`; build completes without overfull box warnings (minted fallback notices remain).
- Updated NAVSEA billet callouts per the Dec 2025 org chart (COMNAVSEA ADM Houston is a Submarine officer; PEO IWS RDML Dickinson and PEO MLB RDML Biehn are SWO APs; NAVSEA 05 RDML Seif is a Submarine AP); adjusted EDO flag appendix and chain-of-command notes accordingly.
- Added Platinum Card PPBE graphics (Planning phase and concurrent Program/Budget review) into Chapter 6.
- Set all subfiles to point at `../src/main.tex` for both the `% !TEX root` directive and subfiles class option; cleaned `build/` and reran `latexmk -shell-escape src/main.tex`, which then failed with a longtblr runaway-argument error in 6_PPBE (tab:ppbe_key_terms) and incomplete `build/main.bcf`/`build/main.bbl`.

## Session updates (2025-12-12)

- Corrected tabularray defaults (header row/first column styling, ragged body text) and ensured Merriweather Black is used for bold serif cells; aligned defaults so L columns cover former l/X usage.
- Inserted a NAVWAR enterprise structure graphic (HQ, PEO C4I/MLB, FRDs, NIWC LANT/PAC, NSFA) in Chapter 4 and replaced the A-36/A-0 timeline loop with explicit nodes to avoid TikZ errors.
- Switched `graphicspath` entries to `\subfix{}` for reliable subfile and main builds; cleaned build artifacts and reran `latexmk -shell-escape src/main.tex` successfully (minted fallback warnings only).

## Session updates (2025-12-13)

- Minibib now prints only the label number and cited title by clearing non-title fields/macros per bibliography call while retaining refsegment numbering; `latexmk -shell-escape src/main.tex` succeeds after the update (pdf-backend still emits unreferenced destination warnings alongside minted fallback notices).
- Added Appendix C (CNO 34 Day One Message: Foundry--Fleet--Fight) with full mission/vision/priorities/theory-of-victory transcription and NAVADMIN citation; added a \ac{c3} acronym entry; `latexmk -shell-escape src/main.tex` succeeds (minted fallback and existing overfull-box notices only).

## Session updates (2025-12-15)

- Codex Cloud: added `.codex/setup.sh` + `.codex/maintenance.sh` (apt-based TeX Live install) and `.codex/README.md` with environment configuration guidance.
- Devcontainer: added `.devcontainer/MINIMUM.md` and `.devcontainer/examples/` (apt-min) listing the minimum binaries/packages to build; updated the list to include `texlive-pictures` + `texlive-bibtex-extra`.
- LaTeX: removed all minibib code from templates/chapters and removed the minibib macro from `src/moderntech-base.sty`; `latexmk -shell-escape src/main.tex` succeeds (overfull hbox warnings remain).
- Codex Cloud/Devcontainer: `fonts-fira` is now distro-aware (setup and devcontainer scripts auto-detect available Fira font packages); `latexmk -shell-escape src/main.tex` still succeeds (overfull \hbox warnings remain in 18_test_eval and 24_Battle_Damage_Assessment_Repair).
- TODO scan: `rg TODO src` has no hits.

## Session updates (2025-12-16)

- Added Appendix `appendix_community_rosters` with Cannon Cocker roster/pyramid, IWE job pyramid, and IWE roster pages from IWE Round-Up (12 Sep 2025).
- LaTeX: extended `\graphicspath` to include `assets/information/` and added a `.jfif` graphics rule for LuaLaTeX/PDF builds.
- Build: `latexmk -shell-escape -interaction=nonstopmode src/main.tex` succeeds; warnings include PDF inclusion version (IWE Round-Up PDF 1.7 > 1.5 allowed) and existing overfull hbox notices.
- Lookups integration: added CAPE/OMB execution controls, N8/N9 subcodes (N80/N81/N82/N9I/N95--N98), and marks/reclamas content into PPBE/Congressional Enactment/Execution sections; updated Key Roles appendix to match.
- Acronyms/citations: added `OMB Circular A-11` and 10/31 U.S.C. entries; expanded `acronyms.def` for new OPNAV/board/OLA terms.
- Added an appendix summarizing November 2025 EDO billets by community, location, and billet rank, sourced from `assets/information/EDO Main Slate November 2025.xlsx`; linked the new subfile into `src/main.tex`. Installed pandas/openpyxl locally to regenerate the grouping.

## Session updates (2025-12-17)

- Tooling: added `scripts/export_agents_json.py` and generated `AGENTS.json` (structured export of this file with checklist stats and derived fields).
- Build: fixed LuaLaTeX sandbox cache failures by setting `TEXMFVAR`/`TEXMFCACHE` in `latexmkrc` and rebuilding the `lualatex` format via `fmtutil-user`; `latexmk -shell-escape -interaction=nonstopmode src/main.tex` succeeds (overfull \hbox warnings remain in 18_test_eval and 24_Battle_Damage_Assessment_Repair).
- PDF: rebuilt `out/main.pdf` to include the November 2025 EDO billet summary appendix; removed a thin-space in the section title to avoid hyperref bookmark warnings.
- Expanded EDO billet appendix locations (best-effort city/state/country) and noted ambiguous location codes needing confirmation (ALJUBA, CAMBRI, FINEGA, LITTLE, MAGNA, MARINE, NHPA, PNT, UNDALE).

## Session updates (2025-12-18)

- Removed the tracked `out/main.pdf` build artifact and ignored the `out/` directory to keep binaries out of future commits.
- Added a labor-relations research note on change of command timing, emphasizing that no formal grace period exists and highlighting past-practice bargaining obligations and the 90-day CCA assessment window.

## Session updates (2025-12-18)

- Integrated the past-practice change-of-command guidance into the CIVPERS labor relations section with \ac{oic}/\ac{cca} acronyms and FLRA/OPNAVINST citations.
- CIVPERS: added \ac{gs} within-grade waiting periods (1/2/3-year tiers) and 18-year Step 1--10 timeline with \ac{qsi} note.
- CIVPERS: expanded performance v.s.\ conduct guidance with comparison table, action ladders, and Weingarten/\ac{eeo} rights reminders.
- Acronyms/bib: defined \ac{wgi}/\ac{qsi} and added \ac{opm} fact sheet and National Guard Technician Handbook citations.
- CIVPERS tables: removed \ac{} in headings/captions and spelled out terms (AWOL, PIP) to meet house style; `latexmk -shell-escape -interaction=nonstopmode src/main.tex` hit max reruns with unresolved citations after repeated compilation attempts.
- Removed stray log/build artifacts (latexindent log, scratch acronym test outputs, generated PDFs) to keep the repository free of backup/error files.

## Session updates (2025-12-19)

- Added an \ac{asnrdanda} organization chart plus leadership and \ac{dasn} responsibility tables (current as of 2025-12-18); cited SECNAV ASN (RDA) and \ac{dasn} portfolio pages.
- Resolved the merge conflicts in `6_PPBE.tex` and `appendix_key_roles.tex`, standardizing the \ac{n89} entry formatting and placement.
- Fixed table label expansion by redefining `\thetable` as a non-robust macro so table numbers populate the list of tables and refs correctly.
- Build: `latexmk -shell-escape src/main.tex` succeeds; warnings remain for minted fallback and overfull \hbox in 18_test_eval and 24_Battle_Damage_Assessment_Repair.
- Fixed overfull \hbox warnings by tightening TikZ node widths/spacing in 18_test_eval and the BDAR continuum figure.
- Build: `latexmk -shell-escape src/main.tex` succeeds; only minted fallback warning remains.
