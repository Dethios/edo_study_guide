# Acquisition Policy Audit - October 20, 2026

Current as of 2026-10-20. Baseline commit: `53311a4`.

## Scope and Method

This audit compared the guide's acquisition-policy claims with current official issuances, statutes,
regulations, and agency policy information. The audit concentrated on statements that determine an
answer: applicability, approvals, deadlines, thresholds, reporting, exceptions, and mandatory artifacts.
It also screened source versions across acquisition pathways, engineering, cybersecurity, cost,
sustainment, testing, workforce certification, and selected fiscal-law and contracting summaries.
Leadership changes and the TOC corrections from the preceding update remain in place.

Statutes control when an older instruction still prints superseded thresholds or terminology. Strategy
announcements do not by themselves cancel statutory or instruction requirements. Official source text
was distinguished from secondary summaries, which were used only to locate primary-source links.

Some ESD and DPCAP pages returned 403/502 errors. Official indexed issuance text and catalogs supported
version checks and specific quoted sections, but this is not a claim that every current PDF was fully
retrieved or every page of the coursebook was independently recertified. The source ledger records the
access mode. Current OLRC statute bodies, the official CAS final-rule PDF, SBA's live award-limit page,
and the original government-hosted EVM deviation were retrieved and read.

## Coverage and Disposition

| Topic                     | Primary comparison                                                                        | Disposition                                                                                                                               |
| ------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| Framework and pathways    | 5000.02 CH2; .85; .74; .75; .80; .81; .87; 10 USC3041/4201/3602/3603                      | Corrected versions, strict dollar boundaries, exclusions, MTA and software rules.                                                         |
| Requirements              | Joint Staff catalogs for 5123.01J CH1 and 5123.01A; supplied JFRP coursebook              | Corroborated versions; retained coursebook provenance for detailed JFRP steps and tailored performance attributes.                        |
| AoA and milestones        | 5000.84 sections 2-3; .85; unit-cost statutes4371/4374/4376                               | Corrected decision authority and reporting clocks; separated program APB values and unit-cost breaches.                                   |
| Contracting/pricing       | DPCAP revision register; 10 USC3014/3702; TINA Lite policy; current FAR threshold page    | Corrected revision cues and statutory exemptions; added current CAS and TINA Lite distinctions.                                           |
| EVM                       | Original official deviation, current revision register, FY2026 Section1826 statutory note | Retained verified $50M/$100M baseline crosswalk with contract-type/exemption screens; current exact attachment verification remains open. |
| Fiscal law                | 10 USC3133 and existing funding/FMR framework                                             | Corrected severable-service cross-year authority; no blanket change to appropriation periods or purpose/time/amount rules.                |
| Cost estimating           | 5000.73 October2024; 5000.04 CSDR manual                                                  | Existing cost-position/CARD versus CSDR distinction retained; no replacement of current2024 cost instruction found in checked sources.    |
| Engineering               | 5000.88 sections1-3; .97 sections1-3                                                      | Corrected SEP approval chain, digital applicability, and historical DAG framing.                                                          |
| Cybersecurity             | 8500.01 CH1; 8510.01 July2022; 5000.90; new8430.01 catalog/library listing                | Existing RMF/acquisition integration retained; new software issuance flagged without inventing unread detailed mandates.                  |
| Sustainment/manufacturing | 5000.91 section 7; 4245.15 CH1 September2025; existing RAM/MRL guidance                   | Added LCSP cadence and proactive DMSMS/software obsolescence; kept maturity metrics distinct from universal legal gates.                  |
| Test and evaluation       | 5000.89 original; .98; DOT&E2024 manual set; 5000.103 February2026; 10 USC4172            | Corrected version metadata, LFT coverage and waiver; preserved current OT/DT separation and cyber-DT manual.                              |
| Workforce                 | 5000.66 July2017 CH3 March2022; existing Navy/DAU billet-specific guidance                | Corrected original/change-date metadata; retained functional-area and assignment-specific certification caveats.                          |
| R&D and innovation        | Live SBA page, 10 USC3602/3603, current CAS/contract exemptions                           | Updated October16 SBIR award ceilings; no automatic equation of prototype tools with ordinary contracts.                                  |

## Corrections

### 1. Instruction Versions

- Original claim: Several 5000-series references invent change numbers/dates or use the change date as original
  publication.
- Status: **Incorrect**. Confidence: **High**.
- Correction: Correct 5000.74 (2020/CH1 2021), .75 (2017/CH2 2020), .80 (CH1 Nov 2024), .81 (original 2019), .87
  (original 2020), .88 (Nov18 2020), .89 (Nov19 2020), and .66 (2017/CH3 2022).
- Reason: Official indexed titles and revision fields disagree with the former bibliography; current 5000.02 CH2 is
  linked explicitly.
- Location: `tex/edo.bib; docs/study_memory/sources.md; tex/chapters/15_policy.tex`.
- Source basis: [Official ESD Instruction Catalog](https://www.esd.whs.mil/Directives/issuances/dodi/dodm/).

### 2. Issuance Identifiers

- Original claim: Every DoD instruction/directive/manual is automatically relabeled DoWI/DoWD/DoWM.
- Status: **Incorrect**. Confidence: **High**.
- Correction: Preserve published DoDI/DoDD/DoDM identifiers for unchanged issuances; use DoWI for the actual revised
  5000.02 and new 8430.01.
- Reason: An agency name change does not rewrite every source title.
- Location:
  `tex/acronyms.def; tex/edo.bib; tex/chapters/15_policy.tex; tex/chapters/17D_Software_Acquisition_Environment.tex; tex/chapters/appendix_key_roles.tex`.
- Source basis: [Official ESD Instruction Catalog](https://www.esd.whs.mil/Directives/issuances/dodi/dodm/).

### 3. Category Boundaries

- Original claim: MDAP and major-system expenditure tests say at least $1B/$4.5B and $275M/$1.3B;
  software/business-system exclusions are simplified.
- Status: **Incorrect**. Confidence: **High**.
- Correction: Use strictly more than the statutory FY2024 amounts, designation, pathway exceptions, and the specific
  software/covered-hardware designation rule.
- Reason: Current statutes control the dollar boundaries and exclusions.
- Location: `tex/chapters/15_policy.tex`.
- Source basis:
  [10 U.S.C. 4201: Major defense acquisition programs: definition and exceptions](https://uscode.house.gov/us/usc/119-118/t10/s4201/);
  [10 U.S.C. 3041: Major system](https://uscode.house.gov/us/usc/119-118/t10/s3041/);
  [10 U.S.C. 3603: Software acquisition pathways](https://uscode.house.gov/us/usc/119-118/t10/s3603/).

### 4. MTA Codification

- Original claim: The guide lists an old MTA instruction revision without the current statutory crosswalk.
- Status: **Outdated**. Confidence: **High**.
- Correction: Add 10 U.S.C. 3602 timing objectives, approved subsequent iteration periods, and written USD(A&S) approval
  under the instruction for programs above current MDAP dollar thresholds.
- Reason: The codified authority and updated instruction are needed together; extra periods are not automatic.
- Location: `tex/chapters/16_Milestones.tex; tex/edo.bib`.
- Source basis:
  [10 U.S.C. 3602: Middle tier acquisition for rapid prototyping and fielding](https://uscode.house.gov/us/usc/119-118/t10/s3602/);
  [10 U.S.C. 4201: Major defense acquisition programs: definition and exceptions](https://uscode.house.gov/us/usc/119-118/t10/s4201/).

### 5. AoA Authority

- Original claim: CAPE approves the AoA and preferred solution.
- Status: **Incorrect**. Confidence: **High**.
- Correction: For MDAPs CAPE approves the study plan and assesses adequacy/compliance; the MDA selects the materiel
  solution.
- Reason: The instruction separates assessment authority from acquisition decision authority.
- Location: `tex/chapters/16_Milestones.tex`.
- Source basis: [Analysis of Alternatives](https://www.esd.whs.mil/Portals/54/Documents/DD/issuances/dodi/500084p.pdf).

### 6. Unit Cost Clocks

- Original claim: Congressional notification is described as due within 45 days of a generic Program Deviation Report.
- Status: **Incorrect**. Confidence: **High**.
- Correction: Apply 10 U.S.C. 4374: 45 days after quarter-end for a quarterly unit-cost report, or 45 days after the
  immediate section 4373 report. Keep APB deviations, unit-cost breaches, and critical-breach reassessment distinct.
- Reason: Different reports create different statutory clocks; an APB deviation is not the same event.
- Location: `tex/chapters/16_Milestones.tex`.
- Source basis:
  [10 U.S.C. 4374: Unit cost breach determinations and reports to Congress](https://uscode.house.gov/us/usc/119-118/t10/s4374/);
  [10 U.S.C. 4376: Critical breach reassessment and termination presumption](https://uscode.house.gov/us/usc/119-118/t10/s4376/).

### 7. APB Values

- Original claim: Performance threshold is said to equal objective by default, with automatic 10 percent cost and
  six-month schedule values.
- Status: **Ambiguous**. Confidence: **Medium**.
- Correction: Use the approved program APB threshold/objective pairs. The coursebook figures are recall conventions, not
  authority to manufacture missing program values.
- Reason: The audit did not verify a universal statutory default; program-specific approved thresholds control.
  Coursebook source remains cited in the guide.
- Location: `tex/chapters/16_Milestones.tex`.
- Source basis: supplied 3.3.2 Acquisition Milestones and Phases coursebook and the program-specific APB distinction.

### 8. Live Fire Coverage

- Original claim: Every new or upgraded crew-occupied platform or missile-defense component is treated as automatically
  covered by statutory live-fire testing.
- Status: **Incorrect**. Confidence: **High**.
- Correction: Apply section 4172 covered-system, munitions/missile, and product-improvement definitions, any
  designation, and the beyond-LRIP testing/reporting gate.
- Reason: Statutory coverage is defined more precisely than the previous broad label.
- Location: `tex/chapters/18B_test-eval.tex`.
- Source basis:
  [10 U.S.C. 4172: Live-fire testing and waiver requirements](https://uscode.house.gov/us/usc/119-118/t10/s4172/).

### 9. Live Fire Waiver

- Original claim: Unmanned status, expense or impracticality, or adequate alternatives can independently justify a
  live-fire waiver.
- Status: **Incorrect**. Confidence: **High**.
- Correction: Require the statutory determination that testing would be unreasonably expensive and impractical,
  congressional certification, an alternative evaluation plan, and applicable timing and approval/delegation rules.
- Reason: Unmanned status is not itself the statutory waiver test.
- Location: `tex/chapters/18B_test-eval.tex`.
- Source basis:
  [10 U.S.C. 4172: Live-fire testing and waiver requirements](https://uscode.house.gov/us/usc/119-118/t10/s4172/).

### 10. Software Statute

- Original claim: Software pathway programs can never be MDAPs, and Clinger-Cohen alone explains software acquisition
  authority.
- Status: **Outdated**. Confidence: **High**.
- Correction: Add current section 3603 software and covered-hardware scope, the specific designation exception, annual
  delivery, and the embedded-system representative-environment distinction.
- Reason: Current statute and the original pathway instruction must be read together.
- Location: `tex/chapters/17D_Software_Acquisition_Environment.tex`.
- Source basis: [10 U.S.C. 3603: Software acquisition pathways](https://uscode.house.gov/us/usc/119-118/t10/s3603/);
  [10 U.S.C. 4201: Major defense acquisition programs: definition and exceptions](https://uscode.house.gov/us/usc/119-118/t10/s4201/).

### 11. SEP Approval

- Original claim: Every SEP is approved by the MDA at each milestone starting with Milestone A.
- Status: **Incorrect**. Confidence: **High**.
- Correction: Use DoDI 5000.88: USD(R&E) or designee for ACAT ID, MDA or designee for IB/IC, and CAE-designated
  authority otherwise. Approve before major-phase RFPs, with applicable tailoring, waivers, and updates.
- Reason: The specific official indexed DoDI 5000.88 section 3.4 text supplies this split; coursebook summary was
  overbroad.
- Location: `tex/chapters/17G_Systems_Engineering_Overview.tex`.
- Source basis: [DoDI 5000.88, section 3.4](https://www.esd.whs.mil/Portals/54/Documents/DD/issuances/dodi/500088p.PDF),
  indexed official text.

### 12. Digital Engineering

- Original claim: Systems engineering relies on the DAG and DoDI 5000.88 without the digital-engineering applicability
  rule.
- Status: **Outdated**. Confidence: **High**.
- Correction: Treat the DAG as historical guidance. Add DoDI 5000.97: programs initiated after December 21, 2023
  incorporate digital engineering unless excepted; earlier programs may adopt it when practical, beneficial, and
  affordable.
- Reason: Current functional policy establishes applicability and model/data controls.
- Location: `tex/chapters/17G_Systems_Engineering_Overview.tex`.
- Source basis: [Digital Engineering](https://www.esd.whs.mil/Portals/54/Documents/DD/issuances/dodi/500097p.PDF).

### 13. Sustainment Currency

- Original claim: The LCSP is only described as a living document, and current RAM requirements cite the old JCIDS
  manual.
- Status: **Outdated**. Confidence: **High**.
- Correction: Add the DoDI 5000.91 MCA update cadence, current Service/JFRP requirements, and DoDI 4245.15 Change 1
  proactive DMSMS management, including software.
- Reason: The new guidance supplements, rather than discards, legacy RAM vocabulary.
- Location: `tex/chapters/17J_Acquisition_Logistics.tex`.
- Source basis:
  [Diminishing Manufacturing Sources and Material Shortages Management](https://www.esd.whs.mil/Portals/54/Documents/DD/issuances/dodi/424515p.PDF);
  [Joint Staff Instruction Catalog: CJCSI 5123.01J](https://www.jcs.mil/library/cjcs-instructions/?udt_46626_param_direction=descending&udt_46626_param_orderby=Current_x0020_as_x0020_of).

### 14. Annual Service Funding

- Original claim: The annual-funding exception for cross-year services is described primarily in terms of nonseverable
  services.
- Status: **Ambiguous**. Confidence: **High**.
- Correction: Separate section 3133 severable-service contracts with periods not exceeding one year from nonseverable
  complete undertakings funded according to bona fide need and award timing.
- Reason: Crossing a fiscal-year boundary is not enough to determine the funding answer.
- Location: `tex/chapters/9_Program_Funding_and_Execution.tex`.
- Source basis:
  [10 U.S.C. 3133: Severable service contracts crossing fiscal years](https://uscode.house.gov/us/usc/119-118/t10/s3133/).

### 15. SBIR Ceilings

- Original claim: Current Phase I and Phase II limits are described through older $275K and $1.8M ranges.
- Status: **Outdated**. Confidence: **High**.
- Correction: Use the SBA October 16, 2026 no-waiver ceilings of $335,937 and $2,239,578, including modifications.
  Solicitations and approved waivers control actual awards.
- Reason: Live SBA body was newer than the search cache April values.
- Location: `tex/chapters/17A_Research_and_Development.tex`.
- Source basis: [SBIR and STTR: Current SBA Award Limits](https://www.sbir.gov/about).

### 16. CAS October Rule

- Original claim: Cost analysis lacks the October 2026 CAS threshold update.
- Status: **Outdated**. Confidence: **High**.
- Correction: Add the effective October 1 rule: a basic exemption through $35M, $100M full-coverage and Disclosure
  Statement thresholds, removal of the $7.5M trigger, and transition/exemption caveats.
- Reason: This is a final effective rule, not the March proposal.
- Location: `tex/chapters/13C_cost-price-eval.tex`.
- Source basis:
  [Increase of Monetary Thresholds and Other Matters Related to Cost Accounting Standards Program Requirements](https://www.govinfo.gov/content/pkg/FR-2026-09-01/pdf/2026-17901.pdf).

### 17. MSAR Transition

- Original claim: Annual SAR and the old quarterly trigger list are taught as the complete current reporting answer.
- Status: **Outdated**. Confidence: **High**.
- Correction: Explain section 4351(j) termination after FY2023 and the MSAR transition. Retain separate cost-growth
  duties and current program-specific submission guidance. Reconcile the T&E ACAT table and policy Quick Review.
- Reason: The termination clause must not be ignored; it does not cancel Nunn-McCurdy requirements.
- Location: `tex/chapters/15_policy.tex`.
- Source basis: [10 U.S.C. 4351: Selected Acquisition Reports](https://uscode.house.gov/us/usc/119-118/t10/s4351/);
  [Department of Defense Selected Acquisition Reports: MSAR Transition](https://www.defense.gov/News/Releases/Release/Article/3535172/department-of-defense-selected-acquisition-reports-sars/);
  [10 U.S.C. 4374: Unit cost breach determinations and reports to Congress](https://uscode.house.gov/us/usc/119-118/t10/s4374/).

### 18. Nontraditional Exemptions

- Original claim: EVM, certified-data, and FAR Part 31 rules omit FY2026 statutory exemptions for nontraditional defense
  contractors.
- Status: **Outdated**. Confidence: **High**.
- Correction: Screen section 3014 status and the Section 1826 exemptions first. Only an authorized written waiver or
  partial application may reimpose the listed requirements.
- Reason: Full statutory note was read independently of the blocked revised deviation bodies.
- Location: `tex/chapters/14_EVM.tex; tex/chapters/13C_cost-price-eval.tex`.
- Source basis:
  [10 U.S.C. 3014: Nontraditional defense contractor and FY2026 exemption note](https://uscode.house.gov/us/usc/119-118/t10/s3014/).

### 19. RFO Revisions

- Original claim: Winter Part 215 and Part 234 memoranda are cited as current without their July and August revisions.
- Status: **Outdated**. Confidence: **Medium**.
- Correction: Update revision metadata and index-based currency cues; add the standing section 3709 TINA Lite authority.
  Label precise EVM prescriptions verified only in the original deviation as a baseline pending current attachment
  verification.
- Reason: Revision metadata and statute are verified; full current attachments remain an explicit access gap.
- Location: `tex/edo.bib; tex/chapters/15_policy.tex; tex/chapters/14_EVM.tex; tex/chapters/13C_cost-price-eval.tex`.
- Source basis:
  [DFARS Revolutionary FAR Overhaul Class Deviations](https://www.acq.osd.mil/dpap/dars/dfars_far_overhaul_class_deviations.html);
  [DPCAP Pricing Topics: TINA Lite](https://www.acq.osd.mil/asda/dpc/pcf/pricing-topics.html).

### 20. JFRP Tailoring

- Original claim: The coursebook performance-attribute scan can be read as a universal Joint Staff approval gate.
- Status: **Ambiguous**. Confidence: **High**.
- Correction: Qualify the checklist with current Component-approved requirements and tailoring; corroborate CJCSI
  5123.01J Change 1 and CJCSM 5123.01A in Joint Staff catalogs, and align the existing question answers.
- Reason: The supplied coursebook already grants Service requirements approval; public catalogs now corroborate
  governing document versions.
- Location: `tex/chapters/16_Milestones.tex; tex/chapters/17K_jcids.tex; docs/study_memory/question_bank.jsonl`.
- Source basis:
  [Joint Staff Instruction Catalog: CJCSI 5123.01J](https://www.jcs.mil/library/cjcs-instructions/?udt_46626_param_direction=descending&udt_46626_param_orderby=Current_x0020_as_x0020_of);
  [Joint Staff Manual Catalog: CJCSM 5123.01A](https://www.jcs.mil/Library/CJCS-Manuals/udt_48785_param_orderby/Pub_x0020_Date_UDT_Value/udt_48785_param_direction/ascending/FileID/304515/).

## Open Verification Limits

- **Needs source - DoWI8430.01 detailed implementation:** the official ESD/CIO listings confirm the
  September 8, 2026 issuance, but its full body was blocked. No new authorization deadline or detailed
  software-evidence mandate has been inferred from vendor summaries.
- **Needs source - current RFO attachments:** the official register confirms July/August revisions,
  but the current signed PDFs were unavailable. Statutory nontraditional-contractor exemptions were
  independently verified in the full OLRC text. The older EVM PDF is explicitly a baseline crosswalk,
  not proof that every detailed clause or deadline is unchanged in Revision 1. Obtain the current
  attachment before using exact clause prescriptions in a live acquisition.
- The current detailed MSAR preparation memorandum was not retrieved. The guide corrects the legacy
  statutory-reporting claim using 4351(j) and the official transition release, without inventing a
  new universal MSAR suspense date.
- Many older references outside this acquisition-policy audit retain older access dates. Passing a
  source-ledger check establishes provenance coverage, not a live validation of every linked source.

## Verification and Review

A fresh independent reviewer checked the substantive changes against the recorded primary-source
research. Two EVM findings were corrected: preserve the cost/incentive contract scope and place the
baseline/current-revision qualification before the dollar list. Existing performance-attribute study
answers were reconciled with the JFRP tailoring caveat; no new drill questions were generated.

The rendered review found an orphaned live-fire waiver label; the final PDF confirms that a local space
guard keeps the label with its explanation. Affected tables, policy passages, and the three-page TOC were
visually inspected. The larger bold small-caps TOC hierarchy is preserved.

- Native LuaLaTeX produced the 471-page PDF; a final build invocation completed successfully with no
  remaining work. Docker daemon access was unavailable, so the native fallback was used.
- The final engine log contains no overfull boxes, missing characters, unresolved citations, or rerun
  requests. Existing font substitution warnings remain for Fira Sans SemiBold and some non-TOC small caps.
- A full-document text-boundary scan found no text outside the defined margins and no zero-valued
  citation placeholders. Only the two pages around the repaired waiver label changed after the preceding
  complete rendered review.
- Acronym, TeX structure, study-memory, cited-source ledger, TikZ cache, Markdown, and whitespace checks
  passed. The independent substantive review findings described above were resolved.
- The report-only active-citation metadata audit reports 380 weak items among 490 active citekeys,
  chiefly older access dates. This remains a bibliography maintenance backlog, not evidence that all
  those claims are incorrect; it also prevents claiming that every source was freshly revalidated.
- Final PDF SHA-256: `7f4e507c5ebaec3d13a9eba0835e253fce21bf63bd23e2236a840d33d9cfec41`.
