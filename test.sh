#!bats/bin/bats

@test "test c" {
  sh tests/c/test_worker.sh
}

@test "test cpp" {
  sh tests/cpp/test_worker.sh
}

@test "test java8" {
  sh tests/java8/test_worker.sh
}

@test "test nodejs6" {
  sh tests/nodejs6/test_worker.sh
}

@test "test nodejs8" {
  sh tests/nodejs8/test_worker.sh
}

@test "test py2" {
  sh tests/py2/test_worker.sh
}

@test "test py3" {
  sh tests/py3/test_worker.sh
}

