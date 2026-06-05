#!/usr/bin/env sh
set -eu

main_file="tex/main.tex"
chapters_dir="tex/chapters"

if [ ! -f "$main_file" ]; then
  echo "Missing $main_file" >&2
  exit 1
fi

if [ ! -d "$chapters_dir" ]; then
  echo "Missing $chapters_dir" >&2
  exit 1
fi

tmp_dir="${TMPDIR:-/tmp}/edo-tex-structure.$$"
mkdir -p "$tmp_dir"
trap 'rm -rf "$tmp_dir"' EXIT HUP INT TERM

included="$tmp_dir/included.txt"
chapter_files="$tmp_dir/chapter-files.txt"
orphaned="$tmp_dir/orphaned.txt"
missing="$tmp_dir/missing.txt"

sed -n -E 's/^[[:space:]]*\\(ChapterWithRefsAtStart|StudySubfile)\{([^}]+)\}.*/\2.tex/p' "$main_file" \
  | sort -u > "$included"

find "$chapters_dir" -maxdepth 1 \( -type f -o -type l \) -name '*.tex' -printf '%f\n' \
  | sort -u > "$chapter_files"

comm -23 "$chapter_files" "$included" > "$orphaned"
comm -13 "$chapter_files" "$included" > "$missing"

status=0

if [ -s "$orphaned" ]; then
  status=1
  echo "Active chapter files not included by $main_file:" >&2
  sed 's/^/  - /' "$orphaned" >&2
fi

if [ -s "$missing" ]; then
  status=1
  echo "Included chapters missing from $chapters_dir:" >&2
  sed 's/^/  - /' "$missing" >&2
fi

for file in "$chapters_dir"/*.tex; do
  [ -f "$file" ] || continue

  if grep -Eq '\\ac(spl|s|pl|p)?\{' "$file" && ! grep -q '\\printnoidxglossary' "$file"; then
    status=1
    echo "Acronym-using chapter missing standalone acronym glossary: $file" >&2
  fi

  if ! grep -Eq '^[[:space:]]*\\subsection\*?\{Summary\}' "$file"; then
    status=1
    echo "Chapter missing Summary subsection: $file" >&2
  fi

  if ! grep -Eq '^[[:space:]]*\\subsection\*?\{Quick Review\}' "$file"; then
    status=1
    echo "Chapter missing Quick Review subsection: $file" >&2
  fi

  if awk '
    /\\printnoidxglossary/ { after = 1; next }
    after && /^[[:space:]]*\\(section|subsection|subsubsection|paragraph)\{/ { print FNR ":" $0; bad = 1 }
    after && /^[[:space:]]*\\begin\{(itemize|description|longtblr|figure|table|quote|verbatim)\}/ { print FNR ":" $0; bad = 1 }
    END { exit bad ? 0 : 1 }
  ' "$file" > "$tmp_dir/content-after-glossary.txt"; then
    status=1
    echo "Substantive content appears after standalone acronym glossary in $file:" >&2
    sed 's/^/  - /' "$tmp_dir/content-after-glossary.txt" >&2
  fi
done

for file in "$chapters_dir"/appendix*.tex; do
  [ -f "$file" ] || continue
  if grep -Fq '\IfSubfilesClassLoaded{\chapter{EDO Study Guide}}{}' "$file"; then
    status=1
    echo "Appendix standalone title is still generic: $file" >&2
  fi
done

if [ "$status" -eq 0 ]; then
  echo "TeX structure check passed."
fi

exit "$status"
