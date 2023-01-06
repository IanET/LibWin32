module LibWin32

macro L_str(s) Base.cconvert(Cwstring, s) end

MAKEINTRESOURCEW(i) = LPWSTR(i)

include("LibKernel32.jl")
include("LibGdi32.jl")
include("LibUser32.jl")

end