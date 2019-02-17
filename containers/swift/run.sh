#!/usr/bin/env bash

chmod 777 script.swift
swift script.swift < run.stdin 1> run.stdout 2> run.stderr
