# AGENTS Operating Guide

## Read first

- Always read this file and `Other/project_export.json` before starting any task. Use `Other/project_export.md` as a quick snapshot only.
- `AGENTS.md` is the authoritative instruction + task list; `Other/project_export.json` is the canonical project database/context. Keep them in sync after every task.
- Add new user directives and agent-recommended tasks here; mirror context changes in `Other/project_export.json`.
- Do not track `out/main.pdf`; use it only for verification. Release PDFs stay gitignored in `release/`, and the release script tags and uploads the PDF to GitHub Releases.

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
- If the task updates any files in `tex` folder or affects of the tooling config files for the latex build:
- Run `python3 scripts/export_agents_json.py --root .` to refresh `AGENTS.json` (machine-readable export).
  - Run `latexmk -shell-escape` (project `latexmkrc` handles targets) and record warnings/errors.
- After every test/build, scrub and remove SAVE-ERROR files, temp files, and lock files (including *.lock/*.lck/*.auxlock).
- Check off any TODOs you completed; search the LaTeX sources (`tex/main.tex`, `tex/chapters/`, `tex/tikz/`, `tex/templates/`) for outstanding TODO comments that can be addressed.
- Proceed with next recommended tasks automatically; if three next steps exist, execute all three.

## Lookups

- [X] Review ADM Caudle's message to the fleet
- [X] Specifics of CAPE's duties and responsibilities
- [X] What are the execution limits as prescribed by OMB
- [ ] What are OMB's Roles and Responsbilities
- [ ] Find and review exmaples of POM and BES documents
- [X] Find all OPNAV N codes for N8 and N9, provide description of what each of them do (partial: N80/N81/N82, N9I, N95--N98)
- [X] Provide a description of the Marks and Reclama Process
- [X] For CIVPERs, how are conduct and performance issues handled? How are they different?
- [X] GS Steps: What is the timing between each step that makes steps 1 to 10 take 18 years?
- [ ] What are the NRO specifics for promotion in GS Ranks?
- [X] When a COC occurs, how long does the new OIC have to make changes before the Unions consider old actions permanement rules
- [ ] What are the current proposed changes to streamline the GS payscales
- [X] How do we track expenditures and how do we know that we are on track with out spending?
- [ ] What are the two ATR windows to request for reprogramming?
- [X] Who finalizes and writes the NDAA? Appropriations Bills?
- [X] What other items are in the NDAA beyond basic authorizations for spending?
- [X] Read the current (new) NDAA and NSS
- [ ] How does IWS test terminal defense weapons such as CIWS
- [X] What is the ASN(RD&A) office structure. What are their job titles and fundtions?
- [X] More review of flags.

## Current jobs

- [X] Review entire scope of project; update `Other/project_export.json` to current project status.
- [X] Acronym audit: replace uppercase runs with `\ac{}` in prose; add missing entries to `acronyms.def` (skip tables/headings).
- [X] Refactor sectional tables to `longtblr` in house style.
- [X] Add CIVPERs coursebook content as a new section using the subfile template.
- [X] Adjust List of Tables and List of Figures formatting to match the ToC.
- [X] Resolve unreferenced citation warnings emitted by `latexmk`.
- [X] Add labels to all chapters, sections, and subsections.
- [X] Audit `acronyms.def` grouping and plural forms.
- [X] Update flag appendix and billet callouts per Dec 2025 org chart/bios; remove non-EDO PEO billets (and note PEO USC is SES; RDML Smith relieved).
- [X] Add PPBE graphics from Platinum Card into Chapter 6.
- [X] Fix hyperlinks and hyperrefs (clickable links in PDF).
- [X] Resolve excessive subsection label reference noise.
- [X] Fix latexmk failure after clean build (longtblr runaway argument; missing bcf/bbl).
- [X] Restore table column types: F -> l, L -> X, W -> X; remove no-longer-needed custom column types.
- [X] Determine why IfSubFileClass functions were not activating.
- [X] Update `tex/templates/subfile_template.tex` guidance (remove stale placeholders).
- [X] Build a single-glance table linking \ac{opnavinst} 4700.7M, \ac{opnavnote} 4700, \ac{jfmm}, and \ac{cbmp} to owners/impacts/talking points.
- [X] Add an `\ac{opm}` acronym definition and update CIVPERS guidance to use it.
- [X] Develop a CNO Availability Execution phase table mapping phases to deliverables/docs/leaders.
- [X] Build an A-36/A-21/A-12/A-3 availability planning timeline graphic with reviews/deliverables.
- [X] Add a nuclear waterfront project-team schematic (NRRO, RPCO, NSA/LMA, Ship's Force, contractor interactions).
- [X] Insert a BDAR continuum figure (Damage Control -> Expeditionary -> Depot repair) with responsible orgs.
- [X] Add a maintenance-level coverage figure mapping O-/I-/Depot-level tasks to NSYs, RMCs, \ac{supship}s, and private yards.
- [X] Insert a DoW-wide test and evaluation organization graphic (\ac{osd} \ac{dote}, \ac{dasdte}, Service OTAs, warfare centers).
- [X] Create a modernization document ownership/timing/funding table (Change Notice, JCF, SHIPALT record, installation drawing).
- [X] Provide an AIT swim-lane diagram (Sponsor, AIT Manager, \ac{rmmco}, \ac{nsa}) from screening through certification.
- [X] Add a NAVSEA Org Chart Dec 2025 bibliography entry and cite it in the NWC map figure caption.
- [X] Resolve duplicate labels from automatic section label generation in subfiles.
- [X] The first table label is skipped. Fix to ensure all table labels show up.
- [X] Hyperref: use `linkcolor=black` (do not use AccentBlue).
- [X] Insert a NAVWAR enterprise structure graphic in Chapter 4 to replace the removed TODO note.
- [X] Codex Cloud: add startup scripts to install TeX Live and required binaries.
- [X] Remove minibib code from templates and the study guide.
- [X] Add appendix with Cannon Cocker and IWE rosters/pyramids.
- [X] Refactor repo layout so LaTeX sources live under `tex/`; align build outputs, scripts, and tooling configs.

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

## Session updates (2025-12-20)

- Installed Codex CLI via npm using a user-level prefix (`/home/victor`) after a global install hit EACCES; verified `codex-cli 0.76.0` is on PATH.
- Build tooling: set absolute out/build dirs, stop recursive `src//` TEXINPUTS, and keep latexmk in repo root (`$do_cd = 0`) so LaTeX stops picking up stale aux files under `src/build`.
- LaTeX: fixed shell-escape detection for minted under LuaLaTeX and reordered `csquotes` to load after code/listings helpers.
- Glossaries: switched `\edoAcrLink` to `\glslink`, disabled noidx rerun check, and disabled glossary hyperlink targets to eliminate pdf-backend destination warnings.
- Build: ran LuaLaTeX -> biber -> LuaLaTeX pass sequence with absolute output paths; warnings cleared and `out/main.pdf` refreshed.

## Session updates (2025-12-21)

- Moved LaTeX sources from `src/` to repo root (`main.tex`, `chapters/`, `tikz/`, `templates/`, `moderntech*`, `acronyms.def`, `edo.bib`); removed stale `src/build` and `src/out` artifacts.
- Updated graphics paths and subfile aux references for the new layout; cleaned image includes to rely on `\graphicspath`.
- Consolidated scripts into build/format/release pairs for bash + PowerShell; removed legacy latexmk/copy_release/watch helpers and empty `tools/`.
- Refreshed VS Code LaTeX Workshop config to use new build script, updated latexindent args, and aligned image/tikz path mappings.
- Build: `latexmk -shell-escape main.tex` succeeds; no new warnings observed in the latexmk output.
- Renamed CNO messaging PDFs in `assets/information` to descriptive filenames (CNOTE 1–3, Day One Message, Charge of Command).
- Moved LaTeX sources and assets into `tex/`, keeping build artifacts in root `out/` + `build/`; updated `latexmkrc`, `moderntech.sty`, and bib notes to match.
- Updated build/format scripts for `tex/main.tex` defaults, added post-build scrub of SAVE-ERROR/temp/lock files, and removed `scripts/Path.ps1`.
- Refreshed VS Code LaTeX Workshop recipes for WSL/Windows and updated image/bib path mappings for the new `tex/` layout.
- Build: `latexmk -shell-escape tex/main.tex` succeeds; output written to `out/main.pdf`.
- Removed `tex/chapters/latexmkrc` so subfile builds rely on the root `latexmkrc` and keep outputs in `out/` + `build/`.
- WSL tooling: switched to a systemd-managed user `ssh-agent` and simplified `~/.bashrc` to export `SSH_AUTH_SOCK` only.
- Added `scripts/scrub.sh` + `scripts/scrub.ps1` and a VS Code task to remove SAVE-ERROR/temp/lock artifacts; build scripts now call the scrub helper.
- Updated `scripts/release.*` to copy the dated PDF and then commit/push; `scripts/push.*` no longer create release files.
- LaTeX Workshop now points to root `latexindent.yaml`/`.chktexrc` and uses absolute `out/` + `build/` paths.
- Release workflow: ignore `release/*.pdf`, tag with `release-YYYYMMDD`, and publish assets via GitHub CLI; added VS Code tasks for release and AI context bundling; removed `scripts/manage.sh`.
- Release notes now pull from `CHANGELOG.md` (tag section) with git-log fallback; added README/CHANGELOG/LICENSE + standard community files.
- Set dual licensing: CC BY-NC 4.0 for document content (`LICENSE`) and MIT for scripts (`LICENSE-CODE`); added CONTRIBUTING guidance for PR-based derivative submissions.
- Added and tracked `tex/assets/information/2025-National-Security-Strategy.pdf`.
- Added `scripts/ai-context.sh` + `scripts/ai-context.ps1` to build `scratch/ai_context.zip` (diffs, log excerpt, selected files) and a VS Code task to generate the bundle for Gemini uploads.
- Build: `latexmk -shell-escape` required `tex/main.tex` (no default targets); `latexmk -shell-escape tex/main.tex` reports up-to-date output.
- TODO scan: `rg TODO tex/main.tex tex/chapters tex/tikz tex/templates` found no matches.
- Context: user asked for Gemini 3 Pro workflow guidance and a one-step AI context zip for drag/drop.
- Generated `scratch/settings_diff.md` comparing VS Code settings across Windows user, WSL machine, and project workspaces.

## Session updates (2025-12-22)

- Merged VS Code settings across Windows user, WSL machine, and project workspaces; applied requested overrides, unified cSpell lists, and normalized LaTeX Workshop recipes/tools to `scripts/build.*` (settings files rewritten as canonical JSON).
- Verified GitHub release notes match `CHANGELOG.md` for `release-20251221`; added `.gitattributes` to normalize LF endings; cleaned VS Code tasks (removed duplicate AI task, added Windows override for push, and prevented WSL update task on non-Linux).
- Renormalized the repository after adding `.gitattributes` so line endings align across WSL/Windows.
- Restored comment scaffolding in `.vscode/settings.json`, forced `[latex].editor.tabSize = 4`, and regenerated `scratch/settings_diff.md` (no drift across settings files).
- Clarified that the `shfmt` not found message indicates the formatter is missing and offers snap (newer) or apt (older) install options with version differences.
- Outlined additional `shfmt` installation paths (Go install, package managers, or prebuilt binaries) beyond apt/snap.
- Acronyms: wrapped `\glslink` usage to suppress `glossaries-extra` post-link hooks and switched acronym command definitions to `\DeclareDocumentCommand` to avoid shortcut conflicts.
- Tooling: regenerated `AGENTS.json`.
- Build: `latexmk -shell-escape tex/main.tex` succeeded after acronym macro tweaks.
- Acronyms: bypassed `\glslink` in `\ac` rendering (use `\@glslink` + boxed `\glsadd`) to eliminate the leading space; added fallback `\theglsentrycounter`/`\theHglsentrycounter` definitions for noidx writes.
- Build: `latexmk -shell-escape tex/main.tex` succeeded; biber not run, so 1265 undefined citation warnings remain (missing `build/main.bbl`).

## Session updates (2025-12-23)

- Indentation guidance: recommend 4 spaces for general coding; confirmed `.vscode/settings.json` already uses 4 for tab/indent settings (no changes needed in repo settings).
- WSL inventory: confirmed Ubuntu 24.04.3 on WSL2 with apt + snap, upstream TeX Live 2025 at `/usr/local/texlive/2025` (root-owned), NVM-managed Node v25.2.1 plus apt-installed `nodejs`/`npm` and 373 `node-*` packages, Docker CE from the Docker repo, snapd installed with no snaps, MiKTeX apt repo present but no MiKTeX packages, and PATH duplication/Windows toolchain entries; queued follow-up questions before optimization recommendations.
- WSL deep-dive: captured npm/pnpm globals (corepack/npm; @openai/codex), confirmed no Python user-site packages, noted Docker build cache ~5.6 GB with no images/containers, and identified ~389 auto-installed npm deps plus 17 nodejs deps via apt; preparing cleanup recommendations (snapd, apt node stack, Docker cache) pending user preferences.
- Docker cache: pruned Docker build cache (`docker builder prune -a -f`); `docker system df -v` now reports 0B cache and no images/containers.
- PATH interop: attempted to set `/etc/wsl.conf` `[interop] appendWindowsPath=false` but sudo password is required; pending user execution of the provided command.
- User cleanup confirmation: user reports binaries now resolve to NVM Node and TeX Live, with TeX Live at ~11 GB, NVM at ~234 MB, and pnpm store at ~328 MB; Python user site path absent (no user packages).
- VS Code outside-repo settings: checked `/home/victor/.vscode-server/data/Machine/settings.json` and verified indent/tab widths already set to 4; no external settings changes required.
- Windows VS Code settings: verified `/mnt/c/Users/vic-l/AppData/Roaming/Code/User/settings.json` already uses 4-space tab/indent values; no edits required.
- Explained the latexindent failure when the `File::HomeDir` Perl module is missing and suggested installing the distro package or CPAN module.
- Ran latexindent across all `*.tex` files with the requested flags, removed the no-extension backup files it created, and confirmed no remaining TODO markers in LaTeX sources.
- Build: `latexmk -shell-escape` failed without a target; `latexmk -shell-escape tex/main.tex` succeeded but still emits pdf-backend unreferenced glossary destination warnings; scrubbed temp/lock artifacts.
