#!/bin/sh
set -eu

# =========================
# Configuration
# =========================
SOCKET_PATH="${SOCKET_PATH:?SOCKET_PATH not set}"
TCP_TARGET="127.0.0.1:8080"

# =========================
# Start PlantUML (TCP backend)
# =========================
java -Djava.awt.headless=true \
     -jar /usr/local/bin/plantuml.jar \
     -picoweb \
     -port 8080 &
java_pid=$!

# =========================
# Start socat (UNIX → TCP)
# =========================
socat \
     UNIX-LISTEN:"${SOCKET_PATH}",fork,mode=660,unlink-close \
     TCP:"${TCP_TARGET}" &
socat_pid=$!

# =========================
# Signal handling
# =========================
trap '
  echo "Received termination signal, shutting down..."
  kill -TERM "${socat_pid}" "${java_pid}" 2>/dev/null || true
  wait "${socat_pid}" "${java_pid}" 2>/dev/null || true
  exit 0
' TERM INT

# =========================
# Wait for processes
# =========================
wait "${java_pid}"
wait "${socat_pid}"
exit 0
