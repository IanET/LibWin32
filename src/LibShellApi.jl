using CEnum

const Kernel32 = "kernel32.dll"
const Gdi32 = "gdi32.dll"
const User32 = "user32.dll"
const ShellApi = "Shell32.dll"
const CommCtrl = "ComCtl32.dll"

macro L_str(s) Base.cconvert(Cwstring, s) end

MAKEINTRESOURCEW(i) = LPWSTR(i)


const WORD = Cushort

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

const PWORD = Ptr{WORD}

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

struct var"##Ctag#298"
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{var"##Ctag#298"}, f::Symbol)
    f === :DUMMYSTRUCTNAME && return Ptr{var"##Ctag#299"}(x + 0)
    f === :Pointer && return Ptr{PVOID}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#298", f::Symbol)
    r = Ref{var"##Ctag#298"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#298"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#298"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct _OVERLAPPED
    data::NTuple{32, UInt8}
end

function Base.getproperty(x::Ptr{_OVERLAPPED}, f::Symbol)
    f === :Internal && return Ptr{ULONG_PTR}(x + 0)
    f === :InternalHigh && return Ptr{ULONG_PTR}(x + 8)
    f === :DUMMYUNIONNAME && return Ptr{var"##Ctag#298"}(x + 16)
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

struct _GUID
    Data1::Culong
    Data2::Cushort
    Data3::Cushort
    Data4::NTuple{8, Cuchar}
end

const GUID = _GUID

struct var"##Ctag#300"
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{var"##Ctag#300"}, f::Symbol)
    f === :uTimeout && return Ptr{UINT}(x + 0)
    f === :uVersion && return Ptr{UINT}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#300", f::Symbol)
    r = Ref{var"##Ctag#300"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#300"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#300"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct _NOTIFYICONDATAW
    data::NTuple{976, UInt8}
end

function Base.getproperty(x::Ptr{_NOTIFYICONDATAW}, f::Symbol)
    f === :cbSize && return Ptr{DWORD}(x + 0)
    f === :hWnd && return Ptr{HWND}(x + 8)
    f === :uID && return Ptr{UINT}(x + 16)
    f === :uFlags && return Ptr{UINT}(x + 20)
    f === :uCallbackMessage && return Ptr{UINT}(x + 24)
    f === :hIcon && return Ptr{HICON}(x + 32)
    f === :szTip && return Ptr{NTuple{128, WCHAR}}(x + 40)
    f === :dwState && return Ptr{DWORD}(x + 296)
    f === :dwStateMask && return Ptr{DWORD}(x + 300)
    f === :szInfo && return Ptr{NTuple{256, WCHAR}}(x + 304)
    f === :DUMMYUNIONNAME && return Ptr{var"##Ctag#300"}(x + 816)
    f === :szInfoTitle && return Ptr{NTuple{64, WCHAR}}(x + 820)
    f === :dwInfoFlags && return Ptr{DWORD}(x + 948)
    f === :guidItem && return Ptr{GUID}(x + 952)
    f === :hBalloonIcon && return Ptr{HICON}(x + 968)
    return getfield(x, f)
end

function Base.getproperty(x::_NOTIFYICONDATAW, f::Symbol)
    r = Ref{_NOTIFYICONDATAW}(x)
    ptr = Base.unsafe_convert(Ptr{_NOTIFYICONDATAW}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{_NOTIFYICONDATAW}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

const NOTIFYICONDATAW = _NOTIFYICONDATAW

const PNOTIFYICONDATAW = Ptr{_NOTIFYICONDATAW}

function Shell_NotifyIconW(dwMessage, lpData)
    @ccall ShellApi.Shell_NotifyIconW(dwMessage::DWORD, lpData::PNOTIFYICONDATAW)::BOOL
end

struct var"##Ctag#299"
    Offset::DWORD
    OffsetHigh::DWORD
end
function Base.getproperty(x::Ptr{var"##Ctag#299"}, f::Symbol)
    f === :Offset && return Ptr{DWORD}(x + 0)
    f === :OffsetHigh && return Ptr{DWORD}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#299", f::Symbol)
    r = Ref{var"##Ctag#299"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#299"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#299"}, f::Symbol, v)
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

const LF_FACESIZE = 32

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

const STANDARD_RIGHTS_REQUIRED = Clong(0x000f0000)

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

const SECTION_QUERY = 0x0001

const SECTION_MAP_WRITE = 0x0002

const SECTION_MAP_READ = 0x0004

const SECTION_MAP_EXECUTE = 0x0008

const SECTION_EXTEND_SIZE = 0x0010

const SECTION_MAP_EXECUTE_EXPLICIT = 0x0020

const SECTION_ALL_ACCESS = ((((STANDARD_RIGHTS_REQUIRED | SECTION_QUERY) | SECTION_MAP_WRITE) | SECTION_MAP_READ) | SECTION_MAP_EXECUTE) | SECTION_EXTEND_SIZE

const NIF_MESSAGE = 0x00000001

const NIF_ICON = 0x00000002

const NIF_TIP = 0x00000004

const NIF_STATE = 0x00000008

const NIF_INFO = 0x00000010

const NIF_REALTIME = 0x00000040

const NIF_SHOWTIP = 0x00000080

nothing

