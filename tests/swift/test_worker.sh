#!/usr/bin/env bash
pushd $(dirname "$0")
DIR=$(pwd)
RUNBOX="${DIR}/runbox"

echo $RUNBOX
# Remove RUNBOX
rm -rf $RUNBOX

# Create runbox
mkdir -p $RUNBOX

# Copy source to runbox
cp $DIR/script.rb $RUNBOX/file.swift
cp $DIR/run.stdin $RUNBOX/run.stdin

# Test Compile
docker run \
    --cpus="0.5" \
    --memory="20m" \
    --ulimit nofile=64:64 \
    --rm \
    --read-only \
    -v "$RUNBOX":/usr/src/runbox \
    -w /usr/src/runbox codingblocks/judge-worker-swift \
    bash -c "/bin/compile.sh && /bin/run.sh"

