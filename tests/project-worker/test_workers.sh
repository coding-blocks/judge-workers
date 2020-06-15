#!/usr/bin/env bash
pushd $(dirname "$0")
DIR=$(pwd)
RUNBOX="${DIR}/runbox"
LANGUAGE=$1

echo $RUNBOX
# Create runbox
mkdir -p $RUNBOX

# Copy source to runbox
cp -r $DIR/$LANGUAGE/* $RUNBOX/

# Test Compile
docker run \
    --cpus="1" \
    --memory="100m" \
    --rm \
    -v "$RUNBOX":/usr/src/runbox \
    -w /usr/src/runbox codingblocks/project-worker-"$LANGUAGE" \
    /bin/judge.py -l package.json yarn.lock test

ls -lh ${RUNBOX}

cat ${RUNBOX}/result.code
cat ${RUNBOX}/result.stderr

# Delete runbox
rm -rf $RUNBOX
