#!/bin/sh
set -eu

# Start the real process in the background
java -Djava.awt.headless=true \
     -jar /usr/local/bin/plantuml.jar \
     -picoweb \
     -port 8080 &
child=$!

# Trap TERM and INT → forward → then exit 0
trap 'echo "Received TERM, shutting down..."; kill -TERM "$child"; wait "$child"; exit 0' TERM INT

# Wait for the child
wait "$child"
exit 0
