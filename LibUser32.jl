module LibUser32

using CEnum

# 
# Automatically generated file - do not edit
#
const User32 = "user32.dll"
const Kernel32 = "kernel32.dll"
const Gdi32 = "Gdi32.dll"

macro L_str(s) Base.cconvert(Cwstring, s) end

MAKEINTRESOURCEW(i) = LPWSTR(i)




const WORD = Cushort

const WCHAR = Cushort

const LPWSTR = Ptr{WCHAR}

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

const LPCWSTR = Ptr{WCHAR}

const LPCTSTR = LPCWSTR

const LONG = Clong

const CHAR = Cchar

const LPCSTR = Ptr{CHAR}

const INT_PTR = Clonglong

const UINT = Cuint

const UINT_PTR = Culonglong

const UINT8 = Cuchar

const UINT16 = Cushort

const UINT32 = Cuint

const HICON = HANDLE

const HGLOBAL = HANDLE

const HCURSOR = HANDLE

const HBRUSH = HANDLE

const HMENU = HANDLE

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

const ATOM = WORD

const LRESULT = LONG_PTR

# typedef LRESULT ( CALLBACK * WNDPROC
const WNDPROC = Ptr{Cvoid}

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

function RegisterClassW(lpWndClass)
    @ccall User32.RegisterClassW(lpWndClass::Ptr{WNDCLASSW})::ATOM
end

function LoadIconW(hInstance, lpIconName)
    @ccall User32.LoadIconW(hInstance::HINSTANCE, lpIconName::LPCWSTR)::HICON
end

function LoadCursorW(hInstance, lpCursorName)
    @ccall User32.LoadCursorW(hInstance::HINSTANCE, lpCursorName::LPCWSTR)::HCURSOR
end

const WPARAM = UINT_PTR

const LPVOID = Ptr{Cvoid}

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

function GetMessageW(lpMsg, hWnd, wMsgFilterMin, wMsgFilterMax)
    @ccall User32.GetMessageW(lpMsg::LPMSG, hWnd::HWND, wMsgFilterMin::UINT, wMsgFilterMax::UINT)::BOOL
end

function TranslateMessage(lpMsg)
    @ccall User32.TranslateMessage(lpMsg::Ptr{MSG})::BOOL
end

function DispatchMessageW(lpMsg)
    @ccall User32.DispatchMessageW(lpMsg::Ptr{MSG})::LRESULT
end

const HDC = HANDLE

const BYTE = Cuchar

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

function BeginPaint(hWnd, lpPaint)
    @ccall User32.BeginPaint(hWnd::HWND, lpPaint::LPPAINTSTRUCT)::HDC
end

function EndPaint(hWnd, lpPaint)
    @ccall User32.EndPaint(hWnd::HWND, lpPaint::Ptr{PAINTSTRUCT})::BOOL
end

function FillRect(hDC, lprc, hbr)
    @ccall User32.FillRect(hDC::HDC, lprc::Ptr{RECT}, hbr::HBRUSH)::Cint
end

const WINVER = 0x0501

const _WIN32_WINNT = 0x0501

# Skipping MacroDefinition: CALLBACK __attribute__ ( ( stdcall ) )

# Skipping MacroDefinition: WINAPI __attribute__ ( ( stdcall ) )

const wchar_t = Cushort

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

const IDI_WARNING = IDI_EXCLAMATION

const IDI_ERROR = IDI_HAND

const IDI_INFORMATION = IDI_ASTERISK

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

# Win32 helpers



end # module
