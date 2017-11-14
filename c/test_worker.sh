#!/usr/bin/env bash

docker run --rm -v "$PWD":/usr/src/runbox -w /usr/src/runbox codingblocks/cb-judge-worker-c gcc -o exe source.c