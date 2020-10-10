#!/usr/bin/env bash

# todo - override these values with arguments
checkbounds=yes
inline=yes
coverage=false

# check Julia is in path
if ! command which julia &>/dev/null; then
  >&2 echo 'julia not found'
  exit 1
fi

julia --color=yes -e 'using Pkg; VERSION >= v"1.5-" && !isdir(joinpath(DEPOT_PATH[1], "registries", "General")) && Pkg.Registry.add("General")'
julia --color=yes --check-bounds="$checkbounds" --inline="$inline" --project -e "using Pkg; Pkg.test(coverage=$coverage)"
