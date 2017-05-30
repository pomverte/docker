FROM sonarqube:6.3.1-alpine

RUN rm $SONARQUBE_HOME/extensions/plugins/*
COPY extensions/plugins/* $SONARQUBE_HOME/extensions/plugins/
