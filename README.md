# Reactive‑PlantUML

Reactive‑PlantUML provides an on‑demand, rootless PlantUML server using Podman and systemd **user services**.
The server is started lazily via **socket activation**, exposed on a user‑defined local TCP port, and shut down automatically after a configurable idle period. Internally, all communication is handled via **UNIX domain sockets** – no permanently bound internal ports are required.

This project is intended as a **clean, reproducible runtime pattern** rather than an application framework.

---

## Key Concepts

* **Rootless by design** – runs entirely as a systemd *user* service
* **On‑demand startup** – no background daemon when unused
* **Explicit port ownership** – the user decides which local port to expose
* **No internal TCP ports** – internal communication uses UNIX sockets only
* **Automatic idle shutdown** – services exit when unused
* **Reproducible builds** – pinned dependencies, Renovate‑managed updates

---

## Architecture Overview

```
Client (Browser, VS Code, etc.)
        │
        │ TCP (user‑chosen port)
        ▼
systemd .socket unit
        │
        ▼
systemd‑socket‑proxyd
        │
        │ UNIX domain socket (%t/plantuml/<port>.sock)
        ▼
Podman container
        │
        ▼
PlantUML (Java HTTP server)
```

* **systemd socket activation** ensures the service only starts when accessed.
* **systemd‑socket‑proxyd** forwards TCP traffic to a UNIX socket.
* Inside the container, **socat** bridges the UNIX socket to the internal PlantUML TCP listener.
* The container terminates automatically after inactivity.

---

## Components

### Container Runtime

The PlantUML server runs inside a Podman container built from a pinned Ubuntu base image.
Dependencies (OpenJDK, Graphviz, socat, curl) and the PlantUML version itself are explicitly versioned.

The container entrypoint (`wrapper.sh`):

* starts the PlantUML HTTP server on `127.0.0.1:8080`
* exposes it via a UNIX socket using `socat`
* forwards signals cleanly for orderly shutdown

### Health Checks

A lightweight health check (`healthcheck.sh`) verifies availability via the UNIX socket.
This is used both during startup and normal operation to gate readiness.

### systemd Units

* `plantuml@.socket`
  Defines the user‑visible TCP port. The instance name **is the port number**.

* `plantuml@.service`
  Runs `systemd‑socket‑proxyd` to bridge TCP → UNIX socket.

* `plantuml‑server@.container`
  Podman Quadlet unit running the PlantUML container.
  The container owns the UNIX socket lifecycle.

All units are installed as **systemd user units**.

---

## Installation

Reactive‑PlantUML is distributed as a Debian package.

```bash
apt install plantuml-server
```

After installation, enable a socket instance for the desired port:

```bash
systemctl --user enable --now plantuml@8080.socket
```

This exposes the PlantUML server on:

```
http://localhost:8080
```

The service will:

* start automatically on first access
* stop again after a period of inactivity

---

## Versioning and Updates

* Semantic Versioning is used.
* Dependency updates are automated via **Renovate**.
* Patch and minor updates are auto‑merged after passing CI smoke tests.
* Releases are created automatically and published as Debian packages.

See `CHANGELOG.md` for a detailed history.

---

## License

MIT License – see `LICENSE` for details.
