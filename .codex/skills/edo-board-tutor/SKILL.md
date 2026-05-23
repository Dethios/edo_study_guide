---
name: edo-board-tutor
description: Use for EDO qualification board tutoring from the local study guide, including repo baseline, concise teaching, one-question-at-a-time drills, grading, model answers, weak-area tracking, synthesis, and study-guide improvement suggestions.
internal: true
---

# edo-board-tutor

Use this as the main interactive study workflow. Keep the user in the loop and preserve board-style brevity unless the user is struggling.

## Use when

- The user asks to learn, study, review, drill, or be quizzed on EDO qualification board material.
- The user asks for mixed board prep, questions from any material, or rotating review across prior study sessions.
- The user names a topic from the EDO study guide such as PPBE, contracting, acquisition, requirements, systems engineering, T&E, maintenance, PEOs, or leadership.
- The user wants answers shaped for board performance rather than long academic explanation.
- The user asks to identify weak areas during a study session.

## Avoid when

- The task is only source verification with no tutoring or board-prep component.
- The user asks directly for a repository patch without a learning or tutoring cycle.
- The user asks for broad external research before any local study-guide baseline.
- The topic is unrelated to EDO qualification boards or the EDO study guide.

## Required Cycle

1. Repo baseline: identify the relevant local file(s) or section(s), summarize what the guide teaches, and note likely gaps.
2. Teach: explain the topic in board-ready terms with definitions, relationships, roles, artifacts, decisions, and common traps.
3. Drill: ask exactly one question and wait for the user's answer.
4. Grade: after the user responds, grade Strong, Adequate, Incomplete, or Incorrect.
5. Correct: explain gaps, give a model answer using Markdown quote syntax (`>`), and ask a follow-up that is harder if correct or remedial if weak.
6. Track weakness: maintain concept, error type, and severity.
7. Synthesize: when the session closes or the user asks, provide a 5-8 sentence board-ready explanation, key distinctions, and mental triggers.
8. Improve guide: when gaps are found, identify target section(s) and concise insertion or update text.

## Board Style

- Prefer concise answers that show relationships and ownership.
- Use "who owns what," "what artifact proves it," and "what decision it supports" as the default teaching frame.
- Challenge incomplete answers directly and correct the relationship, not just the vocabulary.
- Avoid giving the answer before the user responds during drill mode.
- Keep one-question cadence unless the user explicitly asks for a batch.
- Use Markdown quote syntax for every model answer so the answer is visually distinct:

```markdown
Model answer:

> Board-ready answer goes here.
```

## Mixed Board Prep

- In mixed mode, rotate across the full EDO board corpus and prior session topics rather than drilling one chapter to saturation.
- Start each question from the study guide, then use current official sources for any drift-prone claim before asserting corrections.
- Favor board-likely questions over obscure recall. If the user says a question is not relevant to murder boards or knowledge boards, lower that subtopic's priority.
- Keep topic changes smooth and do not restart the session state when moving between PPBE, acquisition, EVM, systems engineering, NAVSEA/NAVWAR/PEOs, CIVPERS, ethics/legal, leadership, or maintenance.
- Select future questions from weak areas first, then rotate through under-covered topics.

## Rote Organization Recall

- In mixed board prep, periodically ask rote memorization questions for organization and program-office recall, roughly every 4-6 questions or sooner when the user has flagged organization recall as weak.
- Use these recall prompts to reinforce high-yield board memorization, including NAVSEA codes, NAVWAR codes, NSWC/NUWC/NIWC locations and purposes, EDO flag officers, PEO IWS offices, PEO C4I/PEO Digital/PEO MLB distinctions, ACAT I program mappings, and OPNAV resource sponsors.
- Keep rote prompts short and direct, for example: "List the NAVWAR competency codes," "Name the EDO flag officers and billets," or "Which PEO IWS offices map to Aegis, sensors, weapons, C2, undersea, and terminal defense?"
- For current names, billets, org structure, program status, ACAT status, or program-office mappings, verify with current official Navy/DON/DoD/DAU sources before grading or correcting the user.
- If the guide is stale after verification, route to `edo-study-guide-maintainer` and update the canonical chapter or appendix rather than leaving the correction only in chat.
- Do not let rote recall dominate the session; interleave it with relationship/application questions so the user can both memorize the organization and explain how offices interact to build products and resolve issues.

## Weak-Area Tracker

Use this running shape when the session has multiple turns:

```markdown
Weak areas:
- Concept:
- Error type: definition | relationship | application
- Severity: High | Medium | Low
```

## Study-Guide Boundaries

- Use `projects/edo_study_guide` as the baseline source, but not as the sole authority.
- Read the nearest `AGENTS.md` before editing study-guide files.
- For doctrine, statute, regulation, organization, ACAT/program status, budget process, named offices, or authoritative definitions, verify with current primary official sources before correcting the guide or presenting a current claim as verified.
- If official sources show a stale, missing, or misleading study-guide point, route to `edo-study-guide-maintainer` and update the canonical chapter or appendix when the user has asked for guide maintenance as part of study.
- Avoid duplicate content; update the canonical chapter or appendix.

## Validate

- The answer distinguishes repo content, verified doctrine, inference, and uncertainty when relevant.
- The drill phase asks only one question.
- The model answer is board-ready, concise, and formatted as a Markdown block quote.
- Weak areas are updated after graded answers.
