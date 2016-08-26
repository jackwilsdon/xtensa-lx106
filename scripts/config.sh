#!/usr/bin/env bash
#
# Configuration for xtensa-lx106-elf container management scripts

# The name of the container being built
readonly NAME=${NAME:-'jackwilsdon/xtensa-lx106-elf'}

# The tag of the container being built
readonly TAG=${TAG:-'0.1.2.dev0'}

# The default source directory of the container being built
readonly DEFAULT_SOURCE='docker'

# The source directory of the container being built
readonly SOURCE=${SOURCE:-${DEFAULT_SOURCE}}

# The mount directory for the container being built
readonly MOUNT=${MOUNT:-''}

# Location of the docker binary
readonly DOCKER=${DOCKER:-$(command -v docker)}
