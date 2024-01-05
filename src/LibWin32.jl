module LibWin32

using CEnum

const Kernel32 = "kernel32.dll"
const Gdi32 = "gdi32.dll"
const User32 = "user32.dll"
const ShellApi = "Shell32.dll"
const CommCtrl = "ComCtl32.dll"

macro L_str(s) Base.cconvert(Cwstring, s) end

MAKEINTRESOURCEW(i) = LPWSTR(i)

const ERROR_SUCCESS = Clong(0)


const WORD = Cushort

const BYTE = Cuchar

const ULONG_PTR = Culonglong

const DWORD_PTR = ULONG_PTR

const LONG = Clong

const DWORD = Culong

const COLORREF = DWORD

const WCHAR = Cushort

const LPWSTR = Ptr{WCHAR}

const LONG_PTR = Clonglong

const LRESULT = LONG_PTR

const PVOID = Ptr{Cvoid}

const HANDLE = PVOID

const HWND = HANDLE

const LPARAM = LONG_PTR

const BOOL = Cint

# typedef BOOL ( CALLBACK * WNDENUMPROC
const WNDENUMPROC = Ptr{Cvoid}

const HINSTANCE = HANDLE

const HMODULE = HINSTANCE

const LPCWSTR = Ptr{WCHAR}

const LPCTSTR = LPCWSTR

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

const LPCVOID = Ptr{Cvoid}

const LPBYTE = Ptr{BYTE}

const PBYTE = Ptr{BYTE}

const LPHANDLE = Ptr{HANDLE}

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

struct var"##Ctag#226"
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{var"##Ctag#226"}, f::Symbol)
    f === :DUMMYSTRUCTNAME && return Ptr{var"##Ctag#227"}(x + 0)
    f === :Pointer && return Ptr{PVOID}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#226", f::Symbol)
    r = Ref{var"##Ctag#226"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#226"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#226"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct _OVERLAPPED
    data::NTuple{32, UInt8}
end

function Base.getproperty(x::Ptr{_OVERLAPPED}, f::Symbol)
    f === :Internal && return Ptr{ULONG_PTR}(x + 0)
    f === :InternalHigh && return Ptr{ULONG_PTR}(x + 8)
    f === :DUMMYUNIONNAME && return Ptr{var"##Ctag#226"}(x + 16)
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

# typedef INT_PTR ( FAR WINAPI * FARPROC
const FARPROC = Ptr{Cvoid}

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

# typedef VOID ( WINAPI * LPOVERLAPPED_COMPLETION_ROUTINE
const LPOVERLAPPED_COMPLETION_ROUTINE = Ptr{Cvoid}

function CreateFileW(lpFileName, dwDesiredAccess, dwShareMode, lpSecurityAttributes, dwCreationDisposition, dwFlagsAndAttributes, hTemplateFile)
    @ccall Kernel32.CreateFileW(lpFileName::LPCWSTR, dwDesiredAccess::DWORD, dwShareMode::DWORD, lpSecurityAttributes::LPSECURITY_ATTRIBUTES, dwCreationDisposition::DWORD, dwFlagsAndAttributes::DWORD, hTemplateFile::HANDLE)::HANDLE
end

function GetFileSizeEx(hFile, lpFileSize)
    @ccall Kernel32.GetFileSizeEx(hFile::HANDLE, lpFileSize::PLARGE_INTEGER)::BOOL
end

function ReadFile(hFile, lpBuffer, nNumberOfBytesToRead, lpNumberOfBytesRead, lpOverlapped)
    @ccall Kernel32.ReadFile(hFile::HANDLE, lpBuffer::LPVOID, nNumberOfBytesToRead::DWORD, lpNumberOfBytesRead::LPDWORD, lpOverlapped::LPOVERLAPPED)::BOOL
end

function ReadFileEx(hFile, lpBuffer, nNumberOfBytesToRead, lpOverlapped, lpCompletionRoutine)
    @ccall Kernel32.ReadFileEx(hFile::HANDLE, lpBuffer::LPVOID, nNumberOfBytesToRead::DWORD, lpOverlapped::LPOVERLAPPED, lpCompletionRoutine::LPOVERLAPPED_COMPLETION_ROUTINE)::BOOL
end

function CloseHandle(hObject)
    @ccall Win32.CloseHandle(hObject::HANDLE)::BOOL
end

function DuplicateHandle(hSourceProcessHandle, hSourceHandle, hTargetProcessHandle, lpTargetHandle, dwDesiredAccess, bInheritHandle, dwOptions)
    @ccall Win32.DuplicateHandle(hSourceProcessHandle::HANDLE, hSourceHandle::HANDLE, hTargetProcessHandle::HANDLE, lpTargetHandle::LPHANDLE, dwDesiredAccess::DWORD, bInheritHandle::BOOL, dwOptions::DWORD)::BOOL
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

const HGLOBAL = HANDLE

const HCURSOR = HANDLE

const HMENU = HANDLE

const ATOM = WORD

# typedef LRESULT ( CALLBACK * WNDPROC
const WNDPROC = Ptr{Cvoid}

const WPARAM = UINT_PTR

struct tagRECT
    left::LONG
    top::LONG
    right::LONG
    bottom::LONG
end

const RECT = tagRECT

const PRECT = Ptr{tagRECT}

const NPRECT = Ptr{tagRECT}

const LPRECT = Ptr{tagRECT}

struct tagWNDCLASSW
    style::UINT
    lpfnWndProc::WNDPROC
    cbClsExtra::Cint
    cbWndExtra::Cint
    hInstance::HINSTANCE
    hIcon::HICON
    hCursor::HCURSOR
    hbrBackground::HBRUSH
    lpszMenuName::LPCWSTR
    lpszClassName::LPCWSTR
end

const WNDCLASSW = tagWNDCLASSW

const PWNDCLASSW = Ptr{tagWNDCLASSW}

const NPWNDCLASSW = Ptr{tagWNDCLASSW}

const LPWNDCLASSW = Ptr{tagWNDCLASSW}

struct tagPOINT
    x::LONG
    y::LONG
end

const POINT = tagPOINT

const PPOINT = Ptr{tagPOINT}

const NPPOINT = Ptr{tagPOINT}

const LPPOINT = Ptr{tagPOINT}

struct tagMSG
    hwnd::HWND
    message::UINT
    wParam::WPARAM
    lParam::LPARAM
    time::DWORD
    pt::POINT
    lPrivate::DWORD
end

const MSG = tagMSG

const PMSG = Ptr{tagMSG}

const NPMSG = Ptr{tagMSG}

const LPMSG = Ptr{tagMSG}

struct tagPAINTSTRUCT
    hdc::HDC
    fErase::BOOL
    rcPaint::RECT
    fRestore::BOOL
    fIncUpdate::BOOL
    rgbReserved::NTuple{32, BYTE}
end

const PAINTSTRUCT = tagPAINTSTRUCT

const PPAINTSTRUCT = Ptr{tagPAINTSTRUCT}

const NPPAINTSTRUCT = Ptr{tagPAINTSTRUCT}

const LPPAINTSTRUCT = Ptr{tagPAINTSTRUCT}

struct tagNONCLIENTMETRICSW
    cbSize::UINT
    iBorderWidth::Cint
    iScrollWidth::Cint
    iScrollHeight::Cint
    iCaptionWidth::Cint
    iCaptionHeight::Cint
    lfCaptionFont::LOGFONTW
    iSmCaptionWidth::Cint
    iSmCaptionHeight::Cint
    lfSmCaptionFont::LOGFONTW
    iMenuWidth::Cint
    iMenuHeight::Cint
    lfMenuFont::LOGFONTW
    lfStatusFont::LOGFONTW
    lfMessageFont::LOGFONTW
    iPaddedBorderWidth::Cint
end

const NONCLIENTMETRICSW = tagNONCLIENTMETRICSW

const PNONCLIENTMETRICSW = Ptr{tagNONCLIENTMETRICSW}

const LPNONCLIENTMETRICSW = Ptr{tagNONCLIENTMETRICSW}

struct tagCREATESTRUCTW
    lpCreateParams::LPVOID
    hInstance::HINSTANCE
    hMenu::HMENU
    hwndParent::HWND
    cy::Cint
    cx::Cint
    y::Cint
    x::Cint
    style::LONG
    lpszName::LPCWSTR
    lpszClass::LPCWSTR
    dwExStyle::DWORD
end

const CREATESTRUCTW = tagCREATESTRUCTW

const LPCREATESTRUCTW = Ptr{tagCREATESTRUCTW}

function EnumWindowsProc(hwnd, lParam)
    @ccall User32.EnumWindowsProc(hwnd::HWND, lParam::LPARAM)::BOOL
end

function EnumWindows(lpEnumFunc, lParam)
    @ccall User32.EnumWindows(lpEnumFunc::WNDENUMPROC, lParam::LPARAM)::BOOL
end

function IsWindowVisible(hWnd)
    @ccall User32.IsWindowVisible(hWnd::HWND)::BOOL
end

function GetWindowRect(hWnd, lpRect)
    @ccall User32.GetWindowRect(hWnd::HWND, lpRect::LPRECT)::BOOL
end

function GetWindowTextW(hWnd, lpString, nMaxCount)
    @ccall User32.GetWindowTextW(hWnd::HWND, lpString::LPWSTR, nMaxCount::Cint)::Cint
end

function GetWindowTextLengthW(hWnd)
    @ccall User32.GetWindowTextLengthW(hWnd::HWND)::Cint
end

function GetClientRect(hWnd, lpRect)
    @ccall User32.GetClientRect(hWnd::HWND, lpRect::LPRECT)::BOOL
end

function GetWindowLongW(hWnd, nIndex)
    @ccall User32.GetWindowLongW(hWnd::HWND, nIndex::Cint)::LONG
end

function RegisterClassW(lpWndClass)
    @ccall User32.RegisterClassW(lpWndClass::Ptr{WNDCLASSW})::ATOM
end

function LoadIconW(hInstance, lpIconName)
    @ccall User32.LoadIconW(hInstance::HINSTANCE, lpIconName::LPCWSTR)::HICON
end

function LoadCursorW(hInstance, lpCursorName)
    @ccall User32.LoadCursorW(hInstance::HINSTANCE, lpCursorName::LPCWSTR)::HCURSOR
end

function CreateWindowExW(dwExStyle, lpClassName, lpWindowName, dwStyle, X, Y, nWidth, nHeight, hWndParent, hMenu, hInstance, lpParam)
    @ccall User32.CreateWindowExW(dwExStyle::DWORD, lpClassName::LPCWSTR, lpWindowName::LPCWSTR, dwStyle::DWORD, X::Cint, Y::Cint, nWidth::Cint, nHeight::Cint, hWndParent::HWND, hMenu::HMENU, hInstance::HINSTANCE, lpParam::LPVOID)::HWND
end

function DefWindowProcW(hWnd, Msg, wParam, lParam)
    @ccall User32.DefWindowProcW(hWnd::HWND, Msg::UINT, wParam::WPARAM, lParam::LPARAM)::LRESULT
end

function PostQuitMessage(nExitCode)
    @ccall User32.PostQuitMessage(nExitCode::Cint)::Cvoid
end

function ShowWindow(hWnd, nCmdShow)
    @ccall User32.ShowWindow(hWnd::HWND, nCmdShow::Cint)::BOOL
end

function GetMessageW(lpMsg, hWnd, wMsgFilterMin, wMsgFilterMax)
    @ccall User32.GetMessageW(lpMsg::LPMSG, hWnd::HWND, wMsgFilterMin::UINT, wMsgFilterMax::UINT)::BOOL
end

function TranslateMessage(lpMsg)
    @ccall User32.TranslateMessage(lpMsg::Ptr{MSG})::BOOL
end

function DispatchMessageW(lpMsg)
    @ccall User32.DispatchMessageW(lpMsg::Ptr{MSG})::LRESULT
end

function BeginPaint(hWnd, lpPaint)
    @ccall User32.BeginPaint(hWnd::HWND, lpPaint::LPPAINTSTRUCT)::HDC
end

function EndPaint(hWnd, lpPaint)
    @ccall User32.EndPaint(hWnd::HWND, lpPaint::Ptr{PAINTSTRUCT})::BOOL
end

function FillRect(hDC, lprc, hbr)
    @ccall User32.FillRect(hDC::HDC, lprc::Ptr{RECT}, hbr::HBRUSH)::Cint
end

function MoveWindow(hWnd, X, Y, nWidth, nHeight, bRepaint)
    @ccall User32.MoveWindow(hWnd::HWND, X::Cint, Y::Cint, nWidth::Cint, nHeight::Cint, bRepaint::BOOL)::BOOL
end

function RegisterHotKey(hWnd, id, fsModifiers, vk)
    @ccall User32.RegisterHotKey(hWnd::HWND, id::Cint, fsModifiers::UINT, vk::UINT)::BOOL
end

function GetWindowLongPtrW(hWnd, nIndex)
    @ccall User32.GetWindowLongPtrW(hWnd::HWND, nIndex::Cint)::LONG_PTR
end

function SendMessageW(hWnd, Msg, wParam, lParam)
    @ccall User32.SendMessageW(hWnd::HWND, Msg::UINT, wParam::WPARAM, lParam::LPARAM)::LRESULT
end

function SystemParametersInfoW(uiAction, uiParam, pvParam, fWinIni)
    @ccall User32.SystemParametersInfoW(uiAction::UINT, uiParam::UINT, pvParam::PVOID, fWinIni::UINT)::BOOL
end

function SetCursor(hCursor)
    @ccall User32.SetCursor(hCursor::HCURSOR)::HCURSOR
end

function GetCursorPos(lpPoint)
    @ccall User32.GetCursorPos(lpPoint::LPPOINT)::BOOL
end

function GetDC(hWnd)
    @ccall User32.GetDC(hWnd::HWND)::HDC
end

function ReleaseDC(hWnd, hDC)
    @ccall User32.ReleaseDC(hWnd::HWND, hDC::HDC)::Cint
end

function SetWindowLongPtrW(hWnd, nIndex, dwNewLong)
    @ccall User32.SetWindowLongPtrW(hWnd::HWND, nIndex::Cint, dwNewLong::LONG_PTR)::LONG_PTR
end

struct _GUID
    Data1::Culong
    Data2::Cushort
    Data3::Cushort
    Data4::NTuple{8, Cuchar}
end

const GUID = _GUID

struct var"##Ctag#225"
    data::NTuple{4, UInt8}
end

function Base.getproperty(x::Ptr{var"##Ctag#225"}, f::Symbol)
    f === :uTimeout && return Ptr{UINT}(x + 0)
    f === :uVersion && return Ptr{UINT}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#225", f::Symbol)
    r = Ref{var"##Ctag#225"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#225"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#225"}, f::Symbol, v)
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
    f === :DUMMYUNIONNAME && return Ptr{var"##Ctag#225"}(x + 816)
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

@cenum _LI_METRIC::UInt32 begin
    LIM_SMALL = 0
    LIM_LARGE = 1
end

function LoadIconMetric(hinst, pszName, lims, phico)
    @ccall CommCtrl.LoadIconMetric(hinst::HINSTANCE, pszName::PCWSTR, lims::Cint, phico::Ptr{HICON})::HRESULT
end

struct var"##Ctag#227"
    Offset::DWORD
    OffsetHigh::DWORD
end
function Base.getproperty(x::Ptr{var"##Ctag#227"}, f::Symbol)
    f === :Offset && return Ptr{DWORD}(x + 0)
    f === :OffsetHigh && return Ptr{DWORD}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#227", f::Symbol)
    r = Ref{var"##Ctag#227"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#227"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#227"}, f::Symbol, v)
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

const STATUS_WAIT_0 = DWORD(Clong(0x00000000))

const WAIT_OBJECT_0 = STATUS_WAIT_0 + 0

const NMPWAIT_WAIT_FOREVER = 0xffffffff

const NMPWAIT_NOWAIT = 0x00000001

const NMPWAIT_USE_DEFAULT_WAIT = 0x00000000

const GENERIC_READ = 0x80000000

const GENERIC_WRITE = 0x40000000

const GENERIC_EXECUTE = 0x20000000

const GENERIC_ALL = 0x10000000

const PIPE_WAIT = 0x00000000

const PIPE_NOWAIT = 0x00000001

const PIPE_READMODE_BYTE = 0x00000000

const PIPE_READMODE_MESSAGE = 0x00000002

const PIPE_TYPE_BYTE = 0x00000000

const PIPE_TYPE_MESSAGE = 0x00000004

const PIPE_ACCEPT_REMOTE_CLIENTS = 0x00000000

const PIPE_REJECT_REMOTE_CLIENTS = 0x00000008

const PIPE_UNLIMITED_INSTANCES = 255

const PIPE_ACCESS_INBOUND = 0x00000001

const PIPE_ACCESS_OUTBOUND = 0x00000002

const PIPE_ACCESS_DUPLEX = 0x00000003

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

const GWL_STYLE = -16

const GWL_EXSTYLE = -20

const GWL_ID = -12

const GWLP_WNDPROC = -4

const GWLP_HINSTANCE = -6

const GWLP_HWNDPARENT = -8

const GWLP_USERDATA = -21

const GWLP_ID = -12

const WS_OVERLAPPED = Clong(0x00000000)

const WS_POPUP = Culong(0x80000000)

const WS_CHILD = Clong(0x40000000)

const WS_MINIMIZE = Clong(0x20000000)

const WS_VISIBLE = Clong(0x10000000)

const WS_DISABLED = Clong(0x08000000)

const WS_CLIPSIBLINGS = Clong(0x04000000)

const WS_CLIPCHILDREN = Clong(0x02000000)

const WS_MAXIMIZE = Clong(0x01000000)

const WS_CAPTION = Clong(0x00c00000)

const WS_BORDER = Clong(0x00800000)

const WS_DLGFRAME = Clong(0x00400000)

const WS_VSCROLL = Clong(0x00200000)

const WS_HSCROLL = Clong(0x00100000)

const WS_SYSMENU = Clong(0x00080000)

const WS_THICKFRAME = Clong(0x00040000)

const WS_GROUP = Clong(0x00020000)

const WS_TABSTOP = Clong(0x00010000)

const WS_MINIMIZEBOX = Clong(0x00020000)

const WS_MAXIMIZEBOX = Clong(0x00010000)

const WS_TILED = WS_OVERLAPPED

const WS_ICONIC = WS_MINIMIZE

const WS_SIZEBOX = WS_THICKFRAME

const WS_OVERLAPPEDWINDOW = ((((WS_OVERLAPPED | WS_CAPTION) | WS_SYSMENU) | WS_THICKFRAME) | WS_MINIMIZEBOX) | WS_MAXIMIZEBOX

const WS_TILEDWINDOW = WS_OVERLAPPEDWINDOW

const WS_POPUPWINDOW = (WS_POPUP | WS_BORDER) | WS_SYSMENU

const WS_CHILDWINDOW = WS_CHILD

const WS_EX_DLGMODALFRAME = Clong(0x00000001)

const WS_EX_NOPARENTNOTIFY = Clong(0x00000004)

const WS_EX_TOPMOST = Clong(0x00000008)

const WS_EX_ACCEPTFILES = Clong(0x00000010)

const WS_EX_TRANSPARENT = Clong(0x00000020)

const WS_EX_MDICHILD = Clong(0x00000040)

const WS_EX_TOOLWINDOW = Clong(0x00000080)

const WS_EX_WINDOWEDGE = Clong(0x00000100)

const WS_EX_CLIENTEDGE = Clong(0x00000200)

const WS_EX_CONTEXTHELP = Clong(0x00000400)

const WS_EX_RIGHT = Clong(0x00001000)

const WS_EX_LEFT = Clong(0x00000000)

const WS_EX_RTLREADING = Clong(0x00002000)

const WS_EX_LTRREADING = Clong(0x00000000)

const WS_EX_LEFTSCROLLBAR = Clong(0x00004000)

const WS_EX_RIGHTSCROLLBAR = Clong(0x00000000)

const WS_EX_CONTROLPARENT = Clong(0x00010000)

const WS_EX_STATICEDGE = Clong(0x00020000)

const WS_EX_APPWINDOW = Clong(0x00040000)

const WS_EX_OVERLAPPEDWINDOW = WS_EX_WINDOWEDGE | WS_EX_CLIENTEDGE

const WS_EX_PALETTEWINDOW = (WS_EX_WINDOWEDGE | WS_EX_TOOLWINDOW) | WS_EX_TOPMOST

const WS_EX_LAYERED = 0x00080000

const WS_EX_NOINHERITLAYOUT = Clong(0x00100000)

const WS_EX_NOREDIRECTIONBITMAP = Clong(0x00200000)

const WS_EX_LAYOUTRTL = Clong(0x00400000)

const WS_EX_COMPOSITED = Clong(0x02000000)

const WS_EX_NOACTIVATE = Clong(0x08000000)

const MAKEINTRESOURCE = MAKEINTRESOURCEW

const IDC_ARROW = MAKEINTRESOURCE(32512)

const IDC_IBEAM = MAKEINTRESOURCE(32513)

const IDC_WAIT = MAKEINTRESOURCE(32514)

const IDC_CROSS = MAKEINTRESOURCE(32515)

const IDC_UPARROW = MAKEINTRESOURCE(32516)

const IDC_SIZE = MAKEINTRESOURCE(32640)

const IDC_ICON = MAKEINTRESOURCE(32641)

const IDC_SIZENWSE = MAKEINTRESOURCE(32642)

const IDC_SIZENESW = MAKEINTRESOURCE(32643)

const IDC_SIZEWE = MAKEINTRESOURCE(32644)

const IDC_SIZENS = MAKEINTRESOURCE(32645)

const IDC_SIZEALL = MAKEINTRESOURCE(32646)

const IDC_NO = MAKEINTRESOURCE(32648)

const IDC_HAND = MAKEINTRESOURCE(32649)

const IDC_APPSTARTING = MAKEINTRESOURCE(32650)

const IDC_HELP = MAKEINTRESOURCE(32651)

const IDI_APPLICATION = MAKEINTRESOURCE(32512)

const IDI_HAND = MAKEINTRESOURCE(32513)

const IDI_QUESTION = MAKEINTRESOURCE(32514)

const IDI_EXCLAMATION = MAKEINTRESOURCE(32515)

const IDI_ASTERISK = MAKEINTRESOURCE(32516)

const IDI_WINLOGO = MAKEINTRESOURCE(32517)

const IDI_SHIELD = MAKEINTRESOURCE(32518)

const IDI_WARNING = IDI_EXCLAMATION

const IDI_ERROR = IDI_HAND

const IDI_INFORMATION = IDI_ASTERISK

const ES_LEFT = Clong(0x0000)

const ES_CENTER = Clong(0x0001)

const ES_RIGHT = Clong(0x0002)

const ES_MULTILINE = Clong(0x0004)

const ES_UPPERCASE = Clong(0x0008)

const ES_LOWERCASE = Clong(0x0010)

const ES_PASSWORD = Clong(0x0020)

const ES_AUTOVSCROLL = Clong(0x0040)

const ES_AUTOHSCROLL = Clong(0x0080)

const ES_NOHIDESEL = Clong(0x0100)

const ES_OEMCONVERT = Clong(0x0400)

const ES_READONLY = Clong(0x0800)

const ES_WANTRETURN = Clong(0x1000)

const ES_NUMBER = Clong(0x2000)

const CS_BYTEALIGNCLIENT = 0x1000

const CS_BYTEALIGNWINDOW = 0x2000

const CS_CLASSDC = 0x0040

const CS_DBLCLKS = 0x0008

const CS_DROPSHADOW = 0x00020000

const CS_GLOBALCLASS = 0x4000

const CS_HREDRAW = 0x0002

const CS_NOCLOSE = 0x0200

const CS_OWNDC = 0x0020

const CS_PARENTDC = 0x0080

const CS_SAVEBITS = 0x0800

const CS_VREDRAW = 0x0001

const CW_USEDEFAULT = -2147483648

const WM_NULL = 0x0000

const WM_CREATE = 0x0001

const WM_DESTROY = 0x0002

const WM_MOVE = 0x0003

const WM_SIZE = 0x0005

const WM_ACTIVATE = 0x0006

const WM_SETFOCUS = 0x0007

const WM_KILLFOCUS = 0x0008

const WM_ENABLE = 0x000a

const WM_SETREDRAW = 0x000b

const WM_SETTEXT = 0x000c

const WM_GETTEXT = 0x000d

const WM_GETTEXTLENGTH = 0x000e

const WM_PAINT = 0x000f

const WM_CLOSE = 0x0010

const WM_QUERYENDSESSION = 0x0011

const WM_QUIT = 0x0012

const WM_QUERYOPEN = 0x0013

const WM_ERASEBKGND = 0x0014

const WM_SYSCOLORCHANGE = 0x0015

const WM_ENDSESSION = 0x0016

const WM_SHOWWINDOW = 0x0018

const WM_WININICHANGE = 0x001a

const WM_DEVMODECHANGE = 0x001b

const WM_ACTIVATEAPP = 0x001c

const WM_FONTCHANGE = 0x001d

const WM_TIMECHANGE = 0x001e

const WM_CANCELMODE = 0x001f

const WM_SETCURSOR = 0x0020

const WM_MOUSEACTIVATE = 0x0021

const WM_CHILDACTIVATE = 0x0022

const WM_QUEUESYNC = 0x0023

const WM_GETMINMAXINFO = 0x0024

const WM_PAINTICON = 0x0026

const WM_ICONERASEBKGND = 0x0027

const WM_NEXTDLGCTL = 0x0028

const WM_SPOOLERSTATUS = 0x002a

const WM_DRAWITEM = 0x002b

const WM_MEASUREITEM = 0x002c

const WM_DELETEITEM = 0x002d

const WM_VKEYTOITEM = 0x002e

const WM_CHARTOITEM = 0x002f

const WM_SETFONT = 0x0030

const WM_GETFONT = 0x0031

const WM_SETHOTKEY = 0x0032

const WM_GETHOTKEY = 0x0033

const WM_QUERYDRAGICON = 0x0037

const WM_COMPAREITEM = 0x0039

const WM_GETOBJECT = 0x003d

const WM_COMPACTING = 0x0041

const WM_COMMNOTIFY = 0x0044

const WM_WINDOWPOSCHANGING = 0x0046

const WM_WINDOWPOSCHANGED = 0x0047

const WM_POWER = 0x0048

const WM_COPYDATA = 0x004a

const WM_CANCELJOURNAL = 0x004b

const WM_NOTIFY = 0x004e

const WM_INPUTLANGCHANGEREQUEST = 0x0050

const WM_INPUTLANGCHANGE = 0x0051

const WM_TCARD = 0x0052

const WM_HELP = 0x0053

const WM_USERCHANGED = 0x0054

const WM_NOTIFYFORMAT = 0x0055

const WM_CONTEXTMENU = 0x007b

const WM_STYLECHANGING = 0x007c

const WM_STYLECHANGED = 0x007d

const WM_DISPLAYCHANGE = 0x007e

const WM_GETICON = 0x007f

const WM_SETICON = 0x0080

const WM_NCCREATE = 0x0081

const WM_NCDESTROY = 0x0082

const WM_NCCALCSIZE = 0x0083

const WM_NCHITTEST = 0x0084

const WM_NCPAINT = 0x0085

const WM_NCACTIVATE = 0x0086

const WM_GETDLGCODE = 0x0087

const WM_SYNCPAINT = 0x0088

const WM_NCMOUSEMOVE = 0x00a0

const WM_NCLBUTTONDOWN = 0x00a1

const WM_NCLBUTTONUP = 0x00a2

const WM_NCLBUTTONDBLCLK = 0x00a3

const WM_NCRBUTTONDOWN = 0x00a4

const WM_NCRBUTTONUP = 0x00a5

const WM_NCRBUTTONDBLCLK = 0x00a6

const WM_NCMBUTTONDOWN = 0x00a7

const WM_NCMBUTTONUP = 0x00a8

const WM_NCMBUTTONDBLCLK = 0x00a9

const WM_CUT = 0x0300

const WM_COPY = 0x0301

const WM_PASTE = 0x0302

const WM_CLEAR = 0x0303

const WM_UNDO = 0x0304

const WM_RENDERFORMAT = 0x0305

const WM_RENDERALLFORMATS = 0x0306

const WM_DESTROYCLIPBOARD = 0x0307

const WM_DRAWCLIPBOARD = 0x0308

const WM_PAINTCLIPBOARD = 0x0309

const WM_VSCROLLCLIPBOARD = 0x030a

const WM_SIZECLIPBOARD = 0x030b

const WM_ASKCBFORMATNAME = 0x030c

const WM_CHANGECBCHAIN = 0x030d

const WM_HSCROLLCLIPBOARD = 0x030e

const WM_QUERYNEWPALETTE = 0x030f

const WM_PALETTEISCHANGING = 0x0310

const WM_PALETTECHANGED = 0x0311

const WM_HOTKEY = 0x0312

const WM_APP = 0x8000

const SW_HIDE = 0

const SW_SHOWNORMAL = 1

const SW_NORMAL = 1

const SW_SHOWMINIMIZED = 2

const SW_SHOWMAXIMIZED = 3

const SW_MAXIMIZE = 3

const SW_SHOWNOACTIVATE = 4

const SW_SHOW = 5

const SW_MINIMIZE = 6

const SW_SHOWMINNOACTIVE = 7

const SW_SHOWNA = 8

const SW_RESTORE = 9

const SW_SHOWDEFAULT = 10

const SW_FORCEMINIMIZE = 11

const SW_MAX = 11

const MOD_ALT = 0x0001

const MOD_CONTROL = 0x0002

const MOD_SHIFT = 0x0004

const MOD_WIN = 0x0008

const MOD_NOREPEAT = 0x4000

const SPI_GETBEEP = 0x0001

const SPI_SETBEEP = 0x0002

const SPI_GETMOUSE = 0x0003

const SPI_SETMOUSE = 0x0004

const SPI_GETBORDER = 0x0005

const SPI_SETBORDER = 0x0006

const SPI_GETKEYBOARDSPEED = 0x000a

const SPI_SETKEYBOARDSPEED = 0x000b

const SPI_LANGDRIVER = 0x000c

const SPI_ICONHORIZONTALSPACING = 0x000d

const SPI_GETSCREENSAVETIMEOUT = 0x000e

const SPI_SETSCREENSAVETIMEOUT = 0x000f

const SPI_GETSCREENSAVEACTIVE = 0x0010

const SPI_SETSCREENSAVEACTIVE = 0x0011

const SPI_GETGRIDGRANULARITY = 0x0012

const SPI_SETGRIDGRANULARITY = 0x0013

const SPI_SETDESKWALLPAPER = 0x0014

const SPI_SETDESKPATTERN = 0x0015

const SPI_GETKEYBOARDDELAY = 0x0016

const SPI_SETKEYBOARDDELAY = 0x0017

const SPI_ICONVERTICALSPACING = 0x0018

const SPI_GETICONTITLEWRAP = 0x0019

const SPI_SETICONTITLEWRAP = 0x001a

const SPI_GETMENUDROPALIGNMENT = 0x001b

const SPI_SETMENUDROPALIGNMENT = 0x001c

const SPI_SETDOUBLECLKWIDTH = 0x001d

const SPI_SETDOUBLECLKHEIGHT = 0x001e

const SPI_GETICONTITLELOGFONT = 0x001f

const SPI_SETDOUBLECLICKTIME = 0x0020

const SPI_SETMOUSEBUTTONSWAP = 0x0021

const SPI_SETICONTITLELOGFONT = 0x0022

const SPI_GETFASTTASKSWITCH = 0x0023

const SPI_SETFASTTASKSWITCH = 0x0024

const SPI_SETDRAGFULLWINDOWS = 0x0025

const SPI_GETDRAGFULLWINDOWS = 0x0026

const SPI_GETNONCLIENTMETRICS = 0x0029

const SPI_SETNONCLIENTMETRICS = 0x002a

const SPI_GETMINIMIZEDMETRICS = 0x002b

const SPI_SETMINIMIZEDMETRICS = 0x002c

const SPI_GETICONMETRICS = 0x002d

const SPI_SETICONMETRICS = 0x002e

const SPI_SETWORKAREA = 0x002f

const SPI_GETWORKAREA = 0x0030

const SPI_SETPENWINDOWS = 0x0031

const SPI_GETHIGHCONTRAST = 0x0042

const SPI_SETHIGHCONTRAST = 0x0043

const SPI_GETKEYBOARDPREF = 0x0044

const SPI_SETKEYBOARDPREF = 0x0045

const SPI_GETSCREENREADER = 0x0046

const SPI_SETSCREENREADER = 0x0047

const SPI_GETANIMATION = 0x0048

const SPI_SETANIMATION = 0x0049

const SPI_GETFONTSMOOTHING = 0x004a

const SPI_SETFONTSMOOTHING = 0x004b

const SPI_SETDRAGWIDTH = 0x004c

const SPI_SETDRAGHEIGHT = 0x004d

const SPI_SETHANDHELD = 0x004e

const SPI_GETLOWPOWERTIMEOUT = 0x004f

const SPI_GETPOWEROFFTIMEOUT = 0x0050

const SPI_SETLOWPOWERTIMEOUT = 0x0051

const SPI_SETPOWEROFFTIMEOUT = 0x0052

const SPI_GETLOWPOWERACTIVE = 0x0053

const SPI_GETPOWEROFFACTIVE = 0x0054

const SPI_SETLOWPOWERACTIVE = 0x0055

const SPI_SETPOWEROFFACTIVE = 0x0056

const SPI_SETCURSORS = 0x0057

const SPI_SETICONS = 0x0058

const SPI_GETDEFAULTINPUTLANG = 0x0059

const SPI_SETDEFAULTINPUTLANG = 0x005a

const SPI_SETLANGTOGGLE = 0x005b

const SPI_GETWINDOWSEXTENSION = 0x005c

const SPI_SETMOUSETRAILS = 0x005d

const SPI_GETMOUSETRAILS = 0x005e

const SPI_SETSCREENSAVERRUNNING = 0x0061

const SPI_SCREENSAVERRUNNING = SPI_SETSCREENSAVERRUNNING

const SPI_GETFILTERKEYS = 0x0032

const SPI_SETFILTERKEYS = 0x0033

const SPI_GETTOGGLEKEYS = 0x0034

const SPI_SETTOGGLEKEYS = 0x0035

const SPI_GETMOUSEKEYS = 0x0036

const SPI_SETMOUSEKEYS = 0x0037

const SPI_GETSHOWSOUNDS = 0x0038

const SPI_SETSHOWSOUNDS = 0x0039

const SPI_GETSTICKYKEYS = 0x003a

const SPI_SETSTICKYKEYS = 0x003b

const SPI_GETACCESSTIMEOUT = 0x003c

const SPI_SETACCESSTIMEOUT = 0x003d

const SPI_GETSERIALKEYS = 0x003e

const SPI_SETSERIALKEYS = 0x003f

const SPI_GETSOUNDSENTRY = 0x0040

const SPI_SETSOUNDSENTRY = 0x0041

const SPI_GETSNAPTODEFBUTTON = 0x005f

const SPI_SETSNAPTODEFBUTTON = 0x0060

const SPI_GETMOUSEHOVERWIDTH = 0x0062

const SPI_SETMOUSEHOVERWIDTH = 0x0063

const SPI_GETMOUSEHOVERHEIGHT = 0x0064

const SPI_SETMOUSEHOVERHEIGHT = 0x0065

const SPI_GETMOUSEHOVERTIME = 0x0066

const SPI_SETMOUSEHOVERTIME = 0x0067

const SPI_GETWHEELSCROLLLINES = 0x0068

const SPI_SETWHEELSCROLLLINES = 0x0069

const SPI_GETMENUSHOWDELAY = 0x006a

const SPI_SETMENUSHOWDELAY = 0x006b

const SPI_GETWHEELSCROLLCHARS = 0x006c

const SPI_SETWHEELSCROLLCHARS = 0x006d

const SPI_GETSHOWIMEUI = 0x006e

const SPI_SETSHOWIMEUI = 0x006f

const SPI_GETMOUSESPEED = 0x0070

const SPI_SETMOUSESPEED = 0x0071

const SPI_GETSCREENSAVERRUNNING = 0x0072

const SPI_GETDESKWALLPAPER = 0x0073

const SPI_GETAUDIODESCRIPTION = 0x0074

const SPI_SETAUDIODESCRIPTION = 0x0075

const SPI_GETSCREENSAVESECURE = 0x0076

const SPI_SETSCREENSAVESECURE = 0x0077

const SPI_GETHUNGAPPTIMEOUT = 0x0078

const SPI_SETHUNGAPPTIMEOUT = 0x0079

const SPI_GETWAITTOKILLTIMEOUT = 0x007a

const SPI_SETWAITTOKILLTIMEOUT = 0x007b

const SPI_GETWAITTOKILLSERVICETIMEOUT = 0x007c

const SPI_SETWAITTOKILLSERVICETIMEOUT = 0x007d

const SPI_GETMOUSEDOCKTHRESHOLD = 0x007e

const SPI_SETMOUSEDOCKTHRESHOLD = 0x007f

const SPI_GETPENDOCKTHRESHOLD = 0x0080

const SPI_SETPENDOCKTHRESHOLD = 0x0081

const SPI_GETWINARRANGING = 0x0082

const SPI_SETWINARRANGING = 0x0083

const SPI_GETMOUSEDRAGOUTTHRESHOLD = 0x0084

const SPI_SETMOUSEDRAGOUTTHRESHOLD = 0x0085

const SPI_GETPENDRAGOUTTHRESHOLD = 0x0086

const SPI_SETPENDRAGOUTTHRESHOLD = 0x0087

const SPI_GETMOUSESIDEMOVETHRESHOLD = 0x0088

const SPI_SETMOUSESIDEMOVETHRESHOLD = 0x0089

const SPI_GETPENSIDEMOVETHRESHOLD = 0x008a

const SPI_SETPENSIDEMOVETHRESHOLD = 0x008b

const SPI_GETDRAGFROMMAXIMIZE = 0x008c

const SPI_SETDRAGFROMMAXIMIZE = 0x008d

const SPI_GETSNAPSIZING = 0x008e

const SPI_SETSNAPSIZING = 0x008f

const SPI_GETDOCKMOVING = 0x0090

const SPI_SETDOCKMOVING = 0x0091

const SPI_GETTOUCHPREDICTIONPARAMETERS = 0x009c

const SPI_SETTOUCHPREDICTIONPARAMETERS = 0x009d

const SPI_GETLOGICALDPIOVERRIDE = 0x009e

const SPI_SETLOGICALDPIOVERRIDE = 0x009f

const SPI_GETMENURECT = 0x00a2

const SPI_SETMENURECT = 0x00a3

const SPI_GETACTIVEWINDOWTRACKING = 0x1000

const SPI_SETACTIVEWINDOWTRACKING = 0x1001

const SPI_GETMENUANIMATION = 0x1002

const SPI_SETMENUANIMATION = 0x1003

const SPI_GETCOMBOBOXANIMATION = 0x1004

const SPI_SETCOMBOBOXANIMATION = 0x1005

const SPI_GETLISTBOXSMOOTHSCROLLING = 0x1006

const SPI_SETLISTBOXSMOOTHSCROLLING = 0x1007

const SPI_GETGRADIENTCAPTIONS = 0x1008

const SPI_SETGRADIENTCAPTIONS = 0x1009

const SPI_GETKEYBOARDCUES = 0x100a

const SPI_SETKEYBOARDCUES = 0x100b

const SPI_GETMENUUNDERLINES = SPI_GETKEYBOARDCUES

const SPI_SETMENUUNDERLINES = SPI_SETKEYBOARDCUES

const SPI_GETACTIVEWNDTRKZORDER = 0x100c

const SPI_SETACTIVEWNDTRKZORDER = 0x100d

const SPI_GETHOTTRACKING = 0x100e

const SPI_SETHOTTRACKING = 0x100f

const SPI_GETMENUFADE = 0x1012

const SPI_SETMENUFADE = 0x1013

const SPI_GETSELECTIONFADE = 0x1014

const SPI_SETSELECTIONFADE = 0x1015

const SPI_GETTOOLTIPANIMATION = 0x1016

const SPI_SETTOOLTIPANIMATION = 0x1017

const SPI_GETTOOLTIPFADE = 0x1018

const SPI_SETTOOLTIPFADE = 0x1019

const SPI_GETCURSORSHADOW = 0x101a

const SPI_SETCURSORSHADOW = 0x101b

const SPI_GETMOUSESONAR = 0x101c

const SPI_SETMOUSESONAR = 0x101d

const SPI_GETMOUSECLICKLOCK = 0x101e

const SPI_SETMOUSECLICKLOCK = 0x101f

const SPI_GETMOUSEVANISH = 0x1020

const SPI_SETMOUSEVANISH = 0x1021

const SPI_GETFLATMENU = 0x1022

const SPI_SETFLATMENU = 0x1023

const SPI_GETDROPSHADOW = 0x1024

const SPI_SETDROPSHADOW = 0x1025

const SPI_GETBLOCKSENDINPUTRESETS = 0x1026

const SPI_SETBLOCKSENDINPUTRESETS = 0x1027

const SPI_GETUIEFFECTS = 0x103e

const SPI_SETUIEFFECTS = 0x103f

const SPI_GETDISABLEOVERLAPPEDCONTENT = 0x1040

const SPI_SETDISABLEOVERLAPPEDCONTENT = 0x1041

const SPI_GETCLIENTAREAANIMATION = 0x1042

const SPI_SETCLIENTAREAANIMATION = 0x1043

const SPI_GETCLEARTYPE = 0x1048

const SPI_SETCLEARTYPE = 0x1049

const SPI_GETSPEECHRECOGNITION = 0x104a

const SPI_SETSPEECHRECOGNITION = 0x104b

const SPI_GETCARETBROWSING = 0x104c

const SPI_SETCARETBROWSING = 0x104d

const SPI_GETTHREADLOCALINPUTSETTINGS = 0x104e

const SPI_SETTHREADLOCALINPUTSETTINGS = 0x104f

const SPI_GETSYSTEMLANGUAGEBAR = 0x1050

const SPI_SETSYSTEMLANGUAGEBAR = 0x1051

const SPI_GETFOREGROUNDLOCKTIMEOUT = 0x2000

const SPI_SETFOREGROUNDLOCKTIMEOUT = 0x2001

const SPI_GETACTIVEWNDTRKTIMEOUT = 0x2002

const SPI_SETACTIVEWNDTRKTIMEOUT = 0x2003

const SPI_GETFOREGROUNDFLASHCOUNT = 0x2004

const SPI_SETFOREGROUNDFLASHCOUNT = 0x2005

const SPI_GETCARETWIDTH = 0x2006

const SPI_SETCARETWIDTH = 0x2007

const SPI_GETMOUSECLICKLOCKTIME = 0x2008

const SPI_SETMOUSECLICKLOCKTIME = 0x2009

const SPI_GETFONTSMOOTHINGTYPE = 0x200a

const SPI_SETFONTSMOOTHINGTYPE = 0x200b

const SPI_GETFONTSMOOTHINGCONTRAST = 0x200c

const SPI_SETFONTSMOOTHINGCONTRAST = 0x200d

const SPI_GETFOCUSBORDERWIDTH = 0x200e

const SPI_SETFOCUSBORDERWIDTH = 0x200f

const SPI_GETFOCUSBORDERHEIGHT = 0x2010

const SPI_SETFOCUSBORDERHEIGHT = 0x2011

const SPI_GETFONTSMOOTHINGORIENTATION = 0x2012

const SPI_SETFONTSMOOTHINGORIENTATION = 0x2013

const SPI_GETMINIMUMHITRADIUS = 0x2014

const SPI_SETMINIMUMHITRADIUS = 0x2015

const SPI_GETMESSAGEDURATION = 0x2016

const SPI_SETMESSAGEDURATION = 0x2017

const SPI_GETCONTACTVISUALIZATION = 0x2018

const SPI_SETCONTACTVISUALIZATION = 0x2019

const SPI_GETGESTUREVISUALIZATION = 0x201a

const SPI_SETGESTUREVISUALIZATION = 0x201b

const SPI_GETMOUSEWHEELROUTING = 0x201c

const SPI_SETMOUSEWHEELROUTING = 0x201d

const SPI_GETCARETTIMEOUT = 0x2022

const SPI_SETCARETTIMEOUT = 0x2023

const SPI_GETHANDEDNESS = 0x2024

const SPI_SETHANDEDNESS = 0x2025

const COLOR_SCROLLBAR = 0

const COLOR_BACKGROUND = 1

const COLOR_ACTIVECAPTION = 2

const COLOR_INACTIVECAPTION = 3

const COLOR_MENU = 4

const COLOR_WINDOW = 5

const COLOR_WINDOWFRAME = 6

const COLOR_MENUTEXT = 7

const COLOR_WINDOWTEXT = 8

const COLOR_CAPTIONTEXT = 9

const COLOR_ACTIVEBORDER = 10

const COLOR_INACTIVEBORDER = 11

const COLOR_APPWORKSPACE = 12

const COLOR_HIGHLIGHT = 13

const COLOR_HIGHLIGHTTEXT = 14

const COLOR_BTNFACE = 15

const COLOR_BTNSHADOW = 16

const COLOR_GRAYTEXT = 17

const COLOR_BTNTEXT = 18

const COLOR_INACTIVECAPTIONTEXT = 19

const COLOR_BTNHIGHLIGHT = 20

const COLOR_3DDKSHADOW = 21

const COLOR_3DLIGHT = 22

const COLOR_INFOTEXT = 23

const COLOR_INFOBK = 24

const COLOR_HOTLIGHT = 26

const COLOR_GRADIENTACTIVECAPTION = 27

const COLOR_GRADIENTINACTIVECAPTION = 28

const COLOR_MENUHILIGHT = 29

const COLOR_MENUBAR = 30

const COLOR_DESKTOP = COLOR_BACKGROUND

const COLOR_3DFACE = COLOR_BTNFACE

const COLOR_3DSHADOW = COLOR_BTNSHADOW

const COLOR_3DHIGHLIGHT = COLOR_BTNHIGHLIGHT

const COLOR_3DHILIGHT = COLOR_BTNHIGHLIGHT

const COLOR_BTNHILIGHT = COLOR_BTNHIGHLIGHT

const DWLP_MSGRESULT = 0

# Skipping MacroDefinition: DWLP_DLGPROC DWLP_MSGRESULT + sizeof ( LRESULT )

# Skipping MacroDefinition: DWLP_USER DWLP_DLGPROC + sizeof ( DLGPROC )

const NIF_MESSAGE = 0x00000001

const NIF_ICON = 0x00000002

const NIF_TIP = 0x00000004

const NIF_STATE = 0x00000008

const NIF_INFO = 0x00000010

const NIF_REALTIME = 0x00000040

const NIF_SHOWTIP = 0x00000080

const NIM_ADD = 0x00000000

const NIM_MODIFY = 0x00000001

const NIM_DELETE = 0x00000002

const NIM_SETFOCUS = 0x00000003

const NIM_SETVERSION = 0x00000004

nothing

end # module
