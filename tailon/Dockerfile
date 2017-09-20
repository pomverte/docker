FROM python:3.6-alpine

VOLUME /logs
EXPOSE 80

RUN apk update && apk add grep gawk
RUN pip install tailon

RUN rm -f /usr/bin/awk /bin/grep
RUN rm -rf /var/cache/apk/*
