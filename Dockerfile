FROM ubuntu:25.10@sha256:9b61739164b58f2263067bd3ab31c7746ded4cade1f9d708e6f1b047b408a470

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
         openjdk-17-jre \
         graphviz \
         curl \
    && curl -L \
         https://github.com/plantuml/plantuml/releases/latest/download/plantuml.jar \
         -o /usr/local/bin/plantuml.jar \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY healthcheck.sh /usr/local/bin/healthcheck.sh
COPY wrapper.sh /usr/local/bin/wrapper.sh
RUN chmod +x /usr/local/bin/wrapper.sh \
    && chmod +x /usr/local/bin/healthcheck.sh

ENTRYPOINT ["/usr/local/bin/wrapper.sh"]
