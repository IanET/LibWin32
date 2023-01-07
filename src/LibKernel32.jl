using CEnum

const Kernel32 = "kernel32.dll"
const Gdi32 = "gdi32.dll"
const User32 = "user32.dll"

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

const SIZE_T = ULONG_PTR

const PSIZE_T = Ptr{SIZE_T}

const LPDWORD = Ptr{DWORD}

const PDWORD = Ptr{DWORD}

struct tagLOGFONTW
    lfHeight::LONG
    lfWidth::LONG
    lfEscapement::LONG
    lfOrientation::LONG
    lfWeight::LONG
    lfItalic::BYTE
    lfUnderline::BYTE
    lfStrikeOut::BYTE
    lfCharSet::BYTE
    lfOutPrecision::BYTE
    lfClipPrecision::BYTE
    lfQuality::BYTE
    lfPitchAndFamily::BYTE
    lfFaceName::NTuple{32, WCHAR}
end

const LOGFONTW = tagLOGFONTW

const PLOGFONTW = Ptr{tagLOGFONTW}

const NPLOGFONTW = Ptr{tagLOGFONTW}

const LPLOGFONTW = Ptr{tagLOGFONTW}

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

function GetLastError()
    @ccall Kernel32.GetLastError()::DWORD
end

function GetProcessWorkingSetSize(hProcess, lpMinimumWorkingSetSize, lpMaximumWorkingSetSize)
    @ccall Kernel32.GetProcessWorkingSetSize(hProcess::HANDLE, lpMinimumWorkingSetSize::PSIZE_T, lpMaximumWorkingSetSize::PSIZE_T)::BOOL
end

function GetProcessWorkingSetSizeEx(hProcess, lpMinimumWorkingSetSize, lpMaximumWorkingSetSize, Flags)
    @ccall Kernel32.GetProcessWorkingSetSizeEx(hProcess::HANDLE, lpMinimumWorkingSetSize::PSIZE_T, lpMaximumWorkingSetSize::PSIZE_T, Flags::PDWORD)::BOOL
end

function SetProcessWorkingSetSize(hProcess, dwMinimumWorkingSetSize, dwMaximumWorkingSetSize)
    @ccall Kernel32.SetProcessWorkingSetSize(hProcess::HANDLE, dwMinimumWorkingSetSize::SIZE_T, dwMaximumWorkingSetSize::SIZE_T)::BOOL
end

function SetProcessWorkingSetSizeEx(hProcess, dwMinimumWorkingSetSize, dwMaximumWorkingSetSize, Flags)
    @ccall Kernel32.SetProcessWorkingSetSizeEx(hProcess::HANDLE, dwMinimumWorkingSetSize::SIZE_T, dwMaximumWorkingSetSize::SIZE_T, Flags::DWORD)::BOOL
end

function GetCurrentProcess()
    @ccall Kernel32.GetCurrentProcess()::HANDLE
end

function GetCurrentProcessId()
    @ccall Kernel32.GetCurrentProcessId()::DWORD
end

function ExitProcess(uExitCode)
    @ccall Kernel32.ExitProcess(uExitCode::UINT)::Cvoid
end

function TerminateProcess(hProcess, uExitCode)
    @ccall Kernel32.TerminateProcess(hProcess::HANDLE, uExitCode::UINT)::BOOL
end

function GetExitCodeProcess(hProcess, lpExitCode)
    @ccall Kernel32.GetExitCodeProcess(hProcess::HANDLE, lpExitCode::LPDWORD)::BOOL
end

const WINVER = 0x0603

const _WIN32_WINNT = 0x0603

# Skipping MacroDefinition: CALLBACK __attribute__ ( ( stdcall ) )

# Skipping MacroDefinition: WINAPI __attribute__ ( ( stdcall ) )

# Skipping MacroDefinition: WINUSERAPI __attribute__ ( ( stdcall ) )

# Skipping MacroDefinition: WINBASEAPI __attribute__ ( ( stdcall ) )

# Skipping MacroDefinition: DECLSPEC_NORETURN __attribute__ ( ( noreturn ) )

const wchar_t = Cushort

MAKEWORD(a, b) = WORD(BYTE(DWORD_PTR(a) & 0xff) | WORD(BYTE(DWORD_PTR(b) & 0xff)) << 8)

MAKELONG(a, b) = LONG(WORD(DWORD_PTR(a) & 0xffff) | DWORD(WORD(DWORD_PTR(b) & 0xffff)) << 16)

LOWORD(l) = WORD(DWORD_PTR(l) & 0xffff)

HIWORD(l) = WORD(DWORD_PTR(l) >> 16 & 0xffff)

LOBYTE(w) = BYTE(DWORD_PTR(w) & 0xff)

HIBYTE(w) = BYTE(DWORD_PTR(w) >> 8 & 0xff)

const VOID = Cvoid

const TRUE = 1

const LF_FACESIZE = 32

nothing

