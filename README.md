# judge-workers

This is one of the component of Coding Blocke Online Code Judge v2

[![Build Status](https://travis-ci.org/coding-blocks/judge-workers.svg?branch=master)](https://travis-ci.org/coding-blocks/judge-workers)

## Workers

Workers are docker containers that run the code. They have simple requirements

 - They have one compile.sh file that compiles (if required) the source
 - They have a run.sh file that runs the source or the binary

## Composition

All workers are built on top of [alpine linux](https://alpinelinux.org/) 3.6

## Supported Languages

Currently we have following images -

 - [bash](containers/bash)
 - [c](containers/c)
 - [cpp](containers/cpp)
 - [c#](containers/csharp)
 - [golang](containers/golang)
 - [java8](containers/java8)
 - [nodejs6](containers/nodejs6)
 - [nodejs](containers/nodejs8)
 - [py2](containers/py2)
 - [py3](containers/py3)
 - [ruby](containers/ruby)
