using CEnum



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

const wchar_t = Cushort

const Kernel32 = "kernel32.dll"

# Win32 helpers



