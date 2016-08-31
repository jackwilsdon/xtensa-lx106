#!/usr/bin/env bash
#
# Utilities for xtensa-lx106-elf container management scripts

# usage: print [args...]
print() {
  if [[ -n "${SCRIPT_NAME}" ]]; then
    echo "${SCRIPT_NAME}: $*"
  else
    echo "$*"
  fi
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

# usage: print_version_info "name" "tag" ["printer"]
print_version_info() {
  local printer=${3:-print_raw}

  ${printer} "name \"$1\""
  ${printer} "tag \"$2\""
}

# usage: safe_execute "binary" [args...]
safe_execute() {
  $1 "${@:2}"

  local exit_code=$?

  if [[ "${exit_code}" -ne 0 ]]; then
    error "$1 exited with code ${exit_code}"
    return 1
  fi
}
