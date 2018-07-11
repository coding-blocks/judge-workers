FROM ubuntu:16.04

RUN apk add --no-cache swift="4.0.3-r0" bash

COPY ./compile.sh /bin/compile.sh
COPY ./run.sh /bin/run.sh

RUN chmod 777 /bin/compile.sh; \
    chmod 777 /bin/run.sh