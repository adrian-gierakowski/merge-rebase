#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

test_file () {
  local content=$(<$1)
  printf "test for $1: "
  if [[ "$content" != "$1" ]]; then
    echo "FAILED! ${content} is not equal ${1}"
    exit 1
  else
    echo "PASSED!"
  fi
}

test_file_any_content () {
  local content=$(<$1)
  printf "test for $1 with content: ${2}: "
  if [[ "$content" != "$2" ]]; then
    echo "FAILED! ${content} is not equal ${2}"
    exit 1
  else
    echo "PASSED!"
  fi
}

test_copy () {
  local content1=$(<$1)
  printf "test for $1 and $2: "
  local content2=$(<$2)
  if [[ "$content1" != "$content2" ]]; then
    echo "FAILED! ${content1} is not equal ${content2}"
    exit 1
  else
    echo "PASSED!"
  fi
}

test_file file1
test_file file3

test_file_any_content file4 whatever

test_copy file1 file1_copy
