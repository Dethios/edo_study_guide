# Codex Execution Packet

## Recommended Codex invocation

```bash
codex --model gpt-5.5
```

## Reasoning effort

Start with medium.
Use high only if the task requires cross-module architecture, migration design, or subtle debugging.
Use xhigh only for high-risk, repo-wide, or source-conflicted refactors.

## Objective

Create a GitHub Actions workflow that runs daily to perform workspace maintenance, including cleanup of stale artifacts, temporary files, log files, deprecated toolchain references, and validation of documentation consistency across the repository.

## Success criteria

- A new GitHub Actions workflow file exists at `.github/workflows/daily-maintenance.yml`
- The workflow runs on a daily schedule (e.g., cron: '0 0 * * *')
- The workflow cleans up identified stale files and artifacts
- The workflow validates documentation consistency between AGENTS.md, docs/USAGE.md, and actual workspace state
- The workflow reports cleanup actions taken and any inconsistencies found
- The workflow uses the openai/codex-action@v1 pattern from CodexGithubActions.md as reference

## Relevant context

### Current user intent

The user wants a daily automated action that audits the workspace for stale, deprecated, or unnecessary files and performs workspace maintenance to reduce clutter. This includes removing artifacts from old runs, one-time use scripts that were never deleted, temp files, log files, stale/old documentation, and consistency validation of repo documentation.

### Current repo state

Workspace audit findings:

- **Log files**: `projects/edo_study_guide/artifacts/build/*.log` (3 files), `projects/edo_study_guide/tex/templates/indent.log`, `projects/edo_study_guide/tex/tikz/indent.log`
- **Python cache**: `projects/edo_study_guide/scripts/__pycache__/`, `*.pyc` files
- **Temp virtual environment**: `projects/edo_study_guide/%TEMP%/edo_venv/` (should be gitignored per.gitignore)
- **LaTeX build artifacts**: `projects/edo_study_guide/artifacts/build/*.aux` (3 files)
- **Deprecated toolchain archives**: `.archive/.gemini/`, `.archive/.roo/`, `.archive/.roomodes`
- **Deprecated GitHub workflows**: `.github/workflows/gemini-*.yml` (5 files), `.github/commands/gemini-*.toml` (4 files)
- **Deprecated documentation**: `projects/edo_study_guide/GEMINI.md` (references deprecated Gemini toolchain)
- **Vector store data**: `library/qdrant-data/` (may contain stale data)

Documentation inconsistencies identified:

- AGENTS.md states "Roo Code is deprecated and is no longer part of the workflow" but `.archive/.roo/` and `.archive/.roomodes` still exist
- AGENTS.md states "Codex is the primary CLI and IDE agent runtime" but `.github/workflows/gemini-*.yml` and `.github/commands/gemini-*.toml` still reference deprecated Gemini toolchain
- `docs/USAGE.md` mentions "Roo Code usage: deprecated" but deprecated workflows remain
- `projects/edo_study_guide/GEMINI.md` references deprecated Gemini toolchain

## Likely affected files/directories

- `.github/workflows/daily-maintenance.yml` — new workflow file to create
- `.github/codex/prompts/daily-maintenance.md` — prompt file for Codex action
- `.archive/.gemini/` — deprecated Gemini tool settings (candidate for removal)
- `.archive/.roo/` — deprecated Roo Code rules (candidate for removal)
- `.archive/.roomodes` — deprecated Roo Code modes (candidate for removal)
- `.github/workflows/gemini-*.yml` — deprecated Gemini workflows (candidate for removal)
- `.github/commands/gemini-*.toml` — deprecated Gemini commands (candidate for removal)
- `projects/edo_study_guide/GEMINI.md` — deprecated documentation (candidate for removal or update)
- `projects/edo_study_guide/artifacts/build/` — LaTeX build artifacts (cleanup target)
- `projects/edo_study_guide/%TEMP%/` — temp directories (cleanup target)

## Applicable project instructions

- `AGENTS.md` — Defines workspace defaults, stable path anchors, and safety rules. States that Roo Code is deprecated and Codex is primary.
- `.codex/documentation/CodexGithubActions.md` — Reference for GitHub Actions workflow structure using openai/codex-action@v1
- `.gitignore` (root and project-specific) — Defines patterns for files that should not be tracked (e.g., .venv, **pycache**, *.log, *.aux)
- `docs/USAGE.md` — States Roo Code is deprecated and Codex is primary runtime
- `docs/active/orchestration/task-packet-contract.md` — Defines task packet structure for Codex

## Constraints

- Preserve existing public APIs unless explicitly listed below.
- Keep changes minimal and scoped to the maintenance task.
- Do not reformat unrelated files.
- Do not change dependency versions unless necessary.
- Do not delete files without explicit justification in the workflow.
- Follow all applicable AGENTS.md and repo-local instructions.
- The workflow must be non-destructive by default—report findings first, require explicit approval for deletions.
- Use the openai/codex-action@v1 pattern from CodexGithubActions.md as the reference structure.
- The workflow should run in read-only mode by default with sandbox: read-only for safety.
- If behavior is ambiguous, inspect existing patterns and choose the smallest consistent change.

## Allowed changes

- Create `.github/workflows/daily-maintenance.yml` with daily cron schedule
- Create `.github/codex/prompts/daily-maintenance.md` with maintenance instructions
- Update or remove deprecated files only after explicit reporting and user approval workflow
- Add gitignore patterns for temp directories if missing
- Create summary reports of cleanup actions

## Out of scope

- Deleting files without user approval or explicit safety checks
- Modifying active project code or documentation
- Changing the active Codex configuration or MCP server settings
- Removing files that are referenced by active workflows or documentation
- Modifying the main AGENTS.md file (except to note deprecated tool removal if approved)

## Execution instructions for Codex

Implement the objective above.

Before editing:

1. Inspect `.codex/documentation/CodexGithubActions.md` for the GitHub Actions workflow pattern
2. Review existing `.github/workflows/` files to understand current workflow structure
3. Inspect `.gitignore` patterns to understand what should be ignored vs. what needs cleanup
4. Identify the smallest safe change set for the daily maintenance workflow

During editing:

1. Create `.github/workflows/daily-maintenance.yml` following the codex-action pattern from CodexGithubActions.md
2. Create `.github/codex/prompts/daily-maintenance.md` with specific maintenance instructions
3. The prompt should instruct Codex to:

   - Scan for log files (*.log) in artifacts/ and tex/ directories
   - Scan for Python cache (**pycache**, *.pyc) directories
   - Scan for temp directories (%TEMP%, tmp-*)
   - Scan for LaTeX build artifacts (*.aux, .fdb_latexmk, etc.)
   - Check for deprecated toolchain references (.gemini, .roo, gemini-* workflows/commands)
   - Validate documentation consistency between AGENTS.md, docs/USAGE.md, and actual workspace state
   - Generate a summary report of findings
   - Propose cleanup actions but do not delete unless explicitly configured
4. Configure the workflow with:
   - Daily schedule (cron: '0 0 * * *' for midnight UTC)
   - Read-only sandbox mode by default
   - Output file for the maintenance report
   - Safety strategy: drop-sudo
5. Preserve existing style and naming conventions from other workflow files

After editing:

1. Summarize changed files (workflow file, prompt file)
2. Explain how the workflow will run and what it will report
3. List validation steps (workflow syntax check, manual run test if possible)
4. Document any remaining risks or blockers

## Validation

Run these commands if applicable:

```bash
# Validate workflow YAML syntax
yamllint .github/workflows/daily-maintenance.yml

# Or use GitHub CLI to validate
gh workflow view daily-maintenance.yml --yaml
```

If these commands fail because tooling is unavailable, report:

- command attempted: <command>
- exact failure: <failure>
- likely cause: <cause>
- suggested next validation step: <step>

## Stop conditions

Stop and ask for direction if:

- The task requires deleting or rewriting large unrelated sections.
- Required project instructions conflict.
- A dependency upgrade is needed.
- Tests indicate broad unrelated failures.
- Credentials, secrets, production data, or irreversible migrations are involved.
- The requested change is under-specified enough that multiple incompatible designs are plausible.
- The workflow would need to run with elevated permissions beyond read-only.
- The workflow would need to delete files automatically without user approval.

## Final response required from Codex

Return:

- Files changed
- Summary of implementation
- Validation commands and results
- Risks / caveats
- Suggested follow-up, if any
