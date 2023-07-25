using CEnum

const Kernel32 = "kernel32.dll"
const Gdi32 = "gdi32.dll"
const User32 = "user32.dll"
const ShellApi = "Shell32.dll"
const CommCtrl = "ComCtl32.dll"

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

const LPVOID = Ptr{Cvoid}

const LONGLONG = Clonglong

const HICON = HANDLE

const HRESULT = LONG

const PCWSTR = Ptr{WCHAR}

const LPCVOID = Ptr{Cvoid}

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

struct _SECURITY_ATTRIBUTES
    nLength::DWORD
    lpSecurityDescriptor::LPVOID
    bInheritHandle::BOOL
end

const SECURITY_ATTRIBUTES = _SECURITY_ATTRIBUTES

const PSECURITY_ATTRIBUTES = Ptr{_SECURITY_ATTRIBUTES}

const LPSECURITY_ATTRIBUTES = Ptr{_SECURITY_ATTRIBUTES}

struct _LARGE_INTEGER
    QuadPart::LONGLONG
end

const LARGE_INTEGER = _LARGE_INTEGER

const PLARGE_INTEGER = Ptr{LARGE_INTEGER}

struct var"##Ctag#292"
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{var"##Ctag#292"}, f::Symbol)
    f === :DUMMYSTRUCTNAME && return Ptr{var"##Ctag#293"}(x + 0)
    f === :Pointer && return Ptr{PVOID}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#292", f::Symbol)
    r = Ref{var"##Ctag#292"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#292"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#292"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct _OVERLAPPED
    data::NTuple{32, UInt8}
end

function Base.getproperty(x::Ptr{_OVERLAPPED}, f::Symbol)
    f === :Internal && return Ptr{ULONG_PTR}(x + 0)
    f === :InternalHigh && return Ptr{ULONG_PTR}(x + 8)
    f === :DUMMYUNIONNAME && return Ptr{var"##Ctag#292"}(x + 16)
    f === :hEvent && return Ptr{HANDLE}(x + 24)
    return getfield(x, f)
end

function Base.getproperty(x::_OVERLAPPED, f::Symbol)
    r = Ref{_OVERLAPPED}(x)
    ptr = Base.unsafe_convert(Ptr{_OVERLAPPED}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{_OVERLAPPED}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

const OVERLAPPED = _OVERLAPPED

const LPOVERLAPPED = Ptr{_OVERLAPPED}

# typedef VOID ( WINAPI * LPOVERLAPPED_COMPLETION_ROUTINE
const LPOVERLAPPED_COMPLETION_ROUTINE = Ptr{Cvoid}

function CreateFileMappingW(hFile, lpFileMappingAttributes, flProtect, dwMaximumSizeHigh, dwMaximumSizeLow, lpName)
    @ccall Kernel32.CreateFileMappingW(hFile::HANDLE, lpFileMappingAttributes::LPSECURITY_ATTRIBUTES, flProtect::DWORD, dwMaximumSizeHigh::DWORD, dwMaximumSizeLow::DWORD, lpName::LPCWSTR)::HANDLE
end

function OpenFileMappingW(dwDesiredAccess, bInheritHandle, lpName)
    @ccall Kernel32.OpenFileMappingW(dwDesiredAccess::DWORD, bInheritHandle::BOOL, lpName::LPCWSTR)::HANDLE
end

function MapViewOfFile(hFileMappingObject, dwDesiredAccess, dwFileOffsetHigh, dwFileOffsetLow, dwNumberOfBytesToMap)
    @ccall Kernel32.MapViewOfFile(hFileMappingObject::HANDLE, dwDesiredAccess::DWORD, dwFileOffsetHigh::DWORD, dwFileOffsetLow::DWORD, dwNumberOfBytesToMap::SIZE_T)::LPVOID
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

function CreateFileW(lpFileName, dwDesiredAccess, dwShareMode, lpSecurityAttributes, dwCreationDisposition, dwFlagsAndAttributes, hTemplateFile)
    @ccall Kernel32.CreateFileW(lpFileName::LPCWSTR, dwDesiredAccess::DWORD, dwShareMode::DWORD, lpSecurityAttributes::LPSECURITY_ATTRIBUTES, dwCreationDisposition::DWORD, dwFlagsAndAttributes::DWORD, hTemplateFile::HANDLE)::HANDLE
end

function GetFileSizeEx(hFile, lpFileSize)
    @ccall Kernel32.GetFileSizeEx(hFile::HANDLE, lpFileSize::PLARGE_INTEGER)::BOOL
end

function WriteFile(hFile, lpBuffer, nNumberOfBytesToWrite, lpNumberOfBytesWritten, lpOverlapped)
    @ccall Kernel32.WriteFile(hFile::HANDLE, lpBuffer::LPCVOID, nNumberOfBytesToWrite::DWORD, lpNumberOfBytesWritten::LPDWORD, lpOverlapped::LPOVERLAPPED)::BOOL
end

function ReadFile(hFile, lpBuffer, nNumberOfBytesToRead, lpNumberOfBytesRead, lpOverlapped)
    @ccall Kernel32.ReadFile(hFile::HANDLE, lpBuffer::LPVOID, nNumberOfBytesToRead::DWORD, lpNumberOfBytesRead::LPDWORD, lpOverlapped::LPOVERLAPPED)::BOOL
end

function ReadFileEx(hFile, lpBuffer, nNumberOfBytesToRead, lpOverlapped, lpCompletionRoutine)
    @ccall Kernel32.ReadFileEx(hFile::HANDLE, lpBuffer::LPVOID, nNumberOfBytesToRead::DWORD, lpOverlapped::LPOVERLAPPED, lpCompletionRoutine::LPOVERLAPPED_COMPLETION_ROUTINE)::BOOL
end

function CreateNamedPipeW(lpName, dwOpenMode, dwPipeMode, nMaxInstances, nOutBufferSize, nInBufferSize, nDefaultTimeOut, lpSecurityAttributes)
    @ccall Kernel32.CreateNamedPipeW(lpName::LPCWSTR, dwOpenMode::DWORD, dwPipeMode::DWORD, nMaxInstances::DWORD, nOutBufferSize::DWORD, nInBufferSize::DWORD, nDefaultTimeOut::DWORD, lpSecurityAttributes::LPSECURITY_ATTRIBUTES)::HANDLE
end

function WaitNamedPipeW(lpNamedPipeName, nTimeOut)
    @ccall Kernel32.WaitNamedPipeW(lpNamedPipeName::LPCWSTR, nTimeOut::DWORD)::BOOL
end

function CallNamedPipeW(lpNamedPipeName, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesRead, nTimeOut)
    @ccall Kernel32.CallNamedPipeW(lpNamedPipeName::LPCWSTR, lpInBuffer::LPVOID, nInBufferSize::DWORD, lpOutBuffer::LPVOID, nOutBufferSize::DWORD, lpBytesRead::LPDWORD, nTimeOut::DWORD)::BOOL
end

function ConnectNamedPipe(hNamedPipe, lpOverlapped)
    @ccall Kernel32.ConnectNamedPipe(hNamedPipe::HANDLE, lpOverlapped::LPOVERLAPPED)::BOOL
end

function CreateEventW(lpEventAttributes, bManualReset, bInitialState, lpName)
    @ccall Kernel32.CreateEventW(lpEventAttributes::LPSECURITY_ATTRIBUTES, bManualReset::BOOL, bInitialState::BOOL, lpName::LPCWSTR)::HANDLE
end

function SetEvent(hEvent)
    @ccall Kernel32.SetEvent(hEvent::HANDLE)::BOOL
end

function ResetEvent(hEvent)
    @ccall Kernel32.ResetEvent(hEvent::HANDLE)::BOOL
end

function WaitForSingleObject(hHandle, dwMilliseconds)
    @ccall Kernel32.WaitForSingleObject(hHandle::HANDLE, dwMilliseconds::DWORD)::DWORD
end

function SleepEx(dwMilliseconds, bAlertable)
    @ccall Kernel32.SleepEx(dwMilliseconds::DWORD, bAlertable::BOOL)::DWORD
end

function CloseHandle(hObject)
    @ccall Kernel32.CloseHandle(hObject::HANDLE)::BOOL
end

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

struct var"##Ctag#293"
    Offset::DWORD
    OffsetHigh::DWORD
end
function Base.getproperty(x::Ptr{var"##Ctag#293"}, f::Symbol)
    f === :Offset && return Ptr{DWORD}(x + 0)
    f === :OffsetHigh && return Ptr{DWORD}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#293", f::Symbol)
    r = Ref{var"##Ctag#293"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#293"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#293"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


const WINVER = 0x0603

const _WIN32_WINNT = 0x0603

# Skipping MacroDefinition: DECLSPEC_NORETURN __attribute__ ( ( noreturn ) )

# Skipping MacroDefinition: CALLBACK __cdecl

# Skipping MacroDefinition: WINAPI __cdecl

# Skipping MacroDefinition: WINUSERAPI __cdecl

# Skipping MacroDefinition: WINBASEAPI __cdecl

const wchar_t = Cushort

MAKEWORD(a, b) = WORD(BYTE(DWORD_PTR(a) & 0xff) | WORD(BYTE(DWORD_PTR(b) & 0xff)) << 8)

MAKELONG(a, b) = LONG(WORD(DWORD_PTR(a) & 0xffff) | DWORD(WORD(DWORD_PTR(b) & 0xffff)) << 16)

LOWORD(l) = WORD(DWORD_PTR(l) & 0xffff)

HIWORD(l) = WORD(DWORD_PTR(l) >> 16 & 0xffff)

LOBYTE(w) = BYTE(DWORD_PTR(w) & 0xff)

HIBYTE(w) = BYTE(DWORD_PTR(w) >> 8 & 0xff)

const VOID = Cvoid

const TRUE = 1

const FALSE = 0

const LF_FACESIZE = 32

const FILE_FLAG_WRITE_THROUGH = 0x80000000

const FILE_FLAG_OVERLAPPED = 0x40000000

const FILE_FLAG_NO_BUFFERING = 0x20000000

const FILE_FLAG_RANDOM_ACCESS = 0x10000000

const FILE_FLAG_SEQUENTIAL_SCAN = 0x08000000

const FILE_FLAG_DELETE_ON_CLOSE = 0x04000000

const FILE_FLAG_BACKUP_SEMANTICS = 0x02000000

const FILE_FLAG_POSIX_SEMANTICS = 0x01000000

const FILE_FLAG_SESSION_AWARE = 0x00800000

const FILE_FLAG_OPEN_REPARSE_POINT = 0x00200000

const FILE_FLAG_OPEN_NO_RECALL = 0x00100000

const FILE_FLAG_FIRST_PIPE_INSTANCE = 0x00080000

const PIPE_ACCESS_INBOUND = 0x00000001

const PIPE_ACCESS_OUTBOUND = 0x00000002

const PIPE_ACCESS_DUPLEX = 0x00000003

const PIPE_CLIENT_END = 0x00000000

const PIPE_SERVER_END = 0x00000001

const PIPE_WAIT = 0x00000000

const PIPE_NOWAIT = 0x00000001

const PIPE_READMODE_BYTE = 0x00000000

const PIPE_READMODE_MESSAGE = 0x00000002

const PIPE_TYPE_BYTE = 0x00000000

const PIPE_TYPE_MESSAGE = 0x00000004

const PIPE_ACCEPT_REMOTE_CLIENTS = 0x00000000

const PIPE_REJECT_REMOTE_CLIENTS = 0x00000008

const SECTION_MAP_WRITE = 0x0002

const FILE_MAP_WRITE = SECTION_MAP_WRITE

const SECTION_MAP_READ = 0x0004

const FILE_MAP_READ = SECTION_MAP_READ

const STANDARD_RIGHTS_REQUIRED = Clong(0x000f0000)

const SECTION_QUERY = 0x0001

const SECTION_MAP_EXECUTE = 0x0008

const SECTION_EXTEND_SIZE = 0x0010

const SECTION_ALL_ACCESS = ((((STANDARD_RIGHTS_REQUIRED | SECTION_QUERY) | SECTION_MAP_WRITE) | SECTION_MAP_READ) | SECTION_MAP_EXECUTE) | SECTION_EXTEND_SIZE

const FILE_MAP_ALL_ACCESS = SECTION_ALL_ACCESS

const SECTION_MAP_EXECUTE_EXPLICIT = 0x0020

const FILE_MAP_EXECUTE = SECTION_MAP_EXECUTE_EXPLICIT

const FILE_MAP_COPY = 0x00000001

const FILE_MAP_RESERVE = 0x80000000

const FILE_MAP_TARGETS_INVALID = 0x40000000

const FILE_MAP_LARGE_PAGES = 0x20000000

const CREATE_NEW = 1

const CREATE_ALWAYS = 2

const OPEN_EXISTING = 3

const OPEN_ALWAYS = 4

const TRUNCATE_EXISTING = 5

const INVALID_FILE_SIZE = DWORD(0xffffffff)

const INVALID_SET_FILE_POINTER = DWORD(0xffffffff)

const INVALID_FILE_ATTRIBUTES = DWORD(0xffffffff)

# Skipping MacroDefinition: STDMETHODVCALLTYPE __cdecl

# Skipping MacroDefinition: STDAPICALLTYPE __cdecl

# Skipping MacroDefinition: STDAPIVCALLTYPE __cdecl

const FILE_READ_DATA = 0x0001

const FILE_LIST_DIRECTORY = 0x0001

const FILE_WRITE_DATA = 0x0002

const FILE_ADD_FILE = 0x0002

const FILE_APPEND_DATA = 0x0004

const FILE_ADD_SUBDIRECTORY = 0x0004

const FILE_CREATE_PIPE_INSTANCE = 0x0004

const FILE_READ_EA = 0x0008

const FILE_WRITE_EA = 0x0010

const FILE_EXECUTE = 0x0020

const FILE_TRAVERSE = 0x0020

const FILE_DELETE_CHILD = 0x0040

const FILE_READ_ATTRIBUTES = 0x0080

const FILE_WRITE_ATTRIBUTES = 0x0100

const DELETE = Clong(0x00010000)

const READ_CONTROL = Clong(0x00020000)

const WRITE_DAC = Clong(0x00040000)

const WRITE_OWNER = Clong(0x00080000)

const SYNCHRONIZE = Clong(0x00100000)

const STANDARD_RIGHTS_READ = READ_CONTROL

const STANDARD_RIGHTS_WRITE = READ_CONTROL

const STANDARD_RIGHTS_EXECUTE = READ_CONTROL

const STANDARD_RIGHTS_ALL = Clong(0x001f0000)

const FILE_ALL_ACCESS = (STANDARD_RIGHTS_REQUIRED | SYNCHRONIZE) | 0x01ff

const FILE_GENERIC_READ = (((STANDARD_RIGHTS_READ | FILE_READ_DATA) | FILE_READ_ATTRIBUTES) | FILE_READ_EA) | SYNCHRONIZE

const FILE_GENERIC_WRITE = ((((STANDARD_RIGHTS_WRITE | FILE_WRITE_DATA) | FILE_WRITE_ATTRIBUTES) | FILE_WRITE_EA) | FILE_APPEND_DATA) | SYNCHRONIZE

const FILE_GENERIC_EXECUTE = ((STANDARD_RIGHTS_EXECUTE | FILE_READ_ATTRIBUTES) | FILE_EXECUTE) | SYNCHRONIZE

const FILE_SHARE_READ = 0x00000001

const FILE_SHARE_WRITE = 0x00000002

const FILE_SHARE_DELETE = 0x00000004

const FILE_ATTRIBUTE_READONLY = 0x00000001

const FILE_ATTRIBUTE_HIDDEN = 0x00000002

const FILE_ATTRIBUTE_SYSTEM = 0x00000004

const FILE_ATTRIBUTE_DIRECTORY = 0x00000010

const FILE_ATTRIBUTE_ARCHIVE = 0x00000020

const FILE_ATTRIBUTE_DEVICE = 0x00000040

const FILE_ATTRIBUTE_NORMAL = 0x00000080

const FILE_ATTRIBUTE_TEMPORARY = 0x00000100

const FILE_ATTRIBUTE_SPARSE_FILE = 0x00000200

const FILE_ATTRIBUTE_REPARSE_POINT = 0x00000400

const FILE_ATTRIBUTE_COMPRESSED = 0x00000800

const FILE_ATTRIBUTE_OFFLINE = 0x00001000

const FILE_ATTRIBUTE_NOT_CONTENT_INDEXED = 0x00002000

const FILE_ATTRIBUTE_ENCRYPTED = 0x00004000

const FILE_ATTRIBUTE_INTEGRITY_STREAM = 0x00008000

const FILE_ATTRIBUTE_VIRTUAL = 0x00010000

const FILE_ATTRIBUTE_NO_SCRUB_DATA = 0x00020000

const FILE_ATTRIBUTE_EA = 0x00040000

const FILE_ATTRIBUTE_PINNED = 0x00080000

const FILE_ATTRIBUTE_UNPINNED = 0x00100000

const FILE_ATTRIBUTE_RECALL_ON_OPEN = 0x00040000

const FILE_ATTRIBUTE_RECALL_ON_DATA_ACCESS = 0x00400000

nothing

