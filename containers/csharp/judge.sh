#!/usr/bin/env bash

# Uses /bin/compile.sh and /bin/run.sh
# Creates following output files
#   1. compile.stdout
#   2. compile.stderr
#   3. run.stdout
#   4. run.stderr
#   5. runguard.stderr
#   6. runguard.code
#   7. runguard.time

touch runguard.code
touch runguard.time
touch runguard.stderr

time=5
memory=1024
while getopts ":t:m:" opt; do
  case $opt in
    t) time="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

/bin/compile.sh || exit 1

runguard \
  -t $time \
  -E runguard.code \
  -T runguard.time \
  /bin/run.sh 2> runguard.stderr
