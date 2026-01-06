#!/usr/bin/env python3
import argparse
import json
import os
import sys
from pathlib import Path

CONFIG_DEFAULT = "settings_sources.json"

def strip_jsonc_comments(text: str) -> str:
    """Remove // and /* */ comments while preserving string literals."""
    result = []
    in_string = False
    in_line_comment = False
    in_block_comment = False
    escape = False
    i = 0
    length = len(text)
    while i < length:
        ch = text[i]
        nxt = text[i + 1] if i + 1 < length else ""
        if in_line_comment:
            if ch == "\n":
                in_line_comment = False
                result.append(ch)
            i += 1
            continue
        if in_block_comment:
            if ch == "*" and nxt == "/":
                in_block_comment = False
                i += 2
            else:
                i += 1
            continue
        if in_string:
            result.append(ch)
            if escape:
                escape = False
            elif ch == "\\":
                escape = True
            elif ch == '"':
                in_string = False
            i += 1
            continue
        if ch == '"':
            in_string = True
            result.append(ch)
            i += 1
            continue
        if ch == "/" and nxt == "/":
            in_line_comment = True
            i += 2
            continue
        if ch == "/" and nxt == "*":
            in_block_comment = True
            i += 2
            continue
        result.append(ch)
        i += 1
    return "".join(result)

def load_jsonc(path: Path) -> dict:
    text = path.read_text(encoding="utf-8")
    stripped = strip_jsonc_comments(text)
    return json.loads(stripped)

def write_text_if_changed(path: Path, content: str) -> bool:
    existing = path.read_text(encoding="utf-8") if path.exists() else None
    if existing == content:
        return False
    path.write_text(content, encoding="utf-8")
    return True

def load_config(path: Path) -> dict:
    config = load_jsonc(path)
    if "master" not in config or "sources" not in config:
        raise ValueError("Config must include 'master' and 'sources'.")
    return config

def read_settings(path: Path, kind: str) -> dict:
    if kind == "workspace":
        data = load_jsonc(path)
        return data.get("settings", {})
    return load_jsonc(path)

def split_camel(token: str) -> str:
    result = []
    buf = ""
    for idx, ch in enumerate(token):
        if idx > 0 and ch.isupper() and (token[idx - 1].islower() or (idx + 1 < len(token) and token[idx + 1].islower())):
            result.append(buf)
            buf = ch
        else:
            buf += ch
    if buf:
        result.append(buf)
    return " ".join(result)

def humanize_key(key: str) -> str:
    if key.startswith("["):
        return f"language overrides for {key}"
    base = key.replace(".", " ").replace("_", " ").replace("-", " ")
    tokens = [split_camel(tok) for tok in base.split()]
    text = " ".join(tokens)
    text = text.replace("C Cpp", "C/C++")
    return text.strip()

def describe_key(key: str, value) -> str:
    if key.startswith("["):
        return f"Language-specific overrides for {key}. Update the settings inside this object to change behavior."
    name = humanize_key(key)
    lowered = key.lower()
    if lowered.endswith("colortheme"):
        action = "Set the UI color theme"
    elif lowered.endswith("icontheme"):
        action = "Set the icon theme"
    elif "fontfamily" in lowered:
        action = f"Set {name} font family"
    elif "fontsize" in lowered:
        action = f"Set {name} font size"
    elif "fontweight" in lowered:
        action = f"Set {name} font weight"
    elif lowered.endswith("enabled") or ".enabled" in lowered or lowered.endswith("enable"):
        action = f"Enable or disable {name}"
    elif isinstance(value, bool):
        action = f"Enable or disable {name}"
    elif isinstance(value, (int, float)):
        action = f"Set numeric value for {name}"
    elif isinstance(value, list):
        action = f"Define list for {name}"
    elif isinstance(value, dict):
        action = f"Define object/map for {name}"
    else:
        action = f"Set {name}"
    return f"{action}. Edit the value to change behavior."

def group_definitions():
    return [
        ("Workbench", "UI, layout, and workbench behavior.", ["workbench."]),
        ("Window", "Window and workspace startup behavior.", ["window."]),
        ("Editor", "Editor behavior, formatting, and suggestions.", ["editor.", "diffEditor."]),
        ("Files", "File handling, auto-save, and excludes.", ["files."]),
        ("Explorer", "File explorer behavior and nesting.", ["explorer."]),
        ("Terminal", "Integrated terminal behavior and appearance.", ["terminal."]),
        ("SCM and Git", "Source control and Git behavior.", ["scm.", "git."]),
        ("Notebook", "Notebook UI behavior.", ["notebook."]),
        ("Markdown", "Markdown preview and extensions.", ["markdown.", "markdown-preview-enhanced.", "markdown.extension."]),
        ("LaTeX and LTeX", "LaTeX tooling and grammar checks.", ["latex-workshop.", "ltex."]),
        ("Spellcheck", "cSpell configuration and dictionaries.", ["cSpell."]),
        ("Language: JavaScript", "JavaScript formatter and language settings.", ["javascript."]),
        ("Language: TypeScript", "TypeScript formatter and language settings.", ["typescript."]),
        ("Language: Python", "Python language settings.", ["python.", "pythonIndent."]),
        ("Language: C/C++", "C/C++ extension settings.", ["C_Cpp."]),
        ("Language: Emmet", "Emmet expansion settings.", ["emmet."]),
        ("JSON", "JSON schema and language settings.", ["json."]),
        ("Extensions and Tools", "Extension-specific settings and utilities.", [
            "extensions.",
            "errorLens.",
            "evenBetterToml.",
            "code-runner.",
            "todo-tree.",
            "grunt.",
            "gulp.",
            "npm.",
            "mermaid-chat.",
            "vscode-office.",
            "prettier.",
        ]),
        ("Chat and AI", "Chat, Copilot, and AI tooling.", ["chat.", "github.", "geminicodeassist."]),
        ("Application", "Application-level experimental settings.", ["application."]),
        ("Language Overrides", "Per-language override blocks.", []),
    ]

def assign_groups(keys):
    remaining = set(keys)
    grouped = []
    for name, description, prefixes in group_definitions():
        if name == "Language Overrides":
            matched = sorted([k for k in remaining if k.startswith("[")])
        else:
            matched = sorted([k for k in remaining if any(k.startswith(prefix) for prefix in prefixes)])
        if matched:
            grouped.append((name, description, matched))
            remaining -= set(matched)
    if remaining:
        grouped.append(("Other", "Settings that do not match a primary group.", sorted(remaining)))
    return grouped

def format_value(value, indent_level=4):
    return json.dumps(value, indent=4, sort_keys=True, ensure_ascii=True)

def render_master(settings: dict) -> str:
    lines = ["{"]
    groups = assign_groups(settings.keys())
    indent = " " * 4
    for group_index, (group_name, description, keys) in enumerate(groups):
        if group_index > 0:
            lines.append("")
        lines.append(f"{indent}// ===================================================================")
        lines.append(f"{indent}// {group_name} - {description}")
        lines.append(f"{indent}// ===================================================================")
        for key_index, key in enumerate(keys):
            value = settings[key]
            comment = describe_key(key, value)
            lines.append(f"{indent}// {key}: {comment}")
            value_text = format_value(value)
            value_lines = value_text.splitlines()
            is_last_entry = group_index == len(groups) - 1 and key_index == len(keys) - 1
            if len(value_lines) == 1:
                line = f"{indent}\"{key}\": {value_lines[0]}"
                if not is_last_entry:
                    line += ","
                lines.append(line)
            else:
                lines.append(f"{indent}\"{key}\": {value_lines[0]}")
                for inner_line in value_lines[1:]:
                    lines.append(f"{indent}{inner_line}")
                # Add trailing comma to the last line of this value unless it is the final entry
                if not is_last_entry:
                    lines[-1] = lines[-1] + ","
    lines.append("}")
    return "\n".join(lines) + "\n"

def merge_settings(config: dict, strategy: str, allow_prompt: bool) -> dict:
    sources = config.get("sources", [])
    master_path = Path(config["master"]).expanduser()
    master_data = {}
    if master_path.exists():
        try:
            master_data = load_jsonc(master_path)
        except Exception:
            master_data = {}

    source_data = {}
    missing_sources = []
    for source in sources:
        name = source.get("name", source.get("path"))
        kind = source.get("kind", "settings_json")
        path = Path(source["path"]).expanduser()
        if not path.exists():
            missing_sources.append(str(path))
            continue
        source_data[name] = read_settings(path, kind)

    keys = set(master_data.keys())
    for data in source_data.values():
        keys.update(data.keys())

    merged = {}
    for key in sorted(keys):
        values = {name: data[key] for name, data in source_data.items() if key in data}
        if not values:
            merged[key] = master_data.get(key)
            continue
        unique_values = {json.dumps(v, sort_keys=True) for v in values.values()}
        if len(unique_values) == 1:
            merged[key] = next(iter(values.values()))
            continue
        merged[key] = resolve_conflict(key, values, master_data.get(key), strategy, allow_prompt)

    return merged

def resolve_conflict(key: str, values: dict, master_value, strategy: str, allow_prompt: bool):
    if strategy == "prefer-master" and master_value is not None:
        return master_value
    if strategy.startswith("prefer-"):
        preferred = strategy.split("-", 1)[1]
        if preferred in values:
            return values[preferred]
    if strategy == "prefer-first":
        return values[next(iter(values))]
    if strategy == "prompt":
        if not allow_prompt or not sys.stdin.isatty():
            raise RuntimeError(
                f"Conflict on '{key}' and interactive prompt is not available. "
                "Run with --strategy prefer-master|prefer-<source>|prefer-first, or in a TTY."
            )
        return prompt_for_conflict(key, values, master_value)
    raise RuntimeError(f"Unknown conflict strategy: {strategy}")

def prompt_for_conflict(key: str, values: dict, master_value):
    print(f"Conflict for setting: {key}")
    options = []
    if master_value is not None:
        options.append(("master", master_value))
    for name, value in values.items():
        options.append((name, value))
    for idx, (name, value) in enumerate(options, start=1):
        preview = json.dumps(value, ensure_ascii=True, sort_keys=True)
        if len(preview) > 120:
            preview = preview[:117] + "..."
        print(f"  {idx}) {name}: {preview}")
    choice = input("Choose value to keep (number): ").strip()
    try:
        selected = int(choice)
        if not (1 <= selected <= len(options)):
            raise ValueError
    except ValueError as exc:
        raise RuntimeError("Invalid selection.") from exc
    return options[selected - 1][1]

def sync_settings(config: dict, strategy: str, allow_prompt: bool) -> int:
    master_path = Path(config["master"]).expanduser()
    if not master_path.exists():
        print(f"Master settings file not found: {master_path}")
        return 1
    master_data = load_jsonc(master_path)
    sources = config.get("sources", [])
    for source in sources:
        if not source.get("sync", True):
            continue
        path = Path(source["path"]).expanduser()
        kind = source.get("kind", "settings_json")
        if kind != "settings_json":
            continue
        path.parent.mkdir(parents=True, exist_ok=True)
        content = render_master(master_data)
        write_text_if_changed(path, content)
    return 0

def main():
    parser = argparse.ArgumentParser(description="Manage VS Code settings sync and merge.")
    parser.add_argument("command", choices=["merge", "sync"], help="Action to perform.")
    parser.add_argument("--config", default=CONFIG_DEFAULT, help="Path to settings_sources.json")
    parser.add_argument("--strategy", default=None, help="Conflict strategy: prompt, prefer-master, prefer-<source>, prefer-first")
    parser.add_argument("--no-prompt", action="store_true", help="Fail on conflicts instead of prompting.")
    args = parser.parse_args()

    config_path = Path(args.config).expanduser()
    if not config_path.exists():
        raise SystemExit(f"Config not found: {config_path}")
    config = load_config(config_path)
    strategy = args.strategy or config.get("conflict_strategy", "prompt")
    allow_prompt = not args.no_prompt

    if args.command == "merge":
        merged = merge_settings(config, strategy, allow_prompt)
        master_path = Path(config["master"]).expanduser()
        output = render_master(merged)
        changed = write_text_if_changed(master_path, output)
        if changed:
            print(f"Updated master settings: {master_path}")
        else:
            print(f"Master settings already up to date: {master_path}")
    elif args.command == "sync":
        return_code = sync_settings(config, strategy, allow_prompt)
        if return_code != 0:
            raise SystemExit(return_code)

if __name__ == "__main__":
    main()
