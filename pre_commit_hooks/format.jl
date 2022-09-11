if isempty(ARGS)
    # No julia source files added, nothing to do.
    exit(0)
end

try
    using JuliaFormatter
catch ArgumentError
    using Pkg
    Pkg.add("JuliaFormatter")
    println("Installed JuliaFormatter package.")
    using JuliaFormatter
end

for arg in ARGS
    JuliaFormatter.format_file(arg)
end
