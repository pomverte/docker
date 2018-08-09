FROM python:3.7-alpine

VOLUME /logs
EXPOSE 80

RUN apk update \
    && apk add grep gawk \
    && pip install tailon

RUN rm -f /usr/bin/awk /bin/grep \
    && rm -rf /var/cache/apk/*
