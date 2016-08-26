#!/usr/bin/env bash
#
# Utilities for xtensa-lx106-elf container management scripts

# usage: print [args...]
print() {
  echo "${CURRENT_SCRIPT}: $*"
}

# usage: print_raw [args...]
print_raw() {
  echo "$*"
}

# usage: error [args...]
error() {
  print "error: $*" >&2
}

# usage: error_raw [args...]
error_raw() {
  print_raw "$*" >&2
}

# usage: docker [args...]
run_docker() {
  "${DOCKER}" "$@"

  local exit_code=$?

  if [[ "${exit_code}" -ne 0 ]]; then
    error "${DOCKER} exited with code ${exit_code}"
    return 1
  fi
}

# usage: fake_docker [args...]
fake_docker() {
  print_raw "${DOCKER}" "$@"
}
