#!/usr/bin/env bash
cd $(dirname "$0")
DIR=$(cd -)

for i in $(ls "$DIR/containers")
do
    cd $DIR/containers/$i
    #docker image rm codingblocks/judge-worker-$i
    docker build -t codingblocks/judge-worker-$i .
    cd $DIR
done

read -p "Push the images? [Enter to Continue | Ctrl-C to exit]"

for i in $(ls "$DIR/containers")
do
    cd $DIR/containers/$i
    docker push codingblocks/judge-worker-$i
    cd $DIR
done
