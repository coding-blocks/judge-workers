FROM alpine:3.6
RUN apk update && apk add --no-cache python3 bash coreutils
COPY ./compile.sh /bin/compile.sh
COPY ./run.sh /bin/run.sh
RUN chmod 777 /bin/compile.sh; \
    chmod 777 /bin/run.sh