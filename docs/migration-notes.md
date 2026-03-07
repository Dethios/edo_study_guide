# LaTeX Docker Migration Notes

Current as of 2026-03-03.

## Root file selection

- Candidate entrypoints were discovered by searching for `\documentclass{...}` in repo sources.
- Selected canonical root: `tex/main.tex`
  - Reason: this is the primary aggregate document, includes all chapter content, and is already the repo's main build target in existing scripts.
  - Alternative entrypoints (not selected): standalone/subfile demo or chapter files intended for partial builds.

## Validation log

### 1) `docker compose build`

- Command: `docker compose build`
- Result: success (`Image edo_study_guide-latex Built`)

### 2) `docker compose run --rm latex <rootfile>`

- Command: `docker compose run --rm latex tex/main.tex`
- Result: success after dependency/runtime-path fixes.
  - Produced/updated `out/main.pdf`.
  - Notable runtime warnings remained (expected in this repo): unresolved citations and style warnings, but build completed.

### 3) Confirm `build/` and `out/` usage

- Aux/log artifacts confirmed in `build/` (examples):
  - `build/main.aux`
  - `build/main.bcf`
  - `build/main.bbl`
  - `build/main.log`
- PDF artifact confirmed in `out/`:
  - `out/main.pdf`

### 4) Confirm MiKTeX cache volume creation

- Command: `docker volume ls`
- Result: named volume exists:
  - `edo_study_guide_miktex-data`

### 5) Second-run smoke test (best effort)

- Command: `docker compose run --rm latex tex/main.tex`
- Observed:
  - `miktex packages update` reported: `There are currently no updates available.`
  - `miktex packages require --package-id-file ...` completed without install/download lines.
- Interpretation:
  - No package re-download/update activity was observed on the second run startup path.
  - This satisfies the no-re-download smoke criterion (best effort), even though full compile time is still significant for this large document.

## Notable implementation fixes found during validation

- MiKTeX `latexmk` option compatibility:
  - Replaced unsupported `-force` with MiKTeX-compatible `-f`.
- Missing transitive package:
  - Added `xkeyval` to `miktex-packages.txt` after runtime detection.
- biber source resolution inside container:
  - Staged `tex/*.bib` into `build/` before build because project `latexmkrc` invokes `biber` with `--input-directory=build`.

## Architecture compatibility update (Windows ARM64 + Windows x64)

- `docker-compose.yml` now sets:
  - `platform: ${LATEX_DOCKER_PLATFORM:-linux/amd64}`
- Rationale:
  - `miktex/miktex:essential` currently publishes a single amd64 manifest.
  - Works natively on Windows x64.
  - Works on Windows ARM64 via Docker Desktop amd64 emulation.
  - Optional override remains available if an arm64 image is introduced later:
    - `LATEX_DOCKER_PLATFORM=linux/arm64 docker compose build`
    - `LATEX_DOCKER_PLATFORM=linux/arm64 docker compose run --rm latex tex/main.tex`
- `scripts/docker-build.sh` now resolves `biber` package ID dynamically per container architecture:
  - Queries MiKTeX package feed (`miktex packages list --template "{id}"`)
  - Prefers `biber-linux-*` package IDs
  - Falls back to first `biber-*` ID
  - Avoids hardcoding `biber-linux-x86_64` in `miktex-packages.txt`

### Host capability check performed in this session

- `docker version` showed this environment is `linux/arm64`.
- `docker buildx inspect --bootstrap` reported only `linux/arm64` builder platform (no `linux/amd64` emulation).
- `docker buildx imagetools inspect miktex/miktex:essential` returned a single (non-multi-arch) manifest.
- Consequence in this environment:
  - `docker compose build` with `platform=linux/amd64` fails at runtime with `exec format error`.
  - On Windows ARM64, Docker Desktop must have amd64 emulation enabled for this setup.

### Post-change validation commands (architecture patch)

- `docker compose config --quiet` -> success
- `LATEX_DOCKER_PLATFORM=linux/arm64 docker compose config --quiet` -> success (config-level override path accepted)
- `docker compose build` in this `linux/arm64` environment -> fails with `exec format error` because amd64 emulation is unavailable here

### Emulation remediation run (same day)

- Performed host checks:
  - `docker buildx inspect --bootstrap` initially reported only `linux/arm64`.
  - `docker run --rm --platform=linux/amd64 alpine uname -m` initially failed with `exec format error`.
- Applied remediation:
  - `docker run --privileged --rm tonistiigi/binfmt --install amd64`
  - Created/used multi-arch builder:
    - `docker buildx create --name multiarch --driver docker-container --use`
    - `docker buildx inspect --bootstrap`
- Post-remediation checks:
  - `docker run --rm --platform=linux/amd64 alpine uname -m` -> `x86_64`
  - `docker buildx build --platform=linux/amd64 ...` smoke test -> success (`uname -m` inside build step reported `x86_64`)
  - `docker compose build` for this repo -> success under amd64 emulation
  - `docker compose run --rm latex tex/main.tex` -> started and progressed through MiKTeX updates + biber install + latexmk/lualatex; run was manually terminated due long emulated compile duration.
- Notable warning during `docker compose build`:
  - MiKTeX apt repository signature warning (`EXPKEYSIG 277A7293F59E4889`) appeared during `apt-get update`; Ubuntu package install still completed and image build succeeded using available indexes.
- Cleanup after test:
  - Removed generated `*SAVE-ERROR*` and lock artifacts in `build/`.

### Bounded full compile test (20-minute bound)

- Command:
  - `timeout --signal=INT --kill-after=30s 20m docker compose run --rm latex tex/main.tex`
- Start time:
  - `2026-03-03T15:05:05-08:00`
- Outcome:
  - Compile progressed (MiKTeX updates, biber package resolution, latexmk/lualatex multiple passes).
  - Process did not complete inside the bound on emulated amd64.
  - Run was terminated at cutoff; exit code captured as `137`.
- Artifact check after bounded run:
  - `build/main.log` was updated (`2026-03-03T15:25:55-08:00`).
  - `out/main.pdf` timestamp did not change in this bounded run (`2026-03-02T22:00:40-08:00`).
- Cleanup:
  - Removed generated `build/main.auxlock` and `build/main.bcf-SAVE-ERROR`.

### Bounded full compile test (45-minute bound)

- Command:
  - `timeout --signal=INT --kill-after=45s 45m docker compose run --rm latex tex/main.tex`
- Start time:
  - `2026-03-03T15:27:34-08:00`
- Outcome:
  - Compile progressed further than the 20-minute run (reached later chapter processing and `latexmk` run 3 of `lualatex`).
  - Timeout wrapper did not return promptly at bound in this shell, so cutoff was enforced manually at ~45 minutes.
  - Captured run exit code: `137`.
- Artifact check after bounded run:
  - `out/main.pdf` timestamp updated during this run (`2026-03-03T16:03:08-08:00`).
  - `build/main.log` updated (`2026-03-03T16:14:00-08:00`).
- Cleanup:
  - Removed generated `build/main.auxlock` and `build/main.bcf-SAVE-ERROR`.
