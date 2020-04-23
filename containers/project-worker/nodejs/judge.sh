#!/usr/bin/env bash

SOLUTION=""
while getopts ":s:" opt; do
  case $opt in
    s) SOLUTION="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

function getDirHash {
  if [[ -z $SOLUTION ]]; then 
    find $1 -type f -exec md5sum {} \; | awk '{print $1}' | md5sum
  else 
    find $1 -path $1/$SOLUTION -prune -o -type f -exec md5sum {} \; | awk '{print $1}' | md5sum
  fi

}

# Verify Hashes
problemHash=$(getDirHash ./problem)
solutionHash=$(getDirHash ./solution)

if [[ $problemHash != $solutionHash ]]; then
  echo "25" > result.code
  echo "Solution modified test directory" > result.stderr
  exit 1
fi

# change dir to submission
cd solution

# Install dependencies
yarn

# Build the source
yarn run build

# Run the test
yarn run test
