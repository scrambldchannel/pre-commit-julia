#!/bin/bash

# check Julia is in path
if ! command which julia &>/dev/null; then
  >&2 echo 'julia not found'
  exit 1
fi

julia --color=yes -e  "using Pkg;Pkg.add(\"JuliaFormatter\");using JuliaFormatter;format(\"$1\");"
