FROM maven:3.6-jdk-8-slim

# https://bintray.com/jfrog/jfrog-cli-go/jfrog-cli-linux-amd64
ENV JFROG_CLI_VERSION=1.26.3
ENV JFROG_CLI_SHA256SUM=bd882ec33165eb34e381bbf6d8f5b79211e6ed59eefd33dd3875c7a0098b8db4

WORKDIR /usr/bin/

RUN curl -Lo jfrog https://api.bintray.com/content/jfrog/jfrog-cli-go/${JFROG_CLI_VERSION}/jfrog-cli-linux-amd64/jfrog?bt_package=jfrog-cli-linux-amd64 && \
    echo "${JFROG_CLI_SHA256SUM}  jfrog" > jfrog_${JFROG_CLI_VERSION}_SHA256SUMS && \
    sha256sum -c jfrog_${JFROG_CLI_VERSION}_SHA256SUMS

RUN chmod +x jfrog
