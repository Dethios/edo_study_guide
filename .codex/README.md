# Codex workflow and runtime verification

Verified 2026-10-20 against current official OpenAI documentation and this hosted session. Recheck availability before
future model or configuration migrations. This file documents runtime behavior; `AGENTS.md` contains repository rules.

## What is configured

- `.codex/config.toml` sets `gpt-6.1-sol`, `medium`, and at most two concurrent child threads for trusted local Codex
  clients. It does not change this running task or establish a hosted Cloud default.
- `.codex/agents/edo_doctrine_verifier.toml` defines one optional evidence/consistency reviewer for current local
  clients. Spawning this named local role has not been exercised. Its explicit Sol/medium settings take precedence over
  requested model/effort in that client; edit the role file for a deliberate local override. The role asks for no edits
  but does not establish an independent read-only sandbox.
- `.agents/skills/*/SKILL.md` holds four instruction-only workflows: tutoring, evidence/PDF review, bounded maintenance
  and selective independent review. There are no bundled scripts, assets, references or optional `agents/openai.yaml`.
- Removed the duplicate tutor/router and separate tutor/drill/maintainer agent definitions. The main agent handles
  tutoring, implementation and integration. Removed approval, network, service-tier, plugin and MCP overrides.

No global/account settings were changed. Runtime permissions and access controls remain authoritative.

## Discovery and precedence

| File                                                          | Intended consumer and status                                                                                       |
| ------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| Root `AGENTS.md`                                              | Codex project instructions; only such file in this checkout. No `agents.me` or nested override exists.             |
| `.agents/skills/*/SKILL.md`                                   | Documented repository discovery path for local Codex. Hosted tasks can read linked files explicitly.               |
| `.codex/agents/*.toml`                                        | Current local Codex standalone agent definitions, discovered by the client; not merely an arbitrary agents folder. |
| `.codex/config.toml`                                          | Trusted local-client project configuration; no evidence this hosted runtime loads it.                              |
| README and CONTRIBUTING                                       | Human documentation, not automatic runtime settings. Linked from project instructions.                             |
| `.codex/setup.sh`, `.codex/maintenance.sh`                    | Explicitly invoked legacy provisioning helpers; filenames alone do not register Cloud install/start behavior.      |
| `.agents/tasks/`, `.agents/plans/`                            | Imported historical task packets, not discovered roles or active instructions.                                     |
| `docs/archive/`, dated session package, `project_export.json` | Historical reference/memory; not current setup or task authorization.                                              |
| `.vscode/`                                                    | Local editor settings only; includes user-specific paths and an absent Windows build script. Not Cloud setup.      |
| `.github/workflows/release.yml`                               | Explicit release automation; copies the tracked PDF and publishes it. Does not build, test or enable agents.       |

Codex's documented instruction discovery uses `AGENTS.override.md` before `AGENTS.md` per directory, from root to
working directory; deeper guidance wins within its scope. Task/platform instructions still take precedence. Local
project config requires trust and is subject to explicit overrides and managed requirements. Do not alter global trust
to force loading.

Local skills moved from `.codex/skills` to `.agents/skills`; the redundant orchestrator was folded into the tutor and
root routing guidance. No live references to the old skill paths were found. Historical packets retain their original
paths and assumptions with explicit status banners. Their unchecked steps are not evidence of pending current work.

## Recommended arrangement

These are workload recommendations, not performance benchmarks or automatic Cloud routing:

| Workload                                                        | Starting choice when available                          | Escalation / tradeoff                                                                                 |
| --------------------------------------------------------------- | ------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| Orchestration, bounded TeX/figure edits, build triage, tutoring | GPT-6.1 Sol (`gpt-6.1-sol`), medium                     | Low for settled recall or mechanical bookkeeping if quality holds.                                    |
| Coursebook extraction and visual evidence review                | Sol, medium, image-capable tools                        | High for ambiguous diagrams or incomplete source coverage; model effort cannot replace viewing pages. |
| Official-source reconciliation                                  | Sol, medium for straightforward checks                  | Sol high or GPT-6 Astra (`gpt-6-astra`) for difficult authority/effective-date conflicts.             |
| Comprehensive cross-chapter audit                               | Astra at its default/low, increase to high if justified | Higher cost/latency can pay off on difficult synthesis; scope must authorize an audit.                |
| Independent consistency/completeness review                     | One Sol reviewer, medium                                | High for complex dependencies; add a second worker only for a disjoint substantial question.          |

Start sequentially unless a substantial independent evidence/review slice benefits from delegation. Give workers exact
inputs, findings format, ownership and validation requirements. One writer per file; one build per shared output/cache.
Main agent checks integration. If selection or subagents are unavailable, use the current model and sequential passes.
Do not add blanket maximum reasoning, automatic six-reviewer fan-out, or a separate agent for each tutoring turn.

## Observed support and limits

- This hosted session exposes subagent tools and advertises both `gpt-6.1-sol` and `gpt-6-astra` with low, medium, high,
  xhigh, max and ultra choices. One inherited-model read-only reviewer was actually used. Separate Sol/Astra inference
  calls and comparative quality/cost benchmarks were not performed; advertised choices are not a guarantee of future
  account availability. The exact underlying model serving the main task is not independently exposed here.
- Installed CLI: `codex-cli 0.159.2`. Its bundled model catalog lists both models, low default, and the same six levels.
  This is a shipped catalog, not a live entitlement check. API docs list Sol medium default and five efforts through
  max; API parameters/defaults must not be copied into Cloud configuration. Ultra in the hosted/client UI includes
  delegation.
- Official model docs retire GPT-5.5 for ChatGPT-signed-in Codex on 2026-10-14. API-key sessions are a different case.
  Active repository defaults no longer request it. Historical provenance mentioning older models is preserved.
- This hosted session's skill catalog did not advertise repository skills or load local custom roles as named agent
  types. `AGENTS.md` links all skills for explicit reading. Local discovery and hosted availability are separate checks.
- `codex debug prompt-input` against the inherited CLI home failed with a read-only filesystem error; this does not
  prove skill discovery failed. `--strict-config` is unsupported for that debug command. See the checkpoint for final
  checks.
- TeX tools are present in this session, but full-build dependencies must be checked. A tool on PATH does not establish
  a complete TeX Live/fonts/Biber/minted installation or usable Docker daemon.

## Cloud setup and manual actions

Current Cloud documentation uses **Install script** and **Start skill**, rather than the old cache-maintenance
instructions previously documented here. Repository script presence does not configure either field.

1. In **Settings > Codex Cloud > Environments**, select this environment's **Edit** action. Ask setup to provision
   native LuaLaTeX, latexmk, Biber, Pygments/minted dependencies, required TeX packages/fonts and Poppler (`pdfinfo`,
   `pdftotext`, `pdftoppm`). Include `make`, Python 3 and `rumdl` for repository checks. Test
   `./scripts/build.sh tex/main.tex` there.
2. Review the tested **Install script** and use **Start skill** for readiness checks. The existing `.codex/setup.sh` is
   a Debian/Ubuntu legacy helper, not a tested install recipe for this environment: required package names such as
   `texlive-generic-extra`, `texlive-koma-script` and `texlive-math-extra` are distribution-dependent/unavailable here,
   and it does not install Poppler or rumdl. `.codex/maintenance.sh` can invoke that installer when tools are missing.
   Do not register either blindly or run provisioning during an ordinary repository edit.
3. Save and **Republish** the prepared environment, then start a new task to use it. This task has not changed or
   republished environment settings. No automatic cache-invalidation claim is made for changes to repository scripts.
4. Choose **GPT-6.1 Sol / Medium** in the model/reasoning control beneath the composer for routine hosted work, if
   offered. Choose Astra or higher effort only for a justified escalation. If absent, use an available model;
   administrators may control availability. No repository edit changes the currently running model.
5. Configure network destinations only through supported environment controls when research needs access. The observed
   executor permits package-manager destinations, not general policy/document sites. Connected web research worked for
   official OpenAI verification; it does not grant shell network access. Do not bypass the proxy or relax approval
   rules.

Local CLI/IDE/desktop configuration and custom agent files are distinct from hosted task controls. API model IDs and
reasoning options establish API capability, not Cloud entitlement. No API application or Agents SDK configuration is
needed for this repository.

## Official sources checked

All retrieved on **2026-10-20**. Legacy developers.openai.com Codex links redirect to the linked OpenAI documentation.

- [Models](https://learn.chatgpt.com/docs/models): signed-in Codex availability, model controls and GPT-5.5 retirement.
- [Subagents](https://learn.chatgpt.com/docs/agent-configuration/subagents): delegation, local standalone role files,
  inheritance and parent permissions. This is the basis for removing redundant role registrations and permission keys.
- [AGENTS.md](https://learn.chatgpt.com/docs/agent-configuration/agents-md): instruction discovery and scope.
- [Build skills](https://learn.chatgpt.com/docs/build-skills): `.agents/skills`, required metadata and local discovery.
- [Config basics](https://learn.chatgpt.com/docs/config-file/config-basic) and
  [configuration reference](https://learn.chatgpt.com/docs/config-file/config-reference): local project configuration,
  trust and model-dependent effort settings.
- [Codex Cloud](https://learn.chatgpt.com/docs/cloud) and
  [cloud environments](https://learn.chatgpt.com/docs/environments/cloud-environments): install/start fields,
  environment review/publishing and saved-state boundaries.
- [Using GPT-6](https://developers.openai.com/api/docs/guides/latest-model?model=gpt-6.1-sol): Sol/Astra positioning and
  API reasoning options; used only to inform model tradeoffs, not to configure the hosted runtime.
