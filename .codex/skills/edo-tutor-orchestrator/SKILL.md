---
name: edo-tutor-orchestrator
description: Use when the user asks for EDO board study, learning sessions, quizzes, repo-backed tutoring, doctrine verification, or study-guide improvement routing. Classifies the request, selects the right tutor workflow or leaf role, and keeps the main Codex session responsible for interaction, approvals, and final synthesis.
internal: true
---

# edo-tutor-orchestrator

Follow the shared workspace rule: the main Codex session owns routing, approvals, interactive tutoring state, and final synthesis. Spawned agents are bounded leaf workers only.

## Use when

- The user asks to study, learn, quiz, drill, or prepare for an EDO qualification board.
- The user asks for automatic model, role, agent, or profile selection for EDO study work.
- The user asks to verify doctrine, current program status, ACAT status, office ownership, or policy facts before tutoring.
- The user asks to update, correct, or improve the EDO study guide as part of board study.

## Avoid when

- The task is unrelated to EDO board preparation or the EDO study-guide repository.
- The user only asks for a standalone code change with no study, doctrine, or study-guide-maintenance component.
- The user asks for a general code review, debugging pass, or implementation plan outside the study-guide tutoring workflow.
- The request requires sending email, calendar scheduling, or personal-data connector work.

## Routing

- Interactive learning: use `edo-board-tutor`; keep the main session as tutor; default to `gpt-5.5` with medium reasoning.
- Rapid quiz or flashcard-style review: use `edo-board-tutor` drill mode; use low or medium reasoning; avoid tools unless the user asks for repo grounding.
- Mixed board prep: use `edo-board-tutor` in rotating-topic mode across prior session topics and the broader study guide; keep one-question cadence and track weak areas across topics.
- Current doctrine, policy, organization, ACAT, or program-status checks: use `edo-doctrine-verifier` first; prefer official sources; use high reasoning.
- Study-guide edits: use `edo-study-guide-maintainer`; inspect existing coverage before editing; use one write-capable worker at most when delegating.
- Conflicting sources or high-stakes board correction: keep synthesis in the main session; use high reasoning and label repo content, verified doctrine, inference, and uncertainty.

## Model Selection

- Default tutor model: `gpt-5.5`, medium reasoning, fast service tier.
- Drill-only mode: `gpt-5.5`, low or medium reasoning; the priority is responsiveness and one-question cadence.
- Verification mode: `gpt-5.5`, high reasoning; use web only for current policy, organization, ACAT, program status, or authoritative definitions.
- Maintenance mode: `gpt-5.5`, medium reasoning for bounded edits; escalate to high for cross-chapter or source-conflict corrections.
- Reserve xhigh reasoning for explicit high-stakes source conflicts or board-critical synthesis where current authoritative sources disagree.

## Tutor Loop

1. Establish the topic and mode: learn, drill, verify, maintain, or mixed.
2. For repo-backed learning, identify relevant study-guide files before teaching or quizzing.
3. Teach board-level relationships and artifacts concisely.
4. Ask one question at a time and wait for the user response.
5. Grade each response: Strong, Adequate, Incomplete, or Incorrect.
6. Explain the gap, provide a model answer in Markdown block quote syntax, then ask the next question.
7. Track weak areas by concept, error type, and severity.
8. When gaps or source drift in the guide are found, propose or implement non-duplicative updates in the owning section.

## Mixed Board Prep

- Rotate across all major study areas instead of staying inside one topic unless the user narrows the scope.
- Include prior-session weak areas in the rotation, especially PPBE, acquisition pathways, milestones, APB/PMB/EVM, systems engineering, T&E, NAVSEA/NAVWAR/PEO orgs, CIVPERS, legal/ethics, leadership, and fleet maintenance.
- Let the user mark a question as not board-relevant; if they do, deprioritize that subtopic unless it is needed as a relationship hook for a more board-relevant question.
- Favor questions that require relationships and ownership: who owns what, what artifact proves it, what decision it supports, and what changes if the facts change.
- Keep a running weak-area tracker visible after graded answers and use it to select future questions.

## Evidence Boundaries

- Label claims as repo-based content, verified doctrine, inference, or uncertainty.
- The study guide is the starting point, not the final authority. Cross-reference board answers with current primary official sources when the claim is doctrinal, statutory, regulatory, organizational, program-status, ACAT, budget-process, or otherwise drift-prone.
- Do not browse and inspect repo content in the same step when the user explicitly asks for separated phases.
- Prefer primary sources for verification: DoD, DAU, DON, SECNAV, OPNAV, NAVSEA, NAVWAR, GAO, CRS, Congress, FAR, DFARS, and DoD FMR.
- Do not present current organization, policy, ACAT, or personnel facts as verified unless checked during the current workflow.
- If official sources supersede or contradict the study guide, route to `edo-study-guide-maintainer` after verification and update the canonical section rather than leaving the correction as chat-only.

## Validate

- Confirm the selected route matches the user's immediate mode.
- Confirm only one question is asked during drill mode.
- Confirm weak-area tracking is maintained during tutoring.
- Confirm proposed guide updates target existing canonical sections and avoid duplication.
