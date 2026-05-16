---
name: parallel-review-consolidation
description: Use when a concrete diff, branch, artifact set, validation output, or plan needs multi-lens review through specialized read-only workers. The main agent dispatches review agents in parallel and consolidates their reports into one prioritized audit.
internal: true
---

# parallel-review-consolidation

Follow the shared skill contract in [`../README.md`](../README.md).

## Use when

- A concrete diff, branch, artifact set, validation output, or plan exists.
- Multi-lens review is needed: correctness, security, tests, architecture, regression, compliance.
- The main agent should dispatch specialized read-only workers in parallel and consolidate reports.

## Avoid when

- No concrete artifact exists to review.
- Implementation is requested rather than review.
- A single review lens is sufficient.
- The task is pre-patch debugging, planning, or implementation.

## Trigger phrases

- "Run parallel review on this diff."
- "Dispatch specialized reviewers and consolidate findings."
- "Multi-lens audit of these changes."

## Inputs

- Diff, branch, artifact set, validation output, or plan to review.
- Review lenses to apply (default: all six specialized reviewers).

## Return

- Consolidated report with findings ordered by severity, cross-lens conflicts, validation gaps, residual risks, and final gate recommendation.

## Runbook

- Main agent dispatches read-only leaf workers in parallel.
- Workers receive non-overlapping lenses: correctness, security, tests, architecture, regression, compliance.
- Workers do not spawn agents, request approvals, or edit files.
- Main agent consolidates all reports, deduplicates findings, labels conflicts, drops unsupported claims.
- Workers and the consolidating main agent must redact secrets and credential-like
  values in findings, evidence, logs, and command output; identify location and
  token type without echoing values.
- Return one final report with the required shape.

## Required final report shape

```markdown
## Findings

- Severity:
- Lens:
- Evidence:
- File/line:
- Impact:
- Recommended fix:
- Blocking:

## Cross-Lens Conflicts

## Validation Gaps

## Residual Risks

## Final Gate Recommendation
```

## Gotchas

- Spawning workers that are not read-only.
- Workers attempting orchestration or approvals.
- Missing deduplication or conflict labeling.
- Unsupported claims not filtered out.

## Validate

- All workers are read-only leaf agents.
- No worker spawns nested agents or requests approvals.
- Findings are deduplicated and conflicts labeled.
- Unsupported claims are dropped.
- Secret and credential-like values are redacted in worker reports and the final report.
- Final report follows required shape.
