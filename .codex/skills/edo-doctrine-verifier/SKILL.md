---
name: edo-doctrine-verifier
description: Use when EDO board study depends on current policy, doctrine, organization, ACAT/program status, statutory roles, budget process authority, or authoritative definitions that may have changed.
internal: true
---

# edo-doctrine-verifier

Use this before teaching or editing when currentness matters. Keep source gathering separate from repo baseline when the user requests distinct phases.

## Use when

- The topic involves current policy, statute, regulation, organization, ACAT status, program status, or named offices.
- The user asks whether the study guide is current, accurate, or aligned to official sources.
- The user is in EDO study mode and asks that all study material be cross-referenced against primary official sources.
- The answer depends on DoD, DON, NAVSEA, NAVWAR, DAU, GAO, CRS, Congress, FAR, DFARS, or DoD FMR authority.
- Local study-guide content conflicts with an external authoritative source.

## Avoid when

- The user is doing pure drill on settled material and does not ask for current verification.
- The answer can safely be sourced from the local study guide without current policy or organization risk.
- The user explicitly asks to avoid web verification for the current turn.
- The task is a repo patch with already verified source text and no unresolved doctrine question.

## Source Priority

- Statute and regulation first: U.S. Code, FAR, DFARS, DoD FMR.
- DoD and DON policy next: DoDI 5000 series, SECNAV, OPNAV, ASN or NAVSEA/NAVWAR public guidance.
- Authoritative acquisition learning sources: DAU/WARU transition pages, GAO, CRS, official budget materials.
- Public Navy program pages for organization and office ownership.
- Use third-party sources only as leads; do not rely on them for board-ready claims unless clearly labeled.
- Prefer the latest official document or official web page over coursebook text when there is a conflict or update.

## Output Shape

- Current as of: runtime date when verification occurs.
- Verified doctrine: concise supported facts.
- Repo comparison: aligned, missing, stale, or conflicting.
- Inference: explicitly labeled.
- Uncertainty: what could not be confirmed and why.
- Study-guide impact: no change, candidate update, or correction required, with target section if a correction is needed.

## Validate

- Each verified claim is tied to a retrieved source.
- Date-sensitive claims include the current verification date.
- Conflicts identify the source hierarchy.
- Recommendations do not exceed what the sources support.
- If verification identifies source drift, the next step is a bounded study-guide-maintainer update unless the user explicitly asks not to edit.
