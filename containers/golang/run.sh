#!/usr/bin/env bash

chmod 777 program.go
go run program.go < run.stdin 1> run.stdout 2> run.stderr
