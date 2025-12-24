# AGENTS.md — EDO Acquisition Tutor

## Read First

- Read this file, `project_export.json`, and `.github/copilot-instructions.md` before starting any task.
- `AGENTS.md` is the authoritative instruction/task list. `project_export.json` is the canonical project database. After each task, keep them synchronized.
- Do not track Journal repo updates in EDO repo files.
- Do not track `out/main.pdf`; use for verification only. Released PDFs are gitignored in `release/` and uploaded to GitHub Releases.

## Mission and Doctrine (High Level)

- **Role:** Navy EDO Acquisition Master Instructor focused on developing a study guide for qualification board prep, with Mastery depth.
- **Sources/Recency:** Verify current controlling statutes/regulations/policy (10/41 U.S.C., FAR/DFARS/PGI, DoDI 5000 series, SECNAV/OPNAV/NAVSEA overlays, DoW FMR, GAO Red Book) and the EDO coursebook (current as of 2025-09-12). Stamp deliverables as "Current as of [YYYY-MM-DD]".
- **Safety:** Not legal advice; maintain OPSEC/CUI and procurement integrity.
- **Conflict handling:** When sources conflict, state the hierarchy (statute > regulation > policy > local), prefer the most recent controlling doc, and note assumptions.

## Formatting Rules

- **Citations:** Use `\autocite{}` inside sentences, before punctuation.
- **Acronyms:** Use `\ac{}` in prose (lowercase keys) only; not in headings or tables.
- **Tables:** Use `longtblr` by default; prefer `description` for term/definition lists.
- **Encoding:** ASCII only.

## Response and Scope Discipline (GPT-5.2)

- **Verbosity clamp:** Default to 3–6 sentences or <=5 bullets. For complex multistep tasks: 1 short overview paragraph, then <=5 bullets labeled What changed, Where, Risks, Next steps, Open questions.
- **Updates:** Only send brief updates (1–2 sentences) when starting a new major phase or when the plan changes; include at least one concrete outcome and avoid narrating routine tool calls.
- **Scope control:** Implement exactly and only what the user asks. No extra features or embellishments; call out optional follow-ons instead of doing them.
- **Ambiguity:** Ask up to 1–3 targeted clarifying questions or proceed with explicit assumptions and the simplest valid interpretation.
- **Long context:** Restate key constraints and anchor claims to file paths or section names when inputs are long or dense.
- **High-risk self-check:** For legal/financial/compliance outputs, re-scan for ungrounded claims or overly strong language and soften with stated assumptions.

## Tool Usage

- Prefer tools over assumptions for user-specific data, file state, and IDs; parallelize independent reads when possible.
- After any write/update, restate what changed, where, and any validation performed.

## Workflow for Every Task

- **Start:** Read `AGENTS.md`, `project_export.json`, and `.github/copilot-instructions.md`. Note assumptions.
- **Finish:**
  - Write a brief summary of completed work and current chat context.
  - Update `project_export.json` with new context, added instructions, and current status.
- Update this file with status changes and new/recommended tasks or directives.
- If the task changes any `tex/` files or tooling config for the LaTeX build:
  - Run `latexmk -shell-escape` (using project `latexmkrc`); record warnings/errors.
- After each test/build, delete SAVE-ERROR files, temp files, and lock files (`*.lock`, `*.lck`, `*.auxlock`).
- Mark off completed TODOs; search LaTeX sources (`tex/main.tex`, `tex/chapters/`, `tex/tikz/`, `tex/templates/`) for outstanding TODOs.
- Proceed with all next recommended tasks, up to three at a time.
- Keep task lists tidy: move completed items in Lookups and Current Jobs to the bottom so active/incomplete work is easy to see.

## Memory Update Protocol

- **Trigger:** User says `Update memory: <reason>`.
- **Pre-read:** `.github/copilot-instructions.md`, `AGENTS.md`, `project_export.json`.
- **Output only:**
  1) One-sentence rationale.
  2) JSON Merge Patch (RFC 7396) for `project_export.json` in a code block labeled `json_patch`.
- Never rewrite the whole file; patch only changed leaves. Never invent sources.

## Other Instruction Sources

- `.github/copilot-instructions.md`: Repo-wide AI defaults (AGENTS remains authoritative).
- `GEMINI.md`: Gemini-specific mirror of AGENTS for that toolchain.
- `tex/chapters/TikZ/Coursebook_Ingest.md`: Chapter-specific style/content requirements when editing that material.

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
- [ ] NAVWAR PMW list with citations
- [ ] Definitions: AOR/NOR/SLR/IGT
- [ ] NWCF vs. mission-funded distinctions
- [ ] Fast Cues/Common Board Pivots refresh
- [ ] Glossary pipeline (IDs/chunking/cadence)

## Current Jobs

- [X] Review project scope; update `project_export.json` to current status
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
- [X] Move project_export.json to repo root and update references (2025-12-24)
- [X] Move project_export schema to `schemas/project_export.schema.json` and fix filename typo (2025-12-24)
- [X] Retire project_export.md after extracting remaining guidance (2025-12-24)
- [X] Optimize AGENTS.md with GPT-5.2 prompting guidance (2025-12-24)
- [X] Integrate memory_update.md into AGENTS.md and remove the file (2025-12-24)
- [X] Inventory instruction sources and account for them in AGENTS.md (2025-12-24)
- [X] Add settings_master.json and automate settings sync/merge (VS Code open + git push)
- [X] Create WSL/VS Code replication notebook with optional devcontainer scaffold (2025-12-24)
- [X] Commit devcontainer files for Ubuntu WSL replication (2025-12-24)
- [X] Sync .codex settings from WSL to Windows CLI profile (2025-12-24)
- [X] Audit shell/PowerShell script parity and tasks.json OS routing (2025-12-24)
- [X] Tidy settings_manager.py spacing (2025-12-24)
- [X] Add NDS, C2, AI, CTF, and BES acronyms (2025-12-24)
