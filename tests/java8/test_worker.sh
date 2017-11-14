#!/usr/bin/env bash
SCRIPTPATH=$(dirname "$0")
RUNBOX="${SCRIPTPATH}/runbox"

echo $RUNBOX
# Create runbox
mkdir -p $RUNBOX

# Copy source to runbox
cp $SCRIPTPATH/Main.java $RUNBOX/Main.java

# Test Compile
docker run --rm -v "$PWD/runbox":/usr/src/runbox -w /usr/src/runbox codingblocks/judge-worker-java8 /bin/compile.sh

# Delete runbox
#rm -rf $RUNBOX