#!/bin/bash

# check Julia is in path
if ! command which julia &>/dev/null; then
  >&2 echo 'julia not found'
  exit 1
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

julia --color=yes ${SCRIPT_DIR}/format.jl $*
