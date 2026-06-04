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

if [ "$status" -eq 0 ]; then
  echo "TeX structure check passed."
fi

exit "$status"
