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

  touch $OUTPUT_DIR/runguard.code
  touch $OUTPUT_DIR/runguard.time

  runguard \
    -t $time \
    -E $OUTPUT_DIR/runguard.code \
    -T $OUTPUT_DIR/runguard.time \
    /bin/run.sh < $INPUT_FILE 2> $OUTPUT_DIR/run.stderr 1> $OUTPUT_DIR/run.stdout
}

function main {
  time=5
  memory=1024
  while getopts ":t:m:" opt; do
    case $opt in
      t) time="$OPTARG"
      ;;
      m) memory="$OPTARG"
      ;;
      \?) echo "Invalid option -$OPTARG" >&2
      ;;
    esac
  done

  compilecode

  if [ -f "testcases" ]; then
    for testcase in testcases/*; do
      runcode testcases/$testcase/stdin testcases/$testcases/
    done
  else
    runcode run.stdin .
  fi
}

main

