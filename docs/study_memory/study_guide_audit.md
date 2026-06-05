# Study Guide Audit Log

Current as of 2026-06-05.

This file records readable correction and audit entries for study-guide claims,
answer keys, outdated material, and doctrine-sensitive updates. Append the
machine-readable companion record to `guide_changes.jsonl`.

## Imported From May 30 Package

The entries in this section preserve the original imported package state. Later applied closeout entries in
`Active Session Findings` supersede any `proposed` status here when they reference the same topic or ID.

### 2026-05-30 - NAVWAR / PEO C4I Products

- ID: `gc-20260530-navwar-c4i-products`
- Original claim: NAVWAR product ownership and product expansions needed correction or enrichment.
- Location: `tex/chapters/4_NAVWAR.tex`, `tex/acronyms.def`, `tex/edo.bib`
- Verdict: `Needs source`
- Corrected answer: package reports updates for PEO MLB portfolio, PMA/PMW 101 MIDS/Link 16, PMW 120/DCGS-N, PMW
  160/CANES and ADNS, afloat email path, and PMW 790/DJC2.
- Source basis: PEO C4I, PEO MLB, and PEO Digital official public sources listed in `sources.md`.
- Explanation: imported as a proposed current-checkout record because the package reports parent-session edits but this
  implementation did not verify those LaTeX diffs.
- Confidence: `Medium`
- Status: `closed by gc-20260604-navwar-c4i-products-closeout`

### 2026-05-30 - NAVSEA IWS 6.0 vs PMW 150

- ID: `gc-20260530-iws6-pmw150`
- Original claim: IWS 6.0 and PMW 150 lanes needed a clearer board-ready distinction.
- Location: `tex/chapters/3_NAVSEA.tex`, `tex/chapters/4_NAVWAR.tex`
- Verdict: `Needs source`
- Corrected answer: IWS 6.0 is combat-system C2 and CEC/sensor-netting; PMW 150 is operational/tactical C2 applications
  such as GCCS-M, MTC2, C2P, and Link 16 modernization.
- Source basis: NAVSEA PEO IWS and PEO C4I sources listed in `sources.md`.
- Explanation: imported as proposed until the current checkout and live source basis are reverified.
- Confidence: `Medium`
- Status: `closed by gc-20260604-iws6-pmw150-closeout`

### 2026-05-30 - CIVPERS Removal Routes

- ID: `gc-20260530-civpers-removal`
- Original claim: non-probationary poor-performance removal paths needed clarification.
- Location: `tex/chapters/27_CIVPERS.tex`
- Verdict: `Needs source`
- Corrected answer: Chapter 75 can be used for unacceptable performance without a PIP, but requires due process,
  preponderance of evidence, efficiency-of-service nexus, and Douglas Factor analysis; Chapter 43 requires an
  opportunity period/PIP.
- Source basis: OPM and eCFR sources listed in `sources.md`.
- Explanation: imported as proposed until the current checkout and live source basis are reverified.
- Confidence: `Medium`
- Status: `closed by gc-20260604-civpers-source-fidelity-cleanup`

### 2026-05-30 - Acronym Additions

- ID: `gc-20260530-acronyms`
- Original claim: several acronyms were missing or needed correction.
- Location: `tex/acronyms.def`
- Verdict: `Needs source`
- Corrected answer: package reports additions for WL, WS, ADNS, DCGS-N, DJC2, LNS, and ISNS.
- Source basis: package provenance and official source list in `sources.md`.
- Explanation: imported as proposed until the current checkout is verified.
- Confidence: `Medium`
- Status: `closed by gc-20260604-acronyms-closeout`

## Active Session Findings

### 2026-06-05 - Grounded Cost and Price Evaluation in Exact FAR Sections

- ID: `gc-20260605-cost-price-eval-far-source-grounding`
- Location: `tex/chapters/13C_cost-price-eval.tex`, `tex/edo.bib`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: replaced broad `FAR` citations in Chapter 13C with exact official FAR section citekeys for
  proposal analysis, field pricing assistance, prenegotiation objectives, price negotiation documentation, forward
  pricing rate agreements, cost allowability, direct costs, indirect costs, selected costs, and unallowable examples.
- Source basis: Acquisition.gov FAR 15.404-1, 15.404-2, 15.406-1, 15.406-3, 15.407-3, 31.201-2, 31.201-3, 31.201-4,
  31.202, 31.203, 31.205, 31.205-3, 31.205-8, 31.205-14, and 31.205-51 checked on 2026-06-05.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Grounded Source Selection in Official FAR / DFARS Cues

- ID: `gc-20260605-source-selection-official-source-grounding`
- Location: `tex/chapters/12A_Source_Selection.tex`, `tex/edo.bib`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: added targeted official-source support to Chapter 12A's board-facing source-selection summary,
  source-selection-plan, best-value, LPTA, tradeoff, evaluation, organization, exchange, award, and debriefing cues.
  Added granular FAR 1.602, FAR 15.101, FAR 15.101-1, FAR 15.101-2, FAR 15.303, FAR 15.304, FAR 15.305, FAR 15.306,
  FAR 15.308, FAR 15.506, DFARS 215.506, and DFARS 215.506-70 bibliography/source-ledger support while retaining the
  EDO coursebook and DoD Source Selection Procedures for classroom and DoD-process traceability.
- Source basis: Acquisition.gov FAR and DFARS section pages, DoD Source Selection Procedures PDF, and local
  source-selection citation scan checked on 2026-06-05.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Question Bank Source-Metadata Alignment

- ID: `gc-20260605-question-bank-source-metadata-alignment`
- Location: `docs/study_memory/question_bank.jsonl`, `docs/study_memory/sources.md`,
  `scripts/check-study-memory.sh`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: refreshed the remaining stale DAU APB, PMB, KPP, KSA, APA, and Net-Ready source-ledger rows to
  the current official DAU URLs and 2026-06-05 check date, then synchronized all question-bank `source_basis` entries
  from the canonical source inventory. Expanded `check-study-memory.sh` so future question-bank sources must be present
  in `sources.md` and must match the canonical title, authority level, URL/path, version/date, and checked date.
- Source basis: official DAU indexed APB, PMB, AAF program-management, KPP, KSA, APA, and Net-Ready pages checked on
  2026-06-05, the local source-ledger reconciliation scan, and successful `make check-study-memory` validation.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Summary / Quick Review Placement Guard

- ID: `gc-20260605-summary-quick-review-placement-guard`
- Location: `tex/chapters/18A_Ship_Trials.tex`,
  `tex/chapters/23_Waterfront_Organization_Work_Control_Safety.tex`,
  `tex/chapters/24_Battle_Damage_Assessment_Repair.tex`,
  `tex/chapters/25_CNO_Availability_Planning.tex`,
  `tex/chapters/appendix_cno34_day_one_message.tex`, `scripts/check-tex-structure.sh`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: moved existing coursebook cue, table, and preserved message-text sections ahead of each chapter's
  `Quick Review` closeout so the guide-wide flow now has `Summary` as the first subsection and `Quick Review` as the
  final subsection before the standalone glossary in every TeX chapter subfile. Expanded `check-tex-structure.sh` to
  enforce exactly one `Summary`, exactly one `Quick Review`, `Summary` as the first subsection, and `Quick Review` as
  the final subsection before the glossary.
- Source basis: local TeX chapter-flow placement scan across `tex/chapters/*.tex`, and successful
  `make check-tex-structure` validation with the new placement guard.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied TeX Cross-Reference Structure Guard

- ID: `gc-20260605-tex-cross-reference-structure-guard`
- Location: `scripts/check-tex-structure.sh`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: expanded the TeX structure checker so it extracts labels from both normal `\label{...}` commands
  and tabularray-style `label = {...}` declarations, detects duplicate label keys, and fails on `\ref`, `\pageref`,
  `\autoref`, `\cref`, or `\Cref` targets that do not resolve to a known label. The current checkout passes the new
  guard, converting another manual cross-reference scout into repeatable validation coverage.
- Source basis: local TeX label/reference scout across `tex/main.tex` and `tex/chapters/*.tex`, and successful
  `make check-tex-structure` validation.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Summary / Quick Review Structure Guard

- ID: `gc-20260605-summary-quick-review-structure-guard`
- Location: `scripts/check-tex-structure.sh`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: expanded the TeX structure checker so every chapter subfile under `tex/chapters` must contain
  a `Summary` subsection and a `Quick Review` subsection. The current checkout already satisfies this pattern; the
  new guard converts the previously manual flow scout into a repeatable validation check.
- Source basis: local TeX chapter flow scout, existing `check-tex-structure.sh` structural guard, and successful
  `make check-tex-structure` validation.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Imported Proposal Status Closeout

- ID: `gc-20260605-imported-proposal-status-closeout`
- Location: `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: updated the readable May 30 imported NAVWAR/C4I, IWS 6.0 vs PMW 150, and acronym records so
  their status lines point to the June 4 applied closeout records that already verified and closed those topics. The
  append-only `guide_changes.jsonl` historical proposed records remain unchanged; the current applied closeout records
  remain the authoritative current state.
- Source basis: local audit-log consistency review against `gc-20260604-navwar-c4i-products-closeout`,
  `gc-20260604-iws6-pmw150-closeout`, and `gc-20260604-acronyms-closeout`.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Active-Citation Backlog Access-Caveat Alignment

- ID: `gc-20260605-active-citation-backlog-access-caveat-alignment`
- Location: `tex/edo.bib`, `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: cleared the remaining active-citation metadata backlog by refreshing the DAU Performance
  Attributes access date to 2026-06-05 and aligning retained access-limited NAVSEA/NDE sources to their current
  2026-06-05 public-access check date. For NAVSEA Source Selection Guide, NAVSEA Contracts Handbook, and
  SL720-AA-MAN-030, the bibliography/source ledger now explicitly distinguishes the retained official URL and current
  public 403 result from the older content-bearing/manual baseline that should still be manually verified before
  operational use.
- Source basis: official DAU Performance Attributes indexed page; current public HTTP checks of the DAU, NAVSEA
  SEA 02 PDF, and NDE URLs; existing SOM Chapter 3 statement that NAVSEA Contracts Handbook access may require Navy
  network or restricted access; local active-citation metadata scan.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied OPNAV Instruction Source-Alignment Cleanup

- ID: `gc-20260605-opnav-instruction-source-alignment`
- Location: `tex/edo.bib`, `tex/chapters/6_PPBE.tex`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: refreshed active OPNAVINST 3050.27A, 4700.7N, and 5420.117A bibliography/source-ledger
  metadata to official DONI listing/search evidence checked on 2026-06-05; corrected 3050.27A's effective date
  and title to Battle Force Structure Assessments; expanded 5420.117A's title to Resources and Requirements
  Review Board and Naval Capabilities Board; and removed OPNAVINST 3111.17C from Chapter 6 PPBE citations because
  DONI identifies it as Strategic Laydown and Dispersal Plan guidance, not the N8/N81 assessment or N9 governance
  source the chapter needed.
- Source basis: official DONI listing/search records for OPNAVINST 3050.27A, OPNAVINST 3111.17C, OPNAVINST
  4700.7N, and OPNAVINST 5420.117A; current-tool direct raw PDF checks returned request-filtered HTML, so the
  source ledger keeps an access-mode caveat.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Active-Citation Metadata Audit Helper

- ID: `gc-20260605-active-citation-metadata-audit-helper`
- Location: `scripts/audit-active-citation-sources.py`, `Makefile`, `AGENTS.md`, `README.md`,
  `docs/study_memory/README.md`, `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: added a report-only `make audit-active-citation-sources` helper that reads the latest
  `artifacts/build/main.bcf`, loads the configured BibTeX files, and reports URL-backed citekeys active in the built
  guide with stale access dates, missing access dates, or overly generic source URLs. The helper defaults to the first
  day of the current month as the minimum access-date threshold and supports `--strict` for future use once the
  weak-source backlog is ready to become a gate. Updated repository and study-memory instructions so the workflow does
  not rely on ad hoc Python snippets.
- Source basis: local repeated active-citation metadata scan pattern, existing source-ledger audit helper patterns, and
  local validation of the new report-only target.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Source Selection and IWS X Citation Date Alignment

- ID: `gc-20260605-source-selection-iwsx-access-date-alignment`
- Location: `tex/edo.bib`, `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: refreshed the active `DoD-Source-Selection-Procedures-2022` BibTeX access date and matching
  source-ledger check date to 2026-06-05 after a successful HTTP 200 retrieval of the official DoD PDF. Refreshed the
  active `navsea-peo-iws-x-overview-2022` BibTeX access date and source-ledger check date to 2026-06-05 after
  browser-open verification of the official NAVSEA public-release PDF; retained a note that command-line checks still
  returned 403. No board-facing source-selection or IWS prose changed.
- Source basis: official DoD Source Selection Procedures PDF; official NAVSEA PEO IWS X Program Overview and ICS
  Development PDF; local active-citation metadata scan.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied WAS Memo and NSCF Citation Source Refresh

- ID: `gc-20260605-was-memo-nscf-citation-refresh`
- Location: `tex/edo.bib`, `tex/chapters/appendix_current_events.tex`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: replaced active WAS transformation, Joint Requirements reform, and arms-transfer memo BibTeX
  URLs with official Defense Media PDF URLs and refreshed their access dates to 2026-06-05. Added an exact
  `10 U.S.C. 149` citation and source-ledger row for the National Security Capital Forum statutory creation and chair
  language, retained the local NSCF memo mirror as a dated implementation cue, and widened the current-events NSCF
  citation to include both the statute and memo.
- Source basis: official Defense Media PDFs for the 7 Nov 2025 WAS, Joint Requirements reform, and arms-transfer
  memoranda; official U.S. Code 10 U.S.C. 149 page showing text in effect on 2026-06-04; local active-citation metadata
  scan.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Historical Acquisition Statute Name Cleanup

- ID: `gc-20260605-historical-acquisition-statute-name-cleanup`
- Location: `tex/chapters/15_policy.tex`, `tex/edo.bib`, `docs/study_memory/sources.md`
- Verdict: `Applied`
- Correction applied: corrected Chapter 15's historical acquisition-law list so the 1985 procurement statute is
  identified as the Defense Procurement Improvement Act of 1985, and Goldwater-Nichols is identified by its official
  Goldwater-Nichols Department of Defense Reorganization Act of 1986 short title. Added exact BibTeX and source-ledger
  support for the 1985 statute note. This prevents current DoW naming conventions from being back-applied to historical
  statute short titles.
- Source basis: official U.S. Code historical note for 10 U.S.C. 2302 and GovInfo Statutes at Large source for Public
  Law 99-433.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Contracting Summary Flow Cleanup

- ID: `gc-20260605-contracting-summary-flow-cleanup`
- Location: `tex/chapters/12_Solicitation.tex`, `tex/chapters/12A_Source_Selection.tex`
- Verdict: `Applied`
- Correction applied: moved the existing Chapter 12 Solicitation and Chapter 12A Source Selection Summary blocks from
  late-chapter positions to the first-screen position directly under each chapter's main section heading. This aligns
  those chapters with the rest of the guide's Summary / Quick Review flow pattern without changing board-facing facts,
  citations, or Quick Review content.
- Source basis: local TeX structure and flow audit across active chapter Summary / Quick Review placement.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied PAE Chart Connector Clearance Follow-Up

- ID: `gc-20260605-pae-chart-connector-clearance-followup`
- Location: `tex/chapters/1_Chain_of_command.tex`, `artifacts/out/main.pdf`
- Verdict: `Applied`
- Correction applied: rerouted Figure 1.4 so the ASN(RD&A) / PAE connector bus sits above the top PAE row, the
  Principal Civilian Deputy and PMILDEP lines drop into that external bus, the top-row PAE arrows terminate at node
  border anchors, and the SYSCOM support rail sits farther left of the fitted PAE group. Rebuilt and visually checked
  the rendered PDF page to confirm connector lines no longer run through the PAE boxes or labels.
- Source basis: local TikZ source inspection, Docker PDF rebuild, rendered Figure 1.4 page inspection, TeX structure
  check, whitespace check, and build-log warning scan.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Ethics and Acquisition OIG Source Grounding

- ID: `gc-20260605-ethics-acquisition-oig-source-grounding`
- Location: `tex/chapters/27B_Ethics_and_Acquisition.tex`, `tex/edo.bib`,
  `docs/study_memory/sources.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: Chapter 27B's ethics/acquisition chapter already had official FAR support for procurement
  integrity and OCI, but its senior-official-misconduct discussion was coursebook-only. Added official DoW OIG
  Administrative Investigations, DoW OIG Administrative Investigations Manual, and latest DoW OIG Semiannual Report
  support for the senior-official misconduct, reprisal, restriction, Hotline, Contractor Disclosure, and escalation cues
  while preserving the coursebook decision-model and acquisition-stakeholder structure.
- Source basis: current DoW OIG Administrative Investigations page; 2025-08-28 ODIG Administrative Investigations
  Manual; DoW OIG Semiannual Report to the Congress for 2025-10-01 through 2026-03-31; existing SOCO/JER and FAR source
  entries.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Core Acquisition Source-Metadata Refresh

- ID: `gc-20260605-core-acquisition-source-metadata`
- Location: `tex/edo.bib`, `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: rechecked heavily cited acquisition-governance anchors and aligned source metadata for
  SECNAVINST 5000.2G, DoDI 5000.85, CJCSM 5123.01, and DFARS. Added an explicit DFARS landing-page row to the source
  inventory and refreshed the matching BibTeX access dates. No board-facing doctrine prose changed.
- Source basis: official Acquisition.gov DFARS page, official ESD DoDI 5000.85 PDF, official Joint Staff CJCSM 5123.01
  PDF, and DONI/search evidence for active SECNAVINST 5000.2G.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Statutory Citation Source-Fidelity and OT Authority Correction

- ID: `gc-20260605-statutory-ot-source-fidelity`
- Location: `tex/chapters/6_PPBE.tex`, `tex/chapters/12_Solicitation.tex`,
  `tex/chapters/12A_Source_Selection.tex`, `tex/chapters/15_policy.tex`,
  `tex/chapters/29_Board_Assumptions_and_Fast_Cues.tex`, `tex/chapters/appendix_key_roles.tex`, `tex/edo.bib`,
  `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: cited-source audit found generic U.S. Code URLs and a substantive OT statute drift. Updated
  10 U.S.C. 4021 from prototype OT shorthand to current research-project OT authority and 10 U.S.C. 4022 to the
  prototype-project / follow-on production authority. Replaced the obsolete CAPE key for 10 U.S.C. 139c with current
  10 U.S.C. 139a, refreshed exact U.S. Code URLs for 10 U.S.C. 181, 139a, 2208, 3201, 4021, and 4022, and added
  missing source-ledger rows for the corrected statute anchors.
- Source basis: current uscode.house.gov pages for 10 U.S.C. 181, 139a, 2208, 3201, 4021, and 4022.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied CNO34 Current C-Notes Overlay

- ID: `gc-20260605-cno34-current-cnotes-overlay`
- Location: `tex/chapters/appendix_cno34_day_one_message.tex`, `tex/edo.bib`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: official-source audit found that the CNO34 appendix preserved the initial C-Notes and Charge of
  Command texts but did not flag later official CNO products. Added a sourced current-series overlay noting that the
  official CNO page now lists C-Notes #4 through #8 and U.S. Navy Fighting Instructions. Added bibliography and
  source-ledger entries for the CNO landing page, each later C-Note display page, and Fighting Instructions.
- Source basis: official Navy Chief of Naval Operations page; official Navy C-Notes display pages for C-Note #4, C-Note
  #5, C-Note #6, CNOte #7, CNOte #8, and U.S. Navy Fighting Instructions.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied CNO34 C-Notes Citation URL Backfill

- ID: `gc-20260605-cno34-cnotes-url-backfill`
- Location: `tex/edo.bib`, `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: local cited-BibTeX URL audit found that the CNO34 C-Notes appendix cited C-Note #1, C-Note #2,
  C-Note #3, and Charge of Command bibliography entries that had NAVADMIN-style descriptions but no URLs. The entries
  now point to the official Navy C-Notes display pages, use the displayed Navy page dates, and carry 2026-06-05 access
  dates. Exact source-ledger rows were added for each page.
- Source basis: official Navy C-Notes display pages for C-Note #1 Sailors First, C-Note #2 Foundry Always, C-Note #3
  World Class Fleet, and CNO 34 Charge of Command; MyNavyHR NAVADMIN search results for NAVADMIN 241/25 and 225/25
  corroborated the message numbers for the latter two.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied NAVPLAN 2024 and CNO34 Strategy Cue Alignment

- ID: `gc-20260605-navplan-cno34-strategy-cue`
- Location: `tex/chapters/appendix_current_events.tex`, `tex/chapters/15_policy.tex`, `tex/edo.bib`,
  `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: changed the current-events and acquisition-policy board cues so NAVPLAN 2024 is treated as the
  current published CNO navigation-plan update to the 2022 NAVPLAN, while CNO34's Foundry--Fleet--Fight message is used
  as the current Navy-leadership cue. NAVPLAN 2022 and Force Design 2045 remain as legacy context rather than the
  current strategy answer.
- Source basis: official Navy NAVPLAN 2024 resource page and release page; official CNO34 Day One message; official
  2025 NSS; official 2026 NDS; DON FY27 budget request; official WAS/RFO and PAE sources; and local source-ledger
  inspection.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Strategy and NAVWAR Currentness Refresh

- ID: `gc-20260605-strategy-navwar-currentness-refresh`
- Location: `tex/chapters/1_Chain_of_command.tex`, `tex/chapters/4_NAVWAR.tex`, `tex/edo.bib`,
  `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: rechecked the active Chapter 1 \ac{nss}/\ac{nds} baseline and Chapter 4 NAVWAR/PEO portfolio
  currentness statements against official public sources. Existing wording remains supported, so this slice advanced the
  active TeX currentness lines plus the matching BibTeX/source-ledger access dates to 2026-06-05.
- Source basis: official White House NSS PDF; official Department of War NDS PDF; NAVWAR About page; PEO C4I
  program-office page and PMA/PMW 101, PMW 120, PMW 150, PMW 160, PMW/A 170, and PMW 790 information sheets;
  PEO Digital portfolio overview; PEO MLB portfolio book; and local source-ledger inspection.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied T&E Policy Currentness Refresh

- ID: `gc-20260605-te-policy-currentness-refresh`
- Location: `tex/chapters/18B_test-eval.tex`, `tex/edo.bib`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: rechecked Chapter 18B's current official T&E overlay against DoDI 5000.98, DoDM 5000.100,
  DoDM 5000.103, and 10 U.S.C. 4171. Existing chapter wording remains supported, so this slice refreshed only the
  active chapter currentness line and matching BibTeX/source-ledger access dates to 2026-06-05.
- Source basis: official ESD PDFs for DoDI 5000.98, DoDM 5000.100, and DoDM 5000.103; current uscode.house.gov
  page for 10 U.S.C. 4171; and local source-ledger inspection.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Finance, Cost, EVM, and T&E Flow Standardization

- ID: `gc-20260605-finance-cost-evm-te-flow-standardization`
- Location: `tex/chapters/6_PPBE.tex`, `tex/chapters/9_Program_Funding_and_Execution.tex`,
  `tex/chapters/10_Cost_Fundamentals.tex`, `tex/chapters/14_EVM.tex`, `tex/chapters/18B_test-eval.tex`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: added first-screen Summary blocks and end-of-chapter Quick Review blocks to PPBE, Program Funding
  and Execution, Cost Estimating, and EVM; converted the Test and Evaluation `Board Prep Summary` heading to the
  standard `Summary` heading; and preserved existing cited doctrine and official-source anchors while turning loose
  board cues into consistent board-speed recall prompts.
- Source basis: existing coursebook and official-source citations already present in each chapter, plus local structure,
  acronym, and whitespace validation.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied PAE Source-Ledger and Currentness Alignment

- ID: `gc-20260605-pae-source-ledger-currentness`
- Location: `tex/edo.bib`, `tex/chapters/1_Chain_of_command.tex`, `tex/chapters/3_NAVSEA.tex`,
  `tex/chapters/appendix_edo_flags.tex`, `tex/chapters/appendix_key_roles.tex`,
  `tex/chapters/appendix_pae_construct_mapping.tex`,
  `docs/study_memory/sources.md`, `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: refreshed the PAE source-access dates and the PAE-specific "current as of" stamps from the
  2026-06-05 official-source check; expanded the PAE / ASN(RD&A) source ledger to include the official DON PAE
  establishment and expansion releases, Mahan service-acquisition-executive announcement, PAE Aviation, PAE Mission
  Systems, PAE Munitions, PAE Marine Corps, PAE Maritime, DON shipbuilding plan, MUSV marketplace, SASC RAS, and SSP
  transition sources; updated the PAE Maritime ledger row to include Melissa Kirkendall, CAPT Cedric McNeal, and RDML
  Andrew Biehn deputy lanes; removed an uncited stale `navsea_warfare_centers` BibTeX key with a misspelled title/URL;
  removed an unused DVIDS PAE Mission Systems unit-page key now superseded by the official DON/NAVWAR launch release;
  and normalized leading whitespace on the PAE BibTeX records.
- Source basis: official DON PAE establishment release; official DON May 2026 PAE expansion release; official DON
  service acquisition executive announcement; official NAVAIR PAE Aviation release; official NAVWAR PAE Mission Systems
  release; official DON PAE Munitions story; official PAE Marine Corps About / Organization pages and establishment
  article; official PAE Maritime page; official DON May 2026 shipbuilding plan; official DON MUSV marketplace release;
  official SASC MUSV hearing page; and official SSP leadership / Williams promotion sources, all checked on
  2026-06-05. The June 2026 MyNavyHR flag roster and NAVSEA command leadership chart were not re-dated in this slice
  because they were not re-verified in the 2026-06-05 live-source pass; the EDO flag appendix now states that split
  source-date caveat explicitly.
- Validation: `make check-markdown`, `make check-study-memory`, `make check-current-events-sources`,
  `make check-acronyms`, `make check-tex-structure`, JSONL parse, BibTeX duplicate-key scan, `git diff --check`, and
  `./scripts/docker-build.sh --quiet tex/main.tex` passed on 2026-06-05. The fresh `artifacts/build/main.log` ends with
  `Output written on main.pdf (434 pages, 13689733 bytes)`, and the `main.log` / `main.blg` warning scan found no
  unresolved citation, biblatex, LaTeX warning, overfull/underfull, error, or missing-character hits.
- Confidence: `High`
- Status: `applied`

### 2026-05-31 - CIVPERS Chapter 43 / Chapter 75 Standards

- ID: `gc-20260531-civpers-ch43-ch75-standards`
- Original claim: In `tex/chapters/27_CIVPERS.tex`, the performance-vs-conduct comparison table lists unacceptable
  performance with a `Substantial evidence` proof standard while the same row also notes that unacceptable performance
  may proceed through either Chapter 43 PIP procedures or a current Chapter 75 unacceptable-performance removal process.
- Location: `tex/chapters/27_CIVPERS.tex`, table `tab:performance_conduct_comparison`
- Verdict: `Ambiguous`
- Corrected answer: Chapter 43 unacceptable-performance actions require an opportunity period/PIP and use the
  substantial-evidence standard on appeal; Chapter 75 adverse actions for unacceptable performance do not require a PIP
  but require efficiency-of-service nexus, preponderance of evidence, due process, and Douglas Factor penalty analysis.
- Source basis: 5 U.S.C. 4303, 5 U.S.C. 7513, 5 U.S.C. 7701, 5 CFR parts 432 and 752, OPM performance-management
  guidance, MSPB performance-based-action material, DoDI 1400.25 Volume 431, and the September 30, 2025 Under Secretary
  of War Personnel and Readiness memo listed in `sources.md`.
- Explanation: The guide paragraph below the table is directionally correct, but the table can be read as assigning the
  Chapter 43 proof standard to all unacceptable-performance routes, including Chapter 75. This should remain a proposed
  guide clarification until the user explicitly agrees to edit the LaTeX source.
- Confidence: `High`
- Status:
  `closed by gc-20260531-civpers-ch43-ch75-standards-closeout; rechecked by gc-20260604-civpers-source-fidelity-cleanup`

### 2026-05-31 - Applied CIVPERS Chapter 43 / Chapter 75 Clarification

- IDs: `gc-20260530-civpers-removal`, `gc-20260531-civpers-ch43-ch75-standards`
- Location: `tex/chapters/27_CIVPERS.tex`, table `tab:performance_conduct_comparison` and paragraph
  `Handling unacceptable performance`
- Verdict: `Ambiguous`
- Correction applied: clarified that Chapter 43 uses an opportunity period/\ac{pip}-style route and substantial-evidence
  review, while Chapter 75 unacceptable-performance removals do not require a \ac{pip} but require preponderance,
  efficiency-of-service nexus, due process, and Douglas Factor penalty analysis.
- Source basis: 5 U.S.C. 4303, 5 U.S.C. 7513, 5 U.S.C. 7701, 5 CFR parts 432 and 752, OPM/MSPB comparison material, DoDI
  1400.25 Volume 431, and the September 30, 2025 Under Secretary of War Personnel and Readiness memo listed in
  `sources.md`.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied PPBE and NWCF Finance Source/Flow Follow-Up

- ID: `gc-20260605-ppbe-nwcf-finance-source-flow`
- Location: `tex/chapters/6_PPBE.tex`, `tex/chapters/7_NWCF.tex`, `tex/edo.bib`,
  `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: replaced the generic PPBE scale statement with the current FY 2026 DoD budget-request top line
  and caveated that live budget figures must be source-checked before quoting. Added official FMR 11A/11B and
  10 U.S.C. 2208 support to the field-activity financial-management chapter; tightened the General Fund versus NWCF
  board distinction; grounded stabilized-rate, NOR/AOR, carryover, Economy Act work-request, and project-order cues; and
  added Chapter 7 summary and quick-review blocks for board-speed recall.
- Source basis: FY 2026 Defense Budget Overview; DoD FMR 7000.14-R Volume 11A Chapters 2 and 3; DoD FMR 7000.14-R
  Volume 11B Chapters 1, 2, 3, 11, and 12; 10 U.S.C. 2208; and existing coursebook references, all checked from official
  or primary web sources on 2026-06-05.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied CPI Chapter Structure Follow-Up

- ID: `gc-20260605-cpi-structure-flow`
- Location: `tex/chapters/17N_Continuous_Process_Improvement.tex`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: normalized the standalone subfile wrapper for the Continuous Process Improvement chapter, added an
  upfront Summary block for Lean, Theory of Constraints, Six Sigma, and board-answer framing, and converted the loose
  closing board cue into a Quick Review section for board-speed recall.
- Source basis: EDO School coursebook module `edo-3-7-3-intro-cpi-2025` and local structure validation.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Repaired ASN(RD&A)/PAE Figure Connector Clearance

- ID: `gc-20260605-pae-chart-whitespace-routing`
- Location: `tex/chapters/1_Chain_of_command.tex`, `artifacts/out/main.pdf`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: rerouted Figure 1.4 connector geometry into explicit whitespace lanes. Deputy arrows now start
  from ASN(RD&A) bottom-edge ports and terminate above the deputy boxes, the PAE portfolio bus runs above the first PAE
  row with arrows stopping above node borders, the SYSCOM support cue stops outside the PAE group, and all node fills
  are explicitly opaque so background connectors cannot show through boxes.
- Source basis: user-reported rendered-PDF defect in the 2026-06-05 screenshot and local rendered-page verification from
  `artifacts/out/main.pdf` page 16.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied NAVWAR / PEO C4I Product Closeout

- ID: `gc-20260604-navwar-c4i-products-closeout`
- Closes ID: `gc-20260530-navwar-c4i-products`
- Location: `tex/chapters/4_NAVWAR.tex`, `tex/acronyms.def`, `tex/edo.bib`, `docs/study_memory/sources.md`
- Verdict: `Applied`
- Correction applied: verified the PMA/PMW 101, PMW 120, PMW 150, PMW 160, PMW/A 170, PMW 790, PEO Digital, and PEO MLB
  current-source mappings in the checkout; aligned the PEO C4I overview sentence to the current eleven-office public
  structure, including PMA/PMW 101; and retained board cues that distinguish program offices, products, and status cues.
- Source basis: PEO C4I Program Offices page, PMW 120/150/160/170/790 tear sheets, PMA/PMW 101 MIDS tear sheet, PEO MLB
  Portfolio Book, PEO Digital Portfolio Overview, and NAVAIR PMA/PMW 101 and PMW/A 170 pages listed in `sources.md`.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied NAVSEA IWS 6.0 vs PMW 150 Clarification

- ID: `gc-20260604-iws6-pmw150-closeout`
- Closes ID: `gc-20260530-iws6-pmw150`
- Location: `tex/chapters/3_NAVSEA.tex`, `tex/chapters/4_NAVWAR.tex`, `tex/edo.bib`,
  `docs/study_memory/sources.md`
- Verdict: `Applied`
- Correction applied: retained IWS 6.0 as the combat-system command-and-control and CEC/sensor-netting lane; added a PMW
  150 board cue for GCCS-M, MTC2, C2P, Link 16 Network, and LMMT; and clarified that PMA/PMW 101 remains the MIDS/Link
  16 terminal and waveform lane.
- Source basis: NAVSEA About PEO IWS, NAVSEA PEO IWS Industry Engagement, NAVSEA Cooperative Engagement Capability
  article, PEO C4I Program Offices page, PMW 150 FY26 tear sheet, and PMA/PMW 101 MIDS tear sheet listed in
  `sources.md`.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied Acronym Additions Closeout

- ID: `gc-20260604-acronyms-closeout`
- Closes ID: `gc-20260530-acronyms`
- Location: `tex/acronyms.def`, `tex/chapters/4_NAVWAR.tex`, `tex/chapters/27_CIVPERS.tex`
- Verdict: `Applied`
- Correction applied: verified definitions and guide usage for ADNS, DCGS-N, DJC2, LNS, ISNS, WL, and WS. The NAVWAR
  chapter uses the NAVWAR/C4I acronyms and the Civilian Personnel chapter uses WL/WS; `make check-acronyms` passes.
- Source basis: local acronym-definition verification plus the NAVWAR, PEO C4I, and civilian-personnel source records
  listed in `sources.md`.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied Current Organization and Fleet-Maintenance Source Drift

- ID: `gc-20260604-current-org-fleet-maint-source-drift`
- Location: `tex/chapters/1_Chain_of_command.tex`, `tex/chapters/appendix_pae_construct_mapping.tex`,
  `tex/chapters/appendix_edo_flags.tex`, `tex/chapters/19_Fleet_Maintenance_Assets.tex`,
  `tex/chapters/28_AWP_and_SOVT.tex`, `tex/edo.bib`, `docs/reference/2026-06-02-additional-info-study-material.md`,
  `docs/study_memory/sources.md`
- Verdict: `Applied`
- Correction applied: corrected the 1949 National Military Establishment rename to Department of Defense; replaced the
  source-limited PAE RAS leader cue with Rebecca J. Gassler, SES; preserved the SSP Wolfe/Williams transition as a
  public-source conflict rather than a completed handoff; corrected the CNRMC RMC list to MARMC, SERMC, SWRMC, FDRMC,
  and SRF-JRMC with RMC Northwest and Hawaii RMC treated as separately coordinated embedded I-level activities in both
  the TeX chapter and reference study-material file; and refreshed the JFMM Rev E source path/date to the SUBMEPP
  landing page.
- Source basis: DoW Historic Highlights, SASC maritime unmanned surface vessels hearing page and transcript, SSP
  leadership page, Navy SSP Williams promotion announcement, NAVSEA CNRMC About Us, and NAVSEA SUBMEPP JFMM records
  listed in `sources.md`.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied Source Inventory Freshness Cleanup

- ID: `gc-20260604-source-inventory-freshness-cleanup`
- Location: `docs/study_memory/sources.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: updated the source inventory freshness date to 2026-06-04 and added explicit rows for the current
  official sources used by the organization, RMC, JFMM, and historical-renaming corrections. Historical proposed JSONL
  entries are preserved as append-only inputs; newer closeout IDs record the applied state.
- Source basis: local study-memory audit plus the current official source rows listed in `sources.md`.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied Strategy Baseline and Flow Cleanup

- ID: `gc-20260604-strategy-baseline-flow-cleanup`
- Location: `tex/main.tex`, `tex/chapters/1_Chain_of_command.tex`, `tex/chapters/17K_jcids.tex`,
  `tex/chapters/28_AWP_and_SOVT.tex`, `tex/edo.bib`, `docs/study_memory/sources.md`
- Verdict: `Applied`
- Correction applied: updated Chapter 1 from the 2022 NSS/NDS baseline to the current Nov 2025 NSS and Jan 2026 NDS
  baseline; renamed the broad root chapter from `Requirements` to `Requirements, Engineering, and Test`; moved the
  legacy-JCIDS coursebook cue before the JCIDS quick review and before the subfile glossary block; and reduced the short
  AWP/SOVT addendum to one section with subsections so it no longer adds disproportionate top-level ToC weight.
- Source basis: 2025 National Security Strategy and 2026 National Defense Strategy records listed in `sources.md`, plus
  local structure/flow review of `tex/main.tex`, `17K_jcids.tex`, and `28_AWP_and_SOVT.tex`.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied Shipbuilding Current-Events Official-Source Hardening

- ID: `gc-20260604-current-events-official-source-hardening`
- Location: `tex/chapters/appendix_current_events.tex`, `tex/current_events.bib`,
  `docs/study_memory/sources.md`
- Verdict: `Applied`
- Correction applied: replaced third-party-supported current-event paragraphs for Columbia-class delay, amphibious block
  buy, and SIOP status with wording grounded in official CRS, GAO, DoW, and NAVFAC sources. Removed the unsupported
  Columbia 60 percent complete point, replaced the amphibious nearly
  $1B savings claim with the CRS-supported about $914M estimate, and reframed SIOP annual-escalation and
  maintenance-reduction point estimates as unsupported by the official source set checked in this slice.
- Source basis: CRS R41129, GAO-24-107732, DoW Contracts for Sept. 24 2024, CRS R43543, GAO-25-106728, NAVFAC PEO
  Industrial Infrastructure SIOP, NAVFAC PSNS Dry Dock 4 seismic-upgrade release, and GAO-23-106067 records listed in
  `sources.md`.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied SIOP Current-Status Source Refresh

- ID: `gc-20260605-siop-current-status-source-refresh`
- Location: `tex/chapters/appendix_current_events.tex`, `tex/current_events.bib`,
  `docs/study_memory/sources.md`
- Verdict: `Applied`
- Correction applied: refreshed the current-events source metadata for CRS R41129 and CRS R43543 to the live
  Congress.gov product dates checked on 2026-06-05, moved the SIOP bibliography and source-ledger basis from the older
  PEO Industrial Infrastructure path to NAVFAC's current PEO Infrastructure and Expeditionary page, and added the
  7 May 2026 NAVFAC SIOP status story. The SIOP board answer now reflects PEO IE / PMO 555 current reporting,
  30-year / 400-plus project scope, completed facilities and industrial-plant-equipment progress, and around $7B under
  contract while retaining the GAO caveat that the old 20-year / $21B figure is only an early baseline.
- Source basis: CRS R41129 current product page, CRS R43543 current product page, NAVFAC PEO Infrastructure and
  Expeditionary page, NAVFAC 7 May 2026 SIOP program-manager transition/status story, NAVFAC 2 Sep 2025 PSNS Dry Dock
  4 seismic-upgrade release, and GAO-23-106067 records listed in `sources.md`.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Current-Events Source-Ledger Guard

- ID: `gc-20260605-current-events-source-ledger-guard`
- Location: `Makefile`, `scripts/check-current-events-sources.py`, `AGENTS.md`, `README.md`,
  `docs/study_memory/README.md`, `docs/study_memory/memory_index.md`
- Verdict: `Applied`
- Correction applied: added a repo-local checker that validates `tex/current_events.bib` source entries are cited by the
  guide and that each current-events URL is represented in `docs/study_memory/sources.md`. Wired the checker into
  `make check-study-memory` and exposed a direct `make check-current-events-sources` target so current-events
  source-currentness slices fail fast when BibTeX and source-ledger records drift apart.
- Source basis: local validation workflow review after the SIOP current-status refresh found that the standard checks
  did not compare `tex/current_events.bib` to the study-memory source inventory.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Markdown Validation Formatting Cleanup

- ID: `gc-20260605-markdown-validation-formatting-cleanup`
- Location: `docs/study_memory/weak_areas.md`,
  `docs/EDO_Study_Guide_Chat_Session_Package_2026-05-30/source_notes.md`,
  `docs/reference/2026-06-02-additional-info-study-material.md`
- Verdict: `Applied`
- Correction applied: mechanically wrapped long Markdown lines and aligned Markdown tables with `rumdl fmt` so the
  repository-wide `make check-markdown` target passes. This was a formatting-only cleanup; no doctrine, source,
  board-answer, or current-fact content was intentionally changed.
- Source basis: local Markdown validation output from `make check-markdown`, followed by `rumdl fmt` on the three
  failing files and a passing rerun of `make check-markdown`.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied Flow, Study-Memory, and PAE Chart Closeout

- ID: `gc-20260604-flow-study-memory-chart-closeout`
- Location: `tex/chapters/1_Chain_of_command.tex`, `tex/chapters/16_Milestones.tex`,
  `tex/chapters/28_AWP_and_SOVT.tex`, `tex/chapters/29_Board_Assumptions_and_Fast_Cues.tex`,
  `docs/study_memory/weak_areas.md`, `docs/study_memory/weak_areas.jsonl`,
  `docs/study_memory/question_bank.jsonl`, `artifacts/out/main.pdf`
- Verdict: `Applied`
- Correction applied: moved the Milestones lifecycle-entry scenario cue before the subfile glossary block; added
  AWP/SOVT quick-review prompts; broadened Board Fast Cues with rotating weak-area cues for requirements/acquisition
  flow, APB/PMB, technical-review baselines, KPP/KSA/APA test evidence, C4I product ownership, and maintenance closeout;
  restored the missing Q18 Net-Ready question-bank entry; refreshed weak-area severity/next-review state after June 4
  guide closeouts; and rerouted the ASN(RD&A)/PAE TikZ chart connectors so the rendered lines no longer overlap the PAE
  boxes or labels.
- Source basis: local flow review of the affected TeX chapters, study-memory session and learning-log evidence for Q18
  and weak-area state, current guide source records cited by the affected prompts, and rendered-PDF inspection of Figure
  1.4.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied Standalone Chapter Flow Cleanup

- ID: `gc-20260604-standalone-chapter-flow-cleanup`
- Location: `tex/chapters/27_CIVPERS.tex`, `tex/chapters/28_AWP_and_SOVT.tex`
- Verdict: `Applied`
- Correction applied: moved the CIVPERS applied-rules cue and scenario tables before the standalone acronym glossary
  block so standalone chapter builds keep all study content before backmatter; corrected the AWP/SOVT standalone chapter
  title from the generic study-guide title to the actual topic; and added the standard standalone acronym glossary block
  to the AWP/SOVT chapter.
- Source basis: read-only TeX structure/format review and local source inspection.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied Consistency and Source-Integrity Cleanup

- ID: `gc-20260604-consistency-source-integrity-cleanup`
- Location: `tex/acronyms.def`, `tex/chapters/4_NAVWAR.tex`, `tex/chapters/18B_test-eval.tex`,
  `docs/study_memory/guide_changes.jsonl`, `docs/study_memory/study_guide_audit.md`
- Verdict: `Applied`
- Correction applied: changed the SOVT acronym expansion to System Operational Verification Test to match the AWP/SOVT
  chapter and NAVSEA TS usage; corrected a T&E organization chart typo from DASW(T&E) to DASD(T&E); moved the NAVWAR
  Fleet Readiness Directorate cue before the standalone glossary block; replaced stale `8_Civilian_Personnel.tex`
  audit-trail paths with `27_CIVPERS.tex`; and made older CIVPERS applied guide-change records unique closeout IDs with
  `closes_id` links so parsers do not see duplicate machine keys.
- Source basis: read-only cross-chapter consistency review, read-only source-integrity review, local file inspection,
  and the official NAVSEA TS9090-310G public PDF for SOVT expansion.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied Current-Events, JFRP, LFT&E, and NAVWAR Source-Grounding Cleanup

- ID: `gc-20260604-current-events-jfrp-lfte-navwar-source-cleanup`
- Location: `tex/chapters/appendix_current_events.tex`, `tex/chapters/18B_test-eval.tex`,
  `tex/chapters/4_NAVWAR.tex`, `docs/study_memory/memory_index.md`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`
- Verdict: `Applied`
- Correction applied: clarified that Capability Portfolio Management, Capability Trade Councils, and portfolio
  scorecards are DoW/DON acquisition-portfolio reform mechanisms, while the Joint Staff requirements-process
  replacement for legacy JCIDS is JFRP; corrected the Project Overmatch leadership cue so Capt. Remil Capili remains
  the PM cue and VADM Seiko Okano is PMILDEP/steering chair; moved LFT&E subsection citations from DoDI 5000.89 to
  Title 10 section 4172 plus DoDI 5000.98; removed unsupported NAVWAR quantitative SLOC-growth and DevSecOps
  transformation claims; refreshed `memory_index.md` to the June 4 audit state; and added current source-inventory
  rows for the acquisition/JFRP distinction and Project Overmatch cue.
- Source basis: CJCSM 5123.01 JFRP source, Acquisition Transformation Strategy, SecWar Joint Requirements Reform memo
  local official-memo mirror, Project Overmatch Five Eyes Project Arrangement public release, PMW 120/160 official tear
  sheets, DoDI 5000.98, and 10 U.S.C. 4172 records listed in `sources.md` and `tex/edo.bib`.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied Contract Pricing Threshold and Maintenance Flow Cleanup

- ID: `gc-20260604-contract-pricing-maintenance-flow-cleanup`
- Location: `tex/chapters/13C_cost-price-eval.tex`, `tex/chapters/appendix_current_events.tex`, `tex/edo.bib`,
  `tex/chapters/23_Waterfront_Organization_Work_Control_Safety.tex`,
  `tex/chapters/24_Battle_Damage_Assessment_Repair.tex`,
  `tex/chapters/25_CNO_Availability_Planning.tex`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: updated the certified cost/pricing data threshold cue from legacy `$2M` coursebook-only
  wording to the current DoD Part 215 deviation: `$2.5M` for prime contracts awarded on or before 2026-06-30
  and `$10M` for prime contracts awarded after 2026-06-30, unless a FAR/DFARS exception applies or an on-or-before
  2026-06-30 contract states a different threshold. Clarified the DCAA audit-assistance cue versus broader
  field-pricing support cues and aligned the current-events threshold-change cue to the same source. Added the official
  Part 215 class-deviation source to `tex/edo.bib` and `sources.md`. Moved maintenance coursebook-cue content in
  Chapters 23, 24, and 25 before the standalone acronym glossary blocks so standalone builds keep study content before
  backmatter.
- Source basis: DoD RFO Class Deviation Part 15 / DFARS Part 215, DARS Tracking Number 2026-O0048, signed
  2026-03-05 and effective 2026-03-16, and local TeX structure review of Chapters 23-25.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied Contracting RFO Competition and Solicitation Cleanup

- ID: `gc-20260604-contracting-rfo-competition-solicitation-cleanup`
- Location: `tex/chapters/11_Contracting_Fundamentals.tex`, `tex/chapters/12_Solicitation.tex`,
  `tex/chapters/15_policy.tex`, `tex/chapters/29_Board_Assumptions_and_Fast_Cues.tex`,
  `tex/acronyms.def`, `tex/edo.bib`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: updated the competition/CICA board cue from legacy FAR 6.302/6.303/6.304/6.305
  numbering to the current DoD RFO Part 6/DFARS 206 structure: revised FAR 6.103 for
  other-than-full-and-open authorities, revised FAR 6.104 for justification and approval content and
  approvals, and revised FAR 6.301 for public-availability/posting rules. Replaced closed-list RFO current-events
  language with a live-tracker warning because DoD execution now includes multiple agency deviations beyond the
  initial Feb 1, 2026 set and Part 15/DFARS 215 has its own effective date. Clarified security-cooperation
  realignment to avoid unsupported Capability Trade Council brokering language. Tightened solicitation chapter
  cues for T&M fixed hourly rates/D&F/ceiling-price controls, small-business set-aside rule-of-two limits, and the
  over-$20K through $25K public-notice band. Added the GPE acronym and refreshed RFO bibliography/source-inventory
  access dates and rows.
- Source basis: Acquisition.gov FAR Overhaul deviation tracker, Acquisition.gov RFO Part 6 model text, DoD RFO
  Class Deviation Part 6 / DFARS Part 206, DoD RFO Class Deviations Parts 10/12/18, DoD Part 15 / DFARS Part 215
  deviation, FAR 5.101, FAR 16.601, FAR 19.502-2, Acquisition.gov threshold changes, and the SecWar arms-transfer
  and security-cooperation realignment memo.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied T&E Sequencing and Organization Currentness Cleanup

- ID: `gc-20260604-te-org-currentness-cleanup`
- Location: `tex/chapters/17G_Systems_Engineering_Overview.tex`, `tex/chapters/18B_test-eval.tex`,
  `tex/chapters/1_Chain_of_command.tex`, `tex/chapters/appendix_edo_flags.tex`,
  `tex/chapters/appendix_pae_construct_mapping.tex`, `tex/edo.bib`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: corrected the systems-engineering traceability flow so IOT&E/LFT&E follow
  Milestone C/LRIP and support later beyond-LRIP, FRP, or full-deployment decisions rather than preceding
  Milestone C. Clarified that early OT/operational-assessment evidence can support Milestone C, while
  independent OTAs lead OT/IOT&E with DOT&E oversight for covered/listed programs. Replaced ACAT-keyed
  TEMP approval wording with DoDM 5000.100 oversight-list wording: DOT&E approval for OT&E/LFT&E
  oversight-list programs and designated-MDA approval for non-listed programs. Corrected the LFT&E
  waiver cue from SECWAR to SECDEF routing through DOT&E with alternative-strategy certification and
  congressional notification. Removed the unsupported RDML Kevin P. Biehn PEO MLB claim and replaced it
  with a live-source caution that PEO MLB official pages conflict between Mary Thoms as Acting PEO and
  Christine Rodriguez, SES, as PEO; RDML Andrew Biehn belongs to NAVSEA 21 / PAE Maritime modernization
  and sustainment. Tightened Douglas Williams/Wolfe wording to treat SSP as a transition cue because the
  June roster, Navy announcement, and live SSP leadership page are not yet fully synchronized.
- Source basis: DoDI 5000.85, DoDI 5000.98, DoDM 5000.100, 10 U.S.C. 4172, PEO MLB front page,
  PEO MLB leadership page, PAE Maritime homepage, June 2026 public Navy flag roster, SSP leadership
  page, and Navy Williams promotion announcement.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied Standalone Flow and Source-Ledger Follow-up

- ID: `gc-20260604-standalone-flow-source-ledger-followup`
- Location: `tex/chapters/5_NAVAIR_and_PEOs.tex`, `tex/chapters/9_Program_Funding_and_Execution.tex`,
  `tex/chapters/10_Cost_Fundamentals.tex`, `tex/chapters/18A_Ship_Trials.tex`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/sources.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: moved the warfare-center, budget-execution, cost-estimate, and ship-trial coursebook cue
  sections before their standalone acronym glossary blocks so the acronym glossary remains chapter backmatter.
  Updated readable audit closeout IDs to match the machine-readable `guide_changes.jsonl` closeout IDs while
  preserving the original May 30 IDs as `Closes ID` lines. Added the official NAVSEA TS9090-310G public PDF to
  the source inventory because it supports the SOVT expansion closeout, and refreshed the memory index latest-work
  summary to include the later June 4 audit closeouts.
- Source basis: read-only formatting-flow review, local TeX structure scan after the patch, source-integrity review,
  local study-memory inspection, and the official NAVSEA TS9090-310G public PDF.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied Standalone Appendix Title, Glossary, and Guard Cleanup

- ID: `gc-20260604-standalone-title-glossary-guard-cleanup`
- Location: `tex/chapters/appendix_plat_card.tex`, `tex/chapters/appendix_key_roles.tex`,
  `tex/chapters/appendix_pae_construct_mapping.tex`, `tex/chapters/appendix_combatant_commands.tex`,
  `tex/chapters/appendix_edo_billet_summary.tex`, `tex/chapters/appendix_edo_flags.tex`,
  `tex/chapters/appendix_cno34_day_one_message.tex`, `tex/chapters/appendix_current_events.tex`,
  `tex/chapters/15_policy.tex`, `tex/chapters/17N_Continuous_Process_Improvement.tex`,
  `scripts/check-tex-structure.sh`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: removed generic standalone `EDO Study Guide` appendix titles where an appendix file already
  has its own chapter title, converted section-only appendix standalone headings to topic-specific conditional chapter
  titles, added standalone acronym glossary blocks to acronym-using files that lacked them, restored the missing
  `\end{document}` in `15_policy.tex`, and expanded `check-tex-structure.sh` to fail on missing standalone glossaries,
  substantive content after standalone glossary blocks, and generic appendix standalone titles.
- Source basis: read-only standalone-flow scout, main-thread TeX structure inspection, local direct scans, and
  `make check-tex-structure` with the new guard coverage.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied PAE Chart Connector Routing Cleanup

- ID: `gc-20260604-pae-chart-connector-routing-cleanup`
- Location: `tex/chapters/1_Chain_of_command.tex`, `artifacts/out/main.pdf`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: moved Figure 1.4 portfolio connector buses into explicit TikZ routing lanes above the PAE node
  row and increased arrow endpoint shortening so connector lines terminate outside the node borders instead of
  visually overlapping boxes.
- Source basis: user-reported rendered-PDF defect, main-thread TikZ source inspection, full Docker PDF rebuild, and
  rendered page-image verification of Figure 1.4.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied NAVSEA Leader and Source-Ledger Currentness Cleanup

- ID: `gc-20260604-navsea-leader-source-ledger-cleanup`
- Location: `tex/chapters/1_Chain_of_command.tex`, `tex/edo.bib`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: replaced the non-EDO leader cue that relied on a NAVSEA org-chart bibliography entry marked
  ``verify current fills'' with the current NAVSEA command-leadership chart checked on 2026-06-04, naming NAVSEA 08
  as ADM William J. Houston, PEO IWS as RDML Thomas J. Dickinson, and PEO USC as Melissa Kirkendall, SES; refreshed
  the NAVSEA org-chart bibliography entry to the current official URL; aligned checked dates and notes for PMW 120,
  PMW 790, PMA/PMW 101, PEO Digital, NAVSEA PEO IWS, and NAVSEA PEO IWS Industry Engagement source-ledger rows.
- Source basis: official NAVSEA command-leadership chart, official PEO C4I program-office page and tear sheets,
  official NAVSEA PEO IWS pages, official PEO Digital portfolio overview, and local consistency-scout findings.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied PAE Chart Connector Clearance Follow-up

- ID: `gc-20260604-pae-chart-clearance-followup`
- Location: `tex/chapters/1_Chain_of_command.tex`, `artifacts/out/main.pdf`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: added explicit outside-node TikZ endpoint coordinates and clear connector styles for Figure 1.4
  deputy, PAE-row, and SYSCOM-support arrows so connector arrowheads stop before the boxes instead of relying on
  node-border targeting or path shortening.
- Source basis: user-reported rendered-PDF defect, main-thread TikZ source inspection, full PDF rebuild, and rendered
  page-image verification of Figure 1.4.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied CIVPERS Source-Fidelity Cleanup

- ID: `gc-20260604-civpers-source-fidelity-cleanup`
- Location: `tex/chapters/27_CIVPERS.tex`, `tex/chapters/27A_Naval_Justice_and_Standards.tex`, `tex/edo.bib`,
  `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: replaced the generic standalone chapter titles with topic-specific titles; added primary
  statutory, regulatory, and OPM source citations to the performance-vs-conduct table and unacceptable-performance
  paragraph; added the missing BibTeX records for 5 U.S.C. 4303, 5 U.S.C. 7513, 5 U.S.C. 7701, 5 CFR 432.105, 5 CFR
  752.404, OPM employee rights, OPM performance management, and the OPM Chapter 43/75 comparison material; and refreshed
  CIVPERS source-ledger checked dates to 2026-06-04.
- Source basis: current official OPM, eCFR, U.S. Code, DoDI 1400.25 Volume 431 Change 4, Department-level unacceptable
  performance memo, and MSPB records listed in `sources.md`.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied SE Technical-Review Baseline Source-Fidelity Cleanup

- ID: `gc-20260604-se-baseline-source-fidelity-cleanup`
- Location: `tex/chapters/17G_Systems_Engineering_Overview.tex`, `tex/chapters/17I_CM_and_Technical_Reviews.tex`,
  `tex/chapters/29_Board_Assumptions_and_Fast_Cues.tex`, `tex/edo.bib`, `docs/study_memory/sources.md`,
  `docs/study_memory/weak_areas.md`, `docs/study_memory/weak_areas.jsonl`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: replaced generic standalone chapter titles for the two systems-engineering chapter files, added
  DAU ACQuipedia bibliography records for SRR, SFR, system performance specification, functional baseline, allocated
  baseline, product baseline, PDR, CDR, and technical baselines, and tightened the board cue so SRR is treated as a
  requirements review while SFR/PDR/CDR map to functional/allocated/initial product baselines.
- Source basis: current official DoDI 5000.88 and DAU pages checked through web search on 2026-06-04, plus local guide
  and study-memory consistency review.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied EDO Flag Billet Source-Hygiene Cleanup

- ID: `gc-20260604-edo-flag-billet-source-hygiene`
- Location: `tex/chapters/1_Chain_of_command.tex`, `tex/chapters/appendix_edo_flags.tex`,
  `docs/study_memory/sources.md`, `docs/study_memory/weak_areas.md`, `docs/study_memory/weak_areas.jsonl`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: removed an empty list item from the acquisition-governance selected-billets cue; reduced reliance
  on stale individual Navy biography citations by using the June~2026 public flag roster as the grade/billet authority;
  aligned RADM Casey Moton and RDML Brian Metcalf wording with the live PAE Maritime deputy-PAE lanes; and updated the
  weak-area summary to show the remaining issue as memorization/rapid recall rather than unresolved source drift.
- Source basis: June~2026 public flag-roster record already in the guide, live PAE Maritime homepage checked on
  2026-06-04, local consistency-scout findings, and main-thread source-access checks. MyNavyHR, SSP, NAVSEA, and
  Navy.mil command-line retrieval returned `403` during this pass, so their previously recorded 2026-06-04 currentness
  records were not advanced beyond the existing source-ledger state.
- Confidence: `High` for local consistency and PAE Maritime wording; `Medium` for external currentness beyond the
  existing June~2026 roster record because several official pages were inaccessible to command-line retrieval during
  this pass.
- Status: `applied`

### 2026-06-04 - Applied OPNAV Resource-Sponsor Map Cleanup

- ID: `gc-20260604-opnav-resource-sponsor-map-cleanup`
- Location: `tex/chapters/1_Chain_of_command.tex`, `tex/chapters/6_PPBE.tex`,
  `tex/chapters/appendix_key_roles.tex`, `docs/reference/2026-06-02-additional-info-study-material.md`,
  `tex/edo.bib`, `docs/study_memory/sources.md`, `docs/study_memory/weak_areas.md`,
  `docs/study_memory/weak_areas.jsonl`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: corrected the PPBE resource-sponsor quick map so warfighting development is N7 in the public
  NAVMAC resource-sponsor code list, not the CNO principal-assistant N3/N5 operations/plans lane; renamed sponsor-only
  headings to sponsor/integrator wording; added board traps that N8 is the PPBE integration/checkbook lane rather than
  a platform sponsor; added N7 to Appendix Key Roles; and added OPNAV/PPBE source-ledger rows.
- Source basis: NAVMAC Activity Manpower Management Guide Section 24 checked on 2026-06-04, existing bibliography
  records for OPNAVINST 3050.27A, OPNAVINST 3111.17C, and OPNAVINST 5420.117A, local consistency-scout findings, and
  main-thread source-access checks. DONI direct command-line retrieval returned request-filtered HTML during this pass,
  so OPNAVINST checked dates were not advanced beyond existing bibliography records.
- Confidence: `High` for NAVMAC resource-sponsor-code mapping; `Medium` for broader OPNAV instruction currentness
  because DONI direct retrieval was blocked during this pass.
- Status: `applied`

### 2026-06-04 - Applied NAVWAR/PEO C4I Source-Hygiene Refresh

- ID: `gc-20260604-navwar-c4i-source-hygiene-refresh`
- Location: `tex/chapters/4_NAVWAR.tex`, `tex/chapters/29_Board_Assumptions_and_Fast_Cues.tex`, `tex/edo.bib`,
  `docs/study_memory/sources.md`, `docs/study_memory/weak_areas.md`, `docs/study_memory/weak_areas.jsonl`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: aligned the PEO C4I office list with the official PMW/A 170 styling, updated the NAVWAR
  current-source cue from 2026-05-27 to 2026-06-04, moved the Board Fast Cues C4I product-ownership citation from
  coursebook-only support to current official PEO C4I and NAVSEA sources, aligned PMW 150/160/170 bibliography checked
  dates with the source ledger, added the missing PMW/A 170 source-ledger row, refreshed the PEO MLB portfolio-book
  source-ledger row, and corrected the NAVSEA CEC article version date to 2025-08-21.
- Source basis: PEO C4I Program Offices, PMW 120 Overview Tearsheet, PMW 150 Tear Sheet, PMW 160 Tear Sheet, PMW/A 170
  Tear Sheet, PMW 790 Tear Sheet, PMA/PMW 101 MIDS Tear Sheet, NAVAIR PMA/PMW-101, NAVAIR PMW/A-170, NAVSEA About PEO
  IWS, NAVSEA Cooperative Engagement Capability article, PEO Digital Portfolio Overview, and PEO MLB Portfolio Book, all
  checked through official-source web retrieval on 2026-06-04.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied Congressional Committee Currentness Cleanup

- ID: `gc-20260604-congressional-committee-currentness-cleanup`
- Location: `tex/chapters/8_Congressional_Enactment.tex`, `tex/edo.bib`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: replaced the stale HASC/SASC authorization-subcommittee table with current official committee
  names; removed old House Oversight and Investigations and House Emerging Threats and Capabilities rows from the
  current HASC list; added SASC Airland; added a board trap that committee rosters are time-sensitive; and clarified
  the current appropriations naming difference between the House National Security / State lane and the Senate State,
  Foreign Operations, and Related Programs lane.
- Source basis: official HASC subcommittees page, official SASC 119th Congress subcommittee-leadership release, official
  House Appropriations subcommittees page, official Senate Appropriations subcommittee list, and official Senate
  Appropriations jurisdiction page, all checked on 2026-06-04.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied EVM/APB/PMB Source-Hygiene Cleanup

- ID: `gc-20260604-evm-apb-pmb-source-hygiene`
- Location: `tex/chapters/14_EVM.tex`, `tex/acronyms.def`, `tex/edo.bib`, `docs/study_memory/sources.md`,
  `docs/study_memory/weak_areas.md`, `docs/study_memory/weak_areas.jsonl`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: corrected EVM acronym expansions for IPMDAR, CFSR, TCPI, VAC, BCWS, and BCWP; tightened the
  EVM chapter so metrics measure against the PMB rather than establish it; reinforced that the IBR assesses PMB
  realism/risk and is not MDA approval of the APB; updated the current DFARS 2026-O0011 source date; and added
  current DoD IPM and DON CEVM source grounding.
- Source basis: official DFARS RFO Part 234 Class Deviation 2026-O0011, official DoD IPM EVM Definitions page,
  official DoD IPM Policy and Guidance page, official DON Naval CEVM page, and local coursebook EVM modules.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied NMP/AIT Ship-Change Flow Cleanup

- ID: `gc-20260604-nmp-ait-ship-change-flow-cleanup`
- Location: `tex/chapters/20_Navy_Modernization_Program.tex`,
  `tex/chapters/22_AIT_Fundamentals_and_Lessons_Learned.tex`,
  `tex/chapters/29_Board_Assumptions_and_Fast_Cues.tex`, `tex/acronyms.def`, `tex/edo.bib`,
  `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: added missing FAT, SID, ILS, and CDMD-OA acronym support; cited and tightened the product-line
  integration walkthrough from program-office need through SCD/NDE-NM approval, RMMCO gatekeeping, AIT execution, SOVT,
  logistics handover, and configuration closeout; added a board fast cue for the modernization-to-fleet chain; and added
  public JFMM Volume VI and NAVSEA logistics/CDMD-OA source records.
- Source basis: official JFMM Volume VI Rev D Change 5 public PDF, official NAVSEA TS9090-310G public PDF, official
  NAVSEA Logistics Planning, Processes & Policy page, and local EDO coursebook modernization/AIT modules.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied CIVPERS Route-Choice Fast-Cue Cleanup

- ID: `gc-20260604-civpers-route-choice-fast-cue`
- Location: `tex/chapters/27_CIVPERS.tex`, `tex/chapters/29_Board_Assumptions_and_Fast_Cues.tex`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: split the dense unacceptable-performance paragraph into board-scan bullets for the front-end
  record, Chapter 43, Chapter 75, probationary/trial employees, and WGI caveat; added a high-yield CIVPERS fast cue
  that ties the active weak areas together: employee status first, Chapter 43 PIP/substantial-evidence tradeoff,
  Chapter 75 no-required-PIP/preponderance/Douglas tradeoff, and WG/WL/WS 15/15/19 Federal Wage System recall.
- Source basis: official OPM performance-management memo, official OPM probationary-period guidance, official OPM
  employee-rights and appeals page, and current eCFR sections 5 CFR 532.203, 432.105, and 752.404.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied Source-Selection and Contract-Administration Cue Cleanup

- ID: `gc-20260604-source-selection-contract-admin-cues`
- Location: `tex/chapters/12A_Source_Selection.tex`, `tex/chapters/13A_Source_Selection_Practical.tex`,
  `tex/chapters/13B_Contract_Administration.tex`, `tex/chapters/29_Board_Assumptions_and_Fast_Cues.tex`,
  `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: tightened FAR post-award debriefing timing; added DoD enhanced-debriefing and GAO stay-clock
  cues; changed source-selection practical wording so the RFP discloses factors, significant subfactors, and relative
  importance while the rating method need not be disclosed; corrected the COR sentence to use KO authority rather than
  the guide's CO acronym; separated constructive changes from unauthorized-commitment ratification; and added fast cues
  for debrief/protest clocks and constructive-change vs unauthorized-commitment triage.
- Source basis: acquisition.gov FAR 15.304, FAR 15.506, FAR 33.104, FAR 1.602-1, FAR 1.602-3, acquisition.gov DFARS
  Subpart 215.5, DFARS 233.104, DoD Source Selection Procedures, NAVSEA Source Selection Guide, and NAVSEA Contracts
  Handbook. FAR/DFARS pages and DoD Source Selection Procedures were live-checked on 2026-06-04; the NAVSEA guide and
  handbook URLs remain official bibliography anchors but returned 403 to the command-line HEAD check on 2026-06-04.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied T&E and Ship-Trials Source-Currentness Cleanup

- ID: `gc-20260604-te-ship-trials-source-currentness`
- Location: `tex/chapters/18B_test-eval.tex`, `tex/chapters/18A_Ship_Trials.tex`,
  `tex/chapters/29_Board_Assumptions_and_Fast_Cues.tex`, `tex/edo.bib`,
  `docs/study_memory/sources.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: replaced the stale ship-trials statute reference from 10 U.S.C. 7304 to current
  10 U.S.C. 8674; changed the ship-trials policy reference to OPNAVINST 4700.8M; added LFT&E citations to
  the shock-trials cue; added the 10 U.S.C. 4171 alternative T&E pathway caveat without replacing the default
  IOT&E/beyond-LRIP answer; corrected MDA/TEMP approval wording; normalized statutory DOT&E reporting language
  to Secretary of Defense and Congress; refreshed OPTEVFOR source URLs; removed an internal maintenance note;
  repaired the procurement-appropriation sentence; added a T&E/ship-trials fast cue; and corrected the innovation
  tools cue from Operational Test to Other Transaction.
- Source basis: current U.S. Code sections 10 U.S.C. 139, 4171, 4172, and 8674; DoDI 5000.98; DoDM 5000.100;
  DoDM 5000.103; OPTEVFOR official website; OPNAVINST 5450.332C; OPNAVINST 4700.8M; and EDO School coursebook
  modules 3.5.5, 3.5.6, and 3.5.7. DONI PDF URLs for OPNAVINST 5450.332C and 4700.8M returned
  request-filtered HTML to direct command-line retrieval during this pass, so exact DONI wording should be
  browser/manual-verified before future line-level wording changes.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied T&E Role and Acronym-Hygiene Cleanup

- ID: `gc-20260604-te-role-acronym-hygiene`
- Location: `tex/chapters/18B_test-eval.tex`, `tex/chapters/18A_Ship_Trials.tex`,
  `tex/edo.bib`, `docs/study_memory/sources.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: replaced stale DASD(T&E) role cues with USW(R&E) / DTE&A wording; corrected the role split so
  USW(R&E) owns DT&E policy and test infrastructure while the PM designates the CDT and lead DT organization; removed
  acronym macros from longtblr cells; changed table tokens from `TEMP/T&E` and unbreakable infrastructure wording to
  breakable phrases; and normalized the ship-trial board-cue table caption.
- Source basis: DoDI 5000.89 for USD(R&E) DT&E policy/test-infrastructure responsibilities and the current ASW(MC)
  public organization page for the DTE&A current-organization label.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied Shipyard Source-Grounding and PAE Chart-Spacing Cleanup

- ID: `gc-20260604-shipyard-source-grounding-pae-chart-spacing`
- Location: `tex/chapters/19_Fleet_Maintenance_Assets.tex`, `tex/chapters/1_Chain_of_command.tex`,
  `tex/edo.bib`, `docs/study_memory/sources.md`, `artifacts/out/main.pdf`
- Verdict: `Applied`
- Correction applied: replaced coursebook-only public-shipyard specialization bullets with direct NAVSEA source
  grounding for PNSY, NNSY, PSNS & IMF, and PHNSY & IMF; added NAVSEA source-inventory and bibliography entries
  for the public shipyard enterprise, PSNS & IMF, PSNS history, and PHNSY & IMF; and adjusted the ASN(RD&A)/PAE
  TikZ coordinates so Figure 1.4 keeps the PAE connector bus above the PAE boxes after PDF rebuild.
- Source basis: official NAVSEA Shipyards/SIOP page, NAVSEA Portsmouth Naval Shipyard About Us, NAVSEA PSNS & IMF
  home page, NAVSEA PSNS & IMF History, NAVSEA PHNSY & IMF home page, and rendered `artifacts/out/main.pdf`
  inspection.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied PAE Chart Endpoint Clearance Follow-up

- ID: `gc-20260604-pae-chart-endpoint-clearance`
- Location: `tex/chapters/1_Chain_of_command.tex`, `artifacts/out/main.pdf`
- Verdict: `Applied`
- Correction applied: moved Figure 1.4 deputy, top-row PAE, and SYSCOM-support connector endpoints to explicit
  whitespace just outside the node borders; reduced clear-line endpoint shortening; and increased the PAE group
  border spacing so connector arrows and dashed support lines no longer visually overlap PAE boxes in the rendered
  PDF.
- Source basis: user-reported rendered-PDF defect, TikZ source inspection, Docker PDF rebuild, and rendered page-image
  verification of Figure 1.4.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied Fleet-Maintenance Statute and Policy Currentness Cleanup

- ID: `gc-20260604-fleet-maintenance-statute-policy-currentness`
- Location: `tex/chapters/20_Navy_Modernization_Program.tex`,
  `tex/chapters/21_Fleet_Maintenance_Policy_and_Implementation.tex`,
  `tex/chapters/28_AWP_and_SOVT.tex`, `tex/edo.bib`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Outdated`
- Correction applied: replaced the stale Public Law 102-396 heading and cue with current 10 U.S.C. 2244a; rewrote
  the 50/50 depot-maintenance rule as the 10 U.S.C. 2466 private-sector contracting ceiling; added direct
  OPNAVINST 4700.7N citations in Chapter 21; narrowed the AWP/SOVT caveat to state that the public NAVSEA
  TS9090-310G text supports the board-prep summary while operational execution should check any newer controlled
  technical-specification revision; and added the new statute/policy source-ledger and bibliography records.
- Source basis: current House U.S. Code text for 10 U.S.C. 2244a and 10 U.S.C. 2466, DONI listing/search
  confirmation for OPNAVINST 4700.7N, and the official public NAVSEA TS9090-310G PDF.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied EDO Flag-Count Fast-Cue Cleanup

- ID: `gc-20260604-edo-flag-count-fast-cue`
- Location: `tex/chapters/appendix_edo_flags.tex`, `tex/chapters/29_Board_Assumptions_and_Fast_Cues.tex`,
  `docs/study_memory/weak_areas.md`, `docs/study_memory/weak_areas.jsonl`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: added a board-count cue to the EDO flag appendix and the fast-cue chapter: 3 VADMs, 4 RADMs,
  1 RADM(sel), and 7 RDMLs. The cue explicitly warns not to collapse RADM/RDML and not to add non-EDO PAE Maritime
  leaders such as RDML Andrew Biehn to the EDO flag roster.
- Source basis: existing MyNavyHR June 2026 flag roster source for grade authority, live SSP leadership page showing
  VADM Wolfe still in the PAE SSP seat, and live PAE Maritime homepage showing RDML Andrew Biehn in the separate
  modernization and sustainment lane.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied Small-Business and SBIR/STTR Currentness Cleanup

- ID: `gc-20260604-small-business-sbir-currentness`
- Location: `tex/chapters/12_Solicitation.tex`, `tex/chapters/15_policy.tex`,
  `tex/chapters/17A_Research_and_Development.tex`,
  `tex/chapters/29_Board_Assumptions_and_Fast_Cues.tex`, `tex/acronyms.def`, `tex/edo.bib`,
  `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Outdated`
- Correction applied: replaced the coursebook-style universal small-business threshold cue with the current
  FAR/SBA answer that size standards are NAICS-specific and generally stated as maximum employees or average annual
  receipts. Strengthened the set-aside citation to FAR 19.502-2. Updated SBIR/STTR board cues from "approximately
  3 percent" to the current 15 U.S.C. 638 allocation baseline: 3.2 percent SBIR and 0.45 percent STTR generally, with
  the FY2025-FY2031 DoD budget-calculation pilot at 3.25 percent SBIR and 0.46 percent STTR. Replaced fixed SBIR
  Phase II lower-bound wording in Chapters 12 and 17A with a solicitation/agency-specific caveat and SBIR.gov general
  Phase I/II/III ranges.
  Added NAICS and STTR acronym entries and official source-ledger/bibliography records.
- Source basis: FAR 19.102, FAR 19.502-2, SBA Size Standards, 15 U.S.C. 638, and SBIR.gov Apply guidance, all checked
  from official web sources on 2026-06-04.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied Software Acquisition Pathway Source-Currentness Cleanup

- ID: `gc-20260604-software-acquisition-pathway-currentness`
- Location: `tex/chapters/17D_Software_Acquisition_Environment.tex`,
  `tex/chapters/17E_Software_Acquisition_Management.tex`, `tex/acronyms.def`, `tex/edo.bib`,
  `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Outdated`
- Correction applied: refreshed software-acquisition board cues against current official sources. Updated DoWI
  5000.02 to Change 2, added a direct DoWI 5000.87 URL, added the 6 March 2025 Secretary of Defense software
  acquisition memo, and added an SWP acronym. Clarified that covered DBS programs normally use BCAC/DoWI 5000.75
  but may incorporate SWP for custom-developed software; SWP programs are not subject to JCIDS except through the
  SWP-specific process and are not treated as MDAPs even if former MDAP thresholds are exceeded; SWP execution-entry
  artifacts are the DA-approved CNS, user agreement, acquisition strategy, test strategy, and cost estimate; and
  Agile design/verification is iterative rather than inapplicable. Added the current memo cue that SWP is preferred
  for software-development components of business and weapon-system programs and that CSOs/OTs are default
  solicitation/award approaches when statutory thresholds and pathway context apply.
- Source basis: DoWI 5000.02 Change 2, DoDI 5000.75, DoDI 5000.87, and the Secretary of Defense memorandum
  `Directing Modern Software Acquisition to Maximize Lethality`, all checked from official web sources on
  2026-06-04.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied Cybersecurity and RMF Currentness Cleanup

- ID: `gc-20260604-cyber-rmf-currentness`
- Location: `tex/chapters/17F_Cybersecurity_Awareness.tex`, `tex/edo.bib`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Outdated`
- Correction applied: replaced the stale six-step RMF cue with the current DoD RMF flow of Prepare plus Categorize,
  Select, Implement, Assess, Authorize, and Monitor; added a Prepare-step board cue; rewrote the RMF acquisition
  requirement from a milestone-only paperwork framing to an early lifecycle/acquisition-integration framing; replaced
  annual-only monitoring wording with ongoing continuous monitoring; fixed the cybersecurity `SAR` acronym collision
  by spelling out security assessment report; and narrowed the USCYBERCOM role cue away from enterprise-policy
  ownership.
- Source basis: DoDI 5000.90, DoDI 8500.01, and DoDI 8510.01 official WHS PDFs, all checked from official web
  sources on 2026-06-04.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied System-Level Technical Review Detail Cleanup

- ID: `gc-20260604-se-review-detail-board-summary`
- Location: `tex/chapters/17I_CM_and_Technical_Reviews.tex`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: added a board-facing system-level technical-review detail table covering ASR, SRR, SFR, PDR,
  CDR, TRR, SVR/FCA, PRR, OTRR, and PCA with major players, timing, and milestone/event cues; corrected
  `material solution` to `materiel solution`; narrowed the OTRR timing cue from OA/IOT&E/FOT&E to OPEVAL/IOT&E or
  follow-on OT&E; and expanded the review-table source note to include T&E and OPTEVFOR/COMOPTEVFOR OTRR grounding.
- Source basis: DoDI 5000.88, the OUSD(R&E) Engineering of Defense Systems Guidebook Change 2, DAU technical-baseline
  sources, DoDI 5000.89, DoDI 5000.98, and OPNAVINST 5450.332C/OPTEVFOR source grounding already recorded in the
  T&E source ledger.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied Warfare-Center Official-Source Board Synthesis

- ID: `gc-20260604-warfare-center-official-source-synthesis`
- Location: `tex/chapters/5_NAVAIR_and_PEOs.tex`, `tex/acronyms.def`, `tex/edo.bib`,
  `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: added an official-source board-synthesis table for warfare-center products, location cues, and
  customers across NAVSEA NSWC/NUWC, NAVWAR NIWCs/NSFA, NAVAIR NAWCAD/NAWCWD, NAVFAC EXWC, and the ONR/NRL Naval
  Research Enterprise. Reframed the reporting-relationships answer so board recall starts with the parent command and
  then explains customer/product relationships rather than drawing warfare centers as a standalone acquisition chain.
  Added official bibliography and source-ledger entries for NAVSEA warfare centers, NAVWAR About, NAWCAD, NAWCWD, NAVFAC
  EXWC, and ONR Organization pages, plus NAVFAC and EXWC acronym definitions needed by the new text.
- Source basis: current official NAVSEA, NAVWAR, NAVAIR, NAVFAC EXWC, and ONR public pages checked on 2026-06-04.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied PPBE and Funding-Policy Source Grounding

- ID: `gc-20260604-ppbe-funding-policy-source-grounding`
- Location: `tex/chapters/6_PPBE.tex`, `tex/chapters/7_NWCF.tex`,
  `tex/chapters/9_Program_Funding_and_Execution.tex`, `tex/chapters/10_Cost_Fundamentals.tex`,
  `tex/edo.bib`, `docs/study_memory/sources.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: corrected PPBE typos from OSW to OSD and USW(FM\&C) to OUSW(C); clarified the
  General Fund appropriation-flow wording against the formal appropriation/apportionment/allocation/allotment chain;
  added exact FMR/statutory grounding for full funding, product-improvement funding, MILCON, minor construction, and
  reprogramming thresholds; corrected the reprogramming-reporting cue to DD 1416 quarterly reporting; replaced the
  incorrect facility-modernization-with-OPN cue with a facility-versus-equipment funding distinction; and standardized
  POE ownership language across the cost-estimating chapter.
- Source basis: DoW FMR Volume 2A Chapter 1, DoW FMR Volume 2B Chapter 6, DoW FMR Volume 3 Chapter 6,
  and 10 U.S.C. 2805, checked from official web sources on 2026-06-04.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied Installation-Flow Source and Format Follow-up

- ID: `gc-20260604-install-flow-source-format-followup`
- Location: `tex/chapters/20_Navy_Modernization_Program.tex`,
  `tex/chapters/22_AIT_Fundamentals_and_Lessons_Learned.tex`,
  `tex/chapters/23_Waterfront_Organization_Work_Control_Safety.tex`,
  `tex/chapters/28_AWP_and_SOVT.tex`, `tex/edo.bib`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: aligned the `TS9090-310` bibliography record to the public NAVSEA TS9090-310G PDF; separated
  NDE-NM/SCD authorization and scheduling support from NAVSEA logistics/CDMD-OA support; added TS9090/JFMM source
  grounding to AIT governance, RMMCO check-in, and planning-role cues; softened submarine/nuclear modernization wording
  into a certified-boundary control cue; added a waterfront-control bridge explaining that AIT MOAs and in-briefs do not
  replace valid TWD/WAF, tag-out, and test authorization; and converted dense AWP/SOVT paragraphs into board-ready
  description blocks with clearer SOVT and PCD distinctions.
- Source basis: NAVSEA SUBMEPP JFMM page, public JFMM Volume VI Rev D Change 5 PDF, public NAVSEA TS9090-310G Rev 1
  PDF, NAVSEA Logistics Planning, Processes & Policy page, 10 U.S.C. 2244a already checked in the modernization/fleet
  maintenance source ledger, and read-only source/flow reviewer findings from the current audit slice.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied NAVWAR C4I Source-Fidelity Follow-Up

- ID: `gc-20260604-navwar-c4i-source-fidelity-followup`
- Location: `tex/chapters/4_NAVWAR.tex`, `tex/chapters/appendix_key_roles.tex`, `tex/acronyms.def`,
  `tex/edo.bib`, `docs/study_memory/sources.md`, `docs/study_memory/weak_areas.md`,
  `docs/study_memory/weak_areas.jsonl`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: replaced stale or over-specific NAVWAR examples with official-source wording: PMW 150 now states
  GCCS-M provides COP/common tactical picture/data-sharing capability and treats MTC2 as a separate Software Acquisition
  Pathway program; PMW/A 170 now uses protected-SATCOM/NMT language from the current tear sheet instead of unsupported
  anti-jam/LPI claims; PMW 790 now distinguishes DJC2, STACC, MOC, and over-100 C4ISR-capability delivery instead of the
  unsupported over-60-network wording; PEO MLB/Navy ERP now uses current GAO financial-system-of-record and Navy ERP+
  modernization wording instead of older user-count or spending-percentage figures; and the PAE Mission Systems cue now
  clearly preserves current public PEO/PMW/IWS recall while treating PAE Mission Systems as current governance
  alignment.
- Source basis: official PEO C4I program-office page, PMW 150 tear sheet, PMW/A 170 tear sheet, PMW 790 tear sheet, Navy
  PAE Mission Systems release, PEO MLB public pages, and GAO-26-107119, all checked from official web sources on
  2026-06-04.
- Confidence: `High`
- Status: `applied`

### 2026-06-04 - Applied SE, Logistics, and Manufacturing Source-Grounding Follow-Up

- ID: `gc-20260604-se-logistics-manufacturing-source-grounding`
- Location: `tex/chapters/17B_Risk_Management_and_Problem_Solving.tex`,
  `tex/chapters/17H_WBS_SE_Analysis_and_Control.tex`,
  `tex/chapters/17J_Acquisition_Logistics.tex`,
  `tex/chapters/17L_Manufacturing_and_Producibility.tex`,
  `tex/chapters/17M_Production_Quality_and_Manufacturing.tex`,
  `tex/chapters/29_Board_Assumptions_and_Fast_Cues.tex`, `tex/acronyms.def`, `tex/edo.bib`,
  `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: added official-source anchors and board-ready corrections for RIO management, WBS, acquisition
  logistics, and manufacturing/production quality. Risk transfer now says transfer does not remove Government
  responsibility; issue and opportunity management now use the DoD RIO Guide handling options; WBS now cites active
  MIL-STD-881F and avoids a universal Level 4 contract-WBS rule; acquisition logistics now uses current JFRP sustainment
  performance-attribute wording and the DoDI 5000.91 IPS list; manufacturing chapters now include summary and
  quick-review blocks, MRA/MRL and DFM/A board cues, escaped-defect/corrective-action handling, and consistent
  standalone subfile glossary handling.
- Source basis: DoD RIO Guide, ASSIST MIL-STD-881F details, DoDI 5000.91, CJCSM 5123.01, DoD MRL Deskbook 2025, DoD
  Producibility and Manufacturability Engineering Guide, and DAU Manufacturing and Quality, all checked from official or
  primary web sources on 2026-06-04.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied TA, Environmental, Availability, and Case-Study Source Grounding

- ID: `gc-20260605-ta-env-availability-case-source-grounding`
- Location: `tex/chapters/2_TA_EA.tex`,
  `tex/chapters/17C_Environmental_Requirements_and_Responsibilities.tex`,
  `tex/chapters/17O_Integrated_Case_Study.tex`, `tex/chapters/26_CNO_Availability_Execution.tex`,
  `tex/edo.bib`, `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: corrected the board trap that a ship CO holds underway technical authority; the guide now
  distinguishes CO command authority from the warranted technical-authority chain. Added current 10 U.S.C. 8669b and
  SECNAVINST 5400.15D anchors for STA, PAE reporting, SYSCOM TA, and programmatic-vs-technical escalation. Corrected the
  Clean Water Act / NPDES point-source versus nonpoint-source distinction, refreshed the 2025 NEPA update sequence with
  CEQ, DoD, and DON dates, reframed PESHE as the coursebook shorthand while current MCA policy integrates ESOH risk and
  requirements management into approved program documentation, qualified CNO availability Standard Item rules as
  contract/FY-package dependent, and normalized the Integrated Case Study standalone wrapper, summary, and quick review.
- Source basis: 10 U.S.C. 8669b, SECNAVINST 5400.15D, CEQ NEPA regulations removal, DoD NEPA Implementing Procedures,
  DON 32 CFR Part 775 rescission, 32 CFR Part 187, DoDI 5000.85, EPA NPDES Permit Basics, EPA Nonpoint Source Program,
  NAVSEA SSRAC, FY28 NAVSEA Standard Items 009-001 and 009-060, and read-only source/structure reviewer findings, all
  checked from official or primary web sources on 2026-06-05.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Leadership and Professional Development Source/Flow Audit

- ID: `gc-20260605-leadership-profdev-source-flow`
- Location: `tex/chapters/14A_EVM_Exercise.tex`, `tex/chapters/27B_Ethics_and_Acquisition.tex`,
  `tex/chapters/27C_Presentation_Techniques.tex`, `tex/chapters/27D_Team_Building.tex`,
  `tex/chapters/27E_Leading_People.tex`, `tex/chapters/27F_MBTI.tex`, `tex/chapters/27G_CPI_260.tex`,
  `tex/chapters/27H_High_Consequence_Events_Management.tex`, `tex/chapters/27I_DAWIA.tex`,
  `tex/chapters/27J_EDQP.tex`, `tex/chapters/27K_Career_Topics.tex`,
  `tex/chapters/27L_Mentoring_Tips.tex`, `tex/chapters/27M_Warrior_Toughness.tex`,
  `tex/chapters/27N_Critical_Conversations.tex`, `tex/chapters/27O_Leader_Development_Framework.tex`,
  `tex/acronyms.def`, `tex/edo.bib`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: source-grounded the uncovered leadership/professional-development slice and the EVM exercise.
  Added an EVM exercise quick review tied to DoD IPM terminology; replaced generic FAR ethics citations with FAR 3.104
  and FAR 9.504/9.505; added the HCEPF acronym; corrected DAWIA wording for greater-than-50-percent acquisition
  positions, functional-area-specific certification categories, CAP/KLP tenure, APM assignment-readiness framing, and
  80-hour continuous-learning support; tied EDQP to the public MyNavy HR EDQP page; corrected the ED Dolphin board cue
  for EDOs entering without prior warfare qualification; corrected OSR/PSR wording to include the OMPF; softened merit
  reorder into a board-specific convening-order cue; and added leader-development flow bridges so mentoring and Warrior
  Toughness point to the LDF anchor.
- Source basis: FAR 3.104-3/3.104-4/3.104-5, FAR 9.504/9.505, DoDI 5000.66 Change 3, DAU Continuous Learning, OUSD
  Back-to-Basics archive, MyNavy HR EDQP, MILPERSMAN 1301-220, BUPERSINST 1610.10H CH-1, MyNavy HR Officer Record
  Update, MyNavy HR Selection Boards, FY26 Staff Corps convening-order merit-reorder language, NETC Warrior Toughness,
  MyNavy HR GRGB Leadership Toolkit, DoD IPM EVM Definitions, DoD IPM Policy and Guidance, and read-only
  source/structure reviewer findings, all checked from official or primary web sources on 2026-06-05.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Organization Chapter Flow and NAVSEA Snapshot Caution

- ID: `gc-20260605-org-flow-navsea-snapshot-caution`
- Location: `tex/chapters/1_Chain_of_command.tex`, `tex/chapters/3_NAVSEA.tex`,
  `tex/chapters/4_NAVWAR.tex`, `tex/chapters/5_NAVAIR_and_PEOs.tex`,
  `tex/chapters/8_Congressional_Enactment.tex`, `tex/chapters/29_Board_Assumptions_and_Fast_Cues.tex`,
  `tex/edo.bib`, `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: standardized the remaining organization/currentness slice by adding first-screen Summary and
  end-of-chapter Quick Review blocks to Chapters 1, 3, 4, 5, 8, and 29. Hardened the NAVSEA corporate-overview answer
  by replacing coursebook-only live-count bullets with a board-safe currentness caution: official NAVSEA public pages
  carry page-specific snapshots, so exact manpower, activity, budget-share, and program-count figures must be quoted
  with the dated source used rather than memorized as a single live constant.
- Source basis: official NAVSEA Directorates and NAVSEA Warfare Centers ``Who We Are'' pages checked through web search
  on 2026-06-05; existing official/coursebook source anchors for DON command chains, PAE restructuring, NAVWAR/PEO C4I,
  warfare-center synthesis, and congressional committee currentness.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Contracting and Acquisition Flow Quick Reviews

- ID: `gc-20260605-contracting-acq-flow-quick-review`
- Location: `tex/chapters/2_TA_EA.tex`, `tex/chapters/11_Contracting_Fundamentals.tex`,
  `tex/chapters/12_Solicitation.tex`, `tex/chapters/12A_Source_Selection.tex`,
  `tex/chapters/13A_Source_Selection_Practical.tex`, `tex/chapters/13B_Contract_Administration.tex`,
  `tex/chapters/13C_cost-price-eval.tex`, `tex/chapters/15_policy.tex`, `tex/chapters/27_CIVPERS.tex`,
  `tex/chapters/28_AWP_and_SOVT.tex`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: standardized board-flow closeout across technical authority, contracting, solicitation, source
  selection, source-selection practical, contract administration, cost/price evaluation, acquisition policy, and CIVPERS
  by adding focused Quick Review blocks grounded in each chapter's existing cited material. Added a first-screen Summary
  to AWP/SOVT so the chapter now has the same summary-plus-quick-review reading pattern as the other recently normalized
  chapters.
- Source basis: existing cited coursebook and official-source sets already present in the affected chapters; no new
  current-source or threshold claims were introduced in this structure/flow pass.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Appendix Flow and Combatant-Command Source Cleanup

- ID: `gc-20260605-appendix-flow-command-source-cleanup`
- Location: `tex/chapters/28_AWP_and_SOVT.tex`, `tex/chapters/appendix_plat_card.tex`,
  `tex/chapters/appendix_key_roles.tex`, `tex/chapters/appendix_pae_construct_mapping.tex`,
  `tex/chapters/appendix_combatant_commands.tex`, `tex/chapters/appendix_edo_billet_summary.tex`,
  `tex/chapters/appendix_edo_flags.tex`, `tex/chapters/appendix_cno34_day_one_message.tex`,
  `tex/chapters/appendix_current_events.tex`, `tex/edo.bib`, `AGENTS.md`, `CHANGELOG.md`,
  `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: standardized the remaining appendix flow with Summary and Quick Review blocks where they were
  missing, added the missing standalone external-document guard to the AWP/SOVT chapter, replaced the combatant-command
  `aor` acronym collision with spelled-out area-of-responsibility wording, added official combatant-command source
  support, and recorded the November 2025 EDO main-slate workbook as the billet-summary source. Refreshed `AGENTS.md` so
  repo guidance points at `docs/study_memory/` and includes the active validation commands and one-question drill rule.
- Source basis: official Department public combatant-command pages, the USSPACECOM strategic-environment article, 10
  U.S.C. 162, the repo-local EDO Main Slate November 2025 workbook, existing cited sources in the affected appendices,
  read-only formatting/structure review, local TeX structure scan, and local validation.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied PAE Chart Node-Anchor Follow-Up

- ID: `gc-20260605-pae-chart-node-anchor-followup`
- Location: `tex/chapters/1_Chain_of_command.tex`, `artifacts/out/main.pdf`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: replaced the earlier floating endpoint coordinates in Figure 1.4 with branch buses that terminate
  at the actual node borders. The deputy, PAE-row, and SYSCOM support connectors now route through open lanes and stop
  on box anchors in the rendered PDF; the PAE group frame is drawn on the background layer so its border does not draw
  over the PAE boxes.
- Source basis: user-reported rendered-PDF defect, main-thread TikZ source inspection, full Docker PDF rebuild,
  log/structure validation, and rendered page-image verification of Figure 1.4 on physical PDF page 16.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied AWP/SOVT Source Currentness Follow-Up

- ID: `gc-20260605-awp-sovt-source-currentness`
- Location: `tex/chapters/28_AWP_and_SOVT.tex`, `tex/edo.bib`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: rechecked the official NAVSEA JFMM landing page, the public JFMM Volume VI Rev D Change 5 PDF, and
  the public NAVSEA TS9090-310G SOVT source. The existing AWP stages, current-source caveat, SOVT completion evidence,
  and PCD distinction remained supported, so no doctrine wording changed. Refreshed Chapter 28's currentness note to the
  standard italic style and advanced the affected BibTeX and source-ledger access dates to 2026-06-05.
- Source basis: official NAVSEA SUBMEPP JFMM landing page; official public JFMM Volume VI Rev D Change 5 PDF; official
  public NAVSEA TS9090-310G PDF; and local Chapter 28 source/cross-reference review.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Structure-Scout Small-Cleanup Follow-Up

- ID: `gc-20260605-structure-scout-small-cleanup`
- Location: `tex/main.tex`, `tex/chapters/1_Chain_of_command.tex`, `tex/chapters/3_NAVSEA.tex`,
  `tex/chapters/4_NAVWAR.tex`, `tex/chapters/17I_CM_and_Technical_Reviews.tex`,
  `tex/chapters/29_Board_Assumptions_and_Fast_Cues.tex`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: changed the Board Assumptions and Fast Cues summary from "appendix" to "chapter" because the file
  is included before `\appendix`; removed the stale commented TikZ externalization demo input from the final appendix
  flow; normalized selected Chapter 1 figure references to the guide's `\Fig{...}` style; pluralized the NAVSEA
  warfare-center figure short caption; corrected the NIWC Atlantic caption wording and National Capital Region spelling;
  and tightened an awkward technical-review figure lead-in sentence.
- Source basis: read-only structure/flow scout and local TeX source inspection; no doctrine or external-source facts
  changed.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Milestone and NAVWAR Question-Bank Source Hygiene

- ID: `gc-20260605-milestones-navwar-question-bank-source-hygiene`
- Location: `tex/chapters/16_Milestones.tex`, `tex/edo.bib`,
  `docs/study_memory/question_bank.jsonl`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: tightened the Milestone C comparison table so phase entry reads as P&D / LRIP or limited
  deployment rather than generic production; aligned O&S guidance with current product-support and ESOH framing while
  preserving PESHE as the legacy coursebook board shorthand; added a direct DAU Performance Attributes bibliography
  source for the mandatory KPP/performance-attribute cue; and updated two NAVWAR question-bank records so PMW 790 uses
  the current tear-sheet URL and PMW/A 170 uses the same styling as the guide and source ledger.
- Source basis: DoWI 5000.85, DoDI 5000.91, DAU Performance Attributes, the existing EDO School 3.3.2 coursebook
  source, the PEO C4I PMW 790 tear sheet already recorded in `sources.md`, and the read-only NAVWAR weak-area audit.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Appendix Summary Flow Follow-Up

- ID: `gc-20260605-appendix-summary-flow-followup`
- Location: `tex/chapters/appendix_cno34_day_one_message.tex`,
  `tex/chapters/appendix_pae_construct_mapping.tex`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: ran a guide-wide structure scan for standalone wrappers, first-screen Summary blocks, and Quick
  Review closeouts; normalized the two remaining appendix outliers by adding a Summary block ahead of the CNO 34
  day-one message text and renaming the PAE construct appendix's Executive Summary to the guide-standard Summary
  heading.
- Source basis: local TeX structure scan and existing cited appendix sources; this was a structure/flow correction only
  and did not change doctrine, leader names, dates, thresholds, or other current-source claims.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied NAVSEA Contracting Source-Access Caveat

- ID: `gc-20260605-navsea-contracting-source-access-caveat`
- Location: `tex/chapters/29_Board_Assumptions_and_Fast_Cues.tex`, `tex/edo.bib`,
  `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: aligned the source inventory, BibTeX notes, and board fast-cue overlay for the NAVSEA Source
  Selection Guide and NAVSEA Contracts Handbook. The two retained official guide URLs still returned HTTP 403 on
  2026-06-05, so the guide now treats them as official baseline references that require manual verification before
  advancing the availability date. The SUPSHIP Operations Manual Chapter 3 citation now points to the current official
  NAVSEA `SUPSHIP/SOM` chapter URL and uses the 2023-12-01 Rev. 2 Change 35 date.
- Source basis: official NAVSEA SUPSHIP Operations Manual Chapter 3 opened through browser retrieval, command-line HTTP
  checks of the NAVSEA Source Selection Guide and Contracts Handbook URLs on 2026-06-05, and source-ledger
  consistency review.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied NMP-MOM Controlled-Source Ledger Alignment

- ID: `gc-20260605-nmp-mom-controlled-source-ledger`
- Location: `tex/edo.bib`, `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: added a Fleet Maintenance / JFMM source-inventory row for `SL720-AA-MAN-030`, the Navy
  Modernization Process Management and Operations Manual, and changed the BibTeX URL from non-resolving
  `https://nde.navy.mil` to the responding controlled-access host `https://www.nde.navy.mil`. The entry preserves the
  prior internal/source metadata date while recording that the public host returned HTTP 403 on 2026-06-05. The public
  TS9090-310G PDF remains the visible source for the AIT appendix slice and is not treated as a substitute for the full
  controlled NMP-MOM.
- Source basis: official NDE host public-access check on 2026-06-05, official NAVSEA TS9090-310G public PDF showing
  `TS9090-310G SL720-AA-MAN-030` and NMP-MOM Appendix K, and read-only modernization source-access review.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied RMC Instruction Source-Access Alignment

- ID: `gc-20260605-rmc-instruction-source-access`
- Location: `tex/edo.bib`, `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: changed the `NAVSEAINST5450-145A` bibliography entry from the generic NAVSEA instructions URL to
  the official CNRMC Instructions page, refreshed the access date, and recorded the CNRMC copy-request caveat. Added a
  Fleet Maintenance / JFMM source-ledger row for the instruction access path. The RMC chapter still cites the current
  CNRMC About Us page for public RMC-location and embedded I-level activity claims.
- Source basis: official CNRMC Instructions page opened on 2026-06-05, official CNRMC About Us page cross-check for the
  current public RMC list and RMC Northwest / Hawaii RMC wording, and read-only source-currentness review.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied MIP Directive Source-Currentness Alignment

- ID: `gc-20260605-mip-directive-source-currentness`
- Location: `tex/edo.bib`, `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: refreshed both existing MIP directive bibliography keys, `DoDD5205-12` and `DoWD-5205-12`, to the
  current official `DoDD 5205.12` metadata while retaining both keys for compatibility. The date is now 2024-11-27, the
  URL uses the official ESD PDF path, stale Change 2 / certified-current notes were removed, and the source ledger now
  has an Intelligence Program / Budget Sources row for DoDD 5205.12.
- Source basis: official ESD DoW/DoD directives listing showing `DoDD 5205.12` dated 11/27/2024 and the official PDF
  cover showing `DOD DIRECTIVE 5205.12`, effective 2024-11-27, reissuing and cancelling the 2008-as-amended directive.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied NIP/MIP Budget-Release Source Metadata Alignment

- ID: `gc-20260605-nip-mip-budget-source-currentness`
- Location: `tex/edo.bib`, `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: aligned the NIP/MIP budget-release bibliography metadata and source ledger with current official
  direct pages. The ODNI FY2025 NIP compatibility key now points to the direct appropriated-budget release, and a new
  FY2025 NIP request key captures the distinct ODNI budget-request release. The FY2025 MIP budget release now uses the
  current War.gov direct article URL; the FY2024 MIP release now uses the official War.gov-hosted historical Department
  of Defense release; and the FY2025 MIP request entry now uses the correct 2024-03-12 Department of Defense
  budget-request release instead of the stale 2025 article/date. Added source-ledger rows for the FY2025 NIP request,
  FY2025 NIP appropriated release, FY2025 MIP appropriated release, FY2024 MIP appropriated release, and FY2025 MIP
  request.
- Source basis: official ODNI FY2025 NIP request release; official ODNI FY2025 NIP appropriated release; official
  War.gov FY2025 MIP budget release; official War.gov FY2024 MIP budget release; and official War.gov FY2025 MIP budget
  request release, all checked on 2026-06-05.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied NAVSEA Manual Source-Access Alignment

- ID: `gc-20260605-navsea-manual-source-access`
- Location: `tex/edo.bib`, `tex/chapters/22_AIT_Fundamentals_and_Lessons_Learned.tex`,
  `tex/chapters/23_Waterfront_Organization_Work_Control_Safety.tex`,
  `tex/chapters/26_CNO_Availability_Execution.tex`, `docs/study_memory/sources.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: replaced generic NAVSEA Instructions URLs for TUM, 6010, 8010, and salvage policy with direct
  official public sources where available; corrected 6010 from `S9002-AB-MAN-010` to `S9002-AK-CCM-010/6010`; corrected
  8010 from `S0570-AB-SAF-010` to `S0570-AC-CCM-010/8010`; corrected salvage from `NAVSEA 4740.2H` to
  `OPNAVINST 4740.2H`; and added controlled-source caveats for NAVSEAINST 5450.14D, NAVSEA 0924-62-0010,
  SS800-AG-MAN-010/P-9290, and NAVSEAINST 4440.16B. Chapter 22 and waterfront-work-control citations now point to the
  corrected public manual keys where the prose discusses TUM, 6010, 8010, and certified-boundary work.
- Source basis: official NAVSEA SUBMEPP TUM page and TUM Rev 8 PDF; official SUBMEPP 6010 manual landing-page/PDF;
  official NAVSEA FOIA Reading Room 8010 public PDF; official NAVSEALOGCEN Configuration Management & Modernization
  page for public context on SUBSAFE, DSS-SOC, and Level I/SUBSAFE Stock Program support; official SUPSALV Salvage
  Publications page/PDF for OPNAVINST 4740.2H; and the NAVSEA Resources / Instructions redirect to Flank
  Speed/SharePoint controlled access, all checked on 2026-06-05.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Current Organization Leader-Cue Source Refresh

- ID: `gc-20260605-current-org-leader-cue-source-refresh`
- Location: `tex/edo.bib`, `tex/chapters/1_Chain_of_command.tex`, `tex/chapters/appendix_edo_flags.tex`,
  `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: refreshed the current-organization leader-cue source basis after a live official-source check. The
  EDO flag appendix now records a 2026-06-05 roster-link check while preserving the June 2026 roster as the grade
  authority. Chapter 1 now cites the February 2026 NAVSEA command-leadership chart for current non-EDO leader awareness
  instead of using the older December 2025 chart citation. The December 2025 NAVSEA chart remains explicitly tied to the
  rendered Chapter 3 figure asset until the binary figure is replaced. PEO MLB front-page and leadership-page access
  dates now reflect the 2026-06-05 recheck of the Christine Rodriguez / Mary Thoms conflict.
- Source basis: official MyNavyHR Flag Management page linking the June 2026 Public Roster PDF and Excel roster;
  official June 2026 MyNavyHR public flag roster PDF; official February 2026 NAVSEA Command Leadership chart; official
  PEO MLB front page and PEO MLB Leadership page; official PAE Maritime homepage; official SSP Leadership page; and
  official Navy Williams promotion announcement, all checked or rechecked on 2026-06-05.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Guide-Change Source-Ledger Guard

- ID: `gc-20260605-guide-change-source-ledger-guard`
- Location: `Makefile`, `scripts/check-guide-change-sources.py`, `AGENTS.md`, `README.md`,
  `docs/study_memory/README.md`, `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: added an applied-guide-change source-ledger checker that scans `guide_changes.jsonl` records from
  the active audit period and fails when external source-basis URLs are missing from `docs/study_memory/sources.md`.
  Wired the checker into `make check-study-memory`, added the direct `make check-guide-change-sources` target, and
  recorded the three missing source-inventory URLs surfaced by the first scan: 10 U.S.C. 162 on govinfo, the ESD DoDD
  listing page for DoDD 5205.12, and the NAVSEA SUBMEPP TUM landing page.
- Source basis: local validation workflow review of `guide_changes.jsonl`, `sources.md`, existing source-check scripts,
  and the first checker run against the current checkout.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Study-Memory Semantic Validation Guard

- ID: `gc-20260605-study-memory-semantic-validation`
- Location: `scripts/check-study-memory.sh`, `docs/study_memory/schemas.md`, `docs/study_memory/README.md`,
  `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: extended `make check-study-memory` so it now validates documented enum values, `source_basis`
  object shape, future machine-local absolute provenance paths, and stable question-bank `source_section` references.
  Updated the schema documentation to match actual retained values such as `Applied` guide-change verdicts and
  `application` miss types. Added a portable in-repo source-ledger row for the archived May 30 session package while
  preserving the historical imported absolute path as provenance.
- Source basis: read-only structure/provenance audit findings, current JSONL value inventory, and local validation of
  the strengthened `check-study-memory` target.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Cited Official-Source Ledger Backfill and Audit Helper

- ID: `gc-20260605-cited-official-source-ledger-backfill`
- Location: `tex/edo.bib`, `scripts/check-cited-bib-sources.py`, `Makefile`, `AGENTS.md`, `README.md`,
  `docs/study_memory/README.md`, `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: backfilled high-value official sources that are already cited across the TeX guide but were
  missing from `docs/study_memory/sources.md`: OMB Circular A-11, DoDI 5000.89, SECNAVINST 5000.2G, Acquisition.gov
  threshold changes, and DIU Work With Us / CSO pathway material. Refreshed the BibTeX access dates for OMB A-11, DoDI
  5000.89, DIU Work With Us, and Acquisition.gov thresholds to 2026-06-05. SECNAVINST 5000.2G was added to the source
  ledger with an explicit DONI-listing caveat because the public DONI listing showed the instruction active, while
  direct PDF access was filtered/reset from this environment. Added the report-only `make audit-cited-bib-sources`
  helper so future audit slices can identify cited `http(s)` URLs in `tex/edo.bib` and `tex/current_events.bib` that do
  not exact-match the source ledger. The helper is intentionally not a required validation gate yet because some cited
  URLs are represented by source landing pages or consolidated ledger rows instead of exact direct-PDF URLs.
- Source basis: official Acquisition.gov threshold table; official OMB circulars page and A-11 PDF; official DIU Work
  With Us page; official ESD DoD issuances listing and DoDI 5000.89 PDF; and official DONI listing evidence for
  SECNAVINST 5000.2G, plus local validation of the new report-only cited-BibTeX source-ledger audit helper.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied FMR and Treasury Exact-URL Source-Ledger Backfill

- ID: `gc-20260605-fmr-treasury-exact-ledger-backfill`
- Location: `tex/edo.bib`, `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: added exact source-ledger rows for the cited Comptroller FMR URLs used in finance, NWCF,
  order-type, and budget-execution board cues: FMR home, Volume 3 Chapter 19, Volume 11A Chapters 2 and 3, and Volume
  11B Chapters 1, 2, 3, 11, and 12. Updated `DoDFMR-Vol3` to the current Comptroller FMR landing page, updated
  `DoDFMR-Vol3-Ch19` from a generic FMR landing page to the direct Chapter 19 PDF, and updated `Treasury-GInvoicing`
  from the stale `www.fiscal.treasury.gov/g-invoicing/` path to the current Fiscal Service G-Invoice page.
- Source basis: official Comptroller FMR landing page and direct FMR PDFs for Volume 3 Chapter 19, Volume 11A Chapters 2
  and 3, and Volume 11B Chapters 1, 2, 3, 11, and 12; official Fiscal Service G-Invoice page; and the local
  `make audit-cited-bib-sources` exact-URL backlog.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Contracting Fundamentals Summary Placement Cleanup

- ID: `gc-20260605-contracting-summary-placement-cleanup`
- Location: `tex/chapters/11_Contracting_Fundamentals.tex`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: moved the Chapter 11 `Summary` block from the end of `Intro to Contracting Fundamentals` to the
  first-screen position immediately after the section heading, matching the guide's recent Summary / Quick Review flow.
  Left the existing `Quick Review` block as the closeout.
- Source basis: read-only flow scout finding against the current checkout, existing Chapter 11 coursebook citation, and
  local TeX structure/build validation.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Fiscal, T&E, RFO, and Statutory Exact-URL Source-Ledger Backfill

- ID: `gc-20260605-fiscal-te-rfo-statutory-exact-ledger-backfill`
- Location: `tex/edo.bib`, `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: backfilled exact source-ledger rows for the cited DAU fiscal-law ACQuipedia pages, DoDD 5000.01,
  DOT&E DoDM 5000.96 and DoDM 5000.102, FAR Council RFO deviation guidance, Acquisition.gov FAR Overhaul FAQ,
  Federal Register EO 14275 publication, OMB M-25-26, FY 2026 NDAA, NMCARS, 10 U.S.C. 139, 10 U.S.C. 4251, and USFF
  Mission and Functions. Refreshed verified BibTeX access dates for the official RFO, statute, NMCARS, NDAA, USFF, and
  DAU pages; corrected the DoDD 5000.01 Change 1 metadata from 2023-11-09 to 2022-07-28 based on the official ESD PDF.
  The DOT&E DoDM entries were added to the source ledger with a caveat that the DOT&E guidance listing confirmed the
  manuals while local direct-PDF retrieval was filtered.
- Source basis: official ESD DoDD 5000.01 PDF; official DOT&E guidance listing; official Acquisition.gov FAR Council
  guidance, FAR Overhaul FAQ, OMB M-25-26 mirror, and NMCARS landing page; official Federal Register EO publication;
  official GovInfo FY 2026 NDAA PDF; official U.S. Code pages for 10 U.S.C. 139 and 10 U.S.C. 4251; official USFF
  Mission page; DAU ACQuipedia/RFO official pages via browser/search verification; local HTTP probes; read-only
  reviewer classification; and the local `make audit-cited-bib-sources` exact-URL backlog.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied CIVPERS Labor and EEO Source-Ledger Backfill

- ID: `gc-20260605-civpers-labor-eeo-source-ledger-backfill`
- Location: `tex/chapters/27_CIVPERS.tex`, `tex/edo.bib`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: updated the CIVPERS EEO citation from stale `OPNAVINST-5354-1H` to current
  `OPNAVINST-5354-1J`, backed by the MyNavyHR Equal Opportunity references page and DONI listing evidence. Corrected
  the mismatched FLRA past-practice citation from an IRS/Kansas City title to the actual FLRA page, Oklahoma City Air
  Logistics Center / Local 916, 3 FLRA No. 82 at 3 FLRA 512. Removed the weak National Guard technician handbook
  citation from the GS step-timing sentence because the OPM within-grade increase fact sheet already supports that
  board cue. Backfilled exact source-ledger rows for OPM GS classification, OPM Direct Hire Authority, EEOC federal
  EEO complaint process, EEOC harassment, FLRA Sections 7114 and 7118, the FLRA Oklahoma City decision, MyNavyHR Equal
  Opportunity references, and OPNAVINST 5354.1J.
- Source basis: official MyNavyHR Equal Opportunity references page; official DONI OPNAVINST 5354.1J listing/direct-PDF
  evidence; official OPM GS classification and Direct Hire Authority pages; official EEOC federal-sector EEO complaint
  process and harassment pages; official FLRA Section 7114 and Section 7118 statute pages; official FLRA Oklahoma City
  Air Logistics Center decision; read-only CIVPERS/labor source reviewer; and the local
  `make audit-cited-bib-sources` exact-URL backlog.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied IPMDAR, JITC, and TRA Source-Ledger Backfill

- ID: `gc-20260605-ipmdar-jitc-tra-source-ledger-backfill`
- Location: `tex/chapters/16_Milestones.tex`, `tex/chapters/appendix_key_roles.tex`, `tex/edo.bib`,
  `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: updated the milestones chapter and bibliography from the older `USDRE-TRA-2020` key to the
  February 2025 OUSD(R&E) Technology Readiness Assessment Guidebook. Retargeted the `JITC-interoperability`
  bibliography entry from a generic JITC homepage URL to the official JITC Interoperability Process Guide Version 3.0,
  which directly supports early coordination, operationally representative test data, and
  certification/fielding-decision cues. Aligned the appendix operational-test oversight cue from the broad legacy DAG
  citation to DoDI 5000.89 and DoDI 5000.98. Refreshed the IPMDAR DID Rev D access date and added an ASSIST note.
  Backfilled exact source-ledger rows for the DLA ASSIST IPMDAR details page, JITC homepage, JITC Interoperability
  Process Guide Version 3.0, and the OUSD(R&E) TRA Guidebook.
- Source basis: official DLA ASSIST QuickSearch document-details page for DI-MGMT-81861D; official ASSIST-downloaded
  IPMDAR Rev D PDF; official JITC homepage and Interoperability Process Guide Version 3.0; official OUSD(R&E) February
  2025 Technology Readiness Assessment Guidebook; and the local `make audit-cited-bib-sources` exact-URL backlog.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Applied Acquisition and Statutory Source-Ledger Backfill

- ID: `gc-20260605-acq-statutory-source-ledger-backfill`
- Location: `tex/chapters/1_Chain_of_command.tex`, `tex/chapters/4_NAVWAR.tex`,
  `tex/chapters/12_Solicitation.tex`, `tex/chapters/appendix_key_roles.tex`, `tex/edo.bib`,
  `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: replaced the current operational-test oversight citation to the retired Defense Acquisition
  Guidebook with active DoDI 5000.89 and DoDI 5000.98 citations; marked the legacy DAG BibTeX key as retired and pointed
  it to DAU's current acquisition tools page; refreshed GAO-20-84 to the official GAO product page and full publication
  date; replaced the NPS-hosted Goldwater-Nichols PDF with the GovInfo Statutes at Large source; refreshed 10 U.S.C.
  113 and 10 U.S.C. 8032 to current uscode.house.gov preliminary text; refreshed the DAU MDAP changes citation access
  date and caveat; and marked the 2021 JCIDS Manual as a legacy crosswalk source to use alongside current CJCSM 5123.01
  JFRP governance.
- Source basis: official DAU acquisition tools page; official DAU MDAP Program Manager Changes article; official GAO
  product page for GAO-20-84; official GovInfo Public Law 99-433 Statutes at Large page; current uscode.house.gov pages
  for 10 U.S.C. 113 and 10 U.S.C. 8032; DAU-hosted distribution-A JCIDS Manual; active DoDI 5000.89 and DoDI 5000.98
  rows already listed in `sources.md`; and the local `make audit-cited-bib-sources` exact-URL backlog.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Closed Remaining Cited-BibTeX Source-Ledger Gaps

- ID: `gc-20260605-current-events-infrastructure-exact-ledger-closeout`
- Location: `tex/edo.bib`, `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: redirected the DON Cyber Strategy citation from a CloudFront thumbnail/PDF URL to the official
  media.defense.gov PDF linked from the Navy release. Refreshed live-verified BibTeX access dates for the Project
  Overmatch, NAVWAR Okano change-of-command, NAVAIR PMA/PMW-101, NAVAIR PMW/A-170, NAVFAC/NAVSEA infrastructure,
  NAVSEA FY26 Standard Items, SECNAVINST 5400.15D, SECNAVINST 5460.4, RFO White House, FMB/N82, SSP, NAVPLAN 2022,
  CNO Day One, and FY27 budget request sources. Backfilled source-inventory rows for the remaining cited URLs so the
  cited-BibTeX source-ledger audit now reports no exact-URL gaps.
- Source basis: official Navy FY27 budget transcript; official NAVWAR/DVIDS Project Overmatch and Okano articles;
  official NAVAIR PMA/PMW-101 and PMW/A-170 pages; official NAVFAC/NAVSEA infrastructure articles; official NAVSEA
  FY26 Standard Item PDFs; official media.defense.gov DON Cyber Strategy, NAVPLAN 2022, and CNO Day One PDFs; official
  White House RFO presidential action and fact sheet; official WarGov flag-officer assignment release; official SSP PAE
  article; official DONI instruction URLs with access-filtering caveat where applicable; and the local
  `make audit-cited-bib-sources` exact-URL backlog.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Removed Duplicated Flag-Billet Appendix Notes

- ID: `gc-20260605-flag-billet-note-formatting`
- Location: `tex/chapters/1_Chain_of_command.tex`, `tex/chapters/14_EVM.tex`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: shortened the three `\FlagBilletNote{...}` call-site arguments that already flowed through the
  macro-defined `Appendix~\ref{app:edo-flags}` prefix. This removes rendered wording like "Appendix ... See Appendix
  ..." from Chapter 1's acquisition-governance flag cue and Chapter 14's SUPSHIP/EVM cues while preserving the intended
  cross-reference to the current EDO flag roster.
- Source basis: local TeX macro/call-site review of `tex/main.tex`, `tex/chapters/1_Chain_of_command.tex`, and
  `tex/chapters/14_EVM.tex`; rendered-prose formatting inspection; and the local TeX validation gate.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Removed Stale Disabled Community-Rosters Include

- ID: `gc-20260605-stale-disabled-community-rosters-include`
- Location: `tex/main.tex`, `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: removed the commented `\StudySubfile{appendix_community_rosters}` line from the appendix
  sequence because no matching `tex/chapters/appendix_community_rosters.tex` file exists and the disabled include could
  mislead future structure audits into treating the appendix as a missing active artifact.
- Source basis: read-only structure-flow scout plus local file-existence and active-include review of `tex/main.tex`
  and `tex/chapters`.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Refreshed Committee and RFO Fast-Cue Currentness

- ID: `gc-20260605-committee-rfo-fast-cue-currentness`
- Location: `tex/chapters/8_Congressional_Enactment.tex`, `tex/chapters/29_Board_Assumptions_and_Fast_Cues.tex`,
  `tex/edo.bib`, `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: rechecked the Chapter 8 HASC, SASC, HAC, and SAC subcommittee names against official committee
  pages and advanced the committee-currentness stamps to 2026-06-05 without changing the listed names. Retargeted the
  Senate Appropriations subcommittee BibTeX and source-ledger URL from a single agriculture subcommittee page to the
  actual official Senate subcommittees list page. Rechecked the Chapter 29 fast-cue anchors for active RFO Part 6 /
  DFARS 206 competition deviations and the \$350K simplified acquisition threshold; the existing fast-cue facts remain
  supported, so only source access dates and source-ledger currentness were refreshed.
- Source basis: official HASC subcommittee page; official SASC 119th Congress subcommittee-leadership release; official
  HAC subcommittee page; official SAC subcommittees page and jurisdiction page; official Acquisition.gov FAR Part
  Deviation Guidance tracker; official Acquisition.gov FAR Overhaul Part 6 page; official DoD RFO Part 6 / DFARS 206
  class-deviation PDF; and official Acquisition.gov threshold-changes page.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Aligned Warfare-Center Main-Matter Include Flow

- ID: `gc-20260605-warfare-center-mainmatter-include-flow`
- Location: `tex/main.tex`, `tex/chapters/5_NAVAIR_and_PEOs.tex`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: changed the active main-matter include for `5_NAVAIR_and_PEOs.tex` from the generic
  `\StudySubfile` helper to `\ChapterWithRefsAtStart`, matching every other active main-matter study-guide chapter.
  The rendered section remains `Naval Warfare Centers`; no doctrine text, citations, labels, or appendix includes
  changed.
- Source basis: local structure-flow review of `tex/main.tex` and `tex/chapters/5_NAVAIR_and_PEOs.tex`.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Tightened Fast-Cue Cost Source Grounding

- ID: `gc-20260605-fast-cue-cost-source-grounding`
- Location: `tex/chapters/29_Board_Assumptions_and_Fast_Cues.tex`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: retargeted the fast-cue cost and lifecycle-framing citations from generic AAF/DAS references to
  the actual cost-estimating coursebook source and the DoD FMR cost source already carried in the guide. The cue text
  still asks the same board questions; this cleanup improves source fit for direct/indirect costs, estimating methods,
  learning curves, escalation, and LCC/TOC framing.
- Source basis: local citation-fit review of Chapter 29 against Chapter 10's cost-estimating source set and the existing
  DoD FMR Volume 11B Chapter 12 source-ledger row.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Corrected DON FY27 Budget Citation Metadata

- ID: `gc-20260605-don-fy27-budget-citation-date`
- Location: `tex/edo.bib`, `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: fixed the active `DON-FY27-Budget-Request-2026` BibTeX entry so its date and access date match the
  official Navy transcript date and the existing source-inventory row: 2026-06-05. Added a short note identifying the
  source as the official Navy transcript of the Department of the Navy FY27 budget request briefing.
- Source basis: official Navy FY27 budget request transcript and local cited-BibTeX metadata contradiction scan.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Split Fiscal-Law U.S. Code Citation Anchors

- ID: `gc-20260605-fiscal-law-uscode-exact-citations`
- Location: `tex/edo.bib`, `tex/chapters/9_Program_Funding_and_Execution.tex`,
  `tex/chapters/29_Board_Assumptions_and_Fast_Cues.tex`,
  `docs/reference/2026-06-02-additional-info-study-material.md`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: retargeted the active fiscal-law BibTeX entries from the generic U.S. Code homepage to exact
  31 U.S.C. 1301, 1341, and 1502 pages; added a separate exact 31 U.S.C. 1517 citation key for the Anti-Deficiency Act
  apportionment/allotment control; updated active cite lists that say `\S~1341/\S~1517`; and aligned the supplemental
  June 2 study material so the amount-rule shorthand includes both 31 U.S.C. 1341 and 31 U.S.C. 1517.
- Source basis: official U.S. Code pages for 31 U.S.C. 1301, 1341, 1502, and 1517 plus local cited-source and
  fiscal-law wording scans.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Refresh Combatant-Command Statute Citation

- ID: `gc-20260605-usc162-current-uscode-citation`
- Location: `tex/edo.bib`, `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: refreshed the active `USC-162` bibliography entry from the 2023 govinfo annual-code page to the
  current exact U.S. Code 10 U.S.C. 162 page, updated the access date and source-ledger row, and corrected the subtitle
  to the statute's plural `Combatant commands` title.
- Source basis: official U.S. Code 10 U.S.C. 162 page and local active-citation scan showing `USC-162` is cited in
  Chapter 1 and the combatant-command appendix.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Align DOT&E Manual Citation Access Dates

- ID: `gc-20260605-dote-manual-access-date-alignment`
- Location: `tex/edo.bib`, `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: updated active `DoDM5000-96` and `DoDM5000-102` BibTeX access dates from 2026-04-26 to
  2026-06-05 so the bibliography matches the existing source-ledger/currentness check for the DOT&E December 2024
  manual set. No T&E doctrine prose changed.
- Source basis: official DOT&E Guidance page listing DoDM 5000.96 and DoDM 5000.102 in the 2024 policy-update set, the
  existing DOT&E manual source-ledger rows, and local active-citation scan showing both keys are cited in the rendered
  guide.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Align Engineering Guidebook Citation Access Date

- ID: `gc-20260605-engineering-guidebook-access-date-alignment`
- Location: `tex/edo.bib`, `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: updated the active `DoD-EngineeringDefenseSystemsGuidebook-2024` BibTeX access date and matching
  source-ledger check date to 2026-06-05 after confirming the official OUSD(R&E) PDF remains reachable and is cited in
  the rendered guide. No systems-engineering or technical-review doctrine prose changed.
- Source basis: official OUSD(R&E) Engineering of Defense Systems Guidebook PDF, local PDF metadata check, and local
  active-citation scan showing the key is cited in the technical-review chapter.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Align Acquisition Transformation Strategy Citation Access Date

- ID: `gc-20260605-acq-transformation-strategy-access-date-alignment`
- Location: `tex/edo.bib`, `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: updated the active `secwar-acq-transformation-2025` BibTeX access date and matching
  source-ledger check date to 2026-06-05 after confirming the official PDF remains reachable and is actively cited
  across the WAS, PAE, portfolio-trade, and current-events material. No acquisition-policy prose changed.
- Source basis: official Acquisition Transformation Strategy PDF and local active-citation metadata scan.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Align Auxiliary Current-Organization Source Notes

- ID: `gc-20260605-auxiliary-current-org-source-note-alignment`
- Location: `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: renamed the imported "Current Organization Sources Mentioned" source-ledger section to
  "Auxiliary Current-Organization Source Notes" and refreshed the two official web-source rows that still carried
  May 30 check dates. The DONHR Luebke row now reflects current official index/search evidence and the
  browser-filtering caveat for direct PDF access. The MyNavyHR SWO(N) row now reflects the current online page and
  21 May 2026 community brief update. The historical May 30 local-provenance row remains intentionally dated to its
  import source.
- Source basis: official DONHR Senior Executive Biographies index and search evidence for the Luebke biography,
  official MyNavyHR SWO(N) page, and local source-ledger/currentness scan.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Enforce Figure and Table Reference Macros

- ID: `gc-20260605-figure-table-reference-macro-guard`
- Location: `tex/chapters/1_Chain_of_command.tex`, `tex/chapters/6_PPBE.tex`,
  `tex/chapters/7_NWCF.tex`, `tex/chapters/8_Congressional_Enactment.tex`,
  `scripts/check-tex-structure.sh`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: normalized the remaining raw `Figure~\ref{...}` and `Table~\ref{...}` references in active
  chapters to the guide macros `\Fig{\ref{...}}` and `\Tab{\ref{...}}`. Expanded `check-tex-structure.sh` to fail
  future raw Figure/Table references in chapter prose. No doctrine prose, citations, source facts, or bibliography
  metadata changed.
- Source basis: local TeX reference-style scan across `tex/chapters/*.tex`, existing `\Fig` and `\Tab` macro
  definitions in `tex/moderntech-base.sty`, and `make check-tex-structure`.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Normalize Standalone Chapter Titles

- ID: `gc-20260605-standalone-chapter-title-normalization`
- Location: `tex/chapters/*.tex`, `scripts/check-tex-structure.sh`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: replaced 57 generic standalone subfile titles of `\chapter{EDO Study Guide}` with the first
  visible section title from each chapter file. Expanded `check-tex-structure.sh` to fail future generic standalone
  chapter titles. This affects standalone chapter/subfile builds only; the main guide uses the existing chapter and
  section structure.
- Source basis: local standalone-title scan across `tex/chapters/*.tex`, first-section title extraction from each
  affected file, and `make check-tex-structure`.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Repair Standalone Chapter Build Path

- ID: `gc-20260605-standalone-subfile-build-path-fix`
- Location: `scripts/build.sh`
- Verdict: `Applied`
- Correction applied: fixed the build script to invoke chapter subfiles from their own directory while preserving the
  normal absolute output and auxiliary directories. This lets standalone chapter builds resolve their
  `\documentclass[../main.tex]{subfiles}` parent path.
- Source basis: failed representative build of `tex/chapters/17H_WBS_SE_Analysis_and_Control.tex` before the fix
  (`File '../main.tex' not found`) and successful representative rebuild after the fix.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Extend Numbered Reference Macros

- ID: `gc-20260605-numbered-reference-macro-extension`
- Location: `tex/moderntech-base.sty`, `tex/main.tex`, `tex/chapters/*.tex`,
  `scripts/check-tex-structure.sh`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: added shared `\Figs`, `\Sec`, and `\App` wrappers next to the existing `\Fig` and `\Tab`
  helpers; normalized the remaining raw `Figures~\ref{...}`, `Section~\ref{...}`, and `Appendix~\ref{...}` prose
  references; and expanded `check-tex-structure.sh` so future raw numbered references fail in `tex/main.tex` and active
  chapter files.
- Source basis: local numbered-reference scan across `tex/main.tex` and `tex/chapters/*.tex`, existing `\Fig` and
  `\Tab` macro pattern in `tex/moderntech-base.sty`, and `make check-tex-structure`.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Ground Leading People CNO34 Bullets in Official Sources

- ID: `gc-20260605-leading-people-cno34-source-grounding`
- Location: `tex/chapters/27E_Leading_People.tex`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: added the official CNO34 Day One Message citation to the Leading People Foundry--Fleet--Fight
  bullet and the official CNO34 Charge of Command citation to the command-expectations bullet. The coursebook citation
  remains to preserve the chapter's lecture-source traceability.
- Source basis: official CNO Day One Message PDF, official Navy C-Notes display page for CNO 34 Charge of Command,
  existing bibliography/source-ledger rows checked on 2026-06-05, and local active-TeX source scan.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Ground Leading People GRGB Bullets in Official Source

- ID: `gc-20260605-leading-people-grgb-source-grounding`
- Location: `tex/chapters/27E_Leading_People.tex`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: added the official MyNavyHR GRGB Leadership Toolkit citation to the Leading People summary,
  culture-shift, Get Better, and Quick Review bullets that summarize GRGB transparency, self-assessment,
  problem-solving, fixing/elevating barriers, and team/culture building. The coursebook citation remains to preserve
  lecture-source traceability.
- Source basis: official MyNavyHR GRGB Leadership Toolkit page updated 2026-04-01, existing bibliography/source-ledger
  row checked on 2026-06-05, and local active-TeX source scan.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Route PAE Chart Support Line to Group Edge

- ID: `gc-20260605-pae-chart-syscom-group-edge-routing`
- Location: `tex/chapters/1_Chain_of_command.tex`, `artifacts/out/main.pdf`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: collapsed the Figure 1.4 SYSCOM support wiring from three dashed arrows aimed at individual PAE
  boxes into one dashed connector that terminates at the fitted PAE group edge. Increased the PAE group fit clearance so
  support routing remains outside individual PAE node interiors and labels.
- Source basis: user-reported rendered-PDF defect, local TikZ source inspection, rendered PDF page inspection, TeX
  structure check, whitespace check, and Docker PDF rebuild.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Ground Leader Development Framework GRGB Bullets in Official Source

- ID: `gc-20260605-ldf-nldf-grgb-source-grounding`
- Location: `tex/chapters/27O_Leader_Development_Framework.tex`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: added the official MyNavyHR GRGB Leadership Toolkit citation to the Leader Development Framework
  NLDF strategic-alignment bullet and self-guided-learning GRGB bullet while retaining the EDO coursebook citation for
  lecture traceability.
- Source basis: official MyNavyHR GRGB Leadership Toolkit page updated 2026-04-01, existing bibliography/source-ledger
  row checked on 2026-06-05, current official-page check on 2026-06-05, and local active-TeX source scan.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Ground Warrior Toughness Components in Official Source

- ID: `gc-20260605-warrior-toughness-components-source-grounding`
- Location: `tex/chapters/27M_Warrior_Toughness.tex`, `tex/edo.bib`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: added the official NETC Warrior Toughness Components source and cited it for the Chapter 27M
  bullets covering the warrior mindset cycle, core attributes, and performance psychology skills. Normalized the
  performance-skills examples to match the official NETC Components list while retaining coursebook traceability.
- Source basis: official NETC Warrior Toughness overview page, official NETC Warrior Toughness Components page checked
  on 2026-06-05, existing source-ledger row for the overview page, and local active-TeX source scan.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Ground Career Topics Selection-Board Flow in Official Source

- ID: `gc-20260605-career-topics-selection-board-source-grounding`
- Location: `tex/chapters/27K_Career_Topics.tex`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: updated Chapter 27K's board-procedure summary, promotion-context summary, board-process detail,
  and Quick Review selection-board bullet so the official board answer emphasizes precepts, confidentiality,
  findings/recommendations, and approval routing while retaining coursebook-only internal brief/vote/crunch mechanics
  as recall rather than official retained deliberation records.
- Source basis: official MyNavyHR selection-board page checked on 2026-06-05, official FY26 Staff Corps convening order
  already in the source ledger, and local Career Topics source scan.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Ground Naval Justice Ethics Rules in Official Sources

- ID: `gc-20260605-naval-justice-ethics-official-source-grounding`
- Location: `tex/chapters/27A_Naval_Justice_and_Standards.tex`, `tex/edo.bib`,
  `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`,
  `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: added official OGE, DoD SOCO, JER, DoDD 1344.10, and eCFR source support to the 27A
  standards-of-conduct, gifts, group gifts, fundraising, political-activity, and Quick Review bullets while preserving
  coursebook traceability. Replaced the overbroad statement that 5 C.F.R. Part 2635 and the JER are "punitive" with
  "enforceable standards" to avoid overstating the regulatory characterization.
- Source basis: OGE Standards of Ethical Conduct 508-compliant summary dated 2024-08-15, OGE modernization update
  showing the August 15, 2024 Part 2635 update in effect, DoD SOCO Ethics Laws and Regulations page listing the JER
  effective 2024-05-15, DoD SOCO departure-gift guidance, DoD SOCO July 2025 Gifts Deskbook, eCFR 5 C.F.R. 2635.808,
  DoDD 1344.10, DoD SOCO August 2025 Political Activities Deskbook, and local active-TeX source scan.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Route PAE Chart Through Group Header

- ID: `gc-20260605-pae-chart-group-header-routing`
- Location: `tex/chapters/1_Chain_of_command.tex`, `artifacts/out/main.pdf`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: replaced the Figure 1.4 connector fanout into the top row of individual PAE boxes with one
  ``Portfolio Acquisition Executives'' group-header node. The ASN(RD&A) connector now terminates at that header, and the
  nine PAE boxes sit below it inside the fitted group without line segments entering or crossing their interiors.
- Source basis: user-reported rendered-PDF defect, local TikZ source inspection, rendered PDF page inspection, TeX
  structure check, whitespace check, and Docker PDF rebuild.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Ground Cost Estimating Products in Official Sources

- ID: `gc-20260605-cost-estimating-official-source-grounding`
- Location: `tex/chapters/10_Cost_Fundamentals.tex`, `tex/edo.bib`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: Chapter 10's cost-estimating products relied on coursebook-only citations and described CARD
  updates as tied to the DoD Manual 5000.04 series. Current official source checks showed DoDI 5000.73 is the
  controlling cost-analysis source for CARD, POE, CCE, CCP, ICE, Service cost agency, and CAPE review, while DoDM
  5000.04 is the Cost and Software Data Reporting manual. Updated Chapter 10 citations and wording to make that
  distinction explicit and added CAPE DoD Cost Estimating Guide support for defensible-estimate process cues.
- Source basis: official WHS DoDI 5000.73 PDF; official WHS DoDM 5000.04 PDF; official CAPE DoD Cost Estimating Guide
  Version 2; existing 10 U.S.C. 139a CAPE source entry; local active-TeX and source-ledger scan.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Ground Contract Administration in FAR and Agency Sources

- ID: `gc-20260605-contract-admin-official-source-grounding`
- Location: `tex/chapters/13B_Contract_Administration.tex`, `tex/edo.bib`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: Chapter 13B's summary, organization table, payment/cash-flow cue, contract-change distinction,
  and termination-notice cue still relied heavily on coursebook-only citations even though official FAR, DCMA, DCAA, and
  DFAS sources directly support the board answer. Added targeted official citations for DCMA/DCAA/DFAS roles, FAR 32.904
  payment due dates, FAR 42.302 contract-administration functions, FAR 43.103 bilateral/unilateral modifications, FAR
  49.402-3 and 49.607 default procedure and cure/show-cause notices, and FAR 52.212-4 commercial termination context.
- Source basis: Acquisition.gov FAR pages for 32.904, 42.302, 43.103, 49.402-3, 49.607, and 52.212-4 checked on
  2026-06-05; official DCMA About page; official DCAA About DCAA page; official DFAS Doing Business with DFAS page;
  local active-TeX and source-ledger scan.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Ground EVM Roles and Reviews in Official Sources

- ID: `gc-20260605-evm-role-review-source-grounding`
- Location: `tex/chapters/14_EVM.tex`, `tex/edo.bib`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: Chapter 14 already had current EVM thresholds and IPMDAR support, but several role and review
  bullets relied on paragraph-level or coursebook-only citation context. Added point-of-use official citations for
  DFARS 252.234-7998/-7999, the 180-day IBR timing requirement, DCMA EVMS compliance/surveillance, DCAA audit support,
  DoD IPM policy and definitions, Naval CEVM, and SUPSHIP's EVMS role. Refreshed EVM source metadata to the current
  2026-06-05 checks and added a DCMA EVMS Group source row.
- Source basis: official DoD IPM definitions page; official DoD IPM policy and guidance page; DFARS RFO Part 234 EVMS
  class-deviation PDF; official DCMA EVMS Group page from search/browser retrieval with command-line 403 caveat;
  official DCAA About source already in the ledger; official DON CEVM page; local active-TeX and source-ledger scan.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Ground Solicitation Contract Types in FAR Part 16

- ID: `gc-20260605-solicitation-contract-types-far-part16`
- Location: `tex/chapters/12_Solicitation.tex`, `tex/edo.bib`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: Chapter 12's contract-type overview, fixed-price/cost-reimbursement sections, IDIQ/T&M/labor-hour
  / letter-contract cues, and fixed-vs-cost comparison still relied mostly on the EDO coursebook and one generic `FAR`
  citation. Added exact FAR Part 16 citations for contract-type selection, FFP, FPEPA, FFP level-of-effort, incentive,
  FPIF, fixed-price award fee, cost-reimbursement, CPFF, CPIF, CPAF, cost, cost-sharing, indefinite-delivery, IDIQ, T&M,
  labor-hour, and letter-contract cues while preserving the coursebook for classroom exercises and diagrams.
- Source basis: official Acquisition.gov FAR Part 16 exact section pages, FAC 2026-01 / effective 2026-03-13, checked
  2026-06-05; local Chapter 12 source scan.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Replace Remaining Broad Contracting FAR/DFARS Citations

- ID: `gc-20260605-contracting-broad-far-dfars-citation-cleanup`
- Location: `tex/chapters/11_Contracting_Fundamentals.tex`, `tex/chapters/12_Solicitation.tex`,
  `tex/chapters/12A_Source_Selection.tex`, `tex/edo.bib`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: replaced the remaining broad `FAR`/`DFARS` contracting citations with exact official-source keys:
  FAR 15.303 for SSA/KO source-selection roles, FAR 5.101 for SAM.gov/GPE publicizing thresholds, FAR Part 15 for the
  CSO contrast to negotiated-acquisition proposal procedures, FAR 33.101 and 33.102 for protest definition and venues,
  and FAR 33.104 plus DFARS 233.104 for post-award GAO protest stay timing and DoD enhanced-debriefing stay-clock cues.
- Source basis: official Acquisition.gov FAR 5.101, FAR Part 15, FAR 15.303, FAR 33.101, FAR 33.102, FAR 33.104, and
  DFARS 233.104 pages checked on 2026-06-05; local broad-citation scan of Chapters 11, 12, and 12A.
- Confidence: `High`
- Status: `applied`

### 2026-06-05 - Ground Chapter 17A TRL and RDT&E Budget Activity Cues

- ID: `gc-20260605-rd-trls-rdte-budget-activity-source-grounding`
- Location: `tex/chapters/17A_Research_and_Development.tex`, `tex/edo.bib`, `docs/study_memory/sources.md`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: Chapter 17A's technology-readiness and RDT&E budget-activity sections relied on the EDO
  coursebook even though current official sources directly support the board answer. Added the current OUSD(R&E)
  Technology Readiness Assessment Guidebook to TRL, IRL, SRL, and pre-Milestone B technology-maturity cues; added
  DoW FMR Volume 2B Chapter 5 as the RDT&E budget-activity source; and corrected the RDT&E budget-activity list from
  6.1--6.7 to 6.1--6.8 by adding Software and Digital Technology Pilot Programs.
- Source basis: official OUSD(R&E) Technology Readiness Assessment Guidebook, February 2025, checked 2026-06-05;
  official DoW FMR 7000.14-R Volume 2B Chapter 5, September 2022/current FMR PDF, checked 2026-06-05; local Chapter
  17A source scan.
- Confidence: `High`
- Status: `applied`
