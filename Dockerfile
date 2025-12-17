FROM ubuntu:noble@sha256:c35e29c9450151419d9448b0fd75374fec4fff364a27f176fb458d472dfc9e54

# renovate:ubuntu: suite=noble-security arch=amd64 depName=openjdk-17-jre 
ARG OPENJDK_17_JRE_VERSION="17.0.17+10-1~24.04"
# renovate:ubuntu: suite=noble arch=amd64 depName=graphviz 
ARG GRAPHVIZ_VERSION="2.42.2-9build1"
# renovate:ubuntu: suite=noble arch=amd64 depName=curl 
ARG CURL_VERSION="8.5.0-2ubuntu10.6"
# renovate:github-release: packageName=plantuml/plantuml
ARG PLANTUML_VERSION="v1.2025.10"

RUN apt-get update -qq \
    && apt-get install -yqq --no-install-recommends \
    openjdk-17-jre=$OPENJDK_17_JRE_VERSION \
    graphviz=$GRAPHVIZ_VERSION \
    curl=$CURL_VERSION \
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
