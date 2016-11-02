FROM openjdk:7-alpine
VOLUME /tmp
ADD boot-external-config-0.0.1.jar boot-external-config.jar
ADD application.properties config/application.properties
RUN sh -c 'touch /boot-external-config.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/boot-external-config.jar"]
