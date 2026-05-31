# Session Context

## User Goal

Train for an Engineering Duty Officer qualification board using the local
`edo_study_guide` repository as the study baseline, while correcting and
improving the guide when current official sources show drift or gaps.

## Repository

Primary study-guide checkout:

`/home/vic-l/gitRepos/edo_study_guide`

Relevant files repeatedly used in the session:

- `tex/chapters/3_NAVSEA.tex`
- `tex/chapters/4_NAVWAR.tex`
- `tex/chapters/6_PPBE.tex`
- `tex/chapters/14_EVM.tex`
- `tex/chapters/16_Milestones.tex`
- `tex/chapters/17G_Systems_Engineering_Overview.tex`
- `tex/chapters/17I_CM_and_Technical_Reviews.tex`
- `tex/chapters/17K_jcids.tex`
- `tex/chapters/18B_test-eval.tex`
- `tex/chapters/27_CIVPERS.tex`
- `tex/acronyms.def`
- `tex/edo.bib`

## User Preferences

- Use the study guide as the starting point.
- Cross-reference drift-prone facts against current official sources.
- Prefer official sources: DoD/DoW, DAU/WARU transition material, DON,
  SECNAV, OPNAV, NAVSEA, NAVWAR, GAO, CRS, Congress, OPM, eCFR, MSPB, FLRA.
- Clearly distinguish:
  - repo-based content
  - verified doctrine/current source content
  - inference
  - uncertainty
- Keep board answers concise and board-ready.
- Challenge incomplete answers.
- Ask one drill question at a time.
- Do not provide a drill answer before the user responds.
- Grade responses as Strong, Adequate, Incomplete, or Incorrect.
- Use Markdown block quotes for model answers.
- Align Markdown table delimiters in assistant responses for raw readability.
- Periodically include rote organization recall prompts.

## Side Conversation Boundary

The user explicitly stated that everything before the side-conversation boundary
is inherited history and reference context only. This package therefore records
prior state for reuse, but it does not imply that any prior requests remain
active.

## Important Operational Notes

- Do not mutate files or git state in a side conversation unless explicitly
  asked after the boundary.
- For future main-thread work, if the user asks to update the guide, integrate
  content into canonical chapters instead of creating loose notes.
- For current org structures, billets, program managers, ACAT status, and
  policy/law, verify live official sources before treating details as current.
