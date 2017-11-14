#!/usr/bin/env bash
pushd $(dirname "$0")
DIR=$(pwd)
RUNBOX="${DIR}/runbox"

echo $RUNBOX
# Create runbox
mkdir -p $RUNBOX

# Copy source to runbox
cp $DIR/source.cpp $RUNBOX/source.cpp

# Test Compile
docker run \
    --cpus="0.5" \
    --memory="20m" \
    --ulimit nofile=64:64 \
    --rm \
    --read-only \
    -v "$RUNBOX":/usr/src/runbox \
    -w /usr/src/runbox codingblocks/judge-worker-cpp \
    /bin/compile.sh

# Delete runbox
#rm -rf $RUNBOX