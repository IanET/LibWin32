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

struct var"##Ctag#296"
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{var"##Ctag#296"}, f::Symbol)
    f === :DUMMYSTRUCTNAME && return Ptr{var"##Ctag#297"}(x + 0)
    f === :Pointer && return Ptr{PVOID}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#296", f::Symbol)
    r = Ref{var"##Ctag#296"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#296"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#296"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct _OVERLAPPED
    data::NTuple{32, UInt8}
end

function Base.getproperty(x::Ptr{_OVERLAPPED}, f::Symbol)
    f === :Internal && return Ptr{ULONG_PTR}(x + 0)
    f === :InternalHigh && return Ptr{ULONG_PTR}(x + 8)
    f === :DUMMYUNIONNAME && return Ptr{var"##Ctag#296"}(x + 16)
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

const LPCOLORREF = Ptr{DWORD}

const HGDIOBJ = HANDLE

const HBRUSH = HANDLE

const HFONT = HANDLE

const HBITMAP = HANDLE

const HDC = HANDLE

struct tagRGBQUAD
    rgbBlue::BYTE
    rgbGreen::BYTE
    rgbRed::BYTE
    rgbReserved::BYTE
end

const RGBQUAD = tagRGBQUAD

struct tagBITMAPINFOHEADER
    biSize::DWORD
    biWidth::LONG
    biHeight::LONG
    biPlanes::WORD
    biBitCount::WORD
    biCompression::DWORD
    biSizeImage::DWORD
    biXPelsPerMeter::LONG
    biYPelsPerMeter::LONG
    biClrUsed::DWORD
    biClrImportant::DWORD
end

const BITMAPINFOHEADER = tagBITMAPINFOHEADER

const LPBITMAPINFOHEADER = Ptr{tagBITMAPINFOHEADER}

const PBITMAPINFOHEADER = Ptr{tagBITMAPINFOHEADER}

struct tagBITMAPINFO
    bmiHeader::BITMAPINFOHEADER
    bmiColors::NTuple{1, RGBQUAD}
end

const BITMAPINFO = tagBITMAPINFO

const LPBITMAPINFO = Ptr{tagBITMAPINFO}

const PBITMAPINFO = Ptr{tagBITMAPINFO}

function CreateSolidBrush(color)
    @ccall Gdi32.CreateSolidBrush(color::COLORREF)::HBRUSH
end

function DeleteObject(ho)
    @ccall Gdi32.DeleteObject(ho::HGDIOBJ)::BOOL
end

function CreateDIBSection(hdc, pbmi, usage, ppvBits, hSection, offset)
    @ccall Gdi32.CreateDIBSection(hdc::HDC, pbmi::Ptr{BITMAPINFO}, usage::UINT, ppvBits::Ptr{Ptr{Cvoid}}, hSection::HANDLE, offset::DWORD)::HBITMAP
end

function CreateFontIndirectW(lplf)
    @ccall Gdi32.CreateFontIndirectW(lplf::Ptr{LOGFONTW})::HFONT
end

function CreateCompatibleDC(hdc)
    @ccall Gdi32.CreateCompatibleDC(hdc::HDC)::HDC
end

function SelectObject(hdc, h)
    @ccall Gdi32.SelectObject(hdc::HDC, h::HGDIOBJ)::HGDIOBJ
end

function BitBlt(hdc, x, y, cx, cy, hdcSrc, x1, y1, rop)
    @ccall Gdi32.BitBlt(hdc::HDC, x::Cint, y::Cint, cx::Cint, cy::Cint, hdcSrc::HDC, x1::Cint, y1::Cint, rop::DWORD)::BOOL
end

function DeleteDC(hdc)
    @ccall Gdi32.DeleteDC(hdc::HDC)::BOOL
end

function StretchBlt(hdcDest, xDest, yDest, wDest, hDest, hdcSrc, xSrc, ySrc, wSrc, hSrc, rop)
    @ccall Gdi32.StretchBlt(hdcDest::HDC, xDest::Cint, yDest::Cint, wDest::Cint, hDest::Cint, hdcSrc::HDC, xSrc::Cint, ySrc::Cint, wSrc::Cint, hSrc::Cint, rop::DWORD)::BOOL
end

function SetStretchBltMode(hdc, mode)
    @ccall Gdi32.SetStretchBltMode(hdc::HDC, mode::Cint)::Cint
end

struct var"##Ctag#297"
    Offset::DWORD
    OffsetHigh::DWORD
end
function Base.getproperty(x::Ptr{var"##Ctag#297"}, f::Symbol)
    f === :Offset && return Ptr{DWORD}(x + 0)
    f === :OffsetHigh && return Ptr{DWORD}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#297", f::Symbol)
    r = Ref{var"##Ctag#297"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#297"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#297"}, f::Symbol, v)
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

const DIB_PAL_COLORS = 1

const DIB_RGB_COLORS = 0

const BI_RGB = 0

const BI_RLE8 = 1

const BI_RLE4 = 2

const BI_BITFIELDS = 3

const BI_JPEG = 4

const BI_PNG = 5

const SRCCOPY = DWORD(0x00cc0020)

const SRCPAINT = DWORD(0x00ee0086)

const SRCAND = DWORD(0x008800c6)

const SRCINVERT = DWORD(0x00660046)

const SRCERASE = DWORD(0x00440328)

const NOTSRCCOPY = DWORD(0x00330008)

const NOTSRCERASE = DWORD(0x001100a6)

const MERGECOPY = DWORD(0x00c000ca)

const MERGEPAINT = DWORD(0x00bb0226)

const PATCOPY = DWORD(0x00f00021)

const PATPAINT = DWORD(0x00fb0a09)

const PATINVERT = DWORD(0x005a0049)

const DSTINVERT = DWORD(0x00550009)

const BLACKNESS = DWORD(0x00000042)

const WHITENESS = DWORD(0x00ff0062)

const BLACKONWHITE = 1

const WHITEONBLACK = 2

const COLORONCOLOR = 3

const HALFTONE = 4

const MAXSTRETCHBLTMODE = 4

const STRETCH_ANDSCANS = BLACKONWHITE

const STRETCH_ORSCANS = WHITEONBLACK

const STRETCH_DELETESCANS = COLORONCOLOR

const STRETCH_HALFTONE = HALFTONE

nothing

