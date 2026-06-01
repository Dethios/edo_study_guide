#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
IMAGE="${LATEX_DOCKER_IMAGE:-texlive/texlive:latest}"
CALLER_DIR="$PWD"

if ! command -v docker >/dev/null 2>&1; then
    echo "[latexmk-docker] docker not available, falling back to native latexmk" >&2
    exec latexmk "$@"
fi

if ! docker image inspect "$IMAGE" >/dev/null 2>&1; then
    echo "[latexmk-docker] error: docker image not found locally: $IMAGE" >&2
    echo "[latexmk-docker] hint: pull it first with: docker pull $IMAGE" >&2
    exit 1
fi

uid="$(id -u 2>/dev/null || echo 0)"
gid="$(id -g 2>/dev/null || echo 0)"

docker_args=(
    run
    --rm
    --init
    -e HOME=/tmp
    -v "$ROOT_DIR:$ROOT_DIR"
    -v /tmp:/tmp
    -w "$CALLER_DIR"
)

if [[ "${LATEX_DOCKER_NO_USERMAP:-0}" != "1" ]]; then
    docker_args+=(--user "${uid}:${gid}")
fi

exec docker "${docker_args[@]}" "$IMAGE" latexmk "$@"
