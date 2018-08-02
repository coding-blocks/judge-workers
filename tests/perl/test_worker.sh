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
cp -fv $DIR/script.pl $RUNBOX/script.pl
cp -fv $DIR/run.stdin $RUNBOX/run.stdin

# Test Compile
docker run \
    --cpus="0.5" \
    --memory="20m" \
    --ulimit nofile=64:64 \
    --rm \
    --read-only \
    -v "$RUNBOX":/usr/src/runbox \
    -v "$RUNBOX":/tmp \
    -w /usr/src/runbox codingblocks/judge-worker-perl \
    bash -c "/bin/compile.sh && /bin/run.sh"

ls -lh ${RUNBOX}

expected="Hello World"
actual="$(cat ${RUNBOX}/run.stdout)"
if [ "$expected" == "$actual" ] ;then
    :
else
    echo "MISMATCH: Expected = $expected; Actual = $actual"
    exit 1
fi

# Delete runbox
rm -rf $RUNBOX
