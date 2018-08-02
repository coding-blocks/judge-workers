#!/usr/bin/env bash

chmod 777 script.scala
scala script < run.stdin 1> run.stdout 2> run.stderr
