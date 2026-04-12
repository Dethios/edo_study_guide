#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
IMAGE="${LATEX_DOCKER_IMAGE:-texlive/texlive:latest}"
CONTAINER_WORKDIR="/workdir"

if ! command -v docker >/dev/null 2>&1; then
    echo "[docker-build] error: docker is not installed or not on PATH." >&2
    exit 127
fi

inspect_output=""
if ! inspect_output="$(docker image inspect "$IMAGE" 2>&1)"; then
    if grep -qiE 'permission denied|docker api|docker daemon' <<<"$inspect_output"; then
        echo "[docker-build] error: cannot access the Docker daemon." >&2
        echo "[docker-build] hint: ensure Docker Desktop is running and this shell can talk to /var/run/docker.sock." >&2
    else
        echo "[docker-build] error: docker image not found locally: $IMAGE" >&2
        echo "[docker-build] hint: pull it first with: docker pull $IMAGE" >&2
    fi
    exit 1
fi

uid="$(id -u 2>/dev/null || echo 0)"
gid="$(id -g 2>/dev/null || echo 0)"

docker_args=(
    run
    --rm
    --init
    -e HOME=/tmp
    -v "$ROOT_DIR:$CONTAINER_WORKDIR"
    -w "$CONTAINER_WORKDIR"
)

if [[ "${LATEX_DOCKER_NO_USERMAP:-0}" != "1" ]]; then
    docker_args+=(--user "${uid}:${gid}")
fi

echo "[docker-build] using image: $IMAGE"
exec docker "${docker_args[@]}" "$IMAGE" ./scripts/build.sh "$@"
