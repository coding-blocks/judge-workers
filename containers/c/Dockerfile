FROM alpine:3.6

RUN apk add --no-cache gcc musl-dev bash
COPY ./compile.sh /bin/compile.sh
COPY ./run.sh /bin/run.sh
RUN chmod 777 /bin/compile.sh; \
    chmod 777 /bin/run.sh