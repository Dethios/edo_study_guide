# AGENTS.md — EDO Acquisition Tutor

## Read First

-   Read this file, `project_export.json`, and `.github/copilot-instructions.md` before starting any task.
-   `AGENTS.md` is the authoritative instruction/task list. `project_export.json` is the canonical project database. Only update these files when files under `/home/victor/projects/edo/main` are modified; when you update either file, keep them synchronized.
-   Do not track `out/main.pdf`; use for verification only. Released PDFs are gitignored in `release/` and uploaded to GitHub Releases.

## Mission and Doctrine (High Level)

-   **Role:** Navy EDO Acquisition Master Instructor focused on developing a study guide for qualification board prep, with Mastery depth.
-   **Sources/Recency:** Verify current controlling statutes/regulations/policy (10/41 U.S.C., FAR/DFARS/PGI, DoDI 5000 series, SECNAV/OPNAV/NAVSEA overlays, DoW FMR, GAO Red Book) and the EDO coursebook (current as of 2025-09-12). Stamp deliverables as "Current as of [YYYY-MM-DD]".
-   **Safety:** Not legal advice; maintain OPSEC/CUI and procurement integrity.
-   **Conflict handling:** When sources conflict, state the hierarchy (statute > regulation > policy > local), prefer the most recent controlling doc, and note assumptions.

## Formatting Rules

-   **Citations:** Use `\autocite{}` inside sentences, before punctuation.
-   **Acronyms:** Use `\ac{}` in prose (lowercase keys) only; not in headings or tables.
-   **Tables:** Use `longtblr` by default; prefer `description` for term/definition lists.
-   **Encoding:** ASCII only.

## Response and Scope Discipline (GPT-5.2)

-   **Verbosity clamp:** Default to 3–6 sentences or <=5 bullets. For complex multistep tasks: 1 short overview paragraph, then <=5 bullets labeled What changed, Where, Risks, Next steps, Open questions.
-   **Updates:** Only send brief updates (1–2 sentences) when starting a new major phase or when the plan changes; include at least one concrete outcome and avoid narrating routine tool calls.
-   **Scope control:** Implement exactly and only what the user asks. No extra features or embellishments; call out optional follow-ons instead of doing them.
-   **Ambiguity:** Ask up to 1–3 targeted clarifying questions or proceed with explicit assumptions and the simplest valid interpretation.
-   **Long context:** Restate key constraints and anchor claims to file paths or section names when inputs are long or dense.
-   **High-risk self-check:** For legal/financial/compliance outputs, re-scan for ungrounded claims or overly strong language and soften with stated assumptions.

## Tool Usage

-   Prefer tools over assumptions for user-specific data, file state, and IDs; parallelize independent reads when possible.
-   After any write/update, restate what changed, where, and any validation performed.

## Workflow for Every Task

-   **Start:** Read `AGENTS.md`, `project_export.json`, and `.github/copilot-instructions.md`. Note assumptions.
-   **Finish (only if files under `/home/victor/projects/edo/main` were modified):**
    -   Write a brief summary of completed work and current chat context.
    -   Update `project_export.json` with new context, added instructions, and current status.
-   Update this file with status changes and new/recommended tasks or directives only when files under `/home/victor/projects/edo/main` were modified.
-   If the task changes any `tex/` files or tooling config for the LaTeX build:
    -   Run `latexmk -shell-escape` (using project `latexmkrc`); record warnings/errors.
-   After each test/build, delete SAVE-ERROR files, temp files, and lock files (`*.lock`, `*.lck`, `*.auxlock`).
-   Mark off completed TODOs; search LaTeX sources (`tex/main.tex`, `tex/chapters/`, `tex/tikz/`, `tex/templates/`) for outstanding TODOs.
-   Proceed with all next recommended tasks, up to three at a time.
-   Keep task lists tidy: maintain Outstanding Lookups and Current Jobs above, and move completed items into Resolved Lookups and Completed Jobs at the bottom whenever Lookups or Current Jobs are updated.

## Memory Update Protocol

-   **Trigger:** User says `Update memory: <reason>`.
-   **Pre-read:** `.github/copilot-instructions.md`, `AGENTS.md`, `project_export.json`.
-   **Output only:**
    1. One-sentence rationale.
    2. JSON Merge Patch (RFC 7396) for `project_export.json` in a code block labeled `json_patch`.
-   Never rewrite the whole file; patch only changed leaves. Never invent sources.

## Other Instruction Sources

-   `.github/copilot-instructions.md`: Repo-wide AI defaults (AGENTS remains authoritative).
-   `GEMINI.md`: Gemini-specific mirror of AGENTS for that toolchain.
-   `tex/chapters/TikZ/Coursebook_Ingest.md`: Chapter-specific style/content requirements when editing that material.

## Outstanding Lookups

-   [ ] NRO specifics for promotion in GS ranks
-   [ ] Proposed changes to streamline GS pay scales
-   [ ] ATR windows to request reprogramming
-   [ ] IWS test methods for terminal defense weapons (e.g., CIWS)
-   [ ] NAVWAR PMW list with citations
-   [ ] Definitions: AOR/NOR/SLR/IGT
-   [ ] NWCF vs. mission-funded distinctions
-   [ ] Fast Cues/Common Board Pivots refresh
-   [ ] Glossary pipeline (IDs/chunking/cadence)

## Current Jobs

-   [ ] (none)

## Resolved Lookups

-   [x] Review ADM Caudle's message to the fleet
-   [x] Specifics of CAPE duties and responsibilities
-   [x] OMB execution limits
-   [x] OMB Roles and Responsibilities
-   [x] POM and BES document examples
-   [x] All OPNAV N codes for N8 and N9, describe each (partial: N80/N81/N82, N9I, N95–N98)
-   [x] Description of Marks and Reclama Process
-   [x] CIVPERs: conduct/performance issue handling and differences
-   [x] GS Steps: timeline for 1–10 to take 18 years
-   [x] COC: new OIC time to make changes before union actions become permanent
-   [x] Expenditure tracking and spending pace
-   [x] Who finalizes/writes NDAA and Appropriations Bills
-   [x] Items in NDAA beyond spending authorizations
-   [x] Current NDAA and NSS
-   [x] ASN(RD&A) office structure, job titles, and functions
-   [x] Further flag review

## Completed Jobs

<<<<<<< HEAD
- Codex Cloud: added `.codex/setup.sh` + `.codex/maintenance.sh` (apt-based TeX Live install) and `.codex/README.md` with environment configuration guidance.
- Devcontainer: added `.devcontainer/MINIMUM.md` and `.devcontainer/examples/` (apt-min) listing the minimum binaries/packages to build; updated the list to include `texlive-pictures` + `texlive-bibtex-extra`.
- LaTeX: removed all minibib code from templates/chapters and removed the minibib macro from `src/moderntech-base.sty`; `latexmk -shell-escape src/main.tex` succeeds (overfull hbox warnings remain).
- Codex Cloud/Devcontainer: `fonts-fira` is now distro-aware (setup and devcontainer scripts auto-detect available Fira font packages); `latexmk -shell-escape src/main.tex` still succeeds (overfull \hbox warnings remain in 18_test_eval and 24_Battle_Damage_Assessment_Repair).
- TODO scan: `rg TODO src` has no hits.

## Session updates (2025-12-16)

- Added Appendix `appendix_community_rosters` with Cannon Cocker roster/pyramid, IWE job pyramid, and IWE roster pages from IWE Round-Up (12 Sep 2025).
- LaTeX: extended `\graphicspath` to include `assets/information/` and added a `.jfif` graphics rule for LuaLaTeX/PDF builds.
- Build: `latexmk -shell-escape -interaction=nonstopmode src/main.tex` succeeds; warnings include PDF inclusion version (IWE Round-Up PDF 1.7 > 1.5 allowed) and existing overfull hbox notices.
- Lookups1: completed OPNAV N8/N9 subcode coverage by adding N83/N84/N89 to PPBE and Key Roles; updated `acronyms.def` accordingly; `latexmk -shell-escape src/main.tex` succeeds (warnings unchanged).
- Lookups integration: added CAPE/OMB execution controls, N8/N9 subcodes (N80/N81/N82/N9I/N95--N98), and marks/reclamas content into PPBE/Congressional Enactment/Execution sections; updated Key Roles appendix to match.
- Acronyms/citations: added `OMB Circular A-11` and 10/31 U.S.C. entries; expanded `acronyms.def` for new OPNAV/board/OLA terms.
=======
-   [x] Review project scope; update `project_export.json` to current status
-   [x] Acronym audit: run replacements with `\ac{}` in prose and fill acronyms.def (skip tables/headings)
-   [x] Refactor sectional tables to `longtblr`
-   [x] Add CIVPERs content as new section using subfile template
-   [x] Adjust List of Tables/Figures formatting to match ToC
-   [x] Resolve latexmk unreferenced citation warnings
-   [x] Add labels to all chapters/sections/subsections
-   [x] Audit acronyms.def grouping/plurals
-   [x] Update flag appendix and billet callouts per Dec 2025 org chart; remove non-EDO PEO billets (note PEO USC is SES; RDML Smith relieved)
-   [x] Add PPBE graphics (Platinum Card) into Chapter 6
-   [x] Fix hyperlinks/hyperrefs for clickable PDF links
-   [x] Resolve excess subsection label reference noise
-   [x] Fix latexmk failure after clean build (longtblr runaway arg, missing bcf/bbl)
-   [x] Restore table column types: F→l, L/W→X; remove unused custom types
-   [x] Determine why IfSubFileClass functions didn't activate
-   [x] Update subfile_template.tex guidance (remove stale placeholders)
-   [x] Table: link \ac{opnavinst} 4700.7M, \ac{opnavnote} 4700, \ac{jfmm}, \ac{cbmp} w/ owners, impacts, talking points
-   [x] Add `\ac{opm}` acronym and update CIVPERS guidance
-   [x] CNO Availability Execution phase table: phases → deliverables/docs/leads
-   [x] Build A-36/A-21/A-12/A-3 availability timeline graphic
-   [x] Add nuclear waterfront project-team schematic
-   [x] BDAR continuum figure with orgs
-   [x] Maintenance level coverage figure mapping orgs and tasks
-   [x] DoW-wide test and eval org graphic
-   [x] Modernization doc ownership/timing/funding table
-   [x] AIT swim-lane diagram: Sponsor, AIT Manager, \ac{rmmco}, \ac{nsa}
-   [x] NAVSEA Org Chart Dec 2025 cite and bibliography
-   [x] Resolve duplicate labels from subfile-generated labels
-   [x] Ensure first table label is present
-   [x] Set `linkcolor=black` for hyperref, not AccentBlue
-   [x] Insert NAVWAR enterprise structure graphic in Chapter 4
-   [x] Codex Cloud: add TeX Live/bin install scripts
-   [x] Remove minibib from templates/study guide
-   [x] Appendix with Cannon Cocker/IWE rosters/pyramids
-   [x] Repo layout: move LaTeX sources under `tex/`; align output/scripts/tool config.
-   [x] Merge Current Events chapter into appendix and remove the redundant chapter file
-   [x] Move project_export.json to repo root and update references (2025-12-24)
-   [x] Move project_export schema to `schemas/project_export.schema.json` and fix filename typo (2025-12-24)
-   [x] Retire project_export.md after extracting remaining guidance (2025-12-24)
-   [x] Optimize AGENTS.md with GPT-5.2 prompting guidance (2025-12-24)
-   [x] Integrate memory_update.md into AGENTS.md and remove the file (2025-12-24)
-   [x] Inventory instruction sources and account for them in AGENTS.md (2025-12-24)
-   [x] Add settings_master.json and automate settings sync/merge (VS Code open + git push)
-   [x] Create WSL/VS Code replication notebook with optional devcontainer scaffold (2025-12-24)
-   [x] Commit devcontainer files for Ubuntu WSL replication (2025-12-24)
-   [x] Audit shell/PowerShell script parity and tasks.json OS routing (2025-12-24)
-   [x] Tidy settings_manager.py spacing (2025-12-24)
-   [x] Add NDS, C2, AI, CTF, and BES acronyms (2025-12-24)
-   [x] Add shell script runner Jupyter notebook under scripts (2025-12-24)
-   [x] Resolve remaining undefined citation warnings in `build/main.log` after biber runs
-   [x] Add VS Code task to merge settings (2025-12-25)
-   [x] Fix BUILD-WSL LaTeX Workshop command path to avoid ENOENT (2025-12-25)
-   [x] Guidance: shell_runner.ipynb sudo apt-get hang and notebook TTY limits (2025-12-26)
-   [x] Add sudo -n guard to shell_runner.ipynb (2025-12-26)
-   [x] Guidance: WSL + VS Code terminal vs Jupyter terminal behavior (2025-12-26)
-   [x] Merge on-open tasks with sudo -v precheck (2025-12-26)
-   [x] Guidance: sudo timestamp not shared with notebook (2025-12-26)
-   [x] Guidance: devcontainer TeX Live setup summary (2025-12-26)
-   [x] Align WSL TeX Live install with devcontainer and add package/font audit (2025-12-26)
-   [x] WSL installer: install missing required/optional fonts (2025-12-26)
-   [x] WSL notebook: add ssh backup/restore and sudoers guidance (2025-12-26)
-   [x] WSL sudoers: use $USER instead of hard-coded name (2025-12-26)
-   [x] Add NIP/MIP funding subsection (NRO context) with citations and acronyms (2025-12-28)
-   [x] Default markdown-related files to markdown-preview-enhanced and sync settings (2026-01-02)
>>>>>>> 2c8325c950bf425138843fea73e7b1d900b1d9e2
