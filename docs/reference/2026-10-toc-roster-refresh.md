# October 2026 TOC, EDO Flags, and NAVSEA/PAE Refresh

Current as of 2026-10-20.

## TOC Hierarchy

The earlier sans-serif small-cap request fell back to ordinary bold sans text. Major entries now use
the actual Kerkis bold small-cap face at 12.5 pt; subordinate entries use regular upright sans text at
normal size. The list-of-tables and figures retain their existing entry styling. A short rendered
fixture verified the selected font and the visual size/weight contrast before the full build.

## Roster Source and Corrections

The uploaded 2.1.1 Command Structures coursebook has its EDO roster in embedded images on slides 49-50,
dated September 23. The earlier text extraction omitted this content. Both slides have now been
rendered and read: 2 VADMs, 3 RADMs, 7 RDMLs, 12 officers total.

- Downey: no longer COMNAVSEA or PAE IO; Small assumed acting command and Weeks separately became interim PAE IO August
  6.
- Wolfe: replaced by VADM Williams at PAE SSP June 12; the handoff is complete.
- Brown: absent from September roster; Capt. Crinklaw relieved him as Deputy PAE Shipyard Operations September 3.
- Moton: acting PAE Maritime, corroborated by the September 30 official release.
- Rucker: Director, Design and Construction, DRPM Submarines / PAE Undersea.
- Rothenhaus: NAVWAR commander and Deputy PAE Mission Systems.
- Jett-Parmer: acting NAVSEA vice commander.
- Richman: September SLCM-N cue, aligned with the official SSP Regional Deterrence deputy title.
- Okano: late-September ASN(RD&A) duty update supersedes the September 23 PMILDEP label.

The twelve-officer total is attributed to the September coursebook, not an independently retrieved
October personnel census. Weeks explains the PAE IO handoff but is not added to the EDO-community count.
Generic public "Rear Admiral" wording is not used to infer promotion from RDML to RADM.

## NAVSEA and PAE Responsibilities

The study answer now leads with the transfer of associated technical, contracting, and sustainment functions
to PAEs. The Navy's approximately 70% statement describes announced functional/personnel realignment; it
is not evidence that a measured 70% NAVSEA staffing reduction is complete.

Shipyards and seven RMCs align with PAE IO; SUPSHIPs align with PAE Maritime. NAVSEA and warfare centers
provide engineering and execution depth within current charters and delegations. Old directorates,
PEO reporting rules, the December 2025 chart, and enterprise staffing figures are historical crosswalks.
The key-role and fleet-maintenance summaries now use the same alignment.

Miller is acting PAE/DRPM RAS under the August 5 announcement; Gassler's earlier testimony is historical.
DRPM reporting exceptions are explicit, including the Under Secretary route for DRPM RAS.

## Primary Sources

New bibliography entries and exact URLs are listed in `docs/study_memory/sources.md`. These include:

- [NAVSEA August 6 handoff](https://www.dvidshub.net/news/printable/571797).
- [PAE IO August 6 handoff and responsibilities](https://www.dvidshub.net/news/printable/571787).
- [SSP June 12 change of command](https://www.dvidshub.net/news/printable/567595).
- [PAE Maritime September 30 release identifying acting PAE Moton](https://www.paemaritime.navy.mil/press-release/USS-Harry-S-Truman-CVN75-to-Undergo-Midlife-Refueling-and-Complex-Overhaul).
- [PAE IO September 3 Brown/Crinklaw caption](https://www.dvidshub.net/image/9914648/ms-elizabeth-nashhold-pins-legion-merit-star-onto-rear-admiral-scott-brown).
- [Navy August 5 DRPM RAS establishment](https://drpmras.navy.mil/press-release/department-of-the-navy-establishes-direct-reporting-portfolio-manager-for-robotic-and-autonomous-systems).
- Uploaded September Command Structures (slides 49-50) and NAVSEA Organization (slide 38) coursebooks.

The May 11 Navy acquisition reform release was corroborated through indexed official text. Some Navy
webpages remain blocked for direct retrieval; no unavailable source body is represented as fully read.

The expanded PAE appendix table uses compact numbered source citations to keep its source note
inside the page; all original and updated source keys remain linked in the bibliography.

## Validation

The native LuaLaTeX build was used because the Docker daemon is unavailable. The revised PDF has
466 pages, including a three-page TOC. The main TOC entries embed Kerkis-BoldSmallCaps at 12.45 PDF
points; section entries embed regular Latin Modern Sans at 10.59 PDF points. Rendered TOC pages,
NAVSEA crosswalk pages, both current PAE tables, and the roster introduction/table/notes were visually
checked. All twelve roster rows fit on one page, and the compact PAE source note stays within the page.

A full-document text-bound scan found no text outside the page safety bounds and no zero-number
citation placeholders. Acronym, TeX structure, study-memory, source-ledger, cited-URL, TikZ-cache,
Markdown, and whitespace checks pass. The active-citation metadata report still flags 346 of 422 keys
as weak, primarily older access dates inherited from the guide; this focused update does not claim a
fresh review of every reference. Existing non-TOC Latin Modern Sans small-cap fallback warnings remain.

The final reference/stability build completed successfully. No overfull boxes, missing characters,
undefined citations, or rerun requests remain. The final body pages match the visually reviewed
version after accounting for the removed TOC page.

PDF SHA-256: `2aa30e7328dff14247e3d131c8328d35a4fec922548c08afba3cc459df375b14`.
