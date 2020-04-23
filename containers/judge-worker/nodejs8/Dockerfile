FROM codingblocks/judge-worker-base

RUN apk add --no-cache bash
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.7/main/ nodejs=8.9.3-r1

COPY ./compile.sh /bin/compile.sh
COPY ./run.sh /bin/run.sh
RUN chmod 777 /bin/compile.sh; \
    chmod 777 /bin/run.sh