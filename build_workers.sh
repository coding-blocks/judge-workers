#!/usr/bin/env bash
cd $(dirname "$0")
DIR=$(cd -)

for i in $(ls "$DIR/containers")
do
    # docker image rm codingblocks/judge-worker-$i
    docker build -t codingblocks/judge-worker-$i $DIR/containers/$i
done
