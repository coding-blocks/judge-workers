#!/usr/bin/env bash

#######################################
# Computes hash recursively for all the
# files in the directory
# Arguments:
#   - dir
# Outputs:
#   - Hash
#######################################
function getDirHash {
  if [[ -z $SOLUTION ]]; then 
    find $1 -type f -exec md5sum {} \; | awk '{print $1}' | md5sum
  else 
    find $1 -path $1/$SOLUTION -prune -o -type f -exec md5sum {} \; | awk '{print $1}' | md5sum
  fi
}

#######################################
# Build the project and runs the test
# scripts
# Arguments:
#   - Solution Directory
# Outputs:
#   Produces following files
#   - result.code
#   - result.stderr
#   - build.stderr
#   - run.stdout
#   - run.stderr
#######################################
function buildAndRun {
  currentDir=$(pwd)
  cd $1

  /bin/setup.sh
  /bin/build.sh 1> $currentDir/build.stdout 2> $currentDir/build.stderr
  runguard \
    -t $TIME \
    -E result.code \
    -T result.time \
    /bin/run.sh 1> $currentDir/run.stdout 2> $currentDir/run.stderr
}

SOLUTION=""
TIME=20
while getopts ":s:t:" opt; do
  case $opt in
    s) SOLUTION="$OPTARG"
    ;;
    t) TIME="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

# Verify Hashes
problemHash=$(getDirHash ./problem)
solutionHash=$(getDirHash ./solution)

if [[ $problemHash != $solutionHash ]]; then
  echo "25" > result.code
  echo "Solution modified test directory" > result.stderr
  exit 1
fi


buildAndRun ./solution
