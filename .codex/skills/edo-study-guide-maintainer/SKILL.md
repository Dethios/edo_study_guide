---
name: edo-study-guide-maintainer
description: Use when EDO board tutoring identifies study-guide gaps or the user asks to update, correct, or integrate material into projects/edo_study_guide without duplicating existing coverage.
internal: true
---

# edo-study-guide-maintainer

Use this for bounded study-guide edits after the learning or verification step identifies a concrete gap.

## Use when

- The user asks to update, correct, improve, or incorporate information into the EDO study guide.
- A tutoring session identifies a material gap, stale statement, or confusing board-prep relationship.
- Current official sources supersede, nuance, or contradict study-guide content during EDO board prep.
- The change belongs in `projects/edo_study_guide` and should be integrated into the canonical chapter or appendix.
- The user asks for insertion text, update text, or a patch plan for the study guide.

## Avoid when

- The user only wants tutoring or quizzing and has not asked for a repo change.
- The source basis is unresolved or current doctrine has not been verified where required.
- The proposed content duplicates an existing section instead of improving it.
- The request belongs to a different repository or workspace document.

## Edit Rules

- Read `projects/edo_study_guide/AGENTS.md` and the target chapter before editing.
- Search for existing coverage before adding new content.
- Prefer revising the canonical subject chapter or appendix over creating standalone notes.
- Treat the study guide as the starting point and current official sources as controlling when policy, law, regulation, organization, ACAT/program status, or authoritative definitions have changed.
- Use `\autocite{}` inside sentences before punctuation and existing acronym keys from `tex/acronyms.def`.
- Keep prose board-ready, concise, and non-duplicative.
- Update bibliography only when a new source is used.
- Report validation performed and residual warnings or blockers after writes.

## Targeting Heuristics

- PPBE, budget roles, POM, BES, execution: `tex/chapters/6_PPBE.tex` and adjacent funding chapters.
- Milestones and MCA: `tex/chapters/16_Milestones.tex`.
- Systems engineering reviews: `tex/chapters/17I_CM_and_Technical_Reviews.tex`.
- EVM and IBR: `tex/chapters/14_EVM.tex`.
- CDD, KPP/KSA, SEP, TEMP, and requirements relationships: `tex/chapters/17K_jcids.tex`, `tex/chapters/17G_Systems_Engineering_Overview.tex`, and `tex/chapters/18B_test-eval.tex`.
- CIVPERS, HRO, EEO, employee relations, labor relations, DPMAP, WGI/QSI, Douglas Factors, and Weingarten: `tex/chapters/27_CIVPERS.tex`.
- Current events and PAE structure: the relevant appendix files under `tex/chapters/`.
- PEO IWS and NAVSEA office content: `tex/chapters/3_NAVSEA.tex`.
- PEO C4I and NAVWAR content: `tex/chapters/4_NAVWAR.tex`.

## Validate

- Run the lightest relevant text-integrity check after edits.
- Use the Docker build path when the user requests build validation.
- If validation is blocked by environment or baseline drift, say exactly what was skipped or failed.
