FROM alpine:3.6

RUN apk add --no-cache bash go="1.8.4-r0"

COPY ./compile.sh /bin/compile.sh
COPY ./run.sh /bin/run.sh

RUN chmod 777 /bin/compile.sh; \
    chmod 777 /bin/run.sh
