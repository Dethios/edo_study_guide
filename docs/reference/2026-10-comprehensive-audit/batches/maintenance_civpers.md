# Maintenance and CIVPERS audit

Current as of 2026-10-20. Baseline e8b2ef1. Research only; implementation is owned by the integrating agent.

PDF page numbers are authoritative below; most slide numbers coincide, but 6.1.2 diverges after PDF page 22.
All completed modules were read in extracted text and visually inspected in six-page, 1600-pixel-wide contact sheets
at original detail. Complex diagrams were read individually where necessary. Administrative/title/overview/review pages
are included in page ranges but are not independent learning objectives. Historical organization and pay tables are
not independently certified as current merely because they appear in a recent coursebook.

## 4.1.1 Fleet Maintenance Assets

Reviewed text and visuals: PDF pages 1-43, including image-only maps, organization charts, funding diagrams, and FY17
workforce graphs. Coursebook v6.0, 2025-12-08; citekey `edo-4-1-1-fleet-maint-assets-2025`.

Guide: `tex/chapters/19_Fleet_Maintenance_Assets.tex` (section Fleet Maintenance Assets).

| Objective | PDF pages | Guide subsection | Assessment |
| --- | --- | --- | --- |
| 1 O/I/D definitions | 4-8 | Organizational / Intermediate / Depot Level Maintenance; Maintenance Trends | Covered |
| 2 activities and product lines | 10-12, 14-17, 20, 24-28 | Maintenance Organizations through Regional Maintenance Centers | Covered; current org caveat required |
| 3 typical departments | 13, 18-19, 21-22, 26, 29 | Tender Repair Organization; Regional Maintenance Centers | Partial: tender numbering error; NSY/SRF/SUPSHIP departmental differences underdeveloped |
| 4 SUPSHIP vs RMC mission | 24, 28 | Supervisor of Shipbuilding; Regional Maintenance Centers | Covered |
| 5 reporting/funding | 31-36 | Funding and Reporting Chains; Responsibilities by Organization | Partial: actual fund-to-customer flow missing; legacy organization must be attributed |
| 6 workforce/training | 5, 38-42 | Workforce Composition and Training | Covered at board level; FY17 demographics correctly dated |

Correction M01: **Incorrect**, High confidence. Original guide assigns Outside Machinery to R-8 and QA to R-9.
PDF page 13 visibly assigns **R-8 Quality Assurance Officer; R-9 Outside Machinery Repair**. Swap those labels and
identify R-0 Repair Administration. Source: the cited coursebook diagram; no external current-command claim needed.

Gap M02: **Needs source / incomplete coverage**, High confidence for coursebook mapping. Add a compact comparison of
**typical legacy** departments: NSY engineering/planning 200, operations 300, production resources 900, nuclear
engineering/planning 2300; SRF engineering/planning 200, waterfront operations 300, production resources 900, lifting
and handling 700; SUPSHIP engineering 200, QA 300, contracts 400, comptroller 700, IT 800. Codes are coursebook examples,
not a promise that every current activity has this organization. Pages 18-19 show NNSY's split submarine/carrier
operations structure, so do not impose one chart universally.

Gap M03: **Ambiguous**, High confidence. The guide's D-Alt/K-Alt wording obscures the page-31 fund flow. These are
alteration categories, not appropriation account names. The diagram shows repair and Fleet D-Alt O&M,N through Fleet
Commands, TYCOM work authorization, and Program K-Alt OPN/WPN through SYSCOM/PARM/SPM with installation funding by
hull/alteration. Add this as a coursebook funding crosswalk and keep the OPN maintenance pilot separately qualified.
Current ownership/reporting changes are handled by the organization audit; preserve its 2026 PAE note.

Source limitations: the page-19 NNSY incumbents, 2020 maintenance trends, page-20 homeport fleet counts, and FY17 graphs
are historical examples. No new current roster or manpower claim is proposed. The public OPN pilot authority and
current NMP MOM/JFMM revision need separate current-source verification.

## 4.1.2 Navy Modernization Program

Reviewed text and visuals: PDF pages 1-28. Coursebook v6.1, 2026-03-18;
`edo-4-1-2-navy-modernization-2025`. Guide: `tex/chapters/20_Navy_Modernization_Program.tex`.

| Objective | PDF pages | Guide subsection | Assessment |
| --- | --- | --- | --- |
| 1 goals | 4-8 | Background; Goals and Attributes | Covered |
| 2 maintenance/repair/modernization | 6 | Goals of Modernization and Definitions | Covered |
| 3 legacy types/funding/documents | 11-18 | Legacy Alterations; SHIPALT Funding; AER; Legacy Documentation; Planning Yards | Covered at board level |
| 4 NMP funding/SCD/authority | 9, 20-26 | Modernization Funding; NMP Enhancements; NDE Entitled Process; SCD Initiation; Approval Thresholds | Partial: M03, M04, M05 |
| 5 scheduling/policy | 20, 25-27 | NDE-NM Capabilities; 10 USC 2244a | Covered; preserve prior statutory correction |
| 6 installing activities | 13, 17, 20 | Legacy SHIPALT Funding; Planning Yards; NMP Enhancements | Covered |

M04: **Ambiguous**, High confidence. Original fleet approval range assigns $50M-$200M to the 1-2-star board.
PDF24 actually says below $50M, above $50M and below $200M, above $200M; equality is not specified.
Proposed wording: "The coursebook depicts O-6 below $50M, 1-2-star above $50M and below $200M, and 3-star above $200M.
The slide does not resolve equality at $50M or $200M; confirm the current NMP MOM/delegation before routing a boundary
case." Do not manufacture inclusive boundaries from a range dash or claim that the inaccessible MOM verifies them.

M05: **Needs source / incomplete coverage**, High confidence. Image-only PDF26 adds the phase sequence absent from
current prose: I concept, II preliminary design, III detailed design (NDE-EP), DP3 procurement/installation planning
authorization, IV hull-specific certification/planning/risk management/readiness assessment, V execution/feedback
(NDE-NM). Add one compact coursebook process paragraph. Preserve the distinction between SCD initiation and approval.
The diagram permits submission at any pre-DP3 phase; that does not waive required review.

M03 also applies here: replace "D-Alt and K-Alt accounts" with Fleet/Program alteration categories and explicit funding
crosswalk. Exact current NMP MOM, installation threshold authority, and OPN pilot extension remain verification gaps.

## 4.1.3 Fleet Maintenance Policy and Implementation

Reviewed text and visuals: PDF pages 1-41. Coursebook v6.1, 2025-03-11;
`edo-4-1-3-fleet-maint-policy-2025`. Guide: `tex/chapters/21_Fleet_Maintenance_Policy_and_Implementation.tex`.

| Objective | PDF pages | Guide subsection | Assessment |
| --- | --- | --- | --- |
| 1 Navy maintenance policy | 4-7 | Fleet Maintenance Policy; Influences | Covered; .7N citation supersedes TLO's .7M |
| 2 RCM/CBM/TDM relationships | 8-11 | Maintenance Principles; Maintenance Philosophy | Covered |
| 3 documents and use | 12-18 | Depot Maintenance Framework | Covered |
| 4 CNO scheduling and approval | 17-29 | CNO Availability Scheduling; Public-Private Split; Budget and Special Cases | Covered with M06 correction |
| 5 maintenance strategies | 31-40 | Types of Availabilities; Maintenance Strategies; Optimized Fleet Response Plan | Covered with M07 qualification |

M06: **Incorrect**, High confidence. Original guide: "CVN refueling and contracted elements of public shipyard work
packages are excluded from the 50/50 calculation." Current statutes do not create a blanket public-yard contracting
exclusion. Replace with: "10 USC 2460 excludes procurement of major performance upgrades, aircraft-carrier nuclear
refueling or defueling and concurrent complex overhaul, and procurement (not installation) of safety-modification
parts from the depot-maintenance definition. Section 2474(f) separately excludes qualifying non-Federal workload
performed at a CITE pursuant to a public-private partnership; being part of a public-yard package alone is insufficient."
Preserve the existing section-2466 private-sector-ceiling explanation. Add national-security waiver by Secretary of
Defense, congressional notification, and nondelegability if a waiver is discussed.

Sources (all full official body retrieved 2026-10-20, OLRC current through PL119-120, 2026-10-07):

- Existing `USC-10-2466`: <https://uscode.house.gov/us/usc/119-118/t10/s2466/>.
- New `USC-10-2460`: <https://uscode.house.gov/us/usc/119-118/t10/s2460/>, section 2460(b).
- New `USC-10-2474`: <https://uscode.house.gov/us/usc/119-118/t10/s2474/>, section 2474(f).

M07: **Ambiguous**, High confidence. Original OFRP prose reads like a guaranteed universal 36-month/eight-month
schedule. Qualify as the coursebook's **notional** OFRP model; actual approved fleet/class/hull schedules and operational
direction control. The coursebook itself labels examples and identifies age-related availability-duration limitations
(PDF39-40). This retains board teaching without converting a planning model into an unconditional operational mandate.
Also attribute FAST/FMBOD N-code memberships to this coursebook and cross-reference current organization guidance.

Currency source: DONI official catalog lists OPNAVINST 4700.7N, 2024-12-05, Active (N83); signed PDF access rejected.
`OPNAVINST4700-7N` URL:
<https://www.secnav.navy.mil/doni/Directives/04000%20Logistical%20Support%20and%20Services/04-700%20General%20Maintenance%20and%20Construction%20Support/4700.7N.pdf>.
Thus version corroborated by official indexed metadata, not a new full-body policy audit. PDF18 is explicitly a
historical OPNAVNOTE example; PDF20-21 are FY16-20 workload illustrations and must not supply current schedules.

## 4.1.4 AIT Fundamentals and Lessons Learned

Reviewed text and visuals: PDF pages 1-23. Coursebook v6.0, 2025-12-15;
`edo-4-1-4-ait-fundamentals-2025`. Guide: `tex/chapters/22_AIT_Fundamentals_and_Lessons_Learned.tex`.

| Objective | PDF pages | Guide subsection | Assessment |
| --- | --- | --- | --- |
| 1 purposes/advantages | 4-5 | Alteration Installation Team; Purpose and Advantages | Covered |
| 2 lessons learned | 11, 22 | Need for RMMCO; Lessons Learned | Covered |
| 3 organizations/roles | 7-10, 12, 14-19, 21 | Roles and Responsibilities; Requirements; Planning; Execution | Covered with M08 precision |
| 4 MOA significance | 19-20, 22 | Memorandum of Agreement | Covered |

M08: **Ambiguous**, High confidence. The guide omits the OSIC's required status and conflates electronic/physical
check-in. Add "government civilian or military employee" to the OSIC definition (PDF8); the installation team itself
may contain contractors. State "electronic RMMCO check-in 30 days before installation, followed by physical check-in"
(PDF18). The image-only PDF15 flow explicitly separates those two check-ins and places in-brief, local training,
WAF/tag-out, execution, clearances, testing, training, configuration updates, ILS turnover and closeout in sequence.
The existing synthesis substantially covers this flow. Identify the 30-day teaching as coursebook guidance pending the
current controlling TS9090/NMP revision.

M09: **Incorrect / needs source**, High confidence for mismatch, Medium for exact revision date. Bibliography
`TS9090-310` claims 2023-06-01 while linking a file uploaded in 2018. Official indexed PDF text identifies
TS9090-310G and a 12 FEB 2015 date; no basis for 2023 retrieved. Replace the unsupported 2023 date with verified original
2015-02-12 and qualify Rev1's date as unverified unless title/change page is obtained. Preserve stable citekey and URL.
Official URL, indexed text available but live body 403 on 2026-10-20:
<https://www.navsea.navy.mil/Portals/103/Documents/NSWC_Dahlgren/FiberOptics/docrep_installation/9090-310GREV1.pdf?ver=2018-04-27-133951-417>.
Official older G PDF (original-date corroboration):
<https://www.navsea.navy.mil/Portals/103/Documents/NSWC_Dahlgren/FiberOptics/Appendix_H_TS9090-310G_Approved_2015-2-12.pdf>.
Do not present the 2015/2018 public copy as certification of the controlled October 2026 revision.

New source gap: official SUBMEPP ACN listing indexes **JFMM ACN 01-26, R 041949Z MAR26**. The current guide's RevD Chg5
reference does not mention this active notice. Listing <https://www.navsea.navy.mil/Home/SUBMEPP/Products/JFMM/ACN/>
was indexed but direct access 403 on 2026-10-20. Obtain and assess the ACN before calling the JFMM fully current;
no substantive change is inferred from the notice number alone.

## 4.1.5 Waterfront Organizations, Work Controls, and Safety

Reviewed text and visuals: PDF pages 1-55. Coursebook v6.1, 2026-03-12;
`edo-4-1-5-waterfront-orgs-work-control-safety-2025`. Guide: `tex/chapters/23_Waterfront_Organization_Work_Control_Safety.tex`.

| Objective | PDF pages | Guide subsection | Assessment |
| --- | --- | --- | --- |
| 1 NRRO mission/functions | 5-9, 12 | Naval Nuclear Propulsion Program; NRRO; Joint Test Groups | Covered; distinguish nuclear JTG oversight |
| 2 RPCO | 10-12 | Reactor Plant Contractors Office | Covered |
| 3 incidents/lessons | 14-15, 25-28, 32-35 | Origins; GUITARRO; MIAMI; BONHOMME RICHARD | M10 factual correction |
| 4 SUBSAFE | 16-20 | SUBSAFE Fundamentals; Level I Material | Covered |
| 5 DSS/FBW | 21-23 | Deep Submergence Systems; Fly-By-Wire | Covered |
| 6 6010 | 29-30 | Industrial Ship Safety Manual for Submarines | Partial: M12 explicit organizations/documents |
| 7 8010 | 36-39 | Industrial Ship Safety Manual for Fire Prevention and Response | Partial: M12 implementation cues |
| 8 work authorization | 41-49 | Work Authorization and Control | Covered including diagram principles |
| 9 maintenance tag-out | 51-53 | Tag-Outs; Repair Activity; Diver; Double Barrier | M11 wording; barrier thresholds need source qualification |

M10: **Incorrect**, High confidence. Original Summary/Origins says "loss of USS GRAYBACK" established DSS, following
incorrect slide15. Replace: "The loss of THRESHER prompted both SUBSAFE and the Deep Submergence Systems review effort.
The 1982 GRAYBACK diving accident killed five divers and strengthened diving-system design, safety analysis, and
certification controls; the submarine was not lost in that accident." Primary official indexed text: JFMM V Part III
Foreword 1.3, <https://www.navsea.navy.mil/Portals/103/Documents/SUBMEPP/Volume%20V.pdf> (older official edition, body
403); NAVSEA Faceplate Summer1983 p5 describes the accident and stricter certification,
<https://www.navsea.navy.mil/Portals/103/Documents/SUPSALV/faceplate/1983_Summer.pdf>; Faceplate April2007 p10 explains
THRESHER-era origin and later GRAYBACK reinforcement,
<https://www.navsea.navy.mil/Portals/103/Documents/SUPSALV/faceplate/April%202007.pdf>.
Proposed citekeys `navsea-faceplate-1983-grayback`, `navsea-faceplate-2007-dss`; published 1983/2007, accessed 2026-10-20,
official indexed text. These are historical evidence, not current technical operating authority.

M11: **Ambiguous**, High confidence. Original RA responsibility says "remove tags when no longer needed." Slide52
says **sign for their removal**. Replace with "verify repair-activity work no longer needs the isolation and sign for
clearance/removal through the authorized TUM process." Do not imply the RA can independently remove an isolation.
Also clarify NRRO oversight and RPCO's nonvoting advisory membership apply to the **nuclear** JTG (PDF12).
Slide53 specifies double-barrier thresholds at **200F or more** and **1000 psi or greater**; page55 does not restate
thresholds. If adding the numeric list, include sea-connected and penetration exceptions or refer to TUM Appendix G;
a truncated operational list could mislead. TUM revision/currency not independently confirmed in this pass.

M12: **Needs source / incomplete coverage**, High confidence for coursebook. Add compact board cues: 6010 establishes
SSO/SSC/SSW, Chief/Shift Test Engineers and nonnuclear JTG-HP&A/JTG-W, SPOD/DTS/high-risk prerequisites (PDF30).
For 8010 describe preavailability MOA, Fire Safety Council minimum FSO/vessel/engineering membership, complex periodic
fire drills, and authorized DFS/TMDER paths (PDF37-39). Identify 8010 Rev1 2023-08-30 as **coursebook-stated** date until
controlled title page is verified; principle-based implementation does not mean unrestricted local waiver authority.
Existing 6010/TUM citations remain access/currency limitations rather than newly certified requirements.

## 4.1.6 Battle Damage Assessment/Repair

Reviewed text and visuals: PDF pages 1-63. Coursebook v6.3, 2026-03-18; `edo-4-1-6-bdar-2025`.
Guide: `tex/chapters/24_Battle_Damage_Assessment_Repair.tex`.

| Objective | PDF pages | Guide subsection | Assessment |
| --- | --- | --- | --- |
| 1 career/readiness importance | 5-15 | Need; Guiding Documents and WARP | Covered; 1999/2023/2027 charts historical/projection only |
| 2 EDO roles | 22-23, 27-36, 38, 46 | Coursebook cue; MSP; Expeditionary Repair | Covered at conceptual level |
| 3 repair infrastructure | 22-23, 38-44, 46-47 | Expeditionary Repair Capabilities | M14 terminology correction |
| 4 continuum/organizations | 17-23 | BDA/R Continuum | Covered; overlapping phases explicit in diagram |
| 5 peace/war/technical authority | 22-25, 52-53 | Peacetime and Wartime Technical Authority; Disposition Factors | Covered conceptually; do not infer blanket waiver |
| 6 C2 | 29-36, 51-54 | Command and Control | Partial: M14 definitions/order distinction |
| 7 contested logistics | 40-41, 46 | Contested Logistics and Sustainment System | Covered conceptually |
| 8 people/parts/process | 20, 29-36 | MSP; Expeditionary Repair; Contested Logistics | Covered; package distinctions underdeveloped |
| 9 scenarios | 49, 62-63 | BDAR course-of-action checklist | Covered as decision framework, no operational scenario generated |
| 10 contracting | 56-58 | Contracting and Funding | M13 statutory correction; distinguish letter contract from all UCAs |
| 11 funding | 59-60 | Contracting and Funding | Covered; FY19 budget screenshot is historical |

M13: **Incorrect / outdated**, High confidence. Original guide/coursebook58 says all U.S.-based ships must be repaired
by U.S. companies and FDNF is the only exception. Current 10 USC8680 regulates shipyard **location**, with specified
exceptions including voyage repairs, hostile-action damage and deployed-vessel corrective/preventive maintenance
planned for no more than 21 days; subsection(a)(3)'s annual homeport workload cap applies. Separate LCS conditions,
homeport-transfer restrictions, AUKUS provisions and reporting also exist. Replace the company-nationality shorthand
with a bounded statutory summary and require contracting/legal review of actual exceptions. Source `USC-10-8680`,
<https://uscode.house.gov/us/usc/119-118/t10/s8680/>, official full indexed body current through PL119-120 (2026-10-07),
accessed 2026-10-20. Do not equate a letter contract with every UCA: it is one type; apply warranted CO authority,
required approval and definitization controls. Official DFARS216.603-2/3 and217.74 corroborate controls (2026-05-07
change displayed): <https://www.acquisition.gov/dfars/216.603-2-application.>,
<https://www.acquisition.gov/dfars/216.603-3-limitations.>.

M14: **Incorrect / incomplete coverage**, High confidence. The current source has EMRF/EMRC terminology, not the
unsupported SIB label in the guide. Replace SIB with the coursebook's tiered expeditionary equipment concept and
explain FDSRT = personnel, EMRF = facility assembled from EMRCs, EMRU = team/equipment under operational command.
Give conceptual differences among augmentation, independent, robust, lean and austere packages without reproducing
sensitive operational force sizing or architecture. Add OPCON/TACON/ADCON/DIRLAUTH definitions and emphasize that
coordination permission is not command authority. The PDF51-52 notional theater/MOC charts place maintenance in the
logistics coordination function; exact theater arrangements are order-dependent. PDF54 distinguishes planning orders
from execution authorization; add this board-level principle without treating historical JP table as current orders.
The March2023 force comparison, 2027 projection, container drawings and FY19 budget table are inspected historical
illustrations, not fresh intelligence or operational planning inputs.

## 4.2.1 CNO Availability Planning

Reviewed text and visuals: PDF pages 1-41. Coursebook v6.2, 2026-03-18;
`edo-4-2-1-cno-availability-planning-2025`. Guide `tex/chapters/25_CNO_Availability_Planning.tex`;
related `tex/chapters/28_AWP_and_SOVT.tex`.

| Objective | PDF pages | Guide subsection/label | Assessment |
| --- | --- | --- | --- |
| 1 balancing requirements | 4 | Summary; Pre-Start Goals | Covered |
| 2 five work sources | 10 | Sources of AWP Work Candidates | Preserve broader JFMM list; add exact five-bucket coursebook cue |
| 3 AWP development | 12-17 | Public/RMC AWP Development | Covered; slides13/14 differ and explicitly require platform guidance |
| 4 planning products | 19-28 | Work Definition; Integrated Schedule; tab:availability-planning-products | M15 CU terminology |
| 5 team roles | 31-34 | Planning Team Roles | Covered; diagram includes supporting specialists |
| 6 platform differences | 6-8, 29 | Platform Differences; tab:availability-planning-comparison | Covered |
| 7 MACMO benefits | 36-38 | RMC Contracting Strategy | M16 current law correction |
| 8 organizations | 13, 16, 29, 31-34 | AWP Development; Team Roles | Covered |
| 9 pre-start goals | 11 | Pre-Start Planning Goals | Covered |
| 10 critical-path identification | 22-25 | Critical and Controlling Paths | Definition covered; add worked dependency example |

M15: **Incorrect / incomplete coverage**, High confidence. The planning-products table says "Control Unit" while
correct prose and slide20 say **Component Unit**. Correct both table rows. Add a short worked critical-path example
with task durations and dependencies; definitions alone do not exercise TLO10. Preserve prior AWP/JFMM refinements
but call them the **cited public JFMM edition**, not independently current operational deadlines. Source images13/14
explicitly disagree (A-21 initial versus A-14to12 preliminary) and warn that timelines vary. Add exact five source
buckets as coursebook mnemonic alongside, not replacing, the richer JFMM list. PDF25 dates are 2014-16 examples.

M16: **Outdated**, High confidence. Original guide says 10+ month CNO availabilities compete coast-wide and under10
award at homeport. Current **10 USC8669a(c)(4) defines short-term work as 18 months or less**. Public Law118-159
(2024-12-23) changed10→12; PL119-60 §1012 (2025-12-18) changed12→18. If adequate homeport competition exists, subsection
(c) requires solicitation and award to firms performing the work there; voyage repairs are excepted. Replace the
unconditional10month policy with this statutory rule, identify PDF38 as historical coursebook strategy and state
actual solicitations/current approved strategies control. Also avoid presenting FFP as universal: PDF36 itself lists
limited cost-plus cases. New citekey `USC-10-8669a`, <https://uscode.house.gov/us/usc/119-118/t10/s8669a/>, full official
body retrieved 2026-10-20, current through PL119-120 (2026-10-07).

M13 verification strengthened: full official body of section8680 also retrieved on 2026-10-20; current geography
includes Commonwealth of Northern Mariana Islands after PL119-60 §1014 (2025-12-18).
