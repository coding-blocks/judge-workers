FROM alpine:3.6

RUN apk add --no-cache gcc musl-dev bash

COPY ./runguard /usr/src/runguard
RUN gcc /usr/src/runguard/runguard.c -o /bin/runguard

COPY ./judge.sh ./bin/judge.sh
