FROM codingblocks/judge-worker-base

RUN apk add --no-cache musl-dev bash rust

COPY ./compile.sh /bin/compile.sh
COPY ./run.sh /bin/run.sh

RUN chmod 777 /bin/compile.sh; \
    chmod 777 /bin/run.sh
