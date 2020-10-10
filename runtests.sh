#!/usr/bin/env bash

# requires Julia to be installed
julia -e 'using Pkg; VERSION >= v"1.5-" && !isdir(joinpath(DEPOT_PATH[1], "registries", "General")) && Pkg.Registry.add("General")'
julia --check-bounds=yes --inline=yes --project -e 'using Pkg; Pkg.test(coverage=false)'
