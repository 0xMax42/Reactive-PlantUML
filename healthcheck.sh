#!/bin/sh
set -eu

# =========================
# Configuration
# =========================
SOCKET_PATH="${SOCKET_PATH:?SOCKET_PATH not set}"

# =========================
# Health check via UNIX socket
# =========================
curl --unix-socket "${SOCKET_PATH}" \
    -f http://localhost/plantuml/ \
    >/dev/null 2>&1
