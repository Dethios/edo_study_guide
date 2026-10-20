# Resource management and acquisition requirements audit

Current as of 2026-10-20. Reviewer: requirements_audit. Baseline: e8b2ef1.

This is a resumable batch report. Page numbers below are **one-based PDF pages**, not necessarily the printed slide
number. Reviewed text is corroborated against rendered six-slide contact sheets; image-only diagrams are inspected.
The PPBE PDF omits printed slide 28: PDF pages 28-40 display slide numbers 29-41. Coverage is never inferred from
extraction or similarity alone. Parent authorized implementation in the assigned chapters. Shared bibliography and main files remain root-owned.
Implemented corrections below use existing keys or the proposed `requirements-new.bib` entries.

## 3.1.1 PPBE

- Edition: 6.3, 2026-09-29; 40 PDF pages. Citekey: `edo-3-1-1-ppbe-2025` (stable key, current PDF).
- Text and visual coverage: 1-40 inclusive; seven contact sheets in `artifacts/audit/requirements/3.1.1/`.
- Guide comparison: all of `tex/chapters/6_PPBE.tex`.

| Learning objective / topic | PDF pages | Guide section or label | Disposition |
| --- | --- | --- | --- |
| 1 Financial management flow | 4, 9, 37-40 | Role, timeline, execution; `fig:ppbe_timeline` | Core flow covered; explain execution feedback |
| 2 PPBE acquisition role | 5-8 | Role; timeline and DAS | Covered; current WAS naming should be consistent |
| 3 Phases, products, timelines | 6-9, 19-22, 28-38 | Phase sections; `tab:ppbe-review-artifacts` | Covered except review-level ambiguity below |
| 4 FYDP, MFP, PE | 11-17, 39 | FYDP structure / Program elements | Definitions covered; image-only PE decoding absent |
| 5 Planning, CPR, DPG | 19-20, 39-40 | Planning phase and key documents | Covered; retains separate signatories |
| 6 POM, PDM, program review | 22, 28-29, 40 | Programming phase; review artifacts | Three-star forum conflated with Navy-only review |
| 7 Navy POM participants | 23-27 | Navy process; organization update; resource tables | Current summary conflicts with dated update |
| 8 BES, PBD, reclama | 31-35, 40 | Budgeting events; PBDs and reclamas | Covered; keep precise PB statutory window |
| Cover, TLOs, agenda, synthesis | 1-3, 10, 18, 21, 30, 36, 38-40 | Summary and Quick Review | Reviewed; no administrative addition needed |

### Required corrections and exact proposed text

1. **Outdated / High (coursebook alignment):** Summary says "N8/N80 integrates ... N9 sponsors" without the current
   September transition used later in the same chapter. Quick Review and core-organizations table repeat the conflict.
   Replace current recall text with: "In the September 2026 coursebook structure, RCP leads integration and balancing
   of the Navy POM; OWA integrates operational and warfare-system requirements. N8/N80 and N9 remain useful legacy
   crosswalks. FMB/N82 supports budget formulation, defense, and execution, rather than validating requirements."
   Cite `edo-3-1-1-ppbe-2025`, PDF 23-26. Apply consistently to current summary, exercise, flow narrative, and recall;
   preserve explicitly dated legacy tables. The underlying transition's complete official billet chart is unverified.
2. **Incorrect / High (diagram reading):** `tab:ppbe-review-artifacts` calls the pictured 3-star forum "Internal Navy".
   PDF 28 and 32 explicitly show OSD/OSW review, CAPE, three-star programmers, and DMAG/SLRG, not a Navy-only sequence.
   Replace with: "Department-level three-star program review evaluates CAPE issue-team proposals and develops
   recommendations for the senior department decision forum. Distinguish this review from the Navy's internal
   programming reviews before submission." Cite the coursebook PDF 28-29, 32; do not invent current charter membership.
3. **Missing / High:** Add to Program elements: "The coursebook's example PE 0602709A decodes as MFP 06 (Research and
   Development), budget activity 02 (Applied Research), unique element identifier 709, and component A (Army).
   This is an illustrative RDT&E PE; do not assume every PE or appropriation uses the same budget-activity mapping."
   Cite `edo-3-1-1-ppbe-2025`, PDF 17. This fact was absent from extracted text.
4. **Ambiguous / High:** The DDG 1000 POM example names PEO IWS 9.0 as though current although that example is absent
   from the refreshed 40-page PDF. Preserve it only as a dated legacy illustration with its retained source; do not
   cite the current edition as though it contains those four PEs. Existing POM resource arithmetic is correct ($243M).

### Source conflicts and access

- Coursebook PDF 38 says programming costs force objectives for six years, conflicting with PDFs 11, 22, 31 (BY+4).
  Guide correctly uses statutory BY plus at least four succeeding years; do not copy the six-year summary.
- PDF 15 says "three military services" but depicts military departments; guide avoids reproducing that error.
- Coursebook PDF 34 says USW(FM&C), unlike PDF 28's USW(C). Guide's Comptroller lane is the defensible generic answer.
- Public primary retrieval attempted 2026-10-20: DoDD 7045.14 (2013-01-25, CH1 2017-08-29),
  <https://www.esd.whs.mil/Portals/54/Documents/DD/issuances/dodd/704514p.pdf>, returned 403. Official executive-agent
  page indexed text continues to cite it: <https://dod-executiveagent.osd.mil/>. This confirms continued citation,
  not full-body revalidation. Existing statutory sources (10 USC 221; 31 USC 1105) retained from prior audit.
- Budget top line in the guide is explicitly FY2026 request, not a live FY2027/enacted total; no silent date refresh.
- Implementation status: pending parent integration. No guide mutation by this reviewer.

## 3.3.3 Joint Force Requirements Process

- Edition: 7.0, 2026-09-30; 37 pages. Citekey: `edo-3-3-3-jfrp-2026`.
- Text and visual coverage: 1-37 inclusive; seven contact sheets. Dense excerpt enlargement recorded separately below.
- Guide comparison: all of `tex/chapters/17K_jcids.tex`; current label `sec:jfrp`.

| Objective / topic | PDF pages | Guide section / label | Disposition |
| --- | --- | --- | --- |
| 1 WAS interface and governing documents | 2, 4-5, 11, 17-18, 23 | Summary; `tab:jfrp-documents` | Covered with MCA limitation |
| 2 CGA | 13-16 | Capability Gap Assessment | Covered; CGA not universal CBA rename |
| 3 Reform rationale | 7-8 | Why JFRP Replaced JCIDS | Covered |
| 4 Documents / phases | 17-23, 36 | `tab:jfrp-documents` | Covered; image approval nuance below |
| 5 Five components | 9-10 | Five Core Components | Covered |
| 6 Materiel and non-materiel | 14-18, 23 | Materiel and Non-Materiel Solutions | Covered; source error flagged |
| 7 JROC / governance | 25-27, 30-31, 33-35, 37 | Joint Governance; resourcing | Covered; image staff crosswalk absent |
| 8 IT requirements | 28-29 | Information Technology and Interoperability | Covered as coursebook-specific claims |
| 9 C4I / allied interoperability | 28-29, 37 | Information Technology and Interoperability | Covered |
| 10 Warfighter gaps / tools | 13, 23, 30-31, 37 | CGA; team effort; warfighter participation | Covered |
| Cover, TLOs, transitions, questions | 1-3, 6, 12, 19, 24, 32, 36-37 | Summary / Quick Review | Reviewed; hidden extraction answers handled |

### Disposition and proposed additions

The preceding refresh substantively covers all ten objectives. Preserve its careful source qualifications and its
separation of requirements approval, acquisition decisions, appropriation availability, and contract authority.

- **Missing / High (image reading):** Add under document approval: "The coursebook's materiel-solution flow shows the
  Service Chief or designee approving the initial requirement after staffing under Service policy. That requirements
  decision is distinct from the MDA's acquisition decision." Source: PDF 17 image; cite `edo-3-3-3-jfrp-2026`.
- **Optional clarification / High:** PDF 25 identifies Joint Staff J-8 (Force Structure, Resources, and Assessment) as
  the acquisition interface, and J-6 as the C4/computing/cyber lane. Add that functional distinction if desired, but do
  not reproduce its stale JCS membership diagram (which omits Space Force) as a current organizational chart.
- **Retained correction / High:** PDF 14 mislabels an acquisition-program definition under non-materiel solution;
  guide correctly resolves against PDFs 15-16. PDF 27's parenthetical ties JROC establishment to the 1986 act; guide
  appropriately does not repeat that historical claim. PDF 36 text extraction includes both JFRP and JCIDS, but the
  rendered student-facing slide hides answer text; preserve JFRP answer from PDFs 7-10.
- **Needs source / Medium:** Coursebook statements that architecture views are mandatory CDD parts and Net-Ready
  is a KPP/KSA should remain explicitly coursebook guidance until the full current manual and Navy tailoring policy
  are read. Service naming/tailoring caveat prevents treating these as a newly verified universal document template.

### Official-source access on 2026-10-20

Current Joint Staff indexed catalogs corroborate CJCSI 5123.01J (2026-01-15, Change 1 2026-08-05) and CJCSM 5123.01A
(2026-08-05). Existing citekeys `JCS-Requirements-Instructions-20261020` and `JCS-Requirements-Manuals-20261020`
remain valid catalog evidence; they are not evidence that the current bodies were read.

- <https://www.jcs.mil/Library/CJCS-Instructions/> direct request: 403; indexed official results accessible.
- <https://www.jcs.mil/Library/CJCS-Manuals/> current indexed listing accessible; direct sorted listing: 403.
- Exact links resolved from <https://www.afacpo.com/mpm/core-documents/reference-documents/>:
  <https://www.jcs.mil/Portals/36/Documents/Library/Instructions/CJCSI%205123.01J%20CH%201.pdf> and
  <https://www.jcs.mil/Portals/36/Documents/Library/Manuals/CJCSM%205123.01A.pdf>; both returned 403.
- The accessible indexed January manual is an earlier edition, not proof of August rules. No replacement source or
  invented August text is used. RRAB/MEIA/JAR details remain attributed to reproduced coursebook excerpts.
- Implementation status: prior core rewrite retained; two small additions pending parent decision.


## 3.1.2 Congressional Enactment

- Edition 6.2, 2026-09-19; 43 PDF pages; `edo-3-1-2-congressional-enactment-2025`.
- Text and visual coverage: all pages 1-43, eight six-slide contact sheets. Image-only appeal sample (35),
  CR history (38), and statutory example (39-40) read. Historical documents remain examples, not current law.
- Guide comparison: all of `8_Congressional_Enactment.tex`.

| Objective / topic | PDF pages | Guide section / label | Disposition |
| --- | --- | --- | --- |
| 1 Constitutional appropriations basis | 6, 28 | Constitutional basis | Overbroad annual-act claim corrected |
| 2 Budget and financial terms | 8-10 | Key terms | BA, obligation, outlay corrected |
| 3 Budget authority players | 12-14, 16-24, 26-30 | Roles; process; Budget Resolution | Covered |
| 4 HASC/SASC/HAC/SAC roles | 14, 24-30 | Authorization; Appropriations tables | Existing current rosters retained |
| 5 CR definition | 37-40 | Continuing Resolution | Existing core retained; exact law controls |
| 6 CR constraints | 37-41 | Continuing Resolution | Removed committee-mark shorthand |
| 7 Appeals | 32-35 | Appeals to congressional marks | Worked numeric example added |
| Sequestration | 42 | Sequestration | Existing distinction retained |
| Cover, TLO, diagrams, recaps | 1-5, 7, 11, 15, 17-19, 21-23, 27, 31, 36, 43 | Summary; Quick Review | Reviewed |

### Corrections, authority, and implementation

- **Incorrect / High:** Slides 9 and guide say outlay waits for vendor to cash a check. Implemented:
  payment liquidates an obligation, ordinarily at check issuance, cash disbursement, or electronic transfer.
  GAO glossary official full text read on 2026-10-20, Outlay entry (printed p.73). Also corrected obligation to a
  definite legal commitment and BA to authority provided by law. Same bad definitions in chapter 9 corrected.
- **Ambiguous / High:** Slide 6 and guide imply all government funding comes from annual Appropriations Acts.
  Constitutional requirement is appropriations made by law; permanent appropriations and other BA forms exist.
  Implemented qualification citing GAO glossary; 2 USC 622 official current body corroborates forms of BA.
- **Ambiguous / High:** Slide 37 treats current committee marks as a CR funding basis. Implemented: enacted CR
  supplies rate, duration, coverage, and anomalies; pending mark alone provides no BA. Existing CRS R46595 and
  OMB A-11 citations retained. Official OMB 2025 A-11 section123 indexed text confirms anomaly mechanisms;
  direct PDF failed (Internal Error), so no full-body revalidation claimed.
- **Correct / High:** Preserve prior official-roster corrections despite stale slide25 House names and missing
  Senate Airland. Slide29 shared names omit the House/Senate foreign-affairs distinction, already covered.
- **Incorrect / High:** Slide21 diagram calls budget resolution joint in one box; guide correctly says concurrent.
  Slide6 gives PL93-334; correct law is PL93-344. Guide law title corrected to Congressional Budget and
  Impoundment Control Act of 1974; no incorrect public-law number was in guide.
- **Ambiguous / High:** Slide26/30 diagram's presidential ten-day maximum omits Sundays and pocket-veto cases.
  Not imported. Summary now says resolution of House--Senate differences, avoiding confusion with statutory
  budget reconciliation.
- **Coverage addition / High:** Added slide34 worked appeal: PB100, authorization90/95 => SASC100 and conference95;
  appropriations92/90 => SAC100 and conference92. Slide35 SM-6 FY2010 sample is historical illustration.

### Source access and proposed ledger rows

- `GAO-Budget-Glossary-2005`: September2005, GAO-05-734SP; official full body accessible 2026-10-20:
  https://www.gao.gov/assets/a76916.html . New bib proposal in `requirements-new.bib`.
- Current 2 USC622 official body accessible 2026-10-20:
  https://uscode.house.gov/us/usc/119-118/t2/s622/ . Corroboration; no new guide citation needed.
- OMB2025A-11: https://www.whitehouse.gov/wp-content/uploads/2025/08/a11.pdf ; direct failure, indexed section123.
- No current FY2027 CR enactment claim added; historical2018 image remains historical.

### Implementation checkpoint for earlier modules

- 3.1.1: implemented current RCP/OWA recall, department-level three-star forum, PE0602709A decoding, and
  explicitly legacy DDG1000 example in `6_PPBE.tex`. Full official organization body remains unresolved.
- 3.3.3: implemented Service Chief/designee initial-requirement approval gate in `17K_jcids.tex` (slide17);
  dense image-only policy excerpts33-35 independently enlarged and read, supporting retained prior rewrite.


## 3.1.3 Program Funding

- Edition 6.2, 2026-09-29; 43 pages. All text and images 1-43 reviewed, eight contact sheets.
- Guide: `9_Program_Funding_and_Execution.tex`, Program Funding through summary check and relevant Quick Review.

| Objective / topic | PDF pages | Guide section / label | Disposition |
| --- | --- | --- | --- |
| 1 Accounts and uses | 8-9, 41 | Appropriation categories; account tables | Covered; prior MILCON corrections retained |
| 2 Availability windows | 8, 10, 12, 41 | Lifecycle; `fig:appropriation_lifecycle` | Qualified fixed-period scope |
| 3 Expired funds scenarios | 10-12, 43 | Expired examples | Covered |
| 4 Policy characteristics | 14-23 | Funding policies | Complete usable item rule retained; delivery explanation added |
| 5 Policies by appropriation | 14-25, 42 | `tab:funding_policy_summary`, `tab:phase_appropriations` | Added overlap caution |
| 6 Exceptions | 27-36, 40, 42 | Exceptions; MILCON | MYP law corrected; AP arithmetic added |
| 7 Product improvements | 38-39, 42 | Funding product improvements; decision-tree figure | Covered |
| Terminology, cover, TLO, transitions | 1-7, 13, 26, 37 | Financial terms; Summary | Definitions corrected as in 3.1.2 |

### Corrections and authorities

- **Outdated / High:** Slide32 and guide require significant savings around10%. Current 10USC3501(a)(1) instead
  permits savings OR necessary defense-industrial-base stability not achievable through annual contracting.
  PL118-31 (2023-12-22) added alternative; PL119-60 section804(c) (2025-12-18) removed significant. Implemented
  statutory test, retained other applicable findings and program-specific/regulatory conditions. Existing `USC-3501`.
- **Incorrect / High:** Slide30/guide define MYP as deliveries over at most five years. Section3501(k) says
  more than one but not more than five PROGRAM years; specific longer authority exists. Implemented distinction.
  FY2026 NDAA notes include seven-program-year authority for selected munitions; not generalized to all programs.
- **Incorrect / High:** Slide31/guide say cannot budget termination liability. Section3501(f) gives payment sources;
  (g) expressly addresses extent cancellation costs are not budgeted. Implemented conditional liability and
  disclosure explanation. Cancellation and termination are not a blanket penalty rule.
- **Ambiguous / High:** Slide10 says all appropriations have standard current/expired/canceled sequence.
  Qualified guide to fixed-period appropriations; no-year authority differs. GAO glossary body accessible.
- **Coverage / High:** Slide23 expenditures70/140/140/50 sum400 but complete lot requires400 upfront. Added this
  with the coursebook 12-month funded-delivery-period definition, without undoing prior correct distinction
  between budgeting, obligation availability, and contract performance. Official FMRVol2A indexed body also
  corroborates FDP definition; direct full PDF failed, so no wider policy revalidation claimed.
- **Coverage / High:** Slide25 colored profile shows overlap, whereas guide table could imply exclusive colors
  by phase. Added purpose-controls selection caveat. Slide28 AP example added:10,405,685,0 across FY1-4.
- **Correct retained / High:** Slides8/40 contradict construction thresholds ($2M/$4M) and claim facility
  modernization uses OPN. Existing current section2805 and facility-versus-equipment corrections retained.
- **Source conflict / Medium:** Slide18 task2 percentage row25%/50%/25% conflicts with dollars25/100/25 out of150
  (16.67%/66.67%/16.67%). Budget column totals50/135/250/65 are arithmetically correct. Did not import percentage row.
- **Historical examples:** Slides29/34-36 reproduce FY2016/FY1998 enacted authority; no implication they authorize
  present programs. DDG51 savings remains explicitly coursebook historical example, not a new independent claim.

### Source access

- Official 10USC3501 full body, current through PL119-120 (2026-10-07), read2026-10-20:
  https://uscode.house.gov/us/usc/119-118/t10/s3501/ . Amendment notes and statutory notes read.
- DFARS217.172 full body, Change2026-05-07, read2026-10-20:
  https://www.acquisition.gov/dfars/217.172-multiyear-contracts-supplies. . Existing `DFARS217-172`.
- Dollar figures in bare statute and inflation-adjusted DFARS differ; no new threshold assertion added.
- https://comptroller.war.gov/Portals/45/documents/fmr/Volume_02a.pdf : indexed FDP text, direct Internal Error.
