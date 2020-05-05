#!/usr/bin/env ./bats/bin/bats

@test "test c" {
  bash tests/test_workers.sh c
}

@test "test cpp" {
  bash tests/test_workers.sh cpp
}

@test "test csharp" {
  bash tests/test_workers.sh csharp
}

@test "test golang" {
  bash tests/test_workers.sh golang
}

@test "test java" {
  bash tests/test_workers.sh java
}

@test "test java8" {
  bash tests/test_workers.sh java8
}

@test "test nodejs8" {
  bash tests/test_workers.sh nodejs8
}

@test "test nodejs10" {
  bash tests/test_workers.sh nodejs10
}

@test "test perl" {
  bash tests/test_workers.sh perl
}

@test "test py2" {
  bash tests/test_workers.sh py2
}

@test "test py3" {
  bash tests/test_workers.sh py3
}

@test "test ruby" {
  bash tests/test_workers.sh ruby
}

@test "test rust" {
  bash tests/test_workers.sh rust
}

@test "test kotlin" {
  bash tests/test_workers.sh kotlin
}
