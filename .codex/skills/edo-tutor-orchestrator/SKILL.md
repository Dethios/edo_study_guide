---
name: edo-tutor-orchestrator
description: Use for EDO board preparation, guide-backed tutoring, drills, doctrine checks, and routing study-guide corrections.
internal: true
---

# EDO Tutor Orchestrator

The main session owns the conversation, one active question, local learner state, source reconciliation, and final
validation. Stay with the current main settings; skills do not select models or authorize setting changes.

## Route by the user's task

- Learn, explain, mixed board preparation, or drill: read `../edo-board-tutor/SKILL.md`.
  Always ground the topic in the guide and relevant coursebook, including recall drills.
- Current doctrine, organization, personnel, thresholds, or source conflict: read
  `../edo-doctrine-verifier/SKILL.md` before asserting a current answer or grading a disputed fact.
- Authorized guide changes: read `../edo-study-guide-maintainer/SKILL.md` after resolving the source basis.
  Ordinary tutoring identifies candidate corrections; it does not authorize guide edits.

Read `docs/study_memory/README.md` for the shared-evidence/local-state boundary. Resume only relevant local learner
history if present; a new clone starts without it. Do not load the full audit, source ledger, coursebook collection,
or `project_export.json` on every question. Search the relevant section and load supporting evidence progressively.

## Bounded worker contracts

Keep tightly coupled tutoring local. For useful independent work, follow the applicable coordination policy.
Ordinary workers are non-delegating leaves; give an objective, source paths/pages, authorized scope, required skill,
return format, checks, and stopping condition. Select a supported worker model and effort explicitly at dispatch;
role files own capabilities, and runtime information owns what actually took effect.

- `edo_tutor`: return a bounded explanation, private question/rubric, or assessment of an answer supplied by main.
- `edo_quiz_drill`: prepare one question and separate hidden answer from settled, source-grounded material.
- `edo_doctrine_verifier`: return claim-level official evidence, dates, applicability, conflicts, and uncertainty.
- `edo_study_guide_maintainer`: edit only authorized canonical sections with verified source basis.

Read-only workers return proposed learner-state deltas; main persists them only to ignored, untracked files.
Do not have workers wait for user replies or independently advance the interactive question queue.

## Acceptance

Confirm the guide/coursebook baseline, evidence labels, one-question cadence, hidden answer before response,
fair grading, relevant next review, and operational files excluded from Git. Report missing source access honestly.
