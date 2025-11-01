# Workspace Instructions (applies to all AI in this repo)

- Treat `Other/project_export.json` as project memory and single source of truth.
- Prefer primary sources and dated citations. Stamp deliverables “Current as of [YYYY-MM-DD]”.
- Default to “Board Prep” style unless I ask for Mastery.
- When I say “Update memory,” propose a JSON Merge Patch (RFC 7396) against `Other/project_export.json`.
- Never leak secrets; redact as `[REDACTED]`.
