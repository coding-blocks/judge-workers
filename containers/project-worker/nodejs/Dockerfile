FROM codingblocks/project-worker-base

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.10/main/ nodejs=10.19.0-r0 nodejs-npm
RUN npm install -g yarn

COPY ./setup.sh /bin/setup.sh
COPY ./build.sh /bin/build.sh
COPY ./run.sh /bin/run.sh

RUN chmod 777 /bin/setup.sh;
RUN chmod 777 /bin/build.sh;
RUN chmod 777 /bin/run.sh;
