#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
LINTER="$PROJECT_ROOT/scripts/check-acronyms.py"
TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

make_case() {
  local name="$1"
  mkdir -p "$TMPDIR/$name/tex/chapters"
}

write_defs() {
  local name="$1"
  cat > "$TMPDIR/$name/tex/acronyms.def"
}

write_chapter() {
  local name="$1"
  cat > "$TMPDIR/$name/tex/chapters/sample.tex"
}

assert_passes() {
  local name="$1"
  if ! python3 "$LINTER" --root "$TMPDIR/$name" >"$TMPDIR/$name.out" 2>"$TMPDIR/$name.err"; then
    echo "Expected $name to pass" >&2
    cat "$TMPDIR/$name.out" >&2 || true
    cat "$TMPDIR/$name.err" >&2 || true
    exit 1
  fi
}

assert_fails_with() {
  local name="$1"
  local pattern="$2"
  if python3 "$LINTER" --root "$TMPDIR/$name" >"$TMPDIR/$name.out" 2>"$TMPDIR/$name.err"; then
    echo "Expected $name to fail" >&2
    exit 1
  fi
  if ! rg -q "$pattern" "$TMPDIR/$name.out" "$TMPDIR/$name.err"; then
    echo "Expected $name failure to contain: $pattern" >&2
    cat "$TMPDIR/$name.out" >&2 || true
    cat "$TMPDIR/$name.err" >&2 || true
    exit 1
  fi
}

make_case good
write_defs good <<'EOF_DEFS'
\newacronym{pmo}{PMO}{Program Management Office}
\newacronym{wbs}{WBS}{Work Breakdown Structure}
EOF_DEFS
write_chapter good <<'EOF_TEX'
\section{Program Management}
The \ac{pmo} owns the program baseline.
\begin{description}
  \item[PMO.] The \ac{pmo} coordinates the team.
\end{description}
\begin{longtblr}{colspec={ll}}
PMO & Program office \\
WBS & Work breakdown structure \\
\end{longtblr}
EOF_TEX
assert_passes good

make_case duplicate
write_defs duplicate <<'EOF_DEFS'
\newacronym{pmo}{PMO}{Program Management Office}
\newacronym{pmo}{PMO}{Duplicate Program Office}
EOF_DEFS
write_chapter duplicate <<'EOF_TEX'
The \ac{pmo} owns the program baseline.
EOF_TEX
assert_fails_with duplicate "duplicate acronym key"

make_case undefined
write_defs undefined <<'EOF_DEFS'
\newacronym{pmo}{PMO}{Program Management Office}
EOF_DEFS
write_chapter undefined <<'EOF_TEX'
The \ac{wbs} supports the program baseline.
EOF_TEX
assert_fails_with undefined "undefined acronym key"

make_case table
write_defs table <<'EOF_DEFS'
\newacronym{pmo}{PMO}{Program Management Office}
EOF_DEFS
write_chapter table <<'EOF_TEX'
\begin{tblr}{colspec={ll}}
\ac{pmo} & Program office \\
\end{tblr}
EOF_TEX
assert_fails_with table "acronym macro inside table environment"

make_case item_label
write_defs item_label <<'EOF_DEFS'
\newacronym{pmo}{PMO}{Program Management Office}
EOF_DEFS
write_chapter item_label <<'EOF_TEX'
\begin{description}
  \item[\ac{pmo}.] Program office.
\end{description}
EOF_TEX
assert_fails_with item_label "acronym macro inside item label"

echo "check-acronyms tests passed"
