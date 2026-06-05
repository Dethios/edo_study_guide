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
label_records="$tmp_dir/label-records.txt"
label_keys_all="$tmp_dir/label-keys-all.txt"
label_keys="$tmp_dir/label-keys.txt"
duplicate_labels="$tmp_dir/duplicate-labels.txt"
ref_records="$tmp_dir/ref-records.txt"
ref_keys="$tmp_dir/ref-keys.txt"
missing_refs="$tmp_dir/missing-refs.txt"

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

awk '
  function emit_labels(text, loc, m) {
    while (match(text, /\\label\{[^}]+\}/)) {
      m = substr(text, RSTART, RLENGTH)
      sub(/^\\label\{/, "", m)
      sub(/\}$/, "", m)
      print m "|" loc
      text = substr(text, RSTART + RLENGTH)
    }
    while (match(text, /label[[:space:]]*=[[:space:]]*\{[^}]+\}/)) {
      m = substr(text, RSTART, RLENGTH)
      sub(/^label[[:space:]]*=[[:space:]]*\{/, "", m)
      sub(/\}$/, "", m)
      print m "|" loc
      text = substr(text, RSTART + RLENGTH)
    }
  }
  {
    raw = $0
    sub(/%.*/, "", raw)
    emit_labels(raw, FILENAME ":" FNR)
  }
' "$main_file" "$chapters_dir"/*.tex > "$label_records"

cut -d '|' -f 1 "$label_records" > "$label_keys_all"
sort -u "$label_keys_all" > "$label_keys"
sort "$label_keys_all" | uniq -d > "$duplicate_labels"

if [ -s "$duplicate_labels" ]; then
  status=1
  echo "Duplicate TeX labels found:" >&2
  while IFS= read -r key; do
    echo "  - $key" >&2
    grep -F "$key|" "$label_records" | sed 's/^[^|]*|/      /' >&2
  done < "$duplicate_labels"
fi

awk '
  function trim(value) {
    gsub(/^[[:space:]]+/, "", value)
    gsub(/[[:space:]]+$/, "", value)
    return value
  }
  function emit_refs(text, loc, m, keys, n, i) {
    while (match(text, /\\(ref|pageref|autoref|cref|Cref)\{[^}]+\}/)) {
      m = substr(text, RSTART, RLENGTH)
      sub(/^\\(ref|pageref|autoref|cref|Cref)\{/, "", m)
      sub(/\}$/, "", m)
      n = split(m, keys, ",")
      for (i = 1; i <= n; i++) {
        keys[i] = trim(keys[i])
        if (keys[i] != "") {
          print keys[i] "|" loc
        }
      }
      text = substr(text, RSTART + RLENGTH)
    }
  }
  {
    raw = $0
    sub(/%.*/, "", raw)
    emit_refs(raw, FILENAME ":" FNR)
  }
' "$main_file" "$chapters_dir"/*.tex > "$ref_records"

cut -d '|' -f 1 "$ref_records" | sort -u > "$ref_keys"
comm -23 "$ref_keys" "$label_keys" > "$missing_refs"

if [ -s "$missing_refs" ]; then
  status=1
  echo "TeX references with no matching label:" >&2
  while IFS= read -r key; do
    echo "  - $key" >&2
    grep -F "$key|" "$ref_records" | sed 's/^[^|]*|/      /' >&2
  done < "$missing_refs"
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
