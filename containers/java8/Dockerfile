FROM alpine:3.6

RUN apk add --no-cache openjdk8 bash
ENV PATH="/usr/lib/jvm/java-1.8-openjdk/bin:${PATH}"

COPY ./compile.sh /bin/compile.sh
COPY ./run.sh /bin/run.sh

RUN chmod 777 /bin/compile.sh; \
    chmod 777 /bin/run.sh
