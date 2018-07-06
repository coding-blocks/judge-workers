FROM alpine:3.8

RUN apk add --no-cache g++=6.4.0-r8 musl-dev bash
COPY ./compile.sh /bin/compile.sh
COPY ./run.sh /bin/run.sh
RUN chmod 777 /bin/compile.sh; \
    chmod 777 /bin/run.sh