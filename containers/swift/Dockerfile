FROM alpine:3.1

RUN apk add --no-cache Swift=3.1.1 bash

COPY ./compile.sh /bin/compile.sh
COPY ./run.sh /bin/run.sh

RUN chmod 777 /bin/compile.sh; \
    chmod 777 /bin/run.sh