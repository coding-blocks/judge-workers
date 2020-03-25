FROM mono:latest

RUN apt-get update
RUN apt-get install -y gcc
RUN mono --version

COPY ./runguard /usr/src/runguard
RUN gcc /usr/src/runguard/runguard.c -o /bin/runguard
COPY ./judge.sh /bin/judge.sh

COPY ./compile.sh /bin/compile.sh
COPY ./run.sh /bin/run.sh

RUN chmod 777 /bin/compile.sh; \
    chmod 777 /bin/run.sh
