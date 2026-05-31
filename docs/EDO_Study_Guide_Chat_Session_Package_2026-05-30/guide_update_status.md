# Study Guide Update Status

## Visible Study-Guide Edits Completed In Parent Context

The parent session reported integration into:

- `tex/chapters/4_NAVWAR.tex`
- `tex/chapters/3_NAVSEA.tex`
- `tex/chapters/27_CIVPERS.tex`
- `tex/acronyms.def`
- `tex/edo.bib`
- `CHANGELOG.md`

## NAVWAR Updates

Reported additions or corrections:

- PEO MLB portfolio list from the official PEO MLB portfolio book.
- PMA/PMW 101 MIDS/Link 16 section and physical location at Naval Base Point
  Loma.
- PMW 120/DCGS-N correction:
  - Correct expansion: Distributed Common Ground System-Navy.
  - Current public status: Software Acquisition Pathway.
  - Legacy board cue: ACAT IAC/IAM.
- PMW 160/CANES predecessor set:
  - LNS = ISNS, SCI Networks, CENTRIXS-M, SubLAN.
- PMW 160/ADNS:
  - Correct expansion: Automated Digital Network System.
  - Tactical WAN / ship-to-shore routing cue.
  - Owned by PMW 160 / PEO C4I, not PEO Digital.
- Afloat email path:
  - application/workstation
  - CANES shipboard LAN/compute
  - ADNS routing/traffic engineering
  - SATCOM/RF bearer
  - shore gateway/Fleet NOC/DISN
  - destination shore enterprise service
- PMW 790/DJC2:
  - Correct expansion: Deployable Joint Command and Control.
  - Not D2GCS or DG2S.

## NAVSEA Updates

Reported additions or corrections:

- IWS 6.0 clarified as combat-system C2 / sensor netting.
- IWS 6.0 vs PMW 150 distinction:
  - IWS 6.0 = combat-system C2 and CEC/sensor netting.
  - PMW 150 = Navy operational/tactical C2 applications such as GCCS-M.
- IWS 9.0 and IWS X were previously corrected:
  - IWS 9.0 = Zumwalt Integrated Combat Systems.
  - IWS X = Integrated Combat System.

## CIVPERS Updates

Reported additions or corrections:

- WG/WL/WS Federal Wage System table:
  - WG = 15 nonsupervisory grades.
  - WL = 15 leader grades.
  - WS = 19 supervisory grades.
- Current OPM probationary/trial period guidance:
  - probationary/trial periods are extensions of the hiring process.
  - certification required before continuation beyond probation/trial period.
  - this is an expedited lane for new/probationary workers, not a waiver of
    due process for tenured employees.
- Non-probationary poor performers:
  - Chapter 75 adverse-action route can be used for unacceptable performance
    and does not require a PIP.
  - Chapter 43 performance route requires an opportunity period/PIP.
  - Chapter 75 requires preponderance of evidence and Douglas Factors.

## Acronym Updates

Reported additions:

- `wl`: Wage Leader
- `ws`: Wage Supervisor
- `adns`: Automated Digital Network System
- `dcgsn`: Distributed Common Ground System-Navy
- `djc2`: Deployable Joint Command and Control
- `lns`: Legacy Network Systems
- `isns`: Integrated Shipboard Network System

## Validation Reported In Parent Context

Passed:

- `git diff --check`
- `make check-acronyms`

Blocked:

- Docker LaTeX build failed because `texlive/texlive:latest` was not present
  locally.
- Local LaTeX build failed because `latexmk` was not installed.

## Known Dirty State Reported

The parent context reported unrelated dirty files:

- `AGENTS.md`
- `CHANGELOG.md`
- `CONTRIBUTING.md`
- `README.md`

The parent context stated these were not reverted.
