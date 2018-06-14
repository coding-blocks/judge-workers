#!/usr/bin/env bash
pushd $(dirname "$0")
DIR=$(pwd)
RUNBOX="${DIR}/runbox"

echo $RUNBOX
# Create runbox
mkdir -p $RUNBOX

# Copy source to runbox
cp $DIR/Main.java $RUNBOX/Main.java
cp $DIR/run.stdin $RUNBOX/run.stdin

# Test Compile
docker run \
    --cpus="1" \
    --memory="100m" \
    --ulimit nofile=64:64 \
    --rm \
    --read-only \
    -v "$RUNBOX":/usr/src/runbox \
    -w /usr/src/runbox codingblocks/judge-worker-java8 \
    bash -c "/bin/compile.sh && /bin/run.sh"

# Delete runbox
#rm -rf $RUNBOX