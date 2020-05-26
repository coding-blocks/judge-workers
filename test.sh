#!/usr/bin/env ./bats/bin/bats

@test "test judge worker c" {
  bash tests/judge-worker/test_workers.sh c
}

@test "test judge worker cpp" {
  bash tests/judge-worker/test_workers.sh cpp
}

@test "test judge worker csharp" {
  bash tests/judge-worker/test_workers.sh csharp
}

@test "test judge worker golang" {
  bash tests/judge-worker/test_workers.sh golang
}

@test "test judge worker java" {
  bash tests/judge-worker/test_workers.sh java
}

@test "test judge worker java8" {
  bash tests/judge-worker/test_workers.sh java8
}

@test "test judge worker nodejs10" {
  bash tests/judge-worker/test_workers.sh nodejs10
}


@test "test judge worker nodejs12" {
  bash tests/judge-worker/test_workers.sh nodejs12
}

@test "test judge worker perl" {
  bash tests/judge-worker/test_workers.sh perl
}

@test "test judge worker py2" {
  bash tests/judge-worker/test_workers.sh py2
}

@test "test judge worker py3" {
  bash tests/judge-worker/test_workers.sh py3
}

@test "test judge worker ruby" {
  bash tests/judge-worker/test_workers.sh ruby
}

@test "test judge worker rust" {
  bash tests/judge-worker/test_workers.sh rust
}

@test "test project worker nodejs" {
  bash tests/project-worker/test_workers.sh nodejs
}

@test "test kotlin" {
  bash tests/test_workers.sh kotlin
}
