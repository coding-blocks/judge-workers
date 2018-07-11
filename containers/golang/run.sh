#!/usr/bin/env bash

chmod 777 main.go
go run main.go < run.stdin 1> run.stdout 2> run.stderr
