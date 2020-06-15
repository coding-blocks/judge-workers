#! /usr/bin/python3

import sys
import os
import subprocess
import argparse

def compareHash(path):
  hash1 = subprocess.getoutput(f'git --git-dir=problem/.git log --pretty=format:\'%h\' -n 1 -- {path}')
  hash2 = subprocess.getoutput(f'git --git-dir=solution/.git log --pretty=format:\'%h\' -n 1 -- {path}')

  return hash1 == hash2

def buildAndRun(timeout):
  currentDir = os.getcwd()
  os.chdir('solution')

  subprocess.call('/bin/setup.sh')
  subprocess.call(f'/bin/build.sh 1> {currentDir}/build.stdout 2> {currentDir}/build.stderr', shell=True)
  subprocess.call([
    f'runguard \
    -t {timeout} \
    -E {currentDir}/result.code \
    -T {currentDir}/result.time \
    /bin/run.sh 1> {currentDir}/run.stdout 2> {currentDir}/run.stderr'
  ], shell=True)

def main(timeout, locked):

  # Compare hashes locked directories
  for path in locked:
    if not compareHash(path):
      open('result.code', 'w').write('25')
      open('result.stderr', 'w').write('Solution modified test directory')
      sys.exit(1)

  buildAndRun(timeout)

if __name__ == '__main__':
  parser = argparse.ArgumentParser()

  parser.add_argument(
    '-t', 
    '--timeout', 
    help='Timeout for the Code Run', 
    default=20
  )
  parser.add_argument(
    '-l', 
    '--locked-paths', 
    nargs='+', 
    help='List of paths whose hash is to be compared', 
    required=True
  )

  args = parser.parse_args()
  timeout, locked = args.timeout, args.locked_paths
  main(timeout, locked)
