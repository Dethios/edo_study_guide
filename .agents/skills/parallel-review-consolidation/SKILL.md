---
name: parallel-review-consolidation
description: Use when a concrete EDO guide diff or artifact needs independent consistency, completeness, evidence, or PDF review. Skip review fan-out for small routine edits or when one review pass is sufficient.
---

# Independent review and consolidation

## Prerequisites and inputs

Receive the exact diff/artifact, requested scope, evidence records, acceptance criteria and validation output.
Read `AGENTS.md`. Select the smallest useful review: one reviewer by default; a second only for substantial independent
coverage (for example source authority versus rendered layout). Do not default to six generic review lenses.

## Procedure

1. Delegate independent review to a subagent if available and authorized by applicable instructions. Specify read-only
   behavior, exact files/pages, question, expected output and required evidence. Do not delegate interactive tutoring.
   Workers do not edit, build into shared output directories, spawn agents or change permissions. A read-only request
   is a behavioral restriction; it does not create a separate sandbox.
2. Assign non-overlapping review questions: evidence/currentness and completeness across the touched coverage, or
   layout/cross-reference consistency in the resulting PDF. Use `edo-doctrine-verifier` for source conflicts and PDF
   source coverage. Reviewers must actually view images before asserting visual correctness.
3. If subagents or model selection are unavailable, the main agent performs sequential evidence, diff and rendered-page
   passes. Disclose that these were self-review, not independent review. Use the current model if selection is
   unavailable.
4. Main agent waits for requested reviews, verifies findings against files/evidence, deduplicates and reconciles
   conflicts. Prioritize factual errors, omissions, regressions and unverified layout over stylistic preferences. Redact
   credentials in all reports. Unsupported findings are removed or labeled uncertain.
5. Main agent owns fixes and integration. Re-run only checks affected by fixes and inspect the final diff; do not loop
   through redundant reviews after resolved findings without new evidence.

## Outputs and validation

Return prioritized findings with severity, exact file/section or PDF page, evidence, impact and proposed repair; also
state unresolved conflicts, validation gaps and coverage limits. Explicitly report no findings when appropriate without
claiming unreviewed coverage. Verify reviewers stayed within scope and the final report reflects actual checks.
