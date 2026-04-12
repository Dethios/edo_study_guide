# EDO Study Guide Layout Overhaul Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Reorganize `edo_study_guide` so source, reference material, generated output, and tooling are easier to find without breaking LaTeX build, formatting, VS Code tasks, or project-exported metadata.

**Architecture:** Keep the repo root focused on source-of-truth content and build/config entrypoints. Move reference clutter into explicit `docs/reference/` or `references/` buckets, normalize chapter naming, and leave generated output ignored and secondary. Treat `tex/`, `scripts/`, `.vscode/`, and `project_export.json` as high-coupling anchors.

**Tech Stack:** git, latexmk, latexindent, bash, PowerShell, VS Code tasks/settings, Markdown, JSON

---

### Task 1: Create Explicit Homes for Reference and Archive Material

**Files:**
- Create: `/home/victor/dev-workspace/projects/edo_study_guide/docs/reference/README.md`
- Create: `/home/victor/dev-workspace/projects/edo_study_guide/docs/archive/README.md`
- Modify: `/home/victor/dev-workspace/projects/edo_study_guide/README.md`
- Modify: `/home/victor/dev-workspace/projects/edo_study_guide/AGENTS.md`

- [ ] **Step 1: Create the folder entrypoints**

```md
# Reference Docs

Imported manuals, background material, and one-off supporting docs used for editing the study guide.
```

```md
# Archive Docs

Historical setup and migration notes retained for audit history, not current day-to-day editing.
```

- [ ] **Step 2: Move generic root-side reference files into named buckets**

Planned moves:

```text
Other/ -> docs/reference/legacy/
docs/migration-notes.md -> docs/archive/migration-notes.md
docs/miktex-package-audit.md -> docs/archive/miktex-package-audit.md
```

Before moving, search callers:

```bash
rg -n "Other/|docs/migration-notes.md|docs/miktex-package-audit.md" /home/victor/dev-workspace/projects/edo_study_guide
```

- [ ] **Step 3: Update README and AGENTS to reflect the new buckets**

Add or replace these bullets:

```md
- `docs/reference/` contains imported or editor-support material.
- `docs/archive/` contains historical setup and migration notes.
- `Other/` is retired; do not add new material there.
```

- [ ] **Step 4: Verify no stale references remain**

```bash
rg -n "Other/|docs/migration-notes.md|docs/miktex-package-audit.md" /home/victor/dev-workspace/projects/edo_study_guide
git diff --check
```

- [ ] **Step 5: Commit**

```bash
git add README.md AGENTS.md docs
git commit -m "create explicit reference and archive docs"
```

### Task 2: Normalize Chapter Naming in `tex/chapters/`

**Files:**
- Modify: `/home/victor/dev-workspace/projects/edo_study_guide/tex/main.tex`
- Modify: `/home/victor/dev-workspace/projects/edo_study_guide/tex/chapters/content.tex`
- Modify: `/home/victor/dev-workspace/projects/edo_study_guide/.vscode/settings.json`
- Modify: `/home/victor/dev-workspace/projects/edo_study_guide/project_export.json`
- Rename: `/home/victor/dev-workspace/projects/edo_study_guide/tex/chapters/13_cost_price_eval.tex`
- Rename: `/home/victor/dev-workspace/projects/edo_study_guide/tex/chapters/17_JCIDS.tex`
- Rename: `/home/victor/dev-workspace/projects/edo_study_guide/tex/chapters/18_test_eval.tex`

- [ ] **Step 1: Freeze the canonical naming scheme**

Use one pattern only:

```text
NN_topic-name.tex
NNA_topic-name.tex
```

Document the chosen rule in `README.md` and `AGENTS.md` before renaming files.

- [ ] **Step 2: Search all direct references to the current filenames**

```bash
rg -n "13_cost_price_eval|17_JCIDS|18_test_eval" /home/victor/dev-workspace/projects/edo_study_guide
```

- [ ] **Step 3: Rename one file at a time and immediately update call sites**

Example rename set:

```text
13_cost_price_eval.tex -> 13C_cost-price-eval.tex
17_JCIDS.tex -> 17K_jcids.tex
18_test_eval.tex -> 18B_test-eval.tex
```

Only use names that preserve the current ordering semantics in `tex/main.tex` or `content.tex`.

- [ ] **Step 4: Run a build after each rename batch**

```bash
./scripts/build.sh tex/main.tex
```

Expected: build succeeds with no missing input-file errors.

- [ ] **Step 5: Commit**

```bash
git add tex/main.tex tex/chapters .vscode/settings.json project_export.json README.md AGENTS.md
git commit -m "normalize chapter naming"
```

### Task 3: Rebucket `tex/assets/` for Better Retrieval

**Files:**
- Modify: `/home/victor/dev-workspace/projects/edo_study_guide/tex/main.tex`
- Modify: `/home/victor/dev-workspace/projects/edo_study_guide/tex/moderntech.sty`
- Modify: `/home/victor/dev-workspace/projects/edo_study_guide/README.md`
- Modify: `/home/victor/dev-workspace/projects/edo_study_guide/project_export.json`

- [ ] **Step 1: Define sub-buckets under `tex/assets/`**

Target:

```text
tex/assets/images/
tex/assets/coursebook/
tex/assets/reference-docs/
tex/assets/reference-data/
```

- [ ] **Step 2: Search all references to current asset paths**

```bash
rg -n "tex/assets/information|tex/assets/images|graphicspath|coursebook/" /home/victor/dev-workspace/projects/edo_study_guide
```

- [ ] **Step 3: Move non-image background/reference material out of `information/`**

Example:

```text
tex/assets/information/*.pdf -> tex/assets/reference-docs/
tex/assets/information/*.md -> tex/assets/reference-data/
```

- [ ] **Step 4: Update graphics and file lookup paths**

Touch these likely surfaces:

```text
tex/moderntech.sty
tex/main.tex
.vscode/settings.json
scripts/Environment/wsl-env-export/vscode/*.json
```

- [ ] **Step 5: Verify path integrity**

```bash
./scripts/build.sh tex/main.tex
rg -n "tex/assets/information" /home/victor/dev-workspace/projects/edo_study_guide
```

Expected: build passes and old path references are gone or intentionally archived.

- [ ] **Step 6: Commit**

```bash
git add tex README.md project_export.json .vscode/settings.json scripts/Environment
git commit -m "rebucket study guide assets"
```

### Task 4: Clean Root Visibility Without Moving Core Build Anchors

**Files:**
- Modify: `/home/victor/dev-workspace/projects/edo_study_guide/README.md`
- Modify: `/home/victor/dev-workspace/projects/edo_study_guide/.gitignore`

- [ ] **Step 1: Confirm generated and local-only paths are ignored**

Review:

```bash
rg -n "%TEMP%|build/|out/|__pycache__" /home/victor/dev-workspace/projects/edo_study_guide/.gitignore
git status --ignored
```

- [ ] **Step 2: Remove committed generated or obsolete root files if they are no longer part of the supported workflow**

Candidate review list:

```text
Dockerfile.miktex
docker-compose.yml
miktex-packages.txt
```

Only keep them if the current README still supports those paths.

- [ ] **Step 3: Commit**

```bash
git add README.md .gitignore
git commit -m "clean root visibility for study guide"
```

### Task 5: Update Exported and Absolute-Path Tooling

**Files:**
- Modify: `/home/victor/dev-workspace/projects/edo_study_guide/scripts/Environment/wsl_vscode_setup.ipynb`
- Modify: `/home/victor/dev-workspace/projects/edo_study_guide/scripts/Environment/wsl-env-export/vscode/machine-settings.json`
- Modify: `/home/victor/dev-workspace/projects/edo_study_guide/scripts/Environment/wsl-env-export/vscode/workspace-settings.json`
- Modify: `/home/victor/dev-workspace/projects/edo_study_guide/scripts/Environment/wsl-env-export/vscode/windows-settings.json`

- [ ] **Step 1: Search stale absolute paths**

```bash
rg -n "/home/victor/projects/edo/main|PandocCiter.DefaultBib" /home/victor/dev-workspace/projects/edo_study_guide/scripts/Environment
```

- [ ] **Step 2: Replace with repo-relative or current absolute paths**

Preferred forms:

```text
${workspaceFolder}/tex/edo.bib
/home/victor/dev-workspace/projects/edo_study_guide/tex/edo.bib
```

Use the most portable option available in each settings surface.

- [ ] **Step 3: Commit**

```bash
git add scripts/Environment
git commit -m "fix exported path assumptions"
```

## Verification

Run after every move batch:

```bash
./scripts/build.sh tex/main.tex
./scripts/format.sh tex/main.tex
git diff --check
```

## Self-Review

- Scope coverage: addresses root visibility, docs/reference separation, chapter naming, asset rebucketing, and exported-path cleanup.
- Placeholder scan: no TODO/TBD placeholders remain.
- Consistency: all tasks treat `tex/`, `scripts/`, `.vscode/`, and `project_export.json` as path anchors.
