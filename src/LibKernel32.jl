using CEnum

# 
# Automatically generated file - do not edit
#
const User32 = "user32.dll"
const Kernel32 = "kernel32.dll"
const Gdi32 = "Gdi32.dll"

macro L_str(s) Base.cconvert(Cwstring, s) end

MAKEINTRESOURCEW(i) = LPWSTR(i)




const BYTE = Cuchar

const ULONG_PTR = Culonglong

const DWORD_PTR = ULONG_PTR

const LONG = Clong

const DWORD = Culong

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

const LPWSTR = Ptr{WCHAR}

const CHAR = Cchar

const LPCSTR = Ptr{CHAR}

const INT_PTR = Clonglong

const UINT = Cuint

const UINT_PTR = Culonglong

const UINT8 = Cuchar

const UINT16 = Cushort

const UINT32 = Cuint

# typedef INT_PTR ( FAR WINAPI * FARPROC
const FARPROC = Ptr{Cvoid}

function LoadLibraryExW(lpLibFileName, hFile, dwFlags)
    @ccall Kernel32.LoadLibraryExW(lpLibFileName::LPCWSTR, hFile::HANDLE, dwFlags::DWORD)::HMODULE
end

function GetProcAddress(hModule, lpProcName)
    @ccall Kernel32.GetProcAddress(hModule::HMODULE, lpProcName::LPCSTR)::FARPROC
end

function GetModuleHandleW(lpModuleName)
    @ccall Kernel32.GetModuleHandleW(lpModuleName::LPCWSTR)::HMODULE
end

const WINVER = 0x0501

const _WIN32_WINNT = 0x0501

# Skipping MacroDefinition: CALLBACK __attribute__ ( ( stdcall ) )

# Skipping MacroDefinition: WINAPI __attribute__ ( ( stdcall ) )

# Skipping MacroDefinition: WINUSERAPI __attribute__ ( ( stdcall ) )

const wchar_t = Cushort

MAKEWORD(a, b) = WORD(BYTE(DWORD_PTR(a) & 0xff) | WORD(BYTE(DWORD_PTR(b) & 0xff)) << 8)

MAKELONG(a, b) = LONG(WORD(DWORD_PTR(a) & 0xffff) | DWORD(WORD(DWORD_PTR(b) & 0xffff)) << 16)

LOWORD(l) = WORD(DWORD_PTR(l) & 0xffff)

HIWORD(l) = WORD(DWORD_PTR(l) >> 16 & 0xffff)

LOBYTE(w) = BYTE(DWORD_PTR(w) & 0xff)

HIBYTE(w) = BYTE(DWORD_PTR(w) >> 8 & 0xff)

# Win32 helpers



