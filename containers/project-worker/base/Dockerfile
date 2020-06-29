FROM alpine:3.11.5

RUN apk add --no-cache gcc musl-dev bash python3 git openssh py3-pip
RUN pip3 install pyyaml

COPY ./runguard /usr/src/runguard
RUN gcc /usr/src/runguard/runguard.c -o /bin/runguard

COPY ./judge.py ./bin/judge.py
