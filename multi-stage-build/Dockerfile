# build stage application packaging
FROM maven:3.5-jdk-8-slim AS build
WORKDIR /work

COPY pom.xml .
RUN mvn --batch-mode dependency:resolve

COPY src ./src
RUN mvn --batch-mode clean package

# build stage server
FROM openjdk:8-jdk-alpine3.7

LABEL maintainer = github@pomverte
LABEL maintainer = twitter@vietnem

ARG APP_NAME=multi-stage
ENV APP_NAME=$APP_NAME

EXPOSE 8080
RUN adduser java -h / -D

COPY --from=build /work/target/${APP_NAME}*.jar /${APP_NAME}.jar
RUN chown java /multi-stage.jar
RUN sh -c 'touch /multi-stage.jar'

USER java

#ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/$APP_NAME.jar"]
ENTRYPOINT java -Djava.security.egd=file:/dev/./urandom -jar /${APP_NAME}.jar
