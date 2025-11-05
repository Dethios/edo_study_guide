#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
base_dir="$(cd "${script_dir}/.." && pwd)"

source_pdf="${base_dir}/out/main.pdf"
if [[ ! -f "${source_pdf}" ]]; then
  echo "Source PDF not found at ${source_pdf}" >&2
  exit 1
fi

release_dir="${base_dir}/release"
mkdir -p "${release_dir}"

today="$(date +%Y%m%d)"
dest_pdf="${release_dir}/EDO_Study_Guide_dtd_${today}.pdf"

cp "${source_pdf}" "${dest_pdf}"
echo "Copied ${source_pdf} to ${dest_pdf}"
