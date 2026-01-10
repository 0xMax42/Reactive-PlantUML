FROM debian:stable-slim@sha256:449673e1239be6fdc89616f926abb87f360c280c3bb7ca3591694564359695fa AS base

ENV LANG=C.UTF-8
ENV TZ=UTC
ENV DEBIAN_FRONTEND=noninteractive

# renovate:debian-snapshot
ARG DEBIAN_SNAPSHOT=20260109T000000Z
# hadolint ignore=SC3040
RUN set -euo pipefail; \
    rm -f /etc/apt/sources.list.d/debian.sources; \
    rm -f /etc/apt/sources.list.d/*.sources /etc/apt/sources.list.d/*.list; \
    rm -f /etc/apt/sources.list; \
    printf '%s\n' \
    "deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/${DEBIAN_SNAPSHOT} stable main" \
    "deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/${DEBIAN_SNAPSHOT} stable-updates main" \
    "deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/${DEBIAN_SNAPSHOT} stable-security main" \
    > /etc/apt/sources.list

FROM base

# renovate:debian: suite=stable arch=amd64 depName=openjdk-21-jre 
ARG OPENJDK_21_JRE_VERSION="21.0.9+10-1~deb13u1"
# renovate:debian: suite=stable arch=amd64 depName=graphviz 
ARG GRAPHVIZ_VERSION="2.42.4-3"
# renovate:debian: suite=stable arch=amd64 depName=curl 
ARG CURL_VERSION="8.14.1-2+deb13u2"
# renovate:debian: suite=stable arch=amd64 depName=socat 
ARG SOCAT_VERSION="1.8.0.3-1"
# renovate:github-release: packageName=plantuml/plantuml
ARG PLANTUML_VERSION="v1.2025.10"

RUN apt-get update -qq \
    && apt-get install -yqq --no-install-recommends \
    openjdk-21-jre=$OPENJDK_21_JRE_VERSION \
    graphviz=$GRAPHVIZ_VERSION \
    curl=$CURL_VERSION \
    socat=$SOCAT_VERSION \
    && curl -L \
    https://github.com/plantuml/plantuml/releases/download/$PLANTUML_VERSION/plantuml.jar \
    -o /usr/local/bin/plantuml.jar \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY healthcheck.sh /usr/local/bin/healthcheck.sh
COPY wrapper.sh /usr/local/bin/wrapper.sh
RUN chmod +x /usr/local/bin/wrapper.sh \
    && chmod +x /usr/local/bin/healthcheck.sh

ENTRYPOINT ["/usr/local/bin/wrapper.sh"]
