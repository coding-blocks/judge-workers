#! /usr/bin/python3

import sys
import os
import subprocess
import argparse
import yaml

def beforeInstall(rootDir, scripts):
  for script in scripts:
    return_code = subprocess.call(f'{script} 1> {rootDir}/setup.stdout 2> {rootDir}/setup.stderr', shell=True)
    open(f'{rootDir}/setup.code', 'w').write(str(return_code))
    if return_code:
      sys.exit(return_code)

def runTestcases(rootDir, scripts, timeout):
  os.mkdir(f'{rootDir}/result')
  for i, script in enumerate(scripts):
    os.mkdir(f'{rootDir}/result/{i}')
    subprocess.call(f' \
      runguard \
      -t {timeout} \
      -E {rootDir}/result/{i}/run.code \
      -T {rootDir}/result/{i}/run.time \
      {script} 1> {rootDir}/result/{i}/run.stdout 2> {rootDir}/result/{i}/run.stderr \
    ', shell=True)

def main(timeout):
  rootDir = os.getcwd()
  os.chdir('project')

  with open(f'{rootDir}/project.yml', 'r') as file:
    config = yaml.full_load(file)
  
  beforeInstall(rootDir, config['project']['before-test'])
  runTestcases(rootDir, config['project']['testcases'], timeout)

if __name__ == '__main__':
  parser = argparse.ArgumentParser()

  parser.add_argument(
    '-t', 
    '--timeout', 
    help='Timeout for the Code Run', 
    default=20
  )

  args = parser.parse_args()
  timeout = args.timeout
  main(timeout)
