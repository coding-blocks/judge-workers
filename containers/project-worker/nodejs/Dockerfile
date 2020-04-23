FROM node:12-alpine

RUN apk update && apk add bash
COPY ./judge.sh /bin/judge.sh
RUN chmod 777 /bin/judge.sh;
