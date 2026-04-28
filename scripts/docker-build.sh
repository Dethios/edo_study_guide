#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
IMAGE="${LATEX_DOCKER_IMAGE:-texlive/texlive:latest}"
CONTAINER_WORKDIR="/workdir"

# Resolve subfile path if provided
resolve_texfile() {
    local input="${1:-}"
    if [[ -z "$input" ]]; then
        echo "tex/main.tex"
        return 0
    fi

    # If already a valid relative path from root, use it
    if [[ -f "$ROOT_DIR/$input" ]]; then
        echo "$input"
        return 0
    fi

    # If just a filename, check tex/chapters/
    if [[ "$input" == *.tex && ! "$input" == */* ]]; then
        if [[ -f "$ROOT_DIR/tex/chapters/$input" ]]; then
            echo "tex/chapters/$input"
            return 0
        fi
        if [[ -f "$ROOT_DIR/tex/$input" ]]; then
            echo "tex/$input"
            return 0
        fi
    fi

    # Return original for build.sh to handle
    echo "$input"
}

if ! command -v docker >/dev/null 2>&1; then
    echo "[docker-build] docker not available, falling back to native latex build" >&2
    exec "$ROOT_DIR/scripts/build.sh" "$@"
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

# Parse args to find and resolve the .tex file if present
resolved_args=()
texfile_found=0
for arg in "$@"; do
    if [[ "$texfile_found" == "0" && "$arg" == *.tex ]]; then
        resolved=$(resolve_texfile "$arg")
        resolved_args+=("$resolved")
        texfile_found=1
        if [[ "$resolved" == tex/chapters/* ]]; then
            echo "[docker-build] detected subfile: $resolved" >&2
        fi
    else
        resolved_args+=("$arg")
    fi
done

# If no texfile provided, default to main.tex
if [[ "$texfile_found" == "0" ]]; then
    resolved_args+=("tex/main.tex")
fi

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
exec docker "${docker_args[@]}" "$IMAGE" ./scripts/build.sh "${resolved_args[@]}"
