# Codex Cloud environment scripts (LaTeX)

Codex Cloud environments support a **setup script** (runs once per cache build) and an optional
**maintenance script** (runs when a cached container is resumed). This repo is a LuaLaTeX + `latexmk`
project, so Codex Cloud needs TeX Live + helpers installed before it can run `latexmk`.

Files:
- `.codex/setup.sh`: installs TeX Live (apt) + required binaries/fonts for this repo.
- `.codex/maintenance.sh`: quick sanity checks + font database refresh for cached containers.

Suggested Codex Cloud environment configuration (in `chatgpt.com/codex/settings/environments`):
- **Setup script**: paste the contents of `.codex/setup.sh` (recommended for automatic cache invalidation). If you instead run `bash .codex/setup.sh`, changing the repo script will not automatically reset the environment cache.
- **Maintenance script** (optional): paste the contents of `.codex/maintenance.sh`, or run `bash .codex/maintenance.sh`.
