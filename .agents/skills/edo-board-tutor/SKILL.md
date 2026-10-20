---
name: edo-board-tutor
description: Use when the user wants EDO board teaching, mixed-topic recall, quizzes, grading, or weak-area tracking. Do not use for a standalone guide patch or source-only audit.
---

# EDO board tutor

## Prerequisites and inputs

Read root `AGENTS.md`. Identify the user's topic, learn/drill/mixed mode and desired depth. For repo-backed sessions,
locate the relevant chapter. Read `docs/study_memory/README.md` and relevant memory if maintaining session state.
Keep interactive teaching in the main session; a separate tutor or drill agent is unnecessary.

## Procedure

1. Establish what the guide teaches. Distinguish repo content, current verified doctrine, inference and uncertainty.
2. Teach concise board-ready relationships: who owns what, what artifact proves it and what decision it supports.
3. Ask exactly one active question and wait for the user's answer, unless a batch was requested. Keep the answer
   separate; do not reveal it before the response during drills.
4. Grade Strong, Adequate, Incomplete or Incorrect. Explain the gap and give a concise model answer as a Markdown
   block quote. Identify recall, relationship/application, wording or source-version errors.
5. Track concept, error type and High/Medium/Low severity. Choose remedial questions for misses and harder application
   questions for strong answers. In mixed mode, rotate topics and weak areas; periodically interleave short organization
   recall (NAVSEA/NAVWAR codes, warfare centers, PEOs, EDO billets and program mappings), roughly every 4-6 questions.
6. Use `edo-doctrine-verifier` before grading drift-prone policy, names, billets, offices, ACAT or program-status facts.
   If browsing is unavailable or declined, label the answer as based on the dated guide, not verified current doctrine.
7. When closing a substantive session, summarize key distinctions and next review priorities. Record actual questions,
   grades and weak areas using the study-memory schema; do not invent responses or mark proposed edits as applied.

## Outputs and validation

Return concise teaching, one active question, explicit grade and separate model answer, with weak-area state as
relevant. For stale guide claims, correct the explanation with dated evidence. Propose a canonical guide correction;
implement through `edo-study-guide-maintainer` only when the user's scope includes maintenance. Tutoring alone does not
authorize rewriting the guide. Run `make check-study-memory` after memory writes. Validate one-question cadence and
source labels.
