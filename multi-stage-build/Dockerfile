# build stage application packaging
FROM maven:3.5-jdk-8-slim AS build
WORKDIR /work
COPY src /work/src
COPY pom.xml /work/
RUN mvn -Dmaven.repo.local=/work/.m2/repository clean package

# build stage server
FROM openjdk:8-jdk-alpine3.7
EXPOSE 8080
COPY --from=build /work/target/multi-stage*.jar /multi-stage.jar
RUN sh -c 'touch /multi-stage.jar'
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/multi-stage.jar"]
