#!/usr/bin/env bash
pushd $(dirname "$0")
DIR=$(pwd)
RUNBOX="${DIR}/runbox"
LANGUAGE=$1

echo $RUNBOX
# Create runbox
mkdir -p $RUNBOX

# Copy source to runbox
cp $DIR/$LANGUAGE/* $RUNBOX/

# Test Compile
docker run \
    --cpus="1" \
    --memory="100m" \
    --ulimit nofile=64:64 \
    --rm \
    --read-only \
    -v "$RUNBOX":/usr/src/runbox \
    -w /usr/src/runbox codingblocks/judge-worker-"$LANGUAGE" \
    /bin/judge.sh -t 5 

ls -lh ${RUNBOX}

expected="Hello World"
actual="$(cat ${RUNBOX}/run.stdout)"
if [ "$expected" == "$actual" ] ;then
    :
else
    echo "MISMATCH: Expected = $expected; Actual = $actual"
    echo "$(cat ${RUNBOX}/*.stderr)"
fi

# Delete runbox
rm -rf $RUNBOX
