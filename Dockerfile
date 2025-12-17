FROM ubuntu:25.10@sha256:9b61739164b58f2263067bd3ab31c7746ded4cade1f9d708e6f1b047b408a470

# renovate:ubuntu: suite=questing-security arch=amd64 depName=openjdk-17-jre 
ARG OPENJDK_17_JRE_VERSION="17.0.17+10-1~25.10"
# renovate:ubuntu: suite=questing arch=amd64 depName=graphviz 
ARG GRAPHVIZ_VERSION="2.42.4-3build2"
# renovate:ubuntu: suite=questing arch=amd64 depName=curl 
ARG CURL_VERSION="8.14.1-2ubuntu1"
# renovate:github-release: packageName=plantuml/plantuml
ARG PLANTUML_VERSION="v1.2025.10"

RUN apt-get update -qq \
    && apt-get install -yqq --no-install-recommends \
    openjdk-17-jre=$OPENJDK_17_JRE_VERSION \
    graphviz=$GRAPHVIZ_VERSION \
    curl=$CURL_VERSION \
    && curl -L \
    https://github.com/plantuml/plantuml/releases/$PLANTUML_VERSION/download/plantuml.jar \
    -o /usr/local/bin/plantuml.jar \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY healthcheck.sh /usr/local/bin/healthcheck.sh
COPY wrapper.sh /usr/local/bin/wrapper.sh
RUN chmod +x /usr/local/bin/wrapper.sh \
    && chmod +x /usr/local/bin/healthcheck.sh

ENTRYPOINT ["/usr/local/bin/wrapper.sh"]
