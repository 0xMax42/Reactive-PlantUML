# Reactive-PlantUML
# Standard, boring, Debian-friendly Makefile

.PHONY: all build clean install uninstall run test help

# Installation prefixes
PREFIX ?= /usr
# Application files
LIBDIR ?= $(PREFIX)/lib/plantuml-server
# systemd user units
SYSTEMD_USER_DIR ?= $(PREFIX)/lib/systemd/user
# Podman quadlet user containers (fixed path by spec)
SYSTEMD_USER_CONTAINER_DIR ?= /etc/containers/systemd/users

CONTAINER_EXEC ?= podman
IMAGE_NAME ?= reactive-plantuml
IMAGE_TAG  ?= latest
DEBUG_PORT ?= 8080

# ----------------------------
# Default
# ----------------------------

all: build test

help:
	@echo "Available targets:"
	@echo "  build        Build container image"
	@echo "  test         Test container image"
	@echo "  install      Install files into PREFIX"
	@echo "  uninstall    Remove installed files"
	@echo "  run          Run container locally (debug)"
	@echo "  clean        Remove container image"

# ----------------------------
# Container
# ----------------------------


build:
	$(CONTAINER_EXEC) build -t $(IMAGE_NAME):$(IMAGE_TAG) .

test:
	@set -e; \
	CTR_NAME=plantuml-smoketest; \
	echo "Starting test container $$CTR_NAME"; \
	$(CONTAINER_EXEC) run -d --name $$CTR_NAME \
		-e SOCKET_PATH=/tmp/plantuml.sock \
		$(IMAGE_NAME):$(IMAGE_TAG); \
	cleanup() { \
		echo ""; \
		echo "## Container logs:"; \
		$(CONTAINER_EXEC) logs $$CTR_NAME || true; \
		echo ""; \
		echo "## Removing test container"; \
		$(CONTAINER_EXEC) rm -f $$CTR_NAME || true; \
	}; \
	trap cleanup EXIT; \
	for i in $$(seq 1 60); do \
		if $(CONTAINER_EXEC) exec $$CTR_NAME /usr/local/bin/healthcheck.sh; then \
			echo "Healthcheck passed"; \
			exit 0; \
		fi; \
		sleep 1; \
	done; \
	echo "Healthcheck did not pass in time"; \
	exit 1

run:
	# Debug helper, not used in production
	@echo "Running container image $(IMAGE_NAME):$(IMAGE_TAG) on port $(DEBUG_PORT)"
	$(CONTAINER_EXEC) run --rm -it \
		-e SOCKET_PATH=/tmp/plantuml.sock \
		-p $(DEBUG_PORT):8080 \
		$(IMAGE_NAME):$(IMAGE_TAG)

# ----------------------------
# Installation
# ----------------------------

install:
	# Application files
	install -d $(DESTDIR)$(LIBDIR)
	install -m 0755 wrapper.sh $(DESTDIR)$(LIBDIR)/
	install -m 0755 healthcheck.sh $(DESTDIR)$(LIBDIR)/
	install -m 0644 Dockerfile $(DESTDIR)$(LIBDIR)/
	# systemd user units
	install -d $(DESTDIR)$(SYSTEMD_USER_DIR)
	install -m 0644 services/plantuml@.service \
		$(DESTDIR)$(SYSTEMD_USER_DIR)/
	install -m 0644 services/plantuml@.socket \
		$(DESTDIR)$(SYSTEMD_USER_DIR)/
	# Podman quadlet user containers
	install -d $(DESTDIR)$(SYSTEMD_USER_CONTAINER_DIR)
	install -m 0644 services/plantuml-server@.container \
		$(DESTDIR)$(SYSTEMD_USER_CONTAINER_DIR)/
	install -m 0644 services/plantuml-server.build \
		$(DESTDIR)$(SYSTEMD_USER_CONTAINER_DIR)/
	@echo "Installation complete."
	@echo "Note: Run as user:"
	@echo "  systemctl --user daemon-reload"
	@echo "  systemctl --user enable --now plantuml@n.socket"
	@echo "to enable the PlantUML socket service for the current user."
	@echo "*n* corresponds to the port you wish to use (e.g. 8080 for 8080)."

uninstall:
	rm -rf $(DESTDIR)$(LIBDIR)
	rm -f $(DESTDIR)$(SYSTEMD_USER_DIR)/plantuml@.service
	rm -f $(DESTDIR)$(SYSTEMD_USER_DIR)/plantuml@.socket
	rm -f $(DESTDIR)$(SYSTEMD_USER_CONTAINER_DIR)/plantuml-server@.container
	rm -f $(DESTDIR)$(SYSTEMD_USER_CONTAINER_DIR)/plantuml-server.build

# ----------------------------
# Cleanup
# ----------------------------

clean:
	@echo "Removing container image $(IMAGE_NAME):$(IMAGE_TAG)"
	-$(CONTAINER_EXEC) image rm $(IMAGE_NAME):$(IMAGE_TAG)

