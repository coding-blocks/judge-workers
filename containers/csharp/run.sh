#!/usr/bin/env bash

chmod 777 program.exe
mono program.exe < run.stdin 1> run.stdout 2> run.stderr
