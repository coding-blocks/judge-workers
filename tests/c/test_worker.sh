#!/usr/bin/env bash
SCRIPTPATH=$(dirname "$0")
RUNBOX="${SCRIPTPATH}/runbox"

echo $RUNBOX
# Create runbox
mkdir -p $RUNBOX

# Copy source to runbox
cp $SCRIPTPATH/source.c $RUNBOX/source.c

#docker run --rm -v "$PWD":/usr/src/runbox -w /usr/src/runbox codingblocks/cb-judge-worker-c gcc -o exe source.c

# Delete runbox
rm -rf $RUNBOX