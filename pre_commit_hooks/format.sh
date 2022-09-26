#!/bin/bash

# Check Julia is in path.
if ! command which julia &>/dev/null; then
  >&2 echo 'julia not found'
  exit 1
fi

# Find directory that this script is in.
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Invoke Julia over arguments to script.
# NOTE: the `$*` is populated by `pre-commit` with any julia files that have changed.
julia --color=yes ${SCRIPT_DIR}/format.jl $*
