#!/usr/bin/env bats

@test "test c" {
  bash tests/c/test_worker.sh
}

#@test "test cpp" {
#  bash tests/cpp/test_worker.sh
#}

@test "test csharp" {
  bash tests/csharp/test_worker.sh
}

@test "test golang" {
  bash tests/golang/test_worker.sh
}

@test "test java8" {
  bash tests/java8/test_worker.sh
}

@test "test nodejs6" {
  bash tests/nodejs6/test_worker.sh
}

@test "test nodejs8" {
  bash tests/nodejs8/test_worker.sh
}

@test "test py2" {
  bash tests/py2/test_worker.sh
}

@test "test py3" {
  bash tests/py3/test_worker.sh
}

@test "test ruby" {
  bash tests/ruby/test_worker.sh
}
