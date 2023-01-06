# module LibGdi32

using CEnum

# 
# Automatically generated file - do not edit
#
# const User32 = "user32.dll"
# const Kernel32 = "kernel32.dll"
const Gdi32 = "Gdi32.dll"

# macro L_str(s) Base.cconvert(Cwstring, s) end

# MAKEINTRESOURCEW(i) = LPWSTR(i)




const DWORD = Culong

const COLORREF = DWORD

const LONG_PTR = Clonglong

const PVOID = Ptr{Cvoid}

const HANDLE = PVOID

const HWND = HANDLE

const LPARAM = LONG_PTR

const BOOL = Cint

# typedef BOOL ( CALLBACK * WNDENUMPROC
const WNDENUMPROC = Ptr{Cvoid}

const HINSTANCE = HANDLE

const HMODULE = HINSTANCE

const WCHAR = Cushort

const LPCWSTR = Ptr{WCHAR}

const LPCTSTR = LPCWSTR

const LONG = Clong

const LPWSTR = Ptr{WCHAR}

const CHAR = Cchar

const LPCSTR = Ptr{CHAR}

const INT_PTR = Clonglong

const UINT = Cuint

const UINT_PTR = Culonglong

const UINT8 = Cuchar

const UINT16 = Cushort

const UINT32 = Cuint

const LPCOLORREF = Ptr{DWORD}

const HGDIOBJ = HANDLE

const HBRUSH = HANDLE

function CreateSolidBrush(color)
    @ccall Gdi32.CreateSolidBrush(color::COLORREF)::HBRUSH
end

function DeleteObject(ho)
    @ccall Gdi32.DeleteObject(ho::HGDIOBJ)::BOOL
end

const WINVER = 0x0501

const _WIN32_WINNT = 0x0501

# Skipping MacroDefinition: CALLBACK __attribute__ ( ( stdcall ) )

# Skipping MacroDefinition: WINAPI __attribute__ ( ( stdcall ) )

const wchar_t = Cushort

# Win32 helpers



# end # module
