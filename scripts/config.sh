#!/usr/bin/env bash
#
# Configuration for xtensa-lx106-elf container management scripts

# The default name of the image being built
readonly DEFAULT_NAME='jackwilsdon/xtensa-lx106-elf'

# The default tag of the image being built
readonly DEFAULT_TAG='0.1.4.dev0'

# The default source directory of the image being built
readonly DEFAULT_SOURCE='docker'

# The default location of the docker binary
readonly DEFAULT_DOCKER=$(command -v docker)
