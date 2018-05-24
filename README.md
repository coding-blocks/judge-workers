# judge-workers

This is one of the component of Coding Blocke Online Code Judge v2

## Workers

Workers are docker containers that run the code. They have simple requirements

 - They have one compile.sh file that compiles (if required) the source
 - They have a run.sh file that runs the source or the binary
 
## Composition

All workers are built on top of [alpine linux](https://alpinelinux.org/) 3.6 

## Supported Languages

Currently we have following images - 

 - [c](containers/c)
 - [cpp](containers/cpp)
 - [java8](containers/java8)
 - [nodejs6](containers/nodejs6)
 - [nodejs](containers/nodejs8)
 - [py2](containers/py2)
 
