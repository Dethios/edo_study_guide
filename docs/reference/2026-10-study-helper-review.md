# EDO Study Helper Review

Reviewed 2026-10-20. Scope: project-local tutoring skills, four EDO agent roles, operational records, and validation.
No guide doctrine or answer key was changed, and no LaTeX/PDF rebuild was needed.

## Findings and changes

- Personal session history, generated questions, answer outcomes, and weak areas were tracked alongside shared
  guide evidence. Ignore all `docs/study_memory/` contents except the five explicitly shared files, and ignore
  imported `docs/EDO_Study_Guide_Chat_Session_Package_*/` directories. Removed 13 operational files from the Git index;
  every local file remains byte-for-byte intact, verified by SHA-256 before and after untracking.
- Keep `README.md`, `schemas.md`, `sources.md`, `study_guide_audit.md`, and `guide_changes.jsonl` as shared workflow
  documentation and impersonal guide provenance. Future operational artifacts are ignored by default. Personal
  results must not be copied into shared evidence, `project_export.json`, commits, or pull requests.
- The old validator required personal files on every checkout. Extracted its Python implementation into
  `scripts/check-study-memory.py`, preserving the shell entrypoint. Shared evidence remains required; local state is
  optional and validated when present, including separate learner JSONL records. Added Git tracking/ignore checks.
- Question evidence previously had to match shared inventory rows, coupling private tutoring to tracked edits.
  Local questions now retain their own source metadata without requiring shared-ledger changes. Shared guide-change
  source coverage remains enforced by the existing source-ledger checks.
- Tutoring could skip repository grounding in rapid drills and did not explicitly navigate the retained coursebooks.
  The revised workflow starts from an actual guide section, uses the coverage manifest and edition inventory to
  locate coursebook objectives/PDF pages, and checks applicable current official authority for disputed/current facts.
  All 70 inventoried source PDF paths exist; this is a path check, not renewed verification of their doctrine.
- Workers previously mixed leaf assignments with live interaction. Main now owns the active question, answer
  visibility, grading conversation, and persistence; read-only leaves return bounded outputs and proposed deltas.
- Clarified essential-concept grading, equivalent correct wording, grade-to-log mapping, source-conflict handling,
  explicit next-review dates, independent retrieval before mastery, and optional mock-board feedback checkpoints.
- Removed stale model selections from skills and ordinary role files. Runtime dispatch supplies supported model/effort
  pairs under the applicable policy; the main session settings were not changed.

## Agent configuration comparison

| Role                         | Previous model/effort | Revised model/effort        | Preserved sandbox |
| ---------------------------- | --------------------- | --------------------------- | ----------------- |
| `edo_tutor`                  | gpt-5.5 / medium      | Explicit dispatch selection | read-only         |
| `edo_quiz_drill`             | gpt-5.5 / low         | Explicit dispatch selection | read-only         |
| `edo_doctrine_verifier`      | gpt-5.5 / high        | Explicit dispatch selection | read-only         |
| `edo_study_guide_maintainer` | gpt-5.5 / medium      | Explicit dispatch selection | workspace-write   |

All four retain Fast, verbosity, approval settings, and existing plugin/MCP settings. TOML comparison verified that
only model/effort pins and developer instructions changed in role files. The supplied global policy directs ordinary
roles to omit pins; [official subagent documentation](https://learn.chatgpt.com/docs/agent-configuration/subagents)
also explains that role-file pins override spawn selections. Static parsing does not prove a live worker's effective
model, permissions, plugins, or behavior.

## Verification

- Seven isolated Git-fixture regression tests pass:
  `python -m unittest discover -s scripts/tests -p test_check_study_memory.py -v`.
  They cover a fresh clone without learner records, accidental tracked operational files, missing ignore rules,
  required shared evidence, malformed local records, separate learners, and local sources absent from the shared ledger.
- `python scripts/check-study-memory.py` and `sh scripts/check-study-memory.sh` pass against the actual checkout.
- `check-current-events-sources.py` and `check-guide-change-sources.py` pass;
  `check-cited-bib-sources.py` reports no exact-URL gaps.
- Global Codex unit suite: 96 tests run, OK with one skip. Initial sandbox temporary-directory errors were resolved
  by using a writable temporary directory and rerunning the suite.
- Windows `validate-orchestration.ps1` reports no static configuration errors. Its model baseline is dated
  2026-10-07; that result is not a live model-availability check.
- Four role files parse as TOML; required skill frontmatter and relative skill references validate.
- Modified Markdown passes `rumdl check`; staged and unstaged changes pass `git diff --check`.

Static scenario review covers a new learner, a resumed unanswered question, a hinted response, an equivalent correct
answer, an ambiguous prompt, an outdated coursebook claim, blocked official source access, and an unauthorized guide
edit. These are instruction checks, not observed live tutoring sessions or measured learning outcomes.

## Limits and recovery

- Git history still contains earlier tracked records. No history rewrite, commit, push, or release was performed.
  The staged deletions remove tracking when committed; local ignored copies remain available for tutoring.
- Backups of changed durable files are under ignored `scratch/study-helper-review/before/`; the operational-file
  hash manifest is `scratch/study-helper-review/local-state-manifest.json`. Both are local recovery aids, absent on
  a clean clone. Existing operational records were preserved rather than rewritten.
- A read-only reviewer reservation could not pass the coordination helper's 64 MiB snapshot budget. No worker was
  spawned; review continued in main, and the ignored coordination record marks the assignment blocked.
- Project `.codex/config.toml` declares `approval_policy = "never"`, conflicting with the supplied global policy.
  Runtime security settings were left unchanged; resolving this requires a separately scoped configuration change.
- Global Windows/WSL files were not edited, so parity changes are not applicable. The project files were validated
  locally; no separate WSL runtime or live EDO worker session was tested.
