#!/usr/bin/env bash
cd $(dirname "$0")
DIR=$(cd -)

for type in $(ls "$DIR/containers")
do
    for lang in $(ls "$DIR/containers/$type")
    do
        docker push codingblocks/$type-$lang $DIR/containers/$type/$lang
    done
done
