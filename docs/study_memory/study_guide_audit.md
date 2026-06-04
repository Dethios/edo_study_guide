# Study Guide Audit Log

Current as of 2026-06-04.

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
- Status: `proposed`

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
- Status: `proposed`

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
- Status: `proposed`

### 2026-05-30 - Acronym Additions

- ID: `gc-20260530-acronyms`
- Original claim: several acronyms were missing or needed correction.
- Location: `tex/acronyms.def`
- Verdict: `Needs source`
- Corrected answer: package reports additions for WL, WS, ADNS, DCGS-N, DJC2, LNS, and ISNS.
- Source basis: package provenance and official source list in `sources.md`.
- Explanation: imported as proposed until the current checkout is verified.
- Confidence: `Medium`
- Status: `proposed`

## Active Session Findings

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
- Status: `proposed`

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
  150 board cue for GCCS-M, MTC2, C2P, Link 16 Network, and LMMT; and clarified that PMA/PMW 101 remains the MIDS/Link 16
  terminal and waveform lane.
- Source basis: NAVSEA About PEO IWS, NAVSEA PEO IWS Industry Engagement, NAVSEA Cooperative Engagement Capability
  article, PEO C4I Program Offices page, PMW 150 FY26 tear sheet, and PMA/PMW 101 MIDS tear sheet listed in `sources.md`.
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
- Correction applied: replaced third-party-supported current-event paragraphs for Columbia-class delay, amphibious
  block buy, and SIOP status with wording grounded in official CRS, GAO, DoW, and NAVFAC sources. Removed the unsupported
  Columbia 60 percent complete point, replaced the amphibious nearly $1B savings claim with the CRS-supported about
  $914M estimate, and reframed SIOP annual-escalation and maintenance-reduction point estimates as unsupported by the
  official source set checked in this slice.
- Source basis: CRS R41129, GAO-24-107732, DoW Contracts for Sept. 24 2024, CRS R43543, GAO-25-106728, NAVFAC PEO
  Industrial Infrastructure SIOP, NAVFAC PSNS Dry Dock 4 seismic-upgrade release, and GAO-23-106067 records listed in
  `sources.md`.
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
- Source basis: read-only cross-chapter consistency review, read-only source-integrity review, local file inspection, and
  the official NAVSEA TS9090-310G public PDF for SOVT expansion.
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
