#!/usr/bin/env bash

chmod 777 Program.exe
mono Program.exe < run.stdin 1> run.stdout 2> run.stderr
