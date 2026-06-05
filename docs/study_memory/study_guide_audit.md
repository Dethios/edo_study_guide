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
- Status: `proposed`

## Active Session Findings

### 2026-06-05 - Applied Finance, Cost, EVM, and T&E Flow Standardization

- ID: `gc-20260605-finance-cost-evm-te-flow-standardization`
- Location: `tex/chapters/6_PPBE.tex`, `tex/chapters/9_Program_Funding_and_Execution.tex`,
  `tex/chapters/10_Cost_Fundamentals.tex`, `tex/chapters/14_EVM.tex`, `tex/chapters/18B_test-eval.tex`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: added first-screen Summary blocks and end-of-chapter Quick Review blocks to PPBE, Program Funding
  and Execution, Cost Estimating, and EVM; converted the Test and Evaluation `Board Prep Summary` heading to the standard
  `Summary` heading; and preserved existing cited doctrine and official-source anchors while turning loose board cues into
  consistent board-speed recall prompts.
- Source basis: existing coursebook and official-source citations already present in each chapter, plus local structure,
  acronym, and whitespace validation.
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
- Status: `closed by gc-20260531-civpers-ch43-ch75-standards-closeout; rechecked by gc-20260604-civpers-source-fidelity-cleanup`

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
- Correction applied: rerouted Figure 1.4 connector geometry into explicit whitespace lanes. Deputy arrows now start from
  ASN(RD&A) bottom-edge ports and terminate above the deputy boxes, the PAE portfolio bus runs above the first PAE row with
  arrows stopping above node borders, the SYSCOM support cue stops outside the PAE group, and all node fills are explicitly
  opaque so background connectors cannot show through boxes.
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

### 2026-06-04 - Applied CIVPERS Source-Fidelity Cleanup

- ID: `gc-20260604-civpers-source-fidelity-cleanup`
- Location: `tex/chapters/27_CIVPERS.tex`, `tex/chapters/27A_Naval_Justice_and_Standards.tex`, `tex/edo.bib`,
  `docs/study_memory/sources.md`, `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`,
  `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: replaced the generic standalone chapter titles with topic-specific titles; added primary statutory,
  regulatory, and OPM source citations to the performance-vs-conduct table and unacceptable-performance paragraph; added
  the missing BibTeX records for 5 U.S.C. 4303, 5 U.S.C. 7513, 5 U.S.C. 7701, 5 CFR 432.105, 5 CFR 752.404, OPM employee
  rights, OPM performance management, and the OPM Chapter 43/75 comparison material; and refreshed CIVPERS source-ledger
  checked dates to 2026-06-04.
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
- Correction applied: removed an empty list item from the acquisition-governance selected-billets cue; reduced reliance on
  stale individual Navy biography citations by using the June~2026 public flag roster as the grade/billet authority;
  aligned RADM Casey Moton and RDML Brian Metcalf wording with the live PAE Maritime deputy-PAE lanes; and updated the
  weak-area summary to show the remaining issue as memorization/rapid recall rather than unresolved source drift.
- Source basis: June~2026 public flag-roster record already in the guide, live PAE Maritime homepage checked on
  2026-06-04, local consistency-scout findings, and main-thread source-access checks. MyNavyHR, SSP, NAVSEA, and Navy.mil
  command-line retrieval returned `403` during this pass, so their previously recorded 2026-06-04 currentness records were
  not advanced beyond the existing source-ledger state.
- Confidence: `High` for local consistency and PAE Maritime wording; `Medium` for external currentness beyond the existing
  June~2026 roster record because several official pages were inaccessible to command-line retrieval during this pass.
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
- Source basis: NAVMAC Activity Manpower Management Guide Section 24 checked on 2026-06-04, existing bibliography records
  for OPNAVINST 3050.27A, OPNAVINST 3111.17C, and OPNAVINST 5420.117A, local consistency-scout findings, and main-thread
  source-access checks. DONI direct command-line retrieval returned request-filtered HTML during this pass, so OPNAVINST
  checked dates were not advanced beyond existing bibliography records.
- Confidence: `High` for NAVMAC resource-sponsor-code mapping; `Medium` for broader OPNAV instruction currentness because
  DONI direct retrieval was blocked during this pass.
- Status: `applied`

### 2026-06-04 - Applied NAVWAR/PEO C4I Source-Hygiene Refresh

- ID: `gc-20260604-navwar-c4i-source-hygiene-refresh`
- Location: `tex/chapters/4_NAVWAR.tex`, `tex/chapters/29_Board_Assumptions_and_Fast_Cues.tex`, `tex/edo.bib`,
  `docs/study_memory/sources.md`, `docs/study_memory/weak_areas.md`, `docs/study_memory/weak_areas.jsonl`,
  `docs/study_memory/study_guide_audit.md`, `docs/study_memory/memory_index.md`, `docs/study_memory/guide_changes.jsonl`
- Verdict: `Applied`
- Correction applied: aligned the PEO C4I office list with the official PMW/A 170 styling, updated the NAVWAR current-source
  cue from 2026-05-27 to 2026-06-04, moved the Board Fast Cues C4I product-ownership citation from coursebook-only support
  to current official PEO C4I and NAVSEA sources, aligned PMW 150/160/170 bibliography checked dates with the source ledger,
  added the missing PMW/A 170 source-ledger row, refreshed the PEO MLB portfolio-book source-ledger row, and corrected the
  NAVSEA CEC article version date to 2025-08-21.
- Source basis: PEO C4I Program Offices, PMW 120 Overview Tearsheet, PMW 150 Tear Sheet, PMW 160 Tear Sheet, PMW/A 170 Tear
  Sheet, PMW 790 Tear Sheet, PMA/PMW 101 MIDS Tear Sheet, NAVAIR PMA/PMW-101, NAVAIR PMW/A-170, NAVSEA About PEO IWS,
  NAVSEA Cooperative Engagement Capability article, PEO Digital Portfolio Overview, and PEO MLB Portfolio Book, all checked
  through official-source web retrieval on 2026-06-04.
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
  clearly preserves current public PEO/PMW/IWS recall while treating PAE Mission Systems as current governance alignment.
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
  performance-attribute wording and the DoDI 5000.91 IPS list; manufacturing chapters now include summary and quick-review
  blocks, MRA/MRL and DFM/A board cues, escaped-defect/corrective-action handling, and consistent standalone subfile
  glossary handling.
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
  selection, source-selection practical, contract administration, cost/price evaluation, acquisition policy, and CIVPERS by
  adding focused Quick Review blocks grounded in each chapter's existing cited material. Added a first-screen Summary to
  AWP/SOVT so the chapter now has the same summary-plus-quick-review reading pattern as the other recently normalized
  chapters.
- Source basis: existing cited coursebook and official-source sets already present in the affected chapters; no new
  current-source or threshold claims were introduced in this structure/flow pass.
- Confidence: `High`
- Status: `applied`
