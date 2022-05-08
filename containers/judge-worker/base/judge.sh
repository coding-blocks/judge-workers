#!/usr/bin/env bash
# 
# Compiles and runs the source using 
# /bin/compile and /bin/run
# Arguments:
#   -t (max run time)
#   -m (max memory limit)
# Outputs:
#   compile.stderr
#   run.stderr
#   runguard.stderr
#   run.stdout
#   runguard.code
#   runguard.time
# 

time=5
memory=10485760
while getopts ":t:m:" opt; do
  case $opt in
    t) time=$OPTARG
    ;;
    m) memory=$OPTARG
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

#######################################
# Run compilation script
# Outputs:
#   Writes error to /<runbox>/stderr
#######################################
function compilecode {
  /bin/compile.sh 2> compile.stderr || exit 1
}

#######################################
# Runs code against given INPUT
# Arguments:
#   INPUT_FILE (input file)
#   OUTPUT_DIR (output location)
#   
# Outputs:
#   Writes location to stdout
#######################################
function runcode {
  INPUT_FILE=$1
  OUTPUT_DIR=$2
  TIME_LIMIT=$3
  MEMORY_LIMIT=$4

  time=$TIME_LIMIT
  memory=$MEMORY_LIMIT

  touch $OUTPUT_DIR/runguard.code
  touch $OUTPUT_DIR/runguard.time
  touch $OUTPUT_DIR/runguard.out
  touch $OUTPUT_DIR/debug
  echo $memory > $OUTPUT_DIR/debug

  runguard \
    -t $time \
    -m $memory \
    -E $OUTPUT_DIR/runguard.code \
    -T $OUTPUT_DIR/runguard.time \
    /bin/run.sh < $INPUT_FILE 2> $OUTPUT_DIR/run.stderr 1> $OUTPUT_DIR/run.stdout
}

function main {
  runguard \
    -t 10 \
    /bin/compile.sh 2> compile.stderr

  if [ -d "testcases" ]; then
    for testcase in testcases/*; do
      if [ -r "$testcase/timelimit" ]; then
        timelimit=`cat $testcase/timelimit`
      else
        timelimit="5"
      fi

      if [ -r "$testcase/memorylimit" ]; then
        memorylimit=`cat $testcase/memorylimit`
      else
        memorylimit=10485760
      fi
    
      runcode $testcase/stdin $testcase/ $timelimit $memorylimit
    done
  else
    runcode run.stdin . "5" 10485760
  fi
}

main

