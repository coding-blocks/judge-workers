FROM alpine:3.6

RUN apk add --no-cache openjdk8 bash
ENV PATH="/usr/lib/jvm/java-1.8-openjdk/bin:${PATH}"
COPY ./compile.sh /bin/compile.sh
