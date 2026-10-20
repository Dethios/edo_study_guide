# Agent workflow maintenance checkpoint

Current as of 2026-10-20. Scope: repository instructions, skills, configuration, and contributor workflow only.

## Phase 1: inspection complete

- Baseline: `e8b2ef1` (`Prepare October 20 study guide release`); clean worktree, no staged diff or stashes.
- Read root `AGENTS.md`, all six README files, CONTRIBUTING, SECURITY, all five skills and four agent roles,
  `.codex/config.toml`, setup/maintenance scripts, build scripts, Makefile, release workflow, editor settings,
  task packets and historical plans. Only one AGENTS.md; no agents.me, nested overrides, or devcontainer.
- Preserve October coursebook/policy/layout work and historical plans. Do not execute their unfinished content tasks.
- Findings: retired ChatGPT-sign-in GPT-5.5 defaults; stale workspace paths; duplicate tutor/router/drill roles;
  broken parallel-review shared contract; excessive reasoning/review defaults; missing image-only PDF review rules;
  approval/network/plugin/MCP settings copied into agent files; `--clean` incorrectly described as rebuilding.
- Current official OpenAI models, AGENTS.md, skills, subagents, Cloud and configuration pages retrieved on 2026-10-20.
  Detailed links and surface-specific conclusions will live in `.codex/README.md`.
- Observed: hosted collaboration tools advertise Sol/Astra; CLI 0.159.2 exists, but it is not this task runtime.
  No claim of Cloud loading repository TOML or switching the running model.

## Implementation plan

- [x] Phase 2: concise AGENTS; canonical skills in `.agents/skills`; consolidate overlapping tutor/router/review
  workflows; minimal local-client configuration and one read-only evidence/review role; dated source register.
- [x] Phase 3: reconcile README/contribution/setup instructions with scripts; preserve LuaLaTeX/minted/source macros;
  label stale imported task packets as historical without executing them.
- [x] Phase 4: lint Markdown, parse YAML/TOML, validate links and role/skill references; run existing relevant checks,
  review final diff and unchanged study content; record unavailable runtime/build checks explicitly.

## Validation and next step

Independent baseline scenario review confirmed image-only coverage, effective-date reconciliation, excessive reasoning,
clean/build mismatch and tutoring-write contradictions. Phase 2 implemented: four focused skills, one optional reviewer,
Sol/medium local-client defaults, no approval/network/MCP/plugin overrides. Next: reconcile README and setup guidance,
then validate local-client discovery separately from hosted behavior.
Initial scope did not authorize commits or pushes; follow-up authorization is recorded below.
Publication, global configuration edits and study-guide content edits remain out of scope.

## Phase 3: documentation implemented

README/contribution commands now match clean/build and release-only CI behavior. `.codex/README.md` records the
2026-10-20 official source register, discovery/surface boundaries, local Sol/medium defaults, one optional role,
recommended escalation and exact manual Cloud actions. Historical task packets are labeled and preserved; coursebook
instructions link canonical skills. Legacy install helpers remain unchanged and explicitly unverified for this distro;
no system provisioning or environment settings changed. Next: metadata/link/lint checks and runtime discovery probes.

## Phase 4: validation and review

- `git diff --check`: passed. Python `tomllib`/PyYAML parsed configuration, role, existing task YAML and release
  workflow. All four skill frontmatters have matching unique names and descriptions; active Markdown links resolve.
- `make check-acronyms check-tex-structure check-tikz-cache`: passed. `make check-study-memory` initially failed because
  uv tried its read-only global cache; passed with `UV_CACHE_DIR=$PWD/scratch/agent-workflow/uv-cache`.
  `TMPDIR=$PWD/scratch/agent-workflow scripts/tests/test-check-acronyms.sh`: passed.
- `./scripts/build.sh --help`: verified documented engine, clean-and-exit and output/auxiliary options.
  No build scripts, TeX, bibliography, acronym data or CI behavior changed; no PDF rebuild was needed/run.
  SHA-256 comparison to HEAD confirms the tracked PDF is unchanged. No study-content rewrite performed.
- CLI 0.159.2 bundled catalog lists Sol/Astra and supported efforts; this is not live account entitlement verification.
  Inherited-home `debug prompt-input` failed read-only; an isolated CLI home inside ignored scratch succeeded and
  included root instructions and all four skills. `--strict-config` is unsupported for debug, so strict app-server
  initialize/config-read/skills-list were tested instead: project defaults loaded, cap=2, four enabled skills, no
  errors. First app-server probe timed out due to captured logging; rerun with drained output succeeded. Role spawn
  untested.
- Network permission review for a repo-local rumdl installation timed out; one retry succeeded. Installed rumdl 0.3.0
  under ignored scratch only; no global packages/settings changed. Active docs formatted and linted; historical packet
  lint compared with HEAD: daily packet has 9 existing findings and the historical implementation plan has 59, unchanged
  by the status banners. Active changed docs/skills pass rumdl (11 files); archived bodies were not mass-formatted.
- Independent read-only reviewer checked the five baseline scenarios before/after. Visual coverage, effective dates,
  bounded formatting, documentation-only validation and tutoring edit boundaries are resolved. Corrected its one
  checkpoint role-count finding and preserved usual [H]/acronym-grouping conventions. No remaining blocking finding.

## Remaining limits and next step

Named local-role spawning, hosted automatic skill/TOML loading, live model entitlements and Sol-versus-Astra
benchmarking were not exercised. Legacy installer package names, absent Poppler/rumdl provisioning and user-specific VS
Code paths remain documented limitations; setup scripts and global/environment settings were deliberately not changed.
Manual Cloud install/start setup and republishing, plus composer model selection, are described in `.codex/README.md`.
Final metadata/link checks passed; content/build/CI path diff is empty and PDF hash matches HEAD.

## Phase 5: commit and push authorized

The user explicitly requested committing and pushing these updates. Current branch: `work`; remote: `origin`
(`Dethios/edo_study_guide`). Rechecked status/diff, Markdown lint and all previously run repository checks; all passed.
Commit only the reviewed workflow changes, then push `work` without force or release publication. Verify the resulting
commit, remote branch and clean worktree before reporting delivery. Recheck current files if interrupted.
