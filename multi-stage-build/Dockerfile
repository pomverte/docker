# build stage application packaging
FROM maven:3.5-jdk-8-slim AS build
WORKDIR /work

COPY pom.xml .
RUN mvn -e --batch-mode dependency:resolve

COPY src ./src
RUN mvn -e --batch-mode clean package

# build stage server
FROM openjdk:8-jdk-alpine3.7

ARG GIT_BRANCH=$GIT_BRANCH
ARG GIT_COMMIT=$GIT_COMMIT

LABEL maintainer="pomverte@github, vietnem@twitter"
LABEL GIT_BRANCH=$GIT_BRANCH
LABEL GIT_COMMIT=$GIT_COMMIT
LABEL APP=multi-stage

EXPOSE 8080
RUN adduser java -h / -D

COPY --from=build /work/target/multi-stage*.jar /multi-stage.jar
RUN chown java /multi-stage.jar
RUN sh -c 'touch /multi-stage.jar'

USER java

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/multi-stage.jar"]
